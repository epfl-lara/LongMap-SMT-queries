; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110070 () Bool)

(assert start!110070)

(declare-fun b_free!29269 () Bool)

(declare-fun b_next!29269 () Bool)

(assert (=> start!110070 (= b_free!29269 (not b_next!29269))))

(declare-fun tp!102958 () Bool)

(declare-fun b_and!47415 () Bool)

(assert (=> start!110070 (= tp!102958 b_and!47415)))

(declare-fun b!1303518 () Bool)

(declare-fun e!743518 () Bool)

(declare-fun e!743517 () Bool)

(assert (=> b!1303518 (= e!743518 (not e!743517))))

(declare-fun res!865807 () Bool)

(assert (=> b!1303518 (=> res!865807 e!743517)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303518 (= res!865807 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51649 0))(
  ( (V!51650 (val!17529 Int)) )
))
(declare-datatypes ((tuple2!22682 0))(
  ( (tuple2!22683 (_1!11352 (_ BitVec 64)) (_2!11352 V!51649)) )
))
(declare-datatypes ((List!29790 0))(
  ( (Nil!29787) (Cons!29786 (h!30995 tuple2!22682) (t!43376 List!29790)) )
))
(declare-datatypes ((ListLongMap!20339 0))(
  ( (ListLongMap!20340 (toList!10185 List!29790)) )
))
(declare-fun contains!8249 (ListLongMap!20339 (_ BitVec 64)) Bool)

(assert (=> b!1303518 (not (contains!8249 (ListLongMap!20340 Nil!29787) k0!1205))))

(declare-datatypes ((Unit!43007 0))(
  ( (Unit!43008) )
))
(declare-fun lt!583164 () Unit!43007)

(declare-fun emptyContainsNothing!215 ((_ BitVec 64)) Unit!43007)

(assert (=> b!1303518 (= lt!583164 (emptyContainsNothing!215 k0!1205))))

(declare-fun b!1303519 () Bool)

(declare-fun e!743516 () Bool)

(assert (=> b!1303519 (= e!743517 e!743516)))

(declare-fun res!865801 () Bool)

(assert (=> b!1303519 (=> (not res!865801) (not e!743516))))

(declare-fun minValue!1387 () V!51649)

(declare-fun zeroValue!1387 () V!51649)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16556 0))(
  ( (ValueCellFull!16556 (v!20144 V!51649)) (EmptyCell!16556) )
))
(declare-datatypes ((array!86735 0))(
  ( (array!86736 (arr!41859 (Array (_ BitVec 32) ValueCell!16556)) (size!42411 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86735)

(declare-datatypes ((array!86737 0))(
  ( (array!86738 (arr!41860 (Array (_ BitVec 32) (_ BitVec 64))) (size!42412 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86737)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6147 (array!86737 array!86735 (_ BitVec 32) (_ BitVec 32) V!51649 V!51649 (_ BitVec 32) Int) ListLongMap!20339)

(assert (=> b!1303519 (= res!865801 (not (contains!8249 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1303520 () Bool)

(assert (=> b!1303520 (= e!743516 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun mapIsEmpty!53956 () Bool)

(declare-fun mapRes!53956 () Bool)

(assert (=> mapIsEmpty!53956 mapRes!53956))

(declare-fun b!1303521 () Bool)

(declare-fun res!865802 () Bool)

(assert (=> b!1303521 (=> (not res!865802) (not e!743518))))

(assert (=> b!1303521 (= res!865802 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42412 _keys!1741))))))

(declare-fun b!1303522 () Bool)

(declare-fun res!865810 () Bool)

(assert (=> b!1303522 (=> (not res!865810) (not e!743518))))

(declare-datatypes ((List!29791 0))(
  ( (Nil!29788) (Cons!29787 (h!30996 (_ BitVec 64)) (t!43377 List!29791)) )
))
(declare-fun arrayNoDuplicates!0 (array!86737 (_ BitVec 32) List!29791) Bool)

(assert (=> b!1303522 (= res!865810 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29788))))

(declare-fun b!1303523 () Bool)

(declare-fun e!743515 () Bool)

(declare-fun tp_is_empty!34909 () Bool)

(assert (=> b!1303523 (= e!743515 tp_is_empty!34909)))

(declare-fun b!1303524 () Bool)

(declare-fun res!865803 () Bool)

(assert (=> b!1303524 (=> (not res!865803) (not e!743518))))

(declare-fun getCurrentListMap!5087 (array!86737 array!86735 (_ BitVec 32) (_ BitVec 32) V!51649 V!51649 (_ BitVec 32) Int) ListLongMap!20339)

(assert (=> b!1303524 (= res!865803 (contains!8249 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!865808 () Bool)

(assert (=> start!110070 (=> (not res!865808) (not e!743518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110070 (= res!865808 (validMask!0 mask!2175))))

(assert (=> start!110070 e!743518))

(assert (=> start!110070 tp_is_empty!34909))

(assert (=> start!110070 true))

(declare-fun e!743514 () Bool)

(declare-fun array_inv!31839 (array!86735) Bool)

(assert (=> start!110070 (and (array_inv!31839 _values!1445) e!743514)))

(declare-fun array_inv!31840 (array!86737) Bool)

(assert (=> start!110070 (array_inv!31840 _keys!1741)))

(assert (=> start!110070 tp!102958))

(declare-fun b!1303525 () Bool)

(declare-fun e!743513 () Bool)

(assert (=> b!1303525 (= e!743513 tp_is_empty!34909)))

(declare-fun b!1303526 () Bool)

(declare-fun res!865809 () Bool)

(assert (=> b!1303526 (=> (not res!865809) (not e!743518))))

(assert (=> b!1303526 (= res!865809 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42412 _keys!1741))))))

(declare-fun mapNonEmpty!53956 () Bool)

(declare-fun tp!102959 () Bool)

(assert (=> mapNonEmpty!53956 (= mapRes!53956 (and tp!102959 e!743513))))

(declare-fun mapValue!53956 () ValueCell!16556)

(declare-fun mapKey!53956 () (_ BitVec 32))

(declare-fun mapRest!53956 () (Array (_ BitVec 32) ValueCell!16556))

(assert (=> mapNonEmpty!53956 (= (arr!41859 _values!1445) (store mapRest!53956 mapKey!53956 mapValue!53956))))

(declare-fun b!1303527 () Bool)

(declare-fun res!865805 () Bool)

(assert (=> b!1303527 (=> (not res!865805) (not e!743518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86737 (_ BitVec 32)) Bool)

(assert (=> b!1303527 (= res!865805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303528 () Bool)

(declare-fun res!865804 () Bool)

(assert (=> b!1303528 (=> (not res!865804) (not e!743518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303528 (= res!865804 (not (validKeyInArray!0 (select (arr!41860 _keys!1741) from!2144))))))

(declare-fun b!1303529 () Bool)

(declare-fun res!865806 () Bool)

(assert (=> b!1303529 (=> (not res!865806) (not e!743518))))

(assert (=> b!1303529 (= res!865806 (and (= (size!42411 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42412 _keys!1741) (size!42411 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303530 () Bool)

(assert (=> b!1303530 (= e!743514 (and e!743515 mapRes!53956))))

(declare-fun condMapEmpty!53956 () Bool)

(declare-fun mapDefault!53956 () ValueCell!16556)

(assert (=> b!1303530 (= condMapEmpty!53956 (= (arr!41859 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16556)) mapDefault!53956)))))

(assert (= (and start!110070 res!865808) b!1303529))

(assert (= (and b!1303529 res!865806) b!1303527))

(assert (= (and b!1303527 res!865805) b!1303522))

(assert (= (and b!1303522 res!865810) b!1303521))

(assert (= (and b!1303521 res!865802) b!1303524))

(assert (= (and b!1303524 res!865803) b!1303526))

(assert (= (and b!1303526 res!865809) b!1303528))

(assert (= (and b!1303528 res!865804) b!1303518))

(assert (= (and b!1303518 (not res!865807)) b!1303519))

(assert (= (and b!1303519 res!865801) b!1303520))

(assert (= (and b!1303530 condMapEmpty!53956) mapIsEmpty!53956))

(assert (= (and b!1303530 (not condMapEmpty!53956)) mapNonEmpty!53956))

(get-info :version)

(assert (= (and mapNonEmpty!53956 ((_ is ValueCellFull!16556) mapValue!53956)) b!1303525))

(assert (= (and b!1303530 ((_ is ValueCellFull!16556) mapDefault!53956)) b!1303523))

(assert (= start!110070 b!1303530))

(declare-fun m!1193995 () Bool)

(assert (=> b!1303524 m!1193995))

(assert (=> b!1303524 m!1193995))

(declare-fun m!1193997 () Bool)

(assert (=> b!1303524 m!1193997))

(declare-fun m!1193999 () Bool)

(assert (=> b!1303527 m!1193999))

(declare-fun m!1194001 () Bool)

(assert (=> b!1303522 m!1194001))

(declare-fun m!1194003 () Bool)

(assert (=> b!1303519 m!1194003))

(assert (=> b!1303519 m!1194003))

(declare-fun m!1194005 () Bool)

(assert (=> b!1303519 m!1194005))

(declare-fun m!1194007 () Bool)

(assert (=> b!1303518 m!1194007))

(declare-fun m!1194009 () Bool)

(assert (=> b!1303518 m!1194009))

(declare-fun m!1194011 () Bool)

(assert (=> b!1303528 m!1194011))

(assert (=> b!1303528 m!1194011))

(declare-fun m!1194013 () Bool)

(assert (=> b!1303528 m!1194013))

(declare-fun m!1194015 () Bool)

(assert (=> start!110070 m!1194015))

(declare-fun m!1194017 () Bool)

(assert (=> start!110070 m!1194017))

(declare-fun m!1194019 () Bool)

(assert (=> start!110070 m!1194019))

(declare-fun m!1194021 () Bool)

(assert (=> mapNonEmpty!53956 m!1194021))

(check-sat (not b_next!29269) tp_is_empty!34909 (not b!1303519) (not start!110070) (not b!1303528) (not b!1303524) (not mapNonEmpty!53956) (not b!1303522) b_and!47415 (not b!1303527) (not b!1303518))
(check-sat b_and!47415 (not b_next!29269))
(get-model)

(declare-fun d!141533 () Bool)

(assert (=> d!141533 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110070 d!141533))

(declare-fun d!141535 () Bool)

(assert (=> d!141535 (= (array_inv!31839 _values!1445) (bvsge (size!42411 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110070 d!141535))

(declare-fun d!141537 () Bool)

(assert (=> d!141537 (= (array_inv!31840 _keys!1741) (bvsge (size!42412 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110070 d!141537))

(declare-fun d!141539 () Bool)

(declare-fun e!743565 () Bool)

(assert (=> d!141539 e!743565))

(declare-fun res!865873 () Bool)

(assert (=> d!141539 (=> res!865873 e!743565)))

(declare-fun lt!583182 () Bool)

(assert (=> d!141539 (= res!865873 (not lt!583182))))

(declare-fun lt!583181 () Bool)

(assert (=> d!141539 (= lt!583182 lt!583181)))

(declare-fun lt!583180 () Unit!43007)

(declare-fun e!743566 () Unit!43007)

(assert (=> d!141539 (= lt!583180 e!743566)))

(declare-fun c!125089 () Bool)

(assert (=> d!141539 (= c!125089 lt!583181)))

(declare-fun containsKey!725 (List!29790 (_ BitVec 64)) Bool)

(assert (=> d!141539 (= lt!583181 (containsKey!725 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))

(assert (=> d!141539 (= (contains!8249 (ListLongMap!20340 Nil!29787) k0!1205) lt!583182)))

(declare-fun b!1303615 () Bool)

(declare-fun lt!583179 () Unit!43007)

(assert (=> b!1303615 (= e!743566 lt!583179)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!472 (List!29790 (_ BitVec 64)) Unit!43007)

(assert (=> b!1303615 (= lt!583179 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))

(declare-datatypes ((Option!759 0))(
  ( (Some!758 (v!20147 V!51649)) (None!757) )
))
(declare-fun isDefined!515 (Option!759) Bool)

(declare-fun getValueByKey!708 (List!29790 (_ BitVec 64)) Option!759)

(assert (=> b!1303615 (isDefined!515 (getValueByKey!708 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))

(declare-fun b!1303616 () Bool)

(declare-fun Unit!43013 () Unit!43007)

(assert (=> b!1303616 (= e!743566 Unit!43013)))

(declare-fun b!1303617 () Bool)

(assert (=> b!1303617 (= e!743565 (isDefined!515 (getValueByKey!708 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205)))))

(assert (= (and d!141539 c!125089) b!1303615))

(assert (= (and d!141539 (not c!125089)) b!1303616))

(assert (= (and d!141539 (not res!865873)) b!1303617))

(declare-fun m!1194079 () Bool)

(assert (=> d!141539 m!1194079))

(declare-fun m!1194081 () Bool)

(assert (=> b!1303615 m!1194081))

(declare-fun m!1194083 () Bool)

(assert (=> b!1303615 m!1194083))

(assert (=> b!1303615 m!1194083))

(declare-fun m!1194085 () Bool)

(assert (=> b!1303615 m!1194085))

(assert (=> b!1303617 m!1194083))

(assert (=> b!1303617 m!1194083))

(assert (=> b!1303617 m!1194085))

(assert (=> b!1303518 d!141539))

(declare-fun d!141541 () Bool)

(assert (=> d!141541 (not (contains!8249 (ListLongMap!20340 Nil!29787) k0!1205))))

(declare-fun lt!583185 () Unit!43007)

(declare-fun choose!1930 ((_ BitVec 64)) Unit!43007)

(assert (=> d!141541 (= lt!583185 (choose!1930 k0!1205))))

(assert (=> d!141541 (= (emptyContainsNothing!215 k0!1205) lt!583185)))

(declare-fun bs!37097 () Bool)

(assert (= bs!37097 d!141541))

(assert (=> bs!37097 m!1194007))

(declare-fun m!1194087 () Bool)

(assert (=> bs!37097 m!1194087))

(assert (=> b!1303518 d!141541))

(declare-fun b!1303626 () Bool)

(declare-fun e!743574 () Bool)

(declare-fun call!64190 () Bool)

(assert (=> b!1303626 (= e!743574 call!64190)))

(declare-fun b!1303627 () Bool)

(declare-fun e!743573 () Bool)

(declare-fun e!743575 () Bool)

(assert (=> b!1303627 (= e!743573 e!743575)))

(declare-fun c!125092 () Bool)

(assert (=> b!1303627 (= c!125092 (validKeyInArray!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303628 () Bool)

(assert (=> b!1303628 (= e!743575 e!743574)))

(declare-fun lt!583194 () (_ BitVec 64))

(assert (=> b!1303628 (= lt!583194 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583192 () Unit!43007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86737 (_ BitVec 64) (_ BitVec 32)) Unit!43007)

(assert (=> b!1303628 (= lt!583192 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583194 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1303628 (arrayContainsKey!0 _keys!1741 lt!583194 #b00000000000000000000000000000000)))

(declare-fun lt!583193 () Unit!43007)

(assert (=> b!1303628 (= lt!583193 lt!583192)))

(declare-fun res!865879 () Bool)

(declare-datatypes ((SeekEntryResult!10024 0))(
  ( (MissingZero!10024 (index!42467 (_ BitVec 32))) (Found!10024 (index!42468 (_ BitVec 32))) (Intermediate!10024 (undefined!10836 Bool) (index!42469 (_ BitVec 32)) (x!115788 (_ BitVec 32))) (Undefined!10024) (MissingVacant!10024 (index!42470 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86737 (_ BitVec 32)) SeekEntryResult!10024)

(assert (=> b!1303628 (= res!865879 (= (seekEntryOrOpen!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10024 #b00000000000000000000000000000000)))))

(assert (=> b!1303628 (=> (not res!865879) (not e!743574))))

(declare-fun d!141543 () Bool)

(declare-fun res!865878 () Bool)

(assert (=> d!141543 (=> res!865878 e!743573)))

(assert (=> d!141543 (= res!865878 (bvsge #b00000000000000000000000000000000 (size!42412 _keys!1741)))))

(assert (=> d!141543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743573)))

(declare-fun bm!64187 () Bool)

(assert (=> bm!64187 (= call!64190 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303629 () Bool)

(assert (=> b!1303629 (= e!743575 call!64190)))

(assert (= (and d!141543 (not res!865878)) b!1303627))

(assert (= (and b!1303627 c!125092) b!1303628))

(assert (= (and b!1303627 (not c!125092)) b!1303629))

(assert (= (and b!1303628 res!865879) b!1303626))

(assert (= (or b!1303626 b!1303629) bm!64187))

(declare-fun m!1194089 () Bool)

(assert (=> b!1303627 m!1194089))

(assert (=> b!1303627 m!1194089))

(declare-fun m!1194091 () Bool)

(assert (=> b!1303627 m!1194091))

(assert (=> b!1303628 m!1194089))

(declare-fun m!1194093 () Bool)

(assert (=> b!1303628 m!1194093))

(declare-fun m!1194095 () Bool)

(assert (=> b!1303628 m!1194095))

(assert (=> b!1303628 m!1194089))

(declare-fun m!1194097 () Bool)

(assert (=> b!1303628 m!1194097))

(declare-fun m!1194099 () Bool)

(assert (=> bm!64187 m!1194099))

(assert (=> b!1303527 d!141543))

(declare-fun d!141545 () Bool)

(declare-fun e!743576 () Bool)

(assert (=> d!141545 e!743576))

(declare-fun res!865880 () Bool)

(assert (=> d!141545 (=> res!865880 e!743576)))

(declare-fun lt!583198 () Bool)

(assert (=> d!141545 (= res!865880 (not lt!583198))))

(declare-fun lt!583197 () Bool)

(assert (=> d!141545 (= lt!583198 lt!583197)))

(declare-fun lt!583196 () Unit!43007)

(declare-fun e!743577 () Unit!43007)

(assert (=> d!141545 (= lt!583196 e!743577)))

(declare-fun c!125093 () Bool)

(assert (=> d!141545 (= c!125093 lt!583197)))

(assert (=> d!141545 (= lt!583197 (containsKey!725 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141545 (= (contains!8249 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583198)))

(declare-fun b!1303630 () Bool)

(declare-fun lt!583195 () Unit!43007)

(assert (=> b!1303630 (= e!743577 lt!583195)))

(assert (=> b!1303630 (= lt!583195 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303630 (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303631 () Bool)

(declare-fun Unit!43014 () Unit!43007)

(assert (=> b!1303631 (= e!743577 Unit!43014)))

(declare-fun b!1303632 () Bool)

(assert (=> b!1303632 (= e!743576 (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141545 c!125093) b!1303630))

(assert (= (and d!141545 (not c!125093)) b!1303631))

(assert (= (and d!141545 (not res!865880)) b!1303632))

(declare-fun m!1194101 () Bool)

(assert (=> d!141545 m!1194101))

(declare-fun m!1194103 () Bool)

(assert (=> b!1303630 m!1194103))

(declare-fun m!1194105 () Bool)

(assert (=> b!1303630 m!1194105))

(assert (=> b!1303630 m!1194105))

(declare-fun m!1194107 () Bool)

(assert (=> b!1303630 m!1194107))

(assert (=> b!1303632 m!1194105))

(assert (=> b!1303632 m!1194105))

(assert (=> b!1303632 m!1194107))

(assert (=> b!1303519 d!141545))

(declare-fun b!1303658 () Bool)

(declare-fun e!743598 () ListLongMap!20339)

(declare-fun e!743596 () ListLongMap!20339)

(assert (=> b!1303658 (= e!743598 e!743596)))

(declare-fun c!125105 () Bool)

(assert (=> b!1303658 (= c!125105 (validKeyInArray!0 (select (arr!41860 _keys!1741) from!2144)))))

(declare-fun b!1303659 () Bool)

(declare-fun e!743597 () Bool)

(declare-fun e!743595 () Bool)

(assert (=> b!1303659 (= e!743597 e!743595)))

(assert (=> b!1303659 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42412 _keys!1741)))))

(declare-fun lt!583215 () ListLongMap!20339)

(declare-fun res!865892 () Bool)

(assert (=> b!1303659 (= res!865892 (contains!8249 lt!583215 (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> b!1303659 (=> (not res!865892) (not e!743595))))

(declare-fun b!1303660 () Bool)

(declare-fun e!743594 () Bool)

(assert (=> b!1303660 (= e!743594 e!743597)))

(declare-fun c!125104 () Bool)

(declare-fun e!743592 () Bool)

(assert (=> b!1303660 (= c!125104 e!743592)))

(declare-fun res!865889 () Bool)

(assert (=> b!1303660 (=> (not res!865889) (not e!743592))))

(assert (=> b!1303660 (= res!865889 (bvslt from!2144 (size!42412 _keys!1741)))))

(declare-fun b!1303661 () Bool)

(declare-fun e!743593 () Bool)

(declare-fun isEmpty!1068 (ListLongMap!20339) Bool)

(assert (=> b!1303661 (= e!743593 (isEmpty!1068 lt!583215))))

(declare-fun b!1303662 () Bool)

(assert (=> b!1303662 (= e!743598 (ListLongMap!20340 Nil!29787))))

(declare-fun b!1303663 () Bool)

(declare-fun call!64193 () ListLongMap!20339)

(assert (=> b!1303663 (= e!743596 call!64193)))

(declare-fun b!1303664 () Bool)

(assert (=> b!1303664 (= e!743593 (= lt!583215 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1303665 () Bool)

(declare-fun lt!583213 () Unit!43007)

(declare-fun lt!583214 () Unit!43007)

(assert (=> b!1303665 (= lt!583213 lt!583214)))

(declare-fun lt!583216 () ListLongMap!20339)

(declare-fun lt!583217 () (_ BitVec 64))

(declare-fun lt!583218 () (_ BitVec 64))

(declare-fun lt!583219 () V!51649)

(declare-fun +!4515 (ListLongMap!20339 tuple2!22682) ListLongMap!20339)

(assert (=> b!1303665 (not (contains!8249 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219)) lt!583217))))

(declare-fun addStillNotContains!468 (ListLongMap!20339 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43007)

(assert (=> b!1303665 (= lt!583214 (addStillNotContains!468 lt!583216 lt!583218 lt!583219 lt!583217))))

(assert (=> b!1303665 (= lt!583217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21166 (ValueCell!16556 V!51649) V!51649)

(declare-fun dynLambda!3453 (Int (_ BitVec 64)) V!51649)

(assert (=> b!1303665 (= lt!583219 (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303665 (= lt!583218 (select (arr!41860 _keys!1741) from!2144))))

(assert (=> b!1303665 (= lt!583216 call!64193)))

(assert (=> b!1303665 (= e!743596 (+!4515 call!64193 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303657 () Bool)

(assert (=> b!1303657 (= e!743597 e!743593)))

(declare-fun c!125103 () Bool)

(assert (=> b!1303657 (= c!125103 (bvslt from!2144 (size!42412 _keys!1741)))))

(declare-fun d!141547 () Bool)

(assert (=> d!141547 e!743594))

(declare-fun res!865891 () Bool)

(assert (=> d!141547 (=> (not res!865891) (not e!743594))))

(assert (=> d!141547 (= res!865891 (not (contains!8249 lt!583215 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141547 (= lt!583215 e!743598)))

(declare-fun c!125102 () Bool)

(assert (=> d!141547 (= c!125102 (bvsge from!2144 (size!42412 _keys!1741)))))

(assert (=> d!141547 (validMask!0 mask!2175)))

(assert (=> d!141547 (= (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583215)))

(declare-fun b!1303666 () Bool)

(assert (=> b!1303666 (= e!743592 (validKeyInArray!0 (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> b!1303666 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1303667 () Bool)

(declare-fun res!865890 () Bool)

(assert (=> b!1303667 (=> (not res!865890) (not e!743594))))

(assert (=> b!1303667 (= res!865890 (not (contains!8249 lt!583215 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!64190 () Bool)

(assert (=> bm!64190 (= call!64193 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303668 () Bool)

(assert (=> b!1303668 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42412 _keys!1741)))))

(assert (=> b!1303668 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42411 _values!1445)))))

(declare-fun apply!1015 (ListLongMap!20339 (_ BitVec 64)) V!51649)

(assert (=> b!1303668 (= e!743595 (= (apply!1015 lt!583215 (select (arr!41860 _keys!1741) from!2144)) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!141547 c!125102) b!1303662))

(assert (= (and d!141547 (not c!125102)) b!1303658))

(assert (= (and b!1303658 c!125105) b!1303665))

(assert (= (and b!1303658 (not c!125105)) b!1303663))

(assert (= (or b!1303665 b!1303663) bm!64190))

(assert (= (and d!141547 res!865891) b!1303667))

(assert (= (and b!1303667 res!865890) b!1303660))

(assert (= (and b!1303660 res!865889) b!1303666))

(assert (= (and b!1303660 c!125104) b!1303659))

(assert (= (and b!1303660 (not c!125104)) b!1303657))

(assert (= (and b!1303659 res!865892) b!1303668))

(assert (= (and b!1303657 c!125103) b!1303664))

(assert (= (and b!1303657 (not c!125103)) b!1303661))

(declare-fun b_lambda!23265 () Bool)

(assert (=> (not b_lambda!23265) (not b!1303665)))

(declare-fun t!43382 () Bool)

(declare-fun tb!11391 () Bool)

(assert (=> (and start!110070 (= defaultEntry!1448 defaultEntry!1448) t!43382) tb!11391))

(declare-fun result!23811 () Bool)

(assert (=> tb!11391 (= result!23811 tp_is_empty!34909)))

(assert (=> b!1303665 t!43382))

(declare-fun b_and!47421 () Bool)

(assert (= b_and!47415 (and (=> t!43382 result!23811) b_and!47421)))

(declare-fun b_lambda!23267 () Bool)

(assert (=> (not b_lambda!23267) (not b!1303668)))

(assert (=> b!1303668 t!43382))

(declare-fun b_and!47423 () Bool)

(assert (= b_and!47421 (and (=> t!43382 result!23811) b_and!47423)))

(declare-fun m!1194109 () Bool)

(assert (=> b!1303667 m!1194109))

(declare-fun m!1194111 () Bool)

(assert (=> b!1303668 m!1194111))

(declare-fun m!1194113 () Bool)

(assert (=> b!1303668 m!1194113))

(assert (=> b!1303668 m!1194011))

(assert (=> b!1303668 m!1194011))

(declare-fun m!1194115 () Bool)

(assert (=> b!1303668 m!1194115))

(assert (=> b!1303668 m!1194111))

(assert (=> b!1303668 m!1194113))

(declare-fun m!1194117 () Bool)

(assert (=> b!1303668 m!1194117))

(declare-fun m!1194119 () Bool)

(assert (=> b!1303664 m!1194119))

(assert (=> bm!64190 m!1194119))

(assert (=> b!1303658 m!1194011))

(assert (=> b!1303658 m!1194011))

(assert (=> b!1303658 m!1194013))

(declare-fun m!1194121 () Bool)

(assert (=> d!141547 m!1194121))

(assert (=> d!141547 m!1194015))

(declare-fun m!1194123 () Bool)

(assert (=> b!1303661 m!1194123))

(assert (=> b!1303659 m!1194011))

(assert (=> b!1303659 m!1194011))

(declare-fun m!1194125 () Bool)

(assert (=> b!1303659 m!1194125))

(assert (=> b!1303666 m!1194011))

(assert (=> b!1303666 m!1194011))

(assert (=> b!1303666 m!1194013))

(assert (=> b!1303665 m!1194113))

(assert (=> b!1303665 m!1194111))

(assert (=> b!1303665 m!1194113))

(assert (=> b!1303665 m!1194117))

(assert (=> b!1303665 m!1194011))

(declare-fun m!1194127 () Bool)

(assert (=> b!1303665 m!1194127))

(declare-fun m!1194129 () Bool)

(assert (=> b!1303665 m!1194129))

(declare-fun m!1194131 () Bool)

(assert (=> b!1303665 m!1194131))

(assert (=> b!1303665 m!1194111))

(assert (=> b!1303665 m!1194129))

(declare-fun m!1194133 () Bool)

(assert (=> b!1303665 m!1194133))

(assert (=> b!1303519 d!141547))

(declare-fun d!141549 () Bool)

(assert (=> d!141549 (= (validKeyInArray!0 (select (arr!41860 _keys!1741) from!2144)) (and (not (= (select (arr!41860 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41860 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303528 d!141549))

(declare-fun d!141551 () Bool)

(declare-fun e!743599 () Bool)

(assert (=> d!141551 e!743599))

(declare-fun res!865893 () Bool)

(assert (=> d!141551 (=> res!865893 e!743599)))

(declare-fun lt!583223 () Bool)

(assert (=> d!141551 (= res!865893 (not lt!583223))))

(declare-fun lt!583222 () Bool)

(assert (=> d!141551 (= lt!583223 lt!583222)))

(declare-fun lt!583221 () Unit!43007)

(declare-fun e!743600 () Unit!43007)

(assert (=> d!141551 (= lt!583221 e!743600)))

(declare-fun c!125106 () Bool)

(assert (=> d!141551 (= c!125106 lt!583222)))

(assert (=> d!141551 (= lt!583222 (containsKey!725 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141551 (= (contains!8249 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583223)))

(declare-fun b!1303671 () Bool)

(declare-fun lt!583220 () Unit!43007)

(assert (=> b!1303671 (= e!743600 lt!583220)))

(assert (=> b!1303671 (= lt!583220 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1303671 (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1303672 () Bool)

(declare-fun Unit!43015 () Unit!43007)

(assert (=> b!1303672 (= e!743600 Unit!43015)))

(declare-fun b!1303673 () Bool)

(assert (=> b!1303673 (= e!743599 (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141551 c!125106) b!1303671))

(assert (= (and d!141551 (not c!125106)) b!1303672))

(assert (= (and d!141551 (not res!865893)) b!1303673))

(declare-fun m!1194135 () Bool)

(assert (=> d!141551 m!1194135))

(declare-fun m!1194137 () Bool)

(assert (=> b!1303671 m!1194137))

(declare-fun m!1194139 () Bool)

(assert (=> b!1303671 m!1194139))

(assert (=> b!1303671 m!1194139))

(declare-fun m!1194141 () Bool)

(assert (=> b!1303671 m!1194141))

(assert (=> b!1303673 m!1194139))

(assert (=> b!1303673 m!1194139))

(assert (=> b!1303673 m!1194141))

(assert (=> b!1303524 d!141551))

(declare-fun bm!64205 () Bool)

(declare-fun call!64208 () Bool)

(declare-fun lt!583277 () ListLongMap!20339)

(assert (=> bm!64205 (= call!64208 (contains!8249 lt!583277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64206 () Bool)

(declare-fun call!64212 () ListLongMap!20339)

(assert (=> bm!64206 (= call!64212 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303716 () Bool)

(declare-fun e!743639 () ListLongMap!20339)

(declare-fun call!64211 () ListLongMap!20339)

(assert (=> b!1303716 (= e!743639 (+!4515 call!64211 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1303717 () Bool)

(declare-fun e!743631 () Bool)

(declare-fun call!64210 () Bool)

(assert (=> b!1303717 (= e!743631 (not call!64210))))

(declare-fun bm!64207 () Bool)

(declare-fun call!64214 () ListLongMap!20339)

(assert (=> bm!64207 (= call!64214 call!64211)))

(declare-fun d!141553 () Bool)

(declare-fun e!743629 () Bool)

(assert (=> d!141553 e!743629))

(declare-fun res!865914 () Bool)

(assert (=> d!141553 (=> (not res!865914) (not e!743629))))

(assert (=> d!141553 (= res!865914 (or (bvsge from!2144 (size!42412 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42412 _keys!1741)))))))

(declare-fun lt!583282 () ListLongMap!20339)

(assert (=> d!141553 (= lt!583277 lt!583282)))

(declare-fun lt!583269 () Unit!43007)

(declare-fun e!743636 () Unit!43007)

(assert (=> d!141553 (= lt!583269 e!743636)))

(declare-fun c!125123 () Bool)

(declare-fun e!743632 () Bool)

(assert (=> d!141553 (= c!125123 e!743632)))

(declare-fun res!865912 () Bool)

(assert (=> d!141553 (=> (not res!865912) (not e!743632))))

(assert (=> d!141553 (= res!865912 (bvslt from!2144 (size!42412 _keys!1741)))))

(assert (=> d!141553 (= lt!583282 e!743639)))

(declare-fun c!125120 () Bool)

(assert (=> d!141553 (= c!125120 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141553 (validMask!0 mask!2175)))

(assert (=> d!141553 (= (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583277)))

(declare-fun b!1303718 () Bool)

(declare-fun e!743627 () Bool)

(assert (=> b!1303718 (= e!743631 e!743627)))

(declare-fun res!865915 () Bool)

(assert (=> b!1303718 (= res!865915 call!64210)))

(assert (=> b!1303718 (=> (not res!865915) (not e!743627))))

(declare-fun bm!64208 () Bool)

(assert (=> bm!64208 (= call!64210 (contains!8249 lt!583277 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303719 () Bool)

(declare-fun e!743637 () Bool)

(declare-fun e!743628 () Bool)

(assert (=> b!1303719 (= e!743637 e!743628)))

(declare-fun res!865920 () Bool)

(assert (=> b!1303719 (=> (not res!865920) (not e!743628))))

(assert (=> b!1303719 (= res!865920 (contains!8249 lt!583277 (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> b!1303719 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42412 _keys!1741)))))

(declare-fun b!1303720 () Bool)

(declare-fun lt!583274 () Unit!43007)

(assert (=> b!1303720 (= e!743636 lt!583274)))

(declare-fun lt!583281 () ListLongMap!20339)

(assert (=> b!1303720 (= lt!583281 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583272 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583285 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583285 (select (arr!41860 _keys!1741) from!2144))))

(declare-fun lt!583276 () Unit!43007)

(declare-fun addStillContains!1110 (ListLongMap!20339 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43007)

(assert (=> b!1303720 (= lt!583276 (addStillContains!1110 lt!583281 lt!583272 zeroValue!1387 lt!583285))))

(assert (=> b!1303720 (contains!8249 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387)) lt!583285)))

(declare-fun lt!583268 () Unit!43007)

(assert (=> b!1303720 (= lt!583268 lt!583276)))

(declare-fun lt!583273 () ListLongMap!20339)

(assert (=> b!1303720 (= lt!583273 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583270 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583270 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583289 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583289 (select (arr!41860 _keys!1741) from!2144))))

(declare-fun lt!583286 () Unit!43007)

(declare-fun addApplyDifferent!553 (ListLongMap!20339 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43007)

(assert (=> b!1303720 (= lt!583286 (addApplyDifferent!553 lt!583273 lt!583270 minValue!1387 lt!583289))))

(assert (=> b!1303720 (= (apply!1015 (+!4515 lt!583273 (tuple2!22683 lt!583270 minValue!1387)) lt!583289) (apply!1015 lt!583273 lt!583289))))

(declare-fun lt!583275 () Unit!43007)

(assert (=> b!1303720 (= lt!583275 lt!583286)))

(declare-fun lt!583287 () ListLongMap!20339)

(assert (=> b!1303720 (= lt!583287 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583279 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583283 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583283 (select (arr!41860 _keys!1741) from!2144))))

(declare-fun lt!583288 () Unit!43007)

(assert (=> b!1303720 (= lt!583288 (addApplyDifferent!553 lt!583287 lt!583279 zeroValue!1387 lt!583283))))

(assert (=> b!1303720 (= (apply!1015 (+!4515 lt!583287 (tuple2!22683 lt!583279 zeroValue!1387)) lt!583283) (apply!1015 lt!583287 lt!583283))))

(declare-fun lt!583278 () Unit!43007)

(assert (=> b!1303720 (= lt!583278 lt!583288)))

(declare-fun lt!583280 () ListLongMap!20339)

(assert (=> b!1303720 (= lt!583280 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583271 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583271 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583284 () (_ BitVec 64))

(assert (=> b!1303720 (= lt!583284 (select (arr!41860 _keys!1741) from!2144))))

(assert (=> b!1303720 (= lt!583274 (addApplyDifferent!553 lt!583280 lt!583271 minValue!1387 lt!583284))))

(assert (=> b!1303720 (= (apply!1015 (+!4515 lt!583280 (tuple2!22683 lt!583271 minValue!1387)) lt!583284) (apply!1015 lt!583280 lt!583284))))

(declare-fun b!1303721 () Bool)

(assert (=> b!1303721 (= e!743632 (validKeyInArray!0 (select (arr!41860 _keys!1741) from!2144)))))

(declare-fun b!1303722 () Bool)

(assert (=> b!1303722 (= e!743628 (= (apply!1015 lt!583277 (select (arr!41860 _keys!1741) from!2144)) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303722 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42411 _values!1445)))))

(assert (=> b!1303722 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42412 _keys!1741)))))

(declare-fun b!1303723 () Bool)

(assert (=> b!1303723 (= e!743627 (= (apply!1015 lt!583277 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1303724 () Bool)

(declare-fun e!743638 () Bool)

(declare-fun e!743633 () Bool)

(assert (=> b!1303724 (= e!743638 e!743633)))

(declare-fun res!865918 () Bool)

(assert (=> b!1303724 (= res!865918 call!64208)))

(assert (=> b!1303724 (=> (not res!865918) (not e!743633))))

(declare-fun b!1303725 () Bool)

(declare-fun Unit!43016 () Unit!43007)

(assert (=> b!1303725 (= e!743636 Unit!43016)))

(declare-fun b!1303726 () Bool)

(assert (=> b!1303726 (= e!743629 e!743631)))

(declare-fun c!125121 () Bool)

(assert (=> b!1303726 (= c!125121 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!125119 () Bool)

(declare-fun call!64209 () ListLongMap!20339)

(declare-fun bm!64209 () Bool)

(declare-fun call!64213 () ListLongMap!20339)

(assert (=> bm!64209 (= call!64211 (+!4515 (ite c!125120 call!64212 (ite c!125119 call!64209 call!64213)) (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1303727 () Bool)

(declare-fun e!743630 () ListLongMap!20339)

(assert (=> b!1303727 (= e!743630 call!64214)))

(declare-fun b!1303728 () Bool)

(assert (=> b!1303728 (= e!743633 (= (apply!1015 lt!583277 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1303729 () Bool)

(declare-fun e!743635 () Bool)

(assert (=> b!1303729 (= e!743635 (validKeyInArray!0 (select (arr!41860 _keys!1741) from!2144)))))

(declare-fun b!1303730 () Bool)

(declare-fun res!865913 () Bool)

(assert (=> b!1303730 (=> (not res!865913) (not e!743629))))

(assert (=> b!1303730 (= res!865913 e!743637)))

(declare-fun res!865917 () Bool)

(assert (=> b!1303730 (=> res!865917 e!743637)))

(assert (=> b!1303730 (= res!865917 (not e!743635))))

(declare-fun res!865916 () Bool)

(assert (=> b!1303730 (=> (not res!865916) (not e!743635))))

(assert (=> b!1303730 (= res!865916 (bvslt from!2144 (size!42412 _keys!1741)))))

(declare-fun b!1303731 () Bool)

(declare-fun e!743634 () ListLongMap!20339)

(assert (=> b!1303731 (= e!743634 call!64214)))

(declare-fun b!1303732 () Bool)

(assert (=> b!1303732 (= e!743638 (not call!64208))))

(declare-fun b!1303733 () Bool)

(declare-fun c!125124 () Bool)

(assert (=> b!1303733 (= c!125124 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303733 (= e!743634 e!743630)))

(declare-fun b!1303734 () Bool)

(assert (=> b!1303734 (= e!743630 call!64213)))

(declare-fun b!1303735 () Bool)

(assert (=> b!1303735 (= e!743639 e!743634)))

(assert (=> b!1303735 (= c!125119 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64210 () Bool)

(assert (=> bm!64210 (= call!64209 call!64212)))

(declare-fun bm!64211 () Bool)

(assert (=> bm!64211 (= call!64213 call!64209)))

(declare-fun b!1303736 () Bool)

(declare-fun res!865919 () Bool)

(assert (=> b!1303736 (=> (not res!865919) (not e!743629))))

(assert (=> b!1303736 (= res!865919 e!743638)))

(declare-fun c!125122 () Bool)

(assert (=> b!1303736 (= c!125122 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!141553 c!125120) b!1303716))

(assert (= (and d!141553 (not c!125120)) b!1303735))

(assert (= (and b!1303735 c!125119) b!1303731))

(assert (= (and b!1303735 (not c!125119)) b!1303733))

(assert (= (and b!1303733 c!125124) b!1303727))

(assert (= (and b!1303733 (not c!125124)) b!1303734))

(assert (= (or b!1303727 b!1303734) bm!64211))

(assert (= (or b!1303731 bm!64211) bm!64210))

(assert (= (or b!1303731 b!1303727) bm!64207))

(assert (= (or b!1303716 bm!64210) bm!64206))

(assert (= (or b!1303716 bm!64207) bm!64209))

(assert (= (and d!141553 res!865912) b!1303721))

(assert (= (and d!141553 c!125123) b!1303720))

(assert (= (and d!141553 (not c!125123)) b!1303725))

(assert (= (and d!141553 res!865914) b!1303730))

(assert (= (and b!1303730 res!865916) b!1303729))

(assert (= (and b!1303730 (not res!865917)) b!1303719))

(assert (= (and b!1303719 res!865920) b!1303722))

(assert (= (and b!1303730 res!865913) b!1303736))

(assert (= (and b!1303736 c!125122) b!1303724))

(assert (= (and b!1303736 (not c!125122)) b!1303732))

(assert (= (and b!1303724 res!865918) b!1303728))

(assert (= (or b!1303724 b!1303732) bm!64205))

(assert (= (and b!1303736 res!865919) b!1303726))

(assert (= (and b!1303726 c!125121) b!1303718))

(assert (= (and b!1303726 (not c!125121)) b!1303717))

(assert (= (and b!1303718 res!865915) b!1303723))

(assert (= (or b!1303718 b!1303717) bm!64208))

(declare-fun b_lambda!23269 () Bool)

(assert (=> (not b_lambda!23269) (not b!1303722)))

(assert (=> b!1303722 t!43382))

(declare-fun b_and!47425 () Bool)

(assert (= b_and!47423 (and (=> t!43382 result!23811) b_and!47425)))

(assert (=> b!1303729 m!1194011))

(assert (=> b!1303729 m!1194011))

(assert (=> b!1303729 m!1194013))

(declare-fun m!1194143 () Bool)

(assert (=> bm!64205 m!1194143))

(assert (=> b!1303722 m!1194111))

(assert (=> b!1303722 m!1194113))

(assert (=> b!1303722 m!1194117))

(assert (=> b!1303722 m!1194011))

(assert (=> b!1303722 m!1194113))

(assert (=> b!1303722 m!1194111))

(assert (=> b!1303722 m!1194011))

(declare-fun m!1194145 () Bool)

(assert (=> b!1303722 m!1194145))

(assert (=> bm!64206 m!1194003))

(declare-fun m!1194147 () Bool)

(assert (=> b!1303723 m!1194147))

(declare-fun m!1194149 () Bool)

(assert (=> bm!64209 m!1194149))

(assert (=> b!1303721 m!1194011))

(assert (=> b!1303721 m!1194011))

(assert (=> b!1303721 m!1194013))

(declare-fun m!1194151 () Bool)

(assert (=> bm!64208 m!1194151))

(assert (=> b!1303719 m!1194011))

(assert (=> b!1303719 m!1194011))

(declare-fun m!1194153 () Bool)

(assert (=> b!1303719 m!1194153))

(declare-fun m!1194155 () Bool)

(assert (=> b!1303720 m!1194155))

(declare-fun m!1194157 () Bool)

(assert (=> b!1303720 m!1194157))

(assert (=> b!1303720 m!1194003))

(declare-fun m!1194159 () Bool)

(assert (=> b!1303720 m!1194159))

(declare-fun m!1194161 () Bool)

(assert (=> b!1303720 m!1194161))

(declare-fun m!1194163 () Bool)

(assert (=> b!1303720 m!1194163))

(declare-fun m!1194165 () Bool)

(assert (=> b!1303720 m!1194165))

(declare-fun m!1194167 () Bool)

(assert (=> b!1303720 m!1194167))

(declare-fun m!1194169 () Bool)

(assert (=> b!1303720 m!1194169))

(declare-fun m!1194171 () Bool)

(assert (=> b!1303720 m!1194171))

(assert (=> b!1303720 m!1194169))

(declare-fun m!1194173 () Bool)

(assert (=> b!1303720 m!1194173))

(declare-fun m!1194175 () Bool)

(assert (=> b!1303720 m!1194175))

(assert (=> b!1303720 m!1194155))

(declare-fun m!1194177 () Bool)

(assert (=> b!1303720 m!1194177))

(assert (=> b!1303720 m!1194161))

(declare-fun m!1194179 () Bool)

(assert (=> b!1303720 m!1194179))

(assert (=> b!1303720 m!1194011))

(assert (=> b!1303720 m!1194165))

(declare-fun m!1194181 () Bool)

(assert (=> b!1303720 m!1194181))

(declare-fun m!1194183 () Bool)

(assert (=> b!1303720 m!1194183))

(declare-fun m!1194185 () Bool)

(assert (=> b!1303716 m!1194185))

(declare-fun m!1194187 () Bool)

(assert (=> b!1303728 m!1194187))

(assert (=> d!141553 m!1194015))

(assert (=> b!1303524 d!141553))

(declare-fun b!1303747 () Bool)

(declare-fun e!743650 () Bool)

(declare-fun contains!8252 (List!29791 (_ BitVec 64)) Bool)

(assert (=> b!1303747 (= e!743650 (contains!8252 Nil!29788 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303748 () Bool)

(declare-fun e!743651 () Bool)

(declare-fun e!743648 () Bool)

(assert (=> b!1303748 (= e!743651 e!743648)))

(declare-fun res!865929 () Bool)

(assert (=> b!1303748 (=> (not res!865929) (not e!743648))))

(assert (=> b!1303748 (= res!865929 (not e!743650))))

(declare-fun res!865928 () Bool)

(assert (=> b!1303748 (=> (not res!865928) (not e!743650))))

(assert (=> b!1303748 (= res!865928 (validKeyInArray!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303749 () Bool)

(declare-fun e!743649 () Bool)

(assert (=> b!1303749 (= e!743648 e!743649)))

(declare-fun c!125127 () Bool)

(assert (=> b!1303749 (= c!125127 (validKeyInArray!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303750 () Bool)

(declare-fun call!64217 () Bool)

(assert (=> b!1303750 (= e!743649 call!64217)))

(declare-fun b!1303751 () Bool)

(assert (=> b!1303751 (= e!743649 call!64217)))

(declare-fun d!141555 () Bool)

(declare-fun res!865927 () Bool)

(assert (=> d!141555 (=> res!865927 e!743651)))

(assert (=> d!141555 (= res!865927 (bvsge #b00000000000000000000000000000000 (size!42412 _keys!1741)))))

(assert (=> d!141555 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29788) e!743651)))

(declare-fun bm!64214 () Bool)

(assert (=> bm!64214 (= call!64217 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125127 (Cons!29787 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) Nil!29788) Nil!29788)))))

(assert (= (and d!141555 (not res!865927)) b!1303748))

(assert (= (and b!1303748 res!865928) b!1303747))

(assert (= (and b!1303748 res!865929) b!1303749))

(assert (= (and b!1303749 c!125127) b!1303750))

(assert (= (and b!1303749 (not c!125127)) b!1303751))

(assert (= (or b!1303750 b!1303751) bm!64214))

(assert (=> b!1303747 m!1194089))

(assert (=> b!1303747 m!1194089))

(declare-fun m!1194189 () Bool)

(assert (=> b!1303747 m!1194189))

(assert (=> b!1303748 m!1194089))

(assert (=> b!1303748 m!1194089))

(assert (=> b!1303748 m!1194091))

(assert (=> b!1303749 m!1194089))

(assert (=> b!1303749 m!1194089))

(assert (=> b!1303749 m!1194091))

(assert (=> bm!64214 m!1194089))

(declare-fun m!1194191 () Bool)

(assert (=> bm!64214 m!1194191))

(assert (=> b!1303522 d!141555))

(declare-fun b!1303759 () Bool)

(declare-fun e!743657 () Bool)

(assert (=> b!1303759 (= e!743657 tp_is_empty!34909)))

(declare-fun mapNonEmpty!53965 () Bool)

(declare-fun mapRes!53965 () Bool)

(declare-fun tp!102974 () Bool)

(declare-fun e!743656 () Bool)

(assert (=> mapNonEmpty!53965 (= mapRes!53965 (and tp!102974 e!743656))))

(declare-fun mapRest!53965 () (Array (_ BitVec 32) ValueCell!16556))

(declare-fun mapValue!53965 () ValueCell!16556)

(declare-fun mapKey!53965 () (_ BitVec 32))

(assert (=> mapNonEmpty!53965 (= mapRest!53956 (store mapRest!53965 mapKey!53965 mapValue!53965))))

(declare-fun b!1303758 () Bool)

(assert (=> b!1303758 (= e!743656 tp_is_empty!34909)))

(declare-fun condMapEmpty!53965 () Bool)

(declare-fun mapDefault!53965 () ValueCell!16556)

(assert (=> mapNonEmpty!53956 (= condMapEmpty!53965 (= mapRest!53956 ((as const (Array (_ BitVec 32) ValueCell!16556)) mapDefault!53965)))))

(assert (=> mapNonEmpty!53956 (= tp!102959 (and e!743657 mapRes!53965))))

(declare-fun mapIsEmpty!53965 () Bool)

(assert (=> mapIsEmpty!53965 mapRes!53965))

(assert (= (and mapNonEmpty!53956 condMapEmpty!53965) mapIsEmpty!53965))

(assert (= (and mapNonEmpty!53956 (not condMapEmpty!53965)) mapNonEmpty!53965))

(assert (= (and mapNonEmpty!53965 ((_ is ValueCellFull!16556) mapValue!53965)) b!1303758))

(assert (= (and mapNonEmpty!53956 ((_ is ValueCellFull!16556) mapDefault!53965)) b!1303759))

(declare-fun m!1194193 () Bool)

(assert (=> mapNonEmpty!53965 m!1194193))

(declare-fun b_lambda!23271 () Bool)

(assert (= b_lambda!23269 (or (and start!110070 b_free!29269) b_lambda!23271)))

(declare-fun b_lambda!23273 () Bool)

(assert (= b_lambda!23265 (or (and start!110070 b_free!29269) b_lambda!23273)))

(declare-fun b_lambda!23275 () Bool)

(assert (= b_lambda!23267 (or (and start!110070 b_free!29269) b_lambda!23275)))

(check-sat tp_is_empty!34909 (not bm!64208) (not bm!64206) (not b!1303665) (not d!141547) (not b!1303617) (not b!1303747) (not b!1303659) (not b!1303658) (not b!1303749) (not b!1303627) (not bm!64187) (not b_next!29269) (not b!1303721) (not b!1303729) (not b!1303728) (not b!1303668) (not d!141541) (not b!1303666) (not d!141553) (not b_lambda!23275) (not b!1303722) (not b_lambda!23271) (not b!1303716) (not b!1303630) (not bm!64214) (not bm!64190) (not d!141539) (not mapNonEmpty!53965) (not b!1303719) (not b!1303723) (not b!1303671) (not b_lambda!23273) (not d!141545) (not b!1303748) (not b!1303664) (not b!1303720) (not b!1303667) (not b!1303628) (not b!1303632) (not d!141551) (not b!1303615) (not bm!64205) (not b!1303673) (not bm!64209) b_and!47425 (not b!1303661))
(check-sat b_and!47425 (not b_next!29269))
(get-model)

(declare-fun d!141557 () Bool)

(declare-fun isEmpty!1069 (Option!759) Bool)

(assert (=> d!141557 (= (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1069 (getValueByKey!708 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37098 () Bool)

(assert (= bs!37098 d!141557))

(assert (=> bs!37098 m!1194139))

(declare-fun m!1194195 () Bool)

(assert (=> bs!37098 m!1194195))

(assert (=> b!1303673 d!141557))

(declare-fun b!1303771 () Bool)

(declare-fun e!743663 () Option!759)

(assert (=> b!1303771 (= e!743663 None!757)))

(declare-fun b!1303768 () Bool)

(declare-fun e!743662 () Option!759)

(assert (=> b!1303768 (= e!743662 (Some!758 (_2!11352 (h!30995 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun d!141559 () Bool)

(declare-fun c!125132 () Bool)

(assert (=> d!141559 (= c!125132 (and ((_ is Cons!29786) (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11352 (h!30995 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141559 (= (getValueByKey!708 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743662)))

(declare-fun b!1303770 () Bool)

(assert (=> b!1303770 (= e!743663 (getValueByKey!708 (t!43376 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1303769 () Bool)

(assert (=> b!1303769 (= e!743662 e!743663)))

(declare-fun c!125133 () Bool)

(assert (=> b!1303769 (= c!125133 (and ((_ is Cons!29786) (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11352 (h!30995 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(assert (= (and d!141559 c!125132) b!1303768))

(assert (= (and d!141559 (not c!125132)) b!1303769))

(assert (= (and b!1303769 c!125133) b!1303770))

(assert (= (and b!1303769 (not c!125133)) b!1303771))

(declare-fun m!1194197 () Bool)

(assert (=> b!1303770 m!1194197))

(assert (=> b!1303673 d!141559))

(declare-fun d!141561 () Bool)

(declare-fun get!21167 (Option!759) V!51649)

(assert (=> d!141561 (= (apply!1015 lt!583280 lt!583284) (get!21167 (getValueByKey!708 (toList!10185 lt!583280) lt!583284)))))

(declare-fun bs!37099 () Bool)

(assert (= bs!37099 d!141561))

(declare-fun m!1194199 () Bool)

(assert (=> bs!37099 m!1194199))

(assert (=> bs!37099 m!1194199))

(declare-fun m!1194201 () Bool)

(assert (=> bs!37099 m!1194201))

(assert (=> b!1303720 d!141561))

(declare-fun d!141563 () Bool)

(assert (=> d!141563 (= (apply!1015 (+!4515 lt!583287 (tuple2!22683 lt!583279 zeroValue!1387)) lt!583283) (apply!1015 lt!583287 lt!583283))))

(declare-fun lt!583292 () Unit!43007)

(declare-fun choose!1931 (ListLongMap!20339 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43007)

(assert (=> d!141563 (= lt!583292 (choose!1931 lt!583287 lt!583279 zeroValue!1387 lt!583283))))

(declare-fun e!743666 () Bool)

(assert (=> d!141563 e!743666))

(declare-fun res!865932 () Bool)

(assert (=> d!141563 (=> (not res!865932) (not e!743666))))

(assert (=> d!141563 (= res!865932 (contains!8249 lt!583287 lt!583283))))

(assert (=> d!141563 (= (addApplyDifferent!553 lt!583287 lt!583279 zeroValue!1387 lt!583283) lt!583292)))

(declare-fun b!1303775 () Bool)

(assert (=> b!1303775 (= e!743666 (not (= lt!583283 lt!583279)))))

(assert (= (and d!141563 res!865932) b!1303775))

(declare-fun m!1194203 () Bool)

(assert (=> d!141563 m!1194203))

(assert (=> d!141563 m!1194161))

(assert (=> d!141563 m!1194179))

(declare-fun m!1194205 () Bool)

(assert (=> d!141563 m!1194205))

(assert (=> d!141563 m!1194175))

(assert (=> d!141563 m!1194161))

(assert (=> b!1303720 d!141563))

(declare-fun d!141565 () Bool)

(assert (=> d!141565 (contains!8249 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387)) lt!583285)))

(declare-fun lt!583295 () Unit!43007)

(declare-fun choose!1932 (ListLongMap!20339 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43007)

(assert (=> d!141565 (= lt!583295 (choose!1932 lt!583281 lt!583272 zeroValue!1387 lt!583285))))

(assert (=> d!141565 (contains!8249 lt!583281 lt!583285)))

(assert (=> d!141565 (= (addStillContains!1110 lt!583281 lt!583272 zeroValue!1387 lt!583285) lt!583295)))

(declare-fun bs!37100 () Bool)

(assert (= bs!37100 d!141565))

(assert (=> bs!37100 m!1194165))

(assert (=> bs!37100 m!1194165))

(assert (=> bs!37100 m!1194181))

(declare-fun m!1194207 () Bool)

(assert (=> bs!37100 m!1194207))

(declare-fun m!1194209 () Bool)

(assert (=> bs!37100 m!1194209))

(assert (=> b!1303720 d!141565))

(assert (=> b!1303720 d!141547))

(declare-fun d!141567 () Bool)

(assert (=> d!141567 (= (apply!1015 lt!583287 lt!583283) (get!21167 (getValueByKey!708 (toList!10185 lt!583287) lt!583283)))))

(declare-fun bs!37101 () Bool)

(assert (= bs!37101 d!141567))

(declare-fun m!1194211 () Bool)

(assert (=> bs!37101 m!1194211))

(assert (=> bs!37101 m!1194211))

(declare-fun m!1194213 () Bool)

(assert (=> bs!37101 m!1194213))

(assert (=> b!1303720 d!141567))

(declare-fun d!141569 () Bool)

(declare-fun e!743669 () Bool)

(assert (=> d!141569 e!743669))

(declare-fun res!865938 () Bool)

(assert (=> d!141569 (=> (not res!865938) (not e!743669))))

(declare-fun lt!583307 () ListLongMap!20339)

(assert (=> d!141569 (= res!865938 (contains!8249 lt!583307 (_1!11352 (tuple2!22683 lt!583270 minValue!1387))))))

(declare-fun lt!583306 () List!29790)

(assert (=> d!141569 (= lt!583307 (ListLongMap!20340 lt!583306))))

(declare-fun lt!583304 () Unit!43007)

(declare-fun lt!583305 () Unit!43007)

(assert (=> d!141569 (= lt!583304 lt!583305)))

(assert (=> d!141569 (= (getValueByKey!708 lt!583306 (_1!11352 (tuple2!22683 lt!583270 minValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583270 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!352 (List!29790 (_ BitVec 64) V!51649) Unit!43007)

(assert (=> d!141569 (= lt!583305 (lemmaContainsTupThenGetReturnValue!352 lt!583306 (_1!11352 (tuple2!22683 lt!583270 minValue!1387)) (_2!11352 (tuple2!22683 lt!583270 minValue!1387))))))

(declare-fun insertStrictlySorted!481 (List!29790 (_ BitVec 64) V!51649) List!29790)

(assert (=> d!141569 (= lt!583306 (insertStrictlySorted!481 (toList!10185 lt!583273) (_1!11352 (tuple2!22683 lt!583270 minValue!1387)) (_2!11352 (tuple2!22683 lt!583270 minValue!1387))))))

(assert (=> d!141569 (= (+!4515 lt!583273 (tuple2!22683 lt!583270 minValue!1387)) lt!583307)))

(declare-fun b!1303781 () Bool)

(declare-fun res!865937 () Bool)

(assert (=> b!1303781 (=> (not res!865937) (not e!743669))))

(assert (=> b!1303781 (= res!865937 (= (getValueByKey!708 (toList!10185 lt!583307) (_1!11352 (tuple2!22683 lt!583270 minValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583270 minValue!1387)))))))

(declare-fun b!1303782 () Bool)

(declare-fun contains!8253 (List!29790 tuple2!22682) Bool)

(assert (=> b!1303782 (= e!743669 (contains!8253 (toList!10185 lt!583307) (tuple2!22683 lt!583270 minValue!1387)))))

(assert (= (and d!141569 res!865938) b!1303781))

(assert (= (and b!1303781 res!865937) b!1303782))

(declare-fun m!1194215 () Bool)

(assert (=> d!141569 m!1194215))

(declare-fun m!1194217 () Bool)

(assert (=> d!141569 m!1194217))

(declare-fun m!1194219 () Bool)

(assert (=> d!141569 m!1194219))

(declare-fun m!1194221 () Bool)

(assert (=> d!141569 m!1194221))

(declare-fun m!1194223 () Bool)

(assert (=> b!1303781 m!1194223))

(declare-fun m!1194225 () Bool)

(assert (=> b!1303782 m!1194225))

(assert (=> b!1303720 d!141569))

(declare-fun d!141571 () Bool)

(assert (=> d!141571 (= (apply!1015 (+!4515 lt!583287 (tuple2!22683 lt!583279 zeroValue!1387)) lt!583283) (get!21167 (getValueByKey!708 (toList!10185 (+!4515 lt!583287 (tuple2!22683 lt!583279 zeroValue!1387))) lt!583283)))))

(declare-fun bs!37102 () Bool)

(assert (= bs!37102 d!141571))

(declare-fun m!1194227 () Bool)

(assert (=> bs!37102 m!1194227))

(assert (=> bs!37102 m!1194227))

(declare-fun m!1194229 () Bool)

(assert (=> bs!37102 m!1194229))

(assert (=> b!1303720 d!141571))

(declare-fun d!141573 () Bool)

(declare-fun e!743670 () Bool)

(assert (=> d!141573 e!743670))

(declare-fun res!865939 () Bool)

(assert (=> d!141573 (=> res!865939 e!743670)))

(declare-fun lt!583311 () Bool)

(assert (=> d!141573 (= res!865939 (not lt!583311))))

(declare-fun lt!583310 () Bool)

(assert (=> d!141573 (= lt!583311 lt!583310)))

(declare-fun lt!583309 () Unit!43007)

(declare-fun e!743671 () Unit!43007)

(assert (=> d!141573 (= lt!583309 e!743671)))

(declare-fun c!125134 () Bool)

(assert (=> d!141573 (= c!125134 lt!583310)))

(assert (=> d!141573 (= lt!583310 (containsKey!725 (toList!10185 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387))) lt!583285))))

(assert (=> d!141573 (= (contains!8249 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387)) lt!583285) lt!583311)))

(declare-fun b!1303783 () Bool)

(declare-fun lt!583308 () Unit!43007)

(assert (=> b!1303783 (= e!743671 lt!583308)))

(assert (=> b!1303783 (= lt!583308 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387))) lt!583285))))

(assert (=> b!1303783 (isDefined!515 (getValueByKey!708 (toList!10185 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387))) lt!583285))))

(declare-fun b!1303784 () Bool)

(declare-fun Unit!43017 () Unit!43007)

(assert (=> b!1303784 (= e!743671 Unit!43017)))

(declare-fun b!1303785 () Bool)

(assert (=> b!1303785 (= e!743670 (isDefined!515 (getValueByKey!708 (toList!10185 (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387))) lt!583285)))))

(assert (= (and d!141573 c!125134) b!1303783))

(assert (= (and d!141573 (not c!125134)) b!1303784))

(assert (= (and d!141573 (not res!865939)) b!1303785))

(declare-fun m!1194231 () Bool)

(assert (=> d!141573 m!1194231))

(declare-fun m!1194233 () Bool)

(assert (=> b!1303783 m!1194233))

(declare-fun m!1194235 () Bool)

(assert (=> b!1303783 m!1194235))

(assert (=> b!1303783 m!1194235))

(declare-fun m!1194237 () Bool)

(assert (=> b!1303783 m!1194237))

(assert (=> b!1303785 m!1194235))

(assert (=> b!1303785 m!1194235))

(assert (=> b!1303785 m!1194237))

(assert (=> b!1303720 d!141573))

(declare-fun d!141575 () Bool)

(declare-fun e!743672 () Bool)

(assert (=> d!141575 e!743672))

(declare-fun res!865941 () Bool)

(assert (=> d!141575 (=> (not res!865941) (not e!743672))))

(declare-fun lt!583315 () ListLongMap!20339)

(assert (=> d!141575 (= res!865941 (contains!8249 lt!583315 (_1!11352 (tuple2!22683 lt!583272 zeroValue!1387))))))

(declare-fun lt!583314 () List!29790)

(assert (=> d!141575 (= lt!583315 (ListLongMap!20340 lt!583314))))

(declare-fun lt!583312 () Unit!43007)

(declare-fun lt!583313 () Unit!43007)

(assert (=> d!141575 (= lt!583312 lt!583313)))

(assert (=> d!141575 (= (getValueByKey!708 lt!583314 (_1!11352 (tuple2!22683 lt!583272 zeroValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583272 zeroValue!1387))))))

(assert (=> d!141575 (= lt!583313 (lemmaContainsTupThenGetReturnValue!352 lt!583314 (_1!11352 (tuple2!22683 lt!583272 zeroValue!1387)) (_2!11352 (tuple2!22683 lt!583272 zeroValue!1387))))))

(assert (=> d!141575 (= lt!583314 (insertStrictlySorted!481 (toList!10185 lt!583281) (_1!11352 (tuple2!22683 lt!583272 zeroValue!1387)) (_2!11352 (tuple2!22683 lt!583272 zeroValue!1387))))))

(assert (=> d!141575 (= (+!4515 lt!583281 (tuple2!22683 lt!583272 zeroValue!1387)) lt!583315)))

(declare-fun b!1303786 () Bool)

(declare-fun res!865940 () Bool)

(assert (=> b!1303786 (=> (not res!865940) (not e!743672))))

(assert (=> b!1303786 (= res!865940 (= (getValueByKey!708 (toList!10185 lt!583315) (_1!11352 (tuple2!22683 lt!583272 zeroValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583272 zeroValue!1387)))))))

(declare-fun b!1303787 () Bool)

(assert (=> b!1303787 (= e!743672 (contains!8253 (toList!10185 lt!583315) (tuple2!22683 lt!583272 zeroValue!1387)))))

(assert (= (and d!141575 res!865941) b!1303786))

(assert (= (and b!1303786 res!865940) b!1303787))

(declare-fun m!1194239 () Bool)

(assert (=> d!141575 m!1194239))

(declare-fun m!1194241 () Bool)

(assert (=> d!141575 m!1194241))

(declare-fun m!1194243 () Bool)

(assert (=> d!141575 m!1194243))

(declare-fun m!1194245 () Bool)

(assert (=> d!141575 m!1194245))

(declare-fun m!1194247 () Bool)

(assert (=> b!1303786 m!1194247))

(declare-fun m!1194249 () Bool)

(assert (=> b!1303787 m!1194249))

(assert (=> b!1303720 d!141575))

(declare-fun d!141577 () Bool)

(assert (=> d!141577 (= (apply!1015 (+!4515 lt!583280 (tuple2!22683 lt!583271 minValue!1387)) lt!583284) (get!21167 (getValueByKey!708 (toList!10185 (+!4515 lt!583280 (tuple2!22683 lt!583271 minValue!1387))) lt!583284)))))

(declare-fun bs!37103 () Bool)

(assert (= bs!37103 d!141577))

(declare-fun m!1194251 () Bool)

(assert (=> bs!37103 m!1194251))

(assert (=> bs!37103 m!1194251))

(declare-fun m!1194253 () Bool)

(assert (=> bs!37103 m!1194253))

(assert (=> b!1303720 d!141577))

(declare-fun d!141579 () Bool)

(assert (=> d!141579 (= (apply!1015 lt!583273 lt!583289) (get!21167 (getValueByKey!708 (toList!10185 lt!583273) lt!583289)))))

(declare-fun bs!37104 () Bool)

(assert (= bs!37104 d!141579))

(declare-fun m!1194255 () Bool)

(assert (=> bs!37104 m!1194255))

(assert (=> bs!37104 m!1194255))

(declare-fun m!1194257 () Bool)

(assert (=> bs!37104 m!1194257))

(assert (=> b!1303720 d!141579))

(declare-fun d!141581 () Bool)

(assert (=> d!141581 (= (apply!1015 (+!4515 lt!583273 (tuple2!22683 lt!583270 minValue!1387)) lt!583289) (get!21167 (getValueByKey!708 (toList!10185 (+!4515 lt!583273 (tuple2!22683 lt!583270 minValue!1387))) lt!583289)))))

(declare-fun bs!37105 () Bool)

(assert (= bs!37105 d!141581))

(declare-fun m!1194259 () Bool)

(assert (=> bs!37105 m!1194259))

(assert (=> bs!37105 m!1194259))

(declare-fun m!1194261 () Bool)

(assert (=> bs!37105 m!1194261))

(assert (=> b!1303720 d!141581))

(declare-fun d!141583 () Bool)

(assert (=> d!141583 (= (apply!1015 (+!4515 lt!583273 (tuple2!22683 lt!583270 minValue!1387)) lt!583289) (apply!1015 lt!583273 lt!583289))))

(declare-fun lt!583316 () Unit!43007)

(assert (=> d!141583 (= lt!583316 (choose!1931 lt!583273 lt!583270 minValue!1387 lt!583289))))

(declare-fun e!743673 () Bool)

(assert (=> d!141583 e!743673))

(declare-fun res!865942 () Bool)

(assert (=> d!141583 (=> (not res!865942) (not e!743673))))

(assert (=> d!141583 (= res!865942 (contains!8249 lt!583273 lt!583289))))

(assert (=> d!141583 (= (addApplyDifferent!553 lt!583273 lt!583270 minValue!1387 lt!583289) lt!583316)))

(declare-fun b!1303788 () Bool)

(assert (=> b!1303788 (= e!743673 (not (= lt!583289 lt!583270)))))

(assert (= (and d!141583 res!865942) b!1303788))

(declare-fun m!1194263 () Bool)

(assert (=> d!141583 m!1194263))

(assert (=> d!141583 m!1194169))

(assert (=> d!141583 m!1194171))

(declare-fun m!1194265 () Bool)

(assert (=> d!141583 m!1194265))

(assert (=> d!141583 m!1194163))

(assert (=> d!141583 m!1194169))

(assert (=> b!1303720 d!141583))

(declare-fun d!141585 () Bool)

(declare-fun e!743674 () Bool)

(assert (=> d!141585 e!743674))

(declare-fun res!865944 () Bool)

(assert (=> d!141585 (=> (not res!865944) (not e!743674))))

(declare-fun lt!583320 () ListLongMap!20339)

(assert (=> d!141585 (= res!865944 (contains!8249 lt!583320 (_1!11352 (tuple2!22683 lt!583271 minValue!1387))))))

(declare-fun lt!583319 () List!29790)

(assert (=> d!141585 (= lt!583320 (ListLongMap!20340 lt!583319))))

(declare-fun lt!583317 () Unit!43007)

(declare-fun lt!583318 () Unit!43007)

(assert (=> d!141585 (= lt!583317 lt!583318)))

(assert (=> d!141585 (= (getValueByKey!708 lt!583319 (_1!11352 (tuple2!22683 lt!583271 minValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583271 minValue!1387))))))

(assert (=> d!141585 (= lt!583318 (lemmaContainsTupThenGetReturnValue!352 lt!583319 (_1!11352 (tuple2!22683 lt!583271 minValue!1387)) (_2!11352 (tuple2!22683 lt!583271 minValue!1387))))))

(assert (=> d!141585 (= lt!583319 (insertStrictlySorted!481 (toList!10185 lt!583280) (_1!11352 (tuple2!22683 lt!583271 minValue!1387)) (_2!11352 (tuple2!22683 lt!583271 minValue!1387))))))

(assert (=> d!141585 (= (+!4515 lt!583280 (tuple2!22683 lt!583271 minValue!1387)) lt!583320)))

(declare-fun b!1303789 () Bool)

(declare-fun res!865943 () Bool)

(assert (=> b!1303789 (=> (not res!865943) (not e!743674))))

(assert (=> b!1303789 (= res!865943 (= (getValueByKey!708 (toList!10185 lt!583320) (_1!11352 (tuple2!22683 lt!583271 minValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583271 minValue!1387)))))))

(declare-fun b!1303790 () Bool)

(assert (=> b!1303790 (= e!743674 (contains!8253 (toList!10185 lt!583320) (tuple2!22683 lt!583271 minValue!1387)))))

(assert (= (and d!141585 res!865944) b!1303789))

(assert (= (and b!1303789 res!865943) b!1303790))

(declare-fun m!1194267 () Bool)

(assert (=> d!141585 m!1194267))

(declare-fun m!1194269 () Bool)

(assert (=> d!141585 m!1194269))

(declare-fun m!1194271 () Bool)

(assert (=> d!141585 m!1194271))

(declare-fun m!1194273 () Bool)

(assert (=> d!141585 m!1194273))

(declare-fun m!1194275 () Bool)

(assert (=> b!1303789 m!1194275))

(declare-fun m!1194277 () Bool)

(assert (=> b!1303790 m!1194277))

(assert (=> b!1303720 d!141585))

(declare-fun d!141587 () Bool)

(declare-fun e!743675 () Bool)

(assert (=> d!141587 e!743675))

(declare-fun res!865946 () Bool)

(assert (=> d!141587 (=> (not res!865946) (not e!743675))))

(declare-fun lt!583324 () ListLongMap!20339)

(assert (=> d!141587 (= res!865946 (contains!8249 lt!583324 (_1!11352 (tuple2!22683 lt!583279 zeroValue!1387))))))

(declare-fun lt!583323 () List!29790)

(assert (=> d!141587 (= lt!583324 (ListLongMap!20340 lt!583323))))

(declare-fun lt!583321 () Unit!43007)

(declare-fun lt!583322 () Unit!43007)

(assert (=> d!141587 (= lt!583321 lt!583322)))

(assert (=> d!141587 (= (getValueByKey!708 lt!583323 (_1!11352 (tuple2!22683 lt!583279 zeroValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583279 zeroValue!1387))))))

(assert (=> d!141587 (= lt!583322 (lemmaContainsTupThenGetReturnValue!352 lt!583323 (_1!11352 (tuple2!22683 lt!583279 zeroValue!1387)) (_2!11352 (tuple2!22683 lt!583279 zeroValue!1387))))))

(assert (=> d!141587 (= lt!583323 (insertStrictlySorted!481 (toList!10185 lt!583287) (_1!11352 (tuple2!22683 lt!583279 zeroValue!1387)) (_2!11352 (tuple2!22683 lt!583279 zeroValue!1387))))))

(assert (=> d!141587 (= (+!4515 lt!583287 (tuple2!22683 lt!583279 zeroValue!1387)) lt!583324)))

(declare-fun b!1303791 () Bool)

(declare-fun res!865945 () Bool)

(assert (=> b!1303791 (=> (not res!865945) (not e!743675))))

(assert (=> b!1303791 (= res!865945 (= (getValueByKey!708 (toList!10185 lt!583324) (_1!11352 (tuple2!22683 lt!583279 zeroValue!1387))) (Some!758 (_2!11352 (tuple2!22683 lt!583279 zeroValue!1387)))))))

(declare-fun b!1303792 () Bool)

(assert (=> b!1303792 (= e!743675 (contains!8253 (toList!10185 lt!583324) (tuple2!22683 lt!583279 zeroValue!1387)))))

(assert (= (and d!141587 res!865946) b!1303791))

(assert (= (and b!1303791 res!865945) b!1303792))

(declare-fun m!1194279 () Bool)

(assert (=> d!141587 m!1194279))

(declare-fun m!1194281 () Bool)

(assert (=> d!141587 m!1194281))

(declare-fun m!1194283 () Bool)

(assert (=> d!141587 m!1194283))

(declare-fun m!1194285 () Bool)

(assert (=> d!141587 m!1194285))

(declare-fun m!1194287 () Bool)

(assert (=> b!1303791 m!1194287))

(declare-fun m!1194289 () Bool)

(assert (=> b!1303792 m!1194289))

(assert (=> b!1303720 d!141587))

(declare-fun d!141589 () Bool)

(assert (=> d!141589 (= (apply!1015 (+!4515 lt!583280 (tuple2!22683 lt!583271 minValue!1387)) lt!583284) (apply!1015 lt!583280 lt!583284))))

(declare-fun lt!583325 () Unit!43007)

(assert (=> d!141589 (= lt!583325 (choose!1931 lt!583280 lt!583271 minValue!1387 lt!583284))))

(declare-fun e!743676 () Bool)

(assert (=> d!141589 e!743676))

(declare-fun res!865947 () Bool)

(assert (=> d!141589 (=> (not res!865947) (not e!743676))))

(assert (=> d!141589 (= res!865947 (contains!8249 lt!583280 lt!583284))))

(assert (=> d!141589 (= (addApplyDifferent!553 lt!583280 lt!583271 minValue!1387 lt!583284) lt!583325)))

(declare-fun b!1303793 () Bool)

(assert (=> b!1303793 (= e!743676 (not (= lt!583284 lt!583271)))))

(assert (= (and d!141589 res!865947) b!1303793))

(declare-fun m!1194291 () Bool)

(assert (=> d!141589 m!1194291))

(assert (=> d!141589 m!1194155))

(assert (=> d!141589 m!1194157))

(declare-fun m!1194293 () Bool)

(assert (=> d!141589 m!1194293))

(assert (=> d!141589 m!1194177))

(assert (=> d!141589 m!1194155))

(assert (=> b!1303720 d!141589))

(declare-fun d!141591 () Bool)

(declare-fun e!743677 () Bool)

(assert (=> d!141591 e!743677))

(declare-fun res!865948 () Bool)

(assert (=> d!141591 (=> res!865948 e!743677)))

(declare-fun lt!583329 () Bool)

(assert (=> d!141591 (= res!865948 (not lt!583329))))

(declare-fun lt!583328 () Bool)

(assert (=> d!141591 (= lt!583329 lt!583328)))

(declare-fun lt!583327 () Unit!43007)

(declare-fun e!743678 () Unit!43007)

(assert (=> d!141591 (= lt!583327 e!743678)))

(declare-fun c!125135 () Bool)

(assert (=> d!141591 (= c!125135 lt!583328)))

(assert (=> d!141591 (= lt!583328 (containsKey!725 (toList!10185 lt!583277) (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> d!141591 (= (contains!8249 lt!583277 (select (arr!41860 _keys!1741) from!2144)) lt!583329)))

(declare-fun b!1303794 () Bool)

(declare-fun lt!583326 () Unit!43007)

(assert (=> b!1303794 (= e!743678 lt!583326)))

(assert (=> b!1303794 (= lt!583326 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 lt!583277) (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> b!1303794 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583277) (select (arr!41860 _keys!1741) from!2144)))))

(declare-fun b!1303795 () Bool)

(declare-fun Unit!43018 () Unit!43007)

(assert (=> b!1303795 (= e!743678 Unit!43018)))

(declare-fun b!1303796 () Bool)

(assert (=> b!1303796 (= e!743677 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583277) (select (arr!41860 _keys!1741) from!2144))))))

(assert (= (and d!141591 c!125135) b!1303794))

(assert (= (and d!141591 (not c!125135)) b!1303795))

(assert (= (and d!141591 (not res!865948)) b!1303796))

(assert (=> d!141591 m!1194011))

(declare-fun m!1194295 () Bool)

(assert (=> d!141591 m!1194295))

(assert (=> b!1303794 m!1194011))

(declare-fun m!1194297 () Bool)

(assert (=> b!1303794 m!1194297))

(assert (=> b!1303794 m!1194011))

(declare-fun m!1194299 () Bool)

(assert (=> b!1303794 m!1194299))

(assert (=> b!1303794 m!1194299))

(declare-fun m!1194301 () Bool)

(assert (=> b!1303794 m!1194301))

(assert (=> b!1303796 m!1194011))

(assert (=> b!1303796 m!1194299))

(assert (=> b!1303796 m!1194299))

(assert (=> b!1303796 m!1194301))

(assert (=> b!1303719 d!141591))

(declare-fun d!141593 () Bool)

(assert (=> d!141593 (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583332 () Unit!43007)

(declare-fun choose!1933 (List!29790 (_ BitVec 64)) Unit!43007)

(assert (=> d!141593 (= lt!583332 (choose!1933 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743681 () Bool)

(assert (=> d!141593 e!743681))

(declare-fun res!865951 () Bool)

(assert (=> d!141593 (=> (not res!865951) (not e!743681))))

(declare-fun isStrictlySorted!869 (List!29790) Bool)

(assert (=> d!141593 (= res!865951 (isStrictlySorted!869 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141593 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583332)))

(declare-fun b!1303799 () Bool)

(assert (=> b!1303799 (= e!743681 (containsKey!725 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141593 res!865951) b!1303799))

(assert (=> d!141593 m!1194139))

(assert (=> d!141593 m!1194139))

(assert (=> d!141593 m!1194141))

(declare-fun m!1194303 () Bool)

(assert (=> d!141593 m!1194303))

(declare-fun m!1194305 () Bool)

(assert (=> d!141593 m!1194305))

(assert (=> b!1303799 m!1194135))

(assert (=> b!1303671 d!141593))

(assert (=> b!1303671 d!141557))

(assert (=> b!1303671 d!141559))

(declare-fun d!141595 () Bool)

(declare-fun e!743682 () Bool)

(assert (=> d!141595 e!743682))

(declare-fun res!865952 () Bool)

(assert (=> d!141595 (=> res!865952 e!743682)))

(declare-fun lt!583336 () Bool)

(assert (=> d!141595 (= res!865952 (not lt!583336))))

(declare-fun lt!583335 () Bool)

(assert (=> d!141595 (= lt!583336 lt!583335)))

(declare-fun lt!583334 () Unit!43007)

(declare-fun e!743683 () Unit!43007)

(assert (=> d!141595 (= lt!583334 e!743683)))

(declare-fun c!125136 () Bool)

(assert (=> d!141595 (= c!125136 lt!583335)))

(assert (=> d!141595 (= lt!583335 (containsKey!725 (toList!10185 lt!583277) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141595 (= (contains!8249 lt!583277 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583336)))

(declare-fun b!1303800 () Bool)

(declare-fun lt!583333 () Unit!43007)

(assert (=> b!1303800 (= e!743683 lt!583333)))

(assert (=> b!1303800 (= lt!583333 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 lt!583277) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303800 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583277) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303801 () Bool)

(declare-fun Unit!43019 () Unit!43007)

(assert (=> b!1303801 (= e!743683 Unit!43019)))

(declare-fun b!1303802 () Bool)

(assert (=> b!1303802 (= e!743682 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141595 c!125136) b!1303800))

(assert (= (and d!141595 (not c!125136)) b!1303801))

(assert (= (and d!141595 (not res!865952)) b!1303802))

(declare-fun m!1194307 () Bool)

(assert (=> d!141595 m!1194307))

(declare-fun m!1194309 () Bool)

(assert (=> b!1303800 m!1194309))

(declare-fun m!1194311 () Bool)

(assert (=> b!1303800 m!1194311))

(assert (=> b!1303800 m!1194311))

(declare-fun m!1194313 () Bool)

(assert (=> b!1303800 m!1194313))

(assert (=> b!1303802 m!1194311))

(assert (=> b!1303802 m!1194311))

(assert (=> b!1303802 m!1194313))

(assert (=> bm!64208 d!141595))

(declare-fun d!141597 () Bool)

(declare-fun e!743684 () Bool)

(assert (=> d!141597 e!743684))

(declare-fun res!865954 () Bool)

(assert (=> d!141597 (=> (not res!865954) (not e!743684))))

(declare-fun lt!583340 () ListLongMap!20339)

(assert (=> d!141597 (= res!865954 (contains!8249 lt!583340 (_1!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583339 () List!29790)

(assert (=> d!141597 (= lt!583340 (ListLongMap!20340 lt!583339))))

(declare-fun lt!583337 () Unit!43007)

(declare-fun lt!583338 () Unit!43007)

(assert (=> d!141597 (= lt!583337 lt!583338)))

(assert (=> d!141597 (= (getValueByKey!708 lt!583339 (_1!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!758 (_2!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141597 (= lt!583338 (lemmaContainsTupThenGetReturnValue!352 lt!583339 (_1!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141597 (= lt!583339 (insertStrictlySorted!481 (toList!10185 call!64211) (_1!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141597 (= (+!4515 call!64211 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583340)))

(declare-fun b!1303803 () Bool)

(declare-fun res!865953 () Bool)

(assert (=> b!1303803 (=> (not res!865953) (not e!743684))))

(assert (=> b!1303803 (= res!865953 (= (getValueByKey!708 (toList!10185 lt!583340) (_1!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!758 (_2!11352 (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1303804 () Bool)

(assert (=> b!1303804 (= e!743684 (contains!8253 (toList!10185 lt!583340) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141597 res!865954) b!1303803))

(assert (= (and b!1303803 res!865953) b!1303804))

(declare-fun m!1194315 () Bool)

(assert (=> d!141597 m!1194315))

(declare-fun m!1194317 () Bool)

(assert (=> d!141597 m!1194317))

(declare-fun m!1194319 () Bool)

(assert (=> d!141597 m!1194319))

(declare-fun m!1194321 () Bool)

(assert (=> d!141597 m!1194321))

(declare-fun m!1194323 () Bool)

(assert (=> b!1303803 m!1194323))

(declare-fun m!1194325 () Bool)

(assert (=> b!1303804 m!1194325))

(assert (=> b!1303716 d!141597))

(declare-fun d!141599 () Bool)

(assert (=> d!141599 (isDefined!515 (getValueByKey!708 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))

(declare-fun lt!583341 () Unit!43007)

(assert (=> d!141599 (= lt!583341 (choose!1933 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))

(declare-fun e!743685 () Bool)

(assert (=> d!141599 e!743685))

(declare-fun res!865955 () Bool)

(assert (=> d!141599 (=> (not res!865955) (not e!743685))))

(assert (=> d!141599 (= res!865955 (isStrictlySorted!869 (toList!10185 (ListLongMap!20340 Nil!29787))))))

(assert (=> d!141599 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205) lt!583341)))

(declare-fun b!1303805 () Bool)

(assert (=> b!1303805 (= e!743685 (containsKey!725 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))

(assert (= (and d!141599 res!865955) b!1303805))

(assert (=> d!141599 m!1194083))

(assert (=> d!141599 m!1194083))

(assert (=> d!141599 m!1194085))

(declare-fun m!1194327 () Bool)

(assert (=> d!141599 m!1194327))

(declare-fun m!1194329 () Bool)

(assert (=> d!141599 m!1194329))

(assert (=> b!1303805 m!1194079))

(assert (=> b!1303615 d!141599))

(declare-fun d!141601 () Bool)

(assert (=> d!141601 (= (isDefined!515 (getValueByKey!708 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205)) (not (isEmpty!1069 (getValueByKey!708 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205))))))

(declare-fun bs!37106 () Bool)

(assert (= bs!37106 d!141601))

(assert (=> bs!37106 m!1194083))

(declare-fun m!1194331 () Bool)

(assert (=> bs!37106 m!1194331))

(assert (=> b!1303615 d!141601))

(declare-fun b!1303809 () Bool)

(declare-fun e!743687 () Option!759)

(assert (=> b!1303809 (= e!743687 None!757)))

(declare-fun b!1303806 () Bool)

(declare-fun e!743686 () Option!759)

(assert (=> b!1303806 (= e!743686 (Some!758 (_2!11352 (h!30995 (toList!10185 (ListLongMap!20340 Nil!29787))))))))

(declare-fun d!141603 () Bool)

(declare-fun c!125137 () Bool)

(assert (=> d!141603 (= c!125137 (and ((_ is Cons!29786) (toList!10185 (ListLongMap!20340 Nil!29787))) (= (_1!11352 (h!30995 (toList!10185 (ListLongMap!20340 Nil!29787)))) k0!1205)))))

(assert (=> d!141603 (= (getValueByKey!708 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205) e!743686)))

(declare-fun b!1303808 () Bool)

(assert (=> b!1303808 (= e!743687 (getValueByKey!708 (t!43376 (toList!10185 (ListLongMap!20340 Nil!29787))) k0!1205))))

(declare-fun b!1303807 () Bool)

(assert (=> b!1303807 (= e!743686 e!743687)))

(declare-fun c!125138 () Bool)

(assert (=> b!1303807 (= c!125138 (and ((_ is Cons!29786) (toList!10185 (ListLongMap!20340 Nil!29787))) (not (= (_1!11352 (h!30995 (toList!10185 (ListLongMap!20340 Nil!29787)))) k0!1205))))))

(assert (= (and d!141603 c!125137) b!1303806))

(assert (= (and d!141603 (not c!125137)) b!1303807))

(assert (= (and b!1303807 c!125138) b!1303808))

(assert (= (and b!1303807 (not c!125138)) b!1303809))

(declare-fun m!1194333 () Bool)

(assert (=> b!1303808 m!1194333))

(assert (=> b!1303615 d!141603))

(assert (=> bm!64206 d!141547))

(declare-fun d!141605 () Bool)

(declare-fun e!743688 () Bool)

(assert (=> d!141605 e!743688))

(declare-fun res!865956 () Bool)

(assert (=> d!141605 (=> res!865956 e!743688)))

(declare-fun lt!583345 () Bool)

(assert (=> d!141605 (= res!865956 (not lt!583345))))

(declare-fun lt!583344 () Bool)

(assert (=> d!141605 (= lt!583345 lt!583344)))

(declare-fun lt!583343 () Unit!43007)

(declare-fun e!743689 () Unit!43007)

(assert (=> d!141605 (= lt!583343 e!743689)))

(declare-fun c!125139 () Bool)

(assert (=> d!141605 (= c!125139 lt!583344)))

(assert (=> d!141605 (= lt!583344 (containsKey!725 (toList!10185 lt!583277) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141605 (= (contains!8249 lt!583277 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583345)))

(declare-fun b!1303810 () Bool)

(declare-fun lt!583342 () Unit!43007)

(assert (=> b!1303810 (= e!743689 lt!583342)))

(assert (=> b!1303810 (= lt!583342 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 lt!583277) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303810 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583277) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303811 () Bool)

(declare-fun Unit!43020 () Unit!43007)

(assert (=> b!1303811 (= e!743689 Unit!43020)))

(declare-fun b!1303812 () Bool)

(assert (=> b!1303812 (= e!743688 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583277) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141605 c!125139) b!1303810))

(assert (= (and d!141605 (not c!125139)) b!1303811))

(assert (= (and d!141605 (not res!865956)) b!1303812))

(declare-fun m!1194335 () Bool)

(assert (=> d!141605 m!1194335))

(declare-fun m!1194337 () Bool)

(assert (=> b!1303810 m!1194337))

(declare-fun m!1194339 () Bool)

(assert (=> b!1303810 m!1194339))

(assert (=> b!1303810 m!1194339))

(declare-fun m!1194341 () Bool)

(assert (=> b!1303810 m!1194341))

(assert (=> b!1303812 m!1194339))

(assert (=> b!1303812 m!1194339))

(assert (=> b!1303812 m!1194341))

(assert (=> bm!64205 d!141605))

(assert (=> b!1303617 d!141601))

(assert (=> b!1303617 d!141603))

(declare-fun d!141607 () Bool)

(declare-fun e!743690 () Bool)

(assert (=> d!141607 e!743690))

(declare-fun res!865957 () Bool)

(assert (=> d!141607 (=> res!865957 e!743690)))

(declare-fun lt!583349 () Bool)

(assert (=> d!141607 (= res!865957 (not lt!583349))))

(declare-fun lt!583348 () Bool)

(assert (=> d!141607 (= lt!583349 lt!583348)))

(declare-fun lt!583347 () Unit!43007)

(declare-fun e!743691 () Unit!43007)

(assert (=> d!141607 (= lt!583347 e!743691)))

(declare-fun c!125140 () Bool)

(assert (=> d!141607 (= c!125140 lt!583348)))

(assert (=> d!141607 (= lt!583348 (containsKey!725 (toList!10185 lt!583215) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141607 (= (contains!8249 lt!583215 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583349)))

(declare-fun b!1303813 () Bool)

(declare-fun lt!583346 () Unit!43007)

(assert (=> b!1303813 (= e!743691 lt!583346)))

(assert (=> b!1303813 (= lt!583346 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 lt!583215) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303813 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583215) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303814 () Bool)

(declare-fun Unit!43021 () Unit!43007)

(assert (=> b!1303814 (= e!743691 Unit!43021)))

(declare-fun b!1303815 () Bool)

(assert (=> b!1303815 (= e!743690 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583215) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141607 c!125140) b!1303813))

(assert (= (and d!141607 (not c!125140)) b!1303814))

(assert (= (and d!141607 (not res!865957)) b!1303815))

(declare-fun m!1194343 () Bool)

(assert (=> d!141607 m!1194343))

(declare-fun m!1194345 () Bool)

(assert (=> b!1303813 m!1194345))

(declare-fun m!1194347 () Bool)

(assert (=> b!1303813 m!1194347))

(assert (=> b!1303813 m!1194347))

(declare-fun m!1194349 () Bool)

(assert (=> b!1303813 m!1194349))

(assert (=> b!1303815 m!1194347))

(assert (=> b!1303815 m!1194347))

(assert (=> b!1303815 m!1194349))

(assert (=> d!141547 d!141607))

(assert (=> d!141547 d!141533))

(declare-fun d!141609 () Bool)

(declare-fun res!865962 () Bool)

(declare-fun e!743696 () Bool)

(assert (=> d!141609 (=> res!865962 e!743696)))

(assert (=> d!141609 (= res!865962 (and ((_ is Cons!29786) (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11352 (h!30995 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141609 (= (containsKey!725 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743696)))

(declare-fun b!1303820 () Bool)

(declare-fun e!743697 () Bool)

(assert (=> b!1303820 (= e!743696 e!743697)))

(declare-fun res!865963 () Bool)

(assert (=> b!1303820 (=> (not res!865963) (not e!743697))))

(assert (=> b!1303820 (= res!865963 (and (or (not ((_ is Cons!29786) (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11352 (h!30995 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29786) (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11352 (h!30995 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303821 () Bool)

(assert (=> b!1303821 (= e!743697 (containsKey!725 (t!43376 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141609 (not res!865962)) b!1303820))

(assert (= (and b!1303820 res!865963) b!1303821))

(declare-fun m!1194351 () Bool)

(assert (=> b!1303821 m!1194351))

(assert (=> d!141545 d!141609))

(declare-fun d!141611 () Bool)

(assert (=> d!141611 (= (validKeyInArray!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1303749 d!141611))

(assert (=> b!1303658 d!141549))

(assert (=> b!1303748 d!141611))

(declare-fun d!141613 () Bool)

(declare-fun e!743698 () Bool)

(assert (=> d!141613 e!743698))

(declare-fun res!865964 () Bool)

(assert (=> d!141613 (=> res!865964 e!743698)))

(declare-fun lt!583353 () Bool)

(assert (=> d!141613 (= res!865964 (not lt!583353))))

(declare-fun lt!583352 () Bool)

(assert (=> d!141613 (= lt!583353 lt!583352)))

(declare-fun lt!583351 () Unit!43007)

(declare-fun e!743699 () Unit!43007)

(assert (=> d!141613 (= lt!583351 e!743699)))

(declare-fun c!125141 () Bool)

(assert (=> d!141613 (= c!125141 lt!583352)))

(assert (=> d!141613 (= lt!583352 (containsKey!725 (toList!10185 lt!583215) (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> d!141613 (= (contains!8249 lt!583215 (select (arr!41860 _keys!1741) from!2144)) lt!583353)))

(declare-fun b!1303822 () Bool)

(declare-fun lt!583350 () Unit!43007)

(assert (=> b!1303822 (= e!743699 lt!583350)))

(assert (=> b!1303822 (= lt!583350 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 lt!583215) (select (arr!41860 _keys!1741) from!2144)))))

(assert (=> b!1303822 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583215) (select (arr!41860 _keys!1741) from!2144)))))

(declare-fun b!1303823 () Bool)

(declare-fun Unit!43022 () Unit!43007)

(assert (=> b!1303823 (= e!743699 Unit!43022)))

(declare-fun b!1303824 () Bool)

(assert (=> b!1303824 (= e!743698 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583215) (select (arr!41860 _keys!1741) from!2144))))))

(assert (= (and d!141613 c!125141) b!1303822))

(assert (= (and d!141613 (not c!125141)) b!1303823))

(assert (= (and d!141613 (not res!865964)) b!1303824))

(assert (=> d!141613 m!1194011))

(declare-fun m!1194353 () Bool)

(assert (=> d!141613 m!1194353))

(assert (=> b!1303822 m!1194011))

(declare-fun m!1194355 () Bool)

(assert (=> b!1303822 m!1194355))

(assert (=> b!1303822 m!1194011))

(declare-fun m!1194357 () Bool)

(assert (=> b!1303822 m!1194357))

(assert (=> b!1303822 m!1194357))

(declare-fun m!1194359 () Bool)

(assert (=> b!1303822 m!1194359))

(assert (=> b!1303824 m!1194011))

(assert (=> b!1303824 m!1194357))

(assert (=> b!1303824 m!1194357))

(assert (=> b!1303824 m!1194359))

(assert (=> b!1303659 d!141613))

(declare-fun d!141615 () Bool)

(declare-fun res!865965 () Bool)

(declare-fun e!743700 () Bool)

(assert (=> d!141615 (=> res!865965 e!743700)))

(assert (=> d!141615 (= res!865965 (and ((_ is Cons!29786) (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11352 (h!30995 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141615 (= (containsKey!725 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743700)))

(declare-fun b!1303825 () Bool)

(declare-fun e!743701 () Bool)

(assert (=> b!1303825 (= e!743700 e!743701)))

(declare-fun res!865966 () Bool)

(assert (=> b!1303825 (=> (not res!865966) (not e!743701))))

(assert (=> b!1303825 (= res!865966 (and (or (not ((_ is Cons!29786) (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11352 (h!30995 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29786) (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11352 (h!30995 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303826 () Bool)

(assert (=> b!1303826 (= e!743701 (containsKey!725 (t!43376 (toList!10185 (getCurrentListMap!5087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141615 (not res!865965)) b!1303825))

(assert (= (and b!1303825 res!865966) b!1303826))

(declare-fun m!1194361 () Bool)

(assert (=> b!1303826 m!1194361))

(assert (=> d!141551 d!141615))

(declare-fun d!141617 () Bool)

(declare-fun lt!583356 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!644 (List!29791) (InoxSet (_ BitVec 64)))

(assert (=> d!141617 (= lt!583356 (select (content!644 Nil!29788) (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!743706 () Bool)

(assert (=> d!141617 (= lt!583356 e!743706)))

(declare-fun res!865971 () Bool)

(assert (=> d!141617 (=> (not res!865971) (not e!743706))))

(assert (=> d!141617 (= res!865971 ((_ is Cons!29787) Nil!29788))))

(assert (=> d!141617 (= (contains!8252 Nil!29788 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)) lt!583356)))

(declare-fun b!1303831 () Bool)

(declare-fun e!743707 () Bool)

(assert (=> b!1303831 (= e!743706 e!743707)))

(declare-fun res!865972 () Bool)

(assert (=> b!1303831 (=> res!865972 e!743707)))

(assert (=> b!1303831 (= res!865972 (= (h!30996 Nil!29788) (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1303832 () Bool)

(assert (=> b!1303832 (= e!743707 (contains!8252 (t!43377 Nil!29788) (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141617 res!865971) b!1303831))

(assert (= (and b!1303831 (not res!865972)) b!1303832))

(declare-fun m!1194363 () Bool)

(assert (=> d!141617 m!1194363))

(assert (=> d!141617 m!1194089))

(declare-fun m!1194365 () Bool)

(assert (=> d!141617 m!1194365))

(assert (=> b!1303832 m!1194089))

(declare-fun m!1194367 () Bool)

(assert (=> b!1303832 m!1194367))

(assert (=> b!1303747 d!141617))

(assert (=> d!141553 d!141533))

(assert (=> b!1303729 d!141549))

(declare-fun b!1303833 () Bool)

(declare-fun e!743710 () Bool)

(assert (=> b!1303833 (= e!743710 (contains!8252 (ite c!125127 (Cons!29787 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) Nil!29788) Nil!29788) (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303834 () Bool)

(declare-fun e!743711 () Bool)

(declare-fun e!743708 () Bool)

(assert (=> b!1303834 (= e!743711 e!743708)))

(declare-fun res!865975 () Bool)

(assert (=> b!1303834 (=> (not res!865975) (not e!743708))))

(assert (=> b!1303834 (= res!865975 (not e!743710))))

(declare-fun res!865974 () Bool)

(assert (=> b!1303834 (=> (not res!865974) (not e!743710))))

(assert (=> b!1303834 (= res!865974 (validKeyInArray!0 (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303835 () Bool)

(declare-fun e!743709 () Bool)

(assert (=> b!1303835 (= e!743708 e!743709)))

(declare-fun c!125142 () Bool)

(assert (=> b!1303835 (= c!125142 (validKeyInArray!0 (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303836 () Bool)

(declare-fun call!64218 () Bool)

(assert (=> b!1303836 (= e!743709 call!64218)))

(declare-fun b!1303837 () Bool)

(assert (=> b!1303837 (= e!743709 call!64218)))

(declare-fun d!141619 () Bool)

(declare-fun res!865973 () Bool)

(assert (=> d!141619 (=> res!865973 e!743711)))

(assert (=> d!141619 (= res!865973 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(assert (=> d!141619 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125127 (Cons!29787 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) Nil!29788) Nil!29788)) e!743711)))

(declare-fun bm!64215 () Bool)

(assert (=> bm!64215 (= call!64218 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125142 (Cons!29787 (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125127 (Cons!29787 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) Nil!29788) Nil!29788)) (ite c!125127 (Cons!29787 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) Nil!29788) Nil!29788))))))

(assert (= (and d!141619 (not res!865973)) b!1303834))

(assert (= (and b!1303834 res!865974) b!1303833))

(assert (= (and b!1303834 res!865975) b!1303835))

(assert (= (and b!1303835 c!125142) b!1303836))

(assert (= (and b!1303835 (not c!125142)) b!1303837))

(assert (= (or b!1303836 b!1303837) bm!64215))

(declare-fun m!1194369 () Bool)

(assert (=> b!1303833 m!1194369))

(assert (=> b!1303833 m!1194369))

(declare-fun m!1194371 () Bool)

(assert (=> b!1303833 m!1194371))

(assert (=> b!1303834 m!1194369))

(assert (=> b!1303834 m!1194369))

(declare-fun m!1194373 () Bool)

(assert (=> b!1303834 m!1194373))

(assert (=> b!1303835 m!1194369))

(assert (=> b!1303835 m!1194369))

(assert (=> b!1303835 m!1194373))

(assert (=> bm!64215 m!1194369))

(declare-fun m!1194375 () Bool)

(assert (=> bm!64215 m!1194375))

(assert (=> bm!64214 d!141619))

(declare-fun d!141621 () Bool)

(assert (=> d!141621 (= (apply!1015 lt!583277 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21167 (getValueByKey!708 (toList!10185 lt!583277) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37107 () Bool)

(assert (= bs!37107 d!141621))

(assert (=> bs!37107 m!1194339))

(assert (=> bs!37107 m!1194339))

(declare-fun m!1194377 () Bool)

(assert (=> bs!37107 m!1194377))

(assert (=> b!1303728 d!141621))

(declare-fun d!141623 () Bool)

(declare-fun res!865976 () Bool)

(declare-fun e!743712 () Bool)

(assert (=> d!141623 (=> res!865976 e!743712)))

(assert (=> d!141623 (= res!865976 (and ((_ is Cons!29786) (toList!10185 (ListLongMap!20340 Nil!29787))) (= (_1!11352 (h!30995 (toList!10185 (ListLongMap!20340 Nil!29787)))) k0!1205)))))

(assert (=> d!141623 (= (containsKey!725 (toList!10185 (ListLongMap!20340 Nil!29787)) k0!1205) e!743712)))

(declare-fun b!1303838 () Bool)

(declare-fun e!743713 () Bool)

(assert (=> b!1303838 (= e!743712 e!743713)))

(declare-fun res!865977 () Bool)

(assert (=> b!1303838 (=> (not res!865977) (not e!743713))))

(assert (=> b!1303838 (= res!865977 (and (or (not ((_ is Cons!29786) (toList!10185 (ListLongMap!20340 Nil!29787)))) (bvsle (_1!11352 (h!30995 (toList!10185 (ListLongMap!20340 Nil!29787)))) k0!1205)) ((_ is Cons!29786) (toList!10185 (ListLongMap!20340 Nil!29787))) (bvslt (_1!11352 (h!30995 (toList!10185 (ListLongMap!20340 Nil!29787)))) k0!1205)))))

(declare-fun b!1303839 () Bool)

(assert (=> b!1303839 (= e!743713 (containsKey!725 (t!43376 (toList!10185 (ListLongMap!20340 Nil!29787))) k0!1205))))

(assert (= (and d!141623 (not res!865976)) b!1303838))

(assert (= (and b!1303838 res!865977) b!1303839))

(declare-fun m!1194379 () Bool)

(assert (=> b!1303839 m!1194379))

(assert (=> d!141539 d!141623))

(declare-fun d!141625 () Bool)

(declare-fun isEmpty!1070 (List!29790) Bool)

(assert (=> d!141625 (= (isEmpty!1068 lt!583215) (isEmpty!1070 (toList!10185 lt!583215)))))

(declare-fun bs!37108 () Bool)

(assert (= bs!37108 d!141625))

(declare-fun m!1194381 () Bool)

(assert (=> bs!37108 m!1194381))

(assert (=> b!1303661 d!141625))

(assert (=> b!1303627 d!141611))

(declare-fun d!141627 () Bool)

(assert (=> d!141627 (arrayContainsKey!0 _keys!1741 lt!583194 #b00000000000000000000000000000000)))

(declare-fun lt!583359 () Unit!43007)

(declare-fun choose!13 (array!86737 (_ BitVec 64) (_ BitVec 32)) Unit!43007)

(assert (=> d!141627 (= lt!583359 (choose!13 _keys!1741 lt!583194 #b00000000000000000000000000000000))))

(assert (=> d!141627 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141627 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583194 #b00000000000000000000000000000000) lt!583359)))

(declare-fun bs!37109 () Bool)

(assert (= bs!37109 d!141627))

(assert (=> bs!37109 m!1194095))

(declare-fun m!1194383 () Bool)

(assert (=> bs!37109 m!1194383))

(assert (=> b!1303628 d!141627))

(declare-fun d!141629 () Bool)

(declare-fun res!865982 () Bool)

(declare-fun e!743718 () Bool)

(assert (=> d!141629 (=> res!865982 e!743718)))

(assert (=> d!141629 (= res!865982 (= (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) lt!583194))))

(assert (=> d!141629 (= (arrayContainsKey!0 _keys!1741 lt!583194 #b00000000000000000000000000000000) e!743718)))

(declare-fun b!1303844 () Bool)

(declare-fun e!743719 () Bool)

(assert (=> b!1303844 (= e!743718 e!743719)))

(declare-fun res!865983 () Bool)

(assert (=> b!1303844 (=> (not res!865983) (not e!743719))))

(assert (=> b!1303844 (= res!865983 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(declare-fun b!1303845 () Bool)

(assert (=> b!1303845 (= e!743719 (arrayContainsKey!0 _keys!1741 lt!583194 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141629 (not res!865982)) b!1303844))

(assert (= (and b!1303844 res!865983) b!1303845))

(assert (=> d!141629 m!1194089))

(declare-fun m!1194385 () Bool)

(assert (=> b!1303845 m!1194385))

(assert (=> b!1303628 d!141629))

(declare-fun b!1303858 () Bool)

(declare-fun e!743727 () SeekEntryResult!10024)

(declare-fun lt!583368 () SeekEntryResult!10024)

(assert (=> b!1303858 (= e!743727 (MissingZero!10024 (index!42469 lt!583368)))))

(declare-fun b!1303859 () Bool)

(declare-fun c!125151 () Bool)

(declare-fun lt!583366 () (_ BitVec 64))

(assert (=> b!1303859 (= c!125151 (= lt!583366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!743726 () SeekEntryResult!10024)

(assert (=> b!1303859 (= e!743726 e!743727)))

(declare-fun b!1303860 () Bool)

(declare-fun e!743728 () SeekEntryResult!10024)

(assert (=> b!1303860 (= e!743728 Undefined!10024)))

(declare-fun b!1303862 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86737 (_ BitVec 32)) SeekEntryResult!10024)

(assert (=> b!1303862 (= e!743727 (seekKeyOrZeroReturnVacant!0 (x!115788 lt!583368) (index!42469 lt!583368) (index!42469 lt!583368) (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1303863 () Bool)

(assert (=> b!1303863 (= e!743726 (Found!10024 (index!42469 lt!583368)))))

(declare-fun b!1303861 () Bool)

(assert (=> b!1303861 (= e!743728 e!743726)))

(assert (=> b!1303861 (= lt!583366 (select (arr!41860 _keys!1741) (index!42469 lt!583368)))))

(declare-fun c!125149 () Bool)

(assert (=> b!1303861 (= c!125149 (= lt!583366 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141631 () Bool)

(declare-fun lt!583367 () SeekEntryResult!10024)

(assert (=> d!141631 (and (or ((_ is Undefined!10024) lt!583367) (not ((_ is Found!10024) lt!583367)) (and (bvsge (index!42468 lt!583367) #b00000000000000000000000000000000) (bvslt (index!42468 lt!583367) (size!42412 _keys!1741)))) (or ((_ is Undefined!10024) lt!583367) ((_ is Found!10024) lt!583367) (not ((_ is MissingZero!10024) lt!583367)) (and (bvsge (index!42467 lt!583367) #b00000000000000000000000000000000) (bvslt (index!42467 lt!583367) (size!42412 _keys!1741)))) (or ((_ is Undefined!10024) lt!583367) ((_ is Found!10024) lt!583367) ((_ is MissingZero!10024) lt!583367) (not ((_ is MissingVacant!10024) lt!583367)) (and (bvsge (index!42470 lt!583367) #b00000000000000000000000000000000) (bvslt (index!42470 lt!583367) (size!42412 _keys!1741)))) (or ((_ is Undefined!10024) lt!583367) (ite ((_ is Found!10024) lt!583367) (= (select (arr!41860 _keys!1741) (index!42468 lt!583367)) (select (arr!41860 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10024) lt!583367) (= (select (arr!41860 _keys!1741) (index!42467 lt!583367)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10024) lt!583367) (= (select (arr!41860 _keys!1741) (index!42470 lt!583367)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141631 (= lt!583367 e!743728)))

(declare-fun c!125150 () Bool)

(assert (=> d!141631 (= c!125150 (and ((_ is Intermediate!10024) lt!583368) (undefined!10836 lt!583368)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86737 (_ BitVec 32)) SeekEntryResult!10024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141631 (= lt!583368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141631 (validMask!0 mask!2175)))

(assert (=> d!141631 (= (seekEntryOrOpen!0 (select (arr!41860 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!583367)))

(assert (= (and d!141631 c!125150) b!1303860))

(assert (= (and d!141631 (not c!125150)) b!1303861))

(assert (= (and b!1303861 c!125149) b!1303863))

(assert (= (and b!1303861 (not c!125149)) b!1303859))

(assert (= (and b!1303859 c!125151) b!1303858))

(assert (= (and b!1303859 (not c!125151)) b!1303862))

(assert (=> b!1303862 m!1194089))

(declare-fun m!1194387 () Bool)

(assert (=> b!1303862 m!1194387))

(declare-fun m!1194389 () Bool)

(assert (=> b!1303861 m!1194389))

(assert (=> d!141631 m!1194089))

(declare-fun m!1194391 () Bool)

(assert (=> d!141631 m!1194391))

(assert (=> d!141631 m!1194015))

(assert (=> d!141631 m!1194391))

(assert (=> d!141631 m!1194089))

(declare-fun m!1194393 () Bool)

(assert (=> d!141631 m!1194393))

(declare-fun m!1194395 () Bool)

(assert (=> d!141631 m!1194395))

(declare-fun m!1194397 () Bool)

(assert (=> d!141631 m!1194397))

(declare-fun m!1194399 () Bool)

(assert (=> d!141631 m!1194399))

(assert (=> b!1303628 d!141631))

(declare-fun d!141633 () Bool)

(declare-fun e!743729 () Bool)

(assert (=> d!141633 e!743729))

(declare-fun res!865985 () Bool)

(assert (=> d!141633 (=> (not res!865985) (not e!743729))))

(declare-fun lt!583372 () ListLongMap!20339)

(assert (=> d!141633 (= res!865985 (contains!8249 lt!583372 (_1!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!583371 () List!29790)

(assert (=> d!141633 (= lt!583372 (ListLongMap!20340 lt!583371))))

(declare-fun lt!583369 () Unit!43007)

(declare-fun lt!583370 () Unit!43007)

(assert (=> d!141633 (= lt!583369 lt!583370)))

(assert (=> d!141633 (= (getValueByKey!708 lt!583371 (_1!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!758 (_2!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141633 (= lt!583370 (lemmaContainsTupThenGetReturnValue!352 lt!583371 (_1!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141633 (= lt!583371 (insertStrictlySorted!481 (toList!10185 (ite c!125120 call!64212 (ite c!125119 call!64209 call!64213))) (_1!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141633 (= (+!4515 (ite c!125120 call!64212 (ite c!125119 call!64209 call!64213)) (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!583372)))

(declare-fun b!1303864 () Bool)

(declare-fun res!865984 () Bool)

(assert (=> b!1303864 (=> (not res!865984) (not e!743729))))

(assert (=> b!1303864 (= res!865984 (= (getValueByKey!708 (toList!10185 lt!583372) (_1!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!758 (_2!11352 (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1303865 () Bool)

(assert (=> b!1303865 (= e!743729 (contains!8253 (toList!10185 lt!583372) (ite (or c!125120 c!125119) (tuple2!22683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141633 res!865985) b!1303864))

(assert (= (and b!1303864 res!865984) b!1303865))

(declare-fun m!1194401 () Bool)

(assert (=> d!141633 m!1194401))

(declare-fun m!1194403 () Bool)

(assert (=> d!141633 m!1194403))

(declare-fun m!1194405 () Bool)

(assert (=> d!141633 m!1194405))

(declare-fun m!1194407 () Bool)

(assert (=> d!141633 m!1194407))

(declare-fun m!1194409 () Bool)

(assert (=> b!1303864 m!1194409))

(declare-fun m!1194411 () Bool)

(assert (=> b!1303865 m!1194411))

(assert (=> bm!64209 d!141633))

(declare-fun b!1303866 () Bool)

(declare-fun e!743731 () Bool)

(declare-fun call!64219 () Bool)

(assert (=> b!1303866 (= e!743731 call!64219)))

(declare-fun b!1303867 () Bool)

(declare-fun e!743730 () Bool)

(declare-fun e!743732 () Bool)

(assert (=> b!1303867 (= e!743730 e!743732)))

(declare-fun c!125152 () Bool)

(assert (=> b!1303867 (= c!125152 (validKeyInArray!0 (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303868 () Bool)

(assert (=> b!1303868 (= e!743732 e!743731)))

(declare-fun lt!583375 () (_ BitVec 64))

(assert (=> b!1303868 (= lt!583375 (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!583373 () Unit!43007)

(assert (=> b!1303868 (= lt!583373 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583375 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1303868 (arrayContainsKey!0 _keys!1741 lt!583375 #b00000000000000000000000000000000)))

(declare-fun lt!583374 () Unit!43007)

(assert (=> b!1303868 (= lt!583374 lt!583373)))

(declare-fun res!865987 () Bool)

(assert (=> b!1303868 (= res!865987 (= (seekEntryOrOpen!0 (select (arr!41860 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10024 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1303868 (=> (not res!865987) (not e!743731))))

(declare-fun d!141635 () Bool)

(declare-fun res!865986 () Bool)

(assert (=> d!141635 (=> res!865986 e!743730)))

(assert (=> d!141635 (= res!865986 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(assert (=> d!141635 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!743730)))

(declare-fun bm!64216 () Bool)

(assert (=> bm!64216 (= call!64219 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1303869 () Bool)

(assert (=> b!1303869 (= e!743732 call!64219)))

(assert (= (and d!141635 (not res!865986)) b!1303867))

(assert (= (and b!1303867 c!125152) b!1303868))

(assert (= (and b!1303867 (not c!125152)) b!1303869))

(assert (= (and b!1303868 res!865987) b!1303866))

(assert (= (or b!1303866 b!1303869) bm!64216))

(assert (=> b!1303867 m!1194369))

(assert (=> b!1303867 m!1194369))

(assert (=> b!1303867 m!1194373))

(assert (=> b!1303868 m!1194369))

(declare-fun m!1194413 () Bool)

(assert (=> b!1303868 m!1194413))

(declare-fun m!1194415 () Bool)

(assert (=> b!1303868 m!1194415))

(assert (=> b!1303868 m!1194369))

(declare-fun m!1194417 () Bool)

(assert (=> b!1303868 m!1194417))

(declare-fun m!1194419 () Bool)

(assert (=> bm!64216 m!1194419))

(assert (=> bm!64187 d!141635))

(declare-fun b!1303871 () Bool)

(declare-fun e!743739 () ListLongMap!20339)

(declare-fun e!743737 () ListLongMap!20339)

(assert (=> b!1303871 (= e!743739 e!743737)))

(declare-fun c!125156 () Bool)

(assert (=> b!1303871 (= c!125156 (validKeyInArray!0 (select (arr!41860 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1303872 () Bool)

(declare-fun e!743738 () Bool)

(declare-fun e!743736 () Bool)

(assert (=> b!1303872 (= e!743738 e!743736)))

(assert (=> b!1303872 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(declare-fun lt!583378 () ListLongMap!20339)

(declare-fun res!865991 () Bool)

(assert (=> b!1303872 (= res!865991 (contains!8249 lt!583378 (select (arr!41860 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1303872 (=> (not res!865991) (not e!743736))))

(declare-fun b!1303873 () Bool)

(declare-fun e!743735 () Bool)

(assert (=> b!1303873 (= e!743735 e!743738)))

(declare-fun c!125155 () Bool)

(declare-fun e!743733 () Bool)

(assert (=> b!1303873 (= c!125155 e!743733)))

(declare-fun res!865988 () Bool)

(assert (=> b!1303873 (=> (not res!865988) (not e!743733))))

(assert (=> b!1303873 (= res!865988 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(declare-fun b!1303874 () Bool)

(declare-fun e!743734 () Bool)

(assert (=> b!1303874 (= e!743734 (isEmpty!1068 lt!583378))))

(declare-fun b!1303875 () Bool)

(assert (=> b!1303875 (= e!743739 (ListLongMap!20340 Nil!29787))))

(declare-fun b!1303876 () Bool)

(declare-fun call!64220 () ListLongMap!20339)

(assert (=> b!1303876 (= e!743737 call!64220)))

(declare-fun b!1303877 () Bool)

(assert (=> b!1303877 (= e!743734 (= lt!583378 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1303878 () Bool)

(declare-fun lt!583376 () Unit!43007)

(declare-fun lt!583377 () Unit!43007)

(assert (=> b!1303878 (= lt!583376 lt!583377)))

(declare-fun lt!583382 () V!51649)

(declare-fun lt!583380 () (_ BitVec 64))

(declare-fun lt!583379 () ListLongMap!20339)

(declare-fun lt!583381 () (_ BitVec 64))

(assert (=> b!1303878 (not (contains!8249 (+!4515 lt!583379 (tuple2!22683 lt!583381 lt!583382)) lt!583380))))

(assert (=> b!1303878 (= lt!583377 (addStillNotContains!468 lt!583379 lt!583381 lt!583382 lt!583380))))

(assert (=> b!1303878 (= lt!583380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1303878 (= lt!583382 (get!21166 (select (arr!41859 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1303878 (= lt!583381 (select (arr!41860 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1303878 (= lt!583379 call!64220)))

(assert (=> b!1303878 (= e!743737 (+!4515 call!64220 (tuple2!22683 (select (arr!41860 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21166 (select (arr!41859 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1303870 () Bool)

(assert (=> b!1303870 (= e!743738 e!743734)))

(declare-fun c!125154 () Bool)

(assert (=> b!1303870 (= c!125154 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(declare-fun d!141637 () Bool)

(assert (=> d!141637 e!743735))

(declare-fun res!865990 () Bool)

(assert (=> d!141637 (=> (not res!865990) (not e!743735))))

(assert (=> d!141637 (= res!865990 (not (contains!8249 lt!583378 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141637 (= lt!583378 e!743739)))

(declare-fun c!125153 () Bool)

(assert (=> d!141637 (= c!125153 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(assert (=> d!141637 (validMask!0 mask!2175)))

(assert (=> d!141637 (= (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!583378)))

(declare-fun b!1303879 () Bool)

(assert (=> b!1303879 (= e!743733 (validKeyInArray!0 (select (arr!41860 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1303879 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1303880 () Bool)

(declare-fun res!865989 () Bool)

(assert (=> b!1303880 (=> (not res!865989) (not e!743735))))

(assert (=> b!1303880 (= res!865989 (not (contains!8249 lt!583378 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!64217 () Bool)

(assert (=> bm!64217 (= call!64220 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1303881 () Bool)

(assert (=> b!1303881 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42412 _keys!1741)))))

(assert (=> b!1303881 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42411 _values!1445)))))

(assert (=> b!1303881 (= e!743736 (= (apply!1015 lt!583378 (select (arr!41860 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21166 (select (arr!41859 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!141637 c!125153) b!1303875))

(assert (= (and d!141637 (not c!125153)) b!1303871))

(assert (= (and b!1303871 c!125156) b!1303878))

(assert (= (and b!1303871 (not c!125156)) b!1303876))

(assert (= (or b!1303878 b!1303876) bm!64217))

(assert (= (and d!141637 res!865990) b!1303880))

(assert (= (and b!1303880 res!865989) b!1303873))

(assert (= (and b!1303873 res!865988) b!1303879))

(assert (= (and b!1303873 c!125155) b!1303872))

(assert (= (and b!1303873 (not c!125155)) b!1303870))

(assert (= (and b!1303872 res!865991) b!1303881))

(assert (= (and b!1303870 c!125154) b!1303877))

(assert (= (and b!1303870 (not c!125154)) b!1303874))

(declare-fun b_lambda!23277 () Bool)

(assert (=> (not b_lambda!23277) (not b!1303878)))

(assert (=> b!1303878 t!43382))

(declare-fun b_and!47427 () Bool)

(assert (= b_and!47425 (and (=> t!43382 result!23811) b_and!47427)))

(declare-fun b_lambda!23279 () Bool)

(assert (=> (not b_lambda!23279) (not b!1303881)))

(assert (=> b!1303881 t!43382))

(declare-fun b_and!47429 () Bool)

(assert (= b_and!47427 (and (=> t!43382 result!23811) b_and!47429)))

(declare-fun m!1194421 () Bool)

(assert (=> b!1303880 m!1194421))

(declare-fun m!1194423 () Bool)

(assert (=> b!1303881 m!1194423))

(assert (=> b!1303881 m!1194113))

(declare-fun m!1194425 () Bool)

(assert (=> b!1303881 m!1194425))

(assert (=> b!1303881 m!1194425))

(declare-fun m!1194427 () Bool)

(assert (=> b!1303881 m!1194427))

(assert (=> b!1303881 m!1194423))

(assert (=> b!1303881 m!1194113))

(declare-fun m!1194429 () Bool)

(assert (=> b!1303881 m!1194429))

(declare-fun m!1194431 () Bool)

(assert (=> b!1303877 m!1194431))

(assert (=> bm!64217 m!1194431))

(assert (=> b!1303871 m!1194425))

(assert (=> b!1303871 m!1194425))

(declare-fun m!1194433 () Bool)

(assert (=> b!1303871 m!1194433))

(declare-fun m!1194435 () Bool)

(assert (=> d!141637 m!1194435))

(assert (=> d!141637 m!1194015))

(declare-fun m!1194437 () Bool)

(assert (=> b!1303874 m!1194437))

(assert (=> b!1303872 m!1194425))

(assert (=> b!1303872 m!1194425))

(declare-fun m!1194439 () Bool)

(assert (=> b!1303872 m!1194439))

(assert (=> b!1303879 m!1194425))

(assert (=> b!1303879 m!1194425))

(assert (=> b!1303879 m!1194433))

(assert (=> b!1303878 m!1194113))

(assert (=> b!1303878 m!1194423))

(assert (=> b!1303878 m!1194113))

(assert (=> b!1303878 m!1194429))

(assert (=> b!1303878 m!1194425))

(declare-fun m!1194441 () Bool)

(assert (=> b!1303878 m!1194441))

(declare-fun m!1194443 () Bool)

(assert (=> b!1303878 m!1194443))

(declare-fun m!1194445 () Bool)

(assert (=> b!1303878 m!1194445))

(assert (=> b!1303878 m!1194423))

(assert (=> b!1303878 m!1194443))

(declare-fun m!1194447 () Bool)

(assert (=> b!1303878 m!1194447))

(assert (=> b!1303664 d!141637))

(declare-fun d!141639 () Bool)

(declare-fun e!743740 () Bool)

(assert (=> d!141639 e!743740))

(declare-fun res!865993 () Bool)

(assert (=> d!141639 (=> (not res!865993) (not e!743740))))

(declare-fun lt!583386 () ListLongMap!20339)

(assert (=> d!141639 (= res!865993 (contains!8249 lt!583386 (_1!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!583385 () List!29790)

(assert (=> d!141639 (= lt!583386 (ListLongMap!20340 lt!583385))))

(declare-fun lt!583383 () Unit!43007)

(declare-fun lt!583384 () Unit!43007)

(assert (=> d!141639 (= lt!583383 lt!583384)))

(assert (=> d!141639 (= (getValueByKey!708 lt!583385 (_1!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141639 (= lt!583384 (lemmaContainsTupThenGetReturnValue!352 lt!583385 (_1!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141639 (= lt!583385 (insertStrictlySorted!481 (toList!10185 call!64193) (_1!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141639 (= (+!4515 call!64193 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!583386)))

(declare-fun b!1303882 () Bool)

(declare-fun res!865992 () Bool)

(assert (=> b!1303882 (=> (not res!865992) (not e!743740))))

(assert (=> b!1303882 (= res!865992 (= (getValueByKey!708 (toList!10185 lt!583386) (_1!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11352 (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1303883 () Bool)

(assert (=> b!1303883 (= e!743740 (contains!8253 (toList!10185 lt!583386) (tuple2!22683 (select (arr!41860 _keys!1741) from!2144) (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141639 res!865993) b!1303882))

(assert (= (and b!1303882 res!865992) b!1303883))

(declare-fun m!1194449 () Bool)

(assert (=> d!141639 m!1194449))

(declare-fun m!1194451 () Bool)

(assert (=> d!141639 m!1194451))

(declare-fun m!1194453 () Bool)

(assert (=> d!141639 m!1194453))

(declare-fun m!1194455 () Bool)

(assert (=> d!141639 m!1194455))

(declare-fun m!1194457 () Bool)

(assert (=> b!1303882 m!1194457))

(declare-fun m!1194459 () Bool)

(assert (=> b!1303883 m!1194459))

(assert (=> b!1303665 d!141639))

(declare-fun d!141641 () Bool)

(assert (=> d!141641 (not (contains!8249 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219)) lt!583217))))

(declare-fun lt!583389 () Unit!43007)

(declare-fun choose!1934 (ListLongMap!20339 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43007)

(assert (=> d!141641 (= lt!583389 (choose!1934 lt!583216 lt!583218 lt!583219 lt!583217))))

(declare-fun e!743743 () Bool)

(assert (=> d!141641 e!743743))

(declare-fun res!865996 () Bool)

(assert (=> d!141641 (=> (not res!865996) (not e!743743))))

(assert (=> d!141641 (= res!865996 (not (contains!8249 lt!583216 lt!583217)))))

(assert (=> d!141641 (= (addStillNotContains!468 lt!583216 lt!583218 lt!583219 lt!583217) lt!583389)))

(declare-fun b!1303887 () Bool)

(assert (=> b!1303887 (= e!743743 (not (= lt!583218 lt!583217)))))

(assert (= (and d!141641 res!865996) b!1303887))

(assert (=> d!141641 m!1194129))

(assert (=> d!141641 m!1194129))

(assert (=> d!141641 m!1194131))

(declare-fun m!1194461 () Bool)

(assert (=> d!141641 m!1194461))

(declare-fun m!1194463 () Bool)

(assert (=> d!141641 m!1194463))

(assert (=> b!1303665 d!141641))

(declare-fun d!141643 () Bool)

(declare-fun c!125159 () Bool)

(assert (=> d!141643 (= c!125159 ((_ is ValueCellFull!16556) (select (arr!41859 _values!1445) from!2144)))))

(declare-fun e!743746 () V!51649)

(assert (=> d!141643 (= (get!21166 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!743746)))

(declare-fun b!1303892 () Bool)

(declare-fun get!21168 (ValueCell!16556 V!51649) V!51649)

(assert (=> b!1303892 (= e!743746 (get!21168 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303893 () Bool)

(declare-fun get!21169 (ValueCell!16556 V!51649) V!51649)

(assert (=> b!1303893 (= e!743746 (get!21169 (select (arr!41859 _values!1445) from!2144) (dynLambda!3453 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141643 c!125159) b!1303892))

(assert (= (and d!141643 (not c!125159)) b!1303893))

(assert (=> b!1303892 m!1194111))

(assert (=> b!1303892 m!1194113))

(declare-fun m!1194465 () Bool)

(assert (=> b!1303892 m!1194465))

(assert (=> b!1303893 m!1194111))

(assert (=> b!1303893 m!1194113))

(declare-fun m!1194467 () Bool)

(assert (=> b!1303893 m!1194467))

(assert (=> b!1303665 d!141643))

(declare-fun d!141645 () Bool)

(declare-fun e!743747 () Bool)

(assert (=> d!141645 e!743747))

(declare-fun res!865997 () Bool)

(assert (=> d!141645 (=> res!865997 e!743747)))

(declare-fun lt!583393 () Bool)

(assert (=> d!141645 (= res!865997 (not lt!583393))))

(declare-fun lt!583392 () Bool)

(assert (=> d!141645 (= lt!583393 lt!583392)))

(declare-fun lt!583391 () Unit!43007)

(declare-fun e!743748 () Unit!43007)

(assert (=> d!141645 (= lt!583391 e!743748)))

(declare-fun c!125160 () Bool)

(assert (=> d!141645 (= c!125160 lt!583392)))

(assert (=> d!141645 (= lt!583392 (containsKey!725 (toList!10185 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219))) lt!583217))))

(assert (=> d!141645 (= (contains!8249 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219)) lt!583217) lt!583393)))

(declare-fun b!1303894 () Bool)

(declare-fun lt!583390 () Unit!43007)

(assert (=> b!1303894 (= e!743748 lt!583390)))

(assert (=> b!1303894 (= lt!583390 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219))) lt!583217))))

(assert (=> b!1303894 (isDefined!515 (getValueByKey!708 (toList!10185 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219))) lt!583217))))

(declare-fun b!1303895 () Bool)

(declare-fun Unit!43023 () Unit!43007)

(assert (=> b!1303895 (= e!743748 Unit!43023)))

(declare-fun b!1303896 () Bool)

(assert (=> b!1303896 (= e!743747 (isDefined!515 (getValueByKey!708 (toList!10185 (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219))) lt!583217)))))

(assert (= (and d!141645 c!125160) b!1303894))

(assert (= (and d!141645 (not c!125160)) b!1303895))

(assert (= (and d!141645 (not res!865997)) b!1303896))

(declare-fun m!1194469 () Bool)

(assert (=> d!141645 m!1194469))

(declare-fun m!1194471 () Bool)

(assert (=> b!1303894 m!1194471))

(declare-fun m!1194473 () Bool)

(assert (=> b!1303894 m!1194473))

(assert (=> b!1303894 m!1194473))

(declare-fun m!1194475 () Bool)

(assert (=> b!1303894 m!1194475))

(assert (=> b!1303896 m!1194473))

(assert (=> b!1303896 m!1194473))

(assert (=> b!1303896 m!1194475))

(assert (=> b!1303665 d!141645))

(declare-fun d!141647 () Bool)

(declare-fun e!743749 () Bool)

(assert (=> d!141647 e!743749))

(declare-fun res!865999 () Bool)

(assert (=> d!141647 (=> (not res!865999) (not e!743749))))

(declare-fun lt!583397 () ListLongMap!20339)

(assert (=> d!141647 (= res!865999 (contains!8249 lt!583397 (_1!11352 (tuple2!22683 lt!583218 lt!583219))))))

(declare-fun lt!583396 () List!29790)

(assert (=> d!141647 (= lt!583397 (ListLongMap!20340 lt!583396))))

(declare-fun lt!583394 () Unit!43007)

(declare-fun lt!583395 () Unit!43007)

(assert (=> d!141647 (= lt!583394 lt!583395)))

(assert (=> d!141647 (= (getValueByKey!708 lt!583396 (_1!11352 (tuple2!22683 lt!583218 lt!583219))) (Some!758 (_2!11352 (tuple2!22683 lt!583218 lt!583219))))))

(assert (=> d!141647 (= lt!583395 (lemmaContainsTupThenGetReturnValue!352 lt!583396 (_1!11352 (tuple2!22683 lt!583218 lt!583219)) (_2!11352 (tuple2!22683 lt!583218 lt!583219))))))

(assert (=> d!141647 (= lt!583396 (insertStrictlySorted!481 (toList!10185 lt!583216) (_1!11352 (tuple2!22683 lt!583218 lt!583219)) (_2!11352 (tuple2!22683 lt!583218 lt!583219))))))

(assert (=> d!141647 (= (+!4515 lt!583216 (tuple2!22683 lt!583218 lt!583219)) lt!583397)))

(declare-fun b!1303897 () Bool)

(declare-fun res!865998 () Bool)

(assert (=> b!1303897 (=> (not res!865998) (not e!743749))))

(assert (=> b!1303897 (= res!865998 (= (getValueByKey!708 (toList!10185 lt!583397) (_1!11352 (tuple2!22683 lt!583218 lt!583219))) (Some!758 (_2!11352 (tuple2!22683 lt!583218 lt!583219)))))))

(declare-fun b!1303898 () Bool)

(assert (=> b!1303898 (= e!743749 (contains!8253 (toList!10185 lt!583397) (tuple2!22683 lt!583218 lt!583219)))))

(assert (= (and d!141647 res!865999) b!1303897))

(assert (= (and b!1303897 res!865998) b!1303898))

(declare-fun m!1194477 () Bool)

(assert (=> d!141647 m!1194477))

(declare-fun m!1194479 () Bool)

(assert (=> d!141647 m!1194479))

(declare-fun m!1194481 () Bool)

(assert (=> d!141647 m!1194481))

(declare-fun m!1194483 () Bool)

(assert (=> d!141647 m!1194483))

(declare-fun m!1194485 () Bool)

(assert (=> b!1303897 m!1194485))

(declare-fun m!1194487 () Bool)

(assert (=> b!1303898 m!1194487))

(assert (=> b!1303665 d!141647))

(declare-fun d!141649 () Bool)

(assert (=> d!141649 (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583398 () Unit!43007)

(assert (=> d!141649 (= lt!583398 (choose!1933 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743750 () Bool)

(assert (=> d!141649 e!743750))

(declare-fun res!866000 () Bool)

(assert (=> d!141649 (=> (not res!866000) (not e!743750))))

(assert (=> d!141649 (= res!866000 (isStrictlySorted!869 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141649 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583398)))

(declare-fun b!1303899 () Bool)

(assert (=> b!1303899 (= e!743750 (containsKey!725 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141649 res!866000) b!1303899))

(assert (=> d!141649 m!1194105))

(assert (=> d!141649 m!1194105))

(assert (=> d!141649 m!1194107))

(declare-fun m!1194489 () Bool)

(assert (=> d!141649 m!1194489))

(declare-fun m!1194491 () Bool)

(assert (=> d!141649 m!1194491))

(assert (=> b!1303899 m!1194101))

(assert (=> b!1303630 d!141649))

(declare-fun d!141651 () Bool)

(assert (=> d!141651 (= (isDefined!515 (getValueByKey!708 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1069 (getValueByKey!708 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37110 () Bool)

(assert (= bs!37110 d!141651))

(assert (=> bs!37110 m!1194105))

(declare-fun m!1194493 () Bool)

(assert (=> bs!37110 m!1194493))

(assert (=> b!1303630 d!141651))

(declare-fun b!1303903 () Bool)

(declare-fun e!743752 () Option!759)

(assert (=> b!1303903 (= e!743752 None!757)))

(declare-fun b!1303900 () Bool)

(declare-fun e!743751 () Option!759)

(assert (=> b!1303900 (= e!743751 (Some!758 (_2!11352 (h!30995 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun c!125161 () Bool)

(declare-fun d!141653 () Bool)

(assert (=> d!141653 (= c!125161 (and ((_ is Cons!29786) (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11352 (h!30995 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141653 (= (getValueByKey!708 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743751)))

(declare-fun b!1303902 () Bool)

(assert (=> b!1303902 (= e!743752 (getValueByKey!708 (t!43376 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1303901 () Bool)

(assert (=> b!1303901 (= e!743751 e!743752)))

(declare-fun c!125162 () Bool)

(assert (=> b!1303901 (= c!125162 (and ((_ is Cons!29786) (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11352 (h!30995 (toList!10185 (getCurrentListMapNoExtraKeys!6147 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(assert (= (and d!141653 c!125161) b!1303900))

(assert (= (and d!141653 (not c!125161)) b!1303901))

(assert (= (and b!1303901 c!125162) b!1303902))

(assert (= (and b!1303901 (not c!125162)) b!1303903))

(declare-fun m!1194495 () Bool)

(assert (=> b!1303902 m!1194495))

(assert (=> b!1303630 d!141653))

(assert (=> b!1303666 d!141549))

(assert (=> d!141541 d!141539))

(declare-fun d!141655 () Bool)

(assert (=> d!141655 (not (contains!8249 (ListLongMap!20340 Nil!29787) k0!1205))))

(assert (=> d!141655 true))

(declare-fun _$29!198 () Unit!43007)

(assert (=> d!141655 (= (choose!1930 k0!1205) _$29!198)))

(declare-fun bs!37111 () Bool)

(assert (= bs!37111 d!141655))

(assert (=> bs!37111 m!1194007))

(assert (=> d!141541 d!141655))

(declare-fun d!141657 () Bool)

(assert (=> d!141657 (= (apply!1015 lt!583277 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21167 (getValueByKey!708 (toList!10185 lt!583277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37112 () Bool)

(assert (= bs!37112 d!141657))

(assert (=> bs!37112 m!1194311))

(assert (=> bs!37112 m!1194311))

(declare-fun m!1194497 () Bool)

(assert (=> bs!37112 m!1194497))

(assert (=> b!1303723 d!141657))

(declare-fun d!141659 () Bool)

(declare-fun e!743753 () Bool)

(assert (=> d!141659 e!743753))

(declare-fun res!866001 () Bool)

(assert (=> d!141659 (=> res!866001 e!743753)))

(declare-fun lt!583402 () Bool)

(assert (=> d!141659 (= res!866001 (not lt!583402))))

(declare-fun lt!583401 () Bool)

(assert (=> d!141659 (= lt!583402 lt!583401)))

(declare-fun lt!583400 () Unit!43007)

(declare-fun e!743754 () Unit!43007)

(assert (=> d!141659 (= lt!583400 e!743754)))

(declare-fun c!125163 () Bool)

(assert (=> d!141659 (= c!125163 lt!583401)))

(assert (=> d!141659 (= lt!583401 (containsKey!725 (toList!10185 lt!583215) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141659 (= (contains!8249 lt!583215 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583402)))

(declare-fun b!1303904 () Bool)

(declare-fun lt!583399 () Unit!43007)

(assert (=> b!1303904 (= e!743754 lt!583399)))

(assert (=> b!1303904 (= lt!583399 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10185 lt!583215) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303904 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583215) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303905 () Bool)

(declare-fun Unit!43024 () Unit!43007)

(assert (=> b!1303905 (= e!743754 Unit!43024)))

(declare-fun b!1303906 () Bool)

(assert (=> b!1303906 (= e!743753 (isDefined!515 (getValueByKey!708 (toList!10185 lt!583215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141659 c!125163) b!1303904))

(assert (= (and d!141659 (not c!125163)) b!1303905))

(assert (= (and d!141659 (not res!866001)) b!1303906))

(declare-fun m!1194499 () Bool)

(assert (=> d!141659 m!1194499))

(declare-fun m!1194501 () Bool)

(assert (=> b!1303904 m!1194501))

(declare-fun m!1194503 () Bool)

(assert (=> b!1303904 m!1194503))

(assert (=> b!1303904 m!1194503))

(declare-fun m!1194505 () Bool)

(assert (=> b!1303904 m!1194505))

(assert (=> b!1303906 m!1194503))

(assert (=> b!1303906 m!1194503))

(assert (=> b!1303906 m!1194505))

(assert (=> b!1303667 d!141659))

(declare-fun d!141661 () Bool)

(assert (=> d!141661 (= (apply!1015 lt!583277 (select (arr!41860 _keys!1741) from!2144)) (get!21167 (getValueByKey!708 (toList!10185 lt!583277) (select (arr!41860 _keys!1741) from!2144))))))

(declare-fun bs!37113 () Bool)

(assert (= bs!37113 d!141661))

(assert (=> bs!37113 m!1194011))

(assert (=> bs!37113 m!1194299))

(assert (=> bs!37113 m!1194299))

(declare-fun m!1194507 () Bool)

(assert (=> bs!37113 m!1194507))

(assert (=> b!1303722 d!141661))

(assert (=> b!1303722 d!141643))

(assert (=> b!1303632 d!141651))

(assert (=> b!1303632 d!141653))

(assert (=> bm!64190 d!141637))

(assert (=> b!1303721 d!141549))

(declare-fun d!141663 () Bool)

(assert (=> d!141663 (= (apply!1015 lt!583215 (select (arr!41860 _keys!1741) from!2144)) (get!21167 (getValueByKey!708 (toList!10185 lt!583215) (select (arr!41860 _keys!1741) from!2144))))))

(declare-fun bs!37114 () Bool)

(assert (= bs!37114 d!141663))

(assert (=> bs!37114 m!1194011))

(assert (=> bs!37114 m!1194357))

(assert (=> bs!37114 m!1194357))

(declare-fun m!1194509 () Bool)

(assert (=> bs!37114 m!1194509))

(assert (=> b!1303668 d!141663))

(assert (=> b!1303668 d!141643))

(declare-fun b!1303908 () Bool)

(declare-fun e!743756 () Bool)

(assert (=> b!1303908 (= e!743756 tp_is_empty!34909)))

(declare-fun mapNonEmpty!53966 () Bool)

(declare-fun mapRes!53966 () Bool)

(declare-fun tp!102975 () Bool)

(declare-fun e!743755 () Bool)

(assert (=> mapNonEmpty!53966 (= mapRes!53966 (and tp!102975 e!743755))))

(declare-fun mapValue!53966 () ValueCell!16556)

(declare-fun mapKey!53966 () (_ BitVec 32))

(declare-fun mapRest!53966 () (Array (_ BitVec 32) ValueCell!16556))

(assert (=> mapNonEmpty!53966 (= mapRest!53965 (store mapRest!53966 mapKey!53966 mapValue!53966))))

(declare-fun b!1303907 () Bool)

(assert (=> b!1303907 (= e!743755 tp_is_empty!34909)))

(declare-fun condMapEmpty!53966 () Bool)

(declare-fun mapDefault!53966 () ValueCell!16556)

(assert (=> mapNonEmpty!53965 (= condMapEmpty!53966 (= mapRest!53965 ((as const (Array (_ BitVec 32) ValueCell!16556)) mapDefault!53966)))))

(assert (=> mapNonEmpty!53965 (= tp!102974 (and e!743756 mapRes!53966))))

(declare-fun mapIsEmpty!53966 () Bool)

(assert (=> mapIsEmpty!53966 mapRes!53966))

(assert (= (and mapNonEmpty!53965 condMapEmpty!53966) mapIsEmpty!53966))

(assert (= (and mapNonEmpty!53965 (not condMapEmpty!53966)) mapNonEmpty!53966))

(assert (= (and mapNonEmpty!53966 ((_ is ValueCellFull!16556) mapValue!53966)) b!1303907))

(assert (= (and mapNonEmpty!53965 ((_ is ValueCellFull!16556) mapDefault!53966)) b!1303908))

(declare-fun m!1194511 () Bool)

(assert (=> mapNonEmpty!53966 m!1194511))

(declare-fun b_lambda!23281 () Bool)

(assert (= b_lambda!23277 (or (and start!110070 b_free!29269) b_lambda!23281)))

(declare-fun b_lambda!23283 () Bool)

(assert (= b_lambda!23279 (or (and start!110070 b_free!29269) b_lambda!23283)))

(check-sat (not d!141649) (not d!141587) (not d!141599) (not d!141663) (not d!141595) b_and!47429 (not b!1303864) (not b!1303833) (not b_next!29269) (not b!1303790) (not d!141655) (not d!141571) (not b!1303894) (not b!1303878) tp_is_empty!34909 (not d!141627) (not b!1303770) (not b!1303872) (not d!141577) (not b_lambda!23281) (not b!1303803) (not b!1303877) (not d!141581) (not b!1303812) (not b!1303781) (not b!1303862) (not b!1303800) (not b!1303782) (not b!1303871) (not d!141607) (not b_lambda!23275) (not b_lambda!23271) (not mapNonEmpty!53966) (not d!141661) (not b!1303832) (not b!1303883) (not b!1303839) (not b!1303804) (not d!141637) (not d!141575) (not b!1303892) (not d!141561) (not b!1303906) (not d!141621) (not d!141573) (not d!141567) (not b_lambda!23273) (not bm!64217) (not d!141589) (not b!1303810) (not bm!64216) (not d!141625) (not d!141641) (not d!141583) (not b!1303796) (not b!1303799) (not b!1303821) (not b!1303824) (not b!1303787) (not b!1303815) (not b!1303791) (not b!1303834) (not d!141593) (not b!1303880) (not b!1303813) (not d!141579) (not d!141647) (not b!1303893) (not b!1303785) (not b!1303904) (not d!141631) (not d!141591) (not b!1303794) (not b!1303899) (not d!141601) (not d!141639) (not d!141657) (not b!1303786) (not d!141585) (not b!1303865) (not b_lambda!23283) (not d!141659) (not d!141569) (not d!141597) (not b!1303802) (not b!1303897) (not d!141651) (not b!1303808) (not b!1303789) (not d!141645) (not b!1303896) (not bm!64215) (not b!1303783) (not d!141565) (not b!1303879) (not b!1303845) (not b!1303835) (not b!1303822) (not d!141563) (not b!1303902) (not b!1303868) (not b!1303898) (not b!1303826) (not d!141617) (not b!1303874) (not b!1303867) (not d!141605) (not d!141557) (not b!1303882) (not b!1303805) (not b!1303792) (not d!141613) (not d!141633) (not b!1303881))
(check-sat b_and!47429 (not b_next!29269))
