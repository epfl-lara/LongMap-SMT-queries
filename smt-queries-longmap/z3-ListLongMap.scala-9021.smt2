; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108886 () Bool)

(assert start!108886)

(declare-fun b_free!28399 () Bool)

(declare-fun b_next!28399 () Bool)

(assert (=> start!108886 (= b_free!28399 (not b_next!28399))))

(declare-fun tp!100313 () Bool)

(declare-fun b_and!46447 () Bool)

(assert (=> start!108886 (= tp!100313 b_and!46447)))

(declare-fun b!1285972 () Bool)

(declare-fun res!854309 () Bool)

(declare-fun e!734533 () Bool)

(assert (=> b!1285972 (=> (not res!854309) (not e!734533))))

(declare-datatypes ((V!50489 0))(
  ( (V!50490 (val!17094 Int)) )
))
(declare-datatypes ((ValueCell!16121 0))(
  ( (ValueCellFull!16121 (v!19695 V!50489)) (EmptyCell!16121) )
))
(declare-datatypes ((array!85021 0))(
  ( (array!85022 (arr!41013 (Array (_ BitVec 32) ValueCell!16121)) (size!41565 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85021)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85023 0))(
  ( (array!85024 (arr!41014 (Array (_ BitVec 32) (_ BitVec 64))) (size!41566 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85023)

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1285972 (= res!854309 (and (= (size!41565 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41566 _keys!1741) (size!41565 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!854315 () Bool)

(assert (=> start!108886 (=> (not res!854315) (not e!734533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108886 (= res!854315 (validMask!0 mask!2175))))

(assert (=> start!108886 e!734533))

(declare-fun tp_is_empty!34039 () Bool)

(assert (=> start!108886 tp_is_empty!34039))

(assert (=> start!108886 true))

(declare-fun e!734530 () Bool)

(declare-fun array_inv!31263 (array!85021) Bool)

(assert (=> start!108886 (and (array_inv!31263 _values!1445) e!734530)))

(declare-fun array_inv!31264 (array!85023) Bool)

(assert (=> start!108886 (array_inv!31264 _keys!1741)))

(assert (=> start!108886 tp!100313))

(declare-fun b!1285973 () Bool)

(declare-datatypes ((Unit!42353 0))(
  ( (Unit!42354) )
))
(declare-fun e!734535 () Unit!42353)

(declare-fun e!734534 () Unit!42353)

(assert (=> b!1285973 (= e!734535 e!734534)))

(declare-fun c!124095 () Bool)

(declare-fun lt!576812 () Bool)

(assert (=> b!1285973 (= c!124095 (and (not lt!576812) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun minValue!1387 () V!50489)

(declare-fun zeroValue!1387 () V!50489)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!62768 () Bool)

(declare-datatypes ((tuple2!21980 0))(
  ( (tuple2!21981 (_1!11001 (_ BitVec 64)) (_2!11001 V!50489)) )
))
(declare-datatypes ((List!29157 0))(
  ( (Nil!29154) (Cons!29153 (h!30362 tuple2!21980) (t!42693 List!29157)) )
))
(declare-datatypes ((ListLongMap!19637 0))(
  ( (ListLongMap!19638 (toList!9834 List!29157)) )
))
(declare-fun call!62772 () ListLongMap!19637)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5980 (array!85023 array!85021 (_ BitVec 32) (_ BitVec 32) V!50489 V!50489 (_ BitVec 32) Int) ListLongMap!19637)

(assert (=> bm!62768 (= call!62772 (getCurrentListMapNoExtraKeys!5980 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1285974 () Bool)

(declare-fun e!734532 () Unit!42353)

(declare-fun Unit!42355 () Unit!42353)

(assert (=> b!1285974 (= e!734532 Unit!42355)))

(declare-fun b!1285975 () Bool)

(declare-fun c!124094 () Bool)

(assert (=> b!1285975 (= c!124094 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!576812))))

(assert (=> b!1285975 (= e!734534 e!734532)))

(declare-fun b!1285976 () Bool)

(assert (=> b!1285976 (= e!734533 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7881 (ListLongMap!19637 (_ BitVec 64)) Bool)

(assert (=> b!1285976 (not (contains!7881 (ListLongMap!19638 Nil!29154) k0!1205))))

(declare-fun lt!576813 () Unit!42353)

(declare-fun emptyContainsNothing!1 ((_ BitVec 64)) Unit!42353)

(assert (=> b!1285976 (= lt!576813 (emptyContainsNothing!1 k0!1205))))

(declare-fun lt!576814 () Unit!42353)

(assert (=> b!1285976 (= lt!576814 e!734535)))

(declare-fun c!124093 () Bool)

(assert (=> b!1285976 (= c!124093 (and (not lt!576812) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1285976 (= lt!576812 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1285977 () Bool)

(declare-fun lt!576818 () Unit!42353)

(assert (=> b!1285977 (= e!734532 lt!576818)))

(declare-fun lt!576810 () ListLongMap!19637)

(declare-fun call!62775 () ListLongMap!19637)

(assert (=> b!1285977 (= lt!576810 call!62775)))

(declare-fun call!62771 () Unit!42353)

(assert (=> b!1285977 (= lt!576818 call!62771)))

(declare-fun call!62776 () Bool)

(assert (=> b!1285977 call!62776))

(declare-fun b!1285978 () Bool)

(declare-fun res!854316 () Bool)

(assert (=> b!1285978 (=> (not res!854316) (not e!734533))))

(declare-datatypes ((List!29158 0))(
  ( (Nil!29155) (Cons!29154 (h!30363 (_ BitVec 64)) (t!42694 List!29158)) )
))
(declare-fun arrayNoDuplicates!0 (array!85023 (_ BitVec 32) List!29158) Bool)

(assert (=> b!1285978 (= res!854316 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29155))))

(declare-fun bm!62769 () Bool)

(declare-fun call!62774 () Bool)

(assert (=> bm!62769 (= call!62776 call!62774)))

(declare-fun bm!62770 () Bool)

(assert (=> bm!62770 (= call!62775 call!62772)))

(declare-fun b!1285979 () Bool)

(declare-fun e!734528 () Bool)

(assert (=> b!1285979 (= e!734528 tp_is_empty!34039)))

(declare-fun b!1285980 () Bool)

(declare-fun e!734531 () Bool)

(assert (=> b!1285980 (= e!734531 tp_is_empty!34039)))

(declare-fun b!1285981 () Bool)

(declare-fun mapRes!52616 () Bool)

(assert (=> b!1285981 (= e!734530 (and e!734531 mapRes!52616))))

(declare-fun condMapEmpty!52616 () Bool)

(declare-fun mapDefault!52616 () ValueCell!16121)

(assert (=> b!1285981 (= condMapEmpty!52616 (= (arr!41013 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16121)) mapDefault!52616)))))

(declare-fun bm!62771 () Bool)

(declare-fun lt!576819 () ListLongMap!19637)

(declare-fun lt!576811 () ListLongMap!19637)

(assert (=> bm!62771 (= call!62774 (contains!7881 (ite c!124093 lt!576811 (ite c!124095 lt!576819 lt!576810)) k0!1205))))

(declare-fun b!1285982 () Bool)

(declare-fun res!854313 () Bool)

(assert (=> b!1285982 (=> (not res!854313) (not e!734533))))

(declare-fun getCurrentListMap!4804 (array!85023 array!85021 (_ BitVec 32) (_ BitVec 32) V!50489 V!50489 (_ BitVec 32) Int) ListLongMap!19637)

(assert (=> b!1285982 (= res!854313 (contains!7881 (getCurrentListMap!4804 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285983 () Bool)

(assert (=> b!1285983 call!62776))

(declare-fun lt!576817 () Unit!42353)

(assert (=> b!1285983 (= lt!576817 call!62771)))

(assert (=> b!1285983 (= lt!576819 call!62775)))

(assert (=> b!1285983 (= e!734534 lt!576817)))

(declare-fun bm!62772 () Bool)

(declare-fun call!62773 () Unit!42353)

(assert (=> bm!62772 (= call!62771 call!62773)))

(declare-fun bm!62773 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!27 ((_ BitVec 64) (_ BitVec 64) V!50489 ListLongMap!19637) Unit!42353)

(assert (=> bm!62773 (= call!62773 (lemmaInListMapAfterAddingDiffThenInBefore!27 k0!1205 (ite c!124093 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124095 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124093 minValue!1387 (ite c!124095 zeroValue!1387 minValue!1387)) (ite c!124093 lt!576811 (ite c!124095 lt!576819 lt!576810))))))

(declare-fun b!1285984 () Bool)

(declare-fun lt!576815 () Unit!42353)

(assert (=> b!1285984 (= e!734535 lt!576815)))

(declare-fun lt!576809 () ListLongMap!19637)

(assert (=> b!1285984 (= lt!576809 call!62772)))

(declare-fun +!4349 (ListLongMap!19637 tuple2!21980) ListLongMap!19637)

(assert (=> b!1285984 (= lt!576811 (+!4349 lt!576809 (tuple2!21981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!576816 () Unit!42353)

(assert (=> b!1285984 (= lt!576816 call!62773)))

(assert (=> b!1285984 call!62774))

(assert (=> b!1285984 (= lt!576815 (lemmaInListMapAfterAddingDiffThenInBefore!27 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!576809))))

(assert (=> b!1285984 (contains!7881 lt!576809 k0!1205)))

(declare-fun b!1285985 () Bool)

(declare-fun res!854311 () Bool)

(assert (=> b!1285985 (=> (not res!854311) (not e!734533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285985 (= res!854311 (validKeyInArray!0 (select (arr!41014 _keys!1741) from!2144)))))

(declare-fun b!1285986 () Bool)

(declare-fun res!854312 () Bool)

(assert (=> b!1285986 (=> (not res!854312) (not e!734533))))

(assert (=> b!1285986 (= res!854312 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41566 _keys!1741))))))

(declare-fun mapNonEmpty!52616 () Bool)

(declare-fun tp!100314 () Bool)

(assert (=> mapNonEmpty!52616 (= mapRes!52616 (and tp!100314 e!734528))))

(declare-fun mapKey!52616 () (_ BitVec 32))

(declare-fun mapValue!52616 () ValueCell!16121)

(declare-fun mapRest!52616 () (Array (_ BitVec 32) ValueCell!16121))

(assert (=> mapNonEmpty!52616 (= (arr!41013 _values!1445) (store mapRest!52616 mapKey!52616 mapValue!52616))))

(declare-fun b!1285987 () Bool)

(declare-fun res!854314 () Bool)

(assert (=> b!1285987 (=> (not res!854314) (not e!734533))))

(assert (=> b!1285987 (= res!854314 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41566 _keys!1741))))))

(declare-fun b!1285988 () Bool)

(declare-fun res!854310 () Bool)

(assert (=> b!1285988 (=> (not res!854310) (not e!734533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85023 (_ BitVec 32)) Bool)

(assert (=> b!1285988 (= res!854310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52616 () Bool)

(assert (=> mapIsEmpty!52616 mapRes!52616))

(assert (= (and start!108886 res!854315) b!1285972))

(assert (= (and b!1285972 res!854309) b!1285988))

(assert (= (and b!1285988 res!854310) b!1285978))

(assert (= (and b!1285978 res!854316) b!1285987))

(assert (= (and b!1285987 res!854314) b!1285982))

(assert (= (and b!1285982 res!854313) b!1285986))

(assert (= (and b!1285986 res!854312) b!1285985))

(assert (= (and b!1285985 res!854311) b!1285976))

(assert (= (and b!1285976 c!124093) b!1285984))

(assert (= (and b!1285976 (not c!124093)) b!1285973))

(assert (= (and b!1285973 c!124095) b!1285983))

(assert (= (and b!1285973 (not c!124095)) b!1285975))

(assert (= (and b!1285975 c!124094) b!1285977))

(assert (= (and b!1285975 (not c!124094)) b!1285974))

(assert (= (or b!1285983 b!1285977) bm!62770))

(assert (= (or b!1285983 b!1285977) bm!62772))

(assert (= (or b!1285983 b!1285977) bm!62769))

(assert (= (or b!1285984 bm!62770) bm!62768))

(assert (= (or b!1285984 bm!62772) bm!62773))

(assert (= (or b!1285984 bm!62769) bm!62771))

(assert (= (and b!1285981 condMapEmpty!52616) mapIsEmpty!52616))

(assert (= (and b!1285981 (not condMapEmpty!52616)) mapNonEmpty!52616))

(get-info :version)

(assert (= (and mapNonEmpty!52616 ((_ is ValueCellFull!16121) mapValue!52616)) b!1285979))

(assert (= (and b!1285981 ((_ is ValueCellFull!16121) mapDefault!52616)) b!1285980))

(assert (= start!108886 b!1285981))

(declare-fun m!1178689 () Bool)

(assert (=> bm!62771 m!1178689))

(declare-fun m!1178691 () Bool)

(assert (=> mapNonEmpty!52616 m!1178691))

(declare-fun m!1178693 () Bool)

(assert (=> bm!62773 m!1178693))

(declare-fun m!1178695 () Bool)

(assert (=> b!1285976 m!1178695))

(declare-fun m!1178697 () Bool)

(assert (=> b!1285976 m!1178697))

(declare-fun m!1178699 () Bool)

(assert (=> b!1285985 m!1178699))

(assert (=> b!1285985 m!1178699))

(declare-fun m!1178701 () Bool)

(assert (=> b!1285985 m!1178701))

(declare-fun m!1178703 () Bool)

(assert (=> b!1285984 m!1178703))

(declare-fun m!1178705 () Bool)

(assert (=> b!1285984 m!1178705))

(declare-fun m!1178707 () Bool)

(assert (=> b!1285984 m!1178707))

(declare-fun m!1178709 () Bool)

(assert (=> b!1285982 m!1178709))

(assert (=> b!1285982 m!1178709))

(declare-fun m!1178711 () Bool)

(assert (=> b!1285982 m!1178711))

(declare-fun m!1178713 () Bool)

(assert (=> start!108886 m!1178713))

(declare-fun m!1178715 () Bool)

(assert (=> start!108886 m!1178715))

(declare-fun m!1178717 () Bool)

(assert (=> start!108886 m!1178717))

(declare-fun m!1178719 () Bool)

(assert (=> b!1285978 m!1178719))

(declare-fun m!1178721 () Bool)

(assert (=> bm!62768 m!1178721))

(declare-fun m!1178723 () Bool)

(assert (=> b!1285988 m!1178723))

(check-sat (not b!1285984) (not b!1285982) (not bm!62771) b_and!46447 (not mapNonEmpty!52616) (not b_next!28399) (not b!1285976) (not bm!62768) tp_is_empty!34039 (not b!1285985) (not b!1285988) (not start!108886) (not bm!62773) (not b!1285978))
(check-sat b_and!46447 (not b_next!28399))
