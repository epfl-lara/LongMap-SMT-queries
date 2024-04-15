; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106056 () Bool)

(assert start!106056)

(declare-fun b_free!27493 () Bool)

(declare-fun b_next!27493 () Bool)

(assert (=> start!106056 (= b_free!27493 (not b_next!27493))))

(declare-fun tp!96028 () Bool)

(declare-fun b_and!45449 () Bool)

(assert (=> start!106056 (= tp!96028 b_and!45449)))

(declare-fun b!1262888 () Bool)

(declare-fun res!841289 () Bool)

(declare-fun e!718945 () Bool)

(assert (=> b!1262888 (=> (not res!841289) (not e!718945))))

(declare-datatypes ((array!82333 0))(
  ( (array!82334 (arr!39714 (Array (_ BitVec 32) (_ BitVec 64))) (size!40252 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82333)

(declare-datatypes ((List!28327 0))(
  ( (Nil!28324) (Cons!28323 (h!29532 (_ BitVec 64)) (t!41829 List!28327)) )
))
(declare-fun arrayNoDuplicates!0 (array!82333 (_ BitVec 32) List!28327) Bool)

(assert (=> b!1262888 (= res!841289 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28324))))

(declare-fun b!1262889 () Bool)

(declare-fun e!718947 () Bool)

(assert (=> b!1262889 (= e!718945 (not e!718947))))

(declare-fun res!841286 () Bool)

(assert (=> b!1262889 (=> res!841286 e!718947)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262889 (= res!841286 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48559 0))(
  ( (V!48560 (val!16260 Int)) )
))
(declare-datatypes ((tuple2!21126 0))(
  ( (tuple2!21127 (_1!10574 (_ BitVec 64)) (_2!10574 V!48559)) )
))
(declare-datatypes ((List!28328 0))(
  ( (Nil!28325) (Cons!28324 (h!29533 tuple2!21126) (t!41830 List!28328)) )
))
(declare-datatypes ((ListLongMap!18999 0))(
  ( (ListLongMap!19000 (toList!9515 List!28328)) )
))
(declare-fun lt!572478 () ListLongMap!18999)

(declare-fun lt!572481 () ListLongMap!18999)

(assert (=> b!1262889 (= lt!572478 lt!572481)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48559)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48559)

(declare-datatypes ((ValueCell!15434 0))(
  ( (ValueCellFull!15434 (v!18968 V!48559)) (EmptyCell!15434) )
))
(declare-datatypes ((array!82335 0))(
  ( (array!82336 (arr!39715 (Array (_ BitVec 32) ValueCell!15434)) (size!40253 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82335)

(declare-datatypes ((Unit!41944 0))(
  ( (Unit!41945) )
))
(declare-fun lt!572477 () Unit!41944)

(declare-fun minValueBefore!43 () V!48559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1182 (array!82333 array!82335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 V!48559 V!48559 (_ BitVec 32) Int) Unit!41944)

(assert (=> b!1262889 (= lt!572477 (lemmaNoChangeToArrayThenSameMapNoExtras!1182 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5882 (array!82333 array!82335 (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 (_ BitVec 32) Int) ListLongMap!18999)

(assert (=> b!1262889 (= lt!572481 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262889 (= lt!572478 (getCurrentListMapNoExtraKeys!5882 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262890 () Bool)

(declare-fun res!841288 () Bool)

(assert (=> b!1262890 (=> (not res!841288) (not e!718945))))

(assert (=> b!1262890 (= res!841288 (and (= (size!40253 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40252 _keys!1118) (size!40253 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262891 () Bool)

(declare-fun res!841287 () Bool)

(assert (=> b!1262891 (=> (not res!841287) (not e!718945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82333 (_ BitVec 32)) Bool)

(assert (=> b!1262891 (= res!841287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50413 () Bool)

(declare-fun mapRes!50413 () Bool)

(assert (=> mapIsEmpty!50413 mapRes!50413))

(declare-fun mapNonEmpty!50413 () Bool)

(declare-fun tp!96029 () Bool)

(declare-fun e!718946 () Bool)

(assert (=> mapNonEmpty!50413 (= mapRes!50413 (and tp!96029 e!718946))))

(declare-fun mapKey!50413 () (_ BitVec 32))

(declare-fun mapRest!50413 () (Array (_ BitVec 32) ValueCell!15434))

(declare-fun mapValue!50413 () ValueCell!15434)

(assert (=> mapNonEmpty!50413 (= (arr!39715 _values!914) (store mapRest!50413 mapKey!50413 mapValue!50413))))

(declare-fun res!841290 () Bool)

(assert (=> start!106056 (=> (not res!841290) (not e!718945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106056 (= res!841290 (validMask!0 mask!1466))))

(assert (=> start!106056 e!718945))

(assert (=> start!106056 true))

(assert (=> start!106056 tp!96028))

(declare-fun tp_is_empty!32395 () Bool)

(assert (=> start!106056 tp_is_empty!32395))

(declare-fun array_inv!30381 (array!82333) Bool)

(assert (=> start!106056 (array_inv!30381 _keys!1118)))

(declare-fun e!718943 () Bool)

(declare-fun array_inv!30382 (array!82335) Bool)

(assert (=> start!106056 (and (array_inv!30382 _values!914) e!718943)))

(declare-fun b!1262892 () Bool)

(assert (=> b!1262892 (= e!718947 true)))

(declare-fun lt!572476 () ListLongMap!18999)

(declare-fun lt!572479 () ListLongMap!18999)

(declare-fun -!2096 (ListLongMap!18999 (_ BitVec 64)) ListLongMap!18999)

(assert (=> b!1262892 (= lt!572476 (-!2096 lt!572479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!572483 () ListLongMap!18999)

(assert (=> b!1262892 (= (-!2096 lt!572483 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572478)))

(declare-fun lt!572480 () Unit!41944)

(declare-fun addThenRemoveForNewKeyIsSame!351 (ListLongMap!18999 (_ BitVec 64) V!48559) Unit!41944)

(assert (=> b!1262892 (= lt!572480 (addThenRemoveForNewKeyIsSame!351 lt!572478 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!572482 () ListLongMap!18999)

(assert (=> b!1262892 (and (= lt!572479 lt!572483) (= lt!572482 lt!572481))))

(declare-fun +!4287 (ListLongMap!18999 tuple2!21126) ListLongMap!18999)

(assert (=> b!1262892 (= lt!572483 (+!4287 lt!572478 (tuple2!21127 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4570 (array!82333 array!82335 (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 (_ BitVec 32) Int) ListLongMap!18999)

(assert (=> b!1262892 (= lt!572482 (getCurrentListMap!4570 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262892 (= lt!572479 (getCurrentListMap!4570 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262893 () Bool)

(declare-fun e!718942 () Bool)

(assert (=> b!1262893 (= e!718943 (and e!718942 mapRes!50413))))

(declare-fun condMapEmpty!50413 () Bool)

(declare-fun mapDefault!50413 () ValueCell!15434)

(assert (=> b!1262893 (= condMapEmpty!50413 (= (arr!39715 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15434)) mapDefault!50413)))))

(declare-fun b!1262894 () Bool)

(assert (=> b!1262894 (= e!718946 tp_is_empty!32395)))

(declare-fun b!1262895 () Bool)

(assert (=> b!1262895 (= e!718942 tp_is_empty!32395)))

(assert (= (and start!106056 res!841290) b!1262890))

(assert (= (and b!1262890 res!841288) b!1262891))

(assert (= (and b!1262891 res!841287) b!1262888))

(assert (= (and b!1262888 res!841289) b!1262889))

(assert (= (and b!1262889 (not res!841286)) b!1262892))

(assert (= (and b!1262893 condMapEmpty!50413) mapIsEmpty!50413))

(assert (= (and b!1262893 (not condMapEmpty!50413)) mapNonEmpty!50413))

(get-info :version)

(assert (= (and mapNonEmpty!50413 ((_ is ValueCellFull!15434) mapValue!50413)) b!1262894))

(assert (= (and b!1262893 ((_ is ValueCellFull!15434) mapDefault!50413)) b!1262895))

(assert (= start!106056 b!1262893))

(declare-fun m!1162961 () Bool)

(assert (=> start!106056 m!1162961))

(declare-fun m!1162963 () Bool)

(assert (=> start!106056 m!1162963))

(declare-fun m!1162965 () Bool)

(assert (=> start!106056 m!1162965))

(declare-fun m!1162967 () Bool)

(assert (=> b!1262892 m!1162967))

(declare-fun m!1162969 () Bool)

(assert (=> b!1262892 m!1162969))

(declare-fun m!1162971 () Bool)

(assert (=> b!1262892 m!1162971))

(declare-fun m!1162973 () Bool)

(assert (=> b!1262892 m!1162973))

(declare-fun m!1162975 () Bool)

(assert (=> b!1262892 m!1162975))

(declare-fun m!1162977 () Bool)

(assert (=> b!1262892 m!1162977))

(declare-fun m!1162979 () Bool)

(assert (=> b!1262888 m!1162979))

(declare-fun m!1162981 () Bool)

(assert (=> b!1262891 m!1162981))

(declare-fun m!1162983 () Bool)

(assert (=> b!1262889 m!1162983))

(declare-fun m!1162985 () Bool)

(assert (=> b!1262889 m!1162985))

(declare-fun m!1162987 () Bool)

(assert (=> b!1262889 m!1162987))

(declare-fun m!1162989 () Bool)

(assert (=> mapNonEmpty!50413 m!1162989))

(check-sat (not mapNonEmpty!50413) b_and!45449 tp_is_empty!32395 (not b!1262889) (not b_next!27493) (not b!1262891) (not b!1262892) (not start!106056) (not b!1262888))
(check-sat b_and!45449 (not b_next!27493))
