; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110352 () Bool)

(assert start!110352)

(declare-fun b_free!29275 () Bool)

(declare-fun b_next!29275 () Bool)

(assert (=> start!110352 (= b_free!29275 (not b_next!29275))))

(declare-fun tp!102980 () Bool)

(declare-fun b_and!47451 () Bool)

(assert (=> start!110352 (= tp!102980 b_and!47451)))

(declare-fun mapNonEmpty!53969 () Bool)

(declare-fun mapRes!53969 () Bool)

(declare-fun tp!102979 () Bool)

(declare-fun e!744646 () Bool)

(assert (=> mapNonEmpty!53969 (= mapRes!53969 (and tp!102979 e!744646))))

(declare-fun mapKey!53969 () (_ BitVec 32))

(declare-datatypes ((V!51657 0))(
  ( (V!51658 (val!17532 Int)) )
))
(declare-datatypes ((ValueCell!16559 0))(
  ( (ValueCellFull!16559 (v!20145 V!51657)) (EmptyCell!16559) )
))
(declare-fun mapValue!53969 () ValueCell!16559)

(declare-datatypes ((array!86885 0))(
  ( (array!86886 (arr!41928 (Array (_ BitVec 32) ValueCell!16559)) (size!42479 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86885)

(declare-fun mapRest!53969 () (Array (_ BitVec 32) ValueCell!16559))

(assert (=> mapNonEmpty!53969 (= (arr!41928 _values!1445) (store mapRest!53969 mapKey!53969 mapValue!53969))))

(declare-fun res!866569 () Bool)

(declare-fun e!744648 () Bool)

(assert (=> start!110352 (=> (not res!866569) (not e!744648))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110352 (= res!866569 (validMask!0 mask!2175))))

(assert (=> start!110352 e!744648))

(declare-fun tp_is_empty!34915 () Bool)

(assert (=> start!110352 tp_is_empty!34915))

(assert (=> start!110352 true))

(declare-fun e!744649 () Bool)

(declare-fun array_inv!31961 (array!86885) Bool)

(assert (=> start!110352 (and (array_inv!31961 _values!1445) e!744649)))

(declare-datatypes ((array!86887 0))(
  ( (array!86888 (arr!41929 (Array (_ BitVec 32) (_ BitVec 64))) (size!42480 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86887)

(declare-fun array_inv!31962 (array!86887) Bool)

(assert (=> start!110352 (array_inv!31962 _keys!1741)))

(assert (=> start!110352 tp!102980))

(declare-fun b!1305302 () Bool)

(declare-fun e!744650 () Bool)

(assert (=> b!1305302 (= e!744648 (not e!744650))))

(declare-fun res!866568 () Bool)

(assert (=> b!1305302 (=> res!866568 e!744650)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305302 (= res!866568 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22650 0))(
  ( (tuple2!22651 (_1!11336 (_ BitVec 64)) (_2!11336 V!51657)) )
))
(declare-datatypes ((List!29797 0))(
  ( (Nil!29794) (Cons!29793 (h!31011 tuple2!22650) (t!43385 List!29797)) )
))
(declare-datatypes ((ListLongMap!20315 0))(
  ( (ListLongMap!20316 (toList!10173 List!29797)) )
))
(declare-fun contains!8323 (ListLongMap!20315 (_ BitVec 64)) Bool)

(assert (=> b!1305302 (not (contains!8323 (ListLongMap!20316 Nil!29794) k0!1205))))

(declare-datatypes ((Unit!43150 0))(
  ( (Unit!43151) )
))
(declare-fun lt!584072 () Unit!43150)

(declare-fun emptyContainsNothing!224 ((_ BitVec 64)) Unit!43150)

(assert (=> b!1305302 (= lt!584072 (emptyContainsNothing!224 k0!1205))))

(declare-fun b!1305303 () Bool)

(declare-fun res!866574 () Bool)

(assert (=> b!1305303 (=> (not res!866574) (not e!744648))))

(declare-datatypes ((List!29798 0))(
  ( (Nil!29795) (Cons!29794 (h!31012 (_ BitVec 64)) (t!43386 List!29798)) )
))
(declare-fun arrayNoDuplicates!0 (array!86887 (_ BitVec 32) List!29798) Bool)

(assert (=> b!1305303 (= res!866574 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29795))))

(declare-fun b!1305304 () Bool)

(assert (=> b!1305304 (= e!744646 tp_is_empty!34915)))

(declare-fun b!1305305 () Bool)

(assert (=> b!1305305 (= e!744650 false)))

(declare-fun lt!584073 () ListLongMap!20315)

(declare-fun zeroValue!1387 () V!51657)

(declare-fun +!4531 (ListLongMap!20315 tuple2!22650) ListLongMap!20315)

(assert (=> b!1305305 (not (contains!8323 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!584071 () Unit!43150)

(declare-fun addStillNotContains!482 (ListLongMap!20315 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43150)

(assert (=> b!1305305 (= lt!584071 (addStillNotContains!482 lt!584073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51657)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6170 (array!86887 array!86885 (_ BitVec 32) (_ BitVec 32) V!51657 V!51657 (_ BitVec 32) Int) ListLongMap!20315)

(assert (=> b!1305305 (= lt!584073 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305306 () Bool)

(declare-fun res!866571 () Bool)

(assert (=> b!1305306 (=> (not res!866571) (not e!744648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86887 (_ BitVec 32)) Bool)

(assert (=> b!1305306 (= res!866571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1305307 () Bool)

(declare-fun res!866575 () Bool)

(assert (=> b!1305307 (=> (not res!866575) (not e!744648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305307 (= res!866575 (not (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53969 () Bool)

(assert (=> mapIsEmpty!53969 mapRes!53969))

(declare-fun b!1305308 () Bool)

(declare-fun e!744647 () Bool)

(assert (=> b!1305308 (= e!744647 tp_is_empty!34915)))

(declare-fun b!1305309 () Bool)

(declare-fun res!866572 () Bool)

(assert (=> b!1305309 (=> (not res!866572) (not e!744648))))

(assert (=> b!1305309 (= res!866572 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42480 _keys!1741))))))

(declare-fun b!1305310 () Bool)

(declare-fun res!866570 () Bool)

(assert (=> b!1305310 (=> (not res!866570) (not e!744648))))

(assert (=> b!1305310 (= res!866570 (and (= (size!42479 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42480 _keys!1741) (size!42479 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305311 () Bool)

(assert (=> b!1305311 (= e!744649 (and e!744647 mapRes!53969))))

(declare-fun condMapEmpty!53969 () Bool)

(declare-fun mapDefault!53969 () ValueCell!16559)

(assert (=> b!1305311 (= condMapEmpty!53969 (= (arr!41928 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16559)) mapDefault!53969)))))

(declare-fun b!1305312 () Bool)

(declare-fun res!866573 () Bool)

(assert (=> b!1305312 (=> (not res!866573) (not e!744648))))

(declare-fun getCurrentListMap!5182 (array!86887 array!86885 (_ BitVec 32) (_ BitVec 32) V!51657 V!51657 (_ BitVec 32) Int) ListLongMap!20315)

(assert (=> b!1305312 (= res!866573 (contains!8323 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305313 () Bool)

(declare-fun res!866567 () Bool)

(assert (=> b!1305313 (=> (not res!866567) (not e!744648))))

(assert (=> b!1305313 (= res!866567 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42480 _keys!1741))))))

(assert (= (and start!110352 res!866569) b!1305310))

(assert (= (and b!1305310 res!866570) b!1305306))

(assert (= (and b!1305306 res!866571) b!1305303))

(assert (= (and b!1305303 res!866574) b!1305313))

(assert (= (and b!1305313 res!866567) b!1305312))

(assert (= (and b!1305312 res!866573) b!1305309))

(assert (= (and b!1305309 res!866572) b!1305307))

(assert (= (and b!1305307 res!866575) b!1305302))

(assert (= (and b!1305302 (not res!866568)) b!1305305))

(assert (= (and b!1305311 condMapEmpty!53969) mapIsEmpty!53969))

(assert (= (and b!1305311 (not condMapEmpty!53969)) mapNonEmpty!53969))

(get-info :version)

(assert (= (and mapNonEmpty!53969 ((_ is ValueCellFull!16559) mapValue!53969)) b!1305304))

(assert (= (and b!1305311 ((_ is ValueCellFull!16559) mapDefault!53969)) b!1305308))

(assert (= start!110352 b!1305311))

(declare-fun m!1196627 () Bool)

(assert (=> b!1305312 m!1196627))

(assert (=> b!1305312 m!1196627))

(declare-fun m!1196629 () Bool)

(assert (=> b!1305312 m!1196629))

(declare-fun m!1196631 () Bool)

(assert (=> b!1305306 m!1196631))

(declare-fun m!1196633 () Bool)

(assert (=> mapNonEmpty!53969 m!1196633))

(declare-fun m!1196635 () Bool)

(assert (=> b!1305305 m!1196635))

(assert (=> b!1305305 m!1196635))

(declare-fun m!1196637 () Bool)

(assert (=> b!1305305 m!1196637))

(declare-fun m!1196639 () Bool)

(assert (=> b!1305305 m!1196639))

(declare-fun m!1196641 () Bool)

(assert (=> b!1305305 m!1196641))

(declare-fun m!1196643 () Bool)

(assert (=> b!1305307 m!1196643))

(assert (=> b!1305307 m!1196643))

(declare-fun m!1196645 () Bool)

(assert (=> b!1305307 m!1196645))

(declare-fun m!1196647 () Bool)

(assert (=> b!1305303 m!1196647))

(declare-fun m!1196649 () Bool)

(assert (=> start!110352 m!1196649))

(declare-fun m!1196651 () Bool)

(assert (=> start!110352 m!1196651))

(declare-fun m!1196653 () Bool)

(assert (=> start!110352 m!1196653))

(declare-fun m!1196655 () Bool)

(assert (=> b!1305302 m!1196655))

(declare-fun m!1196657 () Bool)

(assert (=> b!1305302 m!1196657))

(check-sat (not b!1305302) (not b!1305307) (not b_next!29275) (not b!1305303) (not b!1305306) (not mapNonEmpty!53969) tp_is_empty!34915 b_and!47451 (not b!1305312) (not b!1305305) (not start!110352))
(check-sat b_and!47451 (not b_next!29275))
(get-model)

(declare-fun d!142227 () Bool)

(assert (=> d!142227 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110352 d!142227))

(declare-fun d!142229 () Bool)

(assert (=> d!142229 (= (array_inv!31961 _values!1445) (bvsge (size!42479 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110352 d!142229))

(declare-fun d!142231 () Bool)

(assert (=> d!142231 (= (array_inv!31962 _keys!1741) (bvsge (size!42480 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110352 d!142231))

(declare-fun b!1305396 () Bool)

(declare-fun e!744696 () Bool)

(declare-fun contains!8326 (List!29798 (_ BitVec 64)) Bool)

(assert (=> b!1305396 (= e!744696 (contains!8326 Nil!29795 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142233 () Bool)

(declare-fun res!866637 () Bool)

(declare-fun e!744698 () Bool)

(assert (=> d!142233 (=> res!866637 e!744698)))

(assert (=> d!142233 (= res!866637 (bvsge #b00000000000000000000000000000000 (size!42480 _keys!1741)))))

(assert (=> d!142233 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29795) e!744698)))

(declare-fun b!1305397 () Bool)

(declare-fun e!744697 () Bool)

(assert (=> b!1305397 (= e!744698 e!744697)))

(declare-fun res!866638 () Bool)

(assert (=> b!1305397 (=> (not res!866638) (not e!744697))))

(assert (=> b!1305397 (= res!866638 (not e!744696))))

(declare-fun res!866636 () Bool)

(assert (=> b!1305397 (=> (not res!866636) (not e!744696))))

(assert (=> b!1305397 (= res!866636 (validKeyInArray!0 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305398 () Bool)

(declare-fun e!744695 () Bool)

(declare-fun call!64307 () Bool)

(assert (=> b!1305398 (= e!744695 call!64307)))

(declare-fun b!1305399 () Bool)

(assert (=> b!1305399 (= e!744697 e!744695)))

(declare-fun c!125582 () Bool)

(assert (=> b!1305399 (= c!125582 (validKeyInArray!0 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64304 () Bool)

(assert (=> bm!64304 (= call!64307 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125582 (Cons!29794 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000) Nil!29795) Nil!29795)))))

(declare-fun b!1305400 () Bool)

(assert (=> b!1305400 (= e!744695 call!64307)))

(assert (= (and d!142233 (not res!866637)) b!1305397))

(assert (= (and b!1305397 res!866636) b!1305396))

(assert (= (and b!1305397 res!866638) b!1305399))

(assert (= (and b!1305399 c!125582) b!1305400))

(assert (= (and b!1305399 (not c!125582)) b!1305398))

(assert (= (or b!1305400 b!1305398) bm!64304))

(declare-fun m!1196723 () Bool)

(assert (=> b!1305396 m!1196723))

(assert (=> b!1305396 m!1196723))

(declare-fun m!1196725 () Bool)

(assert (=> b!1305396 m!1196725))

(assert (=> b!1305397 m!1196723))

(assert (=> b!1305397 m!1196723))

(declare-fun m!1196727 () Bool)

(assert (=> b!1305397 m!1196727))

(assert (=> b!1305399 m!1196723))

(assert (=> b!1305399 m!1196723))

(assert (=> b!1305399 m!1196727))

(assert (=> bm!64304 m!1196723))

(declare-fun m!1196729 () Bool)

(assert (=> bm!64304 m!1196729))

(assert (=> b!1305303 d!142233))

(declare-fun d!142235 () Bool)

(declare-fun e!744703 () Bool)

(assert (=> d!142235 e!744703))

(declare-fun res!866641 () Bool)

(assert (=> d!142235 (=> res!866641 e!744703)))

(declare-fun lt!584103 () Bool)

(assert (=> d!142235 (= res!866641 (not lt!584103))))

(declare-fun lt!584101 () Bool)

(assert (=> d!142235 (= lt!584103 lt!584101)))

(declare-fun lt!584102 () Unit!43150)

(declare-fun e!744704 () Unit!43150)

(assert (=> d!142235 (= lt!584102 e!744704)))

(declare-fun c!125585 () Bool)

(assert (=> d!142235 (= c!125585 lt!584101)))

(declare-fun containsKey!728 (List!29797 (_ BitVec 64)) Bool)

(assert (=> d!142235 (= lt!584101 (containsKey!728 (toList!10173 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142235 (= (contains!8323 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584103)))

(declare-fun b!1305407 () Bool)

(declare-fun lt!584100 () Unit!43150)

(assert (=> b!1305407 (= e!744704 lt!584100)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!474 (List!29797 (_ BitVec 64)) Unit!43150)

(assert (=> b!1305407 (= lt!584100 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10173 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!753 0))(
  ( (Some!752 (v!20148 V!51657)) (None!751) )
))
(declare-fun isDefined!511 (Option!753) Bool)

(declare-fun getValueByKey!702 (List!29797 (_ BitVec 64)) Option!753)

(assert (=> b!1305407 (isDefined!511 (getValueByKey!702 (toList!10173 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305408 () Bool)

(declare-fun Unit!43156 () Unit!43150)

(assert (=> b!1305408 (= e!744704 Unit!43156)))

(declare-fun b!1305409 () Bool)

(assert (=> b!1305409 (= e!744703 (isDefined!511 (getValueByKey!702 (toList!10173 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142235 c!125585) b!1305407))

(assert (= (and d!142235 (not c!125585)) b!1305408))

(assert (= (and d!142235 (not res!866641)) b!1305409))

(declare-fun m!1196731 () Bool)

(assert (=> d!142235 m!1196731))

(declare-fun m!1196733 () Bool)

(assert (=> b!1305407 m!1196733))

(declare-fun m!1196735 () Bool)

(assert (=> b!1305407 m!1196735))

(assert (=> b!1305407 m!1196735))

(declare-fun m!1196737 () Bool)

(assert (=> b!1305407 m!1196737))

(assert (=> b!1305409 m!1196735))

(assert (=> b!1305409 m!1196735))

(assert (=> b!1305409 m!1196737))

(assert (=> b!1305312 d!142235))

(declare-fun b!1305452 () Bool)

(declare-fun e!744739 () ListLongMap!20315)

(declare-fun call!64328 () ListLongMap!20315)

(assert (=> b!1305452 (= e!744739 call!64328)))

(declare-fun b!1305453 () Bool)

(declare-fun e!744735 () ListLongMap!20315)

(declare-fun call!64325 () ListLongMap!20315)

(assert (=> b!1305453 (= e!744735 call!64325)))

(declare-fun b!1305454 () Bool)

(declare-fun e!744733 () Bool)

(assert (=> b!1305454 (= e!744733 (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144)))))

(declare-fun b!1305455 () Bool)

(declare-fun e!744743 () Bool)

(declare-fun e!744740 () Bool)

(assert (=> b!1305455 (= e!744743 e!744740)))

(declare-fun res!866662 () Bool)

(declare-fun call!64324 () Bool)

(assert (=> b!1305455 (= res!866662 call!64324)))

(assert (=> b!1305455 (=> (not res!866662) (not e!744740))))

(declare-fun call!64327 () ListLongMap!20315)

(declare-fun bm!64319 () Bool)

(declare-fun c!125598 () Bool)

(declare-fun call!64322 () ListLongMap!20315)

(declare-fun call!64326 () ListLongMap!20315)

(declare-fun c!125601 () Bool)

(assert (=> bm!64319 (= call!64326 (+!4531 (ite c!125598 call!64327 (ite c!125601 call!64322 call!64325)) (ite (or c!125598 c!125601) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64320 () Bool)

(assert (=> bm!64320 (= call!64325 call!64322)))

(declare-fun b!1305456 () Bool)

(declare-fun e!744732 () ListLongMap!20315)

(assert (=> b!1305456 (= e!744732 e!744739)))

(assert (=> b!1305456 (= c!125601 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305457 () Bool)

(declare-fun res!866668 () Bool)

(declare-fun e!744742 () Bool)

(assert (=> b!1305457 (=> (not res!866668) (not e!744742))))

(assert (=> b!1305457 (= res!866668 e!744743)))

(declare-fun c!125600 () Bool)

(assert (=> b!1305457 (= c!125600 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1305458 () Bool)

(assert (=> b!1305458 (= e!744743 (not call!64324))))

(declare-fun bm!64321 () Bool)

(assert (=> bm!64321 (= call!64322 call!64327)))

(declare-fun b!1305459 () Bool)

(declare-fun e!744734 () Bool)

(declare-fun e!744738 () Bool)

(assert (=> b!1305459 (= e!744734 e!744738)))

(declare-fun res!866661 () Bool)

(declare-fun call!64323 () Bool)

(assert (=> b!1305459 (= res!866661 call!64323)))

(assert (=> b!1305459 (=> (not res!866661) (not e!744738))))

(declare-fun bm!64322 () Bool)

(declare-fun lt!584168 () ListLongMap!20315)

(assert (=> bm!64322 (= call!64323 (contains!8323 lt!584168 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305460 () Bool)

(declare-fun apply!1032 (ListLongMap!20315 (_ BitVec 64)) V!51657)

(assert (=> b!1305460 (= e!744738 (= (apply!1032 lt!584168 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1305461 () Bool)

(declare-fun e!744731 () Unit!43150)

(declare-fun lt!584154 () Unit!43150)

(assert (=> b!1305461 (= e!744731 lt!584154)))

(declare-fun lt!584155 () ListLongMap!20315)

(assert (=> b!1305461 (= lt!584155 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584150 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584158 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584158 (select (arr!41929 _keys!1741) from!2144))))

(declare-fun lt!584167 () Unit!43150)

(declare-fun addStillContains!1119 (ListLongMap!20315 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43150)

(assert (=> b!1305461 (= lt!584167 (addStillContains!1119 lt!584155 lt!584150 zeroValue!1387 lt!584158))))

(assert (=> b!1305461 (contains!8323 (+!4531 lt!584155 (tuple2!22651 lt!584150 zeroValue!1387)) lt!584158)))

(declare-fun lt!584162 () Unit!43150)

(assert (=> b!1305461 (= lt!584162 lt!584167)))

(declare-fun lt!584160 () ListLongMap!20315)

(assert (=> b!1305461 (= lt!584160 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584164 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584164 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584151 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584151 (select (arr!41929 _keys!1741) from!2144))))

(declare-fun lt!584166 () Unit!43150)

(declare-fun addApplyDifferent!561 (ListLongMap!20315 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43150)

(assert (=> b!1305461 (= lt!584166 (addApplyDifferent!561 lt!584160 lt!584164 minValue!1387 lt!584151))))

(assert (=> b!1305461 (= (apply!1032 (+!4531 lt!584160 (tuple2!22651 lt!584164 minValue!1387)) lt!584151) (apply!1032 lt!584160 lt!584151))))

(declare-fun lt!584165 () Unit!43150)

(assert (=> b!1305461 (= lt!584165 lt!584166)))

(declare-fun lt!584156 () ListLongMap!20315)

(assert (=> b!1305461 (= lt!584156 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584169 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584149 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584149 (select (arr!41929 _keys!1741) from!2144))))

(declare-fun lt!584152 () Unit!43150)

(assert (=> b!1305461 (= lt!584152 (addApplyDifferent!561 lt!584156 lt!584169 zeroValue!1387 lt!584149))))

(assert (=> b!1305461 (= (apply!1032 (+!4531 lt!584156 (tuple2!22651 lt!584169 zeroValue!1387)) lt!584149) (apply!1032 lt!584156 lt!584149))))

(declare-fun lt!584157 () Unit!43150)

(assert (=> b!1305461 (= lt!584157 lt!584152)))

(declare-fun lt!584163 () ListLongMap!20315)

(assert (=> b!1305461 (= lt!584163 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584153 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584159 () (_ BitVec 64))

(assert (=> b!1305461 (= lt!584159 (select (arr!41929 _keys!1741) from!2144))))

(assert (=> b!1305461 (= lt!584154 (addApplyDifferent!561 lt!584163 lt!584153 minValue!1387 lt!584159))))

(assert (=> b!1305461 (= (apply!1032 (+!4531 lt!584163 (tuple2!22651 lt!584153 minValue!1387)) lt!584159) (apply!1032 lt!584163 lt!584159))))

(declare-fun b!1305462 () Bool)

(declare-fun c!125602 () Bool)

(assert (=> b!1305462 (= c!125602 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1305462 (= e!744739 e!744735)))

(declare-fun d!142237 () Bool)

(assert (=> d!142237 e!744742))

(declare-fun res!866665 () Bool)

(assert (=> d!142237 (=> (not res!866665) (not e!744742))))

(assert (=> d!142237 (= res!866665 (or (bvsge from!2144 (size!42480 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42480 _keys!1741)))))))

(declare-fun lt!584148 () ListLongMap!20315)

(assert (=> d!142237 (= lt!584168 lt!584148)))

(declare-fun lt!584161 () Unit!43150)

(assert (=> d!142237 (= lt!584161 e!744731)))

(declare-fun c!125603 () Bool)

(declare-fun e!744737 () Bool)

(assert (=> d!142237 (= c!125603 e!744737)))

(declare-fun res!866660 () Bool)

(assert (=> d!142237 (=> (not res!866660) (not e!744737))))

(assert (=> d!142237 (= res!866660 (bvslt from!2144 (size!42480 _keys!1741)))))

(assert (=> d!142237 (= lt!584148 e!744732)))

(assert (=> d!142237 (= c!125598 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142237 (validMask!0 mask!2175)))

(assert (=> d!142237 (= (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584168)))

(declare-fun b!1305463 () Bool)

(assert (=> b!1305463 (= e!744735 call!64328)))

(declare-fun bm!64323 () Bool)

(assert (=> bm!64323 (= call!64327 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305464 () Bool)

(assert (=> b!1305464 (= e!744742 e!744734)))

(declare-fun c!125599 () Bool)

(assert (=> b!1305464 (= c!125599 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305465 () Bool)

(declare-fun e!744741 () Bool)

(declare-fun e!744736 () Bool)

(assert (=> b!1305465 (= e!744741 e!744736)))

(declare-fun res!866667 () Bool)

(assert (=> b!1305465 (=> (not res!866667) (not e!744736))))

(assert (=> b!1305465 (= res!866667 (contains!8323 lt!584168 (select (arr!41929 _keys!1741) from!2144)))))

(assert (=> b!1305465 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42480 _keys!1741)))))

(declare-fun b!1305466 () Bool)

(assert (=> b!1305466 (= e!744737 (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144)))))

(declare-fun b!1305467 () Bool)

(declare-fun res!866666 () Bool)

(assert (=> b!1305467 (=> (not res!866666) (not e!744742))))

(assert (=> b!1305467 (= res!866666 e!744741)))

(declare-fun res!866663 () Bool)

(assert (=> b!1305467 (=> res!866663 e!744741)))

(assert (=> b!1305467 (= res!866663 (not e!744733))))

(declare-fun res!866664 () Bool)

(assert (=> b!1305467 (=> (not res!866664) (not e!744733))))

(assert (=> b!1305467 (= res!866664 (bvslt from!2144 (size!42480 _keys!1741)))))

(declare-fun b!1305468 () Bool)

(assert (=> b!1305468 (= e!744740 (= (apply!1032 lt!584168 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1305469 () Bool)

(assert (=> b!1305469 (= e!744734 (not call!64323))))

(declare-fun b!1305470 () Bool)

(assert (=> b!1305470 (= e!744732 (+!4531 call!64326 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305471 () Bool)

(declare-fun Unit!43157 () Unit!43150)

(assert (=> b!1305471 (= e!744731 Unit!43157)))

(declare-fun bm!64324 () Bool)

(assert (=> bm!64324 (= call!64324 (contains!8323 lt!584168 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64325 () Bool)

(assert (=> bm!64325 (= call!64328 call!64326)))

(declare-fun b!1305472 () Bool)

(declare-fun get!21223 (ValueCell!16559 V!51657) V!51657)

(declare-fun dynLambda!3493 (Int (_ BitVec 64)) V!51657)

(assert (=> b!1305472 (= e!744736 (= (apply!1032 lt!584168 (select (arr!41929 _keys!1741) from!2144)) (get!21223 (select (arr!41928 _values!1445) from!2144) (dynLambda!3493 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305472 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42479 _values!1445)))))

(assert (=> b!1305472 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42480 _keys!1741)))))

(assert (= (and d!142237 c!125598) b!1305470))

(assert (= (and d!142237 (not c!125598)) b!1305456))

(assert (= (and b!1305456 c!125601) b!1305452))

(assert (= (and b!1305456 (not c!125601)) b!1305462))

(assert (= (and b!1305462 c!125602) b!1305463))

(assert (= (and b!1305462 (not c!125602)) b!1305453))

(assert (= (or b!1305463 b!1305453) bm!64320))

(assert (= (or b!1305452 bm!64320) bm!64321))

(assert (= (or b!1305452 b!1305463) bm!64325))

(assert (= (or b!1305470 bm!64321) bm!64323))

(assert (= (or b!1305470 bm!64325) bm!64319))

(assert (= (and d!142237 res!866660) b!1305466))

(assert (= (and d!142237 c!125603) b!1305461))

(assert (= (and d!142237 (not c!125603)) b!1305471))

(assert (= (and d!142237 res!866665) b!1305467))

(assert (= (and b!1305467 res!866664) b!1305454))

(assert (= (and b!1305467 (not res!866663)) b!1305465))

(assert (= (and b!1305465 res!866667) b!1305472))

(assert (= (and b!1305467 res!866666) b!1305457))

(assert (= (and b!1305457 c!125600) b!1305455))

(assert (= (and b!1305457 (not c!125600)) b!1305458))

(assert (= (and b!1305455 res!866662) b!1305468))

(assert (= (or b!1305455 b!1305458) bm!64324))

(assert (= (and b!1305457 res!866668) b!1305464))

(assert (= (and b!1305464 c!125599) b!1305459))

(assert (= (and b!1305464 (not c!125599)) b!1305469))

(assert (= (and b!1305459 res!866661) b!1305460))

(assert (= (or b!1305459 b!1305469) bm!64322))

(declare-fun b_lambda!23289 () Bool)

(assert (=> (not b_lambda!23289) (not b!1305472)))

(declare-fun t!43391 () Bool)

(declare-fun tb!11393 () Bool)

(assert (=> (and start!110352 (= defaultEntry!1448 defaultEntry!1448) t!43391) tb!11393))

(declare-fun result!23817 () Bool)

(assert (=> tb!11393 (= result!23817 tp_is_empty!34915)))

(assert (=> b!1305472 t!43391))

(declare-fun b_and!47457 () Bool)

(assert (= b_and!47451 (and (=> t!43391 result!23817) b_and!47457)))

(assert (=> b!1305466 m!1196643))

(assert (=> b!1305466 m!1196643))

(assert (=> b!1305466 m!1196645))

(declare-fun m!1196739 () Bool)

(assert (=> b!1305461 m!1196739))

(declare-fun m!1196741 () Bool)

(assert (=> b!1305461 m!1196741))

(declare-fun m!1196743 () Bool)

(assert (=> b!1305461 m!1196743))

(declare-fun m!1196745 () Bool)

(assert (=> b!1305461 m!1196745))

(assert (=> b!1305461 m!1196641))

(declare-fun m!1196747 () Bool)

(assert (=> b!1305461 m!1196747))

(declare-fun m!1196749 () Bool)

(assert (=> b!1305461 m!1196749))

(declare-fun m!1196751 () Bool)

(assert (=> b!1305461 m!1196751))

(declare-fun m!1196753 () Bool)

(assert (=> b!1305461 m!1196753))

(assert (=> b!1305461 m!1196753))

(declare-fun m!1196755 () Bool)

(assert (=> b!1305461 m!1196755))

(declare-fun m!1196757 () Bool)

(assert (=> b!1305461 m!1196757))

(declare-fun m!1196759 () Bool)

(assert (=> b!1305461 m!1196759))

(declare-fun m!1196761 () Bool)

(assert (=> b!1305461 m!1196761))

(assert (=> b!1305461 m!1196739))

(declare-fun m!1196763 () Bool)

(assert (=> b!1305461 m!1196763))

(assert (=> b!1305461 m!1196743))

(declare-fun m!1196765 () Bool)

(assert (=> b!1305461 m!1196765))

(assert (=> b!1305461 m!1196763))

(declare-fun m!1196767 () Bool)

(assert (=> b!1305461 m!1196767))

(assert (=> b!1305461 m!1196643))

(declare-fun m!1196769 () Bool)

(assert (=> b!1305460 m!1196769))

(assert (=> d!142237 m!1196649))

(assert (=> bm!64323 m!1196641))

(declare-fun m!1196771 () Bool)

(assert (=> bm!64319 m!1196771))

(declare-fun m!1196773 () Bool)

(assert (=> b!1305468 m!1196773))

(assert (=> b!1305454 m!1196643))

(assert (=> b!1305454 m!1196643))

(assert (=> b!1305454 m!1196645))

(declare-fun m!1196775 () Bool)

(assert (=> bm!64322 m!1196775))

(declare-fun m!1196777 () Bool)

(assert (=> bm!64324 m!1196777))

(assert (=> b!1305465 m!1196643))

(assert (=> b!1305465 m!1196643))

(declare-fun m!1196779 () Bool)

(assert (=> b!1305465 m!1196779))

(declare-fun m!1196781 () Bool)

(assert (=> b!1305472 m!1196781))

(declare-fun m!1196783 () Bool)

(assert (=> b!1305472 m!1196783))

(declare-fun m!1196785 () Bool)

(assert (=> b!1305472 m!1196785))

(assert (=> b!1305472 m!1196643))

(declare-fun m!1196787 () Bool)

(assert (=> b!1305472 m!1196787))

(assert (=> b!1305472 m!1196781))

(assert (=> b!1305472 m!1196643))

(assert (=> b!1305472 m!1196783))

(declare-fun m!1196789 () Bool)

(assert (=> b!1305470 m!1196789))

(assert (=> b!1305312 d!142237))

(declare-fun d!142239 () Bool)

(declare-fun e!744744 () Bool)

(assert (=> d!142239 e!744744))

(declare-fun res!866669 () Bool)

(assert (=> d!142239 (=> res!866669 e!744744)))

(declare-fun lt!584173 () Bool)

(assert (=> d!142239 (= res!866669 (not lt!584173))))

(declare-fun lt!584171 () Bool)

(assert (=> d!142239 (= lt!584173 lt!584171)))

(declare-fun lt!584172 () Unit!43150)

(declare-fun e!744745 () Unit!43150)

(assert (=> d!142239 (= lt!584172 e!744745)))

(declare-fun c!125604 () Bool)

(assert (=> d!142239 (= c!125604 lt!584171)))

(assert (=> d!142239 (= lt!584171 (containsKey!728 (toList!10173 (ListLongMap!20316 Nil!29794)) k0!1205))))

(assert (=> d!142239 (= (contains!8323 (ListLongMap!20316 Nil!29794) k0!1205) lt!584173)))

(declare-fun b!1305475 () Bool)

(declare-fun lt!584170 () Unit!43150)

(assert (=> b!1305475 (= e!744745 lt!584170)))

(assert (=> b!1305475 (= lt!584170 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10173 (ListLongMap!20316 Nil!29794)) k0!1205))))

(assert (=> b!1305475 (isDefined!511 (getValueByKey!702 (toList!10173 (ListLongMap!20316 Nil!29794)) k0!1205))))

(declare-fun b!1305476 () Bool)

(declare-fun Unit!43158 () Unit!43150)

(assert (=> b!1305476 (= e!744745 Unit!43158)))

(declare-fun b!1305477 () Bool)

(assert (=> b!1305477 (= e!744744 (isDefined!511 (getValueByKey!702 (toList!10173 (ListLongMap!20316 Nil!29794)) k0!1205)))))

(assert (= (and d!142239 c!125604) b!1305475))

(assert (= (and d!142239 (not c!125604)) b!1305476))

(assert (= (and d!142239 (not res!866669)) b!1305477))

(declare-fun m!1196791 () Bool)

(assert (=> d!142239 m!1196791))

(declare-fun m!1196793 () Bool)

(assert (=> b!1305475 m!1196793))

(declare-fun m!1196795 () Bool)

(assert (=> b!1305475 m!1196795))

(assert (=> b!1305475 m!1196795))

(declare-fun m!1196797 () Bool)

(assert (=> b!1305475 m!1196797))

(assert (=> b!1305477 m!1196795))

(assert (=> b!1305477 m!1196795))

(assert (=> b!1305477 m!1196797))

(assert (=> b!1305302 d!142239))

(declare-fun d!142241 () Bool)

(assert (=> d!142241 (not (contains!8323 (ListLongMap!20316 Nil!29794) k0!1205))))

(declare-fun lt!584176 () Unit!43150)

(declare-fun choose!1929 ((_ BitVec 64)) Unit!43150)

(assert (=> d!142241 (= lt!584176 (choose!1929 k0!1205))))

(assert (=> d!142241 (= (emptyContainsNothing!224 k0!1205) lt!584176)))

(declare-fun bs!37161 () Bool)

(assert (= bs!37161 d!142241))

(assert (=> bs!37161 m!1196655))

(declare-fun m!1196799 () Bool)

(assert (=> bs!37161 m!1196799))

(assert (=> b!1305302 d!142241))

(declare-fun d!142243 () Bool)

(assert (=> d!142243 (= (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144)) (and (not (= (select (arr!41929 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41929 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305307 d!142243))

(declare-fun d!142245 () Bool)

(declare-fun res!866674 () Bool)

(declare-fun e!744753 () Bool)

(assert (=> d!142245 (=> res!866674 e!744753)))

(assert (=> d!142245 (= res!866674 (bvsge #b00000000000000000000000000000000 (size!42480 _keys!1741)))))

(assert (=> d!142245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744753)))

(declare-fun b!1305486 () Bool)

(declare-fun e!744752 () Bool)

(declare-fun e!744754 () Bool)

(assert (=> b!1305486 (= e!744752 e!744754)))

(declare-fun lt!584185 () (_ BitVec 64))

(assert (=> b!1305486 (= lt!584185 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584184 () Unit!43150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86887 (_ BitVec 64) (_ BitVec 32)) Unit!43150)

(assert (=> b!1305486 (= lt!584184 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584185 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305486 (arrayContainsKey!0 _keys!1741 lt!584185 #b00000000000000000000000000000000)))

(declare-fun lt!584183 () Unit!43150)

(assert (=> b!1305486 (= lt!584183 lt!584184)))

(declare-fun res!866675 () Bool)

(declare-datatypes ((SeekEntryResult!9982 0))(
  ( (MissingZero!9982 (index!42299 (_ BitVec 32))) (Found!9982 (index!42300 (_ BitVec 32))) (Intermediate!9982 (undefined!10794 Bool) (index!42301 (_ BitVec 32)) (x!115803 (_ BitVec 32))) (Undefined!9982) (MissingVacant!9982 (index!42302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86887 (_ BitVec 32)) SeekEntryResult!9982)

(assert (=> b!1305486 (= res!866675 (= (seekEntryOrOpen!0 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9982 #b00000000000000000000000000000000)))))

(assert (=> b!1305486 (=> (not res!866675) (not e!744754))))

(declare-fun b!1305487 () Bool)

(declare-fun call!64331 () Bool)

(assert (=> b!1305487 (= e!744754 call!64331)))

(declare-fun b!1305488 () Bool)

(assert (=> b!1305488 (= e!744752 call!64331)))

(declare-fun b!1305489 () Bool)

(assert (=> b!1305489 (= e!744753 e!744752)))

(declare-fun c!125607 () Bool)

(assert (=> b!1305489 (= c!125607 (validKeyInArray!0 (select (arr!41929 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64328 () Bool)

(assert (=> bm!64328 (= call!64331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!142245 (not res!866674)) b!1305489))

(assert (= (and b!1305489 c!125607) b!1305486))

(assert (= (and b!1305489 (not c!125607)) b!1305488))

(assert (= (and b!1305486 res!866675) b!1305487))

(assert (= (or b!1305487 b!1305488) bm!64328))

(assert (=> b!1305486 m!1196723))

(declare-fun m!1196801 () Bool)

(assert (=> b!1305486 m!1196801))

(declare-fun m!1196803 () Bool)

(assert (=> b!1305486 m!1196803))

(assert (=> b!1305486 m!1196723))

(declare-fun m!1196805 () Bool)

(assert (=> b!1305486 m!1196805))

(assert (=> b!1305489 m!1196723))

(assert (=> b!1305489 m!1196723))

(assert (=> b!1305489 m!1196727))

(declare-fun m!1196807 () Bool)

(assert (=> bm!64328 m!1196807))

(assert (=> b!1305306 d!142245))

(declare-fun d!142247 () Bool)

(declare-fun e!744755 () Bool)

(assert (=> d!142247 e!744755))

(declare-fun res!866676 () Bool)

(assert (=> d!142247 (=> res!866676 e!744755)))

(declare-fun lt!584189 () Bool)

(assert (=> d!142247 (= res!866676 (not lt!584189))))

(declare-fun lt!584187 () Bool)

(assert (=> d!142247 (= lt!584189 lt!584187)))

(declare-fun lt!584188 () Unit!43150)

(declare-fun e!744756 () Unit!43150)

(assert (=> d!142247 (= lt!584188 e!744756)))

(declare-fun c!125608 () Bool)

(assert (=> d!142247 (= c!125608 lt!584187)))

(assert (=> d!142247 (= lt!584187 (containsKey!728 (toList!10173 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!142247 (= (contains!8323 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!584189)))

(declare-fun b!1305490 () Bool)

(declare-fun lt!584186 () Unit!43150)

(assert (=> b!1305490 (= e!744756 lt!584186)))

(assert (=> b!1305490 (= lt!584186 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10173 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1305490 (isDefined!511 (getValueByKey!702 (toList!10173 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1305491 () Bool)

(declare-fun Unit!43159 () Unit!43150)

(assert (=> b!1305491 (= e!744756 Unit!43159)))

(declare-fun b!1305492 () Bool)

(assert (=> b!1305492 (= e!744755 (isDefined!511 (getValueByKey!702 (toList!10173 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!142247 c!125608) b!1305490))

(assert (= (and d!142247 (not c!125608)) b!1305491))

(assert (= (and d!142247 (not res!866676)) b!1305492))

(declare-fun m!1196809 () Bool)

(assert (=> d!142247 m!1196809))

(declare-fun m!1196811 () Bool)

(assert (=> b!1305490 m!1196811))

(declare-fun m!1196813 () Bool)

(assert (=> b!1305490 m!1196813))

(assert (=> b!1305490 m!1196813))

(declare-fun m!1196815 () Bool)

(assert (=> b!1305490 m!1196815))

(assert (=> b!1305492 m!1196813))

(assert (=> b!1305492 m!1196813))

(assert (=> b!1305492 m!1196815))

(assert (=> b!1305305 d!142247))

(declare-fun d!142249 () Bool)

(declare-fun e!744759 () Bool)

(assert (=> d!142249 e!744759))

(declare-fun res!866681 () Bool)

(assert (=> d!142249 (=> (not res!866681) (not e!744759))))

(declare-fun lt!584200 () ListLongMap!20315)

(assert (=> d!142249 (= res!866681 (contains!8323 lt!584200 (_1!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!584198 () List!29797)

(assert (=> d!142249 (= lt!584200 (ListLongMap!20316 lt!584198))))

(declare-fun lt!584199 () Unit!43150)

(declare-fun lt!584201 () Unit!43150)

(assert (=> d!142249 (= lt!584199 lt!584201)))

(assert (=> d!142249 (= (getValueByKey!702 lt!584198 (_1!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!752 (_2!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!353 (List!29797 (_ BitVec 64) V!51657) Unit!43150)

(assert (=> d!142249 (= lt!584201 (lemmaContainsTupThenGetReturnValue!353 lt!584198 (_1!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!482 (List!29797 (_ BitVec 64) V!51657) List!29797)

(assert (=> d!142249 (= lt!584198 (insertStrictlySorted!482 (toList!10173 lt!584073) (_1!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142249 (= (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!584200)))

(declare-fun b!1305497 () Bool)

(declare-fun res!866682 () Bool)

(assert (=> b!1305497 (=> (not res!866682) (not e!744759))))

(assert (=> b!1305497 (= res!866682 (= (getValueByKey!702 (toList!10173 lt!584200) (_1!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!752 (_2!11336 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1305498 () Bool)

(declare-fun contains!8327 (List!29797 tuple2!22650) Bool)

(assert (=> b!1305498 (= e!744759 (contains!8327 (toList!10173 lt!584200) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!142249 res!866681) b!1305497))

(assert (= (and b!1305497 res!866682) b!1305498))

(declare-fun m!1196817 () Bool)

(assert (=> d!142249 m!1196817))

(declare-fun m!1196819 () Bool)

(assert (=> d!142249 m!1196819))

(declare-fun m!1196821 () Bool)

(assert (=> d!142249 m!1196821))

(declare-fun m!1196823 () Bool)

(assert (=> d!142249 m!1196823))

(declare-fun m!1196825 () Bool)

(assert (=> b!1305497 m!1196825))

(declare-fun m!1196827 () Bool)

(assert (=> b!1305498 m!1196827))

(assert (=> b!1305305 d!142249))

(declare-fun d!142251 () Bool)

(assert (=> d!142251 (not (contains!8323 (+!4531 lt!584073 (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!584204 () Unit!43150)

(declare-fun choose!1930 (ListLongMap!20315 (_ BitVec 64) V!51657 (_ BitVec 64)) Unit!43150)

(assert (=> d!142251 (= lt!584204 (choose!1930 lt!584073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!744762 () Bool)

(assert (=> d!142251 e!744762))

(declare-fun res!866685 () Bool)

(assert (=> d!142251 (=> (not res!866685) (not e!744762))))

(assert (=> d!142251 (= res!866685 (not (contains!8323 lt!584073 k0!1205)))))

(assert (=> d!142251 (= (addStillNotContains!482 lt!584073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!584204)))

(declare-fun b!1305502 () Bool)

(assert (=> b!1305502 (= e!744762 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!142251 res!866685) b!1305502))

(assert (=> d!142251 m!1196635))

(assert (=> d!142251 m!1196635))

(assert (=> d!142251 m!1196637))

(declare-fun m!1196829 () Bool)

(assert (=> d!142251 m!1196829))

(declare-fun m!1196831 () Bool)

(assert (=> d!142251 m!1196831))

(assert (=> b!1305305 d!142251))

(declare-fun b!1305527 () Bool)

(declare-fun e!744781 () Bool)

(declare-fun e!744778 () Bool)

(assert (=> b!1305527 (= e!744781 e!744778)))

(assert (=> b!1305527 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42480 _keys!1741)))))

(declare-fun res!866694 () Bool)

(declare-fun lt!584220 () ListLongMap!20315)

(assert (=> b!1305527 (= res!866694 (contains!8323 lt!584220 (select (arr!41929 _keys!1741) from!2144)))))

(assert (=> b!1305527 (=> (not res!866694) (not e!744778))))

(declare-fun b!1305528 () Bool)

(declare-fun e!744777 () Bool)

(assert (=> b!1305528 (= e!744777 (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144)))))

(assert (=> b!1305528 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1305529 () Bool)

(declare-fun e!744780 () Bool)

(assert (=> b!1305529 (= e!744780 e!744781)))

(declare-fun c!125620 () Bool)

(assert (=> b!1305529 (= c!125620 e!744777)))

(declare-fun res!866696 () Bool)

(assert (=> b!1305529 (=> (not res!866696) (not e!744777))))

(assert (=> b!1305529 (= res!866696 (bvslt from!2144 (size!42480 _keys!1741)))))

(declare-fun b!1305530 () Bool)

(declare-fun lt!584223 () Unit!43150)

(declare-fun lt!584222 () Unit!43150)

(assert (=> b!1305530 (= lt!584223 lt!584222)))

(declare-fun lt!584225 () (_ BitVec 64))

(declare-fun lt!584219 () (_ BitVec 64))

(declare-fun lt!584221 () V!51657)

(declare-fun lt!584224 () ListLongMap!20315)

(assert (=> b!1305530 (not (contains!8323 (+!4531 lt!584224 (tuple2!22651 lt!584219 lt!584221)) lt!584225))))

(assert (=> b!1305530 (= lt!584222 (addStillNotContains!482 lt!584224 lt!584219 lt!584221 lt!584225))))

(assert (=> b!1305530 (= lt!584225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1305530 (= lt!584221 (get!21223 (select (arr!41928 _values!1445) from!2144) (dynLambda!3493 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305530 (= lt!584219 (select (arr!41929 _keys!1741) from!2144))))

(declare-fun call!64334 () ListLongMap!20315)

(assert (=> b!1305530 (= lt!584224 call!64334)))

(declare-fun e!744779 () ListLongMap!20315)

(assert (=> b!1305530 (= e!744779 (+!4531 call!64334 (tuple2!22651 (select (arr!41929 _keys!1741) from!2144) (get!21223 (select (arr!41928 _values!1445) from!2144) (dynLambda!3493 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305531 () Bool)

(declare-fun e!744783 () ListLongMap!20315)

(assert (=> b!1305531 (= e!744783 e!744779)))

(declare-fun c!125617 () Bool)

(assert (=> b!1305531 (= c!125617 (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144)))))

(declare-fun b!1305532 () Bool)

(declare-fun e!744782 () Bool)

(declare-fun isEmpty!1069 (ListLongMap!20315) Bool)

(assert (=> b!1305532 (= e!744782 (isEmpty!1069 lt!584220))))

(declare-fun b!1305533 () Bool)

(assert (=> b!1305533 (= e!744782 (= lt!584220 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun bm!64331 () Bool)

(assert (=> bm!64331 (= call!64334 (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305534 () Bool)

(assert (=> b!1305534 (= e!744779 call!64334)))

(declare-fun b!1305535 () Bool)

(assert (=> b!1305535 (= e!744781 e!744782)))

(declare-fun c!125618 () Bool)

(assert (=> b!1305535 (= c!125618 (bvslt from!2144 (size!42480 _keys!1741)))))

(declare-fun b!1305536 () Bool)

(declare-fun res!866697 () Bool)

(assert (=> b!1305536 (=> (not res!866697) (not e!744780))))

(assert (=> b!1305536 (= res!866697 (not (contains!8323 lt!584220 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!142253 () Bool)

(assert (=> d!142253 e!744780))

(declare-fun res!866695 () Bool)

(assert (=> d!142253 (=> (not res!866695) (not e!744780))))

(assert (=> d!142253 (= res!866695 (not (contains!8323 lt!584220 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142253 (= lt!584220 e!744783)))

(declare-fun c!125619 () Bool)

(assert (=> d!142253 (= c!125619 (bvsge from!2144 (size!42480 _keys!1741)))))

(assert (=> d!142253 (validMask!0 mask!2175)))

(assert (=> d!142253 (= (getCurrentListMapNoExtraKeys!6170 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584220)))

(declare-fun b!1305537 () Bool)

(assert (=> b!1305537 (= e!744783 (ListLongMap!20316 Nil!29794))))

(declare-fun b!1305538 () Bool)

(assert (=> b!1305538 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42480 _keys!1741)))))

(assert (=> b!1305538 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42479 _values!1445)))))

(assert (=> b!1305538 (= e!744778 (= (apply!1032 lt!584220 (select (arr!41929 _keys!1741) from!2144)) (get!21223 (select (arr!41928 _values!1445) from!2144) (dynLambda!3493 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!142253 c!125619) b!1305537))

(assert (= (and d!142253 (not c!125619)) b!1305531))

(assert (= (and b!1305531 c!125617) b!1305530))

(assert (= (and b!1305531 (not c!125617)) b!1305534))

(assert (= (or b!1305530 b!1305534) bm!64331))

(assert (= (and d!142253 res!866695) b!1305536))

(assert (= (and b!1305536 res!866697) b!1305529))

(assert (= (and b!1305529 res!866696) b!1305528))

(assert (= (and b!1305529 c!125620) b!1305527))

(assert (= (and b!1305529 (not c!125620)) b!1305535))

(assert (= (and b!1305527 res!866694) b!1305538))

(assert (= (and b!1305535 c!125618) b!1305533))

(assert (= (and b!1305535 (not c!125618)) b!1305532))

(declare-fun b_lambda!23291 () Bool)

(assert (=> (not b_lambda!23291) (not b!1305530)))

(assert (=> b!1305530 t!43391))

(declare-fun b_and!47459 () Bool)

(assert (= b_and!47457 (and (=> t!43391 result!23817) b_and!47459)))

(declare-fun b_lambda!23293 () Bool)

(assert (=> (not b_lambda!23293) (not b!1305538)))

(assert (=> b!1305538 t!43391))

(declare-fun b_and!47461 () Bool)

(assert (= b_and!47459 (and (=> t!43391 result!23817) b_and!47461)))

(assert (=> b!1305531 m!1196643))

(assert (=> b!1305531 m!1196643))

(assert (=> b!1305531 m!1196645))

(declare-fun m!1196833 () Bool)

(assert (=> bm!64331 m!1196833))

(assert (=> b!1305533 m!1196833))

(assert (=> b!1305538 m!1196643))

(assert (=> b!1305538 m!1196781))

(assert (=> b!1305538 m!1196643))

(declare-fun m!1196835 () Bool)

(assert (=> b!1305538 m!1196835))

(assert (=> b!1305538 m!1196783))

(assert (=> b!1305538 m!1196781))

(assert (=> b!1305538 m!1196783))

(assert (=> b!1305538 m!1196785))

(assert (=> b!1305528 m!1196643))

(assert (=> b!1305528 m!1196643))

(assert (=> b!1305528 m!1196645))

(declare-fun m!1196837 () Bool)

(assert (=> b!1305532 m!1196837))

(declare-fun m!1196839 () Bool)

(assert (=> b!1305536 m!1196839))

(declare-fun m!1196841 () Bool)

(assert (=> d!142253 m!1196841))

(assert (=> d!142253 m!1196649))

(assert (=> b!1305530 m!1196643))

(assert (=> b!1305530 m!1196781))

(declare-fun m!1196843 () Bool)

(assert (=> b!1305530 m!1196843))

(declare-fun m!1196845 () Bool)

(assert (=> b!1305530 m!1196845))

(declare-fun m!1196847 () Bool)

(assert (=> b!1305530 m!1196847))

(assert (=> b!1305530 m!1196847))

(declare-fun m!1196849 () Bool)

(assert (=> b!1305530 m!1196849))

(assert (=> b!1305530 m!1196783))

(assert (=> b!1305530 m!1196781))

(assert (=> b!1305530 m!1196783))

(assert (=> b!1305530 m!1196785))

(assert (=> b!1305527 m!1196643))

(assert (=> b!1305527 m!1196643))

(declare-fun m!1196851 () Bool)

(assert (=> b!1305527 m!1196851))

(assert (=> b!1305305 d!142253))

(declare-fun condMapEmpty!53978 () Bool)

(declare-fun mapDefault!53978 () ValueCell!16559)

(assert (=> mapNonEmpty!53969 (= condMapEmpty!53978 (= mapRest!53969 ((as const (Array (_ BitVec 32) ValueCell!16559)) mapDefault!53978)))))

(declare-fun e!744789 () Bool)

(declare-fun mapRes!53978 () Bool)

(assert (=> mapNonEmpty!53969 (= tp!102979 (and e!744789 mapRes!53978))))

(declare-fun b!1305546 () Bool)

(assert (=> b!1305546 (= e!744789 tp_is_empty!34915)))

(declare-fun mapNonEmpty!53978 () Bool)

(declare-fun tp!102995 () Bool)

(declare-fun e!744788 () Bool)

(assert (=> mapNonEmpty!53978 (= mapRes!53978 (and tp!102995 e!744788))))

(declare-fun mapKey!53978 () (_ BitVec 32))

(declare-fun mapRest!53978 () (Array (_ BitVec 32) ValueCell!16559))

(declare-fun mapValue!53978 () ValueCell!16559)

(assert (=> mapNonEmpty!53978 (= mapRest!53969 (store mapRest!53978 mapKey!53978 mapValue!53978))))

(declare-fun mapIsEmpty!53978 () Bool)

(assert (=> mapIsEmpty!53978 mapRes!53978))

(declare-fun b!1305545 () Bool)

(assert (=> b!1305545 (= e!744788 tp_is_empty!34915)))

(assert (= (and mapNonEmpty!53969 condMapEmpty!53978) mapIsEmpty!53978))

(assert (= (and mapNonEmpty!53969 (not condMapEmpty!53978)) mapNonEmpty!53978))

(assert (= (and mapNonEmpty!53978 ((_ is ValueCellFull!16559) mapValue!53978)) b!1305545))

(assert (= (and mapNonEmpty!53969 ((_ is ValueCellFull!16559) mapDefault!53978)) b!1305546))

(declare-fun m!1196853 () Bool)

(assert (=> mapNonEmpty!53978 m!1196853))

(declare-fun b_lambda!23295 () Bool)

(assert (= b_lambda!23291 (or (and start!110352 b_free!29275) b_lambda!23295)))

(declare-fun b_lambda!23297 () Bool)

(assert (= b_lambda!23289 (or (and start!110352 b_free!29275) b_lambda!23297)))

(declare-fun b_lambda!23299 () Bool)

(assert (= b_lambda!23293 (or (and start!110352 b_free!29275) b_lambda!23299)))

(check-sat (not bm!64322) (not b!1305461) (not d!142247) (not d!142249) (not b_lambda!23295) (not b!1305533) (not d!142251) (not b!1305531) (not b!1305475) b_and!47461 (not bm!64328) (not bm!64323) (not b!1305399) (not d!142253) (not b!1305454) (not b!1305466) (not bm!64331) (not b!1305527) (not b!1305497) (not b!1305477) (not mapNonEmpty!53978) (not b!1305489) (not b_lambda!23299) (not d!142235) (not b_next!29275) (not bm!64319) (not b!1305492) (not b!1305528) (not b!1305396) (not b!1305498) (not b!1305530) (not b!1305536) (not b!1305472) (not d!142237) (not b!1305470) (not bm!64324) (not b!1305538) (not b!1305407) (not b!1305468) (not bm!64304) (not b!1305409) (not b!1305532) (not b!1305460) (not b!1305486) (not d!142239) (not b_lambda!23297) (not d!142241) tp_is_empty!34915 (not b!1305397) (not b!1305465) (not b!1305490))
(check-sat b_and!47461 (not b_next!29275))
