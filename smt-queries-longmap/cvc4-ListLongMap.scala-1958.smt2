; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34498 () Bool)

(assert start!34498)

(declare-fun b_free!7421 () Bool)

(declare-fun b_next!7421 () Bool)

(assert (=> start!34498 (= b_free!7421 (not b_next!7421))))

(declare-fun tp!25808 () Bool)

(declare-fun b_and!14629 () Bool)

(assert (=> start!34498 (= tp!25808 b_and!14629)))

(declare-fun mapNonEmpty!12498 () Bool)

(declare-fun mapRes!12498 () Bool)

(declare-fun tp!25809 () Bool)

(declare-fun e!211312 () Bool)

(assert (=> mapNonEmpty!12498 (= mapRes!12498 (and tp!25809 e!211312))))

(declare-fun mapKey!12498 () (_ BitVec 32))

(declare-datatypes ((V!10807 0))(
  ( (V!10808 (val!3731 Int)) )
))
(declare-datatypes ((ValueCell!3343 0))(
  ( (ValueCellFull!3343 (v!5907 V!10807)) (EmptyCell!3343) )
))
(declare-fun mapValue!12498 () ValueCell!3343)

(declare-datatypes ((array!18333 0))(
  ( (array!18334 (arr!8683 (Array (_ BitVec 32) ValueCell!3343)) (size!9035 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18333)

(declare-fun mapRest!12498 () (Array (_ BitVec 32) ValueCell!3343))

(assert (=> mapNonEmpty!12498 (= (arr!8683 _values!1525) (store mapRest!12498 mapKey!12498 mapValue!12498))))

(declare-fun b!344731 () Bool)

(declare-fun e!211313 () Bool)

(declare-fun e!211311 () Bool)

(assert (=> b!344731 (= e!211313 (and e!211311 mapRes!12498))))

(declare-fun condMapEmpty!12498 () Bool)

(declare-fun mapDefault!12498 () ValueCell!3343)

