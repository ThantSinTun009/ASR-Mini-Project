#!/usr/bin/env bash

export KALDI_ROOT=/home/thant_syn/kaldi

export PATH="$KALDI_ROOT/tools/openfst/bin:$KALDI_ROOT/src/bin:$KALDI_ROOT/src/fstbin:$KALDI_ROOT/src/featbin:$KALDI_ROOT/src/gmmbin:$KALDI_ROOT/src/nnet3bin:$KALDI_ROOT/src/lmbin:$PATH"
export PATH="$KALDI_ROOT/src/latbin:$PATH"

export LC_ALL=C
