; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111040 () Bool)

(assert start!111040)

(declare-fun b_free!29875 () Bool)

(declare-fun b_next!29875 () Bool)

(assert (=> start!111040 (= b_free!29875 (not b_next!29875))))

(declare-fun tp!104947 () Bool)

(declare-fun b_and!48065 () Bool)

(assert (=> start!111040 (= tp!104947 b_and!48065)))

(declare-fun b!1314604 () Bool)

(declare-fun res!872753 () Bool)

(declare-fun e!749892 () Bool)

(assert (=> b!1314604 (=> (not res!872753) (not e!749892))))

(declare-datatypes ((array!88085 0))(
  ( (array!88086 (arr!42523 (Array (_ BitVec 32) (_ BitVec 64))) (size!43075 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88085)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88085 (_ BitVec 32)) Bool)

(assert (=> b!1314604 (= res!872753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872754 () Bool)

(assert (=> start!111040 (=> (not res!872754) (not e!749892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111040 (= res!872754 (validMask!0 mask!2040))))

(assert (=> start!111040 e!749892))

(assert (=> start!111040 tp!104947))

(declare-fun array_inv!32305 (array!88085) Bool)

(assert (=> start!111040 (array_inv!32305 _keys!1628)))

(assert (=> start!111040 true))

(declare-fun tp_is_empty!35605 () Bool)

(assert (=> start!111040 tp_is_empty!35605))

(declare-datatypes ((V!52577 0))(
  ( (V!52578 (val!17877 Int)) )
))
(declare-datatypes ((ValueCell!16904 0))(
  ( (ValueCellFull!16904 (v!20503 V!52577)) (EmptyCell!16904) )
))
(declare-datatypes ((array!88087 0))(
  ( (array!88088 (arr!42524 (Array (_ BitVec 32) ValueCell!16904)) (size!43076 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88087)

(declare-fun e!749891 () Bool)

(declare-fun array_inv!32306 (array!88087) Bool)

(assert (=> start!111040 (and (array_inv!32306 _values!1354) e!749891)))

(declare-fun b!1314605 () Bool)

(declare-fun e!749890 () Bool)

(declare-fun mapRes!55036 () Bool)

(assert (=> b!1314605 (= e!749891 (and e!749890 mapRes!55036))))

(declare-fun condMapEmpty!55036 () Bool)

(declare-fun mapDefault!55036 () ValueCell!16904)

(assert (=> b!1314605 (= condMapEmpty!55036 (= (arr!42524 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16904)) mapDefault!55036)))))

(declare-fun b!1314606 () Bool)

(assert (=> b!1314606 (= e!749890 tp_is_empty!35605)))

(declare-fun mapNonEmpty!55036 () Bool)

(declare-fun tp!104948 () Bool)

(declare-fun e!749893 () Bool)

(assert (=> mapNonEmpty!55036 (= mapRes!55036 (and tp!104948 e!749893))))

(declare-fun mapValue!55036 () ValueCell!16904)

(declare-fun mapKey!55036 () (_ BitVec 32))

(declare-fun mapRest!55036 () (Array (_ BitVec 32) ValueCell!16904))

(assert (=> mapNonEmpty!55036 (= (arr!42524 _values!1354) (store mapRest!55036 mapKey!55036 mapValue!55036))))

(declare-fun mapIsEmpty!55036 () Bool)

(assert (=> mapIsEmpty!55036 mapRes!55036))

(declare-fun b!1314607 () Bool)

(declare-fun res!872751 () Bool)

(assert (=> b!1314607 (=> (not res!872751) (not e!749892))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314607 (= res!872751 (and (= (size!43076 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43075 _keys!1628) (size!43076 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314608 () Bool)

(assert (=> b!1314608 (= e!749892 false)))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52577)

(declare-fun zeroValue!1296 () V!52577)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585636 () Bool)

(declare-datatypes ((tuple2!23144 0))(
  ( (tuple2!23145 (_1!11583 (_ BitVec 64)) (_2!11583 V!52577)) )
))
(declare-datatypes ((List!30259 0))(
  ( (Nil!30256) (Cons!30255 (h!31464 tuple2!23144) (t!43857 List!30259)) )
))
(declare-datatypes ((ListLongMap!20801 0))(
  ( (ListLongMap!20802 (toList!10416 List!30259)) )
))
(declare-fun contains!8493 (ListLongMap!20801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5311 (array!88085 array!88087 (_ BitVec 32) (_ BitVec 32) V!52577 V!52577 (_ BitVec 32) Int) ListLongMap!20801)

(assert (=> b!1314608 (= lt!585636 (contains!8493 (getCurrentListMap!5311 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314609 () Bool)

(assert (=> b!1314609 (= e!749893 tp_is_empty!35605)))

(declare-fun b!1314610 () Bool)

(declare-fun res!872755 () Bool)

(assert (=> b!1314610 (=> (not res!872755) (not e!749892))))

(declare-datatypes ((List!30260 0))(
  ( (Nil!30257) (Cons!30256 (h!31465 (_ BitVec 64)) (t!43858 List!30260)) )
))
(declare-fun arrayNoDuplicates!0 (array!88085 (_ BitVec 32) List!30260) Bool)

(assert (=> b!1314610 (= res!872755 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30257))))

(declare-fun b!1314611 () Bool)

(declare-fun res!872752 () Bool)

(assert (=> b!1314611 (=> (not res!872752) (not e!749892))))

(assert (=> b!1314611 (= res!872752 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43075 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111040 res!872754) b!1314607))

(assert (= (and b!1314607 res!872751) b!1314604))

(assert (= (and b!1314604 res!872753) b!1314610))

(assert (= (and b!1314610 res!872755) b!1314611))

(assert (= (and b!1314611 res!872752) b!1314608))

(assert (= (and b!1314605 condMapEmpty!55036) mapIsEmpty!55036))

(assert (= (and b!1314605 (not condMapEmpty!55036)) mapNonEmpty!55036))

(get-info :version)

(assert (= (and mapNonEmpty!55036 ((_ is ValueCellFull!16904) mapValue!55036)) b!1314609))

(assert (= (and b!1314605 ((_ is ValueCellFull!16904) mapDefault!55036)) b!1314606))

(assert (= start!111040 b!1314605))

(declare-fun m!1202601 () Bool)

(assert (=> mapNonEmpty!55036 m!1202601))

(declare-fun m!1202603 () Bool)

(assert (=> b!1314610 m!1202603))

(declare-fun m!1202605 () Bool)

(assert (=> b!1314608 m!1202605))

(assert (=> b!1314608 m!1202605))

(declare-fun m!1202607 () Bool)

(assert (=> b!1314608 m!1202607))

(declare-fun m!1202609 () Bool)

(assert (=> start!111040 m!1202609))

(declare-fun m!1202611 () Bool)

(assert (=> start!111040 m!1202611))

(declare-fun m!1202613 () Bool)

(assert (=> start!111040 m!1202613))

(declare-fun m!1202615 () Bool)

(assert (=> b!1314604 m!1202615))

(check-sat (not b!1314610) b_and!48065 (not b_next!29875) (not start!111040) (not b!1314604) (not b!1314608) tp_is_empty!35605 (not mapNonEmpty!55036))
(check-sat b_and!48065 (not b_next!29875))
