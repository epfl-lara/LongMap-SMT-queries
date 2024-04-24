; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109650 () Bool)

(assert start!109650)

(declare-fun b_free!28915 () Bool)

(declare-fun b_next!28915 () Bool)

(assert (=> start!109650 (= b_free!28915 (not b_next!28915))))

(declare-fun tp!101863 () Bool)

(declare-fun b_and!47007 () Bool)

(assert (=> start!109650 (= tp!101863 b_and!47007)))

(declare-fun b!1296896 () Bool)

(declare-fun e!740058 () Bool)

(declare-fun tp_is_empty!34555 () Bool)

(assert (=> b!1296896 (= e!740058 tp_is_empty!34555)))

(declare-fun res!861615 () Bool)

(declare-fun e!740056 () Bool)

(assert (=> start!109650 (=> (not res!861615) (not e!740056))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109650 (= res!861615 (validMask!0 mask!2175))))

(assert (=> start!109650 e!740056))

(assert (=> start!109650 tp_is_empty!34555))

(assert (=> start!109650 true))

(declare-datatypes ((V!51177 0))(
  ( (V!51178 (val!17352 Int)) )
))
(declare-datatypes ((ValueCell!16379 0))(
  ( (ValueCellFull!16379 (v!19950 V!51177)) (EmptyCell!16379) )
))
(declare-datatypes ((array!86163 0))(
  ( (array!86164 (arr!41578 (Array (_ BitVec 32) ValueCell!16379)) (size!42129 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86163)

(declare-fun e!740057 () Bool)

(declare-fun array_inv!31713 (array!86163) Bool)

(assert (=> start!109650 (and (array_inv!31713 _values!1445) e!740057)))

(declare-datatypes ((array!86165 0))(
  ( (array!86166 (arr!41579 (Array (_ BitVec 32) (_ BitVec 64))) (size!42130 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86165)

(declare-fun array_inv!31714 (array!86165) Bool)

(assert (=> start!109650 (array_inv!31714 _keys!1741)))

(assert (=> start!109650 tp!101863))

(declare-fun b!1296897 () Bool)

(declare-fun res!861613 () Bool)

(assert (=> b!1296897 (=> (not res!861613) (not e!740056))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296897 (= res!861613 (not (validKeyInArray!0 (select (arr!41579 _keys!1741) from!2144))))))

(declare-fun b!1296898 () Bool)

(declare-fun e!740060 () Bool)

(assert (=> b!1296898 (= e!740060 tp_is_empty!34555)))

(declare-fun b!1296899 () Bool)

(declare-fun res!861612 () Bool)

(assert (=> b!1296899 (=> (not res!861612) (not e!740056))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1296899 (= res!861612 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42130 _keys!1741))))))

(declare-fun b!1296900 () Bool)

(declare-fun e!740061 () Bool)

(assert (=> b!1296900 (= e!740056 (not e!740061))))

(declare-fun res!861618 () Bool)

(assert (=> b!1296900 (=> res!861618 e!740061)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296900 (= res!861618 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22348 0))(
  ( (tuple2!22349 (_1!11185 (_ BitVec 64)) (_2!11185 V!51177)) )
))
(declare-datatypes ((List!29515 0))(
  ( (Nil!29512) (Cons!29511 (h!30729 tuple2!22348) (t!43071 List!29515)) )
))
(declare-datatypes ((ListLongMap!20013 0))(
  ( (ListLongMap!20014 (toList!10022 List!29515)) )
))
(declare-fun contains!8153 (ListLongMap!20013 (_ BitVec 64)) Bool)

(assert (=> b!1296900 (not (contains!8153 (ListLongMap!20014 Nil!29512) k0!1205))))

(declare-datatypes ((Unit!42875 0))(
  ( (Unit!42876) )
))
(declare-fun lt!580422 () Unit!42875)

(declare-fun emptyContainsNothing!180 ((_ BitVec 64)) Unit!42875)

(assert (=> b!1296900 (= lt!580422 (emptyContainsNothing!180 k0!1205))))

(declare-fun b!1296901 () Bool)

(declare-fun res!861616 () Bool)

(assert (=> b!1296901 (=> (not res!861616) (not e!740056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86165 (_ BitVec 32)) Bool)

(assert (=> b!1296901 (= res!861616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296902 () Bool)

(declare-fun res!861619 () Bool)

(assert (=> b!1296902 (=> (not res!861619) (not e!740056))))

(declare-fun minValue!1387 () V!51177)

(declare-fun zeroValue!1387 () V!51177)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5044 (array!86165 array!86163 (_ BitVec 32) (_ BitVec 32) V!51177 V!51177 (_ BitVec 32) Int) ListLongMap!20013)

(assert (=> b!1296902 (= res!861619 (contains!8153 (getCurrentListMap!5044 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296903 () Bool)

(declare-fun res!861617 () Bool)

(assert (=> b!1296903 (=> (not res!861617) (not e!740056))))

(assert (=> b!1296903 (= res!861617 (and (= (size!42129 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42130 _keys!1741) (size!42129 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53393 () Bool)

(declare-fun mapRes!53393 () Bool)

(declare-fun tp!101864 () Bool)

(assert (=> mapNonEmpty!53393 (= mapRes!53393 (and tp!101864 e!740058))))

(declare-fun mapRest!53393 () (Array (_ BitVec 32) ValueCell!16379))

(declare-fun mapValue!53393 () ValueCell!16379)

(declare-fun mapKey!53393 () (_ BitVec 32))

(assert (=> mapNonEmpty!53393 (= (arr!41578 _values!1445) (store mapRest!53393 mapKey!53393 mapValue!53393))))

(declare-fun mapIsEmpty!53393 () Bool)

(assert (=> mapIsEmpty!53393 mapRes!53393))

(declare-fun b!1296904 () Bool)

(declare-fun res!861614 () Bool)

(assert (=> b!1296904 (=> (not res!861614) (not e!740056))))

(declare-datatypes ((List!29516 0))(
  ( (Nil!29513) (Cons!29512 (h!30730 (_ BitVec 64)) (t!43072 List!29516)) )
))
(declare-fun arrayNoDuplicates!0 (array!86165 (_ BitVec 32) List!29516) Bool)

(assert (=> b!1296904 (= res!861614 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29513))))

(declare-fun b!1296905 () Bool)

(assert (=> b!1296905 (= e!740057 (and e!740060 mapRes!53393))))

(declare-fun condMapEmpty!53393 () Bool)

(declare-fun mapDefault!53393 () ValueCell!16379)

(assert (=> b!1296905 (= condMapEmpty!53393 (= (arr!41578 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16379)) mapDefault!53393)))))

(declare-fun b!1296906 () Bool)

(assert (=> b!1296906 (= e!740061 true)))

(declare-fun lt!580420 () ListLongMap!20013)

(declare-fun +!4466 (ListLongMap!20013 tuple2!22348) ListLongMap!20013)

(assert (=> b!1296906 (not (contains!8153 (+!4466 lt!580420 (tuple2!22349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580421 () Unit!42875)

(declare-fun addStillNotContains!442 (ListLongMap!20013 (_ BitVec 64) V!51177 (_ BitVec 64)) Unit!42875)

(assert (=> b!1296906 (= lt!580421 (addStillNotContains!442 lt!580420 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6108 (array!86165 array!86163 (_ BitVec 32) (_ BitVec 32) V!51177 V!51177 (_ BitVec 32) Int) ListLongMap!20013)

(assert (=> b!1296906 (= lt!580420 (getCurrentListMapNoExtraKeys!6108 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296907 () Bool)

(declare-fun res!861611 () Bool)

(assert (=> b!1296907 (=> (not res!861611) (not e!740056))))

(assert (=> b!1296907 (= res!861611 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42130 _keys!1741))))))

(assert (= (and start!109650 res!861615) b!1296903))

(assert (= (and b!1296903 res!861617) b!1296901))

(assert (= (and b!1296901 res!861616) b!1296904))

(assert (= (and b!1296904 res!861614) b!1296907))

(assert (= (and b!1296907 res!861611) b!1296902))

(assert (= (and b!1296902 res!861619) b!1296899))

(assert (= (and b!1296899 res!861612) b!1296897))

(assert (= (and b!1296897 res!861613) b!1296900))

(assert (= (and b!1296900 (not res!861618)) b!1296906))

(assert (= (and b!1296905 condMapEmpty!53393) mapIsEmpty!53393))

(assert (= (and b!1296905 (not condMapEmpty!53393)) mapNonEmpty!53393))

(get-info :version)

(assert (= (and mapNonEmpty!53393 ((_ is ValueCellFull!16379) mapValue!53393)) b!1296896))

(assert (= (and b!1296905 ((_ is ValueCellFull!16379) mapDefault!53393)) b!1296898))

(assert (= start!109650 b!1296905))

(declare-fun m!1189209 () Bool)

(assert (=> b!1296900 m!1189209))

(declare-fun m!1189211 () Bool)

(assert (=> b!1296900 m!1189211))

(declare-fun m!1189213 () Bool)

(assert (=> start!109650 m!1189213))

(declare-fun m!1189215 () Bool)

(assert (=> start!109650 m!1189215))

(declare-fun m!1189217 () Bool)

(assert (=> start!109650 m!1189217))

(declare-fun m!1189219 () Bool)

(assert (=> b!1296897 m!1189219))

(assert (=> b!1296897 m!1189219))

(declare-fun m!1189221 () Bool)

(assert (=> b!1296897 m!1189221))

(declare-fun m!1189223 () Bool)

(assert (=> b!1296904 m!1189223))

(declare-fun m!1189225 () Bool)

(assert (=> mapNonEmpty!53393 m!1189225))

(declare-fun m!1189227 () Bool)

(assert (=> b!1296902 m!1189227))

(assert (=> b!1296902 m!1189227))

(declare-fun m!1189229 () Bool)

(assert (=> b!1296902 m!1189229))

(declare-fun m!1189231 () Bool)

(assert (=> b!1296901 m!1189231))

(declare-fun m!1189233 () Bool)

(assert (=> b!1296906 m!1189233))

(assert (=> b!1296906 m!1189233))

(declare-fun m!1189235 () Bool)

(assert (=> b!1296906 m!1189235))

(declare-fun m!1189237 () Bool)

(assert (=> b!1296906 m!1189237))

(declare-fun m!1189239 () Bool)

(assert (=> b!1296906 m!1189239))

(check-sat tp_is_empty!34555 (not b_next!28915) (not b!1296897) (not b!1296906) (not b!1296900) b_and!47007 (not b!1296901) (not b!1296902) (not b!1296904) (not mapNonEmpty!53393) (not start!109650))
(check-sat b_and!47007 (not b_next!28915))
