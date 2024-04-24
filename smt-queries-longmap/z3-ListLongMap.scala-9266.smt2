; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111168 () Bool)

(assert start!111168)

(declare-fun b_free!29779 () Bool)

(declare-fun b_next!29779 () Bool)

(assert (=> start!111168 (= b_free!29779 (not b_next!29779))))

(declare-fun tp!104658 () Bool)

(declare-fun b_and!47989 () Bool)

(assert (=> start!111168 (= tp!104658 b_and!47989)))

(declare-fun b!1314785 () Bool)

(declare-fun e!750050 () Bool)

(declare-fun tp_is_empty!35509 () Bool)

(assert (=> b!1314785 (= e!750050 tp_is_empty!35509)))

(declare-fun b!1314786 () Bool)

(declare-fun res!872542 () Bool)

(declare-fun e!750049 () Bool)

(assert (=> b!1314786 (=> (not res!872542) (not e!750049))))

(declare-datatypes ((array!88047 0))(
  ( (array!88048 (arr!42499 (Array (_ BitVec 32) (_ BitVec 64))) (size!43050 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88047)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52449 0))(
  ( (V!52450 (val!17829 Int)) )
))
(declare-datatypes ((ValueCell!16856 0))(
  ( (ValueCellFull!16856 (v!20451 V!52449)) (EmptyCell!16856) )
))
(declare-datatypes ((array!88049 0))(
  ( (array!88050 (arr!42500 (Array (_ BitVec 32) ValueCell!16856)) (size!43051 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88049)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314786 (= res!872542 (and (= (size!43051 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43050 _keys!1628) (size!43051 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314787 () Bool)

(assert (=> b!1314787 (= e!750049 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52449)

(declare-fun lt!586154 () Bool)

(declare-fun zeroValue!1296 () V!52449)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23018 0))(
  ( (tuple2!23019 (_1!11520 (_ BitVec 64)) (_2!11520 V!52449)) )
))
(declare-datatypes ((List!30168 0))(
  ( (Nil!30165) (Cons!30164 (h!31382 tuple2!23018) (t!43766 List!30168)) )
))
(declare-datatypes ((ListLongMap!20683 0))(
  ( (ListLongMap!20684 (toList!10357 List!30168)) )
))
(declare-fun contains!8519 (ListLongMap!20683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5361 (array!88047 array!88049 (_ BitVec 32) (_ BitVec 32) V!52449 V!52449 (_ BitVec 32) Int) ListLongMap!20683)

(assert (=> b!1314787 (= lt!586154 (contains!8519 (getCurrentListMap!5361 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314788 () Bool)

(declare-fun e!750047 () Bool)

(declare-fun mapRes!54892 () Bool)

(assert (=> b!1314788 (= e!750047 (and e!750050 mapRes!54892))))

(declare-fun condMapEmpty!54892 () Bool)

(declare-fun mapDefault!54892 () ValueCell!16856)

(assert (=> b!1314788 (= condMapEmpty!54892 (= (arr!42500 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16856)) mapDefault!54892)))))

(declare-fun b!1314789 () Bool)

(declare-fun e!750046 () Bool)

(assert (=> b!1314789 (= e!750046 tp_is_empty!35509)))

(declare-fun res!872544 () Bool)

(assert (=> start!111168 (=> (not res!872544) (not e!750049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111168 (= res!872544 (validMask!0 mask!2040))))

(assert (=> start!111168 e!750049))

(assert (=> start!111168 tp!104658))

(declare-fun array_inv!32365 (array!88047) Bool)

(assert (=> start!111168 (array_inv!32365 _keys!1628)))

(assert (=> start!111168 true))

(assert (=> start!111168 tp_is_empty!35509))

(declare-fun array_inv!32366 (array!88049) Bool)

(assert (=> start!111168 (and (array_inv!32366 _values!1354) e!750047)))

(declare-fun b!1314790 () Bool)

(declare-fun res!872546 () Bool)

(assert (=> b!1314790 (=> (not res!872546) (not e!750049))))

(declare-datatypes ((List!30169 0))(
  ( (Nil!30166) (Cons!30165 (h!31383 (_ BitVec 64)) (t!43767 List!30169)) )
))
(declare-fun arrayNoDuplicates!0 (array!88047 (_ BitVec 32) List!30169) Bool)

(assert (=> b!1314790 (= res!872546 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30166))))

(declare-fun mapIsEmpty!54892 () Bool)

(assert (=> mapIsEmpty!54892 mapRes!54892))

(declare-fun b!1314791 () Bool)

(declare-fun res!872543 () Bool)

(assert (=> b!1314791 (=> (not res!872543) (not e!750049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88047 (_ BitVec 32)) Bool)

(assert (=> b!1314791 (= res!872543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54892 () Bool)

(declare-fun tp!104659 () Bool)

(assert (=> mapNonEmpty!54892 (= mapRes!54892 (and tp!104659 e!750046))))

(declare-fun mapValue!54892 () ValueCell!16856)

(declare-fun mapRest!54892 () (Array (_ BitVec 32) ValueCell!16856))

(declare-fun mapKey!54892 () (_ BitVec 32))

(assert (=> mapNonEmpty!54892 (= (arr!42500 _values!1354) (store mapRest!54892 mapKey!54892 mapValue!54892))))

(declare-fun b!1314792 () Bool)

(declare-fun res!872545 () Bool)

(assert (=> b!1314792 (=> (not res!872545) (not e!750049))))

(assert (=> b!1314792 (= res!872545 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43050 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111168 res!872544) b!1314786))

(assert (= (and b!1314786 res!872542) b!1314791))

(assert (= (and b!1314791 res!872543) b!1314790))

(assert (= (and b!1314790 res!872546) b!1314792))

(assert (= (and b!1314792 res!872545) b!1314787))

(assert (= (and b!1314788 condMapEmpty!54892) mapIsEmpty!54892))

(assert (= (and b!1314788 (not condMapEmpty!54892)) mapNonEmpty!54892))

(get-info :version)

(assert (= (and mapNonEmpty!54892 ((_ is ValueCellFull!16856) mapValue!54892)) b!1314789))

(assert (= (and b!1314788 ((_ is ValueCellFull!16856) mapDefault!54892)) b!1314785))

(assert (= start!111168 b!1314788))

(declare-fun m!1203917 () Bool)

(assert (=> mapNonEmpty!54892 m!1203917))

(declare-fun m!1203919 () Bool)

(assert (=> start!111168 m!1203919))

(declare-fun m!1203921 () Bool)

(assert (=> start!111168 m!1203921))

(declare-fun m!1203923 () Bool)

(assert (=> start!111168 m!1203923))

(declare-fun m!1203925 () Bool)

(assert (=> b!1314791 m!1203925))

(declare-fun m!1203927 () Bool)

(assert (=> b!1314787 m!1203927))

(assert (=> b!1314787 m!1203927))

(declare-fun m!1203929 () Bool)

(assert (=> b!1314787 m!1203929))

(declare-fun m!1203931 () Bool)

(assert (=> b!1314790 m!1203931))

(check-sat (not b!1314791) (not b!1314787) (not b!1314790) (not b_next!29779) b_and!47989 (not start!111168) (not mapNonEmpty!54892) tp_is_empty!35509)
(check-sat b_and!47989 (not b_next!29779))
