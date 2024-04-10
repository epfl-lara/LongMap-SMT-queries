; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110556 () Bool)

(assert start!110556)

(declare-fun b_free!29391 () Bool)

(declare-fun b_next!29391 () Bool)

(assert (=> start!110556 (= b_free!29391 (not b_next!29391))))

(declare-fun tp!103495 () Bool)

(declare-fun b_and!47599 () Bool)

(assert (=> start!110556 (= tp!103495 b_and!47599)))

(declare-fun b!1307831 () Bool)

(declare-fun e!746295 () Bool)

(declare-fun tp_is_empty!35121 () Bool)

(assert (=> b!1307831 (= e!746295 tp_is_empty!35121)))

(declare-fun b!1307832 () Bool)

(declare-fun res!868115 () Bool)

(declare-fun e!746293 () Bool)

(assert (=> b!1307832 (=> (not res!868115) (not e!746293))))

(declare-datatypes ((array!87242 0))(
  ( (array!87243 (arr!42101 (Array (_ BitVec 32) (_ BitVec 64))) (size!42651 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87242)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51931 0))(
  ( (V!51932 (val!17635 Int)) )
))
(declare-datatypes ((ValueCell!16662 0))(
  ( (ValueCellFull!16662 (v!20262 V!51931)) (EmptyCell!16662) )
))
(declare-datatypes ((array!87244 0))(
  ( (array!87245 (arr!42102 (Array (_ BitVec 32) ValueCell!16662)) (size!42652 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87244)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307832 (= res!868115 (and (= (size!42652 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42651 _keys!1628) (size!42652 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307833 () Bool)

(declare-fun res!868119 () Bool)

(assert (=> b!1307833 (=> (not res!868119) (not e!746293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87242 (_ BitVec 32)) Bool)

(assert (=> b!1307833 (= res!868119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54310 () Bool)

(declare-fun mapRes!54310 () Bool)

(declare-fun tp!103494 () Bool)

(declare-fun e!746294 () Bool)

(assert (=> mapNonEmpty!54310 (= mapRes!54310 (and tp!103494 e!746294))))

(declare-fun mapValue!54310 () ValueCell!16662)

(declare-fun mapKey!54310 () (_ BitVec 32))

(declare-fun mapRest!54310 () (Array (_ BitVec 32) ValueCell!16662))

(assert (=> mapNonEmpty!54310 (= (arr!42102 _values!1354) (store mapRest!54310 mapKey!54310 mapValue!54310))))

(declare-fun b!1307834 () Bool)

(assert (=> b!1307834 (= e!746293 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun lt!585105 () Bool)

(declare-fun minValue!1296 () V!51931)

(declare-fun zeroValue!1296 () V!51931)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22702 0))(
  ( (tuple2!22703 (_1!11362 (_ BitVec 64)) (_2!11362 V!51931)) )
))
(declare-datatypes ((List!29845 0))(
  ( (Nil!29842) (Cons!29841 (h!31050 tuple2!22702) (t!43451 List!29845)) )
))
(declare-datatypes ((ListLongMap!20359 0))(
  ( (ListLongMap!20360 (toList!10195 List!29845)) )
))
(declare-fun contains!8345 (ListLongMap!20359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5208 (array!87242 array!87244 (_ BitVec 32) (_ BitVec 32) V!51931 V!51931 (_ BitVec 32) Int) ListLongMap!20359)

(assert (=> b!1307834 (= lt!585105 (contains!8345 (getCurrentListMap!5208 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307835 () Bool)

(declare-fun e!746297 () Bool)

(assert (=> b!1307835 (= e!746297 (and e!746295 mapRes!54310))))

(declare-fun condMapEmpty!54310 () Bool)

(declare-fun mapDefault!54310 () ValueCell!16662)

(assert (=> b!1307835 (= condMapEmpty!54310 (= (arr!42102 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16662)) mapDefault!54310)))))

(declare-fun b!1307836 () Bool)

(declare-fun res!868116 () Bool)

(assert (=> b!1307836 (=> (not res!868116) (not e!746293))))

(declare-datatypes ((List!29846 0))(
  ( (Nil!29843) (Cons!29842 (h!31051 (_ BitVec 64)) (t!43452 List!29846)) )
))
(declare-fun arrayNoDuplicates!0 (array!87242 (_ BitVec 32) List!29846) Bool)

(assert (=> b!1307836 (= res!868116 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29843))))

(declare-fun b!1307837 () Bool)

(declare-fun res!868117 () Bool)

(assert (=> b!1307837 (=> (not res!868117) (not e!746293))))

(assert (=> b!1307837 (= res!868117 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42651 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307838 () Bool)

(assert (=> b!1307838 (= e!746294 tp_is_empty!35121)))

(declare-fun res!868118 () Bool)

(assert (=> start!110556 (=> (not res!868118) (not e!746293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110556 (= res!868118 (validMask!0 mask!2040))))

(assert (=> start!110556 e!746293))

(assert (=> start!110556 tp!103495))

(declare-fun array_inv!31821 (array!87242) Bool)

(assert (=> start!110556 (array_inv!31821 _keys!1628)))

(assert (=> start!110556 true))

(assert (=> start!110556 tp_is_empty!35121))

(declare-fun array_inv!31822 (array!87244) Bool)

(assert (=> start!110556 (and (array_inv!31822 _values!1354) e!746297)))

(declare-fun mapIsEmpty!54310 () Bool)

(assert (=> mapIsEmpty!54310 mapRes!54310))

(assert (= (and start!110556 res!868118) b!1307832))

(assert (= (and b!1307832 res!868115) b!1307833))

(assert (= (and b!1307833 res!868119) b!1307836))

(assert (= (and b!1307836 res!868116) b!1307837))

(assert (= (and b!1307837 res!868117) b!1307834))

(assert (= (and b!1307835 condMapEmpty!54310) mapIsEmpty!54310))

(assert (= (and b!1307835 (not condMapEmpty!54310)) mapNonEmpty!54310))

(get-info :version)

(assert (= (and mapNonEmpty!54310 ((_ is ValueCellFull!16662) mapValue!54310)) b!1307838))

(assert (= (and b!1307835 ((_ is ValueCellFull!16662) mapDefault!54310)) b!1307831))

(assert (= start!110556 b!1307835))

(declare-fun m!1198393 () Bool)

(assert (=> b!1307836 m!1198393))

(declare-fun m!1198395 () Bool)

(assert (=> start!110556 m!1198395))

(declare-fun m!1198397 () Bool)

(assert (=> start!110556 m!1198397))

(declare-fun m!1198399 () Bool)

(assert (=> start!110556 m!1198399))

(declare-fun m!1198401 () Bool)

(assert (=> b!1307833 m!1198401))

(declare-fun m!1198403 () Bool)

(assert (=> b!1307834 m!1198403))

(assert (=> b!1307834 m!1198403))

(declare-fun m!1198405 () Bool)

(assert (=> b!1307834 m!1198405))

(declare-fun m!1198407 () Bool)

(assert (=> mapNonEmpty!54310 m!1198407))

(check-sat (not start!110556) tp_is_empty!35121 b_and!47599 (not mapNonEmpty!54310) (not b_next!29391) (not b!1307834) (not b!1307836) (not b!1307833))
(check-sat b_and!47599 (not b_next!29391))
