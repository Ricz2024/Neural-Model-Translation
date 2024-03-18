if [ "$1" = "train" ]; then
    "Python/Python310/python.exe" run.py train --train-src=./zh_en_data/train.zh --train-tgt=./zh_en_data/train.en --dev-src=./zh_en_data/dev.zh --dev-tgt=./zh_en_data/dev.en --vocab=./zh_en_data/vocab_zh_en.json --cuda --lr=5e-4 --patience=1 --valid-niter=1000 --batch-size=32 --dropout=.25
elif [ "$1" = "test" ]; then
    if [ "$2" = "" ]; then
        "Python/Python310/python.exe" run.py decode model.bin ./zh_en_data/test.zh ./zh_en_data/test.en outputs/test_outputs.txt --cuda
    else
        "Python/Python310/python.exe" run.py decode $2 ./zh_en_data/test.zh ./zh_en_data/test.en outputs/test_outputs.txt --cuda
    fi
elif [ "$1" = "train_local" ]; then
    "Python/Python310/python.exe" run.py train --train-src=./zh_en_data/train.zh --train-tgt=./zh_en_data/train.en --dev-src=./zh_en_data/dev.zh --dev-tgt=./zh_en_data/dev.en --vocab=./zh_en_data/vocab_zh_en.json --lr=5e-4
elif [ "$1" = "test_local" ]; then
    "Python/Python310/python.exe" run.py decode model.bin ./zh_en_data/test.zh ./zh_en_data/test.en outputs/test_outputs.txt
elif [ "$1" = "vocab" ]; then
    "Python/Python310/python.exe" vocab.py --train-src=./zh_en_data/train.zh --train-tgt=./zh_en_data/train.en ./zh_en_data/vocab_zh_en.json
else
    echo "Invalid Option Selected"
fi
