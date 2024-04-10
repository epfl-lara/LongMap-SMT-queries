; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13826 () Bool)

(assert start!13826)

(declare-fun b!127647 () Bool)

(declare-fun b_free!2873 () Bool)

(declare-fun b_next!2873 () Bool)

(assert (=> b!127647 (= b_free!2873 (not b_next!2873))))

(declare-fun tp!11036 () Bool)

(declare-fun b_and!7883 () Bool)

(assert (=> b!127647 (= tp!11036 b_and!7883)))

(declare-fun b!127644 () Bool)

(declare-fun b_free!2875 () Bool)

(declare-fun b_next!2875 () Bool)

(assert (=> b!127644 (= b_free!2875 (not b_next!2875))))

(declare-fun tp!11035 () Bool)

(declare-fun b_and!7885 () Bool)

(assert (=> b!127644 (= tp!11035 b_and!7885)))

(declare-fun mapIsEmpty!4543 () Bool)

(declare-fun mapRes!4543 () Bool)

(assert (=> mapIsEmpty!4543 mapRes!4543))

(declare-fun tp_is_empty!2853 () Bool)

(declare-fun e!83376 () Bool)

(declare-datatypes ((V!3451 0))(
  ( (V!3452 (val!1471 Int)) )
))
(declare-datatypes ((array!4725 0))(
  ( (array!4726 (arr!2237 (Array (_ BitVec 32) (_ BitVec 64))) (size!2502 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1083 0))(
  ( (ValueCellFull!1083 (v!3145 V!3451)) (EmptyCell!1083) )
))
(declare-datatypes ((array!4727 0))(
  ( (array!4728 (arr!2238 (Array (_ BitVec 32) ValueCell!1083)) (size!2503 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1074 0))(
  ( (LongMapFixedSize!1075 (defaultEntry!2805 Int) (mask!7073 (_ BitVec 32)) (extraKeys!2582 (_ BitVec 32)) (zeroValue!2666 V!3451) (minValue!2666 V!3451) (_size!586 (_ BitVec 32)) (_keys!4542 array!4725) (_values!2788 array!4727) (_vacant!586 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1074)

(declare-fun e!83388 () Bool)

(declare-fun array_inv!1407 (array!4725) Bool)

(declare-fun array_inv!1408 (array!4727) Bool)

(assert (=> b!127644 (= e!83376 (and tp!11035 tp_is_empty!2853 (array_inv!1407 (_keys!4542 newMap!16)) (array_inv!1408 (_values!2788 newMap!16)) e!83388))))

(declare-fun mapNonEmpty!4543 () Bool)

(declare-fun tp!11033 () Bool)

(declare-fun e!83381 () Bool)

(assert (=> mapNonEmpty!4543 (= mapRes!4543 (and tp!11033 e!83381))))

(declare-fun mapRest!4543 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapKey!4544 () (_ BitVec 32))

(declare-fun mapValue!4544 () ValueCell!1083)

(assert (=> mapNonEmpty!4543 (= (arr!2238 (_values!2788 newMap!16)) (store mapRest!4543 mapKey!4544 mapValue!4544))))

(declare-fun b!127645 () Bool)

(declare-fun e!83379 () Bool)

(declare-datatypes ((Cell!868 0))(
  ( (Cell!869 (v!3146 LongMapFixedSize!1074)) )
))
(declare-datatypes ((LongMap!868 0))(
  ( (LongMap!869 (underlying!445 Cell!868)) )
))
(declare-fun thiss!992 () LongMap!868)

(assert (=> b!127645 (= e!83379 (and (= (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7073 (v!3146 (underlying!445 thiss!992))))) (= (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992))))) (bvsge (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!127646 () Bool)

(declare-fun res!61696 () Bool)

(declare-fun e!83383 () Bool)

(assert (=> b!127646 (=> (not res!61696) (not e!83383))))

(declare-fun valid!512 (LongMapFixedSize!1074) Bool)

(assert (=> b!127646 (= res!61696 (valid!512 newMap!16))))

(declare-fun e!83377 () Bool)

(declare-fun e!83380 () Bool)

(assert (=> b!127647 (= e!83380 (and tp!11036 tp_is_empty!2853 (array_inv!1407 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (array_inv!1408 (_values!2788 (v!3146 (underlying!445 thiss!992)))) e!83377))))

(declare-fun b!127648 () Bool)

(declare-fun res!61699 () Bool)

(assert (=> b!127648 (=> (not res!61699) (not e!83379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127648 (= res!61699 (validMask!0 (mask!7073 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!127649 () Bool)

(declare-fun e!83375 () Bool)

(assert (=> b!127649 (= e!83375 tp_is_empty!2853)))

(declare-fun res!61695 () Bool)

(assert (=> start!13826 (=> (not res!61695) (not e!83383))))

(declare-fun valid!513 (LongMap!868) Bool)

(assert (=> start!13826 (= res!61695 (valid!513 thiss!992))))

(assert (=> start!13826 e!83383))

(declare-fun e!83386 () Bool)

(assert (=> start!13826 e!83386))

(assert (=> start!13826 true))

(assert (=> start!13826 e!83376))

(declare-fun mapIsEmpty!4544 () Bool)

(declare-fun mapRes!4544 () Bool)

(assert (=> mapIsEmpty!4544 mapRes!4544))

(declare-fun b!127650 () Bool)

(declare-fun e!83378 () Bool)

(assert (=> b!127650 (= e!83378 e!83379)))

(declare-fun res!61694 () Bool)

(assert (=> b!127650 (=> (not res!61694) (not e!83379))))

(declare-datatypes ((tuple2!2596 0))(
  ( (tuple2!2597 (_1!1309 (_ BitVec 64)) (_2!1309 V!3451)) )
))
(declare-datatypes ((List!1704 0))(
  ( (Nil!1701) (Cons!1700 (h!2303 tuple2!2596) (t!6083 List!1704)) )
))
(declare-datatypes ((ListLongMap!1691 0))(
  ( (ListLongMap!1692 (toList!861 List!1704)) )
))
(declare-fun lt!65992 () ListLongMap!1691)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!884 (ListLongMap!1691 (_ BitVec 64)) Bool)

(assert (=> b!127650 (= res!61694 (contains!884 lt!65992 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2598 0))(
  ( (tuple2!2599 (_1!1310 Bool) (_2!1310 LongMapFixedSize!1074)) )
))
(declare-fun lt!65990 () tuple2!2598)

(declare-fun update!187 (LongMapFixedSize!1074 (_ BitVec 64) V!3451) tuple2!2598)

(declare-fun get!1455 (ValueCell!1083 V!3451) V!3451)

(declare-fun dynLambda!418 (Int (_ BitVec 64)) V!3451)

(assert (=> b!127650 (= lt!65990 (update!187 newMap!16 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127651 () Bool)

(declare-fun e!83384 () Bool)

(assert (=> b!127651 (= e!83386 e!83384)))

(declare-fun b!127652 () Bool)

(declare-fun e!83374 () Bool)

(assert (=> b!127652 (= e!83377 (and e!83374 mapRes!4544))))

(declare-fun condMapEmpty!4544 () Bool)

(declare-fun mapDefault!4543 () ValueCell!1083)

(assert (=> b!127652 (= condMapEmpty!4544 (= (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4543)))))

(declare-fun b!127653 () Bool)

(declare-fun res!61697 () Bool)

(assert (=> b!127653 (=> (not res!61697) (not e!83383))))

(assert (=> b!127653 (= res!61697 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!127654 () Bool)

(assert (=> b!127654 (= e!83388 (and e!83375 mapRes!4543))))

(declare-fun condMapEmpty!4543 () Bool)

(declare-fun mapDefault!4544 () ValueCell!1083)

(assert (=> b!127654 (= condMapEmpty!4543 (= (arr!2238 (_values!2788 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4544)))))

(declare-fun b!127655 () Bool)

(assert (=> b!127655 (= e!83381 tp_is_empty!2853)))

(declare-fun b!127656 () Bool)

(assert (=> b!127656 (= e!83374 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4544 () Bool)

(declare-fun tp!11034 () Bool)

(declare-fun e!83387 () Bool)

(assert (=> mapNonEmpty!4544 (= mapRes!4544 (and tp!11034 e!83387))))

(declare-fun mapRest!4544 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapValue!4543 () ValueCell!1083)

(declare-fun mapKey!4543 () (_ BitVec 32))

(assert (=> mapNonEmpty!4544 (= (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (store mapRest!4544 mapKey!4543 mapValue!4543))))

(declare-fun b!127657 () Bool)

(assert (=> b!127657 (= e!83383 e!83378)))

(declare-fun res!61698 () Bool)

(assert (=> b!127657 (=> (not res!61698) (not e!83378))))

(declare-fun lt!65991 () ListLongMap!1691)

(assert (=> b!127657 (= res!61698 (and (= lt!65991 lt!65992) (not (= (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1394 (LongMapFixedSize!1074) ListLongMap!1691)

(assert (=> b!127657 (= lt!65992 (map!1394 newMap!16))))

(declare-fun getCurrentListMap!539 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) Int) ListLongMap!1691)

(assert (=> b!127657 (= lt!65991 (getCurrentListMap!539 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!127658 () Bool)

(declare-fun res!61700 () Bool)

(assert (=> b!127658 (=> (not res!61700) (not e!83383))))

(assert (=> b!127658 (= res!61700 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7073 newMap!16)) (_size!586 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!127659 () Bool)

(assert (=> b!127659 (= e!83384 e!83380)))

(declare-fun b!127660 () Bool)

(assert (=> b!127660 (= e!83387 tp_is_empty!2853)))

(assert (= (and start!13826 res!61695) b!127653))

(assert (= (and b!127653 res!61697) b!127646))

(assert (= (and b!127646 res!61696) b!127658))

(assert (= (and b!127658 res!61700) b!127657))

(assert (= (and b!127657 res!61698) b!127650))

(assert (= (and b!127650 res!61694) b!127648))

(assert (= (and b!127648 res!61699) b!127645))

(assert (= (and b!127652 condMapEmpty!4544) mapIsEmpty!4544))

(assert (= (and b!127652 (not condMapEmpty!4544)) mapNonEmpty!4544))

(get-info :version)

(assert (= (and mapNonEmpty!4544 ((_ is ValueCellFull!1083) mapValue!4543)) b!127660))

(assert (= (and b!127652 ((_ is ValueCellFull!1083) mapDefault!4543)) b!127656))

(assert (= b!127647 b!127652))

(assert (= b!127659 b!127647))

(assert (= b!127651 b!127659))

(assert (= start!13826 b!127651))

(assert (= (and b!127654 condMapEmpty!4543) mapIsEmpty!4543))

(assert (= (and b!127654 (not condMapEmpty!4543)) mapNonEmpty!4543))

(assert (= (and mapNonEmpty!4543 ((_ is ValueCellFull!1083) mapValue!4544)) b!127655))

(assert (= (and b!127654 ((_ is ValueCellFull!1083) mapDefault!4544)) b!127649))

(assert (= b!127644 b!127654))

(assert (= start!13826 b!127644))

(declare-fun b_lambda!5645 () Bool)

(assert (=> (not b_lambda!5645) (not b!127650)))

(declare-fun t!6080 () Bool)

(declare-fun tb!2341 () Bool)

(assert (=> (and b!127647 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))) t!6080) tb!2341))

(declare-fun result!3879 () Bool)

(assert (=> tb!2341 (= result!3879 tp_is_empty!2853)))

(assert (=> b!127650 t!6080))

(declare-fun b_and!7887 () Bool)

(assert (= b_and!7883 (and (=> t!6080 result!3879) b_and!7887)))

(declare-fun tb!2343 () Bool)

(declare-fun t!6082 () Bool)

(assert (=> (and b!127644 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))) t!6082) tb!2343))

(declare-fun result!3883 () Bool)

(assert (= result!3883 result!3879))

(assert (=> b!127650 t!6082))

(declare-fun b_and!7889 () Bool)

(assert (= b_and!7885 (and (=> t!6082 result!3883) b_and!7889)))

(declare-fun m!149339 () Bool)

(assert (=> b!127648 m!149339))

(declare-fun m!149341 () Bool)

(assert (=> b!127646 m!149341))

(declare-fun m!149343 () Bool)

(assert (=> start!13826 m!149343))

(declare-fun m!149345 () Bool)

(assert (=> b!127647 m!149345))

(declare-fun m!149347 () Bool)

(assert (=> b!127647 m!149347))

(declare-fun m!149349 () Bool)

(assert (=> b!127650 m!149349))

(declare-fun m!149351 () Bool)

(assert (=> b!127650 m!149351))

(declare-fun m!149353 () Bool)

(assert (=> b!127650 m!149353))

(declare-fun m!149355 () Bool)

(assert (=> b!127650 m!149355))

(assert (=> b!127650 m!149351))

(assert (=> b!127650 m!149355))

(declare-fun m!149357 () Bool)

(assert (=> b!127650 m!149357))

(assert (=> b!127650 m!149355))

(assert (=> b!127650 m!149353))

(declare-fun m!149359 () Bool)

(assert (=> b!127650 m!149359))

(assert (=> b!127650 m!149349))

(declare-fun m!149361 () Bool)

(assert (=> mapNonEmpty!4543 m!149361))

(declare-fun m!149363 () Bool)

(assert (=> mapNonEmpty!4544 m!149363))

(assert (=> b!127657 m!149355))

(declare-fun m!149365 () Bool)

(assert (=> b!127657 m!149365))

(declare-fun m!149367 () Bool)

(assert (=> b!127657 m!149367))

(declare-fun m!149369 () Bool)

(assert (=> b!127644 m!149369))

(declare-fun m!149371 () Bool)

(assert (=> b!127644 m!149371))

(check-sat (not mapNonEmpty!4543) tp_is_empty!2853 (not mapNonEmpty!4544) (not start!13826) b_and!7887 (not b!127657) (not b_next!2873) (not b!127647) (not b_next!2875) (not b!127646) (not b!127644) b_and!7889 (not b_lambda!5645) (not b!127648) (not b!127650))
(check-sat b_and!7887 b_and!7889 (not b_next!2873) (not b_next!2875))
(get-model)

(declare-fun b_lambda!5649 () Bool)

(assert (= b_lambda!5645 (or (and b!127647 b_free!2873) (and b!127644 b_free!2875 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))) b_lambda!5649)))

(check-sat (not mapNonEmpty!4543) tp_is_empty!2853 (not mapNonEmpty!4544) (not start!13826) (not b!127657) b_and!7889 (not b_next!2873) (not b!127647) (not b_next!2875) (not b!127646) (not b!127644) b_and!7887 (not b_lambda!5649) (not b!127648) (not b!127650))
(check-sat b_and!7887 b_and!7889 (not b_next!2873) (not b_next!2875))
(get-model)

(declare-fun d!38571 () Bool)

(declare-fun res!61728 () Bool)

(declare-fun e!83436 () Bool)

(assert (=> d!38571 (=> (not res!61728) (not e!83436))))

(declare-fun simpleValid!88 (LongMapFixedSize!1074) Bool)

(assert (=> d!38571 (= res!61728 (simpleValid!88 newMap!16))))

(assert (=> d!38571 (= (valid!512 newMap!16) e!83436)))

(declare-fun b!127722 () Bool)

(declare-fun res!61729 () Bool)

(assert (=> b!127722 (=> (not res!61729) (not e!83436))))

(declare-fun arrayCountValidKeys!0 (array!4725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!127722 (= res!61729 (= (arrayCountValidKeys!0 (_keys!4542 newMap!16) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (_size!586 newMap!16)))))

(declare-fun b!127723 () Bool)

(declare-fun res!61730 () Bool)

(assert (=> b!127723 (=> (not res!61730) (not e!83436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4725 (_ BitVec 32)) Bool)

(assert (=> b!127723 (= res!61730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!127724 () Bool)

(declare-datatypes ((List!1706 0))(
  ( (Nil!1703) (Cons!1702 (h!2305 (_ BitVec 64)) (t!6089 List!1706)) )
))
(declare-fun arrayNoDuplicates!0 (array!4725 (_ BitVec 32) List!1706) Bool)

(assert (=> b!127724 (= e!83436 (arrayNoDuplicates!0 (_keys!4542 newMap!16) #b00000000000000000000000000000000 Nil!1703))))

(assert (= (and d!38571 res!61728) b!127722))

(assert (= (and b!127722 res!61729) b!127723))

(assert (= (and b!127723 res!61730) b!127724))

(declare-fun m!149407 () Bool)

(assert (=> d!38571 m!149407))

(declare-fun m!149409 () Bool)

(assert (=> b!127722 m!149409))

(declare-fun m!149411 () Bool)

(assert (=> b!127723 m!149411))

(declare-fun m!149413 () Bool)

(assert (=> b!127724 m!149413))

(assert (=> b!127646 d!38571))

(declare-fun d!38573 () Bool)

(declare-fun e!83442 () Bool)

(assert (=> d!38573 e!83442))

(declare-fun res!61733 () Bool)

(assert (=> d!38573 (=> res!61733 e!83442)))

(declare-fun lt!66010 () Bool)

(assert (=> d!38573 (= res!61733 (not lt!66010))))

(declare-fun lt!66013 () Bool)

(assert (=> d!38573 (= lt!66010 lt!66013)))

(declare-datatypes ((Unit!3981 0))(
  ( (Unit!3982) )
))
(declare-fun lt!66012 () Unit!3981)

(declare-fun e!83441 () Unit!3981)

(assert (=> d!38573 (= lt!66012 e!83441)))

(declare-fun c!23359 () Bool)

(assert (=> d!38573 (= c!23359 lt!66013)))

(declare-fun containsKey!172 (List!1704 (_ BitVec 64)) Bool)

(assert (=> d!38573 (= lt!66013 (containsKey!172 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38573 (= (contains!884 lt!65992 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66010)))

(declare-fun b!127731 () Bool)

(declare-fun lt!66011 () Unit!3981)

(assert (=> b!127731 (= e!83441 lt!66011)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!120 (List!1704 (_ BitVec 64)) Unit!3981)

(assert (=> b!127731 (= lt!66011 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-datatypes ((Option!174 0))(
  ( (Some!173 (v!3150 V!3451)) (None!172) )
))
(declare-fun isDefined!121 (Option!174) Bool)

(declare-fun getValueByKey!168 (List!1704 (_ BitVec 64)) Option!174)

(assert (=> b!127731 (isDefined!121 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!127732 () Bool)

(declare-fun Unit!3983 () Unit!3981)

(assert (=> b!127732 (= e!83441 Unit!3983)))

(declare-fun b!127733 () Bool)

(assert (=> b!127733 (= e!83442 (isDefined!121 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!38573 c!23359) b!127731))

(assert (= (and d!38573 (not c!23359)) b!127732))

(assert (= (and d!38573 (not res!61733)) b!127733))

(assert (=> d!38573 m!149355))

(declare-fun m!149415 () Bool)

(assert (=> d!38573 m!149415))

(assert (=> b!127731 m!149355))

(declare-fun m!149417 () Bool)

(assert (=> b!127731 m!149417))

(assert (=> b!127731 m!149355))

(declare-fun m!149419 () Bool)

(assert (=> b!127731 m!149419))

(assert (=> b!127731 m!149419))

(declare-fun m!149421 () Bool)

(assert (=> b!127731 m!149421))

(assert (=> b!127733 m!149355))

(assert (=> b!127733 m!149419))

(assert (=> b!127733 m!149419))

(assert (=> b!127733 m!149421))

(assert (=> b!127650 d!38573))

(declare-fun b!127818 () Bool)

(declare-datatypes ((SeekEntryResult!271 0))(
  ( (MissingZero!271 (index!3240 (_ BitVec 32))) (Found!271 (index!3241 (_ BitVec 32))) (Intermediate!271 (undefined!1083 Bool) (index!3242 (_ BitVec 32)) (x!15122 (_ BitVec 32))) (Undefined!271) (MissingVacant!271 (index!3243 (_ BitVec 32))) )
))
(declare-fun lt!66068 () SeekEntryResult!271)

(declare-fun e!83488 () Bool)

(assert (=> b!127818 (= e!83488 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66068)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!127819 () Bool)

(declare-fun e!83492 () Bool)

(declare-fun call!13790 () ListLongMap!1691)

(declare-fun call!13810 () ListLongMap!1691)

(assert (=> b!127819 (= e!83492 (= call!13790 call!13810))))

(declare-fun b!127820 () Bool)

(declare-fun res!61768 () Bool)

(declare-fun call!13796 () Bool)

(assert (=> b!127820 (= res!61768 call!13796)))

(declare-fun e!83504 () Bool)

(assert (=> b!127820 (=> (not res!61768) (not e!83504))))

(declare-fun b!127821 () Bool)

(declare-fun res!61774 () Bool)

(declare-fun e!83503 () Bool)

(assert (=> b!127821 (=> (not res!61774) (not e!83503))))

(declare-fun lt!66077 () SeekEntryResult!271)

(assert (=> b!127821 (= res!61774 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127822 () Bool)

(declare-fun call!13808 () Bool)

(assert (=> b!127822 (= e!83503 (not call!13808))))

(declare-fun b!127823 () Bool)

(declare-fun lt!66080 () Unit!3981)

(declare-fun e!83498 () Unit!3981)

(assert (=> b!127823 (= lt!66080 e!83498)))

(declare-fun c!23400 () Bool)

(declare-fun call!13793 () Bool)

(assert (=> b!127823 (= c!23400 call!13793)))

(declare-fun e!83497 () tuple2!2598)

(assert (=> b!127823 (= e!83497 (tuple2!2599 false newMap!16))))

(declare-fun bm!13785 () Bool)

(declare-fun call!13807 () SeekEntryResult!271)

(declare-fun call!13789 () SeekEntryResult!271)

(assert (=> bm!13785 (= call!13807 call!13789)))

(declare-fun b!127824 () Bool)

(declare-fun e!83495 () tuple2!2598)

(declare-fun lt!66082 () tuple2!2598)

(assert (=> b!127824 (= e!83495 (tuple2!2599 (_1!1310 lt!66082) (_2!1310 lt!66082)))))

(declare-fun call!13794 () tuple2!2598)

(assert (=> b!127824 (= lt!66082 call!13794)))

(declare-fun d!38575 () Bool)

(declare-fun e!83491 () Bool)

(assert (=> d!38575 e!83491))

(declare-fun res!61771 () Bool)

(assert (=> d!38575 (=> (not res!61771) (not e!83491))))

(declare-fun lt!66078 () tuple2!2598)

(assert (=> d!38575 (= res!61771 (valid!512 (_2!1310 lt!66078)))))

(declare-fun e!83501 () tuple2!2598)

(assert (=> d!38575 (= lt!66078 e!83501)))

(declare-fun c!23392 () Bool)

(assert (=> d!38575 (= c!23392 (= (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvneg (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!38575 (valid!512 newMap!16)))

(assert (=> d!38575 (= (update!187 newMap!16 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!66078)))

(declare-fun b!127825 () Bool)

(declare-fun e!83496 () Unit!3981)

(declare-fun lt!66070 () Unit!3981)

(assert (=> b!127825 (= e!83496 lt!66070)))

(declare-fun call!13800 () Unit!3981)

(assert (=> b!127825 (= lt!66070 call!13800)))

(declare-fun lt!66075 () SeekEntryResult!271)

(declare-fun call!13799 () SeekEntryResult!271)

(assert (=> b!127825 (= lt!66075 call!13799)))

(declare-fun res!61775 () Bool)

(assert (=> b!127825 (= res!61775 ((_ is Found!271) lt!66075))))

(assert (=> b!127825 (=> (not res!61775) (not e!83504))))

(assert (=> b!127825 e!83504))

(declare-fun bm!13786 () Bool)

(assert (=> bm!13786 (= call!13810 (map!1394 newMap!16))))

(declare-fun b!127826 () Bool)

(declare-fun res!61765 () Bool)

(declare-fun lt!66088 () SeekEntryResult!271)

(assert (=> b!127826 (= res!61765 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83490 () Bool)

(assert (=> b!127826 (=> (not res!61765) (not e!83490))))

(declare-fun bm!13787 () Bool)

(declare-fun call!13798 () Bool)

(declare-fun call!13801 () Bool)

(assert (=> bm!13787 (= call!13798 call!13801)))

(declare-fun b!127827 () Bool)

(declare-fun e!83502 () Bool)

(declare-fun +!171 (ListLongMap!1691 tuple2!2596) ListLongMap!1691)

(assert (=> b!127827 (= e!83502 (= call!13790 (+!171 call!13810 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127828 () Bool)

(declare-fun e!83487 () ListLongMap!1691)

(declare-fun call!13805 () ListLongMap!1691)

(assert (=> b!127828 (= e!83487 call!13805)))

(declare-fun bm!13788 () Bool)

(assert (=> bm!13788 (= call!13799 call!13789)))

(declare-fun b!127829 () Bool)

(declare-fun e!83499 () ListLongMap!1691)

(declare-fun call!13795 () ListLongMap!1691)

(assert (=> b!127829 (= e!83499 call!13795)))

(declare-fun bm!13789 () Bool)

(assert (=> bm!13789 (= call!13808 call!13801)))

(declare-fun call!13792 () ListLongMap!1691)

(declare-fun c!23389 () Bool)

(declare-fun lt!66094 () array!4727)

(declare-fun bm!13790 () Bool)

(assert (=> bm!13790 (= call!13792 (getCurrentListMap!539 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun bm!13791 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4725 (_ BitVec 32)) SeekEntryResult!271)

(assert (=> bm!13791 (= call!13789 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun call!13791 () Unit!3981)

(declare-fun bm!13792 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 64) Int) Unit!3981)

(assert (=> bm!13792 (= call!13791 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)))))

(declare-fun b!127830 () Bool)

(declare-fun c!23398 () Bool)

(assert (=> b!127830 (= c!23398 ((_ is MissingVacant!271) lt!66088))))

(declare-fun e!83505 () Bool)

(declare-fun e!83493 () Bool)

(assert (=> b!127830 (= e!83505 e!83493)))

(declare-fun b!127831 () Bool)

(declare-fun Unit!3984 () Unit!3981)

(assert (=> b!127831 (= e!83498 Unit!3984)))

(declare-fun lt!66073 () Unit!3981)

(assert (=> b!127831 (= lt!66073 call!13800)))

(assert (=> b!127831 (= lt!66068 call!13807)))

(declare-fun res!61766 () Bool)

(assert (=> b!127831 (= res!61766 ((_ is Found!271) lt!66068))))

(assert (=> b!127831 (=> (not res!61766) (not e!83488))))

(assert (=> b!127831 e!83488))

(declare-fun lt!66086 () Unit!3981)

(assert (=> b!127831 (= lt!66086 lt!66073)))

(assert (=> b!127831 false))

(declare-fun bm!13793 () Bool)

(declare-fun c!23393 () Bool)

(assert (=> bm!13793 (= c!23393 c!23389)))

(assert (=> bm!13793 (= call!13793 (contains!884 e!83487 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!127832 () Bool)

(assert (=> b!127832 (= e!83493 e!83490)))

(declare-fun res!61767 () Bool)

(declare-fun call!13803 () Bool)

(assert (=> b!127832 (= res!61767 call!13803)))

(assert (=> b!127832 (=> (not res!61767) (not e!83490))))

(declare-fun b!127833 () Bool)

(declare-fun e!83489 () Bool)

(declare-fun e!83494 () Bool)

(assert (=> b!127833 (= e!83489 e!83494)))

(declare-fun res!61772 () Bool)

(declare-fun call!13788 () Bool)

(assert (=> b!127833 (= res!61772 call!13788)))

(assert (=> b!127833 (=> (not res!61772) (not e!83494))))

(declare-fun b!127834 () Bool)

(declare-fun lt!66093 () tuple2!2598)

(assert (=> b!127834 (= lt!66093 call!13794)))

(declare-fun e!83506 () tuple2!2598)

(assert (=> b!127834 (= e!83506 (tuple2!2599 (_1!1310 lt!66093) (_2!1310 lt!66093)))))

(declare-fun bm!13794 () Bool)

(declare-fun call!13797 () ListLongMap!1691)

(declare-fun call!13806 () ListLongMap!1691)

(assert (=> bm!13794 (= call!13797 call!13806)))

(declare-fun b!127835 () Bool)

(assert (=> b!127835 (= e!83491 e!83492)))

(declare-fun c!23388 () Bool)

(assert (=> b!127835 (= c!23388 (_1!1310 lt!66078))))

(declare-fun b!127836 () Bool)

(assert (=> b!127836 (= e!83495 e!83506)))

(declare-fun c!23391 () Bool)

(declare-fun lt!66072 () SeekEntryResult!271)

(assert (=> b!127836 (= c!23391 ((_ is MissingZero!271) lt!66072))))

(declare-fun b!127837 () Bool)

(declare-fun res!61769 () Bool)

(assert (=> b!127837 (=> (not res!61769) (not e!83503))))

(assert (=> b!127837 (= res!61769 call!13788)))

(declare-fun e!83500 () Bool)

(assert (=> b!127837 (= e!83500 e!83503)))

(declare-fun bm!13795 () Bool)

(declare-fun call!13804 () Bool)

(assert (=> bm!13795 (= call!13803 call!13804)))

(declare-fun b!127838 () Bool)

(declare-fun lt!66074 () Unit!3981)

(assert (=> b!127838 (= e!83498 lt!66074)))

(assert (=> b!127838 (= lt!66074 call!13791)))

(assert (=> b!127838 (= lt!66088 call!13807)))

(declare-fun c!23395 () Bool)

(assert (=> b!127838 (= c!23395 ((_ is MissingZero!271) lt!66088))))

(assert (=> b!127838 e!83505))

(declare-fun b!127839 () Bool)

(assert (=> b!127839 (= e!83490 (not call!13798))))

(declare-fun bm!13796 () Bool)

(assert (=> bm!13796 (= call!13790 (map!1394 (_2!1310 lt!66078)))))

(declare-fun b!127840 () Bool)

(assert (=> b!127840 (= e!83494 (not call!13808))))

(declare-fun b!127841 () Bool)

(declare-fun c!23401 () Bool)

(assert (=> b!127841 (= c!23401 ((_ is MissingVacant!271) lt!66072))))

(assert (=> b!127841 (= e!83497 e!83495)))

(declare-fun b!127842 () Bool)

(declare-fun res!61762 () Bool)

(declare-fun e!83507 () Bool)

(assert (=> b!127842 (=> (not res!61762) (not e!83507))))

(assert (=> b!127842 (= res!61762 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66088)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13797 () Bool)

(declare-fun updateHelperNewKey!57 (LongMapFixedSize!1074 (_ BitVec 64) V!3451 (_ BitVec 32)) tuple2!2598)

(assert (=> bm!13797 (= call!13794 (updateHelperNewKey!57 newMap!16 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))

(declare-fun bm!13798 () Bool)

(declare-fun call!13811 () Bool)

(declare-fun c!23394 () Bool)

(declare-fun c!23399 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13798 (= call!13811 (inRange!0 (ite c!23389 (ite c!23400 (index!3241 lt!66068) (ite c!23395 (index!3240 lt!66088) (index!3243 lt!66088))) (ite c!23399 (index!3241 lt!66075) (ite c!23394 (index!3240 lt!66077) (index!3243 lt!66077)))) (mask!7073 newMap!16)))))

(declare-fun b!127843 () Bool)

(declare-fun res!61773 () Bool)

(assert (=> b!127843 (=> (not res!61773) (not e!83507))))

(assert (=> b!127843 (= res!61773 call!13803)))

(assert (=> b!127843 (= e!83505 e!83507)))

(declare-fun b!127844 () Bool)

(declare-fun lt!66085 () Unit!3981)

(declare-fun lt!66090 () Unit!3981)

(assert (=> b!127844 (= lt!66085 lt!66090)))

(declare-fun call!13802 () ListLongMap!1691)

(assert (=> b!127844 (= call!13802 call!13797)))

(declare-fun lt!66084 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!57 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 V!3451 Int) Unit!3981)

(assert (=> b!127844 (= lt!66090 (lemmaChangeZeroKeyThenAddPairToListMap!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66084 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) (defaultEntry!2805 newMap!16)))))

(assert (=> b!127844 (= lt!66084 (bvor (extraKeys!2582 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!83508 () tuple2!2598)

(assert (=> b!127844 (= e!83508 (tuple2!2599 true (LongMapFixedSize!1075 (defaultEntry!2805 newMap!16) (mask!7073 newMap!16) (bvor (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) (_size!586 newMap!16) (_keys!4542 newMap!16) (_values!2788 newMap!16) (_vacant!586 newMap!16))))))

(declare-fun b!127845 () Bool)

(assert (=> b!127845 (= e!83499 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun bm!13799 () Bool)

(assert (=> bm!13799 (= call!13804 call!13811)))

(declare-fun bm!13800 () Bool)

(assert (=> bm!13800 (= call!13788 call!13796)))

(declare-fun b!127846 () Bool)

(assert (=> b!127846 (= e!83507 (not call!13798))))

(declare-fun b!127847 () Bool)

(declare-fun Unit!3985 () Unit!3981)

(assert (=> b!127847 (= e!83496 Unit!3985)))

(declare-fun lt!66087 () Unit!3981)

(assert (=> b!127847 (= lt!66087 call!13791)))

(assert (=> b!127847 (= lt!66077 call!13799)))

(assert (=> b!127847 (= c!23394 ((_ is MissingZero!271) lt!66077))))

(assert (=> b!127847 e!83500))

(declare-fun lt!66076 () Unit!3981)

(assert (=> b!127847 (= lt!66076 lt!66087)))

(assert (=> b!127847 false))

(declare-fun b!127848 () Bool)

(assert (=> b!127848 (= e!83489 ((_ is Undefined!271) lt!66077))))

(declare-fun b!127849 () Bool)

(assert (=> b!127849 (= e!83493 ((_ is Undefined!271) lt!66088))))

(declare-fun bm!13801 () Bool)

(declare-fun arrayContainsKey!0 (array!4725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13801 (= call!13801 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!13802 () Bool)

(assert (=> bm!13802 (= call!13796 call!13811)))

(declare-fun b!127850 () Bool)

(declare-fun lt!66069 () Unit!3981)

(declare-fun lt!66089 () Unit!3981)

(assert (=> b!127850 (= lt!66069 lt!66089)))

(assert (=> b!127850 (= call!13802 call!13797)))

(declare-fun lt!66092 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 V!3451 Int) Unit!3981)

(assert (=> b!127850 (= lt!66089 (lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)))))

(assert (=> b!127850 (= lt!66092 (bvor (extraKeys!2582 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!127850 (= e!83508 (tuple2!2599 true (LongMapFixedSize!1075 (defaultEntry!2805 newMap!16) (mask!7073 newMap!16) (bvor (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!586 newMap!16) (_keys!4542 newMap!16) (_values!2788 newMap!16) (_vacant!586 newMap!16))))))

(declare-fun c!23390 () Bool)

(declare-fun bm!13803 () Bool)

(declare-fun call!13809 () ListLongMap!1691)

(assert (=> bm!13803 (= call!13809 (+!171 e!83499 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23396 () Bool)

(assert (=> bm!13803 (= c!23396 c!23392)))

(declare-fun b!127851 () Bool)

(assert (=> b!127851 (= e!83501 e!83497)))

(assert (=> b!127851 (= lt!66072 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(assert (=> b!127851 (= c!23389 ((_ is Undefined!271) lt!66072))))

(declare-fun bm!13804 () Bool)

(assert (=> bm!13804 (= call!13805 call!13792)))

(declare-fun b!127852 () Bool)

(assert (=> b!127852 (= e!83487 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!127853 () Bool)

(declare-fun lt!66083 () Unit!3981)

(declare-fun lt!66091 () Unit!3981)

(assert (=> b!127853 (= lt!66083 lt!66091)))

(assert (=> b!127853 (contains!884 call!13805 (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!118 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) Int) Unit!3981)

(assert (=> b!127853 (= lt!66091 (lemmaValidKeyInArrayIsInListMap!118 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (defaultEntry!2805 newMap!16)))))

(assert (=> b!127853 (= lt!66094 (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))))

(declare-fun lt!66079 () Unit!3981)

(declare-fun lt!66071 () Unit!3981)

(assert (=> b!127853 (= lt!66079 lt!66071)))

(assert (=> b!127853 (= call!13809 call!13806)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) (_ BitVec 64) V!3451 Int) Unit!3981)

(assert (=> b!127853 (= lt!66071 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66081 () Unit!3981)

(assert (=> b!127853 (= lt!66081 e!83496)))

(assert (=> b!127853 (= c!23399 call!13793)))

(assert (=> b!127853 (= e!83506 (tuple2!2599 true (LongMapFixedSize!1075 (defaultEntry!2805 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (_size!586 newMap!16) (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (_vacant!586 newMap!16))))))

(declare-fun b!127854 () Bool)

(declare-fun res!61763 () Bool)

(assert (=> b!127854 (= res!61763 call!13804)))

(assert (=> b!127854 (=> (not res!61763) (not e!83488))))

(declare-fun bm!13805 () Bool)

(assert (=> bm!13805 (= call!13806 (getCurrentListMap!539 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!127855 () Bool)

(assert (=> b!127855 (= e!83504 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66075)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun bm!13806 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 64) Int) Unit!3981)

(assert (=> bm!13806 (= call!13800 (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)))))

(declare-fun b!127856 () Bool)

(assert (=> b!127856 (= e!83501 e!83508)))

(assert (=> b!127856 (= c!23390 (= (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13807 () Bool)

(assert (=> bm!13807 (= call!13795 call!13792)))

(declare-fun bm!13808 () Bool)

(assert (=> bm!13808 (= call!13802 call!13809)))

(declare-fun b!127857 () Bool)

(declare-fun res!61764 () Bool)

(assert (=> b!127857 (= res!61764 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127857 (=> (not res!61764) (not e!83494))))

(declare-fun b!127858 () Bool)

(assert (=> b!127858 (= e!83492 e!83502)))

(declare-fun res!61770 () Bool)

(assert (=> b!127858 (= res!61770 (contains!884 call!13790 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!127858 (=> (not res!61770) (not e!83502))))

(declare-fun b!127859 () Bool)

(declare-fun c!23397 () Bool)

(assert (=> b!127859 (= c!23397 ((_ is MissingVacant!271) lt!66077))))

(assert (=> b!127859 (= e!83500 e!83489)))

(assert (= (and d!38575 c!23392) b!127856))

(assert (= (and d!38575 (not c!23392)) b!127851))

(assert (= (and b!127856 c!23390) b!127844))

(assert (= (and b!127856 (not c!23390)) b!127850))

(assert (= (or b!127844 b!127850) bm!13794))

(assert (= (or b!127844 b!127850) bm!13807))

(assert (= (or b!127844 b!127850) bm!13808))

(assert (= (and b!127851 c!23389) b!127823))

(assert (= (and b!127851 (not c!23389)) b!127841))

(assert (= (and b!127823 c!23400) b!127831))

(assert (= (and b!127823 (not c!23400)) b!127838))

(assert (= (and b!127831 res!61766) b!127854))

(assert (= (and b!127854 res!61763) b!127818))

(assert (= (and b!127838 c!23395) b!127843))

(assert (= (and b!127838 (not c!23395)) b!127830))

(assert (= (and b!127843 res!61773) b!127842))

(assert (= (and b!127842 res!61762) b!127846))

(assert (= (and b!127830 c!23398) b!127832))

(assert (= (and b!127830 (not c!23398)) b!127849))

(assert (= (and b!127832 res!61767) b!127826))

(assert (= (and b!127826 res!61765) b!127839))

(assert (= (or b!127843 b!127832) bm!13795))

(assert (= (or b!127846 b!127839) bm!13787))

(assert (= (or b!127854 bm!13795) bm!13799))

(assert (= (or b!127831 b!127838) bm!13785))

(assert (= (and b!127841 c!23401) b!127824))

(assert (= (and b!127841 (not c!23401)) b!127836))

(assert (= (and b!127836 c!23391) b!127834))

(assert (= (and b!127836 (not c!23391)) b!127853))

(assert (= (and b!127853 c!23399) b!127825))

(assert (= (and b!127853 (not c!23399)) b!127847))

(assert (= (and b!127825 res!61775) b!127820))

(assert (= (and b!127820 res!61768) b!127855))

(assert (= (and b!127847 c!23394) b!127837))

(assert (= (and b!127847 (not c!23394)) b!127859))

(assert (= (and b!127837 res!61769) b!127821))

(assert (= (and b!127821 res!61774) b!127822))

(assert (= (and b!127859 c!23397) b!127833))

(assert (= (and b!127859 (not c!23397)) b!127848))

(assert (= (and b!127833 res!61772) b!127857))

(assert (= (and b!127857 res!61764) b!127840))

(assert (= (or b!127837 b!127833) bm!13800))

(assert (= (or b!127822 b!127840) bm!13789))

(assert (= (or b!127820 bm!13800) bm!13802))

(assert (= (or b!127825 b!127847) bm!13788))

(assert (= (or b!127824 b!127834) bm!13797))

(assert (= (or b!127838 b!127847) bm!13792))

(assert (= (or bm!13787 bm!13789) bm!13801))

(assert (= (or bm!13799 bm!13802) bm!13798))

(assert (= (or bm!13785 bm!13788) bm!13791))

(assert (= (or b!127831 b!127825) bm!13806))

(assert (= (or b!127823 b!127853) bm!13804))

(assert (= (or b!127823 b!127853) bm!13793))

(assert (= (and bm!13793 c!23393) b!127828))

(assert (= (and bm!13793 (not c!23393)) b!127852))

(assert (= (or bm!13794 b!127853) bm!13805))

(assert (= (or bm!13807 bm!13804) bm!13790))

(assert (= (or bm!13808 b!127853) bm!13803))

(assert (= (and bm!13803 c!23396) b!127829))

(assert (= (and bm!13803 (not c!23396)) b!127845))

(assert (= (and d!38575 res!61771) b!127835))

(assert (= (and b!127835 c!23388) b!127858))

(assert (= (and b!127835 (not c!23388)) b!127819))

(assert (= (and b!127858 res!61770) b!127827))

(assert (= (or b!127858 b!127827 b!127819) bm!13796))

(assert (= (or b!127827 b!127819) bm!13786))

(assert (=> bm!13793 m!149355))

(declare-fun m!149423 () Bool)

(assert (=> bm!13793 m!149423))

(declare-fun m!149425 () Bool)

(assert (=> b!127821 m!149425))

(assert (=> bm!13791 m!149355))

(declare-fun m!149427 () Bool)

(assert (=> bm!13791 m!149427))

(declare-fun m!149429 () Bool)

(assert (=> bm!13803 m!149429))

(declare-fun m!149431 () Bool)

(assert (=> b!127826 m!149431))

(assert (=> bm!13806 m!149355))

(declare-fun m!149433 () Bool)

(assert (=> bm!13806 m!149433))

(declare-fun m!149435 () Bool)

(assert (=> bm!13790 m!149435))

(declare-fun m!149437 () Bool)

(assert (=> b!127845 m!149437))

(assert (=> b!127852 m!149437))

(declare-fun m!149439 () Bool)

(assert (=> b!127857 m!149439))

(declare-fun m!149441 () Bool)

(assert (=> b!127818 m!149441))

(assert (=> b!127844 m!149353))

(declare-fun m!149443 () Bool)

(assert (=> b!127844 m!149443))

(assert (=> bm!13801 m!149355))

(declare-fun m!149445 () Bool)

(assert (=> bm!13801 m!149445))

(assert (=> b!127858 m!149355))

(declare-fun m!149447 () Bool)

(assert (=> b!127858 m!149447))

(declare-fun m!149449 () Bool)

(assert (=> b!127855 m!149449))

(declare-fun m!149451 () Bool)

(assert (=> bm!13805 m!149451))

(declare-fun m!149453 () Bool)

(assert (=> bm!13805 m!149453))

(assert (=> b!127851 m!149355))

(assert (=> b!127851 m!149427))

(assert (=> bm!13792 m!149355))

(declare-fun m!149455 () Bool)

(assert (=> bm!13792 m!149455))

(declare-fun m!149457 () Bool)

(assert (=> bm!13798 m!149457))

(assert (=> bm!13786 m!149365))

(declare-fun m!149459 () Bool)

(assert (=> b!127827 m!149459))

(declare-fun m!149461 () Bool)

(assert (=> b!127842 m!149461))

(assert (=> bm!13797 m!149355))

(assert (=> bm!13797 m!149353))

(declare-fun m!149463 () Bool)

(assert (=> bm!13797 m!149463))

(assert (=> b!127850 m!149353))

(declare-fun m!149465 () Bool)

(assert (=> b!127850 m!149465))

(declare-fun m!149467 () Bool)

(assert (=> bm!13796 m!149467))

(declare-fun m!149469 () Bool)

(assert (=> d!38575 m!149469))

(assert (=> d!38575 m!149341))

(declare-fun m!149471 () Bool)

(assert (=> b!127853 m!149471))

(declare-fun m!149473 () Bool)

(assert (=> b!127853 m!149473))

(assert (=> b!127853 m!149451))

(assert (=> b!127853 m!149471))

(declare-fun m!149475 () Bool)

(assert (=> b!127853 m!149475))

(assert (=> b!127853 m!149355))

(assert (=> b!127853 m!149353))

(declare-fun m!149477 () Bool)

(assert (=> b!127853 m!149477))

(assert (=> b!127650 d!38575))

(declare-fun d!38577 () Bool)

(declare-fun c!23404 () Bool)

(assert (=> d!38577 (= c!23404 ((_ is ValueCellFull!1083) (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun e!83511 () V!3451)

(assert (=> d!38577 (= (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83511)))

(declare-fun b!127864 () Bool)

(declare-fun get!1457 (ValueCell!1083 V!3451) V!3451)

(assert (=> b!127864 (= e!83511 (get!1457 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127865 () Bool)

(declare-fun get!1458 (ValueCell!1083 V!3451) V!3451)

(assert (=> b!127865 (= e!83511 (get!1458 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38577 c!23404) b!127864))

(assert (= (and d!38577 (not c!23404)) b!127865))

(assert (=> b!127864 m!149349))

(assert (=> b!127864 m!149351))

(declare-fun m!149479 () Bool)

(assert (=> b!127864 m!149479))

(assert (=> b!127865 m!149349))

(assert (=> b!127865 m!149351))

(declare-fun m!149481 () Bool)

(assert (=> b!127865 m!149481))

(assert (=> b!127650 d!38577))

(declare-fun d!38579 () Bool)

(assert (=> d!38579 (= (array_inv!1407 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvsge (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!127647 d!38579))

(declare-fun d!38581 () Bool)

(assert (=> d!38581 (= (array_inv!1408 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvsge (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!127647 d!38581))

(declare-fun d!38583 () Bool)

(assert (=> d!38583 (= (validMask!0 (mask!7073 (v!3146 (underlying!445 thiss!992)))) (and (or (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000001111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000011111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000001111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000011111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000001111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000011111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000001111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000011111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000001111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000011111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000001111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000011111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000001111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000011111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000111111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000001111111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000011111111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000111111111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00001111111111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00011111111111111111111111111111) (= (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!127648 d!38583))

(declare-fun d!38585 () Bool)

(assert (=> d!38585 (= (array_inv!1407 (_keys!4542 newMap!16)) (bvsge (size!2502 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127644 d!38585))

(declare-fun d!38587 () Bool)

(assert (=> d!38587 (= (array_inv!1408 (_values!2788 newMap!16)) (bvsge (size!2503 (_values!2788 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127644 d!38587))

(declare-fun d!38589 () Bool)

(assert (=> d!38589 (= (map!1394 newMap!16) (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun bs!5292 () Bool)

(assert (= bs!5292 d!38589))

(assert (=> bs!5292 m!149437))

(assert (=> b!127657 d!38589))

(declare-fun b!127908 () Bool)

(declare-fun e!83538 () Unit!3981)

(declare-fun Unit!3986 () Unit!3981)

(assert (=> b!127908 (= e!83538 Unit!3986)))

(declare-fun b!127909 () Bool)

(declare-fun e!83545 () Bool)

(declare-fun lt!66157 () ListLongMap!1691)

(declare-fun apply!112 (ListLongMap!1691 (_ BitVec 64)) V!3451)

(assert (=> b!127909 (= e!83545 (= (apply!112 lt!66157 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!127910 () Bool)

(declare-fun res!61794 () Bool)

(declare-fun e!83541 () Bool)

(assert (=> b!127910 (=> (not res!61794) (not e!83541))))

(declare-fun e!83543 () Bool)

(assert (=> b!127910 (= res!61794 e!83543)))

(declare-fun c!23419 () Bool)

(assert (=> b!127910 (= c!23419 (not (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!127911 () Bool)

(declare-fun e!83540 () Bool)

(declare-fun e!83542 () Bool)

(assert (=> b!127911 (= e!83540 e!83542)))

(declare-fun res!61798 () Bool)

(declare-fun call!13828 () Bool)

(assert (=> b!127911 (= res!61798 call!13828)))

(assert (=> b!127911 (=> (not res!61798) (not e!83542))))

(declare-fun e!83544 () Bool)

(declare-fun b!127912 () Bool)

(assert (=> b!127912 (= e!83544 (= (apply!112 lt!66157 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> b!127912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun bm!13823 () Bool)

(declare-fun call!13832 () ListLongMap!1691)

(declare-fun call!13830 () ListLongMap!1691)

(assert (=> bm!13823 (= call!13832 call!13830)))

(declare-fun b!127913 () Bool)

(declare-fun e!83548 () ListLongMap!1691)

(declare-fun call!13826 () ListLongMap!1691)

(assert (=> b!127913 (= e!83548 call!13826)))

(declare-fun b!127914 () Bool)

(assert (=> b!127914 (= e!83540 (not call!13828))))

(declare-fun bm!13824 () Bool)

(declare-fun c!23421 () Bool)

(declare-fun c!23417 () Bool)

(declare-fun call!13829 () ListLongMap!1691)

(assert (=> bm!13824 (= call!13829 (+!171 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!127915 () Bool)

(declare-fun call!13831 () Bool)

(assert (=> b!127915 (= e!83543 (not call!13831))))

(declare-fun b!127916 () Bool)

(declare-fun e!83546 () ListLongMap!1691)

(declare-fun call!13827 () ListLongMap!1691)

(assert (=> b!127916 (= e!83546 call!13827)))

(declare-fun b!127917 () Bool)

(declare-fun e!83550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!127917 (= e!83550 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!127919 () Bool)

(declare-fun c!23422 () Bool)

(assert (=> b!127919 (= c!23422 (and (not (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127919 (= e!83546 e!83548)))

(declare-fun bm!13825 () Bool)

(assert (=> bm!13825 (= call!13828 (contains!884 lt!66157 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127920 () Bool)

(declare-fun e!83549 () Bool)

(assert (=> b!127920 (= e!83549 e!83544)))

(declare-fun res!61799 () Bool)

(assert (=> b!127920 (=> (not res!61799) (not e!83544))))

(assert (=> b!127920 (= res!61799 (contains!884 lt!66157 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!127920 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun bm!13826 () Bool)

(assert (=> bm!13826 (= call!13827 call!13829)))

(declare-fun bm!13827 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!137 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) Int) ListLongMap!1691)

(assert (=> bm!13827 (= call!13830 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!127921 () Bool)

(declare-fun lt!66143 () Unit!3981)

(assert (=> b!127921 (= e!83538 lt!66143)))

(declare-fun lt!66160 () ListLongMap!1691)

(assert (=> b!127921 (= lt!66160 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun lt!66154 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66154 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66149 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66149 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66140 () Unit!3981)

(declare-fun addStillContains!88 (ListLongMap!1691 (_ BitVec 64) V!3451 (_ BitVec 64)) Unit!3981)

(assert (=> b!127921 (= lt!66140 (addStillContains!88 lt!66160 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66149))))

(assert (=> b!127921 (contains!884 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66149)))

(declare-fun lt!66146 () Unit!3981)

(assert (=> b!127921 (= lt!66146 lt!66140)))

(declare-fun lt!66158 () ListLongMap!1691)

(assert (=> b!127921 (= lt!66158 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun lt!66144 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66144 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66139 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66139 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66142 () Unit!3981)

(declare-fun addApplyDifferent!88 (ListLongMap!1691 (_ BitVec 64) V!3451 (_ BitVec 64)) Unit!3981)

(assert (=> b!127921 (= lt!66142 (addApplyDifferent!88 lt!66158 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66139))))

(assert (=> b!127921 (= (apply!112 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66139) (apply!112 lt!66158 lt!66139))))

(declare-fun lt!66151 () Unit!3981)

(assert (=> b!127921 (= lt!66151 lt!66142)))

(declare-fun lt!66141 () ListLongMap!1691)

(assert (=> b!127921 (= lt!66141 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun lt!66150 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66156 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66156 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66148 () Unit!3981)

(assert (=> b!127921 (= lt!66148 (addApplyDifferent!88 lt!66141 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66156))))

(assert (=> b!127921 (= (apply!112 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66156) (apply!112 lt!66141 lt!66156))))

(declare-fun lt!66159 () Unit!3981)

(assert (=> b!127921 (= lt!66159 lt!66148)))

(declare-fun lt!66153 () ListLongMap!1691)

(assert (=> b!127921 (= lt!66153 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun lt!66152 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66147 () (_ BitVec 64))

(assert (=> b!127921 (= lt!66147 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!127921 (= lt!66143 (addApplyDifferent!88 lt!66153 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66147))))

(assert (=> b!127921 (= (apply!112 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66147) (apply!112 lt!66153 lt!66147))))

(declare-fun b!127922 () Bool)

(assert (=> b!127922 (= e!83542 (= (apply!112 lt!66157 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!127923 () Bool)

(declare-fun e!83547 () ListLongMap!1691)

(assert (=> b!127923 (= e!83547 (+!171 call!13829 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!127924 () Bool)

(assert (=> b!127924 (= e!83541 e!83540)))

(declare-fun c!23420 () Bool)

(assert (=> b!127924 (= c!23420 (not (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127925 () Bool)

(declare-fun res!61800 () Bool)

(assert (=> b!127925 (=> (not res!61800) (not e!83541))))

(assert (=> b!127925 (= res!61800 e!83549)))

(declare-fun res!61796 () Bool)

(assert (=> b!127925 (=> res!61796 e!83549)))

(declare-fun e!83539 () Bool)

(assert (=> b!127925 (= res!61796 (not e!83539))))

(declare-fun res!61801 () Bool)

(assert (=> b!127925 (=> (not res!61801) (not e!83539))))

(assert (=> b!127925 (= res!61801 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!127926 () Bool)

(assert (=> b!127926 (= e!83547 e!83546)))

(assert (=> b!127926 (= c!23421 (and (not (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13828 () Bool)

(assert (=> bm!13828 (= call!13826 call!13832)))

(declare-fun b!127927 () Bool)

(assert (=> b!127927 (= e!83548 call!13827)))

(declare-fun b!127918 () Bool)

(assert (=> b!127918 (= e!83539 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!38591 () Bool)

(assert (=> d!38591 e!83541))

(declare-fun res!61797 () Bool)

(assert (=> d!38591 (=> (not res!61797) (not e!83541))))

(assert (=> d!38591 (= res!61797 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun lt!66145 () ListLongMap!1691)

(assert (=> d!38591 (= lt!66157 lt!66145)))

(declare-fun lt!66155 () Unit!3981)

(assert (=> d!38591 (= lt!66155 e!83538)))

(declare-fun c!23418 () Bool)

(assert (=> d!38591 (= c!23418 e!83550)))

(declare-fun res!61795 () Bool)

(assert (=> d!38591 (=> (not res!61795) (not e!83550))))

(assert (=> d!38591 (= res!61795 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!38591 (= lt!66145 e!83547)))

(assert (=> d!38591 (= c!23417 (and (not (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38591 (validMask!0 (mask!7073 (v!3146 (underlying!445 thiss!992))))))

(assert (=> d!38591 (= (getCurrentListMap!539 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))) lt!66157)))

(declare-fun b!127928 () Bool)

(assert (=> b!127928 (= e!83543 e!83545)))

(declare-fun res!61802 () Bool)

(assert (=> b!127928 (= res!61802 call!13831)))

(assert (=> b!127928 (=> (not res!61802) (not e!83545))))

(declare-fun bm!13829 () Bool)

(assert (=> bm!13829 (= call!13831 (contains!884 lt!66157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38591 c!23417) b!127923))

(assert (= (and d!38591 (not c!23417)) b!127926))

(assert (= (and b!127926 c!23421) b!127916))

(assert (= (and b!127926 (not c!23421)) b!127919))

(assert (= (and b!127919 c!23422) b!127927))

(assert (= (and b!127919 (not c!23422)) b!127913))

(assert (= (or b!127927 b!127913) bm!13828))

(assert (= (or b!127916 bm!13828) bm!13823))

(assert (= (or b!127916 b!127927) bm!13826))

(assert (= (or b!127923 bm!13823) bm!13827))

(assert (= (or b!127923 bm!13826) bm!13824))

(assert (= (and d!38591 res!61795) b!127917))

(assert (= (and d!38591 c!23418) b!127921))

(assert (= (and d!38591 (not c!23418)) b!127908))

(assert (= (and d!38591 res!61797) b!127925))

(assert (= (and b!127925 res!61801) b!127918))

(assert (= (and b!127925 (not res!61796)) b!127920))

(assert (= (and b!127920 res!61799) b!127912))

(assert (= (and b!127925 res!61800) b!127910))

(assert (= (and b!127910 c!23419) b!127928))

(assert (= (and b!127910 (not c!23419)) b!127915))

(assert (= (and b!127928 res!61802) b!127909))

(assert (= (or b!127928 b!127915) bm!13829))

(assert (= (and b!127910 res!61794) b!127924))

(assert (= (and b!127924 c!23420) b!127911))

(assert (= (and b!127924 (not c!23420)) b!127914))

(assert (= (and b!127911 res!61798) b!127922))

(assert (= (or b!127911 b!127914) bm!13825))

(declare-fun b_lambda!5651 () Bool)

(assert (=> (not b_lambda!5651) (not b!127912)))

(assert (=> b!127912 t!6080))

(declare-fun b_and!7899 () Bool)

(assert (= b_and!7887 (and (=> t!6080 result!3879) b_and!7899)))

(assert (=> b!127912 t!6082))

(declare-fun b_and!7901 () Bool)

(assert (= b_and!7889 (and (=> t!6082 result!3883) b_and!7901)))

(declare-fun m!149483 () Bool)

(assert (=> bm!13829 m!149483))

(declare-fun m!149485 () Bool)

(assert (=> b!127917 m!149485))

(assert (=> b!127917 m!149485))

(declare-fun m!149487 () Bool)

(assert (=> b!127917 m!149487))

(declare-fun m!149489 () Bool)

(assert (=> b!127923 m!149489))

(declare-fun m!149491 () Bool)

(assert (=> b!127921 m!149491))

(declare-fun m!149493 () Bool)

(assert (=> b!127921 m!149493))

(declare-fun m!149495 () Bool)

(assert (=> b!127921 m!149495))

(assert (=> b!127921 m!149485))

(declare-fun m!149497 () Bool)

(assert (=> b!127921 m!149497))

(declare-fun m!149499 () Bool)

(assert (=> b!127921 m!149499))

(declare-fun m!149501 () Bool)

(assert (=> b!127921 m!149501))

(declare-fun m!149503 () Bool)

(assert (=> b!127921 m!149503))

(assert (=> b!127921 m!149501))

(declare-fun m!149505 () Bool)

(assert (=> b!127921 m!149505))

(declare-fun m!149507 () Bool)

(assert (=> b!127921 m!149507))

(assert (=> b!127921 m!149505))

(declare-fun m!149509 () Bool)

(assert (=> b!127921 m!149509))

(declare-fun m!149511 () Bool)

(assert (=> b!127921 m!149511))

(declare-fun m!149513 () Bool)

(assert (=> b!127921 m!149513))

(declare-fun m!149515 () Bool)

(assert (=> b!127921 m!149515))

(assert (=> b!127921 m!149499))

(declare-fun m!149517 () Bool)

(assert (=> b!127921 m!149517))

(declare-fun m!149519 () Bool)

(assert (=> b!127921 m!149519))

(declare-fun m!149521 () Bool)

(assert (=> b!127921 m!149521))

(assert (=> b!127921 m!149511))

(assert (=> b!127920 m!149485))

(assert (=> b!127920 m!149485))

(declare-fun m!149523 () Bool)

(assert (=> b!127920 m!149523))

(declare-fun m!149525 () Bool)

(assert (=> bm!13825 m!149525))

(declare-fun m!149527 () Bool)

(assert (=> bm!13824 m!149527))

(declare-fun m!149529 () Bool)

(assert (=> b!127912 m!149529))

(assert (=> b!127912 m!149351))

(assert (=> b!127912 m!149485))

(assert (=> b!127912 m!149485))

(declare-fun m!149531 () Bool)

(assert (=> b!127912 m!149531))

(assert (=> b!127912 m!149529))

(assert (=> b!127912 m!149351))

(declare-fun m!149533 () Bool)

(assert (=> b!127912 m!149533))

(assert (=> d!38591 m!149339))

(assert (=> b!127918 m!149485))

(assert (=> b!127918 m!149485))

(assert (=> b!127918 m!149487))

(assert (=> bm!13827 m!149491))

(declare-fun m!149535 () Bool)

(assert (=> b!127909 m!149535))

(declare-fun m!149537 () Bool)

(assert (=> b!127922 m!149537))

(assert (=> b!127657 d!38591))

(declare-fun d!38593 () Bool)

(assert (=> d!38593 (= (valid!513 thiss!992) (valid!512 (v!3146 (underlying!445 thiss!992))))))

(declare-fun bs!5293 () Bool)

(assert (= bs!5293 d!38593))

(declare-fun m!149539 () Bool)

(assert (=> bs!5293 m!149539))

(assert (=> start!13826 d!38593))

(declare-fun b!127935 () Bool)

(declare-fun e!83556 () Bool)

(assert (=> b!127935 (= e!83556 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4553 () Bool)

(declare-fun mapRes!4553 () Bool)

(declare-fun tp!11051 () Bool)

(assert (=> mapNonEmpty!4553 (= mapRes!4553 (and tp!11051 e!83556))))

(declare-fun mapRest!4553 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapValue!4553 () ValueCell!1083)

(declare-fun mapKey!4553 () (_ BitVec 32))

(assert (=> mapNonEmpty!4553 (= mapRest!4544 (store mapRest!4553 mapKey!4553 mapValue!4553))))

(declare-fun mapIsEmpty!4553 () Bool)

(assert (=> mapIsEmpty!4553 mapRes!4553))

(declare-fun b!127936 () Bool)

(declare-fun e!83555 () Bool)

(assert (=> b!127936 (= e!83555 tp_is_empty!2853)))

(declare-fun condMapEmpty!4553 () Bool)

(declare-fun mapDefault!4553 () ValueCell!1083)

(assert (=> mapNonEmpty!4544 (= condMapEmpty!4553 (= mapRest!4544 ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4553)))))

(assert (=> mapNonEmpty!4544 (= tp!11034 (and e!83555 mapRes!4553))))

(assert (= (and mapNonEmpty!4544 condMapEmpty!4553) mapIsEmpty!4553))

(assert (= (and mapNonEmpty!4544 (not condMapEmpty!4553)) mapNonEmpty!4553))

(assert (= (and mapNonEmpty!4553 ((_ is ValueCellFull!1083) mapValue!4553)) b!127935))

(assert (= (and mapNonEmpty!4544 ((_ is ValueCellFull!1083) mapDefault!4553)) b!127936))

(declare-fun m!149541 () Bool)

(assert (=> mapNonEmpty!4553 m!149541))

(declare-fun b!127937 () Bool)

(declare-fun e!83558 () Bool)

(assert (=> b!127937 (= e!83558 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4554 () Bool)

(declare-fun mapRes!4554 () Bool)

(declare-fun tp!11052 () Bool)

(assert (=> mapNonEmpty!4554 (= mapRes!4554 (and tp!11052 e!83558))))

(declare-fun mapValue!4554 () ValueCell!1083)

(declare-fun mapRest!4554 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapKey!4554 () (_ BitVec 32))

(assert (=> mapNonEmpty!4554 (= mapRest!4543 (store mapRest!4554 mapKey!4554 mapValue!4554))))

(declare-fun mapIsEmpty!4554 () Bool)

(assert (=> mapIsEmpty!4554 mapRes!4554))

(declare-fun b!127938 () Bool)

(declare-fun e!83557 () Bool)

(assert (=> b!127938 (= e!83557 tp_is_empty!2853)))

(declare-fun condMapEmpty!4554 () Bool)

(declare-fun mapDefault!4554 () ValueCell!1083)

(assert (=> mapNonEmpty!4543 (= condMapEmpty!4554 (= mapRest!4543 ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4554)))))

(assert (=> mapNonEmpty!4543 (= tp!11033 (and e!83557 mapRes!4554))))

(assert (= (and mapNonEmpty!4543 condMapEmpty!4554) mapIsEmpty!4554))

(assert (= (and mapNonEmpty!4543 (not condMapEmpty!4554)) mapNonEmpty!4554))

(assert (= (and mapNonEmpty!4554 ((_ is ValueCellFull!1083) mapValue!4554)) b!127937))

(assert (= (and mapNonEmpty!4543 ((_ is ValueCellFull!1083) mapDefault!4554)) b!127938))

(declare-fun m!149543 () Bool)

(assert (=> mapNonEmpty!4554 m!149543))

(declare-fun b_lambda!5653 () Bool)

(assert (= b_lambda!5651 (or (and b!127647 b_free!2873) (and b!127644 b_free!2875 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))) b_lambda!5653)))

(check-sat (not bm!13793) (not b!127865) (not b!127912) (not mapNonEmpty!4553) (not b!127851) (not b!127918) (not b_lambda!5653) (not bm!13805) (not b!127917) (not bm!13801) (not bm!13790) b_and!7901 tp_is_empty!2853 (not bm!13796) (not b!127722) (not b!127724) (not b!127852) (not b!127723) (not bm!13786) (not bm!13829) b_and!7899 (not b!127845) (not b!127850) (not b!127909) (not b!127921) (not bm!13798) (not d!38591) (not b_lambda!5649) (not bm!13792) (not bm!13791) (not d!38589) (not b!127920) (not bm!13803) (not b!127844) (not b!127923) (not b!127922) (not d!38593) (not d!38571) (not b!127853) (not b_next!2873) (not b!127858) (not d!38575) (not bm!13824) (not d!38573) (not mapNonEmpty!4554) (not b!127731) (not b!127827) (not b!127864) (not b!127733) (not bm!13806) (not b_next!2875) (not bm!13825) (not bm!13827) (not bm!13797))
(check-sat b_and!7899 b_and!7901 (not b_next!2873) (not b_next!2875))
(get-model)

(declare-fun b!127939 () Bool)

(declare-fun e!83559 () Unit!3981)

(declare-fun Unit!3987 () Unit!3981)

(assert (=> b!127939 (= e!83559 Unit!3987)))

(declare-fun b!127940 () Bool)

(declare-fun e!83566 () Bool)

(declare-fun lt!66179 () ListLongMap!1691)

(assert (=> b!127940 (= e!83566 (= (apply!112 lt!66179 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!127941 () Bool)

(declare-fun res!61803 () Bool)

(declare-fun e!83562 () Bool)

(assert (=> b!127941 (=> (not res!61803) (not e!83562))))

(declare-fun e!83564 () Bool)

(assert (=> b!127941 (= res!61803 e!83564)))

(declare-fun c!23425 () Bool)

(assert (=> b!127941 (= c!23425 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!127942 () Bool)

(declare-fun e!83561 () Bool)

(declare-fun e!83563 () Bool)

(assert (=> b!127942 (= e!83561 e!83563)))

(declare-fun res!61807 () Bool)

(declare-fun call!13835 () Bool)

(assert (=> b!127942 (= res!61807 call!13835)))

(assert (=> b!127942 (=> (not res!61807) (not e!83563))))

(declare-fun e!83565 () Bool)

(declare-fun b!127943 () Bool)

(assert (=> b!127943 (= e!83565 (= (apply!112 lt!66179 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127943 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094))))))

(assert (=> b!127943 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13830 () Bool)

(declare-fun call!13839 () ListLongMap!1691)

(declare-fun call!13837 () ListLongMap!1691)

(assert (=> bm!13830 (= call!13839 call!13837)))

(declare-fun b!127944 () Bool)

(declare-fun e!83569 () ListLongMap!1691)

(declare-fun call!13833 () ListLongMap!1691)

(assert (=> b!127944 (= e!83569 call!13833)))

(declare-fun b!127945 () Bool)

(assert (=> b!127945 (= e!83561 (not call!13835))))

(declare-fun c!23423 () Bool)

(declare-fun call!13836 () ListLongMap!1691)

(declare-fun bm!13831 () Bool)

(declare-fun c!23427 () Bool)

(assert (=> bm!13831 (= call!13836 (+!171 (ite c!23423 call!13837 (ite c!23427 call!13839 call!13833)) (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!127946 () Bool)

(declare-fun call!13838 () Bool)

(assert (=> b!127946 (= e!83564 (not call!13838))))

(declare-fun b!127947 () Bool)

(declare-fun e!83567 () ListLongMap!1691)

(declare-fun call!13834 () ListLongMap!1691)

(assert (=> b!127947 (= e!83567 call!13834)))

(declare-fun b!127948 () Bool)

(declare-fun e!83571 () Bool)

(assert (=> b!127948 (= e!83571 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127950 () Bool)

(declare-fun c!23428 () Bool)

(assert (=> b!127950 (= c!23428 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127950 (= e!83567 e!83569)))

(declare-fun bm!13832 () Bool)

(assert (=> bm!13832 (= call!13835 (contains!884 lt!66179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127951 () Bool)

(declare-fun e!83570 () Bool)

(assert (=> b!127951 (= e!83570 e!83565)))

(declare-fun res!61808 () Bool)

(assert (=> b!127951 (=> (not res!61808) (not e!83565))))

(assert (=> b!127951 (= res!61808 (contains!884 lt!66179 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13833 () Bool)

(assert (=> bm!13833 (= call!13834 call!13836)))

(declare-fun bm!13834 () Bool)

(assert (=> bm!13834 (= call!13837 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!127952 () Bool)

(declare-fun lt!66165 () Unit!3981)

(assert (=> b!127952 (= e!83559 lt!66165)))

(declare-fun lt!66182 () ListLongMap!1691)

(assert (=> b!127952 (= lt!66182 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66176 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66176 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66171 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66171 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66162 () Unit!3981)

(assert (=> b!127952 (= lt!66162 (addStillContains!88 lt!66182 lt!66176 (zeroValue!2666 newMap!16) lt!66171))))

(assert (=> b!127952 (contains!884 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))) lt!66171)))

(declare-fun lt!66168 () Unit!3981)

(assert (=> b!127952 (= lt!66168 lt!66162)))

(declare-fun lt!66180 () ListLongMap!1691)

(assert (=> b!127952 (= lt!66180 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66166 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66166 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66161 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66161 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66164 () Unit!3981)

(assert (=> b!127952 (= lt!66164 (addApplyDifferent!88 lt!66180 lt!66166 (minValue!2666 newMap!16) lt!66161))))

(assert (=> b!127952 (= (apply!112 (+!171 lt!66180 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))) lt!66161) (apply!112 lt!66180 lt!66161))))

(declare-fun lt!66173 () Unit!3981)

(assert (=> b!127952 (= lt!66173 lt!66164)))

(declare-fun lt!66163 () ListLongMap!1691)

(assert (=> b!127952 (= lt!66163 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66172 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66178 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66178 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66170 () Unit!3981)

(assert (=> b!127952 (= lt!66170 (addApplyDifferent!88 lt!66163 lt!66172 (zeroValue!2666 newMap!16) lt!66178))))

(assert (=> b!127952 (= (apply!112 (+!171 lt!66163 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))) lt!66178) (apply!112 lt!66163 lt!66178))))

(declare-fun lt!66181 () Unit!3981)

(assert (=> b!127952 (= lt!66181 lt!66170)))

(declare-fun lt!66175 () ListLongMap!1691)

(assert (=> b!127952 (= lt!66175 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66174 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66169 () (_ BitVec 64))

(assert (=> b!127952 (= lt!66169 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127952 (= lt!66165 (addApplyDifferent!88 lt!66175 lt!66174 (minValue!2666 newMap!16) lt!66169))))

(assert (=> b!127952 (= (apply!112 (+!171 lt!66175 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))) lt!66169) (apply!112 lt!66175 lt!66169))))

(declare-fun b!127953 () Bool)

(assert (=> b!127953 (= e!83563 (= (apply!112 lt!66179 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!127954 () Bool)

(declare-fun e!83568 () ListLongMap!1691)

(assert (=> b!127954 (= e!83568 (+!171 call!13836 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!127955 () Bool)

(assert (=> b!127955 (= e!83562 e!83561)))

(declare-fun c!23426 () Bool)

(assert (=> b!127955 (= c!23426 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127956 () Bool)

(declare-fun res!61809 () Bool)

(assert (=> b!127956 (=> (not res!61809) (not e!83562))))

(assert (=> b!127956 (= res!61809 e!83570)))

(declare-fun res!61805 () Bool)

(assert (=> b!127956 (=> res!61805 e!83570)))

(declare-fun e!83560 () Bool)

(assert (=> b!127956 (= res!61805 (not e!83560))))

(declare-fun res!61810 () Bool)

(assert (=> b!127956 (=> (not res!61810) (not e!83560))))

(assert (=> b!127956 (= res!61810 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!127957 () Bool)

(assert (=> b!127957 (= e!83568 e!83567)))

(assert (=> b!127957 (= c!23427 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13835 () Bool)

(assert (=> bm!13835 (= call!13833 call!13839)))

(declare-fun b!127958 () Bool)

(assert (=> b!127958 (= e!83569 call!13834)))

(declare-fun b!127949 () Bool)

(assert (=> b!127949 (= e!83560 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38595 () Bool)

(assert (=> d!38595 e!83562))

(declare-fun res!61806 () Bool)

(assert (=> d!38595 (=> (not res!61806) (not e!83562))))

(assert (=> d!38595 (= res!61806 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66167 () ListLongMap!1691)

(assert (=> d!38595 (= lt!66179 lt!66167)))

(declare-fun lt!66177 () Unit!3981)

(assert (=> d!38595 (= lt!66177 e!83559)))

(declare-fun c!23424 () Bool)

(assert (=> d!38595 (= c!23424 e!83571)))

(declare-fun res!61804 () Bool)

(assert (=> d!38595 (=> (not res!61804) (not e!83571))))

(assert (=> d!38595 (= res!61804 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38595 (= lt!66167 e!83568)))

(assert (=> d!38595 (= c!23423 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38595 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38595 (= (getCurrentListMap!539 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66179)))

(declare-fun b!127959 () Bool)

(assert (=> b!127959 (= e!83564 e!83566)))

(declare-fun res!61811 () Bool)

(assert (=> b!127959 (= res!61811 call!13838)))

(assert (=> b!127959 (=> (not res!61811) (not e!83566))))

(declare-fun bm!13836 () Bool)

(assert (=> bm!13836 (= call!13838 (contains!884 lt!66179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38595 c!23423) b!127954))

(assert (= (and d!38595 (not c!23423)) b!127957))

(assert (= (and b!127957 c!23427) b!127947))

(assert (= (and b!127957 (not c!23427)) b!127950))

(assert (= (and b!127950 c!23428) b!127958))

(assert (= (and b!127950 (not c!23428)) b!127944))

(assert (= (or b!127958 b!127944) bm!13835))

(assert (= (or b!127947 bm!13835) bm!13830))

(assert (= (or b!127947 b!127958) bm!13833))

(assert (= (or b!127954 bm!13830) bm!13834))

(assert (= (or b!127954 bm!13833) bm!13831))

(assert (= (and d!38595 res!61804) b!127948))

(assert (= (and d!38595 c!23424) b!127952))

(assert (= (and d!38595 (not c!23424)) b!127939))

(assert (= (and d!38595 res!61806) b!127956))

(assert (= (and b!127956 res!61810) b!127949))

(assert (= (and b!127956 (not res!61805)) b!127951))

(assert (= (and b!127951 res!61808) b!127943))

(assert (= (and b!127956 res!61809) b!127941))

(assert (= (and b!127941 c!23425) b!127959))

(assert (= (and b!127941 (not c!23425)) b!127946))

(assert (= (and b!127959 res!61811) b!127940))

(assert (= (or b!127959 b!127946) bm!13836))

(assert (= (and b!127941 res!61803) b!127955))

(assert (= (and b!127955 c!23426) b!127942))

(assert (= (and b!127955 (not c!23426)) b!127945))

(assert (= (and b!127942 res!61807) b!127953))

(assert (= (or b!127942 b!127945) bm!13832))

(declare-fun b_lambda!5655 () Bool)

(assert (=> (not b_lambda!5655) (not b!127943)))

(declare-fun tb!2349 () Bool)

(declare-fun t!6091 () Bool)

(assert (=> (and b!127647 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16)) t!6091) tb!2349))

(declare-fun result!3893 () Bool)

(assert (=> tb!2349 (= result!3893 tp_is_empty!2853)))

(assert (=> b!127943 t!6091))

(declare-fun b_and!7903 () Bool)

(assert (= b_and!7899 (and (=> t!6091 result!3893) b_and!7903)))

(declare-fun t!6093 () Bool)

(declare-fun tb!2351 () Bool)

(assert (=> (and b!127644 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 newMap!16)) t!6093) tb!2351))

(declare-fun result!3895 () Bool)

(assert (= result!3895 result!3893))

(assert (=> b!127943 t!6093))

(declare-fun b_and!7905 () Bool)

(assert (= b_and!7901 (and (=> t!6093 result!3895) b_and!7905)))

(declare-fun m!149545 () Bool)

(assert (=> bm!13836 m!149545))

(declare-fun m!149547 () Bool)

(assert (=> b!127948 m!149547))

(assert (=> b!127948 m!149547))

(declare-fun m!149549 () Bool)

(assert (=> b!127948 m!149549))

(declare-fun m!149551 () Bool)

(assert (=> b!127954 m!149551))

(declare-fun m!149553 () Bool)

(assert (=> b!127952 m!149553))

(declare-fun m!149555 () Bool)

(assert (=> b!127952 m!149555))

(declare-fun m!149557 () Bool)

(assert (=> b!127952 m!149557))

(assert (=> b!127952 m!149547))

(declare-fun m!149559 () Bool)

(assert (=> b!127952 m!149559))

(declare-fun m!149561 () Bool)

(assert (=> b!127952 m!149561))

(declare-fun m!149563 () Bool)

(assert (=> b!127952 m!149563))

(declare-fun m!149565 () Bool)

(assert (=> b!127952 m!149565))

(assert (=> b!127952 m!149563))

(declare-fun m!149567 () Bool)

(assert (=> b!127952 m!149567))

(declare-fun m!149569 () Bool)

(assert (=> b!127952 m!149569))

(assert (=> b!127952 m!149567))

(declare-fun m!149571 () Bool)

(assert (=> b!127952 m!149571))

(declare-fun m!149573 () Bool)

(assert (=> b!127952 m!149573))

(declare-fun m!149575 () Bool)

(assert (=> b!127952 m!149575))

(declare-fun m!149577 () Bool)

(assert (=> b!127952 m!149577))

(assert (=> b!127952 m!149561))

(declare-fun m!149579 () Bool)

(assert (=> b!127952 m!149579))

(declare-fun m!149581 () Bool)

(assert (=> b!127952 m!149581))

(declare-fun m!149583 () Bool)

(assert (=> b!127952 m!149583))

(assert (=> b!127952 m!149573))

(assert (=> b!127951 m!149547))

(assert (=> b!127951 m!149547))

(declare-fun m!149585 () Bool)

(assert (=> b!127951 m!149585))

(declare-fun m!149587 () Bool)

(assert (=> bm!13832 m!149587))

(declare-fun m!149589 () Bool)

(assert (=> bm!13831 m!149589))

(declare-fun m!149591 () Bool)

(assert (=> b!127943 m!149591))

(declare-fun m!149593 () Bool)

(assert (=> b!127943 m!149593))

(assert (=> b!127943 m!149547))

(assert (=> b!127943 m!149547))

(declare-fun m!149595 () Bool)

(assert (=> b!127943 m!149595))

(assert (=> b!127943 m!149591))

(assert (=> b!127943 m!149593))

(declare-fun m!149597 () Bool)

(assert (=> b!127943 m!149597))

(declare-fun m!149599 () Bool)

(assert (=> d!38595 m!149599))

(assert (=> b!127949 m!149547))

(assert (=> b!127949 m!149547))

(assert (=> b!127949 m!149549))

(assert (=> bm!13834 m!149553))

(declare-fun m!149601 () Bool)

(assert (=> b!127940 m!149601))

(declare-fun m!149603 () Bool)

(assert (=> b!127953 m!149603))

(assert (=> bm!13790 d!38595))

(declare-fun d!38597 () Bool)

(declare-fun e!83573 () Bool)

(assert (=> d!38597 e!83573))

(declare-fun res!61812 () Bool)

(assert (=> d!38597 (=> res!61812 e!83573)))

(declare-fun lt!66183 () Bool)

(assert (=> d!38597 (= res!61812 (not lt!66183))))

(declare-fun lt!66186 () Bool)

(assert (=> d!38597 (= lt!66183 lt!66186)))

(declare-fun lt!66185 () Unit!3981)

(declare-fun e!83572 () Unit!3981)

(assert (=> d!38597 (= lt!66185 e!83572)))

(declare-fun c!23429 () Bool)

(assert (=> d!38597 (= c!23429 lt!66186)))

(assert (=> d!38597 (= lt!66186 (containsKey!172 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38597 (= (contains!884 lt!66157 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66183)))

(declare-fun b!127960 () Bool)

(declare-fun lt!66184 () Unit!3981)

(assert (=> b!127960 (= e!83572 lt!66184)))

(assert (=> b!127960 (= lt!66184 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!127960 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!127961 () Bool)

(declare-fun Unit!3988 () Unit!3981)

(assert (=> b!127961 (= e!83572 Unit!3988)))

(declare-fun b!127962 () Bool)

(assert (=> b!127962 (= e!83573 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38597 c!23429) b!127960))

(assert (= (and d!38597 (not c!23429)) b!127961))

(assert (= (and d!38597 (not res!61812)) b!127962))

(assert (=> d!38597 m!149485))

(declare-fun m!149605 () Bool)

(assert (=> d!38597 m!149605))

(assert (=> b!127960 m!149485))

(declare-fun m!149607 () Bool)

(assert (=> b!127960 m!149607))

(assert (=> b!127960 m!149485))

(declare-fun m!149609 () Bool)

(assert (=> b!127960 m!149609))

(assert (=> b!127960 m!149609))

(declare-fun m!149611 () Bool)

(assert (=> b!127960 m!149611))

(assert (=> b!127962 m!149485))

(assert (=> b!127962 m!149609))

(assert (=> b!127962 m!149609))

(assert (=> b!127962 m!149611))

(assert (=> b!127920 d!38597))

(declare-fun b!127975 () Bool)

(declare-fun e!83582 () SeekEntryResult!271)

(declare-fun lt!66195 () SeekEntryResult!271)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4725 (_ BitVec 32)) SeekEntryResult!271)

(assert (=> b!127975 (= e!83582 (seekKeyOrZeroReturnVacant!0 (x!15122 lt!66195) (index!3242 lt!66195) (index!3242 lt!66195) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!127976 () Bool)

(assert (=> b!127976 (= e!83582 (MissingZero!271 (index!3242 lt!66195)))))

(declare-fun d!38599 () Bool)

(declare-fun lt!66193 () SeekEntryResult!271)

(assert (=> d!38599 (and (or ((_ is Undefined!271) lt!66193) (not ((_ is Found!271) lt!66193)) (and (bvsge (index!3241 lt!66193) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66193) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66193) ((_ is Found!271) lt!66193) (not ((_ is MissingZero!271) lt!66193)) (and (bvsge (index!3240 lt!66193) #b00000000000000000000000000000000) (bvslt (index!3240 lt!66193) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66193) ((_ is Found!271) lt!66193) ((_ is MissingZero!271) lt!66193) (not ((_ is MissingVacant!271) lt!66193)) (and (bvsge (index!3243 lt!66193) #b00000000000000000000000000000000) (bvslt (index!3243 lt!66193) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66193) (ite ((_ is Found!271) lt!66193) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66193)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite ((_ is MissingZero!271) lt!66193) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!271) lt!66193) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!83581 () SeekEntryResult!271)

(assert (=> d!38599 (= lt!66193 e!83581)))

(declare-fun c!23437 () Bool)

(assert (=> d!38599 (= c!23437 (and ((_ is Intermediate!271) lt!66195) (undefined!1083 lt!66195)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4725 (_ BitVec 32)) SeekEntryResult!271)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!38599 (= lt!66195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(assert (=> d!38599 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38599 (= (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)) lt!66193)))

(declare-fun b!127977 () Bool)

(declare-fun e!83580 () SeekEntryResult!271)

(assert (=> b!127977 (= e!83580 (Found!271 (index!3242 lt!66195)))))

(declare-fun b!127978 () Bool)

(assert (=> b!127978 (= e!83581 Undefined!271)))

(declare-fun b!127979 () Bool)

(assert (=> b!127979 (= e!83581 e!83580)))

(declare-fun lt!66194 () (_ BitVec 64))

(assert (=> b!127979 (= lt!66194 (select (arr!2237 (_keys!4542 newMap!16)) (index!3242 lt!66195)))))

(declare-fun c!23436 () Bool)

(assert (=> b!127979 (= c!23436 (= lt!66194 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!127980 () Bool)

(declare-fun c!23438 () Bool)

(assert (=> b!127980 (= c!23438 (= lt!66194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127980 (= e!83580 e!83582)))

(assert (= (and d!38599 c!23437) b!127978))

(assert (= (and d!38599 (not c!23437)) b!127979))

(assert (= (and b!127979 c!23436) b!127977))

(assert (= (and b!127979 (not c!23436)) b!127980))

(assert (= (and b!127980 c!23438) b!127976))

(assert (= (and b!127980 (not c!23438)) b!127975))

(assert (=> b!127975 m!149355))

(declare-fun m!149613 () Bool)

(assert (=> b!127975 m!149613))

(assert (=> d!38599 m!149599))

(declare-fun m!149615 () Bool)

(assert (=> d!38599 m!149615))

(assert (=> d!38599 m!149355))

(declare-fun m!149617 () Bool)

(assert (=> d!38599 m!149617))

(declare-fun m!149619 () Bool)

(assert (=> d!38599 m!149619))

(assert (=> d!38599 m!149355))

(assert (=> d!38599 m!149615))

(declare-fun m!149621 () Bool)

(assert (=> d!38599 m!149621))

(declare-fun m!149623 () Bool)

(assert (=> d!38599 m!149623))

(declare-fun m!149625 () Bool)

(assert (=> b!127979 m!149625))

(assert (=> bm!13791 d!38599))

(declare-fun d!38601 () Bool)

(declare-fun isEmpty!399 (Option!174) Bool)

(assert (=> d!38601 (= (isDefined!121 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) (not (isEmpty!399 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun bs!5294 () Bool)

(assert (= bs!5294 d!38601))

(assert (=> bs!5294 m!149419))

(declare-fun m!149627 () Bool)

(assert (=> bs!5294 m!149627))

(assert (=> b!127733 d!38601))

(declare-fun d!38603 () Bool)

(declare-fun c!23443 () Bool)

(assert (=> d!38603 (= c!23443 (and ((_ is Cons!1700) (toList!861 lt!65992)) (= (_1!1309 (h!2303 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun e!83587 () Option!174)

(assert (=> d!38603 (= (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!83587)))

(declare-fun b!127990 () Bool)

(declare-fun e!83588 () Option!174)

(assert (=> b!127990 (= e!83587 e!83588)))

(declare-fun c!23444 () Bool)

(assert (=> b!127990 (= c!23444 (and ((_ is Cons!1700) (toList!861 lt!65992)) (not (= (_1!1309 (h!2303 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun b!127991 () Bool)

(assert (=> b!127991 (= e!83588 (getValueByKey!168 (t!6083 (toList!861 lt!65992)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!127992 () Bool)

(assert (=> b!127992 (= e!83588 None!172)))

(declare-fun b!127989 () Bool)

(assert (=> b!127989 (= e!83587 (Some!173 (_2!1309 (h!2303 (toList!861 lt!65992)))))))

(assert (= (and d!38603 c!23443) b!127989))

(assert (= (and d!38603 (not c!23443)) b!127990))

(assert (= (and b!127990 c!23444) b!127991))

(assert (= (and b!127990 (not c!23444)) b!127992))

(assert (=> b!127991 m!149355))

(declare-fun m!149629 () Bool)

(assert (=> b!127991 m!149629))

(assert (=> b!127733 d!38603))

(declare-fun d!38605 () Bool)

(assert (=> d!38605 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66198 () Unit!3981)

(declare-fun choose!773 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 V!3451 Int) Unit!3981)

(assert (=> d!38605 (= lt!66198 (choose!773 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66084 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38605 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38605 (= (lemmaChangeZeroKeyThenAddPairToListMap!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66084 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) (defaultEntry!2805 newMap!16)) lt!66198)))

(declare-fun bs!5295 () Bool)

(assert (= bs!5295 d!38605))

(assert (=> bs!5295 m!149437))

(declare-fun m!149631 () Bool)

(assert (=> bs!5295 m!149631))

(assert (=> bs!5295 m!149599))

(assert (=> bs!5295 m!149353))

(declare-fun m!149633 () Bool)

(assert (=> bs!5295 m!149633))

(assert (=> bs!5295 m!149353))

(declare-fun m!149635 () Bool)

(assert (=> bs!5295 m!149635))

(assert (=> bs!5295 m!149437))

(assert (=> b!127844 d!38605))

(declare-fun b!128009 () Bool)

(declare-fun e!83600 () Bool)

(declare-fun e!83599 () Bool)

(assert (=> b!128009 (= e!83600 e!83599)))

(declare-fun res!61822 () Bool)

(declare-fun call!13845 () Bool)

(assert (=> b!128009 (= res!61822 call!13845)))

(assert (=> b!128009 (=> (not res!61822) (not e!83599))))

(declare-fun b!128010 () Bool)

(declare-fun lt!66203 () SeekEntryResult!271)

(assert (=> b!128010 (and (bvsge (index!3240 lt!66203) #b00000000000000000000000000000000) (bvslt (index!3240 lt!66203) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun res!61823 () Bool)

(assert (=> b!128010 (= res!61823 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66203)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128010 (=> (not res!61823) (not e!83599))))

(declare-fun b!128011 () Bool)

(declare-fun res!61824 () Bool)

(declare-fun e!83597 () Bool)

(assert (=> b!128011 (=> (not res!61824) (not e!83597))))

(assert (=> b!128011 (= res!61824 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66203)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128011 (and (bvsge (index!3243 lt!66203) #b00000000000000000000000000000000) (bvslt (index!3243 lt!66203) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun d!38607 () Bool)

(assert (=> d!38607 e!83600))

(declare-fun c!23450 () Bool)

(assert (=> d!38607 (= c!23450 ((_ is MissingZero!271) lt!66203))))

(assert (=> d!38607 (= lt!66203 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun lt!66204 () Unit!3981)

(declare-fun choose!774 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 64) Int) Unit!3981)

(assert (=> d!38607 (= lt!66204 (choose!774 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38607 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38607 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)) lt!66204)))

(declare-fun call!13844 () Bool)

(declare-fun bm!13841 () Bool)

(assert (=> bm!13841 (= call!13844 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128012 () Bool)

(assert (=> b!128012 (= e!83597 (not call!13844))))

(declare-fun b!128013 () Bool)

(assert (=> b!128013 (= e!83599 (not call!13844))))

(declare-fun b!128014 () Bool)

(declare-fun e!83598 () Bool)

(assert (=> b!128014 (= e!83598 ((_ is Undefined!271) lt!66203))))

(declare-fun bm!13842 () Bool)

(assert (=> bm!13842 (= call!13845 (inRange!0 (ite c!23450 (index!3240 lt!66203) (index!3243 lt!66203)) (mask!7073 newMap!16)))))

(declare-fun b!128015 () Bool)

(declare-fun res!61821 () Bool)

(assert (=> b!128015 (=> (not res!61821) (not e!83597))))

(assert (=> b!128015 (= res!61821 call!13845)))

(assert (=> b!128015 (= e!83598 e!83597)))

(declare-fun b!128016 () Bool)

(assert (=> b!128016 (= e!83600 e!83598)))

(declare-fun c!23449 () Bool)

(assert (=> b!128016 (= c!23449 ((_ is MissingVacant!271) lt!66203))))

(assert (= (and d!38607 c!23450) b!128009))

(assert (= (and d!38607 (not c!23450)) b!128016))

(assert (= (and b!128009 res!61822) b!128010))

(assert (= (and b!128010 res!61823) b!128013))

(assert (= (and b!128016 c!23449) b!128015))

(assert (= (and b!128016 (not c!23449)) b!128014))

(assert (= (and b!128015 res!61821) b!128011))

(assert (= (and b!128011 res!61824) b!128012))

(assert (= (or b!128009 b!128015) bm!13842))

(assert (= (or b!128013 b!128012) bm!13841))

(declare-fun m!149637 () Bool)

(assert (=> bm!13842 m!149637))

(assert (=> d!38607 m!149355))

(assert (=> d!38607 m!149427))

(assert (=> d!38607 m!149355))

(declare-fun m!149639 () Bool)

(assert (=> d!38607 m!149639))

(assert (=> d!38607 m!149599))

(declare-fun m!149641 () Bool)

(assert (=> b!128011 m!149641))

(declare-fun m!149643 () Bool)

(assert (=> b!128010 m!149643))

(assert (=> bm!13841 m!149355))

(assert (=> bm!13841 m!149445))

(assert (=> bm!13792 d!38607))

(declare-fun b!128041 () Bool)

(declare-fun e!83617 () Bool)

(declare-fun e!83619 () Bool)

(assert (=> b!128041 (= e!83617 e!83619)))

(declare-fun c!23462 () Bool)

(declare-fun e!83621 () Bool)

(assert (=> b!128041 (= c!23462 e!83621)))

(declare-fun res!61833 () Bool)

(assert (=> b!128041 (=> (not res!61833) (not e!83621))))

(assert (=> b!128041 (= res!61833 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128042 () Bool)

(declare-fun e!83616 () Bool)

(assert (=> b!128042 (= e!83619 e!83616)))

(declare-fun c!23460 () Bool)

(assert (=> b!128042 (= c!23460 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128043 () Bool)

(assert (=> b!128043 (= e!83621 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128043 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!128044 () Bool)

(declare-fun e!83620 () ListLongMap!1691)

(declare-fun call!13848 () ListLongMap!1691)

(assert (=> b!128044 (= e!83620 call!13848)))

(declare-fun b!128045 () Bool)

(declare-fun lt!66223 () Unit!3981)

(declare-fun lt!66222 () Unit!3981)

(assert (=> b!128045 (= lt!66223 lt!66222)))

(declare-fun lt!66220 () V!3451)

(declare-fun lt!66224 () (_ BitVec 64))

(declare-fun lt!66225 () (_ BitVec 64))

(declare-fun lt!66221 () ListLongMap!1691)

(assert (=> b!128045 (not (contains!884 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220)) lt!66224))))

(declare-fun addStillNotContains!57 (ListLongMap!1691 (_ BitVec 64) V!3451 (_ BitVec 64)) Unit!3981)

(assert (=> b!128045 (= lt!66222 (addStillNotContains!57 lt!66221 lt!66225 lt!66220 lt!66224))))

(assert (=> b!128045 (= lt!66224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128045 (= lt!66220 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128045 (= lt!66225 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!128045 (= lt!66221 call!13848)))

(assert (=> b!128045 (= e!83620 (+!171 call!13848 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128046 () Bool)

(declare-fun e!83618 () ListLongMap!1691)

(assert (=> b!128046 (= e!83618 e!83620)))

(declare-fun c!23461 () Bool)

(assert (=> b!128046 (= c!23461 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13845 () Bool)

(assert (=> bm!13845 (= call!13848 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!128047 () Bool)

(declare-fun e!83615 () Bool)

(assert (=> b!128047 (= e!83619 e!83615)))

(assert (=> b!128047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun lt!66219 () ListLongMap!1691)

(declare-fun res!61836 () Bool)

(assert (=> b!128047 (= res!61836 (contains!884 lt!66219 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128047 (=> (not res!61836) (not e!83615))))

(declare-fun b!128048 () Bool)

(assert (=> b!128048 (= e!83618 (ListLongMap!1692 Nil!1701))))

(declare-fun b!128049 () Bool)

(assert (=> b!128049 (= e!83616 (= lt!66219 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun d!38609 () Bool)

(assert (=> d!38609 e!83617))

(declare-fun res!61834 () Bool)

(assert (=> d!38609 (=> (not res!61834) (not e!83617))))

(assert (=> d!38609 (= res!61834 (not (contains!884 lt!66219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38609 (= lt!66219 e!83618)))

(declare-fun c!23459 () Bool)

(assert (=> d!38609 (= c!23459 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!38609 (validMask!0 (mask!7073 (v!3146 (underlying!445 thiss!992))))))

(assert (=> d!38609 (= (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))) lt!66219)))

(declare-fun b!128050 () Bool)

(declare-fun isEmpty!400 (ListLongMap!1691) Bool)

(assert (=> b!128050 (= e!83616 (isEmpty!400 lt!66219))))

(declare-fun b!128051 () Bool)

(declare-fun res!61835 () Bool)

(assert (=> b!128051 (=> (not res!61835) (not e!83617))))

(assert (=> b!128051 (= res!61835 (not (contains!884 lt!66219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128052 () Bool)

(assert (=> b!128052 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> b!128052 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> b!128052 (= e!83615 (= (apply!112 lt!66219 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38609 c!23459) b!128048))

(assert (= (and d!38609 (not c!23459)) b!128046))

(assert (= (and b!128046 c!23461) b!128045))

(assert (= (and b!128046 (not c!23461)) b!128044))

(assert (= (or b!128045 b!128044) bm!13845))

(assert (= (and d!38609 res!61834) b!128051))

(assert (= (and b!128051 res!61835) b!128041))

(assert (= (and b!128041 res!61833) b!128043))

(assert (= (and b!128041 c!23462) b!128047))

(assert (= (and b!128041 (not c!23462)) b!128042))

(assert (= (and b!128047 res!61836) b!128052))

(assert (= (and b!128042 c!23460) b!128049))

(assert (= (and b!128042 (not c!23460)) b!128050))

(declare-fun b_lambda!5657 () Bool)

(assert (=> (not b_lambda!5657) (not b!128045)))

(assert (=> b!128045 t!6080))

(declare-fun b_and!7907 () Bool)

(assert (= b_and!7903 (and (=> t!6080 result!3879) b_and!7907)))

(assert (=> b!128045 t!6082))

(declare-fun b_and!7909 () Bool)

(assert (= b_and!7905 (and (=> t!6082 result!3883) b_and!7909)))

(declare-fun b_lambda!5659 () Bool)

(assert (=> (not b_lambda!5659) (not b!128052)))

(assert (=> b!128052 t!6080))

(declare-fun b_and!7911 () Bool)

(assert (= b_and!7907 (and (=> t!6080 result!3879) b_and!7911)))

(assert (=> b!128052 t!6082))

(declare-fun b_and!7913 () Bool)

(assert (= b_and!7909 (and (=> t!6082 result!3883) b_and!7913)))

(declare-fun m!149645 () Bool)

(assert (=> b!128050 m!149645))

(assert (=> b!128052 m!149485))

(declare-fun m!149647 () Bool)

(assert (=> b!128052 m!149647))

(assert (=> b!128052 m!149529))

(assert (=> b!128052 m!149529))

(assert (=> b!128052 m!149351))

(assert (=> b!128052 m!149533))

(assert (=> b!128052 m!149485))

(assert (=> b!128052 m!149351))

(declare-fun m!149649 () Bool)

(assert (=> b!128049 m!149649))

(declare-fun m!149651 () Bool)

(assert (=> b!128045 m!149651))

(declare-fun m!149653 () Bool)

(assert (=> b!128045 m!149653))

(assert (=> b!128045 m!149529))

(assert (=> b!128045 m!149529))

(assert (=> b!128045 m!149351))

(assert (=> b!128045 m!149533))

(declare-fun m!149655 () Bool)

(assert (=> b!128045 m!149655))

(assert (=> b!128045 m!149485))

(assert (=> b!128045 m!149351))

(assert (=> b!128045 m!149651))

(declare-fun m!149657 () Bool)

(assert (=> b!128045 m!149657))

(assert (=> b!128046 m!149485))

(assert (=> b!128046 m!149485))

(assert (=> b!128046 m!149487))

(assert (=> b!128047 m!149485))

(assert (=> b!128047 m!149485))

(declare-fun m!149659 () Bool)

(assert (=> b!128047 m!149659))

(declare-fun m!149661 () Bool)

(assert (=> d!38609 m!149661))

(assert (=> d!38609 m!149339))

(declare-fun m!149663 () Bool)

(assert (=> b!128051 m!149663))

(assert (=> b!128043 m!149485))

(assert (=> b!128043 m!149485))

(assert (=> b!128043 m!149487))

(assert (=> bm!13845 m!149649))

(assert (=> bm!13827 d!38609))

(declare-fun b!128053 () Bool)

(declare-fun e!83622 () Unit!3981)

(declare-fun Unit!3989 () Unit!3981)

(assert (=> b!128053 (= e!83622 Unit!3989)))

(declare-fun b!128054 () Bool)

(declare-fun e!83629 () Bool)

(declare-fun lt!66244 () ListLongMap!1691)

(assert (=> b!128054 (= e!83629 (= (apply!112 lt!66244 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!128055 () Bool)

(declare-fun res!61837 () Bool)

(declare-fun e!83625 () Bool)

(assert (=> b!128055 (=> (not res!61837) (not e!83625))))

(declare-fun e!83627 () Bool)

(assert (=> b!128055 (= res!61837 e!83627)))

(declare-fun c!23465 () Bool)

(assert (=> b!128055 (= c!23465 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128056 () Bool)

(declare-fun e!83624 () Bool)

(declare-fun e!83626 () Bool)

(assert (=> b!128056 (= e!83624 e!83626)))

(declare-fun res!61841 () Bool)

(declare-fun call!13851 () Bool)

(assert (=> b!128056 (= res!61841 call!13851)))

(assert (=> b!128056 (=> (not res!61841) (not e!83626))))

(declare-fun b!128057 () Bool)

(declare-fun e!83628 () Bool)

(assert (=> b!128057 (= e!83628 (= (apply!112 lt!66244 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (_values!2788 newMap!16))))))

(assert (=> b!128057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13846 () Bool)

(declare-fun call!13855 () ListLongMap!1691)

(declare-fun call!13853 () ListLongMap!1691)

(assert (=> bm!13846 (= call!13855 call!13853)))

(declare-fun b!128058 () Bool)

(declare-fun e!83632 () ListLongMap!1691)

(declare-fun call!13849 () ListLongMap!1691)

(assert (=> b!128058 (= e!83632 call!13849)))

(declare-fun b!128059 () Bool)

(assert (=> b!128059 (= e!83624 (not call!13851))))

(declare-fun bm!13847 () Bool)

(declare-fun call!13852 () ListLongMap!1691)

(declare-fun c!23463 () Bool)

(declare-fun c!23467 () Bool)

(assert (=> bm!13847 (= call!13852 (+!171 (ite c!23463 call!13853 (ite c!23467 call!13855 call!13849)) (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!128060 () Bool)

(declare-fun call!13854 () Bool)

(assert (=> b!128060 (= e!83627 (not call!13854))))

(declare-fun b!128061 () Bool)

(declare-fun e!83630 () ListLongMap!1691)

(declare-fun call!13850 () ListLongMap!1691)

(assert (=> b!128061 (= e!83630 call!13850)))

(declare-fun b!128062 () Bool)

(declare-fun e!83634 () Bool)

(assert (=> b!128062 (= e!83634 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128064 () Bool)

(declare-fun c!23468 () Bool)

(assert (=> b!128064 (= c!23468 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128064 (= e!83630 e!83632)))

(declare-fun bm!13848 () Bool)

(assert (=> bm!13848 (= call!13851 (contains!884 lt!66244 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128065 () Bool)

(declare-fun e!83633 () Bool)

(assert (=> b!128065 (= e!83633 e!83628)))

(declare-fun res!61842 () Bool)

(assert (=> b!128065 (=> (not res!61842) (not e!83628))))

(assert (=> b!128065 (= res!61842 (contains!884 lt!66244 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13849 () Bool)

(assert (=> bm!13849 (= call!13850 call!13852)))

(declare-fun bm!13850 () Bool)

(assert (=> bm!13850 (= call!13853 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128066 () Bool)

(declare-fun lt!66230 () Unit!3981)

(assert (=> b!128066 (= e!83622 lt!66230)))

(declare-fun lt!66247 () ListLongMap!1691)

(assert (=> b!128066 (= lt!66247 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66241 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66236 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66236 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66227 () Unit!3981)

(assert (=> b!128066 (= lt!66227 (addStillContains!88 lt!66247 lt!66241 (zeroValue!2666 newMap!16) lt!66236))))

(assert (=> b!128066 (contains!884 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))) lt!66236)))

(declare-fun lt!66233 () Unit!3981)

(assert (=> b!128066 (= lt!66233 lt!66227)))

(declare-fun lt!66245 () ListLongMap!1691)

(assert (=> b!128066 (= lt!66245 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66231 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66226 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66226 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66229 () Unit!3981)

(assert (=> b!128066 (= lt!66229 (addApplyDifferent!88 lt!66245 lt!66231 (minValue!2666 newMap!16) lt!66226))))

(assert (=> b!128066 (= (apply!112 (+!171 lt!66245 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))) lt!66226) (apply!112 lt!66245 lt!66226))))

(declare-fun lt!66238 () Unit!3981)

(assert (=> b!128066 (= lt!66238 lt!66229)))

(declare-fun lt!66228 () ListLongMap!1691)

(assert (=> b!128066 (= lt!66228 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66237 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66243 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66243 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66235 () Unit!3981)

(assert (=> b!128066 (= lt!66235 (addApplyDifferent!88 lt!66228 lt!66237 (zeroValue!2666 newMap!16) lt!66243))))

(assert (=> b!128066 (= (apply!112 (+!171 lt!66228 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))) lt!66243) (apply!112 lt!66228 lt!66243))))

(declare-fun lt!66246 () Unit!3981)

(assert (=> b!128066 (= lt!66246 lt!66235)))

(declare-fun lt!66240 () ListLongMap!1691)

(assert (=> b!128066 (= lt!66240 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66239 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66239 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66234 () (_ BitVec 64))

(assert (=> b!128066 (= lt!66234 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128066 (= lt!66230 (addApplyDifferent!88 lt!66240 lt!66239 (minValue!2666 newMap!16) lt!66234))))

(assert (=> b!128066 (= (apply!112 (+!171 lt!66240 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))) lt!66234) (apply!112 lt!66240 lt!66234))))

(declare-fun b!128067 () Bool)

(assert (=> b!128067 (= e!83626 (= (apply!112 lt!66244 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!128068 () Bool)

(declare-fun e!83631 () ListLongMap!1691)

(assert (=> b!128068 (= e!83631 (+!171 call!13852 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!128069 () Bool)

(assert (=> b!128069 (= e!83625 e!83624)))

(declare-fun c!23466 () Bool)

(assert (=> b!128069 (= c!23466 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128070 () Bool)

(declare-fun res!61843 () Bool)

(assert (=> b!128070 (=> (not res!61843) (not e!83625))))

(assert (=> b!128070 (= res!61843 e!83633)))

(declare-fun res!61839 () Bool)

(assert (=> b!128070 (=> res!61839 e!83633)))

(declare-fun e!83623 () Bool)

(assert (=> b!128070 (= res!61839 (not e!83623))))

(declare-fun res!61844 () Bool)

(assert (=> b!128070 (=> (not res!61844) (not e!83623))))

(assert (=> b!128070 (= res!61844 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128071 () Bool)

(assert (=> b!128071 (= e!83631 e!83630)))

(assert (=> b!128071 (= c!23467 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13851 () Bool)

(assert (=> bm!13851 (= call!13849 call!13855)))

(declare-fun b!128072 () Bool)

(assert (=> b!128072 (= e!83632 call!13850)))

(declare-fun b!128063 () Bool)

(assert (=> b!128063 (= e!83623 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38611 () Bool)

(assert (=> d!38611 e!83625))

(declare-fun res!61840 () Bool)

(assert (=> d!38611 (=> (not res!61840) (not e!83625))))

(assert (=> d!38611 (= res!61840 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66232 () ListLongMap!1691)

(assert (=> d!38611 (= lt!66244 lt!66232)))

(declare-fun lt!66242 () Unit!3981)

(assert (=> d!38611 (= lt!66242 e!83622)))

(declare-fun c!23464 () Bool)

(assert (=> d!38611 (= c!23464 e!83634)))

(declare-fun res!61838 () Bool)

(assert (=> d!38611 (=> (not res!61838) (not e!83634))))

(assert (=> d!38611 (= res!61838 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38611 (= lt!66232 e!83631)))

(assert (=> d!38611 (= c!23463 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38611 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38611 (= (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66244)))

(declare-fun b!128073 () Bool)

(assert (=> b!128073 (= e!83627 e!83629)))

(declare-fun res!61845 () Bool)

(assert (=> b!128073 (= res!61845 call!13854)))

(assert (=> b!128073 (=> (not res!61845) (not e!83629))))

(declare-fun bm!13852 () Bool)

(assert (=> bm!13852 (= call!13854 (contains!884 lt!66244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38611 c!23463) b!128068))

(assert (= (and d!38611 (not c!23463)) b!128071))

(assert (= (and b!128071 c!23467) b!128061))

(assert (= (and b!128071 (not c!23467)) b!128064))

(assert (= (and b!128064 c!23468) b!128072))

(assert (= (and b!128064 (not c!23468)) b!128058))

(assert (= (or b!128072 b!128058) bm!13851))

(assert (= (or b!128061 bm!13851) bm!13846))

(assert (= (or b!128061 b!128072) bm!13849))

(assert (= (or b!128068 bm!13846) bm!13850))

(assert (= (or b!128068 bm!13849) bm!13847))

(assert (= (and d!38611 res!61838) b!128062))

(assert (= (and d!38611 c!23464) b!128066))

(assert (= (and d!38611 (not c!23464)) b!128053))

(assert (= (and d!38611 res!61840) b!128070))

(assert (= (and b!128070 res!61844) b!128063))

(assert (= (and b!128070 (not res!61839)) b!128065))

(assert (= (and b!128065 res!61842) b!128057))

(assert (= (and b!128070 res!61843) b!128055))

(assert (= (and b!128055 c!23465) b!128073))

(assert (= (and b!128055 (not c!23465)) b!128060))

(assert (= (and b!128073 res!61845) b!128054))

(assert (= (or b!128073 b!128060) bm!13852))

(assert (= (and b!128055 res!61837) b!128069))

(assert (= (and b!128069 c!23466) b!128056))

(assert (= (and b!128069 (not c!23466)) b!128059))

(assert (= (and b!128056 res!61841) b!128067))

(assert (= (or b!128056 b!128059) bm!13848))

(declare-fun b_lambda!5661 () Bool)

(assert (=> (not b_lambda!5661) (not b!128057)))

(assert (=> b!128057 t!6091))

(declare-fun b_and!7915 () Bool)

(assert (= b_and!7911 (and (=> t!6091 result!3893) b_and!7915)))

(assert (=> b!128057 t!6093))

(declare-fun b_and!7917 () Bool)

(assert (= b_and!7913 (and (=> t!6093 result!3895) b_and!7917)))

(declare-fun m!149665 () Bool)

(assert (=> bm!13852 m!149665))

(assert (=> b!128062 m!149547))

(assert (=> b!128062 m!149547))

(assert (=> b!128062 m!149549))

(declare-fun m!149667 () Bool)

(assert (=> b!128068 m!149667))

(declare-fun m!149669 () Bool)

(assert (=> b!128066 m!149669))

(declare-fun m!149671 () Bool)

(assert (=> b!128066 m!149671))

(declare-fun m!149673 () Bool)

(assert (=> b!128066 m!149673))

(assert (=> b!128066 m!149547))

(declare-fun m!149675 () Bool)

(assert (=> b!128066 m!149675))

(declare-fun m!149677 () Bool)

(assert (=> b!128066 m!149677))

(declare-fun m!149679 () Bool)

(assert (=> b!128066 m!149679))

(declare-fun m!149681 () Bool)

(assert (=> b!128066 m!149681))

(assert (=> b!128066 m!149679))

(declare-fun m!149683 () Bool)

(assert (=> b!128066 m!149683))

(declare-fun m!149685 () Bool)

(assert (=> b!128066 m!149685))

(assert (=> b!128066 m!149683))

(declare-fun m!149687 () Bool)

(assert (=> b!128066 m!149687))

(declare-fun m!149689 () Bool)

(assert (=> b!128066 m!149689))

(declare-fun m!149691 () Bool)

(assert (=> b!128066 m!149691))

(declare-fun m!149693 () Bool)

(assert (=> b!128066 m!149693))

(assert (=> b!128066 m!149677))

(declare-fun m!149695 () Bool)

(assert (=> b!128066 m!149695))

(declare-fun m!149697 () Bool)

(assert (=> b!128066 m!149697))

(declare-fun m!149699 () Bool)

(assert (=> b!128066 m!149699))

(assert (=> b!128066 m!149689))

(assert (=> b!128065 m!149547))

(assert (=> b!128065 m!149547))

(declare-fun m!149701 () Bool)

(assert (=> b!128065 m!149701))

(declare-fun m!149703 () Bool)

(assert (=> bm!13848 m!149703))

(declare-fun m!149705 () Bool)

(assert (=> bm!13847 m!149705))

(declare-fun m!149707 () Bool)

(assert (=> b!128057 m!149707))

(assert (=> b!128057 m!149593))

(assert (=> b!128057 m!149547))

(assert (=> b!128057 m!149547))

(declare-fun m!149709 () Bool)

(assert (=> b!128057 m!149709))

(assert (=> b!128057 m!149707))

(assert (=> b!128057 m!149593))

(declare-fun m!149711 () Bool)

(assert (=> b!128057 m!149711))

(assert (=> d!38611 m!149599))

(assert (=> b!128063 m!149547))

(assert (=> b!128063 m!149547))

(assert (=> b!128063 m!149549))

(assert (=> bm!13850 m!149669))

(declare-fun m!149713 () Bool)

(assert (=> b!128054 m!149713))

(declare-fun m!149715 () Bool)

(assert (=> b!128067 m!149715))

(assert (=> b!127845 d!38611))

(declare-fun d!38613 () Bool)

(assert (=> d!38613 (= (apply!112 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66147) (apply!112 lt!66153 lt!66147))))

(declare-fun lt!66250 () Unit!3981)

(declare-fun choose!775 (ListLongMap!1691 (_ BitVec 64) V!3451 (_ BitVec 64)) Unit!3981)

(assert (=> d!38613 (= lt!66250 (choose!775 lt!66153 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66147))))

(declare-fun e!83637 () Bool)

(assert (=> d!38613 e!83637))

(declare-fun res!61848 () Bool)

(assert (=> d!38613 (=> (not res!61848) (not e!83637))))

(assert (=> d!38613 (= res!61848 (contains!884 lt!66153 lt!66147))))

(assert (=> d!38613 (= (addApplyDifferent!88 lt!66153 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66147) lt!66250)))

(declare-fun b!128077 () Bool)

(assert (=> b!128077 (= e!83637 (not (= lt!66147 lt!66152)))))

(assert (= (and d!38613 res!61848) b!128077))

(declare-fun m!149717 () Bool)

(assert (=> d!38613 m!149717))

(assert (=> d!38613 m!149493))

(assert (=> d!38613 m!149499))

(declare-fun m!149719 () Bool)

(assert (=> d!38613 m!149719))

(assert (=> d!38613 m!149499))

(assert (=> d!38613 m!149517))

(assert (=> b!127921 d!38613))

(declare-fun d!38615 () Bool)

(declare-fun get!1459 (Option!174) V!3451)

(assert (=> d!38615 (= (apply!112 lt!66153 lt!66147) (get!1459 (getValueByKey!168 (toList!861 lt!66153) lt!66147)))))

(declare-fun bs!5296 () Bool)

(assert (= bs!5296 d!38615))

(declare-fun m!149721 () Bool)

(assert (=> bs!5296 m!149721))

(assert (=> bs!5296 m!149721))

(declare-fun m!149723 () Bool)

(assert (=> bs!5296 m!149723))

(assert (=> b!127921 d!38615))

(declare-fun d!38617 () Bool)

(assert (=> d!38617 (= (apply!112 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66147) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66147)))))

(declare-fun bs!5297 () Bool)

(assert (= bs!5297 d!38617))

(declare-fun m!149725 () Bool)

(assert (=> bs!5297 m!149725))

(assert (=> bs!5297 m!149725))

(declare-fun m!149727 () Bool)

(assert (=> bs!5297 m!149727))

(assert (=> b!127921 d!38617))

(declare-fun d!38619 () Bool)

(assert (=> d!38619 (contains!884 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66149)))

(declare-fun lt!66253 () Unit!3981)

(declare-fun choose!776 (ListLongMap!1691 (_ BitVec 64) V!3451 (_ BitVec 64)) Unit!3981)

(assert (=> d!38619 (= lt!66253 (choose!776 lt!66160 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66149))))

(assert (=> d!38619 (contains!884 lt!66160 lt!66149)))

(assert (=> d!38619 (= (addStillContains!88 lt!66160 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66149) lt!66253)))

(declare-fun bs!5298 () Bool)

(assert (= bs!5298 d!38619))

(assert (=> bs!5298 m!149511))

(assert (=> bs!5298 m!149511))

(assert (=> bs!5298 m!149513))

(declare-fun m!149729 () Bool)

(assert (=> bs!5298 m!149729))

(declare-fun m!149731 () Bool)

(assert (=> bs!5298 m!149731))

(assert (=> b!127921 d!38619))

(declare-fun d!38621 () Bool)

(declare-fun e!83639 () Bool)

(assert (=> d!38621 e!83639))

(declare-fun res!61849 () Bool)

(assert (=> d!38621 (=> res!61849 e!83639)))

(declare-fun lt!66254 () Bool)

(assert (=> d!38621 (= res!61849 (not lt!66254))))

(declare-fun lt!66257 () Bool)

(assert (=> d!38621 (= lt!66254 lt!66257)))

(declare-fun lt!66256 () Unit!3981)

(declare-fun e!83638 () Unit!3981)

(assert (=> d!38621 (= lt!66256 e!83638)))

(declare-fun c!23469 () Bool)

(assert (=> d!38621 (= c!23469 lt!66257)))

(assert (=> d!38621 (= lt!66257 (containsKey!172 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))

(assert (=> d!38621 (= (contains!884 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66149) lt!66254)))

(declare-fun b!128079 () Bool)

(declare-fun lt!66255 () Unit!3981)

(assert (=> b!128079 (= e!83638 lt!66255)))

(assert (=> b!128079 (= lt!66255 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))

(assert (=> b!128079 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))

(declare-fun b!128080 () Bool)

(declare-fun Unit!3990 () Unit!3981)

(assert (=> b!128080 (= e!83638 Unit!3990)))

(declare-fun b!128081 () Bool)

(assert (=> b!128081 (= e!83639 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149)))))

(assert (= (and d!38621 c!23469) b!128079))

(assert (= (and d!38621 (not c!23469)) b!128080))

(assert (= (and d!38621 (not res!61849)) b!128081))

(declare-fun m!149733 () Bool)

(assert (=> d!38621 m!149733))

(declare-fun m!149735 () Bool)

(assert (=> b!128079 m!149735))

(declare-fun m!149737 () Bool)

(assert (=> b!128079 m!149737))

(assert (=> b!128079 m!149737))

(declare-fun m!149739 () Bool)

(assert (=> b!128079 m!149739))

(assert (=> b!128081 m!149737))

(assert (=> b!128081 m!149737))

(assert (=> b!128081 m!149739))

(assert (=> b!127921 d!38621))

(declare-fun d!38623 () Bool)

(declare-fun e!83642 () Bool)

(assert (=> d!38623 e!83642))

(declare-fun res!61855 () Bool)

(assert (=> d!38623 (=> (not res!61855) (not e!83642))))

(declare-fun lt!66266 () ListLongMap!1691)

(assert (=> d!38623 (= res!61855 (contains!884 lt!66266 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66269 () List!1704)

(assert (=> d!38623 (= lt!66266 (ListLongMap!1692 lt!66269))))

(declare-fun lt!66268 () Unit!3981)

(declare-fun lt!66267 () Unit!3981)

(assert (=> d!38623 (= lt!66268 lt!66267)))

(assert (=> d!38623 (= (getValueByKey!168 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!83 (List!1704 (_ BitVec 64) V!3451) Unit!3981)

(assert (=> d!38623 (= lt!66267 (lemmaContainsTupThenGetReturnValue!83 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun insertStrictlySorted!86 (List!1704 (_ BitVec 64) V!3451) List!1704)

(assert (=> d!38623 (= lt!66269 (insertStrictlySorted!86 (toList!861 lt!66153) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38623 (= (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66266)))

(declare-fun b!128086 () Bool)

(declare-fun res!61854 () Bool)

(assert (=> b!128086 (=> (not res!61854) (not e!83642))))

(assert (=> b!128086 (= res!61854 (= (getValueByKey!168 (toList!861 lt!66266) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128087 () Bool)

(declare-fun contains!886 (List!1704 tuple2!2596) Bool)

(assert (=> b!128087 (= e!83642 (contains!886 (toList!861 lt!66266) (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38623 res!61855) b!128086))

(assert (= (and b!128086 res!61854) b!128087))

(declare-fun m!149741 () Bool)

(assert (=> d!38623 m!149741))

(declare-fun m!149743 () Bool)

(assert (=> d!38623 m!149743))

(declare-fun m!149745 () Bool)

(assert (=> d!38623 m!149745))

(declare-fun m!149747 () Bool)

(assert (=> d!38623 m!149747))

(declare-fun m!149749 () Bool)

(assert (=> b!128086 m!149749))

(declare-fun m!149751 () Bool)

(assert (=> b!128087 m!149751))

(assert (=> b!127921 d!38623))

(declare-fun d!38625 () Bool)

(assert (=> d!38625 (= (apply!112 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66156) (apply!112 lt!66141 lt!66156))))

(declare-fun lt!66270 () Unit!3981)

(assert (=> d!38625 (= lt!66270 (choose!775 lt!66141 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66156))))

(declare-fun e!83643 () Bool)

(assert (=> d!38625 e!83643))

(declare-fun res!61856 () Bool)

(assert (=> d!38625 (=> (not res!61856) (not e!83643))))

(assert (=> d!38625 (= res!61856 (contains!884 lt!66141 lt!66156))))

(assert (=> d!38625 (= (addApplyDifferent!88 lt!66141 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66156) lt!66270)))

(declare-fun b!128088 () Bool)

(assert (=> b!128088 (= e!83643 (not (= lt!66156 lt!66150)))))

(assert (= (and d!38625 res!61856) b!128088))

(declare-fun m!149753 () Bool)

(assert (=> d!38625 m!149753))

(assert (=> d!38625 m!149515))

(assert (=> d!38625 m!149505))

(declare-fun m!149755 () Bool)

(assert (=> d!38625 m!149755))

(assert (=> d!38625 m!149505))

(assert (=> d!38625 m!149507))

(assert (=> b!127921 d!38625))

(declare-fun d!38627 () Bool)

(declare-fun e!83644 () Bool)

(assert (=> d!38627 e!83644))

(declare-fun res!61858 () Bool)

(assert (=> d!38627 (=> (not res!61858) (not e!83644))))

(declare-fun lt!66271 () ListLongMap!1691)

(assert (=> d!38627 (= res!61858 (contains!884 lt!66271 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66274 () List!1704)

(assert (=> d!38627 (= lt!66271 (ListLongMap!1692 lt!66274))))

(declare-fun lt!66273 () Unit!3981)

(declare-fun lt!66272 () Unit!3981)

(assert (=> d!38627 (= lt!66273 lt!66272)))

(assert (=> d!38627 (= (getValueByKey!168 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38627 (= lt!66272 (lemmaContainsTupThenGetReturnValue!83 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38627 (= lt!66274 (insertStrictlySorted!86 (toList!861 lt!66158) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38627 (= (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66271)))

(declare-fun b!128089 () Bool)

(declare-fun res!61857 () Bool)

(assert (=> b!128089 (=> (not res!61857) (not e!83644))))

(assert (=> b!128089 (= res!61857 (= (getValueByKey!168 (toList!861 lt!66271) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128090 () Bool)

(assert (=> b!128090 (= e!83644 (contains!886 (toList!861 lt!66271) (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38627 res!61858) b!128089))

(assert (= (and b!128089 res!61857) b!128090))

(declare-fun m!149757 () Bool)

(assert (=> d!38627 m!149757))

(declare-fun m!149759 () Bool)

(assert (=> d!38627 m!149759))

(declare-fun m!149761 () Bool)

(assert (=> d!38627 m!149761))

(declare-fun m!149763 () Bool)

(assert (=> d!38627 m!149763))

(declare-fun m!149765 () Bool)

(assert (=> b!128089 m!149765))

(declare-fun m!149767 () Bool)

(assert (=> b!128090 m!149767))

(assert (=> b!127921 d!38627))

(declare-fun d!38629 () Bool)

(declare-fun e!83645 () Bool)

(assert (=> d!38629 e!83645))

(declare-fun res!61860 () Bool)

(assert (=> d!38629 (=> (not res!61860) (not e!83645))))

(declare-fun lt!66275 () ListLongMap!1691)

(assert (=> d!38629 (= res!61860 (contains!884 lt!66275 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66278 () List!1704)

(assert (=> d!38629 (= lt!66275 (ListLongMap!1692 lt!66278))))

(declare-fun lt!66277 () Unit!3981)

(declare-fun lt!66276 () Unit!3981)

(assert (=> d!38629 (= lt!66277 lt!66276)))

(assert (=> d!38629 (= (getValueByKey!168 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38629 (= lt!66276 (lemmaContainsTupThenGetReturnValue!83 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38629 (= lt!66278 (insertStrictlySorted!86 (toList!861 lt!66160) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38629 (= (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66275)))

(declare-fun b!128091 () Bool)

(declare-fun res!61859 () Bool)

(assert (=> b!128091 (=> (not res!61859) (not e!83645))))

(assert (=> b!128091 (= res!61859 (= (getValueByKey!168 (toList!861 lt!66275) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128092 () Bool)

(assert (=> b!128092 (= e!83645 (contains!886 (toList!861 lt!66275) (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38629 res!61860) b!128091))

(assert (= (and b!128091 res!61859) b!128092))

(declare-fun m!149769 () Bool)

(assert (=> d!38629 m!149769))

(declare-fun m!149771 () Bool)

(assert (=> d!38629 m!149771))

(declare-fun m!149773 () Bool)

(assert (=> d!38629 m!149773))

(declare-fun m!149775 () Bool)

(assert (=> d!38629 m!149775))

(declare-fun m!149777 () Bool)

(assert (=> b!128091 m!149777))

(declare-fun m!149779 () Bool)

(assert (=> b!128092 m!149779))

(assert (=> b!127921 d!38629))

(declare-fun d!38631 () Bool)

(assert (=> d!38631 (= (apply!112 lt!66141 lt!66156) (get!1459 (getValueByKey!168 (toList!861 lt!66141) lt!66156)))))

(declare-fun bs!5299 () Bool)

(assert (= bs!5299 d!38631))

(declare-fun m!149781 () Bool)

(assert (=> bs!5299 m!149781))

(assert (=> bs!5299 m!149781))

(declare-fun m!149783 () Bool)

(assert (=> bs!5299 m!149783))

(assert (=> b!127921 d!38631))

(assert (=> b!127921 d!38609))

(declare-fun d!38633 () Bool)

(assert (=> d!38633 (= (apply!112 lt!66158 lt!66139) (get!1459 (getValueByKey!168 (toList!861 lt!66158) lt!66139)))))

(declare-fun bs!5300 () Bool)

(assert (= bs!5300 d!38633))

(declare-fun m!149785 () Bool)

(assert (=> bs!5300 m!149785))

(assert (=> bs!5300 m!149785))

(declare-fun m!149787 () Bool)

(assert (=> bs!5300 m!149787))

(assert (=> b!127921 d!38633))

(declare-fun d!38635 () Bool)

(assert (=> d!38635 (= (apply!112 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66139) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66139)))))

(declare-fun bs!5301 () Bool)

(assert (= bs!5301 d!38635))

(declare-fun m!149789 () Bool)

(assert (=> bs!5301 m!149789))

(assert (=> bs!5301 m!149789))

(declare-fun m!149791 () Bool)

(assert (=> bs!5301 m!149791))

(assert (=> b!127921 d!38635))

(declare-fun d!38637 () Bool)

(assert (=> d!38637 (= (apply!112 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66156) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66156)))))

(declare-fun bs!5302 () Bool)

(assert (= bs!5302 d!38637))

(declare-fun m!149793 () Bool)

(assert (=> bs!5302 m!149793))

(assert (=> bs!5302 m!149793))

(declare-fun m!149795 () Bool)

(assert (=> bs!5302 m!149795))

(assert (=> b!127921 d!38637))

(declare-fun d!38639 () Bool)

(declare-fun e!83646 () Bool)

(assert (=> d!38639 e!83646))

(declare-fun res!61862 () Bool)

(assert (=> d!38639 (=> (not res!61862) (not e!83646))))

(declare-fun lt!66279 () ListLongMap!1691)

(assert (=> d!38639 (= res!61862 (contains!884 lt!66279 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66282 () List!1704)

(assert (=> d!38639 (= lt!66279 (ListLongMap!1692 lt!66282))))

(declare-fun lt!66281 () Unit!3981)

(declare-fun lt!66280 () Unit!3981)

(assert (=> d!38639 (= lt!66281 lt!66280)))

(assert (=> d!38639 (= (getValueByKey!168 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38639 (= lt!66280 (lemmaContainsTupThenGetReturnValue!83 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38639 (= lt!66282 (insertStrictlySorted!86 (toList!861 lt!66141) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38639 (= (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66279)))

(declare-fun b!128093 () Bool)

(declare-fun res!61861 () Bool)

(assert (=> b!128093 (=> (not res!61861) (not e!83646))))

(assert (=> b!128093 (= res!61861 (= (getValueByKey!168 (toList!861 lt!66279) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128094 () Bool)

(assert (=> b!128094 (= e!83646 (contains!886 (toList!861 lt!66279) (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38639 res!61862) b!128093))

(assert (= (and b!128093 res!61861) b!128094))

(declare-fun m!149797 () Bool)

(assert (=> d!38639 m!149797))

(declare-fun m!149799 () Bool)

(assert (=> d!38639 m!149799))

(declare-fun m!149801 () Bool)

(assert (=> d!38639 m!149801))

(declare-fun m!149803 () Bool)

(assert (=> d!38639 m!149803))

(declare-fun m!149805 () Bool)

(assert (=> b!128093 m!149805))

(declare-fun m!149807 () Bool)

(assert (=> b!128094 m!149807))

(assert (=> b!127921 d!38639))

(declare-fun d!38641 () Bool)

(assert (=> d!38641 (= (apply!112 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66139) (apply!112 lt!66158 lt!66139))))

(declare-fun lt!66283 () Unit!3981)

(assert (=> d!38641 (= lt!66283 (choose!775 lt!66158 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66139))))

(declare-fun e!83647 () Bool)

(assert (=> d!38641 e!83647))

(declare-fun res!61863 () Bool)

(assert (=> d!38641 (=> (not res!61863) (not e!83647))))

(assert (=> d!38641 (= res!61863 (contains!884 lt!66158 lt!66139))))

(assert (=> d!38641 (= (addApplyDifferent!88 lt!66158 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66139) lt!66283)))

(declare-fun b!128095 () Bool)

(assert (=> b!128095 (= e!83647 (not (= lt!66139 lt!66144)))))

(assert (= (and d!38641 res!61863) b!128095))

(declare-fun m!149809 () Bool)

(assert (=> d!38641 m!149809))

(assert (=> d!38641 m!149497))

(assert (=> d!38641 m!149501))

(declare-fun m!149811 () Bool)

(assert (=> d!38641 m!149811))

(assert (=> d!38641 m!149501))

(assert (=> d!38641 m!149503))

(assert (=> b!127921 d!38641))

(assert (=> d!38591 d!38583))

(declare-fun d!38643 () Bool)

(declare-fun e!83649 () Bool)

(assert (=> d!38643 e!83649))

(declare-fun res!61864 () Bool)

(assert (=> d!38643 (=> res!61864 e!83649)))

(declare-fun lt!66284 () Bool)

(assert (=> d!38643 (= res!61864 (not lt!66284))))

(declare-fun lt!66287 () Bool)

(assert (=> d!38643 (= lt!66284 lt!66287)))

(declare-fun lt!66286 () Unit!3981)

(declare-fun e!83648 () Unit!3981)

(assert (=> d!38643 (= lt!66286 e!83648)))

(declare-fun c!23470 () Bool)

(assert (=> d!38643 (= c!23470 lt!66287)))

(assert (=> d!38643 (= lt!66287 (containsKey!172 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38643 (= (contains!884 call!13790 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66284)))

(declare-fun b!128096 () Bool)

(declare-fun lt!66285 () Unit!3981)

(assert (=> b!128096 (= e!83648 lt!66285)))

(assert (=> b!128096 (= lt!66285 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!128096 (isDefined!121 (getValueByKey!168 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128097 () Bool)

(declare-fun Unit!3991 () Unit!3981)

(assert (=> b!128097 (= e!83648 Unit!3991)))

(declare-fun b!128098 () Bool)

(assert (=> b!128098 (= e!83649 (isDefined!121 (getValueByKey!168 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!38643 c!23470) b!128096))

(assert (= (and d!38643 (not c!23470)) b!128097))

(assert (= (and d!38643 (not res!61864)) b!128098))

(assert (=> d!38643 m!149355))

(declare-fun m!149813 () Bool)

(assert (=> d!38643 m!149813))

(assert (=> b!128096 m!149355))

(declare-fun m!149815 () Bool)

(assert (=> b!128096 m!149815))

(assert (=> b!128096 m!149355))

(declare-fun m!149817 () Bool)

(assert (=> b!128096 m!149817))

(assert (=> b!128096 m!149817))

(declare-fun m!149819 () Bool)

(assert (=> b!128096 m!149819))

(assert (=> b!128098 m!149355))

(assert (=> b!128098 m!149817))

(assert (=> b!128098 m!149817))

(assert (=> b!128098 m!149819))

(assert (=> b!127858 d!38643))

(declare-fun d!38645 () Bool)

(assert (=> d!38645 (= (apply!112 lt!66157 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5303 () Bool)

(assert (= bs!5303 d!38645))

(declare-fun m!149821 () Bool)

(assert (=> bs!5303 m!149821))

(assert (=> bs!5303 m!149821))

(declare-fun m!149823 () Bool)

(assert (=> bs!5303 m!149823))

(assert (=> b!127922 d!38645))

(declare-fun d!38647 () Bool)

(declare-fun e!83651 () Bool)

(assert (=> d!38647 e!83651))

(declare-fun res!61865 () Bool)

(assert (=> d!38647 (=> res!61865 e!83651)))

(declare-fun lt!66288 () Bool)

(assert (=> d!38647 (= res!61865 (not lt!66288))))

(declare-fun lt!66291 () Bool)

(assert (=> d!38647 (= lt!66288 lt!66291)))

(declare-fun lt!66290 () Unit!3981)

(declare-fun e!83650 () Unit!3981)

(assert (=> d!38647 (= lt!66290 e!83650)))

(declare-fun c!23471 () Bool)

(assert (=> d!38647 (= c!23471 lt!66291)))

(assert (=> d!38647 (= lt!66291 (containsKey!172 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38647 (= (contains!884 e!83487 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66288)))

(declare-fun b!128099 () Bool)

(declare-fun lt!66289 () Unit!3981)

(assert (=> b!128099 (= e!83650 lt!66289)))

(assert (=> b!128099 (= lt!66289 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!128099 (isDefined!121 (getValueByKey!168 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128100 () Bool)

(declare-fun Unit!3992 () Unit!3981)

(assert (=> b!128100 (= e!83650 Unit!3992)))

(declare-fun b!128101 () Bool)

(assert (=> b!128101 (= e!83651 (isDefined!121 (getValueByKey!168 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!38647 c!23471) b!128099))

(assert (= (and d!38647 (not c!23471)) b!128100))

(assert (= (and d!38647 (not res!61865)) b!128101))

(assert (=> d!38647 m!149355))

(declare-fun m!149825 () Bool)

(assert (=> d!38647 m!149825))

(assert (=> b!128099 m!149355))

(declare-fun m!149827 () Bool)

(assert (=> b!128099 m!149827))

(assert (=> b!128099 m!149355))

(declare-fun m!149829 () Bool)

(assert (=> b!128099 m!149829))

(assert (=> b!128099 m!149829))

(declare-fun m!149831 () Bool)

(assert (=> b!128099 m!149831))

(assert (=> b!128101 m!149355))

(assert (=> b!128101 m!149829))

(assert (=> b!128101 m!149829))

(assert (=> b!128101 m!149831))

(assert (=> bm!13793 d!38647))

(declare-fun b!128110 () Bool)

(declare-fun e!83656 () (_ BitVec 32))

(declare-fun call!13858 () (_ BitVec 32))

(assert (=> b!128110 (= e!83656 call!13858)))

(declare-fun bm!13855 () Bool)

(assert (=> bm!13855 (= call!13858 (arrayCountValidKeys!0 (_keys!4542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128111 () Bool)

(declare-fun e!83657 () (_ BitVec 32))

(assert (=> b!128111 (= e!83657 e!83656)))

(declare-fun c!23476 () Bool)

(assert (=> b!128111 (= c!23476 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38649 () Bool)

(declare-fun lt!66294 () (_ BitVec 32))

(assert (=> d!38649 (and (bvsge lt!66294 #b00000000000000000000000000000000) (bvsle lt!66294 (bvsub (size!2502 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38649 (= lt!66294 e!83657)))

(declare-fun c!23477 () Bool)

(assert (=> d!38649 (= c!23477 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38649 (and (bvsle #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2502 (_keys!4542 newMap!16)) (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38649 (= (arrayCountValidKeys!0 (_keys!4542 newMap!16) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) lt!66294)))

(declare-fun b!128112 () Bool)

(assert (=> b!128112 (= e!83656 (bvadd #b00000000000000000000000000000001 call!13858))))

(declare-fun b!128113 () Bool)

(assert (=> b!128113 (= e!83657 #b00000000000000000000000000000000)))

(assert (= (and d!38649 c!23477) b!128113))

(assert (= (and d!38649 (not c!23477)) b!128111))

(assert (= (and b!128111 c!23476) b!128112))

(assert (= (and b!128111 (not c!23476)) b!128110))

(assert (= (or b!128112 b!128110) bm!13855))

(declare-fun m!149833 () Bool)

(assert (=> bm!13855 m!149833))

(assert (=> b!128111 m!149547))

(assert (=> b!128111 m!149547))

(assert (=> b!128111 m!149549))

(assert (=> b!127722 d!38649))

(declare-fun d!38651 () Bool)

(assert (=> d!38651 (= (map!1394 (_2!1310 lt!66078)) (getCurrentListMap!539 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))))))

(declare-fun bs!5304 () Bool)

(assert (= bs!5304 d!38651))

(declare-fun m!149835 () Bool)

(assert (=> bs!5304 m!149835))

(assert (=> bm!13796 d!38651))

(declare-fun d!38653 () Bool)

(declare-fun e!83658 () Bool)

(assert (=> d!38653 e!83658))

(declare-fun res!61867 () Bool)

(assert (=> d!38653 (=> (not res!61867) (not e!83658))))

(declare-fun lt!66295 () ListLongMap!1691)

(assert (=> d!38653 (= res!61867 (contains!884 lt!66295 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66298 () List!1704)

(assert (=> d!38653 (= lt!66295 (ListLongMap!1692 lt!66298))))

(declare-fun lt!66297 () Unit!3981)

(declare-fun lt!66296 () Unit!3981)

(assert (=> d!38653 (= lt!66297 lt!66296)))

(assert (=> d!38653 (= (getValueByKey!168 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38653 (= lt!66296 (lemmaContainsTupThenGetReturnValue!83 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38653 (= lt!66298 (insertStrictlySorted!86 (toList!861 call!13810) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38653 (= (+!171 call!13810 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66295)))

(declare-fun b!128114 () Bool)

(declare-fun res!61866 () Bool)

(assert (=> b!128114 (=> (not res!61866) (not e!83658))))

(assert (=> b!128114 (= res!61866 (= (getValueByKey!168 (toList!861 lt!66295) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128115 () Bool)

(assert (=> b!128115 (= e!83658 (contains!886 (toList!861 lt!66295) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38653 res!61867) b!128114))

(assert (= (and b!128114 res!61866) b!128115))

(declare-fun m!149837 () Bool)

(assert (=> d!38653 m!149837))

(declare-fun m!149839 () Bool)

(assert (=> d!38653 m!149839))

(declare-fun m!149841 () Bool)

(assert (=> d!38653 m!149841))

(declare-fun m!149843 () Bool)

(assert (=> d!38653 m!149843))

(declare-fun m!149845 () Bool)

(assert (=> b!128114 m!149845))

(declare-fun m!149847 () Bool)

(assert (=> b!128115 m!149847))

(assert (=> b!127827 d!38653))

(declare-fun d!38655 () Bool)

(declare-fun e!83660 () Bool)

(assert (=> d!38655 e!83660))

(declare-fun res!61868 () Bool)

(assert (=> d!38655 (=> res!61868 e!83660)))

(declare-fun lt!66299 () Bool)

(assert (=> d!38655 (= res!61868 (not lt!66299))))

(declare-fun lt!66302 () Bool)

(assert (=> d!38655 (= lt!66299 lt!66302)))

(declare-fun lt!66301 () Unit!3981)

(declare-fun e!83659 () Unit!3981)

(assert (=> d!38655 (= lt!66301 e!83659)))

(declare-fun c!23478 () Bool)

(assert (=> d!38655 (= c!23478 lt!66302)))

(assert (=> d!38655 (= lt!66302 (containsKey!172 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (=> d!38655 (= (contains!884 call!13805 (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))) lt!66299)))

(declare-fun b!128116 () Bool)

(declare-fun lt!66300 () Unit!3981)

(assert (=> b!128116 (= e!83659 lt!66300)))

(assert (=> b!128116 (= lt!66300 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (=> b!128116 (isDefined!121 (getValueByKey!168 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(declare-fun b!128117 () Bool)

(declare-fun Unit!3993 () Unit!3981)

(assert (=> b!128117 (= e!83659 Unit!3993)))

(declare-fun b!128118 () Bool)

(assert (=> b!128118 (= e!83660 (isDefined!121 (getValueByKey!168 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))))

(assert (= (and d!38655 c!23478) b!128116))

(assert (= (and d!38655 (not c!23478)) b!128117))

(assert (= (and d!38655 (not res!61868)) b!128118))

(assert (=> d!38655 m!149471))

(declare-fun m!149849 () Bool)

(assert (=> d!38655 m!149849))

(assert (=> b!128116 m!149471))

(declare-fun m!149851 () Bool)

(assert (=> b!128116 m!149851))

(assert (=> b!128116 m!149471))

(declare-fun m!149853 () Bool)

(assert (=> b!128116 m!149853))

(assert (=> b!128116 m!149853))

(declare-fun m!149855 () Bool)

(assert (=> b!128116 m!149855))

(assert (=> b!128118 m!149471))

(assert (=> b!128118 m!149853))

(assert (=> b!128118 m!149853))

(assert (=> b!128118 m!149855))

(assert (=> b!127853 d!38655))

(declare-fun d!38657 () Bool)

(declare-fun e!83663 () Bool)

(assert (=> d!38657 e!83663))

(declare-fun res!61871 () Bool)

(assert (=> d!38657 (=> (not res!61871) (not e!83663))))

(assert (=> d!38657 (= res!61871 (and (bvsge (index!3241 lt!66072) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66072) (size!2502 (_keys!4542 newMap!16)))))))

(declare-fun lt!66305 () Unit!3981)

(declare-fun choose!777 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) Int) Unit!3981)

(assert (=> d!38657 (= lt!66305 (choose!777 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38657 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38657 (= (lemmaValidKeyInArrayIsInListMap!118 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (defaultEntry!2805 newMap!16)) lt!66305)))

(declare-fun b!128121 () Bool)

(assert (=> b!128121 (= e!83663 (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (= (and d!38657 res!61871) b!128121))

(declare-fun m!149857 () Bool)

(assert (=> d!38657 m!149857))

(assert (=> d!38657 m!149599))

(declare-fun m!149859 () Bool)

(assert (=> b!128121 m!149859))

(assert (=> b!128121 m!149471))

(assert (=> b!128121 m!149859))

(assert (=> b!128121 m!149471))

(declare-fun m!149861 () Bool)

(assert (=> b!128121 m!149861))

(assert (=> b!127853 d!38657))

(declare-fun d!38659 () Bool)

(declare-fun e!83666 () Bool)

(assert (=> d!38659 e!83666))

(declare-fun res!61874 () Bool)

(assert (=> d!38659 (=> (not res!61874) (not e!83666))))

(assert (=> d!38659 (= res!61874 (and (bvsge (index!3241 lt!66072) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66072) (size!2503 (_values!2788 newMap!16)))))))

(declare-fun lt!66308 () Unit!3981)

(declare-fun choose!778 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) (_ BitVec 64) V!3451 Int) Unit!3981)

(assert (=> d!38659 (= lt!66308 (choose!778 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38659 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38659 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)) lt!66308)))

(declare-fun b!128124 () Bool)

(assert (=> b!128124 (= e!83666 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))))))

(assert (= (and d!38659 res!61874) b!128124))

(assert (=> d!38659 m!149355))

(assert (=> d!38659 m!149353))

(declare-fun m!149863 () Bool)

(assert (=> d!38659 m!149863))

(assert (=> d!38659 m!149599))

(assert (=> b!128124 m!149437))

(assert (=> b!128124 m!149437))

(declare-fun m!149865 () Bool)

(assert (=> b!128124 m!149865))

(assert (=> b!128124 m!149451))

(declare-fun m!149867 () Bool)

(assert (=> b!128124 m!149867))

(assert (=> b!127853 d!38659))

(declare-fun b!128133 () Bool)

(declare-fun e!83675 () Bool)

(declare-fun e!83674 () Bool)

(assert (=> b!128133 (= e!83675 e!83674)))

(declare-fun lt!66317 () (_ BitVec 64))

(assert (=> b!128133 (= lt!66317 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66315 () Unit!3981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4725 (_ BitVec 64) (_ BitVec 32)) Unit!3981)

(assert (=> b!128133 (= lt!66315 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4542 newMap!16) lt!66317 #b00000000000000000000000000000000))))

(assert (=> b!128133 (arrayContainsKey!0 (_keys!4542 newMap!16) lt!66317 #b00000000000000000000000000000000)))

(declare-fun lt!66316 () Unit!3981)

(assert (=> b!128133 (= lt!66316 lt!66315)))

(declare-fun res!61879 () Bool)

(assert (=> b!128133 (= res!61879 (= (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (_keys!4542 newMap!16) (mask!7073 newMap!16)) (Found!271 #b00000000000000000000000000000000)))))

(assert (=> b!128133 (=> (not res!61879) (not e!83674))))

(declare-fun bm!13858 () Bool)

(declare-fun call!13861 () Bool)

(assert (=> bm!13858 (= call!13861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!128134 () Bool)

(assert (=> b!128134 (= e!83674 call!13861)))

(declare-fun d!38661 () Bool)

(declare-fun res!61880 () Bool)

(declare-fun e!83673 () Bool)

(assert (=> d!38661 (=> res!61880 e!83673)))

(assert (=> d!38661 (= res!61880 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 newMap!16) (mask!7073 newMap!16)) e!83673)))

(declare-fun b!128135 () Bool)

(assert (=> b!128135 (= e!83675 call!13861)))

(declare-fun b!128136 () Bool)

(assert (=> b!128136 (= e!83673 e!83675)))

(declare-fun c!23481 () Bool)

(assert (=> b!128136 (= c!23481 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38661 (not res!61880)) b!128136))

(assert (= (and b!128136 c!23481) b!128133))

(assert (= (and b!128136 (not c!23481)) b!128135))

(assert (= (and b!128133 res!61879) b!128134))

(assert (= (or b!128134 b!128135) bm!13858))

(assert (=> b!128133 m!149547))

(declare-fun m!149869 () Bool)

(assert (=> b!128133 m!149869))

(declare-fun m!149871 () Bool)

(assert (=> b!128133 m!149871))

(assert (=> b!128133 m!149547))

(declare-fun m!149873 () Bool)

(assert (=> b!128133 m!149873))

(declare-fun m!149875 () Bool)

(assert (=> bm!13858 m!149875))

(assert (=> b!128136 m!149547))

(assert (=> b!128136 m!149547))

(assert (=> b!128136 m!149549))

(assert (=> b!127723 d!38661))

(declare-fun b!128147 () Bool)

(declare-fun e!83687 () Bool)

(declare-fun e!83685 () Bool)

(assert (=> b!128147 (= e!83687 e!83685)))

(declare-fun res!61889 () Bool)

(assert (=> b!128147 (=> (not res!61889) (not e!83685))))

(declare-fun e!83686 () Bool)

(assert (=> b!128147 (= res!61889 (not e!83686))))

(declare-fun res!61888 () Bool)

(assert (=> b!128147 (=> (not res!61888) (not e!83686))))

(assert (=> b!128147 (= res!61888 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13861 () Bool)

(declare-fun call!13864 () Bool)

(declare-fun c!23484 () Bool)

(assert (=> bm!13861 (= call!13864 (arrayNoDuplicates!0 (_keys!4542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23484 (Cons!1702 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) Nil!1703) Nil!1703)))))

(declare-fun d!38663 () Bool)

(declare-fun res!61887 () Bool)

(assert (=> d!38663 (=> res!61887 e!83687)))

(assert (=> d!38663 (= res!61887 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38663 (= (arrayNoDuplicates!0 (_keys!4542 newMap!16) #b00000000000000000000000000000000 Nil!1703) e!83687)))

(declare-fun b!128148 () Bool)

(declare-fun e!83684 () Bool)

(assert (=> b!128148 (= e!83684 call!13864)))

(declare-fun b!128149 () Bool)

(assert (=> b!128149 (= e!83684 call!13864)))

(declare-fun b!128150 () Bool)

(assert (=> b!128150 (= e!83685 e!83684)))

(assert (=> b!128150 (= c!23484 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128151 () Bool)

(declare-fun contains!887 (List!1706 (_ BitVec 64)) Bool)

(assert (=> b!128151 (= e!83686 (contains!887 Nil!1703 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38663 (not res!61887)) b!128147))

(assert (= (and b!128147 res!61888) b!128151))

(assert (= (and b!128147 res!61889) b!128150))

(assert (= (and b!128150 c!23484) b!128148))

(assert (= (and b!128150 (not c!23484)) b!128149))

(assert (= (or b!128148 b!128149) bm!13861))

(assert (=> b!128147 m!149547))

(assert (=> b!128147 m!149547))

(assert (=> b!128147 m!149549))

(assert (=> bm!13861 m!149547))

(declare-fun m!149877 () Bool)

(assert (=> bm!13861 m!149877))

(assert (=> b!128150 m!149547))

(assert (=> b!128150 m!149547))

(assert (=> b!128150 m!149549))

(assert (=> b!128151 m!149547))

(assert (=> b!128151 m!149547))

(declare-fun m!149879 () Bool)

(assert (=> b!128151 m!149879))

(assert (=> b!127724 d!38663))

(declare-fun d!38665 () Bool)

(assert (=> d!38665 (= (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127917 d!38665))

(declare-fun b!128152 () Bool)

(declare-fun e!83688 () Unit!3981)

(declare-fun Unit!3994 () Unit!3981)

(assert (=> b!128152 (= e!83688 Unit!3994)))

(declare-fun b!128153 () Bool)

(declare-fun lt!66336 () ListLongMap!1691)

(declare-fun e!83695 () Bool)

(assert (=> b!128153 (= e!83695 (= (apply!112 lt!66336 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))

(declare-fun b!128154 () Bool)

(declare-fun res!61890 () Bool)

(declare-fun e!83691 () Bool)

(assert (=> b!128154 (=> (not res!61890) (not e!83691))))

(declare-fun e!83693 () Bool)

(assert (=> b!128154 (= res!61890 e!83693)))

(declare-fun c!23487 () Bool)

(assert (=> b!128154 (= c!23487 (not (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128155 () Bool)

(declare-fun e!83690 () Bool)

(declare-fun e!83692 () Bool)

(assert (=> b!128155 (= e!83690 e!83692)))

(declare-fun res!61894 () Bool)

(declare-fun call!13867 () Bool)

(assert (=> b!128155 (= res!61894 call!13867)))

(assert (=> b!128155 (=> (not res!61894) (not e!83692))))

(declare-fun e!83694 () Bool)

(declare-fun b!128156 () Bool)

(assert (=> b!128156 (= e!83694 (= (apply!112 lt!66336 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))))))))

(assert (=> b!128156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13862 () Bool)

(declare-fun call!13871 () ListLongMap!1691)

(declare-fun call!13869 () ListLongMap!1691)

(assert (=> bm!13862 (= call!13871 call!13869)))

(declare-fun b!128157 () Bool)

(declare-fun e!83698 () ListLongMap!1691)

(declare-fun call!13865 () ListLongMap!1691)

(assert (=> b!128157 (= e!83698 call!13865)))

(declare-fun b!128158 () Bool)

(assert (=> b!128158 (= e!83690 (not call!13867))))

(declare-fun bm!13863 () Bool)

(declare-fun c!23489 () Bool)

(declare-fun c!23485 () Bool)

(declare-fun call!13868 () ListLongMap!1691)

(assert (=> bm!13863 (= call!13868 (+!171 (ite c!23485 call!13869 (ite c!23489 call!13871 call!13865)) (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(declare-fun b!128159 () Bool)

(declare-fun call!13870 () Bool)

(assert (=> b!128159 (= e!83693 (not call!13870))))

(declare-fun b!128160 () Bool)

(declare-fun e!83696 () ListLongMap!1691)

(declare-fun call!13866 () ListLongMap!1691)

(assert (=> b!128160 (= e!83696 call!13866)))

(declare-fun b!128161 () Bool)

(declare-fun e!83700 () Bool)

(assert (=> b!128161 (= e!83700 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!23490 () Bool)

(declare-fun b!128163 () Bool)

(assert (=> b!128163 (= c!23490 (and (not (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128163 (= e!83696 e!83698)))

(declare-fun bm!13864 () Bool)

(assert (=> bm!13864 (= call!13867 (contains!884 lt!66336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128164 () Bool)

(declare-fun e!83699 () Bool)

(assert (=> b!128164 (= e!83699 e!83694)))

(declare-fun res!61895 () Bool)

(assert (=> b!128164 (=> (not res!61895) (not e!83694))))

(assert (=> b!128164 (= res!61895 (contains!884 lt!66336 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13865 () Bool)

(assert (=> bm!13865 (= call!13866 call!13868)))

(declare-fun bm!13866 () Bool)

(assert (=> bm!13866 (= call!13869 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128165 () Bool)

(declare-fun lt!66322 () Unit!3981)

(assert (=> b!128165 (= e!83688 lt!66322)))

(declare-fun lt!66339 () ListLongMap!1691)

(assert (=> b!128165 (= lt!66339 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66333 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66328 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66328 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66319 () Unit!3981)

(assert (=> b!128165 (= lt!66319 (addStillContains!88 lt!66339 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) lt!66328))))

(assert (=> b!128165 (contains!884 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66328)))

(declare-fun lt!66325 () Unit!3981)

(assert (=> b!128165 (= lt!66325 lt!66319)))

(declare-fun lt!66337 () ListLongMap!1691)

(assert (=> b!128165 (= lt!66337 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66323 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66318 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66318 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66321 () Unit!3981)

(assert (=> b!128165 (= lt!66321 (addApplyDifferent!88 lt!66337 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) lt!66318))))

(assert (=> b!128165 (= (apply!112 (+!171 lt!66337 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66318) (apply!112 lt!66337 lt!66318))))

(declare-fun lt!66330 () Unit!3981)

(assert (=> b!128165 (= lt!66330 lt!66321)))

(declare-fun lt!66320 () ListLongMap!1691)

(assert (=> b!128165 (= lt!66320 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66329 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66335 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66335 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66327 () Unit!3981)

(assert (=> b!128165 (= lt!66327 (addApplyDifferent!88 lt!66320 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) lt!66335))))

(assert (=> b!128165 (= (apply!112 (+!171 lt!66320 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66335) (apply!112 lt!66320 lt!66335))))

(declare-fun lt!66338 () Unit!3981)

(assert (=> b!128165 (= lt!66338 lt!66327)))

(declare-fun lt!66332 () ListLongMap!1691)

(assert (=> b!128165 (= lt!66332 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66331 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66331 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66326 () (_ BitVec 64))

(assert (=> b!128165 (= lt!66326 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128165 (= lt!66322 (addApplyDifferent!88 lt!66332 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) lt!66326))))

(assert (=> b!128165 (= (apply!112 (+!171 lt!66332 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66326) (apply!112 lt!66332 lt!66326))))

(declare-fun b!128166 () Bool)

(assert (=> b!128166 (= e!83692 (= (apply!112 lt!66336 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))

(declare-fun b!128167 () Bool)

(declare-fun e!83697 () ListLongMap!1691)

(assert (=> b!128167 (= e!83697 (+!171 call!13868 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))

(declare-fun b!128168 () Bool)

(assert (=> b!128168 (= e!83691 e!83690)))

(declare-fun c!23488 () Bool)

(assert (=> b!128168 (= c!23488 (not (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128169 () Bool)

(declare-fun res!61896 () Bool)

(assert (=> b!128169 (=> (not res!61896) (not e!83691))))

(assert (=> b!128169 (= res!61896 e!83699)))

(declare-fun res!61892 () Bool)

(assert (=> b!128169 (=> res!61892 e!83699)))

(declare-fun e!83689 () Bool)

(assert (=> b!128169 (= res!61892 (not e!83689))))

(declare-fun res!61897 () Bool)

(assert (=> b!128169 (=> (not res!61897) (not e!83689))))

(assert (=> b!128169 (= res!61897 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128170 () Bool)

(assert (=> b!128170 (= e!83697 e!83696)))

(assert (=> b!128170 (= c!23489 (and (not (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13867 () Bool)

(assert (=> bm!13867 (= call!13865 call!13871)))

(declare-fun b!128171 () Bool)

(assert (=> b!128171 (= e!83698 call!13866)))

(declare-fun b!128162 () Bool)

(assert (=> b!128162 (= e!83689 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38667 () Bool)

(assert (=> d!38667 e!83691))

(declare-fun res!61893 () Bool)

(assert (=> d!38667 (=> (not res!61893) (not e!83691))))

(assert (=> d!38667 (= res!61893 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66324 () ListLongMap!1691)

(assert (=> d!38667 (= lt!66336 lt!66324)))

(declare-fun lt!66334 () Unit!3981)

(assert (=> d!38667 (= lt!66334 e!83688)))

(declare-fun c!23486 () Bool)

(assert (=> d!38667 (= c!23486 e!83700)))

(declare-fun res!61891 () Bool)

(assert (=> d!38667 (=> (not res!61891) (not e!83700))))

(assert (=> d!38667 (= res!61891 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38667 (= lt!66324 e!83697)))

(assert (=> d!38667 (= c!23485 (and (not (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38667 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38667 (= (getCurrentListMap!539 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66336)))

(declare-fun b!128172 () Bool)

(assert (=> b!128172 (= e!83693 e!83695)))

(declare-fun res!61898 () Bool)

(assert (=> b!128172 (= res!61898 call!13870)))

(assert (=> b!128172 (=> (not res!61898) (not e!83695))))

(declare-fun bm!13868 () Bool)

(assert (=> bm!13868 (= call!13870 (contains!884 lt!66336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38667 c!23485) b!128167))

(assert (= (and d!38667 (not c!23485)) b!128170))

(assert (= (and b!128170 c!23489) b!128160))

(assert (= (and b!128170 (not c!23489)) b!128163))

(assert (= (and b!128163 c!23490) b!128171))

(assert (= (and b!128163 (not c!23490)) b!128157))

(assert (= (or b!128171 b!128157) bm!13867))

(assert (= (or b!128160 bm!13867) bm!13862))

(assert (= (or b!128160 b!128171) bm!13865))

(assert (= (or b!128167 bm!13862) bm!13866))

(assert (= (or b!128167 bm!13865) bm!13863))

(assert (= (and d!38667 res!61891) b!128161))

(assert (= (and d!38667 c!23486) b!128165))

(assert (= (and d!38667 (not c!23486)) b!128152))

(assert (= (and d!38667 res!61893) b!128169))

(assert (= (and b!128169 res!61897) b!128162))

(assert (= (and b!128169 (not res!61892)) b!128164))

(assert (= (and b!128164 res!61895) b!128156))

(assert (= (and b!128169 res!61896) b!128154))

(assert (= (and b!128154 c!23487) b!128172))

(assert (= (and b!128154 (not c!23487)) b!128159))

(assert (= (and b!128172 res!61898) b!128153))

(assert (= (or b!128172 b!128159) bm!13868))

(assert (= (and b!128154 res!61890) b!128168))

(assert (= (and b!128168 c!23488) b!128155))

(assert (= (and b!128168 (not c!23488)) b!128158))

(assert (= (and b!128155 res!61894) b!128166))

(assert (= (or b!128155 b!128158) bm!13864))

(declare-fun b_lambda!5663 () Bool)

(assert (=> (not b_lambda!5663) (not b!128156)))

(assert (=> b!128156 t!6091))

(declare-fun b_and!7919 () Bool)

(assert (= b_and!7915 (and (=> t!6091 result!3893) b_and!7919)))

(assert (=> b!128156 t!6093))

(declare-fun b_and!7921 () Bool)

(assert (= b_and!7917 (and (=> t!6093 result!3895) b_and!7921)))

(declare-fun m!149881 () Bool)

(assert (=> bm!13868 m!149881))

(assert (=> b!128161 m!149547))

(assert (=> b!128161 m!149547))

(assert (=> b!128161 m!149549))

(declare-fun m!149883 () Bool)

(assert (=> b!128167 m!149883))

(declare-fun m!149885 () Bool)

(assert (=> b!128165 m!149885))

(declare-fun m!149887 () Bool)

(assert (=> b!128165 m!149887))

(declare-fun m!149889 () Bool)

(assert (=> b!128165 m!149889))

(assert (=> b!128165 m!149547))

(declare-fun m!149891 () Bool)

(assert (=> b!128165 m!149891))

(declare-fun m!149893 () Bool)

(assert (=> b!128165 m!149893))

(declare-fun m!149895 () Bool)

(assert (=> b!128165 m!149895))

(declare-fun m!149897 () Bool)

(assert (=> b!128165 m!149897))

(assert (=> b!128165 m!149895))

(declare-fun m!149899 () Bool)

(assert (=> b!128165 m!149899))

(declare-fun m!149901 () Bool)

(assert (=> b!128165 m!149901))

(assert (=> b!128165 m!149899))

(declare-fun m!149903 () Bool)

(assert (=> b!128165 m!149903))

(declare-fun m!149905 () Bool)

(assert (=> b!128165 m!149905))

(declare-fun m!149907 () Bool)

(assert (=> b!128165 m!149907))

(declare-fun m!149909 () Bool)

(assert (=> b!128165 m!149909))

(assert (=> b!128165 m!149893))

(declare-fun m!149911 () Bool)

(assert (=> b!128165 m!149911))

(declare-fun m!149913 () Bool)

(assert (=> b!128165 m!149913))

(declare-fun m!149915 () Bool)

(assert (=> b!128165 m!149915))

(assert (=> b!128165 m!149905))

(assert (=> b!128164 m!149547))

(assert (=> b!128164 m!149547))

(declare-fun m!149917 () Bool)

(assert (=> b!128164 m!149917))

(declare-fun m!149919 () Bool)

(assert (=> bm!13864 m!149919))

(declare-fun m!149921 () Bool)

(assert (=> bm!13863 m!149921))

(declare-fun m!149923 () Bool)

(assert (=> b!128156 m!149923))

(assert (=> b!128156 m!149593))

(assert (=> b!128156 m!149547))

(assert (=> b!128156 m!149547))

(declare-fun m!149925 () Bool)

(assert (=> b!128156 m!149925))

(assert (=> b!128156 m!149923))

(assert (=> b!128156 m!149593))

(declare-fun m!149927 () Bool)

(assert (=> b!128156 m!149927))

(assert (=> d!38667 m!149599))

(assert (=> b!128162 m!149547))

(assert (=> b!128162 m!149547))

(assert (=> b!128162 m!149549))

(assert (=> bm!13866 m!149885))

(declare-fun m!149929 () Bool)

(assert (=> b!128153 m!149929))

(declare-fun m!149931 () Bool)

(assert (=> b!128166 m!149931))

(assert (=> bm!13805 d!38667))

(assert (=> b!127918 d!38665))

(assert (=> d!38589 d!38611))

(declare-fun b!128207 () Bool)

(declare-fun e!83724 () Unit!3981)

(declare-fun Unit!3995 () Unit!3981)

(assert (=> b!128207 (= e!83724 Unit!3995)))

(declare-fun lt!66424 () Unit!3981)

(assert (=> b!128207 (= lt!66424 (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66429 () SeekEntryResult!271)

(declare-fun call!13883 () SeekEntryResult!271)

(assert (=> b!128207 (= lt!66429 call!13883)))

(declare-fun res!61923 () Bool)

(assert (=> b!128207 (= res!61923 ((_ is Found!271) lt!66429))))

(declare-fun e!83717 () Bool)

(assert (=> b!128207 (=> (not res!61923) (not e!83717))))

(assert (=> b!128207 e!83717))

(declare-fun lt!66418 () Unit!3981)

(assert (=> b!128207 (= lt!66418 lt!66424)))

(assert (=> b!128207 false))

(declare-fun b!128208 () Bool)

(declare-fun lt!66419 () Unit!3981)

(assert (=> b!128208 (= e!83724 lt!66419)))

(assert (=> b!128208 (= lt!66419 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66417 () SeekEntryResult!271)

(assert (=> b!128208 (= lt!66417 call!13883)))

(declare-fun c!23501 () Bool)

(assert (=> b!128208 (= c!23501 ((_ is MissingZero!271) lt!66417))))

(declare-fun e!83720 () Bool)

(assert (=> b!128208 e!83720))

(declare-fun b!128209 () Bool)

(declare-fun e!83719 () Bool)

(declare-fun e!83718 () Bool)

(assert (=> b!128209 (= e!83719 e!83718)))

(declare-fun res!61922 () Bool)

(declare-fun call!13880 () Bool)

(assert (=> b!128209 (= res!61922 call!13880)))

(assert (=> b!128209 (=> (not res!61922) (not e!83718))))

(declare-fun b!128210 () Bool)

(declare-fun e!83723 () Bool)

(declare-fun call!13882 () Bool)

(assert (=> b!128210 (= e!83723 (not call!13882))))

(declare-fun b!128211 () Bool)

(declare-fun res!61925 () Bool)

(declare-fun e!83722 () Bool)

(assert (=> b!128211 (=> (not res!61925) (not e!83722))))

(declare-fun lt!66421 () tuple2!2598)

(assert (=> b!128211 (= res!61925 (valid!512 (_2!1310 lt!66421)))))

(declare-fun b!128212 () Bool)

(declare-fun c!23500 () Bool)

(assert (=> b!128212 (= c!23500 ((_ is MissingVacant!271) lt!66417))))

(assert (=> b!128212 (= e!83720 e!83719)))

(declare-fun c!23502 () Bool)

(declare-fun call!13881 () Bool)

(declare-fun bm!13877 () Bool)

(assert (=> bm!13877 (= call!13881 (inRange!0 (ite c!23502 (index!3241 lt!66429) (ite c!23501 (index!3240 lt!66417) (index!3243 lt!66417))) (mask!7073 newMap!16)))))

(declare-fun b!128213 () Bool)

(declare-fun e!83721 () Unit!3981)

(declare-fun Unit!3996 () Unit!3981)

(assert (=> b!128213 (= e!83721 Unit!3996)))

(declare-fun lt!66405 () Unit!3981)

(declare-fun lemmaArrayContainsKeyThenInListMap!38 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 64) (_ BitVec 32) Int) Unit!3981)

(assert (=> b!128213 (= lt!66405 (lemmaArrayContainsKeyThenInListMap!38 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(assert (=> b!128213 (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))

(declare-fun lt!66428 () Unit!3981)

(assert (=> b!128213 (= lt!66428 lt!66405)))

(assert (=> b!128213 false))

(declare-fun b!128214 () Bool)

(assert (=> b!128214 (= e!83717 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66429)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun bm!13878 () Bool)

(assert (=> bm!13878 (= call!13880 call!13881)))

(declare-fun bm!13879 () Bool)

(assert (=> bm!13879 (= call!13882 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128215 () Bool)

(declare-fun res!61920 () Bool)

(assert (=> b!128215 (=> (not res!61920) (not e!83723))))

(assert (=> b!128215 (= res!61920 call!13880)))

(assert (=> b!128215 (= e!83720 e!83723)))

(declare-fun b!128216 () Bool)

(assert (=> b!128216 (= e!83722 (= (map!1394 (_2!1310 lt!66421)) (+!171 (map!1394 newMap!16) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128217 () Bool)

(declare-fun res!61918 () Bool)

(assert (=> b!128217 (= res!61918 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128217 (=> (not res!61918) (not e!83718))))

(declare-fun b!128218 () Bool)

(declare-fun res!61921 () Bool)

(assert (=> b!128218 (= res!61921 call!13881)))

(assert (=> b!128218 (=> (not res!61921) (not e!83717))))

(declare-fun b!128219 () Bool)

(declare-fun Unit!3997 () Unit!3981)

(assert (=> b!128219 (= e!83721 Unit!3997)))

(declare-fun bm!13880 () Bool)

(assert (=> bm!13880 (= call!13883 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!128220 () Bool)

(assert (=> b!128220 (= e!83718 (not call!13882))))

(declare-fun b!128221 () Bool)

(declare-fun res!61919 () Bool)

(assert (=> b!128221 (=> (not res!61919) (not e!83722))))

(assert (=> b!128221 (= res!61919 (contains!884 (map!1394 (_2!1310 lt!66421)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128222 () Bool)

(assert (=> b!128222 (= e!83719 ((_ is Undefined!271) lt!66417))))

(declare-fun b!128223 () Bool)

(declare-fun res!61917 () Bool)

(assert (=> b!128223 (=> (not res!61917) (not e!83723))))

(assert (=> b!128223 (= res!61917 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38669 () Bool)

(assert (=> d!38669 e!83722))

(declare-fun res!61924 () Bool)

(assert (=> d!38669 (=> (not res!61924) (not e!83722))))

(assert (=> d!38669 (= res!61924 (_1!1310 lt!66421))))

(assert (=> d!38669 (= lt!66421 (tuple2!2599 true (LongMapFixedSize!1075 (defaultEntry!2805 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (bvadd (_size!586 newMap!16) #b00000000000000000000000000000001) (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (_vacant!586 newMap!16))))))

(declare-fun lt!66410 () Unit!3981)

(declare-fun lt!66416 () Unit!3981)

(assert (=> d!38669 (= lt!66410 lt!66416)))

(declare-fun lt!66404 () array!4727)

(declare-fun lt!66401 () array!4725)

(assert (=> d!38669 (contains!884 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))

(assert (=> d!38669 (= lt!66416 (lemmaValidKeyInArrayIsInListMap!118 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38669 (= lt!66404 (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))))

(assert (=> d!38669 (= lt!66401 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun lt!66425 () Unit!3981)

(declare-fun lt!66408 () Unit!3981)

(assert (=> d!38669 (= lt!66425 lt!66408)))

(declare-fun lt!66420 () array!4725)

(assert (=> d!38669 (= (arrayCountValidKeys!0 lt!66420 (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4725 (_ BitVec 32)) Unit!3981)

(assert (=> d!38669 (= lt!66408 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!66420 (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))

(assert (=> d!38669 (= lt!66420 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun lt!66414 () Unit!3981)

(declare-fun lt!66422 () Unit!3981)

(assert (=> d!38669 (= lt!66414 lt!66422)))

(declare-fun lt!66409 () array!4725)

(assert (=> d!38669 (arrayContainsKey!0 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!38669 (= lt!66422 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))

(assert (=> d!38669 (= lt!66409 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun lt!66415 () Unit!3981)

(declare-fun lt!66407 () Unit!3981)

(assert (=> d!38669 (= lt!66415 lt!66407)))

(assert (=> d!38669 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!38 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) (_ BitVec 64) V!3451 Int) Unit!3981)

(assert (=> d!38669 (= lt!66407 (lemmaAddValidKeyToArrayThenAddPairToListMap!38 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66403 () Unit!3981)

(declare-fun lt!66423 () Unit!3981)

(assert (=> d!38669 (= lt!66403 lt!66423)))

(assert (=> d!38669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (mask!7073 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4725 (_ BitVec 32) (_ BitVec 32)) Unit!3981)

(assert (=> d!38669 (= lt!66423 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (mask!7073 newMap!16)))))

(declare-fun lt!66402 () Unit!3981)

(declare-fun lt!66427 () Unit!3981)

(assert (=> d!38669 (= lt!66402 lt!66427)))

(assert (=> d!38669 (= (arrayCountValidKeys!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4542 newMap!16) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4725 (_ BitVec 32) (_ BitVec 64)) Unit!3981)

(assert (=> d!38669 (= lt!66427 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4542 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun lt!66426 () Unit!3981)

(declare-fun lt!66400 () Unit!3981)

(assert (=> d!38669 (= lt!66426 lt!66400)))

(declare-fun lt!66413 () List!1706)

(declare-fun lt!66411 () (_ BitVec 32))

(assert (=> d!38669 (arrayNoDuplicates!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) lt!66411 lt!66413)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4725 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1706) Unit!3981)

(assert (=> d!38669 (= lt!66400 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) lt!66411 lt!66413))))

(assert (=> d!38669 (= lt!66413 Nil!1703)))

(assert (=> d!38669 (= lt!66411 #b00000000000000000000000000000000)))

(declare-fun lt!66406 () Unit!3981)

(assert (=> d!38669 (= lt!66406 e!83721)))

(declare-fun c!23499 () Bool)

(assert (=> d!38669 (= c!23499 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!66412 () Unit!3981)

(assert (=> d!38669 (= lt!66412 e!83724)))

(assert (=> d!38669 (= c!23502 (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38669 (valid!512 newMap!16)))

(assert (=> d!38669 (= (updateHelperNewKey!57 newMap!16 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))) lt!66421)))

(assert (= (and d!38669 c!23502) b!128207))

(assert (= (and d!38669 (not c!23502)) b!128208))

(assert (= (and b!128207 res!61923) b!128218))

(assert (= (and b!128218 res!61921) b!128214))

(assert (= (and b!128208 c!23501) b!128215))

(assert (= (and b!128208 (not c!23501)) b!128212))

(assert (= (and b!128215 res!61920) b!128223))

(assert (= (and b!128223 res!61917) b!128210))

(assert (= (and b!128212 c!23500) b!128209))

(assert (= (and b!128212 (not c!23500)) b!128222))

(assert (= (and b!128209 res!61922) b!128217))

(assert (= (and b!128217 res!61918) b!128220))

(assert (= (or b!128215 b!128209) bm!13878))

(assert (= (or b!128210 b!128220) bm!13879))

(assert (= (or b!128218 bm!13878) bm!13877))

(assert (= (or b!128207 b!128208) bm!13880))

(assert (= (and d!38669 c!23499) b!128213))

(assert (= (and d!38669 (not c!23499)) b!128219))

(assert (= (and d!38669 res!61924) b!128211))

(assert (= (and b!128211 res!61925) b!128221))

(assert (= (and b!128221 res!61919) b!128216))

(assert (=> b!128207 m!149355))

(assert (=> b!128207 m!149433))

(declare-fun m!149933 () Bool)

(assert (=> b!128216 m!149933))

(assert (=> b!128216 m!149365))

(assert (=> b!128216 m!149365))

(declare-fun m!149935 () Bool)

(assert (=> b!128216 m!149935))

(declare-fun m!149937 () Bool)

(assert (=> bm!13877 m!149937))

(declare-fun m!149939 () Bool)

(assert (=> b!128217 m!149939))

(assert (=> b!128221 m!149933))

(assert (=> b!128221 m!149933))

(assert (=> b!128221 m!149355))

(declare-fun m!149941 () Bool)

(assert (=> b!128221 m!149941))

(assert (=> bm!13879 m!149355))

(assert (=> bm!13879 m!149445))

(assert (=> b!128208 m!149355))

(assert (=> b!128208 m!149455))

(declare-fun m!149943 () Bool)

(assert (=> b!128214 m!149943))

(declare-fun m!149945 () Bool)

(assert (=> b!128223 m!149945))

(assert (=> b!128213 m!149355))

(declare-fun m!149947 () Bool)

(assert (=> b!128213 m!149947))

(assert (=> b!128213 m!149437))

(assert (=> b!128213 m!149437))

(assert (=> b!128213 m!149355))

(declare-fun m!149949 () Bool)

(assert (=> b!128213 m!149949))

(assert (=> bm!13880 m!149355))

(assert (=> bm!13880 m!149427))

(assert (=> d!38669 m!149355))

(declare-fun m!149951 () Bool)

(assert (=> d!38669 m!149951))

(assert (=> d!38669 m!149355))

(declare-fun m!149953 () Bool)

(assert (=> d!38669 m!149953))

(assert (=> d!38669 m!149341))

(declare-fun m!149955 () Bool)

(assert (=> d!38669 m!149955))

(assert (=> d!38669 m!149355))

(assert (=> d!38669 m!149445))

(assert (=> d!38669 m!149355))

(assert (=> d!38669 m!149353))

(declare-fun m!149957 () Bool)

(assert (=> d!38669 m!149957))

(assert (=> d!38669 m!149409))

(assert (=> d!38669 m!149355))

(declare-fun m!149959 () Bool)

(assert (=> d!38669 m!149959))

(declare-fun m!149961 () Bool)

(assert (=> d!38669 m!149961))

(declare-fun m!149963 () Bool)

(assert (=> d!38669 m!149963))

(declare-fun m!149965 () Bool)

(assert (=> d!38669 m!149965))

(declare-fun m!149967 () Bool)

(assert (=> d!38669 m!149967))

(declare-fun m!149969 () Bool)

(assert (=> d!38669 m!149969))

(assert (=> d!38669 m!149355))

(declare-fun m!149971 () Bool)

(assert (=> d!38669 m!149971))

(declare-fun m!149973 () Bool)

(assert (=> d!38669 m!149973))

(assert (=> d!38669 m!149355))

(declare-fun m!149975 () Bool)

(assert (=> d!38669 m!149975))

(assert (=> d!38669 m!149437))

(assert (=> d!38669 m!149865))

(declare-fun m!149977 () Bool)

(assert (=> d!38669 m!149977))

(assert (=> d!38669 m!149437))

(assert (=> d!38669 m!149355))

(assert (=> d!38669 m!149949))

(assert (=> d!38669 m!149437))

(declare-fun m!149979 () Bool)

(assert (=> d!38669 m!149979))

(assert (=> d!38669 m!149965))

(declare-fun m!149981 () Bool)

(assert (=> d!38669 m!149981))

(declare-fun m!149983 () Bool)

(assert (=> d!38669 m!149983))

(assert (=> d!38669 m!149967))

(declare-fun m!149985 () Bool)

(assert (=> d!38669 m!149985))

(declare-fun m!149987 () Bool)

(assert (=> b!128211 m!149987))

(assert (=> bm!13797 d!38669))

(declare-fun d!38671 () Bool)

(declare-fun e!83727 () Bool)

(assert (=> d!38671 e!83727))

(declare-fun res!61930 () Bool)

(assert (=> d!38671 (=> (not res!61930) (not e!83727))))

(declare-fun lt!66435 () SeekEntryResult!271)

(assert (=> d!38671 (= res!61930 ((_ is Found!271) lt!66435))))

(assert (=> d!38671 (= lt!66435 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun lt!66434 () Unit!3981)

(declare-fun choose!779 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 64) Int) Unit!3981)

(assert (=> d!38671 (= lt!66434 (choose!779 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38671 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38671 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)) lt!66434)))

(declare-fun b!128228 () Bool)

(declare-fun res!61931 () Bool)

(assert (=> b!128228 (=> (not res!61931) (not e!83727))))

(assert (=> b!128228 (= res!61931 (inRange!0 (index!3241 lt!66435) (mask!7073 newMap!16)))))

(declare-fun b!128229 () Bool)

(assert (=> b!128229 (= e!83727 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66435)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!128229 (and (bvsge (index!3241 lt!66435) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66435) (size!2502 (_keys!4542 newMap!16))))))

(assert (= (and d!38671 res!61930) b!128228))

(assert (= (and b!128228 res!61931) b!128229))

(assert (=> d!38671 m!149355))

(assert (=> d!38671 m!149427))

(assert (=> d!38671 m!149355))

(declare-fun m!149989 () Bool)

(assert (=> d!38671 m!149989))

(assert (=> d!38671 m!149599))

(declare-fun m!149991 () Bool)

(assert (=> b!128228 m!149991))

(declare-fun m!149993 () Bool)

(assert (=> b!128229 m!149993))

(assert (=> bm!13806 d!38671))

(declare-fun d!38673 () Bool)

(assert (=> d!38673 (isDefined!121 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun lt!66438 () Unit!3981)

(declare-fun choose!780 (List!1704 (_ BitVec 64)) Unit!3981)

(assert (=> d!38673 (= lt!66438 (choose!780 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun e!83730 () Bool)

(assert (=> d!38673 e!83730))

(declare-fun res!61934 () Bool)

(assert (=> d!38673 (=> (not res!61934) (not e!83730))))

(declare-fun isStrictlySorted!318 (List!1704) Bool)

(assert (=> d!38673 (= res!61934 (isStrictlySorted!318 (toList!861 lt!65992)))))

(assert (=> d!38673 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66438)))

(declare-fun b!128232 () Bool)

(assert (=> b!128232 (= e!83730 (containsKey!172 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!38673 res!61934) b!128232))

(assert (=> d!38673 m!149355))

(assert (=> d!38673 m!149419))

(assert (=> d!38673 m!149419))

(assert (=> d!38673 m!149421))

(assert (=> d!38673 m!149355))

(declare-fun m!149995 () Bool)

(assert (=> d!38673 m!149995))

(declare-fun m!149997 () Bool)

(assert (=> d!38673 m!149997))

(assert (=> b!128232 m!149355))

(assert (=> b!128232 m!149415))

(assert (=> b!127731 d!38673))

(assert (=> b!127731 d!38601))

(assert (=> b!127731 d!38603))

(declare-fun d!38675 () Bool)

(declare-fun e!83732 () Bool)

(assert (=> d!38675 e!83732))

(declare-fun res!61935 () Bool)

(assert (=> d!38675 (=> res!61935 e!83732)))

(declare-fun lt!66439 () Bool)

(assert (=> d!38675 (= res!61935 (not lt!66439))))

(declare-fun lt!66442 () Bool)

(assert (=> d!38675 (= lt!66439 lt!66442)))

(declare-fun lt!66441 () Unit!3981)

(declare-fun e!83731 () Unit!3981)

(assert (=> d!38675 (= lt!66441 e!83731)))

(declare-fun c!23503 () Bool)

(assert (=> d!38675 (= c!23503 lt!66442)))

(assert (=> d!38675 (= lt!66442 (containsKey!172 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38675 (= (contains!884 lt!66157 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66439)))

(declare-fun b!128233 () Bool)

(declare-fun lt!66440 () Unit!3981)

(assert (=> b!128233 (= e!83731 lt!66440)))

(assert (=> b!128233 (= lt!66440 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128233 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128234 () Bool)

(declare-fun Unit!3998 () Unit!3981)

(assert (=> b!128234 (= e!83731 Unit!3998)))

(declare-fun b!128235 () Bool)

(assert (=> b!128235 (= e!83732 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38675 c!23503) b!128233))

(assert (= (and d!38675 (not c!23503)) b!128234))

(assert (= (and d!38675 (not res!61935)) b!128235))

(declare-fun m!149999 () Bool)

(assert (=> d!38675 m!149999))

(declare-fun m!150001 () Bool)

(assert (=> b!128233 m!150001))

(assert (=> b!128233 m!149821))

(assert (=> b!128233 m!149821))

(declare-fun m!150003 () Bool)

(assert (=> b!128233 m!150003))

(assert (=> b!128235 m!149821))

(assert (=> b!128235 m!149821))

(assert (=> b!128235 m!150003))

(assert (=> bm!13825 d!38675))

(declare-fun d!38677 () Bool)

(assert (=> d!38677 (= (inRange!0 (ite c!23389 (ite c!23400 (index!3241 lt!66068) (ite c!23395 (index!3240 lt!66088) (index!3243 lt!66088))) (ite c!23399 (index!3241 lt!66075) (ite c!23394 (index!3240 lt!66077) (index!3243 lt!66077)))) (mask!7073 newMap!16)) (and (bvsge (ite c!23389 (ite c!23400 (index!3241 lt!66068) (ite c!23395 (index!3240 lt!66088) (index!3243 lt!66088))) (ite c!23399 (index!3241 lt!66075) (ite c!23394 (index!3240 lt!66077) (index!3243 lt!66077)))) #b00000000000000000000000000000000) (bvslt (ite c!23389 (ite c!23400 (index!3241 lt!66068) (ite c!23395 (index!3240 lt!66088) (index!3243 lt!66088))) (ite c!23399 (index!3241 lt!66075) (ite c!23394 (index!3240 lt!66077) (index!3243 lt!66077)))) (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13798 d!38677))

(declare-fun d!38679 () Bool)

(assert (=> d!38679 (= (apply!112 lt!66157 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1459 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5305 () Bool)

(assert (= bs!5305 d!38679))

(assert (=> bs!5305 m!149485))

(assert (=> bs!5305 m!149609))

(assert (=> bs!5305 m!149609))

(declare-fun m!150005 () Bool)

(assert (=> bs!5305 m!150005))

(assert (=> b!127912 d!38679))

(declare-fun d!38681 () Bool)

(declare-fun c!23504 () Bool)

(assert (=> d!38681 (= c!23504 ((_ is ValueCellFull!1083) (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!83733 () V!3451)

(assert (=> d!38681 (= (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83733)))

(declare-fun b!128236 () Bool)

(assert (=> b!128236 (= e!83733 (get!1457 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128237 () Bool)

(assert (=> b!128237 (= e!83733 (get!1458 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38681 c!23504) b!128236))

(assert (= (and d!38681 (not c!23504)) b!128237))

(assert (=> b!128236 m!149529))

(assert (=> b!128236 m!149351))

(declare-fun m!150007 () Bool)

(assert (=> b!128236 m!150007))

(assert (=> b!128237 m!149529))

(assert (=> b!128237 m!149351))

(declare-fun m!150009 () Bool)

(assert (=> b!128237 m!150009))

(assert (=> b!127912 d!38681))

(declare-fun d!38683 () Bool)

(declare-fun res!61936 () Bool)

(declare-fun e!83734 () Bool)

(assert (=> d!38683 (=> (not res!61936) (not e!83734))))

(assert (=> d!38683 (= res!61936 (simpleValid!88 (_2!1310 lt!66078)))))

(assert (=> d!38683 (= (valid!512 (_2!1310 lt!66078)) e!83734)))

(declare-fun b!128238 () Bool)

(declare-fun res!61937 () Bool)

(assert (=> b!128238 (=> (not res!61937) (not e!83734))))

(assert (=> b!128238 (= res!61937 (= (arrayCountValidKeys!0 (_keys!4542 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))) (_size!586 (_2!1310 lt!66078))))))

(declare-fun b!128239 () Bool)

(declare-fun res!61938 () Bool)

(assert (=> b!128239 (=> (not res!61938) (not e!83734))))

(assert (=> b!128239 (= res!61938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078))))))

(declare-fun b!128240 () Bool)

(assert (=> b!128240 (= e!83734 (arrayNoDuplicates!0 (_keys!4542 (_2!1310 lt!66078)) #b00000000000000000000000000000000 Nil!1703))))

(assert (= (and d!38683 res!61936) b!128238))

(assert (= (and b!128238 res!61937) b!128239))

(assert (= (and b!128239 res!61938) b!128240))

(declare-fun m!150011 () Bool)

(assert (=> d!38683 m!150011))

(declare-fun m!150013 () Bool)

(assert (=> b!128238 m!150013))

(declare-fun m!150015 () Bool)

(assert (=> b!128239 m!150015))

(declare-fun m!150017 () Bool)

(assert (=> b!128240 m!150017))

(assert (=> d!38575 d!38683))

(assert (=> d!38575 d!38571))

(declare-fun d!38685 () Bool)

(assert (=> d!38685 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66445 () Unit!3981)

(declare-fun choose!781 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 V!3451 Int) Unit!3981)

(assert (=> d!38685 (= lt!66445 (choose!781 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38685 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38685 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)) lt!66445)))

(declare-fun bs!5306 () Bool)

(assert (= bs!5306 d!38685))

(assert (=> bs!5306 m!149437))

(declare-fun m!150019 () Bool)

(assert (=> bs!5306 m!150019))

(assert (=> bs!5306 m!149437))

(assert (=> bs!5306 m!149599))

(assert (=> bs!5306 m!149353))

(declare-fun m!150021 () Bool)

(assert (=> bs!5306 m!150021))

(assert (=> bs!5306 m!149353))

(declare-fun m!150023 () Bool)

(assert (=> bs!5306 m!150023))

(assert (=> b!127850 d!38685))

(declare-fun d!38687 () Bool)

(declare-fun e!83736 () Bool)

(assert (=> d!38687 e!83736))

(declare-fun res!61939 () Bool)

(assert (=> d!38687 (=> res!61939 e!83736)))

(declare-fun lt!66446 () Bool)

(assert (=> d!38687 (= res!61939 (not lt!66446))))

(declare-fun lt!66449 () Bool)

(assert (=> d!38687 (= lt!66446 lt!66449)))

(declare-fun lt!66448 () Unit!3981)

(declare-fun e!83735 () Unit!3981)

(assert (=> d!38687 (= lt!66448 e!83735)))

(declare-fun c!23505 () Bool)

(assert (=> d!38687 (= c!23505 lt!66449)))

(assert (=> d!38687 (= lt!66449 (containsKey!172 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38687 (= (contains!884 lt!66157 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66446)))

(declare-fun b!128241 () Bool)

(declare-fun lt!66447 () Unit!3981)

(assert (=> b!128241 (= e!83735 lt!66447)))

(assert (=> b!128241 (= lt!66447 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128241 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128242 () Bool)

(declare-fun Unit!3999 () Unit!3981)

(assert (=> b!128242 (= e!83735 Unit!3999)))

(declare-fun b!128243 () Bool)

(assert (=> b!128243 (= e!83736 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38687 c!23505) b!128241))

(assert (= (and d!38687 (not c!23505)) b!128242))

(assert (= (and d!38687 (not res!61939)) b!128243))

(declare-fun m!150025 () Bool)

(assert (=> d!38687 m!150025))

(declare-fun m!150027 () Bool)

(assert (=> b!128241 m!150027))

(declare-fun m!150029 () Bool)

(assert (=> b!128241 m!150029))

(assert (=> b!128241 m!150029))

(declare-fun m!150031 () Bool)

(assert (=> b!128241 m!150031))

(assert (=> b!128243 m!150029))

(assert (=> b!128243 m!150029))

(assert (=> b!128243 m!150031))

(assert (=> bm!13829 d!38687))

(declare-fun d!38689 () Bool)

(declare-fun res!61940 () Bool)

(declare-fun e!83737 () Bool)

(assert (=> d!38689 (=> (not res!61940) (not e!83737))))

(assert (=> d!38689 (= res!61940 (simpleValid!88 (v!3146 (underlying!445 thiss!992))))))

(assert (=> d!38689 (= (valid!512 (v!3146 (underlying!445 thiss!992))) e!83737)))

(declare-fun b!128244 () Bool)

(declare-fun res!61941 () Bool)

(assert (=> b!128244 (=> (not res!61941) (not e!83737))))

(assert (=> b!128244 (= res!61941 (= (arrayCountValidKeys!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))) (_size!586 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!128245 () Bool)

(declare-fun res!61942 () Bool)

(assert (=> b!128245 (=> (not res!61942) (not e!83737))))

(assert (=> b!128245 (= res!61942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!128246 () Bool)

(assert (=> b!128246 (= e!83737 (arrayNoDuplicates!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000 Nil!1703))))

(assert (= (and d!38689 res!61940) b!128244))

(assert (= (and b!128244 res!61941) b!128245))

(assert (= (and b!128245 res!61942) b!128246))

(declare-fun m!150033 () Bool)

(assert (=> d!38689 m!150033))

(declare-fun m!150035 () Bool)

(assert (=> b!128244 m!150035))

(declare-fun m!150037 () Bool)

(assert (=> b!128245 m!150037))

(declare-fun m!150039 () Bool)

(assert (=> b!128246 m!150039))

(assert (=> d!38593 d!38689))

(declare-fun d!38691 () Bool)

(declare-fun e!83738 () Bool)

(assert (=> d!38691 e!83738))

(declare-fun res!61944 () Bool)

(assert (=> d!38691 (=> (not res!61944) (not e!83738))))

(declare-fun lt!66450 () ListLongMap!1691)

(assert (=> d!38691 (= res!61944 (contains!884 lt!66450 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!66453 () List!1704)

(assert (=> d!38691 (= lt!66450 (ListLongMap!1692 lt!66453))))

(declare-fun lt!66452 () Unit!3981)

(declare-fun lt!66451 () Unit!3981)

(assert (=> d!38691 (= lt!66452 lt!66451)))

(assert (=> d!38691 (= (getValueByKey!168 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38691 (= lt!66451 (lemmaContainsTupThenGetReturnValue!83 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38691 (= lt!66453 (insertStrictlySorted!86 (toList!861 e!83499) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38691 (= (+!171 e!83499 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66450)))

(declare-fun b!128247 () Bool)

(declare-fun res!61943 () Bool)

(assert (=> b!128247 (=> (not res!61943) (not e!83738))))

(assert (=> b!128247 (= res!61943 (= (getValueByKey!168 (toList!861 lt!66450) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!128248 () Bool)

(assert (=> b!128248 (= e!83738 (contains!886 (toList!861 lt!66450) (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38691 res!61944) b!128247))

(assert (= (and b!128247 res!61943) b!128248))

(declare-fun m!150041 () Bool)

(assert (=> d!38691 m!150041))

(declare-fun m!150043 () Bool)

(assert (=> d!38691 m!150043))

(declare-fun m!150045 () Bool)

(assert (=> d!38691 m!150045))

(declare-fun m!150047 () Bool)

(assert (=> d!38691 m!150047))

(declare-fun m!150049 () Bool)

(assert (=> b!128247 m!150049))

(declare-fun m!150051 () Bool)

(assert (=> b!128248 m!150051))

(assert (=> bm!13803 d!38691))

(assert (=> bm!13786 d!38589))

(assert (=> b!127851 d!38599))

(declare-fun d!38693 () Bool)

(assert (=> d!38693 (= (get!1457 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3145 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!127864 d!38693))

(declare-fun d!38695 () Bool)

(declare-fun e!83739 () Bool)

(assert (=> d!38695 e!83739))

(declare-fun res!61946 () Bool)

(assert (=> d!38695 (=> (not res!61946) (not e!83739))))

(declare-fun lt!66454 () ListLongMap!1691)

(assert (=> d!38695 (= res!61946 (contains!884 lt!66454 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun lt!66457 () List!1704)

(assert (=> d!38695 (= lt!66454 (ListLongMap!1692 lt!66457))))

(declare-fun lt!66456 () Unit!3981)

(declare-fun lt!66455 () Unit!3981)

(assert (=> d!38695 (= lt!66456 lt!66455)))

(assert (=> d!38695 (= (getValueByKey!168 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (Some!173 (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38695 (= lt!66455 (lemmaContainsTupThenGetReturnValue!83 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38695 (= lt!66457 (insertStrictlySorted!86 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38695 (= (+!171 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66454)))

(declare-fun b!128249 () Bool)

(declare-fun res!61945 () Bool)

(assert (=> b!128249 (=> (not res!61945) (not e!83739))))

(assert (=> b!128249 (= res!61945 (= (getValueByKey!168 (toList!861 lt!66454) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (Some!173 (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128250 () Bool)

(assert (=> b!128250 (= e!83739 (contains!886 (toList!861 lt!66454) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (= (and d!38695 res!61946) b!128249))

(assert (= (and b!128249 res!61945) b!128250))

(declare-fun m!150053 () Bool)

(assert (=> d!38695 m!150053))

(declare-fun m!150055 () Bool)

(assert (=> d!38695 m!150055))

(declare-fun m!150057 () Bool)

(assert (=> d!38695 m!150057))

(declare-fun m!150059 () Bool)

(assert (=> d!38695 m!150059))

(declare-fun m!150061 () Bool)

(assert (=> b!128249 m!150061))

(declare-fun m!150063 () Bool)

(assert (=> b!128250 m!150063))

(assert (=> bm!13824 d!38695))

(declare-fun b!128261 () Bool)

(declare-fun res!61957 () Bool)

(declare-fun e!83742 () Bool)

(assert (=> b!128261 (=> (not res!61957) (not e!83742))))

(declare-fun size!2506 (LongMapFixedSize!1074) (_ BitVec 32))

(assert (=> b!128261 (= res!61957 (= (size!2506 newMap!16) (bvadd (_size!586 newMap!16) (bvsdiv (bvadd (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!128259 () Bool)

(declare-fun res!61956 () Bool)

(assert (=> b!128259 (=> (not res!61956) (not e!83742))))

(assert (=> b!128259 (= res!61956 (and (= (size!2503 (_values!2788 newMap!16)) (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001)) (= (size!2502 (_keys!4542 newMap!16)) (size!2503 (_values!2788 newMap!16))) (bvsge (_size!586 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!586 newMap!16) (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!128260 () Bool)

(declare-fun res!61958 () Bool)

(assert (=> b!128260 (=> (not res!61958) (not e!83742))))

(assert (=> b!128260 (= res!61958 (bvsge (size!2506 newMap!16) (_size!586 newMap!16)))))

(declare-fun b!128262 () Bool)

(assert (=> b!128262 (= e!83742 (and (bvsge (extraKeys!2582 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2582 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!586 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!38697 () Bool)

(declare-fun res!61955 () Bool)

(assert (=> d!38697 (=> (not res!61955) (not e!83742))))

(assert (=> d!38697 (= res!61955 (validMask!0 (mask!7073 newMap!16)))))

(assert (=> d!38697 (= (simpleValid!88 newMap!16) e!83742)))

(assert (= (and d!38697 res!61955) b!128259))

(assert (= (and b!128259 res!61956) b!128260))

(assert (= (and b!128260 res!61958) b!128261))

(assert (= (and b!128261 res!61957) b!128262))

(declare-fun m!150065 () Bool)

(assert (=> b!128261 m!150065))

(assert (=> b!128260 m!150065))

(assert (=> d!38697 m!149599))

(assert (=> d!38571 d!38697))

(declare-fun d!38699 () Bool)

(assert (=> d!38699 (= (get!1458 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127865 d!38699))

(assert (=> b!127852 d!38611))

(declare-fun d!38701 () Bool)

(declare-fun e!83743 () Bool)

(assert (=> d!38701 e!83743))

(declare-fun res!61960 () Bool)

(assert (=> d!38701 (=> (not res!61960) (not e!83743))))

(declare-fun lt!66458 () ListLongMap!1691)

(assert (=> d!38701 (= res!61960 (contains!884 lt!66458 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66461 () List!1704)

(assert (=> d!38701 (= lt!66458 (ListLongMap!1692 lt!66461))))

(declare-fun lt!66460 () Unit!3981)

(declare-fun lt!66459 () Unit!3981)

(assert (=> d!38701 (= lt!66460 lt!66459)))

(assert (=> d!38701 (= (getValueByKey!168 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38701 (= lt!66459 (lemmaContainsTupThenGetReturnValue!83 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38701 (= lt!66461 (insertStrictlySorted!86 (toList!861 call!13829) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38701 (= (+!171 call!13829 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66458)))

(declare-fun b!128263 () Bool)

(declare-fun res!61959 () Bool)

(assert (=> b!128263 (=> (not res!61959) (not e!83743))))

(assert (=> b!128263 (= res!61959 (= (getValueByKey!168 (toList!861 lt!66458) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128264 () Bool)

(assert (=> b!128264 (= e!83743 (contains!886 (toList!861 lt!66458) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38701 res!61960) b!128263))

(assert (= (and b!128263 res!61959) b!128264))

(declare-fun m!150067 () Bool)

(assert (=> d!38701 m!150067))

(declare-fun m!150069 () Bool)

(assert (=> d!38701 m!150069))

(declare-fun m!150071 () Bool)

(assert (=> d!38701 m!150071))

(declare-fun m!150073 () Bool)

(assert (=> d!38701 m!150073))

(declare-fun m!150075 () Bool)

(assert (=> b!128263 m!150075))

(declare-fun m!150077 () Bool)

(assert (=> b!128264 m!150077))

(assert (=> b!127923 d!38701))

(declare-fun d!38703 () Bool)

(declare-fun res!61965 () Bool)

(declare-fun e!83748 () Bool)

(assert (=> d!38703 (=> res!61965 e!83748)))

(assert (=> d!38703 (= res!61965 (and ((_ is Cons!1700) (toList!861 lt!65992)) (= (_1!1309 (h!2303 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!38703 (= (containsKey!172 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!83748)))

(declare-fun b!128269 () Bool)

(declare-fun e!83749 () Bool)

(assert (=> b!128269 (= e!83748 e!83749)))

(declare-fun res!61966 () Bool)

(assert (=> b!128269 (=> (not res!61966) (not e!83749))))

(assert (=> b!128269 (= res!61966 (and (or (not ((_ is Cons!1700) (toList!861 lt!65992))) (bvsle (_1!1309 (h!2303 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) ((_ is Cons!1700) (toList!861 lt!65992)) (bvslt (_1!1309 (h!2303 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun b!128270 () Bool)

(assert (=> b!128270 (= e!83749 (containsKey!172 (t!6083 (toList!861 lt!65992)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!38703 (not res!61965)) b!128269))

(assert (= (and b!128269 res!61966) b!128270))

(assert (=> b!128270 m!149355))

(declare-fun m!150079 () Bool)

(assert (=> b!128270 m!150079))

(assert (=> d!38573 d!38703))

(declare-fun d!38705 () Bool)

(assert (=> d!38705 (= (apply!112 lt!66157 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5307 () Bool)

(assert (= bs!5307 d!38705))

(assert (=> bs!5307 m!150029))

(assert (=> bs!5307 m!150029))

(declare-fun m!150081 () Bool)

(assert (=> bs!5307 m!150081))

(assert (=> b!127909 d!38705))

(declare-fun d!38707 () Bool)

(declare-fun res!61971 () Bool)

(declare-fun e!83754 () Bool)

(assert (=> d!38707 (=> res!61971 e!83754)))

(assert (=> d!38707 (= res!61971 (= (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38707 (= (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000) e!83754)))

(declare-fun b!128275 () Bool)

(declare-fun e!83755 () Bool)

(assert (=> b!128275 (= e!83754 e!83755)))

(declare-fun res!61972 () Bool)

(assert (=> b!128275 (=> (not res!61972) (not e!83755))))

(assert (=> b!128275 (= res!61972 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128276 () Bool)

(assert (=> b!128276 (= e!83755 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38707 (not res!61971)) b!128275))

(assert (= (and b!128275 res!61972) b!128276))

(assert (=> d!38707 m!149547))

(assert (=> b!128276 m!149355))

(declare-fun m!150083 () Bool)

(assert (=> b!128276 m!150083))

(assert (=> bm!13801 d!38707))

(declare-fun b!128277 () Bool)

(declare-fun e!83757 () Bool)

(assert (=> b!128277 (= e!83757 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4555 () Bool)

(declare-fun mapRes!4555 () Bool)

(declare-fun tp!11053 () Bool)

(assert (=> mapNonEmpty!4555 (= mapRes!4555 (and tp!11053 e!83757))))

(declare-fun mapValue!4555 () ValueCell!1083)

(declare-fun mapKey!4555 () (_ BitVec 32))

(declare-fun mapRest!4555 () (Array (_ BitVec 32) ValueCell!1083))

(assert (=> mapNonEmpty!4555 (= mapRest!4554 (store mapRest!4555 mapKey!4555 mapValue!4555))))

(declare-fun mapIsEmpty!4555 () Bool)

(assert (=> mapIsEmpty!4555 mapRes!4555))

(declare-fun b!128278 () Bool)

(declare-fun e!83756 () Bool)

(assert (=> b!128278 (= e!83756 tp_is_empty!2853)))

(declare-fun condMapEmpty!4555 () Bool)

(declare-fun mapDefault!4555 () ValueCell!1083)

(assert (=> mapNonEmpty!4554 (= condMapEmpty!4555 (= mapRest!4554 ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4555)))))

(assert (=> mapNonEmpty!4554 (= tp!11052 (and e!83756 mapRes!4555))))

(assert (= (and mapNonEmpty!4554 condMapEmpty!4555) mapIsEmpty!4555))

(assert (= (and mapNonEmpty!4554 (not condMapEmpty!4555)) mapNonEmpty!4555))

(assert (= (and mapNonEmpty!4555 ((_ is ValueCellFull!1083) mapValue!4555)) b!128277))

(assert (= (and mapNonEmpty!4554 ((_ is ValueCellFull!1083) mapDefault!4555)) b!128278))

(declare-fun m!150085 () Bool)

(assert (=> mapNonEmpty!4555 m!150085))

(declare-fun b!128279 () Bool)

(declare-fun e!83759 () Bool)

(assert (=> b!128279 (= e!83759 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4556 () Bool)

(declare-fun mapRes!4556 () Bool)

(declare-fun tp!11054 () Bool)

(assert (=> mapNonEmpty!4556 (= mapRes!4556 (and tp!11054 e!83759))))

(declare-fun mapValue!4556 () ValueCell!1083)

(declare-fun mapRest!4556 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapKey!4556 () (_ BitVec 32))

(assert (=> mapNonEmpty!4556 (= mapRest!4553 (store mapRest!4556 mapKey!4556 mapValue!4556))))

(declare-fun mapIsEmpty!4556 () Bool)

(assert (=> mapIsEmpty!4556 mapRes!4556))

(declare-fun b!128280 () Bool)

(declare-fun e!83758 () Bool)

(assert (=> b!128280 (= e!83758 tp_is_empty!2853)))

(declare-fun condMapEmpty!4556 () Bool)

(declare-fun mapDefault!4556 () ValueCell!1083)

(assert (=> mapNonEmpty!4553 (= condMapEmpty!4556 (= mapRest!4553 ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4556)))))

(assert (=> mapNonEmpty!4553 (= tp!11051 (and e!83758 mapRes!4556))))

(assert (= (and mapNonEmpty!4553 condMapEmpty!4556) mapIsEmpty!4556))

(assert (= (and mapNonEmpty!4553 (not condMapEmpty!4556)) mapNonEmpty!4556))

(assert (= (and mapNonEmpty!4556 ((_ is ValueCellFull!1083) mapValue!4556)) b!128279))

(assert (= (and mapNonEmpty!4553 ((_ is ValueCellFull!1083) mapDefault!4556)) b!128280))

(declare-fun m!150087 () Bool)

(assert (=> mapNonEmpty!4556 m!150087))

(declare-fun b_lambda!5665 () Bool)

(assert (= b_lambda!5655 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5665)))

(declare-fun b_lambda!5667 () Bool)

(assert (= b_lambda!5659 (or (and b!127647 b_free!2873) (and b!127644 b_free!2875 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))) b_lambda!5667)))

(declare-fun b_lambda!5669 () Bool)

(assert (= b_lambda!5661 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5669)))

(declare-fun b_lambda!5671 () Bool)

(assert (= b_lambda!5657 (or (and b!127647 b_free!2873) (and b!127644 b_free!2875 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))) b_lambda!5671)))

(declare-fun b_lambda!5673 () Bool)

(assert (= b_lambda!5663 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5673)))

(check-sat (not d!38655) (not b!128052) (not b!128068) (not d!38641) (not b!128211) (not b!127991) (not b!128093) (not b!128096) (not d!38619) (not b!128049) (not d!38701) (not bm!13879) (not bm!13864) (not bm!13850) (not d!38651) (not bm!13832) (not b!127951) (not b!128057) (not bm!13834) (not b!128156) (not d!38679) b_and!7921 (not b!128162) (not bm!13831) (not b!128091) (not bm!13842) (not b!128116) (not bm!13858) (not b!127943) (not b!128150) (not b_lambda!5665) (not b!128092) (not d!38599) (not b!128165) (not b!128243) tp_is_empty!2853 (not d!38637) (not d!38627) (not b!128054) (not d!38629) (not bm!13866) (not b!127962) (not b!128087) (not d!38671) (not b!128114) (not bm!13852) (not d!38605) (not b!127954) (not b!128133) (not b!128250) (not d!38597) (not b!128045) (not b!128118) (not b!128079) (not d!38669) (not b!128167) (not d!38691) (not b!128276) (not b!128043) (not b!128221) (not b!128208) (not b!127949) (not b!128151) (not bm!13877) (not b!128270) (not b!128236) (not b!128111) (not bm!13841) (not b!128246) (not d!38623) (not b!127948) (not b!128263) (not d!38643) (not b!128086) (not b_lambda!5671) (not d!38685) (not b!127975) (not bm!13861) (not bm!13880) (not d!38621) b_and!7919 (not b_lambda!5649) (not d!38615) (not b!128047) (not b!128136) (not bm!13863) (not d!38633) (not b!128089) (not d!38705) (not bm!13868) (not b_lambda!5653) (not b!128249) (not b!128067) (not b!127952) (not b!127960) (not b_lambda!5673) (not b!127953) (not b!128207) (not b!128264) (not b!128216) (not mapNonEmpty!4555) (not b!128051) (not b!128213) (not b!128240) (not d!38635) (not d!38687) (not b_next!2873) (not b!128115) (not d!38617) (not b!128247) (not d!38659) (not b!128248) (not b!128164) (not d!38613) (not bm!13836) (not b!128098) (not b!128124) (not d!38683) (not d!38673) (not b!128232) (not b!128233) (not d!38653) (not b!128050) (not b_lambda!5667) (not b_lambda!5669) (not b!128101) (not b!128062) (not b!128094) (not b!128121) (not d!38609) (not b!128239) (not b!128241) (not b!128244) (not d!38607) (not b!128046) (not bm!13845) (not b!128065) (not b!128166) (not b!128090) (not b!128161) (not d!38639) (not mapNonEmpty!4556) (not bm!13855) (not b!128237) (not b!128147) (not d!38645) (not b!128238) (not d!38697) (not d!38689) (not b!128081) (not d!38625) (not d!38601) (not d!38631) (not bm!13848) (not d!38595) (not d!38611) (not b!128260) (not b_next!2875) (not b!128153) (not b!128063) (not b!128228) (not d!38667) (not d!38647) (not b!128261) (not b!128235) (not b!128245) (not d!38675) (not b!128099) (not b!128066) (not b!127940) (not bm!13847) (not d!38657) (not d!38695))
(check-sat b_and!7919 b_and!7921 (not b_next!2873) (not b_next!2875))
(get-model)

(declare-fun b!128281 () Bool)

(declare-fun e!83762 () Bool)

(declare-fun e!83764 () Bool)

(assert (=> b!128281 (= e!83762 e!83764)))

(declare-fun c!23509 () Bool)

(declare-fun e!83766 () Bool)

(assert (=> b!128281 (= c!23509 e!83766)))

(declare-fun res!61973 () Bool)

(assert (=> b!128281 (=> (not res!61973) (not e!83766))))

(assert (=> b!128281 (= res!61973 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128282 () Bool)

(declare-fun e!83761 () Bool)

(assert (=> b!128282 (= e!83764 e!83761)))

(declare-fun c!23507 () Bool)

(assert (=> b!128282 (= c!23507 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128283 () Bool)

(assert (=> b!128283 (= e!83766 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128283 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128284 () Bool)

(declare-fun e!83765 () ListLongMap!1691)

(declare-fun call!13884 () ListLongMap!1691)

(assert (=> b!128284 (= e!83765 call!13884)))

(declare-fun b!128285 () Bool)

(declare-fun lt!66466 () Unit!3981)

(declare-fun lt!66465 () Unit!3981)

(assert (=> b!128285 (= lt!66466 lt!66465)))

(declare-fun lt!66468 () (_ BitVec 64))

(declare-fun lt!66463 () V!3451)

(declare-fun lt!66464 () ListLongMap!1691)

(declare-fun lt!66467 () (_ BitVec 64))

(assert (=> b!128285 (not (contains!884 (+!171 lt!66464 (tuple2!2597 lt!66468 lt!66463)) lt!66467))))

(assert (=> b!128285 (= lt!66465 (addStillNotContains!57 lt!66464 lt!66468 lt!66463 lt!66467))))

(assert (=> b!128285 (= lt!66467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128285 (= lt!66463 (get!1455 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128285 (= lt!66468 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128285 (= lt!66464 call!13884)))

(assert (=> b!128285 (= e!83765 (+!171 call!13884 (tuple2!2597 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (get!1455 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128286 () Bool)

(declare-fun e!83763 () ListLongMap!1691)

(assert (=> b!128286 (= e!83763 e!83765)))

(declare-fun c!23508 () Bool)

(assert (=> b!128286 (= c!23508 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13881 () Bool)

(assert (=> bm!13881 (= call!13884 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2805 newMap!16)))))

(declare-fun b!128287 () Bool)

(declare-fun e!83760 () Bool)

(assert (=> b!128287 (= e!83764 e!83760)))

(assert (=> b!128287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun res!61976 () Bool)

(declare-fun lt!66462 () ListLongMap!1691)

(assert (=> b!128287 (= res!61976 (contains!884 lt!66462 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128287 (=> (not res!61976) (not e!83760))))

(declare-fun b!128288 () Bool)

(assert (=> b!128288 (= e!83763 (ListLongMap!1692 Nil!1701))))

(declare-fun b!128289 () Bool)

(assert (=> b!128289 (= e!83761 (= lt!66462 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2805 newMap!16))))))

(declare-fun d!38709 () Bool)

(assert (=> d!38709 e!83762))

(declare-fun res!61974 () Bool)

(assert (=> d!38709 (=> (not res!61974) (not e!83762))))

(assert (=> d!38709 (= res!61974 (not (contains!884 lt!66462 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38709 (= lt!66462 e!83763)))

(declare-fun c!23506 () Bool)

(assert (=> d!38709 (= c!23506 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38709 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38709 (= (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66462)))

(declare-fun b!128290 () Bool)

(assert (=> b!128290 (= e!83761 (isEmpty!400 lt!66462))))

(declare-fun b!128291 () Bool)

(declare-fun res!61975 () Bool)

(assert (=> b!128291 (=> (not res!61975) (not e!83762))))

(assert (=> b!128291 (= res!61975 (not (contains!884 lt!66462 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128292 () Bool)

(assert (=> b!128292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> b!128292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094))))))

(assert (=> b!128292 (= e!83760 (= (apply!112 lt!66462 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38709 c!23506) b!128288))

(assert (= (and d!38709 (not c!23506)) b!128286))

(assert (= (and b!128286 c!23508) b!128285))

(assert (= (and b!128286 (not c!23508)) b!128284))

(assert (= (or b!128285 b!128284) bm!13881))

(assert (= (and d!38709 res!61974) b!128291))

(assert (= (and b!128291 res!61975) b!128281))

(assert (= (and b!128281 res!61973) b!128283))

(assert (= (and b!128281 c!23509) b!128287))

(assert (= (and b!128281 (not c!23509)) b!128282))

(assert (= (and b!128287 res!61976) b!128292))

(assert (= (and b!128282 c!23507) b!128289))

(assert (= (and b!128282 (not c!23507)) b!128290))

(declare-fun b_lambda!5675 () Bool)

(assert (=> (not b_lambda!5675) (not b!128285)))

(assert (=> b!128285 t!6091))

(declare-fun b_and!7923 () Bool)

(assert (= b_and!7919 (and (=> t!6091 result!3893) b_and!7923)))

(assert (=> b!128285 t!6093))

(declare-fun b_and!7925 () Bool)

(assert (= b_and!7921 (and (=> t!6093 result!3895) b_and!7925)))

(declare-fun b_lambda!5677 () Bool)

(assert (=> (not b_lambda!5677) (not b!128292)))

(assert (=> b!128292 t!6091))

(declare-fun b_and!7927 () Bool)

(assert (= b_and!7923 (and (=> t!6091 result!3893) b_and!7927)))

(assert (=> b!128292 t!6093))

(declare-fun b_and!7929 () Bool)

(assert (= b_and!7925 (and (=> t!6093 result!3895) b_and!7929)))

(declare-fun m!150089 () Bool)

(assert (=> b!128290 m!150089))

(assert (=> b!128292 m!149547))

(declare-fun m!150091 () Bool)

(assert (=> b!128292 m!150091))

(assert (=> b!128292 m!149591))

(assert (=> b!128292 m!149591))

(assert (=> b!128292 m!149593))

(assert (=> b!128292 m!149597))

(assert (=> b!128292 m!149547))

(assert (=> b!128292 m!149593))

(declare-fun m!150093 () Bool)

(assert (=> b!128289 m!150093))

(declare-fun m!150095 () Bool)

(assert (=> b!128285 m!150095))

(declare-fun m!150097 () Bool)

(assert (=> b!128285 m!150097))

(assert (=> b!128285 m!149591))

(assert (=> b!128285 m!149591))

(assert (=> b!128285 m!149593))

(assert (=> b!128285 m!149597))

(declare-fun m!150099 () Bool)

(assert (=> b!128285 m!150099))

(assert (=> b!128285 m!149547))

(assert (=> b!128285 m!149593))

(assert (=> b!128285 m!150095))

(declare-fun m!150101 () Bool)

(assert (=> b!128285 m!150101))

(assert (=> b!128286 m!149547))

(assert (=> b!128286 m!149547))

(assert (=> b!128286 m!149549))

(assert (=> b!128287 m!149547))

(assert (=> b!128287 m!149547))

(declare-fun m!150103 () Bool)

(assert (=> b!128287 m!150103))

(declare-fun m!150105 () Bool)

(assert (=> d!38709 m!150105))

(assert (=> d!38709 m!149599))

(declare-fun m!150107 () Bool)

(assert (=> b!128291 m!150107))

(assert (=> b!128283 m!149547))

(assert (=> b!128283 m!149547))

(assert (=> b!128283 m!149549))

(assert (=> bm!13881 m!150093))

(assert (=> bm!13834 d!38709))

(declare-fun d!38711 () Bool)

(declare-fun c!23510 () Bool)

(assert (=> d!38711 (= c!23510 (and ((_ is Cons!1700) (toList!861 lt!66295)) (= (_1!1309 (h!2303 (toList!861 lt!66295))) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!83767 () Option!174)

(assert (=> d!38711 (= (getValueByKey!168 (toList!861 lt!66295) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!83767)))

(declare-fun b!128294 () Bool)

(declare-fun e!83768 () Option!174)

(assert (=> b!128294 (= e!83767 e!83768)))

(declare-fun c!23511 () Bool)

(assert (=> b!128294 (= c!23511 (and ((_ is Cons!1700) (toList!861 lt!66295)) (not (= (_1!1309 (h!2303 (toList!861 lt!66295))) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!128295 () Bool)

(assert (=> b!128295 (= e!83768 (getValueByKey!168 (t!6083 (toList!861 lt!66295)) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128296 () Bool)

(assert (=> b!128296 (= e!83768 None!172)))

(declare-fun b!128293 () Bool)

(assert (=> b!128293 (= e!83767 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66295)))))))

(assert (= (and d!38711 c!23510) b!128293))

(assert (= (and d!38711 (not c!23510)) b!128294))

(assert (= (and b!128294 c!23511) b!128295))

(assert (= (and b!128294 (not c!23511)) b!128296))

(declare-fun m!150109 () Bool)

(assert (=> b!128295 m!150109))

(assert (=> b!128114 d!38711))

(declare-fun lt!66471 () Bool)

(declare-fun d!38713 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!127 (List!1704) (InoxSet tuple2!2596))

(assert (=> d!38713 (= lt!66471 (select (content!127 (toList!861 lt!66266)) (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun e!83774 () Bool)

(assert (=> d!38713 (= lt!66471 e!83774)))

(declare-fun res!61982 () Bool)

(assert (=> d!38713 (=> (not res!61982) (not e!83774))))

(assert (=> d!38713 (= res!61982 ((_ is Cons!1700) (toList!861 lt!66266)))))

(assert (=> d!38713 (= (contains!886 (toList!861 lt!66266) (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66471)))

(declare-fun b!128301 () Bool)

(declare-fun e!83773 () Bool)

(assert (=> b!128301 (= e!83774 e!83773)))

(declare-fun res!61981 () Bool)

(assert (=> b!128301 (=> res!61981 e!83773)))

(assert (=> b!128301 (= res!61981 (= (h!2303 (toList!861 lt!66266)) (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128302 () Bool)

(assert (=> b!128302 (= e!83773 (contains!886 (t!6083 (toList!861 lt!66266)) (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38713 res!61982) b!128301))

(assert (= (and b!128301 (not res!61981)) b!128302))

(declare-fun m!150111 () Bool)

(assert (=> d!38713 m!150111))

(declare-fun m!150113 () Bool)

(assert (=> d!38713 m!150113))

(declare-fun m!150115 () Bool)

(assert (=> b!128302 m!150115))

(assert (=> b!128087 d!38713))

(declare-fun d!38715 () Bool)

(declare-fun e!83775 () Bool)

(assert (=> d!38715 e!83775))

(declare-fun res!61984 () Bool)

(assert (=> d!38715 (=> (not res!61984) (not e!83775))))

(declare-fun lt!66472 () ListLongMap!1691)

(assert (=> d!38715 (= res!61984 (contains!884 lt!66472 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(declare-fun lt!66475 () List!1704)

(assert (=> d!38715 (= lt!66472 (ListLongMap!1692 lt!66475))))

(declare-fun lt!66474 () Unit!3981)

(declare-fun lt!66473 () Unit!3981)

(assert (=> d!38715 (= lt!66474 lt!66473)))

(assert (=> d!38715 (= (getValueByKey!168 lt!66475 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!38715 (= lt!66473 (lemmaContainsTupThenGetReturnValue!83 lt!66475 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!38715 (= lt!66475 (insertStrictlySorted!86 (toList!861 call!13868) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!38715 (= (+!171 call!13868 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66472)))

(declare-fun b!128303 () Bool)

(declare-fun res!61983 () Bool)

(assert (=> b!128303 (=> (not res!61983) (not e!83775))))

(assert (=> b!128303 (= res!61983 (= (getValueByKey!168 (toList!861 lt!66472) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(declare-fun b!128304 () Bool)

(assert (=> b!128304 (= e!83775 (contains!886 (toList!861 lt!66472) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))

(assert (= (and d!38715 res!61984) b!128303))

(assert (= (and b!128303 res!61983) b!128304))

(declare-fun m!150117 () Bool)

(assert (=> d!38715 m!150117))

(declare-fun m!150119 () Bool)

(assert (=> d!38715 m!150119))

(declare-fun m!150121 () Bool)

(assert (=> d!38715 m!150121))

(declare-fun m!150123 () Bool)

(assert (=> d!38715 m!150123))

(declare-fun m!150125 () Bool)

(assert (=> b!128303 m!150125))

(declare-fun m!150127 () Bool)

(assert (=> b!128304 m!150127))

(assert (=> b!128167 d!38715))

(declare-fun d!38717 () Bool)

(assert (=> d!38717 (= (apply!112 lt!66244 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (getValueByKey!168 (toList!861 lt!66244) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5308 () Bool)

(assert (= bs!5308 d!38717))

(assert (=> bs!5308 m!149547))

(declare-fun m!150129 () Bool)

(assert (=> bs!5308 m!150129))

(assert (=> bs!5308 m!150129))

(declare-fun m!150131 () Bool)

(assert (=> bs!5308 m!150131))

(assert (=> b!128057 d!38717))

(declare-fun d!38719 () Bool)

(declare-fun c!23512 () Bool)

(assert (=> d!38719 (= c!23512 ((_ is ValueCellFull!1083) (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!83776 () V!3451)

(assert (=> d!38719 (= (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83776)))

(declare-fun b!128305 () Bool)

(assert (=> b!128305 (= e!83776 (get!1457 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128306 () Bool)

(assert (=> b!128306 (= e!83776 (get!1458 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38719 c!23512) b!128305))

(assert (= (and d!38719 (not c!23512)) b!128306))

(assert (=> b!128305 m!149707))

(assert (=> b!128305 m!149593))

(declare-fun m!150133 () Bool)

(assert (=> b!128305 m!150133))

(assert (=> b!128306 m!149707))

(assert (=> b!128306 m!149593))

(declare-fun m!150135 () Bool)

(assert (=> b!128306 m!150135))

(assert (=> b!128057 d!38719))

(declare-fun d!38721 () Bool)

(assert (=> d!38721 (= (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66139)) (v!3150 (getValueByKey!168 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66139)))))

(assert (=> d!38635 d!38721))

(declare-fun d!38723 () Bool)

(declare-fun c!23513 () Bool)

(assert (=> d!38723 (= c!23513 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66139)))))

(declare-fun e!83777 () Option!174)

(assert (=> d!38723 (= (getValueByKey!168 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66139) e!83777)))

(declare-fun b!128308 () Bool)

(declare-fun e!83778 () Option!174)

(assert (=> b!128308 (= e!83777 e!83778)))

(declare-fun c!23514 () Bool)

(assert (=> b!128308 (= c!23514 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (not (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66139))))))

(declare-fun b!128309 () Bool)

(assert (=> b!128309 (= e!83778 (getValueByKey!168 (t!6083 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66139))))

(declare-fun b!128310 () Bool)

(assert (=> b!128310 (= e!83778 None!172)))

(declare-fun b!128307 () Bool)

(assert (=> b!128307 (= e!83777 (Some!173 (_2!1309 (h!2303 (toList!861 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(assert (= (and d!38723 c!23513) b!128307))

(assert (= (and d!38723 (not c!23513)) b!128308))

(assert (= (and b!128308 c!23514) b!128309))

(assert (= (and b!128308 (not c!23514)) b!128310))

(declare-fun m!150137 () Bool)

(assert (=> b!128309 m!150137))

(assert (=> d!38635 d!38723))

(declare-fun d!38725 () Bool)

(declare-fun c!23515 () Bool)

(assert (=> d!38725 (= c!23515 (and ((_ is Cons!1700) (toList!861 lt!66454)) (= (_1!1309 (h!2303 (toList!861 lt!66454))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun e!83779 () Option!174)

(assert (=> d!38725 (= (getValueByKey!168 (toList!861 lt!66454) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) e!83779)))

(declare-fun b!128312 () Bool)

(declare-fun e!83780 () Option!174)

(assert (=> b!128312 (= e!83779 e!83780)))

(declare-fun c!23516 () Bool)

(assert (=> b!128312 (= c!23516 (and ((_ is Cons!1700) (toList!861 lt!66454)) (not (= (_1!1309 (h!2303 (toList!861 lt!66454))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(declare-fun b!128313 () Bool)

(assert (=> b!128313 (= e!83780 (getValueByKey!168 (t!6083 (toList!861 lt!66454)) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128314 () Bool)

(assert (=> b!128314 (= e!83780 None!172)))

(declare-fun b!128311 () Bool)

(assert (=> b!128311 (= e!83779 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66454)))))))

(assert (= (and d!38725 c!23515) b!128311))

(assert (= (and d!38725 (not c!23515)) b!128312))

(assert (= (and b!128312 c!23516) b!128313))

(assert (= (and b!128312 (not c!23516)) b!128314))

(declare-fun m!150139 () Bool)

(assert (=> b!128313 m!150139))

(assert (=> b!128249 d!38725))

(declare-fun d!38727 () Bool)

(declare-fun c!23517 () Bool)

(assert (=> d!38727 (= c!23517 (and ((_ is Cons!1700) (toList!861 lt!66458)) (= (_1!1309 (h!2303 (toList!861 lt!66458))) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!83781 () Option!174)

(assert (=> d!38727 (= (getValueByKey!168 (toList!861 lt!66458) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!83781)))

(declare-fun b!128316 () Bool)

(declare-fun e!83782 () Option!174)

(assert (=> b!128316 (= e!83781 e!83782)))

(declare-fun c!23518 () Bool)

(assert (=> b!128316 (= c!23518 (and ((_ is Cons!1700) (toList!861 lt!66458)) (not (= (_1!1309 (h!2303 (toList!861 lt!66458))) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128317 () Bool)

(assert (=> b!128317 (= e!83782 (getValueByKey!168 (t!6083 (toList!861 lt!66458)) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128318 () Bool)

(assert (=> b!128318 (= e!83782 None!172)))

(declare-fun b!128315 () Bool)

(assert (=> b!128315 (= e!83781 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66458)))))))

(assert (= (and d!38727 c!23517) b!128315))

(assert (= (and d!38727 (not c!23517)) b!128316))

(assert (= (and b!128316 c!23518) b!128317))

(assert (= (and b!128316 (not c!23518)) b!128318))

(declare-fun m!150141 () Bool)

(assert (=> b!128317 m!150141))

(assert (=> b!128263 d!38727))

(declare-fun d!38729 () Bool)

(assert (=> d!38729 (isDefined!121 (getValueByKey!168 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun lt!66476 () Unit!3981)

(assert (=> d!38729 (= lt!66476 (choose!780 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun e!83783 () Bool)

(assert (=> d!38729 e!83783))

(declare-fun res!61985 () Bool)

(assert (=> d!38729 (=> (not res!61985) (not e!83783))))

(assert (=> d!38729 (= res!61985 (isStrictlySorted!318 (toList!861 e!83487)))))

(assert (=> d!38729 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66476)))

(declare-fun b!128319 () Bool)

(assert (=> b!128319 (= e!83783 (containsKey!172 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!38729 res!61985) b!128319))

(assert (=> d!38729 m!149355))

(assert (=> d!38729 m!149829))

(assert (=> d!38729 m!149829))

(assert (=> d!38729 m!149831))

(assert (=> d!38729 m!149355))

(declare-fun m!150143 () Bool)

(assert (=> d!38729 m!150143))

(declare-fun m!150145 () Bool)

(assert (=> d!38729 m!150145))

(assert (=> b!128319 m!149355))

(assert (=> b!128319 m!149825))

(assert (=> b!128099 d!38729))

(declare-fun d!38731 () Bool)

(assert (=> d!38731 (= (isDefined!121 (getValueByKey!168 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) (not (isEmpty!399 (getValueByKey!168 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun bs!5309 () Bool)

(assert (= bs!5309 d!38731))

(assert (=> bs!5309 m!149829))

(declare-fun m!150147 () Bool)

(assert (=> bs!5309 m!150147))

(assert (=> b!128099 d!38731))

(declare-fun d!38733 () Bool)

(declare-fun c!23519 () Bool)

(assert (=> d!38733 (= c!23519 (and ((_ is Cons!1700) (toList!861 e!83487)) (= (_1!1309 (h!2303 (toList!861 e!83487))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun e!83784 () Option!174)

(assert (=> d!38733 (= (getValueByKey!168 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!83784)))

(declare-fun b!128321 () Bool)

(declare-fun e!83785 () Option!174)

(assert (=> b!128321 (= e!83784 e!83785)))

(declare-fun c!23520 () Bool)

(assert (=> b!128321 (= c!23520 (and ((_ is Cons!1700) (toList!861 e!83487)) (not (= (_1!1309 (h!2303 (toList!861 e!83487))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun b!128322 () Bool)

(assert (=> b!128322 (= e!83785 (getValueByKey!168 (t!6083 (toList!861 e!83487)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128323 () Bool)

(assert (=> b!128323 (= e!83785 None!172)))

(declare-fun b!128320 () Bool)

(assert (=> b!128320 (= e!83784 (Some!173 (_2!1309 (h!2303 (toList!861 e!83487)))))))

(assert (= (and d!38733 c!23519) b!128320))

(assert (= (and d!38733 (not c!23519)) b!128321))

(assert (= (and b!128321 c!23520) b!128322))

(assert (= (and b!128321 (not c!23520)) b!128323))

(assert (=> b!128322 m!149355))

(declare-fun m!150149 () Bool)

(assert (=> b!128322 m!150149))

(assert (=> b!128099 d!38733))

(declare-fun d!38735 () Bool)

(assert (=> d!38735 (= (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128063 d!38735))

(declare-fun d!38737 () Bool)

(declare-fun res!61986 () Bool)

(declare-fun e!83786 () Bool)

(assert (=> d!38737 (=> (not res!61986) (not e!83786))))

(assert (=> d!38737 (= res!61986 (simpleValid!88 (_2!1310 lt!66421)))))

(assert (=> d!38737 (= (valid!512 (_2!1310 lt!66421)) e!83786)))

(declare-fun b!128324 () Bool)

(declare-fun res!61987 () Bool)

(assert (=> b!128324 (=> (not res!61987) (not e!83786))))

(assert (=> b!128324 (= res!61987 (= (arrayCountValidKeys!0 (_keys!4542 (_2!1310 lt!66421)) #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66421)))) (_size!586 (_2!1310 lt!66421))))))

(declare-fun b!128325 () Bool)

(declare-fun res!61988 () Bool)

(assert (=> b!128325 (=> (not res!61988) (not e!83786))))

(assert (=> b!128325 (= res!61988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 (_2!1310 lt!66421)) (mask!7073 (_2!1310 lt!66421))))))

(declare-fun b!128326 () Bool)

(assert (=> b!128326 (= e!83786 (arrayNoDuplicates!0 (_keys!4542 (_2!1310 lt!66421)) #b00000000000000000000000000000000 Nil!1703))))

(assert (= (and d!38737 res!61986) b!128324))

(assert (= (and b!128324 res!61987) b!128325))

(assert (= (and b!128325 res!61988) b!128326))

(declare-fun m!150151 () Bool)

(assert (=> d!38737 m!150151))

(declare-fun m!150153 () Bool)

(assert (=> b!128324 m!150153))

(declare-fun m!150155 () Bool)

(assert (=> b!128325 m!150155))

(declare-fun m!150157 () Bool)

(assert (=> b!128326 m!150157))

(assert (=> b!128211 d!38737))

(declare-fun d!38739 () Bool)

(assert (=> d!38739 (= (inRange!0 (ite c!23450 (index!3240 lt!66203) (index!3243 lt!66203)) (mask!7073 newMap!16)) (and (bvsge (ite c!23450 (index!3240 lt!66203) (index!3243 lt!66203)) #b00000000000000000000000000000000) (bvslt (ite c!23450 (index!3240 lt!66203) (index!3243 lt!66203)) (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13842 d!38739))

(declare-fun d!38741 () Bool)

(assert (=> d!38741 (= (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!399 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5310 () Bool)

(assert (= bs!5310 d!38741))

(assert (=> bs!5310 m!149609))

(declare-fun m!150159 () Bool)

(assert (=> bs!5310 m!150159))

(assert (=> b!127962 d!38741))

(declare-fun d!38743 () Bool)

(declare-fun c!23521 () Bool)

(assert (=> d!38743 (= c!23521 (and ((_ is Cons!1700) (toList!861 lt!66157)) (= (_1!1309 (h!2303 (toList!861 lt!66157))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!83787 () Option!174)

(assert (=> d!38743 (= (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!83787)))

(declare-fun b!128328 () Bool)

(declare-fun e!83788 () Option!174)

(assert (=> b!128328 (= e!83787 e!83788)))

(declare-fun c!23522 () Bool)

(assert (=> b!128328 (= c!23522 (and ((_ is Cons!1700) (toList!861 lt!66157)) (not (= (_1!1309 (h!2303 (toList!861 lt!66157))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!128329 () Bool)

(assert (=> b!128329 (= e!83788 (getValueByKey!168 (t!6083 (toList!861 lt!66157)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128330 () Bool)

(assert (=> b!128330 (= e!83788 None!172)))

(declare-fun b!128327 () Bool)

(assert (=> b!128327 (= e!83787 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66157)))))))

(assert (= (and d!38743 c!23521) b!128327))

(assert (= (and d!38743 (not c!23521)) b!128328))

(assert (= (and b!128328 c!23522) b!128329))

(assert (= (and b!128328 (not c!23522)) b!128330))

(assert (=> b!128329 m!149485))

(declare-fun m!150161 () Bool)

(assert (=> b!128329 m!150161))

(assert (=> b!127962 d!38743))

(declare-fun d!38745 () Bool)

(declare-fun e!83790 () Bool)

(assert (=> d!38745 e!83790))

(declare-fun res!61989 () Bool)

(assert (=> d!38745 (=> res!61989 e!83790)))

(declare-fun lt!66477 () Bool)

(assert (=> d!38745 (= res!61989 (not lt!66477))))

(declare-fun lt!66480 () Bool)

(assert (=> d!38745 (= lt!66477 lt!66480)))

(declare-fun lt!66479 () Unit!3981)

(declare-fun e!83789 () Unit!3981)

(assert (=> d!38745 (= lt!66479 e!83789)))

(declare-fun c!23523 () Bool)

(assert (=> d!38745 (= c!23523 lt!66480)))

(assert (=> d!38745 (= lt!66480 (containsKey!172 (toList!861 lt!66219) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38745 (= (contains!884 lt!66219 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66477)))

(declare-fun b!128331 () Bool)

(declare-fun lt!66478 () Unit!3981)

(assert (=> b!128331 (= e!83789 lt!66478)))

(assert (=> b!128331 (= lt!66478 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66219) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128331 (isDefined!121 (getValueByKey!168 (toList!861 lt!66219) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128332 () Bool)

(declare-fun Unit!4000 () Unit!3981)

(assert (=> b!128332 (= e!83789 Unit!4000)))

(declare-fun b!128333 () Bool)

(assert (=> b!128333 (= e!83790 (isDefined!121 (getValueByKey!168 (toList!861 lt!66219) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38745 c!23523) b!128331))

(assert (= (and d!38745 (not c!23523)) b!128332))

(assert (= (and d!38745 (not res!61989)) b!128333))

(assert (=> d!38745 m!149485))

(declare-fun m!150163 () Bool)

(assert (=> d!38745 m!150163))

(assert (=> b!128331 m!149485))

(declare-fun m!150165 () Bool)

(assert (=> b!128331 m!150165))

(assert (=> b!128331 m!149485))

(declare-fun m!150167 () Bool)

(assert (=> b!128331 m!150167))

(assert (=> b!128331 m!150167))

(declare-fun m!150169 () Bool)

(assert (=> b!128331 m!150169))

(assert (=> b!128333 m!149485))

(assert (=> b!128333 m!150167))

(assert (=> b!128333 m!150167))

(assert (=> b!128333 m!150169))

(assert (=> b!128047 d!38745))

(declare-fun d!38747 () Bool)

(assert (=> d!38747 (= (get!1457 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3145 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128236 d!38747))

(declare-fun d!38749 () Bool)

(declare-fun e!83791 () Bool)

(assert (=> d!38749 e!83791))

(declare-fun res!61991 () Bool)

(assert (=> d!38749 (=> (not res!61991) (not e!83791))))

(declare-fun lt!66481 () ListLongMap!1691)

(assert (=> d!38749 (= res!61991 (contains!884 lt!66481 (_1!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(declare-fun lt!66484 () List!1704)

(assert (=> d!38749 (= lt!66481 (ListLongMap!1692 lt!66484))))

(declare-fun lt!66483 () Unit!3981)

(declare-fun lt!66482 () Unit!3981)

(assert (=> d!38749 (= lt!66483 lt!66482)))

(assert (=> d!38749 (= (getValueByKey!168 lt!66484 (_1!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(assert (=> d!38749 (= lt!66482 (lemmaContainsTupThenGetReturnValue!83 lt!66484 (_1!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (_2!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(assert (=> d!38749 (= lt!66484 (insertStrictlySorted!86 (toList!861 (ite c!23463 call!13853 (ite c!23467 call!13855 call!13849))) (_1!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (_2!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(assert (=> d!38749 (= (+!171 (ite c!23463 call!13853 (ite c!23467 call!13855 call!13849)) (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) lt!66481)))

(declare-fun b!128334 () Bool)

(declare-fun res!61990 () Bool)

(assert (=> b!128334 (=> (not res!61990) (not e!83791))))

(assert (=> b!128334 (= res!61990 (= (getValueByKey!168 (toList!861 lt!66481) (_1!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))))

(declare-fun b!128335 () Bool)

(assert (=> b!128335 (= e!83791 (contains!886 (toList!861 lt!66481) (ite (or c!23463 c!23467) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (= (and d!38749 res!61991) b!128334))

(assert (= (and b!128334 res!61990) b!128335))

(declare-fun m!150171 () Bool)

(assert (=> d!38749 m!150171))

(declare-fun m!150173 () Bool)

(assert (=> d!38749 m!150173))

(declare-fun m!150175 () Bool)

(assert (=> d!38749 m!150175))

(declare-fun m!150177 () Bool)

(assert (=> d!38749 m!150177))

(declare-fun m!150179 () Bool)

(assert (=> b!128334 m!150179))

(declare-fun m!150181 () Bool)

(assert (=> b!128335 m!150181))

(assert (=> bm!13847 d!38749))

(assert (=> b!128207 d!38671))

(declare-fun d!38751 () Bool)

(declare-fun e!83792 () Bool)

(assert (=> d!38751 e!83792))

(declare-fun res!61993 () Bool)

(assert (=> d!38751 (=> (not res!61993) (not e!83792))))

(declare-fun lt!66485 () ListLongMap!1691)

(assert (=> d!38751 (= res!61993 (contains!884 lt!66485 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66488 () List!1704)

(assert (=> d!38751 (= lt!66485 (ListLongMap!1692 lt!66488))))

(declare-fun lt!66487 () Unit!3981)

(declare-fun lt!66486 () Unit!3981)

(assert (=> d!38751 (= lt!66487 lt!66486)))

(assert (=> d!38751 (= (getValueByKey!168 lt!66488 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38751 (= lt!66486 (lemmaContainsTupThenGetReturnValue!83 lt!66488 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38751 (= lt!66488 (insertStrictlySorted!86 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38751 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66485)))

(declare-fun b!128336 () Bool)

(declare-fun res!61992 () Bool)

(assert (=> b!128336 (=> (not res!61992) (not e!83792))))

(assert (=> b!128336 (= res!61992 (= (getValueByKey!168 (toList!861 lt!66485) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128337 () Bool)

(assert (=> b!128337 (= e!83792 (contains!886 (toList!861 lt!66485) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38751 res!61993) b!128336))

(assert (= (and b!128336 res!61992) b!128337))

(declare-fun m!150183 () Bool)

(assert (=> d!38751 m!150183))

(declare-fun m!150185 () Bool)

(assert (=> d!38751 m!150185))

(declare-fun m!150187 () Bool)

(assert (=> d!38751 m!150187))

(declare-fun m!150189 () Bool)

(assert (=> d!38751 m!150189))

(declare-fun m!150191 () Bool)

(assert (=> b!128336 m!150191))

(declare-fun m!150193 () Bool)

(assert (=> b!128337 m!150193))

(assert (=> d!38669 d!38751))

(declare-fun d!38753 () Bool)

(declare-fun e!83794 () Bool)

(assert (=> d!38753 e!83794))

(declare-fun res!61994 () Bool)

(assert (=> d!38753 (=> res!61994 e!83794)))

(declare-fun lt!66489 () Bool)

(assert (=> d!38753 (= res!61994 (not lt!66489))))

(declare-fun lt!66492 () Bool)

(assert (=> d!38753 (= lt!66489 lt!66492)))

(declare-fun lt!66491 () Unit!3981)

(declare-fun e!83793 () Unit!3981)

(assert (=> d!38753 (= lt!66491 e!83793)))

(declare-fun c!23524 () Bool)

(assert (=> d!38753 (= c!23524 lt!66492)))

(assert (=> d!38753 (= lt!66492 (containsKey!172 (toList!861 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(assert (=> d!38753 (= (contains!884 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))) lt!66489)))

(declare-fun b!128338 () Bool)

(declare-fun lt!66490 () Unit!3981)

(assert (=> b!128338 (= e!83793 lt!66490)))

(assert (=> b!128338 (= lt!66490 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(assert (=> b!128338 (isDefined!121 (getValueByKey!168 (toList!861 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(declare-fun b!128339 () Bool)

(declare-fun Unit!4001 () Unit!3981)

(assert (=> b!128339 (= e!83793 Unit!4001)))

(declare-fun b!128340 () Bool)

(assert (=> b!128340 (= e!83794 (isDefined!121 (getValueByKey!168 (toList!861 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))))

(assert (= (and d!38753 c!23524) b!128338))

(assert (= (and d!38753 (not c!23524)) b!128339))

(assert (= (and d!38753 (not res!61994)) b!128340))

(assert (=> d!38753 m!149967))

(declare-fun m!150195 () Bool)

(assert (=> d!38753 m!150195))

(assert (=> b!128338 m!149967))

(declare-fun m!150197 () Bool)

(assert (=> b!128338 m!150197))

(assert (=> b!128338 m!149967))

(declare-fun m!150199 () Bool)

(assert (=> b!128338 m!150199))

(assert (=> b!128338 m!150199))

(declare-fun m!150201 () Bool)

(assert (=> b!128338 m!150201))

(assert (=> b!128340 m!149967))

(assert (=> b!128340 m!150199))

(assert (=> b!128340 m!150199))

(assert (=> b!128340 m!150201))

(assert (=> d!38669 d!38753))

(declare-fun b!128341 () Bool)

(declare-fun e!83795 () Unit!3981)

(declare-fun Unit!4002 () Unit!3981)

(assert (=> b!128341 (= e!83795 Unit!4002)))

(declare-fun b!128342 () Bool)

(declare-fun e!83802 () Bool)

(declare-fun lt!66511 () ListLongMap!1691)

(assert (=> b!128342 (= e!83802 (= (apply!112 lt!66511 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!128343 () Bool)

(declare-fun res!61995 () Bool)

(declare-fun e!83798 () Bool)

(assert (=> b!128343 (=> (not res!61995) (not e!83798))))

(declare-fun e!83800 () Bool)

(assert (=> b!128343 (= res!61995 e!83800)))

(declare-fun c!23527 () Bool)

(assert (=> b!128343 (= c!23527 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128344 () Bool)

(declare-fun e!83797 () Bool)

(declare-fun e!83799 () Bool)

(assert (=> b!128344 (= e!83797 e!83799)))

(declare-fun res!61999 () Bool)

(declare-fun call!13887 () Bool)

(assert (=> b!128344 (= res!61999 call!13887)))

(assert (=> b!128344 (=> (not res!61999) (not e!83799))))

(declare-fun e!83801 () Bool)

(declare-fun b!128345 () Bool)

(assert (=> b!128345 (= e!83801 (= (apply!112 lt!66511 (select (arr!2237 lt!66401) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 lt!66404) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 lt!66404)))))

(assert (=> b!128345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 lt!66401)))))

(declare-fun bm!13882 () Bool)

(declare-fun call!13891 () ListLongMap!1691)

(declare-fun call!13889 () ListLongMap!1691)

(assert (=> bm!13882 (= call!13891 call!13889)))

(declare-fun b!128346 () Bool)

(declare-fun e!83805 () ListLongMap!1691)

(declare-fun call!13885 () ListLongMap!1691)

(assert (=> b!128346 (= e!83805 call!13885)))

(declare-fun b!128347 () Bool)

(assert (=> b!128347 (= e!83797 (not call!13887))))

(declare-fun c!23529 () Bool)

(declare-fun c!23525 () Bool)

(declare-fun bm!13883 () Bool)

(declare-fun call!13888 () ListLongMap!1691)

(assert (=> bm!13883 (= call!13888 (+!171 (ite c!23525 call!13889 (ite c!23529 call!13891 call!13885)) (ite (or c!23525 c!23529) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!128348 () Bool)

(declare-fun call!13890 () Bool)

(assert (=> b!128348 (= e!83800 (not call!13890))))

(declare-fun b!128349 () Bool)

(declare-fun e!83803 () ListLongMap!1691)

(declare-fun call!13886 () ListLongMap!1691)

(assert (=> b!128349 (= e!83803 call!13886)))

(declare-fun b!128350 () Bool)

(declare-fun e!83807 () Bool)

(assert (=> b!128350 (= e!83807 (validKeyInArray!0 (select (arr!2237 lt!66401) #b00000000000000000000000000000000)))))

(declare-fun b!128352 () Bool)

(declare-fun c!23530 () Bool)

(assert (=> b!128352 (= c!23530 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128352 (= e!83803 e!83805)))

(declare-fun bm!13884 () Bool)

(assert (=> bm!13884 (= call!13887 (contains!884 lt!66511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128353 () Bool)

(declare-fun e!83806 () Bool)

(assert (=> b!128353 (= e!83806 e!83801)))

(declare-fun res!62000 () Bool)

(assert (=> b!128353 (=> (not res!62000) (not e!83801))))

(assert (=> b!128353 (= res!62000 (contains!884 lt!66511 (select (arr!2237 lt!66401) #b00000000000000000000000000000000)))))

(assert (=> b!128353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 lt!66401)))))

(declare-fun bm!13885 () Bool)

(assert (=> bm!13885 (= call!13886 call!13888)))

(declare-fun bm!13886 () Bool)

(assert (=> bm!13886 (= call!13889 (getCurrentListMapNoExtraKeys!137 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128354 () Bool)

(declare-fun lt!66497 () Unit!3981)

(assert (=> b!128354 (= e!83795 lt!66497)))

(declare-fun lt!66514 () ListLongMap!1691)

(assert (=> b!128354 (= lt!66514 (getCurrentListMapNoExtraKeys!137 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66508 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66503 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66503 (select (arr!2237 lt!66401) #b00000000000000000000000000000000))))

(declare-fun lt!66494 () Unit!3981)

(assert (=> b!128354 (= lt!66494 (addStillContains!88 lt!66514 lt!66508 (zeroValue!2666 newMap!16) lt!66503))))

(assert (=> b!128354 (contains!884 (+!171 lt!66514 (tuple2!2597 lt!66508 (zeroValue!2666 newMap!16))) lt!66503)))

(declare-fun lt!66500 () Unit!3981)

(assert (=> b!128354 (= lt!66500 lt!66494)))

(declare-fun lt!66512 () ListLongMap!1691)

(assert (=> b!128354 (= lt!66512 (getCurrentListMapNoExtraKeys!137 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66498 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66493 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66493 (select (arr!2237 lt!66401) #b00000000000000000000000000000000))))

(declare-fun lt!66496 () Unit!3981)

(assert (=> b!128354 (= lt!66496 (addApplyDifferent!88 lt!66512 lt!66498 (minValue!2666 newMap!16) lt!66493))))

(assert (=> b!128354 (= (apply!112 (+!171 lt!66512 (tuple2!2597 lt!66498 (minValue!2666 newMap!16))) lt!66493) (apply!112 lt!66512 lt!66493))))

(declare-fun lt!66505 () Unit!3981)

(assert (=> b!128354 (= lt!66505 lt!66496)))

(declare-fun lt!66495 () ListLongMap!1691)

(assert (=> b!128354 (= lt!66495 (getCurrentListMapNoExtraKeys!137 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66504 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66510 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66510 (select (arr!2237 lt!66401) #b00000000000000000000000000000000))))

(declare-fun lt!66502 () Unit!3981)

(assert (=> b!128354 (= lt!66502 (addApplyDifferent!88 lt!66495 lt!66504 (zeroValue!2666 newMap!16) lt!66510))))

(assert (=> b!128354 (= (apply!112 (+!171 lt!66495 (tuple2!2597 lt!66504 (zeroValue!2666 newMap!16))) lt!66510) (apply!112 lt!66495 lt!66510))))

(declare-fun lt!66513 () Unit!3981)

(assert (=> b!128354 (= lt!66513 lt!66502)))

(declare-fun lt!66507 () ListLongMap!1691)

(assert (=> b!128354 (= lt!66507 (getCurrentListMapNoExtraKeys!137 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66506 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66501 () (_ BitVec 64))

(assert (=> b!128354 (= lt!66501 (select (arr!2237 lt!66401) #b00000000000000000000000000000000))))

(assert (=> b!128354 (= lt!66497 (addApplyDifferent!88 lt!66507 lt!66506 (minValue!2666 newMap!16) lt!66501))))

(assert (=> b!128354 (= (apply!112 (+!171 lt!66507 (tuple2!2597 lt!66506 (minValue!2666 newMap!16))) lt!66501) (apply!112 lt!66507 lt!66501))))

(declare-fun b!128355 () Bool)

(assert (=> b!128355 (= e!83799 (= (apply!112 lt!66511 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!128356 () Bool)

(declare-fun e!83804 () ListLongMap!1691)

(assert (=> b!128356 (= e!83804 (+!171 call!13888 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!128357 () Bool)

(assert (=> b!128357 (= e!83798 e!83797)))

(declare-fun c!23528 () Bool)

(assert (=> b!128357 (= c!23528 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128358 () Bool)

(declare-fun res!62001 () Bool)

(assert (=> b!128358 (=> (not res!62001) (not e!83798))))

(assert (=> b!128358 (= res!62001 e!83806)))

(declare-fun res!61997 () Bool)

(assert (=> b!128358 (=> res!61997 e!83806)))

(declare-fun e!83796 () Bool)

(assert (=> b!128358 (= res!61997 (not e!83796))))

(declare-fun res!62002 () Bool)

(assert (=> b!128358 (=> (not res!62002) (not e!83796))))

(assert (=> b!128358 (= res!62002 (bvslt #b00000000000000000000000000000000 (size!2502 lt!66401)))))

(declare-fun b!128359 () Bool)

(assert (=> b!128359 (= e!83804 e!83803)))

(assert (=> b!128359 (= c!23529 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13887 () Bool)

(assert (=> bm!13887 (= call!13885 call!13891)))

(declare-fun b!128360 () Bool)

(assert (=> b!128360 (= e!83805 call!13886)))

(declare-fun b!128351 () Bool)

(assert (=> b!128351 (= e!83796 (validKeyInArray!0 (select (arr!2237 lt!66401) #b00000000000000000000000000000000)))))

(declare-fun d!38755 () Bool)

(assert (=> d!38755 e!83798))

(declare-fun res!61998 () Bool)

(assert (=> d!38755 (=> (not res!61998) (not e!83798))))

(assert (=> d!38755 (= res!61998 (or (bvsge #b00000000000000000000000000000000 (size!2502 lt!66401)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 lt!66401)))))))

(declare-fun lt!66499 () ListLongMap!1691)

(assert (=> d!38755 (= lt!66511 lt!66499)))

(declare-fun lt!66509 () Unit!3981)

(assert (=> d!38755 (= lt!66509 e!83795)))

(declare-fun c!23526 () Bool)

(assert (=> d!38755 (= c!23526 e!83807)))

(declare-fun res!61996 () Bool)

(assert (=> d!38755 (=> (not res!61996) (not e!83807))))

(assert (=> d!38755 (= res!61996 (bvslt #b00000000000000000000000000000000 (size!2502 lt!66401)))))

(assert (=> d!38755 (= lt!66499 e!83804)))

(assert (=> d!38755 (= c!23525 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38755 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38755 (= (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66511)))

(declare-fun b!128361 () Bool)

(assert (=> b!128361 (= e!83800 e!83802)))

(declare-fun res!62003 () Bool)

(assert (=> b!128361 (= res!62003 call!13890)))

(assert (=> b!128361 (=> (not res!62003) (not e!83802))))

(declare-fun bm!13888 () Bool)

(assert (=> bm!13888 (= call!13890 (contains!884 lt!66511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38755 c!23525) b!128356))

(assert (= (and d!38755 (not c!23525)) b!128359))

(assert (= (and b!128359 c!23529) b!128349))

(assert (= (and b!128359 (not c!23529)) b!128352))

(assert (= (and b!128352 c!23530) b!128360))

(assert (= (and b!128352 (not c!23530)) b!128346))

(assert (= (or b!128360 b!128346) bm!13887))

(assert (= (or b!128349 bm!13887) bm!13882))

(assert (= (or b!128349 b!128360) bm!13885))

(assert (= (or b!128356 bm!13882) bm!13886))

(assert (= (or b!128356 bm!13885) bm!13883))

(assert (= (and d!38755 res!61996) b!128350))

(assert (= (and d!38755 c!23526) b!128354))

(assert (= (and d!38755 (not c!23526)) b!128341))

(assert (= (and d!38755 res!61998) b!128358))

(assert (= (and b!128358 res!62002) b!128351))

(assert (= (and b!128358 (not res!61997)) b!128353))

(assert (= (and b!128353 res!62000) b!128345))

(assert (= (and b!128358 res!62001) b!128343))

(assert (= (and b!128343 c!23527) b!128361))

(assert (= (and b!128343 (not c!23527)) b!128348))

(assert (= (and b!128361 res!62003) b!128342))

(assert (= (or b!128361 b!128348) bm!13888))

(assert (= (and b!128343 res!61995) b!128357))

(assert (= (and b!128357 c!23528) b!128344))

(assert (= (and b!128357 (not c!23528)) b!128347))

(assert (= (and b!128344 res!61999) b!128355))

(assert (= (or b!128344 b!128347) bm!13884))

(declare-fun b_lambda!5679 () Bool)

(assert (=> (not b_lambda!5679) (not b!128345)))

(assert (=> b!128345 t!6091))

(declare-fun b_and!7931 () Bool)

(assert (= b_and!7927 (and (=> t!6091 result!3893) b_and!7931)))

(assert (=> b!128345 t!6093))

(declare-fun b_and!7933 () Bool)

(assert (= b_and!7929 (and (=> t!6093 result!3895) b_and!7933)))

(declare-fun m!150203 () Bool)

(assert (=> bm!13888 m!150203))

(declare-fun m!150205 () Bool)

(assert (=> b!128350 m!150205))

(assert (=> b!128350 m!150205))

(declare-fun m!150207 () Bool)

(assert (=> b!128350 m!150207))

(declare-fun m!150209 () Bool)

(assert (=> b!128356 m!150209))

(declare-fun m!150211 () Bool)

(assert (=> b!128354 m!150211))

(declare-fun m!150213 () Bool)

(assert (=> b!128354 m!150213))

(declare-fun m!150215 () Bool)

(assert (=> b!128354 m!150215))

(assert (=> b!128354 m!150205))

(declare-fun m!150217 () Bool)

(assert (=> b!128354 m!150217))

(declare-fun m!150219 () Bool)

(assert (=> b!128354 m!150219))

(declare-fun m!150221 () Bool)

(assert (=> b!128354 m!150221))

(declare-fun m!150223 () Bool)

(assert (=> b!128354 m!150223))

(assert (=> b!128354 m!150221))

(declare-fun m!150225 () Bool)

(assert (=> b!128354 m!150225))

(declare-fun m!150227 () Bool)

(assert (=> b!128354 m!150227))

(assert (=> b!128354 m!150225))

(declare-fun m!150229 () Bool)

(assert (=> b!128354 m!150229))

(declare-fun m!150231 () Bool)

(assert (=> b!128354 m!150231))

(declare-fun m!150233 () Bool)

(assert (=> b!128354 m!150233))

(declare-fun m!150235 () Bool)

(assert (=> b!128354 m!150235))

(assert (=> b!128354 m!150219))

(declare-fun m!150237 () Bool)

(assert (=> b!128354 m!150237))

(declare-fun m!150239 () Bool)

(assert (=> b!128354 m!150239))

(declare-fun m!150241 () Bool)

(assert (=> b!128354 m!150241))

(assert (=> b!128354 m!150231))

(assert (=> b!128353 m!150205))

(assert (=> b!128353 m!150205))

(declare-fun m!150243 () Bool)

(assert (=> b!128353 m!150243))

(declare-fun m!150245 () Bool)

(assert (=> bm!13884 m!150245))

(declare-fun m!150247 () Bool)

(assert (=> bm!13883 m!150247))

(declare-fun m!150249 () Bool)

(assert (=> b!128345 m!150249))

(assert (=> b!128345 m!149593))

(assert (=> b!128345 m!150205))

(assert (=> b!128345 m!150205))

(declare-fun m!150251 () Bool)

(assert (=> b!128345 m!150251))

(assert (=> b!128345 m!150249))

(assert (=> b!128345 m!149593))

(declare-fun m!150253 () Bool)

(assert (=> b!128345 m!150253))

(assert (=> d!38755 m!149599))

(assert (=> b!128351 m!150205))

(assert (=> b!128351 m!150205))

(assert (=> b!128351 m!150207))

(assert (=> bm!13886 m!150211))

(declare-fun m!150255 () Bool)

(assert (=> b!128342 m!150255))

(declare-fun m!150257 () Bool)

(assert (=> b!128355 m!150257))

(assert (=> d!38669 d!38755))

(declare-fun d!38757 () Bool)

(declare-fun res!62004 () Bool)

(declare-fun e!83808 () Bool)

(assert (=> d!38757 (=> res!62004 e!83808)))

(assert (=> d!38757 (= res!62004 (= (select (arr!2237 lt!66409) #b00000000000000000000000000000000) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38757 (= (arrayContainsKey!0 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000) e!83808)))

(declare-fun b!128362 () Bool)

(declare-fun e!83809 () Bool)

(assert (=> b!128362 (= e!83808 e!83809)))

(declare-fun res!62005 () Bool)

(assert (=> b!128362 (=> (not res!62005) (not e!83809))))

(assert (=> b!128362 (= res!62005 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 lt!66409)))))

(declare-fun b!128363 () Bool)

(assert (=> b!128363 (= e!83809 (arrayContainsKey!0 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38757 (not res!62004)) b!128362))

(assert (= (and b!128362 res!62005) b!128363))

(declare-fun m!150259 () Bool)

(assert (=> d!38757 m!150259))

(assert (=> b!128363 m!149355))

(declare-fun m!150261 () Bool)

(assert (=> b!128363 m!150261))

(assert (=> d!38669 d!38757))

(declare-fun d!38759 () Bool)

(declare-fun e!83812 () Bool)

(assert (=> d!38759 e!83812))

(declare-fun res!62008 () Bool)

(assert (=> d!38759 (=> (not res!62008) (not e!83812))))

(assert (=> d!38759 (= res!62008 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 (_keys!4542 newMap!16))) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2503 (_values!2788 newMap!16)))))))

(declare-fun lt!66517 () Unit!3981)

(declare-fun choose!782 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 32) (_ BitVec 64) V!3451 Int) Unit!3981)

(assert (=> d!38759 (= lt!66517 (choose!782 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38759 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38759 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!38 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)) lt!66517)))

(declare-fun b!128366 () Bool)

(assert (=> b!128366 (= e!83812 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))))))

(assert (= (and d!38759 res!62008) b!128366))

(assert (=> d!38759 m!149355))

(assert (=> d!38759 m!149353))

(declare-fun m!150263 () Bool)

(assert (=> d!38759 m!150263))

(assert (=> d!38759 m!149599))

(assert (=> b!128366 m!149983))

(assert (=> b!128366 m!149981))

(assert (=> b!128366 m!149437))

(assert (=> b!128366 m!149865))

(assert (=> b!128366 m!149437))

(assert (=> b!128366 m!149985))

(assert (=> d!38669 d!38759))

(assert (=> d!38669 d!38571))

(declare-fun b!128367 () Bool)

(declare-fun e!83813 () (_ BitVec 32))

(declare-fun call!13892 () (_ BitVec 32))

(assert (=> b!128367 (= e!83813 call!13892)))

(declare-fun bm!13889 () Bool)

(assert (=> bm!13889 (= call!13892 (arrayCountValidKeys!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128368 () Bool)

(declare-fun e!83814 () (_ BitVec 32))

(assert (=> b!128368 (= e!83814 e!83813)))

(declare-fun c!23531 () Bool)

(assert (=> b!128368 (= c!23531 (validKeyInArray!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun lt!66518 () (_ BitVec 32))

(declare-fun d!38761 () Bool)

(assert (=> d!38761 (and (bvsge lt!66518 #b00000000000000000000000000000000) (bvsle lt!66518 (bvsub (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!38761 (= lt!66518 e!83814)))

(declare-fun c!23532 () Bool)

(assert (=> d!38761 (= c!23532 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38761 (and (bvsle #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2502 (_keys!4542 newMap!16)) (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(assert (=> d!38761 (= (arrayCountValidKeys!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) lt!66518)))

(declare-fun b!128369 () Bool)

(assert (=> b!128369 (= e!83813 (bvadd #b00000000000000000000000000000001 call!13892))))

(declare-fun b!128370 () Bool)

(assert (=> b!128370 (= e!83814 #b00000000000000000000000000000000)))

(assert (= (and d!38761 c!23532) b!128370))

(assert (= (and d!38761 (not c!23532)) b!128368))

(assert (= (and b!128368 c!23531) b!128369))

(assert (= (and b!128368 (not c!23531)) b!128367))

(assert (= (or b!128369 b!128367) bm!13889))

(declare-fun m!150265 () Bool)

(assert (=> bm!13889 m!150265))

(declare-fun m!150267 () Bool)

(assert (=> b!128368 m!150267))

(assert (=> b!128368 m!150267))

(declare-fun m!150269 () Bool)

(assert (=> b!128368 m!150269))

(assert (=> d!38669 d!38761))

(declare-fun d!38763 () Bool)

(declare-fun e!83817 () Bool)

(assert (=> d!38763 e!83817))

(declare-fun res!62011 () Bool)

(assert (=> d!38763 (=> (not res!62011) (not e!83817))))

(assert (=> d!38763 (= res!62011 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 (_keys!4542 newMap!16)))))))

(declare-fun lt!66521 () Unit!3981)

(declare-fun choose!102 ((_ BitVec 64) array!4725 (_ BitVec 32) (_ BitVec 32)) Unit!3981)

(assert (=> d!38763 (= lt!66521 (choose!102 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (mask!7073 newMap!16)))))

(assert (=> d!38763 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38763 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (mask!7073 newMap!16)) lt!66521)))

(declare-fun b!128373 () Bool)

(assert (=> b!128373 (= e!83817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (mask!7073 newMap!16)))))

(assert (= (and d!38763 res!62011) b!128373))

(assert (=> d!38763 m!149355))

(declare-fun m!150271 () Bool)

(assert (=> d!38763 m!150271))

(assert (=> d!38763 m!149599))

(assert (=> b!128373 m!149981))

(assert (=> b!128373 m!149961))

(assert (=> d!38669 d!38763))

(declare-fun d!38765 () Bool)

(assert (=> d!38765 (arrayContainsKey!0 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!66524 () Unit!3981)

(declare-fun choose!13 (array!4725 (_ BitVec 64) (_ BitVec 32)) Unit!3981)

(assert (=> d!38765 (= lt!66524 (choose!13 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))

(assert (=> d!38765 (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000)))

(assert (=> d!38765 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!66409 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))) lt!66524)))

(declare-fun bs!5311 () Bool)

(assert (= bs!5311 d!38765))

(assert (=> bs!5311 m!149355))

(assert (=> bs!5311 m!149951))

(assert (=> bs!5311 m!149355))

(declare-fun m!150273 () Bool)

(assert (=> bs!5311 m!150273))

(assert (=> d!38669 d!38765))

(declare-fun d!38767 () Bool)

(declare-fun e!83818 () Bool)

(assert (=> d!38767 e!83818))

(declare-fun res!62012 () Bool)

(assert (=> d!38767 (=> (not res!62012) (not e!83818))))

(assert (=> d!38767 (= res!62012 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 lt!66401))))))

(declare-fun lt!66525 () Unit!3981)

(assert (=> d!38767 (= lt!66525 (choose!777 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (defaultEntry!2805 newMap!16)))))

(assert (=> d!38767 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38767 (= (lemmaValidKeyInArrayIsInListMap!118 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (defaultEntry!2805 newMap!16)) lt!66525)))

(declare-fun b!128374 () Bool)

(assert (=> b!128374 (= e!83818 (contains!884 (getCurrentListMap!539 lt!66401 lt!66404 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 lt!66401) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(assert (= (and d!38767 res!62012) b!128374))

(declare-fun m!150275 () Bool)

(assert (=> d!38767 m!150275))

(assert (=> d!38767 m!149599))

(assert (=> b!128374 m!149965))

(declare-fun m!150277 () Bool)

(assert (=> b!128374 m!150277))

(assert (=> b!128374 m!149965))

(assert (=> b!128374 m!150277))

(declare-fun m!150279 () Bool)

(assert (=> b!128374 m!150279))

(assert (=> d!38669 d!38767))

(declare-fun d!38769 () Bool)

(declare-fun e!83820 () Bool)

(assert (=> d!38769 e!83820))

(declare-fun res!62013 () Bool)

(assert (=> d!38769 (=> res!62013 e!83820)))

(declare-fun lt!66526 () Bool)

(assert (=> d!38769 (= res!62013 (not lt!66526))))

(declare-fun lt!66529 () Bool)

(assert (=> d!38769 (= lt!66526 lt!66529)))

(declare-fun lt!66528 () Unit!3981)

(declare-fun e!83819 () Unit!3981)

(assert (=> d!38769 (= lt!66528 e!83819)))

(declare-fun c!23533 () Bool)

(assert (=> d!38769 (= c!23533 lt!66529)))

(assert (=> d!38769 (= lt!66529 (containsKey!172 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38769 (= (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66526)))

(declare-fun b!128375 () Bool)

(declare-fun lt!66527 () Unit!3981)

(assert (=> b!128375 (= e!83819 lt!66527)))

(assert (=> b!128375 (= lt!66527 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!128375 (isDefined!121 (getValueByKey!168 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128376 () Bool)

(declare-fun Unit!4003 () Unit!3981)

(assert (=> b!128376 (= e!83819 Unit!4003)))

(declare-fun b!128377 () Bool)

(assert (=> b!128377 (= e!83820 (isDefined!121 (getValueByKey!168 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!38769 c!23533) b!128375))

(assert (= (and d!38769 (not c!23533)) b!128376))

(assert (= (and d!38769 (not res!62013)) b!128377))

(assert (=> d!38769 m!149355))

(declare-fun m!150281 () Bool)

(assert (=> d!38769 m!150281))

(assert (=> b!128375 m!149355))

(declare-fun m!150283 () Bool)

(assert (=> b!128375 m!150283))

(assert (=> b!128375 m!149355))

(declare-fun m!150285 () Bool)

(assert (=> b!128375 m!150285))

(assert (=> b!128375 m!150285))

(declare-fun m!150287 () Bool)

(assert (=> b!128375 m!150287))

(assert (=> b!128377 m!149355))

(assert (=> b!128377 m!150285))

(assert (=> b!128377 m!150285))

(assert (=> b!128377 m!150287))

(assert (=> d!38669 d!38769))

(assert (=> d!38669 d!38611))

(declare-fun b!128378 () Bool)

(declare-fun e!83821 () (_ BitVec 32))

(declare-fun call!13893 () (_ BitVec 32))

(assert (=> b!128378 (= e!83821 call!13893)))

(declare-fun bm!13890 () Bool)

(assert (=> bm!13890 (= call!13893 (arrayCountValidKeys!0 lt!66420 (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001) (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001)))))

(declare-fun b!128379 () Bool)

(declare-fun e!83822 () (_ BitVec 32))

(assert (=> b!128379 (= e!83822 e!83821)))

(declare-fun c!23534 () Bool)

(assert (=> b!128379 (= c!23534 (validKeyInArray!0 (select (arr!2237 lt!66420) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(declare-fun d!38771 () Bool)

(declare-fun lt!66530 () (_ BitVec 32))

(assert (=> d!38771 (and (bvsge lt!66530 #b00000000000000000000000000000000) (bvsle lt!66530 (bvsub (size!2502 lt!66420) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(assert (=> d!38771 (= lt!66530 e!83822)))

(declare-fun c!23535 () Bool)

(assert (=> d!38771 (= c!23535 (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001)))))

(assert (=> d!38771 (and (bvsle (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001)) (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001) (size!2502 lt!66420)))))

(assert (=> d!38771 (= (arrayCountValidKeys!0 lt!66420 (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001)) lt!66530)))

(declare-fun b!128380 () Bool)

(assert (=> b!128380 (= e!83821 (bvadd #b00000000000000000000000000000001 call!13893))))

(declare-fun b!128381 () Bool)

(assert (=> b!128381 (= e!83822 #b00000000000000000000000000000000)))

(assert (= (and d!38771 c!23535) b!128381))

(assert (= (and d!38771 (not c!23535)) b!128379))

(assert (= (and b!128379 c!23534) b!128380))

(assert (= (and b!128379 (not c!23534)) b!128378))

(assert (= (or b!128380 b!128378) bm!13890))

(declare-fun m!150289 () Bool)

(assert (=> bm!13890 m!150289))

(declare-fun m!150291 () Bool)

(assert (=> b!128379 m!150291))

(assert (=> b!128379 m!150291))

(declare-fun m!150293 () Bool)

(assert (=> b!128379 m!150293))

(assert (=> d!38669 d!38771))

(assert (=> d!38669 d!38707))

(declare-fun b!128382 () Bool)

(declare-fun e!83823 () Unit!3981)

(declare-fun Unit!4004 () Unit!3981)

(assert (=> b!128382 (= e!83823 Unit!4004)))

(declare-fun b!128383 () Bool)

(declare-fun e!83830 () Bool)

(declare-fun lt!66549 () ListLongMap!1691)

(assert (=> b!128383 (= e!83830 (= (apply!112 lt!66549 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!128384 () Bool)

(declare-fun res!62014 () Bool)

(declare-fun e!83826 () Bool)

(assert (=> b!128384 (=> (not res!62014) (not e!83826))))

(declare-fun e!83828 () Bool)

(assert (=> b!128384 (= res!62014 e!83828)))

(declare-fun c!23538 () Bool)

(assert (=> b!128384 (= c!23538 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128385 () Bool)

(declare-fun e!83825 () Bool)

(declare-fun e!83827 () Bool)

(assert (=> b!128385 (= e!83825 e!83827)))

(declare-fun res!62018 () Bool)

(declare-fun call!13896 () Bool)

(assert (=> b!128385 (= res!62018 call!13896)))

(assert (=> b!128385 (=> (not res!62018) (not e!83827))))

(declare-fun e!83829 () Bool)

(declare-fun b!128386 () Bool)

(assert (=> b!128386 (= e!83829 (= (apply!112 lt!66549 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128386 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))))))

(assert (=> b!128386 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun bm!13891 () Bool)

(declare-fun call!13900 () ListLongMap!1691)

(declare-fun call!13898 () ListLongMap!1691)

(assert (=> bm!13891 (= call!13900 call!13898)))

(declare-fun b!128387 () Bool)

(declare-fun e!83833 () ListLongMap!1691)

(declare-fun call!13894 () ListLongMap!1691)

(assert (=> b!128387 (= e!83833 call!13894)))

(declare-fun b!128388 () Bool)

(assert (=> b!128388 (= e!83825 (not call!13896))))

(declare-fun call!13897 () ListLongMap!1691)

(declare-fun c!23536 () Bool)

(declare-fun bm!13892 () Bool)

(declare-fun c!23540 () Bool)

(assert (=> bm!13892 (= call!13897 (+!171 (ite c!23536 call!13898 (ite c!23540 call!13900 call!13894)) (ite (or c!23536 c!23540) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!128389 () Bool)

(declare-fun call!13899 () Bool)

(assert (=> b!128389 (= e!83828 (not call!13899))))

(declare-fun b!128390 () Bool)

(declare-fun e!83831 () ListLongMap!1691)

(declare-fun call!13895 () ListLongMap!1691)

(assert (=> b!128390 (= e!83831 call!13895)))

(declare-fun e!83835 () Bool)

(declare-fun b!128391 () Bool)

(assert (=> b!128391 (= e!83835 (validKeyInArray!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!128393 () Bool)

(declare-fun c!23541 () Bool)

(assert (=> b!128393 (= c!23541 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128393 (= e!83831 e!83833)))

(declare-fun bm!13893 () Bool)

(assert (=> bm!13893 (= call!13896 (contains!884 lt!66549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128394 () Bool)

(declare-fun e!83834 () Bool)

(assert (=> b!128394 (= e!83834 e!83829)))

(declare-fun res!62019 () Bool)

(assert (=> b!128394 (=> (not res!62019) (not e!83829))))

(assert (=> b!128394 (= res!62019 (contains!884 lt!66549 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!128394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun bm!13894 () Bool)

(assert (=> bm!13894 (= call!13895 call!13897)))

(declare-fun bm!13895 () Bool)

(assert (=> bm!13895 (= call!13898 (getCurrentListMapNoExtraKeys!137 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128395 () Bool)

(declare-fun lt!66535 () Unit!3981)

(assert (=> b!128395 (= e!83823 lt!66535)))

(declare-fun lt!66552 () ListLongMap!1691)

(assert (=> b!128395 (= lt!66552 (getCurrentListMapNoExtraKeys!137 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66546 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66541 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66541 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66532 () Unit!3981)

(assert (=> b!128395 (= lt!66532 (addStillContains!88 lt!66552 lt!66546 (zeroValue!2666 newMap!16) lt!66541))))

(assert (=> b!128395 (contains!884 (+!171 lt!66552 (tuple2!2597 lt!66546 (zeroValue!2666 newMap!16))) lt!66541)))

(declare-fun lt!66538 () Unit!3981)

(assert (=> b!128395 (= lt!66538 lt!66532)))

(declare-fun lt!66550 () ListLongMap!1691)

(assert (=> b!128395 (= lt!66550 (getCurrentListMapNoExtraKeys!137 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66536 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66536 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66531 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66531 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66534 () Unit!3981)

(assert (=> b!128395 (= lt!66534 (addApplyDifferent!88 lt!66550 lt!66536 (minValue!2666 newMap!16) lt!66531))))

(assert (=> b!128395 (= (apply!112 (+!171 lt!66550 (tuple2!2597 lt!66536 (minValue!2666 newMap!16))) lt!66531) (apply!112 lt!66550 lt!66531))))

(declare-fun lt!66543 () Unit!3981)

(assert (=> b!128395 (= lt!66543 lt!66534)))

(declare-fun lt!66533 () ListLongMap!1691)

(assert (=> b!128395 (= lt!66533 (getCurrentListMapNoExtraKeys!137 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66542 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66548 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66548 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66540 () Unit!3981)

(assert (=> b!128395 (= lt!66540 (addApplyDifferent!88 lt!66533 lt!66542 (zeroValue!2666 newMap!16) lt!66548))))

(assert (=> b!128395 (= (apply!112 (+!171 lt!66533 (tuple2!2597 lt!66542 (zeroValue!2666 newMap!16))) lt!66548) (apply!112 lt!66533 lt!66548))))

(declare-fun lt!66551 () Unit!3981)

(assert (=> b!128395 (= lt!66551 lt!66540)))

(declare-fun lt!66545 () ListLongMap!1691)

(assert (=> b!128395 (= lt!66545 (getCurrentListMapNoExtraKeys!137 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66544 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66544 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66539 () (_ BitVec 64))

(assert (=> b!128395 (= lt!66539 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!128395 (= lt!66535 (addApplyDifferent!88 lt!66545 lt!66544 (minValue!2666 newMap!16) lt!66539))))

(assert (=> b!128395 (= (apply!112 (+!171 lt!66545 (tuple2!2597 lt!66544 (minValue!2666 newMap!16))) lt!66539) (apply!112 lt!66545 lt!66539))))

(declare-fun b!128396 () Bool)

(assert (=> b!128396 (= e!83827 (= (apply!112 lt!66549 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!128397 () Bool)

(declare-fun e!83832 () ListLongMap!1691)

(assert (=> b!128397 (= e!83832 (+!171 call!13897 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!128398 () Bool)

(assert (=> b!128398 (= e!83826 e!83825)))

(declare-fun c!23539 () Bool)

(assert (=> b!128398 (= c!23539 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128399 () Bool)

(declare-fun res!62020 () Bool)

(assert (=> b!128399 (=> (not res!62020) (not e!83826))))

(assert (=> b!128399 (= res!62020 e!83834)))

(declare-fun res!62016 () Bool)

(assert (=> b!128399 (=> res!62016 e!83834)))

(declare-fun e!83824 () Bool)

(assert (=> b!128399 (= res!62016 (not e!83824))))

(declare-fun res!62021 () Bool)

(assert (=> b!128399 (=> (not res!62021) (not e!83824))))

(assert (=> b!128399 (= res!62021 (bvslt #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun b!128400 () Bool)

(assert (=> b!128400 (= e!83832 e!83831)))

(assert (=> b!128400 (= c!23540 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13896 () Bool)

(assert (=> bm!13896 (= call!13894 call!13900)))

(declare-fun b!128401 () Bool)

(assert (=> b!128401 (= e!83833 call!13895)))

(declare-fun b!128392 () Bool)

(assert (=> b!128392 (= e!83824 (validKeyInArray!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!38773 () Bool)

(assert (=> d!38773 e!83826))

(declare-fun res!62017 () Bool)

(assert (=> d!38773 (=> (not res!62017) (not e!83826))))

(assert (=> d!38773 (= res!62017 (or (bvsge #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))))

(declare-fun lt!66537 () ListLongMap!1691)

(assert (=> d!38773 (= lt!66549 lt!66537)))

(declare-fun lt!66547 () Unit!3981)

(assert (=> d!38773 (= lt!66547 e!83823)))

(declare-fun c!23537 () Bool)

(assert (=> d!38773 (= c!23537 e!83835)))

(declare-fun res!62015 () Bool)

(assert (=> d!38773 (=> (not res!62015) (not e!83835))))

(assert (=> d!38773 (= res!62015 (bvslt #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(assert (=> d!38773 (= lt!66537 e!83832)))

(assert (=> d!38773 (= c!23536 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38773 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38773 (= (getCurrentListMap!539 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66549)))

(declare-fun b!128402 () Bool)

(assert (=> b!128402 (= e!83828 e!83830)))

(declare-fun res!62022 () Bool)

(assert (=> b!128402 (= res!62022 call!13899)))

(assert (=> b!128402 (=> (not res!62022) (not e!83830))))

(declare-fun bm!13897 () Bool)

(assert (=> bm!13897 (= call!13899 (contains!884 lt!66549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38773 c!23536) b!128397))

(assert (= (and d!38773 (not c!23536)) b!128400))

(assert (= (and b!128400 c!23540) b!128390))

(assert (= (and b!128400 (not c!23540)) b!128393))

(assert (= (and b!128393 c!23541) b!128401))

(assert (= (and b!128393 (not c!23541)) b!128387))

(assert (= (or b!128401 b!128387) bm!13896))

(assert (= (or b!128390 bm!13896) bm!13891))

(assert (= (or b!128390 b!128401) bm!13894))

(assert (= (or b!128397 bm!13891) bm!13895))

(assert (= (or b!128397 bm!13894) bm!13892))

(assert (= (and d!38773 res!62015) b!128391))

(assert (= (and d!38773 c!23537) b!128395))

(assert (= (and d!38773 (not c!23537)) b!128382))

(assert (= (and d!38773 res!62017) b!128399))

(assert (= (and b!128399 res!62021) b!128392))

(assert (= (and b!128399 (not res!62016)) b!128394))

(assert (= (and b!128394 res!62019) b!128386))

(assert (= (and b!128399 res!62020) b!128384))

(assert (= (and b!128384 c!23538) b!128402))

(assert (= (and b!128384 (not c!23538)) b!128389))

(assert (= (and b!128402 res!62022) b!128383))

(assert (= (or b!128402 b!128389) bm!13897))

(assert (= (and b!128384 res!62014) b!128398))

(assert (= (and b!128398 c!23539) b!128385))

(assert (= (and b!128398 (not c!23539)) b!128388))

(assert (= (and b!128385 res!62018) b!128396))

(assert (= (or b!128385 b!128388) bm!13893))

(declare-fun b_lambda!5681 () Bool)

(assert (=> (not b_lambda!5681) (not b!128386)))

(assert (=> b!128386 t!6091))

(declare-fun b_and!7935 () Bool)

(assert (= b_and!7931 (and (=> t!6091 result!3893) b_and!7935)))

(assert (=> b!128386 t!6093))

(declare-fun b_and!7937 () Bool)

(assert (= b_and!7933 (and (=> t!6093 result!3895) b_and!7937)))

(declare-fun m!150295 () Bool)

(assert (=> bm!13897 m!150295))

(assert (=> b!128391 m!150267))

(assert (=> b!128391 m!150267))

(assert (=> b!128391 m!150269))

(declare-fun m!150297 () Bool)

(assert (=> b!128397 m!150297))

(declare-fun m!150299 () Bool)

(assert (=> b!128395 m!150299))

(declare-fun m!150301 () Bool)

(assert (=> b!128395 m!150301))

(declare-fun m!150303 () Bool)

(assert (=> b!128395 m!150303))

(assert (=> b!128395 m!150267))

(declare-fun m!150305 () Bool)

(assert (=> b!128395 m!150305))

(declare-fun m!150307 () Bool)

(assert (=> b!128395 m!150307))

(declare-fun m!150309 () Bool)

(assert (=> b!128395 m!150309))

(declare-fun m!150311 () Bool)

(assert (=> b!128395 m!150311))

(assert (=> b!128395 m!150309))

(declare-fun m!150313 () Bool)

(assert (=> b!128395 m!150313))

(declare-fun m!150315 () Bool)

(assert (=> b!128395 m!150315))

(assert (=> b!128395 m!150313))

(declare-fun m!150317 () Bool)

(assert (=> b!128395 m!150317))

(declare-fun m!150319 () Bool)

(assert (=> b!128395 m!150319))

(declare-fun m!150321 () Bool)

(assert (=> b!128395 m!150321))

(declare-fun m!150323 () Bool)

(assert (=> b!128395 m!150323))

(assert (=> b!128395 m!150307))

(declare-fun m!150325 () Bool)

(assert (=> b!128395 m!150325))

(declare-fun m!150327 () Bool)

(assert (=> b!128395 m!150327))

(declare-fun m!150329 () Bool)

(assert (=> b!128395 m!150329))

(assert (=> b!128395 m!150319))

(assert (=> b!128394 m!150267))

(assert (=> b!128394 m!150267))

(declare-fun m!150331 () Bool)

(assert (=> b!128394 m!150331))

(declare-fun m!150333 () Bool)

(assert (=> bm!13893 m!150333))

(declare-fun m!150335 () Bool)

(assert (=> bm!13892 m!150335))

(declare-fun m!150337 () Bool)

(assert (=> b!128386 m!150337))

(assert (=> b!128386 m!149593))

(assert (=> b!128386 m!150267))

(assert (=> b!128386 m!150267))

(declare-fun m!150339 () Bool)

(assert (=> b!128386 m!150339))

(assert (=> b!128386 m!150337))

(assert (=> b!128386 m!149593))

(declare-fun m!150341 () Bool)

(assert (=> b!128386 m!150341))

(assert (=> d!38773 m!149599))

(assert (=> b!128392 m!150267))

(assert (=> b!128392 m!150267))

(assert (=> b!128392 m!150269))

(assert (=> bm!13895 m!150299))

(declare-fun m!150343 () Bool)

(assert (=> b!128383 m!150343))

(declare-fun m!150345 () Bool)

(assert (=> b!128396 m!150345))

(assert (=> d!38669 d!38773))

(declare-fun b!128412 () Bool)

(declare-fun res!62032 () Bool)

(declare-fun e!83840 () Bool)

(assert (=> b!128412 (=> (not res!62032) (not e!83840))))

(assert (=> b!128412 (= res!62032 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128413 () Bool)

(assert (=> b!128413 (= e!83840 (bvslt (size!2502 (_keys!4542 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!128414 () Bool)

(declare-fun e!83841 () Bool)

(assert (=> b!128414 (= e!83841 (= (arrayCountValidKeys!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4542 newMap!16) #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun d!38775 () Bool)

(assert (=> d!38775 e!83841))

(declare-fun res!62033 () Bool)

(assert (=> d!38775 (=> (not res!62033) (not e!83841))))

(assert (=> d!38775 (= res!62033 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 (_keys!4542 newMap!16)))))))

(declare-fun lt!66555 () Unit!3981)

(declare-fun choose!1 (array!4725 (_ BitVec 32) (_ BitVec 64)) Unit!3981)

(assert (=> d!38775 (= lt!66555 (choose!1 (_keys!4542 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38775 e!83840))

(declare-fun res!62034 () Bool)

(assert (=> d!38775 (=> (not res!62034) (not e!83840))))

(assert (=> d!38775 (= res!62034 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 (_keys!4542 newMap!16)))))))

(assert (=> d!38775 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4542 newMap!16) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66555)))

(declare-fun b!128411 () Bool)

(declare-fun res!62031 () Bool)

(assert (=> b!128411 (=> (not res!62031) (not e!83840))))

(assert (=> b!128411 (= res!62031 (not (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))))

(assert (= (and d!38775 res!62034) b!128411))

(assert (= (and b!128411 res!62031) b!128412))

(assert (= (and b!128412 res!62032) b!128413))

(assert (= (and d!38775 res!62033) b!128414))

(assert (=> b!128412 m!149355))

(declare-fun m!150347 () Bool)

(assert (=> b!128412 m!150347))

(assert (=> b!128414 m!149981))

(assert (=> b!128414 m!149963))

(assert (=> b!128414 m!149409))

(assert (=> d!38775 m!149355))

(declare-fun m!150349 () Bool)

(assert (=> d!38775 m!150349))

(declare-fun m!150351 () Bool)

(assert (=> b!128411 m!150351))

(assert (=> b!128411 m!150351))

(declare-fun m!150353 () Bool)

(assert (=> b!128411 m!150353))

(assert (=> d!38669 d!38775))

(assert (=> d!38669 d!38649))

(declare-fun b!128415 () Bool)

(declare-fun e!83844 () Bool)

(declare-fun e!83843 () Bool)

(assert (=> b!128415 (= e!83844 e!83843)))

(declare-fun lt!66558 () (_ BitVec 64))

(assert (=> b!128415 (= lt!66558 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66556 () Unit!3981)

(assert (=> b!128415 (= lt!66556 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) lt!66558 #b00000000000000000000000000000000))))

(assert (=> b!128415 (arrayContainsKey!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) lt!66558 #b00000000000000000000000000000000)))

(declare-fun lt!66557 () Unit!3981)

(assert (=> b!128415 (= lt!66557 lt!66556)))

(declare-fun res!62035 () Bool)

(assert (=> b!128415 (= res!62035 (= (seekEntryOrOpen!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000) (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (mask!7073 newMap!16)) (Found!271 #b00000000000000000000000000000000)))))

(assert (=> b!128415 (=> (not res!62035) (not e!83843))))

(declare-fun call!13901 () Bool)

(declare-fun bm!13898 () Bool)

(assert (=> bm!13898 (= call!13901 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (mask!7073 newMap!16)))))

(declare-fun b!128416 () Bool)

(assert (=> b!128416 (= e!83843 call!13901)))

(declare-fun d!38777 () Bool)

(declare-fun res!62036 () Bool)

(declare-fun e!83842 () Bool)

(assert (=> d!38777 (=> res!62036 e!83842)))

(assert (=> d!38777 (= res!62036 (bvsge #b00000000000000000000000000000000 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(assert (=> d!38777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (mask!7073 newMap!16)) e!83842)))

(declare-fun b!128417 () Bool)

(assert (=> b!128417 (= e!83844 call!13901)))

(declare-fun b!128418 () Bool)

(assert (=> b!128418 (= e!83842 e!83844)))

(declare-fun c!23542 () Bool)

(assert (=> b!128418 (= c!23542 (validKeyInArray!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38777 (not res!62036)) b!128418))

(assert (= (and b!128418 c!23542) b!128415))

(assert (= (and b!128418 (not c!23542)) b!128417))

(assert (= (and b!128415 res!62035) b!128416))

(assert (= (or b!128416 b!128417) bm!13898))

(assert (=> b!128415 m!150267))

(declare-fun m!150355 () Bool)

(assert (=> b!128415 m!150355))

(declare-fun m!150357 () Bool)

(assert (=> b!128415 m!150357))

(assert (=> b!128415 m!150267))

(declare-fun m!150359 () Bool)

(assert (=> b!128415 m!150359))

(declare-fun m!150361 () Bool)

(assert (=> bm!13898 m!150361))

(assert (=> b!128418 m!150267))

(assert (=> b!128418 m!150267))

(assert (=> b!128418 m!150269))

(assert (=> d!38669 d!38777))

(declare-fun d!38779 () Bool)

(assert (=> d!38779 (= (arrayCountValidKeys!0 lt!66420 (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (bvadd (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!66561 () Unit!3981)

(declare-fun choose!2 (array!4725 (_ BitVec 32)) Unit!3981)

(assert (=> d!38779 (= lt!66561 (choose!2 lt!66420 (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))))))

(declare-fun e!83847 () Bool)

(assert (=> d!38779 e!83847))

(declare-fun res!62041 () Bool)

(assert (=> d!38779 (=> (not res!62041) (not e!83847))))

(assert (=> d!38779 (= res!62041 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 lt!66420))))))

(assert (=> d!38779 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!66420 (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072))) lt!66561)))

(declare-fun b!128423 () Bool)

(declare-fun res!62042 () Bool)

(assert (=> b!128423 (=> (not res!62042) (not e!83847))))

(assert (=> b!128423 (= res!62042 (validKeyInArray!0 (select (arr!2237 lt!66420) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)))))))

(declare-fun b!128424 () Bool)

(assert (=> b!128424 (= e!83847 (bvslt (size!2502 lt!66420) #b01111111111111111111111111111111))))

(assert (= (and d!38779 res!62041) b!128423))

(assert (= (and b!128423 res!62042) b!128424))

(assert (=> d!38779 m!149979))

(declare-fun m!150363 () Bool)

(assert (=> d!38779 m!150363))

(assert (=> b!128423 m!150291))

(assert (=> b!128423 m!150291))

(assert (=> b!128423 m!150293))

(assert (=> d!38669 d!38779))

(declare-fun b!128425 () Bool)

(declare-fun e!83851 () Bool)

(declare-fun e!83849 () Bool)

(assert (=> b!128425 (= e!83851 e!83849)))

(declare-fun res!62045 () Bool)

(assert (=> b!128425 (=> (not res!62045) (not e!83849))))

(declare-fun e!83850 () Bool)

(assert (=> b!128425 (= res!62045 (not e!83850))))

(declare-fun res!62044 () Bool)

(assert (=> b!128425 (=> (not res!62044) (not e!83850))))

(assert (=> b!128425 (= res!62044 (validKeyInArray!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) lt!66411)))))

(declare-fun c!23543 () Bool)

(declare-fun call!13902 () Bool)

(declare-fun bm!13899 () Bool)

(assert (=> bm!13899 (= call!13902 (arrayNoDuplicates!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) (bvadd lt!66411 #b00000000000000000000000000000001) (ite c!23543 (Cons!1702 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) lt!66411) lt!66413) lt!66413)))))

(declare-fun d!38781 () Bool)

(declare-fun res!62043 () Bool)

(assert (=> d!38781 (=> res!62043 e!83851)))

(assert (=> d!38781 (= res!62043 (bvsge lt!66411 (size!2502 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))))))))

(assert (=> d!38781 (= (arrayNoDuplicates!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) lt!66411 lt!66413) e!83851)))

(declare-fun b!128426 () Bool)

(declare-fun e!83848 () Bool)

(assert (=> b!128426 (= e!83848 call!13902)))

(declare-fun b!128427 () Bool)

(assert (=> b!128427 (= e!83848 call!13902)))

(declare-fun b!128428 () Bool)

(assert (=> b!128428 (= e!83849 e!83848)))

(assert (=> b!128428 (= c!23543 (validKeyInArray!0 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) lt!66411)))))

(declare-fun b!128429 () Bool)

(assert (=> b!128429 (= e!83850 (contains!887 lt!66413 (select (arr!2237 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16)))) lt!66411)))))

(assert (= (and d!38781 (not res!62043)) b!128425))

(assert (= (and b!128425 res!62044) b!128429))

(assert (= (and b!128425 res!62045) b!128428))

(assert (= (and b!128428 c!23543) b!128426))

(assert (= (and b!128428 (not c!23543)) b!128427))

(assert (= (or b!128426 b!128427) bm!13899))

(declare-fun m!150365 () Bool)

(assert (=> b!128425 m!150365))

(assert (=> b!128425 m!150365))

(declare-fun m!150367 () Bool)

(assert (=> b!128425 m!150367))

(assert (=> bm!13899 m!150365))

(declare-fun m!150369 () Bool)

(assert (=> bm!13899 m!150369))

(assert (=> b!128428 m!150365))

(assert (=> b!128428 m!150365))

(assert (=> b!128428 m!150367))

(assert (=> b!128429 m!150365))

(assert (=> b!128429 m!150365))

(declare-fun m!150371 () Bool)

(assert (=> b!128429 m!150371))

(assert (=> d!38669 d!38781))

(declare-fun d!38783 () Bool)

(declare-fun e!83854 () Bool)

(assert (=> d!38783 e!83854))

(declare-fun res!62048 () Bool)

(assert (=> d!38783 (=> (not res!62048) (not e!83854))))

(assert (=> d!38783 (= res!62048 (and (bvsge (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) #b00000000000000000000000000000000) (bvslt (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (size!2502 (_keys!4542 newMap!16)))))))

(declare-fun lt!66564 () Unit!3981)

(declare-fun choose!41 (array!4725 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1706) Unit!3981)

(assert (=> d!38783 (= lt!66564 (choose!41 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) lt!66411 lt!66413))))

(assert (=> d!38783 (bvslt (size!2502 (_keys!4542 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!38783 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) lt!66411 lt!66413) lt!66564)))

(declare-fun b!128432 () Bool)

(assert (=> b!128432 (= e!83854 (arrayNoDuplicates!0 (array!4726 (store (arr!2237 (_keys!4542 newMap!16)) (ite c!23401 (index!3243 lt!66072) (index!3240 lt!66072)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (size!2502 (_keys!4542 newMap!16))) lt!66411 lt!66413))))

(assert (= (and d!38783 res!62048) b!128432))

(assert (=> d!38783 m!149355))

(declare-fun m!150373 () Bool)

(assert (=> d!38783 m!150373))

(assert (=> b!128432 m!149981))

(assert (=> b!128432 m!149973))

(assert (=> d!38669 d!38783))

(assert (=> bm!13841 d!38707))

(declare-fun d!38785 () Bool)

(declare-fun c!23544 () Bool)

(assert (=> d!38785 (= c!23544 (and ((_ is Cons!1700) (toList!861 lt!66450)) (= (_1!1309 (h!2303 (toList!861 lt!66450))) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!83855 () Option!174)

(assert (=> d!38785 (= (getValueByKey!168 (toList!861 lt!66450) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!83855)))

(declare-fun b!128434 () Bool)

(declare-fun e!83856 () Option!174)

(assert (=> b!128434 (= e!83855 e!83856)))

(declare-fun c!23545 () Bool)

(assert (=> b!128434 (= c!23545 (and ((_ is Cons!1700) (toList!861 lt!66450)) (not (= (_1!1309 (h!2303 (toList!861 lt!66450))) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!128435 () Bool)

(assert (=> b!128435 (= e!83856 (getValueByKey!168 (t!6083 (toList!861 lt!66450)) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128436 () Bool)

(assert (=> b!128436 (= e!83856 None!172)))

(declare-fun b!128433 () Bool)

(assert (=> b!128433 (= e!83855 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66450)))))))

(assert (= (and d!38785 c!23544) b!128433))

(assert (= (and d!38785 (not c!23544)) b!128434))

(assert (= (and b!128434 c!23545) b!128435))

(assert (= (and b!128434 (not c!23545)) b!128436))

(declare-fun m!150375 () Bool)

(assert (=> b!128435 m!150375))

(assert (=> b!128247 d!38785))

(declare-fun c!23546 () Bool)

(declare-fun d!38787 () Bool)

(assert (=> d!38787 (= c!23546 (and ((_ is Cons!1700) (toList!861 lt!66275)) (= (_1!1309 (h!2303 (toList!861 lt!66275))) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!83857 () Option!174)

(assert (=> d!38787 (= (getValueByKey!168 (toList!861 lt!66275) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!83857)))

(declare-fun b!128438 () Bool)

(declare-fun e!83858 () Option!174)

(assert (=> b!128438 (= e!83857 e!83858)))

(declare-fun c!23547 () Bool)

(assert (=> b!128438 (= c!23547 (and ((_ is Cons!1700) (toList!861 lt!66275)) (not (= (_1!1309 (h!2303 (toList!861 lt!66275))) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128439 () Bool)

(assert (=> b!128439 (= e!83858 (getValueByKey!168 (t!6083 (toList!861 lt!66275)) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128440 () Bool)

(assert (=> b!128440 (= e!83858 None!172)))

(declare-fun b!128437 () Bool)

(assert (=> b!128437 (= e!83857 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66275)))))))

(assert (= (and d!38787 c!23546) b!128437))

(assert (= (and d!38787 (not c!23546)) b!128438))

(assert (= (and b!128438 c!23547) b!128439))

(assert (= (and b!128438 (not c!23547)) b!128440))

(declare-fun m!150377 () Bool)

(assert (=> b!128439 m!150377))

(assert (=> b!128091 d!38787))

(declare-fun b!128441 () Bool)

(declare-fun e!83861 () Bool)

(declare-fun e!83863 () Bool)

(assert (=> b!128441 (= e!83861 e!83863)))

(declare-fun c!23551 () Bool)

(declare-fun e!83865 () Bool)

(assert (=> b!128441 (= c!23551 e!83865)))

(declare-fun res!62049 () Bool)

(assert (=> b!128441 (=> (not res!62049) (not e!83865))))

(assert (=> b!128441 (= res!62049 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128442 () Bool)

(declare-fun e!83860 () Bool)

(assert (=> b!128442 (= e!83863 e!83860)))

(declare-fun c!23549 () Bool)

(assert (=> b!128442 (= c!23549 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128443 () Bool)

(assert (=> b!128443 (= e!83865 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128443 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128444 () Bool)

(declare-fun e!83864 () ListLongMap!1691)

(declare-fun call!13903 () ListLongMap!1691)

(assert (=> b!128444 (= e!83864 call!13903)))

(declare-fun b!128445 () Bool)

(declare-fun lt!66569 () Unit!3981)

(declare-fun lt!66568 () Unit!3981)

(assert (=> b!128445 (= lt!66569 lt!66568)))

(declare-fun lt!66571 () (_ BitVec 64))

(declare-fun lt!66570 () (_ BitVec 64))

(declare-fun lt!66566 () V!3451)

(declare-fun lt!66567 () ListLongMap!1691)

(assert (=> b!128445 (not (contains!884 (+!171 lt!66567 (tuple2!2597 lt!66571 lt!66566)) lt!66570))))

(assert (=> b!128445 (= lt!66568 (addStillNotContains!57 lt!66567 lt!66571 lt!66566 lt!66570))))

(assert (=> b!128445 (= lt!66570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128445 (= lt!66566 (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128445 (= lt!66571 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128445 (= lt!66567 call!13903)))

(assert (=> b!128445 (= e!83864 (+!171 call!13903 (tuple2!2597 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128446 () Bool)

(declare-fun e!83862 () ListLongMap!1691)

(assert (=> b!128446 (= e!83862 e!83864)))

(declare-fun c!23550 () Bool)

(assert (=> b!128446 (= c!23550 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13900 () Bool)

(assert (=> bm!13900 (= call!13903 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2805 newMap!16)))))

(declare-fun b!128447 () Bool)

(declare-fun e!83859 () Bool)

(assert (=> b!128447 (= e!83863 e!83859)))

(assert (=> b!128447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun res!62052 () Bool)

(declare-fun lt!66565 () ListLongMap!1691)

(assert (=> b!128447 (= res!62052 (contains!884 lt!66565 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128447 (=> (not res!62052) (not e!83859))))

(declare-fun b!128448 () Bool)

(assert (=> b!128448 (= e!83862 (ListLongMap!1692 Nil!1701))))

(declare-fun b!128449 () Bool)

(assert (=> b!128449 (= e!83860 (= lt!66565 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2805 newMap!16))))))

(declare-fun d!38789 () Bool)

(assert (=> d!38789 e!83861))

(declare-fun res!62050 () Bool)

(assert (=> d!38789 (=> (not res!62050) (not e!83861))))

(assert (=> d!38789 (= res!62050 (not (contains!884 lt!66565 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38789 (= lt!66565 e!83862)))

(declare-fun c!23548 () Bool)

(assert (=> d!38789 (= c!23548 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38789 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38789 (= (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66565)))

(declare-fun b!128450 () Bool)

(assert (=> b!128450 (= e!83860 (isEmpty!400 lt!66565))))

(declare-fun b!128451 () Bool)

(declare-fun res!62051 () Bool)

(assert (=> b!128451 (=> (not res!62051) (not e!83861))))

(assert (=> b!128451 (= res!62051 (not (contains!884 lt!66565 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128452 () Bool)

(assert (=> b!128452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> b!128452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (_values!2788 newMap!16))))))

(assert (=> b!128452 (= e!83859 (= (apply!112 lt!66565 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38789 c!23548) b!128448))

(assert (= (and d!38789 (not c!23548)) b!128446))

(assert (= (and b!128446 c!23550) b!128445))

(assert (= (and b!128446 (not c!23550)) b!128444))

(assert (= (or b!128445 b!128444) bm!13900))

(assert (= (and d!38789 res!62050) b!128451))

(assert (= (and b!128451 res!62051) b!128441))

(assert (= (and b!128441 res!62049) b!128443))

(assert (= (and b!128441 c!23551) b!128447))

(assert (= (and b!128441 (not c!23551)) b!128442))

(assert (= (and b!128447 res!62052) b!128452))

(assert (= (and b!128442 c!23549) b!128449))

(assert (= (and b!128442 (not c!23549)) b!128450))

(declare-fun b_lambda!5683 () Bool)

(assert (=> (not b_lambda!5683) (not b!128445)))

(assert (=> b!128445 t!6091))

(declare-fun b_and!7939 () Bool)

(assert (= b_and!7935 (and (=> t!6091 result!3893) b_and!7939)))

(assert (=> b!128445 t!6093))

(declare-fun b_and!7941 () Bool)

(assert (= b_and!7937 (and (=> t!6093 result!3895) b_and!7941)))

(declare-fun b_lambda!5685 () Bool)

(assert (=> (not b_lambda!5685) (not b!128452)))

(assert (=> b!128452 t!6091))

(declare-fun b_and!7943 () Bool)

(assert (= b_and!7939 (and (=> t!6091 result!3893) b_and!7943)))

(assert (=> b!128452 t!6093))

(declare-fun b_and!7945 () Bool)

(assert (= b_and!7941 (and (=> t!6093 result!3895) b_and!7945)))

(declare-fun m!150379 () Bool)

(assert (=> b!128450 m!150379))

(assert (=> b!128452 m!149547))

(declare-fun m!150381 () Bool)

(assert (=> b!128452 m!150381))

(assert (=> b!128452 m!149707))

(assert (=> b!128452 m!149707))

(assert (=> b!128452 m!149593))

(assert (=> b!128452 m!149711))

(assert (=> b!128452 m!149547))

(assert (=> b!128452 m!149593))

(declare-fun m!150383 () Bool)

(assert (=> b!128449 m!150383))

(declare-fun m!150385 () Bool)

(assert (=> b!128445 m!150385))

(declare-fun m!150387 () Bool)

(assert (=> b!128445 m!150387))

(assert (=> b!128445 m!149707))

(assert (=> b!128445 m!149707))

(assert (=> b!128445 m!149593))

(assert (=> b!128445 m!149711))

(declare-fun m!150389 () Bool)

(assert (=> b!128445 m!150389))

(assert (=> b!128445 m!149547))

(assert (=> b!128445 m!149593))

(assert (=> b!128445 m!150385))

(declare-fun m!150391 () Bool)

(assert (=> b!128445 m!150391))

(assert (=> b!128446 m!149547))

(assert (=> b!128446 m!149547))

(assert (=> b!128446 m!149549))

(assert (=> b!128447 m!149547))

(assert (=> b!128447 m!149547))

(declare-fun m!150393 () Bool)

(assert (=> b!128447 m!150393))

(declare-fun m!150395 () Bool)

(assert (=> d!38789 m!150395))

(assert (=> d!38789 m!149599))

(declare-fun m!150397 () Bool)

(assert (=> b!128451 m!150397))

(assert (=> b!128443 m!149547))

(assert (=> b!128443 m!149547))

(assert (=> b!128443 m!149549))

(assert (=> bm!13900 m!150383))

(assert (=> bm!13850 d!38789))

(declare-fun d!38791 () Bool)

(assert (=> d!38791 (= (validMask!0 (mask!7073 newMap!16)) (and (or (= (mask!7073 newMap!16) #b00000000000000000000000000000111) (= (mask!7073 newMap!16) #b00000000000000000000000000001111) (= (mask!7073 newMap!16) #b00000000000000000000000000011111) (= (mask!7073 newMap!16) #b00000000000000000000000000111111) (= (mask!7073 newMap!16) #b00000000000000000000000001111111) (= (mask!7073 newMap!16) #b00000000000000000000000011111111) (= (mask!7073 newMap!16) #b00000000000000000000000111111111) (= (mask!7073 newMap!16) #b00000000000000000000001111111111) (= (mask!7073 newMap!16) #b00000000000000000000011111111111) (= (mask!7073 newMap!16) #b00000000000000000000111111111111) (= (mask!7073 newMap!16) #b00000000000000000001111111111111) (= (mask!7073 newMap!16) #b00000000000000000011111111111111) (= (mask!7073 newMap!16) #b00000000000000000111111111111111) (= (mask!7073 newMap!16) #b00000000000000001111111111111111) (= (mask!7073 newMap!16) #b00000000000000011111111111111111) (= (mask!7073 newMap!16) #b00000000000000111111111111111111) (= (mask!7073 newMap!16) #b00000000000001111111111111111111) (= (mask!7073 newMap!16) #b00000000000011111111111111111111) (= (mask!7073 newMap!16) #b00000000000111111111111111111111) (= (mask!7073 newMap!16) #b00000000001111111111111111111111) (= (mask!7073 newMap!16) #b00000000011111111111111111111111) (= (mask!7073 newMap!16) #b00000000111111111111111111111111) (= (mask!7073 newMap!16) #b00000001111111111111111111111111) (= (mask!7073 newMap!16) #b00000011111111111111111111111111) (= (mask!7073 newMap!16) #b00000111111111111111111111111111) (= (mask!7073 newMap!16) #b00001111111111111111111111111111) (= (mask!7073 newMap!16) #b00011111111111111111111111111111) (= (mask!7073 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7073 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!38595 d!38791))

(declare-fun d!38793 () Bool)

(declare-fun e!83867 () Bool)

(assert (=> d!38793 e!83867))

(declare-fun res!62053 () Bool)

(assert (=> d!38793 (=> res!62053 e!83867)))

(declare-fun lt!66572 () Bool)

(assert (=> d!38793 (= res!62053 (not lt!66572))))

(declare-fun lt!66575 () Bool)

(assert (=> d!38793 (= lt!66572 lt!66575)))

(declare-fun lt!66574 () Unit!3981)

(declare-fun e!83866 () Unit!3981)

(assert (=> d!38793 (= lt!66574 e!83866)))

(declare-fun c!23552 () Bool)

(assert (=> d!38793 (= c!23552 lt!66575)))

(assert (=> d!38793 (= lt!66575 (containsKey!172 (toList!861 lt!66454) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38793 (= (contains!884 lt!66454 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66572)))

(declare-fun b!128453 () Bool)

(declare-fun lt!66573 () Unit!3981)

(assert (=> b!128453 (= e!83866 lt!66573)))

(assert (=> b!128453 (= lt!66573 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66454) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> b!128453 (isDefined!121 (getValueByKey!168 (toList!861 lt!66454) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128454 () Bool)

(declare-fun Unit!4005 () Unit!3981)

(assert (=> b!128454 (= e!83866 Unit!4005)))

(declare-fun b!128455 () Bool)

(assert (=> b!128455 (= e!83867 (isDefined!121 (getValueByKey!168 (toList!861 lt!66454) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(assert (= (and d!38793 c!23552) b!128453))

(assert (= (and d!38793 (not c!23552)) b!128454))

(assert (= (and d!38793 (not res!62053)) b!128455))

(declare-fun m!150399 () Bool)

(assert (=> d!38793 m!150399))

(declare-fun m!150401 () Bool)

(assert (=> b!128453 m!150401))

(assert (=> b!128453 m!150061))

(assert (=> b!128453 m!150061))

(declare-fun m!150403 () Bool)

(assert (=> b!128453 m!150403))

(assert (=> b!128455 m!150061))

(assert (=> b!128455 m!150061))

(assert (=> b!128455 m!150403))

(assert (=> d!38695 d!38793))

(declare-fun d!38795 () Bool)

(declare-fun c!23553 () Bool)

(assert (=> d!38795 (= c!23553 (and ((_ is Cons!1700) lt!66457) (= (_1!1309 (h!2303 lt!66457)) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun e!83868 () Option!174)

(assert (=> d!38795 (= (getValueByKey!168 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) e!83868)))

(declare-fun b!128457 () Bool)

(declare-fun e!83869 () Option!174)

(assert (=> b!128457 (= e!83868 e!83869)))

(declare-fun c!23554 () Bool)

(assert (=> b!128457 (= c!23554 (and ((_ is Cons!1700) lt!66457) (not (= (_1!1309 (h!2303 lt!66457)) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(declare-fun b!128458 () Bool)

(assert (=> b!128458 (= e!83869 (getValueByKey!168 (t!6083 lt!66457) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128459 () Bool)

(assert (=> b!128459 (= e!83869 None!172)))

(declare-fun b!128456 () Bool)

(assert (=> b!128456 (= e!83868 (Some!173 (_2!1309 (h!2303 lt!66457))))))

(assert (= (and d!38795 c!23553) b!128456))

(assert (= (and d!38795 (not c!23553)) b!128457))

(assert (= (and b!128457 c!23554) b!128458))

(assert (= (and b!128457 (not c!23554)) b!128459))

(declare-fun m!150405 () Bool)

(assert (=> b!128458 m!150405))

(assert (=> d!38695 d!38795))

(declare-fun d!38797 () Bool)

(assert (=> d!38797 (= (getValueByKey!168 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (Some!173 (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun lt!66578 () Unit!3981)

(declare-fun choose!783 (List!1704 (_ BitVec 64) V!3451) Unit!3981)

(assert (=> d!38797 (= lt!66578 (choose!783 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!83872 () Bool)

(assert (=> d!38797 e!83872))

(declare-fun res!62058 () Bool)

(assert (=> d!38797 (=> (not res!62058) (not e!83872))))

(assert (=> d!38797 (= res!62058 (isStrictlySorted!318 lt!66457))))

(assert (=> d!38797 (= (lemmaContainsTupThenGetReturnValue!83 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66578)))

(declare-fun b!128464 () Bool)

(declare-fun res!62059 () Bool)

(assert (=> b!128464 (=> (not res!62059) (not e!83872))))

(assert (=> b!128464 (= res!62059 (containsKey!172 lt!66457 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128465 () Bool)

(assert (=> b!128465 (= e!83872 (contains!886 lt!66457 (tuple2!2597 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(assert (= (and d!38797 res!62058) b!128464))

(assert (= (and b!128464 res!62059) b!128465))

(assert (=> d!38797 m!150055))

(declare-fun m!150407 () Bool)

(assert (=> d!38797 m!150407))

(declare-fun m!150409 () Bool)

(assert (=> d!38797 m!150409))

(declare-fun m!150411 () Bool)

(assert (=> b!128464 m!150411))

(declare-fun m!150413 () Bool)

(assert (=> b!128465 m!150413))

(assert (=> d!38695 d!38797))

(declare-fun c!23564 () Bool)

(declare-fun b!128486 () Bool)

(declare-fun e!83884 () List!1704)

(declare-fun c!23563 () Bool)

(assert (=> b!128486 (= e!83884 (ite c!23564 (t!6083 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (ite c!23563 (Cons!1700 (h!2303 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (t!6083 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))))) Nil!1701)))))

(declare-fun b!128487 () Bool)

(declare-fun e!83886 () List!1704)

(declare-fun e!83883 () List!1704)

(assert (=> b!128487 (= e!83886 e!83883)))

(assert (=> b!128487 (= c!23564 (and ((_ is Cons!1700) (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (= (_1!1309 (h!2303 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128488 () Bool)

(assert (=> b!128488 (= e!83884 (insertStrictlySorted!86 (t!6083 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128489 () Bool)

(declare-fun res!62065 () Bool)

(declare-fun e!83885 () Bool)

(assert (=> b!128489 (=> (not res!62065) (not e!83885))))

(declare-fun lt!66581 () List!1704)

(assert (=> b!128489 (= res!62065 (containsKey!172 lt!66581 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun bm!13907 () Bool)

(declare-fun call!13910 () List!1704)

(declare-fun call!13912 () List!1704)

(assert (=> bm!13907 (= call!13910 call!13912)))

(declare-fun b!128490 () Bool)

(declare-fun e!83887 () List!1704)

(declare-fun call!13911 () List!1704)

(assert (=> b!128490 (= e!83887 call!13911)))

(declare-fun b!128491 () Bool)

(assert (=> b!128491 (= e!83887 call!13911)))

(declare-fun b!128492 () Bool)

(assert (=> b!128492 (= c!23563 (and ((_ is Cons!1700) (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (bvsgt (_1!1309 (h!2303 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(assert (=> b!128492 (= e!83883 e!83887)))

(declare-fun b!128493 () Bool)

(assert (=> b!128493 (= e!83883 call!13910)))

(declare-fun b!128494 () Bool)

(assert (=> b!128494 (= e!83886 call!13912)))

(declare-fun b!128495 () Bool)

(assert (=> b!128495 (= e!83885 (contains!886 lt!66581 (tuple2!2597 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun bm!13909 () Bool)

(declare-fun c!23566 () Bool)

(declare-fun $colon$colon!90 (List!1704 tuple2!2596) List!1704)

(assert (=> bm!13909 (= call!13912 ($colon$colon!90 e!83884 (ite c!23566 (h!2303 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (tuple2!2597 (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(declare-fun c!23565 () Bool)

(assert (=> bm!13909 (= c!23565 c!23566)))

(declare-fun d!38799 () Bool)

(assert (=> d!38799 e!83885))

(declare-fun res!62064 () Bool)

(assert (=> d!38799 (=> (not res!62064) (not e!83885))))

(assert (=> d!38799 (= res!62064 (isStrictlySorted!318 lt!66581))))

(assert (=> d!38799 (= lt!66581 e!83886)))

(assert (=> d!38799 (= c!23566 (and ((_ is Cons!1700) (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826)))) (bvslt (_1!1309 (h!2303 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(assert (=> d!38799 (isStrictlySorted!318 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))))))

(assert (=> d!38799 (= (insertStrictlySorted!86 (toList!861 (ite c!23417 call!13830 (ite c!23421 call!13832 call!13826))) (_1!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (_2!1309 (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66581)))

(declare-fun bm!13908 () Bool)

(assert (=> bm!13908 (= call!13911 call!13910)))

(assert (= (and d!38799 c!23566) b!128494))

(assert (= (and d!38799 (not c!23566)) b!128487))

(assert (= (and b!128487 c!23564) b!128493))

(assert (= (and b!128487 (not c!23564)) b!128492))

(assert (= (and b!128492 c!23563) b!128490))

(assert (= (and b!128492 (not c!23563)) b!128491))

(assert (= (or b!128490 b!128491) bm!13908))

(assert (= (or b!128493 bm!13908) bm!13907))

(assert (= (or b!128494 bm!13907) bm!13909))

(assert (= (and bm!13909 c!23565) b!128488))

(assert (= (and bm!13909 (not c!23565)) b!128486))

(assert (= (and d!38799 res!62064) b!128489))

(assert (= (and b!128489 res!62065) b!128495))

(declare-fun m!150415 () Bool)

(assert (=> b!128495 m!150415))

(declare-fun m!150417 () Bool)

(assert (=> b!128488 m!150417))

(declare-fun m!150419 () Bool)

(assert (=> d!38799 m!150419))

(declare-fun m!150421 () Bool)

(assert (=> d!38799 m!150421))

(declare-fun m!150423 () Bool)

(assert (=> b!128489 m!150423))

(declare-fun m!150425 () Bool)

(assert (=> bm!13909 m!150425))

(assert (=> d!38695 d!38799))

(declare-fun d!38801 () Bool)

(declare-fun e!83889 () Bool)

(assert (=> d!38801 e!83889))

(declare-fun res!62066 () Bool)

(assert (=> d!38801 (=> res!62066 e!83889)))

(declare-fun lt!66582 () Bool)

(assert (=> d!38801 (= res!62066 (not lt!66582))))

(declare-fun lt!66585 () Bool)

(assert (=> d!38801 (= lt!66582 lt!66585)))

(declare-fun lt!66584 () Unit!3981)

(declare-fun e!83888 () Unit!3981)

(assert (=> d!38801 (= lt!66584 e!83888)))

(declare-fun c!23567 () Bool)

(assert (=> d!38801 (= c!23567 lt!66585)))

(assert (=> d!38801 (= lt!66585 (containsKey!172 (toList!861 lt!66458) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38801 (= (contains!884 lt!66458 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66582)))

(declare-fun b!128496 () Bool)

(declare-fun lt!66583 () Unit!3981)

(assert (=> b!128496 (= e!83888 lt!66583)))

(assert (=> b!128496 (= lt!66583 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66458) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> b!128496 (isDefined!121 (getValueByKey!168 (toList!861 lt!66458) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128497 () Bool)

(declare-fun Unit!4006 () Unit!3981)

(assert (=> b!128497 (= e!83888 Unit!4006)))

(declare-fun b!128498 () Bool)

(assert (=> b!128498 (= e!83889 (isDefined!121 (getValueByKey!168 (toList!861 lt!66458) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!38801 c!23567) b!128496))

(assert (= (and d!38801 (not c!23567)) b!128497))

(assert (= (and d!38801 (not res!62066)) b!128498))

(declare-fun m!150427 () Bool)

(assert (=> d!38801 m!150427))

(declare-fun m!150429 () Bool)

(assert (=> b!128496 m!150429))

(assert (=> b!128496 m!150075))

(assert (=> b!128496 m!150075))

(declare-fun m!150431 () Bool)

(assert (=> b!128496 m!150431))

(assert (=> b!128498 m!150075))

(assert (=> b!128498 m!150075))

(assert (=> b!128498 m!150431))

(assert (=> d!38701 d!38801))

(declare-fun d!38803 () Bool)

(declare-fun c!23568 () Bool)

(assert (=> d!38803 (= c!23568 (and ((_ is Cons!1700) lt!66461) (= (_1!1309 (h!2303 lt!66461)) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!83890 () Option!174)

(assert (=> d!38803 (= (getValueByKey!168 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!83890)))

(declare-fun b!128500 () Bool)

(declare-fun e!83891 () Option!174)

(assert (=> b!128500 (= e!83890 e!83891)))

(declare-fun c!23569 () Bool)

(assert (=> b!128500 (= c!23569 (and ((_ is Cons!1700) lt!66461) (not (= (_1!1309 (h!2303 lt!66461)) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128501 () Bool)

(assert (=> b!128501 (= e!83891 (getValueByKey!168 (t!6083 lt!66461) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128502 () Bool)

(assert (=> b!128502 (= e!83891 None!172)))

(declare-fun b!128499 () Bool)

(assert (=> b!128499 (= e!83890 (Some!173 (_2!1309 (h!2303 lt!66461))))))

(assert (= (and d!38803 c!23568) b!128499))

(assert (= (and d!38803 (not c!23568)) b!128500))

(assert (= (and b!128500 c!23569) b!128501))

(assert (= (and b!128500 (not c!23569)) b!128502))

(declare-fun m!150433 () Bool)

(assert (=> b!128501 m!150433))

(assert (=> d!38701 d!38803))

(declare-fun d!38805 () Bool)

(assert (=> d!38805 (= (getValueByKey!168 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66586 () Unit!3981)

(assert (=> d!38805 (= lt!66586 (choose!783 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun e!83892 () Bool)

(assert (=> d!38805 e!83892))

(declare-fun res!62067 () Bool)

(assert (=> d!38805 (=> (not res!62067) (not e!83892))))

(assert (=> d!38805 (= res!62067 (isStrictlySorted!318 lt!66461))))

(assert (=> d!38805 (= (lemmaContainsTupThenGetReturnValue!83 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66586)))

(declare-fun b!128503 () Bool)

(declare-fun res!62068 () Bool)

(assert (=> b!128503 (=> (not res!62068) (not e!83892))))

(assert (=> b!128503 (= res!62068 (containsKey!172 lt!66461 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128504 () Bool)

(assert (=> b!128504 (= e!83892 (contains!886 lt!66461 (tuple2!2597 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!38805 res!62067) b!128503))

(assert (= (and b!128503 res!62068) b!128504))

(assert (=> d!38805 m!150069))

(declare-fun m!150435 () Bool)

(assert (=> d!38805 m!150435))

(declare-fun m!150437 () Bool)

(assert (=> d!38805 m!150437))

(declare-fun m!150439 () Bool)

(assert (=> b!128503 m!150439))

(declare-fun m!150441 () Bool)

(assert (=> b!128504 m!150441))

(assert (=> d!38701 d!38805))

(declare-fun c!23570 () Bool)

(declare-fun c!23571 () Bool)

(declare-fun e!83894 () List!1704)

(declare-fun b!128505 () Bool)

(assert (=> b!128505 (= e!83894 (ite c!23571 (t!6083 (toList!861 call!13829)) (ite c!23570 (Cons!1700 (h!2303 (toList!861 call!13829)) (t!6083 (toList!861 call!13829))) Nil!1701)))))

(declare-fun b!128506 () Bool)

(declare-fun e!83896 () List!1704)

(declare-fun e!83893 () List!1704)

(assert (=> b!128506 (= e!83896 e!83893)))

(assert (=> b!128506 (= c!23571 (and ((_ is Cons!1700) (toList!861 call!13829)) (= (_1!1309 (h!2303 (toList!861 call!13829))) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128507 () Bool)

(assert (=> b!128507 (= e!83894 (insertStrictlySorted!86 (t!6083 (toList!861 call!13829)) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128508 () Bool)

(declare-fun res!62070 () Bool)

(declare-fun e!83895 () Bool)

(assert (=> b!128508 (=> (not res!62070) (not e!83895))))

(declare-fun lt!66587 () List!1704)

(assert (=> b!128508 (= res!62070 (containsKey!172 lt!66587 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun bm!13910 () Bool)

(declare-fun call!13913 () List!1704)

(declare-fun call!13915 () List!1704)

(assert (=> bm!13910 (= call!13913 call!13915)))

(declare-fun b!128509 () Bool)

(declare-fun e!83897 () List!1704)

(declare-fun call!13914 () List!1704)

(assert (=> b!128509 (= e!83897 call!13914)))

(declare-fun b!128510 () Bool)

(assert (=> b!128510 (= e!83897 call!13914)))

(declare-fun b!128511 () Bool)

(assert (=> b!128511 (= c!23570 (and ((_ is Cons!1700) (toList!861 call!13829)) (bvsgt (_1!1309 (h!2303 (toList!861 call!13829))) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> b!128511 (= e!83893 e!83897)))

(declare-fun b!128512 () Bool)

(assert (=> b!128512 (= e!83893 call!13913)))

(declare-fun b!128513 () Bool)

(assert (=> b!128513 (= e!83896 call!13915)))

(declare-fun b!128514 () Bool)

(assert (=> b!128514 (= e!83895 (contains!886 lt!66587 (tuple2!2597 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun bm!13912 () Bool)

(declare-fun c!23573 () Bool)

(assert (=> bm!13912 (= call!13915 ($colon$colon!90 e!83894 (ite c!23573 (h!2303 (toList!861 call!13829)) (tuple2!2597 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun c!23572 () Bool)

(assert (=> bm!13912 (= c!23572 c!23573)))

(declare-fun d!38807 () Bool)

(assert (=> d!38807 e!83895))

(declare-fun res!62069 () Bool)

(assert (=> d!38807 (=> (not res!62069) (not e!83895))))

(assert (=> d!38807 (= res!62069 (isStrictlySorted!318 lt!66587))))

(assert (=> d!38807 (= lt!66587 e!83896)))

(assert (=> d!38807 (= c!23573 (and ((_ is Cons!1700) (toList!861 call!13829)) (bvslt (_1!1309 (h!2303 (toList!861 call!13829))) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38807 (isStrictlySorted!318 (toList!861 call!13829))))

(assert (=> d!38807 (= (insertStrictlySorted!86 (toList!861 call!13829) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66587)))

(declare-fun bm!13911 () Bool)

(assert (=> bm!13911 (= call!13914 call!13913)))

(assert (= (and d!38807 c!23573) b!128513))

(assert (= (and d!38807 (not c!23573)) b!128506))

(assert (= (and b!128506 c!23571) b!128512))

(assert (= (and b!128506 (not c!23571)) b!128511))

(assert (= (and b!128511 c!23570) b!128509))

(assert (= (and b!128511 (not c!23570)) b!128510))

(assert (= (or b!128509 b!128510) bm!13911))

(assert (= (or b!128512 bm!13911) bm!13910))

(assert (= (or b!128513 bm!13910) bm!13912))

(assert (= (and bm!13912 c!23572) b!128507))

(assert (= (and bm!13912 (not c!23572)) b!128505))

(assert (= (and d!38807 res!62069) b!128508))

(assert (= (and b!128508 res!62070) b!128514))

(declare-fun m!150443 () Bool)

(assert (=> b!128514 m!150443))

(declare-fun m!150445 () Bool)

(assert (=> b!128507 m!150445))

(declare-fun m!150447 () Bool)

(assert (=> d!38807 m!150447))

(declare-fun m!150449 () Bool)

(assert (=> d!38807 m!150449))

(declare-fun m!150451 () Bool)

(assert (=> b!128508 m!150451))

(declare-fun m!150453 () Bool)

(assert (=> bm!13912 m!150453))

(assert (=> d!38701 d!38807))

(declare-fun d!38809 () Bool)

(assert (=> d!38809 (= (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66147)) (v!3150 (getValueByKey!168 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66147)))))

(assert (=> d!38617 d!38809))

(declare-fun c!23574 () Bool)

(declare-fun d!38811 () Bool)

(assert (=> d!38811 (= c!23574 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66147)))))

(declare-fun e!83898 () Option!174)

(assert (=> d!38811 (= (getValueByKey!168 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66147) e!83898)))

(declare-fun b!128516 () Bool)

(declare-fun e!83899 () Option!174)

(assert (=> b!128516 (= e!83898 e!83899)))

(declare-fun c!23575 () Bool)

(assert (=> b!128516 (= c!23575 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) (not (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66147))))))

(declare-fun b!128517 () Bool)

(assert (=> b!128517 (= e!83899 (getValueByKey!168 (t!6083 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66147))))

(declare-fun b!128518 () Bool)

(assert (=> b!128518 (= e!83899 None!172)))

(declare-fun b!128515 () Bool)

(assert (=> b!128515 (= e!83898 (Some!173 (_2!1309 (h!2303 (toList!861 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(assert (= (and d!38811 c!23574) b!128515))

(assert (= (and d!38811 (not c!23574)) b!128516))

(assert (= (and b!128516 c!23575) b!128517))

(assert (= (and b!128516 (not c!23575)) b!128518))

(declare-fun m!150455 () Bool)

(assert (=> b!128517 m!150455))

(assert (=> d!38617 d!38811))

(declare-fun d!38813 () Bool)

(assert (=> d!38813 (= (apply!112 lt!66219 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1459 (getValueByKey!168 (toList!861 lt!66219) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5312 () Bool)

(assert (= bs!5312 d!38813))

(assert (=> bs!5312 m!149485))

(assert (=> bs!5312 m!150167))

(assert (=> bs!5312 m!150167))

(declare-fun m!150457 () Bool)

(assert (=> bs!5312 m!150457))

(assert (=> b!128052 d!38813))

(assert (=> b!128052 d!38681))

(declare-fun d!38815 () Bool)

(declare-fun res!62071 () Bool)

(declare-fun e!83900 () Bool)

(assert (=> d!38815 (=> res!62071 e!83900)))

(assert (=> d!38815 (= res!62071 (and ((_ is Cons!1700) (toList!861 lt!66157)) (= (_1!1309 (h!2303 (toList!861 lt!66157))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38815 (= (containsKey!172 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000) e!83900)))

(declare-fun b!128519 () Bool)

(declare-fun e!83901 () Bool)

(assert (=> b!128519 (= e!83900 e!83901)))

(declare-fun res!62072 () Bool)

(assert (=> b!128519 (=> (not res!62072) (not e!83901))))

(assert (=> b!128519 (= res!62072 (and (or (not ((_ is Cons!1700) (toList!861 lt!66157))) (bvsle (_1!1309 (h!2303 (toList!861 lt!66157))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1700) (toList!861 lt!66157)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66157))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128520 () Bool)

(assert (=> b!128520 (= e!83901 (containsKey!172 (t!6083 (toList!861 lt!66157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38815 (not res!62071)) b!128519))

(assert (= (and b!128519 res!62072) b!128520))

(declare-fun m!150459 () Bool)

(assert (=> b!128520 m!150459))

(assert (=> d!38687 d!38815))

(declare-fun d!38817 () Bool)

(declare-fun e!83902 () Bool)

(assert (=> d!38817 e!83902))

(declare-fun res!62074 () Bool)

(assert (=> d!38817 (=> (not res!62074) (not e!83902))))

(declare-fun lt!66588 () ListLongMap!1691)

(assert (=> d!38817 (= res!62074 (contains!884 lt!66588 (_1!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(declare-fun lt!66591 () List!1704)

(assert (=> d!38817 (= lt!66588 (ListLongMap!1692 lt!66591))))

(declare-fun lt!66590 () Unit!3981)

(declare-fun lt!66589 () Unit!3981)

(assert (=> d!38817 (= lt!66590 lt!66589)))

(assert (=> d!38817 (= (getValueByKey!168 lt!66591 (_1!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))) (Some!173 (_2!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(assert (=> d!38817 (= lt!66589 (lemmaContainsTupThenGetReturnValue!83 lt!66591 (_1!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (_2!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(assert (=> d!38817 (= lt!66591 (insertStrictlySorted!86 (toList!861 (ite c!23485 call!13869 (ite c!23489 call!13871 call!13865))) (_1!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (_2!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(assert (=> d!38817 (= (+!171 (ite c!23485 call!13869 (ite c!23489 call!13871 call!13865)) (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) lt!66588)))

(declare-fun b!128521 () Bool)

(declare-fun res!62073 () Bool)

(assert (=> b!128521 (=> (not res!62073) (not e!83902))))

(assert (=> b!128521 (= res!62073 (= (getValueByKey!168 (toList!861 lt!66588) (_1!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))) (Some!173 (_2!1309 (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))))

(declare-fun b!128522 () Bool)

(assert (=> b!128522 (= e!83902 (contains!886 (toList!861 lt!66588) (ite (or c!23485 c!23489) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (= (and d!38817 res!62074) b!128521))

(assert (= (and b!128521 res!62073) b!128522))

(declare-fun m!150461 () Bool)

(assert (=> d!38817 m!150461))

(declare-fun m!150463 () Bool)

(assert (=> d!38817 m!150463))

(declare-fun m!150465 () Bool)

(assert (=> d!38817 m!150465))

(declare-fun m!150467 () Bool)

(assert (=> d!38817 m!150467))

(declare-fun m!150469 () Bool)

(assert (=> b!128521 m!150469))

(declare-fun m!150471 () Bool)

(assert (=> b!128522 m!150471))

(assert (=> bm!13863 d!38817))

(declare-fun b!128525 () Bool)

(declare-fun res!62077 () Bool)

(declare-fun e!83903 () Bool)

(assert (=> b!128525 (=> (not res!62077) (not e!83903))))

(assert (=> b!128525 (= res!62077 (= (size!2506 (v!3146 (underlying!445 thiss!992))) (bvadd (_size!586 (v!3146 (underlying!445 thiss!992))) (bvsdiv (bvadd (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!128523 () Bool)

(declare-fun res!62076 () Bool)

(assert (=> b!128523 (=> (not res!62076) (not e!83903))))

(assert (=> b!128523 (= res!62076 (and (= (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001)) (= (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992))))) (bvsge (_size!586 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!586 (v!3146 (underlying!445 thiss!992))) (bvadd (mask!7073 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!128524 () Bool)

(declare-fun res!62078 () Bool)

(assert (=> b!128524 (=> (not res!62078) (not e!83903))))

(assert (=> b!128524 (= res!62078 (bvsge (size!2506 (v!3146 (underlying!445 thiss!992))) (_size!586 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!128526 () Bool)

(assert (=> b!128526 (= e!83903 (and (bvsge (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!586 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun d!38819 () Bool)

(declare-fun res!62075 () Bool)

(assert (=> d!38819 (=> (not res!62075) (not e!83903))))

(assert (=> d!38819 (= res!62075 (validMask!0 (mask!7073 (v!3146 (underlying!445 thiss!992)))))))

(assert (=> d!38819 (= (simpleValid!88 (v!3146 (underlying!445 thiss!992))) e!83903)))

(assert (= (and d!38819 res!62075) b!128523))

(assert (= (and b!128523 res!62076) b!128524))

(assert (= (and b!128524 res!62078) b!128525))

(assert (= (and b!128525 res!62077) b!128526))

(declare-fun m!150473 () Bool)

(assert (=> b!128525 m!150473))

(assert (=> b!128524 m!150473))

(assert (=> d!38819 m!149339))

(assert (=> d!38689 d!38819))

(declare-fun b!128527 () Bool)

(declare-fun e!83906 () Bool)

(declare-fun e!83905 () Bool)

(assert (=> b!128527 (= e!83906 e!83905)))

(declare-fun lt!66594 () (_ BitVec 64))

(assert (=> b!128527 (= lt!66594 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000))))

(declare-fun lt!66592 () Unit!3981)

(assert (=> b!128527 (= lt!66592 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4542 (_2!1310 lt!66078)) lt!66594 #b00000000000000000000000000000000))))

(assert (=> b!128527 (arrayContainsKey!0 (_keys!4542 (_2!1310 lt!66078)) lt!66594 #b00000000000000000000000000000000)))

(declare-fun lt!66593 () Unit!3981)

(assert (=> b!128527 (= lt!66593 lt!66592)))

(declare-fun res!62079 () Bool)

(assert (=> b!128527 (= res!62079 (= (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000) (_keys!4542 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078))) (Found!271 #b00000000000000000000000000000000)))))

(assert (=> b!128527 (=> (not res!62079) (not e!83905))))

(declare-fun bm!13913 () Bool)

(declare-fun call!13916 () Bool)

(assert (=> bm!13913 (= call!13916 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4542 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078))))))

(declare-fun b!128528 () Bool)

(assert (=> b!128528 (= e!83905 call!13916)))

(declare-fun d!38821 () Bool)

(declare-fun res!62080 () Bool)

(declare-fun e!83904 () Bool)

(assert (=> d!38821 (=> res!62080 e!83904)))

(assert (=> d!38821 (= res!62080 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(assert (=> d!38821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078))) e!83904)))

(declare-fun b!128529 () Bool)

(assert (=> b!128529 (= e!83906 call!13916)))

(declare-fun b!128530 () Bool)

(assert (=> b!128530 (= e!83904 e!83906)))

(declare-fun c!23576 () Bool)

(assert (=> b!128530 (= c!23576 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(assert (= (and d!38821 (not res!62080)) b!128530))

(assert (= (and b!128530 c!23576) b!128527))

(assert (= (and b!128530 (not c!23576)) b!128529))

(assert (= (and b!128527 res!62079) b!128528))

(assert (= (or b!128528 b!128529) bm!13913))

(declare-fun m!150475 () Bool)

(assert (=> b!128527 m!150475))

(declare-fun m!150477 () Bool)

(assert (=> b!128527 m!150477))

(declare-fun m!150479 () Bool)

(assert (=> b!128527 m!150479))

(assert (=> b!128527 m!150475))

(declare-fun m!150481 () Bool)

(assert (=> b!128527 m!150481))

(declare-fun m!150483 () Bool)

(assert (=> bm!13913 m!150483))

(assert (=> b!128530 m!150475))

(assert (=> b!128530 m!150475))

(declare-fun m!150485 () Bool)

(assert (=> b!128530 m!150485))

(assert (=> b!128239 d!38821))

(declare-fun d!38823 () Bool)

(assert (=> d!38823 (= (get!1459 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3150 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38679 d!38823))

(assert (=> d!38679 d!38743))

(declare-fun d!38825 () Bool)

(assert (=> d!38825 (= (apply!112 lt!66179 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5313 () Bool)

(assert (= bs!5313 d!38825))

(declare-fun m!150487 () Bool)

(assert (=> bs!5313 m!150487))

(assert (=> bs!5313 m!150487))

(declare-fun m!150489 () Bool)

(assert (=> bs!5313 m!150489))

(assert (=> b!127940 d!38825))

(declare-fun d!38827 () Bool)

(declare-fun res!62081 () Bool)

(declare-fun e!83907 () Bool)

(assert (=> d!38827 (=> res!62081 e!83907)))

(assert (=> d!38827 (= res!62081 (and ((_ is Cons!1700) (toList!861 lt!66157)) (= (_1!1309 (h!2303 (toList!861 lt!66157))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38827 (= (containsKey!172 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000) e!83907)))

(declare-fun b!128531 () Bool)

(declare-fun e!83908 () Bool)

(assert (=> b!128531 (= e!83907 e!83908)))

(declare-fun res!62082 () Bool)

(assert (=> b!128531 (=> (not res!62082) (not e!83908))))

(assert (=> b!128531 (= res!62082 (and (or (not ((_ is Cons!1700) (toList!861 lt!66157))) (bvsle (_1!1309 (h!2303 (toList!861 lt!66157))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1700) (toList!861 lt!66157)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66157))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128532 () Bool)

(assert (=> b!128532 (= e!83908 (containsKey!172 (t!6083 (toList!861 lt!66157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38827 (not res!62081)) b!128531))

(assert (= (and b!128531 res!62082) b!128532))

(declare-fun m!150491 () Bool)

(assert (=> b!128532 m!150491))

(assert (=> d!38675 d!38827))

(declare-fun d!38829 () Bool)

(declare-fun e!83910 () Bool)

(assert (=> d!38829 e!83910))

(declare-fun res!62083 () Bool)

(assert (=> d!38829 (=> res!62083 e!83910)))

(declare-fun lt!66595 () Bool)

(assert (=> d!38829 (= res!62083 (not lt!66595))))

(declare-fun lt!66598 () Bool)

(assert (=> d!38829 (= lt!66595 lt!66598)))

(declare-fun lt!66597 () Unit!3981)

(declare-fun e!83909 () Unit!3981)

(assert (=> d!38829 (= lt!66597 e!83909)))

(declare-fun c!23577 () Bool)

(assert (=> d!38829 (= c!23577 lt!66598)))

(assert (=> d!38829 (= lt!66598 (containsKey!172 (toList!861 lt!66295) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38829 (= (contains!884 lt!66295 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66595)))

(declare-fun b!128533 () Bool)

(declare-fun lt!66596 () Unit!3981)

(assert (=> b!128533 (= e!83909 lt!66596)))

(assert (=> b!128533 (= lt!66596 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66295) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!128533 (isDefined!121 (getValueByKey!168 (toList!861 lt!66295) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128534 () Bool)

(declare-fun Unit!4007 () Unit!3981)

(assert (=> b!128534 (= e!83909 Unit!4007)))

(declare-fun b!128535 () Bool)

(assert (=> b!128535 (= e!83910 (isDefined!121 (getValueByKey!168 (toList!861 lt!66295) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38829 c!23577) b!128533))

(assert (= (and d!38829 (not c!23577)) b!128534))

(assert (= (and d!38829 (not res!62083)) b!128535))

(declare-fun m!150493 () Bool)

(assert (=> d!38829 m!150493))

(declare-fun m!150495 () Bool)

(assert (=> b!128533 m!150495))

(assert (=> b!128533 m!149845))

(assert (=> b!128533 m!149845))

(declare-fun m!150497 () Bool)

(assert (=> b!128533 m!150497))

(assert (=> b!128535 m!149845))

(assert (=> b!128535 m!149845))

(assert (=> b!128535 m!150497))

(assert (=> d!38653 d!38829))

(declare-fun c!23578 () Bool)

(declare-fun d!38831 () Bool)

(assert (=> d!38831 (= c!23578 (and ((_ is Cons!1700) lt!66298) (= (_1!1309 (h!2303 lt!66298)) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!83911 () Option!174)

(assert (=> d!38831 (= (getValueByKey!168 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!83911)))

(declare-fun b!128537 () Bool)

(declare-fun e!83912 () Option!174)

(assert (=> b!128537 (= e!83911 e!83912)))

(declare-fun c!23579 () Bool)

(assert (=> b!128537 (= c!23579 (and ((_ is Cons!1700) lt!66298) (not (= (_1!1309 (h!2303 lt!66298)) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!128538 () Bool)

(assert (=> b!128538 (= e!83912 (getValueByKey!168 (t!6083 lt!66298) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128539 () Bool)

(assert (=> b!128539 (= e!83912 None!172)))

(declare-fun b!128536 () Bool)

(assert (=> b!128536 (= e!83911 (Some!173 (_2!1309 (h!2303 lt!66298))))))

(assert (= (and d!38831 c!23578) b!128536))

(assert (= (and d!38831 (not c!23578)) b!128537))

(assert (= (and b!128537 c!23579) b!128538))

(assert (= (and b!128537 (not c!23579)) b!128539))

(declare-fun m!150499 () Bool)

(assert (=> b!128538 m!150499))

(assert (=> d!38653 d!38831))

(declare-fun d!38833 () Bool)

(assert (=> d!38833 (= (getValueByKey!168 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66599 () Unit!3981)

(assert (=> d!38833 (= lt!66599 (choose!783 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!83913 () Bool)

(assert (=> d!38833 e!83913))

(declare-fun res!62084 () Bool)

(assert (=> d!38833 (=> (not res!62084) (not e!83913))))

(assert (=> d!38833 (= res!62084 (isStrictlySorted!318 lt!66298))))

(assert (=> d!38833 (= (lemmaContainsTupThenGetReturnValue!83 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66599)))

(declare-fun b!128540 () Bool)

(declare-fun res!62085 () Bool)

(assert (=> b!128540 (=> (not res!62085) (not e!83913))))

(assert (=> b!128540 (= res!62085 (containsKey!172 lt!66298 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128541 () Bool)

(assert (=> b!128541 (= e!83913 (contains!886 lt!66298 (tuple2!2597 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38833 res!62084) b!128540))

(assert (= (and b!128540 res!62085) b!128541))

(assert (=> d!38833 m!149839))

(declare-fun m!150501 () Bool)

(assert (=> d!38833 m!150501))

(declare-fun m!150503 () Bool)

(assert (=> d!38833 m!150503))

(declare-fun m!150505 () Bool)

(assert (=> b!128540 m!150505))

(declare-fun m!150507 () Bool)

(assert (=> b!128541 m!150507))

(assert (=> d!38653 d!38833))

(declare-fun c!23581 () Bool)

(declare-fun e!83915 () List!1704)

(declare-fun b!128542 () Bool)

(declare-fun c!23580 () Bool)

(assert (=> b!128542 (= e!83915 (ite c!23581 (t!6083 (toList!861 call!13810)) (ite c!23580 (Cons!1700 (h!2303 (toList!861 call!13810)) (t!6083 (toList!861 call!13810))) Nil!1701)))))

(declare-fun b!128543 () Bool)

(declare-fun e!83917 () List!1704)

(declare-fun e!83914 () List!1704)

(assert (=> b!128543 (= e!83917 e!83914)))

(assert (=> b!128543 (= c!23581 (and ((_ is Cons!1700) (toList!861 call!13810)) (= (_1!1309 (h!2303 (toList!861 call!13810))) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128544 () Bool)

(assert (=> b!128544 (= e!83915 (insertStrictlySorted!86 (t!6083 (toList!861 call!13810)) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128545 () Bool)

(declare-fun res!62087 () Bool)

(declare-fun e!83916 () Bool)

(assert (=> b!128545 (=> (not res!62087) (not e!83916))))

(declare-fun lt!66600 () List!1704)

(assert (=> b!128545 (= res!62087 (containsKey!172 lt!66600 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13914 () Bool)

(declare-fun call!13917 () List!1704)

(declare-fun call!13919 () List!1704)

(assert (=> bm!13914 (= call!13917 call!13919)))

(declare-fun b!128546 () Bool)

(declare-fun e!83918 () List!1704)

(declare-fun call!13918 () List!1704)

(assert (=> b!128546 (= e!83918 call!13918)))

(declare-fun b!128547 () Bool)

(assert (=> b!128547 (= e!83918 call!13918)))

(declare-fun b!128548 () Bool)

(assert (=> b!128548 (= c!23580 (and ((_ is Cons!1700) (toList!861 call!13810)) (bvsgt (_1!1309 (h!2303 (toList!861 call!13810))) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!128548 (= e!83914 e!83918)))

(declare-fun b!128549 () Bool)

(assert (=> b!128549 (= e!83914 call!13917)))

(declare-fun b!128550 () Bool)

(assert (=> b!128550 (= e!83917 call!13919)))

(declare-fun b!128551 () Bool)

(assert (=> b!128551 (= e!83916 (contains!886 lt!66600 (tuple2!2597 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13916 () Bool)

(declare-fun c!23583 () Bool)

(assert (=> bm!13916 (= call!13919 ($colon$colon!90 e!83915 (ite c!23583 (h!2303 (toList!861 call!13810)) (tuple2!2597 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23582 () Bool)

(assert (=> bm!13916 (= c!23582 c!23583)))

(declare-fun d!38835 () Bool)

(assert (=> d!38835 e!83916))

(declare-fun res!62086 () Bool)

(assert (=> d!38835 (=> (not res!62086) (not e!83916))))

(assert (=> d!38835 (= res!62086 (isStrictlySorted!318 lt!66600))))

(assert (=> d!38835 (= lt!66600 e!83917)))

(assert (=> d!38835 (= c!23583 (and ((_ is Cons!1700) (toList!861 call!13810)) (bvslt (_1!1309 (h!2303 (toList!861 call!13810))) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38835 (isStrictlySorted!318 (toList!861 call!13810))))

(assert (=> d!38835 (= (insertStrictlySorted!86 (toList!861 call!13810) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66600)))

(declare-fun bm!13915 () Bool)

(assert (=> bm!13915 (= call!13918 call!13917)))

(assert (= (and d!38835 c!23583) b!128550))

(assert (= (and d!38835 (not c!23583)) b!128543))

(assert (= (and b!128543 c!23581) b!128549))

(assert (= (and b!128543 (not c!23581)) b!128548))

(assert (= (and b!128548 c!23580) b!128546))

(assert (= (and b!128548 (not c!23580)) b!128547))

(assert (= (or b!128546 b!128547) bm!13915))

(assert (= (or b!128549 bm!13915) bm!13914))

(assert (= (or b!128550 bm!13914) bm!13916))

(assert (= (and bm!13916 c!23582) b!128544))

(assert (= (and bm!13916 (not c!23582)) b!128542))

(assert (= (and d!38835 res!62086) b!128545))

(assert (= (and b!128545 res!62087) b!128551))

(declare-fun m!150509 () Bool)

(assert (=> b!128551 m!150509))

(declare-fun m!150511 () Bool)

(assert (=> b!128544 m!150511))

(declare-fun m!150513 () Bool)

(assert (=> d!38835 m!150513))

(declare-fun m!150515 () Bool)

(assert (=> d!38835 m!150515))

(declare-fun m!150517 () Bool)

(assert (=> b!128545 m!150517))

(declare-fun m!150519 () Bool)

(assert (=> bm!13916 m!150519))

(assert (=> d!38653 d!38835))

(assert (=> b!128162 d!38735))

(declare-fun d!38837 () Bool)

(assert (=> d!38837 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))

(declare-fun lt!66601 () Unit!3981)

(assert (=> d!38837 (= lt!66601 (choose!780 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))

(declare-fun e!83919 () Bool)

(assert (=> d!38837 e!83919))

(declare-fun res!62088 () Bool)

(assert (=> d!38837 (=> (not res!62088) (not e!83919))))

(assert (=> d!38837 (= res!62088 (isStrictlySorted!318 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38837 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149) lt!66601)))

(declare-fun b!128552 () Bool)

(assert (=> b!128552 (= e!83919 (containsKey!172 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))

(assert (= (and d!38837 res!62088) b!128552))

(assert (=> d!38837 m!149737))

(assert (=> d!38837 m!149737))

(assert (=> d!38837 m!149739))

(declare-fun m!150521 () Bool)

(assert (=> d!38837 m!150521))

(declare-fun m!150523 () Bool)

(assert (=> d!38837 m!150523))

(assert (=> b!128552 m!149733))

(assert (=> b!128079 d!38837))

(declare-fun d!38839 () Bool)

(assert (=> d!38839 (= (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149)) (not (isEmpty!399 (getValueByKey!168 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149))))))

(declare-fun bs!5314 () Bool)

(assert (= bs!5314 d!38839))

(assert (=> bs!5314 m!149737))

(declare-fun m!150525 () Bool)

(assert (=> bs!5314 m!150525))

(assert (=> b!128079 d!38839))

(declare-fun c!23584 () Bool)

(declare-fun d!38841 () Bool)

(assert (=> d!38841 (= c!23584 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66149)))))

(declare-fun e!83920 () Option!174)

(assert (=> d!38841 (= (getValueByKey!168 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149) e!83920)))

(declare-fun b!128554 () Bool)

(declare-fun e!83921 () Option!174)

(assert (=> b!128554 (= e!83920 e!83921)))

(declare-fun c!23585 () Bool)

(assert (=> b!128554 (= c!23585 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) (not (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66149))))))

(declare-fun b!128555 () Bool)

(assert (=> b!128555 (= e!83921 (getValueByKey!168 (t!6083 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66149))))

(declare-fun b!128556 () Bool)

(assert (=> b!128556 (= e!83921 None!172)))

(declare-fun b!128553 () Bool)

(assert (=> b!128553 (= e!83920 (Some!173 (_2!1309 (h!2303 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(assert (= (and d!38841 c!23584) b!128553))

(assert (= (and d!38841 (not c!23584)) b!128554))

(assert (= (and b!128554 c!23585) b!128555))

(assert (= (and b!128554 (not c!23585)) b!128556))

(declare-fun m!150527 () Bool)

(assert (=> b!128555 m!150527))

(assert (=> b!128079 d!38841))

(assert (=> b!128043 d!38665))

(declare-fun d!38843 () Bool)

(declare-fun c!23586 () Bool)

(assert (=> d!38843 (= c!23586 (and ((_ is Cons!1700) (toList!861 lt!66266)) (= (_1!1309 (h!2303 (toList!861 lt!66266))) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!83922 () Option!174)

(assert (=> d!38843 (= (getValueByKey!168 (toList!861 lt!66266) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!83922)))

(declare-fun b!128558 () Bool)

(declare-fun e!83923 () Option!174)

(assert (=> b!128558 (= e!83922 e!83923)))

(declare-fun c!23587 () Bool)

(assert (=> b!128558 (= c!23587 (and ((_ is Cons!1700) (toList!861 lt!66266)) (not (= (_1!1309 (h!2303 (toList!861 lt!66266))) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128559 () Bool)

(assert (=> b!128559 (= e!83923 (getValueByKey!168 (t!6083 (toList!861 lt!66266)) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128560 () Bool)

(assert (=> b!128560 (= e!83923 None!172)))

(declare-fun b!128557 () Bool)

(assert (=> b!128557 (= e!83922 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66266)))))))

(assert (= (and d!38843 c!23586) b!128557))

(assert (= (and d!38843 (not c!23586)) b!128558))

(assert (= (and b!128558 c!23587) b!128559))

(assert (= (and b!128558 (not c!23587)) b!128560))

(declare-fun m!150529 () Bool)

(assert (=> b!128559 m!150529))

(assert (=> b!128086 d!38843))

(declare-fun d!38845 () Bool)

(assert (=> d!38845 (= (apply!112 lt!66336 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5315 () Bool)

(assert (= bs!5315 d!38845))

(declare-fun m!150531 () Bool)

(assert (=> bs!5315 m!150531))

(assert (=> bs!5315 m!150531))

(declare-fun m!150533 () Bool)

(assert (=> bs!5315 m!150533))

(assert (=> b!128166 d!38845))

(declare-fun d!38847 () Bool)

(assert (=> d!38847 (= (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!399 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5316 () Bool)

(assert (= bs!5316 d!38847))

(assert (=> bs!5316 m!150029))

(declare-fun m!150535 () Bool)

(assert (=> bs!5316 m!150535))

(assert (=> b!128243 d!38847))

(declare-fun d!38849 () Bool)

(declare-fun c!23588 () Bool)

(assert (=> d!38849 (= c!23588 (and ((_ is Cons!1700) (toList!861 lt!66157)) (= (_1!1309 (h!2303 (toList!861 lt!66157))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!83924 () Option!174)

(assert (=> d!38849 (= (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000) e!83924)))

(declare-fun b!128562 () Bool)

(declare-fun e!83925 () Option!174)

(assert (=> b!128562 (= e!83924 e!83925)))

(declare-fun c!23589 () Bool)

(assert (=> b!128562 (= c!23589 (and ((_ is Cons!1700) (toList!861 lt!66157)) (not (= (_1!1309 (h!2303 (toList!861 lt!66157))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128563 () Bool)

(assert (=> b!128563 (= e!83925 (getValueByKey!168 (t!6083 (toList!861 lt!66157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128564 () Bool)

(assert (=> b!128564 (= e!83925 None!172)))

(declare-fun b!128561 () Bool)

(assert (=> b!128561 (= e!83924 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66157)))))))

(assert (= (and d!38849 c!23588) b!128561))

(assert (= (and d!38849 (not c!23588)) b!128562))

(assert (= (and b!128562 c!23589) b!128563))

(assert (= (and b!128562 (not c!23589)) b!128564))

(declare-fun m!150537 () Bool)

(assert (=> b!128563 m!150537))

(assert (=> b!128243 d!38849))

(declare-fun d!38851 () Bool)

(declare-fun e!83926 () Bool)

(assert (=> d!38851 e!83926))

(declare-fun res!62090 () Bool)

(assert (=> d!38851 (=> (not res!62090) (not e!83926))))

(declare-fun lt!66602 () ListLongMap!1691)

(assert (=> d!38851 (= res!62090 (contains!884 lt!66602 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun lt!66605 () List!1704)

(assert (=> d!38851 (= lt!66602 (ListLongMap!1692 lt!66605))))

(declare-fun lt!66604 () Unit!3981)

(declare-fun lt!66603 () Unit!3981)

(assert (=> d!38851 (= lt!66604 lt!66603)))

(assert (=> d!38851 (= (getValueByKey!168 lt!66605 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (=> d!38851 (= lt!66603 (lemmaContainsTupThenGetReturnValue!83 lt!66605 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (=> d!38851 (= lt!66605 (insertStrictlySorted!86 (toList!861 call!13836) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (=> d!38851 (= (+!171 call!13836 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))) lt!66602)))

(declare-fun b!128565 () Bool)

(declare-fun res!62089 () Bool)

(assert (=> b!128565 (=> (not res!62089) (not e!83926))))

(assert (=> b!128565 (= res!62089 (= (getValueByKey!168 (toList!861 lt!66602) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(declare-fun b!128566 () Bool)

(assert (=> b!128566 (= e!83926 (contains!886 (toList!861 lt!66602) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(assert (= (and d!38851 res!62090) b!128565))

(assert (= (and b!128565 res!62089) b!128566))

(declare-fun m!150539 () Bool)

(assert (=> d!38851 m!150539))

(declare-fun m!150541 () Bool)

(assert (=> d!38851 m!150541))

(declare-fun m!150543 () Bool)

(assert (=> d!38851 m!150543))

(declare-fun m!150545 () Bool)

(assert (=> d!38851 m!150545))

(declare-fun m!150547 () Bool)

(assert (=> b!128565 m!150547))

(declare-fun m!150549 () Bool)

(assert (=> b!128566 m!150549))

(assert (=> b!127954 d!38851))

(assert (=> bm!13880 d!38599))

(declare-fun d!38853 () Bool)

(declare-fun e!83928 () Bool)

(assert (=> d!38853 e!83928))

(declare-fun res!62091 () Bool)

(assert (=> d!38853 (=> res!62091 e!83928)))

(declare-fun lt!66606 () Bool)

(assert (=> d!38853 (= res!62091 (not lt!66606))))

(declare-fun lt!66609 () Bool)

(assert (=> d!38853 (= lt!66606 lt!66609)))

(declare-fun lt!66608 () Unit!3981)

(declare-fun e!83927 () Unit!3981)

(assert (=> d!38853 (= lt!66608 e!83927)))

(declare-fun c!23590 () Bool)

(assert (=> d!38853 (= c!23590 lt!66609)))

(assert (=> d!38853 (= lt!66609 (containsKey!172 (toList!861 lt!66219) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38853 (= (contains!884 lt!66219 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66606)))

(declare-fun b!128567 () Bool)

(declare-fun lt!66607 () Unit!3981)

(assert (=> b!128567 (= e!83927 lt!66607)))

(assert (=> b!128567 (= lt!66607 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66219) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128567 (isDefined!121 (getValueByKey!168 (toList!861 lt!66219) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128568 () Bool)

(declare-fun Unit!4008 () Unit!3981)

(assert (=> b!128568 (= e!83927 Unit!4008)))

(declare-fun b!128569 () Bool)

(assert (=> b!128569 (= e!83928 (isDefined!121 (getValueByKey!168 (toList!861 lt!66219) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38853 c!23590) b!128567))

(assert (= (and d!38853 (not c!23590)) b!128568))

(assert (= (and d!38853 (not res!62091)) b!128569))

(declare-fun m!150551 () Bool)

(assert (=> d!38853 m!150551))

(declare-fun m!150553 () Bool)

(assert (=> b!128567 m!150553))

(declare-fun m!150555 () Bool)

(assert (=> b!128567 m!150555))

(assert (=> b!128567 m!150555))

(declare-fun m!150557 () Bool)

(assert (=> b!128567 m!150557))

(assert (=> b!128569 m!150555))

(assert (=> b!128569 m!150555))

(assert (=> b!128569 m!150557))

(assert (=> d!38609 d!38853))

(assert (=> d!38609 d!38583))

(declare-fun b!128570 () Bool)

(declare-fun e!83931 () Bool)

(declare-fun e!83930 () Bool)

(assert (=> b!128570 (= e!83931 e!83930)))

(declare-fun lt!66612 () (_ BitVec 64))

(assert (=> b!128570 (= lt!66612 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!66610 () Unit!3981)

(assert (=> b!128570 (= lt!66610 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4542 newMap!16) lt!66612 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!128570 (arrayContainsKey!0 (_keys!4542 newMap!16) lt!66612 #b00000000000000000000000000000000)))

(declare-fun lt!66611 () Unit!3981)

(assert (=> b!128570 (= lt!66611 lt!66610)))

(declare-fun res!62092 () Bool)

(assert (=> b!128570 (= res!62092 (= (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4542 newMap!16) (mask!7073 newMap!16)) (Found!271 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!128570 (=> (not res!62092) (not e!83930))))

(declare-fun bm!13917 () Bool)

(declare-fun call!13920 () Bool)

(assert (=> bm!13917 (= call!13920 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!128571 () Bool)

(assert (=> b!128571 (= e!83930 call!13920)))

(declare-fun d!38855 () Bool)

(declare-fun res!62093 () Bool)

(declare-fun e!83929 () Bool)

(assert (=> d!38855 (=> res!62093 e!83929)))

(assert (=> d!38855 (= res!62093 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38855 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4542 newMap!16) (mask!7073 newMap!16)) e!83929)))

(declare-fun b!128572 () Bool)

(assert (=> b!128572 (= e!83931 call!13920)))

(declare-fun b!128573 () Bool)

(assert (=> b!128573 (= e!83929 e!83931)))

(declare-fun c!23591 () Bool)

(assert (=> b!128573 (= c!23591 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!38855 (not res!62093)) b!128573))

(assert (= (and b!128573 c!23591) b!128570))

(assert (= (and b!128573 (not c!23591)) b!128572))

(assert (= (and b!128570 res!62092) b!128571))

(assert (= (or b!128571 b!128572) bm!13917))

(declare-fun m!150559 () Bool)

(assert (=> b!128570 m!150559))

(declare-fun m!150561 () Bool)

(assert (=> b!128570 m!150561))

(declare-fun m!150563 () Bool)

(assert (=> b!128570 m!150563))

(assert (=> b!128570 m!150559))

(declare-fun m!150565 () Bool)

(assert (=> b!128570 m!150565))

(declare-fun m!150567 () Bool)

(assert (=> bm!13917 m!150567))

(assert (=> b!128573 m!150559))

(assert (=> b!128573 m!150559))

(declare-fun m!150569 () Bool)

(assert (=> b!128573 m!150569))

(assert (=> bm!13858 d!38855))

(declare-fun d!38857 () Bool)

(declare-fun e!83932 () Bool)

(assert (=> d!38857 e!83932))

(declare-fun res!62095 () Bool)

(assert (=> d!38857 (=> (not res!62095) (not e!83932))))

(declare-fun lt!66613 () ListLongMap!1691)

(assert (=> d!38857 (= res!62095 (contains!884 lt!66613 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66616 () List!1704)

(assert (=> d!38857 (= lt!66613 (ListLongMap!1692 lt!66616))))

(declare-fun lt!66615 () Unit!3981)

(declare-fun lt!66614 () Unit!3981)

(assert (=> d!38857 (= lt!66615 lt!66614)))

(assert (=> d!38857 (= (getValueByKey!168 lt!66616 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38857 (= lt!66614 (lemmaContainsTupThenGetReturnValue!83 lt!66616 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38857 (= lt!66616 (insertStrictlySorted!86 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38857 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66613)))

(declare-fun b!128574 () Bool)

(declare-fun res!62094 () Bool)

(assert (=> b!128574 (=> (not res!62094) (not e!83932))))

(assert (=> b!128574 (= res!62094 (= (getValueByKey!168 (toList!861 lt!66613) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128575 () Bool)

(assert (=> b!128575 (= e!83932 (contains!886 (toList!861 lt!66613) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38857 res!62095) b!128574))

(assert (= (and b!128574 res!62094) b!128575))

(declare-fun m!150571 () Bool)

(assert (=> d!38857 m!150571))

(declare-fun m!150573 () Bool)

(assert (=> d!38857 m!150573))

(declare-fun m!150575 () Bool)

(assert (=> d!38857 m!150575))

(declare-fun m!150577 () Bool)

(assert (=> d!38857 m!150577))

(declare-fun m!150579 () Bool)

(assert (=> b!128574 m!150579))

(declare-fun m!150581 () Bool)

(assert (=> b!128575 m!150581))

(assert (=> d!38685 d!38857))

(declare-fun d!38859 () Bool)

(assert (=> d!38859 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(assert (=> d!38859 true))

(declare-fun _$8!112 () Unit!3981)

(assert (=> d!38859 (= (choose!781 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)) _$8!112)))

(declare-fun bs!5317 () Bool)

(assert (= bs!5317 d!38859))

(assert (=> bs!5317 m!149437))

(assert (=> bs!5317 m!149437))

(assert (=> bs!5317 m!150019))

(assert (=> bs!5317 m!149353))

(assert (=> bs!5317 m!150021))

(assert (=> d!38685 d!38859))

(assert (=> d!38685 d!38611))

(declare-fun b!128576 () Bool)

(declare-fun e!83933 () Unit!3981)

(declare-fun Unit!4009 () Unit!3981)

(assert (=> b!128576 (= e!83933 Unit!4009)))

(declare-fun b!128577 () Bool)

(declare-fun e!83940 () Bool)

(declare-fun lt!66635 () ListLongMap!1691)

(assert (=> b!128577 (= e!83940 (= (apply!112 lt!66635 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!128578 () Bool)

(declare-fun res!62096 () Bool)

(declare-fun e!83936 () Bool)

(assert (=> b!128578 (=> (not res!62096) (not e!83936))))

(declare-fun e!83938 () Bool)

(assert (=> b!128578 (= res!62096 e!83938)))

(declare-fun c!23594 () Bool)

(assert (=> b!128578 (= c!23594 (not (= (bvand lt!66092 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128579 () Bool)

(declare-fun e!83935 () Bool)

(declare-fun e!83937 () Bool)

(assert (=> b!128579 (= e!83935 e!83937)))

(declare-fun res!62100 () Bool)

(declare-fun call!13923 () Bool)

(assert (=> b!128579 (= res!62100 call!13923)))

(assert (=> b!128579 (=> (not res!62100) (not e!83937))))

(declare-fun b!128580 () Bool)

(declare-fun e!83939 () Bool)

(assert (=> b!128580 (= e!83939 (= (apply!112 lt!66635 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (_values!2788 newMap!16))))))

(assert (=> b!128580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13918 () Bool)

(declare-fun call!13927 () ListLongMap!1691)

(declare-fun call!13925 () ListLongMap!1691)

(assert (=> bm!13918 (= call!13927 call!13925)))

(declare-fun b!128581 () Bool)

(declare-fun e!83943 () ListLongMap!1691)

(declare-fun call!13921 () ListLongMap!1691)

(assert (=> b!128581 (= e!83943 call!13921)))

(declare-fun b!128582 () Bool)

(assert (=> b!128582 (= e!83935 (not call!13923))))

(declare-fun c!23596 () Bool)

(declare-fun bm!13919 () Bool)

(declare-fun c!23592 () Bool)

(declare-fun call!13924 () ListLongMap!1691)

(assert (=> bm!13919 (= call!13924 (+!171 (ite c!23592 call!13925 (ite c!23596 call!13927 call!13921)) (ite (or c!23592 c!23596) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128583 () Bool)

(declare-fun call!13926 () Bool)

(assert (=> b!128583 (= e!83938 (not call!13926))))

(declare-fun b!128584 () Bool)

(declare-fun e!83941 () ListLongMap!1691)

(declare-fun call!13922 () ListLongMap!1691)

(assert (=> b!128584 (= e!83941 call!13922)))

(declare-fun b!128585 () Bool)

(declare-fun e!83945 () Bool)

(assert (=> b!128585 (= e!83945 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128587 () Bool)

(declare-fun c!23597 () Bool)

(assert (=> b!128587 (= c!23597 (and (not (= (bvand lt!66092 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!66092 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128587 (= e!83941 e!83943)))

(declare-fun bm!13920 () Bool)

(assert (=> bm!13920 (= call!13923 (contains!884 lt!66635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128588 () Bool)

(declare-fun e!83944 () Bool)

(assert (=> b!128588 (= e!83944 e!83939)))

(declare-fun res!62101 () Bool)

(assert (=> b!128588 (=> (not res!62101) (not e!83939))))

(assert (=> b!128588 (= res!62101 (contains!884 lt!66635 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128588 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13921 () Bool)

(assert (=> bm!13921 (= call!13922 call!13924)))

(declare-fun bm!13922 () Bool)

(assert (=> bm!13922 (= call!13925 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128589 () Bool)

(declare-fun lt!66621 () Unit!3981)

(assert (=> b!128589 (= e!83933 lt!66621)))

(declare-fun lt!66638 () ListLongMap!1691)

(assert (=> b!128589 (= lt!66638 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66632 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66627 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66627 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66618 () Unit!3981)

(assert (=> b!128589 (= lt!66618 (addStillContains!88 lt!66638 lt!66632 (zeroValue!2666 newMap!16) lt!66627))))

(assert (=> b!128589 (contains!884 (+!171 lt!66638 (tuple2!2597 lt!66632 (zeroValue!2666 newMap!16))) lt!66627)))

(declare-fun lt!66624 () Unit!3981)

(assert (=> b!128589 (= lt!66624 lt!66618)))

(declare-fun lt!66636 () ListLongMap!1691)

(assert (=> b!128589 (= lt!66636 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66622 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66622 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66617 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66617 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66620 () Unit!3981)

(assert (=> b!128589 (= lt!66620 (addApplyDifferent!88 lt!66636 lt!66622 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66617))))

(assert (=> b!128589 (= (apply!112 (+!171 lt!66636 (tuple2!2597 lt!66622 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66617) (apply!112 lt!66636 lt!66617))))

(declare-fun lt!66629 () Unit!3981)

(assert (=> b!128589 (= lt!66629 lt!66620)))

(declare-fun lt!66619 () ListLongMap!1691)

(assert (=> b!128589 (= lt!66619 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66628 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66634 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66634 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66626 () Unit!3981)

(assert (=> b!128589 (= lt!66626 (addApplyDifferent!88 lt!66619 lt!66628 (zeroValue!2666 newMap!16) lt!66634))))

(assert (=> b!128589 (= (apply!112 (+!171 lt!66619 (tuple2!2597 lt!66628 (zeroValue!2666 newMap!16))) lt!66634) (apply!112 lt!66619 lt!66634))))

(declare-fun lt!66637 () Unit!3981)

(assert (=> b!128589 (= lt!66637 lt!66626)))

(declare-fun lt!66631 () ListLongMap!1691)

(assert (=> b!128589 (= lt!66631 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66630 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66630 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66625 () (_ BitVec 64))

(assert (=> b!128589 (= lt!66625 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128589 (= lt!66621 (addApplyDifferent!88 lt!66631 lt!66630 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66625))))

(assert (=> b!128589 (= (apply!112 (+!171 lt!66631 (tuple2!2597 lt!66630 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66625) (apply!112 lt!66631 lt!66625))))

(declare-fun b!128590 () Bool)

(assert (=> b!128590 (= e!83937 (= (apply!112 lt!66635 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128591 () Bool)

(declare-fun e!83942 () ListLongMap!1691)

(assert (=> b!128591 (= e!83942 (+!171 call!13924 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128592 () Bool)

(assert (=> b!128592 (= e!83936 e!83935)))

(declare-fun c!23595 () Bool)

(assert (=> b!128592 (= c!23595 (not (= (bvand lt!66092 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128593 () Bool)

(declare-fun res!62102 () Bool)

(assert (=> b!128593 (=> (not res!62102) (not e!83936))))

(assert (=> b!128593 (= res!62102 e!83944)))

(declare-fun res!62098 () Bool)

(assert (=> b!128593 (=> res!62098 e!83944)))

(declare-fun e!83934 () Bool)

(assert (=> b!128593 (= res!62098 (not e!83934))))

(declare-fun res!62103 () Bool)

(assert (=> b!128593 (=> (not res!62103) (not e!83934))))

(assert (=> b!128593 (= res!62103 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128594 () Bool)

(assert (=> b!128594 (= e!83942 e!83941)))

(assert (=> b!128594 (= c!23596 (and (not (= (bvand lt!66092 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!66092 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13923 () Bool)

(assert (=> bm!13923 (= call!13921 call!13927)))

(declare-fun b!128595 () Bool)

(assert (=> b!128595 (= e!83943 call!13922)))

(declare-fun b!128586 () Bool)

(assert (=> b!128586 (= e!83934 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38861 () Bool)

(assert (=> d!38861 e!83936))

(declare-fun res!62099 () Bool)

(assert (=> d!38861 (=> (not res!62099) (not e!83936))))

(assert (=> d!38861 (= res!62099 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66623 () ListLongMap!1691)

(assert (=> d!38861 (= lt!66635 lt!66623)))

(declare-fun lt!66633 () Unit!3981)

(assert (=> d!38861 (= lt!66633 e!83933)))

(declare-fun c!23593 () Bool)

(assert (=> d!38861 (= c!23593 e!83945)))

(declare-fun res!62097 () Bool)

(assert (=> d!38861 (=> (not res!62097) (not e!83945))))

(assert (=> d!38861 (= res!62097 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38861 (= lt!66623 e!83942)))

(assert (=> d!38861 (= c!23592 (and (not (= (bvand lt!66092 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!66092 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38861 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38861 (= (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66092 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66635)))

(declare-fun b!128596 () Bool)

(assert (=> b!128596 (= e!83938 e!83940)))

(declare-fun res!62104 () Bool)

(assert (=> b!128596 (= res!62104 call!13926)))

(assert (=> b!128596 (=> (not res!62104) (not e!83940))))

(declare-fun bm!13924 () Bool)

(assert (=> bm!13924 (= call!13926 (contains!884 lt!66635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38861 c!23592) b!128591))

(assert (= (and d!38861 (not c!23592)) b!128594))

(assert (= (and b!128594 c!23596) b!128584))

(assert (= (and b!128594 (not c!23596)) b!128587))

(assert (= (and b!128587 c!23597) b!128595))

(assert (= (and b!128587 (not c!23597)) b!128581))

(assert (= (or b!128595 b!128581) bm!13923))

(assert (= (or b!128584 bm!13923) bm!13918))

(assert (= (or b!128584 b!128595) bm!13921))

(assert (= (or b!128591 bm!13918) bm!13922))

(assert (= (or b!128591 bm!13921) bm!13919))

(assert (= (and d!38861 res!62097) b!128585))

(assert (= (and d!38861 c!23593) b!128589))

(assert (= (and d!38861 (not c!23593)) b!128576))

(assert (= (and d!38861 res!62099) b!128593))

(assert (= (and b!128593 res!62103) b!128586))

(assert (= (and b!128593 (not res!62098)) b!128588))

(assert (= (and b!128588 res!62101) b!128580))

(assert (= (and b!128593 res!62102) b!128578))

(assert (= (and b!128578 c!23594) b!128596))

(assert (= (and b!128578 (not c!23594)) b!128583))

(assert (= (and b!128596 res!62104) b!128577))

(assert (= (or b!128596 b!128583) bm!13924))

(assert (= (and b!128578 res!62096) b!128592))

(assert (= (and b!128592 c!23595) b!128579))

(assert (= (and b!128592 (not c!23595)) b!128582))

(assert (= (and b!128579 res!62100) b!128590))

(assert (= (or b!128579 b!128582) bm!13920))

(declare-fun b_lambda!5687 () Bool)

(assert (=> (not b_lambda!5687) (not b!128580)))

(assert (=> b!128580 t!6091))

(declare-fun b_and!7947 () Bool)

(assert (= b_and!7943 (and (=> t!6091 result!3893) b_and!7947)))

(assert (=> b!128580 t!6093))

(declare-fun b_and!7949 () Bool)

(assert (= b_and!7945 (and (=> t!6093 result!3895) b_and!7949)))

(declare-fun m!150583 () Bool)

(assert (=> bm!13924 m!150583))

(assert (=> b!128585 m!149547))

(assert (=> b!128585 m!149547))

(assert (=> b!128585 m!149549))

(declare-fun m!150585 () Bool)

(assert (=> b!128591 m!150585))

(assert (=> b!128589 m!149353))

(declare-fun m!150587 () Bool)

(assert (=> b!128589 m!150587))

(declare-fun m!150589 () Bool)

(assert (=> b!128589 m!150589))

(assert (=> b!128589 m!149353))

(declare-fun m!150591 () Bool)

(assert (=> b!128589 m!150591))

(assert (=> b!128589 m!149547))

(declare-fun m!150593 () Bool)

(assert (=> b!128589 m!150593))

(declare-fun m!150595 () Bool)

(assert (=> b!128589 m!150595))

(declare-fun m!150597 () Bool)

(assert (=> b!128589 m!150597))

(declare-fun m!150599 () Bool)

(assert (=> b!128589 m!150599))

(assert (=> b!128589 m!150597))

(declare-fun m!150601 () Bool)

(assert (=> b!128589 m!150601))

(declare-fun m!150603 () Bool)

(assert (=> b!128589 m!150603))

(assert (=> b!128589 m!150601))

(declare-fun m!150605 () Bool)

(assert (=> b!128589 m!150605))

(declare-fun m!150607 () Bool)

(assert (=> b!128589 m!150607))

(declare-fun m!150609 () Bool)

(assert (=> b!128589 m!150609))

(declare-fun m!150611 () Bool)

(assert (=> b!128589 m!150611))

(assert (=> b!128589 m!150595))

(declare-fun m!150613 () Bool)

(assert (=> b!128589 m!150613))

(declare-fun m!150615 () Bool)

(assert (=> b!128589 m!150615))

(assert (=> b!128589 m!149353))

(declare-fun m!150617 () Bool)

(assert (=> b!128589 m!150617))

(assert (=> b!128589 m!150607))

(assert (=> b!128588 m!149547))

(assert (=> b!128588 m!149547))

(declare-fun m!150619 () Bool)

(assert (=> b!128588 m!150619))

(declare-fun m!150621 () Bool)

(assert (=> bm!13920 m!150621))

(declare-fun m!150623 () Bool)

(assert (=> bm!13919 m!150623))

(assert (=> b!128580 m!149707))

(assert (=> b!128580 m!149593))

(assert (=> b!128580 m!149547))

(assert (=> b!128580 m!149547))

(declare-fun m!150625 () Bool)

(assert (=> b!128580 m!150625))

(assert (=> b!128580 m!149707))

(assert (=> b!128580 m!149593))

(assert (=> b!128580 m!149711))

(assert (=> d!38861 m!149599))

(assert (=> b!128586 m!149547))

(assert (=> b!128586 m!149547))

(assert (=> b!128586 m!149549))

(assert (=> bm!13922 m!149353))

(assert (=> bm!13922 m!150587))

(declare-fun m!150627 () Bool)

(assert (=> b!128577 m!150627))

(declare-fun m!150629 () Bool)

(assert (=> b!128590 m!150629))

(assert (=> d!38685 d!38861))

(assert (=> d!38685 d!38791))

(declare-fun d!38863 () Bool)

(declare-fun e!83947 () Bool)

(assert (=> d!38863 e!83947))

(declare-fun res!62105 () Bool)

(assert (=> d!38863 (=> res!62105 e!83947)))

(declare-fun lt!66639 () Bool)

(assert (=> d!38863 (= res!62105 (not lt!66639))))

(declare-fun lt!66642 () Bool)

(assert (=> d!38863 (= lt!66639 lt!66642)))

(declare-fun lt!66641 () Unit!3981)

(declare-fun e!83946 () Unit!3981)

(assert (=> d!38863 (= lt!66641 e!83946)))

(declare-fun c!23598 () Bool)

(assert (=> d!38863 (= c!23598 lt!66642)))

(assert (=> d!38863 (= lt!66642 (containsKey!172 (toList!861 lt!66336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38863 (= (contains!884 lt!66336 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66639)))

(declare-fun b!128597 () Bool)

(declare-fun lt!66640 () Unit!3981)

(assert (=> b!128597 (= e!83946 lt!66640)))

(assert (=> b!128597 (= lt!66640 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128597 (isDefined!121 (getValueByKey!168 (toList!861 lt!66336) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128598 () Bool)

(declare-fun Unit!4010 () Unit!3981)

(assert (=> b!128598 (= e!83946 Unit!4010)))

(declare-fun b!128599 () Bool)

(assert (=> b!128599 (= e!83947 (isDefined!121 (getValueByKey!168 (toList!861 lt!66336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38863 c!23598) b!128597))

(assert (= (and d!38863 (not c!23598)) b!128598))

(assert (= (and d!38863 (not res!62105)) b!128599))

(declare-fun m!150631 () Bool)

(assert (=> d!38863 m!150631))

(declare-fun m!150633 () Bool)

(assert (=> b!128597 m!150633))

(declare-fun m!150635 () Bool)

(assert (=> b!128597 m!150635))

(assert (=> b!128597 m!150635))

(declare-fun m!150637 () Bool)

(assert (=> b!128597 m!150637))

(assert (=> b!128599 m!150635))

(assert (=> b!128599 m!150635))

(assert (=> b!128599 m!150637))

(assert (=> bm!13868 d!38863))

(assert (=> b!128124 d!38751))

(assert (=> b!128124 d!38611))

(declare-fun b!128600 () Bool)

(declare-fun e!83948 () Unit!3981)

(declare-fun Unit!4011 () Unit!3981)

(assert (=> b!128600 (= e!83948 Unit!4011)))

(declare-fun b!128601 () Bool)

(declare-fun e!83955 () Bool)

(declare-fun lt!66661 () ListLongMap!1691)

(assert (=> b!128601 (= e!83955 (= (apply!112 lt!66661 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!128602 () Bool)

(declare-fun res!62106 () Bool)

(declare-fun e!83951 () Bool)

(assert (=> b!128602 (=> (not res!62106) (not e!83951))))

(declare-fun e!83953 () Bool)

(assert (=> b!128602 (= res!62106 e!83953)))

(declare-fun c!23601 () Bool)

(assert (=> b!128602 (= c!23601 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128603 () Bool)

(declare-fun e!83950 () Bool)

(declare-fun e!83952 () Bool)

(assert (=> b!128603 (= e!83950 e!83952)))

(declare-fun res!62110 () Bool)

(declare-fun call!13930 () Bool)

(assert (=> b!128603 (= res!62110 call!13930)))

(assert (=> b!128603 (=> (not res!62110) (not e!83952))))

(declare-fun b!128604 () Bool)

(declare-fun e!83954 () Bool)

(assert (=> b!128604 (= e!83954 (= (apply!112 lt!66661 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))))))

(assert (=> b!128604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13925 () Bool)

(declare-fun call!13934 () ListLongMap!1691)

(declare-fun call!13932 () ListLongMap!1691)

(assert (=> bm!13925 (= call!13934 call!13932)))

(declare-fun b!128605 () Bool)

(declare-fun e!83958 () ListLongMap!1691)

(declare-fun call!13928 () ListLongMap!1691)

(assert (=> b!128605 (= e!83958 call!13928)))

(declare-fun b!128606 () Bool)

(assert (=> b!128606 (= e!83950 (not call!13930))))

(declare-fun c!23599 () Bool)

(declare-fun bm!13926 () Bool)

(declare-fun call!13931 () ListLongMap!1691)

(declare-fun c!23603 () Bool)

(assert (=> bm!13926 (= call!13931 (+!171 (ite c!23599 call!13932 (ite c!23603 call!13934 call!13928)) (ite (or c!23599 c!23603) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!128607 () Bool)

(declare-fun call!13933 () Bool)

(assert (=> b!128607 (= e!83953 (not call!13933))))

(declare-fun b!128608 () Bool)

(declare-fun e!83956 () ListLongMap!1691)

(declare-fun call!13929 () ListLongMap!1691)

(assert (=> b!128608 (= e!83956 call!13929)))

(declare-fun b!128609 () Bool)

(declare-fun e!83960 () Bool)

(assert (=> b!128609 (= e!83960 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128611 () Bool)

(declare-fun c!23604 () Bool)

(assert (=> b!128611 (= c!23604 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128611 (= e!83956 e!83958)))

(declare-fun bm!13927 () Bool)

(assert (=> bm!13927 (= call!13930 (contains!884 lt!66661 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128612 () Bool)

(declare-fun e!83959 () Bool)

(assert (=> b!128612 (= e!83959 e!83954)))

(declare-fun res!62111 () Bool)

(assert (=> b!128612 (=> (not res!62111) (not e!83954))))

(assert (=> b!128612 (= res!62111 (contains!884 lt!66661 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128612 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13928 () Bool)

(assert (=> bm!13928 (= call!13929 call!13931)))

(declare-fun bm!13929 () Bool)

(assert (=> bm!13929 (= call!13932 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128613 () Bool)

(declare-fun lt!66647 () Unit!3981)

(assert (=> b!128613 (= e!83948 lt!66647)))

(declare-fun lt!66664 () ListLongMap!1691)

(assert (=> b!128613 (= lt!66664 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66658 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66653 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66653 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66644 () Unit!3981)

(assert (=> b!128613 (= lt!66644 (addStillContains!88 lt!66664 lt!66658 (zeroValue!2666 newMap!16) lt!66653))))

(assert (=> b!128613 (contains!884 (+!171 lt!66664 (tuple2!2597 lt!66658 (zeroValue!2666 newMap!16))) lt!66653)))

(declare-fun lt!66650 () Unit!3981)

(assert (=> b!128613 (= lt!66650 lt!66644)))

(declare-fun lt!66662 () ListLongMap!1691)

(assert (=> b!128613 (= lt!66662 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66648 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66648 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66643 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66643 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66646 () Unit!3981)

(assert (=> b!128613 (= lt!66646 (addApplyDifferent!88 lt!66662 lt!66648 (minValue!2666 newMap!16) lt!66643))))

(assert (=> b!128613 (= (apply!112 (+!171 lt!66662 (tuple2!2597 lt!66648 (minValue!2666 newMap!16))) lt!66643) (apply!112 lt!66662 lt!66643))))

(declare-fun lt!66655 () Unit!3981)

(assert (=> b!128613 (= lt!66655 lt!66646)))

(declare-fun lt!66645 () ListLongMap!1691)

(assert (=> b!128613 (= lt!66645 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66654 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66660 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66660 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66652 () Unit!3981)

(assert (=> b!128613 (= lt!66652 (addApplyDifferent!88 lt!66645 lt!66654 (zeroValue!2666 newMap!16) lt!66660))))

(assert (=> b!128613 (= (apply!112 (+!171 lt!66645 (tuple2!2597 lt!66654 (zeroValue!2666 newMap!16))) lt!66660) (apply!112 lt!66645 lt!66660))))

(declare-fun lt!66663 () Unit!3981)

(assert (=> b!128613 (= lt!66663 lt!66652)))

(declare-fun lt!66657 () ListLongMap!1691)

(assert (=> b!128613 (= lt!66657 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66656 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66651 () (_ BitVec 64))

(assert (=> b!128613 (= lt!66651 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128613 (= lt!66647 (addApplyDifferent!88 lt!66657 lt!66656 (minValue!2666 newMap!16) lt!66651))))

(assert (=> b!128613 (= (apply!112 (+!171 lt!66657 (tuple2!2597 lt!66656 (minValue!2666 newMap!16))) lt!66651) (apply!112 lt!66657 lt!66651))))

(declare-fun b!128614 () Bool)

(assert (=> b!128614 (= e!83952 (= (apply!112 lt!66661 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!128615 () Bool)

(declare-fun e!83957 () ListLongMap!1691)

(assert (=> b!128615 (= e!83957 (+!171 call!13931 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!128616 () Bool)

(assert (=> b!128616 (= e!83951 e!83950)))

(declare-fun c!23602 () Bool)

(assert (=> b!128616 (= c!23602 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128617 () Bool)

(declare-fun res!62112 () Bool)

(assert (=> b!128617 (=> (not res!62112) (not e!83951))))

(assert (=> b!128617 (= res!62112 e!83959)))

(declare-fun res!62108 () Bool)

(assert (=> b!128617 (=> res!62108 e!83959)))

(declare-fun e!83949 () Bool)

(assert (=> b!128617 (= res!62108 (not e!83949))))

(declare-fun res!62113 () Bool)

(assert (=> b!128617 (=> (not res!62113) (not e!83949))))

(assert (=> b!128617 (= res!62113 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128618 () Bool)

(assert (=> b!128618 (= e!83957 e!83956)))

(assert (=> b!128618 (= c!23603 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13930 () Bool)

(assert (=> bm!13930 (= call!13928 call!13934)))

(declare-fun b!128619 () Bool)

(assert (=> b!128619 (= e!83958 call!13929)))

(declare-fun b!128610 () Bool)

(assert (=> b!128610 (= e!83949 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38865 () Bool)

(assert (=> d!38865 e!83951))

(declare-fun res!62109 () Bool)

(assert (=> d!38865 (=> (not res!62109) (not e!83951))))

(assert (=> d!38865 (= res!62109 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66649 () ListLongMap!1691)

(assert (=> d!38865 (= lt!66661 lt!66649)))

(declare-fun lt!66659 () Unit!3981)

(assert (=> d!38865 (= lt!66659 e!83948)))

(declare-fun c!23600 () Bool)

(assert (=> d!38865 (= c!23600 e!83960)))

(declare-fun res!62107 () Bool)

(assert (=> d!38865 (=> (not res!62107) (not e!83960))))

(assert (=> d!38865 (= res!62107 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38865 (= lt!66649 e!83957)))

(assert (=> d!38865 (= c!23599 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38865 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38865 (= (getCurrentListMap!539 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66661)))

(declare-fun b!128620 () Bool)

(assert (=> b!128620 (= e!83953 e!83955)))

(declare-fun res!62114 () Bool)

(assert (=> b!128620 (= res!62114 call!13933)))

(assert (=> b!128620 (=> (not res!62114) (not e!83955))))

(declare-fun bm!13931 () Bool)

(assert (=> bm!13931 (= call!13933 (contains!884 lt!66661 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38865 c!23599) b!128615))

(assert (= (and d!38865 (not c!23599)) b!128618))

(assert (= (and b!128618 c!23603) b!128608))

(assert (= (and b!128618 (not c!23603)) b!128611))

(assert (= (and b!128611 c!23604) b!128619))

(assert (= (and b!128611 (not c!23604)) b!128605))

(assert (= (or b!128619 b!128605) bm!13930))

(assert (= (or b!128608 bm!13930) bm!13925))

(assert (= (or b!128608 b!128619) bm!13928))

(assert (= (or b!128615 bm!13925) bm!13929))

(assert (= (or b!128615 bm!13928) bm!13926))

(assert (= (and d!38865 res!62107) b!128609))

(assert (= (and d!38865 c!23600) b!128613))

(assert (= (and d!38865 (not c!23600)) b!128600))

(assert (= (and d!38865 res!62109) b!128617))

(assert (= (and b!128617 res!62113) b!128610))

(assert (= (and b!128617 (not res!62108)) b!128612))

(assert (= (and b!128612 res!62111) b!128604))

(assert (= (and b!128617 res!62112) b!128602))

(assert (= (and b!128602 c!23601) b!128620))

(assert (= (and b!128602 (not c!23601)) b!128607))

(assert (= (and b!128620 res!62114) b!128601))

(assert (= (or b!128620 b!128607) bm!13931))

(assert (= (and b!128602 res!62106) b!128616))

(assert (= (and b!128616 c!23602) b!128603))

(assert (= (and b!128616 (not c!23602)) b!128606))

(assert (= (and b!128603 res!62110) b!128614))

(assert (= (or b!128603 b!128606) bm!13927))

(declare-fun b_lambda!5689 () Bool)

(assert (=> (not b_lambda!5689) (not b!128604)))

(assert (=> b!128604 t!6091))

(declare-fun b_and!7951 () Bool)

(assert (= b_and!7947 (and (=> t!6091 result!3893) b_and!7951)))

(assert (=> b!128604 t!6093))

(declare-fun b_and!7953 () Bool)

(assert (= b_and!7949 (and (=> t!6093 result!3895) b_and!7953)))

(declare-fun m!150639 () Bool)

(assert (=> bm!13931 m!150639))

(assert (=> b!128609 m!149547))

(assert (=> b!128609 m!149547))

(assert (=> b!128609 m!149549))

(declare-fun m!150641 () Bool)

(assert (=> b!128615 m!150641))

(declare-fun m!150643 () Bool)

(assert (=> b!128613 m!150643))

(declare-fun m!150645 () Bool)

(assert (=> b!128613 m!150645))

(declare-fun m!150647 () Bool)

(assert (=> b!128613 m!150647))

(assert (=> b!128613 m!149547))

(declare-fun m!150649 () Bool)

(assert (=> b!128613 m!150649))

(declare-fun m!150651 () Bool)

(assert (=> b!128613 m!150651))

(declare-fun m!150653 () Bool)

(assert (=> b!128613 m!150653))

(declare-fun m!150655 () Bool)

(assert (=> b!128613 m!150655))

(assert (=> b!128613 m!150653))

(declare-fun m!150657 () Bool)

(assert (=> b!128613 m!150657))

(declare-fun m!150659 () Bool)

(assert (=> b!128613 m!150659))

(assert (=> b!128613 m!150657))

(declare-fun m!150661 () Bool)

(assert (=> b!128613 m!150661))

(declare-fun m!150663 () Bool)

(assert (=> b!128613 m!150663))

(declare-fun m!150665 () Bool)

(assert (=> b!128613 m!150665))

(declare-fun m!150667 () Bool)

(assert (=> b!128613 m!150667))

(assert (=> b!128613 m!150651))

(declare-fun m!150669 () Bool)

(assert (=> b!128613 m!150669))

(declare-fun m!150671 () Bool)

(assert (=> b!128613 m!150671))

(declare-fun m!150673 () Bool)

(assert (=> b!128613 m!150673))

(assert (=> b!128613 m!150663))

(assert (=> b!128612 m!149547))

(assert (=> b!128612 m!149547))

(declare-fun m!150675 () Bool)

(assert (=> b!128612 m!150675))

(declare-fun m!150677 () Bool)

(assert (=> bm!13927 m!150677))

(declare-fun m!150679 () Bool)

(assert (=> bm!13926 m!150679))

(declare-fun m!150681 () Bool)

(assert (=> b!128604 m!150681))

(assert (=> b!128604 m!149593))

(assert (=> b!128604 m!149547))

(assert (=> b!128604 m!149547))

(declare-fun m!150683 () Bool)

(assert (=> b!128604 m!150683))

(assert (=> b!128604 m!150681))

(assert (=> b!128604 m!149593))

(declare-fun m!150685 () Bool)

(assert (=> b!128604 m!150685))

(assert (=> d!38865 m!149599))

(assert (=> b!128610 m!149547))

(assert (=> b!128610 m!149547))

(assert (=> b!128610 m!149549))

(assert (=> bm!13929 m!150643))

(declare-fun m!150687 () Bool)

(assert (=> b!128601 m!150687))

(declare-fun m!150689 () Bool)

(assert (=> b!128614 m!150689))

(assert (=> b!128124 d!38865))

(declare-fun d!38867 () Bool)

(assert (=> d!38867 (= (get!1459 (getValueByKey!168 (toList!861 lt!66141) lt!66156)) (v!3150 (getValueByKey!168 (toList!861 lt!66141) lt!66156)))))

(assert (=> d!38631 d!38867))

(declare-fun d!38869 () Bool)

(declare-fun c!23605 () Bool)

(assert (=> d!38869 (= c!23605 (and ((_ is Cons!1700) (toList!861 lt!66141)) (= (_1!1309 (h!2303 (toList!861 lt!66141))) lt!66156)))))

(declare-fun e!83961 () Option!174)

(assert (=> d!38869 (= (getValueByKey!168 (toList!861 lt!66141) lt!66156) e!83961)))

(declare-fun b!128622 () Bool)

(declare-fun e!83962 () Option!174)

(assert (=> b!128622 (= e!83961 e!83962)))

(declare-fun c!23606 () Bool)

(assert (=> b!128622 (= c!23606 (and ((_ is Cons!1700) (toList!861 lt!66141)) (not (= (_1!1309 (h!2303 (toList!861 lt!66141))) lt!66156))))))

(declare-fun b!128623 () Bool)

(assert (=> b!128623 (= e!83962 (getValueByKey!168 (t!6083 (toList!861 lt!66141)) lt!66156))))

(declare-fun b!128624 () Bool)

(assert (=> b!128624 (= e!83962 None!172)))

(declare-fun b!128621 () Bool)

(assert (=> b!128621 (= e!83961 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66141)))))))

(assert (= (and d!38869 c!23605) b!128621))

(assert (= (and d!38869 (not c!23605)) b!128622))

(assert (= (and b!128622 c!23606) b!128623))

(assert (= (and b!128622 (not c!23606)) b!128624))

(declare-fun m!150691 () Bool)

(assert (=> b!128623 m!150691))

(assert (=> d!38631 d!38869))

(assert (=> b!128062 d!38735))

(assert (=> b!127949 d!38735))

(declare-fun d!38871 () Bool)

(assert (=> d!38871 (= (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66156)) (v!3150 (getValueByKey!168 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66156)))))

(assert (=> d!38637 d!38871))

(declare-fun d!38873 () Bool)

(declare-fun c!23607 () Bool)

(assert (=> d!38873 (= c!23607 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66156)))))

(declare-fun e!83963 () Option!174)

(assert (=> d!38873 (= (getValueByKey!168 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66156) e!83963)))

(declare-fun b!128626 () Bool)

(declare-fun e!83964 () Option!174)

(assert (=> b!128626 (= e!83963 e!83964)))

(declare-fun c!23608 () Bool)

(assert (=> b!128626 (= c!23608 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) (not (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66156))))))

(declare-fun b!128627 () Bool)

(assert (=> b!128627 (= e!83964 (getValueByKey!168 (t!6083 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66156))))

(declare-fun b!128628 () Bool)

(assert (=> b!128628 (= e!83964 None!172)))

(declare-fun b!128625 () Bool)

(assert (=> b!128625 (= e!83963 (Some!173 (_2!1309 (h!2303 (toList!861 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))))

(assert (= (and d!38873 c!23607) b!128625))

(assert (= (and d!38873 (not c!23607)) b!128626))

(assert (= (and b!128626 c!23608) b!128627))

(assert (= (and b!128626 (not c!23608)) b!128628))

(declare-fun m!150693 () Bool)

(assert (=> b!128627 m!150693))

(assert (=> d!38637 d!38873))

(declare-fun d!38875 () Bool)

(assert (=> d!38875 (= (inRange!0 (index!3241 lt!66435) (mask!7073 newMap!16)) (and (bvsge (index!3241 lt!66435) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66435) (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!128228 d!38875))

(declare-fun b!128629 () Bool)

(declare-fun e!83967 () Bool)

(declare-fun e!83969 () Bool)

(assert (=> b!128629 (= e!83967 e!83969)))

(declare-fun c!23612 () Bool)

(declare-fun e!83971 () Bool)

(assert (=> b!128629 (= c!23612 e!83971)))

(declare-fun res!62115 () Bool)

(assert (=> b!128629 (=> (not res!62115) (not e!83971))))

(assert (=> b!128629 (= res!62115 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128630 () Bool)

(declare-fun e!83966 () Bool)

(assert (=> b!128630 (= e!83969 e!83966)))

(declare-fun c!23610 () Bool)

(assert (=> b!128630 (= c!23610 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128631 () Bool)

(assert (=> b!128631 (= e!83971 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!128631 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!128632 () Bool)

(declare-fun e!83970 () ListLongMap!1691)

(declare-fun call!13935 () ListLongMap!1691)

(assert (=> b!128632 (= e!83970 call!13935)))

(declare-fun b!128633 () Bool)

(declare-fun lt!66669 () Unit!3981)

(declare-fun lt!66668 () Unit!3981)

(assert (=> b!128633 (= lt!66669 lt!66668)))

(declare-fun lt!66670 () (_ BitVec 64))

(declare-fun lt!66666 () V!3451)

(declare-fun lt!66671 () (_ BitVec 64))

(declare-fun lt!66667 () ListLongMap!1691)

(assert (=> b!128633 (not (contains!884 (+!171 lt!66667 (tuple2!2597 lt!66671 lt!66666)) lt!66670))))

(assert (=> b!128633 (= lt!66668 (addStillNotContains!57 lt!66667 lt!66671 lt!66666 lt!66670))))

(assert (=> b!128633 (= lt!66670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128633 (= lt!66666 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128633 (= lt!66671 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!128633 (= lt!66667 call!13935)))

(assert (=> b!128633 (= e!83970 (+!171 call!13935 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128634 () Bool)

(declare-fun e!83968 () ListLongMap!1691)

(assert (=> b!128634 (= e!83968 e!83970)))

(declare-fun c!23611 () Bool)

(assert (=> b!128634 (= c!23611 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!13932 () Bool)

(assert (=> bm!13932 (= call!13935 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!128635 () Bool)

(declare-fun e!83965 () Bool)

(assert (=> b!128635 (= e!83969 e!83965)))

(assert (=> b!128635 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun lt!66665 () ListLongMap!1691)

(declare-fun res!62118 () Bool)

(assert (=> b!128635 (= res!62118 (contains!884 lt!66665 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!128635 (=> (not res!62118) (not e!83965))))

(declare-fun b!128636 () Bool)

(assert (=> b!128636 (= e!83968 (ListLongMap!1692 Nil!1701))))

(declare-fun b!128637 () Bool)

(assert (=> b!128637 (= e!83966 (= lt!66665 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun d!38877 () Bool)

(assert (=> d!38877 e!83967))

(declare-fun res!62116 () Bool)

(assert (=> d!38877 (=> (not res!62116) (not e!83967))))

(assert (=> d!38877 (= res!62116 (not (contains!884 lt!66665 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38877 (= lt!66665 e!83968)))

(declare-fun c!23609 () Bool)

(assert (=> d!38877 (= c!23609 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!38877 (validMask!0 (mask!7073 (v!3146 (underlying!445 thiss!992))))))

(assert (=> d!38877 (= (getCurrentListMapNoExtraKeys!137 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (_values!2788 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992))) (extraKeys!2582 (v!3146 (underlying!445 thiss!992))) (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) (minValue!2666 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992)))) lt!66665)))

(declare-fun b!128638 () Bool)

(assert (=> b!128638 (= e!83966 (isEmpty!400 lt!66665))))

(declare-fun b!128639 () Bool)

(declare-fun res!62117 () Bool)

(assert (=> b!128639 (=> (not res!62117) (not e!83967))))

(assert (=> b!128639 (= res!62117 (not (contains!884 lt!66665 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128640 () Bool)

(assert (=> b!128640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> b!128640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2503 (_values!2788 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> b!128640 (= e!83965 (= (apply!112 lt!66665 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38877 c!23609) b!128636))

(assert (= (and d!38877 (not c!23609)) b!128634))

(assert (= (and b!128634 c!23611) b!128633))

(assert (= (and b!128634 (not c!23611)) b!128632))

(assert (= (or b!128633 b!128632) bm!13932))

(assert (= (and d!38877 res!62116) b!128639))

(assert (= (and b!128639 res!62117) b!128629))

(assert (= (and b!128629 res!62115) b!128631))

(assert (= (and b!128629 c!23612) b!128635))

(assert (= (and b!128629 (not c!23612)) b!128630))

(assert (= (and b!128635 res!62118) b!128640))

(assert (= (and b!128630 c!23610) b!128637))

(assert (= (and b!128630 (not c!23610)) b!128638))

(declare-fun b_lambda!5691 () Bool)

(assert (=> (not b_lambda!5691) (not b!128633)))

(assert (=> b!128633 t!6080))

(declare-fun b_and!7955 () Bool)

(assert (= b_and!7951 (and (=> t!6080 result!3879) b_and!7955)))

(assert (=> b!128633 t!6082))

(declare-fun b_and!7957 () Bool)

(assert (= b_and!7953 (and (=> t!6082 result!3883) b_and!7957)))

(declare-fun b_lambda!5693 () Bool)

(assert (=> (not b_lambda!5693) (not b!128640)))

(assert (=> b!128640 t!6080))

(declare-fun b_and!7959 () Bool)

(assert (= b_and!7955 (and (=> t!6080 result!3879) b_and!7959)))

(assert (=> b!128640 t!6082))

(declare-fun b_and!7961 () Bool)

(assert (= b_and!7957 (and (=> t!6082 result!3883) b_and!7961)))

(declare-fun m!150695 () Bool)

(assert (=> b!128638 m!150695))

(declare-fun m!150697 () Bool)

(assert (=> b!128640 m!150697))

(declare-fun m!150699 () Bool)

(assert (=> b!128640 m!150699))

(declare-fun m!150701 () Bool)

(assert (=> b!128640 m!150701))

(assert (=> b!128640 m!150701))

(assert (=> b!128640 m!149351))

(declare-fun m!150703 () Bool)

(assert (=> b!128640 m!150703))

(assert (=> b!128640 m!150697))

(assert (=> b!128640 m!149351))

(declare-fun m!150705 () Bool)

(assert (=> b!128637 m!150705))

(declare-fun m!150707 () Bool)

(assert (=> b!128633 m!150707))

(declare-fun m!150709 () Bool)

(assert (=> b!128633 m!150709))

(assert (=> b!128633 m!150701))

(assert (=> b!128633 m!150701))

(assert (=> b!128633 m!149351))

(assert (=> b!128633 m!150703))

(declare-fun m!150711 () Bool)

(assert (=> b!128633 m!150711))

(assert (=> b!128633 m!150697))

(assert (=> b!128633 m!149351))

(assert (=> b!128633 m!150707))

(declare-fun m!150713 () Bool)

(assert (=> b!128633 m!150713))

(assert (=> b!128634 m!150697))

(assert (=> b!128634 m!150697))

(declare-fun m!150715 () Bool)

(assert (=> b!128634 m!150715))

(assert (=> b!128635 m!150697))

(assert (=> b!128635 m!150697))

(declare-fun m!150717 () Bool)

(assert (=> b!128635 m!150717))

(declare-fun m!150719 () Bool)

(assert (=> d!38877 m!150719))

(assert (=> d!38877 m!149339))

(declare-fun m!150721 () Bool)

(assert (=> b!128639 m!150721))

(assert (=> b!128631 m!150697))

(assert (=> b!128631 m!150697))

(assert (=> b!128631 m!150715))

(assert (=> bm!13932 m!150705))

(assert (=> bm!13845 d!38877))

(declare-fun d!38879 () Bool)

(assert (=> d!38879 (= (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!399 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5318 () Bool)

(assert (= bs!5318 d!38879))

(assert (=> bs!5318 m!149821))

(declare-fun m!150723 () Bool)

(assert (=> bs!5318 m!150723))

(assert (=> b!128235 d!38879))

(declare-fun d!38881 () Bool)

(declare-fun c!23613 () Bool)

(assert (=> d!38881 (= c!23613 (and ((_ is Cons!1700) (toList!861 lt!66157)) (= (_1!1309 (h!2303 (toList!861 lt!66157))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!83972 () Option!174)

(assert (=> d!38881 (= (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000) e!83972)))

(declare-fun b!128642 () Bool)

(declare-fun e!83973 () Option!174)

(assert (=> b!128642 (= e!83972 e!83973)))

(declare-fun c!23614 () Bool)

(assert (=> b!128642 (= c!23614 (and ((_ is Cons!1700) (toList!861 lt!66157)) (not (= (_1!1309 (h!2303 (toList!861 lt!66157))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128643 () Bool)

(assert (=> b!128643 (= e!83973 (getValueByKey!168 (t!6083 (toList!861 lt!66157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128644 () Bool)

(assert (=> b!128644 (= e!83973 None!172)))

(declare-fun b!128641 () Bool)

(assert (=> b!128641 (= e!83972 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66157)))))))

(assert (= (and d!38881 c!23613) b!128641))

(assert (= (and d!38881 (not c!23613)) b!128642))

(assert (= (and b!128642 c!23614) b!128643))

(assert (= (and b!128642 (not c!23614)) b!128644))

(declare-fun m!150725 () Bool)

(assert (=> b!128643 m!150725))

(assert (=> b!128235 d!38881))

(declare-fun d!38883 () Bool)

(assert (=> d!38883 (isDefined!121 (getValueByKey!168 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(declare-fun lt!66672 () Unit!3981)

(assert (=> d!38883 (= lt!66672 (choose!780 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(declare-fun e!83974 () Bool)

(assert (=> d!38883 e!83974))

(declare-fun res!62119 () Bool)

(assert (=> d!38883 (=> (not res!62119) (not e!83974))))

(assert (=> d!38883 (= res!62119 (isStrictlySorted!318 (toList!861 call!13805)))))

(assert (=> d!38883 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))) lt!66672)))

(declare-fun b!128645 () Bool)

(assert (=> b!128645 (= e!83974 (containsKey!172 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (= (and d!38883 res!62119) b!128645))

(assert (=> d!38883 m!149471))

(assert (=> d!38883 m!149853))

(assert (=> d!38883 m!149853))

(assert (=> d!38883 m!149855))

(assert (=> d!38883 m!149471))

(declare-fun m!150727 () Bool)

(assert (=> d!38883 m!150727))

(declare-fun m!150729 () Bool)

(assert (=> d!38883 m!150729))

(assert (=> b!128645 m!149471))

(assert (=> b!128645 m!149849))

(assert (=> b!128116 d!38883))

(declare-fun d!38885 () Bool)

(assert (=> d!38885 (= (isDefined!121 (getValueByKey!168 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))) (not (isEmpty!399 (getValueByKey!168 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))))

(declare-fun bs!5319 () Bool)

(assert (= bs!5319 d!38885))

(assert (=> bs!5319 m!149853))

(declare-fun m!150731 () Bool)

(assert (=> bs!5319 m!150731))

(assert (=> b!128116 d!38885))

(declare-fun c!23615 () Bool)

(declare-fun d!38887 () Bool)

(assert (=> d!38887 (= c!23615 (and ((_ is Cons!1700) (toList!861 call!13805)) (= (_1!1309 (h!2303 (toList!861 call!13805))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))))

(declare-fun e!83975 () Option!174)

(assert (=> d!38887 (= (getValueByKey!168 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))) e!83975)))

(declare-fun b!128647 () Bool)

(declare-fun e!83976 () Option!174)

(assert (=> b!128647 (= e!83975 e!83976)))

(declare-fun c!23616 () Bool)

(assert (=> b!128647 (= c!23616 (and ((_ is Cons!1700) (toList!861 call!13805)) (not (= (_1!1309 (h!2303 (toList!861 call!13805))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))))

(declare-fun b!128648 () Bool)

(assert (=> b!128648 (= e!83976 (getValueByKey!168 (t!6083 (toList!861 call!13805)) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(declare-fun b!128649 () Bool)

(assert (=> b!128649 (= e!83976 None!172)))

(declare-fun b!128646 () Bool)

(assert (=> b!128646 (= e!83975 (Some!173 (_2!1309 (h!2303 (toList!861 call!13805)))))))

(assert (= (and d!38887 c!23615) b!128646))

(assert (= (and d!38887 (not c!23615)) b!128647))

(assert (= (and b!128647 c!23616) b!128648))

(assert (= (and b!128647 (not c!23616)) b!128649))

(assert (=> b!128648 m!149471))

(declare-fun m!150733 () Bool)

(assert (=> b!128648 m!150733))

(assert (=> b!128116 d!38887))

(declare-fun d!38889 () Bool)

(declare-fun e!83978 () Bool)

(assert (=> d!38889 e!83978))

(declare-fun res!62120 () Bool)

(assert (=> d!38889 (=> res!62120 e!83978)))

(declare-fun lt!66673 () Bool)

(assert (=> d!38889 (= res!62120 (not lt!66673))))

(declare-fun lt!66676 () Bool)

(assert (=> d!38889 (= lt!66673 lt!66676)))

(declare-fun lt!66675 () Unit!3981)

(declare-fun e!83977 () Unit!3981)

(assert (=> d!38889 (= lt!66675 e!83977)))

(declare-fun c!23617 () Bool)

(assert (=> d!38889 (= c!23617 lt!66676)))

(assert (=> d!38889 (= lt!66676 (containsKey!172 (toList!861 lt!66271) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!38889 (= (contains!884 lt!66271 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66673)))

(declare-fun b!128650 () Bool)

(declare-fun lt!66674 () Unit!3981)

(assert (=> b!128650 (= e!83977 lt!66674)))

(assert (=> b!128650 (= lt!66674 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66271) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> b!128650 (isDefined!121 (getValueByKey!168 (toList!861 lt!66271) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128651 () Bool)

(declare-fun Unit!4012 () Unit!3981)

(assert (=> b!128651 (= e!83977 Unit!4012)))

(declare-fun b!128652 () Bool)

(assert (=> b!128652 (= e!83978 (isDefined!121 (getValueByKey!168 (toList!861 lt!66271) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!38889 c!23617) b!128650))

(assert (= (and d!38889 (not c!23617)) b!128651))

(assert (= (and d!38889 (not res!62120)) b!128652))

(declare-fun m!150735 () Bool)

(assert (=> d!38889 m!150735))

(declare-fun m!150737 () Bool)

(assert (=> b!128650 m!150737))

(assert (=> b!128650 m!149765))

(assert (=> b!128650 m!149765))

(declare-fun m!150739 () Bool)

(assert (=> b!128650 m!150739))

(assert (=> b!128652 m!149765))

(assert (=> b!128652 m!149765))

(assert (=> b!128652 m!150739))

(assert (=> d!38627 d!38889))

(declare-fun c!23618 () Bool)

(declare-fun d!38891 () Bool)

(assert (=> d!38891 (= c!23618 (and ((_ is Cons!1700) lt!66274) (= (_1!1309 (h!2303 lt!66274)) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!83979 () Option!174)

(assert (=> d!38891 (= (getValueByKey!168 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!83979)))

(declare-fun b!128654 () Bool)

(declare-fun e!83980 () Option!174)

(assert (=> b!128654 (= e!83979 e!83980)))

(declare-fun c!23619 () Bool)

(assert (=> b!128654 (= c!23619 (and ((_ is Cons!1700) lt!66274) (not (= (_1!1309 (h!2303 lt!66274)) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128655 () Bool)

(assert (=> b!128655 (= e!83980 (getValueByKey!168 (t!6083 lt!66274) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128656 () Bool)

(assert (=> b!128656 (= e!83980 None!172)))

(declare-fun b!128653 () Bool)

(assert (=> b!128653 (= e!83979 (Some!173 (_2!1309 (h!2303 lt!66274))))))

(assert (= (and d!38891 c!23618) b!128653))

(assert (= (and d!38891 (not c!23618)) b!128654))

(assert (= (and b!128654 c!23619) b!128655))

(assert (= (and b!128654 (not c!23619)) b!128656))

(declare-fun m!150741 () Bool)

(assert (=> b!128655 m!150741))

(assert (=> d!38627 d!38891))

(declare-fun d!38893 () Bool)

(assert (=> d!38893 (= (getValueByKey!168 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66677 () Unit!3981)

(assert (=> d!38893 (= lt!66677 (choose!783 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun e!83981 () Bool)

(assert (=> d!38893 e!83981))

(declare-fun res!62121 () Bool)

(assert (=> d!38893 (=> (not res!62121) (not e!83981))))

(assert (=> d!38893 (= res!62121 (isStrictlySorted!318 lt!66274))))

(assert (=> d!38893 (= (lemmaContainsTupThenGetReturnValue!83 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66677)))

(declare-fun b!128657 () Bool)

(declare-fun res!62122 () Bool)

(assert (=> b!128657 (=> (not res!62122) (not e!83981))))

(assert (=> b!128657 (= res!62122 (containsKey!172 lt!66274 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128658 () Bool)

(assert (=> b!128658 (= e!83981 (contains!886 lt!66274 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!38893 res!62121) b!128657))

(assert (= (and b!128657 res!62122) b!128658))

(assert (=> d!38893 m!149759))

(declare-fun m!150743 () Bool)

(assert (=> d!38893 m!150743))

(declare-fun m!150745 () Bool)

(assert (=> d!38893 m!150745))

(declare-fun m!150747 () Bool)

(assert (=> b!128657 m!150747))

(declare-fun m!150749 () Bool)

(assert (=> b!128658 m!150749))

(assert (=> d!38627 d!38893))

(declare-fun c!23620 () Bool)

(declare-fun e!83983 () List!1704)

(declare-fun c!23621 () Bool)

(declare-fun b!128659 () Bool)

(assert (=> b!128659 (= e!83983 (ite c!23621 (t!6083 (toList!861 lt!66158)) (ite c!23620 (Cons!1700 (h!2303 (toList!861 lt!66158)) (t!6083 (toList!861 lt!66158))) Nil!1701)))))

(declare-fun b!128660 () Bool)

(declare-fun e!83985 () List!1704)

(declare-fun e!83982 () List!1704)

(assert (=> b!128660 (= e!83985 e!83982)))

(assert (=> b!128660 (= c!23621 (and ((_ is Cons!1700) (toList!861 lt!66158)) (= (_1!1309 (h!2303 (toList!861 lt!66158))) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128661 () Bool)

(assert (=> b!128661 (= e!83983 (insertStrictlySorted!86 (t!6083 (toList!861 lt!66158)) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128662 () Bool)

(declare-fun res!62124 () Bool)

(declare-fun e!83984 () Bool)

(assert (=> b!128662 (=> (not res!62124) (not e!83984))))

(declare-fun lt!66678 () List!1704)

(assert (=> b!128662 (= res!62124 (containsKey!172 lt!66678 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun bm!13933 () Bool)

(declare-fun call!13936 () List!1704)

(declare-fun call!13938 () List!1704)

(assert (=> bm!13933 (= call!13936 call!13938)))

(declare-fun b!128663 () Bool)

(declare-fun e!83986 () List!1704)

(declare-fun call!13937 () List!1704)

(assert (=> b!128663 (= e!83986 call!13937)))

(declare-fun b!128664 () Bool)

(assert (=> b!128664 (= e!83986 call!13937)))

(declare-fun b!128665 () Bool)

(assert (=> b!128665 (= c!23620 (and ((_ is Cons!1700) (toList!861 lt!66158)) (bvsgt (_1!1309 (h!2303 (toList!861 lt!66158))) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> b!128665 (= e!83982 e!83986)))

(declare-fun b!128666 () Bool)

(assert (=> b!128666 (= e!83982 call!13936)))

(declare-fun b!128667 () Bool)

(assert (=> b!128667 (= e!83985 call!13938)))

(declare-fun b!128668 () Bool)

(assert (=> b!128668 (= e!83984 (contains!886 lt!66678 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun bm!13935 () Bool)

(declare-fun c!23623 () Bool)

(assert (=> bm!13935 (= call!13938 ($colon$colon!90 e!83983 (ite c!23623 (h!2303 (toList!861 lt!66158)) (tuple2!2597 (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun c!23622 () Bool)

(assert (=> bm!13935 (= c!23622 c!23623)))

(declare-fun d!38895 () Bool)

(assert (=> d!38895 e!83984))

(declare-fun res!62123 () Bool)

(assert (=> d!38895 (=> (not res!62123) (not e!83984))))

(assert (=> d!38895 (= res!62123 (isStrictlySorted!318 lt!66678))))

(assert (=> d!38895 (= lt!66678 e!83985)))

(assert (=> d!38895 (= c!23623 (and ((_ is Cons!1700) (toList!861 lt!66158)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66158))) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!38895 (isStrictlySorted!318 (toList!861 lt!66158))))

(assert (=> d!38895 (= (insertStrictlySorted!86 (toList!861 lt!66158) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66678)))

(declare-fun bm!13934 () Bool)

(assert (=> bm!13934 (= call!13937 call!13936)))

(assert (= (and d!38895 c!23623) b!128667))

(assert (= (and d!38895 (not c!23623)) b!128660))

(assert (= (and b!128660 c!23621) b!128666))

(assert (= (and b!128660 (not c!23621)) b!128665))

(assert (= (and b!128665 c!23620) b!128663))

(assert (= (and b!128665 (not c!23620)) b!128664))

(assert (= (or b!128663 b!128664) bm!13934))

(assert (= (or b!128666 bm!13934) bm!13933))

(assert (= (or b!128667 bm!13933) bm!13935))

(assert (= (and bm!13935 c!23622) b!128661))

(assert (= (and bm!13935 (not c!23622)) b!128659))

(assert (= (and d!38895 res!62123) b!128662))

(assert (= (and b!128662 res!62124) b!128668))

(declare-fun m!150751 () Bool)

(assert (=> b!128668 m!150751))

(declare-fun m!150753 () Bool)

(assert (=> b!128661 m!150753))

(declare-fun m!150755 () Bool)

(assert (=> d!38895 m!150755))

(declare-fun m!150757 () Bool)

(assert (=> d!38895 m!150757))

(declare-fun m!150759 () Bool)

(assert (=> b!128662 m!150759))

(declare-fun m!150761 () Bool)

(assert (=> bm!13935 m!150761))

(assert (=> d!38627 d!38895))

(declare-fun d!38897 () Bool)

(assert (=> d!38897 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (_keys!4542 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(assert (=> d!38897 true))

(declare-fun _$5!128 () Unit!3981)

(assert (=> d!38897 (= (choose!778 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2805 newMap!16)) _$5!128)))

(declare-fun bs!5320 () Bool)

(assert (= bs!5320 d!38897))

(assert (=> bs!5320 m!149437))

(assert (=> bs!5320 m!149437))

(assert (=> bs!5320 m!149865))

(assert (=> bs!5320 m!149451))

(assert (=> bs!5320 m!149867))

(assert (=> d!38659 d!38897))

(assert (=> d!38659 d!38791))

(declare-fun d!38899 () Bool)

(assert (=> d!38899 (= (isEmpty!399 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) (not ((_ is Some!173) (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(assert (=> d!38601 d!38899))

(declare-fun b!128681 () Bool)

(declare-fun e!83993 () SeekEntryResult!271)

(assert (=> b!128681 (= e!83993 (MissingVacant!271 (index!3242 lt!66195)))))

(declare-fun b!128682 () Bool)

(declare-fun e!83995 () SeekEntryResult!271)

(assert (=> b!128682 (= e!83995 (Found!271 (index!3242 lt!66195)))))

(declare-fun b!128683 () Bool)

(declare-fun e!83994 () SeekEntryResult!271)

(assert (=> b!128683 (= e!83994 Undefined!271)))

(declare-fun d!38901 () Bool)

(declare-fun lt!66684 () SeekEntryResult!271)

(assert (=> d!38901 (and (or ((_ is Undefined!271) lt!66684) (not ((_ is Found!271) lt!66684)) (and (bvsge (index!3241 lt!66684) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66684) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66684) ((_ is Found!271) lt!66684) (not ((_ is MissingVacant!271) lt!66684)) (not (= (index!3243 lt!66684) (index!3242 lt!66195))) (and (bvsge (index!3243 lt!66684) #b00000000000000000000000000000000) (bvslt (index!3243 lt!66684) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66684) (ite ((_ is Found!271) lt!66684) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66684)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (and ((_ is MissingVacant!271) lt!66684) (= (index!3243 lt!66684) (index!3242 lt!66195)) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66684)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!38901 (= lt!66684 e!83994)))

(declare-fun c!23630 () Bool)

(assert (=> d!38901 (= c!23630 (bvsge (x!15122 lt!66195) #b01111111111111111111111111111110))))

(declare-fun lt!66683 () (_ BitVec 64))

(assert (=> d!38901 (= lt!66683 (select (arr!2237 (_keys!4542 newMap!16)) (index!3242 lt!66195)))))

(assert (=> d!38901 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38901 (= (seekKeyOrZeroReturnVacant!0 (x!15122 lt!66195) (index!3242 lt!66195) (index!3242 lt!66195) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)) lt!66684)))

(declare-fun b!128684 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!128684 (= e!83993 (seekKeyOrZeroReturnVacant!0 (bvadd (x!15122 lt!66195) #b00000000000000000000000000000001) (nextIndex!0 (index!3242 lt!66195) (x!15122 lt!66195) (mask!7073 newMap!16)) (index!3242 lt!66195) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!128685 () Bool)

(assert (=> b!128685 (= e!83994 e!83995)))

(declare-fun c!23631 () Bool)

(assert (=> b!128685 (= c!23631 (= lt!66683 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128686 () Bool)

(declare-fun c!23632 () Bool)

(assert (=> b!128686 (= c!23632 (= lt!66683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128686 (= e!83995 e!83993)))

(assert (= (and d!38901 c!23630) b!128683))

(assert (= (and d!38901 (not c!23630)) b!128685))

(assert (= (and b!128685 c!23631) b!128682))

(assert (= (and b!128685 (not c!23631)) b!128686))

(assert (= (and b!128686 c!23632) b!128681))

(assert (= (and b!128686 (not c!23632)) b!128684))

(declare-fun m!150763 () Bool)

(assert (=> d!38901 m!150763))

(declare-fun m!150765 () Bool)

(assert (=> d!38901 m!150765))

(assert (=> d!38901 m!149625))

(assert (=> d!38901 m!149599))

(declare-fun m!150767 () Bool)

(assert (=> b!128684 m!150767))

(assert (=> b!128684 m!150767))

(assert (=> b!128684 m!149355))

(declare-fun m!150769 () Bool)

(assert (=> b!128684 m!150769))

(assert (=> b!127975 d!38901))

(assert (=> b!128161 d!38735))

(declare-fun d!38903 () Bool)

(declare-fun lt!66685 () Bool)

(assert (=> d!38903 (= lt!66685 (select (content!127 (toList!861 lt!66271)) (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun e!83997 () Bool)

(assert (=> d!38903 (= lt!66685 e!83997)))

(declare-fun res!62126 () Bool)

(assert (=> d!38903 (=> (not res!62126) (not e!83997))))

(assert (=> d!38903 (= res!62126 ((_ is Cons!1700) (toList!861 lt!66271)))))

(assert (=> d!38903 (= (contains!886 (toList!861 lt!66271) (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66685)))

(declare-fun b!128687 () Bool)

(declare-fun e!83996 () Bool)

(assert (=> b!128687 (= e!83997 e!83996)))

(declare-fun res!62125 () Bool)

(assert (=> b!128687 (=> res!62125 e!83996)))

(assert (=> b!128687 (= res!62125 (= (h!2303 (toList!861 lt!66271)) (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128688 () Bool)

(assert (=> b!128688 (= e!83996 (contains!886 (t!6083 (toList!861 lt!66271)) (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38903 res!62126) b!128687))

(assert (= (and b!128687 (not res!62125)) b!128688))

(declare-fun m!150771 () Bool)

(assert (=> d!38903 m!150771))

(declare-fun m!150773 () Bool)

(assert (=> d!38903 m!150773))

(declare-fun m!150775 () Bool)

(assert (=> b!128688 m!150775))

(assert (=> b!128090 d!38903))

(declare-fun d!38905 () Bool)

(declare-fun e!83998 () Bool)

(assert (=> d!38905 e!83998))

(declare-fun res!62128 () Bool)

(assert (=> d!38905 (=> (not res!62128) (not e!83998))))

(declare-fun lt!66686 () ListLongMap!1691)

(assert (=> d!38905 (= res!62128 (contains!884 lt!66686 (_1!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(declare-fun lt!66689 () List!1704)

(assert (=> d!38905 (= lt!66686 (ListLongMap!1692 lt!66689))))

(declare-fun lt!66688 () Unit!3981)

(declare-fun lt!66687 () Unit!3981)

(assert (=> d!38905 (= lt!66688 lt!66687)))

(assert (=> d!38905 (= (getValueByKey!168 lt!66689 (_1!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(assert (=> d!38905 (= lt!66687 (lemmaContainsTupThenGetReturnValue!83 lt!66689 (_1!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (_2!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(assert (=> d!38905 (= lt!66689 (insertStrictlySorted!86 (toList!861 (ite c!23423 call!13837 (ite c!23427 call!13839 call!13833))) (_1!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (_2!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(assert (=> d!38905 (= (+!171 (ite c!23423 call!13837 (ite c!23427 call!13839 call!13833)) (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) lt!66686)))

(declare-fun b!128689 () Bool)

(declare-fun res!62127 () Bool)

(assert (=> b!128689 (=> (not res!62127) (not e!83998))))

(assert (=> b!128689 (= res!62127 (= (getValueByKey!168 (toList!861 lt!66686) (_1!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))))

(declare-fun b!128690 () Bool)

(assert (=> b!128690 (= e!83998 (contains!886 (toList!861 lt!66686) (ite (or c!23423 c!23427) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (= (and d!38905 res!62128) b!128689))

(assert (= (and b!128689 res!62127) b!128690))

(declare-fun m!150777 () Bool)

(assert (=> d!38905 m!150777))

(declare-fun m!150779 () Bool)

(assert (=> d!38905 m!150779))

(declare-fun m!150781 () Bool)

(assert (=> d!38905 m!150781))

(declare-fun m!150783 () Bool)

(assert (=> d!38905 m!150783))

(declare-fun m!150785 () Bool)

(assert (=> b!128689 m!150785))

(declare-fun m!150787 () Bool)

(assert (=> b!128690 m!150787))

(assert (=> bm!13831 d!38905))

(declare-fun d!38907 () Bool)

(declare-fun res!62129 () Bool)

(declare-fun e!83999 () Bool)

(assert (=> d!38907 (=> res!62129 e!83999)))

(assert (=> d!38907 (= res!62129 (and ((_ is Cons!1700) (toList!861 e!83487)) (= (_1!1309 (h!2303 (toList!861 e!83487))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!38907 (= (containsKey!172 (toList!861 e!83487) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!83999)))

(declare-fun b!128691 () Bool)

(declare-fun e!84000 () Bool)

(assert (=> b!128691 (= e!83999 e!84000)))

(declare-fun res!62130 () Bool)

(assert (=> b!128691 (=> (not res!62130) (not e!84000))))

(assert (=> b!128691 (= res!62130 (and (or (not ((_ is Cons!1700) (toList!861 e!83487))) (bvsle (_1!1309 (h!2303 (toList!861 e!83487))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) ((_ is Cons!1700) (toList!861 e!83487)) (bvslt (_1!1309 (h!2303 (toList!861 e!83487))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun b!128692 () Bool)

(assert (=> b!128692 (= e!84000 (containsKey!172 (t!6083 (toList!861 e!83487)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!38907 (not res!62129)) b!128691))

(assert (= (and b!128691 res!62130) b!128692))

(assert (=> b!128692 m!149355))

(declare-fun m!150789 () Bool)

(assert (=> b!128692 m!150789))

(assert (=> d!38647 d!38907))

(declare-fun b!128693 () Bool)

(declare-fun e!84001 () Unit!3981)

(declare-fun Unit!4013 () Unit!3981)

(assert (=> b!128693 (= e!84001 Unit!4013)))

(declare-fun b!128694 () Bool)

(declare-fun e!84008 () Bool)

(declare-fun lt!66708 () ListLongMap!1691)

(assert (=> b!128694 (= e!84008 (= (apply!112 lt!66708 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 (_2!1310 lt!66078))))))

(declare-fun b!128695 () Bool)

(declare-fun res!62131 () Bool)

(declare-fun e!84004 () Bool)

(assert (=> b!128695 (=> (not res!62131) (not e!84004))))

(declare-fun e!84006 () Bool)

(assert (=> b!128695 (= res!62131 e!84006)))

(declare-fun c!23635 () Bool)

(assert (=> b!128695 (= c!23635 (not (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128696 () Bool)

(declare-fun e!84003 () Bool)

(declare-fun e!84005 () Bool)

(assert (=> b!128696 (= e!84003 e!84005)))

(declare-fun res!62135 () Bool)

(declare-fun call!13941 () Bool)

(assert (=> b!128696 (= res!62135 call!13941)))

(assert (=> b!128696 (=> (not res!62135) (not e!84005))))

(declare-fun b!128697 () Bool)

(declare-fun e!84007 () Bool)

(assert (=> b!128697 (= e!84007 (= (apply!112 lt!66708 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (_values!2788 (_2!1310 lt!66078))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 (_2!1310 lt!66078)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (_values!2788 (_2!1310 lt!66078)))))))

(assert (=> b!128697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(declare-fun bm!13936 () Bool)

(declare-fun call!13945 () ListLongMap!1691)

(declare-fun call!13943 () ListLongMap!1691)

(assert (=> bm!13936 (= call!13945 call!13943)))

(declare-fun b!128698 () Bool)

(declare-fun e!84011 () ListLongMap!1691)

(declare-fun call!13939 () ListLongMap!1691)

(assert (=> b!128698 (= e!84011 call!13939)))

(declare-fun b!128699 () Bool)

(assert (=> b!128699 (= e!84003 (not call!13941))))

(declare-fun call!13942 () ListLongMap!1691)

(declare-fun c!23637 () Bool)

(declare-fun bm!13937 () Bool)

(declare-fun c!23633 () Bool)

(assert (=> bm!13937 (= call!13942 (+!171 (ite c!23633 call!13943 (ite c!23637 call!13945 call!13939)) (ite (or c!23633 c!23637) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (_2!1310 lt!66078))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (_2!1310 lt!66078))))))))

(declare-fun b!128700 () Bool)

(declare-fun call!13944 () Bool)

(assert (=> b!128700 (= e!84006 (not call!13944))))

(declare-fun b!128701 () Bool)

(declare-fun e!84009 () ListLongMap!1691)

(declare-fun call!13940 () ListLongMap!1691)

(assert (=> b!128701 (= e!84009 call!13940)))

(declare-fun b!128702 () Bool)

(declare-fun e!84013 () Bool)

(assert (=> b!128702 (= e!84013 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(declare-fun b!128704 () Bool)

(declare-fun c!23638 () Bool)

(assert (=> b!128704 (= c!23638 (and (not (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128704 (= e!84009 e!84011)))

(declare-fun bm!13938 () Bool)

(assert (=> bm!13938 (= call!13941 (contains!884 lt!66708 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128705 () Bool)

(declare-fun e!84012 () Bool)

(assert (=> b!128705 (= e!84012 e!84007)))

(declare-fun res!62136 () Bool)

(assert (=> b!128705 (=> (not res!62136) (not e!84007))))

(assert (=> b!128705 (= res!62136 (contains!884 lt!66708 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(assert (=> b!128705 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(declare-fun bm!13939 () Bool)

(assert (=> bm!13939 (= call!13940 call!13942)))

(declare-fun bm!13940 () Bool)

(assert (=> bm!13940 (= call!13943 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))))))

(declare-fun b!128706 () Bool)

(declare-fun lt!66694 () Unit!3981)

(assert (=> b!128706 (= e!84001 lt!66694)))

(declare-fun lt!66711 () ListLongMap!1691)

(assert (=> b!128706 (= lt!66711 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))))))

(declare-fun lt!66705 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66700 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66700 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000))))

(declare-fun lt!66691 () Unit!3981)

(assert (=> b!128706 (= lt!66691 (addStillContains!88 lt!66711 lt!66705 (zeroValue!2666 (_2!1310 lt!66078)) lt!66700))))

(assert (=> b!128706 (contains!884 (+!171 lt!66711 (tuple2!2597 lt!66705 (zeroValue!2666 (_2!1310 lt!66078)))) lt!66700)))

(declare-fun lt!66697 () Unit!3981)

(assert (=> b!128706 (= lt!66697 lt!66691)))

(declare-fun lt!66709 () ListLongMap!1691)

(assert (=> b!128706 (= lt!66709 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))))))

(declare-fun lt!66695 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66695 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66690 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66690 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000))))

(declare-fun lt!66693 () Unit!3981)

(assert (=> b!128706 (= lt!66693 (addApplyDifferent!88 lt!66709 lt!66695 (minValue!2666 (_2!1310 lt!66078)) lt!66690))))

(assert (=> b!128706 (= (apply!112 (+!171 lt!66709 (tuple2!2597 lt!66695 (minValue!2666 (_2!1310 lt!66078)))) lt!66690) (apply!112 lt!66709 lt!66690))))

(declare-fun lt!66702 () Unit!3981)

(assert (=> b!128706 (= lt!66702 lt!66693)))

(declare-fun lt!66692 () ListLongMap!1691)

(assert (=> b!128706 (= lt!66692 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))))))

(declare-fun lt!66701 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66707 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66707 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000))))

(declare-fun lt!66699 () Unit!3981)

(assert (=> b!128706 (= lt!66699 (addApplyDifferent!88 lt!66692 lt!66701 (zeroValue!2666 (_2!1310 lt!66078)) lt!66707))))

(assert (=> b!128706 (= (apply!112 (+!171 lt!66692 (tuple2!2597 lt!66701 (zeroValue!2666 (_2!1310 lt!66078)))) lt!66707) (apply!112 lt!66692 lt!66707))))

(declare-fun lt!66710 () Unit!3981)

(assert (=> b!128706 (= lt!66710 lt!66699)))

(declare-fun lt!66704 () ListLongMap!1691)

(assert (=> b!128706 (= lt!66704 (getCurrentListMapNoExtraKeys!137 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))))))

(declare-fun lt!66703 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66703 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66698 () (_ BitVec 64))

(assert (=> b!128706 (= lt!66698 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000))))

(assert (=> b!128706 (= lt!66694 (addApplyDifferent!88 lt!66704 lt!66703 (minValue!2666 (_2!1310 lt!66078)) lt!66698))))

(assert (=> b!128706 (= (apply!112 (+!171 lt!66704 (tuple2!2597 lt!66703 (minValue!2666 (_2!1310 lt!66078)))) lt!66698) (apply!112 lt!66704 lt!66698))))

(declare-fun b!128707 () Bool)

(assert (=> b!128707 (= e!84005 (= (apply!112 lt!66708 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 (_2!1310 lt!66078))))))

(declare-fun b!128708 () Bool)

(declare-fun e!84010 () ListLongMap!1691)

(assert (=> b!128708 (= e!84010 (+!171 call!13942 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (_2!1310 lt!66078)))))))

(declare-fun b!128709 () Bool)

(assert (=> b!128709 (= e!84004 e!84003)))

(declare-fun c!23636 () Bool)

(assert (=> b!128709 (= c!23636 (not (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128710 () Bool)

(declare-fun res!62137 () Bool)

(assert (=> b!128710 (=> (not res!62137) (not e!84004))))

(assert (=> b!128710 (= res!62137 e!84012)))

(declare-fun res!62133 () Bool)

(assert (=> b!128710 (=> res!62133 e!84012)))

(declare-fun e!84002 () Bool)

(assert (=> b!128710 (= res!62133 (not e!84002))))

(declare-fun res!62138 () Bool)

(assert (=> b!128710 (=> (not res!62138) (not e!84002))))

(assert (=> b!128710 (= res!62138 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(declare-fun b!128711 () Bool)

(assert (=> b!128711 (= e!84010 e!84009)))

(assert (=> b!128711 (= c!23637 (and (not (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13941 () Bool)

(assert (=> bm!13941 (= call!13939 call!13945)))

(declare-fun b!128712 () Bool)

(assert (=> b!128712 (= e!84011 call!13940)))

(declare-fun b!128703 () Bool)

(assert (=> b!128703 (= e!84002 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(declare-fun d!38909 () Bool)

(assert (=> d!38909 e!84004))

(declare-fun res!62134 () Bool)

(assert (=> d!38909 (=> (not res!62134) (not e!84004))))

(assert (=> d!38909 (= res!62134 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))))

(declare-fun lt!66696 () ListLongMap!1691)

(assert (=> d!38909 (= lt!66708 lt!66696)))

(declare-fun lt!66706 () Unit!3981)

(assert (=> d!38909 (= lt!66706 e!84001)))

(declare-fun c!23634 () Bool)

(assert (=> d!38909 (= c!23634 e!84013)))

(declare-fun res!62132 () Bool)

(assert (=> d!38909 (=> (not res!62132) (not e!84013))))

(assert (=> d!38909 (= res!62132 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(assert (=> d!38909 (= lt!66696 e!84010)))

(assert (=> d!38909 (= c!23633 (and (not (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38909 (validMask!0 (mask!7073 (_2!1310 lt!66078)))))

(assert (=> d!38909 (= (getCurrentListMap!539 (_keys!4542 (_2!1310 lt!66078)) (_values!2788 (_2!1310 lt!66078)) (mask!7073 (_2!1310 lt!66078)) (extraKeys!2582 (_2!1310 lt!66078)) (zeroValue!2666 (_2!1310 lt!66078)) (minValue!2666 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66078))) lt!66708)))

(declare-fun b!128713 () Bool)

(assert (=> b!128713 (= e!84006 e!84008)))

(declare-fun res!62139 () Bool)

(assert (=> b!128713 (= res!62139 call!13944)))

(assert (=> b!128713 (=> (not res!62139) (not e!84008))))

(declare-fun bm!13942 () Bool)

(assert (=> bm!13942 (= call!13944 (contains!884 lt!66708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38909 c!23633) b!128708))

(assert (= (and d!38909 (not c!23633)) b!128711))

(assert (= (and b!128711 c!23637) b!128701))

(assert (= (and b!128711 (not c!23637)) b!128704))

(assert (= (and b!128704 c!23638) b!128712))

(assert (= (and b!128704 (not c!23638)) b!128698))

(assert (= (or b!128712 b!128698) bm!13941))

(assert (= (or b!128701 bm!13941) bm!13936))

(assert (= (or b!128701 b!128712) bm!13939))

(assert (= (or b!128708 bm!13936) bm!13940))

(assert (= (or b!128708 bm!13939) bm!13937))

(assert (= (and d!38909 res!62132) b!128702))

(assert (= (and d!38909 c!23634) b!128706))

(assert (= (and d!38909 (not c!23634)) b!128693))

(assert (= (and d!38909 res!62134) b!128710))

(assert (= (and b!128710 res!62138) b!128703))

(assert (= (and b!128710 (not res!62133)) b!128705))

(assert (= (and b!128705 res!62136) b!128697))

(assert (= (and b!128710 res!62137) b!128695))

(assert (= (and b!128695 c!23635) b!128713))

(assert (= (and b!128695 (not c!23635)) b!128700))

(assert (= (and b!128713 res!62139) b!128694))

(assert (= (or b!128713 b!128700) bm!13942))

(assert (= (and b!128695 res!62131) b!128709))

(assert (= (and b!128709 c!23636) b!128696))

(assert (= (and b!128709 (not c!23636)) b!128699))

(assert (= (and b!128696 res!62135) b!128707))

(assert (= (or b!128696 b!128699) bm!13938))

(declare-fun b_lambda!5695 () Bool)

(assert (=> (not b_lambda!5695) (not b!128697)))

(declare-fun tb!2353 () Bool)

(declare-fun t!6095 () Bool)

(assert (=> (and b!127647 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 (_2!1310 lt!66078))) t!6095) tb!2353))

(declare-fun result!3897 () Bool)

(assert (=> tb!2353 (= result!3897 tp_is_empty!2853)))

(assert (=> b!128697 t!6095))

(declare-fun b_and!7963 () Bool)

(assert (= b_and!7959 (and (=> t!6095 result!3897) b_and!7963)))

(declare-fun t!6097 () Bool)

(declare-fun tb!2355 () Bool)

(assert (=> (and b!127644 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (_2!1310 lt!66078))) t!6097) tb!2355))

(declare-fun result!3899 () Bool)

(assert (= result!3899 result!3897))

(assert (=> b!128697 t!6097))

(declare-fun b_and!7965 () Bool)

(assert (= b_and!7961 (and (=> t!6097 result!3899) b_and!7965)))

(declare-fun m!150791 () Bool)

(assert (=> bm!13942 m!150791))

(assert (=> b!128702 m!150475))

(assert (=> b!128702 m!150475))

(assert (=> b!128702 m!150485))

(declare-fun m!150793 () Bool)

(assert (=> b!128708 m!150793))

(declare-fun m!150795 () Bool)

(assert (=> b!128706 m!150795))

(declare-fun m!150797 () Bool)

(assert (=> b!128706 m!150797))

(declare-fun m!150799 () Bool)

(assert (=> b!128706 m!150799))

(assert (=> b!128706 m!150475))

(declare-fun m!150801 () Bool)

(assert (=> b!128706 m!150801))

(declare-fun m!150803 () Bool)

(assert (=> b!128706 m!150803))

(declare-fun m!150805 () Bool)

(assert (=> b!128706 m!150805))

(declare-fun m!150807 () Bool)

(assert (=> b!128706 m!150807))

(assert (=> b!128706 m!150805))

(declare-fun m!150809 () Bool)

(assert (=> b!128706 m!150809))

(declare-fun m!150811 () Bool)

(assert (=> b!128706 m!150811))

(assert (=> b!128706 m!150809))

(declare-fun m!150813 () Bool)

(assert (=> b!128706 m!150813))

(declare-fun m!150815 () Bool)

(assert (=> b!128706 m!150815))

(declare-fun m!150817 () Bool)

(assert (=> b!128706 m!150817))

(declare-fun m!150819 () Bool)

(assert (=> b!128706 m!150819))

(assert (=> b!128706 m!150803))

(declare-fun m!150821 () Bool)

(assert (=> b!128706 m!150821))

(declare-fun m!150823 () Bool)

(assert (=> b!128706 m!150823))

(declare-fun m!150825 () Bool)

(assert (=> b!128706 m!150825))

(assert (=> b!128706 m!150815))

(assert (=> b!128705 m!150475))

(assert (=> b!128705 m!150475))

(declare-fun m!150827 () Bool)

(assert (=> b!128705 m!150827))

(declare-fun m!150829 () Bool)

(assert (=> bm!13938 m!150829))

(declare-fun m!150831 () Bool)

(assert (=> bm!13937 m!150831))

(declare-fun m!150833 () Bool)

(assert (=> b!128697 m!150833))

(declare-fun m!150835 () Bool)

(assert (=> b!128697 m!150835))

(assert (=> b!128697 m!150475))

(assert (=> b!128697 m!150475))

(declare-fun m!150837 () Bool)

(assert (=> b!128697 m!150837))

(assert (=> b!128697 m!150833))

(assert (=> b!128697 m!150835))

(declare-fun m!150839 () Bool)

(assert (=> b!128697 m!150839))

(declare-fun m!150841 () Bool)

(assert (=> d!38909 m!150841))

(assert (=> b!128703 m!150475))

(assert (=> b!128703 m!150475))

(assert (=> b!128703 m!150485))

(assert (=> bm!13940 m!150795))

(declare-fun m!150843 () Bool)

(assert (=> b!128694 m!150843))

(declare-fun m!150845 () Bool)

(assert (=> b!128707 m!150845))

(assert (=> d!38651 d!38909))

(declare-fun d!38911 () Bool)

(declare-fun e!84015 () Bool)

(assert (=> d!38911 e!84015))

(declare-fun res!62140 () Bool)

(assert (=> d!38911 (=> res!62140 e!84015)))

(declare-fun lt!66712 () Bool)

(assert (=> d!38911 (= res!62140 (not lt!66712))))

(declare-fun lt!66715 () Bool)

(assert (=> d!38911 (= lt!66712 lt!66715)))

(declare-fun lt!66714 () Unit!3981)

(declare-fun e!84014 () Unit!3981)

(assert (=> d!38911 (= lt!66714 e!84014)))

(declare-fun c!23639 () Bool)

(assert (=> d!38911 (= c!23639 lt!66715)))

(assert (=> d!38911 (= lt!66715 (containsKey!172 (toList!861 lt!66219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38911 (= (contains!884 lt!66219 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66712)))

(declare-fun b!128714 () Bool)

(declare-fun lt!66713 () Unit!3981)

(assert (=> b!128714 (= e!84014 lt!66713)))

(assert (=> b!128714 (= lt!66713 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128714 (isDefined!121 (getValueByKey!168 (toList!861 lt!66219) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128715 () Bool)

(declare-fun Unit!4014 () Unit!3981)

(assert (=> b!128715 (= e!84014 Unit!4014)))

(declare-fun b!128716 () Bool)

(assert (=> b!128716 (= e!84015 (isDefined!121 (getValueByKey!168 (toList!861 lt!66219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38911 c!23639) b!128714))

(assert (= (and d!38911 (not c!23639)) b!128715))

(assert (= (and d!38911 (not res!62140)) b!128716))

(declare-fun m!150847 () Bool)

(assert (=> d!38911 m!150847))

(declare-fun m!150849 () Bool)

(assert (=> b!128714 m!150849))

(declare-fun m!150851 () Bool)

(assert (=> b!128714 m!150851))

(assert (=> b!128714 m!150851))

(declare-fun m!150853 () Bool)

(assert (=> b!128714 m!150853))

(assert (=> b!128716 m!150851))

(assert (=> b!128716 m!150851))

(assert (=> b!128716 m!150853))

(assert (=> b!128051 d!38911))

(assert (=> d!38613 d!38615))

(declare-fun d!38913 () Bool)

(assert (=> d!38913 (= (apply!112 (+!171 lt!66153 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66147) (apply!112 lt!66153 lt!66147))))

(assert (=> d!38913 true))

(declare-fun _$34!955 () Unit!3981)

(assert (=> d!38913 (= (choose!775 lt!66153 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66147) _$34!955)))

(declare-fun bs!5321 () Bool)

(assert (= bs!5321 d!38913))

(assert (=> bs!5321 m!149499))

(assert (=> bs!5321 m!149499))

(assert (=> bs!5321 m!149517))

(assert (=> bs!5321 m!149493))

(assert (=> d!38613 d!38913))

(assert (=> d!38613 d!38617))

(declare-fun d!38915 () Bool)

(declare-fun e!84017 () Bool)

(assert (=> d!38915 e!84017))

(declare-fun res!62141 () Bool)

(assert (=> d!38915 (=> res!62141 e!84017)))

(declare-fun lt!66716 () Bool)

(assert (=> d!38915 (= res!62141 (not lt!66716))))

(declare-fun lt!66719 () Bool)

(assert (=> d!38915 (= lt!66716 lt!66719)))

(declare-fun lt!66718 () Unit!3981)

(declare-fun e!84016 () Unit!3981)

(assert (=> d!38915 (= lt!66718 e!84016)))

(declare-fun c!23640 () Bool)

(assert (=> d!38915 (= c!23640 lt!66719)))

(assert (=> d!38915 (= lt!66719 (containsKey!172 (toList!861 lt!66153) lt!66147))))

(assert (=> d!38915 (= (contains!884 lt!66153 lt!66147) lt!66716)))

(declare-fun b!128718 () Bool)

(declare-fun lt!66717 () Unit!3981)

(assert (=> b!128718 (= e!84016 lt!66717)))

(assert (=> b!128718 (= lt!66717 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66153) lt!66147))))

(assert (=> b!128718 (isDefined!121 (getValueByKey!168 (toList!861 lt!66153) lt!66147))))

(declare-fun b!128719 () Bool)

(declare-fun Unit!4015 () Unit!3981)

(assert (=> b!128719 (= e!84016 Unit!4015)))

(declare-fun b!128720 () Bool)

(assert (=> b!128720 (= e!84017 (isDefined!121 (getValueByKey!168 (toList!861 lt!66153) lt!66147)))))

(assert (= (and d!38915 c!23640) b!128718))

(assert (= (and d!38915 (not c!23640)) b!128719))

(assert (= (and d!38915 (not res!62141)) b!128720))

(declare-fun m!150855 () Bool)

(assert (=> d!38915 m!150855))

(declare-fun m!150857 () Bool)

(assert (=> b!128718 m!150857))

(assert (=> b!128718 m!149721))

(assert (=> b!128718 m!149721))

(declare-fun m!150859 () Bool)

(assert (=> b!128718 m!150859))

(assert (=> b!128720 m!149721))

(assert (=> b!128720 m!149721))

(assert (=> b!128720 m!150859))

(assert (=> d!38613 d!38915))

(assert (=> d!38613 d!38623))

(declare-fun d!38917 () Bool)

(declare-fun lt!66722 () Bool)

(declare-fun content!128 (List!1706) (InoxSet (_ BitVec 64)))

(assert (=> d!38917 (= lt!66722 (select (content!128 Nil!1703) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!84022 () Bool)

(assert (=> d!38917 (= lt!66722 e!84022)))

(declare-fun res!62147 () Bool)

(assert (=> d!38917 (=> (not res!62147) (not e!84022))))

(assert (=> d!38917 (= res!62147 ((_ is Cons!1702) Nil!1703))))

(assert (=> d!38917 (= (contains!887 Nil!1703 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) lt!66722)))

(declare-fun b!128725 () Bool)

(declare-fun e!84023 () Bool)

(assert (=> b!128725 (= e!84022 e!84023)))

(declare-fun res!62146 () Bool)

(assert (=> b!128725 (=> res!62146 e!84023)))

(assert (=> b!128725 (= res!62146 (= (h!2305 Nil!1703) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128726 () Bool)

(assert (=> b!128726 (= e!84023 (contains!887 (t!6089 Nil!1703) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38917 res!62147) b!128725))

(assert (= (and b!128725 (not res!62146)) b!128726))

(declare-fun m!150861 () Bool)

(assert (=> d!38917 m!150861))

(assert (=> d!38917 m!149547))

(declare-fun m!150863 () Bool)

(assert (=> d!38917 m!150863))

(assert (=> b!128726 m!149547))

(declare-fun m!150865 () Bool)

(assert (=> b!128726 m!150865))

(assert (=> b!128151 d!38917))

(assert (=> d!38619 d!38621))

(assert (=> d!38619 d!38629))

(declare-fun d!38919 () Bool)

(assert (=> d!38919 (contains!884 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66149)))

(assert (=> d!38919 true))

(declare-fun _$35!374 () Unit!3981)

(assert (=> d!38919 (= (choose!776 lt!66160 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66149) _$35!374)))

(declare-fun bs!5322 () Bool)

(assert (= bs!5322 d!38919))

(assert (=> bs!5322 m!149511))

(assert (=> bs!5322 m!149511))

(assert (=> bs!5322 m!149513))

(assert (=> d!38619 d!38919))

(declare-fun d!38921 () Bool)

(declare-fun e!84025 () Bool)

(assert (=> d!38921 e!84025))

(declare-fun res!62148 () Bool)

(assert (=> d!38921 (=> res!62148 e!84025)))

(declare-fun lt!66723 () Bool)

(assert (=> d!38921 (= res!62148 (not lt!66723))))

(declare-fun lt!66726 () Bool)

(assert (=> d!38921 (= lt!66723 lt!66726)))

(declare-fun lt!66725 () Unit!3981)

(declare-fun e!84024 () Unit!3981)

(assert (=> d!38921 (= lt!66725 e!84024)))

(declare-fun c!23641 () Bool)

(assert (=> d!38921 (= c!23641 lt!66726)))

(assert (=> d!38921 (= lt!66726 (containsKey!172 (toList!861 lt!66160) lt!66149))))

(assert (=> d!38921 (= (contains!884 lt!66160 lt!66149) lt!66723)))

(declare-fun b!128728 () Bool)

(declare-fun lt!66724 () Unit!3981)

(assert (=> b!128728 (= e!84024 lt!66724)))

(assert (=> b!128728 (= lt!66724 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66160) lt!66149))))

(assert (=> b!128728 (isDefined!121 (getValueByKey!168 (toList!861 lt!66160) lt!66149))))

(declare-fun b!128729 () Bool)

(declare-fun Unit!4016 () Unit!3981)

(assert (=> b!128729 (= e!84024 Unit!4016)))

(declare-fun b!128730 () Bool)

(assert (=> b!128730 (= e!84025 (isDefined!121 (getValueByKey!168 (toList!861 lt!66160) lt!66149)))))

(assert (= (and d!38921 c!23641) b!128728))

(assert (= (and d!38921 (not c!23641)) b!128729))

(assert (= (and d!38921 (not res!62148)) b!128730))

(declare-fun m!150867 () Bool)

(assert (=> d!38921 m!150867))

(declare-fun m!150869 () Bool)

(assert (=> b!128728 m!150869))

(declare-fun m!150871 () Bool)

(assert (=> b!128728 m!150871))

(assert (=> b!128728 m!150871))

(declare-fun m!150873 () Bool)

(assert (=> b!128728 m!150873))

(assert (=> b!128730 m!150871))

(assert (=> b!128730 m!150871))

(assert (=> b!128730 m!150873))

(assert (=> d!38619 d!38921))

(declare-fun d!38923 () Bool)

(assert (=> d!38923 (= (get!1459 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3150 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38705 d!38923))

(assert (=> d!38705 d!38849))

(declare-fun b!128731 () Bool)

(declare-fun e!84026 () (_ BitVec 32))

(declare-fun call!13946 () (_ BitVec 32))

(assert (=> b!128731 (= e!84026 call!13946)))

(declare-fun bm!13943 () Bool)

(assert (=> bm!13943 (= call!13946 (arrayCountValidKeys!0 (_keys!4542 (_2!1310 lt!66078)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(declare-fun b!128732 () Bool)

(declare-fun e!84027 () (_ BitVec 32))

(assert (=> b!128732 (= e!84027 e!84026)))

(declare-fun c!23642 () Bool)

(assert (=> b!128732 (= c!23642 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(declare-fun d!38925 () Bool)

(declare-fun lt!66727 () (_ BitVec 32))

(assert (=> d!38925 (and (bvsge lt!66727 #b00000000000000000000000000000000) (bvsle lt!66727 (bvsub (size!2502 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(assert (=> d!38925 (= lt!66727 e!84027)))

(declare-fun c!23643 () Bool)

(assert (=> d!38925 (= c!23643 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(assert (=> d!38925 (and (bvsle #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2502 (_keys!4542 (_2!1310 lt!66078))) (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(assert (=> d!38925 (= (arrayCountValidKeys!0 (_keys!4542 (_2!1310 lt!66078)) #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))) lt!66727)))

(declare-fun b!128733 () Bool)

(assert (=> b!128733 (= e!84026 (bvadd #b00000000000000000000000000000001 call!13946))))

(declare-fun b!128734 () Bool)

(assert (=> b!128734 (= e!84027 #b00000000000000000000000000000000)))

(assert (= (and d!38925 c!23643) b!128734))

(assert (= (and d!38925 (not c!23643)) b!128732))

(assert (= (and b!128732 c!23642) b!128733))

(assert (= (and b!128732 (not c!23642)) b!128731))

(assert (= (or b!128733 b!128731) bm!13943))

(declare-fun m!150875 () Bool)

(assert (=> bm!13943 m!150875))

(assert (=> b!128732 m!150475))

(assert (=> b!128732 m!150475))

(assert (=> b!128732 m!150485))

(assert (=> b!128238 d!38925))

(declare-fun d!38927 () Bool)

(declare-fun e!84029 () Bool)

(assert (=> d!38927 e!84029))

(declare-fun res!62149 () Bool)

(assert (=> d!38927 (=> res!62149 e!84029)))

(declare-fun lt!66728 () Bool)

(assert (=> d!38927 (= res!62149 (not lt!66728))))

(declare-fun lt!66731 () Bool)

(assert (=> d!38927 (= lt!66728 lt!66731)))

(declare-fun lt!66730 () Unit!3981)

(declare-fun e!84028 () Unit!3981)

(assert (=> d!38927 (= lt!66730 e!84028)))

(declare-fun c!23644 () Bool)

(assert (=> d!38927 (= c!23644 lt!66731)))

(assert (=> d!38927 (= lt!66731 (containsKey!172 (toList!861 lt!66336) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38927 (= (contains!884 lt!66336 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) lt!66728)))

(declare-fun b!128735 () Bool)

(declare-fun lt!66729 () Unit!3981)

(assert (=> b!128735 (= e!84028 lt!66729)))

(assert (=> b!128735 (= lt!66729 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66336) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128735 (isDefined!121 (getValueByKey!168 (toList!861 lt!66336) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128736 () Bool)

(declare-fun Unit!4017 () Unit!3981)

(assert (=> b!128736 (= e!84028 Unit!4017)))

(declare-fun b!128737 () Bool)

(assert (=> b!128737 (= e!84029 (isDefined!121 (getValueByKey!168 (toList!861 lt!66336) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38927 c!23644) b!128735))

(assert (= (and d!38927 (not c!23644)) b!128736))

(assert (= (and d!38927 (not res!62149)) b!128737))

(assert (=> d!38927 m!149547))

(declare-fun m!150877 () Bool)

(assert (=> d!38927 m!150877))

(assert (=> b!128735 m!149547))

(declare-fun m!150879 () Bool)

(assert (=> b!128735 m!150879))

(assert (=> b!128735 m!149547))

(declare-fun m!150881 () Bool)

(assert (=> b!128735 m!150881))

(assert (=> b!128735 m!150881))

(declare-fun m!150883 () Bool)

(assert (=> b!128735 m!150883))

(assert (=> b!128737 m!149547))

(assert (=> b!128737 m!150881))

(assert (=> b!128737 m!150881))

(assert (=> b!128737 m!150883))

(assert (=> b!128164 d!38927))

(declare-fun b!128738 () Bool)

(declare-fun e!84033 () Bool)

(declare-fun e!84031 () Bool)

(assert (=> b!128738 (= e!84033 e!84031)))

(declare-fun res!62152 () Bool)

(assert (=> b!128738 (=> (not res!62152) (not e!84031))))

(declare-fun e!84032 () Bool)

(assert (=> b!128738 (= res!62152 (not e!84032))))

(declare-fun res!62151 () Bool)

(assert (=> b!128738 (=> (not res!62151) (not e!84032))))

(assert (=> b!128738 (= res!62151 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13944 () Bool)

(declare-fun call!13947 () Bool)

(declare-fun c!23645 () Bool)

(assert (=> bm!13944 (= call!13947 (arrayNoDuplicates!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23645 (Cons!1702 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) Nil!1703) Nil!1703)))))

(declare-fun d!38929 () Bool)

(declare-fun res!62150 () Bool)

(assert (=> d!38929 (=> res!62150 e!84033)))

(assert (=> d!38929 (= res!62150 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!38929 (= (arrayNoDuplicates!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000 Nil!1703) e!84033)))

(declare-fun b!128739 () Bool)

(declare-fun e!84030 () Bool)

(assert (=> b!128739 (= e!84030 call!13947)))

(declare-fun b!128740 () Bool)

(assert (=> b!128740 (= e!84030 call!13947)))

(declare-fun b!128741 () Bool)

(assert (=> b!128741 (= e!84031 e!84030)))

(assert (=> b!128741 (= c!23645 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!128742 () Bool)

(assert (=> b!128742 (= e!84032 (contains!887 Nil!1703 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38929 (not res!62150)) b!128738))

(assert (= (and b!128738 res!62151) b!128742))

(assert (= (and b!128738 res!62152) b!128741))

(assert (= (and b!128741 c!23645) b!128739))

(assert (= (and b!128741 (not c!23645)) b!128740))

(assert (= (or b!128739 b!128740) bm!13944))

(declare-fun m!150885 () Bool)

(assert (=> b!128738 m!150885))

(assert (=> b!128738 m!150885))

(declare-fun m!150887 () Bool)

(assert (=> b!128738 m!150887))

(assert (=> bm!13944 m!150885))

(declare-fun m!150889 () Bool)

(assert (=> bm!13944 m!150889))

(assert (=> b!128741 m!150885))

(assert (=> b!128741 m!150885))

(assert (=> b!128741 m!150887))

(assert (=> b!128742 m!150885))

(assert (=> b!128742 m!150885))

(declare-fun m!150891 () Bool)

(assert (=> b!128742 m!150891))

(assert (=> b!128246 d!38929))

(declare-fun d!38931 () Bool)

(declare-fun e!84035 () Bool)

(assert (=> d!38931 e!84035))

(declare-fun res!62153 () Bool)

(assert (=> d!38931 (=> res!62153 e!84035)))

(declare-fun lt!66732 () Bool)

(assert (=> d!38931 (= res!62153 (not lt!66732))))

(declare-fun lt!66735 () Bool)

(assert (=> d!38931 (= lt!66732 lt!66735)))

(declare-fun lt!66734 () Unit!3981)

(declare-fun e!84034 () Unit!3981)

(assert (=> d!38931 (= lt!66734 e!84034)))

(declare-fun c!23646 () Bool)

(assert (=> d!38931 (= c!23646 lt!66735)))

(assert (=> d!38931 (= lt!66735 (containsKey!172 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (=> d!38931 (= (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))) lt!66732)))

(declare-fun b!128743 () Bool)

(declare-fun lt!66733 () Unit!3981)

(assert (=> b!128743 (= e!84034 lt!66733)))

(assert (=> b!128743 (= lt!66733 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (=> b!128743 (isDefined!121 (getValueByKey!168 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(declare-fun b!128744 () Bool)

(declare-fun Unit!4018 () Unit!3981)

(assert (=> b!128744 (= e!84034 Unit!4018)))

(declare-fun b!128745 () Bool)

(assert (=> b!128745 (= e!84035 (isDefined!121 (getValueByKey!168 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))))

(assert (= (and d!38931 c!23646) b!128743))

(assert (= (and d!38931 (not c!23646)) b!128744))

(assert (= (and d!38931 (not res!62153)) b!128745))

(assert (=> d!38931 m!149471))

(declare-fun m!150893 () Bool)

(assert (=> d!38931 m!150893))

(assert (=> b!128743 m!149471))

(declare-fun m!150895 () Bool)

(assert (=> b!128743 m!150895))

(assert (=> b!128743 m!149471))

(declare-fun m!150897 () Bool)

(assert (=> b!128743 m!150897))

(assert (=> b!128743 m!150897))

(declare-fun m!150899 () Bool)

(assert (=> b!128743 m!150899))

(assert (=> b!128745 m!149471))

(assert (=> b!128745 m!150897))

(assert (=> b!128745 m!150897))

(assert (=> b!128745 m!150899))

(assert (=> b!128121 d!38931))

(declare-fun b!128746 () Bool)

(declare-fun e!84036 () Unit!3981)

(declare-fun Unit!4019 () Unit!3981)

(assert (=> b!128746 (= e!84036 Unit!4019)))

(declare-fun b!128747 () Bool)

(declare-fun e!84043 () Bool)

(declare-fun lt!66754 () ListLongMap!1691)

(assert (=> b!128747 (= e!84043 (= (apply!112 lt!66754 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2666 newMap!16)))))

(declare-fun b!128748 () Bool)

(declare-fun res!62154 () Bool)

(declare-fun e!84039 () Bool)

(assert (=> b!128748 (=> (not res!62154) (not e!84039))))

(declare-fun e!84041 () Bool)

(assert (=> b!128748 (= res!62154 e!84041)))

(declare-fun c!23649 () Bool)

(assert (=> b!128748 (= c!23649 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128749 () Bool)

(declare-fun e!84038 () Bool)

(declare-fun e!84040 () Bool)

(assert (=> b!128749 (= e!84038 e!84040)))

(declare-fun res!62158 () Bool)

(declare-fun call!13950 () Bool)

(assert (=> b!128749 (= res!62158 call!13950)))

(assert (=> b!128749 (=> (not res!62158) (not e!84040))))

(declare-fun b!128750 () Bool)

(declare-fun e!84042 () Bool)

(assert (=> b!128750 (= e!84042 (= (apply!112 lt!66754 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 lt!66094) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 lt!66094)))))

(assert (=> b!128750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13945 () Bool)

(declare-fun call!13954 () ListLongMap!1691)

(declare-fun call!13952 () ListLongMap!1691)

(assert (=> bm!13945 (= call!13954 call!13952)))

(declare-fun b!128751 () Bool)

(declare-fun e!84046 () ListLongMap!1691)

(declare-fun call!13948 () ListLongMap!1691)

(assert (=> b!128751 (= e!84046 call!13948)))

(declare-fun b!128752 () Bool)

(assert (=> b!128752 (= e!84038 (not call!13950))))

(declare-fun c!23647 () Bool)

(declare-fun call!13951 () ListLongMap!1691)

(declare-fun bm!13946 () Bool)

(declare-fun c!23651 () Bool)

(assert (=> bm!13946 (= call!13951 (+!171 (ite c!23647 call!13952 (ite c!23651 call!13954 call!13948)) (ite (or c!23647 c!23651) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 newMap!16)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!128753 () Bool)

(declare-fun call!13953 () Bool)

(assert (=> b!128753 (= e!84041 (not call!13953))))

(declare-fun b!128754 () Bool)

(declare-fun e!84044 () ListLongMap!1691)

(declare-fun call!13949 () ListLongMap!1691)

(assert (=> b!128754 (= e!84044 call!13949)))

(declare-fun b!128755 () Bool)

(declare-fun e!84048 () Bool)

(assert (=> b!128755 (= e!84048 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128757 () Bool)

(declare-fun c!23652 () Bool)

(assert (=> b!128757 (= c!23652 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128757 (= e!84044 e!84046)))

(declare-fun bm!13947 () Bool)

(assert (=> bm!13947 (= call!13950 (contains!884 lt!66754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128758 () Bool)

(declare-fun e!84047 () Bool)

(assert (=> b!128758 (= e!84047 e!84042)))

(declare-fun res!62159 () Bool)

(assert (=> b!128758 (=> (not res!62159) (not e!84042))))

(assert (=> b!128758 (= res!62159 (contains!884 lt!66754 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13948 () Bool)

(assert (=> bm!13948 (= call!13949 call!13951)))

(declare-fun bm!13949 () Bool)

(assert (=> bm!13949 (= call!13952 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!128759 () Bool)

(declare-fun lt!66740 () Unit!3981)

(assert (=> b!128759 (= e!84036 lt!66740)))

(declare-fun lt!66757 () ListLongMap!1691)

(assert (=> b!128759 (= lt!66757 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66751 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66746 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66746 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66737 () Unit!3981)

(assert (=> b!128759 (= lt!66737 (addStillContains!88 lt!66757 lt!66751 (zeroValue!2666 newMap!16) lt!66746))))

(assert (=> b!128759 (contains!884 (+!171 lt!66757 (tuple2!2597 lt!66751 (zeroValue!2666 newMap!16))) lt!66746)))

(declare-fun lt!66743 () Unit!3981)

(assert (=> b!128759 (= lt!66743 lt!66737)))

(declare-fun lt!66755 () ListLongMap!1691)

(assert (=> b!128759 (= lt!66755 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66741 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66736 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66736 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66739 () Unit!3981)

(assert (=> b!128759 (= lt!66739 (addApplyDifferent!88 lt!66755 lt!66741 (minValue!2666 newMap!16) lt!66736))))

(assert (=> b!128759 (= (apply!112 (+!171 lt!66755 (tuple2!2597 lt!66741 (minValue!2666 newMap!16))) lt!66736) (apply!112 lt!66755 lt!66736))))

(declare-fun lt!66748 () Unit!3981)

(assert (=> b!128759 (= lt!66748 lt!66739)))

(declare-fun lt!66738 () ListLongMap!1691)

(assert (=> b!128759 (= lt!66738 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66747 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66747 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66753 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66753 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66745 () Unit!3981)

(assert (=> b!128759 (= lt!66745 (addApplyDifferent!88 lt!66738 lt!66747 (zeroValue!2666 newMap!16) lt!66753))))

(assert (=> b!128759 (= (apply!112 (+!171 lt!66738 (tuple2!2597 lt!66747 (zeroValue!2666 newMap!16))) lt!66753) (apply!112 lt!66738 lt!66753))))

(declare-fun lt!66756 () Unit!3981)

(assert (=> b!128759 (= lt!66756 lt!66745)))

(declare-fun lt!66750 () ListLongMap!1691)

(assert (=> b!128759 (= lt!66750 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66749 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66749 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66744 () (_ BitVec 64))

(assert (=> b!128759 (= lt!66744 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128759 (= lt!66740 (addApplyDifferent!88 lt!66750 lt!66749 (minValue!2666 newMap!16) lt!66744))))

(assert (=> b!128759 (= (apply!112 (+!171 lt!66750 (tuple2!2597 lt!66749 (minValue!2666 newMap!16))) lt!66744) (apply!112 lt!66750 lt!66744))))

(declare-fun b!128760 () Bool)

(assert (=> b!128760 (= e!84040 (= (apply!112 lt!66754 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!128761 () Bool)

(declare-fun e!84045 () ListLongMap!1691)

(assert (=> b!128761 (= e!84045 (+!171 call!13951 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!128762 () Bool)

(assert (=> b!128762 (= e!84039 e!84038)))

(declare-fun c!23650 () Bool)

(assert (=> b!128762 (= c!23650 (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128763 () Bool)

(declare-fun res!62160 () Bool)

(assert (=> b!128763 (=> (not res!62160) (not e!84039))))

(assert (=> b!128763 (= res!62160 e!84047)))

(declare-fun res!62156 () Bool)

(assert (=> b!128763 (=> res!62156 e!84047)))

(declare-fun e!84037 () Bool)

(assert (=> b!128763 (= res!62156 (not e!84037))))

(declare-fun res!62161 () Bool)

(assert (=> b!128763 (=> (not res!62161) (not e!84037))))

(assert (=> b!128763 (= res!62161 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128764 () Bool)

(assert (=> b!128764 (= e!84045 e!84044)))

(assert (=> b!128764 (= c!23651 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13950 () Bool)

(assert (=> bm!13950 (= call!13948 call!13954)))

(declare-fun b!128765 () Bool)

(assert (=> b!128765 (= e!84046 call!13949)))

(declare-fun b!128756 () Bool)

(assert (=> b!128756 (= e!84037 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38933 () Bool)

(assert (=> d!38933 e!84039))

(declare-fun res!62157 () Bool)

(assert (=> d!38933 (=> (not res!62157) (not e!84039))))

(assert (=> d!38933 (= res!62157 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66742 () ListLongMap!1691)

(assert (=> d!38933 (= lt!66754 lt!66742)))

(declare-fun lt!66752 () Unit!3981)

(assert (=> d!38933 (= lt!66752 e!84036)))

(declare-fun c!23648 () Bool)

(assert (=> d!38933 (= c!23648 e!84048)))

(declare-fun res!62155 () Bool)

(assert (=> d!38933 (=> (not res!62155) (not e!84048))))

(assert (=> d!38933 (= res!62155 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38933 (= lt!66742 e!84045)))

(assert (=> d!38933 (= c!23647 (and (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2582 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38933 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!38933 (= (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66754)))

(declare-fun b!128766 () Bool)

(assert (=> b!128766 (= e!84041 e!84043)))

(declare-fun res!62162 () Bool)

(assert (=> b!128766 (= res!62162 call!13953)))

(assert (=> b!128766 (=> (not res!62162) (not e!84043))))

(declare-fun bm!13951 () Bool)

(assert (=> bm!13951 (= call!13953 (contains!884 lt!66754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38933 c!23647) b!128761))

(assert (= (and d!38933 (not c!23647)) b!128764))

(assert (= (and b!128764 c!23651) b!128754))

(assert (= (and b!128764 (not c!23651)) b!128757))

(assert (= (and b!128757 c!23652) b!128765))

(assert (= (and b!128757 (not c!23652)) b!128751))

(assert (= (or b!128765 b!128751) bm!13950))

(assert (= (or b!128754 bm!13950) bm!13945))

(assert (= (or b!128754 b!128765) bm!13948))

(assert (= (or b!128761 bm!13945) bm!13949))

(assert (= (or b!128761 bm!13948) bm!13946))

(assert (= (and d!38933 res!62155) b!128755))

(assert (= (and d!38933 c!23648) b!128759))

(assert (= (and d!38933 (not c!23648)) b!128746))

(assert (= (and d!38933 res!62157) b!128763))

(assert (= (and b!128763 res!62161) b!128756))

(assert (= (and b!128763 (not res!62156)) b!128758))

(assert (= (and b!128758 res!62159) b!128750))

(assert (= (and b!128763 res!62160) b!128748))

(assert (= (and b!128748 c!23649) b!128766))

(assert (= (and b!128748 (not c!23649)) b!128753))

(assert (= (and b!128766 res!62162) b!128747))

(assert (= (or b!128766 b!128753) bm!13951))

(assert (= (and b!128748 res!62154) b!128762))

(assert (= (and b!128762 c!23650) b!128749))

(assert (= (and b!128762 (not c!23650)) b!128752))

(assert (= (and b!128749 res!62158) b!128760))

(assert (= (or b!128749 b!128752) bm!13947))

(declare-fun b_lambda!5697 () Bool)

(assert (=> (not b_lambda!5697) (not b!128750)))

(assert (=> b!128750 t!6091))

(declare-fun b_and!7967 () Bool)

(assert (= b_and!7963 (and (=> t!6091 result!3893) b_and!7967)))

(assert (=> b!128750 t!6093))

(declare-fun b_and!7969 () Bool)

(assert (= b_and!7965 (and (=> t!6093 result!3895) b_and!7969)))

(declare-fun m!150901 () Bool)

(assert (=> bm!13951 m!150901))

(assert (=> b!128755 m!149547))

(assert (=> b!128755 m!149547))

(assert (=> b!128755 m!149549))

(declare-fun m!150903 () Bool)

(assert (=> b!128761 m!150903))

(declare-fun m!150905 () Bool)

(assert (=> b!128759 m!150905))

(declare-fun m!150907 () Bool)

(assert (=> b!128759 m!150907))

(declare-fun m!150909 () Bool)

(assert (=> b!128759 m!150909))

(assert (=> b!128759 m!149547))

(declare-fun m!150911 () Bool)

(assert (=> b!128759 m!150911))

(declare-fun m!150913 () Bool)

(assert (=> b!128759 m!150913))

(declare-fun m!150915 () Bool)

(assert (=> b!128759 m!150915))

(declare-fun m!150917 () Bool)

(assert (=> b!128759 m!150917))

(assert (=> b!128759 m!150915))

(declare-fun m!150919 () Bool)

(assert (=> b!128759 m!150919))

(declare-fun m!150921 () Bool)

(assert (=> b!128759 m!150921))

(assert (=> b!128759 m!150919))

(declare-fun m!150923 () Bool)

(assert (=> b!128759 m!150923))

(declare-fun m!150925 () Bool)

(assert (=> b!128759 m!150925))

(declare-fun m!150927 () Bool)

(assert (=> b!128759 m!150927))

(declare-fun m!150929 () Bool)

(assert (=> b!128759 m!150929))

(assert (=> b!128759 m!150913))

(declare-fun m!150931 () Bool)

(assert (=> b!128759 m!150931))

(declare-fun m!150933 () Bool)

(assert (=> b!128759 m!150933))

(declare-fun m!150935 () Bool)

(assert (=> b!128759 m!150935))

(assert (=> b!128759 m!150925))

(assert (=> b!128758 m!149547))

(assert (=> b!128758 m!149547))

(declare-fun m!150937 () Bool)

(assert (=> b!128758 m!150937))

(declare-fun m!150939 () Bool)

(assert (=> bm!13947 m!150939))

(declare-fun m!150941 () Bool)

(assert (=> bm!13946 m!150941))

(declare-fun m!150943 () Bool)

(assert (=> b!128750 m!150943))

(assert (=> b!128750 m!149593))

(assert (=> b!128750 m!149547))

(assert (=> b!128750 m!149547))

(declare-fun m!150945 () Bool)

(assert (=> b!128750 m!150945))

(assert (=> b!128750 m!150943))

(assert (=> b!128750 m!149593))

(declare-fun m!150947 () Bool)

(assert (=> b!128750 m!150947))

(assert (=> d!38933 m!149599))

(assert (=> b!128756 m!149547))

(assert (=> b!128756 m!149547))

(assert (=> b!128756 m!149549))

(assert (=> bm!13949 m!150905))

(declare-fun m!150949 () Bool)

(assert (=> b!128747 m!150949))

(declare-fun m!150951 () Bool)

(assert (=> b!128760 m!150951))

(assert (=> b!128121 d!38933))

(declare-fun d!38935 () Bool)

(declare-fun e!84049 () Bool)

(assert (=> d!38935 e!84049))

(declare-fun res!62164 () Bool)

(assert (=> d!38935 (=> (not res!62164) (not e!84049))))

(declare-fun lt!66758 () ListLongMap!1691)

(assert (=> d!38935 (= res!62164 (contains!884 lt!66758 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun lt!66761 () List!1704)

(assert (=> d!38935 (= lt!66758 (ListLongMap!1692 lt!66761))))

(declare-fun lt!66760 () Unit!3981)

(declare-fun lt!66759 () Unit!3981)

(assert (=> d!38935 (= lt!66760 lt!66759)))

(assert (=> d!38935 (= (getValueByKey!168 lt!66761 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (=> d!38935 (= lt!66759 (lemmaContainsTupThenGetReturnValue!83 lt!66761 (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (=> d!38935 (= lt!66761 (insertStrictlySorted!86 (toList!861 call!13852) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(assert (=> d!38935 (= (+!171 call!13852 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))) lt!66758)))

(declare-fun b!128767 () Bool)

(declare-fun res!62163 () Bool)

(assert (=> b!128767 (=> (not res!62163) (not e!84049))))

(assert (=> b!128767 (= res!62163 (= (getValueByKey!168 (toList!861 lt!66758) (_1!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))))

(declare-fun b!128768 () Bool)

(assert (=> b!128768 (= e!84049 (contains!886 (toList!861 lt!66758) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(assert (= (and d!38935 res!62164) b!128767))

(assert (= (and b!128767 res!62163) b!128768))

(declare-fun m!150953 () Bool)

(assert (=> d!38935 m!150953))

(declare-fun m!150955 () Bool)

(assert (=> d!38935 m!150955))

(declare-fun m!150957 () Bool)

(assert (=> d!38935 m!150957))

(declare-fun m!150959 () Bool)

(assert (=> d!38935 m!150959))

(declare-fun m!150961 () Bool)

(assert (=> b!128767 m!150961))

(declare-fun m!150963 () Bool)

(assert (=> b!128768 m!150963))

(assert (=> b!128068 d!38935))

(declare-fun d!38937 () Bool)

(assert (=> d!38937 (= (map!1394 (_2!1310 lt!66421)) (getCurrentListMap!539 (_keys!4542 (_2!1310 lt!66421)) (_values!2788 (_2!1310 lt!66421)) (mask!7073 (_2!1310 lt!66421)) (extraKeys!2582 (_2!1310 lt!66421)) (zeroValue!2666 (_2!1310 lt!66421)) (minValue!2666 (_2!1310 lt!66421)) #b00000000000000000000000000000000 (defaultEntry!2805 (_2!1310 lt!66421))))))

(declare-fun bs!5323 () Bool)

(assert (= bs!5323 d!38937))

(declare-fun m!150965 () Bool)

(assert (=> bs!5323 m!150965))

(assert (=> b!128216 d!38937))

(declare-fun d!38939 () Bool)

(declare-fun e!84050 () Bool)

(assert (=> d!38939 e!84050))

(declare-fun res!62166 () Bool)

(assert (=> d!38939 (=> (not res!62166) (not e!84050))))

(declare-fun lt!66762 () ListLongMap!1691)

(assert (=> d!38939 (= res!62166 (contains!884 lt!66762 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66765 () List!1704)

(assert (=> d!38939 (= lt!66762 (ListLongMap!1692 lt!66765))))

(declare-fun lt!66764 () Unit!3981)

(declare-fun lt!66763 () Unit!3981)

(assert (=> d!38939 (= lt!66764 lt!66763)))

(assert (=> d!38939 (= (getValueByKey!168 lt!66765 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38939 (= lt!66763 (lemmaContainsTupThenGetReturnValue!83 lt!66765 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38939 (= lt!66765 (insertStrictlySorted!86 (toList!861 (map!1394 newMap!16)) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38939 (= (+!171 (map!1394 newMap!16) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66762)))

(declare-fun b!128769 () Bool)

(declare-fun res!62165 () Bool)

(assert (=> b!128769 (=> (not res!62165) (not e!84050))))

(assert (=> b!128769 (= res!62165 (= (getValueByKey!168 (toList!861 lt!66762) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128770 () Bool)

(assert (=> b!128770 (= e!84050 (contains!886 (toList!861 lt!66762) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38939 res!62166) b!128769))

(assert (= (and b!128769 res!62165) b!128770))

(declare-fun m!150967 () Bool)

(assert (=> d!38939 m!150967))

(declare-fun m!150969 () Bool)

(assert (=> d!38939 m!150969))

(declare-fun m!150971 () Bool)

(assert (=> d!38939 m!150971))

(declare-fun m!150973 () Bool)

(assert (=> d!38939 m!150973))

(declare-fun m!150975 () Bool)

(assert (=> b!128769 m!150975))

(declare-fun m!150977 () Bool)

(assert (=> b!128770 m!150977))

(assert (=> b!128216 d!38939))

(assert (=> b!128216 d!38589))

(declare-fun d!38941 () Bool)

(assert (=> d!38941 (= (apply!112 (+!171 lt!66158 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66139) (apply!112 lt!66158 lt!66139))))

(assert (=> d!38941 true))

(declare-fun _$34!956 () Unit!3981)

(assert (=> d!38941 (= (choose!775 lt!66158 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66139) _$34!956)))

(declare-fun bs!5324 () Bool)

(assert (= bs!5324 d!38941))

(assert (=> bs!5324 m!149501))

(assert (=> bs!5324 m!149501))

(assert (=> bs!5324 m!149503))

(assert (=> bs!5324 m!149497))

(assert (=> d!38641 d!38941))

(assert (=> d!38641 d!38627))

(assert (=> d!38641 d!38633))

(assert (=> d!38641 d!38635))

(declare-fun d!38943 () Bool)

(declare-fun e!84052 () Bool)

(assert (=> d!38943 e!84052))

(declare-fun res!62167 () Bool)

(assert (=> d!38943 (=> res!62167 e!84052)))

(declare-fun lt!66766 () Bool)

(assert (=> d!38943 (= res!62167 (not lt!66766))))

(declare-fun lt!66769 () Bool)

(assert (=> d!38943 (= lt!66766 lt!66769)))

(declare-fun lt!66768 () Unit!3981)

(declare-fun e!84051 () Unit!3981)

(assert (=> d!38943 (= lt!66768 e!84051)))

(declare-fun c!23653 () Bool)

(assert (=> d!38943 (= c!23653 lt!66769)))

(assert (=> d!38943 (= lt!66769 (containsKey!172 (toList!861 lt!66158) lt!66139))))

(assert (=> d!38943 (= (contains!884 lt!66158 lt!66139) lt!66766)))

(declare-fun b!128771 () Bool)

(declare-fun lt!66767 () Unit!3981)

(assert (=> b!128771 (= e!84051 lt!66767)))

(assert (=> b!128771 (= lt!66767 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66158) lt!66139))))

(assert (=> b!128771 (isDefined!121 (getValueByKey!168 (toList!861 lt!66158) lt!66139))))

(declare-fun b!128772 () Bool)

(declare-fun Unit!4020 () Unit!3981)

(assert (=> b!128772 (= e!84051 Unit!4020)))

(declare-fun b!128773 () Bool)

(assert (=> b!128773 (= e!84052 (isDefined!121 (getValueByKey!168 (toList!861 lt!66158) lt!66139)))))

(assert (= (and d!38943 c!23653) b!128771))

(assert (= (and d!38943 (not c!23653)) b!128772))

(assert (= (and d!38943 (not res!62167)) b!128773))

(declare-fun m!150979 () Bool)

(assert (=> d!38943 m!150979))

(declare-fun m!150981 () Bool)

(assert (=> b!128771 m!150981))

(assert (=> b!128771 m!149785))

(assert (=> b!128771 m!149785))

(declare-fun m!150983 () Bool)

(assert (=> b!128771 m!150983))

(assert (=> b!128773 m!149785))

(assert (=> b!128773 m!149785))

(assert (=> b!128773 m!150983))

(assert (=> d!38641 d!38943))

(declare-fun d!38945 () Bool)

(assert (=> d!38945 (= (isDefined!121 (getValueByKey!168 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) (not (isEmpty!399 (getValueByKey!168 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun bs!5325 () Bool)

(assert (= bs!5325 d!38945))

(assert (=> bs!5325 m!149817))

(declare-fun m!150985 () Bool)

(assert (=> bs!5325 m!150985))

(assert (=> b!128098 d!38945))

(declare-fun d!38947 () Bool)

(declare-fun c!23654 () Bool)

(assert (=> d!38947 (= c!23654 (and ((_ is Cons!1700) (toList!861 call!13790)) (= (_1!1309 (h!2303 (toList!861 call!13790))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun e!84053 () Option!174)

(assert (=> d!38947 (= (getValueByKey!168 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!84053)))

(declare-fun b!128775 () Bool)

(declare-fun e!84054 () Option!174)

(assert (=> b!128775 (= e!84053 e!84054)))

(declare-fun c!23655 () Bool)

(assert (=> b!128775 (= c!23655 (and ((_ is Cons!1700) (toList!861 call!13790)) (not (= (_1!1309 (h!2303 (toList!861 call!13790))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun b!128776 () Bool)

(assert (=> b!128776 (= e!84054 (getValueByKey!168 (t!6083 (toList!861 call!13790)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128777 () Bool)

(assert (=> b!128777 (= e!84054 None!172)))

(declare-fun b!128774 () Bool)

(assert (=> b!128774 (= e!84053 (Some!173 (_2!1309 (h!2303 (toList!861 call!13790)))))))

(assert (= (and d!38947 c!23654) b!128774))

(assert (= (and d!38947 (not c!23654)) b!128775))

(assert (= (and b!128775 c!23655) b!128776))

(assert (= (and b!128775 (not c!23655)) b!128777))

(assert (=> b!128776 m!149355))

(declare-fun m!150987 () Bool)

(assert (=> b!128776 m!150987))

(assert (=> b!128098 d!38947))

(assert (=> d!38673 d!38601))

(assert (=> d!38673 d!38603))

(declare-fun d!38949 () Bool)

(assert (=> d!38949 (isDefined!121 (getValueByKey!168 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!38949 true))

(declare-fun _$12!393 () Unit!3981)

(assert (=> d!38949 (= (choose!780 (toList!861 lt!65992) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) _$12!393)))

(declare-fun bs!5326 () Bool)

(assert (= bs!5326 d!38949))

(assert (=> bs!5326 m!149355))

(assert (=> bs!5326 m!149419))

(assert (=> bs!5326 m!149419))

(assert (=> bs!5326 m!149421))

(assert (=> d!38673 d!38949))

(declare-fun d!38951 () Bool)

(declare-fun res!62172 () Bool)

(declare-fun e!84059 () Bool)

(assert (=> d!38951 (=> res!62172 e!84059)))

(assert (=> d!38951 (= res!62172 (or ((_ is Nil!1701) (toList!861 lt!65992)) ((_ is Nil!1701) (t!6083 (toList!861 lt!65992)))))))

(assert (=> d!38951 (= (isStrictlySorted!318 (toList!861 lt!65992)) e!84059)))

(declare-fun b!128782 () Bool)

(declare-fun e!84060 () Bool)

(assert (=> b!128782 (= e!84059 e!84060)))

(declare-fun res!62173 () Bool)

(assert (=> b!128782 (=> (not res!62173) (not e!84060))))

(assert (=> b!128782 (= res!62173 (bvslt (_1!1309 (h!2303 (toList!861 lt!65992))) (_1!1309 (h!2303 (t!6083 (toList!861 lt!65992))))))))

(declare-fun b!128783 () Bool)

(assert (=> b!128783 (= e!84060 (isStrictlySorted!318 (t!6083 (toList!861 lt!65992))))))

(assert (= (and d!38951 (not res!62172)) b!128782))

(assert (= (and b!128782 res!62173) b!128783))

(declare-fun m!150989 () Bool)

(assert (=> b!128783 m!150989))

(assert (=> d!38673 d!38951))

(assert (=> d!38607 d!38599))

(declare-fun b!128800 () Bool)

(declare-fun e!84069 () Bool)

(declare-fun call!13959 () Bool)

(assert (=> b!128800 (= e!84069 (not call!13959))))

(declare-fun b!128801 () Bool)

(declare-fun e!84071 () Bool)

(assert (=> b!128801 (= e!84071 e!84069)))

(declare-fun res!62182 () Bool)

(declare-fun call!13960 () Bool)

(assert (=> b!128801 (= res!62182 call!13960)))

(assert (=> b!128801 (=> (not res!62182) (not e!84069))))

(declare-fun b!128802 () Bool)

(declare-fun e!84072 () Bool)

(declare-fun lt!66772 () SeekEntryResult!271)

(assert (=> b!128802 (= e!84072 ((_ is Undefined!271) lt!66772))))

(declare-fun b!128803 () Bool)

(declare-fun res!62183 () Bool)

(declare-fun e!84070 () Bool)

(assert (=> b!128803 (=> (not res!62183) (not e!84070))))

(assert (=> b!128803 (= res!62183 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66772)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13956 () Bool)

(assert (=> bm!13956 (= call!13959 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!38953 () Bool)

(assert (=> d!38953 e!84071))

(declare-fun c!23660 () Bool)

(assert (=> d!38953 (= c!23660 ((_ is MissingZero!271) lt!66772))))

(assert (=> d!38953 (= lt!66772 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(assert (=> d!38953 true))

(declare-fun _$34!959 () Unit!3981)

(assert (=> d!38953 (= (choose!774 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)) _$34!959)))

(declare-fun b!128804 () Bool)

(assert (=> b!128804 (= e!84071 e!84072)))

(declare-fun c!23661 () Bool)

(assert (=> b!128804 (= c!23661 ((_ is MissingVacant!271) lt!66772))))

(declare-fun b!128805 () Bool)

(declare-fun res!62185 () Bool)

(assert (=> b!128805 (=> (not res!62185) (not e!84070))))

(assert (=> b!128805 (= res!62185 call!13960)))

(assert (=> b!128805 (= e!84072 e!84070)))

(declare-fun bm!13957 () Bool)

(assert (=> bm!13957 (= call!13960 (inRange!0 (ite c!23660 (index!3240 lt!66772) (index!3243 lt!66772)) (mask!7073 newMap!16)))))

(declare-fun b!128806 () Bool)

(assert (=> b!128806 (= e!84070 (not call!13959))))

(declare-fun b!128807 () Bool)

(declare-fun res!62184 () Bool)

(assert (=> b!128807 (= res!62184 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66772)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128807 (=> (not res!62184) (not e!84069))))

(assert (= (and d!38953 c!23660) b!128801))

(assert (= (and d!38953 (not c!23660)) b!128804))

(assert (= (and b!128801 res!62182) b!128807))

(assert (= (and b!128807 res!62184) b!128800))

(assert (= (and b!128804 c!23661) b!128805))

(assert (= (and b!128804 (not c!23661)) b!128802))

(assert (= (and b!128805 res!62185) b!128803))

(assert (= (and b!128803 res!62183) b!128806))

(assert (= (or b!128801 b!128805) bm!13957))

(assert (= (or b!128800 b!128806) bm!13956))

(assert (=> d!38953 m!149355))

(assert (=> d!38953 m!149427))

(declare-fun m!150991 () Bool)

(assert (=> b!128803 m!150991))

(declare-fun m!150993 () Bool)

(assert (=> bm!13957 m!150993))

(declare-fun m!150995 () Bool)

(assert (=> b!128807 m!150995))

(assert (=> bm!13956 m!149355))

(assert (=> bm!13956 m!149445))

(assert (=> d!38607 d!38953))

(assert (=> d!38607 d!38791))

(declare-fun d!38955 () Bool)

(assert (=> d!38955 (= (apply!112 lt!66179 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (getValueByKey!168 (toList!861 lt!66179) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5327 () Bool)

(assert (= bs!5327 d!38955))

(assert (=> bs!5327 m!149547))

(declare-fun m!150997 () Bool)

(assert (=> bs!5327 m!150997))

(assert (=> bs!5327 m!150997))

(declare-fun m!150999 () Bool)

(assert (=> bs!5327 m!150999))

(assert (=> b!127943 d!38955))

(declare-fun d!38957 () Bool)

(declare-fun c!23662 () Bool)

(assert (=> d!38957 (= c!23662 ((_ is ValueCellFull!1083) (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000)))))

(declare-fun e!84073 () V!3451)

(assert (=> d!38957 (= (get!1455 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84073)))

(declare-fun b!128808 () Bool)

(assert (=> b!128808 (= e!84073 (get!1457 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128809 () Bool)

(assert (=> b!128809 (= e!84073 (get!1458 (select (arr!2238 (ite (or c!23392 c!23389) (_values!2788 newMap!16) lt!66094)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38957 c!23662) b!128808))

(assert (= (and d!38957 (not c!23662)) b!128809))

(assert (=> b!128808 m!149591))

(assert (=> b!128808 m!149593))

(declare-fun m!151001 () Bool)

(assert (=> b!128808 m!151001))

(assert (=> b!128809 m!149591))

(assert (=> b!128809 m!149593))

(declare-fun m!151003 () Bool)

(assert (=> b!128809 m!151003))

(assert (=> b!127943 d!38957))

(declare-fun b!128810 () Bool)

(declare-fun e!84077 () Bool)

(declare-fun e!84075 () Bool)

(assert (=> b!128810 (= e!84077 e!84075)))

(declare-fun res!62188 () Bool)

(assert (=> b!128810 (=> (not res!62188) (not e!84075))))

(declare-fun e!84076 () Bool)

(assert (=> b!128810 (= res!62188 (not e!84076))))

(declare-fun res!62187 () Bool)

(assert (=> b!128810 (=> (not res!62187) (not e!84076))))

(assert (=> b!128810 (= res!62187 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!23663 () Bool)

(declare-fun call!13961 () Bool)

(declare-fun bm!13958 () Bool)

(assert (=> bm!13958 (= call!13961 (arrayNoDuplicates!0 (_keys!4542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23663 (Cons!1702 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23484 (Cons!1702 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) Nil!1703) Nil!1703)) (ite c!23484 (Cons!1702 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) Nil!1703) Nil!1703))))))

(declare-fun d!38959 () Bool)

(declare-fun res!62186 () Bool)

(assert (=> d!38959 (=> res!62186 e!84077)))

(assert (=> d!38959 (= res!62186 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!38959 (= (arrayNoDuplicates!0 (_keys!4542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23484 (Cons!1702 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) Nil!1703) Nil!1703)) e!84077)))

(declare-fun b!128811 () Bool)

(declare-fun e!84074 () Bool)

(assert (=> b!128811 (= e!84074 call!13961)))

(declare-fun b!128812 () Bool)

(assert (=> b!128812 (= e!84074 call!13961)))

(declare-fun b!128813 () Bool)

(assert (=> b!128813 (= e!84075 e!84074)))

(assert (=> b!128813 (= c!23663 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!128814 () Bool)

(assert (=> b!128814 (= e!84076 (contains!887 (ite c!23484 (Cons!1702 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) Nil!1703) Nil!1703) (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!38959 (not res!62186)) b!128810))

(assert (= (and b!128810 res!62187) b!128814))

(assert (= (and b!128810 res!62188) b!128813))

(assert (= (and b!128813 c!23663) b!128811))

(assert (= (and b!128813 (not c!23663)) b!128812))

(assert (= (or b!128811 b!128812) bm!13958))

(assert (=> b!128810 m!150559))

(assert (=> b!128810 m!150559))

(assert (=> b!128810 m!150569))

(assert (=> bm!13958 m!150559))

(declare-fun m!151005 () Bool)

(assert (=> bm!13958 m!151005))

(assert (=> b!128813 m!150559))

(assert (=> b!128813 m!150559))

(assert (=> b!128813 m!150569))

(assert (=> b!128814 m!150559))

(assert (=> b!128814 m!150559))

(declare-fun m!151007 () Bool)

(assert (=> b!128814 m!151007))

(assert (=> bm!13861 d!38959))

(declare-fun d!38961 () Bool)

(declare-fun res!62189 () Bool)

(declare-fun e!84078 () Bool)

(assert (=> d!38961 (=> res!62189 e!84078)))

(assert (=> d!38961 (= res!62189 (and ((_ is Cons!1700) (t!6083 (toList!861 lt!65992))) (= (_1!1309 (h!2303 (t!6083 (toList!861 lt!65992)))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!38961 (= (containsKey!172 (t!6083 (toList!861 lt!65992)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!84078)))

(declare-fun b!128815 () Bool)

(declare-fun e!84079 () Bool)

(assert (=> b!128815 (= e!84078 e!84079)))

(declare-fun res!62190 () Bool)

(assert (=> b!128815 (=> (not res!62190) (not e!84079))))

(assert (=> b!128815 (= res!62190 (and (or (not ((_ is Cons!1700) (t!6083 (toList!861 lt!65992)))) (bvsle (_1!1309 (h!2303 (t!6083 (toList!861 lt!65992)))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) ((_ is Cons!1700) (t!6083 (toList!861 lt!65992))) (bvslt (_1!1309 (h!2303 (t!6083 (toList!861 lt!65992)))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun b!128816 () Bool)

(assert (=> b!128816 (= e!84079 (containsKey!172 (t!6083 (t!6083 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!38961 (not res!62189)) b!128815))

(assert (= (and b!128815 res!62190) b!128816))

(assert (=> b!128816 m!149355))

(declare-fun m!151009 () Bool)

(assert (=> b!128816 m!151009))

(assert (=> b!128270 d!38961))

(declare-fun d!38963 () Bool)

(assert (=> d!38963 (= (apply!112 lt!66336 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5328 () Bool)

(assert (= bs!5328 d!38963))

(assert (=> bs!5328 m!150635))

(assert (=> bs!5328 m!150635))

(declare-fun m!151011 () Bool)

(assert (=> bs!5328 m!151011))

(assert (=> b!128153 d!38963))

(declare-fun d!38965 () Bool)

(declare-fun e!84081 () Bool)

(assert (=> d!38965 e!84081))

(declare-fun res!62191 () Bool)

(assert (=> d!38965 (=> res!62191 e!84081)))

(declare-fun lt!66773 () Bool)

(assert (=> d!38965 (= res!62191 (not lt!66773))))

(declare-fun lt!66776 () Bool)

(assert (=> d!38965 (= lt!66773 lt!66776)))

(declare-fun lt!66775 () Unit!3981)

(declare-fun e!84080 () Unit!3981)

(assert (=> d!38965 (= lt!66775 e!84080)))

(declare-fun c!23664 () Bool)

(assert (=> d!38965 (= c!23664 lt!66776)))

(assert (=> d!38965 (= lt!66776 (containsKey!172 (toList!861 lt!66244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38965 (= (contains!884 lt!66244 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66773)))

(declare-fun b!128817 () Bool)

(declare-fun lt!66774 () Unit!3981)

(assert (=> b!128817 (= e!84080 lt!66774)))

(assert (=> b!128817 (= lt!66774 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128817 (isDefined!121 (getValueByKey!168 (toList!861 lt!66244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128818 () Bool)

(declare-fun Unit!4021 () Unit!3981)

(assert (=> b!128818 (= e!84080 Unit!4021)))

(declare-fun b!128819 () Bool)

(assert (=> b!128819 (= e!84081 (isDefined!121 (getValueByKey!168 (toList!861 lt!66244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38965 c!23664) b!128817))

(assert (= (and d!38965 (not c!23664)) b!128818))

(assert (= (and d!38965 (not res!62191)) b!128819))

(declare-fun m!151013 () Bool)

(assert (=> d!38965 m!151013))

(declare-fun m!151015 () Bool)

(assert (=> b!128817 m!151015))

(declare-fun m!151017 () Bool)

(assert (=> b!128817 m!151017))

(assert (=> b!128817 m!151017))

(declare-fun m!151019 () Bool)

(assert (=> b!128817 m!151019))

(assert (=> b!128819 m!151017))

(assert (=> b!128819 m!151017))

(assert (=> b!128819 m!151019))

(assert (=> bm!13852 d!38965))

(declare-fun d!38967 () Bool)

(declare-fun lt!66777 () Bool)

(assert (=> d!38967 (= lt!66777 (select (content!127 (toList!861 lt!66279)) (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun e!84083 () Bool)

(assert (=> d!38967 (= lt!66777 e!84083)))

(declare-fun res!62193 () Bool)

(assert (=> d!38967 (=> (not res!62193) (not e!84083))))

(assert (=> d!38967 (= res!62193 ((_ is Cons!1700) (toList!861 lt!66279)))))

(assert (=> d!38967 (= (contains!886 (toList!861 lt!66279) (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66777)))

(declare-fun b!128820 () Bool)

(declare-fun e!84082 () Bool)

(assert (=> b!128820 (= e!84083 e!84082)))

(declare-fun res!62192 () Bool)

(assert (=> b!128820 (=> res!62192 e!84082)))

(assert (=> b!128820 (= res!62192 (= (h!2303 (toList!861 lt!66279)) (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128821 () Bool)

(assert (=> b!128821 (= e!84082 (contains!886 (t!6083 (toList!861 lt!66279)) (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!38967 res!62193) b!128820))

(assert (= (and b!128820 (not res!62192)) b!128821))

(declare-fun m!151021 () Bool)

(assert (=> d!38967 m!151021))

(declare-fun m!151023 () Bool)

(assert (=> d!38967 m!151023))

(declare-fun m!151025 () Bool)

(assert (=> b!128821 m!151025))

(assert (=> b!128094 d!38967))

(assert (=> b!128136 d!38735))

(declare-fun d!38969 () Bool)

(assert (=> d!38969 (= (size!2506 newMap!16) (bvadd (_size!586 newMap!16) (bvsdiv (bvadd (extraKeys!2582 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!128261 d!38969))

(assert (=> b!128101 d!38731))

(assert (=> b!128101 d!38733))

(declare-fun d!38971 () Bool)

(assert (=> d!38971 (= (get!1459 (getValueByKey!168 (toList!861 lt!66153) lt!66147)) (v!3150 (getValueByKey!168 (toList!861 lt!66153) lt!66147)))))

(assert (=> d!38615 d!38971))

(declare-fun d!38973 () Bool)

(declare-fun c!23665 () Bool)

(assert (=> d!38973 (= c!23665 (and ((_ is Cons!1700) (toList!861 lt!66153)) (= (_1!1309 (h!2303 (toList!861 lt!66153))) lt!66147)))))

(declare-fun e!84084 () Option!174)

(assert (=> d!38973 (= (getValueByKey!168 (toList!861 lt!66153) lt!66147) e!84084)))

(declare-fun b!128823 () Bool)

(declare-fun e!84085 () Option!174)

(assert (=> b!128823 (= e!84084 e!84085)))

(declare-fun c!23666 () Bool)

(assert (=> b!128823 (= c!23666 (and ((_ is Cons!1700) (toList!861 lt!66153)) (not (= (_1!1309 (h!2303 (toList!861 lt!66153))) lt!66147))))))

(declare-fun b!128824 () Bool)

(assert (=> b!128824 (= e!84085 (getValueByKey!168 (t!6083 (toList!861 lt!66153)) lt!66147))))

(declare-fun b!128825 () Bool)

(assert (=> b!128825 (= e!84085 None!172)))

(declare-fun b!128822 () Bool)

(assert (=> b!128822 (= e!84084 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66153)))))))

(assert (= (and d!38973 c!23665) b!128822))

(assert (= (and d!38973 (not c!23665)) b!128823))

(assert (= (and b!128823 c!23666) b!128824))

(assert (= (and b!128823 (not c!23666)) b!128825))

(declare-fun m!151027 () Bool)

(assert (=> b!128824 m!151027))

(assert (=> d!38615 d!38973))

(declare-fun d!38975 () Bool)

(assert (=> d!38975 (= (apply!112 lt!66179 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5329 () Bool)

(assert (= bs!5329 d!38975))

(declare-fun m!151029 () Bool)

(assert (=> bs!5329 m!151029))

(assert (=> bs!5329 m!151029))

(declare-fun m!151031 () Bool)

(assert (=> bs!5329 m!151031))

(assert (=> b!127953 d!38975))

(declare-fun d!38977 () Bool)

(assert (=> d!38977 (contains!884 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66328)))

(declare-fun lt!66778 () Unit!3981)

(assert (=> d!38977 (= lt!66778 (choose!776 lt!66339 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) lt!66328))))

(assert (=> d!38977 (contains!884 lt!66339 lt!66328)))

(assert (=> d!38977 (= (addStillContains!88 lt!66339 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) lt!66328) lt!66778)))

(declare-fun bs!5330 () Bool)

(assert (= bs!5330 d!38977))

(assert (=> bs!5330 m!149905))

(assert (=> bs!5330 m!149905))

(assert (=> bs!5330 m!149907))

(declare-fun m!151033 () Bool)

(assert (=> bs!5330 m!151033))

(declare-fun m!151035 () Bool)

(assert (=> bs!5330 m!151035))

(assert (=> b!128165 d!38977))

(declare-fun d!38979 () Bool)

(assert (=> d!38979 (= (apply!112 lt!66332 lt!66326) (get!1459 (getValueByKey!168 (toList!861 lt!66332) lt!66326)))))

(declare-fun bs!5331 () Bool)

(assert (= bs!5331 d!38979))

(declare-fun m!151037 () Bool)

(assert (=> bs!5331 m!151037))

(assert (=> bs!5331 m!151037))

(declare-fun m!151039 () Bool)

(assert (=> bs!5331 m!151039))

(assert (=> b!128165 d!38979))

(declare-fun d!38981 () Bool)

(assert (=> d!38981 (= (apply!112 lt!66320 lt!66335) (get!1459 (getValueByKey!168 (toList!861 lt!66320) lt!66335)))))

(declare-fun bs!5332 () Bool)

(assert (= bs!5332 d!38981))

(declare-fun m!151041 () Bool)

(assert (=> bs!5332 m!151041))

(assert (=> bs!5332 m!151041))

(declare-fun m!151043 () Bool)

(assert (=> bs!5332 m!151043))

(assert (=> b!128165 d!38981))

(declare-fun d!38983 () Bool)

(assert (=> d!38983 (= (apply!112 (+!171 lt!66337 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66318) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66337 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) lt!66318)))))

(declare-fun bs!5333 () Bool)

(assert (= bs!5333 d!38983))

(declare-fun m!151045 () Bool)

(assert (=> bs!5333 m!151045))

(assert (=> bs!5333 m!151045))

(declare-fun m!151047 () Bool)

(assert (=> bs!5333 m!151047))

(assert (=> b!128165 d!38983))

(declare-fun d!38985 () Bool)

(assert (=> d!38985 (= (apply!112 (+!171 lt!66337 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66318) (apply!112 lt!66337 lt!66318))))

(declare-fun lt!66779 () Unit!3981)

(assert (=> d!38985 (= lt!66779 (choose!775 lt!66337 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) lt!66318))))

(declare-fun e!84086 () Bool)

(assert (=> d!38985 e!84086))

(declare-fun res!62194 () Bool)

(assert (=> d!38985 (=> (not res!62194) (not e!84086))))

(assert (=> d!38985 (= res!62194 (contains!884 lt!66337 lt!66318))))

(assert (=> d!38985 (= (addApplyDifferent!88 lt!66337 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) lt!66318) lt!66779)))

(declare-fun b!128826 () Bool)

(assert (=> b!128826 (= e!84086 (not (= lt!66318 lt!66323)))))

(assert (= (and d!38985 res!62194) b!128826))

(declare-fun m!151049 () Bool)

(assert (=> d!38985 m!151049))

(assert (=> d!38985 m!149891))

(assert (=> d!38985 m!149895))

(declare-fun m!151051 () Bool)

(assert (=> d!38985 m!151051))

(assert (=> d!38985 m!149895))

(assert (=> d!38985 m!149897))

(assert (=> b!128165 d!38985))

(declare-fun d!38987 () Bool)

(declare-fun e!84087 () Bool)

(assert (=> d!38987 e!84087))

(declare-fun res!62196 () Bool)

(assert (=> d!38987 (=> (not res!62196) (not e!84087))))

(declare-fun lt!66780 () ListLongMap!1691)

(assert (=> d!38987 (= res!62196 (contains!884 lt!66780 (_1!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(declare-fun lt!66783 () List!1704)

(assert (=> d!38987 (= lt!66780 (ListLongMap!1692 lt!66783))))

(declare-fun lt!66782 () Unit!3981)

(declare-fun lt!66781 () Unit!3981)

(assert (=> d!38987 (= lt!66782 lt!66781)))

(assert (=> d!38987 (= (getValueByKey!168 lt!66783 (_1!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(assert (=> d!38987 (= lt!66781 (lemmaContainsTupThenGetReturnValue!83 lt!66783 (_1!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(assert (=> d!38987 (= lt!66783 (insertStrictlySorted!86 (toList!861 lt!66320) (_1!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(assert (=> d!38987 (= (+!171 lt!66320 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66780)))

(declare-fun b!128827 () Bool)

(declare-fun res!62195 () Bool)

(assert (=> b!128827 (=> (not res!62195) (not e!84087))))

(assert (=> b!128827 (= res!62195 (= (getValueByKey!168 (toList!861 lt!66780) (_1!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))))))))

(declare-fun b!128828 () Bool)

(assert (=> b!128828 (= e!84087 (contains!886 (toList!861 lt!66780) (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))))))

(assert (= (and d!38987 res!62196) b!128827))

(assert (= (and b!128827 res!62195) b!128828))

(declare-fun m!151053 () Bool)

(assert (=> d!38987 m!151053))

(declare-fun m!151055 () Bool)

(assert (=> d!38987 m!151055))

(declare-fun m!151057 () Bool)

(assert (=> d!38987 m!151057))

(declare-fun m!151059 () Bool)

(assert (=> d!38987 m!151059))

(declare-fun m!151061 () Bool)

(assert (=> b!128827 m!151061))

(declare-fun m!151063 () Bool)

(assert (=> b!128828 m!151063))

(assert (=> b!128165 d!38987))

(declare-fun d!38989 () Bool)

(assert (=> d!38989 (= (apply!112 (+!171 lt!66320 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66335) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66320 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) lt!66335)))))

(declare-fun bs!5334 () Bool)

(assert (= bs!5334 d!38989))

(declare-fun m!151065 () Bool)

(assert (=> bs!5334 m!151065))

(assert (=> bs!5334 m!151065))

(declare-fun m!151067 () Bool)

(assert (=> bs!5334 m!151067))

(assert (=> b!128165 d!38989))

(declare-fun d!38991 () Bool)

(declare-fun e!84089 () Bool)

(assert (=> d!38991 e!84089))

(declare-fun res!62197 () Bool)

(assert (=> d!38991 (=> res!62197 e!84089)))

(declare-fun lt!66784 () Bool)

(assert (=> d!38991 (= res!62197 (not lt!66784))))

(declare-fun lt!66787 () Bool)

(assert (=> d!38991 (= lt!66784 lt!66787)))

(declare-fun lt!66786 () Unit!3981)

(declare-fun e!84088 () Unit!3981)

(assert (=> d!38991 (= lt!66786 e!84088)))

(declare-fun c!23667 () Bool)

(assert (=> d!38991 (= c!23667 lt!66787)))

(assert (=> d!38991 (= lt!66787 (containsKey!172 (toList!861 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) lt!66328))))

(assert (=> d!38991 (= (contains!884 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66328) lt!66784)))

(declare-fun b!128829 () Bool)

(declare-fun lt!66785 () Unit!3981)

(assert (=> b!128829 (= e!84088 lt!66785)))

(assert (=> b!128829 (= lt!66785 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) lt!66328))))

(assert (=> b!128829 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) lt!66328))))

(declare-fun b!128830 () Bool)

(declare-fun Unit!4022 () Unit!3981)

(assert (=> b!128830 (= e!84088 Unit!4022)))

(declare-fun b!128831 () Bool)

(assert (=> b!128831 (= e!84089 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) lt!66328)))))

(assert (= (and d!38991 c!23667) b!128829))

(assert (= (and d!38991 (not c!23667)) b!128830))

(assert (= (and d!38991 (not res!62197)) b!128831))

(declare-fun m!151069 () Bool)

(assert (=> d!38991 m!151069))

(declare-fun m!151071 () Bool)

(assert (=> b!128829 m!151071))

(declare-fun m!151073 () Bool)

(assert (=> b!128829 m!151073))

(assert (=> b!128829 m!151073))

(declare-fun m!151075 () Bool)

(assert (=> b!128829 m!151075))

(assert (=> b!128831 m!151073))

(assert (=> b!128831 m!151073))

(assert (=> b!128831 m!151075))

(assert (=> b!128165 d!38991))

(declare-fun d!38993 () Bool)

(declare-fun e!84090 () Bool)

(assert (=> d!38993 e!84090))

(declare-fun res!62199 () Bool)

(assert (=> d!38993 (=> (not res!62199) (not e!84090))))

(declare-fun lt!66788 () ListLongMap!1691)

(assert (=> d!38993 (= res!62199 (contains!884 lt!66788 (_1!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(declare-fun lt!66791 () List!1704)

(assert (=> d!38993 (= lt!66788 (ListLongMap!1692 lt!66791))))

(declare-fun lt!66790 () Unit!3981)

(declare-fun lt!66789 () Unit!3981)

(assert (=> d!38993 (= lt!66790 lt!66789)))

(assert (=> d!38993 (= (getValueByKey!168 lt!66791 (_1!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!38993 (= lt!66789 (lemmaContainsTupThenGetReturnValue!83 lt!66791 (_1!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!38993 (= lt!66791 (insertStrictlySorted!86 (toList!861 lt!66332) (_1!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!38993 (= (+!171 lt!66332 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66788)))

(declare-fun b!128832 () Bool)

(declare-fun res!62198 () Bool)

(assert (=> b!128832 (=> (not res!62198) (not e!84090))))

(assert (=> b!128832 (= res!62198 (= (getValueByKey!168 (toList!861 lt!66788) (_1!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(declare-fun b!128833 () Bool)

(assert (=> b!128833 (= e!84090 (contains!886 (toList!861 lt!66788) (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))

(assert (= (and d!38993 res!62199) b!128832))

(assert (= (and b!128832 res!62198) b!128833))

(declare-fun m!151077 () Bool)

(assert (=> d!38993 m!151077))

(declare-fun m!151079 () Bool)

(assert (=> d!38993 m!151079))

(declare-fun m!151081 () Bool)

(assert (=> d!38993 m!151081))

(declare-fun m!151083 () Bool)

(assert (=> d!38993 m!151083))

(declare-fun m!151085 () Bool)

(assert (=> b!128832 m!151085))

(declare-fun m!151087 () Bool)

(assert (=> b!128833 m!151087))

(assert (=> b!128165 d!38993))

(declare-fun d!38995 () Bool)

(assert (=> d!38995 (= (apply!112 (+!171 lt!66332 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66326) (apply!112 lt!66332 lt!66326))))

(declare-fun lt!66792 () Unit!3981)

(assert (=> d!38995 (= lt!66792 (choose!775 lt!66332 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) lt!66326))))

(declare-fun e!84091 () Bool)

(assert (=> d!38995 e!84091))

(declare-fun res!62200 () Bool)

(assert (=> d!38995 (=> (not res!62200) (not e!84091))))

(assert (=> d!38995 (= res!62200 (contains!884 lt!66332 lt!66326))))

(assert (=> d!38995 (= (addApplyDifferent!88 lt!66332 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) lt!66326) lt!66792)))

(declare-fun b!128834 () Bool)

(assert (=> b!128834 (= e!84091 (not (= lt!66326 lt!66331)))))

(assert (= (and d!38995 res!62200) b!128834))

(declare-fun m!151089 () Bool)

(assert (=> d!38995 m!151089))

(assert (=> d!38995 m!149887))

(assert (=> d!38995 m!149893))

(declare-fun m!151091 () Bool)

(assert (=> d!38995 m!151091))

(assert (=> d!38995 m!149893))

(assert (=> d!38995 m!149911))

(assert (=> b!128165 d!38995))

(declare-fun d!38997 () Bool)

(assert (=> d!38997 (= (apply!112 lt!66337 lt!66318) (get!1459 (getValueByKey!168 (toList!861 lt!66337) lt!66318)))))

(declare-fun bs!5335 () Bool)

(assert (= bs!5335 d!38997))

(declare-fun m!151093 () Bool)

(assert (=> bs!5335 m!151093))

(assert (=> bs!5335 m!151093))

(declare-fun m!151095 () Bool)

(assert (=> bs!5335 m!151095))

(assert (=> b!128165 d!38997))

(declare-fun d!38999 () Bool)

(assert (=> d!38999 (= (apply!112 (+!171 lt!66320 (tuple2!2597 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66335) (apply!112 lt!66320 lt!66335))))

(declare-fun lt!66793 () Unit!3981)

(assert (=> d!38999 (= lt!66793 (choose!775 lt!66320 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) lt!66335))))

(declare-fun e!84092 () Bool)

(assert (=> d!38999 e!84092))

(declare-fun res!62201 () Bool)

(assert (=> d!38999 (=> (not res!62201) (not e!84092))))

(assert (=> d!38999 (= res!62201 (contains!884 lt!66320 lt!66335))))

(assert (=> d!38999 (= (addApplyDifferent!88 lt!66320 lt!66329 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) lt!66335) lt!66793)))

(declare-fun b!128835 () Bool)

(assert (=> b!128835 (= e!84092 (not (= lt!66335 lt!66329)))))

(assert (= (and d!38999 res!62201) b!128835))

(declare-fun m!151097 () Bool)

(assert (=> d!38999 m!151097))

(assert (=> d!38999 m!149909))

(assert (=> d!38999 m!149899))

(declare-fun m!151099 () Bool)

(assert (=> d!38999 m!151099))

(assert (=> d!38999 m!149899))

(assert (=> d!38999 m!149901))

(assert (=> b!128165 d!38999))

(declare-fun b!128836 () Bool)

(declare-fun e!84095 () Bool)

(declare-fun e!84097 () Bool)

(assert (=> b!128836 (= e!84095 e!84097)))

(declare-fun c!23671 () Bool)

(declare-fun e!84099 () Bool)

(assert (=> b!128836 (= c!23671 e!84099)))

(declare-fun res!62202 () Bool)

(assert (=> b!128836 (=> (not res!62202) (not e!84099))))

(assert (=> b!128836 (= res!62202 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128837 () Bool)

(declare-fun e!84094 () Bool)

(assert (=> b!128837 (= e!84097 e!84094)))

(declare-fun c!23669 () Bool)

(assert (=> b!128837 (= c!23669 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128838 () Bool)

(assert (=> b!128838 (= e!84099 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128838 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128839 () Bool)

(declare-fun e!84098 () ListLongMap!1691)

(declare-fun call!13962 () ListLongMap!1691)

(assert (=> b!128839 (= e!84098 call!13962)))

(declare-fun b!128840 () Bool)

(declare-fun lt!66798 () Unit!3981)

(declare-fun lt!66797 () Unit!3981)

(assert (=> b!128840 (= lt!66798 lt!66797)))

(declare-fun lt!66799 () (_ BitVec 64))

(declare-fun lt!66800 () (_ BitVec 64))

(declare-fun lt!66796 () ListLongMap!1691)

(declare-fun lt!66795 () V!3451)

(assert (=> b!128840 (not (contains!884 (+!171 lt!66796 (tuple2!2597 lt!66800 lt!66795)) lt!66799))))

(assert (=> b!128840 (= lt!66797 (addStillNotContains!57 lt!66796 lt!66800 lt!66795 lt!66799))))

(assert (=> b!128840 (= lt!66799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128840 (= lt!66795 (get!1455 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128840 (= lt!66800 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128840 (= lt!66796 call!13962)))

(assert (=> b!128840 (= e!84098 (+!171 call!13962 (tuple2!2597 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (get!1455 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128841 () Bool)

(declare-fun e!84096 () ListLongMap!1691)

(assert (=> b!128841 (= e!84096 e!84098)))

(declare-fun c!23670 () Bool)

(assert (=> b!128841 (= c!23670 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13959 () Bool)

(assert (=> bm!13959 (= call!13962 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2805 newMap!16)))))

(declare-fun b!128842 () Bool)

(declare-fun e!84093 () Bool)

(assert (=> b!128842 (= e!84097 e!84093)))

(assert (=> b!128842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun res!62205 () Bool)

(declare-fun lt!66794 () ListLongMap!1691)

(assert (=> b!128842 (= res!62205 (contains!884 lt!66794 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128842 (=> (not res!62205) (not e!84093))))

(declare-fun b!128843 () Bool)

(assert (=> b!128843 (= e!84096 (ListLongMap!1692 Nil!1701))))

(declare-fun b!128844 () Bool)

(assert (=> b!128844 (= e!84094 (= lt!66794 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2805 newMap!16))))))

(declare-fun d!39001 () Bool)

(assert (=> d!39001 e!84095))

(declare-fun res!62203 () Bool)

(assert (=> d!39001 (=> (not res!62203) (not e!84095))))

(assert (=> d!39001 (= res!62203 (not (contains!884 lt!66794 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39001 (= lt!66794 e!84096)))

(declare-fun c!23668 () Bool)

(assert (=> d!39001 (= c!23668 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!39001 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!39001 (= (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))) (mask!7073 newMap!16) (ite c!23392 (ite c!23390 lt!66084 lt!66092) (extraKeys!2582 newMap!16)) (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)) (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66794)))

(declare-fun b!128845 () Bool)

(assert (=> b!128845 (= e!84094 (isEmpty!400 lt!66794))))

(declare-fun b!128846 () Bool)

(declare-fun res!62204 () Bool)

(assert (=> b!128846 (=> (not res!62204) (not e!84095))))

(assert (=> b!128846 (= res!62204 (not (contains!884 lt!66794 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128847 () Bool)

(assert (=> b!128847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> b!128847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16)))))))))

(assert (=> b!128847 (= e!84093 (= (apply!112 lt!66794 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!39001 c!23668) b!128843))

(assert (= (and d!39001 (not c!23668)) b!128841))

(assert (= (and b!128841 c!23670) b!128840))

(assert (= (and b!128841 (not c!23670)) b!128839))

(assert (= (or b!128840 b!128839) bm!13959))

(assert (= (and d!39001 res!62203) b!128846))

(assert (= (and b!128846 res!62204) b!128836))

(assert (= (and b!128836 res!62202) b!128838))

(assert (= (and b!128836 c!23671) b!128842))

(assert (= (and b!128836 (not c!23671)) b!128837))

(assert (= (and b!128842 res!62205) b!128847))

(assert (= (and b!128837 c!23669) b!128844))

(assert (= (and b!128837 (not c!23669)) b!128845))

(declare-fun b_lambda!5699 () Bool)

(assert (=> (not b_lambda!5699) (not b!128840)))

(assert (=> b!128840 t!6091))

(declare-fun b_and!7971 () Bool)

(assert (= b_and!7967 (and (=> t!6091 result!3893) b_and!7971)))

(assert (=> b!128840 t!6093))

(declare-fun b_and!7973 () Bool)

(assert (= b_and!7969 (and (=> t!6093 result!3895) b_and!7973)))

(declare-fun b_lambda!5701 () Bool)

(assert (=> (not b_lambda!5701) (not b!128847)))

(assert (=> b!128847 t!6091))

(declare-fun b_and!7975 () Bool)

(assert (= b_and!7971 (and (=> t!6091 result!3893) b_and!7975)))

(assert (=> b!128847 t!6093))

(declare-fun b_and!7977 () Bool)

(assert (= b_and!7973 (and (=> t!6093 result!3895) b_and!7977)))

(declare-fun m!151101 () Bool)

(assert (=> b!128845 m!151101))

(assert (=> b!128847 m!149547))

(declare-fun m!151103 () Bool)

(assert (=> b!128847 m!151103))

(assert (=> b!128847 m!149923))

(assert (=> b!128847 m!149923))

(assert (=> b!128847 m!149593))

(assert (=> b!128847 m!149927))

(assert (=> b!128847 m!149547))

(assert (=> b!128847 m!149593))

(declare-fun m!151105 () Bool)

(assert (=> b!128844 m!151105))

(declare-fun m!151107 () Bool)

(assert (=> b!128840 m!151107))

(declare-fun m!151109 () Bool)

(assert (=> b!128840 m!151109))

(assert (=> b!128840 m!149923))

(assert (=> b!128840 m!149923))

(assert (=> b!128840 m!149593))

(assert (=> b!128840 m!149927))

(declare-fun m!151111 () Bool)

(assert (=> b!128840 m!151111))

(assert (=> b!128840 m!149547))

(assert (=> b!128840 m!149593))

(assert (=> b!128840 m!151107))

(declare-fun m!151113 () Bool)

(assert (=> b!128840 m!151113))

(assert (=> b!128841 m!149547))

(assert (=> b!128841 m!149547))

(assert (=> b!128841 m!149549))

(assert (=> b!128842 m!149547))

(assert (=> b!128842 m!149547))

(declare-fun m!151115 () Bool)

(assert (=> b!128842 m!151115))

(declare-fun m!151117 () Bool)

(assert (=> d!39001 m!151117))

(assert (=> d!39001 m!149599))

(declare-fun m!151119 () Bool)

(assert (=> b!128846 m!151119))

(assert (=> b!128838 m!149547))

(assert (=> b!128838 m!149547))

(assert (=> b!128838 m!149549))

(assert (=> bm!13959 m!151105))

(assert (=> b!128165 d!39001))

(declare-fun d!39003 () Bool)

(assert (=> d!39003 (= (apply!112 (+!171 lt!66332 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66326) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66332 (tuple2!2597 lt!66331 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) lt!66326)))))

(declare-fun bs!5336 () Bool)

(assert (= bs!5336 d!39003))

(declare-fun m!151121 () Bool)

(assert (=> bs!5336 m!151121))

(assert (=> bs!5336 m!151121))

(declare-fun m!151123 () Bool)

(assert (=> bs!5336 m!151123))

(assert (=> b!128165 d!39003))

(declare-fun d!39005 () Bool)

(declare-fun e!84100 () Bool)

(assert (=> d!39005 e!84100))

(declare-fun res!62207 () Bool)

(assert (=> d!39005 (=> (not res!62207) (not e!84100))))

(declare-fun lt!66801 () ListLongMap!1691)

(assert (=> d!39005 (= res!62207 (contains!884 lt!66801 (_1!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(declare-fun lt!66804 () List!1704)

(assert (=> d!39005 (= lt!66801 (ListLongMap!1692 lt!66804))))

(declare-fun lt!66803 () Unit!3981)

(declare-fun lt!66802 () Unit!3981)

(assert (=> d!39005 (= lt!66803 lt!66802)))

(assert (=> d!39005 (= (getValueByKey!168 lt!66804 (_1!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(assert (=> d!39005 (= lt!66802 (lemmaContainsTupThenGetReturnValue!83 lt!66804 (_1!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(assert (=> d!39005 (= lt!66804 (insertStrictlySorted!86 (toList!861 lt!66339) (_1!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))))))

(assert (=> d!39005 (= (+!171 lt!66339 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))) lt!66801)))

(declare-fun b!128848 () Bool)

(declare-fun res!62206 () Bool)

(assert (=> b!128848 (=> (not res!62206) (not e!84100))))

(assert (=> b!128848 (= res!62206 (= (getValueByKey!168 (toList!861 lt!66801) (_1!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))))))))

(declare-fun b!128849 () Bool)

(assert (=> b!128849 (= e!84100 (contains!886 (toList!861 lt!66801) (tuple2!2597 lt!66333 (ite (and c!23392 c!23390) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2666 newMap!16)))))))

(assert (= (and d!39005 res!62207) b!128848))

(assert (= (and b!128848 res!62206) b!128849))

(declare-fun m!151125 () Bool)

(assert (=> d!39005 m!151125))

(declare-fun m!151127 () Bool)

(assert (=> d!39005 m!151127))

(declare-fun m!151129 () Bool)

(assert (=> d!39005 m!151129))

(declare-fun m!151131 () Bool)

(assert (=> d!39005 m!151131))

(declare-fun m!151133 () Bool)

(assert (=> b!128848 m!151133))

(declare-fun m!151135 () Bool)

(assert (=> b!128849 m!151135))

(assert (=> b!128165 d!39005))

(declare-fun d!39007 () Bool)

(declare-fun e!84101 () Bool)

(assert (=> d!39007 e!84101))

(declare-fun res!62209 () Bool)

(assert (=> d!39007 (=> (not res!62209) (not e!84101))))

(declare-fun lt!66805 () ListLongMap!1691)

(assert (=> d!39007 (= res!62209 (contains!884 lt!66805 (_1!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(declare-fun lt!66808 () List!1704)

(assert (=> d!39007 (= lt!66805 (ListLongMap!1692 lt!66808))))

(declare-fun lt!66807 () Unit!3981)

(declare-fun lt!66806 () Unit!3981)

(assert (=> d!39007 (= lt!66807 lt!66806)))

(assert (=> d!39007 (= (getValueByKey!168 lt!66808 (_1!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!39007 (= lt!66806 (lemmaContainsTupThenGetReturnValue!83 lt!66808 (_1!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!39007 (= lt!66808 (insertStrictlySorted!86 (toList!861 lt!66337) (_1!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) (_2!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))))))

(assert (=> d!39007 (= (+!171 lt!66337 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))) lt!66805)))

(declare-fun b!128850 () Bool)

(declare-fun res!62208 () Bool)

(assert (=> b!128850 (=> (not res!62208) (not e!84101))))

(assert (=> b!128850 (= res!62208 (= (getValueByKey!168 (toList!861 lt!66805) (_1!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16))))) (Some!173 (_2!1309 (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))))

(declare-fun b!128851 () Bool)

(assert (=> b!128851 (= e!84101 (contains!886 (toList!861 lt!66805) (tuple2!2597 lt!66323 (ite c!23392 (ite c!23390 (minValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2666 newMap!16)))))))

(assert (= (and d!39007 res!62209) b!128850))

(assert (= (and b!128850 res!62208) b!128851))

(declare-fun m!151137 () Bool)

(assert (=> d!39007 m!151137))

(declare-fun m!151139 () Bool)

(assert (=> d!39007 m!151139))

(declare-fun m!151141 () Bool)

(assert (=> d!39007 m!151141))

(declare-fun m!151143 () Bool)

(assert (=> d!39007 m!151143))

(declare-fun m!151145 () Bool)

(assert (=> b!128850 m!151145))

(declare-fun m!151147 () Bool)

(assert (=> b!128851 m!151147))

(assert (=> b!128165 d!39007))

(assert (=> d!38667 d!38791))

(assert (=> b!127948 d!38735))

(assert (=> b!128049 d!38877))

(declare-fun d!39009 () Bool)

(declare-fun e!84103 () Bool)

(assert (=> d!39009 e!84103))

(declare-fun res!62210 () Bool)

(assert (=> d!39009 (=> res!62210 e!84103)))

(declare-fun lt!66809 () Bool)

(assert (=> d!39009 (= res!62210 (not lt!66809))))

(declare-fun lt!66812 () Bool)

(assert (=> d!39009 (= lt!66809 lt!66812)))

(declare-fun lt!66811 () Unit!3981)

(declare-fun e!84102 () Unit!3981)

(assert (=> d!39009 (= lt!66811 e!84102)))

(declare-fun c!23672 () Bool)

(assert (=> d!39009 (= c!23672 lt!66812)))

(assert (=> d!39009 (= lt!66812 (containsKey!172 (toList!861 lt!66179) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39009 (= (contains!884 lt!66179 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) lt!66809)))

(declare-fun b!128852 () Bool)

(declare-fun lt!66810 () Unit!3981)

(assert (=> b!128852 (= e!84102 lt!66810)))

(assert (=> b!128852 (= lt!66810 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66179) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128852 (isDefined!121 (getValueByKey!168 (toList!861 lt!66179) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128853 () Bool)

(declare-fun Unit!4023 () Unit!3981)

(assert (=> b!128853 (= e!84102 Unit!4023)))

(declare-fun b!128854 () Bool)

(assert (=> b!128854 (= e!84103 (isDefined!121 (getValueByKey!168 (toList!861 lt!66179) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39009 c!23672) b!128852))

(assert (= (and d!39009 (not c!23672)) b!128853))

(assert (= (and d!39009 (not res!62210)) b!128854))

(assert (=> d!39009 m!149547))

(declare-fun m!151149 () Bool)

(assert (=> d!39009 m!151149))

(assert (=> b!128852 m!149547))

(declare-fun m!151151 () Bool)

(assert (=> b!128852 m!151151))

(assert (=> b!128852 m!149547))

(assert (=> b!128852 m!150997))

(assert (=> b!128852 m!150997))

(declare-fun m!151153 () Bool)

(assert (=> b!128852 m!151153))

(assert (=> b!128854 m!149547))

(assert (=> b!128854 m!150997))

(assert (=> b!128854 m!150997))

(assert (=> b!128854 m!151153))

(assert (=> b!127951 d!39009))

(assert (=> b!128111 d!38735))

(assert (=> b!128046 d!38665))

(declare-fun d!39011 () Bool)

(declare-fun res!62211 () Bool)

(declare-fun e!84104 () Bool)

(assert (=> d!39011 (=> res!62211 e!84104)))

(assert (=> d!39011 (= res!62211 (= (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!39011 (= (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!84104)))

(declare-fun b!128855 () Bool)

(declare-fun e!84105 () Bool)

(assert (=> b!128855 (= e!84104 e!84105)))

(declare-fun res!62212 () Bool)

(assert (=> b!128855 (=> (not res!62212) (not e!84105))))

(assert (=> b!128855 (= res!62212 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128856 () Bool)

(assert (=> b!128856 (= e!84105 (arrayContainsKey!0 (_keys!4542 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!39011 (not res!62211)) b!128855))

(assert (= (and b!128855 res!62212) b!128856))

(assert (=> d!39011 m!150559))

(assert (=> b!128856 m!149355))

(declare-fun m!151155 () Bool)

(assert (=> b!128856 m!151155))

(assert (=> b!128276 d!39011))

(assert (=> b!128147 d!38735))

(declare-fun d!39013 () Bool)

(declare-fun res!62213 () Bool)

(declare-fun e!84106 () Bool)

(assert (=> d!39013 (=> res!62213 e!84106)))

(assert (=> d!39013 (= res!62213 (and ((_ is Cons!1700) (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) (= (_1!1309 (h!2303 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66149)))))

(assert (=> d!39013 (= (containsKey!172 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66149) e!84106)))

(declare-fun b!128857 () Bool)

(declare-fun e!84107 () Bool)

(assert (=> b!128857 (= e!84106 e!84107)))

(declare-fun res!62214 () Bool)

(assert (=> b!128857 (=> (not res!62214) (not e!84107))))

(assert (=> b!128857 (= res!62214 (and (or (not ((_ is Cons!1700) (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) (bvsle (_1!1309 (h!2303 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66149)) ((_ is Cons!1700) (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) (bvslt (_1!1309 (h!2303 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))) lt!66149)))))

(declare-fun b!128858 () Bool)

(assert (=> b!128858 (= e!84107 (containsKey!172 (t!6083 (toList!861 (+!171 lt!66160 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))) lt!66149))))

(assert (= (and d!39013 (not res!62213)) b!128857))

(assert (= (and b!128857 res!62214) b!128858))

(declare-fun m!151157 () Bool)

(assert (=> b!128858 m!151157))

(assert (=> d!38621 d!39013))

(declare-fun b!128861 () Bool)

(declare-fun res!62217 () Bool)

(declare-fun e!84108 () Bool)

(assert (=> b!128861 (=> (not res!62217) (not e!84108))))

(assert (=> b!128861 (= res!62217 (= (size!2506 (_2!1310 lt!66078)) (bvadd (_size!586 (_2!1310 lt!66078)) (bvsdiv (bvadd (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!128859 () Bool)

(declare-fun res!62216 () Bool)

(assert (=> b!128859 (=> (not res!62216) (not e!84108))))

(assert (=> b!128859 (= res!62216 (and (= (size!2503 (_values!2788 (_2!1310 lt!66078))) (bvadd (mask!7073 (_2!1310 lt!66078)) #b00000000000000000000000000000001)) (= (size!2502 (_keys!4542 (_2!1310 lt!66078))) (size!2503 (_values!2788 (_2!1310 lt!66078)))) (bvsge (_size!586 (_2!1310 lt!66078)) #b00000000000000000000000000000000) (bvsle (_size!586 (_2!1310 lt!66078)) (bvadd (mask!7073 (_2!1310 lt!66078)) #b00000000000000000000000000000001))))))

(declare-fun b!128860 () Bool)

(declare-fun res!62218 () Bool)

(assert (=> b!128860 (=> (not res!62218) (not e!84108))))

(assert (=> b!128860 (= res!62218 (bvsge (size!2506 (_2!1310 lt!66078)) (_size!586 (_2!1310 lt!66078))))))

(declare-fun b!128862 () Bool)

(assert (=> b!128862 (= e!84108 (and (bvsge (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000000) (bvsle (extraKeys!2582 (_2!1310 lt!66078)) #b00000000000000000000000000000011) (bvsge (_vacant!586 (_2!1310 lt!66078)) #b00000000000000000000000000000000)))))

(declare-fun d!39015 () Bool)

(declare-fun res!62215 () Bool)

(assert (=> d!39015 (=> (not res!62215) (not e!84108))))

(assert (=> d!39015 (= res!62215 (validMask!0 (mask!7073 (_2!1310 lt!66078))))))

(assert (=> d!39015 (= (simpleValid!88 (_2!1310 lt!66078)) e!84108)))

(assert (= (and d!39015 res!62215) b!128859))

(assert (= (and b!128859 res!62216) b!128860))

(assert (= (and b!128860 res!62218) b!128861))

(assert (= (and b!128861 res!62217) b!128862))

(declare-fun m!151159 () Bool)

(assert (=> b!128861 m!151159))

(assert (=> b!128860 m!151159))

(assert (=> d!39015 m!150841))

(assert (=> d!38683 d!39015))

(declare-fun d!39017 () Bool)

(declare-fun e!84110 () Bool)

(assert (=> d!39017 e!84110))

(declare-fun res!62219 () Bool)

(assert (=> d!39017 (=> res!62219 e!84110)))

(declare-fun lt!66813 () Bool)

(assert (=> d!39017 (= res!62219 (not lt!66813))))

(declare-fun lt!66816 () Bool)

(assert (=> d!39017 (= lt!66813 lt!66816)))

(declare-fun lt!66815 () Unit!3981)

(declare-fun e!84109 () Unit!3981)

(assert (=> d!39017 (= lt!66815 e!84109)))

(declare-fun c!23673 () Bool)

(assert (=> d!39017 (= c!23673 lt!66816)))

(assert (=> d!39017 (= lt!66816 (containsKey!172 (toList!861 lt!66266) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!39017 (= (contains!884 lt!66266 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66813)))

(declare-fun b!128863 () Bool)

(declare-fun lt!66814 () Unit!3981)

(assert (=> b!128863 (= e!84109 lt!66814)))

(assert (=> b!128863 (= lt!66814 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66266) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> b!128863 (isDefined!121 (getValueByKey!168 (toList!861 lt!66266) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128864 () Bool)

(declare-fun Unit!4024 () Unit!3981)

(assert (=> b!128864 (= e!84109 Unit!4024)))

(declare-fun b!128865 () Bool)

(assert (=> b!128865 (= e!84110 (isDefined!121 (getValueByKey!168 (toList!861 lt!66266) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!39017 c!23673) b!128863))

(assert (= (and d!39017 (not c!23673)) b!128864))

(assert (= (and d!39017 (not res!62219)) b!128865))

(declare-fun m!151161 () Bool)

(assert (=> d!39017 m!151161))

(declare-fun m!151163 () Bool)

(assert (=> b!128863 m!151163))

(assert (=> b!128863 m!149749))

(assert (=> b!128863 m!149749))

(declare-fun m!151165 () Bool)

(assert (=> b!128863 m!151165))

(assert (=> b!128865 m!149749))

(assert (=> b!128865 m!149749))

(assert (=> b!128865 m!151165))

(assert (=> d!38623 d!39017))

(declare-fun c!23674 () Bool)

(declare-fun d!39019 () Bool)

(assert (=> d!39019 (= c!23674 (and ((_ is Cons!1700) lt!66269) (= (_1!1309 (h!2303 lt!66269)) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!84111 () Option!174)

(assert (=> d!39019 (= (getValueByKey!168 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!84111)))

(declare-fun b!128867 () Bool)

(declare-fun e!84112 () Option!174)

(assert (=> b!128867 (= e!84111 e!84112)))

(declare-fun c!23675 () Bool)

(assert (=> b!128867 (= c!23675 (and ((_ is Cons!1700) lt!66269) (not (= (_1!1309 (h!2303 lt!66269)) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128868 () Bool)

(assert (=> b!128868 (= e!84112 (getValueByKey!168 (t!6083 lt!66269) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128869 () Bool)

(assert (=> b!128869 (= e!84112 None!172)))

(declare-fun b!128866 () Bool)

(assert (=> b!128866 (= e!84111 (Some!173 (_2!1309 (h!2303 lt!66269))))))

(assert (= (and d!39019 c!23674) b!128866))

(assert (= (and d!39019 (not c!23674)) b!128867))

(assert (= (and b!128867 c!23675) b!128868))

(assert (= (and b!128867 (not c!23675)) b!128869))

(declare-fun m!151167 () Bool)

(assert (=> b!128868 m!151167))

(assert (=> d!38623 d!39019))

(declare-fun d!39021 () Bool)

(assert (=> d!39021 (= (getValueByKey!168 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66817 () Unit!3981)

(assert (=> d!39021 (= lt!66817 (choose!783 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun e!84113 () Bool)

(assert (=> d!39021 e!84113))

(declare-fun res!62220 () Bool)

(assert (=> d!39021 (=> (not res!62220) (not e!84113))))

(assert (=> d!39021 (= res!62220 (isStrictlySorted!318 lt!66269))))

(assert (=> d!39021 (= (lemmaContainsTupThenGetReturnValue!83 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66817)))

(declare-fun b!128870 () Bool)

(declare-fun res!62221 () Bool)

(assert (=> b!128870 (=> (not res!62221) (not e!84113))))

(assert (=> b!128870 (= res!62221 (containsKey!172 lt!66269 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128871 () Bool)

(assert (=> b!128871 (= e!84113 (contains!886 lt!66269 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!39021 res!62220) b!128870))

(assert (= (and b!128870 res!62221) b!128871))

(assert (=> d!39021 m!149743))

(declare-fun m!151169 () Bool)

(assert (=> d!39021 m!151169))

(declare-fun m!151171 () Bool)

(assert (=> d!39021 m!151171))

(declare-fun m!151173 () Bool)

(assert (=> b!128870 m!151173))

(declare-fun m!151175 () Bool)

(assert (=> b!128871 m!151175))

(assert (=> d!38623 d!39021))

(declare-fun c!23676 () Bool)

(declare-fun c!23677 () Bool)

(declare-fun b!128872 () Bool)

(declare-fun e!84115 () List!1704)

(assert (=> b!128872 (= e!84115 (ite c!23677 (t!6083 (toList!861 lt!66153)) (ite c!23676 (Cons!1700 (h!2303 (toList!861 lt!66153)) (t!6083 (toList!861 lt!66153))) Nil!1701)))))

(declare-fun b!128873 () Bool)

(declare-fun e!84117 () List!1704)

(declare-fun e!84114 () List!1704)

(assert (=> b!128873 (= e!84117 e!84114)))

(assert (=> b!128873 (= c!23677 (and ((_ is Cons!1700) (toList!861 lt!66153)) (= (_1!1309 (h!2303 (toList!861 lt!66153))) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128874 () Bool)

(assert (=> b!128874 (= e!84115 (insertStrictlySorted!86 (t!6083 (toList!861 lt!66153)) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128875 () Bool)

(declare-fun res!62223 () Bool)

(declare-fun e!84116 () Bool)

(assert (=> b!128875 (=> (not res!62223) (not e!84116))))

(declare-fun lt!66818 () List!1704)

(assert (=> b!128875 (= res!62223 (containsKey!172 lt!66818 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun bm!13960 () Bool)

(declare-fun call!13963 () List!1704)

(declare-fun call!13965 () List!1704)

(assert (=> bm!13960 (= call!13963 call!13965)))

(declare-fun b!128876 () Bool)

(declare-fun e!84118 () List!1704)

(declare-fun call!13964 () List!1704)

(assert (=> b!128876 (= e!84118 call!13964)))

(declare-fun b!128877 () Bool)

(assert (=> b!128877 (= e!84118 call!13964)))

(declare-fun b!128878 () Bool)

(assert (=> b!128878 (= c!23676 (and ((_ is Cons!1700) (toList!861 lt!66153)) (bvsgt (_1!1309 (h!2303 (toList!861 lt!66153))) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> b!128878 (= e!84114 e!84118)))

(declare-fun b!128879 () Bool)

(assert (=> b!128879 (= e!84114 call!13963)))

(declare-fun b!128880 () Bool)

(assert (=> b!128880 (= e!84117 call!13965)))

(declare-fun b!128881 () Bool)

(assert (=> b!128881 (= e!84116 (contains!886 lt!66818 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun bm!13962 () Bool)

(declare-fun c!23679 () Bool)

(assert (=> bm!13962 (= call!13965 ($colon$colon!90 e!84115 (ite c!23679 (h!2303 (toList!861 lt!66153)) (tuple2!2597 (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun c!23678 () Bool)

(assert (=> bm!13962 (= c!23678 c!23679)))

(declare-fun d!39023 () Bool)

(assert (=> d!39023 e!84116))

(declare-fun res!62222 () Bool)

(assert (=> d!39023 (=> (not res!62222) (not e!84116))))

(assert (=> d!39023 (= res!62222 (isStrictlySorted!318 lt!66818))))

(assert (=> d!39023 (= lt!66818 e!84117)))

(assert (=> d!39023 (= c!23679 (and ((_ is Cons!1700) (toList!861 lt!66153)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66153))) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!39023 (isStrictlySorted!318 (toList!861 lt!66153))))

(assert (=> d!39023 (= (insertStrictlySorted!86 (toList!861 lt!66153) (_1!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66152 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66818)))

(declare-fun bm!13961 () Bool)

(assert (=> bm!13961 (= call!13964 call!13963)))

(assert (= (and d!39023 c!23679) b!128880))

(assert (= (and d!39023 (not c!23679)) b!128873))

(assert (= (and b!128873 c!23677) b!128879))

(assert (= (and b!128873 (not c!23677)) b!128878))

(assert (= (and b!128878 c!23676) b!128876))

(assert (= (and b!128878 (not c!23676)) b!128877))

(assert (= (or b!128876 b!128877) bm!13961))

(assert (= (or b!128879 bm!13961) bm!13960))

(assert (= (or b!128880 bm!13960) bm!13962))

(assert (= (and bm!13962 c!23678) b!128874))

(assert (= (and bm!13962 (not c!23678)) b!128872))

(assert (= (and d!39023 res!62222) b!128875))

(assert (= (and b!128875 res!62223) b!128881))

(declare-fun m!151177 () Bool)

(assert (=> b!128881 m!151177))

(declare-fun m!151179 () Bool)

(assert (=> b!128874 m!151179))

(declare-fun m!151181 () Bool)

(assert (=> d!39023 m!151181))

(declare-fun m!151183 () Bool)

(assert (=> d!39023 m!151183))

(declare-fun m!151185 () Bool)

(assert (=> b!128875 m!151185))

(declare-fun m!151187 () Bool)

(assert (=> bm!13962 m!151187))

(assert (=> d!38623 d!39023))

(declare-fun d!39025 () Bool)

(declare-fun c!23680 () Bool)

(assert (=> d!39025 (= c!23680 (and ((_ is Cons!1700) (toList!861 lt!66271)) (= (_1!1309 (h!2303 (toList!861 lt!66271))) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!84119 () Option!174)

(assert (=> d!39025 (= (getValueByKey!168 (toList!861 lt!66271) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!84119)))

(declare-fun b!128883 () Bool)

(declare-fun e!84120 () Option!174)

(assert (=> b!128883 (= e!84119 e!84120)))

(declare-fun c!23681 () Bool)

(assert (=> b!128883 (= c!23681 (and ((_ is Cons!1700) (toList!861 lt!66271)) (not (= (_1!1309 (h!2303 (toList!861 lt!66271))) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128884 () Bool)

(assert (=> b!128884 (= e!84120 (getValueByKey!168 (t!6083 (toList!861 lt!66271)) (_1!1309 (tuple2!2597 lt!66144 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128885 () Bool)

(assert (=> b!128885 (= e!84120 None!172)))

(declare-fun b!128882 () Bool)

(assert (=> b!128882 (= e!84119 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66271)))))))

(assert (= (and d!39025 c!23680) b!128882))

(assert (= (and d!39025 (not c!23680)) b!128883))

(assert (= (and b!128883 c!23681) b!128884))

(assert (= (and b!128883 (not c!23681)) b!128885))

(declare-fun m!151189 () Bool)

(assert (=> b!128884 m!151189))

(assert (=> b!128089 d!39025))

(declare-fun d!39027 () Bool)

(assert (=> d!39027 (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))

(declare-fun lt!66821 () Unit!3981)

(declare-fun choose!784 (array!4725 array!4727 (_ BitVec 32) (_ BitVec 32) V!3451 V!3451 (_ BitVec 64) (_ BitVec 32) Int) Unit!3981)

(assert (=> d!39027 (= lt!66821 (choose!784 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(assert (=> d!39027 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!39027 (= (lemmaArrayContainsKeyThenInListMap!38 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66821)))

(declare-fun bs!5337 () Bool)

(assert (= bs!5337 d!39027))

(assert (=> bs!5337 m!149437))

(assert (=> bs!5337 m!149437))

(assert (=> bs!5337 m!149355))

(assert (=> bs!5337 m!149949))

(assert (=> bs!5337 m!149355))

(declare-fun m!151191 () Bool)

(assert (=> bs!5337 m!151191))

(assert (=> bs!5337 m!149599))

(assert (=> b!128213 d!39027))

(assert (=> b!128213 d!38769))

(assert (=> b!128213 d!38611))

(declare-fun d!39029 () Bool)

(declare-fun e!84122 () Bool)

(assert (=> d!39029 e!84122))

(declare-fun res!62224 () Bool)

(assert (=> d!39029 (=> res!62224 e!84122)))

(declare-fun lt!66822 () Bool)

(assert (=> d!39029 (= res!62224 (not lt!66822))))

(declare-fun lt!66825 () Bool)

(assert (=> d!39029 (= lt!66822 lt!66825)))

(declare-fun lt!66824 () Unit!3981)

(declare-fun e!84121 () Unit!3981)

(assert (=> d!39029 (= lt!66824 e!84121)))

(declare-fun c!23682 () Bool)

(assert (=> d!39029 (= c!23682 lt!66825)))

(assert (=> d!39029 (= lt!66825 (containsKey!172 (toList!861 lt!66244) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39029 (= (contains!884 lt!66244 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) lt!66822)))

(declare-fun b!128886 () Bool)

(declare-fun lt!66823 () Unit!3981)

(assert (=> b!128886 (= e!84121 lt!66823)))

(assert (=> b!128886 (= lt!66823 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66244) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128886 (isDefined!121 (getValueByKey!168 (toList!861 lt!66244) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128887 () Bool)

(declare-fun Unit!4025 () Unit!3981)

(assert (=> b!128887 (= e!84121 Unit!4025)))

(declare-fun b!128888 () Bool)

(assert (=> b!128888 (= e!84122 (isDefined!121 (getValueByKey!168 (toList!861 lt!66244) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39029 c!23682) b!128886))

(assert (= (and d!39029 (not c!23682)) b!128887))

(assert (= (and d!39029 (not res!62224)) b!128888))

(assert (=> d!39029 m!149547))

(declare-fun m!151193 () Bool)

(assert (=> d!39029 m!151193))

(assert (=> b!128886 m!149547))

(declare-fun m!151195 () Bool)

(assert (=> b!128886 m!151195))

(assert (=> b!128886 m!149547))

(assert (=> b!128886 m!150129))

(assert (=> b!128886 m!150129))

(declare-fun m!151197 () Bool)

(assert (=> b!128886 m!151197))

(assert (=> b!128888 m!149547))

(assert (=> b!128888 m!150129))

(assert (=> b!128888 m!150129))

(assert (=> b!128888 m!151197))

(assert (=> b!128065 d!39029))

(assert (=> b!128232 d!38703))

(declare-fun d!39031 () Bool)

(assert (=> d!39031 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!66826 () Unit!3981)

(assert (=> d!39031 (= lt!66826 (choose!780 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!84123 () Bool)

(assert (=> d!39031 e!84123))

(declare-fun res!62225 () Bool)

(assert (=> d!39031 (=> (not res!62225) (not e!84123))))

(assert (=> d!39031 (= res!62225 (isStrictlySorted!318 (toList!861 lt!66157)))))

(assert (=> d!39031 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66826)))

(declare-fun b!128889 () Bool)

(assert (=> b!128889 (= e!84123 (containsKey!172 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39031 res!62225) b!128889))

(assert (=> d!39031 m!149485))

(assert (=> d!39031 m!149609))

(assert (=> d!39031 m!149609))

(assert (=> d!39031 m!149611))

(assert (=> d!39031 m!149485))

(declare-fun m!151199 () Bool)

(assert (=> d!39031 m!151199))

(declare-fun m!151201 () Bool)

(assert (=> d!39031 m!151201))

(assert (=> b!128889 m!149485))

(assert (=> b!128889 m!149605))

(assert (=> b!127960 d!39031))

(assert (=> b!127960 d!38741))

(assert (=> b!127960 d!38743))

(declare-fun d!39033 () Bool)

(declare-fun isEmpty!401 (List!1704) Bool)

(assert (=> d!39033 (= (isEmpty!400 lt!66219) (isEmpty!401 (toList!861 lt!66219)))))

(declare-fun bs!5338 () Bool)

(assert (= bs!5338 d!39033))

(declare-fun m!151203 () Bool)

(assert (=> bs!5338 m!151203))

(assert (=> b!128050 d!39033))

(declare-fun d!39035 () Bool)

(assert (=> d!39035 (arrayContainsKey!0 (_keys!4542 newMap!16) lt!66317 #b00000000000000000000000000000000)))

(declare-fun lt!66827 () Unit!3981)

(assert (=> d!39035 (= lt!66827 (choose!13 (_keys!4542 newMap!16) lt!66317 #b00000000000000000000000000000000))))

(assert (=> d!39035 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!39035 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4542 newMap!16) lt!66317 #b00000000000000000000000000000000) lt!66827)))

(declare-fun bs!5339 () Bool)

(assert (= bs!5339 d!39035))

(assert (=> bs!5339 m!149871))

(declare-fun m!151205 () Bool)

(assert (=> bs!5339 m!151205))

(assert (=> b!128133 d!39035))

(declare-fun d!39037 () Bool)

(declare-fun res!62226 () Bool)

(declare-fun e!84124 () Bool)

(assert (=> d!39037 (=> res!62226 e!84124)))

(assert (=> d!39037 (= res!62226 (= (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) lt!66317))))

(assert (=> d!39037 (= (arrayContainsKey!0 (_keys!4542 newMap!16) lt!66317 #b00000000000000000000000000000000) e!84124)))

(declare-fun b!128890 () Bool)

(declare-fun e!84125 () Bool)

(assert (=> b!128890 (= e!84124 e!84125)))

(declare-fun res!62227 () Bool)

(assert (=> b!128890 (=> (not res!62227) (not e!84125))))

(assert (=> b!128890 (= res!62227 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128891 () Bool)

(assert (=> b!128891 (= e!84125 (arrayContainsKey!0 (_keys!4542 newMap!16) lt!66317 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39037 (not res!62226)) b!128890))

(assert (= (and b!128890 res!62227) b!128891))

(assert (=> d!39037 m!149547))

(declare-fun m!151207 () Bool)

(assert (=> b!128891 m!151207))

(assert (=> b!128133 d!39037))

(declare-fun b!128892 () Bool)

(declare-fun e!84128 () SeekEntryResult!271)

(declare-fun lt!66830 () SeekEntryResult!271)

(assert (=> b!128892 (= e!84128 (seekKeyOrZeroReturnVacant!0 (x!15122 lt!66830) (index!3242 lt!66830) (index!3242 lt!66830) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!128893 () Bool)

(assert (=> b!128893 (= e!84128 (MissingZero!271 (index!3242 lt!66830)))))

(declare-fun d!39039 () Bool)

(declare-fun lt!66828 () SeekEntryResult!271)

(assert (=> d!39039 (and (or ((_ is Undefined!271) lt!66828) (not ((_ is Found!271) lt!66828)) (and (bvsge (index!3241 lt!66828) #b00000000000000000000000000000000) (bvslt (index!3241 lt!66828) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66828) ((_ is Found!271) lt!66828) (not ((_ is MissingZero!271) lt!66828)) (and (bvsge (index!3240 lt!66828) #b00000000000000000000000000000000) (bvslt (index!3240 lt!66828) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66828) ((_ is Found!271) lt!66828) ((_ is MissingZero!271) lt!66828) (not ((_ is MissingVacant!271) lt!66828)) (and (bvsge (index!3243 lt!66828) #b00000000000000000000000000000000) (bvslt (index!3243 lt!66828) (size!2502 (_keys!4542 newMap!16))))) (or ((_ is Undefined!271) lt!66828) (ite ((_ is Found!271) lt!66828) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66828)) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!271) lt!66828) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3240 lt!66828)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!271) lt!66828) (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3243 lt!66828)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84127 () SeekEntryResult!271)

(assert (=> d!39039 (= lt!66828 e!84127)))

(declare-fun c!23684 () Bool)

(assert (=> d!39039 (= c!23684 (and ((_ is Intermediate!271) lt!66830) (undefined!1083 lt!66830)))))

(assert (=> d!39039 (= lt!66830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (mask!7073 newMap!16)) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(assert (=> d!39039 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!39039 (= (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000) (_keys!4542 newMap!16) (mask!7073 newMap!16)) lt!66828)))

(declare-fun b!128894 () Bool)

(declare-fun e!84126 () SeekEntryResult!271)

(assert (=> b!128894 (= e!84126 (Found!271 (index!3242 lt!66830)))))

(declare-fun b!128895 () Bool)

(assert (=> b!128895 (= e!84127 Undefined!271)))

(declare-fun b!128896 () Bool)

(assert (=> b!128896 (= e!84127 e!84126)))

(declare-fun lt!66829 () (_ BitVec 64))

(assert (=> b!128896 (= lt!66829 (select (arr!2237 (_keys!4542 newMap!16)) (index!3242 lt!66830)))))

(declare-fun c!23683 () Bool)

(assert (=> b!128896 (= c!23683 (= lt!66829 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128897 () Bool)

(declare-fun c!23685 () Bool)

(assert (=> b!128897 (= c!23685 (= lt!66829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128897 (= e!84126 e!84128)))

(assert (= (and d!39039 c!23684) b!128895))

(assert (= (and d!39039 (not c!23684)) b!128896))

(assert (= (and b!128896 c!23683) b!128894))

(assert (= (and b!128896 (not c!23683)) b!128897))

(assert (= (and b!128897 c!23685) b!128893))

(assert (= (and b!128897 (not c!23685)) b!128892))

(assert (=> b!128892 m!149547))

(declare-fun m!151209 () Bool)

(assert (=> b!128892 m!151209))

(assert (=> d!39039 m!149599))

(declare-fun m!151211 () Bool)

(assert (=> d!39039 m!151211))

(assert (=> d!39039 m!149547))

(declare-fun m!151213 () Bool)

(assert (=> d!39039 m!151213))

(declare-fun m!151215 () Bool)

(assert (=> d!39039 m!151215))

(assert (=> d!39039 m!149547))

(assert (=> d!39039 m!151211))

(declare-fun m!151217 () Bool)

(assert (=> d!39039 m!151217))

(declare-fun m!151219 () Bool)

(assert (=> d!39039 m!151219))

(declare-fun m!151221 () Bool)

(assert (=> b!128896 m!151221))

(assert (=> b!128133 d!39039))

(assert (=> d!38671 d!38599))

(declare-fun d!39041 () Bool)

(declare-fun e!84131 () Bool)

(assert (=> d!39041 e!84131))

(declare-fun res!62232 () Bool)

(assert (=> d!39041 (=> (not res!62232) (not e!84131))))

(declare-fun lt!66833 () SeekEntryResult!271)

(assert (=> d!39041 (= res!62232 ((_ is Found!271) lt!66833))))

(assert (=> d!39041 (= lt!66833 (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(assert (=> d!39041 true))

(declare-fun _$33!108 () Unit!3981)

(assert (=> d!39041 (= (choose!779 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (defaultEntry!2805 newMap!16)) _$33!108)))

(declare-fun b!128902 () Bool)

(declare-fun res!62233 () Bool)

(assert (=> b!128902 (=> (not res!62233) (not e!84131))))

(assert (=> b!128902 (= res!62233 (inRange!0 (index!3241 lt!66833) (mask!7073 newMap!16)))))

(declare-fun b!128903 () Bool)

(assert (=> b!128903 (= e!84131 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66833)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!39041 res!62232) b!128902))

(assert (= (and b!128902 res!62233) b!128903))

(assert (=> d!39041 m!149355))

(assert (=> d!39041 m!149427))

(declare-fun m!151223 () Bool)

(assert (=> b!128902 m!151223))

(declare-fun m!151225 () Bool)

(assert (=> b!128903 m!151225))

(assert (=> d!38671 d!39041))

(assert (=> d!38671 d!38791))

(assert (=> b!128150 d!38735))

(declare-fun d!39043 () Bool)

(declare-fun res!62234 () Bool)

(declare-fun e!84132 () Bool)

(assert (=> d!39043 (=> res!62234 e!84132)))

(assert (=> d!39043 (= res!62234 (and ((_ is Cons!1700) (toList!861 call!13805)) (= (_1!1309 (h!2303 (toList!861 call!13805))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))))

(assert (=> d!39043 (= (containsKey!172 (toList!861 call!13805) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))) e!84132)))

(declare-fun b!128904 () Bool)

(declare-fun e!84133 () Bool)

(assert (=> b!128904 (= e!84132 e!84133)))

(declare-fun res!62235 () Bool)

(assert (=> b!128904 (=> (not res!62235) (not e!84133))))

(assert (=> b!128904 (= res!62235 (and (or (not ((_ is Cons!1700) (toList!861 call!13805))) (bvsle (_1!1309 (h!2303 (toList!861 call!13805))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))) ((_ is Cons!1700) (toList!861 call!13805)) (bvslt (_1!1309 (h!2303 (toList!861 call!13805))) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))))

(declare-fun b!128905 () Bool)

(assert (=> b!128905 (= e!84133 (containsKey!172 (t!6083 (toList!861 call!13805)) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072))))))

(assert (= (and d!39043 (not res!62234)) b!128904))

(assert (= (and b!128904 res!62235) b!128905))

(assert (=> b!128905 m!149471))

(declare-fun m!151227 () Bool)

(assert (=> b!128905 m!151227))

(assert (=> d!38655 d!39043))

(declare-fun d!39045 () Bool)

(declare-fun e!84135 () Bool)

(assert (=> d!39045 e!84135))

(declare-fun res!62236 () Bool)

(assert (=> d!39045 (=> res!62236 e!84135)))

(declare-fun lt!66834 () Bool)

(assert (=> d!39045 (= res!62236 (not lt!66834))))

(declare-fun lt!66837 () Bool)

(assert (=> d!39045 (= lt!66834 lt!66837)))

(declare-fun lt!66836 () Unit!3981)

(declare-fun e!84134 () Unit!3981)

(assert (=> d!39045 (= lt!66836 e!84134)))

(declare-fun c!23686 () Bool)

(assert (=> d!39045 (= c!23686 lt!66837)))

(assert (=> d!39045 (= lt!66837 (containsKey!172 (toList!861 lt!66336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39045 (= (contains!884 lt!66336 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66834)))

(declare-fun b!128906 () Bool)

(declare-fun lt!66835 () Unit!3981)

(assert (=> b!128906 (= e!84134 lt!66835)))

(assert (=> b!128906 (= lt!66835 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128906 (isDefined!121 (getValueByKey!168 (toList!861 lt!66336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128907 () Bool)

(declare-fun Unit!4026 () Unit!3981)

(assert (=> b!128907 (= e!84134 Unit!4026)))

(declare-fun b!128908 () Bool)

(assert (=> b!128908 (= e!84135 (isDefined!121 (getValueByKey!168 (toList!861 lt!66336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39045 c!23686) b!128906))

(assert (= (and d!39045 (not c!23686)) b!128907))

(assert (= (and d!39045 (not res!62236)) b!128908))

(declare-fun m!151229 () Bool)

(assert (=> d!39045 m!151229))

(declare-fun m!151231 () Bool)

(assert (=> b!128906 m!151231))

(assert (=> b!128906 m!150531))

(assert (=> b!128906 m!150531))

(declare-fun m!151233 () Bool)

(assert (=> b!128906 m!151233))

(assert (=> b!128908 m!150531))

(assert (=> b!128908 m!150531))

(assert (=> b!128908 m!151233))

(assert (=> bm!13864 d!39045))

(declare-fun d!39047 () Bool)

(assert (=> d!39047 (contains!884 (getCurrentListMap!539 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (select (arr!2237 (_keys!4542 newMap!16)) (index!3241 lt!66072)))))

(assert (=> d!39047 true))

(declare-fun _$16!145 () Unit!3981)

(assert (=> d!39047 (= (choose!777 (_keys!4542 newMap!16) lt!66094 (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) (index!3241 lt!66072) (defaultEntry!2805 newMap!16)) _$16!145)))

(declare-fun bs!5340 () Bool)

(assert (= bs!5340 d!39047))

(assert (=> bs!5340 m!149859))

(assert (=> bs!5340 m!149471))

(assert (=> bs!5340 m!149859))

(assert (=> bs!5340 m!149471))

(assert (=> bs!5340 m!149861))

(assert (=> d!38657 d!39047))

(assert (=> d!38657 d!38791))

(declare-fun b!128909 () Bool)

(declare-fun e!84138 () Bool)

(declare-fun e!84137 () Bool)

(assert (=> b!128909 (= e!84138 e!84137)))

(declare-fun lt!66840 () (_ BitVec 64))

(assert (=> b!128909 (= lt!66840 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!66838 () Unit!3981)

(assert (=> b!128909 (= lt!66838 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) lt!66840 #b00000000000000000000000000000000))))

(assert (=> b!128909 (arrayContainsKey!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) lt!66840 #b00000000000000000000000000000000)))

(declare-fun lt!66839 () Unit!3981)

(assert (=> b!128909 (= lt!66839 lt!66838)))

(declare-fun res!62237 () Bool)

(assert (=> b!128909 (= res!62237 (= (seekEntryOrOpen!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000) (_keys!4542 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992)))) (Found!271 #b00000000000000000000000000000000)))))

(assert (=> b!128909 (=> (not res!62237) (not e!84137))))

(declare-fun bm!13963 () Bool)

(declare-fun call!13966 () Bool)

(assert (=> bm!13963 (= call!13966 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4542 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992)))))))

(declare-fun b!128910 () Bool)

(assert (=> b!128910 (= e!84137 call!13966)))

(declare-fun d!39049 () Bool)

(declare-fun res!62238 () Bool)

(declare-fun e!84136 () Bool)

(assert (=> d!39049 (=> res!62238 e!84136)))

(assert (=> d!39049 (= res!62238 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!39049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (mask!7073 (v!3146 (underlying!445 thiss!992)))) e!84136)))

(declare-fun b!128911 () Bool)

(assert (=> b!128911 (= e!84138 call!13966)))

(declare-fun b!128912 () Bool)

(assert (=> b!128912 (= e!84136 e!84138)))

(declare-fun c!23687 () Bool)

(assert (=> b!128912 (= c!23687 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!39049 (not res!62238)) b!128912))

(assert (= (and b!128912 c!23687) b!128909))

(assert (= (and b!128912 (not c!23687)) b!128911))

(assert (= (and b!128909 res!62237) b!128910))

(assert (= (or b!128910 b!128911) bm!13963))

(assert (=> b!128909 m!150885))

(declare-fun m!151235 () Bool)

(assert (=> b!128909 m!151235))

(declare-fun m!151237 () Bool)

(assert (=> b!128909 m!151237))

(assert (=> b!128909 m!150885))

(declare-fun m!151239 () Bool)

(assert (=> b!128909 m!151239))

(declare-fun m!151241 () Bool)

(assert (=> bm!13963 m!151241))

(assert (=> b!128912 m!150885))

(assert (=> b!128912 m!150885))

(assert (=> b!128912 m!150887))

(assert (=> b!128245 d!39049))

(declare-fun d!39051 () Bool)

(assert (=> d!39051 (= (apply!112 lt!66244 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5341 () Bool)

(assert (= bs!5341 d!39051))

(declare-fun m!151243 () Bool)

(assert (=> bs!5341 m!151243))

(assert (=> bs!5341 m!151243))

(declare-fun m!151245 () Bool)

(assert (=> bs!5341 m!151245))

(assert (=> b!128067 d!39051))

(assert (=> d!38697 d!38791))

(declare-fun b!128913 () Bool)

(declare-fun e!84139 () (_ BitVec 32))

(declare-fun call!13967 () (_ BitVec 32))

(assert (=> b!128913 (= e!84139 call!13967)))

(declare-fun bm!13964 () Bool)

(assert (=> bm!13964 (= call!13967 (arrayCountValidKeys!0 (_keys!4542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!128914 () Bool)

(declare-fun e!84140 () (_ BitVec 32))

(assert (=> b!128914 (= e!84140 e!84139)))

(declare-fun c!23688 () Bool)

(assert (=> b!128914 (= c!23688 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!39053 () Bool)

(declare-fun lt!66841 () (_ BitVec 32))

(assert (=> d!39053 (and (bvsge lt!66841 #b00000000000000000000000000000000) (bvsle lt!66841 (bvsub (size!2502 (_keys!4542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!39053 (= lt!66841 e!84140)))

(declare-fun c!23689 () Bool)

(assert (=> d!39053 (= c!23689 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!39053 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2502 (_keys!4542 newMap!16)) (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!39053 (= (arrayCountValidKeys!0 (_keys!4542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 newMap!16))) lt!66841)))

(declare-fun b!128915 () Bool)

(assert (=> b!128915 (= e!84139 (bvadd #b00000000000000000000000000000001 call!13967))))

(declare-fun b!128916 () Bool)

(assert (=> b!128916 (= e!84140 #b00000000000000000000000000000000)))

(assert (= (and d!39053 c!23689) b!128916))

(assert (= (and d!39053 (not c!23689)) b!128914))

(assert (= (and b!128914 c!23688) b!128915))

(assert (= (and b!128914 (not c!23688)) b!128913))

(assert (= (or b!128915 b!128913) bm!13964))

(declare-fun m!151247 () Bool)

(assert (=> bm!13964 m!151247))

(assert (=> b!128914 m!150559))

(assert (=> b!128914 m!150559))

(assert (=> b!128914 m!150569))

(assert (=> bm!13855 d!39053))

(assert (=> b!128081 d!38839))

(assert (=> b!128081 d!38841))

(assert (=> b!128045 d!38681))

(declare-fun d!39055 () Bool)

(declare-fun e!84141 () Bool)

(assert (=> d!39055 e!84141))

(declare-fun res!62240 () Bool)

(assert (=> d!39055 (=> (not res!62240) (not e!84141))))

(declare-fun lt!66842 () ListLongMap!1691)

(assert (=> d!39055 (= res!62240 (contains!884 lt!66842 (_1!1309 (tuple2!2597 lt!66225 lt!66220))))))

(declare-fun lt!66845 () List!1704)

(assert (=> d!39055 (= lt!66842 (ListLongMap!1692 lt!66845))))

(declare-fun lt!66844 () Unit!3981)

(declare-fun lt!66843 () Unit!3981)

(assert (=> d!39055 (= lt!66844 lt!66843)))

(assert (=> d!39055 (= (getValueByKey!168 lt!66845 (_1!1309 (tuple2!2597 lt!66225 lt!66220))) (Some!173 (_2!1309 (tuple2!2597 lt!66225 lt!66220))))))

(assert (=> d!39055 (= lt!66843 (lemmaContainsTupThenGetReturnValue!83 lt!66845 (_1!1309 (tuple2!2597 lt!66225 lt!66220)) (_2!1309 (tuple2!2597 lt!66225 lt!66220))))))

(assert (=> d!39055 (= lt!66845 (insertStrictlySorted!86 (toList!861 lt!66221) (_1!1309 (tuple2!2597 lt!66225 lt!66220)) (_2!1309 (tuple2!2597 lt!66225 lt!66220))))))

(assert (=> d!39055 (= (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220)) lt!66842)))

(declare-fun b!128917 () Bool)

(declare-fun res!62239 () Bool)

(assert (=> b!128917 (=> (not res!62239) (not e!84141))))

(assert (=> b!128917 (= res!62239 (= (getValueByKey!168 (toList!861 lt!66842) (_1!1309 (tuple2!2597 lt!66225 lt!66220))) (Some!173 (_2!1309 (tuple2!2597 lt!66225 lt!66220)))))))

(declare-fun b!128918 () Bool)

(assert (=> b!128918 (= e!84141 (contains!886 (toList!861 lt!66842) (tuple2!2597 lt!66225 lt!66220)))))

(assert (= (and d!39055 res!62240) b!128917))

(assert (= (and b!128917 res!62239) b!128918))

(declare-fun m!151249 () Bool)

(assert (=> d!39055 m!151249))

(declare-fun m!151251 () Bool)

(assert (=> d!39055 m!151251))

(declare-fun m!151253 () Bool)

(assert (=> d!39055 m!151253))

(declare-fun m!151255 () Bool)

(assert (=> d!39055 m!151255))

(declare-fun m!151257 () Bool)

(assert (=> b!128917 m!151257))

(declare-fun m!151259 () Bool)

(assert (=> b!128918 m!151259))

(assert (=> b!128045 d!39055))

(declare-fun d!39057 () Bool)

(declare-fun e!84143 () Bool)

(assert (=> d!39057 e!84143))

(declare-fun res!62241 () Bool)

(assert (=> d!39057 (=> res!62241 e!84143)))

(declare-fun lt!66846 () Bool)

(assert (=> d!39057 (= res!62241 (not lt!66846))))

(declare-fun lt!66849 () Bool)

(assert (=> d!39057 (= lt!66846 lt!66849)))

(declare-fun lt!66848 () Unit!3981)

(declare-fun e!84142 () Unit!3981)

(assert (=> d!39057 (= lt!66848 e!84142)))

(declare-fun c!23690 () Bool)

(assert (=> d!39057 (= c!23690 lt!66849)))

(assert (=> d!39057 (= lt!66849 (containsKey!172 (toList!861 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220))) lt!66224))))

(assert (=> d!39057 (= (contains!884 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220)) lt!66224) lt!66846)))

(declare-fun b!128919 () Bool)

(declare-fun lt!66847 () Unit!3981)

(assert (=> b!128919 (= e!84142 lt!66847)))

(assert (=> b!128919 (= lt!66847 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220))) lt!66224))))

(assert (=> b!128919 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220))) lt!66224))))

(declare-fun b!128920 () Bool)

(declare-fun Unit!4027 () Unit!3981)

(assert (=> b!128920 (= e!84142 Unit!4027)))

(declare-fun b!128921 () Bool)

(assert (=> b!128921 (= e!84143 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220))) lt!66224)))))

(assert (= (and d!39057 c!23690) b!128919))

(assert (= (and d!39057 (not c!23690)) b!128920))

(assert (= (and d!39057 (not res!62241)) b!128921))

(declare-fun m!151261 () Bool)

(assert (=> d!39057 m!151261))

(declare-fun m!151263 () Bool)

(assert (=> b!128919 m!151263))

(declare-fun m!151265 () Bool)

(assert (=> b!128919 m!151265))

(assert (=> b!128919 m!151265))

(declare-fun m!151267 () Bool)

(assert (=> b!128919 m!151267))

(assert (=> b!128921 m!151265))

(assert (=> b!128921 m!151265))

(assert (=> b!128921 m!151267))

(assert (=> b!128045 d!39057))

(declare-fun d!39059 () Bool)

(declare-fun e!84144 () Bool)

(assert (=> d!39059 e!84144))

(declare-fun res!62243 () Bool)

(assert (=> d!39059 (=> (not res!62243) (not e!84144))))

(declare-fun lt!66850 () ListLongMap!1691)

(assert (=> d!39059 (= res!62243 (contains!884 lt!66850 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66853 () List!1704)

(assert (=> d!39059 (= lt!66850 (ListLongMap!1692 lt!66853))))

(declare-fun lt!66852 () Unit!3981)

(declare-fun lt!66851 () Unit!3981)

(assert (=> d!39059 (= lt!66852 lt!66851)))

(assert (=> d!39059 (= (getValueByKey!168 lt!66853 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39059 (= lt!66851 (lemmaContainsTupThenGetReturnValue!83 lt!66853 (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39059 (= lt!66853 (insertStrictlySorted!86 (toList!861 call!13848) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39059 (= (+!171 call!13848 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66850)))

(declare-fun b!128922 () Bool)

(declare-fun res!62242 () Bool)

(assert (=> b!128922 (=> (not res!62242) (not e!84144))))

(assert (=> b!128922 (= res!62242 (= (getValueByKey!168 (toList!861 lt!66850) (_1!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128923 () Bool)

(assert (=> b!128923 (= e!84144 (contains!886 (toList!861 lt!66850) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39059 res!62243) b!128922))

(assert (= (and b!128922 res!62242) b!128923))

(declare-fun m!151269 () Bool)

(assert (=> d!39059 m!151269))

(declare-fun m!151271 () Bool)

(assert (=> d!39059 m!151271))

(declare-fun m!151273 () Bool)

(assert (=> d!39059 m!151273))

(declare-fun m!151275 () Bool)

(assert (=> d!39059 m!151275))

(declare-fun m!151277 () Bool)

(assert (=> b!128922 m!151277))

(declare-fun m!151279 () Bool)

(assert (=> b!128923 m!151279))

(assert (=> b!128045 d!39059))

(declare-fun d!39061 () Bool)

(assert (=> d!39061 (not (contains!884 (+!171 lt!66221 (tuple2!2597 lt!66225 lt!66220)) lt!66224))))

(declare-fun lt!66856 () Unit!3981)

(declare-fun choose!785 (ListLongMap!1691 (_ BitVec 64) V!3451 (_ BitVec 64)) Unit!3981)

(assert (=> d!39061 (= lt!66856 (choose!785 lt!66221 lt!66225 lt!66220 lt!66224))))

(declare-fun e!84147 () Bool)

(assert (=> d!39061 e!84147))

(declare-fun res!62246 () Bool)

(assert (=> d!39061 (=> (not res!62246) (not e!84147))))

(assert (=> d!39061 (= res!62246 (not (contains!884 lt!66221 lt!66224)))))

(assert (=> d!39061 (= (addStillNotContains!57 lt!66221 lt!66225 lt!66220 lt!66224) lt!66856)))

(declare-fun b!128927 () Bool)

(assert (=> b!128927 (= e!84147 (not (= lt!66225 lt!66224)))))

(assert (= (and d!39061 res!62246) b!128927))

(assert (=> d!39061 m!149651))

(assert (=> d!39061 m!149651))

(assert (=> d!39061 m!149653))

(declare-fun m!151281 () Bool)

(assert (=> d!39061 m!151281))

(declare-fun m!151283 () Bool)

(assert (=> d!39061 m!151283))

(assert (=> b!128045 d!39061))

(declare-fun d!39063 () Bool)

(assert (=> d!39063 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!66857 () Unit!3981)

(assert (=> d!39063 (= lt!66857 (choose!780 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84148 () Bool)

(assert (=> d!39063 e!84148))

(declare-fun res!62247 () Bool)

(assert (=> d!39063 (=> (not res!62247) (not e!84148))))

(assert (=> d!39063 (= res!62247 (isStrictlySorted!318 (toList!861 lt!66157)))))

(assert (=> d!39063 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000) lt!66857)))

(declare-fun b!128928 () Bool)

(assert (=> b!128928 (= e!84148 (containsKey!172 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39063 res!62247) b!128928))

(assert (=> d!39063 m!149821))

(assert (=> d!39063 m!149821))

(assert (=> d!39063 m!150003))

(declare-fun m!151285 () Bool)

(assert (=> d!39063 m!151285))

(assert (=> d!39063 m!151201))

(assert (=> b!128928 m!149999))

(assert (=> b!128233 d!39063))

(assert (=> b!128233 d!38879))

(assert (=> b!128233 d!38881))

(declare-fun d!39065 () Bool)

(declare-fun lt!66858 () Bool)

(assert (=> d!39065 (= lt!66858 (select (content!127 (toList!861 lt!66295)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!84150 () Bool)

(assert (=> d!39065 (= lt!66858 e!84150)))

(declare-fun res!62249 () Bool)

(assert (=> d!39065 (=> (not res!62249) (not e!84150))))

(assert (=> d!39065 (= res!62249 ((_ is Cons!1700) (toList!861 lt!66295)))))

(assert (=> d!39065 (= (contains!886 (toList!861 lt!66295) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66858)))

(declare-fun b!128929 () Bool)

(declare-fun e!84149 () Bool)

(assert (=> b!128929 (= e!84150 e!84149)))

(declare-fun res!62248 () Bool)

(assert (=> b!128929 (=> res!62248 e!84149)))

(assert (=> b!128929 (= res!62248 (= (h!2303 (toList!861 lt!66295)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128930 () Bool)

(assert (=> b!128930 (= e!84149 (contains!886 (t!6083 (toList!861 lt!66295)) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39065 res!62249) b!128929))

(assert (= (and b!128929 (not res!62248)) b!128930))

(declare-fun m!151287 () Bool)

(assert (=> d!39065 m!151287))

(declare-fun m!151289 () Bool)

(assert (=> d!39065 m!151289))

(declare-fun m!151291 () Bool)

(assert (=> b!128930 m!151291))

(assert (=> b!128115 d!39065))

(assert (=> d!38611 d!38791))

(declare-fun d!39067 () Bool)

(declare-fun lt!66859 () Bool)

(assert (=> d!39067 (= lt!66859 (select (content!127 (toList!861 lt!66454)) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun e!84152 () Bool)

(assert (=> d!39067 (= lt!66859 e!84152)))

(declare-fun res!62251 () Bool)

(assert (=> d!39067 (=> (not res!62251) (not e!84152))))

(assert (=> d!39067 (= res!62251 ((_ is Cons!1700) (toList!861 lt!66454)))))

(assert (=> d!39067 (= (contains!886 (toList!861 lt!66454) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66859)))

(declare-fun b!128931 () Bool)

(declare-fun e!84151 () Bool)

(assert (=> b!128931 (= e!84152 e!84151)))

(declare-fun res!62250 () Bool)

(assert (=> b!128931 (=> res!62250 e!84151)))

(assert (=> b!128931 (= res!62250 (= (h!2303 (toList!861 lt!66454)) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128932 () Bool)

(assert (=> b!128932 (= e!84151 (contains!886 (t!6083 (toList!861 lt!66454)) (ite (or c!23417 c!23421) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (= (and d!39067 res!62251) b!128931))

(assert (= (and b!128931 (not res!62250)) b!128932))

(declare-fun m!151293 () Bool)

(assert (=> d!39067 m!151293))

(declare-fun m!151295 () Bool)

(assert (=> d!39067 m!151295))

(declare-fun m!151297 () Bool)

(assert (=> b!128932 m!151297))

(assert (=> b!128250 d!39067))

(declare-fun d!39069 () Bool)

(assert (=> d!39069 (= (apply!112 (+!171 lt!66175 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))) lt!66169) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66175 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))) lt!66169)))))

(declare-fun bs!5342 () Bool)

(assert (= bs!5342 d!39069))

(declare-fun m!151299 () Bool)

(assert (=> bs!5342 m!151299))

(assert (=> bs!5342 m!151299))

(declare-fun m!151301 () Bool)

(assert (=> bs!5342 m!151301))

(assert (=> b!127952 d!39069))

(declare-fun d!39071 () Bool)

(assert (=> d!39071 (= (apply!112 lt!66163 lt!66178) (get!1459 (getValueByKey!168 (toList!861 lt!66163) lt!66178)))))

(declare-fun bs!5343 () Bool)

(assert (= bs!5343 d!39071))

(declare-fun m!151303 () Bool)

(assert (=> bs!5343 m!151303))

(assert (=> bs!5343 m!151303))

(declare-fun m!151305 () Bool)

(assert (=> bs!5343 m!151305))

(assert (=> b!127952 d!39071))

(assert (=> b!127952 d!38709))

(declare-fun d!39073 () Bool)

(declare-fun e!84153 () Bool)

(assert (=> d!39073 e!84153))

(declare-fun res!62253 () Bool)

(assert (=> d!39073 (=> (not res!62253) (not e!84153))))

(declare-fun lt!66860 () ListLongMap!1691)

(assert (=> d!39073 (= res!62253 (contains!884 lt!66860 (_1!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))))))

(declare-fun lt!66863 () List!1704)

(assert (=> d!39073 (= lt!66860 (ListLongMap!1692 lt!66863))))

(declare-fun lt!66862 () Unit!3981)

(declare-fun lt!66861 () Unit!3981)

(assert (=> d!39073 (= lt!66862 lt!66861)))

(assert (=> d!39073 (= (getValueByKey!168 lt!66863 (_1!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39073 (= lt!66861 (lemmaContainsTupThenGetReturnValue!83 lt!66863 (_1!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39073 (= lt!66863 (insertStrictlySorted!86 (toList!861 lt!66163) (_1!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39073 (= (+!171 lt!66163 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))) lt!66860)))

(declare-fun b!128933 () Bool)

(declare-fun res!62252 () Bool)

(assert (=> b!128933 (=> (not res!62252) (not e!84153))))

(assert (=> b!128933 (= res!62252 (= (getValueByKey!168 (toList!861 lt!66860) (_1!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))))))))

(declare-fun b!128934 () Bool)

(assert (=> b!128934 (= e!84153 (contains!886 (toList!861 lt!66860) (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))))))

(assert (= (and d!39073 res!62253) b!128933))

(assert (= (and b!128933 res!62252) b!128934))

(declare-fun m!151307 () Bool)

(assert (=> d!39073 m!151307))

(declare-fun m!151309 () Bool)

(assert (=> d!39073 m!151309))

(declare-fun m!151311 () Bool)

(assert (=> d!39073 m!151311))

(declare-fun m!151313 () Bool)

(assert (=> d!39073 m!151313))

(declare-fun m!151315 () Bool)

(assert (=> b!128933 m!151315))

(declare-fun m!151317 () Bool)

(assert (=> b!128934 m!151317))

(assert (=> b!127952 d!39073))

(declare-fun d!39075 () Bool)

(assert (=> d!39075 (= (apply!112 (+!171 lt!66180 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))) lt!66161) (apply!112 lt!66180 lt!66161))))

(declare-fun lt!66864 () Unit!3981)

(assert (=> d!39075 (= lt!66864 (choose!775 lt!66180 lt!66166 (minValue!2666 newMap!16) lt!66161))))

(declare-fun e!84154 () Bool)

(assert (=> d!39075 e!84154))

(declare-fun res!62254 () Bool)

(assert (=> d!39075 (=> (not res!62254) (not e!84154))))

(assert (=> d!39075 (= res!62254 (contains!884 lt!66180 lt!66161))))

(assert (=> d!39075 (= (addApplyDifferent!88 lt!66180 lt!66166 (minValue!2666 newMap!16) lt!66161) lt!66864)))

(declare-fun b!128935 () Bool)

(assert (=> b!128935 (= e!84154 (not (= lt!66161 lt!66166)))))

(assert (= (and d!39075 res!62254) b!128935))

(declare-fun m!151319 () Bool)

(assert (=> d!39075 m!151319))

(assert (=> d!39075 m!149559))

(assert (=> d!39075 m!149563))

(declare-fun m!151321 () Bool)

(assert (=> d!39075 m!151321))

(assert (=> d!39075 m!149563))

(assert (=> d!39075 m!149565))

(assert (=> b!127952 d!39075))

(declare-fun d!39077 () Bool)

(declare-fun e!84155 () Bool)

(assert (=> d!39077 e!84155))

(declare-fun res!62256 () Bool)

(assert (=> d!39077 (=> (not res!62256) (not e!84155))))

(declare-fun lt!66865 () ListLongMap!1691)

(assert (=> d!39077 (= res!62256 (contains!884 lt!66865 (_1!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))))))

(declare-fun lt!66868 () List!1704)

(assert (=> d!39077 (= lt!66865 (ListLongMap!1692 lt!66868))))

(declare-fun lt!66867 () Unit!3981)

(declare-fun lt!66866 () Unit!3981)

(assert (=> d!39077 (= lt!66867 lt!66866)))

(assert (=> d!39077 (= (getValueByKey!168 lt!66868 (_1!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))))))

(assert (=> d!39077 (= lt!66866 (lemmaContainsTupThenGetReturnValue!83 lt!66868 (_1!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))))))

(assert (=> d!39077 (= lt!66868 (insertStrictlySorted!86 (toList!861 lt!66180) (_1!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))))))

(assert (=> d!39077 (= (+!171 lt!66180 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))) lt!66865)))

(declare-fun b!128936 () Bool)

(declare-fun res!62255 () Bool)

(assert (=> b!128936 (=> (not res!62255) (not e!84155))))

(assert (=> b!128936 (= res!62255 (= (getValueByKey!168 (toList!861 lt!66865) (_1!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))))))))

(declare-fun b!128937 () Bool)

(assert (=> b!128937 (= e!84155 (contains!886 (toList!861 lt!66865) (tuple2!2597 lt!66166 (minValue!2666 newMap!16))))))

(assert (= (and d!39077 res!62256) b!128936))

(assert (= (and b!128936 res!62255) b!128937))

(declare-fun m!151323 () Bool)

(assert (=> d!39077 m!151323))

(declare-fun m!151325 () Bool)

(assert (=> d!39077 m!151325))

(declare-fun m!151327 () Bool)

(assert (=> d!39077 m!151327))

(declare-fun m!151329 () Bool)

(assert (=> d!39077 m!151329))

(declare-fun m!151331 () Bool)

(assert (=> b!128936 m!151331))

(declare-fun m!151333 () Bool)

(assert (=> b!128937 m!151333))

(assert (=> b!127952 d!39077))

(declare-fun d!39079 () Bool)

(declare-fun e!84156 () Bool)

(assert (=> d!39079 e!84156))

(declare-fun res!62258 () Bool)

(assert (=> d!39079 (=> (not res!62258) (not e!84156))))

(declare-fun lt!66869 () ListLongMap!1691)

(assert (=> d!39079 (= res!62258 (contains!884 lt!66869 (_1!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))))))

(declare-fun lt!66872 () List!1704)

(assert (=> d!39079 (= lt!66869 (ListLongMap!1692 lt!66872))))

(declare-fun lt!66871 () Unit!3981)

(declare-fun lt!66870 () Unit!3981)

(assert (=> d!39079 (= lt!66871 lt!66870)))

(assert (=> d!39079 (= (getValueByKey!168 lt!66872 (_1!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39079 (= lt!66870 (lemmaContainsTupThenGetReturnValue!83 lt!66872 (_1!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39079 (= lt!66872 (insertStrictlySorted!86 (toList!861 lt!66182) (_1!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39079 (= (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))) lt!66869)))

(declare-fun b!128938 () Bool)

(declare-fun res!62257 () Bool)

(assert (=> b!128938 (=> (not res!62257) (not e!84156))))

(assert (=> b!128938 (= res!62257 (= (getValueByKey!168 (toList!861 lt!66869) (_1!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))))))))

(declare-fun b!128939 () Bool)

(assert (=> b!128939 (= e!84156 (contains!886 (toList!861 lt!66869) (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))))))

(assert (= (and d!39079 res!62258) b!128938))

(assert (= (and b!128938 res!62257) b!128939))

(declare-fun m!151335 () Bool)

(assert (=> d!39079 m!151335))

(declare-fun m!151337 () Bool)

(assert (=> d!39079 m!151337))

(declare-fun m!151339 () Bool)

(assert (=> d!39079 m!151339))

(declare-fun m!151341 () Bool)

(assert (=> d!39079 m!151341))

(declare-fun m!151343 () Bool)

(assert (=> b!128938 m!151343))

(declare-fun m!151345 () Bool)

(assert (=> b!128939 m!151345))

(assert (=> b!127952 d!39079))

(declare-fun d!39081 () Bool)

(assert (=> d!39081 (= (apply!112 (+!171 lt!66175 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))) lt!66169) (apply!112 lt!66175 lt!66169))))

(declare-fun lt!66873 () Unit!3981)

(assert (=> d!39081 (= lt!66873 (choose!775 lt!66175 lt!66174 (minValue!2666 newMap!16) lt!66169))))

(declare-fun e!84157 () Bool)

(assert (=> d!39081 e!84157))

(declare-fun res!62259 () Bool)

(assert (=> d!39081 (=> (not res!62259) (not e!84157))))

(assert (=> d!39081 (= res!62259 (contains!884 lt!66175 lt!66169))))

(assert (=> d!39081 (= (addApplyDifferent!88 lt!66175 lt!66174 (minValue!2666 newMap!16) lt!66169) lt!66873)))

(declare-fun b!128940 () Bool)

(assert (=> b!128940 (= e!84157 (not (= lt!66169 lt!66174)))))

(assert (= (and d!39081 res!62259) b!128940))

(declare-fun m!151347 () Bool)

(assert (=> d!39081 m!151347))

(assert (=> d!39081 m!149555))

(assert (=> d!39081 m!149561))

(declare-fun m!151349 () Bool)

(assert (=> d!39081 m!151349))

(assert (=> d!39081 m!149561))

(assert (=> d!39081 m!149579))

(assert (=> b!127952 d!39081))

(declare-fun d!39083 () Bool)

(assert (=> d!39083 (= (apply!112 lt!66180 lt!66161) (get!1459 (getValueByKey!168 (toList!861 lt!66180) lt!66161)))))

(declare-fun bs!5344 () Bool)

(assert (= bs!5344 d!39083))

(declare-fun m!151351 () Bool)

(assert (=> bs!5344 m!151351))

(assert (=> bs!5344 m!151351))

(declare-fun m!151353 () Bool)

(assert (=> bs!5344 m!151353))

(assert (=> b!127952 d!39083))

(declare-fun d!39085 () Bool)

(assert (=> d!39085 (= (apply!112 (+!171 lt!66163 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))) lt!66178) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66163 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16)))) lt!66178)))))

(declare-fun bs!5345 () Bool)

(assert (= bs!5345 d!39085))

(declare-fun m!151355 () Bool)

(assert (=> bs!5345 m!151355))

(assert (=> bs!5345 m!151355))

(declare-fun m!151357 () Bool)

(assert (=> bs!5345 m!151357))

(assert (=> b!127952 d!39085))

(declare-fun d!39087 () Bool)

(declare-fun e!84159 () Bool)

(assert (=> d!39087 e!84159))

(declare-fun res!62260 () Bool)

(assert (=> d!39087 (=> res!62260 e!84159)))

(declare-fun lt!66874 () Bool)

(assert (=> d!39087 (= res!62260 (not lt!66874))))

(declare-fun lt!66877 () Bool)

(assert (=> d!39087 (= lt!66874 lt!66877)))

(declare-fun lt!66876 () Unit!3981)

(declare-fun e!84158 () Unit!3981)

(assert (=> d!39087 (= lt!66876 e!84158)))

(declare-fun c!23691 () Bool)

(assert (=> d!39087 (= c!23691 lt!66877)))

(assert (=> d!39087 (= lt!66877 (containsKey!172 (toList!861 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))) lt!66171))))

(assert (=> d!39087 (= (contains!884 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))) lt!66171) lt!66874)))

(declare-fun b!128941 () Bool)

(declare-fun lt!66875 () Unit!3981)

(assert (=> b!128941 (= e!84158 lt!66875)))

(assert (=> b!128941 (= lt!66875 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))) lt!66171))))

(assert (=> b!128941 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))) lt!66171))))

(declare-fun b!128942 () Bool)

(declare-fun Unit!4028 () Unit!3981)

(assert (=> b!128942 (= e!84158 Unit!4028)))

(declare-fun b!128943 () Bool)

(assert (=> b!128943 (= e!84159 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16)))) lt!66171)))))

(assert (= (and d!39087 c!23691) b!128941))

(assert (= (and d!39087 (not c!23691)) b!128942))

(assert (= (and d!39087 (not res!62260)) b!128943))

(declare-fun m!151359 () Bool)

(assert (=> d!39087 m!151359))

(declare-fun m!151361 () Bool)

(assert (=> b!128941 m!151361))

(declare-fun m!151363 () Bool)

(assert (=> b!128941 m!151363))

(assert (=> b!128941 m!151363))

(declare-fun m!151365 () Bool)

(assert (=> b!128941 m!151365))

(assert (=> b!128943 m!151363))

(assert (=> b!128943 m!151363))

(assert (=> b!128943 m!151365))

(assert (=> b!127952 d!39087))

(declare-fun d!39089 () Bool)

(assert (=> d!39089 (contains!884 (+!171 lt!66182 (tuple2!2597 lt!66176 (zeroValue!2666 newMap!16))) lt!66171)))

(declare-fun lt!66878 () Unit!3981)

(assert (=> d!39089 (= lt!66878 (choose!776 lt!66182 lt!66176 (zeroValue!2666 newMap!16) lt!66171))))

(assert (=> d!39089 (contains!884 lt!66182 lt!66171)))

(assert (=> d!39089 (= (addStillContains!88 lt!66182 lt!66176 (zeroValue!2666 newMap!16) lt!66171) lt!66878)))

(declare-fun bs!5346 () Bool)

(assert (= bs!5346 d!39089))

(assert (=> bs!5346 m!149573))

(assert (=> bs!5346 m!149573))

(assert (=> bs!5346 m!149575))

(declare-fun m!151367 () Bool)

(assert (=> bs!5346 m!151367))

(declare-fun m!151369 () Bool)

(assert (=> bs!5346 m!151369))

(assert (=> b!127952 d!39089))

(declare-fun d!39091 () Bool)

(assert (=> d!39091 (= (apply!112 (+!171 lt!66180 (tuple2!2597 lt!66166 (minValue!2666 newMap!16))) lt!66161) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66180 (tuple2!2597 lt!66166 (minValue!2666 newMap!16)))) lt!66161)))))

(declare-fun bs!5347 () Bool)

(assert (= bs!5347 d!39091))

(declare-fun m!151371 () Bool)

(assert (=> bs!5347 m!151371))

(assert (=> bs!5347 m!151371))

(declare-fun m!151373 () Bool)

(assert (=> bs!5347 m!151373))

(assert (=> b!127952 d!39091))

(declare-fun d!39093 () Bool)

(declare-fun e!84160 () Bool)

(assert (=> d!39093 e!84160))

(declare-fun res!62262 () Bool)

(assert (=> d!39093 (=> (not res!62262) (not e!84160))))

(declare-fun lt!66879 () ListLongMap!1691)

(assert (=> d!39093 (= res!62262 (contains!884 lt!66879 (_1!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))))))

(declare-fun lt!66882 () List!1704)

(assert (=> d!39093 (= lt!66879 (ListLongMap!1692 lt!66882))))

(declare-fun lt!66881 () Unit!3981)

(declare-fun lt!66880 () Unit!3981)

(assert (=> d!39093 (= lt!66881 lt!66880)))

(assert (=> d!39093 (= (getValueByKey!168 lt!66882 (_1!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))))))

(assert (=> d!39093 (= lt!66880 (lemmaContainsTupThenGetReturnValue!83 lt!66882 (_1!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))))))

(assert (=> d!39093 (= lt!66882 (insertStrictlySorted!86 (toList!861 lt!66175) (_1!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))))))

(assert (=> d!39093 (= (+!171 lt!66175 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))) lt!66879)))

(declare-fun b!128944 () Bool)

(declare-fun res!62261 () Bool)

(assert (=> b!128944 (=> (not res!62261) (not e!84160))))

(assert (=> b!128944 (= res!62261 (= (getValueByKey!168 (toList!861 lt!66879) (_1!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66174 (minValue!2666 newMap!16))))))))

(declare-fun b!128945 () Bool)

(assert (=> b!128945 (= e!84160 (contains!886 (toList!861 lt!66879) (tuple2!2597 lt!66174 (minValue!2666 newMap!16))))))

(assert (= (and d!39093 res!62262) b!128944))

(assert (= (and b!128944 res!62261) b!128945))

(declare-fun m!151375 () Bool)

(assert (=> d!39093 m!151375))

(declare-fun m!151377 () Bool)

(assert (=> d!39093 m!151377))

(declare-fun m!151379 () Bool)

(assert (=> d!39093 m!151379))

(declare-fun m!151381 () Bool)

(assert (=> d!39093 m!151381))

(declare-fun m!151383 () Bool)

(assert (=> b!128944 m!151383))

(declare-fun m!151385 () Bool)

(assert (=> b!128945 m!151385))

(assert (=> b!127952 d!39093))

(declare-fun d!39095 () Bool)

(assert (=> d!39095 (= (apply!112 (+!171 lt!66163 (tuple2!2597 lt!66172 (zeroValue!2666 newMap!16))) lt!66178) (apply!112 lt!66163 lt!66178))))

(declare-fun lt!66883 () Unit!3981)

(assert (=> d!39095 (= lt!66883 (choose!775 lt!66163 lt!66172 (zeroValue!2666 newMap!16) lt!66178))))

(declare-fun e!84161 () Bool)

(assert (=> d!39095 e!84161))

(declare-fun res!62263 () Bool)

(assert (=> d!39095 (=> (not res!62263) (not e!84161))))

(assert (=> d!39095 (= res!62263 (contains!884 lt!66163 lt!66178))))

(assert (=> d!39095 (= (addApplyDifferent!88 lt!66163 lt!66172 (zeroValue!2666 newMap!16) lt!66178) lt!66883)))

(declare-fun b!128946 () Bool)

(assert (=> b!128946 (= e!84161 (not (= lt!66178 lt!66172)))))

(assert (= (and d!39095 res!62263) b!128946))

(declare-fun m!151387 () Bool)

(assert (=> d!39095 m!151387))

(assert (=> d!39095 m!149577))

(assert (=> d!39095 m!149567))

(declare-fun m!151389 () Bool)

(assert (=> d!39095 m!151389))

(assert (=> d!39095 m!149567))

(assert (=> d!39095 m!149569))

(assert (=> b!127952 d!39095))

(declare-fun d!39097 () Bool)

(assert (=> d!39097 (= (apply!112 lt!66175 lt!66169) (get!1459 (getValueByKey!168 (toList!861 lt!66175) lt!66169)))))

(declare-fun bs!5348 () Bool)

(assert (= bs!5348 d!39097))

(declare-fun m!151391 () Bool)

(assert (=> bs!5348 m!151391))

(assert (=> bs!5348 m!151391))

(declare-fun m!151393 () Bool)

(assert (=> bs!5348 m!151393))

(assert (=> b!127952 d!39097))

(declare-fun d!39099 () Bool)

(declare-fun e!84163 () Bool)

(assert (=> d!39099 e!84163))

(declare-fun res!62264 () Bool)

(assert (=> d!39099 (=> res!62264 e!84163)))

(declare-fun lt!66884 () Bool)

(assert (=> d!39099 (= res!62264 (not lt!66884))))

(declare-fun lt!66887 () Bool)

(assert (=> d!39099 (= lt!66884 lt!66887)))

(declare-fun lt!66886 () Unit!3981)

(declare-fun e!84162 () Unit!3981)

(assert (=> d!39099 (= lt!66886 e!84162)))

(declare-fun c!23692 () Bool)

(assert (=> d!39099 (= c!23692 lt!66887)))

(assert (=> d!39099 (= lt!66887 (containsKey!172 (toList!861 (map!1394 (_2!1310 lt!66421))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> d!39099 (= (contains!884 (map!1394 (_2!1310 lt!66421)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66884)))

(declare-fun b!128947 () Bool)

(declare-fun lt!66885 () Unit!3981)

(assert (=> b!128947 (= e!84162 lt!66885)))

(assert (=> b!128947 (= lt!66885 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (map!1394 (_2!1310 lt!66421))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!128947 (isDefined!121 (getValueByKey!168 (toList!861 (map!1394 (_2!1310 lt!66421))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128948 () Bool)

(declare-fun Unit!4029 () Unit!3981)

(assert (=> b!128948 (= e!84162 Unit!4029)))

(declare-fun b!128949 () Bool)

(assert (=> b!128949 (= e!84163 (isDefined!121 (getValueByKey!168 (toList!861 (map!1394 (_2!1310 lt!66421))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (= (and d!39099 c!23692) b!128947))

(assert (= (and d!39099 (not c!23692)) b!128948))

(assert (= (and d!39099 (not res!62264)) b!128949))

(assert (=> d!39099 m!149355))

(declare-fun m!151395 () Bool)

(assert (=> d!39099 m!151395))

(assert (=> b!128947 m!149355))

(declare-fun m!151397 () Bool)

(assert (=> b!128947 m!151397))

(assert (=> b!128947 m!149355))

(declare-fun m!151399 () Bool)

(assert (=> b!128947 m!151399))

(assert (=> b!128947 m!151399))

(declare-fun m!151401 () Bool)

(assert (=> b!128947 m!151401))

(assert (=> b!128949 m!149355))

(assert (=> b!128949 m!151399))

(assert (=> b!128949 m!151399))

(assert (=> b!128949 m!151401))

(assert (=> b!128221 d!39099))

(assert (=> b!128221 d!38937))

(declare-fun c!23693 () Bool)

(declare-fun d!39101 () Bool)

(assert (=> d!39101 (= c!23693 (and ((_ is Cons!1700) (toList!861 lt!66279)) (= (_1!1309 (h!2303 (toList!861 lt!66279))) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!84164 () Option!174)

(assert (=> d!39101 (= (getValueByKey!168 (toList!861 lt!66279) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!84164)))

(declare-fun b!128951 () Bool)

(declare-fun e!84165 () Option!174)

(assert (=> b!128951 (= e!84164 e!84165)))

(declare-fun c!23694 () Bool)

(assert (=> b!128951 (= c!23694 (and ((_ is Cons!1700) (toList!861 lt!66279)) (not (= (_1!1309 (h!2303 (toList!861 lt!66279))) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128952 () Bool)

(assert (=> b!128952 (= e!84165 (getValueByKey!168 (t!6083 (toList!861 lt!66279)) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128953 () Bool)

(assert (=> b!128953 (= e!84165 None!172)))

(declare-fun b!128950 () Bool)

(assert (=> b!128950 (= e!84164 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66279)))))))

(assert (= (and d!39101 c!23693) b!128950))

(assert (= (and d!39101 (not c!23693)) b!128951))

(assert (= (and b!128951 c!23694) b!128952))

(assert (= (and b!128951 (not c!23694)) b!128953))

(declare-fun m!151403 () Bool)

(assert (=> b!128952 m!151403))

(assert (=> b!128093 d!39101))

(assert (=> b!128260 d!38969))

(declare-fun c!23695 () Bool)

(declare-fun d!39103 () Bool)

(assert (=> d!39103 (= c!23695 (and ((_ is Cons!1700) (t!6083 (toList!861 lt!65992))) (= (_1!1309 (h!2303 (t!6083 (toList!861 lt!65992)))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun e!84166 () Option!174)

(assert (=> d!39103 (= (getValueByKey!168 (t!6083 (toList!861 lt!65992)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!84166)))

(declare-fun b!128955 () Bool)

(declare-fun e!84167 () Option!174)

(assert (=> b!128955 (= e!84166 e!84167)))

(declare-fun c!23696 () Bool)

(assert (=> b!128955 (= c!23696 (and ((_ is Cons!1700) (t!6083 (toList!861 lt!65992))) (not (= (_1!1309 (h!2303 (t!6083 (toList!861 lt!65992)))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))))

(declare-fun b!128956 () Bool)

(assert (=> b!128956 (= e!84167 (getValueByKey!168 (t!6083 (t!6083 (toList!861 lt!65992))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun b!128957 () Bool)

(assert (=> b!128957 (= e!84167 None!172)))

(declare-fun b!128954 () Bool)

(assert (=> b!128954 (= e!84166 (Some!173 (_2!1309 (h!2303 (t!6083 (toList!861 lt!65992))))))))

(assert (= (and d!39103 c!23695) b!128954))

(assert (= (and d!39103 (not c!23695)) b!128955))

(assert (= (and b!128955 c!23696) b!128956))

(assert (= (and b!128955 (not c!23696)) b!128957))

(assert (=> b!128956 m!149355))

(declare-fun m!151405 () Bool)

(assert (=> b!128956 m!151405))

(assert (=> b!127991 d!39103))

(declare-fun d!39105 () Bool)

(declare-fun lt!66888 () Bool)

(assert (=> d!39105 (= lt!66888 (select (content!127 (toList!861 lt!66458)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun e!84169 () Bool)

(assert (=> d!39105 (= lt!66888 e!84169)))

(declare-fun res!62266 () Bool)

(assert (=> d!39105 (=> (not res!62266) (not e!84169))))

(assert (=> d!39105 (= res!62266 ((_ is Cons!1700) (toList!861 lt!66458)))))

(assert (=> d!39105 (= (contains!886 (toList!861 lt!66458) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66888)))

(declare-fun b!128958 () Bool)

(declare-fun e!84168 () Bool)

(assert (=> b!128958 (= e!84169 e!84168)))

(declare-fun res!62265 () Bool)

(assert (=> b!128958 (=> res!62265 e!84168)))

(assert (=> b!128958 (= res!62265 (= (h!2303 (toList!861 lt!66458)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!128959 () Bool)

(assert (=> b!128959 (= e!84168 (contains!886 (t!6083 (toList!861 lt!66458)) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!39105 res!62266) b!128958))

(assert (= (and b!128958 (not res!62265)) b!128959))

(declare-fun m!151407 () Bool)

(assert (=> d!39105 m!151407))

(declare-fun m!151409 () Bool)

(assert (=> d!39105 m!151409))

(declare-fun m!151411 () Bool)

(assert (=> b!128959 m!151411))

(assert (=> b!128264 d!39105))

(declare-fun b!128960 () Bool)

(declare-fun e!84173 () Bool)

(declare-fun e!84171 () Bool)

(assert (=> b!128960 (= e!84173 e!84171)))

(declare-fun res!62269 () Bool)

(assert (=> b!128960 (=> (not res!62269) (not e!84171))))

(declare-fun e!84172 () Bool)

(assert (=> b!128960 (= res!62269 (not e!84172))))

(declare-fun res!62268 () Bool)

(assert (=> b!128960 (=> (not res!62268) (not e!84172))))

(assert (=> b!128960 (= res!62268 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(declare-fun bm!13965 () Bool)

(declare-fun call!13968 () Bool)

(declare-fun c!23697 () Bool)

(assert (=> bm!13965 (= call!13968 (arrayNoDuplicates!0 (_keys!4542 (_2!1310 lt!66078)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23697 (Cons!1702 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000) Nil!1703) Nil!1703)))))

(declare-fun d!39107 () Bool)

(declare-fun res!62267 () Bool)

(assert (=> d!39107 (=> res!62267 e!84173)))

(assert (=> d!39107 (= res!62267 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (_2!1310 lt!66078)))))))

(assert (=> d!39107 (= (arrayNoDuplicates!0 (_keys!4542 (_2!1310 lt!66078)) #b00000000000000000000000000000000 Nil!1703) e!84173)))

(declare-fun b!128961 () Bool)

(declare-fun e!84170 () Bool)

(assert (=> b!128961 (= e!84170 call!13968)))

(declare-fun b!128962 () Bool)

(assert (=> b!128962 (= e!84170 call!13968)))

(declare-fun b!128963 () Bool)

(assert (=> b!128963 (= e!84171 e!84170)))

(assert (=> b!128963 (= c!23697 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(declare-fun b!128964 () Bool)

(assert (=> b!128964 (= e!84172 (contains!887 Nil!1703 (select (arr!2237 (_keys!4542 (_2!1310 lt!66078))) #b00000000000000000000000000000000)))))

(assert (= (and d!39107 (not res!62267)) b!128960))

(assert (= (and b!128960 res!62268) b!128964))

(assert (= (and b!128960 res!62269) b!128963))

(assert (= (and b!128963 c!23697) b!128961))

(assert (= (and b!128963 (not c!23697)) b!128962))

(assert (= (or b!128961 b!128962) bm!13965))

(assert (=> b!128960 m!150475))

(assert (=> b!128960 m!150475))

(assert (=> b!128960 m!150485))

(assert (=> bm!13965 m!150475))

(declare-fun m!151413 () Bool)

(assert (=> bm!13965 m!151413))

(assert (=> b!128963 m!150475))

(assert (=> b!128963 m!150475))

(assert (=> b!128963 m!150485))

(assert (=> b!128964 m!150475))

(assert (=> b!128964 m!150475))

(declare-fun m!151415 () Bool)

(assert (=> b!128964 m!151415))

(assert (=> b!128240 d!39107))

(declare-fun d!39109 () Bool)

(assert (=> d!39109 (= (get!1458 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128237 d!39109))

(declare-fun d!39111 () Bool)

(assert (=> d!39111 (= (apply!112 lt!66336 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (getValueByKey!168 (toList!861 lt!66336) (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5349 () Bool)

(assert (= bs!5349 d!39111))

(assert (=> bs!5349 m!149547))

(assert (=> bs!5349 m!150881))

(assert (=> bs!5349 m!150881))

(declare-fun m!151417 () Bool)

(assert (=> bs!5349 m!151417))

(assert (=> b!128156 d!39111))

(declare-fun d!39113 () Bool)

(declare-fun c!23698 () Bool)

(assert (=> d!39113 (= c!23698 ((_ is ValueCellFull!1083) (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!84174 () V!3451)

(assert (=> d!39113 (= (get!1455 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84174)))

(declare-fun b!128965 () Bool)

(assert (=> b!128965 (= e!84174 (get!1457 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128966 () Bool)

(assert (=> b!128966 (= e!84174 (get!1458 (select (arr!2238 (ite c!23392 (_values!2788 newMap!16) (array!4728 (store (arr!2238 (_values!2788 newMap!16)) (index!3241 lt!66072) (ValueCellFull!1083 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2503 (_values!2788 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39113 c!23698) b!128965))

(assert (= (and d!39113 (not c!23698)) b!128966))

(assert (=> b!128965 m!149923))

(assert (=> b!128965 m!149593))

(declare-fun m!151419 () Bool)

(assert (=> b!128965 m!151419))

(assert (=> b!128966 m!149923))

(assert (=> b!128966 m!149593))

(declare-fun m!151421 () Bool)

(assert (=> b!128966 m!151421))

(assert (=> b!128156 d!39113))

(assert (=> b!128118 d!38885))

(assert (=> b!128118 d!38887))

(declare-fun d!39115 () Bool)

(declare-fun e!84176 () Bool)

(assert (=> d!39115 e!84176))

(declare-fun res!62270 () Bool)

(assert (=> d!39115 (=> res!62270 e!84176)))

(declare-fun lt!66889 () Bool)

(assert (=> d!39115 (= res!62270 (not lt!66889))))

(declare-fun lt!66892 () Bool)

(assert (=> d!39115 (= lt!66889 lt!66892)))

(declare-fun lt!66891 () Unit!3981)

(declare-fun e!84175 () Unit!3981)

(assert (=> d!39115 (= lt!66891 e!84175)))

(declare-fun c!23699 () Bool)

(assert (=> d!39115 (= c!23699 lt!66892)))

(assert (=> d!39115 (= lt!66892 (containsKey!172 (toList!861 lt!66450) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39115 (= (contains!884 lt!66450 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!66889)))

(declare-fun b!128967 () Bool)

(declare-fun lt!66890 () Unit!3981)

(assert (=> b!128967 (= e!84175 lt!66890)))

(assert (=> b!128967 (= lt!66890 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66450) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!128967 (isDefined!121 (getValueByKey!168 (toList!861 lt!66450) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128968 () Bool)

(declare-fun Unit!4030 () Unit!3981)

(assert (=> b!128968 (= e!84175 Unit!4030)))

(declare-fun b!128969 () Bool)

(assert (=> b!128969 (= e!84176 (isDefined!121 (getValueByKey!168 (toList!861 lt!66450) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39115 c!23699) b!128967))

(assert (= (and d!39115 (not c!23699)) b!128968))

(assert (= (and d!39115 (not res!62270)) b!128969))

(declare-fun m!151423 () Bool)

(assert (=> d!39115 m!151423))

(declare-fun m!151425 () Bool)

(assert (=> b!128967 m!151425))

(assert (=> b!128967 m!150049))

(assert (=> b!128967 m!150049))

(declare-fun m!151427 () Bool)

(assert (=> b!128967 m!151427))

(assert (=> b!128969 m!150049))

(assert (=> b!128969 m!150049))

(assert (=> b!128969 m!151427))

(assert (=> d!38691 d!39115))

(declare-fun d!39117 () Bool)

(declare-fun c!23700 () Bool)

(assert (=> d!39117 (= c!23700 (and ((_ is Cons!1700) lt!66453) (= (_1!1309 (h!2303 lt!66453)) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!84177 () Option!174)

(assert (=> d!39117 (= (getValueByKey!168 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!84177)))

(declare-fun b!128971 () Bool)

(declare-fun e!84178 () Option!174)

(assert (=> b!128971 (= e!84177 e!84178)))

(declare-fun c!23701 () Bool)

(assert (=> b!128971 (= c!23701 (and ((_ is Cons!1700) lt!66453) (not (= (_1!1309 (h!2303 lt!66453)) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!128972 () Bool)

(assert (=> b!128972 (= e!84178 (getValueByKey!168 (t!6083 lt!66453) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128973 () Bool)

(assert (=> b!128973 (= e!84178 None!172)))

(declare-fun b!128970 () Bool)

(assert (=> b!128970 (= e!84177 (Some!173 (_2!1309 (h!2303 lt!66453))))))

(assert (= (and d!39117 c!23700) b!128970))

(assert (= (and d!39117 (not c!23700)) b!128971))

(assert (= (and b!128971 c!23701) b!128972))

(assert (= (and b!128971 (not c!23701)) b!128973))

(declare-fun m!151429 () Bool)

(assert (=> b!128972 m!151429))

(assert (=> d!38691 d!39117))

(declare-fun d!39119 () Bool)

(assert (=> d!39119 (= (getValueByKey!168 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!66893 () Unit!3981)

(assert (=> d!39119 (= lt!66893 (choose!783 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!84179 () Bool)

(assert (=> d!39119 e!84179))

(declare-fun res!62271 () Bool)

(assert (=> d!39119 (=> (not res!62271) (not e!84179))))

(assert (=> d!39119 (= res!62271 (isStrictlySorted!318 lt!66453))))

(assert (=> d!39119 (= (lemmaContainsTupThenGetReturnValue!83 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!66893)))

(declare-fun b!128974 () Bool)

(declare-fun res!62272 () Bool)

(assert (=> b!128974 (=> (not res!62272) (not e!84179))))

(assert (=> b!128974 (= res!62272 (containsKey!172 lt!66453 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128975 () Bool)

(assert (=> b!128975 (= e!84179 (contains!886 lt!66453 (tuple2!2597 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39119 res!62271) b!128974))

(assert (= (and b!128974 res!62272) b!128975))

(assert (=> d!39119 m!150043))

(declare-fun m!151431 () Bool)

(assert (=> d!39119 m!151431))

(declare-fun m!151433 () Bool)

(assert (=> d!39119 m!151433))

(declare-fun m!151435 () Bool)

(assert (=> b!128974 m!151435))

(declare-fun m!151437 () Bool)

(assert (=> b!128975 m!151437))

(assert (=> d!38691 d!39119))

(declare-fun c!23703 () Bool)

(declare-fun c!23702 () Bool)

(declare-fun b!128976 () Bool)

(declare-fun e!84181 () List!1704)

(assert (=> b!128976 (= e!84181 (ite c!23703 (t!6083 (toList!861 e!83499)) (ite c!23702 (Cons!1700 (h!2303 (toList!861 e!83499)) (t!6083 (toList!861 e!83499))) Nil!1701)))))

(declare-fun b!128977 () Bool)

(declare-fun e!84183 () List!1704)

(declare-fun e!84180 () List!1704)

(assert (=> b!128977 (= e!84183 e!84180)))

(assert (=> b!128977 (= c!23703 (and ((_ is Cons!1700) (toList!861 e!83499)) (= (_1!1309 (h!2303 (toList!861 e!83499))) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!128978 () Bool)

(assert (=> b!128978 (= e!84181 (insertStrictlySorted!86 (t!6083 (toList!861 e!83499)) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128979 () Bool)

(declare-fun res!62274 () Bool)

(declare-fun e!84182 () Bool)

(assert (=> b!128979 (=> (not res!62274) (not e!84182))))

(declare-fun lt!66894 () List!1704)

(assert (=> b!128979 (= res!62274 (containsKey!172 lt!66894 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13966 () Bool)

(declare-fun call!13969 () List!1704)

(declare-fun call!13971 () List!1704)

(assert (=> bm!13966 (= call!13969 call!13971)))

(declare-fun b!128980 () Bool)

(declare-fun e!84184 () List!1704)

(declare-fun call!13970 () List!1704)

(assert (=> b!128980 (= e!84184 call!13970)))

(declare-fun b!128981 () Bool)

(assert (=> b!128981 (= e!84184 call!13970)))

(declare-fun b!128982 () Bool)

(assert (=> b!128982 (= c!23702 (and ((_ is Cons!1700) (toList!861 e!83499)) (bvsgt (_1!1309 (h!2303 (toList!861 e!83499))) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!128982 (= e!84180 e!84184)))

(declare-fun b!128983 () Bool)

(assert (=> b!128983 (= e!84180 call!13969)))

(declare-fun b!128984 () Bool)

(assert (=> b!128984 (= e!84183 call!13971)))

(declare-fun b!128985 () Bool)

(assert (=> b!128985 (= e!84182 (contains!886 lt!66894 (tuple2!2597 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23705 () Bool)

(declare-fun bm!13968 () Bool)

(assert (=> bm!13968 (= call!13971 ($colon$colon!90 e!84181 (ite c!23705 (h!2303 (toList!861 e!83499)) (tuple2!2597 (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!23704 () Bool)

(assert (=> bm!13968 (= c!23704 c!23705)))

(declare-fun d!39121 () Bool)

(assert (=> d!39121 e!84182))

(declare-fun res!62273 () Bool)

(assert (=> d!39121 (=> (not res!62273) (not e!84182))))

(assert (=> d!39121 (= res!62273 (isStrictlySorted!318 lt!66894))))

(assert (=> d!39121 (= lt!66894 e!84183)))

(assert (=> d!39121 (= c!23705 (and ((_ is Cons!1700) (toList!861 e!83499)) (bvslt (_1!1309 (h!2303 (toList!861 e!83499))) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39121 (isStrictlySorted!318 (toList!861 e!83499))))

(assert (=> d!39121 (= (insertStrictlySorted!86 (toList!861 e!83499) (_1!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1309 (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!66894)))

(declare-fun bm!13967 () Bool)

(assert (=> bm!13967 (= call!13970 call!13969)))

(assert (= (and d!39121 c!23705) b!128984))

(assert (= (and d!39121 (not c!23705)) b!128977))

(assert (= (and b!128977 c!23703) b!128983))

(assert (= (and b!128977 (not c!23703)) b!128982))

(assert (= (and b!128982 c!23702) b!128980))

(assert (= (and b!128982 (not c!23702)) b!128981))

(assert (= (or b!128980 b!128981) bm!13967))

(assert (= (or b!128983 bm!13967) bm!13966))

(assert (= (or b!128984 bm!13966) bm!13968))

(assert (= (and bm!13968 c!23704) b!128978))

(assert (= (and bm!13968 (not c!23704)) b!128976))

(assert (= (and d!39121 res!62273) b!128979))

(assert (= (and b!128979 res!62274) b!128985))

(declare-fun m!151439 () Bool)

(assert (=> b!128985 m!151439))

(declare-fun m!151441 () Bool)

(assert (=> b!128978 m!151441))

(declare-fun m!151443 () Bool)

(assert (=> d!39121 m!151443))

(declare-fun m!151445 () Bool)

(assert (=> d!39121 m!151445))

(declare-fun m!151447 () Bool)

(assert (=> b!128979 m!151447))

(declare-fun m!151449 () Bool)

(assert (=> bm!13968 m!151449))

(assert (=> d!38691 d!39121))

(assert (=> b!128208 d!38607))

(declare-fun d!39123 () Bool)

(declare-fun e!84186 () Bool)

(assert (=> d!39123 e!84186))

(declare-fun res!62275 () Bool)

(assert (=> d!39123 (=> res!62275 e!84186)))

(declare-fun lt!66895 () Bool)

(assert (=> d!39123 (= res!62275 (not lt!66895))))

(declare-fun lt!66898 () Bool)

(assert (=> d!39123 (= lt!66895 lt!66898)))

(declare-fun lt!66897 () Unit!3981)

(declare-fun e!84185 () Unit!3981)

(assert (=> d!39123 (= lt!66897 e!84185)))

(declare-fun c!23706 () Bool)

(assert (=> d!39123 (= c!23706 lt!66898)))

(assert (=> d!39123 (= lt!66898 (containsKey!172 (toList!861 lt!66275) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!39123 (= (contains!884 lt!66275 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66895)))

(declare-fun b!128986 () Bool)

(declare-fun lt!66896 () Unit!3981)

(assert (=> b!128986 (= e!84185 lt!66896)))

(assert (=> b!128986 (= lt!66896 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66275) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> b!128986 (isDefined!121 (getValueByKey!168 (toList!861 lt!66275) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128987 () Bool)

(declare-fun Unit!4031 () Unit!3981)

(assert (=> b!128987 (= e!84185 Unit!4031)))

(declare-fun b!128988 () Bool)

(assert (=> b!128988 (= e!84186 (isDefined!121 (getValueByKey!168 (toList!861 lt!66275) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!39123 c!23706) b!128986))

(assert (= (and d!39123 (not c!23706)) b!128987))

(assert (= (and d!39123 (not res!62275)) b!128988))

(declare-fun m!151451 () Bool)

(assert (=> d!39123 m!151451))

(declare-fun m!151453 () Bool)

(assert (=> b!128986 m!151453))

(assert (=> b!128986 m!149777))

(assert (=> b!128986 m!149777))

(declare-fun m!151455 () Bool)

(assert (=> b!128986 m!151455))

(assert (=> b!128988 m!149777))

(assert (=> b!128988 m!149777))

(assert (=> b!128988 m!151455))

(assert (=> d!38629 d!39123))

(declare-fun d!39125 () Bool)

(declare-fun c!23707 () Bool)

(assert (=> d!39125 (= c!23707 (and ((_ is Cons!1700) lt!66278) (= (_1!1309 (h!2303 lt!66278)) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!84187 () Option!174)

(assert (=> d!39125 (= (getValueByKey!168 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!84187)))

(declare-fun b!128990 () Bool)

(declare-fun e!84188 () Option!174)

(assert (=> b!128990 (= e!84187 e!84188)))

(declare-fun c!23708 () Bool)

(assert (=> b!128990 (= c!23708 (and ((_ is Cons!1700) lt!66278) (not (= (_1!1309 (h!2303 lt!66278)) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!128991 () Bool)

(assert (=> b!128991 (= e!84188 (getValueByKey!168 (t!6083 lt!66278) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128992 () Bool)

(assert (=> b!128992 (= e!84188 None!172)))

(declare-fun b!128989 () Bool)

(assert (=> b!128989 (= e!84187 (Some!173 (_2!1309 (h!2303 lt!66278))))))

(assert (= (and d!39125 c!23707) b!128989))

(assert (= (and d!39125 (not c!23707)) b!128990))

(assert (= (and b!128990 c!23708) b!128991))

(assert (= (and b!128990 (not c!23708)) b!128992))

(declare-fun m!151457 () Bool)

(assert (=> b!128991 m!151457))

(assert (=> d!38629 d!39125))

(declare-fun d!39127 () Bool)

(assert (=> d!39127 (= (getValueByKey!168 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66899 () Unit!3981)

(assert (=> d!39127 (= lt!66899 (choose!783 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun e!84189 () Bool)

(assert (=> d!39127 e!84189))

(declare-fun res!62276 () Bool)

(assert (=> d!39127 (=> (not res!62276) (not e!84189))))

(assert (=> d!39127 (= res!62276 (isStrictlySorted!318 lt!66278))))

(assert (=> d!39127 (= (lemmaContainsTupThenGetReturnValue!83 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66899)))

(declare-fun b!128993 () Bool)

(declare-fun res!62277 () Bool)

(assert (=> b!128993 (=> (not res!62277) (not e!84189))))

(assert (=> b!128993 (= res!62277 (containsKey!172 lt!66278 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128994 () Bool)

(assert (=> b!128994 (= e!84189 (contains!886 lt!66278 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!39127 res!62276) b!128993))

(assert (= (and b!128993 res!62277) b!128994))

(assert (=> d!39127 m!149771))

(declare-fun m!151459 () Bool)

(assert (=> d!39127 m!151459))

(declare-fun m!151461 () Bool)

(assert (=> d!39127 m!151461))

(declare-fun m!151463 () Bool)

(assert (=> b!128993 m!151463))

(declare-fun m!151465 () Bool)

(assert (=> b!128994 m!151465))

(assert (=> d!38629 d!39127))

(declare-fun e!84191 () List!1704)

(declare-fun c!23710 () Bool)

(declare-fun c!23709 () Bool)

(declare-fun b!128995 () Bool)

(assert (=> b!128995 (= e!84191 (ite c!23710 (t!6083 (toList!861 lt!66160)) (ite c!23709 (Cons!1700 (h!2303 (toList!861 lt!66160)) (t!6083 (toList!861 lt!66160))) Nil!1701)))))

(declare-fun b!128996 () Bool)

(declare-fun e!84193 () List!1704)

(declare-fun e!84190 () List!1704)

(assert (=> b!128996 (= e!84193 e!84190)))

(assert (=> b!128996 (= c!23710 (and ((_ is Cons!1700) (toList!861 lt!66160)) (= (_1!1309 (h!2303 (toList!861 lt!66160))) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!128997 () Bool)

(assert (=> b!128997 (= e!84191 (insertStrictlySorted!86 (t!6083 (toList!861 lt!66160)) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!128998 () Bool)

(declare-fun res!62279 () Bool)

(declare-fun e!84192 () Bool)

(assert (=> b!128998 (=> (not res!62279) (not e!84192))))

(declare-fun lt!66900 () List!1704)

(assert (=> b!128998 (= res!62279 (containsKey!172 lt!66900 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun bm!13969 () Bool)

(declare-fun call!13972 () List!1704)

(declare-fun call!13974 () List!1704)

(assert (=> bm!13969 (= call!13972 call!13974)))

(declare-fun b!128999 () Bool)

(declare-fun e!84194 () List!1704)

(declare-fun call!13973 () List!1704)

(assert (=> b!128999 (= e!84194 call!13973)))

(declare-fun b!129000 () Bool)

(assert (=> b!129000 (= e!84194 call!13973)))

(declare-fun b!129001 () Bool)

(assert (=> b!129001 (= c!23709 (and ((_ is Cons!1700) (toList!861 lt!66160)) (bvsgt (_1!1309 (h!2303 (toList!861 lt!66160))) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> b!129001 (= e!84190 e!84194)))

(declare-fun b!129002 () Bool)

(assert (=> b!129002 (= e!84190 call!13972)))

(declare-fun b!129003 () Bool)

(assert (=> b!129003 (= e!84193 call!13974)))

(declare-fun b!129004 () Bool)

(assert (=> b!129004 (= e!84192 (contains!886 lt!66900 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun bm!13971 () Bool)

(declare-fun c!23712 () Bool)

(assert (=> bm!13971 (= call!13974 ($colon$colon!90 e!84191 (ite c!23712 (h!2303 (toList!861 lt!66160)) (tuple2!2597 (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun c!23711 () Bool)

(assert (=> bm!13971 (= c!23711 c!23712)))

(declare-fun d!39129 () Bool)

(assert (=> d!39129 e!84192))

(declare-fun res!62278 () Bool)

(assert (=> d!39129 (=> (not res!62278) (not e!84192))))

(assert (=> d!39129 (= res!62278 (isStrictlySorted!318 lt!66900))))

(assert (=> d!39129 (= lt!66900 e!84193)))

(assert (=> d!39129 (= c!23712 (and ((_ is Cons!1700) (toList!861 lt!66160)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66160))) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!39129 (isStrictlySorted!318 (toList!861 lt!66160))))

(assert (=> d!39129 (= (insertStrictlySorted!86 (toList!861 lt!66160) (_1!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66900)))

(declare-fun bm!13970 () Bool)

(assert (=> bm!13970 (= call!13973 call!13972)))

(assert (= (and d!39129 c!23712) b!129003))

(assert (= (and d!39129 (not c!23712)) b!128996))

(assert (= (and b!128996 c!23710) b!129002))

(assert (= (and b!128996 (not c!23710)) b!129001))

(assert (= (and b!129001 c!23709) b!128999))

(assert (= (and b!129001 (not c!23709)) b!129000))

(assert (= (or b!128999 b!129000) bm!13970))

(assert (= (or b!129002 bm!13970) bm!13969))

(assert (= (or b!129003 bm!13969) bm!13971))

(assert (= (and bm!13971 c!23711) b!128997))

(assert (= (and bm!13971 (not c!23711)) b!128995))

(assert (= (and d!39129 res!62278) b!128998))

(assert (= (and b!128998 res!62279) b!129004))

(declare-fun m!151467 () Bool)

(assert (=> b!129004 m!151467))

(declare-fun m!151469 () Bool)

(assert (=> b!128997 m!151469))

(declare-fun m!151471 () Bool)

(assert (=> d!39129 m!151471))

(declare-fun m!151473 () Bool)

(assert (=> d!39129 m!151473))

(declare-fun m!151475 () Bool)

(assert (=> b!128998 m!151475))

(declare-fun m!151477 () Bool)

(assert (=> bm!13971 m!151477))

(assert (=> d!38629 d!39129))

(declare-fun d!39131 () Bool)

(declare-fun e!84196 () Bool)

(assert (=> d!39131 e!84196))

(declare-fun res!62280 () Bool)

(assert (=> d!39131 (=> res!62280 e!84196)))

(declare-fun lt!66901 () Bool)

(assert (=> d!39131 (= res!62280 (not lt!66901))))

(declare-fun lt!66904 () Bool)

(assert (=> d!39131 (= lt!66901 lt!66904)))

(declare-fun lt!66903 () Unit!3981)

(declare-fun e!84195 () Unit!3981)

(assert (=> d!39131 (= lt!66903 e!84195)))

(declare-fun c!23713 () Bool)

(assert (=> d!39131 (= c!23713 lt!66904)))

(assert (=> d!39131 (= lt!66904 (containsKey!172 (toList!861 lt!66179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39131 (= (contains!884 lt!66179 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66901)))

(declare-fun b!129005 () Bool)

(declare-fun lt!66902 () Unit!3981)

(assert (=> b!129005 (= e!84195 lt!66902)))

(assert (=> b!129005 (= lt!66902 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129005 (isDefined!121 (getValueByKey!168 (toList!861 lt!66179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129006 () Bool)

(declare-fun Unit!4032 () Unit!3981)

(assert (=> b!129006 (= e!84195 Unit!4032)))

(declare-fun b!129007 () Bool)

(assert (=> b!129007 (= e!84196 (isDefined!121 (getValueByKey!168 (toList!861 lt!66179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39131 c!23713) b!129005))

(assert (= (and d!39131 (not c!23713)) b!129006))

(assert (= (and d!39131 (not res!62280)) b!129007))

(declare-fun m!151479 () Bool)

(assert (=> d!39131 m!151479))

(declare-fun m!151481 () Bool)

(assert (=> b!129005 m!151481))

(assert (=> b!129005 m!151029))

(assert (=> b!129005 m!151029))

(declare-fun m!151483 () Bool)

(assert (=> b!129005 m!151483))

(assert (=> b!129007 m!151029))

(assert (=> b!129007 m!151029))

(assert (=> b!129007 m!151483))

(assert (=> bm!13832 d!39131))

(declare-fun d!39133 () Bool)

(declare-fun res!62281 () Bool)

(declare-fun e!84197 () Bool)

(assert (=> d!39133 (=> res!62281 e!84197)))

(assert (=> d!39133 (= res!62281 (and ((_ is Cons!1700) (toList!861 call!13790)) (= (_1!1309 (h!2303 (toList!861 call!13790))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(assert (=> d!39133 (= (containsKey!172 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) e!84197)))

(declare-fun b!129008 () Bool)

(declare-fun e!84198 () Bool)

(assert (=> b!129008 (= e!84197 e!84198)))

(declare-fun res!62282 () Bool)

(assert (=> b!129008 (=> (not res!62282) (not e!84198))))

(assert (=> b!129008 (= res!62282 (and (or (not ((_ is Cons!1700) (toList!861 call!13790))) (bvsle (_1!1309 (h!2303 (toList!861 call!13790))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))) ((_ is Cons!1700) (toList!861 call!13790)) (bvslt (_1!1309 (h!2303 (toList!861 call!13790))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355))))))

(declare-fun b!129009 () Bool)

(assert (=> b!129009 (= e!84198 (containsKey!172 (t!6083 (toList!861 call!13790)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!39133 (not res!62281)) b!129008))

(assert (= (and b!129008 res!62282) b!129009))

(assert (=> b!129009 m!149355))

(declare-fun m!151485 () Bool)

(assert (=> b!129009 m!151485))

(assert (=> d!38643 d!39133))

(declare-fun d!39135 () Bool)

(assert (=> d!39135 (= (get!1459 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3150 (getValueByKey!168 (toList!861 lt!66157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38645 d!39135))

(assert (=> d!38645 d!38881))

(declare-fun d!39137 () Bool)

(declare-fun e!84200 () Bool)

(assert (=> d!39137 e!84200))

(declare-fun res!62283 () Bool)

(assert (=> d!39137 (=> res!62283 e!84200)))

(declare-fun lt!66905 () Bool)

(assert (=> d!39137 (= res!62283 (not lt!66905))))

(declare-fun lt!66908 () Bool)

(assert (=> d!39137 (= lt!66905 lt!66908)))

(declare-fun lt!66907 () Unit!3981)

(declare-fun e!84199 () Unit!3981)

(assert (=> d!39137 (= lt!66907 e!84199)))

(declare-fun c!23714 () Bool)

(assert (=> d!39137 (= c!23714 lt!66908)))

(assert (=> d!39137 (= lt!66908 (containsKey!172 (toList!861 lt!66279) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> d!39137 (= (contains!884 lt!66279 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66905)))

(declare-fun b!129010 () Bool)

(declare-fun lt!66906 () Unit!3981)

(assert (=> b!129010 (= e!84199 lt!66906)))

(assert (=> b!129010 (= lt!66906 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66279) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(assert (=> b!129010 (isDefined!121 (getValueByKey!168 (toList!861 lt!66279) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!129011 () Bool)

(declare-fun Unit!4033 () Unit!3981)

(assert (=> b!129011 (= e!84199 Unit!4033)))

(declare-fun b!129012 () Bool)

(assert (=> b!129012 (= e!84200 (isDefined!121 (getValueByKey!168 (toList!861 lt!66279) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!39137 c!23714) b!129010))

(assert (= (and d!39137 (not c!23714)) b!129011))

(assert (= (and d!39137 (not res!62283)) b!129012))

(declare-fun m!151487 () Bool)

(assert (=> d!39137 m!151487))

(declare-fun m!151489 () Bool)

(assert (=> b!129010 m!151489))

(assert (=> b!129010 m!149805))

(assert (=> b!129010 m!149805))

(declare-fun m!151491 () Bool)

(assert (=> b!129010 m!151491))

(assert (=> b!129012 m!149805))

(assert (=> b!129012 m!149805))

(assert (=> b!129012 m!151491))

(assert (=> d!38639 d!39137))

(declare-fun c!23715 () Bool)

(declare-fun d!39139 () Bool)

(assert (=> d!39139 (= c!23715 (and ((_ is Cons!1700) lt!66282) (= (_1!1309 (h!2303 lt!66282)) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun e!84201 () Option!174)

(assert (=> d!39139 (= (getValueByKey!168 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) e!84201)))

(declare-fun b!129014 () Bool)

(declare-fun e!84202 () Option!174)

(assert (=> b!129014 (= e!84201 e!84202)))

(declare-fun c!23716 () Bool)

(assert (=> b!129014 (= c!23716 (and ((_ is Cons!1700) lt!66282) (not (= (_1!1309 (h!2303 lt!66282)) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun b!129015 () Bool)

(assert (=> b!129015 (= e!84202 (getValueByKey!168 (t!6083 lt!66282) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!129016 () Bool)

(assert (=> b!129016 (= e!84202 None!172)))

(declare-fun b!129013 () Bool)

(assert (=> b!129013 (= e!84201 (Some!173 (_2!1309 (h!2303 lt!66282))))))

(assert (= (and d!39139 c!23715) b!129013))

(assert (= (and d!39139 (not c!23715)) b!129014))

(assert (= (and b!129014 c!23716) b!129015))

(assert (= (and b!129014 (not c!23716)) b!129016))

(declare-fun m!151493 () Bool)

(assert (=> b!129015 m!151493))

(assert (=> d!38639 d!39139))

(declare-fun d!39141 () Bool)

(assert (=> d!39141 (= (getValueByKey!168 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) (Some!173 (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun lt!66909 () Unit!3981)

(assert (=> d!39141 (= lt!66909 (choose!783 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun e!84203 () Bool)

(assert (=> d!39141 e!84203))

(declare-fun res!62284 () Bool)

(assert (=> d!39141 (=> (not res!62284) (not e!84203))))

(assert (=> d!39141 (= res!62284 (isStrictlySorted!318 lt!66282))))

(assert (=> d!39141 (= (lemmaContainsTupThenGetReturnValue!83 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66909)))

(declare-fun b!129017 () Bool)

(declare-fun res!62285 () Bool)

(assert (=> b!129017 (=> (not res!62285) (not e!84203))))

(assert (=> b!129017 (= res!62285 (containsKey!172 lt!66282 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!129018 () Bool)

(assert (=> b!129018 (= e!84203 (contains!886 lt!66282 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (= (and d!39141 res!62284) b!129017))

(assert (= (and b!129017 res!62285) b!129018))

(assert (=> d!39141 m!149799))

(declare-fun m!151495 () Bool)

(assert (=> d!39141 m!151495))

(declare-fun m!151497 () Bool)

(assert (=> d!39141 m!151497))

(declare-fun m!151499 () Bool)

(assert (=> b!129017 m!151499))

(declare-fun m!151501 () Bool)

(assert (=> b!129018 m!151501))

(assert (=> d!38639 d!39141))

(declare-fun e!84205 () List!1704)

(declare-fun b!129019 () Bool)

(declare-fun c!23718 () Bool)

(declare-fun c!23717 () Bool)

(assert (=> b!129019 (= e!84205 (ite c!23718 (t!6083 (toList!861 lt!66141)) (ite c!23717 (Cons!1700 (h!2303 (toList!861 lt!66141)) (t!6083 (toList!861 lt!66141))) Nil!1701)))))

(declare-fun b!129020 () Bool)

(declare-fun e!84207 () List!1704)

(declare-fun e!84204 () List!1704)

(assert (=> b!129020 (= e!84207 e!84204)))

(assert (=> b!129020 (= c!23718 (and ((_ is Cons!1700) (toList!861 lt!66141)) (= (_1!1309 (h!2303 (toList!861 lt!66141))) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun b!129021 () Bool)

(assert (=> b!129021 (= e!84205 (insertStrictlySorted!86 (t!6083 (toList!861 lt!66141)) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun b!129022 () Bool)

(declare-fun res!62287 () Bool)

(declare-fun e!84206 () Bool)

(assert (=> b!129022 (=> (not res!62287) (not e!84206))))

(declare-fun lt!66910 () List!1704)

(assert (=> b!129022 (= res!62287 (containsKey!172 lt!66910 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))

(declare-fun bm!13972 () Bool)

(declare-fun call!13975 () List!1704)

(declare-fun call!13977 () List!1704)

(assert (=> bm!13972 (= call!13975 call!13977)))

(declare-fun b!129023 () Bool)

(declare-fun e!84208 () List!1704)

(declare-fun call!13976 () List!1704)

(assert (=> b!129023 (= e!84208 call!13976)))

(declare-fun b!129024 () Bool)

(assert (=> b!129024 (= e!84208 call!13976)))

(declare-fun b!129025 () Bool)

(assert (=> b!129025 (= c!23717 (and ((_ is Cons!1700) (toList!861 lt!66141)) (bvsgt (_1!1309 (h!2303 (toList!861 lt!66141))) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> b!129025 (= e!84204 e!84208)))

(declare-fun b!129026 () Bool)

(assert (=> b!129026 (= e!84204 call!13975)))

(declare-fun b!129027 () Bool)

(assert (=> b!129027 (= e!84207 call!13977)))

(declare-fun b!129028 () Bool)

(assert (=> b!129028 (= e!84206 (contains!886 lt!66910 (tuple2!2597 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(declare-fun c!23720 () Bool)

(declare-fun bm!13974 () Bool)

(assert (=> bm!13974 (= call!13977 ($colon$colon!90 e!84205 (ite c!23720 (h!2303 (toList!861 lt!66141)) (tuple2!2597 (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))))))))

(declare-fun c!23719 () Bool)

(assert (=> bm!13974 (= c!23719 c!23720)))

(declare-fun d!39143 () Bool)

(assert (=> d!39143 e!84206))

(declare-fun res!62286 () Bool)

(assert (=> d!39143 (=> (not res!62286) (not e!84206))))

(assert (=> d!39143 (= res!62286 (isStrictlySorted!318 lt!66910))))

(assert (=> d!39143 (= lt!66910 e!84207)))

(assert (=> d!39143 (= c!23720 (and ((_ is Cons!1700) (toList!861 lt!66141)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66141))) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))))

(assert (=> d!39143 (isStrictlySorted!318 (toList!861 lt!66141))))

(assert (=> d!39143 (= (insertStrictlySorted!86 (toList!861 lt!66141) (_1!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) (_2!1309 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992)))))) lt!66910)))

(declare-fun bm!13973 () Bool)

(assert (=> bm!13973 (= call!13976 call!13975)))

(assert (= (and d!39143 c!23720) b!129027))

(assert (= (and d!39143 (not c!23720)) b!129020))

(assert (= (and b!129020 c!23718) b!129026))

(assert (= (and b!129020 (not c!23718)) b!129025))

(assert (= (and b!129025 c!23717) b!129023))

(assert (= (and b!129025 (not c!23717)) b!129024))

(assert (= (or b!129023 b!129024) bm!13973))

(assert (= (or b!129026 bm!13973) bm!13972))

(assert (= (or b!129027 bm!13972) bm!13974))

(assert (= (and bm!13974 c!23719) b!129021))

(assert (= (and bm!13974 (not c!23719)) b!129019))

(assert (= (and d!39143 res!62286) b!129022))

(assert (= (and b!129022 res!62287) b!129028))

(declare-fun m!151503 () Bool)

(assert (=> b!129028 m!151503))

(declare-fun m!151505 () Bool)

(assert (=> b!129021 m!151505))

(declare-fun m!151507 () Bool)

(assert (=> d!39143 m!151507))

(declare-fun m!151509 () Bool)

(assert (=> d!39143 m!151509))

(declare-fun m!151511 () Bool)

(assert (=> b!129022 m!151511))

(declare-fun m!151513 () Bool)

(assert (=> bm!13974 m!151513))

(assert (=> d!38639 d!39143))

(declare-fun d!39145 () Bool)

(declare-fun e!84210 () Bool)

(assert (=> d!39145 e!84210))

(declare-fun res!62288 () Bool)

(assert (=> d!39145 (=> res!62288 e!84210)))

(declare-fun lt!66911 () Bool)

(assert (=> d!39145 (= res!62288 (not lt!66911))))

(declare-fun lt!66914 () Bool)

(assert (=> d!39145 (= lt!66911 lt!66914)))

(declare-fun lt!66913 () Unit!3981)

(declare-fun e!84209 () Unit!3981)

(assert (=> d!39145 (= lt!66913 e!84209)))

(declare-fun c!23721 () Bool)

(assert (=> d!39145 (= c!23721 lt!66914)))

(assert (=> d!39145 (= lt!66914 (containsKey!172 (toList!861 lt!66179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39145 (= (contains!884 lt!66179 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66911)))

(declare-fun b!129029 () Bool)

(declare-fun lt!66912 () Unit!3981)

(assert (=> b!129029 (= e!84209 lt!66912)))

(assert (=> b!129029 (= lt!66912 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129029 (isDefined!121 (getValueByKey!168 (toList!861 lt!66179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129030 () Bool)

(declare-fun Unit!4034 () Unit!3981)

(assert (=> b!129030 (= e!84209 Unit!4034)))

(declare-fun b!129031 () Bool)

(assert (=> b!129031 (= e!84210 (isDefined!121 (getValueByKey!168 (toList!861 lt!66179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39145 c!23721) b!129029))

(assert (= (and d!39145 (not c!23721)) b!129030))

(assert (= (and d!39145 (not res!62288)) b!129031))

(declare-fun m!151515 () Bool)

(assert (=> d!39145 m!151515))

(declare-fun m!151517 () Bool)

(assert (=> b!129029 m!151517))

(assert (=> b!129029 m!150487))

(assert (=> b!129029 m!150487))

(declare-fun m!151519 () Bool)

(assert (=> b!129029 m!151519))

(assert (=> b!129031 m!150487))

(assert (=> b!129031 m!150487))

(assert (=> b!129031 m!151519))

(assert (=> bm!13836 d!39145))

(declare-fun d!39147 () Bool)

(assert (=> d!39147 (isDefined!121 (getValueByKey!168 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun lt!66915 () Unit!3981)

(assert (=> d!39147 (= lt!66915 (choose!780 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(declare-fun e!84211 () Bool)

(assert (=> d!39147 e!84211))

(declare-fun res!62289 () Bool)

(assert (=> d!39147 (=> (not res!62289) (not e!84211))))

(assert (=> d!39147 (= res!62289 (isStrictlySorted!318 (toList!861 call!13790)))))

(assert (=> d!39147 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) lt!66915)))

(declare-fun b!129032 () Bool)

(assert (=> b!129032 (= e!84211 (containsKey!172 (toList!861 call!13790) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (= (and d!39147 res!62289) b!129032))

(assert (=> d!39147 m!149355))

(assert (=> d!39147 m!149817))

(assert (=> d!39147 m!149817))

(assert (=> d!39147 m!149819))

(assert (=> d!39147 m!149355))

(declare-fun m!151521 () Bool)

(assert (=> d!39147 m!151521))

(declare-fun m!151523 () Bool)

(assert (=> d!39147 m!151523))

(assert (=> b!129032 m!149355))

(assert (=> b!129032 m!149813))

(assert (=> b!128096 d!39147))

(assert (=> b!128096 d!38945))

(assert (=> b!128096 d!38947))

(declare-fun d!39149 () Bool)

(declare-fun e!84213 () Bool)

(assert (=> d!39149 e!84213))

(declare-fun res!62290 () Bool)

(assert (=> d!39149 (=> res!62290 e!84213)))

(declare-fun lt!66916 () Bool)

(assert (=> d!39149 (= res!62290 (not lt!66916))))

(declare-fun lt!66919 () Bool)

(assert (=> d!39149 (= lt!66916 lt!66919)))

(declare-fun lt!66918 () Unit!3981)

(declare-fun e!84212 () Unit!3981)

(assert (=> d!39149 (= lt!66918 e!84212)))

(declare-fun c!23722 () Bool)

(assert (=> d!39149 (= c!23722 lt!66919)))

(assert (=> d!39149 (= lt!66919 (containsKey!172 (toList!861 lt!66244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39149 (= (contains!884 lt!66244 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66916)))

(declare-fun b!129033 () Bool)

(declare-fun lt!66917 () Unit!3981)

(assert (=> b!129033 (= e!84212 lt!66917)))

(assert (=> b!129033 (= lt!66917 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129033 (isDefined!121 (getValueByKey!168 (toList!861 lt!66244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129034 () Bool)

(declare-fun Unit!4035 () Unit!3981)

(assert (=> b!129034 (= e!84212 Unit!4035)))

(declare-fun b!129035 () Bool)

(assert (=> b!129035 (= e!84213 (isDefined!121 (getValueByKey!168 (toList!861 lt!66244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39149 c!23722) b!129033))

(assert (= (and d!39149 (not c!23722)) b!129034))

(assert (= (and d!39149 (not res!62290)) b!129035))

(declare-fun m!151525 () Bool)

(assert (=> d!39149 m!151525))

(declare-fun m!151527 () Bool)

(assert (=> b!129033 m!151527))

(assert (=> b!129033 m!151243))

(assert (=> b!129033 m!151243))

(declare-fun m!151529 () Bool)

(assert (=> b!129033 m!151529))

(assert (=> b!129035 m!151243))

(assert (=> b!129035 m!151243))

(assert (=> b!129035 m!151529))

(assert (=> bm!13848 d!39149))

(declare-fun d!39151 () Bool)

(assert (=> d!39151 (= (inRange!0 (ite c!23502 (index!3241 lt!66429) (ite c!23501 (index!3240 lt!66417) (index!3243 lt!66417))) (mask!7073 newMap!16)) (and (bvsge (ite c!23502 (index!3241 lt!66429) (ite c!23501 (index!3240 lt!66417) (index!3243 lt!66417))) #b00000000000000000000000000000000) (bvslt (ite c!23502 (index!3241 lt!66429) (ite c!23501 (index!3240 lt!66417) (index!3243 lt!66417))) (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13877 d!39151))

(assert (=> bm!13866 d!39001))

(declare-fun b!129054 () Bool)

(declare-fun e!84228 () Bool)

(declare-fun e!84226 () Bool)

(assert (=> b!129054 (= e!84228 e!84226)))

(declare-fun res!62298 () Bool)

(declare-fun lt!66924 () SeekEntryResult!271)

(assert (=> b!129054 (= res!62298 (and ((_ is Intermediate!271) lt!66924) (not (undefined!1083 lt!66924)) (bvslt (x!15122 lt!66924) #b01111111111111111111111111111110) (bvsge (x!15122 lt!66924) #b00000000000000000000000000000000) (bvsge (x!15122 lt!66924) #b00000000000000000000000000000000)))))

(assert (=> b!129054 (=> (not res!62298) (not e!84226))))

(declare-fun e!84225 () SeekEntryResult!271)

(declare-fun b!129055 () Bool)

(assert (=> b!129055 (= e!84225 (Intermediate!271 true (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!129056 () Bool)

(declare-fun e!84224 () SeekEntryResult!271)

(assert (=> b!129056 (= e!84225 e!84224)))

(declare-fun lt!66925 () (_ BitVec 64))

(declare-fun c!23730 () Bool)

(assert (=> b!129056 (= c!23730 (or (= lt!66925 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)) (= (bvadd lt!66925 lt!66925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129057 () Bool)

(assert (=> b!129057 (and (bvsge (index!3242 lt!66924) #b00000000000000000000000000000000) (bvslt (index!3242 lt!66924) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun e!84227 () Bool)

(assert (=> b!129057 (= e!84227 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3242 lt!66924)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129058 () Bool)

(assert (=> b!129058 (and (bvsge (index!3242 lt!66924) #b00000000000000000000000000000000) (bvslt (index!3242 lt!66924) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun res!62299 () Bool)

(assert (=> b!129058 (= res!62299 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3242 lt!66924)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129058 (=> res!62299 e!84227)))

(declare-fun b!129059 () Bool)

(assert (=> b!129059 (= e!84224 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16)) #b00000000000000000000000000000000 (mask!7073 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)))))

(declare-fun b!129060 () Bool)

(assert (=> b!129060 (and (bvsge (index!3242 lt!66924) #b00000000000000000000000000000000) (bvslt (index!3242 lt!66924) (size!2502 (_keys!4542 newMap!16))))))

(declare-fun res!62297 () Bool)

(assert (=> b!129060 (= res!62297 (= (select (arr!2237 (_keys!4542 newMap!16)) (index!3242 lt!66924)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355)))))

(assert (=> b!129060 (=> res!62297 e!84227)))

(assert (=> b!129060 (= e!84226 e!84227)))

(declare-fun b!129061 () Bool)

(assert (=> b!129061 (= e!84228 (bvsge (x!15122 lt!66924) #b01111111111111111111111111111110))))

(declare-fun d!39153 () Bool)

(assert (=> d!39153 e!84228))

(declare-fun c!23729 () Bool)

(assert (=> d!39153 (= c!23729 (and ((_ is Intermediate!271) lt!66924) (undefined!1083 lt!66924)))))

(assert (=> d!39153 (= lt!66924 e!84225)))

(declare-fun c!23731 () Bool)

(assert (=> d!39153 (= c!23731 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!39153 (= lt!66925 (select (arr!2237 (_keys!4542 newMap!16)) (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16))))))

(assert (=> d!39153 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!39153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (_keys!4542 newMap!16) (mask!7073 newMap!16)) lt!66924)))

(declare-fun b!129062 () Bool)

(assert (=> b!129062 (= e!84224 (Intermediate!271 false (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16)) #b00000000000000000000000000000000))))

(assert (= (and d!39153 c!23731) b!129055))

(assert (= (and d!39153 (not c!23731)) b!129056))

(assert (= (and b!129056 c!23730) b!129062))

(assert (= (and b!129056 (not c!23730)) b!129059))

(assert (= (and d!39153 c!23729) b!129061))

(assert (= (and d!39153 (not c!23729)) b!129054))

(assert (= (and b!129054 res!62298) b!129060))

(assert (= (and b!129060 (not res!62297)) b!129058))

(assert (= (and b!129058 (not res!62299)) b!129057))

(assert (=> d!39153 m!149615))

(declare-fun m!151531 () Bool)

(assert (=> d!39153 m!151531))

(assert (=> d!39153 m!149599))

(declare-fun m!151533 () Bool)

(assert (=> b!129057 m!151533))

(assert (=> b!129058 m!151533))

(assert (=> b!129060 m!151533))

(assert (=> b!129059 m!149615))

(declare-fun m!151535 () Bool)

(assert (=> b!129059 m!151535))

(assert (=> b!129059 m!151535))

(assert (=> b!129059 m!149355))

(declare-fun m!151537 () Bool)

(assert (=> b!129059 m!151537))

(assert (=> d!38599 d!39153))

(declare-fun d!39155 () Bool)

(declare-fun lt!66931 () (_ BitVec 32))

(declare-fun lt!66930 () (_ BitVec 32))

(assert (=> d!39155 (= lt!66931 (bvmul (bvxor lt!66930 (bvlshr lt!66930 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!39155 (= lt!66930 ((_ extract 31 0) (bvand (bvxor (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvlshr (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!39155 (and (bvsge (mask!7073 newMap!16) #b00000000000000000000000000000000) (let ((res!62300 (let ((h!2306 ((_ extract 31 0) (bvand (bvxor (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (bvlshr (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15226 (bvmul (bvxor h!2306 (bvlshr h!2306 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15226 (bvlshr x!15226 #b00000000000000000000000000001101)) (mask!7073 newMap!16)))))) (and (bvslt res!62300 (bvadd (mask!7073 newMap!16) #b00000000000000000000000000000001)) (bvsge res!62300 #b00000000000000000000000000000000))))))

(assert (=> d!39155 (= (toIndex!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (mask!7073 newMap!16)) (bvand (bvxor lt!66931 (bvlshr lt!66931 #b00000000000000000000000000001101)) (mask!7073 newMap!16)))))

(assert (=> d!38599 d!39155))

(assert (=> d!38599 d!38791))

(declare-fun d!39157 () Bool)

(assert (=> d!39157 (isDefined!121 (getValueByKey!168 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!66932 () Unit!3981)

(assert (=> d!39157 (= lt!66932 (choose!780 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84229 () Bool)

(assert (=> d!39157 e!84229))

(declare-fun res!62301 () Bool)

(assert (=> d!39157 (=> (not res!62301) (not e!84229))))

(assert (=> d!39157 (= res!62301 (isStrictlySorted!318 (toList!861 lt!66157)))))

(assert (=> d!39157 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000) lt!66932)))

(declare-fun b!129063 () Bool)

(assert (=> b!129063 (= e!84229 (containsKey!172 (toList!861 lt!66157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39157 res!62301) b!129063))

(assert (=> d!39157 m!150029))

(assert (=> d!39157 m!150029))

(assert (=> d!39157 m!150031))

(declare-fun m!151539 () Bool)

(assert (=> d!39157 m!151539))

(assert (=> d!39157 m!151201))

(assert (=> b!129063 m!150025))

(assert (=> b!128241 d!39157))

(assert (=> b!128241 d!38847))

(assert (=> b!128241 d!38849))

(declare-fun d!39159 () Bool)

(declare-fun res!62302 () Bool)

(declare-fun e!84230 () Bool)

(assert (=> d!39159 (=> res!62302 e!84230)))

(assert (=> d!39159 (= res!62302 (and ((_ is Cons!1700) (toList!861 lt!66157)) (= (_1!1309 (h!2303 (toList!861 lt!66157))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39159 (= (containsKey!172 (toList!861 lt!66157) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!84230)))

(declare-fun b!129064 () Bool)

(declare-fun e!84231 () Bool)

(assert (=> b!129064 (= e!84230 e!84231)))

(declare-fun res!62303 () Bool)

(assert (=> b!129064 (=> (not res!62303) (not e!84231))))

(assert (=> b!129064 (= res!62303 (and (or (not ((_ is Cons!1700) (toList!861 lt!66157))) (bvsle (_1!1309 (h!2303 (toList!861 lt!66157))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1700) (toList!861 lt!66157)) (bvslt (_1!1309 (h!2303 (toList!861 lt!66157))) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!129065 () Bool)

(assert (=> b!129065 (= e!84231 (containsKey!172 (t!6083 (toList!861 lt!66157)) (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39159 (not res!62302)) b!129064))

(assert (= (and b!129064 res!62303) b!129065))

(assert (=> b!129065 m!149485))

(declare-fun m!151541 () Bool)

(assert (=> b!129065 m!151541))

(assert (=> d!38597 d!39159))

(declare-fun d!39161 () Bool)

(assert (=> d!39161 (= (apply!112 lt!66244 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1459 (getValueByKey!168 (toList!861 lt!66244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5350 () Bool)

(assert (= bs!5350 d!39161))

(assert (=> bs!5350 m!151017))

(assert (=> bs!5350 m!151017))

(declare-fun m!151543 () Bool)

(assert (=> bs!5350 m!151543))

(assert (=> b!128054 d!39161))

(declare-fun d!39163 () Bool)

(declare-fun e!84232 () Bool)

(assert (=> d!39163 e!84232))

(declare-fun res!62305 () Bool)

(assert (=> d!39163 (=> (not res!62305) (not e!84232))))

(declare-fun lt!66933 () ListLongMap!1691)

(assert (=> d!39163 (= res!62305 (contains!884 lt!66933 (_1!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66936 () List!1704)

(assert (=> d!39163 (= lt!66933 (ListLongMap!1692 lt!66936))))

(declare-fun lt!66935 () Unit!3981)

(declare-fun lt!66934 () Unit!3981)

(assert (=> d!39163 (= lt!66935 lt!66934)))

(assert (=> d!39163 (= (getValueByKey!168 lt!66936 (_1!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39163 (= lt!66934 (lemmaContainsTupThenGetReturnValue!83 lt!66936 (_1!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39163 (= lt!66936 (insertStrictlySorted!86 (toList!861 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16))) (_1!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39163 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66933)))

(declare-fun b!129066 () Bool)

(declare-fun res!62304 () Bool)

(assert (=> b!129066 (=> (not res!62304) (not e!84232))))

(assert (=> b!129066 (= res!62304 (= (getValueByKey!168 (toList!861 lt!66933) (_1!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1309 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129067 () Bool)

(assert (=> b!129067 (= e!84232 (contains!886 (toList!861 lt!66933) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39163 res!62305) b!129066))

(assert (= (and b!129066 res!62304) b!129067))

(declare-fun m!151545 () Bool)

(assert (=> d!39163 m!151545))

(declare-fun m!151547 () Bool)

(assert (=> d!39163 m!151547))

(declare-fun m!151549 () Bool)

(assert (=> d!39163 m!151549))

(declare-fun m!151551 () Bool)

(assert (=> d!39163 m!151551))

(declare-fun m!151553 () Bool)

(assert (=> b!129066 m!151553))

(declare-fun m!151555 () Bool)

(assert (=> b!129067 m!151555))

(assert (=> d!38605 d!39163))

(assert (=> d!38605 d!38611))

(declare-fun b!129068 () Bool)

(declare-fun e!84233 () Unit!3981)

(declare-fun Unit!4036 () Unit!3981)

(assert (=> b!129068 (= e!84233 Unit!4036)))

(declare-fun b!129069 () Bool)

(declare-fun lt!66955 () ListLongMap!1691)

(declare-fun e!84240 () Bool)

(assert (=> b!129069 (= e!84240 (= (apply!112 lt!66955 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129070 () Bool)

(declare-fun res!62306 () Bool)

(declare-fun e!84236 () Bool)

(assert (=> b!129070 (=> (not res!62306) (not e!84236))))

(declare-fun e!84238 () Bool)

(assert (=> b!129070 (= res!62306 e!84238)))

(declare-fun c!23734 () Bool)

(assert (=> b!129070 (= c!23734 (not (= (bvand lt!66084 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129071 () Bool)

(declare-fun e!84235 () Bool)

(declare-fun e!84237 () Bool)

(assert (=> b!129071 (= e!84235 e!84237)))

(declare-fun res!62310 () Bool)

(declare-fun call!13980 () Bool)

(assert (=> b!129071 (= res!62310 call!13980)))

(assert (=> b!129071 (=> (not res!62310) (not e!84237))))

(declare-fun b!129072 () Bool)

(declare-fun e!84239 () Bool)

(assert (=> b!129072 (= e!84239 (= (apply!112 lt!66955 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)) (get!1455 (select (arr!2238 (_values!2788 newMap!16)) #b00000000000000000000000000000000) (dynLambda!418 (defaultEntry!2805 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2503 (_values!2788 newMap!16))))))

(assert (=> b!129072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13975 () Bool)

(declare-fun call!13984 () ListLongMap!1691)

(declare-fun call!13982 () ListLongMap!1691)

(assert (=> bm!13975 (= call!13984 call!13982)))

(declare-fun b!129073 () Bool)

(declare-fun e!84243 () ListLongMap!1691)

(declare-fun call!13978 () ListLongMap!1691)

(assert (=> b!129073 (= e!84243 call!13978)))

(declare-fun b!129074 () Bool)

(assert (=> b!129074 (= e!84235 (not call!13980))))

(declare-fun c!23736 () Bool)

(declare-fun call!13981 () ListLongMap!1691)

(declare-fun bm!13976 () Bool)

(declare-fun c!23732 () Bool)

(assert (=> bm!13976 (= call!13981 (+!171 (ite c!23732 call!13982 (ite c!23736 call!13984 call!13978)) (ite (or c!23732 c!23736) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16)))))))

(declare-fun b!129075 () Bool)

(declare-fun call!13983 () Bool)

(assert (=> b!129075 (= e!84238 (not call!13983))))

(declare-fun b!129076 () Bool)

(declare-fun e!84241 () ListLongMap!1691)

(declare-fun call!13979 () ListLongMap!1691)

(assert (=> b!129076 (= e!84241 call!13979)))

(declare-fun b!129077 () Bool)

(declare-fun e!84245 () Bool)

(assert (=> b!129077 (= e!84245 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129079 () Bool)

(declare-fun c!23737 () Bool)

(assert (=> b!129079 (= c!23737 (and (not (= (bvand lt!66084 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!66084 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129079 (= e!84241 e!84243)))

(declare-fun bm!13977 () Bool)

(assert (=> bm!13977 (= call!13980 (contains!884 lt!66955 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129080 () Bool)

(declare-fun e!84244 () Bool)

(assert (=> b!129080 (= e!84244 e!84239)))

(declare-fun res!62311 () Bool)

(assert (=> b!129080 (=> (not res!62311) (not e!84239))))

(assert (=> b!129080 (= res!62311 (contains!884 lt!66955 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun bm!13978 () Bool)

(assert (=> bm!13978 (= call!13979 call!13981)))

(declare-fun bm!13979 () Bool)

(assert (=> bm!13979 (= call!13982 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun b!129081 () Bool)

(declare-fun lt!66941 () Unit!3981)

(assert (=> b!129081 (= e!84233 lt!66941)))

(declare-fun lt!66958 () ListLongMap!1691)

(assert (=> b!129081 (= lt!66958 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66952 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66947 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66947 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66938 () Unit!3981)

(assert (=> b!129081 (= lt!66938 (addStillContains!88 lt!66958 lt!66952 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66947))))

(assert (=> b!129081 (contains!884 (+!171 lt!66958 (tuple2!2597 lt!66952 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66947)))

(declare-fun lt!66944 () Unit!3981)

(assert (=> b!129081 (= lt!66944 lt!66938)))

(declare-fun lt!66956 () ListLongMap!1691)

(assert (=> b!129081 (= lt!66956 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66942 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66937 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66937 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66940 () Unit!3981)

(assert (=> b!129081 (= lt!66940 (addApplyDifferent!88 lt!66956 lt!66942 (minValue!2666 newMap!16) lt!66937))))

(assert (=> b!129081 (= (apply!112 (+!171 lt!66956 (tuple2!2597 lt!66942 (minValue!2666 newMap!16))) lt!66937) (apply!112 lt!66956 lt!66937))))

(declare-fun lt!66949 () Unit!3981)

(assert (=> b!129081 (= lt!66949 lt!66940)))

(declare-fun lt!66939 () ListLongMap!1691)

(assert (=> b!129081 (= lt!66939 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66948 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66954 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66954 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66946 () Unit!3981)

(assert (=> b!129081 (= lt!66946 (addApplyDifferent!88 lt!66939 lt!66948 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66954))))

(assert (=> b!129081 (= (apply!112 (+!171 lt!66939 (tuple2!2597 lt!66948 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66954) (apply!112 lt!66939 lt!66954))))

(declare-fun lt!66957 () Unit!3981)

(assert (=> b!129081 (= lt!66957 lt!66946)))

(declare-fun lt!66951 () ListLongMap!1691)

(assert (=> b!129081 (= lt!66951 (getCurrentListMapNoExtraKeys!137 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(declare-fun lt!66950 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66950 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66945 () (_ BitVec 64))

(assert (=> b!129081 (= lt!66945 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129081 (= lt!66941 (addApplyDifferent!88 lt!66951 lt!66950 (minValue!2666 newMap!16) lt!66945))))

(assert (=> b!129081 (= (apply!112 (+!171 lt!66951 (tuple2!2597 lt!66950 (minValue!2666 newMap!16))) lt!66945) (apply!112 lt!66951 lt!66945))))

(declare-fun b!129082 () Bool)

(assert (=> b!129082 (= e!84237 (= (apply!112 lt!66955 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2666 newMap!16)))))

(declare-fun b!129083 () Bool)

(declare-fun e!84242 () ListLongMap!1691)

(assert (=> b!129083 (= e!84242 (+!171 call!13981 (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2666 newMap!16))))))

(declare-fun b!129084 () Bool)

(assert (=> b!129084 (= e!84236 e!84235)))

(declare-fun c!23735 () Bool)

(assert (=> b!129084 (= c!23735 (not (= (bvand lt!66084 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129085 () Bool)

(declare-fun res!62312 () Bool)

(assert (=> b!129085 (=> (not res!62312) (not e!84236))))

(assert (=> b!129085 (= res!62312 e!84244)))

(declare-fun res!62308 () Bool)

(assert (=> b!129085 (=> res!62308 e!84244)))

(declare-fun e!84234 () Bool)

(assert (=> b!129085 (= res!62308 (not e!84234))))

(declare-fun res!62313 () Bool)

(assert (=> b!129085 (=> (not res!62313) (not e!84234))))

(assert (=> b!129085 (= res!62313 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(declare-fun b!129086 () Bool)

(assert (=> b!129086 (= e!84242 e!84241)))

(assert (=> b!129086 (= c!23736 (and (not (= (bvand lt!66084 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!66084 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13980 () Bool)

(assert (=> bm!13980 (= call!13978 call!13984)))

(declare-fun b!129087 () Bool)

(assert (=> b!129087 (= e!84243 call!13979)))

(declare-fun b!129078 () Bool)

(assert (=> b!129078 (= e!84234 (validKeyInArray!0 (select (arr!2237 (_keys!4542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39165 () Bool)

(assert (=> d!39165 e!84236))

(declare-fun res!62309 () Bool)

(assert (=> d!39165 (=> (not res!62309) (not e!84236))))

(assert (=> d!39165 (= res!62309 (or (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))))

(declare-fun lt!66943 () ListLongMap!1691)

(assert (=> d!39165 (= lt!66955 lt!66943)))

(declare-fun lt!66953 () Unit!3981)

(assert (=> d!39165 (= lt!66953 e!84233)))

(declare-fun c!23733 () Bool)

(assert (=> d!39165 (= c!23733 e!84245)))

(declare-fun res!62307 () Bool)

(assert (=> d!39165 (=> (not res!62307) (not e!84245))))

(assert (=> d!39165 (= res!62307 (bvslt #b00000000000000000000000000000000 (size!2502 (_keys!4542 newMap!16))))))

(assert (=> d!39165 (= lt!66943 e!84242)))

(assert (=> d!39165 (= c!23732 (and (not (= (bvand lt!66084 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!66084 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39165 (validMask!0 (mask!7073 newMap!16))))

(assert (=> d!39165 (= (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) lt!66955)))

(declare-fun b!129088 () Bool)

(assert (=> b!129088 (= e!84238 e!84240)))

(declare-fun res!62314 () Bool)

(assert (=> b!129088 (= res!62314 call!13983)))

(assert (=> b!129088 (=> (not res!62314) (not e!84240))))

(declare-fun bm!13981 () Bool)

(assert (=> bm!13981 (= call!13983 (contains!884 lt!66955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39165 c!23732) b!129083))

(assert (= (and d!39165 (not c!23732)) b!129086))

(assert (= (and b!129086 c!23736) b!129076))

(assert (= (and b!129086 (not c!23736)) b!129079))

(assert (= (and b!129079 c!23737) b!129087))

(assert (= (and b!129079 (not c!23737)) b!129073))

(assert (= (or b!129087 b!129073) bm!13980))

(assert (= (or b!129076 bm!13980) bm!13975))

(assert (= (or b!129076 b!129087) bm!13978))

(assert (= (or b!129083 bm!13975) bm!13979))

(assert (= (or b!129083 bm!13978) bm!13976))

(assert (= (and d!39165 res!62307) b!129077))

(assert (= (and d!39165 c!23733) b!129081))

(assert (= (and d!39165 (not c!23733)) b!129068))

(assert (= (and d!39165 res!62309) b!129085))

(assert (= (and b!129085 res!62313) b!129078))

(assert (= (and b!129085 (not res!62308)) b!129080))

(assert (= (and b!129080 res!62311) b!129072))

(assert (= (and b!129085 res!62312) b!129070))

(assert (= (and b!129070 c!23734) b!129088))

(assert (= (and b!129070 (not c!23734)) b!129075))

(assert (= (and b!129088 res!62314) b!129069))

(assert (= (or b!129088 b!129075) bm!13981))

(assert (= (and b!129070 res!62306) b!129084))

(assert (= (and b!129084 c!23735) b!129071))

(assert (= (and b!129084 (not c!23735)) b!129074))

(assert (= (and b!129071 res!62310) b!129082))

(assert (= (or b!129071 b!129074) bm!13977))

(declare-fun b_lambda!5703 () Bool)

(assert (=> (not b_lambda!5703) (not b!129072)))

(assert (=> b!129072 t!6091))

(declare-fun b_and!7979 () Bool)

(assert (= b_and!7975 (and (=> t!6091 result!3893) b_and!7979)))

(assert (=> b!129072 t!6093))

(declare-fun b_and!7981 () Bool)

(assert (= b_and!7977 (and (=> t!6093 result!3895) b_and!7981)))

(declare-fun m!151557 () Bool)

(assert (=> bm!13981 m!151557))

(assert (=> b!129077 m!149547))

(assert (=> b!129077 m!149547))

(assert (=> b!129077 m!149549))

(declare-fun m!151559 () Bool)

(assert (=> b!129083 m!151559))

(assert (=> b!129081 m!149353))

(declare-fun m!151561 () Bool)

(assert (=> b!129081 m!151561))

(declare-fun m!151563 () Bool)

(assert (=> b!129081 m!151563))

(declare-fun m!151565 () Bool)

(assert (=> b!129081 m!151565))

(assert (=> b!129081 m!149547))

(declare-fun m!151567 () Bool)

(assert (=> b!129081 m!151567))

(declare-fun m!151569 () Bool)

(assert (=> b!129081 m!151569))

(declare-fun m!151571 () Bool)

(assert (=> b!129081 m!151571))

(declare-fun m!151573 () Bool)

(assert (=> b!129081 m!151573))

(assert (=> b!129081 m!151571))

(declare-fun m!151575 () Bool)

(assert (=> b!129081 m!151575))

(declare-fun m!151577 () Bool)

(assert (=> b!129081 m!151577))

(assert (=> b!129081 m!151575))

(assert (=> b!129081 m!149353))

(declare-fun m!151579 () Bool)

(assert (=> b!129081 m!151579))

(declare-fun m!151581 () Bool)

(assert (=> b!129081 m!151581))

(declare-fun m!151583 () Bool)

(assert (=> b!129081 m!151583))

(declare-fun m!151585 () Bool)

(assert (=> b!129081 m!151585))

(assert (=> b!129081 m!151569))

(declare-fun m!151587 () Bool)

(assert (=> b!129081 m!151587))

(assert (=> b!129081 m!149353))

(declare-fun m!151589 () Bool)

(assert (=> b!129081 m!151589))

(declare-fun m!151591 () Bool)

(assert (=> b!129081 m!151591))

(assert (=> b!129081 m!151581))

(assert (=> b!129080 m!149547))

(assert (=> b!129080 m!149547))

(declare-fun m!151593 () Bool)

(assert (=> b!129080 m!151593))

(declare-fun m!151595 () Bool)

(assert (=> bm!13977 m!151595))

(declare-fun m!151597 () Bool)

(assert (=> bm!13976 m!151597))

(assert (=> b!129072 m!149707))

(assert (=> b!129072 m!149593))

(assert (=> b!129072 m!149547))

(assert (=> b!129072 m!149547))

(declare-fun m!151599 () Bool)

(assert (=> b!129072 m!151599))

(assert (=> b!129072 m!149707))

(assert (=> b!129072 m!149593))

(assert (=> b!129072 m!149711))

(assert (=> d!39165 m!149599))

(assert (=> b!129078 m!149547))

(assert (=> b!129078 m!149547))

(assert (=> b!129078 m!149549))

(assert (=> bm!13979 m!149353))

(assert (=> bm!13979 m!151561))

(declare-fun m!151601 () Bool)

(assert (=> b!129069 m!151601))

(declare-fun m!151603 () Bool)

(assert (=> b!129082 m!151603))

(assert (=> d!38605 d!39165))

(declare-fun d!39167 () Bool)

(assert (=> d!39167 (= (+!171 (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) (zeroValue!2666 newMap!16) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)) (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!539 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) lt!66084 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2805 newMap!16)))))

(assert (=> d!39167 true))

(declare-fun _$7!110 () Unit!3981)

(assert (=> d!39167 (= (choose!773 (_keys!4542 newMap!16) (_values!2788 newMap!16) (mask!7073 newMap!16) (extraKeys!2582 newMap!16) lt!66084 (zeroValue!2666 newMap!16) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2666 newMap!16) (defaultEntry!2805 newMap!16)) _$7!110)))

(declare-fun bs!5351 () Bool)

(assert (= bs!5351 d!39167))

(assert (=> bs!5351 m!149437))

(assert (=> bs!5351 m!149437))

(assert (=> bs!5351 m!149631))

(assert (=> bs!5351 m!149353))

(assert (=> bs!5351 m!149633))

(assert (=> d!38605 d!39167))

(assert (=> d!38605 d!38791))

(declare-fun d!39169 () Bool)

(declare-fun e!84247 () Bool)

(assert (=> d!39169 e!84247))

(declare-fun res!62315 () Bool)

(assert (=> d!39169 (=> res!62315 e!84247)))

(declare-fun lt!66959 () Bool)

(assert (=> d!39169 (= res!62315 (not lt!66959))))

(declare-fun lt!66962 () Bool)

(assert (=> d!39169 (= lt!66959 lt!66962)))

(declare-fun lt!66961 () Unit!3981)

(declare-fun e!84246 () Unit!3981)

(assert (=> d!39169 (= lt!66961 e!84246)))

(declare-fun c!23738 () Bool)

(assert (=> d!39169 (= c!23738 lt!66962)))

(assert (=> d!39169 (= lt!66962 (containsKey!172 (toList!861 lt!66141) lt!66156))))

(assert (=> d!39169 (= (contains!884 lt!66141 lt!66156) lt!66959)))

(declare-fun b!129089 () Bool)

(declare-fun lt!66960 () Unit!3981)

(assert (=> b!129089 (= e!84246 lt!66960)))

(assert (=> b!129089 (= lt!66960 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 lt!66141) lt!66156))))

(assert (=> b!129089 (isDefined!121 (getValueByKey!168 (toList!861 lt!66141) lt!66156))))

(declare-fun b!129090 () Bool)

(declare-fun Unit!4037 () Unit!3981)

(assert (=> b!129090 (= e!84246 Unit!4037)))

(declare-fun b!129091 () Bool)

(assert (=> b!129091 (= e!84247 (isDefined!121 (getValueByKey!168 (toList!861 lt!66141) lt!66156)))))

(assert (= (and d!39169 c!23738) b!129089))

(assert (= (and d!39169 (not c!23738)) b!129090))

(assert (= (and d!39169 (not res!62315)) b!129091))

(declare-fun m!151605 () Bool)

(assert (=> d!39169 m!151605))

(declare-fun m!151607 () Bool)

(assert (=> b!129089 m!151607))

(assert (=> b!129089 m!149781))

(assert (=> b!129089 m!149781))

(declare-fun m!151609 () Bool)

(assert (=> b!129089 m!151609))

(assert (=> b!129091 m!149781))

(assert (=> b!129091 m!149781))

(assert (=> b!129091 m!151609))

(assert (=> d!38625 d!39169))

(assert (=> d!38625 d!38631))

(assert (=> d!38625 d!38637))

(assert (=> d!38625 d!38639))

(declare-fun d!39171 () Bool)

(assert (=> d!39171 (= (apply!112 (+!171 lt!66141 (tuple2!2597 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66156) (apply!112 lt!66141 lt!66156))))

(assert (=> d!39171 true))

(declare-fun _$34!960 () Unit!3981)

(assert (=> d!39171 (= (choose!775 lt!66141 lt!66150 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))) lt!66156) _$34!960)))

(declare-fun bs!5352 () Bool)

(assert (= bs!5352 d!39171))

(assert (=> bs!5352 m!149505))

(assert (=> bs!5352 m!149505))

(assert (=> bs!5352 m!149507))

(assert (=> bs!5352 m!149515))

(assert (=> d!38625 d!39171))

(declare-fun b!129092 () Bool)

(declare-fun e!84248 () (_ BitVec 32))

(declare-fun call!13985 () (_ BitVec 32))

(assert (=> b!129092 (= e!84248 call!13985)))

(declare-fun bm!13982 () Bool)

(assert (=> bm!13982 (= call!13985 (arrayCountValidKeys!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!129093 () Bool)

(declare-fun e!84249 () (_ BitVec 32))

(assert (=> b!129093 (= e!84249 e!84248)))

(declare-fun c!23739 () Bool)

(assert (=> b!129093 (= c!23739 (validKeyInArray!0 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39173 () Bool)

(declare-fun lt!66963 () (_ BitVec 32))

(assert (=> d!39173 (and (bvsge lt!66963 #b00000000000000000000000000000000) (bvsle lt!66963 (bvsub (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!39173 (= lt!66963 e!84249)))

(declare-fun c!23740 () Bool)

(assert (=> d!39173 (= c!23740 (bvsge #b00000000000000000000000000000000 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!39173 (and (bvsle #b00000000000000000000000000000000 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))))))

(assert (=> d!39173 (= (arrayCountValidKeys!0 (_keys!4542 (v!3146 (underlying!445 thiss!992))) #b00000000000000000000000000000000 (size!2502 (_keys!4542 (v!3146 (underlying!445 thiss!992))))) lt!66963)))

(declare-fun b!129094 () Bool)

(assert (=> b!129094 (= e!84248 (bvadd #b00000000000000000000000000000001 call!13985))))

(declare-fun b!129095 () Bool)

(assert (=> b!129095 (= e!84249 #b00000000000000000000000000000000)))

(assert (= (and d!39173 c!23740) b!129095))

(assert (= (and d!39173 (not c!23740)) b!129093))

(assert (= (and b!129093 c!23739) b!129094))

(assert (= (and b!129093 (not c!23739)) b!129092))

(assert (= (or b!129094 b!129092) bm!13982))

(declare-fun m!151611 () Bool)

(assert (=> bm!13982 m!151611))

(assert (=> b!129093 m!150885))

(assert (=> b!129093 m!150885))

(assert (=> b!129093 m!150887))

(assert (=> b!128244 d!39173))

(declare-fun lt!66964 () Bool)

(declare-fun d!39175 () Bool)

(assert (=> d!39175 (= lt!66964 (select (content!127 (toList!861 lt!66275)) (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun e!84251 () Bool)

(assert (=> d!39175 (= lt!66964 e!84251)))

(declare-fun res!62317 () Bool)

(assert (=> d!39175 (=> (not res!62317) (not e!84251))))

(assert (=> d!39175 (= res!62317 ((_ is Cons!1700) (toList!861 lt!66275)))))

(assert (=> d!39175 (= (contains!886 (toList!861 lt!66275) (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))) lt!66964)))

(declare-fun b!129096 () Bool)

(declare-fun e!84250 () Bool)

(assert (=> b!129096 (= e!84251 e!84250)))

(declare-fun res!62316 () Bool)

(assert (=> b!129096 (=> res!62316 e!84250)))

(assert (=> b!129096 (= res!62316 (= (h!2303 (toList!861 lt!66275)) (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(declare-fun b!129097 () Bool)

(assert (=> b!129097 (= e!84250 (contains!886 (t!6083 (toList!861 lt!66275)) (tuple2!2597 lt!66154 (zeroValue!2666 (v!3146 (underlying!445 thiss!992))))))))

(assert (= (and d!39175 res!62317) b!129096))

(assert (= (and b!129096 (not res!62316)) b!129097))

(declare-fun m!151613 () Bool)

(assert (=> d!39175 m!151613))

(declare-fun m!151615 () Bool)

(assert (=> d!39175 m!151615))

(declare-fun m!151617 () Bool)

(assert (=> b!129097 m!151617))

(assert (=> b!128092 d!39175))

(declare-fun d!39177 () Bool)

(assert (=> d!39177 (= (get!1459 (getValueByKey!168 (toList!861 lt!66158) lt!66139)) (v!3150 (getValueByKey!168 (toList!861 lt!66158) lt!66139)))))

(assert (=> d!38633 d!39177))

(declare-fun d!39179 () Bool)

(declare-fun c!23741 () Bool)

(assert (=> d!39179 (= c!23741 (and ((_ is Cons!1700) (toList!861 lt!66158)) (= (_1!1309 (h!2303 (toList!861 lt!66158))) lt!66139)))))

(declare-fun e!84252 () Option!174)

(assert (=> d!39179 (= (getValueByKey!168 (toList!861 lt!66158) lt!66139) e!84252)))

(declare-fun b!129099 () Bool)

(declare-fun e!84253 () Option!174)

(assert (=> b!129099 (= e!84252 e!84253)))

(declare-fun c!23742 () Bool)

(assert (=> b!129099 (= c!23742 (and ((_ is Cons!1700) (toList!861 lt!66158)) (not (= (_1!1309 (h!2303 (toList!861 lt!66158))) lt!66139))))))

(declare-fun b!129100 () Bool)

(assert (=> b!129100 (= e!84253 (getValueByKey!168 (t!6083 (toList!861 lt!66158)) lt!66139))))

(declare-fun b!129101 () Bool)

(assert (=> b!129101 (= e!84253 None!172)))

(declare-fun b!129098 () Bool)

(assert (=> b!129098 (= e!84252 (Some!173 (_2!1309 (h!2303 (toList!861 lt!66158)))))))

(assert (= (and d!39179 c!23741) b!129098))

(assert (= (and d!39179 (not c!23741)) b!129099))

(assert (= (and b!129099 c!23742) b!129100))

(assert (= (and b!129099 (not c!23742)) b!129101))

(declare-fun m!151619 () Bool)

(assert (=> b!129100 m!151619))

(assert (=> d!38633 d!39179))

(declare-fun d!39181 () Bool)

(declare-fun e!84254 () Bool)

(assert (=> d!39181 e!84254))

(declare-fun res!62319 () Bool)

(assert (=> d!39181 (=> (not res!62319) (not e!84254))))

(declare-fun lt!66965 () ListLongMap!1691)

(assert (=> d!39181 (= res!62319 (contains!884 lt!66965 (_1!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))))))

(declare-fun lt!66968 () List!1704)

(assert (=> d!39181 (= lt!66965 (ListLongMap!1692 lt!66968))))

(declare-fun lt!66967 () Unit!3981)

(declare-fun lt!66966 () Unit!3981)

(assert (=> d!39181 (= lt!66967 lt!66966)))

(assert (=> d!39181 (= (getValueByKey!168 lt!66968 (_1!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39181 (= lt!66966 (lemmaContainsTupThenGetReturnValue!83 lt!66968 (_1!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39181 (= lt!66968 (insertStrictlySorted!86 (toList!861 lt!66247) (_1!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39181 (= (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))) lt!66965)))

(declare-fun b!129102 () Bool)

(declare-fun res!62318 () Bool)

(assert (=> b!129102 (=> (not res!62318) (not e!84254))))

(assert (=> b!129102 (= res!62318 (= (getValueByKey!168 (toList!861 lt!66965) (_1!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))))))))

(declare-fun b!129103 () Bool)

(assert (=> b!129103 (= e!84254 (contains!886 (toList!861 lt!66965) (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))))))

(assert (= (and d!39181 res!62319) b!129102))

(assert (= (and b!129102 res!62318) b!129103))

(declare-fun m!151621 () Bool)

(assert (=> d!39181 m!151621))

(declare-fun m!151623 () Bool)

(assert (=> d!39181 m!151623))

(declare-fun m!151625 () Bool)

(assert (=> d!39181 m!151625))

(declare-fun m!151627 () Bool)

(assert (=> d!39181 m!151627))

(declare-fun m!151629 () Bool)

(assert (=> b!129102 m!151629))

(declare-fun m!151631 () Bool)

(assert (=> b!129103 m!151631))

(assert (=> b!128066 d!39181))

(declare-fun d!39183 () Bool)

(assert (=> d!39183 (= (apply!112 lt!66245 lt!66226) (get!1459 (getValueByKey!168 (toList!861 lt!66245) lt!66226)))))

(declare-fun bs!5353 () Bool)

(assert (= bs!5353 d!39183))

(declare-fun m!151633 () Bool)

(assert (=> bs!5353 m!151633))

(assert (=> bs!5353 m!151633))

(declare-fun m!151635 () Bool)

(assert (=> bs!5353 m!151635))

(assert (=> b!128066 d!39183))

(declare-fun d!39185 () Bool)

(declare-fun e!84256 () Bool)

(assert (=> d!39185 e!84256))

(declare-fun res!62320 () Bool)

(assert (=> d!39185 (=> res!62320 e!84256)))

(declare-fun lt!66969 () Bool)

(assert (=> d!39185 (= res!62320 (not lt!66969))))

(declare-fun lt!66972 () Bool)

(assert (=> d!39185 (= lt!66969 lt!66972)))

(declare-fun lt!66971 () Unit!3981)

(declare-fun e!84255 () Unit!3981)

(assert (=> d!39185 (= lt!66971 e!84255)))

(declare-fun c!23743 () Bool)

(assert (=> d!39185 (= c!23743 lt!66972)))

(assert (=> d!39185 (= lt!66972 (containsKey!172 (toList!861 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))) lt!66236))))

(assert (=> d!39185 (= (contains!884 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))) lt!66236) lt!66969)))

(declare-fun b!129104 () Bool)

(declare-fun lt!66970 () Unit!3981)

(assert (=> b!129104 (= e!84255 lt!66970)))

(assert (=> b!129104 (= lt!66970 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!861 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))) lt!66236))))

(assert (=> b!129104 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))) lt!66236))))

(declare-fun b!129105 () Bool)

(declare-fun Unit!4038 () Unit!3981)

(assert (=> b!129105 (= e!84255 Unit!4038)))

(declare-fun b!129106 () Bool)

(assert (=> b!129106 (= e!84256 (isDefined!121 (getValueByKey!168 (toList!861 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16)))) lt!66236)))))

(assert (= (and d!39185 c!23743) b!129104))

(assert (= (and d!39185 (not c!23743)) b!129105))

(assert (= (and d!39185 (not res!62320)) b!129106))

(declare-fun m!151637 () Bool)

(assert (=> d!39185 m!151637))

(declare-fun m!151639 () Bool)

(assert (=> b!129104 m!151639))

(declare-fun m!151641 () Bool)

(assert (=> b!129104 m!151641))

(assert (=> b!129104 m!151641))

(declare-fun m!151643 () Bool)

(assert (=> b!129104 m!151643))

(assert (=> b!129106 m!151641))

(assert (=> b!129106 m!151641))

(assert (=> b!129106 m!151643))

(assert (=> b!128066 d!39185))

(declare-fun d!39187 () Bool)

(declare-fun e!84257 () Bool)

(assert (=> d!39187 e!84257))

(declare-fun res!62322 () Bool)

(assert (=> d!39187 (=> (not res!62322) (not e!84257))))

(declare-fun lt!66973 () ListLongMap!1691)

(assert (=> d!39187 (= res!62322 (contains!884 lt!66973 (_1!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))))))

(declare-fun lt!66976 () List!1704)

(assert (=> d!39187 (= lt!66973 (ListLongMap!1692 lt!66976))))

(declare-fun lt!66975 () Unit!3981)

(declare-fun lt!66974 () Unit!3981)

(assert (=> d!39187 (= lt!66975 lt!66974)))

(assert (=> d!39187 (= (getValueByKey!168 lt!66976 (_1!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))))))

(assert (=> d!39187 (= lt!66974 (lemmaContainsTupThenGetReturnValue!83 lt!66976 (_1!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))))))

(assert (=> d!39187 (= lt!66976 (insertStrictlySorted!86 (toList!861 lt!66245) (_1!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))))))

(assert (=> d!39187 (= (+!171 lt!66245 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))) lt!66973)))

(declare-fun b!129107 () Bool)

(declare-fun res!62321 () Bool)

(assert (=> b!129107 (=> (not res!62321) (not e!84257))))

(assert (=> b!129107 (= res!62321 (= (getValueByKey!168 (toList!861 lt!66973) (_1!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))))))))

(declare-fun b!129108 () Bool)

(assert (=> b!129108 (= e!84257 (contains!886 (toList!861 lt!66973) (tuple2!2597 lt!66231 (minValue!2666 newMap!16))))))

(assert (= (and d!39187 res!62322) b!129107))

(assert (= (and b!129107 res!62321) b!129108))

(declare-fun m!151645 () Bool)

(assert (=> d!39187 m!151645))

(declare-fun m!151647 () Bool)

(assert (=> d!39187 m!151647))

(declare-fun m!151649 () Bool)

(assert (=> d!39187 m!151649))

(declare-fun m!151651 () Bool)

(assert (=> d!39187 m!151651))

(declare-fun m!151653 () Bool)

(assert (=> b!129107 m!151653))

(declare-fun m!151655 () Bool)

(assert (=> b!129108 m!151655))

(assert (=> b!128066 d!39187))

(declare-fun d!39189 () Bool)

(assert (=> d!39189 (= (apply!112 (+!171 lt!66240 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))) lt!66234) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66240 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))) lt!66234)))))

(declare-fun bs!5354 () Bool)

(assert (= bs!5354 d!39189))

(declare-fun m!151657 () Bool)

(assert (=> bs!5354 m!151657))

(assert (=> bs!5354 m!151657))

(declare-fun m!151659 () Bool)

(assert (=> bs!5354 m!151659))

(assert (=> b!128066 d!39189))

(assert (=> b!128066 d!38789))

(declare-fun d!39191 () Bool)

(assert (=> d!39191 (= (apply!112 (+!171 lt!66228 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))) lt!66243) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66228 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))) lt!66243)))))

(declare-fun bs!5355 () Bool)

(assert (= bs!5355 d!39191))

(declare-fun m!151661 () Bool)

(assert (=> bs!5355 m!151661))

(assert (=> bs!5355 m!151661))

(declare-fun m!151663 () Bool)

(assert (=> bs!5355 m!151663))

(assert (=> b!128066 d!39191))

(declare-fun d!39193 () Bool)

(assert (=> d!39193 (= (apply!112 lt!66228 lt!66243) (get!1459 (getValueByKey!168 (toList!861 lt!66228) lt!66243)))))

(declare-fun bs!5356 () Bool)

(assert (= bs!5356 d!39193))

(declare-fun m!151665 () Bool)

(assert (=> bs!5356 m!151665))

(assert (=> bs!5356 m!151665))

(declare-fun m!151667 () Bool)

(assert (=> bs!5356 m!151667))

(assert (=> b!128066 d!39193))

(declare-fun d!39195 () Bool)

(declare-fun e!84258 () Bool)

(assert (=> d!39195 e!84258))

(declare-fun res!62324 () Bool)

(assert (=> d!39195 (=> (not res!62324) (not e!84258))))

(declare-fun lt!66977 () ListLongMap!1691)

(assert (=> d!39195 (= res!62324 (contains!884 lt!66977 (_1!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))))))

(declare-fun lt!66980 () List!1704)

(assert (=> d!39195 (= lt!66977 (ListLongMap!1692 lt!66980))))

(declare-fun lt!66979 () Unit!3981)

(declare-fun lt!66978 () Unit!3981)

(assert (=> d!39195 (= lt!66979 lt!66978)))

(assert (=> d!39195 (= (getValueByKey!168 lt!66980 (_1!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))))))

(assert (=> d!39195 (= lt!66978 (lemmaContainsTupThenGetReturnValue!83 lt!66980 (_1!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))))))

(assert (=> d!39195 (= lt!66980 (insertStrictlySorted!86 (toList!861 lt!66240) (_1!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))))))

(assert (=> d!39195 (= (+!171 lt!66240 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))) lt!66977)))

(declare-fun b!129109 () Bool)

(declare-fun res!62323 () Bool)

(assert (=> b!129109 (=> (not res!62323) (not e!84258))))

(assert (=> b!129109 (= res!62323 (= (getValueByKey!168 (toList!861 lt!66977) (_1!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))))))))

(declare-fun b!129110 () Bool)

(assert (=> b!129110 (= e!84258 (contains!886 (toList!861 lt!66977) (tuple2!2597 lt!66239 (minValue!2666 newMap!16))))))

(assert (= (and d!39195 res!62324) b!129109))

(assert (= (and b!129109 res!62323) b!129110))

(declare-fun m!151669 () Bool)

(assert (=> d!39195 m!151669))

(declare-fun m!151671 () Bool)

(assert (=> d!39195 m!151671))

(declare-fun m!151673 () Bool)

(assert (=> d!39195 m!151673))

(declare-fun m!151675 () Bool)

(assert (=> d!39195 m!151675))

(declare-fun m!151677 () Bool)

(assert (=> b!129109 m!151677))

(declare-fun m!151679 () Bool)

(assert (=> b!129110 m!151679))

(assert (=> b!128066 d!39195))

(declare-fun d!39197 () Bool)

(assert (=> d!39197 (= (apply!112 (+!171 lt!66245 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))) lt!66226) (apply!112 lt!66245 lt!66226))))

(declare-fun lt!66981 () Unit!3981)

(assert (=> d!39197 (= lt!66981 (choose!775 lt!66245 lt!66231 (minValue!2666 newMap!16) lt!66226))))

(declare-fun e!84259 () Bool)

(assert (=> d!39197 e!84259))

(declare-fun res!62325 () Bool)

(assert (=> d!39197 (=> (not res!62325) (not e!84259))))

(assert (=> d!39197 (= res!62325 (contains!884 lt!66245 lt!66226))))

(assert (=> d!39197 (= (addApplyDifferent!88 lt!66245 lt!66231 (minValue!2666 newMap!16) lt!66226) lt!66981)))

(declare-fun b!129111 () Bool)

(assert (=> b!129111 (= e!84259 (not (= lt!66226 lt!66231)))))

(assert (= (and d!39197 res!62325) b!129111))

(declare-fun m!151681 () Bool)

(assert (=> d!39197 m!151681))

(assert (=> d!39197 m!149675))

(assert (=> d!39197 m!149679))

(declare-fun m!151683 () Bool)

(assert (=> d!39197 m!151683))

(assert (=> d!39197 m!149679))

(assert (=> d!39197 m!149681))

(assert (=> b!128066 d!39197))

(declare-fun d!39199 () Bool)

(assert (=> d!39199 (= (apply!112 (+!171 lt!66245 (tuple2!2597 lt!66231 (minValue!2666 newMap!16))) lt!66226) (get!1459 (getValueByKey!168 (toList!861 (+!171 lt!66245 (tuple2!2597 lt!66231 (minValue!2666 newMap!16)))) lt!66226)))))

(declare-fun bs!5357 () Bool)

(assert (= bs!5357 d!39199))

(declare-fun m!151685 () Bool)

(assert (=> bs!5357 m!151685))

(assert (=> bs!5357 m!151685))

(declare-fun m!151687 () Bool)

(assert (=> bs!5357 m!151687))

(assert (=> b!128066 d!39199))

(declare-fun d!39201 () Bool)

(assert (=> d!39201 (= (apply!112 (+!171 lt!66240 (tuple2!2597 lt!66239 (minValue!2666 newMap!16))) lt!66234) (apply!112 lt!66240 lt!66234))))

(declare-fun lt!66982 () Unit!3981)

(assert (=> d!39201 (= lt!66982 (choose!775 lt!66240 lt!66239 (minValue!2666 newMap!16) lt!66234))))

(declare-fun e!84260 () Bool)

(assert (=> d!39201 e!84260))

(declare-fun res!62326 () Bool)

(assert (=> d!39201 (=> (not res!62326) (not e!84260))))

(assert (=> d!39201 (= res!62326 (contains!884 lt!66240 lt!66234))))

(assert (=> d!39201 (= (addApplyDifferent!88 lt!66240 lt!66239 (minValue!2666 newMap!16) lt!66234) lt!66982)))

(declare-fun b!129112 () Bool)

(assert (=> b!129112 (= e!84260 (not (= lt!66234 lt!66239)))))

(assert (= (and d!39201 res!62326) b!129112))

(declare-fun m!151689 () Bool)

(assert (=> d!39201 m!151689))

(assert (=> d!39201 m!149671))

(assert (=> d!39201 m!149677))

(declare-fun m!151691 () Bool)

(assert (=> d!39201 m!151691))

(assert (=> d!39201 m!149677))

(assert (=> d!39201 m!149695))

(assert (=> b!128066 d!39201))

(declare-fun d!39203 () Bool)

(assert (=> d!39203 (contains!884 (+!171 lt!66247 (tuple2!2597 lt!66241 (zeroValue!2666 newMap!16))) lt!66236)))

(declare-fun lt!66983 () Unit!3981)

(assert (=> d!39203 (= lt!66983 (choose!776 lt!66247 lt!66241 (zeroValue!2666 newMap!16) lt!66236))))

(assert (=> d!39203 (contains!884 lt!66247 lt!66236)))

(assert (=> d!39203 (= (addStillContains!88 lt!66247 lt!66241 (zeroValue!2666 newMap!16) lt!66236) lt!66983)))

(declare-fun bs!5358 () Bool)

(assert (= bs!5358 d!39203))

(assert (=> bs!5358 m!149689))

(assert (=> bs!5358 m!149689))

(assert (=> bs!5358 m!149691))

(declare-fun m!151693 () Bool)

(assert (=> bs!5358 m!151693))

(declare-fun m!151695 () Bool)

(assert (=> bs!5358 m!151695))

(assert (=> b!128066 d!39203))

(declare-fun d!39205 () Bool)

(declare-fun e!84261 () Bool)

(assert (=> d!39205 e!84261))

(declare-fun res!62328 () Bool)

(assert (=> d!39205 (=> (not res!62328) (not e!84261))))

(declare-fun lt!66984 () ListLongMap!1691)

(assert (=> d!39205 (= res!62328 (contains!884 lt!66984 (_1!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))))))

(declare-fun lt!66987 () List!1704)

(assert (=> d!39205 (= lt!66984 (ListLongMap!1692 lt!66987))))

(declare-fun lt!66986 () Unit!3981)

(declare-fun lt!66985 () Unit!3981)

(assert (=> d!39205 (= lt!66986 lt!66985)))

(assert (=> d!39205 (= (getValueByKey!168 lt!66987 (_1!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39205 (= lt!66985 (lemmaContainsTupThenGetReturnValue!83 lt!66987 (_1!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39205 (= lt!66987 (insertStrictlySorted!86 (toList!861 lt!66228) (_1!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))) (_2!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))))))

(assert (=> d!39205 (= (+!171 lt!66228 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))) lt!66984)))

(declare-fun b!129113 () Bool)

(declare-fun res!62327 () Bool)

(assert (=> b!129113 (=> (not res!62327) (not e!84261))))

(assert (=> b!129113 (= res!62327 (= (getValueByKey!168 (toList!861 lt!66984) (_1!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16)))) (Some!173 (_2!1309 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))))))))

(declare-fun b!129114 () Bool)

(assert (=> b!129114 (= e!84261 (contains!886 (toList!861 lt!66984) (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))))))

(assert (= (and d!39205 res!62328) b!129113))

(assert (= (and b!129113 res!62327) b!129114))

(declare-fun m!151697 () Bool)

(assert (=> d!39205 m!151697))

(declare-fun m!151699 () Bool)

(assert (=> d!39205 m!151699))

(declare-fun m!151701 () Bool)

(assert (=> d!39205 m!151701))

(declare-fun m!151703 () Bool)

(assert (=> d!39205 m!151703))

(declare-fun m!151705 () Bool)

(assert (=> b!129113 m!151705))

(declare-fun m!151707 () Bool)

(assert (=> b!129114 m!151707))

(assert (=> b!128066 d!39205))

(declare-fun d!39207 () Bool)

(assert (=> d!39207 (= (apply!112 lt!66240 lt!66234) (get!1459 (getValueByKey!168 (toList!861 lt!66240) lt!66234)))))

(declare-fun bs!5359 () Bool)

(assert (= bs!5359 d!39207))

(declare-fun m!151709 () Bool)

(assert (=> bs!5359 m!151709))

(assert (=> bs!5359 m!151709))

(declare-fun m!151711 () Bool)

(assert (=> bs!5359 m!151711))

(assert (=> b!128066 d!39207))

(declare-fun d!39209 () Bool)

(assert (=> d!39209 (= (apply!112 (+!171 lt!66228 (tuple2!2597 lt!66237 (zeroValue!2666 newMap!16))) lt!66243) (apply!112 lt!66228 lt!66243))))

(declare-fun lt!66988 () Unit!3981)

(assert (=> d!39209 (= lt!66988 (choose!775 lt!66228 lt!66237 (zeroValue!2666 newMap!16) lt!66243))))

(declare-fun e!84262 () Bool)

(assert (=> d!39209 e!84262))

(declare-fun res!62329 () Bool)

(assert (=> d!39209 (=> (not res!62329) (not e!84262))))

(assert (=> d!39209 (= res!62329 (contains!884 lt!66228 lt!66243))))

(assert (=> d!39209 (= (addApplyDifferent!88 lt!66228 lt!66237 (zeroValue!2666 newMap!16) lt!66243) lt!66988)))

(declare-fun b!129115 () Bool)

(assert (=> b!129115 (= e!84262 (not (= lt!66243 lt!66237)))))

(assert (= (and d!39209 res!62329) b!129115))

(declare-fun m!151713 () Bool)

(assert (=> d!39209 m!151713))

(assert (=> d!39209 m!149693))

(assert (=> d!39209 m!149683))

(declare-fun m!151715 () Bool)

(assert (=> d!39209 m!151715))

(assert (=> d!39209 m!149683))

(assert (=> d!39209 m!149685))

(assert (=> b!128066 d!39209))

(declare-fun lt!66989 () Bool)

(declare-fun d!39211 () Bool)

(assert (=> d!39211 (= lt!66989 (select (content!127 (toList!861 lt!66450)) (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84264 () Bool)

(assert (=> d!39211 (= lt!66989 e!84264)))

(declare-fun res!62331 () Bool)

(assert (=> d!39211 (=> (not res!62331) (not e!84264))))

(assert (=> d!39211 (= res!62331 ((_ is Cons!1700) (toList!861 lt!66450)))))

(assert (=> d!39211 (= (contains!886 (toList!861 lt!66450) (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66989)))

(declare-fun b!129116 () Bool)

(declare-fun e!84263 () Bool)

(assert (=> b!129116 (= e!84264 e!84263)))

(declare-fun res!62330 () Bool)

(assert (=> b!129116 (=> res!62330 e!84263)))

(assert (=> b!129116 (= res!62330 (= (h!2303 (toList!861 lt!66450)) (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129117 () Bool)

(assert (=> b!129117 (= e!84263 (contains!886 (t!6083 (toList!861 lt!66450)) (ite c!23392 (ite c!23390 (tuple2!2597 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2597 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2597 (select (arr!2237 (_keys!4542 (v!3146 (underlying!445 thiss!992)))) from!355) (get!1455 (select (arr!2238 (_values!2788 (v!3146 (underlying!445 thiss!992)))) from!355) (dynLambda!418 (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39211 res!62331) b!129116))

(assert (= (and b!129116 (not res!62330)) b!129117))

(declare-fun m!151717 () Bool)

(assert (=> d!39211 m!151717))

(declare-fun m!151719 () Bool)

(assert (=> d!39211 m!151719))

(declare-fun m!151721 () Bool)

(assert (=> b!129117 m!151721))

(assert (=> b!128248 d!39211))

(assert (=> bm!13879 d!38707))

(declare-fun b!129118 () Bool)

(declare-fun e!84266 () Bool)

(assert (=> b!129118 (= e!84266 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4557 () Bool)

(declare-fun mapRes!4557 () Bool)

(declare-fun tp!11055 () Bool)

(assert (=> mapNonEmpty!4557 (= mapRes!4557 (and tp!11055 e!84266))))

(declare-fun mapKey!4557 () (_ BitVec 32))

(declare-fun mapRest!4557 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapValue!4557 () ValueCell!1083)

(assert (=> mapNonEmpty!4557 (= mapRest!4555 (store mapRest!4557 mapKey!4557 mapValue!4557))))

(declare-fun mapIsEmpty!4557 () Bool)

(assert (=> mapIsEmpty!4557 mapRes!4557))

(declare-fun b!129119 () Bool)

(declare-fun e!84265 () Bool)

(assert (=> b!129119 (= e!84265 tp_is_empty!2853)))

(declare-fun condMapEmpty!4557 () Bool)

(declare-fun mapDefault!4557 () ValueCell!1083)

(assert (=> mapNonEmpty!4555 (= condMapEmpty!4557 (= mapRest!4555 ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4557)))))

(assert (=> mapNonEmpty!4555 (= tp!11053 (and e!84265 mapRes!4557))))

(assert (= (and mapNonEmpty!4555 condMapEmpty!4557) mapIsEmpty!4557))

(assert (= (and mapNonEmpty!4555 (not condMapEmpty!4557)) mapNonEmpty!4557))

(assert (= (and mapNonEmpty!4557 ((_ is ValueCellFull!1083) mapValue!4557)) b!129118))

(assert (= (and mapNonEmpty!4555 ((_ is ValueCellFull!1083) mapDefault!4557)) b!129119))

(declare-fun m!151723 () Bool)

(assert (=> mapNonEmpty!4557 m!151723))

(declare-fun b!129120 () Bool)

(declare-fun e!84268 () Bool)

(assert (=> b!129120 (= e!84268 tp_is_empty!2853)))

(declare-fun mapNonEmpty!4558 () Bool)

(declare-fun mapRes!4558 () Bool)

(declare-fun tp!11056 () Bool)

(assert (=> mapNonEmpty!4558 (= mapRes!4558 (and tp!11056 e!84268))))

(declare-fun mapRest!4558 () (Array (_ BitVec 32) ValueCell!1083))

(declare-fun mapKey!4558 () (_ BitVec 32))

(declare-fun mapValue!4558 () ValueCell!1083)

(assert (=> mapNonEmpty!4558 (= mapRest!4556 (store mapRest!4558 mapKey!4558 mapValue!4558))))

(declare-fun mapIsEmpty!4558 () Bool)

(assert (=> mapIsEmpty!4558 mapRes!4558))

(declare-fun b!129121 () Bool)

(declare-fun e!84267 () Bool)

(assert (=> b!129121 (= e!84267 tp_is_empty!2853)))

(declare-fun condMapEmpty!4558 () Bool)

(declare-fun mapDefault!4558 () ValueCell!1083)

(assert (=> mapNonEmpty!4556 (= condMapEmpty!4558 (= mapRest!4556 ((as const (Array (_ BitVec 32) ValueCell!1083)) mapDefault!4558)))))

(assert (=> mapNonEmpty!4556 (= tp!11054 (and e!84267 mapRes!4558))))

(assert (= (and mapNonEmpty!4556 condMapEmpty!4558) mapIsEmpty!4558))

(assert (= (and mapNonEmpty!4556 (not condMapEmpty!4558)) mapNonEmpty!4558))

(assert (= (and mapNonEmpty!4558 ((_ is ValueCellFull!1083) mapValue!4558)) b!129120))

(assert (= (and mapNonEmpty!4556 ((_ is ValueCellFull!1083) mapDefault!4558)) b!129121))

(declare-fun m!151725 () Bool)

(assert (=> mapNonEmpty!4558 m!151725))

(declare-fun b_lambda!5705 () Bool)

(assert (= b_lambda!5689 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5705)))

(declare-fun b_lambda!5707 () Bool)

(assert (= b_lambda!5677 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5707)))

(declare-fun b_lambda!5709 () Bool)

(assert (= b_lambda!5691 (or (and b!127647 b_free!2873) (and b!127644 b_free!2875 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))) b_lambda!5709)))

(declare-fun b_lambda!5711 () Bool)

(assert (= b_lambda!5683 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5711)))

(declare-fun b_lambda!5713 () Bool)

(assert (= b_lambda!5675 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5713)))

(declare-fun b_lambda!5715 () Bool)

(assert (= b_lambda!5685 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5715)))

(declare-fun b_lambda!5717 () Bool)

(assert (= b_lambda!5687 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5717)))

(declare-fun b_lambda!5719 () Bool)

(assert (= b_lambda!5703 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5719)))

(declare-fun b_lambda!5721 () Bool)

(assert (= b_lambda!5681 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5721)))

(declare-fun b_lambda!5723 () Bool)

(assert (= b_lambda!5679 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5723)))

(declare-fun b_lambda!5725 () Bool)

(assert (= b_lambda!5701 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5725)))

(declare-fun b_lambda!5727 () Bool)

(assert (= b_lambda!5697 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5727)))

(declare-fun b_lambda!5729 () Bool)

(assert (= b_lambda!5699 (or (and b!127647 b_free!2873 (= (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))) (defaultEntry!2805 newMap!16))) (and b!127644 b_free!2875) b_lambda!5729)))

(declare-fun b_lambda!5731 () Bool)

(assert (= b_lambda!5693 (or (and b!127647 b_free!2873) (and b!127644 b_free!2875 (= (defaultEntry!2805 newMap!16) (defaultEntry!2805 (v!3146 (underlying!445 thiss!992))))) b_lambda!5731)))

(check-sat (not d!38977) (not d!39059) (not b!128573) (not d!38909) (not b!128886) (not b!128884) (not b!128589) (not b!128868) (not bm!13958) (not d!39021) (not b!129100) (not b!128588) (not d!38825) (not b!128842) (not b!128933) (not d!39045) (not b!128688) (not b!128465) (not b!128892) (not d!39085) (not b!128947) (not b!128769) (not d!39191) (not b!129077) (not b!128844) (not bm!13893) (not b!129021) (not d!38965) (not bm!13909) (not b!128861) (not d!39023) (not b!128875) (not b!129033) (not d!39121) (not d!38975) (not d!38877) (not d!39077) (not b!128978) (not b!128810) (not b!128759) (not b!128991) (not d!38885) (not b!128601) (not b!129083) (not d!38853) (not d!38991) (not d!38857) (not d!38921) (not b!128639) (not b!128524) (not b!128726) (not b!128720) (not d!39099) (not b!128848) (not d!39129) (not bm!13884) (not b!128350) (not b!128580) (not d!39157) (not d!39105) (not d!38773) (not bm!13965) (not d!39097) (not b!128959) (not d!38889) (not b!128643) (not d!39009) (not b!128525) (not d!38731) (not d!38981) (not d!38709) (not b!128761) (not b!128994) (not b!128324) (not b!129005) (not d!39033) (not d!39041) (not b!129028) (not b!129032) (not b!128313) (not b!128627) (not b!128694) (not d!38983) (not d!38837) (not bm!13971) (not b!128577) (not b!128909) (not b!128932) (not b!128808) b_and!7981 (not b!128972) (not d!38893) (not b!128956) (not b!128937) (not b!128355) (not b!128905) (not b!129010) (not bm!13938) (not mapNonEmpty!4558) (not d!38911) (not d!38917) (not b!128997) (not bm!13959) (not b!128756) (not b!129082) (not d!39015) (not b!129065) (not d!38829) (not b!128544) (not d!39207) (not b!128567) (not b!129017) (not b!128840) (not b!128809) (not b!128374) (not d!38805) (not b!128326) (not d!38797) (not b!128640) (not d!38715) (not b!128452) (not b!128633) (not d!38915) (not b!128635) (not b_lambda!5665) (not b!128965) (not d!39211) (not bm!13981) (not b!128464) (not b!128975) (not bm!13922) (not bm!13951) (not b!128952) (not b!128747) (not b!129035) (not b!128979) (not b!128488) (not bm!13931) (not d!39071) tp_is_empty!2853 (not b_lambda!5705) (not b!128776) (not b!128530) (not b!128585) (not b!128738) (not b!128874) (not b!128945) (not d!39171) (not b!128652) (not d!39047) (not b!128532) (not b!128331) (not d!38741) (not d!38819) (not b!128527) (not bm!13943) (not d!39081) (not b!128334) (not b!128386) (not d!38769) (not b!128317) (not b!128503) (not b!128501) (not b!128504) (not bm!13963) (not b!128295) (not b!128634) (not bm!13957) (not b!128446) (not b!128565) (not b!128322) (not d!38713) (not d!38763) (not d!38759) (not b!128423) (not bm!13976) (not d!39055) (not b!128865) (not b!128575) (not bm!13886) (not d!38835) (not d!38775) (not d!38995) (not b!128394) (not b!128690) (not b!128597) (not bm!13898) (not b!128645) (not b!128285) (not d!38937) (not bm!13900) (not bm!13935) (not b!128914) (not b!128514) (not b!129069) (not b!129029) (not b!128335) (not b!128495) (not b!128941) (not b!128304) (not b_lambda!5719) (not bm!13881) (not d!38949) (not b!128870) (not b!128998) (not b!129089) (not d!38941) (not b!128363) (not b!128538) (not b!128657) (not d!39193) (not bm!13926) (not b!128414) (not b!128923) (not b!128849) (not b!128881) (not b!128392) (not d!39065) (not d!38863) (not b_lambda!5723) (not d!39095) (not d!38793) (not b!128337) (not b!128354) (not b!128939) (not b_lambda!5715) (not b!128921) (not b!128658) (not d!39203) b_and!7979 (not b!128309) (not b!129059) (not d!38919) (not b!128451) (not b!128319) (not b!128741) (not b!128728) (not d!38939) (not bm!13890) (not bm!13932) (not mapNonEmpty!4557) (not d!39123) (not b!128854) (not b!128450) (not d!39141) (not b!128705) (not b!129022) (not bm!13964) (not b!128289) (not b!128863) (not b!128718) (not bm!13895) (not d!38883) (not b_lambda!5721) (not b!128522) (not b_lambda!5695) (not d!39051) (not b!128610) (not b!128612) (not b!128831) (not d!39083) (not bm!13892) (not d!38813) (not b!128507) (not b!129007) (not b!128377) (not d!38859) (not b!129018) (not b!129109) (not b!129015) (not b!128832) (not b!128662) (not b!129091) (not d!39149) (not d!38933) (not b!129108) (not d!38717) (not b!128302) (not d!39115) (not b!128395) (not b_lambda!5671) (not b!128827) (not b!129009) (not d!38953) (not b!128871) (not b!128850) (not d!39189) (not bm!13956) (not b!128930) (not bm!13940) (not b!128541) (not bm!13942) (not b!128760) (not bm!13919) (not b!128714) (not b!128397) (not bm!13883) (not d!39073) (not b!128928) (not d!39199) (not b!128637) (not b!128943) (not bm!13937) (not bm!13949) (not b!128988) (not d!39005) (not bm!13916) (not b!128449) (not b!128368) (not b!128732) (not b!128745) (not b!128697) (not b!128396) (not b!128819) (not bm!13962) (not b!128706) (not d!38801) (not b_lambda!5649) (not b!128829) (not b_lambda!5707) (not d!39187) (not d!39161) (not b!128591) (not d!39131) (not b!129066) (not d!39069) (not b!128489) (not bm!13927) (not b!128303) (not d!39075) (not b!128912) (not b!128366) (not b!128668) (not d!39063) (not d!38799) (not bm!13888) (not b!128847) (not d!38755) (not d!38729) (not b!128707) (not d!38963) (not b!128917) (not b!128428) (not d!38807) (not b!128379) (not d!38935) (not b!128458) (not d!38879) (not b!128737) (not d!39163) (not d!38845) (not b!129106) (not b!128851) (not b!128936) (not b!128964) (not b!128340) (not b!128447) (not d!39079) (not bm!13977) (not b!129004) (not b!128604) (not b!128767) (not b!128770) (not b!128771) (not d!39119) (not b!128569) (not b!129078) (not b!128742) (not b!128650) (not d!38751) (not d!39003) (not b!128291) (not bm!13920) (not b!128615) (not b!128758) (not d!38745) (not d!38993) (not b_lambda!5653) (not d!39137) (not b!129063) (not b!128551) (not b!128373) (not b!128609) (not b!128590) (not b!128429) (not b_lambda!5673) (not b!128773) (not b!128967) (not b!129081) (not b!128852) (not d!39165) (not d!39183) (not b_lambda!5729) (not bm!13979) (not d!39145) (not bm!13944) (not d!38927) (not d!38989) (not bm!13913) (not b!128966) (not d!38945) (not d!39089) (not d!39185) (not b!128521) (not d!38753) (not b!128498) (not b!128614) (not d!38839) (not b!128336) (not b!129080) (not b!128570) (not b!128338) (not b!128453) (not b!128960) (not b!128375) (not b!128821) (not b!128552) (not d!39039) (not d!38783) (not b!129117) (not b!129110) (not b_next!2873) (not b!128286) (not b!129093) (not b!129103) (not bm!13946) (not b!128993) (not b!128986) (not b!129067) (not b!128833) (not b!128838) (not d!39001) (not b!128860) (not d!38901) (not d!38833) (not b!128841) (not b_lambda!5731) (not d!39017) (not b!128292) (not d!38943) (not d!38931) (not d!38985) (not b!128906) (not d!39175) (not b!128969) (not d!39067) (not b!128828) (not bm!13947) (not b!128508) (not d!39027) (not d!38767) (not b_lambda!5713) (not b!129012) (not b!128411) (not b!128846) (not b!128563) (not d!38903) (not d!39167) (not b!128342) (not b!128559) (not b!128845) (not d!39201) (not b!128345) (not b!128535) (not b!128391) (not b!128908) (not b!128415) (not d!38967) (not b!128902) (not b_lambda!5727) (not d!39209) (not b!128689) (not b!128333) (not b!128684) (not d!38913) (not b!128918) (not bm!13929) (not d!38749) (not d!38817) (not b!129072) (not b!128816) (not b!128351) (not bm!13917) (not b!129104) (not d!38979) (not bm!13889) (not b!128963) (not b!128432) (not d!39035) (not b!128496) (not b_lambda!5667) (not d!38897) (not b_lambda!5669) (not b!128934) (not d!39091) (not b_lambda!5717) (not b!128750) (not b!128439) (not b!129102) (not b!128889) (not b!128555) (not b!128858) (not d!38865) (not b!128655) (not b!128735) (not d!39143) (not b!128613) (not bm!13897) (not b!128638) (not d!39031) (not b!128283) (not b!128708) (not b!128888) (not b!128566) (not b!128353) (not d!38779) (not bm!13982) (not b!128445) (not d!38997) (not d!38765) (not b!128533) (not b!128425) (not b!128985) (not d!39093) (not b!128520) (not d!39153) (not b!129114) (not b_lambda!5725) (not d!38895) (not d!38987) (not b!128435) (not d!39197) (not b!128938) (not b!128730) (not b!128545) (not d!39029) (not b!128599) (not d!38905) (not b!128919) (not b!128974) (not b!128716) (not b!128743) (not b!128305) (not b!128325) (not b!128623) (not b!128814) (not b!128287) (not b!128768) (not bm!13924) (not b!128443) (not b!128783) (not b!128356) (not b!128418) (not d!39111) (not bm!13974) (not b_lambda!5709) (not b!128692) (not b!128703) (not b!128383) (not b!128329) (not b!128813) (not d!38861) (not b!128517) (not bm!13968) (not d!38955) (not b!129031) (not d!39169) (not b!128586) (not b_lambda!5711) (not d!39061) (not d!39057) (not b_next!2875) (not d!38999) (not b!128755) (not d!39195) (not b!129097) (not b!129113) (not b!128922) (not b!128306) (not d!39205) (not b!128631) (not b!128856) (not b!128817) (not b!128412) (not b!128824) (not b!128944) (not d!39087) (not d!39127) (not d!38737) (not d!38847) (not b!128891) (not b!128648) (not d!39147) (not b!128290) (not d!39007) (not b!128540) (not d!38789) (not d!39181) (not b!128661) (not d!38851) (not b!128702) (not b!128574) (not b!128949) (not bm!13899) (not b!128455) (not b!129107) (not bm!13912))
(check-sat b_and!7979 b_and!7981 (not b_next!2873) (not b_next!2875))
