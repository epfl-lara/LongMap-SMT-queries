; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3968 () Bool)

(assert start!3968)

(declare-fun b_free!877 () Bool)

(declare-fun b_next!877 () Bool)

(assert (=> start!3968 (= b_free!877 (not b_next!877))))

(declare-fun tp!4051 () Bool)

(declare-fun b_and!1677 () Bool)

(assert (=> start!3968 (= tp!4051 b_and!1677)))

(declare-fun b!28484 () Bool)

(declare-fun e!18413 () Bool)

(declare-fun tp_is_empty!1231 () Bool)

(assert (=> b!28484 (= e!18413 tp_is_empty!1231)))

(declare-fun b!28485 () Bool)

(declare-fun res!16987 () Bool)

(declare-fun e!18414 () Bool)

(assert (=> b!28485 (=> (not res!16987) (not e!18414))))

(declare-datatypes ((V!1467 0))(
  ( (V!1468 (val!642 Int)) )
))
(declare-datatypes ((ValueCell!416 0))(
  ( (ValueCellFull!416 (v!1731 V!1467)) (EmptyCell!416) )
))
(declare-datatypes ((array!1677 0))(
  ( (array!1678 (arr!792 (Array (_ BitVec 32) ValueCell!416)) (size!893 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1677)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1679 0))(
  ( (array!1680 (arr!793 (Array (_ BitVec 32) (_ BitVec 64))) (size!894 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1679)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!28485 (= res!16987 (and (= (size!893 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!894 _keys!1833) (size!893 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28486 () Bool)

(declare-fun e!18415 () Bool)

(assert (=> b!28486 (= e!18415 tp_is_empty!1231)))

(declare-fun b!28487 () Bool)

(declare-fun res!16988 () Bool)

(assert (=> b!28487 (=> (not res!16988) (not e!18414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1679 (_ BitVec 32)) Bool)

(assert (=> b!28487 (= res!16988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28488 () Bool)

(declare-fun e!18417 () Bool)

(declare-fun mapRes!1375 () Bool)

(assert (=> b!28488 (= e!18417 (and e!18415 mapRes!1375))))

(declare-fun condMapEmpty!1375 () Bool)

(declare-fun mapDefault!1375 () ValueCell!416)

(assert (=> b!28488 (= condMapEmpty!1375 (= (arr!792 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!416)) mapDefault!1375)))))

(declare-fun b!28489 () Bool)

(declare-fun e!18418 () Bool)

(assert (=> b!28489 (= e!18414 e!18418)))

(declare-fun res!16993 () Bool)

(assert (=> b!28489 (=> (not res!16993) (not e!18418))))

(declare-datatypes ((tuple2!1062 0))(
  ( (tuple2!1063 (_1!542 (_ BitVec 64)) (_2!542 V!1467)) )
))
(declare-datatypes ((List!656 0))(
  ( (Nil!653) (Cons!652 (h!1219 tuple2!1062) (t!3343 List!656)) )
))
(declare-datatypes ((ListLongMap!633 0))(
  ( (ListLongMap!634 (toList!332 List!656)) )
))
(declare-fun lt!10808 () ListLongMap!633)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!274 (ListLongMap!633 (_ BitVec 64)) Bool)

(assert (=> b!28489 (= res!16993 (not (contains!274 lt!10808 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1467)

(declare-fun minValue!1443 () V!1467)

(declare-fun getCurrentListMap!161 (array!1679 array!1677 (_ BitVec 32) (_ BitVec 32) V!1467 V!1467 (_ BitVec 32) Int) ListLongMap!633)

(assert (=> b!28489 (= lt!10808 (getCurrentListMap!161 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28490 () Bool)

(declare-fun e!18416 () Bool)

(assert (=> b!28490 (= e!18418 (not e!18416))))

(declare-fun res!16992 () Bool)

(assert (=> b!28490 (=> res!16992 e!18416)))

(assert (=> b!28490 (= res!16992 (not (= (size!894 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10807 () (_ BitVec 32))

(assert (=> b!28490 (contains!274 lt!10808 (select (arr!793 _keys!1833) lt!10807))))

(declare-datatypes ((Unit!657 0))(
  ( (Unit!658) )
))
(declare-fun lt!10806 () Unit!657)

(declare-fun lemmaValidKeyInArrayIsInListMap!18 (array!1679 array!1677 (_ BitVec 32) (_ BitVec 32) V!1467 V!1467 (_ BitVec 32) Int) Unit!657)

(assert (=> b!28490 (= lt!10806 (lemmaValidKeyInArrayIsInListMap!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10807 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1679 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28490 (= lt!10807 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1375 () Bool)

(declare-fun tp!4050 () Bool)

(assert (=> mapNonEmpty!1375 (= mapRes!1375 (and tp!4050 e!18413))))

(declare-fun mapKey!1375 () (_ BitVec 32))

(declare-fun mapValue!1375 () ValueCell!416)

(declare-fun mapRest!1375 () (Array (_ BitVec 32) ValueCell!416))

(assert (=> mapNonEmpty!1375 (= (arr!792 _values!1501) (store mapRest!1375 mapKey!1375 mapValue!1375))))

(declare-fun b!28491 () Bool)

(declare-fun res!16989 () Bool)

(assert (=> b!28491 (=> (not res!16989) (not e!18414))))

(declare-datatypes ((List!657 0))(
  ( (Nil!654) (Cons!653 (h!1220 (_ BitVec 64)) (t!3344 List!657)) )
))
(declare-fun arrayNoDuplicates!0 (array!1679 (_ BitVec 32) List!657) Bool)

(assert (=> b!28491 (= res!16989 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!654))))

(declare-fun b!28492 () Bool)

(declare-fun res!16994 () Bool)

(assert (=> b!28492 (=> (not res!16994) (not e!18414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28492 (= res!16994 (validKeyInArray!0 k0!1304))))

(declare-fun b!28493 () Bool)

(declare-fun res!16990 () Bool)

(assert (=> b!28493 (=> (not res!16990) (not e!18418))))

(declare-fun arrayContainsKey!0 (array!1679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28493 (= res!16990 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28494 () Bool)

(assert (=> b!28494 (= e!18416 true)))

(declare-datatypes ((SeekEntryResult!69 0))(
  ( (MissingZero!69 (index!2398 (_ BitVec 32))) (Found!69 (index!2399 (_ BitVec 32))) (Intermediate!69 (undefined!881 Bool) (index!2400 (_ BitVec 32)) (x!6331 (_ BitVec 32))) (Undefined!69) (MissingVacant!69 (index!2401 (_ BitVec 32))) )
))
(declare-fun lt!10809 () SeekEntryResult!69)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1679 (_ BitVec 32)) SeekEntryResult!69)

(assert (=> b!28494 (= lt!10809 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!16991 () Bool)

(assert (=> start!3968 (=> (not res!16991) (not e!18414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3968 (= res!16991 (validMask!0 mask!2294))))

(assert (=> start!3968 e!18414))

(assert (=> start!3968 true))

(assert (=> start!3968 tp!4051))

(declare-fun array_inv!549 (array!1677) Bool)

(assert (=> start!3968 (and (array_inv!549 _values!1501) e!18417)))

(declare-fun array_inv!550 (array!1679) Bool)

(assert (=> start!3968 (array_inv!550 _keys!1833)))

(assert (=> start!3968 tp_is_empty!1231))

(declare-fun mapIsEmpty!1375 () Bool)

(assert (=> mapIsEmpty!1375 mapRes!1375))

(assert (= (and start!3968 res!16991) b!28485))

(assert (= (and b!28485 res!16987) b!28487))

(assert (= (and b!28487 res!16988) b!28491))

(assert (= (and b!28491 res!16989) b!28492))

(assert (= (and b!28492 res!16994) b!28489))

(assert (= (and b!28489 res!16993) b!28493))

(assert (= (and b!28493 res!16990) b!28490))

(assert (= (and b!28490 (not res!16992)) b!28494))

(assert (= (and b!28488 condMapEmpty!1375) mapIsEmpty!1375))

(assert (= (and b!28488 (not condMapEmpty!1375)) mapNonEmpty!1375))

(get-info :version)

(assert (= (and mapNonEmpty!1375 ((_ is ValueCellFull!416) mapValue!1375)) b!28484))

(assert (= (and b!28488 ((_ is ValueCellFull!416) mapDefault!1375)) b!28486))

(assert (= start!3968 b!28488))

(declare-fun m!22595 () Bool)

(assert (=> b!28489 m!22595))

(declare-fun m!22597 () Bool)

(assert (=> b!28489 m!22597))

(declare-fun m!22599 () Bool)

(assert (=> b!28491 m!22599))

(declare-fun m!22601 () Bool)

(assert (=> b!28487 m!22601))

(declare-fun m!22603 () Bool)

(assert (=> start!3968 m!22603))

(declare-fun m!22605 () Bool)

(assert (=> start!3968 m!22605))

(declare-fun m!22607 () Bool)

(assert (=> start!3968 m!22607))

(declare-fun m!22609 () Bool)

(assert (=> b!28490 m!22609))

(assert (=> b!28490 m!22609))

(declare-fun m!22611 () Bool)

(assert (=> b!28490 m!22611))

(declare-fun m!22613 () Bool)

(assert (=> b!28490 m!22613))

(declare-fun m!22615 () Bool)

(assert (=> b!28490 m!22615))

(declare-fun m!22617 () Bool)

(assert (=> mapNonEmpty!1375 m!22617))

(declare-fun m!22619 () Bool)

(assert (=> b!28494 m!22619))

(declare-fun m!22621 () Bool)

(assert (=> b!28492 m!22621))

(declare-fun m!22623 () Bool)

(assert (=> b!28493 m!22623))

(check-sat (not b!28489) b_and!1677 tp_is_empty!1231 (not b!28491) (not start!3968) (not mapNonEmpty!1375) (not b!28492) (not b!28493) (not b!28490) (not b_next!877) (not b!28487) (not b!28494))
(check-sat b_and!1677 (not b_next!877))
