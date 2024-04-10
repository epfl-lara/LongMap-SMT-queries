; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110730 () Bool)

(assert start!110730)

(declare-fun b_free!29565 () Bool)

(declare-fun b_next!29565 () Bool)

(assert (=> start!110730 (= b_free!29565 (not b_next!29565))))

(declare-fun tp!104017 () Bool)

(declare-fun b_and!47773 () Bool)

(assert (=> start!110730 (= tp!104017 b_and!47773)))

(declare-fun b!1310515 () Bool)

(declare-fun e!747598 () Bool)

(declare-fun tp_is_empty!35295 () Bool)

(assert (=> b!1310515 (= e!747598 tp_is_empty!35295)))

(declare-fun b!1310516 () Bool)

(declare-fun res!870022 () Bool)

(declare-fun e!747601 () Bool)

(assert (=> b!1310516 (=> (not res!870022) (not e!747601))))

(declare-datatypes ((array!87578 0))(
  ( (array!87579 (arr!42269 (Array (_ BitVec 32) (_ BitVec 64))) (size!42819 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87578)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52163 0))(
  ( (V!52164 (val!17722 Int)) )
))
(declare-datatypes ((ValueCell!16749 0))(
  ( (ValueCellFull!16749 (v!20349 V!52163)) (EmptyCell!16749) )
))
(declare-datatypes ((array!87580 0))(
  ( (array!87581 (arr!42270 (Array (_ BitVec 32) ValueCell!16749)) (size!42820 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87580)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310516 (= res!870022 (and (= (size!42820 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42819 _keys!1628) (size!42820 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310517 () Bool)

(declare-fun res!870017 () Bool)

(assert (=> b!1310517 (=> (not res!870017) (not e!747601))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310517 (= res!870017 (not (= (select (arr!42269 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310518 () Bool)

(declare-fun e!747600 () Bool)

(assert (=> b!1310518 (= e!747600 tp_is_empty!35295)))

(declare-fun mapIsEmpty!54571 () Bool)

(declare-fun mapRes!54571 () Bool)

(assert (=> mapIsEmpty!54571 mapRes!54571))

(declare-fun res!870020 () Bool)

(assert (=> start!110730 (=> (not res!870020) (not e!747601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110730 (= res!870020 (validMask!0 mask!2040))))

(assert (=> start!110730 e!747601))

(assert (=> start!110730 tp!104017))

(declare-fun array_inv!31941 (array!87578) Bool)

(assert (=> start!110730 (array_inv!31941 _keys!1628)))

(assert (=> start!110730 true))

(assert (=> start!110730 tp_is_empty!35295))

(declare-fun e!747599 () Bool)

(declare-fun array_inv!31942 (array!87580) Bool)

(assert (=> start!110730 (and (array_inv!31942 _values!1354) e!747599)))

(declare-fun b!1310519 () Bool)

(declare-fun res!870024 () Bool)

(assert (=> b!1310519 (=> (not res!870024) (not e!747601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87578 (_ BitVec 32)) Bool)

(assert (=> b!1310519 (= res!870024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310520 () Bool)

(declare-fun res!870019 () Bool)

(assert (=> b!1310520 (=> (not res!870019) (not e!747601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310520 (= res!870019 (validKeyInArray!0 (select (arr!42269 _keys!1628) from!2020)))))

(declare-fun b!1310521 () Bool)

(declare-fun res!870016 () Bool)

(assert (=> b!1310521 (=> (not res!870016) (not e!747601))))

(declare-datatypes ((List!29971 0))(
  ( (Nil!29968) (Cons!29967 (h!31176 (_ BitVec 64)) (t!43577 List!29971)) )
))
(declare-fun arrayNoDuplicates!0 (array!87578 (_ BitVec 32) List!29971) Bool)

(assert (=> b!1310521 (= res!870016 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29968))))

(declare-fun b!1310522 () Bool)

(assert (=> b!1310522 (= e!747599 (and e!747598 mapRes!54571))))

(declare-fun condMapEmpty!54571 () Bool)

(declare-fun mapDefault!54571 () ValueCell!16749)

(assert (=> b!1310522 (= condMapEmpty!54571 (= (arr!42270 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16749)) mapDefault!54571)))))

(declare-fun b!1310523 () Bool)

(declare-fun res!870021 () Bool)

(assert (=> b!1310523 (=> (not res!870021) (not e!747601))))

(assert (=> b!1310523 (= res!870021 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42819 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310524 () Bool)

(declare-fun res!870018 () Bool)

(assert (=> b!1310524 (=> (not res!870018) (not e!747601))))

(assert (=> b!1310524 (= res!870018 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310525 () Bool)

(assert (=> b!1310525 (= e!747601 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52163)

(declare-fun zeroValue!1296 () V!52163)

(declare-datatypes ((tuple2!22832 0))(
  ( (tuple2!22833 (_1!11427 (_ BitVec 64)) (_2!11427 V!52163)) )
))
(declare-datatypes ((List!29972 0))(
  ( (Nil!29969) (Cons!29968 (h!31177 tuple2!22832) (t!43578 List!29972)) )
))
(declare-datatypes ((ListLongMap!20489 0))(
  ( (ListLongMap!20490 (toList!10260 List!29972)) )
))
(declare-fun contains!8410 (ListLongMap!20489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5273 (array!87578 array!87580 (_ BitVec 32) (_ BitVec 32) V!52163 V!52163 (_ BitVec 32) Int) ListLongMap!20489)

(assert (=> b!1310525 (contains!8410 (getCurrentListMap!5273 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43338 0))(
  ( (Unit!43339) )
))
(declare-fun lt!585366 () Unit!43338)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!15 (array!87578 array!87580 (_ BitVec 32) (_ BitVec 32) V!52163 V!52163 (_ BitVec 64) (_ BitVec 32) Int) Unit!43338)

(assert (=> b!1310525 (= lt!585366 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!15 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapNonEmpty!54571 () Bool)

(declare-fun tp!104016 () Bool)

(assert (=> mapNonEmpty!54571 (= mapRes!54571 (and tp!104016 e!747600))))

(declare-fun mapRest!54571 () (Array (_ BitVec 32) ValueCell!16749))

(declare-fun mapValue!54571 () ValueCell!16749)

(declare-fun mapKey!54571 () (_ BitVec 32))

(assert (=> mapNonEmpty!54571 (= (arr!42270 _values!1354) (store mapRest!54571 mapKey!54571 mapValue!54571))))

(declare-fun b!1310526 () Bool)

(declare-fun res!870023 () Bool)

(assert (=> b!1310526 (=> (not res!870023) (not e!747601))))

(assert (=> b!1310526 (= res!870023 (contains!8410 (getCurrentListMap!5273 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110730 res!870020) b!1310516))

(assert (= (and b!1310516 res!870022) b!1310519))

(assert (= (and b!1310519 res!870024) b!1310521))

(assert (= (and b!1310521 res!870016) b!1310523))

(assert (= (and b!1310523 res!870021) b!1310526))

(assert (= (and b!1310526 res!870023) b!1310517))

(assert (= (and b!1310517 res!870017) b!1310520))

(assert (= (and b!1310520 res!870019) b!1310524))

(assert (= (and b!1310524 res!870018) b!1310525))

(assert (= (and b!1310522 condMapEmpty!54571) mapIsEmpty!54571))

(assert (= (and b!1310522 (not condMapEmpty!54571)) mapNonEmpty!54571))

(get-info :version)

(assert (= (and mapNonEmpty!54571 ((_ is ValueCellFull!16749) mapValue!54571)) b!1310518))

(assert (= (and b!1310522 ((_ is ValueCellFull!16749) mapDefault!54571)) b!1310515))

(assert (= start!110730 b!1310522))

(declare-fun m!1200275 () Bool)

(assert (=> b!1310526 m!1200275))

(assert (=> b!1310526 m!1200275))

(declare-fun m!1200277 () Bool)

(assert (=> b!1310526 m!1200277))

(declare-fun m!1200279 () Bool)

(assert (=> b!1310517 m!1200279))

(assert (=> b!1310520 m!1200279))

(assert (=> b!1310520 m!1200279))

(declare-fun m!1200281 () Bool)

(assert (=> b!1310520 m!1200281))

(declare-fun m!1200283 () Bool)

(assert (=> mapNonEmpty!54571 m!1200283))

(declare-fun m!1200285 () Bool)

(assert (=> b!1310521 m!1200285))

(declare-fun m!1200287 () Bool)

(assert (=> b!1310519 m!1200287))

(declare-fun m!1200289 () Bool)

(assert (=> b!1310525 m!1200289))

(assert (=> b!1310525 m!1200289))

(declare-fun m!1200291 () Bool)

(assert (=> b!1310525 m!1200291))

(declare-fun m!1200293 () Bool)

(assert (=> b!1310525 m!1200293))

(declare-fun m!1200295 () Bool)

(assert (=> start!110730 m!1200295))

(declare-fun m!1200297 () Bool)

(assert (=> start!110730 m!1200297))

(declare-fun m!1200299 () Bool)

(assert (=> start!110730 m!1200299))

(check-sat b_and!47773 (not b!1310519) (not b!1310526) (not mapNonEmpty!54571) tp_is_empty!35295 (not b!1310521) (not b_next!29565) (not b!1310525) (not b!1310520) (not start!110730))
(check-sat b_and!47773 (not b_next!29565))
