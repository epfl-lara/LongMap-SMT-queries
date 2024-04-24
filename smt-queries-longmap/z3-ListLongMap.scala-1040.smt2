; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21926 () Bool)

(assert start!21926)

(declare-fun b!222995 () Bool)

(declare-fun b_free!5989 () Bool)

(declare-fun b_next!5989 () Bool)

(assert (=> b!222995 (= b_free!5989 (not b_next!5989))))

(declare-fun tp!21108 () Bool)

(declare-fun b_and!12901 () Bool)

(assert (=> b!222995 (= tp!21108 b_and!12901)))

(declare-fun b!222973 () Bool)

(declare-fun e!144883 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3217 0))(
  ( (Nil!3214) (Cons!3213 (h!3861 (_ BitVec 64)) (t!8168 List!3217)) )
))
(declare-fun contains!1503 (List!3217 (_ BitVec 64)) Bool)

(assert (=> b!222973 (= e!144883 (contains!1503 Nil!3214 key!932))))

(declare-datatypes ((SeekEntryResult!814 0))(
  ( (MissingZero!814 (index!5426 (_ BitVec 32))) (Found!814 (index!5427 (_ BitVec 32))) (Intermediate!814 (undefined!1626 Bool) (index!5428 (_ BitVec 32)) (x!23050 (_ BitVec 32))) (Undefined!814) (MissingVacant!814 (index!5429 (_ BitVec 32))) )
))
(declare-fun lt!112837 () SeekEntryResult!814)

(declare-fun bm!20786 () Bool)

(declare-datatypes ((V!7449 0))(
  ( (V!7450 (val!2970 Int)) )
))
(declare-datatypes ((ValueCell!2582 0))(
  ( (ValueCellFull!2582 (v!4991 V!7449)) (EmptyCell!2582) )
))
(declare-datatypes ((array!10943 0))(
  ( (array!10944 (arr!5191 (Array (_ BitVec 32) ValueCell!2582)) (size!5524 (_ BitVec 32))) )
))
(declare-datatypes ((array!10945 0))(
  ( (array!10946 (arr!5192 (Array (_ BitVec 32) (_ BitVec 64))) (size!5525 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3064 0))(
  ( (LongMapFixedSize!3065 (defaultEntry!4191 Int) (mask!10015 (_ BitVec 32)) (extraKeys!3928 (_ BitVec 32)) (zeroValue!4032 V!7449) (minValue!4032 V!7449) (_size!1581 (_ BitVec 32)) (_keys!6245 array!10945) (_values!4174 array!10943) (_vacant!1581 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3064)

(declare-fun c!37045 () Bool)

(declare-fun call!20789 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20786 (= call!20789 (inRange!0 (ite c!37045 (index!5426 lt!112837) (index!5429 lt!112837)) (mask!10015 thiss!1504)))))

(declare-fun b!222974 () Bool)

(declare-fun e!144888 () Bool)

(declare-fun e!144891 () Bool)

(assert (=> b!222974 (= e!144888 e!144891)))

(declare-fun res!109507 () Bool)

(assert (=> b!222974 (=> (not res!109507) (not e!144891))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222974 (= res!109507 (inRange!0 index!297 (mask!10015 thiss!1504)))))

(declare-datatypes ((Unit!6649 0))(
  ( (Unit!6650) )
))
(declare-fun lt!112838 () Unit!6649)

(declare-fun e!144898 () Unit!6649)

(assert (=> b!222974 (= lt!112838 e!144898)))

(declare-fun c!37042 () Bool)

(declare-datatypes ((tuple2!4318 0))(
  ( (tuple2!4319 (_1!2170 (_ BitVec 64)) (_2!2170 V!7449)) )
))
(declare-datatypes ((List!3218 0))(
  ( (Nil!3215) (Cons!3214 (h!3862 tuple2!4318) (t!8169 List!3218)) )
))
(declare-datatypes ((ListLongMap!3233 0))(
  ( (ListLongMap!3234 (toList!1632 List!3218)) )
))
(declare-fun contains!1504 (ListLongMap!3233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1164 (array!10945 array!10943 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 32) Int) ListLongMap!3233)

(assert (=> b!222974 (= c!37042 (contains!1504 (getCurrentListMap!1164 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4191 thiss!1504)) key!932))))

(declare-fun b!222975 () Bool)

(declare-fun res!109519 () Bool)

(declare-fun e!144899 () Bool)

(assert (=> b!222975 (=> res!109519 e!144899)))

(assert (=> b!222975 (= res!109519 (contains!1503 Nil!3214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222976 () Bool)

(declare-fun e!144896 () Bool)

(assert (=> b!222976 (= e!144896 e!144883)))

(declare-fun res!109512 () Bool)

(assert (=> b!222976 (=> res!109512 e!144883)))

(assert (=> b!222976 (= res!109512 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222977 () Bool)

(declare-fun e!144886 () Bool)

(declare-fun e!144887 () Bool)

(declare-fun mapRes!9946 () Bool)

(assert (=> b!222977 (= e!144886 (and e!144887 mapRes!9946))))

(declare-fun condMapEmpty!9946 () Bool)

(declare-fun mapDefault!9946 () ValueCell!2582)

(assert (=> b!222977 (= condMapEmpty!9946 (= (arr!5191 (_values!4174 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2582)) mapDefault!9946)))))

(declare-fun b!222978 () Bool)

(declare-fun e!144895 () Unit!6649)

(declare-fun Unit!6651 () Unit!6649)

(assert (=> b!222978 (= e!144895 Unit!6651)))

(declare-fun b!222979 () Bool)

(declare-fun e!144882 () Bool)

(declare-fun e!144894 () Bool)

(assert (=> b!222979 (= e!144882 e!144894)))

(declare-fun res!109515 () Bool)

(assert (=> b!222979 (= res!109515 call!20789)))

(assert (=> b!222979 (=> (not res!109515) (not e!144894))))

(declare-fun b!222980 () Bool)

(declare-fun e!144884 () Bool)

(declare-fun tp_is_empty!5851 () Bool)

(assert (=> b!222980 (= e!144884 tp_is_empty!5851)))

(declare-fun b!222981 () Bool)

(declare-fun e!144893 () Bool)

(declare-fun call!20790 () Bool)

(assert (=> b!222981 (= e!144893 (not call!20790))))

(declare-fun b!222982 () Bool)

(declare-fun Unit!6652 () Unit!6649)

(assert (=> b!222982 (= e!144895 Unit!6652)))

(declare-fun lt!112833 () Unit!6649)

(declare-fun lemmaArrayContainsKeyThenInListMap!62 (array!10945 array!10943 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) (_ BitVec 32) Int) Unit!6649)

(assert (=> b!222982 (= lt!112833 (lemmaArrayContainsKeyThenInListMap!62 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222982 false))

(declare-fun b!222983 () Bool)

(declare-fun c!37043 () Bool)

(get-info :version)

(assert (=> b!222983 (= c!37043 ((_ is MissingVacant!814) lt!112837))))

(declare-fun e!144892 () Bool)

(assert (=> b!222983 (= e!144892 e!144882)))

(declare-fun b!222984 () Bool)

(assert (=> b!222984 (= e!144887 tp_is_empty!5851)))

(declare-fun bm!20787 () Bool)

(declare-fun arrayContainsKey!0 (array!10945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20787 (= call!20790 (arrayContainsKey!0 (_keys!6245 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222985 () Bool)

(declare-fun res!109508 () Bool)

(assert (=> b!222985 (=> res!109508 e!144899)))

(assert (=> b!222985 (= res!109508 (contains!1503 Nil!3214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!109513 () Bool)

(declare-fun e!144897 () Bool)

(assert (=> start!21926 (=> (not res!109513) (not e!144897))))

(declare-fun valid!1241 (LongMapFixedSize!3064) Bool)

(assert (=> start!21926 (= res!109513 (valid!1241 thiss!1504))))

(assert (=> start!21926 e!144897))

(declare-fun e!144885 () Bool)

(assert (=> start!21926 e!144885))

(assert (=> start!21926 true))

(declare-fun b!222986 () Bool)

(assert (=> b!222986 (= e!144897 e!144888)))

(declare-fun res!109520 () Bool)

(assert (=> b!222986 (=> (not res!109520) (not e!144888))))

(assert (=> b!222986 (= res!109520 (or (= lt!112837 (MissingZero!814 index!297)) (= lt!112837 (MissingVacant!814 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10945 (_ BitVec 32)) SeekEntryResult!814)

(assert (=> b!222986 (= lt!112837 (seekEntryOrOpen!0 key!932 (_keys!6245 thiss!1504) (mask!10015 thiss!1504)))))

(declare-fun b!222987 () Bool)

(declare-fun res!109514 () Bool)

(assert (=> b!222987 (=> res!109514 e!144899)))

(declare-fun arrayNoDuplicates!0 (array!10945 (_ BitVec 32) List!3217) Bool)

(assert (=> b!222987 (= res!109514 (not (arrayNoDuplicates!0 (_keys!6245 thiss!1504) #b00000000000000000000000000000000 Nil!3214)))))

(declare-fun b!222988 () Bool)

(declare-fun res!109521 () Bool)

(assert (=> b!222988 (=> (not res!109521) (not e!144893))))

(assert (=> b!222988 (= res!109521 (= (select (arr!5192 (_keys!6245 thiss!1504)) (index!5426 lt!112837)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222989 () Bool)

(declare-fun res!109516 () Bool)

(assert (=> b!222989 (=> res!109516 e!144899)))

(declare-fun noDuplicate!73 (List!3217) Bool)

(assert (=> b!222989 (= res!109516 (not (noDuplicate!73 Nil!3214)))))

(declare-fun mapNonEmpty!9946 () Bool)

(declare-fun tp!21109 () Bool)

(assert (=> mapNonEmpty!9946 (= mapRes!9946 (and tp!21109 e!144884))))

(declare-fun mapKey!9946 () (_ BitVec 32))

(declare-fun mapValue!9946 () ValueCell!2582)

(declare-fun mapRest!9946 () (Array (_ BitVec 32) ValueCell!2582))

(assert (=> mapNonEmpty!9946 (= (arr!5191 (_values!4174 thiss!1504)) (store mapRest!9946 mapKey!9946 mapValue!9946))))

(declare-fun b!222990 () Bool)

(declare-fun res!109524 () Bool)

(assert (=> b!222990 (=> (not res!109524) (not e!144893))))

(assert (=> b!222990 (= res!109524 call!20789)))

(assert (=> b!222990 (= e!144892 e!144893)))

(declare-fun b!222991 () Bool)

(declare-fun res!109509 () Bool)

(assert (=> b!222991 (=> res!109509 e!144899)))

(assert (=> b!222991 (= res!109509 (not (contains!1503 Nil!3214 key!932)))))

(declare-fun b!222992 () Bool)

(assert (=> b!222992 (= e!144891 false)))

(declare-fun lt!112834 () Bool)

(assert (=> b!222992 (= lt!112834 e!144899)))

(declare-fun res!109525 () Bool)

(assert (=> b!222992 (=> res!109525 e!144899)))

(assert (=> b!222992 (= res!109525 (or (bvsge (size!5525 (_keys!6245 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!5525 (_keys!6245 thiss!1504)))))))

(declare-fun lt!112836 () Unit!6649)

(assert (=> b!222992 (= lt!112836 e!144895)))

(declare-fun c!37044 () Bool)

(declare-fun lt!112839 () Bool)

(assert (=> b!222992 (= c!37044 lt!112839)))

(assert (=> b!222992 (= lt!112839 (arrayContainsKey!0 (_keys!6245 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222993 () Bool)

(declare-fun res!109510 () Bool)

(assert (=> b!222993 (= res!109510 (= (select (arr!5192 (_keys!6245 thiss!1504)) (index!5429 lt!112837)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222993 (=> (not res!109510) (not e!144894))))

(declare-fun b!222994 () Bool)

(declare-fun e!144889 () Bool)

(assert (=> b!222994 (= e!144889 (not (contains!1503 Nil!3214 key!932)))))

(declare-fun array_inv!3407 (array!10945) Bool)

(declare-fun array_inv!3408 (array!10943) Bool)

(assert (=> b!222995 (= e!144885 (and tp!21108 tp_is_empty!5851 (array_inv!3407 (_keys!6245 thiss!1504)) (array_inv!3408 (_values!4174 thiss!1504)) e!144886))))

(declare-fun b!222996 () Bool)

(declare-fun res!109522 () Bool)

(assert (=> b!222996 (=> res!109522 e!144899)))

(assert (=> b!222996 (= res!109522 e!144896)))

(declare-fun res!109517 () Bool)

(assert (=> b!222996 (=> (not res!109517) (not e!144896))))

(assert (=> b!222996 (= res!109517 e!144889)))

(declare-fun res!109511 () Bool)

(assert (=> b!222996 (=> res!109511 e!144889)))

(assert (=> b!222996 (= res!109511 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222997 () Bool)

(declare-fun res!109505 () Bool)

(assert (=> b!222997 (=> res!109505 e!144899)))

(assert (=> b!222997 (= res!109505 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5525 (_keys!6245 thiss!1504)))))))

(declare-fun b!222998 () Bool)

(assert (=> b!222998 (= e!144894 (not call!20790))))

(declare-fun b!222999 () Bool)

(assert (=> b!222999 (= e!144882 ((_ is Undefined!814) lt!112837))))

(declare-fun b!223000 () Bool)

(declare-fun lt!112835 () Unit!6649)

(assert (=> b!223000 (= e!144898 lt!112835)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!217 (array!10945 array!10943 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) Int) Unit!6649)

(assert (=> b!223000 (= lt!112835 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!217 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!223000 (= c!37045 ((_ is MissingZero!814) lt!112837))))

(assert (=> b!223000 e!144892))

(declare-fun b!223001 () Bool)

(declare-fun res!109506 () Bool)

(assert (=> b!223001 (=> res!109506 e!144899)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223001 (= res!109506 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!9946 () Bool)

(assert (=> mapIsEmpty!9946 mapRes!9946))

(declare-fun b!223002 () Bool)

(declare-fun Unit!6653 () Unit!6649)

(assert (=> b!223002 (= e!144898 Unit!6653)))

(declare-fun lt!112840 () Unit!6649)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!223 (array!10945 array!10943 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) Int) Unit!6649)

(assert (=> b!223002 (= lt!112840 (lemmaInListMapThenSeekEntryOrOpenFindsIt!223 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!223002 false))

(declare-fun b!223003 () Bool)

(declare-fun res!109523 () Bool)

(assert (=> b!223003 (=> res!109523 e!144899)))

(assert (=> b!223003 (= res!109523 lt!112839)))

(declare-fun b!223004 () Bool)

(declare-fun res!109518 () Bool)

(assert (=> b!223004 (=> (not res!109518) (not e!144897))))

(assert (=> b!223004 (= res!109518 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223005 () Bool)

(assert (=> b!223005 (= e!144899 true)))

(assert (= (and start!21926 res!109513) b!223004))

(assert (= (and b!223004 res!109518) b!222986))

(assert (= (and b!222986 res!109520) b!222974))

(assert (= (and b!222974 c!37042) b!223002))

(assert (= (and b!222974 (not c!37042)) b!223000))

(assert (= (and b!223000 c!37045) b!222990))

(assert (= (and b!223000 (not c!37045)) b!222983))

(assert (= (and b!222990 res!109524) b!222988))

(assert (= (and b!222988 res!109521) b!222981))

(assert (= (and b!222983 c!37043) b!222979))

(assert (= (and b!222983 (not c!37043)) b!222999))

(assert (= (and b!222979 res!109515) b!222993))

(assert (= (and b!222993 res!109510) b!222998))

(assert (= (or b!222990 b!222979) bm!20786))

(assert (= (or b!222981 b!222998) bm!20787))

(assert (= (and b!222974 res!109507) b!222992))

(assert (= (and b!222992 c!37044) b!222982))

(assert (= (and b!222992 (not c!37044)) b!222978))

(assert (= (and b!222992 (not res!109525)) b!222989))

(assert (= (and b!222989 (not res!109516)) b!222985))

(assert (= (and b!222985 (not res!109508)) b!222975))

(assert (= (and b!222975 (not res!109519)) b!222996))

(assert (= (and b!222996 (not res!109511)) b!222994))

(assert (= (and b!222996 res!109517) b!222976))

(assert (= (and b!222976 (not res!109512)) b!222973))

(assert (= (and b!222996 (not res!109522)) b!222987))

(assert (= (and b!222987 (not res!109514)) b!222997))

(assert (= (and b!222997 (not res!109505)) b!223001))

(assert (= (and b!223001 (not res!109506)) b!223003))

(assert (= (and b!223003 (not res!109523)) b!222991))

(assert (= (and b!222991 (not res!109509)) b!223005))

(assert (= (and b!222977 condMapEmpty!9946) mapIsEmpty!9946))

(assert (= (and b!222977 (not condMapEmpty!9946)) mapNonEmpty!9946))

(assert (= (and mapNonEmpty!9946 ((_ is ValueCellFull!2582) mapValue!9946)) b!222980))

(assert (= (and b!222977 ((_ is ValueCellFull!2582) mapDefault!9946)) b!222984))

(assert (= b!222995 b!222977))

(assert (= start!21926 b!222995))

(declare-fun m!246967 () Bool)

(assert (=> bm!20787 m!246967))

(declare-fun m!246969 () Bool)

(assert (=> bm!20786 m!246969))

(declare-fun m!246971 () Bool)

(assert (=> b!222993 m!246971))

(declare-fun m!246973 () Bool)

(assert (=> b!223002 m!246973))

(declare-fun m!246975 () Bool)

(assert (=> b!222988 m!246975))

(declare-fun m!246977 () Bool)

(assert (=> b!222987 m!246977))

(declare-fun m!246979 () Bool)

(assert (=> b!222973 m!246979))

(declare-fun m!246981 () Bool)

(assert (=> b!222982 m!246981))

(declare-fun m!246983 () Bool)

(assert (=> mapNonEmpty!9946 m!246983))

(declare-fun m!246985 () Bool)

(assert (=> start!21926 m!246985))

(assert (=> b!222991 m!246979))

(declare-fun m!246987 () Bool)

(assert (=> b!222995 m!246987))

(declare-fun m!246989 () Bool)

(assert (=> b!222995 m!246989))

(declare-fun m!246991 () Bool)

(assert (=> b!223000 m!246991))

(declare-fun m!246993 () Bool)

(assert (=> b!223001 m!246993))

(declare-fun m!246995 () Bool)

(assert (=> b!222986 m!246995))

(assert (=> b!222994 m!246979))

(declare-fun m!246997 () Bool)

(assert (=> b!222989 m!246997))

(declare-fun m!246999 () Bool)

(assert (=> b!222985 m!246999))

(declare-fun m!247001 () Bool)

(assert (=> b!222975 m!247001))

(declare-fun m!247003 () Bool)

(assert (=> b!222974 m!247003))

(declare-fun m!247005 () Bool)

(assert (=> b!222974 m!247005))

(assert (=> b!222974 m!247005))

(declare-fun m!247007 () Bool)

(assert (=> b!222974 m!247007))

(assert (=> b!222992 m!246967))

(check-sat (not b!222985) (not b!222992) (not b!222974) (not bm!20786) (not b!222975) (not b!222986) (not b!223001) (not b!223000) (not b!222995) (not b!222989) (not b!223002) (not b!222994) (not b_next!5989) (not start!21926) b_and!12901 (not b!222987) (not mapNonEmpty!9946) (not b!222991) (not bm!20787) tp_is_empty!5851 (not b!222982) (not b!222973))
(check-sat b_and!12901 (not b_next!5989))
