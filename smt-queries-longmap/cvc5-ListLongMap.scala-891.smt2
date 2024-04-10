; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20442 () Bool)

(assert start!20442)

(declare-fun b_free!5101 () Bool)

(declare-fun b_next!5101 () Bool)

(assert (=> start!20442 (= b_free!5101 (not b_next!5101))))

(declare-fun tp!18334 () Bool)

(declare-fun b_and!11847 () Bool)

(assert (=> start!20442 (= tp!18334 b_and!11847)))

(declare-fun b!202455 () Bool)

(declare-fun e!132612 () Bool)

(declare-fun e!132608 () Bool)

(assert (=> b!202455 (= e!132612 e!132608)))

(declare-fun res!97023 () Bool)

(assert (=> b!202455 (=> res!97023 e!132608)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!202455 (= res!97023 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6257 0))(
  ( (V!6258 (val!2523 Int)) )
))
(declare-datatypes ((tuple2!3826 0))(
  ( (tuple2!3827 (_1!1924 (_ BitVec 64)) (_2!1924 V!6257)) )
))
(declare-datatypes ((List!2731 0))(
  ( (Nil!2728) (Cons!2727 (h!3369 tuple2!3826) (t!7662 List!2731)) )
))
(declare-datatypes ((ListLongMap!2739 0))(
  ( (ListLongMap!2740 (toList!1385 List!2731)) )
))
(declare-fun lt!101638 () ListLongMap!2739)

(declare-fun lt!101636 () ListLongMap!2739)

(assert (=> b!202455 (= lt!101638 lt!101636)))

(declare-fun lt!101635 () ListLongMap!2739)

(declare-fun lt!101633 () tuple2!3826)

(declare-fun +!412 (ListLongMap!2739 tuple2!3826) ListLongMap!2739)

(assert (=> b!202455 (= lt!101636 (+!412 lt!101635 lt!101633))))

(declare-fun lt!101632 () ListLongMap!2739)

(declare-fun lt!101634 () ListLongMap!2739)

(assert (=> b!202455 (= lt!101632 lt!101634)))

(declare-fun lt!101642 () ListLongMap!2739)

(assert (=> b!202455 (= lt!101634 (+!412 lt!101642 lt!101633))))

(declare-fun lt!101639 () ListLongMap!2739)

(assert (=> b!202455 (= lt!101638 (+!412 lt!101639 lt!101633))))

(declare-fun zeroValue!615 () V!6257)

(assert (=> b!202455 (= lt!101633 (tuple2!3827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202456 () Bool)

(declare-fun res!97022 () Bool)

(declare-fun e!132614 () Bool)

(assert (=> b!202456 (=> (not res!97022) (not e!132614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202456 (= res!97022 (validKeyInArray!0 k!843))))

(declare-fun b!202457 () Bool)

(assert (=> b!202457 (= e!132614 (not e!132612))))

(declare-fun res!97019 () Bool)

(assert (=> b!202457 (=> res!97019 e!132612)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202457 (= res!97019 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2135 0))(
  ( (ValueCellFull!2135 (v!4493 V!6257)) (EmptyCell!2135) )
))
(declare-datatypes ((array!9139 0))(
  ( (array!9140 (arr!4320 (Array (_ BitVec 32) ValueCell!2135)) (size!4645 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9139)

(declare-datatypes ((array!9141 0))(
  ( (array!9142 (arr!4321 (Array (_ BitVec 32) (_ BitVec 64))) (size!4646 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9141)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6257)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun getCurrentListMap!966 (array!9141 array!9139 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) Int) ListLongMap!2739)

(assert (=> b!202457 (= lt!101632 (getCurrentListMap!966 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101643 () array!9139)

(assert (=> b!202457 (= lt!101638 (getCurrentListMap!966 _keys!825 lt!101643 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202457 (and (= lt!101639 lt!101635) (= lt!101635 lt!101639))))

(declare-fun lt!101641 () tuple2!3826)

(assert (=> b!202457 (= lt!101635 (+!412 lt!101642 lt!101641))))

(declare-fun v!520 () V!6257)

(assert (=> b!202457 (= lt!101641 (tuple2!3827 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6120 0))(
  ( (Unit!6121) )
))
(declare-fun lt!101637 () Unit!6120)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!79 (array!9141 array!9139 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) (_ BitVec 64) V!6257 (_ BitVec 32) Int) Unit!6120)

(assert (=> b!202457 (= lt!101637 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!79 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!340 (array!9141 array!9139 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) Int) ListLongMap!2739)

(assert (=> b!202457 (= lt!101639 (getCurrentListMapNoExtraKeys!340 _keys!825 lt!101643 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202457 (= lt!101643 (array!9140 (store (arr!4320 _values!649) i!601 (ValueCellFull!2135 v!520)) (size!4645 _values!649)))))

(assert (=> b!202457 (= lt!101642 (getCurrentListMapNoExtraKeys!340 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202458 () Bool)

(declare-fun e!132611 () Bool)

(declare-fun tp_is_empty!4957 () Bool)

(assert (=> b!202458 (= e!132611 tp_is_empty!4957)))

(declare-fun b!202459 () Bool)

(declare-fun e!132610 () Bool)

(declare-fun mapRes!8504 () Bool)

(assert (=> b!202459 (= e!132610 (and e!132611 mapRes!8504))))

(declare-fun condMapEmpty!8504 () Bool)

(declare-fun mapDefault!8504 () ValueCell!2135)

