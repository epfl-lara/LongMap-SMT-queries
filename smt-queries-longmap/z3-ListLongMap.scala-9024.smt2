; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108906 () Bool)

(assert start!108906)

(declare-fun b_free!28419 () Bool)

(declare-fun b_next!28419 () Bool)

(assert (=> start!108906 (= b_free!28419 (not b_next!28419))))

(declare-fun tp!100372 () Bool)

(declare-fun b_and!46499 () Bool)

(assert (=> start!108906 (= tp!100372 b_and!46499)))

(declare-fun b!1286583 () Bool)

(declare-fun res!854600 () Bool)

(declare-fun e!734824 () Bool)

(assert (=> b!1286583 (=> (not res!854600) (not e!734824))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85166 0))(
  ( (array!85167 (arr!41085 (Array (_ BitVec 32) (_ BitVec 64))) (size!41635 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85166)

(assert (=> b!1286583 (= res!854600 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41635 _keys!1741))))))

(declare-fun b!1286584 () Bool)

(declare-fun e!734820 () Bool)

(declare-fun tp_is_empty!34059 () Bool)

(assert (=> b!1286584 (= e!734820 tp_is_empty!34059)))

(declare-fun b!1286585 () Bool)

(declare-fun c!124200 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!577374 () Bool)

(assert (=> b!1286585 (= c!124200 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577374))))

(declare-datatypes ((Unit!42535 0))(
  ( (Unit!42536) )
))
(declare-fun e!734821 () Unit!42535)

(declare-fun e!734826 () Unit!42535)

(assert (=> b!1286585 (= e!734821 e!734826)))

(declare-fun b!1286586 () Bool)

(declare-fun e!734827 () Bool)

(assert (=> b!1286586 (= e!734827 true)))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50515 0))(
  ( (V!50516 (val!17104 Int)) )
))
(declare-fun lt!577371 () V!50515)

(declare-datatypes ((tuple2!21934 0))(
  ( (tuple2!21935 (_1!10978 (_ BitVec 64)) (_2!10978 V!50515)) )
))
(declare-datatypes ((List!29119 0))(
  ( (Nil!29116) (Cons!29115 (h!30324 tuple2!21934) (t!42679 List!29119)) )
))
(declare-datatypes ((ListLongMap!19591 0))(
  ( (ListLongMap!19592 (toList!9811 List!29119)) )
))
(declare-fun contains!7927 (ListLongMap!19591 (_ BitVec 64)) Bool)

(declare-fun +!4317 (ListLongMap!19591 tuple2!21934) ListLongMap!19591)

(assert (=> b!1286586 (not (contains!7927 (+!4317 (ListLongMap!19592 Nil!29116) (tuple2!21935 (select (arr!41085 _keys!1741) from!2144) lt!577371)) k0!1205))))

(declare-fun lt!577363 () Unit!42535)

(declare-fun addStillNotContains!340 (ListLongMap!19591 (_ BitVec 64) V!50515 (_ BitVec 64)) Unit!42535)

(assert (=> b!1286586 (= lt!577363 (addStillNotContains!340 (ListLongMap!19592 Nil!29116) (select (arr!41085 _keys!1741) from!2144) lt!577371 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((ValueCell!16131 0))(
  ( (ValueCellFull!16131 (v!19706 V!50515)) (EmptyCell!16131) )
))
(declare-datatypes ((array!85168 0))(
  ( (array!85169 (arr!41086 (Array (_ BitVec 32) ValueCell!16131)) (size!41636 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85168)

(declare-fun get!20861 (ValueCell!16131 V!50515) V!50515)

(declare-fun dynLambda!3414 (Int (_ BitVec 64)) V!50515)

(assert (=> b!1286586 (= lt!577371 (get!20861 (select (arr!41086 _values!1445) from!2144) (dynLambda!3414 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1286587 () Bool)

(declare-fun e!734828 () Unit!42535)

(declare-fun lt!577370 () Unit!42535)

(assert (=> b!1286587 (= e!734828 lt!577370)))

(declare-fun lt!577365 () ListLongMap!19591)

(declare-fun call!62973 () ListLongMap!19591)

(assert (=> b!1286587 (= lt!577365 call!62973)))

(declare-fun lt!577375 () ListLongMap!19591)

(declare-fun zeroValue!1387 () V!50515)

(assert (=> b!1286587 (= lt!577375 (+!4317 lt!577365 (tuple2!21935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!50515)

(declare-fun lt!577373 () Unit!42535)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!33 ((_ BitVec 64) (_ BitVec 64) V!50515 ListLongMap!19591) Unit!42535)

(assert (=> b!1286587 (= lt!577373 (lemmaInListMapAfterAddingDiffThenInBefore!33 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577375))))

(declare-fun call!62970 () Bool)

(assert (=> b!1286587 call!62970))

(declare-fun call!62972 () Unit!42535)

(assert (=> b!1286587 (= lt!577370 call!62972)))

(assert (=> b!1286587 (contains!7927 lt!577365 k0!1205)))

(declare-fun b!1286588 () Bool)

(declare-fun res!854605 () Bool)

(assert (=> b!1286588 (=> (not res!854605) (not e!734824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286588 (= res!854605 (validKeyInArray!0 (select (arr!41085 _keys!1741) from!2144)))))

(declare-fun b!1286589 () Bool)

(assert (=> b!1286589 (= e!734824 (not e!734827))))

(declare-fun res!854602 () Bool)

(assert (=> b!1286589 (=> res!854602 e!734827)))

(assert (=> b!1286589 (= res!854602 (= k0!1205 (select (arr!41085 _keys!1741) from!2144)))))

(assert (=> b!1286589 (not (contains!7927 (ListLongMap!19592 Nil!29116) k0!1205))))

(declare-fun lt!577372 () Unit!42535)

(declare-fun emptyContainsNothing!6 ((_ BitVec 64)) Unit!42535)

(assert (=> b!1286589 (= lt!577372 (emptyContainsNothing!6 k0!1205))))

(declare-fun lt!577367 () Unit!42535)

(assert (=> b!1286589 (= lt!577367 e!734828)))

(declare-fun c!124201 () Bool)

(assert (=> b!1286589 (= c!124201 (and (not lt!577374) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286589 (= lt!577374 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286590 () Bool)

(declare-fun res!854604 () Bool)

(assert (=> b!1286590 (=> (not res!854604) (not e!734824))))

(declare-datatypes ((List!29120 0))(
  ( (Nil!29117) (Cons!29116 (h!30325 (_ BitVec 64)) (t!42680 List!29120)) )
))
(declare-fun arrayNoDuplicates!0 (array!85166 (_ BitVec 32) List!29120) Bool)

(assert (=> b!1286590 (= res!854604 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29117))))

(declare-fun b!1286591 () Bool)

(declare-fun res!854601 () Bool)

(assert (=> b!1286591 (=> (not res!854601) (not e!734824))))

(assert (=> b!1286591 (= res!854601 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41635 _keys!1741))))))

(declare-fun b!1286592 () Bool)

(assert (=> b!1286592 (= e!734828 e!734821)))

(declare-fun c!124199 () Bool)

(assert (=> b!1286592 (= c!124199 (and (not lt!577374) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!62967 () Bool)

(declare-fun call!62975 () ListLongMap!19591)

(assert (=> bm!62967 (= call!62975 call!62973)))

(declare-fun mapNonEmpty!52646 () Bool)

(declare-fun mapRes!52646 () Bool)

(declare-fun tp!100373 () Bool)

(assert (=> mapNonEmpty!52646 (= mapRes!52646 (and tp!100373 e!734820))))

(declare-fun mapKey!52646 () (_ BitVec 32))

(declare-fun mapRest!52646 () (Array (_ BitVec 32) ValueCell!16131))

(declare-fun mapValue!52646 () ValueCell!16131)

(assert (=> mapNonEmpty!52646 (= (arr!41086 _values!1445) (store mapRest!52646 mapKey!52646 mapValue!52646))))

(declare-fun bm!62968 () Bool)

(declare-fun call!62974 () Bool)

(assert (=> bm!62968 (= call!62974 call!62970)))

(declare-fun b!1286593 () Bool)

(declare-fun res!854599 () Bool)

(assert (=> b!1286593 (=> (not res!854599) (not e!734824))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85166 (_ BitVec 32)) Bool)

(assert (=> b!1286593 (= res!854599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286594 () Bool)

(declare-fun e!734823 () Bool)

(assert (=> b!1286594 (= e!734823 tp_is_empty!34059)))

(declare-fun b!1286595 () Bool)

(declare-fun res!854607 () Bool)

(assert (=> b!1286595 (=> (not res!854607) (not e!734824))))

(declare-fun getCurrentListMap!4887 (array!85166 array!85168 (_ BitVec 32) (_ BitVec 32) V!50515 V!50515 (_ BitVec 32) Int) ListLongMap!19591)

(assert (=> b!1286595 (= res!854607 (contains!7927 (getCurrentListMap!4887 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286596 () Bool)

(declare-fun Unit!42537 () Unit!42535)

(assert (=> b!1286596 (= e!734826 Unit!42537)))

(declare-fun b!1286597 () Bool)

(assert (=> b!1286597 call!62974))

(declare-fun lt!577366 () Unit!42535)

(declare-fun call!62971 () Unit!42535)

(assert (=> b!1286597 (= lt!577366 call!62971)))

(declare-fun lt!577369 () ListLongMap!19591)

(assert (=> b!1286597 (= lt!577369 call!62975)))

(assert (=> b!1286597 (= e!734821 lt!577366)))

(declare-fun lt!577368 () ListLongMap!19591)

(declare-fun bm!62969 () Bool)

(assert (=> bm!62969 (= call!62972 (lemmaInListMapAfterAddingDiffThenInBefore!33 k0!1205 (ite (or c!124201 c!124199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124201 c!124199) zeroValue!1387 minValue!1387) (ite c!124201 lt!577365 (ite c!124199 lt!577369 lt!577368))))))

(declare-fun bm!62970 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5945 (array!85166 array!85168 (_ BitVec 32) (_ BitVec 32) V!50515 V!50515 (_ BitVec 32) Int) ListLongMap!19591)

(assert (=> bm!62970 (= call!62973 (getCurrentListMapNoExtraKeys!5945 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286598 () Bool)

(declare-fun e!734825 () Bool)

(assert (=> b!1286598 (= e!734825 (and e!734823 mapRes!52646))))

(declare-fun condMapEmpty!52646 () Bool)

(declare-fun mapDefault!52646 () ValueCell!16131)

(assert (=> b!1286598 (= condMapEmpty!52646 (= (arr!41086 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16131)) mapDefault!52646)))))

(declare-fun bm!62971 () Bool)

(assert (=> bm!62971 (= call!62971 call!62972)))

(declare-fun bm!62972 () Bool)

(assert (=> bm!62972 (= call!62970 (contains!7927 (ite c!124201 lt!577375 (ite c!124199 lt!577369 lt!577368)) k0!1205))))

(declare-fun res!854606 () Bool)

(assert (=> start!108906 (=> (not res!854606) (not e!734824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108906 (= res!854606 (validMask!0 mask!2175))))

(assert (=> start!108906 e!734824))

(assert (=> start!108906 tp_is_empty!34059))

(assert (=> start!108906 true))

(declare-fun array_inv!31155 (array!85168) Bool)

(assert (=> start!108906 (and (array_inv!31155 _values!1445) e!734825)))

(declare-fun array_inv!31156 (array!85166) Bool)

(assert (=> start!108906 (array_inv!31156 _keys!1741)))

(assert (=> start!108906 tp!100372))

(declare-fun mapIsEmpty!52646 () Bool)

(assert (=> mapIsEmpty!52646 mapRes!52646))

(declare-fun b!1286599 () Bool)

(declare-fun lt!577364 () Unit!42535)

(assert (=> b!1286599 (= e!734826 lt!577364)))

(assert (=> b!1286599 (= lt!577368 call!62975)))

(assert (=> b!1286599 (= lt!577364 call!62971)))

(assert (=> b!1286599 call!62974))

(declare-fun b!1286600 () Bool)

(declare-fun res!854603 () Bool)

(assert (=> b!1286600 (=> (not res!854603) (not e!734824))))

(assert (=> b!1286600 (= res!854603 (and (= (size!41636 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41635 _keys!1741) (size!41636 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108906 res!854606) b!1286600))

(assert (= (and b!1286600 res!854603) b!1286593))

(assert (= (and b!1286593 res!854599) b!1286590))

(assert (= (and b!1286590 res!854604) b!1286583))

(assert (= (and b!1286583 res!854600) b!1286595))

(assert (= (and b!1286595 res!854607) b!1286591))

(assert (= (and b!1286591 res!854601) b!1286588))

(assert (= (and b!1286588 res!854605) b!1286589))

(assert (= (and b!1286589 c!124201) b!1286587))

(assert (= (and b!1286589 (not c!124201)) b!1286592))

(assert (= (and b!1286592 c!124199) b!1286597))

(assert (= (and b!1286592 (not c!124199)) b!1286585))

(assert (= (and b!1286585 c!124200) b!1286599))

(assert (= (and b!1286585 (not c!124200)) b!1286596))

(assert (= (or b!1286597 b!1286599) bm!62967))

(assert (= (or b!1286597 b!1286599) bm!62971))

(assert (= (or b!1286597 b!1286599) bm!62968))

(assert (= (or b!1286587 bm!62967) bm!62970))

(assert (= (or b!1286587 bm!62971) bm!62969))

(assert (= (or b!1286587 bm!62968) bm!62972))

(assert (= (and b!1286589 (not res!854602)) b!1286586))

(assert (= (and b!1286598 condMapEmpty!52646) mapIsEmpty!52646))

(assert (= (and b!1286598 (not condMapEmpty!52646)) mapNonEmpty!52646))

(get-info :version)

(assert (= (and mapNonEmpty!52646 ((_ is ValueCellFull!16131) mapValue!52646)) b!1286584))

(assert (= (and b!1286598 ((_ is ValueCellFull!16131) mapDefault!52646)) b!1286594))

(assert (= start!108906 b!1286598))

(declare-fun b_lambda!23121 () Bool)

(assert (=> (not b_lambda!23121) (not b!1286586)))

(declare-fun t!42678 () Bool)

(declare-fun tb!11363 () Bool)

(assert (=> (and start!108906 (= defaultEntry!1448 defaultEntry!1448) t!42678) tb!11363))

(declare-fun result!23725 () Bool)

(assert (=> tb!11363 (= result!23725 tp_is_empty!34059)))

(assert (=> b!1286586 t!42678))

(declare-fun b_and!46501 () Bool)

(assert (= b_and!46499 (and (=> t!42678 result!23725) b_and!46501)))

(declare-fun m!1179633 () Bool)

(assert (=> b!1286586 m!1179633))

(declare-fun m!1179635 () Bool)

(assert (=> b!1286586 m!1179635))

(assert (=> b!1286586 m!1179635))

(assert (=> b!1286586 m!1179633))

(declare-fun m!1179637 () Bool)

(assert (=> b!1286586 m!1179637))

(declare-fun m!1179639 () Bool)

(assert (=> b!1286586 m!1179639))

(declare-fun m!1179641 () Bool)

(assert (=> b!1286586 m!1179641))

(declare-fun m!1179643 () Bool)

(assert (=> b!1286586 m!1179643))

(assert (=> b!1286586 m!1179643))

(declare-fun m!1179645 () Bool)

(assert (=> b!1286586 m!1179645))

(assert (=> b!1286586 m!1179639))

(declare-fun m!1179647 () Bool)

(assert (=> mapNonEmpty!52646 m!1179647))

(declare-fun m!1179649 () Bool)

(assert (=> bm!62970 m!1179649))

(declare-fun m!1179651 () Bool)

(assert (=> b!1286595 m!1179651))

(assert (=> b!1286595 m!1179651))

(declare-fun m!1179653 () Bool)

(assert (=> b!1286595 m!1179653))

(declare-fun m!1179655 () Bool)

(assert (=> b!1286590 m!1179655))

(declare-fun m!1179657 () Bool)

(assert (=> bm!62972 m!1179657))

(declare-fun m!1179659 () Bool)

(assert (=> b!1286587 m!1179659))

(declare-fun m!1179661 () Bool)

(assert (=> b!1286587 m!1179661))

(declare-fun m!1179663 () Bool)

(assert (=> b!1286587 m!1179663))

(declare-fun m!1179665 () Bool)

(assert (=> b!1286593 m!1179665))

(declare-fun m!1179667 () Bool)

(assert (=> bm!62969 m!1179667))

(declare-fun m!1179669 () Bool)

(assert (=> start!108906 m!1179669))

(declare-fun m!1179671 () Bool)

(assert (=> start!108906 m!1179671))

(declare-fun m!1179673 () Bool)

(assert (=> start!108906 m!1179673))

(assert (=> b!1286588 m!1179639))

(assert (=> b!1286588 m!1179639))

(declare-fun m!1179675 () Bool)

(assert (=> b!1286588 m!1179675))

(assert (=> b!1286589 m!1179639))

(declare-fun m!1179677 () Bool)

(assert (=> b!1286589 m!1179677))

(declare-fun m!1179679 () Bool)

(assert (=> b!1286589 m!1179679))

(check-sat (not b!1286590) (not b!1286586) (not bm!62972) (not b!1286593) (not b!1286587) (not bm!62969) (not b!1286589) (not start!108906) (not b_lambda!23121) (not b!1286588) (not bm!62970) (not b!1286595) b_and!46501 (not mapNonEmpty!52646) (not b_next!28419) tp_is_empty!34059)
(check-sat b_and!46501 (not b_next!28419))
