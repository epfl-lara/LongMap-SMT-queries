; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110336 () Bool)

(assert start!110336)

(declare-fun b_free!29319 () Bool)

(declare-fun b_next!29319 () Bool)

(assert (=> start!110336 (= b_free!29319 (not b_next!29319))))

(declare-fun tp!103126 () Bool)

(declare-fun b_and!47525 () Bool)

(assert (=> start!110336 (= tp!103126 b_and!47525)))

(declare-fun b!1305927 () Bool)

(declare-fun res!867073 () Bool)

(declare-fun e!744915 () Bool)

(assert (=> b!1305927 (=> (not res!867073) (not e!744915))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86934 0))(
  ( (array!86935 (arr!41953 (Array (_ BitVec 32) (_ BitVec 64))) (size!42503 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86934)

(assert (=> b!1305927 (= res!867073 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42503 _keys!1741))))))

(declare-fun mapNonEmpty!54049 () Bool)

(declare-fun mapRes!54049 () Bool)

(declare-fun tp!103125 () Bool)

(declare-fun e!744911 () Bool)

(assert (=> mapNonEmpty!54049 (= mapRes!54049 (and tp!103125 e!744911))))

(declare-datatypes ((V!51715 0))(
  ( (V!51716 (val!17554 Int)) )
))
(declare-datatypes ((ValueCell!16581 0))(
  ( (ValueCellFull!16581 (v!20179 V!51715)) (EmptyCell!16581) )
))
(declare-fun mapRest!54049 () (Array (_ BitVec 32) ValueCell!16581))

(declare-fun mapKey!54049 () (_ BitVec 32))

(declare-datatypes ((array!86936 0))(
  ( (array!86937 (arr!41954 (Array (_ BitVec 32) ValueCell!16581)) (size!42504 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86936)

(declare-fun mapValue!54049 () ValueCell!16581)

(assert (=> mapNonEmpty!54049 (= (arr!41954 _values!1445) (store mapRest!54049 mapKey!54049 mapValue!54049))))

(declare-fun b!1305929 () Bool)

(declare-fun tp_is_empty!34959 () Bool)

(assert (=> b!1305929 (= e!744911 tp_is_empty!34959)))

(declare-fun b!1305930 () Bool)

(declare-fun res!867071 () Bool)

(assert (=> b!1305930 (=> (not res!867071) (not e!744915))))

(declare-fun minValue!1387 () V!51715)

(declare-fun zeroValue!1387 () V!51715)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22664 0))(
  ( (tuple2!22665 (_1!11343 (_ BitVec 64)) (_2!11343 V!51715)) )
))
(declare-datatypes ((List!29783 0))(
  ( (Nil!29780) (Cons!29779 (h!30988 tuple2!22664) (t!43387 List!29783)) )
))
(declare-datatypes ((ListLongMap!20321 0))(
  ( (ListLongMap!20322 (toList!10176 List!29783)) )
))
(declare-fun contains!8321 (ListLongMap!20321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5189 (array!86934 array!86936 (_ BitVec 32) (_ BitVec 32) V!51715 V!51715 (_ BitVec 32) Int) ListLongMap!20321)

(assert (=> b!1305930 (= res!867071 (contains!8321 (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305931 () Bool)

(declare-fun e!744913 () Bool)

(assert (=> b!1305931 (= e!744913 tp_is_empty!34959)))

(declare-fun mapIsEmpty!54049 () Bool)

(assert (=> mapIsEmpty!54049 mapRes!54049))

(declare-fun b!1305932 () Bool)

(declare-fun res!867070 () Bool)

(assert (=> b!1305932 (=> (not res!867070) (not e!744915))))

(declare-datatypes ((List!29784 0))(
  ( (Nil!29781) (Cons!29780 (h!30989 (_ BitVec 64)) (t!43388 List!29784)) )
))
(declare-fun arrayNoDuplicates!0 (array!86934 (_ BitVec 32) List!29784) Bool)

(assert (=> b!1305932 (= res!867070 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29781))))

(declare-fun b!1305933 () Bool)

(declare-fun res!867069 () Bool)

(assert (=> b!1305933 (=> (not res!867069) (not e!744915))))

(assert (=> b!1305933 (= res!867069 (and (= (size!42504 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42503 _keys!1741) (size!42504 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305934 () Bool)

(assert (=> b!1305934 (= e!744915 (and (or (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1305935 () Bool)

(declare-fun e!744914 () Bool)

(assert (=> b!1305935 (= e!744914 (and e!744913 mapRes!54049))))

(declare-fun condMapEmpty!54049 () Bool)

(declare-fun mapDefault!54049 () ValueCell!16581)

(assert (=> b!1305935 (= condMapEmpty!54049 (= (arr!41954 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16581)) mapDefault!54049)))))

(declare-fun b!1305928 () Bool)

(declare-fun res!867072 () Bool)

(assert (=> b!1305928 (=> (not res!867072) (not e!744915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86934 (_ BitVec 32)) Bool)

(assert (=> b!1305928 (= res!867072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!867068 () Bool)

(assert (=> start!110336 (=> (not res!867068) (not e!744915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110336 (= res!867068 (validMask!0 mask!2175))))

(assert (=> start!110336 e!744915))

(assert (=> start!110336 tp_is_empty!34959))

(assert (=> start!110336 true))

(declare-fun array_inv!31721 (array!86936) Bool)

(assert (=> start!110336 (and (array_inv!31721 _values!1445) e!744914)))

(declare-fun array_inv!31722 (array!86934) Bool)

(assert (=> start!110336 (array_inv!31722 _keys!1741)))

(assert (=> start!110336 tp!103126))

(assert (= (and start!110336 res!867068) b!1305933))

(assert (= (and b!1305933 res!867069) b!1305928))

(assert (= (and b!1305928 res!867072) b!1305932))

(assert (= (and b!1305932 res!867070) b!1305927))

(assert (= (and b!1305927 res!867073) b!1305930))

(assert (= (and b!1305930 res!867071) b!1305934))

(assert (= (and b!1305935 condMapEmpty!54049) mapIsEmpty!54049))

(assert (= (and b!1305935 (not condMapEmpty!54049)) mapNonEmpty!54049))

(get-info :version)

(assert (= (and mapNonEmpty!54049 ((_ is ValueCellFull!16581) mapValue!54049)) b!1305929))

(assert (= (and b!1305935 ((_ is ValueCellFull!16581) mapDefault!54049)) b!1305931))

(assert (= start!110336 b!1305935))

(declare-fun m!1197141 () Bool)

(assert (=> b!1305928 m!1197141))

(declare-fun m!1197143 () Bool)

(assert (=> b!1305930 m!1197143))

(assert (=> b!1305930 m!1197143))

(declare-fun m!1197145 () Bool)

(assert (=> b!1305930 m!1197145))

(declare-fun m!1197147 () Bool)

(assert (=> start!110336 m!1197147))

(declare-fun m!1197149 () Bool)

(assert (=> start!110336 m!1197149))

(declare-fun m!1197151 () Bool)

(assert (=> start!110336 m!1197151))

(declare-fun m!1197153 () Bool)

(assert (=> mapNonEmpty!54049 m!1197153))

(declare-fun m!1197155 () Bool)

(assert (=> b!1305932 m!1197155))

(check-sat (not mapNonEmpty!54049) (not b_next!29319) (not b!1305928) (not b!1305930) (not start!110336) b_and!47525 tp_is_empty!34959 (not b!1305932))
(check-sat b_and!47525 (not b_next!29319))
(get-model)

(declare-fun d!142197 () Bool)

(assert (=> d!142197 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110336 d!142197))

(declare-fun d!142199 () Bool)

(assert (=> d!142199 (= (array_inv!31721 _values!1445) (bvsge (size!42504 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110336 d!142199))

(declare-fun d!142201 () Bool)

(assert (=> d!142201 (= (array_inv!31722 _keys!1741) (bvsge (size!42503 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110336 d!142201))

(declare-fun d!142203 () Bool)

(declare-fun e!744936 () Bool)

(assert (=> d!142203 e!744936))

(declare-fun res!867094 () Bool)

(assert (=> d!142203 (=> res!867094 e!744936)))

(declare-fun lt!584812 () Bool)

(assert (=> d!142203 (= res!867094 (not lt!584812))))

(declare-fun lt!584813 () Bool)

(assert (=> d!142203 (= lt!584812 lt!584813)))

(declare-datatypes ((Unit!43262 0))(
  ( (Unit!43263) )
))
(declare-fun lt!584810 () Unit!43262)

(declare-fun e!744935 () Unit!43262)

(assert (=> d!142203 (= lt!584810 e!744935)))

(declare-fun c!125511 () Bool)

(assert (=> d!142203 (= c!125511 lt!584813)))

(declare-fun containsKey!732 (List!29783 (_ BitVec 64)) Bool)

(assert (=> d!142203 (= lt!584813 (containsKey!732 (toList!10176 (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142203 (= (contains!8321 (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584812)))

(declare-fun b!1305969 () Bool)

(declare-fun lt!584811 () Unit!43262)

(assert (=> b!1305969 (= e!744935 lt!584811)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!478 (List!29783 (_ BitVec 64)) Unit!43262)

(assert (=> b!1305969 (= lt!584811 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10176 (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!762 0))(
  ( (Some!761 (v!20181 V!51715)) (None!760) )
))
(declare-fun isDefined!517 (Option!762) Bool)

(declare-fun getValueByKey!710 (List!29783 (_ BitVec 64)) Option!762)

(assert (=> b!1305969 (isDefined!517 (getValueByKey!710 (toList!10176 (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305970 () Bool)

(declare-fun Unit!43264 () Unit!43262)

(assert (=> b!1305970 (= e!744935 Unit!43264)))

(declare-fun b!1305971 () Bool)

(assert (=> b!1305971 (= e!744936 (isDefined!517 (getValueByKey!710 (toList!10176 (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142203 c!125511) b!1305969))

(assert (= (and d!142203 (not c!125511)) b!1305970))

(assert (= (and d!142203 (not res!867094)) b!1305971))

(declare-fun m!1197173 () Bool)

(assert (=> d!142203 m!1197173))

(declare-fun m!1197175 () Bool)

(assert (=> b!1305969 m!1197175))

(declare-fun m!1197177 () Bool)

(assert (=> b!1305969 m!1197177))

(assert (=> b!1305969 m!1197177))

(declare-fun m!1197179 () Bool)

(assert (=> b!1305969 m!1197179))

(assert (=> b!1305971 m!1197177))

(assert (=> b!1305971 m!1197177))

(assert (=> b!1305971 m!1197179))

(assert (=> b!1305930 d!142203))

(declare-fun bm!64605 () Bool)

(declare-fun call!64614 () ListLongMap!20321)

(declare-fun call!64613 () ListLongMap!20321)

(assert (=> bm!64605 (= call!64614 call!64613)))

(declare-fun bm!64606 () Bool)

(declare-fun call!64610 () Bool)

(declare-fun lt!584877 () ListLongMap!20321)

(assert (=> bm!64606 (= call!64610 (contains!8321 lt!584877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306014 () Bool)

(declare-fun e!744971 () Unit!43262)

(declare-fun lt!584872 () Unit!43262)

(assert (=> b!1306014 (= e!744971 lt!584872)))

(declare-fun lt!584868 () ListLongMap!20321)

(declare-fun getCurrentListMapNoExtraKeys!6130 (array!86934 array!86936 (_ BitVec 32) (_ BitVec 32) V!51715 V!51715 (_ BitVec 32) Int) ListLongMap!20321)

(assert (=> b!1306014 (= lt!584868 (getCurrentListMapNoExtraKeys!6130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584867 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584867 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584874 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584874 (select (arr!41953 _keys!1741) from!2144))))

(declare-fun lt!584866 () Unit!43262)

(declare-fun addStillContains!1115 (ListLongMap!20321 (_ BitVec 64) V!51715 (_ BitVec 64)) Unit!43262)

(assert (=> b!1306014 (= lt!584866 (addStillContains!1115 lt!584868 lt!584867 zeroValue!1387 lt!584874))))

(declare-fun +!4495 (ListLongMap!20321 tuple2!22664) ListLongMap!20321)

(assert (=> b!1306014 (contains!8321 (+!4495 lt!584868 (tuple2!22665 lt!584867 zeroValue!1387)) lt!584874)))

(declare-fun lt!584876 () Unit!43262)

(assert (=> b!1306014 (= lt!584876 lt!584866)))

(declare-fun lt!584862 () ListLongMap!20321)

(assert (=> b!1306014 (= lt!584862 (getCurrentListMapNoExtraKeys!6130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584875 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584865 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584865 (select (arr!41953 _keys!1741) from!2144))))

(declare-fun lt!584879 () Unit!43262)

(declare-fun addApplyDifferent!569 (ListLongMap!20321 (_ BitVec 64) V!51715 (_ BitVec 64)) Unit!43262)

(assert (=> b!1306014 (= lt!584879 (addApplyDifferent!569 lt!584862 lt!584875 minValue!1387 lt!584865))))

(declare-fun apply!1027 (ListLongMap!20321 (_ BitVec 64)) V!51715)

(assert (=> b!1306014 (= (apply!1027 (+!4495 lt!584862 (tuple2!22665 lt!584875 minValue!1387)) lt!584865) (apply!1027 lt!584862 lt!584865))))

(declare-fun lt!584858 () Unit!43262)

(assert (=> b!1306014 (= lt!584858 lt!584879)))

(declare-fun lt!584871 () ListLongMap!20321)

(assert (=> b!1306014 (= lt!584871 (getCurrentListMapNoExtraKeys!6130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584863 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584861 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584861 (select (arr!41953 _keys!1741) from!2144))))

(declare-fun lt!584864 () Unit!43262)

(assert (=> b!1306014 (= lt!584864 (addApplyDifferent!569 lt!584871 lt!584863 zeroValue!1387 lt!584861))))

(assert (=> b!1306014 (= (apply!1027 (+!4495 lt!584871 (tuple2!22665 lt!584863 zeroValue!1387)) lt!584861) (apply!1027 lt!584871 lt!584861))))

(declare-fun lt!584870 () Unit!43262)

(assert (=> b!1306014 (= lt!584870 lt!584864)))

(declare-fun lt!584873 () ListLongMap!20321)

(assert (=> b!1306014 (= lt!584873 (getCurrentListMapNoExtraKeys!6130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584860 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584860 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584878 () (_ BitVec 64))

(assert (=> b!1306014 (= lt!584878 (select (arr!41953 _keys!1741) from!2144))))

(assert (=> b!1306014 (= lt!584872 (addApplyDifferent!569 lt!584873 lt!584860 minValue!1387 lt!584878))))

(assert (=> b!1306014 (= (apply!1027 (+!4495 lt!584873 (tuple2!22665 lt!584860 minValue!1387)) lt!584878) (apply!1027 lt!584873 lt!584878))))

(declare-fun bm!64607 () Bool)

(declare-fun call!64611 () Bool)

(assert (=> bm!64607 (= call!64611 (contains!8321 lt!584877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306015 () Bool)

(declare-fun Unit!43265 () Unit!43262)

(assert (=> b!1306015 (= e!744971 Unit!43265)))

(declare-fun b!1306016 () Bool)

(declare-fun res!867113 () Bool)

(declare-fun e!744968 () Bool)

(assert (=> b!1306016 (=> (not res!867113) (not e!744968))))

(declare-fun e!744966 () Bool)

(assert (=> b!1306016 (= res!867113 e!744966)))

(declare-fun c!125525 () Bool)

(assert (=> b!1306016 (= c!125525 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!64612 () ListLongMap!20321)

(declare-fun call!64609 () ListLongMap!20321)

(declare-fun c!125524 () Bool)

(declare-fun call!64608 () ListLongMap!20321)

(declare-fun bm!64608 () Bool)

(declare-fun c!125526 () Bool)

(assert (=> bm!64608 (= call!64613 (+!4495 (ite c!125524 call!64612 (ite c!125526 call!64609 call!64608)) (ite (or c!125524 c!125526) (tuple2!22665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1306017 () Bool)

(declare-fun e!744975 () Bool)

(assert (=> b!1306017 (= e!744968 e!744975)))

(declare-fun c!125528 () Bool)

(assert (=> b!1306017 (= c!125528 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64609 () Bool)

(assert (=> bm!64609 (= call!64608 call!64609)))

(declare-fun b!1306018 () Bool)

(declare-fun e!744967 () Bool)

(assert (=> b!1306018 (= e!744966 e!744967)))

(declare-fun res!867116 () Bool)

(assert (=> b!1306018 (= res!867116 call!64611)))

(assert (=> b!1306018 (=> (not res!867116) (not e!744967))))

(declare-fun b!1306019 () Bool)

(assert (=> b!1306019 (= e!744966 (not call!64611))))

(declare-fun b!1306020 () Bool)

(declare-fun c!125529 () Bool)

(assert (=> b!1306020 (= c!125529 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!744963 () ListLongMap!20321)

(declare-fun e!744970 () ListLongMap!20321)

(assert (=> b!1306020 (= e!744963 e!744970)))

(declare-fun bm!64610 () Bool)

(assert (=> bm!64610 (= call!64609 call!64612)))

(declare-fun e!744964 () Bool)

(declare-fun b!1306021 () Bool)

(declare-fun get!21196 (ValueCell!16581 V!51715) V!51715)

(declare-fun dynLambda!3434 (Int (_ BitVec 64)) V!51715)

(assert (=> b!1306021 (= e!744964 (= (apply!1027 lt!584877 (select (arr!41953 _keys!1741) from!2144)) (get!21196 (select (arr!41954 _values!1445) from!2144) (dynLambda!3434 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1306021 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42504 _values!1445)))))

(assert (=> b!1306021 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42503 _keys!1741)))))

(declare-fun b!1306022 () Bool)

(declare-fun e!744972 () ListLongMap!20321)

(assert (=> b!1306022 (= e!744972 (+!4495 call!64613 (tuple2!22665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1306023 () Bool)

(declare-fun res!867121 () Bool)

(assert (=> b!1306023 (=> (not res!867121) (not e!744968))))

(declare-fun e!744965 () Bool)

(assert (=> b!1306023 (= res!867121 e!744965)))

(declare-fun res!867115 () Bool)

(assert (=> b!1306023 (=> res!867115 e!744965)))

(declare-fun e!744969 () Bool)

(assert (=> b!1306023 (= res!867115 (not e!744969))))

(declare-fun res!867114 () Bool)

(assert (=> b!1306023 (=> (not res!867114) (not e!744969))))

(assert (=> b!1306023 (= res!867114 (bvslt from!2144 (size!42503 _keys!1741)))))

(declare-fun b!1306024 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306024 (= e!744969 (validKeyInArray!0 (select (arr!41953 _keys!1741) from!2144)))))

(declare-fun b!1306025 () Bool)

(assert (=> b!1306025 (= e!744970 call!64614)))

(declare-fun b!1306026 () Bool)

(assert (=> b!1306026 (= e!744963 call!64614)))

(declare-fun b!1306027 () Bool)

(declare-fun e!744973 () Bool)

(assert (=> b!1306027 (= e!744975 e!744973)))

(declare-fun res!867119 () Bool)

(assert (=> b!1306027 (= res!867119 call!64610)))

(assert (=> b!1306027 (=> (not res!867119) (not e!744973))))

(declare-fun b!1306028 () Bool)

(assert (=> b!1306028 (= e!744965 e!744964)))

(declare-fun res!867120 () Bool)

(assert (=> b!1306028 (=> (not res!867120) (not e!744964))))

(assert (=> b!1306028 (= res!867120 (contains!8321 lt!584877 (select (arr!41953 _keys!1741) from!2144)))))

(assert (=> b!1306028 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42503 _keys!1741)))))

(declare-fun b!1306029 () Bool)

(assert (=> b!1306029 (= e!744970 call!64608)))

(declare-fun b!1306030 () Bool)

(assert (=> b!1306030 (= e!744973 (= (apply!1027 lt!584877 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1306031 () Bool)

(assert (=> b!1306031 (= e!744967 (= (apply!1027 lt!584877 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1306032 () Bool)

(assert (=> b!1306032 (= e!744972 e!744963)))

(assert (=> b!1306032 (= c!125526 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!142205 () Bool)

(assert (=> d!142205 e!744968))

(declare-fun res!867117 () Bool)

(assert (=> d!142205 (=> (not res!867117) (not e!744968))))

(assert (=> d!142205 (= res!867117 (or (bvsge from!2144 (size!42503 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42503 _keys!1741)))))))

(declare-fun lt!584869 () ListLongMap!20321)

(assert (=> d!142205 (= lt!584877 lt!584869)))

(declare-fun lt!584859 () Unit!43262)

(assert (=> d!142205 (= lt!584859 e!744971)))

(declare-fun c!125527 () Bool)

(declare-fun e!744974 () Bool)

(assert (=> d!142205 (= c!125527 e!744974)))

(declare-fun res!867118 () Bool)

(assert (=> d!142205 (=> (not res!867118) (not e!744974))))

(assert (=> d!142205 (= res!867118 (bvslt from!2144 (size!42503 _keys!1741)))))

(assert (=> d!142205 (= lt!584869 e!744972)))

(assert (=> d!142205 (= c!125524 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142205 (validMask!0 mask!2175)))

(assert (=> d!142205 (= (getCurrentListMap!5189 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584877)))

(declare-fun b!1306033 () Bool)

(assert (=> b!1306033 (= e!744975 (not call!64610))))

(declare-fun bm!64611 () Bool)

(assert (=> bm!64611 (= call!64612 (getCurrentListMapNoExtraKeys!6130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1306034 () Bool)

(assert (=> b!1306034 (= e!744974 (validKeyInArray!0 (select (arr!41953 _keys!1741) from!2144)))))

(assert (= (and d!142205 c!125524) b!1306022))

(assert (= (and d!142205 (not c!125524)) b!1306032))

(assert (= (and b!1306032 c!125526) b!1306026))

(assert (= (and b!1306032 (not c!125526)) b!1306020))

(assert (= (and b!1306020 c!125529) b!1306025))

(assert (= (and b!1306020 (not c!125529)) b!1306029))

(assert (= (or b!1306025 b!1306029) bm!64609))

(assert (= (or b!1306026 bm!64609) bm!64610))

(assert (= (or b!1306026 b!1306025) bm!64605))

(assert (= (or b!1306022 bm!64610) bm!64611))

(assert (= (or b!1306022 bm!64605) bm!64608))

(assert (= (and d!142205 res!867118) b!1306034))

(assert (= (and d!142205 c!125527) b!1306014))

(assert (= (and d!142205 (not c!125527)) b!1306015))

(assert (= (and d!142205 res!867117) b!1306023))

(assert (= (and b!1306023 res!867114) b!1306024))

(assert (= (and b!1306023 (not res!867115)) b!1306028))

(assert (= (and b!1306028 res!867120) b!1306021))

(assert (= (and b!1306023 res!867121) b!1306016))

(assert (= (and b!1306016 c!125525) b!1306018))

(assert (= (and b!1306016 (not c!125525)) b!1306019))

(assert (= (and b!1306018 res!867116) b!1306031))

(assert (= (or b!1306018 b!1306019) bm!64607))

(assert (= (and b!1306016 res!867113) b!1306017))

(assert (= (and b!1306017 c!125528) b!1306027))

(assert (= (and b!1306017 (not c!125528)) b!1306033))

(assert (= (and b!1306027 res!867119) b!1306030))

(assert (= (or b!1306027 b!1306033) bm!64606))

(declare-fun b_lambda!23359 () Bool)

(assert (=> (not b_lambda!23359) (not b!1306021)))

(declare-fun t!43391 () Bool)

(declare-fun tb!11409 () Bool)

(assert (=> (and start!110336 (= defaultEntry!1448 defaultEntry!1448) t!43391) tb!11409))

(declare-fun result!23849 () Bool)

(assert (=> tb!11409 (= result!23849 tp_is_empty!34959)))

(assert (=> b!1306021 t!43391))

(declare-fun b_and!47529 () Bool)

(assert (= b_and!47525 (and (=> t!43391 result!23849) b_and!47529)))

(declare-fun m!1197181 () Bool)

(assert (=> b!1306028 m!1197181))

(assert (=> b!1306028 m!1197181))

(declare-fun m!1197183 () Bool)

(assert (=> b!1306028 m!1197183))

(assert (=> d!142205 m!1197147))

(declare-fun m!1197185 () Bool)

(assert (=> bm!64607 m!1197185))

(declare-fun m!1197187 () Bool)

(assert (=> b!1306031 m!1197187))

(declare-fun m!1197189 () Bool)

(assert (=> b!1306030 m!1197189))

(declare-fun m!1197191 () Bool)

(assert (=> bm!64611 m!1197191))

(declare-fun m!1197193 () Bool)

(assert (=> b!1306022 m!1197193))

(declare-fun m!1197195 () Bool)

(assert (=> bm!64608 m!1197195))

(assert (=> b!1306034 m!1197181))

(assert (=> b!1306034 m!1197181))

(declare-fun m!1197197 () Bool)

(assert (=> b!1306034 m!1197197))

(assert (=> b!1306021 m!1197181))

(declare-fun m!1197199 () Bool)

(assert (=> b!1306021 m!1197199))

(declare-fun m!1197201 () Bool)

(assert (=> b!1306021 m!1197201))

(declare-fun m!1197203 () Bool)

(assert (=> b!1306021 m!1197203))

(assert (=> b!1306021 m!1197201))

(declare-fun m!1197205 () Bool)

(assert (=> b!1306021 m!1197205))

(assert (=> b!1306021 m!1197181))

(assert (=> b!1306021 m!1197203))

(declare-fun m!1197207 () Bool)

(assert (=> bm!64606 m!1197207))

(assert (=> b!1306024 m!1197181))

(assert (=> b!1306024 m!1197181))

(assert (=> b!1306024 m!1197197))

(declare-fun m!1197209 () Bool)

(assert (=> b!1306014 m!1197209))

(declare-fun m!1197211 () Bool)

(assert (=> b!1306014 m!1197211))

(declare-fun m!1197213 () Bool)

(assert (=> b!1306014 m!1197213))

(declare-fun m!1197215 () Bool)

(assert (=> b!1306014 m!1197215))

(assert (=> b!1306014 m!1197191))

(declare-fun m!1197217 () Bool)

(assert (=> b!1306014 m!1197217))

(declare-fun m!1197219 () Bool)

(assert (=> b!1306014 m!1197219))

(declare-fun m!1197221 () Bool)

(assert (=> b!1306014 m!1197221))

(assert (=> b!1306014 m!1197181))

(declare-fun m!1197223 () Bool)

(assert (=> b!1306014 m!1197223))

(declare-fun m!1197225 () Bool)

(assert (=> b!1306014 m!1197225))

(assert (=> b!1306014 m!1197213))

(declare-fun m!1197227 () Bool)

(assert (=> b!1306014 m!1197227))

(assert (=> b!1306014 m!1197223))

(assert (=> b!1306014 m!1197219))

(declare-fun m!1197229 () Bool)

(assert (=> b!1306014 m!1197229))

(declare-fun m!1197231 () Bool)

(assert (=> b!1306014 m!1197231))

(declare-fun m!1197233 () Bool)

(assert (=> b!1306014 m!1197233))

(declare-fun m!1197235 () Bool)

(assert (=> b!1306014 m!1197235))

(assert (=> b!1306014 m!1197235))

(declare-fun m!1197237 () Bool)

(assert (=> b!1306014 m!1197237))

(assert (=> b!1305930 d!142205))

(declare-fun bm!64614 () Bool)

(declare-fun call!64617 () Bool)

(assert (=> bm!64614 (= call!64617 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1306045 () Bool)

(declare-fun e!744984 () Bool)

(declare-fun e!744983 () Bool)

(assert (=> b!1306045 (= e!744984 e!744983)))

(declare-fun lt!584887 () (_ BitVec 64))

(assert (=> b!1306045 (= lt!584887 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584888 () Unit!43262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86934 (_ BitVec 64) (_ BitVec 32)) Unit!43262)

(assert (=> b!1306045 (= lt!584888 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584887 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306045 (arrayContainsKey!0 _keys!1741 lt!584887 #b00000000000000000000000000000000)))

(declare-fun lt!584886 () Unit!43262)

(assert (=> b!1306045 (= lt!584886 lt!584888)))

(declare-fun res!867127 () Bool)

(declare-datatypes ((SeekEntryResult!10030 0))(
  ( (MissingZero!10030 (index!42491 (_ BitVec 32))) (Found!10030 (index!42492 (_ BitVec 32))) (Intermediate!10030 (undefined!10842 Bool) (index!42493 (_ BitVec 32)) (x!115968 (_ BitVec 32))) (Undefined!10030) (MissingVacant!10030 (index!42494 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86934 (_ BitVec 32)) SeekEntryResult!10030)

(assert (=> b!1306045 (= res!867127 (= (seekEntryOrOpen!0 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10030 #b00000000000000000000000000000000)))))

(assert (=> b!1306045 (=> (not res!867127) (not e!744983))))

(declare-fun b!1306046 () Bool)

(declare-fun e!744982 () Bool)

(assert (=> b!1306046 (= e!744982 e!744984)))

(declare-fun c!125532 () Bool)

(assert (=> b!1306046 (= c!125532 (validKeyInArray!0 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306047 () Bool)

(assert (=> b!1306047 (= e!744983 call!64617)))

(declare-fun b!1306048 () Bool)

(assert (=> b!1306048 (= e!744984 call!64617)))

(declare-fun d!142207 () Bool)

(declare-fun res!867126 () Bool)

(assert (=> d!142207 (=> res!867126 e!744982)))

(assert (=> d!142207 (= res!867126 (bvsge #b00000000000000000000000000000000 (size!42503 _keys!1741)))))

(assert (=> d!142207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744982)))

(assert (= (and d!142207 (not res!867126)) b!1306046))

(assert (= (and b!1306046 c!125532) b!1306045))

(assert (= (and b!1306046 (not c!125532)) b!1306048))

(assert (= (and b!1306045 res!867127) b!1306047))

(assert (= (or b!1306047 b!1306048) bm!64614))

(declare-fun m!1197239 () Bool)

(assert (=> bm!64614 m!1197239))

(declare-fun m!1197241 () Bool)

(assert (=> b!1306045 m!1197241))

(declare-fun m!1197243 () Bool)

(assert (=> b!1306045 m!1197243))

(declare-fun m!1197245 () Bool)

(assert (=> b!1306045 m!1197245))

(assert (=> b!1306045 m!1197241))

(declare-fun m!1197247 () Bool)

(assert (=> b!1306045 m!1197247))

(assert (=> b!1306046 m!1197241))

(assert (=> b!1306046 m!1197241))

(declare-fun m!1197249 () Bool)

(assert (=> b!1306046 m!1197249))

(assert (=> b!1305928 d!142207))

(declare-fun b!1306059 () Bool)

(declare-fun e!744996 () Bool)

(declare-fun contains!8322 (List!29784 (_ BitVec 64)) Bool)

(assert (=> b!1306059 (= e!744996 (contains!8322 Nil!29781 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64617 () Bool)

(declare-fun call!64620 () Bool)

(declare-fun c!125535 () Bool)

(assert (=> bm!64617 (= call!64620 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125535 (Cons!29780 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000) Nil!29781) Nil!29781)))))

(declare-fun b!1306060 () Bool)

(declare-fun e!744995 () Bool)

(assert (=> b!1306060 (= e!744995 call!64620)))

(declare-fun b!1306061 () Bool)

(declare-fun e!744993 () Bool)

(assert (=> b!1306061 (= e!744993 e!744995)))

(assert (=> b!1306061 (= c!125535 (validKeyInArray!0 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142209 () Bool)

(declare-fun res!867134 () Bool)

(declare-fun e!744994 () Bool)

(assert (=> d!142209 (=> res!867134 e!744994)))

(assert (=> d!142209 (= res!867134 (bvsge #b00000000000000000000000000000000 (size!42503 _keys!1741)))))

(assert (=> d!142209 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29781) e!744994)))

(declare-fun b!1306062 () Bool)

(assert (=> b!1306062 (= e!744994 e!744993)))

(declare-fun res!867136 () Bool)

(assert (=> b!1306062 (=> (not res!867136) (not e!744993))))

(assert (=> b!1306062 (= res!867136 (not e!744996))))

(declare-fun res!867135 () Bool)

(assert (=> b!1306062 (=> (not res!867135) (not e!744996))))

(assert (=> b!1306062 (= res!867135 (validKeyInArray!0 (select (arr!41953 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306063 () Bool)

(assert (=> b!1306063 (= e!744995 call!64620)))

(assert (= (and d!142209 (not res!867134)) b!1306062))

(assert (= (and b!1306062 res!867135) b!1306059))

(assert (= (and b!1306062 res!867136) b!1306061))

(assert (= (and b!1306061 c!125535) b!1306060))

(assert (= (and b!1306061 (not c!125535)) b!1306063))

(assert (= (or b!1306060 b!1306063) bm!64617))

(assert (=> b!1306059 m!1197241))

(assert (=> b!1306059 m!1197241))

(declare-fun m!1197251 () Bool)

(assert (=> b!1306059 m!1197251))

(assert (=> bm!64617 m!1197241))

(declare-fun m!1197253 () Bool)

(assert (=> bm!64617 m!1197253))

(assert (=> b!1306061 m!1197241))

(assert (=> b!1306061 m!1197241))

(assert (=> b!1306061 m!1197249))

(assert (=> b!1306062 m!1197241))

(assert (=> b!1306062 m!1197241))

(assert (=> b!1306062 m!1197249))

(assert (=> b!1305932 d!142209))

(declare-fun mapIsEmpty!54055 () Bool)

(declare-fun mapRes!54055 () Bool)

(assert (=> mapIsEmpty!54055 mapRes!54055))

(declare-fun condMapEmpty!54055 () Bool)

(declare-fun mapDefault!54055 () ValueCell!16581)

(assert (=> mapNonEmpty!54049 (= condMapEmpty!54055 (= mapRest!54049 ((as const (Array (_ BitVec 32) ValueCell!16581)) mapDefault!54055)))))

(declare-fun e!745002 () Bool)

(assert (=> mapNonEmpty!54049 (= tp!103125 (and e!745002 mapRes!54055))))

(declare-fun b!1306071 () Bool)

(assert (=> b!1306071 (= e!745002 tp_is_empty!34959)))

(declare-fun mapNonEmpty!54055 () Bool)

(declare-fun tp!103135 () Bool)

(declare-fun e!745001 () Bool)

(assert (=> mapNonEmpty!54055 (= mapRes!54055 (and tp!103135 e!745001))))

(declare-fun mapValue!54055 () ValueCell!16581)

(declare-fun mapRest!54055 () (Array (_ BitVec 32) ValueCell!16581))

(declare-fun mapKey!54055 () (_ BitVec 32))

(assert (=> mapNonEmpty!54055 (= mapRest!54049 (store mapRest!54055 mapKey!54055 mapValue!54055))))

(declare-fun b!1306070 () Bool)

(assert (=> b!1306070 (= e!745001 tp_is_empty!34959)))

(assert (= (and mapNonEmpty!54049 condMapEmpty!54055) mapIsEmpty!54055))

(assert (= (and mapNonEmpty!54049 (not condMapEmpty!54055)) mapNonEmpty!54055))

(assert (= (and mapNonEmpty!54055 ((_ is ValueCellFull!16581) mapValue!54055)) b!1306070))

(assert (= (and mapNonEmpty!54049 ((_ is ValueCellFull!16581) mapDefault!54055)) b!1306071))

(declare-fun m!1197255 () Bool)

(assert (=> mapNonEmpty!54055 m!1197255))

(declare-fun b_lambda!23361 () Bool)

(assert (= b_lambda!23359 (or (and start!110336 b_free!29319) b_lambda!23361)))

(check-sat b_and!47529 (not b!1306062) (not bm!64617) (not b!1305971) (not b!1306034) (not b!1306022) (not b!1306014) (not bm!64608) (not b!1306046) (not b!1306028) (not bm!64611) (not b_next!29319) (not b!1306061) (not d!142205) (not mapNonEmpty!54055) (not b!1305969) (not b_lambda!23361) (not bm!64614) (not bm!64607) (not b!1306021) (not b!1306059) (not b!1306024) (not b!1306031) (not b!1306045) tp_is_empty!34959 (not bm!64606) (not d!142203) (not b!1306030))
(check-sat b_and!47529 (not b_next!29319))
