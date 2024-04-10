; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110574 () Bool)

(assert start!110574)

(declare-fun b_free!29409 () Bool)

(declare-fun b_next!29409 () Bool)

(assert (=> start!110574 (= b_free!29409 (not b_next!29409))))

(declare-fun tp!103548 () Bool)

(declare-fun b_and!47617 () Bool)

(assert (=> start!110574 (= tp!103548 b_and!47617)))

(declare-fun b!1308139 () Bool)

(declare-fun res!868348 () Bool)

(declare-fun e!746430 () Bool)

(assert (=> b!1308139 (=> (not res!868348) (not e!746430))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87276 0))(
  ( (array!87277 (arr!42118 (Array (_ BitVec 32) (_ BitVec 64))) (size!42668 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87276)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51955 0))(
  ( (V!51956 (val!17644 Int)) )
))
(declare-fun minValue!1296 () V!51955)

(declare-datatypes ((ValueCell!16671 0))(
  ( (ValueCellFull!16671 (v!20271 V!51955)) (EmptyCell!16671) )
))
(declare-datatypes ((array!87278 0))(
  ( (array!87279 (arr!42119 (Array (_ BitVec 32) ValueCell!16671)) (size!42669 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87278)

(declare-fun zeroValue!1296 () V!51955)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22718 0))(
  ( (tuple2!22719 (_1!11370 (_ BitVec 64)) (_2!11370 V!51955)) )
))
(declare-datatypes ((List!29859 0))(
  ( (Nil!29856) (Cons!29855 (h!31064 tuple2!22718) (t!43465 List!29859)) )
))
(declare-datatypes ((ListLongMap!20375 0))(
  ( (ListLongMap!20376 (toList!10203 List!29859)) )
))
(declare-fun contains!8353 (ListLongMap!20375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5216 (array!87276 array!87278 (_ BitVec 32) (_ BitVec 32) V!51955 V!51955 (_ BitVec 32) Int) ListLongMap!20375)

(assert (=> b!1308139 (= res!868348 (contains!8353 (getCurrentListMap!5216 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308140 () Bool)

(assert (=> b!1308140 (= e!746430 (not true))))

(assert (=> b!1308140 (contains!8353 (getCurrentListMap!5216 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43286 0))(
  ( (Unit!43287) )
))
(declare-fun lt!585132 () Unit!43286)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!7 (array!87276 array!87278 (_ BitVec 32) (_ BitVec 32) V!51955 V!51955 (_ BitVec 64) (_ BitVec 32) Int) Unit!43286)

(assert (=> b!1308140 (= lt!585132 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!7 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308141 () Bool)

(declare-fun e!746431 () Bool)

(declare-fun tp_is_empty!35139 () Bool)

(assert (=> b!1308141 (= e!746431 tp_is_empty!35139)))

(declare-fun b!1308142 () Bool)

(declare-fun e!746429 () Bool)

(declare-fun e!746428 () Bool)

(declare-fun mapRes!54337 () Bool)

(assert (=> b!1308142 (= e!746429 (and e!746428 mapRes!54337))))

(declare-fun condMapEmpty!54337 () Bool)

(declare-fun mapDefault!54337 () ValueCell!16671)

(assert (=> b!1308142 (= condMapEmpty!54337 (= (arr!42119 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16671)) mapDefault!54337)))))

(declare-fun b!1308143 () Bool)

(declare-fun res!868350 () Bool)

(assert (=> b!1308143 (=> (not res!868350) (not e!746430))))

(declare-datatypes ((List!29860 0))(
  ( (Nil!29857) (Cons!29856 (h!31065 (_ BitVec 64)) (t!43466 List!29860)) )
))
(declare-fun arrayNoDuplicates!0 (array!87276 (_ BitVec 32) List!29860) Bool)

(assert (=> b!1308143 (= res!868350 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29857))))

(declare-fun b!1308144 () Bool)

(declare-fun res!868349 () Bool)

(assert (=> b!1308144 (=> (not res!868349) (not e!746430))))

(assert (=> b!1308144 (= res!868349 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42668 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54337 () Bool)

(assert (=> mapIsEmpty!54337 mapRes!54337))

(declare-fun b!1308145 () Bool)

(assert (=> b!1308145 (= e!746428 tp_is_empty!35139)))

(declare-fun b!1308146 () Bool)

(declare-fun res!868347 () Bool)

(assert (=> b!1308146 (=> (not res!868347) (not e!746430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308146 (= res!868347 (validKeyInArray!0 (select (arr!42118 _keys!1628) from!2020)))))

(declare-fun res!868344 () Bool)

(assert (=> start!110574 (=> (not res!868344) (not e!746430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110574 (= res!868344 (validMask!0 mask!2040))))

(assert (=> start!110574 e!746430))

(assert (=> start!110574 tp!103548))

(declare-fun array_inv!31831 (array!87276) Bool)

(assert (=> start!110574 (array_inv!31831 _keys!1628)))

(assert (=> start!110574 true))

(assert (=> start!110574 tp_is_empty!35139))

(declare-fun array_inv!31832 (array!87278) Bool)

(assert (=> start!110574 (and (array_inv!31832 _values!1354) e!746429)))

(declare-fun b!1308147 () Bool)

(declare-fun res!868345 () Bool)

(assert (=> b!1308147 (=> (not res!868345) (not e!746430))))

(assert (=> b!1308147 (= res!868345 (not (= (select (arr!42118 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308148 () Bool)

(declare-fun res!868346 () Bool)

(assert (=> b!1308148 (=> (not res!868346) (not e!746430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87276 (_ BitVec 32)) Bool)

(assert (=> b!1308148 (= res!868346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54337 () Bool)

(declare-fun tp!103549 () Bool)

(assert (=> mapNonEmpty!54337 (= mapRes!54337 (and tp!103549 e!746431))))

(declare-fun mapRest!54337 () (Array (_ BitVec 32) ValueCell!16671))

(declare-fun mapValue!54337 () ValueCell!16671)

(declare-fun mapKey!54337 () (_ BitVec 32))

(assert (=> mapNonEmpty!54337 (= (arr!42119 _values!1354) (store mapRest!54337 mapKey!54337 mapValue!54337))))

(declare-fun b!1308149 () Bool)

(declare-fun res!868342 () Bool)

(assert (=> b!1308149 (=> (not res!868342) (not e!746430))))

(assert (=> b!1308149 (= res!868342 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308150 () Bool)

(declare-fun res!868343 () Bool)

(assert (=> b!1308150 (=> (not res!868343) (not e!746430))))

(assert (=> b!1308150 (= res!868343 (and (= (size!42669 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42668 _keys!1628) (size!42669 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110574 res!868344) b!1308150))

(assert (= (and b!1308150 res!868343) b!1308148))

(assert (= (and b!1308148 res!868346) b!1308143))

(assert (= (and b!1308143 res!868350) b!1308144))

(assert (= (and b!1308144 res!868349) b!1308139))

(assert (= (and b!1308139 res!868348) b!1308147))

(assert (= (and b!1308147 res!868345) b!1308146))

(assert (= (and b!1308146 res!868347) b!1308149))

(assert (= (and b!1308149 res!868342) b!1308140))

(assert (= (and b!1308142 condMapEmpty!54337) mapIsEmpty!54337))

(assert (= (and b!1308142 (not condMapEmpty!54337)) mapNonEmpty!54337))

(get-info :version)

(assert (= (and mapNonEmpty!54337 ((_ is ValueCellFull!16671) mapValue!54337)) b!1308141))

(assert (= (and b!1308142 ((_ is ValueCellFull!16671) mapDefault!54337)) b!1308145))

(assert (= start!110574 b!1308142))

(declare-fun m!1198607 () Bool)

(assert (=> b!1308143 m!1198607))

(declare-fun m!1198609 () Bool)

(assert (=> b!1308139 m!1198609))

(assert (=> b!1308139 m!1198609))

(declare-fun m!1198611 () Bool)

(assert (=> b!1308139 m!1198611))

(declare-fun m!1198613 () Bool)

(assert (=> b!1308147 m!1198613))

(declare-fun m!1198615 () Bool)

(assert (=> mapNonEmpty!54337 m!1198615))

(assert (=> b!1308146 m!1198613))

(assert (=> b!1308146 m!1198613))

(declare-fun m!1198617 () Bool)

(assert (=> b!1308146 m!1198617))

(declare-fun m!1198619 () Bool)

(assert (=> b!1308148 m!1198619))

(declare-fun m!1198621 () Bool)

(assert (=> start!110574 m!1198621))

(declare-fun m!1198623 () Bool)

(assert (=> start!110574 m!1198623))

(declare-fun m!1198625 () Bool)

(assert (=> start!110574 m!1198625))

(declare-fun m!1198627 () Bool)

(assert (=> b!1308140 m!1198627))

(assert (=> b!1308140 m!1198627))

(declare-fun m!1198629 () Bool)

(assert (=> b!1308140 m!1198629))

(declare-fun m!1198631 () Bool)

(assert (=> b!1308140 m!1198631))

(check-sat (not b!1308148) (not start!110574) (not b_next!29409) (not b!1308139) tp_is_empty!35139 (not b!1308146) (not b!1308140) (not mapNonEmpty!54337) b_and!47617 (not b!1308143))
(check-sat b_and!47617 (not b_next!29409))
