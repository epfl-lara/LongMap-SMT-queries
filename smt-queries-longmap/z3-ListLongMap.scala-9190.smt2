; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110488 () Bool)

(assert start!110488)

(declare-fun b_free!29323 () Bool)

(declare-fun b_next!29323 () Bool)

(assert (=> start!110488 (= b_free!29323 (not b_next!29323))))

(declare-fun tp!103292 () Bool)

(declare-fun b_and!47513 () Bool)

(assert (=> start!110488 (= tp!103292 b_and!47513)))

(declare-fun res!867576 () Bool)

(declare-fun e!745751 () Bool)

(assert (=> start!110488 (=> (not res!867576) (not e!745751))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110488 (= res!867576 (validMask!0 mask!2040))))

(assert (=> start!110488 e!745751))

(assert (=> start!110488 tp!103292))

(declare-datatypes ((array!87023 0))(
  ( (array!87024 (arr!41992 (Array (_ BitVec 32) (_ BitVec 64))) (size!42544 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87023)

(declare-fun array_inv!31935 (array!87023) Bool)

(assert (=> start!110488 (array_inv!31935 _keys!1628)))

(assert (=> start!110488 true))

(declare-fun tp_is_empty!35053 () Bool)

(assert (=> start!110488 tp_is_empty!35053))

(declare-datatypes ((V!51841 0))(
  ( (V!51842 (val!17601 Int)) )
))
(declare-datatypes ((ValueCell!16628 0))(
  ( (ValueCellFull!16628 (v!20227 V!51841)) (EmptyCell!16628) )
))
(declare-datatypes ((array!87025 0))(
  ( (array!87026 (arr!41993 (Array (_ BitVec 32) ValueCell!16628)) (size!42545 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87025)

(declare-fun e!745754 () Bool)

(declare-fun array_inv!31936 (array!87025) Bool)

(assert (=> start!110488 (and (array_inv!31936 _values!1354) e!745754)))

(declare-fun b!1306945 () Bool)

(declare-fun res!867579 () Bool)

(assert (=> b!1306945 (=> (not res!867579) (not e!745751))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306945 (= res!867579 (and (= (size!42545 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42544 _keys!1628) (size!42545 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54208 () Bool)

(declare-fun mapRes!54208 () Bool)

(declare-fun tp!103291 () Bool)

(declare-fun e!745753 () Bool)

(assert (=> mapNonEmpty!54208 (= mapRes!54208 (and tp!103291 e!745753))))

(declare-fun mapRest!54208 () (Array (_ BitVec 32) ValueCell!16628))

(declare-fun mapKey!54208 () (_ BitVec 32))

(declare-fun mapValue!54208 () ValueCell!16628)

(assert (=> mapNonEmpty!54208 (= (arr!41993 _values!1354) (store mapRest!54208 mapKey!54208 mapValue!54208))))

(declare-fun b!1306946 () Bool)

(assert (=> b!1306946 (= e!745753 tp_is_empty!35053)))

(declare-fun b!1306947 () Bool)

(declare-fun res!867577 () Bool)

(assert (=> b!1306947 (=> (not res!867577) (not e!745751))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1306947 (= res!867577 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42544 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54208 () Bool)

(assert (=> mapIsEmpty!54208 mapRes!54208))

(declare-fun b!1306948 () Bool)

(declare-fun e!745750 () Bool)

(assert (=> b!1306948 (= e!745754 (and e!745750 mapRes!54208))))

(declare-fun condMapEmpty!54208 () Bool)

(declare-fun mapDefault!54208 () ValueCell!16628)

(assert (=> b!1306948 (= condMapEmpty!54208 (= (arr!41993 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16628)) mapDefault!54208)))))

(declare-fun b!1306949 () Bool)

(assert (=> b!1306949 (= e!745751 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!584817 () Bool)

(declare-fun minValue!1296 () V!51841)

(declare-fun zeroValue!1296 () V!51841)

(declare-datatypes ((tuple2!22734 0))(
  ( (tuple2!22735 (_1!11378 (_ BitVec 64)) (_2!11378 V!51841)) )
))
(declare-datatypes ((List!29858 0))(
  ( (Nil!29855) (Cons!29854 (h!31063 tuple2!22734) (t!43456 List!29858)) )
))
(declare-datatypes ((ListLongMap!20391 0))(
  ( (ListLongMap!20392 (toList!10211 List!29858)) )
))
(declare-fun contains!8288 (ListLongMap!20391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5106 (array!87023 array!87025 (_ BitVec 32) (_ BitVec 32) V!51841 V!51841 (_ BitVec 32) Int) ListLongMap!20391)

(assert (=> b!1306949 (= lt!584817 (contains!8288 (getCurrentListMap!5106 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1306950 () Bool)

(assert (=> b!1306950 (= e!745750 tp_is_empty!35053)))

(declare-fun b!1306951 () Bool)

(declare-fun res!867578 () Bool)

(assert (=> b!1306951 (=> (not res!867578) (not e!745751))))

(declare-datatypes ((List!29859 0))(
  ( (Nil!29856) (Cons!29855 (h!31064 (_ BitVec 64)) (t!43457 List!29859)) )
))
(declare-fun arrayNoDuplicates!0 (array!87023 (_ BitVec 32) List!29859) Bool)

(assert (=> b!1306951 (= res!867578 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29856))))

(declare-fun b!1306952 () Bool)

(declare-fun res!867580 () Bool)

(assert (=> b!1306952 (=> (not res!867580) (not e!745751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87023 (_ BitVec 32)) Bool)

(assert (=> b!1306952 (= res!867580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110488 res!867576) b!1306945))

(assert (= (and b!1306945 res!867579) b!1306952))

(assert (= (and b!1306952 res!867580) b!1306951))

(assert (= (and b!1306951 res!867578) b!1306947))

(assert (= (and b!1306947 res!867577) b!1306949))

(assert (= (and b!1306948 condMapEmpty!54208) mapIsEmpty!54208))

(assert (= (and b!1306948 (not condMapEmpty!54208)) mapNonEmpty!54208))

(get-info :version)

(assert (= (and mapNonEmpty!54208 ((_ is ValueCellFull!16628) mapValue!54208)) b!1306946))

(assert (= (and b!1306948 ((_ is ValueCellFull!16628) mapDefault!54208)) b!1306950))

(assert (= start!110488 b!1306948))

(declare-fun m!1197333 () Bool)

(assert (=> b!1306951 m!1197333))

(declare-fun m!1197335 () Bool)

(assert (=> mapNonEmpty!54208 m!1197335))

(declare-fun m!1197337 () Bool)

(assert (=> b!1306952 m!1197337))

(declare-fun m!1197339 () Bool)

(assert (=> start!110488 m!1197339))

(declare-fun m!1197341 () Bool)

(assert (=> start!110488 m!1197341))

(declare-fun m!1197343 () Bool)

(assert (=> start!110488 m!1197343))

(declare-fun m!1197345 () Bool)

(assert (=> b!1306949 m!1197345))

(assert (=> b!1306949 m!1197345))

(declare-fun m!1197347 () Bool)

(assert (=> b!1306949 m!1197347))

(check-sat (not b_next!29323) (not start!110488) (not b!1306949) tp_is_empty!35053 b_and!47513 (not mapNonEmpty!54208) (not b!1306952) (not b!1306951))
(check-sat b_and!47513 (not b_next!29323))
