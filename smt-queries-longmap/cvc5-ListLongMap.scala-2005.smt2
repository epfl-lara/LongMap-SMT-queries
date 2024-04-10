; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35010 () Bool)

(assert start!35010)

(declare-fun b_free!7699 () Bool)

(declare-fun b_next!7699 () Bool)

(assert (=> start!35010 (= b_free!7699 (not b_next!7699))))

(declare-fun tp!26675 () Bool)

(declare-fun b_and!14929 () Bool)

(assert (=> start!35010 (= tp!26675 b_and!14929)))

(declare-fun b!350777 () Bool)

(declare-fun res!194445 () Bool)

(declare-fun e!214847 () Bool)

(assert (=> b!350777 (=> (not res!194445) (not e!214847))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350777 (= res!194445 (validKeyInArray!0 k!1348))))

(declare-fun b!350778 () Bool)

(declare-fun e!214845 () Bool)

(declare-fun tp_is_empty!7651 () Bool)

(assert (=> b!350778 (= e!214845 tp_is_empty!7651)))

(declare-fun b!350779 () Bool)

(declare-fun res!194442 () Bool)

(assert (=> b!350779 (=> (not res!194442) (not e!214847))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11179 0))(
  ( (V!11180 (val!3870 Int)) )
))
(declare-fun zeroValue!1467 () V!11179)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3482 0))(
  ( (ValueCellFull!3482 (v!6057 V!11179)) (EmptyCell!3482) )
))
(declare-datatypes ((array!18889 0))(
  ( (array!18890 (arr!8950 (Array (_ BitVec 32) ValueCell!3482)) (size!9302 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18889)

(declare-datatypes ((array!18891 0))(
  ( (array!18892 (arr!8951 (Array (_ BitVec 32) (_ BitVec 64))) (size!9303 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18891)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11179)

(declare-datatypes ((tuple2!5584 0))(
  ( (tuple2!5585 (_1!2803 (_ BitVec 64)) (_2!2803 V!11179)) )
))
(declare-datatypes ((List!5206 0))(
  ( (Nil!5203) (Cons!5202 (h!6058 tuple2!5584) (t!10344 List!5206)) )
))
(declare-datatypes ((ListLongMap!4497 0))(
  ( (ListLongMap!4498 (toList!2264 List!5206)) )
))
(declare-fun contains!2333 (ListLongMap!4497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1785 (array!18891 array!18889 (_ BitVec 32) (_ BitVec 32) V!11179 V!11179 (_ BitVec 32) Int) ListLongMap!4497)

(assert (=> b!350779 (= res!194442 (not (contains!2333 (getCurrentListMap!1785 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350780 () Bool)

(declare-fun res!194447 () Bool)

(assert (=> b!350780 (=> (not res!194447) (not e!214847))))

(assert (=> b!350780 (= res!194447 (and (= (size!9302 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9303 _keys!1895) (size!9302 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350781 () Bool)

(declare-fun e!214844 () Bool)

(declare-fun mapRes!12948 () Bool)

(assert (=> b!350781 (= e!214844 (and e!214845 mapRes!12948))))

(declare-fun condMapEmpty!12948 () Bool)

(declare-fun mapDefault!12948 () ValueCell!3482)

