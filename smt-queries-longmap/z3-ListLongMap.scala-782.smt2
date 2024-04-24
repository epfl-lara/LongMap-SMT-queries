; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18542 () Bool)

(assert start!18542)

(declare-fun b!183751 () Bool)

(declare-fun b_free!4531 () Bool)

(declare-fun b_next!4531 () Bool)

(assert (=> b!183751 (= b_free!4531 (not b_next!4531))))

(declare-fun tp!16367 () Bool)

(declare-fun b_and!11121 () Bool)

(assert (=> b!183751 (= tp!16367 b_and!11121)))

(declare-fun b!183743 () Bool)

(declare-fun res!86958 () Bool)

(declare-fun e!120952 () Bool)

(assert (=> b!183743 (=> (not res!86958) (not e!120952))))

(declare-datatypes ((V!5385 0))(
  ( (V!5386 (val!2196 Int)) )
))
(declare-datatypes ((ValueCell!1808 0))(
  ( (ValueCellFull!1808 (v!4101 V!5385)) (EmptyCell!1808) )
))
(declare-datatypes ((array!7787 0))(
  ( (array!7788 (arr!3680 (Array (_ BitVec 32) (_ BitVec 64))) (size!3993 (_ BitVec 32))) )
))
(declare-datatypes ((array!7789 0))(
  ( (array!7790 (arr!3681 (Array (_ BitVec 32) ValueCell!1808)) (size!3994 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2524 0))(
  ( (LongMapFixedSize!2525 (defaultEntry!3754 Int) (mask!8824 (_ BitVec 32)) (extraKeys!3491 (_ BitVec 32)) (zeroValue!3595 V!5385) (minValue!3595 V!5385) (_size!1311 (_ BitVec 32)) (_keys!5676 array!7787) (_values!3737 array!7789) (_vacant!1311 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2524)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183743 (= res!86958 (validMask!0 (mask!8824 thiss!1248)))))

(declare-fun mapNonEmpty!7392 () Bool)

(declare-fun mapRes!7392 () Bool)

(declare-fun tp!16368 () Bool)

(declare-fun e!120958 () Bool)

(assert (=> mapNonEmpty!7392 (= mapRes!7392 (and tp!16368 e!120958))))

(declare-fun mapKey!7392 () (_ BitVec 32))

(declare-fun mapValue!7392 () ValueCell!1808)

(declare-fun mapRest!7392 () (Array (_ BitVec 32) ValueCell!1808))

(assert (=> mapNonEmpty!7392 (= (arr!3681 (_values!3737 thiss!1248)) (store mapRest!7392 mapKey!7392 mapValue!7392))))

(declare-fun b!183744 () Bool)

(declare-fun e!120955 () Bool)

(declare-fun tp_is_empty!4303 () Bool)

(assert (=> b!183744 (= e!120955 tp_is_empty!4303)))

(declare-fun b!183745 () Bool)

(assert (=> b!183745 (= e!120958 tp_is_empty!4303)))

(declare-fun b!183746 () Bool)

(declare-fun e!120954 () Bool)

(assert (=> b!183746 (= e!120954 (and e!120955 mapRes!7392))))

(declare-fun condMapEmpty!7392 () Bool)

(declare-fun mapDefault!7392 () ValueCell!1808)

(assert (=> b!183746 (= condMapEmpty!7392 (= (arr!3681 (_values!3737 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1808)) mapDefault!7392)))))

(declare-fun res!86960 () Bool)

(declare-fun e!120956 () Bool)

(assert (=> start!18542 (=> (not res!86960) (not e!120956))))

(declare-fun valid!1067 (LongMapFixedSize!2524) Bool)

(assert (=> start!18542 (= res!86960 (valid!1067 thiss!1248))))

(assert (=> start!18542 e!120956))

(declare-fun e!120953 () Bool)

(assert (=> start!18542 e!120953))

(assert (=> start!18542 true))

(declare-fun b!183747 () Bool)

(declare-fun res!86959 () Bool)

(assert (=> b!183747 (=> (not res!86959) (not e!120952))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3366 0))(
  ( (tuple2!3367 (_1!1694 (_ BitVec 64)) (_2!1694 V!5385)) )
))
(declare-datatypes ((List!2304 0))(
  ( (Nil!2301) (Cons!2300 (h!2930 tuple2!3366) (t!7166 List!2304)) )
))
(declare-datatypes ((ListLongMap!2287 0))(
  ( (ListLongMap!2288 (toList!1159 List!2304)) )
))
(declare-fun contains!1259 (ListLongMap!2287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!811 (array!7787 array!7789 (_ BitVec 32) (_ BitVec 32) V!5385 V!5385 (_ BitVec 32) Int) ListLongMap!2287)

(assert (=> b!183747 (= res!86959 (not (contains!1259 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) key!828)))))

(declare-fun b!183748 () Bool)

(assert (=> b!183748 (= e!120956 e!120952)))

(declare-fun res!86956 () Bool)

(assert (=> b!183748 (=> (not res!86956) (not e!120952))))

(declare-datatypes ((SeekEntryResult!610 0))(
  ( (MissingZero!610 (index!4610 (_ BitVec 32))) (Found!610 (index!4611 (_ BitVec 32))) (Intermediate!610 (undefined!1422 Bool) (index!4612 (_ BitVec 32)) (x!19990 (_ BitVec 32))) (Undefined!610) (MissingVacant!610 (index!4613 (_ BitVec 32))) )
))
(declare-fun lt!90884 () SeekEntryResult!610)

(get-info :version)

(assert (=> b!183748 (= res!86956 (and (not ((_ is Undefined!610) lt!90884)) (not ((_ is MissingVacant!610) lt!90884)) (not ((_ is MissingZero!610) lt!90884)) ((_ is Found!610) lt!90884)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7787 (_ BitVec 32)) SeekEntryResult!610)

(assert (=> b!183748 (= lt!90884 (seekEntryOrOpen!0 key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(declare-fun b!183749 () Bool)

(assert (=> b!183749 (= e!120952 (and (= (size!3994 (_values!3737 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8824 thiss!1248))) (not (= (size!3993 (_keys!5676 thiss!1248)) (size!3994 (_values!3737 thiss!1248))))))))

(declare-fun mapIsEmpty!7392 () Bool)

(assert (=> mapIsEmpty!7392 mapRes!7392))

(declare-fun b!183750 () Bool)

(declare-fun res!86957 () Bool)

(assert (=> b!183750 (=> (not res!86957) (not e!120956))))

(assert (=> b!183750 (= res!86957 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2375 (array!7787) Bool)

(declare-fun array_inv!2376 (array!7789) Bool)

(assert (=> b!183751 (= e!120953 (and tp!16367 tp_is_empty!4303 (array_inv!2375 (_keys!5676 thiss!1248)) (array_inv!2376 (_values!3737 thiss!1248)) e!120954))))

(assert (= (and start!18542 res!86960) b!183750))

(assert (= (and b!183750 res!86957) b!183748))

(assert (= (and b!183748 res!86956) b!183747))

(assert (= (and b!183747 res!86959) b!183743))

(assert (= (and b!183743 res!86958) b!183749))

(assert (= (and b!183746 condMapEmpty!7392) mapIsEmpty!7392))

(assert (= (and b!183746 (not condMapEmpty!7392)) mapNonEmpty!7392))

(assert (= (and mapNonEmpty!7392 ((_ is ValueCellFull!1808) mapValue!7392)) b!183745))

(assert (= (and b!183746 ((_ is ValueCellFull!1808) mapDefault!7392)) b!183744))

(assert (= b!183751 b!183746))

(assert (= start!18542 b!183751))

(declare-fun m!211369 () Bool)

(assert (=> b!183747 m!211369))

(assert (=> b!183747 m!211369))

(declare-fun m!211371 () Bool)

(assert (=> b!183747 m!211371))

(declare-fun m!211373 () Bool)

(assert (=> b!183748 m!211373))

(declare-fun m!211375 () Bool)

(assert (=> b!183751 m!211375))

(declare-fun m!211377 () Bool)

(assert (=> b!183751 m!211377))

(declare-fun m!211379 () Bool)

(assert (=> start!18542 m!211379))

(declare-fun m!211381 () Bool)

(assert (=> b!183743 m!211381))

(declare-fun m!211383 () Bool)

(assert (=> mapNonEmpty!7392 m!211383))

(check-sat (not b!183743) (not b_next!4531) (not b!183748) (not b!183751) (not start!18542) (not b!183747) b_and!11121 tp_is_empty!4303 (not mapNonEmpty!7392))
(check-sat b_and!11121 (not b_next!4531))
(get-model)

(declare-fun d!54867 () Bool)

(assert (=> d!54867 (= (validMask!0 (mask!8824 thiss!1248)) (and (or (= (mask!8824 thiss!1248) #b00000000000000000000000000000111) (= (mask!8824 thiss!1248) #b00000000000000000000000000001111) (= (mask!8824 thiss!1248) #b00000000000000000000000000011111) (= (mask!8824 thiss!1248) #b00000000000000000000000000111111) (= (mask!8824 thiss!1248) #b00000000000000000000000001111111) (= (mask!8824 thiss!1248) #b00000000000000000000000011111111) (= (mask!8824 thiss!1248) #b00000000000000000000000111111111) (= (mask!8824 thiss!1248) #b00000000000000000000001111111111) (= (mask!8824 thiss!1248) #b00000000000000000000011111111111) (= (mask!8824 thiss!1248) #b00000000000000000000111111111111) (= (mask!8824 thiss!1248) #b00000000000000000001111111111111) (= (mask!8824 thiss!1248) #b00000000000000000011111111111111) (= (mask!8824 thiss!1248) #b00000000000000000111111111111111) (= (mask!8824 thiss!1248) #b00000000000000001111111111111111) (= (mask!8824 thiss!1248) #b00000000000000011111111111111111) (= (mask!8824 thiss!1248) #b00000000000000111111111111111111) (= (mask!8824 thiss!1248) #b00000000000001111111111111111111) (= (mask!8824 thiss!1248) #b00000000000011111111111111111111) (= (mask!8824 thiss!1248) #b00000000000111111111111111111111) (= (mask!8824 thiss!1248) #b00000000001111111111111111111111) (= (mask!8824 thiss!1248) #b00000000011111111111111111111111) (= (mask!8824 thiss!1248) #b00000000111111111111111111111111) (= (mask!8824 thiss!1248) #b00000001111111111111111111111111) (= (mask!8824 thiss!1248) #b00000011111111111111111111111111) (= (mask!8824 thiss!1248) #b00000111111111111111111111111111) (= (mask!8824 thiss!1248) #b00001111111111111111111111111111) (= (mask!8824 thiss!1248) #b00011111111111111111111111111111) (= (mask!8824 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8824 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183743 d!54867))

(declare-fun d!54869 () Bool)

(assert (=> d!54869 (= (array_inv!2375 (_keys!5676 thiss!1248)) (bvsge (size!3993 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183751 d!54869))

(declare-fun d!54871 () Bool)

(assert (=> d!54871 (= (array_inv!2376 (_values!3737 thiss!1248)) (bvsge (size!3994 (_values!3737 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183751 d!54871))

(declare-fun d!54873 () Bool)

(declare-fun e!121005 () Bool)

(assert (=> d!54873 e!121005))

(declare-fun res!86993 () Bool)

(assert (=> d!54873 (=> res!86993 e!121005)))

(declare-fun lt!90900 () Bool)

(assert (=> d!54873 (= res!86993 (not lt!90900))))

(declare-fun lt!90901 () Bool)

(assert (=> d!54873 (= lt!90900 lt!90901)))

(declare-datatypes ((Unit!5556 0))(
  ( (Unit!5557) )
))
(declare-fun lt!90902 () Unit!5556)

(declare-fun e!121006 () Unit!5556)

(assert (=> d!54873 (= lt!90902 e!121006)))

(declare-fun c!32948 () Bool)

(assert (=> d!54873 (= c!32948 lt!90901)))

(declare-fun containsKey!221 (List!2304 (_ BitVec 64)) Bool)

(assert (=> d!54873 (= lt!90901 (containsKey!221 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(assert (=> d!54873 (= (contains!1259 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) key!828) lt!90900)))

(declare-fun b!183812 () Bool)

(declare-fun lt!90899 () Unit!5556)

(assert (=> b!183812 (= e!121006 lt!90899)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!169 (List!2304 (_ BitVec 64)) Unit!5556)

(assert (=> b!183812 (= lt!90899 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-datatypes ((Option!224 0))(
  ( (Some!223 (v!4104 V!5385)) (None!222) )
))
(declare-fun isDefined!170 (Option!224) Bool)

(declare-fun getValueByKey!218 (List!2304 (_ BitVec 64)) Option!224)

(assert (=> b!183812 (isDefined!170 (getValueByKey!218 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-fun b!183813 () Bool)

(declare-fun Unit!5558 () Unit!5556)

(assert (=> b!183813 (= e!121006 Unit!5558)))

(declare-fun b!183814 () Bool)

(assert (=> b!183814 (= e!121005 (isDefined!170 (getValueByKey!218 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828)))))

(assert (= (and d!54873 c!32948) b!183812))

(assert (= (and d!54873 (not c!32948)) b!183813))

(assert (= (and d!54873 (not res!86993)) b!183814))

(declare-fun m!211417 () Bool)

(assert (=> d!54873 m!211417))

(declare-fun m!211419 () Bool)

(assert (=> b!183812 m!211419))

(declare-fun m!211421 () Bool)

(assert (=> b!183812 m!211421))

(assert (=> b!183812 m!211421))

(declare-fun m!211423 () Bool)

(assert (=> b!183812 m!211423))

(assert (=> b!183814 m!211421))

(assert (=> b!183814 m!211421))

(assert (=> b!183814 m!211423))

(assert (=> b!183747 d!54873))

(declare-fun b!183857 () Bool)

(declare-fun e!121036 () Bool)

(declare-fun call!18546 () Bool)

(assert (=> b!183857 (= e!121036 (not call!18546))))

(declare-fun b!183858 () Bool)

(declare-fun e!121040 () ListLongMap!2287)

(declare-fun call!18548 () ListLongMap!2287)

(assert (=> b!183858 (= e!121040 call!18548)))

(declare-fun b!183859 () Bool)

(declare-fun e!121033 () ListLongMap!2287)

(declare-fun call!18549 () ListLongMap!2287)

(declare-fun +!280 (ListLongMap!2287 tuple2!3366) ListLongMap!2287)

(assert (=> b!183859 (= e!121033 (+!280 call!18549 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))

(declare-fun b!183860 () Bool)

(declare-fun res!87014 () Bool)

(declare-fun e!121039 () Bool)

(assert (=> b!183860 (=> (not res!87014) (not e!121039))))

(declare-fun e!121035 () Bool)

(assert (=> b!183860 (= res!87014 e!121035)))

(declare-fun res!87012 () Bool)

(assert (=> b!183860 (=> res!87012 e!121035)))

(declare-fun e!121045 () Bool)

(assert (=> b!183860 (= res!87012 (not e!121045))))

(declare-fun res!87015 () Bool)

(assert (=> b!183860 (=> (not res!87015) (not e!121045))))

(assert (=> b!183860 (= res!87015 (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun b!183861 () Bool)

(declare-fun e!121041 () ListLongMap!2287)

(declare-fun call!18547 () ListLongMap!2287)

(assert (=> b!183861 (= e!121041 call!18547)))

(declare-fun bm!18541 () Bool)

(declare-fun call!18545 () ListLongMap!2287)

(declare-fun getCurrentListMapNoExtraKeys!191 (array!7787 array!7789 (_ BitVec 32) (_ BitVec 32) V!5385 V!5385 (_ BitVec 32) Int) ListLongMap!2287)

(assert (=> bm!18541 (= call!18545 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun b!183862 () Bool)

(declare-fun e!121043 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183862 (= e!121043 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183863 () Bool)

(declare-fun e!121034 () Bool)

(declare-fun call!18544 () Bool)

(assert (=> b!183863 (= e!121034 (not call!18544))))

(declare-fun b!183864 () Bool)

(assert (=> b!183864 (= e!121033 e!121041)))

(declare-fun c!32964 () Bool)

(assert (=> b!183864 (= c!32964 (and (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!54875 () Bool)

(assert (=> d!54875 e!121039))

(declare-fun res!87013 () Bool)

(assert (=> d!54875 (=> (not res!87013) (not e!121039))))

(assert (=> d!54875 (= res!87013 (or (bvsge #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))))

(declare-fun lt!90947 () ListLongMap!2287)

(declare-fun lt!90959 () ListLongMap!2287)

(assert (=> d!54875 (= lt!90947 lt!90959)))

(declare-fun lt!90967 () Unit!5556)

(declare-fun e!121038 () Unit!5556)

(assert (=> d!54875 (= lt!90967 e!121038)))

(declare-fun c!32966 () Bool)

(assert (=> d!54875 (= c!32966 e!121043)))

(declare-fun res!87018 () Bool)

(assert (=> d!54875 (=> (not res!87018) (not e!121043))))

(assert (=> d!54875 (= res!87018 (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> d!54875 (= lt!90959 e!121033)))

(declare-fun c!32962 () Bool)

(assert (=> d!54875 (= c!32962 (and (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54875 (validMask!0 (mask!8824 thiss!1248))))

(assert (=> d!54875 (= (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) lt!90947)))

(declare-fun b!183865 () Bool)

(declare-fun e!121037 () Bool)

(assert (=> b!183865 (= e!121035 e!121037)))

(declare-fun res!87019 () Bool)

(assert (=> b!183865 (=> (not res!87019) (not e!121037))))

(assert (=> b!183865 (= res!87019 (contains!1259 lt!90947 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun b!183866 () Bool)

(assert (=> b!183866 (= e!121039 e!121036)))

(declare-fun c!32963 () Bool)

(assert (=> b!183866 (= c!32963 (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18542 () Bool)

(declare-fun call!18550 () ListLongMap!2287)

(assert (=> bm!18542 (= call!18548 call!18550)))

(declare-fun bm!18543 () Bool)

(assert (=> bm!18543 (= call!18546 (contains!1259 lt!90947 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183867 () Bool)

(declare-fun Unit!5559 () Unit!5556)

(assert (=> b!183867 (= e!121038 Unit!5559)))

(declare-fun bm!18544 () Bool)

(assert (=> bm!18544 (= call!18550 call!18545)))

(declare-fun b!183868 () Bool)

(declare-fun c!32961 () Bool)

(assert (=> b!183868 (= c!32961 (and (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!183868 (= e!121041 e!121040)))

(declare-fun bm!18545 () Bool)

(assert (=> bm!18545 (= call!18544 (contains!1259 lt!90947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18546 () Bool)

(assert (=> bm!18546 (= call!18547 call!18549)))

(declare-fun bm!18547 () Bool)

(assert (=> bm!18547 (= call!18549 (+!280 (ite c!32962 call!18545 (ite c!32964 call!18550 call!18548)) (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(declare-fun b!183869 () Bool)

(assert (=> b!183869 (= e!121040 call!18547)))

(declare-fun b!183870 () Bool)

(declare-fun e!121042 () Bool)

(assert (=> b!183870 (= e!121036 e!121042)))

(declare-fun res!87017 () Bool)

(assert (=> b!183870 (= res!87017 call!18546)))

(assert (=> b!183870 (=> (not res!87017) (not e!121042))))

(declare-fun b!183871 () Bool)

(declare-fun apply!160 (ListLongMap!2287 (_ BitVec 64)) V!5385)

(assert (=> b!183871 (= e!121042 (= (apply!160 lt!90947 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3595 thiss!1248)))))

(declare-fun b!183872 () Bool)

(declare-fun get!2120 (ValueCell!1808 V!5385) V!5385)

(declare-fun dynLambda!503 (Int (_ BitVec 64)) V!5385)

(assert (=> b!183872 (= e!121037 (= (apply!160 lt!90947 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)) (get!2120 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3994 (_values!3737 thiss!1248))))))

(assert (=> b!183872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun b!183873 () Bool)

(declare-fun e!121044 () Bool)

(assert (=> b!183873 (= e!121034 e!121044)))

(declare-fun res!87016 () Bool)

(assert (=> b!183873 (= res!87016 call!18544)))

(assert (=> b!183873 (=> (not res!87016) (not e!121044))))

(declare-fun b!183874 () Bool)

(declare-fun lt!90950 () Unit!5556)

(assert (=> b!183874 (= e!121038 lt!90950)))

(declare-fun lt!90964 () ListLongMap!2287)

(assert (=> b!183874 (= lt!90964 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90965 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90958 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90958 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90951 () Unit!5556)

(declare-fun addStillContains!136 (ListLongMap!2287 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5556)

(assert (=> b!183874 (= lt!90951 (addStillContains!136 lt!90964 lt!90965 (zeroValue!3595 thiss!1248) lt!90958))))

(assert (=> b!183874 (contains!1259 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))) lt!90958)))

(declare-fun lt!90956 () Unit!5556)

(assert (=> b!183874 (= lt!90956 lt!90951)))

(declare-fun lt!90954 () ListLongMap!2287)

(assert (=> b!183874 (= lt!90954 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90957 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90961 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90961 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90960 () Unit!5556)

(declare-fun addApplyDifferent!136 (ListLongMap!2287 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5556)

(assert (=> b!183874 (= lt!90960 (addApplyDifferent!136 lt!90954 lt!90957 (minValue!3595 thiss!1248) lt!90961))))

(assert (=> b!183874 (= (apply!160 (+!280 lt!90954 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))) lt!90961) (apply!160 lt!90954 lt!90961))))

(declare-fun lt!90948 () Unit!5556)

(assert (=> b!183874 (= lt!90948 lt!90960)))

(declare-fun lt!90949 () ListLongMap!2287)

(assert (=> b!183874 (= lt!90949 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90953 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90968 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90968 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90952 () Unit!5556)

(assert (=> b!183874 (= lt!90952 (addApplyDifferent!136 lt!90949 lt!90953 (zeroValue!3595 thiss!1248) lt!90968))))

(assert (=> b!183874 (= (apply!160 (+!280 lt!90949 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))) lt!90968) (apply!160 lt!90949 lt!90968))))

(declare-fun lt!90963 () Unit!5556)

(assert (=> b!183874 (= lt!90963 lt!90952)))

(declare-fun lt!90966 () ListLongMap!2287)

(assert (=> b!183874 (= lt!90966 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))

(declare-fun lt!90955 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90962 () (_ BitVec 64))

(assert (=> b!183874 (= lt!90962 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183874 (= lt!90950 (addApplyDifferent!136 lt!90966 lt!90955 (minValue!3595 thiss!1248) lt!90962))))

(assert (=> b!183874 (= (apply!160 (+!280 lt!90966 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))) lt!90962) (apply!160 lt!90966 lt!90962))))

(declare-fun b!183875 () Bool)

(declare-fun res!87020 () Bool)

(assert (=> b!183875 (=> (not res!87020) (not e!121039))))

(assert (=> b!183875 (= res!87020 e!121034)))

(declare-fun c!32965 () Bool)

(assert (=> b!183875 (= c!32965 (not (= (bvand (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183876 () Bool)

(assert (=> b!183876 (= e!121044 (= (apply!160 lt!90947 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3595 thiss!1248)))))

(declare-fun b!183877 () Bool)

(assert (=> b!183877 (= e!121045 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54875 c!32962) b!183859))

(assert (= (and d!54875 (not c!32962)) b!183864))

(assert (= (and b!183864 c!32964) b!183861))

(assert (= (and b!183864 (not c!32964)) b!183868))

(assert (= (and b!183868 c!32961) b!183869))

(assert (= (and b!183868 (not c!32961)) b!183858))

(assert (= (or b!183869 b!183858) bm!18542))

(assert (= (or b!183861 bm!18542) bm!18544))

(assert (= (or b!183861 b!183869) bm!18546))

(assert (= (or b!183859 bm!18544) bm!18541))

(assert (= (or b!183859 bm!18546) bm!18547))

(assert (= (and d!54875 res!87018) b!183862))

(assert (= (and d!54875 c!32966) b!183874))

(assert (= (and d!54875 (not c!32966)) b!183867))

(assert (= (and d!54875 res!87013) b!183860))

(assert (= (and b!183860 res!87015) b!183877))

(assert (= (and b!183860 (not res!87012)) b!183865))

(assert (= (and b!183865 res!87019) b!183872))

(assert (= (and b!183860 res!87014) b!183875))

(assert (= (and b!183875 c!32965) b!183873))

(assert (= (and b!183875 (not c!32965)) b!183863))

(assert (= (and b!183873 res!87016) b!183876))

(assert (= (or b!183873 b!183863) bm!18545))

(assert (= (and b!183875 res!87020) b!183866))

(assert (= (and b!183866 c!32963) b!183870))

(assert (= (and b!183866 (not c!32963)) b!183857))

(assert (= (and b!183870 res!87017) b!183871))

(assert (= (or b!183870 b!183857) bm!18543))

(declare-fun b_lambda!7225 () Bool)

(assert (=> (not b_lambda!7225) (not b!183872)))

(declare-fun t!7170 () Bool)

(declare-fun tb!2823 () Bool)

(assert (=> (and b!183751 (= (defaultEntry!3754 thiss!1248) (defaultEntry!3754 thiss!1248)) t!7170) tb!2823))

(declare-fun result!4763 () Bool)

(assert (=> tb!2823 (= result!4763 tp_is_empty!4303)))

(assert (=> b!183872 t!7170))

(declare-fun b_and!11127 () Bool)

(assert (= b_and!11121 (and (=> t!7170 result!4763) b_and!11127)))

(declare-fun m!211425 () Bool)

(assert (=> b!183862 m!211425))

(assert (=> b!183862 m!211425))

(declare-fun m!211427 () Bool)

(assert (=> b!183862 m!211427))

(declare-fun m!211429 () Bool)

(assert (=> b!183872 m!211429))

(declare-fun m!211431 () Bool)

(assert (=> b!183872 m!211431))

(assert (=> b!183872 m!211425))

(assert (=> b!183872 m!211431))

(assert (=> b!183872 m!211429))

(declare-fun m!211433 () Bool)

(assert (=> b!183872 m!211433))

(assert (=> b!183872 m!211425))

(declare-fun m!211435 () Bool)

(assert (=> b!183872 m!211435))

(declare-fun m!211437 () Bool)

(assert (=> bm!18541 m!211437))

(declare-fun m!211439 () Bool)

(assert (=> b!183859 m!211439))

(assert (=> b!183877 m!211425))

(assert (=> b!183877 m!211425))

(assert (=> b!183877 m!211427))

(declare-fun m!211441 () Bool)

(assert (=> bm!18547 m!211441))

(declare-fun m!211443 () Bool)

(assert (=> b!183874 m!211443))

(declare-fun m!211445 () Bool)

(assert (=> b!183874 m!211445))

(declare-fun m!211447 () Bool)

(assert (=> b!183874 m!211447))

(declare-fun m!211449 () Bool)

(assert (=> b!183874 m!211449))

(declare-fun m!211451 () Bool)

(assert (=> b!183874 m!211451))

(declare-fun m!211453 () Bool)

(assert (=> b!183874 m!211453))

(assert (=> b!183874 m!211437))

(assert (=> b!183874 m!211447))

(declare-fun m!211455 () Bool)

(assert (=> b!183874 m!211455))

(declare-fun m!211457 () Bool)

(assert (=> b!183874 m!211457))

(declare-fun m!211459 () Bool)

(assert (=> b!183874 m!211459))

(assert (=> b!183874 m!211443))

(declare-fun m!211461 () Bool)

(assert (=> b!183874 m!211461))

(declare-fun m!211463 () Bool)

(assert (=> b!183874 m!211463))

(assert (=> b!183874 m!211463))

(declare-fun m!211465 () Bool)

(assert (=> b!183874 m!211465))

(declare-fun m!211467 () Bool)

(assert (=> b!183874 m!211467))

(declare-fun m!211469 () Bool)

(assert (=> b!183874 m!211469))

(assert (=> b!183874 m!211425))

(assert (=> b!183874 m!211469))

(declare-fun m!211471 () Bool)

(assert (=> b!183874 m!211471))

(assert (=> b!183865 m!211425))

(assert (=> b!183865 m!211425))

(declare-fun m!211473 () Bool)

(assert (=> b!183865 m!211473))

(declare-fun m!211475 () Bool)

(assert (=> b!183871 m!211475))

(declare-fun m!211477 () Bool)

(assert (=> b!183876 m!211477))

(assert (=> d!54875 m!211381))

(declare-fun m!211479 () Bool)

(assert (=> bm!18545 m!211479))

(declare-fun m!211481 () Bool)

(assert (=> bm!18543 m!211481))

(assert (=> b!183747 d!54875))

(declare-fun d!54877 () Bool)

(declare-fun res!87027 () Bool)

(declare-fun e!121048 () Bool)

(assert (=> d!54877 (=> (not res!87027) (not e!121048))))

(declare-fun simpleValid!176 (LongMapFixedSize!2524) Bool)

(assert (=> d!54877 (= res!87027 (simpleValid!176 thiss!1248))))

(assert (=> d!54877 (= (valid!1067 thiss!1248) e!121048)))

(declare-fun b!183886 () Bool)

(declare-fun res!87028 () Bool)

(assert (=> b!183886 (=> (not res!87028) (not e!121048))))

(declare-fun arrayCountValidKeys!0 (array!7787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183886 (= res!87028 (= (arrayCountValidKeys!0 (_keys!5676 thiss!1248) #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))) (_size!1311 thiss!1248)))))

(declare-fun b!183887 () Bool)

(declare-fun res!87029 () Bool)

(assert (=> b!183887 (=> (not res!87029) (not e!121048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7787 (_ BitVec 32)) Bool)

(assert (=> b!183887 (= res!87029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(declare-fun b!183888 () Bool)

(declare-datatypes ((List!2307 0))(
  ( (Nil!2304) (Cons!2303 (h!2933 (_ BitVec 64)) (t!7171 List!2307)) )
))
(declare-fun arrayNoDuplicates!0 (array!7787 (_ BitVec 32) List!2307) Bool)

(assert (=> b!183888 (= e!121048 (arrayNoDuplicates!0 (_keys!5676 thiss!1248) #b00000000000000000000000000000000 Nil!2304))))

(assert (= (and d!54877 res!87027) b!183886))

(assert (= (and b!183886 res!87028) b!183887))

(assert (= (and b!183887 res!87029) b!183888))

(declare-fun m!211483 () Bool)

(assert (=> d!54877 m!211483))

(declare-fun m!211485 () Bool)

(assert (=> b!183886 m!211485))

(declare-fun m!211487 () Bool)

(assert (=> b!183887 m!211487))

(declare-fun m!211489 () Bool)

(assert (=> b!183888 m!211489))

(assert (=> start!18542 d!54877))

(declare-fun b!183901 () Bool)

(declare-fun e!121055 () SeekEntryResult!610)

(assert (=> b!183901 (= e!121055 Undefined!610)))

(declare-fun b!183902 () Bool)

(declare-fun e!121057 () SeekEntryResult!610)

(declare-fun lt!90977 () SeekEntryResult!610)

(assert (=> b!183902 (= e!121057 (MissingZero!610 (index!4612 lt!90977)))))

(declare-fun b!183903 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7787 (_ BitVec 32)) SeekEntryResult!610)

(assert (=> b!183903 (= e!121057 (seekKeyOrZeroReturnVacant!0 (x!19990 lt!90977) (index!4612 lt!90977) (index!4612 lt!90977) key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(declare-fun d!54879 () Bool)

(declare-fun lt!90975 () SeekEntryResult!610)

(assert (=> d!54879 (and (or ((_ is Undefined!610) lt!90975) (not ((_ is Found!610) lt!90975)) (and (bvsge (index!4611 lt!90975) #b00000000000000000000000000000000) (bvslt (index!4611 lt!90975) (size!3993 (_keys!5676 thiss!1248))))) (or ((_ is Undefined!610) lt!90975) ((_ is Found!610) lt!90975) (not ((_ is MissingZero!610) lt!90975)) (and (bvsge (index!4610 lt!90975) #b00000000000000000000000000000000) (bvslt (index!4610 lt!90975) (size!3993 (_keys!5676 thiss!1248))))) (or ((_ is Undefined!610) lt!90975) ((_ is Found!610) lt!90975) ((_ is MissingZero!610) lt!90975) (not ((_ is MissingVacant!610) lt!90975)) (and (bvsge (index!4613 lt!90975) #b00000000000000000000000000000000) (bvslt (index!4613 lt!90975) (size!3993 (_keys!5676 thiss!1248))))) (or ((_ is Undefined!610) lt!90975) (ite ((_ is Found!610) lt!90975) (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4611 lt!90975)) key!828) (ite ((_ is MissingZero!610) lt!90975) (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4610 lt!90975)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!610) lt!90975) (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4613 lt!90975)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54879 (= lt!90975 e!121055)))

(declare-fun c!32974 () Bool)

(assert (=> d!54879 (= c!32974 (and ((_ is Intermediate!610) lt!90977) (undefined!1422 lt!90977)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7787 (_ BitVec 32)) SeekEntryResult!610)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54879 (= lt!90977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8824 thiss!1248)) key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(assert (=> d!54879 (validMask!0 (mask!8824 thiss!1248))))

(assert (=> d!54879 (= (seekEntryOrOpen!0 key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)) lt!90975)))

(declare-fun b!183904 () Bool)

(declare-fun e!121056 () SeekEntryResult!610)

(assert (=> b!183904 (= e!121056 (Found!610 (index!4612 lt!90977)))))

(declare-fun b!183905 () Bool)

(declare-fun c!32975 () Bool)

(declare-fun lt!90976 () (_ BitVec 64))

(assert (=> b!183905 (= c!32975 (= lt!90976 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183905 (= e!121056 e!121057)))

(declare-fun b!183906 () Bool)

(assert (=> b!183906 (= e!121055 e!121056)))

(assert (=> b!183906 (= lt!90976 (select (arr!3680 (_keys!5676 thiss!1248)) (index!4612 lt!90977)))))

(declare-fun c!32973 () Bool)

(assert (=> b!183906 (= c!32973 (= lt!90976 key!828))))

(assert (= (and d!54879 c!32974) b!183901))

(assert (= (and d!54879 (not c!32974)) b!183906))

(assert (= (and b!183906 c!32973) b!183904))

(assert (= (and b!183906 (not c!32973)) b!183905))

(assert (= (and b!183905 c!32975) b!183902))

(assert (= (and b!183905 (not c!32975)) b!183903))

(declare-fun m!211491 () Bool)

(assert (=> b!183903 m!211491))

(declare-fun m!211493 () Bool)

(assert (=> d!54879 m!211493))

(declare-fun m!211495 () Bool)

(assert (=> d!54879 m!211495))

(declare-fun m!211497 () Bool)

(assert (=> d!54879 m!211497))

(assert (=> d!54879 m!211381))

(assert (=> d!54879 m!211495))

(declare-fun m!211499 () Bool)

(assert (=> d!54879 m!211499))

(declare-fun m!211501 () Bool)

(assert (=> d!54879 m!211501))

(declare-fun m!211503 () Bool)

(assert (=> b!183906 m!211503))

(assert (=> b!183748 d!54879))

(declare-fun mapNonEmpty!7401 () Bool)

(declare-fun mapRes!7401 () Bool)

(declare-fun tp!16383 () Bool)

(declare-fun e!121063 () Bool)

(assert (=> mapNonEmpty!7401 (= mapRes!7401 (and tp!16383 e!121063))))

(declare-fun mapRest!7401 () (Array (_ BitVec 32) ValueCell!1808))

(declare-fun mapKey!7401 () (_ BitVec 32))

(declare-fun mapValue!7401 () ValueCell!1808)

(assert (=> mapNonEmpty!7401 (= mapRest!7392 (store mapRest!7401 mapKey!7401 mapValue!7401))))

(declare-fun b!183914 () Bool)

(declare-fun e!121062 () Bool)

(assert (=> b!183914 (= e!121062 tp_is_empty!4303)))

(declare-fun b!183913 () Bool)

(assert (=> b!183913 (= e!121063 tp_is_empty!4303)))

(declare-fun condMapEmpty!7401 () Bool)

(declare-fun mapDefault!7401 () ValueCell!1808)

(assert (=> mapNonEmpty!7392 (= condMapEmpty!7401 (= mapRest!7392 ((as const (Array (_ BitVec 32) ValueCell!1808)) mapDefault!7401)))))

(assert (=> mapNonEmpty!7392 (= tp!16368 (and e!121062 mapRes!7401))))

(declare-fun mapIsEmpty!7401 () Bool)

(assert (=> mapIsEmpty!7401 mapRes!7401))

(assert (= (and mapNonEmpty!7392 condMapEmpty!7401) mapIsEmpty!7401))

(assert (= (and mapNonEmpty!7392 (not condMapEmpty!7401)) mapNonEmpty!7401))

(assert (= (and mapNonEmpty!7401 ((_ is ValueCellFull!1808) mapValue!7401)) b!183913))

(assert (= (and mapNonEmpty!7392 ((_ is ValueCellFull!1808) mapDefault!7401)) b!183914))

(declare-fun m!211505 () Bool)

(assert (=> mapNonEmpty!7401 m!211505))

(declare-fun b_lambda!7227 () Bool)

(assert (= b_lambda!7225 (or (and b!183751 b_free!4531) b_lambda!7227)))

(check-sat (not b!183877) (not b!183874) (not b!183886) (not b_lambda!7227) (not b!183814) (not b_next!4531) (not bm!18541) (not b!183865) (not d!54877) (not bm!18543) (not b!183872) (not b!183876) (not bm!18547) (not b!183871) (not b!183859) (not bm!18545) (not d!54879) (not b!183888) (not b!183887) (not d!54875) (not d!54873) (not b!183812) (not b!183903) b_and!11127 (not mapNonEmpty!7401) (not b!183862) tp_is_empty!4303)
(check-sat b_and!11127 (not b_next!4531))
(get-model)

(declare-fun d!54881 () Bool)

(declare-fun get!2121 (Option!224) V!5385)

(assert (=> d!54881 (= (apply!160 lt!90947 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)) (get!2121 (getValueByKey!218 (toList!1159 lt!90947) (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7487 () Bool)

(assert (= bs!7487 d!54881))

(assert (=> bs!7487 m!211425))

(declare-fun m!211507 () Bool)

(assert (=> bs!7487 m!211507))

(assert (=> bs!7487 m!211507))

(declare-fun m!211509 () Bool)

(assert (=> bs!7487 m!211509))

(assert (=> b!183872 d!54881))

(declare-fun d!54883 () Bool)

(declare-fun c!32978 () Bool)

(assert (=> d!54883 (= c!32978 ((_ is ValueCellFull!1808) (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121066 () V!5385)

(assert (=> d!54883 (= (get!2120 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121066)))

(declare-fun b!183919 () Bool)

(declare-fun get!2122 (ValueCell!1808 V!5385) V!5385)

(assert (=> b!183919 (= e!121066 (get!2122 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183920 () Bool)

(declare-fun get!2123 (ValueCell!1808 V!5385) V!5385)

(assert (=> b!183920 (= e!121066 (get!2123 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54883 c!32978) b!183919))

(assert (= (and d!54883 (not c!32978)) b!183920))

(assert (=> b!183919 m!211431))

(assert (=> b!183919 m!211429))

(declare-fun m!211511 () Bool)

(assert (=> b!183919 m!211511))

(assert (=> b!183920 m!211431))

(assert (=> b!183920 m!211429))

(declare-fun m!211513 () Bool)

(assert (=> b!183920 m!211513))

(assert (=> b!183872 d!54883))

(declare-fun d!54885 () Bool)

(declare-fun e!121067 () Bool)

(assert (=> d!54885 e!121067))

(declare-fun res!87030 () Bool)

(assert (=> d!54885 (=> res!87030 e!121067)))

(declare-fun lt!90979 () Bool)

(assert (=> d!54885 (= res!87030 (not lt!90979))))

(declare-fun lt!90980 () Bool)

(assert (=> d!54885 (= lt!90979 lt!90980)))

(declare-fun lt!90981 () Unit!5556)

(declare-fun e!121068 () Unit!5556)

(assert (=> d!54885 (= lt!90981 e!121068)))

(declare-fun c!32979 () Bool)

(assert (=> d!54885 (= c!32979 lt!90980)))

(assert (=> d!54885 (= lt!90980 (containsKey!221 (toList!1159 lt!90947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54885 (= (contains!1259 lt!90947 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90979)))

(declare-fun b!183921 () Bool)

(declare-fun lt!90978 () Unit!5556)

(assert (=> b!183921 (= e!121068 lt!90978)))

(assert (=> b!183921 (= lt!90978 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1159 lt!90947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183921 (isDefined!170 (getValueByKey!218 (toList!1159 lt!90947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183922 () Bool)

(declare-fun Unit!5560 () Unit!5556)

(assert (=> b!183922 (= e!121068 Unit!5560)))

(declare-fun b!183923 () Bool)

(assert (=> b!183923 (= e!121067 (isDefined!170 (getValueByKey!218 (toList!1159 lt!90947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54885 c!32979) b!183921))

(assert (= (and d!54885 (not c!32979)) b!183922))

(assert (= (and d!54885 (not res!87030)) b!183923))

(declare-fun m!211515 () Bool)

(assert (=> d!54885 m!211515))

(declare-fun m!211517 () Bool)

(assert (=> b!183921 m!211517))

(declare-fun m!211519 () Bool)

(assert (=> b!183921 m!211519))

(assert (=> b!183921 m!211519))

(declare-fun m!211521 () Bool)

(assert (=> b!183921 m!211521))

(assert (=> b!183923 m!211519))

(assert (=> b!183923 m!211519))

(assert (=> b!183923 m!211521))

(assert (=> bm!18543 d!54885))

(declare-fun b!183934 () Bool)

(declare-fun e!121078 () Bool)

(declare-fun e!121080 () Bool)

(assert (=> b!183934 (= e!121078 e!121080)))

(declare-fun c!32982 () Bool)

(assert (=> b!183934 (= c!32982 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183935 () Bool)

(declare-fun e!121079 () Bool)

(assert (=> b!183935 (= e!121079 e!121078)))

(declare-fun res!87038 () Bool)

(assert (=> b!183935 (=> (not res!87038) (not e!121078))))

(declare-fun e!121077 () Bool)

(assert (=> b!183935 (= res!87038 (not e!121077))))

(declare-fun res!87037 () Bool)

(assert (=> b!183935 (=> (not res!87037) (not e!121077))))

(assert (=> b!183935 (= res!87037 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183936 () Bool)

(declare-fun call!18553 () Bool)

(assert (=> b!183936 (= e!121080 call!18553)))

(declare-fun b!183937 () Bool)

(declare-fun contains!1262 (List!2307 (_ BitVec 64)) Bool)

(assert (=> b!183937 (= e!121077 (contains!1262 Nil!2304 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183938 () Bool)

(assert (=> b!183938 (= e!121080 call!18553)))

(declare-fun bm!18550 () Bool)

(assert (=> bm!18550 (= call!18553 (arrayNoDuplicates!0 (_keys!5676 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32982 (Cons!2303 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000) Nil!2304) Nil!2304)))))

(declare-fun d!54887 () Bool)

(declare-fun res!87039 () Bool)

(assert (=> d!54887 (=> res!87039 e!121079)))

(assert (=> d!54887 (= res!87039 (bvsge #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> d!54887 (= (arrayNoDuplicates!0 (_keys!5676 thiss!1248) #b00000000000000000000000000000000 Nil!2304) e!121079)))

(assert (= (and d!54887 (not res!87039)) b!183935))

(assert (= (and b!183935 res!87037) b!183937))

(assert (= (and b!183935 res!87038) b!183934))

(assert (= (and b!183934 c!32982) b!183936))

(assert (= (and b!183934 (not c!32982)) b!183938))

(assert (= (or b!183936 b!183938) bm!18550))

(assert (=> b!183934 m!211425))

(assert (=> b!183934 m!211425))

(assert (=> b!183934 m!211427))

(assert (=> b!183935 m!211425))

(assert (=> b!183935 m!211425))

(assert (=> b!183935 m!211427))

(assert (=> b!183937 m!211425))

(assert (=> b!183937 m!211425))

(declare-fun m!211523 () Bool)

(assert (=> b!183937 m!211523))

(assert (=> bm!18550 m!211425))

(declare-fun m!211525 () Bool)

(assert (=> bm!18550 m!211525))

(assert (=> b!183888 d!54887))

(declare-fun d!54889 () Bool)

(assert (=> d!54889 (= (apply!160 lt!90947 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2121 (getValueByKey!218 (toList!1159 lt!90947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7488 () Bool)

(assert (= bs!7488 d!54889))

(assert (=> bs!7488 m!211519))

(assert (=> bs!7488 m!211519))

(declare-fun m!211527 () Bool)

(assert (=> bs!7488 m!211527))

(assert (=> b!183871 d!54889))

(declare-fun b!183947 () Bool)

(declare-fun e!121087 () Bool)

(declare-fun call!18556 () Bool)

(assert (=> b!183947 (= e!121087 call!18556)))

(declare-fun b!183948 () Bool)

(declare-fun e!121088 () Bool)

(declare-fun e!121089 () Bool)

(assert (=> b!183948 (= e!121088 e!121089)))

(declare-fun c!32985 () Bool)

(assert (=> b!183948 (= c!32985 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183949 () Bool)

(assert (=> b!183949 (= e!121089 call!18556)))

(declare-fun b!183950 () Bool)

(assert (=> b!183950 (= e!121089 e!121087)))

(declare-fun lt!90988 () (_ BitVec 64))

(assert (=> b!183950 (= lt!90988 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90990 () Unit!5556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7787 (_ BitVec 64) (_ BitVec 32)) Unit!5556)

(assert (=> b!183950 (= lt!90990 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5676 thiss!1248) lt!90988 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183950 (arrayContainsKey!0 (_keys!5676 thiss!1248) lt!90988 #b00000000000000000000000000000000)))

(declare-fun lt!90989 () Unit!5556)

(assert (=> b!183950 (= lt!90989 lt!90990)))

(declare-fun res!87044 () Bool)

(assert (=> b!183950 (= res!87044 (= (seekEntryOrOpen!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000) (_keys!5676 thiss!1248) (mask!8824 thiss!1248)) (Found!610 #b00000000000000000000000000000000)))))

(assert (=> b!183950 (=> (not res!87044) (not e!121087))))

(declare-fun bm!18553 () Bool)

(assert (=> bm!18553 (= call!18556 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(declare-fun d!54891 () Bool)

(declare-fun res!87045 () Bool)

(assert (=> d!54891 (=> res!87045 e!121088)))

(assert (=> d!54891 (= res!87045 (bvsge #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> d!54891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)) e!121088)))

(assert (= (and d!54891 (not res!87045)) b!183948))

(assert (= (and b!183948 c!32985) b!183950))

(assert (= (and b!183948 (not c!32985)) b!183949))

(assert (= (and b!183950 res!87044) b!183947))

(assert (= (or b!183947 b!183949) bm!18553))

(assert (=> b!183948 m!211425))

(assert (=> b!183948 m!211425))

(assert (=> b!183948 m!211427))

(assert (=> b!183950 m!211425))

(declare-fun m!211529 () Bool)

(assert (=> b!183950 m!211529))

(declare-fun m!211531 () Bool)

(assert (=> b!183950 m!211531))

(assert (=> b!183950 m!211425))

(declare-fun m!211533 () Bool)

(assert (=> b!183950 m!211533))

(declare-fun m!211535 () Bool)

(assert (=> bm!18553 m!211535))

(assert (=> b!183887 d!54891))

(declare-fun b!183969 () Bool)

(declare-fun lt!90996 () SeekEntryResult!610)

(assert (=> b!183969 (and (bvsge (index!4612 lt!90996) #b00000000000000000000000000000000) (bvslt (index!4612 lt!90996) (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun res!87054 () Bool)

(assert (=> b!183969 (= res!87054 (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4612 lt!90996)) key!828))))

(declare-fun e!121102 () Bool)

(assert (=> b!183969 (=> res!87054 e!121102)))

(declare-fun e!121101 () Bool)

(assert (=> b!183969 (= e!121101 e!121102)))

(declare-fun b!183970 () Bool)

(assert (=> b!183970 (and (bvsge (index!4612 lt!90996) #b00000000000000000000000000000000) (bvslt (index!4612 lt!90996) (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun res!87052 () Bool)

(assert (=> b!183970 (= res!87052 (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4612 lt!90996)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183970 (=> res!87052 e!121102)))

(declare-fun b!183971 () Bool)

(declare-fun e!121103 () SeekEntryResult!610)

(assert (=> b!183971 (= e!121103 (Intermediate!610 true (toIndex!0 key!828 (mask!8824 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183972 () Bool)

(declare-fun e!121104 () SeekEntryResult!610)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183972 (= e!121104 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8824 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8824 thiss!1248)) key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(declare-fun b!183973 () Bool)

(declare-fun e!121100 () Bool)

(assert (=> b!183973 (= e!121100 e!121101)))

(declare-fun res!87053 () Bool)

(assert (=> b!183973 (= res!87053 (and ((_ is Intermediate!610) lt!90996) (not (undefined!1422 lt!90996)) (bvslt (x!19990 lt!90996) #b01111111111111111111111111111110) (bvsge (x!19990 lt!90996) #b00000000000000000000000000000000) (bvsge (x!19990 lt!90996) #b00000000000000000000000000000000)))))

(assert (=> b!183973 (=> (not res!87053) (not e!121101))))

(declare-fun b!183974 () Bool)

(assert (=> b!183974 (= e!121103 e!121104)))

(declare-fun c!32993 () Bool)

(declare-fun lt!90995 () (_ BitVec 64))

(assert (=> b!183974 (= c!32993 (or (= lt!90995 key!828) (= (bvadd lt!90995 lt!90995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183975 () Bool)

(assert (=> b!183975 (= e!121100 (bvsge (x!19990 lt!90996) #b01111111111111111111111111111110))))

(declare-fun d!54893 () Bool)

(assert (=> d!54893 e!121100))

(declare-fun c!32992 () Bool)

(assert (=> d!54893 (= c!32992 (and ((_ is Intermediate!610) lt!90996) (undefined!1422 lt!90996)))))

(assert (=> d!54893 (= lt!90996 e!121103)))

(declare-fun c!32994 () Bool)

(assert (=> d!54893 (= c!32994 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54893 (= lt!90995 (select (arr!3680 (_keys!5676 thiss!1248)) (toIndex!0 key!828 (mask!8824 thiss!1248))))))

(assert (=> d!54893 (validMask!0 (mask!8824 thiss!1248))))

(assert (=> d!54893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8824 thiss!1248)) key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)) lt!90996)))

(declare-fun b!183976 () Bool)

(assert (=> b!183976 (= e!121104 (Intermediate!610 false (toIndex!0 key!828 (mask!8824 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183977 () Bool)

(assert (=> b!183977 (and (bvsge (index!4612 lt!90996) #b00000000000000000000000000000000) (bvslt (index!4612 lt!90996) (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> b!183977 (= e!121102 (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4612 lt!90996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!54893 c!32994) b!183971))

(assert (= (and d!54893 (not c!32994)) b!183974))

(assert (= (and b!183974 c!32993) b!183976))

(assert (= (and b!183974 (not c!32993)) b!183972))

(assert (= (and d!54893 c!32992) b!183975))

(assert (= (and d!54893 (not c!32992)) b!183973))

(assert (= (and b!183973 res!87053) b!183969))

(assert (= (and b!183969 (not res!87054)) b!183970))

(assert (= (and b!183970 (not res!87052)) b!183977))

(declare-fun m!211537 () Bool)

(assert (=> b!183977 m!211537))

(assert (=> b!183969 m!211537))

(assert (=> d!54893 m!211495))

(declare-fun m!211539 () Bool)

(assert (=> d!54893 m!211539))

(assert (=> d!54893 m!211381))

(assert (=> b!183972 m!211495))

(declare-fun m!211541 () Bool)

(assert (=> b!183972 m!211541))

(assert (=> b!183972 m!211541))

(declare-fun m!211543 () Bool)

(assert (=> b!183972 m!211543))

(assert (=> b!183970 m!211537))

(assert (=> d!54879 d!54893))

(declare-fun d!54895 () Bool)

(declare-fun lt!91002 () (_ BitVec 32))

(declare-fun lt!91001 () (_ BitVec 32))

(assert (=> d!54895 (= lt!91002 (bvmul (bvxor lt!91001 (bvlshr lt!91001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54895 (= lt!91001 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54895 (and (bvsge (mask!8824 thiss!1248) #b00000000000000000000000000000000) (let ((res!87055 (let ((h!2934 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20008 (bvmul (bvxor h!2934 (bvlshr h!2934 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20008 (bvlshr x!20008 #b00000000000000000000000000001101)) (mask!8824 thiss!1248)))))) (and (bvslt res!87055 (bvadd (mask!8824 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87055 #b00000000000000000000000000000000))))))

(assert (=> d!54895 (= (toIndex!0 key!828 (mask!8824 thiss!1248)) (bvand (bvxor lt!91002 (bvlshr lt!91002 #b00000000000000000000000000001101)) (mask!8824 thiss!1248)))))

(assert (=> d!54879 d!54895))

(assert (=> d!54879 d!54867))

(declare-fun d!54897 () Bool)

(declare-fun e!121105 () Bool)

(assert (=> d!54897 e!121105))

(declare-fun res!87056 () Bool)

(assert (=> d!54897 (=> res!87056 e!121105)))

(declare-fun lt!91004 () Bool)

(assert (=> d!54897 (= res!87056 (not lt!91004))))

(declare-fun lt!91005 () Bool)

(assert (=> d!54897 (= lt!91004 lt!91005)))

(declare-fun lt!91006 () Unit!5556)

(declare-fun e!121106 () Unit!5556)

(assert (=> d!54897 (= lt!91006 e!121106)))

(declare-fun c!32995 () Bool)

(assert (=> d!54897 (= c!32995 lt!91005)))

(assert (=> d!54897 (= lt!91005 (containsKey!221 (toList!1159 lt!90947) (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54897 (= (contains!1259 lt!90947 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)) lt!91004)))

(declare-fun b!183978 () Bool)

(declare-fun lt!91003 () Unit!5556)

(assert (=> b!183978 (= e!121106 lt!91003)))

(assert (=> b!183978 (= lt!91003 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1159 lt!90947) (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183978 (isDefined!170 (getValueByKey!218 (toList!1159 lt!90947) (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183979 () Bool)

(declare-fun Unit!5561 () Unit!5556)

(assert (=> b!183979 (= e!121106 Unit!5561)))

(declare-fun b!183980 () Bool)

(assert (=> b!183980 (= e!121105 (isDefined!170 (getValueByKey!218 (toList!1159 lt!90947) (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54897 c!32995) b!183978))

(assert (= (and d!54897 (not c!32995)) b!183979))

(assert (= (and d!54897 (not res!87056)) b!183980))

(assert (=> d!54897 m!211425))

(declare-fun m!211545 () Bool)

(assert (=> d!54897 m!211545))

(assert (=> b!183978 m!211425))

(declare-fun m!211547 () Bool)

(assert (=> b!183978 m!211547))

(assert (=> b!183978 m!211425))

(assert (=> b!183978 m!211507))

(assert (=> b!183978 m!211507))

(declare-fun m!211549 () Bool)

(assert (=> b!183978 m!211549))

(assert (=> b!183980 m!211425))

(assert (=> b!183980 m!211507))

(assert (=> b!183980 m!211507))

(assert (=> b!183980 m!211549))

(assert (=> b!183865 d!54897))

(declare-fun d!54899 () Bool)

(declare-fun e!121109 () Bool)

(assert (=> d!54899 e!121109))

(declare-fun res!87061 () Bool)

(assert (=> d!54899 (=> (not res!87061) (not e!121109))))

(declare-fun lt!91016 () ListLongMap!2287)

(assert (=> d!54899 (= res!87061 (contains!1259 lt!91016 (_1!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun lt!91017 () List!2304)

(assert (=> d!54899 (= lt!91016 (ListLongMap!2288 lt!91017))))

(declare-fun lt!91015 () Unit!5556)

(declare-fun lt!91018 () Unit!5556)

(assert (=> d!54899 (= lt!91015 lt!91018)))

(assert (=> d!54899 (= (getValueByKey!218 lt!91017 (_1!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))) (Some!223 (_2!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!115 (List!2304 (_ BitVec 64) V!5385) Unit!5556)

(assert (=> d!54899 (= lt!91018 (lemmaContainsTupThenGetReturnValue!115 lt!91017 (_1!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (_2!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun insertStrictlySorted!118 (List!2304 (_ BitVec 64) V!5385) List!2304)

(assert (=> d!54899 (= lt!91017 (insertStrictlySorted!118 (toList!1159 (ite c!32962 call!18545 (ite c!32964 call!18550 call!18548))) (_1!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (_2!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(assert (=> d!54899 (= (+!280 (ite c!32962 call!18545 (ite c!32964 call!18550 call!18548)) (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) lt!91016)))

(declare-fun b!183985 () Bool)

(declare-fun res!87062 () Bool)

(assert (=> b!183985 (=> (not res!87062) (not e!121109))))

(assert (=> b!183985 (= res!87062 (= (getValueByKey!218 (toList!1159 lt!91016) (_1!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))) (Some!223 (_2!1694 (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))))

(declare-fun b!183986 () Bool)

(declare-fun contains!1263 (List!2304 tuple2!3366) Bool)

(assert (=> b!183986 (= e!121109 (contains!1263 (toList!1159 lt!91016) (ite (or c!32962 c!32964) (tuple2!3367 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3595 thiss!1248)) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (= (and d!54899 res!87061) b!183985))

(assert (= (and b!183985 res!87062) b!183986))

(declare-fun m!211551 () Bool)

(assert (=> d!54899 m!211551))

(declare-fun m!211553 () Bool)

(assert (=> d!54899 m!211553))

(declare-fun m!211555 () Bool)

(assert (=> d!54899 m!211555))

(declare-fun m!211557 () Bool)

(assert (=> d!54899 m!211557))

(declare-fun m!211559 () Bool)

(assert (=> b!183985 m!211559))

(declare-fun m!211561 () Bool)

(assert (=> b!183986 m!211561))

(assert (=> bm!18547 d!54899))

(assert (=> d!54875 d!54867))

(declare-fun b!183998 () Bool)

(declare-fun e!121112 () Bool)

(assert (=> b!183998 (= e!121112 (and (bvsge (extraKeys!3491 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3491 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1311 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!183996 () Bool)

(declare-fun res!87071 () Bool)

(assert (=> b!183996 (=> (not res!87071) (not e!121112))))

(declare-fun size!3999 (LongMapFixedSize!2524) (_ BitVec 32))

(assert (=> b!183996 (= res!87071 (bvsge (size!3999 thiss!1248) (_size!1311 thiss!1248)))))

(declare-fun b!183995 () Bool)

(declare-fun res!87074 () Bool)

(assert (=> b!183995 (=> (not res!87074) (not e!121112))))

(assert (=> b!183995 (= res!87074 (and (= (size!3994 (_values!3737 thiss!1248)) (bvadd (mask!8824 thiss!1248) #b00000000000000000000000000000001)) (= (size!3993 (_keys!5676 thiss!1248)) (size!3994 (_values!3737 thiss!1248))) (bvsge (_size!1311 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1311 thiss!1248) (bvadd (mask!8824 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!54901 () Bool)

(declare-fun res!87073 () Bool)

(assert (=> d!54901 (=> (not res!87073) (not e!121112))))

(assert (=> d!54901 (= res!87073 (validMask!0 (mask!8824 thiss!1248)))))

(assert (=> d!54901 (= (simpleValid!176 thiss!1248) e!121112)))

(declare-fun b!183997 () Bool)

(declare-fun res!87072 () Bool)

(assert (=> b!183997 (=> (not res!87072) (not e!121112))))

(assert (=> b!183997 (= res!87072 (= (size!3999 thiss!1248) (bvadd (_size!1311 thiss!1248) (bvsdiv (bvadd (extraKeys!3491 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!54901 res!87073) b!183995))

(assert (= (and b!183995 res!87074) b!183996))

(assert (= (and b!183996 res!87071) b!183997))

(assert (= (and b!183997 res!87072) b!183998))

(declare-fun m!211563 () Bool)

(assert (=> b!183996 m!211563))

(assert (=> d!54901 m!211381))

(assert (=> b!183997 m!211563))

(assert (=> d!54877 d!54901))

(declare-fun d!54903 () Bool)

(declare-fun isEmpty!471 (Option!224) Bool)

(assert (=> d!54903 (= (isDefined!170 (getValueByKey!218 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828)) (not (isEmpty!471 (getValueByKey!218 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))))

(declare-fun bs!7489 () Bool)

(assert (= bs!7489 d!54903))

(assert (=> bs!7489 m!211421))

(declare-fun m!211565 () Bool)

(assert (=> bs!7489 m!211565))

(assert (=> b!183814 d!54903))

(declare-fun b!184007 () Bool)

(declare-fun e!121117 () Option!224)

(assert (=> b!184007 (= e!121117 (Some!223 (_2!1694 (h!2930 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))))))

(declare-fun b!184010 () Bool)

(declare-fun e!121118 () Option!224)

(assert (=> b!184010 (= e!121118 None!222)))

(declare-fun d!54905 () Bool)

(declare-fun c!33000 () Bool)

(assert (=> d!54905 (= c!33000 (and ((_ is Cons!2300) (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (= (_1!1694 (h!2930 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)))))

(assert (=> d!54905 (= (getValueByKey!218 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828) e!121117)))

(declare-fun b!184008 () Bool)

(assert (=> b!184008 (= e!121117 e!121118)))

(declare-fun c!33001 () Bool)

(assert (=> b!184008 (= c!33001 (and ((_ is Cons!2300) (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (not (= (_1!1694 (h!2930 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828))))))

(declare-fun b!184009 () Bool)

(assert (=> b!184009 (= e!121118 (getValueByKey!218 (t!7166 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) key!828))))

(assert (= (and d!54905 c!33000) b!184007))

(assert (= (and d!54905 (not c!33000)) b!184008))

(assert (= (and b!184008 c!33001) b!184009))

(assert (= (and b!184008 (not c!33001)) b!184010))

(declare-fun m!211567 () Bool)

(assert (=> b!184009 m!211567))

(assert (=> b!183814 d!54905))

(declare-fun b!184019 () Bool)

(declare-fun e!121124 () (_ BitVec 32))

(assert (=> b!184019 (= e!121124 #b00000000000000000000000000000000)))

(declare-fun b!184020 () Bool)

(declare-fun e!121123 () (_ BitVec 32))

(assert (=> b!184020 (= e!121124 e!121123)))

(declare-fun c!33007 () Bool)

(assert (=> b!184020 (= c!33007 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18556 () Bool)

(declare-fun call!18559 () (_ BitVec 32))

(assert (=> bm!18556 (= call!18559 (arrayCountValidKeys!0 (_keys!5676 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun b!184021 () Bool)

(assert (=> b!184021 (= e!121123 call!18559)))

(declare-fun d!54907 () Bool)

(declare-fun lt!91021 () (_ BitVec 32))

(assert (=> d!54907 (and (bvsge lt!91021 #b00000000000000000000000000000000) (bvsle lt!91021 (bvsub (size!3993 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54907 (= lt!91021 e!121124)))

(declare-fun c!33006 () Bool)

(assert (=> d!54907 (= c!33006 (bvsge #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> d!54907 (and (bvsle #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3993 (_keys!5676 thiss!1248)) (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> d!54907 (= (arrayCountValidKeys!0 (_keys!5676 thiss!1248) #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))) lt!91021)))

(declare-fun b!184022 () Bool)

(assert (=> b!184022 (= e!121123 (bvadd #b00000000000000000000000000000001 call!18559))))

(assert (= (and d!54907 c!33006) b!184019))

(assert (= (and d!54907 (not c!33006)) b!184020))

(assert (= (and b!184020 c!33007) b!184022))

(assert (= (and b!184020 (not c!33007)) b!184021))

(assert (= (or b!184022 b!184021) bm!18556))

(assert (=> b!184020 m!211425))

(assert (=> b!184020 m!211425))

(assert (=> b!184020 m!211427))

(declare-fun m!211569 () Bool)

(assert (=> bm!18556 m!211569))

(assert (=> b!183886 d!54907))

(declare-fun d!54909 () Bool)

(assert (=> d!54909 (= (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183862 d!54909))

(declare-fun d!54911 () Bool)

(assert (=> d!54911 (isDefined!170 (getValueByKey!218 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-fun lt!91024 () Unit!5556)

(declare-fun choose!980 (List!2304 (_ BitVec 64)) Unit!5556)

(assert (=> d!54911 (= lt!91024 (choose!980 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(declare-fun e!121127 () Bool)

(assert (=> d!54911 e!121127))

(declare-fun res!87077 () Bool)

(assert (=> d!54911 (=> (not res!87077) (not e!121127))))

(declare-fun isStrictlySorted!333 (List!2304) Bool)

(assert (=> d!54911 (= res!87077 (isStrictlySorted!333 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))))))

(assert (=> d!54911 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828) lt!91024)))

(declare-fun b!184025 () Bool)

(assert (=> b!184025 (= e!121127 (containsKey!221 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828))))

(assert (= (and d!54911 res!87077) b!184025))

(assert (=> d!54911 m!211421))

(assert (=> d!54911 m!211421))

(assert (=> d!54911 m!211423))

(declare-fun m!211571 () Bool)

(assert (=> d!54911 m!211571))

(declare-fun m!211573 () Bool)

(assert (=> d!54911 m!211573))

(assert (=> b!184025 m!211417))

(assert (=> b!183812 d!54911))

(assert (=> b!183812 d!54903))

(assert (=> b!183812 d!54905))

(declare-fun b!184038 () Bool)

(declare-fun c!33016 () Bool)

(declare-fun lt!91029 () (_ BitVec 64))

(assert (=> b!184038 (= c!33016 (= lt!91029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121134 () SeekEntryResult!610)

(declare-fun e!121135 () SeekEntryResult!610)

(assert (=> b!184038 (= e!121134 e!121135)))

(declare-fun b!184039 () Bool)

(assert (=> b!184039 (= e!121135 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19990 lt!90977) #b00000000000000000000000000000001) (nextIndex!0 (index!4612 lt!90977) (bvadd (x!19990 lt!90977) #b00000000000000000000000000000001) (mask!8824 thiss!1248)) (index!4612 lt!90977) key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)))))

(declare-fun b!184040 () Bool)

(declare-fun e!121136 () SeekEntryResult!610)

(assert (=> b!184040 (= e!121136 Undefined!610)))

(declare-fun lt!91030 () SeekEntryResult!610)

(declare-fun d!54913 () Bool)

(assert (=> d!54913 (and (or ((_ is Undefined!610) lt!91030) (not ((_ is Found!610) lt!91030)) (and (bvsge (index!4611 lt!91030) #b00000000000000000000000000000000) (bvslt (index!4611 lt!91030) (size!3993 (_keys!5676 thiss!1248))))) (or ((_ is Undefined!610) lt!91030) ((_ is Found!610) lt!91030) (not ((_ is MissingVacant!610) lt!91030)) (not (= (index!4613 lt!91030) (index!4612 lt!90977))) (and (bvsge (index!4613 lt!91030) #b00000000000000000000000000000000) (bvslt (index!4613 lt!91030) (size!3993 (_keys!5676 thiss!1248))))) (or ((_ is Undefined!610) lt!91030) (ite ((_ is Found!610) lt!91030) (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4611 lt!91030)) key!828) (and ((_ is MissingVacant!610) lt!91030) (= (index!4613 lt!91030) (index!4612 lt!90977)) (= (select (arr!3680 (_keys!5676 thiss!1248)) (index!4613 lt!91030)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54913 (= lt!91030 e!121136)))

(declare-fun c!33015 () Bool)

(assert (=> d!54913 (= c!33015 (bvsge (x!19990 lt!90977) #b01111111111111111111111111111110))))

(assert (=> d!54913 (= lt!91029 (select (arr!3680 (_keys!5676 thiss!1248)) (index!4612 lt!90977)))))

(assert (=> d!54913 (validMask!0 (mask!8824 thiss!1248))))

(assert (=> d!54913 (= (seekKeyOrZeroReturnVacant!0 (x!19990 lt!90977) (index!4612 lt!90977) (index!4612 lt!90977) key!828 (_keys!5676 thiss!1248) (mask!8824 thiss!1248)) lt!91030)))

(declare-fun b!184041 () Bool)

(assert (=> b!184041 (= e!121135 (MissingVacant!610 (index!4612 lt!90977)))))

(declare-fun b!184042 () Bool)

(assert (=> b!184042 (= e!121136 e!121134)))

(declare-fun c!33014 () Bool)

(assert (=> b!184042 (= c!33014 (= lt!91029 key!828))))

(declare-fun b!184043 () Bool)

(assert (=> b!184043 (= e!121134 (Found!610 (index!4612 lt!90977)))))

(assert (= (and d!54913 c!33015) b!184040))

(assert (= (and d!54913 (not c!33015)) b!184042))

(assert (= (and b!184042 c!33014) b!184043))

(assert (= (and b!184042 (not c!33014)) b!184038))

(assert (= (and b!184038 c!33016) b!184041))

(assert (= (and b!184038 (not c!33016)) b!184039))

(declare-fun m!211575 () Bool)

(assert (=> b!184039 m!211575))

(assert (=> b!184039 m!211575))

(declare-fun m!211577 () Bool)

(assert (=> b!184039 m!211577))

(declare-fun m!211579 () Bool)

(assert (=> d!54913 m!211579))

(declare-fun m!211581 () Bool)

(assert (=> d!54913 m!211581))

(assert (=> d!54913 m!211503))

(assert (=> d!54913 m!211381))

(assert (=> b!183903 d!54913))

(assert (=> b!183877 d!54909))

(declare-fun d!54915 () Bool)

(assert (=> d!54915 (= (apply!160 lt!90947 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2121 (getValueByKey!218 (toList!1159 lt!90947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7490 () Bool)

(assert (= bs!7490 d!54915))

(declare-fun m!211583 () Bool)

(assert (=> bs!7490 m!211583))

(assert (=> bs!7490 m!211583))

(declare-fun m!211585 () Bool)

(assert (=> bs!7490 m!211585))

(assert (=> b!183876 d!54915))

(declare-fun d!54917 () Bool)

(declare-fun e!121137 () Bool)

(assert (=> d!54917 e!121137))

(declare-fun res!87078 () Bool)

(assert (=> d!54917 (=> res!87078 e!121137)))

(declare-fun lt!91032 () Bool)

(assert (=> d!54917 (= res!87078 (not lt!91032))))

(declare-fun lt!91033 () Bool)

(assert (=> d!54917 (= lt!91032 lt!91033)))

(declare-fun lt!91034 () Unit!5556)

(declare-fun e!121138 () Unit!5556)

(assert (=> d!54917 (= lt!91034 e!121138)))

(declare-fun c!33017 () Bool)

(assert (=> d!54917 (= c!33017 lt!91033)))

(assert (=> d!54917 (= lt!91033 (containsKey!221 (toList!1159 lt!90947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54917 (= (contains!1259 lt!90947 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91032)))

(declare-fun b!184044 () Bool)

(declare-fun lt!91031 () Unit!5556)

(assert (=> b!184044 (= e!121138 lt!91031)))

(assert (=> b!184044 (= lt!91031 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1159 lt!90947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184044 (isDefined!170 (getValueByKey!218 (toList!1159 lt!90947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184045 () Bool)

(declare-fun Unit!5562 () Unit!5556)

(assert (=> b!184045 (= e!121138 Unit!5562)))

(declare-fun b!184046 () Bool)

(assert (=> b!184046 (= e!121137 (isDefined!170 (getValueByKey!218 (toList!1159 lt!90947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54917 c!33017) b!184044))

(assert (= (and d!54917 (not c!33017)) b!184045))

(assert (= (and d!54917 (not res!87078)) b!184046))

(declare-fun m!211587 () Bool)

(assert (=> d!54917 m!211587))

(declare-fun m!211589 () Bool)

(assert (=> b!184044 m!211589))

(assert (=> b!184044 m!211583))

(assert (=> b!184044 m!211583))

(declare-fun m!211591 () Bool)

(assert (=> b!184044 m!211591))

(assert (=> b!184046 m!211583))

(assert (=> b!184046 m!211583))

(assert (=> b!184046 m!211591))

(assert (=> bm!18545 d!54917))

(declare-fun b!184071 () Bool)

(declare-fun e!121156 () Bool)

(declare-fun e!121159 () Bool)

(assert (=> b!184071 (= e!121156 e!121159)))

(declare-fun c!33029 () Bool)

(declare-fun e!121154 () Bool)

(assert (=> b!184071 (= c!33029 e!121154)))

(declare-fun res!87089 () Bool)

(assert (=> b!184071 (=> (not res!87089) (not e!121154))))

(assert (=> b!184071 (= res!87089 (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun b!184073 () Bool)

(declare-fun e!121155 () ListLongMap!2287)

(declare-fun call!18562 () ListLongMap!2287)

(assert (=> b!184073 (= e!121155 call!18562)))

(declare-fun b!184074 () Bool)

(declare-fun res!87088 () Bool)

(assert (=> b!184074 (=> (not res!87088) (not e!121156))))

(declare-fun lt!91054 () ListLongMap!2287)

(assert (=> b!184074 (= res!87088 (not (contains!1259 lt!91054 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184075 () Bool)

(declare-fun e!121153 () Bool)

(declare-fun isEmpty!472 (ListLongMap!2287) Bool)

(assert (=> b!184075 (= e!121153 (isEmpty!472 lt!91054))))

(declare-fun b!184076 () Bool)

(declare-fun e!121157 () ListLongMap!2287)

(assert (=> b!184076 (= e!121157 e!121155)))

(declare-fun c!33028 () Bool)

(assert (=> b!184076 (= c!33028 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184077 () Bool)

(assert (=> b!184077 (= e!121157 (ListLongMap!2288 Nil!2301))))

(declare-fun d!54919 () Bool)

(assert (=> d!54919 e!121156))

(declare-fun res!87090 () Bool)

(assert (=> d!54919 (=> (not res!87090) (not e!121156))))

(assert (=> d!54919 (= res!87090 (not (contains!1259 lt!91054 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54919 (= lt!91054 e!121157)))

(declare-fun c!33026 () Bool)

(assert (=> d!54919 (= c!33026 (bvsge #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> d!54919 (validMask!0 (mask!8824 thiss!1248))))

(assert (=> d!54919 (= (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)) lt!91054)))

(declare-fun b!184072 () Bool)

(assert (=> b!184072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(assert (=> b!184072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3994 (_values!3737 thiss!1248))))))

(declare-fun e!121158 () Bool)

(assert (=> b!184072 (= e!121158 (= (apply!160 lt!91054 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)) (get!2120 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!184078 () Bool)

(assert (=> b!184078 (= e!121159 e!121158)))

(assert (=> b!184078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun res!87087 () Bool)

(assert (=> b!184078 (= res!87087 (contains!1259 lt!91054 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184078 (=> (not res!87087) (not e!121158))))

(declare-fun bm!18559 () Bool)

(assert (=> bm!18559 (= call!18562 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3754 thiss!1248)))))

(declare-fun b!184079 () Bool)

(assert (=> b!184079 (= e!121153 (= lt!91054 (getCurrentListMapNoExtraKeys!191 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3754 thiss!1248))))))

(declare-fun b!184080 () Bool)

(assert (=> b!184080 (= e!121154 (validKeyInArray!0 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184080 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!184081 () Bool)

(assert (=> b!184081 (= e!121159 e!121153)))

(declare-fun c!33027 () Bool)

(assert (=> b!184081 (= c!33027 (bvslt #b00000000000000000000000000000000 (size!3993 (_keys!5676 thiss!1248))))))

(declare-fun b!184082 () Bool)

(declare-fun lt!91053 () Unit!5556)

(declare-fun lt!91052 () Unit!5556)

(assert (=> b!184082 (= lt!91053 lt!91052)))

(declare-fun lt!91051 () (_ BitVec 64))

(declare-fun lt!91049 () ListLongMap!2287)

(declare-fun lt!91050 () (_ BitVec 64))

(declare-fun lt!91055 () V!5385)

(assert (=> b!184082 (not (contains!1259 (+!280 lt!91049 (tuple2!3367 lt!91051 lt!91055)) lt!91050))))

(declare-fun addStillNotContains!88 (ListLongMap!2287 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5556)

(assert (=> b!184082 (= lt!91052 (addStillNotContains!88 lt!91049 lt!91051 lt!91055 lt!91050))))

(assert (=> b!184082 (= lt!91050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!184082 (= lt!91055 (get!2120 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184082 (= lt!91051 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184082 (= lt!91049 call!18562)))

(assert (=> b!184082 (= e!121155 (+!280 call!18562 (tuple2!3367 (select (arr!3680 (_keys!5676 thiss!1248)) #b00000000000000000000000000000000) (get!2120 (select (arr!3681 (_values!3737 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3754 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!54919 c!33026) b!184077))

(assert (= (and d!54919 (not c!33026)) b!184076))

(assert (= (and b!184076 c!33028) b!184082))

(assert (= (and b!184076 (not c!33028)) b!184073))

(assert (= (or b!184082 b!184073) bm!18559))

(assert (= (and d!54919 res!87090) b!184074))

(assert (= (and b!184074 res!87088) b!184071))

(assert (= (and b!184071 res!87089) b!184080))

(assert (= (and b!184071 c!33029) b!184078))

(assert (= (and b!184071 (not c!33029)) b!184081))

(assert (= (and b!184078 res!87087) b!184072))

(assert (= (and b!184081 c!33027) b!184079))

(assert (= (and b!184081 (not c!33027)) b!184075))

(declare-fun b_lambda!7229 () Bool)

(assert (=> (not b_lambda!7229) (not b!184072)))

(assert (=> b!184072 t!7170))

(declare-fun b_and!11129 () Bool)

(assert (= b_and!11127 (and (=> t!7170 result!4763) b_and!11129)))

(declare-fun b_lambda!7231 () Bool)

(assert (=> (not b_lambda!7231) (not b!184082)))

(assert (=> b!184082 t!7170))

(declare-fun b_and!11131 () Bool)

(assert (= b_and!11129 (and (=> t!7170 result!4763) b_and!11131)))

(assert (=> b!184072 m!211425))

(declare-fun m!211593 () Bool)

(assert (=> b!184072 m!211593))

(assert (=> b!184072 m!211425))

(assert (=> b!184072 m!211431))

(assert (=> b!184072 m!211431))

(assert (=> b!184072 m!211429))

(assert (=> b!184072 m!211433))

(assert (=> b!184072 m!211429))

(declare-fun m!211595 () Bool)

(assert (=> d!54919 m!211595))

(assert (=> d!54919 m!211381))

(declare-fun m!211597 () Bool)

(assert (=> b!184074 m!211597))

(assert (=> b!184082 m!211425))

(declare-fun m!211599 () Bool)

(assert (=> b!184082 m!211599))

(declare-fun m!211601 () Bool)

(assert (=> b!184082 m!211601))

(declare-fun m!211603 () Bool)

(assert (=> b!184082 m!211603))

(declare-fun m!211605 () Bool)

(assert (=> b!184082 m!211605))

(assert (=> b!184082 m!211431))

(assert (=> b!184082 m!211431))

(assert (=> b!184082 m!211429))

(assert (=> b!184082 m!211433))

(assert (=> b!184082 m!211429))

(assert (=> b!184082 m!211603))

(assert (=> b!184076 m!211425))

(assert (=> b!184076 m!211425))

(assert (=> b!184076 m!211427))

(assert (=> b!184078 m!211425))

(assert (=> b!184078 m!211425))

(declare-fun m!211607 () Bool)

(assert (=> b!184078 m!211607))

(assert (=> b!184080 m!211425))

(assert (=> b!184080 m!211425))

(assert (=> b!184080 m!211427))

(declare-fun m!211609 () Bool)

(assert (=> b!184075 m!211609))

(declare-fun m!211611 () Bool)

(assert (=> b!184079 m!211611))

(assert (=> bm!18559 m!211611))

(assert (=> bm!18541 d!54919))

(declare-fun d!54921 () Bool)

(declare-fun res!87095 () Bool)

(declare-fun e!121164 () Bool)

(assert (=> d!54921 (=> res!87095 e!121164)))

(assert (=> d!54921 (= res!87095 (and ((_ is Cons!2300) (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (= (_1!1694 (h!2930 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)))))

(assert (=> d!54921 (= (containsKey!221 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))) key!828) e!121164)))

(declare-fun b!184087 () Bool)

(declare-fun e!121165 () Bool)

(assert (=> b!184087 (= e!121164 e!121165)))

(declare-fun res!87096 () Bool)

(assert (=> b!184087 (=> (not res!87096) (not e!121165))))

(assert (=> b!184087 (= res!87096 (and (or (not ((_ is Cons!2300) (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) (bvsle (_1!1694 (h!2930 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)) ((_ is Cons!2300) (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) (bvslt (_1!1694 (h!2930 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248))))) key!828)))))

(declare-fun b!184088 () Bool)

(assert (=> b!184088 (= e!121165 (containsKey!221 (t!7166 (toList!1159 (getCurrentListMap!811 (_keys!5676 thiss!1248) (_values!3737 thiss!1248) (mask!8824 thiss!1248) (extraKeys!3491 thiss!1248) (zeroValue!3595 thiss!1248) (minValue!3595 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3754 thiss!1248)))) key!828))))

(assert (= (and d!54921 (not res!87095)) b!184087))

(assert (= (and b!184087 res!87096) b!184088))

(declare-fun m!211613 () Bool)

(assert (=> b!184088 m!211613))

(assert (=> d!54873 d!54921))

(declare-fun d!54923 () Bool)

(declare-fun e!121166 () Bool)

(assert (=> d!54923 e!121166))

(declare-fun res!87097 () Bool)

(assert (=> d!54923 (=> (not res!87097) (not e!121166))))

(declare-fun lt!91057 () ListLongMap!2287)

(assert (=> d!54923 (= res!87097 (contains!1259 lt!91057 (_1!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(declare-fun lt!91058 () List!2304)

(assert (=> d!54923 (= lt!91057 (ListLongMap!2288 lt!91058))))

(declare-fun lt!91056 () Unit!5556)

(declare-fun lt!91059 () Unit!5556)

(assert (=> d!54923 (= lt!91056 lt!91059)))

(assert (=> d!54923 (= (getValueByKey!218 lt!91058 (_1!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (=> d!54923 (= lt!91059 (lemmaContainsTupThenGetReturnValue!115 lt!91058 (_1!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (=> d!54923 (= lt!91058 (insertStrictlySorted!118 (toList!1159 call!18549) (_1!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))))))

(assert (=> d!54923 (= (+!280 call!18549 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))) lt!91057)))

(declare-fun b!184089 () Bool)

(declare-fun res!87098 () Bool)

(assert (=> b!184089 (=> (not res!87098) (not e!121166))))

(assert (=> b!184089 (= res!87098 (= (getValueByKey!218 (toList!1159 lt!91057) (_1!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))))

(declare-fun b!184090 () Bool)

(assert (=> b!184090 (= e!121166 (contains!1263 (toList!1159 lt!91057) (tuple2!3367 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3595 thiss!1248))))))

(assert (= (and d!54923 res!87097) b!184089))

(assert (= (and b!184089 res!87098) b!184090))

(declare-fun m!211615 () Bool)

(assert (=> d!54923 m!211615))

(declare-fun m!211617 () Bool)

(assert (=> d!54923 m!211617))

(declare-fun m!211619 () Bool)

(assert (=> d!54923 m!211619))

(declare-fun m!211621 () Bool)

(assert (=> d!54923 m!211621))

(declare-fun m!211623 () Bool)

(assert (=> b!184089 m!211623))

(declare-fun m!211625 () Bool)

(assert (=> b!184090 m!211625))

(assert (=> b!183859 d!54923))

(declare-fun d!54925 () Bool)

(assert (=> d!54925 (= (apply!160 (+!280 lt!90954 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))) lt!90961) (apply!160 lt!90954 lt!90961))))

(declare-fun lt!91062 () Unit!5556)

(declare-fun choose!981 (ListLongMap!2287 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5556)

(assert (=> d!54925 (= lt!91062 (choose!981 lt!90954 lt!90957 (minValue!3595 thiss!1248) lt!90961))))

(declare-fun e!121169 () Bool)

(assert (=> d!54925 e!121169))

(declare-fun res!87101 () Bool)

(assert (=> d!54925 (=> (not res!87101) (not e!121169))))

(assert (=> d!54925 (= res!87101 (contains!1259 lt!90954 lt!90961))))

(assert (=> d!54925 (= (addApplyDifferent!136 lt!90954 lt!90957 (minValue!3595 thiss!1248) lt!90961) lt!91062)))

(declare-fun b!184094 () Bool)

(assert (=> b!184094 (= e!121169 (not (= lt!90961 lt!90957)))))

(assert (= (and d!54925 res!87101) b!184094))

(assert (=> d!54925 m!211463))

(assert (=> d!54925 m!211465))

(declare-fun m!211627 () Bool)

(assert (=> d!54925 m!211627))

(declare-fun m!211629 () Bool)

(assert (=> d!54925 m!211629))

(assert (=> d!54925 m!211463))

(assert (=> d!54925 m!211453))

(assert (=> b!183874 d!54925))

(declare-fun d!54927 () Bool)

(assert (=> d!54927 (= (apply!160 (+!280 lt!90954 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))) lt!90961) (get!2121 (getValueByKey!218 (toList!1159 (+!280 lt!90954 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))) lt!90961)))))

(declare-fun bs!7491 () Bool)

(assert (= bs!7491 d!54927))

(declare-fun m!211631 () Bool)

(assert (=> bs!7491 m!211631))

(assert (=> bs!7491 m!211631))

(declare-fun m!211633 () Bool)

(assert (=> bs!7491 m!211633))

(assert (=> b!183874 d!54927))

(declare-fun d!54929 () Bool)

(declare-fun e!121170 () Bool)

(assert (=> d!54929 e!121170))

(declare-fun res!87102 () Bool)

(assert (=> d!54929 (=> res!87102 e!121170)))

(declare-fun lt!91064 () Bool)

(assert (=> d!54929 (= res!87102 (not lt!91064))))

(declare-fun lt!91065 () Bool)

(assert (=> d!54929 (= lt!91064 lt!91065)))

(declare-fun lt!91066 () Unit!5556)

(declare-fun e!121171 () Unit!5556)

(assert (=> d!54929 (= lt!91066 e!121171)))

(declare-fun c!33030 () Bool)

(assert (=> d!54929 (= c!33030 lt!91065)))

(assert (=> d!54929 (= lt!91065 (containsKey!221 (toList!1159 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))) lt!90958))))

(assert (=> d!54929 (= (contains!1259 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))) lt!90958) lt!91064)))

(declare-fun b!184095 () Bool)

(declare-fun lt!91063 () Unit!5556)

(assert (=> b!184095 (= e!121171 lt!91063)))

(assert (=> b!184095 (= lt!91063 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1159 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))) lt!90958))))

(assert (=> b!184095 (isDefined!170 (getValueByKey!218 (toList!1159 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))) lt!90958))))

(declare-fun b!184096 () Bool)

(declare-fun Unit!5563 () Unit!5556)

(assert (=> b!184096 (= e!121171 Unit!5563)))

(declare-fun b!184097 () Bool)

(assert (=> b!184097 (= e!121170 (isDefined!170 (getValueByKey!218 (toList!1159 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))) lt!90958)))))

(assert (= (and d!54929 c!33030) b!184095))

(assert (= (and d!54929 (not c!33030)) b!184096))

(assert (= (and d!54929 (not res!87102)) b!184097))

(declare-fun m!211635 () Bool)

(assert (=> d!54929 m!211635))

(declare-fun m!211637 () Bool)

(assert (=> b!184095 m!211637))

(declare-fun m!211639 () Bool)

(assert (=> b!184095 m!211639))

(assert (=> b!184095 m!211639))

(declare-fun m!211641 () Bool)

(assert (=> b!184095 m!211641))

(assert (=> b!184097 m!211639))

(assert (=> b!184097 m!211639))

(assert (=> b!184097 m!211641))

(assert (=> b!183874 d!54929))

(declare-fun d!54931 () Bool)

(assert (=> d!54931 (= (apply!160 (+!280 lt!90949 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))) lt!90968) (get!2121 (getValueByKey!218 (toList!1159 (+!280 lt!90949 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))) lt!90968)))))

(declare-fun bs!7492 () Bool)

(assert (= bs!7492 d!54931))

(declare-fun m!211643 () Bool)

(assert (=> bs!7492 m!211643))

(assert (=> bs!7492 m!211643))

(declare-fun m!211645 () Bool)

(assert (=> bs!7492 m!211645))

(assert (=> b!183874 d!54931))

(declare-fun d!54933 () Bool)

(assert (=> d!54933 (= (apply!160 (+!280 lt!90949 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))) lt!90968) (apply!160 lt!90949 lt!90968))))

(declare-fun lt!91067 () Unit!5556)

(assert (=> d!54933 (= lt!91067 (choose!981 lt!90949 lt!90953 (zeroValue!3595 thiss!1248) lt!90968))))

(declare-fun e!121172 () Bool)

(assert (=> d!54933 e!121172))

(declare-fun res!87103 () Bool)

(assert (=> d!54933 (=> (not res!87103) (not e!121172))))

(assert (=> d!54933 (= res!87103 (contains!1259 lt!90949 lt!90968))))

(assert (=> d!54933 (= (addApplyDifferent!136 lt!90949 lt!90953 (zeroValue!3595 thiss!1248) lt!90968) lt!91067)))

(declare-fun b!184098 () Bool)

(assert (=> b!184098 (= e!121172 (not (= lt!90968 lt!90953)))))

(assert (= (and d!54933 res!87103) b!184098))

(assert (=> d!54933 m!211443))

(assert (=> d!54933 m!211461))

(declare-fun m!211647 () Bool)

(assert (=> d!54933 m!211647))

(declare-fun m!211649 () Bool)

(assert (=> d!54933 m!211649))

(assert (=> d!54933 m!211443))

(assert (=> d!54933 m!211467))

(assert (=> b!183874 d!54933))

(declare-fun d!54935 () Bool)

(assert (=> d!54935 (= (apply!160 (+!280 lt!90966 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))) lt!90962) (get!2121 (getValueByKey!218 (toList!1159 (+!280 lt!90966 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))) lt!90962)))))

(declare-fun bs!7493 () Bool)

(assert (= bs!7493 d!54935))

(declare-fun m!211651 () Bool)

(assert (=> bs!7493 m!211651))

(assert (=> bs!7493 m!211651))

(declare-fun m!211653 () Bool)

(assert (=> bs!7493 m!211653))

(assert (=> b!183874 d!54935))

(declare-fun d!54937 () Bool)

(declare-fun e!121173 () Bool)

(assert (=> d!54937 e!121173))

(declare-fun res!87104 () Bool)

(assert (=> d!54937 (=> (not res!87104) (not e!121173))))

(declare-fun lt!91069 () ListLongMap!2287)

(assert (=> d!54937 (= res!87104 (contains!1259 lt!91069 (_1!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))))))

(declare-fun lt!91070 () List!2304)

(assert (=> d!54937 (= lt!91069 (ListLongMap!2288 lt!91070))))

(declare-fun lt!91068 () Unit!5556)

(declare-fun lt!91071 () Unit!5556)

(assert (=> d!54937 (= lt!91068 lt!91071)))

(assert (=> d!54937 (= (getValueByKey!218 lt!91070 (_1!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))))))

(assert (=> d!54937 (= lt!91071 (lemmaContainsTupThenGetReturnValue!115 lt!91070 (_1!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))))))

(assert (=> d!54937 (= lt!91070 (insertStrictlySorted!118 (toList!1159 lt!90966) (_1!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))))))

(assert (=> d!54937 (= (+!280 lt!90966 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))) lt!91069)))

(declare-fun b!184099 () Bool)

(declare-fun res!87105 () Bool)

(assert (=> b!184099 (=> (not res!87105) (not e!121173))))

(assert (=> b!184099 (= res!87105 (= (getValueByKey!218 (toList!1159 lt!91069) (_1!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))))))))

(declare-fun b!184100 () Bool)

(assert (=> b!184100 (= e!121173 (contains!1263 (toList!1159 lt!91069) (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))))))

(assert (= (and d!54937 res!87104) b!184099))

(assert (= (and b!184099 res!87105) b!184100))

(declare-fun m!211655 () Bool)

(assert (=> d!54937 m!211655))

(declare-fun m!211657 () Bool)

(assert (=> d!54937 m!211657))

(declare-fun m!211659 () Bool)

(assert (=> d!54937 m!211659))

(declare-fun m!211661 () Bool)

(assert (=> d!54937 m!211661))

(declare-fun m!211663 () Bool)

(assert (=> b!184099 m!211663))

(declare-fun m!211665 () Bool)

(assert (=> b!184100 m!211665))

(assert (=> b!183874 d!54937))

(declare-fun d!54939 () Bool)

(declare-fun e!121174 () Bool)

(assert (=> d!54939 e!121174))

(declare-fun res!87106 () Bool)

(assert (=> d!54939 (=> (not res!87106) (not e!121174))))

(declare-fun lt!91073 () ListLongMap!2287)

(assert (=> d!54939 (= res!87106 (contains!1259 lt!91073 (_1!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))))))

(declare-fun lt!91074 () List!2304)

(assert (=> d!54939 (= lt!91073 (ListLongMap!2288 lt!91074))))

(declare-fun lt!91072 () Unit!5556)

(declare-fun lt!91075 () Unit!5556)

(assert (=> d!54939 (= lt!91072 lt!91075)))

(assert (=> d!54939 (= (getValueByKey!218 lt!91074 (_1!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))))))

(assert (=> d!54939 (= lt!91075 (lemmaContainsTupThenGetReturnValue!115 lt!91074 (_1!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))))))

(assert (=> d!54939 (= lt!91074 (insertStrictlySorted!118 (toList!1159 lt!90954) (_1!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))))))

(assert (=> d!54939 (= (+!280 lt!90954 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))) lt!91073)))

(declare-fun b!184101 () Bool)

(declare-fun res!87107 () Bool)

(assert (=> b!184101 (=> (not res!87107) (not e!121174))))

(assert (=> b!184101 (= res!87107 (= (getValueByKey!218 (toList!1159 lt!91073) (_1!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))))))))

(declare-fun b!184102 () Bool)

(assert (=> b!184102 (= e!121174 (contains!1263 (toList!1159 lt!91073) (tuple2!3367 lt!90957 (minValue!3595 thiss!1248))))))

(assert (= (and d!54939 res!87106) b!184101))

(assert (= (and b!184101 res!87107) b!184102))

(declare-fun m!211667 () Bool)

(assert (=> d!54939 m!211667))

(declare-fun m!211669 () Bool)

(assert (=> d!54939 m!211669))

(declare-fun m!211671 () Bool)

(assert (=> d!54939 m!211671))

(declare-fun m!211673 () Bool)

(assert (=> d!54939 m!211673))

(declare-fun m!211675 () Bool)

(assert (=> b!184101 m!211675))

(declare-fun m!211677 () Bool)

(assert (=> b!184102 m!211677))

(assert (=> b!183874 d!54939))

(declare-fun d!54941 () Bool)

(declare-fun e!121175 () Bool)

(assert (=> d!54941 e!121175))

(declare-fun res!87108 () Bool)

(assert (=> d!54941 (=> (not res!87108) (not e!121175))))

(declare-fun lt!91077 () ListLongMap!2287)

(assert (=> d!54941 (= res!87108 (contains!1259 lt!91077 (_1!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))))))

(declare-fun lt!91078 () List!2304)

(assert (=> d!54941 (= lt!91077 (ListLongMap!2288 lt!91078))))

(declare-fun lt!91076 () Unit!5556)

(declare-fun lt!91079 () Unit!5556)

(assert (=> d!54941 (= lt!91076 lt!91079)))

(assert (=> d!54941 (= (getValueByKey!218 lt!91078 (_1!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54941 (= lt!91079 (lemmaContainsTupThenGetReturnValue!115 lt!91078 (_1!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54941 (= lt!91078 (insertStrictlySorted!118 (toList!1159 lt!90964) (_1!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54941 (= (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))) lt!91077)))

(declare-fun b!184103 () Bool)

(declare-fun res!87109 () Bool)

(assert (=> b!184103 (=> (not res!87109) (not e!121175))))

(assert (=> b!184103 (= res!87109 (= (getValueByKey!218 (toList!1159 lt!91077) (_1!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))))))))

(declare-fun b!184104 () Bool)

(assert (=> b!184104 (= e!121175 (contains!1263 (toList!1159 lt!91077) (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))))))

(assert (= (and d!54941 res!87108) b!184103))

(assert (= (and b!184103 res!87109) b!184104))

(declare-fun m!211679 () Bool)

(assert (=> d!54941 m!211679))

(declare-fun m!211681 () Bool)

(assert (=> d!54941 m!211681))

(declare-fun m!211683 () Bool)

(assert (=> d!54941 m!211683))

(declare-fun m!211685 () Bool)

(assert (=> d!54941 m!211685))

(declare-fun m!211687 () Bool)

(assert (=> b!184103 m!211687))

(declare-fun m!211689 () Bool)

(assert (=> b!184104 m!211689))

(assert (=> b!183874 d!54941))

(declare-fun d!54943 () Bool)

(assert (=> d!54943 (= (apply!160 lt!90949 lt!90968) (get!2121 (getValueByKey!218 (toList!1159 lt!90949) lt!90968)))))

(declare-fun bs!7494 () Bool)

(assert (= bs!7494 d!54943))

(declare-fun m!211691 () Bool)

(assert (=> bs!7494 m!211691))

(assert (=> bs!7494 m!211691))

(declare-fun m!211693 () Bool)

(assert (=> bs!7494 m!211693))

(assert (=> b!183874 d!54943))

(assert (=> b!183874 d!54919))

(declare-fun d!54945 () Bool)

(assert (=> d!54945 (= (apply!160 lt!90966 lt!90962) (get!2121 (getValueByKey!218 (toList!1159 lt!90966) lt!90962)))))

(declare-fun bs!7495 () Bool)

(assert (= bs!7495 d!54945))

(declare-fun m!211695 () Bool)

(assert (=> bs!7495 m!211695))

(assert (=> bs!7495 m!211695))

(declare-fun m!211697 () Bool)

(assert (=> bs!7495 m!211697))

(assert (=> b!183874 d!54945))

(declare-fun d!54947 () Bool)

(assert (=> d!54947 (contains!1259 (+!280 lt!90964 (tuple2!3367 lt!90965 (zeroValue!3595 thiss!1248))) lt!90958)))

(declare-fun lt!91082 () Unit!5556)

(declare-fun choose!982 (ListLongMap!2287 (_ BitVec 64) V!5385 (_ BitVec 64)) Unit!5556)

(assert (=> d!54947 (= lt!91082 (choose!982 lt!90964 lt!90965 (zeroValue!3595 thiss!1248) lt!90958))))

(assert (=> d!54947 (contains!1259 lt!90964 lt!90958)))

(assert (=> d!54947 (= (addStillContains!136 lt!90964 lt!90965 (zeroValue!3595 thiss!1248) lt!90958) lt!91082)))

(declare-fun bs!7496 () Bool)

(assert (= bs!7496 d!54947))

(assert (=> bs!7496 m!211469))

(assert (=> bs!7496 m!211469))

(assert (=> bs!7496 m!211471))

(declare-fun m!211699 () Bool)

(assert (=> bs!7496 m!211699))

(declare-fun m!211701 () Bool)

(assert (=> bs!7496 m!211701))

(assert (=> b!183874 d!54947))

(declare-fun d!54949 () Bool)

(assert (=> d!54949 (= (apply!160 (+!280 lt!90966 (tuple2!3367 lt!90955 (minValue!3595 thiss!1248))) lt!90962) (apply!160 lt!90966 lt!90962))))

(declare-fun lt!91083 () Unit!5556)

(assert (=> d!54949 (= lt!91083 (choose!981 lt!90966 lt!90955 (minValue!3595 thiss!1248) lt!90962))))

(declare-fun e!121176 () Bool)

(assert (=> d!54949 e!121176))

(declare-fun res!87110 () Bool)

(assert (=> d!54949 (=> (not res!87110) (not e!121176))))

(assert (=> d!54949 (= res!87110 (contains!1259 lt!90966 lt!90962))))

(assert (=> d!54949 (= (addApplyDifferent!136 lt!90966 lt!90955 (minValue!3595 thiss!1248) lt!90962) lt!91083)))

(declare-fun b!184106 () Bool)

(assert (=> b!184106 (= e!121176 (not (= lt!90962 lt!90955)))))

(assert (= (and d!54949 res!87110) b!184106))

(assert (=> d!54949 m!211447))

(assert (=> d!54949 m!211449))

(declare-fun m!211703 () Bool)

(assert (=> d!54949 m!211703))

(declare-fun m!211705 () Bool)

(assert (=> d!54949 m!211705))

(assert (=> d!54949 m!211447))

(assert (=> d!54949 m!211445))

(assert (=> b!183874 d!54949))

(declare-fun d!54951 () Bool)

(assert (=> d!54951 (= (apply!160 lt!90954 lt!90961) (get!2121 (getValueByKey!218 (toList!1159 lt!90954) lt!90961)))))

(declare-fun bs!7497 () Bool)

(assert (= bs!7497 d!54951))

(declare-fun m!211707 () Bool)

(assert (=> bs!7497 m!211707))

(assert (=> bs!7497 m!211707))

(declare-fun m!211709 () Bool)

(assert (=> bs!7497 m!211709))

(assert (=> b!183874 d!54951))

(declare-fun d!54953 () Bool)

(declare-fun e!121177 () Bool)

(assert (=> d!54953 e!121177))

(declare-fun res!87111 () Bool)

(assert (=> d!54953 (=> (not res!87111) (not e!121177))))

(declare-fun lt!91085 () ListLongMap!2287)

(assert (=> d!54953 (= res!87111 (contains!1259 lt!91085 (_1!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))))))

(declare-fun lt!91086 () List!2304)

(assert (=> d!54953 (= lt!91085 (ListLongMap!2288 lt!91086))))

(declare-fun lt!91084 () Unit!5556)

(declare-fun lt!91087 () Unit!5556)

(assert (=> d!54953 (= lt!91084 lt!91087)))

(assert (=> d!54953 (= (getValueByKey!218 lt!91086 (_1!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54953 (= lt!91087 (lemmaContainsTupThenGetReturnValue!115 lt!91086 (_1!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54953 (= lt!91086 (insertStrictlySorted!118 (toList!1159 lt!90949) (_1!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))) (_2!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))))))

(assert (=> d!54953 (= (+!280 lt!90949 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))) lt!91085)))

(declare-fun b!184107 () Bool)

(declare-fun res!87112 () Bool)

(assert (=> b!184107 (=> (not res!87112) (not e!121177))))

(assert (=> b!184107 (= res!87112 (= (getValueByKey!218 (toList!1159 lt!91085) (_1!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248)))) (Some!223 (_2!1694 (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))))))))

(declare-fun b!184108 () Bool)

(assert (=> b!184108 (= e!121177 (contains!1263 (toList!1159 lt!91085) (tuple2!3367 lt!90953 (zeroValue!3595 thiss!1248))))))

(assert (= (and d!54953 res!87111) b!184107))

(assert (= (and b!184107 res!87112) b!184108))

(declare-fun m!211711 () Bool)

(assert (=> d!54953 m!211711))

(declare-fun m!211713 () Bool)

(assert (=> d!54953 m!211713))

(declare-fun m!211715 () Bool)

(assert (=> d!54953 m!211715))

(declare-fun m!211717 () Bool)

(assert (=> d!54953 m!211717))

(declare-fun m!211719 () Bool)

(assert (=> b!184107 m!211719))

(declare-fun m!211721 () Bool)

(assert (=> b!184108 m!211721))

(assert (=> b!183874 d!54953))

(declare-fun mapNonEmpty!7402 () Bool)

(declare-fun mapRes!7402 () Bool)

(declare-fun tp!16384 () Bool)

(declare-fun e!121179 () Bool)

(assert (=> mapNonEmpty!7402 (= mapRes!7402 (and tp!16384 e!121179))))

(declare-fun mapValue!7402 () ValueCell!1808)

(declare-fun mapRest!7402 () (Array (_ BitVec 32) ValueCell!1808))

(declare-fun mapKey!7402 () (_ BitVec 32))

(assert (=> mapNonEmpty!7402 (= mapRest!7401 (store mapRest!7402 mapKey!7402 mapValue!7402))))

(declare-fun b!184110 () Bool)

(declare-fun e!121178 () Bool)

(assert (=> b!184110 (= e!121178 tp_is_empty!4303)))

(declare-fun b!184109 () Bool)

(assert (=> b!184109 (= e!121179 tp_is_empty!4303)))

(declare-fun condMapEmpty!7402 () Bool)

(declare-fun mapDefault!7402 () ValueCell!1808)

(assert (=> mapNonEmpty!7401 (= condMapEmpty!7402 (= mapRest!7401 ((as const (Array (_ BitVec 32) ValueCell!1808)) mapDefault!7402)))))

(assert (=> mapNonEmpty!7401 (= tp!16383 (and e!121178 mapRes!7402))))

(declare-fun mapIsEmpty!7402 () Bool)

(assert (=> mapIsEmpty!7402 mapRes!7402))

(assert (= (and mapNonEmpty!7401 condMapEmpty!7402) mapIsEmpty!7402))

(assert (= (and mapNonEmpty!7401 (not condMapEmpty!7402)) mapNonEmpty!7402))

(assert (= (and mapNonEmpty!7402 ((_ is ValueCellFull!1808) mapValue!7402)) b!184109))

(assert (= (and mapNonEmpty!7401 ((_ is ValueCellFull!1808) mapDefault!7402)) b!184110))

(declare-fun m!211723 () Bool)

(assert (=> mapNonEmpty!7402 m!211723))

(declare-fun b_lambda!7233 () Bool)

(assert (= b_lambda!7229 (or (and b!183751 b_free!4531) b_lambda!7233)))

(declare-fun b_lambda!7235 () Bool)

(assert (= b_lambda!7231 (or (and b!183751 b_free!4531) b_lambda!7235)))

(check-sat (not d!54935) (not b!184095) (not d!54899) (not d!54953) (not b!184088) (not b!184080) (not d!54889) (not b!184103) (not b!184099) (not d!54939) (not d!54913) (not b!184090) (not b!184079) (not b!184104) (not d!54903) (not b!184074) (not b!183980) (not d!54923) (not b!184107) (not b!184025) (not bm!18553) (not d!54947) (not d!54943) (not d!54927) (not b!183978) (not b!183996) (not d!54941) (not b!183997) (not d!54915) (not b!184100) (not d!54917) (not b!184076) (not b_lambda!7227) (not b!184039) (not d!54925) (not b!183935) (not d!54901) (not b!183985) (not d!54949) (not b!184102) (not b!183921) (not d!54945) (not b!184082) (not mapNonEmpty!7402) (not b_lambda!7235) (not b!184009) (not d!54937) (not bm!18550) (not b_next!4531) (not b!183948) (not b!184072) (not b!183937) (not d!54897) (not d!54881) (not b!184089) (not d!54893) (not d!54929) (not b!183986) (not d!54911) b_and!11131 (not bm!18556) (not b!183934) (not b!184075) (not d!54885) (not d!54933) (not d!54951) (not d!54919) (not b!183923) (not b!184097) (not b!184078) (not bm!18559) (not b!184044) (not b!183972) (not b_lambda!7233) (not b!183919) (not d!54931) (not b!183950) (not b!184046) (not b!184020) (not b!183920) (not b!184101) tp_is_empty!4303 (not b!184108))
(check-sat b_and!11131 (not b_next!4531))
