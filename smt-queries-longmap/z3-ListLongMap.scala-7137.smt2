; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90572 () Bool)

(assert start!90572)

(declare-fun b!1035733 () Bool)

(declare-fun b_free!20875 () Bool)

(declare-fun b_next!20875 () Bool)

(assert (=> b!1035733 (= b_free!20875 (not b_next!20875))))

(declare-fun tp!73758 () Bool)

(declare-fun b_and!33349 () Bool)

(assert (=> b!1035733 (= tp!73758 b_and!33349)))

(declare-fun b!1035727 () Bool)

(declare-fun e!585727 () Bool)

(declare-fun e!585723 () Bool)

(assert (=> b!1035727 (= e!585727 (not e!585723))))

(declare-fun res!691504 () Bool)

(assert (=> b!1035727 (=> (not res!691504) (not e!585723))))

(declare-datatypes ((V!37667 0))(
  ( (V!37668 (val!12348 Int)) )
))
(declare-datatypes ((ValueCell!11594 0))(
  ( (ValueCellFull!11594 (v!14927 V!37667)) (EmptyCell!11594) )
))
(declare-datatypes ((array!65227 0))(
  ( (array!65228 (arr!31398 (Array (_ BitVec 32) (_ BitVec 64))) (size!31928 (_ BitVec 32))) )
))
(declare-datatypes ((array!65229 0))(
  ( (array!65230 (arr!31399 (Array (_ BitVec 32) ValueCell!11594)) (size!31929 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5782 0))(
  ( (LongMapFixedSize!5783 (defaultEntry!6269 Int) (mask!30165 (_ BitVec 32)) (extraKeys!5999 (_ BitVec 32)) (zeroValue!6103 V!37667) (minValue!6105 V!37667) (_size!2946 (_ BitVec 32)) (_keys!11454 array!65227) (_values!6292 array!65229) (_vacant!2946 (_ BitVec 32))) )
))
(declare-fun lt!456581 () LongMapFixedSize!5782)

(declare-fun valid!2172 (LongMapFixedSize!5782) Bool)

(assert (=> b!1035727 (= res!691504 (valid!2172 lt!456581))))

(declare-fun thiss!1427 () LongMapFixedSize!5782)

(declare-fun lt!456582 () V!37667)

(assert (=> b!1035727 (= lt!456581 (LongMapFixedSize!5783 (defaultEntry!6269 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 (_size!2946 thiss!1427) (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (_vacant!2946 thiss!1427)))))

(declare-datatypes ((tuple2!15810 0))(
  ( (tuple2!15811 (_1!7916 (_ BitVec 64)) (_2!7916 V!37667)) )
))
(declare-datatypes ((List!21952 0))(
  ( (Nil!21949) (Cons!21948 (h!23150 tuple2!15810) (t!31148 List!21952)) )
))
(declare-datatypes ((ListLongMap!13833 0))(
  ( (ListLongMap!13834 (toList!6932 List!21952)) )
))
(declare-fun -!524 (ListLongMap!13833 (_ BitVec 64)) ListLongMap!13833)

(declare-fun getCurrentListMap!3898 (array!65227 array!65229 (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 (_ BitVec 32) Int) ListLongMap!13833)

(assert (=> b!1035727 (= (-!524 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-datatypes ((Unit!33774 0))(
  ( (Unit!33775) )
))
(declare-fun lt!456583 () Unit!33774)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!9 (array!65227 array!65229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 V!37667 Int) Unit!33774)

(assert (=> b!1035727 (= lt!456583 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!9 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!456582 (defaultEntry!6269 thiss!1427)))))

(declare-fun dynLambda!1985 (Int (_ BitVec 64)) V!37667)

(assert (=> b!1035727 (= lt!456582 (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!691502 () Bool)

(assert (=> start!90572 (=> (not res!691502) (not e!585727))))

(assert (=> start!90572 (= res!691502 (valid!2172 thiss!1427))))

(assert (=> start!90572 e!585727))

(declare-fun e!585724 () Bool)

(assert (=> start!90572 e!585724))

(assert (=> start!90572 true))

(declare-fun mapIsEmpty!38409 () Bool)

(declare-fun mapRes!38409 () Bool)

(assert (=> mapIsEmpty!38409 mapRes!38409))

(declare-fun b!1035728 () Bool)

(declare-fun e!585725 () Bool)

(declare-fun e!585729 () Bool)

(assert (=> b!1035728 (= e!585725 (and e!585729 mapRes!38409))))

(declare-fun condMapEmpty!38409 () Bool)

(declare-fun mapDefault!38409 () ValueCell!11594)

(assert (=> b!1035728 (= condMapEmpty!38409 (= (arr!31399 (_values!6292 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38409)))))

(declare-fun mapNonEmpty!38409 () Bool)

(declare-fun tp!73759 () Bool)

(declare-fun e!585728 () Bool)

(assert (=> mapNonEmpty!38409 (= mapRes!38409 (and tp!73759 e!585728))))

(declare-fun mapRest!38409 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapKey!38409 () (_ BitVec 32))

(declare-fun mapValue!38409 () ValueCell!11594)

(assert (=> mapNonEmpty!38409 (= (arr!31399 (_values!6292 thiss!1427)) (store mapRest!38409 mapKey!38409 mapValue!38409))))

(declare-fun b!1035729 () Bool)

(declare-fun res!691503 () Bool)

(assert (=> b!1035729 (=> (not res!691503) (not e!585727))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035729 (= res!691503 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035730 () Bool)

(declare-fun map!14715 (LongMapFixedSize!5782) ListLongMap!13833)

(assert (=> b!1035730 (= e!585723 (= (map!14715 lt!456581) (-!524 (map!14715 thiss!1427) key!909)))))

(declare-fun b!1035731 () Bool)

(declare-fun tp_is_empty!24595 () Bool)

(assert (=> b!1035731 (= e!585728 tp_is_empty!24595)))

(declare-fun b!1035732 () Bool)

(assert (=> b!1035732 (= e!585729 tp_is_empty!24595)))

(declare-fun array_inv!24285 (array!65227) Bool)

(declare-fun array_inv!24286 (array!65229) Bool)

(assert (=> b!1035733 (= e!585724 (and tp!73758 tp_is_empty!24595 (array_inv!24285 (_keys!11454 thiss!1427)) (array_inv!24286 (_values!6292 thiss!1427)) e!585725))))

(assert (= (and start!90572 res!691502) b!1035729))

(assert (= (and b!1035729 res!691503) b!1035727))

(assert (= (and b!1035727 res!691504) b!1035730))

(assert (= (and b!1035728 condMapEmpty!38409) mapIsEmpty!38409))

(assert (= (and b!1035728 (not condMapEmpty!38409)) mapNonEmpty!38409))

(get-info :version)

(assert (= (and mapNonEmpty!38409 ((_ is ValueCellFull!11594) mapValue!38409)) b!1035731))

(assert (= (and b!1035728 ((_ is ValueCellFull!11594) mapDefault!38409)) b!1035732))

(assert (= b!1035733 b!1035728))

(assert (= start!90572 b!1035733))

(declare-fun b_lambda!16079 () Bool)

(assert (=> (not b_lambda!16079) (not b!1035727)))

(declare-fun t!31147 () Bool)

(declare-fun tb!7019 () Bool)

(assert (=> (and b!1035733 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 thiss!1427)) t!31147) tb!7019))

(declare-fun result!14407 () Bool)

(assert (=> tb!7019 (= result!14407 tp_is_empty!24595)))

(assert (=> b!1035727 t!31147))

(declare-fun b_and!33351 () Bool)

(assert (= b_and!33349 (and (=> t!31147 result!14407) b_and!33351)))

(declare-fun m!954983 () Bool)

(assert (=> start!90572 m!954983))

(declare-fun m!954985 () Bool)

(assert (=> b!1035727 m!954985))

(declare-fun m!954987 () Bool)

(assert (=> b!1035727 m!954987))

(declare-fun m!954989 () Bool)

(assert (=> b!1035727 m!954989))

(declare-fun m!954991 () Bool)

(assert (=> b!1035727 m!954991))

(declare-fun m!954993 () Bool)

(assert (=> b!1035727 m!954993))

(declare-fun m!954995 () Bool)

(assert (=> b!1035727 m!954995))

(assert (=> b!1035727 m!954989))

(declare-fun m!954997 () Bool)

(assert (=> b!1035733 m!954997))

(declare-fun m!954999 () Bool)

(assert (=> b!1035733 m!954999))

(declare-fun m!955001 () Bool)

(assert (=> mapNonEmpty!38409 m!955001))

(declare-fun m!955003 () Bool)

(assert (=> b!1035730 m!955003))

(declare-fun m!955005 () Bool)

(assert (=> b!1035730 m!955005))

(assert (=> b!1035730 m!955005))

(declare-fun m!955007 () Bool)

(assert (=> b!1035730 m!955007))

(check-sat (not b!1035733) (not b!1035727) b_and!33351 (not mapNonEmpty!38409) (not b!1035730) (not b_next!20875) (not b_lambda!16079) (not start!90572) tp_is_empty!24595)
(check-sat b_and!33351 (not b_next!20875))
(get-model)

(declare-fun b_lambda!16085 () Bool)

(assert (= b_lambda!16079 (or (and b!1035733 b_free!20875) b_lambda!16085)))

(check-sat (not b!1035733) (not b!1035727) b_and!33351 (not mapNonEmpty!38409) (not b_lambda!16085) (not b!1035730) (not b_next!20875) (not start!90572) tp_is_empty!24595)
(check-sat b_and!33351 (not b_next!20875))
(get-model)

(declare-fun d!124409 () Bool)

(assert (=> d!124409 (= (map!14715 lt!456581) (getCurrentListMap!3898 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)))))

(declare-fun bs!30281 () Bool)

(assert (= bs!30281 d!124409))

(declare-fun m!955061 () Bool)

(assert (=> bs!30281 m!955061))

(assert (=> b!1035730 d!124409))

(declare-fun d!124411 () Bool)

(declare-fun lt!456604 () ListLongMap!13833)

(declare-fun contains!6001 (ListLongMap!13833 (_ BitVec 64)) Bool)

(assert (=> d!124411 (not (contains!6001 lt!456604 key!909))))

(declare-fun removeStrictlySorted!57 (List!21952 (_ BitVec 64)) List!21952)

(assert (=> d!124411 (= lt!456604 (ListLongMap!13834 (removeStrictlySorted!57 (toList!6932 (map!14715 thiss!1427)) key!909)))))

(assert (=> d!124411 (= (-!524 (map!14715 thiss!1427) key!909) lt!456604)))

(declare-fun bs!30282 () Bool)

(assert (= bs!30282 d!124411))

(declare-fun m!955063 () Bool)

(assert (=> bs!30282 m!955063))

(declare-fun m!955065 () Bool)

(assert (=> bs!30282 m!955065))

(assert (=> b!1035730 d!124411))

(declare-fun d!124413 () Bool)

(assert (=> d!124413 (= (map!14715 thiss!1427) (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun bs!30283 () Bool)

(assert (= bs!30283 d!124413))

(assert (=> bs!30283 m!954989))

(assert (=> b!1035730 d!124413))

(declare-fun b!1035824 () Bool)

(declare-fun e!585798 () ListLongMap!13833)

(declare-fun e!585809 () ListLongMap!13833)

(assert (=> b!1035824 (= e!585798 e!585809)))

(declare-fun c!104721 () Bool)

(assert (=> b!1035824 (= c!104721 (and (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!124415 () Bool)

(declare-fun e!585802 () Bool)

(assert (=> d!124415 e!585802))

(declare-fun res!691547 () Bool)

(assert (=> d!124415 (=> (not res!691547) (not e!585802))))

(assert (=> d!124415 (= res!691547 (or (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))))

(declare-fun lt!456660 () ListLongMap!13833)

(declare-fun lt!456666 () ListLongMap!13833)

(assert (=> d!124415 (= lt!456660 lt!456666)))

(declare-fun lt!456663 () Unit!33774)

(declare-fun e!585800 () Unit!33774)

(assert (=> d!124415 (= lt!456663 e!585800)))

(declare-fun c!104720 () Bool)

(declare-fun e!585807 () Bool)

(assert (=> d!124415 (= c!104720 e!585807)))

(declare-fun res!691544 () Bool)

(assert (=> d!124415 (=> (not res!691544) (not e!585807))))

(assert (=> d!124415 (= res!691544 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124415 (= lt!456666 e!585798)))

(declare-fun c!104723 () Bool)

(assert (=> d!124415 (= c!104723 (and (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!124415 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124415 (= (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!456660)))

(declare-fun bm!43789 () Bool)

(declare-fun call!43798 () ListLongMap!13833)

(declare-fun call!43792 () ListLongMap!13833)

(assert (=> bm!43789 (= call!43798 call!43792)))

(declare-fun b!1035825 () Bool)

(declare-fun e!585806 () Bool)

(declare-fun call!43794 () Bool)

(assert (=> b!1035825 (= e!585806 (not call!43794))))

(declare-fun b!1035826 () Bool)

(declare-fun e!585801 () ListLongMap!13833)

(assert (=> b!1035826 (= e!585801 call!43798)))

(declare-fun call!43793 () ListLongMap!13833)

(declare-fun bm!43790 () Bool)

(declare-fun call!43797 () ListLongMap!13833)

(declare-fun call!43796 () ListLongMap!13833)

(declare-fun +!3131 (ListLongMap!13833 tuple2!15810) ListLongMap!13833)

(assert (=> bm!43790 (= call!43792 (+!3131 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun b!1035827 () Bool)

(declare-fun e!585799 () Bool)

(declare-fun apply!900 (ListLongMap!13833 (_ BitVec 64)) V!37667)

(declare-fun get!16458 (ValueCell!11594 V!37667) V!37667)

(assert (=> b!1035827 (= e!585799 (= (apply!900 lt!456660 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31929 (_values!6292 thiss!1427))))))

(assert (=> b!1035827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1035828 () Bool)

(declare-fun e!585804 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035828 (= e!585804 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035829 () Bool)

(assert (=> b!1035829 (= e!585801 call!43793)))

(declare-fun bm!43791 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3566 (array!65227 array!65229 (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 (_ BitVec 32) Int) ListLongMap!13833)

(assert (=> bm!43791 (= call!43796 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1035830 () Bool)

(declare-fun e!585810 () Bool)

(assert (=> b!1035830 (= e!585810 (= (apply!900 lt!456660 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456582))))

(declare-fun b!1035831 () Bool)

(assert (=> b!1035831 (= e!585809 call!43798)))

(declare-fun bm!43792 () Bool)

(declare-fun call!43795 () Bool)

(assert (=> bm!43792 (= call!43795 (contains!6001 lt!456660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035832 () Bool)

(declare-fun Unit!33776 () Unit!33774)

(assert (=> b!1035832 (= e!585800 Unit!33776)))

(declare-fun b!1035833 () Bool)

(declare-fun res!691548 () Bool)

(assert (=> b!1035833 (=> (not res!691548) (not e!585802))))

(declare-fun e!585808 () Bool)

(assert (=> b!1035833 (= res!691548 e!585808)))

(declare-fun res!691541 () Bool)

(assert (=> b!1035833 (=> res!691541 e!585808)))

(assert (=> b!1035833 (= res!691541 (not e!585804))))

(declare-fun res!691546 () Bool)

(assert (=> b!1035833 (=> (not res!691546) (not e!585804))))

(assert (=> b!1035833 (= res!691546 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun bm!43793 () Bool)

(assert (=> bm!43793 (= call!43797 call!43796)))

(declare-fun b!1035834 () Bool)

(declare-fun e!585805 () Bool)

(assert (=> b!1035834 (= e!585806 e!585805)))

(declare-fun res!691549 () Bool)

(assert (=> b!1035834 (= res!691549 call!43794)))

(assert (=> b!1035834 (=> (not res!691549) (not e!585805))))

(declare-fun b!1035835 () Bool)

(declare-fun e!585803 () Bool)

(assert (=> b!1035835 (= e!585802 e!585803)))

(declare-fun c!104719 () Bool)

(assert (=> b!1035835 (= c!104719 (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035836 () Bool)

(declare-fun lt!456669 () Unit!33774)

(assert (=> b!1035836 (= e!585800 lt!456669)))

(declare-fun lt!456670 () ListLongMap!13833)

(assert (=> b!1035836 (= lt!456670 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456653 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456654 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456654 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456667 () Unit!33774)

(declare-fun addStillContains!619 (ListLongMap!13833 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33774)

(assert (=> b!1035836 (= lt!456667 (addStillContains!619 lt!456670 lt!456653 (zeroValue!6103 thiss!1427) lt!456654))))

(assert (=> b!1035836 (contains!6001 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) lt!456654)))

(declare-fun lt!456662 () Unit!33774)

(assert (=> b!1035836 (= lt!456662 lt!456667)))

(declare-fun lt!456668 () ListLongMap!13833)

(assert (=> b!1035836 (= lt!456668 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456652 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456658 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456658 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456657 () Unit!33774)

(declare-fun addApplyDifferent!475 (ListLongMap!13833 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33774)

(assert (=> b!1035836 (= lt!456657 (addApplyDifferent!475 lt!456668 lt!456652 lt!456582 lt!456658))))

(assert (=> b!1035836 (= (apply!900 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)) lt!456658) (apply!900 lt!456668 lt!456658))))

(declare-fun lt!456651 () Unit!33774)

(assert (=> b!1035836 (= lt!456651 lt!456657)))

(declare-fun lt!456664 () ListLongMap!13833)

(assert (=> b!1035836 (= lt!456664 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456661 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456661 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456656 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456656 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456655 () Unit!33774)

(assert (=> b!1035836 (= lt!456655 (addApplyDifferent!475 lt!456664 lt!456661 (zeroValue!6103 thiss!1427) lt!456656))))

(assert (=> b!1035836 (= (apply!900 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) lt!456656) (apply!900 lt!456664 lt!456656))))

(declare-fun lt!456650 () Unit!33774)

(assert (=> b!1035836 (= lt!456650 lt!456655)))

(declare-fun lt!456659 () ListLongMap!13833)

(assert (=> b!1035836 (= lt!456659 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456649 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456649 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456665 () (_ BitVec 64))

(assert (=> b!1035836 (= lt!456665 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035836 (= lt!456669 (addApplyDifferent!475 lt!456659 lt!456649 lt!456582 lt!456665))))

(assert (=> b!1035836 (= (apply!900 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)) lt!456665) (apply!900 lt!456659 lt!456665))))

(declare-fun b!1035837 () Bool)

(assert (=> b!1035837 (= e!585805 (= (apply!900 lt!456660 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6103 thiss!1427)))))

(declare-fun bm!43794 () Bool)

(assert (=> bm!43794 (= call!43793 call!43797)))

(declare-fun b!1035838 () Bool)

(assert (=> b!1035838 (= e!585798 (+!3131 call!43792 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))

(declare-fun b!1035839 () Bool)

(declare-fun res!691542 () Bool)

(assert (=> b!1035839 (=> (not res!691542) (not e!585802))))

(assert (=> b!1035839 (= res!691542 e!585806)))

(declare-fun c!104724 () Bool)

(assert (=> b!1035839 (= c!104724 (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43795 () Bool)

(assert (=> bm!43795 (= call!43794 (contains!6001 lt!456660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035840 () Bool)

(assert (=> b!1035840 (= e!585803 (not call!43795))))

(declare-fun b!1035841 () Bool)

(assert (=> b!1035841 (= e!585807 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035842 () Bool)

(assert (=> b!1035842 (= e!585803 e!585810)))

(declare-fun res!691545 () Bool)

(assert (=> b!1035842 (= res!691545 call!43795)))

(assert (=> b!1035842 (=> (not res!691545) (not e!585810))))

(declare-fun b!1035843 () Bool)

(declare-fun c!104722 () Bool)

(assert (=> b!1035843 (= c!104722 (and (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1035843 (= e!585809 e!585801)))

(declare-fun b!1035844 () Bool)

(assert (=> b!1035844 (= e!585808 e!585799)))

(declare-fun res!691543 () Bool)

(assert (=> b!1035844 (=> (not res!691543) (not e!585799))))

(assert (=> b!1035844 (= res!691543 (contains!6001 lt!456660 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (= (and d!124415 c!104723) b!1035838))

(assert (= (and d!124415 (not c!104723)) b!1035824))

(assert (= (and b!1035824 c!104721) b!1035831))

(assert (= (and b!1035824 (not c!104721)) b!1035843))

(assert (= (and b!1035843 c!104722) b!1035826))

(assert (= (and b!1035843 (not c!104722)) b!1035829))

(assert (= (or b!1035826 b!1035829) bm!43794))

(assert (= (or b!1035831 bm!43794) bm!43793))

(assert (= (or b!1035831 b!1035826) bm!43789))

(assert (= (or b!1035838 bm!43793) bm!43791))

(assert (= (or b!1035838 bm!43789) bm!43790))

(assert (= (and d!124415 res!691544) b!1035841))

(assert (= (and d!124415 c!104720) b!1035836))

(assert (= (and d!124415 (not c!104720)) b!1035832))

(assert (= (and d!124415 res!691547) b!1035833))

(assert (= (and b!1035833 res!691546) b!1035828))

(assert (= (and b!1035833 (not res!691541)) b!1035844))

(assert (= (and b!1035844 res!691543) b!1035827))

(assert (= (and b!1035833 res!691548) b!1035839))

(assert (= (and b!1035839 c!104724) b!1035834))

(assert (= (and b!1035839 (not c!104724)) b!1035825))

(assert (= (and b!1035834 res!691549) b!1035837))

(assert (= (or b!1035834 b!1035825) bm!43795))

(assert (= (and b!1035839 res!691542) b!1035835))

(assert (= (and b!1035835 c!104719) b!1035842))

(assert (= (and b!1035835 (not c!104719)) b!1035840))

(assert (= (and b!1035842 res!691545) b!1035830))

(assert (= (or b!1035842 b!1035840) bm!43792))

(declare-fun b_lambda!16087 () Bool)

(assert (=> (not b_lambda!16087) (not b!1035827)))

(declare-fun t!31154 () Bool)

(declare-fun tb!7025 () Bool)

(assert (=> (and b!1035733 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 thiss!1427)) t!31154) tb!7025))

(declare-fun result!14419 () Bool)

(assert (=> tb!7025 (= result!14419 tp_is_empty!24595)))

(assert (=> b!1035827 t!31154))

(declare-fun b_and!33361 () Bool)

(assert (= b_and!33351 (and (=> t!31154 result!14419) b_and!33361)))

(declare-fun m!955067 () Bool)

(assert (=> b!1035827 m!955067))

(assert (=> b!1035827 m!955067))

(declare-fun m!955069 () Bool)

(assert (=> b!1035827 m!955069))

(declare-fun m!955071 () Bool)

(assert (=> b!1035827 m!955071))

(declare-fun m!955073 () Bool)

(assert (=> b!1035827 m!955073))

(assert (=> b!1035827 m!955071))

(declare-fun m!955075 () Bool)

(assert (=> b!1035827 m!955075))

(assert (=> b!1035827 m!955073))

(declare-fun m!955077 () Bool)

(assert (=> d!124415 m!955077))

(declare-fun m!955079 () Bool)

(assert (=> bm!43791 m!955079))

(assert (=> b!1035844 m!955067))

(assert (=> b!1035844 m!955067))

(declare-fun m!955081 () Bool)

(assert (=> b!1035844 m!955081))

(declare-fun m!955083 () Bool)

(assert (=> bm!43792 m!955083))

(assert (=> b!1035841 m!955067))

(assert (=> b!1035841 m!955067))

(declare-fun m!955085 () Bool)

(assert (=> b!1035841 m!955085))

(declare-fun m!955087 () Bool)

(assert (=> b!1035838 m!955087))

(declare-fun m!955089 () Bool)

(assert (=> bm!43790 m!955089))

(declare-fun m!955091 () Bool)

(assert (=> b!1035836 m!955091))

(declare-fun m!955093 () Bool)

(assert (=> b!1035836 m!955093))

(declare-fun m!955095 () Bool)

(assert (=> b!1035836 m!955095))

(declare-fun m!955097 () Bool)

(assert (=> b!1035836 m!955097))

(declare-fun m!955099 () Bool)

(assert (=> b!1035836 m!955099))

(declare-fun m!955101 () Bool)

(assert (=> b!1035836 m!955101))

(assert (=> b!1035836 m!955079))

(declare-fun m!955103 () Bool)

(assert (=> b!1035836 m!955103))

(declare-fun m!955105 () Bool)

(assert (=> b!1035836 m!955105))

(declare-fun m!955107 () Bool)

(assert (=> b!1035836 m!955107))

(assert (=> b!1035836 m!955099))

(declare-fun m!955109 () Bool)

(assert (=> b!1035836 m!955109))

(assert (=> b!1035836 m!955097))

(declare-fun m!955111 () Bool)

(assert (=> b!1035836 m!955111))

(declare-fun m!955113 () Bool)

(assert (=> b!1035836 m!955113))

(assert (=> b!1035836 m!955067))

(declare-fun m!955115 () Bool)

(assert (=> b!1035836 m!955115))

(assert (=> b!1035836 m!955105))

(declare-fun m!955117 () Bool)

(assert (=> b!1035836 m!955117))

(assert (=> b!1035836 m!955095))

(declare-fun m!955119 () Bool)

(assert (=> b!1035836 m!955119))

(declare-fun m!955121 () Bool)

(assert (=> b!1035837 m!955121))

(declare-fun m!955123 () Bool)

(assert (=> b!1035830 m!955123))

(declare-fun m!955125 () Bool)

(assert (=> bm!43795 m!955125))

(assert (=> b!1035828 m!955067))

(assert (=> b!1035828 m!955067))

(assert (=> b!1035828 m!955085))

(assert (=> b!1035727 d!124415))

(declare-fun b!1035845 () Bool)

(declare-fun e!585811 () ListLongMap!13833)

(declare-fun e!585822 () ListLongMap!13833)

(assert (=> b!1035845 (= e!585811 e!585822)))

(declare-fun c!104727 () Bool)

(assert (=> b!1035845 (= c!104727 (and (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!124417 () Bool)

(declare-fun e!585815 () Bool)

(assert (=> d!124417 e!585815))

(declare-fun res!691556 () Bool)

(assert (=> d!124417 (=> (not res!691556) (not e!585815))))

(assert (=> d!124417 (= res!691556 (or (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))))

(declare-fun lt!456682 () ListLongMap!13833)

(declare-fun lt!456688 () ListLongMap!13833)

(assert (=> d!124417 (= lt!456682 lt!456688)))

(declare-fun lt!456685 () Unit!33774)

(declare-fun e!585813 () Unit!33774)

(assert (=> d!124417 (= lt!456685 e!585813)))

(declare-fun c!104726 () Bool)

(declare-fun e!585820 () Bool)

(assert (=> d!124417 (= c!104726 e!585820)))

(declare-fun res!691553 () Bool)

(assert (=> d!124417 (=> (not res!691553) (not e!585820))))

(assert (=> d!124417 (= res!691553 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124417 (= lt!456688 e!585811)))

(declare-fun c!104729 () Bool)

(assert (=> d!124417 (= c!104729 (and (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124417 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124417 (= (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!456682)))

(declare-fun bm!43796 () Bool)

(declare-fun call!43805 () ListLongMap!13833)

(declare-fun call!43799 () ListLongMap!13833)

(assert (=> bm!43796 (= call!43805 call!43799)))

(declare-fun b!1035846 () Bool)

(declare-fun e!585819 () Bool)

(declare-fun call!43801 () Bool)

(assert (=> b!1035846 (= e!585819 (not call!43801))))

(declare-fun b!1035847 () Bool)

(declare-fun e!585814 () ListLongMap!13833)

(assert (=> b!1035847 (= e!585814 call!43805)))

(declare-fun call!43800 () ListLongMap!13833)

(declare-fun call!43804 () ListLongMap!13833)

(declare-fun call!43803 () ListLongMap!13833)

(declare-fun bm!43797 () Bool)

(assert (=> bm!43797 (= call!43799 (+!3131 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1035848 () Bool)

(declare-fun e!585812 () Bool)

(assert (=> b!1035848 (= e!585812 (= (apply!900 lt!456682 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035848 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31929 (_values!6292 thiss!1427))))))

(assert (=> b!1035848 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1035849 () Bool)

(declare-fun e!585817 () Bool)

(assert (=> b!1035849 (= e!585817 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035850 () Bool)

(assert (=> b!1035850 (= e!585814 call!43800)))

(declare-fun bm!43798 () Bool)

(assert (=> bm!43798 (= call!43803 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1035851 () Bool)

(declare-fun e!585823 () Bool)

(assert (=> b!1035851 (= e!585823 (= (apply!900 lt!456682 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6105 thiss!1427)))))

(declare-fun b!1035852 () Bool)

(assert (=> b!1035852 (= e!585822 call!43805)))

(declare-fun bm!43799 () Bool)

(declare-fun call!43802 () Bool)

(assert (=> bm!43799 (= call!43802 (contains!6001 lt!456682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035853 () Bool)

(declare-fun Unit!33777 () Unit!33774)

(assert (=> b!1035853 (= e!585813 Unit!33777)))

(declare-fun b!1035854 () Bool)

(declare-fun res!691557 () Bool)

(assert (=> b!1035854 (=> (not res!691557) (not e!585815))))

(declare-fun e!585821 () Bool)

(assert (=> b!1035854 (= res!691557 e!585821)))

(declare-fun res!691550 () Bool)

(assert (=> b!1035854 (=> res!691550 e!585821)))

(assert (=> b!1035854 (= res!691550 (not e!585817))))

(declare-fun res!691555 () Bool)

(assert (=> b!1035854 (=> (not res!691555) (not e!585817))))

(assert (=> b!1035854 (= res!691555 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun bm!43800 () Bool)

(assert (=> bm!43800 (= call!43804 call!43803)))

(declare-fun b!1035855 () Bool)

(declare-fun e!585818 () Bool)

(assert (=> b!1035855 (= e!585819 e!585818)))

(declare-fun res!691558 () Bool)

(assert (=> b!1035855 (= res!691558 call!43801)))

(assert (=> b!1035855 (=> (not res!691558) (not e!585818))))

(declare-fun b!1035856 () Bool)

(declare-fun e!585816 () Bool)

(assert (=> b!1035856 (= e!585815 e!585816)))

(declare-fun c!104725 () Bool)

(assert (=> b!1035856 (= c!104725 (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035857 () Bool)

(declare-fun lt!456691 () Unit!33774)

(assert (=> b!1035857 (= e!585813 lt!456691)))

(declare-fun lt!456692 () ListLongMap!13833)

(assert (=> b!1035857 (= lt!456692 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456675 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456676 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456676 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456689 () Unit!33774)

(assert (=> b!1035857 (= lt!456689 (addStillContains!619 lt!456692 lt!456675 (zeroValue!6103 thiss!1427) lt!456676))))

(assert (=> b!1035857 (contains!6001 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) lt!456676)))

(declare-fun lt!456684 () Unit!33774)

(assert (=> b!1035857 (= lt!456684 lt!456689)))

(declare-fun lt!456690 () ListLongMap!13833)

(assert (=> b!1035857 (= lt!456690 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456674 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456674 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456680 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456680 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456679 () Unit!33774)

(assert (=> b!1035857 (= lt!456679 (addApplyDifferent!475 lt!456690 lt!456674 (minValue!6105 thiss!1427) lt!456680))))

(assert (=> b!1035857 (= (apply!900 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) lt!456680) (apply!900 lt!456690 lt!456680))))

(declare-fun lt!456673 () Unit!33774)

(assert (=> b!1035857 (= lt!456673 lt!456679)))

(declare-fun lt!456686 () ListLongMap!13833)

(assert (=> b!1035857 (= lt!456686 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456683 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456678 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456678 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456677 () Unit!33774)

(assert (=> b!1035857 (= lt!456677 (addApplyDifferent!475 lt!456686 lt!456683 (zeroValue!6103 thiss!1427) lt!456678))))

(assert (=> b!1035857 (= (apply!900 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) lt!456678) (apply!900 lt!456686 lt!456678))))

(declare-fun lt!456672 () Unit!33774)

(assert (=> b!1035857 (= lt!456672 lt!456677)))

(declare-fun lt!456681 () ListLongMap!13833)

(assert (=> b!1035857 (= lt!456681 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456671 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456687 () (_ BitVec 64))

(assert (=> b!1035857 (= lt!456687 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035857 (= lt!456691 (addApplyDifferent!475 lt!456681 lt!456671 (minValue!6105 thiss!1427) lt!456687))))

(assert (=> b!1035857 (= (apply!900 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) lt!456687) (apply!900 lt!456681 lt!456687))))

(declare-fun b!1035858 () Bool)

(assert (=> b!1035858 (= e!585818 (= (apply!900 lt!456682 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6103 thiss!1427)))))

(declare-fun bm!43801 () Bool)

(assert (=> bm!43801 (= call!43800 call!43804)))

(declare-fun b!1035859 () Bool)

(assert (=> b!1035859 (= e!585811 (+!3131 call!43799 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(declare-fun b!1035860 () Bool)

(declare-fun res!691551 () Bool)

(assert (=> b!1035860 (=> (not res!691551) (not e!585815))))

(assert (=> b!1035860 (= res!691551 e!585819)))

(declare-fun c!104730 () Bool)

(assert (=> b!1035860 (= c!104730 (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43802 () Bool)

(assert (=> bm!43802 (= call!43801 (contains!6001 lt!456682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035861 () Bool)

(assert (=> b!1035861 (= e!585816 (not call!43802))))

(declare-fun b!1035862 () Bool)

(assert (=> b!1035862 (= e!585820 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035863 () Bool)

(assert (=> b!1035863 (= e!585816 e!585823)))

(declare-fun res!691554 () Bool)

(assert (=> b!1035863 (= res!691554 call!43802)))

(assert (=> b!1035863 (=> (not res!691554) (not e!585823))))

(declare-fun b!1035864 () Bool)

(declare-fun c!104728 () Bool)

(assert (=> b!1035864 (= c!104728 (and (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1035864 (= e!585822 e!585814)))

(declare-fun b!1035865 () Bool)

(assert (=> b!1035865 (= e!585821 e!585812)))

(declare-fun res!691552 () Bool)

(assert (=> b!1035865 (=> (not res!691552) (not e!585812))))

(assert (=> b!1035865 (= res!691552 (contains!6001 lt!456682 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (= (and d!124417 c!104729) b!1035859))

(assert (= (and d!124417 (not c!104729)) b!1035845))

(assert (= (and b!1035845 c!104727) b!1035852))

(assert (= (and b!1035845 (not c!104727)) b!1035864))

(assert (= (and b!1035864 c!104728) b!1035847))

(assert (= (and b!1035864 (not c!104728)) b!1035850))

(assert (= (or b!1035847 b!1035850) bm!43801))

(assert (= (or b!1035852 bm!43801) bm!43800))

(assert (= (or b!1035852 b!1035847) bm!43796))

(assert (= (or b!1035859 bm!43800) bm!43798))

(assert (= (or b!1035859 bm!43796) bm!43797))

(assert (= (and d!124417 res!691553) b!1035862))

(assert (= (and d!124417 c!104726) b!1035857))

(assert (= (and d!124417 (not c!104726)) b!1035853))

(assert (= (and d!124417 res!691556) b!1035854))

(assert (= (and b!1035854 res!691555) b!1035849))

(assert (= (and b!1035854 (not res!691550)) b!1035865))

(assert (= (and b!1035865 res!691552) b!1035848))

(assert (= (and b!1035854 res!691557) b!1035860))

(assert (= (and b!1035860 c!104730) b!1035855))

(assert (= (and b!1035860 (not c!104730)) b!1035846))

(assert (= (and b!1035855 res!691558) b!1035858))

(assert (= (or b!1035855 b!1035846) bm!43802))

(assert (= (and b!1035860 res!691551) b!1035856))

(assert (= (and b!1035856 c!104725) b!1035863))

(assert (= (and b!1035856 (not c!104725)) b!1035861))

(assert (= (and b!1035863 res!691554) b!1035851))

(assert (= (or b!1035863 b!1035861) bm!43799))

(declare-fun b_lambda!16089 () Bool)

(assert (=> (not b_lambda!16089) (not b!1035848)))

(assert (=> b!1035848 t!31154))

(declare-fun b_and!33363 () Bool)

(assert (= b_and!33361 (and (=> t!31154 result!14419) b_and!33363)))

(assert (=> b!1035848 m!955067))

(assert (=> b!1035848 m!955067))

(declare-fun m!955127 () Bool)

(assert (=> b!1035848 m!955127))

(assert (=> b!1035848 m!955071))

(assert (=> b!1035848 m!955073))

(assert (=> b!1035848 m!955071))

(assert (=> b!1035848 m!955075))

(assert (=> b!1035848 m!955073))

(assert (=> d!124417 m!955077))

(declare-fun m!955129 () Bool)

(assert (=> bm!43798 m!955129))

(assert (=> b!1035865 m!955067))

(assert (=> b!1035865 m!955067))

(declare-fun m!955131 () Bool)

(assert (=> b!1035865 m!955131))

(declare-fun m!955133 () Bool)

(assert (=> bm!43799 m!955133))

(assert (=> b!1035862 m!955067))

(assert (=> b!1035862 m!955067))

(assert (=> b!1035862 m!955085))

(declare-fun m!955135 () Bool)

(assert (=> b!1035859 m!955135))

(declare-fun m!955137 () Bool)

(assert (=> bm!43797 m!955137))

(declare-fun m!955139 () Bool)

(assert (=> b!1035857 m!955139))

(declare-fun m!955141 () Bool)

(assert (=> b!1035857 m!955141))

(declare-fun m!955143 () Bool)

(assert (=> b!1035857 m!955143))

(declare-fun m!955145 () Bool)

(assert (=> b!1035857 m!955145))

(declare-fun m!955147 () Bool)

(assert (=> b!1035857 m!955147))

(declare-fun m!955149 () Bool)

(assert (=> b!1035857 m!955149))

(assert (=> b!1035857 m!955129))

(declare-fun m!955151 () Bool)

(assert (=> b!1035857 m!955151))

(declare-fun m!955153 () Bool)

(assert (=> b!1035857 m!955153))

(declare-fun m!955155 () Bool)

(assert (=> b!1035857 m!955155))

(assert (=> b!1035857 m!955147))

(declare-fun m!955157 () Bool)

(assert (=> b!1035857 m!955157))

(assert (=> b!1035857 m!955145))

(declare-fun m!955159 () Bool)

(assert (=> b!1035857 m!955159))

(declare-fun m!955161 () Bool)

(assert (=> b!1035857 m!955161))

(assert (=> b!1035857 m!955067))

(declare-fun m!955163 () Bool)

(assert (=> b!1035857 m!955163))

(assert (=> b!1035857 m!955153))

(declare-fun m!955165 () Bool)

(assert (=> b!1035857 m!955165))

(assert (=> b!1035857 m!955143))

(declare-fun m!955167 () Bool)

(assert (=> b!1035857 m!955167))

(declare-fun m!955169 () Bool)

(assert (=> b!1035858 m!955169))

(declare-fun m!955171 () Bool)

(assert (=> b!1035851 m!955171))

(declare-fun m!955173 () Bool)

(assert (=> bm!43802 m!955173))

(assert (=> b!1035849 m!955067))

(assert (=> b!1035849 m!955067))

(assert (=> b!1035849 m!955085))

(assert (=> b!1035727 d!124417))

(declare-fun d!124419 () Bool)

(declare-fun lt!456693 () ListLongMap!13833)

(assert (=> d!124419 (not (contains!6001 lt!456693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124419 (= lt!456693 (ListLongMap!13834 (removeStrictlySorted!57 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124419 (= (-!524 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456693)))

(declare-fun bs!30284 () Bool)

(assert (= bs!30284 d!124419))

(declare-fun m!955175 () Bool)

(assert (=> bs!30284 m!955175))

(declare-fun m!955177 () Bool)

(assert (=> bs!30284 m!955177))

(assert (=> b!1035727 d!124419))

(declare-fun d!124421 () Bool)

(declare-fun res!691565 () Bool)

(declare-fun e!585826 () Bool)

(assert (=> d!124421 (=> (not res!691565) (not e!585826))))

(declare-fun simpleValid!414 (LongMapFixedSize!5782) Bool)

(assert (=> d!124421 (= res!691565 (simpleValid!414 lt!456581))))

(assert (=> d!124421 (= (valid!2172 lt!456581) e!585826)))

(declare-fun b!1035872 () Bool)

(declare-fun res!691566 () Bool)

(assert (=> b!1035872 (=> (not res!691566) (not e!585826))))

(declare-fun arrayCountValidKeys!0 (array!65227 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035872 (= res!691566 (= (arrayCountValidKeys!0 (_keys!11454 lt!456581) #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))) (_size!2946 lt!456581)))))

(declare-fun b!1035873 () Bool)

(declare-fun res!691567 () Bool)

(assert (=> b!1035873 (=> (not res!691567) (not e!585826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65227 (_ BitVec 32)) Bool)

(assert (=> b!1035873 (= res!691567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11454 lt!456581) (mask!30165 lt!456581)))))

(declare-fun b!1035874 () Bool)

(declare-datatypes ((List!21953 0))(
  ( (Nil!21950) (Cons!21949 (h!23151 (_ BitVec 64)) (t!31155 List!21953)) )
))
(declare-fun arrayNoDuplicates!0 (array!65227 (_ BitVec 32) List!21953) Bool)

(assert (=> b!1035874 (= e!585826 (arrayNoDuplicates!0 (_keys!11454 lt!456581) #b00000000000000000000000000000000 Nil!21950))))

(assert (= (and d!124421 res!691565) b!1035872))

(assert (= (and b!1035872 res!691566) b!1035873))

(assert (= (and b!1035873 res!691567) b!1035874))

(declare-fun m!955179 () Bool)

(assert (=> d!124421 m!955179))

(declare-fun m!955181 () Bool)

(assert (=> b!1035872 m!955181))

(declare-fun m!955183 () Bool)

(assert (=> b!1035873 m!955183))

(declare-fun m!955185 () Bool)

(assert (=> b!1035874 m!955185))

(assert (=> b!1035727 d!124421))

(declare-fun d!124423 () Bool)

(assert (=> d!124423 (= (-!524 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!456696 () Unit!33774)

(declare-fun choose!1709 (array!65227 array!65229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 V!37667 Int) Unit!33774)

(assert (=> d!124423 (= lt!456696 (choose!1709 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!456582 (defaultEntry!6269 thiss!1427)))))

(assert (=> d!124423 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124423 (= (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!9 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!456582 (defaultEntry!6269 thiss!1427)) lt!456696)))

(declare-fun bs!30285 () Bool)

(assert (= bs!30285 d!124423))

(assert (=> bs!30285 m!955077))

(assert (=> bs!30285 m!954985))

(assert (=> bs!30285 m!954989))

(assert (=> bs!30285 m!954991))

(declare-fun m!955187 () Bool)

(assert (=> bs!30285 m!955187))

(assert (=> bs!30285 m!954989))

(assert (=> b!1035727 d!124423))

(declare-fun d!124425 () Bool)

(declare-fun res!691568 () Bool)

(declare-fun e!585827 () Bool)

(assert (=> d!124425 (=> (not res!691568) (not e!585827))))

(assert (=> d!124425 (= res!691568 (simpleValid!414 thiss!1427))))

(assert (=> d!124425 (= (valid!2172 thiss!1427) e!585827)))

(declare-fun b!1035875 () Bool)

(declare-fun res!691569 () Bool)

(assert (=> b!1035875 (=> (not res!691569) (not e!585827))))

(assert (=> b!1035875 (= res!691569 (= (arrayCountValidKeys!0 (_keys!11454 thiss!1427) #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))) (_size!2946 thiss!1427)))))

(declare-fun b!1035876 () Bool)

(declare-fun res!691570 () Bool)

(assert (=> b!1035876 (=> (not res!691570) (not e!585827))))

(assert (=> b!1035876 (= res!691570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11454 thiss!1427) (mask!30165 thiss!1427)))))

(declare-fun b!1035877 () Bool)

(assert (=> b!1035877 (= e!585827 (arrayNoDuplicates!0 (_keys!11454 thiss!1427) #b00000000000000000000000000000000 Nil!21950))))

(assert (= (and d!124425 res!691568) b!1035875))

(assert (= (and b!1035875 res!691569) b!1035876))

(assert (= (and b!1035876 res!691570) b!1035877))

(declare-fun m!955189 () Bool)

(assert (=> d!124425 m!955189))

(declare-fun m!955191 () Bool)

(assert (=> b!1035875 m!955191))

(declare-fun m!955193 () Bool)

(assert (=> b!1035876 m!955193))

(declare-fun m!955195 () Bool)

(assert (=> b!1035877 m!955195))

(assert (=> start!90572 d!124425))

(declare-fun d!124427 () Bool)

(assert (=> d!124427 (= (array_inv!24285 (_keys!11454 thiss!1427)) (bvsge (size!31928 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035733 d!124427))

(declare-fun d!124429 () Bool)

(assert (=> d!124429 (= (array_inv!24286 (_values!6292 thiss!1427)) (bvsge (size!31929 (_values!6292 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035733 d!124429))

(declare-fun mapIsEmpty!38418 () Bool)

(declare-fun mapRes!38418 () Bool)

(assert (=> mapIsEmpty!38418 mapRes!38418))

(declare-fun b!1035885 () Bool)

(declare-fun e!585833 () Bool)

(assert (=> b!1035885 (= e!585833 tp_is_empty!24595)))

(declare-fun mapNonEmpty!38418 () Bool)

(declare-fun tp!73774 () Bool)

(declare-fun e!585832 () Bool)

(assert (=> mapNonEmpty!38418 (= mapRes!38418 (and tp!73774 e!585832))))

(declare-fun mapValue!38418 () ValueCell!11594)

(declare-fun mapRest!38418 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapKey!38418 () (_ BitVec 32))

(assert (=> mapNonEmpty!38418 (= mapRest!38409 (store mapRest!38418 mapKey!38418 mapValue!38418))))

(declare-fun b!1035884 () Bool)

(assert (=> b!1035884 (= e!585832 tp_is_empty!24595)))

(declare-fun condMapEmpty!38418 () Bool)

(declare-fun mapDefault!38418 () ValueCell!11594)

(assert (=> mapNonEmpty!38409 (= condMapEmpty!38418 (= mapRest!38409 ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38418)))))

(assert (=> mapNonEmpty!38409 (= tp!73759 (and e!585833 mapRes!38418))))

(assert (= (and mapNonEmpty!38409 condMapEmpty!38418) mapIsEmpty!38418))

(assert (= (and mapNonEmpty!38409 (not condMapEmpty!38418)) mapNonEmpty!38418))

(assert (= (and mapNonEmpty!38418 ((_ is ValueCellFull!11594) mapValue!38418)) b!1035884))

(assert (= (and mapNonEmpty!38409 ((_ is ValueCellFull!11594) mapDefault!38418)) b!1035885))

(declare-fun m!955197 () Bool)

(assert (=> mapNonEmpty!38418 m!955197))

(declare-fun b_lambda!16091 () Bool)

(assert (= b_lambda!16087 (or (and b!1035733 b_free!20875) b_lambda!16091)))

(declare-fun b_lambda!16093 () Bool)

(assert (= b_lambda!16089 (or (and b!1035733 b_free!20875) b_lambda!16093)))

(check-sat (not b!1035827) (not b!1035841) (not b!1035828) (not b!1035838) (not b_lambda!16093) (not b!1035848) (not d!124419) (not d!124417) b_and!33363 (not b!1035830) (not bm!43802) (not b!1035837) tp_is_empty!24595 (not bm!43799) (not d!124411) (not b!1035858) (not b!1035874) (not b!1035836) (not b!1035872) (not b!1035873) (not bm!43792) (not bm!43790) (not d!124413) (not d!124409) (not b!1035849) (not b_lambda!16085) (not b!1035857) (not d!124425) (not b!1035851) (not b!1035859) (not b!1035876) (not b!1035875) (not d!124423) (not bm!43791) (not b!1035877) (not b_next!20875) (not b!1035865) (not bm!43795) (not b_lambda!16091) (not mapNonEmpty!38418) (not bm!43797) (not bm!43798) (not d!124421) (not d!124415) (not b!1035862) (not b!1035844))
(check-sat b_and!33363 (not b_next!20875))
(get-model)

(declare-fun d!124431 () Bool)

(declare-fun e!585838 () Bool)

(assert (=> d!124431 e!585838))

(declare-fun res!691573 () Bool)

(assert (=> d!124431 (=> res!691573 e!585838)))

(declare-fun lt!456706 () Bool)

(assert (=> d!124431 (= res!691573 (not lt!456706))))

(declare-fun lt!456705 () Bool)

(assert (=> d!124431 (= lt!456706 lt!456705)))

(declare-fun lt!456708 () Unit!33774)

(declare-fun e!585839 () Unit!33774)

(assert (=> d!124431 (= lt!456708 e!585839)))

(declare-fun c!104733 () Bool)

(assert (=> d!124431 (= c!104733 lt!456705)))

(declare-fun containsKey!564 (List!21952 (_ BitVec 64)) Bool)

(assert (=> d!124431 (= lt!456705 (containsKey!564 (toList!6932 lt!456604) key!909))))

(assert (=> d!124431 (= (contains!6001 lt!456604 key!909) lt!456706)))

(declare-fun b!1035892 () Bool)

(declare-fun lt!456707 () Unit!33774)

(assert (=> b!1035892 (= e!585839 lt!456707)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!396 (List!21952 (_ BitVec 64)) Unit!33774)

(assert (=> b!1035892 (= lt!456707 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456604) key!909))))

(declare-datatypes ((Option!642 0))(
  ( (Some!641 (v!14930 V!37667)) (None!640) )
))
(declare-fun isDefined!439 (Option!642) Bool)

(declare-fun getValueByKey!591 (List!21952 (_ BitVec 64)) Option!642)

(assert (=> b!1035892 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456604) key!909))))

(declare-fun b!1035893 () Bool)

(declare-fun Unit!33778 () Unit!33774)

(assert (=> b!1035893 (= e!585839 Unit!33778)))

(declare-fun b!1035894 () Bool)

(assert (=> b!1035894 (= e!585838 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456604) key!909)))))

(assert (= (and d!124431 c!104733) b!1035892))

(assert (= (and d!124431 (not c!104733)) b!1035893))

(assert (= (and d!124431 (not res!691573)) b!1035894))

(declare-fun m!955199 () Bool)

(assert (=> d!124431 m!955199))

(declare-fun m!955201 () Bool)

(assert (=> b!1035892 m!955201))

(declare-fun m!955203 () Bool)

(assert (=> b!1035892 m!955203))

(assert (=> b!1035892 m!955203))

(declare-fun m!955205 () Bool)

(assert (=> b!1035892 m!955205))

(assert (=> b!1035894 m!955203))

(assert (=> b!1035894 m!955203))

(assert (=> b!1035894 m!955205))

(assert (=> d!124411 d!124431))

(declare-fun b!1035905 () Bool)

(declare-fun e!585848 () List!21952)

(assert (=> b!1035905 (= e!585848 (t!31148 (toList!6932 (map!14715 thiss!1427))))))

(declare-fun b!1035906 () Bool)

(declare-fun e!585846 () List!21952)

(declare-fun $colon$colon!605 (List!21952 tuple2!15810) List!21952)

(assert (=> b!1035906 (= e!585846 ($colon$colon!605 (removeStrictlySorted!57 (t!31148 (toList!6932 (map!14715 thiss!1427))) key!909) (h!23150 (toList!6932 (map!14715 thiss!1427)))))))

(declare-fun b!1035907 () Bool)

(assert (=> b!1035907 (= e!585846 Nil!21949)))

(declare-fun d!124433 () Bool)

(declare-fun e!585847 () Bool)

(assert (=> d!124433 e!585847))

(declare-fun res!691576 () Bool)

(assert (=> d!124433 (=> (not res!691576) (not e!585847))))

(declare-fun lt!456711 () List!21952)

(declare-fun isStrictlySorted!715 (List!21952) Bool)

(assert (=> d!124433 (= res!691576 (isStrictlySorted!715 lt!456711))))

(assert (=> d!124433 (= lt!456711 e!585848)))

(declare-fun c!104739 () Bool)

(assert (=> d!124433 (= c!104739 (and ((_ is Cons!21948) (toList!6932 (map!14715 thiss!1427))) (= (_1!7916 (h!23150 (toList!6932 (map!14715 thiss!1427)))) key!909)))))

(assert (=> d!124433 (isStrictlySorted!715 (toList!6932 (map!14715 thiss!1427)))))

(assert (=> d!124433 (= (removeStrictlySorted!57 (toList!6932 (map!14715 thiss!1427)) key!909) lt!456711)))

(declare-fun b!1035908 () Bool)

(assert (=> b!1035908 (= e!585848 e!585846)))

(declare-fun c!104738 () Bool)

(assert (=> b!1035908 (= c!104738 (and ((_ is Cons!21948) (toList!6932 (map!14715 thiss!1427))) (not (= (_1!7916 (h!23150 (toList!6932 (map!14715 thiss!1427)))) key!909))))))

(declare-fun b!1035909 () Bool)

(assert (=> b!1035909 (= e!585847 (not (containsKey!564 lt!456711 key!909)))))

(assert (= (and d!124433 c!104739) b!1035905))

(assert (= (and d!124433 (not c!104739)) b!1035908))

(assert (= (and b!1035908 c!104738) b!1035906))

(assert (= (and b!1035908 (not c!104738)) b!1035907))

(assert (= (and d!124433 res!691576) b!1035909))

(declare-fun m!955207 () Bool)

(assert (=> b!1035906 m!955207))

(assert (=> b!1035906 m!955207))

(declare-fun m!955209 () Bool)

(assert (=> b!1035906 m!955209))

(declare-fun m!955211 () Bool)

(assert (=> d!124433 m!955211))

(declare-fun m!955213 () Bool)

(assert (=> d!124433 m!955213))

(declare-fun m!955215 () Bool)

(assert (=> b!1035909 m!955215))

(assert (=> d!124411 d!124433))

(declare-fun d!124435 () Bool)

(declare-fun e!585849 () Bool)

(assert (=> d!124435 e!585849))

(declare-fun res!691577 () Bool)

(assert (=> d!124435 (=> res!691577 e!585849)))

(declare-fun lt!456713 () Bool)

(assert (=> d!124435 (= res!691577 (not lt!456713))))

(declare-fun lt!456712 () Bool)

(assert (=> d!124435 (= lt!456713 lt!456712)))

(declare-fun lt!456715 () Unit!33774)

(declare-fun e!585850 () Unit!33774)

(assert (=> d!124435 (= lt!456715 e!585850)))

(declare-fun c!104740 () Bool)

(assert (=> d!124435 (= c!104740 lt!456712)))

(assert (=> d!124435 (= lt!456712 (containsKey!564 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124435 (= (contains!6001 lt!456660 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456713)))

(declare-fun b!1035910 () Bool)

(declare-fun lt!456714 () Unit!33774)

(assert (=> b!1035910 (= e!585850 lt!456714)))

(assert (=> b!1035910 (= lt!456714 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035910 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035911 () Bool)

(declare-fun Unit!33779 () Unit!33774)

(assert (=> b!1035911 (= e!585850 Unit!33779)))

(declare-fun b!1035912 () Bool)

(assert (=> b!1035912 (= e!585849 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124435 c!104740) b!1035910))

(assert (= (and d!124435 (not c!104740)) b!1035911))

(assert (= (and d!124435 (not res!691577)) b!1035912))

(declare-fun m!955217 () Bool)

(assert (=> d!124435 m!955217))

(declare-fun m!955219 () Bool)

(assert (=> b!1035910 m!955219))

(declare-fun m!955221 () Bool)

(assert (=> b!1035910 m!955221))

(assert (=> b!1035910 m!955221))

(declare-fun m!955223 () Bool)

(assert (=> b!1035910 m!955223))

(assert (=> b!1035912 m!955221))

(assert (=> b!1035912 m!955221))

(assert (=> b!1035912 m!955223))

(assert (=> bm!43795 d!124435))

(declare-fun b!1035923 () Bool)

(declare-fun res!691586 () Bool)

(declare-fun e!585853 () Bool)

(assert (=> b!1035923 (=> (not res!691586) (not e!585853))))

(declare-fun size!31934 (LongMapFixedSize!5782) (_ BitVec 32))

(assert (=> b!1035923 (= res!691586 (= (size!31934 thiss!1427) (bvadd (_size!2946 thiss!1427) (bvsdiv (bvadd (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124437 () Bool)

(declare-fun res!691587 () Bool)

(assert (=> d!124437 (=> (not res!691587) (not e!585853))))

(assert (=> d!124437 (= res!691587 (validMask!0 (mask!30165 thiss!1427)))))

(assert (=> d!124437 (= (simpleValid!414 thiss!1427) e!585853)))

(declare-fun b!1035924 () Bool)

(assert (=> b!1035924 (= e!585853 (and (bvsge (extraKeys!5999 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5999 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2946 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035922 () Bool)

(declare-fun res!691588 () Bool)

(assert (=> b!1035922 (=> (not res!691588) (not e!585853))))

(assert (=> b!1035922 (= res!691588 (bvsge (size!31934 thiss!1427) (_size!2946 thiss!1427)))))

(declare-fun b!1035921 () Bool)

(declare-fun res!691589 () Bool)

(assert (=> b!1035921 (=> (not res!691589) (not e!585853))))

(assert (=> b!1035921 (= res!691589 (and (= (size!31929 (_values!6292 thiss!1427)) (bvadd (mask!30165 thiss!1427) #b00000000000000000000000000000001)) (= (size!31928 (_keys!11454 thiss!1427)) (size!31929 (_values!6292 thiss!1427))) (bvsge (_size!2946 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2946 thiss!1427) (bvadd (mask!30165 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124437 res!691587) b!1035921))

(assert (= (and b!1035921 res!691589) b!1035922))

(assert (= (and b!1035922 res!691588) b!1035923))

(assert (= (and b!1035923 res!691586) b!1035924))

(declare-fun m!955225 () Bool)

(assert (=> b!1035923 m!955225))

(assert (=> d!124437 m!955077))

(assert (=> b!1035922 m!955225))

(assert (=> d!124425 d!124437))

(declare-fun d!124439 () Bool)

(declare-fun e!585856 () Bool)

(assert (=> d!124439 e!585856))

(declare-fun res!691595 () Bool)

(assert (=> d!124439 (=> (not res!691595) (not e!585856))))

(declare-fun lt!456726 () ListLongMap!13833)

(assert (=> d!124439 (= res!691595 (contains!6001 lt!456726 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun lt!456727 () List!21952)

(assert (=> d!124439 (= lt!456726 (ListLongMap!13834 lt!456727))))

(declare-fun lt!456725 () Unit!33774)

(declare-fun lt!456724 () Unit!33774)

(assert (=> d!124439 (= lt!456725 lt!456724)))

(assert (=> d!124439 (= (getValueByKey!591 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun lemmaContainsTupThenGetReturnValue!281 (List!21952 (_ BitVec 64) V!37667) Unit!33774)

(assert (=> d!124439 (= lt!456724 (lemmaContainsTupThenGetReturnValue!281 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun insertStrictlySorted!374 (List!21952 (_ BitVec 64) V!37667) List!21952)

(assert (=> d!124439 (= lt!456727 (insertStrictlySorted!374 (toList!6932 call!43792) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (=> d!124439 (= (+!3131 call!43792 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) lt!456726)))

(declare-fun b!1035929 () Bool)

(declare-fun res!691594 () Bool)

(assert (=> b!1035929 (=> (not res!691594) (not e!585856))))

(assert (=> b!1035929 (= res!691594 (= (getValueByKey!591 (toList!6932 lt!456726) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun b!1035930 () Bool)

(declare-fun contains!6002 (List!21952 tuple2!15810) Bool)

(assert (=> b!1035930 (= e!585856 (contains!6002 (toList!6932 lt!456726) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))

(assert (= (and d!124439 res!691595) b!1035929))

(assert (= (and b!1035929 res!691594) b!1035930))

(declare-fun m!955227 () Bool)

(assert (=> d!124439 m!955227))

(declare-fun m!955229 () Bool)

(assert (=> d!124439 m!955229))

(declare-fun m!955231 () Bool)

(assert (=> d!124439 m!955231))

(declare-fun m!955233 () Bool)

(assert (=> d!124439 m!955233))

(declare-fun m!955235 () Bool)

(assert (=> b!1035929 m!955235))

(declare-fun m!955237 () Bool)

(assert (=> b!1035930 m!955237))

(assert (=> b!1035838 d!124439))

(declare-fun d!124441 () Bool)

(declare-fun e!585857 () Bool)

(assert (=> d!124441 e!585857))

(declare-fun res!691596 () Bool)

(assert (=> d!124441 (=> res!691596 e!585857)))

(declare-fun lt!456729 () Bool)

(assert (=> d!124441 (= res!691596 (not lt!456729))))

(declare-fun lt!456728 () Bool)

(assert (=> d!124441 (= lt!456729 lt!456728)))

(declare-fun lt!456731 () Unit!33774)

(declare-fun e!585858 () Unit!33774)

(assert (=> d!124441 (= lt!456731 e!585858)))

(declare-fun c!104741 () Bool)

(assert (=> d!124441 (= c!104741 lt!456728)))

(assert (=> d!124441 (= lt!456728 (containsKey!564 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124441 (= (contains!6001 lt!456682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456729)))

(declare-fun b!1035931 () Bool)

(declare-fun lt!456730 () Unit!33774)

(assert (=> b!1035931 (= e!585858 lt!456730)))

(assert (=> b!1035931 (= lt!456730 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035931 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035932 () Bool)

(declare-fun Unit!33780 () Unit!33774)

(assert (=> b!1035932 (= e!585858 Unit!33780)))

(declare-fun b!1035933 () Bool)

(assert (=> b!1035933 (= e!585857 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124441 c!104741) b!1035931))

(assert (= (and d!124441 (not c!104741)) b!1035932))

(assert (= (and d!124441 (not res!691596)) b!1035933))

(declare-fun m!955239 () Bool)

(assert (=> d!124441 m!955239))

(declare-fun m!955241 () Bool)

(assert (=> b!1035931 m!955241))

(declare-fun m!955243 () Bool)

(assert (=> b!1035931 m!955243))

(assert (=> b!1035931 m!955243))

(declare-fun m!955245 () Bool)

(assert (=> b!1035931 m!955245))

(assert (=> b!1035933 m!955243))

(assert (=> b!1035933 m!955243))

(assert (=> b!1035933 m!955245))

(assert (=> bm!43799 d!124441))

(declare-fun d!124443 () Bool)

(declare-fun get!16459 (Option!642) V!37667)

(assert (=> d!124443 (= (apply!900 lt!456660 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16459 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30286 () Bool)

(assert (= bs!30286 d!124443))

(assert (=> bs!30286 m!955221))

(assert (=> bs!30286 m!955221))

(declare-fun m!955247 () Bool)

(assert (=> bs!30286 m!955247))

(assert (=> b!1035837 d!124443))

(declare-fun d!124445 () Bool)

(assert (=> d!124445 (contains!6001 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) lt!456654)))

(declare-fun lt!456734 () Unit!33774)

(declare-fun choose!1710 (ListLongMap!13833 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33774)

(assert (=> d!124445 (= lt!456734 (choose!1710 lt!456670 lt!456653 (zeroValue!6103 thiss!1427) lt!456654))))

(assert (=> d!124445 (contains!6001 lt!456670 lt!456654)))

(assert (=> d!124445 (= (addStillContains!619 lt!456670 lt!456653 (zeroValue!6103 thiss!1427) lt!456654) lt!456734)))

(declare-fun bs!30287 () Bool)

(assert (= bs!30287 d!124445))

(assert (=> bs!30287 m!955105))

(assert (=> bs!30287 m!955105))

(assert (=> bs!30287 m!955107))

(declare-fun m!955249 () Bool)

(assert (=> bs!30287 m!955249))

(declare-fun m!955251 () Bool)

(assert (=> bs!30287 m!955251))

(assert (=> b!1035836 d!124445))

(declare-fun d!124447 () Bool)

(assert (=> d!124447 (= (apply!900 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) lt!456656) (apply!900 lt!456664 lt!456656))))

(declare-fun lt!456737 () Unit!33774)

(declare-fun choose!1711 (ListLongMap!13833 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33774)

(assert (=> d!124447 (= lt!456737 (choose!1711 lt!456664 lt!456661 (zeroValue!6103 thiss!1427) lt!456656))))

(declare-fun e!585861 () Bool)

(assert (=> d!124447 e!585861))

(declare-fun res!691599 () Bool)

(assert (=> d!124447 (=> (not res!691599) (not e!585861))))

(assert (=> d!124447 (= res!691599 (contains!6001 lt!456664 lt!456656))))

(assert (=> d!124447 (= (addApplyDifferent!475 lt!456664 lt!456661 (zeroValue!6103 thiss!1427) lt!456656) lt!456737)))

(declare-fun b!1035938 () Bool)

(assert (=> b!1035938 (= e!585861 (not (= lt!456656 lt!456661)))))

(assert (= (and d!124447 res!691599) b!1035938))

(declare-fun m!955253 () Bool)

(assert (=> d!124447 m!955253))

(declare-fun m!955255 () Bool)

(assert (=> d!124447 m!955255))

(assert (=> d!124447 m!955095))

(assert (=> d!124447 m!955113))

(assert (=> d!124447 m!955095))

(assert (=> d!124447 m!955119))

(assert (=> b!1035836 d!124447))

(declare-fun d!124449 () Bool)

(declare-fun e!585862 () Bool)

(assert (=> d!124449 e!585862))

(declare-fun res!691601 () Bool)

(assert (=> d!124449 (=> (not res!691601) (not e!585862))))

(declare-fun lt!456740 () ListLongMap!13833)

(assert (=> d!124449 (= res!691601 (contains!6001 lt!456740 (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun lt!456741 () List!21952)

(assert (=> d!124449 (= lt!456740 (ListLongMap!13834 lt!456741))))

(declare-fun lt!456739 () Unit!33774)

(declare-fun lt!456738 () Unit!33774)

(assert (=> d!124449 (= lt!456739 lt!456738)))

(assert (=> d!124449 (= (getValueByKey!591 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (=> d!124449 (= lt!456738 (lemmaContainsTupThenGetReturnValue!281 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (=> d!124449 (= lt!456741 (insertStrictlySorted!374 (toList!6932 lt!456668) (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (=> d!124449 (= (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)) lt!456740)))

(declare-fun b!1035939 () Bool)

(declare-fun res!691600 () Bool)

(assert (=> b!1035939 (=> (not res!691600) (not e!585862))))

(assert (=> b!1035939 (= res!691600 (= (getValueByKey!591 (toList!6932 lt!456740) (_1!7916 (tuple2!15811 lt!456652 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(declare-fun b!1035940 () Bool)

(assert (=> b!1035940 (= e!585862 (contains!6002 (toList!6932 lt!456740) (tuple2!15811 lt!456652 lt!456582)))))

(assert (= (and d!124449 res!691601) b!1035939))

(assert (= (and b!1035939 res!691600) b!1035940))

(declare-fun m!955257 () Bool)

(assert (=> d!124449 m!955257))

(declare-fun m!955259 () Bool)

(assert (=> d!124449 m!955259))

(declare-fun m!955261 () Bool)

(assert (=> d!124449 m!955261))

(declare-fun m!955263 () Bool)

(assert (=> d!124449 m!955263))

(declare-fun m!955265 () Bool)

(assert (=> b!1035939 m!955265))

(declare-fun m!955267 () Bool)

(assert (=> b!1035940 m!955267))

(assert (=> b!1035836 d!124449))

(declare-fun d!124451 () Bool)

(assert (=> d!124451 (= (apply!900 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)) lt!456658) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582))) lt!456658)))))

(declare-fun bs!30288 () Bool)

(assert (= bs!30288 d!124451))

(declare-fun m!955269 () Bool)

(assert (=> bs!30288 m!955269))

(assert (=> bs!30288 m!955269))

(declare-fun m!955271 () Bool)

(assert (=> bs!30288 m!955271))

(assert (=> b!1035836 d!124451))

(declare-fun d!124453 () Bool)

(assert (=> d!124453 (= (apply!900 lt!456668 lt!456658) (get!16459 (getValueByKey!591 (toList!6932 lt!456668) lt!456658)))))

(declare-fun bs!30289 () Bool)

(assert (= bs!30289 d!124453))

(declare-fun m!955273 () Bool)

(assert (=> bs!30289 m!955273))

(assert (=> bs!30289 m!955273))

(declare-fun m!955275 () Bool)

(assert (=> bs!30289 m!955275))

(assert (=> b!1035836 d!124453))

(declare-fun d!124455 () Bool)

(declare-fun e!585863 () Bool)

(assert (=> d!124455 e!585863))

(declare-fun res!691603 () Bool)

(assert (=> d!124455 (=> (not res!691603) (not e!585863))))

(declare-fun lt!456744 () ListLongMap!13833)

(assert (=> d!124455 (= res!691603 (contains!6001 lt!456744 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!456745 () List!21952)

(assert (=> d!124455 (= lt!456744 (ListLongMap!13834 lt!456745))))

(declare-fun lt!456743 () Unit!33774)

(declare-fun lt!456742 () Unit!33774)

(assert (=> d!124455 (= lt!456743 lt!456742)))

(assert (=> d!124455 (= (getValueByKey!591 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124455 (= lt!456742 (lemmaContainsTupThenGetReturnValue!281 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124455 (= lt!456745 (insertStrictlySorted!374 (toList!6932 lt!456664) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124455 (= (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) lt!456744)))

(declare-fun b!1035941 () Bool)

(declare-fun res!691602 () Bool)

(assert (=> b!1035941 (=> (not res!691602) (not e!585863))))

(assert (=> b!1035941 (= res!691602 (= (getValueByKey!591 (toList!6932 lt!456744) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1035942 () Bool)

(assert (=> b!1035942 (= e!585863 (contains!6002 (toList!6932 lt!456744) (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124455 res!691603) b!1035941))

(assert (= (and b!1035941 res!691602) b!1035942))

(declare-fun m!955277 () Bool)

(assert (=> d!124455 m!955277))

(declare-fun m!955279 () Bool)

(assert (=> d!124455 m!955279))

(declare-fun m!955281 () Bool)

(assert (=> d!124455 m!955281))

(declare-fun m!955283 () Bool)

(assert (=> d!124455 m!955283))

(declare-fun m!955285 () Bool)

(assert (=> b!1035941 m!955285))

(declare-fun m!955287 () Bool)

(assert (=> b!1035942 m!955287))

(assert (=> b!1035836 d!124455))

(declare-fun d!124457 () Bool)

(declare-fun e!585864 () Bool)

(assert (=> d!124457 e!585864))

(declare-fun res!691605 () Bool)

(assert (=> d!124457 (=> (not res!691605) (not e!585864))))

(declare-fun lt!456748 () ListLongMap!13833)

(assert (=> d!124457 (= res!691605 (contains!6001 lt!456748 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!456749 () List!21952)

(assert (=> d!124457 (= lt!456748 (ListLongMap!13834 lt!456749))))

(declare-fun lt!456747 () Unit!33774)

(declare-fun lt!456746 () Unit!33774)

(assert (=> d!124457 (= lt!456747 lt!456746)))

(assert (=> d!124457 (= (getValueByKey!591 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124457 (= lt!456746 (lemmaContainsTupThenGetReturnValue!281 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124457 (= lt!456749 (insertStrictlySorted!374 (toList!6932 lt!456670) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124457 (= (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) lt!456748)))

(declare-fun b!1035943 () Bool)

(declare-fun res!691604 () Bool)

(assert (=> b!1035943 (=> (not res!691604) (not e!585864))))

(assert (=> b!1035943 (= res!691604 (= (getValueByKey!591 (toList!6932 lt!456748) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1035944 () Bool)

(assert (=> b!1035944 (= e!585864 (contains!6002 (toList!6932 lt!456748) (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124457 res!691605) b!1035943))

(assert (= (and b!1035943 res!691604) b!1035944))

(declare-fun m!955289 () Bool)

(assert (=> d!124457 m!955289))

(declare-fun m!955291 () Bool)

(assert (=> d!124457 m!955291))

(declare-fun m!955293 () Bool)

(assert (=> d!124457 m!955293))

(declare-fun m!955295 () Bool)

(assert (=> d!124457 m!955295))

(declare-fun m!955297 () Bool)

(assert (=> b!1035943 m!955297))

(declare-fun m!955299 () Bool)

(assert (=> b!1035944 m!955299))

(assert (=> b!1035836 d!124457))

(declare-fun d!124459 () Bool)

(declare-fun e!585865 () Bool)

(assert (=> d!124459 e!585865))

(declare-fun res!691607 () Bool)

(assert (=> d!124459 (=> (not res!691607) (not e!585865))))

(declare-fun lt!456752 () ListLongMap!13833)

(assert (=> d!124459 (= res!691607 (contains!6001 lt!456752 (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun lt!456753 () List!21952)

(assert (=> d!124459 (= lt!456752 (ListLongMap!13834 lt!456753))))

(declare-fun lt!456751 () Unit!33774)

(declare-fun lt!456750 () Unit!33774)

(assert (=> d!124459 (= lt!456751 lt!456750)))

(assert (=> d!124459 (= (getValueByKey!591 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (=> d!124459 (= lt!456750 (lemmaContainsTupThenGetReturnValue!281 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (=> d!124459 (= lt!456753 (insertStrictlySorted!374 (toList!6932 lt!456659) (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (=> d!124459 (= (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)) lt!456752)))

(declare-fun b!1035945 () Bool)

(declare-fun res!691606 () Bool)

(assert (=> b!1035945 (=> (not res!691606) (not e!585865))))

(assert (=> b!1035945 (= res!691606 (= (getValueByKey!591 (toList!6932 lt!456752) (_1!7916 (tuple2!15811 lt!456649 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(declare-fun b!1035946 () Bool)

(assert (=> b!1035946 (= e!585865 (contains!6002 (toList!6932 lt!456752) (tuple2!15811 lt!456649 lt!456582)))))

(assert (= (and d!124459 res!691607) b!1035945))

(assert (= (and b!1035945 res!691606) b!1035946))

(declare-fun m!955301 () Bool)

(assert (=> d!124459 m!955301))

(declare-fun m!955303 () Bool)

(assert (=> d!124459 m!955303))

(declare-fun m!955305 () Bool)

(assert (=> d!124459 m!955305))

(declare-fun m!955307 () Bool)

(assert (=> d!124459 m!955307))

(declare-fun m!955309 () Bool)

(assert (=> b!1035945 m!955309))

(declare-fun m!955311 () Bool)

(assert (=> b!1035946 m!955311))

(assert (=> b!1035836 d!124459))

(declare-fun d!124461 () Bool)

(assert (=> d!124461 (= (apply!900 lt!456664 lt!456656) (get!16459 (getValueByKey!591 (toList!6932 lt!456664) lt!456656)))))

(declare-fun bs!30290 () Bool)

(assert (= bs!30290 d!124461))

(declare-fun m!955313 () Bool)

(assert (=> bs!30290 m!955313))

(assert (=> bs!30290 m!955313))

(declare-fun m!955315 () Bool)

(assert (=> bs!30290 m!955315))

(assert (=> b!1035836 d!124461))

(declare-fun b!1035971 () Bool)

(declare-fun e!585880 () ListLongMap!13833)

(declare-fun call!43808 () ListLongMap!13833)

(assert (=> b!1035971 (= e!585880 call!43808)))

(declare-fun b!1035972 () Bool)

(declare-fun e!585882 () Bool)

(declare-fun e!585883 () Bool)

(assert (=> b!1035972 (= e!585882 e!585883)))

(declare-fun c!104751 () Bool)

(declare-fun e!585884 () Bool)

(assert (=> b!1035972 (= c!104751 e!585884)))

(declare-fun res!691619 () Bool)

(assert (=> b!1035972 (=> (not res!691619) (not e!585884))))

(assert (=> b!1035972 (= res!691619 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun bm!43805 () Bool)

(assert (=> bm!43805 (= call!43808 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun d!124463 () Bool)

(assert (=> d!124463 e!585882))

(declare-fun res!691617 () Bool)

(assert (=> d!124463 (=> (not res!691617) (not e!585882))))

(declare-fun lt!456772 () ListLongMap!13833)

(assert (=> d!124463 (= res!691617 (not (contains!6001 lt!456772 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!585881 () ListLongMap!13833)

(assert (=> d!124463 (= lt!456772 e!585881)))

(declare-fun c!104750 () Bool)

(assert (=> d!124463 (= c!104750 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124463 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124463 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!456772)))

(declare-fun b!1035973 () Bool)

(assert (=> b!1035973 (= e!585884 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035973 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1035974 () Bool)

(declare-fun e!585885 () Bool)

(assert (=> b!1035974 (= e!585883 e!585885)))

(declare-fun c!104752 () Bool)

(assert (=> b!1035974 (= c!104752 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1035975 () Bool)

(declare-fun lt!456773 () Unit!33774)

(declare-fun lt!456769 () Unit!33774)

(assert (=> b!1035975 (= lt!456773 lt!456769)))

(declare-fun lt!456770 () (_ BitVec 64))

(declare-fun lt!456771 () ListLongMap!13833)

(declare-fun lt!456768 () (_ BitVec 64))

(declare-fun lt!456774 () V!37667)

(assert (=> b!1035975 (not (contains!6001 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774)) lt!456770))))

(declare-fun addStillNotContains!244 (ListLongMap!13833 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33774)

(assert (=> b!1035975 (= lt!456769 (addStillNotContains!244 lt!456771 lt!456768 lt!456774 lt!456770))))

(assert (=> b!1035975 (= lt!456770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1035975 (= lt!456774 (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035975 (= lt!456768 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035975 (= lt!456771 call!43808)))

(assert (=> b!1035975 (= e!585880 (+!3131 call!43808 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1035976 () Bool)

(declare-fun e!585886 () Bool)

(assert (=> b!1035976 (= e!585883 e!585886)))

(assert (=> b!1035976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun res!691618 () Bool)

(assert (=> b!1035976 (= res!691618 (contains!6001 lt!456772 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035976 (=> (not res!691618) (not e!585886))))

(declare-fun b!1035977 () Bool)

(assert (=> b!1035977 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> b!1035977 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31929 (_values!6292 thiss!1427))))))

(assert (=> b!1035977 (= e!585886 (= (apply!900 lt!456772 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035978 () Bool)

(assert (=> b!1035978 (= e!585885 (= lt!456772 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1035979 () Bool)

(assert (=> b!1035979 (= e!585881 (ListLongMap!13834 Nil!21949))))

(declare-fun b!1035980 () Bool)

(declare-fun isEmpty!934 (ListLongMap!13833) Bool)

(assert (=> b!1035980 (= e!585885 (isEmpty!934 lt!456772))))

(declare-fun b!1035981 () Bool)

(declare-fun res!691616 () Bool)

(assert (=> b!1035981 (=> (not res!691616) (not e!585882))))

(assert (=> b!1035981 (= res!691616 (not (contains!6001 lt!456772 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035982 () Bool)

(assert (=> b!1035982 (= e!585881 e!585880)))

(declare-fun c!104753 () Bool)

(assert (=> b!1035982 (= c!104753 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124463 c!104750) b!1035979))

(assert (= (and d!124463 (not c!104750)) b!1035982))

(assert (= (and b!1035982 c!104753) b!1035975))

(assert (= (and b!1035982 (not c!104753)) b!1035971))

(assert (= (or b!1035975 b!1035971) bm!43805))

(assert (= (and d!124463 res!691617) b!1035981))

(assert (= (and b!1035981 res!691616) b!1035972))

(assert (= (and b!1035972 res!691619) b!1035973))

(assert (= (and b!1035972 c!104751) b!1035976))

(assert (= (and b!1035972 (not c!104751)) b!1035974))

(assert (= (and b!1035976 res!691618) b!1035977))

(assert (= (and b!1035974 c!104752) b!1035978))

(assert (= (and b!1035974 (not c!104752)) b!1035980))

(declare-fun b_lambda!16095 () Bool)

(assert (=> (not b_lambda!16095) (not b!1035975)))

(assert (=> b!1035975 t!31154))

(declare-fun b_and!33365 () Bool)

(assert (= b_and!33363 (and (=> t!31154 result!14419) b_and!33365)))

(declare-fun b_lambda!16097 () Bool)

(assert (=> (not b_lambda!16097) (not b!1035977)))

(assert (=> b!1035977 t!31154))

(declare-fun b_and!33367 () Bool)

(assert (= b_and!33365 (and (=> t!31154 result!14419) b_and!33367)))

(declare-fun m!955317 () Bool)

(assert (=> b!1035980 m!955317))

(declare-fun m!955319 () Bool)

(assert (=> b!1035978 m!955319))

(declare-fun m!955321 () Bool)

(assert (=> b!1035981 m!955321))

(assert (=> b!1035982 m!955067))

(assert (=> b!1035982 m!955067))

(assert (=> b!1035982 m!955085))

(assert (=> b!1035977 m!955071))

(assert (=> b!1035977 m!955073))

(assert (=> b!1035977 m!955067))

(assert (=> b!1035977 m!955073))

(assert (=> b!1035977 m!955071))

(assert (=> b!1035977 m!955075))

(assert (=> b!1035977 m!955067))

(declare-fun m!955323 () Bool)

(assert (=> b!1035977 m!955323))

(declare-fun m!955325 () Bool)

(assert (=> d!124463 m!955325))

(assert (=> d!124463 m!955077))

(declare-fun m!955327 () Bool)

(assert (=> b!1035975 m!955327))

(assert (=> b!1035975 m!955071))

(assert (=> b!1035975 m!955327))

(declare-fun m!955329 () Bool)

(assert (=> b!1035975 m!955329))

(assert (=> b!1035975 m!955067))

(assert (=> b!1035975 m!955073))

(assert (=> b!1035975 m!955071))

(assert (=> b!1035975 m!955075))

(declare-fun m!955331 () Bool)

(assert (=> b!1035975 m!955331))

(assert (=> b!1035975 m!955073))

(declare-fun m!955333 () Bool)

(assert (=> b!1035975 m!955333))

(assert (=> b!1035973 m!955067))

(assert (=> b!1035973 m!955067))

(assert (=> b!1035973 m!955085))

(assert (=> bm!43805 m!955319))

(assert (=> b!1035976 m!955067))

(assert (=> b!1035976 m!955067))

(declare-fun m!955335 () Bool)

(assert (=> b!1035976 m!955335))

(assert (=> b!1035836 d!124463))

(declare-fun d!124465 () Bool)

(assert (=> d!124465 (= (apply!900 lt!456659 lt!456665) (get!16459 (getValueByKey!591 (toList!6932 lt!456659) lt!456665)))))

(declare-fun bs!30291 () Bool)

(assert (= bs!30291 d!124465))

(declare-fun m!955337 () Bool)

(assert (=> bs!30291 m!955337))

(assert (=> bs!30291 m!955337))

(declare-fun m!955339 () Bool)

(assert (=> bs!30291 m!955339))

(assert (=> b!1035836 d!124465))

(declare-fun d!124467 () Bool)

(assert (=> d!124467 (= (apply!900 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) lt!456656) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!456656)))))

(declare-fun bs!30292 () Bool)

(assert (= bs!30292 d!124467))

(declare-fun m!955341 () Bool)

(assert (=> bs!30292 m!955341))

(assert (=> bs!30292 m!955341))

(declare-fun m!955343 () Bool)

(assert (=> bs!30292 m!955343))

(assert (=> b!1035836 d!124467))

(declare-fun d!124469 () Bool)

(assert (=> d!124469 (= (apply!900 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)) lt!456658) (apply!900 lt!456668 lt!456658))))

(declare-fun lt!456775 () Unit!33774)

(assert (=> d!124469 (= lt!456775 (choose!1711 lt!456668 lt!456652 lt!456582 lt!456658))))

(declare-fun e!585887 () Bool)

(assert (=> d!124469 e!585887))

(declare-fun res!691620 () Bool)

(assert (=> d!124469 (=> (not res!691620) (not e!585887))))

(assert (=> d!124469 (= res!691620 (contains!6001 lt!456668 lt!456658))))

(assert (=> d!124469 (= (addApplyDifferent!475 lt!456668 lt!456652 lt!456582 lt!456658) lt!456775)))

(declare-fun b!1035983 () Bool)

(assert (=> b!1035983 (= e!585887 (not (= lt!456658 lt!456652)))))

(assert (= (and d!124469 res!691620) b!1035983))

(declare-fun m!955345 () Bool)

(assert (=> d!124469 m!955345))

(declare-fun m!955347 () Bool)

(assert (=> d!124469 m!955347))

(assert (=> d!124469 m!955097))

(assert (=> d!124469 m!955115))

(assert (=> d!124469 m!955097))

(assert (=> d!124469 m!955111))

(assert (=> b!1035836 d!124469))

(declare-fun d!124471 () Bool)

(declare-fun e!585888 () Bool)

(assert (=> d!124471 e!585888))

(declare-fun res!691621 () Bool)

(assert (=> d!124471 (=> res!691621 e!585888)))

(declare-fun lt!456777 () Bool)

(assert (=> d!124471 (= res!691621 (not lt!456777))))

(declare-fun lt!456776 () Bool)

(assert (=> d!124471 (= lt!456777 lt!456776)))

(declare-fun lt!456779 () Unit!33774)

(declare-fun e!585889 () Unit!33774)

(assert (=> d!124471 (= lt!456779 e!585889)))

(declare-fun c!104754 () Bool)

(assert (=> d!124471 (= c!104754 lt!456776)))

(assert (=> d!124471 (= lt!456776 (containsKey!564 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))

(assert (=> d!124471 (= (contains!6001 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) lt!456654) lt!456777)))

(declare-fun b!1035984 () Bool)

(declare-fun lt!456778 () Unit!33774)

(assert (=> b!1035984 (= e!585889 lt!456778)))

(assert (=> b!1035984 (= lt!456778 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))

(assert (=> b!1035984 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))

(declare-fun b!1035985 () Bool)

(declare-fun Unit!33781 () Unit!33774)

(assert (=> b!1035985 (= e!585889 Unit!33781)))

(declare-fun b!1035986 () Bool)

(assert (=> b!1035986 (= e!585888 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654)))))

(assert (= (and d!124471 c!104754) b!1035984))

(assert (= (and d!124471 (not c!104754)) b!1035985))

(assert (= (and d!124471 (not res!691621)) b!1035986))

(declare-fun m!955349 () Bool)

(assert (=> d!124471 m!955349))

(declare-fun m!955351 () Bool)

(assert (=> b!1035984 m!955351))

(declare-fun m!955353 () Bool)

(assert (=> b!1035984 m!955353))

(assert (=> b!1035984 m!955353))

(declare-fun m!955355 () Bool)

(assert (=> b!1035984 m!955355))

(assert (=> b!1035986 m!955353))

(assert (=> b!1035986 m!955353))

(assert (=> b!1035986 m!955355))

(assert (=> b!1035836 d!124471))

(declare-fun d!124473 () Bool)

(assert (=> d!124473 (= (apply!900 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)) lt!456665) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582))) lt!456665)))))

(declare-fun bs!30293 () Bool)

(assert (= bs!30293 d!124473))

(declare-fun m!955357 () Bool)

(assert (=> bs!30293 m!955357))

(assert (=> bs!30293 m!955357))

(declare-fun m!955359 () Bool)

(assert (=> bs!30293 m!955359))

(assert (=> b!1035836 d!124473))

(declare-fun d!124475 () Bool)

(assert (=> d!124475 (= (apply!900 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)) lt!456665) (apply!900 lt!456659 lt!456665))))

(declare-fun lt!456780 () Unit!33774)

(assert (=> d!124475 (= lt!456780 (choose!1711 lt!456659 lt!456649 lt!456582 lt!456665))))

(declare-fun e!585890 () Bool)

(assert (=> d!124475 e!585890))

(declare-fun res!691622 () Bool)

(assert (=> d!124475 (=> (not res!691622) (not e!585890))))

(assert (=> d!124475 (= res!691622 (contains!6001 lt!456659 lt!456665))))

(assert (=> d!124475 (= (addApplyDifferent!475 lt!456659 lt!456649 lt!456582 lt!456665) lt!456780)))

(declare-fun b!1035987 () Bool)

(assert (=> b!1035987 (= e!585890 (not (= lt!456665 lt!456649)))))

(assert (= (and d!124475 res!691622) b!1035987))

(declare-fun m!955361 () Bool)

(assert (=> d!124475 m!955361))

(declare-fun m!955363 () Bool)

(assert (=> d!124475 m!955363))

(assert (=> d!124475 m!955099))

(assert (=> d!124475 m!955103))

(assert (=> d!124475 m!955099))

(assert (=> d!124475 m!955109))

(assert (=> b!1035836 d!124475))

(declare-fun d!124477 () Bool)

(assert (=> d!124477 (= (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035828 d!124477))

(declare-fun d!124479 () Bool)

(declare-fun e!585891 () Bool)

(assert (=> d!124479 e!585891))

(declare-fun res!691623 () Bool)

(assert (=> d!124479 (=> res!691623 e!585891)))

(declare-fun lt!456782 () Bool)

(assert (=> d!124479 (= res!691623 (not lt!456782))))

(declare-fun lt!456781 () Bool)

(assert (=> d!124479 (= lt!456782 lt!456781)))

(declare-fun lt!456784 () Unit!33774)

(declare-fun e!585892 () Unit!33774)

(assert (=> d!124479 (= lt!456784 e!585892)))

(declare-fun c!104755 () Bool)

(assert (=> d!124479 (= c!104755 lt!456781)))

(assert (=> d!124479 (= lt!456781 (containsKey!564 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124479 (= (contains!6001 lt!456660 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!456782)))

(declare-fun b!1035988 () Bool)

(declare-fun lt!456783 () Unit!33774)

(assert (=> b!1035988 (= e!585892 lt!456783)))

(assert (=> b!1035988 (= lt!456783 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035988 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035989 () Bool)

(declare-fun Unit!33782 () Unit!33774)

(assert (=> b!1035989 (= e!585892 Unit!33782)))

(declare-fun b!1035990 () Bool)

(assert (=> b!1035990 (= e!585891 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124479 c!104755) b!1035988))

(assert (= (and d!124479 (not c!104755)) b!1035989))

(assert (= (and d!124479 (not res!691623)) b!1035990))

(assert (=> d!124479 m!955067))

(declare-fun m!955365 () Bool)

(assert (=> d!124479 m!955365))

(assert (=> b!1035988 m!955067))

(declare-fun m!955367 () Bool)

(assert (=> b!1035988 m!955367))

(assert (=> b!1035988 m!955067))

(declare-fun m!955369 () Bool)

(assert (=> b!1035988 m!955369))

(assert (=> b!1035988 m!955369))

(declare-fun m!955371 () Bool)

(assert (=> b!1035988 m!955371))

(assert (=> b!1035990 m!955067))

(assert (=> b!1035990 m!955369))

(assert (=> b!1035990 m!955369))

(assert (=> b!1035990 m!955371))

(assert (=> b!1035844 d!124479))

(declare-fun b!1035999 () Bool)

(declare-fun e!585897 () (_ BitVec 32))

(assert (=> b!1035999 (= e!585897 #b00000000000000000000000000000000)))

(declare-fun d!124481 () Bool)

(declare-fun lt!456787 () (_ BitVec 32))

(assert (=> d!124481 (and (bvsge lt!456787 #b00000000000000000000000000000000) (bvsle lt!456787 (bvsub (size!31928 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124481 (= lt!456787 e!585897)))

(declare-fun c!104760 () Bool)

(assert (=> d!124481 (= c!104760 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124481 (and (bvsle #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31928 (_keys!11454 thiss!1427)) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124481 (= (arrayCountValidKeys!0 (_keys!11454 thiss!1427) #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))) lt!456787)))

(declare-fun b!1036000 () Bool)

(declare-fun e!585898 () (_ BitVec 32))

(assert (=> b!1036000 (= e!585897 e!585898)))

(declare-fun c!104761 () Bool)

(assert (=> b!1036000 (= c!104761 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43808 () Bool)

(declare-fun call!43811 () (_ BitVec 32))

(assert (=> bm!43808 (= call!43811 (arrayCountValidKeys!0 (_keys!11454 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1036001 () Bool)

(assert (=> b!1036001 (= e!585898 (bvadd #b00000000000000000000000000000001 call!43811))))

(declare-fun b!1036002 () Bool)

(assert (=> b!1036002 (= e!585898 call!43811)))

(assert (= (and d!124481 c!104760) b!1035999))

(assert (= (and d!124481 (not c!104760)) b!1036000))

(assert (= (and b!1036000 c!104761) b!1036001))

(assert (= (and b!1036000 (not c!104761)) b!1036002))

(assert (= (or b!1036001 b!1036002) bm!43808))

(assert (=> b!1036000 m!955067))

(assert (=> b!1036000 m!955067))

(assert (=> b!1036000 m!955085))

(declare-fun m!955373 () Bool)

(assert (=> bm!43808 m!955373))

(assert (=> b!1035875 d!124481))

(declare-fun d!124483 () Bool)

(assert (=> d!124483 (= (validMask!0 (mask!30165 thiss!1427)) (and (or (= (mask!30165 thiss!1427) #b00000000000000000000000000000111) (= (mask!30165 thiss!1427) #b00000000000000000000000000001111) (= (mask!30165 thiss!1427) #b00000000000000000000000000011111) (= (mask!30165 thiss!1427) #b00000000000000000000000000111111) (= (mask!30165 thiss!1427) #b00000000000000000000000001111111) (= (mask!30165 thiss!1427) #b00000000000000000000000011111111) (= (mask!30165 thiss!1427) #b00000000000000000000000111111111) (= (mask!30165 thiss!1427) #b00000000000000000000001111111111) (= (mask!30165 thiss!1427) #b00000000000000000000011111111111) (= (mask!30165 thiss!1427) #b00000000000000000000111111111111) (= (mask!30165 thiss!1427) #b00000000000000000001111111111111) (= (mask!30165 thiss!1427) #b00000000000000000011111111111111) (= (mask!30165 thiss!1427) #b00000000000000000111111111111111) (= (mask!30165 thiss!1427) #b00000000000000001111111111111111) (= (mask!30165 thiss!1427) #b00000000000000011111111111111111) (= (mask!30165 thiss!1427) #b00000000000000111111111111111111) (= (mask!30165 thiss!1427) #b00000000000001111111111111111111) (= (mask!30165 thiss!1427) #b00000000000011111111111111111111) (= (mask!30165 thiss!1427) #b00000000000111111111111111111111) (= (mask!30165 thiss!1427) #b00000000001111111111111111111111) (= (mask!30165 thiss!1427) #b00000000011111111111111111111111) (= (mask!30165 thiss!1427) #b00000000111111111111111111111111) (= (mask!30165 thiss!1427) #b00000001111111111111111111111111) (= (mask!30165 thiss!1427) #b00000011111111111111111111111111) (= (mask!30165 thiss!1427) #b00000111111111111111111111111111) (= (mask!30165 thiss!1427) #b00001111111111111111111111111111) (= (mask!30165 thiss!1427) #b00011111111111111111111111111111) (= (mask!30165 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30165 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!124415 d!124483))

(declare-fun d!124485 () Bool)

(assert (=> d!124485 (= (apply!900 lt!456660 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16459 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30294 () Bool)

(assert (= bs!30294 d!124485))

(assert (=> bs!30294 m!955067))

(assert (=> bs!30294 m!955369))

(assert (=> bs!30294 m!955369))

(declare-fun m!955375 () Bool)

(assert (=> bs!30294 m!955375))

(assert (=> b!1035827 d!124485))

(declare-fun d!124487 () Bool)

(declare-fun c!104764 () Bool)

(assert (=> d!124487 (= c!104764 ((_ is ValueCellFull!11594) (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585901 () V!37667)

(assert (=> d!124487 (= (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!585901)))

(declare-fun b!1036007 () Bool)

(declare-fun get!16460 (ValueCell!11594 V!37667) V!37667)

(assert (=> b!1036007 (= e!585901 (get!16460 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036008 () Bool)

(declare-fun get!16461 (ValueCell!11594 V!37667) V!37667)

(assert (=> b!1036008 (= e!585901 (get!16461 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124487 c!104764) b!1036007))

(assert (= (and d!124487 (not c!104764)) b!1036008))

(assert (=> b!1036007 m!955073))

(assert (=> b!1036007 m!955071))

(declare-fun m!955377 () Bool)

(assert (=> b!1036007 m!955377))

(assert (=> b!1036008 m!955073))

(assert (=> b!1036008 m!955071))

(declare-fun m!955379 () Bool)

(assert (=> b!1036008 m!955379))

(assert (=> b!1035827 d!124487))

(declare-fun d!124489 () Bool)

(assert (=> d!124489 (= (apply!900 lt!456682 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16459 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30295 () Bool)

(assert (= bs!30295 d!124489))

(declare-fun m!955381 () Bool)

(assert (=> bs!30295 m!955381))

(assert (=> bs!30295 m!955381))

(declare-fun m!955383 () Bool)

(assert (=> bs!30295 m!955383))

(assert (=> b!1035858 d!124489))

(declare-fun d!124491 () Bool)

(declare-fun e!585902 () Bool)

(assert (=> d!124491 e!585902))

(declare-fun res!691625 () Bool)

(assert (=> d!124491 (=> (not res!691625) (not e!585902))))

(declare-fun lt!456790 () ListLongMap!13833)

(assert (=> d!124491 (= res!691625 (contains!6001 lt!456790 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun lt!456791 () List!21952)

(assert (=> d!124491 (= lt!456790 (ListLongMap!13834 lt!456791))))

(declare-fun lt!456789 () Unit!33774)

(declare-fun lt!456788 () Unit!33774)

(assert (=> d!124491 (= lt!456789 lt!456788)))

(assert (=> d!124491 (= (getValueByKey!591 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) (Some!641 (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> d!124491 (= lt!456788 (lemmaContainsTupThenGetReturnValue!281 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> d!124491 (= lt!456791 (insertStrictlySorted!374 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> d!124491 (= (+!3131 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) lt!456790)))

(declare-fun b!1036009 () Bool)

(declare-fun res!691624 () Bool)

(assert (=> b!1036009 (=> (not res!691624) (not e!585902))))

(assert (=> b!1036009 (= res!691624 (= (getValueByKey!591 (toList!6932 lt!456790) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) (Some!641 (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun b!1036010 () Bool)

(assert (=> b!1036010 (= e!585902 (contains!6002 (toList!6932 lt!456790) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (= (and d!124491 res!691625) b!1036009))

(assert (= (and b!1036009 res!691624) b!1036010))

(declare-fun m!955385 () Bool)

(assert (=> d!124491 m!955385))

(declare-fun m!955387 () Bool)

(assert (=> d!124491 m!955387))

(declare-fun m!955389 () Bool)

(assert (=> d!124491 m!955389))

(declare-fun m!955391 () Bool)

(assert (=> d!124491 m!955391))

(declare-fun m!955393 () Bool)

(assert (=> b!1036009 m!955393))

(declare-fun m!955395 () Bool)

(assert (=> b!1036010 m!955395))

(assert (=> bm!43790 d!124491))

(declare-fun d!124493 () Bool)

(declare-fun e!585903 () Bool)

(assert (=> d!124493 e!585903))

(declare-fun res!691626 () Bool)

(assert (=> d!124493 (=> res!691626 e!585903)))

(declare-fun lt!456793 () Bool)

(assert (=> d!124493 (= res!691626 (not lt!456793))))

(declare-fun lt!456792 () Bool)

(assert (=> d!124493 (= lt!456793 lt!456792)))

(declare-fun lt!456795 () Unit!33774)

(declare-fun e!585904 () Unit!33774)

(assert (=> d!124493 (= lt!456795 e!585904)))

(declare-fun c!104765 () Bool)

(assert (=> d!124493 (= c!104765 lt!456792)))

(assert (=> d!124493 (= lt!456792 (containsKey!564 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124493 (= (contains!6001 lt!456693 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456793)))

(declare-fun b!1036011 () Bool)

(declare-fun lt!456794 () Unit!33774)

(assert (=> b!1036011 (= e!585904 lt!456794)))

(assert (=> b!1036011 (= lt!456794 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036011 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036012 () Bool)

(declare-fun Unit!33783 () Unit!33774)

(assert (=> b!1036012 (= e!585904 Unit!33783)))

(declare-fun b!1036013 () Bool)

(assert (=> b!1036013 (= e!585903 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124493 c!104765) b!1036011))

(assert (= (and d!124493 (not c!104765)) b!1036012))

(assert (= (and d!124493 (not res!691626)) b!1036013))

(declare-fun m!955397 () Bool)

(assert (=> d!124493 m!955397))

(declare-fun m!955399 () Bool)

(assert (=> b!1036011 m!955399))

(declare-fun m!955401 () Bool)

(assert (=> b!1036011 m!955401))

(assert (=> b!1036011 m!955401))

(declare-fun m!955403 () Bool)

(assert (=> b!1036011 m!955403))

(assert (=> b!1036013 m!955401))

(assert (=> b!1036013 m!955401))

(assert (=> b!1036013 m!955403))

(assert (=> d!124419 d!124493))

(declare-fun b!1036014 () Bool)

(declare-fun e!585907 () List!21952)

(assert (=> b!1036014 (= e!585907 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))

(declare-fun b!1036015 () Bool)

(declare-fun e!585905 () List!21952)

(assert (=> b!1036015 (= e!585905 ($colon$colon!605 (removeStrictlySorted!57 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23150 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))

(declare-fun b!1036016 () Bool)

(assert (=> b!1036016 (= e!585905 Nil!21949)))

(declare-fun d!124495 () Bool)

(declare-fun e!585906 () Bool)

(assert (=> d!124495 e!585906))

(declare-fun res!691627 () Bool)

(assert (=> d!124495 (=> (not res!691627) (not e!585906))))

(declare-fun lt!456796 () List!21952)

(assert (=> d!124495 (= res!691627 (isStrictlySorted!715 lt!456796))))

(assert (=> d!124495 (= lt!456796 e!585907)))

(declare-fun c!104767 () Bool)

(assert (=> d!124495 (= c!104767 (and ((_ is Cons!21948) (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) (= (_1!7916 (h!23150 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124495 (isStrictlySorted!715 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))

(assert (=> d!124495 (= (removeStrictlySorted!57 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456796)))

(declare-fun b!1036017 () Bool)

(assert (=> b!1036017 (= e!585907 e!585905)))

(declare-fun c!104766 () Bool)

(assert (=> b!1036017 (= c!104766 (and ((_ is Cons!21948) (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) (not (= (_1!7916 (h!23150 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036018 () Bool)

(assert (=> b!1036018 (= e!585906 (not (containsKey!564 lt!456796 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124495 c!104767) b!1036014))

(assert (= (and d!124495 (not c!104767)) b!1036017))

(assert (= (and b!1036017 c!104766) b!1036015))

(assert (= (and b!1036017 (not c!104766)) b!1036016))

(assert (= (and d!124495 res!691627) b!1036018))

(declare-fun m!955405 () Bool)

(assert (=> b!1036015 m!955405))

(assert (=> b!1036015 m!955405))

(declare-fun m!955407 () Bool)

(assert (=> b!1036015 m!955407))

(declare-fun m!955409 () Bool)

(assert (=> d!124495 m!955409))

(declare-fun m!955411 () Bool)

(assert (=> d!124495 m!955411))

(declare-fun m!955413 () Bool)

(assert (=> b!1036018 m!955413))

(assert (=> d!124419 d!124495))

(declare-fun d!124497 () Bool)

(assert (=> d!124497 (= (apply!900 lt!456681 lt!456687) (get!16459 (getValueByKey!591 (toList!6932 lt!456681) lt!456687)))))

(declare-fun bs!30296 () Bool)

(assert (= bs!30296 d!124497))

(declare-fun m!955415 () Bool)

(assert (=> bs!30296 m!955415))

(assert (=> bs!30296 m!955415))

(declare-fun m!955417 () Bool)

(assert (=> bs!30296 m!955417))

(assert (=> b!1035857 d!124497))

(declare-fun d!124499 () Bool)

(declare-fun e!585908 () Bool)

(assert (=> d!124499 e!585908))

(declare-fun res!691628 () Bool)

(assert (=> d!124499 (=> res!691628 e!585908)))

(declare-fun lt!456798 () Bool)

(assert (=> d!124499 (= res!691628 (not lt!456798))))

(declare-fun lt!456797 () Bool)

(assert (=> d!124499 (= lt!456798 lt!456797)))

(declare-fun lt!456800 () Unit!33774)

(declare-fun e!585909 () Unit!33774)

(assert (=> d!124499 (= lt!456800 e!585909)))

(declare-fun c!104768 () Bool)

(assert (=> d!124499 (= c!104768 lt!456797)))

(assert (=> d!124499 (= lt!456797 (containsKey!564 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))

(assert (=> d!124499 (= (contains!6001 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) lt!456676) lt!456798)))

(declare-fun b!1036019 () Bool)

(declare-fun lt!456799 () Unit!33774)

(assert (=> b!1036019 (= e!585909 lt!456799)))

(assert (=> b!1036019 (= lt!456799 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))

(assert (=> b!1036019 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))

(declare-fun b!1036020 () Bool)

(declare-fun Unit!33784 () Unit!33774)

(assert (=> b!1036020 (= e!585909 Unit!33784)))

(declare-fun b!1036021 () Bool)

(assert (=> b!1036021 (= e!585908 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676)))))

(assert (= (and d!124499 c!104768) b!1036019))

(assert (= (and d!124499 (not c!104768)) b!1036020))

(assert (= (and d!124499 (not res!691628)) b!1036021))

(declare-fun m!955419 () Bool)

(assert (=> d!124499 m!955419))

(declare-fun m!955421 () Bool)

(assert (=> b!1036019 m!955421))

(declare-fun m!955423 () Bool)

(assert (=> b!1036019 m!955423))

(assert (=> b!1036019 m!955423))

(declare-fun m!955425 () Bool)

(assert (=> b!1036019 m!955425))

(assert (=> b!1036021 m!955423))

(assert (=> b!1036021 m!955423))

(assert (=> b!1036021 m!955425))

(assert (=> b!1035857 d!124499))

(declare-fun d!124501 () Bool)

(assert (=> d!124501 (= (apply!900 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) lt!456687) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!456687)))))

(declare-fun bs!30297 () Bool)

(assert (= bs!30297 d!124501))

(declare-fun m!955427 () Bool)

(assert (=> bs!30297 m!955427))

(assert (=> bs!30297 m!955427))

(declare-fun m!955429 () Bool)

(assert (=> bs!30297 m!955429))

(assert (=> b!1035857 d!124501))

(declare-fun d!124503 () Bool)

(declare-fun e!585910 () Bool)

(assert (=> d!124503 e!585910))

(declare-fun res!691630 () Bool)

(assert (=> d!124503 (=> (not res!691630) (not e!585910))))

(declare-fun lt!456803 () ListLongMap!13833)

(assert (=> d!124503 (= res!691630 (contains!6001 lt!456803 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!456804 () List!21952)

(assert (=> d!124503 (= lt!456803 (ListLongMap!13834 lt!456804))))

(declare-fun lt!456802 () Unit!33774)

(declare-fun lt!456801 () Unit!33774)

(assert (=> d!124503 (= lt!456802 lt!456801)))

(assert (=> d!124503 (= (getValueByKey!591 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124503 (= lt!456801 (lemmaContainsTupThenGetReturnValue!281 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124503 (= lt!456804 (insertStrictlySorted!374 (toList!6932 lt!456686) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124503 (= (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) lt!456803)))

(declare-fun b!1036022 () Bool)

(declare-fun res!691629 () Bool)

(assert (=> b!1036022 (=> (not res!691629) (not e!585910))))

(assert (=> b!1036022 (= res!691629 (= (getValueByKey!591 (toList!6932 lt!456803) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1036023 () Bool)

(assert (=> b!1036023 (= e!585910 (contains!6002 (toList!6932 lt!456803) (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124503 res!691630) b!1036022))

(assert (= (and b!1036022 res!691629) b!1036023))

(declare-fun m!955431 () Bool)

(assert (=> d!124503 m!955431))

(declare-fun m!955433 () Bool)

(assert (=> d!124503 m!955433))

(declare-fun m!955435 () Bool)

(assert (=> d!124503 m!955435))

(declare-fun m!955437 () Bool)

(assert (=> d!124503 m!955437))

(declare-fun m!955439 () Bool)

(assert (=> b!1036022 m!955439))

(declare-fun m!955441 () Bool)

(assert (=> b!1036023 m!955441))

(assert (=> b!1035857 d!124503))

(declare-fun d!124505 () Bool)

(assert (=> d!124505 (= (apply!900 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) lt!456678) (apply!900 lt!456686 lt!456678))))

(declare-fun lt!456805 () Unit!33774)

(assert (=> d!124505 (= lt!456805 (choose!1711 lt!456686 lt!456683 (zeroValue!6103 thiss!1427) lt!456678))))

(declare-fun e!585911 () Bool)

(assert (=> d!124505 e!585911))

(declare-fun res!691631 () Bool)

(assert (=> d!124505 (=> (not res!691631) (not e!585911))))

(assert (=> d!124505 (= res!691631 (contains!6001 lt!456686 lt!456678))))

(assert (=> d!124505 (= (addApplyDifferent!475 lt!456686 lt!456683 (zeroValue!6103 thiss!1427) lt!456678) lt!456805)))

(declare-fun b!1036024 () Bool)

(assert (=> b!1036024 (= e!585911 (not (= lt!456678 lt!456683)))))

(assert (= (and d!124505 res!691631) b!1036024))

(declare-fun m!955443 () Bool)

(assert (=> d!124505 m!955443))

(declare-fun m!955445 () Bool)

(assert (=> d!124505 m!955445))

(assert (=> d!124505 m!955143))

(assert (=> d!124505 m!955161))

(assert (=> d!124505 m!955143))

(assert (=> d!124505 m!955167))

(assert (=> b!1035857 d!124505))

(declare-fun d!124507 () Bool)

(assert (=> d!124507 (= (apply!900 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) lt!456678) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!456678)))))

(declare-fun bs!30298 () Bool)

(assert (= bs!30298 d!124507))

(declare-fun m!955447 () Bool)

(assert (=> bs!30298 m!955447))

(assert (=> bs!30298 m!955447))

(declare-fun m!955449 () Bool)

(assert (=> bs!30298 m!955449))

(assert (=> b!1035857 d!124507))

(declare-fun d!124509 () Bool)

(declare-fun e!585912 () Bool)

(assert (=> d!124509 e!585912))

(declare-fun res!691633 () Bool)

(assert (=> d!124509 (=> (not res!691633) (not e!585912))))

(declare-fun lt!456808 () ListLongMap!13833)

(assert (=> d!124509 (= res!691633 (contains!6001 lt!456808 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun lt!456809 () List!21952)

(assert (=> d!124509 (= lt!456808 (ListLongMap!13834 lt!456809))))

(declare-fun lt!456807 () Unit!33774)

(declare-fun lt!456806 () Unit!33774)

(assert (=> d!124509 (= lt!456807 lt!456806)))

(assert (=> d!124509 (= (getValueByKey!591 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (=> d!124509 (= lt!456806 (lemmaContainsTupThenGetReturnValue!281 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (=> d!124509 (= lt!456809 (insertStrictlySorted!374 (toList!6932 lt!456681) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (=> d!124509 (= (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) lt!456808)))

(declare-fun b!1036025 () Bool)

(declare-fun res!691632 () Bool)

(assert (=> b!1036025 (=> (not res!691632) (not e!585912))))

(assert (=> b!1036025 (= res!691632 (= (getValueByKey!591 (toList!6932 lt!456808) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036026 () Bool)

(assert (=> b!1036026 (= e!585912 (contains!6002 (toList!6932 lt!456808) (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))

(assert (= (and d!124509 res!691633) b!1036025))

(assert (= (and b!1036025 res!691632) b!1036026))

(declare-fun m!955451 () Bool)

(assert (=> d!124509 m!955451))

(declare-fun m!955453 () Bool)

(assert (=> d!124509 m!955453))

(declare-fun m!955455 () Bool)

(assert (=> d!124509 m!955455))

(declare-fun m!955457 () Bool)

(assert (=> d!124509 m!955457))

(declare-fun m!955459 () Bool)

(assert (=> b!1036025 m!955459))

(declare-fun m!955461 () Bool)

(assert (=> b!1036026 m!955461))

(assert (=> b!1035857 d!124509))

(declare-fun d!124511 () Bool)

(assert (=> d!124511 (= (apply!900 lt!456690 lt!456680) (get!16459 (getValueByKey!591 (toList!6932 lt!456690) lt!456680)))))

(declare-fun bs!30299 () Bool)

(assert (= bs!30299 d!124511))

(declare-fun m!955463 () Bool)

(assert (=> bs!30299 m!955463))

(assert (=> bs!30299 m!955463))

(declare-fun m!955465 () Bool)

(assert (=> bs!30299 m!955465))

(assert (=> b!1035857 d!124511))

(declare-fun d!124513 () Bool)

(assert (=> d!124513 (= (apply!900 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) lt!456687) (apply!900 lt!456681 lt!456687))))

(declare-fun lt!456810 () Unit!33774)

(assert (=> d!124513 (= lt!456810 (choose!1711 lt!456681 lt!456671 (minValue!6105 thiss!1427) lt!456687))))

(declare-fun e!585913 () Bool)

(assert (=> d!124513 e!585913))

(declare-fun res!691634 () Bool)

(assert (=> d!124513 (=> (not res!691634) (not e!585913))))

(assert (=> d!124513 (= res!691634 (contains!6001 lt!456681 lt!456687))))

(assert (=> d!124513 (= (addApplyDifferent!475 lt!456681 lt!456671 (minValue!6105 thiss!1427) lt!456687) lt!456810)))

(declare-fun b!1036027 () Bool)

(assert (=> b!1036027 (= e!585913 (not (= lt!456687 lt!456671)))))

(assert (= (and d!124513 res!691634) b!1036027))

(declare-fun m!955467 () Bool)

(assert (=> d!124513 m!955467))

(declare-fun m!955469 () Bool)

(assert (=> d!124513 m!955469))

(assert (=> d!124513 m!955147))

(assert (=> d!124513 m!955151))

(assert (=> d!124513 m!955147))

(assert (=> d!124513 m!955157))

(assert (=> b!1035857 d!124513))

(declare-fun d!124515 () Bool)

(assert (=> d!124515 (= (apply!900 lt!456686 lt!456678) (get!16459 (getValueByKey!591 (toList!6932 lt!456686) lt!456678)))))

(declare-fun bs!30300 () Bool)

(assert (= bs!30300 d!124515))

(declare-fun m!955471 () Bool)

(assert (=> bs!30300 m!955471))

(assert (=> bs!30300 m!955471))

(declare-fun m!955473 () Bool)

(assert (=> bs!30300 m!955473))

(assert (=> b!1035857 d!124515))

(declare-fun d!124517 () Bool)

(declare-fun e!585914 () Bool)

(assert (=> d!124517 e!585914))

(declare-fun res!691636 () Bool)

(assert (=> d!124517 (=> (not res!691636) (not e!585914))))

(declare-fun lt!456813 () ListLongMap!13833)

(assert (=> d!124517 (= res!691636 (contains!6001 lt!456813 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!456814 () List!21952)

(assert (=> d!124517 (= lt!456813 (ListLongMap!13834 lt!456814))))

(declare-fun lt!456812 () Unit!33774)

(declare-fun lt!456811 () Unit!33774)

(assert (=> d!124517 (= lt!456812 lt!456811)))

(assert (=> d!124517 (= (getValueByKey!591 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124517 (= lt!456811 (lemmaContainsTupThenGetReturnValue!281 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124517 (= lt!456814 (insertStrictlySorted!374 (toList!6932 lt!456692) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124517 (= (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) lt!456813)))

(declare-fun b!1036028 () Bool)

(declare-fun res!691635 () Bool)

(assert (=> b!1036028 (=> (not res!691635) (not e!585914))))

(assert (=> b!1036028 (= res!691635 (= (getValueByKey!591 (toList!6932 lt!456813) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1036029 () Bool)

(assert (=> b!1036029 (= e!585914 (contains!6002 (toList!6932 lt!456813) (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124517 res!691636) b!1036028))

(assert (= (and b!1036028 res!691635) b!1036029))

(declare-fun m!955475 () Bool)

(assert (=> d!124517 m!955475))

(declare-fun m!955477 () Bool)

(assert (=> d!124517 m!955477))

(declare-fun m!955479 () Bool)

(assert (=> d!124517 m!955479))

(declare-fun m!955481 () Bool)

(assert (=> d!124517 m!955481))

(declare-fun m!955483 () Bool)

(assert (=> b!1036028 m!955483))

(declare-fun m!955485 () Bool)

(assert (=> b!1036029 m!955485))

(assert (=> b!1035857 d!124517))

(declare-fun b!1036030 () Bool)

(declare-fun e!585915 () ListLongMap!13833)

(declare-fun call!43812 () ListLongMap!13833)

(assert (=> b!1036030 (= e!585915 call!43812)))

(declare-fun b!1036031 () Bool)

(declare-fun e!585917 () Bool)

(declare-fun e!585918 () Bool)

(assert (=> b!1036031 (= e!585917 e!585918)))

(declare-fun c!104770 () Bool)

(declare-fun e!585919 () Bool)

(assert (=> b!1036031 (= c!104770 e!585919)))

(declare-fun res!691640 () Bool)

(assert (=> b!1036031 (=> (not res!691640) (not e!585919))))

(assert (=> b!1036031 (= res!691640 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun bm!43809 () Bool)

(assert (=> bm!43809 (= call!43812 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun d!124519 () Bool)

(assert (=> d!124519 e!585917))

(declare-fun res!691638 () Bool)

(assert (=> d!124519 (=> (not res!691638) (not e!585917))))

(declare-fun lt!456819 () ListLongMap!13833)

(assert (=> d!124519 (= res!691638 (not (contains!6001 lt!456819 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!585916 () ListLongMap!13833)

(assert (=> d!124519 (= lt!456819 e!585916)))

(declare-fun c!104769 () Bool)

(assert (=> d!124519 (= c!104769 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124519 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124519 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!456819)))

(declare-fun b!1036032 () Bool)

(assert (=> b!1036032 (= e!585919 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036032 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1036033 () Bool)

(declare-fun e!585920 () Bool)

(assert (=> b!1036033 (= e!585918 e!585920)))

(declare-fun c!104771 () Bool)

(assert (=> b!1036033 (= c!104771 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1036034 () Bool)

(declare-fun lt!456820 () Unit!33774)

(declare-fun lt!456816 () Unit!33774)

(assert (=> b!1036034 (= lt!456820 lt!456816)))

(declare-fun lt!456818 () ListLongMap!13833)

(declare-fun lt!456817 () (_ BitVec 64))

(declare-fun lt!456821 () V!37667)

(declare-fun lt!456815 () (_ BitVec 64))

(assert (=> b!1036034 (not (contains!6001 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821)) lt!456817))))

(assert (=> b!1036034 (= lt!456816 (addStillNotContains!244 lt!456818 lt!456815 lt!456821 lt!456817))))

(assert (=> b!1036034 (= lt!456817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036034 (= lt!456821 (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036034 (= lt!456815 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036034 (= lt!456818 call!43812)))

(assert (=> b!1036034 (= e!585915 (+!3131 call!43812 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036035 () Bool)

(declare-fun e!585921 () Bool)

(assert (=> b!1036035 (= e!585918 e!585921)))

(assert (=> b!1036035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun res!691639 () Bool)

(assert (=> b!1036035 (= res!691639 (contains!6001 lt!456819 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036035 (=> (not res!691639) (not e!585921))))

(declare-fun b!1036036 () Bool)

(assert (=> b!1036036 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> b!1036036 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31929 (_values!6292 thiss!1427))))))

(assert (=> b!1036036 (= e!585921 (= (apply!900 lt!456819 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036037 () Bool)

(assert (=> b!1036037 (= e!585920 (= lt!456819 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1036038 () Bool)

(assert (=> b!1036038 (= e!585916 (ListLongMap!13834 Nil!21949))))

(declare-fun b!1036039 () Bool)

(assert (=> b!1036039 (= e!585920 (isEmpty!934 lt!456819))))

(declare-fun b!1036040 () Bool)

(declare-fun res!691637 () Bool)

(assert (=> b!1036040 (=> (not res!691637) (not e!585917))))

(assert (=> b!1036040 (= res!691637 (not (contains!6001 lt!456819 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036041 () Bool)

(assert (=> b!1036041 (= e!585916 e!585915)))

(declare-fun c!104772 () Bool)

(assert (=> b!1036041 (= c!104772 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124519 c!104769) b!1036038))

(assert (= (and d!124519 (not c!104769)) b!1036041))

(assert (= (and b!1036041 c!104772) b!1036034))

(assert (= (and b!1036041 (not c!104772)) b!1036030))

(assert (= (or b!1036034 b!1036030) bm!43809))

(assert (= (and d!124519 res!691638) b!1036040))

(assert (= (and b!1036040 res!691637) b!1036031))

(assert (= (and b!1036031 res!691640) b!1036032))

(assert (= (and b!1036031 c!104770) b!1036035))

(assert (= (and b!1036031 (not c!104770)) b!1036033))

(assert (= (and b!1036035 res!691639) b!1036036))

(assert (= (and b!1036033 c!104771) b!1036037))

(assert (= (and b!1036033 (not c!104771)) b!1036039))

(declare-fun b_lambda!16099 () Bool)

(assert (=> (not b_lambda!16099) (not b!1036034)))

(assert (=> b!1036034 t!31154))

(declare-fun b_and!33369 () Bool)

(assert (= b_and!33367 (and (=> t!31154 result!14419) b_and!33369)))

(declare-fun b_lambda!16101 () Bool)

(assert (=> (not b_lambda!16101) (not b!1036036)))

(assert (=> b!1036036 t!31154))

(declare-fun b_and!33371 () Bool)

(assert (= b_and!33369 (and (=> t!31154 result!14419) b_and!33371)))

(declare-fun m!955487 () Bool)

(assert (=> b!1036039 m!955487))

(declare-fun m!955489 () Bool)

(assert (=> b!1036037 m!955489))

(declare-fun m!955491 () Bool)

(assert (=> b!1036040 m!955491))

(assert (=> b!1036041 m!955067))

(assert (=> b!1036041 m!955067))

(assert (=> b!1036041 m!955085))

(assert (=> b!1036036 m!955071))

(assert (=> b!1036036 m!955073))

(assert (=> b!1036036 m!955067))

(assert (=> b!1036036 m!955073))

(assert (=> b!1036036 m!955071))

(assert (=> b!1036036 m!955075))

(assert (=> b!1036036 m!955067))

(declare-fun m!955493 () Bool)

(assert (=> b!1036036 m!955493))

(declare-fun m!955495 () Bool)

(assert (=> d!124519 m!955495))

(assert (=> d!124519 m!955077))

(declare-fun m!955497 () Bool)

(assert (=> b!1036034 m!955497))

(assert (=> b!1036034 m!955071))

(assert (=> b!1036034 m!955497))

(declare-fun m!955499 () Bool)

(assert (=> b!1036034 m!955499))

(assert (=> b!1036034 m!955067))

(assert (=> b!1036034 m!955073))

(assert (=> b!1036034 m!955071))

(assert (=> b!1036034 m!955075))

(declare-fun m!955501 () Bool)

(assert (=> b!1036034 m!955501))

(assert (=> b!1036034 m!955073))

(declare-fun m!955503 () Bool)

(assert (=> b!1036034 m!955503))

(assert (=> b!1036032 m!955067))

(assert (=> b!1036032 m!955067))

(assert (=> b!1036032 m!955085))

(assert (=> bm!43809 m!955489))

(assert (=> b!1036035 m!955067))

(assert (=> b!1036035 m!955067))

(declare-fun m!955505 () Bool)

(assert (=> b!1036035 m!955505))

(assert (=> b!1035857 d!124519))

(declare-fun d!124521 () Bool)

(assert (=> d!124521 (= (apply!900 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) lt!456680) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!456680)))))

(declare-fun bs!30301 () Bool)

(assert (= bs!30301 d!124521))

(declare-fun m!955507 () Bool)

(assert (=> bs!30301 m!955507))

(assert (=> bs!30301 m!955507))

(declare-fun m!955509 () Bool)

(assert (=> bs!30301 m!955509))

(assert (=> b!1035857 d!124521))

(declare-fun d!124523 () Bool)

(declare-fun e!585922 () Bool)

(assert (=> d!124523 e!585922))

(declare-fun res!691642 () Bool)

(assert (=> d!124523 (=> (not res!691642) (not e!585922))))

(declare-fun lt!456824 () ListLongMap!13833)

(assert (=> d!124523 (= res!691642 (contains!6001 lt!456824 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun lt!456825 () List!21952)

(assert (=> d!124523 (= lt!456824 (ListLongMap!13834 lt!456825))))

(declare-fun lt!456823 () Unit!33774)

(declare-fun lt!456822 () Unit!33774)

(assert (=> d!124523 (= lt!456823 lt!456822)))

(assert (=> d!124523 (= (getValueByKey!591 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (=> d!124523 (= lt!456822 (lemmaContainsTupThenGetReturnValue!281 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (=> d!124523 (= lt!456825 (insertStrictlySorted!374 (toList!6932 lt!456690) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (=> d!124523 (= (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) lt!456824)))

(declare-fun b!1036042 () Bool)

(declare-fun res!691641 () Bool)

(assert (=> b!1036042 (=> (not res!691641) (not e!585922))))

(assert (=> b!1036042 (= res!691641 (= (getValueByKey!591 (toList!6932 lt!456824) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036043 () Bool)

(assert (=> b!1036043 (= e!585922 (contains!6002 (toList!6932 lt!456824) (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))

(assert (= (and d!124523 res!691642) b!1036042))

(assert (= (and b!1036042 res!691641) b!1036043))

(declare-fun m!955511 () Bool)

(assert (=> d!124523 m!955511))

(declare-fun m!955513 () Bool)

(assert (=> d!124523 m!955513))

(declare-fun m!955515 () Bool)

(assert (=> d!124523 m!955515))

(declare-fun m!955517 () Bool)

(assert (=> d!124523 m!955517))

(declare-fun m!955519 () Bool)

(assert (=> b!1036042 m!955519))

(declare-fun m!955521 () Bool)

(assert (=> b!1036043 m!955521))

(assert (=> b!1035857 d!124523))

(declare-fun d!124525 () Bool)

(assert (=> d!124525 (contains!6001 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) lt!456676)))

(declare-fun lt!456826 () Unit!33774)

(assert (=> d!124525 (= lt!456826 (choose!1710 lt!456692 lt!456675 (zeroValue!6103 thiss!1427) lt!456676))))

(assert (=> d!124525 (contains!6001 lt!456692 lt!456676)))

(assert (=> d!124525 (= (addStillContains!619 lt!456692 lt!456675 (zeroValue!6103 thiss!1427) lt!456676) lt!456826)))

(declare-fun bs!30302 () Bool)

(assert (= bs!30302 d!124525))

(assert (=> bs!30302 m!955153))

(assert (=> bs!30302 m!955153))

(assert (=> bs!30302 m!955155))

(declare-fun m!955523 () Bool)

(assert (=> bs!30302 m!955523))

(declare-fun m!955525 () Bool)

(assert (=> bs!30302 m!955525))

(assert (=> b!1035857 d!124525))

(declare-fun d!124527 () Bool)

(assert (=> d!124527 (= (apply!900 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) lt!456680) (apply!900 lt!456690 lt!456680))))

(declare-fun lt!456827 () Unit!33774)

(assert (=> d!124527 (= lt!456827 (choose!1711 lt!456690 lt!456674 (minValue!6105 thiss!1427) lt!456680))))

(declare-fun e!585923 () Bool)

(assert (=> d!124527 e!585923))

(declare-fun res!691643 () Bool)

(assert (=> d!124527 (=> (not res!691643) (not e!585923))))

(assert (=> d!124527 (= res!691643 (contains!6001 lt!456690 lt!456680))))

(assert (=> d!124527 (= (addApplyDifferent!475 lt!456690 lt!456674 (minValue!6105 thiss!1427) lt!456680) lt!456827)))

(declare-fun b!1036044 () Bool)

(assert (=> b!1036044 (= e!585923 (not (= lt!456680 lt!456674)))))

(assert (= (and d!124527 res!691643) b!1036044))

(declare-fun m!955527 () Bool)

(assert (=> d!124527 m!955527))

(declare-fun m!955529 () Bool)

(assert (=> d!124527 m!955529))

(assert (=> d!124527 m!955145))

(assert (=> d!124527 m!955163))

(assert (=> d!124527 m!955145))

(assert (=> d!124527 m!955159))

(assert (=> b!1035857 d!124527))

(assert (=> d!124423 d!124415))

(assert (=> d!124423 d!124417))

(declare-fun d!124529 () Bool)

(assert (=> d!124529 (= (-!524 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(assert (=> d!124529 true))

(declare-fun _$10!34 () Unit!33774)

(assert (=> d!124529 (= (choose!1709 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!456582 (defaultEntry!6269 thiss!1427)) _$10!34)))

(declare-fun bs!30303 () Bool)

(assert (= bs!30303 d!124529))

(assert (=> bs!30303 m!954989))

(assert (=> bs!30303 m!954989))

(assert (=> bs!30303 m!954991))

(assert (=> bs!30303 m!954985))

(assert (=> d!124423 d!124529))

(assert (=> d!124423 d!124483))

(assert (=> d!124423 d!124419))

(assert (=> b!1035841 d!124477))

(declare-fun b!1036047 () Bool)

(declare-fun res!691644 () Bool)

(declare-fun e!585924 () Bool)

(assert (=> b!1036047 (=> (not res!691644) (not e!585924))))

(assert (=> b!1036047 (= res!691644 (= (size!31934 lt!456581) (bvadd (_size!2946 lt!456581) (bvsdiv (bvadd (extraKeys!5999 lt!456581) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124531 () Bool)

(declare-fun res!691645 () Bool)

(assert (=> d!124531 (=> (not res!691645) (not e!585924))))

(assert (=> d!124531 (= res!691645 (validMask!0 (mask!30165 lt!456581)))))

(assert (=> d!124531 (= (simpleValid!414 lt!456581) e!585924)))

(declare-fun b!1036048 () Bool)

(assert (=> b!1036048 (= e!585924 (and (bvsge (extraKeys!5999 lt!456581) #b00000000000000000000000000000000) (bvsle (extraKeys!5999 lt!456581) #b00000000000000000000000000000011) (bvsge (_vacant!2946 lt!456581) #b00000000000000000000000000000000)))))

(declare-fun b!1036046 () Bool)

(declare-fun res!691646 () Bool)

(assert (=> b!1036046 (=> (not res!691646) (not e!585924))))

(assert (=> b!1036046 (= res!691646 (bvsge (size!31934 lt!456581) (_size!2946 lt!456581)))))

(declare-fun b!1036045 () Bool)

(declare-fun res!691647 () Bool)

(assert (=> b!1036045 (=> (not res!691647) (not e!585924))))

(assert (=> b!1036045 (= res!691647 (and (= (size!31929 (_values!6292 lt!456581)) (bvadd (mask!30165 lt!456581) #b00000000000000000000000000000001)) (= (size!31928 (_keys!11454 lt!456581)) (size!31929 (_values!6292 lt!456581))) (bvsge (_size!2946 lt!456581) #b00000000000000000000000000000000) (bvsle (_size!2946 lt!456581) (bvadd (mask!30165 lt!456581) #b00000000000000000000000000000001))))))

(assert (= (and d!124531 res!691645) b!1036045))

(assert (= (and b!1036045 res!691647) b!1036046))

(assert (= (and b!1036046 res!691646) b!1036047))

(assert (= (and b!1036047 res!691644) b!1036048))

(declare-fun m!955531 () Bool)

(assert (=> b!1036047 m!955531))

(declare-fun m!955533 () Bool)

(assert (=> d!124531 m!955533))

(assert (=> b!1036046 m!955531))

(assert (=> d!124421 d!124531))

(declare-fun d!124533 () Bool)

(declare-fun e!585925 () Bool)

(assert (=> d!124533 e!585925))

(declare-fun res!691648 () Bool)

(assert (=> d!124533 (=> res!691648 e!585925)))

(declare-fun lt!456829 () Bool)

(assert (=> d!124533 (= res!691648 (not lt!456829))))

(declare-fun lt!456828 () Bool)

(assert (=> d!124533 (= lt!456829 lt!456828)))

(declare-fun lt!456831 () Unit!33774)

(declare-fun e!585926 () Unit!33774)

(assert (=> d!124533 (= lt!456831 e!585926)))

(declare-fun c!104773 () Bool)

(assert (=> d!124533 (= c!104773 lt!456828)))

(assert (=> d!124533 (= lt!456828 (containsKey!564 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124533 (= (contains!6001 lt!456660 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456829)))

(declare-fun b!1036049 () Bool)

(declare-fun lt!456830 () Unit!33774)

(assert (=> b!1036049 (= e!585926 lt!456830)))

(assert (=> b!1036049 (= lt!456830 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036049 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036050 () Bool)

(declare-fun Unit!33785 () Unit!33774)

(assert (=> b!1036050 (= e!585926 Unit!33785)))

(declare-fun b!1036051 () Bool)

(assert (=> b!1036051 (= e!585925 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124533 c!104773) b!1036049))

(assert (= (and d!124533 (not c!104773)) b!1036050))

(assert (= (and d!124533 (not res!691648)) b!1036051))

(declare-fun m!955535 () Bool)

(assert (=> d!124533 m!955535))

(declare-fun m!955537 () Bool)

(assert (=> b!1036049 m!955537))

(declare-fun m!955539 () Bool)

(assert (=> b!1036049 m!955539))

(assert (=> b!1036049 m!955539))

(declare-fun m!955541 () Bool)

(assert (=> b!1036049 m!955541))

(assert (=> b!1036051 m!955539))

(assert (=> b!1036051 m!955539))

(assert (=> b!1036051 m!955541))

(assert (=> bm!43792 d!124533))

(assert (=> b!1035862 d!124477))

(declare-fun d!124535 () Bool)

(assert (=> d!124535 (= (apply!900 lt!456660 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16459 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30304 () Bool)

(assert (= bs!30304 d!124535))

(assert (=> bs!30304 m!955539))

(assert (=> bs!30304 m!955539))

(declare-fun m!955543 () Bool)

(assert (=> bs!30304 m!955543))

(assert (=> b!1035830 d!124535))

(declare-fun b!1036052 () Bool)

(declare-fun e!585927 () ListLongMap!13833)

(declare-fun e!585938 () ListLongMap!13833)

(assert (=> b!1036052 (= e!585927 e!585938)))

(declare-fun c!104776 () Bool)

(assert (=> b!1036052 (= c!104776 (and (not (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!124537 () Bool)

(declare-fun e!585931 () Bool)

(assert (=> d!124537 e!585931))

(declare-fun res!691655 () Bool)

(assert (=> d!124537 (=> (not res!691655) (not e!585931))))

(assert (=> d!124537 (= res!691655 (or (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))))

(declare-fun lt!456843 () ListLongMap!13833)

(declare-fun lt!456849 () ListLongMap!13833)

(assert (=> d!124537 (= lt!456843 lt!456849)))

(declare-fun lt!456846 () Unit!33774)

(declare-fun e!585929 () Unit!33774)

(assert (=> d!124537 (= lt!456846 e!585929)))

(declare-fun c!104775 () Bool)

(declare-fun e!585936 () Bool)

(assert (=> d!124537 (= c!104775 e!585936)))

(declare-fun res!691652 () Bool)

(assert (=> d!124537 (=> (not res!691652) (not e!585936))))

(assert (=> d!124537 (= res!691652 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124537 (= lt!456849 e!585927)))

(declare-fun c!104778 () Bool)

(assert (=> d!124537 (= c!104778 (and (not (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124537 (validMask!0 (mask!30165 lt!456581))))

(assert (=> d!124537 (= (getCurrentListMap!3898 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)) lt!456843)))

(declare-fun bm!43810 () Bool)

(declare-fun call!43819 () ListLongMap!13833)

(declare-fun call!43813 () ListLongMap!13833)

(assert (=> bm!43810 (= call!43819 call!43813)))

(declare-fun b!1036053 () Bool)

(declare-fun e!585935 () Bool)

(declare-fun call!43815 () Bool)

(assert (=> b!1036053 (= e!585935 (not call!43815))))

(declare-fun b!1036054 () Bool)

(declare-fun e!585930 () ListLongMap!13833)

(assert (=> b!1036054 (= e!585930 call!43819)))

(declare-fun call!43814 () ListLongMap!13833)

(declare-fun call!43817 () ListLongMap!13833)

(declare-fun call!43818 () ListLongMap!13833)

(declare-fun bm!43811 () Bool)

(assert (=> bm!43811 (= call!43813 (+!3131 (ite c!104778 call!43817 (ite c!104776 call!43818 call!43814)) (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))

(declare-fun b!1036055 () Bool)

(declare-fun e!585928 () Bool)

(assert (=> b!1036055 (= e!585928 (= (apply!900 lt!456843 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) (get!16458 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31929 (_values!6292 lt!456581))))))

(assert (=> b!1036055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(declare-fun b!1036056 () Bool)

(declare-fun e!585933 () Bool)

(assert (=> b!1036056 (= e!585933 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036057 () Bool)

(assert (=> b!1036057 (= e!585930 call!43814)))

(declare-fun bm!43812 () Bool)

(assert (=> bm!43812 (= call!43817 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)))))

(declare-fun b!1036058 () Bool)

(declare-fun e!585939 () Bool)

(assert (=> b!1036058 (= e!585939 (= (apply!900 lt!456843 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6105 lt!456581)))))

(declare-fun b!1036059 () Bool)

(assert (=> b!1036059 (= e!585938 call!43819)))

(declare-fun bm!43813 () Bool)

(declare-fun call!43816 () Bool)

(assert (=> bm!43813 (= call!43816 (contains!6001 lt!456843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036060 () Bool)

(declare-fun Unit!33786 () Unit!33774)

(assert (=> b!1036060 (= e!585929 Unit!33786)))

(declare-fun b!1036061 () Bool)

(declare-fun res!691656 () Bool)

(assert (=> b!1036061 (=> (not res!691656) (not e!585931))))

(declare-fun e!585937 () Bool)

(assert (=> b!1036061 (= res!691656 e!585937)))

(declare-fun res!691649 () Bool)

(assert (=> b!1036061 (=> res!691649 e!585937)))

(assert (=> b!1036061 (= res!691649 (not e!585933))))

(declare-fun res!691654 () Bool)

(assert (=> b!1036061 (=> (not res!691654) (not e!585933))))

(assert (=> b!1036061 (= res!691654 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(declare-fun bm!43814 () Bool)

(assert (=> bm!43814 (= call!43818 call!43817)))

(declare-fun b!1036062 () Bool)

(declare-fun e!585934 () Bool)

(assert (=> b!1036062 (= e!585935 e!585934)))

(declare-fun res!691657 () Bool)

(assert (=> b!1036062 (= res!691657 call!43815)))

(assert (=> b!1036062 (=> (not res!691657) (not e!585934))))

(declare-fun b!1036063 () Bool)

(declare-fun e!585932 () Bool)

(assert (=> b!1036063 (= e!585931 e!585932)))

(declare-fun c!104774 () Bool)

(assert (=> b!1036063 (= c!104774 (not (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1036064 () Bool)

(declare-fun lt!456852 () Unit!33774)

(assert (=> b!1036064 (= e!585929 lt!456852)))

(declare-fun lt!456853 () ListLongMap!13833)

(assert (=> b!1036064 (= lt!456853 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)))))

(declare-fun lt!456836 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456837 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456837 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))

(declare-fun lt!456850 () Unit!33774)

(assert (=> b!1036064 (= lt!456850 (addStillContains!619 lt!456853 lt!456836 (zeroValue!6103 lt!456581) lt!456837))))

(assert (=> b!1036064 (contains!6001 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))) lt!456837)))

(declare-fun lt!456845 () Unit!33774)

(assert (=> b!1036064 (= lt!456845 lt!456850)))

(declare-fun lt!456851 () ListLongMap!13833)

(assert (=> b!1036064 (= lt!456851 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)))))

(declare-fun lt!456835 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456841 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456841 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))

(declare-fun lt!456840 () Unit!33774)

(assert (=> b!1036064 (= lt!456840 (addApplyDifferent!475 lt!456851 lt!456835 (minValue!6105 lt!456581) lt!456841))))

(assert (=> b!1036064 (= (apply!900 (+!3131 lt!456851 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))) lt!456841) (apply!900 lt!456851 lt!456841))))

(declare-fun lt!456834 () Unit!33774)

(assert (=> b!1036064 (= lt!456834 lt!456840)))

(declare-fun lt!456847 () ListLongMap!13833)

(assert (=> b!1036064 (= lt!456847 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)))))

(declare-fun lt!456844 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456839 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456839 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))

(declare-fun lt!456838 () Unit!33774)

(assert (=> b!1036064 (= lt!456838 (addApplyDifferent!475 lt!456847 lt!456844 (zeroValue!6103 lt!456581) lt!456839))))

(assert (=> b!1036064 (= (apply!900 (+!3131 lt!456847 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))) lt!456839) (apply!900 lt!456847 lt!456839))))

(declare-fun lt!456833 () Unit!33774)

(assert (=> b!1036064 (= lt!456833 lt!456838)))

(declare-fun lt!456842 () ListLongMap!13833)

(assert (=> b!1036064 (= lt!456842 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)))))

(declare-fun lt!456832 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456848 () (_ BitVec 64))

(assert (=> b!1036064 (= lt!456848 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))

(assert (=> b!1036064 (= lt!456852 (addApplyDifferent!475 lt!456842 lt!456832 (minValue!6105 lt!456581) lt!456848))))

(assert (=> b!1036064 (= (apply!900 (+!3131 lt!456842 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))) lt!456848) (apply!900 lt!456842 lt!456848))))

(declare-fun b!1036065 () Bool)

(assert (=> b!1036065 (= e!585934 (= (apply!900 lt!456843 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6103 lt!456581)))))

(declare-fun bm!43815 () Bool)

(assert (=> bm!43815 (= call!43814 call!43818)))

(declare-fun b!1036066 () Bool)

(assert (=> b!1036066 (= e!585927 (+!3131 call!43813 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))

(declare-fun b!1036067 () Bool)

(declare-fun res!691650 () Bool)

(assert (=> b!1036067 (=> (not res!691650) (not e!585931))))

(assert (=> b!1036067 (= res!691650 e!585935)))

(declare-fun c!104779 () Bool)

(assert (=> b!1036067 (= c!104779 (not (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43816 () Bool)

(assert (=> bm!43816 (= call!43815 (contains!6001 lt!456843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036068 () Bool)

(assert (=> b!1036068 (= e!585932 (not call!43816))))

(declare-fun b!1036069 () Bool)

(assert (=> b!1036069 (= e!585936 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036070 () Bool)

(assert (=> b!1036070 (= e!585932 e!585939)))

(declare-fun res!691653 () Bool)

(assert (=> b!1036070 (= res!691653 call!43816)))

(assert (=> b!1036070 (=> (not res!691653) (not e!585939))))

(declare-fun b!1036071 () Bool)

(declare-fun c!104777 () Bool)

(assert (=> b!1036071 (= c!104777 (and (not (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 lt!456581) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1036071 (= e!585938 e!585930)))

(declare-fun b!1036072 () Bool)

(assert (=> b!1036072 (= e!585937 e!585928)))

(declare-fun res!691651 () Bool)

(assert (=> b!1036072 (=> (not res!691651) (not e!585928))))

(assert (=> b!1036072 (= res!691651 (contains!6001 lt!456843 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (=> b!1036072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (= (and d!124537 c!104778) b!1036066))

(assert (= (and d!124537 (not c!104778)) b!1036052))

(assert (= (and b!1036052 c!104776) b!1036059))

(assert (= (and b!1036052 (not c!104776)) b!1036071))

(assert (= (and b!1036071 c!104777) b!1036054))

(assert (= (and b!1036071 (not c!104777)) b!1036057))

(assert (= (or b!1036054 b!1036057) bm!43815))

(assert (= (or b!1036059 bm!43815) bm!43814))

(assert (= (or b!1036059 b!1036054) bm!43810))

(assert (= (or b!1036066 bm!43814) bm!43812))

(assert (= (or b!1036066 bm!43810) bm!43811))

(assert (= (and d!124537 res!691652) b!1036069))

(assert (= (and d!124537 c!104775) b!1036064))

(assert (= (and d!124537 (not c!104775)) b!1036060))

(assert (= (and d!124537 res!691655) b!1036061))

(assert (= (and b!1036061 res!691654) b!1036056))

(assert (= (and b!1036061 (not res!691649)) b!1036072))

(assert (= (and b!1036072 res!691651) b!1036055))

(assert (= (and b!1036061 res!691656) b!1036067))

(assert (= (and b!1036067 c!104779) b!1036062))

(assert (= (and b!1036067 (not c!104779)) b!1036053))

(assert (= (and b!1036062 res!691657) b!1036065))

(assert (= (or b!1036062 b!1036053) bm!43816))

(assert (= (and b!1036067 res!691650) b!1036063))

(assert (= (and b!1036063 c!104774) b!1036070))

(assert (= (and b!1036063 (not c!104774)) b!1036068))

(assert (= (and b!1036070 res!691653) b!1036058))

(assert (= (or b!1036070 b!1036068) bm!43813))

(declare-fun b_lambda!16103 () Bool)

(assert (=> (not b_lambda!16103) (not b!1036055)))

(declare-fun t!31157 () Bool)

(declare-fun tb!7027 () Bool)

(assert (=> (and b!1035733 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 lt!456581)) t!31157) tb!7027))

(declare-fun result!14423 () Bool)

(assert (=> tb!7027 (= result!14423 tp_is_empty!24595)))

(assert (=> b!1036055 t!31157))

(declare-fun b_and!33373 () Bool)

(assert (= b_and!33371 (and (=> t!31157 result!14423) b_and!33373)))

(declare-fun m!955545 () Bool)

(assert (=> b!1036055 m!955545))

(assert (=> b!1036055 m!955545))

(declare-fun m!955547 () Bool)

(assert (=> b!1036055 m!955547))

(declare-fun m!955549 () Bool)

(assert (=> b!1036055 m!955549))

(declare-fun m!955551 () Bool)

(assert (=> b!1036055 m!955551))

(assert (=> b!1036055 m!955549))

(declare-fun m!955553 () Bool)

(assert (=> b!1036055 m!955553))

(assert (=> b!1036055 m!955551))

(assert (=> d!124537 m!955533))

(declare-fun m!955555 () Bool)

(assert (=> bm!43812 m!955555))

(assert (=> b!1036072 m!955545))

(assert (=> b!1036072 m!955545))

(declare-fun m!955557 () Bool)

(assert (=> b!1036072 m!955557))

(declare-fun m!955559 () Bool)

(assert (=> bm!43813 m!955559))

(assert (=> b!1036069 m!955545))

(assert (=> b!1036069 m!955545))

(declare-fun m!955561 () Bool)

(assert (=> b!1036069 m!955561))

(declare-fun m!955563 () Bool)

(assert (=> b!1036066 m!955563))

(declare-fun m!955565 () Bool)

(assert (=> bm!43811 m!955565))

(declare-fun m!955567 () Bool)

(assert (=> b!1036064 m!955567))

(declare-fun m!955569 () Bool)

(assert (=> b!1036064 m!955569))

(declare-fun m!955571 () Bool)

(assert (=> b!1036064 m!955571))

(declare-fun m!955573 () Bool)

(assert (=> b!1036064 m!955573))

(declare-fun m!955575 () Bool)

(assert (=> b!1036064 m!955575))

(declare-fun m!955577 () Bool)

(assert (=> b!1036064 m!955577))

(assert (=> b!1036064 m!955555))

(declare-fun m!955579 () Bool)

(assert (=> b!1036064 m!955579))

(declare-fun m!955581 () Bool)

(assert (=> b!1036064 m!955581))

(declare-fun m!955583 () Bool)

(assert (=> b!1036064 m!955583))

(assert (=> b!1036064 m!955575))

(declare-fun m!955585 () Bool)

(assert (=> b!1036064 m!955585))

(assert (=> b!1036064 m!955573))

(declare-fun m!955587 () Bool)

(assert (=> b!1036064 m!955587))

(declare-fun m!955589 () Bool)

(assert (=> b!1036064 m!955589))

(assert (=> b!1036064 m!955545))

(declare-fun m!955591 () Bool)

(assert (=> b!1036064 m!955591))

(assert (=> b!1036064 m!955581))

(declare-fun m!955593 () Bool)

(assert (=> b!1036064 m!955593))

(assert (=> b!1036064 m!955571))

(declare-fun m!955595 () Bool)

(assert (=> b!1036064 m!955595))

(declare-fun m!955597 () Bool)

(assert (=> b!1036065 m!955597))

(declare-fun m!955599 () Bool)

(assert (=> b!1036058 m!955599))

(declare-fun m!955601 () Bool)

(assert (=> bm!43816 m!955601))

(assert (=> b!1036056 m!955545))

(assert (=> b!1036056 m!955545))

(assert (=> b!1036056 m!955561))

(assert (=> d!124409 d!124537))

(declare-fun d!124539 () Bool)

(declare-fun e!585940 () Bool)

(assert (=> d!124539 e!585940))

(declare-fun res!691658 () Bool)

(assert (=> d!124539 (=> res!691658 e!585940)))

(declare-fun lt!456855 () Bool)

(assert (=> d!124539 (= res!691658 (not lt!456855))))

(declare-fun lt!456854 () Bool)

(assert (=> d!124539 (= lt!456855 lt!456854)))

(declare-fun lt!456857 () Unit!33774)

(declare-fun e!585941 () Unit!33774)

(assert (=> d!124539 (= lt!456857 e!585941)))

(declare-fun c!104780 () Bool)

(assert (=> d!124539 (= c!104780 lt!456854)))

(assert (=> d!124539 (= lt!456854 (containsKey!564 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124539 (= (contains!6001 lt!456682 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456855)))

(declare-fun b!1036073 () Bool)

(declare-fun lt!456856 () Unit!33774)

(assert (=> b!1036073 (= e!585941 lt!456856)))

(assert (=> b!1036073 (= lt!456856 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036073 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036074 () Bool)

(declare-fun Unit!33787 () Unit!33774)

(assert (=> b!1036074 (= e!585941 Unit!33787)))

(declare-fun b!1036075 () Bool)

(assert (=> b!1036075 (= e!585940 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124539 c!104780) b!1036073))

(assert (= (and d!124539 (not c!104780)) b!1036074))

(assert (= (and d!124539 (not res!691658)) b!1036075))

(declare-fun m!955603 () Bool)

(assert (=> d!124539 m!955603))

(declare-fun m!955605 () Bool)

(assert (=> b!1036073 m!955605))

(assert (=> b!1036073 m!955381))

(assert (=> b!1036073 m!955381))

(declare-fun m!955607 () Bool)

(assert (=> b!1036073 m!955607))

(assert (=> b!1036075 m!955381))

(assert (=> b!1036075 m!955381))

(assert (=> b!1036075 m!955607))

(assert (=> bm!43802 d!124539))

(assert (=> d!124413 d!124417))

(assert (=> bm!43791 d!124463))

(declare-fun b!1036086 () Bool)

(declare-fun e!585953 () Bool)

(declare-fun e!585950 () Bool)

(assert (=> b!1036086 (= e!585953 e!585950)))

(declare-fun res!691665 () Bool)

(assert (=> b!1036086 (=> (not res!691665) (not e!585950))))

(declare-fun e!585951 () Bool)

(assert (=> b!1036086 (= res!691665 (not e!585951))))

(declare-fun res!691666 () Bool)

(assert (=> b!1036086 (=> (not res!691666) (not e!585951))))

(assert (=> b!1036086 (= res!691666 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124541 () Bool)

(declare-fun res!691667 () Bool)

(assert (=> d!124541 (=> res!691667 e!585953)))

(assert (=> d!124541 (= res!691667 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124541 (= (arrayNoDuplicates!0 (_keys!11454 thiss!1427) #b00000000000000000000000000000000 Nil!21950) e!585953)))

(declare-fun b!1036087 () Bool)

(declare-fun contains!6003 (List!21953 (_ BitVec 64)) Bool)

(assert (=> b!1036087 (= e!585951 (contains!6003 Nil!21950 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036088 () Bool)

(declare-fun e!585952 () Bool)

(declare-fun call!43822 () Bool)

(assert (=> b!1036088 (= e!585952 call!43822)))

(declare-fun bm!43819 () Bool)

(declare-fun c!104783 () Bool)

(assert (=> bm!43819 (= call!43822 (arrayNoDuplicates!0 (_keys!11454 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104783 (Cons!21949 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)))))

(declare-fun b!1036089 () Bool)

(assert (=> b!1036089 (= e!585950 e!585952)))

(assert (=> b!1036089 (= c!104783 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036090 () Bool)

(assert (=> b!1036090 (= e!585952 call!43822)))

(assert (= (and d!124541 (not res!691667)) b!1036086))

(assert (= (and b!1036086 res!691666) b!1036087))

(assert (= (and b!1036086 res!691665) b!1036089))

(assert (= (and b!1036089 c!104783) b!1036088))

(assert (= (and b!1036089 (not c!104783)) b!1036090))

(assert (= (or b!1036088 b!1036090) bm!43819))

(assert (=> b!1036086 m!955067))

(assert (=> b!1036086 m!955067))

(assert (=> b!1036086 m!955085))

(assert (=> b!1036087 m!955067))

(assert (=> b!1036087 m!955067))

(declare-fun m!955609 () Bool)

(assert (=> b!1036087 m!955609))

(assert (=> bm!43819 m!955067))

(declare-fun m!955611 () Bool)

(assert (=> bm!43819 m!955611))

(assert (=> b!1036089 m!955067))

(assert (=> b!1036089 m!955067))

(assert (=> b!1036089 m!955085))

(assert (=> b!1035877 d!124541))

(declare-fun bm!43822 () Bool)

(declare-fun call!43825 () Bool)

(assert (=> bm!43822 (= call!43825 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)))))

(declare-fun b!1036099 () Bool)

(declare-fun e!585962 () Bool)

(declare-fun e!585961 () Bool)

(assert (=> b!1036099 (= e!585962 e!585961)))

(declare-fun lt!456864 () (_ BitVec 64))

(assert (=> b!1036099 (= lt!456864 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456865 () Unit!33774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65227 (_ BitVec 64) (_ BitVec 32)) Unit!33774)

(assert (=> b!1036099 (= lt!456865 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11454 thiss!1427) lt!456864 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036099 (arrayContainsKey!0 (_keys!11454 thiss!1427) lt!456864 #b00000000000000000000000000000000)))

(declare-fun lt!456866 () Unit!33774)

(assert (=> b!1036099 (= lt!456866 lt!456865)))

(declare-fun res!691673 () Bool)

(declare-datatypes ((SeekEntryResult!9737 0))(
  ( (MissingZero!9737 (index!41319 (_ BitVec 32))) (Found!9737 (index!41320 (_ BitVec 32))) (Intermediate!9737 (undefined!10549 Bool) (index!41321 (_ BitVec 32)) (x!92460 (_ BitVec 32))) (Undefined!9737) (MissingVacant!9737 (index!41322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65227 (_ BitVec 32)) SeekEntryResult!9737)

(assert (=> b!1036099 (= res!691673 (= (seekEntryOrOpen!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)) (Found!9737 #b00000000000000000000000000000000)))))

(assert (=> b!1036099 (=> (not res!691673) (not e!585961))))

(declare-fun b!1036100 () Bool)

(declare-fun e!585960 () Bool)

(assert (=> b!1036100 (= e!585960 e!585962)))

(declare-fun c!104786 () Bool)

(assert (=> b!1036100 (= c!104786 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036101 () Bool)

(assert (=> b!1036101 (= e!585962 call!43825)))

(declare-fun d!124543 () Bool)

(declare-fun res!691672 () Bool)

(assert (=> d!124543 (=> res!691672 e!585960)))

(assert (=> d!124543 (= res!691672 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11454 thiss!1427) (mask!30165 thiss!1427)) e!585960)))

(declare-fun b!1036102 () Bool)

(assert (=> b!1036102 (= e!585961 call!43825)))

(assert (= (and d!124543 (not res!691672)) b!1036100))

(assert (= (and b!1036100 c!104786) b!1036099))

(assert (= (and b!1036100 (not c!104786)) b!1036101))

(assert (= (and b!1036099 res!691673) b!1036102))

(assert (= (or b!1036102 b!1036101) bm!43822))

(declare-fun m!955613 () Bool)

(assert (=> bm!43822 m!955613))

(assert (=> b!1036099 m!955067))

(declare-fun m!955615 () Bool)

(assert (=> b!1036099 m!955615))

(declare-fun m!955617 () Bool)

(assert (=> b!1036099 m!955617))

(assert (=> b!1036099 m!955067))

(declare-fun m!955619 () Bool)

(assert (=> b!1036099 m!955619))

(assert (=> b!1036100 m!955067))

(assert (=> b!1036100 m!955067))

(assert (=> b!1036100 m!955085))

(assert (=> b!1035876 d!124543))

(declare-fun d!124545 () Bool)

(declare-fun e!585963 () Bool)

(assert (=> d!124545 e!585963))

(declare-fun res!691675 () Bool)

(assert (=> d!124545 (=> (not res!691675) (not e!585963))))

(declare-fun lt!456869 () ListLongMap!13833)

(assert (=> d!124545 (= res!691675 (contains!6001 lt!456869 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun lt!456870 () List!21952)

(assert (=> d!124545 (= lt!456869 (ListLongMap!13834 lt!456870))))

(declare-fun lt!456868 () Unit!33774)

(declare-fun lt!456867 () Unit!33774)

(assert (=> d!124545 (= lt!456868 lt!456867)))

(assert (=> d!124545 (= (getValueByKey!591 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!124545 (= lt!456867 (lemmaContainsTupThenGetReturnValue!281 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!124545 (= lt!456870 (insertStrictlySorted!374 (toList!6932 call!43799) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!124545 (= (+!3131 call!43799 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) lt!456869)))

(declare-fun b!1036103 () Bool)

(declare-fun res!691674 () Bool)

(assert (=> b!1036103 (=> (not res!691674) (not e!585963))))

(assert (=> b!1036103 (= res!691674 (= (getValueByKey!591 (toList!6932 lt!456869) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036104 () Bool)

(assert (=> b!1036104 (= e!585963 (contains!6002 (toList!6932 lt!456869) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(assert (= (and d!124545 res!691675) b!1036103))

(assert (= (and b!1036103 res!691674) b!1036104))

(declare-fun m!955621 () Bool)

(assert (=> d!124545 m!955621))

(declare-fun m!955623 () Bool)

(assert (=> d!124545 m!955623))

(declare-fun m!955625 () Bool)

(assert (=> d!124545 m!955625))

(declare-fun m!955627 () Bool)

(assert (=> d!124545 m!955627))

(declare-fun m!955629 () Bool)

(assert (=> b!1036103 m!955629))

(declare-fun m!955631 () Bool)

(assert (=> b!1036104 m!955631))

(assert (=> b!1035859 d!124545))

(declare-fun d!124547 () Bool)

(assert (=> d!124547 (= (apply!900 lt!456682 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16459 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30305 () Bool)

(assert (= bs!30305 d!124547))

(assert (=> bs!30305 m!955243))

(assert (=> bs!30305 m!955243))

(declare-fun m!955633 () Bool)

(assert (=> bs!30305 m!955633))

(assert (=> b!1035851 d!124547))

(assert (=> bm!43798 d!124519))

(declare-fun b!1036105 () Bool)

(declare-fun e!585967 () Bool)

(declare-fun e!585964 () Bool)

(assert (=> b!1036105 (= e!585967 e!585964)))

(declare-fun res!691676 () Bool)

(assert (=> b!1036105 (=> (not res!691676) (not e!585964))))

(declare-fun e!585965 () Bool)

(assert (=> b!1036105 (= res!691676 (not e!585965))))

(declare-fun res!691677 () Bool)

(assert (=> b!1036105 (=> (not res!691677) (not e!585965))))

(assert (=> b!1036105 (= res!691677 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun d!124549 () Bool)

(declare-fun res!691678 () Bool)

(assert (=> d!124549 (=> res!691678 e!585967)))

(assert (=> d!124549 (= res!691678 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124549 (= (arrayNoDuplicates!0 (_keys!11454 lt!456581) #b00000000000000000000000000000000 Nil!21950) e!585967)))

(declare-fun b!1036106 () Bool)

(assert (=> b!1036106 (= e!585965 (contains!6003 Nil!21950 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036107 () Bool)

(declare-fun e!585966 () Bool)

(declare-fun call!43826 () Bool)

(assert (=> b!1036107 (= e!585966 call!43826)))

(declare-fun bm!43823 () Bool)

(declare-fun c!104787 () Bool)

(assert (=> bm!43823 (= call!43826 (arrayNoDuplicates!0 (_keys!11454 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104787 (Cons!21949 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)))))

(declare-fun b!1036108 () Bool)

(assert (=> b!1036108 (= e!585964 e!585966)))

(assert (=> b!1036108 (= c!104787 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036109 () Bool)

(assert (=> b!1036109 (= e!585966 call!43826)))

(assert (= (and d!124549 (not res!691678)) b!1036105))

(assert (= (and b!1036105 res!691677) b!1036106))

(assert (= (and b!1036105 res!691676) b!1036108))

(assert (= (and b!1036108 c!104787) b!1036107))

(assert (= (and b!1036108 (not c!104787)) b!1036109))

(assert (= (or b!1036107 b!1036109) bm!43823))

(assert (=> b!1036105 m!955545))

(assert (=> b!1036105 m!955545))

(assert (=> b!1036105 m!955561))

(assert (=> b!1036106 m!955545))

(assert (=> b!1036106 m!955545))

(declare-fun m!955635 () Bool)

(assert (=> b!1036106 m!955635))

(assert (=> bm!43823 m!955545))

(declare-fun m!955637 () Bool)

(assert (=> bm!43823 m!955637))

(assert (=> b!1036108 m!955545))

(assert (=> b!1036108 m!955545))

(assert (=> b!1036108 m!955561))

(assert (=> b!1035874 d!124549))

(assert (=> b!1035849 d!124477))

(assert (=> d!124417 d!124483))

(declare-fun d!124551 () Bool)

(declare-fun e!585968 () Bool)

(assert (=> d!124551 e!585968))

(declare-fun res!691679 () Bool)

(assert (=> d!124551 (=> res!691679 e!585968)))

(declare-fun lt!456872 () Bool)

(assert (=> d!124551 (= res!691679 (not lt!456872))))

(declare-fun lt!456871 () Bool)

(assert (=> d!124551 (= lt!456872 lt!456871)))

(declare-fun lt!456874 () Unit!33774)

(declare-fun e!585969 () Unit!33774)

(assert (=> d!124551 (= lt!456874 e!585969)))

(declare-fun c!104788 () Bool)

(assert (=> d!124551 (= c!104788 lt!456871)))

(assert (=> d!124551 (= lt!456871 (containsKey!564 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124551 (= (contains!6001 lt!456682 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!456872)))

(declare-fun b!1036110 () Bool)

(declare-fun lt!456873 () Unit!33774)

(assert (=> b!1036110 (= e!585969 lt!456873)))

(assert (=> b!1036110 (= lt!456873 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036110 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036111 () Bool)

(declare-fun Unit!33788 () Unit!33774)

(assert (=> b!1036111 (= e!585969 Unit!33788)))

(declare-fun b!1036112 () Bool)

(assert (=> b!1036112 (= e!585968 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124551 c!104788) b!1036110))

(assert (= (and d!124551 (not c!104788)) b!1036111))

(assert (= (and d!124551 (not res!691679)) b!1036112))

(assert (=> d!124551 m!955067))

(declare-fun m!955639 () Bool)

(assert (=> d!124551 m!955639))

(assert (=> b!1036110 m!955067))

(declare-fun m!955641 () Bool)

(assert (=> b!1036110 m!955641))

(assert (=> b!1036110 m!955067))

(declare-fun m!955643 () Bool)

(assert (=> b!1036110 m!955643))

(assert (=> b!1036110 m!955643))

(declare-fun m!955645 () Bool)

(assert (=> b!1036110 m!955645))

(assert (=> b!1036112 m!955067))

(assert (=> b!1036112 m!955643))

(assert (=> b!1036112 m!955643))

(assert (=> b!1036112 m!955645))

(assert (=> b!1035865 d!124551))

(declare-fun bm!43824 () Bool)

(declare-fun call!43827 () Bool)

(assert (=> bm!43824 (= call!43827 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11454 lt!456581) (mask!30165 lt!456581)))))

(declare-fun b!1036113 () Bool)

(declare-fun e!585972 () Bool)

(declare-fun e!585971 () Bool)

(assert (=> b!1036113 (= e!585972 e!585971)))

(declare-fun lt!456875 () (_ BitVec 64))

(assert (=> b!1036113 (= lt!456875 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))

(declare-fun lt!456876 () Unit!33774)

(assert (=> b!1036113 (= lt!456876 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11454 lt!456581) lt!456875 #b00000000000000000000000000000000))))

(assert (=> b!1036113 (arrayContainsKey!0 (_keys!11454 lt!456581) lt!456875 #b00000000000000000000000000000000)))

(declare-fun lt!456877 () Unit!33774)

(assert (=> b!1036113 (= lt!456877 lt!456876)))

(declare-fun res!691681 () Bool)

(assert (=> b!1036113 (= res!691681 (= (seekEntryOrOpen!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) (_keys!11454 lt!456581) (mask!30165 lt!456581)) (Found!9737 #b00000000000000000000000000000000)))))

(assert (=> b!1036113 (=> (not res!691681) (not e!585971))))

(declare-fun b!1036114 () Bool)

(declare-fun e!585970 () Bool)

(assert (=> b!1036114 (= e!585970 e!585972)))

(declare-fun c!104789 () Bool)

(assert (=> b!1036114 (= c!104789 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036115 () Bool)

(assert (=> b!1036115 (= e!585972 call!43827)))

(declare-fun d!124553 () Bool)

(declare-fun res!691680 () Bool)

(assert (=> d!124553 (=> res!691680 e!585970)))

(assert (=> d!124553 (= res!691680 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11454 lt!456581) (mask!30165 lt!456581)) e!585970)))

(declare-fun b!1036116 () Bool)

(assert (=> b!1036116 (= e!585971 call!43827)))

(assert (= (and d!124553 (not res!691680)) b!1036114))

(assert (= (and b!1036114 c!104789) b!1036113))

(assert (= (and b!1036114 (not c!104789)) b!1036115))

(assert (= (and b!1036113 res!691681) b!1036116))

(assert (= (or b!1036116 b!1036115) bm!43824))

(declare-fun m!955647 () Bool)

(assert (=> bm!43824 m!955647))

(assert (=> b!1036113 m!955545))

(declare-fun m!955649 () Bool)

(assert (=> b!1036113 m!955649))

(declare-fun m!955651 () Bool)

(assert (=> b!1036113 m!955651))

(assert (=> b!1036113 m!955545))

(declare-fun m!955653 () Bool)

(assert (=> b!1036113 m!955653))

(assert (=> b!1036114 m!955545))

(assert (=> b!1036114 m!955545))

(assert (=> b!1036114 m!955561))

(assert (=> b!1035873 d!124553))

(declare-fun d!124555 () Bool)

(assert (=> d!124555 (= (apply!900 lt!456682 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16459 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30306 () Bool)

(assert (= bs!30306 d!124555))

(assert (=> bs!30306 m!955067))

(assert (=> bs!30306 m!955643))

(assert (=> bs!30306 m!955643))

(declare-fun m!955655 () Bool)

(assert (=> bs!30306 m!955655))

(assert (=> b!1035848 d!124555))

(assert (=> b!1035848 d!124487))

(declare-fun b!1036117 () Bool)

(declare-fun e!585973 () (_ BitVec 32))

(assert (=> b!1036117 (= e!585973 #b00000000000000000000000000000000)))

(declare-fun d!124557 () Bool)

(declare-fun lt!456878 () (_ BitVec 32))

(assert (=> d!124557 (and (bvsge lt!456878 #b00000000000000000000000000000000) (bvsle lt!456878 (bvsub (size!31928 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (=> d!124557 (= lt!456878 e!585973)))

(declare-fun c!104790 () Bool)

(assert (=> d!124557 (= c!104790 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124557 (and (bvsle #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31928 (_keys!11454 lt!456581)) (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124557 (= (arrayCountValidKeys!0 (_keys!11454 lt!456581) #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))) lt!456878)))

(declare-fun b!1036118 () Bool)

(declare-fun e!585974 () (_ BitVec 32))

(assert (=> b!1036118 (= e!585973 e!585974)))

(declare-fun c!104791 () Bool)

(assert (=> b!1036118 (= c!104791 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun bm!43825 () Bool)

(declare-fun call!43828 () (_ BitVec 32))

(assert (=> bm!43825 (= call!43828 (arrayCountValidKeys!0 (_keys!11454 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))))))

(declare-fun b!1036119 () Bool)

(assert (=> b!1036119 (= e!585974 (bvadd #b00000000000000000000000000000001 call!43828))))

(declare-fun b!1036120 () Bool)

(assert (=> b!1036120 (= e!585974 call!43828)))

(assert (= (and d!124557 c!104790) b!1036117))

(assert (= (and d!124557 (not c!104790)) b!1036118))

(assert (= (and b!1036118 c!104791) b!1036119))

(assert (= (and b!1036118 (not c!104791)) b!1036120))

(assert (= (or b!1036119 b!1036120) bm!43825))

(assert (=> b!1036118 m!955545))

(assert (=> b!1036118 m!955545))

(assert (=> b!1036118 m!955561))

(declare-fun m!955657 () Bool)

(assert (=> bm!43825 m!955657))

(assert (=> b!1035872 d!124557))

(declare-fun d!124559 () Bool)

(declare-fun e!585975 () Bool)

(assert (=> d!124559 e!585975))

(declare-fun res!691683 () Bool)

(assert (=> d!124559 (=> (not res!691683) (not e!585975))))

(declare-fun lt!456881 () ListLongMap!13833)

(assert (=> d!124559 (= res!691683 (contains!6001 lt!456881 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun lt!456882 () List!21952)

(assert (=> d!124559 (= lt!456881 (ListLongMap!13834 lt!456882))))

(declare-fun lt!456880 () Unit!33774)

(declare-fun lt!456879 () Unit!33774)

(assert (=> d!124559 (= lt!456880 lt!456879)))

(assert (=> d!124559 (= (getValueByKey!591 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) (Some!641 (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!124559 (= lt!456879 (lemmaContainsTupThenGetReturnValue!281 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!124559 (= lt!456882 (insertStrictlySorted!374 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!124559 (= (+!3131 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!456881)))

(declare-fun b!1036121 () Bool)

(declare-fun res!691682 () Bool)

(assert (=> b!1036121 (=> (not res!691682) (not e!585975))))

(assert (=> b!1036121 (= res!691682 (= (getValueByKey!591 (toList!6932 lt!456881) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) (Some!641 (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036122 () Bool)

(assert (=> b!1036122 (= e!585975 (contains!6002 (toList!6932 lt!456881) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124559 res!691683) b!1036121))

(assert (= (and b!1036121 res!691682) b!1036122))

(declare-fun m!955659 () Bool)

(assert (=> d!124559 m!955659))

(declare-fun m!955661 () Bool)

(assert (=> d!124559 m!955661))

(declare-fun m!955663 () Bool)

(assert (=> d!124559 m!955663))

(declare-fun m!955665 () Bool)

(assert (=> d!124559 m!955665))

(declare-fun m!955667 () Bool)

(assert (=> b!1036121 m!955667))

(declare-fun m!955669 () Bool)

(assert (=> b!1036122 m!955669))

(assert (=> bm!43797 d!124559))

(declare-fun mapIsEmpty!38419 () Bool)

(declare-fun mapRes!38419 () Bool)

(assert (=> mapIsEmpty!38419 mapRes!38419))

(declare-fun b!1036124 () Bool)

(declare-fun e!585977 () Bool)

(assert (=> b!1036124 (= e!585977 tp_is_empty!24595)))

(declare-fun mapNonEmpty!38419 () Bool)

(declare-fun tp!73775 () Bool)

(declare-fun e!585976 () Bool)

(assert (=> mapNonEmpty!38419 (= mapRes!38419 (and tp!73775 e!585976))))

(declare-fun mapKey!38419 () (_ BitVec 32))

(declare-fun mapRest!38419 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapValue!38419 () ValueCell!11594)

(assert (=> mapNonEmpty!38419 (= mapRest!38418 (store mapRest!38419 mapKey!38419 mapValue!38419))))

(declare-fun b!1036123 () Bool)

(assert (=> b!1036123 (= e!585976 tp_is_empty!24595)))

(declare-fun condMapEmpty!38419 () Bool)

(declare-fun mapDefault!38419 () ValueCell!11594)

(assert (=> mapNonEmpty!38418 (= condMapEmpty!38419 (= mapRest!38418 ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38419)))))

(assert (=> mapNonEmpty!38418 (= tp!73774 (and e!585977 mapRes!38419))))

(assert (= (and mapNonEmpty!38418 condMapEmpty!38419) mapIsEmpty!38419))

(assert (= (and mapNonEmpty!38418 (not condMapEmpty!38419)) mapNonEmpty!38419))

(assert (= (and mapNonEmpty!38419 ((_ is ValueCellFull!11594) mapValue!38419)) b!1036123))

(assert (= (and mapNonEmpty!38418 ((_ is ValueCellFull!11594) mapDefault!38419)) b!1036124))

(declare-fun m!955671 () Bool)

(assert (=> mapNonEmpty!38419 m!955671))

(declare-fun b_lambda!16105 () Bool)

(assert (= b_lambda!16099 (or (and b!1035733 b_free!20875) b_lambda!16105)))

(declare-fun b_lambda!16107 () Bool)

(assert (= b_lambda!16101 (or (and b!1035733 b_free!20875) b_lambda!16107)))

(declare-fun b_lambda!16109 () Bool)

(assert (= b_lambda!16097 (or (and b!1035733 b_free!20875) b_lambda!16109)))

(declare-fun b_lambda!16111 () Bool)

(assert (= b_lambda!16095 (or (and b!1035733 b_free!20875) b_lambda!16111)))

(check-sat (not d!124463) (not b!1036034) (not b!1035923) (not b!1036056) (not b!1036036) (not bm!43823) (not b!1035912) (not d!124545) (not bm!43805) (not d!124503) (not d!124531) (not d!124441) (not d!124513) (not b!1035930) (not d!124539) (not b!1036022) (not b!1035982) (not b!1036089) (not d!124523) (not b!1036046) (not d!124475) (not b!1035943) (not d!124501) (not d!124449) (not b!1036029) (not d!124515) (not b!1035973) (not b!1035941) (not b!1036103) (not b!1035906) (not b!1035976) (not b!1036047) (not b!1036013) (not b!1035942) (not b!1035944) (not d!124519) (not b!1035939) (not d!124469) (not b!1035922) (not b!1036066) (not d!124559) (not b!1036099) (not d!124467) (not b!1036112) (not b!1036075) (not d!124511) (not b!1036106) (not b!1035945) (not b_lambda!16085) (not d!124517) (not b!1036073) (not d!124525) (not b!1036041) (not b!1035975) (not bm!43816) (not b!1036039) (not b!1036055) (not b!1036042) (not b!1036015) (not bm!43813) (not bm!43819) (not d!124473) (not b!1036051) (not b_lambda!16093) (not d!124445) (not b!1035980) (not mapNonEmpty!38419) (not b!1036023) (not b_lambda!16107) (not bm!43809) (not d!124555) (not b!1035933) (not d!124465) (not b!1036032) (not b!1036028) (not b!1036021) (not d!124493) (not b!1035984) (not d!124497) (not d!124505) (not d!124447) (not b!1035981) (not b!1036065) (not b!1035988) (not b!1036104) (not d!124529) (not b!1036049) (not b!1036043) (not bm!43808) (not b!1036019) (not b!1036086) (not b!1036113) (not b_lambda!16105) (not d!124547) (not d!124437) (not b!1035931) (not b!1036000) (not d!124491) (not d!124535) (not d!124489) (not b!1036069) (not b!1036008) (not d!124507) (not b!1036010) (not b!1036026) (not bm!43822) (not b!1035940) (not b!1036007) (not b!1036009) (not d!124537) (not b_next!20875) (not d!124479) (not b!1036040) (not b!1035986) (not d!124521) (not b!1035910) (not d!124435) (not d!124471) (not d!124433) (not b!1036035) (not b!1035990) (not d!124451) (not d!124443) (not d!124495) (not b!1035946) (not b!1036064) (not b!1036072) (not d!124533) (not b!1036110) (not d!124439) (not b_lambda!16103) (not d!124431) (not b!1035929) (not b!1036108) (not b!1036087) (not b_lambda!16111) (not b!1035892) (not b_lambda!16109) (not b!1036058) (not b!1035909) (not d!124527) (not b!1036122) (not b!1035977) (not b!1036037) (not b!1036114) (not bm!43824) (not d!124485) (not b!1036121) (not b!1036118) (not b!1036011) tp_is_empty!24595 (not b_lambda!16091) (not d!124461) (not bm!43825) (not b!1036105) (not d!124459) (not b!1036025) (not b!1036018) (not b!1036100) (not d!124509) (not d!124551) (not bm!43812) (not b!1035894) (not b!1035978) (not d!124499) (not d!124455) (not d!124457) (not bm!43811) (not d!124453) b_and!33373)
(check-sat b_and!33373 (not b_next!20875))
(get-model)

(declare-fun d!124561 () Bool)

(assert (=> d!124561 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456659) lt!456665)) (v!14930 (getValueByKey!591 (toList!6932 lt!456659) lt!456665)))))

(assert (=> d!124465 d!124561))

(declare-fun d!124563 () Bool)

(declare-fun c!104796 () Bool)

(assert (=> d!124563 (= c!104796 (and ((_ is Cons!21948) (toList!6932 lt!456659)) (= (_1!7916 (h!23150 (toList!6932 lt!456659))) lt!456665)))))

(declare-fun e!585982 () Option!642)

(assert (=> d!124563 (= (getValueByKey!591 (toList!6932 lt!456659) lt!456665) e!585982)))

(declare-fun b!1036136 () Bool)

(declare-fun e!585983 () Option!642)

(assert (=> b!1036136 (= e!585983 None!640)))

(declare-fun b!1036133 () Bool)

(assert (=> b!1036133 (= e!585982 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456659)))))))

(declare-fun b!1036134 () Bool)

(assert (=> b!1036134 (= e!585982 e!585983)))

(declare-fun c!104797 () Bool)

(assert (=> b!1036134 (= c!104797 (and ((_ is Cons!21948) (toList!6932 lt!456659)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456659))) lt!456665))))))

(declare-fun b!1036135 () Bool)

(assert (=> b!1036135 (= e!585983 (getValueByKey!591 (t!31148 (toList!6932 lt!456659)) lt!456665))))

(assert (= (and d!124563 c!104796) b!1036133))

(assert (= (and d!124563 (not c!104796)) b!1036134))

(assert (= (and b!1036134 c!104797) b!1036135))

(assert (= (and b!1036134 (not c!104797)) b!1036136))

(declare-fun m!955673 () Bool)

(assert (=> b!1036135 m!955673))

(assert (=> d!124465 d!124563))

(declare-fun d!124565 () Bool)

(assert (=> d!124565 (arrayContainsKey!0 (_keys!11454 thiss!1427) lt!456864 #b00000000000000000000000000000000)))

(declare-fun lt!456885 () Unit!33774)

(declare-fun choose!13 (array!65227 (_ BitVec 64) (_ BitVec 32)) Unit!33774)

(assert (=> d!124565 (= lt!456885 (choose!13 (_keys!11454 thiss!1427) lt!456864 #b00000000000000000000000000000000))))

(assert (=> d!124565 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124565 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11454 thiss!1427) lt!456864 #b00000000000000000000000000000000) lt!456885)))

(declare-fun bs!30307 () Bool)

(assert (= bs!30307 d!124565))

(assert (=> bs!30307 m!955617))

(declare-fun m!955675 () Bool)

(assert (=> bs!30307 m!955675))

(assert (=> b!1036099 d!124565))

(declare-fun d!124567 () Bool)

(declare-fun res!691688 () Bool)

(declare-fun e!585988 () Bool)

(assert (=> d!124567 (=> res!691688 e!585988)))

(assert (=> d!124567 (= res!691688 (= (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) lt!456864))))

(assert (=> d!124567 (= (arrayContainsKey!0 (_keys!11454 thiss!1427) lt!456864 #b00000000000000000000000000000000) e!585988)))

(declare-fun b!1036141 () Bool)

(declare-fun e!585989 () Bool)

(assert (=> b!1036141 (= e!585988 e!585989)))

(declare-fun res!691689 () Bool)

(assert (=> b!1036141 (=> (not res!691689) (not e!585989))))

(assert (=> b!1036141 (= res!691689 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1036142 () Bool)

(assert (=> b!1036142 (= e!585989 (arrayContainsKey!0 (_keys!11454 thiss!1427) lt!456864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124567 (not res!691688)) b!1036141))

(assert (= (and b!1036141 res!691689) b!1036142))

(assert (=> d!124567 m!955067))

(declare-fun m!955677 () Bool)

(assert (=> b!1036142 m!955677))

(assert (=> b!1036099 d!124567))

(declare-fun d!124569 () Bool)

(declare-fun lt!456893 () SeekEntryResult!9737)

(assert (=> d!124569 (and (or ((_ is Undefined!9737) lt!456893) (not ((_ is Found!9737) lt!456893)) (and (bvsge (index!41320 lt!456893) #b00000000000000000000000000000000) (bvslt (index!41320 lt!456893) (size!31928 (_keys!11454 thiss!1427))))) (or ((_ is Undefined!9737) lt!456893) ((_ is Found!9737) lt!456893) (not ((_ is MissingZero!9737) lt!456893)) (and (bvsge (index!41319 lt!456893) #b00000000000000000000000000000000) (bvslt (index!41319 lt!456893) (size!31928 (_keys!11454 thiss!1427))))) (or ((_ is Undefined!9737) lt!456893) ((_ is Found!9737) lt!456893) ((_ is MissingZero!9737) lt!456893) (not ((_ is MissingVacant!9737) lt!456893)) (and (bvsge (index!41322 lt!456893) #b00000000000000000000000000000000) (bvslt (index!41322 lt!456893) (size!31928 (_keys!11454 thiss!1427))))) (or ((_ is Undefined!9737) lt!456893) (ite ((_ is Found!9737) lt!456893) (= (select (arr!31398 (_keys!11454 thiss!1427)) (index!41320 lt!456893)) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9737) lt!456893) (= (select (arr!31398 (_keys!11454 thiss!1427)) (index!41319 lt!456893)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9737) lt!456893) (= (select (arr!31398 (_keys!11454 thiss!1427)) (index!41322 lt!456893)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!585996 () SeekEntryResult!9737)

(assert (=> d!124569 (= lt!456893 e!585996)))

(declare-fun c!104805 () Bool)

(declare-fun lt!456892 () SeekEntryResult!9737)

(assert (=> d!124569 (= c!104805 (and ((_ is Intermediate!9737) lt!456892) (undefined!10549 lt!456892)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65227 (_ BitVec 32)) SeekEntryResult!9737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!124569 (= lt!456892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (mask!30165 thiss!1427)) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)))))

(assert (=> d!124569 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124569 (= (seekEntryOrOpen!0 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)) lt!456893)))

(declare-fun b!1036155 () Bool)

(declare-fun e!585997 () SeekEntryResult!9737)

(assert (=> b!1036155 (= e!585997 (MissingZero!9737 (index!41321 lt!456892)))))

(declare-fun b!1036156 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65227 (_ BitVec 32)) SeekEntryResult!9737)

(assert (=> b!1036156 (= e!585997 (seekKeyOrZeroReturnVacant!0 (x!92460 lt!456892) (index!41321 lt!456892) (index!41321 lt!456892) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)))))

(declare-fun b!1036157 () Bool)

(declare-fun e!585998 () SeekEntryResult!9737)

(assert (=> b!1036157 (= e!585996 e!585998)))

(declare-fun lt!456894 () (_ BitVec 64))

(assert (=> b!1036157 (= lt!456894 (select (arr!31398 (_keys!11454 thiss!1427)) (index!41321 lt!456892)))))

(declare-fun c!104804 () Bool)

(assert (=> b!1036157 (= c!104804 (= lt!456894 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036158 () Bool)

(declare-fun c!104806 () Bool)

(assert (=> b!1036158 (= c!104806 (= lt!456894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036158 (= e!585998 e!585997)))

(declare-fun b!1036159 () Bool)

(assert (=> b!1036159 (= e!585998 (Found!9737 (index!41321 lt!456892)))))

(declare-fun b!1036160 () Bool)

(assert (=> b!1036160 (= e!585996 Undefined!9737)))

(assert (= (and d!124569 c!104805) b!1036160))

(assert (= (and d!124569 (not c!104805)) b!1036157))

(assert (= (and b!1036157 c!104804) b!1036159))

(assert (= (and b!1036157 (not c!104804)) b!1036158))

(assert (= (and b!1036158 c!104806) b!1036155))

(assert (= (and b!1036158 (not c!104806)) b!1036156))

(assert (=> d!124569 m!955077))

(declare-fun m!955679 () Bool)

(assert (=> d!124569 m!955679))

(declare-fun m!955681 () Bool)

(assert (=> d!124569 m!955681))

(assert (=> d!124569 m!955067))

(declare-fun m!955683 () Bool)

(assert (=> d!124569 m!955683))

(declare-fun m!955685 () Bool)

(assert (=> d!124569 m!955685))

(declare-fun m!955687 () Bool)

(assert (=> d!124569 m!955687))

(assert (=> d!124569 m!955067))

(assert (=> d!124569 m!955681))

(assert (=> b!1036156 m!955067))

(declare-fun m!955689 () Bool)

(assert (=> b!1036156 m!955689))

(declare-fun m!955691 () Bool)

(assert (=> b!1036157 m!955691))

(assert (=> b!1036099 d!124569))

(declare-fun d!124571 () Bool)

(declare-fun lt!456897 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!514 (List!21952) (InoxSet tuple2!15810))

(assert (=> d!124571 (= lt!456897 (select (content!514 (toList!6932 lt!456748)) (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))

(declare-fun e!586003 () Bool)

(assert (=> d!124571 (= lt!456897 e!586003)))

(declare-fun res!691694 () Bool)

(assert (=> d!124571 (=> (not res!691694) (not e!586003))))

(assert (=> d!124571 (= res!691694 ((_ is Cons!21948) (toList!6932 lt!456748)))))

(assert (=> d!124571 (= (contains!6002 (toList!6932 lt!456748) (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) lt!456897)))

(declare-fun b!1036165 () Bool)

(declare-fun e!586004 () Bool)

(assert (=> b!1036165 (= e!586003 e!586004)))

(declare-fun res!691695 () Bool)

(assert (=> b!1036165 (=> res!691695 e!586004)))

(assert (=> b!1036165 (= res!691695 (= (h!23150 (toList!6932 lt!456748)) (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1036166 () Bool)

(assert (=> b!1036166 (= e!586004 (contains!6002 (t!31148 (toList!6932 lt!456748)) (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124571 res!691694) b!1036165))

(assert (= (and b!1036165 (not res!691695)) b!1036166))

(declare-fun m!955693 () Bool)

(assert (=> d!124571 m!955693))

(declare-fun m!955695 () Bool)

(assert (=> d!124571 m!955695))

(declare-fun m!955697 () Bool)

(assert (=> b!1036166 m!955697))

(assert (=> b!1035944 d!124571))

(declare-fun d!124573 () Bool)

(assert (=> d!124573 (= (validMask!0 (mask!30165 lt!456581)) (and (or (= (mask!30165 lt!456581) #b00000000000000000000000000000111) (= (mask!30165 lt!456581) #b00000000000000000000000000001111) (= (mask!30165 lt!456581) #b00000000000000000000000000011111) (= (mask!30165 lt!456581) #b00000000000000000000000000111111) (= (mask!30165 lt!456581) #b00000000000000000000000001111111) (= (mask!30165 lt!456581) #b00000000000000000000000011111111) (= (mask!30165 lt!456581) #b00000000000000000000000111111111) (= (mask!30165 lt!456581) #b00000000000000000000001111111111) (= (mask!30165 lt!456581) #b00000000000000000000011111111111) (= (mask!30165 lt!456581) #b00000000000000000000111111111111) (= (mask!30165 lt!456581) #b00000000000000000001111111111111) (= (mask!30165 lt!456581) #b00000000000000000011111111111111) (= (mask!30165 lt!456581) #b00000000000000000111111111111111) (= (mask!30165 lt!456581) #b00000000000000001111111111111111) (= (mask!30165 lt!456581) #b00000000000000011111111111111111) (= (mask!30165 lt!456581) #b00000000000000111111111111111111) (= (mask!30165 lt!456581) #b00000000000001111111111111111111) (= (mask!30165 lt!456581) #b00000000000011111111111111111111) (= (mask!30165 lt!456581) #b00000000000111111111111111111111) (= (mask!30165 lt!456581) #b00000000001111111111111111111111) (= (mask!30165 lt!456581) #b00000000011111111111111111111111) (= (mask!30165 lt!456581) #b00000000111111111111111111111111) (= (mask!30165 lt!456581) #b00000001111111111111111111111111) (= (mask!30165 lt!456581) #b00000011111111111111111111111111) (= (mask!30165 lt!456581) #b00000111111111111111111111111111) (= (mask!30165 lt!456581) #b00001111111111111111111111111111) (= (mask!30165 lt!456581) #b00011111111111111111111111111111) (= (mask!30165 lt!456581) #b00111111111111111111111111111111)) (bvsle (mask!30165 lt!456581) #b00111111111111111111111111111111)))))

(assert (=> d!124537 d!124573))

(declare-fun d!124575 () Bool)

(assert (=> d!124575 (= (apply!900 lt!456843 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) (get!16459 (getValueByKey!591 (toList!6932 lt!456843) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))))

(declare-fun bs!30308 () Bool)

(assert (= bs!30308 d!124575))

(assert (=> bs!30308 m!955545))

(declare-fun m!955699 () Bool)

(assert (=> bs!30308 m!955699))

(assert (=> bs!30308 m!955699))

(declare-fun m!955701 () Bool)

(assert (=> bs!30308 m!955701))

(assert (=> b!1036055 d!124575))

(declare-fun d!124577 () Bool)

(declare-fun c!104807 () Bool)

(assert (=> d!124577 (= c!104807 ((_ is ValueCellFull!11594) (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun e!586005 () V!37667)

(assert (=> d!124577 (= (get!16458 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000)) e!586005)))

(declare-fun b!1036167 () Bool)

(assert (=> b!1036167 (= e!586005 (get!16460 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036168 () Bool)

(assert (=> b!1036168 (= e!586005 (get!16461 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124577 c!104807) b!1036167))

(assert (= (and d!124577 (not c!104807)) b!1036168))

(assert (=> b!1036167 m!955551))

(assert (=> b!1036167 m!955549))

(declare-fun m!955703 () Bool)

(assert (=> b!1036167 m!955703))

(assert (=> b!1036168 m!955551))

(assert (=> b!1036168 m!955549))

(declare-fun m!955705 () Bool)

(assert (=> b!1036168 m!955705))

(assert (=> b!1036055 d!124577))

(declare-fun d!124579 () Bool)

(declare-fun c!104808 () Bool)

(assert (=> d!124579 (= c!104808 (and ((_ is Cons!21948) (toList!6932 lt!456869)) (= (_1!7916 (h!23150 (toList!6932 lt!456869))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun e!586006 () Option!642)

(assert (=> d!124579 (= (getValueByKey!591 (toList!6932 lt!456869) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) e!586006)))

(declare-fun b!1036172 () Bool)

(declare-fun e!586007 () Option!642)

(assert (=> b!1036172 (= e!586007 None!640)))

(declare-fun b!1036169 () Bool)

(assert (=> b!1036169 (= e!586006 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456869)))))))

(declare-fun b!1036170 () Bool)

(assert (=> b!1036170 (= e!586006 e!586007)))

(declare-fun c!104809 () Bool)

(assert (=> b!1036170 (= c!104809 (and ((_ is Cons!21948) (toList!6932 lt!456869)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456869))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036171 () Bool)

(assert (=> b!1036171 (= e!586007 (getValueByKey!591 (t!31148 (toList!6932 lt!456869)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124579 c!104808) b!1036169))

(assert (= (and d!124579 (not c!104808)) b!1036170))

(assert (= (and b!1036170 c!104809) b!1036171))

(assert (= (and b!1036170 (not c!104809)) b!1036172))

(declare-fun m!955707 () Bool)

(assert (=> b!1036171 m!955707))

(assert (=> b!1036103 d!124579))

(declare-fun d!124581 () Bool)

(declare-fun e!586008 () Bool)

(assert (=> d!124581 e!586008))

(declare-fun res!691696 () Bool)

(assert (=> d!124581 (=> res!691696 e!586008)))

(declare-fun lt!456899 () Bool)

(assert (=> d!124581 (= res!691696 (not lt!456899))))

(declare-fun lt!456898 () Bool)

(assert (=> d!124581 (= lt!456899 lt!456898)))

(declare-fun lt!456901 () Unit!33774)

(declare-fun e!586009 () Unit!33774)

(assert (=> d!124581 (= lt!456901 e!586009)))

(declare-fun c!104810 () Bool)

(assert (=> d!124581 (= c!104810 lt!456898)))

(assert (=> d!124581 (= lt!456898 (containsKey!564 (toList!6932 lt!456819) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124581 (= (contains!6001 lt!456819 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456899)))

(declare-fun b!1036173 () Bool)

(declare-fun lt!456900 () Unit!33774)

(assert (=> b!1036173 (= e!586009 lt!456900)))

(assert (=> b!1036173 (= lt!456900 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456819) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036173 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456819) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036174 () Bool)

(declare-fun Unit!33789 () Unit!33774)

(assert (=> b!1036174 (= e!586009 Unit!33789)))

(declare-fun b!1036175 () Bool)

(assert (=> b!1036175 (= e!586008 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124581 c!104810) b!1036173))

(assert (= (and d!124581 (not c!104810)) b!1036174))

(assert (= (and d!124581 (not res!691696)) b!1036175))

(declare-fun m!955709 () Bool)

(assert (=> d!124581 m!955709))

(declare-fun m!955711 () Bool)

(assert (=> b!1036173 m!955711))

(declare-fun m!955713 () Bool)

(assert (=> b!1036173 m!955713))

(assert (=> b!1036173 m!955713))

(declare-fun m!955715 () Bool)

(assert (=> b!1036173 m!955715))

(assert (=> b!1036175 m!955713))

(assert (=> b!1036175 m!955713))

(assert (=> b!1036175 m!955715))

(assert (=> d!124519 d!124581))

(assert (=> d!124519 d!124483))

(declare-fun d!124583 () Bool)

(assert (=> d!124583 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456904 () Unit!33774)

(declare-fun choose!1712 (List!21952 (_ BitVec 64)) Unit!33774)

(assert (=> d!124583 (= lt!456904 (choose!1712 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586012 () Bool)

(assert (=> d!124583 e!586012))

(declare-fun res!691699 () Bool)

(assert (=> d!124583 (=> (not res!691699) (not e!586012))))

(assert (=> d!124583 (= res!691699 (isStrictlySorted!715 (toList!6932 lt!456682)))))

(assert (=> d!124583 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456904)))

(declare-fun b!1036178 () Bool)

(assert (=> b!1036178 (= e!586012 (containsKey!564 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124583 res!691699) b!1036178))

(assert (=> d!124583 m!955243))

(assert (=> d!124583 m!955243))

(assert (=> d!124583 m!955245))

(declare-fun m!955717 () Bool)

(assert (=> d!124583 m!955717))

(declare-fun m!955719 () Bool)

(assert (=> d!124583 m!955719))

(assert (=> b!1036178 m!955239))

(assert (=> b!1035931 d!124583))

(declare-fun d!124585 () Bool)

(declare-fun isEmpty!935 (Option!642) Bool)

(assert (=> d!124585 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30309 () Bool)

(assert (= bs!30309 d!124585))

(assert (=> bs!30309 m!955243))

(declare-fun m!955721 () Bool)

(assert (=> bs!30309 m!955721))

(assert (=> b!1035931 d!124585))

(declare-fun d!124587 () Bool)

(declare-fun c!104811 () Bool)

(assert (=> d!124587 (= c!104811 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (= (_1!7916 (h!23150 (toList!6932 lt!456682))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586013 () Option!642)

(assert (=> d!124587 (= (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000) e!586013)))

(declare-fun b!1036182 () Bool)

(declare-fun e!586014 () Option!642)

(assert (=> b!1036182 (= e!586014 None!640)))

(declare-fun b!1036179 () Bool)

(assert (=> b!1036179 (= e!586013 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456682)))))))

(declare-fun b!1036180 () Bool)

(assert (=> b!1036180 (= e!586013 e!586014)))

(declare-fun c!104812 () Bool)

(assert (=> b!1036180 (= c!104812 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456682))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036181 () Bool)

(assert (=> b!1036181 (= e!586014 (getValueByKey!591 (t!31148 (toList!6932 lt!456682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124587 c!104811) b!1036179))

(assert (= (and d!124587 (not c!104811)) b!1036180))

(assert (= (and b!1036180 c!104812) b!1036181))

(assert (= (and b!1036180 (not c!104812)) b!1036182))

(declare-fun m!955723 () Bool)

(assert (=> b!1036181 m!955723))

(assert (=> b!1035931 d!124587))

(assert (=> d!124445 d!124471))

(assert (=> d!124445 d!124457))

(declare-fun d!124589 () Bool)

(assert (=> d!124589 (contains!6001 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) lt!456654)))

(assert (=> d!124589 true))

(declare-fun _$35!442 () Unit!33774)

(assert (=> d!124589 (= (choose!1710 lt!456670 lt!456653 (zeroValue!6103 thiss!1427) lt!456654) _$35!442)))

(declare-fun bs!30310 () Bool)

(assert (= bs!30310 d!124589))

(assert (=> bs!30310 m!955105))

(assert (=> bs!30310 m!955105))

(assert (=> bs!30310 m!955107))

(assert (=> d!124445 d!124589))

(declare-fun d!124591 () Bool)

(declare-fun e!586015 () Bool)

(assert (=> d!124591 e!586015))

(declare-fun res!691700 () Bool)

(assert (=> d!124591 (=> res!691700 e!586015)))

(declare-fun lt!456906 () Bool)

(assert (=> d!124591 (= res!691700 (not lt!456906))))

(declare-fun lt!456905 () Bool)

(assert (=> d!124591 (= lt!456906 lt!456905)))

(declare-fun lt!456908 () Unit!33774)

(declare-fun e!586016 () Unit!33774)

(assert (=> d!124591 (= lt!456908 e!586016)))

(declare-fun c!104813 () Bool)

(assert (=> d!124591 (= c!104813 lt!456905)))

(assert (=> d!124591 (= lt!456905 (containsKey!564 (toList!6932 lt!456670) lt!456654))))

(assert (=> d!124591 (= (contains!6001 lt!456670 lt!456654) lt!456906)))

(declare-fun b!1036184 () Bool)

(declare-fun lt!456907 () Unit!33774)

(assert (=> b!1036184 (= e!586016 lt!456907)))

(assert (=> b!1036184 (= lt!456907 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456670) lt!456654))))

(assert (=> b!1036184 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456670) lt!456654))))

(declare-fun b!1036185 () Bool)

(declare-fun Unit!33790 () Unit!33774)

(assert (=> b!1036185 (= e!586016 Unit!33790)))

(declare-fun b!1036186 () Bool)

(assert (=> b!1036186 (= e!586015 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456670) lt!456654)))))

(assert (= (and d!124591 c!104813) b!1036184))

(assert (= (and d!124591 (not c!104813)) b!1036185))

(assert (= (and d!124591 (not res!691700)) b!1036186))

(declare-fun m!955725 () Bool)

(assert (=> d!124591 m!955725))

(declare-fun m!955727 () Bool)

(assert (=> b!1036184 m!955727))

(declare-fun m!955729 () Bool)

(assert (=> b!1036184 m!955729))

(assert (=> b!1036184 m!955729))

(declare-fun m!955731 () Bool)

(assert (=> b!1036184 m!955731))

(assert (=> b!1036186 m!955729))

(assert (=> b!1036186 m!955729))

(assert (=> b!1036186 m!955731))

(assert (=> d!124445 d!124591))

(assert (=> b!1036034 d!124487))

(declare-fun d!124593 () Bool)

(declare-fun e!586017 () Bool)

(assert (=> d!124593 e!586017))

(declare-fun res!691702 () Bool)

(assert (=> d!124593 (=> (not res!691702) (not e!586017))))

(declare-fun lt!456911 () ListLongMap!13833)

(assert (=> d!124593 (= res!691702 (contains!6001 lt!456911 (_1!7916 (tuple2!15811 lt!456815 lt!456821))))))

(declare-fun lt!456912 () List!21952)

(assert (=> d!124593 (= lt!456911 (ListLongMap!13834 lt!456912))))

(declare-fun lt!456910 () Unit!33774)

(declare-fun lt!456909 () Unit!33774)

(assert (=> d!124593 (= lt!456910 lt!456909)))

(assert (=> d!124593 (= (getValueByKey!591 lt!456912 (_1!7916 (tuple2!15811 lt!456815 lt!456821))) (Some!641 (_2!7916 (tuple2!15811 lt!456815 lt!456821))))))

(assert (=> d!124593 (= lt!456909 (lemmaContainsTupThenGetReturnValue!281 lt!456912 (_1!7916 (tuple2!15811 lt!456815 lt!456821)) (_2!7916 (tuple2!15811 lt!456815 lt!456821))))))

(assert (=> d!124593 (= lt!456912 (insertStrictlySorted!374 (toList!6932 lt!456818) (_1!7916 (tuple2!15811 lt!456815 lt!456821)) (_2!7916 (tuple2!15811 lt!456815 lt!456821))))))

(assert (=> d!124593 (= (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821)) lt!456911)))

(declare-fun b!1036187 () Bool)

(declare-fun res!691701 () Bool)

(assert (=> b!1036187 (=> (not res!691701) (not e!586017))))

(assert (=> b!1036187 (= res!691701 (= (getValueByKey!591 (toList!6932 lt!456911) (_1!7916 (tuple2!15811 lt!456815 lt!456821))) (Some!641 (_2!7916 (tuple2!15811 lt!456815 lt!456821)))))))

(declare-fun b!1036188 () Bool)

(assert (=> b!1036188 (= e!586017 (contains!6002 (toList!6932 lt!456911) (tuple2!15811 lt!456815 lt!456821)))))

(assert (= (and d!124593 res!691702) b!1036187))

(assert (= (and b!1036187 res!691701) b!1036188))

(declare-fun m!955733 () Bool)

(assert (=> d!124593 m!955733))

(declare-fun m!955735 () Bool)

(assert (=> d!124593 m!955735))

(declare-fun m!955737 () Bool)

(assert (=> d!124593 m!955737))

(declare-fun m!955739 () Bool)

(assert (=> d!124593 m!955739))

(declare-fun m!955741 () Bool)

(assert (=> b!1036187 m!955741))

(declare-fun m!955743 () Bool)

(assert (=> b!1036188 m!955743))

(assert (=> b!1036034 d!124593))

(declare-fun d!124595 () Bool)

(declare-fun e!586018 () Bool)

(assert (=> d!124595 e!586018))

(declare-fun res!691703 () Bool)

(assert (=> d!124595 (=> res!691703 e!586018)))

(declare-fun lt!456914 () Bool)

(assert (=> d!124595 (= res!691703 (not lt!456914))))

(declare-fun lt!456913 () Bool)

(assert (=> d!124595 (= lt!456914 lt!456913)))

(declare-fun lt!456916 () Unit!33774)

(declare-fun e!586019 () Unit!33774)

(assert (=> d!124595 (= lt!456916 e!586019)))

(declare-fun c!104814 () Bool)

(assert (=> d!124595 (= c!104814 lt!456913)))

(assert (=> d!124595 (= lt!456913 (containsKey!564 (toList!6932 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821))) lt!456817))))

(assert (=> d!124595 (= (contains!6001 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821)) lt!456817) lt!456914)))

(declare-fun b!1036189 () Bool)

(declare-fun lt!456915 () Unit!33774)

(assert (=> b!1036189 (= e!586019 lt!456915)))

(assert (=> b!1036189 (= lt!456915 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821))) lt!456817))))

(assert (=> b!1036189 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821))) lt!456817))))

(declare-fun b!1036190 () Bool)

(declare-fun Unit!33791 () Unit!33774)

(assert (=> b!1036190 (= e!586019 Unit!33791)))

(declare-fun b!1036191 () Bool)

(assert (=> b!1036191 (= e!586018 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821))) lt!456817)))))

(assert (= (and d!124595 c!104814) b!1036189))

(assert (= (and d!124595 (not c!104814)) b!1036190))

(assert (= (and d!124595 (not res!691703)) b!1036191))

(declare-fun m!955745 () Bool)

(assert (=> d!124595 m!955745))

(declare-fun m!955747 () Bool)

(assert (=> b!1036189 m!955747))

(declare-fun m!955749 () Bool)

(assert (=> b!1036189 m!955749))

(assert (=> b!1036189 m!955749))

(declare-fun m!955751 () Bool)

(assert (=> b!1036189 m!955751))

(assert (=> b!1036191 m!955749))

(assert (=> b!1036191 m!955749))

(assert (=> b!1036191 m!955751))

(assert (=> b!1036034 d!124595))

(declare-fun d!124597 () Bool)

(assert (=> d!124597 (not (contains!6001 (+!3131 lt!456818 (tuple2!15811 lt!456815 lt!456821)) lt!456817))))

(declare-fun lt!456919 () Unit!33774)

(declare-fun choose!1713 (ListLongMap!13833 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33774)

(assert (=> d!124597 (= lt!456919 (choose!1713 lt!456818 lt!456815 lt!456821 lt!456817))))

(declare-fun e!586022 () Bool)

(assert (=> d!124597 e!586022))

(declare-fun res!691706 () Bool)

(assert (=> d!124597 (=> (not res!691706) (not e!586022))))

(assert (=> d!124597 (= res!691706 (not (contains!6001 lt!456818 lt!456817)))))

(assert (=> d!124597 (= (addStillNotContains!244 lt!456818 lt!456815 lt!456821 lt!456817) lt!456919)))

(declare-fun b!1036195 () Bool)

(assert (=> b!1036195 (= e!586022 (not (= lt!456815 lt!456817)))))

(assert (= (and d!124597 res!691706) b!1036195))

(assert (=> d!124597 m!955497))

(assert (=> d!124597 m!955497))

(assert (=> d!124597 m!955499))

(declare-fun m!955753 () Bool)

(assert (=> d!124597 m!955753))

(declare-fun m!955755 () Bool)

(assert (=> d!124597 m!955755))

(assert (=> b!1036034 d!124597))

(declare-fun d!124599 () Bool)

(declare-fun e!586023 () Bool)

(assert (=> d!124599 e!586023))

(declare-fun res!691708 () Bool)

(assert (=> d!124599 (=> (not res!691708) (not e!586023))))

(declare-fun lt!456922 () ListLongMap!13833)

(assert (=> d!124599 (= res!691708 (contains!6001 lt!456922 (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!456923 () List!21952)

(assert (=> d!124599 (= lt!456922 (ListLongMap!13834 lt!456923))))

(declare-fun lt!456921 () Unit!33774)

(declare-fun lt!456920 () Unit!33774)

(assert (=> d!124599 (= lt!456921 lt!456920)))

(assert (=> d!124599 (= (getValueByKey!591 lt!456923 (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!641 (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124599 (= lt!456920 (lemmaContainsTupThenGetReturnValue!281 lt!456923 (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124599 (= lt!456923 (insertStrictlySorted!374 (toList!6932 call!43812) (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124599 (= (+!3131 call!43812 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!456922)))

(declare-fun b!1036196 () Bool)

(declare-fun res!691707 () Bool)

(assert (=> b!1036196 (=> (not res!691707) (not e!586023))))

(assert (=> b!1036196 (= res!691707 (= (getValueByKey!591 (toList!6932 lt!456922) (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!641 (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1036197 () Bool)

(assert (=> b!1036197 (= e!586023 (contains!6002 (toList!6932 lt!456922) (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124599 res!691708) b!1036196))

(assert (= (and b!1036196 res!691707) b!1036197))

(declare-fun m!955757 () Bool)

(assert (=> d!124599 m!955757))

(declare-fun m!955759 () Bool)

(assert (=> d!124599 m!955759))

(declare-fun m!955761 () Bool)

(assert (=> d!124599 m!955761))

(declare-fun m!955763 () Bool)

(assert (=> d!124599 m!955763))

(declare-fun m!955765 () Bool)

(assert (=> b!1036196 m!955765))

(declare-fun m!955767 () Bool)

(assert (=> b!1036197 m!955767))

(assert (=> b!1036034 d!124599))

(declare-fun d!124601 () Bool)

(assert (=> d!124601 (= (get!16460 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14927 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036007 d!124601))

(declare-fun d!124603 () Bool)

(assert (=> d!124603 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456924 () Unit!33774)

(assert (=> d!124603 (= lt!456924 (choose!1712 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586024 () Bool)

(assert (=> d!124603 e!586024))

(declare-fun res!691709 () Bool)

(assert (=> d!124603 (=> (not res!691709) (not e!586024))))

(assert (=> d!124603 (= res!691709 (isStrictlySorted!715 (toList!6932 lt!456682)))))

(assert (=> d!124603 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!456924)))

(declare-fun b!1036198 () Bool)

(assert (=> b!1036198 (= e!586024 (containsKey!564 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124603 res!691709) b!1036198))

(assert (=> d!124603 m!955067))

(assert (=> d!124603 m!955643))

(assert (=> d!124603 m!955643))

(assert (=> d!124603 m!955645))

(assert (=> d!124603 m!955067))

(declare-fun m!955769 () Bool)

(assert (=> d!124603 m!955769))

(assert (=> d!124603 m!955719))

(assert (=> b!1036198 m!955067))

(assert (=> b!1036198 m!955639))

(assert (=> b!1036110 d!124603))

(declare-fun d!124605 () Bool)

(assert (=> d!124605 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30311 () Bool)

(assert (= bs!30311 d!124605))

(assert (=> bs!30311 m!955643))

(declare-fun m!955771 () Bool)

(assert (=> bs!30311 m!955771))

(assert (=> b!1036110 d!124605))

(declare-fun d!124607 () Bool)

(declare-fun c!104815 () Bool)

(assert (=> d!124607 (= c!104815 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (= (_1!7916 (h!23150 (toList!6932 lt!456682))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun e!586025 () Option!642)

(assert (=> d!124607 (= (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) e!586025)))

(declare-fun b!1036202 () Bool)

(declare-fun e!586026 () Option!642)

(assert (=> b!1036202 (= e!586026 None!640)))

(declare-fun b!1036199 () Bool)

(assert (=> b!1036199 (= e!586025 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456682)))))))

(declare-fun b!1036200 () Bool)

(assert (=> b!1036200 (= e!586025 e!586026)))

(declare-fun c!104816 () Bool)

(assert (=> b!1036200 (= c!104816 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456682))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun b!1036201 () Bool)

(assert (=> b!1036201 (= e!586026 (getValueByKey!591 (t!31148 (toList!6932 lt!456682)) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124607 c!104815) b!1036199))

(assert (= (and d!124607 (not c!104815)) b!1036200))

(assert (= (and b!1036200 c!104816) b!1036201))

(assert (= (and b!1036200 (not c!104816)) b!1036202))

(assert (=> b!1036201 m!955067))

(declare-fun m!955773 () Bool)

(assert (=> b!1036201 m!955773))

(assert (=> b!1036110 d!124607))

(declare-fun d!124609 () Bool)

(declare-fun res!691714 () Bool)

(declare-fun e!586031 () Bool)

(assert (=> d!124609 (=> res!691714 e!586031)))

(assert (=> d!124609 (= res!691714 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (= (_1!7916 (h!23150 (toList!6932 lt!456682))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124609 (= (containsKey!564 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000) e!586031)))

(declare-fun b!1036207 () Bool)

(declare-fun e!586032 () Bool)

(assert (=> b!1036207 (= e!586031 e!586032)))

(declare-fun res!691715 () Bool)

(assert (=> b!1036207 (=> (not res!691715) (not e!586032))))

(assert (=> b!1036207 (= res!691715 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456682))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456682))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21948) (toList!6932 lt!456682)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456682))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036208 () Bool)

(assert (=> b!1036208 (= e!586032 (containsKey!564 (t!31148 (toList!6932 lt!456682)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124609 (not res!691714)) b!1036207))

(assert (= (and b!1036207 res!691715) b!1036208))

(declare-fun m!955775 () Bool)

(assert (=> b!1036208 m!955775))

(assert (=> d!124539 d!124609))

(declare-fun d!124611 () Bool)

(assert (=> d!124611 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456925 () Unit!33774)

(assert (=> d!124611 (= lt!456925 (choose!1712 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586033 () Bool)

(assert (=> d!124611 e!586033))

(declare-fun res!691716 () Bool)

(assert (=> d!124611 (=> (not res!691716) (not e!586033))))

(assert (=> d!124611 (= res!691716 (isStrictlySorted!715 (toList!6932 lt!456660)))))

(assert (=> d!124611 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456925)))

(declare-fun b!1036209 () Bool)

(assert (=> b!1036209 (= e!586033 (containsKey!564 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124611 res!691716) b!1036209))

(assert (=> d!124611 m!955539))

(assert (=> d!124611 m!955539))

(assert (=> d!124611 m!955541))

(declare-fun m!955777 () Bool)

(assert (=> d!124611 m!955777))

(declare-fun m!955779 () Bool)

(assert (=> d!124611 m!955779))

(assert (=> b!1036209 m!955535))

(assert (=> b!1036049 d!124611))

(declare-fun d!124613 () Bool)

(assert (=> d!124613 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30312 () Bool)

(assert (= bs!30312 d!124613))

(assert (=> bs!30312 m!955539))

(declare-fun m!955781 () Bool)

(assert (=> bs!30312 m!955781))

(assert (=> b!1036049 d!124613))

(declare-fun d!124615 () Bool)

(declare-fun c!104817 () Bool)

(assert (=> d!124615 (= c!104817 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (= (_1!7916 (h!23150 (toList!6932 lt!456660))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586034 () Option!642)

(assert (=> d!124615 (= (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000) e!586034)))

(declare-fun b!1036213 () Bool)

(declare-fun e!586035 () Option!642)

(assert (=> b!1036213 (= e!586035 None!640)))

(declare-fun b!1036210 () Bool)

(assert (=> b!1036210 (= e!586034 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456660)))))))

(declare-fun b!1036211 () Bool)

(assert (=> b!1036211 (= e!586034 e!586035)))

(declare-fun c!104818 () Bool)

(assert (=> b!1036211 (= c!104818 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456660))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036212 () Bool)

(assert (=> b!1036212 (= e!586035 (getValueByKey!591 (t!31148 (toList!6932 lt!456660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124615 c!104817) b!1036210))

(assert (= (and d!124615 (not c!104817)) b!1036211))

(assert (= (and b!1036211 c!104818) b!1036212))

(assert (= (and b!1036211 (not c!104818)) b!1036213))

(declare-fun m!955783 () Bool)

(assert (=> b!1036212 m!955783))

(assert (=> b!1036049 d!124615))

(declare-fun lt!456926 () Bool)

(declare-fun d!124617 () Bool)

(assert (=> d!124617 (= lt!456926 (select (content!514 (toList!6932 lt!456803)) (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))

(declare-fun e!586036 () Bool)

(assert (=> d!124617 (= lt!456926 e!586036)))

(declare-fun res!691717 () Bool)

(assert (=> d!124617 (=> (not res!691717) (not e!586036))))

(assert (=> d!124617 (= res!691717 ((_ is Cons!21948) (toList!6932 lt!456803)))))

(assert (=> d!124617 (= (contains!6002 (toList!6932 lt!456803) (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) lt!456926)))

(declare-fun b!1036214 () Bool)

(declare-fun e!586037 () Bool)

(assert (=> b!1036214 (= e!586036 e!586037)))

(declare-fun res!691718 () Bool)

(assert (=> b!1036214 (=> res!691718 e!586037)))

(assert (=> b!1036214 (= res!691718 (= (h!23150 (toList!6932 lt!456803)) (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1036215 () Bool)

(assert (=> b!1036215 (= e!586037 (contains!6002 (t!31148 (toList!6932 lt!456803)) (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124617 res!691717) b!1036214))

(assert (= (and b!1036214 (not res!691718)) b!1036215))

(declare-fun m!955785 () Bool)

(assert (=> d!124617 m!955785))

(declare-fun m!955787 () Bool)

(assert (=> d!124617 m!955787))

(declare-fun m!955789 () Bool)

(assert (=> b!1036215 m!955789))

(assert (=> b!1036023 d!124617))

(declare-fun d!124619 () Bool)

(declare-fun res!691719 () Bool)

(declare-fun e!586038 () Bool)

(assert (=> d!124619 (=> res!691719 e!586038)))

(assert (=> d!124619 (= res!691719 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (= (_1!7916 (h!23150 (toList!6932 lt!456660))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124619 (= (containsKey!564 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) e!586038)))

(declare-fun b!1036216 () Bool)

(declare-fun e!586039 () Bool)

(assert (=> b!1036216 (= e!586038 e!586039)))

(declare-fun res!691720 () Bool)

(assert (=> b!1036216 (=> (not res!691720) (not e!586039))))

(assert (=> b!1036216 (= res!691720 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456660))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456660))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21948) (toList!6932 lt!456660)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456660))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1036217 () Bool)

(assert (=> b!1036217 (= e!586039 (containsKey!564 (t!31148 (toList!6932 lt!456660)) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124619 (not res!691719)) b!1036216))

(assert (= (and b!1036216 res!691720) b!1036217))

(assert (=> b!1036217 m!955067))

(declare-fun m!955791 () Bool)

(assert (=> b!1036217 m!955791))

(assert (=> d!124479 d!124619))

(declare-fun d!124621 () Bool)

(assert (=> d!124621 (= (apply!900 lt!456843 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16459 (getValueByKey!591 (toList!6932 lt!456843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30313 () Bool)

(assert (= bs!30313 d!124621))

(declare-fun m!955793 () Bool)

(assert (=> bs!30313 m!955793))

(assert (=> bs!30313 m!955793))

(declare-fun m!955795 () Bool)

(assert (=> bs!30313 m!955795))

(assert (=> b!1036058 d!124621))

(declare-fun d!124623 () Bool)

(assert (=> d!124623 (= (size!31934 thiss!1427) (bvadd (_size!2946 thiss!1427) (bvsdiv (bvadd (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1035923 d!124623))

(declare-fun d!124625 () Bool)

(declare-fun e!586040 () Bool)

(assert (=> d!124625 e!586040))

(declare-fun res!691721 () Bool)

(assert (=> d!124625 (=> res!691721 e!586040)))

(declare-fun lt!456928 () Bool)

(assert (=> d!124625 (= res!691721 (not lt!456928))))

(declare-fun lt!456927 () Bool)

(assert (=> d!124625 (= lt!456928 lt!456927)))

(declare-fun lt!456930 () Unit!33774)

(declare-fun e!586041 () Unit!33774)

(assert (=> d!124625 (= lt!456930 e!586041)))

(declare-fun c!104819 () Bool)

(assert (=> d!124625 (= c!104819 lt!456927)))

(assert (=> d!124625 (= lt!456927 (containsKey!564 (toList!6932 lt!456869) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!124625 (= (contains!6001 lt!456869 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!456928)))

(declare-fun b!1036218 () Bool)

(declare-fun lt!456929 () Unit!33774)

(assert (=> b!1036218 (= e!586041 lt!456929)))

(assert (=> b!1036218 (= lt!456929 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456869) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> b!1036218 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456869) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036219 () Bool)

(declare-fun Unit!33792 () Unit!33774)

(assert (=> b!1036219 (= e!586041 Unit!33792)))

(declare-fun b!1036220 () Bool)

(assert (=> b!1036220 (= e!586040 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456869) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124625 c!104819) b!1036218))

(assert (= (and d!124625 (not c!104819)) b!1036219))

(assert (= (and d!124625 (not res!691721)) b!1036220))

(declare-fun m!955797 () Bool)

(assert (=> d!124625 m!955797))

(declare-fun m!955799 () Bool)

(assert (=> b!1036218 m!955799))

(assert (=> b!1036218 m!955629))

(assert (=> b!1036218 m!955629))

(declare-fun m!955801 () Bool)

(assert (=> b!1036218 m!955801))

(assert (=> b!1036220 m!955629))

(assert (=> b!1036220 m!955629))

(assert (=> b!1036220 m!955801))

(assert (=> d!124545 d!124625))

(declare-fun d!124627 () Bool)

(declare-fun c!104820 () Bool)

(assert (=> d!124627 (= c!104820 (and ((_ is Cons!21948) lt!456870) (= (_1!7916 (h!23150 lt!456870)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun e!586042 () Option!642)

(assert (=> d!124627 (= (getValueByKey!591 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) e!586042)))

(declare-fun b!1036224 () Bool)

(declare-fun e!586043 () Option!642)

(assert (=> b!1036224 (= e!586043 None!640)))

(declare-fun b!1036221 () Bool)

(assert (=> b!1036221 (= e!586042 (Some!641 (_2!7916 (h!23150 lt!456870))))))

(declare-fun b!1036222 () Bool)

(assert (=> b!1036222 (= e!586042 e!586043)))

(declare-fun c!104821 () Bool)

(assert (=> b!1036222 (= c!104821 (and ((_ is Cons!21948) lt!456870) (not (= (_1!7916 (h!23150 lt!456870)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036223 () Bool)

(assert (=> b!1036223 (= e!586043 (getValueByKey!591 (t!31148 lt!456870) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124627 c!104820) b!1036221))

(assert (= (and d!124627 (not c!104820)) b!1036222))

(assert (= (and b!1036222 c!104821) b!1036223))

(assert (= (and b!1036222 (not c!104821)) b!1036224))

(declare-fun m!955803 () Bool)

(assert (=> b!1036223 m!955803))

(assert (=> d!124545 d!124627))

(declare-fun d!124629 () Bool)

(assert (=> d!124629 (= (getValueByKey!591 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun lt!456933 () Unit!33774)

(declare-fun choose!1714 (List!21952 (_ BitVec 64) V!37667) Unit!33774)

(assert (=> d!124629 (= lt!456933 (choose!1714 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun e!586046 () Bool)

(assert (=> d!124629 e!586046))

(declare-fun res!691726 () Bool)

(assert (=> d!124629 (=> (not res!691726) (not e!586046))))

(assert (=> d!124629 (= res!691726 (isStrictlySorted!715 lt!456870))))

(assert (=> d!124629 (= (lemmaContainsTupThenGetReturnValue!281 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!456933)))

(declare-fun b!1036229 () Bool)

(declare-fun res!691727 () Bool)

(assert (=> b!1036229 (=> (not res!691727) (not e!586046))))

(assert (=> b!1036229 (= res!691727 (containsKey!564 lt!456870 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036230 () Bool)

(assert (=> b!1036230 (= e!586046 (contains!6002 lt!456870 (tuple2!15811 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124629 res!691726) b!1036229))

(assert (= (and b!1036229 res!691727) b!1036230))

(assert (=> d!124629 m!955623))

(declare-fun m!955805 () Bool)

(assert (=> d!124629 m!955805))

(declare-fun m!955807 () Bool)

(assert (=> d!124629 m!955807))

(declare-fun m!955809 () Bool)

(assert (=> b!1036229 m!955809))

(declare-fun m!955811 () Bool)

(assert (=> b!1036230 m!955811))

(assert (=> d!124545 d!124629))

(declare-fun b!1036251 () Bool)

(declare-fun e!586059 () List!21952)

(declare-fun call!43835 () List!21952)

(assert (=> b!1036251 (= e!586059 call!43835)))

(declare-fun b!1036252 () Bool)

(declare-fun e!586058 () List!21952)

(declare-fun call!43836 () List!21952)

(assert (=> b!1036252 (= e!586058 call!43836)))

(declare-fun b!1036253 () Bool)

(declare-fun res!691732 () Bool)

(declare-fun e!586060 () Bool)

(assert (=> b!1036253 (=> (not res!691732) (not e!586060))))

(declare-fun lt!456936 () List!21952)

(assert (=> b!1036253 (= res!691732 (containsKey!564 lt!456936 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036254 () Bool)

(assert (=> b!1036254 (= e!586059 e!586058)))

(declare-fun c!104831 () Bool)

(assert (=> b!1036254 (= c!104831 (and ((_ is Cons!21948) (toList!6932 call!43799)) (= (_1!7916 (h!23150 (toList!6932 call!43799))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43832 () Bool)

(assert (=> bm!43832 (= call!43836 call!43835)))

(declare-fun b!1036255 () Bool)

(declare-fun e!586057 () List!21952)

(declare-fun call!43837 () List!21952)

(assert (=> b!1036255 (= e!586057 call!43837)))

(declare-fun b!1036256 () Bool)

(declare-fun c!104833 () Bool)

(declare-fun e!586061 () List!21952)

(assert (=> b!1036256 (= e!586061 (ite c!104831 (t!31148 (toList!6932 call!43799)) (ite c!104833 (Cons!21948 (h!23150 (toList!6932 call!43799)) (t!31148 (toList!6932 call!43799))) Nil!21949)))))

(declare-fun b!1036257 () Bool)

(assert (=> b!1036257 (= e!586057 call!43837)))

(declare-fun bm!43833 () Bool)

(declare-fun c!104830 () Bool)

(assert (=> bm!43833 (= call!43835 ($colon$colon!605 e!586061 (ite c!104830 (h!23150 (toList!6932 call!43799)) (tuple2!15811 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun c!104832 () Bool)

(assert (=> bm!43833 (= c!104832 c!104830)))

(declare-fun bm!43834 () Bool)

(assert (=> bm!43834 (= call!43837 call!43836)))

(declare-fun b!1036258 () Bool)

(assert (=> b!1036258 (= e!586061 (insertStrictlySorted!374 (t!31148 (toList!6932 call!43799)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036259 () Bool)

(assert (=> b!1036259 (= e!586060 (contains!6002 lt!456936 (tuple2!15811 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun d!124631 () Bool)

(assert (=> d!124631 e!586060))

(declare-fun res!691733 () Bool)

(assert (=> d!124631 (=> (not res!691733) (not e!586060))))

(assert (=> d!124631 (= res!691733 (isStrictlySorted!715 lt!456936))))

(assert (=> d!124631 (= lt!456936 e!586059)))

(assert (=> d!124631 (= c!104830 (and ((_ is Cons!21948) (toList!6932 call!43799)) (bvslt (_1!7916 (h!23150 (toList!6932 call!43799))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!124631 (isStrictlySorted!715 (toList!6932 call!43799))))

(assert (=> d!124631 (= (insertStrictlySorted!374 (toList!6932 call!43799) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!456936)))

(declare-fun b!1036260 () Bool)

(assert (=> b!1036260 (= c!104833 (and ((_ is Cons!21948) (toList!6932 call!43799)) (bvsgt (_1!7916 (h!23150 (toList!6932 call!43799))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> b!1036260 (= e!586058 e!586057)))

(assert (= (and d!124631 c!104830) b!1036251))

(assert (= (and d!124631 (not c!104830)) b!1036254))

(assert (= (and b!1036254 c!104831) b!1036252))

(assert (= (and b!1036254 (not c!104831)) b!1036260))

(assert (= (and b!1036260 c!104833) b!1036255))

(assert (= (and b!1036260 (not c!104833)) b!1036257))

(assert (= (or b!1036255 b!1036257) bm!43834))

(assert (= (or b!1036252 bm!43834) bm!43832))

(assert (= (or b!1036251 bm!43832) bm!43833))

(assert (= (and bm!43833 c!104832) b!1036258))

(assert (= (and bm!43833 (not c!104832)) b!1036256))

(assert (= (and d!124631 res!691733) b!1036253))

(assert (= (and b!1036253 res!691732) b!1036259))

(declare-fun m!955813 () Bool)

(assert (=> b!1036259 m!955813))

(declare-fun m!955815 () Bool)

(assert (=> b!1036253 m!955815))

(declare-fun m!955817 () Bool)

(assert (=> b!1036258 m!955817))

(declare-fun m!955819 () Bool)

(assert (=> bm!43833 m!955819))

(declare-fun m!955821 () Bool)

(assert (=> d!124631 m!955821))

(declare-fun m!955823 () Bool)

(assert (=> d!124631 m!955823))

(assert (=> d!124545 d!124631))

(declare-fun d!124633 () Bool)

(assert (=> d!124633 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456937 () Unit!33774)

(assert (=> d!124633 (= lt!456937 (choose!1712 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586062 () Bool)

(assert (=> d!124633 e!586062))

(declare-fun res!691734 () Bool)

(assert (=> d!124633 (=> (not res!691734) (not e!586062))))

(assert (=> d!124633 (= res!691734 (isStrictlySorted!715 (toList!6932 lt!456660)))))

(assert (=> d!124633 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!456937)))

(declare-fun b!1036261 () Bool)

(assert (=> b!1036261 (= e!586062 (containsKey!564 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124633 res!691734) b!1036261))

(assert (=> d!124633 m!955067))

(assert (=> d!124633 m!955369))

(assert (=> d!124633 m!955369))

(assert (=> d!124633 m!955371))

(assert (=> d!124633 m!955067))

(declare-fun m!955825 () Bool)

(assert (=> d!124633 m!955825))

(assert (=> d!124633 m!955779))

(assert (=> b!1036261 m!955067))

(assert (=> b!1036261 m!955365))

(assert (=> b!1035988 d!124633))

(declare-fun d!124635 () Bool)

(assert (=> d!124635 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30314 () Bool)

(assert (= bs!30314 d!124635))

(assert (=> bs!30314 m!955369))

(declare-fun m!955827 () Bool)

(assert (=> bs!30314 m!955827))

(assert (=> b!1035988 d!124635))

(declare-fun d!124637 () Bool)

(declare-fun c!104834 () Bool)

(assert (=> d!124637 (= c!104834 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (= (_1!7916 (h!23150 (toList!6932 lt!456660))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun e!586063 () Option!642)

(assert (=> d!124637 (= (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) e!586063)))

(declare-fun b!1036265 () Bool)

(declare-fun e!586064 () Option!642)

(assert (=> b!1036265 (= e!586064 None!640)))

(declare-fun b!1036262 () Bool)

(assert (=> b!1036262 (= e!586063 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456660)))))))

(declare-fun b!1036263 () Bool)

(assert (=> b!1036263 (= e!586063 e!586064)))

(declare-fun c!104835 () Bool)

(assert (=> b!1036263 (= c!104835 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456660))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun b!1036264 () Bool)

(assert (=> b!1036264 (= e!586064 (getValueByKey!591 (t!31148 (toList!6932 lt!456660)) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124637 c!104834) b!1036262))

(assert (= (and d!124637 (not c!104834)) b!1036263))

(assert (= (and b!1036263 c!104835) b!1036264))

(assert (= (and b!1036263 (not c!104835)) b!1036265))

(assert (=> b!1036264 m!955067))

(declare-fun m!955829 () Bool)

(assert (=> b!1036264 m!955829))

(assert (=> b!1035988 d!124637))

(declare-fun d!124639 () Bool)

(assert (=> d!124639 (= (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1036108 d!124639))

(declare-fun d!124641 () Bool)

(assert (=> d!124641 (= (apply!900 lt!456843 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16459 (getValueByKey!591 (toList!6932 lt!456843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30315 () Bool)

(assert (= bs!30315 d!124641))

(declare-fun m!955831 () Bool)

(assert (=> bs!30315 m!955831))

(assert (=> bs!30315 m!955831))

(declare-fun m!955833 () Bool)

(assert (=> bs!30315 m!955833))

(assert (=> b!1036065 d!124641))

(declare-fun d!124643 () Bool)

(declare-fun isEmpty!936 (List!21952) Bool)

(assert (=> d!124643 (= (isEmpty!934 lt!456819) (isEmpty!936 (toList!6932 lt!456819)))))

(declare-fun bs!30316 () Bool)

(assert (= bs!30316 d!124643))

(declare-fun m!955835 () Bool)

(assert (=> bs!30316 m!955835))

(assert (=> b!1036039 d!124643))

(assert (=> b!1036089 d!124477))

(declare-fun d!124645 () Bool)

(assert (=> d!124645 (= (size!31934 lt!456581) (bvadd (_size!2946 lt!456581) (bvsdiv (bvadd (extraKeys!5999 lt!456581) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1036047 d!124645))

(declare-fun d!124647 () Bool)

(assert (=> d!124647 (= (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!456687)) (v!14930 (getValueByKey!591 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!456687)))))

(assert (=> d!124501 d!124647))

(declare-fun d!124649 () Bool)

(declare-fun c!104836 () Bool)

(assert (=> d!124649 (= c!104836 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))) lt!456687)))))

(declare-fun e!586065 () Option!642)

(assert (=> d!124649 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!456687) e!586065)))

(declare-fun b!1036269 () Bool)

(declare-fun e!586066 () Option!642)

(assert (=> b!1036269 (= e!586066 None!640)))

(declare-fun b!1036266 () Bool)

(assert (=> b!1036266 (= e!586065 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))))

(declare-fun b!1036267 () Bool)

(assert (=> b!1036267 (= e!586065 e!586066)))

(declare-fun c!104837 () Bool)

(assert (=> b!1036267 (= c!104837 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))) lt!456687))))))

(declare-fun b!1036268 () Bool)

(assert (=> b!1036268 (= e!586066 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))) lt!456687))))

(assert (= (and d!124649 c!104836) b!1036266))

(assert (= (and d!124649 (not c!104836)) b!1036267))

(assert (= (and b!1036267 c!104837) b!1036268))

(assert (= (and b!1036267 (not c!104837)) b!1036269))

(declare-fun m!955837 () Bool)

(assert (=> b!1036268 m!955837))

(assert (=> d!124501 d!124649))

(declare-fun d!124651 () Bool)

(declare-fun res!691735 () Bool)

(declare-fun e!586067 () Bool)

(assert (=> d!124651 (=> res!691735 e!586067)))

(assert (=> d!124651 (= res!691735 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))) lt!456676)))))

(assert (=> d!124651 (= (containsKey!564 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676) e!586067)))

(declare-fun b!1036270 () Bool)

(declare-fun e!586068 () Bool)

(assert (=> b!1036270 (= e!586067 e!586068)))

(declare-fun res!691736 () Bool)

(assert (=> b!1036270 (=> (not res!691736) (not e!586068))))

(assert (=> b!1036270 (= res!691736 (and (or (not ((_ is Cons!21948) (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))) (bvsle (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))) lt!456676)) ((_ is Cons!21948) (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))) (bvslt (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))) lt!456676)))))

(declare-fun b!1036271 () Bool)

(assert (=> b!1036271 (= e!586068 (containsKey!564 (t!31148 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))) lt!456676))))

(assert (= (and d!124651 (not res!691735)) b!1036270))

(assert (= (and b!1036270 res!691736) b!1036271))

(declare-fun m!955839 () Bool)

(assert (=> b!1036271 m!955839))

(assert (=> d!124499 d!124651))

(declare-fun d!124653 () Bool)

(assert (=> d!124653 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))) (v!14930 (getValueByKey!591 (toList!6932 lt!456660) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124485 d!124653))

(assert (=> d!124485 d!124637))

(declare-fun d!124655 () Bool)

(declare-fun e!586069 () Bool)

(assert (=> d!124655 e!586069))

(declare-fun res!691737 () Bool)

(assert (=> d!124655 (=> res!691737 e!586069)))

(declare-fun lt!456939 () Bool)

(assert (=> d!124655 (= res!691737 (not lt!456939))))

(declare-fun lt!456938 () Bool)

(assert (=> d!124655 (= lt!456939 lt!456938)))

(declare-fun lt!456941 () Unit!33774)

(declare-fun e!586070 () Unit!33774)

(assert (=> d!124655 (= lt!456941 e!586070)))

(declare-fun c!104838 () Bool)

(assert (=> d!124655 (= c!104838 lt!456938)))

(assert (=> d!124655 (= lt!456938 (containsKey!564 (toList!6932 lt!456726) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (=> d!124655 (= (contains!6001 lt!456726 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) lt!456939)))

(declare-fun b!1036272 () Bool)

(declare-fun lt!456940 () Unit!33774)

(assert (=> b!1036272 (= e!586070 lt!456940)))

(assert (=> b!1036272 (= lt!456940 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456726) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (=> b!1036272 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456726) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun b!1036273 () Bool)

(declare-fun Unit!33793 () Unit!33774)

(assert (=> b!1036273 (= e!586070 Unit!33793)))

(declare-fun b!1036274 () Bool)

(assert (=> b!1036274 (= e!586069 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456726) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (= (and d!124655 c!104838) b!1036272))

(assert (= (and d!124655 (not c!104838)) b!1036273))

(assert (= (and d!124655 (not res!691737)) b!1036274))

(declare-fun m!955841 () Bool)

(assert (=> d!124655 m!955841))

(declare-fun m!955843 () Bool)

(assert (=> b!1036272 m!955843))

(assert (=> b!1036272 m!955235))

(assert (=> b!1036272 m!955235))

(declare-fun m!955845 () Bool)

(assert (=> b!1036272 m!955845))

(assert (=> b!1036274 m!955235))

(assert (=> b!1036274 m!955235))

(assert (=> b!1036274 m!955845))

(assert (=> d!124439 d!124655))

(declare-fun d!124657 () Bool)

(declare-fun c!104839 () Bool)

(assert (=> d!124657 (= c!104839 (and ((_ is Cons!21948) lt!456727) (= (_1!7916 (h!23150 lt!456727)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun e!586071 () Option!642)

(assert (=> d!124657 (= (getValueByKey!591 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) e!586071)))

(declare-fun b!1036278 () Bool)

(declare-fun e!586072 () Option!642)

(assert (=> b!1036278 (= e!586072 None!640)))

(declare-fun b!1036275 () Bool)

(assert (=> b!1036275 (= e!586071 (Some!641 (_2!7916 (h!23150 lt!456727))))))

(declare-fun b!1036276 () Bool)

(assert (=> b!1036276 (= e!586071 e!586072)))

(declare-fun c!104840 () Bool)

(assert (=> b!1036276 (= c!104840 (and ((_ is Cons!21948) lt!456727) (not (= (_1!7916 (h!23150 lt!456727)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun b!1036277 () Bool)

(assert (=> b!1036277 (= e!586072 (getValueByKey!591 (t!31148 lt!456727) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (= (and d!124657 c!104839) b!1036275))

(assert (= (and d!124657 (not c!104839)) b!1036276))

(assert (= (and b!1036276 c!104840) b!1036277))

(assert (= (and b!1036276 (not c!104840)) b!1036278))

(declare-fun m!955847 () Bool)

(assert (=> b!1036277 m!955847))

(assert (=> d!124439 d!124657))

(declare-fun d!124659 () Bool)

(assert (=> d!124659 (= (getValueByKey!591 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun lt!456942 () Unit!33774)

(assert (=> d!124659 (= lt!456942 (choose!1714 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun e!586073 () Bool)

(assert (=> d!124659 e!586073))

(declare-fun res!691738 () Bool)

(assert (=> d!124659 (=> (not res!691738) (not e!586073))))

(assert (=> d!124659 (= res!691738 (isStrictlySorted!715 lt!456727))))

(assert (=> d!124659 (= (lemmaContainsTupThenGetReturnValue!281 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) lt!456942)))

(declare-fun b!1036279 () Bool)

(declare-fun res!691739 () Bool)

(assert (=> b!1036279 (=> (not res!691739) (not e!586073))))

(assert (=> b!1036279 (= res!691739 (containsKey!564 lt!456727 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun b!1036280 () Bool)

(assert (=> b!1036280 (= e!586073 (contains!6002 lt!456727 (tuple2!15811 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (= (and d!124659 res!691738) b!1036279))

(assert (= (and b!1036279 res!691739) b!1036280))

(assert (=> d!124659 m!955229))

(declare-fun m!955849 () Bool)

(assert (=> d!124659 m!955849))

(declare-fun m!955851 () Bool)

(assert (=> d!124659 m!955851))

(declare-fun m!955853 () Bool)

(assert (=> b!1036279 m!955853))

(declare-fun m!955855 () Bool)

(assert (=> b!1036280 m!955855))

(assert (=> d!124439 d!124659))

(declare-fun b!1036281 () Bool)

(declare-fun e!586076 () List!21952)

(declare-fun call!43838 () List!21952)

(assert (=> b!1036281 (= e!586076 call!43838)))

(declare-fun b!1036282 () Bool)

(declare-fun e!586075 () List!21952)

(declare-fun call!43839 () List!21952)

(assert (=> b!1036282 (= e!586075 call!43839)))

(declare-fun b!1036283 () Bool)

(declare-fun res!691740 () Bool)

(declare-fun e!586077 () Bool)

(assert (=> b!1036283 (=> (not res!691740) (not e!586077))))

(declare-fun lt!456943 () List!21952)

(assert (=> b!1036283 (= res!691740 (containsKey!564 lt!456943 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun b!1036284 () Bool)

(assert (=> b!1036284 (= e!586076 e!586075)))

(declare-fun c!104842 () Bool)

(assert (=> b!1036284 (= c!104842 (and ((_ is Cons!21948) (toList!6932 call!43792)) (= (_1!7916 (h!23150 (toList!6932 call!43792))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun bm!43835 () Bool)

(assert (=> bm!43835 (= call!43839 call!43838)))

(declare-fun b!1036285 () Bool)

(declare-fun e!586074 () List!21952)

(declare-fun call!43840 () List!21952)

(assert (=> b!1036285 (= e!586074 call!43840)))

(declare-fun e!586078 () List!21952)

(declare-fun b!1036286 () Bool)

(declare-fun c!104844 () Bool)

(assert (=> b!1036286 (= e!586078 (ite c!104842 (t!31148 (toList!6932 call!43792)) (ite c!104844 (Cons!21948 (h!23150 (toList!6932 call!43792)) (t!31148 (toList!6932 call!43792))) Nil!21949)))))

(declare-fun b!1036287 () Bool)

(assert (=> b!1036287 (= e!586074 call!43840)))

(declare-fun bm!43836 () Bool)

(declare-fun c!104841 () Bool)

(assert (=> bm!43836 (= call!43838 ($colon$colon!605 e!586078 (ite c!104841 (h!23150 (toList!6932 call!43792)) (tuple2!15811 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun c!104843 () Bool)

(assert (=> bm!43836 (= c!104843 c!104841)))

(declare-fun bm!43837 () Bool)

(assert (=> bm!43837 (= call!43840 call!43839)))

(declare-fun b!1036288 () Bool)

(assert (=> b!1036288 (= e!586078 (insertStrictlySorted!374 (t!31148 (toList!6932 call!43792)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun b!1036289 () Bool)

(assert (=> b!1036289 (= e!586077 (contains!6002 lt!456943 (tuple2!15811 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun d!124661 () Bool)

(assert (=> d!124661 e!586077))

(declare-fun res!691741 () Bool)

(assert (=> d!124661 (=> (not res!691741) (not e!586077))))

(assert (=> d!124661 (= res!691741 (isStrictlySorted!715 lt!456943))))

(assert (=> d!124661 (= lt!456943 e!586076)))

(assert (=> d!124661 (= c!104841 (and ((_ is Cons!21948) (toList!6932 call!43792)) (bvslt (_1!7916 (h!23150 (toList!6932 call!43792))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> d!124661 (isStrictlySorted!715 (toList!6932 call!43792))))

(assert (=> d!124661 (= (insertStrictlySorted!374 (toList!6932 call!43792) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) lt!456943)))

(declare-fun b!1036290 () Bool)

(assert (=> b!1036290 (= c!104844 (and ((_ is Cons!21948) (toList!6932 call!43792)) (bvsgt (_1!7916 (h!23150 (toList!6932 call!43792))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> b!1036290 (= e!586075 e!586074)))

(assert (= (and d!124661 c!104841) b!1036281))

(assert (= (and d!124661 (not c!104841)) b!1036284))

(assert (= (and b!1036284 c!104842) b!1036282))

(assert (= (and b!1036284 (not c!104842)) b!1036290))

(assert (= (and b!1036290 c!104844) b!1036285))

(assert (= (and b!1036290 (not c!104844)) b!1036287))

(assert (= (or b!1036285 b!1036287) bm!43837))

(assert (= (or b!1036282 bm!43837) bm!43835))

(assert (= (or b!1036281 bm!43835) bm!43836))

(assert (= (and bm!43836 c!104843) b!1036288))

(assert (= (and bm!43836 (not c!104843)) b!1036286))

(assert (= (and d!124661 res!691741) b!1036283))

(assert (= (and b!1036283 res!691740) b!1036289))

(declare-fun m!955857 () Bool)

(assert (=> b!1036289 m!955857))

(declare-fun m!955859 () Bool)

(assert (=> b!1036283 m!955859))

(declare-fun m!955861 () Bool)

(assert (=> b!1036288 m!955861))

(declare-fun m!955863 () Bool)

(assert (=> bm!43836 m!955863))

(declare-fun m!955865 () Bool)

(assert (=> d!124661 m!955865))

(declare-fun m!955867 () Bool)

(assert (=> d!124661 m!955867))

(assert (=> d!124439 d!124661))

(assert (=> b!1036105 d!124639))

(declare-fun d!124663 () Bool)

(assert (=> d!124663 (= (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582))) lt!456658)) (v!14930 (getValueByKey!591 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582))) lt!456658)))))

(assert (=> d!124451 d!124663))

(declare-fun c!104845 () Bool)

(declare-fun d!124665 () Bool)

(assert (=> d!124665 (= c!104845 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582))))) lt!456658)))))

(declare-fun e!586079 () Option!642)

(assert (=> d!124665 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582))) lt!456658) e!586079)))

(declare-fun b!1036294 () Bool)

(declare-fun e!586080 () Option!642)

(assert (=> b!1036294 (= e!586080 None!640)))

(declare-fun b!1036291 () Bool)

(assert (=> b!1036291 (= e!586079 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)))))))))

(declare-fun b!1036292 () Bool)

(assert (=> b!1036292 (= e!586079 e!586080)))

(declare-fun c!104846 () Bool)

(assert (=> b!1036292 (= c!104846 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582))))) lt!456658))))))

(declare-fun b!1036293 () Bool)

(assert (=> b!1036293 (= e!586080 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)))) lt!456658))))

(assert (= (and d!124665 c!104845) b!1036291))

(assert (= (and d!124665 (not c!104845)) b!1036292))

(assert (= (and b!1036292 c!104846) b!1036293))

(assert (= (and b!1036292 (not c!104846)) b!1036294))

(declare-fun m!955869 () Bool)

(assert (=> b!1036293 m!955869))

(assert (=> d!124451 d!124665))

(declare-fun d!124667 () Bool)

(declare-fun res!691742 () Bool)

(declare-fun e!586081 () Bool)

(assert (=> d!124667 (=> res!691742 e!586081)))

(assert (=> d!124667 (= res!691742 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (= (_1!7916 (h!23150 (toList!6932 lt!456660))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124667 (= (containsKey!564 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000) e!586081)))

(declare-fun b!1036295 () Bool)

(declare-fun e!586082 () Bool)

(assert (=> b!1036295 (= e!586081 e!586082)))

(declare-fun res!691743 () Bool)

(assert (=> b!1036295 (=> (not res!691743) (not e!586082))))

(assert (=> b!1036295 (= res!691743 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456660))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456660))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21948) (toList!6932 lt!456660)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456660))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036296 () Bool)

(assert (=> b!1036296 (= e!586082 (containsKey!564 (t!31148 (toList!6932 lt!456660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124667 (not res!691742)) b!1036295))

(assert (= (and b!1036295 res!691743) b!1036296))

(declare-fun m!955871 () Bool)

(assert (=> b!1036296 m!955871))

(assert (=> d!124435 d!124667))

(assert (=> d!124437 d!124483))

(declare-fun d!124669 () Bool)

(declare-fun e!586083 () Bool)

(assert (=> d!124669 e!586083))

(declare-fun res!691744 () Bool)

(assert (=> d!124669 (=> res!691744 e!586083)))

(declare-fun lt!456945 () Bool)

(assert (=> d!124669 (= res!691744 (not lt!456945))))

(declare-fun lt!456944 () Bool)

(assert (=> d!124669 (= lt!456945 lt!456944)))

(declare-fun lt!456947 () Unit!33774)

(declare-fun e!586084 () Unit!33774)

(assert (=> d!124669 (= lt!456947 e!586084)))

(declare-fun c!104847 () Bool)

(assert (=> d!124669 (= c!104847 lt!456944)))

(assert (=> d!124669 (= lt!456944 (containsKey!564 (toList!6932 lt!456843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124669 (= (contains!6001 lt!456843 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456945)))

(declare-fun b!1036297 () Bool)

(declare-fun lt!456946 () Unit!33774)

(assert (=> b!1036297 (= e!586084 lt!456946)))

(assert (=> b!1036297 (= lt!456946 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036297 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456843) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036298 () Bool)

(declare-fun Unit!33794 () Unit!33774)

(assert (=> b!1036298 (= e!586084 Unit!33794)))

(declare-fun b!1036299 () Bool)

(assert (=> b!1036299 (= e!586083 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124669 c!104847) b!1036297))

(assert (= (and d!124669 (not c!104847)) b!1036298))

(assert (= (and d!124669 (not res!691744)) b!1036299))

(declare-fun m!955873 () Bool)

(assert (=> d!124669 m!955873))

(declare-fun m!955875 () Bool)

(assert (=> b!1036297 m!955875))

(assert (=> b!1036297 m!955831))

(assert (=> b!1036297 m!955831))

(declare-fun m!955877 () Bool)

(assert (=> b!1036297 m!955877))

(assert (=> b!1036299 m!955831))

(assert (=> b!1036299 m!955831))

(assert (=> b!1036299 m!955877))

(assert (=> bm!43816 d!124669))

(declare-fun b!1036300 () Bool)

(declare-fun e!586085 () (_ BitVec 32))

(assert (=> b!1036300 (= e!586085 #b00000000000000000000000000000000)))

(declare-fun d!124671 () Bool)

(declare-fun lt!456948 () (_ BitVec 32))

(assert (=> d!124671 (and (bvsge lt!456948 #b00000000000000000000000000000000) (bvsle lt!456948 (bvsub (size!31928 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124671 (= lt!456948 e!586085)))

(declare-fun c!104848 () Bool)

(assert (=> d!124671 (= c!104848 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124671 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31928 (_keys!11454 lt!456581)) (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124671 (= (arrayCountValidKeys!0 (_keys!11454 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))) lt!456948)))

(declare-fun b!1036301 () Bool)

(declare-fun e!586086 () (_ BitVec 32))

(assert (=> b!1036301 (= e!586085 e!586086)))

(declare-fun c!104849 () Bool)

(assert (=> b!1036301 (= c!104849 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43838 () Bool)

(declare-fun call!43841 () (_ BitVec 32))

(assert (=> bm!43838 (= call!43841 (arrayCountValidKeys!0 (_keys!11454 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))))))

(declare-fun b!1036302 () Bool)

(assert (=> b!1036302 (= e!586086 (bvadd #b00000000000000000000000000000001 call!43841))))

(declare-fun b!1036303 () Bool)

(assert (=> b!1036303 (= e!586086 call!43841)))

(assert (= (and d!124671 c!104848) b!1036300))

(assert (= (and d!124671 (not c!104848)) b!1036301))

(assert (= (and b!1036301 c!104849) b!1036302))

(assert (= (and b!1036301 (not c!104849)) b!1036303))

(assert (= (or b!1036302 b!1036303) bm!43838))

(declare-fun m!955879 () Bool)

(assert (=> b!1036301 m!955879))

(assert (=> b!1036301 m!955879))

(declare-fun m!955881 () Bool)

(assert (=> b!1036301 m!955881))

(declare-fun m!955883 () Bool)

(assert (=> bm!43838 m!955883))

(assert (=> bm!43825 d!124671))

(declare-fun d!124673 () Bool)

(assert (=> d!124673 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456949 () Unit!33774)

(assert (=> d!124673 (= lt!456949 (choose!1712 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586087 () Bool)

(assert (=> d!124673 e!586087))

(declare-fun res!691745 () Bool)

(assert (=> d!124673 (=> (not res!691745) (not e!586087))))

(assert (=> d!124673 (= res!691745 (isStrictlySorted!715 (toList!6932 lt!456682)))))

(assert (=> d!124673 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456949)))

(declare-fun b!1036304 () Bool)

(assert (=> b!1036304 (= e!586087 (containsKey!564 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124673 res!691745) b!1036304))

(assert (=> d!124673 m!955381))

(assert (=> d!124673 m!955381))

(assert (=> d!124673 m!955607))

(declare-fun m!955885 () Bool)

(assert (=> d!124673 m!955885))

(assert (=> d!124673 m!955719))

(assert (=> b!1036304 m!955603))

(assert (=> b!1036073 d!124673))

(declare-fun d!124675 () Bool)

(assert (=> d!124675 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30317 () Bool)

(assert (= bs!30317 d!124675))

(assert (=> bs!30317 m!955381))

(declare-fun m!955887 () Bool)

(assert (=> bs!30317 m!955887))

(assert (=> b!1036073 d!124675))

(declare-fun d!124677 () Bool)

(declare-fun c!104850 () Bool)

(assert (=> d!124677 (= c!104850 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (= (_1!7916 (h!23150 (toList!6932 lt!456682))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586088 () Option!642)

(assert (=> d!124677 (= (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000) e!586088)))

(declare-fun b!1036308 () Bool)

(declare-fun e!586089 () Option!642)

(assert (=> b!1036308 (= e!586089 None!640)))

(declare-fun b!1036305 () Bool)

(assert (=> b!1036305 (= e!586088 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456682)))))))

(declare-fun b!1036306 () Bool)

(assert (=> b!1036306 (= e!586088 e!586089)))

(declare-fun c!104851 () Bool)

(assert (=> b!1036306 (= c!104851 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456682))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036307 () Bool)

(assert (=> b!1036307 (= e!586089 (getValueByKey!591 (t!31148 (toList!6932 lt!456682)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124677 c!104850) b!1036305))

(assert (= (and d!124677 (not c!104850)) b!1036306))

(assert (= (and b!1036306 c!104851) b!1036307))

(assert (= (and b!1036306 (not c!104851)) b!1036308))

(declare-fun m!955889 () Bool)

(assert (=> b!1036307 m!955889))

(assert (=> b!1036073 d!124677))

(assert (=> d!124531 d!124573))

(declare-fun d!124679 () Bool)

(declare-fun lt!456950 () Bool)

(assert (=> d!124679 (= lt!456950 (select (content!514 (toList!6932 lt!456869)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(declare-fun e!586090 () Bool)

(assert (=> d!124679 (= lt!456950 e!586090)))

(declare-fun res!691746 () Bool)

(assert (=> d!124679 (=> (not res!691746) (not e!586090))))

(assert (=> d!124679 (= res!691746 ((_ is Cons!21948) (toList!6932 lt!456869)))))

(assert (=> d!124679 (= (contains!6002 (toList!6932 lt!456869) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) lt!456950)))

(declare-fun b!1036309 () Bool)

(declare-fun e!586091 () Bool)

(assert (=> b!1036309 (= e!586090 e!586091)))

(declare-fun res!691747 () Bool)

(assert (=> b!1036309 (=> res!691747 e!586091)))

(assert (=> b!1036309 (= res!691747 (= (h!23150 (toList!6932 lt!456869)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(declare-fun b!1036310 () Bool)

(assert (=> b!1036310 (= e!586091 (contains!6002 (t!31148 (toList!6932 lt!456869)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(assert (= (and d!124679 res!691746) b!1036309))

(assert (= (and b!1036309 (not res!691747)) b!1036310))

(declare-fun m!955891 () Bool)

(assert (=> d!124679 m!955891))

(declare-fun m!955893 () Bool)

(assert (=> d!124679 m!955893))

(declare-fun m!955895 () Bool)

(assert (=> b!1036310 m!955895))

(assert (=> b!1036104 d!124679))

(declare-fun d!124681 () Bool)

(declare-fun c!104852 () Bool)

(assert (=> d!124681 (= c!104852 (and ((_ is Cons!21948) (toList!6932 lt!456752)) (= (_1!7916 (h!23150 (toList!6932 lt!456752))) (_1!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(declare-fun e!586092 () Option!642)

(assert (=> d!124681 (= (getValueByKey!591 (toList!6932 lt!456752) (_1!7916 (tuple2!15811 lt!456649 lt!456582))) e!586092)))

(declare-fun b!1036314 () Bool)

(declare-fun e!586093 () Option!642)

(assert (=> b!1036314 (= e!586093 None!640)))

(declare-fun b!1036311 () Bool)

(assert (=> b!1036311 (= e!586092 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456752)))))))

(declare-fun b!1036312 () Bool)

(assert (=> b!1036312 (= e!586092 e!586093)))

(declare-fun c!104853 () Bool)

(assert (=> b!1036312 (= c!104853 (and ((_ is Cons!21948) (toList!6932 lt!456752)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456752))) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))))

(declare-fun b!1036313 () Bool)

(assert (=> b!1036313 (= e!586093 (getValueByKey!591 (t!31148 (toList!6932 lt!456752)) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (= (and d!124681 c!104852) b!1036311))

(assert (= (and d!124681 (not c!104852)) b!1036312))

(assert (= (and b!1036312 c!104853) b!1036313))

(assert (= (and b!1036312 (not c!104853)) b!1036314))

(declare-fun m!955897 () Bool)

(assert (=> b!1036313 m!955897))

(assert (=> b!1035945 d!124681))

(assert (=> b!1036100 d!124477))

(declare-fun d!124683 () Bool)

(declare-fun c!104854 () Bool)

(assert (=> d!124683 (= c!104854 (and ((_ is Cons!21948) (toList!6932 lt!456808)) (= (_1!7916 (h!23150 (toList!6932 lt!456808))) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(declare-fun e!586094 () Option!642)

(assert (=> d!124683 (= (getValueByKey!591 (toList!6932 lt!456808) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) e!586094)))

(declare-fun b!1036318 () Bool)

(declare-fun e!586095 () Option!642)

(assert (=> b!1036318 (= e!586095 None!640)))

(declare-fun b!1036315 () Bool)

(assert (=> b!1036315 (= e!586094 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456808)))))))

(declare-fun b!1036316 () Bool)

(assert (=> b!1036316 (= e!586094 e!586095)))

(declare-fun c!104855 () Bool)

(assert (=> b!1036316 (= c!104855 (and ((_ is Cons!21948) (toList!6932 lt!456808)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456808))) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036317 () Bool)

(assert (=> b!1036317 (= e!586095 (getValueByKey!591 (t!31148 (toList!6932 lt!456808)) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124683 c!104854) b!1036315))

(assert (= (and d!124683 (not c!104854)) b!1036316))

(assert (= (and b!1036316 c!104855) b!1036317))

(assert (= (and b!1036316 (not c!104855)) b!1036318))

(declare-fun m!955899 () Bool)

(assert (=> b!1036317 m!955899))

(assert (=> b!1036025 d!124683))

(declare-fun d!124685 () Bool)

(declare-fun e!586096 () Bool)

(assert (=> d!124685 e!586096))

(declare-fun res!691748 () Bool)

(assert (=> d!124685 (=> res!691748 e!586096)))

(declare-fun lt!456952 () Bool)

(assert (=> d!124685 (= res!691748 (not lt!456952))))

(declare-fun lt!456951 () Bool)

(assert (=> d!124685 (= lt!456952 lt!456951)))

(declare-fun lt!456954 () Unit!33774)

(declare-fun e!586097 () Unit!33774)

(assert (=> d!124685 (= lt!456954 e!586097)))

(declare-fun c!104856 () Bool)

(assert (=> d!124685 (= c!104856 lt!456951)))

(assert (=> d!124685 (= lt!456951 (containsKey!564 (toList!6932 lt!456843) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (=> d!124685 (= (contains!6001 lt!456843 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) lt!456952)))

(declare-fun b!1036319 () Bool)

(declare-fun lt!456953 () Unit!33774)

(assert (=> b!1036319 (= e!586097 lt!456953)))

(assert (=> b!1036319 (= lt!456953 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456843) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (=> b!1036319 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456843) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036320 () Bool)

(declare-fun Unit!33795 () Unit!33774)

(assert (=> b!1036320 (= e!586097 Unit!33795)))

(declare-fun b!1036321 () Bool)

(assert (=> b!1036321 (= e!586096 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456843) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))))

(assert (= (and d!124685 c!104856) b!1036319))

(assert (= (and d!124685 (not c!104856)) b!1036320))

(assert (= (and d!124685 (not res!691748)) b!1036321))

(assert (=> d!124685 m!955545))

(declare-fun m!955901 () Bool)

(assert (=> d!124685 m!955901))

(assert (=> b!1036319 m!955545))

(declare-fun m!955903 () Bool)

(assert (=> b!1036319 m!955903))

(assert (=> b!1036319 m!955545))

(assert (=> b!1036319 m!955699))

(assert (=> b!1036319 m!955699))

(declare-fun m!955905 () Bool)

(assert (=> b!1036319 m!955905))

(assert (=> b!1036321 m!955545))

(assert (=> b!1036321 m!955699))

(assert (=> b!1036321 m!955699))

(assert (=> b!1036321 m!955905))

(assert (=> b!1036072 d!124685))

(assert (=> b!1036056 d!124639))

(declare-fun d!124687 () Bool)

(declare-fun e!586098 () Bool)

(assert (=> d!124687 e!586098))

(declare-fun res!691749 () Bool)

(assert (=> d!124687 (=> res!691749 e!586098)))

(declare-fun lt!456956 () Bool)

(assert (=> d!124687 (= res!691749 (not lt!456956))))

(declare-fun lt!456955 () Bool)

(assert (=> d!124687 (= lt!456956 lt!456955)))

(declare-fun lt!456958 () Unit!33774)

(declare-fun e!586099 () Unit!33774)

(assert (=> d!124687 (= lt!456958 e!586099)))

(declare-fun c!104857 () Bool)

(assert (=> d!124687 (= c!104857 lt!456955)))

(assert (=> d!124687 (= lt!456955 (containsKey!564 (toList!6932 lt!456790) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> d!124687 (= (contains!6001 lt!456790 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) lt!456956)))

(declare-fun b!1036322 () Bool)

(declare-fun lt!456957 () Unit!33774)

(assert (=> b!1036322 (= e!586099 lt!456957)))

(assert (=> b!1036322 (= lt!456957 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456790) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (=> b!1036322 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456790) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun b!1036323 () Bool)

(declare-fun Unit!33796 () Unit!33774)

(assert (=> b!1036323 (= e!586099 Unit!33796)))

(declare-fun b!1036324 () Bool)

(assert (=> b!1036324 (= e!586098 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456790) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(assert (= (and d!124687 c!104857) b!1036322))

(assert (= (and d!124687 (not c!104857)) b!1036323))

(assert (= (and d!124687 (not res!691749)) b!1036324))

(declare-fun m!955907 () Bool)

(assert (=> d!124687 m!955907))

(declare-fun m!955909 () Bool)

(assert (=> b!1036322 m!955909))

(assert (=> b!1036322 m!955393))

(assert (=> b!1036322 m!955393))

(declare-fun m!955911 () Bool)

(assert (=> b!1036322 m!955911))

(assert (=> b!1036324 m!955393))

(assert (=> b!1036324 m!955393))

(assert (=> b!1036324 m!955911))

(assert (=> d!124491 d!124687))

(declare-fun d!124689 () Bool)

(declare-fun c!104858 () Bool)

(assert (=> d!124689 (= c!104858 (and ((_ is Cons!21948) lt!456791) (= (_1!7916 (h!23150 lt!456791)) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun e!586100 () Option!642)

(assert (=> d!124689 (= (getValueByKey!591 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) e!586100)))

(declare-fun b!1036328 () Bool)

(declare-fun e!586101 () Option!642)

(assert (=> b!1036328 (= e!586101 None!640)))

(declare-fun b!1036325 () Bool)

(assert (=> b!1036325 (= e!586100 (Some!641 (_2!7916 (h!23150 lt!456791))))))

(declare-fun b!1036326 () Bool)

(assert (=> b!1036326 (= e!586100 e!586101)))

(declare-fun c!104859 () Bool)

(assert (=> b!1036326 (= c!104859 (and ((_ is Cons!21948) lt!456791) (not (= (_1!7916 (h!23150 lt!456791)) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))))

(declare-fun b!1036327 () Bool)

(assert (=> b!1036327 (= e!586101 (getValueByKey!591 (t!31148 lt!456791) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (= (and d!124689 c!104858) b!1036325))

(assert (= (and d!124689 (not c!104858)) b!1036326))

(assert (= (and b!1036326 c!104859) b!1036327))

(assert (= (and b!1036326 (not c!104859)) b!1036328))

(declare-fun m!955913 () Bool)

(assert (=> b!1036327 m!955913))

(assert (=> d!124491 d!124689))

(declare-fun d!124691 () Bool)

(assert (=> d!124691 (= (getValueByKey!591 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) (Some!641 (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun lt!456959 () Unit!33774)

(assert (=> d!124691 (= lt!456959 (choose!1714 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun e!586102 () Bool)

(assert (=> d!124691 e!586102))

(declare-fun res!691750 () Bool)

(assert (=> d!124691 (=> (not res!691750) (not e!586102))))

(assert (=> d!124691 (= res!691750 (isStrictlySorted!715 lt!456791))))

(assert (=> d!124691 (= (lemmaContainsTupThenGetReturnValue!281 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) lt!456959)))

(declare-fun b!1036329 () Bool)

(declare-fun res!691751 () Bool)

(assert (=> b!1036329 (=> (not res!691751) (not e!586102))))

(assert (=> b!1036329 (= res!691751 (containsKey!564 lt!456791 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun b!1036330 () Bool)

(assert (=> b!1036330 (= e!586102 (contains!6002 lt!456791 (tuple2!15811 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(assert (= (and d!124691 res!691750) b!1036329))

(assert (= (and b!1036329 res!691751) b!1036330))

(assert (=> d!124691 m!955387))

(declare-fun m!955915 () Bool)

(assert (=> d!124691 m!955915))

(declare-fun m!955917 () Bool)

(assert (=> d!124691 m!955917))

(declare-fun m!955919 () Bool)

(assert (=> b!1036329 m!955919))

(declare-fun m!955921 () Bool)

(assert (=> b!1036330 m!955921))

(assert (=> d!124491 d!124691))

(declare-fun b!1036331 () Bool)

(declare-fun e!586105 () List!21952)

(declare-fun call!43842 () List!21952)

(assert (=> b!1036331 (= e!586105 call!43842)))

(declare-fun b!1036332 () Bool)

(declare-fun e!586104 () List!21952)

(declare-fun call!43843 () List!21952)

(assert (=> b!1036332 (= e!586104 call!43843)))

(declare-fun b!1036333 () Bool)

(declare-fun res!691752 () Bool)

(declare-fun e!586106 () Bool)

(assert (=> b!1036333 (=> (not res!691752) (not e!586106))))

(declare-fun lt!456960 () List!21952)

(assert (=> b!1036333 (= res!691752 (containsKey!564 lt!456960 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun b!1036334 () Bool)

(assert (=> b!1036334 (= e!586105 e!586104)))

(declare-fun c!104861 () Bool)

(assert (=> b!1036334 (= c!104861 (and ((_ is Cons!21948) (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (= (_1!7916 (h!23150 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun bm!43839 () Bool)

(assert (=> bm!43839 (= call!43843 call!43842)))

(declare-fun b!1036335 () Bool)

(declare-fun e!586103 () List!21952)

(declare-fun call!43844 () List!21952)

(assert (=> b!1036335 (= e!586103 call!43844)))

(declare-fun c!104863 () Bool)

(declare-fun b!1036336 () Bool)

(declare-fun e!586107 () List!21952)

(assert (=> b!1036336 (= e!586107 (ite c!104861 (t!31148 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (ite c!104863 (Cons!21948 (h!23150 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (t!31148 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))))) Nil!21949)))))

(declare-fun b!1036337 () Bool)

(assert (=> b!1036337 (= e!586103 call!43844)))

(declare-fun bm!43840 () Bool)

(declare-fun c!104860 () Bool)

(assert (=> bm!43840 (= call!43842 ($colon$colon!605 e!586107 (ite c!104860 (h!23150 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (tuple2!15811 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))))

(declare-fun c!104862 () Bool)

(assert (=> bm!43840 (= c!104862 c!104860)))

(declare-fun bm!43841 () Bool)

(assert (=> bm!43841 (= call!43844 call!43843)))

(declare-fun b!1036338 () Bool)

(assert (=> b!1036338 (= e!586107 (insertStrictlySorted!374 (t!31148 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun b!1036339 () Bool)

(assert (=> b!1036339 (= e!586106 (contains!6002 lt!456960 (tuple2!15811 (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun d!124693 () Bool)

(assert (=> d!124693 e!586106))

(declare-fun res!691753 () Bool)

(assert (=> d!124693 (=> (not res!691753) (not e!586106))))

(assert (=> d!124693 (= res!691753 (isStrictlySorted!715 lt!456960))))

(assert (=> d!124693 (= lt!456960 e!586105)))

(assert (=> d!124693 (= c!104860 (and ((_ is Cons!21948) (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (bvslt (_1!7916 (h!23150 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(assert (=> d!124693 (isStrictlySorted!715 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))))))

(assert (=> d!124693 (= (insertStrictlySorted!374 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) (_2!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) lt!456960)))

(declare-fun b!1036340 () Bool)

(assert (=> b!1036340 (= c!104863 (and ((_ is Cons!21948) (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793)))) (bvsgt (_1!7916 (h!23150 (toList!6932 (ite c!104723 call!43796 (ite c!104721 call!43797 call!43793))))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(assert (=> b!1036340 (= e!586104 e!586103)))

(assert (= (and d!124693 c!104860) b!1036331))

(assert (= (and d!124693 (not c!104860)) b!1036334))

(assert (= (and b!1036334 c!104861) b!1036332))

(assert (= (and b!1036334 (not c!104861)) b!1036340))

(assert (= (and b!1036340 c!104863) b!1036335))

(assert (= (and b!1036340 (not c!104863)) b!1036337))

(assert (= (or b!1036335 b!1036337) bm!43841))

(assert (= (or b!1036332 bm!43841) bm!43839))

(assert (= (or b!1036331 bm!43839) bm!43840))

(assert (= (and bm!43840 c!104862) b!1036338))

(assert (= (and bm!43840 (not c!104862)) b!1036336))

(assert (= (and d!124693 res!691753) b!1036333))

(assert (= (and b!1036333 res!691752) b!1036339))

(declare-fun m!955923 () Bool)

(assert (=> b!1036339 m!955923))

(declare-fun m!955925 () Bool)

(assert (=> b!1036333 m!955925))

(declare-fun m!955927 () Bool)

(assert (=> b!1036338 m!955927))

(declare-fun m!955929 () Bool)

(assert (=> bm!43840 m!955929))

(declare-fun m!955931 () Bool)

(assert (=> d!124693 m!955931))

(declare-fun m!955933 () Bool)

(assert (=> d!124693 m!955933))

(assert (=> d!124491 d!124693))

(declare-fun d!124695 () Bool)

(assert (=> d!124695 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))

(declare-fun lt!456961 () Unit!33774)

(assert (=> d!124695 (= lt!456961 (choose!1712 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))

(declare-fun e!586108 () Bool)

(assert (=> d!124695 e!586108))

(declare-fun res!691754 () Bool)

(assert (=> d!124695 (=> (not res!691754) (not e!586108))))

(assert (=> d!124695 (= res!691754 (isStrictlySorted!715 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!124695 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676) lt!456961)))

(declare-fun b!1036341 () Bool)

(assert (=> b!1036341 (= e!586108 (containsKey!564 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))

(assert (= (and d!124695 res!691754) b!1036341))

(assert (=> d!124695 m!955423))

(assert (=> d!124695 m!955423))

(assert (=> d!124695 m!955425))

(declare-fun m!955935 () Bool)

(assert (=> d!124695 m!955935))

(declare-fun m!955937 () Bool)

(assert (=> d!124695 m!955937))

(assert (=> b!1036341 m!955419))

(assert (=> b!1036019 d!124695))

(declare-fun d!124697 () Bool)

(assert (=> d!124697 (= (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676))))))

(declare-fun bs!30318 () Bool)

(assert (= bs!30318 d!124697))

(assert (=> bs!30318 m!955423))

(declare-fun m!955939 () Bool)

(assert (=> bs!30318 m!955939))

(assert (=> b!1036019 d!124697))

(declare-fun c!104864 () Bool)

(declare-fun d!124699 () Bool)

(assert (=> d!124699 (= c!104864 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))) lt!456676)))))

(declare-fun e!586109 () Option!642)

(assert (=> d!124699 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!456676) e!586109)))

(declare-fun b!1036345 () Bool)

(declare-fun e!586110 () Option!642)

(assert (=> b!1036345 (= e!586110 None!640)))

(declare-fun b!1036342 () Bool)

(assert (=> b!1036342 (= e!586109 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))))

(declare-fun b!1036343 () Bool)

(assert (=> b!1036343 (= e!586109 e!586110)))

(declare-fun c!104865 () Bool)

(assert (=> b!1036343 (= c!104865 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))) lt!456676))))))

(declare-fun b!1036344 () Bool)

(assert (=> b!1036344 (= e!586110 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))) lt!456676))))

(assert (= (and d!124699 c!104864) b!1036342))

(assert (= (and d!124699 (not c!104864)) b!1036343))

(assert (= (and b!1036343 c!104865) b!1036344))

(assert (= (and b!1036343 (not c!104865)) b!1036345))

(declare-fun m!955941 () Bool)

(assert (=> b!1036344 m!955941))

(assert (=> b!1036019 d!124699))

(declare-fun d!124701 () Bool)

(assert (=> d!124701 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456604) key!909)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456604) key!909))))))

(declare-fun bs!30319 () Bool)

(assert (= bs!30319 d!124701))

(assert (=> bs!30319 m!955203))

(declare-fun m!955943 () Bool)

(assert (=> bs!30319 m!955943))

(assert (=> b!1035894 d!124701))

(declare-fun d!124703 () Bool)

(declare-fun c!104866 () Bool)

(assert (=> d!124703 (= c!104866 (and ((_ is Cons!21948) (toList!6932 lt!456604)) (= (_1!7916 (h!23150 (toList!6932 lt!456604))) key!909)))))

(declare-fun e!586111 () Option!642)

(assert (=> d!124703 (= (getValueByKey!591 (toList!6932 lt!456604) key!909) e!586111)))

(declare-fun b!1036349 () Bool)

(declare-fun e!586112 () Option!642)

(assert (=> b!1036349 (= e!586112 None!640)))

(declare-fun b!1036346 () Bool)

(assert (=> b!1036346 (= e!586111 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456604)))))))

(declare-fun b!1036347 () Bool)

(assert (=> b!1036347 (= e!586111 e!586112)))

(declare-fun c!104867 () Bool)

(assert (=> b!1036347 (= c!104867 (and ((_ is Cons!21948) (toList!6932 lt!456604)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456604))) key!909))))))

(declare-fun b!1036348 () Bool)

(assert (=> b!1036348 (= e!586112 (getValueByKey!591 (t!31148 (toList!6932 lt!456604)) key!909))))

(assert (= (and d!124703 c!104866) b!1036346))

(assert (= (and d!124703 (not c!104866)) b!1036347))

(assert (= (and b!1036347 c!104867) b!1036348))

(assert (= (and b!1036347 (not c!104867)) b!1036349))

(declare-fun m!955945 () Bool)

(assert (=> b!1036348 m!955945))

(assert (=> b!1035894 d!124703))

(declare-fun d!124705 () Bool)

(declare-fun e!586113 () Bool)

(assert (=> d!124705 e!586113))

(declare-fun res!691755 () Bool)

(assert (=> d!124705 (=> res!691755 e!586113)))

(declare-fun lt!456963 () Bool)

(assert (=> d!124705 (= res!691755 (not lt!456963))))

(declare-fun lt!456962 () Bool)

(assert (=> d!124705 (= lt!456963 lt!456962)))

(declare-fun lt!456965 () Unit!33774)

(declare-fun e!586114 () Unit!33774)

(assert (=> d!124705 (= lt!456965 e!586114)))

(declare-fun c!104868 () Bool)

(assert (=> d!124705 (= c!104868 lt!456962)))

(assert (=> d!124705 (= lt!456962 (containsKey!564 (toList!6932 lt!456686) lt!456678))))

(assert (=> d!124705 (= (contains!6001 lt!456686 lt!456678) lt!456963)))

(declare-fun b!1036350 () Bool)

(declare-fun lt!456964 () Unit!33774)

(assert (=> b!1036350 (= e!586114 lt!456964)))

(assert (=> b!1036350 (= lt!456964 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456686) lt!456678))))

(assert (=> b!1036350 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456686) lt!456678))))

(declare-fun b!1036351 () Bool)

(declare-fun Unit!33797 () Unit!33774)

(assert (=> b!1036351 (= e!586114 Unit!33797)))

(declare-fun b!1036352 () Bool)

(assert (=> b!1036352 (= e!586113 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456686) lt!456678)))))

(assert (= (and d!124705 c!104868) b!1036350))

(assert (= (and d!124705 (not c!104868)) b!1036351))

(assert (= (and d!124705 (not res!691755)) b!1036352))

(declare-fun m!955947 () Bool)

(assert (=> d!124705 m!955947))

(declare-fun m!955949 () Bool)

(assert (=> b!1036350 m!955949))

(assert (=> b!1036350 m!955471))

(assert (=> b!1036350 m!955471))

(declare-fun m!955951 () Bool)

(assert (=> b!1036350 m!955951))

(assert (=> b!1036352 m!955471))

(assert (=> b!1036352 m!955471))

(assert (=> b!1036352 m!955951))

(assert (=> d!124505 d!124705))

(assert (=> d!124505 d!124503))

(assert (=> d!124505 d!124507))

(declare-fun d!124707 () Bool)

(assert (=> d!124707 (= (apply!900 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) lt!456678) (apply!900 lt!456686 lt!456678))))

(assert (=> d!124707 true))

(declare-fun _$34!1172 () Unit!33774)

(assert (=> d!124707 (= (choose!1711 lt!456686 lt!456683 (zeroValue!6103 thiss!1427) lt!456678) _$34!1172)))

(declare-fun bs!30320 () Bool)

(assert (= bs!30320 d!124707))

(assert (=> bs!30320 m!955143))

(assert (=> bs!30320 m!955143))

(assert (=> bs!30320 m!955167))

(assert (=> bs!30320 m!955161))

(assert (=> d!124505 d!124707))

(assert (=> d!124505 d!124515))

(declare-fun d!124709 () Bool)

(declare-fun c!104869 () Bool)

(assert (=> d!124709 (= c!104869 (and ((_ is Cons!21948) (toList!6932 lt!456744)) (= (_1!7916 (h!23150 (toList!6932 lt!456744))) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586115 () Option!642)

(assert (=> d!124709 (= (getValueByKey!591 (toList!6932 lt!456744) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) e!586115)))

(declare-fun b!1036357 () Bool)

(declare-fun e!586116 () Option!642)

(assert (=> b!1036357 (= e!586116 None!640)))

(declare-fun b!1036354 () Bool)

(assert (=> b!1036354 (= e!586115 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456744)))))))

(declare-fun b!1036355 () Bool)

(assert (=> b!1036355 (= e!586115 e!586116)))

(declare-fun c!104870 () Bool)

(assert (=> b!1036355 (= c!104870 (and ((_ is Cons!21948) (toList!6932 lt!456744)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456744))) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036356 () Bool)

(assert (=> b!1036356 (= e!586116 (getValueByKey!591 (t!31148 (toList!6932 lt!456744)) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124709 c!104869) b!1036354))

(assert (= (and d!124709 (not c!104869)) b!1036355))

(assert (= (and b!1036355 c!104870) b!1036356))

(assert (= (and b!1036355 (not c!104870)) b!1036357))

(declare-fun m!955953 () Bool)

(assert (=> b!1036356 m!955953))

(assert (=> b!1035941 d!124709))

(declare-fun d!124711 () Bool)

(declare-fun c!104871 () Bool)

(assert (=> d!124711 (= c!104871 (and ((_ is Cons!21948) (toList!6932 lt!456790)) (= (_1!7916 (h!23150 (toList!6932 lt!456790))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun e!586117 () Option!642)

(assert (=> d!124711 (= (getValueByKey!591 (toList!6932 lt!456790) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))) e!586117)))

(declare-fun b!1036361 () Bool)

(declare-fun e!586118 () Option!642)

(assert (=> b!1036361 (= e!586118 None!640)))

(declare-fun b!1036358 () Bool)

(assert (=> b!1036358 (= e!586117 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456790)))))))

(declare-fun b!1036359 () Bool)

(assert (=> b!1036359 (= e!586117 e!586118)))

(declare-fun c!104872 () Bool)

(assert (=> b!1036359 (= c!104872 (and ((_ is Cons!21948) (toList!6932 lt!456790)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456790))) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))))

(declare-fun b!1036360 () Bool)

(assert (=> b!1036360 (= e!586118 (getValueByKey!591 (t!31148 (toList!6932 lt!456790)) (_1!7916 (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(assert (= (and d!124711 c!104871) b!1036358))

(assert (= (and d!124711 (not c!104871)) b!1036359))

(assert (= (and b!1036359 c!104872) b!1036360))

(assert (= (and b!1036359 (not c!104872)) b!1036361))

(declare-fun m!955955 () Bool)

(assert (=> b!1036360 m!955955))

(assert (=> b!1036009 d!124711))

(declare-fun d!124713 () Bool)

(declare-fun e!586119 () Bool)

(assert (=> d!124713 e!586119))

(declare-fun res!691756 () Bool)

(assert (=> d!124713 (=> res!691756 e!586119)))

(declare-fun lt!456967 () Bool)

(assert (=> d!124713 (= res!691756 (not lt!456967))))

(declare-fun lt!456966 () Bool)

(assert (=> d!124713 (= lt!456967 lt!456966)))

(declare-fun lt!456969 () Unit!33774)

(declare-fun e!586120 () Unit!33774)

(assert (=> d!124713 (= lt!456969 e!586120)))

(declare-fun c!104873 () Bool)

(assert (=> d!124713 (= c!104873 lt!456966)))

(assert (=> d!124713 (= lt!456966 (containsKey!564 (toList!6932 lt!456819) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124713 (= (contains!6001 lt!456819 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!456967)))

(declare-fun b!1036362 () Bool)

(declare-fun lt!456968 () Unit!33774)

(assert (=> b!1036362 (= e!586120 lt!456968)))

(assert (=> b!1036362 (= lt!456968 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456819) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036362 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456819) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036363 () Bool)

(declare-fun Unit!33798 () Unit!33774)

(assert (=> b!1036363 (= e!586120 Unit!33798)))

(declare-fun b!1036364 () Bool)

(assert (=> b!1036364 (= e!586119 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456819) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124713 c!104873) b!1036362))

(assert (= (and d!124713 (not c!104873)) b!1036363))

(assert (= (and d!124713 (not res!691756)) b!1036364))

(assert (=> d!124713 m!955067))

(declare-fun m!955957 () Bool)

(assert (=> d!124713 m!955957))

(assert (=> b!1036362 m!955067))

(declare-fun m!955959 () Bool)

(assert (=> b!1036362 m!955959))

(assert (=> b!1036362 m!955067))

(declare-fun m!955961 () Bool)

(assert (=> b!1036362 m!955961))

(assert (=> b!1036362 m!955961))

(declare-fun m!955963 () Bool)

(assert (=> b!1036362 m!955963))

(assert (=> b!1036364 m!955067))

(assert (=> b!1036364 m!955961))

(assert (=> b!1036364 m!955961))

(assert (=> b!1036364 m!955963))

(assert (=> b!1036035 d!124713))

(declare-fun d!124715 () Bool)

(assert (=> d!124715 (= (get!16461 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036008 d!124715))

(assert (=> b!1035975 d!124487))

(declare-fun d!124717 () Bool)

(declare-fun e!586121 () Bool)

(assert (=> d!124717 e!586121))

(declare-fun res!691757 () Bool)

(assert (=> d!124717 (=> res!691757 e!586121)))

(declare-fun lt!456971 () Bool)

(assert (=> d!124717 (= res!691757 (not lt!456971))))

(declare-fun lt!456970 () Bool)

(assert (=> d!124717 (= lt!456971 lt!456970)))

(declare-fun lt!456973 () Unit!33774)

(declare-fun e!586122 () Unit!33774)

(assert (=> d!124717 (= lt!456973 e!586122)))

(declare-fun c!104874 () Bool)

(assert (=> d!124717 (= c!104874 lt!456970)))

(assert (=> d!124717 (= lt!456970 (containsKey!564 (toList!6932 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774))) lt!456770))))

(assert (=> d!124717 (= (contains!6001 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774)) lt!456770) lt!456971)))

(declare-fun b!1036365 () Bool)

(declare-fun lt!456972 () Unit!33774)

(assert (=> b!1036365 (= e!586122 lt!456972)))

(assert (=> b!1036365 (= lt!456972 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774))) lt!456770))))

(assert (=> b!1036365 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774))) lt!456770))))

(declare-fun b!1036366 () Bool)

(declare-fun Unit!33799 () Unit!33774)

(assert (=> b!1036366 (= e!586122 Unit!33799)))

(declare-fun b!1036367 () Bool)

(assert (=> b!1036367 (= e!586121 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774))) lt!456770)))))

(assert (= (and d!124717 c!104874) b!1036365))

(assert (= (and d!124717 (not c!104874)) b!1036366))

(assert (= (and d!124717 (not res!691757)) b!1036367))

(declare-fun m!955965 () Bool)

(assert (=> d!124717 m!955965))

(declare-fun m!955967 () Bool)

(assert (=> b!1036365 m!955967))

(declare-fun m!955969 () Bool)

(assert (=> b!1036365 m!955969))

(assert (=> b!1036365 m!955969))

(declare-fun m!955971 () Bool)

(assert (=> b!1036365 m!955971))

(assert (=> b!1036367 m!955969))

(assert (=> b!1036367 m!955969))

(assert (=> b!1036367 m!955971))

(assert (=> b!1035975 d!124717))

(declare-fun d!124719 () Bool)

(declare-fun e!586123 () Bool)

(assert (=> d!124719 e!586123))

(declare-fun res!691759 () Bool)

(assert (=> d!124719 (=> (not res!691759) (not e!586123))))

(declare-fun lt!456976 () ListLongMap!13833)

(assert (=> d!124719 (= res!691759 (contains!6001 lt!456976 (_1!7916 (tuple2!15811 lt!456768 lt!456774))))))

(declare-fun lt!456977 () List!21952)

(assert (=> d!124719 (= lt!456976 (ListLongMap!13834 lt!456977))))

(declare-fun lt!456975 () Unit!33774)

(declare-fun lt!456974 () Unit!33774)

(assert (=> d!124719 (= lt!456975 lt!456974)))

(assert (=> d!124719 (= (getValueByKey!591 lt!456977 (_1!7916 (tuple2!15811 lt!456768 lt!456774))) (Some!641 (_2!7916 (tuple2!15811 lt!456768 lt!456774))))))

(assert (=> d!124719 (= lt!456974 (lemmaContainsTupThenGetReturnValue!281 lt!456977 (_1!7916 (tuple2!15811 lt!456768 lt!456774)) (_2!7916 (tuple2!15811 lt!456768 lt!456774))))))

(assert (=> d!124719 (= lt!456977 (insertStrictlySorted!374 (toList!6932 lt!456771) (_1!7916 (tuple2!15811 lt!456768 lt!456774)) (_2!7916 (tuple2!15811 lt!456768 lt!456774))))))

(assert (=> d!124719 (= (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774)) lt!456976)))

(declare-fun b!1036368 () Bool)

(declare-fun res!691758 () Bool)

(assert (=> b!1036368 (=> (not res!691758) (not e!586123))))

(assert (=> b!1036368 (= res!691758 (= (getValueByKey!591 (toList!6932 lt!456976) (_1!7916 (tuple2!15811 lt!456768 lt!456774))) (Some!641 (_2!7916 (tuple2!15811 lt!456768 lt!456774)))))))

(declare-fun b!1036369 () Bool)

(assert (=> b!1036369 (= e!586123 (contains!6002 (toList!6932 lt!456976) (tuple2!15811 lt!456768 lt!456774)))))

(assert (= (and d!124719 res!691759) b!1036368))

(assert (= (and b!1036368 res!691758) b!1036369))

(declare-fun m!955973 () Bool)

(assert (=> d!124719 m!955973))

(declare-fun m!955975 () Bool)

(assert (=> d!124719 m!955975))

(declare-fun m!955977 () Bool)

(assert (=> d!124719 m!955977))

(declare-fun m!955979 () Bool)

(assert (=> d!124719 m!955979))

(declare-fun m!955981 () Bool)

(assert (=> b!1036368 m!955981))

(declare-fun m!955983 () Bool)

(assert (=> b!1036369 m!955983))

(assert (=> b!1035975 d!124719))

(declare-fun d!124721 () Bool)

(declare-fun e!586124 () Bool)

(assert (=> d!124721 e!586124))

(declare-fun res!691761 () Bool)

(assert (=> d!124721 (=> (not res!691761) (not e!586124))))

(declare-fun lt!456980 () ListLongMap!13833)

(assert (=> d!124721 (= res!691761 (contains!6001 lt!456980 (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!456981 () List!21952)

(assert (=> d!124721 (= lt!456980 (ListLongMap!13834 lt!456981))))

(declare-fun lt!456979 () Unit!33774)

(declare-fun lt!456978 () Unit!33774)

(assert (=> d!124721 (= lt!456979 lt!456978)))

(assert (=> d!124721 (= (getValueByKey!591 lt!456981 (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!641 (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124721 (= lt!456978 (lemmaContainsTupThenGetReturnValue!281 lt!456981 (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124721 (= lt!456981 (insertStrictlySorted!374 (toList!6932 call!43808) (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124721 (= (+!3131 call!43808 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!456980)))

(declare-fun b!1036370 () Bool)

(declare-fun res!691760 () Bool)

(assert (=> b!1036370 (=> (not res!691760) (not e!586124))))

(assert (=> b!1036370 (= res!691760 (= (getValueByKey!591 (toList!6932 lt!456980) (_1!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!641 (_2!7916 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1036371 () Bool)

(assert (=> b!1036371 (= e!586124 (contains!6002 (toList!6932 lt!456980) (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124721 res!691761) b!1036370))

(assert (= (and b!1036370 res!691760) b!1036371))

(declare-fun m!955985 () Bool)

(assert (=> d!124721 m!955985))

(declare-fun m!955987 () Bool)

(assert (=> d!124721 m!955987))

(declare-fun m!955989 () Bool)

(assert (=> d!124721 m!955989))

(declare-fun m!955991 () Bool)

(assert (=> d!124721 m!955991))

(declare-fun m!955993 () Bool)

(assert (=> b!1036370 m!955993))

(declare-fun m!955995 () Bool)

(assert (=> b!1036371 m!955995))

(assert (=> b!1035975 d!124721))

(declare-fun d!124723 () Bool)

(assert (=> d!124723 (not (contains!6001 (+!3131 lt!456771 (tuple2!15811 lt!456768 lt!456774)) lt!456770))))

(declare-fun lt!456982 () Unit!33774)

(assert (=> d!124723 (= lt!456982 (choose!1713 lt!456771 lt!456768 lt!456774 lt!456770))))

(declare-fun e!586125 () Bool)

(assert (=> d!124723 e!586125))

(declare-fun res!691762 () Bool)

(assert (=> d!124723 (=> (not res!691762) (not e!586125))))

(assert (=> d!124723 (= res!691762 (not (contains!6001 lt!456771 lt!456770)))))

(assert (=> d!124723 (= (addStillNotContains!244 lt!456771 lt!456768 lt!456774 lt!456770) lt!456982)))

(declare-fun b!1036372 () Bool)

(assert (=> b!1036372 (= e!586125 (not (= lt!456768 lt!456770)))))

(assert (= (and d!124723 res!691762) b!1036372))

(assert (=> d!124723 m!955327))

(assert (=> d!124723 m!955327))

(assert (=> d!124723 m!955329))

(declare-fun m!955997 () Bool)

(assert (=> d!124723 m!955997))

(declare-fun m!955999 () Bool)

(assert (=> d!124723 m!955999))

(assert (=> b!1035975 d!124723))

(assert (=> b!1036086 d!124477))

(assert (=> d!124529 d!124419))

(assert (=> d!124529 d!124417))

(assert (=> d!124529 d!124415))

(declare-fun d!124725 () Bool)

(declare-fun res!691763 () Bool)

(declare-fun e!586126 () Bool)

(assert (=> d!124725 (=> res!691763 e!586126)))

(assert (=> d!124725 (= res!691763 (and ((_ is Cons!21948) lt!456711) (= (_1!7916 (h!23150 lt!456711)) key!909)))))

(assert (=> d!124725 (= (containsKey!564 lt!456711 key!909) e!586126)))

(declare-fun b!1036373 () Bool)

(declare-fun e!586127 () Bool)

(assert (=> b!1036373 (= e!586126 e!586127)))

(declare-fun res!691764 () Bool)

(assert (=> b!1036373 (=> (not res!691764) (not e!586127))))

(assert (=> b!1036373 (= res!691764 (and (or (not ((_ is Cons!21948) lt!456711)) (bvsle (_1!7916 (h!23150 lt!456711)) key!909)) ((_ is Cons!21948) lt!456711) (bvslt (_1!7916 (h!23150 lt!456711)) key!909)))))

(declare-fun b!1036374 () Bool)

(assert (=> b!1036374 (= e!586127 (containsKey!564 (t!31148 lt!456711) key!909))))

(assert (= (and d!124725 (not res!691763)) b!1036373))

(assert (= (and b!1036373 res!691764) b!1036374))

(declare-fun m!956001 () Bool)

(assert (=> b!1036374 m!956001))

(assert (=> b!1035909 d!124725))

(declare-fun d!124727 () Bool)

(assert (=> d!124727 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456983 () Unit!33774)

(assert (=> d!124727 (= lt!456983 (choose!1712 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586128 () Bool)

(assert (=> d!124727 e!586128))

(declare-fun res!691765 () Bool)

(assert (=> d!124727 (=> (not res!691765) (not e!586128))))

(assert (=> d!124727 (= res!691765 (isStrictlySorted!715 (toList!6932 lt!456660)))))

(assert (=> d!124727 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456983)))

(declare-fun b!1036375 () Bool)

(assert (=> b!1036375 (= e!586128 (containsKey!564 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124727 res!691765) b!1036375))

(assert (=> d!124727 m!955221))

(assert (=> d!124727 m!955221))

(assert (=> d!124727 m!955223))

(declare-fun m!956003 () Bool)

(assert (=> d!124727 m!956003))

(assert (=> d!124727 m!955779))

(assert (=> b!1036375 m!955217))

(assert (=> b!1035910 d!124727))

(declare-fun d!124729 () Bool)

(assert (=> d!124729 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30321 () Bool)

(assert (= bs!30321 d!124729))

(assert (=> bs!30321 m!955221))

(declare-fun m!956005 () Bool)

(assert (=> bs!30321 m!956005))

(assert (=> b!1035910 d!124729))

(declare-fun d!124731 () Bool)

(declare-fun c!104875 () Bool)

(assert (=> d!124731 (= c!104875 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (= (_1!7916 (h!23150 (toList!6932 lt!456660))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586129 () Option!642)

(assert (=> d!124731 (= (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000) e!586129)))

(declare-fun b!1036379 () Bool)

(declare-fun e!586130 () Option!642)

(assert (=> b!1036379 (= e!586130 None!640)))

(declare-fun b!1036376 () Bool)

(assert (=> b!1036376 (= e!586129 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456660)))))))

(declare-fun b!1036377 () Bool)

(assert (=> b!1036377 (= e!586129 e!586130)))

(declare-fun c!104876 () Bool)

(assert (=> b!1036377 (= c!104876 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456660))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036378 () Bool)

(assert (=> b!1036378 (= e!586130 (getValueByKey!591 (t!31148 (toList!6932 lt!456660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124731 c!104875) b!1036376))

(assert (= (and d!124731 (not c!104875)) b!1036377))

(assert (= (and b!1036377 c!104876) b!1036378))

(assert (= (and b!1036377 (not c!104876)) b!1036379))

(declare-fun m!956007 () Bool)

(assert (=> b!1036378 m!956007))

(assert (=> b!1035910 d!124731))

(declare-fun b!1036380 () Bool)

(declare-fun e!586131 () ListLongMap!13833)

(declare-fun call!43845 () ListLongMap!13833)

(assert (=> b!1036380 (= e!586131 call!43845)))

(declare-fun b!1036381 () Bool)

(declare-fun e!586133 () Bool)

(declare-fun e!586134 () Bool)

(assert (=> b!1036381 (= e!586133 e!586134)))

(declare-fun c!104878 () Bool)

(declare-fun e!586135 () Bool)

(assert (=> b!1036381 (= c!104878 e!586135)))

(declare-fun res!691769 () Bool)

(assert (=> b!1036381 (=> (not res!691769) (not e!586135))))

(assert (=> b!1036381 (= res!691769 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun bm!43842 () Bool)

(assert (=> bm!43842 (= call!43845 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun d!124733 () Bool)

(assert (=> d!124733 e!586133))

(declare-fun res!691767 () Bool)

(assert (=> d!124733 (=> (not res!691767) (not e!586133))))

(declare-fun lt!456988 () ListLongMap!13833)

(assert (=> d!124733 (= res!691767 (not (contains!6001 lt!456988 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586132 () ListLongMap!13833)

(assert (=> d!124733 (= lt!456988 e!586132)))

(declare-fun c!104877 () Bool)

(assert (=> d!124733 (= c!104877 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124733 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124733 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)) lt!456988)))

(declare-fun b!1036382 () Bool)

(assert (=> b!1036382 (= e!586135 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036382 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1036383 () Bool)

(declare-fun e!586136 () Bool)

(assert (=> b!1036383 (= e!586134 e!586136)))

(declare-fun c!104879 () Bool)

(assert (=> b!1036383 (= c!104879 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1036384 () Bool)

(declare-fun lt!456989 () Unit!33774)

(declare-fun lt!456985 () Unit!33774)

(assert (=> b!1036384 (= lt!456989 lt!456985)))

(declare-fun lt!456990 () V!37667)

(declare-fun lt!456986 () (_ BitVec 64))

(declare-fun lt!456987 () ListLongMap!13833)

(declare-fun lt!456984 () (_ BitVec 64))

(assert (=> b!1036384 (not (contains!6001 (+!3131 lt!456987 (tuple2!15811 lt!456984 lt!456990)) lt!456986))))

(assert (=> b!1036384 (= lt!456985 (addStillNotContains!244 lt!456987 lt!456984 lt!456990 lt!456986))))

(assert (=> b!1036384 (= lt!456986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036384 (= lt!456990 (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036384 (= lt!456984 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036384 (= lt!456987 call!43845)))

(assert (=> b!1036384 (= e!586131 (+!3131 call!43845 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036385 () Bool)

(declare-fun e!586137 () Bool)

(assert (=> b!1036385 (= e!586134 e!586137)))

(assert (=> b!1036385 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun res!691768 () Bool)

(assert (=> b!1036385 (= res!691768 (contains!6001 lt!456988 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036385 (=> (not res!691768) (not e!586137))))

(declare-fun b!1036386 () Bool)

(assert (=> b!1036386 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> b!1036386 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31929 (_values!6292 thiss!1427))))))

(assert (=> b!1036386 (= e!586137 (= (apply!900 lt!456988 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036387 () Bool)

(assert (=> b!1036387 (= e!586136 (= lt!456988 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1036388 () Bool)

(assert (=> b!1036388 (= e!586132 (ListLongMap!13834 Nil!21949))))

(declare-fun b!1036389 () Bool)

(assert (=> b!1036389 (= e!586136 (isEmpty!934 lt!456988))))

(declare-fun b!1036390 () Bool)

(declare-fun res!691766 () Bool)

(assert (=> b!1036390 (=> (not res!691766) (not e!586133))))

(assert (=> b!1036390 (= res!691766 (not (contains!6001 lt!456988 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036391 () Bool)

(assert (=> b!1036391 (= e!586132 e!586131)))

(declare-fun c!104880 () Bool)

(assert (=> b!1036391 (= c!104880 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124733 c!104877) b!1036388))

(assert (= (and d!124733 (not c!104877)) b!1036391))

(assert (= (and b!1036391 c!104880) b!1036384))

(assert (= (and b!1036391 (not c!104880)) b!1036380))

(assert (= (or b!1036384 b!1036380) bm!43842))

(assert (= (and d!124733 res!691767) b!1036390))

(assert (= (and b!1036390 res!691766) b!1036381))

(assert (= (and b!1036381 res!691769) b!1036382))

(assert (= (and b!1036381 c!104878) b!1036385))

(assert (= (and b!1036381 (not c!104878)) b!1036383))

(assert (= (and b!1036385 res!691768) b!1036386))

(assert (= (and b!1036383 c!104879) b!1036387))

(assert (= (and b!1036383 (not c!104879)) b!1036389))

(declare-fun b_lambda!16113 () Bool)

(assert (=> (not b_lambda!16113) (not b!1036384)))

(assert (=> b!1036384 t!31154))

(declare-fun b_and!33375 () Bool)

(assert (= b_and!33373 (and (=> t!31154 result!14419) b_and!33375)))

(declare-fun b_lambda!16115 () Bool)

(assert (=> (not b_lambda!16115) (not b!1036386)))

(assert (=> b!1036386 t!31154))

(declare-fun b_and!33377 () Bool)

(assert (= b_and!33375 (and (=> t!31154 result!14419) b_and!33377)))

(declare-fun m!956009 () Bool)

(assert (=> b!1036389 m!956009))

(declare-fun m!956011 () Bool)

(assert (=> b!1036387 m!956011))

(declare-fun m!956013 () Bool)

(assert (=> b!1036390 m!956013))

(declare-fun m!956015 () Bool)

(assert (=> b!1036391 m!956015))

(assert (=> b!1036391 m!956015))

(declare-fun m!956017 () Bool)

(assert (=> b!1036391 m!956017))

(assert (=> b!1036386 m!955071))

(declare-fun m!956019 () Bool)

(assert (=> b!1036386 m!956019))

(assert (=> b!1036386 m!956015))

(assert (=> b!1036386 m!956019))

(assert (=> b!1036386 m!955071))

(declare-fun m!956021 () Bool)

(assert (=> b!1036386 m!956021))

(assert (=> b!1036386 m!956015))

(declare-fun m!956023 () Bool)

(assert (=> b!1036386 m!956023))

(declare-fun m!956025 () Bool)

(assert (=> d!124733 m!956025))

(assert (=> d!124733 m!955077))

(declare-fun m!956027 () Bool)

(assert (=> b!1036384 m!956027))

(assert (=> b!1036384 m!955071))

(assert (=> b!1036384 m!956027))

(declare-fun m!956029 () Bool)

(assert (=> b!1036384 m!956029))

(assert (=> b!1036384 m!956015))

(assert (=> b!1036384 m!956019))

(assert (=> b!1036384 m!955071))

(assert (=> b!1036384 m!956021))

(declare-fun m!956031 () Bool)

(assert (=> b!1036384 m!956031))

(assert (=> b!1036384 m!956019))

(declare-fun m!956033 () Bool)

(assert (=> b!1036384 m!956033))

(assert (=> b!1036382 m!956015))

(assert (=> b!1036382 m!956015))

(assert (=> b!1036382 m!956017))

(assert (=> bm!43842 m!956011))

(assert (=> b!1036385 m!956015))

(assert (=> b!1036385 m!956015))

(declare-fun m!956035 () Bool)

(assert (=> b!1036385 m!956035))

(assert (=> bm!43809 d!124733))

(declare-fun d!124735 () Bool)

(declare-fun e!586138 () Bool)

(assert (=> d!124735 e!586138))

(declare-fun res!691770 () Bool)

(assert (=> d!124735 (=> res!691770 e!586138)))

(declare-fun lt!456992 () Bool)

(assert (=> d!124735 (= res!691770 (not lt!456992))))

(declare-fun lt!456991 () Bool)

(assert (=> d!124735 (= lt!456992 lt!456991)))

(declare-fun lt!456994 () Unit!33774)

(declare-fun e!586139 () Unit!33774)

(assert (=> d!124735 (= lt!456994 e!586139)))

(declare-fun c!104881 () Bool)

(assert (=> d!124735 (= c!104881 lt!456991)))

(assert (=> d!124735 (= lt!456991 (containsKey!564 (toList!6932 lt!456819) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124735 (= (contains!6001 lt!456819 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456992)))

(declare-fun b!1036392 () Bool)

(declare-fun lt!456993 () Unit!33774)

(assert (=> b!1036392 (= e!586139 lt!456993)))

(assert (=> b!1036392 (= lt!456993 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456819) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036392 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456819) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036393 () Bool)

(declare-fun Unit!33800 () Unit!33774)

(assert (=> b!1036393 (= e!586139 Unit!33800)))

(declare-fun b!1036394 () Bool)

(assert (=> b!1036394 (= e!586138 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124735 c!104881) b!1036392))

(assert (= (and d!124735 (not c!104881)) b!1036393))

(assert (= (and d!124735 (not res!691770)) b!1036394))

(declare-fun m!956037 () Bool)

(assert (=> d!124735 m!956037))

(declare-fun m!956039 () Bool)

(assert (=> b!1036392 m!956039))

(declare-fun m!956041 () Bool)

(assert (=> b!1036392 m!956041))

(assert (=> b!1036392 m!956041))

(declare-fun m!956043 () Bool)

(assert (=> b!1036392 m!956043))

(assert (=> b!1036394 m!956041))

(assert (=> b!1036394 m!956041))

(assert (=> b!1036394 m!956043))

(assert (=> b!1036040 d!124735))

(declare-fun d!124737 () Bool)

(assert (=> d!124737 (= (isDefined!439 (getValueByKey!591 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30322 () Bool)

(assert (= bs!30322 d!124737))

(assert (=> bs!30322 m!955401))

(declare-fun m!956045 () Bool)

(assert (=> bs!30322 m!956045))

(assert (=> b!1036013 d!124737))

(declare-fun d!124739 () Bool)

(declare-fun c!104882 () Bool)

(assert (=> d!124739 (= c!104882 (and ((_ is Cons!21948) (toList!6932 lt!456693)) (= (_1!7916 (h!23150 (toList!6932 lt!456693))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586140 () Option!642)

(assert (=> d!124739 (= (getValueByKey!591 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000) e!586140)))

(declare-fun b!1036398 () Bool)

(declare-fun e!586141 () Option!642)

(assert (=> b!1036398 (= e!586141 None!640)))

(declare-fun b!1036395 () Bool)

(assert (=> b!1036395 (= e!586140 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456693)))))))

(declare-fun b!1036396 () Bool)

(assert (=> b!1036396 (= e!586140 e!586141)))

(declare-fun c!104883 () Bool)

(assert (=> b!1036396 (= c!104883 (and ((_ is Cons!21948) (toList!6932 lt!456693)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456693))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036397 () Bool)

(assert (=> b!1036397 (= e!586141 (getValueByKey!591 (t!31148 (toList!6932 lt!456693)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124739 c!104882) b!1036395))

(assert (= (and d!124739 (not c!104882)) b!1036396))

(assert (= (and b!1036396 c!104883) b!1036397))

(assert (= (and b!1036396 (not c!104883)) b!1036398))

(declare-fun m!956047 () Bool)

(assert (=> b!1036397 m!956047))

(assert (=> b!1036013 d!124739))

(declare-fun d!124741 () Bool)

(assert (=> d!124741 (= (isEmpty!934 lt!456772) (isEmpty!936 (toList!6932 lt!456772)))))

(declare-fun bs!30323 () Bool)

(assert (= bs!30323 d!124741))

(declare-fun m!956049 () Bool)

(assert (=> bs!30323 m!956049))

(assert (=> b!1035980 d!124741))

(declare-fun d!124743 () Bool)

(declare-fun e!586142 () Bool)

(assert (=> d!124743 e!586142))

(declare-fun res!691771 () Bool)

(assert (=> d!124743 (=> res!691771 e!586142)))

(declare-fun lt!456996 () Bool)

(assert (=> d!124743 (= res!691771 (not lt!456996))))

(declare-fun lt!456995 () Bool)

(assert (=> d!124743 (= lt!456996 lt!456995)))

(declare-fun lt!456998 () Unit!33774)

(declare-fun e!586143 () Unit!33774)

(assert (=> d!124743 (= lt!456998 e!586143)))

(declare-fun c!104884 () Bool)

(assert (=> d!124743 (= c!104884 lt!456995)))

(assert (=> d!124743 (= lt!456995 (containsKey!564 (toList!6932 lt!456744) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124743 (= (contains!6001 lt!456744 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!456996)))

(declare-fun b!1036399 () Bool)

(declare-fun lt!456997 () Unit!33774)

(assert (=> b!1036399 (= e!586143 lt!456997)))

(assert (=> b!1036399 (= lt!456997 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456744) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1036399 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456744) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036400 () Bool)

(declare-fun Unit!33801 () Unit!33774)

(assert (=> b!1036400 (= e!586143 Unit!33801)))

(declare-fun b!1036401 () Bool)

(assert (=> b!1036401 (= e!586142 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456744) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!124743 c!104884) b!1036399))

(assert (= (and d!124743 (not c!104884)) b!1036400))

(assert (= (and d!124743 (not res!691771)) b!1036401))

(declare-fun m!956051 () Bool)

(assert (=> d!124743 m!956051))

(declare-fun m!956053 () Bool)

(assert (=> b!1036399 m!956053))

(assert (=> b!1036399 m!955285))

(assert (=> b!1036399 m!955285))

(declare-fun m!956055 () Bool)

(assert (=> b!1036399 m!956055))

(assert (=> b!1036401 m!955285))

(assert (=> b!1036401 m!955285))

(assert (=> b!1036401 m!956055))

(assert (=> d!124455 d!124743))

(declare-fun d!124745 () Bool)

(declare-fun c!104885 () Bool)

(assert (=> d!124745 (= c!104885 (and ((_ is Cons!21948) lt!456745) (= (_1!7916 (h!23150 lt!456745)) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586144 () Option!642)

(assert (=> d!124745 (= (getValueByKey!591 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) e!586144)))

(declare-fun b!1036405 () Bool)

(declare-fun e!586145 () Option!642)

(assert (=> b!1036405 (= e!586145 None!640)))

(declare-fun b!1036402 () Bool)

(assert (=> b!1036402 (= e!586144 (Some!641 (_2!7916 (h!23150 lt!456745))))))

(declare-fun b!1036403 () Bool)

(assert (=> b!1036403 (= e!586144 e!586145)))

(declare-fun c!104886 () Bool)

(assert (=> b!1036403 (= c!104886 (and ((_ is Cons!21948) lt!456745) (not (= (_1!7916 (h!23150 lt!456745)) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036404 () Bool)

(assert (=> b!1036404 (= e!586145 (getValueByKey!591 (t!31148 lt!456745) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124745 c!104885) b!1036402))

(assert (= (and d!124745 (not c!104885)) b!1036403))

(assert (= (and b!1036403 c!104886) b!1036404))

(assert (= (and b!1036403 (not c!104886)) b!1036405))

(declare-fun m!956057 () Bool)

(assert (=> b!1036404 m!956057))

(assert (=> d!124455 d!124745))

(declare-fun d!124747 () Bool)

(assert (=> d!124747 (= (getValueByKey!591 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!456999 () Unit!33774)

(assert (=> d!124747 (= lt!456999 (choose!1714 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!586146 () Bool)

(assert (=> d!124747 e!586146))

(declare-fun res!691772 () Bool)

(assert (=> d!124747 (=> (not res!691772) (not e!586146))))

(assert (=> d!124747 (= res!691772 (isStrictlySorted!715 lt!456745))))

(assert (=> d!124747 (= (lemmaContainsTupThenGetReturnValue!281 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!456999)))

(declare-fun b!1036406 () Bool)

(declare-fun res!691773 () Bool)

(assert (=> b!1036406 (=> (not res!691773) (not e!586146))))

(assert (=> b!1036406 (= res!691773 (containsKey!564 lt!456745 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036407 () Bool)

(assert (=> b!1036407 (= e!586146 (contains!6002 lt!456745 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!124747 res!691772) b!1036406))

(assert (= (and b!1036406 res!691773) b!1036407))

(assert (=> d!124747 m!955279))

(declare-fun m!956059 () Bool)

(assert (=> d!124747 m!956059))

(declare-fun m!956061 () Bool)

(assert (=> d!124747 m!956061))

(declare-fun m!956063 () Bool)

(assert (=> b!1036406 m!956063))

(declare-fun m!956065 () Bool)

(assert (=> b!1036407 m!956065))

(assert (=> d!124455 d!124747))

(declare-fun b!1036408 () Bool)

(declare-fun e!586149 () List!21952)

(declare-fun call!43846 () List!21952)

(assert (=> b!1036408 (= e!586149 call!43846)))

(declare-fun b!1036409 () Bool)

(declare-fun e!586148 () List!21952)

(declare-fun call!43847 () List!21952)

(assert (=> b!1036409 (= e!586148 call!43847)))

(declare-fun b!1036410 () Bool)

(declare-fun res!691774 () Bool)

(declare-fun e!586150 () Bool)

(assert (=> b!1036410 (=> (not res!691774) (not e!586150))))

(declare-fun lt!457000 () List!21952)

(assert (=> b!1036410 (= res!691774 (containsKey!564 lt!457000 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036411 () Bool)

(assert (=> b!1036411 (= e!586149 e!586148)))

(declare-fun c!104888 () Bool)

(assert (=> b!1036411 (= c!104888 (and ((_ is Cons!21948) (toList!6932 lt!456664)) (= (_1!7916 (h!23150 (toList!6932 lt!456664))) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43843 () Bool)

(assert (=> bm!43843 (= call!43847 call!43846)))

(declare-fun b!1036412 () Bool)

(declare-fun e!586147 () List!21952)

(declare-fun call!43848 () List!21952)

(assert (=> b!1036412 (= e!586147 call!43848)))

(declare-fun b!1036413 () Bool)

(declare-fun e!586151 () List!21952)

(declare-fun c!104890 () Bool)

(assert (=> b!1036413 (= e!586151 (ite c!104888 (t!31148 (toList!6932 lt!456664)) (ite c!104890 (Cons!21948 (h!23150 (toList!6932 lt!456664)) (t!31148 (toList!6932 lt!456664))) Nil!21949)))))

(declare-fun b!1036414 () Bool)

(assert (=> b!1036414 (= e!586147 call!43848)))

(declare-fun bm!43844 () Bool)

(declare-fun c!104887 () Bool)

(assert (=> bm!43844 (= call!43846 ($colon$colon!605 e!586151 (ite c!104887 (h!23150 (toList!6932 lt!456664)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!104889 () Bool)

(assert (=> bm!43844 (= c!104889 c!104887)))

(declare-fun bm!43845 () Bool)

(assert (=> bm!43845 (= call!43848 call!43847)))

(declare-fun b!1036415 () Bool)

(assert (=> b!1036415 (= e!586151 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456664)) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036416 () Bool)

(assert (=> b!1036416 (= e!586150 (contains!6002 lt!457000 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(declare-fun d!124749 () Bool)

(assert (=> d!124749 e!586150))

(declare-fun res!691775 () Bool)

(assert (=> d!124749 (=> (not res!691775) (not e!586150))))

(assert (=> d!124749 (= res!691775 (isStrictlySorted!715 lt!457000))))

(assert (=> d!124749 (= lt!457000 e!586149)))

(assert (=> d!124749 (= c!104887 (and ((_ is Cons!21948) (toList!6932 lt!456664)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456664))) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!124749 (isStrictlySorted!715 (toList!6932 lt!456664))))

(assert (=> d!124749 (= (insertStrictlySorted!374 (toList!6932 lt!456664) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!457000)))

(declare-fun b!1036417 () Bool)

(assert (=> b!1036417 (= c!104890 (and ((_ is Cons!21948) (toList!6932 lt!456664)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456664))) (_1!7916 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))

(assert (=> b!1036417 (= e!586148 e!586147)))

(assert (= (and d!124749 c!104887) b!1036408))

(assert (= (and d!124749 (not c!104887)) b!1036411))

(assert (= (and b!1036411 c!104888) b!1036409))

(assert (= (and b!1036411 (not c!104888)) b!1036417))

(assert (= (and b!1036417 c!104890) b!1036412))

(assert (= (and b!1036417 (not c!104890)) b!1036414))

(assert (= (or b!1036412 b!1036414) bm!43845))

(assert (= (or b!1036409 bm!43845) bm!43843))

(assert (= (or b!1036408 bm!43843) bm!43844))

(assert (= (and bm!43844 c!104889) b!1036415))

(assert (= (and bm!43844 (not c!104889)) b!1036413))

(assert (= (and d!124749 res!691775) b!1036410))

(assert (= (and b!1036410 res!691774) b!1036416))

(declare-fun m!956067 () Bool)

(assert (=> b!1036416 m!956067))

(declare-fun m!956069 () Bool)

(assert (=> b!1036410 m!956069))

(declare-fun m!956071 () Bool)

(assert (=> b!1036415 m!956071))

(declare-fun m!956073 () Bool)

(assert (=> bm!43844 m!956073))

(declare-fun m!956075 () Bool)

(assert (=> d!124749 m!956075))

(declare-fun m!956077 () Bool)

(assert (=> d!124749 m!956077))

(assert (=> d!124455 d!124749))

(assert (=> d!124475 d!124459))

(declare-fun d!124751 () Bool)

(declare-fun e!586152 () Bool)

(assert (=> d!124751 e!586152))

(declare-fun res!691776 () Bool)

(assert (=> d!124751 (=> res!691776 e!586152)))

(declare-fun lt!457002 () Bool)

(assert (=> d!124751 (= res!691776 (not lt!457002))))

(declare-fun lt!457001 () Bool)

(assert (=> d!124751 (= lt!457002 lt!457001)))

(declare-fun lt!457004 () Unit!33774)

(declare-fun e!586153 () Unit!33774)

(assert (=> d!124751 (= lt!457004 e!586153)))

(declare-fun c!104891 () Bool)

(assert (=> d!124751 (= c!104891 lt!457001)))

(assert (=> d!124751 (= lt!457001 (containsKey!564 (toList!6932 lt!456659) lt!456665))))

(assert (=> d!124751 (= (contains!6001 lt!456659 lt!456665) lt!457002)))

(declare-fun b!1036418 () Bool)

(declare-fun lt!457003 () Unit!33774)

(assert (=> b!1036418 (= e!586153 lt!457003)))

(assert (=> b!1036418 (= lt!457003 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456659) lt!456665))))

(assert (=> b!1036418 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456659) lt!456665))))

(declare-fun b!1036419 () Bool)

(declare-fun Unit!33802 () Unit!33774)

(assert (=> b!1036419 (= e!586153 Unit!33802)))

(declare-fun b!1036420 () Bool)

(assert (=> b!1036420 (= e!586152 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456659) lt!456665)))))

(assert (= (and d!124751 c!104891) b!1036418))

(assert (= (and d!124751 (not c!104891)) b!1036419))

(assert (= (and d!124751 (not res!691776)) b!1036420))

(declare-fun m!956079 () Bool)

(assert (=> d!124751 m!956079))

(declare-fun m!956081 () Bool)

(assert (=> b!1036418 m!956081))

(assert (=> b!1036418 m!955337))

(assert (=> b!1036418 m!955337))

(declare-fun m!956083 () Bool)

(assert (=> b!1036418 m!956083))

(assert (=> b!1036420 m!955337))

(assert (=> b!1036420 m!955337))

(assert (=> b!1036420 m!956083))

(assert (=> d!124475 d!124751))

(assert (=> d!124475 d!124465))

(assert (=> d!124475 d!124473))

(declare-fun d!124753 () Bool)

(assert (=> d!124753 (= (apply!900 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)) lt!456665) (apply!900 lt!456659 lt!456665))))

(assert (=> d!124753 true))

(declare-fun _$34!1173 () Unit!33774)

(assert (=> d!124753 (= (choose!1711 lt!456659 lt!456649 lt!456582 lt!456665) _$34!1173)))

(declare-fun bs!30324 () Bool)

(assert (= bs!30324 d!124753))

(assert (=> bs!30324 m!955099))

(assert (=> bs!30324 m!955099))

(assert (=> bs!30324 m!955109))

(assert (=> bs!30324 m!955103))

(assert (=> d!124475 d!124753))

(declare-fun d!124755 () Bool)

(declare-fun lt!457007 () Bool)

(declare-fun content!515 (List!21953) (InoxSet (_ BitVec 64)))

(assert (=> d!124755 (= lt!457007 (select (content!515 Nil!21950) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun e!586159 () Bool)

(assert (=> d!124755 (= lt!457007 e!586159)))

(declare-fun res!691782 () Bool)

(assert (=> d!124755 (=> (not res!691782) (not e!586159))))

(assert (=> d!124755 (= res!691782 ((_ is Cons!21949) Nil!21950))))

(assert (=> d!124755 (= (contains!6003 Nil!21950 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) lt!457007)))

(declare-fun b!1036425 () Bool)

(declare-fun e!586158 () Bool)

(assert (=> b!1036425 (= e!586159 e!586158)))

(declare-fun res!691781 () Bool)

(assert (=> b!1036425 (=> res!691781 e!586158)))

(assert (=> b!1036425 (= res!691781 (= (h!23151 Nil!21950) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036426 () Bool)

(assert (=> b!1036426 (= e!586158 (contains!6003 (t!31155 Nil!21950) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (= (and d!124755 res!691782) b!1036425))

(assert (= (and b!1036425 (not res!691781)) b!1036426))

(declare-fun m!956085 () Bool)

(assert (=> d!124755 m!956085))

(assert (=> d!124755 m!955545))

(declare-fun m!956087 () Bool)

(assert (=> d!124755 m!956087))

(assert (=> b!1036426 m!955545))

(declare-fun m!956089 () Bool)

(assert (=> b!1036426 m!956089))

(assert (=> b!1036106 d!124755))

(declare-fun bm!43846 () Bool)

(declare-fun call!43849 () Bool)

(assert (=> bm!43846 (= call!43849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11454 lt!456581) (mask!30165 lt!456581)))))

(declare-fun b!1036427 () Bool)

(declare-fun e!586162 () Bool)

(declare-fun e!586161 () Bool)

(assert (=> b!1036427 (= e!586162 e!586161)))

(declare-fun lt!457008 () (_ BitVec 64))

(assert (=> b!1036427 (= lt!457008 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457009 () Unit!33774)

(assert (=> b!1036427 (= lt!457009 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11454 lt!456581) lt!457008 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036427 (arrayContainsKey!0 (_keys!11454 lt!456581) lt!457008 #b00000000000000000000000000000000)))

(declare-fun lt!457010 () Unit!33774)

(assert (=> b!1036427 (= lt!457010 lt!457009)))

(declare-fun res!691784 () Bool)

(assert (=> b!1036427 (= res!691784 (= (seekEntryOrOpen!0 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11454 lt!456581) (mask!30165 lt!456581)) (Found!9737 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036427 (=> (not res!691784) (not e!586161))))

(declare-fun b!1036428 () Bool)

(declare-fun e!586160 () Bool)

(assert (=> b!1036428 (= e!586160 e!586162)))

(declare-fun c!104892 () Bool)

(assert (=> b!1036428 (= c!104892 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036429 () Bool)

(assert (=> b!1036429 (= e!586162 call!43849)))

(declare-fun d!124757 () Bool)

(declare-fun res!691783 () Bool)

(assert (=> d!124757 (=> res!691783 e!586160)))

(assert (=> d!124757 (= res!691783 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124757 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11454 lt!456581) (mask!30165 lt!456581)) e!586160)))

(declare-fun b!1036430 () Bool)

(assert (=> b!1036430 (= e!586161 call!43849)))

(assert (= (and d!124757 (not res!691783)) b!1036428))

(assert (= (and b!1036428 c!104892) b!1036427))

(assert (= (and b!1036428 (not c!104892)) b!1036429))

(assert (= (and b!1036427 res!691784) b!1036430))

(assert (= (or b!1036430 b!1036429) bm!43846))

(declare-fun m!956091 () Bool)

(assert (=> bm!43846 m!956091))

(assert (=> b!1036427 m!955879))

(declare-fun m!956093 () Bool)

(assert (=> b!1036427 m!956093))

(declare-fun m!956095 () Bool)

(assert (=> b!1036427 m!956095))

(assert (=> b!1036427 m!955879))

(declare-fun m!956097 () Bool)

(assert (=> b!1036427 m!956097))

(assert (=> b!1036428 m!955879))

(assert (=> b!1036428 m!955879))

(assert (=> b!1036428 m!955881))

(assert (=> bm!43824 d!124757))

(declare-fun d!124759 () Bool)

(assert (=> d!124759 (= (apply!900 lt!456819 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16459 (getValueByKey!591 (toList!6932 lt!456819) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30325 () Bool)

(assert (= bs!30325 d!124759))

(assert (=> bs!30325 m!955067))

(assert (=> bs!30325 m!955961))

(assert (=> bs!30325 m!955961))

(declare-fun m!956099 () Bool)

(assert (=> bs!30325 m!956099))

(assert (=> b!1036036 d!124759))

(assert (=> b!1036036 d!124487))

(assert (=> b!1036112 d!124605))

(assert (=> b!1036112 d!124607))

(declare-fun c!104893 () Bool)

(declare-fun d!124761 () Bool)

(assert (=> d!124761 (= c!104893 (and ((_ is Cons!21948) (toList!6932 lt!456881)) (= (_1!7916 (h!23150 (toList!6932 lt!456881))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun e!586163 () Option!642)

(assert (=> d!124761 (= (getValueByKey!591 (toList!6932 lt!456881) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) e!586163)))

(declare-fun b!1036434 () Bool)

(declare-fun e!586164 () Option!642)

(assert (=> b!1036434 (= e!586164 None!640)))

(declare-fun b!1036431 () Bool)

(assert (=> b!1036431 (= e!586163 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456881)))))))

(declare-fun b!1036432 () Bool)

(assert (=> b!1036432 (= e!586163 e!586164)))

(declare-fun c!104894 () Bool)

(assert (=> b!1036432 (= c!104894 (and ((_ is Cons!21948) (toList!6932 lt!456881)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456881))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))))

(declare-fun b!1036433 () Bool)

(assert (=> b!1036433 (= e!586164 (getValueByKey!591 (t!31148 (toList!6932 lt!456881)) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124761 c!104893) b!1036431))

(assert (= (and d!124761 (not c!104893)) b!1036432))

(assert (= (and b!1036432 c!104894) b!1036433))

(assert (= (and b!1036432 (not c!104894)) b!1036434))

(declare-fun m!956101 () Bool)

(assert (=> b!1036433 m!956101))

(assert (=> b!1036121 d!124761))

(declare-fun d!124763 () Bool)

(declare-fun e!586165 () Bool)

(assert (=> d!124763 e!586165))

(declare-fun res!691785 () Bool)

(assert (=> d!124763 (=> res!691785 e!586165)))

(declare-fun lt!457012 () Bool)

(assert (=> d!124763 (= res!691785 (not lt!457012))))

(declare-fun lt!457011 () Bool)

(assert (=> d!124763 (= lt!457012 lt!457011)))

(declare-fun lt!457014 () Unit!33774)

(declare-fun e!586166 () Unit!33774)

(assert (=> d!124763 (= lt!457014 e!586166)))

(declare-fun c!104895 () Bool)

(assert (=> d!124763 (= c!104895 lt!457011)))

(assert (=> d!124763 (= lt!457011 (containsKey!564 (toList!6932 lt!456824) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (=> d!124763 (= (contains!6001 lt!456824 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!457012)))

(declare-fun b!1036435 () Bool)

(declare-fun lt!457013 () Unit!33774)

(assert (=> b!1036435 (= e!586166 lt!457013)))

(assert (=> b!1036435 (= lt!457013 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456824) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (=> b!1036435 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456824) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036436 () Bool)

(declare-fun Unit!33803 () Unit!33774)

(assert (=> b!1036436 (= e!586166 Unit!33803)))

(declare-fun b!1036437 () Bool)

(assert (=> b!1036437 (= e!586165 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456824) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124763 c!104895) b!1036435))

(assert (= (and d!124763 (not c!104895)) b!1036436))

(assert (= (and d!124763 (not res!691785)) b!1036437))

(declare-fun m!956103 () Bool)

(assert (=> d!124763 m!956103))

(declare-fun m!956105 () Bool)

(assert (=> b!1036435 m!956105))

(assert (=> b!1036435 m!955519))

(assert (=> b!1036435 m!955519))

(declare-fun m!956107 () Bool)

(assert (=> b!1036435 m!956107))

(assert (=> b!1036437 m!955519))

(assert (=> b!1036437 m!955519))

(assert (=> b!1036437 m!956107))

(assert (=> d!124523 d!124763))

(declare-fun d!124765 () Bool)

(declare-fun c!104896 () Bool)

(assert (=> d!124765 (= c!104896 (and ((_ is Cons!21948) lt!456825) (= (_1!7916 (h!23150 lt!456825)) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(declare-fun e!586167 () Option!642)

(assert (=> d!124765 (= (getValueByKey!591 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) e!586167)))

(declare-fun b!1036441 () Bool)

(declare-fun e!586168 () Option!642)

(assert (=> b!1036441 (= e!586168 None!640)))

(declare-fun b!1036438 () Bool)

(assert (=> b!1036438 (= e!586167 (Some!641 (_2!7916 (h!23150 lt!456825))))))

(declare-fun b!1036439 () Bool)

(assert (=> b!1036439 (= e!586167 e!586168)))

(declare-fun c!104897 () Bool)

(assert (=> b!1036439 (= c!104897 (and ((_ is Cons!21948) lt!456825) (not (= (_1!7916 (h!23150 lt!456825)) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036440 () Bool)

(assert (=> b!1036440 (= e!586168 (getValueByKey!591 (t!31148 lt!456825) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124765 c!104896) b!1036438))

(assert (= (and d!124765 (not c!104896)) b!1036439))

(assert (= (and b!1036439 c!104897) b!1036440))

(assert (= (and b!1036439 (not c!104897)) b!1036441))

(declare-fun m!956109 () Bool)

(assert (=> b!1036440 m!956109))

(assert (=> d!124523 d!124765))

(declare-fun d!124767 () Bool)

(assert (=> d!124767 (= (getValueByKey!591 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457015 () Unit!33774)

(assert (=> d!124767 (= lt!457015 (choose!1714 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun e!586169 () Bool)

(assert (=> d!124767 e!586169))

(declare-fun res!691786 () Bool)

(assert (=> d!124767 (=> (not res!691786) (not e!586169))))

(assert (=> d!124767 (= res!691786 (isStrictlySorted!715 lt!456825))))

(assert (=> d!124767 (= (lemmaContainsTupThenGetReturnValue!281 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!457015)))

(declare-fun b!1036442 () Bool)

(declare-fun res!691787 () Bool)

(assert (=> b!1036442 (=> (not res!691787) (not e!586169))))

(assert (=> b!1036442 (= res!691787 (containsKey!564 lt!456825 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036443 () Bool)

(assert (=> b!1036443 (= e!586169 (contains!6002 lt!456825 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124767 res!691786) b!1036442))

(assert (= (and b!1036442 res!691787) b!1036443))

(assert (=> d!124767 m!955513))

(declare-fun m!956111 () Bool)

(assert (=> d!124767 m!956111))

(declare-fun m!956113 () Bool)

(assert (=> d!124767 m!956113))

(declare-fun m!956115 () Bool)

(assert (=> b!1036442 m!956115))

(declare-fun m!956117 () Bool)

(assert (=> b!1036443 m!956117))

(assert (=> d!124523 d!124767))

(declare-fun b!1036444 () Bool)

(declare-fun e!586172 () List!21952)

(declare-fun call!43850 () List!21952)

(assert (=> b!1036444 (= e!586172 call!43850)))

(declare-fun b!1036445 () Bool)

(declare-fun e!586171 () List!21952)

(declare-fun call!43851 () List!21952)

(assert (=> b!1036445 (= e!586171 call!43851)))

(declare-fun b!1036446 () Bool)

(declare-fun res!691788 () Bool)

(declare-fun e!586173 () Bool)

(assert (=> b!1036446 (=> (not res!691788) (not e!586173))))

(declare-fun lt!457016 () List!21952)

(assert (=> b!1036446 (= res!691788 (containsKey!564 lt!457016 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036447 () Bool)

(assert (=> b!1036447 (= e!586172 e!586171)))

(declare-fun c!104899 () Bool)

(assert (=> b!1036447 (= c!104899 (and ((_ is Cons!21948) (toList!6932 lt!456690)) (= (_1!7916 (h!23150 (toList!6932 lt!456690))) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43847 () Bool)

(assert (=> bm!43847 (= call!43851 call!43850)))

(declare-fun b!1036448 () Bool)

(declare-fun e!586170 () List!21952)

(declare-fun call!43852 () List!21952)

(assert (=> b!1036448 (= e!586170 call!43852)))

(declare-fun c!104901 () Bool)

(declare-fun b!1036449 () Bool)

(declare-fun e!586174 () List!21952)

(assert (=> b!1036449 (= e!586174 (ite c!104899 (t!31148 (toList!6932 lt!456690)) (ite c!104901 (Cons!21948 (h!23150 (toList!6932 lt!456690)) (t!31148 (toList!6932 lt!456690))) Nil!21949)))))

(declare-fun b!1036450 () Bool)

(assert (=> b!1036450 (= e!586170 call!43852)))

(declare-fun bm!43848 () Bool)

(declare-fun c!104898 () Bool)

(assert (=> bm!43848 (= call!43850 ($colon$colon!605 e!586174 (ite c!104898 (h!23150 (toList!6932 lt!456690)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))))

(declare-fun c!104900 () Bool)

(assert (=> bm!43848 (= c!104900 c!104898)))

(declare-fun bm!43849 () Bool)

(assert (=> bm!43849 (= call!43852 call!43851)))

(declare-fun b!1036451 () Bool)

(assert (=> b!1036451 (= e!586174 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456690)) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036452 () Bool)

(assert (=> b!1036452 (= e!586173 (contains!6002 lt!457016 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(declare-fun d!124769 () Bool)

(assert (=> d!124769 e!586173))

(declare-fun res!691789 () Bool)

(assert (=> d!124769 (=> (not res!691789) (not e!586173))))

(assert (=> d!124769 (= res!691789 (isStrictlySorted!715 lt!457016))))

(assert (=> d!124769 (= lt!457016 e!586172)))

(assert (=> d!124769 (= c!104898 (and ((_ is Cons!21948) (toList!6932 lt!456690)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456690))) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(assert (=> d!124769 (isStrictlySorted!715 (toList!6932 lt!456690))))

(assert (=> d!124769 (= (insertStrictlySorted!374 (toList!6932 lt!456690) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!457016)))

(declare-fun b!1036453 () Bool)

(assert (=> b!1036453 (= c!104901 (and ((_ is Cons!21948) (toList!6932 lt!456690)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456690))) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(assert (=> b!1036453 (= e!586171 e!586170)))

(assert (= (and d!124769 c!104898) b!1036444))

(assert (= (and d!124769 (not c!104898)) b!1036447))

(assert (= (and b!1036447 c!104899) b!1036445))

(assert (= (and b!1036447 (not c!104899)) b!1036453))

(assert (= (and b!1036453 c!104901) b!1036448))

(assert (= (and b!1036453 (not c!104901)) b!1036450))

(assert (= (or b!1036448 b!1036450) bm!43849))

(assert (= (or b!1036445 bm!43849) bm!43847))

(assert (= (or b!1036444 bm!43847) bm!43848))

(assert (= (and bm!43848 c!104900) b!1036451))

(assert (= (and bm!43848 (not c!104900)) b!1036449))

(assert (= (and d!124769 res!691789) b!1036446))

(assert (= (and b!1036446 res!691788) b!1036452))

(declare-fun m!956119 () Bool)

(assert (=> b!1036452 m!956119))

(declare-fun m!956121 () Bool)

(assert (=> b!1036446 m!956121))

(declare-fun m!956123 () Bool)

(assert (=> b!1036451 m!956123))

(declare-fun m!956125 () Bool)

(assert (=> bm!43848 m!956125))

(declare-fun m!956127 () Bool)

(assert (=> d!124769 m!956127))

(declare-fun m!956129 () Bool)

(assert (=> d!124769 m!956129))

(assert (=> d!124523 d!124769))

(declare-fun d!124771 () Bool)

(declare-fun lt!457017 () Bool)

(assert (=> d!124771 (= lt!457017 (select (content!514 (toList!6932 lt!456790)) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun e!586175 () Bool)

(assert (=> d!124771 (= lt!457017 e!586175)))

(declare-fun res!691790 () Bool)

(assert (=> d!124771 (=> (not res!691790) (not e!586175))))

(assert (=> d!124771 (= res!691790 ((_ is Cons!21948) (toList!6932 lt!456790)))))

(assert (=> d!124771 (= (contains!6002 (toList!6932 lt!456790) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) lt!457017)))

(declare-fun b!1036454 () Bool)

(declare-fun e!586176 () Bool)

(assert (=> b!1036454 (= e!586175 e!586176)))

(declare-fun res!691791 () Bool)

(assert (=> b!1036454 (=> res!691791 e!586176)))

(assert (=> b!1036454 (= res!691791 (= (h!23150 (toList!6932 lt!456790)) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(declare-fun b!1036455 () Bool)

(assert (=> b!1036455 (= e!586176 (contains!6002 (t!31148 (toList!6932 lt!456790)) (ite (or c!104723 c!104721) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (= (and d!124771 res!691790) b!1036454))

(assert (= (and b!1036454 (not res!691791)) b!1036455))

(declare-fun m!956131 () Bool)

(assert (=> d!124771 m!956131))

(declare-fun m!956133 () Bool)

(assert (=> d!124771 m!956133))

(declare-fun m!956135 () Bool)

(assert (=> b!1036455 m!956135))

(assert (=> b!1036010 d!124771))

(assert (=> b!1036000 d!124477))

(declare-fun d!124773 () Bool)

(declare-fun c!104902 () Bool)

(assert (=> d!124773 (= c!104902 (and ((_ is Cons!21948) (toList!6932 lt!456726)) (= (_1!7916 (h!23150 (toList!6932 lt!456726))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))))

(declare-fun e!586177 () Option!642)

(assert (=> d!124773 (= (getValueByKey!591 (toList!6932 lt!456726) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))) e!586177)))

(declare-fun b!1036459 () Bool)

(declare-fun e!586178 () Option!642)

(assert (=> b!1036459 (= e!586178 None!640)))

(declare-fun b!1036456 () Bool)

(assert (=> b!1036456 (= e!586177 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456726)))))))

(declare-fun b!1036457 () Bool)

(assert (=> b!1036457 (= e!586177 e!586178)))

(declare-fun c!104903 () Bool)

(assert (=> b!1036457 (= c!104903 (and ((_ is Cons!21948) (toList!6932 lt!456726)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456726))) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))))

(declare-fun b!1036458 () Bool)

(assert (=> b!1036458 (= e!586178 (getValueByKey!591 (t!31148 (toList!6932 lt!456726)) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582))))))

(assert (= (and d!124773 c!104902) b!1036456))

(assert (= (and d!124773 (not c!104902)) b!1036457))

(assert (= (and b!1036457 c!104903) b!1036458))

(assert (= (and b!1036457 (not c!104903)) b!1036459))

(declare-fun m!956137 () Bool)

(assert (=> b!1036458 m!956137))

(assert (=> b!1035929 d!124773))

(declare-fun d!124775 () Bool)

(declare-fun c!104904 () Bool)

(assert (=> d!124775 (= c!104904 (and ((_ is Cons!21948) (toList!6932 lt!456824)) (= (_1!7916 (h!23150 (toList!6932 lt!456824))) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))

(declare-fun e!586179 () Option!642)

(assert (=> d!124775 (= (getValueByKey!591 (toList!6932 lt!456824) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) e!586179)))

(declare-fun b!1036463 () Bool)

(declare-fun e!586180 () Option!642)

(assert (=> b!1036463 (= e!586180 None!640)))

(declare-fun b!1036460 () Bool)

(assert (=> b!1036460 (= e!586179 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456824)))))))

(declare-fun b!1036461 () Bool)

(assert (=> b!1036461 (= e!586179 e!586180)))

(declare-fun c!104905 () Bool)

(assert (=> b!1036461 (= c!104905 (and ((_ is Cons!21948) (toList!6932 lt!456824)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456824))) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036462 () Bool)

(assert (=> b!1036462 (= e!586180 (getValueByKey!591 (t!31148 (toList!6932 lt!456824)) (_1!7916 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124775 c!104904) b!1036460))

(assert (= (and d!124775 (not c!104904)) b!1036461))

(assert (= (and b!1036461 c!104905) b!1036462))

(assert (= (and b!1036461 (not c!104905)) b!1036463))

(declare-fun m!956139 () Bool)

(assert (=> b!1036462 m!956139))

(assert (=> b!1036042 d!124775))

(assert (=> d!124469 d!124449))

(assert (=> d!124469 d!124451))

(assert (=> d!124469 d!124453))

(declare-fun d!124777 () Bool)

(declare-fun e!586181 () Bool)

(assert (=> d!124777 e!586181))

(declare-fun res!691792 () Bool)

(assert (=> d!124777 (=> res!691792 e!586181)))

(declare-fun lt!457019 () Bool)

(assert (=> d!124777 (= res!691792 (not lt!457019))))

(declare-fun lt!457018 () Bool)

(assert (=> d!124777 (= lt!457019 lt!457018)))

(declare-fun lt!457021 () Unit!33774)

(declare-fun e!586182 () Unit!33774)

(assert (=> d!124777 (= lt!457021 e!586182)))

(declare-fun c!104906 () Bool)

(assert (=> d!124777 (= c!104906 lt!457018)))

(assert (=> d!124777 (= lt!457018 (containsKey!564 (toList!6932 lt!456668) lt!456658))))

(assert (=> d!124777 (= (contains!6001 lt!456668 lt!456658) lt!457019)))

(declare-fun b!1036464 () Bool)

(declare-fun lt!457020 () Unit!33774)

(assert (=> b!1036464 (= e!586182 lt!457020)))

(assert (=> b!1036464 (= lt!457020 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456668) lt!456658))))

(assert (=> b!1036464 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456668) lt!456658))))

(declare-fun b!1036465 () Bool)

(declare-fun Unit!33804 () Unit!33774)

(assert (=> b!1036465 (= e!586182 Unit!33804)))

(declare-fun b!1036466 () Bool)

(assert (=> b!1036466 (= e!586181 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456668) lt!456658)))))

(assert (= (and d!124777 c!104906) b!1036464))

(assert (= (and d!124777 (not c!104906)) b!1036465))

(assert (= (and d!124777 (not res!691792)) b!1036466))

(declare-fun m!956141 () Bool)

(assert (=> d!124777 m!956141))

(declare-fun m!956143 () Bool)

(assert (=> b!1036464 m!956143))

(assert (=> b!1036464 m!955273))

(assert (=> b!1036464 m!955273))

(declare-fun m!956145 () Bool)

(assert (=> b!1036464 m!956145))

(assert (=> b!1036466 m!955273))

(assert (=> b!1036466 m!955273))

(assert (=> b!1036466 m!956145))

(assert (=> d!124469 d!124777))

(declare-fun d!124779 () Bool)

(assert (=> d!124779 (= (apply!900 (+!3131 lt!456668 (tuple2!15811 lt!456652 lt!456582)) lt!456658) (apply!900 lt!456668 lt!456658))))

(assert (=> d!124779 true))

(declare-fun _$34!1174 () Unit!33774)

(assert (=> d!124779 (= (choose!1711 lt!456668 lt!456652 lt!456582 lt!456658) _$34!1174)))

(declare-fun bs!30326 () Bool)

(assert (= bs!30326 d!124779))

(assert (=> bs!30326 m!955097))

(assert (=> bs!30326 m!955097))

(assert (=> bs!30326 m!955111))

(assert (=> bs!30326 m!955115))

(assert (=> d!124469 d!124779))

(declare-fun d!124781 () Bool)

(assert (=> d!124781 (= (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654)) (not (isEmpty!935 (getValueByKey!591 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))))

(declare-fun bs!30327 () Bool)

(assert (= bs!30327 d!124781))

(assert (=> bs!30327 m!955353))

(declare-fun m!956147 () Bool)

(assert (=> bs!30327 m!956147))

(assert (=> b!1035986 d!124781))

(declare-fun d!124783 () Bool)

(declare-fun c!104907 () Bool)

(assert (=> d!124783 (= c!104907 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))) lt!456654)))))

(declare-fun e!586183 () Option!642)

(assert (=> d!124783 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654) e!586183)))

(declare-fun b!1036470 () Bool)

(declare-fun e!586184 () Option!642)

(assert (=> b!1036470 (= e!586184 None!640)))

(declare-fun b!1036467 () Bool)

(assert (=> b!1036467 (= e!586183 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))))

(declare-fun b!1036468 () Bool)

(assert (=> b!1036468 (= e!586183 e!586184)))

(declare-fun c!104908 () Bool)

(assert (=> b!1036468 (= c!104908 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))) lt!456654))))))

(declare-fun b!1036469 () Bool)

(assert (=> b!1036469 (= e!586184 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))) lt!456654))))

(assert (= (and d!124783 c!104907) b!1036467))

(assert (= (and d!124783 (not c!104907)) b!1036468))

(assert (= (and b!1036468 c!104908) b!1036469))

(assert (= (and b!1036468 (not c!104908)) b!1036470))

(declare-fun m!956149 () Bool)

(assert (=> b!1036469 m!956149))

(assert (=> b!1035986 d!124783))

(declare-fun d!124785 () Bool)

(declare-fun e!586185 () Bool)

(assert (=> d!124785 e!586185))

(declare-fun res!691793 () Bool)

(assert (=> d!124785 (=> res!691793 e!586185)))

(declare-fun lt!457023 () Bool)

(assert (=> d!124785 (= res!691793 (not lt!457023))))

(declare-fun lt!457022 () Bool)

(assert (=> d!124785 (= lt!457023 lt!457022)))

(declare-fun lt!457025 () Unit!33774)

(declare-fun e!586186 () Unit!33774)

(assert (=> d!124785 (= lt!457025 e!586186)))

(declare-fun c!104909 () Bool)

(assert (=> d!124785 (= c!104909 lt!457022)))

(assert (=> d!124785 (= lt!457022 (containsKey!564 (toList!6932 lt!456752) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (=> d!124785 (= (contains!6001 lt!456752 (_1!7916 (tuple2!15811 lt!456649 lt!456582))) lt!457023)))

(declare-fun b!1036471 () Bool)

(declare-fun lt!457024 () Unit!33774)

(assert (=> b!1036471 (= e!586186 lt!457024)))

(assert (=> b!1036471 (= lt!457024 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456752) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (=> b!1036471 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456752) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun b!1036472 () Bool)

(declare-fun Unit!33805 () Unit!33774)

(assert (=> b!1036472 (= e!586186 Unit!33805)))

(declare-fun b!1036473 () Bool)

(assert (=> b!1036473 (= e!586185 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456752) (_1!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(assert (= (and d!124785 c!104909) b!1036471))

(assert (= (and d!124785 (not c!104909)) b!1036472))

(assert (= (and d!124785 (not res!691793)) b!1036473))

(declare-fun m!956151 () Bool)

(assert (=> d!124785 m!956151))

(declare-fun m!956153 () Bool)

(assert (=> b!1036471 m!956153))

(assert (=> b!1036471 m!955309))

(assert (=> b!1036471 m!955309))

(declare-fun m!956155 () Bool)

(assert (=> b!1036471 m!956155))

(assert (=> b!1036473 m!955309))

(assert (=> b!1036473 m!955309))

(assert (=> b!1036473 m!956155))

(assert (=> d!124459 d!124785))

(declare-fun c!104910 () Bool)

(declare-fun d!124787 () Bool)

(assert (=> d!124787 (= c!104910 (and ((_ is Cons!21948) lt!456753) (= (_1!7916 (h!23150 lt!456753)) (_1!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(declare-fun e!586187 () Option!642)

(assert (=> d!124787 (= (getValueByKey!591 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582))) e!586187)))

(declare-fun b!1036477 () Bool)

(declare-fun e!586188 () Option!642)

(assert (=> b!1036477 (= e!586188 None!640)))

(declare-fun b!1036474 () Bool)

(assert (=> b!1036474 (= e!586187 (Some!641 (_2!7916 (h!23150 lt!456753))))))

(declare-fun b!1036475 () Bool)

(assert (=> b!1036475 (= e!586187 e!586188)))

(declare-fun c!104911 () Bool)

(assert (=> b!1036475 (= c!104911 (and ((_ is Cons!21948) lt!456753) (not (= (_1!7916 (h!23150 lt!456753)) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))))

(declare-fun b!1036476 () Bool)

(assert (=> b!1036476 (= e!586188 (getValueByKey!591 (t!31148 lt!456753) (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(assert (= (and d!124787 c!104910) b!1036474))

(assert (= (and d!124787 (not c!104910)) b!1036475))

(assert (= (and b!1036475 c!104911) b!1036476))

(assert (= (and b!1036475 (not c!104911)) b!1036477))

(declare-fun m!956157 () Bool)

(assert (=> b!1036476 m!956157))

(assert (=> d!124459 d!124787))

(declare-fun d!124789 () Bool)

(assert (=> d!124789 (= (getValueByKey!591 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun lt!457026 () Unit!33774)

(assert (=> d!124789 (= lt!457026 (choose!1714 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun e!586189 () Bool)

(assert (=> d!124789 e!586189))

(declare-fun res!691794 () Bool)

(assert (=> d!124789 (=> (not res!691794) (not e!586189))))

(assert (=> d!124789 (= res!691794 (isStrictlySorted!715 lt!456753))))

(assert (=> d!124789 (= (lemmaContainsTupThenGetReturnValue!281 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))) lt!457026)))

(declare-fun b!1036478 () Bool)

(declare-fun res!691795 () Bool)

(assert (=> b!1036478 (=> (not res!691795) (not e!586189))))

(assert (=> b!1036478 (= res!691795 (containsKey!564 lt!456753 (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun b!1036479 () Bool)

(assert (=> b!1036479 (= e!586189 (contains!6002 lt!456753 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(assert (= (and d!124789 res!691794) b!1036478))

(assert (= (and b!1036478 res!691795) b!1036479))

(assert (=> d!124789 m!955303))

(declare-fun m!956159 () Bool)

(assert (=> d!124789 m!956159))

(declare-fun m!956161 () Bool)

(assert (=> d!124789 m!956161))

(declare-fun m!956163 () Bool)

(assert (=> b!1036478 m!956163))

(declare-fun m!956165 () Bool)

(assert (=> b!1036479 m!956165))

(assert (=> d!124459 d!124789))

(declare-fun b!1036480 () Bool)

(declare-fun e!586192 () List!21952)

(declare-fun call!43853 () List!21952)

(assert (=> b!1036480 (= e!586192 call!43853)))

(declare-fun b!1036481 () Bool)

(declare-fun e!586191 () List!21952)

(declare-fun call!43854 () List!21952)

(assert (=> b!1036481 (= e!586191 call!43854)))

(declare-fun b!1036482 () Bool)

(declare-fun res!691796 () Bool)

(declare-fun e!586193 () Bool)

(assert (=> b!1036482 (=> (not res!691796) (not e!586193))))

(declare-fun lt!457027 () List!21952)

(assert (=> b!1036482 (= res!691796 (containsKey!564 lt!457027 (_1!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun b!1036483 () Bool)

(assert (=> b!1036483 (= e!586192 e!586191)))

(declare-fun c!104913 () Bool)

(assert (=> b!1036483 (= c!104913 (and ((_ is Cons!21948) (toList!6932 lt!456659)) (= (_1!7916 (h!23150 (toList!6932 lt!456659))) (_1!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(declare-fun bm!43850 () Bool)

(assert (=> bm!43850 (= call!43854 call!43853)))

(declare-fun b!1036484 () Bool)

(declare-fun e!586190 () List!21952)

(declare-fun call!43855 () List!21952)

(assert (=> b!1036484 (= e!586190 call!43855)))

(declare-fun c!104915 () Bool)

(declare-fun e!586194 () List!21952)

(declare-fun b!1036485 () Bool)

(assert (=> b!1036485 (= e!586194 (ite c!104913 (t!31148 (toList!6932 lt!456659)) (ite c!104915 (Cons!21948 (h!23150 (toList!6932 lt!456659)) (t!31148 (toList!6932 lt!456659))) Nil!21949)))))

(declare-fun b!1036486 () Bool)

(assert (=> b!1036486 (= e!586190 call!43855)))

(declare-fun c!104912 () Bool)

(declare-fun bm!43851 () Bool)

(assert (=> bm!43851 (= call!43853 ($colon$colon!605 e!586194 (ite c!104912 (h!23150 (toList!6932 lt!456659)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))))

(declare-fun c!104914 () Bool)

(assert (=> bm!43851 (= c!104914 c!104912)))

(declare-fun bm!43852 () Bool)

(assert (=> bm!43852 (= call!43855 call!43854)))

(declare-fun b!1036487 () Bool)

(assert (=> b!1036487 (= e!586194 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456659)) (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))))))

(declare-fun b!1036488 () Bool)

(assert (=> b!1036488 (= e!586193 (contains!6002 lt!457027 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(declare-fun d!124791 () Bool)

(assert (=> d!124791 e!586193))

(declare-fun res!691797 () Bool)

(assert (=> d!124791 (=> (not res!691797) (not e!586193))))

(assert (=> d!124791 (= res!691797 (isStrictlySorted!715 lt!457027))))

(assert (=> d!124791 (= lt!457027 e!586192)))

(assert (=> d!124791 (= c!104912 (and ((_ is Cons!21948) (toList!6932 lt!456659)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456659))) (_1!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(assert (=> d!124791 (isStrictlySorted!715 (toList!6932 lt!456659))))

(assert (=> d!124791 (= (insertStrictlySorted!374 (toList!6932 lt!456659) (_1!7916 (tuple2!15811 lt!456649 lt!456582)) (_2!7916 (tuple2!15811 lt!456649 lt!456582))) lt!457027)))

(declare-fun b!1036489 () Bool)

(assert (=> b!1036489 (= c!104915 (and ((_ is Cons!21948) (toList!6932 lt!456659)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456659))) (_1!7916 (tuple2!15811 lt!456649 lt!456582)))))))

(assert (=> b!1036489 (= e!586191 e!586190)))

(assert (= (and d!124791 c!104912) b!1036480))

(assert (= (and d!124791 (not c!104912)) b!1036483))

(assert (= (and b!1036483 c!104913) b!1036481))

(assert (= (and b!1036483 (not c!104913)) b!1036489))

(assert (= (and b!1036489 c!104915) b!1036484))

(assert (= (and b!1036489 (not c!104915)) b!1036486))

(assert (= (or b!1036484 b!1036486) bm!43852))

(assert (= (or b!1036481 bm!43852) bm!43850))

(assert (= (or b!1036480 bm!43850) bm!43851))

(assert (= (and bm!43851 c!104914) b!1036487))

(assert (= (and bm!43851 (not c!104914)) b!1036485))

(assert (= (and d!124791 res!691797) b!1036482))

(assert (= (and b!1036482 res!691796) b!1036488))

(declare-fun m!956167 () Bool)

(assert (=> b!1036488 m!956167))

(declare-fun m!956169 () Bool)

(assert (=> b!1036482 m!956169))

(declare-fun m!956171 () Bool)

(assert (=> b!1036487 m!956171))

(declare-fun m!956173 () Bool)

(assert (=> bm!43851 m!956173))

(declare-fun m!956175 () Bool)

(assert (=> d!124791 m!956175))

(declare-fun m!956177 () Bool)

(assert (=> d!124791 m!956177))

(assert (=> d!124459 d!124791))

(declare-fun d!124793 () Bool)

(declare-fun e!586195 () Bool)

(assert (=> d!124793 e!586195))

(declare-fun res!691798 () Bool)

(assert (=> d!124793 (=> res!691798 e!586195)))

(declare-fun lt!457029 () Bool)

(assert (=> d!124793 (= res!691798 (not lt!457029))))

(declare-fun lt!457028 () Bool)

(assert (=> d!124793 (= lt!457029 lt!457028)))

(declare-fun lt!457031 () Unit!33774)

(declare-fun e!586196 () Unit!33774)

(assert (=> d!124793 (= lt!457031 e!586196)))

(declare-fun c!104916 () Bool)

(assert (=> d!124793 (= c!104916 lt!457028)))

(assert (=> d!124793 (= lt!457028 (containsKey!564 (toList!6932 lt!456808) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (=> d!124793 (= (contains!6001 lt!456808 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!457029)))

(declare-fun b!1036490 () Bool)

(declare-fun lt!457030 () Unit!33774)

(assert (=> b!1036490 (= e!586196 lt!457030)))

(assert (=> b!1036490 (= lt!457030 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456808) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (=> b!1036490 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456808) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036491 () Bool)

(declare-fun Unit!33806 () Unit!33774)

(assert (=> b!1036491 (= e!586196 Unit!33806)))

(declare-fun b!1036492 () Bool)

(assert (=> b!1036492 (= e!586195 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456808) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124793 c!104916) b!1036490))

(assert (= (and d!124793 (not c!104916)) b!1036491))

(assert (= (and d!124793 (not res!691798)) b!1036492))

(declare-fun m!956179 () Bool)

(assert (=> d!124793 m!956179))

(declare-fun m!956181 () Bool)

(assert (=> b!1036490 m!956181))

(assert (=> b!1036490 m!955459))

(assert (=> b!1036490 m!955459))

(declare-fun m!956183 () Bool)

(assert (=> b!1036490 m!956183))

(assert (=> b!1036492 m!955459))

(assert (=> b!1036492 m!955459))

(assert (=> b!1036492 m!956183))

(assert (=> d!124509 d!124793))

(declare-fun d!124795 () Bool)

(declare-fun c!104917 () Bool)

(assert (=> d!124795 (= c!104917 (and ((_ is Cons!21948) lt!456809) (= (_1!7916 (h!23150 lt!456809)) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(declare-fun e!586197 () Option!642)

(assert (=> d!124795 (= (getValueByKey!591 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) e!586197)))

(declare-fun b!1036496 () Bool)

(declare-fun e!586198 () Option!642)

(assert (=> b!1036496 (= e!586198 None!640)))

(declare-fun b!1036493 () Bool)

(assert (=> b!1036493 (= e!586197 (Some!641 (_2!7916 (h!23150 lt!456809))))))

(declare-fun b!1036494 () Bool)

(assert (=> b!1036494 (= e!586197 e!586198)))

(declare-fun c!104918 () Bool)

(assert (=> b!1036494 (= c!104918 (and ((_ is Cons!21948) lt!456809) (not (= (_1!7916 (h!23150 lt!456809)) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1036495 () Bool)

(assert (=> b!1036495 (= e!586198 (getValueByKey!591 (t!31148 lt!456809) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124795 c!104917) b!1036493))

(assert (= (and d!124795 (not c!104917)) b!1036494))

(assert (= (and b!1036494 c!104918) b!1036495))

(assert (= (and b!1036494 (not c!104918)) b!1036496))

(declare-fun m!956185 () Bool)

(assert (=> b!1036495 m!956185))

(assert (=> d!124509 d!124795))

(declare-fun d!124797 () Bool)

(assert (=> d!124797 (= (getValueByKey!591 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457032 () Unit!33774)

(assert (=> d!124797 (= lt!457032 (choose!1714 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun e!586199 () Bool)

(assert (=> d!124797 e!586199))

(declare-fun res!691799 () Bool)

(assert (=> d!124797 (=> (not res!691799) (not e!586199))))

(assert (=> d!124797 (= res!691799 (isStrictlySorted!715 lt!456809))))

(assert (=> d!124797 (= (lemmaContainsTupThenGetReturnValue!281 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!457032)))

(declare-fun b!1036497 () Bool)

(declare-fun res!691800 () Bool)

(assert (=> b!1036497 (=> (not res!691800) (not e!586199))))

(assert (=> b!1036497 (= res!691800 (containsKey!564 lt!456809 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036498 () Bool)

(assert (=> b!1036498 (= e!586199 (contains!6002 lt!456809 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124797 res!691799) b!1036497))

(assert (= (and b!1036497 res!691800) b!1036498))

(assert (=> d!124797 m!955453))

(declare-fun m!956187 () Bool)

(assert (=> d!124797 m!956187))

(declare-fun m!956189 () Bool)

(assert (=> d!124797 m!956189))

(declare-fun m!956191 () Bool)

(assert (=> b!1036497 m!956191))

(declare-fun m!956193 () Bool)

(assert (=> b!1036498 m!956193))

(assert (=> d!124509 d!124797))

(declare-fun b!1036499 () Bool)

(declare-fun e!586202 () List!21952)

(declare-fun call!43856 () List!21952)

(assert (=> b!1036499 (= e!586202 call!43856)))

(declare-fun b!1036500 () Bool)

(declare-fun e!586201 () List!21952)

(declare-fun call!43857 () List!21952)

(assert (=> b!1036500 (= e!586201 call!43857)))

(declare-fun b!1036501 () Bool)

(declare-fun res!691801 () Bool)

(declare-fun e!586203 () Bool)

(assert (=> b!1036501 (=> (not res!691801) (not e!586203))))

(declare-fun lt!457033 () List!21952)

(assert (=> b!1036501 (= res!691801 (containsKey!564 lt!457033 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036502 () Bool)

(assert (=> b!1036502 (= e!586202 e!586201)))

(declare-fun c!104920 () Bool)

(assert (=> b!1036502 (= c!104920 (and ((_ is Cons!21948) (toList!6932 lt!456681)) (= (_1!7916 (h!23150 (toList!6932 lt!456681))) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43853 () Bool)

(assert (=> bm!43853 (= call!43857 call!43856)))

(declare-fun b!1036503 () Bool)

(declare-fun e!586200 () List!21952)

(declare-fun call!43858 () List!21952)

(assert (=> b!1036503 (= e!586200 call!43858)))

(declare-fun b!1036504 () Bool)

(declare-fun e!586204 () List!21952)

(declare-fun c!104922 () Bool)

(assert (=> b!1036504 (= e!586204 (ite c!104920 (t!31148 (toList!6932 lt!456681)) (ite c!104922 (Cons!21948 (h!23150 (toList!6932 lt!456681)) (t!31148 (toList!6932 lt!456681))) Nil!21949)))))

(declare-fun b!1036505 () Bool)

(assert (=> b!1036505 (= e!586200 call!43858)))

(declare-fun c!104919 () Bool)

(declare-fun bm!43854 () Bool)

(assert (=> bm!43854 (= call!43856 ($colon$colon!605 e!586204 (ite c!104919 (h!23150 (toList!6932 lt!456681)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))))

(declare-fun c!104921 () Bool)

(assert (=> bm!43854 (= c!104921 c!104919)))

(declare-fun bm!43855 () Bool)

(assert (=> bm!43855 (= call!43858 call!43857)))

(declare-fun b!1036506 () Bool)

(assert (=> b!1036506 (= e!586204 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456681)) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036507 () Bool)

(assert (=> b!1036507 (= e!586203 (contains!6002 lt!457033 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(declare-fun d!124799 () Bool)

(assert (=> d!124799 e!586203))

(declare-fun res!691802 () Bool)

(assert (=> d!124799 (=> (not res!691802) (not e!586203))))

(assert (=> d!124799 (= res!691802 (isStrictlySorted!715 lt!457033))))

(assert (=> d!124799 (= lt!457033 e!586202)))

(assert (=> d!124799 (= c!104919 (and ((_ is Cons!21948) (toList!6932 lt!456681)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456681))) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(assert (=> d!124799 (isStrictlySorted!715 (toList!6932 lt!456681))))

(assert (=> d!124799 (= (insertStrictlySorted!374 (toList!6932 lt!456681) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) (_2!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427)))) lt!457033)))

(declare-fun b!1036508 () Bool)

(assert (=> b!1036508 (= c!104922 (and ((_ is Cons!21948) (toList!6932 lt!456681)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456681))) (_1!7916 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))))

(assert (=> b!1036508 (= e!586201 e!586200)))

(assert (= (and d!124799 c!104919) b!1036499))

(assert (= (and d!124799 (not c!104919)) b!1036502))

(assert (= (and b!1036502 c!104920) b!1036500))

(assert (= (and b!1036502 (not c!104920)) b!1036508))

(assert (= (and b!1036508 c!104922) b!1036503))

(assert (= (and b!1036508 (not c!104922)) b!1036505))

(assert (= (or b!1036503 b!1036505) bm!43855))

(assert (= (or b!1036500 bm!43855) bm!43853))

(assert (= (or b!1036499 bm!43853) bm!43854))

(assert (= (and bm!43854 c!104921) b!1036506))

(assert (= (and bm!43854 (not c!104921)) b!1036504))

(assert (= (and d!124799 res!691802) b!1036501))

(assert (= (and b!1036501 res!691801) b!1036507))

(declare-fun m!956195 () Bool)

(assert (=> b!1036507 m!956195))

(declare-fun m!956197 () Bool)

(assert (=> b!1036501 m!956197))

(declare-fun m!956199 () Bool)

(assert (=> b!1036506 m!956199))

(declare-fun m!956201 () Bool)

(assert (=> bm!43854 m!956201))

(declare-fun m!956203 () Bool)

(assert (=> d!124799 m!956203))

(declare-fun m!956205 () Bool)

(assert (=> d!124799 m!956205))

(assert (=> d!124509 d!124799))

(declare-fun lt!457034 () Bool)

(declare-fun d!124801 () Bool)

(assert (=> d!124801 (= lt!457034 (select (content!514 (toList!6932 lt!456808)) (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))

(declare-fun e!586205 () Bool)

(assert (=> d!124801 (= lt!457034 e!586205)))

(declare-fun res!691803 () Bool)

(assert (=> d!124801 (=> (not res!691803) (not e!586205))))

(assert (=> d!124801 (= res!691803 ((_ is Cons!21948) (toList!6932 lt!456808)))))

(assert (=> d!124801 (= (contains!6002 (toList!6932 lt!456808) (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) lt!457034)))

(declare-fun b!1036509 () Bool)

(declare-fun e!586206 () Bool)

(assert (=> b!1036509 (= e!586205 e!586206)))

(declare-fun res!691804 () Bool)

(assert (=> b!1036509 (=> res!691804 e!586206)))

(assert (=> b!1036509 (= res!691804 (= (h!23150 (toList!6932 lt!456808)) (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))

(declare-fun b!1036510 () Bool)

(assert (=> b!1036510 (= e!586206 (contains!6002 (t!31148 (toList!6932 lt!456808)) (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))))))

(assert (= (and d!124801 res!691803) b!1036509))

(assert (= (and b!1036509 (not res!691804)) b!1036510))

(declare-fun m!956207 () Bool)

(assert (=> d!124801 m!956207))

(declare-fun m!956209 () Bool)

(assert (=> d!124801 m!956209))

(declare-fun m!956211 () Bool)

(assert (=> b!1036510 m!956211))

(assert (=> b!1036026 d!124801))

(declare-fun d!124803 () Bool)

(assert (=> d!124803 (= ($colon$colon!605 (removeStrictlySorted!57 (t!31148 (toList!6932 (map!14715 thiss!1427))) key!909) (h!23150 (toList!6932 (map!14715 thiss!1427)))) (Cons!21948 (h!23150 (toList!6932 (map!14715 thiss!1427))) (removeStrictlySorted!57 (t!31148 (toList!6932 (map!14715 thiss!1427))) key!909)))))

(assert (=> b!1035906 d!124803))

(declare-fun b!1036511 () Bool)

(declare-fun e!586209 () List!21952)

(assert (=> b!1036511 (= e!586209 (t!31148 (t!31148 (toList!6932 (map!14715 thiss!1427)))))))

(declare-fun b!1036512 () Bool)

(declare-fun e!586207 () List!21952)

(assert (=> b!1036512 (= e!586207 ($colon$colon!605 (removeStrictlySorted!57 (t!31148 (t!31148 (toList!6932 (map!14715 thiss!1427)))) key!909) (h!23150 (t!31148 (toList!6932 (map!14715 thiss!1427))))))))

(declare-fun b!1036513 () Bool)

(assert (=> b!1036513 (= e!586207 Nil!21949)))

(declare-fun d!124805 () Bool)

(declare-fun e!586208 () Bool)

(assert (=> d!124805 e!586208))

(declare-fun res!691805 () Bool)

(assert (=> d!124805 (=> (not res!691805) (not e!586208))))

(declare-fun lt!457035 () List!21952)

(assert (=> d!124805 (= res!691805 (isStrictlySorted!715 lt!457035))))

(assert (=> d!124805 (= lt!457035 e!586209)))

(declare-fun c!104924 () Bool)

(assert (=> d!124805 (= c!104924 (and ((_ is Cons!21948) (t!31148 (toList!6932 (map!14715 thiss!1427)))) (= (_1!7916 (h!23150 (t!31148 (toList!6932 (map!14715 thiss!1427))))) key!909)))))

(assert (=> d!124805 (isStrictlySorted!715 (t!31148 (toList!6932 (map!14715 thiss!1427))))))

(assert (=> d!124805 (= (removeStrictlySorted!57 (t!31148 (toList!6932 (map!14715 thiss!1427))) key!909) lt!457035)))

(declare-fun b!1036514 () Bool)

(assert (=> b!1036514 (= e!586209 e!586207)))

(declare-fun c!104923 () Bool)

(assert (=> b!1036514 (= c!104923 (and ((_ is Cons!21948) (t!31148 (toList!6932 (map!14715 thiss!1427)))) (not (= (_1!7916 (h!23150 (t!31148 (toList!6932 (map!14715 thiss!1427))))) key!909))))))

(declare-fun b!1036515 () Bool)

(assert (=> b!1036515 (= e!586208 (not (containsKey!564 lt!457035 key!909)))))

(assert (= (and d!124805 c!104924) b!1036511))

(assert (= (and d!124805 (not c!104924)) b!1036514))

(assert (= (and b!1036514 c!104923) b!1036512))

(assert (= (and b!1036514 (not c!104923)) b!1036513))

(assert (= (and d!124805 res!691805) b!1036515))

(declare-fun m!956213 () Bool)

(assert (=> b!1036512 m!956213))

(assert (=> b!1036512 m!956213))

(declare-fun m!956215 () Bool)

(assert (=> b!1036512 m!956215))

(declare-fun m!956217 () Bool)

(assert (=> d!124805 m!956217))

(declare-fun m!956219 () Bool)

(assert (=> d!124805 m!956219))

(declare-fun m!956221 () Bool)

(assert (=> b!1036515 m!956221))

(assert (=> b!1035906 d!124805))

(declare-fun lt!457036 () Bool)

(declare-fun d!124807 () Bool)

(assert (=> d!124807 (= lt!457036 (select (content!514 (toList!6932 lt!456752)) (tuple2!15811 lt!456649 lt!456582)))))

(declare-fun e!586210 () Bool)

(assert (=> d!124807 (= lt!457036 e!586210)))

(declare-fun res!691806 () Bool)

(assert (=> d!124807 (=> (not res!691806) (not e!586210))))

(assert (=> d!124807 (= res!691806 ((_ is Cons!21948) (toList!6932 lt!456752)))))

(assert (=> d!124807 (= (contains!6002 (toList!6932 lt!456752) (tuple2!15811 lt!456649 lt!456582)) lt!457036)))

(declare-fun b!1036516 () Bool)

(declare-fun e!586211 () Bool)

(assert (=> b!1036516 (= e!586210 e!586211)))

(declare-fun res!691807 () Bool)

(assert (=> b!1036516 (=> res!691807 e!586211)))

(assert (=> b!1036516 (= res!691807 (= (h!23150 (toList!6932 lt!456752)) (tuple2!15811 lt!456649 lt!456582)))))

(declare-fun b!1036517 () Bool)

(assert (=> b!1036517 (= e!586211 (contains!6002 (t!31148 (toList!6932 lt!456752)) (tuple2!15811 lt!456649 lt!456582)))))

(assert (= (and d!124807 res!691806) b!1036516))

(assert (= (and b!1036516 (not res!691807)) b!1036517))

(declare-fun m!956223 () Bool)

(assert (=> d!124807 m!956223))

(declare-fun m!956225 () Bool)

(assert (=> d!124807 m!956225))

(declare-fun m!956227 () Bool)

(assert (=> b!1036517 m!956227))

(assert (=> b!1035946 d!124807))

(declare-fun d!124809 () Bool)

(declare-fun e!586212 () Bool)

(assert (=> d!124809 e!586212))

(declare-fun res!691808 () Bool)

(assert (=> d!124809 (=> res!691808 e!586212)))

(declare-fun lt!457038 () Bool)

(assert (=> d!124809 (= res!691808 (not lt!457038))))

(declare-fun lt!457037 () Bool)

(assert (=> d!124809 (= lt!457038 lt!457037)))

(declare-fun lt!457040 () Unit!33774)

(declare-fun e!586213 () Unit!33774)

(assert (=> d!124809 (= lt!457040 e!586213)))

(declare-fun c!104925 () Bool)

(assert (=> d!124809 (= c!104925 lt!457037)))

(assert (=> d!124809 (= lt!457037 (containsKey!564 (toList!6932 lt!456772) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124809 (= (contains!6001 lt!456772 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457038)))

(declare-fun b!1036518 () Bool)

(declare-fun lt!457039 () Unit!33774)

(assert (=> b!1036518 (= e!586213 lt!457039)))

(assert (=> b!1036518 (= lt!457039 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456772) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036518 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456772) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036519 () Bool)

(declare-fun Unit!33807 () Unit!33774)

(assert (=> b!1036519 (= e!586213 Unit!33807)))

(declare-fun b!1036520 () Bool)

(assert (=> b!1036520 (= e!586212 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456772) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124809 c!104925) b!1036518))

(assert (= (and d!124809 (not c!104925)) b!1036519))

(assert (= (and d!124809 (not res!691808)) b!1036520))

(declare-fun m!956229 () Bool)

(assert (=> d!124809 m!956229))

(declare-fun m!956231 () Bool)

(assert (=> b!1036518 m!956231))

(declare-fun m!956233 () Bool)

(assert (=> b!1036518 m!956233))

(assert (=> b!1036518 m!956233))

(declare-fun m!956235 () Bool)

(assert (=> b!1036518 m!956235))

(assert (=> b!1036520 m!956233))

(assert (=> b!1036520 m!956233))

(assert (=> b!1036520 m!956235))

(assert (=> d!124463 d!124809))

(assert (=> d!124463 d!124483))

(assert (=> d!124513 d!124497))

(assert (=> d!124513 d!124501))

(assert (=> d!124513 d!124509))

(declare-fun d!124811 () Bool)

(declare-fun e!586214 () Bool)

(assert (=> d!124811 e!586214))

(declare-fun res!691809 () Bool)

(assert (=> d!124811 (=> res!691809 e!586214)))

(declare-fun lt!457042 () Bool)

(assert (=> d!124811 (= res!691809 (not lt!457042))))

(declare-fun lt!457041 () Bool)

(assert (=> d!124811 (= lt!457042 lt!457041)))

(declare-fun lt!457044 () Unit!33774)

(declare-fun e!586215 () Unit!33774)

(assert (=> d!124811 (= lt!457044 e!586215)))

(declare-fun c!104926 () Bool)

(assert (=> d!124811 (= c!104926 lt!457041)))

(assert (=> d!124811 (= lt!457041 (containsKey!564 (toList!6932 lt!456681) lt!456687))))

(assert (=> d!124811 (= (contains!6001 lt!456681 lt!456687) lt!457042)))

(declare-fun b!1036521 () Bool)

(declare-fun lt!457043 () Unit!33774)

(assert (=> b!1036521 (= e!586215 lt!457043)))

(assert (=> b!1036521 (= lt!457043 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456681) lt!456687))))

(assert (=> b!1036521 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456681) lt!456687))))

(declare-fun b!1036522 () Bool)

(declare-fun Unit!33808 () Unit!33774)

(assert (=> b!1036522 (= e!586215 Unit!33808)))

(declare-fun b!1036523 () Bool)

(assert (=> b!1036523 (= e!586214 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456681) lt!456687)))))

(assert (= (and d!124811 c!104926) b!1036521))

(assert (= (and d!124811 (not c!104926)) b!1036522))

(assert (= (and d!124811 (not res!691809)) b!1036523))

(declare-fun m!956237 () Bool)

(assert (=> d!124811 m!956237))

(declare-fun m!956239 () Bool)

(assert (=> b!1036521 m!956239))

(assert (=> b!1036521 m!955415))

(assert (=> b!1036521 m!955415))

(declare-fun m!956241 () Bool)

(assert (=> b!1036521 m!956241))

(assert (=> b!1036523 m!955415))

(assert (=> b!1036523 m!955415))

(assert (=> b!1036523 m!956241))

(assert (=> d!124513 d!124811))

(declare-fun d!124813 () Bool)

(assert (=> d!124813 (= (apply!900 (+!3131 lt!456681 (tuple2!15811 lt!456671 (minValue!6105 thiss!1427))) lt!456687) (apply!900 lt!456681 lt!456687))))

(assert (=> d!124813 true))

(declare-fun _$34!1175 () Unit!33774)

(assert (=> d!124813 (= (choose!1711 lt!456681 lt!456671 (minValue!6105 thiss!1427) lt!456687) _$34!1175)))

(declare-fun bs!30328 () Bool)

(assert (= bs!30328 d!124813))

(assert (=> bs!30328 m!955147))

(assert (=> bs!30328 m!955147))

(assert (=> bs!30328 m!955157))

(assert (=> bs!30328 m!955151))

(assert (=> d!124513 d!124813))

(declare-fun d!124815 () Bool)

(declare-fun e!586216 () Bool)

(assert (=> d!124815 e!586216))

(declare-fun res!691810 () Bool)

(assert (=> d!124815 (=> res!691810 e!586216)))

(declare-fun lt!457046 () Bool)

(assert (=> d!124815 (= res!691810 (not lt!457046))))

(declare-fun lt!457045 () Bool)

(assert (=> d!124815 (= lt!457046 lt!457045)))

(declare-fun lt!457048 () Unit!33774)

(declare-fun e!586217 () Unit!33774)

(assert (=> d!124815 (= lt!457048 e!586217)))

(declare-fun c!104927 () Bool)

(assert (=> d!124815 (= c!104927 lt!457045)))

(assert (=> d!124815 (= lt!457045 (containsKey!564 (toList!6932 lt!456881) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!124815 (= (contains!6001 lt!456881 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) lt!457046)))

(declare-fun b!1036524 () Bool)

(declare-fun lt!457047 () Unit!33774)

(assert (=> b!1036524 (= e!586217 lt!457047)))

(assert (=> b!1036524 (= lt!457047 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456881) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> b!1036524 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456881) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036525 () Bool)

(declare-fun Unit!33809 () Unit!33774)

(assert (=> b!1036525 (= e!586217 Unit!33809)))

(declare-fun b!1036526 () Bool)

(assert (=> b!1036526 (= e!586216 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456881) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (= (and d!124815 c!104927) b!1036524))

(assert (= (and d!124815 (not c!104927)) b!1036525))

(assert (= (and d!124815 (not res!691810)) b!1036526))

(declare-fun m!956243 () Bool)

(assert (=> d!124815 m!956243))

(declare-fun m!956245 () Bool)

(assert (=> b!1036524 m!956245))

(assert (=> b!1036524 m!955667))

(assert (=> b!1036524 m!955667))

(declare-fun m!956247 () Bool)

(assert (=> b!1036524 m!956247))

(assert (=> b!1036526 m!955667))

(assert (=> b!1036526 m!955667))

(assert (=> b!1036526 m!956247))

(assert (=> d!124559 d!124815))

(declare-fun c!104928 () Bool)

(declare-fun d!124817 () Bool)

(assert (=> d!124817 (= c!104928 (and ((_ is Cons!21948) lt!456882) (= (_1!7916 (h!23150 lt!456882)) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun e!586218 () Option!642)

(assert (=> d!124817 (= (getValueByKey!591 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) e!586218)))

(declare-fun b!1036530 () Bool)

(declare-fun e!586219 () Option!642)

(assert (=> b!1036530 (= e!586219 None!640)))

(declare-fun b!1036527 () Bool)

(assert (=> b!1036527 (= e!586218 (Some!641 (_2!7916 (h!23150 lt!456882))))))

(declare-fun b!1036528 () Bool)

(assert (=> b!1036528 (= e!586218 e!586219)))

(declare-fun c!104929 () Bool)

(assert (=> b!1036528 (= c!104929 (and ((_ is Cons!21948) lt!456882) (not (= (_1!7916 (h!23150 lt!456882)) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))))

(declare-fun b!1036529 () Bool)

(assert (=> b!1036529 (= e!586219 (getValueByKey!591 (t!31148 lt!456882) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (= (and d!124817 c!104928) b!1036527))

(assert (= (and d!124817 (not c!104928)) b!1036528))

(assert (= (and b!1036528 c!104929) b!1036529))

(assert (= (and b!1036528 (not c!104929)) b!1036530))

(declare-fun m!956249 () Bool)

(assert (=> b!1036529 m!956249))

(assert (=> d!124559 d!124817))

(declare-fun d!124819 () Bool)

(assert (=> d!124819 (= (getValueByKey!591 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) (Some!641 (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun lt!457049 () Unit!33774)

(assert (=> d!124819 (= lt!457049 (choose!1714 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun e!586220 () Bool)

(assert (=> d!124819 e!586220))

(declare-fun res!691811 () Bool)

(assert (=> d!124819 (=> (not res!691811) (not e!586220))))

(assert (=> d!124819 (= res!691811 (isStrictlySorted!715 lt!456882))))

(assert (=> d!124819 (= (lemmaContainsTupThenGetReturnValue!281 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) lt!457049)))

(declare-fun b!1036531 () Bool)

(declare-fun res!691812 () Bool)

(assert (=> b!1036531 (=> (not res!691812) (not e!586220))))

(assert (=> b!1036531 (= res!691812 (containsKey!564 lt!456882 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036532 () Bool)

(assert (=> b!1036532 (= e!586220 (contains!6002 lt!456882 (tuple2!15811 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (= (and d!124819 res!691811) b!1036531))

(assert (= (and b!1036531 res!691812) b!1036532))

(assert (=> d!124819 m!955661))

(declare-fun m!956251 () Bool)

(assert (=> d!124819 m!956251))

(declare-fun m!956253 () Bool)

(assert (=> d!124819 m!956253))

(declare-fun m!956255 () Bool)

(assert (=> b!1036531 m!956255))

(declare-fun m!956257 () Bool)

(assert (=> b!1036532 m!956257))

(assert (=> d!124559 d!124819))

(declare-fun b!1036533 () Bool)

(declare-fun e!586223 () List!21952)

(declare-fun call!43859 () List!21952)

(assert (=> b!1036533 (= e!586223 call!43859)))

(declare-fun b!1036534 () Bool)

(declare-fun e!586222 () List!21952)

(declare-fun call!43860 () List!21952)

(assert (=> b!1036534 (= e!586222 call!43860)))

(declare-fun b!1036535 () Bool)

(declare-fun res!691813 () Bool)

(declare-fun e!586224 () Bool)

(assert (=> b!1036535 (=> (not res!691813) (not e!586224))))

(declare-fun lt!457050 () List!21952)

(assert (=> b!1036535 (= res!691813 (containsKey!564 lt!457050 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036536 () Bool)

(assert (=> b!1036536 (= e!586223 e!586222)))

(declare-fun c!104931 () Bool)

(assert (=> b!1036536 (= c!104931 (and ((_ is Cons!21948) (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (= (_1!7916 (h!23150 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun bm!43856 () Bool)

(assert (=> bm!43856 (= call!43860 call!43859)))

(declare-fun b!1036537 () Bool)

(declare-fun e!586221 () List!21952)

(declare-fun call!43861 () List!21952)

(assert (=> b!1036537 (= e!586221 call!43861)))

(declare-fun b!1036538 () Bool)

(declare-fun e!586225 () List!21952)

(declare-fun c!104933 () Bool)

(assert (=> b!1036538 (= e!586225 (ite c!104931 (t!31148 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (ite c!104933 (Cons!21948 (h!23150 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (t!31148 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))))) Nil!21949)))))

(declare-fun b!1036539 () Bool)

(assert (=> b!1036539 (= e!586221 call!43861)))

(declare-fun bm!43857 () Bool)

(declare-fun c!104930 () Bool)

(assert (=> bm!43857 (= call!43859 ($colon$colon!605 e!586225 (ite c!104930 (h!23150 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (tuple2!15811 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))))

(declare-fun c!104932 () Bool)

(assert (=> bm!43857 (= c!104932 c!104930)))

(declare-fun bm!43858 () Bool)

(assert (=> bm!43858 (= call!43861 call!43860)))

(declare-fun b!1036540 () Bool)

(assert (=> b!1036540 (= e!586225 (insertStrictlySorted!374 (t!31148 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1036541 () Bool)

(assert (=> b!1036541 (= e!586224 (contains!6002 lt!457050 (tuple2!15811 (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun d!124821 () Bool)

(assert (=> d!124821 e!586224))

(declare-fun res!691814 () Bool)

(assert (=> d!124821 (=> (not res!691814) (not e!586224))))

(assert (=> d!124821 (= res!691814 (isStrictlySorted!715 lt!457050))))

(assert (=> d!124821 (= lt!457050 e!586223)))

(assert (=> d!124821 (= c!104930 (and ((_ is Cons!21948) (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (bvslt (_1!7916 (h!23150 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (=> d!124821 (isStrictlySorted!715 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))))))

(assert (=> d!124821 (= (insertStrictlySorted!374 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) lt!457050)))

(declare-fun b!1036542 () Bool)

(assert (=> b!1036542 (= c!104933 (and ((_ is Cons!21948) (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800)))) (bvsgt (_1!7916 (h!23150 (toList!6932 (ite c!104729 call!43803 (ite c!104727 call!43804 call!43800))))) (_1!7916 (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (=> b!1036542 (= e!586222 e!586221)))

(assert (= (and d!124821 c!104930) b!1036533))

(assert (= (and d!124821 (not c!104930)) b!1036536))

(assert (= (and b!1036536 c!104931) b!1036534))

(assert (= (and b!1036536 (not c!104931)) b!1036542))

(assert (= (and b!1036542 c!104933) b!1036537))

(assert (= (and b!1036542 (not c!104933)) b!1036539))

(assert (= (or b!1036537 b!1036539) bm!43858))

(assert (= (or b!1036534 bm!43858) bm!43856))

(assert (= (or b!1036533 bm!43856) bm!43857))

(assert (= (and bm!43857 c!104932) b!1036540))

(assert (= (and bm!43857 (not c!104932)) b!1036538))

(assert (= (and d!124821 res!691814) b!1036535))

(assert (= (and b!1036535 res!691813) b!1036541))

(declare-fun m!956259 () Bool)

(assert (=> b!1036541 m!956259))

(declare-fun m!956261 () Bool)

(assert (=> b!1036535 m!956261))

(declare-fun m!956263 () Bool)

(assert (=> b!1036540 m!956263))

(declare-fun m!956265 () Bool)

(assert (=> bm!43857 m!956265))

(declare-fun m!956267 () Bool)

(assert (=> d!124821 m!956267))

(declare-fun m!956269 () Bool)

(assert (=> d!124821 m!956269))

(assert (=> d!124559 d!124821))

(assert (=> b!1035933 d!124585))

(assert (=> b!1035933 d!124587))

(declare-fun lt!457051 () Bool)

(declare-fun d!124823 () Bool)

(assert (=> d!124823 (= lt!457051 (select (content!514 (toList!6932 lt!456744)) (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))

(declare-fun e!586226 () Bool)

(assert (=> d!124823 (= lt!457051 e!586226)))

(declare-fun res!691815 () Bool)

(assert (=> d!124823 (=> (not res!691815) (not e!586226))))

(assert (=> d!124823 (= res!691815 ((_ is Cons!21948) (toList!6932 lt!456744)))))

(assert (=> d!124823 (= (contains!6002 (toList!6932 lt!456744) (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) lt!457051)))

(declare-fun b!1036543 () Bool)

(declare-fun e!586227 () Bool)

(assert (=> b!1036543 (= e!586226 e!586227)))

(declare-fun res!691816 () Bool)

(assert (=> b!1036543 (=> res!691816 e!586227)))

(assert (=> b!1036543 (= res!691816 (= (h!23150 (toList!6932 lt!456744)) (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1036544 () Bool)

(assert (=> b!1036544 (= e!586227 (contains!6002 (t!31148 (toList!6932 lt!456744)) (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124823 res!691815) b!1036543))

(assert (= (and b!1036543 (not res!691816)) b!1036544))

(declare-fun m!956271 () Bool)

(assert (=> d!124823 m!956271))

(declare-fun m!956273 () Bool)

(assert (=> d!124823 m!956273))

(declare-fun m!956275 () Bool)

(assert (=> b!1036544 m!956275))

(assert (=> b!1035942 d!124823))

(declare-fun d!124825 () Bool)

(declare-fun e!586228 () Bool)

(assert (=> d!124825 e!586228))

(declare-fun res!691817 () Bool)

(assert (=> d!124825 (=> res!691817 e!586228)))

(declare-fun lt!457053 () Bool)

(assert (=> d!124825 (= res!691817 (not lt!457053))))

(declare-fun lt!457052 () Bool)

(assert (=> d!124825 (= lt!457053 lt!457052)))

(declare-fun lt!457055 () Unit!33774)

(declare-fun e!586229 () Unit!33774)

(assert (=> d!124825 (= lt!457055 e!586229)))

(declare-fun c!104934 () Bool)

(assert (=> d!124825 (= c!104934 lt!457052)))

(assert (=> d!124825 (= lt!457052 (containsKey!564 (toList!6932 lt!456813) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124825 (= (contains!6001 lt!456813 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!457053)))

(declare-fun b!1036545 () Bool)

(declare-fun lt!457054 () Unit!33774)

(assert (=> b!1036545 (= e!586229 lt!457054)))

(assert (=> b!1036545 (= lt!457054 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456813) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1036545 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456813) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036546 () Bool)

(declare-fun Unit!33810 () Unit!33774)

(assert (=> b!1036546 (= e!586229 Unit!33810)))

(declare-fun b!1036547 () Bool)

(assert (=> b!1036547 (= e!586228 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456813) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!124825 c!104934) b!1036545))

(assert (= (and d!124825 (not c!104934)) b!1036546))

(assert (= (and d!124825 (not res!691817)) b!1036547))

(declare-fun m!956277 () Bool)

(assert (=> d!124825 m!956277))

(declare-fun m!956279 () Bool)

(assert (=> b!1036545 m!956279))

(assert (=> b!1036545 m!955483))

(assert (=> b!1036545 m!955483))

(declare-fun m!956281 () Bool)

(assert (=> b!1036545 m!956281))

(assert (=> b!1036547 m!955483))

(assert (=> b!1036547 m!955483))

(assert (=> b!1036547 m!956281))

(assert (=> d!124517 d!124825))

(declare-fun c!104935 () Bool)

(declare-fun d!124827 () Bool)

(assert (=> d!124827 (= c!104935 (and ((_ is Cons!21948) lt!456814) (= (_1!7916 (h!23150 lt!456814)) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586230 () Option!642)

(assert (=> d!124827 (= (getValueByKey!591 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) e!586230)))

(declare-fun b!1036551 () Bool)

(declare-fun e!586231 () Option!642)

(assert (=> b!1036551 (= e!586231 None!640)))

(declare-fun b!1036548 () Bool)

(assert (=> b!1036548 (= e!586230 (Some!641 (_2!7916 (h!23150 lt!456814))))))

(declare-fun b!1036549 () Bool)

(assert (=> b!1036549 (= e!586230 e!586231)))

(declare-fun c!104936 () Bool)

(assert (=> b!1036549 (= c!104936 (and ((_ is Cons!21948) lt!456814) (not (= (_1!7916 (h!23150 lt!456814)) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036550 () Bool)

(assert (=> b!1036550 (= e!586231 (getValueByKey!591 (t!31148 lt!456814) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124827 c!104935) b!1036548))

(assert (= (and d!124827 (not c!104935)) b!1036549))

(assert (= (and b!1036549 c!104936) b!1036550))

(assert (= (and b!1036549 (not c!104936)) b!1036551))

(declare-fun m!956283 () Bool)

(assert (=> b!1036550 m!956283))

(assert (=> d!124517 d!124827))

(declare-fun d!124829 () Bool)

(assert (=> d!124829 (= (getValueByKey!591 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457056 () Unit!33774)

(assert (=> d!124829 (= lt!457056 (choose!1714 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!586232 () Bool)

(assert (=> d!124829 e!586232))

(declare-fun res!691818 () Bool)

(assert (=> d!124829 (=> (not res!691818) (not e!586232))))

(assert (=> d!124829 (= res!691818 (isStrictlySorted!715 lt!456814))))

(assert (=> d!124829 (= (lemmaContainsTupThenGetReturnValue!281 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!457056)))

(declare-fun b!1036552 () Bool)

(declare-fun res!691819 () Bool)

(assert (=> b!1036552 (=> (not res!691819) (not e!586232))))

(assert (=> b!1036552 (= res!691819 (containsKey!564 lt!456814 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036553 () Bool)

(assert (=> b!1036553 (= e!586232 (contains!6002 lt!456814 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!124829 res!691818) b!1036552))

(assert (= (and b!1036552 res!691819) b!1036553))

(assert (=> d!124829 m!955477))

(declare-fun m!956285 () Bool)

(assert (=> d!124829 m!956285))

(declare-fun m!956287 () Bool)

(assert (=> d!124829 m!956287))

(declare-fun m!956289 () Bool)

(assert (=> b!1036552 m!956289))

(declare-fun m!956291 () Bool)

(assert (=> b!1036553 m!956291))

(assert (=> d!124517 d!124829))

(declare-fun b!1036554 () Bool)

(declare-fun e!586235 () List!21952)

(declare-fun call!43862 () List!21952)

(assert (=> b!1036554 (= e!586235 call!43862)))

(declare-fun b!1036555 () Bool)

(declare-fun e!586234 () List!21952)

(declare-fun call!43863 () List!21952)

(assert (=> b!1036555 (= e!586234 call!43863)))

(declare-fun b!1036556 () Bool)

(declare-fun res!691820 () Bool)

(declare-fun e!586236 () Bool)

(assert (=> b!1036556 (=> (not res!691820) (not e!586236))))

(declare-fun lt!457057 () List!21952)

(assert (=> b!1036556 (= res!691820 (containsKey!564 lt!457057 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036557 () Bool)

(assert (=> b!1036557 (= e!586235 e!586234)))

(declare-fun c!104938 () Bool)

(assert (=> b!1036557 (= c!104938 (and ((_ is Cons!21948) (toList!6932 lt!456692)) (= (_1!7916 (h!23150 (toList!6932 lt!456692))) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43859 () Bool)

(assert (=> bm!43859 (= call!43863 call!43862)))

(declare-fun b!1036558 () Bool)

(declare-fun e!586233 () List!21952)

(declare-fun call!43864 () List!21952)

(assert (=> b!1036558 (= e!586233 call!43864)))

(declare-fun e!586237 () List!21952)

(declare-fun c!104940 () Bool)

(declare-fun b!1036559 () Bool)

(assert (=> b!1036559 (= e!586237 (ite c!104938 (t!31148 (toList!6932 lt!456692)) (ite c!104940 (Cons!21948 (h!23150 (toList!6932 lt!456692)) (t!31148 (toList!6932 lt!456692))) Nil!21949)))))

(declare-fun b!1036560 () Bool)

(assert (=> b!1036560 (= e!586233 call!43864)))

(declare-fun bm!43860 () Bool)

(declare-fun c!104937 () Bool)

(assert (=> bm!43860 (= call!43862 ($colon$colon!605 e!586237 (ite c!104937 (h!23150 (toList!6932 lt!456692)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!104939 () Bool)

(assert (=> bm!43860 (= c!104939 c!104937)))

(declare-fun bm!43861 () Bool)

(assert (=> bm!43861 (= call!43864 call!43863)))

(declare-fun b!1036561 () Bool)

(assert (=> b!1036561 (= e!586237 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456692)) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036562 () Bool)

(assert (=> b!1036562 (= e!586236 (contains!6002 lt!457057 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(declare-fun d!124831 () Bool)

(assert (=> d!124831 e!586236))

(declare-fun res!691821 () Bool)

(assert (=> d!124831 (=> (not res!691821) (not e!586236))))

(assert (=> d!124831 (= res!691821 (isStrictlySorted!715 lt!457057))))

(assert (=> d!124831 (= lt!457057 e!586235)))

(assert (=> d!124831 (= c!104937 (and ((_ is Cons!21948) (toList!6932 lt!456692)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456692))) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!124831 (isStrictlySorted!715 (toList!6932 lt!456692))))

(assert (=> d!124831 (= (insertStrictlySorted!374 (toList!6932 lt!456692) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) lt!457057)))

(declare-fun b!1036563 () Bool)

(assert (=> b!1036563 (= c!104940 (and ((_ is Cons!21948) (toList!6932 lt!456692)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456692))) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(assert (=> b!1036563 (= e!586234 e!586233)))

(assert (= (and d!124831 c!104937) b!1036554))

(assert (= (and d!124831 (not c!104937)) b!1036557))

(assert (= (and b!1036557 c!104938) b!1036555))

(assert (= (and b!1036557 (not c!104938)) b!1036563))

(assert (= (and b!1036563 c!104940) b!1036558))

(assert (= (and b!1036563 (not c!104940)) b!1036560))

(assert (= (or b!1036558 b!1036560) bm!43861))

(assert (= (or b!1036555 bm!43861) bm!43859))

(assert (= (or b!1036554 bm!43859) bm!43860))

(assert (= (and bm!43860 c!104939) b!1036561))

(assert (= (and bm!43860 (not c!104939)) b!1036559))

(assert (= (and d!124831 res!691821) b!1036556))

(assert (= (and b!1036556 res!691820) b!1036562))

(declare-fun m!956293 () Bool)

(assert (=> b!1036562 m!956293))

(declare-fun m!956295 () Bool)

(assert (=> b!1036556 m!956295))

(declare-fun m!956297 () Bool)

(assert (=> b!1036561 m!956297))

(declare-fun m!956299 () Bool)

(assert (=> bm!43860 m!956299))

(declare-fun m!956301 () Bool)

(assert (=> d!124831 m!956301))

(declare-fun m!956303 () Bool)

(assert (=> d!124831 m!956303))

(assert (=> d!124517 d!124831))

(declare-fun d!124833 () Bool)

(declare-fun e!586238 () Bool)

(assert (=> d!124833 e!586238))

(declare-fun res!691822 () Bool)

(assert (=> d!124833 (=> res!691822 e!586238)))

(declare-fun lt!457059 () Bool)

(assert (=> d!124833 (= res!691822 (not lt!457059))))

(declare-fun lt!457058 () Bool)

(assert (=> d!124833 (= lt!457059 lt!457058)))

(declare-fun lt!457061 () Unit!33774)

(declare-fun e!586239 () Unit!33774)

(assert (=> d!124833 (= lt!457061 e!586239)))

(declare-fun c!104941 () Bool)

(assert (=> d!124833 (= c!104941 lt!457058)))

(assert (=> d!124833 (= lt!457058 (containsKey!564 (toList!6932 lt!456772) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124833 (= (contains!6001 lt!456772 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!457059)))

(declare-fun b!1036564 () Bool)

(declare-fun lt!457060 () Unit!33774)

(assert (=> b!1036564 (= e!586239 lt!457060)))

(assert (=> b!1036564 (= lt!457060 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456772) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1036564 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456772) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036565 () Bool)

(declare-fun Unit!33811 () Unit!33774)

(assert (=> b!1036565 (= e!586239 Unit!33811)))

(declare-fun b!1036566 () Bool)

(assert (=> b!1036566 (= e!586238 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456772) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124833 c!104941) b!1036564))

(assert (= (and d!124833 (not c!104941)) b!1036565))

(assert (= (and d!124833 (not res!691822)) b!1036566))

(assert (=> d!124833 m!955067))

(declare-fun m!956305 () Bool)

(assert (=> d!124833 m!956305))

(assert (=> b!1036564 m!955067))

(declare-fun m!956307 () Bool)

(assert (=> b!1036564 m!956307))

(assert (=> b!1036564 m!955067))

(declare-fun m!956309 () Bool)

(assert (=> b!1036564 m!956309))

(assert (=> b!1036564 m!956309))

(declare-fun m!956311 () Bool)

(assert (=> b!1036564 m!956311))

(assert (=> b!1036566 m!955067))

(assert (=> b!1036566 m!956309))

(assert (=> b!1036566 m!956309))

(assert (=> b!1036566 m!956311))

(assert (=> b!1035976 d!124833))

(assert (=> b!1036051 d!124613))

(assert (=> b!1036051 d!124615))

(declare-fun d!124835 () Bool)

(declare-fun lt!457062 () Bool)

(assert (=> d!124835 (= lt!457062 (select (content!515 Nil!21950) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586241 () Bool)

(assert (=> d!124835 (= lt!457062 e!586241)))

(declare-fun res!691824 () Bool)

(assert (=> d!124835 (=> (not res!691824) (not e!586241))))

(assert (=> d!124835 (= res!691824 ((_ is Cons!21949) Nil!21950))))

(assert (=> d!124835 (= (contains!6003 Nil!21950 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) lt!457062)))

(declare-fun b!1036567 () Bool)

(declare-fun e!586240 () Bool)

(assert (=> b!1036567 (= e!586241 e!586240)))

(declare-fun res!691823 () Bool)

(assert (=> b!1036567 (=> res!691823 e!586240)))

(assert (=> b!1036567 (= res!691823 (= (h!23151 Nil!21950) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036568 () Bool)

(assert (=> b!1036568 (= e!586240 (contains!6003 (t!31155 Nil!21950) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124835 res!691824) b!1036567))

(assert (= (and b!1036567 (not res!691823)) b!1036568))

(assert (=> d!124835 m!956085))

(assert (=> d!124835 m!955067))

(declare-fun m!956313 () Bool)

(assert (=> d!124835 m!956313))

(assert (=> b!1036568 m!955067))

(declare-fun m!956315 () Bool)

(assert (=> b!1036568 m!956315))

(assert (=> b!1036087 d!124835))

(declare-fun d!124837 () Bool)

(declare-fun e!586242 () Bool)

(assert (=> d!124837 e!586242))

(declare-fun res!691825 () Bool)

(assert (=> d!124837 (=> res!691825 e!586242)))

(declare-fun lt!457064 () Bool)

(assert (=> d!124837 (= res!691825 (not lt!457064))))

(declare-fun lt!457063 () Bool)

(assert (=> d!124837 (= lt!457064 lt!457063)))

(declare-fun lt!457066 () Unit!33774)

(declare-fun e!586243 () Unit!33774)

(assert (=> d!124837 (= lt!457066 e!586243)))

(declare-fun c!104942 () Bool)

(assert (=> d!124837 (= c!104942 lt!457063)))

(assert (=> d!124837 (= lt!457063 (containsKey!564 (toList!6932 lt!456843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124837 (= (contains!6001 lt!456843 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457064)))

(declare-fun b!1036569 () Bool)

(declare-fun lt!457065 () Unit!33774)

(assert (=> b!1036569 (= e!586243 lt!457065)))

(assert (=> b!1036569 (= lt!457065 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036569 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456843) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036570 () Bool)

(declare-fun Unit!33812 () Unit!33774)

(assert (=> b!1036570 (= e!586243 Unit!33812)))

(declare-fun b!1036571 () Bool)

(assert (=> b!1036571 (= e!586242 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124837 c!104942) b!1036569))

(assert (= (and d!124837 (not c!104942)) b!1036570))

(assert (= (and d!124837 (not res!691825)) b!1036571))

(declare-fun m!956317 () Bool)

(assert (=> d!124837 m!956317))

(declare-fun m!956319 () Bool)

(assert (=> b!1036569 m!956319))

(assert (=> b!1036569 m!955793))

(assert (=> b!1036569 m!955793))

(declare-fun m!956321 () Bool)

(assert (=> b!1036569 m!956321))

(assert (=> b!1036571 m!955793))

(assert (=> b!1036571 m!955793))

(assert (=> b!1036571 m!956321))

(assert (=> bm!43813 d!124837))

(declare-fun d!124839 () Bool)

(declare-fun c!104943 () Bool)

(assert (=> d!124839 (= c!104943 (and ((_ is Cons!21948) (toList!6932 lt!456813)) (= (_1!7916 (h!23150 (toList!6932 lt!456813))) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586244 () Option!642)

(assert (=> d!124839 (= (getValueByKey!591 (toList!6932 lt!456813) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))) e!586244)))

(declare-fun b!1036575 () Bool)

(declare-fun e!586245 () Option!642)

(assert (=> b!1036575 (= e!586245 None!640)))

(declare-fun b!1036572 () Bool)

(assert (=> b!1036572 (= e!586244 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456813)))))))

(declare-fun b!1036573 () Bool)

(assert (=> b!1036573 (= e!586244 e!586245)))

(declare-fun c!104944 () Bool)

(assert (=> b!1036573 (= c!104944 (and ((_ is Cons!21948) (toList!6932 lt!456813)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456813))) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036574 () Bool)

(assert (=> b!1036574 (= e!586245 (getValueByKey!591 (t!31148 (toList!6932 lt!456813)) (_1!7916 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124839 c!104943) b!1036572))

(assert (= (and d!124839 (not c!104943)) b!1036573))

(assert (= (and b!1036573 c!104944) b!1036574))

(assert (= (and b!1036573 (not c!104944)) b!1036575))

(declare-fun m!956323 () Bool)

(assert (=> b!1036574 m!956323))

(assert (=> b!1036028 d!124839))

(assert (=> b!1036032 d!124477))

(declare-fun b!1036576 () Bool)

(declare-fun e!586246 () ListLongMap!13833)

(declare-fun call!43865 () ListLongMap!13833)

(assert (=> b!1036576 (= e!586246 call!43865)))

(declare-fun b!1036577 () Bool)

(declare-fun e!586248 () Bool)

(declare-fun e!586249 () Bool)

(assert (=> b!1036577 (= e!586248 e!586249)))

(declare-fun c!104946 () Bool)

(declare-fun e!586250 () Bool)

(assert (=> b!1036577 (= c!104946 e!586250)))

(declare-fun res!691829 () Bool)

(assert (=> b!1036577 (=> (not res!691829) (not e!586250))))

(assert (=> b!1036577 (= res!691829 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun bm!43862 () Bool)

(assert (=> bm!43862 (= call!43865 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun d!124841 () Bool)

(assert (=> d!124841 e!586248))

(declare-fun res!691827 () Bool)

(assert (=> d!124841 (=> (not res!691827) (not e!586248))))

(declare-fun lt!457071 () ListLongMap!13833)

(assert (=> d!124841 (= res!691827 (not (contains!6001 lt!457071 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586247 () ListLongMap!13833)

(assert (=> d!124841 (= lt!457071 e!586247)))

(declare-fun c!104945 () Bool)

(assert (=> d!124841 (= c!104945 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124841 (validMask!0 (mask!30165 thiss!1427))))

(assert (=> d!124841 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)) lt!457071)))

(declare-fun b!1036578 () Bool)

(assert (=> b!1036578 (= e!586250 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036578 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1036579 () Bool)

(declare-fun e!586251 () Bool)

(assert (=> b!1036579 (= e!586249 e!586251)))

(declare-fun c!104947 () Bool)

(assert (=> b!1036579 (= c!104947 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1036580 () Bool)

(declare-fun lt!457072 () Unit!33774)

(declare-fun lt!457068 () Unit!33774)

(assert (=> b!1036580 (= lt!457072 lt!457068)))

(declare-fun lt!457070 () ListLongMap!13833)

(declare-fun lt!457073 () V!37667)

(declare-fun lt!457067 () (_ BitVec 64))

(declare-fun lt!457069 () (_ BitVec 64))

(assert (=> b!1036580 (not (contains!6001 (+!3131 lt!457070 (tuple2!15811 lt!457067 lt!457073)) lt!457069))))

(assert (=> b!1036580 (= lt!457068 (addStillNotContains!244 lt!457070 lt!457067 lt!457073 lt!457069))))

(assert (=> b!1036580 (= lt!457069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036580 (= lt!457073 (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036580 (= lt!457067 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036580 (= lt!457070 call!43865)))

(assert (=> b!1036580 (= e!586246 (+!3131 call!43865 (tuple2!15811 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036581 () Bool)

(declare-fun e!586252 () Bool)

(assert (=> b!1036581 (= e!586249 e!586252)))

(assert (=> b!1036581 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun res!691828 () Bool)

(assert (=> b!1036581 (= res!691828 (contains!6001 lt!457071 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036581 (=> (not res!691828) (not e!586252))))

(declare-fun b!1036582 () Bool)

(assert (=> b!1036582 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> b!1036582 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31929 (_values!6292 thiss!1427))))))

(assert (=> b!1036582 (= e!586252 (= (apply!900 lt!457071 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16458 (select (arr!31399 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1985 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036583 () Bool)

(assert (=> b!1036583 (= e!586251 (= lt!457071 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!456582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1036584 () Bool)

(assert (=> b!1036584 (= e!586247 (ListLongMap!13834 Nil!21949))))

(declare-fun b!1036585 () Bool)

(assert (=> b!1036585 (= e!586251 (isEmpty!934 lt!457071))))

(declare-fun b!1036586 () Bool)

(declare-fun res!691826 () Bool)

(assert (=> b!1036586 (=> (not res!691826) (not e!586248))))

(assert (=> b!1036586 (= res!691826 (not (contains!6001 lt!457071 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036587 () Bool)

(assert (=> b!1036587 (= e!586247 e!586246)))

(declare-fun c!104948 () Bool)

(assert (=> b!1036587 (= c!104948 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124841 c!104945) b!1036584))

(assert (= (and d!124841 (not c!104945)) b!1036587))

(assert (= (and b!1036587 c!104948) b!1036580))

(assert (= (and b!1036587 (not c!104948)) b!1036576))

(assert (= (or b!1036580 b!1036576) bm!43862))

(assert (= (and d!124841 res!691827) b!1036586))

(assert (= (and b!1036586 res!691826) b!1036577))

(assert (= (and b!1036577 res!691829) b!1036578))

(assert (= (and b!1036577 c!104946) b!1036581))

(assert (= (and b!1036577 (not c!104946)) b!1036579))

(assert (= (and b!1036581 res!691828) b!1036582))

(assert (= (and b!1036579 c!104947) b!1036583))

(assert (= (and b!1036579 (not c!104947)) b!1036585))

(declare-fun b_lambda!16117 () Bool)

(assert (=> (not b_lambda!16117) (not b!1036580)))

(assert (=> b!1036580 t!31154))

(declare-fun b_and!33379 () Bool)

(assert (= b_and!33377 (and (=> t!31154 result!14419) b_and!33379)))

(declare-fun b_lambda!16119 () Bool)

(assert (=> (not b_lambda!16119) (not b!1036582)))

(assert (=> b!1036582 t!31154))

(declare-fun b_and!33381 () Bool)

(assert (= b_and!33379 (and (=> t!31154 result!14419) b_and!33381)))

(declare-fun m!956325 () Bool)

(assert (=> b!1036585 m!956325))

(declare-fun m!956327 () Bool)

(assert (=> b!1036583 m!956327))

(declare-fun m!956329 () Bool)

(assert (=> b!1036586 m!956329))

(assert (=> b!1036587 m!956015))

(assert (=> b!1036587 m!956015))

(assert (=> b!1036587 m!956017))

(assert (=> b!1036582 m!955071))

(assert (=> b!1036582 m!956019))

(assert (=> b!1036582 m!956015))

(assert (=> b!1036582 m!956019))

(assert (=> b!1036582 m!955071))

(assert (=> b!1036582 m!956021))

(assert (=> b!1036582 m!956015))

(declare-fun m!956331 () Bool)

(assert (=> b!1036582 m!956331))

(declare-fun m!956333 () Bool)

(assert (=> d!124841 m!956333))

(assert (=> d!124841 m!955077))

(declare-fun m!956335 () Bool)

(assert (=> b!1036580 m!956335))

(assert (=> b!1036580 m!955071))

(assert (=> b!1036580 m!956335))

(declare-fun m!956337 () Bool)

(assert (=> b!1036580 m!956337))

(assert (=> b!1036580 m!956015))

(assert (=> b!1036580 m!956019))

(assert (=> b!1036580 m!955071))

(assert (=> b!1036580 m!956021))

(declare-fun m!956339 () Bool)

(assert (=> b!1036580 m!956339))

(assert (=> b!1036580 m!956019))

(declare-fun m!956341 () Bool)

(assert (=> b!1036580 m!956341))

(assert (=> b!1036578 m!956015))

(assert (=> b!1036578 m!956015))

(assert (=> b!1036578 m!956017))

(assert (=> bm!43862 m!956327))

(assert (=> b!1036581 m!956015))

(assert (=> b!1036581 m!956015))

(declare-fun m!956343 () Bool)

(assert (=> b!1036581 m!956343))

(assert (=> bm!43805 d!124841))

(declare-fun d!124843 () Bool)

(assert (=> d!124843 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456681) lt!456687)) (v!14930 (getValueByKey!591 (toList!6932 lt!456681) lt!456687)))))

(assert (=> d!124497 d!124843))

(declare-fun d!124845 () Bool)

(declare-fun c!104949 () Bool)

(assert (=> d!124845 (= c!104949 (and ((_ is Cons!21948) (toList!6932 lt!456681)) (= (_1!7916 (h!23150 (toList!6932 lt!456681))) lt!456687)))))

(declare-fun e!586253 () Option!642)

(assert (=> d!124845 (= (getValueByKey!591 (toList!6932 lt!456681) lt!456687) e!586253)))

(declare-fun b!1036591 () Bool)

(declare-fun e!586254 () Option!642)

(assert (=> b!1036591 (= e!586254 None!640)))

(declare-fun b!1036588 () Bool)

(assert (=> b!1036588 (= e!586253 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456681)))))))

(declare-fun b!1036589 () Bool)

(assert (=> b!1036589 (= e!586253 e!586254)))

(declare-fun c!104950 () Bool)

(assert (=> b!1036589 (= c!104950 (and ((_ is Cons!21948) (toList!6932 lt!456681)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456681))) lt!456687))))))

(declare-fun b!1036590 () Bool)

(assert (=> b!1036590 (= e!586254 (getValueByKey!591 (t!31148 (toList!6932 lt!456681)) lt!456687))))

(assert (= (and d!124845 c!104949) b!1036588))

(assert (= (and d!124845 (not c!104949)) b!1036589))

(assert (= (and b!1036589 c!104950) b!1036590))

(assert (= (and b!1036589 (not c!104950)) b!1036591))

(declare-fun m!956345 () Bool)

(assert (=> b!1036590 m!956345))

(assert (=> d!124497 d!124845))

(declare-fun d!124847 () Bool)

(declare-fun res!691830 () Bool)

(declare-fun e!586255 () Bool)

(assert (=> d!124847 (=> res!691830 e!586255)))

(assert (=> d!124847 (= res!691830 (and ((_ is Cons!21948) (toList!6932 lt!456604)) (= (_1!7916 (h!23150 (toList!6932 lt!456604))) key!909)))))

(assert (=> d!124847 (= (containsKey!564 (toList!6932 lt!456604) key!909) e!586255)))

(declare-fun b!1036592 () Bool)

(declare-fun e!586256 () Bool)

(assert (=> b!1036592 (= e!586255 e!586256)))

(declare-fun res!691831 () Bool)

(assert (=> b!1036592 (=> (not res!691831) (not e!586256))))

(assert (=> b!1036592 (= res!691831 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456604))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456604))) key!909)) ((_ is Cons!21948) (toList!6932 lt!456604)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456604))) key!909)))))

(declare-fun b!1036593 () Bool)

(assert (=> b!1036593 (= e!586256 (containsKey!564 (t!31148 (toList!6932 lt!456604)) key!909))))

(assert (= (and d!124847 (not res!691830)) b!1036592))

(assert (= (and b!1036592 res!691831) b!1036593))

(declare-fun m!956347 () Bool)

(assert (=> b!1036593 m!956347))

(assert (=> d!124431 d!124847))

(declare-fun c!104951 () Bool)

(declare-fun d!124849 () Bool)

(assert (=> d!124849 (= c!104951 (and ((_ is Cons!21948) (toList!6932 lt!456740)) (= (_1!7916 (h!23150 (toList!6932 lt!456740))) (_1!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(declare-fun e!586257 () Option!642)

(assert (=> d!124849 (= (getValueByKey!591 (toList!6932 lt!456740) (_1!7916 (tuple2!15811 lt!456652 lt!456582))) e!586257)))

(declare-fun b!1036597 () Bool)

(declare-fun e!586258 () Option!642)

(assert (=> b!1036597 (= e!586258 None!640)))

(declare-fun b!1036594 () Bool)

(assert (=> b!1036594 (= e!586257 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456740)))))))

(declare-fun b!1036595 () Bool)

(assert (=> b!1036595 (= e!586257 e!586258)))

(declare-fun c!104952 () Bool)

(assert (=> b!1036595 (= c!104952 (and ((_ is Cons!21948) (toList!6932 lt!456740)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456740))) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))))

(declare-fun b!1036596 () Bool)

(assert (=> b!1036596 (= e!586258 (getValueByKey!591 (t!31148 (toList!6932 lt!456740)) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (= (and d!124849 c!104951) b!1036594))

(assert (= (and d!124849 (not c!104951)) b!1036595))

(assert (= (and b!1036595 c!104952) b!1036596))

(assert (= (and b!1036595 (not c!104952)) b!1036597))

(declare-fun m!956349 () Bool)

(assert (=> b!1036596 m!956349))

(assert (=> b!1035939 d!124849))

(declare-fun d!124851 () Bool)

(declare-fun res!691832 () Bool)

(declare-fun e!586259 () Bool)

(assert (=> d!124851 (=> res!691832 e!586259)))

(assert (=> d!124851 (= res!691832 (and ((_ is Cons!21948) lt!456796) (= (_1!7916 (h!23150 lt!456796)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124851 (= (containsKey!564 lt!456796 #b1000000000000000000000000000000000000000000000000000000000000000) e!586259)))

(declare-fun b!1036598 () Bool)

(declare-fun e!586260 () Bool)

(assert (=> b!1036598 (= e!586259 e!586260)))

(declare-fun res!691833 () Bool)

(assert (=> b!1036598 (=> (not res!691833) (not e!586260))))

(assert (=> b!1036598 (= res!691833 (and (or (not ((_ is Cons!21948) lt!456796)) (bvsle (_1!7916 (h!23150 lt!456796)) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21948) lt!456796) (bvslt (_1!7916 (h!23150 lt!456796)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036599 () Bool)

(assert (=> b!1036599 (= e!586260 (containsKey!564 (t!31148 lt!456796) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124851 (not res!691832)) b!1036598))

(assert (= (and b!1036598 res!691833) b!1036599))

(declare-fun m!956351 () Bool)

(assert (=> b!1036599 m!956351))

(assert (=> b!1036018 d!124851))

(declare-fun d!124853 () Bool)

(declare-fun e!586261 () Bool)

(assert (=> d!124853 e!586261))

(declare-fun res!691834 () Bool)

(assert (=> d!124853 (=> res!691834 e!586261)))

(declare-fun lt!457075 () Bool)

(assert (=> d!124853 (= res!691834 (not lt!457075))))

(declare-fun lt!457074 () Bool)

(assert (=> d!124853 (= lt!457075 lt!457074)))

(declare-fun lt!457077 () Unit!33774)

(declare-fun e!586262 () Unit!33774)

(assert (=> d!124853 (= lt!457077 e!586262)))

(declare-fun c!104953 () Bool)

(assert (=> d!124853 (= c!104953 lt!457074)))

(assert (=> d!124853 (= lt!457074 (containsKey!564 (toList!6932 lt!456772) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124853 (= (contains!6001 lt!456772 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457075)))

(declare-fun b!1036600 () Bool)

(declare-fun lt!457076 () Unit!33774)

(assert (=> b!1036600 (= e!586262 lt!457076)))

(assert (=> b!1036600 (= lt!457076 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456772) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036600 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456772) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1036601 () Bool)

(declare-fun Unit!33813 () Unit!33774)

(assert (=> b!1036601 (= e!586262 Unit!33813)))

(declare-fun b!1036602 () Bool)

(assert (=> b!1036602 (= e!586261 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124853 c!104953) b!1036600))

(assert (= (and d!124853 (not c!104953)) b!1036601))

(assert (= (and d!124853 (not res!691834)) b!1036602))

(declare-fun m!956353 () Bool)

(assert (=> d!124853 m!956353))

(declare-fun m!956355 () Bool)

(assert (=> b!1036600 m!956355))

(declare-fun m!956357 () Bool)

(assert (=> b!1036600 m!956357))

(assert (=> b!1036600 m!956357))

(declare-fun m!956359 () Bool)

(assert (=> b!1036600 m!956359))

(assert (=> b!1036602 m!956357))

(assert (=> b!1036602 m!956357))

(assert (=> b!1036602 m!956359))

(assert (=> b!1035981 d!124853))

(declare-fun d!124855 () Bool)

(assert (=> d!124855 (arrayContainsKey!0 (_keys!11454 lt!456581) lt!456875 #b00000000000000000000000000000000)))

(declare-fun lt!457078 () Unit!33774)

(assert (=> d!124855 (= lt!457078 (choose!13 (_keys!11454 lt!456581) lt!456875 #b00000000000000000000000000000000))))

(assert (=> d!124855 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124855 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11454 lt!456581) lt!456875 #b00000000000000000000000000000000) lt!457078)))

(declare-fun bs!30329 () Bool)

(assert (= bs!30329 d!124855))

(assert (=> bs!30329 m!955651))

(declare-fun m!956361 () Bool)

(assert (=> bs!30329 m!956361))

(assert (=> b!1036113 d!124855))

(declare-fun d!124857 () Bool)

(declare-fun res!691835 () Bool)

(declare-fun e!586263 () Bool)

(assert (=> d!124857 (=> res!691835 e!586263)))

(assert (=> d!124857 (= res!691835 (= (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) lt!456875))))

(assert (=> d!124857 (= (arrayContainsKey!0 (_keys!11454 lt!456581) lt!456875 #b00000000000000000000000000000000) e!586263)))

(declare-fun b!1036603 () Bool)

(declare-fun e!586264 () Bool)

(assert (=> b!1036603 (= e!586263 e!586264)))

(declare-fun res!691836 () Bool)

(assert (=> b!1036603 (=> (not res!691836) (not e!586264))))

(assert (=> b!1036603 (= res!691836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))))))

(declare-fun b!1036604 () Bool)

(assert (=> b!1036604 (= e!586264 (arrayContainsKey!0 (_keys!11454 lt!456581) lt!456875 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124857 (not res!691835)) b!1036603))

(assert (= (and b!1036603 res!691836) b!1036604))

(assert (=> d!124857 m!955545))

(declare-fun m!956363 () Bool)

(assert (=> b!1036604 m!956363))

(assert (=> b!1036113 d!124857))

(declare-fun d!124859 () Bool)

(declare-fun lt!457080 () SeekEntryResult!9737)

(assert (=> d!124859 (and (or ((_ is Undefined!9737) lt!457080) (not ((_ is Found!9737) lt!457080)) (and (bvsge (index!41320 lt!457080) #b00000000000000000000000000000000) (bvslt (index!41320 lt!457080) (size!31928 (_keys!11454 lt!456581))))) (or ((_ is Undefined!9737) lt!457080) ((_ is Found!9737) lt!457080) (not ((_ is MissingZero!9737) lt!457080)) (and (bvsge (index!41319 lt!457080) #b00000000000000000000000000000000) (bvslt (index!41319 lt!457080) (size!31928 (_keys!11454 lt!456581))))) (or ((_ is Undefined!9737) lt!457080) ((_ is Found!9737) lt!457080) ((_ is MissingZero!9737) lt!457080) (not ((_ is MissingVacant!9737) lt!457080)) (and (bvsge (index!41322 lt!457080) #b00000000000000000000000000000000) (bvslt (index!41322 lt!457080) (size!31928 (_keys!11454 lt!456581))))) (or ((_ is Undefined!9737) lt!457080) (ite ((_ is Found!9737) lt!457080) (= (select (arr!31398 (_keys!11454 lt!456581)) (index!41320 lt!457080)) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9737) lt!457080) (= (select (arr!31398 (_keys!11454 lt!456581)) (index!41319 lt!457080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9737) lt!457080) (= (select (arr!31398 (_keys!11454 lt!456581)) (index!41322 lt!457080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!586265 () SeekEntryResult!9737)

(assert (=> d!124859 (= lt!457080 e!586265)))

(declare-fun c!104955 () Bool)

(declare-fun lt!457079 () SeekEntryResult!9737)

(assert (=> d!124859 (= c!104955 (and ((_ is Intermediate!9737) lt!457079) (undefined!10549 lt!457079)))))

(assert (=> d!124859 (= lt!457079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) (mask!30165 lt!456581)) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) (_keys!11454 lt!456581) (mask!30165 lt!456581)))))

(assert (=> d!124859 (validMask!0 (mask!30165 lt!456581))))

(assert (=> d!124859 (= (seekEntryOrOpen!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) (_keys!11454 lt!456581) (mask!30165 lt!456581)) lt!457080)))

(declare-fun b!1036605 () Bool)

(declare-fun e!586266 () SeekEntryResult!9737)

(assert (=> b!1036605 (= e!586266 (MissingZero!9737 (index!41321 lt!457079)))))

(declare-fun b!1036606 () Bool)

(assert (=> b!1036606 (= e!586266 (seekKeyOrZeroReturnVacant!0 (x!92460 lt!457079) (index!41321 lt!457079) (index!41321 lt!457079) (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) (_keys!11454 lt!456581) (mask!30165 lt!456581)))))

(declare-fun b!1036607 () Bool)

(declare-fun e!586267 () SeekEntryResult!9737)

(assert (=> b!1036607 (= e!586265 e!586267)))

(declare-fun lt!457081 () (_ BitVec 64))

(assert (=> b!1036607 (= lt!457081 (select (arr!31398 (_keys!11454 lt!456581)) (index!41321 lt!457079)))))

(declare-fun c!104954 () Bool)

(assert (=> b!1036607 (= c!104954 (= lt!457081 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(declare-fun b!1036608 () Bool)

(declare-fun c!104956 () Bool)

(assert (=> b!1036608 (= c!104956 (= lt!457081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1036608 (= e!586267 e!586266)))

(declare-fun b!1036609 () Bool)

(assert (=> b!1036609 (= e!586267 (Found!9737 (index!41321 lt!457079)))))

(declare-fun b!1036610 () Bool)

(assert (=> b!1036610 (= e!586265 Undefined!9737)))

(assert (= (and d!124859 c!104955) b!1036610))

(assert (= (and d!124859 (not c!104955)) b!1036607))

(assert (= (and b!1036607 c!104954) b!1036609))

(assert (= (and b!1036607 (not c!104954)) b!1036608))

(assert (= (and b!1036608 c!104956) b!1036605))

(assert (= (and b!1036608 (not c!104956)) b!1036606))

(assert (=> d!124859 m!955533))

(declare-fun m!956365 () Bool)

(assert (=> d!124859 m!956365))

(declare-fun m!956367 () Bool)

(assert (=> d!124859 m!956367))

(assert (=> d!124859 m!955545))

(declare-fun m!956369 () Bool)

(assert (=> d!124859 m!956369))

(declare-fun m!956371 () Bool)

(assert (=> d!124859 m!956371))

(declare-fun m!956373 () Bool)

(assert (=> d!124859 m!956373))

(assert (=> d!124859 m!955545))

(assert (=> d!124859 m!956367))

(assert (=> b!1036606 m!955545))

(declare-fun m!956375 () Bool)

(assert (=> b!1036606 m!956375))

(declare-fun m!956377 () Bool)

(assert (=> b!1036607 m!956377))

(assert (=> b!1036113 d!124859))

(assert (=> b!1036037 d!124733))

(declare-fun d!124861 () Bool)

(assert (=> d!124861 (= (apply!900 lt!456772 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) (get!16459 (getValueByKey!591 (toList!6932 lt!456772) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30330 () Bool)

(assert (= bs!30330 d!124861))

(assert (=> bs!30330 m!955067))

(assert (=> bs!30330 m!956309))

(assert (=> bs!30330 m!956309))

(declare-fun m!956379 () Bool)

(assert (=> bs!30330 m!956379))

(assert (=> b!1035977 d!124861))

(assert (=> b!1035977 d!124487))

(declare-fun d!124863 () Bool)

(declare-fun lt!457082 () Bool)

(assert (=> d!124863 (= lt!457082 (select (content!514 (toList!6932 lt!456881)) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun e!586268 () Bool)

(assert (=> d!124863 (= lt!457082 e!586268)))

(declare-fun res!691837 () Bool)

(assert (=> d!124863 (=> (not res!691837) (not e!586268))))

(assert (=> d!124863 (= res!691837 ((_ is Cons!21948) (toList!6932 lt!456881)))))

(assert (=> d!124863 (= (contains!6002 (toList!6932 lt!456881) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!457082)))

(declare-fun b!1036611 () Bool)

(declare-fun e!586269 () Bool)

(assert (=> b!1036611 (= e!586268 e!586269)))

(declare-fun res!691838 () Bool)

(assert (=> b!1036611 (=> res!691838 e!586269)))

(assert (=> b!1036611 (= res!691838 (= (h!23150 (toList!6932 lt!456881)) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1036612 () Bool)

(assert (=> b!1036612 (= e!586269 (contains!6002 (t!31148 (toList!6932 lt!456881)) (ite (or c!104729 c!104727) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (= (and d!124863 res!691837) b!1036611))

(assert (= (and b!1036611 (not res!691838)) b!1036612))

(declare-fun m!956381 () Bool)

(assert (=> d!124863 m!956381))

(declare-fun m!956383 () Bool)

(assert (=> d!124863 m!956383))

(declare-fun m!956385 () Bool)

(assert (=> b!1036612 m!956385))

(assert (=> b!1036122 d!124863))

(declare-fun d!124865 () Bool)

(assert (=> d!124865 (= (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!456656)) (v!14930 (getValueByKey!591 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!456656)))))

(assert (=> d!124467 d!124865))

(declare-fun c!104957 () Bool)

(declare-fun d!124867 () Bool)

(assert (=> d!124867 (= c!104957 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))) lt!456656)))))

(declare-fun e!586270 () Option!642)

(assert (=> d!124867 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))) lt!456656) e!586270)))

(declare-fun b!1036616 () Bool)

(declare-fun e!586271 () Option!642)

(assert (=> b!1036616 (= e!586271 None!640)))

(declare-fun b!1036613 () Bool)

(assert (=> b!1036613 (= e!586270 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))))))))

(declare-fun b!1036614 () Bool)

(assert (=> b!1036614 (= e!586270 e!586271)))

(declare-fun c!104958 () Bool)

(assert (=> b!1036614 (= c!104958 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427)))))) lt!456656))))))

(declare-fun b!1036615 () Bool)

(assert (=> b!1036615 (= e!586271 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))))) lt!456656))))

(assert (= (and d!124867 c!104957) b!1036613))

(assert (= (and d!124867 (not c!104957)) b!1036614))

(assert (= (and b!1036614 c!104958) b!1036615))

(assert (= (and b!1036614 (not c!104958)) b!1036616))

(declare-fun m!956387 () Bool)

(assert (=> b!1036615 m!956387))

(assert (=> d!124467 d!124867))

(assert (=> b!1036069 d!124639))

(declare-fun b!1036617 () Bool)

(declare-fun e!586272 () (_ BitVec 32))

(assert (=> b!1036617 (= e!586272 #b00000000000000000000000000000000)))

(declare-fun d!124869 () Bool)

(declare-fun lt!457083 () (_ BitVec 32))

(assert (=> d!124869 (and (bvsge lt!457083 #b00000000000000000000000000000000) (bvsle lt!457083 (bvsub (size!31928 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124869 (= lt!457083 e!586272)))

(declare-fun c!104959 () Bool)

(assert (=> d!124869 (= c!104959 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124869 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31928 (_keys!11454 thiss!1427)) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124869 (= (arrayCountValidKeys!0 (_keys!11454 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))) lt!457083)))

(declare-fun b!1036618 () Bool)

(declare-fun e!586273 () (_ BitVec 32))

(assert (=> b!1036618 (= e!586272 e!586273)))

(declare-fun c!104960 () Bool)

(assert (=> b!1036618 (= c!104960 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43863 () Bool)

(declare-fun call!43866 () (_ BitVec 32))

(assert (=> bm!43863 (= call!43866 (arrayCountValidKeys!0 (_keys!11454 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(declare-fun b!1036619 () Bool)

(assert (=> b!1036619 (= e!586273 (bvadd #b00000000000000000000000000000001 call!43866))))

(declare-fun b!1036620 () Bool)

(assert (=> b!1036620 (= e!586273 call!43866)))

(assert (= (and d!124869 c!104959) b!1036617))

(assert (= (and d!124869 (not c!104959)) b!1036618))

(assert (= (and b!1036618 c!104960) b!1036619))

(assert (= (and b!1036618 (not c!104960)) b!1036620))

(assert (= (or b!1036619 b!1036620) bm!43863))

(assert (=> b!1036618 m!956015))

(assert (=> b!1036618 m!956015))

(assert (=> b!1036618 m!956017))

(declare-fun m!956389 () Bool)

(assert (=> bm!43863 m!956389))

(assert (=> bm!43808 d!124869))

(declare-fun d!124871 () Bool)

(declare-fun lt!457084 () Bool)

(assert (=> d!124871 (= lt!457084 (select (content!514 (toList!6932 lt!456726)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))

(declare-fun e!586274 () Bool)

(assert (=> d!124871 (= lt!457084 e!586274)))

(declare-fun res!691839 () Bool)

(assert (=> d!124871 (=> (not res!691839) (not e!586274))))

(assert (=> d!124871 (= res!691839 ((_ is Cons!21948) (toList!6932 lt!456726)))))

(assert (=> d!124871 (= (contains!6002 (toList!6932 lt!456726) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)) lt!457084)))

(declare-fun b!1036621 () Bool)

(declare-fun e!586275 () Bool)

(assert (=> b!1036621 (= e!586274 e!586275)))

(declare-fun res!691840 () Bool)

(assert (=> b!1036621 (=> res!691840 e!586275)))

(assert (=> b!1036621 (= res!691840 (= (h!23150 (toList!6932 lt!456726)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))

(declare-fun b!1036622 () Bool)

(assert (=> b!1036622 (= e!586275 (contains!6002 (t!31148 (toList!6932 lt!456726)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 lt!456582)))))

(assert (= (and d!124871 res!691839) b!1036621))

(assert (= (and b!1036621 (not res!691840)) b!1036622))

(declare-fun m!956391 () Bool)

(assert (=> d!124871 m!956391))

(declare-fun m!956393 () Bool)

(assert (=> d!124871 m!956393))

(declare-fun m!956395 () Bool)

(assert (=> b!1036622 m!956395))

(assert (=> b!1035930 d!124871))

(assert (=> b!1036075 d!124675))

(assert (=> b!1036075 d!124677))

(declare-fun d!124873 () Bool)

(declare-fun lt!457085 () Bool)

(assert (=> d!124873 (= lt!457085 (select (content!514 (toList!6932 lt!456824)) (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))

(declare-fun e!586276 () Bool)

(assert (=> d!124873 (= lt!457085 e!586276)))

(declare-fun res!691841 () Bool)

(assert (=> d!124873 (=> (not res!691841) (not e!586276))))

(assert (=> d!124873 (= res!691841 ((_ is Cons!21948) (toList!6932 lt!456824)))))

(assert (=> d!124873 (= (contains!6002 (toList!6932 lt!456824) (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) lt!457085)))

(declare-fun b!1036623 () Bool)

(declare-fun e!586277 () Bool)

(assert (=> b!1036623 (= e!586276 e!586277)))

(declare-fun res!691842 () Bool)

(assert (=> b!1036623 (=> res!691842 e!586277)))

(assert (=> b!1036623 (= res!691842 (= (h!23150 (toList!6932 lt!456824)) (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))

(declare-fun b!1036624 () Bool)

(assert (=> b!1036624 (= e!586277 (contains!6002 (t!31148 (toList!6932 lt!456824)) (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))

(assert (= (and d!124873 res!691841) b!1036623))

(assert (= (and b!1036623 (not res!691842)) b!1036624))

(declare-fun m!956397 () Bool)

(assert (=> d!124873 m!956397))

(declare-fun m!956399 () Bool)

(assert (=> d!124873 m!956399))

(declare-fun m!956401 () Bool)

(assert (=> b!1036624 m!956401))

(assert (=> b!1036043 d!124873))

(declare-fun d!124875 () Bool)

(declare-fun e!586278 () Bool)

(assert (=> d!124875 e!586278))

(declare-fun res!691843 () Bool)

(assert (=> d!124875 (=> res!691843 e!586278)))

(declare-fun lt!457087 () Bool)

(assert (=> d!124875 (= res!691843 (not lt!457087))))

(declare-fun lt!457086 () Bool)

(assert (=> d!124875 (= lt!457087 lt!457086)))

(declare-fun lt!457089 () Unit!33774)

(declare-fun e!586279 () Unit!33774)

(assert (=> d!124875 (= lt!457089 e!586279)))

(declare-fun c!104961 () Bool)

(assert (=> d!124875 (= c!104961 lt!457086)))

(assert (=> d!124875 (= lt!457086 (containsKey!564 (toList!6932 lt!456740) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (=> d!124875 (= (contains!6001 lt!456740 (_1!7916 (tuple2!15811 lt!456652 lt!456582))) lt!457087)))

(declare-fun b!1036625 () Bool)

(declare-fun lt!457088 () Unit!33774)

(assert (=> b!1036625 (= e!586279 lt!457088)))

(assert (=> b!1036625 (= lt!457088 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456740) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (=> b!1036625 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456740) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun b!1036626 () Bool)

(declare-fun Unit!33814 () Unit!33774)

(assert (=> b!1036626 (= e!586279 Unit!33814)))

(declare-fun b!1036627 () Bool)

(assert (=> b!1036627 (= e!586278 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456740) (_1!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(assert (= (and d!124875 c!104961) b!1036625))

(assert (= (and d!124875 (not c!104961)) b!1036626))

(assert (= (and d!124875 (not res!691843)) b!1036627))

(declare-fun m!956403 () Bool)

(assert (=> d!124875 m!956403))

(declare-fun m!956405 () Bool)

(assert (=> b!1036625 m!956405))

(assert (=> b!1036625 m!955265))

(assert (=> b!1036625 m!955265))

(declare-fun m!956407 () Bool)

(assert (=> b!1036625 m!956407))

(assert (=> b!1036627 m!955265))

(assert (=> b!1036627 m!955265))

(assert (=> b!1036627 m!956407))

(assert (=> d!124449 d!124875))

(declare-fun d!124877 () Bool)

(declare-fun c!104962 () Bool)

(assert (=> d!124877 (= c!104962 (and ((_ is Cons!21948) lt!456741) (= (_1!7916 (h!23150 lt!456741)) (_1!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(declare-fun e!586280 () Option!642)

(assert (=> d!124877 (= (getValueByKey!591 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582))) e!586280)))

(declare-fun b!1036631 () Bool)

(declare-fun e!586281 () Option!642)

(assert (=> b!1036631 (= e!586281 None!640)))

(declare-fun b!1036628 () Bool)

(assert (=> b!1036628 (= e!586280 (Some!641 (_2!7916 (h!23150 lt!456741))))))

(declare-fun b!1036629 () Bool)

(assert (=> b!1036629 (= e!586280 e!586281)))

(declare-fun c!104963 () Bool)

(assert (=> b!1036629 (= c!104963 (and ((_ is Cons!21948) lt!456741) (not (= (_1!7916 (h!23150 lt!456741)) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))))

(declare-fun b!1036630 () Bool)

(assert (=> b!1036630 (= e!586281 (getValueByKey!591 (t!31148 lt!456741) (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(assert (= (and d!124877 c!104962) b!1036628))

(assert (= (and d!124877 (not c!104962)) b!1036629))

(assert (= (and b!1036629 c!104963) b!1036630))

(assert (= (and b!1036629 (not c!104963)) b!1036631))

(declare-fun m!956409 () Bool)

(assert (=> b!1036630 m!956409))

(assert (=> d!124449 d!124877))

(declare-fun d!124879 () Bool)

(assert (=> d!124879 (= (getValueByKey!591 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582))) (Some!641 (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun lt!457090 () Unit!33774)

(assert (=> d!124879 (= lt!457090 (choose!1714 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun e!586282 () Bool)

(assert (=> d!124879 e!586282))

(declare-fun res!691844 () Bool)

(assert (=> d!124879 (=> (not res!691844) (not e!586282))))

(assert (=> d!124879 (= res!691844 (isStrictlySorted!715 lt!456741))))

(assert (=> d!124879 (= (lemmaContainsTupThenGetReturnValue!281 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))) lt!457090)))

(declare-fun b!1036632 () Bool)

(declare-fun res!691845 () Bool)

(assert (=> b!1036632 (=> (not res!691845) (not e!586282))))

(assert (=> b!1036632 (= res!691845 (containsKey!564 lt!456741 (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun b!1036633 () Bool)

(assert (=> b!1036633 (= e!586282 (contains!6002 lt!456741 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(assert (= (and d!124879 res!691844) b!1036632))

(assert (= (and b!1036632 res!691845) b!1036633))

(assert (=> d!124879 m!955259))

(declare-fun m!956411 () Bool)

(assert (=> d!124879 m!956411))

(declare-fun m!956413 () Bool)

(assert (=> d!124879 m!956413))

(declare-fun m!956415 () Bool)

(assert (=> b!1036632 m!956415))

(declare-fun m!956417 () Bool)

(assert (=> b!1036633 m!956417))

(assert (=> d!124449 d!124879))

(declare-fun b!1036634 () Bool)

(declare-fun e!586285 () List!21952)

(declare-fun call!43867 () List!21952)

(assert (=> b!1036634 (= e!586285 call!43867)))

(declare-fun b!1036635 () Bool)

(declare-fun e!586284 () List!21952)

(declare-fun call!43868 () List!21952)

(assert (=> b!1036635 (= e!586284 call!43868)))

(declare-fun b!1036636 () Bool)

(declare-fun res!691846 () Bool)

(declare-fun e!586286 () Bool)

(assert (=> b!1036636 (=> (not res!691846) (not e!586286))))

(declare-fun lt!457091 () List!21952)

(assert (=> b!1036636 (= res!691846 (containsKey!564 lt!457091 (_1!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun b!1036637 () Bool)

(assert (=> b!1036637 (= e!586285 e!586284)))

(declare-fun c!104965 () Bool)

(assert (=> b!1036637 (= c!104965 (and ((_ is Cons!21948) (toList!6932 lt!456668)) (= (_1!7916 (h!23150 (toList!6932 lt!456668))) (_1!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(declare-fun bm!43864 () Bool)

(assert (=> bm!43864 (= call!43868 call!43867)))

(declare-fun b!1036638 () Bool)

(declare-fun e!586283 () List!21952)

(declare-fun call!43869 () List!21952)

(assert (=> b!1036638 (= e!586283 call!43869)))

(declare-fun b!1036639 () Bool)

(declare-fun c!104967 () Bool)

(declare-fun e!586287 () List!21952)

(assert (=> b!1036639 (= e!586287 (ite c!104965 (t!31148 (toList!6932 lt!456668)) (ite c!104967 (Cons!21948 (h!23150 (toList!6932 lt!456668)) (t!31148 (toList!6932 lt!456668))) Nil!21949)))))

(declare-fun b!1036640 () Bool)

(assert (=> b!1036640 (= e!586283 call!43869)))

(declare-fun bm!43865 () Bool)

(declare-fun c!104964 () Bool)

(assert (=> bm!43865 (= call!43867 ($colon$colon!605 e!586287 (ite c!104964 (h!23150 (toList!6932 lt!456668)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))))

(declare-fun c!104966 () Bool)

(assert (=> bm!43865 (= c!104966 c!104964)))

(declare-fun bm!43866 () Bool)

(assert (=> bm!43866 (= call!43869 call!43868)))

(declare-fun b!1036641 () Bool)

(assert (=> b!1036641 (= e!586287 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456668)) (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))))))

(declare-fun b!1036642 () Bool)

(assert (=> b!1036642 (= e!586286 (contains!6002 lt!457091 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(declare-fun d!124881 () Bool)

(assert (=> d!124881 e!586286))

(declare-fun res!691847 () Bool)

(assert (=> d!124881 (=> (not res!691847) (not e!586286))))

(assert (=> d!124881 (= res!691847 (isStrictlySorted!715 lt!457091))))

(assert (=> d!124881 (= lt!457091 e!586285)))

(assert (=> d!124881 (= c!104964 (and ((_ is Cons!21948) (toList!6932 lt!456668)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456668))) (_1!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(assert (=> d!124881 (isStrictlySorted!715 (toList!6932 lt!456668))))

(assert (=> d!124881 (= (insertStrictlySorted!374 (toList!6932 lt!456668) (_1!7916 (tuple2!15811 lt!456652 lt!456582)) (_2!7916 (tuple2!15811 lt!456652 lt!456582))) lt!457091)))

(declare-fun b!1036643 () Bool)

(assert (=> b!1036643 (= c!104967 (and ((_ is Cons!21948) (toList!6932 lt!456668)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456668))) (_1!7916 (tuple2!15811 lt!456652 lt!456582)))))))

(assert (=> b!1036643 (= e!586284 e!586283)))

(assert (= (and d!124881 c!104964) b!1036634))

(assert (= (and d!124881 (not c!104964)) b!1036637))

(assert (= (and b!1036637 c!104965) b!1036635))

(assert (= (and b!1036637 (not c!104965)) b!1036643))

(assert (= (and b!1036643 c!104967) b!1036638))

(assert (= (and b!1036643 (not c!104967)) b!1036640))

(assert (= (or b!1036638 b!1036640) bm!43866))

(assert (= (or b!1036635 bm!43866) bm!43864))

(assert (= (or b!1036634 bm!43864) bm!43865))

(assert (= (and bm!43865 c!104966) b!1036641))

(assert (= (and bm!43865 (not c!104966)) b!1036639))

(assert (= (and d!124881 res!691847) b!1036636))

(assert (= (and b!1036636 res!691846) b!1036642))

(declare-fun m!956419 () Bool)

(assert (=> b!1036642 m!956419))

(declare-fun m!956421 () Bool)

(assert (=> b!1036636 m!956421))

(declare-fun m!956423 () Bool)

(assert (=> b!1036641 m!956423))

(declare-fun m!956425 () Bool)

(assert (=> bm!43865 m!956425))

(declare-fun m!956427 () Bool)

(assert (=> d!124881 m!956427))

(declare-fun m!956429 () Bool)

(assert (=> d!124881 m!956429))

(assert (=> d!124449 d!124881))

(declare-fun d!124883 () Bool)

(assert (=> d!124883 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14930 (getValueByKey!591 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124547 d!124883))

(assert (=> d!124547 d!124587))

(assert (=> b!1035990 d!124635))

(assert (=> b!1035990 d!124637))

(declare-fun d!124885 () Bool)

(declare-fun e!586288 () Bool)

(assert (=> d!124885 e!586288))

(declare-fun res!691849 () Bool)

(assert (=> d!124885 (=> (not res!691849) (not e!586288))))

(declare-fun lt!457094 () ListLongMap!13833)

(assert (=> d!124885 (= res!691849 (contains!6001 lt!457094 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))

(declare-fun lt!457095 () List!21952)

(assert (=> d!124885 (= lt!457094 (ListLongMap!13834 lt!457095))))

(declare-fun lt!457093 () Unit!33774)

(declare-fun lt!457092 () Unit!33774)

(assert (=> d!124885 (= lt!457093 lt!457092)))

(assert (=> d!124885 (= (getValueByKey!591 lt!457095 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))

(assert (=> d!124885 (= lt!457092 (lemmaContainsTupThenGetReturnValue!281 lt!457095 (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))

(assert (=> d!124885 (= lt!457095 (insertStrictlySorted!374 (toList!6932 call!43813) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))) (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))

(assert (=> d!124885 (= (+!3131 call!43813 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))) lt!457094)))

(declare-fun b!1036644 () Bool)

(declare-fun res!691848 () Bool)

(assert (=> b!1036644 (=> (not res!691848) (not e!586288))))

(assert (=> b!1036644 (= res!691848 (= (getValueByKey!591 (toList!6932 lt!457094) (_1!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))))

(declare-fun b!1036645 () Bool)

(assert (=> b!1036645 (= e!586288 (contains!6002 (toList!6932 lt!457094) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))

(assert (= (and d!124885 res!691849) b!1036644))

(assert (= (and b!1036644 res!691848) b!1036645))

(declare-fun m!956431 () Bool)

(assert (=> d!124885 m!956431))

(declare-fun m!956433 () Bool)

(assert (=> d!124885 m!956433))

(declare-fun m!956435 () Bool)

(assert (=> d!124885 m!956435))

(declare-fun m!956437 () Bool)

(assert (=> d!124885 m!956437))

(declare-fun m!956439 () Bool)

(assert (=> b!1036644 m!956439))

(declare-fun m!956441 () Bool)

(assert (=> b!1036645 m!956441))

(assert (=> b!1036066 d!124885))

(assert (=> b!1036041 d!124477))

(declare-fun d!124887 () Bool)

(assert (=> d!124887 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14930 (getValueByKey!591 (toList!6932 lt!456682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124489 d!124887))

(assert (=> d!124489 d!124677))

(assert (=> b!1035922 d!124623))

(declare-fun b!1036646 () Bool)

(declare-fun e!586289 () ListLongMap!13833)

(declare-fun call!43870 () ListLongMap!13833)

(assert (=> b!1036646 (= e!586289 call!43870)))

(declare-fun b!1036647 () Bool)

(declare-fun e!586291 () Bool)

(declare-fun e!586292 () Bool)

(assert (=> b!1036647 (= e!586291 e!586292)))

(declare-fun c!104969 () Bool)

(declare-fun e!586293 () Bool)

(assert (=> b!1036647 (= c!104969 e!586293)))

(declare-fun res!691853 () Bool)

(assert (=> b!1036647 (=> (not res!691853) (not e!586293))))

(assert (=> b!1036647 (= res!691853 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(declare-fun bm!43867 () Bool)

(assert (=> bm!43867 (= call!43870 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 lt!456581)))))

(declare-fun d!124889 () Bool)

(assert (=> d!124889 e!586291))

(declare-fun res!691851 () Bool)

(assert (=> d!124889 (=> (not res!691851) (not e!586291))))

(declare-fun lt!457100 () ListLongMap!13833)

(assert (=> d!124889 (= res!691851 (not (contains!6001 lt!457100 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586290 () ListLongMap!13833)

(assert (=> d!124889 (= lt!457100 e!586290)))

(declare-fun c!104968 () Bool)

(assert (=> d!124889 (= c!104968 (bvsge #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124889 (validMask!0 (mask!30165 lt!456581))))

(assert (=> d!124889 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) #b00000000000000000000000000000000 (defaultEntry!6269 lt!456581)) lt!457100)))

(declare-fun b!1036648 () Bool)

(assert (=> b!1036648 (= e!586293 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (=> b!1036648 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1036649 () Bool)

(declare-fun e!586294 () Bool)

(assert (=> b!1036649 (= e!586292 e!586294)))

(declare-fun c!104970 () Bool)

(assert (=> b!1036649 (= c!104970 (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(declare-fun b!1036650 () Bool)

(declare-fun lt!457101 () Unit!33774)

(declare-fun lt!457097 () Unit!33774)

(assert (=> b!1036650 (= lt!457101 lt!457097)))

(declare-fun lt!457099 () ListLongMap!13833)

(declare-fun lt!457096 () (_ BitVec 64))

(declare-fun lt!457102 () V!37667)

(declare-fun lt!457098 () (_ BitVec 64))

(assert (=> b!1036650 (not (contains!6001 (+!3131 lt!457099 (tuple2!15811 lt!457096 lt!457102)) lt!457098))))

(assert (=> b!1036650 (= lt!457097 (addStillNotContains!244 lt!457099 lt!457096 lt!457102 lt!457098))))

(assert (=> b!1036650 (= lt!457098 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1036650 (= lt!457102 (get!16458 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036650 (= lt!457096 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000))))

(assert (=> b!1036650 (= lt!457099 call!43870)))

(assert (=> b!1036650 (= e!586289 (+!3131 call!43870 (tuple2!15811 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) (get!16458 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1036651 () Bool)

(declare-fun e!586295 () Bool)

(assert (=> b!1036651 (= e!586292 e!586295)))

(assert (=> b!1036651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(declare-fun res!691852 () Bool)

(assert (=> b!1036651 (= res!691852 (contains!6001 lt!457100 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (=> b!1036651 (=> (not res!691852) (not e!586295))))

(declare-fun b!1036652 () Bool)

(assert (=> b!1036652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31928 (_keys!11454 lt!456581))))))

(assert (=> b!1036652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31929 (_values!6292 lt!456581))))))

(assert (=> b!1036652 (= e!586295 (= (apply!900 lt!457100 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)) (get!16458 (select (arr!31399 (_values!6292 lt!456581)) #b00000000000000000000000000000000) (dynLambda!1985 (defaultEntry!6269 lt!456581) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036653 () Bool)

(assert (=> b!1036653 (= e!586294 (= lt!457100 (getCurrentListMapNoExtraKeys!3566 (_keys!11454 lt!456581) (_values!6292 lt!456581) (mask!30165 lt!456581) (extraKeys!5999 lt!456581) (zeroValue!6103 lt!456581) (minValue!6105 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 lt!456581))))))

(declare-fun b!1036654 () Bool)

(assert (=> b!1036654 (= e!586290 (ListLongMap!13834 Nil!21949))))

(declare-fun b!1036655 () Bool)

(assert (=> b!1036655 (= e!586294 (isEmpty!934 lt!457100))))

(declare-fun b!1036656 () Bool)

(declare-fun res!691850 () Bool)

(assert (=> b!1036656 (=> (not res!691850) (not e!586291))))

(assert (=> b!1036656 (= res!691850 (not (contains!6001 lt!457100 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036657 () Bool)

(assert (=> b!1036657 (= e!586290 e!586289)))

(declare-fun c!104971 () Bool)

(assert (=> b!1036657 (= c!104971 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000)))))

(assert (= (and d!124889 c!104968) b!1036654))

(assert (= (and d!124889 (not c!104968)) b!1036657))

(assert (= (and b!1036657 c!104971) b!1036650))

(assert (= (and b!1036657 (not c!104971)) b!1036646))

(assert (= (or b!1036650 b!1036646) bm!43867))

(assert (= (and d!124889 res!691851) b!1036656))

(assert (= (and b!1036656 res!691850) b!1036647))

(assert (= (and b!1036647 res!691853) b!1036648))

(assert (= (and b!1036647 c!104969) b!1036651))

(assert (= (and b!1036647 (not c!104969)) b!1036649))

(assert (= (and b!1036651 res!691852) b!1036652))

(assert (= (and b!1036649 c!104970) b!1036653))

(assert (= (and b!1036649 (not c!104970)) b!1036655))

(declare-fun b_lambda!16121 () Bool)

(assert (=> (not b_lambda!16121) (not b!1036650)))

(assert (=> b!1036650 t!31157))

(declare-fun b_and!33383 () Bool)

(assert (= b_and!33381 (and (=> t!31157 result!14423) b_and!33383)))

(declare-fun b_lambda!16123 () Bool)

(assert (=> (not b_lambda!16123) (not b!1036652)))

(assert (=> b!1036652 t!31157))

(declare-fun b_and!33385 () Bool)

(assert (= b_and!33383 (and (=> t!31157 result!14423) b_and!33385)))

(declare-fun m!956443 () Bool)

(assert (=> b!1036655 m!956443))

(declare-fun m!956445 () Bool)

(assert (=> b!1036653 m!956445))

(declare-fun m!956447 () Bool)

(assert (=> b!1036656 m!956447))

(assert (=> b!1036657 m!955545))

(assert (=> b!1036657 m!955545))

(assert (=> b!1036657 m!955561))

(assert (=> b!1036652 m!955549))

(assert (=> b!1036652 m!955551))

(assert (=> b!1036652 m!955545))

(assert (=> b!1036652 m!955551))

(assert (=> b!1036652 m!955549))

(assert (=> b!1036652 m!955553))

(assert (=> b!1036652 m!955545))

(declare-fun m!956449 () Bool)

(assert (=> b!1036652 m!956449))

(declare-fun m!956451 () Bool)

(assert (=> d!124889 m!956451))

(assert (=> d!124889 m!955533))

(declare-fun m!956453 () Bool)

(assert (=> b!1036650 m!956453))

(assert (=> b!1036650 m!955549))

(assert (=> b!1036650 m!956453))

(declare-fun m!956455 () Bool)

(assert (=> b!1036650 m!956455))

(assert (=> b!1036650 m!955545))

(assert (=> b!1036650 m!955551))

(assert (=> b!1036650 m!955549))

(assert (=> b!1036650 m!955553))

(declare-fun m!956457 () Bool)

(assert (=> b!1036650 m!956457))

(assert (=> b!1036650 m!955551))

(declare-fun m!956459 () Bool)

(assert (=> b!1036650 m!956459))

(assert (=> b!1036648 m!955545))

(assert (=> b!1036648 m!955545))

(assert (=> b!1036648 m!955561))

(assert (=> bm!43867 m!956445))

(assert (=> b!1036651 m!955545))

(assert (=> b!1036651 m!955545))

(declare-fun m!956461 () Bool)

(assert (=> b!1036651 m!956461))

(assert (=> bm!43812 d!124889))

(declare-fun d!124891 () Bool)

(assert (=> d!124891 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))) (v!14930 (getValueByKey!591 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124555 d!124891))

(assert (=> d!124555 d!124607))

(declare-fun d!124893 () Bool)

(declare-fun res!691858 () Bool)

(declare-fun e!586300 () Bool)

(assert (=> d!124893 (=> res!691858 e!586300)))

(assert (=> d!124893 (= res!691858 (or ((_ is Nil!21949) lt!456796) ((_ is Nil!21949) (t!31148 lt!456796))))))

(assert (=> d!124893 (= (isStrictlySorted!715 lt!456796) e!586300)))

(declare-fun b!1036662 () Bool)

(declare-fun e!586301 () Bool)

(assert (=> b!1036662 (= e!586300 e!586301)))

(declare-fun res!691859 () Bool)

(assert (=> b!1036662 (=> (not res!691859) (not e!586301))))

(assert (=> b!1036662 (= res!691859 (bvslt (_1!7916 (h!23150 lt!456796)) (_1!7916 (h!23150 (t!31148 lt!456796)))))))

(declare-fun b!1036663 () Bool)

(assert (=> b!1036663 (= e!586301 (isStrictlySorted!715 (t!31148 lt!456796)))))

(assert (= (and d!124893 (not res!691858)) b!1036662))

(assert (= (and b!1036662 res!691859) b!1036663))

(declare-fun m!956463 () Bool)

(assert (=> b!1036663 m!956463))

(assert (=> d!124495 d!124893))

(declare-fun d!124895 () Bool)

(declare-fun res!691860 () Bool)

(declare-fun e!586302 () Bool)

(assert (=> d!124895 (=> res!691860 e!586302)))

(assert (=> d!124895 (= res!691860 (or ((_ is Nil!21949) (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) ((_ is Nil!21949) (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))))

(assert (=> d!124895 (= (isStrictlySorted!715 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) e!586302)))

(declare-fun b!1036664 () Bool)

(declare-fun e!586303 () Bool)

(assert (=> b!1036664 (= e!586302 e!586303)))

(declare-fun res!691861 () Bool)

(assert (=> b!1036664 (=> (not res!691861) (not e!586303))))

(assert (=> b!1036664 (= res!691861 (bvslt (_1!7916 (h!23150 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (_1!7916 (h!23150 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))))

(declare-fun b!1036665 () Bool)

(assert (=> b!1036665 (= e!586303 (isStrictlySorted!715 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))

(assert (= (and d!124895 (not res!691860)) b!1036664))

(assert (= (and b!1036664 res!691861) b!1036665))

(declare-fun m!956465 () Bool)

(assert (=> b!1036665 m!956465))

(assert (=> d!124495 d!124895))

(declare-fun d!124897 () Bool)

(assert (=> d!124897 (= (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!456680)) (v!14930 (getValueByKey!591 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!456680)))))

(assert (=> d!124521 d!124897))

(declare-fun c!104972 () Bool)

(declare-fun d!124899 () Bool)

(assert (=> d!124899 (= c!104972 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))) lt!456680)))))

(declare-fun e!586304 () Option!642)

(assert (=> d!124899 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))) lt!456680) e!586304)))

(declare-fun b!1036669 () Bool)

(declare-fun e!586305 () Option!642)

(assert (=> b!1036669 (= e!586305 None!640)))

(declare-fun b!1036666 () Bool)

(assert (=> b!1036666 (= e!586304 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))))))))

(declare-fun b!1036667 () Bool)

(assert (=> b!1036667 (= e!586304 e!586305)))

(declare-fun c!104973 () Bool)

(assert (=> b!1036667 (= c!104973 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427)))))) lt!456680))))))

(declare-fun b!1036668 () Bool)

(assert (=> b!1036668 (= e!586305 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))))) lt!456680))))

(assert (= (and d!124899 c!104972) b!1036666))

(assert (= (and d!124899 (not c!104972)) b!1036667))

(assert (= (and b!1036667 c!104973) b!1036668))

(assert (= (and b!1036667 (not c!104973)) b!1036669))

(declare-fun m!956467 () Bool)

(assert (=> b!1036668 m!956467))

(assert (=> d!124521 d!124899))

(declare-fun d!124901 () Bool)

(declare-fun res!691862 () Bool)

(declare-fun e!586306 () Bool)

(assert (=> d!124901 (=> res!691862 e!586306)))

(assert (=> d!124901 (= res!691862 (and ((_ is Cons!21948) (toList!6932 lt!456693)) (= (_1!7916 (h!23150 (toList!6932 lt!456693))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124901 (= (containsKey!564 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000) e!586306)))

(declare-fun b!1036670 () Bool)

(declare-fun e!586307 () Bool)

(assert (=> b!1036670 (= e!586306 e!586307)))

(declare-fun res!691863 () Bool)

(assert (=> b!1036670 (=> (not res!691863) (not e!586307))))

(assert (=> b!1036670 (= res!691863 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456693))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456693))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21948) (toList!6932 lt!456693)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456693))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036671 () Bool)

(assert (=> b!1036671 (= e!586307 (containsKey!564 (t!31148 (toList!6932 lt!456693)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124901 (not res!691862)) b!1036670))

(assert (= (and b!1036670 res!691863) b!1036671))

(declare-fun m!956469 () Bool)

(assert (=> b!1036671 m!956469))

(assert (=> d!124493 d!124901))

(assert (=> b!1036021 d!124697))

(assert (=> b!1036021 d!124699))

(declare-fun c!104974 () Bool)

(declare-fun d!124903 () Bool)

(assert (=> d!124903 (= c!104974 (and ((_ is Cons!21948) (toList!6932 lt!456748)) (= (_1!7916 (h!23150 (toList!6932 lt!456748))) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586308 () Option!642)

(assert (=> d!124903 (= (getValueByKey!591 (toList!6932 lt!456748) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) e!586308)))

(declare-fun b!1036675 () Bool)

(declare-fun e!586309 () Option!642)

(assert (=> b!1036675 (= e!586309 None!640)))

(declare-fun b!1036672 () Bool)

(assert (=> b!1036672 (= e!586308 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456748)))))))

(declare-fun b!1036673 () Bool)

(assert (=> b!1036673 (= e!586308 e!586309)))

(declare-fun c!104975 () Bool)

(assert (=> b!1036673 (= c!104975 (and ((_ is Cons!21948) (toList!6932 lt!456748)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456748))) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036674 () Bool)

(assert (=> b!1036674 (= e!586309 (getValueByKey!591 (t!31148 (toList!6932 lt!456748)) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124903 c!104974) b!1036672))

(assert (= (and d!124903 (not c!104974)) b!1036673))

(assert (= (and b!1036673 c!104975) b!1036674))

(assert (= (and b!1036673 (not c!104975)) b!1036675))

(declare-fun m!956471 () Bool)

(assert (=> b!1036674 m!956471))

(assert (=> b!1035943 d!124903))

(declare-fun bm!43868 () Bool)

(declare-fun call!43871 () Bool)

(assert (=> bm!43868 (= call!43871 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)))))

(declare-fun b!1036676 () Bool)

(declare-fun e!586312 () Bool)

(declare-fun e!586311 () Bool)

(assert (=> b!1036676 (= e!586312 e!586311)))

(declare-fun lt!457103 () (_ BitVec 64))

(assert (=> b!1036676 (= lt!457103 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457104 () Unit!33774)

(assert (=> b!1036676 (= lt!457104 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11454 thiss!1427) lt!457103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1036676 (arrayContainsKey!0 (_keys!11454 thiss!1427) lt!457103 #b00000000000000000000000000000000)))

(declare-fun lt!457105 () Unit!33774)

(assert (=> b!1036676 (= lt!457105 lt!457104)))

(declare-fun res!691865 () Bool)

(assert (=> b!1036676 (= res!691865 (= (seekEntryOrOpen!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)) (Found!9737 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1036676 (=> (not res!691865) (not e!586311))))

(declare-fun b!1036677 () Bool)

(declare-fun e!586310 () Bool)

(assert (=> b!1036677 (= e!586310 e!586312)))

(declare-fun c!104976 () Bool)

(assert (=> b!1036677 (= c!104976 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036678 () Bool)

(assert (=> b!1036678 (= e!586312 call!43871)))

(declare-fun d!124905 () Bool)

(declare-fun res!691864 () Bool)

(assert (=> d!124905 (=> res!691864 e!586310)))

(assert (=> d!124905 (= res!691864 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124905 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11454 thiss!1427) (mask!30165 thiss!1427)) e!586310)))

(declare-fun b!1036679 () Bool)

(assert (=> b!1036679 (= e!586311 call!43871)))

(assert (= (and d!124905 (not res!691864)) b!1036677))

(assert (= (and b!1036677 c!104976) b!1036676))

(assert (= (and b!1036677 (not c!104976)) b!1036678))

(assert (= (and b!1036676 res!691865) b!1036679))

(assert (= (or b!1036679 b!1036678) bm!43868))

(declare-fun m!956473 () Bool)

(assert (=> bm!43868 m!956473))

(assert (=> b!1036676 m!956015))

(declare-fun m!956475 () Bool)

(assert (=> b!1036676 m!956475))

(declare-fun m!956477 () Bool)

(assert (=> b!1036676 m!956477))

(assert (=> b!1036676 m!956015))

(declare-fun m!956479 () Bool)

(assert (=> b!1036676 m!956479))

(assert (=> b!1036677 m!956015))

(assert (=> b!1036677 m!956015))

(assert (=> b!1036677 m!956017))

(assert (=> bm!43822 d!124905))

(declare-fun d!124907 () Bool)

(declare-fun res!691866 () Bool)

(declare-fun e!586313 () Bool)

(assert (=> d!124907 (=> res!691866 e!586313)))

(assert (=> d!124907 (= res!691866 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (= (_1!7916 (h!23150 (toList!6932 lt!456682))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124907 (= (containsKey!564 (toList!6932 lt!456682) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)) e!586313)))

(declare-fun b!1036680 () Bool)

(declare-fun e!586314 () Bool)

(assert (=> b!1036680 (= e!586313 e!586314)))

(declare-fun res!691867 () Bool)

(assert (=> b!1036680 (=> (not res!691867) (not e!586314))))

(assert (=> b!1036680 (= res!691867 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456682))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456682))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21948) (toList!6932 lt!456682)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456682))) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1036681 () Bool)

(assert (=> b!1036681 (= e!586314 (containsKey!564 (t!31148 (toList!6932 lt!456682)) (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124907 (not res!691866)) b!1036680))

(assert (= (and b!1036680 res!691867) b!1036681))

(assert (=> b!1036681 m!955067))

(declare-fun m!956481 () Bool)

(assert (=> b!1036681 m!956481))

(assert (=> d!124551 d!124907))

(declare-fun d!124909 () Bool)

(declare-fun e!586315 () Bool)

(assert (=> d!124909 e!586315))

(declare-fun res!691869 () Bool)

(assert (=> d!124909 (=> (not res!691869) (not e!586315))))

(declare-fun lt!457108 () ListLongMap!13833)

(assert (=> d!124909 (= res!691869 (contains!6001 lt!457108 (_1!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))))

(declare-fun lt!457109 () List!21952)

(assert (=> d!124909 (= lt!457108 (ListLongMap!13834 lt!457109))))

(declare-fun lt!457107 () Unit!33774)

(declare-fun lt!457106 () Unit!33774)

(assert (=> d!124909 (= lt!457107 lt!457106)))

(assert (=> d!124909 (= (getValueByKey!591 lt!457109 (_1!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))) (Some!641 (_2!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))))

(assert (=> d!124909 (= lt!457106 (lemmaContainsTupThenGetReturnValue!281 lt!457109 (_1!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))) (_2!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))))

(assert (=> d!124909 (= lt!457109 (insertStrictlySorted!374 (toList!6932 (ite c!104778 call!43817 (ite c!104776 call!43818 call!43814))) (_1!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))) (_2!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))))))

(assert (=> d!124909 (= (+!3131 (ite c!104778 call!43817 (ite c!104776 call!43818 call!43814)) (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))) lt!457108)))

(declare-fun b!1036682 () Bool)

(declare-fun res!691868 () Bool)

(assert (=> b!1036682 (=> (not res!691868) (not e!586315))))

(assert (=> b!1036682 (= res!691868 (= (getValueByKey!591 (toList!6932 lt!457108) (_1!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581))))) (Some!641 (_2!7916 (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))))

(declare-fun b!1036683 () Bool)

(assert (=> b!1036683 (= e!586315 (contains!6002 (toList!6932 lt!457108) (ite (or c!104778 c!104776) (tuple2!15811 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!456581)) (tuple2!15811 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!456581)))))))

(assert (= (and d!124909 res!691869) b!1036682))

(assert (= (and b!1036682 res!691868) b!1036683))

(declare-fun m!956483 () Bool)

(assert (=> d!124909 m!956483))

(declare-fun m!956485 () Bool)

(assert (=> d!124909 m!956485))

(declare-fun m!956487 () Bool)

(assert (=> d!124909 m!956487))

(declare-fun m!956489 () Bool)

(assert (=> d!124909 m!956489))

(declare-fun m!956491 () Bool)

(assert (=> b!1036682 m!956491))

(declare-fun m!956493 () Bool)

(assert (=> b!1036683 m!956493))

(assert (=> bm!43811 d!124909))

(declare-fun d!124911 () Bool)

(declare-fun res!691870 () Bool)

(declare-fun e!586316 () Bool)

(assert (=> d!124911 (=> res!691870 e!586316)))

(assert (=> d!124911 (= res!691870 (or ((_ is Nil!21949) lt!456711) ((_ is Nil!21949) (t!31148 lt!456711))))))

(assert (=> d!124911 (= (isStrictlySorted!715 lt!456711) e!586316)))

(declare-fun b!1036684 () Bool)

(declare-fun e!586317 () Bool)

(assert (=> b!1036684 (= e!586316 e!586317)))

(declare-fun res!691871 () Bool)

(assert (=> b!1036684 (=> (not res!691871) (not e!586317))))

(assert (=> b!1036684 (= res!691871 (bvslt (_1!7916 (h!23150 lt!456711)) (_1!7916 (h!23150 (t!31148 lt!456711)))))))

(declare-fun b!1036685 () Bool)

(assert (=> b!1036685 (= e!586317 (isStrictlySorted!715 (t!31148 lt!456711)))))

(assert (= (and d!124911 (not res!691870)) b!1036684))

(assert (= (and b!1036684 res!691871) b!1036685))

(declare-fun m!956495 () Bool)

(assert (=> b!1036685 m!956495))

(assert (=> d!124433 d!124911))

(declare-fun d!124913 () Bool)

(declare-fun res!691872 () Bool)

(declare-fun e!586318 () Bool)

(assert (=> d!124913 (=> res!691872 e!586318)))

(assert (=> d!124913 (= res!691872 (or ((_ is Nil!21949) (toList!6932 (map!14715 thiss!1427))) ((_ is Nil!21949) (t!31148 (toList!6932 (map!14715 thiss!1427))))))))

(assert (=> d!124913 (= (isStrictlySorted!715 (toList!6932 (map!14715 thiss!1427))) e!586318)))

(declare-fun b!1036686 () Bool)

(declare-fun e!586319 () Bool)

(assert (=> b!1036686 (= e!586318 e!586319)))

(declare-fun res!691873 () Bool)

(assert (=> b!1036686 (=> (not res!691873) (not e!586319))))

(assert (=> b!1036686 (= res!691873 (bvslt (_1!7916 (h!23150 (toList!6932 (map!14715 thiss!1427)))) (_1!7916 (h!23150 (t!31148 (toList!6932 (map!14715 thiss!1427)))))))))

(declare-fun b!1036687 () Bool)

(assert (=> b!1036687 (= e!586319 (isStrictlySorted!715 (t!31148 (toList!6932 (map!14715 thiss!1427)))))))

(assert (= (and d!124913 (not res!691872)) b!1036686))

(assert (= (and b!1036686 res!691873) b!1036687))

(assert (=> b!1036687 m!956219))

(assert (=> d!124433 d!124913))

(declare-fun d!124915 () Bool)

(assert (=> d!124915 (= (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!456678)) (v!14930 (getValueByKey!591 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!456678)))))

(assert (=> d!124507 d!124915))

(declare-fun c!104977 () Bool)

(declare-fun d!124917 () Bool)

(assert (=> d!124917 (= c!104977 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))) lt!456678)))))

(declare-fun e!586320 () Option!642)

(assert (=> d!124917 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!456678) e!586320)))

(declare-fun b!1036691 () Bool)

(declare-fun e!586321 () Option!642)

(assert (=> b!1036691 (= e!586321 None!640)))

(declare-fun b!1036688 () Bool)

(assert (=> b!1036688 (= e!586320 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))))

(declare-fun b!1036689 () Bool)

(assert (=> b!1036689 (= e!586320 e!586321)))

(declare-fun c!104978 () Bool)

(assert (=> b!1036689 (= c!104978 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))) lt!456678))))))

(declare-fun b!1036690 () Bool)

(assert (=> b!1036690 (= e!586321 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456686 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))) lt!456678))))

(assert (= (and d!124917 c!104977) b!1036688))

(assert (= (and d!124917 (not c!104977)) b!1036689))

(assert (= (and b!1036689 c!104978) b!1036690))

(assert (= (and b!1036689 (not c!104978)) b!1036691))

(declare-fun m!956497 () Bool)

(assert (=> b!1036690 m!956497))

(assert (=> d!124507 d!124917))

(assert (=> b!1035912 d!124729))

(assert (=> b!1035912 d!124731))

(declare-fun d!124919 () Bool)

(declare-fun lt!457110 () Bool)

(assert (=> d!124919 (= lt!457110 (select (content!514 (toList!6932 lt!456813)) (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))

(declare-fun e!586322 () Bool)

(assert (=> d!124919 (= lt!457110 e!586322)))

(declare-fun res!691874 () Bool)

(assert (=> d!124919 (=> (not res!691874) (not e!586322))))

(assert (=> d!124919 (= res!691874 ((_ is Cons!21948) (toList!6932 lt!456813)))))

(assert (=> d!124919 (= (contains!6002 (toList!6932 lt!456813) (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) lt!457110)))

(declare-fun b!1036692 () Bool)

(declare-fun e!586323 () Bool)

(assert (=> b!1036692 (= e!586322 e!586323)))

(declare-fun res!691875 () Bool)

(assert (=> b!1036692 (=> res!691875 e!586323)))

(assert (=> b!1036692 (= res!691875 (= (h!23150 (toList!6932 lt!456813)) (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1036693 () Bool)

(assert (=> b!1036693 (= e!586323 (contains!6002 (t!31148 (toList!6932 lt!456813)) (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!124919 res!691874) b!1036692))

(assert (= (and b!1036692 (not res!691875)) b!1036693))

(declare-fun m!956499 () Bool)

(assert (=> d!124919 m!956499))

(declare-fun m!956501 () Bool)

(assert (=> d!124919 m!956501))

(declare-fun m!956503 () Bool)

(assert (=> b!1036693 m!956503))

(assert (=> b!1036029 d!124919))

(assert (=> b!1035973 d!124477))

(declare-fun d!124921 () Bool)

(declare-fun lt!457111 () Bool)

(assert (=> d!124921 (= lt!457111 (select (content!514 (toList!6932 lt!456740)) (tuple2!15811 lt!456652 lt!456582)))))

(declare-fun e!586324 () Bool)

(assert (=> d!124921 (= lt!457111 e!586324)))

(declare-fun res!691876 () Bool)

(assert (=> d!124921 (=> (not res!691876) (not e!586324))))

(assert (=> d!124921 (= res!691876 ((_ is Cons!21948) (toList!6932 lt!456740)))))

(assert (=> d!124921 (= (contains!6002 (toList!6932 lt!456740) (tuple2!15811 lt!456652 lt!456582)) lt!457111)))

(declare-fun b!1036694 () Bool)

(declare-fun e!586325 () Bool)

(assert (=> b!1036694 (= e!586324 e!586325)))

(declare-fun res!691877 () Bool)

(assert (=> b!1036694 (=> res!691877 e!586325)))

(assert (=> b!1036694 (= res!691877 (= (h!23150 (toList!6932 lt!456740)) (tuple2!15811 lt!456652 lt!456582)))))

(declare-fun b!1036695 () Bool)

(assert (=> b!1036695 (= e!586325 (contains!6002 (t!31148 (toList!6932 lt!456740)) (tuple2!15811 lt!456652 lt!456582)))))

(assert (= (and d!124921 res!691876) b!1036694))

(assert (= (and b!1036694 (not res!691877)) b!1036695))

(declare-fun m!956505 () Bool)

(assert (=> d!124921 m!956505))

(declare-fun m!956507 () Bool)

(assert (=> d!124921 m!956507))

(declare-fun m!956509 () Bool)

(assert (=> b!1036695 m!956509))

(assert (=> b!1035940 d!124921))

(declare-fun d!124923 () Bool)

(declare-fun res!691878 () Bool)

(declare-fun e!586326 () Bool)

(assert (=> d!124923 (=> res!691878 e!586326)))

(assert (=> d!124923 (= res!691878 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))) lt!456654)))))

(assert (=> d!124923 (= (containsKey!564 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654) e!586326)))

(declare-fun b!1036696 () Bool)

(declare-fun e!586327 () Bool)

(assert (=> b!1036696 (= e!586326 e!586327)))

(declare-fun res!691879 () Bool)

(assert (=> b!1036696 (=> (not res!691879) (not e!586327))))

(assert (=> b!1036696 (= res!691879 (and (or (not ((_ is Cons!21948) (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))) (bvsle (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))) lt!456654)) ((_ is Cons!21948) (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))) (bvslt (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))) lt!456654)))))

(declare-fun b!1036697 () Bool)

(assert (=> b!1036697 (= e!586327 (containsKey!564 (t!31148 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))) lt!456654))))

(assert (= (and d!124923 (not res!691878)) b!1036696))

(assert (= (and b!1036696 res!691879) b!1036697))

(declare-fun m!956511 () Bool)

(assert (=> b!1036697 m!956511))

(assert (=> d!124471 d!124923))

(declare-fun d!124925 () Bool)

(assert (=> d!124925 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456668) lt!456658)) (v!14930 (getValueByKey!591 (toList!6932 lt!456668) lt!456658)))))

(assert (=> d!124453 d!124925))

(declare-fun d!124927 () Bool)

(declare-fun c!104979 () Bool)

(assert (=> d!124927 (= c!104979 (and ((_ is Cons!21948) (toList!6932 lt!456668)) (= (_1!7916 (h!23150 (toList!6932 lt!456668))) lt!456658)))))

(declare-fun e!586328 () Option!642)

(assert (=> d!124927 (= (getValueByKey!591 (toList!6932 lt!456668) lt!456658) e!586328)))

(declare-fun b!1036701 () Bool)

(declare-fun e!586329 () Option!642)

(assert (=> b!1036701 (= e!586329 None!640)))

(declare-fun b!1036698 () Bool)

(assert (=> b!1036698 (= e!586328 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456668)))))))

(declare-fun b!1036699 () Bool)

(assert (=> b!1036699 (= e!586328 e!586329)))

(declare-fun c!104980 () Bool)

(assert (=> b!1036699 (= c!104980 (and ((_ is Cons!21948) (toList!6932 lt!456668)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456668))) lt!456658))))))

(declare-fun b!1036700 () Bool)

(assert (=> b!1036700 (= e!586329 (getValueByKey!591 (t!31148 (toList!6932 lt!456668)) lt!456658))))

(assert (= (and d!124927 c!104979) b!1036698))

(assert (= (and d!124927 (not c!104979)) b!1036699))

(assert (= (and b!1036699 c!104980) b!1036700))

(assert (= (and b!1036699 (not c!104980)) b!1036701))

(declare-fun m!956513 () Bool)

(assert (=> b!1036700 m!956513))

(assert (=> d!124453 d!124927))

(declare-fun d!124929 () Bool)

(assert (=> d!124929 (= (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582))) lt!456665)) (v!14930 (getValueByKey!591 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582))) lt!456665)))))

(assert (=> d!124473 d!124929))

(declare-fun c!104981 () Bool)

(declare-fun d!124931 () Bool)

(assert (=> d!124931 (= c!104981 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)))) (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582))))) lt!456665)))))

(declare-fun e!586330 () Option!642)

(assert (=> d!124931 (= (getValueByKey!591 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582))) lt!456665) e!586330)))

(declare-fun b!1036705 () Bool)

(declare-fun e!586331 () Option!642)

(assert (=> b!1036705 (= e!586331 None!640)))

(declare-fun b!1036702 () Bool)

(assert (=> b!1036702 (= e!586330 (Some!641 (_2!7916 (h!23150 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)))))))))

(declare-fun b!1036703 () Bool)

(assert (=> b!1036703 (= e!586330 e!586331)))

(declare-fun c!104982 () Bool)

(assert (=> b!1036703 (= c!104982 (and ((_ is Cons!21948) (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)))) (not (= (_1!7916 (h!23150 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582))))) lt!456665))))))

(declare-fun b!1036704 () Bool)

(assert (=> b!1036704 (= e!586331 (getValueByKey!591 (t!31148 (toList!6932 (+!3131 lt!456659 (tuple2!15811 lt!456649 lt!456582)))) lt!456665))))

(assert (= (and d!124931 c!104981) b!1036702))

(assert (= (and d!124931 (not c!104981)) b!1036703))

(assert (= (and b!1036703 c!104982) b!1036704))

(assert (= (and b!1036703 (not c!104982)) b!1036705))

(declare-fun m!956515 () Bool)

(assert (=> b!1036704 m!956515))

(assert (=> d!124473 d!124931))

(declare-fun d!124933 () Bool)

(declare-fun c!104983 () Bool)

(assert (=> d!124933 (= c!104983 (and ((_ is Cons!21948) (toList!6932 lt!456803)) (= (_1!7916 (h!23150 (toList!6932 lt!456803))) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586332 () Option!642)

(assert (=> d!124933 (= (getValueByKey!591 (toList!6932 lt!456803) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) e!586332)))

(declare-fun b!1036709 () Bool)

(declare-fun e!586333 () Option!642)

(assert (=> b!1036709 (= e!586333 None!640)))

(declare-fun b!1036706 () Bool)

(assert (=> b!1036706 (= e!586332 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456803)))))))

(declare-fun b!1036707 () Bool)

(assert (=> b!1036707 (= e!586332 e!586333)))

(declare-fun c!104984 () Bool)

(assert (=> b!1036707 (= c!104984 (and ((_ is Cons!21948) (toList!6932 lt!456803)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456803))) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036708 () Bool)

(assert (=> b!1036708 (= e!586333 (getValueByKey!591 (t!31148 (toList!6932 lt!456803)) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124933 c!104983) b!1036706))

(assert (= (and d!124933 (not c!104983)) b!1036707))

(assert (= (and b!1036707 c!104984) b!1036708))

(assert (= (and b!1036707 (not c!104984)) b!1036709))

(declare-fun m!956517 () Bool)

(assert (=> b!1036708 m!956517))

(assert (=> b!1036022 d!124933))

(declare-fun d!124935 () Bool)

(assert (=> d!124935 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))

(declare-fun lt!457112 () Unit!33774)

(assert (=> d!124935 (= lt!457112 (choose!1712 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))

(declare-fun e!586334 () Bool)

(assert (=> d!124935 e!586334))

(declare-fun res!691880 () Bool)

(assert (=> d!124935 (=> (not res!691880) (not e!586334))))

(assert (=> d!124935 (= res!691880 (isStrictlySorted!715 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!124935 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654) lt!457112)))

(declare-fun b!1036710 () Bool)

(assert (=> b!1036710 (= e!586334 (containsKey!564 (toList!6932 (+!3131 lt!456670 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!456654))))

(assert (= (and d!124935 res!691880) b!1036710))

(assert (=> d!124935 m!955353))

(assert (=> d!124935 m!955353))

(assert (=> d!124935 m!955355))

(declare-fun m!956519 () Bool)

(assert (=> d!124935 m!956519))

(declare-fun m!956521 () Bool)

(assert (=> d!124935 m!956521))

(assert (=> b!1036710 m!955349))

(assert (=> b!1035984 d!124935))

(assert (=> b!1035984 d!124781))

(assert (=> b!1035984 d!124783))

(declare-fun d!124937 () Bool)

(declare-fun e!586335 () Bool)

(assert (=> d!124937 e!586335))

(declare-fun res!691881 () Bool)

(assert (=> d!124937 (=> res!691881 e!586335)))

(declare-fun lt!457114 () Bool)

(assert (=> d!124937 (= res!691881 (not lt!457114))))

(declare-fun lt!457113 () Bool)

(assert (=> d!124937 (= lt!457114 lt!457113)))

(declare-fun lt!457116 () Unit!33774)

(declare-fun e!586336 () Unit!33774)

(assert (=> d!124937 (= lt!457116 e!586336)))

(declare-fun c!104985 () Bool)

(assert (=> d!124937 (= c!104985 lt!457113)))

(assert (=> d!124937 (= lt!457113 (containsKey!564 (toList!6932 lt!456748) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!124937 (= (contains!6001 lt!456748 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!457114)))

(declare-fun b!1036711 () Bool)

(declare-fun lt!457115 () Unit!33774)

(assert (=> b!1036711 (= e!586336 lt!457115)))

(assert (=> b!1036711 (= lt!457115 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456748) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1036711 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456748) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036712 () Bool)

(declare-fun Unit!33815 () Unit!33774)

(assert (=> b!1036712 (= e!586336 Unit!33815)))

(declare-fun b!1036713 () Bool)

(assert (=> b!1036713 (= e!586335 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456748) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!124937 c!104985) b!1036711))

(assert (= (and d!124937 (not c!104985)) b!1036712))

(assert (= (and d!124937 (not res!691881)) b!1036713))

(declare-fun m!956523 () Bool)

(assert (=> d!124937 m!956523))

(declare-fun m!956525 () Bool)

(assert (=> b!1036711 m!956525))

(assert (=> b!1036711 m!955297))

(assert (=> b!1036711 m!955297))

(declare-fun m!956527 () Bool)

(assert (=> b!1036711 m!956527))

(assert (=> b!1036713 m!955297))

(assert (=> b!1036713 m!955297))

(assert (=> b!1036713 m!956527))

(assert (=> d!124457 d!124937))

(declare-fun d!124939 () Bool)

(declare-fun c!104986 () Bool)

(assert (=> d!124939 (= c!104986 (and ((_ is Cons!21948) lt!456749) (= (_1!7916 (h!23150 lt!456749)) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586337 () Option!642)

(assert (=> d!124939 (= (getValueByKey!591 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) e!586337)))

(declare-fun b!1036717 () Bool)

(declare-fun e!586338 () Option!642)

(assert (=> b!1036717 (= e!586338 None!640)))

(declare-fun b!1036714 () Bool)

(assert (=> b!1036714 (= e!586337 (Some!641 (_2!7916 (h!23150 lt!456749))))))

(declare-fun b!1036715 () Bool)

(assert (=> b!1036715 (= e!586337 e!586338)))

(declare-fun c!104987 () Bool)

(assert (=> b!1036715 (= c!104987 (and ((_ is Cons!21948) lt!456749) (not (= (_1!7916 (h!23150 lt!456749)) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036716 () Bool)

(assert (=> b!1036716 (= e!586338 (getValueByKey!591 (t!31148 lt!456749) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!124939 c!104986) b!1036714))

(assert (= (and d!124939 (not c!104986)) b!1036715))

(assert (= (and b!1036715 c!104987) b!1036716))

(assert (= (and b!1036715 (not c!104987)) b!1036717))

(declare-fun m!956529 () Bool)

(assert (=> b!1036716 m!956529))

(assert (=> d!124457 d!124939))

(declare-fun d!124941 () Bool)

(assert (=> d!124941 (= (getValueByKey!591 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457117 () Unit!33774)

(assert (=> d!124941 (= lt!457117 (choose!1714 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!586339 () Bool)

(assert (=> d!124941 e!586339))

(declare-fun res!691882 () Bool)

(assert (=> d!124941 (=> (not res!691882) (not e!586339))))

(assert (=> d!124941 (= res!691882 (isStrictlySorted!715 lt!456749))))

(assert (=> d!124941 (= (lemmaContainsTupThenGetReturnValue!281 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!457117)))

(declare-fun b!1036718 () Bool)

(declare-fun res!691883 () Bool)

(assert (=> b!1036718 (=> (not res!691883) (not e!586339))))

(assert (=> b!1036718 (= res!691883 (containsKey!564 lt!456749 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036719 () Bool)

(assert (=> b!1036719 (= e!586339 (contains!6002 lt!456749 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!124941 res!691882) b!1036718))

(assert (= (and b!1036718 res!691883) b!1036719))

(assert (=> d!124941 m!955291))

(declare-fun m!956531 () Bool)

(assert (=> d!124941 m!956531))

(declare-fun m!956533 () Bool)

(assert (=> d!124941 m!956533))

(declare-fun m!956535 () Bool)

(assert (=> b!1036718 m!956535))

(declare-fun m!956537 () Bool)

(assert (=> b!1036719 m!956537))

(assert (=> d!124457 d!124941))

(declare-fun b!1036720 () Bool)

(declare-fun e!586342 () List!21952)

(declare-fun call!43872 () List!21952)

(assert (=> b!1036720 (= e!586342 call!43872)))

(declare-fun b!1036721 () Bool)

(declare-fun e!586341 () List!21952)

(declare-fun call!43873 () List!21952)

(assert (=> b!1036721 (= e!586341 call!43873)))

(declare-fun b!1036722 () Bool)

(declare-fun res!691884 () Bool)

(declare-fun e!586343 () Bool)

(assert (=> b!1036722 (=> (not res!691884) (not e!586343))))

(declare-fun lt!457118 () List!21952)

(assert (=> b!1036722 (= res!691884 (containsKey!564 lt!457118 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036723 () Bool)

(assert (=> b!1036723 (= e!586342 e!586341)))

(declare-fun c!104989 () Bool)

(assert (=> b!1036723 (= c!104989 (and ((_ is Cons!21948) (toList!6932 lt!456670)) (= (_1!7916 (h!23150 (toList!6932 lt!456670))) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43869 () Bool)

(assert (=> bm!43869 (= call!43873 call!43872)))

(declare-fun b!1036724 () Bool)

(declare-fun e!586340 () List!21952)

(declare-fun call!43874 () List!21952)

(assert (=> b!1036724 (= e!586340 call!43874)))

(declare-fun e!586344 () List!21952)

(declare-fun c!104991 () Bool)

(declare-fun b!1036725 () Bool)

(assert (=> b!1036725 (= e!586344 (ite c!104989 (t!31148 (toList!6932 lt!456670)) (ite c!104991 (Cons!21948 (h!23150 (toList!6932 lt!456670)) (t!31148 (toList!6932 lt!456670))) Nil!21949)))))

(declare-fun b!1036726 () Bool)

(assert (=> b!1036726 (= e!586340 call!43874)))

(declare-fun bm!43870 () Bool)

(declare-fun c!104988 () Bool)

(assert (=> bm!43870 (= call!43872 ($colon$colon!605 e!586344 (ite c!104988 (h!23150 (toList!6932 lt!456670)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!104990 () Bool)

(assert (=> bm!43870 (= c!104990 c!104988)))

(declare-fun bm!43871 () Bool)

(assert (=> bm!43871 (= call!43874 call!43873)))

(declare-fun b!1036727 () Bool)

(assert (=> b!1036727 (= e!586344 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456670)) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036728 () Bool)

(assert (=> b!1036728 (= e!586343 (contains!6002 lt!457118 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(declare-fun d!124943 () Bool)

(assert (=> d!124943 e!586343))

(declare-fun res!691885 () Bool)

(assert (=> d!124943 (=> (not res!691885) (not e!586343))))

(assert (=> d!124943 (= res!691885 (isStrictlySorted!715 lt!457118))))

(assert (=> d!124943 (= lt!457118 e!586342)))

(assert (=> d!124943 (= c!104988 (and ((_ is Cons!21948) (toList!6932 lt!456670)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456670))) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!124943 (isStrictlySorted!715 (toList!6932 lt!456670))))

(assert (=> d!124943 (= (insertStrictlySorted!374 (toList!6932 lt!456670) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427)))) lt!457118)))

(declare-fun b!1036729 () Bool)

(assert (=> b!1036729 (= c!104991 (and ((_ is Cons!21948) (toList!6932 lt!456670)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456670))) (_1!7916 (tuple2!15811 lt!456653 (zeroValue!6103 thiss!1427))))))))

(assert (=> b!1036729 (= e!586341 e!586340)))

(assert (= (and d!124943 c!104988) b!1036720))

(assert (= (and d!124943 (not c!104988)) b!1036723))

(assert (= (and b!1036723 c!104989) b!1036721))

(assert (= (and b!1036723 (not c!104989)) b!1036729))

(assert (= (and b!1036729 c!104991) b!1036724))

(assert (= (and b!1036729 (not c!104991)) b!1036726))

(assert (= (or b!1036724 b!1036726) bm!43871))

(assert (= (or b!1036721 bm!43871) bm!43869))

(assert (= (or b!1036720 bm!43869) bm!43870))

(assert (= (and bm!43870 c!104990) b!1036727))

(assert (= (and bm!43870 (not c!104990)) b!1036725))

(assert (= (and d!124943 res!691885) b!1036722))

(assert (= (and b!1036722 res!691884) b!1036728))

(declare-fun m!956539 () Bool)

(assert (=> b!1036728 m!956539))

(declare-fun m!956541 () Bool)

(assert (=> b!1036722 m!956541))

(declare-fun m!956543 () Bool)

(assert (=> b!1036727 m!956543))

(declare-fun m!956545 () Bool)

(assert (=> bm!43870 m!956545))

(declare-fun m!956547 () Bool)

(assert (=> d!124943 m!956547))

(declare-fun m!956549 () Bool)

(assert (=> d!124943 m!956549))

(assert (=> d!124457 d!124943))

(declare-fun b!1036730 () Bool)

(declare-fun e!586348 () Bool)

(declare-fun e!586345 () Bool)

(assert (=> b!1036730 (= e!586348 e!586345)))

(declare-fun res!691886 () Bool)

(assert (=> b!1036730 (=> (not res!691886) (not e!586345))))

(declare-fun e!586346 () Bool)

(assert (=> b!1036730 (= res!691886 (not e!586346))))

(declare-fun res!691887 () Bool)

(assert (=> b!1036730 (=> (not res!691887) (not e!586346))))

(assert (=> b!1036730 (= res!691887 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124945 () Bool)

(declare-fun res!691888 () Bool)

(assert (=> d!124945 (=> res!691888 e!586348)))

(assert (=> d!124945 (= res!691888 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 lt!456581))))))

(assert (=> d!124945 (= (arrayNoDuplicates!0 (_keys!11454 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104787 (Cons!21949 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)) e!586348)))

(declare-fun b!1036731 () Bool)

(assert (=> b!1036731 (= e!586346 (contains!6003 (ite c!104787 (Cons!21949 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) Nil!21950) Nil!21950) (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036732 () Bool)

(declare-fun e!586347 () Bool)

(declare-fun call!43875 () Bool)

(assert (=> b!1036732 (= e!586347 call!43875)))

(declare-fun bm!43872 () Bool)

(declare-fun c!104992 () Bool)

(assert (=> bm!43872 (= call!43875 (arrayNoDuplicates!0 (_keys!11454 lt!456581) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104992 (Cons!21949 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104787 (Cons!21949 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)) (ite c!104787 (Cons!21949 (select (arr!31398 (_keys!11454 lt!456581)) #b00000000000000000000000000000000) Nil!21950) Nil!21950))))))

(declare-fun b!1036733 () Bool)

(assert (=> b!1036733 (= e!586345 e!586347)))

(assert (=> b!1036733 (= c!104992 (validKeyInArray!0 (select (arr!31398 (_keys!11454 lt!456581)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036734 () Bool)

(assert (=> b!1036734 (= e!586347 call!43875)))

(assert (= (and d!124945 (not res!691888)) b!1036730))

(assert (= (and b!1036730 res!691887) b!1036731))

(assert (= (and b!1036730 res!691886) b!1036733))

(assert (= (and b!1036733 c!104992) b!1036732))

(assert (= (and b!1036733 (not c!104992)) b!1036734))

(assert (= (or b!1036732 b!1036734) bm!43872))

(assert (=> b!1036730 m!955879))

(assert (=> b!1036730 m!955879))

(assert (=> b!1036730 m!955881))

(assert (=> b!1036731 m!955879))

(assert (=> b!1036731 m!955879))

(declare-fun m!956551 () Bool)

(assert (=> b!1036731 m!956551))

(assert (=> bm!43872 m!955879))

(declare-fun m!956553 () Bool)

(assert (=> bm!43872 m!956553))

(assert (=> b!1036733 m!955879))

(assert (=> b!1036733 m!955879))

(assert (=> b!1036733 m!955881))

(assert (=> bm!43823 d!124945))

(declare-fun d!124947 () Bool)

(declare-fun e!586349 () Bool)

(assert (=> d!124947 e!586349))

(declare-fun res!691889 () Bool)

(assert (=> d!124947 (=> res!691889 e!586349)))

(declare-fun lt!457120 () Bool)

(assert (=> d!124947 (= res!691889 (not lt!457120))))

(declare-fun lt!457119 () Bool)

(assert (=> d!124947 (= lt!457120 lt!457119)))

(declare-fun lt!457122 () Unit!33774)

(declare-fun e!586350 () Unit!33774)

(assert (=> d!124947 (= lt!457122 e!586350)))

(declare-fun c!104993 () Bool)

(assert (=> d!124947 (= c!104993 lt!457119)))

(assert (=> d!124947 (= lt!457119 (containsKey!564 (toList!6932 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))) lt!456837))))

(assert (=> d!124947 (= (contains!6001 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))) lt!456837) lt!457120)))

(declare-fun b!1036735 () Bool)

(declare-fun lt!457121 () Unit!33774)

(assert (=> b!1036735 (= e!586350 lt!457121)))

(assert (=> b!1036735 (= lt!457121 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))) lt!456837))))

(assert (=> b!1036735 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))) lt!456837))))

(declare-fun b!1036736 () Bool)

(declare-fun Unit!33816 () Unit!33774)

(assert (=> b!1036736 (= e!586350 Unit!33816)))

(declare-fun b!1036737 () Bool)

(assert (=> b!1036737 (= e!586349 (isDefined!439 (getValueByKey!591 (toList!6932 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))) lt!456837)))))

(assert (= (and d!124947 c!104993) b!1036735))

(assert (= (and d!124947 (not c!104993)) b!1036736))

(assert (= (and d!124947 (not res!691889)) b!1036737))

(declare-fun m!956555 () Bool)

(assert (=> d!124947 m!956555))

(declare-fun m!956557 () Bool)

(assert (=> b!1036735 m!956557))

(declare-fun m!956559 () Bool)

(assert (=> b!1036735 m!956559))

(assert (=> b!1036735 m!956559))

(declare-fun m!956561 () Bool)

(assert (=> b!1036735 m!956561))

(assert (=> b!1036737 m!956559))

(assert (=> b!1036737 m!956559))

(assert (=> b!1036737 m!956561))

(assert (=> b!1036064 d!124947))

(declare-fun d!124949 () Bool)

(assert (=> d!124949 (= (apply!900 (+!3131 lt!456847 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))) lt!456839) (apply!900 lt!456847 lt!456839))))

(declare-fun lt!457123 () Unit!33774)

(assert (=> d!124949 (= lt!457123 (choose!1711 lt!456847 lt!456844 (zeroValue!6103 lt!456581) lt!456839))))

(declare-fun e!586351 () Bool)

(assert (=> d!124949 e!586351))

(declare-fun res!691890 () Bool)

(assert (=> d!124949 (=> (not res!691890) (not e!586351))))

(assert (=> d!124949 (= res!691890 (contains!6001 lt!456847 lt!456839))))

(assert (=> d!124949 (= (addApplyDifferent!475 lt!456847 lt!456844 (zeroValue!6103 lt!456581) lt!456839) lt!457123)))

(declare-fun b!1036738 () Bool)

(assert (=> b!1036738 (= e!586351 (not (= lt!456839 lt!456844)))))

(assert (= (and d!124949 res!691890) b!1036738))

(declare-fun m!956563 () Bool)

(assert (=> d!124949 m!956563))

(declare-fun m!956565 () Bool)

(assert (=> d!124949 m!956565))

(assert (=> d!124949 m!955571))

(assert (=> d!124949 m!955589))

(assert (=> d!124949 m!955571))

(assert (=> d!124949 m!955595))

(assert (=> b!1036064 d!124949))

(declare-fun d!124951 () Bool)

(assert (=> d!124951 (= (apply!900 (+!3131 lt!456851 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))) lt!456841) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456851 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))) lt!456841)))))

(declare-fun bs!30331 () Bool)

(assert (= bs!30331 d!124951))

(declare-fun m!956567 () Bool)

(assert (=> bs!30331 m!956567))

(assert (=> bs!30331 m!956567))

(declare-fun m!956569 () Bool)

(assert (=> bs!30331 m!956569))

(assert (=> b!1036064 d!124951))

(declare-fun d!124953 () Bool)

(declare-fun e!586352 () Bool)

(assert (=> d!124953 e!586352))

(declare-fun res!691892 () Bool)

(assert (=> d!124953 (=> (not res!691892) (not e!586352))))

(declare-fun lt!457126 () ListLongMap!13833)

(assert (=> d!124953 (= res!691892 (contains!6001 lt!457126 (_1!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))))))

(declare-fun lt!457127 () List!21952)

(assert (=> d!124953 (= lt!457126 (ListLongMap!13834 lt!457127))))

(declare-fun lt!457125 () Unit!33774)

(declare-fun lt!457124 () Unit!33774)

(assert (=> d!124953 (= lt!457125 lt!457124)))

(assert (=> d!124953 (= (getValueByKey!591 lt!457127 (_1!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))))))

(assert (=> d!124953 (= lt!457124 (lemmaContainsTupThenGetReturnValue!281 lt!457127 (_1!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))) (_2!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))))))

(assert (=> d!124953 (= lt!457127 (insertStrictlySorted!374 (toList!6932 lt!456853) (_1!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))) (_2!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))))))

(assert (=> d!124953 (= (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))) lt!457126)))

(declare-fun b!1036739 () Bool)

(declare-fun res!691891 () Bool)

(assert (=> b!1036739 (=> (not res!691891) (not e!586352))))

(assert (=> b!1036739 (= res!691891 (= (getValueByKey!591 (toList!6932 lt!457126) (_1!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))))))))

(declare-fun b!1036740 () Bool)

(assert (=> b!1036740 (= e!586352 (contains!6002 (toList!6932 lt!457126) (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))))))

(assert (= (and d!124953 res!691892) b!1036739))

(assert (= (and b!1036739 res!691891) b!1036740))

(declare-fun m!956571 () Bool)

(assert (=> d!124953 m!956571))

(declare-fun m!956573 () Bool)

(assert (=> d!124953 m!956573))

(declare-fun m!956575 () Bool)

(assert (=> d!124953 m!956575))

(declare-fun m!956577 () Bool)

(assert (=> d!124953 m!956577))

(declare-fun m!956579 () Bool)

(assert (=> b!1036739 m!956579))

(declare-fun m!956581 () Bool)

(assert (=> b!1036740 m!956581))

(assert (=> b!1036064 d!124953))

(declare-fun d!124955 () Bool)

(assert (=> d!124955 (= (apply!900 lt!456847 lt!456839) (get!16459 (getValueByKey!591 (toList!6932 lt!456847) lt!456839)))))

(declare-fun bs!30332 () Bool)

(assert (= bs!30332 d!124955))

(declare-fun m!956583 () Bool)

(assert (=> bs!30332 m!956583))

(assert (=> bs!30332 m!956583))

(declare-fun m!956585 () Bool)

(assert (=> bs!30332 m!956585))

(assert (=> b!1036064 d!124955))

(declare-fun d!124957 () Bool)

(assert (=> d!124957 (contains!6001 (+!3131 lt!456853 (tuple2!15811 lt!456836 (zeroValue!6103 lt!456581))) lt!456837)))

(declare-fun lt!457128 () Unit!33774)

(assert (=> d!124957 (= lt!457128 (choose!1710 lt!456853 lt!456836 (zeroValue!6103 lt!456581) lt!456837))))

(assert (=> d!124957 (contains!6001 lt!456853 lt!456837)))

(assert (=> d!124957 (= (addStillContains!619 lt!456853 lt!456836 (zeroValue!6103 lt!456581) lt!456837) lt!457128)))

(declare-fun bs!30333 () Bool)

(assert (= bs!30333 d!124957))

(assert (=> bs!30333 m!955581))

(assert (=> bs!30333 m!955581))

(assert (=> bs!30333 m!955583))

(declare-fun m!956587 () Bool)

(assert (=> bs!30333 m!956587))

(declare-fun m!956589 () Bool)

(assert (=> bs!30333 m!956589))

(assert (=> b!1036064 d!124957))

(declare-fun d!124959 () Bool)

(assert (=> d!124959 (= (apply!900 (+!3131 lt!456847 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))) lt!456839) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456847 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))) lt!456839)))))

(declare-fun bs!30334 () Bool)

(assert (= bs!30334 d!124959))

(declare-fun m!956591 () Bool)

(assert (=> bs!30334 m!956591))

(assert (=> bs!30334 m!956591))

(declare-fun m!956593 () Bool)

(assert (=> bs!30334 m!956593))

(assert (=> b!1036064 d!124959))

(declare-fun d!124961 () Bool)

(assert (=> d!124961 (= (apply!900 lt!456851 lt!456841) (get!16459 (getValueByKey!591 (toList!6932 lt!456851) lt!456841)))))

(declare-fun bs!30335 () Bool)

(assert (= bs!30335 d!124961))

(declare-fun m!956595 () Bool)

(assert (=> bs!30335 m!956595))

(assert (=> bs!30335 m!956595))

(declare-fun m!956597 () Bool)

(assert (=> bs!30335 m!956597))

(assert (=> b!1036064 d!124961))

(declare-fun d!124963 () Bool)

(assert (=> d!124963 (= (apply!900 (+!3131 lt!456842 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))) lt!456848) (apply!900 lt!456842 lt!456848))))

(declare-fun lt!457129 () Unit!33774)

(assert (=> d!124963 (= lt!457129 (choose!1711 lt!456842 lt!456832 (minValue!6105 lt!456581) lt!456848))))

(declare-fun e!586353 () Bool)

(assert (=> d!124963 e!586353))

(declare-fun res!691893 () Bool)

(assert (=> d!124963 (=> (not res!691893) (not e!586353))))

(assert (=> d!124963 (= res!691893 (contains!6001 lt!456842 lt!456848))))

(assert (=> d!124963 (= (addApplyDifferent!475 lt!456842 lt!456832 (minValue!6105 lt!456581) lt!456848) lt!457129)))

(declare-fun b!1036741 () Bool)

(assert (=> b!1036741 (= e!586353 (not (= lt!456848 lt!456832)))))

(assert (= (and d!124963 res!691893) b!1036741))

(declare-fun m!956599 () Bool)

(assert (=> d!124963 m!956599))

(declare-fun m!956601 () Bool)

(assert (=> d!124963 m!956601))

(assert (=> d!124963 m!955575))

(assert (=> d!124963 m!955579))

(assert (=> d!124963 m!955575))

(assert (=> d!124963 m!955585))

(assert (=> b!1036064 d!124963))

(declare-fun d!124965 () Bool)

(declare-fun e!586354 () Bool)

(assert (=> d!124965 e!586354))

(declare-fun res!691895 () Bool)

(assert (=> d!124965 (=> (not res!691895) (not e!586354))))

(declare-fun lt!457132 () ListLongMap!13833)

(assert (=> d!124965 (= res!691895 (contains!6001 lt!457132 (_1!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))))))

(declare-fun lt!457133 () List!21952)

(assert (=> d!124965 (= lt!457132 (ListLongMap!13834 lt!457133))))

(declare-fun lt!457131 () Unit!33774)

(declare-fun lt!457130 () Unit!33774)

(assert (=> d!124965 (= lt!457131 lt!457130)))

(assert (=> d!124965 (= (getValueByKey!591 lt!457133 (_1!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))))))

(assert (=> d!124965 (= lt!457130 (lemmaContainsTupThenGetReturnValue!281 lt!457133 (_1!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))) (_2!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))))))

(assert (=> d!124965 (= lt!457133 (insertStrictlySorted!374 (toList!6932 lt!456842) (_1!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))) (_2!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))))))

(assert (=> d!124965 (= (+!3131 lt!456842 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))) lt!457132)))

(declare-fun b!1036742 () Bool)

(declare-fun res!691894 () Bool)

(assert (=> b!1036742 (=> (not res!691894) (not e!586354))))

(assert (=> b!1036742 (= res!691894 (= (getValueByKey!591 (toList!6932 lt!457132) (_1!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))))))))

(declare-fun b!1036743 () Bool)

(assert (=> b!1036743 (= e!586354 (contains!6002 (toList!6932 lt!457132) (tuple2!15811 lt!456832 (minValue!6105 lt!456581))))))

(assert (= (and d!124965 res!691895) b!1036742))

(assert (= (and b!1036742 res!691894) b!1036743))

(declare-fun m!956603 () Bool)

(assert (=> d!124965 m!956603))

(declare-fun m!956605 () Bool)

(assert (=> d!124965 m!956605))

(declare-fun m!956607 () Bool)

(assert (=> d!124965 m!956607))

(declare-fun m!956609 () Bool)

(assert (=> d!124965 m!956609))

(declare-fun m!956611 () Bool)

(assert (=> b!1036742 m!956611))

(declare-fun m!956613 () Bool)

(assert (=> b!1036743 m!956613))

(assert (=> b!1036064 d!124965))

(declare-fun d!124967 () Bool)

(assert (=> d!124967 (= (apply!900 (+!3131 lt!456842 (tuple2!15811 lt!456832 (minValue!6105 lt!456581))) lt!456848) (get!16459 (getValueByKey!591 (toList!6932 (+!3131 lt!456842 (tuple2!15811 lt!456832 (minValue!6105 lt!456581)))) lt!456848)))))

(declare-fun bs!30336 () Bool)

(assert (= bs!30336 d!124967))

(declare-fun m!956615 () Bool)

(assert (=> bs!30336 m!956615))

(assert (=> bs!30336 m!956615))

(declare-fun m!956617 () Bool)

(assert (=> bs!30336 m!956617))

(assert (=> b!1036064 d!124967))

(declare-fun d!124969 () Bool)

(declare-fun e!586355 () Bool)

(assert (=> d!124969 e!586355))

(declare-fun res!691897 () Bool)

(assert (=> d!124969 (=> (not res!691897) (not e!586355))))

(declare-fun lt!457136 () ListLongMap!13833)

(assert (=> d!124969 (= res!691897 (contains!6001 lt!457136 (_1!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))))))

(declare-fun lt!457137 () List!21952)

(assert (=> d!124969 (= lt!457136 (ListLongMap!13834 lt!457137))))

(declare-fun lt!457135 () Unit!33774)

(declare-fun lt!457134 () Unit!33774)

(assert (=> d!124969 (= lt!457135 lt!457134)))

(assert (=> d!124969 (= (getValueByKey!591 lt!457137 (_1!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))))))

(assert (=> d!124969 (= lt!457134 (lemmaContainsTupThenGetReturnValue!281 lt!457137 (_1!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))) (_2!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))))))

(assert (=> d!124969 (= lt!457137 (insertStrictlySorted!374 (toList!6932 lt!456847) (_1!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))) (_2!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))))))

(assert (=> d!124969 (= (+!3131 lt!456847 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))) lt!457136)))

(declare-fun b!1036744 () Bool)

(declare-fun res!691896 () Bool)

(assert (=> b!1036744 (=> (not res!691896) (not e!586355))))

(assert (=> b!1036744 (= res!691896 (= (getValueByKey!591 (toList!6932 lt!457136) (_1!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))))))))

(declare-fun b!1036745 () Bool)

(assert (=> b!1036745 (= e!586355 (contains!6002 (toList!6932 lt!457136) (tuple2!15811 lt!456844 (zeroValue!6103 lt!456581))))))

(assert (= (and d!124969 res!691897) b!1036744))

(assert (= (and b!1036744 res!691896) b!1036745))

(declare-fun m!956619 () Bool)

(assert (=> d!124969 m!956619))

(declare-fun m!956621 () Bool)

(assert (=> d!124969 m!956621))

(declare-fun m!956623 () Bool)

(assert (=> d!124969 m!956623))

(declare-fun m!956625 () Bool)

(assert (=> d!124969 m!956625))

(declare-fun m!956627 () Bool)

(assert (=> b!1036744 m!956627))

(declare-fun m!956629 () Bool)

(assert (=> b!1036745 m!956629))

(assert (=> b!1036064 d!124969))

(declare-fun d!124971 () Bool)

(assert (=> d!124971 (= (apply!900 (+!3131 lt!456851 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))) lt!456841) (apply!900 lt!456851 lt!456841))))

(declare-fun lt!457138 () Unit!33774)

(assert (=> d!124971 (= lt!457138 (choose!1711 lt!456851 lt!456835 (minValue!6105 lt!456581) lt!456841))))

(declare-fun e!586356 () Bool)

(assert (=> d!124971 e!586356))

(declare-fun res!691898 () Bool)

(assert (=> d!124971 (=> (not res!691898) (not e!586356))))

(assert (=> d!124971 (= res!691898 (contains!6001 lt!456851 lt!456841))))

(assert (=> d!124971 (= (addApplyDifferent!475 lt!456851 lt!456835 (minValue!6105 lt!456581) lt!456841) lt!457138)))

(declare-fun b!1036746 () Bool)

(assert (=> b!1036746 (= e!586356 (not (= lt!456841 lt!456835)))))

(assert (= (and d!124971 res!691898) b!1036746))

(declare-fun m!956631 () Bool)

(assert (=> d!124971 m!956631))

(declare-fun m!956633 () Bool)

(assert (=> d!124971 m!956633))

(assert (=> d!124971 m!955573))

(assert (=> d!124971 m!955591))

(assert (=> d!124971 m!955573))

(assert (=> d!124971 m!955587))

(assert (=> b!1036064 d!124971))

(declare-fun d!124973 () Bool)

(assert (=> d!124973 (= (apply!900 lt!456842 lt!456848) (get!16459 (getValueByKey!591 (toList!6932 lt!456842) lt!456848)))))

(declare-fun bs!30337 () Bool)

(assert (= bs!30337 d!124973))

(declare-fun m!956635 () Bool)

(assert (=> bs!30337 m!956635))

(assert (=> bs!30337 m!956635))

(declare-fun m!956637 () Bool)

(assert (=> bs!30337 m!956637))

(assert (=> b!1036064 d!124973))

(assert (=> b!1036064 d!124889))

(declare-fun d!124975 () Bool)

(declare-fun e!586357 () Bool)

(assert (=> d!124975 e!586357))

(declare-fun res!691900 () Bool)

(assert (=> d!124975 (=> (not res!691900) (not e!586357))))

(declare-fun lt!457141 () ListLongMap!13833)

(assert (=> d!124975 (= res!691900 (contains!6001 lt!457141 (_1!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))))))

(declare-fun lt!457142 () List!21952)

(assert (=> d!124975 (= lt!457141 (ListLongMap!13834 lt!457142))))

(declare-fun lt!457140 () Unit!33774)

(declare-fun lt!457139 () Unit!33774)

(assert (=> d!124975 (= lt!457140 lt!457139)))

(assert (=> d!124975 (= (getValueByKey!591 lt!457142 (_1!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))))))

(assert (=> d!124975 (= lt!457139 (lemmaContainsTupThenGetReturnValue!281 lt!457142 (_1!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))) (_2!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))))))

(assert (=> d!124975 (= lt!457142 (insertStrictlySorted!374 (toList!6932 lt!456851) (_1!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))) (_2!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))))))

(assert (=> d!124975 (= (+!3131 lt!456851 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))) lt!457141)))

(declare-fun b!1036747 () Bool)

(declare-fun res!691899 () Bool)

(assert (=> b!1036747 (=> (not res!691899) (not e!586357))))

(assert (=> b!1036747 (= res!691899 (= (getValueByKey!591 (toList!6932 lt!457141) (_1!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581)))) (Some!641 (_2!7916 (tuple2!15811 lt!456835 (minValue!6105 lt!456581))))))))

(declare-fun b!1036748 () Bool)

(assert (=> b!1036748 (= e!586357 (contains!6002 (toList!6932 lt!457141) (tuple2!15811 lt!456835 (minValue!6105 lt!456581))))))

(assert (= (and d!124975 res!691900) b!1036747))

(assert (= (and b!1036747 res!691899) b!1036748))

(declare-fun m!956639 () Bool)

(assert (=> d!124975 m!956639))

(declare-fun m!956641 () Bool)

(assert (=> d!124975 m!956641))

(declare-fun m!956643 () Bool)

(assert (=> d!124975 m!956643))

(declare-fun m!956645 () Bool)

(assert (=> d!124975 m!956645))

(declare-fun m!956647 () Bool)

(assert (=> b!1036747 m!956647))

(declare-fun m!956649 () Bool)

(assert (=> b!1036748 m!956649))

(assert (=> b!1036064 d!124975))

(declare-fun d!124977 () Bool)

(assert (=> d!124977 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456686) lt!456678)) (v!14930 (getValueByKey!591 (toList!6932 lt!456686) lt!456678)))))

(assert (=> d!124515 d!124977))

(declare-fun d!124979 () Bool)

(declare-fun c!104994 () Bool)

(assert (=> d!124979 (= c!104994 (and ((_ is Cons!21948) (toList!6932 lt!456686)) (= (_1!7916 (h!23150 (toList!6932 lt!456686))) lt!456678)))))

(declare-fun e!586358 () Option!642)

(assert (=> d!124979 (= (getValueByKey!591 (toList!6932 lt!456686) lt!456678) e!586358)))

(declare-fun b!1036752 () Bool)

(declare-fun e!586359 () Option!642)

(assert (=> b!1036752 (= e!586359 None!640)))

(declare-fun b!1036749 () Bool)

(assert (=> b!1036749 (= e!586358 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456686)))))))

(declare-fun b!1036750 () Bool)

(assert (=> b!1036750 (= e!586358 e!586359)))

(declare-fun c!104995 () Bool)

(assert (=> b!1036750 (= c!104995 (and ((_ is Cons!21948) (toList!6932 lt!456686)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456686))) lt!456678))))))

(declare-fun b!1036751 () Bool)

(assert (=> b!1036751 (= e!586359 (getValueByKey!591 (t!31148 (toList!6932 lt!456686)) lt!456678))))

(assert (= (and d!124979 c!104994) b!1036749))

(assert (= (and d!124979 (not c!104994)) b!1036750))

(assert (= (and b!1036750 c!104995) b!1036751))

(assert (= (and b!1036750 (not c!104995)) b!1036752))

(declare-fun m!956651 () Bool)

(assert (=> b!1036751 m!956651))

(assert (=> d!124515 d!124979))

(assert (=> b!1036114 d!124639))

(declare-fun d!124981 () Bool)

(declare-fun res!691901 () Bool)

(declare-fun e!586360 () Bool)

(assert (=> d!124981 (=> res!691901 e!586360)))

(assert (=> d!124981 (= res!691901 (and ((_ is Cons!21948) (toList!6932 lt!456682)) (= (_1!7916 (h!23150 (toList!6932 lt!456682))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124981 (= (containsKey!564 (toList!6932 lt!456682) #b1000000000000000000000000000000000000000000000000000000000000000) e!586360)))

(declare-fun b!1036753 () Bool)

(declare-fun e!586361 () Bool)

(assert (=> b!1036753 (= e!586360 e!586361)))

(declare-fun res!691902 () Bool)

(assert (=> b!1036753 (=> (not res!691902) (not e!586361))))

(assert (=> b!1036753 (= res!691902 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456682))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456682))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21948) (toList!6932 lt!456682)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456682))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036754 () Bool)

(assert (=> b!1036754 (= e!586361 (containsKey!564 (t!31148 (toList!6932 lt!456682)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124981 (not res!691901)) b!1036753))

(assert (= (and b!1036753 res!691902) b!1036754))

(declare-fun m!956653 () Bool)

(assert (=> b!1036754 m!956653))

(assert (=> d!124441 d!124981))

(declare-fun d!124983 () Bool)

(assert (=> d!124983 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457143 () Unit!33774)

(assert (=> d!124983 (= lt!457143 (choose!1712 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586362 () Bool)

(assert (=> d!124983 e!586362))

(declare-fun res!691903 () Bool)

(assert (=> d!124983 (=> (not res!691903) (not e!586362))))

(assert (=> d!124983 (= res!691903 (isStrictlySorted!715 (toList!6932 lt!456693)))))

(assert (=> d!124983 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457143)))

(declare-fun b!1036755 () Bool)

(assert (=> b!1036755 (= e!586362 (containsKey!564 (toList!6932 lt!456693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124983 res!691903) b!1036755))

(assert (=> d!124983 m!955401))

(assert (=> d!124983 m!955401))

(assert (=> d!124983 m!955403))

(declare-fun m!956655 () Bool)

(assert (=> d!124983 m!956655))

(declare-fun m!956657 () Bool)

(assert (=> d!124983 m!956657))

(assert (=> b!1036755 m!955397))

(assert (=> b!1036011 d!124983))

(assert (=> b!1036011 d!124737))

(assert (=> b!1036011 d!124739))

(declare-fun d!124985 () Bool)

(assert (=> d!124985 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14930 (getValueByKey!591 (toList!6932 lt!456660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124443 d!124985))

(assert (=> d!124443 d!124731))

(assert (=> b!1035978 d!124841))

(assert (=> d!124525 d!124499))

(assert (=> d!124525 d!124517))

(declare-fun d!124987 () Bool)

(assert (=> d!124987 (contains!6001 (+!3131 lt!456692 (tuple2!15811 lt!456675 (zeroValue!6103 thiss!1427))) lt!456676)))

(assert (=> d!124987 true))

(declare-fun _$35!443 () Unit!33774)

(assert (=> d!124987 (= (choose!1710 lt!456692 lt!456675 (zeroValue!6103 thiss!1427) lt!456676) _$35!443)))

(declare-fun bs!30338 () Bool)

(assert (= bs!30338 d!124987))

(assert (=> bs!30338 m!955153))

(assert (=> bs!30338 m!955153))

(assert (=> bs!30338 m!955155))

(assert (=> d!124525 d!124987))

(declare-fun d!124989 () Bool)

(declare-fun e!586363 () Bool)

(assert (=> d!124989 e!586363))

(declare-fun res!691904 () Bool)

(assert (=> d!124989 (=> res!691904 e!586363)))

(declare-fun lt!457145 () Bool)

(assert (=> d!124989 (= res!691904 (not lt!457145))))

(declare-fun lt!457144 () Bool)

(assert (=> d!124989 (= lt!457145 lt!457144)))

(declare-fun lt!457147 () Unit!33774)

(declare-fun e!586364 () Unit!33774)

(assert (=> d!124989 (= lt!457147 e!586364)))

(declare-fun c!104996 () Bool)

(assert (=> d!124989 (= c!104996 lt!457144)))

(assert (=> d!124989 (= lt!457144 (containsKey!564 (toList!6932 lt!456692) lt!456676))))

(assert (=> d!124989 (= (contains!6001 lt!456692 lt!456676) lt!457145)))

(declare-fun b!1036756 () Bool)

(declare-fun lt!457146 () Unit!33774)

(assert (=> b!1036756 (= e!586364 lt!457146)))

(assert (=> b!1036756 (= lt!457146 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456692) lt!456676))))

(assert (=> b!1036756 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456692) lt!456676))))

(declare-fun b!1036757 () Bool)

(declare-fun Unit!33817 () Unit!33774)

(assert (=> b!1036757 (= e!586364 Unit!33817)))

(declare-fun b!1036758 () Bool)

(assert (=> b!1036758 (= e!586363 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456692) lt!456676)))))

(assert (= (and d!124989 c!104996) b!1036756))

(assert (= (and d!124989 (not c!104996)) b!1036757))

(assert (= (and d!124989 (not res!691904)) b!1036758))

(declare-fun m!956659 () Bool)

(assert (=> d!124989 m!956659))

(declare-fun m!956661 () Bool)

(assert (=> b!1036756 m!956661))

(declare-fun m!956663 () Bool)

(assert (=> b!1036756 m!956663))

(assert (=> b!1036756 m!956663))

(declare-fun m!956665 () Bool)

(assert (=> b!1036756 m!956665))

(assert (=> b!1036758 m!956663))

(assert (=> b!1036758 m!956663))

(assert (=> b!1036758 m!956665))

(assert (=> d!124525 d!124989))

(declare-fun d!124991 () Bool)

(assert (=> d!124991 (= ($colon$colon!605 (removeStrictlySorted!57 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23150 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (Cons!21948 (h!23150 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) (removeStrictlySorted!57 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1036015 d!124991))

(declare-fun b!1036759 () Bool)

(declare-fun e!586367 () List!21952)

(assert (=> b!1036759 (= e!586367 (t!31148 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))

(declare-fun b!1036760 () Bool)

(declare-fun e!586365 () List!21952)

(assert (=> b!1036760 (= e!586365 ($colon$colon!605 (removeStrictlySorted!57 (t!31148 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23150 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))))

(declare-fun b!1036761 () Bool)

(assert (=> b!1036761 (= e!586365 Nil!21949)))

(declare-fun d!124993 () Bool)

(declare-fun e!586366 () Bool)

(assert (=> d!124993 e!586366))

(declare-fun res!691905 () Bool)

(assert (=> d!124993 (=> (not res!691905) (not e!586366))))

(declare-fun lt!457148 () List!21952)

(assert (=> d!124993 (= res!691905 (isStrictlySorted!715 lt!457148))))

(assert (=> d!124993 (= lt!457148 e!586367)))

(declare-fun c!104998 () Bool)

(assert (=> d!124993 (= c!104998 (and ((_ is Cons!21948) (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (= (_1!7916 (h!23150 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124993 (isStrictlySorted!715 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))

(assert (=> d!124993 (= (removeStrictlySorted!57 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457148)))

(declare-fun b!1036762 () Bool)

(assert (=> b!1036762 (= e!586367 e!586365)))

(declare-fun c!104997 () Bool)

(assert (=> b!1036762 (= c!104997 (and ((_ is Cons!21948) (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (not (= (_1!7916 (h!23150 (t!31148 (toList!6932 (getCurrentListMap!3898 (_keys!11454 thiss!1427) (_values!6292 thiss!1427) (mask!30165 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036763 () Bool)

(assert (=> b!1036763 (= e!586366 (not (containsKey!564 lt!457148 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124993 c!104998) b!1036759))

(assert (= (and d!124993 (not c!104998)) b!1036762))

(assert (= (and b!1036762 c!104997) b!1036760))

(assert (= (and b!1036762 (not c!104997)) b!1036761))

(assert (= (and d!124993 res!691905) b!1036763))

(declare-fun m!956667 () Bool)

(assert (=> b!1036760 m!956667))

(assert (=> b!1036760 m!956667))

(declare-fun m!956669 () Bool)

(assert (=> b!1036760 m!956669))

(declare-fun m!956671 () Bool)

(assert (=> d!124993 m!956671))

(assert (=> d!124993 m!956465))

(declare-fun m!956673 () Bool)

(assert (=> b!1036763 m!956673))

(assert (=> b!1036015 d!124993))

(declare-fun b!1036764 () Bool)

(declare-fun e!586371 () Bool)

(declare-fun e!586368 () Bool)

(assert (=> b!1036764 (= e!586371 e!586368)))

(declare-fun res!691906 () Bool)

(assert (=> b!1036764 (=> (not res!691906) (not e!586368))))

(declare-fun e!586369 () Bool)

(assert (=> b!1036764 (= res!691906 (not e!586369))))

(declare-fun res!691907 () Bool)

(assert (=> b!1036764 (=> (not res!691907) (not e!586369))))

(assert (=> b!1036764 (= res!691907 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124995 () Bool)

(declare-fun res!691908 () Bool)

(assert (=> d!124995 (=> res!691908 e!586371)))

(assert (=> d!124995 (= res!691908 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31928 (_keys!11454 thiss!1427))))))

(assert (=> d!124995 (= (arrayNoDuplicates!0 (_keys!11454 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104783 (Cons!21949 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)) e!586371)))

(declare-fun b!1036765 () Bool)

(assert (=> b!1036765 (= e!586369 (contains!6003 (ite c!104783 (Cons!21949 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) Nil!21950) Nil!21950) (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036766 () Bool)

(declare-fun e!586370 () Bool)

(declare-fun call!43876 () Bool)

(assert (=> b!1036766 (= e!586370 call!43876)))

(declare-fun c!104999 () Bool)

(declare-fun bm!43873 () Bool)

(assert (=> bm!43873 (= call!43876 (arrayNoDuplicates!0 (_keys!11454 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104999 (Cons!21949 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104783 (Cons!21949 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) Nil!21950) Nil!21950)) (ite c!104783 (Cons!21949 (select (arr!31398 (_keys!11454 thiss!1427)) #b00000000000000000000000000000000) Nil!21950) Nil!21950))))))

(declare-fun b!1036767 () Bool)

(assert (=> b!1036767 (= e!586368 e!586370)))

(assert (=> b!1036767 (= c!104999 (validKeyInArray!0 (select (arr!31398 (_keys!11454 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1036768 () Bool)

(assert (=> b!1036768 (= e!586370 call!43876)))

(assert (= (and d!124995 (not res!691908)) b!1036764))

(assert (= (and b!1036764 res!691907) b!1036765))

(assert (= (and b!1036764 res!691906) b!1036767))

(assert (= (and b!1036767 c!104999) b!1036766))

(assert (= (and b!1036767 (not c!104999)) b!1036768))

(assert (= (or b!1036766 b!1036768) bm!43873))

(assert (=> b!1036764 m!956015))

(assert (=> b!1036764 m!956015))

(assert (=> b!1036764 m!956017))

(assert (=> b!1036765 m!956015))

(assert (=> b!1036765 m!956015))

(declare-fun m!956675 () Bool)

(assert (=> b!1036765 m!956675))

(assert (=> bm!43873 m!956015))

(declare-fun m!956677 () Bool)

(assert (=> bm!43873 m!956677))

(assert (=> b!1036767 m!956015))

(assert (=> b!1036767 m!956015))

(assert (=> b!1036767 m!956017))

(assert (=> bm!43819 d!124995))

(assert (=> b!1036046 d!124645))

(assert (=> d!124527 d!124511))

(declare-fun d!124997 () Bool)

(declare-fun e!586372 () Bool)

(assert (=> d!124997 e!586372))

(declare-fun res!691909 () Bool)

(assert (=> d!124997 (=> res!691909 e!586372)))

(declare-fun lt!457150 () Bool)

(assert (=> d!124997 (= res!691909 (not lt!457150))))

(declare-fun lt!457149 () Bool)

(assert (=> d!124997 (= lt!457150 lt!457149)))

(declare-fun lt!457152 () Unit!33774)

(declare-fun e!586373 () Unit!33774)

(assert (=> d!124997 (= lt!457152 e!586373)))

(declare-fun c!105000 () Bool)

(assert (=> d!124997 (= c!105000 lt!457149)))

(assert (=> d!124997 (= lt!457149 (containsKey!564 (toList!6932 lt!456690) lt!456680))))

(assert (=> d!124997 (= (contains!6001 lt!456690 lt!456680) lt!457150)))

(declare-fun b!1036769 () Bool)

(declare-fun lt!457151 () Unit!33774)

(assert (=> b!1036769 (= e!586373 lt!457151)))

(assert (=> b!1036769 (= lt!457151 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456690) lt!456680))))

(assert (=> b!1036769 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456690) lt!456680))))

(declare-fun b!1036770 () Bool)

(declare-fun Unit!33818 () Unit!33774)

(assert (=> b!1036770 (= e!586373 Unit!33818)))

(declare-fun b!1036771 () Bool)

(assert (=> b!1036771 (= e!586372 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456690) lt!456680)))))

(assert (= (and d!124997 c!105000) b!1036769))

(assert (= (and d!124997 (not c!105000)) b!1036770))

(assert (= (and d!124997 (not res!691909)) b!1036771))

(declare-fun m!956679 () Bool)

(assert (=> d!124997 m!956679))

(declare-fun m!956681 () Bool)

(assert (=> b!1036769 m!956681))

(assert (=> b!1036769 m!955463))

(assert (=> b!1036769 m!955463))

(declare-fun m!956683 () Bool)

(assert (=> b!1036769 m!956683))

(assert (=> b!1036771 m!955463))

(assert (=> b!1036771 m!955463))

(assert (=> b!1036771 m!956683))

(assert (=> d!124527 d!124997))

(declare-fun d!124999 () Bool)

(assert (=> d!124999 (= (apply!900 (+!3131 lt!456690 (tuple2!15811 lt!456674 (minValue!6105 thiss!1427))) lt!456680) (apply!900 lt!456690 lt!456680))))

(assert (=> d!124999 true))

(declare-fun _$34!1176 () Unit!33774)

(assert (=> d!124999 (= (choose!1711 lt!456690 lt!456674 (minValue!6105 thiss!1427) lt!456680) _$34!1176)))

(declare-fun bs!30339 () Bool)

(assert (= bs!30339 d!124999))

(assert (=> bs!30339 m!955145))

(assert (=> bs!30339 m!955145))

(assert (=> bs!30339 m!955159))

(assert (=> bs!30339 m!955163))

(assert (=> d!124527 d!124999))

(assert (=> d!124527 d!124521))

(assert (=> d!124527 d!124523))

(declare-fun d!125001 () Bool)

(assert (=> d!125001 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456604) key!909))))

(declare-fun lt!457153 () Unit!33774)

(assert (=> d!125001 (= lt!457153 (choose!1712 (toList!6932 lt!456604) key!909))))

(declare-fun e!586374 () Bool)

(assert (=> d!125001 e!586374))

(declare-fun res!691910 () Bool)

(assert (=> d!125001 (=> (not res!691910) (not e!586374))))

(assert (=> d!125001 (= res!691910 (isStrictlySorted!715 (toList!6932 lt!456604)))))

(assert (=> d!125001 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456604) key!909) lt!457153)))

(declare-fun b!1036772 () Bool)

(assert (=> b!1036772 (= e!586374 (containsKey!564 (toList!6932 lt!456604) key!909))))

(assert (= (and d!125001 res!691910) b!1036772))

(assert (=> d!125001 m!955203))

(assert (=> d!125001 m!955203))

(assert (=> d!125001 m!955205))

(declare-fun m!956685 () Bool)

(assert (=> d!125001 m!956685))

(declare-fun m!956687 () Bool)

(assert (=> d!125001 m!956687))

(assert (=> b!1036772 m!955199))

(assert (=> b!1035892 d!125001))

(assert (=> b!1035892 d!124701))

(assert (=> b!1035892 d!124703))

(declare-fun d!125003 () Bool)

(assert (=> d!125003 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14930 (getValueByKey!591 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124535 d!125003))

(assert (=> d!124535 d!124615))

(declare-fun d!125005 () Bool)

(declare-fun res!691911 () Bool)

(declare-fun e!586375 () Bool)

(assert (=> d!125005 (=> res!691911 e!586375)))

(assert (=> d!125005 (= res!691911 (and ((_ is Cons!21948) (toList!6932 lt!456660)) (= (_1!7916 (h!23150 (toList!6932 lt!456660))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125005 (= (containsKey!564 (toList!6932 lt!456660) #b1000000000000000000000000000000000000000000000000000000000000000) e!586375)))

(declare-fun b!1036773 () Bool)

(declare-fun e!586376 () Bool)

(assert (=> b!1036773 (= e!586375 e!586376)))

(declare-fun res!691912 () Bool)

(assert (=> b!1036773 (=> (not res!691912) (not e!586376))))

(assert (=> b!1036773 (= res!691912 (and (or (not ((_ is Cons!21948) (toList!6932 lt!456660))) (bvsle (_1!7916 (h!23150 (toList!6932 lt!456660))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21948) (toList!6932 lt!456660)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456660))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1036774 () Bool)

(assert (=> b!1036774 (= e!586376 (containsKey!564 (t!31148 (toList!6932 lt!456660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125005 (not res!691911)) b!1036773))

(assert (= (and b!1036773 res!691912) b!1036774))

(declare-fun m!956689 () Bool)

(assert (=> b!1036774 m!956689))

(assert (=> d!124533 d!125005))

(declare-fun d!125007 () Bool)

(declare-fun e!586377 () Bool)

(assert (=> d!125007 e!586377))

(declare-fun res!691913 () Bool)

(assert (=> d!125007 (=> res!691913 e!586377)))

(declare-fun lt!457155 () Bool)

(assert (=> d!125007 (= res!691913 (not lt!457155))))

(declare-fun lt!457154 () Bool)

(assert (=> d!125007 (= lt!457155 lt!457154)))

(declare-fun lt!457157 () Unit!33774)

(declare-fun e!586378 () Unit!33774)

(assert (=> d!125007 (= lt!457157 e!586378)))

(declare-fun c!105001 () Bool)

(assert (=> d!125007 (= c!105001 lt!457154)))

(assert (=> d!125007 (= lt!457154 (containsKey!564 (toList!6932 lt!456803) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125007 (= (contains!6001 lt!456803 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!457155)))

(declare-fun b!1036775 () Bool)

(declare-fun lt!457156 () Unit!33774)

(assert (=> b!1036775 (= e!586378 lt!457156)))

(assert (=> b!1036775 (= lt!457156 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456803) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1036775 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456803) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036776 () Bool)

(declare-fun Unit!33819 () Unit!33774)

(assert (=> b!1036776 (= e!586378 Unit!33819)))

(declare-fun b!1036777 () Bool)

(assert (=> b!1036777 (= e!586377 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456803) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125007 c!105001) b!1036775))

(assert (= (and d!125007 (not c!105001)) b!1036776))

(assert (= (and d!125007 (not res!691913)) b!1036777))

(declare-fun m!956691 () Bool)

(assert (=> d!125007 m!956691))

(declare-fun m!956693 () Bool)

(assert (=> b!1036775 m!956693))

(assert (=> b!1036775 m!955439))

(assert (=> b!1036775 m!955439))

(declare-fun m!956695 () Bool)

(assert (=> b!1036775 m!956695))

(assert (=> b!1036777 m!955439))

(assert (=> b!1036777 m!955439))

(assert (=> b!1036777 m!956695))

(assert (=> d!124503 d!125007))

(declare-fun d!125009 () Bool)

(declare-fun c!105002 () Bool)

(assert (=> d!125009 (= c!105002 (and ((_ is Cons!21948) lt!456804) (= (_1!7916 (h!23150 lt!456804)) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!586379 () Option!642)

(assert (=> d!125009 (= (getValueByKey!591 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) e!586379)))

(declare-fun b!1036781 () Bool)

(declare-fun e!586380 () Option!642)

(assert (=> b!1036781 (= e!586380 None!640)))

(declare-fun b!1036778 () Bool)

(assert (=> b!1036778 (= e!586379 (Some!641 (_2!7916 (h!23150 lt!456804))))))

(declare-fun b!1036779 () Bool)

(assert (=> b!1036779 (= e!586379 e!586380)))

(declare-fun c!105003 () Bool)

(assert (=> b!1036779 (= c!105003 (and ((_ is Cons!21948) lt!456804) (not (= (_1!7916 (h!23150 lt!456804)) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1036780 () Bool)

(assert (=> b!1036780 (= e!586380 (getValueByKey!591 (t!31148 lt!456804) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(assert (= (and d!125009 c!105002) b!1036778))

(assert (= (and d!125009 (not c!105002)) b!1036779))

(assert (= (and b!1036779 c!105003) b!1036780))

(assert (= (and b!1036779 (not c!105003)) b!1036781))

(declare-fun m!956697 () Bool)

(assert (=> b!1036780 m!956697))

(assert (=> d!124503 d!125009))

(declare-fun d!125011 () Bool)

(assert (=> d!125011 (= (getValueByKey!591 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) (Some!641 (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457158 () Unit!33774)

(assert (=> d!125011 (= lt!457158 (choose!1714 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!586381 () Bool)

(assert (=> d!125011 e!586381))

(declare-fun res!691914 () Bool)

(assert (=> d!125011 (=> (not res!691914) (not e!586381))))

(assert (=> d!125011 (= res!691914 (isStrictlySorted!715 lt!456804))))

(assert (=> d!125011 (= (lemmaContainsTupThenGetReturnValue!281 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!457158)))

(declare-fun b!1036782 () Bool)

(declare-fun res!691915 () Bool)

(assert (=> b!1036782 (=> (not res!691915) (not e!586381))))

(assert (=> b!1036782 (= res!691915 (containsKey!564 lt!456804 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036783 () Bool)

(assert (=> b!1036783 (= e!586381 (contains!6002 lt!456804 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125011 res!691914) b!1036782))

(assert (= (and b!1036782 res!691915) b!1036783))

(assert (=> d!125011 m!955433))

(declare-fun m!956699 () Bool)

(assert (=> d!125011 m!956699))

(declare-fun m!956701 () Bool)

(assert (=> d!125011 m!956701))

(declare-fun m!956703 () Bool)

(assert (=> b!1036782 m!956703))

(declare-fun m!956705 () Bool)

(assert (=> b!1036783 m!956705))

(assert (=> d!124503 d!125011))

(declare-fun b!1036784 () Bool)

(declare-fun e!586384 () List!21952)

(declare-fun call!43877 () List!21952)

(assert (=> b!1036784 (= e!586384 call!43877)))

(declare-fun b!1036785 () Bool)

(declare-fun e!586383 () List!21952)

(declare-fun call!43878 () List!21952)

(assert (=> b!1036785 (= e!586383 call!43878)))

(declare-fun b!1036786 () Bool)

(declare-fun res!691916 () Bool)

(declare-fun e!586385 () Bool)

(assert (=> b!1036786 (=> (not res!691916) (not e!586385))))

(declare-fun lt!457159 () List!21952)

(assert (=> b!1036786 (= res!691916 (containsKey!564 lt!457159 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036787 () Bool)

(assert (=> b!1036787 (= e!586384 e!586383)))

(declare-fun c!105005 () Bool)

(assert (=> b!1036787 (= c!105005 (and ((_ is Cons!21948) (toList!6932 lt!456686)) (= (_1!7916 (h!23150 (toList!6932 lt!456686))) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43874 () Bool)

(assert (=> bm!43874 (= call!43878 call!43877)))

(declare-fun b!1036788 () Bool)

(declare-fun e!586382 () List!21952)

(declare-fun call!43879 () List!21952)

(assert (=> b!1036788 (= e!586382 call!43879)))

(declare-fun c!105007 () Bool)

(declare-fun b!1036789 () Bool)

(declare-fun e!586386 () List!21952)

(assert (=> b!1036789 (= e!586386 (ite c!105005 (t!31148 (toList!6932 lt!456686)) (ite c!105007 (Cons!21948 (h!23150 (toList!6932 lt!456686)) (t!31148 (toList!6932 lt!456686))) Nil!21949)))))

(declare-fun b!1036790 () Bool)

(assert (=> b!1036790 (= e!586382 call!43879)))

(declare-fun bm!43875 () Bool)

(declare-fun c!105004 () Bool)

(assert (=> bm!43875 (= call!43877 ($colon$colon!605 e!586386 (ite c!105004 (h!23150 (toList!6932 lt!456686)) (tuple2!15811 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!105006 () Bool)

(assert (=> bm!43875 (= c!105006 c!105004)))

(declare-fun bm!43876 () Bool)

(assert (=> bm!43876 (= call!43879 call!43878)))

(declare-fun b!1036791 () Bool)

(assert (=> b!1036791 (= e!586386 (insertStrictlySorted!374 (t!31148 (toList!6932 lt!456686)) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1036792 () Bool)

(assert (=> b!1036792 (= e!586385 (contains!6002 lt!457159 (tuple2!15811 (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(declare-fun d!125013 () Bool)

(assert (=> d!125013 e!586385))

(declare-fun res!691917 () Bool)

(assert (=> d!125013 (=> (not res!691917) (not e!586385))))

(assert (=> d!125013 (= res!691917 (isStrictlySorted!715 lt!457159))))

(assert (=> d!125013 (= lt!457159 e!586384)))

(assert (=> d!125013 (= c!105004 (and ((_ is Cons!21948) (toList!6932 lt!456686)) (bvslt (_1!7916 (h!23150 (toList!6932 lt!456686))) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125013 (isStrictlySorted!715 (toList!6932 lt!456686))))

(assert (=> d!125013 (= (insertStrictlySorted!374 (toList!6932 lt!456686) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))) (_2!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427)))) lt!457159)))

(declare-fun b!1036793 () Bool)

(assert (=> b!1036793 (= c!105007 (and ((_ is Cons!21948) (toList!6932 lt!456686)) (bvsgt (_1!7916 (h!23150 (toList!6932 lt!456686))) (_1!7916 (tuple2!15811 lt!456683 (zeroValue!6103 thiss!1427))))))))

(assert (=> b!1036793 (= e!586383 e!586382)))

(assert (= (and d!125013 c!105004) b!1036784))

(assert (= (and d!125013 (not c!105004)) b!1036787))

(assert (= (and b!1036787 c!105005) b!1036785))

(assert (= (and b!1036787 (not c!105005)) b!1036793))

(assert (= (and b!1036793 c!105007) b!1036788))

(assert (= (and b!1036793 (not c!105007)) b!1036790))

(assert (= (or b!1036788 b!1036790) bm!43876))

(assert (= (or b!1036785 bm!43876) bm!43874))

(assert (= (or b!1036784 bm!43874) bm!43875))

(assert (= (and bm!43875 c!105006) b!1036791))

(assert (= (and bm!43875 (not c!105006)) b!1036789))

(assert (= (and d!125013 res!691917) b!1036786))

(assert (= (and b!1036786 res!691916) b!1036792))

(declare-fun m!956707 () Bool)

(assert (=> b!1036792 m!956707))

(declare-fun m!956709 () Bool)

(assert (=> b!1036786 m!956709))

(declare-fun m!956711 () Bool)

(assert (=> b!1036791 m!956711))

(declare-fun m!956713 () Bool)

(assert (=> bm!43875 m!956713))

(declare-fun m!956715 () Bool)

(assert (=> d!125013 m!956715))

(declare-fun m!956717 () Bool)

(assert (=> d!125013 m!956717))

(assert (=> d!124503 d!125013))

(declare-fun d!125015 () Bool)

(assert (=> d!125015 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456690) lt!456680)) (v!14930 (getValueByKey!591 (toList!6932 lt!456690) lt!456680)))))

(assert (=> d!124511 d!125015))

(declare-fun d!125017 () Bool)

(declare-fun c!105008 () Bool)

(assert (=> d!125017 (= c!105008 (and ((_ is Cons!21948) (toList!6932 lt!456690)) (= (_1!7916 (h!23150 (toList!6932 lt!456690))) lt!456680)))))

(declare-fun e!586387 () Option!642)

(assert (=> d!125017 (= (getValueByKey!591 (toList!6932 lt!456690) lt!456680) e!586387)))

(declare-fun b!1036797 () Bool)

(declare-fun e!586388 () Option!642)

(assert (=> b!1036797 (= e!586388 None!640)))

(declare-fun b!1036794 () Bool)

(assert (=> b!1036794 (= e!586387 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456690)))))))

(declare-fun b!1036795 () Bool)

(assert (=> b!1036795 (= e!586387 e!586388)))

(declare-fun c!105009 () Bool)

(assert (=> b!1036795 (= c!105009 (and ((_ is Cons!21948) (toList!6932 lt!456690)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456690))) lt!456680))))))

(declare-fun b!1036796 () Bool)

(assert (=> b!1036796 (= e!586388 (getValueByKey!591 (t!31148 (toList!6932 lt!456690)) lt!456680))))

(assert (= (and d!125017 c!105008) b!1036794))

(assert (= (and d!125017 (not c!105008)) b!1036795))

(assert (= (and b!1036795 c!105009) b!1036796))

(assert (= (and b!1036795 (not c!105009)) b!1036797))

(declare-fun m!956719 () Bool)

(assert (=> b!1036796 m!956719))

(assert (=> d!124511 d!125017))

(declare-fun d!125019 () Bool)

(assert (=> d!125019 (= (get!16459 (getValueByKey!591 (toList!6932 lt!456664) lt!456656)) (v!14930 (getValueByKey!591 (toList!6932 lt!456664) lt!456656)))))

(assert (=> d!124461 d!125019))

(declare-fun d!125021 () Bool)

(declare-fun c!105010 () Bool)

(assert (=> d!125021 (= c!105010 (and ((_ is Cons!21948) (toList!6932 lt!456664)) (= (_1!7916 (h!23150 (toList!6932 lt!456664))) lt!456656)))))

(declare-fun e!586389 () Option!642)

(assert (=> d!125021 (= (getValueByKey!591 (toList!6932 lt!456664) lt!456656) e!586389)))

(declare-fun b!1036801 () Bool)

(declare-fun e!586390 () Option!642)

(assert (=> b!1036801 (= e!586390 None!640)))

(declare-fun b!1036798 () Bool)

(assert (=> b!1036798 (= e!586389 (Some!641 (_2!7916 (h!23150 (toList!6932 lt!456664)))))))

(declare-fun b!1036799 () Bool)

(assert (=> b!1036799 (= e!586389 e!586390)))

(declare-fun c!105011 () Bool)

(assert (=> b!1036799 (= c!105011 (and ((_ is Cons!21948) (toList!6932 lt!456664)) (not (= (_1!7916 (h!23150 (toList!6932 lt!456664))) lt!456656))))))

(declare-fun b!1036800 () Bool)

(assert (=> b!1036800 (= e!586390 (getValueByKey!591 (t!31148 (toList!6932 lt!456664)) lt!456656))))

(assert (= (and d!125021 c!105010) b!1036798))

(assert (= (and d!125021 (not c!105010)) b!1036799))

(assert (= (and b!1036799 c!105011) b!1036800))

(assert (= (and b!1036799 (not c!105011)) b!1036801))

(declare-fun m!956721 () Bool)

(assert (=> b!1036800 m!956721))

(assert (=> d!124461 d!125021))

(assert (=> b!1036118 d!124639))

(assert (=> b!1035982 d!124477))

(assert (=> d!124447 d!124455))

(assert (=> d!124447 d!124461))

(declare-fun d!125023 () Bool)

(declare-fun e!586391 () Bool)

(assert (=> d!125023 e!586391))

(declare-fun res!691918 () Bool)

(assert (=> d!125023 (=> res!691918 e!586391)))

(declare-fun lt!457161 () Bool)

(assert (=> d!125023 (= res!691918 (not lt!457161))))

(declare-fun lt!457160 () Bool)

(assert (=> d!125023 (= lt!457161 lt!457160)))

(declare-fun lt!457163 () Unit!33774)

(declare-fun e!586392 () Unit!33774)

(assert (=> d!125023 (= lt!457163 e!586392)))

(declare-fun c!105012 () Bool)

(assert (=> d!125023 (= c!105012 lt!457160)))

(assert (=> d!125023 (= lt!457160 (containsKey!564 (toList!6932 lt!456664) lt!456656))))

(assert (=> d!125023 (= (contains!6001 lt!456664 lt!456656) lt!457161)))

(declare-fun b!1036802 () Bool)

(declare-fun lt!457162 () Unit!33774)

(assert (=> b!1036802 (= e!586392 lt!457162)))

(assert (=> b!1036802 (= lt!457162 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6932 lt!456664) lt!456656))))

(assert (=> b!1036802 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456664) lt!456656))))

(declare-fun b!1036803 () Bool)

(declare-fun Unit!33820 () Unit!33774)

(assert (=> b!1036803 (= e!586392 Unit!33820)))

(declare-fun b!1036804 () Bool)

(assert (=> b!1036804 (= e!586391 (isDefined!439 (getValueByKey!591 (toList!6932 lt!456664) lt!456656)))))

(assert (= (and d!125023 c!105012) b!1036802))

(assert (= (and d!125023 (not c!105012)) b!1036803))

(assert (= (and d!125023 (not res!691918)) b!1036804))

(declare-fun m!956723 () Bool)

(assert (=> d!125023 m!956723))

(declare-fun m!956725 () Bool)

(assert (=> b!1036802 m!956725))

(assert (=> b!1036802 m!955313))

(assert (=> b!1036802 m!955313))

(declare-fun m!956727 () Bool)

(assert (=> b!1036802 m!956727))

(assert (=> b!1036804 m!955313))

(assert (=> b!1036804 m!955313))

(assert (=> b!1036804 m!956727))

(assert (=> d!124447 d!125023))

(declare-fun d!125025 () Bool)

(assert (=> d!125025 (= (apply!900 (+!3131 lt!456664 (tuple2!15811 lt!456661 (zeroValue!6103 thiss!1427))) lt!456656) (apply!900 lt!456664 lt!456656))))

(assert (=> d!125025 true))

(declare-fun _$34!1177 () Unit!33774)

(assert (=> d!125025 (= (choose!1711 lt!456664 lt!456661 (zeroValue!6103 thiss!1427) lt!456656) _$34!1177)))

(declare-fun bs!30340 () Bool)

(assert (= bs!30340 d!125025))

(assert (=> bs!30340 m!955095))

(assert (=> bs!30340 m!955095))

(assert (=> bs!30340 m!955119))

(assert (=> bs!30340 m!955113))

(assert (=> d!124447 d!125025))

(assert (=> d!124447 d!124467))

(declare-fun mapIsEmpty!38420 () Bool)

(declare-fun mapRes!38420 () Bool)

(assert (=> mapIsEmpty!38420 mapRes!38420))

(declare-fun b!1036806 () Bool)

(declare-fun e!586394 () Bool)

(assert (=> b!1036806 (= e!586394 tp_is_empty!24595)))

(declare-fun mapNonEmpty!38420 () Bool)

(declare-fun tp!73776 () Bool)

(declare-fun e!586393 () Bool)

(assert (=> mapNonEmpty!38420 (= mapRes!38420 (and tp!73776 e!586393))))

(declare-fun mapValue!38420 () ValueCell!11594)

(declare-fun mapRest!38420 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapKey!38420 () (_ BitVec 32))

(assert (=> mapNonEmpty!38420 (= mapRest!38419 (store mapRest!38420 mapKey!38420 mapValue!38420))))

(declare-fun b!1036805 () Bool)

(assert (=> b!1036805 (= e!586393 tp_is_empty!24595)))

(declare-fun condMapEmpty!38420 () Bool)

(declare-fun mapDefault!38420 () ValueCell!11594)

(assert (=> mapNonEmpty!38419 (= condMapEmpty!38420 (= mapRest!38419 ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38420)))))

(assert (=> mapNonEmpty!38419 (= tp!73775 (and e!586394 mapRes!38420))))

(assert (= (and mapNonEmpty!38419 condMapEmpty!38420) mapIsEmpty!38420))

(assert (= (and mapNonEmpty!38419 (not condMapEmpty!38420)) mapNonEmpty!38420))

(assert (= (and mapNonEmpty!38420 ((_ is ValueCellFull!11594) mapValue!38420)) b!1036805))

(assert (= (and mapNonEmpty!38419 ((_ is ValueCellFull!11594) mapDefault!38420)) b!1036806))

(declare-fun m!956729 () Bool)

(assert (=> mapNonEmpty!38420 m!956729))

(declare-fun b_lambda!16125 () Bool)

(assert (= b_lambda!16117 (or (and b!1035733 b_free!20875) b_lambda!16125)))

(declare-fun b_lambda!16127 () Bool)

(assert (= b_lambda!16103 (or (and b!1035733 b_free!20875 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 lt!456581))) b_lambda!16127)))

(declare-fun b_lambda!16129 () Bool)

(assert (= b_lambda!16113 (or (and b!1035733 b_free!20875) b_lambda!16129)))

(declare-fun b_lambda!16131 () Bool)

(assert (= b_lambda!16115 (or (and b!1035733 b_free!20875) b_lambda!16131)))

(declare-fun b_lambda!16133 () Bool)

(assert (= b_lambda!16119 (or (and b!1035733 b_free!20875) b_lambda!16133)))

(check-sat (not b!1036370) (not b_lambda!16125) (not d!124631) (not b!1036271) (not b!1036418) (not b!1036786) (not d!124879) (not d!124793) (not d!124771) (not b!1036710) (not d!124863) (not d!124835) (not d!124825) (not b!1036517) (not b!1036780) (not b!1036297) (not b!1036583) (not b_lambda!16123) (not d!124679) (not b!1036433) (not b!1036515) (not b!1036693) (not d!124643) (not b!1036378) (not b!1036782) (not b!1036356) (not b!1036339) (not b!1036792) (not b!1036758) (not b!1036535) (not b!1036288) (not b!1036627) (not b!1036487) (not d!124841) (not b!1036229) (not b!1036310) (not b!1036733) (not b!1036399) (not d!124963) (not d!124941) (not d!124719) (not b!1036440) (not d!124837) (not d!124585) (not b!1036718) (not d!124571) (not b!1036220) (not b!1036435) (not b!1036604) (not d!124721) (not d!124743) (not b!1036744) (not d!124777) (not b!1036389) (not d!124713) (not d!124885) (not b!1036184) (not b!1036590) (not b!1036293) (not d!124593) (not b!1036208) (not b!1036371) (not d!124583) (not d!124955) (not b!1036327) (not b!1036471) (not b!1036352) (not d!124581) (not d!124617) (not b!1036641) (not b!1036656) (not b!1036541) (not bm!43854) (not b!1036142) (not d!124759) (not b!1036564) (not d!124697) (not b!1036317) (not b!1036652) (not d!124727) (not d!124669) (not d!124707) (not d!124989) (not b!1036677) (not d!124591) (not b!1036671) (not b!1036648) (not d!124625) (not b!1036322) (not b!1036606) (not d!124693) (not b!1036580) (not b!1036708) (not b!1036415) (not d!124569) (not bm!43833) (not bm!43836) (not b!1036473) (not d!124815) (not b!1036742) (not b!1036189) (not b!1036329) (not b!1036690) (not b!1036362) (not b!1036775) (not d!124987) (not b!1036218) (not b!1036618) (not b!1036663) (not b!1036397) (not b!1036695) (not d!124565) (not b!1036313) (not d!124655) (not d!124635) (not b!1036368) (not b!1036625) (not d!124811) (not b!1036685) (not d!124687) (not d!124747) (not b!1036735) (not d!124597) (not b!1036582) (not b!1036730) (not b!1036704) (not b!1036451) (not b!1036482) (not b!1036755) (not b!1036518) (not b!1036261) (not b!1036338) (not b!1036700) (not d!124659) (not d!124621) (not b!1036716) (not b!1036392) (not b!1036526) (not b!1036188) (not b!1036632) (not b!1036307) (not b!1036443) (not b!1036166) b_and!33385 (not b!1036497) (not b!1036283) (not b!1036556) (not b_lambda!16085) (not bm!43848) (not b!1036490) (not d!124809) (not b!1036568) (not b!1036676) (not b!1036552) (not d!124999) (not b!1036264) (not b!1036391) (not d!124599) (not b!1036259) (not b!1036722) (not b!1036777) (not d!124575) (not b!1036280) (not mapNonEmpty!38420) (not b!1036571) (not d!124613) (not b!1036765) (not d!125001) (not d!124821) (not d!124717) (not b!1036745) (not b!1036178) (not d!124937) (not b!1036478) (not d!124749) (not b!1036386) (not b!1036772) (not d!125023) (not b!1036668) (not b!1036630) (not b!1036653) (not bm!43868) (not d!124831) (not d!124871) (not d!124833) (not b!1036330) (not b!1036446) (not d!124951) (not b!1036209) (not d!124753) (not b!1036427) (not b!1036681) (not b!1036697) (not b!1036492) (not b!1036512) (not b!1036369) (not b_lambda!16093) (not bm!43867) (not b!1036728) (not d!124823) (not d!124875) (not b_lambda!16107) (not b!1036253) (not b!1036739) (not b!1036187) (not bm!43863) (not b!1036636) (not d!124641) (not bm!43842) (not b!1036748) (not d!124873) (not d!124769) (not b!1036521) (not b!1036615) (not b!1036462) (not d!124819) (not b!1036390) (not b!1036791) (not bm!43857) (not b!1036501) (not d!124737) (not d!124735) (not b!1036578) (not d!124993) (not d!124807) (not d!124947) (not b_lambda!16129) (not d!124675) (not b!1036268) (not b!1036360) (not b!1036186) (not b!1036437) (not b!1036191) (not d!124997) (not d!124957) (not b!1036599) (not b!1036774) (not b!1036645) (not b!1036374) (not b!1036585) (not b!1036506) (not d!124965) (not b!1036562) (not d!124755) (not b!1036767) (not b!1036624) (not d!124855) (not d!124881) (not b!1036455) (not b!1036802) (not b!1036602) (not b!1036531) (not b!1036274) (not b!1036740) (not b!1036375) (not b!1036476) (not d!124969) (not b!1036622) (not d!124701) (not d!125025) (not b_lambda!16105) (not b!1036529) (not b!1036156) (not b!1036737) (not b_lambda!16131) (not b!1036642) (not d!124705) (not d!124685) (not b!1036296) (not d!124595) (not b!1036171) (not b!1036687) (not b!1036385) (not b!1036215) (not b!1036350) (not b!1036655) (not b!1036442) (not b!1036452) (not b!1036751) (not b!1036674) (not b!1036764) (not b!1036319) (not b!1036341) (not b!1036520) (not b!1036796) (not b!1036407) (not b!1036550) (not d!124695) (not b!1036289) (not d!125011) (not d!124589) (not d!124973) (not b!1036650) (not b!1036299) (not b_next!20875) (not d!124805) (not d!124975) (not b!1036217) (not b!1036566) (not b!1036553) (not b!1036135) (not d!124953) (not d!124633) (not d!124909) (not b!1036498) (not d!124779) (not b!1036524) (not b!1036196) (not d!124949) (not bm!43865) (not d!124729) (not b!1036279) (not b!1036523) (not d!124751) (not b!1036348) (not b!1036682) (not b!1036569) (not d!124983) (not b!1036333) (not b!1036743) (not b!1036464) (not d!124967) (not b!1036175) (not b!1036488) (not b!1036719) (not d!124763) (not b!1036426) (not b!1036756) (not b!1036763) (not d!124943) (not b!1036804) (not d!124801) (not b!1036404) (not b!1036586) (not b!1036272) (not b_lambda!16127) (not b!1036651) (not d!124691) (not b!1036783) (not b!1036167) (not d!124853) (not b!1036428) (not b!1036769) (not b!1036258) (not b!1036382) (not d!125013) (not b!1036507) (not d!124959) (not d!124791) (not b!1036458) (not b!1036321) (not b!1036581) (not b!1036223) (not b!1036771) (not bm!43840) (not b!1036394) (not b!1036644) (not b!1036545) (not b!1036731) (not d!124603) (not b!1036324) (not d!124935) (not b_lambda!16111) (not b!1036561) (not b_lambda!16109) (not b!1036365) (not b!1036510) (not d!124605) (not b!1036711) (not d!124781) (not b!1036401) (not bm!43872) (not bm!43844) (not b!1036760) (not bm!43846) (not b!1036277) (not b!1036727) (not b!1036612) (not b!1036683) (not d!124661) (not b!1036387) (not b!1036367) (not d!124789) (not bm!43870) (not d!124859) (not d!124611) (not b!1036410) (not b!1036416) (not d!124673) (not d!124813) (not d!124861) (not d!125007) (not b!1036304) (not b_lambda!16133) (not b!1036479) (not b!1036364) (not d!124961) (not b!1036544) (not b!1036198) (not b!1036540) (not bm!43860) (not d!124767) (not b!1036665) tp_is_empty!24595 (not d!124629) (not b!1036754) (not b_lambda!16091) (not b!1036181) (not b!1036466) (not b!1036201) (not b!1036800) (not b!1036596) (not bm!43873) (not b!1036230) (not d!124785) (not b!1036173) (not b!1036168) (not bm!43862) (not d!124733) (not b!1036587) (not b!1036420) (not bm!43875) (not b!1036657) (not b!1036593) (not d!124797) (not b!1036301) (not b!1036406) (not d!124723) (not d!124971) (not b!1036633) (not b!1036469) (not b!1036600) (not d!124889) (not d!124921) (not b!1036384) (not b!1036574) (not bm!43851) (not b!1036532) (not d!124799) (not b!1036747) (not b!1036212) (not b!1036713) (not b!1036344) (not d!124919) (not b!1036547) (not bm!43838) (not b!1036197) (not d!124741) (not d!124829) (not b!1036495) (not b_lambda!16121))
(check-sat b_and!33385 (not b_next!20875))
