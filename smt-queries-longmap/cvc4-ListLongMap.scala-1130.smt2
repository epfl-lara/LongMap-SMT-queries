; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23222 () Bool)

(assert start!23222)

(declare-fun b!243966 () Bool)

(declare-fun b_free!6533 () Bool)

(declare-fun b_next!6533 () Bool)

(assert (=> b!243966 (= b_free!6533 (not b_next!6533))))

(declare-fun tp!22821 () Bool)

(declare-fun b_and!13515 () Bool)

(assert (=> b!243966 (= tp!22821 b_and!13515)))

(declare-fun b!243939 () Bool)

(declare-fun res!119613 () Bool)

(declare-fun e!158302 () Bool)

(assert (=> b!243939 (=> (not res!119613) (not e!158302))))

(declare-fun call!22743 () Bool)

(assert (=> b!243939 (= res!119613 call!22743)))

(declare-fun e!158300 () Bool)

(assert (=> b!243939 (= e!158300 e!158302)))

(declare-fun bm!22739 () Bool)

(declare-fun call!22742 () Bool)

(declare-datatypes ((V!8173 0))(
  ( (V!8174 (val!3242 Int)) )
))
(declare-datatypes ((ValueCell!2854 0))(
  ( (ValueCellFull!2854 (v!5289 V!8173)) (EmptyCell!2854) )
))
(declare-datatypes ((array!12081 0))(
  ( (array!12082 (arr!5736 (Array (_ BitVec 32) ValueCell!2854)) (size!6078 (_ BitVec 32))) )
))
(declare-datatypes ((array!12083 0))(
  ( (array!12084 (arr!5737 (Array (_ BitVec 32) (_ BitVec 64))) (size!6079 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3608 0))(
  ( (LongMapFixedSize!3609 (defaultEntry!4517 Int) (mask!10612 (_ BitVec 32)) (extraKeys!4254 (_ BitVec 32)) (zeroValue!4358 V!8173) (minValue!4358 V!8173) (_size!1853 (_ BitVec 32)) (_keys!6628 array!12083) (_values!4500 array!12081) (_vacant!1853 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3608)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22739 (= call!22742 (arrayContainsKey!0 (_keys!6628 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243940 () Bool)

(assert (=> b!243940 (= e!158302 (not call!22742))))

(declare-fun mapIsEmpty!10843 () Bool)

(declare-fun mapRes!10843 () Bool)

(assert (=> mapIsEmpty!10843 mapRes!10843))

(declare-fun res!119619 () Bool)

(declare-fun e!158301 () Bool)

(assert (=> start!23222 (=> (not res!119619) (not e!158301))))

(declare-fun valid!1413 (LongMapFixedSize!3608) Bool)

(assert (=> start!23222 (= res!119619 (valid!1413 thiss!1504))))

(assert (=> start!23222 e!158301))

(declare-fun e!158304 () Bool)

(assert (=> start!23222 e!158304))

(assert (=> start!23222 true))

(declare-fun b!243941 () Bool)

(declare-fun res!119611 () Bool)

(declare-fun e!158298 () Bool)

(assert (=> b!243941 (=> (not res!119611) (not e!158298))))

(declare-datatypes ((List!3652 0))(
  ( (Nil!3649) (Cons!3648 (h!4305 (_ BitVec 64)) (t!8659 List!3652)) )
))
(declare-fun arrayNoDuplicates!0 (array!12083 (_ BitVec 32) List!3652) Bool)

(assert (=> b!243941 (= res!119611 (arrayNoDuplicates!0 (_keys!6628 thiss!1504) #b00000000000000000000000000000000 Nil!3649))))

(declare-fun b!243942 () Bool)

(declare-fun res!119610 () Bool)

(assert (=> b!243942 (=> (not res!119610) (not e!158298))))

(declare-fun contains!1758 (List!3652 (_ BitVec 64)) Bool)

(assert (=> b!243942 (= res!119610 (not (contains!1758 Nil!3649 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243943 () Bool)

(declare-fun res!119620 () Bool)

(assert (=> b!243943 (=> (not res!119620) (not e!158302))))

(declare-datatypes ((SeekEntryResult!1077 0))(
  ( (MissingZero!1077 (index!6478 (_ BitVec 32))) (Found!1077 (index!6479 (_ BitVec 32))) (Intermediate!1077 (undefined!1889 Bool) (index!6480 (_ BitVec 32)) (x!24345 (_ BitVec 32))) (Undefined!1077) (MissingVacant!1077 (index!6481 (_ BitVec 32))) )
))
(declare-fun lt!122312 () SeekEntryResult!1077)

(assert (=> b!243943 (= res!119620 (= (select (arr!5737 (_keys!6628 thiss!1504)) (index!6478 lt!122312)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243944 () Bool)

(declare-datatypes ((Unit!7529 0))(
  ( (Unit!7530) )
))
(declare-fun e!158314 () Unit!7529)

(declare-fun Unit!7531 () Unit!7529)

(assert (=> b!243944 (= e!158314 Unit!7531)))

(declare-fun b!243945 () Bool)

(declare-fun e!158299 () Bool)

(assert (=> b!243945 (= e!158299 (contains!1758 Nil!3649 key!932))))

(declare-fun mapNonEmpty!10843 () Bool)

(declare-fun tp!22822 () Bool)

(declare-fun e!158303 () Bool)

(assert (=> mapNonEmpty!10843 (= mapRes!10843 (and tp!22822 e!158303))))

(declare-fun mapRest!10843 () (Array (_ BitVec 32) ValueCell!2854))

(declare-fun mapValue!10843 () ValueCell!2854)

(declare-fun mapKey!10843 () (_ BitVec 32))

(assert (=> mapNonEmpty!10843 (= (arr!5736 (_values!4500 thiss!1504)) (store mapRest!10843 mapKey!10843 mapValue!10843))))

(declare-fun b!243946 () Bool)

(declare-fun e!158307 () Bool)

(assert (=> b!243946 (= e!158307 (not (contains!1758 Nil!3649 key!932)))))

(declare-fun b!243947 () Bool)

(declare-fun e!158305 () Unit!7529)

(declare-fun Unit!7532 () Unit!7529)

(assert (=> b!243947 (= e!158305 Unit!7532)))

(declare-fun lt!122315 () Unit!7529)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!364 (array!12083 array!12081 (_ BitVec 32) (_ BitVec 32) V!8173 V!8173 (_ BitVec 64) Int) Unit!7529)

(assert (=> b!243947 (= lt!122315 (lemmaInListMapThenSeekEntryOrOpenFindsIt!364 (_keys!6628 thiss!1504) (_values!4500 thiss!1504) (mask!10612 thiss!1504) (extraKeys!4254 thiss!1504) (zeroValue!4358 thiss!1504) (minValue!4358 thiss!1504) key!932 (defaultEntry!4517 thiss!1504)))))

(assert (=> b!243947 false))

(declare-fun b!243948 () Bool)

(declare-fun e!158309 () Bool)

(declare-fun e!158310 () Bool)

(assert (=> b!243948 (= e!158309 e!158310)))

(declare-fun res!119609 () Bool)

(assert (=> b!243948 (=> (not res!119609) (not e!158310))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243948 (= res!119609 (inRange!0 index!297 (mask!10612 thiss!1504)))))

(declare-fun lt!122317 () Unit!7529)

(assert (=> b!243948 (= lt!122317 e!158305)))

(declare-fun c!40711 () Bool)

(declare-datatypes ((tuple2!4770 0))(
  ( (tuple2!4771 (_1!2396 (_ BitVec 64)) (_2!2396 V!8173)) )
))
(declare-datatypes ((List!3653 0))(
  ( (Nil!3650) (Cons!3649 (h!4306 tuple2!4770) (t!8660 List!3653)) )
))
(declare-datatypes ((ListLongMap!3683 0))(
  ( (ListLongMap!3684 (toList!1857 List!3653)) )
))
(declare-fun contains!1759 (ListLongMap!3683 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1385 (array!12083 array!12081 (_ BitVec 32) (_ BitVec 32) V!8173 V!8173 (_ BitVec 32) Int) ListLongMap!3683)

(assert (=> b!243948 (= c!40711 (contains!1759 (getCurrentListMap!1385 (_keys!6628 thiss!1504) (_values!4500 thiss!1504) (mask!10612 thiss!1504) (extraKeys!4254 thiss!1504) (zeroValue!4358 thiss!1504) (minValue!4358 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4517 thiss!1504)) key!932))))

(declare-fun b!243949 () Bool)

(declare-fun e!158313 () Bool)

(declare-fun tp_is_empty!6395 () Bool)

(assert (=> b!243949 (= e!158313 tp_is_empty!6395)))

(declare-fun b!243950 () Bool)

(declare-fun e!158315 () Bool)

(assert (=> b!243950 (= e!158315 (and e!158313 mapRes!10843))))

(declare-fun condMapEmpty!10843 () Bool)

(declare-fun mapDefault!10843 () ValueCell!2854)

