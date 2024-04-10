; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71158 () Bool)

(assert start!71158)

(declare-fun b_free!13325 () Bool)

(declare-fun b_next!13325 () Bool)

(assert (=> start!71158 (= b_free!13325 (not b_next!13325))))

(declare-fun tp!46735 () Bool)

(declare-fun b_and!22251 () Bool)

(assert (=> start!71158 (= tp!46735 b_and!22251)))

(declare-fun b!826544 () Bool)

(declare-fun e!460285 () Bool)

(declare-fun tp_is_empty!15035 () Bool)

(assert (=> b!826544 (= e!460285 tp_is_empty!15035)))

(declare-fun b!826545 () Bool)

(declare-fun e!460284 () Bool)

(assert (=> b!826545 (= e!460284 true)))

(declare-datatypes ((V!25047 0))(
  ( (V!25048 (val!7565 Int)) )
))
(declare-datatypes ((tuple2!10022 0))(
  ( (tuple2!10023 (_1!5022 (_ BitVec 64)) (_2!5022 V!25047)) )
))
(declare-fun lt!374118 () tuple2!10022)

(declare-datatypes ((List!15821 0))(
  ( (Nil!15818) (Cons!15817 (h!16946 tuple2!10022) (t!22168 List!15821)) )
))
(declare-datatypes ((ListLongMap!8845 0))(
  ( (ListLongMap!8846 (toList!4438 List!15821)) )
))
(declare-fun lt!374122 () ListLongMap!8845)

(declare-fun lt!374109 () ListLongMap!8845)

(declare-fun lt!374116 () tuple2!10022)

(declare-fun +!1945 (ListLongMap!8845 tuple2!10022) ListLongMap!8845)

(assert (=> b!826545 (= lt!374122 (+!1945 (+!1945 lt!374109 lt!374116) lt!374118))))

(declare-fun lt!374111 () ListLongMap!8845)

(declare-fun lt!374114 () ListLongMap!8845)

(declare-fun lt!374112 () ListLongMap!8845)

(assert (=> b!826545 (and (= lt!374111 lt!374114) (= lt!374112 lt!374114) (= lt!374112 lt!374111))))

(declare-fun lt!374117 () ListLongMap!8845)

(assert (=> b!826545 (= lt!374114 (+!1945 lt!374117 lt!374116))))

(declare-fun lt!374110 () ListLongMap!8845)

(assert (=> b!826545 (= lt!374111 (+!1945 lt!374110 lt!374116))))

(declare-fun zeroValueBefore!34 () V!25047)

(declare-datatypes ((Unit!28339 0))(
  ( (Unit!28340) )
))
(declare-fun lt!374121 () Unit!28339)

(declare-fun zeroValueAfter!34 () V!25047)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!228 (ListLongMap!8845 (_ BitVec 64) V!25047 V!25047) Unit!28339)

(assert (=> b!826545 (= lt!374121 (addSameAsAddTwiceSameKeyDiffValues!228 lt!374110 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460290 () Bool)

(assert (=> b!826545 e!460290))

(declare-fun res!563434 () Bool)

(assert (=> b!826545 (=> (not res!563434) (not e!460290))))

(declare-fun lt!374120 () ListLongMap!8845)

(assert (=> b!826545 (= res!563434 (= lt!374120 lt!374117))))

(declare-fun lt!374113 () tuple2!10022)

(assert (=> b!826545 (= lt!374117 (+!1945 lt!374110 lt!374113))))

(assert (=> b!826545 (= lt!374110 (+!1945 lt!374109 lt!374118))))

(assert (=> b!826545 (= lt!374116 (tuple2!10023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460286 () Bool)

(assert (=> b!826545 e!460286))

(declare-fun res!563431 () Bool)

(assert (=> b!826545 (=> (not res!563431) (not e!460286))))

(assert (=> b!826545 (= res!563431 (= lt!374120 (+!1945 (+!1945 lt!374109 lt!374113) lt!374118)))))

(declare-fun minValue!754 () V!25047)

(assert (=> b!826545 (= lt!374118 (tuple2!10023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826545 (= lt!374113 (tuple2!10023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46250 0))(
  ( (array!46251 (arr!22170 (Array (_ BitVec 32) (_ BitVec 64))) (size!22591 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46250)

(declare-datatypes ((ValueCell!7102 0))(
  ( (ValueCellFull!7102 (v!9999 V!25047)) (EmptyCell!7102) )
))
(declare-datatypes ((array!46252 0))(
  ( (array!46253 (arr!22171 (Array (_ BitVec 32) ValueCell!7102)) (size!22592 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46252)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2568 (array!46250 array!46252 (_ BitVec 32) (_ BitVec 32) V!25047 V!25047 (_ BitVec 32) Int) ListLongMap!8845)

(assert (=> b!826545 (= lt!374112 (getCurrentListMap!2568 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826545 (= lt!374120 (getCurrentListMap!2568 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826546 () Bool)

(declare-fun e!460288 () Bool)

(declare-fun mapRes!24178 () Bool)

(assert (=> b!826546 (= e!460288 (and e!460285 mapRes!24178))))

(declare-fun condMapEmpty!24178 () Bool)

(declare-fun mapDefault!24178 () ValueCell!7102)

