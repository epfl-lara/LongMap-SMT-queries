; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111228 () Bool)

(assert start!111228)

(declare-fun b_free!29839 () Bool)

(declare-fun b_next!29839 () Bool)

(assert (=> start!111228 (= b_free!29839 (not b_next!29839))))

(declare-fun tp!104838 () Bool)

(declare-fun b_and!48049 () Bool)

(assert (=> start!111228 (= tp!104838 b_and!48049)))

(declare-fun b!1315513 () Bool)

(declare-fun res!873005 () Bool)

(declare-fun e!750499 () Bool)

(assert (=> b!1315513 (=> (not res!873005) (not e!750499))))

(declare-datatypes ((array!88167 0))(
  ( (array!88168 (arr!42559 (Array (_ BitVec 32) (_ BitVec 64))) (size!43110 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88167)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52529 0))(
  ( (V!52530 (val!17859 Int)) )
))
(declare-datatypes ((ValueCell!16886 0))(
  ( (ValueCellFull!16886 (v!20481 V!52529)) (EmptyCell!16886) )
))
(declare-datatypes ((array!88169 0))(
  ( (array!88170 (arr!42560 (Array (_ BitVec 32) ValueCell!16886)) (size!43111 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88169)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315513 (= res!873005 (and (= (size!43111 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43110 _keys!1628) (size!43111 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315514 () Bool)

(assert (=> b!1315514 (= e!750499 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52529)

(declare-fun zeroValue!1296 () V!52529)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23054 0))(
  ( (tuple2!23055 (_1!11538 (_ BitVec 64)) (_2!11538 V!52529)) )
))
(declare-datatypes ((List!30205 0))(
  ( (Nil!30202) (Cons!30201 (h!31419 tuple2!23054) (t!43803 List!30205)) )
))
(declare-datatypes ((ListLongMap!20719 0))(
  ( (ListLongMap!20720 (toList!10375 List!30205)) )
))
(declare-fun contains!8537 (ListLongMap!20719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5379 (array!88167 array!88169 (_ BitVec 32) (_ BitVec 32) V!52529 V!52529 (_ BitVec 32) Int) ListLongMap!20719)

(assert (=> b!1315514 (contains!8537 (getCurrentListMap!5379 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43351 0))(
  ( (Unit!43352) )
))
(declare-fun lt!586244 () Unit!43351)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!20 (array!88167 array!88169 (_ BitVec 32) (_ BitVec 32) V!52529 V!52529 (_ BitVec 64) (_ BitVec 32) Int) Unit!43351)

(assert (=> b!1315514 (= lt!586244 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!20 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun res!873000 () Bool)

(assert (=> start!111228 (=> (not res!873000) (not e!750499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111228 (= res!873000 (validMask!0 mask!2040))))

(assert (=> start!111228 e!750499))

(assert (=> start!111228 tp!104838))

(declare-fun array_inv!32411 (array!88167) Bool)

(assert (=> start!111228 (array_inv!32411 _keys!1628)))

(assert (=> start!111228 true))

(declare-fun tp_is_empty!35569 () Bool)

(assert (=> start!111228 tp_is_empty!35569))

(declare-fun e!750497 () Bool)

(declare-fun array_inv!32412 (array!88169) Bool)

(assert (=> start!111228 (and (array_inv!32412 _values!1354) e!750497)))

(declare-fun b!1315515 () Bool)

(declare-fun res!873002 () Bool)

(assert (=> b!1315515 (=> (not res!873002) (not e!750499))))

(assert (=> b!1315515 (= res!873002 (contains!8537 (getCurrentListMap!5379 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315516 () Bool)

(declare-fun res!873007 () Bool)

(assert (=> b!1315516 (=> (not res!873007) (not e!750499))))

(declare-datatypes ((List!30206 0))(
  ( (Nil!30203) (Cons!30202 (h!31420 (_ BitVec 64)) (t!43804 List!30206)) )
))
(declare-fun arrayNoDuplicates!0 (array!88167 (_ BitVec 32) List!30206) Bool)

(assert (=> b!1315516 (= res!873007 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30203))))

(declare-fun b!1315517 () Bool)

(declare-fun res!873008 () Bool)

(assert (=> b!1315517 (=> (not res!873008) (not e!750499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1315517 (= res!873008 (validKeyInArray!0 (select (arr!42559 _keys!1628) from!2020)))))

(declare-fun b!1315518 () Bool)

(declare-fun res!873003 () Bool)

(assert (=> b!1315518 (=> (not res!873003) (not e!750499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88167 (_ BitVec 32)) Bool)

(assert (=> b!1315518 (= res!873003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54982 () Bool)

(declare-fun mapRes!54982 () Bool)

(assert (=> mapIsEmpty!54982 mapRes!54982))

(declare-fun b!1315519 () Bool)

(declare-fun e!750500 () Bool)

(assert (=> b!1315519 (= e!750500 tp_is_empty!35569)))

(declare-fun b!1315520 () Bool)

(declare-fun res!873006 () Bool)

(assert (=> b!1315520 (=> (not res!873006) (not e!750499))))

(assert (=> b!1315520 (= res!873006 (not (= (select (arr!42559 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1315521 () Bool)

(declare-fun e!750496 () Bool)

(assert (=> b!1315521 (= e!750496 tp_is_empty!35569)))

(declare-fun b!1315522 () Bool)

(declare-fun res!873004 () Bool)

(assert (=> b!1315522 (=> (not res!873004) (not e!750499))))

(assert (=> b!1315522 (= res!873004 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1315523 () Bool)

(assert (=> b!1315523 (= e!750497 (and e!750500 mapRes!54982))))

(declare-fun condMapEmpty!54982 () Bool)

(declare-fun mapDefault!54982 () ValueCell!16886)

(assert (=> b!1315523 (= condMapEmpty!54982 (= (arr!42560 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16886)) mapDefault!54982)))))

(declare-fun mapNonEmpty!54982 () Bool)

(declare-fun tp!104839 () Bool)

(assert (=> mapNonEmpty!54982 (= mapRes!54982 (and tp!104839 e!750496))))

(declare-fun mapValue!54982 () ValueCell!16886)

(declare-fun mapKey!54982 () (_ BitVec 32))

(declare-fun mapRest!54982 () (Array (_ BitVec 32) ValueCell!16886))

(assert (=> mapNonEmpty!54982 (= (arr!42560 _values!1354) (store mapRest!54982 mapKey!54982 mapValue!54982))))

(declare-fun b!1315524 () Bool)

(declare-fun res!873001 () Bool)

(assert (=> b!1315524 (=> (not res!873001) (not e!750499))))

(assert (=> b!1315524 (= res!873001 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43110 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111228 res!873000) b!1315513))

(assert (= (and b!1315513 res!873005) b!1315518))

(assert (= (and b!1315518 res!873003) b!1315516))

(assert (= (and b!1315516 res!873007) b!1315524))

(assert (= (and b!1315524 res!873001) b!1315515))

(assert (= (and b!1315515 res!873002) b!1315520))

(assert (= (and b!1315520 res!873006) b!1315517))

(assert (= (and b!1315517 res!873008) b!1315522))

(assert (= (and b!1315522 res!873004) b!1315514))

(assert (= (and b!1315523 condMapEmpty!54982) mapIsEmpty!54982))

(assert (= (and b!1315523 (not condMapEmpty!54982)) mapNonEmpty!54982))

(get-info :version)

(assert (= (and mapNonEmpty!54982 ((_ is ValueCellFull!16886) mapValue!54982)) b!1315521))

(assert (= (and b!1315523 ((_ is ValueCellFull!16886) mapDefault!54982)) b!1315519))

(assert (= start!111228 b!1315523))

(declare-fun m!1204397 () Bool)

(assert (=> mapNonEmpty!54982 m!1204397))

(declare-fun m!1204399 () Bool)

(assert (=> b!1315514 m!1204399))

(assert (=> b!1315514 m!1204399))

(declare-fun m!1204401 () Bool)

(assert (=> b!1315514 m!1204401))

(declare-fun m!1204403 () Bool)

(assert (=> b!1315514 m!1204403))

(declare-fun m!1204405 () Bool)

(assert (=> b!1315518 m!1204405))

(declare-fun m!1204407 () Bool)

(assert (=> start!111228 m!1204407))

(declare-fun m!1204409 () Bool)

(assert (=> start!111228 m!1204409))

(declare-fun m!1204411 () Bool)

(assert (=> start!111228 m!1204411))

(declare-fun m!1204413 () Bool)

(assert (=> b!1315520 m!1204413))

(assert (=> b!1315517 m!1204413))

(assert (=> b!1315517 m!1204413))

(declare-fun m!1204415 () Bool)

(assert (=> b!1315517 m!1204415))

(declare-fun m!1204417 () Bool)

(assert (=> b!1315516 m!1204417))

(declare-fun m!1204419 () Bool)

(assert (=> b!1315515 m!1204419))

(assert (=> b!1315515 m!1204419))

(declare-fun m!1204421 () Bool)

(assert (=> b!1315515 m!1204421))

(check-sat (not b!1315515) b_and!48049 tp_is_empty!35569 (not start!111228) (not b!1315517) (not mapNonEmpty!54982) (not b_next!29839) (not b!1315516) (not b!1315514) (not b!1315518))
(check-sat b_and!48049 (not b_next!29839))
