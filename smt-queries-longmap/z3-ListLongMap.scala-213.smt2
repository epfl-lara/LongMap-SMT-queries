; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3950 () Bool)

(assert start!3950)

(declare-fun b_free!865 () Bool)

(declare-fun b_next!865 () Bool)

(assert (=> start!3950 (= b_free!865 (not b_next!865))))

(declare-fun tp!4014 () Bool)

(declare-fun b_and!1669 () Bool)

(assert (=> start!3950 (= tp!4014 b_and!1669)))

(declare-fun mapIsEmpty!1357 () Bool)

(declare-fun mapRes!1357 () Bool)

(assert (=> mapIsEmpty!1357 mapRes!1357))

(declare-fun b!28304 () Bool)

(declare-fun e!18295 () Bool)

(declare-fun tp_is_empty!1219 () Bool)

(assert (=> b!28304 (= e!18295 tp_is_empty!1219)))

(declare-fun b!28305 () Bool)

(declare-fun e!18299 () Bool)

(assert (=> b!28305 (= e!18299 tp_is_empty!1219)))

(declare-fun b!28306 () Bool)

(declare-fun res!16857 () Bool)

(declare-fun e!18298 () Bool)

(assert (=> b!28306 (=> (not res!16857) (not e!18298))))

(declare-datatypes ((V!1451 0))(
  ( (V!1452 (val!636 Int)) )
))
(declare-datatypes ((ValueCell!410 0))(
  ( (ValueCellFull!410 (v!1724 V!1451)) (EmptyCell!410) )
))
(declare-datatypes ((array!1651 0))(
  ( (array!1652 (arr!779 (Array (_ BitVec 32) ValueCell!410)) (size!880 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1651)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1653 0))(
  ( (array!1654 (arr!780 (Array (_ BitVec 32) (_ BitVec 64))) (size!881 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1653)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!28306 (= res!16857 (and (= (size!880 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!881 _keys!1833) (size!880 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28307 () Bool)

(declare-fun res!16851 () Bool)

(declare-fun e!18300 () Bool)

(assert (=> b!28307 (=> (not res!16851) (not e!18300))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28307 (= res!16851 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16858 () Bool)

(assert (=> start!3950 (=> (not res!16858) (not e!18298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3950 (= res!16858 (validMask!0 mask!2294))))

(assert (=> start!3950 e!18298))

(assert (=> start!3950 true))

(assert (=> start!3950 tp!4014))

(declare-fun e!18296 () Bool)

(declare-fun array_inv!547 (array!1651) Bool)

(assert (=> start!3950 (and (array_inv!547 _values!1501) e!18296)))

(declare-fun array_inv!548 (array!1653) Bool)

(assert (=> start!3950 (array_inv!548 _keys!1833)))

(assert (=> start!3950 tp_is_empty!1219))

(declare-fun b!28308 () Bool)

(declare-fun res!16854 () Bool)

(assert (=> b!28308 (=> (not res!16854) (not e!18298))))

(declare-datatypes ((List!657 0))(
  ( (Nil!654) (Cons!653 (h!1220 (_ BitVec 64)) (t!3343 List!657)) )
))
(declare-fun arrayNoDuplicates!0 (array!1653 (_ BitVec 32) List!657) Bool)

(assert (=> b!28308 (= res!16854 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!654))))

(declare-fun mapNonEmpty!1357 () Bool)

(declare-fun tp!4015 () Bool)

(assert (=> mapNonEmpty!1357 (= mapRes!1357 (and tp!4015 e!18295))))

(declare-fun mapValue!1357 () ValueCell!410)

(declare-fun mapKey!1357 () (_ BitVec 32))

(declare-fun mapRest!1357 () (Array (_ BitVec 32) ValueCell!410))

(assert (=> mapNonEmpty!1357 (= (arr!779 _values!1501) (store mapRest!1357 mapKey!1357 mapValue!1357))))

(declare-fun b!28309 () Bool)

(declare-fun e!18301 () Bool)

(assert (=> b!28309 (= e!18300 (not e!18301))))

(declare-fun res!16852 () Bool)

(assert (=> b!28309 (=> res!16852 e!18301)))

(assert (=> b!28309 (= res!16852 (not (= (size!881 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1070 0))(
  ( (tuple2!1071 (_1!546 (_ BitVec 64)) (_2!546 V!1451)) )
))
(declare-datatypes ((List!658 0))(
  ( (Nil!655) (Cons!654 (h!1221 tuple2!1070) (t!3344 List!658)) )
))
(declare-datatypes ((ListLongMap!635 0))(
  ( (ListLongMap!636 (toList!333 List!658)) )
))
(declare-fun lt!10774 () ListLongMap!635)

(declare-fun lt!10776 () (_ BitVec 32))

(declare-fun contains!274 (ListLongMap!635 (_ BitVec 64)) Bool)

(assert (=> b!28309 (contains!274 lt!10774 (select (arr!780 _keys!1833) lt!10776))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!646 0))(
  ( (Unit!647) )
))
(declare-fun lt!10775 () Unit!646)

(declare-fun zeroValue!1443 () V!1451)

(declare-fun minValue!1443 () V!1451)

(declare-fun lemmaValidKeyInArrayIsInListMap!13 (array!1653 array!1651 (_ BitVec 32) (_ BitVec 32) V!1451 V!1451 (_ BitVec 32) Int) Unit!646)

(assert (=> b!28309 (= lt!10775 (lemmaValidKeyInArrayIsInListMap!13 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10776 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1653 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28309 (= lt!10776 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28310 () Bool)

(declare-fun res!16853 () Bool)

(assert (=> b!28310 (=> (not res!16853) (not e!18298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1653 (_ BitVec 32)) Bool)

(assert (=> b!28310 (= res!16853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28311 () Bool)

(assert (=> b!28311 (= e!18296 (and e!18299 mapRes!1357))))

(declare-fun condMapEmpty!1357 () Bool)

(declare-fun mapDefault!1357 () ValueCell!410)

(assert (=> b!28311 (= condMapEmpty!1357 (= (arr!779 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!410)) mapDefault!1357)))))

(declare-fun b!28312 () Bool)

(assert (=> b!28312 (= e!18298 e!18300)))

(declare-fun res!16856 () Bool)

(assert (=> b!28312 (=> (not res!16856) (not e!18300))))

(assert (=> b!28312 (= res!16856 (not (contains!274 lt!10774 k0!1304)))))

(declare-fun getCurrentListMap!163 (array!1653 array!1651 (_ BitVec 32) (_ BitVec 32) V!1451 V!1451 (_ BitVec 32) Int) ListLongMap!635)

(assert (=> b!28312 (= lt!10774 (getCurrentListMap!163 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28313 () Bool)

(declare-fun res!16855 () Bool)

(assert (=> b!28313 (=> (not res!16855) (not e!18298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28313 (= res!16855 (validKeyInArray!0 k0!1304))))

(declare-fun b!28314 () Bool)

(assert (=> b!28314 (= e!18301 true)))

(declare-datatypes ((SeekEntryResult!66 0))(
  ( (MissingZero!66 (index!2386 (_ BitVec 32))) (Found!66 (index!2387 (_ BitVec 32))) (Intermediate!66 (undefined!878 Bool) (index!2388 (_ BitVec 32)) (x!6312 (_ BitVec 32))) (Undefined!66) (MissingVacant!66 (index!2389 (_ BitVec 32))) )
))
(declare-fun lt!10777 () SeekEntryResult!66)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1653 (_ BitVec 32)) SeekEntryResult!66)

(assert (=> b!28314 (= lt!10777 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(assert (= (and start!3950 res!16858) b!28306))

(assert (= (and b!28306 res!16857) b!28310))

(assert (= (and b!28310 res!16853) b!28308))

(assert (= (and b!28308 res!16854) b!28313))

(assert (= (and b!28313 res!16855) b!28312))

(assert (= (and b!28312 res!16856) b!28307))

(assert (= (and b!28307 res!16851) b!28309))

(assert (= (and b!28309 (not res!16852)) b!28314))

(assert (= (and b!28311 condMapEmpty!1357) mapIsEmpty!1357))

(assert (= (and b!28311 (not condMapEmpty!1357)) mapNonEmpty!1357))

(get-info :version)

(assert (= (and mapNonEmpty!1357 ((_ is ValueCellFull!410) mapValue!1357)) b!28304))

(assert (= (and b!28311 ((_ is ValueCellFull!410) mapDefault!1357)) b!28305))

(assert (= start!3950 b!28311))

(declare-fun m!22497 () Bool)

(assert (=> b!28310 m!22497))

(declare-fun m!22499 () Bool)

(assert (=> b!28313 m!22499))

(declare-fun m!22501 () Bool)

(assert (=> b!28314 m!22501))

(declare-fun m!22503 () Bool)

(assert (=> b!28307 m!22503))

(declare-fun m!22505 () Bool)

(assert (=> b!28312 m!22505))

(declare-fun m!22507 () Bool)

(assert (=> b!28312 m!22507))

(declare-fun m!22509 () Bool)

(assert (=> start!3950 m!22509))

(declare-fun m!22511 () Bool)

(assert (=> start!3950 m!22511))

(declare-fun m!22513 () Bool)

(assert (=> start!3950 m!22513))

(declare-fun m!22515 () Bool)

(assert (=> b!28308 m!22515))

(declare-fun m!22517 () Bool)

(assert (=> b!28309 m!22517))

(assert (=> b!28309 m!22517))

(declare-fun m!22519 () Bool)

(assert (=> b!28309 m!22519))

(declare-fun m!22521 () Bool)

(assert (=> b!28309 m!22521))

(declare-fun m!22523 () Bool)

(assert (=> b!28309 m!22523))

(declare-fun m!22525 () Bool)

(assert (=> mapNonEmpty!1357 m!22525))

(check-sat (not b!28310) (not mapNonEmpty!1357) (not b!28307) (not b!28314) (not b_next!865) tp_is_empty!1219 (not b!28308) b_and!1669 (not b!28312) (not b!28309) (not start!3950) (not b!28313))
(check-sat b_and!1669 (not b_next!865))
