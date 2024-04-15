; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108910 () Bool)

(assert start!108910)

(declare-fun b_free!28423 () Bool)

(declare-fun b_next!28423 () Bool)

(assert (=> start!108910 (= b_free!28423 (not b_next!28423))))

(declare-fun tp!100386 () Bool)

(declare-fun b_and!46489 () Bool)

(assert (=> start!108910 (= tp!100386 b_and!46489)))

(declare-fun b!1286629 () Bool)

(declare-fun res!854628 () Bool)

(declare-fun e!734848 () Bool)

(assert (=> b!1286629 (=> (not res!854628) (not e!734848))))

(declare-datatypes ((V!50521 0))(
  ( (V!50522 (val!17106 Int)) )
))
(declare-fun minValue!1387 () V!50521)

(declare-fun zeroValue!1387 () V!50521)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16133 0))(
  ( (ValueCellFull!16133 (v!19707 V!50521)) (EmptyCell!16133) )
))
(declare-datatypes ((array!85067 0))(
  ( (array!85068 (arr!41036 (Array (_ BitVec 32) ValueCell!16133)) (size!41588 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85067)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85069 0))(
  ( (array!85070 (arr!41037 (Array (_ BitVec 32) (_ BitVec 64))) (size!41589 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85069)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22002 0))(
  ( (tuple2!22003 (_1!11012 (_ BitVec 64)) (_2!11012 V!50521)) )
))
(declare-datatypes ((List!29178 0))(
  ( (Nil!29175) (Cons!29174 (h!30383 tuple2!22002) (t!42732 List!29178)) )
))
(declare-datatypes ((ListLongMap!19659 0))(
  ( (ListLongMap!19660 (toList!9845 List!29178)) )
))
(declare-fun contains!7891 (ListLongMap!19659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4810 (array!85069 array!85067 (_ BitVec 32) (_ BitVec 32) V!50521 V!50521 (_ BitVec 32) Int) ListLongMap!19659)

(assert (=> b!1286629 (= res!854628 (contains!7891 (getCurrentListMap!4810 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!62984 () Bool)

(declare-fun call!62992 () ListLongMap!19659)

(declare-fun getCurrentListMapNoExtraKeys!5987 (array!85069 array!85067 (_ BitVec 32) (_ BitVec 32) V!50521 V!50521 (_ BitVec 32) Int) ListLongMap!19659)

(assert (=> bm!62984 (= call!62992 (getCurrentListMapNoExtraKeys!5987 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286630 () Bool)

(declare-datatypes ((Unit!42385 0))(
  ( (Unit!42386) )
))
(declare-fun e!734845 () Unit!42385)

(declare-fun Unit!42387 () Unit!42385)

(assert (=> b!1286630 (= e!734845 Unit!42387)))

(declare-fun b!1286631 () Bool)

(assert (=> b!1286631 (= e!734848 (not true))))

(assert (=> b!1286631 (not (contains!7891 (ListLongMap!19660 Nil!29175) k0!1205))))

(declare-fun lt!577259 () Unit!42385)

(declare-fun emptyContainsNothing!7 ((_ BitVec 64)) Unit!42385)

(assert (=> b!1286631 (= lt!577259 (emptyContainsNothing!7 k0!1205))))

(declare-fun lt!577266 () Unit!42385)

(declare-fun e!734849 () Unit!42385)

(assert (=> b!1286631 (= lt!577266 e!734849)))

(declare-fun c!124203 () Bool)

(declare-fun lt!577262 () Bool)

(assert (=> b!1286631 (= c!124203 (and (not lt!577262) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286631 (= lt!577262 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286632 () Bool)

(declare-fun lt!577265 () Unit!42385)

(assert (=> b!1286632 (= e!734849 lt!577265)))

(declare-fun lt!577267 () ListLongMap!19659)

(assert (=> b!1286632 (= lt!577267 call!62992)))

(declare-fun lt!577269 () ListLongMap!19659)

(declare-fun +!4359 (ListLongMap!19659 tuple2!22002) ListLongMap!19659)

(assert (=> b!1286632 (= lt!577269 (+!4359 lt!577267 (tuple2!22003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577260 () Unit!42385)

(declare-fun call!62987 () Unit!42385)

(assert (=> b!1286632 (= lt!577260 call!62987)))

(assert (=> b!1286632 (contains!7891 lt!577269 k0!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!37 ((_ BitVec 64) (_ BitVec 64) V!50521 ListLongMap!19659) Unit!42385)

(assert (=> b!1286632 (= lt!577265 (lemmaInListMapAfterAddingDiffThenInBefore!37 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577267))))

(declare-fun call!62990 () Bool)

(assert (=> b!1286632 call!62990))

(declare-fun b!1286633 () Bool)

(declare-fun res!854630 () Bool)

(assert (=> b!1286633 (=> (not res!854630) (not e!734848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85069 (_ BitVec 32)) Bool)

(assert (=> b!1286633 (= res!854630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286634 () Bool)

(declare-fun res!854627 () Bool)

(assert (=> b!1286634 (=> (not res!854627) (not e!734848))))

(assert (=> b!1286634 (= res!854627 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41589 _keys!1741))))))

(declare-fun mapNonEmpty!52652 () Bool)

(declare-fun mapRes!52652 () Bool)

(declare-fun tp!100385 () Bool)

(declare-fun e!734850 () Bool)

(assert (=> mapNonEmpty!52652 (= mapRes!52652 (and tp!100385 e!734850))))

(declare-fun mapKey!52652 () (_ BitVec 32))

(declare-fun mapRest!52652 () (Array (_ BitVec 32) ValueCell!16133))

(declare-fun mapValue!52652 () ValueCell!16133)

(assert (=> mapNonEmpty!52652 (= (arr!41036 _values!1445) (store mapRest!52652 mapKey!52652 mapValue!52652))))

(declare-fun b!1286635 () Bool)

(declare-fun lt!577268 () Unit!42385)

(assert (=> b!1286635 (= e!734845 lt!577268)))

(declare-fun lt!577261 () ListLongMap!19659)

(declare-fun call!62988 () ListLongMap!19659)

(assert (=> b!1286635 (= lt!577261 call!62988)))

(declare-fun call!62991 () Unit!42385)

(assert (=> b!1286635 (= lt!577268 call!62991)))

(declare-fun call!62989 () Bool)

(assert (=> b!1286635 call!62989))

(declare-fun c!124201 () Bool)

(declare-fun lt!577263 () ListLongMap!19659)

(declare-fun bm!62986 () Bool)

(assert (=> bm!62986 (= call!62987 (lemmaInListMapAfterAddingDiffThenInBefore!37 k0!1205 (ite c!124203 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124201 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124203 minValue!1387 (ite c!124201 zeroValue!1387 minValue!1387)) (ite c!124203 lt!577269 (ite c!124201 lt!577263 lt!577261))))))

(declare-fun b!1286636 () Bool)

(declare-fun c!124202 () Bool)

(assert (=> b!1286636 (= c!124202 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577262))))

(declare-fun e!734844 () Unit!42385)

(assert (=> b!1286636 (= e!734844 e!734845)))

(declare-fun b!1286637 () Bool)

(declare-fun res!854624 () Bool)

(assert (=> b!1286637 (=> (not res!854624) (not e!734848))))

(assert (=> b!1286637 (= res!854624 (and (= (size!41588 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41589 _keys!1741) (size!41588 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!62987 () Bool)

(assert (=> bm!62987 (= call!62991 call!62987)))

(declare-fun b!1286638 () Bool)

(declare-fun res!854625 () Bool)

(assert (=> b!1286638 (=> (not res!854625) (not e!734848))))

(declare-datatypes ((List!29179 0))(
  ( (Nil!29176) (Cons!29175 (h!30384 (_ BitVec 64)) (t!42733 List!29179)) )
))
(declare-fun arrayNoDuplicates!0 (array!85069 (_ BitVec 32) List!29179) Bool)

(assert (=> b!1286638 (= res!854625 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29176))))

(declare-fun mapIsEmpty!52652 () Bool)

(assert (=> mapIsEmpty!52652 mapRes!52652))

(declare-fun b!1286639 () Bool)

(assert (=> b!1286639 call!62989))

(declare-fun lt!577264 () Unit!42385)

(assert (=> b!1286639 (= lt!577264 call!62991)))

(assert (=> b!1286639 (= lt!577263 call!62988)))

(assert (=> b!1286639 (= e!734844 lt!577264)))

(declare-fun b!1286640 () Bool)

(declare-fun res!854631 () Bool)

(assert (=> b!1286640 (=> (not res!854631) (not e!734848))))

(assert (=> b!1286640 (= res!854631 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41589 _keys!1741))))))

(declare-fun b!1286641 () Bool)

(declare-fun tp_is_empty!34063 () Bool)

(assert (=> b!1286641 (= e!734850 tp_is_empty!34063)))

(declare-fun bm!62988 () Bool)

(assert (=> bm!62988 (= call!62989 call!62990)))

(declare-fun b!1286642 () Bool)

(declare-fun e!734847 () Bool)

(assert (=> b!1286642 (= e!734847 tp_is_empty!34063)))

(declare-fun b!1286643 () Bool)

(declare-fun res!854629 () Bool)

(assert (=> b!1286643 (=> (not res!854629) (not e!734848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286643 (= res!854629 (validKeyInArray!0 (select (arr!41037 _keys!1741) from!2144)))))

(declare-fun b!1286644 () Bool)

(assert (=> b!1286644 (= e!734849 e!734844)))

(assert (=> b!1286644 (= c!124201 (and (not lt!577262) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!854626 () Bool)

(assert (=> start!108910 (=> (not res!854626) (not e!734848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108910 (= res!854626 (validMask!0 mask!2175))))

(assert (=> start!108910 e!734848))

(assert (=> start!108910 tp_is_empty!34063))

(assert (=> start!108910 true))

(declare-fun e!734843 () Bool)

(declare-fun array_inv!31275 (array!85067) Bool)

(assert (=> start!108910 (and (array_inv!31275 _values!1445) e!734843)))

(declare-fun array_inv!31276 (array!85069) Bool)

(assert (=> start!108910 (array_inv!31276 _keys!1741)))

(assert (=> start!108910 tp!100386))

(declare-fun bm!62985 () Bool)

(assert (=> bm!62985 (= call!62990 (contains!7891 (ite c!124203 lt!577267 (ite c!124201 lt!577263 lt!577261)) k0!1205))))

(declare-fun bm!62989 () Bool)

(assert (=> bm!62989 (= call!62988 call!62992)))

(declare-fun b!1286645 () Bool)

(assert (=> b!1286645 (= e!734843 (and e!734847 mapRes!52652))))

(declare-fun condMapEmpty!52652 () Bool)

(declare-fun mapDefault!52652 () ValueCell!16133)

(assert (=> b!1286645 (= condMapEmpty!52652 (= (arr!41036 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16133)) mapDefault!52652)))))

(assert (= (and start!108910 res!854626) b!1286637))

(assert (= (and b!1286637 res!854624) b!1286633))

(assert (= (and b!1286633 res!854630) b!1286638))

(assert (= (and b!1286638 res!854625) b!1286640))

(assert (= (and b!1286640 res!854631) b!1286629))

(assert (= (and b!1286629 res!854628) b!1286634))

(assert (= (and b!1286634 res!854627) b!1286643))

(assert (= (and b!1286643 res!854629) b!1286631))

(assert (= (and b!1286631 c!124203) b!1286632))

(assert (= (and b!1286631 (not c!124203)) b!1286644))

(assert (= (and b!1286644 c!124201) b!1286639))

(assert (= (and b!1286644 (not c!124201)) b!1286636))

(assert (= (and b!1286636 c!124202) b!1286635))

(assert (= (and b!1286636 (not c!124202)) b!1286630))

(assert (= (or b!1286639 b!1286635) bm!62989))

(assert (= (or b!1286639 b!1286635) bm!62987))

(assert (= (or b!1286639 b!1286635) bm!62988))

(assert (= (or b!1286632 bm!62989) bm!62984))

(assert (= (or b!1286632 bm!62987) bm!62986))

(assert (= (or b!1286632 bm!62988) bm!62985))

(assert (= (and b!1286645 condMapEmpty!52652) mapIsEmpty!52652))

(assert (= (and b!1286645 (not condMapEmpty!52652)) mapNonEmpty!52652))

(get-info :version)

(assert (= (and mapNonEmpty!52652 ((_ is ValueCellFull!16133) mapValue!52652)) b!1286641))

(assert (= (and b!1286645 ((_ is ValueCellFull!16133) mapDefault!52652)) b!1286642))

(assert (= start!108910 b!1286645))

(declare-fun m!1179229 () Bool)

(assert (=> b!1286638 m!1179229))

(declare-fun m!1179231 () Bool)

(assert (=> bm!62986 m!1179231))

(declare-fun m!1179233 () Bool)

(assert (=> b!1286631 m!1179233))

(declare-fun m!1179235 () Bool)

(assert (=> b!1286631 m!1179235))

(declare-fun m!1179237 () Bool)

(assert (=> bm!62984 m!1179237))

(declare-fun m!1179239 () Bool)

(assert (=> b!1286629 m!1179239))

(assert (=> b!1286629 m!1179239))

(declare-fun m!1179241 () Bool)

(assert (=> b!1286629 m!1179241))

(declare-fun m!1179243 () Bool)

(assert (=> start!108910 m!1179243))

(declare-fun m!1179245 () Bool)

(assert (=> start!108910 m!1179245))

(declare-fun m!1179247 () Bool)

(assert (=> start!108910 m!1179247))

(declare-fun m!1179249 () Bool)

(assert (=> b!1286633 m!1179249))

(declare-fun m!1179251 () Bool)

(assert (=> mapNonEmpty!52652 m!1179251))

(declare-fun m!1179253 () Bool)

(assert (=> b!1286643 m!1179253))

(assert (=> b!1286643 m!1179253))

(declare-fun m!1179255 () Bool)

(assert (=> b!1286643 m!1179255))

(declare-fun m!1179257 () Bool)

(assert (=> bm!62985 m!1179257))

(declare-fun m!1179259 () Bool)

(assert (=> b!1286632 m!1179259))

(declare-fun m!1179261 () Bool)

(assert (=> b!1286632 m!1179261))

(declare-fun m!1179263 () Bool)

(assert (=> b!1286632 m!1179263))

(check-sat (not start!108910) (not b!1286638) (not bm!62984) (not bm!62986) (not b!1286643) tp_is_empty!34063 (not mapNonEmpty!52652) b_and!46489 (not b!1286629) (not bm!62985) (not b!1286632) (not b_next!28423) (not b!1286633) (not b!1286631))
(check-sat b_and!46489 (not b_next!28423))
