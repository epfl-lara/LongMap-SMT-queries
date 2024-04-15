; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23256 () Bool)

(assert start!23256)

(declare-fun b!244083 () Bool)

(declare-fun b_free!6535 () Bool)

(declare-fun b_next!6535 () Bool)

(assert (=> b!244083 (= b_free!6535 (not b_next!6535))))

(declare-fun tp!22830 () Bool)

(declare-fun b_and!13493 () Bool)

(assert (=> b!244083 (= tp!22830 b_and!13493)))

(declare-fun b!244057 () Bool)

(declare-fun e!158377 () Bool)

(declare-fun e!158373 () Bool)

(assert (=> b!244057 (= e!158377 e!158373)))

(declare-fun res!119654 () Bool)

(assert (=> b!244057 (=> (not res!119654) (not e!158373))))

(declare-datatypes ((V!8177 0))(
  ( (V!8178 (val!3243 Int)) )
))
(declare-datatypes ((ValueCell!2855 0))(
  ( (ValueCellFull!2855 (v!5286 V!8177)) (EmptyCell!2855) )
))
(declare-datatypes ((array!12079 0))(
  ( (array!12080 (arr!5733 (Array (_ BitVec 32) ValueCell!2855)) (size!6076 (_ BitVec 32))) )
))
(declare-datatypes ((array!12081 0))(
  ( (array!12082 (arr!5734 (Array (_ BitVec 32) (_ BitVec 64))) (size!6077 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3610 0))(
  ( (LongMapFixedSize!3611 (defaultEntry!4522 Int) (mask!10620 (_ BitVec 32)) (extraKeys!4259 (_ BitVec 32)) (zeroValue!4363 V!8177) (minValue!4363 V!8177) (_size!1854 (_ BitVec 32)) (_keys!6633 array!12081) (_values!4505 array!12079) (_vacant!1854 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3610)

(assert (=> b!244057 (= res!119654 (and (bvslt (size!6077 (_keys!6633 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504)))))))

(declare-datatypes ((Unit!7525 0))(
  ( (Unit!7526) )
))
(declare-fun lt!122256 () Unit!7525)

(declare-fun e!158367 () Unit!7525)

(assert (=> b!244057 (= lt!122256 e!158367)))

(declare-fun c!40735 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!244057 (= c!40735 (arrayContainsKey!0 (_keys!6633 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244058 () Bool)

(declare-fun e!158368 () Bool)

(declare-fun e!158376 () Bool)

(assert (=> b!244058 (= e!158368 e!158376)))

(declare-fun res!119656 () Bool)

(assert (=> b!244058 (=> (not res!119656) (not e!158376))))

(declare-datatypes ((SeekEntryResult!1077 0))(
  ( (MissingZero!1077 (index!6478 (_ BitVec 32))) (Found!1077 (index!6479 (_ BitVec 32))) (Intermediate!1077 (undefined!1889 Bool) (index!6480 (_ BitVec 32)) (x!24362 (_ BitVec 32))) (Undefined!1077) (MissingVacant!1077 (index!6481 (_ BitVec 32))) )
))
(declare-fun lt!122261 () SeekEntryResult!1077)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244058 (= res!119656 (or (= lt!122261 (MissingZero!1077 index!297)) (= lt!122261 (MissingVacant!1077 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12081 (_ BitVec 32)) SeekEntryResult!1077)

(assert (=> b!244058 (= lt!122261 (seekEntryOrOpen!0 key!932 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)))))

(declare-fun b!244059 () Bool)

(declare-fun e!158379 () Bool)

(declare-fun e!158364 () Bool)

(assert (=> b!244059 (= e!158379 e!158364)))

(declare-fun res!119666 () Bool)

(assert (=> b!244059 (=> (not res!119666) (not e!158364))))

(assert (=> b!244059 (= res!119666 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244060 () Bool)

(declare-fun res!119660 () Bool)

(assert (=> b!244060 (=> (not res!119660) (not e!158373))))

(assert (=> b!244060 (= res!119660 e!158379)))

(declare-fun res!119655 () Bool)

(assert (=> b!244060 (=> res!119655 e!158379)))

(declare-fun e!158372 () Bool)

(assert (=> b!244060 (= res!119655 e!158372)))

(declare-fun res!119664 () Bool)

(assert (=> b!244060 (=> (not res!119664) (not e!158372))))

(assert (=> b!244060 (= res!119664 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!244061 () Bool)

(declare-fun e!158370 () Bool)

(declare-fun e!158375 () Bool)

(assert (=> b!244061 (= e!158370 e!158375)))

(declare-fun res!119662 () Bool)

(declare-fun call!22754 () Bool)

(assert (=> b!244061 (= res!119662 call!22754)))

(assert (=> b!244061 (=> (not res!119662) (not e!158375))))

(declare-fun mapNonEmpty!10849 () Bool)

(declare-fun mapRes!10849 () Bool)

(declare-fun tp!22831 () Bool)

(declare-fun e!158363 () Bool)

(assert (=> mapNonEmpty!10849 (= mapRes!10849 (and tp!22831 e!158363))))

(declare-fun mapValue!10849 () ValueCell!2855)

(declare-fun mapKey!10849 () (_ BitVec 32))

(declare-fun mapRest!10849 () (Array (_ BitVec 32) ValueCell!2855))

(assert (=> mapNonEmpty!10849 (= (arr!5733 (_values!4505 thiss!1504)) (store mapRest!10849 mapKey!10849 mapValue!10849))))

(declare-fun b!244062 () Bool)

(declare-fun Unit!7527 () Unit!7525)

(assert (=> b!244062 (= e!158367 Unit!7527)))

(declare-fun b!244063 () Bool)

(declare-fun e!158371 () Unit!7525)

(declare-fun Unit!7528 () Unit!7525)

(assert (=> b!244063 (= e!158371 Unit!7528)))

(declare-fun lt!122259 () Unit!7525)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7525)

(assert (=> b!244063 (= lt!122259 (lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244063 false))

(declare-fun b!244064 () Bool)

(declare-datatypes ((List!3641 0))(
  ( (Nil!3638) (Cons!3637 (h!4294 (_ BitVec 64)) (t!8641 List!3641)) )
))
(declare-fun contains!1743 (List!3641 (_ BitVec 64)) Bool)

(assert (=> b!244064 (= e!158364 (not (contains!1743 Nil!3638 key!932)))))

(declare-fun b!244065 () Bool)

(get-info :version)

(assert (=> b!244065 (= e!158370 ((_ is Undefined!1077) lt!122261))))

(declare-fun b!244067 () Bool)

(assert (=> b!244067 (= e!158376 e!158377)))

(declare-fun res!119653 () Bool)

(assert (=> b!244067 (=> (not res!119653) (not e!158377))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244067 (= res!119653 (inRange!0 index!297 (mask!10620 thiss!1504)))))

(declare-fun lt!122257 () Unit!7525)

(assert (=> b!244067 (= lt!122257 e!158371)))

(declare-fun c!40736 () Bool)

(declare-datatypes ((tuple2!4740 0))(
  ( (tuple2!4741 (_1!2381 (_ BitVec 64)) (_2!2381 V!8177)) )
))
(declare-datatypes ((List!3642 0))(
  ( (Nil!3639) (Cons!3638 (h!4295 tuple2!4740) (t!8642 List!3642)) )
))
(declare-datatypes ((ListLongMap!3643 0))(
  ( (ListLongMap!3644 (toList!1837 List!3642)) )
))
(declare-fun contains!1744 (ListLongMap!3643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1346 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 32) Int) ListLongMap!3643)

(assert (=> b!244067 (= c!40736 (contains!1744 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932))))

(declare-fun b!244068 () Bool)

(declare-fun res!119661 () Bool)

(assert (=> b!244068 (= res!119661 (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6481 lt!122261)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244068 (=> (not res!119661) (not e!158375))))

(declare-fun mapIsEmpty!10849 () Bool)

(assert (=> mapIsEmpty!10849 mapRes!10849))

(declare-fun b!244069 () Bool)

(declare-fun lt!122258 () Unit!7525)

(assert (=> b!244069 (= e!158371 lt!122258)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7525)

(assert (=> b!244069 (= lt!122258 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(declare-fun c!40738 () Bool)

(assert (=> b!244069 (= c!40738 ((_ is MissingZero!1077) lt!122261))))

(declare-fun e!158380 () Bool)

(assert (=> b!244069 e!158380))

(declare-fun bm!22751 () Bool)

(declare-fun call!22755 () Bool)

(assert (=> bm!22751 (= call!22755 (arrayContainsKey!0 (_keys!6633 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244070 () Bool)

(declare-fun Unit!7529 () Unit!7525)

(assert (=> b!244070 (= e!158367 Unit!7529)))

(declare-fun lt!122260 () Unit!7525)

(declare-fun lemmaArrayContainsKeyThenInListMap!179 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) (_ BitVec 32) Int) Unit!7525)

(assert (=> b!244070 (= lt!122260 (lemmaArrayContainsKeyThenInListMap!179 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244070 false))

(declare-fun b!244071 () Bool)

(declare-fun res!119650 () Bool)

(assert (=> b!244071 (=> (not res!119650) (not e!158368))))

(assert (=> b!244071 (= res!119650 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244072 () Bool)

(declare-fun tp_is_empty!6397 () Bool)

(assert (=> b!244072 (= e!158363 tp_is_empty!6397)))

(declare-fun b!244073 () Bool)

(declare-fun res!119652 () Bool)

(assert (=> b!244073 (=> (not res!119652) (not e!158373))))

(declare-fun arrayNoDuplicates!0 (array!12081 (_ BitVec 32) List!3641) Bool)

(assert (=> b!244073 (= res!119652 (arrayNoDuplicates!0 (_keys!6633 thiss!1504) #b00000000000000000000000000000000 Nil!3638))))

(declare-fun b!244074 () Bool)

(declare-fun res!119663 () Bool)

(assert (=> b!244074 (=> (not res!119663) (not e!158373))))

(assert (=> b!244074 (= res!119663 (not (contains!1743 Nil!3638 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244075 () Bool)

(declare-fun res!119659 () Bool)

(assert (=> b!244075 (=> (not res!119659) (not e!158373))))

(declare-fun noDuplicate!100 (List!3641) Bool)

(assert (=> b!244075 (= res!119659 (noDuplicate!100 Nil!3638))))

(declare-fun b!244076 () Bool)

(declare-fun res!119665 () Bool)

(declare-fun e!158369 () Bool)

(assert (=> b!244076 (=> (not res!119665) (not e!158369))))

(assert (=> b!244076 (= res!119665 call!22754)))

(assert (=> b!244076 (= e!158380 e!158369)))

(declare-fun b!244077 () Bool)

(declare-fun c!40737 () Bool)

(assert (=> b!244077 (= c!40737 ((_ is MissingVacant!1077) lt!122261))))

(assert (=> b!244077 (= e!158380 e!158370)))

(declare-fun b!244078 () Bool)

(declare-fun res!119651 () Bool)

(assert (=> b!244078 (=> (not res!119651) (not e!158369))))

(assert (=> b!244078 (= res!119651 (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6478 lt!122261)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22752 () Bool)

(assert (=> bm!22752 (= call!22754 (inRange!0 (ite c!40738 (index!6478 lt!122261) (index!6481 lt!122261)) (mask!10620 thiss!1504)))))

(declare-fun b!244079 () Bool)

(assert (=> b!244079 (= e!158372 (contains!1743 Nil!3638 key!932))))

(declare-fun b!244080 () Bool)

(declare-fun res!119658 () Bool)

(assert (=> b!244080 (=> (not res!119658) (not e!158373))))

(assert (=> b!244080 (= res!119658 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6077 (_keys!6633 thiss!1504)))))))

(declare-fun b!244081 () Bool)

(declare-fun res!119657 () Bool)

(assert (=> b!244081 (=> (not res!119657) (not e!158373))))

(assert (=> b!244081 (= res!119657 (not (contains!1743 Nil!3638 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244082 () Bool)

(declare-fun e!158374 () Bool)

(assert (=> b!244082 (= e!158374 tp_is_empty!6397)))

(declare-fun res!119667 () Bool)

(assert (=> start!23256 (=> (not res!119667) (not e!158368))))

(declare-fun valid!1423 (LongMapFixedSize!3610) Bool)

(assert (=> start!23256 (= res!119667 (valid!1423 thiss!1504))))

(assert (=> start!23256 e!158368))

(declare-fun e!158365 () Bool)

(assert (=> start!23256 e!158365))

(assert (=> start!23256 true))

(declare-fun b!244066 () Bool)

(assert (=> b!244066 (= e!158369 (not call!22755))))

(declare-fun e!158366 () Bool)

(declare-fun array_inv!3783 (array!12081) Bool)

(declare-fun array_inv!3784 (array!12079) Bool)

(assert (=> b!244083 (= e!158365 (and tp!22830 tp_is_empty!6397 (array_inv!3783 (_keys!6633 thiss!1504)) (array_inv!3784 (_values!4505 thiss!1504)) e!158366))))

(declare-fun b!244084 () Bool)

(assert (=> b!244084 (= e!158375 (not call!22755))))

(declare-fun b!244085 () Bool)

(assert (=> b!244085 (= e!158366 (and e!158374 mapRes!10849))))

(declare-fun condMapEmpty!10849 () Bool)

(declare-fun mapDefault!10849 () ValueCell!2855)

(assert (=> b!244085 (= condMapEmpty!10849 (= (arr!5733 (_values!4505 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2855)) mapDefault!10849)))))

(declare-fun b!244086 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244086 (= e!158373 (not (validKeyInArray!0 key!932)))))

(assert (= (and start!23256 res!119667) b!244071))

(assert (= (and b!244071 res!119650) b!244058))

(assert (= (and b!244058 res!119656) b!244067))

(assert (= (and b!244067 c!40736) b!244063))

(assert (= (and b!244067 (not c!40736)) b!244069))

(assert (= (and b!244069 c!40738) b!244076))

(assert (= (and b!244069 (not c!40738)) b!244077))

(assert (= (and b!244076 res!119665) b!244078))

(assert (= (and b!244078 res!119651) b!244066))

(assert (= (and b!244077 c!40737) b!244061))

(assert (= (and b!244077 (not c!40737)) b!244065))

(assert (= (and b!244061 res!119662) b!244068))

(assert (= (and b!244068 res!119661) b!244084))

(assert (= (or b!244076 b!244061) bm!22752))

(assert (= (or b!244066 b!244084) bm!22751))

(assert (= (and b!244067 res!119653) b!244057))

(assert (= (and b!244057 c!40735) b!244070))

(assert (= (and b!244057 (not c!40735)) b!244062))

(assert (= (and b!244057 res!119654) b!244075))

(assert (= (and b!244075 res!119659) b!244081))

(assert (= (and b!244081 res!119657) b!244074))

(assert (= (and b!244074 res!119663) b!244060))

(assert (= (and b!244060 res!119664) b!244079))

(assert (= (and b!244060 (not res!119655)) b!244059))

(assert (= (and b!244059 res!119666) b!244064))

(assert (= (and b!244060 res!119660) b!244073))

(assert (= (and b!244073 res!119652) b!244080))

(assert (= (and b!244080 res!119658) b!244086))

(assert (= (and b!244085 condMapEmpty!10849) mapIsEmpty!10849))

(assert (= (and b!244085 (not condMapEmpty!10849)) mapNonEmpty!10849))

(assert (= (and mapNonEmpty!10849 ((_ is ValueCellFull!2855) mapValue!10849)) b!244072))

(assert (= (and b!244085 ((_ is ValueCellFull!2855) mapDefault!10849)) b!244082))

(assert (= b!244083 b!244085))

(assert (= start!23256 b!244083))

(declare-fun m!261665 () Bool)

(assert (=> b!244068 m!261665))

(declare-fun m!261667 () Bool)

(assert (=> b!244086 m!261667))

(declare-fun m!261669 () Bool)

(assert (=> b!244074 m!261669))

(declare-fun m!261671 () Bool)

(assert (=> bm!22752 m!261671))

(declare-fun m!261673 () Bool)

(assert (=> b!244079 m!261673))

(declare-fun m!261675 () Bool)

(assert (=> bm!22751 m!261675))

(declare-fun m!261677 () Bool)

(assert (=> b!244073 m!261677))

(declare-fun m!261679 () Bool)

(assert (=> b!244081 m!261679))

(declare-fun m!261681 () Bool)

(assert (=> b!244070 m!261681))

(declare-fun m!261683 () Bool)

(assert (=> b!244075 m!261683))

(declare-fun m!261685 () Bool)

(assert (=> b!244063 m!261685))

(declare-fun m!261687 () Bool)

(assert (=> mapNonEmpty!10849 m!261687))

(declare-fun m!261689 () Bool)

(assert (=> b!244083 m!261689))

(declare-fun m!261691 () Bool)

(assert (=> b!244083 m!261691))

(declare-fun m!261693 () Bool)

(assert (=> b!244067 m!261693))

(declare-fun m!261695 () Bool)

(assert (=> b!244067 m!261695))

(assert (=> b!244067 m!261695))

(declare-fun m!261697 () Bool)

(assert (=> b!244067 m!261697))

(declare-fun m!261699 () Bool)

(assert (=> b!244078 m!261699))

(assert (=> b!244057 m!261675))

(declare-fun m!261701 () Bool)

(assert (=> start!23256 m!261701))

(assert (=> b!244064 m!261673))

(declare-fun m!261703 () Bool)

(assert (=> b!244058 m!261703))

(declare-fun m!261705 () Bool)

(assert (=> b!244069 m!261705))

(check-sat (not bm!22751) (not b!244069) (not b!244073) (not b!244083) (not b!244074) (not b!244081) (not b_next!6535) (not b!244063) (not b!244057) (not b!244075) (not start!23256) (not b!244086) (not b!244070) (not bm!22752) b_and!13493 (not b!244064) tp_is_empty!6397 (not b!244058) (not b!244067) (not mapNonEmpty!10849) (not b!244079))
(check-sat b_and!13493 (not b_next!6535))
(get-model)

(declare-fun d!59959 () Bool)

(declare-fun lt!122300 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!162 (List!3641) (InoxSet (_ BitVec 64)))

(assert (=> d!59959 (= lt!122300 (select (content!162 Nil!3638) key!932))))

(declare-fun e!158493 () Bool)

(assert (=> d!59959 (= lt!122300 e!158493)))

(declare-fun res!119780 () Bool)

(assert (=> d!59959 (=> (not res!119780) (not e!158493))))

(assert (=> d!59959 (= res!119780 ((_ is Cons!3637) Nil!3638))))

(assert (=> d!59959 (= (contains!1743 Nil!3638 key!932) lt!122300)))

(declare-fun b!244271 () Bool)

(declare-fun e!158494 () Bool)

(assert (=> b!244271 (= e!158493 e!158494)))

(declare-fun res!119781 () Bool)

(assert (=> b!244271 (=> res!119781 e!158494)))

(assert (=> b!244271 (= res!119781 (= (h!4294 Nil!3638) key!932))))

(declare-fun b!244272 () Bool)

(assert (=> b!244272 (= e!158494 (contains!1743 (t!8641 Nil!3638) key!932))))

(assert (= (and d!59959 res!119780) b!244271))

(assert (= (and b!244271 (not res!119781)) b!244272))

(declare-fun m!261791 () Bool)

(assert (=> d!59959 m!261791))

(declare-fun m!261793 () Bool)

(assert (=> d!59959 m!261793))

(declare-fun m!261795 () Bool)

(assert (=> b!244272 m!261795))

(assert (=> b!244079 d!59959))

(declare-fun d!59961 () Bool)

(declare-fun res!119786 () Bool)

(declare-fun e!158499 () Bool)

(assert (=> d!59961 (=> res!119786 e!158499)))

(assert (=> d!59961 (= res!119786 (= (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59961 (= (arrayContainsKey!0 (_keys!6633 thiss!1504) key!932 #b00000000000000000000000000000000) e!158499)))

(declare-fun b!244277 () Bool)

(declare-fun e!158500 () Bool)

(assert (=> b!244277 (= e!158499 e!158500)))

(declare-fun res!119787 () Bool)

(assert (=> b!244277 (=> (not res!119787) (not e!158500))))

(assert (=> b!244277 (= res!119787 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6077 (_keys!6633 thiss!1504))))))

(declare-fun b!244278 () Bool)

(assert (=> b!244278 (= e!158500 (arrayContainsKey!0 (_keys!6633 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59961 (not res!119786)) b!244277))

(assert (= (and b!244277 res!119787) b!244278))

(declare-fun m!261797 () Bool)

(assert (=> d!59961 m!261797))

(declare-fun m!261799 () Bool)

(assert (=> b!244278 m!261799))

(assert (=> bm!22751 d!59961))

(declare-fun d!59963 () Bool)

(assert (=> d!59963 (= (inRange!0 (ite c!40738 (index!6478 lt!122261) (index!6481 lt!122261)) (mask!10620 thiss!1504)) (and (bvsge (ite c!40738 (index!6478 lt!122261) (index!6481 lt!122261)) #b00000000000000000000000000000000) (bvslt (ite c!40738 (index!6478 lt!122261) (index!6481 lt!122261)) (bvadd (mask!10620 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22752 d!59963))

(declare-fun d!59965 () Bool)

(declare-fun e!158512 () Bool)

(assert (=> d!59965 e!158512))

(declare-fun c!40768 () Bool)

(declare-fun lt!122305 () SeekEntryResult!1077)

(assert (=> d!59965 (= c!40768 ((_ is MissingZero!1077) lt!122305))))

(assert (=> d!59965 (= lt!122305 (seekEntryOrOpen!0 key!932 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)))))

(declare-fun lt!122306 () Unit!7525)

(declare-fun choose!1147 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7525)

(assert (=> d!59965 (= lt!122306 (choose!1147 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59965 (validMask!0 (mask!10620 thiss!1504))))

(assert (=> d!59965 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)) lt!122306)))

(declare-fun call!22772 () Bool)

(declare-fun bm!22769 () Bool)

(assert (=> bm!22769 (= call!22772 (inRange!0 (ite c!40768 (index!6478 lt!122305) (index!6481 lt!122305)) (mask!10620 thiss!1504)))))

(declare-fun b!244295 () Bool)

(declare-fun e!158510 () Bool)

(assert (=> b!244295 (= e!158512 e!158510)))

(declare-fun c!40767 () Bool)

(assert (=> b!244295 (= c!40767 ((_ is MissingVacant!1077) lt!122305))))

(declare-fun b!244296 () Bool)

(declare-fun e!158509 () Bool)

(assert (=> b!244296 (= e!158512 e!158509)))

(declare-fun res!119799 () Bool)

(assert (=> b!244296 (= res!119799 call!22772)))

(assert (=> b!244296 (=> (not res!119799) (not e!158509))))

(declare-fun b!244297 () Bool)

(assert (=> b!244297 (= e!158510 ((_ is Undefined!1077) lt!122305))))

(declare-fun b!244298 () Bool)

(assert (=> b!244298 (and (bvsge (index!6478 lt!122305) #b00000000000000000000000000000000) (bvslt (index!6478 lt!122305) (size!6077 (_keys!6633 thiss!1504))))))

(declare-fun res!119797 () Bool)

(assert (=> b!244298 (= res!119797 (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6478 lt!122305)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244298 (=> (not res!119797) (not e!158509))))

(declare-fun b!244299 () Bool)

(declare-fun call!22773 () Bool)

(assert (=> b!244299 (= e!158509 (not call!22773))))

(declare-fun bm!22770 () Bool)

(assert (=> bm!22770 (= call!22773 (arrayContainsKey!0 (_keys!6633 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244300 () Bool)

(declare-fun res!119796 () Bool)

(declare-fun e!158511 () Bool)

(assert (=> b!244300 (=> (not res!119796) (not e!158511))))

(assert (=> b!244300 (= res!119796 (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6481 lt!122305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244300 (and (bvsge (index!6481 lt!122305) #b00000000000000000000000000000000) (bvslt (index!6481 lt!122305) (size!6077 (_keys!6633 thiss!1504))))))

(declare-fun b!244301 () Bool)

(assert (=> b!244301 (= e!158511 (not call!22773))))

(declare-fun b!244302 () Bool)

(declare-fun res!119798 () Bool)

(assert (=> b!244302 (=> (not res!119798) (not e!158511))))

(assert (=> b!244302 (= res!119798 call!22772)))

(assert (=> b!244302 (= e!158510 e!158511)))

(assert (= (and d!59965 c!40768) b!244296))

(assert (= (and d!59965 (not c!40768)) b!244295))

(assert (= (and b!244296 res!119799) b!244298))

(assert (= (and b!244298 res!119797) b!244299))

(assert (= (and b!244295 c!40767) b!244302))

(assert (= (and b!244295 (not c!40767)) b!244297))

(assert (= (and b!244302 res!119798) b!244300))

(assert (= (and b!244300 res!119796) b!244301))

(assert (= (or b!244296 b!244302) bm!22769))

(assert (= (or b!244299 b!244301) bm!22770))

(declare-fun m!261801 () Bool)

(assert (=> bm!22769 m!261801))

(declare-fun m!261803 () Bool)

(assert (=> b!244298 m!261803))

(assert (=> bm!22770 m!261675))

(declare-fun m!261805 () Bool)

(assert (=> b!244300 m!261805))

(assert (=> d!59965 m!261703))

(declare-fun m!261807 () Bool)

(assert (=> d!59965 m!261807))

(declare-fun m!261809 () Bool)

(assert (=> d!59965 m!261809))

(assert (=> b!244069 d!59965))

(declare-fun d!59967 () Bool)

(declare-fun e!158515 () Bool)

(assert (=> d!59967 e!158515))

(declare-fun res!119804 () Bool)

(assert (=> d!59967 (=> (not res!119804) (not e!158515))))

(declare-fun lt!122312 () SeekEntryResult!1077)

(assert (=> d!59967 (= res!119804 ((_ is Found!1077) lt!122312))))

(assert (=> d!59967 (= lt!122312 (seekEntryOrOpen!0 key!932 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)))))

(declare-fun lt!122311 () Unit!7525)

(declare-fun choose!1148 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7525)

(assert (=> d!59967 (= lt!122311 (choose!1148 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> d!59967 (validMask!0 (mask!10620 thiss!1504))))

(assert (=> d!59967 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!371 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)) lt!122311)))

(declare-fun b!244307 () Bool)

(declare-fun res!119805 () Bool)

(assert (=> b!244307 (=> (not res!119805) (not e!158515))))

(assert (=> b!244307 (= res!119805 (inRange!0 (index!6479 lt!122312) (mask!10620 thiss!1504)))))

(declare-fun b!244308 () Bool)

(assert (=> b!244308 (= e!158515 (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6479 lt!122312)) key!932))))

(assert (=> b!244308 (and (bvsge (index!6479 lt!122312) #b00000000000000000000000000000000) (bvslt (index!6479 lt!122312) (size!6077 (_keys!6633 thiss!1504))))))

(assert (= (and d!59967 res!119804) b!244307))

(assert (= (and b!244307 res!119805) b!244308))

(assert (=> d!59967 m!261703))

(declare-fun m!261811 () Bool)

(assert (=> d!59967 m!261811))

(assert (=> d!59967 m!261809))

(declare-fun m!261813 () Bool)

(assert (=> b!244307 m!261813))

(declare-fun m!261815 () Bool)

(assert (=> b!244308 m!261815))

(assert (=> b!244063 d!59967))

(declare-fun d!59969 () Bool)

(declare-fun lt!122313 () Bool)

(assert (=> d!59969 (= lt!122313 (select (content!162 Nil!3638) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158516 () Bool)

(assert (=> d!59969 (= lt!122313 e!158516)))

(declare-fun res!119806 () Bool)

(assert (=> d!59969 (=> (not res!119806) (not e!158516))))

(assert (=> d!59969 (= res!119806 ((_ is Cons!3637) Nil!3638))))

(assert (=> d!59969 (= (contains!1743 Nil!3638 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122313)))

(declare-fun b!244309 () Bool)

(declare-fun e!158517 () Bool)

(assert (=> b!244309 (= e!158516 e!158517)))

(declare-fun res!119807 () Bool)

(assert (=> b!244309 (=> res!119807 e!158517)))

(assert (=> b!244309 (= res!119807 (= (h!4294 Nil!3638) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244310 () Bool)

(assert (=> b!244310 (= e!158517 (contains!1743 (t!8641 Nil!3638) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59969 res!119806) b!244309))

(assert (= (and b!244309 (not res!119807)) b!244310))

(assert (=> d!59969 m!261791))

(declare-fun m!261817 () Bool)

(assert (=> d!59969 m!261817))

(declare-fun m!261819 () Bool)

(assert (=> b!244310 m!261819))

(assert (=> b!244081 d!59969))

(declare-fun d!59971 () Bool)

(declare-fun res!119814 () Bool)

(declare-fun e!158520 () Bool)

(assert (=> d!59971 (=> (not res!119814) (not e!158520))))

(declare-fun simpleValid!251 (LongMapFixedSize!3610) Bool)

(assert (=> d!59971 (= res!119814 (simpleValid!251 thiss!1504))))

(assert (=> d!59971 (= (valid!1423 thiss!1504) e!158520)))

(declare-fun b!244317 () Bool)

(declare-fun res!119815 () Bool)

(assert (=> b!244317 (=> (not res!119815) (not e!158520))))

(declare-fun arrayCountValidKeys!0 (array!12081 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!244317 (= res!119815 (= (arrayCountValidKeys!0 (_keys!6633 thiss!1504) #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))) (_size!1854 thiss!1504)))))

(declare-fun b!244318 () Bool)

(declare-fun res!119816 () Bool)

(assert (=> b!244318 (=> (not res!119816) (not e!158520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12081 (_ BitVec 32)) Bool)

(assert (=> b!244318 (= res!119816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)))))

(declare-fun b!244319 () Bool)

(assert (=> b!244319 (= e!158520 (arrayNoDuplicates!0 (_keys!6633 thiss!1504) #b00000000000000000000000000000000 Nil!3638))))

(assert (= (and d!59971 res!119814) b!244317))

(assert (= (and b!244317 res!119815) b!244318))

(assert (= (and b!244318 res!119816) b!244319))

(declare-fun m!261821 () Bool)

(assert (=> d!59971 m!261821))

(declare-fun m!261823 () Bool)

(assert (=> b!244317 m!261823))

(declare-fun m!261825 () Bool)

(assert (=> b!244318 m!261825))

(assert (=> b!244319 m!261677))

(assert (=> start!23256 d!59971))

(declare-fun d!59973 () Bool)

(assert (=> d!59973 (contains!1744 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932)))

(declare-fun lt!122316 () Unit!7525)

(declare-fun choose!1149 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) (_ BitVec 32) Int) Unit!7525)

(assert (=> d!59973 (= lt!122316 (choose!1149 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(assert (=> d!59973 (validMask!0 (mask!10620 thiss!1504))))

(assert (=> d!59973 (= (lemmaArrayContainsKeyThenInListMap!179 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) lt!122316)))

(declare-fun bs!8855 () Bool)

(assert (= bs!8855 d!59973))

(assert (=> bs!8855 m!261695))

(assert (=> bs!8855 m!261695))

(assert (=> bs!8855 m!261697))

(declare-fun m!261827 () Bool)

(assert (=> bs!8855 m!261827))

(assert (=> bs!8855 m!261809))

(assert (=> b!244070 d!59973))

(declare-fun d!59975 () Bool)

(declare-fun res!119821 () Bool)

(declare-fun e!158525 () Bool)

(assert (=> d!59975 (=> res!119821 e!158525)))

(assert (=> d!59975 (= res!119821 ((_ is Nil!3638) Nil!3638))))

(assert (=> d!59975 (= (noDuplicate!100 Nil!3638) e!158525)))

(declare-fun b!244324 () Bool)

(declare-fun e!158526 () Bool)

(assert (=> b!244324 (= e!158525 e!158526)))

(declare-fun res!119822 () Bool)

(assert (=> b!244324 (=> (not res!119822) (not e!158526))))

(assert (=> b!244324 (= res!119822 (not (contains!1743 (t!8641 Nil!3638) (h!4294 Nil!3638))))))

(declare-fun b!244325 () Bool)

(assert (=> b!244325 (= e!158526 (noDuplicate!100 (t!8641 Nil!3638)))))

(assert (= (and d!59975 (not res!119821)) b!244324))

(assert (= (and b!244324 res!119822) b!244325))

(declare-fun m!261829 () Bool)

(assert (=> b!244324 m!261829))

(declare-fun m!261831 () Bool)

(assert (=> b!244325 m!261831))

(assert (=> b!244075 d!59975))

(declare-fun d!59977 () Bool)

(declare-fun lt!122317 () Bool)

(assert (=> d!59977 (= lt!122317 (select (content!162 Nil!3638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158527 () Bool)

(assert (=> d!59977 (= lt!122317 e!158527)))

(declare-fun res!119823 () Bool)

(assert (=> d!59977 (=> (not res!119823) (not e!158527))))

(assert (=> d!59977 (= res!119823 ((_ is Cons!3637) Nil!3638))))

(assert (=> d!59977 (= (contains!1743 Nil!3638 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122317)))

(declare-fun b!244326 () Bool)

(declare-fun e!158528 () Bool)

(assert (=> b!244326 (= e!158527 e!158528)))

(declare-fun res!119824 () Bool)

(assert (=> b!244326 (=> res!119824 e!158528)))

(assert (=> b!244326 (= res!119824 (= (h!4294 Nil!3638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244327 () Bool)

(assert (=> b!244327 (= e!158528 (contains!1743 (t!8641 Nil!3638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59977 res!119823) b!244326))

(assert (= (and b!244326 (not res!119824)) b!244327))

(assert (=> d!59977 m!261791))

(declare-fun m!261833 () Bool)

(assert (=> d!59977 m!261833))

(declare-fun m!261835 () Bool)

(assert (=> b!244327 m!261835))

(assert (=> b!244074 d!59977))

(declare-fun d!59979 () Bool)

(assert (=> d!59979 (= (array_inv!3783 (_keys!6633 thiss!1504)) (bvsge (size!6077 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244083 d!59979))

(declare-fun d!59981 () Bool)

(assert (=> d!59981 (= (array_inv!3784 (_values!4505 thiss!1504)) (bvsge (size!6076 (_values!4505 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244083 d!59981))

(declare-fun d!59983 () Bool)

(declare-fun res!119832 () Bool)

(declare-fun e!158539 () Bool)

(assert (=> d!59983 (=> res!119832 e!158539)))

(assert (=> d!59983 (= res!119832 (bvsge #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))))))

(assert (=> d!59983 (= (arrayNoDuplicates!0 (_keys!6633 thiss!1504) #b00000000000000000000000000000000 Nil!3638) e!158539)))

(declare-fun b!244338 () Bool)

(declare-fun e!158538 () Bool)

(assert (=> b!244338 (= e!158538 (contains!1743 Nil!3638 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22773 () Bool)

(declare-fun call!22776 () Bool)

(declare-fun c!40771 () Bool)

(assert (=> bm!22773 (= call!22776 (arrayNoDuplicates!0 (_keys!6633 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40771 (Cons!3637 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000) Nil!3638) Nil!3638)))))

(declare-fun b!244339 () Bool)

(declare-fun e!158540 () Bool)

(assert (=> b!244339 (= e!158540 call!22776)))

(declare-fun b!244340 () Bool)

(assert (=> b!244340 (= e!158540 call!22776)))

(declare-fun b!244341 () Bool)

(declare-fun e!158537 () Bool)

(assert (=> b!244341 (= e!158537 e!158540)))

(assert (=> b!244341 (= c!40771 (validKeyInArray!0 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244342 () Bool)

(assert (=> b!244342 (= e!158539 e!158537)))

(declare-fun res!119831 () Bool)

(assert (=> b!244342 (=> (not res!119831) (not e!158537))))

(assert (=> b!244342 (= res!119831 (not e!158538))))

(declare-fun res!119833 () Bool)

(assert (=> b!244342 (=> (not res!119833) (not e!158538))))

(assert (=> b!244342 (= res!119833 (validKeyInArray!0 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59983 (not res!119832)) b!244342))

(assert (= (and b!244342 res!119833) b!244338))

(assert (= (and b!244342 res!119831) b!244341))

(assert (= (and b!244341 c!40771) b!244339))

(assert (= (and b!244341 (not c!40771)) b!244340))

(assert (= (or b!244339 b!244340) bm!22773))

(assert (=> b!244338 m!261797))

(assert (=> b!244338 m!261797))

(declare-fun m!261837 () Bool)

(assert (=> b!244338 m!261837))

(assert (=> bm!22773 m!261797))

(declare-fun m!261839 () Bool)

(assert (=> bm!22773 m!261839))

(assert (=> b!244341 m!261797))

(assert (=> b!244341 m!261797))

(declare-fun m!261841 () Bool)

(assert (=> b!244341 m!261841))

(assert (=> b!244342 m!261797))

(assert (=> b!244342 m!261797))

(assert (=> b!244342 m!261841))

(assert (=> b!244073 d!59983))

(assert (=> b!244064 d!59959))

(declare-fun d!59985 () Bool)

(assert (=> d!59985 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244086 d!59985))

(declare-fun b!244355 () Bool)

(declare-fun e!158548 () SeekEntryResult!1077)

(declare-fun lt!122326 () SeekEntryResult!1077)

(assert (=> b!244355 (= e!158548 (MissingZero!1077 (index!6480 lt!122326)))))

(declare-fun b!244356 () Bool)

(declare-fun e!158547 () SeekEntryResult!1077)

(declare-fun e!158549 () SeekEntryResult!1077)

(assert (=> b!244356 (= e!158547 e!158549)))

(declare-fun lt!122325 () (_ BitVec 64))

(assert (=> b!244356 (= lt!122325 (select (arr!5734 (_keys!6633 thiss!1504)) (index!6480 lt!122326)))))

(declare-fun c!40778 () Bool)

(assert (=> b!244356 (= c!40778 (= lt!122325 key!932))))

(declare-fun d!59987 () Bool)

(declare-fun lt!122324 () SeekEntryResult!1077)

(assert (=> d!59987 (and (or ((_ is Undefined!1077) lt!122324) (not ((_ is Found!1077) lt!122324)) (and (bvsge (index!6479 lt!122324) #b00000000000000000000000000000000) (bvslt (index!6479 lt!122324) (size!6077 (_keys!6633 thiss!1504))))) (or ((_ is Undefined!1077) lt!122324) ((_ is Found!1077) lt!122324) (not ((_ is MissingZero!1077) lt!122324)) (and (bvsge (index!6478 lt!122324) #b00000000000000000000000000000000) (bvslt (index!6478 lt!122324) (size!6077 (_keys!6633 thiss!1504))))) (or ((_ is Undefined!1077) lt!122324) ((_ is Found!1077) lt!122324) ((_ is MissingZero!1077) lt!122324) (not ((_ is MissingVacant!1077) lt!122324)) (and (bvsge (index!6481 lt!122324) #b00000000000000000000000000000000) (bvslt (index!6481 lt!122324) (size!6077 (_keys!6633 thiss!1504))))) (or ((_ is Undefined!1077) lt!122324) (ite ((_ is Found!1077) lt!122324) (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6479 lt!122324)) key!932) (ite ((_ is MissingZero!1077) lt!122324) (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6478 lt!122324)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1077) lt!122324) (= (select (arr!5734 (_keys!6633 thiss!1504)) (index!6481 lt!122324)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59987 (= lt!122324 e!158547)))

(declare-fun c!40780 () Bool)

(assert (=> d!59987 (= c!40780 (and ((_ is Intermediate!1077) lt!122326) (undefined!1889 lt!122326)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12081 (_ BitVec 32)) SeekEntryResult!1077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59987 (= lt!122326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10620 thiss!1504)) key!932 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)))))

(assert (=> d!59987 (validMask!0 (mask!10620 thiss!1504))))

(assert (=> d!59987 (= (seekEntryOrOpen!0 key!932 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)) lt!122324)))

(declare-fun b!244357 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12081 (_ BitVec 32)) SeekEntryResult!1077)

(assert (=> b!244357 (= e!158548 (seekKeyOrZeroReturnVacant!0 (x!24362 lt!122326) (index!6480 lt!122326) (index!6480 lt!122326) key!932 (_keys!6633 thiss!1504) (mask!10620 thiss!1504)))))

(declare-fun b!244358 () Bool)

(declare-fun c!40779 () Bool)

(assert (=> b!244358 (= c!40779 (= lt!122325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244358 (= e!158549 e!158548)))

(declare-fun b!244359 () Bool)

(assert (=> b!244359 (= e!158549 (Found!1077 (index!6480 lt!122326)))))

(declare-fun b!244360 () Bool)

(assert (=> b!244360 (= e!158547 Undefined!1077)))

(assert (= (and d!59987 c!40780) b!244360))

(assert (= (and d!59987 (not c!40780)) b!244356))

(assert (= (and b!244356 c!40778) b!244359))

(assert (= (and b!244356 (not c!40778)) b!244358))

(assert (= (and b!244358 c!40779) b!244355))

(assert (= (and b!244358 (not c!40779)) b!244357))

(declare-fun m!261843 () Bool)

(assert (=> b!244356 m!261843))

(declare-fun m!261845 () Bool)

(assert (=> d!59987 m!261845))

(declare-fun m!261847 () Bool)

(assert (=> d!59987 m!261847))

(declare-fun m!261849 () Bool)

(assert (=> d!59987 m!261849))

(assert (=> d!59987 m!261809))

(declare-fun m!261851 () Bool)

(assert (=> d!59987 m!261851))

(assert (=> d!59987 m!261851))

(declare-fun m!261853 () Bool)

(assert (=> d!59987 m!261853))

(declare-fun m!261855 () Bool)

(assert (=> b!244357 m!261855))

(assert (=> b!244058 d!59987))

(declare-fun d!59989 () Bool)

(assert (=> d!59989 (= (inRange!0 index!297 (mask!10620 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10620 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!244067 d!59989))

(declare-fun d!59991 () Bool)

(declare-fun e!158555 () Bool)

(assert (=> d!59991 e!158555))

(declare-fun res!119836 () Bool)

(assert (=> d!59991 (=> res!119836 e!158555)))

(declare-fun lt!122336 () Bool)

(assert (=> d!59991 (= res!119836 (not lt!122336))))

(declare-fun lt!122335 () Bool)

(assert (=> d!59991 (= lt!122336 lt!122335)))

(declare-fun lt!122338 () Unit!7525)

(declare-fun e!158554 () Unit!7525)

(assert (=> d!59991 (= lt!122338 e!158554)))

(declare-fun c!40783 () Bool)

(assert (=> d!59991 (= c!40783 lt!122335)))

(declare-fun containsKey!276 (List!3642 (_ BitVec 64)) Bool)

(assert (=> d!59991 (= lt!122335 (containsKey!276 (toList!1837 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932))))

(assert (=> d!59991 (= (contains!1744 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932) lt!122336)))

(declare-fun b!244367 () Bool)

(declare-fun lt!122337 () Unit!7525)

(assert (=> b!244367 (= e!158554 lt!122337)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!225 (List!3642 (_ BitVec 64)) Unit!7525)

(assert (=> b!244367 (= lt!122337 (lemmaContainsKeyImpliesGetValueByKeyDefined!225 (toList!1837 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932))))

(declare-datatypes ((Option!290 0))(
  ( (Some!289 (v!5290 V!8177)) (None!288) )
))
(declare-fun isDefined!226 (Option!290) Bool)

(declare-fun getValueByKey!284 (List!3642 (_ BitVec 64)) Option!290)

(assert (=> b!244367 (isDefined!226 (getValueByKey!284 (toList!1837 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932))))

(declare-fun b!244368 () Bool)

(declare-fun Unit!7537 () Unit!7525)

(assert (=> b!244368 (= e!158554 Unit!7537)))

(declare-fun b!244369 () Bool)

(assert (=> b!244369 (= e!158555 (isDefined!226 (getValueByKey!284 (toList!1837 (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932)))))

(assert (= (and d!59991 c!40783) b!244367))

(assert (= (and d!59991 (not c!40783)) b!244368))

(assert (= (and d!59991 (not res!119836)) b!244369))

(declare-fun m!261857 () Bool)

(assert (=> d!59991 m!261857))

(declare-fun m!261859 () Bool)

(assert (=> b!244367 m!261859))

(declare-fun m!261861 () Bool)

(assert (=> b!244367 m!261861))

(assert (=> b!244367 m!261861))

(declare-fun m!261863 () Bool)

(assert (=> b!244367 m!261863))

(assert (=> b!244369 m!261861))

(assert (=> b!244369 m!261861))

(assert (=> b!244369 m!261863))

(assert (=> b!244067 d!59991))

(declare-fun b!244412 () Bool)

(declare-fun e!158588 () Bool)

(declare-fun call!22792 () Bool)

(assert (=> b!244412 (= e!158588 (not call!22792))))

(declare-fun b!244413 () Bool)

(declare-fun e!158589 () Unit!7525)

(declare-fun lt!122401 () Unit!7525)

(assert (=> b!244413 (= e!158589 lt!122401)))

(declare-fun lt!122390 () ListLongMap!3643)

(declare-fun getCurrentListMapNoExtraKeys!544 (array!12081 array!12079 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 32) Int) ListLongMap!3643)

(assert (=> b!244413 (= lt!122390 (getCurrentListMapNoExtraKeys!544 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122388 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122399 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122399 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122387 () Unit!7525)

(declare-fun addStillContains!204 (ListLongMap!3643 (_ BitVec 64) V!8177 (_ BitVec 64)) Unit!7525)

(assert (=> b!244413 (= lt!122387 (addStillContains!204 lt!122390 lt!122388 (zeroValue!4363 thiss!1504) lt!122399))))

(declare-fun +!661 (ListLongMap!3643 tuple2!4740) ListLongMap!3643)

(assert (=> b!244413 (contains!1744 (+!661 lt!122390 (tuple2!4741 lt!122388 (zeroValue!4363 thiss!1504))) lt!122399)))

(declare-fun lt!122396 () Unit!7525)

(assert (=> b!244413 (= lt!122396 lt!122387)))

(declare-fun lt!122404 () ListLongMap!3643)

(assert (=> b!244413 (= lt!122404 (getCurrentListMapNoExtraKeys!544 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122395 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122392 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122392 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122398 () Unit!7525)

(declare-fun addApplyDifferent!204 (ListLongMap!3643 (_ BitVec 64) V!8177 (_ BitVec 64)) Unit!7525)

(assert (=> b!244413 (= lt!122398 (addApplyDifferent!204 lt!122404 lt!122395 (minValue!4363 thiss!1504) lt!122392))))

(declare-fun apply!228 (ListLongMap!3643 (_ BitVec 64)) V!8177)

(assert (=> b!244413 (= (apply!228 (+!661 lt!122404 (tuple2!4741 lt!122395 (minValue!4363 thiss!1504))) lt!122392) (apply!228 lt!122404 lt!122392))))

(declare-fun lt!122394 () Unit!7525)

(assert (=> b!244413 (= lt!122394 lt!122398)))

(declare-fun lt!122402 () ListLongMap!3643)

(assert (=> b!244413 (= lt!122402 (getCurrentListMapNoExtraKeys!544 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122397 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122403 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122403 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122393 () Unit!7525)

(assert (=> b!244413 (= lt!122393 (addApplyDifferent!204 lt!122402 lt!122397 (zeroValue!4363 thiss!1504) lt!122403))))

(assert (=> b!244413 (= (apply!228 (+!661 lt!122402 (tuple2!4741 lt!122397 (zeroValue!4363 thiss!1504))) lt!122403) (apply!228 lt!122402 lt!122403))))

(declare-fun lt!122384 () Unit!7525)

(assert (=> b!244413 (= lt!122384 lt!122393)))

(declare-fun lt!122389 () ListLongMap!3643)

(assert (=> b!244413 (= lt!122389 (getCurrentListMapNoExtraKeys!544 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122385 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122386 () (_ BitVec 64))

(assert (=> b!244413 (= lt!122386 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244413 (= lt!122401 (addApplyDifferent!204 lt!122389 lt!122385 (minValue!4363 thiss!1504) lt!122386))))

(assert (=> b!244413 (= (apply!228 (+!661 lt!122389 (tuple2!4741 lt!122385 (minValue!4363 thiss!1504))) lt!122386) (apply!228 lt!122389 lt!122386))))

(declare-fun b!244414 () Bool)

(declare-fun c!40797 () Bool)

(assert (=> b!244414 (= c!40797 (and (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!158587 () ListLongMap!3643)

(declare-fun e!158593 () ListLongMap!3643)

(assert (=> b!244414 (= e!158587 e!158593)))

(declare-fun bm!22788 () Bool)

(declare-fun call!22796 () Bool)

(declare-fun lt!122391 () ListLongMap!3643)

(assert (=> bm!22788 (= call!22796 (contains!1744 lt!122391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244415 () Bool)

(declare-fun e!158583 () ListLongMap!3643)

(assert (=> b!244415 (= e!158583 e!158587)))

(declare-fun c!40799 () Bool)

(assert (=> b!244415 (= c!40799 (and (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!40800 () Bool)

(declare-fun call!22791 () ListLongMap!3643)

(declare-fun call!22797 () ListLongMap!3643)

(declare-fun bm!22790 () Bool)

(declare-fun call!22793 () ListLongMap!3643)

(declare-fun call!22795 () ListLongMap!3643)

(assert (=> bm!22790 (= call!22797 (+!661 (ite c!40800 call!22795 (ite c!40799 call!22793 call!22791)) (ite (or c!40800 c!40799) (tuple2!4741 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4363 thiss!1504)) (tuple2!4741 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4363 thiss!1504)))))))

(declare-fun bm!22791 () Bool)

(assert (=> bm!22791 (= call!22795 (getCurrentListMapNoExtraKeys!544 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun b!244416 () Bool)

(declare-fun e!158582 () Bool)

(declare-fun e!158594 () Bool)

(assert (=> b!244416 (= e!158582 e!158594)))

(declare-fun res!119855 () Bool)

(assert (=> b!244416 (=> (not res!119855) (not e!158594))))

(assert (=> b!244416 (= res!119855 (contains!1744 lt!122391 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!244416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))))))

(declare-fun b!244417 () Bool)

(declare-fun Unit!7538 () Unit!7525)

(assert (=> b!244417 (= e!158589 Unit!7538)))

(declare-fun b!244418 () Bool)

(declare-fun e!158592 () Bool)

(declare-fun e!158584 () Bool)

(assert (=> b!244418 (= e!158592 e!158584)))

(declare-fun res!119857 () Bool)

(assert (=> b!244418 (= res!119857 call!22796)))

(assert (=> b!244418 (=> (not res!119857) (not e!158584))))

(declare-fun b!244419 () Bool)

(declare-fun e!158585 () Bool)

(assert (=> b!244419 (= e!158585 (= (apply!228 lt!122391 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4363 thiss!1504)))))

(declare-fun b!244420 () Bool)

(assert (=> b!244420 (= e!158588 e!158585)))

(declare-fun res!119861 () Bool)

(assert (=> b!244420 (= res!119861 call!22792)))

(assert (=> b!244420 (=> (not res!119861) (not e!158585))))

(declare-fun b!244421 () Bool)

(declare-fun res!119859 () Bool)

(declare-fun e!158586 () Bool)

(assert (=> b!244421 (=> (not res!119859) (not e!158586))))

(assert (=> b!244421 (= res!119859 e!158582)))

(declare-fun res!119863 () Bool)

(assert (=> b!244421 (=> res!119863 e!158582)))

(declare-fun e!158591 () Bool)

(assert (=> b!244421 (= res!119863 (not e!158591))))

(declare-fun res!119856 () Bool)

(assert (=> b!244421 (=> (not res!119856) (not e!158591))))

(assert (=> b!244421 (= res!119856 (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))))))

(declare-fun b!244422 () Bool)

(declare-fun e!158590 () Bool)

(assert (=> b!244422 (= e!158590 (validKeyInArray!0 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244423 () Bool)

(assert (=> b!244423 (= e!158583 (+!661 call!22797 (tuple2!4741 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4363 thiss!1504))))))

(declare-fun b!244424 () Bool)

(declare-fun res!119862 () Bool)

(assert (=> b!244424 (=> (not res!119862) (not e!158586))))

(assert (=> b!244424 (= res!119862 e!158592)))

(declare-fun c!40796 () Bool)

(assert (=> b!244424 (= c!40796 (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22792 () Bool)

(declare-fun call!22794 () ListLongMap!3643)

(assert (=> bm!22792 (= call!22794 call!22797)))

(declare-fun b!244425 () Bool)

(assert (=> b!244425 (= e!158586 e!158588)))

(declare-fun c!40801 () Bool)

(assert (=> b!244425 (= c!40801 (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244426 () Bool)

(assert (=> b!244426 (= e!158584 (= (apply!228 lt!122391 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4363 thiss!1504)))))

(declare-fun b!244427 () Bool)

(declare-fun get!2940 (ValueCell!2855 V!8177) V!8177)

(declare-fun dynLambda!562 (Int (_ BitVec 64)) V!8177)

(assert (=> b!244427 (= e!158594 (= (apply!228 lt!122391 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)) (get!2940 (select (arr!5733 (_values!4505 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!562 (defaultEntry!4522 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6076 (_values!4505 thiss!1504))))))

(assert (=> b!244427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))))))

(declare-fun b!244428 () Bool)

(assert (=> b!244428 (= e!158591 (validKeyInArray!0 (select (arr!5734 (_keys!6633 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22793 () Bool)

(assert (=> bm!22793 (= call!22792 (contains!1744 lt!122391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22794 () Bool)

(assert (=> bm!22794 (= call!22791 call!22793)))

(declare-fun bm!22789 () Bool)

(assert (=> bm!22789 (= call!22793 call!22795)))

(declare-fun d!59993 () Bool)

(assert (=> d!59993 e!158586))

(declare-fun res!119858 () Bool)

(assert (=> d!59993 (=> (not res!119858) (not e!158586))))

(assert (=> d!59993 (= res!119858 (or (bvsge #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))))))))

(declare-fun lt!122383 () ListLongMap!3643)

(assert (=> d!59993 (= lt!122391 lt!122383)))

(declare-fun lt!122400 () Unit!7525)

(assert (=> d!59993 (= lt!122400 e!158589)))

(declare-fun c!40798 () Bool)

(assert (=> d!59993 (= c!40798 e!158590)))

(declare-fun res!119860 () Bool)

(assert (=> d!59993 (=> (not res!119860) (not e!158590))))

(assert (=> d!59993 (= res!119860 (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6633 thiss!1504))))))

(assert (=> d!59993 (= lt!122383 e!158583)))

(assert (=> d!59993 (= c!40800 (and (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59993 (validMask!0 (mask!10620 thiss!1504))))

(assert (=> d!59993 (= (getCurrentListMap!1346 (_keys!6633 thiss!1504) (_values!4505 thiss!1504) (mask!10620 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) lt!122391)))

(declare-fun b!244429 () Bool)

(assert (=> b!244429 (= e!158593 call!22791)))

(declare-fun b!244430 () Bool)

(assert (=> b!244430 (= e!158592 (not call!22796))))

(declare-fun b!244431 () Bool)

(assert (=> b!244431 (= e!158593 call!22794)))

(declare-fun b!244432 () Bool)

(assert (=> b!244432 (= e!158587 call!22794)))

(assert (= (and d!59993 c!40800) b!244423))

(assert (= (and d!59993 (not c!40800)) b!244415))

(assert (= (and b!244415 c!40799) b!244432))

(assert (= (and b!244415 (not c!40799)) b!244414))

(assert (= (and b!244414 c!40797) b!244431))

(assert (= (and b!244414 (not c!40797)) b!244429))

(assert (= (or b!244431 b!244429) bm!22794))

(assert (= (or b!244432 bm!22794) bm!22789))

(assert (= (or b!244432 b!244431) bm!22792))

(assert (= (or b!244423 bm!22789) bm!22791))

(assert (= (or b!244423 bm!22792) bm!22790))

(assert (= (and d!59993 res!119860) b!244422))

(assert (= (and d!59993 c!40798) b!244413))

(assert (= (and d!59993 (not c!40798)) b!244417))

(assert (= (and d!59993 res!119858) b!244421))

(assert (= (and b!244421 res!119856) b!244428))

(assert (= (and b!244421 (not res!119863)) b!244416))

(assert (= (and b!244416 res!119855) b!244427))

(assert (= (and b!244421 res!119859) b!244424))

(assert (= (and b!244424 c!40796) b!244418))

(assert (= (and b!244424 (not c!40796)) b!244430))

(assert (= (and b!244418 res!119857) b!244426))

(assert (= (or b!244418 b!244430) bm!22788))

(assert (= (and b!244424 res!119862) b!244425))

(assert (= (and b!244425 c!40801) b!244420))

(assert (= (and b!244425 (not c!40801)) b!244412))

(assert (= (and b!244420 res!119861) b!244419))

(assert (= (or b!244420 b!244412) bm!22793))

(declare-fun b_lambda!7997 () Bool)

(assert (=> (not b_lambda!7997) (not b!244427)))

(declare-fun t!8647 () Bool)

(declare-fun tb!2961 () Bool)

(assert (=> (and b!244083 (= (defaultEntry!4522 thiss!1504) (defaultEntry!4522 thiss!1504)) t!8647) tb!2961))

(declare-fun result!5221 () Bool)

(assert (=> tb!2961 (= result!5221 tp_is_empty!6397)))

(assert (=> b!244427 t!8647))

(declare-fun b_and!13499 () Bool)

(assert (= b_and!13493 (and (=> t!8647 result!5221) b_and!13499)))

(declare-fun m!261865 () Bool)

(assert (=> b!244426 m!261865))

(assert (=> b!244428 m!261797))

(assert (=> b!244428 m!261797))

(assert (=> b!244428 m!261841))

(assert (=> b!244427 m!261797))

(declare-fun m!261867 () Bool)

(assert (=> b!244427 m!261867))

(declare-fun m!261869 () Bool)

(assert (=> b!244427 m!261869))

(declare-fun m!261871 () Bool)

(assert (=> b!244427 m!261871))

(assert (=> b!244427 m!261871))

(assert (=> b!244427 m!261869))

(declare-fun m!261873 () Bool)

(assert (=> b!244427 m!261873))

(assert (=> b!244427 m!261797))

(declare-fun m!261875 () Bool)

(assert (=> b!244413 m!261875))

(declare-fun m!261877 () Bool)

(assert (=> b!244413 m!261877))

(declare-fun m!261879 () Bool)

(assert (=> b!244413 m!261879))

(declare-fun m!261881 () Bool)

(assert (=> b!244413 m!261881))

(declare-fun m!261883 () Bool)

(assert (=> b!244413 m!261883))

(declare-fun m!261885 () Bool)

(assert (=> b!244413 m!261885))

(declare-fun m!261887 () Bool)

(assert (=> b!244413 m!261887))

(declare-fun m!261889 () Bool)

(assert (=> b!244413 m!261889))

(assert (=> b!244413 m!261797))

(declare-fun m!261891 () Bool)

(assert (=> b!244413 m!261891))

(declare-fun m!261893 () Bool)

(assert (=> b!244413 m!261893))

(declare-fun m!261895 () Bool)

(assert (=> b!244413 m!261895))

(declare-fun m!261897 () Bool)

(assert (=> b!244413 m!261897))

(declare-fun m!261899 () Bool)

(assert (=> b!244413 m!261899))

(declare-fun m!261901 () Bool)

(assert (=> b!244413 m!261901))

(assert (=> b!244413 m!261901))

(declare-fun m!261903 () Bool)

(assert (=> b!244413 m!261903))

(declare-fun m!261905 () Bool)

(assert (=> b!244413 m!261905))

(assert (=> b!244413 m!261877))

(assert (=> b!244413 m!261895))

(assert (=> b!244413 m!261891))

(assert (=> b!244422 m!261797))

(assert (=> b!244422 m!261797))

(assert (=> b!244422 m!261841))

(declare-fun m!261907 () Bool)

(assert (=> bm!22790 m!261907))

(declare-fun m!261909 () Bool)

(assert (=> bm!22793 m!261909))

(declare-fun m!261911 () Bool)

(assert (=> b!244419 m!261911))

(assert (=> bm!22791 m!261899))

(assert (=> b!244416 m!261797))

(assert (=> b!244416 m!261797))

(declare-fun m!261913 () Bool)

(assert (=> b!244416 m!261913))

(assert (=> d!59993 m!261809))

(declare-fun m!261915 () Bool)

(assert (=> b!244423 m!261915))

(declare-fun m!261917 () Bool)

(assert (=> bm!22788 m!261917))

(assert (=> b!244067 d!59993))

(assert (=> b!244057 d!59961))

(declare-fun b!244442 () Bool)

(declare-fun e!158600 () Bool)

(assert (=> b!244442 (= e!158600 tp_is_empty!6397)))

(declare-fun mapNonEmpty!10858 () Bool)

(declare-fun mapRes!10858 () Bool)

(declare-fun tp!22846 () Bool)

(declare-fun e!158599 () Bool)

(assert (=> mapNonEmpty!10858 (= mapRes!10858 (and tp!22846 e!158599))))

(declare-fun mapRest!10858 () (Array (_ BitVec 32) ValueCell!2855))

(declare-fun mapKey!10858 () (_ BitVec 32))

(declare-fun mapValue!10858 () ValueCell!2855)

(assert (=> mapNonEmpty!10858 (= mapRest!10849 (store mapRest!10858 mapKey!10858 mapValue!10858))))

(declare-fun mapIsEmpty!10858 () Bool)

(assert (=> mapIsEmpty!10858 mapRes!10858))

(declare-fun b!244441 () Bool)

(assert (=> b!244441 (= e!158599 tp_is_empty!6397)))

(declare-fun condMapEmpty!10858 () Bool)

(declare-fun mapDefault!10858 () ValueCell!2855)

(assert (=> mapNonEmpty!10849 (= condMapEmpty!10858 (= mapRest!10849 ((as const (Array (_ BitVec 32) ValueCell!2855)) mapDefault!10858)))))

(assert (=> mapNonEmpty!10849 (= tp!22831 (and e!158600 mapRes!10858))))

(assert (= (and mapNonEmpty!10849 condMapEmpty!10858) mapIsEmpty!10858))

(assert (= (and mapNonEmpty!10849 (not condMapEmpty!10858)) mapNonEmpty!10858))

(assert (= (and mapNonEmpty!10858 ((_ is ValueCellFull!2855) mapValue!10858)) b!244441))

(assert (= (and mapNonEmpty!10849 ((_ is ValueCellFull!2855) mapDefault!10858)) b!244442))

(declare-fun m!261919 () Bool)

(assert (=> mapNonEmpty!10858 m!261919))

(declare-fun b_lambda!7999 () Bool)

(assert (= b_lambda!7997 (or (and b!244083 b_free!6535) b_lambda!7999)))

(check-sat (not b!244367) (not b!244416) (not b!244357) (not mapNonEmpty!10858) b_and!13499 (not b!244369) (not bm!22791) tp_is_empty!6397 (not b!244427) (not bm!22773) (not b!244310) (not b!244423) (not b!244307) (not d!59977) (not b!244413) (not b!244319) (not d!59971) (not d!59959) (not b!244272) (not bm!22788) (not d!59993) (not b!244317) (not b!244422) (not bm!22790) (not b!244325) (not bm!22770) (not b_next!6535) (not d!59969) (not b!244278) (not b_lambda!7999) (not b!244342) (not d!59973) (not b!244341) (not d!59987) (not d!59965) (not b!244428) (not d!59967) (not bm!22793) (not b!244426) (not b!244327) (not b!244419) (not bm!22769) (not d!59991) (not b!244338) (not b!244318) (not b!244324))
(check-sat b_and!13499 (not b_next!6535))
