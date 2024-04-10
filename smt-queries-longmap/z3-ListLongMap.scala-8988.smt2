; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108690 () Bool)

(assert start!108690)

(declare-fun b_free!28203 () Bool)

(declare-fun b_next!28203 () Bool)

(assert (=> start!108690 (= b_free!28203 (not b_next!28203))))

(declare-fun tp!99725 () Bool)

(declare-fun b_and!46269 () Bool)

(assert (=> start!108690 (= tp!99725 b_and!46269)))

(declare-fun b!1283092 () Bool)

(declare-fun e!733082 () Bool)

(declare-fun tp_is_empty!33843 () Bool)

(assert (=> b!1283092 (= e!733082 tp_is_empty!33843)))

(declare-fun b!1283093 () Bool)

(declare-fun res!852293 () Bool)

(declare-fun e!733081 () Bool)

(assert (=> b!1283093 (=> (not res!852293) (not e!733081))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50227 0))(
  ( (V!50228 (val!16996 Int)) )
))
(declare-datatypes ((ValueCell!16023 0))(
  ( (ValueCellFull!16023 (v!19598 V!50227)) (EmptyCell!16023) )
))
(declare-datatypes ((array!84748 0))(
  ( (array!84749 (arr!40876 (Array (_ BitVec 32) ValueCell!16023)) (size!41426 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84748)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84750 0))(
  ( (array!84751 (arr!40877 (Array (_ BitVec 32) (_ BitVec 64))) (size!41427 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84750)

(assert (=> b!1283093 (= res!852293 (and (= (size!41426 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41427 _keys!1741) (size!41426 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52322 () Bool)

(declare-fun mapRes!52322 () Bool)

(assert (=> mapIsEmpty!52322 mapRes!52322))

(declare-fun b!1283094 () Bool)

(declare-fun res!852289 () Bool)

(assert (=> b!1283094 (=> (not res!852289) (not e!733081))))

(declare-fun minValue!1387 () V!50227)

(declare-fun zeroValue!1387 () V!50227)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21764 0))(
  ( (tuple2!21765 (_1!10893 (_ BitVec 64)) (_2!10893 V!50227)) )
))
(declare-datatypes ((List!28961 0))(
  ( (Nil!28958) (Cons!28957 (h!30166 tuple2!21764) (t!42505 List!28961)) )
))
(declare-datatypes ((ListLongMap!19421 0))(
  ( (ListLongMap!19422 (toList!9726 List!28961)) )
))
(declare-fun contains!7843 (ListLongMap!19421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4810 (array!84750 array!84748 (_ BitVec 32) (_ BitVec 32) V!50227 V!50227 (_ BitVec 32) Int) ListLongMap!19421)

(assert (=> b!1283094 (= res!852289 (contains!7843 (getCurrentListMap!4810 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283095 () Bool)

(declare-fun e!733085 () Bool)

(declare-fun e!733084 () Bool)

(assert (=> b!1283095 (= e!733085 (and e!733084 mapRes!52322))))

(declare-fun condMapEmpty!52322 () Bool)

(declare-fun mapDefault!52322 () ValueCell!16023)

(assert (=> b!1283095 (= condMapEmpty!52322 (= (arr!40876 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16023)) mapDefault!52322)))))

(declare-fun mapNonEmpty!52322 () Bool)

(declare-fun tp!99724 () Bool)

(assert (=> mapNonEmpty!52322 (= mapRes!52322 (and tp!99724 e!733082))))

(declare-fun mapRest!52322 () (Array (_ BitVec 32) ValueCell!16023))

(declare-fun mapKey!52322 () (_ BitVec 32))

(declare-fun mapValue!52322 () ValueCell!16023)

(assert (=> mapNonEmpty!52322 (= (arr!40876 _values!1445) (store mapRest!52322 mapKey!52322 mapValue!52322))))

(declare-fun b!1283096 () Bool)

(declare-fun res!852288 () Bool)

(assert (=> b!1283096 (=> (not res!852288) (not e!733081))))

(assert (=> b!1283096 (= res!852288 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41427 _keys!1741))))))

(declare-fun b!1283097 () Bool)

(declare-fun res!852287 () Bool)

(assert (=> b!1283097 (=> (not res!852287) (not e!733081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283097 (= res!852287 (validKeyInArray!0 (select (arr!40877 _keys!1741) from!2144)))))

(declare-fun b!1283098 () Bool)

(assert (=> b!1283098 (= e!733081 (not true))))

(declare-fun lt!576598 () ListLongMap!19421)

(assert (=> b!1283098 (contains!7843 lt!576598 k0!1205)))

(declare-datatypes ((Unit!42463 0))(
  ( (Unit!42464) )
))
(declare-fun lt!576597 () Unit!42463)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!2 ((_ BitVec 64) (_ BitVec 64) V!50227 ListLongMap!19421) Unit!42463)

(assert (=> b!1283098 (= lt!576597 (lemmaInListMapAfterAddingDiffThenInBefore!2 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576598))))

(declare-fun +!4278 (ListLongMap!19421 tuple2!21764) ListLongMap!19421)

(declare-fun getCurrentListMapNoExtraKeys!5908 (array!84750 array!84748 (_ BitVec 32) (_ BitVec 32) V!50227 V!50227 (_ BitVec 32) Int) ListLongMap!19421)

(assert (=> b!1283098 (= lt!576598 (+!4278 (getCurrentListMapNoExtraKeys!5908 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283099 () Bool)

(declare-fun res!852286 () Bool)

(assert (=> b!1283099 (=> (not res!852286) (not e!733081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84750 (_ BitVec 32)) Bool)

(assert (=> b!1283099 (= res!852286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!852290 () Bool)

(assert (=> start!108690 (=> (not res!852290) (not e!733081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108690 (= res!852290 (validMask!0 mask!2175))))

(assert (=> start!108690 e!733081))

(assert (=> start!108690 tp_is_empty!33843))

(assert (=> start!108690 true))

(declare-fun array_inv!31009 (array!84748) Bool)

(assert (=> start!108690 (and (array_inv!31009 _values!1445) e!733085)))

(declare-fun array_inv!31010 (array!84750) Bool)

(assert (=> start!108690 (array_inv!31010 _keys!1741)))

(assert (=> start!108690 tp!99725))

(declare-fun b!1283100 () Bool)

(declare-fun res!852294 () Bool)

(assert (=> b!1283100 (=> (not res!852294) (not e!733081))))

(declare-datatypes ((List!28962 0))(
  ( (Nil!28959) (Cons!28958 (h!30167 (_ BitVec 64)) (t!42506 List!28962)) )
))
(declare-fun arrayNoDuplicates!0 (array!84750 (_ BitVec 32) List!28962) Bool)

(assert (=> b!1283100 (= res!852294 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28959))))

(declare-fun b!1283101 () Bool)

(declare-fun res!852291 () Bool)

(assert (=> b!1283101 (=> (not res!852291) (not e!733081))))

(assert (=> b!1283101 (= res!852291 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283102 () Bool)

(declare-fun res!852292 () Bool)

(assert (=> b!1283102 (=> (not res!852292) (not e!733081))))

(assert (=> b!1283102 (= res!852292 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41427 _keys!1741))))))

(declare-fun b!1283103 () Bool)

(assert (=> b!1283103 (= e!733084 tp_is_empty!33843)))

(assert (= (and start!108690 res!852290) b!1283093))

(assert (= (and b!1283093 res!852293) b!1283099))

(assert (= (and b!1283099 res!852286) b!1283100))

(assert (= (and b!1283100 res!852294) b!1283096))

(assert (= (and b!1283096 res!852288) b!1283094))

(assert (= (and b!1283094 res!852289) b!1283102))

(assert (= (and b!1283102 res!852292) b!1283097))

(assert (= (and b!1283097 res!852287) b!1283101))

(assert (= (and b!1283101 res!852291) b!1283098))

(assert (= (and b!1283095 condMapEmpty!52322) mapIsEmpty!52322))

(assert (= (and b!1283095 (not condMapEmpty!52322)) mapNonEmpty!52322))

(get-info :version)

(assert (= (and mapNonEmpty!52322 ((_ is ValueCellFull!16023) mapValue!52322)) b!1283092))

(assert (= (and b!1283095 ((_ is ValueCellFull!16023) mapDefault!52322)) b!1283103))

(assert (= start!108690 b!1283095))

(declare-fun m!1177093 () Bool)

(assert (=> b!1283098 m!1177093))

(declare-fun m!1177095 () Bool)

(assert (=> b!1283098 m!1177095))

(declare-fun m!1177097 () Bool)

(assert (=> b!1283098 m!1177097))

(assert (=> b!1283098 m!1177097))

(declare-fun m!1177099 () Bool)

(assert (=> b!1283098 m!1177099))

(declare-fun m!1177101 () Bool)

(assert (=> b!1283094 m!1177101))

(assert (=> b!1283094 m!1177101))

(declare-fun m!1177103 () Bool)

(assert (=> b!1283094 m!1177103))

(declare-fun m!1177105 () Bool)

(assert (=> b!1283100 m!1177105))

(declare-fun m!1177107 () Bool)

(assert (=> start!108690 m!1177107))

(declare-fun m!1177109 () Bool)

(assert (=> start!108690 m!1177109))

(declare-fun m!1177111 () Bool)

(assert (=> start!108690 m!1177111))

(declare-fun m!1177113 () Bool)

(assert (=> b!1283099 m!1177113))

(declare-fun m!1177115 () Bool)

(assert (=> b!1283097 m!1177115))

(assert (=> b!1283097 m!1177115))

(declare-fun m!1177117 () Bool)

(assert (=> b!1283097 m!1177117))

(declare-fun m!1177119 () Bool)

(assert (=> mapNonEmpty!52322 m!1177119))

(check-sat (not b!1283098) (not b!1283100) (not b!1283099) (not b!1283097) (not mapNonEmpty!52322) (not b_next!28203) b_and!46269 tp_is_empty!33843 (not b!1283094) (not start!108690))
(check-sat b_and!46269 (not b_next!28203))
