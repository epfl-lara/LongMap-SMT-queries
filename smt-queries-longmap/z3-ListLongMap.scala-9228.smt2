; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110940 () Bool)

(assert start!110940)

(declare-fun b_free!29551 () Bool)

(declare-fun b_next!29551 () Bool)

(assert (=> start!110940 (= b_free!29551 (not b_next!29551))))

(declare-fun tp!103975 () Bool)

(declare-fun b_and!47761 () Bool)

(assert (=> start!110940 (= tp!103975 b_and!47761)))

(declare-fun b!1311562 () Bool)

(declare-fun res!870346 () Bool)

(declare-fun e!748336 () Bool)

(assert (=> b!1311562 (=> (not res!870346) (not e!748336))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311562 (= res!870346 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311563 () Bool)

(declare-fun e!748338 () Bool)

(declare-fun tp_is_empty!35281 () Bool)

(assert (=> b!1311563 (= e!748338 tp_is_empty!35281)))

(declare-fun b!1311564 () Bool)

(declare-fun e!748339 () Bool)

(declare-fun e!748340 () Bool)

(declare-fun mapRes!54550 () Bool)

(assert (=> b!1311564 (= e!748339 (and e!748340 mapRes!54550))))

(declare-fun condMapEmpty!54550 () Bool)

(declare-datatypes ((V!52145 0))(
  ( (V!52146 (val!17715 Int)) )
))
(declare-datatypes ((ValueCell!16742 0))(
  ( (ValueCellFull!16742 (v!20337 V!52145)) (EmptyCell!16742) )
))
(declare-datatypes ((array!87615 0))(
  ( (array!87616 (arr!42283 (Array (_ BitVec 32) ValueCell!16742)) (size!42834 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87615)

(declare-fun mapDefault!54550 () ValueCell!16742)

(assert (=> b!1311564 (= condMapEmpty!54550 (= (arr!42283 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16742)) mapDefault!54550)))))

(declare-fun mapNonEmpty!54550 () Bool)

(declare-fun tp!103974 () Bool)

(assert (=> mapNonEmpty!54550 (= mapRes!54550 (and tp!103974 e!748338))))

(declare-fun mapRest!54550 () (Array (_ BitVec 32) ValueCell!16742))

(declare-fun mapValue!54550 () ValueCell!16742)

(declare-fun mapKey!54550 () (_ BitVec 32))

(assert (=> mapNonEmpty!54550 (= (arr!42283 _values!1354) (store mapRest!54550 mapKey!54550 mapValue!54550))))

(declare-fun b!1311565 () Bool)

(declare-fun res!870345 () Bool)

(assert (=> b!1311565 (=> (not res!870345) (not e!748336))))

(declare-datatypes ((array!87617 0))(
  ( (array!87618 (arr!42284 (Array (_ BitVec 32) (_ BitVec 64))) (size!42835 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87617)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311565 (= res!870345 (not (= (select (arr!42284 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!870347 () Bool)

(assert (=> start!110940 (=> (not res!870347) (not e!748336))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110940 (= res!870347 (validMask!0 mask!2040))))

(assert (=> start!110940 e!748336))

(assert (=> start!110940 tp!103975))

(declare-fun array_inv!32223 (array!87617) Bool)

(assert (=> start!110940 (array_inv!32223 _keys!1628)))

(assert (=> start!110940 true))

(assert (=> start!110940 tp_is_empty!35281))

(declare-fun array_inv!32224 (array!87615) Bool)

(assert (=> start!110940 (and (array_inv!32224 _values!1354) e!748339)))

(declare-fun b!1311566 () Bool)

(declare-fun res!870352 () Bool)

(assert (=> b!1311566 (=> (not res!870352) (not e!748336))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52145)

(declare-fun zeroValue!1296 () V!52145)

(declare-datatypes ((tuple2!22866 0))(
  ( (tuple2!22867 (_1!11444 (_ BitVec 64)) (_2!11444 V!52145)) )
))
(declare-datatypes ((List!30019 0))(
  ( (Nil!30016) (Cons!30015 (h!31233 tuple2!22866) (t!43617 List!30019)) )
))
(declare-datatypes ((ListLongMap!20531 0))(
  ( (ListLongMap!20532 (toList!10281 List!30019)) )
))
(declare-fun contains!8443 (ListLongMap!20531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5285 (array!87617 array!87615 (_ BitVec 32) (_ BitVec 32) V!52145 V!52145 (_ BitVec 32) Int) ListLongMap!20531)

(assert (=> b!1311566 (= res!870352 (contains!8443 (getCurrentListMap!5285 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311567 () Bool)

(declare-fun res!870350 () Bool)

(assert (=> b!1311567 (=> (not res!870350) (not e!748336))))

(assert (=> b!1311567 (= res!870350 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42835 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311568 () Bool)

(declare-fun res!870348 () Bool)

(assert (=> b!1311568 (=> (not res!870348) (not e!748336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87617 (_ BitVec 32)) Bool)

(assert (=> b!1311568 (= res!870348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311569 () Bool)

(assert (=> b!1311569 (= e!748340 tp_is_empty!35281)))

(declare-fun b!1311570 () Bool)

(assert (=> b!1311570 (= e!748336 (not true))))

(assert (=> b!1311570 (contains!8443 (getCurrentListMap!5285 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43305 0))(
  ( (Unit!43306) )
))
(declare-fun lt!585821 () Unit!43305)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!14 (array!87617 array!87615 (_ BitVec 32) (_ BitVec 32) V!52145 V!52145 (_ BitVec 64) (_ BitVec 32) Int) Unit!43305)

(assert (=> b!1311570 (= lt!585821 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311571 () Bool)

(declare-fun res!870349 () Bool)

(assert (=> b!1311571 (=> (not res!870349) (not e!748336))))

(assert (=> b!1311571 (= res!870349 (and (= (size!42834 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42835 _keys!1628) (size!42834 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311572 () Bool)

(declare-fun res!870351 () Bool)

(assert (=> b!1311572 (=> (not res!870351) (not e!748336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311572 (= res!870351 (validKeyInArray!0 (select (arr!42284 _keys!1628) from!2020)))))

(declare-fun b!1311573 () Bool)

(declare-fun res!870353 () Bool)

(assert (=> b!1311573 (=> (not res!870353) (not e!748336))))

(declare-datatypes ((List!30020 0))(
  ( (Nil!30017) (Cons!30016 (h!31234 (_ BitVec 64)) (t!43618 List!30020)) )
))
(declare-fun arrayNoDuplicates!0 (array!87617 (_ BitVec 32) List!30020) Bool)

(assert (=> b!1311573 (= res!870353 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30017))))

(declare-fun mapIsEmpty!54550 () Bool)

(assert (=> mapIsEmpty!54550 mapRes!54550))

(assert (= (and start!110940 res!870347) b!1311571))

(assert (= (and b!1311571 res!870349) b!1311568))

(assert (= (and b!1311568 res!870348) b!1311573))

(assert (= (and b!1311573 res!870353) b!1311567))

(assert (= (and b!1311567 res!870350) b!1311566))

(assert (= (and b!1311566 res!870352) b!1311565))

(assert (= (and b!1311565 res!870345) b!1311572))

(assert (= (and b!1311572 res!870351) b!1311562))

(assert (= (and b!1311562 res!870346) b!1311570))

(assert (= (and b!1311564 condMapEmpty!54550) mapIsEmpty!54550))

(assert (= (and b!1311564 (not condMapEmpty!54550)) mapNonEmpty!54550))

(get-info :version)

(assert (= (and mapNonEmpty!54550 ((_ is ValueCellFull!16742) mapValue!54550)) b!1311563))

(assert (= (and b!1311564 ((_ is ValueCellFull!16742) mapDefault!54550)) b!1311569))

(assert (= start!110940 b!1311564))

(declare-fun m!1201691 () Bool)

(assert (=> b!1311565 m!1201691))

(declare-fun m!1201693 () Bool)

(assert (=> b!1311566 m!1201693))

(assert (=> b!1311566 m!1201693))

(declare-fun m!1201695 () Bool)

(assert (=> b!1311566 m!1201695))

(declare-fun m!1201697 () Bool)

(assert (=> b!1311568 m!1201697))

(declare-fun m!1201699 () Bool)

(assert (=> b!1311570 m!1201699))

(assert (=> b!1311570 m!1201699))

(declare-fun m!1201701 () Bool)

(assert (=> b!1311570 m!1201701))

(declare-fun m!1201703 () Bool)

(assert (=> b!1311570 m!1201703))

(declare-fun m!1201705 () Bool)

(assert (=> b!1311573 m!1201705))

(declare-fun m!1201707 () Bool)

(assert (=> start!110940 m!1201707))

(declare-fun m!1201709 () Bool)

(assert (=> start!110940 m!1201709))

(declare-fun m!1201711 () Bool)

(assert (=> start!110940 m!1201711))

(assert (=> b!1311572 m!1201691))

(assert (=> b!1311572 m!1201691))

(declare-fun m!1201713 () Bool)

(assert (=> b!1311572 m!1201713))

(declare-fun m!1201715 () Bool)

(assert (=> mapNonEmpty!54550 m!1201715))

(check-sat (not b!1311572) (not b!1311573) (not mapNonEmpty!54550) (not b!1311568) (not b_next!29551) (not start!110940) b_and!47761 (not b!1311570) (not b!1311566) tp_is_empty!35281)
(check-sat b_and!47761 (not b_next!29551))
