; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110752 () Bool)

(assert start!110752)

(declare-fun b_free!29587 () Bool)

(declare-fun b_next!29587 () Bool)

(assert (=> start!110752 (= b_free!29587 (not b_next!29587))))

(declare-fun tp!104083 () Bool)

(declare-fun b_and!47777 () Bool)

(assert (=> start!110752 (= tp!104083 b_and!47777)))

(declare-fun b!1310761 () Bool)

(declare-fun res!870205 () Bool)

(declare-fun e!747732 () Bool)

(assert (=> b!1310761 (=> (not res!870205) (not e!747732))))

(declare-datatypes ((array!87537 0))(
  ( (array!87538 (arr!42249 (Array (_ BitVec 32) (_ BitVec 64))) (size!42801 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87537)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87537 (_ BitVec 32)) Bool)

(assert (=> b!1310761 (= res!870205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310762 () Bool)

(declare-fun res!870207 () Bool)

(assert (=> b!1310762 (=> (not res!870207) (not e!747732))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310762 (= res!870207 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42801 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54604 () Bool)

(declare-fun mapRes!54604 () Bool)

(declare-fun tp!104084 () Bool)

(declare-fun e!747730 () Bool)

(assert (=> mapNonEmpty!54604 (= mapRes!54604 (and tp!104084 e!747730))))

(declare-datatypes ((V!52193 0))(
  ( (V!52194 (val!17733 Int)) )
))
(declare-datatypes ((ValueCell!16760 0))(
  ( (ValueCellFull!16760 (v!20359 V!52193)) (EmptyCell!16760) )
))
(declare-datatypes ((array!87539 0))(
  ( (array!87540 (arr!42250 (Array (_ BitVec 32) ValueCell!16760)) (size!42802 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87539)

(declare-fun mapValue!54604 () ValueCell!16760)

(declare-fun mapKey!54604 () (_ BitVec 32))

(declare-fun mapRest!54604 () (Array (_ BitVec 32) ValueCell!16760))

(assert (=> mapNonEmpty!54604 (= (arr!42250 _values!1354) (store mapRest!54604 mapKey!54604 mapValue!54604))))

(declare-fun b!1310763 () Bool)

(declare-fun res!870208 () Bool)

(assert (=> b!1310763 (=> (not res!870208) (not e!747732))))

(declare-datatypes ((List!30056 0))(
  ( (Nil!30053) (Cons!30052 (h!31261 (_ BitVec 64)) (t!43654 List!30056)) )
))
(declare-fun arrayNoDuplicates!0 (array!87537 (_ BitVec 32) List!30056) Bool)

(assert (=> b!1310763 (= res!870208 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30053))))

(declare-fun b!1310764 () Bool)

(assert (=> b!1310764 (= e!747732 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52193)

(declare-fun zeroValue!1296 () V!52193)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585213 () Bool)

(declare-datatypes ((tuple2!22932 0))(
  ( (tuple2!22933 (_1!11477 (_ BitVec 64)) (_2!11477 V!52193)) )
))
(declare-datatypes ((List!30057 0))(
  ( (Nil!30054) (Cons!30053 (h!31262 tuple2!22932) (t!43655 List!30057)) )
))
(declare-datatypes ((ListLongMap!20589 0))(
  ( (ListLongMap!20590 (toList!10310 List!30057)) )
))
(declare-fun contains!8387 (ListLongMap!20589 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5205 (array!87537 array!87539 (_ BitVec 32) (_ BitVec 32) V!52193 V!52193 (_ BitVec 32) Int) ListLongMap!20589)

(assert (=> b!1310764 (= lt!585213 (contains!8387 (getCurrentListMap!5205 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310765 () Bool)

(declare-fun e!747733 () Bool)

(declare-fun e!747734 () Bool)

(assert (=> b!1310765 (= e!747733 (and e!747734 mapRes!54604))))

(declare-fun condMapEmpty!54604 () Bool)

(declare-fun mapDefault!54604 () ValueCell!16760)

(assert (=> b!1310765 (= condMapEmpty!54604 (= (arr!42250 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16760)) mapDefault!54604)))))

(declare-fun b!1310766 () Bool)

(declare-fun tp_is_empty!35317 () Bool)

(assert (=> b!1310766 (= e!747734 tp_is_empty!35317)))

(declare-fun mapIsEmpty!54604 () Bool)

(assert (=> mapIsEmpty!54604 mapRes!54604))

(declare-fun b!1310768 () Bool)

(declare-fun res!870204 () Bool)

(assert (=> b!1310768 (=> (not res!870204) (not e!747732))))

(assert (=> b!1310768 (= res!870204 (and (= (size!42802 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42801 _keys!1628) (size!42802 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310767 () Bool)

(assert (=> b!1310767 (= e!747730 tp_is_empty!35317)))

(declare-fun res!870206 () Bool)

(assert (=> start!110752 (=> (not res!870206) (not e!747732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110752 (= res!870206 (validMask!0 mask!2040))))

(assert (=> start!110752 e!747732))

(assert (=> start!110752 tp!104083))

(declare-fun array_inv!32109 (array!87537) Bool)

(assert (=> start!110752 (array_inv!32109 _keys!1628)))

(assert (=> start!110752 true))

(assert (=> start!110752 tp_is_empty!35317))

(declare-fun array_inv!32110 (array!87539) Bool)

(assert (=> start!110752 (and (array_inv!32110 _values!1354) e!747733)))

(assert (= (and start!110752 res!870206) b!1310768))

(assert (= (and b!1310768 res!870204) b!1310761))

(assert (= (and b!1310761 res!870205) b!1310763))

(assert (= (and b!1310763 res!870208) b!1310762))

(assert (= (and b!1310762 res!870207) b!1310764))

(assert (= (and b!1310765 condMapEmpty!54604) mapIsEmpty!54604))

(assert (= (and b!1310765 (not condMapEmpty!54604)) mapNonEmpty!54604))

(get-info :version)

(assert (= (and mapNonEmpty!54604 ((_ is ValueCellFull!16760) mapValue!54604)) b!1310767))

(assert (= (and b!1310765 ((_ is ValueCellFull!16760) mapDefault!54604)) b!1310766))

(assert (= start!110752 b!1310765))

(declare-fun m!1199985 () Bool)

(assert (=> start!110752 m!1199985))

(declare-fun m!1199987 () Bool)

(assert (=> start!110752 m!1199987))

(declare-fun m!1199989 () Bool)

(assert (=> start!110752 m!1199989))

(declare-fun m!1199991 () Bool)

(assert (=> b!1310764 m!1199991))

(assert (=> b!1310764 m!1199991))

(declare-fun m!1199993 () Bool)

(assert (=> b!1310764 m!1199993))

(declare-fun m!1199995 () Bool)

(assert (=> b!1310761 m!1199995))

(declare-fun m!1199997 () Bool)

(assert (=> mapNonEmpty!54604 m!1199997))

(declare-fun m!1199999 () Bool)

(assert (=> b!1310763 m!1199999))

(check-sat (not mapNonEmpty!54604) tp_is_empty!35317 (not b!1310763) (not b!1310761) (not b!1310764) b_and!47777 (not start!110752) (not b_next!29587))
(check-sat b_and!47777 (not b_next!29587))
