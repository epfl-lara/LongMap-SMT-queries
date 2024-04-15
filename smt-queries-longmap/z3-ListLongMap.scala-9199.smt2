; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110542 () Bool)

(assert start!110542)

(declare-fun b_free!29377 () Bool)

(declare-fun b_next!29377 () Bool)

(assert (=> start!110542 (= b_free!29377 (not b_next!29377))))

(declare-fun tp!103453 () Bool)

(declare-fun b_and!47567 () Bool)

(assert (=> start!110542 (= tp!103453 b_and!47567)))

(declare-fun mapNonEmpty!54289 () Bool)

(declare-fun mapRes!54289 () Bool)

(declare-fun tp!103454 () Bool)

(declare-fun e!746156 () Bool)

(assert (=> mapNonEmpty!54289 (= mapRes!54289 (and tp!103454 e!746156))))

(declare-datatypes ((V!51913 0))(
  ( (V!51914 (val!17628 Int)) )
))
(declare-datatypes ((ValueCell!16655 0))(
  ( (ValueCellFull!16655 (v!20254 V!51913)) (EmptyCell!16655) )
))
(declare-fun mapRest!54289 () (Array (_ BitVec 32) ValueCell!16655))

(declare-datatypes ((array!87129 0))(
  ( (array!87130 (arr!42045 (Array (_ BitVec 32) ValueCell!16655)) (size!42597 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87129)

(declare-fun mapValue!54289 () ValueCell!16655)

(declare-fun mapKey!54289 () (_ BitVec 32))

(assert (=> mapNonEmpty!54289 (= (arr!42045 _values!1354) (store mapRest!54289 mapKey!54289 mapValue!54289))))

(declare-fun b!1307593 () Bool)

(declare-fun res!867983 () Bool)

(declare-fun e!746158 () Bool)

(assert (=> b!1307593 (=> (not res!867983) (not e!746158))))

(declare-datatypes ((array!87131 0))(
  ( (array!87132 (arr!42046 (Array (_ BitVec 32) (_ BitVec 64))) (size!42598 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87131)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87131 (_ BitVec 32)) Bool)

(assert (=> b!1307593 (= res!867983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307594 () Bool)

(declare-fun e!746155 () Bool)

(declare-fun tp_is_empty!35107 () Bool)

(assert (=> b!1307594 (= e!746155 tp_is_empty!35107)))

(declare-fun res!867982 () Bool)

(assert (=> start!110542 (=> (not res!867982) (not e!746158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110542 (= res!867982 (validMask!0 mask!2040))))

(assert (=> start!110542 e!746158))

(assert (=> start!110542 tp!103453))

(declare-fun array_inv!31977 (array!87131) Bool)

(assert (=> start!110542 (array_inv!31977 _keys!1628)))

(assert (=> start!110542 true))

(assert (=> start!110542 tp_is_empty!35107))

(declare-fun e!746159 () Bool)

(declare-fun array_inv!31978 (array!87129) Bool)

(assert (=> start!110542 (and (array_inv!31978 _values!1354) e!746159)))

(declare-fun b!1307595 () Bool)

(assert (=> b!1307595 (= e!746159 (and e!746155 mapRes!54289))))

(declare-fun condMapEmpty!54289 () Bool)

(declare-fun mapDefault!54289 () ValueCell!16655)

(assert (=> b!1307595 (= condMapEmpty!54289 (= (arr!42045 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16655)) mapDefault!54289)))))

(declare-fun b!1307596 () Bool)

(assert (=> b!1307596 (= e!746156 tp_is_empty!35107)))

(declare-fun b!1307597 () Bool)

(assert (=> b!1307597 (= e!746158 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51913)

(declare-fun zeroValue!1296 () V!51913)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!584898 () Bool)

(declare-datatypes ((tuple2!22774 0))(
  ( (tuple2!22775 (_1!11398 (_ BitVec 64)) (_2!11398 V!51913)) )
))
(declare-datatypes ((List!29900 0))(
  ( (Nil!29897) (Cons!29896 (h!31105 tuple2!22774) (t!43498 List!29900)) )
))
(declare-datatypes ((ListLongMap!20431 0))(
  ( (ListLongMap!20432 (toList!10231 List!29900)) )
))
(declare-fun contains!8308 (ListLongMap!20431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5126 (array!87131 array!87129 (_ BitVec 32) (_ BitVec 32) V!51913 V!51913 (_ BitVec 32) Int) ListLongMap!20431)

(assert (=> b!1307597 (= lt!584898 (contains!8308 (getCurrentListMap!5126 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307598 () Bool)

(declare-fun res!867981 () Bool)

(assert (=> b!1307598 (=> (not res!867981) (not e!746158))))

(assert (=> b!1307598 (= res!867981 (and (= (size!42597 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42598 _keys!1628) (size!42597 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307599 () Bool)

(declare-fun res!867985 () Bool)

(assert (=> b!1307599 (=> (not res!867985) (not e!746158))))

(assert (=> b!1307599 (= res!867985 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42598 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307600 () Bool)

(declare-fun res!867984 () Bool)

(assert (=> b!1307600 (=> (not res!867984) (not e!746158))))

(declare-datatypes ((List!29901 0))(
  ( (Nil!29898) (Cons!29897 (h!31106 (_ BitVec 64)) (t!43499 List!29901)) )
))
(declare-fun arrayNoDuplicates!0 (array!87131 (_ BitVec 32) List!29901) Bool)

(assert (=> b!1307600 (= res!867984 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29898))))

(declare-fun mapIsEmpty!54289 () Bool)

(assert (=> mapIsEmpty!54289 mapRes!54289))

(assert (= (and start!110542 res!867982) b!1307598))

(assert (= (and b!1307598 res!867981) b!1307593))

(assert (= (and b!1307593 res!867983) b!1307600))

(assert (= (and b!1307600 res!867984) b!1307599))

(assert (= (and b!1307599 res!867985) b!1307597))

(assert (= (and b!1307595 condMapEmpty!54289) mapIsEmpty!54289))

(assert (= (and b!1307595 (not condMapEmpty!54289)) mapNonEmpty!54289))

(get-info :version)

(assert (= (and mapNonEmpty!54289 ((_ is ValueCellFull!16655) mapValue!54289)) b!1307596))

(assert (= (and b!1307595 ((_ is ValueCellFull!16655) mapDefault!54289)) b!1307594))

(assert (= start!110542 b!1307595))

(declare-fun m!1197765 () Bool)

(assert (=> b!1307600 m!1197765))

(declare-fun m!1197767 () Bool)

(assert (=> start!110542 m!1197767))

(declare-fun m!1197769 () Bool)

(assert (=> start!110542 m!1197769))

(declare-fun m!1197771 () Bool)

(assert (=> start!110542 m!1197771))

(declare-fun m!1197773 () Bool)

(assert (=> b!1307597 m!1197773))

(assert (=> b!1307597 m!1197773))

(declare-fun m!1197775 () Bool)

(assert (=> b!1307597 m!1197775))

(declare-fun m!1197777 () Bool)

(assert (=> mapNonEmpty!54289 m!1197777))

(declare-fun m!1197779 () Bool)

(assert (=> b!1307593 m!1197779))

(check-sat (not b!1307597) (not b!1307600) (not b!1307593) b_and!47567 (not b_next!29377) (not start!110542) (not mapNonEmpty!54289) tp_is_empty!35107)
(check-sat b_and!47567 (not b_next!29377))
