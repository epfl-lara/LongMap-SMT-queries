; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21922 () Bool)

(assert start!21922)

(declare-fun b!222945 () Bool)

(declare-fun b_free!5989 () Bool)

(declare-fun b_next!5989 () Bool)

(assert (=> b!222945 (= b_free!5989 (not b_next!5989))))

(declare-fun tp!21109 () Bool)

(declare-fun b_and!12887 () Bool)

(assert (=> b!222945 (= tp!21109 b_and!12887)))

(declare-fun b!222926 () Bool)

(declare-fun res!109488 () Bool)

(declare-fun e!144859 () Bool)

(assert (=> b!222926 (=> res!109488 e!144859)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!222926 (= res!109488 (not (validKeyInArray!0 key!932)))))

(declare-fun b!222927 () Bool)

(declare-fun e!144868 () Bool)

(declare-fun e!144871 () Bool)

(assert (=> b!222927 (= e!144868 e!144871)))

(declare-fun res!109502 () Bool)

(assert (=> b!222927 (=> (not res!109502) (not e!144871))))

(declare-datatypes ((SeekEntryResult!843 0))(
  ( (MissingZero!843 (index!5542 (_ BitVec 32))) (Found!843 (index!5543 (_ BitVec 32))) (Intermediate!843 (undefined!1655 Bool) (index!5544 (_ BitVec 32)) (x!23079 (_ BitVec 32))) (Undefined!843) (MissingVacant!843 (index!5545 (_ BitVec 32))) )
))
(declare-fun lt!112775 () SeekEntryResult!843)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222927 (= res!109502 (or (= lt!112775 (MissingZero!843 index!297)) (= lt!112775 (MissingVacant!843 index!297))))))

(declare-datatypes ((V!7449 0))(
  ( (V!7450 (val!2970 Int)) )
))
(declare-datatypes ((ValueCell!2582 0))(
  ( (ValueCellFull!2582 (v!4990 V!7449)) (EmptyCell!2582) )
))
(declare-datatypes ((array!10945 0))(
  ( (array!10946 (arr!5192 (Array (_ BitVec 32) ValueCell!2582)) (size!5525 (_ BitVec 32))) )
))
(declare-datatypes ((array!10947 0))(
  ( (array!10948 (arr!5193 (Array (_ BitVec 32) (_ BitVec 64))) (size!5526 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3064 0))(
  ( (LongMapFixedSize!3065 (defaultEntry!4191 Int) (mask!10015 (_ BitVec 32)) (extraKeys!3928 (_ BitVec 32)) (zeroValue!4032 V!7449) (minValue!4032 V!7449) (_size!1581 (_ BitVec 32)) (_keys!6245 array!10947) (_values!4174 array!10945) (_vacant!1581 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3064)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10947 (_ BitVec 32)) SeekEntryResult!843)

(assert (=> b!222927 (= lt!112775 (seekEntryOrOpen!0 key!932 (_keys!6245 thiss!1504) (mask!10015 thiss!1504)))))

(declare-fun b!222928 () Bool)

(declare-fun e!144872 () Bool)

(declare-datatypes ((List!3312 0))(
  ( (Nil!3309) (Cons!3308 (h!3956 (_ BitVec 64)) (t!8271 List!3312)) )
))
(declare-fun contains!1532 (List!3312 (_ BitVec 64)) Bool)

(assert (=> b!222928 (= e!144872 (not (contains!1532 Nil!3309 key!932)))))

(declare-fun b!222929 () Bool)

(declare-fun c!37032 () Bool)

(assert (=> b!222929 (= c!37032 (is-MissingVacant!843 lt!112775))))

(declare-fun e!144875 () Bool)

(declare-fun e!144865 () Bool)

(assert (=> b!222929 (= e!144875 e!144865)))

(declare-fun b!222930 () Bool)

(declare-fun res!109499 () Bool)

(declare-fun e!144861 () Bool)

(assert (=> b!222930 (=> (not res!109499) (not e!144861))))

(declare-fun call!20802 () Bool)

(assert (=> b!222930 (= res!109499 call!20802)))

(assert (=> b!222930 (= e!144875 e!144861)))

(declare-fun b!222931 () Bool)

(assert (=> b!222931 (= e!144865 (is-Undefined!843 lt!112775))))

(declare-fun b!222932 () Bool)

(declare-fun e!144864 () Bool)

(declare-fun tp_is_empty!5851 () Bool)

(assert (=> b!222932 (= e!144864 tp_is_empty!5851)))

(declare-fun bm!20798 () Bool)

(declare-fun c!37031 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20798 (= call!20802 (inRange!0 (ite c!37031 (index!5542 lt!112775) (index!5545 lt!112775)) (mask!10015 thiss!1504)))))

(declare-fun b!222934 () Bool)

(declare-fun e!144870 () Bool)

(declare-fun e!144866 () Bool)

(assert (=> b!222934 (= e!144870 e!144866)))

(declare-fun res!109493 () Bool)

(assert (=> b!222934 (=> res!109493 e!144866)))

(assert (=> b!222934 (= res!109493 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222935 () Bool)

(declare-datatypes ((Unit!6690 0))(
  ( (Unit!6691) )
))
(declare-fun e!144867 () Unit!6690)

(declare-fun Unit!6692 () Unit!6690)

(assert (=> b!222935 (= e!144867 Unit!6692)))

(declare-fun mapIsEmpty!9946 () Bool)

(declare-fun mapRes!9946 () Bool)

(assert (=> mapIsEmpty!9946 mapRes!9946))

(declare-fun b!222936 () Bool)

(declare-fun call!20801 () Bool)

(assert (=> b!222936 (= e!144861 (not call!20801))))

(declare-fun b!222937 () Bool)

(declare-fun e!144862 () Bool)

(assert (=> b!222937 (= e!144862 (not call!20801))))

(declare-fun b!222938 () Bool)

(declare-fun Unit!6693 () Unit!6690)

(assert (=> b!222938 (= e!144867 Unit!6693)))

(declare-fun lt!112774 () Unit!6690)

(declare-fun lemmaArrayContainsKeyThenInListMap!66 (array!10947 array!10945 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) (_ BitVec 32) Int) Unit!6690)

(assert (=> b!222938 (= lt!112774 (lemmaArrayContainsKeyThenInListMap!66 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222938 false))

(declare-fun b!222939 () Bool)

(declare-fun e!144869 () Bool)

(assert (=> b!222939 (= e!144871 e!144869)))

(declare-fun res!109496 () Bool)

(assert (=> b!222939 (=> (not res!109496) (not e!144869))))

(assert (=> b!222939 (= res!109496 (inRange!0 index!297 (mask!10015 thiss!1504)))))

(declare-fun lt!112780 () Unit!6690)

(declare-fun e!144858 () Unit!6690)

(assert (=> b!222939 (= lt!112780 e!144858)))

(declare-fun c!37030 () Bool)

(declare-datatypes ((tuple2!4406 0))(
  ( (tuple2!4407 (_1!2214 (_ BitVec 64)) (_2!2214 V!7449)) )
))
(declare-datatypes ((List!3313 0))(
  ( (Nil!3310) (Cons!3309 (h!3957 tuple2!4406) (t!8272 List!3313)) )
))
(declare-datatypes ((ListLongMap!3319 0))(
  ( (ListLongMap!3320 (toList!1675 List!3313)) )
))
(declare-fun contains!1533 (ListLongMap!3319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1203 (array!10947 array!10945 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 32) Int) ListLongMap!3319)

(assert (=> b!222939 (= c!37030 (contains!1533 (getCurrentListMap!1203 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4191 thiss!1504)) key!932))))

(declare-fun b!222940 () Bool)

(declare-fun res!109490 () Bool)

(assert (=> b!222940 (= res!109490 (= (select (arr!5193 (_keys!6245 thiss!1504)) (index!5545 lt!112775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222940 (=> (not res!109490) (not e!144862))))

(declare-fun b!222941 () Bool)

(declare-fun res!109484 () Bool)

(assert (=> b!222941 (=> res!109484 e!144859)))

(assert (=> b!222941 (= res!109484 (contains!1532 Nil!3309 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222942 () Bool)

(declare-fun res!109486 () Bool)

(assert (=> b!222942 (=> res!109486 e!144859)))

(declare-fun lt!112778 () Bool)

(assert (=> b!222942 (= res!109486 lt!112778)))

(declare-fun b!222943 () Bool)

(assert (=> b!222943 (= e!144865 e!144862)))

(declare-fun res!109503 () Bool)

(assert (=> b!222943 (= res!109503 call!20802)))

(assert (=> b!222943 (=> (not res!109503) (not e!144862))))

(declare-fun b!222944 () Bool)

(declare-fun e!144863 () Bool)

(assert (=> b!222944 (= e!144863 tp_is_empty!5851)))

(declare-fun mapNonEmpty!9946 () Bool)

(declare-fun tp!21108 () Bool)

(assert (=> mapNonEmpty!9946 (= mapRes!9946 (and tp!21108 e!144863))))

(declare-fun mapValue!9946 () ValueCell!2582)

(declare-fun mapRest!9946 () (Array (_ BitVec 32) ValueCell!2582))

(declare-fun mapKey!9946 () (_ BitVec 32))

(assert (=> mapNonEmpty!9946 (= (arr!5192 (_values!4174 thiss!1504)) (store mapRest!9946 mapKey!9946 mapValue!9946))))

(declare-fun e!144874 () Bool)

(declare-fun e!144860 () Bool)

(declare-fun array_inv!3437 (array!10947) Bool)

(declare-fun array_inv!3438 (array!10945) Bool)

(assert (=> b!222945 (= e!144874 (and tp!21109 tp_is_empty!5851 (array_inv!3437 (_keys!6245 thiss!1504)) (array_inv!3438 (_values!4174 thiss!1504)) e!144860))))

(declare-fun b!222946 () Bool)

(declare-fun res!109492 () Bool)

(assert (=> b!222946 (=> (not res!109492) (not e!144868))))

(assert (=> b!222946 (= res!109492 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222947 () Bool)

(assert (=> b!222947 (= e!144866 (contains!1532 Nil!3309 key!932))))

(declare-fun b!222948 () Bool)

(declare-fun res!109487 () Bool)

(assert (=> b!222948 (=> res!109487 e!144859)))

(assert (=> b!222948 (= res!109487 (not (contains!1532 Nil!3309 key!932)))))

(declare-fun bm!20799 () Bool)

(declare-fun arrayContainsKey!0 (array!10947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20799 (= call!20801 (arrayContainsKey!0 (_keys!6245 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222949 () Bool)

(declare-fun res!109491 () Bool)

(assert (=> b!222949 (=> res!109491 e!144859)))

(assert (=> b!222949 (= res!109491 (contains!1532 Nil!3309 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222950 () Bool)

(declare-fun Unit!6694 () Unit!6690)

(assert (=> b!222950 (= e!144858 Unit!6694)))

(declare-fun lt!112781 () Unit!6690)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!228 (array!10947 array!10945 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) Int) Unit!6690)

(assert (=> b!222950 (= lt!112781 (lemmaInListMapThenSeekEntryOrOpenFindsIt!228 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222950 false))

(declare-fun b!222951 () Bool)

(declare-fun res!109500 () Bool)

(assert (=> b!222951 (=> res!109500 e!144859)))

(assert (=> b!222951 (= res!109500 e!144870)))

(declare-fun res!109489 () Bool)

(assert (=> b!222951 (=> (not res!109489) (not e!144870))))

(assert (=> b!222951 (= res!109489 e!144872)))

(declare-fun res!109485 () Bool)

(assert (=> b!222951 (=> res!109485 e!144872)))

(assert (=> b!222951 (= res!109485 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222952 () Bool)

(declare-fun res!109498 () Bool)

(assert (=> b!222952 (=> res!109498 e!144859)))

(assert (=> b!222952 (= res!109498 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5526 (_keys!6245 thiss!1504)))))))

(declare-fun res!109494 () Bool)

(assert (=> start!21922 (=> (not res!109494) (not e!144868))))

(declare-fun valid!1234 (LongMapFixedSize!3064) Bool)

(assert (=> start!21922 (= res!109494 (valid!1234 thiss!1504))))

(assert (=> start!21922 e!144868))

(assert (=> start!21922 e!144874))

(assert (=> start!21922 true))

(declare-fun b!222933 () Bool)

(declare-fun res!109504 () Bool)

(assert (=> b!222933 (=> res!109504 e!144859)))

(declare-fun noDuplicate!74 (List!3312) Bool)

(assert (=> b!222933 (= res!109504 (not (noDuplicate!74 Nil!3309)))))

(declare-fun b!222953 () Bool)

(assert (=> b!222953 (= e!144859 true)))

(declare-fun b!222954 () Bool)

(declare-fun lt!112776 () Unit!6690)

(assert (=> b!222954 (= e!144858 lt!112776)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!239 (array!10947 array!10945 (_ BitVec 32) (_ BitVec 32) V!7449 V!7449 (_ BitVec 64) Int) Unit!6690)

(assert (=> b!222954 (= lt!112776 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!239 (_keys!6245 thiss!1504) (_values!4174 thiss!1504) (mask!10015 thiss!1504) (extraKeys!3928 thiss!1504) (zeroValue!4032 thiss!1504) (minValue!4032 thiss!1504) key!932 (defaultEntry!4191 thiss!1504)))))

(assert (=> b!222954 (= c!37031 (is-MissingZero!843 lt!112775))))

(assert (=> b!222954 e!144875))

(declare-fun b!222955 () Bool)

(assert (=> b!222955 (= e!144869 false)))

(declare-fun lt!112779 () Bool)

(assert (=> b!222955 (= lt!112779 e!144859)))

(declare-fun res!109495 () Bool)

(assert (=> b!222955 (=> res!109495 e!144859)))

(assert (=> b!222955 (= res!109495 (or (bvsge (size!5526 (_keys!6245 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!5526 (_keys!6245 thiss!1504)))))))

(declare-fun lt!112777 () Unit!6690)

(assert (=> b!222955 (= lt!112777 e!144867)))

(declare-fun c!37029 () Bool)

(assert (=> b!222955 (= c!37029 lt!112778)))

(assert (=> b!222955 (= lt!112778 (arrayContainsKey!0 (_keys!6245 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222956 () Bool)

(declare-fun res!109501 () Bool)

(assert (=> b!222956 (=> res!109501 e!144859)))

(declare-fun arrayNoDuplicates!0 (array!10947 (_ BitVec 32) List!3312) Bool)

(assert (=> b!222956 (= res!109501 (not (arrayNoDuplicates!0 (_keys!6245 thiss!1504) #b00000000000000000000000000000000 Nil!3309)))))

(declare-fun b!222957 () Bool)

(assert (=> b!222957 (= e!144860 (and e!144864 mapRes!9946))))

(declare-fun condMapEmpty!9946 () Bool)

(declare-fun mapDefault!9946 () ValueCell!2582)

