; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106094 () Bool)

(assert start!106094)

(declare-fun b_free!27509 () Bool)

(declare-fun b_next!27509 () Bool)

(assert (=> start!106094 (= b_free!27509 (not b_next!27509))))

(declare-fun tp!96079 () Bool)

(declare-fun b_and!45493 () Bool)

(assert (=> start!106094 (= tp!96079 b_and!45493)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48579 0))(
  ( (V!48580 (val!16268 Int)) )
))
(declare-fun minValueAfter!43 () V!48579)

(declare-datatypes ((tuple2!21062 0))(
  ( (tuple2!21063 (_1!10542 (_ BitVec 64)) (_2!10542 V!48579)) )
))
(declare-datatypes ((List!28253 0))(
  ( (Nil!28250) (Cons!28249 (h!29458 tuple2!21062) (t!41766 List!28253)) )
))
(declare-datatypes ((ListLongMap!18935 0))(
  ( (ListLongMap!18936 (toList!9483 List!28253)) )
))
(declare-fun lt!572909 () ListLongMap!18935)

(declare-fun zeroValue!871 () V!48579)

(declare-datatypes ((ValueCell!15442 0))(
  ( (ValueCellFull!15442 (v!18978 V!48579)) (EmptyCell!15442) )
))
(declare-datatypes ((array!82444 0))(
  ( (array!82445 (arr!39768 (Array (_ BitVec 32) ValueCell!15442)) (size!40304 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82444)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun b!1263327 () Bool)

(declare-fun e!719243 () Bool)

(declare-datatypes ((array!82446 0))(
  ( (array!82447 (arr!39769 (Array (_ BitVec 32) (_ BitVec 64))) (size!40305 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82446)

(declare-fun getCurrentListMap!4650 (array!82446 array!82444 (_ BitVec 32) (_ BitVec 32) V!48579 V!48579 (_ BitVec 32) Int) ListLongMap!18935)

(assert (=> b!1263327 (= e!719243 (= lt!572909 (getCurrentListMap!4650 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(declare-fun lt!572904 () ListLongMap!18935)

(assert (=> b!1263327 (= lt!572909 lt!572904)))

(declare-fun -!2148 (ListLongMap!18935 (_ BitVec 64)) ListLongMap!18935)

(assert (=> b!1263327 (= lt!572909 (-!2148 lt!572904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!42113 0))(
  ( (Unit!42114) )
))
(declare-fun lt!572908 () Unit!42113)

(declare-fun removeNotPresentStillSame!153 (ListLongMap!18935 (_ BitVec 64)) Unit!42113)

(assert (=> b!1263327 (= lt!572908 (removeNotPresentStillSame!153 lt!572904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!50440 () Bool)

(declare-fun mapRes!50440 () Bool)

(assert (=> mapIsEmpty!50440 mapRes!50440))

(declare-fun res!841520 () Bool)

(declare-fun e!719244 () Bool)

(assert (=> start!106094 (=> (not res!841520) (not e!719244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106094 (= res!841520 (validMask!0 mask!1466))))

(assert (=> start!106094 e!719244))

(assert (=> start!106094 true))

(assert (=> start!106094 tp!96079))

(declare-fun tp_is_empty!32411 () Bool)

(assert (=> start!106094 tp_is_empty!32411))

(declare-fun array_inv!30267 (array!82446) Bool)

(assert (=> start!106094 (array_inv!30267 _keys!1118)))

(declare-fun e!719241 () Bool)

(declare-fun array_inv!30268 (array!82444) Bool)

(assert (=> start!106094 (and (array_inv!30268 _values!914) e!719241)))

(declare-fun b!1263328 () Bool)

(declare-fun res!841519 () Bool)

(assert (=> b!1263328 (=> (not res!841519) (not e!719244))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263328 (= res!841519 (and (= (size!40304 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40305 _keys!1118) (size!40304 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263329 () Bool)

(declare-fun e!719245 () Bool)

(assert (=> b!1263329 (= e!719245 e!719243)))

(declare-fun res!841515 () Bool)

(assert (=> b!1263329 (=> res!841515 e!719243)))

(declare-fun contains!7604 (ListLongMap!18935 (_ BitVec 64)) Bool)

(assert (=> b!1263329 (= res!841515 (contains!7604 lt!572904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValueBefore!43 () V!48579)

(assert (=> b!1263329 (= lt!572904 (getCurrentListMap!4650 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50440 () Bool)

(declare-fun tp!96080 () Bool)

(declare-fun e!719242 () Bool)

(assert (=> mapNonEmpty!50440 (= mapRes!50440 (and tp!96080 e!719242))))

(declare-fun mapKey!50440 () (_ BitVec 32))

(declare-fun mapValue!50440 () ValueCell!15442)

(declare-fun mapRest!50440 () (Array (_ BitVec 32) ValueCell!15442))

(assert (=> mapNonEmpty!50440 (= (arr!39768 _values!914) (store mapRest!50440 mapKey!50440 mapValue!50440))))

(declare-fun b!1263330 () Bool)

(declare-fun e!719240 () Bool)

(assert (=> b!1263330 (= e!719240 tp_is_empty!32411)))

(declare-fun b!1263331 () Bool)

(declare-fun res!841516 () Bool)

(assert (=> b!1263331 (=> (not res!841516) (not e!719244))))

(declare-datatypes ((List!28254 0))(
  ( (Nil!28251) (Cons!28250 (h!29459 (_ BitVec 64)) (t!41767 List!28254)) )
))
(declare-fun arrayNoDuplicates!0 (array!82446 (_ BitVec 32) List!28254) Bool)

(assert (=> b!1263331 (= res!841516 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28251))))

(declare-fun b!1263332 () Bool)

(assert (=> b!1263332 (= e!719244 (not e!719245))))

(declare-fun res!841518 () Bool)

(assert (=> b!1263332 (=> res!841518 e!719245)))

(assert (=> b!1263332 (= res!841518 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!572905 () ListLongMap!18935)

(declare-fun lt!572906 () ListLongMap!18935)

(assert (=> b!1263332 (= lt!572905 lt!572906)))

(declare-fun lt!572907 () Unit!42113)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1188 (array!82446 array!82444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48579 V!48579 V!48579 V!48579 (_ BitVec 32) Int) Unit!42113)

(assert (=> b!1263332 (= lt!572907 (lemmaNoChangeToArrayThenSameMapNoExtras!1188 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5846 (array!82446 array!82444 (_ BitVec 32) (_ BitVec 32) V!48579 V!48579 (_ BitVec 32) Int) ListLongMap!18935)

(assert (=> b!1263332 (= lt!572906 (getCurrentListMapNoExtraKeys!5846 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263332 (= lt!572905 (getCurrentListMapNoExtraKeys!5846 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263333 () Bool)

(assert (=> b!1263333 (= e!719242 tp_is_empty!32411)))

(declare-fun b!1263334 () Bool)

(assert (=> b!1263334 (= e!719241 (and e!719240 mapRes!50440))))

(declare-fun condMapEmpty!50440 () Bool)

(declare-fun mapDefault!50440 () ValueCell!15442)

