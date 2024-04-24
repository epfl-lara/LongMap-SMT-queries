; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3956 () Bool)

(assert start!3956)

(declare-fun b_free!865 () Bool)

(declare-fun b_next!865 () Bool)

(assert (=> start!3956 (= b_free!865 (not b_next!865))))

(declare-fun tp!4014 () Bool)

(declare-fun b_and!1665 () Bool)

(assert (=> start!3956 (= tp!4014 b_and!1665)))

(declare-fun b!28286 () Bool)

(declare-fun res!16844 () Bool)

(declare-fun e!18290 () Bool)

(assert (=> b!28286 (=> (not res!16844) (not e!18290))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28286 (= res!16844 (validKeyInArray!0 k0!1304))))

(declare-fun b!28287 () Bool)

(declare-fun e!18287 () Bool)

(assert (=> b!28287 (= e!18287 true)))

(declare-datatypes ((SeekEntryResult!65 0))(
  ( (MissingZero!65 (index!2382 (_ BitVec 32))) (Found!65 (index!2383 (_ BitVec 32))) (Intermediate!65 (undefined!877 Bool) (index!2384 (_ BitVec 32)) (x!6311 (_ BitVec 32))) (Undefined!65) (MissingVacant!65 (index!2385 (_ BitVec 32))) )
))
(declare-fun lt!10734 () SeekEntryResult!65)

(declare-datatypes ((array!1655 0))(
  ( (array!1656 (arr!781 (Array (_ BitVec 32) (_ BitVec 64))) (size!882 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1655)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1655 (_ BitVec 32)) SeekEntryResult!65)

(assert (=> b!28287 (= lt!10734 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28288 () Bool)

(declare-fun e!18289 () Bool)

(assert (=> b!28288 (= e!18289 (not e!18287))))

(declare-fun res!16846 () Bool)

(assert (=> b!28288 (=> res!16846 e!18287)))

(assert (=> b!28288 (= res!16846 (not (= (size!882 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1451 0))(
  ( (V!1452 (val!636 Int)) )
))
(declare-datatypes ((tuple2!1052 0))(
  ( (tuple2!1053 (_1!537 (_ BitVec 64)) (_2!537 V!1451)) )
))
(declare-datatypes ((List!647 0))(
  ( (Nil!644) (Cons!643 (h!1210 tuple2!1052) (t!3334 List!647)) )
))
(declare-datatypes ((ListLongMap!623 0))(
  ( (ListLongMap!624 (toList!327 List!647)) )
))
(declare-fun lt!10735 () ListLongMap!623)

(declare-fun lt!10737 () (_ BitVec 32))

(declare-fun contains!269 (ListLongMap!623 (_ BitVec 64)) Bool)

(assert (=> b!28288 (contains!269 lt!10735 (select (arr!781 _keys!1833) lt!10737))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!410 0))(
  ( (ValueCellFull!410 (v!1725 V!1451)) (EmptyCell!410) )
))
(declare-datatypes ((array!1657 0))(
  ( (array!1658 (arr!782 (Array (_ BitVec 32) ValueCell!410)) (size!883 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1657)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!647 0))(
  ( (Unit!648) )
))
(declare-fun lt!10736 () Unit!647)

(declare-fun zeroValue!1443 () V!1451)

(declare-fun minValue!1443 () V!1451)

(declare-fun lemmaValidKeyInArrayIsInListMap!13 (array!1655 array!1657 (_ BitVec 32) (_ BitVec 32) V!1451 V!1451 (_ BitVec 32) Int) Unit!647)

(assert (=> b!28288 (= lt!10736 (lemmaValidKeyInArrayIsInListMap!13 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10737 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1655 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28288 (= lt!10737 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28289 () Bool)

(declare-fun res!16847 () Bool)

(assert (=> b!28289 (=> (not res!16847) (not e!18290))))

(assert (=> b!28289 (= res!16847 (and (= (size!883 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!882 _keys!1833) (size!883 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!16843 () Bool)

(assert (=> start!3956 (=> (not res!16843) (not e!18290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3956 (= res!16843 (validMask!0 mask!2294))))

(assert (=> start!3956 e!18290))

(assert (=> start!3956 true))

(assert (=> start!3956 tp!4014))

(declare-fun e!18291 () Bool)

(declare-fun array_inv!541 (array!1657) Bool)

(assert (=> start!3956 (and (array_inv!541 _values!1501) e!18291)))

(declare-fun array_inv!542 (array!1655) Bool)

(assert (=> start!3956 (array_inv!542 _keys!1833)))

(declare-fun tp_is_empty!1219 () Bool)

(assert (=> start!3956 tp_is_empty!1219))

(declare-fun b!28290 () Bool)

(declare-fun e!18288 () Bool)

(declare-fun mapRes!1357 () Bool)

(assert (=> b!28290 (= e!18291 (and e!18288 mapRes!1357))))

(declare-fun condMapEmpty!1357 () Bool)

(declare-fun mapDefault!1357 () ValueCell!410)

(assert (=> b!28290 (= condMapEmpty!1357 (= (arr!782 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!410)) mapDefault!1357)))))

(declare-fun b!28291 () Bool)

(assert (=> b!28291 (= e!18288 tp_is_empty!1219)))

(declare-fun b!28292 () Bool)

(declare-fun res!16850 () Bool)

(assert (=> b!28292 (=> (not res!16850) (not e!18290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1655 (_ BitVec 32)) Bool)

(assert (=> b!28292 (= res!16850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28293 () Bool)

(declare-fun res!16848 () Bool)

(assert (=> b!28293 (=> (not res!16848) (not e!18290))))

(declare-datatypes ((List!648 0))(
  ( (Nil!645) (Cons!644 (h!1211 (_ BitVec 64)) (t!3335 List!648)) )
))
(declare-fun arrayNoDuplicates!0 (array!1655 (_ BitVec 32) List!648) Bool)

(assert (=> b!28293 (= res!16848 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!645))))

(declare-fun b!28294 () Bool)

(declare-fun e!18292 () Bool)

(assert (=> b!28294 (= e!18292 tp_is_empty!1219)))

(declare-fun mapNonEmpty!1357 () Bool)

(declare-fun tp!4015 () Bool)

(assert (=> mapNonEmpty!1357 (= mapRes!1357 (and tp!4015 e!18292))))

(declare-fun mapValue!1357 () ValueCell!410)

(declare-fun mapKey!1357 () (_ BitVec 32))

(declare-fun mapRest!1357 () (Array (_ BitVec 32) ValueCell!410))

(assert (=> mapNonEmpty!1357 (= (arr!782 _values!1501) (store mapRest!1357 mapKey!1357 mapValue!1357))))

(declare-fun b!28295 () Bool)

(declare-fun res!16845 () Bool)

(assert (=> b!28295 (=> (not res!16845) (not e!18289))))

(declare-fun arrayContainsKey!0 (array!1655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28295 (= res!16845 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28296 () Bool)

(assert (=> b!28296 (= e!18290 e!18289)))

(declare-fun res!16849 () Bool)

(assert (=> b!28296 (=> (not res!16849) (not e!18289))))

(assert (=> b!28296 (= res!16849 (not (contains!269 lt!10735 k0!1304)))))

(declare-fun getCurrentListMap!157 (array!1655 array!1657 (_ BitVec 32) (_ BitVec 32) V!1451 V!1451 (_ BitVec 32) Int) ListLongMap!623)

(assert (=> b!28296 (= lt!10735 (getCurrentListMap!157 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1357 () Bool)

(assert (=> mapIsEmpty!1357 mapRes!1357))

(assert (= (and start!3956 res!16843) b!28289))

(assert (= (and b!28289 res!16847) b!28292))

(assert (= (and b!28292 res!16850) b!28293))

(assert (= (and b!28293 res!16848) b!28286))

(assert (= (and b!28286 res!16844) b!28296))

(assert (= (and b!28296 res!16849) b!28295))

(assert (= (and b!28295 res!16845) b!28288))

(assert (= (and b!28288 (not res!16846)) b!28287))

(assert (= (and b!28290 condMapEmpty!1357) mapIsEmpty!1357))

(assert (= (and b!28290 (not condMapEmpty!1357)) mapNonEmpty!1357))

(get-info :version)

(assert (= (and mapNonEmpty!1357 ((_ is ValueCellFull!410) mapValue!1357)) b!28294))

(assert (= (and b!28290 ((_ is ValueCellFull!410) mapDefault!1357)) b!28291))

(assert (= start!3956 b!28290))

(declare-fun m!22415 () Bool)

(assert (=> b!28286 m!22415))

(declare-fun m!22417 () Bool)

(assert (=> b!28293 m!22417))

(declare-fun m!22419 () Bool)

(assert (=> b!28287 m!22419))

(declare-fun m!22421 () Bool)

(assert (=> start!3956 m!22421))

(declare-fun m!22423 () Bool)

(assert (=> start!3956 m!22423))

(declare-fun m!22425 () Bool)

(assert (=> start!3956 m!22425))

(declare-fun m!22427 () Bool)

(assert (=> b!28292 m!22427))

(declare-fun m!22429 () Bool)

(assert (=> b!28296 m!22429))

(declare-fun m!22431 () Bool)

(assert (=> b!28296 m!22431))

(declare-fun m!22433 () Bool)

(assert (=> b!28288 m!22433))

(assert (=> b!28288 m!22433))

(declare-fun m!22435 () Bool)

(assert (=> b!28288 m!22435))

(declare-fun m!22437 () Bool)

(assert (=> b!28288 m!22437))

(declare-fun m!22439 () Bool)

(assert (=> b!28288 m!22439))

(declare-fun m!22441 () Bool)

(assert (=> mapNonEmpty!1357 m!22441))

(declare-fun m!22443 () Bool)

(assert (=> b!28295 m!22443))

(check-sat (not start!3956) b_and!1665 (not b!28293) (not b!28287) (not b!28286) (not b!28292) (not b!28296) (not b!28295) (not b_next!865) tp_is_empty!1219 (not mapNonEmpty!1357) (not b!28288))
(check-sat b_and!1665 (not b_next!865))
