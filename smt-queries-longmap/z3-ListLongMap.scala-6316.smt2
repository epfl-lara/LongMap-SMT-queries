; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81100 () Bool)

(assert start!81100)

(declare-fun b!949389 () Bool)

(declare-fun b_free!18219 () Bool)

(declare-fun b_next!18219 () Bool)

(assert (=> b!949389 (= b_free!18219 (not b_next!18219))))

(declare-fun tp!63243 () Bool)

(declare-fun b_and!29665 () Bool)

(assert (=> b!949389 (= tp!63243 b_and!29665)))

(declare-fun b!949385 () Bool)

(declare-fun res!636715 () Bool)

(declare-fun e!534483 () Bool)

(assert (=> b!949385 (=> (not res!636715) (not e!534483))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32601 0))(
  ( (V!32602 (val!10414 Int)) )
))
(declare-datatypes ((ValueCell!9882 0))(
  ( (ValueCellFull!9882 (v!12954 V!32601)) (EmptyCell!9882) )
))
(declare-datatypes ((array!57466 0))(
  ( (array!57467 (arr!27636 (Array (_ BitVec 32) ValueCell!9882)) (size!28112 (_ BitVec 32))) )
))
(declare-datatypes ((array!57468 0))(
  ( (array!57469 (arr!27637 (Array (_ BitVec 32) (_ BitVec 64))) (size!28113 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4914 0))(
  ( (LongMapFixedSize!4915 (defaultEntry!5764 Int) (mask!27544 (_ BitVec 32)) (extraKeys!5496 (_ BitVec 32)) (zeroValue!5600 V!32601) (minValue!5600 V!32601) (_size!2512 (_ BitVec 32)) (_keys!10692 array!57468) (_values!5787 array!57466) (_vacant!2512 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4914)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9132 0))(
  ( (MissingZero!9132 (index!38899 (_ BitVec 32))) (Found!9132 (index!38900 (_ BitVec 32))) (Intermediate!9132 (undefined!9944 Bool) (index!38901 (_ BitVec 32)) (x!81680 (_ BitVec 32))) (Undefined!9132) (MissingVacant!9132 (index!38902 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57468 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!949385 (= res!636715 (not ((_ is Found!9132) (seekEntry!0 key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))))

(declare-fun b!949386 () Bool)

(declare-fun res!636714 () Bool)

(assert (=> b!949386 (=> (not res!636714) (not e!534483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949386 (= res!636714 (validMask!0 (mask!27544 thiss!1141)))))

(declare-fun b!949387 () Bool)

(declare-fun e!534482 () Bool)

(declare-fun tp_is_empty!20727 () Bool)

(assert (=> b!949387 (= e!534482 tp_is_empty!20727)))

(declare-fun res!636716 () Bool)

(assert (=> start!81100 (=> (not res!636716) (not e!534483))))

(declare-fun valid!1871 (LongMapFixedSize!4914) Bool)

(assert (=> start!81100 (= res!636716 (valid!1871 thiss!1141))))

(assert (=> start!81100 e!534483))

(declare-fun e!534480 () Bool)

(assert (=> start!81100 e!534480))

(assert (=> start!81100 true))

(declare-fun b!949388 () Bool)

(declare-fun res!636712 () Bool)

(assert (=> b!949388 (=> (not res!636712) (not e!534483))))

(declare-datatypes ((tuple2!13534 0))(
  ( (tuple2!13535 (_1!6778 (_ BitVec 64)) (_2!6778 V!32601)) )
))
(declare-datatypes ((List!19326 0))(
  ( (Nil!19323) (Cons!19322 (h!20481 tuple2!13534) (t!27659 List!19326)) )
))
(declare-datatypes ((ListLongMap!12231 0))(
  ( (ListLongMap!12232 (toList!6131 List!19326)) )
))
(declare-fun contains!5219 (ListLongMap!12231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3364 (array!57468 array!57466 (_ BitVec 32) (_ BitVec 32) V!32601 V!32601 (_ BitVec 32) Int) ListLongMap!12231)

(assert (=> b!949388 (= res!636712 (contains!5219 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32992 () Bool)

(declare-fun mapRes!32992 () Bool)

(declare-fun tp!63242 () Bool)

(declare-fun e!534479 () Bool)

(assert (=> mapNonEmpty!32992 (= mapRes!32992 (and tp!63242 e!534479))))

(declare-fun mapRest!32992 () (Array (_ BitVec 32) ValueCell!9882))

(declare-fun mapKey!32992 () (_ BitVec 32))

(declare-fun mapValue!32992 () ValueCell!9882)

(assert (=> mapNonEmpty!32992 (= (arr!27636 (_values!5787 thiss!1141)) (store mapRest!32992 mapKey!32992 mapValue!32992))))

(declare-fun e!534481 () Bool)

(declare-fun array_inv!21452 (array!57468) Bool)

(declare-fun array_inv!21453 (array!57466) Bool)

(assert (=> b!949389 (= e!534480 (and tp!63243 tp_is_empty!20727 (array_inv!21452 (_keys!10692 thiss!1141)) (array_inv!21453 (_values!5787 thiss!1141)) e!534481))))

(declare-fun mapIsEmpty!32992 () Bool)

(assert (=> mapIsEmpty!32992 mapRes!32992))

(declare-fun b!949390 () Bool)

(declare-fun res!636713 () Bool)

(assert (=> b!949390 (=> (not res!636713) (not e!534483))))

(assert (=> b!949390 (= res!636713 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949391 () Bool)

(assert (=> b!949391 (= e!534481 (and e!534482 mapRes!32992))))

(declare-fun condMapEmpty!32992 () Bool)

(declare-fun mapDefault!32992 () ValueCell!9882)

(assert (=> b!949391 (= condMapEmpty!32992 (= (arr!27636 (_values!5787 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9882)) mapDefault!32992)))))

(declare-fun b!949392 () Bool)

(assert (=> b!949392 (= e!534483 (and (= (size!28112 (_values!5787 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27544 thiss!1141))) (= (size!28113 (_keys!10692 thiss!1141)) (size!28112 (_values!5787 thiss!1141))) (bvsge (mask!27544 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5496 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5496 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949393 () Bool)

(assert (=> b!949393 (= e!534479 tp_is_empty!20727)))

(assert (= (and start!81100 res!636716) b!949390))

(assert (= (and b!949390 res!636713) b!949385))

(assert (= (and b!949385 res!636715) b!949388))

(assert (= (and b!949388 res!636712) b!949386))

(assert (= (and b!949386 res!636714) b!949392))

(assert (= (and b!949391 condMapEmpty!32992) mapIsEmpty!32992))

(assert (= (and b!949391 (not condMapEmpty!32992)) mapNonEmpty!32992))

(assert (= (and mapNonEmpty!32992 ((_ is ValueCellFull!9882) mapValue!32992)) b!949393))

(assert (= (and b!949391 ((_ is ValueCellFull!9882) mapDefault!32992)) b!949387))

(assert (= b!949389 b!949391))

(assert (= start!81100 b!949389))

(declare-fun m!882035 () Bool)

(assert (=> b!949386 m!882035))

(declare-fun m!882037 () Bool)

(assert (=> mapNonEmpty!32992 m!882037))

(declare-fun m!882039 () Bool)

(assert (=> start!81100 m!882039))

(declare-fun m!882041 () Bool)

(assert (=> b!949388 m!882041))

(assert (=> b!949388 m!882041))

(declare-fun m!882043 () Bool)

(assert (=> b!949388 m!882043))

(declare-fun m!882045 () Bool)

(assert (=> b!949389 m!882045))

(declare-fun m!882047 () Bool)

(assert (=> b!949389 m!882047))

(declare-fun m!882049 () Bool)

(assert (=> b!949385 m!882049))

(check-sat (not b_next!18219) (not b!949385) b_and!29665 (not b!949389) (not mapNonEmpty!32992) tp_is_empty!20727 (not b!949388) (not b!949386) (not start!81100))
(check-sat b_and!29665 (not b_next!18219))
(get-model)

(declare-fun d!115037 () Bool)

(assert (=> d!115037 (= (validMask!0 (mask!27544 thiss!1141)) (and (or (= (mask!27544 thiss!1141) #b00000000000000000000000000000111) (= (mask!27544 thiss!1141) #b00000000000000000000000000001111) (= (mask!27544 thiss!1141) #b00000000000000000000000000011111) (= (mask!27544 thiss!1141) #b00000000000000000000000000111111) (= (mask!27544 thiss!1141) #b00000000000000000000000001111111) (= (mask!27544 thiss!1141) #b00000000000000000000000011111111) (= (mask!27544 thiss!1141) #b00000000000000000000000111111111) (= (mask!27544 thiss!1141) #b00000000000000000000001111111111) (= (mask!27544 thiss!1141) #b00000000000000000000011111111111) (= (mask!27544 thiss!1141) #b00000000000000000000111111111111) (= (mask!27544 thiss!1141) #b00000000000000000001111111111111) (= (mask!27544 thiss!1141) #b00000000000000000011111111111111) (= (mask!27544 thiss!1141) #b00000000000000000111111111111111) (= (mask!27544 thiss!1141) #b00000000000000001111111111111111) (= (mask!27544 thiss!1141) #b00000000000000011111111111111111) (= (mask!27544 thiss!1141) #b00000000000000111111111111111111) (= (mask!27544 thiss!1141) #b00000000000001111111111111111111) (= (mask!27544 thiss!1141) #b00000000000011111111111111111111) (= (mask!27544 thiss!1141) #b00000000000111111111111111111111) (= (mask!27544 thiss!1141) #b00000000001111111111111111111111) (= (mask!27544 thiss!1141) #b00000000011111111111111111111111) (= (mask!27544 thiss!1141) #b00000000111111111111111111111111) (= (mask!27544 thiss!1141) #b00000001111111111111111111111111) (= (mask!27544 thiss!1141) #b00000011111111111111111111111111) (= (mask!27544 thiss!1141) #b00000111111111111111111111111111) (= (mask!27544 thiss!1141) #b00001111111111111111111111111111) (= (mask!27544 thiss!1141) #b00011111111111111111111111111111) (= (mask!27544 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27544 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949386 d!115037))

(declare-fun d!115039 () Bool)

(declare-fun e!534508 () Bool)

(assert (=> d!115039 e!534508))

(declare-fun res!636734 () Bool)

(assert (=> d!115039 (=> res!636734 e!534508)))

(declare-fun lt!427542 () Bool)

(assert (=> d!115039 (= res!636734 (not lt!427542))))

(declare-fun lt!427540 () Bool)

(assert (=> d!115039 (= lt!427542 lt!427540)))

(declare-datatypes ((Unit!31973 0))(
  ( (Unit!31974) )
))
(declare-fun lt!427541 () Unit!31973)

(declare-fun e!534507 () Unit!31973)

(assert (=> d!115039 (= lt!427541 e!534507)))

(declare-fun c!99066 () Bool)

(assert (=> d!115039 (= c!99066 lt!427540)))

(declare-fun containsKey!461 (List!19326 (_ BitVec 64)) Bool)

(assert (=> d!115039 (= lt!427540 (containsKey!461 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))

(assert (=> d!115039 (= (contains!5219 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)) key!756) lt!427542)))

(declare-fun b!949427 () Bool)

(declare-fun lt!427543 () Unit!31973)

(assert (=> b!949427 (= e!534507 lt!427543)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!357 (List!19326 (_ BitVec 64)) Unit!31973)

(assert (=> b!949427 (= lt!427543 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))

(declare-datatypes ((Option!500 0))(
  ( (Some!499 (v!12956 V!32601)) (None!498) )
))
(declare-fun isDefined!366 (Option!500) Bool)

(declare-fun getValueByKey!494 (List!19326 (_ BitVec 64)) Option!500)

(assert (=> b!949427 (isDefined!366 (getValueByKey!494 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))

(declare-fun b!949428 () Bool)

(declare-fun Unit!31975 () Unit!31973)

(assert (=> b!949428 (= e!534507 Unit!31975)))

(declare-fun b!949429 () Bool)

(assert (=> b!949429 (= e!534508 (isDefined!366 (getValueByKey!494 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756)))))

(assert (= (and d!115039 c!99066) b!949427))

(assert (= (and d!115039 (not c!99066)) b!949428))

(assert (= (and d!115039 (not res!636734)) b!949429))

(declare-fun m!882067 () Bool)

(assert (=> d!115039 m!882067))

(declare-fun m!882069 () Bool)

(assert (=> b!949427 m!882069))

(declare-fun m!882071 () Bool)

(assert (=> b!949427 m!882071))

(assert (=> b!949427 m!882071))

(declare-fun m!882073 () Bool)

(assert (=> b!949427 m!882073))

(assert (=> b!949429 m!882071))

(assert (=> b!949429 m!882071))

(assert (=> b!949429 m!882073))

(assert (=> b!949388 d!115039))

(declare-fun bm!41298 () Bool)

(declare-fun call!41306 () Bool)

(declare-fun lt!427608 () ListLongMap!12231)

(assert (=> bm!41298 (= call!41306 (contains!5219 lt!427608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41299 () Bool)

(declare-fun call!41307 () ListLongMap!12231)

(declare-fun call!41301 () ListLongMap!12231)

(assert (=> bm!41299 (= call!41307 call!41301)))

(declare-fun b!949472 () Bool)

(declare-fun e!534544 () ListLongMap!12231)

(declare-fun e!534542 () ListLongMap!12231)

(assert (=> b!949472 (= e!534544 e!534542)))

(declare-fun c!99084 () Bool)

(assert (=> b!949472 (= c!99084 (and (not (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949473 () Bool)

(declare-fun e!534541 () Bool)

(declare-fun e!534537 () Bool)

(assert (=> b!949473 (= e!534541 e!534537)))

(declare-fun res!636761 () Bool)

(assert (=> b!949473 (= res!636761 call!41306)))

(assert (=> b!949473 (=> (not res!636761) (not e!534537))))

(declare-fun b!949474 () Bool)

(declare-fun e!534536 () Bool)

(declare-fun apply!875 (ListLongMap!12231 (_ BitVec 64)) V!32601)

(declare-fun get!14521 (ValueCell!9882 V!32601) V!32601)

(declare-fun dynLambda!1648 (Int (_ BitVec 64)) V!32601)

(assert (=> b!949474 (= e!534536 (= (apply!875 lt!427608 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)) (get!14521 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28112 (_values!5787 thiss!1141))))))

(assert (=> b!949474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun b!949475 () Bool)

(declare-fun e!534545 () Unit!31973)

(declare-fun lt!427594 () Unit!31973)

(assert (=> b!949475 (= e!534545 lt!427594)))

(declare-fun lt!427598 () ListLongMap!12231)

(declare-fun getCurrentListMapNoExtraKeys!3314 (array!57468 array!57466 (_ BitVec 32) (_ BitVec 32) V!32601 V!32601 (_ BitVec 32) Int) ListLongMap!12231)

(assert (=> b!949475 (= lt!427598 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))

(declare-fun lt!427596 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427606 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427606 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427593 () Unit!31973)

(declare-fun addStillContains!578 (ListLongMap!12231 (_ BitVec 64) V!32601 (_ BitVec 64)) Unit!31973)

(assert (=> b!949475 (= lt!427593 (addStillContains!578 lt!427598 lt!427596 (zeroValue!5600 thiss!1141) lt!427606))))

(declare-fun +!2859 (ListLongMap!12231 tuple2!13534) ListLongMap!12231)

(assert (=> b!949475 (contains!5219 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))) lt!427606)))

(declare-fun lt!427595 () Unit!31973)

(assert (=> b!949475 (= lt!427595 lt!427593)))

(declare-fun lt!427597 () ListLongMap!12231)

(assert (=> b!949475 (= lt!427597 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))

(declare-fun lt!427591 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427591 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427607 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427607 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427601 () Unit!31973)

(declare-fun addApplyDifferent!458 (ListLongMap!12231 (_ BitVec 64) V!32601 (_ BitVec 64)) Unit!31973)

(assert (=> b!949475 (= lt!427601 (addApplyDifferent!458 lt!427597 lt!427591 (minValue!5600 thiss!1141) lt!427607))))

(assert (=> b!949475 (= (apply!875 (+!2859 lt!427597 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))) lt!427607) (apply!875 lt!427597 lt!427607))))

(declare-fun lt!427605 () Unit!31973)

(assert (=> b!949475 (= lt!427605 lt!427601)))

(declare-fun lt!427590 () ListLongMap!12231)

(assert (=> b!949475 (= lt!427590 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))

(declare-fun lt!427604 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427603 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427603 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427599 () Unit!31973)

(assert (=> b!949475 (= lt!427599 (addApplyDifferent!458 lt!427590 lt!427604 (zeroValue!5600 thiss!1141) lt!427603))))

(assert (=> b!949475 (= (apply!875 (+!2859 lt!427590 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))) lt!427603) (apply!875 lt!427590 lt!427603))))

(declare-fun lt!427592 () Unit!31973)

(assert (=> b!949475 (= lt!427592 lt!427599)))

(declare-fun lt!427609 () ListLongMap!12231)

(assert (=> b!949475 (= lt!427609 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))

(declare-fun lt!427602 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427589 () (_ BitVec 64))

(assert (=> b!949475 (= lt!427589 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949475 (= lt!427594 (addApplyDifferent!458 lt!427609 lt!427602 (minValue!5600 thiss!1141) lt!427589))))

(assert (=> b!949475 (= (apply!875 (+!2859 lt!427609 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))) lt!427589) (apply!875 lt!427609 lt!427589))))

(declare-fun b!949476 () Bool)

(declare-fun c!99083 () Bool)

(assert (=> b!949476 (= c!99083 (and (not (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534540 () ListLongMap!12231)

(assert (=> b!949476 (= e!534542 e!534540)))

(declare-fun b!949477 () Bool)

(declare-fun e!534539 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949477 (= e!534539 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949478 () Bool)

(declare-fun call!41303 () ListLongMap!12231)

(assert (=> b!949478 (= e!534544 (+!2859 call!41303 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))

(declare-fun c!99081 () Bool)

(declare-fun call!41305 () ListLongMap!12231)

(declare-fun bm!41300 () Bool)

(assert (=> bm!41300 (= call!41303 (+!2859 (ite c!99081 call!41301 (ite c!99084 call!41307 call!41305)) (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))

(declare-fun bm!41301 () Bool)

(assert (=> bm!41301 (= call!41305 call!41307)))

(declare-fun b!949479 () Bool)

(assert (=> b!949479 (= e!534541 (not call!41306))))

(declare-fun bm!41302 () Bool)

(declare-fun call!41304 () ListLongMap!12231)

(assert (=> bm!41302 (= call!41304 call!41303)))

(declare-fun b!949480 () Bool)

(declare-fun e!534543 () Bool)

(assert (=> b!949480 (= e!534543 (= (apply!875 lt!427608 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5600 thiss!1141)))))

(declare-fun bm!41303 () Bool)

(assert (=> bm!41303 (= call!41301 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))

(declare-fun b!949481 () Bool)

(assert (=> b!949481 (= e!534540 call!41305)))

(declare-fun b!949482 () Bool)

(declare-fun Unit!31976 () Unit!31973)

(assert (=> b!949482 (= e!534545 Unit!31976)))

(declare-fun b!949483 () Bool)

(declare-fun e!534538 () Bool)

(declare-fun e!534546 () Bool)

(assert (=> b!949483 (= e!534538 e!534546)))

(declare-fun c!99082 () Bool)

(assert (=> b!949483 (= c!99082 (not (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949484 () Bool)

(assert (=> b!949484 (= e!534537 (= (apply!875 lt!427608 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5600 thiss!1141)))))

(declare-fun b!949485 () Bool)

(assert (=> b!949485 (= e!534542 call!41304)))

(declare-fun b!949486 () Bool)

(declare-fun e!534547 () Bool)

(assert (=> b!949486 (= e!534547 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949487 () Bool)

(assert (=> b!949487 (= e!534540 call!41304)))

(declare-fun b!949488 () Bool)

(assert (=> b!949488 (= e!534546 e!534543)))

(declare-fun res!636754 () Bool)

(declare-fun call!41302 () Bool)

(assert (=> b!949488 (= res!636754 call!41302)))

(assert (=> b!949488 (=> (not res!636754) (not e!534543))))

(declare-fun b!949489 () Bool)

(declare-fun e!534535 () Bool)

(assert (=> b!949489 (= e!534535 e!534536)))

(declare-fun res!636760 () Bool)

(assert (=> b!949489 (=> (not res!636760) (not e!534536))))

(assert (=> b!949489 (= res!636760 (contains!5219 lt!427608 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun b!949490 () Bool)

(declare-fun res!636759 () Bool)

(assert (=> b!949490 (=> (not res!636759) (not e!534538))))

(assert (=> b!949490 (= res!636759 e!534541)))

(declare-fun c!99080 () Bool)

(assert (=> b!949490 (= c!99080 (not (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!949491 () Bool)

(declare-fun res!636756 () Bool)

(assert (=> b!949491 (=> (not res!636756) (not e!534538))))

(assert (=> b!949491 (= res!636756 e!534535)))

(declare-fun res!636753 () Bool)

(assert (=> b!949491 (=> res!636753 e!534535)))

(assert (=> b!949491 (= res!636753 (not e!534547))))

(declare-fun res!636757 () Bool)

(assert (=> b!949491 (=> (not res!636757) (not e!534547))))

(assert (=> b!949491 (= res!636757 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun d!115041 () Bool)

(assert (=> d!115041 e!534538))

(declare-fun res!636758 () Bool)

(assert (=> d!115041 (=> (not res!636758) (not e!534538))))

(assert (=> d!115041 (= res!636758 (or (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))))

(declare-fun lt!427588 () ListLongMap!12231)

(assert (=> d!115041 (= lt!427608 lt!427588)))

(declare-fun lt!427600 () Unit!31973)

(assert (=> d!115041 (= lt!427600 e!534545)))

(declare-fun c!99079 () Bool)

(assert (=> d!115041 (= c!99079 e!534539)))

(declare-fun res!636755 () Bool)

(assert (=> d!115041 (=> (not res!636755) (not e!534539))))

(assert (=> d!115041 (= res!636755 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> d!115041 (= lt!427588 e!534544)))

(assert (=> d!115041 (= c!99081 (and (not (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5496 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115041 (validMask!0 (mask!27544 thiss!1141))))

(assert (=> d!115041 (= (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)) lt!427608)))

(declare-fun b!949492 () Bool)

(assert (=> b!949492 (= e!534546 (not call!41302))))

(declare-fun bm!41304 () Bool)

(assert (=> bm!41304 (= call!41302 (contains!5219 lt!427608 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115041 c!99081) b!949478))

(assert (= (and d!115041 (not c!99081)) b!949472))

(assert (= (and b!949472 c!99084) b!949485))

(assert (= (and b!949472 (not c!99084)) b!949476))

(assert (= (and b!949476 c!99083) b!949487))

(assert (= (and b!949476 (not c!99083)) b!949481))

(assert (= (or b!949487 b!949481) bm!41301))

(assert (= (or b!949485 bm!41301) bm!41299))

(assert (= (or b!949485 b!949487) bm!41302))

(assert (= (or b!949478 bm!41299) bm!41303))

(assert (= (or b!949478 bm!41302) bm!41300))

(assert (= (and d!115041 res!636755) b!949477))

(assert (= (and d!115041 c!99079) b!949475))

(assert (= (and d!115041 (not c!99079)) b!949482))

(assert (= (and d!115041 res!636758) b!949491))

(assert (= (and b!949491 res!636757) b!949486))

(assert (= (and b!949491 (not res!636753)) b!949489))

(assert (= (and b!949489 res!636760) b!949474))

(assert (= (and b!949491 res!636756) b!949490))

(assert (= (and b!949490 c!99080) b!949473))

(assert (= (and b!949490 (not c!99080)) b!949479))

(assert (= (and b!949473 res!636761) b!949484))

(assert (= (or b!949473 b!949479) bm!41298))

(assert (= (and b!949490 res!636759) b!949483))

(assert (= (and b!949483 c!99082) b!949488))

(assert (= (and b!949483 (not c!99082)) b!949492))

(assert (= (and b!949488 res!636754) b!949480))

(assert (= (or b!949488 b!949492) bm!41304))

(declare-fun b_lambda!14347 () Bool)

(assert (=> (not b_lambda!14347) (not b!949474)))

(declare-fun t!27661 () Bool)

(declare-fun tb!6185 () Bool)

(assert (=> (and b!949389 (= (defaultEntry!5764 thiss!1141) (defaultEntry!5764 thiss!1141)) t!27661) tb!6185))

(declare-fun result!12277 () Bool)

(assert (=> tb!6185 (= result!12277 tp_is_empty!20727)))

(assert (=> b!949474 t!27661))

(declare-fun b_and!29669 () Bool)

(assert (= b_and!29665 (and (=> t!27661 result!12277) b_and!29669)))

(declare-fun m!882075 () Bool)

(assert (=> b!949489 m!882075))

(assert (=> b!949489 m!882075))

(declare-fun m!882077 () Bool)

(assert (=> b!949489 m!882077))

(assert (=> b!949474 m!882075))

(assert (=> b!949474 m!882075))

(declare-fun m!882079 () Bool)

(assert (=> b!949474 m!882079))

(declare-fun m!882081 () Bool)

(assert (=> b!949474 m!882081))

(declare-fun m!882083 () Bool)

(assert (=> b!949474 m!882083))

(assert (=> b!949474 m!882083))

(assert (=> b!949474 m!882081))

(declare-fun m!882085 () Bool)

(assert (=> b!949474 m!882085))

(assert (=> b!949486 m!882075))

(assert (=> b!949486 m!882075))

(declare-fun m!882087 () Bool)

(assert (=> b!949486 m!882087))

(declare-fun m!882089 () Bool)

(assert (=> bm!41300 m!882089))

(assert (=> d!115041 m!882035))

(declare-fun m!882091 () Bool)

(assert (=> bm!41304 m!882091))

(declare-fun m!882093 () Bool)

(assert (=> bm!41303 m!882093))

(assert (=> b!949477 m!882075))

(assert (=> b!949477 m!882075))

(assert (=> b!949477 m!882087))

(declare-fun m!882095 () Bool)

(assert (=> b!949480 m!882095))

(declare-fun m!882097 () Bool)

(assert (=> b!949478 m!882097))

(declare-fun m!882099 () Bool)

(assert (=> b!949475 m!882099))

(declare-fun m!882101 () Bool)

(assert (=> b!949475 m!882101))

(declare-fun m!882103 () Bool)

(assert (=> b!949475 m!882103))

(declare-fun m!882105 () Bool)

(assert (=> b!949475 m!882105))

(assert (=> b!949475 m!882093))

(declare-fun m!882107 () Bool)

(assert (=> b!949475 m!882107))

(declare-fun m!882109 () Bool)

(assert (=> b!949475 m!882109))

(assert (=> b!949475 m!882105))

(declare-fun m!882111 () Bool)

(assert (=> b!949475 m!882111))

(declare-fun m!882113 () Bool)

(assert (=> b!949475 m!882113))

(declare-fun m!882115 () Bool)

(assert (=> b!949475 m!882115))

(assert (=> b!949475 m!882075))

(declare-fun m!882117 () Bool)

(assert (=> b!949475 m!882117))

(assert (=> b!949475 m!882101))

(assert (=> b!949475 m!882107))

(declare-fun m!882119 () Bool)

(assert (=> b!949475 m!882119))

(declare-fun m!882121 () Bool)

(assert (=> b!949475 m!882121))

(declare-fun m!882123 () Bool)

(assert (=> b!949475 m!882123))

(assert (=> b!949475 m!882113))

(declare-fun m!882125 () Bool)

(assert (=> b!949475 m!882125))

(declare-fun m!882127 () Bool)

(assert (=> b!949475 m!882127))

(declare-fun m!882129 () Bool)

(assert (=> bm!41298 m!882129))

(declare-fun m!882131 () Bool)

(assert (=> b!949484 m!882131))

(assert (=> b!949388 d!115041))

(declare-fun d!115043 () Bool)

(declare-fun res!636768 () Bool)

(declare-fun e!534550 () Bool)

(assert (=> d!115043 (=> (not res!636768) (not e!534550))))

(declare-fun simpleValid!371 (LongMapFixedSize!4914) Bool)

(assert (=> d!115043 (= res!636768 (simpleValid!371 thiss!1141))))

(assert (=> d!115043 (= (valid!1871 thiss!1141) e!534550)))

(declare-fun b!949501 () Bool)

(declare-fun res!636769 () Bool)

(assert (=> b!949501 (=> (not res!636769) (not e!534550))))

(declare-fun arrayCountValidKeys!0 (array!57468 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949501 (= res!636769 (= (arrayCountValidKeys!0 (_keys!10692 thiss!1141) #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))) (_size!2512 thiss!1141)))))

(declare-fun b!949502 () Bool)

(declare-fun res!636770 () Bool)

(assert (=> b!949502 (=> (not res!636770) (not e!534550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57468 (_ BitVec 32)) Bool)

(assert (=> b!949502 (= res!636770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))

(declare-fun b!949503 () Bool)

(declare-datatypes ((List!19327 0))(
  ( (Nil!19324) (Cons!19323 (h!20482 (_ BitVec 64)) (t!27662 List!19327)) )
))
(declare-fun arrayNoDuplicates!0 (array!57468 (_ BitVec 32) List!19327) Bool)

(assert (=> b!949503 (= e!534550 (arrayNoDuplicates!0 (_keys!10692 thiss!1141) #b00000000000000000000000000000000 Nil!19324))))

(assert (= (and d!115043 res!636768) b!949501))

(assert (= (and b!949501 res!636769) b!949502))

(assert (= (and b!949502 res!636770) b!949503))

(declare-fun m!882133 () Bool)

(assert (=> d!115043 m!882133))

(declare-fun m!882135 () Bool)

(assert (=> b!949501 m!882135))

(declare-fun m!882137 () Bool)

(assert (=> b!949502 m!882137))

(declare-fun m!882139 () Bool)

(assert (=> b!949503 m!882139))

(assert (=> start!81100 d!115043))

(declare-fun d!115045 () Bool)

(assert (=> d!115045 (= (array_inv!21452 (_keys!10692 thiss!1141)) (bvsge (size!28113 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949389 d!115045))

(declare-fun d!115047 () Bool)

(assert (=> d!115047 (= (array_inv!21453 (_values!5787 thiss!1141)) (bvsge (size!28112 (_values!5787 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949389 d!115047))

(declare-fun b!949516 () Bool)

(declare-fun c!99091 () Bool)

(declare-fun lt!427621 () (_ BitVec 64))

(assert (=> b!949516 (= c!99091 (= lt!427621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534557 () SeekEntryResult!9132)

(declare-fun e!534559 () SeekEntryResult!9132)

(assert (=> b!949516 (= e!534557 e!534559)))

(declare-fun b!949517 () Bool)

(declare-fun lt!427620 () SeekEntryResult!9132)

(assert (=> b!949517 (= e!534559 (MissingZero!9132 (index!38901 lt!427620)))))

(declare-fun b!949518 () Bool)

(declare-fun lt!427619 () SeekEntryResult!9132)

(assert (=> b!949518 (= e!534559 (ite ((_ is MissingVacant!9132) lt!427619) (MissingZero!9132 (index!38902 lt!427619)) lt!427619))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57468 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!949518 (= lt!427619 (seekKeyOrZeroReturnVacant!0 (x!81680 lt!427620) (index!38901 lt!427620) (index!38901 lt!427620) key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))

(declare-fun b!949519 () Bool)

(declare-fun e!534558 () SeekEntryResult!9132)

(assert (=> b!949519 (= e!534558 Undefined!9132)))

(declare-fun d!115049 () Bool)

(declare-fun lt!427618 () SeekEntryResult!9132)

(assert (=> d!115049 (and (or ((_ is MissingVacant!9132) lt!427618) (not ((_ is Found!9132) lt!427618)) (and (bvsge (index!38900 lt!427618) #b00000000000000000000000000000000) (bvslt (index!38900 lt!427618) (size!28113 (_keys!10692 thiss!1141))))) (not ((_ is MissingVacant!9132) lt!427618)) (or (not ((_ is Found!9132) lt!427618)) (= (select (arr!27637 (_keys!10692 thiss!1141)) (index!38900 lt!427618)) key!756)))))

(assert (=> d!115049 (= lt!427618 e!534558)))

(declare-fun c!99092 () Bool)

(assert (=> d!115049 (= c!99092 (and ((_ is Intermediate!9132) lt!427620) (undefined!9944 lt!427620)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57468 (_ BitVec 32)) SeekEntryResult!9132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115049 (= lt!427620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27544 thiss!1141)) key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))

(assert (=> d!115049 (validMask!0 (mask!27544 thiss!1141))))

(assert (=> d!115049 (= (seekEntry!0 key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)) lt!427618)))

(declare-fun b!949520 () Bool)

(assert (=> b!949520 (= e!534558 e!534557)))

(assert (=> b!949520 (= lt!427621 (select (arr!27637 (_keys!10692 thiss!1141)) (index!38901 lt!427620)))))

(declare-fun c!99093 () Bool)

(assert (=> b!949520 (= c!99093 (= lt!427621 key!756))))

(declare-fun b!949521 () Bool)

(assert (=> b!949521 (= e!534557 (Found!9132 (index!38901 lt!427620)))))

(assert (= (and d!115049 c!99092) b!949519))

(assert (= (and d!115049 (not c!99092)) b!949520))

(assert (= (and b!949520 c!99093) b!949521))

(assert (= (and b!949520 (not c!99093)) b!949516))

(assert (= (and b!949516 c!99091) b!949517))

(assert (= (and b!949516 (not c!99091)) b!949518))

(declare-fun m!882141 () Bool)

(assert (=> b!949518 m!882141))

(declare-fun m!882143 () Bool)

(assert (=> d!115049 m!882143))

(declare-fun m!882145 () Bool)

(assert (=> d!115049 m!882145))

(assert (=> d!115049 m!882145))

(declare-fun m!882147 () Bool)

(assert (=> d!115049 m!882147))

(assert (=> d!115049 m!882035))

(declare-fun m!882149 () Bool)

(assert (=> b!949520 m!882149))

(assert (=> b!949385 d!115049))

(declare-fun b!949529 () Bool)

(declare-fun e!534565 () Bool)

(assert (=> b!949529 (= e!534565 tp_is_empty!20727)))

(declare-fun condMapEmpty!32998 () Bool)

(declare-fun mapDefault!32998 () ValueCell!9882)

(assert (=> mapNonEmpty!32992 (= condMapEmpty!32998 (= mapRest!32992 ((as const (Array (_ BitVec 32) ValueCell!9882)) mapDefault!32998)))))

(declare-fun mapRes!32998 () Bool)

(assert (=> mapNonEmpty!32992 (= tp!63242 (and e!534565 mapRes!32998))))

(declare-fun b!949528 () Bool)

(declare-fun e!534564 () Bool)

(assert (=> b!949528 (= e!534564 tp_is_empty!20727)))

(declare-fun mapNonEmpty!32998 () Bool)

(declare-fun tp!63252 () Bool)

(assert (=> mapNonEmpty!32998 (= mapRes!32998 (and tp!63252 e!534564))))

(declare-fun mapValue!32998 () ValueCell!9882)

(declare-fun mapRest!32998 () (Array (_ BitVec 32) ValueCell!9882))

(declare-fun mapKey!32998 () (_ BitVec 32))

(assert (=> mapNonEmpty!32998 (= mapRest!32992 (store mapRest!32998 mapKey!32998 mapValue!32998))))

(declare-fun mapIsEmpty!32998 () Bool)

(assert (=> mapIsEmpty!32998 mapRes!32998))

(assert (= (and mapNonEmpty!32992 condMapEmpty!32998) mapIsEmpty!32998))

(assert (= (and mapNonEmpty!32992 (not condMapEmpty!32998)) mapNonEmpty!32998))

(assert (= (and mapNonEmpty!32998 ((_ is ValueCellFull!9882) mapValue!32998)) b!949528))

(assert (= (and mapNonEmpty!32992 ((_ is ValueCellFull!9882) mapDefault!32998)) b!949529))

(declare-fun m!882151 () Bool)

(assert (=> mapNonEmpty!32998 m!882151))

(declare-fun b_lambda!14349 () Bool)

(assert (= b_lambda!14347 (or (and b!949389 b_free!18219) b_lambda!14349)))

(check-sat (not b!949518) (not b_next!18219) (not mapNonEmpty!32998) (not b!949477) tp_is_empty!20727 (not bm!41304) (not b!949429) (not bm!41300) (not d!115049) (not b!949502) (not b!949486) (not b!949475) (not b!949484) (not d!115039) (not b!949478) (not b!949427) (not d!115043) (not d!115041) b_and!29669 (not b!949489) (not bm!41303) (not b!949501) (not bm!41298) (not b!949503) (not b!949480) (not b_lambda!14349) (not b!949474))
(check-sat b_and!29669 (not b_next!18219))
(get-model)

(declare-fun d!115051 () Bool)

(declare-fun get!14522 (Option!500) V!32601)

(assert (=> d!115051 (= (apply!875 lt!427608 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)) (get!14522 (getValueByKey!494 (toList!6131 lt!427608) (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26689 () Bool)

(assert (= bs!26689 d!115051))

(assert (=> bs!26689 m!882075))

(declare-fun m!882153 () Bool)

(assert (=> bs!26689 m!882153))

(assert (=> bs!26689 m!882153))

(declare-fun m!882155 () Bool)

(assert (=> bs!26689 m!882155))

(assert (=> b!949474 d!115051))

(declare-fun d!115053 () Bool)

(declare-fun c!99096 () Bool)

(assert (=> d!115053 (= c!99096 ((_ is ValueCellFull!9882) (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534568 () V!32601)

(assert (=> d!115053 (= (get!14521 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534568)))

(declare-fun b!949534 () Bool)

(declare-fun get!14523 (ValueCell!9882 V!32601) V!32601)

(assert (=> b!949534 (= e!534568 (get!14523 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949535 () Bool)

(declare-fun get!14524 (ValueCell!9882 V!32601) V!32601)

(assert (=> b!949535 (= e!534568 (get!14524 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115053 c!99096) b!949534))

(assert (= (and d!115053 (not c!99096)) b!949535))

(assert (=> b!949534 m!882083))

(assert (=> b!949534 m!882081))

(declare-fun m!882157 () Bool)

(assert (=> b!949534 m!882157))

(assert (=> b!949535 m!882083))

(assert (=> b!949535 m!882081))

(declare-fun m!882159 () Bool)

(assert (=> b!949535 m!882159))

(assert (=> b!949474 d!115053))

(declare-fun d!115055 () Bool)

(assert (=> d!115055 (isDefined!366 (getValueByKey!494 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))

(declare-fun lt!427624 () Unit!31973)

(declare-fun choose!1581 (List!19326 (_ BitVec 64)) Unit!31973)

(assert (=> d!115055 (= lt!427624 (choose!1581 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))

(declare-fun e!534571 () Bool)

(assert (=> d!115055 e!534571))

(declare-fun res!636773 () Bool)

(assert (=> d!115055 (=> (not res!636773) (not e!534571))))

(declare-fun isStrictlySorted!511 (List!19326) Bool)

(assert (=> d!115055 (= res!636773 (isStrictlySorted!511 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))))

(assert (=> d!115055 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756) lt!427624)))

(declare-fun b!949538 () Bool)

(assert (=> b!949538 (= e!534571 (containsKey!461 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))

(assert (= (and d!115055 res!636773) b!949538))

(assert (=> d!115055 m!882071))

(assert (=> d!115055 m!882071))

(assert (=> d!115055 m!882073))

(declare-fun m!882161 () Bool)

(assert (=> d!115055 m!882161))

(declare-fun m!882163 () Bool)

(assert (=> d!115055 m!882163))

(assert (=> b!949538 m!882067))

(assert (=> b!949427 d!115055))

(declare-fun d!115057 () Bool)

(declare-fun isEmpty!710 (Option!500) Bool)

(assert (=> d!115057 (= (isDefined!366 (getValueByKey!494 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756)) (not (isEmpty!710 (getValueByKey!494 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756))))))

(declare-fun bs!26690 () Bool)

(assert (= bs!26690 d!115057))

(assert (=> bs!26690 m!882071))

(declare-fun m!882165 () Bool)

(assert (=> bs!26690 m!882165))

(assert (=> b!949427 d!115057))

(declare-fun b!949549 () Bool)

(declare-fun e!534577 () Option!500)

(assert (=> b!949549 (= e!534577 (getValueByKey!494 (t!27659 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))) key!756))))

(declare-fun b!949550 () Bool)

(assert (=> b!949550 (= e!534577 None!498)))

(declare-fun b!949547 () Bool)

(declare-fun e!534576 () Option!500)

(assert (=> b!949547 (= e!534576 (Some!499 (_2!6778 (h!20481 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))))))))

(declare-fun d!115059 () Bool)

(declare-fun c!99101 () Bool)

(assert (=> d!115059 (= c!99101 (and ((_ is Cons!19322) (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))) (= (_1!6778 (h!20481 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))))) key!756)))))

(assert (=> d!115059 (= (getValueByKey!494 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756) e!534576)))

(declare-fun b!949548 () Bool)

(assert (=> b!949548 (= e!534576 e!534577)))

(declare-fun c!99102 () Bool)

(assert (=> b!949548 (= c!99102 (and ((_ is Cons!19322) (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))) (not (= (_1!6778 (h!20481 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))))) key!756))))))

(assert (= (and d!115059 c!99101) b!949547))

(assert (= (and d!115059 (not c!99101)) b!949548))

(assert (= (and b!949548 c!99102) b!949549))

(assert (= (and b!949548 (not c!99102)) b!949550))

(declare-fun m!882167 () Bool)

(assert (=> b!949549 m!882167))

(assert (=> b!949427 d!115059))

(declare-fun d!115061 () Bool)

(declare-fun e!534593 () Bool)

(assert (=> d!115061 e!534593))

(declare-fun res!636784 () Bool)

(assert (=> d!115061 (=> (not res!636784) (not e!534593))))

(declare-fun lt!427645 () ListLongMap!12231)

(assert (=> d!115061 (= res!636784 (not (contains!5219 lt!427645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!534595 () ListLongMap!12231)

(assert (=> d!115061 (= lt!427645 e!534595)))

(declare-fun c!99114 () Bool)

(assert (=> d!115061 (= c!99114 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> d!115061 (validMask!0 (mask!27544 thiss!1141))))

(assert (=> d!115061 (= (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)) lt!427645)))

(declare-fun b!949575 () Bool)

(assert (=> b!949575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> b!949575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28112 (_values!5787 thiss!1141))))))

(declare-fun e!534597 () Bool)

(assert (=> b!949575 (= e!534597 (= (apply!875 lt!427645 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)) (get!14521 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949576 () Bool)

(declare-fun e!534594 () Bool)

(assert (=> b!949576 (= e!534594 e!534597)))

(assert (=> b!949576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun res!636783 () Bool)

(assert (=> b!949576 (= res!636783 (contains!5219 lt!427645 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949576 (=> (not res!636783) (not e!534597))))

(declare-fun b!949577 () Bool)

(declare-fun lt!427639 () Unit!31973)

(declare-fun lt!427643 () Unit!31973)

(assert (=> b!949577 (= lt!427639 lt!427643)))

(declare-fun lt!427642 () ListLongMap!12231)

(declare-fun lt!427640 () V!32601)

(declare-fun lt!427641 () (_ BitVec 64))

(declare-fun lt!427644 () (_ BitVec 64))

(assert (=> b!949577 (not (contains!5219 (+!2859 lt!427642 (tuple2!13535 lt!427641 lt!427640)) lt!427644))))

(declare-fun addStillNotContains!226 (ListLongMap!12231 (_ BitVec 64) V!32601 (_ BitVec 64)) Unit!31973)

(assert (=> b!949577 (= lt!427643 (addStillNotContains!226 lt!427642 lt!427641 lt!427640 lt!427644))))

(assert (=> b!949577 (= lt!427644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!949577 (= lt!427640 (get!14521 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!949577 (= lt!427641 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41310 () ListLongMap!12231)

(assert (=> b!949577 (= lt!427642 call!41310)))

(declare-fun e!534596 () ListLongMap!12231)

(assert (=> b!949577 (= e!534596 (+!2859 call!41310 (tuple2!13535 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000) (get!14521 (select (arr!27636 (_values!5787 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1648 (defaultEntry!5764 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!949578 () Bool)

(declare-fun res!636785 () Bool)

(assert (=> b!949578 (=> (not res!636785) (not e!534593))))

(assert (=> b!949578 (= res!636785 (not (contains!5219 lt!427645 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949579 () Bool)

(assert (=> b!949579 (= e!534596 call!41310)))

(declare-fun b!949580 () Bool)

(assert (=> b!949580 (= e!534593 e!534594)))

(declare-fun c!99113 () Bool)

(declare-fun e!534592 () Bool)

(assert (=> b!949580 (= c!99113 e!534592)))

(declare-fun res!636782 () Bool)

(assert (=> b!949580 (=> (not res!636782) (not e!534592))))

(assert (=> b!949580 (= res!636782 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun b!949581 () Bool)

(assert (=> b!949581 (= e!534595 e!534596)))

(declare-fun c!99112 () Bool)

(assert (=> b!949581 (= c!99112 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949582 () Bool)

(declare-fun e!534598 () Bool)

(declare-fun isEmpty!711 (ListLongMap!12231) Bool)

(assert (=> b!949582 (= e!534598 (isEmpty!711 lt!427645))))

(declare-fun b!949583 () Bool)

(assert (=> b!949583 (= e!534592 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949583 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!949584 () Bool)

(assert (=> b!949584 (= e!534594 e!534598)))

(declare-fun c!99111 () Bool)

(assert (=> b!949584 (= c!99111 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun b!949585 () Bool)

(assert (=> b!949585 (= e!534595 (ListLongMap!12232 Nil!19323))))

(declare-fun b!949586 () Bool)

(assert (=> b!949586 (= e!534598 (= lt!427645 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5764 thiss!1141))))))

(declare-fun bm!41307 () Bool)

(assert (=> bm!41307 (= call!41310 (getCurrentListMapNoExtraKeys!3314 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5764 thiss!1141)))))

(assert (= (and d!115061 c!99114) b!949585))

(assert (= (and d!115061 (not c!99114)) b!949581))

(assert (= (and b!949581 c!99112) b!949577))

(assert (= (and b!949581 (not c!99112)) b!949579))

(assert (= (or b!949577 b!949579) bm!41307))

(assert (= (and d!115061 res!636784) b!949578))

(assert (= (and b!949578 res!636785) b!949580))

(assert (= (and b!949580 res!636782) b!949583))

(assert (= (and b!949580 c!99113) b!949576))

(assert (= (and b!949580 (not c!99113)) b!949584))

(assert (= (and b!949576 res!636783) b!949575))

(assert (= (and b!949584 c!99111) b!949586))

(assert (= (and b!949584 (not c!99111)) b!949582))

(declare-fun b_lambda!14351 () Bool)

(assert (=> (not b_lambda!14351) (not b!949575)))

(assert (=> b!949575 t!27661))

(declare-fun b_and!29671 () Bool)

(assert (= b_and!29669 (and (=> t!27661 result!12277) b_and!29671)))

(declare-fun b_lambda!14353 () Bool)

(assert (=> (not b_lambda!14353) (not b!949577)))

(assert (=> b!949577 t!27661))

(declare-fun b_and!29673 () Bool)

(assert (= b_and!29671 (and (=> t!27661 result!12277) b_and!29673)))

(declare-fun m!882169 () Bool)

(assert (=> d!115061 m!882169))

(assert (=> d!115061 m!882035))

(assert (=> b!949575 m!882075))

(assert (=> b!949575 m!882083))

(assert (=> b!949575 m!882081))

(assert (=> b!949575 m!882085))

(assert (=> b!949575 m!882075))

(declare-fun m!882171 () Bool)

(assert (=> b!949575 m!882171))

(assert (=> b!949575 m!882083))

(assert (=> b!949575 m!882081))

(declare-fun m!882173 () Bool)

(assert (=> b!949586 m!882173))

(declare-fun m!882175 () Bool)

(assert (=> b!949577 m!882175))

(assert (=> b!949577 m!882075))

(assert (=> b!949577 m!882083))

(assert (=> b!949577 m!882081))

(assert (=> b!949577 m!882085))

(declare-fun m!882177 () Bool)

(assert (=> b!949577 m!882177))

(declare-fun m!882179 () Bool)

(assert (=> b!949577 m!882179))

(assert (=> b!949577 m!882081))

(assert (=> b!949577 m!882175))

(declare-fun m!882181 () Bool)

(assert (=> b!949577 m!882181))

(assert (=> b!949577 m!882083))

(declare-fun m!882183 () Bool)

(assert (=> b!949578 m!882183))

(declare-fun m!882185 () Bool)

(assert (=> b!949582 m!882185))

(assert (=> bm!41307 m!882173))

(assert (=> b!949583 m!882075))

(assert (=> b!949583 m!882075))

(assert (=> b!949583 m!882087))

(assert (=> b!949581 m!882075))

(assert (=> b!949581 m!882075))

(assert (=> b!949581 m!882087))

(assert (=> b!949576 m!882075))

(assert (=> b!949576 m!882075))

(declare-fun m!882187 () Bool)

(assert (=> b!949576 m!882187))

(assert (=> bm!41303 d!115061))

(assert (=> d!115041 d!115037))

(declare-fun d!115063 () Bool)

(assert (=> d!115063 (= (apply!875 lt!427608 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14522 (getValueByKey!494 (toList!6131 lt!427608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26691 () Bool)

(assert (= bs!26691 d!115063))

(declare-fun m!882189 () Bool)

(assert (=> bs!26691 m!882189))

(assert (=> bs!26691 m!882189))

(declare-fun m!882191 () Bool)

(assert (=> bs!26691 m!882191))

(assert (=> b!949480 d!115063))

(declare-fun d!115065 () Bool)

(assert (=> d!115065 (= (apply!875 lt!427608 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14522 (getValueByKey!494 (toList!6131 lt!427608) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26692 () Bool)

(assert (= bs!26692 d!115065))

(declare-fun m!882193 () Bool)

(assert (=> bs!26692 m!882193))

(assert (=> bs!26692 m!882193))

(declare-fun m!882195 () Bool)

(assert (=> bs!26692 m!882195))

(assert (=> b!949484 d!115065))

(declare-fun b!949596 () Bool)

(declare-fun res!636795 () Bool)

(declare-fun e!534601 () Bool)

(assert (=> b!949596 (=> (not res!636795) (not e!534601))))

(declare-fun size!28116 (LongMapFixedSize!4914) (_ BitVec 32))

(assert (=> b!949596 (= res!636795 (bvsge (size!28116 thiss!1141) (_size!2512 thiss!1141)))))

(declare-fun b!949598 () Bool)

(assert (=> b!949598 (= e!534601 (and (bvsge (extraKeys!5496 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5496 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2512 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949595 () Bool)

(declare-fun res!636796 () Bool)

(assert (=> b!949595 (=> (not res!636796) (not e!534601))))

(assert (=> b!949595 (= res!636796 (and (= (size!28112 (_values!5787 thiss!1141)) (bvadd (mask!27544 thiss!1141) #b00000000000000000000000000000001)) (= (size!28113 (_keys!10692 thiss!1141)) (size!28112 (_values!5787 thiss!1141))) (bvsge (_size!2512 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2512 thiss!1141) (bvadd (mask!27544 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!949597 () Bool)

(declare-fun res!636794 () Bool)

(assert (=> b!949597 (=> (not res!636794) (not e!534601))))

(assert (=> b!949597 (= res!636794 (= (size!28116 thiss!1141) (bvadd (_size!2512 thiss!1141) (bvsdiv (bvadd (extraKeys!5496 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!115067 () Bool)

(declare-fun res!636797 () Bool)

(assert (=> d!115067 (=> (not res!636797) (not e!534601))))

(assert (=> d!115067 (= res!636797 (validMask!0 (mask!27544 thiss!1141)))))

(assert (=> d!115067 (= (simpleValid!371 thiss!1141) e!534601)))

(assert (= (and d!115067 res!636797) b!949595))

(assert (= (and b!949595 res!636796) b!949596))

(assert (= (and b!949596 res!636795) b!949597))

(assert (= (and b!949597 res!636794) b!949598))

(declare-fun m!882197 () Bool)

(assert (=> b!949596 m!882197))

(assert (=> b!949597 m!882197))

(assert (=> d!115067 m!882035))

(assert (=> d!115043 d!115067))

(declare-fun d!115069 () Bool)

(assert (=> d!115069 (= (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949477 d!115069))

(declare-fun d!115071 () Bool)

(declare-fun res!636802 () Bool)

(declare-fun e!534606 () Bool)

(assert (=> d!115071 (=> res!636802 e!534606)))

(assert (=> d!115071 (= res!636802 (and ((_ is Cons!19322) (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))) (= (_1!6778 (h!20481 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))))) key!756)))))

(assert (=> d!115071 (= (containsKey!461 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))) key!756) e!534606)))

(declare-fun b!949603 () Bool)

(declare-fun e!534607 () Bool)

(assert (=> b!949603 (= e!534606 e!534607)))

(declare-fun res!636803 () Bool)

(assert (=> b!949603 (=> (not res!636803) (not e!534607))))

(assert (=> b!949603 (= res!636803 (and (or (not ((_ is Cons!19322) (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))))) (bvsle (_1!6778 (h!20481 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))))) key!756)) ((_ is Cons!19322) (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))) (bvslt (_1!6778 (h!20481 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141))))) key!756)))))

(declare-fun b!949604 () Bool)

(assert (=> b!949604 (= e!534607 (containsKey!461 (t!27659 (toList!6131 (getCurrentListMap!3364 (_keys!10692 thiss!1141) (_values!5787 thiss!1141) (mask!27544 thiss!1141) (extraKeys!5496 thiss!1141) (zeroValue!5600 thiss!1141) (minValue!5600 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5764 thiss!1141)))) key!756))))

(assert (= (and d!115071 (not res!636802)) b!949603))

(assert (= (and b!949603 res!636803) b!949604))

(declare-fun m!882199 () Bool)

(assert (=> b!949604 m!882199))

(assert (=> d!115039 d!115071))

(declare-fun b!949617 () Bool)

(declare-fun e!534616 () SeekEntryResult!9132)

(assert (=> b!949617 (= e!534616 Undefined!9132)))

(declare-fun b!949618 () Bool)

(declare-fun e!534614 () SeekEntryResult!9132)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949618 (= e!534614 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81680 lt!427620) #b00000000000000000000000000000001) (nextIndex!0 (index!38901 lt!427620) (x!81680 lt!427620) (mask!27544 thiss!1141)) (index!38901 lt!427620) key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))

(declare-fun b!949619 () Bool)

(declare-fun c!99121 () Bool)

(declare-fun lt!427650 () (_ BitVec 64))

(assert (=> b!949619 (= c!99121 (= lt!427650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534615 () SeekEntryResult!9132)

(assert (=> b!949619 (= e!534615 e!534614)))

(declare-fun b!949620 () Bool)

(assert (=> b!949620 (= e!534615 (Found!9132 (index!38901 lt!427620)))))

(declare-fun b!949621 () Bool)

(assert (=> b!949621 (= e!534616 e!534615)))

(declare-fun c!99123 () Bool)

(assert (=> b!949621 (= c!99123 (= lt!427650 key!756))))

(declare-fun d!115073 () Bool)

(declare-fun lt!427651 () SeekEntryResult!9132)

(assert (=> d!115073 (and (or ((_ is Undefined!9132) lt!427651) (not ((_ is Found!9132) lt!427651)) (and (bvsge (index!38900 lt!427651) #b00000000000000000000000000000000) (bvslt (index!38900 lt!427651) (size!28113 (_keys!10692 thiss!1141))))) (or ((_ is Undefined!9132) lt!427651) ((_ is Found!9132) lt!427651) (not ((_ is MissingVacant!9132) lt!427651)) (not (= (index!38902 lt!427651) (index!38901 lt!427620))) (and (bvsge (index!38902 lt!427651) #b00000000000000000000000000000000) (bvslt (index!38902 lt!427651) (size!28113 (_keys!10692 thiss!1141))))) (or ((_ is Undefined!9132) lt!427651) (ite ((_ is Found!9132) lt!427651) (= (select (arr!27637 (_keys!10692 thiss!1141)) (index!38900 lt!427651)) key!756) (and ((_ is MissingVacant!9132) lt!427651) (= (index!38902 lt!427651) (index!38901 lt!427620)) (= (select (arr!27637 (_keys!10692 thiss!1141)) (index!38902 lt!427651)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!115073 (= lt!427651 e!534616)))

(declare-fun c!99122 () Bool)

(assert (=> d!115073 (= c!99122 (bvsge (x!81680 lt!427620) #b01111111111111111111111111111110))))

(assert (=> d!115073 (= lt!427650 (select (arr!27637 (_keys!10692 thiss!1141)) (index!38901 lt!427620)))))

(assert (=> d!115073 (validMask!0 (mask!27544 thiss!1141))))

(assert (=> d!115073 (= (seekKeyOrZeroReturnVacant!0 (x!81680 lt!427620) (index!38901 lt!427620) (index!38901 lt!427620) key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)) lt!427651)))

(declare-fun b!949622 () Bool)

(assert (=> b!949622 (= e!534614 (MissingVacant!9132 (index!38901 lt!427620)))))

(assert (= (and d!115073 c!99122) b!949617))

(assert (= (and d!115073 (not c!99122)) b!949621))

(assert (= (and b!949621 c!99123) b!949620))

(assert (= (and b!949621 (not c!99123)) b!949619))

(assert (= (and b!949619 c!99121) b!949622))

(assert (= (and b!949619 (not c!99121)) b!949618))

(declare-fun m!882201 () Bool)

(assert (=> b!949618 m!882201))

(assert (=> b!949618 m!882201))

(declare-fun m!882203 () Bool)

(assert (=> b!949618 m!882203))

(declare-fun m!882205 () Bool)

(assert (=> d!115073 m!882205))

(declare-fun m!882207 () Bool)

(assert (=> d!115073 m!882207))

(assert (=> d!115073 m!882149))

(assert (=> d!115073 m!882035))

(assert (=> b!949518 d!115073))

(declare-fun d!115075 () Bool)

(declare-fun e!534618 () Bool)

(assert (=> d!115075 e!534618))

(declare-fun res!636804 () Bool)

(assert (=> d!115075 (=> res!636804 e!534618)))

(declare-fun lt!427654 () Bool)

(assert (=> d!115075 (= res!636804 (not lt!427654))))

(declare-fun lt!427652 () Bool)

(assert (=> d!115075 (= lt!427654 lt!427652)))

(declare-fun lt!427653 () Unit!31973)

(declare-fun e!534617 () Unit!31973)

(assert (=> d!115075 (= lt!427653 e!534617)))

(declare-fun c!99124 () Bool)

(assert (=> d!115075 (= c!99124 lt!427652)))

(assert (=> d!115075 (= lt!427652 (containsKey!461 (toList!6131 lt!427608) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115075 (= (contains!5219 lt!427608 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427654)))

(declare-fun b!949623 () Bool)

(declare-fun lt!427655 () Unit!31973)

(assert (=> b!949623 (= e!534617 lt!427655)))

(assert (=> b!949623 (= lt!427655 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6131 lt!427608) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949623 (isDefined!366 (getValueByKey!494 (toList!6131 lt!427608) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949624 () Bool)

(declare-fun Unit!31977 () Unit!31973)

(assert (=> b!949624 (= e!534617 Unit!31977)))

(declare-fun b!949625 () Bool)

(assert (=> b!949625 (= e!534618 (isDefined!366 (getValueByKey!494 (toList!6131 lt!427608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115075 c!99124) b!949623))

(assert (= (and d!115075 (not c!99124)) b!949624))

(assert (= (and d!115075 (not res!636804)) b!949625))

(declare-fun m!882209 () Bool)

(assert (=> d!115075 m!882209))

(declare-fun m!882211 () Bool)

(assert (=> b!949623 m!882211))

(assert (=> b!949623 m!882189))

(assert (=> b!949623 m!882189))

(declare-fun m!882213 () Bool)

(assert (=> b!949623 m!882213))

(assert (=> b!949625 m!882189))

(assert (=> b!949625 m!882189))

(assert (=> b!949625 m!882213))

(assert (=> bm!41304 d!115075))

(declare-fun d!115077 () Bool)

(assert (=> d!115077 (= (apply!875 (+!2859 lt!427590 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))) lt!427603) (apply!875 lt!427590 lt!427603))))

(declare-fun lt!427658 () Unit!31973)

(declare-fun choose!1582 (ListLongMap!12231 (_ BitVec 64) V!32601 (_ BitVec 64)) Unit!31973)

(assert (=> d!115077 (= lt!427658 (choose!1582 lt!427590 lt!427604 (zeroValue!5600 thiss!1141) lt!427603))))

(declare-fun e!534621 () Bool)

(assert (=> d!115077 e!534621))

(declare-fun res!636807 () Bool)

(assert (=> d!115077 (=> (not res!636807) (not e!534621))))

(assert (=> d!115077 (= res!636807 (contains!5219 lt!427590 lt!427603))))

(assert (=> d!115077 (= (addApplyDifferent!458 lt!427590 lt!427604 (zeroValue!5600 thiss!1141) lt!427603) lt!427658)))

(declare-fun b!949629 () Bool)

(assert (=> b!949629 (= e!534621 (not (= lt!427603 lt!427604)))))

(assert (= (and d!115077 res!636807) b!949629))

(assert (=> d!115077 m!882107))

(assert (=> d!115077 m!882109))

(declare-fun m!882215 () Bool)

(assert (=> d!115077 m!882215))

(assert (=> d!115077 m!882117))

(assert (=> d!115077 m!882107))

(declare-fun m!882217 () Bool)

(assert (=> d!115077 m!882217))

(assert (=> b!949475 d!115077))

(declare-fun d!115079 () Bool)

(assert (=> d!115079 (= (apply!875 lt!427590 lt!427603) (get!14522 (getValueByKey!494 (toList!6131 lt!427590) lt!427603)))))

(declare-fun bs!26693 () Bool)

(assert (= bs!26693 d!115079))

(declare-fun m!882219 () Bool)

(assert (=> bs!26693 m!882219))

(assert (=> bs!26693 m!882219))

(declare-fun m!882221 () Bool)

(assert (=> bs!26693 m!882221))

(assert (=> b!949475 d!115079))

(declare-fun d!115081 () Bool)

(assert (=> d!115081 (contains!5219 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))) lt!427606)))

(declare-fun lt!427661 () Unit!31973)

(declare-fun choose!1583 (ListLongMap!12231 (_ BitVec 64) V!32601 (_ BitVec 64)) Unit!31973)

(assert (=> d!115081 (= lt!427661 (choose!1583 lt!427598 lt!427596 (zeroValue!5600 thiss!1141) lt!427606))))

(assert (=> d!115081 (contains!5219 lt!427598 lt!427606)))

(assert (=> d!115081 (= (addStillContains!578 lt!427598 lt!427596 (zeroValue!5600 thiss!1141) lt!427606) lt!427661)))

(declare-fun bs!26694 () Bool)

(assert (= bs!26694 d!115081))

(assert (=> bs!26694 m!882101))

(assert (=> bs!26694 m!882101))

(assert (=> bs!26694 m!882103))

(declare-fun m!882223 () Bool)

(assert (=> bs!26694 m!882223))

(declare-fun m!882225 () Bool)

(assert (=> bs!26694 m!882225))

(assert (=> b!949475 d!115081))

(declare-fun d!115083 () Bool)

(assert (=> d!115083 (= (apply!875 (+!2859 lt!427609 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))) lt!427589) (apply!875 lt!427609 lt!427589))))

(declare-fun lt!427662 () Unit!31973)

(assert (=> d!115083 (= lt!427662 (choose!1582 lt!427609 lt!427602 (minValue!5600 thiss!1141) lt!427589))))

(declare-fun e!534622 () Bool)

(assert (=> d!115083 e!534622))

(declare-fun res!636808 () Bool)

(assert (=> d!115083 (=> (not res!636808) (not e!534622))))

(assert (=> d!115083 (= res!636808 (contains!5219 lt!427609 lt!427589))))

(assert (=> d!115083 (= (addApplyDifferent!458 lt!427609 lt!427602 (minValue!5600 thiss!1141) lt!427589) lt!427662)))

(declare-fun b!949631 () Bool)

(assert (=> b!949631 (= e!534622 (not (= lt!427589 lt!427602)))))

(assert (= (and d!115083 res!636808) b!949631))

(assert (=> d!115083 m!882105))

(assert (=> d!115083 m!882111))

(declare-fun m!882227 () Bool)

(assert (=> d!115083 m!882227))

(assert (=> d!115083 m!882121))

(assert (=> d!115083 m!882105))

(declare-fun m!882229 () Bool)

(assert (=> d!115083 m!882229))

(assert (=> b!949475 d!115083))

(declare-fun d!115085 () Bool)

(declare-fun e!534625 () Bool)

(assert (=> d!115085 e!534625))

(declare-fun res!636813 () Bool)

(assert (=> d!115085 (=> (not res!636813) (not e!534625))))

(declare-fun lt!427673 () ListLongMap!12231)

(assert (=> d!115085 (= res!636813 (contains!5219 lt!427673 (_1!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))))))

(declare-fun lt!427671 () List!19326)

(assert (=> d!115085 (= lt!427673 (ListLongMap!12232 lt!427671))))

(declare-fun lt!427672 () Unit!31973)

(declare-fun lt!427674 () Unit!31973)

(assert (=> d!115085 (= lt!427672 lt!427674)))

(assert (=> d!115085 (= (getValueByKey!494 lt!427671 (_1!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!265 (List!19326 (_ BitVec 64) V!32601) Unit!31973)

(assert (=> d!115085 (= lt!427674 (lemmaContainsTupThenGetReturnValue!265 lt!427671 (_1!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))))))

(declare-fun insertStrictlySorted!322 (List!19326 (_ BitVec 64) V!32601) List!19326)

(assert (=> d!115085 (= lt!427671 (insertStrictlySorted!322 (toList!6131 lt!427597) (_1!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))))))

(assert (=> d!115085 (= (+!2859 lt!427597 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))) lt!427673)))

(declare-fun b!949636 () Bool)

(declare-fun res!636814 () Bool)

(assert (=> b!949636 (=> (not res!636814) (not e!534625))))

(assert (=> b!949636 (= res!636814 (= (getValueByKey!494 (toList!6131 lt!427673) (_1!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))))))))

(declare-fun b!949637 () Bool)

(declare-fun contains!5220 (List!19326 tuple2!13534) Bool)

(assert (=> b!949637 (= e!534625 (contains!5220 (toList!6131 lt!427673) (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))))))

(assert (= (and d!115085 res!636813) b!949636))

(assert (= (and b!949636 res!636814) b!949637))

(declare-fun m!882231 () Bool)

(assert (=> d!115085 m!882231))

(declare-fun m!882233 () Bool)

(assert (=> d!115085 m!882233))

(declare-fun m!882235 () Bool)

(assert (=> d!115085 m!882235))

(declare-fun m!882237 () Bool)

(assert (=> d!115085 m!882237))

(declare-fun m!882239 () Bool)

(assert (=> b!949636 m!882239))

(declare-fun m!882241 () Bool)

(assert (=> b!949637 m!882241))

(assert (=> b!949475 d!115085))

(declare-fun d!115087 () Bool)

(assert (=> d!115087 (= (apply!875 lt!427609 lt!427589) (get!14522 (getValueByKey!494 (toList!6131 lt!427609) lt!427589)))))

(declare-fun bs!26695 () Bool)

(assert (= bs!26695 d!115087))

(declare-fun m!882243 () Bool)

(assert (=> bs!26695 m!882243))

(assert (=> bs!26695 m!882243))

(declare-fun m!882245 () Bool)

(assert (=> bs!26695 m!882245))

(assert (=> b!949475 d!115087))

(declare-fun d!115089 () Bool)

(declare-fun e!534627 () Bool)

(assert (=> d!115089 e!534627))

(declare-fun res!636815 () Bool)

(assert (=> d!115089 (=> res!636815 e!534627)))

(declare-fun lt!427677 () Bool)

(assert (=> d!115089 (= res!636815 (not lt!427677))))

(declare-fun lt!427675 () Bool)

(assert (=> d!115089 (= lt!427677 lt!427675)))

(declare-fun lt!427676 () Unit!31973)

(declare-fun e!534626 () Unit!31973)

(assert (=> d!115089 (= lt!427676 e!534626)))

(declare-fun c!99125 () Bool)

(assert (=> d!115089 (= c!99125 lt!427675)))

(assert (=> d!115089 (= lt!427675 (containsKey!461 (toList!6131 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))) lt!427606))))

(assert (=> d!115089 (= (contains!5219 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))) lt!427606) lt!427677)))

(declare-fun b!949638 () Bool)

(declare-fun lt!427678 () Unit!31973)

(assert (=> b!949638 (= e!534626 lt!427678)))

(assert (=> b!949638 (= lt!427678 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6131 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))) lt!427606))))

(assert (=> b!949638 (isDefined!366 (getValueByKey!494 (toList!6131 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))) lt!427606))))

(declare-fun b!949639 () Bool)

(declare-fun Unit!31978 () Unit!31973)

(assert (=> b!949639 (= e!534626 Unit!31978)))

(declare-fun b!949640 () Bool)

(assert (=> b!949640 (= e!534627 (isDefined!366 (getValueByKey!494 (toList!6131 (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))) lt!427606)))))

(assert (= (and d!115089 c!99125) b!949638))

(assert (= (and d!115089 (not c!99125)) b!949639))

(assert (= (and d!115089 (not res!636815)) b!949640))

(declare-fun m!882247 () Bool)

(assert (=> d!115089 m!882247))

(declare-fun m!882249 () Bool)

(assert (=> b!949638 m!882249))

(declare-fun m!882251 () Bool)

(assert (=> b!949638 m!882251))

(assert (=> b!949638 m!882251))

(declare-fun m!882253 () Bool)

(assert (=> b!949638 m!882253))

(assert (=> b!949640 m!882251))

(assert (=> b!949640 m!882251))

(assert (=> b!949640 m!882253))

(assert (=> b!949475 d!115089))

(declare-fun d!115091 () Bool)

(assert (=> d!115091 (= (apply!875 lt!427597 lt!427607) (get!14522 (getValueByKey!494 (toList!6131 lt!427597) lt!427607)))))

(declare-fun bs!26696 () Bool)

(assert (= bs!26696 d!115091))

(declare-fun m!882255 () Bool)

(assert (=> bs!26696 m!882255))

(assert (=> bs!26696 m!882255))

(declare-fun m!882257 () Bool)

(assert (=> bs!26696 m!882257))

(assert (=> b!949475 d!115091))

(declare-fun d!115093 () Bool)

(assert (=> d!115093 (= (apply!875 (+!2859 lt!427609 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))) lt!427589) (get!14522 (getValueByKey!494 (toList!6131 (+!2859 lt!427609 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))) lt!427589)))))

(declare-fun bs!26697 () Bool)

(assert (= bs!26697 d!115093))

(declare-fun m!882259 () Bool)

(assert (=> bs!26697 m!882259))

(assert (=> bs!26697 m!882259))

(declare-fun m!882261 () Bool)

(assert (=> bs!26697 m!882261))

(assert (=> b!949475 d!115093))

(declare-fun d!115095 () Bool)

(declare-fun e!534628 () Bool)

(assert (=> d!115095 e!534628))

(declare-fun res!636816 () Bool)

(assert (=> d!115095 (=> (not res!636816) (not e!534628))))

(declare-fun lt!427681 () ListLongMap!12231)

(assert (=> d!115095 (= res!636816 (contains!5219 lt!427681 (_1!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))))))

(declare-fun lt!427679 () List!19326)

(assert (=> d!115095 (= lt!427681 (ListLongMap!12232 lt!427679))))

(declare-fun lt!427680 () Unit!31973)

(declare-fun lt!427682 () Unit!31973)

(assert (=> d!115095 (= lt!427680 lt!427682)))

(assert (=> d!115095 (= (getValueByKey!494 lt!427679 (_1!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))))))

(assert (=> d!115095 (= lt!427682 (lemmaContainsTupThenGetReturnValue!265 lt!427679 (_1!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))))))

(assert (=> d!115095 (= lt!427679 (insertStrictlySorted!322 (toList!6131 lt!427590) (_1!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))))))

(assert (=> d!115095 (= (+!2859 lt!427590 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))) lt!427681)))

(declare-fun b!949641 () Bool)

(declare-fun res!636817 () Bool)

(assert (=> b!949641 (=> (not res!636817) (not e!534628))))

(assert (=> b!949641 (= res!636817 (= (getValueByKey!494 (toList!6131 lt!427681) (_1!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))))))))

(declare-fun b!949642 () Bool)

(assert (=> b!949642 (= e!534628 (contains!5220 (toList!6131 lt!427681) (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))))))

(assert (= (and d!115095 res!636816) b!949641))

(assert (= (and b!949641 res!636817) b!949642))

(declare-fun m!882263 () Bool)

(assert (=> d!115095 m!882263))

(declare-fun m!882265 () Bool)

(assert (=> d!115095 m!882265))

(declare-fun m!882267 () Bool)

(assert (=> d!115095 m!882267))

(declare-fun m!882269 () Bool)

(assert (=> d!115095 m!882269))

(declare-fun m!882271 () Bool)

(assert (=> b!949641 m!882271))

(declare-fun m!882273 () Bool)

(assert (=> b!949642 m!882273))

(assert (=> b!949475 d!115095))

(declare-fun d!115097 () Bool)

(assert (=> d!115097 (= (apply!875 (+!2859 lt!427590 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141))) lt!427603) (get!14522 (getValueByKey!494 (toList!6131 (+!2859 lt!427590 (tuple2!13535 lt!427604 (zeroValue!5600 thiss!1141)))) lt!427603)))))

(declare-fun bs!26698 () Bool)

(assert (= bs!26698 d!115097))

(declare-fun m!882275 () Bool)

(assert (=> bs!26698 m!882275))

(assert (=> bs!26698 m!882275))

(declare-fun m!882277 () Bool)

(assert (=> bs!26698 m!882277))

(assert (=> b!949475 d!115097))

(declare-fun d!115099 () Bool)

(assert (=> d!115099 (= (apply!875 (+!2859 lt!427597 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))) lt!427607) (apply!875 lt!427597 lt!427607))))

(declare-fun lt!427683 () Unit!31973)

(assert (=> d!115099 (= lt!427683 (choose!1582 lt!427597 lt!427591 (minValue!5600 thiss!1141) lt!427607))))

(declare-fun e!534629 () Bool)

(assert (=> d!115099 e!534629))

(declare-fun res!636818 () Bool)

(assert (=> d!115099 (=> (not res!636818) (not e!534629))))

(assert (=> d!115099 (= res!636818 (contains!5219 lt!427597 lt!427607))))

(assert (=> d!115099 (= (addApplyDifferent!458 lt!427597 lt!427591 (minValue!5600 thiss!1141) lt!427607) lt!427683)))

(declare-fun b!949643 () Bool)

(assert (=> b!949643 (= e!534629 (not (= lt!427607 lt!427591)))))

(assert (= (and d!115099 res!636818) b!949643))

(assert (=> d!115099 m!882113))

(assert (=> d!115099 m!882125))

(declare-fun m!882279 () Bool)

(assert (=> d!115099 m!882279))

(assert (=> d!115099 m!882127))

(assert (=> d!115099 m!882113))

(declare-fun m!882281 () Bool)

(assert (=> d!115099 m!882281))

(assert (=> b!949475 d!115099))

(declare-fun d!115101 () Bool)

(declare-fun e!534630 () Bool)

(assert (=> d!115101 e!534630))

(declare-fun res!636819 () Bool)

(assert (=> d!115101 (=> (not res!636819) (not e!534630))))

(declare-fun lt!427686 () ListLongMap!12231)

(assert (=> d!115101 (= res!636819 (contains!5219 lt!427686 (_1!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))))))

(declare-fun lt!427684 () List!19326)

(assert (=> d!115101 (= lt!427686 (ListLongMap!12232 lt!427684))))

(declare-fun lt!427685 () Unit!31973)

(declare-fun lt!427687 () Unit!31973)

(assert (=> d!115101 (= lt!427685 lt!427687)))

(assert (=> d!115101 (= (getValueByKey!494 lt!427684 (_1!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))))))

(assert (=> d!115101 (= lt!427687 (lemmaContainsTupThenGetReturnValue!265 lt!427684 (_1!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))))))

(assert (=> d!115101 (= lt!427684 (insertStrictlySorted!322 (toList!6131 lt!427609) (_1!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))))))

(assert (=> d!115101 (= (+!2859 lt!427609 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))) lt!427686)))

(declare-fun b!949644 () Bool)

(declare-fun res!636820 () Bool)

(assert (=> b!949644 (=> (not res!636820) (not e!534630))))

(assert (=> b!949644 (= res!636820 (= (getValueByKey!494 (toList!6131 lt!427686) (_1!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))))))))

(declare-fun b!949645 () Bool)

(assert (=> b!949645 (= e!534630 (contains!5220 (toList!6131 lt!427686) (tuple2!13535 lt!427602 (minValue!5600 thiss!1141))))))

(assert (= (and d!115101 res!636819) b!949644))

(assert (= (and b!949644 res!636820) b!949645))

(declare-fun m!882283 () Bool)

(assert (=> d!115101 m!882283))

(declare-fun m!882285 () Bool)

(assert (=> d!115101 m!882285))

(declare-fun m!882287 () Bool)

(assert (=> d!115101 m!882287))

(declare-fun m!882289 () Bool)

(assert (=> d!115101 m!882289))

(declare-fun m!882291 () Bool)

(assert (=> b!949644 m!882291))

(declare-fun m!882293 () Bool)

(assert (=> b!949645 m!882293))

(assert (=> b!949475 d!115101))

(assert (=> b!949475 d!115061))

(declare-fun d!115103 () Bool)

(assert (=> d!115103 (= (apply!875 (+!2859 lt!427597 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141))) lt!427607) (get!14522 (getValueByKey!494 (toList!6131 (+!2859 lt!427597 (tuple2!13535 lt!427591 (minValue!5600 thiss!1141)))) lt!427607)))))

(declare-fun bs!26699 () Bool)

(assert (= bs!26699 d!115103))

(declare-fun m!882295 () Bool)

(assert (=> bs!26699 m!882295))

(assert (=> bs!26699 m!882295))

(declare-fun m!882297 () Bool)

(assert (=> bs!26699 m!882297))

(assert (=> b!949475 d!115103))

(declare-fun d!115105 () Bool)

(declare-fun e!534631 () Bool)

(assert (=> d!115105 e!534631))

(declare-fun res!636821 () Bool)

(assert (=> d!115105 (=> (not res!636821) (not e!534631))))

(declare-fun lt!427690 () ListLongMap!12231)

(assert (=> d!115105 (= res!636821 (contains!5219 lt!427690 (_1!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))))))

(declare-fun lt!427688 () List!19326)

(assert (=> d!115105 (= lt!427690 (ListLongMap!12232 lt!427688))))

(declare-fun lt!427689 () Unit!31973)

(declare-fun lt!427691 () Unit!31973)

(assert (=> d!115105 (= lt!427689 lt!427691)))

(assert (=> d!115105 (= (getValueByKey!494 lt!427688 (_1!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))))))

(assert (=> d!115105 (= lt!427691 (lemmaContainsTupThenGetReturnValue!265 lt!427688 (_1!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))))))

(assert (=> d!115105 (= lt!427688 (insertStrictlySorted!322 (toList!6131 lt!427598) (_1!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))))))

(assert (=> d!115105 (= (+!2859 lt!427598 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))) lt!427690)))

(declare-fun b!949646 () Bool)

(declare-fun res!636822 () Bool)

(assert (=> b!949646 (=> (not res!636822) (not e!534631))))

(assert (=> b!949646 (= res!636822 (= (getValueByKey!494 (toList!6131 lt!427690) (_1!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))))))))

(declare-fun b!949647 () Bool)

(assert (=> b!949647 (= e!534631 (contains!5220 (toList!6131 lt!427690) (tuple2!13535 lt!427596 (zeroValue!5600 thiss!1141))))))

(assert (= (and d!115105 res!636821) b!949646))

(assert (= (and b!949646 res!636822) b!949647))

(declare-fun m!882299 () Bool)

(assert (=> d!115105 m!882299))

(declare-fun m!882301 () Bool)

(assert (=> d!115105 m!882301))

(declare-fun m!882303 () Bool)

(assert (=> d!115105 m!882303))

(declare-fun m!882305 () Bool)

(assert (=> d!115105 m!882305))

(declare-fun m!882307 () Bool)

(assert (=> b!949646 m!882307))

(declare-fun m!882309 () Bool)

(assert (=> b!949647 m!882309))

(assert (=> b!949475 d!115105))

(declare-fun bm!41310 () Bool)

(declare-fun call!41313 () Bool)

(declare-fun c!99128 () Bool)

(assert (=> bm!41310 (= call!41313 (arrayNoDuplicates!0 (_keys!10692 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99128 (Cons!19323 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000) Nil!19324) Nil!19324)))))

(declare-fun b!949658 () Bool)

(declare-fun e!534640 () Bool)

(declare-fun contains!5221 (List!19327 (_ BitVec 64)) Bool)

(assert (=> b!949658 (= e!534640 (contains!5221 Nil!19324 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949659 () Bool)

(declare-fun e!534642 () Bool)

(assert (=> b!949659 (= e!534642 call!41313)))

(declare-fun b!949660 () Bool)

(assert (=> b!949660 (= e!534642 call!41313)))

(declare-fun b!949661 () Bool)

(declare-fun e!534643 () Bool)

(assert (=> b!949661 (= e!534643 e!534642)))

(assert (=> b!949661 (= c!99128 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949662 () Bool)

(declare-fun e!534641 () Bool)

(assert (=> b!949662 (= e!534641 e!534643)))

(declare-fun res!636831 () Bool)

(assert (=> b!949662 (=> (not res!636831) (not e!534643))))

(assert (=> b!949662 (= res!636831 (not e!534640))))

(declare-fun res!636829 () Bool)

(assert (=> b!949662 (=> (not res!636829) (not e!534640))))

(assert (=> b!949662 (= res!636829 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115107 () Bool)

(declare-fun res!636830 () Bool)

(assert (=> d!115107 (=> res!636830 e!534641)))

(assert (=> d!115107 (= res!636830 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> d!115107 (= (arrayNoDuplicates!0 (_keys!10692 thiss!1141) #b00000000000000000000000000000000 Nil!19324) e!534641)))

(assert (= (and d!115107 (not res!636830)) b!949662))

(assert (= (and b!949662 res!636829) b!949658))

(assert (= (and b!949662 res!636831) b!949661))

(assert (= (and b!949661 c!99128) b!949659))

(assert (= (and b!949661 (not c!99128)) b!949660))

(assert (= (or b!949659 b!949660) bm!41310))

(assert (=> bm!41310 m!882075))

(declare-fun m!882311 () Bool)

(assert (=> bm!41310 m!882311))

(assert (=> b!949658 m!882075))

(assert (=> b!949658 m!882075))

(declare-fun m!882313 () Bool)

(assert (=> b!949658 m!882313))

(assert (=> b!949661 m!882075))

(assert (=> b!949661 m!882075))

(assert (=> b!949661 m!882087))

(assert (=> b!949662 m!882075))

(assert (=> b!949662 m!882075))

(assert (=> b!949662 m!882087))

(assert (=> b!949503 d!115107))

(assert (=> b!949486 d!115069))

(declare-fun d!115109 () Bool)

(declare-fun e!534644 () Bool)

(assert (=> d!115109 e!534644))

(declare-fun res!636832 () Bool)

(assert (=> d!115109 (=> (not res!636832) (not e!534644))))

(declare-fun lt!427694 () ListLongMap!12231)

(assert (=> d!115109 (= res!636832 (contains!5219 lt!427694 (_1!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))))

(declare-fun lt!427692 () List!19326)

(assert (=> d!115109 (= lt!427694 (ListLongMap!12232 lt!427692))))

(declare-fun lt!427693 () Unit!31973)

(declare-fun lt!427695 () Unit!31973)

(assert (=> d!115109 (= lt!427693 lt!427695)))

(assert (=> d!115109 (= (getValueByKey!494 lt!427692 (_1!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))) (Some!499 (_2!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))))

(assert (=> d!115109 (= lt!427695 (lemmaContainsTupThenGetReturnValue!265 lt!427692 (_1!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))) (_2!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))))

(assert (=> d!115109 (= lt!427692 (insertStrictlySorted!322 (toList!6131 (ite c!99081 call!41301 (ite c!99084 call!41307 call!41305))) (_1!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))) (_2!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))))

(assert (=> d!115109 (= (+!2859 (ite c!99081 call!41301 (ite c!99084 call!41307 call!41305)) (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))) lt!427694)))

(declare-fun b!949663 () Bool)

(declare-fun res!636833 () Bool)

(assert (=> b!949663 (=> (not res!636833) (not e!534644))))

(assert (=> b!949663 (= res!636833 (= (getValueByKey!494 (toList!6131 lt!427694) (_1!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))) (Some!499 (_2!6778 (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))))

(declare-fun b!949664 () Bool)

(assert (=> b!949664 (= e!534644 (contains!5220 (toList!6131 lt!427694) (ite (or c!99081 c!99084) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5600 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))

(assert (= (and d!115109 res!636832) b!949663))

(assert (= (and b!949663 res!636833) b!949664))

(declare-fun m!882315 () Bool)

(assert (=> d!115109 m!882315))

(declare-fun m!882317 () Bool)

(assert (=> d!115109 m!882317))

(declare-fun m!882319 () Bool)

(assert (=> d!115109 m!882319))

(declare-fun m!882321 () Bool)

(assert (=> d!115109 m!882321))

(declare-fun m!882323 () Bool)

(assert (=> b!949663 m!882323))

(declare-fun m!882325 () Bool)

(assert (=> b!949664 m!882325))

(assert (=> bm!41300 d!115109))

(declare-fun b!949673 () Bool)

(declare-fun e!534653 () Bool)

(declare-fun call!41316 () Bool)

(assert (=> b!949673 (= e!534653 call!41316)))

(declare-fun b!949674 () Bool)

(declare-fun e!534652 () Bool)

(assert (=> b!949674 (= e!534653 e!534652)))

(declare-fun lt!427704 () (_ BitVec 64))

(assert (=> b!949674 (= lt!427704 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427702 () Unit!31973)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57468 (_ BitVec 64) (_ BitVec 32)) Unit!31973)

(assert (=> b!949674 (= lt!427702 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10692 thiss!1141) lt!427704 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949674 (arrayContainsKey!0 (_keys!10692 thiss!1141) lt!427704 #b00000000000000000000000000000000)))

(declare-fun lt!427703 () Unit!31973)

(assert (=> b!949674 (= lt!427703 lt!427702)))

(declare-fun res!636839 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57468 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!949674 (= res!636839 (= (seekEntryOrOpen!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000) (_keys!10692 thiss!1141) (mask!27544 thiss!1141)) (Found!9132 #b00000000000000000000000000000000)))))

(assert (=> b!949674 (=> (not res!636839) (not e!534652))))

(declare-fun b!949675 () Bool)

(declare-fun e!534651 () Bool)

(assert (=> b!949675 (= e!534651 e!534653)))

(declare-fun c!99131 () Bool)

(assert (=> b!949675 (= c!99131 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115111 () Bool)

(declare-fun res!636838 () Bool)

(assert (=> d!115111 (=> res!636838 e!534651)))

(assert (=> d!115111 (= res!636838 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> d!115111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)) e!534651)))

(declare-fun bm!41313 () Bool)

(assert (=> bm!41313 (= call!41316 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))

(declare-fun b!949676 () Bool)

(assert (=> b!949676 (= e!534652 call!41316)))

(assert (= (and d!115111 (not res!636838)) b!949675))

(assert (= (and b!949675 c!99131) b!949674))

(assert (= (and b!949675 (not c!99131)) b!949673))

(assert (= (and b!949674 res!636839) b!949676))

(assert (= (or b!949676 b!949673) bm!41313))

(assert (=> b!949674 m!882075))

(declare-fun m!882327 () Bool)

(assert (=> b!949674 m!882327))

(declare-fun m!882329 () Bool)

(assert (=> b!949674 m!882329))

(assert (=> b!949674 m!882075))

(declare-fun m!882331 () Bool)

(assert (=> b!949674 m!882331))

(assert (=> b!949675 m!882075))

(assert (=> b!949675 m!882075))

(assert (=> b!949675 m!882087))

(declare-fun m!882333 () Bool)

(assert (=> bm!41313 m!882333))

(assert (=> b!949502 d!115111))

(declare-fun b!949695 () Bool)

(declare-fun lt!427709 () SeekEntryResult!9132)

(assert (=> b!949695 (and (bvsge (index!38901 lt!427709) #b00000000000000000000000000000000) (bvslt (index!38901 lt!427709) (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun res!636846 () Bool)

(assert (=> b!949695 (= res!636846 (= (select (arr!27637 (_keys!10692 thiss!1141)) (index!38901 lt!427709)) key!756))))

(declare-fun e!534664 () Bool)

(assert (=> b!949695 (=> res!636846 e!534664)))

(declare-fun e!534666 () Bool)

(assert (=> b!949695 (= e!534666 e!534664)))

(declare-fun b!949696 () Bool)

(declare-fun e!534667 () Bool)

(assert (=> b!949696 (= e!534667 (bvsge (x!81680 lt!427709) #b01111111111111111111111111111110))))

(declare-fun d!115113 () Bool)

(assert (=> d!115113 e!534667))

(declare-fun c!99138 () Bool)

(assert (=> d!115113 (= c!99138 (and ((_ is Intermediate!9132) lt!427709) (undefined!9944 lt!427709)))))

(declare-fun e!534668 () SeekEntryResult!9132)

(assert (=> d!115113 (= lt!427709 e!534668)))

(declare-fun c!99139 () Bool)

(assert (=> d!115113 (= c!99139 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!427710 () (_ BitVec 64))

(assert (=> d!115113 (= lt!427710 (select (arr!27637 (_keys!10692 thiss!1141)) (toIndex!0 key!756 (mask!27544 thiss!1141))))))

(assert (=> d!115113 (validMask!0 (mask!27544 thiss!1141))))

(assert (=> d!115113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27544 thiss!1141)) key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)) lt!427709)))

(declare-fun b!949697 () Bool)

(declare-fun e!534665 () SeekEntryResult!9132)

(assert (=> b!949697 (= e!534668 e!534665)))

(declare-fun c!99140 () Bool)

(assert (=> b!949697 (= c!99140 (or (= lt!427710 key!756) (= (bvadd lt!427710 lt!427710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949698 () Bool)

(assert (=> b!949698 (and (bvsge (index!38901 lt!427709) #b00000000000000000000000000000000) (bvslt (index!38901 lt!427709) (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun res!636847 () Bool)

(assert (=> b!949698 (= res!636847 (= (select (arr!27637 (_keys!10692 thiss!1141)) (index!38901 lt!427709)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949698 (=> res!636847 e!534664)))

(declare-fun b!949699 () Bool)

(assert (=> b!949699 (= e!534665 (Intermediate!9132 false (toIndex!0 key!756 (mask!27544 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949700 () Bool)

(assert (=> b!949700 (and (bvsge (index!38901 lt!427709) #b00000000000000000000000000000000) (bvslt (index!38901 lt!427709) (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> b!949700 (= e!534664 (= (select (arr!27637 (_keys!10692 thiss!1141)) (index!38901 lt!427709)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949701 () Bool)

(assert (=> b!949701 (= e!534668 (Intermediate!9132 true (toIndex!0 key!756 (mask!27544 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949702 () Bool)

(assert (=> b!949702 (= e!534667 e!534666)))

(declare-fun res!636848 () Bool)

(assert (=> b!949702 (= res!636848 (and ((_ is Intermediate!9132) lt!427709) (not (undefined!9944 lt!427709)) (bvslt (x!81680 lt!427709) #b01111111111111111111111111111110) (bvsge (x!81680 lt!427709) #b00000000000000000000000000000000) (bvsge (x!81680 lt!427709) #b00000000000000000000000000000000)))))

(assert (=> b!949702 (=> (not res!636848) (not e!534666))))

(declare-fun b!949703 () Bool)

(assert (=> b!949703 (= e!534665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27544 thiss!1141)) #b00000000000000000000000000000000 (mask!27544 thiss!1141)) key!756 (_keys!10692 thiss!1141) (mask!27544 thiss!1141)))))

(assert (= (and d!115113 c!99139) b!949701))

(assert (= (and d!115113 (not c!99139)) b!949697))

(assert (= (and b!949697 c!99140) b!949699))

(assert (= (and b!949697 (not c!99140)) b!949703))

(assert (= (and d!115113 c!99138) b!949696))

(assert (= (and d!115113 (not c!99138)) b!949702))

(assert (= (and b!949702 res!636848) b!949695))

(assert (= (and b!949695 (not res!636846)) b!949698))

(assert (= (and b!949698 (not res!636847)) b!949700))

(assert (=> b!949703 m!882145))

(declare-fun m!882335 () Bool)

(assert (=> b!949703 m!882335))

(assert (=> b!949703 m!882335))

(declare-fun m!882337 () Bool)

(assert (=> b!949703 m!882337))

(declare-fun m!882339 () Bool)

(assert (=> b!949695 m!882339))

(assert (=> b!949700 m!882339))

(assert (=> d!115113 m!882145))

(declare-fun m!882341 () Bool)

(assert (=> d!115113 m!882341))

(assert (=> d!115113 m!882035))

(assert (=> b!949698 m!882339))

(assert (=> d!115049 d!115113))

(declare-fun d!115115 () Bool)

(declare-fun lt!427716 () (_ BitVec 32))

(declare-fun lt!427715 () (_ BitVec 32))

(assert (=> d!115115 (= lt!427716 (bvmul (bvxor lt!427715 (bvlshr lt!427715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115115 (= lt!427715 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115115 (and (bvsge (mask!27544 thiss!1141) #b00000000000000000000000000000000) (let ((res!636849 (let ((h!20483 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81698 (bvmul (bvxor h!20483 (bvlshr h!20483 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81698 (bvlshr x!81698 #b00000000000000000000000000001101)) (mask!27544 thiss!1141)))))) (and (bvslt res!636849 (bvadd (mask!27544 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636849 #b00000000000000000000000000000000))))))

(assert (=> d!115115 (= (toIndex!0 key!756 (mask!27544 thiss!1141)) (bvand (bvxor lt!427716 (bvlshr lt!427716 #b00000000000000000000000000001101)) (mask!27544 thiss!1141)))))

(assert (=> d!115049 d!115115))

(assert (=> d!115049 d!115037))

(declare-fun d!115117 () Bool)

(declare-fun e!534669 () Bool)

(assert (=> d!115117 e!534669))

(declare-fun res!636850 () Bool)

(assert (=> d!115117 (=> (not res!636850) (not e!534669))))

(declare-fun lt!427719 () ListLongMap!12231)

(assert (=> d!115117 (= res!636850 (contains!5219 lt!427719 (_1!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))

(declare-fun lt!427717 () List!19326)

(assert (=> d!115117 (= lt!427719 (ListLongMap!12232 lt!427717))))

(declare-fun lt!427718 () Unit!31973)

(declare-fun lt!427720 () Unit!31973)

(assert (=> d!115117 (= lt!427718 lt!427720)))

(assert (=> d!115117 (= (getValueByKey!494 lt!427717 (_1!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))

(assert (=> d!115117 (= lt!427720 (lemmaContainsTupThenGetReturnValue!265 lt!427717 (_1!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))

(assert (=> d!115117 (= lt!427717 (insertStrictlySorted!322 (toList!6131 call!41303) (_1!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))) (_2!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))))))

(assert (=> d!115117 (= (+!2859 call!41303 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))) lt!427719)))

(declare-fun b!949704 () Bool)

(declare-fun res!636851 () Bool)

(assert (=> b!949704 (=> (not res!636851) (not e!534669))))

(assert (=> b!949704 (= res!636851 (= (getValueByKey!494 (toList!6131 lt!427719) (_1!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141)))) (Some!499 (_2!6778 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))))

(declare-fun b!949705 () Bool)

(assert (=> b!949705 (= e!534669 (contains!5220 (toList!6131 lt!427719) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5600 thiss!1141))))))

(assert (= (and d!115117 res!636850) b!949704))

(assert (= (and b!949704 res!636851) b!949705))

(declare-fun m!882343 () Bool)

(assert (=> d!115117 m!882343))

(declare-fun m!882345 () Bool)

(assert (=> d!115117 m!882345))

(declare-fun m!882347 () Bool)

(assert (=> d!115117 m!882347))

(declare-fun m!882349 () Bool)

(assert (=> d!115117 m!882349))

(declare-fun m!882351 () Bool)

(assert (=> b!949704 m!882351))

(declare-fun m!882353 () Bool)

(assert (=> b!949705 m!882353))

(assert (=> b!949478 d!115117))

(declare-fun bm!41316 () Bool)

(declare-fun call!41319 () (_ BitVec 32))

(assert (=> bm!41316 (= call!41319 (arrayCountValidKeys!0 (_keys!10692 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28113 (_keys!10692 thiss!1141))))))

(declare-fun d!115119 () Bool)

(declare-fun lt!427723 () (_ BitVec 32))

(assert (=> d!115119 (and (bvsge lt!427723 #b00000000000000000000000000000000) (bvsle lt!427723 (bvsub (size!28113 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534674 () (_ BitVec 32))

(assert (=> d!115119 (= lt!427723 e!534674)))

(declare-fun c!99146 () Bool)

(assert (=> d!115119 (= c!99146 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> d!115119 (and (bvsle #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28113 (_keys!10692 thiss!1141)) (size!28113 (_keys!10692 thiss!1141))))))

(assert (=> d!115119 (= (arrayCountValidKeys!0 (_keys!10692 thiss!1141) #b00000000000000000000000000000000 (size!28113 (_keys!10692 thiss!1141))) lt!427723)))

(declare-fun b!949714 () Bool)

(declare-fun e!534675 () (_ BitVec 32))

(assert (=> b!949714 (= e!534675 (bvadd #b00000000000000000000000000000001 call!41319))))

(declare-fun b!949715 () Bool)

(assert (=> b!949715 (= e!534674 e!534675)))

(declare-fun c!99145 () Bool)

(assert (=> b!949715 (= c!99145 (validKeyInArray!0 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949716 () Bool)

(assert (=> b!949716 (= e!534675 call!41319)))

(declare-fun b!949717 () Bool)

(assert (=> b!949717 (= e!534674 #b00000000000000000000000000000000)))

(assert (= (and d!115119 c!99146) b!949717))

(assert (= (and d!115119 (not c!99146)) b!949715))

(assert (= (and b!949715 c!99145) b!949714))

(assert (= (and b!949715 (not c!99145)) b!949716))

(assert (= (or b!949714 b!949716) bm!41316))

(declare-fun m!882355 () Bool)

(assert (=> bm!41316 m!882355))

(assert (=> b!949715 m!882075))

(assert (=> b!949715 m!882075))

(assert (=> b!949715 m!882087))

(assert (=> b!949501 d!115119))

(assert (=> b!949429 d!115057))

(assert (=> b!949429 d!115059))

(declare-fun d!115121 () Bool)

(declare-fun e!534677 () Bool)

(assert (=> d!115121 e!534677))

(declare-fun res!636852 () Bool)

(assert (=> d!115121 (=> res!636852 e!534677)))

(declare-fun lt!427726 () Bool)

(assert (=> d!115121 (= res!636852 (not lt!427726))))

(declare-fun lt!427724 () Bool)

(assert (=> d!115121 (= lt!427726 lt!427724)))

(declare-fun lt!427725 () Unit!31973)

(declare-fun e!534676 () Unit!31973)

(assert (=> d!115121 (= lt!427725 e!534676)))

(declare-fun c!99147 () Bool)

(assert (=> d!115121 (= c!99147 lt!427724)))

(assert (=> d!115121 (= lt!427724 (containsKey!461 (toList!6131 lt!427608) (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115121 (= (contains!5219 lt!427608 (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)) lt!427726)))

(declare-fun b!949718 () Bool)

(declare-fun lt!427727 () Unit!31973)

(assert (=> b!949718 (= e!534676 lt!427727)))

(assert (=> b!949718 (= lt!427727 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6131 lt!427608) (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949718 (isDefined!366 (getValueByKey!494 (toList!6131 lt!427608) (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949719 () Bool)

(declare-fun Unit!31979 () Unit!31973)

(assert (=> b!949719 (= e!534676 Unit!31979)))

(declare-fun b!949720 () Bool)

(assert (=> b!949720 (= e!534677 (isDefined!366 (getValueByKey!494 (toList!6131 lt!427608) (select (arr!27637 (_keys!10692 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115121 c!99147) b!949718))

(assert (= (and d!115121 (not c!99147)) b!949719))

(assert (= (and d!115121 (not res!636852)) b!949720))

(assert (=> d!115121 m!882075))

(declare-fun m!882357 () Bool)

(assert (=> d!115121 m!882357))

(assert (=> b!949718 m!882075))

(declare-fun m!882359 () Bool)

(assert (=> b!949718 m!882359))

(assert (=> b!949718 m!882075))

(assert (=> b!949718 m!882153))

(assert (=> b!949718 m!882153))

(declare-fun m!882361 () Bool)

(assert (=> b!949718 m!882361))

(assert (=> b!949720 m!882075))

(assert (=> b!949720 m!882153))

(assert (=> b!949720 m!882153))

(assert (=> b!949720 m!882361))

(assert (=> b!949489 d!115121))

(declare-fun d!115123 () Bool)

(declare-fun e!534679 () Bool)

(assert (=> d!115123 e!534679))

(declare-fun res!636853 () Bool)

(assert (=> d!115123 (=> res!636853 e!534679)))

(declare-fun lt!427730 () Bool)

(assert (=> d!115123 (= res!636853 (not lt!427730))))

(declare-fun lt!427728 () Bool)

(assert (=> d!115123 (= lt!427730 lt!427728)))

(declare-fun lt!427729 () Unit!31973)

(declare-fun e!534678 () Unit!31973)

(assert (=> d!115123 (= lt!427729 e!534678)))

(declare-fun c!99148 () Bool)

(assert (=> d!115123 (= c!99148 lt!427728)))

(assert (=> d!115123 (= lt!427728 (containsKey!461 (toList!6131 lt!427608) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115123 (= (contains!5219 lt!427608 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427730)))

(declare-fun b!949721 () Bool)

(declare-fun lt!427731 () Unit!31973)

(assert (=> b!949721 (= e!534678 lt!427731)))

(assert (=> b!949721 (= lt!427731 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6131 lt!427608) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949721 (isDefined!366 (getValueByKey!494 (toList!6131 lt!427608) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949722 () Bool)

(declare-fun Unit!31980 () Unit!31973)

(assert (=> b!949722 (= e!534678 Unit!31980)))

(declare-fun b!949723 () Bool)

(assert (=> b!949723 (= e!534679 (isDefined!366 (getValueByKey!494 (toList!6131 lt!427608) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115123 c!99148) b!949721))

(assert (= (and d!115123 (not c!99148)) b!949722))

(assert (= (and d!115123 (not res!636853)) b!949723))

(declare-fun m!882363 () Bool)

(assert (=> d!115123 m!882363))

(declare-fun m!882365 () Bool)

(assert (=> b!949721 m!882365))

(assert (=> b!949721 m!882193))

(assert (=> b!949721 m!882193))

(declare-fun m!882367 () Bool)

(assert (=> b!949721 m!882367))

(assert (=> b!949723 m!882193))

(assert (=> b!949723 m!882193))

(assert (=> b!949723 m!882367))

(assert (=> bm!41298 d!115123))

(declare-fun b!949725 () Bool)

(declare-fun e!534681 () Bool)

(assert (=> b!949725 (= e!534681 tp_is_empty!20727)))

(declare-fun condMapEmpty!32999 () Bool)

(declare-fun mapDefault!32999 () ValueCell!9882)

(assert (=> mapNonEmpty!32998 (= condMapEmpty!32999 (= mapRest!32998 ((as const (Array (_ BitVec 32) ValueCell!9882)) mapDefault!32999)))))

(declare-fun mapRes!32999 () Bool)

(assert (=> mapNonEmpty!32998 (= tp!63252 (and e!534681 mapRes!32999))))

(declare-fun b!949724 () Bool)

(declare-fun e!534680 () Bool)

(assert (=> b!949724 (= e!534680 tp_is_empty!20727)))

(declare-fun mapNonEmpty!32999 () Bool)

(declare-fun tp!63253 () Bool)

(assert (=> mapNonEmpty!32999 (= mapRes!32999 (and tp!63253 e!534680))))

(declare-fun mapKey!32999 () (_ BitVec 32))

(declare-fun mapRest!32999 () (Array (_ BitVec 32) ValueCell!9882))

(declare-fun mapValue!32999 () ValueCell!9882)

(assert (=> mapNonEmpty!32999 (= mapRest!32998 (store mapRest!32999 mapKey!32999 mapValue!32999))))

(declare-fun mapIsEmpty!32999 () Bool)

(assert (=> mapIsEmpty!32999 mapRes!32999))

(assert (= (and mapNonEmpty!32998 condMapEmpty!32999) mapIsEmpty!32999))

(assert (= (and mapNonEmpty!32998 (not condMapEmpty!32999)) mapNonEmpty!32999))

(assert (= (and mapNonEmpty!32999 ((_ is ValueCellFull!9882) mapValue!32999)) b!949724))

(assert (= (and mapNonEmpty!32998 ((_ is ValueCellFull!9882) mapDefault!32999)) b!949725))

(declare-fun m!882369 () Bool)

(assert (=> mapNonEmpty!32999 m!882369))

(declare-fun b_lambda!14355 () Bool)

(assert (= b_lambda!14351 (or (and b!949389 b_free!18219) b_lambda!14355)))

(declare-fun b_lambda!14357 () Bool)

(assert (= b_lambda!14353 (or (and b!949389 b_free!18219) b_lambda!14357)))

(check-sat (not b!949623) (not d!115065) (not b!949664) (not b!949581) (not d!115073) (not b!949647) (not b!949549) (not b_next!18219) (not d!115077) (not b!949715) (not d!115057) (not b_lambda!14355) (not d!115103) tp_is_empty!20727 (not d!115079) (not d!115105) (not d!115101) (not b!949538) (not d!115091) (not b!949576) (not b!949597) (not b!949640) (not d!115099) (not b!949638) (not d!115055) (not b!949604) (not b!949663) (not b!949582) (not d!115063) (not b!949575) (not b!949723) (not b!949705) (not b!949658) (not b!949642) (not b!949641) (not d!115085) (not d!115097) (not b!949577) (not b!949662) (not d!115093) (not d!115087) (not d!115075) (not b!949586) (not b!949636) (not d!115095) (not d!115089) (not d!115081) (not b!949618) (not b!949534) (not b!949535) (not b!949583) (not bm!41307) (not b!949704) (not b!949721) (not b!949661) (not b!949720) (not b!949578) (not mapNonEmpty!32999) (not b_lambda!14357) (not bm!41316) (not d!115061) b_and!29673 (not b!949703) (not b!949637) (not d!115121) (not b!949718) (not bm!41313) (not d!115113) (not b_lambda!14349) (not b!949596) (not d!115067) (not b!949625) (not bm!41310) (not b!949674) (not d!115123) (not d!115051) (not d!115117) (not d!115083) (not b!949645) (not d!115109) (not b!949644) (not b!949675) (not b!949646))
(check-sat b_and!29673 (not b_next!18219))
