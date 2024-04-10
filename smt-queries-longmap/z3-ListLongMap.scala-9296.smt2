; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111126 () Bool)

(assert start!111126)

(declare-fun b_free!29961 () Bool)

(declare-fun b_next!29961 () Bool)

(assert (=> start!111126 (= b_free!29961 (not b_next!29961))))

(declare-fun tp!105204 () Bool)

(declare-fun b_and!48169 () Bool)

(assert (=> start!111126 (= tp!105204 b_and!48169)))

(declare-fun b!1315742 () Bool)

(declare-fun e!750569 () Bool)

(declare-fun e!750570 () Bool)

(declare-fun mapRes!55165 () Bool)

(assert (=> b!1315742 (= e!750569 (and e!750570 mapRes!55165))))

(declare-fun condMapEmpty!55165 () Bool)

(declare-datatypes ((V!52691 0))(
  ( (V!52692 (val!17920 Int)) )
))
(declare-datatypes ((ValueCell!16947 0))(
  ( (ValueCellFull!16947 (v!20547 V!52691)) (EmptyCell!16947) )
))
(declare-datatypes ((array!88342 0))(
  ( (array!88343 (arr!42651 (Array (_ BitVec 32) ValueCell!16947)) (size!43201 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88342)

(declare-fun mapDefault!55165 () ValueCell!16947)

(assert (=> b!1315742 (= condMapEmpty!55165 (= (arr!42651 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16947)) mapDefault!55165)))))

(declare-fun b!1315743 () Bool)

(declare-fun res!873465 () Bool)

(declare-fun e!750568 () Bool)

(assert (=> b!1315743 (=> (not res!873465) (not e!750568))))

(declare-datatypes ((array!88344 0))(
  ( (array!88345 (arr!42652 (Array (_ BitVec 32) (_ BitVec 64))) (size!43202 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88344)

(declare-datatypes ((List!30256 0))(
  ( (Nil!30253) (Cons!30252 (h!31461 (_ BitVec 64)) (t!43862 List!30256)) )
))
(declare-fun arrayNoDuplicates!0 (array!88344 (_ BitVec 32) List!30256) Bool)

(assert (=> b!1315743 (= res!873465 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30253))))

(declare-fun mapNonEmpty!55165 () Bool)

(declare-fun tp!105205 () Bool)

(declare-fun e!750572 () Bool)

(assert (=> mapNonEmpty!55165 (= mapRes!55165 (and tp!105205 e!750572))))

(declare-fun mapValue!55165 () ValueCell!16947)

(declare-fun mapKey!55165 () (_ BitVec 32))

(declare-fun mapRest!55165 () (Array (_ BitVec 32) ValueCell!16947))

(assert (=> mapNonEmpty!55165 (= (arr!42651 _values!1354) (store mapRest!55165 mapKey!55165 mapValue!55165))))

(declare-fun b!1315744 () Bool)

(declare-fun tp_is_empty!35691 () Bool)

(assert (=> b!1315744 (= e!750570 tp_is_empty!35691)))

(declare-fun b!1315745 () Bool)

(declare-fun res!873464 () Bool)

(assert (=> b!1315745 (=> (not res!873464) (not e!750568))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88344 (_ BitVec 32)) Bool)

(assert (=> b!1315745 (= res!873464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55165 () Bool)

(assert (=> mapIsEmpty!55165 mapRes!55165))

(declare-fun b!1315746 () Bool)

(declare-fun res!873462 () Bool)

(assert (=> b!1315746 (=> (not res!873462) (not e!750568))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315746 (= res!873462 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43202 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315747 () Bool)

(assert (=> b!1315747 (= e!750572 tp_is_empty!35691)))

(declare-fun b!1315748 () Bool)

(assert (=> b!1315748 (= e!750568 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585951 () Bool)

(declare-fun minValue!1296 () V!52691)

(declare-fun zeroValue!1296 () V!52691)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23120 0))(
  ( (tuple2!23121 (_1!11571 (_ BitVec 64)) (_2!11571 V!52691)) )
))
(declare-datatypes ((List!30257 0))(
  ( (Nil!30254) (Cons!30253 (h!31462 tuple2!23120) (t!43863 List!30257)) )
))
(declare-datatypes ((ListLongMap!20777 0))(
  ( (ListLongMap!20778 (toList!10404 List!30257)) )
))
(declare-fun contains!8554 (ListLongMap!20777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5417 (array!88344 array!88342 (_ BitVec 32) (_ BitVec 32) V!52691 V!52691 (_ BitVec 32) Int) ListLongMap!20777)

(assert (=> b!1315748 (= lt!585951 (contains!8554 (getCurrentListMap!5417 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315749 () Bool)

(declare-fun res!873461 () Bool)

(assert (=> b!1315749 (=> (not res!873461) (not e!750568))))

(assert (=> b!1315749 (= res!873461 (and (= (size!43201 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43202 _keys!1628) (size!43201 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!873463 () Bool)

(assert (=> start!111126 (=> (not res!873463) (not e!750568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111126 (= res!873463 (validMask!0 mask!2040))))

(assert (=> start!111126 e!750568))

(assert (=> start!111126 tp!105204))

(declare-fun array_inv!32213 (array!88344) Bool)

(assert (=> start!111126 (array_inv!32213 _keys!1628)))

(assert (=> start!111126 true))

(assert (=> start!111126 tp_is_empty!35691))

(declare-fun array_inv!32214 (array!88342) Bool)

(assert (=> start!111126 (and (array_inv!32214 _values!1354) e!750569)))

(assert (= (and start!111126 res!873463) b!1315749))

(assert (= (and b!1315749 res!873461) b!1315745))

(assert (= (and b!1315745 res!873464) b!1315743))

(assert (= (and b!1315743 res!873465) b!1315746))

(assert (= (and b!1315746 res!873462) b!1315748))

(assert (= (and b!1315742 condMapEmpty!55165) mapIsEmpty!55165))

(assert (= (and b!1315742 (not condMapEmpty!55165)) mapNonEmpty!55165))

(get-info :version)

(assert (= (and mapNonEmpty!55165 ((_ is ValueCellFull!16947) mapValue!55165)) b!1315747))

(assert (= (and b!1315742 ((_ is ValueCellFull!16947) mapDefault!55165)) b!1315744))

(assert (= start!111126 b!1315742))

(declare-fun m!1203835 () Bool)

(assert (=> start!111126 m!1203835))

(declare-fun m!1203837 () Bool)

(assert (=> start!111126 m!1203837))

(declare-fun m!1203839 () Bool)

(assert (=> start!111126 m!1203839))

(declare-fun m!1203841 () Bool)

(assert (=> b!1315748 m!1203841))

(assert (=> b!1315748 m!1203841))

(declare-fun m!1203843 () Bool)

(assert (=> b!1315748 m!1203843))

(declare-fun m!1203845 () Bool)

(assert (=> mapNonEmpty!55165 m!1203845))

(declare-fun m!1203847 () Bool)

(assert (=> b!1315745 m!1203847))

(declare-fun m!1203849 () Bool)

(assert (=> b!1315743 m!1203849))

(check-sat (not b_next!29961) (not start!111126) (not b!1315745) (not b!1315743) (not mapNonEmpty!55165) (not b!1315748) tp_is_empty!35691 b_and!48169)
(check-sat b_and!48169 (not b_next!29961))
