; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109636 () Bool)

(assert start!109636)

(declare-fun b_free!29125 () Bool)

(declare-fun b_next!29125 () Bool)

(assert (=> start!109636 (= b_free!29125 (not b_next!29125))))

(declare-fun tp!102495 () Bool)

(declare-fun b_and!47197 () Bool)

(assert (=> start!109636 (= tp!102495 b_and!47197)))

(declare-fun b!1298675 () Bool)

(declare-fun e!740884 () Bool)

(declare-fun tp_is_empty!34765 () Bool)

(assert (=> b!1298675 (= e!740884 tp_is_empty!34765)))

(declare-fun b!1298676 () Bool)

(declare-fun res!863106 () Bool)

(declare-fun e!740885 () Bool)

(assert (=> b!1298676 (=> (not res!863106) (not e!740885))))

(declare-datatypes ((array!86431 0))(
  ( (array!86432 (arr!41717 (Array (_ BitVec 32) (_ BitVec 64))) (size!42269 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86431)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86431 (_ BitVec 32)) Bool)

(assert (=> b!1298676 (= res!863106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298677 () Bool)

(declare-fun res!863110 () Bool)

(assert (=> b!1298677 (=> (not res!863110) (not e!740885))))

(declare-datatypes ((V!51457 0))(
  ( (V!51458 (val!17457 Int)) )
))
(declare-datatypes ((ValueCell!16484 0))(
  ( (ValueCellFull!16484 (v!20059 V!51457)) (EmptyCell!16484) )
))
(declare-datatypes ((array!86433 0))(
  ( (array!86434 (arr!41718 (Array (_ BitVec 32) ValueCell!16484)) (size!42270 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86433)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298677 (= res!863110 (and (= (size!42270 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42269 _keys!1741) (size!42270 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53708 () Bool)

(declare-fun mapRes!53708 () Bool)

(assert (=> mapIsEmpty!53708 mapRes!53708))

(declare-fun b!1298679 () Bool)

(declare-fun res!863107 () Bool)

(assert (=> b!1298679 (=> (not res!863107) (not e!740885))))

(declare-datatypes ((List!29679 0))(
  ( (Nil!29676) (Cons!29675 (h!30884 (_ BitVec 64)) (t!43235 List!29679)) )
))
(declare-fun arrayNoDuplicates!0 (array!86431 (_ BitVec 32) List!29679) Bool)

(assert (=> b!1298679 (= res!863107 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29676))))

(declare-fun b!1298680 () Bool)

(declare-fun e!740883 () Bool)

(assert (=> b!1298680 (= e!740885 (not e!740883))))

(declare-fun res!863105 () Bool)

(assert (=> b!1298680 (=> res!863105 e!740883)))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298680 (= res!863105 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!51457)

(declare-fun zeroValue!1387 () V!51457)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22558 0))(
  ( (tuple2!22559 (_1!11290 (_ BitVec 64)) (_2!11290 V!51457)) )
))
(declare-datatypes ((List!29680 0))(
  ( (Nil!29677) (Cons!29676 (h!30885 tuple2!22558) (t!43236 List!29680)) )
))
(declare-datatypes ((ListLongMap!20215 0))(
  ( (ListLongMap!20216 (toList!10123 List!29680)) )
))
(declare-fun contains!8171 (ListLongMap!20215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5039 (array!86431 array!86433 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 32) Int) ListLongMap!20215)

(assert (=> b!1298680 (contains!8171 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42848 0))(
  ( (Unit!42849) )
))
(declare-fun lt!580558 () Unit!42848)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 (array!86431 array!86433 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42848)

(assert (=> b!1298680 (= lt!580558 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298681 () Bool)

(declare-fun res!863109 () Bool)

(assert (=> b!1298681 (=> (not res!863109) (not e!740885))))

(assert (=> b!1298681 (= res!863109 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)) (not (= (select (arr!41717 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1298682 () Bool)

(declare-fun e!740881 () Bool)

(declare-fun e!740882 () Bool)

(assert (=> b!1298682 (= e!740881 (and e!740882 mapRes!53708))))

(declare-fun condMapEmpty!53708 () Bool)

(declare-fun mapDefault!53708 () ValueCell!16484)

(assert (=> b!1298682 (= condMapEmpty!53708 (= (arr!41718 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16484)) mapDefault!53708)))))

(declare-fun b!1298683 () Bool)

(declare-fun arrayContainsKey!0 (array!86431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1298683 (= e!740883 (arrayContainsKey!0 _keys!1741 k0!1205 from!2144))))

(assert (=> b!1298683 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun lt!580557 () Unit!42848)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!629 (array!86431 array!86433 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42848)

(assert (=> b!1298683 (= lt!580557 (lemmaListMapContainsThenArrayContainsFrom!629 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1298684 () Bool)

(declare-fun res!863112 () Bool)

(assert (=> b!1298684 (=> (not res!863112) (not e!740885))))

(assert (=> b!1298684 (= res!863112 (contains!8171 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298678 () Bool)

(declare-fun res!863108 () Bool)

(assert (=> b!1298678 (=> (not res!863108) (not e!740885))))

(assert (=> b!1298678 (= res!863108 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42269 _keys!1741))))))

(declare-fun res!863111 () Bool)

(assert (=> start!109636 (=> (not res!863111) (not e!740885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109636 (= res!863111 (validMask!0 mask!2175))))

(assert (=> start!109636 e!740885))

(assert (=> start!109636 tp_is_empty!34765))

(assert (=> start!109636 true))

(declare-fun array_inv!31731 (array!86433) Bool)

(assert (=> start!109636 (and (array_inv!31731 _values!1445) e!740881)))

(declare-fun array_inv!31732 (array!86431) Bool)

(assert (=> start!109636 (array_inv!31732 _keys!1741)))

(assert (=> start!109636 tp!102495))

(declare-fun b!1298685 () Bool)

(assert (=> b!1298685 (= e!740882 tp_is_empty!34765)))

(declare-fun mapNonEmpty!53708 () Bool)

(declare-fun tp!102494 () Bool)

(assert (=> mapNonEmpty!53708 (= mapRes!53708 (and tp!102494 e!740884))))

(declare-fun mapValue!53708 () ValueCell!16484)

(declare-fun mapRest!53708 () (Array (_ BitVec 32) ValueCell!16484))

(declare-fun mapKey!53708 () (_ BitVec 32))

(assert (=> mapNonEmpty!53708 (= (arr!41718 _values!1445) (store mapRest!53708 mapKey!53708 mapValue!53708))))

(assert (= (and start!109636 res!863111) b!1298677))

(assert (= (and b!1298677 res!863110) b!1298676))

(assert (= (and b!1298676 res!863106) b!1298679))

(assert (= (and b!1298679 res!863107) b!1298678))

(assert (= (and b!1298678 res!863108) b!1298684))

(assert (= (and b!1298684 res!863112) b!1298681))

(assert (= (and b!1298681 res!863109) b!1298680))

(assert (= (and b!1298680 (not res!863105)) b!1298683))

(assert (= (and b!1298682 condMapEmpty!53708) mapIsEmpty!53708))

(assert (= (and b!1298682 (not condMapEmpty!53708)) mapNonEmpty!53708))

(get-info :version)

(assert (= (and mapNonEmpty!53708 ((_ is ValueCellFull!16484) mapValue!53708)) b!1298675))

(assert (= (and b!1298682 ((_ is ValueCellFull!16484) mapDefault!53708)) b!1298685))

(assert (= start!109636 b!1298682))

(declare-fun m!1189527 () Bool)

(assert (=> b!1298681 m!1189527))

(declare-fun m!1189529 () Bool)

(assert (=> mapNonEmpty!53708 m!1189529))

(declare-fun m!1189531 () Bool)

(assert (=> b!1298679 m!1189531))

(declare-fun m!1189533 () Bool)

(assert (=> b!1298684 m!1189533))

(assert (=> b!1298684 m!1189533))

(declare-fun m!1189535 () Bool)

(assert (=> b!1298684 m!1189535))

(declare-fun m!1189537 () Bool)

(assert (=> b!1298676 m!1189537))

(declare-fun m!1189539 () Bool)

(assert (=> b!1298683 m!1189539))

(declare-fun m!1189541 () Bool)

(assert (=> b!1298683 m!1189541))

(declare-fun m!1189543 () Bool)

(assert (=> b!1298683 m!1189543))

(declare-fun m!1189545 () Bool)

(assert (=> b!1298680 m!1189545))

(assert (=> b!1298680 m!1189545))

(declare-fun m!1189547 () Bool)

(assert (=> b!1298680 m!1189547))

(declare-fun m!1189549 () Bool)

(assert (=> b!1298680 m!1189549))

(declare-fun m!1189551 () Bool)

(assert (=> start!109636 m!1189551))

(declare-fun m!1189553 () Bool)

(assert (=> start!109636 m!1189553))

(declare-fun m!1189555 () Bool)

(assert (=> start!109636 m!1189555))

(check-sat tp_is_empty!34765 (not b!1298679) (not b!1298676) (not b_next!29125) b_and!47197 (not mapNonEmpty!53708) (not b!1298683) (not b!1298680) (not b!1298684) (not start!109636))
(check-sat b_and!47197 (not b_next!29125))
(get-model)

(declare-fun d!140939 () Bool)

(declare-fun res!863165 () Bool)

(declare-fun e!740927 () Bool)

(assert (=> d!140939 (=> res!863165 e!740927)))

(assert (=> d!140939 (= res!863165 (= (select (arr!41717 _keys!1741) from!2144) k0!1205))))

(assert (=> d!140939 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!740927)))

(declare-fun b!1298756 () Bool)

(declare-fun e!740928 () Bool)

(assert (=> b!1298756 (= e!740927 e!740928)))

(declare-fun res!863166 () Bool)

(assert (=> b!1298756 (=> (not res!863166) (not e!740928))))

(assert (=> b!1298756 (= res!863166 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42269 _keys!1741)))))

(declare-fun b!1298757 () Bool)

(assert (=> b!1298757 (= e!740928 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!140939 (not res!863165)) b!1298756))

(assert (= (and b!1298756 res!863166) b!1298757))

(assert (=> d!140939 m!1189527))

(declare-fun m!1189617 () Bool)

(assert (=> b!1298757 m!1189617))

(assert (=> b!1298683 d!140939))

(declare-fun d!140941 () Bool)

(declare-fun res!863167 () Bool)

(declare-fun e!740929 () Bool)

(assert (=> d!140941 (=> res!863167 e!740929)))

(assert (=> d!140941 (= res!863167 (= (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) k0!1205))))

(assert (=> d!140941 (= (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)) e!740929)))

(declare-fun b!1298758 () Bool)

(declare-fun e!740930 () Bool)

(assert (=> b!1298758 (= e!740929 e!740930)))

(declare-fun res!863168 () Bool)

(assert (=> b!1298758 (=> (not res!863168) (not e!740930))))

(assert (=> b!1298758 (= res!863168 (bvslt (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001) (size!42269 _keys!1741)))))

(declare-fun b!1298759 () Bool)

(assert (=> b!1298759 (= e!740930 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!140941 (not res!863167)) b!1298758))

(assert (= (and b!1298758 res!863168) b!1298759))

(declare-fun m!1189619 () Bool)

(assert (=> d!140941 m!1189619))

(declare-fun m!1189621 () Bool)

(assert (=> b!1298759 m!1189621))

(assert (=> b!1298683 d!140941))

(declare-fun d!140943 () Bool)

(declare-fun e!740933 () Bool)

(assert (=> d!140943 e!740933))

(declare-fun c!124401 () Bool)

(assert (=> d!140943 (= c!124401 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!580573 () Unit!42848)

(declare-fun choose!1910 (array!86431 array!86433 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42848)

(assert (=> d!140943 (= lt!580573 (choose!1910 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(assert (=> d!140943 (validMask!0 mask!2175)))

(assert (=> d!140943 (= (lemmaListMapContainsThenArrayContainsFrom!629 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!580573)))

(declare-fun b!1298764 () Bool)

(assert (=> b!1298764 (= e!740933 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun b!1298765 () Bool)

(assert (=> b!1298765 (= e!740933 (ite (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!140943 c!124401) b!1298764))

(assert (= (and d!140943 (not c!124401)) b!1298765))

(declare-fun m!1189623 () Bool)

(assert (=> d!140943 m!1189623))

(assert (=> d!140943 m!1189551))

(assert (=> b!1298764 m!1189541))

(assert (=> b!1298683 d!140943))

(declare-fun d!140945 () Bool)

(assert (=> d!140945 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109636 d!140945))

(declare-fun d!140947 () Bool)

(assert (=> d!140947 (= (array_inv!31731 _values!1445) (bvsge (size!42270 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109636 d!140947))

(declare-fun d!140949 () Bool)

(assert (=> d!140949 (= (array_inv!31732 _keys!1741) (bvsge (size!42269 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109636 d!140949))

(declare-fun b!1298774 () Bool)

(declare-fun e!740940 () Bool)

(declare-fun e!740941 () Bool)

(assert (=> b!1298774 (= e!740940 e!740941)))

(declare-fun c!124404 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1298774 (= c!124404 (validKeyInArray!0 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1298775 () Bool)

(declare-fun call!63493 () Bool)

(assert (=> b!1298775 (= e!740941 call!63493)))

(declare-fun d!140951 () Bool)

(declare-fun res!863173 () Bool)

(assert (=> d!140951 (=> res!863173 e!740940)))

(assert (=> d!140951 (= res!863173 (bvsge #b00000000000000000000000000000000 (size!42269 _keys!1741)))))

(assert (=> d!140951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!740940)))

(declare-fun bm!63490 () Bool)

(assert (=> bm!63490 (= call!63493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1298776 () Bool)

(declare-fun e!740942 () Bool)

(assert (=> b!1298776 (= e!740942 call!63493)))

(declare-fun b!1298777 () Bool)

(assert (=> b!1298777 (= e!740941 e!740942)))

(declare-fun lt!580580 () (_ BitVec 64))

(assert (=> b!1298777 (= lt!580580 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!580581 () Unit!42848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86431 (_ BitVec 64) (_ BitVec 32)) Unit!42848)

(assert (=> b!1298777 (= lt!580581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580580 #b00000000000000000000000000000000))))

(assert (=> b!1298777 (arrayContainsKey!0 _keys!1741 lt!580580 #b00000000000000000000000000000000)))

(declare-fun lt!580582 () Unit!42848)

(assert (=> b!1298777 (= lt!580582 lt!580581)))

(declare-fun res!863174 () Bool)

(declare-datatypes ((SeekEntryResult!10014 0))(
  ( (MissingZero!10014 (index!42427 (_ BitVec 32))) (Found!10014 (index!42428 (_ BitVec 32))) (Intermediate!10014 (undefined!10826 Bool) (index!42429 (_ BitVec 32)) (x!115379 (_ BitVec 32))) (Undefined!10014) (MissingVacant!10014 (index!42430 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86431 (_ BitVec 32)) SeekEntryResult!10014)

(assert (=> b!1298777 (= res!863174 (= (seekEntryOrOpen!0 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10014 #b00000000000000000000000000000000)))))

(assert (=> b!1298777 (=> (not res!863174) (not e!740942))))

(assert (= (and d!140951 (not res!863173)) b!1298774))

(assert (= (and b!1298774 c!124404) b!1298777))

(assert (= (and b!1298774 (not c!124404)) b!1298775))

(assert (= (and b!1298777 res!863174) b!1298776))

(assert (= (or b!1298776 b!1298775) bm!63490))

(declare-fun m!1189625 () Bool)

(assert (=> b!1298774 m!1189625))

(assert (=> b!1298774 m!1189625))

(declare-fun m!1189627 () Bool)

(assert (=> b!1298774 m!1189627))

(declare-fun m!1189629 () Bool)

(assert (=> bm!63490 m!1189629))

(assert (=> b!1298777 m!1189625))

(declare-fun m!1189631 () Bool)

(assert (=> b!1298777 m!1189631))

(declare-fun m!1189633 () Bool)

(assert (=> b!1298777 m!1189633))

(assert (=> b!1298777 m!1189625))

(declare-fun m!1189635 () Bool)

(assert (=> b!1298777 m!1189635))

(assert (=> b!1298676 d!140951))

(declare-fun d!140953 () Bool)

(declare-fun e!740947 () Bool)

(assert (=> d!140953 e!740947))

(declare-fun res!863177 () Bool)

(assert (=> d!140953 (=> res!863177 e!740947)))

(declare-fun lt!580593 () Bool)

(assert (=> d!140953 (= res!863177 (not lt!580593))))

(declare-fun lt!580592 () Bool)

(assert (=> d!140953 (= lt!580593 lt!580592)))

(declare-fun lt!580594 () Unit!42848)

(declare-fun e!740948 () Unit!42848)

(assert (=> d!140953 (= lt!580594 e!740948)))

(declare-fun c!124407 () Bool)

(assert (=> d!140953 (= c!124407 lt!580592)))

(declare-fun containsKey!715 (List!29680 (_ BitVec 64)) Bool)

(assert (=> d!140953 (= lt!580592 (containsKey!715 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(assert (=> d!140953 (= (contains!8171 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205) lt!580593)))

(declare-fun b!1298784 () Bool)

(declare-fun lt!580591 () Unit!42848)

(assert (=> b!1298784 (= e!740948 lt!580591)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!462 (List!29680 (_ BitVec 64)) Unit!42848)

(assert (=> b!1298784 (= lt!580591 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!749 0))(
  ( (Some!748 (v!20062 V!51457)) (None!747) )
))
(declare-fun isDefined!505 (Option!749) Bool)

(declare-fun getValueByKey!698 (List!29680 (_ BitVec 64)) Option!749)

(assert (=> b!1298784 (isDefined!505 (getValueByKey!698 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205))))

(declare-fun b!1298785 () Bool)

(declare-fun Unit!42850 () Unit!42848)

(assert (=> b!1298785 (= e!740948 Unit!42850)))

(declare-fun b!1298786 () Bool)

(assert (=> b!1298786 (= e!740947 (isDefined!505 (getValueByKey!698 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140953 c!124407) b!1298784))

(assert (= (and d!140953 (not c!124407)) b!1298785))

(assert (= (and d!140953 (not res!863177)) b!1298786))

(declare-fun m!1189637 () Bool)

(assert (=> d!140953 m!1189637))

(declare-fun m!1189639 () Bool)

(assert (=> b!1298784 m!1189639))

(declare-fun m!1189641 () Bool)

(assert (=> b!1298784 m!1189641))

(assert (=> b!1298784 m!1189641))

(declare-fun m!1189643 () Bool)

(assert (=> b!1298784 m!1189643))

(assert (=> b!1298786 m!1189641))

(assert (=> b!1298786 m!1189641))

(assert (=> b!1298786 m!1189643))

(assert (=> b!1298680 d!140953))

(declare-fun b!1298829 () Bool)

(declare-fun res!863198 () Bool)

(declare-fun e!740978 () Bool)

(assert (=> b!1298829 (=> (not res!863198) (not e!740978))))

(declare-fun e!740984 () Bool)

(assert (=> b!1298829 (= res!863198 e!740984)))

(declare-fun c!124424 () Bool)

(assert (=> b!1298829 (= c!124424 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!580653 () ListLongMap!20215)

(declare-fun e!740976 () Bool)

(declare-fun b!1298830 () Bool)

(declare-fun apply!1005 (ListLongMap!20215 (_ BitVec 64)) V!51457)

(declare-fun get!21099 (ValueCell!16484 V!51457) V!51457)

(declare-fun dynLambda!3440 (Int (_ BitVec 64)) V!51457)

(assert (=> b!1298830 (= e!740976 (= (apply!1005 lt!580653 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))) (get!21099 (select (arr!41718 _values!1445) (bvadd #b00000000000000000000000000000001 from!2144)) (dynLambda!3440 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1298830 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42270 _values!1445)))))

(assert (=> b!1298830 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)))))

(declare-fun b!1298831 () Bool)

(declare-fun e!740979 () Bool)

(declare-fun call!63512 () Bool)

(assert (=> b!1298831 (= e!740979 (not call!63512))))

(declare-fun b!1298832 () Bool)

(declare-fun e!740982 () ListLongMap!20215)

(declare-fun call!63513 () ListLongMap!20215)

(declare-fun +!4474 (ListLongMap!20215 tuple2!22558) ListLongMap!20215)

(assert (=> b!1298832 (= e!740982 (+!4474 call!63513 (tuple2!22559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1298833 () Bool)

(declare-fun e!740986 () ListLongMap!20215)

(declare-fun call!63508 () ListLongMap!20215)

(assert (=> b!1298833 (= e!740986 call!63508)))

(declare-fun b!1298834 () Bool)

(declare-fun e!740983 () Unit!42848)

(declare-fun Unit!42851 () Unit!42848)

(assert (=> b!1298834 (= e!740983 Unit!42851)))

(declare-fun bm!63505 () Bool)

(declare-fun call!63514 () ListLongMap!20215)

(declare-fun getCurrentListMapNoExtraKeys!6105 (array!86431 array!86433 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 32) Int) ListLongMap!20215)

(assert (=> bm!63505 (= call!63514 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1298835 () Bool)

(declare-fun lt!580649 () Unit!42848)

(assert (=> b!1298835 (= e!740983 lt!580649)))

(declare-fun lt!580639 () ListLongMap!20215)

(assert (=> b!1298835 (= lt!580639 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580641 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580641 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580645 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580645 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!580644 () Unit!42848)

(declare-fun addStillContains!1100 (ListLongMap!20215 (_ BitVec 64) V!51457 (_ BitVec 64)) Unit!42848)

(assert (=> b!1298835 (= lt!580644 (addStillContains!1100 lt!580639 lt!580641 zeroValue!1387 lt!580645))))

(assert (=> b!1298835 (contains!8171 (+!4474 lt!580639 (tuple2!22559 lt!580641 zeroValue!1387)) lt!580645)))

(declare-fun lt!580658 () Unit!42848)

(assert (=> b!1298835 (= lt!580658 lt!580644)))

(declare-fun lt!580650 () ListLongMap!20215)

(assert (=> b!1298835 (= lt!580650 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580656 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580655 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580655 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!580660 () Unit!42848)

(declare-fun addApplyDifferent!543 (ListLongMap!20215 (_ BitVec 64) V!51457 (_ BitVec 64)) Unit!42848)

(assert (=> b!1298835 (= lt!580660 (addApplyDifferent!543 lt!580650 lt!580656 minValue!1387 lt!580655))))

(assert (=> b!1298835 (= (apply!1005 (+!4474 lt!580650 (tuple2!22559 lt!580656 minValue!1387)) lt!580655) (apply!1005 lt!580650 lt!580655))))

(declare-fun lt!580654 () Unit!42848)

(assert (=> b!1298835 (= lt!580654 lt!580660)))

(declare-fun lt!580659 () ListLongMap!20215)

(assert (=> b!1298835 (= lt!580659 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580642 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580651 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580651 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(declare-fun lt!580643 () Unit!42848)

(assert (=> b!1298835 (= lt!580643 (addApplyDifferent!543 lt!580659 lt!580642 zeroValue!1387 lt!580651))))

(assert (=> b!1298835 (= (apply!1005 (+!4474 lt!580659 (tuple2!22559 lt!580642 zeroValue!1387)) lt!580651) (apply!1005 lt!580659 lt!580651))))

(declare-fun lt!580647 () Unit!42848)

(assert (=> b!1298835 (= lt!580647 lt!580643)))

(declare-fun lt!580652 () ListLongMap!20215)

(assert (=> b!1298835 (= lt!580652 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun lt!580646 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580646 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580640 () (_ BitVec 64))

(assert (=> b!1298835 (= lt!580640 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)))))

(assert (=> b!1298835 (= lt!580649 (addApplyDifferent!543 lt!580652 lt!580646 minValue!1387 lt!580640))))

(assert (=> b!1298835 (= (apply!1005 (+!4474 lt!580652 (tuple2!22559 lt!580646 minValue!1387)) lt!580640) (apply!1005 lt!580652 lt!580640))))

(declare-fun b!1298836 () Bool)

(declare-fun c!124421 () Bool)

(assert (=> b!1298836 (= c!124421 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!740987 () ListLongMap!20215)

(assert (=> b!1298836 (= e!740987 e!740986)))

(declare-fun b!1298837 () Bool)

(declare-fun e!740980 () Bool)

(assert (=> b!1298837 (= e!740980 (validKeyInArray!0 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun bm!63506 () Bool)

(declare-fun call!63511 () ListLongMap!20215)

(assert (=> bm!63506 (= call!63511 call!63513)))

(declare-fun b!1298838 () Bool)

(assert (=> b!1298838 (= e!740987 call!63511)))

(declare-fun b!1298839 () Bool)

(declare-fun e!740975 () Bool)

(assert (=> b!1298839 (= e!740979 e!740975)))

(declare-fun res!863196 () Bool)

(assert (=> b!1298839 (= res!863196 call!63512)))

(assert (=> b!1298839 (=> (not res!863196) (not e!740975))))

(declare-fun bm!63507 () Bool)

(assert (=> bm!63507 (= call!63512 (contains!8171 lt!580653 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!63509 () ListLongMap!20215)

(declare-fun bm!63508 () Bool)

(declare-fun c!124425 () Bool)

(declare-fun c!124423 () Bool)

(assert (=> bm!63508 (= call!63513 (+!4474 (ite c!124423 call!63514 (ite c!124425 call!63509 call!63508)) (ite (or c!124423 c!124425) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1298840 () Bool)

(assert (=> b!1298840 (= e!740978 e!740979)))

(declare-fun c!124422 () Bool)

(assert (=> b!1298840 (= c!124422 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1298841 () Bool)

(declare-fun e!740977 () Bool)

(assert (=> b!1298841 (= e!740977 (validKeyInArray!0 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(declare-fun b!1298842 () Bool)

(declare-fun e!740981 () Bool)

(assert (=> b!1298842 (= e!740981 e!740976)))

(declare-fun res!863202 () Bool)

(assert (=> b!1298842 (=> (not res!863202) (not e!740976))))

(assert (=> b!1298842 (= res!863202 (contains!8171 lt!580653 (select (arr!41717 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144))))))

(assert (=> b!1298842 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)))))

(declare-fun b!1298843 () Bool)

(declare-fun res!863201 () Bool)

(assert (=> b!1298843 (=> (not res!863201) (not e!740978))))

(assert (=> b!1298843 (= res!863201 e!740981)))

(declare-fun res!863204 () Bool)

(assert (=> b!1298843 (=> res!863204 e!740981)))

(assert (=> b!1298843 (= res!863204 (not e!740977))))

(declare-fun res!863203 () Bool)

(assert (=> b!1298843 (=> (not res!863203) (not e!740977))))

(assert (=> b!1298843 (= res!863203 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)))))

(declare-fun b!1298844 () Bool)

(assert (=> b!1298844 (= e!740975 (= (apply!1005 lt!580653 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!63509 () Bool)

(declare-fun call!63510 () Bool)

(assert (=> bm!63509 (= call!63510 (contains!8171 lt!580653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1298845 () Bool)

(declare-fun e!740985 () Bool)

(assert (=> b!1298845 (= e!740985 (= (apply!1005 lt!580653 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1298846 () Bool)

(assert (=> b!1298846 (= e!740982 e!740987)))

(assert (=> b!1298846 (= c!124425 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!140955 () Bool)

(assert (=> d!140955 e!740978))

(declare-fun res!863200 () Bool)

(assert (=> d!140955 (=> (not res!863200) (not e!740978))))

(assert (=> d!140955 (= res!863200 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)))))))

(declare-fun lt!580648 () ListLongMap!20215)

(assert (=> d!140955 (= lt!580653 lt!580648)))

(declare-fun lt!580657 () Unit!42848)

(assert (=> d!140955 (= lt!580657 e!740983)))

(declare-fun c!124420 () Bool)

(assert (=> d!140955 (= c!124420 e!740980)))

(declare-fun res!863197 () Bool)

(assert (=> d!140955 (=> (not res!863197) (not e!740980))))

(assert (=> d!140955 (= res!863197 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42269 _keys!1741)))))

(assert (=> d!140955 (= lt!580648 e!740982)))

(assert (=> d!140955 (= c!124423 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140955 (validMask!0 mask!2175)))

(assert (=> d!140955 (= (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) lt!580653)))

(declare-fun b!1298847 () Bool)

(assert (=> b!1298847 (= e!740984 (not call!63510))))

(declare-fun bm!63510 () Bool)

(assert (=> bm!63510 (= call!63508 call!63509)))

(declare-fun b!1298848 () Bool)

(assert (=> b!1298848 (= e!740984 e!740985)))

(declare-fun res!863199 () Bool)

(assert (=> b!1298848 (= res!863199 call!63510)))

(assert (=> b!1298848 (=> (not res!863199) (not e!740985))))

(declare-fun b!1298849 () Bool)

(assert (=> b!1298849 (= e!740986 call!63511)))

(declare-fun bm!63511 () Bool)

(assert (=> bm!63511 (= call!63509 call!63514)))

(assert (= (and d!140955 c!124423) b!1298832))

(assert (= (and d!140955 (not c!124423)) b!1298846))

(assert (= (and b!1298846 c!124425) b!1298838))

(assert (= (and b!1298846 (not c!124425)) b!1298836))

(assert (= (and b!1298836 c!124421) b!1298849))

(assert (= (and b!1298836 (not c!124421)) b!1298833))

(assert (= (or b!1298849 b!1298833) bm!63510))

(assert (= (or b!1298838 bm!63510) bm!63511))

(assert (= (or b!1298838 b!1298849) bm!63506))

(assert (= (or b!1298832 bm!63511) bm!63505))

(assert (= (or b!1298832 bm!63506) bm!63508))

(assert (= (and d!140955 res!863197) b!1298837))

(assert (= (and d!140955 c!124420) b!1298835))

(assert (= (and d!140955 (not c!124420)) b!1298834))

(assert (= (and d!140955 res!863200) b!1298843))

(assert (= (and b!1298843 res!863203) b!1298841))

(assert (= (and b!1298843 (not res!863204)) b!1298842))

(assert (= (and b!1298842 res!863202) b!1298830))

(assert (= (and b!1298843 res!863201) b!1298829))

(assert (= (and b!1298829 c!124424) b!1298848))

(assert (= (and b!1298829 (not c!124424)) b!1298847))

(assert (= (and b!1298848 res!863199) b!1298845))

(assert (= (or b!1298848 b!1298847) bm!63509))

(assert (= (and b!1298829 res!863198) b!1298840))

(assert (= (and b!1298840 c!124422) b!1298839))

(assert (= (and b!1298840 (not c!124422)) b!1298831))

(assert (= (and b!1298839 res!863196) b!1298844))

(assert (= (or b!1298839 b!1298831) bm!63507))

(declare-fun b_lambda!23127 () Bool)

(assert (=> (not b_lambda!23127) (not b!1298830)))

(declare-fun t!43240 () Bool)

(declare-fun tb!11361 () Bool)

(assert (=> (and start!109636 (= defaultEntry!1448 defaultEntry!1448) t!43240) tb!11361))

(declare-fun result!23731 () Bool)

(assert (=> tb!11361 (= result!23731 tp_is_empty!34765)))

(assert (=> b!1298830 t!43240))

(declare-fun b_and!47203 () Bool)

(assert (= b_and!47197 (and (=> t!43240 result!23731) b_and!47203)))

(declare-fun m!1189645 () Bool)

(assert (=> bm!63505 m!1189645))

(assert (=> b!1298842 m!1189619))

(assert (=> b!1298842 m!1189619))

(declare-fun m!1189647 () Bool)

(assert (=> b!1298842 m!1189647))

(declare-fun m!1189649 () Bool)

(assert (=> b!1298845 m!1189649))

(assert (=> b!1298837 m!1189619))

(assert (=> b!1298837 m!1189619))

(declare-fun m!1189651 () Bool)

(assert (=> b!1298837 m!1189651))

(assert (=> b!1298830 m!1189619))

(declare-fun m!1189653 () Bool)

(assert (=> b!1298830 m!1189653))

(declare-fun m!1189655 () Bool)

(assert (=> b!1298830 m!1189655))

(declare-fun m!1189657 () Bool)

(assert (=> b!1298830 m!1189657))

(declare-fun m!1189659 () Bool)

(assert (=> b!1298830 m!1189659))

(assert (=> b!1298830 m!1189655))

(assert (=> b!1298830 m!1189619))

(assert (=> b!1298830 m!1189657))

(assert (=> b!1298841 m!1189619))

(assert (=> b!1298841 m!1189619))

(assert (=> b!1298841 m!1189651))

(declare-fun m!1189661 () Bool)

(assert (=> bm!63507 m!1189661))

(declare-fun m!1189663 () Bool)

(assert (=> bm!63508 m!1189663))

(declare-fun m!1189665 () Bool)

(assert (=> b!1298835 m!1189665))

(declare-fun m!1189667 () Bool)

(assert (=> b!1298835 m!1189667))

(declare-fun m!1189669 () Bool)

(assert (=> b!1298835 m!1189669))

(declare-fun m!1189671 () Bool)

(assert (=> b!1298835 m!1189671))

(declare-fun m!1189673 () Bool)

(assert (=> b!1298835 m!1189673))

(declare-fun m!1189675 () Bool)

(assert (=> b!1298835 m!1189675))

(declare-fun m!1189677 () Bool)

(assert (=> b!1298835 m!1189677))

(declare-fun m!1189679 () Bool)

(assert (=> b!1298835 m!1189679))

(assert (=> b!1298835 m!1189673))

(declare-fun m!1189681 () Bool)

(assert (=> b!1298835 m!1189681))

(assert (=> b!1298835 m!1189669))

(declare-fun m!1189683 () Bool)

(assert (=> b!1298835 m!1189683))

(declare-fun m!1189685 () Bool)

(assert (=> b!1298835 m!1189685))

(declare-fun m!1189687 () Bool)

(assert (=> b!1298835 m!1189687))

(declare-fun m!1189689 () Bool)

(assert (=> b!1298835 m!1189689))

(assert (=> b!1298835 m!1189619))

(declare-fun m!1189691 () Bool)

(assert (=> b!1298835 m!1189691))

(declare-fun m!1189693 () Bool)

(assert (=> b!1298835 m!1189693))

(assert (=> b!1298835 m!1189665))

(assert (=> b!1298835 m!1189677))

(assert (=> b!1298835 m!1189645))

(declare-fun m!1189695 () Bool)

(assert (=> b!1298832 m!1189695))

(declare-fun m!1189697 () Bool)

(assert (=> b!1298844 m!1189697))

(declare-fun m!1189699 () Bool)

(assert (=> bm!63509 m!1189699))

(assert (=> d!140955 m!1189551))

(assert (=> b!1298680 d!140955))

(declare-fun d!140957 () Bool)

(assert (=> d!140957 (contains!8171 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) k0!1205)))

(declare-fun lt!580663 () Unit!42848)

(declare-fun choose!1911 (array!86431 array!86433 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!42848)

(assert (=> d!140957 (= lt!580663 (choose!1911 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(assert (=> d!140957 (validMask!0 mask!2175)))

(assert (=> d!140957 (= (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!49 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448) lt!580663)))

(declare-fun bs!36976 () Bool)

(assert (= bs!36976 d!140957))

(declare-fun m!1189701 () Bool)

(assert (=> bs!36976 m!1189701))

(assert (=> bs!36976 m!1189701))

(declare-fun m!1189703 () Bool)

(assert (=> bs!36976 m!1189703))

(declare-fun m!1189705 () Bool)

(assert (=> bs!36976 m!1189705))

(assert (=> bs!36976 m!1189551))

(assert (=> b!1298680 d!140957))

(declare-fun b!1298862 () Bool)

(declare-fun e!740997 () Bool)

(declare-fun call!63517 () Bool)

(assert (=> b!1298862 (= e!740997 call!63517)))

(declare-fun b!1298863 () Bool)

(assert (=> b!1298863 (= e!740997 call!63517)))

(declare-fun bm!63514 () Bool)

(declare-fun c!124428 () Bool)

(assert (=> bm!63514 (= call!63517 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124428 (Cons!29675 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000) Nil!29676) Nil!29676)))))

(declare-fun b!1298864 () Bool)

(declare-fun e!740998 () Bool)

(assert (=> b!1298864 (= e!740998 e!740997)))

(assert (=> b!1298864 (= c!124428 (validKeyInArray!0 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1298865 () Bool)

(declare-fun e!740999 () Bool)

(assert (=> b!1298865 (= e!740999 e!740998)))

(declare-fun res!863213 () Bool)

(assert (=> b!1298865 (=> (not res!863213) (not e!740998))))

(declare-fun e!740996 () Bool)

(assert (=> b!1298865 (= res!863213 (not e!740996))))

(declare-fun res!863212 () Bool)

(assert (=> b!1298865 (=> (not res!863212) (not e!740996))))

(assert (=> b!1298865 (= res!863212 (validKeyInArray!0 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!140959 () Bool)

(declare-fun res!863211 () Bool)

(assert (=> d!140959 (=> res!863211 e!740999)))

(assert (=> d!140959 (= res!863211 (bvsge #b00000000000000000000000000000000 (size!42269 _keys!1741)))))

(assert (=> d!140959 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29676) e!740999)))

(declare-fun b!1298866 () Bool)

(declare-fun contains!8173 (List!29679 (_ BitVec 64)) Bool)

(assert (=> b!1298866 (= e!740996 (contains!8173 Nil!29676 (select (arr!41717 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!140959 (not res!863211)) b!1298865))

(assert (= (and b!1298865 res!863212) b!1298866))

(assert (= (and b!1298865 res!863213) b!1298864))

(assert (= (and b!1298864 c!124428) b!1298863))

(assert (= (and b!1298864 (not c!124428)) b!1298862))

(assert (= (or b!1298863 b!1298862) bm!63514))

(assert (=> bm!63514 m!1189625))

(declare-fun m!1189707 () Bool)

(assert (=> bm!63514 m!1189707))

(assert (=> b!1298864 m!1189625))

(assert (=> b!1298864 m!1189625))

(assert (=> b!1298864 m!1189627))

(assert (=> b!1298865 m!1189625))

(assert (=> b!1298865 m!1189625))

(assert (=> b!1298865 m!1189627))

(assert (=> b!1298866 m!1189625))

(assert (=> b!1298866 m!1189625))

(declare-fun m!1189709 () Bool)

(assert (=> b!1298866 m!1189709))

(assert (=> b!1298679 d!140959))

(declare-fun d!140961 () Bool)

(declare-fun e!741000 () Bool)

(assert (=> d!140961 e!741000))

(declare-fun res!863214 () Bool)

(assert (=> d!140961 (=> res!863214 e!741000)))

(declare-fun lt!580666 () Bool)

(assert (=> d!140961 (= res!863214 (not lt!580666))))

(declare-fun lt!580665 () Bool)

(assert (=> d!140961 (= lt!580666 lt!580665)))

(declare-fun lt!580667 () Unit!42848)

(declare-fun e!741001 () Unit!42848)

(assert (=> d!140961 (= lt!580667 e!741001)))

(declare-fun c!124429 () Bool)

(assert (=> d!140961 (= c!124429 lt!580665)))

(assert (=> d!140961 (= lt!580665 (containsKey!715 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!140961 (= (contains!8171 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!580666)))

(declare-fun b!1298867 () Bool)

(declare-fun lt!580664 () Unit!42848)

(assert (=> b!1298867 (= e!741001 lt!580664)))

(assert (=> b!1298867 (= lt!580664 (lemmaContainsKeyImpliesGetValueByKeyDefined!462 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1298867 (isDefined!505 (getValueByKey!698 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1298868 () Bool)

(declare-fun Unit!42852 () Unit!42848)

(assert (=> b!1298868 (= e!741001 Unit!42852)))

(declare-fun b!1298869 () Bool)

(assert (=> b!1298869 (= e!741000 (isDefined!505 (getValueByKey!698 (toList!10123 (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!140961 c!124429) b!1298867))

(assert (= (and d!140961 (not c!124429)) b!1298868))

(assert (= (and d!140961 (not res!863214)) b!1298869))

(declare-fun m!1189711 () Bool)

(assert (=> d!140961 m!1189711))

(declare-fun m!1189713 () Bool)

(assert (=> b!1298867 m!1189713))

(declare-fun m!1189715 () Bool)

(assert (=> b!1298867 m!1189715))

(assert (=> b!1298867 m!1189715))

(declare-fun m!1189717 () Bool)

(assert (=> b!1298867 m!1189717))

(assert (=> b!1298869 m!1189715))

(assert (=> b!1298869 m!1189715))

(assert (=> b!1298869 m!1189717))

(assert (=> b!1298684 d!140961))

(declare-fun b!1298870 () Bool)

(declare-fun res!863217 () Bool)

(declare-fun e!741005 () Bool)

(assert (=> b!1298870 (=> (not res!863217) (not e!741005))))

(declare-fun e!741011 () Bool)

(assert (=> b!1298870 (= res!863217 e!741011)))

(declare-fun c!124434 () Bool)

(assert (=> b!1298870 (= c!124434 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741003 () Bool)

(declare-fun lt!580682 () ListLongMap!20215)

(declare-fun b!1298871 () Bool)

(assert (=> b!1298871 (= e!741003 (= (apply!1005 lt!580682 (select (arr!41717 _keys!1741) from!2144)) (get!21099 (select (arr!41718 _values!1445) from!2144) (dynLambda!3440 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1298871 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42270 _values!1445)))))

(assert (=> b!1298871 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42269 _keys!1741)))))

(declare-fun b!1298872 () Bool)

(declare-fun e!741006 () Bool)

(declare-fun call!63522 () Bool)

(assert (=> b!1298872 (= e!741006 (not call!63522))))

(declare-fun b!1298873 () Bool)

(declare-fun e!741009 () ListLongMap!20215)

(declare-fun call!63523 () ListLongMap!20215)

(assert (=> b!1298873 (= e!741009 (+!4474 call!63523 (tuple2!22559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1298874 () Bool)

(declare-fun e!741013 () ListLongMap!20215)

(declare-fun call!63518 () ListLongMap!20215)

(assert (=> b!1298874 (= e!741013 call!63518)))

(declare-fun b!1298875 () Bool)

(declare-fun e!741010 () Unit!42848)

(declare-fun Unit!42853 () Unit!42848)

(assert (=> b!1298875 (= e!741010 Unit!42853)))

(declare-fun call!63524 () ListLongMap!20215)

(declare-fun bm!63515 () Bool)

(assert (=> bm!63515 (= call!63524 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1298876 () Bool)

(declare-fun lt!580678 () Unit!42848)

(assert (=> b!1298876 (= e!741010 lt!580678)))

(declare-fun lt!580668 () ListLongMap!20215)

(assert (=> b!1298876 (= lt!580668 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580670 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580674 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580674 (select (arr!41717 _keys!1741) from!2144))))

(declare-fun lt!580673 () Unit!42848)

(assert (=> b!1298876 (= lt!580673 (addStillContains!1100 lt!580668 lt!580670 zeroValue!1387 lt!580674))))

(assert (=> b!1298876 (contains!8171 (+!4474 lt!580668 (tuple2!22559 lt!580670 zeroValue!1387)) lt!580674)))

(declare-fun lt!580687 () Unit!42848)

(assert (=> b!1298876 (= lt!580687 lt!580673)))

(declare-fun lt!580679 () ListLongMap!20215)

(assert (=> b!1298876 (= lt!580679 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580685 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580684 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580684 (select (arr!41717 _keys!1741) from!2144))))

(declare-fun lt!580689 () Unit!42848)

(assert (=> b!1298876 (= lt!580689 (addApplyDifferent!543 lt!580679 lt!580685 minValue!1387 lt!580684))))

(assert (=> b!1298876 (= (apply!1005 (+!4474 lt!580679 (tuple2!22559 lt!580685 minValue!1387)) lt!580684) (apply!1005 lt!580679 lt!580684))))

(declare-fun lt!580683 () Unit!42848)

(assert (=> b!1298876 (= lt!580683 lt!580689)))

(declare-fun lt!580688 () ListLongMap!20215)

(assert (=> b!1298876 (= lt!580688 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580671 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580680 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580680 (select (arr!41717 _keys!1741) from!2144))))

(declare-fun lt!580672 () Unit!42848)

(assert (=> b!1298876 (= lt!580672 (addApplyDifferent!543 lt!580688 lt!580671 zeroValue!1387 lt!580680))))

(assert (=> b!1298876 (= (apply!1005 (+!4474 lt!580688 (tuple2!22559 lt!580671 zeroValue!1387)) lt!580680) (apply!1005 lt!580688 lt!580680))))

(declare-fun lt!580676 () Unit!42848)

(assert (=> b!1298876 (= lt!580676 lt!580672)))

(declare-fun lt!580681 () ListLongMap!20215)

(assert (=> b!1298876 (= lt!580681 (getCurrentListMapNoExtraKeys!6105 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580675 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580675 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580669 () (_ BitVec 64))

(assert (=> b!1298876 (= lt!580669 (select (arr!41717 _keys!1741) from!2144))))

(assert (=> b!1298876 (= lt!580678 (addApplyDifferent!543 lt!580681 lt!580675 minValue!1387 lt!580669))))

(assert (=> b!1298876 (= (apply!1005 (+!4474 lt!580681 (tuple2!22559 lt!580675 minValue!1387)) lt!580669) (apply!1005 lt!580681 lt!580669))))

(declare-fun b!1298877 () Bool)

(declare-fun c!124431 () Bool)

(assert (=> b!1298877 (= c!124431 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741014 () ListLongMap!20215)

(assert (=> b!1298877 (= e!741014 e!741013)))

(declare-fun b!1298878 () Bool)

(declare-fun e!741007 () Bool)

(assert (=> b!1298878 (= e!741007 (validKeyInArray!0 (select (arr!41717 _keys!1741) from!2144)))))

(declare-fun bm!63516 () Bool)

(declare-fun call!63521 () ListLongMap!20215)

(assert (=> bm!63516 (= call!63521 call!63523)))

(declare-fun b!1298879 () Bool)

(assert (=> b!1298879 (= e!741014 call!63521)))

(declare-fun b!1298880 () Bool)

(declare-fun e!741002 () Bool)

(assert (=> b!1298880 (= e!741006 e!741002)))

(declare-fun res!863215 () Bool)

(assert (=> b!1298880 (= res!863215 call!63522)))

(assert (=> b!1298880 (=> (not res!863215) (not e!741002))))

(declare-fun bm!63517 () Bool)

(assert (=> bm!63517 (= call!63522 (contains!8171 lt!580682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!63519 () ListLongMap!20215)

(declare-fun c!124433 () Bool)

(declare-fun bm!63518 () Bool)

(declare-fun c!124435 () Bool)

(assert (=> bm!63518 (= call!63523 (+!4474 (ite c!124433 call!63524 (ite c!124435 call!63519 call!63518)) (ite (or c!124433 c!124435) (tuple2!22559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1298881 () Bool)

(assert (=> b!1298881 (= e!741005 e!741006)))

(declare-fun c!124432 () Bool)

(assert (=> b!1298881 (= c!124432 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1298882 () Bool)

(declare-fun e!741004 () Bool)

(assert (=> b!1298882 (= e!741004 (validKeyInArray!0 (select (arr!41717 _keys!1741) from!2144)))))

(declare-fun b!1298883 () Bool)

(declare-fun e!741008 () Bool)

(assert (=> b!1298883 (= e!741008 e!741003)))

(declare-fun res!863221 () Bool)

(assert (=> b!1298883 (=> (not res!863221) (not e!741003))))

(assert (=> b!1298883 (= res!863221 (contains!8171 lt!580682 (select (arr!41717 _keys!1741) from!2144)))))

(assert (=> b!1298883 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42269 _keys!1741)))))

(declare-fun b!1298884 () Bool)

(declare-fun res!863220 () Bool)

(assert (=> b!1298884 (=> (not res!863220) (not e!741005))))

(assert (=> b!1298884 (= res!863220 e!741008)))

(declare-fun res!863223 () Bool)

(assert (=> b!1298884 (=> res!863223 e!741008)))

(assert (=> b!1298884 (= res!863223 (not e!741004))))

(declare-fun res!863222 () Bool)

(assert (=> b!1298884 (=> (not res!863222) (not e!741004))))

(assert (=> b!1298884 (= res!863222 (bvslt from!2144 (size!42269 _keys!1741)))))

(declare-fun b!1298885 () Bool)

(assert (=> b!1298885 (= e!741002 (= (apply!1005 lt!580682 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!63519 () Bool)

(declare-fun call!63520 () Bool)

(assert (=> bm!63519 (= call!63520 (contains!8171 lt!580682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1298886 () Bool)

(declare-fun e!741012 () Bool)

(assert (=> b!1298886 (= e!741012 (= (apply!1005 lt!580682 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1298887 () Bool)

(assert (=> b!1298887 (= e!741009 e!741014)))

(assert (=> b!1298887 (= c!124435 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!140963 () Bool)

(assert (=> d!140963 e!741005))

(declare-fun res!863219 () Bool)

(assert (=> d!140963 (=> (not res!863219) (not e!741005))))

(assert (=> d!140963 (= res!863219 (or (bvsge from!2144 (size!42269 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42269 _keys!1741)))))))

(declare-fun lt!580677 () ListLongMap!20215)

(assert (=> d!140963 (= lt!580682 lt!580677)))

(declare-fun lt!580686 () Unit!42848)

(assert (=> d!140963 (= lt!580686 e!741010)))

(declare-fun c!124430 () Bool)

(assert (=> d!140963 (= c!124430 e!741007)))

(declare-fun res!863216 () Bool)

(assert (=> d!140963 (=> (not res!863216) (not e!741007))))

(assert (=> d!140963 (= res!863216 (bvslt from!2144 (size!42269 _keys!1741)))))

(assert (=> d!140963 (= lt!580677 e!741009)))

(assert (=> d!140963 (= c!124433 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!140963 (validMask!0 mask!2175)))

(assert (=> d!140963 (= (getCurrentListMap!5039 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!580682)))

(declare-fun b!1298888 () Bool)

(assert (=> b!1298888 (= e!741011 (not call!63520))))

(declare-fun bm!63520 () Bool)

(assert (=> bm!63520 (= call!63518 call!63519)))

(declare-fun b!1298889 () Bool)

(assert (=> b!1298889 (= e!741011 e!741012)))

(declare-fun res!863218 () Bool)

(assert (=> b!1298889 (= res!863218 call!63520)))

(assert (=> b!1298889 (=> (not res!863218) (not e!741012))))

(declare-fun b!1298890 () Bool)

(assert (=> b!1298890 (= e!741013 call!63521)))

(declare-fun bm!63521 () Bool)

(assert (=> bm!63521 (= call!63519 call!63524)))

(assert (= (and d!140963 c!124433) b!1298873))

(assert (= (and d!140963 (not c!124433)) b!1298887))

(assert (= (and b!1298887 c!124435) b!1298879))

(assert (= (and b!1298887 (not c!124435)) b!1298877))

(assert (= (and b!1298877 c!124431) b!1298890))

(assert (= (and b!1298877 (not c!124431)) b!1298874))

(assert (= (or b!1298890 b!1298874) bm!63520))

(assert (= (or b!1298879 bm!63520) bm!63521))

(assert (= (or b!1298879 b!1298890) bm!63516))

(assert (= (or b!1298873 bm!63521) bm!63515))

(assert (= (or b!1298873 bm!63516) bm!63518))

(assert (= (and d!140963 res!863216) b!1298878))

(assert (= (and d!140963 c!124430) b!1298876))

(assert (= (and d!140963 (not c!124430)) b!1298875))

(assert (= (and d!140963 res!863219) b!1298884))

(assert (= (and b!1298884 res!863222) b!1298882))

(assert (= (and b!1298884 (not res!863223)) b!1298883))

(assert (= (and b!1298883 res!863221) b!1298871))

(assert (= (and b!1298884 res!863220) b!1298870))

(assert (= (and b!1298870 c!124434) b!1298889))

(assert (= (and b!1298870 (not c!124434)) b!1298888))

(assert (= (and b!1298889 res!863218) b!1298886))

(assert (= (or b!1298889 b!1298888) bm!63519))

(assert (= (and b!1298870 res!863217) b!1298881))

(assert (= (and b!1298881 c!124432) b!1298880))

(assert (= (and b!1298881 (not c!124432)) b!1298872))

(assert (= (and b!1298880 res!863215) b!1298885))

(assert (= (or b!1298880 b!1298872) bm!63517))

(declare-fun b_lambda!23129 () Bool)

(assert (=> (not b_lambda!23129) (not b!1298871)))

(assert (=> b!1298871 t!43240))

(declare-fun b_and!47205 () Bool)

(assert (= b_and!47203 (and (=> t!43240 result!23731) b_and!47205)))

(declare-fun m!1189719 () Bool)

(assert (=> bm!63515 m!1189719))

(assert (=> b!1298883 m!1189527))

(assert (=> b!1298883 m!1189527))

(declare-fun m!1189721 () Bool)

(assert (=> b!1298883 m!1189721))

(declare-fun m!1189723 () Bool)

(assert (=> b!1298886 m!1189723))

(assert (=> b!1298878 m!1189527))

(assert (=> b!1298878 m!1189527))

(declare-fun m!1189725 () Bool)

(assert (=> b!1298878 m!1189725))

(assert (=> b!1298871 m!1189527))

(declare-fun m!1189727 () Bool)

(assert (=> b!1298871 m!1189727))

(declare-fun m!1189729 () Bool)

(assert (=> b!1298871 m!1189729))

(assert (=> b!1298871 m!1189657))

(declare-fun m!1189731 () Bool)

(assert (=> b!1298871 m!1189731))

(assert (=> b!1298871 m!1189729))

(assert (=> b!1298871 m!1189527))

(assert (=> b!1298871 m!1189657))

(assert (=> b!1298882 m!1189527))

(assert (=> b!1298882 m!1189527))

(assert (=> b!1298882 m!1189725))

(declare-fun m!1189733 () Bool)

(assert (=> bm!63517 m!1189733))

(declare-fun m!1189735 () Bool)

(assert (=> bm!63518 m!1189735))

(declare-fun m!1189737 () Bool)

(assert (=> b!1298876 m!1189737))

(declare-fun m!1189739 () Bool)

(assert (=> b!1298876 m!1189739))

(declare-fun m!1189741 () Bool)

(assert (=> b!1298876 m!1189741))

(declare-fun m!1189743 () Bool)

(assert (=> b!1298876 m!1189743))

(declare-fun m!1189745 () Bool)

(assert (=> b!1298876 m!1189745))

(declare-fun m!1189747 () Bool)

(assert (=> b!1298876 m!1189747))

(declare-fun m!1189749 () Bool)

(assert (=> b!1298876 m!1189749))

(declare-fun m!1189751 () Bool)

(assert (=> b!1298876 m!1189751))

(assert (=> b!1298876 m!1189745))

(declare-fun m!1189753 () Bool)

(assert (=> b!1298876 m!1189753))

(assert (=> b!1298876 m!1189741))

(declare-fun m!1189755 () Bool)

(assert (=> b!1298876 m!1189755))

(declare-fun m!1189757 () Bool)

(assert (=> b!1298876 m!1189757))

(declare-fun m!1189759 () Bool)

(assert (=> b!1298876 m!1189759))

(declare-fun m!1189761 () Bool)

(assert (=> b!1298876 m!1189761))

(assert (=> b!1298876 m!1189527))

(declare-fun m!1189763 () Bool)

(assert (=> b!1298876 m!1189763))

(declare-fun m!1189765 () Bool)

(assert (=> b!1298876 m!1189765))

(assert (=> b!1298876 m!1189737))

(assert (=> b!1298876 m!1189749))

(assert (=> b!1298876 m!1189719))

(declare-fun m!1189767 () Bool)

(assert (=> b!1298873 m!1189767))

(declare-fun m!1189769 () Bool)

(assert (=> b!1298885 m!1189769))

(declare-fun m!1189771 () Bool)

(assert (=> bm!63519 m!1189771))

(assert (=> d!140963 m!1189551))

(assert (=> b!1298684 d!140963))

(declare-fun mapIsEmpty!53717 () Bool)

(declare-fun mapRes!53717 () Bool)

(assert (=> mapIsEmpty!53717 mapRes!53717))

(declare-fun condMapEmpty!53717 () Bool)

(declare-fun mapDefault!53717 () ValueCell!16484)

(assert (=> mapNonEmpty!53708 (= condMapEmpty!53717 (= mapRest!53708 ((as const (Array (_ BitVec 32) ValueCell!16484)) mapDefault!53717)))))

(declare-fun e!741020 () Bool)

(assert (=> mapNonEmpty!53708 (= tp!102494 (and e!741020 mapRes!53717))))

(declare-fun b!1298898 () Bool)

(assert (=> b!1298898 (= e!741020 tp_is_empty!34765)))

(declare-fun mapNonEmpty!53717 () Bool)

(declare-fun tp!102510 () Bool)

(declare-fun e!741019 () Bool)

(assert (=> mapNonEmpty!53717 (= mapRes!53717 (and tp!102510 e!741019))))

(declare-fun mapKey!53717 () (_ BitVec 32))

(declare-fun mapValue!53717 () ValueCell!16484)

(declare-fun mapRest!53717 () (Array (_ BitVec 32) ValueCell!16484))

(assert (=> mapNonEmpty!53717 (= mapRest!53708 (store mapRest!53717 mapKey!53717 mapValue!53717))))

(declare-fun b!1298897 () Bool)

(assert (=> b!1298897 (= e!741019 tp_is_empty!34765)))

(assert (= (and mapNonEmpty!53708 condMapEmpty!53717) mapIsEmpty!53717))

(assert (= (and mapNonEmpty!53708 (not condMapEmpty!53717)) mapNonEmpty!53717))

(assert (= (and mapNonEmpty!53717 ((_ is ValueCellFull!16484) mapValue!53717)) b!1298897))

(assert (= (and mapNonEmpty!53708 ((_ is ValueCellFull!16484) mapDefault!53717)) b!1298898))

(declare-fun m!1189773 () Bool)

(assert (=> mapNonEmpty!53717 m!1189773))

(declare-fun b_lambda!23131 () Bool)

(assert (= b_lambda!23129 (or (and start!109636 b_free!29125) b_lambda!23131)))

(declare-fun b_lambda!23133 () Bool)

(assert (= b_lambda!23127 (or (and start!109636 b_free!29125) b_lambda!23133)))

(check-sat (not b!1298882) (not bm!63505) b_and!47205 (not b!1298873) (not b!1298885) (not b_lambda!23131) (not b!1298777) (not b!1298883) (not b!1298878) (not bm!63508) (not mapNonEmpty!53717) (not bm!63518) (not bm!63519) tp_is_empty!34765 (not b!1298886) (not d!140957) (not b!1298844) (not b!1298867) (not b!1298835) (not b!1298869) (not b!1298845) (not b!1298832) (not b!1298774) (not bm!63515) (not b!1298864) (not d!140955) (not b!1298830) (not bm!63507) (not b_next!29125) (not bm!63517) (not bm!63509) (not b!1298842) (not b!1298784) (not b!1298764) (not b_lambda!23133) (not bm!63490) (not b!1298786) (not d!140953) (not b!1298876) (not b!1298837) (not d!140963) (not b!1298759) (not bm!63514) (not b!1298871) (not b!1298841) (not b!1298866) (not b!1298865) (not b!1298757) (not d!140961) (not d!140943))
(check-sat b_and!47205 (not b_next!29125))
