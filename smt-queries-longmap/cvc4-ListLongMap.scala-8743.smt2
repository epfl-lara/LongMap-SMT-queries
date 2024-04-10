; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106064 () Bool)

(assert start!106064)

(declare-fun b_free!27497 () Bool)

(declare-fun b_next!27497 () Bool)

(assert (=> start!106064 (= b_free!27497 (not b_next!27497))))

(declare-fun tp!96040 () Bool)

(declare-fun b_and!45471 () Bool)

(assert (=> start!106064 (= tp!96040 b_and!45471)))

(declare-fun b!1263018 () Bool)

(declare-fun res!841360 () Bool)

(declare-fun e!719028 () Bool)

(assert (=> b!1263018 (=> (not res!841360) (not e!719028))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82418 0))(
  ( (array!82419 (arr!39756 (Array (_ BitVec 32) (_ BitVec 64))) (size!40292 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82418)

(declare-datatypes ((V!48563 0))(
  ( (V!48564 (val!16262 Int)) )
))
(declare-datatypes ((ValueCell!15436 0))(
  ( (ValueCellFull!15436 (v!18971 V!48563)) (EmptyCell!15436) )
))
(declare-datatypes ((array!82420 0))(
  ( (array!82421 (arr!39757 (Array (_ BitVec 32) ValueCell!15436)) (size!40293 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82420)

(assert (=> b!1263018 (= res!841360 (and (= (size!40293 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40292 _keys!1118) (size!40293 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263019 () Bool)

(declare-fun res!841359 () Bool)

(assert (=> b!1263019 (=> (not res!841359) (not e!719028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82418 (_ BitVec 32)) Bool)

(assert (=> b!1263019 (= res!841359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50419 () Bool)

(declare-fun mapRes!50419 () Bool)

(declare-fun tp!96041 () Bool)

(declare-fun e!719023 () Bool)

(assert (=> mapNonEmpty!50419 (= mapRes!50419 (and tp!96041 e!719023))))

(declare-fun mapRest!50419 () (Array (_ BitVec 32) ValueCell!15436))

(declare-fun mapValue!50419 () ValueCell!15436)

(declare-fun mapKey!50419 () (_ BitVec 32))

(assert (=> mapNonEmpty!50419 (= (arr!39757 _values!914) (store mapRest!50419 mapKey!50419 mapValue!50419))))

(declare-fun b!1263021 () Bool)

(declare-fun tp_is_empty!32399 () Bool)

(assert (=> b!1263021 (= e!719023 tp_is_empty!32399)))

(declare-fun b!1263022 () Bool)

(declare-fun e!719027 () Bool)

(assert (=> b!1263022 (= e!719028 (not e!719027))))

(declare-fun res!841357 () Bool)

(assert (=> b!1263022 (=> res!841357 e!719027)))

(assert (=> b!1263022 (= res!841357 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21050 0))(
  ( (tuple2!21051 (_1!10536 (_ BitVec 64)) (_2!10536 V!48563)) )
))
(declare-datatypes ((List!28243 0))(
  ( (Nil!28240) (Cons!28239 (h!29448 tuple2!21050) (t!41754 List!28243)) )
))
(declare-datatypes ((ListLongMap!18923 0))(
  ( (ListLongMap!18924 (toList!9477 List!28243)) )
))
(declare-fun lt!572708 () ListLongMap!18923)

(declare-fun lt!572705 () ListLongMap!18923)

(assert (=> b!1263022 (= lt!572708 lt!572705)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48563)

(declare-fun zeroValue!871 () V!48563)

(declare-datatypes ((Unit!42103 0))(
  ( (Unit!42104) )
))
(declare-fun lt!572707 () Unit!42103)

(declare-fun minValueBefore!43 () V!48563)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1184 (array!82418 array!82420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48563 V!48563 V!48563 V!48563 (_ BitVec 32) Int) Unit!42103)

(assert (=> b!1263022 (= lt!572707 (lemmaNoChangeToArrayThenSameMapNoExtras!1184 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5842 (array!82418 array!82420 (_ BitVec 32) (_ BitVec 32) V!48563 V!48563 (_ BitVec 32) Int) ListLongMap!18923)

(assert (=> b!1263022 (= lt!572705 (getCurrentListMapNoExtraKeys!5842 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263022 (= lt!572708 (getCurrentListMapNoExtraKeys!5842 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263023 () Bool)

(assert (=> b!1263023 (= e!719027 true)))

(declare-fun lt!572706 () ListLongMap!18923)

(declare-fun lt!572710 () ListLongMap!18923)

(declare-fun -!2145 (ListLongMap!18923 (_ BitVec 64)) ListLongMap!18923)

(assert (=> b!1263023 (= lt!572706 (-!2145 lt!572710 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!572709 () ListLongMap!18923)

(assert (=> b!1263023 (= (-!2145 lt!572709 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572708)))

(declare-fun lt!572703 () Unit!42103)

(declare-fun addThenRemoveForNewKeyIsSame!380 (ListLongMap!18923 (_ BitVec 64) V!48563) Unit!42103)

(assert (=> b!1263023 (= lt!572703 (addThenRemoveForNewKeyIsSame!380 lt!572708 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!572704 () ListLongMap!18923)

(assert (=> b!1263023 (and (= lt!572710 lt!572709) (= lt!572704 lt!572705))))

(declare-fun +!4251 (ListLongMap!18923 tuple2!21050) ListLongMap!18923)

(assert (=> b!1263023 (= lt!572709 (+!4251 lt!572708 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4644 (array!82418 array!82420 (_ BitVec 32) (_ BitVec 32) V!48563 V!48563 (_ BitVec 32) Int) ListLongMap!18923)

(assert (=> b!1263023 (= lt!572704 (getCurrentListMap!4644 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263023 (= lt!572710 (getCurrentListMap!4644 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263024 () Bool)

(declare-fun e!719026 () Bool)

(declare-fun e!719024 () Bool)

(assert (=> b!1263024 (= e!719026 (and e!719024 mapRes!50419))))

(declare-fun condMapEmpty!50419 () Bool)

(declare-fun mapDefault!50419 () ValueCell!15436)

