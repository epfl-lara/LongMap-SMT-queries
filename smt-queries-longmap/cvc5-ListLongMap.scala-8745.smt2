; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106090 () Bool)

(assert start!106090)

(declare-fun b_free!27505 () Bool)

(declare-fun b_next!27505 () Bool)

(assert (=> start!106090 (= b_free!27505 (not b_next!27505))))

(declare-fun tp!96067 () Bool)

(declare-fun b_and!45489 () Bool)

(assert (=> start!106090 (= tp!96067 b_and!45489)))

(declare-fun mapIsEmpty!50434 () Bool)

(declare-fun mapRes!50434 () Bool)

(assert (=> mapIsEmpty!50434 mapRes!50434))

(declare-fun b!1263273 () Bool)

(declare-fun e!719202 () Bool)

(declare-fun e!719201 () Bool)

(assert (=> b!1263273 (= e!719202 e!719201)))

(declare-fun res!841479 () Bool)

(assert (=> b!1263273 (=> res!841479 e!719201)))

(declare-datatypes ((V!48575 0))(
  ( (V!48576 (val!16266 Int)) )
))
(declare-datatypes ((tuple2!21058 0))(
  ( (tuple2!21059 (_1!10540 (_ BitVec 64)) (_2!10540 V!48575)) )
))
(declare-datatypes ((List!28249 0))(
  ( (Nil!28246) (Cons!28245 (h!29454 tuple2!21058) (t!41762 List!28249)) )
))
(declare-datatypes ((ListLongMap!18931 0))(
  ( (ListLongMap!18932 (toList!9481 List!28249)) )
))
(declare-fun lt!572871 () ListLongMap!18931)

(declare-fun contains!7602 (ListLongMap!18931 (_ BitVec 64)) Bool)

(assert (=> b!1263273 (= res!841479 (contains!7602 lt!572871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48575)

(declare-datatypes ((array!82436 0))(
  ( (array!82437 (arr!39764 (Array (_ BitVec 32) (_ BitVec 64))) (size!40300 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82436)

(declare-datatypes ((ValueCell!15440 0))(
  ( (ValueCellFull!15440 (v!18976 V!48575)) (EmptyCell!15440) )
))
(declare-datatypes ((array!82438 0))(
  ( (array!82439 (arr!39765 (Array (_ BitVec 32) ValueCell!15440)) (size!40301 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82438)

(declare-fun minValueBefore!43 () V!48575)

(declare-fun getCurrentListMap!4648 (array!82436 array!82438 (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 (_ BitVec 32) Int) ListLongMap!18931)

(assert (=> b!1263273 (= lt!572871 (getCurrentListMap!4648 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841481 () Bool)

(declare-fun e!719197 () Bool)

(assert (=> start!106090 (=> (not res!841481) (not e!719197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106090 (= res!841481 (validMask!0 mask!1466))))

(assert (=> start!106090 e!719197))

(assert (=> start!106090 true))

(assert (=> start!106090 tp!96067))

(declare-fun tp_is_empty!32407 () Bool)

(assert (=> start!106090 tp_is_empty!32407))

(declare-fun array_inv!30263 (array!82436) Bool)

(assert (=> start!106090 (array_inv!30263 _keys!1118)))

(declare-fun e!719199 () Bool)

(declare-fun array_inv!30264 (array!82438) Bool)

(assert (=> start!106090 (and (array_inv!30264 _values!914) e!719199)))

(declare-fun b!1263274 () Bool)

(declare-fun res!841480 () Bool)

(assert (=> b!1263274 (=> (not res!841480) (not e!719197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82436 (_ BitVec 32)) Bool)

(assert (=> b!1263274 (= res!841480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263275 () Bool)

(declare-fun res!841484 () Bool)

(assert (=> b!1263275 (=> (not res!841484) (not e!719197))))

(declare-datatypes ((List!28250 0))(
  ( (Nil!28247) (Cons!28246 (h!29455 (_ BitVec 64)) (t!41763 List!28250)) )
))
(declare-fun arrayNoDuplicates!0 (array!82436 (_ BitVec 32) List!28250) Bool)

(assert (=> b!1263275 (= res!841484 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28247))))

(declare-fun b!1263276 () Bool)

(declare-fun e!719198 () Bool)

(assert (=> b!1263276 (= e!719198 tp_is_empty!32407)))

(declare-fun b!1263277 () Bool)

(declare-fun res!841483 () Bool)

(assert (=> b!1263277 (=> (not res!841483) (not e!719197))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1263277 (= res!841483 (and (= (size!40301 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40300 _keys!1118) (size!40301 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50434 () Bool)

(declare-fun tp!96068 () Bool)

(declare-fun e!719203 () Bool)

(assert (=> mapNonEmpty!50434 (= mapRes!50434 (and tp!96068 e!719203))))

(declare-fun mapValue!50434 () ValueCell!15440)

(declare-fun mapRest!50434 () (Array (_ BitVec 32) ValueCell!15440))

(declare-fun mapKey!50434 () (_ BitVec 32))

(assert (=> mapNonEmpty!50434 (= (arr!39765 _values!914) (store mapRest!50434 mapKey!50434 mapValue!50434))))

(declare-fun b!1263278 () Bool)

(assert (=> b!1263278 (= e!719203 tp_is_empty!32407)))

(declare-fun b!1263279 () Bool)

(assert (=> b!1263279 (= e!719197 (not e!719202))))

(declare-fun res!841482 () Bool)

(assert (=> b!1263279 (=> res!841482 e!719202)))

(assert (=> b!1263279 (= res!841482 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!572868 () ListLongMap!18931)

(declare-fun lt!572873 () ListLongMap!18931)

(assert (=> b!1263279 (= lt!572868 lt!572873)))

(declare-fun minValueAfter!43 () V!48575)

(declare-datatypes ((Unit!42109 0))(
  ( (Unit!42110) )
))
(declare-fun lt!572869 () Unit!42109)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1186 (array!82436 array!82438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 V!48575 V!48575 (_ BitVec 32) Int) Unit!42109)

(assert (=> b!1263279 (= lt!572869 (lemmaNoChangeToArrayThenSameMapNoExtras!1186 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5844 (array!82436 array!82438 (_ BitVec 32) (_ BitVec 32) V!48575 V!48575 (_ BitVec 32) Int) ListLongMap!18931)

(assert (=> b!1263279 (= lt!572873 (getCurrentListMapNoExtraKeys!5844 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263279 (= lt!572868 (getCurrentListMapNoExtraKeys!5844 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263280 () Bool)

(declare-fun lt!572872 () ListLongMap!18931)

(assert (=> b!1263280 (= e!719201 (= lt!572872 (getCurrentListMap!4648 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(assert (=> b!1263280 (= lt!572872 lt!572871)))

(declare-fun -!2146 (ListLongMap!18931 (_ BitVec 64)) ListLongMap!18931)

(assert (=> b!1263280 (= lt!572872 (-!2146 lt!572871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!572870 () Unit!42109)

(declare-fun removeNotPresentStillSame!151 (ListLongMap!18931 (_ BitVec 64)) Unit!42109)

(assert (=> b!1263280 (= lt!572870 (removeNotPresentStillSame!151 lt!572871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263281 () Bool)

(assert (=> b!1263281 (= e!719199 (and e!719198 mapRes!50434))))

(declare-fun condMapEmpty!50434 () Bool)

(declare-fun mapDefault!50434 () ValueCell!15440)

