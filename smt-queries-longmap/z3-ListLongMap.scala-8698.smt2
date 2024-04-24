; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105846 () Bool)

(assert start!105846)

(declare-fun b_free!27223 () Bool)

(declare-fun b_next!27223 () Bool)

(assert (=> start!105846 (= b_free!27223 (not b_next!27223))))

(declare-fun tp!95191 () Bool)

(declare-fun b_and!45099 () Bool)

(assert (=> start!105846 (= tp!95191 b_and!45099)))

(declare-fun b!1259458 () Bool)

(declare-fun e!716367 () Bool)

(assert (=> b!1259458 (= e!716367 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48199 0))(
  ( (V!48200 (val!16125 Int)) )
))
(declare-fun zeroValue!871 () V!48199)

(declare-datatypes ((array!81927 0))(
  ( (array!81928 (arr!39515 (Array (_ BitVec 32) (_ BitVec 64))) (size!40052 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81927)

(declare-datatypes ((ValueCell!15299 0))(
  ( (ValueCellFull!15299 (v!18823 V!48199)) (EmptyCell!15299) )
))
(declare-datatypes ((array!81929 0))(
  ( (array!81930 (arr!39516 (Array (_ BitVec 32) ValueCell!15299)) (size!40053 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81929)

(declare-fun minValueBefore!43 () V!48199)

(declare-datatypes ((tuple2!20850 0))(
  ( (tuple2!20851 (_1!10436 (_ BitVec 64)) (_2!10436 V!48199)) )
))
(declare-datatypes ((List!28082 0))(
  ( (Nil!28079) (Cons!28078 (h!29296 tuple2!20850) (t!41567 List!28082)) )
))
(declare-datatypes ((ListLongMap!18731 0))(
  ( (ListLongMap!18732 (toList!9381 List!28082)) )
))
(declare-fun lt!569543 () ListLongMap!18731)

(declare-fun getCurrentListMap!4571 (array!81927 array!81929 (_ BitVec 32) (_ BitVec 32) V!48199 V!48199 (_ BitVec 32) Int) ListLongMap!18731)

(assert (=> b!1259458 (= lt!569543 (getCurrentListMap!4571 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259459 () Bool)

(declare-fun e!716369 () Bool)

(assert (=> b!1259459 (= e!716369 (not e!716367))))

(declare-fun res!839111 () Bool)

(assert (=> b!1259459 (=> res!839111 e!716367)))

(assert (=> b!1259459 (= res!839111 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569544 () ListLongMap!18731)

(declare-fun lt!569545 () ListLongMap!18731)

(assert (=> b!1259459 (= lt!569544 lt!569545)))

(declare-datatypes ((Unit!41905 0))(
  ( (Unit!41906) )
))
(declare-fun lt!569546 () Unit!41905)

(declare-fun minValueAfter!43 () V!48199)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1111 (array!81927 array!81929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48199 V!48199 V!48199 V!48199 (_ BitVec 32) Int) Unit!41905)

(assert (=> b!1259459 (= lt!569546 (lemmaNoChangeToArrayThenSameMapNoExtras!1111 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5797 (array!81927 array!81929 (_ BitVec 32) (_ BitVec 32) V!48199 V!48199 (_ BitVec 32) Int) ListLongMap!18731)

(assert (=> b!1259459 (= lt!569545 (getCurrentListMapNoExtraKeys!5797 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259459 (= lt!569544 (getCurrentListMapNoExtraKeys!5797 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259460 () Bool)

(declare-fun res!839108 () Bool)

(assert (=> b!1259460 (=> (not res!839108) (not e!716369))))

(assert (=> b!1259460 (= res!839108 (and (= (size!40053 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40052 _keys!1118) (size!40053 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259461 () Bool)

(declare-fun res!839110 () Bool)

(assert (=> b!1259461 (=> (not res!839110) (not e!716369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81927 (_ BitVec 32)) Bool)

(assert (=> b!1259461 (= res!839110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259463 () Bool)

(declare-fun e!716368 () Bool)

(declare-fun e!716366 () Bool)

(declare-fun mapRes!49981 () Bool)

(assert (=> b!1259463 (= e!716368 (and e!716366 mapRes!49981))))

(declare-fun condMapEmpty!49981 () Bool)

(declare-fun mapDefault!49981 () ValueCell!15299)

(assert (=> b!1259463 (= condMapEmpty!49981 (= (arr!39516 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15299)) mapDefault!49981)))))

(declare-fun mapNonEmpty!49981 () Bool)

(declare-fun tp!95192 () Bool)

(declare-fun e!716365 () Bool)

(assert (=> mapNonEmpty!49981 (= mapRes!49981 (and tp!95192 e!716365))))

(declare-fun mapValue!49981 () ValueCell!15299)

(declare-fun mapRest!49981 () (Array (_ BitVec 32) ValueCell!15299))

(declare-fun mapKey!49981 () (_ BitVec 32))

(assert (=> mapNonEmpty!49981 (= (arr!39516 _values!914) (store mapRest!49981 mapKey!49981 mapValue!49981))))

(declare-fun b!1259464 () Bool)

(declare-fun tp_is_empty!32125 () Bool)

(assert (=> b!1259464 (= e!716366 tp_is_empty!32125)))

(declare-fun b!1259462 () Bool)

(declare-fun res!839109 () Bool)

(assert (=> b!1259462 (=> (not res!839109) (not e!716369))))

(declare-datatypes ((List!28083 0))(
  ( (Nil!28080) (Cons!28079 (h!29297 (_ BitVec 64)) (t!41568 List!28083)) )
))
(declare-fun arrayNoDuplicates!0 (array!81927 (_ BitVec 32) List!28083) Bool)

(assert (=> b!1259462 (= res!839109 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28080))))

(declare-fun res!839112 () Bool)

(assert (=> start!105846 (=> (not res!839112) (not e!716369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105846 (= res!839112 (validMask!0 mask!1466))))

(assert (=> start!105846 e!716369))

(assert (=> start!105846 true))

(assert (=> start!105846 tp!95191))

(assert (=> start!105846 tp_is_empty!32125))

(declare-fun array_inv!30233 (array!81927) Bool)

(assert (=> start!105846 (array_inv!30233 _keys!1118)))

(declare-fun array_inv!30234 (array!81929) Bool)

(assert (=> start!105846 (and (array_inv!30234 _values!914) e!716368)))

(declare-fun mapIsEmpty!49981 () Bool)

(assert (=> mapIsEmpty!49981 mapRes!49981))

(declare-fun b!1259465 () Bool)

(assert (=> b!1259465 (= e!716365 tp_is_empty!32125)))

(assert (= (and start!105846 res!839112) b!1259460))

(assert (= (and b!1259460 res!839108) b!1259461))

(assert (= (and b!1259461 res!839110) b!1259462))

(assert (= (and b!1259462 res!839109) b!1259459))

(assert (= (and b!1259459 (not res!839111)) b!1259458))

(assert (= (and b!1259463 condMapEmpty!49981) mapIsEmpty!49981))

(assert (= (and b!1259463 (not condMapEmpty!49981)) mapNonEmpty!49981))

(get-info :version)

(assert (= (and mapNonEmpty!49981 ((_ is ValueCellFull!15299) mapValue!49981)) b!1259465))

(assert (= (and b!1259463 ((_ is ValueCellFull!15299) mapDefault!49981)) b!1259464))

(assert (= start!105846 b!1259463))

(declare-fun m!1160241 () Bool)

(assert (=> mapNonEmpty!49981 m!1160241))

(declare-fun m!1160243 () Bool)

(assert (=> b!1259462 m!1160243))

(declare-fun m!1160245 () Bool)

(assert (=> b!1259458 m!1160245))

(declare-fun m!1160247 () Bool)

(assert (=> b!1259459 m!1160247))

(declare-fun m!1160249 () Bool)

(assert (=> b!1259459 m!1160249))

(declare-fun m!1160251 () Bool)

(assert (=> b!1259459 m!1160251))

(declare-fun m!1160253 () Bool)

(assert (=> start!105846 m!1160253))

(declare-fun m!1160255 () Bool)

(assert (=> start!105846 m!1160255))

(declare-fun m!1160257 () Bool)

(assert (=> start!105846 m!1160257))

(declare-fun m!1160259 () Bool)

(assert (=> b!1259461 m!1160259))

(check-sat (not b!1259459) (not b!1259458) (not b!1259461) (not b_next!27223) (not b!1259462) tp_is_empty!32125 (not mapNonEmpty!49981) (not start!105846) b_and!45099)
(check-sat b_and!45099 (not b_next!27223))
