; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4548 () Bool)

(assert start!4548)

(declare-fun b_free!1269 () Bool)

(declare-fun b_next!1269 () Bool)

(assert (=> start!4548 (= b_free!1269 (not b_next!1269))))

(declare-fun tp!5250 () Bool)

(declare-fun b_and!2095 () Bool)

(assert (=> start!4548 (= tp!5250 b_and!2095)))

(declare-fun b!35531 () Bool)

(declare-fun e!22446 () Bool)

(declare-fun e!22445 () Bool)

(assert (=> b!35531 (= e!22446 e!22445)))

(declare-fun res!21573 () Bool)

(assert (=> b!35531 (=> (not res!21573) (not e!22445))))

(declare-datatypes ((V!1989 0))(
  ( (V!1990 (val!838 Int)) )
))
(declare-datatypes ((tuple2!1350 0))(
  ( (tuple2!1351 (_1!686 (_ BitVec 64)) (_2!686 V!1989)) )
))
(declare-datatypes ((List!943 0))(
  ( (Nil!940) (Cons!939 (h!1506 tuple2!1350) (t!3652 List!943)) )
))
(declare-datatypes ((ListLongMap!927 0))(
  ( (ListLongMap!928 (toList!479 List!943)) )
))
(declare-fun lt!13069 () ListLongMap!927)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!427 (ListLongMap!927 (_ BitVec 64)) Bool)

(assert (=> b!35531 (= res!21573 (not (contains!427 lt!13069 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!612 0))(
  ( (ValueCellFull!612 (v!1935 V!1989)) (EmptyCell!612) )
))
(declare-datatypes ((array!2463 0))(
  ( (array!2464 (arr!1177 (Array (_ BitVec 32) ValueCell!612)) (size!1278 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2463)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2465 0))(
  ( (array!2466 (arr!1178 (Array (_ BitVec 32) (_ BitVec 64))) (size!1279 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2465)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1989)

(declare-fun minValue!1443 () V!1989)

(declare-fun getCurrentListMap!303 (array!2465 array!2463 (_ BitVec 32) (_ BitVec 32) V!1989 V!1989 (_ BitVec 32) Int) ListLongMap!927)

(assert (=> b!35531 (= lt!13069 (getCurrentListMap!303 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35532 () Bool)

(declare-fun res!21572 () Bool)

(assert (=> b!35532 (=> (not res!21572) (not e!22445))))

(declare-fun arrayContainsKey!0 (array!2465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35532 (= res!21572 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun res!21574 () Bool)

(assert (=> start!4548 (=> (not res!21574) (not e!22446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4548 (= res!21574 (validMask!0 mask!2294))))

(assert (=> start!4548 e!22446))

(assert (=> start!4548 true))

(assert (=> start!4548 tp!5250))

(declare-fun e!22448 () Bool)

(declare-fun array_inv!829 (array!2463) Bool)

(assert (=> start!4548 (and (array_inv!829 _values!1501) e!22448)))

(declare-fun array_inv!830 (array!2465) Bool)

(assert (=> start!4548 (array_inv!830 _keys!1833)))

(declare-fun tp_is_empty!1623 () Bool)

(assert (=> start!4548 tp_is_empty!1623))

(declare-fun b!35533 () Bool)

(declare-fun e!22449 () Bool)

(declare-fun mapRes!1987 () Bool)

(assert (=> b!35533 (= e!22448 (and e!22449 mapRes!1987))))

(declare-fun condMapEmpty!1987 () Bool)

(declare-fun mapDefault!1987 () ValueCell!612)

(assert (=> b!35533 (= condMapEmpty!1987 (= (arr!1177 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!612)) mapDefault!1987)))))

(declare-fun b!35534 () Bool)

(declare-fun e!22450 () Bool)

(assert (=> b!35534 (= e!22450 (not false))))

(declare-datatypes ((SeekEntryResult!163 0))(
  ( (MissingZero!163 (index!2774 (_ BitVec 32))) (Found!163 (index!2775 (_ BitVec 32))) (Intermediate!163 (undefined!975 Bool) (index!2776 (_ BitVec 32)) (x!7025 (_ BitVec 32))) (Undefined!163) (MissingVacant!163 (index!2777 (_ BitVec 32))) )
))
(declare-fun lt!13071 () SeekEntryResult!163)

(assert (=> b!35534 (contains!427 lt!13069 (select (arr!1178 _keys!1833) (index!2775 lt!13071)))))

(declare-datatypes ((Unit!785 0))(
  ( (Unit!786) )
))
(declare-fun lt!13070 () Unit!785)

(declare-fun lemmaValidKeyInArrayIsInListMap!72 (array!2465 array!2463 (_ BitVec 32) (_ BitVec 32) V!1989 V!1989 (_ BitVec 32) Int) Unit!785)

(assert (=> b!35534 (= lt!13070 (lemmaValidKeyInArrayIsInListMap!72 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2775 lt!13071) defaultEntry!1504))))

(declare-fun mapNonEmpty!1987 () Bool)

(declare-fun tp!5251 () Bool)

(declare-fun e!22447 () Bool)

(assert (=> mapNonEmpty!1987 (= mapRes!1987 (and tp!5251 e!22447))))

(declare-fun mapKey!1987 () (_ BitVec 32))

(declare-fun mapValue!1987 () ValueCell!612)

(declare-fun mapRest!1987 () (Array (_ BitVec 32) ValueCell!612))

(assert (=> mapNonEmpty!1987 (= (arr!1177 _values!1501) (store mapRest!1987 mapKey!1987 mapValue!1987))))

(declare-fun b!35535 () Bool)

(assert (=> b!35535 (= e!22449 tp_is_empty!1623)))

(declare-fun mapIsEmpty!1987 () Bool)

(assert (=> mapIsEmpty!1987 mapRes!1987))

(declare-fun b!35536 () Bool)

(declare-fun res!21576 () Bool)

(assert (=> b!35536 (=> (not res!21576) (not e!22446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2465 (_ BitVec 32)) Bool)

(assert (=> b!35536 (= res!21576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35537 () Bool)

(assert (=> b!35537 (= e!22447 tp_is_empty!1623)))

(declare-fun b!35538 () Bool)

(declare-fun res!21579 () Bool)

(assert (=> b!35538 (=> (not res!21579) (not e!22446))))

(declare-datatypes ((List!944 0))(
  ( (Nil!941) (Cons!940 (h!1507 (_ BitVec 64)) (t!3653 List!944)) )
))
(declare-fun arrayNoDuplicates!0 (array!2465 (_ BitVec 32) List!944) Bool)

(assert (=> b!35538 (= res!21579 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!941))))

(declare-fun b!35539 () Bool)

(declare-fun res!21575 () Bool)

(assert (=> b!35539 (=> (not res!21575) (not e!22446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35539 (= res!21575 (validKeyInArray!0 k0!1304))))

(declare-fun b!35540 () Bool)

(assert (=> b!35540 (= e!22445 e!22450)))

(declare-fun res!21578 () Bool)

(assert (=> b!35540 (=> (not res!21578) (not e!22450))))

(get-info :version)

(assert (=> b!35540 (= res!21578 ((_ is Found!163) lt!13071))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2465 (_ BitVec 32)) SeekEntryResult!163)

(assert (=> b!35540 (= lt!13071 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35541 () Bool)

(declare-fun res!21577 () Bool)

(assert (=> b!35541 (=> (not res!21577) (not e!22446))))

(assert (=> b!35541 (= res!21577 (and (= (size!1278 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1279 _keys!1833) (size!1278 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4548 res!21574) b!35541))

(assert (= (and b!35541 res!21577) b!35536))

(assert (= (and b!35536 res!21576) b!35538))

(assert (= (and b!35538 res!21579) b!35539))

(assert (= (and b!35539 res!21575) b!35531))

(assert (= (and b!35531 res!21573) b!35532))

(assert (= (and b!35532 res!21572) b!35540))

(assert (= (and b!35540 res!21578) b!35534))

(assert (= (and b!35533 condMapEmpty!1987) mapIsEmpty!1987))

(assert (= (and b!35533 (not condMapEmpty!1987)) mapNonEmpty!1987))

(assert (= (and mapNonEmpty!1987 ((_ is ValueCellFull!612) mapValue!1987)) b!35537))

(assert (= (and b!35533 ((_ is ValueCellFull!612) mapDefault!1987)) b!35535))

(assert (= start!4548 b!35533))

(declare-fun m!28565 () Bool)

(assert (=> start!4548 m!28565))

(declare-fun m!28567 () Bool)

(assert (=> start!4548 m!28567))

(declare-fun m!28569 () Bool)

(assert (=> start!4548 m!28569))

(declare-fun m!28571 () Bool)

(assert (=> b!35539 m!28571))

(declare-fun m!28573 () Bool)

(assert (=> b!35536 m!28573))

(declare-fun m!28575 () Bool)

(assert (=> b!35540 m!28575))

(declare-fun m!28577 () Bool)

(assert (=> b!35531 m!28577))

(declare-fun m!28579 () Bool)

(assert (=> b!35531 m!28579))

(declare-fun m!28581 () Bool)

(assert (=> b!35532 m!28581))

(declare-fun m!28583 () Bool)

(assert (=> b!35538 m!28583))

(declare-fun m!28585 () Bool)

(assert (=> b!35534 m!28585))

(assert (=> b!35534 m!28585))

(declare-fun m!28587 () Bool)

(assert (=> b!35534 m!28587))

(declare-fun m!28589 () Bool)

(assert (=> b!35534 m!28589))

(declare-fun m!28591 () Bool)

(assert (=> mapNonEmpty!1987 m!28591))

(check-sat (not b!35532) (not b_next!1269) (not b!35538) (not start!4548) (not b!35531) (not b!35534) (not mapNonEmpty!1987) (not b!35536) tp_is_empty!1623 (not b!35540) (not b!35539) b_and!2095)
(check-sat b_and!2095 (not b_next!1269))
(get-model)

(declare-fun b!35585 () Bool)

(declare-fun e!22481 () Bool)

(declare-fun call!2808 () Bool)

(assert (=> b!35585 (= e!22481 call!2808)))

(declare-fun b!35586 () Bool)

(declare-fun e!22482 () Bool)

(declare-fun contains!428 (List!944 (_ BitVec 64)) Bool)

(assert (=> b!35586 (= e!22482 (contains!428 Nil!941 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35587 () Bool)

(assert (=> b!35587 (= e!22481 call!2808)))

(declare-fun bm!2805 () Bool)

(declare-fun c!4033 () Bool)

(assert (=> bm!2805 (= call!2808 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4033 (Cons!940 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) Nil!941) Nil!941)))))

(declare-fun b!35589 () Bool)

(declare-fun e!22480 () Bool)

(assert (=> b!35589 (= e!22480 e!22481)))

(assert (=> b!35589 (= c!4033 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5321 () Bool)

(declare-fun res!21612 () Bool)

(declare-fun e!22483 () Bool)

(assert (=> d!5321 (=> res!21612 e!22483)))

(assert (=> d!5321 (= res!21612 (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> d!5321 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!941) e!22483)))

(declare-fun b!35588 () Bool)

(assert (=> b!35588 (= e!22483 e!22480)))

(declare-fun res!21610 () Bool)

(assert (=> b!35588 (=> (not res!21610) (not e!22480))))

(assert (=> b!35588 (= res!21610 (not e!22482))))

(declare-fun res!21611 () Bool)

(assert (=> b!35588 (=> (not res!21611) (not e!22482))))

(assert (=> b!35588 (= res!21611 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5321 (not res!21612)) b!35588))

(assert (= (and b!35588 res!21611) b!35586))

(assert (= (and b!35588 res!21610) b!35589))

(assert (= (and b!35589 c!4033) b!35585))

(assert (= (and b!35589 (not c!4033)) b!35587))

(assert (= (or b!35585 b!35587) bm!2805))

(declare-fun m!28621 () Bool)

(assert (=> b!35586 m!28621))

(assert (=> b!35586 m!28621))

(declare-fun m!28623 () Bool)

(assert (=> b!35586 m!28623))

(assert (=> bm!2805 m!28621))

(declare-fun m!28625 () Bool)

(assert (=> bm!2805 m!28625))

(assert (=> b!35589 m!28621))

(assert (=> b!35589 m!28621))

(declare-fun m!28627 () Bool)

(assert (=> b!35589 m!28627))

(assert (=> b!35588 m!28621))

(assert (=> b!35588 m!28621))

(assert (=> b!35588 m!28627))

(assert (=> b!35538 d!5321))

(declare-fun d!5323 () Bool)

(declare-fun e!22488 () Bool)

(assert (=> d!5323 e!22488))

(declare-fun res!21615 () Bool)

(assert (=> d!5323 (=> res!21615 e!22488)))

(declare-fun lt!13092 () Bool)

(assert (=> d!5323 (= res!21615 (not lt!13092))))

(declare-fun lt!13089 () Bool)

(assert (=> d!5323 (= lt!13092 lt!13089)))

(declare-fun lt!13091 () Unit!785)

(declare-fun e!22489 () Unit!785)

(assert (=> d!5323 (= lt!13091 e!22489)))

(declare-fun c!4036 () Bool)

(assert (=> d!5323 (= c!4036 lt!13089)))

(declare-fun containsKey!37 (List!943 (_ BitVec 64)) Bool)

(assert (=> d!5323 (= lt!13089 (containsKey!37 (toList!479 lt!13069) k0!1304))))

(assert (=> d!5323 (= (contains!427 lt!13069 k0!1304) lt!13092)))

(declare-fun b!35596 () Bool)

(declare-fun lt!13090 () Unit!785)

(assert (=> b!35596 (= e!22489 lt!13090)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!34 (List!943 (_ BitVec 64)) Unit!785)

(assert (=> b!35596 (= lt!13090 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!479 lt!13069) k0!1304))))

(declare-datatypes ((Option!79 0))(
  ( (Some!78 (v!1937 V!1989)) (None!77) )
))
(declare-fun isDefined!35 (Option!79) Bool)

(declare-fun getValueByKey!73 (List!943 (_ BitVec 64)) Option!79)

(assert (=> b!35596 (isDefined!35 (getValueByKey!73 (toList!479 lt!13069) k0!1304))))

(declare-fun b!35597 () Bool)

(declare-fun Unit!787 () Unit!785)

(assert (=> b!35597 (= e!22489 Unit!787)))

(declare-fun b!35598 () Bool)

(assert (=> b!35598 (= e!22488 (isDefined!35 (getValueByKey!73 (toList!479 lt!13069) k0!1304)))))

(assert (= (and d!5323 c!4036) b!35596))

(assert (= (and d!5323 (not c!4036)) b!35597))

(assert (= (and d!5323 (not res!21615)) b!35598))

(declare-fun m!28629 () Bool)

(assert (=> d!5323 m!28629))

(declare-fun m!28631 () Bool)

(assert (=> b!35596 m!28631))

(declare-fun m!28633 () Bool)

(assert (=> b!35596 m!28633))

(assert (=> b!35596 m!28633))

(declare-fun m!28635 () Bool)

(assert (=> b!35596 m!28635))

(assert (=> b!35598 m!28633))

(assert (=> b!35598 m!28633))

(assert (=> b!35598 m!28635))

(assert (=> b!35531 d!5323))

(declare-fun b!35641 () Bool)

(declare-fun e!22520 () ListLongMap!927)

(declare-fun call!2823 () ListLongMap!927)

(assert (=> b!35641 (= e!22520 call!2823)))

(declare-fun b!35642 () Bool)

(declare-fun e!22522 () Bool)

(assert (=> b!35642 (= e!22522 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35643 () Bool)

(declare-fun call!2824 () ListLongMap!927)

(assert (=> b!35643 (= e!22520 call!2824)))

(declare-fun b!35644 () Bool)

(declare-fun e!22516 () ListLongMap!927)

(declare-fun call!2829 () ListLongMap!927)

(declare-fun +!59 (ListLongMap!927 tuple2!1350) ListLongMap!927)

(assert (=> b!35644 (= e!22516 (+!59 call!2829 (tuple2!1351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35645 () Bool)

(declare-fun c!4053 () Bool)

(assert (=> b!35645 (= c!4053 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!22528 () ListLongMap!927)

(assert (=> b!35645 (= e!22528 e!22520)))

(declare-fun call!2828 () ListLongMap!927)

(declare-fun bm!2820 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!28 (array!2465 array!2463 (_ BitVec 32) (_ BitVec 32) V!1989 V!1989 (_ BitVec 32) Int) ListLongMap!927)

(assert (=> bm!2820 (= call!2828 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35646 () Bool)

(assert (=> b!35646 (= e!22528 call!2823)))

(declare-fun b!35647 () Bool)

(declare-fun e!22518 () Unit!785)

(declare-fun Unit!788 () Unit!785)

(assert (=> b!35647 (= e!22518 Unit!788)))

(declare-fun b!35648 () Bool)

(declare-fun e!22527 () Bool)

(declare-fun call!2826 () Bool)

(assert (=> b!35648 (= e!22527 (not call!2826))))

(declare-fun bm!2821 () Bool)

(declare-fun call!2827 () ListLongMap!927)

(assert (=> bm!2821 (= call!2824 call!2827)))

(declare-fun b!35649 () Bool)

(declare-fun e!22525 () Bool)

(declare-fun lt!13138 () ListLongMap!927)

(declare-fun apply!41 (ListLongMap!927 (_ BitVec 64)) V!1989)

(assert (=> b!35649 (= e!22525 (= (apply!41 lt!13138 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun d!5325 () Bool)

(declare-fun e!22519 () Bool)

(assert (=> d!5325 e!22519))

(declare-fun res!21634 () Bool)

(assert (=> d!5325 (=> (not res!21634) (not e!22519))))

(assert (=> d!5325 (= res!21634 (or (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))))

(declare-fun lt!13141 () ListLongMap!927)

(assert (=> d!5325 (= lt!13138 lt!13141)))

(declare-fun lt!13150 () Unit!785)

(assert (=> d!5325 (= lt!13150 e!22518)))

(declare-fun c!4052 () Bool)

(declare-fun e!22523 () Bool)

(assert (=> d!5325 (= c!4052 e!22523)))

(declare-fun res!21636 () Bool)

(assert (=> d!5325 (=> (not res!21636) (not e!22523))))

(assert (=> d!5325 (= res!21636 (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> d!5325 (= lt!13141 e!22516)))

(declare-fun c!4054 () Bool)

(assert (=> d!5325 (= c!4054 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5325 (validMask!0 mask!2294)))

(assert (=> d!5325 (= (getCurrentListMap!303 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13138)))

(declare-fun b!35650 () Bool)

(declare-fun e!22521 () Bool)

(declare-fun e!22517 () Bool)

(assert (=> b!35650 (= e!22521 e!22517)))

(declare-fun res!21641 () Bool)

(assert (=> b!35650 (=> (not res!21641) (not e!22517))))

(assert (=> b!35650 (= res!21641 (contains!427 lt!13138 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun bm!2822 () Bool)

(assert (=> bm!2822 (= call!2826 (contains!427 lt!13138 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35651 () Bool)

(assert (=> b!35651 (= e!22519 e!22527)))

(declare-fun c!4050 () Bool)

(assert (=> b!35651 (= c!4050 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2823 () Bool)

(assert (=> bm!2823 (= call!2827 call!2828)))

(declare-fun b!35652 () Bool)

(declare-fun e!22524 () Bool)

(declare-fun call!2825 () Bool)

(assert (=> b!35652 (= e!22524 (not call!2825))))

(declare-fun b!35653 () Bool)

(declare-fun get!606 (ValueCell!612 V!1989) V!1989)

(declare-fun dynLambda!158 (Int (_ BitVec 64)) V!1989)

(assert (=> b!35653 (= e!22517 (= (apply!41 lt!13138 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)) (get!606 (select (arr!1177 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1278 _values!1501)))))

(assert (=> b!35653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun b!35654 () Bool)

(declare-fun e!22526 () Bool)

(assert (=> b!35654 (= e!22527 e!22526)))

(declare-fun res!21635 () Bool)

(assert (=> b!35654 (= res!21635 call!2826)))

(assert (=> b!35654 (=> (not res!21635) (not e!22526))))

(declare-fun b!35655 () Bool)

(declare-fun lt!13143 () Unit!785)

(assert (=> b!35655 (= e!22518 lt!13143)))

(declare-fun lt!13155 () ListLongMap!927)

(assert (=> b!35655 (= lt!13155 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13137 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13151 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13151 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13148 () Unit!785)

(declare-fun addStillContains!26 (ListLongMap!927 (_ BitVec 64) V!1989 (_ BitVec 64)) Unit!785)

(assert (=> b!35655 (= lt!13148 (addStillContains!26 lt!13155 lt!13137 zeroValue!1443 lt!13151))))

(assert (=> b!35655 (contains!427 (+!59 lt!13155 (tuple2!1351 lt!13137 zeroValue!1443)) lt!13151)))

(declare-fun lt!13145 () Unit!785)

(assert (=> b!35655 (= lt!13145 lt!13148)))

(declare-fun lt!13144 () ListLongMap!927)

(assert (=> b!35655 (= lt!13144 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13153 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13147 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13147 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13154 () Unit!785)

(declare-fun addApplyDifferent!26 (ListLongMap!927 (_ BitVec 64) V!1989 (_ BitVec 64)) Unit!785)

(assert (=> b!35655 (= lt!13154 (addApplyDifferent!26 lt!13144 lt!13153 minValue!1443 lt!13147))))

(assert (=> b!35655 (= (apply!41 (+!59 lt!13144 (tuple2!1351 lt!13153 minValue!1443)) lt!13147) (apply!41 lt!13144 lt!13147))))

(declare-fun lt!13156 () Unit!785)

(assert (=> b!35655 (= lt!13156 lt!13154)))

(declare-fun lt!13157 () ListLongMap!927)

(assert (=> b!35655 (= lt!13157 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13146 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13146 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13142 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13142 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13158 () Unit!785)

(assert (=> b!35655 (= lt!13158 (addApplyDifferent!26 lt!13157 lt!13146 zeroValue!1443 lt!13142))))

(assert (=> b!35655 (= (apply!41 (+!59 lt!13157 (tuple2!1351 lt!13146 zeroValue!1443)) lt!13142) (apply!41 lt!13157 lt!13142))))

(declare-fun lt!13149 () Unit!785)

(assert (=> b!35655 (= lt!13149 lt!13158)))

(declare-fun lt!13152 () ListLongMap!927)

(assert (=> b!35655 (= lt!13152 (getCurrentListMapNoExtraKeys!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13140 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13140 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13139 () (_ BitVec 64))

(assert (=> b!35655 (= lt!13139 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35655 (= lt!13143 (addApplyDifferent!26 lt!13152 lt!13140 minValue!1443 lt!13139))))

(assert (=> b!35655 (= (apply!41 (+!59 lt!13152 (tuple2!1351 lt!13140 minValue!1443)) lt!13139) (apply!41 lt!13152 lt!13139))))

(declare-fun b!35656 () Bool)

(assert (=> b!35656 (= e!22526 (= (apply!41 lt!13138 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2824 () Bool)

(assert (=> bm!2824 (= call!2823 call!2829)))

(declare-fun bm!2825 () Bool)

(assert (=> bm!2825 (= call!2825 (contains!427 lt!13138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35657 () Bool)

(declare-fun res!21637 () Bool)

(assert (=> b!35657 (=> (not res!21637) (not e!22519))))

(assert (=> b!35657 (= res!21637 e!22524)))

(declare-fun c!4049 () Bool)

(assert (=> b!35657 (= c!4049 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35658 () Bool)

(assert (=> b!35658 (= e!22516 e!22528)))

(declare-fun c!4051 () Bool)

(assert (=> b!35658 (= c!4051 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35659 () Bool)

(declare-fun res!21640 () Bool)

(assert (=> b!35659 (=> (not res!21640) (not e!22519))))

(assert (=> b!35659 (= res!21640 e!22521)))

(declare-fun res!21642 () Bool)

(assert (=> b!35659 (=> res!21642 e!22521)))

(assert (=> b!35659 (= res!21642 (not e!22522))))

(declare-fun res!21639 () Bool)

(assert (=> b!35659 (=> (not res!21639) (not e!22522))))

(assert (=> b!35659 (= res!21639 (bvslt #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(declare-fun b!35660 () Bool)

(assert (=> b!35660 (= e!22523 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35661 () Bool)

(assert (=> b!35661 (= e!22524 e!22525)))

(declare-fun res!21638 () Bool)

(assert (=> b!35661 (= res!21638 call!2825)))

(assert (=> b!35661 (=> (not res!21638) (not e!22525))))

(declare-fun bm!2826 () Bool)

(assert (=> bm!2826 (= call!2829 (+!59 (ite c!4054 call!2828 (ite c!4051 call!2827 call!2824)) (ite (or c!4054 c!4051) (tuple2!1351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (= (and d!5325 c!4054) b!35644))

(assert (= (and d!5325 (not c!4054)) b!35658))

(assert (= (and b!35658 c!4051) b!35646))

(assert (= (and b!35658 (not c!4051)) b!35645))

(assert (= (and b!35645 c!4053) b!35641))

(assert (= (and b!35645 (not c!4053)) b!35643))

(assert (= (or b!35641 b!35643) bm!2821))

(assert (= (or b!35646 bm!2821) bm!2823))

(assert (= (or b!35646 b!35641) bm!2824))

(assert (= (or b!35644 bm!2823) bm!2820))

(assert (= (or b!35644 bm!2824) bm!2826))

(assert (= (and d!5325 res!21636) b!35660))

(assert (= (and d!5325 c!4052) b!35655))

(assert (= (and d!5325 (not c!4052)) b!35647))

(assert (= (and d!5325 res!21634) b!35659))

(assert (= (and b!35659 res!21639) b!35642))

(assert (= (and b!35659 (not res!21642)) b!35650))

(assert (= (and b!35650 res!21641) b!35653))

(assert (= (and b!35659 res!21640) b!35657))

(assert (= (and b!35657 c!4049) b!35661))

(assert (= (and b!35657 (not c!4049)) b!35652))

(assert (= (and b!35661 res!21638) b!35649))

(assert (= (or b!35661 b!35652) bm!2825))

(assert (= (and b!35657 res!21637) b!35651))

(assert (= (and b!35651 c!4050) b!35654))

(assert (= (and b!35651 (not c!4050)) b!35648))

(assert (= (and b!35654 res!21635) b!35656))

(assert (= (or b!35654 b!35648) bm!2822))

(declare-fun b_lambda!1727 () Bool)

(assert (=> (not b_lambda!1727) (not b!35653)))

(declare-fun t!3655 () Bool)

(declare-fun tb!697 () Bool)

(assert (=> (and start!4548 (= defaultEntry!1504 defaultEntry!1504) t!3655) tb!697))

(declare-fun result!1201 () Bool)

(assert (=> tb!697 (= result!1201 tp_is_empty!1623)))

(assert (=> b!35653 t!3655))

(declare-fun b_and!2099 () Bool)

(assert (= b_and!2095 (and (=> t!3655 result!1201) b_and!2099)))

(declare-fun m!28637 () Bool)

(assert (=> b!35655 m!28637))

(declare-fun m!28639 () Bool)

(assert (=> b!35655 m!28639))

(declare-fun m!28641 () Bool)

(assert (=> b!35655 m!28641))

(declare-fun m!28643 () Bool)

(assert (=> b!35655 m!28643))

(declare-fun m!28645 () Bool)

(assert (=> b!35655 m!28645))

(assert (=> b!35655 m!28637))

(assert (=> b!35655 m!28621))

(declare-fun m!28647 () Bool)

(assert (=> b!35655 m!28647))

(declare-fun m!28649 () Bool)

(assert (=> b!35655 m!28649))

(declare-fun m!28651 () Bool)

(assert (=> b!35655 m!28651))

(assert (=> b!35655 m!28641))

(declare-fun m!28653 () Bool)

(assert (=> b!35655 m!28653))

(declare-fun m!28655 () Bool)

(assert (=> b!35655 m!28655))

(declare-fun m!28657 () Bool)

(assert (=> b!35655 m!28657))

(declare-fun m!28659 () Bool)

(assert (=> b!35655 m!28659))

(declare-fun m!28661 () Bool)

(assert (=> b!35655 m!28661))

(assert (=> b!35655 m!28651))

(declare-fun m!28663 () Bool)

(assert (=> b!35655 m!28663))

(assert (=> b!35655 m!28647))

(declare-fun m!28665 () Bool)

(assert (=> b!35655 m!28665))

(declare-fun m!28667 () Bool)

(assert (=> b!35655 m!28667))

(declare-fun m!28669 () Bool)

(assert (=> b!35656 m!28669))

(assert (=> bm!2820 m!28661))

(assert (=> d!5325 m!28565))

(declare-fun m!28671 () Bool)

(assert (=> bm!2826 m!28671))

(declare-fun m!28673 () Bool)

(assert (=> bm!2825 m!28673))

(assert (=> b!35642 m!28621))

(assert (=> b!35642 m!28621))

(assert (=> b!35642 m!28627))

(assert (=> b!35650 m!28621))

(assert (=> b!35650 m!28621))

(declare-fun m!28675 () Bool)

(assert (=> b!35650 m!28675))

(declare-fun m!28677 () Bool)

(assert (=> bm!2822 m!28677))

(declare-fun m!28679 () Bool)

(assert (=> b!35649 m!28679))

(assert (=> b!35660 m!28621))

(assert (=> b!35660 m!28621))

(assert (=> b!35660 m!28627))

(declare-fun m!28681 () Bool)

(assert (=> b!35644 m!28681))

(declare-fun m!28683 () Bool)

(assert (=> b!35653 m!28683))

(declare-fun m!28685 () Bool)

(assert (=> b!35653 m!28685))

(assert (=> b!35653 m!28621))

(assert (=> b!35653 m!28621))

(declare-fun m!28687 () Bool)

(assert (=> b!35653 m!28687))

(assert (=> b!35653 m!28685))

(assert (=> b!35653 m!28683))

(declare-fun m!28689 () Bool)

(assert (=> b!35653 m!28689))

(assert (=> b!35531 d!5325))

(declare-fun d!5327 () Bool)

(assert (=> d!5327 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35539 d!5327))

(declare-fun b!35676 () Bool)

(declare-fun e!22535 () SeekEntryResult!163)

(declare-fun lt!13167 () SeekEntryResult!163)

(assert (=> b!35676 (= e!22535 (MissingZero!163 (index!2776 lt!13167)))))

(declare-fun b!35677 () Bool)

(declare-fun e!22537 () SeekEntryResult!163)

(assert (=> b!35677 (= e!22537 (Found!163 (index!2776 lt!13167)))))

(declare-fun b!35678 () Bool)

(declare-fun lt!13169 () SeekEntryResult!163)

(assert (=> b!35678 (= e!22535 (ite ((_ is MissingVacant!163) lt!13169) (MissingZero!163 (index!2777 lt!13169)) lt!13169))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2465 (_ BitVec 32)) SeekEntryResult!163)

(assert (=> b!35678 (= lt!13169 (seekKeyOrZeroReturnVacant!0 (x!7025 lt!13167) (index!2776 lt!13167) (index!2776 lt!13167) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35679 () Bool)

(declare-fun e!22536 () SeekEntryResult!163)

(assert (=> b!35679 (= e!22536 e!22537)))

(declare-fun lt!13170 () (_ BitVec 64))

(assert (=> b!35679 (= lt!13170 (select (arr!1178 _keys!1833) (index!2776 lt!13167)))))

(declare-fun c!4063 () Bool)

(assert (=> b!35679 (= c!4063 (= lt!13170 k0!1304))))

(declare-fun b!35680 () Bool)

(declare-fun c!4062 () Bool)

(assert (=> b!35680 (= c!4062 (= lt!13170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35680 (= e!22537 e!22535)))

(declare-fun d!5329 () Bool)

(declare-fun lt!13168 () SeekEntryResult!163)

(assert (=> d!5329 (and (or ((_ is MissingVacant!163) lt!13168) (not ((_ is Found!163) lt!13168)) (and (bvsge (index!2775 lt!13168) #b00000000000000000000000000000000) (bvslt (index!2775 lt!13168) (size!1279 _keys!1833)))) (not ((_ is MissingVacant!163) lt!13168)) (or (not ((_ is Found!163) lt!13168)) (= (select (arr!1178 _keys!1833) (index!2775 lt!13168)) k0!1304)))))

(assert (=> d!5329 (= lt!13168 e!22536)))

(declare-fun c!4061 () Bool)

(assert (=> d!5329 (= c!4061 (and ((_ is Intermediate!163) lt!13167) (undefined!975 lt!13167)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2465 (_ BitVec 32)) SeekEntryResult!163)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5329 (= lt!13167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5329 (validMask!0 mask!2294)))

(assert (=> d!5329 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13168)))

(declare-fun b!35681 () Bool)

(assert (=> b!35681 (= e!22536 Undefined!163)))

(assert (= (and d!5329 c!4061) b!35681))

(assert (= (and d!5329 (not c!4061)) b!35679))

(assert (= (and b!35679 c!4063) b!35677))

(assert (= (and b!35679 (not c!4063)) b!35680))

(assert (= (and b!35680 c!4062) b!35676))

(assert (= (and b!35680 (not c!4062)) b!35678))

(declare-fun m!28691 () Bool)

(assert (=> b!35678 m!28691))

(declare-fun m!28693 () Bool)

(assert (=> b!35679 m!28693))

(declare-fun m!28695 () Bool)

(assert (=> d!5329 m!28695))

(declare-fun m!28697 () Bool)

(assert (=> d!5329 m!28697))

(assert (=> d!5329 m!28697))

(declare-fun m!28699 () Bool)

(assert (=> d!5329 m!28699))

(assert (=> d!5329 m!28565))

(assert (=> b!35540 d!5329))

(declare-fun d!5331 () Bool)

(assert (=> d!5331 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4548 d!5331))

(declare-fun d!5333 () Bool)

(assert (=> d!5333 (= (array_inv!829 _values!1501) (bvsge (size!1278 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4548 d!5333))

(declare-fun d!5335 () Bool)

(assert (=> d!5335 (= (array_inv!830 _keys!1833) (bvsge (size!1279 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4548 d!5335))

(declare-fun b!35690 () Bool)

(declare-fun e!22545 () Bool)

(declare-fun call!2832 () Bool)

(assert (=> b!35690 (= e!22545 call!2832)))

(declare-fun b!35692 () Bool)

(declare-fun e!22546 () Bool)

(assert (=> b!35692 (= e!22546 call!2832)))

(declare-fun b!35693 () Bool)

(declare-fun e!22544 () Bool)

(assert (=> b!35693 (= e!22544 e!22546)))

(declare-fun c!4066 () Bool)

(assert (=> b!35693 (= c!4066 (validKeyInArray!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2829 () Bool)

(assert (=> bm!2829 (= call!2832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5337 () Bool)

(declare-fun res!21647 () Bool)

(assert (=> d!5337 (=> res!21647 e!22544)))

(assert (=> d!5337 (= res!21647 (bvsge #b00000000000000000000000000000000 (size!1279 _keys!1833)))))

(assert (=> d!5337 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22544)))

(declare-fun b!35691 () Bool)

(assert (=> b!35691 (= e!22546 e!22545)))

(declare-fun lt!13179 () (_ BitVec 64))

(assert (=> b!35691 (= lt!13179 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13177 () Unit!785)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2465 (_ BitVec 64) (_ BitVec 32)) Unit!785)

(assert (=> b!35691 (= lt!13177 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13179 #b00000000000000000000000000000000))))

(assert (=> b!35691 (arrayContainsKey!0 _keys!1833 lt!13179 #b00000000000000000000000000000000)))

(declare-fun lt!13178 () Unit!785)

(assert (=> b!35691 (= lt!13178 lt!13177)))

(declare-fun res!21648 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2465 (_ BitVec 32)) SeekEntryResult!163)

(assert (=> b!35691 (= res!21648 (= (seekEntryOrOpen!0 (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!163 #b00000000000000000000000000000000)))))

(assert (=> b!35691 (=> (not res!21648) (not e!22545))))

(assert (= (and d!5337 (not res!21647)) b!35693))

(assert (= (and b!35693 c!4066) b!35691))

(assert (= (and b!35693 (not c!4066)) b!35692))

(assert (= (and b!35691 res!21648) b!35690))

(assert (= (or b!35690 b!35692) bm!2829))

(assert (=> b!35693 m!28621))

(assert (=> b!35693 m!28621))

(assert (=> b!35693 m!28627))

(declare-fun m!28701 () Bool)

(assert (=> bm!2829 m!28701))

(assert (=> b!35691 m!28621))

(declare-fun m!28703 () Bool)

(assert (=> b!35691 m!28703))

(declare-fun m!28705 () Bool)

(assert (=> b!35691 m!28705))

(assert (=> b!35691 m!28621))

(declare-fun m!28707 () Bool)

(assert (=> b!35691 m!28707))

(assert (=> b!35536 d!5337))

(declare-fun d!5339 () Bool)

(declare-fun res!21653 () Bool)

(declare-fun e!22551 () Bool)

(assert (=> d!5339 (=> res!21653 e!22551)))

(assert (=> d!5339 (= res!21653 (= (select (arr!1178 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5339 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22551)))

(declare-fun b!35698 () Bool)

(declare-fun e!22552 () Bool)

(assert (=> b!35698 (= e!22551 e!22552)))

(declare-fun res!21654 () Bool)

(assert (=> b!35698 (=> (not res!21654) (not e!22552))))

(assert (=> b!35698 (= res!21654 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1279 _keys!1833)))))

(declare-fun b!35699 () Bool)

(assert (=> b!35699 (= e!22552 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5339 (not res!21653)) b!35698))

(assert (= (and b!35698 res!21654) b!35699))

(assert (=> d!5339 m!28621))

(declare-fun m!28709 () Bool)

(assert (=> b!35699 m!28709))

(assert (=> b!35532 d!5339))

(declare-fun d!5341 () Bool)

(declare-fun e!22553 () Bool)

(assert (=> d!5341 e!22553))

(declare-fun res!21655 () Bool)

(assert (=> d!5341 (=> res!21655 e!22553)))

(declare-fun lt!13183 () Bool)

(assert (=> d!5341 (= res!21655 (not lt!13183))))

(declare-fun lt!13180 () Bool)

(assert (=> d!5341 (= lt!13183 lt!13180)))

(declare-fun lt!13182 () Unit!785)

(declare-fun e!22554 () Unit!785)

(assert (=> d!5341 (= lt!13182 e!22554)))

(declare-fun c!4067 () Bool)

(assert (=> d!5341 (= c!4067 lt!13180)))

(assert (=> d!5341 (= lt!13180 (containsKey!37 (toList!479 lt!13069) (select (arr!1178 _keys!1833) (index!2775 lt!13071))))))

(assert (=> d!5341 (= (contains!427 lt!13069 (select (arr!1178 _keys!1833) (index!2775 lt!13071))) lt!13183)))

(declare-fun b!35700 () Bool)

(declare-fun lt!13181 () Unit!785)

(assert (=> b!35700 (= e!22554 lt!13181)))

(assert (=> b!35700 (= lt!13181 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!479 lt!13069) (select (arr!1178 _keys!1833) (index!2775 lt!13071))))))

(assert (=> b!35700 (isDefined!35 (getValueByKey!73 (toList!479 lt!13069) (select (arr!1178 _keys!1833) (index!2775 lt!13071))))))

(declare-fun b!35701 () Bool)

(declare-fun Unit!789 () Unit!785)

(assert (=> b!35701 (= e!22554 Unit!789)))

(declare-fun b!35702 () Bool)

(assert (=> b!35702 (= e!22553 (isDefined!35 (getValueByKey!73 (toList!479 lt!13069) (select (arr!1178 _keys!1833) (index!2775 lt!13071)))))))

(assert (= (and d!5341 c!4067) b!35700))

(assert (= (and d!5341 (not c!4067)) b!35701))

(assert (= (and d!5341 (not res!21655)) b!35702))

(assert (=> d!5341 m!28585))

(declare-fun m!28711 () Bool)

(assert (=> d!5341 m!28711))

(assert (=> b!35700 m!28585))

(declare-fun m!28713 () Bool)

(assert (=> b!35700 m!28713))

(assert (=> b!35700 m!28585))

(declare-fun m!28715 () Bool)

(assert (=> b!35700 m!28715))

(assert (=> b!35700 m!28715))

(declare-fun m!28717 () Bool)

(assert (=> b!35700 m!28717))

(assert (=> b!35702 m!28585))

(assert (=> b!35702 m!28715))

(assert (=> b!35702 m!28715))

(assert (=> b!35702 m!28717))

(assert (=> b!35534 d!5341))

(declare-fun d!5343 () Bool)

(declare-fun e!22557 () Bool)

(assert (=> d!5343 e!22557))

(declare-fun res!21658 () Bool)

(assert (=> d!5343 (=> (not res!21658) (not e!22557))))

(assert (=> d!5343 (= res!21658 (and (bvsge (index!2775 lt!13071) #b00000000000000000000000000000000) (bvslt (index!2775 lt!13071) (size!1279 _keys!1833))))))

(declare-fun lt!13186 () Unit!785)

(declare-fun choose!220 (array!2465 array!2463 (_ BitVec 32) (_ BitVec 32) V!1989 V!1989 (_ BitVec 32) Int) Unit!785)

(assert (=> d!5343 (= lt!13186 (choose!220 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2775 lt!13071) defaultEntry!1504))))

(assert (=> d!5343 (validMask!0 mask!2294)))

(assert (=> d!5343 (= (lemmaValidKeyInArrayIsInListMap!72 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2775 lt!13071) defaultEntry!1504) lt!13186)))

(declare-fun b!35705 () Bool)

(assert (=> b!35705 (= e!22557 (contains!427 (getCurrentListMap!303 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1178 _keys!1833) (index!2775 lt!13071))))))

(assert (= (and d!5343 res!21658) b!35705))

(declare-fun m!28719 () Bool)

(assert (=> d!5343 m!28719))

(assert (=> d!5343 m!28565))

(assert (=> b!35705 m!28579))

(assert (=> b!35705 m!28585))

(assert (=> b!35705 m!28579))

(assert (=> b!35705 m!28585))

(declare-fun m!28721 () Bool)

(assert (=> b!35705 m!28721))

(assert (=> b!35534 d!5343))

(declare-fun b!35713 () Bool)

(declare-fun e!22562 () Bool)

(assert (=> b!35713 (= e!22562 tp_is_empty!1623)))

(declare-fun mapIsEmpty!1993 () Bool)

(declare-fun mapRes!1993 () Bool)

(assert (=> mapIsEmpty!1993 mapRes!1993))

(declare-fun b!35712 () Bool)

(declare-fun e!22563 () Bool)

(assert (=> b!35712 (= e!22563 tp_is_empty!1623)))

(declare-fun mapNonEmpty!1993 () Bool)

(declare-fun tp!5260 () Bool)

(assert (=> mapNonEmpty!1993 (= mapRes!1993 (and tp!5260 e!22563))))

(declare-fun mapKey!1993 () (_ BitVec 32))

(declare-fun mapValue!1993 () ValueCell!612)

(declare-fun mapRest!1993 () (Array (_ BitVec 32) ValueCell!612))

(assert (=> mapNonEmpty!1993 (= mapRest!1987 (store mapRest!1993 mapKey!1993 mapValue!1993))))

(declare-fun condMapEmpty!1993 () Bool)

(declare-fun mapDefault!1993 () ValueCell!612)

(assert (=> mapNonEmpty!1987 (= condMapEmpty!1993 (= mapRest!1987 ((as const (Array (_ BitVec 32) ValueCell!612)) mapDefault!1993)))))

(assert (=> mapNonEmpty!1987 (= tp!5251 (and e!22562 mapRes!1993))))

(assert (= (and mapNonEmpty!1987 condMapEmpty!1993) mapIsEmpty!1993))

(assert (= (and mapNonEmpty!1987 (not condMapEmpty!1993)) mapNonEmpty!1993))

(assert (= (and mapNonEmpty!1993 ((_ is ValueCellFull!612) mapValue!1993)) b!35712))

(assert (= (and mapNonEmpty!1987 ((_ is ValueCellFull!612) mapDefault!1993)) b!35713))

(declare-fun m!28723 () Bool)

(assert (=> mapNonEmpty!1993 m!28723))

(declare-fun b_lambda!1729 () Bool)

(assert (= b_lambda!1727 (or (and start!4548 b_free!1269) b_lambda!1729)))

(check-sat (not bm!2825) (not b!35653) (not b_next!1269) (not b!35655) b_and!2099 (not b!35693) (not b!35650) (not b!35642) (not bm!2805) (not d!5329) (not b!35588) (not b!35644) (not bm!2822) (not b!35702) (not b!35660) (not b_lambda!1729) (not b!35598) (not b!35649) (not b!35700) (not b!35596) (not bm!2829) (not b!35589) (not b!35678) (not bm!2820) (not mapNonEmpty!1993) (not d!5341) (not b!35705) (not d!5323) (not b!35699) tp_is_empty!1623 (not b!35586) (not d!5325) (not b!35691) (not bm!2826) (not d!5343) (not b!35656))
(check-sat b_and!2099 (not b_next!1269))
