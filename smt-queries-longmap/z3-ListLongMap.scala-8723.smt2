; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105806 () Bool)

(assert start!105806)

(declare-fun b_free!27373 () Bool)

(declare-fun b_next!27373 () Bool)

(assert (=> start!105806 (= b_free!27373 (not b_next!27373))))

(declare-fun tp!95648 () Bool)

(declare-fun b_and!45251 () Bool)

(assert (=> start!105806 (= tp!95648 b_and!45251)))

(declare-fun b!1260362 () Bool)

(declare-fun res!839972 () Bool)

(declare-fun e!717196 () Bool)

(assert (=> b!1260362 (=> (not res!839972) (not e!717196))))

(declare-datatypes ((array!82091 0))(
  ( (array!82092 (arr!39600 (Array (_ BitVec 32) (_ BitVec 64))) (size!40138 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82091)

(declare-datatypes ((List!28233 0))(
  ( (Nil!28230) (Cons!28229 (h!29438 (_ BitVec 64)) (t!41721 List!28233)) )
))
(declare-fun arrayNoDuplicates!0 (array!82091 (_ BitVec 32) List!28233) Bool)

(assert (=> b!1260362 (= res!839972 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28230))))

(declare-fun b!1260363 () Bool)

(declare-fun e!717197 () Bool)

(assert (=> b!1260363 (= e!717197 true)))

(declare-datatypes ((V!48399 0))(
  ( (V!48400 (val!16200 Int)) )
))
(declare-datatypes ((tuple2!21034 0))(
  ( (tuple2!21035 (_1!10528 (_ BitVec 64)) (_2!10528 V!48399)) )
))
(declare-datatypes ((List!28234 0))(
  ( (Nil!28231) (Cons!28230 (h!29439 tuple2!21034) (t!41722 List!28234)) )
))
(declare-datatypes ((ListLongMap!18907 0))(
  ( (ListLongMap!18908 (toList!9469 List!28234)) )
))
(declare-fun lt!570953 () ListLongMap!18907)

(declare-fun lt!570949 () ListLongMap!18907)

(declare-fun -!2087 (ListLongMap!18907 (_ BitVec 64)) ListLongMap!18907)

(assert (=> b!1260363 (= lt!570953 (-!2087 lt!570949 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570945 () ListLongMap!18907)

(declare-fun lt!570952 () ListLongMap!18907)

(assert (=> b!1260363 (= (-!2087 lt!570945 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570952)))

(declare-datatypes ((Unit!41882 0))(
  ( (Unit!41883) )
))
(declare-fun lt!570946 () Unit!41882)

(declare-fun minValueBefore!43 () V!48399)

(declare-fun addThenRemoveForNewKeyIsSame!344 (ListLongMap!18907 (_ BitVec 64) V!48399) Unit!41882)

(assert (=> b!1260363 (= lt!570946 (addThenRemoveForNewKeyIsSame!344 lt!570952 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717193 () Bool)

(assert (=> b!1260363 e!717193))

(declare-fun res!839973 () Bool)

(assert (=> b!1260363 (=> (not res!839973) (not e!717193))))

(assert (=> b!1260363 (= res!839973 (= lt!570949 lt!570945))))

(declare-fun +!4270 (ListLongMap!18907 tuple2!21034) ListLongMap!18907)

(assert (=> b!1260363 (= lt!570945 (+!4270 lt!570952 (tuple2!21035 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570947 () ListLongMap!18907)

(declare-fun lt!570951 () tuple2!21034)

(assert (=> b!1260363 (= lt!570952 (+!4270 lt!570947 lt!570951))))

(declare-fun zeroValue!871 () V!48399)

(assert (=> b!1260363 (= lt!570951 (tuple2!21035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48399)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15374 0))(
  ( (ValueCellFull!15374 (v!18902 V!48399)) (EmptyCell!15374) )
))
(declare-datatypes ((array!82093 0))(
  ( (array!82094 (arr!39601 (Array (_ BitVec 32) ValueCell!15374)) (size!40139 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82093)

(declare-fun lt!570950 () ListLongMap!18907)

(declare-fun getCurrentListMap!4553 (array!82091 array!82093 (_ BitVec 32) (_ BitVec 32) V!48399 V!48399 (_ BitVec 32) Int) ListLongMap!18907)

(assert (=> b!1260363 (= lt!570950 (getCurrentListMap!4553 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260363 (= lt!570949 (getCurrentListMap!4553 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260364 () Bool)

(declare-fun res!839974 () Bool)

(assert (=> b!1260364 (=> (not res!839974) (not e!717196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82091 (_ BitVec 32)) Bool)

(assert (=> b!1260364 (= res!839974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50212 () Bool)

(declare-fun mapRes!50212 () Bool)

(assert (=> mapIsEmpty!50212 mapRes!50212))

(declare-fun mapNonEmpty!50212 () Bool)

(declare-fun tp!95647 () Bool)

(declare-fun e!717195 () Bool)

(assert (=> mapNonEmpty!50212 (= mapRes!50212 (and tp!95647 e!717195))))

(declare-fun mapRest!50212 () (Array (_ BitVec 32) ValueCell!15374))

(declare-fun mapKey!50212 () (_ BitVec 32))

(declare-fun mapValue!50212 () ValueCell!15374)

(assert (=> mapNonEmpty!50212 (= (arr!39601 _values!914) (store mapRest!50212 mapKey!50212 mapValue!50212))))

(declare-fun b!1260366 () Bool)

(declare-fun res!839975 () Bool)

(assert (=> b!1260366 (=> (not res!839975) (not e!717196))))

(assert (=> b!1260366 (= res!839975 (and (= (size!40139 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40138 _keys!1118) (size!40139 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260367 () Bool)

(declare-fun e!717194 () Bool)

(declare-fun e!717198 () Bool)

(assert (=> b!1260367 (= e!717194 (and e!717198 mapRes!50212))))

(declare-fun condMapEmpty!50212 () Bool)

(declare-fun mapDefault!50212 () ValueCell!15374)

(assert (=> b!1260367 (= condMapEmpty!50212 (= (arr!39601 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15374)) mapDefault!50212)))))

(declare-fun lt!570948 () ListLongMap!18907)

(declare-fun b!1260368 () Bool)

(assert (=> b!1260368 (= e!717193 (= lt!570950 (+!4270 lt!570948 lt!570951)))))

(declare-fun b!1260369 () Bool)

(assert (=> b!1260369 (= e!717196 (not e!717197))))

(declare-fun res!839976 () Bool)

(assert (=> b!1260369 (=> res!839976 e!717197)))

(assert (=> b!1260369 (= res!839976 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260369 (= lt!570947 lt!570948)))

(declare-fun lt!570944 () Unit!41882)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1160 (array!82091 array!82093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48399 V!48399 V!48399 V!48399 (_ BitVec 32) Int) Unit!41882)

(assert (=> b!1260369 (= lt!570944 (lemmaNoChangeToArrayThenSameMapNoExtras!1160 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5838 (array!82091 array!82093 (_ BitVec 32) (_ BitVec 32) V!48399 V!48399 (_ BitVec 32) Int) ListLongMap!18907)

(assert (=> b!1260369 (= lt!570948 (getCurrentListMapNoExtraKeys!5838 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260369 (= lt!570947 (getCurrentListMapNoExtraKeys!5838 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260370 () Bool)

(declare-fun tp_is_empty!32275 () Bool)

(assert (=> b!1260370 (= e!717195 tp_is_empty!32275)))

(declare-fun b!1260365 () Bool)

(assert (=> b!1260365 (= e!717198 tp_is_empty!32275)))

(declare-fun res!839977 () Bool)

(assert (=> start!105806 (=> (not res!839977) (not e!717196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105806 (= res!839977 (validMask!0 mask!1466))))

(assert (=> start!105806 e!717196))

(assert (=> start!105806 true))

(assert (=> start!105806 tp!95648))

(assert (=> start!105806 tp_is_empty!32275))

(declare-fun array_inv!30295 (array!82091) Bool)

(assert (=> start!105806 (array_inv!30295 _keys!1118)))

(declare-fun array_inv!30296 (array!82093) Bool)

(assert (=> start!105806 (and (array_inv!30296 _values!914) e!717194)))

(assert (= (and start!105806 res!839977) b!1260366))

(assert (= (and b!1260366 res!839975) b!1260364))

(assert (= (and b!1260364 res!839974) b!1260362))

(assert (= (and b!1260362 res!839972) b!1260369))

(assert (= (and b!1260369 (not res!839976)) b!1260363))

(assert (= (and b!1260363 res!839973) b!1260368))

(assert (= (and b!1260367 condMapEmpty!50212) mapIsEmpty!50212))

(assert (= (and b!1260367 (not condMapEmpty!50212)) mapNonEmpty!50212))

(get-info :version)

(assert (= (and mapNonEmpty!50212 ((_ is ValueCellFull!15374) mapValue!50212)) b!1260370))

(assert (= (and b!1260367 ((_ is ValueCellFull!15374) mapDefault!50212)) b!1260365))

(assert (= start!105806 b!1260367))

(declare-fun m!1160631 () Bool)

(assert (=> b!1260363 m!1160631))

(declare-fun m!1160633 () Bool)

(assert (=> b!1260363 m!1160633))

(declare-fun m!1160635 () Bool)

(assert (=> b!1260363 m!1160635))

(declare-fun m!1160637 () Bool)

(assert (=> b!1260363 m!1160637))

(declare-fun m!1160639 () Bool)

(assert (=> b!1260363 m!1160639))

(declare-fun m!1160641 () Bool)

(assert (=> b!1260363 m!1160641))

(declare-fun m!1160643 () Bool)

(assert (=> b!1260363 m!1160643))

(declare-fun m!1160645 () Bool)

(assert (=> b!1260369 m!1160645))

(declare-fun m!1160647 () Bool)

(assert (=> b!1260369 m!1160647))

(declare-fun m!1160649 () Bool)

(assert (=> b!1260369 m!1160649))

(declare-fun m!1160651 () Bool)

(assert (=> mapNonEmpty!50212 m!1160651))

(declare-fun m!1160653 () Bool)

(assert (=> start!105806 m!1160653))

(declare-fun m!1160655 () Bool)

(assert (=> start!105806 m!1160655))

(declare-fun m!1160657 () Bool)

(assert (=> start!105806 m!1160657))

(declare-fun m!1160659 () Bool)

(assert (=> b!1260364 m!1160659))

(declare-fun m!1160661 () Bool)

(assert (=> b!1260368 m!1160661))

(declare-fun m!1160663 () Bool)

(assert (=> b!1260362 m!1160663))

(check-sat (not b!1260362) (not b!1260369) (not b!1260364) (not mapNonEmpty!50212) (not start!105806) (not b_next!27373) (not b!1260368) (not b!1260363) b_and!45251 tp_is_empty!32275)
(check-sat b_and!45251 (not b_next!27373))
