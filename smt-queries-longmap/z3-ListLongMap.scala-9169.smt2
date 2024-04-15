; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110164 () Bool)

(assert start!110164)

(declare-fun b_free!29287 () Bool)

(declare-fun b_next!29287 () Bool)

(assert (=> start!110164 (= b_free!29287 (not b_next!29287))))

(declare-fun tp!103020 () Bool)

(declare-fun b_and!47449 () Bool)

(assert (=> start!110164 (= tp!103020 b_and!47449)))

(declare-fun b!1304312 () Bool)

(declare-fun res!866261 () Bool)

(declare-fun e!743984 () Bool)

(assert (=> b!1304312 (=> (not res!866261) (not e!743984))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51673 0))(
  ( (V!51674 (val!17538 Int)) )
))
(declare-datatypes ((ValueCell!16565 0))(
  ( (ValueCellFull!16565 (v!20156 V!51673)) (EmptyCell!16565) )
))
(declare-datatypes ((array!86775 0))(
  ( (array!86776 (arr!41877 (Array (_ BitVec 32) ValueCell!16565)) (size!42429 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86775)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86777 0))(
  ( (array!86778 (arr!41878 (Array (_ BitVec 32) (_ BitVec 64))) (size!42430 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86777)

(assert (=> b!1304312 (= res!866261 (and (= (size!42429 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42430 _keys!1741) (size!42429 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304313 () Bool)

(declare-fun e!743982 () Bool)

(declare-fun e!743983 () Bool)

(assert (=> b!1304313 (= e!743982 e!743983)))

(declare-fun res!866257 () Bool)

(assert (=> b!1304313 (=> (not res!866257) (not e!743983))))

(declare-fun minValue!1387 () V!51673)

(declare-fun zeroValue!1387 () V!51673)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22700 0))(
  ( (tuple2!22701 (_1!11361 (_ BitVec 64)) (_2!11361 V!51673)) )
))
(declare-datatypes ((List!29805 0))(
  ( (Nil!29802) (Cons!29801 (h!31010 tuple2!22700) (t!43395 List!29805)) )
))
(declare-datatypes ((ListLongMap!20357 0))(
  ( (ListLongMap!20358 (toList!10194 List!29805)) )
))
(declare-fun contains!8262 (ListLongMap!20357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6154 (array!86777 array!86775 (_ BitVec 32) (_ BitVec 32) V!51673 V!51673 (_ BitVec 32) Int) ListLongMap!20357)

(assert (=> b!1304313 (= res!866257 (not (contains!8262 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1304314 () Bool)

(declare-fun e!743987 () Bool)

(declare-fun tp_is_empty!34927 () Bool)

(assert (=> b!1304314 (= e!743987 tp_is_empty!34927)))

(declare-fun res!866259 () Bool)

(assert (=> start!110164 (=> (not res!866259) (not e!743984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110164 (= res!866259 (validMask!0 mask!2175))))

(assert (=> start!110164 e!743984))

(assert (=> start!110164 tp_is_empty!34927))

(assert (=> start!110164 true))

(declare-fun e!743986 () Bool)

(declare-fun array_inv!31851 (array!86775) Bool)

(assert (=> start!110164 (and (array_inv!31851 _values!1445) e!743986)))

(declare-fun array_inv!31852 (array!86777) Bool)

(assert (=> start!110164 (array_inv!31852 _keys!1741)))

(assert (=> start!110164 tp!103020))

(declare-fun b!1304315 () Bool)

(declare-fun res!866258 () Bool)

(assert (=> b!1304315 (=> (not res!866258) (not e!743984))))

(declare-datatypes ((List!29806 0))(
  ( (Nil!29803) (Cons!29802 (h!31011 (_ BitVec 64)) (t!43396 List!29806)) )
))
(declare-fun arrayNoDuplicates!0 (array!86777 (_ BitVec 32) List!29806) Bool)

(assert (=> b!1304315 (= res!866258 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29803))))

(declare-fun b!1304316 () Bool)

(declare-fun e!743988 () Bool)

(assert (=> b!1304316 (= e!743988 tp_is_empty!34927)))

(declare-fun b!1304317 () Bool)

(declare-fun mapRes!53990 () Bool)

(assert (=> b!1304317 (= e!743986 (and e!743988 mapRes!53990))))

(declare-fun condMapEmpty!53990 () Bool)

(declare-fun mapDefault!53990 () ValueCell!16565)

(assert (=> b!1304317 (= condMapEmpty!53990 (= (arr!41877 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16565)) mapDefault!53990)))))

(declare-fun b!1304318 () Bool)

(declare-fun res!866252 () Bool)

(assert (=> b!1304318 (=> (not res!866252) (not e!743984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86777 (_ BitVec 32)) Bool)

(assert (=> b!1304318 (= res!866252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304319 () Bool)

(declare-fun res!866260 () Bool)

(assert (=> b!1304319 (=> (not res!866260) (not e!743984))))

(assert (=> b!1304319 (= res!866260 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _keys!1741))))))

(declare-fun mapNonEmpty!53990 () Bool)

(declare-fun tp!103019 () Bool)

(assert (=> mapNonEmpty!53990 (= mapRes!53990 (and tp!103019 e!743987))))

(declare-fun mapRest!53990 () (Array (_ BitVec 32) ValueCell!16565))

(declare-fun mapValue!53990 () ValueCell!16565)

(declare-fun mapKey!53990 () (_ BitVec 32))

(assert (=> mapNonEmpty!53990 (= (arr!41877 _values!1445) (store mapRest!53990 mapKey!53990 mapValue!53990))))

(declare-fun b!1304320 () Bool)

(declare-fun res!866256 () Bool)

(assert (=> b!1304320 (=> (not res!866256) (not e!743984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304320 (= res!866256 (not (validKeyInArray!0 (select (arr!41878 _keys!1741) from!2144))))))

(declare-fun b!1304321 () Bool)

(assert (=> b!1304321 (= e!743984 (not e!743982))))

(declare-fun res!866255 () Bool)

(assert (=> b!1304321 (=> res!866255 e!743982)))

(assert (=> b!1304321 (= res!866255 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304321 (not (contains!8262 (ListLongMap!20358 Nil!29802) k0!1205))))

(declare-datatypes ((Unit!43037 0))(
  ( (Unit!43038) )
))
(declare-fun lt!583593 () Unit!43037)

(declare-fun emptyContainsNothing!221 ((_ BitVec 64)) Unit!43037)

(assert (=> b!1304321 (= lt!583593 (emptyContainsNothing!221 k0!1205))))

(declare-fun mapIsEmpty!53990 () Bool)

(assert (=> mapIsEmpty!53990 mapRes!53990))

(declare-fun b!1304322 () Bool)

(declare-fun res!866253 () Bool)

(assert (=> b!1304322 (=> (not res!866253) (not e!743984))))

(assert (=> b!1304322 (= res!866253 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42430 _keys!1741))))))

(declare-fun b!1304323 () Bool)

(assert (=> b!1304323 (= e!743983 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1304324 () Bool)

(declare-fun res!866254 () Bool)

(assert (=> b!1304324 (=> (not res!866254) (not e!743984))))

(declare-fun getCurrentListMap!5094 (array!86777 array!86775 (_ BitVec 32) (_ BitVec 32) V!51673 V!51673 (_ BitVec 32) Int) ListLongMap!20357)

(assert (=> b!1304324 (= res!866254 (contains!8262 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!110164 res!866259) b!1304312))

(assert (= (and b!1304312 res!866261) b!1304318))

(assert (= (and b!1304318 res!866252) b!1304315))

(assert (= (and b!1304315 res!866258) b!1304319))

(assert (= (and b!1304319 res!866260) b!1304324))

(assert (= (and b!1304324 res!866254) b!1304322))

(assert (= (and b!1304322 res!866253) b!1304320))

(assert (= (and b!1304320 res!866256) b!1304321))

(assert (= (and b!1304321 (not res!866255)) b!1304313))

(assert (= (and b!1304313 res!866257) b!1304323))

(assert (= (and b!1304317 condMapEmpty!53990) mapIsEmpty!53990))

(assert (= (and b!1304317 (not condMapEmpty!53990)) mapNonEmpty!53990))

(get-info :version)

(assert (= (and mapNonEmpty!53990 ((_ is ValueCellFull!16565) mapValue!53990)) b!1304314))

(assert (= (and b!1304317 ((_ is ValueCellFull!16565) mapDefault!53990)) b!1304316))

(assert (= start!110164 b!1304317))

(declare-fun m!1194837 () Bool)

(assert (=> b!1304315 m!1194837))

(declare-fun m!1194839 () Bool)

(assert (=> mapNonEmpty!53990 m!1194839))

(declare-fun m!1194841 () Bool)

(assert (=> start!110164 m!1194841))

(declare-fun m!1194843 () Bool)

(assert (=> start!110164 m!1194843))

(declare-fun m!1194845 () Bool)

(assert (=> start!110164 m!1194845))

(declare-fun m!1194847 () Bool)

(assert (=> b!1304321 m!1194847))

(declare-fun m!1194849 () Bool)

(assert (=> b!1304321 m!1194849))

(declare-fun m!1194851 () Bool)

(assert (=> b!1304324 m!1194851))

(assert (=> b!1304324 m!1194851))

(declare-fun m!1194853 () Bool)

(assert (=> b!1304324 m!1194853))

(declare-fun m!1194855 () Bool)

(assert (=> b!1304318 m!1194855))

(declare-fun m!1194857 () Bool)

(assert (=> b!1304313 m!1194857))

(assert (=> b!1304313 m!1194857))

(declare-fun m!1194859 () Bool)

(assert (=> b!1304313 m!1194859))

(declare-fun m!1194861 () Bool)

(assert (=> b!1304320 m!1194861))

(assert (=> b!1304320 m!1194861))

(declare-fun m!1194863 () Bool)

(assert (=> b!1304320 m!1194863))

(check-sat (not start!110164) b_and!47449 (not b!1304315) (not b!1304313) (not b!1304321) (not mapNonEmpty!53990) (not b!1304324) tp_is_empty!34927 (not b!1304318) (not b_next!29287) (not b!1304320))
(check-sat b_and!47449 (not b_next!29287))
(get-model)

(declare-fun d!141699 () Bool)

(declare-fun e!744035 () Bool)

(assert (=> d!141699 e!744035))

(declare-fun res!866324 () Bool)

(assert (=> d!141699 (=> res!866324 e!744035)))

(declare-fun lt!583609 () Bool)

(assert (=> d!141699 (= res!866324 (not lt!583609))))

(declare-fun lt!583608 () Bool)

(assert (=> d!141699 (= lt!583609 lt!583608)))

(declare-fun lt!583611 () Unit!43037)

(declare-fun e!744036 () Unit!43037)

(assert (=> d!141699 (= lt!583611 e!744036)))

(declare-fun c!125207 () Bool)

(assert (=> d!141699 (= c!125207 lt!583608)))

(declare-fun containsKey!727 (List!29805 (_ BitVec 64)) Bool)

(assert (=> d!141699 (= lt!583608 (containsKey!727 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))

(assert (=> d!141699 (= (contains!8262 (ListLongMap!20358 Nil!29802) k0!1205) lt!583609)))

(declare-fun b!1304409 () Bool)

(declare-fun lt!583610 () Unit!43037)

(assert (=> b!1304409 (= e!744036 lt!583610)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!474 (List!29805 (_ BitVec 64)) Unit!43037)

(assert (=> b!1304409 (= lt!583610 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))

(declare-datatypes ((Option!761 0))(
  ( (Some!760 (v!20159 V!51673)) (None!759) )
))
(declare-fun isDefined!517 (Option!761) Bool)

(declare-fun getValueByKey!710 (List!29805 (_ BitVec 64)) Option!761)

(assert (=> b!1304409 (isDefined!517 (getValueByKey!710 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))

(declare-fun b!1304410 () Bool)

(declare-fun Unit!43043 () Unit!43037)

(assert (=> b!1304410 (= e!744036 Unit!43043)))

(declare-fun b!1304411 () Bool)

(assert (=> b!1304411 (= e!744035 (isDefined!517 (getValueByKey!710 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205)))))

(assert (= (and d!141699 c!125207) b!1304409))

(assert (= (and d!141699 (not c!125207)) b!1304410))

(assert (= (and d!141699 (not res!866324)) b!1304411))

(declare-fun m!1194921 () Bool)

(assert (=> d!141699 m!1194921))

(declare-fun m!1194923 () Bool)

(assert (=> b!1304409 m!1194923))

(declare-fun m!1194925 () Bool)

(assert (=> b!1304409 m!1194925))

(assert (=> b!1304409 m!1194925))

(declare-fun m!1194927 () Bool)

(assert (=> b!1304409 m!1194927))

(assert (=> b!1304411 m!1194925))

(assert (=> b!1304411 m!1194925))

(assert (=> b!1304411 m!1194927))

(assert (=> b!1304321 d!141699))

(declare-fun d!141701 () Bool)

(assert (=> d!141701 (not (contains!8262 (ListLongMap!20358 Nil!29802) k0!1205))))

(declare-fun lt!583614 () Unit!43037)

(declare-fun choose!1937 ((_ BitVec 64)) Unit!43037)

(assert (=> d!141701 (= lt!583614 (choose!1937 k0!1205))))

(assert (=> d!141701 (= (emptyContainsNothing!221 k0!1205) lt!583614)))

(declare-fun bs!37125 () Bool)

(assert (= bs!37125 d!141701))

(assert (=> bs!37125 m!1194847))

(declare-fun m!1194929 () Bool)

(assert (=> bs!37125 m!1194929))

(assert (=> b!1304321 d!141701))

(declare-fun d!141703 () Bool)

(assert (=> d!141703 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110164 d!141703))

(declare-fun d!141705 () Bool)

(assert (=> d!141705 (= (array_inv!31851 _values!1445) (bvsge (size!42429 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110164 d!141705))

(declare-fun d!141707 () Bool)

(assert (=> d!141707 (= (array_inv!31852 _keys!1741) (bvsge (size!42430 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110164 d!141707))

(declare-fun b!1304422 () Bool)

(declare-fun e!744046 () Bool)

(declare-fun contains!8265 (List!29806 (_ BitVec 64)) Bool)

(assert (=> b!1304422 (= e!744046 (contains!8265 Nil!29803 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304423 () Bool)

(declare-fun e!744047 () Bool)

(declare-fun call!64253 () Bool)

(assert (=> b!1304423 (= e!744047 call!64253)))

(declare-fun d!141709 () Bool)

(declare-fun res!866331 () Bool)

(declare-fun e!744048 () Bool)

(assert (=> d!141709 (=> res!866331 e!744048)))

(assert (=> d!141709 (= res!866331 (bvsge #b00000000000000000000000000000000 (size!42430 _keys!1741)))))

(assert (=> d!141709 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29803) e!744048)))

(declare-fun b!1304424 () Bool)

(declare-fun e!744045 () Bool)

(assert (=> b!1304424 (= e!744045 e!744047)))

(declare-fun c!125210 () Bool)

(assert (=> b!1304424 (= c!125210 (validKeyInArray!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304425 () Bool)

(assert (=> b!1304425 (= e!744048 e!744045)))

(declare-fun res!866333 () Bool)

(assert (=> b!1304425 (=> (not res!866333) (not e!744045))))

(assert (=> b!1304425 (= res!866333 (not e!744046))))

(declare-fun res!866332 () Bool)

(assert (=> b!1304425 (=> (not res!866332) (not e!744046))))

(assert (=> b!1304425 (= res!866332 (validKeyInArray!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304426 () Bool)

(assert (=> b!1304426 (= e!744047 call!64253)))

(declare-fun bm!64250 () Bool)

(assert (=> bm!64250 (= call!64253 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125210 (Cons!29802 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) Nil!29803) Nil!29803)))))

(assert (= (and d!141709 (not res!866331)) b!1304425))

(assert (= (and b!1304425 res!866332) b!1304422))

(assert (= (and b!1304425 res!866333) b!1304424))

(assert (= (and b!1304424 c!125210) b!1304423))

(assert (= (and b!1304424 (not c!125210)) b!1304426))

(assert (= (or b!1304423 b!1304426) bm!64250))

(declare-fun m!1194931 () Bool)

(assert (=> b!1304422 m!1194931))

(assert (=> b!1304422 m!1194931))

(declare-fun m!1194933 () Bool)

(assert (=> b!1304422 m!1194933))

(assert (=> b!1304424 m!1194931))

(assert (=> b!1304424 m!1194931))

(declare-fun m!1194935 () Bool)

(assert (=> b!1304424 m!1194935))

(assert (=> b!1304425 m!1194931))

(assert (=> b!1304425 m!1194931))

(assert (=> b!1304425 m!1194935))

(assert (=> bm!64250 m!1194931))

(declare-fun m!1194937 () Bool)

(assert (=> bm!64250 m!1194937))

(assert (=> b!1304315 d!141709))

(declare-fun d!141711 () Bool)

(declare-fun e!744049 () Bool)

(assert (=> d!141711 e!744049))

(declare-fun res!866334 () Bool)

(assert (=> d!141711 (=> res!866334 e!744049)))

(declare-fun lt!583616 () Bool)

(assert (=> d!141711 (= res!866334 (not lt!583616))))

(declare-fun lt!583615 () Bool)

(assert (=> d!141711 (= lt!583616 lt!583615)))

(declare-fun lt!583618 () Unit!43037)

(declare-fun e!744050 () Unit!43037)

(assert (=> d!141711 (= lt!583618 e!744050)))

(declare-fun c!125211 () Bool)

(assert (=> d!141711 (= c!125211 lt!583615)))

(assert (=> d!141711 (= lt!583615 (containsKey!727 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141711 (= (contains!8262 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583616)))

(declare-fun b!1304427 () Bool)

(declare-fun lt!583617 () Unit!43037)

(assert (=> b!1304427 (= e!744050 lt!583617)))

(assert (=> b!1304427 (= lt!583617 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304427 (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304428 () Bool)

(declare-fun Unit!43044 () Unit!43037)

(assert (=> b!1304428 (= e!744050 Unit!43044)))

(declare-fun b!1304429 () Bool)

(assert (=> b!1304429 (= e!744049 (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141711 c!125211) b!1304427))

(assert (= (and d!141711 (not c!125211)) b!1304428))

(assert (= (and d!141711 (not res!866334)) b!1304429))

(declare-fun m!1194939 () Bool)

(assert (=> d!141711 m!1194939))

(declare-fun m!1194941 () Bool)

(assert (=> b!1304427 m!1194941))

(declare-fun m!1194943 () Bool)

(assert (=> b!1304427 m!1194943))

(assert (=> b!1304427 m!1194943))

(declare-fun m!1194945 () Bool)

(assert (=> b!1304427 m!1194945))

(assert (=> b!1304429 m!1194943))

(assert (=> b!1304429 m!1194943))

(assert (=> b!1304429 m!1194945))

(assert (=> b!1304324 d!141711))

(declare-fun b!1304472 () Bool)

(declare-fun e!744088 () Bool)

(declare-fun e!744078 () Bool)

(assert (=> b!1304472 (= e!744088 e!744078)))

(declare-fun res!866360 () Bool)

(assert (=> b!1304472 (=> (not res!866360) (not e!744078))))

(declare-fun lt!583674 () ListLongMap!20357)

(assert (=> b!1304472 (= res!866360 (contains!8262 lt!583674 (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> b!1304472 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _keys!1741)))))

(declare-fun bm!64265 () Bool)

(declare-fun call!64272 () Bool)

(assert (=> bm!64265 (= call!64272 (contains!8262 lt!583674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64266 () Bool)

(declare-fun call!64269 () ListLongMap!20357)

(declare-fun call!64270 () ListLongMap!20357)

(assert (=> bm!64266 (= call!64269 call!64270)))

(declare-fun b!1304473 () Bool)

(declare-fun e!744083 () Bool)

(assert (=> b!1304473 (= e!744083 (validKeyInArray!0 (select (arr!41878 _keys!1741) from!2144)))))

(declare-fun b!1304474 () Bool)

(declare-fun e!744080 () Bool)

(declare-fun e!744081 () Bool)

(assert (=> b!1304474 (= e!744080 e!744081)))

(declare-fun res!866355 () Bool)

(assert (=> b!1304474 (= res!866355 call!64272)))

(assert (=> b!1304474 (=> (not res!866355) (not e!744081))))

(declare-fun b!1304475 () Bool)

(declare-fun res!866357 () Bool)

(declare-fun e!744085 () Bool)

(assert (=> b!1304475 (=> (not res!866357) (not e!744085))))

(assert (=> b!1304475 (= res!866357 e!744088)))

(declare-fun res!866354 () Bool)

(assert (=> b!1304475 (=> res!866354 e!744088)))

(declare-fun e!744082 () Bool)

(assert (=> b!1304475 (= res!866354 (not e!744082))))

(declare-fun res!866356 () Bool)

(assert (=> b!1304475 (=> (not res!866356) (not e!744082))))

(assert (=> b!1304475 (= res!866356 (bvslt from!2144 (size!42430 _keys!1741)))))

(declare-fun b!1304476 () Bool)

(declare-fun e!744087 () Unit!43037)

(declare-fun lt!583681 () Unit!43037)

(assert (=> b!1304476 (= e!744087 lt!583681)))

(declare-fun lt!583673 () ListLongMap!20357)

(assert (=> b!1304476 (= lt!583673 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583663 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583676 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583676 (select (arr!41878 _keys!1741) from!2144))))

(declare-fun lt!583683 () Unit!43037)

(declare-fun addStillContains!1112 (ListLongMap!20357 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43037)

(assert (=> b!1304476 (= lt!583683 (addStillContains!1112 lt!583673 lt!583663 zeroValue!1387 lt!583676))))

(declare-fun +!4520 (ListLongMap!20357 tuple2!22700) ListLongMap!20357)

(assert (=> b!1304476 (contains!8262 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387)) lt!583676)))

(declare-fun lt!583680 () Unit!43037)

(assert (=> b!1304476 (= lt!583680 lt!583683)))

(declare-fun lt!583678 () ListLongMap!20357)

(assert (=> b!1304476 (= lt!583678 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583671 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583670 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583670 (select (arr!41878 _keys!1741) from!2144))))

(declare-fun lt!583677 () Unit!43037)

(declare-fun addApplyDifferent!555 (ListLongMap!20357 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43037)

(assert (=> b!1304476 (= lt!583677 (addApplyDifferent!555 lt!583678 lt!583671 minValue!1387 lt!583670))))

(declare-fun apply!1017 (ListLongMap!20357 (_ BitVec 64)) V!51673)

(assert (=> b!1304476 (= (apply!1017 (+!4520 lt!583678 (tuple2!22701 lt!583671 minValue!1387)) lt!583670) (apply!1017 lt!583678 lt!583670))))

(declare-fun lt!583666 () Unit!43037)

(assert (=> b!1304476 (= lt!583666 lt!583677)))

(declare-fun lt!583669 () ListLongMap!20357)

(assert (=> b!1304476 (= lt!583669 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583667 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583668 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583668 (select (arr!41878 _keys!1741) from!2144))))

(declare-fun lt!583672 () Unit!43037)

(assert (=> b!1304476 (= lt!583672 (addApplyDifferent!555 lt!583669 lt!583667 zeroValue!1387 lt!583668))))

(assert (=> b!1304476 (= (apply!1017 (+!4520 lt!583669 (tuple2!22701 lt!583667 zeroValue!1387)) lt!583668) (apply!1017 lt!583669 lt!583668))))

(declare-fun lt!583675 () Unit!43037)

(assert (=> b!1304476 (= lt!583675 lt!583672)))

(declare-fun lt!583679 () ListLongMap!20357)

(assert (=> b!1304476 (= lt!583679 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583665 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583665 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583684 () (_ BitVec 64))

(assert (=> b!1304476 (= lt!583684 (select (arr!41878 _keys!1741) from!2144))))

(assert (=> b!1304476 (= lt!583681 (addApplyDifferent!555 lt!583679 lt!583665 minValue!1387 lt!583684))))

(assert (=> b!1304476 (= (apply!1017 (+!4520 lt!583679 (tuple2!22701 lt!583665 minValue!1387)) lt!583684) (apply!1017 lt!583679 lt!583684))))

(declare-fun bm!64267 () Bool)

(declare-fun call!64273 () ListLongMap!20357)

(assert (=> bm!64267 (= call!64273 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304478 () Bool)

(declare-fun e!744086 () ListLongMap!20357)

(declare-fun call!64274 () ListLongMap!20357)

(assert (=> b!1304478 (= e!744086 call!64274)))

(declare-fun b!1304479 () Bool)

(assert (=> b!1304479 (= e!744081 (= (apply!1017 lt!583674 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64268 () Bool)

(assert (=> bm!64268 (= call!64270 call!64273)))

(declare-fun b!1304480 () Bool)

(assert (=> b!1304480 (= e!744080 (not call!64272))))

(declare-fun b!1304481 () Bool)

(declare-fun e!744077 () ListLongMap!20357)

(assert (=> b!1304481 (= e!744077 call!64269)))

(declare-fun b!1304482 () Bool)

(declare-fun e!744084 () ListLongMap!20357)

(assert (=> b!1304482 (= e!744084 e!744086)))

(declare-fun c!125225 () Bool)

(assert (=> b!1304482 (= c!125225 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304483 () Bool)

(declare-fun c!125228 () Bool)

(assert (=> b!1304483 (= c!125228 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304483 (= e!744086 e!744077)))

(declare-fun b!1304484 () Bool)

(declare-fun e!744089 () Bool)

(declare-fun e!744079 () Bool)

(assert (=> b!1304484 (= e!744089 e!744079)))

(declare-fun res!866361 () Bool)

(declare-fun call!64268 () Bool)

(assert (=> b!1304484 (= res!866361 call!64268)))

(assert (=> b!1304484 (=> (not res!866361) (not e!744079))))

(declare-fun b!1304485 () Bool)

(assert (=> b!1304485 (= e!744085 e!744089)))

(declare-fun c!125229 () Bool)

(assert (=> b!1304485 (= c!125229 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64269 () Bool)

(declare-fun call!64271 () ListLongMap!20357)

(declare-fun c!125224 () Bool)

(assert (=> bm!64269 (= call!64271 (+!4520 (ite c!125224 call!64273 (ite c!125225 call!64270 call!64269)) (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1304486 () Bool)

(declare-fun get!21177 (ValueCell!16565 V!51673) V!51673)

(declare-fun dynLambda!3455 (Int (_ BitVec 64)) V!51673)

(assert (=> b!1304486 (= e!744078 (= (apply!1017 lt!583674 (select (arr!41878 _keys!1741) from!2144)) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304486 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42429 _values!1445)))))

(assert (=> b!1304486 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _keys!1741)))))

(declare-fun b!1304487 () Bool)

(assert (=> b!1304487 (= e!744084 (+!4520 call!64271 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1304477 () Bool)

(declare-fun res!866353 () Bool)

(assert (=> b!1304477 (=> (not res!866353) (not e!744085))))

(assert (=> b!1304477 (= res!866353 e!744080)))

(declare-fun c!125227 () Bool)

(assert (=> b!1304477 (= c!125227 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!141713 () Bool)

(assert (=> d!141713 e!744085))

(declare-fun res!866358 () Bool)

(assert (=> d!141713 (=> (not res!866358) (not e!744085))))

(assert (=> d!141713 (= res!866358 (or (bvsge from!2144 (size!42430 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _keys!1741)))))))

(declare-fun lt!583682 () ListLongMap!20357)

(assert (=> d!141713 (= lt!583674 lt!583682)))

(declare-fun lt!583664 () Unit!43037)

(assert (=> d!141713 (= lt!583664 e!744087)))

(declare-fun c!125226 () Bool)

(assert (=> d!141713 (= c!125226 e!744083)))

(declare-fun res!866359 () Bool)

(assert (=> d!141713 (=> (not res!866359) (not e!744083))))

(assert (=> d!141713 (= res!866359 (bvslt from!2144 (size!42430 _keys!1741)))))

(assert (=> d!141713 (= lt!583682 e!744084)))

(assert (=> d!141713 (= c!125224 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141713 (validMask!0 mask!2175)))

(assert (=> d!141713 (= (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583674)))

(declare-fun bm!64270 () Bool)

(assert (=> bm!64270 (= call!64274 call!64271)))

(declare-fun b!1304488 () Bool)

(assert (=> b!1304488 (= e!744079 (= (apply!1017 lt!583674 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1304489 () Bool)

(assert (=> b!1304489 (= e!744089 (not call!64268))))

(declare-fun b!1304490 () Bool)

(declare-fun Unit!43045 () Unit!43037)

(assert (=> b!1304490 (= e!744087 Unit!43045)))

(declare-fun b!1304491 () Bool)

(assert (=> b!1304491 (= e!744077 call!64274)))

(declare-fun b!1304492 () Bool)

(assert (=> b!1304492 (= e!744082 (validKeyInArray!0 (select (arr!41878 _keys!1741) from!2144)))))

(declare-fun bm!64271 () Bool)

(assert (=> bm!64271 (= call!64268 (contains!8262 lt!583674 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!141713 c!125224) b!1304487))

(assert (= (and d!141713 (not c!125224)) b!1304482))

(assert (= (and b!1304482 c!125225) b!1304478))

(assert (= (and b!1304482 (not c!125225)) b!1304483))

(assert (= (and b!1304483 c!125228) b!1304491))

(assert (= (and b!1304483 (not c!125228)) b!1304481))

(assert (= (or b!1304491 b!1304481) bm!64266))

(assert (= (or b!1304478 bm!64266) bm!64268))

(assert (= (or b!1304478 b!1304491) bm!64270))

(assert (= (or b!1304487 bm!64268) bm!64267))

(assert (= (or b!1304487 bm!64270) bm!64269))

(assert (= (and d!141713 res!866359) b!1304473))

(assert (= (and d!141713 c!125226) b!1304476))

(assert (= (and d!141713 (not c!125226)) b!1304490))

(assert (= (and d!141713 res!866358) b!1304475))

(assert (= (and b!1304475 res!866356) b!1304492))

(assert (= (and b!1304475 (not res!866354)) b!1304472))

(assert (= (and b!1304472 res!866360) b!1304486))

(assert (= (and b!1304475 res!866357) b!1304477))

(assert (= (and b!1304477 c!125227) b!1304474))

(assert (= (and b!1304477 (not c!125227)) b!1304480))

(assert (= (and b!1304474 res!866355) b!1304479))

(assert (= (or b!1304474 b!1304480) bm!64265))

(assert (= (and b!1304477 res!866353) b!1304485))

(assert (= (and b!1304485 c!125229) b!1304484))

(assert (= (and b!1304485 (not c!125229)) b!1304489))

(assert (= (and b!1304484 res!866361) b!1304488))

(assert (= (or b!1304484 b!1304489) bm!64271))

(declare-fun b_lambda!23297 () Bool)

(assert (=> (not b_lambda!23297) (not b!1304486)))

(declare-fun t!43401 () Bool)

(declare-fun tb!11395 () Bool)

(assert (=> (and start!110164 (= defaultEntry!1448 defaultEntry!1448) t!43401) tb!11395))

(declare-fun result!23823 () Bool)

(assert (=> tb!11395 (= result!23823 tp_is_empty!34927)))

(assert (=> b!1304486 t!43401))

(declare-fun b_and!47455 () Bool)

(assert (= b_and!47449 (and (=> t!43401 result!23823) b_and!47455)))

(assert (=> b!1304472 m!1194861))

(assert (=> b!1304472 m!1194861))

(declare-fun m!1194947 () Bool)

(assert (=> b!1304472 m!1194947))

(assert (=> d!141713 m!1194841))

(declare-fun m!1194949 () Bool)

(assert (=> bm!64265 m!1194949))

(assert (=> b!1304492 m!1194861))

(assert (=> b!1304492 m!1194861))

(assert (=> b!1304492 m!1194863))

(declare-fun m!1194951 () Bool)

(assert (=> b!1304488 m!1194951))

(declare-fun m!1194953 () Bool)

(assert (=> bm!64269 m!1194953))

(assert (=> bm!64267 m!1194857))

(assert (=> b!1304486 m!1194861))

(declare-fun m!1194955 () Bool)

(assert (=> b!1304486 m!1194955))

(assert (=> b!1304486 m!1194861))

(declare-fun m!1194957 () Bool)

(assert (=> b!1304486 m!1194957))

(declare-fun m!1194959 () Bool)

(assert (=> b!1304486 m!1194959))

(assert (=> b!1304486 m!1194957))

(declare-fun m!1194961 () Bool)

(assert (=> b!1304486 m!1194961))

(assert (=> b!1304486 m!1194959))

(assert (=> b!1304473 m!1194861))

(assert (=> b!1304473 m!1194861))

(assert (=> b!1304473 m!1194863))

(declare-fun m!1194963 () Bool)

(assert (=> b!1304479 m!1194963))

(declare-fun m!1194965 () Bool)

(assert (=> b!1304476 m!1194965))

(declare-fun m!1194967 () Bool)

(assert (=> b!1304476 m!1194967))

(declare-fun m!1194969 () Bool)

(assert (=> b!1304476 m!1194969))

(assert (=> b!1304476 m!1194861))

(declare-fun m!1194971 () Bool)

(assert (=> b!1304476 m!1194971))

(assert (=> b!1304476 m!1194969))

(declare-fun m!1194973 () Bool)

(assert (=> b!1304476 m!1194973))

(assert (=> b!1304476 m!1194857))

(declare-fun m!1194975 () Bool)

(assert (=> b!1304476 m!1194975))

(declare-fun m!1194977 () Bool)

(assert (=> b!1304476 m!1194977))

(declare-fun m!1194979 () Bool)

(assert (=> b!1304476 m!1194979))

(declare-fun m!1194981 () Bool)

(assert (=> b!1304476 m!1194981))

(assert (=> b!1304476 m!1194965))

(declare-fun m!1194983 () Bool)

(assert (=> b!1304476 m!1194983))

(declare-fun m!1194985 () Bool)

(assert (=> b!1304476 m!1194985))

(assert (=> b!1304476 m!1194977))

(declare-fun m!1194987 () Bool)

(assert (=> b!1304476 m!1194987))

(declare-fun m!1194989 () Bool)

(assert (=> b!1304476 m!1194989))

(declare-fun m!1194991 () Bool)

(assert (=> b!1304476 m!1194991))

(assert (=> b!1304476 m!1194979))

(declare-fun m!1194993 () Bool)

(assert (=> b!1304476 m!1194993))

(declare-fun m!1194995 () Bool)

(assert (=> bm!64271 m!1194995))

(declare-fun m!1194997 () Bool)

(assert (=> b!1304487 m!1194997))

(assert (=> b!1304324 d!141713))

(declare-fun d!141715 () Bool)

(assert (=> d!141715 (= (validKeyInArray!0 (select (arr!41878 _keys!1741) from!2144)) (and (not (= (select (arr!41878 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41878 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304320 d!141715))

(declare-fun b!1304503 () Bool)

(declare-fun e!744097 () Bool)

(declare-fun e!744098 () Bool)

(assert (=> b!1304503 (= e!744097 e!744098)))

(declare-fun c!125232 () Bool)

(assert (=> b!1304503 (= c!125232 (validKeyInArray!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304504 () Bool)

(declare-fun e!744096 () Bool)

(assert (=> b!1304504 (= e!744098 e!744096)))

(declare-fun lt!583691 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583691 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583693 () Unit!43037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86777 (_ BitVec 64) (_ BitVec 32)) Unit!43037)

(assert (=> b!1304504 (= lt!583693 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583691 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304504 (arrayContainsKey!0 _keys!1741 lt!583691 #b00000000000000000000000000000000)))

(declare-fun lt!583692 () Unit!43037)

(assert (=> b!1304504 (= lt!583692 lt!583693)))

(declare-fun res!866366 () Bool)

(declare-datatypes ((SeekEntryResult!10026 0))(
  ( (MissingZero!10026 (index!42475 (_ BitVec 32))) (Found!10026 (index!42476 (_ BitVec 32))) (Intermediate!10026 (undefined!10838 Bool) (index!42477 (_ BitVec 32)) (x!115857 (_ BitVec 32))) (Undefined!10026) (MissingVacant!10026 (index!42478 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86777 (_ BitVec 32)) SeekEntryResult!10026)

(assert (=> b!1304504 (= res!866366 (= (seekEntryOrOpen!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10026 #b00000000000000000000000000000000)))))

(assert (=> b!1304504 (=> (not res!866366) (not e!744096))))

(declare-fun bm!64274 () Bool)

(declare-fun call!64277 () Bool)

(assert (=> bm!64274 (= call!64277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304505 () Bool)

(assert (=> b!1304505 (= e!744096 call!64277)))

(declare-fun d!141717 () Bool)

(declare-fun res!866367 () Bool)

(assert (=> d!141717 (=> res!866367 e!744097)))

(assert (=> d!141717 (= res!866367 (bvsge #b00000000000000000000000000000000 (size!42430 _keys!1741)))))

(assert (=> d!141717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744097)))

(declare-fun b!1304506 () Bool)

(assert (=> b!1304506 (= e!744098 call!64277)))

(assert (= (and d!141717 (not res!866367)) b!1304503))

(assert (= (and b!1304503 c!125232) b!1304504))

(assert (= (and b!1304503 (not c!125232)) b!1304506))

(assert (= (and b!1304504 res!866366) b!1304505))

(assert (= (or b!1304505 b!1304506) bm!64274))

(assert (=> b!1304503 m!1194931))

(assert (=> b!1304503 m!1194931))

(assert (=> b!1304503 m!1194935))

(assert (=> b!1304504 m!1194931))

(declare-fun m!1194999 () Bool)

(assert (=> b!1304504 m!1194999))

(declare-fun m!1195001 () Bool)

(assert (=> b!1304504 m!1195001))

(assert (=> b!1304504 m!1194931))

(declare-fun m!1195003 () Bool)

(assert (=> b!1304504 m!1195003))

(declare-fun m!1195005 () Bool)

(assert (=> bm!64274 m!1195005))

(assert (=> b!1304318 d!141717))

(declare-fun d!141719 () Bool)

(declare-fun e!744099 () Bool)

(assert (=> d!141719 e!744099))

(declare-fun res!866368 () Bool)

(assert (=> d!141719 (=> res!866368 e!744099)))

(declare-fun lt!583695 () Bool)

(assert (=> d!141719 (= res!866368 (not lt!583695))))

(declare-fun lt!583694 () Bool)

(assert (=> d!141719 (= lt!583695 lt!583694)))

(declare-fun lt!583697 () Unit!43037)

(declare-fun e!744100 () Unit!43037)

(assert (=> d!141719 (= lt!583697 e!744100)))

(declare-fun c!125233 () Bool)

(assert (=> d!141719 (= c!125233 lt!583694)))

(assert (=> d!141719 (= lt!583694 (containsKey!727 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141719 (= (contains!8262 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583695)))

(declare-fun b!1304507 () Bool)

(declare-fun lt!583696 () Unit!43037)

(assert (=> b!1304507 (= e!744100 lt!583696)))

(assert (=> b!1304507 (= lt!583696 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304507 (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304508 () Bool)

(declare-fun Unit!43046 () Unit!43037)

(assert (=> b!1304508 (= e!744100 Unit!43046)))

(declare-fun b!1304509 () Bool)

(assert (=> b!1304509 (= e!744099 (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141719 c!125233) b!1304507))

(assert (= (and d!141719 (not c!125233)) b!1304508))

(assert (= (and d!141719 (not res!866368)) b!1304509))

(declare-fun m!1195007 () Bool)

(assert (=> d!141719 m!1195007))

(declare-fun m!1195009 () Bool)

(assert (=> b!1304507 m!1195009))

(declare-fun m!1195011 () Bool)

(assert (=> b!1304507 m!1195011))

(assert (=> b!1304507 m!1195011))

(declare-fun m!1195013 () Bool)

(assert (=> b!1304507 m!1195013))

(assert (=> b!1304509 m!1195011))

(assert (=> b!1304509 m!1195011))

(assert (=> b!1304509 m!1195013))

(assert (=> b!1304313 d!141719))

(declare-fun b!1304534 () Bool)

(declare-fun e!744118 () Bool)

(declare-fun e!744121 () Bool)

(assert (=> b!1304534 (= e!744118 e!744121)))

(declare-fun c!125242 () Bool)

(assert (=> b!1304534 (= c!125242 (bvslt from!2144 (size!42430 _keys!1741)))))

(declare-fun b!1304535 () Bool)

(assert (=> b!1304535 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _keys!1741)))))

(assert (=> b!1304535 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42429 _values!1445)))))

(declare-fun e!744116 () Bool)

(declare-fun lt!583714 () ListLongMap!20357)

(assert (=> b!1304535 (= e!744116 (= (apply!1017 lt!583714 (select (arr!41878 _keys!1741) from!2144)) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304536 () Bool)

(declare-fun res!866379 () Bool)

(declare-fun e!744119 () Bool)

(assert (=> b!1304536 (=> (not res!866379) (not e!744119))))

(assert (=> b!1304536 (= res!866379 (not (contains!8262 lt!583714 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304537 () Bool)

(assert (=> b!1304537 (= e!744121 (= lt!583714 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304538 () Bool)

(declare-fun e!744120 () Bool)

(assert (=> b!1304538 (= e!744120 (validKeyInArray!0 (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> b!1304538 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun d!141721 () Bool)

(assert (=> d!141721 e!744119))

(declare-fun res!866377 () Bool)

(assert (=> d!141721 (=> (not res!866377) (not e!744119))))

(assert (=> d!141721 (= res!866377 (not (contains!8262 lt!583714 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!744117 () ListLongMap!20357)

(assert (=> d!141721 (= lt!583714 e!744117)))

(declare-fun c!125244 () Bool)

(assert (=> d!141721 (= c!125244 (bvsge from!2144 (size!42430 _keys!1741)))))

(assert (=> d!141721 (validMask!0 mask!2175)))

(assert (=> d!141721 (= (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583714)))

(declare-fun b!1304539 () Bool)

(declare-fun isEmpty!1072 (ListLongMap!20357) Bool)

(assert (=> b!1304539 (= e!744121 (isEmpty!1072 lt!583714))))

(declare-fun b!1304540 () Bool)

(declare-fun lt!583718 () Unit!43037)

(declare-fun lt!583716 () Unit!43037)

(assert (=> b!1304540 (= lt!583718 lt!583716)))

(declare-fun lt!583717 () (_ BitVec 64))

(declare-fun lt!583715 () V!51673)

(declare-fun lt!583713 () ListLongMap!20357)

(declare-fun lt!583712 () (_ BitVec 64))

(assert (=> b!1304540 (not (contains!8262 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715)) lt!583717))))

(declare-fun addStillNotContains!473 (ListLongMap!20357 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43037)

(assert (=> b!1304540 (= lt!583716 (addStillNotContains!473 lt!583713 lt!583712 lt!583715 lt!583717))))

(assert (=> b!1304540 (= lt!583717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304540 (= lt!583715 (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304540 (= lt!583712 (select (arr!41878 _keys!1741) from!2144))))

(declare-fun call!64280 () ListLongMap!20357)

(assert (=> b!1304540 (= lt!583713 call!64280)))

(declare-fun e!744115 () ListLongMap!20357)

(assert (=> b!1304540 (= e!744115 (+!4520 call!64280 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304541 () Bool)

(assert (=> b!1304541 (= e!744119 e!744118)))

(declare-fun c!125243 () Bool)

(assert (=> b!1304541 (= c!125243 e!744120)))

(declare-fun res!866378 () Bool)

(assert (=> b!1304541 (=> (not res!866378) (not e!744120))))

(assert (=> b!1304541 (= res!866378 (bvslt from!2144 (size!42430 _keys!1741)))))

(declare-fun b!1304542 () Bool)

(assert (=> b!1304542 (= e!744118 e!744116)))

(assert (=> b!1304542 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42430 _keys!1741)))))

(declare-fun res!866380 () Bool)

(assert (=> b!1304542 (= res!866380 (contains!8262 lt!583714 (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> b!1304542 (=> (not res!866380) (not e!744116))))

(declare-fun b!1304543 () Bool)

(assert (=> b!1304543 (= e!744117 (ListLongMap!20358 Nil!29802))))

(declare-fun b!1304544 () Bool)

(assert (=> b!1304544 (= e!744115 call!64280)))

(declare-fun bm!64277 () Bool)

(assert (=> bm!64277 (= call!64280 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304545 () Bool)

(assert (=> b!1304545 (= e!744117 e!744115)))

(declare-fun c!125245 () Bool)

(assert (=> b!1304545 (= c!125245 (validKeyInArray!0 (select (arr!41878 _keys!1741) from!2144)))))

(assert (= (and d!141721 c!125244) b!1304543))

(assert (= (and d!141721 (not c!125244)) b!1304545))

(assert (= (and b!1304545 c!125245) b!1304540))

(assert (= (and b!1304545 (not c!125245)) b!1304544))

(assert (= (or b!1304540 b!1304544) bm!64277))

(assert (= (and d!141721 res!866377) b!1304536))

(assert (= (and b!1304536 res!866379) b!1304541))

(assert (= (and b!1304541 res!866378) b!1304538))

(assert (= (and b!1304541 c!125243) b!1304542))

(assert (= (and b!1304541 (not c!125243)) b!1304534))

(assert (= (and b!1304542 res!866380) b!1304535))

(assert (= (and b!1304534 c!125242) b!1304537))

(assert (= (and b!1304534 (not c!125242)) b!1304539))

(declare-fun b_lambda!23299 () Bool)

(assert (=> (not b_lambda!23299) (not b!1304535)))

(assert (=> b!1304535 t!43401))

(declare-fun b_and!47457 () Bool)

(assert (= b_and!47455 (and (=> t!43401 result!23823) b_and!47457)))

(declare-fun b_lambda!23301 () Bool)

(assert (=> (not b_lambda!23301) (not b!1304540)))

(assert (=> b!1304540 t!43401))

(declare-fun b_and!47459 () Bool)

(assert (= b_and!47457 (and (=> t!43401 result!23823) b_and!47459)))

(assert (=> b!1304535 m!1194959))

(assert (=> b!1304535 m!1194957))

(assert (=> b!1304535 m!1194961))

(assert (=> b!1304535 m!1194861))

(assert (=> b!1304535 m!1194959))

(assert (=> b!1304535 m!1194957))

(assert (=> b!1304535 m!1194861))

(declare-fun m!1195015 () Bool)

(assert (=> b!1304535 m!1195015))

(assert (=> b!1304542 m!1194861))

(assert (=> b!1304542 m!1194861))

(declare-fun m!1195017 () Bool)

(assert (=> b!1304542 m!1195017))

(declare-fun m!1195019 () Bool)

(assert (=> bm!64277 m!1195019))

(declare-fun m!1195021 () Bool)

(assert (=> d!141721 m!1195021))

(assert (=> d!141721 m!1194841))

(assert (=> b!1304545 m!1194861))

(assert (=> b!1304545 m!1194861))

(assert (=> b!1304545 m!1194863))

(declare-fun m!1195023 () Bool)

(assert (=> b!1304540 m!1195023))

(assert (=> b!1304540 m!1194959))

(assert (=> b!1304540 m!1194957))

(assert (=> b!1304540 m!1194961))

(declare-fun m!1195025 () Bool)

(assert (=> b!1304540 m!1195025))

(declare-fun m!1195027 () Bool)

(assert (=> b!1304540 m!1195027))

(assert (=> b!1304540 m!1195025))

(declare-fun m!1195029 () Bool)

(assert (=> b!1304540 m!1195029))

(assert (=> b!1304540 m!1194861))

(assert (=> b!1304540 m!1194959))

(assert (=> b!1304540 m!1194957))

(assert (=> b!1304538 m!1194861))

(assert (=> b!1304538 m!1194861))

(assert (=> b!1304538 m!1194863))

(declare-fun m!1195031 () Bool)

(assert (=> b!1304539 m!1195031))

(assert (=> b!1304537 m!1195019))

(declare-fun m!1195033 () Bool)

(assert (=> b!1304536 m!1195033))

(assert (=> b!1304313 d!141721))

(declare-fun b!1304552 () Bool)

(declare-fun e!744127 () Bool)

(assert (=> b!1304552 (= e!744127 tp_is_empty!34927)))

(declare-fun mapNonEmpty!53999 () Bool)

(declare-fun mapRes!53999 () Bool)

(declare-fun tp!103035 () Bool)

(assert (=> mapNonEmpty!53999 (= mapRes!53999 (and tp!103035 e!744127))))

(declare-fun mapKey!53999 () (_ BitVec 32))

(declare-fun mapValue!53999 () ValueCell!16565)

(declare-fun mapRest!53999 () (Array (_ BitVec 32) ValueCell!16565))

(assert (=> mapNonEmpty!53999 (= mapRest!53990 (store mapRest!53999 mapKey!53999 mapValue!53999))))

(declare-fun mapIsEmpty!53999 () Bool)

(assert (=> mapIsEmpty!53999 mapRes!53999))

(declare-fun condMapEmpty!53999 () Bool)

(declare-fun mapDefault!53999 () ValueCell!16565)

(assert (=> mapNonEmpty!53990 (= condMapEmpty!53999 (= mapRest!53990 ((as const (Array (_ BitVec 32) ValueCell!16565)) mapDefault!53999)))))

(declare-fun e!744126 () Bool)

(assert (=> mapNonEmpty!53990 (= tp!103019 (and e!744126 mapRes!53999))))

(declare-fun b!1304553 () Bool)

(assert (=> b!1304553 (= e!744126 tp_is_empty!34927)))

(assert (= (and mapNonEmpty!53990 condMapEmpty!53999) mapIsEmpty!53999))

(assert (= (and mapNonEmpty!53990 (not condMapEmpty!53999)) mapNonEmpty!53999))

(assert (= (and mapNonEmpty!53999 ((_ is ValueCellFull!16565) mapValue!53999)) b!1304552))

(assert (= (and mapNonEmpty!53990 ((_ is ValueCellFull!16565) mapDefault!53999)) b!1304553))

(declare-fun m!1195035 () Bool)

(assert (=> mapNonEmpty!53999 m!1195035))

(declare-fun b_lambda!23303 () Bool)

(assert (= b_lambda!23301 (or (and start!110164 b_free!29287) b_lambda!23303)))

(declare-fun b_lambda!23305 () Bool)

(assert (= b_lambda!23299 (or (and start!110164 b_free!29287) b_lambda!23305)))

(declare-fun b_lambda!23307 () Bool)

(assert (= b_lambda!23297 (or (and start!110164 b_free!29287) b_lambda!23307)))

(check-sat (not mapNonEmpty!53999) (not b!1304486) (not b_lambda!23305) (not bm!64277) (not b!1304542) (not bm!64274) tp_is_empty!34927 (not b!1304422) (not b!1304429) (not b!1304472) (not b!1304473) (not b!1304535) (not b!1304487) (not b!1304479) (not d!141719) (not b!1304538) (not b!1304409) (not b!1304476) (not bm!64271) (not bm!64265) (not d!141721) (not b!1304537) (not d!141701) (not b!1304540) (not b!1304504) (not b!1304425) (not b_lambda!23307) (not b_lambda!23303) (not b!1304545) (not b!1304503) (not d!141711) (not b!1304488) (not b!1304539) (not b!1304492) (not bm!64250) (not b!1304507) (not d!141713) (not bm!64267) (not b!1304424) (not bm!64269) (not b!1304411) (not d!141699) (not b_next!29287) (not b!1304427) b_and!47459 (not b!1304536) (not b!1304509))
(check-sat b_and!47459 (not b_next!29287))
(get-model)

(declare-fun d!141723 () Bool)

(declare-fun e!744128 () Bool)

(assert (=> d!141723 e!744128))

(declare-fun res!866381 () Bool)

(assert (=> d!141723 (=> res!866381 e!744128)))

(declare-fun lt!583720 () Bool)

(assert (=> d!141723 (= res!866381 (not lt!583720))))

(declare-fun lt!583719 () Bool)

(assert (=> d!141723 (= lt!583720 lt!583719)))

(declare-fun lt!583722 () Unit!43037)

(declare-fun e!744129 () Unit!43037)

(assert (=> d!141723 (= lt!583722 e!744129)))

(declare-fun c!125246 () Bool)

(assert (=> d!141723 (= c!125246 lt!583719)))

(assert (=> d!141723 (= lt!583719 (containsKey!727 (toList!10194 lt!583674) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141723 (= (contains!8262 lt!583674 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583720)))

(declare-fun b!1304554 () Bool)

(declare-fun lt!583721 () Unit!43037)

(assert (=> b!1304554 (= e!744129 lt!583721)))

(assert (=> b!1304554 (= lt!583721 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 lt!583674) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304554 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583674) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304555 () Bool)

(declare-fun Unit!43047 () Unit!43037)

(assert (=> b!1304555 (= e!744129 Unit!43047)))

(declare-fun b!1304556 () Bool)

(assert (=> b!1304556 (= e!744128 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583674) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141723 c!125246) b!1304554))

(assert (= (and d!141723 (not c!125246)) b!1304555))

(assert (= (and d!141723 (not res!866381)) b!1304556))

(declare-fun m!1195037 () Bool)

(assert (=> d!141723 m!1195037))

(declare-fun m!1195039 () Bool)

(assert (=> b!1304554 m!1195039))

(declare-fun m!1195041 () Bool)

(assert (=> b!1304554 m!1195041))

(assert (=> b!1304554 m!1195041))

(declare-fun m!1195043 () Bool)

(assert (=> b!1304554 m!1195043))

(assert (=> b!1304556 m!1195041))

(assert (=> b!1304556 m!1195041))

(assert (=> b!1304556 m!1195043))

(assert (=> bm!64265 d!141723))

(declare-fun d!141725 () Bool)

(declare-fun get!21178 (Option!761) V!51673)

(assert (=> d!141725 (= (apply!1017 lt!583674 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21178 (getValueByKey!710 (toList!10194 lt!583674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37126 () Bool)

(assert (= bs!37126 d!141725))

(declare-fun m!1195045 () Bool)

(assert (=> bs!37126 m!1195045))

(assert (=> bs!37126 m!1195045))

(declare-fun m!1195047 () Bool)

(assert (=> bs!37126 m!1195047))

(assert (=> b!1304488 d!141725))

(declare-fun b!1304557 () Bool)

(declare-fun e!744131 () Bool)

(declare-fun e!744132 () Bool)

(assert (=> b!1304557 (= e!744131 e!744132)))

(declare-fun c!125247 () Bool)

(assert (=> b!1304557 (= c!125247 (validKeyInArray!0 (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1304558 () Bool)

(declare-fun e!744130 () Bool)

(assert (=> b!1304558 (= e!744132 e!744130)))

(declare-fun lt!583723 () (_ BitVec 64))

(assert (=> b!1304558 (= lt!583723 (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!583725 () Unit!43037)

(assert (=> b!1304558 (= lt!583725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583723 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1304558 (arrayContainsKey!0 _keys!1741 lt!583723 #b00000000000000000000000000000000)))

(declare-fun lt!583724 () Unit!43037)

(assert (=> b!1304558 (= lt!583724 lt!583725)))

(declare-fun res!866382 () Bool)

(assert (=> b!1304558 (= res!866382 (= (seekEntryOrOpen!0 (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1304558 (=> (not res!866382) (not e!744130))))

(declare-fun bm!64278 () Bool)

(declare-fun call!64281 () Bool)

(assert (=> bm!64278 (= call!64281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304559 () Bool)

(assert (=> b!1304559 (= e!744130 call!64281)))

(declare-fun d!141727 () Bool)

(declare-fun res!866383 () Bool)

(assert (=> d!141727 (=> res!866383 e!744131)))

(assert (=> d!141727 (= res!866383 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(assert (=> d!141727 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!744131)))

(declare-fun b!1304560 () Bool)

(assert (=> b!1304560 (= e!744132 call!64281)))

(assert (= (and d!141727 (not res!866383)) b!1304557))

(assert (= (and b!1304557 c!125247) b!1304558))

(assert (= (and b!1304557 (not c!125247)) b!1304560))

(assert (= (and b!1304558 res!866382) b!1304559))

(assert (= (or b!1304559 b!1304560) bm!64278))

(declare-fun m!1195049 () Bool)

(assert (=> b!1304557 m!1195049))

(assert (=> b!1304557 m!1195049))

(declare-fun m!1195051 () Bool)

(assert (=> b!1304557 m!1195051))

(assert (=> b!1304558 m!1195049))

(declare-fun m!1195053 () Bool)

(assert (=> b!1304558 m!1195053))

(declare-fun m!1195055 () Bool)

(assert (=> b!1304558 m!1195055))

(assert (=> b!1304558 m!1195049))

(declare-fun m!1195057 () Bool)

(assert (=> b!1304558 m!1195057))

(declare-fun m!1195059 () Bool)

(assert (=> bm!64278 m!1195059))

(assert (=> bm!64274 d!141727))

(declare-fun d!141729 () Bool)

(assert (=> d!141729 (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583728 () Unit!43037)

(declare-fun choose!1938 (List!29805 (_ BitVec 64)) Unit!43037)

(assert (=> d!141729 (= lt!583728 (choose!1938 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744135 () Bool)

(assert (=> d!141729 e!744135))

(declare-fun res!866386 () Bool)

(assert (=> d!141729 (=> (not res!866386) (not e!744135))))

(declare-fun isStrictlySorted!870 (List!29805) Bool)

(assert (=> d!141729 (= res!866386 (isStrictlySorted!870 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141729 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583728)))

(declare-fun b!1304563 () Bool)

(assert (=> b!1304563 (= e!744135 (containsKey!727 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141729 res!866386) b!1304563))

(assert (=> d!141729 m!1195011))

(assert (=> d!141729 m!1195011))

(assert (=> d!141729 m!1195013))

(declare-fun m!1195061 () Bool)

(assert (=> d!141729 m!1195061))

(declare-fun m!1195063 () Bool)

(assert (=> d!141729 m!1195063))

(assert (=> b!1304563 m!1195007))

(assert (=> b!1304507 d!141729))

(declare-fun d!141731 () Bool)

(declare-fun isEmpty!1073 (Option!761) Bool)

(assert (=> d!141731 (= (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1073 (getValueByKey!710 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37127 () Bool)

(assert (= bs!37127 d!141731))

(assert (=> bs!37127 m!1195011))

(declare-fun m!1195065 () Bool)

(assert (=> bs!37127 m!1195065))

(assert (=> b!1304507 d!141731))

(declare-fun e!744141 () Option!761)

(declare-fun b!1304574 () Bool)

(assert (=> b!1304574 (= e!744141 (getValueByKey!710 (t!43395 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1304572 () Bool)

(declare-fun e!744140 () Option!761)

(assert (=> b!1304572 (= e!744140 (Some!760 (_2!11361 (h!31010 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun d!141733 () Bool)

(declare-fun c!125252 () Bool)

(assert (=> d!141733 (= c!125252 (and ((_ is Cons!29801) (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11361 (h!31010 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141733 (= (getValueByKey!710 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744140)))

(declare-fun b!1304573 () Bool)

(assert (=> b!1304573 (= e!744140 e!744141)))

(declare-fun c!125253 () Bool)

(assert (=> b!1304573 (= c!125253 (and ((_ is Cons!29801) (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11361 (h!31010 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1304575 () Bool)

(assert (=> b!1304575 (= e!744141 None!759)))

(assert (= (and d!141733 c!125252) b!1304572))

(assert (= (and d!141733 (not c!125252)) b!1304573))

(assert (= (and b!1304573 c!125253) b!1304574))

(assert (= (and b!1304573 (not c!125253)) b!1304575))

(declare-fun m!1195067 () Bool)

(assert (=> b!1304574 m!1195067))

(assert (=> b!1304507 d!141733))

(declare-fun b!1304576 () Bool)

(declare-fun e!744145 () Bool)

(declare-fun e!744148 () Bool)

(assert (=> b!1304576 (= e!744145 e!744148)))

(declare-fun c!125254 () Bool)

(assert (=> b!1304576 (= c!125254 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(declare-fun b!1304577 () Bool)

(assert (=> b!1304577 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(assert (=> b!1304577 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42429 _values!1445)))))

(declare-fun lt!583731 () ListLongMap!20357)

(declare-fun e!744143 () Bool)

(assert (=> b!1304577 (= e!744143 (= (apply!1017 lt!583731 (select (arr!41878 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21177 (select (arr!41877 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304578 () Bool)

(declare-fun res!866389 () Bool)

(declare-fun e!744146 () Bool)

(assert (=> b!1304578 (=> (not res!866389) (not e!744146))))

(assert (=> b!1304578 (= res!866389 (not (contains!8262 lt!583731 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304579 () Bool)

(assert (=> b!1304579 (= e!744148 (= lt!583731 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304580 () Bool)

(declare-fun e!744147 () Bool)

(assert (=> b!1304580 (= e!744147 (validKeyInArray!0 (select (arr!41878 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1304580 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!141735 () Bool)

(assert (=> d!141735 e!744146))

(declare-fun res!866387 () Bool)

(assert (=> d!141735 (=> (not res!866387) (not e!744146))))

(assert (=> d!141735 (= res!866387 (not (contains!8262 lt!583731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!744144 () ListLongMap!20357)

(assert (=> d!141735 (= lt!583731 e!744144)))

(declare-fun c!125256 () Bool)

(assert (=> d!141735 (= c!125256 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(assert (=> d!141735 (validMask!0 mask!2175)))

(assert (=> d!141735 (= (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!583731)))

(declare-fun b!1304581 () Bool)

(assert (=> b!1304581 (= e!744148 (isEmpty!1072 lt!583731))))

(declare-fun b!1304582 () Bool)

(declare-fun lt!583735 () Unit!43037)

(declare-fun lt!583733 () Unit!43037)

(assert (=> b!1304582 (= lt!583735 lt!583733)))

(declare-fun lt!583730 () ListLongMap!20357)

(declare-fun lt!583734 () (_ BitVec 64))

(declare-fun lt!583729 () (_ BitVec 64))

(declare-fun lt!583732 () V!51673)

(assert (=> b!1304582 (not (contains!8262 (+!4520 lt!583730 (tuple2!22701 lt!583729 lt!583732)) lt!583734))))

(assert (=> b!1304582 (= lt!583733 (addStillNotContains!473 lt!583730 lt!583729 lt!583732 lt!583734))))

(assert (=> b!1304582 (= lt!583734 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304582 (= lt!583732 (get!21177 (select (arr!41877 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304582 (= lt!583729 (select (arr!41878 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(declare-fun call!64282 () ListLongMap!20357)

(assert (=> b!1304582 (= lt!583730 call!64282)))

(declare-fun e!744142 () ListLongMap!20357)

(assert (=> b!1304582 (= e!744142 (+!4520 call!64282 (tuple2!22701 (select (arr!41878 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21177 (select (arr!41877 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304583 () Bool)

(assert (=> b!1304583 (= e!744146 e!744145)))

(declare-fun c!125255 () Bool)

(assert (=> b!1304583 (= c!125255 e!744147)))

(declare-fun res!866388 () Bool)

(assert (=> b!1304583 (=> (not res!866388) (not e!744147))))

(assert (=> b!1304583 (= res!866388 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(declare-fun b!1304584 () Bool)

(assert (=> b!1304584 (= e!744145 e!744143)))

(assert (=> b!1304584 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(declare-fun res!866390 () Bool)

(assert (=> b!1304584 (= res!866390 (contains!8262 lt!583731 (select (arr!41878 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1304584 (=> (not res!866390) (not e!744143))))

(declare-fun b!1304585 () Bool)

(assert (=> b!1304585 (= e!744144 (ListLongMap!20358 Nil!29802))))

(declare-fun b!1304586 () Bool)

(assert (=> b!1304586 (= e!744142 call!64282)))

(declare-fun bm!64279 () Bool)

(assert (=> bm!64279 (= call!64282 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304587 () Bool)

(assert (=> b!1304587 (= e!744144 e!744142)))

(declare-fun c!125257 () Bool)

(assert (=> b!1304587 (= c!125257 (validKeyInArray!0 (select (arr!41878 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (= (and d!141735 c!125256) b!1304585))

(assert (= (and d!141735 (not c!125256)) b!1304587))

(assert (= (and b!1304587 c!125257) b!1304582))

(assert (= (and b!1304587 (not c!125257)) b!1304586))

(assert (= (or b!1304582 b!1304586) bm!64279))

(assert (= (and d!141735 res!866387) b!1304578))

(assert (= (and b!1304578 res!866389) b!1304583))

(assert (= (and b!1304583 res!866388) b!1304580))

(assert (= (and b!1304583 c!125255) b!1304584))

(assert (= (and b!1304583 (not c!125255)) b!1304576))

(assert (= (and b!1304584 res!866390) b!1304577))

(assert (= (and b!1304576 c!125254) b!1304579))

(assert (= (and b!1304576 (not c!125254)) b!1304581))

(declare-fun b_lambda!23309 () Bool)

(assert (=> (not b_lambda!23309) (not b!1304577)))

(assert (=> b!1304577 t!43401))

(declare-fun b_and!47461 () Bool)

(assert (= b_and!47459 (and (=> t!43401 result!23823) b_and!47461)))

(declare-fun b_lambda!23311 () Bool)

(assert (=> (not b_lambda!23311) (not b!1304582)))

(assert (=> b!1304582 t!43401))

(declare-fun b_and!47463 () Bool)

(assert (= b_and!47461 (and (=> t!43401 result!23823) b_and!47463)))

(declare-fun m!1195069 () Bool)

(assert (=> b!1304577 m!1195069))

(assert (=> b!1304577 m!1194957))

(declare-fun m!1195071 () Bool)

(assert (=> b!1304577 m!1195071))

(declare-fun m!1195073 () Bool)

(assert (=> b!1304577 m!1195073))

(assert (=> b!1304577 m!1195069))

(assert (=> b!1304577 m!1194957))

(assert (=> b!1304577 m!1195073))

(declare-fun m!1195075 () Bool)

(assert (=> b!1304577 m!1195075))

(assert (=> b!1304584 m!1195073))

(assert (=> b!1304584 m!1195073))

(declare-fun m!1195077 () Bool)

(assert (=> b!1304584 m!1195077))

(declare-fun m!1195079 () Bool)

(assert (=> bm!64279 m!1195079))

(declare-fun m!1195081 () Bool)

(assert (=> d!141735 m!1195081))

(assert (=> d!141735 m!1194841))

(assert (=> b!1304587 m!1195073))

(assert (=> b!1304587 m!1195073))

(declare-fun m!1195083 () Bool)

(assert (=> b!1304587 m!1195083))

(declare-fun m!1195085 () Bool)

(assert (=> b!1304582 m!1195085))

(assert (=> b!1304582 m!1195069))

(assert (=> b!1304582 m!1194957))

(assert (=> b!1304582 m!1195071))

(declare-fun m!1195087 () Bool)

(assert (=> b!1304582 m!1195087))

(declare-fun m!1195089 () Bool)

(assert (=> b!1304582 m!1195089))

(assert (=> b!1304582 m!1195087))

(declare-fun m!1195091 () Bool)

(assert (=> b!1304582 m!1195091))

(assert (=> b!1304582 m!1195073))

(assert (=> b!1304582 m!1195069))

(assert (=> b!1304582 m!1194957))

(assert (=> b!1304580 m!1195073))

(assert (=> b!1304580 m!1195073))

(assert (=> b!1304580 m!1195083))

(declare-fun m!1195093 () Bool)

(assert (=> b!1304581 m!1195093))

(assert (=> b!1304579 m!1195079))

(declare-fun m!1195095 () Bool)

(assert (=> b!1304578 m!1195095))

(assert (=> bm!64277 d!141735))

(assert (=> b!1304509 d!141731))

(assert (=> b!1304509 d!141733))

(declare-fun d!141737 () Bool)

(declare-fun e!744151 () Bool)

(assert (=> d!141737 e!744151))

(declare-fun res!866396 () Bool)

(assert (=> d!141737 (=> (not res!866396) (not e!744151))))

(declare-fun lt!583744 () ListLongMap!20357)

(assert (=> d!141737 (= res!866396 (contains!8262 lt!583744 (_1!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583745 () List!29805)

(assert (=> d!141737 (= lt!583744 (ListLongMap!20358 lt!583745))))

(declare-fun lt!583746 () Unit!43037)

(declare-fun lt!583747 () Unit!43037)

(assert (=> d!141737 (= lt!583746 lt!583747)))

(assert (=> d!141737 (= (getValueByKey!710 lt!583745 (_1!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!354 (List!29805 (_ BitVec 64) V!51673) Unit!43037)

(assert (=> d!141737 (= lt!583747 (lemmaContainsTupThenGetReturnValue!354 lt!583745 (_1!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!483 (List!29805 (_ BitVec 64) V!51673) List!29805)

(assert (=> d!141737 (= lt!583745 (insertStrictlySorted!483 (toList!10194 call!64271) (_1!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141737 (= (+!4520 call!64271 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583744)))

(declare-fun b!1304592 () Bool)

(declare-fun res!866395 () Bool)

(assert (=> b!1304592 (=> (not res!866395) (not e!744151))))

(assert (=> b!1304592 (= res!866395 (= (getValueByKey!710 (toList!10194 lt!583744) (_1!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!760 (_2!11361 (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1304593 () Bool)

(declare-fun contains!8266 (List!29805 tuple2!22700) Bool)

(assert (=> b!1304593 (= e!744151 (contains!8266 (toList!10194 lt!583744) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141737 res!866396) b!1304592))

(assert (= (and b!1304592 res!866395) b!1304593))

(declare-fun m!1195097 () Bool)

(assert (=> d!141737 m!1195097))

(declare-fun m!1195099 () Bool)

(assert (=> d!141737 m!1195099))

(declare-fun m!1195101 () Bool)

(assert (=> d!141737 m!1195101))

(declare-fun m!1195103 () Bool)

(assert (=> d!141737 m!1195103))

(declare-fun m!1195105 () Bool)

(assert (=> b!1304592 m!1195105))

(declare-fun m!1195107 () Bool)

(assert (=> b!1304593 m!1195107))

(assert (=> b!1304487 d!141737))

(declare-fun d!141739 () Bool)

(assert (=> d!141739 (= (validKeyInArray!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304503 d!141739))

(declare-fun d!141741 () Bool)

(assert (=> d!141741 (= (apply!1017 lt!583674 (select (arr!41878 _keys!1741) from!2144)) (get!21178 (getValueByKey!710 (toList!10194 lt!583674) (select (arr!41878 _keys!1741) from!2144))))))

(declare-fun bs!37128 () Bool)

(assert (= bs!37128 d!141741))

(assert (=> bs!37128 m!1194861))

(declare-fun m!1195109 () Bool)

(assert (=> bs!37128 m!1195109))

(assert (=> bs!37128 m!1195109))

(declare-fun m!1195111 () Bool)

(assert (=> bs!37128 m!1195111))

(assert (=> b!1304486 d!141741))

(declare-fun d!141743 () Bool)

(declare-fun c!125260 () Bool)

(assert (=> d!141743 (= c!125260 ((_ is ValueCellFull!16565) (select (arr!41877 _values!1445) from!2144)))))

(declare-fun e!744154 () V!51673)

(assert (=> d!141743 (= (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!744154)))

(declare-fun b!1304598 () Bool)

(declare-fun get!21179 (ValueCell!16565 V!51673) V!51673)

(assert (=> b!1304598 (= e!744154 (get!21179 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304599 () Bool)

(declare-fun get!21180 (ValueCell!16565 V!51673) V!51673)

(assert (=> b!1304599 (= e!744154 (get!21180 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141743 c!125260) b!1304598))

(assert (= (and d!141743 (not c!125260)) b!1304599))

(assert (=> b!1304598 m!1194959))

(assert (=> b!1304598 m!1194957))

(declare-fun m!1195113 () Bool)

(assert (=> b!1304598 m!1195113))

(assert (=> b!1304599 m!1194959))

(assert (=> b!1304599 m!1194957))

(declare-fun m!1195115 () Bool)

(assert (=> b!1304599 m!1195115))

(assert (=> b!1304486 d!141743))

(declare-fun d!141745 () Bool)

(declare-fun e!744155 () Bool)

(assert (=> d!141745 e!744155))

(declare-fun res!866397 () Bool)

(assert (=> d!141745 (=> res!866397 e!744155)))

(declare-fun lt!583749 () Bool)

(assert (=> d!141745 (= res!866397 (not lt!583749))))

(declare-fun lt!583748 () Bool)

(assert (=> d!141745 (= lt!583749 lt!583748)))

(declare-fun lt!583751 () Unit!43037)

(declare-fun e!744156 () Unit!43037)

(assert (=> d!141745 (= lt!583751 e!744156)))

(declare-fun c!125261 () Bool)

(assert (=> d!141745 (= c!125261 lt!583748)))

(assert (=> d!141745 (= lt!583748 (containsKey!727 (toList!10194 lt!583674) (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> d!141745 (= (contains!8262 lt!583674 (select (arr!41878 _keys!1741) from!2144)) lt!583749)))

(declare-fun b!1304600 () Bool)

(declare-fun lt!583750 () Unit!43037)

(assert (=> b!1304600 (= e!744156 lt!583750)))

(assert (=> b!1304600 (= lt!583750 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 lt!583674) (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> b!1304600 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583674) (select (arr!41878 _keys!1741) from!2144)))))

(declare-fun b!1304601 () Bool)

(declare-fun Unit!43048 () Unit!43037)

(assert (=> b!1304601 (= e!744156 Unit!43048)))

(declare-fun b!1304602 () Bool)

(assert (=> b!1304602 (= e!744155 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583674) (select (arr!41878 _keys!1741) from!2144))))))

(assert (= (and d!141745 c!125261) b!1304600))

(assert (= (and d!141745 (not c!125261)) b!1304601))

(assert (= (and d!141745 (not res!866397)) b!1304602))

(assert (=> d!141745 m!1194861))

(declare-fun m!1195117 () Bool)

(assert (=> d!141745 m!1195117))

(assert (=> b!1304600 m!1194861))

(declare-fun m!1195119 () Bool)

(assert (=> b!1304600 m!1195119))

(assert (=> b!1304600 m!1194861))

(assert (=> b!1304600 m!1195109))

(assert (=> b!1304600 m!1195109))

(declare-fun m!1195121 () Bool)

(assert (=> b!1304600 m!1195121))

(assert (=> b!1304602 m!1194861))

(assert (=> b!1304602 m!1195109))

(assert (=> b!1304602 m!1195109))

(assert (=> b!1304602 m!1195121))

(assert (=> b!1304472 d!141745))

(declare-fun d!141747 () Bool)

(assert (=> d!141747 (arrayContainsKey!0 _keys!1741 lt!583691 #b00000000000000000000000000000000)))

(declare-fun lt!583754 () Unit!43037)

(declare-fun choose!13 (array!86777 (_ BitVec 64) (_ BitVec 32)) Unit!43037)

(assert (=> d!141747 (= lt!583754 (choose!13 _keys!1741 lt!583691 #b00000000000000000000000000000000))))

(assert (=> d!141747 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141747 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583691 #b00000000000000000000000000000000) lt!583754)))

(declare-fun bs!37129 () Bool)

(assert (= bs!37129 d!141747))

(assert (=> bs!37129 m!1195001))

(declare-fun m!1195123 () Bool)

(assert (=> bs!37129 m!1195123))

(assert (=> b!1304504 d!141747))

(declare-fun d!141749 () Bool)

(declare-fun res!866402 () Bool)

(declare-fun e!744161 () Bool)

(assert (=> d!141749 (=> res!866402 e!744161)))

(assert (=> d!141749 (= res!866402 (= (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) lt!583691))))

(assert (=> d!141749 (= (arrayContainsKey!0 _keys!1741 lt!583691 #b00000000000000000000000000000000) e!744161)))

(declare-fun b!1304607 () Bool)

(declare-fun e!744162 () Bool)

(assert (=> b!1304607 (= e!744161 e!744162)))

(declare-fun res!866403 () Bool)

(assert (=> b!1304607 (=> (not res!866403) (not e!744162))))

(assert (=> b!1304607 (= res!866403 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(declare-fun b!1304608 () Bool)

(assert (=> b!1304608 (= e!744162 (arrayContainsKey!0 _keys!1741 lt!583691 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141749 (not res!866402)) b!1304607))

(assert (= (and b!1304607 res!866403) b!1304608))

(assert (=> d!141749 m!1194931))

(declare-fun m!1195125 () Bool)

(assert (=> b!1304608 m!1195125))

(assert (=> b!1304504 d!141749))

(declare-fun d!141751 () Bool)

(declare-fun lt!583761 () SeekEntryResult!10026)

(assert (=> d!141751 (and (or ((_ is Undefined!10026) lt!583761) (not ((_ is Found!10026) lt!583761)) (and (bvsge (index!42476 lt!583761) #b00000000000000000000000000000000) (bvslt (index!42476 lt!583761) (size!42430 _keys!1741)))) (or ((_ is Undefined!10026) lt!583761) ((_ is Found!10026) lt!583761) (not ((_ is MissingZero!10026) lt!583761)) (and (bvsge (index!42475 lt!583761) #b00000000000000000000000000000000) (bvslt (index!42475 lt!583761) (size!42430 _keys!1741)))) (or ((_ is Undefined!10026) lt!583761) ((_ is Found!10026) lt!583761) ((_ is MissingZero!10026) lt!583761) (not ((_ is MissingVacant!10026) lt!583761)) (and (bvsge (index!42478 lt!583761) #b00000000000000000000000000000000) (bvslt (index!42478 lt!583761) (size!42430 _keys!1741)))) (or ((_ is Undefined!10026) lt!583761) (ite ((_ is Found!10026) lt!583761) (= (select (arr!41878 _keys!1741) (index!42476 lt!583761)) (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10026) lt!583761) (= (select (arr!41878 _keys!1741) (index!42475 lt!583761)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10026) lt!583761) (= (select (arr!41878 _keys!1741) (index!42478 lt!583761)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!744169 () SeekEntryResult!10026)

(assert (=> d!141751 (= lt!583761 e!744169)))

(declare-fun c!125270 () Bool)

(declare-fun lt!583763 () SeekEntryResult!10026)

(assert (=> d!141751 (= c!125270 (and ((_ is Intermediate!10026) lt!583763) (undefined!10838 lt!583763)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86777 (_ BitVec 32)) SeekEntryResult!10026)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141751 (= lt!583763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141751 (validMask!0 mask!2175)))

(assert (=> d!141751 (= (seekEntryOrOpen!0 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!583761)))

(declare-fun b!1304621 () Bool)

(declare-fun c!125269 () Bool)

(declare-fun lt!583762 () (_ BitVec 64))

(assert (=> b!1304621 (= c!125269 (= lt!583762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!744171 () SeekEntryResult!10026)

(declare-fun e!744170 () SeekEntryResult!10026)

(assert (=> b!1304621 (= e!744171 e!744170)))

(declare-fun b!1304622 () Bool)

(assert (=> b!1304622 (= e!744169 Undefined!10026)))

(declare-fun b!1304623 () Bool)

(assert (=> b!1304623 (= e!744170 (MissingZero!10026 (index!42477 lt!583763)))))

(declare-fun b!1304624 () Bool)

(assert (=> b!1304624 (= e!744169 e!744171)))

(assert (=> b!1304624 (= lt!583762 (select (arr!41878 _keys!1741) (index!42477 lt!583763)))))

(declare-fun c!125268 () Bool)

(assert (=> b!1304624 (= c!125268 (= lt!583762 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304625 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86777 (_ BitVec 32)) SeekEntryResult!10026)

(assert (=> b!1304625 (= e!744170 (seekKeyOrZeroReturnVacant!0 (x!115857 lt!583763) (index!42477 lt!583763) (index!42477 lt!583763) (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1304626 () Bool)

(assert (=> b!1304626 (= e!744171 (Found!10026 (index!42477 lt!583763)))))

(assert (= (and d!141751 c!125270) b!1304622))

(assert (= (and d!141751 (not c!125270)) b!1304624))

(assert (= (and b!1304624 c!125268) b!1304626))

(assert (= (and b!1304624 (not c!125268)) b!1304621))

(assert (= (and b!1304621 c!125269) b!1304623))

(assert (= (and b!1304621 (not c!125269)) b!1304625))

(declare-fun m!1195127 () Bool)

(assert (=> d!141751 m!1195127))

(assert (=> d!141751 m!1194931))

(declare-fun m!1195129 () Bool)

(assert (=> d!141751 m!1195129))

(declare-fun m!1195131 () Bool)

(assert (=> d!141751 m!1195131))

(declare-fun m!1195133 () Bool)

(assert (=> d!141751 m!1195133))

(declare-fun m!1195135 () Bool)

(assert (=> d!141751 m!1195135))

(assert (=> d!141751 m!1194841))

(assert (=> d!141751 m!1194931))

(assert (=> d!141751 m!1195127))

(declare-fun m!1195137 () Bool)

(assert (=> b!1304624 m!1195137))

(assert (=> b!1304625 m!1194931))

(declare-fun m!1195139 () Bool)

(assert (=> b!1304625 m!1195139))

(assert (=> b!1304504 d!141751))

(declare-fun d!141753 () Bool)

(declare-fun e!744172 () Bool)

(assert (=> d!141753 e!744172))

(declare-fun res!866404 () Bool)

(assert (=> d!141753 (=> res!866404 e!744172)))

(declare-fun lt!583765 () Bool)

(assert (=> d!141753 (= res!866404 (not lt!583765))))

(declare-fun lt!583764 () Bool)

(assert (=> d!141753 (= lt!583765 lt!583764)))

(declare-fun lt!583767 () Unit!43037)

(declare-fun e!744173 () Unit!43037)

(assert (=> d!141753 (= lt!583767 e!744173)))

(declare-fun c!125271 () Bool)

(assert (=> d!141753 (= c!125271 lt!583764)))

(assert (=> d!141753 (= lt!583764 (containsKey!727 (toList!10194 lt!583714) (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> d!141753 (= (contains!8262 lt!583714 (select (arr!41878 _keys!1741) from!2144)) lt!583765)))

(declare-fun b!1304627 () Bool)

(declare-fun lt!583766 () Unit!43037)

(assert (=> b!1304627 (= e!744173 lt!583766)))

(assert (=> b!1304627 (= lt!583766 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 lt!583714) (select (arr!41878 _keys!1741) from!2144)))))

(assert (=> b!1304627 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583714) (select (arr!41878 _keys!1741) from!2144)))))

(declare-fun b!1304628 () Bool)

(declare-fun Unit!43049 () Unit!43037)

(assert (=> b!1304628 (= e!744173 Unit!43049)))

(declare-fun b!1304629 () Bool)

(assert (=> b!1304629 (= e!744172 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583714) (select (arr!41878 _keys!1741) from!2144))))))

(assert (= (and d!141753 c!125271) b!1304627))

(assert (= (and d!141753 (not c!125271)) b!1304628))

(assert (= (and d!141753 (not res!866404)) b!1304629))

(assert (=> d!141753 m!1194861))

(declare-fun m!1195141 () Bool)

(assert (=> d!141753 m!1195141))

(assert (=> b!1304627 m!1194861))

(declare-fun m!1195143 () Bool)

(assert (=> b!1304627 m!1195143))

(assert (=> b!1304627 m!1194861))

(declare-fun m!1195145 () Bool)

(assert (=> b!1304627 m!1195145))

(assert (=> b!1304627 m!1195145))

(declare-fun m!1195147 () Bool)

(assert (=> b!1304627 m!1195147))

(assert (=> b!1304629 m!1194861))

(assert (=> b!1304629 m!1195145))

(assert (=> b!1304629 m!1195145))

(assert (=> b!1304629 m!1195147))

(assert (=> b!1304542 d!141753))

(assert (=> d!141701 d!141699))

(declare-fun d!141755 () Bool)

(assert (=> d!141755 (not (contains!8262 (ListLongMap!20358 Nil!29802) k0!1205))))

(assert (=> d!141755 true))

(declare-fun _$29!201 () Unit!43037)

(assert (=> d!141755 (= (choose!1937 k0!1205) _$29!201)))

(declare-fun bs!37130 () Bool)

(assert (= bs!37130 d!141755))

(assert (=> bs!37130 m!1194847))

(assert (=> d!141701 d!141755))

(assert (=> b!1304538 d!141715))

(declare-fun d!141757 () Bool)

(declare-fun e!744174 () Bool)

(assert (=> d!141757 e!744174))

(declare-fun res!866406 () Bool)

(assert (=> d!141757 (=> (not res!866406) (not e!744174))))

(declare-fun lt!583768 () ListLongMap!20357)

(assert (=> d!141757 (= res!866406 (contains!8262 lt!583768 (_1!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!583769 () List!29805)

(assert (=> d!141757 (= lt!583768 (ListLongMap!20358 lt!583769))))

(declare-fun lt!583770 () Unit!43037)

(declare-fun lt!583771 () Unit!43037)

(assert (=> d!141757 (= lt!583770 lt!583771)))

(assert (=> d!141757 (= (getValueByKey!710 lt!583769 (_1!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!760 (_2!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141757 (= lt!583771 (lemmaContainsTupThenGetReturnValue!354 lt!583769 (_1!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141757 (= lt!583769 (insertStrictlySorted!483 (toList!10194 call!64280) (_1!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141757 (= (+!4520 call!64280 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!583768)))

(declare-fun b!1304630 () Bool)

(declare-fun res!866405 () Bool)

(assert (=> b!1304630 (=> (not res!866405) (not e!744174))))

(assert (=> b!1304630 (= res!866405 (= (getValueByKey!710 (toList!10194 lt!583768) (_1!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!760 (_2!11361 (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1304631 () Bool)

(assert (=> b!1304631 (= e!744174 (contains!8266 (toList!10194 lt!583768) (tuple2!22701 (select (arr!41878 _keys!1741) from!2144) (get!21177 (select (arr!41877 _values!1445) from!2144) (dynLambda!3455 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141757 res!866406) b!1304630))

(assert (= (and b!1304630 res!866405) b!1304631))

(declare-fun m!1195149 () Bool)

(assert (=> d!141757 m!1195149))

(declare-fun m!1195151 () Bool)

(assert (=> d!141757 m!1195151))

(declare-fun m!1195153 () Bool)

(assert (=> d!141757 m!1195153))

(declare-fun m!1195155 () Bool)

(assert (=> d!141757 m!1195155))

(declare-fun m!1195157 () Bool)

(assert (=> b!1304630 m!1195157))

(declare-fun m!1195159 () Bool)

(assert (=> b!1304631 m!1195159))

(assert (=> b!1304540 d!141757))

(declare-fun d!141759 () Bool)

(declare-fun e!744175 () Bool)

(assert (=> d!141759 e!744175))

(declare-fun res!866408 () Bool)

(assert (=> d!141759 (=> (not res!866408) (not e!744175))))

(declare-fun lt!583772 () ListLongMap!20357)

(assert (=> d!141759 (= res!866408 (contains!8262 lt!583772 (_1!11361 (tuple2!22701 lt!583712 lt!583715))))))

(declare-fun lt!583773 () List!29805)

(assert (=> d!141759 (= lt!583772 (ListLongMap!20358 lt!583773))))

(declare-fun lt!583774 () Unit!43037)

(declare-fun lt!583775 () Unit!43037)

(assert (=> d!141759 (= lt!583774 lt!583775)))

(assert (=> d!141759 (= (getValueByKey!710 lt!583773 (_1!11361 (tuple2!22701 lt!583712 lt!583715))) (Some!760 (_2!11361 (tuple2!22701 lt!583712 lt!583715))))))

(assert (=> d!141759 (= lt!583775 (lemmaContainsTupThenGetReturnValue!354 lt!583773 (_1!11361 (tuple2!22701 lt!583712 lt!583715)) (_2!11361 (tuple2!22701 lt!583712 lt!583715))))))

(assert (=> d!141759 (= lt!583773 (insertStrictlySorted!483 (toList!10194 lt!583713) (_1!11361 (tuple2!22701 lt!583712 lt!583715)) (_2!11361 (tuple2!22701 lt!583712 lt!583715))))))

(assert (=> d!141759 (= (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715)) lt!583772)))

(declare-fun b!1304632 () Bool)

(declare-fun res!866407 () Bool)

(assert (=> b!1304632 (=> (not res!866407) (not e!744175))))

(assert (=> b!1304632 (= res!866407 (= (getValueByKey!710 (toList!10194 lt!583772) (_1!11361 (tuple2!22701 lt!583712 lt!583715))) (Some!760 (_2!11361 (tuple2!22701 lt!583712 lt!583715)))))))

(declare-fun b!1304633 () Bool)

(assert (=> b!1304633 (= e!744175 (contains!8266 (toList!10194 lt!583772) (tuple2!22701 lt!583712 lt!583715)))))

(assert (= (and d!141759 res!866408) b!1304632))

(assert (= (and b!1304632 res!866407) b!1304633))

(declare-fun m!1195161 () Bool)

(assert (=> d!141759 m!1195161))

(declare-fun m!1195163 () Bool)

(assert (=> d!141759 m!1195163))

(declare-fun m!1195165 () Bool)

(assert (=> d!141759 m!1195165))

(declare-fun m!1195167 () Bool)

(assert (=> d!141759 m!1195167))

(declare-fun m!1195169 () Bool)

(assert (=> b!1304632 m!1195169))

(declare-fun m!1195171 () Bool)

(assert (=> b!1304633 m!1195171))

(assert (=> b!1304540 d!141759))

(declare-fun d!141761 () Bool)

(declare-fun e!744176 () Bool)

(assert (=> d!141761 e!744176))

(declare-fun res!866409 () Bool)

(assert (=> d!141761 (=> res!866409 e!744176)))

(declare-fun lt!583777 () Bool)

(assert (=> d!141761 (= res!866409 (not lt!583777))))

(declare-fun lt!583776 () Bool)

(assert (=> d!141761 (= lt!583777 lt!583776)))

(declare-fun lt!583779 () Unit!43037)

(declare-fun e!744177 () Unit!43037)

(assert (=> d!141761 (= lt!583779 e!744177)))

(declare-fun c!125272 () Bool)

(assert (=> d!141761 (= c!125272 lt!583776)))

(assert (=> d!141761 (= lt!583776 (containsKey!727 (toList!10194 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715))) lt!583717))))

(assert (=> d!141761 (= (contains!8262 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715)) lt!583717) lt!583777)))

(declare-fun b!1304634 () Bool)

(declare-fun lt!583778 () Unit!43037)

(assert (=> b!1304634 (= e!744177 lt!583778)))

(assert (=> b!1304634 (= lt!583778 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715))) lt!583717))))

(assert (=> b!1304634 (isDefined!517 (getValueByKey!710 (toList!10194 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715))) lt!583717))))

(declare-fun b!1304635 () Bool)

(declare-fun Unit!43050 () Unit!43037)

(assert (=> b!1304635 (= e!744177 Unit!43050)))

(declare-fun b!1304636 () Bool)

(assert (=> b!1304636 (= e!744176 (isDefined!517 (getValueByKey!710 (toList!10194 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715))) lt!583717)))))

(assert (= (and d!141761 c!125272) b!1304634))

(assert (= (and d!141761 (not c!125272)) b!1304635))

(assert (= (and d!141761 (not res!866409)) b!1304636))

(declare-fun m!1195173 () Bool)

(assert (=> d!141761 m!1195173))

(declare-fun m!1195175 () Bool)

(assert (=> b!1304634 m!1195175))

(declare-fun m!1195177 () Bool)

(assert (=> b!1304634 m!1195177))

(assert (=> b!1304634 m!1195177))

(declare-fun m!1195179 () Bool)

(assert (=> b!1304634 m!1195179))

(assert (=> b!1304636 m!1195177))

(assert (=> b!1304636 m!1195177))

(assert (=> b!1304636 m!1195179))

(assert (=> b!1304540 d!141761))

(declare-fun d!141763 () Bool)

(assert (=> d!141763 (not (contains!8262 (+!4520 lt!583713 (tuple2!22701 lt!583712 lt!583715)) lt!583717))))

(declare-fun lt!583782 () Unit!43037)

(declare-fun choose!1939 (ListLongMap!20357 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43037)

(assert (=> d!141763 (= lt!583782 (choose!1939 lt!583713 lt!583712 lt!583715 lt!583717))))

(declare-fun e!744180 () Bool)

(assert (=> d!141763 e!744180))

(declare-fun res!866412 () Bool)

(assert (=> d!141763 (=> (not res!866412) (not e!744180))))

(assert (=> d!141763 (= res!866412 (not (contains!8262 lt!583713 lt!583717)))))

(assert (=> d!141763 (= (addStillNotContains!473 lt!583713 lt!583712 lt!583715 lt!583717) lt!583782)))

(declare-fun b!1304640 () Bool)

(assert (=> b!1304640 (= e!744180 (not (= lt!583712 lt!583717)))))

(assert (= (and d!141763 res!866412) b!1304640))

(assert (=> d!141763 m!1195025))

(assert (=> d!141763 m!1195025))

(assert (=> d!141763 m!1195029))

(declare-fun m!1195181 () Bool)

(assert (=> d!141763 m!1195181))

(declare-fun m!1195183 () Bool)

(assert (=> d!141763 m!1195183))

(assert (=> b!1304540 d!141763))

(assert (=> b!1304540 d!141743))

(declare-fun d!141765 () Bool)

(declare-fun res!866417 () Bool)

(declare-fun e!744185 () Bool)

(assert (=> d!141765 (=> res!866417 e!744185)))

(assert (=> d!141765 (= res!866417 (and ((_ is Cons!29801) (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11361 (h!31010 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141765 (= (containsKey!727 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744185)))

(declare-fun b!1304645 () Bool)

(declare-fun e!744186 () Bool)

(assert (=> b!1304645 (= e!744185 e!744186)))

(declare-fun res!866418 () Bool)

(assert (=> b!1304645 (=> (not res!866418) (not e!744186))))

(assert (=> b!1304645 (= res!866418 (and (or (not ((_ is Cons!29801) (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11361 (h!31010 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29801) (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11361 (h!31010 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1304646 () Bool)

(assert (=> b!1304646 (= e!744186 (containsKey!727 (t!43395 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141765 (not res!866417)) b!1304645))

(assert (= (and b!1304645 res!866418) b!1304646))

(declare-fun m!1195185 () Bool)

(assert (=> b!1304646 m!1195185))

(assert (=> d!141711 d!141765))

(assert (=> d!141713 d!141703))

(declare-fun d!141767 () Bool)

(declare-fun e!744187 () Bool)

(assert (=> d!141767 e!744187))

(declare-fun res!866420 () Bool)

(assert (=> d!141767 (=> (not res!866420) (not e!744187))))

(declare-fun lt!583783 () ListLongMap!20357)

(assert (=> d!141767 (= res!866420 (contains!8262 lt!583783 (_1!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!583784 () List!29805)

(assert (=> d!141767 (= lt!583783 (ListLongMap!20358 lt!583784))))

(declare-fun lt!583785 () Unit!43037)

(declare-fun lt!583786 () Unit!43037)

(assert (=> d!141767 (= lt!583785 lt!583786)))

(assert (=> d!141767 (= (getValueByKey!710 lt!583784 (_1!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141767 (= lt!583786 (lemmaContainsTupThenGetReturnValue!354 lt!583784 (_1!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141767 (= lt!583784 (insertStrictlySorted!483 (toList!10194 (ite c!125224 call!64273 (ite c!125225 call!64270 call!64269))) (_1!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141767 (= (+!4520 (ite c!125224 call!64273 (ite c!125225 call!64270 call!64269)) (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!583783)))

(declare-fun b!1304647 () Bool)

(declare-fun res!866419 () Bool)

(assert (=> b!1304647 (=> (not res!866419) (not e!744187))))

(assert (=> b!1304647 (= res!866419 (= (getValueByKey!710 (toList!10194 lt!583783) (_1!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!760 (_2!11361 (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1304648 () Bool)

(assert (=> b!1304648 (= e!744187 (contains!8266 (toList!10194 lt!583783) (ite (or c!125224 c!125225) (tuple2!22701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141767 res!866420) b!1304647))

(assert (= (and b!1304647 res!866419) b!1304648))

(declare-fun m!1195187 () Bool)

(assert (=> d!141767 m!1195187))

(declare-fun m!1195189 () Bool)

(assert (=> d!141767 m!1195189))

(declare-fun m!1195191 () Bool)

(assert (=> d!141767 m!1195191))

(declare-fun m!1195193 () Bool)

(assert (=> d!141767 m!1195193))

(declare-fun m!1195195 () Bool)

(assert (=> b!1304647 m!1195195))

(declare-fun m!1195197 () Bool)

(assert (=> b!1304648 m!1195197))

(assert (=> bm!64269 d!141767))

(declare-fun d!141769 () Bool)

(declare-fun isEmpty!1074 (List!29805) Bool)

(assert (=> d!141769 (= (isEmpty!1072 lt!583714) (isEmpty!1074 (toList!10194 lt!583714)))))

(declare-fun bs!37131 () Bool)

(assert (= bs!37131 d!141769))

(declare-fun m!1195199 () Bool)

(assert (=> bs!37131 m!1195199))

(assert (=> b!1304539 d!141769))

(declare-fun d!141771 () Bool)

(declare-fun e!744188 () Bool)

(assert (=> d!141771 e!744188))

(declare-fun res!866421 () Bool)

(assert (=> d!141771 (=> res!866421 e!744188)))

(declare-fun lt!583788 () Bool)

(assert (=> d!141771 (= res!866421 (not lt!583788))))

(declare-fun lt!583787 () Bool)

(assert (=> d!141771 (= lt!583788 lt!583787)))

(declare-fun lt!583790 () Unit!43037)

(declare-fun e!744189 () Unit!43037)

(assert (=> d!141771 (= lt!583790 e!744189)))

(declare-fun c!125273 () Bool)

(assert (=> d!141771 (= c!125273 lt!583787)))

(assert (=> d!141771 (= lt!583787 (containsKey!727 (toList!10194 lt!583714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141771 (= (contains!8262 lt!583714 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583788)))

(declare-fun b!1304649 () Bool)

(declare-fun lt!583789 () Unit!43037)

(assert (=> b!1304649 (= e!744189 lt!583789)))

(assert (=> b!1304649 (= lt!583789 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 lt!583714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304649 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304650 () Bool)

(declare-fun Unit!43051 () Unit!43037)

(assert (=> b!1304650 (= e!744189 Unit!43051)))

(declare-fun b!1304651 () Bool)

(assert (=> b!1304651 (= e!744188 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141771 c!125273) b!1304649))

(assert (= (and d!141771 (not c!125273)) b!1304650))

(assert (= (and d!141771 (not res!866421)) b!1304651))

(declare-fun m!1195201 () Bool)

(assert (=> d!141771 m!1195201))

(declare-fun m!1195203 () Bool)

(assert (=> b!1304649 m!1195203))

(declare-fun m!1195205 () Bool)

(assert (=> b!1304649 m!1195205))

(assert (=> b!1304649 m!1195205))

(declare-fun m!1195207 () Bool)

(assert (=> b!1304649 m!1195207))

(assert (=> b!1304651 m!1195205))

(assert (=> b!1304651 m!1195205))

(assert (=> b!1304651 m!1195207))

(assert (=> b!1304536 d!141771))

(declare-fun d!141773 () Bool)

(assert (=> d!141773 (= (apply!1017 lt!583714 (select (arr!41878 _keys!1741) from!2144)) (get!21178 (getValueByKey!710 (toList!10194 lt!583714) (select (arr!41878 _keys!1741) from!2144))))))

(declare-fun bs!37132 () Bool)

(assert (= bs!37132 d!141773))

(assert (=> bs!37132 m!1194861))

(assert (=> bs!37132 m!1195145))

(assert (=> bs!37132 m!1195145))

(declare-fun m!1195209 () Bool)

(assert (=> bs!37132 m!1195209))

(assert (=> b!1304535 d!141773))

(assert (=> b!1304535 d!141743))

(assert (=> b!1304537 d!141735))

(declare-fun d!141775 () Bool)

(declare-fun res!866422 () Bool)

(declare-fun e!744190 () Bool)

(assert (=> d!141775 (=> res!866422 e!744190)))

(assert (=> d!141775 (= res!866422 (and ((_ is Cons!29801) (toList!10194 (ListLongMap!20358 Nil!29802))) (= (_1!11361 (h!31010 (toList!10194 (ListLongMap!20358 Nil!29802)))) k0!1205)))))

(assert (=> d!141775 (= (containsKey!727 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205) e!744190)))

(declare-fun b!1304652 () Bool)

(declare-fun e!744191 () Bool)

(assert (=> b!1304652 (= e!744190 e!744191)))

(declare-fun res!866423 () Bool)

(assert (=> b!1304652 (=> (not res!866423) (not e!744191))))

(assert (=> b!1304652 (= res!866423 (and (or (not ((_ is Cons!29801) (toList!10194 (ListLongMap!20358 Nil!29802)))) (bvsle (_1!11361 (h!31010 (toList!10194 (ListLongMap!20358 Nil!29802)))) k0!1205)) ((_ is Cons!29801) (toList!10194 (ListLongMap!20358 Nil!29802))) (bvslt (_1!11361 (h!31010 (toList!10194 (ListLongMap!20358 Nil!29802)))) k0!1205)))))

(declare-fun b!1304653 () Bool)

(assert (=> b!1304653 (= e!744191 (containsKey!727 (t!43395 (toList!10194 (ListLongMap!20358 Nil!29802))) k0!1205))))

(assert (= (and d!141775 (not res!866422)) b!1304652))

(assert (= (and b!1304652 res!866423) b!1304653))

(declare-fun m!1195211 () Bool)

(assert (=> b!1304653 m!1195211))

(assert (=> d!141699 d!141775))

(declare-fun d!141777 () Bool)

(declare-fun res!866424 () Bool)

(declare-fun e!744192 () Bool)

(assert (=> d!141777 (=> res!866424 e!744192)))

(assert (=> d!141777 (= res!866424 (and ((_ is Cons!29801) (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11361 (h!31010 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141777 (= (containsKey!727 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744192)))

(declare-fun b!1304654 () Bool)

(declare-fun e!744193 () Bool)

(assert (=> b!1304654 (= e!744192 e!744193)))

(declare-fun res!866425 () Bool)

(assert (=> b!1304654 (=> (not res!866425) (not e!744193))))

(assert (=> b!1304654 (= res!866425 (and (or (not ((_ is Cons!29801) (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11361 (h!31010 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29801) (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11361 (h!31010 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1304655 () Bool)

(assert (=> b!1304655 (= e!744193 (containsKey!727 (t!43395 (toList!10194 (getCurrentListMapNoExtraKeys!6154 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141777 (not res!866424)) b!1304654))

(assert (= (and b!1304654 res!866425) b!1304655))

(declare-fun m!1195213 () Bool)

(assert (=> b!1304655 m!1195213))

(assert (=> d!141719 d!141777))

(declare-fun d!141779 () Bool)

(declare-fun e!744194 () Bool)

(assert (=> d!141779 e!744194))

(declare-fun res!866426 () Bool)

(assert (=> d!141779 (=> res!866426 e!744194)))

(declare-fun lt!583792 () Bool)

(assert (=> d!141779 (= res!866426 (not lt!583792))))

(declare-fun lt!583791 () Bool)

(assert (=> d!141779 (= lt!583792 lt!583791)))

(declare-fun lt!583794 () Unit!43037)

(declare-fun e!744195 () Unit!43037)

(assert (=> d!141779 (= lt!583794 e!744195)))

(declare-fun c!125274 () Bool)

(assert (=> d!141779 (= c!125274 lt!583791)))

(assert (=> d!141779 (= lt!583791 (containsKey!727 (toList!10194 lt!583714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141779 (= (contains!8262 lt!583714 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583792)))

(declare-fun b!1304656 () Bool)

(declare-fun lt!583793 () Unit!43037)

(assert (=> b!1304656 (= e!744195 lt!583793)))

(assert (=> b!1304656 (= lt!583793 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 lt!583714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304656 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304657 () Bool)

(declare-fun Unit!43052 () Unit!43037)

(assert (=> b!1304657 (= e!744195 Unit!43052)))

(declare-fun b!1304658 () Bool)

(assert (=> b!1304658 (= e!744194 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141779 c!125274) b!1304656))

(assert (= (and d!141779 (not c!125274)) b!1304657))

(assert (= (and d!141779 (not res!866426)) b!1304658))

(declare-fun m!1195215 () Bool)

(assert (=> d!141779 m!1195215))

(declare-fun m!1195217 () Bool)

(assert (=> b!1304656 m!1195217))

(declare-fun m!1195219 () Bool)

(assert (=> b!1304656 m!1195219))

(assert (=> b!1304656 m!1195219))

(declare-fun m!1195221 () Bool)

(assert (=> b!1304656 m!1195221))

(assert (=> b!1304658 m!1195219))

(assert (=> b!1304658 m!1195219))

(assert (=> b!1304658 m!1195221))

(assert (=> d!141721 d!141779))

(assert (=> d!141721 d!141703))

(declare-fun b!1304659 () Bool)

(declare-fun e!744197 () Bool)

(assert (=> b!1304659 (= e!744197 (contains!8265 (ite c!125210 (Cons!29802 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) Nil!29803) Nil!29803) (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1304660 () Bool)

(declare-fun e!744198 () Bool)

(declare-fun call!64283 () Bool)

(assert (=> b!1304660 (= e!744198 call!64283)))

(declare-fun d!141781 () Bool)

(declare-fun res!866427 () Bool)

(declare-fun e!744199 () Bool)

(assert (=> d!141781 (=> res!866427 e!744199)))

(assert (=> d!141781 (= res!866427 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42430 _keys!1741)))))

(assert (=> d!141781 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125210 (Cons!29802 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) Nil!29803) Nil!29803)) e!744199)))

(declare-fun b!1304661 () Bool)

(declare-fun e!744196 () Bool)

(assert (=> b!1304661 (= e!744196 e!744198)))

(declare-fun c!125275 () Bool)

(assert (=> b!1304661 (= c!125275 (validKeyInArray!0 (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1304662 () Bool)

(assert (=> b!1304662 (= e!744199 e!744196)))

(declare-fun res!866429 () Bool)

(assert (=> b!1304662 (=> (not res!866429) (not e!744196))))

(assert (=> b!1304662 (= res!866429 (not e!744197))))

(declare-fun res!866428 () Bool)

(assert (=> b!1304662 (=> (not res!866428) (not e!744197))))

(assert (=> b!1304662 (= res!866428 (validKeyInArray!0 (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1304663 () Bool)

(assert (=> b!1304663 (= e!744198 call!64283)))

(declare-fun bm!64280 () Bool)

(assert (=> bm!64280 (= call!64283 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125275 (Cons!29802 (select (arr!41878 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125210 (Cons!29802 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) Nil!29803) Nil!29803)) (ite c!125210 (Cons!29802 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000) Nil!29803) Nil!29803))))))

(assert (= (and d!141781 (not res!866427)) b!1304662))

(assert (= (and b!1304662 res!866428) b!1304659))

(assert (= (and b!1304662 res!866429) b!1304661))

(assert (= (and b!1304661 c!125275) b!1304660))

(assert (= (and b!1304661 (not c!125275)) b!1304663))

(assert (= (or b!1304660 b!1304663) bm!64280))

(assert (=> b!1304659 m!1195049))

(assert (=> b!1304659 m!1195049))

(declare-fun m!1195223 () Bool)

(assert (=> b!1304659 m!1195223))

(assert (=> b!1304661 m!1195049))

(assert (=> b!1304661 m!1195049))

(assert (=> b!1304661 m!1195051))

(assert (=> b!1304662 m!1195049))

(assert (=> b!1304662 m!1195049))

(assert (=> b!1304662 m!1195051))

(assert (=> bm!64280 m!1195049))

(declare-fun m!1195225 () Bool)

(assert (=> bm!64280 m!1195225))

(assert (=> bm!64250 d!141781))

(declare-fun d!141783 () Bool)

(assert (=> d!141783 (= (apply!1017 lt!583674 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21178 (getValueByKey!710 (toList!10194 lt!583674) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37133 () Bool)

(assert (= bs!37133 d!141783))

(assert (=> bs!37133 m!1195041))

(assert (=> bs!37133 m!1195041))

(declare-fun m!1195227 () Bool)

(assert (=> bs!37133 m!1195227))

(assert (=> b!1304479 d!141783))

(declare-fun d!141785 () Bool)

(assert (=> d!141785 (= (isDefined!517 (getValueByKey!710 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205)) (not (isEmpty!1073 (getValueByKey!710 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))))

(declare-fun bs!37134 () Bool)

(assert (= bs!37134 d!141785))

(assert (=> bs!37134 m!1194925))

(declare-fun m!1195229 () Bool)

(assert (=> bs!37134 m!1195229))

(assert (=> b!1304411 d!141785))

(declare-fun b!1304666 () Bool)

(declare-fun e!744201 () Option!761)

(assert (=> b!1304666 (= e!744201 (getValueByKey!710 (t!43395 (toList!10194 (ListLongMap!20358 Nil!29802))) k0!1205))))

(declare-fun b!1304664 () Bool)

(declare-fun e!744200 () Option!761)

(assert (=> b!1304664 (= e!744200 (Some!760 (_2!11361 (h!31010 (toList!10194 (ListLongMap!20358 Nil!29802))))))))

(declare-fun d!141787 () Bool)

(declare-fun c!125276 () Bool)

(assert (=> d!141787 (= c!125276 (and ((_ is Cons!29801) (toList!10194 (ListLongMap!20358 Nil!29802))) (= (_1!11361 (h!31010 (toList!10194 (ListLongMap!20358 Nil!29802)))) k0!1205)))))

(assert (=> d!141787 (= (getValueByKey!710 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205) e!744200)))

(declare-fun b!1304665 () Bool)

(assert (=> b!1304665 (= e!744200 e!744201)))

(declare-fun c!125277 () Bool)

(assert (=> b!1304665 (= c!125277 (and ((_ is Cons!29801) (toList!10194 (ListLongMap!20358 Nil!29802))) (not (= (_1!11361 (h!31010 (toList!10194 (ListLongMap!20358 Nil!29802)))) k0!1205))))))

(declare-fun b!1304667 () Bool)

(assert (=> b!1304667 (= e!744201 None!759)))

(assert (= (and d!141787 c!125276) b!1304664))

(assert (= (and d!141787 (not c!125276)) b!1304665))

(assert (= (and b!1304665 c!125277) b!1304666))

(assert (= (and b!1304665 (not c!125277)) b!1304667))

(declare-fun m!1195231 () Bool)

(assert (=> b!1304666 m!1195231))

(assert (=> b!1304411 d!141787))

(assert (=> b!1304425 d!141739))

(declare-fun d!141789 () Bool)

(assert (=> d!141789 (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583795 () Unit!43037)

(assert (=> d!141789 (= lt!583795 (choose!1938 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744202 () Bool)

(assert (=> d!141789 e!744202))

(declare-fun res!866430 () Bool)

(assert (=> d!141789 (=> (not res!866430) (not e!744202))))

(assert (=> d!141789 (= res!866430 (isStrictlySorted!870 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141789 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583795)))

(declare-fun b!1304668 () Bool)

(assert (=> b!1304668 (= e!744202 (containsKey!727 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141789 res!866430) b!1304668))

(assert (=> d!141789 m!1194943))

(assert (=> d!141789 m!1194943))

(assert (=> d!141789 m!1194945))

(declare-fun m!1195233 () Bool)

(assert (=> d!141789 m!1195233))

(declare-fun m!1195235 () Bool)

(assert (=> d!141789 m!1195235))

(assert (=> b!1304668 m!1194939))

(assert (=> b!1304427 d!141789))

(declare-fun d!141791 () Bool)

(assert (=> d!141791 (= (isDefined!517 (getValueByKey!710 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1073 (getValueByKey!710 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37135 () Bool)

(assert (= bs!37135 d!141791))

(assert (=> bs!37135 m!1194943))

(declare-fun m!1195237 () Bool)

(assert (=> bs!37135 m!1195237))

(assert (=> b!1304427 d!141791))

(declare-fun e!744204 () Option!761)

(declare-fun b!1304671 () Bool)

(assert (=> b!1304671 (= e!744204 (getValueByKey!710 (t!43395 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1304669 () Bool)

(declare-fun e!744203 () Option!761)

(assert (=> b!1304669 (= e!744203 (Some!760 (_2!11361 (h!31010 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun d!141793 () Bool)

(declare-fun c!125278 () Bool)

(assert (=> d!141793 (= c!125278 (and ((_ is Cons!29801) (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11361 (h!31010 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141793 (= (getValueByKey!710 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744203)))

(declare-fun b!1304670 () Bool)

(assert (=> b!1304670 (= e!744203 e!744204)))

(declare-fun c!125279 () Bool)

(assert (=> b!1304670 (= c!125279 (and ((_ is Cons!29801) (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11361 (h!31010 (toList!10194 (getCurrentListMap!5094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1304672 () Bool)

(assert (=> b!1304672 (= e!744204 None!759)))

(assert (= (and d!141793 c!125278) b!1304669))

(assert (= (and d!141793 (not c!125278)) b!1304670))

(assert (= (and b!1304670 c!125279) b!1304671))

(assert (= (and b!1304670 (not c!125279)) b!1304672))

(declare-fun m!1195239 () Bool)

(assert (=> b!1304671 m!1195239))

(assert (=> b!1304427 d!141793))

(declare-fun d!141795 () Bool)

(declare-fun e!744205 () Bool)

(assert (=> d!141795 e!744205))

(declare-fun res!866432 () Bool)

(assert (=> d!141795 (=> (not res!866432) (not e!744205))))

(declare-fun lt!583796 () ListLongMap!20357)

(assert (=> d!141795 (= res!866432 (contains!8262 lt!583796 (_1!11361 (tuple2!22701 lt!583667 zeroValue!1387))))))

(declare-fun lt!583797 () List!29805)

(assert (=> d!141795 (= lt!583796 (ListLongMap!20358 lt!583797))))

(declare-fun lt!583798 () Unit!43037)

(declare-fun lt!583799 () Unit!43037)

(assert (=> d!141795 (= lt!583798 lt!583799)))

(assert (=> d!141795 (= (getValueByKey!710 lt!583797 (_1!11361 (tuple2!22701 lt!583667 zeroValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583667 zeroValue!1387))))))

(assert (=> d!141795 (= lt!583799 (lemmaContainsTupThenGetReturnValue!354 lt!583797 (_1!11361 (tuple2!22701 lt!583667 zeroValue!1387)) (_2!11361 (tuple2!22701 lt!583667 zeroValue!1387))))))

(assert (=> d!141795 (= lt!583797 (insertStrictlySorted!483 (toList!10194 lt!583669) (_1!11361 (tuple2!22701 lt!583667 zeroValue!1387)) (_2!11361 (tuple2!22701 lt!583667 zeroValue!1387))))))

(assert (=> d!141795 (= (+!4520 lt!583669 (tuple2!22701 lt!583667 zeroValue!1387)) lt!583796)))

(declare-fun b!1304673 () Bool)

(declare-fun res!866431 () Bool)

(assert (=> b!1304673 (=> (not res!866431) (not e!744205))))

(assert (=> b!1304673 (= res!866431 (= (getValueByKey!710 (toList!10194 lt!583796) (_1!11361 (tuple2!22701 lt!583667 zeroValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583667 zeroValue!1387)))))))

(declare-fun b!1304674 () Bool)

(assert (=> b!1304674 (= e!744205 (contains!8266 (toList!10194 lt!583796) (tuple2!22701 lt!583667 zeroValue!1387)))))

(assert (= (and d!141795 res!866432) b!1304673))

(assert (= (and b!1304673 res!866431) b!1304674))

(declare-fun m!1195241 () Bool)

(assert (=> d!141795 m!1195241))

(declare-fun m!1195243 () Bool)

(assert (=> d!141795 m!1195243))

(declare-fun m!1195245 () Bool)

(assert (=> d!141795 m!1195245))

(declare-fun m!1195247 () Bool)

(assert (=> d!141795 m!1195247))

(declare-fun m!1195249 () Bool)

(assert (=> b!1304673 m!1195249))

(declare-fun m!1195251 () Bool)

(assert (=> b!1304674 m!1195251))

(assert (=> b!1304476 d!141795))

(declare-fun d!141797 () Bool)

(assert (=> d!141797 (= (apply!1017 (+!4520 lt!583678 (tuple2!22701 lt!583671 minValue!1387)) lt!583670) (apply!1017 lt!583678 lt!583670))))

(declare-fun lt!583802 () Unit!43037)

(declare-fun choose!1940 (ListLongMap!20357 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43037)

(assert (=> d!141797 (= lt!583802 (choose!1940 lt!583678 lt!583671 minValue!1387 lt!583670))))

(declare-fun e!744208 () Bool)

(assert (=> d!141797 e!744208))

(declare-fun res!866435 () Bool)

(assert (=> d!141797 (=> (not res!866435) (not e!744208))))

(assert (=> d!141797 (= res!866435 (contains!8262 lt!583678 lt!583670))))

(assert (=> d!141797 (= (addApplyDifferent!555 lt!583678 lt!583671 minValue!1387 lt!583670) lt!583802)))

(declare-fun b!1304678 () Bool)

(assert (=> b!1304678 (= e!744208 (not (= lt!583670 lt!583671)))))

(assert (= (and d!141797 res!866435) b!1304678))

(assert (=> d!141797 m!1194989))

(assert (=> d!141797 m!1194965))

(assert (=> d!141797 m!1194967))

(declare-fun m!1195253 () Bool)

(assert (=> d!141797 m!1195253))

(assert (=> d!141797 m!1194965))

(declare-fun m!1195255 () Bool)

(assert (=> d!141797 m!1195255))

(assert (=> b!1304476 d!141797))

(declare-fun d!141799 () Bool)

(assert (=> d!141799 (= (apply!1017 lt!583678 lt!583670) (get!21178 (getValueByKey!710 (toList!10194 lt!583678) lt!583670)))))

(declare-fun bs!37136 () Bool)

(assert (= bs!37136 d!141799))

(declare-fun m!1195257 () Bool)

(assert (=> bs!37136 m!1195257))

(assert (=> bs!37136 m!1195257))

(declare-fun m!1195259 () Bool)

(assert (=> bs!37136 m!1195259))

(assert (=> b!1304476 d!141799))

(declare-fun d!141801 () Bool)

(assert (=> d!141801 (= (apply!1017 (+!4520 lt!583679 (tuple2!22701 lt!583665 minValue!1387)) lt!583684) (apply!1017 lt!583679 lt!583684))))

(declare-fun lt!583803 () Unit!43037)

(assert (=> d!141801 (= lt!583803 (choose!1940 lt!583679 lt!583665 minValue!1387 lt!583684))))

(declare-fun e!744209 () Bool)

(assert (=> d!141801 e!744209))

(declare-fun res!866436 () Bool)

(assert (=> d!141801 (=> (not res!866436) (not e!744209))))

(assert (=> d!141801 (= res!866436 (contains!8262 lt!583679 lt!583684))))

(assert (=> d!141801 (= (addApplyDifferent!555 lt!583679 lt!583665 minValue!1387 lt!583684) lt!583803)))

(declare-fun b!1304679 () Bool)

(assert (=> b!1304679 (= e!744209 (not (= lt!583684 lt!583665)))))

(assert (= (and d!141801 res!866436) b!1304679))

(assert (=> d!141801 m!1194983))

(assert (=> d!141801 m!1194977))

(assert (=> d!141801 m!1194987))

(declare-fun m!1195261 () Bool)

(assert (=> d!141801 m!1195261))

(assert (=> d!141801 m!1194977))

(declare-fun m!1195263 () Bool)

(assert (=> d!141801 m!1195263))

(assert (=> b!1304476 d!141801))

(declare-fun d!141803 () Bool)

(assert (=> d!141803 (= (apply!1017 (+!4520 lt!583669 (tuple2!22701 lt!583667 zeroValue!1387)) lt!583668) (get!21178 (getValueByKey!710 (toList!10194 (+!4520 lt!583669 (tuple2!22701 lt!583667 zeroValue!1387))) lt!583668)))))

(declare-fun bs!37137 () Bool)

(assert (= bs!37137 d!141803))

(declare-fun m!1195265 () Bool)

(assert (=> bs!37137 m!1195265))

(assert (=> bs!37137 m!1195265))

(declare-fun m!1195267 () Bool)

(assert (=> bs!37137 m!1195267))

(assert (=> b!1304476 d!141803))

(declare-fun d!141805 () Bool)

(declare-fun e!744210 () Bool)

(assert (=> d!141805 e!744210))

(declare-fun res!866438 () Bool)

(assert (=> d!141805 (=> (not res!866438) (not e!744210))))

(declare-fun lt!583804 () ListLongMap!20357)

(assert (=> d!141805 (= res!866438 (contains!8262 lt!583804 (_1!11361 (tuple2!22701 lt!583671 minValue!1387))))))

(declare-fun lt!583805 () List!29805)

(assert (=> d!141805 (= lt!583804 (ListLongMap!20358 lt!583805))))

(declare-fun lt!583806 () Unit!43037)

(declare-fun lt!583807 () Unit!43037)

(assert (=> d!141805 (= lt!583806 lt!583807)))

(assert (=> d!141805 (= (getValueByKey!710 lt!583805 (_1!11361 (tuple2!22701 lt!583671 minValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583671 minValue!1387))))))

(assert (=> d!141805 (= lt!583807 (lemmaContainsTupThenGetReturnValue!354 lt!583805 (_1!11361 (tuple2!22701 lt!583671 minValue!1387)) (_2!11361 (tuple2!22701 lt!583671 minValue!1387))))))

(assert (=> d!141805 (= lt!583805 (insertStrictlySorted!483 (toList!10194 lt!583678) (_1!11361 (tuple2!22701 lt!583671 minValue!1387)) (_2!11361 (tuple2!22701 lt!583671 minValue!1387))))))

(assert (=> d!141805 (= (+!4520 lt!583678 (tuple2!22701 lt!583671 minValue!1387)) lt!583804)))

(declare-fun b!1304680 () Bool)

(declare-fun res!866437 () Bool)

(assert (=> b!1304680 (=> (not res!866437) (not e!744210))))

(assert (=> b!1304680 (= res!866437 (= (getValueByKey!710 (toList!10194 lt!583804) (_1!11361 (tuple2!22701 lt!583671 minValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583671 minValue!1387)))))))

(declare-fun b!1304681 () Bool)

(assert (=> b!1304681 (= e!744210 (contains!8266 (toList!10194 lt!583804) (tuple2!22701 lt!583671 minValue!1387)))))

(assert (= (and d!141805 res!866438) b!1304680))

(assert (= (and b!1304680 res!866437) b!1304681))

(declare-fun m!1195269 () Bool)

(assert (=> d!141805 m!1195269))

(declare-fun m!1195271 () Bool)

(assert (=> d!141805 m!1195271))

(declare-fun m!1195273 () Bool)

(assert (=> d!141805 m!1195273))

(declare-fun m!1195275 () Bool)

(assert (=> d!141805 m!1195275))

(declare-fun m!1195277 () Bool)

(assert (=> b!1304680 m!1195277))

(declare-fun m!1195279 () Bool)

(assert (=> b!1304681 m!1195279))

(assert (=> b!1304476 d!141805))

(declare-fun d!141807 () Bool)

(assert (=> d!141807 (= (apply!1017 (+!4520 lt!583669 (tuple2!22701 lt!583667 zeroValue!1387)) lt!583668) (apply!1017 lt!583669 lt!583668))))

(declare-fun lt!583808 () Unit!43037)

(assert (=> d!141807 (= lt!583808 (choose!1940 lt!583669 lt!583667 zeroValue!1387 lt!583668))))

(declare-fun e!744211 () Bool)

(assert (=> d!141807 e!744211))

(declare-fun res!866439 () Bool)

(assert (=> d!141807 (=> (not res!866439) (not e!744211))))

(assert (=> d!141807 (= res!866439 (contains!8262 lt!583669 lt!583668))))

(assert (=> d!141807 (= (addApplyDifferent!555 lt!583669 lt!583667 zeroValue!1387 lt!583668) lt!583808)))

(declare-fun b!1304682 () Bool)

(assert (=> b!1304682 (= e!744211 (not (= lt!583668 lt!583667)))))

(assert (= (and d!141807 res!866439) b!1304682))

(assert (=> d!141807 m!1194981))

(assert (=> d!141807 m!1194969))

(assert (=> d!141807 m!1194973))

(declare-fun m!1195281 () Bool)

(assert (=> d!141807 m!1195281))

(assert (=> d!141807 m!1194969))

(declare-fun m!1195283 () Bool)

(assert (=> d!141807 m!1195283))

(assert (=> b!1304476 d!141807))

(declare-fun d!141809 () Bool)

(assert (=> d!141809 (= (apply!1017 (+!4520 lt!583679 (tuple2!22701 lt!583665 minValue!1387)) lt!583684) (get!21178 (getValueByKey!710 (toList!10194 (+!4520 lt!583679 (tuple2!22701 lt!583665 minValue!1387))) lt!583684)))))

(declare-fun bs!37138 () Bool)

(assert (= bs!37138 d!141809))

(declare-fun m!1195285 () Bool)

(assert (=> bs!37138 m!1195285))

(assert (=> bs!37138 m!1195285))

(declare-fun m!1195287 () Bool)

(assert (=> bs!37138 m!1195287))

(assert (=> b!1304476 d!141809))

(assert (=> b!1304476 d!141721))

(declare-fun d!141811 () Bool)

(assert (=> d!141811 (contains!8262 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387)) lt!583676)))

(declare-fun lt!583811 () Unit!43037)

(declare-fun choose!1941 (ListLongMap!20357 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43037)

(assert (=> d!141811 (= lt!583811 (choose!1941 lt!583673 lt!583663 zeroValue!1387 lt!583676))))

(assert (=> d!141811 (contains!8262 lt!583673 lt!583676)))

(assert (=> d!141811 (= (addStillContains!1112 lt!583673 lt!583663 zeroValue!1387 lt!583676) lt!583811)))

(declare-fun bs!37139 () Bool)

(assert (= bs!37139 d!141811))

(assert (=> bs!37139 m!1194979))

(assert (=> bs!37139 m!1194979))

(assert (=> bs!37139 m!1194993))

(declare-fun m!1195289 () Bool)

(assert (=> bs!37139 m!1195289))

(declare-fun m!1195291 () Bool)

(assert (=> bs!37139 m!1195291))

(assert (=> b!1304476 d!141811))

(declare-fun d!141813 () Bool)

(assert (=> d!141813 (= (apply!1017 lt!583669 lt!583668) (get!21178 (getValueByKey!710 (toList!10194 lt!583669) lt!583668)))))

(declare-fun bs!37140 () Bool)

(assert (= bs!37140 d!141813))

(declare-fun m!1195293 () Bool)

(assert (=> bs!37140 m!1195293))

(assert (=> bs!37140 m!1195293))

(declare-fun m!1195295 () Bool)

(assert (=> bs!37140 m!1195295))

(assert (=> b!1304476 d!141813))

(declare-fun d!141815 () Bool)

(declare-fun e!744212 () Bool)

(assert (=> d!141815 e!744212))

(declare-fun res!866441 () Bool)

(assert (=> d!141815 (=> (not res!866441) (not e!744212))))

(declare-fun lt!583812 () ListLongMap!20357)

(assert (=> d!141815 (= res!866441 (contains!8262 lt!583812 (_1!11361 (tuple2!22701 lt!583665 minValue!1387))))))

(declare-fun lt!583813 () List!29805)

(assert (=> d!141815 (= lt!583812 (ListLongMap!20358 lt!583813))))

(declare-fun lt!583814 () Unit!43037)

(declare-fun lt!583815 () Unit!43037)

(assert (=> d!141815 (= lt!583814 lt!583815)))

(assert (=> d!141815 (= (getValueByKey!710 lt!583813 (_1!11361 (tuple2!22701 lt!583665 minValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583665 minValue!1387))))))

(assert (=> d!141815 (= lt!583815 (lemmaContainsTupThenGetReturnValue!354 lt!583813 (_1!11361 (tuple2!22701 lt!583665 minValue!1387)) (_2!11361 (tuple2!22701 lt!583665 minValue!1387))))))

(assert (=> d!141815 (= lt!583813 (insertStrictlySorted!483 (toList!10194 lt!583679) (_1!11361 (tuple2!22701 lt!583665 minValue!1387)) (_2!11361 (tuple2!22701 lt!583665 minValue!1387))))))

(assert (=> d!141815 (= (+!4520 lt!583679 (tuple2!22701 lt!583665 minValue!1387)) lt!583812)))

(declare-fun b!1304684 () Bool)

(declare-fun res!866440 () Bool)

(assert (=> b!1304684 (=> (not res!866440) (not e!744212))))

(assert (=> b!1304684 (= res!866440 (= (getValueByKey!710 (toList!10194 lt!583812) (_1!11361 (tuple2!22701 lt!583665 minValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583665 minValue!1387)))))))

(declare-fun b!1304685 () Bool)

(assert (=> b!1304685 (= e!744212 (contains!8266 (toList!10194 lt!583812) (tuple2!22701 lt!583665 minValue!1387)))))

(assert (= (and d!141815 res!866441) b!1304684))

(assert (= (and b!1304684 res!866440) b!1304685))

(declare-fun m!1195297 () Bool)

(assert (=> d!141815 m!1195297))

(declare-fun m!1195299 () Bool)

(assert (=> d!141815 m!1195299))

(declare-fun m!1195301 () Bool)

(assert (=> d!141815 m!1195301))

(declare-fun m!1195303 () Bool)

(assert (=> d!141815 m!1195303))

(declare-fun m!1195305 () Bool)

(assert (=> b!1304684 m!1195305))

(declare-fun m!1195307 () Bool)

(assert (=> b!1304685 m!1195307))

(assert (=> b!1304476 d!141815))

(declare-fun d!141817 () Bool)

(declare-fun e!744213 () Bool)

(assert (=> d!141817 e!744213))

(declare-fun res!866443 () Bool)

(assert (=> d!141817 (=> (not res!866443) (not e!744213))))

(declare-fun lt!583816 () ListLongMap!20357)

(assert (=> d!141817 (= res!866443 (contains!8262 lt!583816 (_1!11361 (tuple2!22701 lt!583663 zeroValue!1387))))))

(declare-fun lt!583817 () List!29805)

(assert (=> d!141817 (= lt!583816 (ListLongMap!20358 lt!583817))))

(declare-fun lt!583818 () Unit!43037)

(declare-fun lt!583819 () Unit!43037)

(assert (=> d!141817 (= lt!583818 lt!583819)))

(assert (=> d!141817 (= (getValueByKey!710 lt!583817 (_1!11361 (tuple2!22701 lt!583663 zeroValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583663 zeroValue!1387))))))

(assert (=> d!141817 (= lt!583819 (lemmaContainsTupThenGetReturnValue!354 lt!583817 (_1!11361 (tuple2!22701 lt!583663 zeroValue!1387)) (_2!11361 (tuple2!22701 lt!583663 zeroValue!1387))))))

(assert (=> d!141817 (= lt!583817 (insertStrictlySorted!483 (toList!10194 lt!583673) (_1!11361 (tuple2!22701 lt!583663 zeroValue!1387)) (_2!11361 (tuple2!22701 lt!583663 zeroValue!1387))))))

(assert (=> d!141817 (= (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387)) lt!583816)))

(declare-fun b!1304686 () Bool)

(declare-fun res!866442 () Bool)

(assert (=> b!1304686 (=> (not res!866442) (not e!744213))))

(assert (=> b!1304686 (= res!866442 (= (getValueByKey!710 (toList!10194 lt!583816) (_1!11361 (tuple2!22701 lt!583663 zeroValue!1387))) (Some!760 (_2!11361 (tuple2!22701 lt!583663 zeroValue!1387)))))))

(declare-fun b!1304687 () Bool)

(assert (=> b!1304687 (= e!744213 (contains!8266 (toList!10194 lt!583816) (tuple2!22701 lt!583663 zeroValue!1387)))))

(assert (= (and d!141817 res!866443) b!1304686))

(assert (= (and b!1304686 res!866442) b!1304687))

(declare-fun m!1195309 () Bool)

(assert (=> d!141817 m!1195309))

(declare-fun m!1195311 () Bool)

(assert (=> d!141817 m!1195311))

(declare-fun m!1195313 () Bool)

(assert (=> d!141817 m!1195313))

(declare-fun m!1195315 () Bool)

(assert (=> d!141817 m!1195315))

(declare-fun m!1195317 () Bool)

(assert (=> b!1304686 m!1195317))

(declare-fun m!1195319 () Bool)

(assert (=> b!1304687 m!1195319))

(assert (=> b!1304476 d!141817))

(declare-fun d!141819 () Bool)

(assert (=> d!141819 (= (apply!1017 (+!4520 lt!583678 (tuple2!22701 lt!583671 minValue!1387)) lt!583670) (get!21178 (getValueByKey!710 (toList!10194 (+!4520 lt!583678 (tuple2!22701 lt!583671 minValue!1387))) lt!583670)))))

(declare-fun bs!37141 () Bool)

(assert (= bs!37141 d!141819))

(declare-fun m!1195321 () Bool)

(assert (=> bs!37141 m!1195321))

(assert (=> bs!37141 m!1195321))

(declare-fun m!1195323 () Bool)

(assert (=> bs!37141 m!1195323))

(assert (=> b!1304476 d!141819))

(declare-fun d!141821 () Bool)

(assert (=> d!141821 (= (apply!1017 lt!583679 lt!583684) (get!21178 (getValueByKey!710 (toList!10194 lt!583679) lt!583684)))))

(declare-fun bs!37142 () Bool)

(assert (= bs!37142 d!141821))

(declare-fun m!1195325 () Bool)

(assert (=> bs!37142 m!1195325))

(assert (=> bs!37142 m!1195325))

(declare-fun m!1195327 () Bool)

(assert (=> bs!37142 m!1195327))

(assert (=> b!1304476 d!141821))

(declare-fun d!141823 () Bool)

(declare-fun e!744214 () Bool)

(assert (=> d!141823 e!744214))

(declare-fun res!866444 () Bool)

(assert (=> d!141823 (=> res!866444 e!744214)))

(declare-fun lt!583821 () Bool)

(assert (=> d!141823 (= res!866444 (not lt!583821))))

(declare-fun lt!583820 () Bool)

(assert (=> d!141823 (= lt!583821 lt!583820)))

(declare-fun lt!583823 () Unit!43037)

(declare-fun e!744215 () Unit!43037)

(assert (=> d!141823 (= lt!583823 e!744215)))

(declare-fun c!125280 () Bool)

(assert (=> d!141823 (= c!125280 lt!583820)))

(assert (=> d!141823 (= lt!583820 (containsKey!727 (toList!10194 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387))) lt!583676))))

(assert (=> d!141823 (= (contains!8262 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387)) lt!583676) lt!583821)))

(declare-fun b!1304688 () Bool)

(declare-fun lt!583822 () Unit!43037)

(assert (=> b!1304688 (= e!744215 lt!583822)))

(assert (=> b!1304688 (= lt!583822 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387))) lt!583676))))

(assert (=> b!1304688 (isDefined!517 (getValueByKey!710 (toList!10194 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387))) lt!583676))))

(declare-fun b!1304689 () Bool)

(declare-fun Unit!43053 () Unit!43037)

(assert (=> b!1304689 (= e!744215 Unit!43053)))

(declare-fun b!1304690 () Bool)

(assert (=> b!1304690 (= e!744214 (isDefined!517 (getValueByKey!710 (toList!10194 (+!4520 lt!583673 (tuple2!22701 lt!583663 zeroValue!1387))) lt!583676)))))

(assert (= (and d!141823 c!125280) b!1304688))

(assert (= (and d!141823 (not c!125280)) b!1304689))

(assert (= (and d!141823 (not res!866444)) b!1304690))

(declare-fun m!1195329 () Bool)

(assert (=> d!141823 m!1195329))

(declare-fun m!1195331 () Bool)

(assert (=> b!1304688 m!1195331))

(declare-fun m!1195333 () Bool)

(assert (=> b!1304688 m!1195333))

(assert (=> b!1304688 m!1195333))

(declare-fun m!1195335 () Bool)

(assert (=> b!1304688 m!1195335))

(assert (=> b!1304690 m!1195333))

(assert (=> b!1304690 m!1195333))

(assert (=> b!1304690 m!1195335))

(assert (=> b!1304476 d!141823))

(declare-fun d!141825 () Bool)

(declare-fun e!744216 () Bool)

(assert (=> d!141825 e!744216))

(declare-fun res!866445 () Bool)

(assert (=> d!141825 (=> res!866445 e!744216)))

(declare-fun lt!583825 () Bool)

(assert (=> d!141825 (= res!866445 (not lt!583825))))

(declare-fun lt!583824 () Bool)

(assert (=> d!141825 (= lt!583825 lt!583824)))

(declare-fun lt!583827 () Unit!43037)

(declare-fun e!744217 () Unit!43037)

(assert (=> d!141825 (= lt!583827 e!744217)))

(declare-fun c!125281 () Bool)

(assert (=> d!141825 (= c!125281 lt!583824)))

(assert (=> d!141825 (= lt!583824 (containsKey!727 (toList!10194 lt!583674) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141825 (= (contains!8262 lt!583674 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583825)))

(declare-fun b!1304691 () Bool)

(declare-fun lt!583826 () Unit!43037)

(assert (=> b!1304691 (= e!744217 lt!583826)))

(assert (=> b!1304691 (= lt!583826 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 lt!583674) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304691 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583674) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304692 () Bool)

(declare-fun Unit!43054 () Unit!43037)

(assert (=> b!1304692 (= e!744217 Unit!43054)))

(declare-fun b!1304693 () Bool)

(assert (=> b!1304693 (= e!744216 (isDefined!517 (getValueByKey!710 (toList!10194 lt!583674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141825 c!125281) b!1304691))

(assert (= (and d!141825 (not c!125281)) b!1304692))

(assert (= (and d!141825 (not res!866445)) b!1304693))

(declare-fun m!1195337 () Bool)

(assert (=> d!141825 m!1195337))

(declare-fun m!1195339 () Bool)

(assert (=> b!1304691 m!1195339))

(assert (=> b!1304691 m!1195045))

(assert (=> b!1304691 m!1195045))

(declare-fun m!1195341 () Bool)

(assert (=> b!1304691 m!1195341))

(assert (=> b!1304693 m!1195045))

(assert (=> b!1304693 m!1195045))

(assert (=> b!1304693 m!1195341))

(assert (=> bm!64271 d!141825))

(assert (=> b!1304429 d!141791))

(assert (=> b!1304429 d!141793))

(assert (=> bm!64267 d!141721))

(declare-fun d!141827 () Bool)

(declare-fun lt!583830 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!645 (List!29806) (InoxSet (_ BitVec 64)))

(assert (=> d!141827 (= lt!583830 (select (content!645 Nil!29803) (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!744222 () Bool)

(assert (=> d!141827 (= lt!583830 e!744222)))

(declare-fun res!866451 () Bool)

(assert (=> d!141827 (=> (not res!866451) (not e!744222))))

(assert (=> d!141827 (= res!866451 ((_ is Cons!29802) Nil!29803))))

(assert (=> d!141827 (= (contains!8265 Nil!29803 (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)) lt!583830)))

(declare-fun b!1304698 () Bool)

(declare-fun e!744223 () Bool)

(assert (=> b!1304698 (= e!744222 e!744223)))

(declare-fun res!866450 () Bool)

(assert (=> b!1304698 (=> res!866450 e!744223)))

(assert (=> b!1304698 (= res!866450 (= (h!31011 Nil!29803) (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304699 () Bool)

(assert (=> b!1304699 (= e!744223 (contains!8265 (t!43396 Nil!29803) (select (arr!41878 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141827 res!866451) b!1304698))

(assert (= (and b!1304698 (not res!866450)) b!1304699))

(declare-fun m!1195343 () Bool)

(assert (=> d!141827 m!1195343))

(assert (=> d!141827 m!1194931))

(declare-fun m!1195345 () Bool)

(assert (=> d!141827 m!1195345))

(assert (=> b!1304699 m!1194931))

(declare-fun m!1195347 () Bool)

(assert (=> b!1304699 m!1195347))

(assert (=> b!1304422 d!141827))

(assert (=> b!1304473 d!141715))

(assert (=> b!1304545 d!141715))

(assert (=> b!1304424 d!141739))

(declare-fun d!141829 () Bool)

(assert (=> d!141829 (isDefined!517 (getValueByKey!710 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))

(declare-fun lt!583831 () Unit!43037)

(assert (=> d!141829 (= lt!583831 (choose!1938 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))

(declare-fun e!744224 () Bool)

(assert (=> d!141829 e!744224))

(declare-fun res!866452 () Bool)

(assert (=> d!141829 (=> (not res!866452) (not e!744224))))

(assert (=> d!141829 (= res!866452 (isStrictlySorted!870 (toList!10194 (ListLongMap!20358 Nil!29802))))))

(assert (=> d!141829 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205) lt!583831)))

(declare-fun b!1304700 () Bool)

(assert (=> b!1304700 (= e!744224 (containsKey!727 (toList!10194 (ListLongMap!20358 Nil!29802)) k0!1205))))

(assert (= (and d!141829 res!866452) b!1304700))

(assert (=> d!141829 m!1194925))

(assert (=> d!141829 m!1194925))

(assert (=> d!141829 m!1194927))

(declare-fun m!1195349 () Bool)

(assert (=> d!141829 m!1195349))

(declare-fun m!1195351 () Bool)

(assert (=> d!141829 m!1195351))

(assert (=> b!1304700 m!1194921))

(assert (=> b!1304409 d!141829))

(assert (=> b!1304409 d!141785))

(assert (=> b!1304409 d!141787))

(assert (=> b!1304492 d!141715))

(declare-fun b!1304701 () Bool)

(declare-fun e!744226 () Bool)

(assert (=> b!1304701 (= e!744226 tp_is_empty!34927)))

(declare-fun mapNonEmpty!54000 () Bool)

(declare-fun mapRes!54000 () Bool)

(declare-fun tp!103036 () Bool)

(assert (=> mapNonEmpty!54000 (= mapRes!54000 (and tp!103036 e!744226))))

(declare-fun mapKey!54000 () (_ BitVec 32))

(declare-fun mapValue!54000 () ValueCell!16565)

(declare-fun mapRest!54000 () (Array (_ BitVec 32) ValueCell!16565))

(assert (=> mapNonEmpty!54000 (= mapRest!53999 (store mapRest!54000 mapKey!54000 mapValue!54000))))

(declare-fun mapIsEmpty!54000 () Bool)

(assert (=> mapIsEmpty!54000 mapRes!54000))

(declare-fun condMapEmpty!54000 () Bool)

(declare-fun mapDefault!54000 () ValueCell!16565)

(assert (=> mapNonEmpty!53999 (= condMapEmpty!54000 (= mapRest!53999 ((as const (Array (_ BitVec 32) ValueCell!16565)) mapDefault!54000)))))

(declare-fun e!744225 () Bool)

(assert (=> mapNonEmpty!53999 (= tp!103035 (and e!744225 mapRes!54000))))

(declare-fun b!1304702 () Bool)

(assert (=> b!1304702 (= e!744225 tp_is_empty!34927)))

(assert (= (and mapNonEmpty!53999 condMapEmpty!54000) mapIsEmpty!54000))

(assert (= (and mapNonEmpty!53999 (not condMapEmpty!54000)) mapNonEmpty!54000))

(assert (= (and mapNonEmpty!54000 ((_ is ValueCellFull!16565) mapValue!54000)) b!1304701))

(assert (= (and mapNonEmpty!53999 ((_ is ValueCellFull!16565) mapDefault!54000)) b!1304702))

(declare-fun m!1195353 () Bool)

(assert (=> mapNonEmpty!54000 m!1195353))

(declare-fun b_lambda!23313 () Bool)

(assert (= b_lambda!23309 (or (and start!110164 b_free!29287) b_lambda!23313)))

(declare-fun b_lambda!23315 () Bool)

(assert (= b_lambda!23311 (or (and start!110164 b_free!29287) b_lambda!23315)))

(check-sat (not b!1304673) (not b!1304646) (not d!141751) (not d!141753) (not b!1304598) (not b!1304688) (not b_lambda!23313) (not d!141811) (not b!1304558) (not d!141827) (not d!141757) (not d!141769) (not b!1304649) (not bm!64279) (not b!1304627) (not b!1304581) (not d!141819) (not b!1304592) b_and!47463 (not d!141797) (not b!1304633) (not d!141783) (not b!1304691) (not b!1304554) (not bm!64278) (not d!141817) (not b_lambda!23315) (not mapNonEmpty!54000) (not b!1304600) (not b!1304653) (not b!1304557) (not b!1304629) (not b!1304574) (not d!141741) (not d!141785) (not d!141723) (not d!141735) (not d!141801) (not b!1304700) (not b!1304608) (not b!1304651) (not b!1304648) (not b!1304685) (not b!1304659) (not b!1304631) (not b!1304630) (not d!141771) (not b!1304686) (not b!1304563) (not b!1304556) (not b!1304671) (not b_lambda!23307) (not b_lambda!23303) (not b!1304602) (not d!141725) (not d!141825) (not b!1304662) (not d!141823) (not b!1304661) (not b!1304634) (not d!141763) (not b!1304674) (not d!141747) (not bm!64280) (not d!141829) (not b!1304578) (not b!1304687) (not d!141759) (not d!141755) (not b!1304636) (not b!1304584) (not b!1304625) (not d!141761) (not d!141767) (not d!141799) (not d!141803) (not b!1304693) (not d!141737) (not b_lambda!23305) (not b!1304599) (not d!141779) (not d!141815) (not b!1304593) (not b!1304668) (not b!1304666) (not b!1304656) (not b!1304582) (not b!1304580) (not b!1304655) (not d!141805) (not d!141813) (not b!1304658) (not d!141809) (not b!1304684) tp_is_empty!34927 (not b!1304699) (not b!1304647) (not b!1304577) (not d!141789) (not b!1304681) (not b_next!29287) (not b!1304579) (not b!1304587) (not b!1304680) (not d!141745) (not d!141821) (not d!141773) (not d!141795) (not d!141731) (not b!1304690) (not d!141807) (not b!1304632) (not d!141729) (not d!141791))
(check-sat b_and!47463 (not b_next!29287))
