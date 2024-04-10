; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111078 () Bool)

(assert start!111078)

(declare-fun b_free!29913 () Bool)

(declare-fun b_next!29913 () Bool)

(assert (=> start!111078 (= b_free!29913 (not b_next!29913))))

(declare-fun tp!105061 () Bool)

(declare-fun b_and!48121 () Bool)

(assert (=> start!111078 (= tp!105061 b_and!48121)))

(declare-fun b!1315130 () Bool)

(declare-fun res!873066 () Bool)

(declare-fun e!750212 () Bool)

(assert (=> b!1315130 (=> (not res!873066) (not e!750212))))

(declare-datatypes ((array!88250 0))(
  ( (array!88251 (arr!42605 (Array (_ BitVec 32) (_ BitVec 64))) (size!43155 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88250)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((V!52627 0))(
  ( (V!52628 (val!17896 Int)) )
))
(declare-datatypes ((ValueCell!16923 0))(
  ( (ValueCellFull!16923 (v!20523 V!52627)) (EmptyCell!16923) )
))
(declare-datatypes ((array!88252 0))(
  ( (array!88253 (arr!42606 (Array (_ BitVec 32) ValueCell!16923)) (size!43156 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88252)

(assert (=> b!1315130 (= res!873066 (and (= (size!43156 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43155 _keys!1628) (size!43156 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315131 () Bool)

(declare-fun e!750209 () Bool)

(declare-fun tp_is_empty!35643 () Bool)

(assert (=> b!1315131 (= e!750209 tp_is_empty!35643)))

(declare-fun b!1315132 () Bool)

(declare-fun e!750211 () Bool)

(assert (=> b!1315132 (= e!750211 tp_is_empty!35643)))

(declare-fun b!1315133 () Bool)

(assert (=> b!1315133 (= e!750212 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52627)

(declare-fun zeroValue!1296 () V!52627)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585879 () Bool)

(declare-datatypes ((tuple2!23082 0))(
  ( (tuple2!23083 (_1!11552 (_ BitVec 64)) (_2!11552 V!52627)) )
))
(declare-datatypes ((List!30218 0))(
  ( (Nil!30215) (Cons!30214 (h!31423 tuple2!23082) (t!43824 List!30218)) )
))
(declare-datatypes ((ListLongMap!20739 0))(
  ( (ListLongMap!20740 (toList!10385 List!30218)) )
))
(declare-fun contains!8535 (ListLongMap!20739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5398 (array!88250 array!88252 (_ BitVec 32) (_ BitVec 32) V!52627 V!52627 (_ BitVec 32) Int) ListLongMap!20739)

(assert (=> b!1315133 (= lt!585879 (contains!8535 (getCurrentListMap!5398 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315134 () Bool)

(declare-fun res!873068 () Bool)

(assert (=> b!1315134 (=> (not res!873068) (not e!750212))))

(declare-datatypes ((List!30219 0))(
  ( (Nil!30216) (Cons!30215 (h!31424 (_ BitVec 64)) (t!43825 List!30219)) )
))
(declare-fun arrayNoDuplicates!0 (array!88250 (_ BitVec 32) List!30219) Bool)

(assert (=> b!1315134 (= res!873068 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30216))))

(declare-fun mapNonEmpty!55093 () Bool)

(declare-fun mapRes!55093 () Bool)

(declare-fun tp!105060 () Bool)

(assert (=> mapNonEmpty!55093 (= mapRes!55093 (and tp!105060 e!750209))))

(declare-fun mapRest!55093 () (Array (_ BitVec 32) ValueCell!16923))

(declare-fun mapValue!55093 () ValueCell!16923)

(declare-fun mapKey!55093 () (_ BitVec 32))

(assert (=> mapNonEmpty!55093 (= (arr!42606 _values!1354) (store mapRest!55093 mapKey!55093 mapValue!55093))))

(declare-fun b!1315135 () Bool)

(declare-fun e!750208 () Bool)

(assert (=> b!1315135 (= e!750208 (and e!750211 mapRes!55093))))

(declare-fun condMapEmpty!55093 () Bool)

(declare-fun mapDefault!55093 () ValueCell!16923)

(assert (=> b!1315135 (= condMapEmpty!55093 (= (arr!42606 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16923)) mapDefault!55093)))))

(declare-fun res!873065 () Bool)

(assert (=> start!111078 (=> (not res!873065) (not e!750212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111078 (= res!873065 (validMask!0 mask!2040))))

(assert (=> start!111078 e!750212))

(assert (=> start!111078 tp!105061))

(declare-fun array_inv!32177 (array!88250) Bool)

(assert (=> start!111078 (array_inv!32177 _keys!1628)))

(assert (=> start!111078 true))

(assert (=> start!111078 tp_is_empty!35643))

(declare-fun array_inv!32178 (array!88252) Bool)

(assert (=> start!111078 (and (array_inv!32178 _values!1354) e!750208)))

(declare-fun b!1315136 () Bool)

(declare-fun res!873069 () Bool)

(assert (=> b!1315136 (=> (not res!873069) (not e!750212))))

(assert (=> b!1315136 (= res!873069 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43155 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315137 () Bool)

(declare-fun res!873067 () Bool)

(assert (=> b!1315137 (=> (not res!873067) (not e!750212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88250 (_ BitVec 32)) Bool)

(assert (=> b!1315137 (= res!873067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55093 () Bool)

(assert (=> mapIsEmpty!55093 mapRes!55093))

(assert (= (and start!111078 res!873065) b!1315130))

(assert (= (and b!1315130 res!873066) b!1315137))

(assert (= (and b!1315137 res!873067) b!1315134))

(assert (= (and b!1315134 res!873068) b!1315136))

(assert (= (and b!1315136 res!873069) b!1315133))

(assert (= (and b!1315135 condMapEmpty!55093) mapIsEmpty!55093))

(assert (= (and b!1315135 (not condMapEmpty!55093)) mapNonEmpty!55093))

(get-info :version)

(assert (= (and mapNonEmpty!55093 ((_ is ValueCellFull!16923) mapValue!55093)) b!1315131))

(assert (= (and b!1315135 ((_ is ValueCellFull!16923) mapDefault!55093)) b!1315132))

(assert (= start!111078 b!1315135))

(declare-fun m!1203421 () Bool)

(assert (=> b!1315133 m!1203421))

(assert (=> b!1315133 m!1203421))

(declare-fun m!1203423 () Bool)

(assert (=> b!1315133 m!1203423))

(declare-fun m!1203425 () Bool)

(assert (=> b!1315134 m!1203425))

(declare-fun m!1203427 () Bool)

(assert (=> start!111078 m!1203427))

(declare-fun m!1203429 () Bool)

(assert (=> start!111078 m!1203429))

(declare-fun m!1203431 () Bool)

(assert (=> start!111078 m!1203431))

(declare-fun m!1203433 () Bool)

(assert (=> mapNonEmpty!55093 m!1203433))

(declare-fun m!1203435 () Bool)

(assert (=> b!1315137 m!1203435))

(check-sat (not start!111078) b_and!48121 tp_is_empty!35643 (not mapNonEmpty!55093) (not b!1315134) (not b_next!29913) (not b!1315133) (not b!1315137))
(check-sat b_and!48121 (not b_next!29913))
