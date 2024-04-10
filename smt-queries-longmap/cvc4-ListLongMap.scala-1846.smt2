; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33448 () Bool)

(assert start!33448)

(declare-fun b!332019 () Bool)

(declare-fun e!203794 () Bool)

(declare-fun tp_is_empty!6701 () Bool)

(assert (=> b!332019 (= e!203794 tp_is_empty!6701)))

(declare-fun mapNonEmpty!11436 () Bool)

(declare-fun mapRes!11436 () Bool)

(declare-fun tp!23811 () Bool)

(declare-fun e!203795 () Bool)

(assert (=> mapNonEmpty!11436 (= mapRes!11436 (and tp!23811 e!203795))))

(declare-fun mapKey!11436 () (_ BitVec 32))

(declare-datatypes ((V!9911 0))(
  ( (V!9912 (val!3395 Int)) )
))
(declare-datatypes ((ValueCell!3007 0))(
  ( (ValueCellFull!3007 (v!5554 V!9911)) (EmptyCell!3007) )
))
(declare-datatypes ((array!17003 0))(
  ( (array!17004 (arr!8036 (Array (_ BitVec 32) ValueCell!3007)) (size!8388 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17003)

(declare-fun mapValue!11436 () ValueCell!3007)

(declare-fun mapRest!11436 () (Array (_ BitVec 32) ValueCell!3007))

(assert (=> mapNonEmpty!11436 (= (arr!8036 _values!1525) (store mapRest!11436 mapKey!11436 mapValue!11436))))

(declare-fun mapIsEmpty!11436 () Bool)

(assert (=> mapIsEmpty!11436 mapRes!11436))

(declare-fun b!332020 () Bool)

(declare-fun e!203792 () Bool)

(assert (=> b!332020 (= e!203792 (and e!203794 mapRes!11436))))

(declare-fun condMapEmpty!11436 () Bool)

(declare-fun mapDefault!11436 () ValueCell!3007)

