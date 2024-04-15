; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75420 () Bool)

(assert start!75420)

(declare-fun b!887799 () Bool)

(declare-fun b_free!15553 () Bool)

(declare-fun b_next!15553 () Bool)

(assert (=> b!887799 (= b_free!15553 (not b_next!15553))))

(declare-fun tp!54607 () Bool)

(declare-fun b_and!25763 () Bool)

(assert (=> b!887799 (= tp!54607 b_and!25763)))

(declare-fun b!887793 () Bool)

(declare-fun res!602137 () Bool)

(declare-fun e!494597 () Bool)

(assert (=> b!887793 (=> (not res!602137) (not e!494597))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51713 0))(
  ( (array!51714 (arr!24869 (Array (_ BitVec 32) (_ BitVec 64))) (size!25311 (_ BitVec 32))) )
))
(declare-datatypes ((V!28807 0))(
  ( (V!28808 (val!8991 Int)) )
))
(declare-datatypes ((ValueCell!8459 0))(
  ( (ValueCellFull!8459 (v!11455 V!28807)) (EmptyCell!8459) )
))
(declare-datatypes ((array!51715 0))(
  ( (array!51716 (arr!24870 (Array (_ BitVec 32) ValueCell!8459)) (size!25312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3934 0))(
  ( (LongMapFixedSize!3935 (defaultEntry!5158 Int) (mask!25563 (_ BitVec 32)) (extraKeys!4852 (_ BitVec 32)) (zeroValue!4956 V!28807) (minValue!4956 V!28807) (_size!2022 (_ BitVec 32)) (_keys!9830 array!51713) (_values!5143 array!51715) (_vacant!2022 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3934)

(assert (=> b!887793 (= res!602137 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!887794 () Bool)

(declare-fun e!494599 () Bool)

(declare-fun e!494595 () Bool)

(declare-fun mapRes!28354 () Bool)

(assert (=> b!887794 (= e!494599 (and e!494595 mapRes!28354))))

(declare-fun condMapEmpty!28354 () Bool)

(declare-fun mapDefault!28354 () ValueCell!8459)

(assert (=> b!887794 (= condMapEmpty!28354 (= (arr!24870 (_values!5143 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8459)) mapDefault!28354)))))

(declare-fun mapIsEmpty!28354 () Bool)

(assert (=> mapIsEmpty!28354 mapRes!28354))

(declare-fun b!887795 () Bool)

(declare-datatypes ((Option!441 0))(
  ( (Some!440 (v!11456 V!28807)) (None!439) )
))
(declare-fun isDefined!316 (Option!441) Bool)

(declare-datatypes ((tuple2!11948 0))(
  ( (tuple2!11949 (_1!5985 (_ BitVec 64)) (_2!5985 V!28807)) )
))
(declare-datatypes ((List!17694 0))(
  ( (Nil!17691) (Cons!17690 (h!18821 tuple2!11948) (t!24980 List!17694)) )
))
(declare-fun getValueByKey!435 (List!17694 (_ BitVec 64)) Option!441)

(declare-datatypes ((ListLongMap!10635 0))(
  ( (ListLongMap!10636 (toList!5333 List!17694)) )
))
(declare-fun map!12085 (LongMapFixedSize!3934) ListLongMap!10635)

(assert (=> b!887795 (= e!494597 (not (isDefined!316 (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785))))))

(declare-fun mapNonEmpty!28354 () Bool)

(declare-fun tp!54606 () Bool)

(declare-fun e!494596 () Bool)

(assert (=> mapNonEmpty!28354 (= mapRes!28354 (and tp!54606 e!494596))))

(declare-fun mapKey!28354 () (_ BitVec 32))

(declare-fun mapRest!28354 () (Array (_ BitVec 32) ValueCell!8459))

(declare-fun mapValue!28354 () ValueCell!8459)

(assert (=> mapNonEmpty!28354 (= (arr!24870 (_values!5143 thiss!1181)) (store mapRest!28354 mapKey!28354 mapValue!28354))))

(declare-fun b!887796 () Bool)

(declare-fun tp_is_empty!17881 () Bool)

(assert (=> b!887796 (= e!494595 tp_is_empty!17881)))

(declare-fun b!887797 () Bool)

(declare-fun res!602139 () Bool)

(assert (=> b!887797 (=> (not res!602139) (not e!494597))))

(declare-fun contains!4292 (LongMapFixedSize!3934 (_ BitVec 64)) Bool)

(assert (=> b!887797 (= res!602139 (contains!4292 thiss!1181 key!785))))

(declare-fun b!887798 () Bool)

(assert (=> b!887798 (= e!494596 tp_is_empty!17881)))

(declare-fun e!494598 () Bool)

(declare-fun array_inv!19618 (array!51713) Bool)

(declare-fun array_inv!19619 (array!51715) Bool)

(assert (=> b!887799 (= e!494598 (and tp!54607 tp_is_empty!17881 (array_inv!19618 (_keys!9830 thiss!1181)) (array_inv!19619 (_values!5143 thiss!1181)) e!494599))))

(declare-fun res!602138 () Bool)

(assert (=> start!75420 (=> (not res!602138) (not e!494597))))

(declare-fun valid!1542 (LongMapFixedSize!3934) Bool)

(assert (=> start!75420 (= res!602138 (valid!1542 thiss!1181))))

(assert (=> start!75420 e!494597))

(assert (=> start!75420 e!494598))

(assert (=> start!75420 true))

(assert (= (and start!75420 res!602138) b!887793))

(assert (= (and b!887793 res!602137) b!887797))

(assert (= (and b!887797 res!602139) b!887795))

(assert (= (and b!887794 condMapEmpty!28354) mapIsEmpty!28354))

(assert (= (and b!887794 (not condMapEmpty!28354)) mapNonEmpty!28354))

(get-info :version)

(assert (= (and mapNonEmpty!28354 ((_ is ValueCellFull!8459) mapValue!28354)) b!887798))

(assert (= (and b!887794 ((_ is ValueCellFull!8459) mapDefault!28354)) b!887796))

(assert (= b!887799 b!887794))

(assert (= start!75420 b!887799))

(declare-fun m!826697 () Bool)

(assert (=> b!887797 m!826697))

(declare-fun m!826699 () Bool)

(assert (=> b!887799 m!826699))

(declare-fun m!826701 () Bool)

(assert (=> b!887799 m!826701))

(declare-fun m!826703 () Bool)

(assert (=> b!887795 m!826703))

(declare-fun m!826705 () Bool)

(assert (=> b!887795 m!826705))

(assert (=> b!887795 m!826705))

(declare-fun m!826707 () Bool)

(assert (=> b!887795 m!826707))

(declare-fun m!826709 () Bool)

(assert (=> mapNonEmpty!28354 m!826709))

(declare-fun m!826711 () Bool)

(assert (=> start!75420 m!826711))

(check-sat (not b!887799) tp_is_empty!17881 b_and!25763 (not b!887797) (not start!75420) (not b_next!15553) (not b!887795) (not mapNonEmpty!28354))
(check-sat b_and!25763 (not b_next!15553))
(get-model)

(declare-fun b!887862 () Bool)

(declare-fun e!494646 () Bool)

(assert (=> b!887862 (= e!494646 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!887863 () Bool)

(declare-fun e!494650 () Bool)

(assert (=> b!887863 (= e!494650 false)))

(declare-fun c!93704 () Bool)

(declare-fun call!39385 () Bool)

(assert (=> b!887863 (= c!93704 call!39385)))

(declare-datatypes ((Unit!30202 0))(
  ( (Unit!30203) )
))
(declare-fun lt!401332 () Unit!30202)

(declare-fun e!494649 () Unit!30202)

(assert (=> b!887863 (= lt!401332 e!494649)))

(declare-fun b!887864 () Bool)

(declare-fun Unit!30204 () Unit!30202)

(assert (=> b!887864 (= e!494649 Unit!30204)))

(declare-fun d!109793 () Bool)

(declare-fun lt!401339 () Bool)

(declare-fun contains!4294 (ListLongMap!10635 (_ BitVec 64)) Bool)

(assert (=> d!109793 (= lt!401339 (contains!4294 (map!12085 thiss!1181) key!785))))

(declare-fun e!494647 () Bool)

(assert (=> d!109793 (= lt!401339 e!494647)))

(declare-fun c!93701 () Bool)

(assert (=> d!109793 (= c!93701 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109793 (valid!1542 thiss!1181)))

(assert (=> d!109793 (= (contains!4292 thiss!1181 key!785) lt!401339)))

(declare-fun b!887865 () Bool)

(assert (=> b!887865 (= e!494647 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!887866 () Bool)

(assert (=> b!887866 false))

(declare-fun lt!401335 () Unit!30202)

(declare-fun lt!401338 () Unit!30202)

(assert (=> b!887866 (= lt!401335 lt!401338)))

(declare-datatypes ((SeekEntryResult!8762 0))(
  ( (MissingZero!8762 (index!37419 (_ BitVec 32))) (Found!8762 (index!37420 (_ BitVec 32))) (Intermediate!8762 (undefined!9574 Bool) (index!37421 (_ BitVec 32)) (x!75337 (_ BitVec 32))) (Undefined!8762) (MissingVacant!8762 (index!37422 (_ BitVec 32))) )
))
(declare-fun lt!401344 () SeekEntryResult!8762)

(declare-fun lt!401345 () (_ BitVec 32))

(assert (=> b!887866 (and ((_ is Found!8762) lt!401344) (= (index!37420 lt!401344) lt!401345))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51713 (_ BitVec 32)) SeekEntryResult!8762)

(assert (=> b!887866 (= lt!401344 (seekEntry!0 key!785 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51713 (_ BitVec 32)) Unit!30202)

(assert (=> b!887866 (= lt!401338 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401345 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(declare-fun lt!401342 () Unit!30202)

(declare-fun lt!401346 () Unit!30202)

(assert (=> b!887866 (= lt!401342 lt!401346)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51713 (_ BitVec 32)) Bool)

(assert (=> b!887866 (arrayForallSeekEntryOrOpenFound!0 lt!401345 (_keys!9830 thiss!1181) (mask!25563 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30202)

(assert (=> b!887866 (= lt!401346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9830 thiss!1181) (mask!25563 thiss!1181) #b00000000000000000000000000000000 lt!401345))))

(declare-fun arrayScanForKey!0 (array!51713 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887866 (= lt!401345 (arrayScanForKey!0 (_keys!9830 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401343 () Unit!30202)

(declare-fun lt!401336 () Unit!30202)

(assert (=> b!887866 (= lt!401343 lt!401336)))

(declare-fun e!494648 () Bool)

(assert (=> b!887866 e!494648))

(declare-fun c!93700 () Bool)

(assert (=> b!887866 (= c!93700 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!164 (array!51713 array!51715 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 64) Int) Unit!30202)

(assert (=> b!887866 (= lt!401336 (lemmaKeyInListMapIsInArray!164 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) key!785 (defaultEntry!5158 thiss!1181)))))

(declare-fun Unit!30205 () Unit!30202)

(assert (=> b!887866 (= e!494649 Unit!30205)))

(declare-fun bm!39381 () Bool)

(declare-fun call!39384 () ListLongMap!10635)

(declare-fun c!93702 () Bool)

(declare-fun lt!401337 () SeekEntryResult!8762)

(assert (=> bm!39381 (= call!39385 (contains!4294 call!39384 (ite c!93702 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337)) key!785)))))

(declare-fun bm!39382 () Bool)

(declare-fun getCurrentListMap!2566 (array!51713 array!51715 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) ListLongMap!10635)

(assert (=> bm!39382 (= call!39384 (getCurrentListMap!2566 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun bm!39383 () Bool)

(declare-fun call!39386 () Bool)

(declare-fun arrayContainsKey!0 (array!51713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39383 (= call!39386 (arrayContainsKey!0 (_keys!9830 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!887867 () Bool)

(assert (=> b!887867 (= e!494650 true)))

(declare-fun lt!401340 () Unit!30202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51713 (_ BitVec 64) (_ BitVec 32)) Unit!30202)

(assert (=> b!887867 (= lt!401340 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9830 thiss!1181) key!785 (index!37420 lt!401337)))))

(assert (=> b!887867 call!39386))

(declare-fun lt!401341 () Unit!30202)

(assert (=> b!887867 (= lt!401341 lt!401340)))

(declare-fun lt!401333 () Unit!30202)

(declare-fun lemmaValidKeyInArrayIsInListMap!202 (array!51713 array!51715 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) Unit!30202)

(assert (=> b!887867 (= lt!401333 (lemmaValidKeyInArrayIsInListMap!202 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) (index!37420 lt!401337) (defaultEntry!5158 thiss!1181)))))

(assert (=> b!887867 call!39385))

(declare-fun lt!401334 () Unit!30202)

(assert (=> b!887867 (= lt!401334 lt!401333)))

(declare-fun b!887868 () Bool)

(assert (=> b!887868 (= c!93702 ((_ is Found!8762) lt!401337))))

(assert (=> b!887868 (= lt!401337 (seekEntry!0 key!785 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(assert (=> b!887868 (= e!494646 e!494650)))

(declare-fun b!887869 () Bool)

(assert (=> b!887869 (= e!494648 call!39386)))

(declare-fun b!887870 () Bool)

(assert (=> b!887870 (= e!494647 e!494646)))

(declare-fun c!93703 () Bool)

(assert (=> b!887870 (= c!93703 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887871 () Bool)

(assert (=> b!887871 (= e!494648 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!109793 c!93701) b!887865))

(assert (= (and d!109793 (not c!93701)) b!887870))

(assert (= (and b!887870 c!93703) b!887862))

(assert (= (and b!887870 (not c!93703)) b!887868))

(assert (= (and b!887868 c!93702) b!887867))

(assert (= (and b!887868 (not c!93702)) b!887863))

(assert (= (and b!887863 c!93704) b!887866))

(assert (= (and b!887863 (not c!93704)) b!887864))

(assert (= (and b!887866 c!93700) b!887869))

(assert (= (and b!887866 (not c!93700)) b!887871))

(assert (= (or b!887867 b!887869) bm!39383))

(assert (= (or b!887867 b!887863) bm!39382))

(assert (= (or b!887867 b!887863) bm!39381))

(assert (=> d!109793 m!826703))

(assert (=> d!109793 m!826703))

(declare-fun m!826745 () Bool)

(assert (=> d!109793 m!826745))

(assert (=> d!109793 m!826711))

(declare-fun m!826747 () Bool)

(assert (=> bm!39382 m!826747))

(declare-fun m!826749 () Bool)

(assert (=> b!887867 m!826749))

(declare-fun m!826751 () Bool)

(assert (=> b!887867 m!826751))

(declare-fun m!826753 () Bool)

(assert (=> b!887866 m!826753))

(declare-fun m!826755 () Bool)

(assert (=> b!887866 m!826755))

(declare-fun m!826757 () Bool)

(assert (=> b!887866 m!826757))

(declare-fun m!826759 () Bool)

(assert (=> b!887866 m!826759))

(declare-fun m!826761 () Bool)

(assert (=> b!887866 m!826761))

(declare-fun m!826763 () Bool)

(assert (=> b!887866 m!826763))

(assert (=> b!887868 m!826759))

(declare-fun m!826765 () Bool)

(assert (=> bm!39381 m!826765))

(declare-fun m!826767 () Bool)

(assert (=> bm!39381 m!826767))

(declare-fun m!826769 () Bool)

(assert (=> bm!39383 m!826769))

(assert (=> b!887797 d!109793))

(declare-fun d!109795 () Bool)

(declare-fun isEmpty!680 (Option!441) Bool)

(assert (=> d!109795 (= (isDefined!316 (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785)) (not (isEmpty!680 (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785))))))

(declare-fun bs!24872 () Bool)

(assert (= bs!24872 d!109795))

(assert (=> bs!24872 m!826705))

(declare-fun m!826771 () Bool)

(assert (=> bs!24872 m!826771))

(assert (=> b!887795 d!109795))

(declare-fun b!887880 () Bool)

(declare-fun e!494655 () Option!441)

(assert (=> b!887880 (= e!494655 (Some!440 (_2!5985 (h!18821 (toList!5333 (map!12085 thiss!1181))))))))

(declare-fun d!109797 () Bool)

(declare-fun c!93709 () Bool)

(assert (=> d!109797 (= c!93709 (and ((_ is Cons!17690) (toList!5333 (map!12085 thiss!1181))) (= (_1!5985 (h!18821 (toList!5333 (map!12085 thiss!1181)))) key!785)))))

(assert (=> d!109797 (= (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785) e!494655)))

(declare-fun b!887882 () Bool)

(declare-fun e!494656 () Option!441)

(assert (=> b!887882 (= e!494656 (getValueByKey!435 (t!24980 (toList!5333 (map!12085 thiss!1181))) key!785))))

(declare-fun b!887881 () Bool)

(assert (=> b!887881 (= e!494655 e!494656)))

(declare-fun c!93710 () Bool)

(assert (=> b!887881 (= c!93710 (and ((_ is Cons!17690) (toList!5333 (map!12085 thiss!1181))) (not (= (_1!5985 (h!18821 (toList!5333 (map!12085 thiss!1181)))) key!785))))))

(declare-fun b!887883 () Bool)

(assert (=> b!887883 (= e!494656 None!439)))

(assert (= (and d!109797 c!93709) b!887880))

(assert (= (and d!109797 (not c!93709)) b!887881))

(assert (= (and b!887881 c!93710) b!887882))

(assert (= (and b!887881 (not c!93710)) b!887883))

(declare-fun m!826773 () Bool)

(assert (=> b!887882 m!826773))

(assert (=> b!887795 d!109797))

(declare-fun d!109799 () Bool)

(assert (=> d!109799 (= (map!12085 thiss!1181) (getCurrentListMap!2566 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun bs!24873 () Bool)

(assert (= bs!24873 d!109799))

(assert (=> bs!24873 m!826747))

(assert (=> b!887795 d!109799))

(declare-fun d!109801 () Bool)

(assert (=> d!109801 (= (array_inv!19618 (_keys!9830 thiss!1181)) (bvsge (size!25311 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!887799 d!109801))

(declare-fun d!109803 () Bool)

(assert (=> d!109803 (= (array_inv!19619 (_values!5143 thiss!1181)) (bvsge (size!25312 (_values!5143 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!887799 d!109803))

(declare-fun d!109805 () Bool)

(declare-fun res!602164 () Bool)

(declare-fun e!494659 () Bool)

(assert (=> d!109805 (=> (not res!602164) (not e!494659))))

(declare-fun simpleValid!289 (LongMapFixedSize!3934) Bool)

(assert (=> d!109805 (= res!602164 (simpleValid!289 thiss!1181))))

(assert (=> d!109805 (= (valid!1542 thiss!1181) e!494659)))

(declare-fun b!887890 () Bool)

(declare-fun res!602165 () Bool)

(assert (=> b!887890 (=> (not res!602165) (not e!494659))))

(declare-fun arrayCountValidKeys!0 (array!51713 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887890 (= res!602165 (= (arrayCountValidKeys!0 (_keys!9830 thiss!1181) #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))) (_size!2022 thiss!1181)))))

(declare-fun b!887891 () Bool)

(declare-fun res!602166 () Bool)

(assert (=> b!887891 (=> (not res!602166) (not e!494659))))

(assert (=> b!887891 (= res!602166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(declare-fun b!887892 () Bool)

(declare-datatypes ((List!17697 0))(
  ( (Nil!17694) (Cons!17693 (h!18824 (_ BitVec 64)) (t!24983 List!17697)) )
))
(declare-fun arrayNoDuplicates!0 (array!51713 (_ BitVec 32) List!17697) Bool)

(assert (=> b!887892 (= e!494659 (arrayNoDuplicates!0 (_keys!9830 thiss!1181) #b00000000000000000000000000000000 Nil!17694))))

(assert (= (and d!109805 res!602164) b!887890))

(assert (= (and b!887890 res!602165) b!887891))

(assert (= (and b!887891 res!602166) b!887892))

(declare-fun m!826775 () Bool)

(assert (=> d!109805 m!826775))

(declare-fun m!826777 () Bool)

(assert (=> b!887890 m!826777))

(declare-fun m!826779 () Bool)

(assert (=> b!887891 m!826779))

(declare-fun m!826781 () Bool)

(assert (=> b!887892 m!826781))

(assert (=> start!75420 d!109805))

(declare-fun b!887900 () Bool)

(declare-fun e!494665 () Bool)

(assert (=> b!887900 (= e!494665 tp_is_empty!17881)))

(declare-fun b!887899 () Bool)

(declare-fun e!494664 () Bool)

(assert (=> b!887899 (= e!494664 tp_is_empty!17881)))

(declare-fun mapIsEmpty!28363 () Bool)

(declare-fun mapRes!28363 () Bool)

(assert (=> mapIsEmpty!28363 mapRes!28363))

(declare-fun mapNonEmpty!28363 () Bool)

(declare-fun tp!54622 () Bool)

(assert (=> mapNonEmpty!28363 (= mapRes!28363 (and tp!54622 e!494664))))

(declare-fun mapValue!28363 () ValueCell!8459)

(declare-fun mapKey!28363 () (_ BitVec 32))

(declare-fun mapRest!28363 () (Array (_ BitVec 32) ValueCell!8459))

(assert (=> mapNonEmpty!28363 (= mapRest!28354 (store mapRest!28363 mapKey!28363 mapValue!28363))))

(declare-fun condMapEmpty!28363 () Bool)

(declare-fun mapDefault!28363 () ValueCell!8459)

(assert (=> mapNonEmpty!28354 (= condMapEmpty!28363 (= mapRest!28354 ((as const (Array (_ BitVec 32) ValueCell!8459)) mapDefault!28363)))))

(assert (=> mapNonEmpty!28354 (= tp!54606 (and e!494665 mapRes!28363))))

(assert (= (and mapNonEmpty!28354 condMapEmpty!28363) mapIsEmpty!28363))

(assert (= (and mapNonEmpty!28354 (not condMapEmpty!28363)) mapNonEmpty!28363))

(assert (= (and mapNonEmpty!28363 ((_ is ValueCellFull!8459) mapValue!28363)) b!887899))

(assert (= (and mapNonEmpty!28354 ((_ is ValueCellFull!8459) mapDefault!28363)) b!887900))

(declare-fun m!826783 () Bool)

(assert (=> mapNonEmpty!28363 m!826783))

(check-sat (not bm!39382) (not d!109799) tp_is_empty!17881 (not d!109805) (not d!109793) (not b!887892) (not b!887866) (not b!887891) (not mapNonEmpty!28363) (not b!887890) (not d!109795) b_and!25763 (not b!887868) (not b!887882) (not bm!39381) (not bm!39383) (not b!887867) (not b_next!15553))
(check-sat b_and!25763 (not b_next!15553))
(get-model)

(declare-fun d!109807 () Bool)

(assert (=> d!109807 (= (isEmpty!680 (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785)) (not ((_ is Some!440) (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785))))))

(assert (=> d!109795 d!109807))

(declare-fun d!109809 () Bool)

(assert (=> d!109809 (arrayContainsKey!0 (_keys!9830 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!401349 () Unit!30202)

(declare-fun choose!13 (array!51713 (_ BitVec 64) (_ BitVec 32)) Unit!30202)

(assert (=> d!109809 (= lt!401349 (choose!13 (_keys!9830 thiss!1181) key!785 (index!37420 lt!401337)))))

(assert (=> d!109809 (bvsge (index!37420 lt!401337) #b00000000000000000000000000000000)))

(assert (=> d!109809 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9830 thiss!1181) key!785 (index!37420 lt!401337)) lt!401349)))

(declare-fun bs!24874 () Bool)

(assert (= bs!24874 d!109809))

(assert (=> bs!24874 m!826769))

(declare-fun m!826785 () Bool)

(assert (=> bs!24874 m!826785))

(assert (=> b!887867 d!109809))

(declare-fun d!109811 () Bool)

(declare-fun e!494668 () Bool)

(assert (=> d!109811 e!494668))

(declare-fun res!602169 () Bool)

(assert (=> d!109811 (=> (not res!602169) (not e!494668))))

(assert (=> d!109811 (= res!602169 (and (bvsge (index!37420 lt!401337) #b00000000000000000000000000000000) (bvslt (index!37420 lt!401337) (size!25311 (_keys!9830 thiss!1181)))))))

(declare-fun lt!401352 () Unit!30202)

(declare-fun choose!1465 (array!51713 array!51715 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) Unit!30202)

(assert (=> d!109811 (= lt!401352 (choose!1465 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) (index!37420 lt!401337) (defaultEntry!5158 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!109811 (validMask!0 (mask!25563 thiss!1181))))

(assert (=> d!109811 (= (lemmaValidKeyInArrayIsInListMap!202 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) (index!37420 lt!401337) (defaultEntry!5158 thiss!1181)) lt!401352)))

(declare-fun b!887903 () Bool)

(assert (=> b!887903 (= e!494668 (contains!4294 (getCurrentListMap!2566 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)) (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337))))))

(assert (= (and d!109811 res!602169) b!887903))

(declare-fun m!826787 () Bool)

(assert (=> d!109811 m!826787))

(declare-fun m!826789 () Bool)

(assert (=> d!109811 m!826789))

(assert (=> b!887903 m!826747))

(assert (=> b!887903 m!826765))

(assert (=> b!887903 m!826747))

(assert (=> b!887903 m!826765))

(declare-fun m!826791 () Bool)

(assert (=> b!887903 m!826791))

(assert (=> b!887867 d!109811))

(declare-fun d!109813 () Bool)

(declare-fun res!602174 () Bool)

(declare-fun e!494673 () Bool)

(assert (=> d!109813 (=> res!602174 e!494673)))

(assert (=> d!109813 (= res!602174 (= (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!109813 (= (arrayContainsKey!0 (_keys!9830 thiss!1181) key!785 #b00000000000000000000000000000000) e!494673)))

(declare-fun b!887908 () Bool)

(declare-fun e!494674 () Bool)

(assert (=> b!887908 (= e!494673 e!494674)))

(declare-fun res!602175 () Bool)

(assert (=> b!887908 (=> (not res!602175) (not e!494674))))

(assert (=> b!887908 (= res!602175 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25311 (_keys!9830 thiss!1181))))))

(declare-fun b!887909 () Bool)

(assert (=> b!887909 (= e!494674 (arrayContainsKey!0 (_keys!9830 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109813 (not res!602174)) b!887908))

(assert (= (and b!887908 res!602175) b!887909))

(declare-fun m!826793 () Bool)

(assert (=> d!109813 m!826793))

(declare-fun m!826795 () Bool)

(assert (=> b!887909 m!826795))

(assert (=> bm!39383 d!109813))

(declare-fun d!109815 () Bool)

(declare-fun lt!401355 () (_ BitVec 32))

(assert (=> d!109815 (and (bvsge lt!401355 #b00000000000000000000000000000000) (bvsle lt!401355 (bvsub (size!25311 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!494680 () (_ BitVec 32))

(assert (=> d!109815 (= lt!401355 e!494680)))

(declare-fun c!93715 () Bool)

(assert (=> d!109815 (= c!93715 (bvsge #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(assert (=> d!109815 (and (bvsle #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25311 (_keys!9830 thiss!1181)) (size!25311 (_keys!9830 thiss!1181))))))

(assert (=> d!109815 (= (arrayCountValidKeys!0 (_keys!9830 thiss!1181) #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))) lt!401355)))

(declare-fun b!887918 () Bool)

(declare-fun e!494679 () (_ BitVec 32))

(assert (=> b!887918 (= e!494680 e!494679)))

(declare-fun c!93716 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!887918 (= c!93716 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!887919 () Bool)

(assert (=> b!887919 (= e!494680 #b00000000000000000000000000000000)))

(declare-fun b!887920 () Bool)

(declare-fun call!39389 () (_ BitVec 32))

(assert (=> b!887920 (= e!494679 call!39389)))

(declare-fun b!887921 () Bool)

(assert (=> b!887921 (= e!494679 (bvadd #b00000000000000000000000000000001 call!39389))))

(declare-fun bm!39386 () Bool)

(assert (=> bm!39386 (= call!39389 (arrayCountValidKeys!0 (_keys!9830 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25311 (_keys!9830 thiss!1181))))))

(assert (= (and d!109815 c!93715) b!887919))

(assert (= (and d!109815 (not c!93715)) b!887918))

(assert (= (and b!887918 c!93716) b!887921))

(assert (= (and b!887918 (not c!93716)) b!887920))

(assert (= (or b!887921 b!887920) bm!39386))

(assert (=> b!887918 m!826793))

(assert (=> b!887918 m!826793))

(declare-fun m!826797 () Bool)

(assert (=> b!887918 m!826797))

(declare-fun m!826799 () Bool)

(assert (=> bm!39386 m!826799))

(assert (=> b!887890 d!109815))

(declare-fun b!887922 () Bool)

(declare-fun e!494681 () Option!441)

(assert (=> b!887922 (= e!494681 (Some!440 (_2!5985 (h!18821 (t!24980 (toList!5333 (map!12085 thiss!1181)))))))))

(declare-fun d!109817 () Bool)

(declare-fun c!93717 () Bool)

(assert (=> d!109817 (= c!93717 (and ((_ is Cons!17690) (t!24980 (toList!5333 (map!12085 thiss!1181)))) (= (_1!5985 (h!18821 (t!24980 (toList!5333 (map!12085 thiss!1181))))) key!785)))))

(assert (=> d!109817 (= (getValueByKey!435 (t!24980 (toList!5333 (map!12085 thiss!1181))) key!785) e!494681)))

(declare-fun b!887924 () Bool)

(declare-fun e!494682 () Option!441)

(assert (=> b!887924 (= e!494682 (getValueByKey!435 (t!24980 (t!24980 (toList!5333 (map!12085 thiss!1181)))) key!785))))

(declare-fun b!887923 () Bool)

(assert (=> b!887923 (= e!494681 e!494682)))

(declare-fun c!93718 () Bool)

(assert (=> b!887923 (= c!93718 (and ((_ is Cons!17690) (t!24980 (toList!5333 (map!12085 thiss!1181)))) (not (= (_1!5985 (h!18821 (t!24980 (toList!5333 (map!12085 thiss!1181))))) key!785))))))

(declare-fun b!887925 () Bool)

(assert (=> b!887925 (= e!494682 None!439)))

(assert (= (and d!109817 c!93717) b!887922))

(assert (= (and d!109817 (not c!93717)) b!887923))

(assert (= (and b!887923 c!93718) b!887924))

(assert (= (and b!887923 (not c!93718)) b!887925))

(declare-fun m!826801 () Bool)

(assert (=> b!887924 m!826801))

(assert (=> b!887882 d!109817))

(declare-fun d!109819 () Bool)

(declare-fun res!602184 () Bool)

(declare-fun e!494685 () Bool)

(assert (=> d!109819 (=> (not res!602184) (not e!494685))))

(assert (=> d!109819 (= res!602184 (validMask!0 (mask!25563 thiss!1181)))))

(assert (=> d!109819 (= (simpleValid!289 thiss!1181) e!494685)))

(declare-fun b!887935 () Bool)

(declare-fun res!602186 () Bool)

(assert (=> b!887935 (=> (not res!602186) (not e!494685))))

(declare-fun size!25317 (LongMapFixedSize!3934) (_ BitVec 32))

(assert (=> b!887935 (= res!602186 (bvsge (size!25317 thiss!1181) (_size!2022 thiss!1181)))))

(declare-fun b!887934 () Bool)

(declare-fun res!602187 () Bool)

(assert (=> b!887934 (=> (not res!602187) (not e!494685))))

(assert (=> b!887934 (= res!602187 (and (= (size!25312 (_values!5143 thiss!1181)) (bvadd (mask!25563 thiss!1181) #b00000000000000000000000000000001)) (= (size!25311 (_keys!9830 thiss!1181)) (size!25312 (_values!5143 thiss!1181))) (bvsge (_size!2022 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2022 thiss!1181) (bvadd (mask!25563 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!887936 () Bool)

(declare-fun res!602185 () Bool)

(assert (=> b!887936 (=> (not res!602185) (not e!494685))))

(assert (=> b!887936 (= res!602185 (= (size!25317 thiss!1181) (bvadd (_size!2022 thiss!1181) (bvsdiv (bvadd (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!887937 () Bool)

(assert (=> b!887937 (= e!494685 (and (bvsge (extraKeys!4852 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4852 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2022 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!109819 res!602184) b!887934))

(assert (= (and b!887934 res!602187) b!887935))

(assert (= (and b!887935 res!602186) b!887936))

(assert (= (and b!887936 res!602185) b!887937))

(assert (=> d!109819 m!826789))

(declare-fun m!826803 () Bool)

(assert (=> b!887935 m!826803))

(assert (=> b!887936 m!826803))

(assert (=> d!109805 d!109819))

(declare-fun b!887950 () Bool)

(declare-fun e!494694 () SeekEntryResult!8762)

(declare-fun lt!401364 () SeekEntryResult!8762)

(assert (=> b!887950 (= e!494694 (MissingZero!8762 (index!37421 lt!401364)))))

(declare-fun b!887951 () Bool)

(declare-fun c!93725 () Bool)

(declare-fun lt!401366 () (_ BitVec 64))

(assert (=> b!887951 (= c!93725 (= lt!401366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!494693 () SeekEntryResult!8762)

(assert (=> b!887951 (= e!494693 e!494694)))

(declare-fun b!887952 () Bool)

(declare-fun e!494692 () SeekEntryResult!8762)

(assert (=> b!887952 (= e!494692 Undefined!8762)))

(declare-fun d!109821 () Bool)

(declare-fun lt!401367 () SeekEntryResult!8762)

(assert (=> d!109821 (and (or ((_ is MissingVacant!8762) lt!401367) (not ((_ is Found!8762) lt!401367)) (and (bvsge (index!37420 lt!401367) #b00000000000000000000000000000000) (bvslt (index!37420 lt!401367) (size!25311 (_keys!9830 thiss!1181))))) (not ((_ is MissingVacant!8762) lt!401367)) (or (not ((_ is Found!8762) lt!401367)) (= (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401367)) key!785)))))

(assert (=> d!109821 (= lt!401367 e!494692)))

(declare-fun c!93726 () Bool)

(assert (=> d!109821 (= c!93726 (and ((_ is Intermediate!8762) lt!401364) (undefined!9574 lt!401364)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51713 (_ BitVec 32)) SeekEntryResult!8762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!109821 (= lt!401364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25563 thiss!1181)) key!785 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(assert (=> d!109821 (validMask!0 (mask!25563 thiss!1181))))

(assert (=> d!109821 (= (seekEntry!0 key!785 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)) lt!401367)))

(declare-fun b!887953 () Bool)

(assert (=> b!887953 (= e!494693 (Found!8762 (index!37421 lt!401364)))))

(declare-fun b!887954 () Bool)

(declare-fun lt!401365 () SeekEntryResult!8762)

(assert (=> b!887954 (= e!494694 (ite ((_ is MissingVacant!8762) lt!401365) (MissingZero!8762 (index!37422 lt!401365)) lt!401365))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51713 (_ BitVec 32)) SeekEntryResult!8762)

(assert (=> b!887954 (= lt!401365 (seekKeyOrZeroReturnVacant!0 (x!75337 lt!401364) (index!37421 lt!401364) (index!37421 lt!401364) key!785 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(declare-fun b!887955 () Bool)

(assert (=> b!887955 (= e!494692 e!494693)))

(assert (=> b!887955 (= lt!401366 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37421 lt!401364)))))

(declare-fun c!93727 () Bool)

(assert (=> b!887955 (= c!93727 (= lt!401366 key!785))))

(assert (= (and d!109821 c!93726) b!887952))

(assert (= (and d!109821 (not c!93726)) b!887955))

(assert (= (and b!887955 c!93727) b!887953))

(assert (= (and b!887955 (not c!93727)) b!887951))

(assert (= (and b!887951 c!93725) b!887950))

(assert (= (and b!887951 (not c!93725)) b!887954))

(declare-fun m!826805 () Bool)

(assert (=> d!109821 m!826805))

(declare-fun m!826807 () Bool)

(assert (=> d!109821 m!826807))

(assert (=> d!109821 m!826807))

(declare-fun m!826809 () Bool)

(assert (=> d!109821 m!826809))

(assert (=> d!109821 m!826789))

(declare-fun m!826811 () Bool)

(assert (=> b!887954 m!826811))

(declare-fun m!826813 () Bool)

(assert (=> b!887955 m!826813))

(assert (=> b!887868 d!109821))

(declare-fun d!109823 () Bool)

(declare-fun res!602195 () Bool)

(declare-fun e!494705 () Bool)

(assert (=> d!109823 (=> res!602195 e!494705)))

(assert (=> d!109823 (= res!602195 (bvsge #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(assert (=> d!109823 (= (arrayNoDuplicates!0 (_keys!9830 thiss!1181) #b00000000000000000000000000000000 Nil!17694) e!494705)))

(declare-fun b!887966 () Bool)

(declare-fun e!494703 () Bool)

(declare-fun call!39392 () Bool)

(assert (=> b!887966 (= e!494703 call!39392)))

(declare-fun bm!39389 () Bool)

(declare-fun c!93730 () Bool)

(assert (=> bm!39389 (= call!39392 (arrayNoDuplicates!0 (_keys!9830 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93730 (Cons!17693 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000) Nil!17694) Nil!17694)))))

(declare-fun b!887967 () Bool)

(declare-fun e!494706 () Bool)

(assert (=> b!887967 (= e!494705 e!494706)))

(declare-fun res!602194 () Bool)

(assert (=> b!887967 (=> (not res!602194) (not e!494706))))

(declare-fun e!494704 () Bool)

(assert (=> b!887967 (= res!602194 (not e!494704))))

(declare-fun res!602196 () Bool)

(assert (=> b!887967 (=> (not res!602196) (not e!494704))))

(assert (=> b!887967 (= res!602196 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!887968 () Bool)

(assert (=> b!887968 (= e!494706 e!494703)))

(assert (=> b!887968 (= c!93730 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!887969 () Bool)

(assert (=> b!887969 (= e!494703 call!39392)))

(declare-fun b!887970 () Bool)

(declare-fun contains!4295 (List!17697 (_ BitVec 64)) Bool)

(assert (=> b!887970 (= e!494704 (contains!4295 Nil!17694 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!109823 (not res!602195)) b!887967))

(assert (= (and b!887967 res!602196) b!887970))

(assert (= (and b!887967 res!602194) b!887968))

(assert (= (and b!887968 c!93730) b!887966))

(assert (= (and b!887968 (not c!93730)) b!887969))

(assert (= (or b!887966 b!887969) bm!39389))

(assert (=> bm!39389 m!826793))

(declare-fun m!826815 () Bool)

(assert (=> bm!39389 m!826815))

(assert (=> b!887967 m!826793))

(assert (=> b!887967 m!826793))

(assert (=> b!887967 m!826797))

(assert (=> b!887968 m!826793))

(assert (=> b!887968 m!826793))

(assert (=> b!887968 m!826797))

(assert (=> b!887970 m!826793))

(assert (=> b!887970 m!826793))

(declare-fun m!826817 () Bool)

(assert (=> b!887970 m!826817))

(assert (=> b!887892 d!109823))

(declare-fun d!109825 () Bool)

(declare-fun e!494712 () Bool)

(assert (=> d!109825 e!494712))

(declare-fun res!602199 () Bool)

(assert (=> d!109825 (=> res!602199 e!494712)))

(declare-fun lt!401377 () Bool)

(assert (=> d!109825 (= res!602199 (not lt!401377))))

(declare-fun lt!401378 () Bool)

(assert (=> d!109825 (= lt!401377 lt!401378)))

(declare-fun lt!401376 () Unit!30202)

(declare-fun e!494711 () Unit!30202)

(assert (=> d!109825 (= lt!401376 e!494711)))

(declare-fun c!93733 () Bool)

(assert (=> d!109825 (= c!93733 lt!401378)))

(declare-fun containsKey!419 (List!17694 (_ BitVec 64)) Bool)

(assert (=> d!109825 (= lt!401378 (containsKey!419 (toList!5333 (map!12085 thiss!1181)) key!785))))

(assert (=> d!109825 (= (contains!4294 (map!12085 thiss!1181) key!785) lt!401377)))

(declare-fun b!887977 () Bool)

(declare-fun lt!401379 () Unit!30202)

(assert (=> b!887977 (= e!494711 lt!401379)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!314 (List!17694 (_ BitVec 64)) Unit!30202)

(assert (=> b!887977 (= lt!401379 (lemmaContainsKeyImpliesGetValueByKeyDefined!314 (toList!5333 (map!12085 thiss!1181)) key!785))))

(assert (=> b!887977 (isDefined!316 (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785))))

(declare-fun b!887978 () Bool)

(declare-fun Unit!30206 () Unit!30202)

(assert (=> b!887978 (= e!494711 Unit!30206)))

(declare-fun b!887979 () Bool)

(assert (=> b!887979 (= e!494712 (isDefined!316 (getValueByKey!435 (toList!5333 (map!12085 thiss!1181)) key!785)))))

(assert (= (and d!109825 c!93733) b!887977))

(assert (= (and d!109825 (not c!93733)) b!887978))

(assert (= (and d!109825 (not res!602199)) b!887979))

(declare-fun m!826819 () Bool)

(assert (=> d!109825 m!826819))

(declare-fun m!826821 () Bool)

(assert (=> b!887977 m!826821))

(assert (=> b!887977 m!826705))

(assert (=> b!887977 m!826705))

(assert (=> b!887977 m!826707))

(assert (=> b!887979 m!826705))

(assert (=> b!887979 m!826705))

(assert (=> b!887979 m!826707))

(assert (=> d!109793 d!109825))

(assert (=> d!109793 d!109799))

(assert (=> d!109793 d!109805))

(declare-fun b!887988 () Bool)

(declare-fun e!494721 () Bool)

(declare-fun e!494720 () Bool)

(assert (=> b!887988 (= e!494721 e!494720)))

(declare-fun c!93736 () Bool)

(assert (=> b!887988 (= c!93736 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!109827 () Bool)

(declare-fun res!602205 () Bool)

(assert (=> d!109827 (=> res!602205 e!494721)))

(assert (=> d!109827 (= res!602205 (bvsge #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(assert (=> d!109827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)) e!494721)))

(declare-fun b!887989 () Bool)

(declare-fun e!494719 () Bool)

(assert (=> b!887989 (= e!494720 e!494719)))

(declare-fun lt!401387 () (_ BitVec 64))

(assert (=> b!887989 (= lt!401387 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401388 () Unit!30202)

(assert (=> b!887989 (= lt!401388 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9830 thiss!1181) lt!401387 #b00000000000000000000000000000000))))

(assert (=> b!887989 (arrayContainsKey!0 (_keys!9830 thiss!1181) lt!401387 #b00000000000000000000000000000000)))

(declare-fun lt!401386 () Unit!30202)

(assert (=> b!887989 (= lt!401386 lt!401388)))

(declare-fun res!602204 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51713 (_ BitVec 32)) SeekEntryResult!8762)

(assert (=> b!887989 (= res!602204 (= (seekEntryOrOpen!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000) (_keys!9830 thiss!1181) (mask!25563 thiss!1181)) (Found!8762 #b00000000000000000000000000000000)))))

(assert (=> b!887989 (=> (not res!602204) (not e!494719))))

(declare-fun b!887990 () Bool)

(declare-fun call!39395 () Bool)

(assert (=> b!887990 (= e!494720 call!39395)))

(declare-fun b!887991 () Bool)

(assert (=> b!887991 (= e!494719 call!39395)))

(declare-fun bm!39392 () Bool)

(assert (=> bm!39392 (= call!39395 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(assert (= (and d!109827 (not res!602205)) b!887988))

(assert (= (and b!887988 c!93736) b!887989))

(assert (= (and b!887988 (not c!93736)) b!887990))

(assert (= (and b!887989 res!602204) b!887991))

(assert (= (or b!887991 b!887990) bm!39392))

(assert (=> b!887988 m!826793))

(assert (=> b!887988 m!826793))

(assert (=> b!887988 m!826797))

(assert (=> b!887989 m!826793))

(declare-fun m!826823 () Bool)

(assert (=> b!887989 m!826823))

(declare-fun m!826825 () Bool)

(assert (=> b!887989 m!826825))

(assert (=> b!887989 m!826793))

(declare-fun m!826827 () Bool)

(assert (=> b!887989 m!826827))

(declare-fun m!826829 () Bool)

(assert (=> bm!39392 m!826829))

(assert (=> b!887891 d!109827))

(declare-fun bm!39407 () Bool)

(declare-fun call!39414 () ListLongMap!10635)

(declare-fun call!39413 () ListLongMap!10635)

(assert (=> bm!39407 (= call!39414 call!39413)))

(declare-fun b!888034 () Bool)

(declare-fun e!494748 () Bool)

(declare-fun e!494760 () Bool)

(assert (=> b!888034 (= e!494748 e!494760)))

(declare-fun res!602232 () Bool)

(declare-fun call!39416 () Bool)

(assert (=> b!888034 (= res!602232 call!39416)))

(assert (=> b!888034 (=> (not res!602232) (not e!494760))))

(declare-fun b!888035 () Bool)

(assert (=> b!888035 (= e!494748 (not call!39416))))

(declare-fun b!888036 () Bool)

(declare-fun e!494752 () Bool)

(declare-fun call!39412 () Bool)

(assert (=> b!888036 (= e!494752 (not call!39412))))

(declare-fun d!109829 () Bool)

(declare-fun e!494759 () Bool)

(assert (=> d!109829 e!494759))

(declare-fun res!602230 () Bool)

(assert (=> d!109829 (=> (not res!602230) (not e!494759))))

(assert (=> d!109829 (= res!602230 (or (bvsge #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))))

(declare-fun lt!401438 () ListLongMap!10635)

(declare-fun lt!401453 () ListLongMap!10635)

(assert (=> d!109829 (= lt!401438 lt!401453)))

(declare-fun lt!401447 () Unit!30202)

(declare-fun e!494756 () Unit!30202)

(assert (=> d!109829 (= lt!401447 e!494756)))

(declare-fun c!93750 () Bool)

(declare-fun e!494753 () Bool)

(assert (=> d!109829 (= c!93750 e!494753)))

(declare-fun res!602224 () Bool)

(assert (=> d!109829 (=> (not res!602224) (not e!494753))))

(assert (=> d!109829 (= res!602224 (bvslt #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(declare-fun e!494749 () ListLongMap!10635)

(assert (=> d!109829 (= lt!401453 e!494749)))

(declare-fun c!93754 () Bool)

(assert (=> d!109829 (= c!93754 (and (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!109829 (validMask!0 (mask!25563 thiss!1181))))

(assert (=> d!109829 (= (getCurrentListMap!2566 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)) lt!401438)))

(declare-fun b!888037 () Bool)

(declare-fun lt!401433 () Unit!30202)

(assert (=> b!888037 (= e!494756 lt!401433)))

(declare-fun lt!401443 () ListLongMap!10635)

(declare-fun getCurrentListMapNoExtraKeys!3308 (array!51713 array!51715 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 32) Int) ListLongMap!10635)

(assert (=> b!888037 (= lt!401443 (getCurrentListMapNoExtraKeys!3308 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!401434 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401446 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401446 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401444 () Unit!30202)

(declare-fun addStillContains!326 (ListLongMap!10635 (_ BitVec 64) V!28807 (_ BitVec 64)) Unit!30202)

(assert (=> b!888037 (= lt!401444 (addStillContains!326 lt!401443 lt!401434 (zeroValue!4956 thiss!1181) lt!401446))))

(declare-fun +!2611 (ListLongMap!10635 tuple2!11948) ListLongMap!10635)

(assert (=> b!888037 (contains!4294 (+!2611 lt!401443 (tuple2!11949 lt!401434 (zeroValue!4956 thiss!1181))) lt!401446)))

(declare-fun lt!401442 () Unit!30202)

(assert (=> b!888037 (= lt!401442 lt!401444)))

(declare-fun lt!401436 () ListLongMap!10635)

(assert (=> b!888037 (= lt!401436 (getCurrentListMapNoExtraKeys!3308 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!401452 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401454 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401454 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401445 () Unit!30202)

(declare-fun addApplyDifferent!326 (ListLongMap!10635 (_ BitVec 64) V!28807 (_ BitVec 64)) Unit!30202)

(assert (=> b!888037 (= lt!401445 (addApplyDifferent!326 lt!401436 lt!401452 (minValue!4956 thiss!1181) lt!401454))))

(declare-fun apply!396 (ListLongMap!10635 (_ BitVec 64)) V!28807)

(assert (=> b!888037 (= (apply!396 (+!2611 lt!401436 (tuple2!11949 lt!401452 (minValue!4956 thiss!1181))) lt!401454) (apply!396 lt!401436 lt!401454))))

(declare-fun lt!401450 () Unit!30202)

(assert (=> b!888037 (= lt!401450 lt!401445)))

(declare-fun lt!401448 () ListLongMap!10635)

(assert (=> b!888037 (= lt!401448 (getCurrentListMapNoExtraKeys!3308 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!401441 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401440 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401440 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401451 () Unit!30202)

(assert (=> b!888037 (= lt!401451 (addApplyDifferent!326 lt!401448 lt!401441 (zeroValue!4956 thiss!1181) lt!401440))))

(assert (=> b!888037 (= (apply!396 (+!2611 lt!401448 (tuple2!11949 lt!401441 (zeroValue!4956 thiss!1181))) lt!401440) (apply!396 lt!401448 lt!401440))))

(declare-fun lt!401437 () Unit!30202)

(assert (=> b!888037 (= lt!401437 lt!401451)))

(declare-fun lt!401435 () ListLongMap!10635)

(assert (=> b!888037 (= lt!401435 (getCurrentListMapNoExtraKeys!3308 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun lt!401449 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401449 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401439 () (_ BitVec 64))

(assert (=> b!888037 (= lt!401439 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888037 (= lt!401433 (addApplyDifferent!326 lt!401435 lt!401449 (minValue!4956 thiss!1181) lt!401439))))

(assert (=> b!888037 (= (apply!396 (+!2611 lt!401435 (tuple2!11949 lt!401449 (minValue!4956 thiss!1181))) lt!401439) (apply!396 lt!401435 lt!401439))))

(declare-fun b!888038 () Bool)

(declare-fun e!494757 () ListLongMap!10635)

(assert (=> b!888038 (= e!494749 e!494757)))

(declare-fun c!93753 () Bool)

(assert (=> b!888038 (= c!93753 (and (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888039 () Bool)

(declare-fun call!39415 () ListLongMap!10635)

(assert (=> b!888039 (= e!494757 call!39415)))

(declare-fun b!888040 () Bool)

(declare-fun e!494751 () ListLongMap!10635)

(assert (=> b!888040 (= e!494751 call!39414)))

(declare-fun bm!39408 () Bool)

(declare-fun call!39410 () ListLongMap!10635)

(assert (=> bm!39408 (= call!39410 (getCurrentListMapNoExtraKeys!3308 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5158 thiss!1181)))))

(declare-fun b!888041 () Bool)

(declare-fun e!494755 () Bool)

(assert (=> b!888041 (= e!494755 (= (apply!396 lt!401438 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4956 thiss!1181)))))

(declare-fun b!888042 () Bool)

(declare-fun res!602227 () Bool)

(assert (=> b!888042 (=> (not res!602227) (not e!494759))))

(declare-fun e!494754 () Bool)

(assert (=> b!888042 (= res!602227 e!494754)))

(declare-fun res!602231 () Bool)

(assert (=> b!888042 (=> res!602231 e!494754)))

(declare-fun e!494758 () Bool)

(assert (=> b!888042 (= res!602231 (not e!494758))))

(declare-fun res!602226 () Bool)

(assert (=> b!888042 (=> (not res!602226) (not e!494758))))

(assert (=> b!888042 (= res!602226 (bvslt #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(declare-fun b!888043 () Bool)

(assert (=> b!888043 (= e!494753 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888044 () Bool)

(declare-fun c!93752 () Bool)

(assert (=> b!888044 (= c!93752 (and (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888044 (= e!494757 e!494751)))

(declare-fun b!888045 () Bool)

(declare-fun e!494750 () Bool)

(assert (=> b!888045 (= e!494754 e!494750)))

(declare-fun res!602229 () Bool)

(assert (=> b!888045 (=> (not res!602229) (not e!494750))))

(assert (=> b!888045 (= res!602229 (contains!4294 lt!401438 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!888045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(declare-fun bm!39409 () Bool)

(assert (=> bm!39409 (= call!39416 (contains!4294 lt!401438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39410 () Bool)

(assert (=> bm!39410 (= call!39412 (contains!4294 lt!401438 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888046 () Bool)

(declare-fun call!39411 () ListLongMap!10635)

(assert (=> b!888046 (= e!494749 (+!2611 call!39411 (tuple2!11949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4956 thiss!1181))))))

(declare-fun b!888047 () Bool)

(declare-fun res!602228 () Bool)

(assert (=> b!888047 (=> (not res!602228) (not e!494759))))

(assert (=> b!888047 (= res!602228 e!494748)))

(declare-fun c!93751 () Bool)

(assert (=> b!888047 (= c!93751 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39411 () Bool)

(assert (=> bm!39411 (= call!39413 call!39410)))

(declare-fun b!888048 () Bool)

(declare-fun get!13144 (ValueCell!8459 V!28807) V!28807)

(declare-fun dynLambda!1287 (Int (_ BitVec 64)) V!28807)

(assert (=> b!888048 (= e!494750 (= (apply!396 lt!401438 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)) (get!13144 (select (arr!24870 (_values!5143 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1287 (defaultEntry!5158 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25312 (_values!5143 thiss!1181))))))

(assert (=> b!888048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))))))

(declare-fun b!888049 () Bool)

(assert (=> b!888049 (= e!494752 e!494755)))

(declare-fun res!602225 () Bool)

(assert (=> b!888049 (= res!602225 call!39412)))

(assert (=> b!888049 (=> (not res!602225) (not e!494755))))

(declare-fun b!888050 () Bool)

(declare-fun Unit!30207 () Unit!30202)

(assert (=> b!888050 (= e!494756 Unit!30207)))

(declare-fun b!888051 () Bool)

(assert (=> b!888051 (= e!494759 e!494752)))

(declare-fun c!93749 () Bool)

(assert (=> b!888051 (= c!93749 (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39412 () Bool)

(assert (=> bm!39412 (= call!39411 (+!2611 (ite c!93754 call!39410 (ite c!93753 call!39413 call!39414)) (ite (or c!93754 c!93753) (tuple2!11949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4956 thiss!1181)) (tuple2!11949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4956 thiss!1181)))))))

(declare-fun b!888052 () Bool)

(assert (=> b!888052 (= e!494760 (= (apply!396 lt!401438 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4956 thiss!1181)))))

(declare-fun b!888053 () Bool)

(assert (=> b!888053 (= e!494751 call!39415)))

(declare-fun bm!39413 () Bool)

(assert (=> bm!39413 (= call!39415 call!39411)))

(declare-fun b!888054 () Bool)

(assert (=> b!888054 (= e!494758 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!109829 c!93754) b!888046))

(assert (= (and d!109829 (not c!93754)) b!888038))

(assert (= (and b!888038 c!93753) b!888039))

(assert (= (and b!888038 (not c!93753)) b!888044))

(assert (= (and b!888044 c!93752) b!888053))

(assert (= (and b!888044 (not c!93752)) b!888040))

(assert (= (or b!888053 b!888040) bm!39407))

(assert (= (or b!888039 bm!39407) bm!39411))

(assert (= (or b!888039 b!888053) bm!39413))

(assert (= (or b!888046 bm!39411) bm!39408))

(assert (= (or b!888046 bm!39413) bm!39412))

(assert (= (and d!109829 res!602224) b!888043))

(assert (= (and d!109829 c!93750) b!888037))

(assert (= (and d!109829 (not c!93750)) b!888050))

(assert (= (and d!109829 res!602230) b!888042))

(assert (= (and b!888042 res!602226) b!888054))

(assert (= (and b!888042 (not res!602231)) b!888045))

(assert (= (and b!888045 res!602229) b!888048))

(assert (= (and b!888042 res!602227) b!888047))

(assert (= (and b!888047 c!93751) b!888034))

(assert (= (and b!888047 (not c!93751)) b!888035))

(assert (= (and b!888034 res!602232) b!888052))

(assert (= (or b!888034 b!888035) bm!39409))

(assert (= (and b!888047 res!602228) b!888051))

(assert (= (and b!888051 c!93749) b!888049))

(assert (= (and b!888051 (not c!93749)) b!888036))

(assert (= (and b!888049 res!602225) b!888041))

(assert (= (or b!888049 b!888036) bm!39410))

(declare-fun b_lambda!12857 () Bool)

(assert (=> (not b_lambda!12857) (not b!888048)))

(declare-fun t!24985 () Bool)

(declare-fun tb!5139 () Bool)

(assert (=> (and b!887799 (= (defaultEntry!5158 thiss!1181) (defaultEntry!5158 thiss!1181)) t!24985) tb!5139))

(declare-fun result!9987 () Bool)

(assert (=> tb!5139 (= result!9987 tp_is_empty!17881)))

(assert (=> b!888048 t!24985))

(declare-fun b_and!25769 () Bool)

(assert (= b_and!25763 (and (=> t!24985 result!9987) b_and!25769)))

(assert (=> b!888054 m!826793))

(assert (=> b!888054 m!826793))

(assert (=> b!888054 m!826797))

(declare-fun m!826831 () Bool)

(assert (=> bm!39410 m!826831))

(assert (=> d!109829 m!826789))

(declare-fun m!826833 () Bool)

(assert (=> b!888052 m!826833))

(declare-fun m!826835 () Bool)

(assert (=> b!888046 m!826835))

(assert (=> b!888045 m!826793))

(assert (=> b!888045 m!826793))

(declare-fun m!826837 () Bool)

(assert (=> b!888045 m!826837))

(declare-fun m!826839 () Bool)

(assert (=> bm!39409 m!826839))

(declare-fun m!826841 () Bool)

(assert (=> b!888048 m!826841))

(declare-fun m!826843 () Bool)

(assert (=> b!888048 m!826843))

(assert (=> b!888048 m!826793))

(assert (=> b!888048 m!826793))

(declare-fun m!826845 () Bool)

(assert (=> b!888048 m!826845))

(assert (=> b!888048 m!826843))

(assert (=> b!888048 m!826841))

(declare-fun m!826847 () Bool)

(assert (=> b!888048 m!826847))

(declare-fun m!826849 () Bool)

(assert (=> b!888041 m!826849))

(assert (=> b!888043 m!826793))

(assert (=> b!888043 m!826793))

(assert (=> b!888043 m!826797))

(declare-fun m!826851 () Bool)

(assert (=> b!888037 m!826851))

(assert (=> b!888037 m!826793))

(declare-fun m!826853 () Bool)

(assert (=> b!888037 m!826853))

(declare-fun m!826855 () Bool)

(assert (=> b!888037 m!826855))

(assert (=> b!888037 m!826853))

(declare-fun m!826857 () Bool)

(assert (=> b!888037 m!826857))

(declare-fun m!826859 () Bool)

(assert (=> b!888037 m!826859))

(declare-fun m!826861 () Bool)

(assert (=> b!888037 m!826861))

(declare-fun m!826863 () Bool)

(assert (=> b!888037 m!826863))

(declare-fun m!826865 () Bool)

(assert (=> b!888037 m!826865))

(declare-fun m!826867 () Bool)

(assert (=> b!888037 m!826867))

(assert (=> b!888037 m!826861))

(assert (=> b!888037 m!826867))

(declare-fun m!826869 () Bool)

(assert (=> b!888037 m!826869))

(declare-fun m!826871 () Bool)

(assert (=> b!888037 m!826871))

(assert (=> b!888037 m!826871))

(declare-fun m!826873 () Bool)

(assert (=> b!888037 m!826873))

(declare-fun m!826875 () Bool)

(assert (=> b!888037 m!826875))

(declare-fun m!826877 () Bool)

(assert (=> b!888037 m!826877))

(declare-fun m!826879 () Bool)

(assert (=> b!888037 m!826879))

(declare-fun m!826881 () Bool)

(assert (=> b!888037 m!826881))

(declare-fun m!826883 () Bool)

(assert (=> bm!39412 m!826883))

(assert (=> bm!39408 m!826875))

(assert (=> bm!39382 d!109829))

(assert (=> d!109799 d!109829))

(declare-fun d!109831 () Bool)

(declare-fun e!494762 () Bool)

(assert (=> d!109831 e!494762))

(declare-fun res!602233 () Bool)

(assert (=> d!109831 (=> res!602233 e!494762)))

(declare-fun lt!401456 () Bool)

(assert (=> d!109831 (= res!602233 (not lt!401456))))

(declare-fun lt!401457 () Bool)

(assert (=> d!109831 (= lt!401456 lt!401457)))

(declare-fun lt!401455 () Unit!30202)

(declare-fun e!494761 () Unit!30202)

(assert (=> d!109831 (= lt!401455 e!494761)))

(declare-fun c!93755 () Bool)

(assert (=> d!109831 (= c!93755 lt!401457)))

(assert (=> d!109831 (= lt!401457 (containsKey!419 (toList!5333 call!39384) (ite c!93702 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337)) key!785)))))

(assert (=> d!109831 (= (contains!4294 call!39384 (ite c!93702 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337)) key!785)) lt!401456)))

(declare-fun b!888057 () Bool)

(declare-fun lt!401458 () Unit!30202)

(assert (=> b!888057 (= e!494761 lt!401458)))

(assert (=> b!888057 (= lt!401458 (lemmaContainsKeyImpliesGetValueByKeyDefined!314 (toList!5333 call!39384) (ite c!93702 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337)) key!785)))))

(assert (=> b!888057 (isDefined!316 (getValueByKey!435 (toList!5333 call!39384) (ite c!93702 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337)) key!785)))))

(declare-fun b!888058 () Bool)

(declare-fun Unit!30208 () Unit!30202)

(assert (=> b!888058 (= e!494761 Unit!30208)))

(declare-fun b!888059 () Bool)

(assert (=> b!888059 (= e!494762 (isDefined!316 (getValueByKey!435 (toList!5333 call!39384) (ite c!93702 (select (arr!24869 (_keys!9830 thiss!1181)) (index!37420 lt!401337)) key!785))))))

(assert (= (and d!109831 c!93755) b!888057))

(assert (= (and d!109831 (not c!93755)) b!888058))

(assert (= (and d!109831 (not res!602233)) b!888059))

(declare-fun m!826885 () Bool)

(assert (=> d!109831 m!826885))

(declare-fun m!826887 () Bool)

(assert (=> b!888057 m!826887))

(declare-fun m!826889 () Bool)

(assert (=> b!888057 m!826889))

(assert (=> b!888057 m!826889))

(declare-fun m!826891 () Bool)

(assert (=> b!888057 m!826891))

(assert (=> b!888059 m!826889))

(assert (=> b!888059 m!826889))

(assert (=> b!888059 m!826891))

(assert (=> bm!39381 d!109831))

(declare-fun d!109833 () Bool)

(declare-fun e!494765 () Bool)

(assert (=> d!109833 e!494765))

(declare-fun c!93758 () Bool)

(assert (=> d!109833 (= c!93758 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401461 () Unit!30202)

(declare-fun choose!1466 (array!51713 array!51715 (_ BitVec 32) (_ BitVec 32) V!28807 V!28807 (_ BitVec 64) Int) Unit!30202)

(assert (=> d!109833 (= lt!401461 (choose!1466 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) key!785 (defaultEntry!5158 thiss!1181)))))

(assert (=> d!109833 (validMask!0 (mask!25563 thiss!1181))))

(assert (=> d!109833 (= (lemmaKeyInListMapIsInArray!164 (_keys!9830 thiss!1181) (_values!5143 thiss!1181) (mask!25563 thiss!1181) (extraKeys!4852 thiss!1181) (zeroValue!4956 thiss!1181) (minValue!4956 thiss!1181) key!785 (defaultEntry!5158 thiss!1181)) lt!401461)))

(declare-fun b!888064 () Bool)

(assert (=> b!888064 (= e!494765 (arrayContainsKey!0 (_keys!9830 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888065 () Bool)

(assert (=> b!888065 (= e!494765 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4852 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!109833 c!93758) b!888064))

(assert (= (and d!109833 (not c!93758)) b!888065))

(declare-fun m!826893 () Bool)

(assert (=> d!109833 m!826893))

(assert (=> d!109833 m!826789))

(assert (=> b!888064 m!826769))

(assert (=> b!887866 d!109833))

(assert (=> b!887866 d!109821))

(declare-fun d!109835 () Bool)

(assert (=> d!109835 (arrayForallSeekEntryOrOpenFound!0 lt!401345 (_keys!9830 thiss!1181) (mask!25563 thiss!1181))))

(declare-fun lt!401464 () Unit!30202)

(declare-fun choose!38 (array!51713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30202)

(assert (=> d!109835 (= lt!401464 (choose!38 (_keys!9830 thiss!1181) (mask!25563 thiss!1181) #b00000000000000000000000000000000 lt!401345))))

(assert (=> d!109835 (validMask!0 (mask!25563 thiss!1181))))

(assert (=> d!109835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9830 thiss!1181) (mask!25563 thiss!1181) #b00000000000000000000000000000000 lt!401345) lt!401464)))

(declare-fun bs!24875 () Bool)

(assert (= bs!24875 d!109835))

(assert (=> bs!24875 m!826757))

(declare-fun m!826895 () Bool)

(assert (=> bs!24875 m!826895))

(assert (=> bs!24875 m!826789))

(assert (=> b!887866 d!109835))

(declare-fun d!109837 () Bool)

(declare-fun lt!401467 () (_ BitVec 32))

(assert (=> d!109837 (and (or (bvslt lt!401467 #b00000000000000000000000000000000) (bvsge lt!401467 (size!25311 (_keys!9830 thiss!1181))) (and (bvsge lt!401467 #b00000000000000000000000000000000) (bvslt lt!401467 (size!25311 (_keys!9830 thiss!1181))))) (bvsge lt!401467 #b00000000000000000000000000000000) (bvslt lt!401467 (size!25311 (_keys!9830 thiss!1181))) (= (select (arr!24869 (_keys!9830 thiss!1181)) lt!401467) key!785))))

(declare-fun e!494768 () (_ BitVec 32))

(assert (=> d!109837 (= lt!401467 e!494768)))

(declare-fun c!93761 () Bool)

(assert (=> d!109837 (= c!93761 (= (select (arr!24869 (_keys!9830 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!109837 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25311 (_keys!9830 thiss!1181))) (bvslt (size!25311 (_keys!9830 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!109837 (= (arrayScanForKey!0 (_keys!9830 thiss!1181) key!785 #b00000000000000000000000000000000) lt!401467)))

(declare-fun b!888070 () Bool)

(assert (=> b!888070 (= e!494768 #b00000000000000000000000000000000)))

(declare-fun b!888071 () Bool)

(assert (=> b!888071 (= e!494768 (arrayScanForKey!0 (_keys!9830 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109837 c!93761) b!888070))

(assert (= (and d!109837 (not c!93761)) b!888071))

(declare-fun m!826897 () Bool)

(assert (=> d!109837 m!826897))

(assert (=> d!109837 m!826793))

(declare-fun m!826899 () Bool)

(assert (=> b!888071 m!826899))

(assert (=> b!887866 d!109837))

(declare-fun b!888072 () Bool)

(declare-fun e!494771 () Bool)

(declare-fun e!494770 () Bool)

(assert (=> b!888072 (= e!494771 e!494770)))

(declare-fun c!93762 () Bool)

(assert (=> b!888072 (= c!93762 (validKeyInArray!0 (select (arr!24869 (_keys!9830 thiss!1181)) lt!401345)))))

(declare-fun d!109839 () Bool)

(declare-fun res!602235 () Bool)

(assert (=> d!109839 (=> res!602235 e!494771)))

(assert (=> d!109839 (= res!602235 (bvsge lt!401345 (size!25311 (_keys!9830 thiss!1181))))))

(assert (=> d!109839 (= (arrayForallSeekEntryOrOpenFound!0 lt!401345 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)) e!494771)))

(declare-fun b!888073 () Bool)

(declare-fun e!494769 () Bool)

(assert (=> b!888073 (= e!494770 e!494769)))

(declare-fun lt!401469 () (_ BitVec 64))

(assert (=> b!888073 (= lt!401469 (select (arr!24869 (_keys!9830 thiss!1181)) lt!401345))))

(declare-fun lt!401470 () Unit!30202)

(assert (=> b!888073 (= lt!401470 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9830 thiss!1181) lt!401469 lt!401345))))

(assert (=> b!888073 (arrayContainsKey!0 (_keys!9830 thiss!1181) lt!401469 #b00000000000000000000000000000000)))

(declare-fun lt!401468 () Unit!30202)

(assert (=> b!888073 (= lt!401468 lt!401470)))

(declare-fun res!602234 () Bool)

(assert (=> b!888073 (= res!602234 (= (seekEntryOrOpen!0 (select (arr!24869 (_keys!9830 thiss!1181)) lt!401345) (_keys!9830 thiss!1181) (mask!25563 thiss!1181)) (Found!8762 lt!401345)))))

(assert (=> b!888073 (=> (not res!602234) (not e!494769))))

(declare-fun b!888074 () Bool)

(declare-fun call!39417 () Bool)

(assert (=> b!888074 (= e!494770 call!39417)))

(declare-fun b!888075 () Bool)

(assert (=> b!888075 (= e!494769 call!39417)))

(declare-fun bm!39414 () Bool)

(assert (=> bm!39414 (= call!39417 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!401345 #b00000000000000000000000000000001) (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(assert (= (and d!109839 (not res!602235)) b!888072))

(assert (= (and b!888072 c!93762) b!888073))

(assert (= (and b!888072 (not c!93762)) b!888074))

(assert (= (and b!888073 res!602234) b!888075))

(assert (= (or b!888075 b!888074) bm!39414))

(declare-fun m!826901 () Bool)

(assert (=> b!888072 m!826901))

(assert (=> b!888072 m!826901))

(declare-fun m!826903 () Bool)

(assert (=> b!888072 m!826903))

(assert (=> b!888073 m!826901))

(declare-fun m!826905 () Bool)

(assert (=> b!888073 m!826905))

(declare-fun m!826907 () Bool)

(assert (=> b!888073 m!826907))

(assert (=> b!888073 m!826901))

(declare-fun m!826909 () Bool)

(assert (=> b!888073 m!826909))

(declare-fun m!826911 () Bool)

(assert (=> bm!39414 m!826911))

(assert (=> b!887866 d!109839))

(declare-fun d!109841 () Bool)

(declare-fun lt!401476 () SeekEntryResult!8762)

(assert (=> d!109841 (and ((_ is Found!8762) lt!401476) (= (index!37420 lt!401476) lt!401345))))

(assert (=> d!109841 (= lt!401476 (seekEntry!0 key!785 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(declare-fun lt!401475 () Unit!30202)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!51713 (_ BitVec 32)) Unit!30202)

(assert (=> d!109841 (= lt!401475 (choose!0 key!785 lt!401345 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)))))

(assert (=> d!109841 (validMask!0 (mask!25563 thiss!1181))))

(assert (=> d!109841 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401345 (_keys!9830 thiss!1181) (mask!25563 thiss!1181)) lt!401475)))

(declare-fun bs!24876 () Bool)

(assert (= bs!24876 d!109841))

(assert (=> bs!24876 m!826759))

(declare-fun m!826913 () Bool)

(assert (=> bs!24876 m!826913))

(assert (=> bs!24876 m!826789))

(assert (=> b!887866 d!109841))

(declare-fun b!888077 () Bool)

(declare-fun e!494773 () Bool)

(assert (=> b!888077 (= e!494773 tp_is_empty!17881)))

(declare-fun b!888076 () Bool)

(declare-fun e!494772 () Bool)

(assert (=> b!888076 (= e!494772 tp_is_empty!17881)))

(declare-fun mapIsEmpty!28364 () Bool)

(declare-fun mapRes!28364 () Bool)

(assert (=> mapIsEmpty!28364 mapRes!28364))

(declare-fun mapNonEmpty!28364 () Bool)

(declare-fun tp!54623 () Bool)

(assert (=> mapNonEmpty!28364 (= mapRes!28364 (and tp!54623 e!494772))))

(declare-fun mapRest!28364 () (Array (_ BitVec 32) ValueCell!8459))

(declare-fun mapKey!28364 () (_ BitVec 32))

(declare-fun mapValue!28364 () ValueCell!8459)

(assert (=> mapNonEmpty!28364 (= mapRest!28363 (store mapRest!28364 mapKey!28364 mapValue!28364))))

(declare-fun condMapEmpty!28364 () Bool)

(declare-fun mapDefault!28364 () ValueCell!8459)

(assert (=> mapNonEmpty!28363 (= condMapEmpty!28364 (= mapRest!28363 ((as const (Array (_ BitVec 32) ValueCell!8459)) mapDefault!28364)))))

(assert (=> mapNonEmpty!28363 (= tp!54622 (and e!494773 mapRes!28364))))

(assert (= (and mapNonEmpty!28363 condMapEmpty!28364) mapIsEmpty!28364))

(assert (= (and mapNonEmpty!28363 (not condMapEmpty!28364)) mapNonEmpty!28364))

(assert (= (and mapNonEmpty!28364 ((_ is ValueCellFull!8459) mapValue!28364)) b!888076))

(assert (= (and mapNonEmpty!28363 ((_ is ValueCellFull!8459) mapDefault!28364)) b!888077))

(declare-fun m!826915 () Bool)

(assert (=> mapNonEmpty!28364 m!826915))

(declare-fun b_lambda!12859 () Bool)

(assert (= b_lambda!12857 (or (and b!887799 b_free!15553) b_lambda!12859)))

(check-sat (not b!887967) (not b!887979) (not b!888073) (not d!109811) tp_is_empty!17881 (not b!888048) (not bm!39386) (not b!887989) (not b!888043) (not bm!39414) (not d!109841) (not b!888046) (not b!888052) (not b!888041) (not b_lambda!12859) (not b!887903) (not bm!39408) (not d!109819) b_and!25769 (not bm!39389) (not bm!39392) (not b!887918) (not bm!39409) (not d!109831) (not b!887954) (not d!109829) (not b!888037) (not b!888045) (not d!109835) (not b!887988) (not d!109821) (not b!887924) (not b!888071) (not d!109833) (not d!109809) (not b!887909) (not mapNonEmpty!28364) (not b!887936) (not b!888057) (not b!888059) (not bm!39412) (not b!888054) (not b!887935) (not b!888072) (not b!887968) (not b_next!15553) (not b!887970) (not bm!39410) (not d!109825) (not b!888064) (not b!887977))
(check-sat b_and!25769 (not b_next!15553))
