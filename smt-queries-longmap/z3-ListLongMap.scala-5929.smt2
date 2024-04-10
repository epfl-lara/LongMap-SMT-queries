; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77264 () Bool)

(assert start!77264)

(declare-fun b!901431 () Bool)

(declare-fun b_free!16077 () Bool)

(declare-fun b_next!16077 () Bool)

(assert (=> b!901431 (= b_free!16077 (not b_next!16077))))

(declare-fun tp!56331 () Bool)

(declare-fun b_and!26407 () Bool)

(assert (=> b!901431 (= tp!56331 b_and!26407)))

(declare-fun b!901423 () Bool)

(declare-fun e!504660 () Bool)

(declare-fun e!504654 () Bool)

(assert (=> b!901423 (= e!504660 e!504654)))

(declare-fun c!95468 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901423 (= c!95468 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901424 () Bool)

(declare-fun e!504661 () Bool)

(declare-datatypes ((SeekEntryResult!8951 0))(
  ( (MissingZero!8951 (index!38175 (_ BitVec 32))) (Found!8951 (index!38176 (_ BitVec 32))) (Intermediate!8951 (undefined!9763 Bool) (index!38177 (_ BitVec 32)) (x!76804 (_ BitVec 32))) (Undefined!8951) (MissingVacant!8951 (index!38178 (_ BitVec 32))) )
))
(declare-fun lt!407418 () SeekEntryResult!8951)

(declare-datatypes ((array!52866 0))(
  ( (array!52867 (arr!25401 (Array (_ BitVec 32) (_ BitVec 64))) (size!25860 (_ BitVec 32))) )
))
(declare-datatypes ((V!29505 0))(
  ( (V!29506 (val!9253 Int)) )
))
(declare-datatypes ((ValueCell!8721 0))(
  ( (ValueCellFull!8721 (v!11753 V!29505)) (EmptyCell!8721) )
))
(declare-datatypes ((array!52868 0))(
  ( (array!52869 (arr!25402 (Array (_ BitVec 32) ValueCell!8721)) (size!25861 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4458 0))(
  ( (LongMapFixedSize!4459 (defaultEntry!5469 Int) (mask!26279 (_ BitVec 32)) (extraKeys!5198 (_ BitVec 32)) (zeroValue!5302 V!29505) (minValue!5302 V!29505) (_size!2284 (_ BitVec 32)) (_keys!10282 array!52866) (_values!5489 array!52868) (_vacant!2284 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4458)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901424 (= e!504661 (inRange!0 (index!38176 lt!407418) (mask!26279 thiss!1181)))))

(declare-fun b!901425 () Bool)

(declare-fun res!608621 () Bool)

(declare-fun e!504653 () Bool)

(assert (=> b!901425 (=> (not res!608621) (not e!504653))))

(assert (=> b!901425 (= res!608621 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901426 () Bool)

(declare-fun e!504663 () Bool)

(declare-fun call!40125 () V!29505)

(assert (=> b!901426 (= e!504663 (= call!40125 (minValue!5302 thiss!1181)))))

(declare-fun mapNonEmpty!29293 () Bool)

(declare-fun mapRes!29293 () Bool)

(declare-fun tp!56330 () Bool)

(declare-fun e!504664 () Bool)

(assert (=> mapNonEmpty!29293 (= mapRes!29293 (and tp!56330 e!504664))))

(declare-fun mapRest!29293 () (Array (_ BitVec 32) ValueCell!8721))

(declare-fun mapKey!29293 () (_ BitVec 32))

(declare-fun mapValue!29293 () ValueCell!8721)

(assert (=> mapNonEmpty!29293 (= (arr!25402 (_values!5489 thiss!1181)) (store mapRest!29293 mapKey!29293 mapValue!29293))))

(declare-fun b!901427 () Bool)

(declare-fun e!504662 () Bool)

(declare-fun tp_is_empty!18405 () Bool)

(assert (=> b!901427 (= e!504662 tp_is_empty!18405)))

(declare-fun b!901428 () Bool)

(declare-fun e!504659 () Bool)

(declare-fun call!40126 () V!29505)

(assert (=> b!901428 (= e!504659 (= call!40126 (zeroValue!5302 thiss!1181)))))

(declare-fun b!901429 () Bool)

(assert (=> b!901429 (= e!504664 tp_is_empty!18405)))

(declare-fun b!901430 () Bool)

(assert (=> b!901430 (= e!504660 e!504659)))

(declare-fun res!608620 () Bool)

(assert (=> b!901430 (= res!608620 (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901430 (=> (not res!608620) (not e!504659))))

(declare-fun res!608619 () Bool)

(assert (=> start!77264 (=> (not res!608619) (not e!504653))))

(declare-fun valid!1711 (LongMapFixedSize!4458) Bool)

(assert (=> start!77264 (= res!608619 (valid!1711 thiss!1181))))

(assert (=> start!77264 e!504653))

(declare-fun e!504658 () Bool)

(assert (=> start!77264 e!504658))

(assert (=> start!77264 true))

(declare-fun e!504657 () Bool)

(declare-fun array_inv!19920 (array!52866) Bool)

(declare-fun array_inv!19921 (array!52868) Bool)

(assert (=> b!901431 (= e!504658 (and tp!56331 tp_is_empty!18405 (array_inv!19920 (_keys!10282 thiss!1181)) (array_inv!19921 (_values!5489 thiss!1181)) e!504657))))

(declare-fun b!901432 () Bool)

(assert (=> b!901432 (= e!504657 (and e!504662 mapRes!29293))))

(declare-fun condMapEmpty!29293 () Bool)

(declare-fun mapDefault!29293 () ValueCell!8721)

(assert (=> b!901432 (= condMapEmpty!29293 (= (arr!25402 (_values!5489 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8721)) mapDefault!29293)))))

(declare-fun bm!40122 () Bool)

(assert (=> bm!40122 (= call!40125 call!40126)))

(declare-fun bm!40123 () Bool)

(declare-datatypes ((tuple2!12072 0))(
  ( (tuple2!12073 (_1!6047 (_ BitVec 64)) (_2!6047 V!29505)) )
))
(declare-datatypes ((List!17874 0))(
  ( (Nil!17871) (Cons!17870 (h!19016 tuple2!12072) (t!25237 List!17874)) )
))
(declare-datatypes ((ListLongMap!10769 0))(
  ( (ListLongMap!10770 (toList!5400 List!17874)) )
))
(declare-fun lt!407415 () ListLongMap!10769)

(declare-fun apply!419 (ListLongMap!10769 (_ BitVec 64)) V!29505)

(assert (=> bm!40123 (= call!40126 (apply!419 lt!407415 key!785))))

(declare-fun b!901433 () Bool)

(declare-fun e!504656 () Bool)

(assert (=> b!901433 (= e!504656 (and (bvsge (index!38176 lt!407418) #b00000000000000000000000000000000) (bvslt (index!38176 lt!407418) (size!25861 (_values!5489 thiss!1181)))))))

(assert (=> b!901433 e!504660))

(declare-fun c!95467 () Bool)

(assert (=> b!901433 (= c!95467 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30616 0))(
  ( (Unit!30617) )
))
(declare-fun lt!407416 () Unit!30616)

(declare-fun lemmaKeyInListMapThenSameValueInArray!11 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 64) (_ BitVec 32) Int) Unit!30616)

(assert (=> b!901433 (= lt!407416 (lemmaKeyInListMapThenSameValueInArray!11 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) key!785 (index!38176 lt!407418) (defaultEntry!5469 thiss!1181)))))

(declare-fun contains!4440 (ListLongMap!10769 (_ BitVec 64)) Bool)

(assert (=> b!901433 (contains!4440 lt!407415 (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418)))))

(declare-fun getCurrentListMap!2670 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 32) Int) ListLongMap!10769)

(assert (=> b!901433 (= lt!407415 (getCurrentListMap!2670 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun lt!407419 () Unit!30616)

(declare-fun lemmaValidKeyInArrayIsInListMap!259 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 32) Int) Unit!30616)

(assert (=> b!901433 (= lt!407419 (lemmaValidKeyInArrayIsInListMap!259 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) (index!38176 lt!407418) (defaultEntry!5469 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901433 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407420 () Unit!30616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52866 (_ BitVec 64) (_ BitVec 32)) Unit!30616)

(assert (=> b!901433 (= lt!407420 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10282 thiss!1181) key!785 (index!38176 lt!407418)))))

(declare-fun b!901434 () Bool)

(assert (=> b!901434 (= e!504653 (not e!504656))))

(declare-fun res!608618 () Bool)

(assert (=> b!901434 (=> res!608618 e!504656)))

(get-info :version)

(assert (=> b!901434 (= res!608618 (not ((_ is Found!8951) lt!407418)))))

(assert (=> b!901434 e!504661))

(declare-fun res!608622 () Bool)

(assert (=> b!901434 (=> res!608622 e!504661)))

(assert (=> b!901434 (= res!608622 (not ((_ is Found!8951) lt!407418)))))

(declare-fun lt!407417 () Unit!30616)

(declare-fun lemmaSeekEntryGivesInRangeIndex!110 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 64)) Unit!30616)

(assert (=> b!901434 (= lt!407417 (lemmaSeekEntryGivesInRangeIndex!110 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52866 (_ BitVec 32)) SeekEntryResult!8951)

(assert (=> b!901434 (= lt!407418 (seekEntry!0 key!785 (_keys!10282 thiss!1181) (mask!26279 thiss!1181)))))

(declare-fun mapIsEmpty!29293 () Bool)

(assert (=> mapIsEmpty!29293 mapRes!29293))

(declare-fun b!901435 () Bool)

(declare-fun res!608617 () Bool)

(assert (=> b!901435 (=> (not res!608617) (not e!504663))))

(assert (=> b!901435 (= res!608617 (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!901435 (= e!504654 e!504663)))

(declare-fun b!901436 () Bool)

(declare-fun get!13363 (ValueCell!8721 V!29505) V!29505)

(declare-fun dynLambda!1313 (Int (_ BitVec 64)) V!29505)

(assert (=> b!901436 (= e!504654 (= call!40125 (get!13363 (select (arr!25402 (_values!5489 thiss!1181)) (index!38176 lt!407418)) (dynLambda!1313 (defaultEntry!5469 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77264 res!608619) b!901425))

(assert (= (and b!901425 res!608621) b!901434))

(assert (= (and b!901434 (not res!608622)) b!901424))

(assert (= (and b!901434 (not res!608618)) b!901433))

(assert (= (and b!901433 c!95467) b!901430))

(assert (= (and b!901433 (not c!95467)) b!901423))

(assert (= (and b!901430 res!608620) b!901428))

(assert (= (and b!901423 c!95468) b!901435))

(assert (= (and b!901423 (not c!95468)) b!901436))

(assert (= (and b!901435 res!608617) b!901426))

(assert (= (or b!901426 b!901436) bm!40122))

(assert (= (or b!901428 bm!40122) bm!40123))

(assert (= (and b!901432 condMapEmpty!29293) mapIsEmpty!29293))

(assert (= (and b!901432 (not condMapEmpty!29293)) mapNonEmpty!29293))

(assert (= (and mapNonEmpty!29293 ((_ is ValueCellFull!8721) mapValue!29293)) b!901429))

(assert (= (and b!901432 ((_ is ValueCellFull!8721) mapDefault!29293)) b!901427))

(assert (= b!901431 b!901432))

(assert (= start!77264 b!901431))

(declare-fun b_lambda!13033 () Bool)

(assert (=> (not b_lambda!13033) (not b!901436)))

(declare-fun t!25236 () Bool)

(declare-fun tb!5213 () Bool)

(assert (=> (and b!901431 (= (defaultEntry!5469 thiss!1181) (defaultEntry!5469 thiss!1181)) t!25236) tb!5213))

(declare-fun result!10209 () Bool)

(assert (=> tb!5213 (= result!10209 tp_is_empty!18405)))

(assert (=> b!901436 t!25236))

(declare-fun b_and!26409 () Bool)

(assert (= b_and!26407 (and (=> t!25236 result!10209) b_and!26409)))

(declare-fun m!837687 () Bool)

(assert (=> b!901433 m!837687))

(declare-fun m!837689 () Bool)

(assert (=> b!901433 m!837689))

(declare-fun m!837691 () Bool)

(assert (=> b!901433 m!837691))

(declare-fun m!837693 () Bool)

(assert (=> b!901433 m!837693))

(declare-fun m!837695 () Bool)

(assert (=> b!901433 m!837695))

(assert (=> b!901433 m!837691))

(declare-fun m!837697 () Bool)

(assert (=> b!901433 m!837697))

(declare-fun m!837699 () Bool)

(assert (=> b!901433 m!837699))

(declare-fun m!837701 () Bool)

(assert (=> b!901434 m!837701))

(declare-fun m!837703 () Bool)

(assert (=> b!901434 m!837703))

(declare-fun m!837705 () Bool)

(assert (=> b!901436 m!837705))

(declare-fun m!837707 () Bool)

(assert (=> b!901436 m!837707))

(assert (=> b!901436 m!837705))

(assert (=> b!901436 m!837707))

(declare-fun m!837709 () Bool)

(assert (=> b!901436 m!837709))

(declare-fun m!837711 () Bool)

(assert (=> bm!40123 m!837711))

(declare-fun m!837713 () Bool)

(assert (=> b!901424 m!837713))

(declare-fun m!837715 () Bool)

(assert (=> b!901431 m!837715))

(declare-fun m!837717 () Bool)

(assert (=> b!901431 m!837717))

(declare-fun m!837719 () Bool)

(assert (=> start!77264 m!837719))

(declare-fun m!837721 () Bool)

(assert (=> mapNonEmpty!29293 m!837721))

(check-sat (not start!77264) (not b!901424) (not b!901436) (not bm!40123) (not b!901434) tp_is_empty!18405 (not b_next!16077) b_and!26409 (not mapNonEmpty!29293) (not b!901433) (not b_lambda!13033) (not b!901431))
(check-sat b_and!26409 (not b_next!16077))
(get-model)

(declare-fun b_lambda!13037 () Bool)

(assert (= b_lambda!13033 (or (and b!901431 b_free!16077) b_lambda!13037)))

(check-sat (not b_lambda!13037) (not start!77264) (not b!901424) (not b!901436) (not b!901431) (not bm!40123) (not b!901434) tp_is_empty!18405 (not b_next!16077) b_and!26409 (not mapNonEmpty!29293) (not b!901433))
(check-sat b_and!26409 (not b_next!16077))
(get-model)

(declare-fun d!111829 () Bool)

(declare-fun e!504703 () Bool)

(assert (=> d!111829 e!504703))

(declare-fun res!608643 () Bool)

(assert (=> d!111829 (=> res!608643 e!504703)))

(declare-fun lt!407444 () SeekEntryResult!8951)

(assert (=> d!111829 (= res!608643 (not ((_ is Found!8951) lt!407444)))))

(assert (=> d!111829 (= lt!407444 (seekEntry!0 key!785 (_keys!10282 thiss!1181) (mask!26279 thiss!1181)))))

(declare-fun lt!407443 () Unit!30616)

(declare-fun choose!1520 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 64)) Unit!30616)

(assert (=> d!111829 (= lt!407443 (choose!1520 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111829 (validMask!0 (mask!26279 thiss!1181))))

(assert (=> d!111829 (= (lemmaSeekEntryGivesInRangeIndex!110 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) key!785) lt!407443)))

(declare-fun b!901485 () Bool)

(assert (=> b!901485 (= e!504703 (inRange!0 (index!38176 lt!407444) (mask!26279 thiss!1181)))))

(assert (= (and d!111829 (not res!608643)) b!901485))

(assert (=> d!111829 m!837703))

(declare-fun m!837759 () Bool)

(assert (=> d!111829 m!837759))

(declare-fun m!837761 () Bool)

(assert (=> d!111829 m!837761))

(declare-fun m!837763 () Bool)

(assert (=> b!901485 m!837763))

(assert (=> b!901434 d!111829))

(declare-fun b!901498 () Bool)

(declare-fun c!95482 () Bool)

(declare-fun lt!407455 () (_ BitVec 64))

(assert (=> b!901498 (= c!95482 (= lt!407455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504710 () SeekEntryResult!8951)

(declare-fun e!504712 () SeekEntryResult!8951)

(assert (=> b!901498 (= e!504710 e!504712)))

(declare-fun b!901499 () Bool)

(declare-fun lt!407453 () SeekEntryResult!8951)

(assert (=> b!901499 (= e!504712 (ite ((_ is MissingVacant!8951) lt!407453) (MissingZero!8951 (index!38178 lt!407453)) lt!407453))))

(declare-fun lt!407456 () SeekEntryResult!8951)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52866 (_ BitVec 32)) SeekEntryResult!8951)

(assert (=> b!901499 (= lt!407453 (seekKeyOrZeroReturnVacant!0 (x!76804 lt!407456) (index!38177 lt!407456) (index!38177 lt!407456) key!785 (_keys!10282 thiss!1181) (mask!26279 thiss!1181)))))

(declare-fun b!901500 () Bool)

(assert (=> b!901500 (= e!504710 (Found!8951 (index!38177 lt!407456)))))

(declare-fun b!901501 () Bool)

(declare-fun e!504711 () SeekEntryResult!8951)

(assert (=> b!901501 (= e!504711 e!504710)))

(assert (=> b!901501 (= lt!407455 (select (arr!25401 (_keys!10282 thiss!1181)) (index!38177 lt!407456)))))

(declare-fun c!95481 () Bool)

(assert (=> b!901501 (= c!95481 (= lt!407455 key!785))))

(declare-fun b!901502 () Bool)

(assert (=> b!901502 (= e!504711 Undefined!8951)))

(declare-fun d!111831 () Bool)

(declare-fun lt!407454 () SeekEntryResult!8951)

(assert (=> d!111831 (and (or ((_ is MissingVacant!8951) lt!407454) (not ((_ is Found!8951) lt!407454)) (and (bvsge (index!38176 lt!407454) #b00000000000000000000000000000000) (bvslt (index!38176 lt!407454) (size!25860 (_keys!10282 thiss!1181))))) (not ((_ is MissingVacant!8951) lt!407454)) (or (not ((_ is Found!8951) lt!407454)) (= (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407454)) key!785)))))

(assert (=> d!111831 (= lt!407454 e!504711)))

(declare-fun c!95483 () Bool)

(assert (=> d!111831 (= c!95483 (and ((_ is Intermediate!8951) lt!407456) (undefined!9763 lt!407456)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52866 (_ BitVec 32)) SeekEntryResult!8951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111831 (= lt!407456 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26279 thiss!1181)) key!785 (_keys!10282 thiss!1181) (mask!26279 thiss!1181)))))

(assert (=> d!111831 (validMask!0 (mask!26279 thiss!1181))))

(assert (=> d!111831 (= (seekEntry!0 key!785 (_keys!10282 thiss!1181) (mask!26279 thiss!1181)) lt!407454)))

(declare-fun b!901503 () Bool)

(assert (=> b!901503 (= e!504712 (MissingZero!8951 (index!38177 lt!407456)))))

(assert (= (and d!111831 c!95483) b!901502))

(assert (= (and d!111831 (not c!95483)) b!901501))

(assert (= (and b!901501 c!95481) b!901500))

(assert (= (and b!901501 (not c!95481)) b!901498))

(assert (= (and b!901498 c!95482) b!901503))

(assert (= (and b!901498 (not c!95482)) b!901499))

(declare-fun m!837765 () Bool)

(assert (=> b!901499 m!837765))

(declare-fun m!837767 () Bool)

(assert (=> b!901501 m!837767))

(declare-fun m!837769 () Bool)

(assert (=> d!111831 m!837769))

(declare-fun m!837771 () Bool)

(assert (=> d!111831 m!837771))

(assert (=> d!111831 m!837771))

(declare-fun m!837773 () Bool)

(assert (=> d!111831 m!837773))

(assert (=> d!111831 m!837761))

(assert (=> b!901434 d!111831))

(declare-fun d!111833 () Bool)

(assert (=> d!111833 (= (array_inv!19920 (_keys!10282 thiss!1181)) (bvsge (size!25860 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901431 d!111833))

(declare-fun d!111835 () Bool)

(assert (=> d!111835 (= (array_inv!19921 (_values!5489 thiss!1181)) (bvsge (size!25861 (_values!5489 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901431 d!111835))

(declare-fun d!111837 () Bool)

(declare-fun c!95486 () Bool)

(assert (=> d!111837 (= c!95486 ((_ is ValueCellFull!8721) (select (arr!25402 (_values!5489 thiss!1181)) (index!38176 lt!407418))))))

(declare-fun e!504715 () V!29505)

(assert (=> d!111837 (= (get!13363 (select (arr!25402 (_values!5489 thiss!1181)) (index!38176 lt!407418)) (dynLambda!1313 (defaultEntry!5469 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!504715)))

(declare-fun b!901508 () Bool)

(declare-fun get!13365 (ValueCell!8721 V!29505) V!29505)

(assert (=> b!901508 (= e!504715 (get!13365 (select (arr!25402 (_values!5489 thiss!1181)) (index!38176 lt!407418)) (dynLambda!1313 (defaultEntry!5469 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!901509 () Bool)

(declare-fun get!13366 (ValueCell!8721 V!29505) V!29505)

(assert (=> b!901509 (= e!504715 (get!13366 (select (arr!25402 (_values!5489 thiss!1181)) (index!38176 lt!407418)) (dynLambda!1313 (defaultEntry!5469 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111837 c!95486) b!901508))

(assert (= (and d!111837 (not c!95486)) b!901509))

(assert (=> b!901508 m!837705))

(assert (=> b!901508 m!837707))

(declare-fun m!837775 () Bool)

(assert (=> b!901508 m!837775))

(assert (=> b!901509 m!837705))

(assert (=> b!901509 m!837707))

(declare-fun m!837777 () Bool)

(assert (=> b!901509 m!837777))

(assert (=> b!901436 d!111837))

(declare-fun d!111839 () Bool)

(assert (=> d!111839 (= (inRange!0 (index!38176 lt!407418) (mask!26279 thiss!1181)) (and (bvsge (index!38176 lt!407418) #b00000000000000000000000000000000) (bvslt (index!38176 lt!407418) (bvadd (mask!26279 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901424 d!111839))

(declare-fun d!111841 () Bool)

(declare-datatypes ((Option!471 0))(
  ( (Some!470 (v!11755 V!29505)) (None!469) )
))
(declare-fun get!13367 (Option!471) V!29505)

(declare-fun getValueByKey!465 (List!17874 (_ BitVec 64)) Option!471)

(assert (=> d!111841 (= (apply!419 lt!407415 key!785) (get!13367 (getValueByKey!465 (toList!5400 lt!407415) key!785)))))

(declare-fun bs!25305 () Bool)

(assert (= bs!25305 d!111841))

(declare-fun m!837779 () Bool)

(assert (=> bs!25305 m!837779))

(assert (=> bs!25305 m!837779))

(declare-fun m!837781 () Bool)

(assert (=> bs!25305 m!837781))

(assert (=> bm!40123 d!111841))

(declare-fun b!901524 () Bool)

(declare-fun call!40144 () V!29505)

(declare-fun e!504726 () Bool)

(assert (=> b!901524 (= e!504726 (= call!40144 (get!13363 (select (arr!25402 (_values!5489 thiss!1181)) (index!38176 lt!407418)) (dynLambda!1313 (defaultEntry!5469 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901524 (and (bvsge (index!38176 lt!407418) #b00000000000000000000000000000000) (bvslt (index!38176 lt!407418) (size!25861 (_values!5489 thiss!1181))))))

(declare-fun b!901525 () Bool)

(declare-fun res!608652 () Bool)

(declare-fun e!504729 () Bool)

(assert (=> b!901525 (=> (not res!608652) (not e!504729))))

(assert (=> b!901525 (= res!608652 (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!504728 () Bool)

(assert (=> b!901525 (= e!504728 e!504729)))

(declare-fun bm!40138 () Bool)

(declare-fun call!40142 () V!29505)

(assert (=> bm!40138 (= call!40144 call!40142)))

(declare-fun d!111843 () Bool)

(declare-fun e!504727 () Bool)

(assert (=> d!111843 e!504727))

(declare-fun c!95492 () Bool)

(assert (=> d!111843 (= c!95492 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407459 () Unit!30616)

(declare-fun choose!1521 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 64) (_ BitVec 32) Int) Unit!30616)

(assert (=> d!111843 (= lt!407459 (choose!1521 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) key!785 (index!38176 lt!407418) (defaultEntry!5469 thiss!1181)))))

(assert (=> d!111843 (validMask!0 (mask!26279 thiss!1181))))

(assert (=> d!111843 (= (lemmaKeyInListMapThenSameValueInArray!11 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) key!785 (index!38176 lt!407418) (defaultEntry!5469 thiss!1181)) lt!407459)))

(declare-fun bm!40139 () Bool)

(declare-fun call!40143 () ListLongMap!10769)

(declare-fun call!40141 () ListLongMap!10769)

(assert (=> bm!40139 (= call!40143 call!40141)))

(declare-fun b!901526 () Bool)

(assert (=> b!901526 (= e!504729 (= call!40144 (minValue!5302 thiss!1181)))))

(declare-fun b!901527 () Bool)

(declare-fun e!504730 () Bool)

(assert (=> b!901527 (= e!504730 (= call!40142 (zeroValue!5302 thiss!1181)))))

(declare-fun b!901528 () Bool)

(assert (=> b!901528 (= e!504727 e!504728)))

(declare-fun c!95491 () Bool)

(assert (=> b!901528 (= c!95491 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40140 () Bool)

(assert (=> bm!40140 (= call!40141 (getCurrentListMap!2670 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun b!901529 () Bool)

(assert (=> b!901529 (= e!504727 e!504730)))

(declare-fun res!608651 () Bool)

(assert (=> b!901529 (= res!608651 (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901529 (=> (not res!608651) (not e!504730))))

(declare-fun b!901530 () Bool)

(declare-fun res!608650 () Bool)

(assert (=> b!901530 (=> (not res!608650) (not e!504726))))

(assert (=> b!901530 (= res!608650 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!901530 (= e!504728 e!504726)))

(declare-fun bm!40141 () Bool)

(assert (=> bm!40141 (= call!40142 (apply!419 (ite c!95492 call!40141 call!40143) key!785))))

(assert (= (and d!111843 c!95492) b!901529))

(assert (= (and d!111843 (not c!95492)) b!901528))

(assert (= (and b!901529 res!608651) b!901527))

(assert (= (and b!901528 c!95491) b!901525))

(assert (= (and b!901528 (not c!95491)) b!901530))

(assert (= (and b!901525 res!608652) b!901526))

(assert (= (and b!901530 res!608650) b!901524))

(assert (= (or b!901526 b!901524) bm!40139))

(assert (= (or b!901526 b!901524) bm!40138))

(assert (= (or b!901527 bm!40139) bm!40140))

(assert (= (or b!901527 bm!40138) bm!40141))

(declare-fun b_lambda!13039 () Bool)

(assert (=> (not b_lambda!13039) (not b!901524)))

(assert (=> b!901524 t!25236))

(declare-fun b_and!26415 () Bool)

(assert (= b_and!26409 (and (=> t!25236 result!10209) b_and!26415)))

(declare-fun m!837783 () Bool)

(assert (=> bm!40141 m!837783))

(declare-fun m!837785 () Bool)

(assert (=> d!111843 m!837785))

(assert (=> d!111843 m!837761))

(assert (=> b!901524 m!837705))

(assert (=> b!901524 m!837707))

(assert (=> b!901524 m!837705))

(assert (=> b!901524 m!837707))

(assert (=> b!901524 m!837709))

(assert (=> b!901530 m!837697))

(assert (=> bm!40140 m!837695))

(assert (=> b!901433 d!111843))

(declare-fun d!111845 () Bool)

(assert (=> d!111845 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407462 () Unit!30616)

(declare-fun choose!13 (array!52866 (_ BitVec 64) (_ BitVec 32)) Unit!30616)

(assert (=> d!111845 (= lt!407462 (choose!13 (_keys!10282 thiss!1181) key!785 (index!38176 lt!407418)))))

(assert (=> d!111845 (bvsge (index!38176 lt!407418) #b00000000000000000000000000000000)))

(assert (=> d!111845 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10282 thiss!1181) key!785 (index!38176 lt!407418)) lt!407462)))

(declare-fun bs!25306 () Bool)

(assert (= bs!25306 d!111845))

(assert (=> bs!25306 m!837697))

(declare-fun m!837787 () Bool)

(assert (=> bs!25306 m!837787))

(assert (=> b!901433 d!111845))

(declare-fun d!111847 () Bool)

(declare-fun e!504733 () Bool)

(assert (=> d!111847 e!504733))

(declare-fun res!608655 () Bool)

(assert (=> d!111847 (=> (not res!608655) (not e!504733))))

(assert (=> d!111847 (= res!608655 (and (bvsge (index!38176 lt!407418) #b00000000000000000000000000000000) (bvslt (index!38176 lt!407418) (size!25860 (_keys!10282 thiss!1181)))))))

(declare-fun lt!407465 () Unit!30616)

(declare-fun choose!1522 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 32) Int) Unit!30616)

(assert (=> d!111847 (= lt!407465 (choose!1522 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) (index!38176 lt!407418) (defaultEntry!5469 thiss!1181)))))

(assert (=> d!111847 (validMask!0 (mask!26279 thiss!1181))))

(assert (=> d!111847 (= (lemmaValidKeyInArrayIsInListMap!259 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) (index!38176 lt!407418) (defaultEntry!5469 thiss!1181)) lt!407465)))

(declare-fun b!901533 () Bool)

(assert (=> b!901533 (= e!504733 (contains!4440 (getCurrentListMap!2670 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)) (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418))))))

(assert (= (and d!111847 res!608655) b!901533))

(declare-fun m!837789 () Bool)

(assert (=> d!111847 m!837789))

(assert (=> d!111847 m!837761))

(assert (=> b!901533 m!837695))

(assert (=> b!901533 m!837691))

(assert (=> b!901533 m!837695))

(assert (=> b!901533 m!837691))

(declare-fun m!837791 () Bool)

(assert (=> b!901533 m!837791))

(assert (=> b!901433 d!111847))

(declare-fun d!111849 () Bool)

(declare-fun e!504738 () Bool)

(assert (=> d!111849 e!504738))

(declare-fun res!608658 () Bool)

(assert (=> d!111849 (=> res!608658 e!504738)))

(declare-fun lt!407477 () Bool)

(assert (=> d!111849 (= res!608658 (not lt!407477))))

(declare-fun lt!407474 () Bool)

(assert (=> d!111849 (= lt!407477 lt!407474)))

(declare-fun lt!407475 () Unit!30616)

(declare-fun e!504739 () Unit!30616)

(assert (=> d!111849 (= lt!407475 e!504739)))

(declare-fun c!95495 () Bool)

(assert (=> d!111849 (= c!95495 lt!407474)))

(declare-fun containsKey!434 (List!17874 (_ BitVec 64)) Bool)

(assert (=> d!111849 (= lt!407474 (containsKey!434 (toList!5400 lt!407415) (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418))))))

(assert (=> d!111849 (= (contains!4440 lt!407415 (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418))) lt!407477)))

(declare-fun b!901540 () Bool)

(declare-fun lt!407476 () Unit!30616)

(assert (=> b!901540 (= e!504739 lt!407476)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!330 (List!17874 (_ BitVec 64)) Unit!30616)

(assert (=> b!901540 (= lt!407476 (lemmaContainsKeyImpliesGetValueByKeyDefined!330 (toList!5400 lt!407415) (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418))))))

(declare-fun isDefined!339 (Option!471) Bool)

(assert (=> b!901540 (isDefined!339 (getValueByKey!465 (toList!5400 lt!407415) (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418))))))

(declare-fun b!901541 () Bool)

(declare-fun Unit!30620 () Unit!30616)

(assert (=> b!901541 (= e!504739 Unit!30620)))

(declare-fun b!901542 () Bool)

(assert (=> b!901542 (= e!504738 (isDefined!339 (getValueByKey!465 (toList!5400 lt!407415) (select (arr!25401 (_keys!10282 thiss!1181)) (index!38176 lt!407418)))))))

(assert (= (and d!111849 c!95495) b!901540))

(assert (= (and d!111849 (not c!95495)) b!901541))

(assert (= (and d!111849 (not res!608658)) b!901542))

(assert (=> d!111849 m!837691))

(declare-fun m!837793 () Bool)

(assert (=> d!111849 m!837793))

(assert (=> b!901540 m!837691))

(declare-fun m!837795 () Bool)

(assert (=> b!901540 m!837795))

(assert (=> b!901540 m!837691))

(declare-fun m!837797 () Bool)

(assert (=> b!901540 m!837797))

(assert (=> b!901540 m!837797))

(declare-fun m!837799 () Bool)

(assert (=> b!901540 m!837799))

(assert (=> b!901542 m!837691))

(assert (=> b!901542 m!837797))

(assert (=> b!901542 m!837797))

(assert (=> b!901542 m!837799))

(assert (=> b!901433 d!111849))

(declare-fun d!111851 () Bool)

(declare-fun res!608663 () Bool)

(declare-fun e!504744 () Bool)

(assert (=> d!111851 (=> res!608663 e!504744)))

(assert (=> d!111851 (= res!608663 (= (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111851 (= (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000) e!504744)))

(declare-fun b!901547 () Bool)

(declare-fun e!504745 () Bool)

(assert (=> b!901547 (= e!504744 e!504745)))

(declare-fun res!608664 () Bool)

(assert (=> b!901547 (=> (not res!608664) (not e!504745))))

(assert (=> b!901547 (= res!608664 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25860 (_keys!10282 thiss!1181))))))

(declare-fun b!901548 () Bool)

(assert (=> b!901548 (= e!504745 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111851 (not res!608663)) b!901547))

(assert (= (and b!901547 res!608664) b!901548))

(declare-fun m!837801 () Bool)

(assert (=> d!111851 m!837801))

(declare-fun m!837803 () Bool)

(assert (=> b!901548 m!837803))

(assert (=> b!901433 d!111851))

(declare-fun bm!40156 () Bool)

(declare-fun call!40163 () ListLongMap!10769)

(declare-fun call!40164 () ListLongMap!10769)

(assert (=> bm!40156 (= call!40163 call!40164)))

(declare-fun b!901591 () Bool)

(declare-fun e!504782 () Bool)

(declare-fun call!40161 () Bool)

(assert (=> b!901591 (= e!504782 (not call!40161))))

(declare-fun b!901592 () Bool)

(declare-fun e!504773 () Unit!30616)

(declare-fun lt!407531 () Unit!30616)

(assert (=> b!901592 (= e!504773 lt!407531)))

(declare-fun lt!407537 () ListLongMap!10769)

(declare-fun getCurrentListMapNoExtraKeys!3287 (array!52866 array!52868 (_ BitVec 32) (_ BitVec 32) V!29505 V!29505 (_ BitVec 32) Int) ListLongMap!10769)

(assert (=> b!901592 (= lt!407537 (getCurrentListMapNoExtraKeys!3287 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun lt!407524 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407523 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407523 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407539 () Unit!30616)

(declare-fun addStillContains!341 (ListLongMap!10769 (_ BitVec 64) V!29505 (_ BitVec 64)) Unit!30616)

(assert (=> b!901592 (= lt!407539 (addStillContains!341 lt!407537 lt!407524 (zeroValue!5302 thiss!1181) lt!407523))))

(declare-fun +!2600 (ListLongMap!10769 tuple2!12072) ListLongMap!10769)

(assert (=> b!901592 (contains!4440 (+!2600 lt!407537 (tuple2!12073 lt!407524 (zeroValue!5302 thiss!1181))) lt!407523)))

(declare-fun lt!407542 () Unit!30616)

(assert (=> b!901592 (= lt!407542 lt!407539)))

(declare-fun lt!407528 () ListLongMap!10769)

(assert (=> b!901592 (= lt!407528 (getCurrentListMapNoExtraKeys!3287 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun lt!407540 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407540 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407529 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407529 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407525 () Unit!30616)

(declare-fun addApplyDifferent!341 (ListLongMap!10769 (_ BitVec 64) V!29505 (_ BitVec 64)) Unit!30616)

(assert (=> b!901592 (= lt!407525 (addApplyDifferent!341 lt!407528 lt!407540 (minValue!5302 thiss!1181) lt!407529))))

(assert (=> b!901592 (= (apply!419 (+!2600 lt!407528 (tuple2!12073 lt!407540 (minValue!5302 thiss!1181))) lt!407529) (apply!419 lt!407528 lt!407529))))

(declare-fun lt!407536 () Unit!30616)

(assert (=> b!901592 (= lt!407536 lt!407525)))

(declare-fun lt!407538 () ListLongMap!10769)

(assert (=> b!901592 (= lt!407538 (getCurrentListMapNoExtraKeys!3287 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun lt!407533 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407541 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407541 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407526 () Unit!30616)

(assert (=> b!901592 (= lt!407526 (addApplyDifferent!341 lt!407538 lt!407533 (zeroValue!5302 thiss!1181) lt!407541))))

(assert (=> b!901592 (= (apply!419 (+!2600 lt!407538 (tuple2!12073 lt!407533 (zeroValue!5302 thiss!1181))) lt!407541) (apply!419 lt!407538 lt!407541))))

(declare-fun lt!407534 () Unit!30616)

(assert (=> b!901592 (= lt!407534 lt!407526)))

(declare-fun lt!407543 () ListLongMap!10769)

(assert (=> b!901592 (= lt!407543 (getCurrentListMapNoExtraKeys!3287 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun lt!407535 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407535 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407530 () (_ BitVec 64))

(assert (=> b!901592 (= lt!407530 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901592 (= lt!407531 (addApplyDifferent!341 lt!407543 lt!407535 (minValue!5302 thiss!1181) lt!407530))))

(assert (=> b!901592 (= (apply!419 (+!2600 lt!407543 (tuple2!12073 lt!407535 (minValue!5302 thiss!1181))) lt!407530) (apply!419 lt!407543 lt!407530))))

(declare-fun d!111853 () Bool)

(declare-fun e!504778 () Bool)

(assert (=> d!111853 e!504778))

(declare-fun res!608683 () Bool)

(assert (=> d!111853 (=> (not res!608683) (not e!504778))))

(assert (=> d!111853 (= res!608683 (or (bvsge #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))))))))

(declare-fun lt!407522 () ListLongMap!10769)

(declare-fun lt!407532 () ListLongMap!10769)

(assert (=> d!111853 (= lt!407522 lt!407532)))

(declare-fun lt!407527 () Unit!30616)

(assert (=> d!111853 (= lt!407527 e!504773)))

(declare-fun c!95513 () Bool)

(declare-fun e!504783 () Bool)

(assert (=> d!111853 (= c!95513 e!504783)))

(declare-fun res!608689 () Bool)

(assert (=> d!111853 (=> (not res!608689) (not e!504783))))

(assert (=> d!111853 (= res!608689 (bvslt #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))))))

(declare-fun e!504774 () ListLongMap!10769)

(assert (=> d!111853 (= lt!407532 e!504774)))

(declare-fun c!95509 () Bool)

(assert (=> d!111853 (= c!95509 (and (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111853 (validMask!0 (mask!26279 thiss!1181))))

(assert (=> d!111853 (= (getCurrentListMap!2670 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)) lt!407522)))

(declare-fun b!901593 () Bool)

(assert (=> b!901593 (= e!504778 e!504782)))

(declare-fun c!95511 () Bool)

(assert (=> b!901593 (= c!95511 (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901594 () Bool)

(declare-fun call!40162 () ListLongMap!10769)

(assert (=> b!901594 (= e!504774 (+!2600 call!40162 (tuple2!12073 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5302 thiss!1181))))))

(declare-fun b!901595 () Bool)

(declare-fun res!608685 () Bool)

(assert (=> b!901595 (=> (not res!608685) (not e!504778))))

(declare-fun e!504775 () Bool)

(assert (=> b!901595 (= res!608685 e!504775)))

(declare-fun c!95508 () Bool)

(assert (=> b!901595 (= c!95508 (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40157 () Bool)

(declare-fun call!40159 () Bool)

(assert (=> bm!40157 (= call!40159 (contains!4440 lt!407522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40158 () Bool)

(declare-fun c!95510 () Bool)

(declare-fun call!40160 () ListLongMap!10769)

(assert (=> bm!40158 (= call!40162 (+!2600 (ite c!95509 call!40164 (ite c!95510 call!40163 call!40160)) (ite (or c!95509 c!95510) (tuple2!12073 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5302 thiss!1181)) (tuple2!12073 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5302 thiss!1181)))))))

(declare-fun b!901596 () Bool)

(declare-fun e!504779 () ListLongMap!10769)

(declare-fun call!40165 () ListLongMap!10769)

(assert (=> b!901596 (= e!504779 call!40165)))

(declare-fun b!901597 () Bool)

(declare-fun e!504772 () ListLongMap!10769)

(assert (=> b!901597 (= e!504774 e!504772)))

(assert (=> b!901597 (= c!95510 (and (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901598 () Bool)

(declare-fun c!95512 () Bool)

(assert (=> b!901598 (= c!95512 (and (not (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5198 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901598 (= e!504772 e!504779)))

(declare-fun bm!40159 () Bool)

(assert (=> bm!40159 (= call!40160 call!40163)))

(declare-fun b!901599 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901599 (= e!504783 (validKeyInArray!0 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901600 () Bool)

(declare-fun e!504784 () Bool)

(assert (=> b!901600 (= e!504784 (= (apply!419 lt!407522 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)) (get!13363 (select (arr!25402 (_values!5489 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5469 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25861 (_values!5489 thiss!1181))))))

(assert (=> b!901600 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))))))

(declare-fun b!901601 () Bool)

(assert (=> b!901601 (= e!504775 (not call!40159))))

(declare-fun b!901602 () Bool)

(declare-fun e!504781 () Bool)

(assert (=> b!901602 (= e!504781 (validKeyInArray!0 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40160 () Bool)

(assert (=> bm!40160 (= call!40165 call!40162)))

(declare-fun b!901603 () Bool)

(declare-fun e!504780 () Bool)

(assert (=> b!901603 (= e!504782 e!504780)))

(declare-fun res!608687 () Bool)

(assert (=> b!901603 (= res!608687 call!40161)))

(assert (=> b!901603 (=> (not res!608687) (not e!504780))))

(declare-fun bm!40161 () Bool)

(assert (=> bm!40161 (= call!40161 (contains!4440 lt!407522 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901604 () Bool)

(assert (=> b!901604 (= e!504779 call!40160)))

(declare-fun b!901605 () Bool)

(assert (=> b!901605 (= e!504780 (= (apply!419 lt!407522 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5302 thiss!1181)))))

(declare-fun b!901606 () Bool)

(declare-fun Unit!30621 () Unit!30616)

(assert (=> b!901606 (= e!504773 Unit!30621)))

(declare-fun b!901607 () Bool)

(assert (=> b!901607 (= e!504772 call!40165)))

(declare-fun b!901608 () Bool)

(declare-fun e!504776 () Bool)

(assert (=> b!901608 (= e!504776 (= (apply!419 lt!407522 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5302 thiss!1181)))))

(declare-fun bm!40162 () Bool)

(assert (=> bm!40162 (= call!40164 (getCurrentListMapNoExtraKeys!3287 (_keys!10282 thiss!1181) (_values!5489 thiss!1181) (mask!26279 thiss!1181) (extraKeys!5198 thiss!1181) (zeroValue!5302 thiss!1181) (minValue!5302 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5469 thiss!1181)))))

(declare-fun b!901609 () Bool)

(assert (=> b!901609 (= e!504775 e!504776)))

(declare-fun res!608686 () Bool)

(assert (=> b!901609 (= res!608686 call!40159)))

(assert (=> b!901609 (=> (not res!608686) (not e!504776))))

(declare-fun b!901610 () Bool)

(declare-fun e!504777 () Bool)

(assert (=> b!901610 (= e!504777 e!504784)))

(declare-fun res!608688 () Bool)

(assert (=> b!901610 (=> (not res!608688) (not e!504784))))

(assert (=> b!901610 (= res!608688 (contains!4440 lt!407522 (select (arr!25401 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))))))

(declare-fun b!901611 () Bool)

(declare-fun res!608691 () Bool)

(assert (=> b!901611 (=> (not res!608691) (not e!504778))))

(assert (=> b!901611 (= res!608691 e!504777)))

(declare-fun res!608684 () Bool)

(assert (=> b!901611 (=> res!608684 e!504777)))

(assert (=> b!901611 (= res!608684 (not e!504781))))

(declare-fun res!608690 () Bool)

(assert (=> b!901611 (=> (not res!608690) (not e!504781))))

(assert (=> b!901611 (= res!608690 (bvslt #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))))))

(assert (= (and d!111853 c!95509) b!901594))

(assert (= (and d!111853 (not c!95509)) b!901597))

(assert (= (and b!901597 c!95510) b!901607))

(assert (= (and b!901597 (not c!95510)) b!901598))

(assert (= (and b!901598 c!95512) b!901596))

(assert (= (and b!901598 (not c!95512)) b!901604))

(assert (= (or b!901596 b!901604) bm!40159))

(assert (= (or b!901607 bm!40159) bm!40156))

(assert (= (or b!901607 b!901596) bm!40160))

(assert (= (or b!901594 bm!40156) bm!40162))

(assert (= (or b!901594 bm!40160) bm!40158))

(assert (= (and d!111853 res!608689) b!901599))

(assert (= (and d!111853 c!95513) b!901592))

(assert (= (and d!111853 (not c!95513)) b!901606))

(assert (= (and d!111853 res!608683) b!901611))

(assert (= (and b!901611 res!608690) b!901602))

(assert (= (and b!901611 (not res!608684)) b!901610))

(assert (= (and b!901610 res!608688) b!901600))

(assert (= (and b!901611 res!608691) b!901595))

(assert (= (and b!901595 c!95508) b!901609))

(assert (= (and b!901595 (not c!95508)) b!901601))

(assert (= (and b!901609 res!608686) b!901608))

(assert (= (or b!901609 b!901601) bm!40157))

(assert (= (and b!901595 res!608685) b!901593))

(assert (= (and b!901593 c!95511) b!901603))

(assert (= (and b!901593 (not c!95511)) b!901591))

(assert (= (and b!901603 res!608687) b!901605))

(assert (= (or b!901603 b!901591) bm!40161))

(declare-fun b_lambda!13041 () Bool)

(assert (=> (not b_lambda!13041) (not b!901600)))

(assert (=> b!901600 t!25236))

(declare-fun b_and!26417 () Bool)

(assert (= b_and!26415 (and (=> t!25236 result!10209) b_and!26417)))

(assert (=> b!901599 m!837801))

(assert (=> b!901599 m!837801))

(declare-fun m!837805 () Bool)

(assert (=> b!901599 m!837805))

(declare-fun m!837807 () Bool)

(assert (=> bm!40158 m!837807))

(declare-fun m!837809 () Bool)

(assert (=> b!901594 m!837809))

(declare-fun m!837811 () Bool)

(assert (=> bm!40157 m!837811))

(declare-fun m!837813 () Bool)

(assert (=> b!901592 m!837813))

(declare-fun m!837815 () Bool)

(assert (=> b!901592 m!837815))

(declare-fun m!837817 () Bool)

(assert (=> b!901592 m!837817))

(declare-fun m!837819 () Bool)

(assert (=> b!901592 m!837819))

(declare-fun m!837821 () Bool)

(assert (=> b!901592 m!837821))

(declare-fun m!837823 () Bool)

(assert (=> b!901592 m!837823))

(assert (=> b!901592 m!837813))

(declare-fun m!837825 () Bool)

(assert (=> b!901592 m!837825))

(declare-fun m!837827 () Bool)

(assert (=> b!901592 m!837827))

(declare-fun m!837829 () Bool)

(assert (=> b!901592 m!837829))

(assert (=> b!901592 m!837821))

(declare-fun m!837831 () Bool)

(assert (=> b!901592 m!837831))

(assert (=> b!901592 m!837801))

(declare-fun m!837833 () Bool)

(assert (=> b!901592 m!837833))

(declare-fun m!837835 () Bool)

(assert (=> b!901592 m!837835))

(declare-fun m!837837 () Bool)

(assert (=> b!901592 m!837837))

(assert (=> b!901592 m!837827))

(declare-fun m!837839 () Bool)

(assert (=> b!901592 m!837839))

(declare-fun m!837841 () Bool)

(assert (=> b!901592 m!837841))

(declare-fun m!837843 () Bool)

(assert (=> b!901592 m!837843))

(assert (=> b!901592 m!837815))

(declare-fun m!837845 () Bool)

(assert (=> b!901608 m!837845))

(assert (=> b!901610 m!837801))

(assert (=> b!901610 m!837801))

(declare-fun m!837847 () Bool)

(assert (=> b!901610 m!837847))

(assert (=> d!111853 m!837761))

(assert (=> bm!40162 m!837841))

(declare-fun m!837849 () Bool)

(assert (=> b!901605 m!837849))

(assert (=> b!901602 m!837801))

(assert (=> b!901602 m!837801))

(assert (=> b!901602 m!837805))

(declare-fun m!837851 () Bool)

(assert (=> b!901600 m!837851))

(assert (=> b!901600 m!837707))

(declare-fun m!837853 () Bool)

(assert (=> b!901600 m!837853))

(assert (=> b!901600 m!837851))

(assert (=> b!901600 m!837707))

(assert (=> b!901600 m!837801))

(declare-fun m!837855 () Bool)

(assert (=> b!901600 m!837855))

(assert (=> b!901600 m!837801))

(declare-fun m!837857 () Bool)

(assert (=> bm!40161 m!837857))

(assert (=> b!901433 d!111853))

(declare-fun d!111855 () Bool)

(declare-fun res!608698 () Bool)

(declare-fun e!504787 () Bool)

(assert (=> d!111855 (=> (not res!608698) (not e!504787))))

(declare-fun simpleValid!333 (LongMapFixedSize!4458) Bool)

(assert (=> d!111855 (= res!608698 (simpleValid!333 thiss!1181))))

(assert (=> d!111855 (= (valid!1711 thiss!1181) e!504787)))

(declare-fun b!901618 () Bool)

(declare-fun res!608699 () Bool)

(assert (=> b!901618 (=> (not res!608699) (not e!504787))))

(declare-fun arrayCountValidKeys!0 (array!52866 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901618 (= res!608699 (= (arrayCountValidKeys!0 (_keys!10282 thiss!1181) #b00000000000000000000000000000000 (size!25860 (_keys!10282 thiss!1181))) (_size!2284 thiss!1181)))))

(declare-fun b!901619 () Bool)

(declare-fun res!608700 () Bool)

(assert (=> b!901619 (=> (not res!608700) (not e!504787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52866 (_ BitVec 32)) Bool)

(assert (=> b!901619 (= res!608700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10282 thiss!1181) (mask!26279 thiss!1181)))))

(declare-fun b!901620 () Bool)

(declare-datatypes ((List!17876 0))(
  ( (Nil!17873) (Cons!17872 (h!19018 (_ BitVec 64)) (t!25241 List!17876)) )
))
(declare-fun arrayNoDuplicates!0 (array!52866 (_ BitVec 32) List!17876) Bool)

(assert (=> b!901620 (= e!504787 (arrayNoDuplicates!0 (_keys!10282 thiss!1181) #b00000000000000000000000000000000 Nil!17873))))

(assert (= (and d!111855 res!608698) b!901618))

(assert (= (and b!901618 res!608699) b!901619))

(assert (= (and b!901619 res!608700) b!901620))

(declare-fun m!837859 () Bool)

(assert (=> d!111855 m!837859))

(declare-fun m!837861 () Bool)

(assert (=> b!901618 m!837861))

(declare-fun m!837863 () Bool)

(assert (=> b!901619 m!837863))

(declare-fun m!837865 () Bool)

(assert (=> b!901620 m!837865))

(assert (=> start!77264 d!111855))

(declare-fun b!901627 () Bool)

(declare-fun e!504792 () Bool)

(assert (=> b!901627 (= e!504792 tp_is_empty!18405)))

(declare-fun mapIsEmpty!29299 () Bool)

(declare-fun mapRes!29299 () Bool)

(assert (=> mapIsEmpty!29299 mapRes!29299))

(declare-fun b!901628 () Bool)

(declare-fun e!504793 () Bool)

(assert (=> b!901628 (= e!504793 tp_is_empty!18405)))

(declare-fun condMapEmpty!29299 () Bool)

(declare-fun mapDefault!29299 () ValueCell!8721)

(assert (=> mapNonEmpty!29293 (= condMapEmpty!29299 (= mapRest!29293 ((as const (Array (_ BitVec 32) ValueCell!8721)) mapDefault!29299)))))

(assert (=> mapNonEmpty!29293 (= tp!56330 (and e!504793 mapRes!29299))))

(declare-fun mapNonEmpty!29299 () Bool)

(declare-fun tp!56340 () Bool)

(assert (=> mapNonEmpty!29299 (= mapRes!29299 (and tp!56340 e!504792))))

(declare-fun mapKey!29299 () (_ BitVec 32))

(declare-fun mapRest!29299 () (Array (_ BitVec 32) ValueCell!8721))

(declare-fun mapValue!29299 () ValueCell!8721)

(assert (=> mapNonEmpty!29299 (= mapRest!29293 (store mapRest!29299 mapKey!29299 mapValue!29299))))

(assert (= (and mapNonEmpty!29293 condMapEmpty!29299) mapIsEmpty!29299))

(assert (= (and mapNonEmpty!29293 (not condMapEmpty!29299)) mapNonEmpty!29299))

(assert (= (and mapNonEmpty!29299 ((_ is ValueCellFull!8721) mapValue!29299)) b!901627))

(assert (= (and mapNonEmpty!29293 ((_ is ValueCellFull!8721) mapDefault!29299)) b!901628))

(declare-fun m!837867 () Bool)

(assert (=> mapNonEmpty!29299 m!837867))

(declare-fun b_lambda!13043 () Bool)

(assert (= b_lambda!13039 (or (and b!901431 b_free!16077) b_lambda!13043)))

(declare-fun b_lambda!13045 () Bool)

(assert (= b_lambda!13041 (or (and b!901431 b_free!16077) b_lambda!13045)))

(check-sat (not b!901610) (not b_lambda!13037) (not b!901533) (not b!901485) (not b!901620) (not b!901605) (not b!901619) (not bm!40141) (not b!901602) (not b!901524) (not b!901592) (not b_next!16077) (not b!901594) (not b!901542) (not bm!40140) (not b!901508) (not b_lambda!13043) b_and!26417 (not b!901600) (not bm!40158) (not b!901499) (not mapNonEmpty!29299) (not d!111843) (not b!901599) (not bm!40162) (not d!111847) (not d!111855) (not bm!40161) (not d!111853) (not d!111845) (not b!901608) (not bm!40157) (not b!901618) (not b!901540) (not d!111841) (not b_lambda!13045) (not b!901530) (not b!901509) (not d!111829) (not d!111831) tp_is_empty!18405 (not d!111849) (not b!901548))
(check-sat b_and!26417 (not b_next!16077))
