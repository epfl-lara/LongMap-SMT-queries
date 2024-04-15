; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21944 () Bool)

(assert start!21944)

(declare-fun b!223676 () Bool)

(declare-fun b_free!6007 () Bool)

(declare-fun b_next!6007 () Bool)

(assert (=> b!223676 (= b_free!6007 (not b_next!6007))))

(declare-fun tp!21163 () Bool)

(declare-fun b_and!12879 () Bool)

(assert (=> b!223676 (= tp!21163 b_and!12879)))

(declare-fun b!223650 () Bool)

(declare-fun res!109947 () Bool)

(declare-fun e!145243 () Bool)

(assert (=> b!223650 (=> (not res!109947) (not e!145243))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!223650 (= res!109947 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223651 () Bool)

(declare-fun e!145251 () Bool)

(assert (=> b!223651 (= e!145251 false)))

(declare-fun lt!112812 () Bool)

(declare-datatypes ((List!3309 0))(
  ( (Nil!3306) (Cons!3305 (h!3953 (_ BitVec 64)) (t!8259 List!3309)) )
))
(declare-fun contains!1525 (List!3309 (_ BitVec 64)) Bool)

(assert (=> b!223651 (= lt!112812 (contains!1525 Nil!3306 key!932))))

(declare-fun b!223652 () Bool)

(declare-fun e!145249 () Bool)

(declare-fun e!145253 () Bool)

(assert (=> b!223652 (= e!145249 e!145253)))

(declare-fun res!109953 () Bool)

(assert (=> b!223652 (=> (not res!109953) (not e!145253))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223652 (= res!109953 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223653 () Bool)

(declare-fun e!145258 () Bool)

(assert (=> b!223653 (= e!145258 e!145251)))

(declare-fun res!109945 () Bool)

(assert (=> b!223653 (=> (not res!109945) (not e!145251))))

(declare-datatypes ((V!7473 0))(
  ( (V!7474 (val!2979 Int)) )
))
(declare-datatypes ((ValueCell!2591 0))(
  ( (ValueCellFull!2591 (v!4993 V!7473)) (EmptyCell!2591) )
))
(declare-datatypes ((array!10973 0))(
  ( (array!10974 (arr!5205 (Array (_ BitVec 32) ValueCell!2591)) (size!5539 (_ BitVec 32))) )
))
(declare-datatypes ((array!10975 0))(
  ( (array!10976 (arr!5206 (Array (_ BitVec 32) (_ BitVec 64))) (size!5540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3082 0))(
  ( (LongMapFixedSize!3083 (defaultEntry!4200 Int) (mask!10029 (_ BitVec 32)) (extraKeys!3937 (_ BitVec 32)) (zeroValue!4041 V!7473) (minValue!4041 V!7473) (_size!1590 (_ BitVec 32)) (_keys!6253 array!10975) (_values!4183 array!10973) (_vacant!1590 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3082)

(assert (=> b!223653 (= res!109945 (and (bvslt (size!5540 (_keys!6253 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5540 (_keys!6253 thiss!1504)))))))

(declare-datatypes ((Unit!6667 0))(
  ( (Unit!6668) )
))
(declare-fun lt!112809 () Unit!6667)

(declare-fun e!145252 () Unit!6667)

(assert (=> b!223653 (= lt!112809 e!145252)))

(declare-fun c!37114 () Bool)

(declare-fun lt!112814 () Bool)

(assert (=> b!223653 (= c!37114 lt!112814)))

(declare-fun arrayContainsKey!0 (array!10975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223653 (= lt!112814 (arrayContainsKey!0 (_keys!6253 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223654 () Bool)

(declare-fun res!109948 () Bool)

(assert (=> b!223654 (=> (not res!109948) (not e!145251))))

(assert (=> b!223654 (= res!109948 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5540 (_keys!6253 thiss!1504)))))))

(declare-fun b!223655 () Bool)

(declare-fun e!145250 () Bool)

(assert (=> b!223655 (= e!145250 e!145258)))

(declare-fun res!109937 () Bool)

(assert (=> b!223655 (=> (not res!109937) (not e!145258))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223655 (= res!109937 (inRange!0 index!297 (mask!10029 thiss!1504)))))

(declare-fun lt!112813 () Unit!6667)

(declare-fun e!145254 () Unit!6667)

(assert (=> b!223655 (= lt!112813 e!145254)))

(declare-fun c!37113 () Bool)

(declare-datatypes ((tuple2!4384 0))(
  ( (tuple2!4385 (_1!2203 (_ BitVec 64)) (_2!2203 V!7473)) )
))
(declare-datatypes ((List!3310 0))(
  ( (Nil!3307) (Cons!3306 (h!3954 tuple2!4384) (t!8260 List!3310)) )
))
(declare-datatypes ((ListLongMap!3287 0))(
  ( (ListLongMap!3288 (toList!1659 List!3310)) )
))
(declare-fun contains!1526 (ListLongMap!3287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1168 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 32) Int) ListLongMap!3287)

(assert (=> b!223655 (= c!37113 (contains!1526 (getCurrentListMap!1168 (_keys!6253 thiss!1504) (_values!4183 thiss!1504) (mask!10029 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4200 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9973 () Bool)

(declare-fun mapRes!9973 () Bool)

(assert (=> mapIsEmpty!9973 mapRes!9973))

(declare-fun b!223656 () Bool)

(declare-fun res!109936 () Bool)

(assert (=> b!223656 (=> (not res!109936) (not e!145251))))

(assert (=> b!223656 (= res!109936 (not (contains!1525 Nil!3306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223657 () Bool)

(declare-fun e!145247 () Bool)

(declare-fun e!145244 () Bool)

(assert (=> b!223657 (= e!145247 e!145244)))

(declare-fun res!109954 () Bool)

(declare-fun call!20832 () Bool)

(assert (=> b!223657 (= res!109954 call!20832)))

(assert (=> b!223657 (=> (not res!109954) (not e!145244))))

(declare-fun b!223658 () Bool)

(declare-fun res!109951 () Bool)

(assert (=> b!223658 (=> (not res!109951) (not e!145251))))

(assert (=> b!223658 (= res!109951 (not lt!112814))))

(declare-fun b!223659 () Bool)

(declare-datatypes ((SeekEntryResult!847 0))(
  ( (MissingZero!847 (index!5558 (_ BitVec 32))) (Found!847 (index!5559 (_ BitVec 32))) (Intermediate!847 (undefined!1659 Bool) (index!5560 (_ BitVec 32)) (x!23106 (_ BitVec 32))) (Undefined!847) (MissingVacant!847 (index!5561 (_ BitVec 32))) )
))
(declare-fun lt!112810 () SeekEntryResult!847)

(get-info :version)

(assert (=> b!223659 (= e!145247 ((_ is Undefined!847) lt!112810))))

(declare-fun b!223660 () Bool)

(declare-fun res!109944 () Bool)

(declare-fun e!145246 () Bool)

(assert (=> b!223660 (=> (not res!109944) (not e!145246))))

(assert (=> b!223660 (= res!109944 (= (select (arr!5206 (_keys!6253 thiss!1504)) (index!5558 lt!112810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223661 () Bool)

(declare-fun e!145248 () Bool)

(declare-fun tp_is_empty!5869 () Bool)

(assert (=> b!223661 (= e!145248 tp_is_empty!5869)))

(declare-fun b!223662 () Bool)

(declare-fun c!37112 () Bool)

(assert (=> b!223662 (= c!37112 ((_ is MissingVacant!847) lt!112810))))

(declare-fun e!145259 () Bool)

(assert (=> b!223662 (= e!145259 e!145247)))

(declare-fun b!223663 () Bool)

(declare-fun lt!112816 () Unit!6667)

(assert (=> b!223663 (= e!145254 lt!112816)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!227 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 64) Int) Unit!6667)

(assert (=> b!223663 (= lt!112816 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!227 (_keys!6253 thiss!1504) (_values!4183 thiss!1504) (mask!10029 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) key!932 (defaultEntry!4200 thiss!1504)))))

(declare-fun c!37111 () Bool)

(assert (=> b!223663 (= c!37111 ((_ is MissingZero!847) lt!112810))))

(assert (=> b!223663 e!145259))

(declare-fun b!223664 () Bool)

(declare-fun e!145257 () Bool)

(declare-fun e!145260 () Bool)

(assert (=> b!223664 (= e!145257 (and e!145260 mapRes!9973))))

(declare-fun condMapEmpty!9973 () Bool)

(declare-fun mapDefault!9973 () ValueCell!2591)

(assert (=> b!223664 (= condMapEmpty!9973 (= (arr!5205 (_values!4183 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2591)) mapDefault!9973)))))

(declare-fun b!223665 () Bool)

(declare-fun res!109946 () Bool)

(assert (=> b!223665 (=> (not res!109946) (not e!145251))))

(assert (=> b!223665 (= res!109946 e!145249)))

(declare-fun res!109950 () Bool)

(assert (=> b!223665 (=> res!109950 e!145249)))

(declare-fun e!145245 () Bool)

(assert (=> b!223665 (= res!109950 e!145245)))

(declare-fun res!109943 () Bool)

(assert (=> b!223665 (=> (not res!109943) (not e!145245))))

(assert (=> b!223665 (= res!109943 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223666 () Bool)

(declare-fun res!109952 () Bool)

(assert (=> b!223666 (=> (not res!109952) (not e!145251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223666 (= res!109952 (validKeyInArray!0 key!932))))

(declare-fun b!223667 () Bool)

(assert (=> b!223667 (= e!145260 tp_is_empty!5869)))

(declare-fun b!223668 () Bool)

(declare-fun res!109949 () Bool)

(assert (=> b!223668 (=> (not res!109949) (not e!145251))))

(declare-fun arrayNoDuplicates!0 (array!10975 (_ BitVec 32) List!3309) Bool)

(assert (=> b!223668 (= res!109949 (arrayNoDuplicates!0 (_keys!6253 thiss!1504) #b00000000000000000000000000000000 Nil!3306))))

(declare-fun b!223669 () Bool)

(assert (=> b!223669 (= e!145243 e!145250)))

(declare-fun res!109940 () Bool)

(assert (=> b!223669 (=> (not res!109940) (not e!145250))))

(assert (=> b!223669 (= res!109940 (or (= lt!112810 (MissingZero!847 index!297)) (= lt!112810 (MissingVacant!847 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10975 (_ BitVec 32)) SeekEntryResult!847)

(assert (=> b!223669 (= lt!112810 (seekEntryOrOpen!0 key!932 (_keys!6253 thiss!1504) (mask!10029 thiss!1504)))))

(declare-fun b!223670 () Bool)

(declare-fun Unit!6669 () Unit!6667)

(assert (=> b!223670 (= e!145252 Unit!6669)))

(declare-fun lt!112811 () Unit!6667)

(declare-fun lemmaArrayContainsKeyThenInListMap!71 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 64) (_ BitVec 32) Int) Unit!6667)

(assert (=> b!223670 (= lt!112811 (lemmaArrayContainsKeyThenInListMap!71 (_keys!6253 thiss!1504) (_values!4183 thiss!1504) (mask!10029 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4200 thiss!1504)))))

(assert (=> b!223670 false))

(declare-fun b!223671 () Bool)

(declare-fun res!109942 () Bool)

(assert (=> b!223671 (=> (not res!109942) (not e!145246))))

(assert (=> b!223671 (= res!109942 call!20832)))

(assert (=> b!223671 (= e!145259 e!145246)))

(declare-fun b!223672 () Bool)

(declare-fun Unit!6670 () Unit!6667)

(assert (=> b!223672 (= e!145252 Unit!6670)))

(declare-fun b!223673 () Bool)

(assert (=> b!223673 (= e!145245 (contains!1525 Nil!3306 key!932))))

(declare-fun b!223674 () Bool)

(declare-fun call!20831 () Bool)

(assert (=> b!223674 (= e!145246 (not call!20831))))

(declare-fun b!223675 () Bool)

(assert (=> b!223675 (= e!145244 (not call!20831))))

(declare-fun mapNonEmpty!9973 () Bool)

(declare-fun tp!21162 () Bool)

(assert (=> mapNonEmpty!9973 (= mapRes!9973 (and tp!21162 e!145248))))

(declare-fun mapValue!9973 () ValueCell!2591)

(declare-fun mapRest!9973 () (Array (_ BitVec 32) ValueCell!2591))

(declare-fun mapKey!9973 () (_ BitVec 32))

(assert (=> mapNonEmpty!9973 (= (arr!5205 (_values!4183 thiss!1504)) (store mapRest!9973 mapKey!9973 mapValue!9973))))

(declare-fun e!145255 () Bool)

(declare-fun array_inv!3431 (array!10975) Bool)

(declare-fun array_inv!3432 (array!10973) Bool)

(assert (=> b!223676 (= e!145255 (and tp!21163 tp_is_empty!5869 (array_inv!3431 (_keys!6253 thiss!1504)) (array_inv!3432 (_values!4183 thiss!1504)) e!145257))))

(declare-fun b!223677 () Bool)

(declare-fun Unit!6671 () Unit!6667)

(assert (=> b!223677 (= e!145254 Unit!6671)))

(declare-fun lt!112815 () Unit!6667)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!228 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7473 V!7473 (_ BitVec 64) Int) Unit!6667)

(assert (=> b!223677 (= lt!112815 (lemmaInListMapThenSeekEntryOrOpenFindsIt!228 (_keys!6253 thiss!1504) (_values!4183 thiss!1504) (mask!10029 thiss!1504) (extraKeys!3937 thiss!1504) (zeroValue!4041 thiss!1504) (minValue!4041 thiss!1504) key!932 (defaultEntry!4200 thiss!1504)))))

(assert (=> b!223677 false))

(declare-fun b!223678 () Bool)

(declare-fun res!109941 () Bool)

(assert (=> b!223678 (=> (not res!109941) (not e!145251))))

(assert (=> b!223678 (= res!109941 (not (contains!1525 Nil!3306 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223679 () Bool)

(declare-fun res!109938 () Bool)

(assert (=> b!223679 (= res!109938 (= (select (arr!5206 (_keys!6253 thiss!1504)) (index!5561 lt!112810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223679 (=> (not res!109938) (not e!145244))))

(declare-fun res!109955 () Bool)

(assert (=> start!21944 (=> (not res!109955) (not e!145243))))

(declare-fun valid!1256 (LongMapFixedSize!3082) Bool)

(assert (=> start!21944 (= res!109955 (valid!1256 thiss!1504))))

(assert (=> start!21944 e!145243))

(assert (=> start!21944 e!145255))

(assert (=> start!21944 true))

(declare-fun bm!20828 () Bool)

(assert (=> bm!20828 (= call!20832 (inRange!0 (ite c!37111 (index!5558 lt!112810) (index!5561 lt!112810)) (mask!10029 thiss!1504)))))

(declare-fun bm!20829 () Bool)

(assert (=> bm!20829 (= call!20831 (arrayContainsKey!0 (_keys!6253 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223680 () Bool)

(declare-fun res!109939 () Bool)

(assert (=> b!223680 (=> (not res!109939) (not e!145251))))

(declare-fun noDuplicate!81 (List!3309) Bool)

(assert (=> b!223680 (= res!109939 (noDuplicate!81 Nil!3306))))

(declare-fun b!223681 () Bool)

(assert (=> b!223681 (= e!145253 (not (contains!1525 Nil!3306 key!932)))))

(assert (= (and start!21944 res!109955) b!223650))

(assert (= (and b!223650 res!109947) b!223669))

(assert (= (and b!223669 res!109940) b!223655))

(assert (= (and b!223655 c!37113) b!223677))

(assert (= (and b!223655 (not c!37113)) b!223663))

(assert (= (and b!223663 c!37111) b!223671))

(assert (= (and b!223663 (not c!37111)) b!223662))

(assert (= (and b!223671 res!109942) b!223660))

(assert (= (and b!223660 res!109944) b!223674))

(assert (= (and b!223662 c!37112) b!223657))

(assert (= (and b!223662 (not c!37112)) b!223659))

(assert (= (and b!223657 res!109954) b!223679))

(assert (= (and b!223679 res!109938) b!223675))

(assert (= (or b!223671 b!223657) bm!20828))

(assert (= (or b!223674 b!223675) bm!20829))

(assert (= (and b!223655 res!109937) b!223653))

(assert (= (and b!223653 c!37114) b!223670))

(assert (= (and b!223653 (not c!37114)) b!223672))

(assert (= (and b!223653 res!109945) b!223680))

(assert (= (and b!223680 res!109939) b!223656))

(assert (= (and b!223656 res!109936) b!223678))

(assert (= (and b!223678 res!109941) b!223665))

(assert (= (and b!223665 res!109943) b!223673))

(assert (= (and b!223665 (not res!109950)) b!223652))

(assert (= (and b!223652 res!109953) b!223681))

(assert (= (and b!223665 res!109946) b!223668))

(assert (= (and b!223668 res!109949) b!223654))

(assert (= (and b!223654 res!109948) b!223666))

(assert (= (and b!223666 res!109952) b!223658))

(assert (= (and b!223658 res!109951) b!223651))

(assert (= (and b!223664 condMapEmpty!9973) mapIsEmpty!9973))

(assert (= (and b!223664 (not condMapEmpty!9973)) mapNonEmpty!9973))

(assert (= (and mapNonEmpty!9973 ((_ is ValueCellFull!2591) mapValue!9973)) b!223661))

(assert (= (and b!223664 ((_ is ValueCellFull!2591) mapDefault!9973)) b!223667))

(assert (= b!223676 b!223664))

(assert (= start!21944 b!223676))

(declare-fun m!246547 () Bool)

(assert (=> b!223666 m!246547))

(declare-fun m!246549 () Bool)

(assert (=> start!21944 m!246549))

(declare-fun m!246551 () Bool)

(assert (=> b!223669 m!246551))

(declare-fun m!246553 () Bool)

(assert (=> b!223656 m!246553))

(declare-fun m!246555 () Bool)

(assert (=> b!223679 m!246555))

(declare-fun m!246557 () Bool)

(assert (=> b!223681 m!246557))

(declare-fun m!246559 () Bool)

(assert (=> b!223653 m!246559))

(assert (=> bm!20829 m!246559))

(declare-fun m!246561 () Bool)

(assert (=> b!223660 m!246561))

(declare-fun m!246563 () Bool)

(assert (=> b!223676 m!246563))

(declare-fun m!246565 () Bool)

(assert (=> b!223676 m!246565))

(declare-fun m!246567 () Bool)

(assert (=> b!223663 m!246567))

(assert (=> b!223651 m!246557))

(declare-fun m!246569 () Bool)

(assert (=> b!223677 m!246569))

(declare-fun m!246571 () Bool)

(assert (=> b!223678 m!246571))

(declare-fun m!246573 () Bool)

(assert (=> b!223668 m!246573))

(declare-fun m!246575 () Bool)

(assert (=> b!223680 m!246575))

(declare-fun m!246577 () Bool)

(assert (=> b!223670 m!246577))

(declare-fun m!246579 () Bool)

(assert (=> mapNonEmpty!9973 m!246579))

(assert (=> b!223673 m!246557))

(declare-fun m!246581 () Bool)

(assert (=> b!223655 m!246581))

(declare-fun m!246583 () Bool)

(assert (=> b!223655 m!246583))

(assert (=> b!223655 m!246583))

(declare-fun m!246585 () Bool)

(assert (=> b!223655 m!246585))

(declare-fun m!246587 () Bool)

(assert (=> bm!20828 m!246587))

(check-sat (not b!223680) b_and!12879 (not b!223655) (not b!223673) (not b!223677) (not b!223666) (not b!223678) (not b!223653) (not b!223669) tp_is_empty!5869 (not mapNonEmpty!9973) (not b!223656) (not bm!20828) (not b!223676) (not b!223668) (not start!21944) (not b_next!6007) (not b!223670) (not bm!20829) (not b!223681) (not b!223663) (not b!223651))
(check-sat b_and!12879 (not b_next!6007))
