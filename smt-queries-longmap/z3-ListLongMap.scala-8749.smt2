; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106416 () Bool)

(assert start!106416)

(declare-fun b_free!27529 () Bool)

(declare-fun b_next!27529 () Bool)

(assert (=> start!106416 (= b_free!27529 (not b_next!27529))))

(declare-fun tp!96151 () Bool)

(declare-fun b_and!45563 () Bool)

(assert (=> start!106416 (= tp!96151 b_and!45563)))

(declare-fun b!1265624 () Bool)

(declare-fun res!842519 () Bool)

(declare-fun e!720755 () Bool)

(assert (=> b!1265624 (=> (not res!842519) (not e!720755))))

(declare-datatypes ((array!82535 0))(
  ( (array!82536 (arr!39805 (Array (_ BitVec 32) (_ BitVec 64))) (size!40342 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82535)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82535 (_ BitVec 32)) Bool)

(assert (=> b!1265624 (= res!842519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1265626 () Bool)

(declare-fun e!720751 () Bool)

(declare-fun tp_is_empty!32431 () Bool)

(assert (=> b!1265626 (= e!720751 tp_is_empty!32431)))

(declare-fun b!1265627 () Bool)

(declare-fun res!842517 () Bool)

(assert (=> b!1265627 (=> (not res!842517) (not e!720755))))

(declare-datatypes ((List!28305 0))(
  ( (Nil!28302) (Cons!28301 (h!29519 (_ BitVec 64)) (t!41818 List!28305)) )
))
(declare-fun arrayNoDuplicates!0 (array!82535 (_ BitVec 32) List!28305) Bool)

(assert (=> b!1265627 (= res!842517 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28302))))

(declare-fun b!1265628 () Bool)

(declare-fun res!842521 () Bool)

(assert (=> b!1265628 (=> (not res!842521) (not e!720755))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48607 0))(
  ( (V!48608 (val!16278 Int)) )
))
(declare-datatypes ((ValueCell!15452 0))(
  ( (ValueCellFull!15452 (v!18988 V!48607)) (EmptyCell!15452) )
))
(declare-datatypes ((array!82537 0))(
  ( (array!82538 (arr!39806 (Array (_ BitVec 32) ValueCell!15452)) (size!40343 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82537)

(assert (=> b!1265628 (= res!842521 (and (= (size!40343 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40342 _keys!1118) (size!40343 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50482 () Bool)

(declare-fun mapRes!50482 () Bool)

(assert (=> mapIsEmpty!50482 mapRes!50482))

(declare-fun b!1265629 () Bool)

(declare-datatypes ((tuple2!21086 0))(
  ( (tuple2!21087 (_1!10554 (_ BitVec 64)) (_2!10554 V!48607)) )
))
(declare-fun lt!574138 () tuple2!21086)

(declare-datatypes ((List!28306 0))(
  ( (Nil!28303) (Cons!28302 (h!29520 tuple2!21086) (t!41819 List!28306)) )
))
(declare-datatypes ((ListLongMap!18967 0))(
  ( (ListLongMap!18968 (toList!9499 List!28306)) )
))
(declare-fun lt!574136 () ListLongMap!18967)

(declare-fun e!720750 () Bool)

(declare-fun lt!574139 () ListLongMap!18967)

(declare-fun +!4306 (ListLongMap!18967 tuple2!21086) ListLongMap!18967)

(assert (=> b!1265629 (= e!720750 (= lt!574136 (+!4306 lt!574139 lt!574138)))))

(declare-fun b!1265630 () Bool)

(declare-fun e!720752 () Bool)

(assert (=> b!1265630 (= e!720755 (not e!720752))))

(declare-fun res!842522 () Bool)

(assert (=> b!1265630 (=> res!842522 e!720752)))

(assert (=> b!1265630 (= res!842522 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!574140 () ListLongMap!18967)

(assert (=> b!1265630 (= lt!574140 lt!574139)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48607)

(declare-fun zeroValue!871 () V!48607)

(declare-datatypes ((Unit!42108 0))(
  ( (Unit!42109) )
))
(declare-fun lt!574137 () Unit!42108)

(declare-fun minValueBefore!43 () V!48607)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1191 (array!82535 array!82537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48607 V!48607 V!48607 V!48607 (_ BitVec 32) Int) Unit!42108)

(assert (=> b!1265630 (= lt!574137 (lemmaNoChangeToArrayThenSameMapNoExtras!1191 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5901 (array!82535 array!82537 (_ BitVec 32) (_ BitVec 32) V!48607 V!48607 (_ BitVec 32) Int) ListLongMap!18967)

(assert (=> b!1265630 (= lt!574139 (getCurrentListMapNoExtraKeys!5901 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1265630 (= lt!574140 (getCurrentListMapNoExtraKeys!5901 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265631 () Bool)

(declare-fun lt!574142 () ListLongMap!18967)

(declare-fun -!2122 (ListLongMap!18967 (_ BitVec 64)) ListLongMap!18967)

(assert (=> b!1265631 (= e!720752 (= (-!2122 lt!574142 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574136))))

(declare-fun lt!574141 () ListLongMap!18967)

(declare-fun lt!574144 () ListLongMap!18967)

(assert (=> b!1265631 (= (-!2122 lt!574141 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574144)))

(declare-fun lt!574143 () Unit!42108)

(declare-fun addThenRemoveForNewKeyIsSame!371 (ListLongMap!18967 (_ BitVec 64) V!48607) Unit!42108)

(assert (=> b!1265631 (= lt!574143 (addThenRemoveForNewKeyIsSame!371 lt!574144 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1265631 e!720750))

(declare-fun res!842518 () Bool)

(assert (=> b!1265631 (=> (not res!842518) (not e!720750))))

(assert (=> b!1265631 (= res!842518 (= lt!574142 lt!574141))))

(assert (=> b!1265631 (= lt!574141 (+!4306 lt!574144 (tuple2!21087 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1265631 (= lt!574144 (+!4306 lt!574140 lt!574138))))

(assert (=> b!1265631 (= lt!574138 (tuple2!21087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4649 (array!82535 array!82537 (_ BitVec 32) (_ BitVec 32) V!48607 V!48607 (_ BitVec 32) Int) ListLongMap!18967)

(assert (=> b!1265631 (= lt!574136 (getCurrentListMap!4649 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1265631 (= lt!574142 (getCurrentListMap!4649 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1265632 () Bool)

(declare-fun e!720754 () Bool)

(assert (=> b!1265632 (= e!720754 (and e!720751 mapRes!50482))))

(declare-fun condMapEmpty!50482 () Bool)

(declare-fun mapDefault!50482 () ValueCell!15452)

(assert (=> b!1265632 (= condMapEmpty!50482 (= (arr!39806 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15452)) mapDefault!50482)))))

(declare-fun mapNonEmpty!50482 () Bool)

(declare-fun tp!96152 () Bool)

(declare-fun e!720756 () Bool)

(assert (=> mapNonEmpty!50482 (= mapRes!50482 (and tp!96152 e!720756))))

(declare-fun mapValue!50482 () ValueCell!15452)

(declare-fun mapRest!50482 () (Array (_ BitVec 32) ValueCell!15452))

(declare-fun mapKey!50482 () (_ BitVec 32))

(assert (=> mapNonEmpty!50482 (= (arr!39806 _values!914) (store mapRest!50482 mapKey!50482 mapValue!50482))))

(declare-fun b!1265625 () Bool)

(assert (=> b!1265625 (= e!720756 tp_is_empty!32431)))

(declare-fun res!842520 () Bool)

(assert (=> start!106416 (=> (not res!842520) (not e!720755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106416 (= res!842520 (validMask!0 mask!1466))))

(assert (=> start!106416 e!720755))

(assert (=> start!106416 true))

(assert (=> start!106416 tp!96151))

(assert (=> start!106416 tp_is_empty!32431))

(declare-fun array_inv!30457 (array!82535) Bool)

(assert (=> start!106416 (array_inv!30457 _keys!1118)))

(declare-fun array_inv!30458 (array!82537) Bool)

(assert (=> start!106416 (and (array_inv!30458 _values!914) e!720754)))

(assert (= (and start!106416 res!842520) b!1265628))

(assert (= (and b!1265628 res!842521) b!1265624))

(assert (= (and b!1265624 res!842519) b!1265627))

(assert (= (and b!1265627 res!842517) b!1265630))

(assert (= (and b!1265630 (not res!842522)) b!1265631))

(assert (= (and b!1265631 res!842518) b!1265629))

(assert (= (and b!1265632 condMapEmpty!50482) mapIsEmpty!50482))

(assert (= (and b!1265632 (not condMapEmpty!50482)) mapNonEmpty!50482))

(get-info :version)

(assert (= (and mapNonEmpty!50482 ((_ is ValueCellFull!15452) mapValue!50482)) b!1265625))

(assert (= (and b!1265632 ((_ is ValueCellFull!15452) mapDefault!50482)) b!1265626))

(assert (= start!106416 b!1265632))

(declare-fun m!1166455 () Bool)

(assert (=> start!106416 m!1166455))

(declare-fun m!1166457 () Bool)

(assert (=> start!106416 m!1166457))

(declare-fun m!1166459 () Bool)

(assert (=> start!106416 m!1166459))

(declare-fun m!1166461 () Bool)

(assert (=> b!1265627 m!1166461))

(declare-fun m!1166463 () Bool)

(assert (=> b!1265624 m!1166463))

(declare-fun m!1166465 () Bool)

(assert (=> mapNonEmpty!50482 m!1166465))

(declare-fun m!1166467 () Bool)

(assert (=> b!1265631 m!1166467))

(declare-fun m!1166469 () Bool)

(assert (=> b!1265631 m!1166469))

(declare-fun m!1166471 () Bool)

(assert (=> b!1265631 m!1166471))

(declare-fun m!1166473 () Bool)

(assert (=> b!1265631 m!1166473))

(declare-fun m!1166475 () Bool)

(assert (=> b!1265631 m!1166475))

(declare-fun m!1166477 () Bool)

(assert (=> b!1265631 m!1166477))

(declare-fun m!1166479 () Bool)

(assert (=> b!1265631 m!1166479))

(declare-fun m!1166481 () Bool)

(assert (=> b!1265629 m!1166481))

(declare-fun m!1166483 () Bool)

(assert (=> b!1265630 m!1166483))

(declare-fun m!1166485 () Bool)

(assert (=> b!1265630 m!1166485))

(declare-fun m!1166487 () Bool)

(assert (=> b!1265630 m!1166487))

(check-sat (not start!106416) b_and!45563 (not b!1265624) tp_is_empty!32431 (not mapNonEmpty!50482) (not b!1265627) (not b!1265630) (not b!1265629) (not b!1265631) (not b_next!27529))
(check-sat b_and!45563 (not b_next!27529))
