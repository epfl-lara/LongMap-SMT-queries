; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81278 () Bool)

(assert start!81278)

(declare-fun b!950664 () Bool)

(declare-fun b_free!18253 () Bool)

(declare-fun b_next!18253 () Bool)

(assert (=> b!950664 (= b_free!18253 (not b_next!18253))))

(declare-fun tp!63362 () Bool)

(declare-fun b_and!29691 () Bool)

(assert (=> b!950664 (= tp!63362 b_and!29691)))

(declare-fun b!950663 () Bool)

(declare-fun e!535255 () Bool)

(declare-datatypes ((V!32647 0))(
  ( (V!32648 (val!10431 Int)) )
))
(declare-datatypes ((ValueCell!9899 0))(
  ( (ValueCellFull!9899 (v!12975 V!32647)) (EmptyCell!9899) )
))
(declare-datatypes ((array!57509 0))(
  ( (array!57510 (arr!27653 (Array (_ BitVec 32) ValueCell!9899)) (size!28133 (_ BitVec 32))) )
))
(declare-datatypes ((array!57511 0))(
  ( (array!57512 (arr!27654 (Array (_ BitVec 32) (_ BitVec 64))) (size!28134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4948 0))(
  ( (LongMapFixedSize!4949 (defaultEntry!5791 Int) (mask!27596 (_ BitVec 32)) (extraKeys!5523 (_ BitVec 32)) (zeroValue!5627 V!32647) (minValue!5627 V!32647) (_size!2529 (_ BitVec 32)) (_keys!10727 array!57511) (_values!5814 array!57509) (_vacant!2529 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4948)

(assert (=> b!950663 (= e!535255 (or (not (= (size!28134 (_keys!10727 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27596 thiss!1141)))) (bvsle #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141)))))))

(declare-fun tp_is_empty!20761 () Bool)

(declare-fun e!535260 () Bool)

(declare-fun e!535258 () Bool)

(declare-fun array_inv!21520 (array!57511) Bool)

(declare-fun array_inv!21521 (array!57509) Bool)

(assert (=> b!950664 (= e!535258 (and tp!63362 tp_is_empty!20761 (array_inv!21520 (_keys!10727 thiss!1141)) (array_inv!21521 (_values!5814 thiss!1141)) e!535260))))

(declare-fun b!950665 () Bool)

(declare-fun res!637293 () Bool)

(declare-fun e!535259 () Bool)

(assert (=> b!950665 (=> (not res!637293) (not e!535259))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13602 0))(
  ( (tuple2!13603 (_1!6812 (_ BitVec 64)) (_2!6812 V!32647)) )
))
(declare-datatypes ((List!19348 0))(
  ( (Nil!19345) (Cons!19344 (h!20505 tuple2!13602) (t!27682 List!19348)) )
))
(declare-datatypes ((ListLongMap!12289 0))(
  ( (ListLongMap!12290 (toList!6160 List!19348)) )
))
(declare-fun contains!5196 (ListLongMap!12289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3322 (array!57511 array!57509 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 32) Int) ListLongMap!12289)

(assert (=> b!950665 (= res!637293 (contains!5196 (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) key!756))))

(declare-fun b!950666 () Bool)

(assert (=> b!950666 (= e!535259 (not e!535255))))

(declare-fun res!637291 () Bool)

(assert (=> b!950666 (=> res!637291 e!535255)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950666 (= res!637291 (not (validMask!0 (mask!27596 thiss!1141))))))

(declare-fun lt!428047 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57511 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950666 (= lt!428047 (arrayScanForKey!0 (_keys!10727 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950666 (arrayContainsKey!0 (_keys!10727 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31879 0))(
  ( (Unit!31880) )
))
(declare-fun lt!428046 () Unit!31879)

(declare-fun lemmaKeyInListMapIsInArray!306 (array!57511 array!57509 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 64) Int) Unit!31879)

(assert (=> b!950666 (= lt!428046 (lemmaKeyInListMapIsInArray!306 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) key!756 (defaultEntry!5791 thiss!1141)))))

(declare-fun b!950667 () Bool)

(declare-fun res!637290 () Bool)

(assert (=> b!950667 (=> (not res!637290) (not e!535259))))

(assert (=> b!950667 (= res!637290 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!637292 () Bool)

(assert (=> start!81278 (=> (not res!637292) (not e!535259))))

(declare-fun valid!1888 (LongMapFixedSize!4948) Bool)

(assert (=> start!81278 (= res!637292 (valid!1888 thiss!1141))))

(assert (=> start!81278 e!535259))

(assert (=> start!81278 e!535258))

(assert (=> start!81278 true))

(declare-fun b!950668 () Bool)

(declare-fun e!535256 () Bool)

(declare-fun mapRes!33060 () Bool)

(assert (=> b!950668 (= e!535260 (and e!535256 mapRes!33060))))

(declare-fun condMapEmpty!33060 () Bool)

(declare-fun mapDefault!33060 () ValueCell!9899)

(assert (=> b!950668 (= condMapEmpty!33060 (= (arr!27653 (_values!5814 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9899)) mapDefault!33060)))))

(declare-fun mapNonEmpty!33060 () Bool)

(declare-fun tp!63363 () Bool)

(declare-fun e!535257 () Bool)

(assert (=> mapNonEmpty!33060 (= mapRes!33060 (and tp!63363 e!535257))))

(declare-fun mapRest!33060 () (Array (_ BitVec 32) ValueCell!9899))

(declare-fun mapKey!33060 () (_ BitVec 32))

(declare-fun mapValue!33060 () ValueCell!9899)

(assert (=> mapNonEmpty!33060 (= (arr!27653 (_values!5814 thiss!1141)) (store mapRest!33060 mapKey!33060 mapValue!33060))))

(declare-fun b!950669 () Bool)

(assert (=> b!950669 (= e!535257 tp_is_empty!20761)))

(declare-fun mapIsEmpty!33060 () Bool)

(assert (=> mapIsEmpty!33060 mapRes!33060))

(declare-fun b!950670 () Bool)

(assert (=> b!950670 (= e!535256 tp_is_empty!20761)))

(declare-fun b!950671 () Bool)

(declare-fun res!637289 () Bool)

(assert (=> b!950671 (=> (not res!637289) (not e!535259))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9145 0))(
  ( (MissingZero!9145 (index!38951 (_ BitVec 32))) (Found!9145 (index!38952 (_ BitVec 32))) (Intermediate!9145 (undefined!9957 Bool) (index!38953 (_ BitVec 32)) (x!81802 (_ BitVec 32))) (Undefined!9145) (MissingVacant!9145 (index!38954 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57511 (_ BitVec 32)) SeekEntryResult!9145)

(assert (=> b!950671 (= res!637289 (not ((_ is Found!9145) (seekEntry!0 key!756 (_keys!10727 thiss!1141) (mask!27596 thiss!1141)))))))

(assert (= (and start!81278 res!637292) b!950667))

(assert (= (and b!950667 res!637290) b!950671))

(assert (= (and b!950671 res!637289) b!950665))

(assert (= (and b!950665 res!637293) b!950666))

(assert (= (and b!950666 (not res!637291)) b!950663))

(assert (= (and b!950668 condMapEmpty!33060) mapIsEmpty!33060))

(assert (= (and b!950668 (not condMapEmpty!33060)) mapNonEmpty!33060))

(assert (= (and mapNonEmpty!33060 ((_ is ValueCellFull!9899) mapValue!33060)) b!950669))

(assert (= (and b!950668 ((_ is ValueCellFull!9899) mapDefault!33060)) b!950670))

(assert (= b!950664 b!950668))

(assert (= start!81278 b!950664))

(declare-fun m!882519 () Bool)

(assert (=> start!81278 m!882519))

(declare-fun m!882521 () Bool)

(assert (=> b!950666 m!882521))

(declare-fun m!882523 () Bool)

(assert (=> b!950666 m!882523))

(declare-fun m!882525 () Bool)

(assert (=> b!950666 m!882525))

(declare-fun m!882527 () Bool)

(assert (=> b!950666 m!882527))

(declare-fun m!882529 () Bool)

(assert (=> b!950664 m!882529))

(declare-fun m!882531 () Bool)

(assert (=> b!950664 m!882531))

(declare-fun m!882533 () Bool)

(assert (=> b!950665 m!882533))

(assert (=> b!950665 m!882533))

(declare-fun m!882535 () Bool)

(assert (=> b!950665 m!882535))

(declare-fun m!882537 () Bool)

(assert (=> mapNonEmpty!33060 m!882537))

(declare-fun m!882539 () Bool)

(assert (=> b!950671 m!882539))

(check-sat tp_is_empty!20761 (not b!950666) (not b_next!18253) (not b!950664) (not b!950665) (not b!950671) (not mapNonEmpty!33060) b_and!29691 (not start!81278))
(check-sat b_and!29691 (not b_next!18253))
(get-model)

(declare-fun d!115093 () Bool)

(declare-fun e!535308 () Bool)

(assert (=> d!115093 e!535308))

(declare-fun res!637326 () Bool)

(assert (=> d!115093 (=> res!637326 e!535308)))

(declare-fun lt!428069 () Bool)

(assert (=> d!115093 (= res!637326 (not lt!428069))))

(declare-fun lt!428070 () Bool)

(assert (=> d!115093 (= lt!428069 lt!428070)))

(declare-fun lt!428071 () Unit!31879)

(declare-fun e!535309 () Unit!31879)

(assert (=> d!115093 (= lt!428071 e!535309)))

(declare-fun c!99286 () Bool)

(assert (=> d!115093 (= c!99286 lt!428070)))

(declare-fun containsKey!466 (List!19348 (_ BitVec 64)) Bool)

(assert (=> d!115093 (= lt!428070 (containsKey!466 (toList!6160 (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756))))

(assert (=> d!115093 (= (contains!5196 (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) key!756) lt!428069)))

(declare-fun b!950732 () Bool)

(declare-fun lt!428068 () Unit!31879)

(assert (=> b!950732 (= e!535309 lt!428068)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!361 (List!19348 (_ BitVec 64)) Unit!31879)

(assert (=> b!950732 (= lt!428068 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6160 (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756))))

(declare-datatypes ((Option!508 0))(
  ( (Some!507 (v!12978 V!32647)) (None!506) )
))
(declare-fun isDefined!374 (Option!508) Bool)

(declare-fun getValueByKey!502 (List!19348 (_ BitVec 64)) Option!508)

(assert (=> b!950732 (isDefined!374 (getValueByKey!502 (toList!6160 (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756))))

(declare-fun b!950733 () Bool)

(declare-fun Unit!31883 () Unit!31879)

(assert (=> b!950733 (= e!535309 Unit!31883)))

(declare-fun b!950734 () Bool)

(assert (=> b!950734 (= e!535308 (isDefined!374 (getValueByKey!502 (toList!6160 (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756)))))

(assert (= (and d!115093 c!99286) b!950732))

(assert (= (and d!115093 (not c!99286)) b!950733))

(assert (= (and d!115093 (not res!637326)) b!950734))

(declare-fun m!882585 () Bool)

(assert (=> d!115093 m!882585))

(declare-fun m!882587 () Bool)

(assert (=> b!950732 m!882587))

(declare-fun m!882589 () Bool)

(assert (=> b!950732 m!882589))

(assert (=> b!950732 m!882589))

(declare-fun m!882591 () Bool)

(assert (=> b!950732 m!882591))

(assert (=> b!950734 m!882589))

(assert (=> b!950734 m!882589))

(assert (=> b!950734 m!882591))

(assert (=> b!950665 d!115093))

(declare-fun b!950777 () Bool)

(declare-fun e!535344 () ListLongMap!12289)

(declare-fun call!41415 () ListLongMap!12289)

(assert (=> b!950777 (= e!535344 call!41415)))

(declare-fun bm!41410 () Bool)

(declare-fun call!41419 () ListLongMap!12289)

(declare-fun call!41417 () ListLongMap!12289)

(assert (=> bm!41410 (= call!41419 call!41417)))

(declare-fun b!950778 () Bool)

(declare-fun e!535337 () Bool)

(declare-fun e!535342 () Bool)

(assert (=> b!950778 (= e!535337 e!535342)))

(declare-fun c!99300 () Bool)

(assert (=> b!950778 (= c!99300 (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950779 () Bool)

(declare-fun e!535347 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950779 (= e!535347 (validKeyInArray!0 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41411 () Bool)

(declare-fun call!41413 () Bool)

(declare-fun lt!428116 () ListLongMap!12289)

(assert (=> bm!41411 (= call!41413 (contains!5196 lt!428116 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950780 () Bool)

(declare-fun e!535340 () Bool)

(declare-fun call!41416 () Bool)

(assert (=> b!950780 (= e!535340 (not call!41416))))

(declare-fun b!950781 () Bool)

(declare-fun res!637348 () Bool)

(assert (=> b!950781 (=> (not res!637348) (not e!535337))))

(declare-fun e!535338 () Bool)

(assert (=> b!950781 (= res!637348 e!535338)))

(declare-fun res!637345 () Bool)

(assert (=> b!950781 (=> res!637345 e!535338)))

(assert (=> b!950781 (= res!637345 (not e!535347))))

(declare-fun res!637353 () Bool)

(assert (=> b!950781 (=> (not res!637353) (not e!535347))))

(assert (=> b!950781 (= res!637353 (bvslt #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))))))

(declare-fun b!950782 () Bool)

(declare-fun e!535339 () Bool)

(assert (=> b!950782 (= e!535342 e!535339)))

(declare-fun res!637349 () Bool)

(assert (=> b!950782 (= res!637349 call!41413)))

(assert (=> b!950782 (=> (not res!637349) (not e!535339))))

(declare-fun b!950783 () Bool)

(declare-fun e!535346 () ListLongMap!12289)

(declare-fun call!41414 () ListLongMap!12289)

(declare-fun +!2883 (ListLongMap!12289 tuple2!13602) ListLongMap!12289)

(assert (=> b!950783 (= e!535346 (+!2883 call!41414 (tuple2!13603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5627 thiss!1141))))))

(declare-fun bm!41413 () Bool)

(assert (=> bm!41413 (= call!41415 call!41414)))

(declare-fun b!950784 () Bool)

(declare-fun res!637350 () Bool)

(assert (=> b!950784 (=> (not res!637350) (not e!535337))))

(assert (=> b!950784 (= res!637350 e!535340)))

(declare-fun c!99303 () Bool)

(assert (=> b!950784 (= c!99303 (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950785 () Bool)

(declare-fun c!99302 () Bool)

(assert (=> b!950785 (= c!99302 (and (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535341 () ListLongMap!12289)

(assert (=> b!950785 (= e!535344 e!535341)))

(declare-fun b!950786 () Bool)

(assert (=> b!950786 (= e!535346 e!535344)))

(declare-fun c!99299 () Bool)

(assert (=> b!950786 (= c!99299 (and (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950787 () Bool)

(declare-fun e!535343 () Bool)

(declare-fun apply!873 (ListLongMap!12289 (_ BitVec 64)) V!32647)

(declare-fun get!14535 (ValueCell!9899 V!32647) V!32647)

(declare-fun dynLambda!1639 (Int (_ BitVec 64)) V!32647)

(assert (=> b!950787 (= e!535343 (= (apply!873 lt!428116 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000)) (get!14535 (select (arr!27653 (_values!5814 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1639 (defaultEntry!5791 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28133 (_values!5814 thiss!1141))))))

(assert (=> b!950787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))))))

(declare-fun b!950788 () Bool)

(declare-fun e!535345 () Unit!31879)

(declare-fun lt!428126 () Unit!31879)

(assert (=> b!950788 (= e!535345 lt!428126)))

(declare-fun lt!428136 () ListLongMap!12289)

(declare-fun getCurrentListMapNoExtraKeys!3355 (array!57511 array!57509 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 32) Int) ListLongMap!12289)

(assert (=> b!950788 (= lt!428136 (getCurrentListMapNoExtraKeys!3355 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428137 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428122 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428122 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428134 () Unit!31879)

(declare-fun addStillContains!572 (ListLongMap!12289 (_ BitVec 64) V!32647 (_ BitVec 64)) Unit!31879)

(assert (=> b!950788 (= lt!428134 (addStillContains!572 lt!428136 lt!428137 (zeroValue!5627 thiss!1141) lt!428122))))

(assert (=> b!950788 (contains!5196 (+!2883 lt!428136 (tuple2!13603 lt!428137 (zeroValue!5627 thiss!1141))) lt!428122)))

(declare-fun lt!428121 () Unit!31879)

(assert (=> b!950788 (= lt!428121 lt!428134)))

(declare-fun lt!428125 () ListLongMap!12289)

(assert (=> b!950788 (= lt!428125 (getCurrentListMapNoExtraKeys!3355 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428133 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428133 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428127 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428127 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428128 () Unit!31879)

(declare-fun addApplyDifferent!452 (ListLongMap!12289 (_ BitVec 64) V!32647 (_ BitVec 64)) Unit!31879)

(assert (=> b!950788 (= lt!428128 (addApplyDifferent!452 lt!428125 lt!428133 (minValue!5627 thiss!1141) lt!428127))))

(assert (=> b!950788 (= (apply!873 (+!2883 lt!428125 (tuple2!13603 lt!428133 (minValue!5627 thiss!1141))) lt!428127) (apply!873 lt!428125 lt!428127))))

(declare-fun lt!428120 () Unit!31879)

(assert (=> b!950788 (= lt!428120 lt!428128)))

(declare-fun lt!428124 () ListLongMap!12289)

(assert (=> b!950788 (= lt!428124 (getCurrentListMapNoExtraKeys!3355 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428118 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428130 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428130 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428135 () Unit!31879)

(assert (=> b!950788 (= lt!428135 (addApplyDifferent!452 lt!428124 lt!428118 (zeroValue!5627 thiss!1141) lt!428130))))

(assert (=> b!950788 (= (apply!873 (+!2883 lt!428124 (tuple2!13603 lt!428118 (zeroValue!5627 thiss!1141))) lt!428130) (apply!873 lt!428124 lt!428130))))

(declare-fun lt!428119 () Unit!31879)

(assert (=> b!950788 (= lt!428119 lt!428135)))

(declare-fun lt!428131 () ListLongMap!12289)

(assert (=> b!950788 (= lt!428131 (getCurrentListMapNoExtraKeys!3355 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428123 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428123 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428117 () (_ BitVec 64))

(assert (=> b!950788 (= lt!428117 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950788 (= lt!428126 (addApplyDifferent!452 lt!428131 lt!428123 (minValue!5627 thiss!1141) lt!428117))))

(assert (=> b!950788 (= (apply!873 (+!2883 lt!428131 (tuple2!13603 lt!428123 (minValue!5627 thiss!1141))) lt!428117) (apply!873 lt!428131 lt!428117))))

(declare-fun b!950789 () Bool)

(declare-fun e!535348 () Bool)

(assert (=> b!950789 (= e!535348 (validKeyInArray!0 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950790 () Bool)

(declare-fun Unit!31884 () Unit!31879)

(assert (=> b!950790 (= e!535345 Unit!31884)))

(declare-fun bm!41412 () Bool)

(assert (=> bm!41412 (= call!41417 (getCurrentListMapNoExtraKeys!3355 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun d!115095 () Bool)

(assert (=> d!115095 e!535337))

(declare-fun res!637347 () Bool)

(assert (=> d!115095 (=> (not res!637347) (not e!535337))))

(assert (=> d!115095 (= res!637347 (or (bvsge #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))))))))

(declare-fun lt!428132 () ListLongMap!12289)

(assert (=> d!115095 (= lt!428116 lt!428132)))

(declare-fun lt!428129 () Unit!31879)

(assert (=> d!115095 (= lt!428129 e!535345)))

(declare-fun c!99304 () Bool)

(assert (=> d!115095 (= c!99304 e!535348)))

(declare-fun res!637352 () Bool)

(assert (=> d!115095 (=> (not res!637352) (not e!535348))))

(assert (=> d!115095 (= res!637352 (bvslt #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))))))

(assert (=> d!115095 (= lt!428132 e!535346)))

(declare-fun c!99301 () Bool)

(assert (=> d!115095 (= c!99301 (and (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115095 (validMask!0 (mask!27596 thiss!1141))))

(assert (=> d!115095 (= (getCurrentListMap!3322 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) lt!428116)))

(declare-fun b!950791 () Bool)

(assert (=> b!950791 (= e!535341 call!41415)))

(declare-fun bm!41414 () Bool)

(assert (=> bm!41414 (= call!41416 (contains!5196 lt!428116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950792 () Bool)

(assert (=> b!950792 (= e!535339 (= (apply!873 lt!428116 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5627 thiss!1141)))))

(declare-fun b!950793 () Bool)

(assert (=> b!950793 (= e!535342 (not call!41413))))

(declare-fun bm!41415 () Bool)

(declare-fun call!41418 () ListLongMap!12289)

(assert (=> bm!41415 (= call!41418 call!41419)))

(declare-fun b!950794 () Bool)

(assert (=> b!950794 (= e!535338 e!535343)))

(declare-fun res!637351 () Bool)

(assert (=> b!950794 (=> (not res!637351) (not e!535343))))

(assert (=> b!950794 (= res!637351 (contains!5196 lt!428116 (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))))))

(declare-fun b!950795 () Bool)

(declare-fun e!535336 () Bool)

(assert (=> b!950795 (= e!535336 (= (apply!873 lt!428116 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5627 thiss!1141)))))

(declare-fun b!950796 () Bool)

(assert (=> b!950796 (= e!535341 call!41418)))

(declare-fun bm!41416 () Bool)

(assert (=> bm!41416 (= call!41414 (+!2883 (ite c!99301 call!41417 (ite c!99299 call!41419 call!41418)) (ite (or c!99301 c!99299) (tuple2!13603 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5627 thiss!1141)) (tuple2!13603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5627 thiss!1141)))))))

(declare-fun b!950797 () Bool)

(assert (=> b!950797 (= e!535340 e!535336)))

(declare-fun res!637346 () Bool)

(assert (=> b!950797 (= res!637346 call!41416)))

(assert (=> b!950797 (=> (not res!637346) (not e!535336))))

(assert (= (and d!115095 c!99301) b!950783))

(assert (= (and d!115095 (not c!99301)) b!950786))

(assert (= (and b!950786 c!99299) b!950777))

(assert (= (and b!950786 (not c!99299)) b!950785))

(assert (= (and b!950785 c!99302) b!950791))

(assert (= (and b!950785 (not c!99302)) b!950796))

(assert (= (or b!950791 b!950796) bm!41415))

(assert (= (or b!950777 bm!41415) bm!41410))

(assert (= (or b!950777 b!950791) bm!41413))

(assert (= (or b!950783 bm!41410) bm!41412))

(assert (= (or b!950783 bm!41413) bm!41416))

(assert (= (and d!115095 res!637352) b!950789))

(assert (= (and d!115095 c!99304) b!950788))

(assert (= (and d!115095 (not c!99304)) b!950790))

(assert (= (and d!115095 res!637347) b!950781))

(assert (= (and b!950781 res!637353) b!950779))

(assert (= (and b!950781 (not res!637345)) b!950794))

(assert (= (and b!950794 res!637351) b!950787))

(assert (= (and b!950781 res!637348) b!950784))

(assert (= (and b!950784 c!99303) b!950797))

(assert (= (and b!950784 (not c!99303)) b!950780))

(assert (= (and b!950797 res!637346) b!950795))

(assert (= (or b!950797 b!950780) bm!41414))

(assert (= (and b!950784 res!637350) b!950778))

(assert (= (and b!950778 c!99300) b!950782))

(assert (= (and b!950778 (not c!99300)) b!950793))

(assert (= (and b!950782 res!637349) b!950792))

(assert (= (or b!950782 b!950793) bm!41411))

(declare-fun b_lambda!14365 () Bool)

(assert (=> (not b_lambda!14365) (not b!950787)))

(declare-fun t!27685 () Bool)

(declare-fun tb!6187 () Bool)

(assert (=> (and b!950664 (= (defaultEntry!5791 thiss!1141) (defaultEntry!5791 thiss!1141)) t!27685) tb!6187))

(declare-fun result!12299 () Bool)

(assert (=> tb!6187 (= result!12299 tp_is_empty!20761)))

(assert (=> b!950787 t!27685))

(declare-fun b_and!29697 () Bool)

(assert (= b_and!29691 (and (=> t!27685 result!12299) b_and!29697)))

(declare-fun m!882593 () Bool)

(assert (=> b!950792 m!882593))

(declare-fun m!882595 () Bool)

(assert (=> b!950789 m!882595))

(assert (=> b!950789 m!882595))

(declare-fun m!882597 () Bool)

(assert (=> b!950789 m!882597))

(assert (=> b!950794 m!882595))

(assert (=> b!950794 m!882595))

(declare-fun m!882599 () Bool)

(assert (=> b!950794 m!882599))

(declare-fun m!882601 () Bool)

(assert (=> b!950795 m!882601))

(declare-fun m!882603 () Bool)

(assert (=> bm!41414 m!882603))

(assert (=> d!115095 m!882521))

(declare-fun m!882605 () Bool)

(assert (=> bm!41412 m!882605))

(assert (=> b!950779 m!882595))

(assert (=> b!950779 m!882595))

(assert (=> b!950779 m!882597))

(declare-fun m!882607 () Bool)

(assert (=> bm!41411 m!882607))

(declare-fun m!882609 () Bool)

(assert (=> bm!41416 m!882609))

(declare-fun m!882611 () Bool)

(assert (=> b!950788 m!882611))

(declare-fun m!882613 () Bool)

(assert (=> b!950788 m!882613))

(declare-fun m!882615 () Bool)

(assert (=> b!950788 m!882615))

(declare-fun m!882617 () Bool)

(assert (=> b!950788 m!882617))

(declare-fun m!882619 () Bool)

(assert (=> b!950788 m!882619))

(declare-fun m!882621 () Bool)

(assert (=> b!950788 m!882621))

(assert (=> b!950788 m!882595))

(declare-fun m!882623 () Bool)

(assert (=> b!950788 m!882623))

(declare-fun m!882625 () Bool)

(assert (=> b!950788 m!882625))

(declare-fun m!882627 () Bool)

(assert (=> b!950788 m!882627))

(declare-fun m!882629 () Bool)

(assert (=> b!950788 m!882629))

(assert (=> b!950788 m!882619))

(declare-fun m!882631 () Bool)

(assert (=> b!950788 m!882631))

(declare-fun m!882633 () Bool)

(assert (=> b!950788 m!882633))

(declare-fun m!882635 () Bool)

(assert (=> b!950788 m!882635))

(assert (=> b!950788 m!882605))

(assert (=> b!950788 m!882625))

(declare-fun m!882637 () Bool)

(assert (=> b!950788 m!882637))

(declare-fun m!882639 () Bool)

(assert (=> b!950788 m!882639))

(assert (=> b!950788 m!882631))

(assert (=> b!950788 m!882613))

(assert (=> b!950787 m!882595))

(declare-fun m!882641 () Bool)

(assert (=> b!950787 m!882641))

(declare-fun m!882643 () Bool)

(assert (=> b!950787 m!882643))

(declare-fun m!882645 () Bool)

(assert (=> b!950787 m!882645))

(declare-fun m!882647 () Bool)

(assert (=> b!950787 m!882647))

(assert (=> b!950787 m!882595))

(assert (=> b!950787 m!882643))

(assert (=> b!950787 m!882645))

(declare-fun m!882649 () Bool)

(assert (=> b!950783 m!882649))

(assert (=> b!950665 d!115095))

(declare-fun d!115097 () Bool)

(assert (=> d!115097 (= (validMask!0 (mask!27596 thiss!1141)) (and (or (= (mask!27596 thiss!1141) #b00000000000000000000000000000111) (= (mask!27596 thiss!1141) #b00000000000000000000000000001111) (= (mask!27596 thiss!1141) #b00000000000000000000000000011111) (= (mask!27596 thiss!1141) #b00000000000000000000000000111111) (= (mask!27596 thiss!1141) #b00000000000000000000000001111111) (= (mask!27596 thiss!1141) #b00000000000000000000000011111111) (= (mask!27596 thiss!1141) #b00000000000000000000000111111111) (= (mask!27596 thiss!1141) #b00000000000000000000001111111111) (= (mask!27596 thiss!1141) #b00000000000000000000011111111111) (= (mask!27596 thiss!1141) #b00000000000000000000111111111111) (= (mask!27596 thiss!1141) #b00000000000000000001111111111111) (= (mask!27596 thiss!1141) #b00000000000000000011111111111111) (= (mask!27596 thiss!1141) #b00000000000000000111111111111111) (= (mask!27596 thiss!1141) #b00000000000000001111111111111111) (= (mask!27596 thiss!1141) #b00000000000000011111111111111111) (= (mask!27596 thiss!1141) #b00000000000000111111111111111111) (= (mask!27596 thiss!1141) #b00000000000001111111111111111111) (= (mask!27596 thiss!1141) #b00000000000011111111111111111111) (= (mask!27596 thiss!1141) #b00000000000111111111111111111111) (= (mask!27596 thiss!1141) #b00000000001111111111111111111111) (= (mask!27596 thiss!1141) #b00000000011111111111111111111111) (= (mask!27596 thiss!1141) #b00000000111111111111111111111111) (= (mask!27596 thiss!1141) #b00000001111111111111111111111111) (= (mask!27596 thiss!1141) #b00000011111111111111111111111111) (= (mask!27596 thiss!1141) #b00000111111111111111111111111111) (= (mask!27596 thiss!1141) #b00001111111111111111111111111111) (= (mask!27596 thiss!1141) #b00011111111111111111111111111111) (= (mask!27596 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27596 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950666 d!115097))

(declare-fun d!115099 () Bool)

(declare-fun lt!428140 () (_ BitVec 32))

(assert (=> d!115099 (and (or (bvslt lt!428140 #b00000000000000000000000000000000) (bvsge lt!428140 (size!28134 (_keys!10727 thiss!1141))) (and (bvsge lt!428140 #b00000000000000000000000000000000) (bvslt lt!428140 (size!28134 (_keys!10727 thiss!1141))))) (bvsge lt!428140 #b00000000000000000000000000000000) (bvslt lt!428140 (size!28134 (_keys!10727 thiss!1141))) (= (select (arr!27654 (_keys!10727 thiss!1141)) lt!428140) key!756))))

(declare-fun e!535351 () (_ BitVec 32))

(assert (=> d!115099 (= lt!428140 e!535351)))

(declare-fun c!99307 () Bool)

(assert (=> d!115099 (= c!99307 (= (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))) (bvslt (size!28134 (_keys!10727 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115099 (= (arrayScanForKey!0 (_keys!10727 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428140)))

(declare-fun b!950804 () Bool)

(assert (=> b!950804 (= e!535351 #b00000000000000000000000000000000)))

(declare-fun b!950805 () Bool)

(assert (=> b!950805 (= e!535351 (arrayScanForKey!0 (_keys!10727 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115099 c!99307) b!950804))

(assert (= (and d!115099 (not c!99307)) b!950805))

(declare-fun m!882651 () Bool)

(assert (=> d!115099 m!882651))

(assert (=> d!115099 m!882595))

(declare-fun m!882653 () Bool)

(assert (=> b!950805 m!882653))

(assert (=> b!950666 d!115099))

(declare-fun d!115101 () Bool)

(declare-fun res!637358 () Bool)

(declare-fun e!535356 () Bool)

(assert (=> d!115101 (=> res!637358 e!535356)))

(assert (=> d!115101 (= res!637358 (= (select (arr!27654 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115101 (= (arrayContainsKey!0 (_keys!10727 thiss!1141) key!756 #b00000000000000000000000000000000) e!535356)))

(declare-fun b!950810 () Bool)

(declare-fun e!535357 () Bool)

(assert (=> b!950810 (= e!535356 e!535357)))

(declare-fun res!637359 () Bool)

(assert (=> b!950810 (=> (not res!637359) (not e!535357))))

(assert (=> b!950810 (= res!637359 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28134 (_keys!10727 thiss!1141))))))

(declare-fun b!950811 () Bool)

(assert (=> b!950811 (= e!535357 (arrayContainsKey!0 (_keys!10727 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115101 (not res!637358)) b!950810))

(assert (= (and b!950810 res!637359) b!950811))

(assert (=> d!115101 m!882595))

(declare-fun m!882655 () Bool)

(assert (=> b!950811 m!882655))

(assert (=> b!950666 d!115101))

(declare-fun d!115103 () Bool)

(declare-fun e!535360 () Bool)

(assert (=> d!115103 e!535360))

(declare-fun c!99310 () Bool)

(assert (=> d!115103 (= c!99310 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428143 () Unit!31879)

(declare-fun choose!1598 (array!57511 array!57509 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 64) Int) Unit!31879)

(assert (=> d!115103 (= lt!428143 (choose!1598 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) key!756 (defaultEntry!5791 thiss!1141)))))

(assert (=> d!115103 (validMask!0 (mask!27596 thiss!1141))))

(assert (=> d!115103 (= (lemmaKeyInListMapIsInArray!306 (_keys!10727 thiss!1141) (_values!5814 thiss!1141) (mask!27596 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) key!756 (defaultEntry!5791 thiss!1141)) lt!428143)))

(declare-fun b!950816 () Bool)

(assert (=> b!950816 (= e!535360 (arrayContainsKey!0 (_keys!10727 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950817 () Bool)

(assert (=> b!950817 (= e!535360 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115103 c!99310) b!950816))

(assert (= (and d!115103 (not c!99310)) b!950817))

(declare-fun m!882657 () Bool)

(assert (=> d!115103 m!882657))

(assert (=> d!115103 m!882521))

(assert (=> b!950816 m!882525))

(assert (=> b!950666 d!115103))

(declare-fun b!950830 () Bool)

(declare-fun e!535368 () SeekEntryResult!9145)

(declare-fun lt!428153 () SeekEntryResult!9145)

(assert (=> b!950830 (= e!535368 (MissingZero!9145 (index!38953 lt!428153)))))

(declare-fun b!950831 () Bool)

(declare-fun c!99317 () Bool)

(declare-fun lt!428152 () (_ BitVec 64))

(assert (=> b!950831 (= c!99317 (= lt!428152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535367 () SeekEntryResult!9145)

(assert (=> b!950831 (= e!535367 e!535368)))

(declare-fun b!950832 () Bool)

(assert (=> b!950832 (= e!535367 (Found!9145 (index!38953 lt!428153)))))

(declare-fun b!950833 () Bool)

(declare-fun e!535369 () SeekEntryResult!9145)

(assert (=> b!950833 (= e!535369 e!535367)))

(assert (=> b!950833 (= lt!428152 (select (arr!27654 (_keys!10727 thiss!1141)) (index!38953 lt!428153)))))

(declare-fun c!99318 () Bool)

(assert (=> b!950833 (= c!99318 (= lt!428152 key!756))))

(declare-fun b!950834 () Bool)

(declare-fun lt!428155 () SeekEntryResult!9145)

(assert (=> b!950834 (= e!535368 (ite ((_ is MissingVacant!9145) lt!428155) (MissingZero!9145 (index!38954 lt!428155)) lt!428155))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57511 (_ BitVec 32)) SeekEntryResult!9145)

(assert (=> b!950834 (= lt!428155 (seekKeyOrZeroReturnVacant!0 (x!81802 lt!428153) (index!38953 lt!428153) (index!38953 lt!428153) key!756 (_keys!10727 thiss!1141) (mask!27596 thiss!1141)))))

(declare-fun b!950835 () Bool)

(assert (=> b!950835 (= e!535369 Undefined!9145)))

(declare-fun d!115105 () Bool)

(declare-fun lt!428154 () SeekEntryResult!9145)

(assert (=> d!115105 (and (or ((_ is MissingVacant!9145) lt!428154) (not ((_ is Found!9145) lt!428154)) (and (bvsge (index!38952 lt!428154) #b00000000000000000000000000000000) (bvslt (index!38952 lt!428154) (size!28134 (_keys!10727 thiss!1141))))) (not ((_ is MissingVacant!9145) lt!428154)) (or (not ((_ is Found!9145) lt!428154)) (= (select (arr!27654 (_keys!10727 thiss!1141)) (index!38952 lt!428154)) key!756)))))

(assert (=> d!115105 (= lt!428154 e!535369)))

(declare-fun c!99319 () Bool)

(assert (=> d!115105 (= c!99319 (and ((_ is Intermediate!9145) lt!428153) (undefined!9957 lt!428153)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57511 (_ BitVec 32)) SeekEntryResult!9145)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115105 (= lt!428153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27596 thiss!1141)) key!756 (_keys!10727 thiss!1141) (mask!27596 thiss!1141)))))

(assert (=> d!115105 (validMask!0 (mask!27596 thiss!1141))))

(assert (=> d!115105 (= (seekEntry!0 key!756 (_keys!10727 thiss!1141) (mask!27596 thiss!1141)) lt!428154)))

(assert (= (and d!115105 c!99319) b!950835))

(assert (= (and d!115105 (not c!99319)) b!950833))

(assert (= (and b!950833 c!99318) b!950832))

(assert (= (and b!950833 (not c!99318)) b!950831))

(assert (= (and b!950831 c!99317) b!950830))

(assert (= (and b!950831 (not c!99317)) b!950834))

(declare-fun m!882659 () Bool)

(assert (=> b!950833 m!882659))

(declare-fun m!882661 () Bool)

(assert (=> b!950834 m!882661))

(declare-fun m!882663 () Bool)

(assert (=> d!115105 m!882663))

(declare-fun m!882665 () Bool)

(assert (=> d!115105 m!882665))

(assert (=> d!115105 m!882665))

(declare-fun m!882667 () Bool)

(assert (=> d!115105 m!882667))

(assert (=> d!115105 m!882521))

(assert (=> b!950671 d!115105))

(declare-fun d!115107 () Bool)

(declare-fun res!637366 () Bool)

(declare-fun e!535372 () Bool)

(assert (=> d!115107 (=> (not res!637366) (not e!535372))))

(declare-fun simpleValid!376 (LongMapFixedSize!4948) Bool)

(assert (=> d!115107 (= res!637366 (simpleValid!376 thiss!1141))))

(assert (=> d!115107 (= (valid!1888 thiss!1141) e!535372)))

(declare-fun b!950842 () Bool)

(declare-fun res!637367 () Bool)

(assert (=> b!950842 (=> (not res!637367) (not e!535372))))

(declare-fun arrayCountValidKeys!0 (array!57511 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950842 (= res!637367 (= (arrayCountValidKeys!0 (_keys!10727 thiss!1141) #b00000000000000000000000000000000 (size!28134 (_keys!10727 thiss!1141))) (_size!2529 thiss!1141)))))

(declare-fun b!950843 () Bool)

(declare-fun res!637368 () Bool)

(assert (=> b!950843 (=> (not res!637368) (not e!535372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57511 (_ BitVec 32)) Bool)

(assert (=> b!950843 (= res!637368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10727 thiss!1141) (mask!27596 thiss!1141)))))

(declare-fun b!950844 () Bool)

(declare-datatypes ((List!19350 0))(
  ( (Nil!19347) (Cons!19346 (h!20507 (_ BitVec 64)) (t!27686 List!19350)) )
))
(declare-fun arrayNoDuplicates!0 (array!57511 (_ BitVec 32) List!19350) Bool)

(assert (=> b!950844 (= e!535372 (arrayNoDuplicates!0 (_keys!10727 thiss!1141) #b00000000000000000000000000000000 Nil!19347))))

(assert (= (and d!115107 res!637366) b!950842))

(assert (= (and b!950842 res!637367) b!950843))

(assert (= (and b!950843 res!637368) b!950844))

(declare-fun m!882669 () Bool)

(assert (=> d!115107 m!882669))

(declare-fun m!882671 () Bool)

(assert (=> b!950842 m!882671))

(declare-fun m!882673 () Bool)

(assert (=> b!950843 m!882673))

(declare-fun m!882675 () Bool)

(assert (=> b!950844 m!882675))

(assert (=> start!81278 d!115107))

(declare-fun d!115109 () Bool)

(assert (=> d!115109 (= (array_inv!21520 (_keys!10727 thiss!1141)) (bvsge (size!28134 (_keys!10727 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950664 d!115109))

(declare-fun d!115111 () Bool)

(assert (=> d!115111 (= (array_inv!21521 (_values!5814 thiss!1141)) (bvsge (size!28133 (_values!5814 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950664 d!115111))

(declare-fun condMapEmpty!33069 () Bool)

(declare-fun mapDefault!33069 () ValueCell!9899)

(assert (=> mapNonEmpty!33060 (= condMapEmpty!33069 (= mapRest!33060 ((as const (Array (_ BitVec 32) ValueCell!9899)) mapDefault!33069)))))

(declare-fun e!535378 () Bool)

(declare-fun mapRes!33069 () Bool)

(assert (=> mapNonEmpty!33060 (= tp!63363 (and e!535378 mapRes!33069))))

(declare-fun b!950852 () Bool)

(assert (=> b!950852 (= e!535378 tp_is_empty!20761)))

(declare-fun b!950851 () Bool)

(declare-fun e!535377 () Bool)

(assert (=> b!950851 (= e!535377 tp_is_empty!20761)))

(declare-fun mapNonEmpty!33069 () Bool)

(declare-fun tp!63378 () Bool)

(assert (=> mapNonEmpty!33069 (= mapRes!33069 (and tp!63378 e!535377))))

(declare-fun mapRest!33069 () (Array (_ BitVec 32) ValueCell!9899))

(declare-fun mapValue!33069 () ValueCell!9899)

(declare-fun mapKey!33069 () (_ BitVec 32))

(assert (=> mapNonEmpty!33069 (= mapRest!33060 (store mapRest!33069 mapKey!33069 mapValue!33069))))

(declare-fun mapIsEmpty!33069 () Bool)

(assert (=> mapIsEmpty!33069 mapRes!33069))

(assert (= (and mapNonEmpty!33060 condMapEmpty!33069) mapIsEmpty!33069))

(assert (= (and mapNonEmpty!33060 (not condMapEmpty!33069)) mapNonEmpty!33069))

(assert (= (and mapNonEmpty!33069 ((_ is ValueCellFull!9899) mapValue!33069)) b!950851))

(assert (= (and mapNonEmpty!33060 ((_ is ValueCellFull!9899) mapDefault!33069)) b!950852))

(declare-fun m!882677 () Bool)

(assert (=> mapNonEmpty!33069 m!882677))

(declare-fun b_lambda!14367 () Bool)

(assert (= b_lambda!14365 (or (and b!950664 b_free!18253) b_lambda!14367)))

(check-sat (not d!115105) (not b!950805) (not bm!41411) (not b!950732) (not b!950779) (not b!950794) (not b!950834) (not b!950734) (not bm!41416) (not b!950844) (not mapNonEmpty!33069) (not d!115095) (not b!950787) (not b!950843) (not b!950783) (not bm!41414) (not b!950795) (not d!115107) (not bm!41412) b_and!29697 (not b!950811) tp_is_empty!20761 (not b!950816) (not b!950788) (not d!115103) (not b_next!18253) (not d!115093) (not b!950842) (not b!950792) (not b!950789) (not b_lambda!14367))
(check-sat b_and!29697 (not b_next!18253))
