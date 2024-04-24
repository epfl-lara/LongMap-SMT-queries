; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110034 () Bool)

(assert start!110034)

(declare-fun b_free!29203 () Bool)

(declare-fun b_next!29203 () Bool)

(assert (=> start!110034 (= b_free!29203 (not b_next!29203))))

(declare-fun tp!102743 () Bool)

(declare-fun b_and!47319 () Bool)

(assert (=> start!110034 (= tp!102743 b_and!47319)))

(declare-fun b!1302213 () Bool)

(declare-fun res!864935 () Bool)

(declare-fun e!742883 () Bool)

(assert (=> b!1302213 (=> (not res!864935) (not e!742883))))

(declare-datatypes ((array!86735 0))(
  ( (array!86736 (arr!41859 (Array (_ BitVec 32) (_ BitVec 64))) (size!42410 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86735)

(declare-datatypes ((List!29738 0))(
  ( (Nil!29735) (Cons!29734 (h!30952 (_ BitVec 64)) (t!43304 List!29738)) )
))
(declare-fun arrayNoDuplicates!0 (array!86735 (_ BitVec 32) List!29738) Bool)

(assert (=> b!1302213 (= res!864935 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29735))))

(declare-datatypes ((V!51561 0))(
  ( (V!51562 (val!17496 Int)) )
))
(declare-fun minValue!1387 () V!51561)

(declare-fun zeroValue!1387 () V!51561)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16523 0))(
  ( (ValueCellFull!16523 (v!20099 V!51561)) (EmptyCell!16523) )
))
(declare-datatypes ((array!86737 0))(
  ( (array!86738 (arr!41860 (Array (_ BitVec 32) ValueCell!16523)) (size!42411 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86737)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun bm!63843 () Bool)

(declare-datatypes ((tuple2!22584 0))(
  ( (tuple2!22585 (_1!11303 (_ BitVec 64)) (_2!11303 V!51561)) )
))
(declare-datatypes ((List!29739 0))(
  ( (Nil!29736) (Cons!29735 (h!30953 tuple2!22584) (t!43305 List!29739)) )
))
(declare-datatypes ((ListLongMap!20249 0))(
  ( (ListLongMap!20250 (toList!10140 List!29739)) )
))
(declare-fun call!63847 () ListLongMap!20249)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6146 (array!86735 array!86737 (_ BitVec 32) (_ BitVec 32) V!51561 V!51561 (_ BitVec 32) Int) ListLongMap!20249)

(assert (=> bm!63843 (= call!63847 (getCurrentListMapNoExtraKeys!6146 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302214 () Bool)

(declare-datatypes ((Unit!43020 0))(
  ( (Unit!43021) )
))
(declare-fun e!742884 () Unit!43020)

(declare-fun lt!582116 () Unit!43020)

(assert (=> b!1302214 (= e!742884 lt!582116)))

(declare-fun lt!582109 () ListLongMap!20249)

(assert (=> b!1302214 (= lt!582109 call!63847)))

(declare-fun lt!582117 () ListLongMap!20249)

(declare-fun +!4507 (ListLongMap!20249 tuple2!22584) ListLongMap!20249)

(assert (=> b!1302214 (= lt!582117 (+!4507 lt!582109 (tuple2!22585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!582113 () Unit!43020)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!82 ((_ BitVec 64) (_ BitVec 64) V!51561 ListLongMap!20249) Unit!43020)

(assert (=> b!1302214 (= lt!582113 (lemmaInListMapAfterAddingDiffThenInBefore!82 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582117))))

(declare-fun contains!8278 (ListLongMap!20249 (_ BitVec 64)) Bool)

(assert (=> b!1302214 (contains!8278 lt!582117 k0!1205)))

(declare-fun call!63849 () Unit!43020)

(assert (=> b!1302214 (= lt!582116 call!63849)))

(declare-fun call!63846 () Bool)

(assert (=> b!1302214 call!63846))

(declare-fun bm!63844 () Bool)

(declare-fun c!125061 () Bool)

(declare-fun c!125059 () Bool)

(declare-fun lt!582107 () ListLongMap!20249)

(declare-fun lt!582112 () ListLongMap!20249)

(assert (=> bm!63844 (= call!63846 (contains!8278 (ite c!125061 lt!582109 (ite c!125059 lt!582107 lt!582112)) k0!1205))))

(declare-fun mapIsEmpty!53840 () Bool)

(declare-fun mapRes!53840 () Bool)

(assert (=> mapIsEmpty!53840 mapRes!53840))

(declare-fun b!1302215 () Bool)

(declare-fun e!742882 () Bool)

(declare-fun tp_is_empty!34843 () Bool)

(assert (=> b!1302215 (= e!742882 tp_is_empty!34843)))

(declare-fun b!1302216 () Bool)

(declare-fun e!742881 () Bool)

(declare-fun e!742880 () Bool)

(assert (=> b!1302216 (= e!742881 (and e!742880 mapRes!53840))))

(declare-fun condMapEmpty!53840 () Bool)

(declare-fun mapDefault!53840 () ValueCell!16523)

(assert (=> b!1302216 (= condMapEmpty!53840 (= (arr!41860 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16523)) mapDefault!53840)))))

(declare-fun b!1302217 () Bool)

(declare-fun c!125060 () Bool)

(declare-fun lt!582115 () Bool)

(assert (=> b!1302217 (= c!125060 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582115))))

(declare-fun e!742885 () Unit!43020)

(declare-fun e!742887 () Unit!43020)

(assert (=> b!1302217 (= e!742885 e!742887)))

(declare-fun mapNonEmpty!53840 () Bool)

(declare-fun tp!102742 () Bool)

(assert (=> mapNonEmpty!53840 (= mapRes!53840 (and tp!102742 e!742882))))

(declare-fun mapKey!53840 () (_ BitVec 32))

(declare-fun mapRest!53840 () (Array (_ BitVec 32) ValueCell!16523))

(declare-fun mapValue!53840 () ValueCell!16523)

(assert (=> mapNonEmpty!53840 (= (arr!41860 _values!1445) (store mapRest!53840 mapKey!53840 mapValue!53840))))

(declare-fun b!1302219 () Bool)

(declare-fun res!864936 () Bool)

(assert (=> b!1302219 (=> (not res!864936) (not e!742883))))

(declare-fun getCurrentListMap!5155 (array!86735 array!86737 (_ BitVec 32) (_ BitVec 32) V!51561 V!51561 (_ BitVec 32) Int) ListLongMap!20249)

(assert (=> b!1302219 (= res!864936 (contains!8278 (getCurrentListMap!5155 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302220 () Bool)

(declare-fun res!864939 () Bool)

(assert (=> b!1302220 (=> (not res!864939) (not e!742883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86735 (_ BitVec 32)) Bool)

(assert (=> b!1302220 (= res!864939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302221 () Bool)

(assert (=> b!1302221 (= e!742880 tp_is_empty!34843)))

(declare-fun bm!63845 () Bool)

(declare-fun call!63850 () ListLongMap!20249)

(assert (=> bm!63845 (= call!63850 call!63847)))

(declare-fun b!1302222 () Bool)

(declare-fun res!864937 () Bool)

(assert (=> b!1302222 (=> (not res!864937) (not e!742883))))

(assert (=> b!1302222 (= res!864937 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42410 _keys!1741))))))

(declare-fun b!1302223 () Bool)

(assert (=> b!1302223 (= e!742883 (not (or (= k0!1205 (select (arr!41859 _keys!1741) from!2144)) (bvslt from!2144 (size!42411 _values!1445)))))))

(assert (=> b!1302223 (not (contains!8278 (ListLongMap!20250 Nil!29736) k0!1205))))

(declare-fun lt!582114 () Unit!43020)

(declare-fun emptyContainsNothing!201 ((_ BitVec 64)) Unit!43020)

(assert (=> b!1302223 (= lt!582114 (emptyContainsNothing!201 k0!1205))))

(declare-fun lt!582111 () Unit!43020)

(assert (=> b!1302223 (= lt!582111 e!742884)))

(assert (=> b!1302223 (= c!125061 (and (not lt!582115) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1302223 (= lt!582115 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1302224 () Bool)

(declare-fun res!864932 () Bool)

(assert (=> b!1302224 (=> (not res!864932) (not e!742883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302224 (= res!864932 (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun b!1302225 () Bool)

(declare-fun Unit!43022 () Unit!43020)

(assert (=> b!1302225 (= e!742887 Unit!43022)))

(declare-fun b!1302226 () Bool)

(declare-fun res!864938 () Bool)

(assert (=> b!1302226 (=> (not res!864938) (not e!742883))))

(assert (=> b!1302226 (= res!864938 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42410 _keys!1741))))))

(declare-fun b!1302227 () Bool)

(declare-fun lt!582110 () Unit!43020)

(assert (=> b!1302227 (= e!742887 lt!582110)))

(assert (=> b!1302227 (= lt!582112 call!63850)))

(declare-fun call!63851 () Unit!43020)

(assert (=> b!1302227 (= lt!582110 call!63851)))

(declare-fun call!63848 () Bool)

(assert (=> b!1302227 call!63848))

(declare-fun bm!63846 () Bool)

(assert (=> bm!63846 (= call!63849 (lemmaInListMapAfterAddingDiffThenInBefore!82 k0!1205 (ite (or c!125061 c!125059) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125061 c!125059) zeroValue!1387 minValue!1387) (ite c!125061 lt!582109 (ite c!125059 lt!582107 lt!582112))))))

(declare-fun bm!63847 () Bool)

(assert (=> bm!63847 (= call!63848 call!63846)))

(declare-fun b!1302228 () Bool)

(declare-fun res!864933 () Bool)

(assert (=> b!1302228 (=> (not res!864933) (not e!742883))))

(assert (=> b!1302228 (= res!864933 (and (= (size!42411 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42410 _keys!1741) (size!42411 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302229 () Bool)

(assert (=> b!1302229 (= e!742884 e!742885)))

(assert (=> b!1302229 (= c!125059 (and (not lt!582115) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63848 () Bool)

(assert (=> bm!63848 (= call!63851 call!63849)))

(declare-fun res!864934 () Bool)

(assert (=> start!110034 (=> (not res!864934) (not e!742883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110034 (= res!864934 (validMask!0 mask!2175))))

(assert (=> start!110034 e!742883))

(assert (=> start!110034 tp_is_empty!34843))

(assert (=> start!110034 true))

(declare-fun array_inv!31911 (array!86737) Bool)

(assert (=> start!110034 (and (array_inv!31911 _values!1445) e!742881)))

(declare-fun array_inv!31912 (array!86735) Bool)

(assert (=> start!110034 (array_inv!31912 _keys!1741)))

(assert (=> start!110034 tp!102743))

(declare-fun b!1302218 () Bool)

(assert (=> b!1302218 call!63848))

(declare-fun lt!582108 () Unit!43020)

(assert (=> b!1302218 (= lt!582108 call!63851)))

(assert (=> b!1302218 (= lt!582107 call!63850)))

(assert (=> b!1302218 (= e!742885 lt!582108)))

(assert (= (and start!110034 res!864934) b!1302228))

(assert (= (and b!1302228 res!864933) b!1302220))

(assert (= (and b!1302220 res!864939) b!1302213))

(assert (= (and b!1302213 res!864935) b!1302226))

(assert (= (and b!1302226 res!864938) b!1302219))

(assert (= (and b!1302219 res!864936) b!1302222))

(assert (= (and b!1302222 res!864937) b!1302224))

(assert (= (and b!1302224 res!864932) b!1302223))

(assert (= (and b!1302223 c!125061) b!1302214))

(assert (= (and b!1302223 (not c!125061)) b!1302229))

(assert (= (and b!1302229 c!125059) b!1302218))

(assert (= (and b!1302229 (not c!125059)) b!1302217))

(assert (= (and b!1302217 c!125060) b!1302227))

(assert (= (and b!1302217 (not c!125060)) b!1302225))

(assert (= (or b!1302218 b!1302227) bm!63845))

(assert (= (or b!1302218 b!1302227) bm!63848))

(assert (= (or b!1302218 b!1302227) bm!63847))

(assert (= (or b!1302214 bm!63845) bm!63843))

(assert (= (or b!1302214 bm!63848) bm!63846))

(assert (= (or b!1302214 bm!63847) bm!63844))

(assert (= (and b!1302216 condMapEmpty!53840) mapIsEmpty!53840))

(assert (= (and b!1302216 (not condMapEmpty!53840)) mapNonEmpty!53840))

(get-info :version)

(assert (= (and mapNonEmpty!53840 ((_ is ValueCellFull!16523) mapValue!53840)) b!1302215))

(assert (= (and b!1302216 ((_ is ValueCellFull!16523) mapDefault!53840)) b!1302221))

(assert (= start!110034 b!1302216))

(declare-fun m!1193315 () Bool)

(assert (=> b!1302224 m!1193315))

(assert (=> b!1302224 m!1193315))

(declare-fun m!1193317 () Bool)

(assert (=> b!1302224 m!1193317))

(declare-fun m!1193319 () Bool)

(assert (=> bm!63844 m!1193319))

(declare-fun m!1193321 () Bool)

(assert (=> b!1302213 m!1193321))

(declare-fun m!1193323 () Bool)

(assert (=> b!1302219 m!1193323))

(assert (=> b!1302219 m!1193323))

(declare-fun m!1193325 () Bool)

(assert (=> b!1302219 m!1193325))

(declare-fun m!1193327 () Bool)

(assert (=> start!110034 m!1193327))

(declare-fun m!1193329 () Bool)

(assert (=> start!110034 m!1193329))

(declare-fun m!1193331 () Bool)

(assert (=> start!110034 m!1193331))

(declare-fun m!1193333 () Bool)

(assert (=> mapNonEmpty!53840 m!1193333))

(declare-fun m!1193335 () Bool)

(assert (=> bm!63843 m!1193335))

(declare-fun m!1193337 () Bool)

(assert (=> b!1302214 m!1193337))

(declare-fun m!1193339 () Bool)

(assert (=> b!1302214 m!1193339))

(declare-fun m!1193341 () Bool)

(assert (=> b!1302214 m!1193341))

(declare-fun m!1193343 () Bool)

(assert (=> bm!63846 m!1193343))

(assert (=> b!1302223 m!1193315))

(declare-fun m!1193345 () Bool)

(assert (=> b!1302223 m!1193345))

(declare-fun m!1193347 () Bool)

(assert (=> b!1302223 m!1193347))

(declare-fun m!1193349 () Bool)

(assert (=> b!1302220 m!1193349))

(check-sat (not b!1302214) (not start!110034) b_and!47319 (not bm!63843) (not bm!63846) (not b!1302224) (not b!1302220) (not b!1302223) tp_is_empty!34843 (not b!1302219) (not b!1302213) (not mapNonEmpty!53840) (not b_next!29203) (not bm!63844))
(check-sat b_and!47319 (not b_next!29203))
