; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111240 () Bool)

(assert start!111240)

(declare-fun b_free!29851 () Bool)

(declare-fun b_next!29851 () Bool)

(assert (=> start!111240 (= b_free!29851 (not b_next!29851))))

(declare-fun tp!104874 () Bool)

(declare-fun b_and!48061 () Bool)

(assert (=> start!111240 (= tp!104874 b_and!48061)))

(declare-fun b!1315685 () Bool)

(declare-fun e!750589 () Bool)

(declare-fun tp_is_empty!35581 () Bool)

(assert (=> b!1315685 (= e!750589 tp_is_empty!35581)))

(declare-fun res!873121 () Bool)

(declare-fun e!750588 () Bool)

(assert (=> start!111240 (=> (not res!873121) (not e!750588))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111240 (= res!873121 (validMask!0 mask!2040))))

(assert (=> start!111240 e!750588))

(assert (=> start!111240 tp!104874))

(declare-datatypes ((array!88189 0))(
  ( (array!88190 (arr!42570 (Array (_ BitVec 32) (_ BitVec 64))) (size!43121 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88189)

(declare-fun array_inv!32419 (array!88189) Bool)

(assert (=> start!111240 (array_inv!32419 _keys!1628)))

(assert (=> start!111240 true))

(assert (=> start!111240 tp_is_empty!35581))

(declare-datatypes ((V!52545 0))(
  ( (V!52546 (val!17865 Int)) )
))
(declare-datatypes ((ValueCell!16892 0))(
  ( (ValueCellFull!16892 (v!20487 V!52545)) (EmptyCell!16892) )
))
(declare-datatypes ((array!88191 0))(
  ( (array!88192 (arr!42571 (Array (_ BitVec 32) ValueCell!16892)) (size!43122 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88191)

(declare-fun e!750586 () Bool)

(declare-fun array_inv!32420 (array!88191) Bool)

(assert (=> start!111240 (and (array_inv!32420 _values!1354) e!750586)))

(declare-fun b!1315686 () Bool)

(declare-fun res!873122 () Bool)

(assert (=> b!1315686 (=> (not res!873122) (not e!750588))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315686 (= res!873122 (and (= (size!43122 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43121 _keys!1628) (size!43122 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55000 () Bool)

(declare-fun mapRes!55000 () Bool)

(declare-fun tp!104875 () Bool)

(assert (=> mapNonEmpty!55000 (= mapRes!55000 (and tp!104875 e!750589))))

(declare-fun mapKey!55000 () (_ BitVec 32))

(declare-fun mapValue!55000 () ValueCell!16892)

(declare-fun mapRest!55000 () (Array (_ BitVec 32) ValueCell!16892))

(assert (=> mapNonEmpty!55000 (= (arr!42571 _values!1354) (store mapRest!55000 mapKey!55000 mapValue!55000))))

(declare-fun b!1315687 () Bool)

(declare-fun res!873119 () Bool)

(assert (=> b!1315687 (=> (not res!873119) (not e!750588))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315687 (= res!873119 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43121 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315688 () Bool)

(declare-fun e!750590 () Bool)

(assert (=> b!1315688 (= e!750586 (and e!750590 mapRes!55000))))

(declare-fun condMapEmpty!55000 () Bool)

(declare-fun mapDefault!55000 () ValueCell!16892)

(assert (=> b!1315688 (= condMapEmpty!55000 (= (arr!42571 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16892)) mapDefault!55000)))))

(declare-fun b!1315689 () Bool)

(assert (=> b!1315689 (= e!750590 tp_is_empty!35581)))

(declare-fun b!1315690 () Bool)

(assert (=> b!1315690 (= e!750588 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586262 () Bool)

(declare-fun minValue!1296 () V!52545)

(declare-fun zeroValue!1296 () V!52545)

(declare-datatypes ((tuple2!23064 0))(
  ( (tuple2!23065 (_1!11543 (_ BitVec 64)) (_2!11543 V!52545)) )
))
(declare-datatypes ((List!30215 0))(
  ( (Nil!30212) (Cons!30211 (h!31429 tuple2!23064) (t!43813 List!30215)) )
))
(declare-datatypes ((ListLongMap!20729 0))(
  ( (ListLongMap!20730 (toList!10380 List!30215)) )
))
(declare-fun contains!8542 (ListLongMap!20729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5384 (array!88189 array!88191 (_ BitVec 32) (_ BitVec 32) V!52545 V!52545 (_ BitVec 32) Int) ListLongMap!20729)

(assert (=> b!1315690 (= lt!586262 (contains!8542 (getCurrentListMap!5384 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55000 () Bool)

(assert (=> mapIsEmpty!55000 mapRes!55000))

(declare-fun b!1315691 () Bool)

(declare-fun res!873118 () Bool)

(assert (=> b!1315691 (=> (not res!873118) (not e!750588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88189 (_ BitVec 32)) Bool)

(assert (=> b!1315691 (= res!873118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315692 () Bool)

(declare-fun res!873120 () Bool)

(assert (=> b!1315692 (=> (not res!873120) (not e!750588))))

(declare-datatypes ((List!30216 0))(
  ( (Nil!30213) (Cons!30212 (h!31430 (_ BitVec 64)) (t!43814 List!30216)) )
))
(declare-fun arrayNoDuplicates!0 (array!88189 (_ BitVec 32) List!30216) Bool)

(assert (=> b!1315692 (= res!873120 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30213))))

(assert (= (and start!111240 res!873121) b!1315686))

(assert (= (and b!1315686 res!873122) b!1315691))

(assert (= (and b!1315691 res!873118) b!1315692))

(assert (= (and b!1315692 res!873120) b!1315687))

(assert (= (and b!1315687 res!873119) b!1315690))

(assert (= (and b!1315688 condMapEmpty!55000) mapIsEmpty!55000))

(assert (= (and b!1315688 (not condMapEmpty!55000)) mapNonEmpty!55000))

(get-info :version)

(assert (= (and mapNonEmpty!55000 ((_ is ValueCellFull!16892) mapValue!55000)) b!1315685))

(assert (= (and b!1315688 ((_ is ValueCellFull!16892) mapDefault!55000)) b!1315689))

(assert (= start!111240 b!1315688))

(declare-fun m!1204523 () Bool)

(assert (=> b!1315692 m!1204523))

(declare-fun m!1204525 () Bool)

(assert (=> b!1315690 m!1204525))

(assert (=> b!1315690 m!1204525))

(declare-fun m!1204527 () Bool)

(assert (=> b!1315690 m!1204527))

(declare-fun m!1204529 () Bool)

(assert (=> mapNonEmpty!55000 m!1204529))

(declare-fun m!1204531 () Bool)

(assert (=> b!1315691 m!1204531))

(declare-fun m!1204533 () Bool)

(assert (=> start!111240 m!1204533))

(declare-fun m!1204535 () Bool)

(assert (=> start!111240 m!1204535))

(declare-fun m!1204537 () Bool)

(assert (=> start!111240 m!1204537))

(check-sat (not b!1315691) (not start!111240) b_and!48061 (not b!1315692) (not mapNonEmpty!55000) (not b_next!29851) (not b!1315690) tp_is_empty!35581)
(check-sat b_and!48061 (not b_next!29851))
