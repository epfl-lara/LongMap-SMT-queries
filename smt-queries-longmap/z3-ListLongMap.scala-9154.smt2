; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109804 () Bool)

(assert start!109804)

(declare-fun b_free!29197 () Bool)

(declare-fun b_next!29197 () Bool)

(assert (=> start!109804 (= b_free!29197 (not b_next!29197))))

(declare-fun tp!102726 () Bool)

(declare-fun b_and!47293 () Bool)

(assert (=> start!109804 (= tp!102726 b_and!47293)))

(declare-fun b!1300691 () Bool)

(declare-fun res!864314 () Bool)

(declare-fun e!741936 () Bool)

(assert (=> b!1300691 (=> (not res!864314) (not e!741936))))

(declare-datatypes ((array!86585 0))(
  ( (array!86586 (arr!41789 (Array (_ BitVec 32) (_ BitVec 64))) (size!42341 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86585)

(declare-datatypes ((List!29734 0))(
  ( (Nil!29731) (Cons!29730 (h!30939 (_ BitVec 64)) (t!43300 List!29734)) )
))
(declare-fun arrayNoDuplicates!0 (array!86585 (_ BitVec 32) List!29734) Bool)

(assert (=> b!1300691 (= res!864314 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29731))))

(declare-fun b!1300692 () Bool)

(declare-datatypes ((Unit!42886 0))(
  ( (Unit!42887) )
))
(declare-fun e!741935 () Unit!42886)

(declare-fun Unit!42888 () Unit!42886)

(assert (=> b!1300692 (= e!741935 Unit!42888)))

(declare-fun b!1300693 () Bool)

(declare-fun e!741933 () Bool)

(declare-fun tp_is_empty!34837 () Bool)

(assert (=> b!1300693 (= e!741933 tp_is_empty!34837)))

(declare-fun b!1300694 () Bool)

(declare-fun e!741932 () Unit!42886)

(declare-fun e!741937 () Unit!42886)

(assert (=> b!1300694 (= e!741932 e!741937)))

(declare-fun c!124617 () Bool)

(declare-fun lt!581348 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300694 (= c!124617 (and (not lt!581348) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!864319 () Bool)

(assert (=> start!109804 (=> (not res!864319) (not e!741936))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109804 (= res!864319 (validMask!0 mask!2175))))

(assert (=> start!109804 e!741936))

(assert (=> start!109804 tp_is_empty!34837))

(assert (=> start!109804 true))

(declare-datatypes ((V!51553 0))(
  ( (V!51554 (val!17493 Int)) )
))
(declare-datatypes ((ValueCell!16520 0))(
  ( (ValueCellFull!16520 (v!20100 V!51553)) (EmptyCell!16520) )
))
(declare-datatypes ((array!86587 0))(
  ( (array!86588 (arr!41790 (Array (_ BitVec 32) ValueCell!16520)) (size!42342 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86587)

(declare-fun e!741938 () Bool)

(declare-fun array_inv!31787 (array!86587) Bool)

(assert (=> start!109804 (and (array_inv!31787 _values!1445) e!741938)))

(declare-fun array_inv!31788 (array!86585) Bool)

(assert (=> start!109804 (array_inv!31788 _keys!1741)))

(assert (=> start!109804 tp!102726))

(declare-fun minValue!1387 () V!51553)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun bm!63705 () Bool)

(declare-datatypes ((tuple2!22616 0))(
  ( (tuple2!22617 (_1!11319 (_ BitVec 64)) (_2!11319 V!51553)) )
))
(declare-datatypes ((List!29735 0))(
  ( (Nil!29732) (Cons!29731 (h!30940 tuple2!22616) (t!43301 List!29735)) )
))
(declare-datatypes ((ListLongMap!20273 0))(
  ( (ListLongMap!20274 (toList!10152 List!29735)) )
))
(declare-fun call!63710 () ListLongMap!20273)

(declare-fun zeroValue!1387 () V!51553)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6123 (array!86585 array!86587 (_ BitVec 32) (_ BitVec 32) V!51553 V!51553 (_ BitVec 32) Int) ListLongMap!20273)

(assert (=> bm!63705 (= call!63710 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300695 () Bool)

(declare-fun lt!581353 () Unit!42886)

(assert (=> b!1300695 (= e!741932 lt!581353)))

(declare-fun lt!581349 () ListLongMap!20273)

(assert (=> b!1300695 (= lt!581349 call!63710)))

(declare-fun lt!581346 () ListLongMap!20273)

(declare-fun +!4493 (ListLongMap!20273 tuple2!22616) ListLongMap!20273)

(assert (=> b!1300695 (= lt!581346 (+!4493 lt!581349 (tuple2!22617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581354 () Unit!42886)

(declare-fun call!63708 () Unit!42886)

(assert (=> b!1300695 (= lt!581354 call!63708)))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8208 (ListLongMap!20273 (_ BitVec 64)) Bool)

(assert (=> b!1300695 (contains!8208 lt!581346 k0!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!76 ((_ BitVec 64) (_ BitVec 64) V!51553 ListLongMap!20273) Unit!42886)

(assert (=> b!1300695 (= lt!581353 (lemmaInListMapAfterAddingDiffThenInBefore!76 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581349))))

(declare-fun call!63713 () Bool)

(assert (=> b!1300695 call!63713))

(declare-fun mapIsEmpty!53831 () Bool)

(declare-fun mapRes!53831 () Bool)

(assert (=> mapIsEmpty!53831 mapRes!53831))

(declare-fun b!1300696 () Bool)

(declare-fun res!864318 () Bool)

(assert (=> b!1300696 (=> (not res!864318) (not e!741936))))

(assert (=> b!1300696 (= res!864318 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42341 _keys!1741))))))

(declare-fun bm!63706 () Bool)

(declare-fun call!63711 () Bool)

(assert (=> bm!63706 (= call!63711 call!63713)))

(declare-fun b!1300697 () Bool)

(declare-fun res!864313 () Bool)

(assert (=> b!1300697 (=> (not res!864313) (not e!741936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300697 (= res!864313 (validKeyInArray!0 (select (arr!41789 _keys!1741) from!2144)))))

(declare-fun c!124618 () Bool)

(declare-fun lt!581351 () ListLongMap!20273)

(declare-fun bm!63707 () Bool)

(declare-fun lt!581350 () ListLongMap!20273)

(assert (=> bm!63707 (= call!63713 (contains!8208 (ite c!124618 lt!581349 (ite c!124617 lt!581351 lt!581350)) k0!1205))))

(declare-fun b!1300698 () Bool)

(declare-fun lt!581352 () Unit!42886)

(assert (=> b!1300698 (= e!741935 lt!581352)))

(declare-fun call!63709 () ListLongMap!20273)

(assert (=> b!1300698 (= lt!581350 call!63709)))

(declare-fun call!63712 () Unit!42886)

(assert (=> b!1300698 (= lt!581352 call!63712)))

(assert (=> b!1300698 call!63711))

(declare-fun bm!63708 () Bool)

(assert (=> bm!63708 (= call!63708 (lemmaInListMapAfterAddingDiffThenInBefore!76 k0!1205 (ite c!124618 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124617 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124618 minValue!1387 (ite c!124617 zeroValue!1387 minValue!1387)) (ite c!124618 lt!581346 (ite c!124617 lt!581351 lt!581350))))))

(declare-fun b!1300699 () Bool)

(declare-fun res!864315 () Bool)

(assert (=> b!1300699 (=> (not res!864315) (not e!741936))))

(assert (=> b!1300699 (= res!864315 (and (= (size!42342 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42341 _keys!1741) (size!42342 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300700 () Bool)

(declare-fun res!864317 () Bool)

(assert (=> b!1300700 (=> (not res!864317) (not e!741936))))

(declare-fun getCurrentListMap!5065 (array!86585 array!86587 (_ BitVec 32) (_ BitVec 32) V!51553 V!51553 (_ BitVec 32) Int) ListLongMap!20273)

(assert (=> b!1300700 (= res!864317 (contains!8208 (getCurrentListMap!5065 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300701 () Bool)

(declare-fun res!864316 () Bool)

(assert (=> b!1300701 (=> (not res!864316) (not e!741936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86585 (_ BitVec 32)) Bool)

(assert (=> b!1300701 (= res!864316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63709 () Bool)

(assert (=> bm!63709 (= call!63709 call!63710)))

(declare-fun b!1300702 () Bool)

(declare-fun c!124616 () Bool)

(assert (=> b!1300702 (= c!124616 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581348))))

(assert (=> b!1300702 (= e!741937 e!741935)))

(declare-fun b!1300703 () Bool)

(assert (=> b!1300703 (= e!741936 (not true))))

(assert (=> b!1300703 (not (contains!8208 (ListLongMap!20274 Nil!29732) k0!1205))))

(declare-fun lt!581347 () Unit!42886)

(declare-fun emptyContainsNothing!191 ((_ BitVec 64)) Unit!42886)

(assert (=> b!1300703 (= lt!581347 (emptyContainsNothing!191 k0!1205))))

(declare-fun lt!581355 () Unit!42886)

(assert (=> b!1300703 (= lt!581355 e!741932)))

(assert (=> b!1300703 (= c!124618 (and (not lt!581348) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300703 (= lt!581348 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1300704 () Bool)

(declare-fun res!864320 () Bool)

(assert (=> b!1300704 (=> (not res!864320) (not e!741936))))

(assert (=> b!1300704 (= res!864320 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42341 _keys!1741))))))

(declare-fun b!1300705 () Bool)

(assert (=> b!1300705 (= e!741938 (and e!741933 mapRes!53831))))

(declare-fun condMapEmpty!53831 () Bool)

(declare-fun mapDefault!53831 () ValueCell!16520)

(assert (=> b!1300705 (= condMapEmpty!53831 (= (arr!41790 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16520)) mapDefault!53831)))))

(declare-fun bm!63710 () Bool)

(assert (=> bm!63710 (= call!63712 call!63708)))

(declare-fun b!1300706 () Bool)

(assert (=> b!1300706 call!63711))

(declare-fun lt!581356 () Unit!42886)

(assert (=> b!1300706 (= lt!581356 call!63712)))

(assert (=> b!1300706 (= lt!581351 call!63709)))

(assert (=> b!1300706 (= e!741937 lt!581356)))

(declare-fun mapNonEmpty!53831 () Bool)

(declare-fun tp!102725 () Bool)

(declare-fun e!741939 () Bool)

(assert (=> mapNonEmpty!53831 (= mapRes!53831 (and tp!102725 e!741939))))

(declare-fun mapKey!53831 () (_ BitVec 32))

(declare-fun mapRest!53831 () (Array (_ BitVec 32) ValueCell!16520))

(declare-fun mapValue!53831 () ValueCell!16520)

(assert (=> mapNonEmpty!53831 (= (arr!41790 _values!1445) (store mapRest!53831 mapKey!53831 mapValue!53831))))

(declare-fun b!1300707 () Bool)

(assert (=> b!1300707 (= e!741939 tp_is_empty!34837)))

(assert (= (and start!109804 res!864319) b!1300699))

(assert (= (and b!1300699 res!864315) b!1300701))

(assert (= (and b!1300701 res!864316) b!1300691))

(assert (= (and b!1300691 res!864314) b!1300696))

(assert (= (and b!1300696 res!864318) b!1300700))

(assert (= (and b!1300700 res!864317) b!1300704))

(assert (= (and b!1300704 res!864320) b!1300697))

(assert (= (and b!1300697 res!864313) b!1300703))

(assert (= (and b!1300703 c!124618) b!1300695))

(assert (= (and b!1300703 (not c!124618)) b!1300694))

(assert (= (and b!1300694 c!124617) b!1300706))

(assert (= (and b!1300694 (not c!124617)) b!1300702))

(assert (= (and b!1300702 c!124616) b!1300698))

(assert (= (and b!1300702 (not c!124616)) b!1300692))

(assert (= (or b!1300706 b!1300698) bm!63709))

(assert (= (or b!1300706 b!1300698) bm!63710))

(assert (= (or b!1300706 b!1300698) bm!63706))

(assert (= (or b!1300695 bm!63709) bm!63705))

(assert (= (or b!1300695 bm!63710) bm!63708))

(assert (= (or b!1300695 bm!63706) bm!63707))

(assert (= (and b!1300705 condMapEmpty!53831) mapIsEmpty!53831))

(assert (= (and b!1300705 (not condMapEmpty!53831)) mapNonEmpty!53831))

(get-info :version)

(assert (= (and mapNonEmpty!53831 ((_ is ValueCellFull!16520) mapValue!53831)) b!1300707))

(assert (= (and b!1300705 ((_ is ValueCellFull!16520) mapDefault!53831)) b!1300693))

(assert (= start!109804 b!1300705))

(declare-fun m!1191089 () Bool)

(assert (=> b!1300695 m!1191089))

(declare-fun m!1191091 () Bool)

(assert (=> b!1300695 m!1191091))

(declare-fun m!1191093 () Bool)

(assert (=> b!1300695 m!1191093))

(declare-fun m!1191095 () Bool)

(assert (=> b!1300697 m!1191095))

(assert (=> b!1300697 m!1191095))

(declare-fun m!1191097 () Bool)

(assert (=> b!1300697 m!1191097))

(declare-fun m!1191099 () Bool)

(assert (=> mapNonEmpty!53831 m!1191099))

(declare-fun m!1191101 () Bool)

(assert (=> b!1300700 m!1191101))

(assert (=> b!1300700 m!1191101))

(declare-fun m!1191103 () Bool)

(assert (=> b!1300700 m!1191103))

(declare-fun m!1191105 () Bool)

(assert (=> b!1300701 m!1191105))

(declare-fun m!1191107 () Bool)

(assert (=> bm!63708 m!1191107))

(declare-fun m!1191109 () Bool)

(assert (=> b!1300703 m!1191109))

(declare-fun m!1191111 () Bool)

(assert (=> b!1300703 m!1191111))

(declare-fun m!1191113 () Bool)

(assert (=> start!109804 m!1191113))

(declare-fun m!1191115 () Bool)

(assert (=> start!109804 m!1191115))

(declare-fun m!1191117 () Bool)

(assert (=> start!109804 m!1191117))

(declare-fun m!1191119 () Bool)

(assert (=> b!1300691 m!1191119))

(declare-fun m!1191121 () Bool)

(assert (=> bm!63707 m!1191121))

(declare-fun m!1191123 () Bool)

(assert (=> bm!63705 m!1191123))

(check-sat (not b!1300691) b_and!47293 (not b_next!29197) (not b!1300703) (not bm!63707) (not mapNonEmpty!53831) tp_is_empty!34837 (not bm!63705) (not bm!63708) (not b!1300701) (not start!109804) (not b!1300700) (not b!1300697) (not b!1300695))
(check-sat b_and!47293 (not b_next!29197))
