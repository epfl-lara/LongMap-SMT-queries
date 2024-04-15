; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106188 () Bool)

(assert start!106188)

(declare-fun b_free!27529 () Bool)

(declare-fun b_next!27529 () Bool)

(assert (=> start!106188 (= b_free!27529 (not b_next!27529))))

(declare-fun tp!96152 () Bool)

(declare-fun b_and!45543 () Bool)

(assert (=> start!106188 (= tp!96152 b_and!45543)))

(declare-fun b!1264237 () Bool)

(declare-fun e!719858 () Bool)

(declare-fun tp_is_empty!32431 () Bool)

(assert (=> b!1264237 (= e!719858 tp_is_empty!32431)))

(declare-fun b!1264238 () Bool)

(declare-fun e!719862 () Bool)

(declare-fun e!719860 () Bool)

(assert (=> b!1264238 (= e!719862 (not e!719860))))

(declare-fun res!841960 () Bool)

(assert (=> b!1264238 (=> res!841960 e!719860)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264238 (= res!841960 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48607 0))(
  ( (V!48608 (val!16278 Int)) )
))
(declare-datatypes ((tuple2!21158 0))(
  ( (tuple2!21159 (_1!10590 (_ BitVec 64)) (_2!10590 V!48607)) )
))
(declare-datatypes ((List!28350 0))(
  ( (Nil!28347) (Cons!28346 (h!29555 tuple2!21158) (t!41862 List!28350)) )
))
(declare-datatypes ((ListLongMap!19031 0))(
  ( (ListLongMap!19032 (toList!9531 List!28350)) )
))
(declare-fun lt!573475 () ListLongMap!19031)

(declare-fun lt!573480 () ListLongMap!19031)

(assert (=> b!1264238 (= lt!573475 lt!573480)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48607)

(declare-datatypes ((Unit!41984 0))(
  ( (Unit!41985) )
))
(declare-fun lt!573476 () Unit!41984)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48607)

(declare-datatypes ((array!82415 0))(
  ( (array!82416 (arr!39750 (Array (_ BitVec 32) (_ BitVec 64))) (size!40288 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82415)

(declare-datatypes ((ValueCell!15452 0))(
  ( (ValueCellFull!15452 (v!18991 V!48607)) (EmptyCell!15452) )
))
(declare-datatypes ((array!82417 0))(
  ( (array!82418 (arr!39751 (Array (_ BitVec 32) ValueCell!15452)) (size!40289 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82417)

(declare-fun minValueBefore!43 () V!48607)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1195 (array!82415 array!82417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48607 V!48607 V!48607 V!48607 (_ BitVec 32) Int) Unit!41984)

(assert (=> b!1264238 (= lt!573476 (lemmaNoChangeToArrayThenSameMapNoExtras!1195 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5895 (array!82415 array!82417 (_ BitVec 32) (_ BitVec 32) V!48607 V!48607 (_ BitVec 32) Int) ListLongMap!19031)

(assert (=> b!1264238 (= lt!573480 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264238 (= lt!573475 (getCurrentListMapNoExtraKeys!5895 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50482 () Bool)

(declare-fun mapRes!50482 () Bool)

(declare-fun tp!96151 () Bool)

(assert (=> mapNonEmpty!50482 (= mapRes!50482 (and tp!96151 e!719858))))

(declare-fun mapValue!50482 () ValueCell!15452)

(declare-fun mapKey!50482 () (_ BitVec 32))

(declare-fun mapRest!50482 () (Array (_ BitVec 32) ValueCell!15452))

(assert (=> mapNonEmpty!50482 (= (arr!39751 _values!914) (store mapRest!50482 mapKey!50482 mapValue!50482))))

(declare-fun b!1264239 () Bool)

(declare-fun res!841957 () Bool)

(assert (=> b!1264239 (=> (not res!841957) (not e!719862))))

(assert (=> b!1264239 (= res!841957 (and (= (size!40289 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40288 _keys!1118) (size!40289 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264240 () Bool)

(declare-fun lt!573479 () ListLongMap!19031)

(declare-fun lt!573474 () ListLongMap!19031)

(declare-fun -!2101 (ListLongMap!19031 (_ BitVec 64)) ListLongMap!19031)

(assert (=> b!1264240 (= e!719860 (= (-!2101 lt!573479 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573474))))

(declare-fun lt!573478 () ListLongMap!19031)

(declare-fun lt!573477 () ListLongMap!19031)

(assert (=> b!1264240 (= (-!2101 lt!573478 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573477)))

(declare-fun lt!573481 () Unit!41984)

(declare-fun addThenRemoveForNewKeyIsSame!354 (ListLongMap!19031 (_ BitVec 64) V!48607) Unit!41984)

(assert (=> b!1264240 (= lt!573481 (addThenRemoveForNewKeyIsSame!354 lt!573477 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!719861 () Bool)

(assert (=> b!1264240 e!719861))

(declare-fun res!841958 () Bool)

(assert (=> b!1264240 (=> (not res!841958) (not e!719861))))

(assert (=> b!1264240 (= res!841958 (= lt!573479 lt!573478))))

(declare-fun +!4298 (ListLongMap!19031 tuple2!21158) ListLongMap!19031)

(assert (=> b!1264240 (= lt!573478 (+!4298 lt!573477 (tuple2!21159 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!573473 () tuple2!21158)

(assert (=> b!1264240 (= lt!573477 (+!4298 lt!573475 lt!573473))))

(assert (=> b!1264240 (= lt!573473 (tuple2!21159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4584 (array!82415 array!82417 (_ BitVec 32) (_ BitVec 32) V!48607 V!48607 (_ BitVec 32) Int) ListLongMap!19031)

(assert (=> b!1264240 (= lt!573474 (getCurrentListMap!4584 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264240 (= lt!573479 (getCurrentListMap!4584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841962 () Bool)

(assert (=> start!106188 (=> (not res!841962) (not e!719862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106188 (= res!841962 (validMask!0 mask!1466))))

(assert (=> start!106188 e!719862))

(assert (=> start!106188 true))

(assert (=> start!106188 tp!96152))

(assert (=> start!106188 tp_is_empty!32431))

(declare-fun array_inv!30415 (array!82415) Bool)

(assert (=> start!106188 (array_inv!30415 _keys!1118)))

(declare-fun e!719864 () Bool)

(declare-fun array_inv!30416 (array!82417) Bool)

(assert (=> start!106188 (and (array_inv!30416 _values!914) e!719864)))

(declare-fun b!1264241 () Bool)

(assert (=> b!1264241 (= e!719861 (= lt!573474 (+!4298 lt!573480 lt!573473)))))

(declare-fun mapIsEmpty!50482 () Bool)

(assert (=> mapIsEmpty!50482 mapRes!50482))

(declare-fun b!1264242 () Bool)

(declare-fun res!841961 () Bool)

(assert (=> b!1264242 (=> (not res!841961) (not e!719862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82415 (_ BitVec 32)) Bool)

(assert (=> b!1264242 (= res!841961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1264243 () Bool)

(declare-fun res!841959 () Bool)

(assert (=> b!1264243 (=> (not res!841959) (not e!719862))))

(declare-datatypes ((List!28351 0))(
  ( (Nil!28348) (Cons!28347 (h!29556 (_ BitVec 64)) (t!41863 List!28351)) )
))
(declare-fun arrayNoDuplicates!0 (array!82415 (_ BitVec 32) List!28351) Bool)

(assert (=> b!1264243 (= res!841959 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28348))))

(declare-fun b!1264244 () Bool)

(declare-fun e!719863 () Bool)

(assert (=> b!1264244 (= e!719863 tp_is_empty!32431)))

(declare-fun b!1264245 () Bool)

(assert (=> b!1264245 (= e!719864 (and e!719863 mapRes!50482))))

(declare-fun condMapEmpty!50482 () Bool)

(declare-fun mapDefault!50482 () ValueCell!15452)

(assert (=> b!1264245 (= condMapEmpty!50482 (= (arr!39751 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15452)) mapDefault!50482)))))

(assert (= (and start!106188 res!841962) b!1264239))

(assert (= (and b!1264239 res!841957) b!1264242))

(assert (= (and b!1264242 res!841961) b!1264243))

(assert (= (and b!1264243 res!841959) b!1264238))

(assert (= (and b!1264238 (not res!841960)) b!1264240))

(assert (= (and b!1264240 res!841958) b!1264241))

(assert (= (and b!1264245 condMapEmpty!50482) mapIsEmpty!50482))

(assert (= (and b!1264245 (not condMapEmpty!50482)) mapNonEmpty!50482))

(get-info :version)

(assert (= (and mapNonEmpty!50482 ((_ is ValueCellFull!15452) mapValue!50482)) b!1264237))

(assert (= (and b!1264245 ((_ is ValueCellFull!15452) mapDefault!50482)) b!1264244))

(assert (= start!106188 b!1264245))

(declare-fun m!1164323 () Bool)

(assert (=> mapNonEmpty!50482 m!1164323))

(declare-fun m!1164325 () Bool)

(assert (=> b!1264241 m!1164325))

(declare-fun m!1164327 () Bool)

(assert (=> b!1264242 m!1164327))

(declare-fun m!1164329 () Bool)

(assert (=> b!1264240 m!1164329))

(declare-fun m!1164331 () Bool)

(assert (=> b!1264240 m!1164331))

(declare-fun m!1164333 () Bool)

(assert (=> b!1264240 m!1164333))

(declare-fun m!1164335 () Bool)

(assert (=> b!1264240 m!1164335))

(declare-fun m!1164337 () Bool)

(assert (=> b!1264240 m!1164337))

(declare-fun m!1164339 () Bool)

(assert (=> b!1264240 m!1164339))

(declare-fun m!1164341 () Bool)

(assert (=> b!1264240 m!1164341))

(declare-fun m!1164343 () Bool)

(assert (=> b!1264238 m!1164343))

(declare-fun m!1164345 () Bool)

(assert (=> b!1264238 m!1164345))

(declare-fun m!1164347 () Bool)

(assert (=> b!1264238 m!1164347))

(declare-fun m!1164349 () Bool)

(assert (=> b!1264243 m!1164349))

(declare-fun m!1164351 () Bool)

(assert (=> start!106188 m!1164351))

(declare-fun m!1164353 () Bool)

(assert (=> start!106188 m!1164353))

(declare-fun m!1164355 () Bool)

(assert (=> start!106188 m!1164355))

(check-sat (not b!1264240) (not b!1264242) (not b!1264238) (not b!1264243) tp_is_empty!32431 (not b!1264241) b_and!45543 (not b_next!27529) (not start!106188) (not mapNonEmpty!50482))
(check-sat b_and!45543 (not b_next!27529))
