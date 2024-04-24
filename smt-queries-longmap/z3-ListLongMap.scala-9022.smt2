; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109116 () Bool)

(assert start!109116)

(declare-fun b_free!28405 () Bool)

(declare-fun b_next!28405 () Bool)

(assert (=> start!109116 (= b_free!28405 (not b_next!28405))))

(declare-fun tp!100331 () Bool)

(declare-fun b_and!46473 () Bool)

(assert (=> start!109116 (= tp!100331 b_and!46473)))

(declare-fun bm!62906 () Bool)

(declare-datatypes ((V!50497 0))(
  ( (V!50498 (val!17097 Int)) )
))
(declare-datatypes ((tuple2!21940 0))(
  ( (tuple2!21941 (_1!10981 (_ BitVec 64)) (_2!10981 V!50497)) )
))
(declare-datatypes ((List!29140 0))(
  ( (Nil!29137) (Cons!29136 (h!30354 tuple2!21940) (t!42678 List!29140)) )
))
(declare-datatypes ((ListLongMap!19605 0))(
  ( (ListLongMap!19606 (toList!9818 List!29140)) )
))
(declare-fun call!62909 () ListLongMap!19605)

(declare-fun call!62911 () ListLongMap!19605)

(assert (=> bm!62906 (= call!62909 call!62911)))

(declare-fun b!1287496 () Bool)

(declare-datatypes ((Unit!42476 0))(
  ( (Unit!42477) )
))
(declare-fun e!735480 () Unit!42476)

(declare-fun Unit!42478 () Unit!42476)

(assert (=> b!1287496 (= e!735480 Unit!42478)))

(declare-fun minValue!1387 () V!50497)

(declare-fun zeroValue!1387 () V!50497)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16124 0))(
  ( (ValueCellFull!16124 (v!19694 V!50497)) (EmptyCell!16124) )
))
(declare-datatypes ((array!85175 0))(
  ( (array!85176 (arr!41085 (Array (_ BitVec 32) ValueCell!16124)) (size!41636 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85175)

(declare-fun bm!62907 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85177 0))(
  ( (array!85178 (arr!41086 (Array (_ BitVec 32) (_ BitVec 64))) (size!41637 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85177)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5990 (array!85177 array!85175 (_ BitVec 32) (_ BitVec 32) V!50497 V!50497 (_ BitVec 32) Int) ListLongMap!19605)

(assert (=> bm!62907 (= call!62911 (getCurrentListMapNoExtraKeys!5990 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1287497 () Bool)

(declare-fun res!854935 () Bool)

(declare-fun e!735486 () Bool)

(assert (=> b!1287497 (=> (not res!854935) (not e!735486))))

(assert (=> b!1287497 (= res!854935 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41637 _keys!1741))))))

(declare-fun b!1287498 () Bool)

(declare-fun e!735484 () Bool)

(assert (=> b!1287498 (= e!735484 true)))

(declare-fun lt!577584 () V!50497)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7949 (ListLongMap!19605 (_ BitVec 64)) Bool)

(declare-fun +!4357 (ListLongMap!19605 tuple2!21940) ListLongMap!19605)

(assert (=> b!1287498 (not (contains!7949 (+!4357 (ListLongMap!19606 Nil!29137) (tuple2!21941 (select (arr!41086 _keys!1741) from!2144) lt!577584)) k0!1205))))

(declare-fun lt!577582 () Unit!42476)

(declare-fun addStillNotContains!337 (ListLongMap!19605 (_ BitVec 64) V!50497 (_ BitVec 64)) Unit!42476)

(assert (=> b!1287498 (= lt!577582 (addStillNotContains!337 (ListLongMap!19606 Nil!29137) (select (arr!41086 _keys!1741) from!2144) lt!577584 k0!1205))))

(declare-fun get!20903 (ValueCell!16124 V!50497) V!50497)

(declare-fun dynLambda!3472 (Int (_ BitVec 64)) V!50497)

(assert (=> b!1287498 (= lt!577584 (get!20903 (select (arr!41085 _values!1445) from!2144) (dynLambda!3472 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!577585 () ListLongMap!19605)

(declare-fun call!62913 () Unit!42476)

(declare-fun lt!577581 () ListLongMap!19605)

(declare-fun c!124537 () Bool)

(declare-fun lt!577574 () ListLongMap!19605)

(declare-fun c!124536 () Bool)

(declare-fun bm!62908 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!26 ((_ BitVec 64) (_ BitVec 64) V!50497 ListLongMap!19605) Unit!42476)

(assert (=> bm!62908 (= call!62913 (lemmaInListMapAfterAddingDiffThenInBefore!26 k0!1205 (ite (or c!124537 c!124536) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124537 c!124536) zeroValue!1387 minValue!1387) (ite c!124537 lt!577581 (ite c!124536 lt!577574 lt!577585))))))

(declare-fun b!1287499 () Bool)

(declare-fun res!854936 () Bool)

(assert (=> b!1287499 (=> (not res!854936) (not e!735486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85177 (_ BitVec 32)) Bool)

(assert (=> b!1287499 (= res!854936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287500 () Bool)

(declare-fun call!62914 () Bool)

(assert (=> b!1287500 call!62914))

(declare-fun lt!577579 () Unit!42476)

(declare-fun call!62910 () Unit!42476)

(assert (=> b!1287500 (= lt!577579 call!62910)))

(assert (=> b!1287500 (= lt!577574 call!62909)))

(declare-fun e!735482 () Unit!42476)

(assert (=> b!1287500 (= e!735482 lt!577579)))

(declare-fun res!854932 () Bool)

(assert (=> start!109116 (=> (not res!854932) (not e!735486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109116 (= res!854932 (validMask!0 mask!2175))))

(assert (=> start!109116 e!735486))

(declare-fun tp_is_empty!34045 () Bool)

(assert (=> start!109116 tp_is_empty!34045))

(assert (=> start!109116 true))

(declare-fun e!735479 () Bool)

(declare-fun array_inv!31369 (array!85175) Bool)

(assert (=> start!109116 (and (array_inv!31369 _values!1445) e!735479)))

(declare-fun array_inv!31370 (array!85177) Bool)

(assert (=> start!109116 (array_inv!31370 _keys!1741)))

(assert (=> start!109116 tp!100331))

(declare-fun bm!62909 () Bool)

(assert (=> bm!62909 (= call!62910 call!62913)))

(declare-fun b!1287501 () Bool)

(declare-fun e!735483 () Unit!42476)

(assert (=> b!1287501 (= e!735483 e!735482)))

(declare-fun lt!577575 () Bool)

(assert (=> b!1287501 (= c!124536 (and (not lt!577575) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287502 () Bool)

(declare-fun res!854931 () Bool)

(assert (=> b!1287502 (=> (not res!854931) (not e!735486))))

(assert (=> b!1287502 (= res!854931 (and (= (size!41636 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41637 _keys!1741) (size!41636 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287503 () Bool)

(declare-fun lt!577577 () Unit!42476)

(assert (=> b!1287503 (= e!735483 lt!577577)))

(assert (=> b!1287503 (= lt!577581 call!62911)))

(declare-fun lt!577586 () ListLongMap!19605)

(assert (=> b!1287503 (= lt!577586 (+!4357 lt!577581 (tuple2!21941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577576 () Unit!42476)

(assert (=> b!1287503 (= lt!577576 (lemmaInListMapAfterAddingDiffThenInBefore!26 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577586))))

(assert (=> b!1287503 (contains!7949 lt!577586 k0!1205)))

(assert (=> b!1287503 (= lt!577577 call!62913)))

(declare-fun call!62912 () Bool)

(assert (=> b!1287503 call!62912))

(declare-fun b!1287504 () Bool)

(declare-fun e!735481 () Bool)

(assert (=> b!1287504 (= e!735481 tp_is_empty!34045)))

(declare-fun b!1287505 () Bool)

(declare-fun res!854933 () Bool)

(assert (=> b!1287505 (=> (not res!854933) (not e!735486))))

(declare-fun getCurrentListMap!4881 (array!85177 array!85175 (_ BitVec 32) (_ BitVec 32) V!50497 V!50497 (_ BitVec 32) Int) ListLongMap!19605)

(assert (=> b!1287505 (= res!854933 (contains!7949 (getCurrentListMap!4881 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287506 () Bool)

(assert (=> b!1287506 (= e!735486 (not e!735484))))

(declare-fun res!854937 () Bool)

(assert (=> b!1287506 (=> res!854937 e!735484)))

(assert (=> b!1287506 (= res!854937 (= k0!1205 (select (arr!41086 _keys!1741) from!2144)))))

(assert (=> b!1287506 (not (contains!7949 (ListLongMap!19606 Nil!29137) k0!1205))))

(declare-fun lt!577578 () Unit!42476)

(declare-fun emptyContainsNothing!2 ((_ BitVec 64)) Unit!42476)

(assert (=> b!1287506 (= lt!577578 (emptyContainsNothing!2 k0!1205))))

(declare-fun lt!577580 () Unit!42476)

(assert (=> b!1287506 (= lt!577580 e!735483)))

(assert (=> b!1287506 (= c!124537 (and (not lt!577575) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287506 (= lt!577575 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1287507 () Bool)

(declare-fun lt!577583 () Unit!42476)

(assert (=> b!1287507 (= e!735480 lt!577583)))

(assert (=> b!1287507 (= lt!577585 call!62909)))

(assert (=> b!1287507 (= lt!577583 call!62910)))

(assert (=> b!1287507 call!62914))

(declare-fun bm!62910 () Bool)

(assert (=> bm!62910 (= call!62914 call!62912)))

(declare-fun mapNonEmpty!52625 () Bool)

(declare-fun mapRes!52625 () Bool)

(declare-fun tp!100330 () Bool)

(declare-fun e!735485 () Bool)

(assert (=> mapNonEmpty!52625 (= mapRes!52625 (and tp!100330 e!735485))))

(declare-fun mapRest!52625 () (Array (_ BitVec 32) ValueCell!16124))

(declare-fun mapKey!52625 () (_ BitVec 32))

(declare-fun mapValue!52625 () ValueCell!16124)

(assert (=> mapNonEmpty!52625 (= (arr!41085 _values!1445) (store mapRest!52625 mapKey!52625 mapValue!52625))))

(declare-fun b!1287508 () Bool)

(declare-fun res!854938 () Bool)

(assert (=> b!1287508 (=> (not res!854938) (not e!735486))))

(declare-datatypes ((List!29141 0))(
  ( (Nil!29138) (Cons!29137 (h!30355 (_ BitVec 64)) (t!42679 List!29141)) )
))
(declare-fun arrayNoDuplicates!0 (array!85177 (_ BitVec 32) List!29141) Bool)

(assert (=> b!1287508 (= res!854938 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29138))))

(declare-fun mapIsEmpty!52625 () Bool)

(assert (=> mapIsEmpty!52625 mapRes!52625))

(declare-fun b!1287509 () Bool)

(declare-fun c!124538 () Bool)

(assert (=> b!1287509 (= c!124538 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577575))))

(assert (=> b!1287509 (= e!735482 e!735480)))

(declare-fun b!1287510 () Bool)

(assert (=> b!1287510 (= e!735479 (and e!735481 mapRes!52625))))

(declare-fun condMapEmpty!52625 () Bool)

(declare-fun mapDefault!52625 () ValueCell!16124)

(assert (=> b!1287510 (= condMapEmpty!52625 (= (arr!41085 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16124)) mapDefault!52625)))))

(declare-fun b!1287511 () Bool)

(declare-fun res!854934 () Bool)

(assert (=> b!1287511 (=> (not res!854934) (not e!735486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287511 (= res!854934 (validKeyInArray!0 (select (arr!41086 _keys!1741) from!2144)))))

(declare-fun b!1287512 () Bool)

(declare-fun res!854930 () Bool)

(assert (=> b!1287512 (=> (not res!854930) (not e!735486))))

(assert (=> b!1287512 (= res!854930 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41637 _keys!1741))))))

(declare-fun bm!62911 () Bool)

(assert (=> bm!62911 (= call!62912 (contains!7949 (ite c!124537 lt!577581 (ite c!124536 lt!577574 lt!577585)) k0!1205))))

(declare-fun b!1287513 () Bool)

(assert (=> b!1287513 (= e!735485 tp_is_empty!34045)))

(assert (= (and start!109116 res!854932) b!1287502))

(assert (= (and b!1287502 res!854931) b!1287499))

(assert (= (and b!1287499 res!854936) b!1287508))

(assert (= (and b!1287508 res!854938) b!1287497))

(assert (= (and b!1287497 res!854935) b!1287505))

(assert (= (and b!1287505 res!854933) b!1287512))

(assert (= (and b!1287512 res!854930) b!1287511))

(assert (= (and b!1287511 res!854934) b!1287506))

(assert (= (and b!1287506 c!124537) b!1287503))

(assert (= (and b!1287506 (not c!124537)) b!1287501))

(assert (= (and b!1287501 c!124536) b!1287500))

(assert (= (and b!1287501 (not c!124536)) b!1287509))

(assert (= (and b!1287509 c!124538) b!1287507))

(assert (= (and b!1287509 (not c!124538)) b!1287496))

(assert (= (or b!1287500 b!1287507) bm!62906))

(assert (= (or b!1287500 b!1287507) bm!62909))

(assert (= (or b!1287500 b!1287507) bm!62910))

(assert (= (or b!1287503 bm!62906) bm!62907))

(assert (= (or b!1287503 bm!62909) bm!62908))

(assert (= (or b!1287503 bm!62910) bm!62911))

(assert (= (and b!1287506 (not res!854937)) b!1287498))

(assert (= (and b!1287510 condMapEmpty!52625) mapIsEmpty!52625))

(assert (= (and b!1287510 (not condMapEmpty!52625)) mapNonEmpty!52625))

(get-info :version)

(assert (= (and mapNonEmpty!52625 ((_ is ValueCellFull!16124) mapValue!52625)) b!1287513))

(assert (= (and b!1287510 ((_ is ValueCellFull!16124) mapDefault!52625)) b!1287504))

(assert (= start!109116 b!1287510))

(declare-fun b_lambda!23101 () Bool)

(assert (=> (not b_lambda!23101) (not b!1287498)))

(declare-fun t!42677 () Bool)

(declare-fun tb!11341 () Bool)

(assert (=> (and start!109116 (= defaultEntry!1448 defaultEntry!1448) t!42677) tb!11341))

(declare-fun result!23689 () Bool)

(assert (=> tb!11341 (= result!23689 tp_is_empty!34045)))

(assert (=> b!1287498 t!42677))

(declare-fun b_and!46475 () Bool)

(assert (= b_and!46473 (and (=> t!42677 result!23689) b_and!46475)))

(declare-fun m!1180909 () Bool)

(assert (=> b!1287503 m!1180909))

(declare-fun m!1180911 () Bool)

(assert (=> b!1287503 m!1180911))

(declare-fun m!1180913 () Bool)

(assert (=> b!1287503 m!1180913))

(declare-fun m!1180915 () Bool)

(assert (=> b!1287508 m!1180915))

(declare-fun m!1180917 () Bool)

(assert (=> bm!62908 m!1180917))

(declare-fun m!1180919 () Bool)

(assert (=> b!1287506 m!1180919))

(declare-fun m!1180921 () Bool)

(assert (=> b!1287506 m!1180921))

(declare-fun m!1180923 () Bool)

(assert (=> b!1287506 m!1180923))

(declare-fun m!1180925 () Bool)

(assert (=> start!109116 m!1180925))

(declare-fun m!1180927 () Bool)

(assert (=> start!109116 m!1180927))

(declare-fun m!1180929 () Bool)

(assert (=> start!109116 m!1180929))

(declare-fun m!1180931 () Bool)

(assert (=> mapNonEmpty!52625 m!1180931))

(declare-fun m!1180933 () Bool)

(assert (=> b!1287505 m!1180933))

(assert (=> b!1287505 m!1180933))

(declare-fun m!1180935 () Bool)

(assert (=> b!1287505 m!1180935))

(declare-fun m!1180937 () Bool)

(assert (=> bm!62911 m!1180937))

(declare-fun m!1180939 () Bool)

(assert (=> b!1287498 m!1180939))

(declare-fun m!1180941 () Bool)

(assert (=> b!1287498 m!1180941))

(declare-fun m!1180943 () Bool)

(assert (=> b!1287498 m!1180943))

(declare-fun m!1180945 () Bool)

(assert (=> b!1287498 m!1180945))

(assert (=> b!1287498 m!1180919))

(declare-fun m!1180947 () Bool)

(assert (=> b!1287498 m!1180947))

(assert (=> b!1287498 m!1180943))

(assert (=> b!1287498 m!1180941))

(assert (=> b!1287498 m!1180939))

(declare-fun m!1180949 () Bool)

(assert (=> b!1287498 m!1180949))

(assert (=> b!1287498 m!1180919))

(declare-fun m!1180951 () Bool)

(assert (=> b!1287499 m!1180951))

(assert (=> b!1287511 m!1180919))

(assert (=> b!1287511 m!1180919))

(declare-fun m!1180953 () Bool)

(assert (=> b!1287511 m!1180953))

(declare-fun m!1180955 () Bool)

(assert (=> bm!62907 m!1180955))

(check-sat (not b!1287506) (not bm!62911) (not b!1287503) (not b_lambda!23101) (not mapNonEmpty!52625) (not b!1287508) (not bm!62908) tp_is_empty!34045 (not b!1287511) b_and!46475 (not b_next!28405) (not b!1287499) (not b!1287498) (not bm!62907) (not start!109116) (not b!1287505))
(check-sat b_and!46475 (not b_next!28405))
