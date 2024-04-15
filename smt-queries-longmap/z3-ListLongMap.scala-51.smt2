; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!818 () Bool)

(assert start!818)

(declare-fun b_free!211 () Bool)

(declare-fun b_next!211 () Bool)

(assert (=> start!818 (= b_free!211 (not b_next!211))))

(declare-fun tp!862 () Bool)

(declare-fun b_and!357 () Bool)

(assert (=> start!818 (= tp!862 b_and!357)))

(declare-fun mapIsEmpty!404 () Bool)

(declare-fun mapRes!404 () Bool)

(assert (=> mapIsEmpty!404 mapRes!404))

(declare-fun res!6720 () Bool)

(declare-fun e!3436 () Bool)

(assert (=> start!818 (=> (not res!6720) (not e!3436))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!818 (= res!6720 (validMask!0 mask!2250))))

(assert (=> start!818 e!3436))

(assert (=> start!818 tp!862))

(assert (=> start!818 true))

(declare-datatypes ((V!563 0))(
  ( (V!564 (val!150 Int)) )
))
(declare-datatypes ((ValueCell!128 0))(
  ( (ValueCellFull!128 (v!1241 V!563)) (EmptyCell!128) )
))
(declare-datatypes ((array!503 0))(
  ( (array!504 (arr!240 (Array (_ BitVec 32) ValueCell!128)) (size!302 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!503)

(declare-fun e!3439 () Bool)

(declare-fun array_inv!171 (array!503) Bool)

(assert (=> start!818 (and (array_inv!171 _values!1492) e!3439)))

(declare-fun tp_is_empty!289 () Bool)

(assert (=> start!818 tp_is_empty!289))

(declare-datatypes ((array!505 0))(
  ( (array!506 (arr!241 (Array (_ BitVec 32) (_ BitVec 64))) (size!303 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!505)

(declare-fun array_inv!172 (array!505) Bool)

(assert (=> start!818 (array_inv!172 _keys!1806)))

(declare-fun b!6275 () Bool)

(declare-fun e!3443 () Bool)

(assert (=> b!6275 (= e!3443 tp_is_empty!289)))

(declare-fun b!6276 () Bool)

(declare-fun e!3441 () Bool)

(assert (=> b!6276 (= e!3441 true)))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!15 0))(
  ( (MissingZero!15 (index!2179 (_ BitVec 32))) (Found!15 (index!2180 (_ BitVec 32))) (Intermediate!15 (undefined!827 Bool) (index!2181 (_ BitVec 32)) (x!2513 (_ BitVec 32))) (Undefined!15) (MissingVacant!15 (index!2182 (_ BitVec 32))) )
))
(declare-fun lt!1158 () SeekEntryResult!15)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!505 (_ BitVec 32)) SeekEntryResult!15)

(assert (=> b!6276 (= lt!1158 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6277 () Bool)

(declare-fun res!6721 () Bool)

(assert (=> b!6277 (=> (not res!6721) (not e!3436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!505 (_ BitVec 32)) Bool)

(assert (=> b!6277 (= res!6721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6278 () Bool)

(declare-fun res!6719 () Bool)

(assert (=> b!6278 (=> (not res!6719) (not e!3436))))

(declare-datatypes ((List!160 0))(
  ( (Nil!157) (Cons!156 (h!722 (_ BitVec 64)) (t!2295 List!160)) )
))
(declare-fun arrayNoDuplicates!0 (array!505 (_ BitVec 32) List!160) Bool)

(assert (=> b!6278 (= res!6719 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!157))))

(declare-fun b!6279 () Bool)

(declare-fun e!3442 () Bool)

(assert (=> b!6279 (= e!3442 tp_is_empty!289)))

(declare-fun b!6280 () Bool)

(declare-fun res!6722 () Bool)

(assert (=> b!6280 (=> (not res!6722) (not e!3436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6280 (= res!6722 (validKeyInArray!0 k0!1278))))

(declare-fun mapNonEmpty!404 () Bool)

(declare-fun tp!863 () Bool)

(assert (=> mapNonEmpty!404 (= mapRes!404 (and tp!863 e!3442))))

(declare-fun mapValue!404 () ValueCell!128)

(declare-fun mapKey!404 () (_ BitVec 32))

(declare-fun mapRest!404 () (Array (_ BitVec 32) ValueCell!128))

(assert (=> mapNonEmpty!404 (= (arr!240 _values!1492) (store mapRest!404 mapKey!404 mapValue!404))))

(declare-fun b!6281 () Bool)

(declare-fun e!3437 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6281 (= e!3437 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6282 () Bool)

(declare-fun arrayContainsKey!0 (array!505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6282 (= e!3437 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6283 () Bool)

(declare-fun res!6724 () Bool)

(assert (=> b!6283 (=> (not res!6724) (not e!3436))))

(assert (=> b!6283 (= res!6724 (and (= (size!302 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!303 _keys!1806) (size!302 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6284 () Bool)

(declare-fun e!3438 () Bool)

(assert (=> b!6284 (= e!3438 e!3441)))

(declare-fun res!6723 () Bool)

(assert (=> b!6284 (=> res!6723 e!3441)))

(assert (=> b!6284 (= res!6723 (not (= (size!303 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1155 () (_ BitVec 32))

(assert (=> b!6284 (arrayForallSeekEntryOrOpenFound!0 lt!1155 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!101 0))(
  ( (Unit!102) )
))
(declare-fun lt!1157 () Unit!101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!101)

(assert (=> b!6284 (= lt!1157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1155))))

(declare-fun arrayScanForKey!0 (array!505 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6284 (= lt!1155 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6285 () Bool)

(declare-fun res!6717 () Bool)

(assert (=> b!6285 (=> (not res!6717) (not e!3436))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!563)

(declare-fun zeroValue!1434 () V!563)

(declare-datatypes ((tuple2!150 0))(
  ( (tuple2!151 (_1!75 (_ BitVec 64)) (_2!75 V!563)) )
))
(declare-datatypes ((List!161 0))(
  ( (Nil!158) (Cons!157 (h!723 tuple2!150) (t!2296 List!161)) )
))
(declare-datatypes ((ListLongMap!155 0))(
  ( (ListLongMap!156 (toList!93 List!161)) )
))
(declare-fun contains!67 (ListLongMap!155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!52 (array!505 array!503 (_ BitVec 32) (_ BitVec 32) V!563 V!563 (_ BitVec 32) Int) ListLongMap!155)

(assert (=> b!6285 (= res!6717 (contains!67 (getCurrentListMap!52 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6286 () Bool)

(assert (=> b!6286 (= e!3439 (and e!3443 mapRes!404))))

(declare-fun condMapEmpty!404 () Bool)

(declare-fun mapDefault!404 () ValueCell!128)

(assert (=> b!6286 (= condMapEmpty!404 (= (arr!240 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!128)) mapDefault!404)))))

(declare-fun b!6287 () Bool)

(assert (=> b!6287 (= e!3436 (not e!3438))))

(declare-fun res!6718 () Bool)

(assert (=> b!6287 (=> res!6718 e!3438)))

(assert (=> b!6287 (= res!6718 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6287 e!3437))

(declare-fun c!449 () Bool)

(assert (=> b!6287 (= c!449 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1156 () Unit!101)

(declare-fun lemmaKeyInListMapIsInArray!35 (array!505 array!503 (_ BitVec 32) (_ BitVec 32) V!563 V!563 (_ BitVec 64) Int) Unit!101)

(assert (=> b!6287 (= lt!1156 (lemmaKeyInListMapIsInArray!35 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (= (and start!818 res!6720) b!6283))

(assert (= (and b!6283 res!6724) b!6277))

(assert (= (and b!6277 res!6721) b!6278))

(assert (= (and b!6278 res!6719) b!6285))

(assert (= (and b!6285 res!6717) b!6280))

(assert (= (and b!6280 res!6722) b!6287))

(assert (= (and b!6287 c!449) b!6282))

(assert (= (and b!6287 (not c!449)) b!6281))

(assert (= (and b!6287 (not res!6718)) b!6284))

(assert (= (and b!6284 (not res!6723)) b!6276))

(assert (= (and b!6286 condMapEmpty!404) mapIsEmpty!404))

(assert (= (and b!6286 (not condMapEmpty!404)) mapNonEmpty!404))

(get-info :version)

(assert (= (and mapNonEmpty!404 ((_ is ValueCellFull!128) mapValue!404)) b!6279))

(assert (= (and b!6286 ((_ is ValueCellFull!128) mapDefault!404)) b!6275))

(assert (= start!818 b!6286))

(declare-fun m!3587 () Bool)

(assert (=> b!6282 m!3587))

(declare-fun m!3589 () Bool)

(assert (=> b!6285 m!3589))

(assert (=> b!6285 m!3589))

(declare-fun m!3591 () Bool)

(assert (=> b!6285 m!3591))

(declare-fun m!3593 () Bool)

(assert (=> b!6276 m!3593))

(assert (=> b!6287 m!3587))

(declare-fun m!3595 () Bool)

(assert (=> b!6287 m!3595))

(declare-fun m!3597 () Bool)

(assert (=> b!6277 m!3597))

(declare-fun m!3599 () Bool)

(assert (=> b!6280 m!3599))

(declare-fun m!3601 () Bool)

(assert (=> b!6278 m!3601))

(declare-fun m!3603 () Bool)

(assert (=> b!6284 m!3603))

(declare-fun m!3605 () Bool)

(assert (=> b!6284 m!3605))

(declare-fun m!3607 () Bool)

(assert (=> b!6284 m!3607))

(declare-fun m!3609 () Bool)

(assert (=> mapNonEmpty!404 m!3609))

(declare-fun m!3611 () Bool)

(assert (=> start!818 m!3611))

(declare-fun m!3613 () Bool)

(assert (=> start!818 m!3613))

(declare-fun m!3615 () Bool)

(assert (=> start!818 m!3615))

(check-sat (not b!6282) (not b!6277) (not b!6280) (not mapNonEmpty!404) b_and!357 (not b!6287) (not start!818) (not b!6285) tp_is_empty!289 (not b_next!211) (not b!6284) (not b!6278) (not b!6276))
(check-sat b_and!357 (not b_next!211))
