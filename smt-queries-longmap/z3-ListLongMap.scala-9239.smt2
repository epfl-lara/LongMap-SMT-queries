; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110784 () Bool)

(assert start!110784)

(declare-fun b_free!29619 () Bool)

(declare-fun b_next!29619 () Bool)

(assert (=> start!110784 (= b_free!29619 (not b_next!29619))))

(declare-fun tp!104179 () Bool)

(declare-fun b_and!47827 () Bool)

(assert (=> start!110784 (= tp!104179 b_and!47827)))

(declare-fun b!1311215 () Bool)

(declare-fun res!870476 () Bool)

(declare-fun e!748004 () Bool)

(assert (=> b!1311215 (=> (not res!870476) (not e!748004))))

(declare-datatypes ((array!87686 0))(
  ( (array!87687 (arr!42323 (Array (_ BitVec 32) (_ BitVec 64))) (size!42873 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87686)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87686 (_ BitVec 32)) Bool)

(assert (=> b!1311215 (= res!870476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311216 () Bool)

(declare-fun e!748006 () Bool)

(declare-fun tp_is_empty!35349 () Bool)

(assert (=> b!1311216 (= e!748006 tp_is_empty!35349)))

(declare-fun mapNonEmpty!54652 () Bool)

(declare-fun mapRes!54652 () Bool)

(declare-fun tp!104178 () Bool)

(declare-fun e!748007 () Bool)

(assert (=> mapNonEmpty!54652 (= mapRes!54652 (and tp!104178 e!748007))))

(declare-datatypes ((V!52235 0))(
  ( (V!52236 (val!17749 Int)) )
))
(declare-datatypes ((ValueCell!16776 0))(
  ( (ValueCellFull!16776 (v!20376 V!52235)) (EmptyCell!16776) )
))
(declare-fun mapRest!54652 () (Array (_ BitVec 32) ValueCell!16776))

(declare-fun mapValue!54652 () ValueCell!16776)

(declare-fun mapKey!54652 () (_ BitVec 32))

(declare-datatypes ((array!87688 0))(
  ( (array!87689 (arr!42324 (Array (_ BitVec 32) ValueCell!16776)) (size!42874 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87688)

(assert (=> mapNonEmpty!54652 (= (arr!42324 _values!1354) (store mapRest!54652 mapKey!54652 mapValue!54652))))

(declare-fun b!1311217 () Bool)

(assert (=> b!1311217 (= e!748007 tp_is_empty!35349)))

(declare-fun b!1311218 () Bool)

(declare-fun res!870474 () Bool)

(assert (=> b!1311218 (=> (not res!870474) (not e!748004))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311218 (= res!870474 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42873 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54652 () Bool)

(assert (=> mapIsEmpty!54652 mapRes!54652))

(declare-fun res!870477 () Bool)

(assert (=> start!110784 (=> (not res!870477) (not e!748004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110784 (= res!870477 (validMask!0 mask!2040))))

(assert (=> start!110784 e!748004))

(assert (=> start!110784 tp!104179))

(declare-fun array_inv!31981 (array!87686) Bool)

(assert (=> start!110784 (array_inv!31981 _keys!1628)))

(assert (=> start!110784 true))

(assert (=> start!110784 tp_is_empty!35349))

(declare-fun e!748005 () Bool)

(declare-fun array_inv!31982 (array!87688) Bool)

(assert (=> start!110784 (and (array_inv!31982 _values!1354) e!748005)))

(declare-fun b!1311219 () Bool)

(assert (=> b!1311219 (= e!748004 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52235)

(declare-fun zeroValue!1296 () V!52235)

(declare-fun lt!585447 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22872 0))(
  ( (tuple2!22873 (_1!11447 (_ BitVec 64)) (_2!11447 V!52235)) )
))
(declare-datatypes ((List!30013 0))(
  ( (Nil!30010) (Cons!30009 (h!31218 tuple2!22872) (t!43619 List!30013)) )
))
(declare-datatypes ((ListLongMap!20529 0))(
  ( (ListLongMap!20530 (toList!10280 List!30013)) )
))
(declare-fun contains!8430 (ListLongMap!20529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5293 (array!87686 array!87688 (_ BitVec 32) (_ BitVec 32) V!52235 V!52235 (_ BitVec 32) Int) ListLongMap!20529)

(assert (=> b!1311219 (= lt!585447 (contains!8430 (getCurrentListMap!5293 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311220 () Bool)

(declare-fun res!870473 () Bool)

(assert (=> b!1311220 (=> (not res!870473) (not e!748004))))

(assert (=> b!1311220 (= res!870473 (and (= (size!42874 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42873 _keys!1628) (size!42874 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311221 () Bool)

(assert (=> b!1311221 (= e!748005 (and e!748006 mapRes!54652))))

(declare-fun condMapEmpty!54652 () Bool)

(declare-fun mapDefault!54652 () ValueCell!16776)

(assert (=> b!1311221 (= condMapEmpty!54652 (= (arr!42324 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16776)) mapDefault!54652)))))

(declare-fun b!1311222 () Bool)

(declare-fun res!870475 () Bool)

(assert (=> b!1311222 (=> (not res!870475) (not e!748004))))

(declare-datatypes ((List!30014 0))(
  ( (Nil!30011) (Cons!30010 (h!31219 (_ BitVec 64)) (t!43620 List!30014)) )
))
(declare-fun arrayNoDuplicates!0 (array!87686 (_ BitVec 32) List!30014) Bool)

(assert (=> b!1311222 (= res!870475 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30011))))

(assert (= (and start!110784 res!870477) b!1311220))

(assert (= (and b!1311220 res!870473) b!1311215))

(assert (= (and b!1311215 res!870476) b!1311222))

(assert (= (and b!1311222 res!870475) b!1311218))

(assert (= (and b!1311218 res!870474) b!1311219))

(assert (= (and b!1311221 condMapEmpty!54652) mapIsEmpty!54652))

(assert (= (and b!1311221 (not condMapEmpty!54652)) mapNonEmpty!54652))

(get-info :version)

(assert (= (and mapNonEmpty!54652 ((_ is ValueCellFull!16776) mapValue!54652)) b!1311217))

(assert (= (and b!1311221 ((_ is ValueCellFull!16776) mapDefault!54652)) b!1311216))

(assert (= start!110784 b!1311221))

(declare-fun m!1200757 () Bool)

(assert (=> start!110784 m!1200757))

(declare-fun m!1200759 () Bool)

(assert (=> start!110784 m!1200759))

(declare-fun m!1200761 () Bool)

(assert (=> start!110784 m!1200761))

(declare-fun m!1200763 () Bool)

(assert (=> b!1311215 m!1200763))

(declare-fun m!1200765 () Bool)

(assert (=> mapNonEmpty!54652 m!1200765))

(declare-fun m!1200767 () Bool)

(assert (=> b!1311219 m!1200767))

(assert (=> b!1311219 m!1200767))

(declare-fun m!1200769 () Bool)

(assert (=> b!1311219 m!1200769))

(declare-fun m!1200771 () Bool)

(assert (=> b!1311222 m!1200771))

(check-sat tp_is_empty!35349 (not b!1311222) (not b!1311219) b_and!47827 (not mapNonEmpty!54652) (not b!1311215) (not start!110784) (not b_next!29619))
(check-sat b_and!47827 (not b_next!29619))
