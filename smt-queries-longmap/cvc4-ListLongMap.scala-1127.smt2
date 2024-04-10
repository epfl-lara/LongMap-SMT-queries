; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23150 () Bool)

(assert start!23150)

(declare-fun b!242862 () Bool)

(declare-fun b_free!6515 () Bool)

(declare-fun b_next!6515 () Bool)

(assert (=> b!242862 (= b_free!6515 (not b_next!6515))))

(declare-fun tp!22761 () Bool)

(declare-fun b_and!13493 () Bool)

(assert (=> b!242862 (= tp!22761 b_and!13493)))

(declare-fun b!242839 () Bool)

(declare-fun e!157601 () Bool)

(declare-fun tp_is_empty!6377 () Bool)

(assert (=> b!242839 (= e!157601 tp_is_empty!6377)))

(declare-fun b!242840 () Bool)

(declare-fun e!157602 () Bool)

(declare-datatypes ((SeekEntryResult!1068 0))(
  ( (MissingZero!1068 (index!6442 (_ BitVec 32))) (Found!1068 (index!6443 (_ BitVec 32))) (Intermediate!1068 (undefined!1880 Bool) (index!6444 (_ BitVec 32)) (x!24292 (_ BitVec 32))) (Undefined!1068) (MissingVacant!1068 (index!6445 (_ BitVec 32))) )
))
(declare-fun lt!121927 () SeekEntryResult!1068)

(assert (=> b!242840 (= e!157602 (is-Undefined!1068 lt!121927))))

(declare-fun bm!22628 () Bool)

(declare-fun call!22632 () Bool)

(declare-datatypes ((V!8149 0))(
  ( (V!8150 (val!3233 Int)) )
))
(declare-datatypes ((ValueCell!2845 0))(
  ( (ValueCellFull!2845 (v!5276 V!8149)) (EmptyCell!2845) )
))
(declare-datatypes ((array!12041 0))(
  ( (array!12042 (arr!5718 (Array (_ BitVec 32) ValueCell!2845)) (size!6060 (_ BitVec 32))) )
))
(declare-datatypes ((array!12043 0))(
  ( (array!12044 (arr!5719 (Array (_ BitVec 32) (_ BitVec 64))) (size!6061 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3590 0))(
  ( (LongMapFixedSize!3591 (defaultEntry!4500 Int) (mask!10585 (_ BitVec 32)) (extraKeys!4237 (_ BitVec 32)) (zeroValue!4341 V!8149) (minValue!4341 V!8149) (_size!1844 (_ BitVec 32)) (_keys!6609 array!12043) (_values!4483 array!12041) (_vacant!1844 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3590)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22628 (= call!22632 (arrayContainsKey!0 (_keys!6609 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242841 () Bool)

(declare-fun res!118998 () Bool)

(declare-fun e!157615 () Bool)

(assert (=> b!242841 (=> (not res!118998) (not e!157615))))

(declare-datatypes ((List!3640 0))(
  ( (Nil!3637) (Cons!3636 (h!4293 (_ BitVec 64)) (t!8643 List!3640)) )
))
(declare-fun noDuplicate!93 (List!3640) Bool)

(assert (=> b!242841 (= res!118998 (noDuplicate!93 Nil!3637))))

(declare-fun b!242842 () Bool)

(declare-fun res!118999 () Bool)

(assert (=> b!242842 (=> (not res!118999) (not e!157615))))

(declare-fun contains!1748 (List!3640 (_ BitVec 64)) Bool)

(assert (=> b!242842 (= res!118999 (not (contains!1748 Nil!3637 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!119003 () Bool)

(declare-fun e!157604 () Bool)

(assert (=> start!23150 (=> (not res!119003) (not e!157604))))

(declare-fun valid!1408 (LongMapFixedSize!3590) Bool)

(assert (=> start!23150 (= res!119003 (valid!1408 thiss!1504))))

(assert (=> start!23150 e!157604))

(declare-fun e!157613 () Bool)

(assert (=> start!23150 e!157613))

(assert (=> start!23150 true))

(declare-fun b!242843 () Bool)

(declare-fun res!119005 () Bool)

(declare-fun e!157603 () Bool)

(assert (=> b!242843 (=> (not res!119005) (not e!157603))))

(declare-fun call!22631 () Bool)

(assert (=> b!242843 (= res!119005 call!22631)))

(declare-fun e!157607 () Bool)

(assert (=> b!242843 (= e!157607 e!157603)))

(declare-fun b!242844 () Bool)

(declare-datatypes ((Unit!7492 0))(
  ( (Unit!7493) )
))
(declare-fun e!157617 () Unit!7492)

(declare-fun lt!121928 () Unit!7492)

(assert (=> b!242844 (= e!157617 lt!121928)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!367 (array!12043 array!12041 (_ BitVec 32) (_ BitVec 32) V!8149 V!8149 (_ BitVec 64) Int) Unit!7492)

(assert (=> b!242844 (= lt!121928 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!367 (_keys!6609 thiss!1504) (_values!4483 thiss!1504) (mask!10585 thiss!1504) (extraKeys!4237 thiss!1504) (zeroValue!4341 thiss!1504) (minValue!4341 thiss!1504) key!932 (defaultEntry!4500 thiss!1504)))))

(declare-fun c!40527 () Bool)

(assert (=> b!242844 (= c!40527 (is-MissingZero!1068 lt!121927))))

(assert (=> b!242844 e!157607))

(declare-fun b!242845 () Bool)

(declare-fun e!157606 () Unit!7492)

(declare-fun Unit!7494 () Unit!7492)

(assert (=> b!242845 (= e!157606 Unit!7494)))

(declare-fun lt!121932 () Unit!7492)

(declare-fun lemmaArrayContainsKeyThenInListMap!162 (array!12043 array!12041 (_ BitVec 32) (_ BitVec 32) V!8149 V!8149 (_ BitVec 64) (_ BitVec 32) Int) Unit!7492)

(assert (=> b!242845 (= lt!121932 (lemmaArrayContainsKeyThenInListMap!162 (_keys!6609 thiss!1504) (_values!4483 thiss!1504) (mask!10585 thiss!1504) (extraKeys!4237 thiss!1504) (zeroValue!4341 thiss!1504) (minValue!4341 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4500 thiss!1504)))))

(assert (=> b!242845 false))

(declare-fun b!242846 () Bool)

(declare-fun e!157612 () Bool)

(assert (=> b!242846 (= e!157612 e!157615)))

(declare-fun res!119012 () Bool)

(assert (=> b!242846 (=> (not res!119012) (not e!157615))))

(assert (=> b!242846 (= res!119012 (and (bvslt (size!6061 (_keys!6609 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6061 (_keys!6609 thiss!1504)))))))

(declare-fun lt!121930 () Unit!7492)

(assert (=> b!242846 (= lt!121930 e!157606)))

(declare-fun c!40530 () Bool)

(assert (=> b!242846 (= c!40530 (arrayContainsKey!0 (_keys!6609 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242847 () Bool)

(declare-fun res!119008 () Bool)

(assert (=> b!242847 (=> (not res!119008) (not e!157603))))

(assert (=> b!242847 (= res!119008 (= (select (arr!5719 (_keys!6609 thiss!1504)) (index!6442 lt!121927)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242848 () Bool)

(declare-fun Unit!7495 () Unit!7492)

(assert (=> b!242848 (= e!157617 Unit!7495)))

(declare-fun lt!121929 () Unit!7492)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!357 (array!12043 array!12041 (_ BitVec 32) (_ BitVec 32) V!8149 V!8149 (_ BitVec 64) Int) Unit!7492)

(assert (=> b!242848 (= lt!121929 (lemmaInListMapThenSeekEntryOrOpenFindsIt!357 (_keys!6609 thiss!1504) (_values!4483 thiss!1504) (mask!10585 thiss!1504) (extraKeys!4237 thiss!1504) (zeroValue!4341 thiss!1504) (minValue!4341 thiss!1504) key!932 (defaultEntry!4500 thiss!1504)))))

(assert (=> b!242848 false))

(declare-fun mapNonEmpty!10810 () Bool)

(declare-fun mapRes!10810 () Bool)

(declare-fun tp!22762 () Bool)

(declare-fun e!157609 () Bool)

(assert (=> mapNonEmpty!10810 (= mapRes!10810 (and tp!22762 e!157609))))

(declare-fun mapKey!10810 () (_ BitVec 32))

(declare-fun mapRest!10810 () (Array (_ BitVec 32) ValueCell!2845))

(declare-fun mapValue!10810 () ValueCell!2845)

(assert (=> mapNonEmpty!10810 (= (arr!5718 (_values!4483 thiss!1504)) (store mapRest!10810 mapKey!10810 mapValue!10810))))

(declare-fun b!242849 () Bool)

(declare-fun Unit!7496 () Unit!7492)

(assert (=> b!242849 (= e!157606 Unit!7496)))

(declare-fun b!242850 () Bool)

(declare-fun e!157611 () Bool)

(assert (=> b!242850 (= e!157611 (not call!22632))))

(declare-fun b!242851 () Bool)

(declare-fun res!119001 () Bool)

(assert (=> b!242851 (=> (not res!119001) (not e!157604))))

(assert (=> b!242851 (= res!119001 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242852 () Bool)

(declare-fun e!157610 () Bool)

(assert (=> b!242852 (= e!157610 (not (contains!1748 Nil!3637 key!932)))))

(declare-fun b!242853 () Bool)

(declare-fun e!157616 () Bool)

(assert (=> b!242853 (= e!157616 e!157612)))

(declare-fun res!119006 () Bool)

(assert (=> b!242853 (=> (not res!119006) (not e!157612))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242853 (= res!119006 (inRange!0 index!297 (mask!10585 thiss!1504)))))

(declare-fun lt!121931 () Unit!7492)

(assert (=> b!242853 (= lt!121931 e!157617)))

(declare-fun c!40528 () Bool)

(declare-datatypes ((tuple2!4762 0))(
  ( (tuple2!4763 (_1!2392 (_ BitVec 64)) (_2!2392 V!8149)) )
))
(declare-datatypes ((List!3641 0))(
  ( (Nil!3638) (Cons!3637 (h!4294 tuple2!4762) (t!8644 List!3641)) )
))
(declare-datatypes ((ListLongMap!3675 0))(
  ( (ListLongMap!3676 (toList!1853 List!3641)) )
))
(declare-fun contains!1749 (ListLongMap!3675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1381 (array!12043 array!12041 (_ BitVec 32) (_ BitVec 32) V!8149 V!8149 (_ BitVec 32) Int) ListLongMap!3675)

(assert (=> b!242853 (= c!40528 (contains!1749 (getCurrentListMap!1381 (_keys!6609 thiss!1504) (_values!4483 thiss!1504) (mask!10585 thiss!1504) (extraKeys!4237 thiss!1504) (zeroValue!4341 thiss!1504) (minValue!4341 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4500 thiss!1504)) key!932))))

(declare-fun b!242854 () Bool)

(declare-fun res!119004 () Bool)

(assert (=> b!242854 (=> (not res!119004) (not e!157615))))

(assert (=> b!242854 (= res!119004 (not (contains!1748 Nil!3637 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242855 () Bool)

(declare-fun e!157605 () Bool)

(assert (=> b!242855 (= e!157605 (contains!1748 Nil!3637 key!932))))

(declare-fun b!242856 () Bool)

(declare-fun c!40529 () Bool)

(assert (=> b!242856 (= c!40529 (is-MissingVacant!1068 lt!121927))))

(assert (=> b!242856 (= e!157607 e!157602)))

(declare-fun bm!22629 () Bool)

(assert (=> bm!22629 (= call!22631 (inRange!0 (ite c!40527 (index!6442 lt!121927) (index!6445 lt!121927)) (mask!10585 thiss!1504)))))

(declare-fun b!242857 () Bool)

(assert (=> b!242857 (= e!157603 (not call!22632))))

(declare-fun b!242858 () Bool)

(declare-fun res!119000 () Bool)

(assert (=> b!242858 (=> (not res!119000) (not e!157615))))

(assert (=> b!242858 (= res!119000 e!157610)))

(declare-fun res!119011 () Bool)

(assert (=> b!242858 (=> res!119011 e!157610)))

(assert (=> b!242858 (= res!119011 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!242859 () Bool)

(assert (=> b!242859 (= e!157609 tp_is_empty!6377)))

(declare-fun b!242860 () Bool)

(declare-fun res!119007 () Bool)

(assert (=> b!242860 (= res!119007 (= (select (arr!5719 (_keys!6609 thiss!1504)) (index!6445 lt!121927)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242860 (=> (not res!119007) (not e!157611))))

(declare-fun mapIsEmpty!10810 () Bool)

(assert (=> mapIsEmpty!10810 mapRes!10810))

(declare-fun b!242861 () Bool)

(declare-fun e!157614 () Bool)

(assert (=> b!242861 (= e!157614 (and e!157601 mapRes!10810))))

(declare-fun condMapEmpty!10810 () Bool)

(declare-fun mapDefault!10810 () ValueCell!2845)

