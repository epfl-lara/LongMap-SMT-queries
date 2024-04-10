; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22946 () Bool)

(assert start!22946)

(declare-fun b!239850 () Bool)

(declare-fun b_free!6449 () Bool)

(declare-fun b_next!6449 () Bool)

(assert (=> b!239850 (= b_free!6449 (not b_next!6449))))

(declare-fun tp!22551 () Bool)

(declare-fun b_and!13415 () Bool)

(assert (=> b!239850 (= tp!22551 b_and!13415)))

(declare-fun bm!22304 () Bool)

(declare-fun call!22308 () Bool)

(declare-datatypes ((V!8061 0))(
  ( (V!8062 (val!3200 Int)) )
))
(declare-datatypes ((ValueCell!2812 0))(
  ( (ValueCellFull!2812 (v!5238 V!8061)) (EmptyCell!2812) )
))
(declare-datatypes ((array!11901 0))(
  ( (array!11902 (arr!5652 (Array (_ BitVec 32) ValueCell!2812)) (size!5993 (_ BitVec 32))) )
))
(declare-datatypes ((array!11903 0))(
  ( (array!11904 (arr!5653 (Array (_ BitVec 32) (_ BitVec 64))) (size!5994 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3524 0))(
  ( (LongMapFixedSize!3525 (defaultEntry!4447 Int) (mask!10497 (_ BitVec 32)) (extraKeys!4184 (_ BitVec 32)) (zeroValue!4288 V!8061) (minValue!4288 V!8061) (_size!1811 (_ BitVec 32)) (_keys!6549 array!11903) (_values!4430 array!11901) (_vacant!1811 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3524)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22304 (= call!22308 (arrayContainsKey!0 (_keys!6549 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239848 () Bool)

(declare-fun e!155723 () Bool)

(declare-fun e!155727 () Bool)

(assert (=> b!239848 (= e!155723 e!155727)))

(declare-fun res!117565 () Bool)

(assert (=> b!239848 (=> (not res!117565) (not e!155727))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239848 (= res!117565 (inRange!0 index!297 (mask!10497 thiss!1504)))))

(declare-datatypes ((Unit!7371 0))(
  ( (Unit!7372) )
))
(declare-fun lt!120873 () Unit!7371)

(declare-fun e!155725 () Unit!7371)

(assert (=> b!239848 (= lt!120873 e!155725)))

(declare-fun c!39973 () Bool)

(declare-datatypes ((tuple2!4716 0))(
  ( (tuple2!4717 (_1!2369 (_ BitVec 64)) (_2!2369 V!8061)) )
))
(declare-datatypes ((List!3600 0))(
  ( (Nil!3597) (Cons!3596 (h!4252 tuple2!4716) (t!8595 List!3600)) )
))
(declare-datatypes ((ListLongMap!3629 0))(
  ( (ListLongMap!3630 (toList!1830 List!3600)) )
))
(declare-fun contains!1718 (ListLongMap!3629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1358 (array!11903 array!11901 (_ BitVec 32) (_ BitVec 32) V!8061 V!8061 (_ BitVec 32) Int) ListLongMap!3629)

(assert (=> b!239848 (= c!39973 (contains!1718 (getCurrentListMap!1358 (_keys!6549 thiss!1504) (_values!4430 thiss!1504) (mask!10497 thiss!1504) (extraKeys!4184 thiss!1504) (zeroValue!4288 thiss!1504) (minValue!4288 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4447 thiss!1504)) key!932))))

(declare-fun b!239849 () Bool)

(declare-fun res!117563 () Bool)

(declare-datatypes ((SeekEntryResult!1038 0))(
  ( (MissingZero!1038 (index!6322 (_ BitVec 32))) (Found!1038 (index!6323 (_ BitVec 32))) (Intermediate!1038 (undefined!1850 Bool) (index!6324 (_ BitVec 32)) (x!24126 (_ BitVec 32))) (Undefined!1038) (MissingVacant!1038 (index!6325 (_ BitVec 32))) )
))
(declare-fun lt!120872 () SeekEntryResult!1038)

(assert (=> b!239849 (= res!117563 (= (select (arr!5653 (_keys!6549 thiss!1504)) (index!6325 lt!120872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155731 () Bool)

(assert (=> b!239849 (=> (not res!117563) (not e!155731))))

(declare-fun tp_is_empty!6311 () Bool)

(declare-fun e!155721 () Bool)

(declare-fun e!155729 () Bool)

(declare-fun array_inv!3739 (array!11903) Bool)

(declare-fun array_inv!3740 (array!11901) Bool)

(assert (=> b!239850 (= e!155721 (and tp!22551 tp_is_empty!6311 (array_inv!3739 (_keys!6549 thiss!1504)) (array_inv!3740 (_values!4430 thiss!1504)) e!155729))))

(declare-fun b!239851 () Bool)

(declare-fun res!117564 () Bool)

(declare-fun e!155722 () Bool)

(assert (=> b!239851 (=> (not res!117564) (not e!155722))))

(declare-fun call!22307 () Bool)

(assert (=> b!239851 (= res!117564 call!22307)))

(declare-fun e!155726 () Bool)

(assert (=> b!239851 (= e!155726 e!155722)))

(declare-fun b!239852 () Bool)

(declare-fun res!117559 () Bool)

(assert (=> b!239852 (=> (not res!117559) (not e!155727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239852 (= res!117559 (validMask!0 (mask!10497 thiss!1504)))))

(declare-fun res!117561 () Bool)

(declare-fun e!155724 () Bool)

(assert (=> start!22946 (=> (not res!117561) (not e!155724))))

(declare-fun valid!1389 (LongMapFixedSize!3524) Bool)

(assert (=> start!22946 (= res!117561 (valid!1389 thiss!1504))))

(assert (=> start!22946 e!155724))

(assert (=> start!22946 e!155721))

(assert (=> start!22946 true))

(declare-fun b!239853 () Bool)

(declare-fun res!117557 () Bool)

(assert (=> b!239853 (=> (not res!117557) (not e!155727))))

(assert (=> b!239853 (= res!117557 (and (= (size!5993 (_values!4430 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10497 thiss!1504))) (= (size!5994 (_keys!6549 thiss!1504)) (size!5993 (_values!4430 thiss!1504))) (bvsge (mask!10497 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4184 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4184 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239854 () Bool)

(declare-fun e!155733 () Bool)

(assert (=> b!239854 (= e!155733 tp_is_empty!6311)))

(declare-fun b!239855 () Bool)

(assert (=> b!239855 (= e!155731 (not call!22308))))

(declare-fun b!239856 () Bool)

(declare-fun e!155730 () Bool)

(declare-fun mapRes!10698 () Bool)

(assert (=> b!239856 (= e!155729 (and e!155730 mapRes!10698))))

(declare-fun condMapEmpty!10698 () Bool)

(declare-fun mapDefault!10698 () ValueCell!2812)

