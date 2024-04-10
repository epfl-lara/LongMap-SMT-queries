; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3968 () Bool)

(assert start!3968)

(declare-fun b_free!873 () Bool)

(declare-fun b_next!873 () Bool)

(assert (=> start!3968 (= b_free!873 (not b_next!873))))

(declare-fun tp!4039 () Bool)

(declare-fun b_and!1683 () Bool)

(assert (=> start!3968 (= tp!4039 b_and!1683)))

(declare-fun b!28490 () Bool)

(declare-fun res!16983 () Bool)

(declare-fun e!18422 () Bool)

(assert (=> b!28490 (=> (not res!16983) (not e!18422))))

(declare-datatypes ((array!1689 0))(
  ( (array!1690 (arr!798 (Array (_ BitVec 32) (_ BitVec 64))) (size!899 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1689)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28490 (= res!16983 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1369 () Bool)

(declare-fun mapRes!1369 () Bool)

(declare-fun tp!4038 () Bool)

(declare-fun e!18425 () Bool)

(assert (=> mapNonEmpty!1369 (= mapRes!1369 (and tp!4038 e!18425))))

(declare-datatypes ((V!1461 0))(
  ( (V!1462 (val!640 Int)) )
))
(declare-datatypes ((ValueCell!414 0))(
  ( (ValueCellFull!414 (v!1729 V!1461)) (EmptyCell!414) )
))
(declare-datatypes ((array!1691 0))(
  ( (array!1692 (arr!799 (Array (_ BitVec 32) ValueCell!414)) (size!900 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1691)

(declare-fun mapRest!1369 () (Array (_ BitVec 32) ValueCell!414))

(declare-fun mapValue!1369 () ValueCell!414)

(declare-fun mapKey!1369 () (_ BitVec 32))

(assert (=> mapNonEmpty!1369 (= (arr!799 _values!1501) (store mapRest!1369 mapKey!1369 mapValue!1369))))

(declare-fun b!28491 () Bool)

(declare-fun e!18426 () Bool)

(assert (=> b!28491 (= e!18426 true)))

(declare-datatypes ((SeekEntryResult!66 0))(
  ( (MissingZero!66 (index!2386 (_ BitVec 32))) (Found!66 (index!2387 (_ BitVec 32))) (Intermediate!66 (undefined!878 Bool) (index!2388 (_ BitVec 32)) (x!6320 (_ BitVec 32))) (Undefined!66) (MissingVacant!66 (index!2389 (_ BitVec 32))) )
))
(declare-fun lt!10826 () SeekEntryResult!66)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1689 (_ BitVec 32)) SeekEntryResult!66)

(assert (=> b!28491 (= lt!10826 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28492 () Bool)

(declare-fun res!16982 () Bool)

(declare-fun e!18428 () Bool)

(assert (=> b!28492 (=> (not res!16982) (not e!18428))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28492 (= res!16982 (and (= (size!900 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!899 _keys!1833) (size!900 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28494 () Bool)

(declare-fun e!18423 () Bool)

(declare-fun e!18424 () Bool)

(assert (=> b!28494 (= e!18423 (and e!18424 mapRes!1369))))

(declare-fun condMapEmpty!1369 () Bool)

(declare-fun mapDefault!1369 () ValueCell!414)

(assert (=> b!28494 (= condMapEmpty!1369 (= (arr!799 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!414)) mapDefault!1369)))))

(declare-fun b!28495 () Bool)

(declare-fun res!16980 () Bool)

(assert (=> b!28495 (=> (not res!16980) (not e!18428))))

(declare-datatypes ((List!663 0))(
  ( (Nil!660) (Cons!659 (h!1226 (_ BitVec 64)) (t!3356 List!663)) )
))
(declare-fun arrayNoDuplicates!0 (array!1689 (_ BitVec 32) List!663) Bool)

(assert (=> b!28495 (= res!16980 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!660))))

(declare-fun b!28496 () Bool)

(declare-fun tp_is_empty!1227 () Bool)

(assert (=> b!28496 (= e!18424 tp_is_empty!1227)))

(declare-fun b!28497 () Bool)

(declare-fun res!16979 () Bool)

(assert (=> b!28497 (=> (not res!16979) (not e!18428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1689 (_ BitVec 32)) Bool)

(assert (=> b!28497 (= res!16979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1369 () Bool)

(assert (=> mapIsEmpty!1369 mapRes!1369))

(declare-fun b!28498 () Bool)

(declare-fun res!16986 () Bool)

(assert (=> b!28498 (=> (not res!16986) (not e!18428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28498 (= res!16986 (validKeyInArray!0 k0!1304))))

(declare-fun b!28499 () Bool)

(assert (=> b!28499 (= e!18428 e!18422)))

(declare-fun res!16984 () Bool)

(assert (=> b!28499 (=> (not res!16984) (not e!18422))))

(declare-datatypes ((tuple2!1064 0))(
  ( (tuple2!1065 (_1!543 (_ BitVec 64)) (_2!543 V!1461)) )
))
(declare-datatypes ((List!664 0))(
  ( (Nil!661) (Cons!660 (h!1227 tuple2!1064) (t!3357 List!664)) )
))
(declare-datatypes ((ListLongMap!641 0))(
  ( (ListLongMap!642 (toList!336 List!664)) )
))
(declare-fun lt!10829 () ListLongMap!641)

(declare-fun contains!276 (ListLongMap!641 (_ BitVec 64)) Bool)

(assert (=> b!28499 (= res!16984 (not (contains!276 lt!10829 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1461)

(declare-fun minValue!1443 () V!1461)

(declare-fun getCurrentListMap!166 (array!1689 array!1691 (_ BitVec 32) (_ BitVec 32) V!1461 V!1461 (_ BitVec 32) Int) ListLongMap!641)

(assert (=> b!28499 (= lt!10829 (getCurrentListMap!166 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28500 () Bool)

(assert (=> b!28500 (= e!18425 tp_is_empty!1227)))

(declare-fun res!16985 () Bool)

(assert (=> start!3968 (=> (not res!16985) (not e!18428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3968 (= res!16985 (validMask!0 mask!2294))))

(assert (=> start!3968 e!18428))

(assert (=> start!3968 true))

(assert (=> start!3968 tp!4039))

(declare-fun array_inv!547 (array!1691) Bool)

(assert (=> start!3968 (and (array_inv!547 _values!1501) e!18423)))

(declare-fun array_inv!548 (array!1689) Bool)

(assert (=> start!3968 (array_inv!548 _keys!1833)))

(assert (=> start!3968 tp_is_empty!1227))

(declare-fun b!28493 () Bool)

(assert (=> b!28493 (= e!18422 (not e!18426))))

(declare-fun res!16981 () Bool)

(assert (=> b!28493 (=> res!16981 e!18426)))

(assert (=> b!28493 (= res!16981 (not (= (size!899 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10827 () (_ BitVec 32))

(assert (=> b!28493 (contains!276 lt!10829 (select (arr!798 _keys!1833) lt!10827))))

(declare-datatypes ((Unit!641 0))(
  ( (Unit!642) )
))
(declare-fun lt!10828 () Unit!641)

(declare-fun lemmaValidKeyInArrayIsInListMap!14 (array!1689 array!1691 (_ BitVec 32) (_ BitVec 32) V!1461 V!1461 (_ BitVec 32) Int) Unit!641)

(assert (=> b!28493 (= lt!10828 (lemmaValidKeyInArrayIsInListMap!14 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10827 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1689 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28493 (= lt!10827 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3968 res!16985) b!28492))

(assert (= (and b!28492 res!16982) b!28497))

(assert (= (and b!28497 res!16979) b!28495))

(assert (= (and b!28495 res!16980) b!28498))

(assert (= (and b!28498 res!16986) b!28499))

(assert (= (and b!28499 res!16984) b!28490))

(assert (= (and b!28490 res!16983) b!28493))

(assert (= (and b!28493 (not res!16981)) b!28491))

(assert (= (and b!28494 condMapEmpty!1369) mapIsEmpty!1369))

(assert (= (and b!28494 (not condMapEmpty!1369)) mapNonEmpty!1369))

(get-info :version)

(assert (= (and mapNonEmpty!1369 ((_ is ValueCellFull!414) mapValue!1369)) b!28500))

(assert (= (and b!28494 ((_ is ValueCellFull!414) mapDefault!1369)) b!28496))

(assert (= start!3968 b!28494))

(declare-fun m!22687 () Bool)

(assert (=> b!28499 m!22687))

(declare-fun m!22689 () Bool)

(assert (=> b!28499 m!22689))

(declare-fun m!22691 () Bool)

(assert (=> b!28493 m!22691))

(assert (=> b!28493 m!22691))

(declare-fun m!22693 () Bool)

(assert (=> b!28493 m!22693))

(declare-fun m!22695 () Bool)

(assert (=> b!28493 m!22695))

(declare-fun m!22697 () Bool)

(assert (=> b!28493 m!22697))

(declare-fun m!22699 () Bool)

(assert (=> b!28490 m!22699))

(declare-fun m!22701 () Bool)

(assert (=> b!28497 m!22701))

(declare-fun m!22703 () Bool)

(assert (=> b!28495 m!22703))

(declare-fun m!22705 () Bool)

(assert (=> mapNonEmpty!1369 m!22705))

(declare-fun m!22707 () Bool)

(assert (=> start!3968 m!22707))

(declare-fun m!22709 () Bool)

(assert (=> start!3968 m!22709))

(declare-fun m!22711 () Bool)

(assert (=> start!3968 m!22711))

(declare-fun m!22713 () Bool)

(assert (=> b!28498 m!22713))

(declare-fun m!22715 () Bool)

(assert (=> b!28491 m!22715))

(check-sat (not b_next!873) (not b!28490) (not start!3968) (not b!28498) (not b!28493) b_and!1683 (not mapNonEmpty!1369) (not b!28491) (not b!28497) (not b!28495) (not b!28499) tp_is_empty!1227)
(check-sat b_and!1683 (not b_next!873))
