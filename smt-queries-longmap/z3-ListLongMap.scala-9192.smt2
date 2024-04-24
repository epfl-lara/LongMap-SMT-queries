; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110724 () Bool)

(assert start!110724)

(declare-fun b_free!29335 () Bool)

(declare-fun b_next!29335 () Bool)

(assert (=> start!110724 (= b_free!29335 (not b_next!29335))))

(declare-fun tp!103326 () Bool)

(declare-fun b_and!47545 () Bool)

(assert (=> start!110724 (= tp!103326 b_and!47545)))

(declare-fun b!1308458 () Bool)

(declare-fun res!868217 () Bool)

(declare-fun e!746719 () Bool)

(assert (=> b!1308458 (=> (not res!868217) (not e!746719))))

(declare-datatypes ((array!87195 0))(
  ( (array!87196 (arr!42073 (Array (_ BitVec 32) (_ BitVec 64))) (size!42624 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87195)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87195 (_ BitVec 32)) Bool)

(assert (=> b!1308458 (= res!868217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54226 () Bool)

(declare-fun mapRes!54226 () Bool)

(declare-fun tp!103327 () Bool)

(declare-fun e!746716 () Bool)

(assert (=> mapNonEmpty!54226 (= mapRes!54226 (and tp!103327 e!746716))))

(declare-datatypes ((V!51857 0))(
  ( (V!51858 (val!17607 Int)) )
))
(declare-datatypes ((ValueCell!16634 0))(
  ( (ValueCellFull!16634 (v!20229 V!51857)) (EmptyCell!16634) )
))
(declare-fun mapRest!54226 () (Array (_ BitVec 32) ValueCell!16634))

(declare-fun mapValue!54226 () ValueCell!16634)

(declare-datatypes ((array!87197 0))(
  ( (array!87198 (arr!42074 (Array (_ BitVec 32) ValueCell!16634)) (size!42625 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87197)

(declare-fun mapKey!54226 () (_ BitVec 32))

(assert (=> mapNonEmpty!54226 (= (arr!42074 _values!1354) (store mapRest!54226 mapKey!54226 mapValue!54226))))

(declare-fun b!1308460 () Bool)

(assert (=> b!1308460 (= e!746719 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585497 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51857)

(declare-fun zeroValue!1296 () V!51857)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22696 0))(
  ( (tuple2!22697 (_1!11359 (_ BitVec 64)) (_2!11359 V!51857)) )
))
(declare-datatypes ((List!29864 0))(
  ( (Nil!29861) (Cons!29860 (h!31078 tuple2!22696) (t!43462 List!29864)) )
))
(declare-datatypes ((ListLongMap!20361 0))(
  ( (ListLongMap!20362 (toList!10196 List!29864)) )
))
(declare-fun contains!8358 (ListLongMap!20361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5200 (array!87195 array!87197 (_ BitVec 32) (_ BitVec 32) V!51857 V!51857 (_ BitVec 32) Int) ListLongMap!20361)

(assert (=> b!1308460 (= lt!585497 (contains!8358 (getCurrentListMap!5200 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54226 () Bool)

(assert (=> mapIsEmpty!54226 mapRes!54226))

(declare-fun b!1308461 () Bool)

(declare-fun tp_is_empty!35065 () Bool)

(assert (=> b!1308461 (= e!746716 tp_is_empty!35065)))

(declare-fun res!868215 () Bool)

(assert (=> start!110724 (=> (not res!868215) (not e!746719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110724 (= res!868215 (validMask!0 mask!2040))))

(assert (=> start!110724 e!746719))

(assert (=> start!110724 tp!103326))

(declare-fun array_inv!32059 (array!87195) Bool)

(assert (=> start!110724 (array_inv!32059 _keys!1628)))

(assert (=> start!110724 true))

(assert (=> start!110724 tp_is_empty!35065))

(declare-fun e!746720 () Bool)

(declare-fun array_inv!32060 (array!87197) Bool)

(assert (=> start!110724 (and (array_inv!32060 _values!1354) e!746720)))

(declare-fun b!1308459 () Bool)

(declare-fun res!868216 () Bool)

(assert (=> b!1308459 (=> (not res!868216) (not e!746719))))

(assert (=> b!1308459 (= res!868216 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42624 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308462 () Bool)

(declare-fun e!746717 () Bool)

(assert (=> b!1308462 (= e!746717 tp_is_empty!35065)))

(declare-fun b!1308463 () Bool)

(assert (=> b!1308463 (= e!746720 (and e!746717 mapRes!54226))))

(declare-fun condMapEmpty!54226 () Bool)

(declare-fun mapDefault!54226 () ValueCell!16634)

(assert (=> b!1308463 (= condMapEmpty!54226 (= (arr!42074 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16634)) mapDefault!54226)))))

(declare-fun b!1308464 () Bool)

(declare-fun res!868214 () Bool)

(assert (=> b!1308464 (=> (not res!868214) (not e!746719))))

(assert (=> b!1308464 (= res!868214 (and (= (size!42625 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42624 _keys!1628) (size!42625 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308465 () Bool)

(declare-fun res!868213 () Bool)

(assert (=> b!1308465 (=> (not res!868213) (not e!746719))))

(declare-datatypes ((List!29865 0))(
  ( (Nil!29862) (Cons!29861 (h!31079 (_ BitVec 64)) (t!43463 List!29865)) )
))
(declare-fun arrayNoDuplicates!0 (array!87195 (_ BitVec 32) List!29865) Bool)

(assert (=> b!1308465 (= res!868213 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29862))))

(assert (= (and start!110724 res!868215) b!1308464))

(assert (= (and b!1308464 res!868214) b!1308458))

(assert (= (and b!1308458 res!868217) b!1308465))

(assert (= (and b!1308465 res!868213) b!1308459))

(assert (= (and b!1308459 res!868216) b!1308460))

(assert (= (and b!1308463 condMapEmpty!54226) mapIsEmpty!54226))

(assert (= (and b!1308463 (not condMapEmpty!54226)) mapNonEmpty!54226))

(get-info :version)

(assert (= (and mapNonEmpty!54226 ((_ is ValueCellFull!16634) mapValue!54226)) b!1308461))

(assert (= (and b!1308463 ((_ is ValueCellFull!16634) mapDefault!54226)) b!1308462))

(assert (= start!110724 b!1308463))

(declare-fun m!1199543 () Bool)

(assert (=> b!1308460 m!1199543))

(assert (=> b!1308460 m!1199543))

(declare-fun m!1199545 () Bool)

(assert (=> b!1308460 m!1199545))

(declare-fun m!1199547 () Bool)

(assert (=> b!1308458 m!1199547))

(declare-fun m!1199549 () Bool)

(assert (=> b!1308465 m!1199549))

(declare-fun m!1199551 () Bool)

(assert (=> start!110724 m!1199551))

(declare-fun m!1199553 () Bool)

(assert (=> start!110724 m!1199553))

(declare-fun m!1199555 () Bool)

(assert (=> start!110724 m!1199555))

(declare-fun m!1199557 () Bool)

(assert (=> mapNonEmpty!54226 m!1199557))

(check-sat (not b_next!29335) (not b!1308460) (not b!1308458) (not mapNonEmpty!54226) tp_is_empty!35065 b_and!47545 (not start!110724) (not b!1308465))
(check-sat b_and!47545 (not b_next!29335))
