; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22082 () Bool)

(assert start!22082)

(declare-fun b!229063 () Bool)

(declare-fun b_free!6149 () Bool)

(declare-fun b_next!6149 () Bool)

(assert (=> b!229063 (= b_free!6149 (not b_next!6149))))

(declare-fun tp!21588 () Bool)

(declare-fun b_and!13047 () Bool)

(assert (=> b!229063 (= tp!21588 b_and!13047)))

(declare-fun mapNonEmpty!10186 () Bool)

(declare-fun mapRes!10186 () Bool)

(declare-fun tp!21589 () Bool)

(declare-fun e!148611 () Bool)

(assert (=> mapNonEmpty!10186 (= mapRes!10186 (and tp!21589 e!148611))))

(declare-datatypes ((V!7661 0))(
  ( (V!7662 (val!3050 Int)) )
))
(declare-datatypes ((ValueCell!2662 0))(
  ( (ValueCellFull!2662 (v!5070 V!7661)) (EmptyCell!2662) )
))
(declare-fun mapRest!10186 () (Array (_ BitVec 32) ValueCell!2662))

(declare-fun mapValue!10186 () ValueCell!2662)

(declare-fun mapKey!10186 () (_ BitVec 32))

(declare-datatypes ((array!11265 0))(
  ( (array!11266 (arr!5352 (Array (_ BitVec 32) ValueCell!2662)) (size!5685 (_ BitVec 32))) )
))
(declare-datatypes ((array!11267 0))(
  ( (array!11268 (arr!5353 (Array (_ BitVec 32) (_ BitVec 64))) (size!5686 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3224 0))(
  ( (LongMapFixedSize!3225 (defaultEntry!4271 Int) (mask!10147 (_ BitVec 32)) (extraKeys!4008 (_ BitVec 32)) (zeroValue!4112 V!7661) (minValue!4112 V!7661) (_size!1661 (_ BitVec 32)) (_keys!6325 array!11267) (_values!4254 array!11265) (_vacant!1661 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3224)

(assert (=> mapNonEmpty!10186 (= (arr!5352 (_values!4254 thiss!1504)) (store mapRest!10186 mapKey!10186 mapValue!10186))))

(declare-fun b!229056 () Bool)

(declare-fun e!148614 () Bool)

(declare-fun tp_is_empty!6011 () Bool)

(assert (=> b!229056 (= e!148614 tp_is_empty!6011)))

(declare-fun res!112739 () Bool)

(declare-fun e!148616 () Bool)

(assert (=> start!22082 (=> (not res!112739) (not e!148616))))

(declare-fun valid!1286 (LongMapFixedSize!3224) Bool)

(assert (=> start!22082 (= res!112739 (valid!1286 thiss!1504))))

(assert (=> start!22082 e!148616))

(declare-fun e!148618 () Bool)

(assert (=> start!22082 e!148618))

(assert (=> start!22082 true))

(declare-fun b!229057 () Bool)

(declare-fun e!148606 () Bool)

(declare-fun call!21281 () Bool)

(assert (=> b!229057 (= e!148606 (not call!21281))))

(declare-fun bm!21278 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21278 (= call!21281 (arrayContainsKey!0 (_keys!6325 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229058 () Bool)

(declare-fun e!148617 () Bool)

(declare-datatypes ((SeekEntryResult!916 0))(
  ( (MissingZero!916 (index!5834 (_ BitVec 32))) (Found!916 (index!5835 (_ BitVec 32))) (Intermediate!916 (undefined!1728 Bool) (index!5836 (_ BitVec 32)) (x!23360 (_ BitVec 32))) (Undefined!916) (MissingVacant!916 (index!5837 (_ BitVec 32))) )
))
(declare-fun lt!115222 () SeekEntryResult!916)

(assert (=> b!229058 (= e!148617 (is-Undefined!916 lt!115222))))

(declare-fun b!229059 () Bool)

(declare-fun e!148615 () Bool)

(assert (=> b!229059 (= e!148616 e!148615)))

(declare-fun res!112741 () Bool)

(assert (=> b!229059 (=> (not res!112741) (not e!148615))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229059 (= res!112741 (or (= lt!115222 (MissingZero!916 index!297)) (= lt!115222 (MissingVacant!916 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11267 (_ BitVec 32)) SeekEntryResult!916)

(assert (=> b!229059 (= lt!115222 (seekEntryOrOpen!0 key!932 (_keys!6325 thiss!1504) (mask!10147 thiss!1504)))))

(declare-fun b!229060 () Bool)

(declare-datatypes ((Unit!6978 0))(
  ( (Unit!6979) )
))
(declare-fun e!148609 () Unit!6978)

(declare-fun lt!115223 () Unit!6978)

(assert (=> b!229060 (= e!148609 lt!115223)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!294 (array!11267 array!11265 (_ BitVec 32) (_ BitVec 32) V!7661 V!7661 (_ BitVec 64) Int) Unit!6978)

(assert (=> b!229060 (= lt!115223 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!294 (_keys!6325 thiss!1504) (_values!4254 thiss!1504) (mask!10147 thiss!1504) (extraKeys!4008 thiss!1504) (zeroValue!4112 thiss!1504) (minValue!4112 thiss!1504) key!932 (defaultEntry!4271 thiss!1504)))))

(declare-fun c!37992 () Bool)

(assert (=> b!229060 (= c!37992 (is-MissingZero!916 lt!115222))))

(declare-fun e!148605 () Bool)

(assert (=> b!229060 e!148605))

(declare-fun b!229061 () Bool)

(declare-fun e!148613 () Bool)

(assert (=> b!229061 (= e!148613 (not call!21281))))

(declare-fun b!229062 () Bool)

(declare-fun res!112736 () Bool)

(assert (=> b!229062 (= res!112736 (= (select (arr!5353 (_keys!6325 thiss!1504)) (index!5837 lt!115222)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229062 (=> (not res!112736) (not e!148606))))

(declare-fun e!148610 () Bool)

(declare-fun array_inv!3535 (array!11267) Bool)

(declare-fun array_inv!3536 (array!11265) Bool)

(assert (=> b!229063 (= e!148618 (and tp!21588 tp_is_empty!6011 (array_inv!3535 (_keys!6325 thiss!1504)) (array_inv!3536 (_values!4254 thiss!1504)) e!148610))))

(declare-fun mapIsEmpty!10186 () Bool)

(assert (=> mapIsEmpty!10186 mapRes!10186))

(declare-fun b!229064 () Bool)

(declare-fun res!112738 () Bool)

(declare-fun e!148608 () Bool)

(assert (=> b!229064 (=> res!112738 e!148608)))

(assert (=> b!229064 (= res!112738 (or (not (= (size!5685 (_values!4254 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10147 thiss!1504)))) (not (= (size!5686 (_keys!6325 thiss!1504)) (size!5685 (_values!4254 thiss!1504)))) (bvslt (mask!10147 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4008 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4008 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun call!21282 () Bool)

(declare-fun bm!21279 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21279 (= call!21282 (inRange!0 (ite c!37992 (index!5834 lt!115222) (index!5837 lt!115222)) (mask!10147 thiss!1504)))))

(declare-fun b!229065 () Bool)

(declare-fun res!112744 () Bool)

(assert (=> b!229065 (=> res!112744 e!148608)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11267 (_ BitVec 32)) Bool)

(assert (=> b!229065 (= res!112744 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6325 thiss!1504) (mask!10147 thiss!1504))))))

(declare-fun b!229066 () Bool)

(declare-fun Unit!6980 () Unit!6978)

(assert (=> b!229066 (= e!148609 Unit!6980)))

(declare-fun lt!115230 () Unit!6978)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!278 (array!11267 array!11265 (_ BitVec 32) (_ BitVec 32) V!7661 V!7661 (_ BitVec 64) Int) Unit!6978)

(assert (=> b!229066 (= lt!115230 (lemmaInListMapThenSeekEntryOrOpenFindsIt!278 (_keys!6325 thiss!1504) (_values!4254 thiss!1504) (mask!10147 thiss!1504) (extraKeys!4008 thiss!1504) (zeroValue!4112 thiss!1504) (minValue!4112 thiss!1504) key!932 (defaultEntry!4271 thiss!1504)))))

(assert (=> b!229066 false))

(declare-fun b!229067 () Bool)

(declare-fun c!37991 () Bool)

(assert (=> b!229067 (= c!37991 (is-MissingVacant!916 lt!115222))))

(assert (=> b!229067 (= e!148605 e!148617)))

(declare-fun b!229068 () Bool)

(declare-fun res!112740 () Bool)

(assert (=> b!229068 (=> (not res!112740) (not e!148613))))

(assert (=> b!229068 (= res!112740 (= (select (arr!5353 (_keys!6325 thiss!1504)) (index!5834 lt!115222)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229069 () Bool)

(declare-fun res!112742 () Bool)

(assert (=> b!229069 (=> (not res!112742) (not e!148613))))

(assert (=> b!229069 (= res!112742 call!21282)))

(assert (=> b!229069 (= e!148605 e!148613)))

(declare-fun b!229070 () Bool)

(declare-fun res!112735 () Bool)

(assert (=> b!229070 (=> (not res!112735) (not e!148616))))

(assert (=> b!229070 (= res!112735 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229071 () Bool)

(declare-fun e!148607 () Bool)

(assert (=> b!229071 (= e!148615 e!148607)))

(declare-fun res!112743 () Bool)

(assert (=> b!229071 (=> (not res!112743) (not e!148607))))

(assert (=> b!229071 (= res!112743 (inRange!0 index!297 (mask!10147 thiss!1504)))))

(declare-fun lt!115228 () Unit!6978)

(assert (=> b!229071 (= lt!115228 e!148609)))

(declare-fun c!37989 () Bool)

(declare-datatypes ((tuple2!4500 0))(
  ( (tuple2!4501 (_1!2261 (_ BitVec 64)) (_2!2261 V!7661)) )
))
(declare-datatypes ((List!3423 0))(
  ( (Nil!3420) (Cons!3419 (h!4067 tuple2!4500) (t!8382 List!3423)) )
))
(declare-datatypes ((ListLongMap!3413 0))(
  ( (ListLongMap!3414 (toList!1722 List!3423)) )
))
(declare-fun contains!1596 (ListLongMap!3413 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1250 (array!11267 array!11265 (_ BitVec 32) (_ BitVec 32) V!7661 V!7661 (_ BitVec 32) Int) ListLongMap!3413)

(assert (=> b!229071 (= c!37989 (contains!1596 (getCurrentListMap!1250 (_keys!6325 thiss!1504) (_values!4254 thiss!1504) (mask!10147 thiss!1504) (extraKeys!4008 thiss!1504) (zeroValue!4112 thiss!1504) (minValue!4112 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4271 thiss!1504)) key!932))))

(declare-fun b!229072 () Bool)

(declare-fun e!148612 () Unit!6978)

(declare-fun Unit!6981 () Unit!6978)

(assert (=> b!229072 (= e!148612 Unit!6981)))

(declare-fun b!229073 () Bool)

(assert (=> b!229073 (= e!148607 (not e!148608))))

(declare-fun res!112737 () Bool)

(assert (=> b!229073 (=> res!112737 e!148608)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229073 (= res!112737 (not (validMask!0 (mask!10147 thiss!1504))))))

(declare-fun lt!115224 () array!11267)

(assert (=> b!229073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115224 (mask!10147 thiss!1504))))

(declare-fun lt!115227 () Unit!6978)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11267 (_ BitVec 32) (_ BitVec 32)) Unit!6978)

(assert (=> b!229073 (= lt!115227 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6325 thiss!1504) index!297 (mask!10147 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11267 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229073 (= (arrayCountValidKeys!0 lt!115224 #b00000000000000000000000000000000 (size!5686 (_keys!6325 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6325 thiss!1504) #b00000000000000000000000000000000 (size!5686 (_keys!6325 thiss!1504)))))))

(declare-fun lt!115229 () Unit!6978)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11267 (_ BitVec 32) (_ BitVec 64)) Unit!6978)

(assert (=> b!229073 (= lt!115229 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6325 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3424 0))(
  ( (Nil!3421) (Cons!3420 (h!4068 (_ BitVec 64)) (t!8383 List!3424)) )
))
(declare-fun arrayNoDuplicates!0 (array!11267 (_ BitVec 32) List!3424) Bool)

(assert (=> b!229073 (arrayNoDuplicates!0 lt!115224 #b00000000000000000000000000000000 Nil!3421)))

(assert (=> b!229073 (= lt!115224 (array!11268 (store (arr!5353 (_keys!6325 thiss!1504)) index!297 key!932) (size!5686 (_keys!6325 thiss!1504))))))

(declare-fun lt!115231 () Unit!6978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11267 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3424) Unit!6978)

(assert (=> b!229073 (= lt!115231 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6325 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3421))))

(declare-fun lt!115225 () Unit!6978)

(assert (=> b!229073 (= lt!115225 e!148612)))

(declare-fun c!37990 () Bool)

(assert (=> b!229073 (= c!37990 (arrayContainsKey!0 (_keys!6325 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229074 () Bool)

(assert (=> b!229074 (= e!148611 tp_is_empty!6011)))

(declare-fun b!229075 () Bool)

(assert (=> b!229075 (= e!148608 true)))

(declare-fun lt!115232 () Bool)

(assert (=> b!229075 (= lt!115232 (arrayNoDuplicates!0 (_keys!6325 thiss!1504) #b00000000000000000000000000000000 Nil!3421))))

(declare-fun b!229076 () Bool)

(assert (=> b!229076 (= e!148610 (and e!148614 mapRes!10186))))

(declare-fun condMapEmpty!10186 () Bool)

(declare-fun mapDefault!10186 () ValueCell!2662)

