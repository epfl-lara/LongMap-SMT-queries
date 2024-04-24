; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81544 () Bool)

(assert start!81544)

(declare-fun b!952454 () Bool)

(declare-fun b_free!18271 () Bool)

(declare-fun b_next!18271 () Bool)

(assert (=> b!952454 (= b_free!18271 (not b_next!18271))))

(declare-fun tp!63425 () Bool)

(declare-fun b_and!29751 () Bool)

(assert (=> b!952454 (= tp!63425 b_and!29751)))

(declare-fun b!952448 () Bool)

(declare-fun e!536406 () Bool)

(declare-fun tp_is_empty!20779 () Bool)

(assert (=> b!952448 (= e!536406 tp_is_empty!20779)))

(declare-fun b!952449 () Bool)

(declare-fun e!536411 () Bool)

(declare-datatypes ((V!32671 0))(
  ( (V!32672 (val!10440 Int)) )
))
(declare-datatypes ((ValueCell!9908 0))(
  ( (ValueCellFull!9908 (v!12985 V!32671)) (EmptyCell!9908) )
))
(declare-datatypes ((array!57637 0))(
  ( (array!57638 (arr!27709 (Array (_ BitVec 32) ValueCell!9908)) (size!28188 (_ BitVec 32))) )
))
(declare-datatypes ((array!57639 0))(
  ( (array!57640 (arr!27710 (Array (_ BitVec 32) (_ BitVec 64))) (size!28189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4966 0))(
  ( (LongMapFixedSize!4967 (defaultEntry!5806 Int) (mask!27674 (_ BitVec 32)) (extraKeys!5538 (_ BitVec 32)) (zeroValue!5642 V!32671) (minValue!5642 V!32671) (_size!2538 (_ BitVec 32)) (_keys!10779 array!57639) (_values!5829 array!57637) (_vacant!2538 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4966)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952449 (= e!536411 (not (validMask!0 (mask!27674 thiss!1141))))))

(declare-fun lt!428996 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57639 (_ BitVec 32)) Bool)

(assert (=> b!952449 (arrayForallSeekEntryOrOpenFound!0 lt!428996 (_keys!10779 thiss!1141) (mask!27674 thiss!1141))))

(declare-datatypes ((Unit!32002 0))(
  ( (Unit!32003) )
))
(declare-fun lt!428998 () Unit!32002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32002)

(assert (=> b!952449 (= lt!428998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10779 thiss!1141) (mask!27674 thiss!1141) #b00000000000000000000000000000000 lt!428996))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57639 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952449 (= lt!428996 (arrayScanForKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952449 (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428997 () Unit!32002)

(declare-fun lemmaKeyInListMapIsInArray!326 (array!57639 array!57637 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 64) Int) Unit!32002)

(assert (=> b!952449 (= lt!428997 (lemmaKeyInListMapIsInArray!326 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)))))

(declare-fun b!952450 () Bool)

(declare-fun e!536409 () Bool)

(declare-fun e!536410 () Bool)

(declare-fun mapRes!33096 () Bool)

(assert (=> b!952450 (= e!536409 (and e!536410 mapRes!33096))))

(declare-fun condMapEmpty!33096 () Bool)

(declare-fun mapDefault!33096 () ValueCell!9908)

(assert (=> b!952450 (= condMapEmpty!33096 (= (arr!27709 (_values!5829 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9908)) mapDefault!33096)))))

(declare-fun res!638029 () Bool)

(assert (=> start!81544 (=> (not res!638029) (not e!536411))))

(declare-fun valid!1898 (LongMapFixedSize!4966) Bool)

(assert (=> start!81544 (= res!638029 (valid!1898 thiss!1141))))

(assert (=> start!81544 e!536411))

(declare-fun e!536408 () Bool)

(assert (=> start!81544 e!536408))

(assert (=> start!81544 true))

(declare-fun b!952451 () Bool)

(declare-fun res!638028 () Bool)

(assert (=> b!952451 (=> (not res!638028) (not e!536411))))

(assert (=> b!952451 (= res!638028 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952452 () Bool)

(declare-fun res!638026 () Bool)

(assert (=> b!952452 (=> (not res!638026) (not e!536411))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9112 0))(
  ( (MissingZero!9112 (index!38819 (_ BitVec 32))) (Found!9112 (index!38820 (_ BitVec 32))) (Intermediate!9112 (undefined!9924 Bool) (index!38821 (_ BitVec 32)) (x!81842 (_ BitVec 32))) (Undefined!9112) (MissingVacant!9112 (index!38822 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57639 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!952452 (= res!638026 (not ((_ is Found!9112) (seekEntry!0 key!756 (_keys!10779 thiss!1141) (mask!27674 thiss!1141)))))))

(declare-fun b!952453 () Bool)

(declare-fun res!638027 () Bool)

(assert (=> b!952453 (=> (not res!638027) (not e!536411))))

(declare-datatypes ((tuple2!13554 0))(
  ( (tuple2!13555 (_1!6788 (_ BitVec 64)) (_2!6788 V!32671)) )
))
(declare-datatypes ((List!19344 0))(
  ( (Nil!19341) (Cons!19340 (h!20507 tuple2!13554) (t!27685 List!19344)) )
))
(declare-datatypes ((ListLongMap!12253 0))(
  ( (ListLongMap!12254 (toList!6142 List!19344)) )
))
(declare-fun contains!5246 (ListLongMap!12253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3375 (array!57639 array!57637 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 32) Int) ListLongMap!12253)

(assert (=> b!952453 (= res!638027 (contains!5246 (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33096 () Bool)

(assert (=> mapIsEmpty!33096 mapRes!33096))

(declare-fun array_inv!21584 (array!57639) Bool)

(declare-fun array_inv!21585 (array!57637) Bool)

(assert (=> b!952454 (= e!536408 (and tp!63425 tp_is_empty!20779 (array_inv!21584 (_keys!10779 thiss!1141)) (array_inv!21585 (_values!5829 thiss!1141)) e!536409))))

(declare-fun b!952455 () Bool)

(assert (=> b!952455 (= e!536410 tp_is_empty!20779)))

(declare-fun mapNonEmpty!33096 () Bool)

(declare-fun tp!63426 () Bool)

(assert (=> mapNonEmpty!33096 (= mapRes!33096 (and tp!63426 e!536406))))

(declare-fun mapRest!33096 () (Array (_ BitVec 32) ValueCell!9908))

(declare-fun mapKey!33096 () (_ BitVec 32))

(declare-fun mapValue!33096 () ValueCell!9908)

(assert (=> mapNonEmpty!33096 (= (arr!27709 (_values!5829 thiss!1141)) (store mapRest!33096 mapKey!33096 mapValue!33096))))

(assert (= (and start!81544 res!638029) b!952451))

(assert (= (and b!952451 res!638028) b!952452))

(assert (= (and b!952452 res!638026) b!952453))

(assert (= (and b!952453 res!638027) b!952449))

(assert (= (and b!952450 condMapEmpty!33096) mapIsEmpty!33096))

(assert (= (and b!952450 (not condMapEmpty!33096)) mapNonEmpty!33096))

(assert (= (and mapNonEmpty!33096 ((_ is ValueCellFull!9908) mapValue!33096)) b!952448))

(assert (= (and b!952450 ((_ is ValueCellFull!9908) mapDefault!33096)) b!952455))

(assert (= b!952454 b!952450))

(assert (= start!81544 b!952454))

(declare-fun m!885063 () Bool)

(assert (=> b!952454 m!885063))

(declare-fun m!885065 () Bool)

(assert (=> b!952454 m!885065))

(declare-fun m!885067 () Bool)

(assert (=> b!952452 m!885067))

(declare-fun m!885069 () Bool)

(assert (=> b!952449 m!885069))

(declare-fun m!885071 () Bool)

(assert (=> b!952449 m!885071))

(declare-fun m!885073 () Bool)

(assert (=> b!952449 m!885073))

(declare-fun m!885075 () Bool)

(assert (=> b!952449 m!885075))

(declare-fun m!885077 () Bool)

(assert (=> b!952449 m!885077))

(declare-fun m!885079 () Bool)

(assert (=> b!952449 m!885079))

(declare-fun m!885081 () Bool)

(assert (=> mapNonEmpty!33096 m!885081))

(declare-fun m!885083 () Bool)

(assert (=> start!81544 m!885083))

(declare-fun m!885085 () Bool)

(assert (=> b!952453 m!885085))

(assert (=> b!952453 m!885085))

(declare-fun m!885087 () Bool)

(assert (=> b!952453 m!885087))

(check-sat (not b!952449) (not b!952453) (not b!952452) (not b!952454) (not mapNonEmpty!33096) tp_is_empty!20779 (not start!81544) b_and!29751 (not b_next!18271))
(check-sat b_and!29751 (not b_next!18271))
(get-model)

(declare-fun d!115681 () Bool)

(declare-fun res!638060 () Bool)

(declare-fun e!536450 () Bool)

(assert (=> d!115681 (=> (not res!638060) (not e!536450))))

(declare-fun simpleValid!379 (LongMapFixedSize!4966) Bool)

(assert (=> d!115681 (= res!638060 (simpleValid!379 thiss!1141))))

(assert (=> d!115681 (= (valid!1898 thiss!1141) e!536450)))

(declare-fun b!952510 () Bool)

(declare-fun res!638061 () Bool)

(assert (=> b!952510 (=> (not res!638061) (not e!536450))))

(declare-fun arrayCountValidKeys!0 (array!57639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952510 (= res!638061 (= (arrayCountValidKeys!0 (_keys!10779 thiss!1141) #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))) (_size!2538 thiss!1141)))))

(declare-fun b!952511 () Bool)

(declare-fun res!638062 () Bool)

(assert (=> b!952511 (=> (not res!638062) (not e!536450))))

(assert (=> b!952511 (= res!638062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10779 thiss!1141) (mask!27674 thiss!1141)))))

(declare-fun b!952512 () Bool)

(declare-datatypes ((List!19345 0))(
  ( (Nil!19342) (Cons!19341 (h!20508 (_ BitVec 64)) (t!27688 List!19345)) )
))
(declare-fun arrayNoDuplicates!0 (array!57639 (_ BitVec 32) List!19345) Bool)

(assert (=> b!952512 (= e!536450 (arrayNoDuplicates!0 (_keys!10779 thiss!1141) #b00000000000000000000000000000000 Nil!19342))))

(assert (= (and d!115681 res!638060) b!952510))

(assert (= (and b!952510 res!638061) b!952511))

(assert (= (and b!952511 res!638062) b!952512))

(declare-fun m!885141 () Bool)

(assert (=> d!115681 m!885141))

(declare-fun m!885143 () Bool)

(assert (=> b!952510 m!885143))

(declare-fun m!885145 () Bool)

(assert (=> b!952511 m!885145))

(declare-fun m!885147 () Bool)

(assert (=> b!952512 m!885147))

(assert (=> start!81544 d!115681))

(declare-fun d!115683 () Bool)

(declare-fun e!536456 () Bool)

(assert (=> d!115683 e!536456))

(declare-fun res!638065 () Bool)

(assert (=> d!115683 (=> res!638065 e!536456)))

(declare-fun lt!429025 () Bool)

(assert (=> d!115683 (= res!638065 (not lt!429025))))

(declare-fun lt!429026 () Bool)

(assert (=> d!115683 (= lt!429025 lt!429026)))

(declare-fun lt!429027 () Unit!32002)

(declare-fun e!536455 () Unit!32002)

(assert (=> d!115683 (= lt!429027 e!536455)))

(declare-fun c!99744 () Bool)

(assert (=> d!115683 (= c!99744 lt!429026)))

(declare-fun containsKey!471 (List!19344 (_ BitVec 64)) Bool)

(assert (=> d!115683 (= lt!429026 (containsKey!471 (toList!6142 (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756))))

(assert (=> d!115683 (= (contains!5246 (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) key!756) lt!429025)))

(declare-fun b!952519 () Bool)

(declare-fun lt!429028 () Unit!32002)

(assert (=> b!952519 (= e!536455 lt!429028)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!365 (List!19344 (_ BitVec 64)) Unit!32002)

(assert (=> b!952519 (= lt!429028 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6142 (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756))))

(declare-datatypes ((Option!506 0))(
  ( (Some!505 (v!12988 V!32671)) (None!504) )
))
(declare-fun isDefined!373 (Option!506) Bool)

(declare-fun getValueByKey!500 (List!19344 (_ BitVec 64)) Option!506)

(assert (=> b!952519 (isDefined!373 (getValueByKey!500 (toList!6142 (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756))))

(declare-fun b!952520 () Bool)

(declare-fun Unit!32006 () Unit!32002)

(assert (=> b!952520 (= e!536455 Unit!32006)))

(declare-fun b!952521 () Bool)

(assert (=> b!952521 (= e!536456 (isDefined!373 (getValueByKey!500 (toList!6142 (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141))) key!756)))))

(assert (= (and d!115683 c!99744) b!952519))

(assert (= (and d!115683 (not c!99744)) b!952520))

(assert (= (and d!115683 (not res!638065)) b!952521))

(declare-fun m!885149 () Bool)

(assert (=> d!115683 m!885149))

(declare-fun m!885151 () Bool)

(assert (=> b!952519 m!885151))

(declare-fun m!885153 () Bool)

(assert (=> b!952519 m!885153))

(assert (=> b!952519 m!885153))

(declare-fun m!885155 () Bool)

(assert (=> b!952519 m!885155))

(assert (=> b!952521 m!885153))

(assert (=> b!952521 m!885153))

(assert (=> b!952521 m!885155))

(assert (=> b!952453 d!115683))

(declare-fun bm!41547 () Bool)

(declare-fun call!41556 () ListLongMap!12253)

(declare-fun getCurrentListMapNoExtraKeys!3366 (array!57639 array!57637 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 32) Int) ListLongMap!12253)

(assert (=> bm!41547 (= call!41556 (getCurrentListMapNoExtraKeys!3366 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun b!952564 () Bool)

(declare-fun e!536494 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952564 (= e!536494 (validKeyInArray!0 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952565 () Bool)

(declare-fun e!536484 () Bool)

(declare-fun e!536485 () Bool)

(assert (=> b!952565 (= e!536484 e!536485)))

(declare-fun res!638087 () Bool)

(declare-fun call!41554 () Bool)

(assert (=> b!952565 (= res!638087 call!41554)))

(assert (=> b!952565 (=> (not res!638087) (not e!536485))))

(declare-fun bm!41548 () Bool)

(declare-fun call!41555 () Bool)

(declare-fun lt!429075 () ListLongMap!12253)

(assert (=> bm!41548 (= call!41555 (contains!5246 lt!429075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952566 () Bool)

(declare-fun e!536483 () ListLongMap!12253)

(declare-fun call!41553 () ListLongMap!12253)

(assert (=> b!952566 (= e!536483 call!41553)))

(declare-fun b!952567 () Bool)

(declare-fun e!536493 () ListLongMap!12253)

(declare-fun e!536490 () ListLongMap!12253)

(assert (=> b!952567 (= e!536493 e!536490)))

(declare-fun c!99760 () Bool)

(assert (=> b!952567 (= c!99760 (and (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952568 () Bool)

(declare-fun e!536491 () Unit!32002)

(declare-fun Unit!32007 () Unit!32002)

(assert (=> b!952568 (= e!536491 Unit!32007)))

(declare-fun bm!41549 () Bool)

(declare-fun call!41552 () ListLongMap!12253)

(declare-fun call!41550 () ListLongMap!12253)

(assert (=> bm!41549 (= call!41552 call!41550)))

(declare-fun bm!41550 () Bool)

(assert (=> bm!41550 (= call!41550 call!41556)))

(declare-fun b!952569 () Bool)

(declare-fun c!99758 () Bool)

(assert (=> b!952569 (= c!99758 (and (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952569 (= e!536490 e!536483)))

(declare-fun b!952570 () Bool)

(assert (=> b!952570 (= e!536484 (not call!41554))))

(declare-fun b!952571 () Bool)

(declare-fun e!536495 () Bool)

(declare-fun e!536486 () Bool)

(assert (=> b!952571 (= e!536495 e!536486)))

(declare-fun res!638088 () Bool)

(assert (=> b!952571 (= res!638088 call!41555)))

(assert (=> b!952571 (=> (not res!638088) (not e!536486))))

(declare-fun b!952572 () Bool)

(assert (=> b!952572 (= e!536483 call!41552)))

(declare-fun b!952573 () Bool)

(assert (=> b!952573 (= e!536490 call!41553)))

(declare-fun bm!41551 () Bool)

(declare-fun call!41551 () ListLongMap!12253)

(assert (=> bm!41551 (= call!41553 call!41551)))

(declare-fun b!952574 () Bool)

(declare-fun e!536492 () Bool)

(declare-fun apply!892 (ListLongMap!12253 (_ BitVec 64)) V!32671)

(declare-fun get!14576 (ValueCell!9908 V!32671) V!32671)

(declare-fun dynLambda!1675 (Int (_ BitVec 64)) V!32671)

(assert (=> b!952574 (= e!536492 (= (apply!892 lt!429075 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)) (get!14576 (select (arr!27709 (_values!5829 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1675 (defaultEntry!5806 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28188 (_values!5829 thiss!1141))))))

(assert (=> b!952574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))))))

(declare-fun b!952575 () Bool)

(declare-fun e!536487 () Bool)

(assert (=> b!952575 (= e!536487 (validKeyInArray!0 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952576 () Bool)

(assert (=> b!952576 (= e!536485 (= (apply!892 lt!429075 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5642 thiss!1141)))))

(declare-fun b!952577 () Bool)

(assert (=> b!952577 (= e!536495 (not call!41555))))

(declare-fun bm!41552 () Bool)

(assert (=> bm!41552 (= call!41554 (contains!5246 lt!429075 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952578 () Bool)

(declare-fun lt!429086 () Unit!32002)

(assert (=> b!952578 (= e!536491 lt!429086)))

(declare-fun lt!429090 () ListLongMap!12253)

(assert (=> b!952578 (= lt!429090 (getCurrentListMapNoExtraKeys!3366 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!429077 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429081 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429081 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429084 () Unit!32002)

(declare-fun addStillContains!581 (ListLongMap!12253 (_ BitVec 64) V!32671 (_ BitVec 64)) Unit!32002)

(assert (=> b!952578 (= lt!429084 (addStillContains!581 lt!429090 lt!429077 (zeroValue!5642 thiss!1141) lt!429081))))

(declare-fun +!2878 (ListLongMap!12253 tuple2!13554) ListLongMap!12253)

(assert (=> b!952578 (contains!5246 (+!2878 lt!429090 (tuple2!13555 lt!429077 (zeroValue!5642 thiss!1141))) lt!429081)))

(declare-fun lt!429091 () Unit!32002)

(assert (=> b!952578 (= lt!429091 lt!429084)))

(declare-fun lt!429074 () ListLongMap!12253)

(assert (=> b!952578 (= lt!429074 (getCurrentListMapNoExtraKeys!3366 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!429093 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429083 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429083 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429076 () Unit!32002)

(declare-fun addApplyDifferent!462 (ListLongMap!12253 (_ BitVec 64) V!32671 (_ BitVec 64)) Unit!32002)

(assert (=> b!952578 (= lt!429076 (addApplyDifferent!462 lt!429074 lt!429093 (minValue!5642 thiss!1141) lt!429083))))

(assert (=> b!952578 (= (apply!892 (+!2878 lt!429074 (tuple2!13555 lt!429093 (minValue!5642 thiss!1141))) lt!429083) (apply!892 lt!429074 lt!429083))))

(declare-fun lt!429087 () Unit!32002)

(assert (=> b!952578 (= lt!429087 lt!429076)))

(declare-fun lt!429092 () ListLongMap!12253)

(assert (=> b!952578 (= lt!429092 (getCurrentListMapNoExtraKeys!3366 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!429088 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429088 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429079 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429079 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429085 () Unit!32002)

(assert (=> b!952578 (= lt!429085 (addApplyDifferent!462 lt!429092 lt!429088 (zeroValue!5642 thiss!1141) lt!429079))))

(assert (=> b!952578 (= (apply!892 (+!2878 lt!429092 (tuple2!13555 lt!429088 (zeroValue!5642 thiss!1141))) lt!429079) (apply!892 lt!429092 lt!429079))))

(declare-fun lt!429089 () Unit!32002)

(assert (=> b!952578 (= lt!429089 lt!429085)))

(declare-fun lt!429073 () ListLongMap!12253)

(assert (=> b!952578 (= lt!429073 (getCurrentListMapNoExtraKeys!3366 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)))))

(declare-fun lt!429082 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429082 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429080 () (_ BitVec 64))

(assert (=> b!952578 (= lt!429080 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952578 (= lt!429086 (addApplyDifferent!462 lt!429073 lt!429082 (minValue!5642 thiss!1141) lt!429080))))

(assert (=> b!952578 (= (apply!892 (+!2878 lt!429073 (tuple2!13555 lt!429082 (minValue!5642 thiss!1141))) lt!429080) (apply!892 lt!429073 lt!429080))))

(declare-fun b!952579 () Bool)

(declare-fun res!638090 () Bool)

(declare-fun e!536489 () Bool)

(assert (=> b!952579 (=> (not res!638090) (not e!536489))))

(assert (=> b!952579 (= res!638090 e!536495)))

(declare-fun c!99761 () Bool)

(assert (=> b!952579 (= c!99761 (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!952580 () Bool)

(assert (=> b!952580 (= e!536489 e!536484)))

(declare-fun c!99762 () Bool)

(assert (=> b!952580 (= c!99762 (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952581 () Bool)

(declare-fun res!638085 () Bool)

(assert (=> b!952581 (=> (not res!638085) (not e!536489))))

(declare-fun e!536488 () Bool)

(assert (=> b!952581 (= res!638085 e!536488)))

(declare-fun res!638089 () Bool)

(assert (=> b!952581 (=> res!638089 e!536488)))

(assert (=> b!952581 (= res!638089 (not e!536487))))

(declare-fun res!638084 () Bool)

(assert (=> b!952581 (=> (not res!638084) (not e!536487))))

(assert (=> b!952581 (= res!638084 (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))))))

(declare-fun d!115685 () Bool)

(assert (=> d!115685 e!536489))

(declare-fun res!638091 () Bool)

(assert (=> d!115685 (=> (not res!638091) (not e!536489))))

(assert (=> d!115685 (= res!638091 (or (bvsge #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))))))))

(declare-fun lt!429078 () ListLongMap!12253)

(assert (=> d!115685 (= lt!429075 lt!429078)))

(declare-fun lt!429094 () Unit!32002)

(assert (=> d!115685 (= lt!429094 e!536491)))

(declare-fun c!99759 () Bool)

(assert (=> d!115685 (= c!99759 e!536494)))

(declare-fun res!638086 () Bool)

(assert (=> d!115685 (=> (not res!638086) (not e!536494))))

(assert (=> d!115685 (= res!638086 (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))))))

(assert (=> d!115685 (= lt!429078 e!536493)))

(declare-fun c!99757 () Bool)

(assert (=> d!115685 (= c!99757 (and (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115685 (validMask!0 (mask!27674 thiss!1141))))

(assert (=> d!115685 (= (getCurrentListMap!3375 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5806 thiss!1141)) lt!429075)))

(declare-fun bm!41553 () Bool)

(assert (=> bm!41553 (= call!41551 (+!2878 (ite c!99757 call!41556 (ite c!99760 call!41550 call!41552)) (ite (or c!99757 c!99760) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5642 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5642 thiss!1141)))))))

(declare-fun b!952582 () Bool)

(assert (=> b!952582 (= e!536488 e!536492)))

(declare-fun res!638092 () Bool)

(assert (=> b!952582 (=> (not res!638092) (not e!536492))))

(assert (=> b!952582 (= res!638092 (contains!5246 lt!429075 (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952582 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))))))

(declare-fun b!952583 () Bool)

(assert (=> b!952583 (= e!536493 (+!2878 call!41551 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5642 thiss!1141))))))

(declare-fun b!952584 () Bool)

(assert (=> b!952584 (= e!536486 (= (apply!892 lt!429075 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5642 thiss!1141)))))

(assert (= (and d!115685 c!99757) b!952583))

(assert (= (and d!115685 (not c!99757)) b!952567))

(assert (= (and b!952567 c!99760) b!952573))

(assert (= (and b!952567 (not c!99760)) b!952569))

(assert (= (and b!952569 c!99758) b!952566))

(assert (= (and b!952569 (not c!99758)) b!952572))

(assert (= (or b!952566 b!952572) bm!41549))

(assert (= (or b!952573 bm!41549) bm!41550))

(assert (= (or b!952573 b!952566) bm!41551))

(assert (= (or b!952583 bm!41550) bm!41547))

(assert (= (or b!952583 bm!41551) bm!41553))

(assert (= (and d!115685 res!638086) b!952564))

(assert (= (and d!115685 c!99759) b!952578))

(assert (= (and d!115685 (not c!99759)) b!952568))

(assert (= (and d!115685 res!638091) b!952581))

(assert (= (and b!952581 res!638084) b!952575))

(assert (= (and b!952581 (not res!638089)) b!952582))

(assert (= (and b!952582 res!638092) b!952574))

(assert (= (and b!952581 res!638085) b!952579))

(assert (= (and b!952579 c!99761) b!952571))

(assert (= (and b!952579 (not c!99761)) b!952577))

(assert (= (and b!952571 res!638088) b!952584))

(assert (= (or b!952571 b!952577) bm!41548))

(assert (= (and b!952579 res!638090) b!952580))

(assert (= (and b!952580 c!99762) b!952565))

(assert (= (and b!952580 (not c!99762)) b!952570))

(assert (= (and b!952565 res!638087) b!952576))

(assert (= (or b!952565 b!952570) bm!41552))

(declare-fun b_lambda!14409 () Bool)

(assert (=> (not b_lambda!14409) (not b!952574)))

(declare-fun t!27687 () Bool)

(declare-fun tb!6193 () Bool)

(assert (=> (and b!952454 (= (defaultEntry!5806 thiss!1141) (defaultEntry!5806 thiss!1141)) t!27687) tb!6193))

(declare-fun result!12317 () Bool)

(assert (=> tb!6193 (= result!12317 tp_is_empty!20779)))

(assert (=> b!952574 t!27687))

(declare-fun b_and!29757 () Bool)

(assert (= b_and!29751 (and (=> t!27687 result!12317) b_and!29757)))

(declare-fun m!885157 () Bool)

(assert (=> b!952564 m!885157))

(assert (=> b!952564 m!885157))

(declare-fun m!885159 () Bool)

(assert (=> b!952564 m!885159))

(declare-fun m!885161 () Bool)

(assert (=> bm!41548 m!885161))

(declare-fun m!885163 () Bool)

(assert (=> bm!41547 m!885163))

(declare-fun m!885165 () Bool)

(assert (=> b!952576 m!885165))

(assert (=> b!952575 m!885157))

(assert (=> b!952575 m!885157))

(assert (=> b!952575 m!885159))

(declare-fun m!885167 () Bool)

(assert (=> b!952584 m!885167))

(declare-fun m!885169 () Bool)

(assert (=> b!952583 m!885169))

(declare-fun m!885171 () Bool)

(assert (=> b!952574 m!885171))

(declare-fun m!885173 () Bool)

(assert (=> b!952574 m!885173))

(assert (=> b!952574 m!885157))

(declare-fun m!885175 () Bool)

(assert (=> b!952574 m!885175))

(assert (=> b!952574 m!885171))

(assert (=> b!952574 m!885173))

(declare-fun m!885177 () Bool)

(assert (=> b!952574 m!885177))

(assert (=> b!952574 m!885157))

(declare-fun m!885179 () Bool)

(assert (=> bm!41552 m!885179))

(declare-fun m!885181 () Bool)

(assert (=> b!952578 m!885181))

(assert (=> b!952578 m!885163))

(declare-fun m!885183 () Bool)

(assert (=> b!952578 m!885183))

(declare-fun m!885185 () Bool)

(assert (=> b!952578 m!885185))

(declare-fun m!885187 () Bool)

(assert (=> b!952578 m!885187))

(assert (=> b!952578 m!885187))

(declare-fun m!885189 () Bool)

(assert (=> b!952578 m!885189))

(declare-fun m!885191 () Bool)

(assert (=> b!952578 m!885191))

(declare-fun m!885193 () Bool)

(assert (=> b!952578 m!885193))

(declare-fun m!885195 () Bool)

(assert (=> b!952578 m!885195))

(assert (=> b!952578 m!885183))

(assert (=> b!952578 m!885157))

(declare-fun m!885197 () Bool)

(assert (=> b!952578 m!885197))

(declare-fun m!885199 () Bool)

(assert (=> b!952578 m!885199))

(assert (=> b!952578 m!885199))

(declare-fun m!885201 () Bool)

(assert (=> b!952578 m!885201))

(assert (=> b!952578 m!885191))

(declare-fun m!885203 () Bool)

(assert (=> b!952578 m!885203))

(declare-fun m!885205 () Bool)

(assert (=> b!952578 m!885205))

(declare-fun m!885207 () Bool)

(assert (=> b!952578 m!885207))

(declare-fun m!885209 () Bool)

(assert (=> b!952578 m!885209))

(assert (=> d!115685 m!885075))

(assert (=> b!952582 m!885157))

(assert (=> b!952582 m!885157))

(declare-fun m!885211 () Bool)

(assert (=> b!952582 m!885211))

(declare-fun m!885213 () Bool)

(assert (=> bm!41553 m!885213))

(assert (=> b!952453 d!115685))

(declare-fun d!115687 () Bool)

(declare-fun res!638097 () Bool)

(declare-fun e!536500 () Bool)

(assert (=> d!115687 (=> res!638097 e!536500)))

(assert (=> d!115687 (= res!638097 (= (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115687 (= (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000) e!536500)))

(declare-fun b!952591 () Bool)

(declare-fun e!536501 () Bool)

(assert (=> b!952591 (= e!536500 e!536501)))

(declare-fun res!638098 () Bool)

(assert (=> b!952591 (=> (not res!638098) (not e!536501))))

(assert (=> b!952591 (= res!638098 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28189 (_keys!10779 thiss!1141))))))

(declare-fun b!952592 () Bool)

(assert (=> b!952592 (= e!536501 (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115687 (not res!638097)) b!952591))

(assert (= (and b!952591 res!638098) b!952592))

(assert (=> d!115687 m!885157))

(declare-fun m!885215 () Bool)

(assert (=> b!952592 m!885215))

(assert (=> b!952449 d!115687))

(declare-fun d!115689 () Bool)

(declare-fun e!536504 () Bool)

(assert (=> d!115689 e!536504))

(declare-fun c!99765 () Bool)

(assert (=> d!115689 (= c!99765 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429097 () Unit!32002)

(declare-fun choose!1598 (array!57639 array!57637 (_ BitVec 32) (_ BitVec 32) V!32671 V!32671 (_ BitVec 64) Int) Unit!32002)

(assert (=> d!115689 (= lt!429097 (choose!1598 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)))))

(assert (=> d!115689 (validMask!0 (mask!27674 thiss!1141))))

(assert (=> d!115689 (= (lemmaKeyInListMapIsInArray!326 (_keys!10779 thiss!1141) (_values!5829 thiss!1141) (mask!27674 thiss!1141) (extraKeys!5538 thiss!1141) (zeroValue!5642 thiss!1141) (minValue!5642 thiss!1141) key!756 (defaultEntry!5806 thiss!1141)) lt!429097)))

(declare-fun b!952597 () Bool)

(assert (=> b!952597 (= e!536504 (arrayContainsKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952598 () Bool)

(assert (=> b!952598 (= e!536504 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5538 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115689 c!99765) b!952597))

(assert (= (and d!115689 (not c!99765)) b!952598))

(declare-fun m!885217 () Bool)

(assert (=> d!115689 m!885217))

(assert (=> d!115689 m!885075))

(assert (=> b!952597 m!885079))

(assert (=> b!952449 d!115689))

(declare-fun d!115691 () Bool)

(declare-fun lt!429100 () (_ BitVec 32))

(assert (=> d!115691 (and (or (bvslt lt!429100 #b00000000000000000000000000000000) (bvsge lt!429100 (size!28189 (_keys!10779 thiss!1141))) (and (bvsge lt!429100 #b00000000000000000000000000000000) (bvslt lt!429100 (size!28189 (_keys!10779 thiss!1141))))) (bvsge lt!429100 #b00000000000000000000000000000000) (bvslt lt!429100 (size!28189 (_keys!10779 thiss!1141))) (= (select (arr!27710 (_keys!10779 thiss!1141)) lt!429100) key!756))))

(declare-fun e!536507 () (_ BitVec 32))

(assert (=> d!115691 (= lt!429100 e!536507)))

(declare-fun c!99768 () Bool)

(assert (=> d!115691 (= c!99768 (= (select (arr!27710 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10779 thiss!1141))) (bvslt (size!28189 (_keys!10779 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115691 (= (arrayScanForKey!0 (_keys!10779 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429100)))

(declare-fun b!952603 () Bool)

(assert (=> b!952603 (= e!536507 #b00000000000000000000000000000000)))

(declare-fun b!952604 () Bool)

(assert (=> b!952604 (= e!536507 (arrayScanForKey!0 (_keys!10779 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115691 c!99768) b!952603))

(assert (= (and d!115691 (not c!99768)) b!952604))

(declare-fun m!885219 () Bool)

(assert (=> d!115691 m!885219))

(assert (=> d!115691 m!885157))

(declare-fun m!885221 () Bool)

(assert (=> b!952604 m!885221))

(assert (=> b!952449 d!115691))

(declare-fun b!952613 () Bool)

(declare-fun e!536515 () Bool)

(declare-fun e!536514 () Bool)

(assert (=> b!952613 (= e!536515 e!536514)))

(declare-fun lt!429108 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429108 (select (arr!27710 (_keys!10779 thiss!1141)) lt!428996))))

(declare-fun lt!429107 () Unit!32002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57639 (_ BitVec 64) (_ BitVec 32)) Unit!32002)

(assert (=> b!952613 (= lt!429107 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10779 thiss!1141) lt!429108 lt!428996))))

(assert (=> b!952613 (arrayContainsKey!0 (_keys!10779 thiss!1141) lt!429108 #b00000000000000000000000000000000)))

(declare-fun lt!429109 () Unit!32002)

(assert (=> b!952613 (= lt!429109 lt!429107)))

(declare-fun res!638103 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57639 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!952613 (= res!638103 (= (seekEntryOrOpen!0 (select (arr!27710 (_keys!10779 thiss!1141)) lt!428996) (_keys!10779 thiss!1141) (mask!27674 thiss!1141)) (Found!9112 lt!428996)))))

(assert (=> b!952613 (=> (not res!638103) (not e!536514))))

(declare-fun b!952614 () Bool)

(declare-fun call!41559 () Bool)

(assert (=> b!952614 (= e!536514 call!41559)))

(declare-fun b!952615 () Bool)

(declare-fun e!536516 () Bool)

(assert (=> b!952615 (= e!536516 e!536515)))

(declare-fun c!99771 () Bool)

(assert (=> b!952615 (= c!99771 (validKeyInArray!0 (select (arr!27710 (_keys!10779 thiss!1141)) lt!428996)))))

(declare-fun b!952616 () Bool)

(assert (=> b!952616 (= e!536515 call!41559)))

(declare-fun d!115693 () Bool)

(declare-fun res!638104 () Bool)

(assert (=> d!115693 (=> res!638104 e!536516)))

(assert (=> d!115693 (= res!638104 (bvsge lt!428996 (size!28189 (_keys!10779 thiss!1141))))))

(assert (=> d!115693 (= (arrayForallSeekEntryOrOpenFound!0 lt!428996 (_keys!10779 thiss!1141) (mask!27674 thiss!1141)) e!536516)))

(declare-fun bm!41556 () Bool)

(assert (=> bm!41556 (= call!41559 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428996 #b00000000000000000000000000000001) (_keys!10779 thiss!1141) (mask!27674 thiss!1141)))))

(assert (= (and d!115693 (not res!638104)) b!952615))

(assert (= (and b!952615 c!99771) b!952613))

(assert (= (and b!952615 (not c!99771)) b!952616))

(assert (= (and b!952613 res!638103) b!952614))

(assert (= (or b!952614 b!952616) bm!41556))

(declare-fun m!885223 () Bool)

(assert (=> b!952613 m!885223))

(declare-fun m!885225 () Bool)

(assert (=> b!952613 m!885225))

(declare-fun m!885227 () Bool)

(assert (=> b!952613 m!885227))

(assert (=> b!952613 m!885223))

(declare-fun m!885229 () Bool)

(assert (=> b!952613 m!885229))

(assert (=> b!952615 m!885223))

(assert (=> b!952615 m!885223))

(declare-fun m!885231 () Bool)

(assert (=> b!952615 m!885231))

(declare-fun m!885233 () Bool)

(assert (=> bm!41556 m!885233))

(assert (=> b!952449 d!115693))

(declare-fun d!115695 () Bool)

(assert (=> d!115695 (arrayForallSeekEntryOrOpenFound!0 lt!428996 (_keys!10779 thiss!1141) (mask!27674 thiss!1141))))

(declare-fun lt!429112 () Unit!32002)

(declare-fun choose!38 (array!57639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32002)

(assert (=> d!115695 (= lt!429112 (choose!38 (_keys!10779 thiss!1141) (mask!27674 thiss!1141) #b00000000000000000000000000000000 lt!428996))))

(assert (=> d!115695 (validMask!0 (mask!27674 thiss!1141))))

(assert (=> d!115695 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10779 thiss!1141) (mask!27674 thiss!1141) #b00000000000000000000000000000000 lt!428996) lt!429112)))

(declare-fun bs!26751 () Bool)

(assert (= bs!26751 d!115695))

(assert (=> bs!26751 m!885069))

(declare-fun m!885235 () Bool)

(assert (=> bs!26751 m!885235))

(assert (=> bs!26751 m!885075))

(assert (=> b!952449 d!115695))

(declare-fun d!115697 () Bool)

(assert (=> d!115697 (= (validMask!0 (mask!27674 thiss!1141)) (and (or (= (mask!27674 thiss!1141) #b00000000000000000000000000000111) (= (mask!27674 thiss!1141) #b00000000000000000000000000001111) (= (mask!27674 thiss!1141) #b00000000000000000000000000011111) (= (mask!27674 thiss!1141) #b00000000000000000000000000111111) (= (mask!27674 thiss!1141) #b00000000000000000000000001111111) (= (mask!27674 thiss!1141) #b00000000000000000000000011111111) (= (mask!27674 thiss!1141) #b00000000000000000000000111111111) (= (mask!27674 thiss!1141) #b00000000000000000000001111111111) (= (mask!27674 thiss!1141) #b00000000000000000000011111111111) (= (mask!27674 thiss!1141) #b00000000000000000000111111111111) (= (mask!27674 thiss!1141) #b00000000000000000001111111111111) (= (mask!27674 thiss!1141) #b00000000000000000011111111111111) (= (mask!27674 thiss!1141) #b00000000000000000111111111111111) (= (mask!27674 thiss!1141) #b00000000000000001111111111111111) (= (mask!27674 thiss!1141) #b00000000000000011111111111111111) (= (mask!27674 thiss!1141) #b00000000000000111111111111111111) (= (mask!27674 thiss!1141) #b00000000000001111111111111111111) (= (mask!27674 thiss!1141) #b00000000000011111111111111111111) (= (mask!27674 thiss!1141) #b00000000000111111111111111111111) (= (mask!27674 thiss!1141) #b00000000001111111111111111111111) (= (mask!27674 thiss!1141) #b00000000011111111111111111111111) (= (mask!27674 thiss!1141) #b00000000111111111111111111111111) (= (mask!27674 thiss!1141) #b00000001111111111111111111111111) (= (mask!27674 thiss!1141) #b00000011111111111111111111111111) (= (mask!27674 thiss!1141) #b00000111111111111111111111111111) (= (mask!27674 thiss!1141) #b00001111111111111111111111111111) (= (mask!27674 thiss!1141) #b00011111111111111111111111111111) (= (mask!27674 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27674 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952449 d!115697))

(declare-fun d!115699 () Bool)

(assert (=> d!115699 (= (array_inv!21584 (_keys!10779 thiss!1141)) (bvsge (size!28189 (_keys!10779 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952454 d!115699))

(declare-fun d!115701 () Bool)

(assert (=> d!115701 (= (array_inv!21585 (_values!5829 thiss!1141)) (bvsge (size!28188 (_values!5829 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952454 d!115701))

(declare-fun b!952629 () Bool)

(declare-fun e!536525 () SeekEntryResult!9112)

(assert (=> b!952629 (= e!536525 Undefined!9112)))

(declare-fun d!115703 () Bool)

(declare-fun lt!429122 () SeekEntryResult!9112)

(assert (=> d!115703 (and (or ((_ is MissingVacant!9112) lt!429122) (not ((_ is Found!9112) lt!429122)) (and (bvsge (index!38820 lt!429122) #b00000000000000000000000000000000) (bvslt (index!38820 lt!429122) (size!28189 (_keys!10779 thiss!1141))))) (not ((_ is MissingVacant!9112) lt!429122)) (or (not ((_ is Found!9112) lt!429122)) (= (select (arr!27710 (_keys!10779 thiss!1141)) (index!38820 lt!429122)) key!756)))))

(assert (=> d!115703 (= lt!429122 e!536525)))

(declare-fun c!99779 () Bool)

(declare-fun lt!429121 () SeekEntryResult!9112)

(assert (=> d!115703 (= c!99779 (and ((_ is Intermediate!9112) lt!429121) (undefined!9924 lt!429121)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57639 (_ BitVec 32)) SeekEntryResult!9112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115703 (= lt!429121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27674 thiss!1141)) key!756 (_keys!10779 thiss!1141) (mask!27674 thiss!1141)))))

(assert (=> d!115703 (validMask!0 (mask!27674 thiss!1141))))

(assert (=> d!115703 (= (seekEntry!0 key!756 (_keys!10779 thiss!1141) (mask!27674 thiss!1141)) lt!429122)))

(declare-fun b!952630 () Bool)

(declare-fun e!536523 () SeekEntryResult!9112)

(assert (=> b!952630 (= e!536525 e!536523)))

(declare-fun lt!429124 () (_ BitVec 64))

(assert (=> b!952630 (= lt!429124 (select (arr!27710 (_keys!10779 thiss!1141)) (index!38821 lt!429121)))))

(declare-fun c!99780 () Bool)

(assert (=> b!952630 (= c!99780 (= lt!429124 key!756))))

(declare-fun b!952631 () Bool)

(assert (=> b!952631 (= e!536523 (Found!9112 (index!38821 lt!429121)))))

(declare-fun b!952632 () Bool)

(declare-fun e!536524 () SeekEntryResult!9112)

(assert (=> b!952632 (= e!536524 (MissingZero!9112 (index!38821 lt!429121)))))

(declare-fun b!952633 () Bool)

(declare-fun c!99778 () Bool)

(assert (=> b!952633 (= c!99778 (= lt!429124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952633 (= e!536523 e!536524)))

(declare-fun b!952634 () Bool)

(declare-fun lt!429123 () SeekEntryResult!9112)

(assert (=> b!952634 (= e!536524 (ite ((_ is MissingVacant!9112) lt!429123) (MissingZero!9112 (index!38822 lt!429123)) lt!429123))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57639 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!952634 (= lt!429123 (seekKeyOrZeroReturnVacant!0 (x!81842 lt!429121) (index!38821 lt!429121) (index!38821 lt!429121) key!756 (_keys!10779 thiss!1141) (mask!27674 thiss!1141)))))

(assert (= (and d!115703 c!99779) b!952629))

(assert (= (and d!115703 (not c!99779)) b!952630))

(assert (= (and b!952630 c!99780) b!952631))

(assert (= (and b!952630 (not c!99780)) b!952633))

(assert (= (and b!952633 c!99778) b!952632))

(assert (= (and b!952633 (not c!99778)) b!952634))

(declare-fun m!885237 () Bool)

(assert (=> d!115703 m!885237))

(declare-fun m!885239 () Bool)

(assert (=> d!115703 m!885239))

(assert (=> d!115703 m!885239))

(declare-fun m!885241 () Bool)

(assert (=> d!115703 m!885241))

(assert (=> d!115703 m!885075))

(declare-fun m!885243 () Bool)

(assert (=> b!952630 m!885243))

(declare-fun m!885245 () Bool)

(assert (=> b!952634 m!885245))

(assert (=> b!952452 d!115703))

(declare-fun condMapEmpty!33105 () Bool)

(declare-fun mapDefault!33105 () ValueCell!9908)

(assert (=> mapNonEmpty!33096 (= condMapEmpty!33105 (= mapRest!33096 ((as const (Array (_ BitVec 32) ValueCell!9908)) mapDefault!33105)))))

(declare-fun e!536531 () Bool)

(declare-fun mapRes!33105 () Bool)

(assert (=> mapNonEmpty!33096 (= tp!63426 (and e!536531 mapRes!33105))))

(declare-fun mapNonEmpty!33105 () Bool)

(declare-fun tp!63441 () Bool)

(declare-fun e!536530 () Bool)

(assert (=> mapNonEmpty!33105 (= mapRes!33105 (and tp!63441 e!536530))))

(declare-fun mapKey!33105 () (_ BitVec 32))

(declare-fun mapRest!33105 () (Array (_ BitVec 32) ValueCell!9908))

(declare-fun mapValue!33105 () ValueCell!9908)

(assert (=> mapNonEmpty!33105 (= mapRest!33096 (store mapRest!33105 mapKey!33105 mapValue!33105))))

(declare-fun b!952641 () Bool)

(assert (=> b!952641 (= e!536530 tp_is_empty!20779)))

(declare-fun b!952642 () Bool)

(assert (=> b!952642 (= e!536531 tp_is_empty!20779)))

(declare-fun mapIsEmpty!33105 () Bool)

(assert (=> mapIsEmpty!33105 mapRes!33105))

(assert (= (and mapNonEmpty!33096 condMapEmpty!33105) mapIsEmpty!33105))

(assert (= (and mapNonEmpty!33096 (not condMapEmpty!33105)) mapNonEmpty!33105))

(assert (= (and mapNonEmpty!33105 ((_ is ValueCellFull!9908) mapValue!33105)) b!952641))

(assert (= (and mapNonEmpty!33096 ((_ is ValueCellFull!9908) mapDefault!33105)) b!952642))

(declare-fun m!885247 () Bool)

(assert (=> mapNonEmpty!33105 m!885247))

(declare-fun b_lambda!14411 () Bool)

(assert (= b_lambda!14409 (or (and b!952454 b_free!18271) b_lambda!14411)))

(check-sat (not b!952510) (not b_lambda!14411) (not b!952564) (not d!115695) (not b!952519) (not bm!41548) (not b!952582) b_and!29757 (not b!952576) (not b!952578) (not bm!41556) (not bm!41552) (not b!952574) (not d!115689) (not bm!41553) (not bm!41547) (not b!952597) tp_is_empty!20779 (not b!952575) (not mapNonEmpty!33105) (not b!952521) (not d!115685) (not b!952592) (not b!952634) (not b!952583) (not b!952584) (not b!952512) (not d!115703) (not b!952615) (not b!952613) (not b!952511) (not b_next!18271) (not d!115681) (not b!952604) (not d!115683))
(check-sat b_and!29757 (not b_next!18271))
