; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34322 () Bool)

(assert start!34322)

(declare-fun b_free!7297 () Bool)

(declare-fun b_next!7297 () Bool)

(assert (=> start!34322 (= b_free!7297 (not b_next!7297))))

(declare-fun tp!25431 () Bool)

(declare-fun b_and!14501 () Bool)

(assert (=> start!34322 (= tp!25431 b_and!14501)))

(declare-fun b!342587 () Bool)

(declare-datatypes ((Unit!10674 0))(
  ( (Unit!10675) )
))
(declare-fun e!210079 () Unit!10674)

(declare-fun Unit!10676 () Unit!10674)

(assert (=> b!342587 (= e!210079 Unit!10676)))

(declare-fun b!342588 () Bool)

(declare-fun res!189378 () Bool)

(declare-fun e!210078 () Bool)

(assert (=> b!342588 (=> (not res!189378) (not e!210078))))

(declare-datatypes ((array!18091 0))(
  ( (array!18092 (arr!8564 (Array (_ BitVec 32) (_ BitVec 64))) (size!8916 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18091)

(declare-datatypes ((List!4936 0))(
  ( (Nil!4933) (Cons!4932 (h!5788 (_ BitVec 64)) (t!10048 List!4936)) )
))
(declare-fun arrayNoDuplicates!0 (array!18091 (_ BitVec 32) List!4936) Bool)

(assert (=> b!342588 (= res!189378 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4933))))

(declare-fun b!342589 () Bool)

(declare-fun e!210083 () Bool)

(declare-fun e!210082 () Bool)

(declare-fun mapRes!12306 () Bool)

(assert (=> b!342589 (= e!210083 (and e!210082 mapRes!12306))))

(declare-fun condMapEmpty!12306 () Bool)

(declare-datatypes ((V!10643 0))(
  ( (V!10644 (val!3669 Int)) )
))
(declare-datatypes ((ValueCell!3281 0))(
  ( (ValueCellFull!3281 (v!5843 V!10643)) (EmptyCell!3281) )
))
(declare-datatypes ((array!18093 0))(
  ( (array!18094 (arr!8565 (Array (_ BitVec 32) ValueCell!3281)) (size!8917 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18093)

(declare-fun mapDefault!12306 () ValueCell!3281)

