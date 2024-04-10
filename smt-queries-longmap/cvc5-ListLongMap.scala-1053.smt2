; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22000 () Bool)

(assert start!22000)

(declare-fun b!226199 () Bool)

(declare-fun b_free!6067 () Bool)

(declare-fun b_next!6067 () Bool)

(assert (=> b!226199 (= b_free!6067 (not b_next!6067))))

(declare-fun tp!21342 () Bool)

(declare-fun b_and!12965 () Bool)

(assert (=> b!226199 (= tp!21342 b_and!12965)))

(declare-fun b!226177 () Bool)

(declare-fun c!37498 () Bool)

(declare-datatypes ((SeekEntryResult!879 0))(
  ( (MissingZero!879 (index!5686 (_ BitVec 32))) (Found!879 (index!5687 (_ BitVec 32))) (Intermediate!879 (undefined!1691 Bool) (index!5688 (_ BitVec 32)) (x!23219 (_ BitVec 32))) (Undefined!879) (MissingVacant!879 (index!5689 (_ BitVec 32))) )
))
(declare-fun lt!113871 () SeekEntryResult!879)

(assert (=> b!226177 (= c!37498 (is-MissingVacant!879 lt!113871))))

(declare-fun e!146763 () Bool)

(declare-fun e!146761 () Bool)

(assert (=> b!226177 (= e!146763 e!146761)))

(declare-fun b!226178 () Bool)

(assert (=> b!226178 (= e!146761 (is-Undefined!879 lt!113871))))

(declare-fun b!226179 () Bool)

(declare-fun res!111335 () Bool)

(declare-fun e!146765 () Bool)

(assert (=> b!226179 (=> (not res!111335) (not e!146765))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!226179 (= res!111335 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226180 () Bool)

(declare-fun res!111339 () Bool)

(declare-fun e!146770 () Bool)

(assert (=> b!226180 (=> res!111339 e!146770)))

(declare-fun lt!113869 () Bool)

(assert (=> b!226180 (= res!111339 lt!113869)))

(declare-fun b!226182 () Bool)

(declare-fun e!146766 () Bool)

(declare-fun tp_is_empty!5929 () Bool)

(assert (=> b!226182 (= e!146766 tp_is_empty!5929)))

(declare-fun b!226183 () Bool)

(declare-fun e!146762 () Bool)

(assert (=> b!226183 (= e!146761 e!146762)))

(declare-fun res!111332 () Bool)

(declare-fun call!21035 () Bool)

(assert (=> b!226183 (= res!111332 call!21035)))

(assert (=> b!226183 (=> (not res!111332) (not e!146762))))

(declare-fun b!226184 () Bool)

(declare-fun res!111333 () Bool)

(assert (=> b!226184 (=> res!111333 e!146770)))

(declare-datatypes ((V!7553 0))(
  ( (V!7554 (val!3009 Int)) )
))
(declare-datatypes ((ValueCell!2621 0))(
  ( (ValueCellFull!2621 (v!5029 V!7553)) (EmptyCell!2621) )
))
(declare-datatypes ((array!11101 0))(
  ( (array!11102 (arr!5270 (Array (_ BitVec 32) ValueCell!2621)) (size!5603 (_ BitVec 32))) )
))
(declare-datatypes ((array!11103 0))(
  ( (array!11104 (arr!5271 (Array (_ BitVec 32) (_ BitVec 64))) (size!5604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3142 0))(
  ( (LongMapFixedSize!3143 (defaultEntry!4230 Int) (mask!10080 (_ BitVec 32)) (extraKeys!3967 (_ BitVec 32)) (zeroValue!4071 V!7553) (minValue!4071 V!7553) (_size!1620 (_ BitVec 32)) (_keys!6284 array!11103) (_values!4213 array!11101) (_vacant!1620 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3142)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226184 (= res!111333 (or (not (= (size!5604 (_keys!6284 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10080 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5604 (_keys!6284 thiss!1504)))))))

(declare-fun b!226185 () Bool)

(declare-datatypes ((Unit!6833 0))(
  ( (Unit!6834) )
))
(declare-fun e!146771 () Unit!6833)

(declare-fun Unit!6835 () Unit!6833)

(assert (=> b!226185 (= e!146771 Unit!6835)))

(declare-fun lt!113870 () Unit!6833)

(declare-fun lemmaArrayContainsKeyThenInListMap!92 (array!11103 array!11101 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) (_ BitVec 32) Int) Unit!6833)

(assert (=> b!226185 (= lt!113870 (lemmaArrayContainsKeyThenInListMap!92 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226185 false))

(declare-fun b!226186 () Bool)

(declare-fun res!111334 () Bool)

(assert (=> b!226186 (=> res!111334 e!146770)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11103 (_ BitVec 32)) Bool)

(assert (=> b!226186 (= res!111334 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6284 thiss!1504) (mask!10080 thiss!1504))))))

(declare-fun b!226187 () Bool)

(declare-fun e!146768 () Bool)

(declare-fun e!146764 () Bool)

(assert (=> b!226187 (= e!146768 e!146764)))

(declare-fun res!111336 () Bool)

(assert (=> b!226187 (=> (not res!111336) (not e!146764))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226187 (= res!111336 (inRange!0 index!297 (mask!10080 thiss!1504)))))

(declare-fun lt!113879 () Unit!6833)

(declare-fun e!146774 () Unit!6833)

(assert (=> b!226187 (= lt!113879 e!146774)))

(declare-fun c!37500 () Bool)

(declare-datatypes ((tuple2!4452 0))(
  ( (tuple2!4453 (_1!2237 (_ BitVec 64)) (_2!2237 V!7553)) )
))
(declare-datatypes ((List!3368 0))(
  ( (Nil!3365) (Cons!3364 (h!4012 tuple2!4452) (t!8327 List!3368)) )
))
(declare-datatypes ((ListLongMap!3365 0))(
  ( (ListLongMap!3366 (toList!1698 List!3368)) )
))
(declare-fun contains!1572 (ListLongMap!3365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1226 (array!11103 array!11101 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 32) Int) ListLongMap!3365)

(assert (=> b!226187 (= c!37500 (contains!1572 (getCurrentListMap!1226 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4230 thiss!1504)) key!932))))

(declare-fun b!226188 () Bool)

(assert (=> b!226188 (= e!146770 true)))

(declare-fun lt!113877 () Bool)

(declare-datatypes ((List!3369 0))(
  ( (Nil!3366) (Cons!3365 (h!4013 (_ BitVec 64)) (t!8328 List!3369)) )
))
(declare-fun arrayNoDuplicates!0 (array!11103 (_ BitVec 32) List!3369) Bool)

(assert (=> b!226188 (= lt!113877 (arrayNoDuplicates!0 (_keys!6284 thiss!1504) #b00000000000000000000000000000000 Nil!3366))))

(declare-fun b!226189 () Bool)

(declare-fun res!111342 () Bool)

(assert (=> b!226189 (=> res!111342 e!146770)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226189 (= res!111342 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226190 () Bool)

(declare-fun res!111341 () Bool)

(declare-fun e!146760 () Bool)

(assert (=> b!226190 (=> (not res!111341) (not e!146760))))

(assert (=> b!226190 (= res!111341 call!21035)))

(assert (=> b!226190 (= e!146763 e!146760)))

(declare-fun b!226191 () Bool)

(declare-fun Unit!6836 () Unit!6833)

(assert (=> b!226191 (= e!146771 Unit!6836)))

(declare-fun res!111338 () Bool)

(assert (=> start!22000 (=> (not res!111338) (not e!146765))))

(declare-fun valid!1264 (LongMapFixedSize!3142) Bool)

(assert (=> start!22000 (= res!111338 (valid!1264 thiss!1504))))

(assert (=> start!22000 e!146765))

(declare-fun e!146767 () Bool)

(assert (=> start!22000 e!146767))

(assert (=> start!22000 true))

(declare-fun b!226181 () Bool)

(declare-fun call!21036 () Bool)

(assert (=> b!226181 (= e!146762 (not call!21036))))

(declare-fun b!226192 () Bool)

(declare-fun e!146769 () Bool)

(assert (=> b!226192 (= e!146769 tp_is_empty!5929)))

(declare-fun mapNonEmpty!10063 () Bool)

(declare-fun mapRes!10063 () Bool)

(declare-fun tp!21343 () Bool)

(assert (=> mapNonEmpty!10063 (= mapRes!10063 (and tp!21343 e!146766))))

(declare-fun mapRest!10063 () (Array (_ BitVec 32) ValueCell!2621))

(declare-fun mapKey!10063 () (_ BitVec 32))

(declare-fun mapValue!10063 () ValueCell!2621)

(assert (=> mapNonEmpty!10063 (= (arr!5270 (_values!4213 thiss!1504)) (store mapRest!10063 mapKey!10063 mapValue!10063))))

(declare-fun mapIsEmpty!10063 () Bool)

(assert (=> mapIsEmpty!10063 mapRes!10063))

(declare-fun b!226193 () Bool)

(declare-fun Unit!6837 () Unit!6833)

(assert (=> b!226193 (= e!146774 Unit!6837)))

(declare-fun lt!113874 () Unit!6833)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!254 (array!11103 array!11101 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) Int) Unit!6833)

(assert (=> b!226193 (= lt!113874 (lemmaInListMapThenSeekEntryOrOpenFindsIt!254 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226193 false))

(declare-fun b!226194 () Bool)

(declare-fun lt!113876 () Unit!6833)

(assert (=> b!226194 (= e!146774 lt!113876)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!266 (array!11103 array!11101 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) Int) Unit!6833)

(assert (=> b!226194 (= lt!113876 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!266 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 (defaultEntry!4230 thiss!1504)))))

(declare-fun c!37499 () Bool)

(assert (=> b!226194 (= c!37499 (is-MissingZero!879 lt!113871))))

(assert (=> b!226194 e!146763))

(declare-fun b!226195 () Bool)

(declare-fun res!111337 () Bool)

(assert (=> b!226195 (=> (not res!111337) (not e!146760))))

(assert (=> b!226195 (= res!111337 (= (select (arr!5271 (_keys!6284 thiss!1504)) (index!5686 lt!113871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226196 () Bool)

(assert (=> b!226196 (= e!146765 e!146768)))

(declare-fun res!111340 () Bool)

(assert (=> b!226196 (=> (not res!111340) (not e!146768))))

(assert (=> b!226196 (= res!111340 (or (= lt!113871 (MissingZero!879 index!297)) (= lt!113871 (MissingVacant!879 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11103 (_ BitVec 32)) SeekEntryResult!879)

(assert (=> b!226196 (= lt!113871 (seekEntryOrOpen!0 key!932 (_keys!6284 thiss!1504) (mask!10080 thiss!1504)))))

(declare-fun b!226197 () Bool)

(declare-fun res!111331 () Bool)

(assert (=> b!226197 (= res!111331 (= (select (arr!5271 (_keys!6284 thiss!1504)) (index!5689 lt!113871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226197 (=> (not res!111331) (not e!146762))))

(declare-fun bm!21032 () Bool)

(assert (=> bm!21032 (= call!21035 (inRange!0 (ite c!37499 (index!5686 lt!113871) (index!5689 lt!113871)) (mask!10080 thiss!1504)))))

(declare-fun b!226198 () Bool)

(assert (=> b!226198 (= e!146760 (not call!21036))))

(declare-fun e!146772 () Bool)

(declare-fun array_inv!3485 (array!11103) Bool)

(declare-fun array_inv!3486 (array!11101) Bool)

(assert (=> b!226199 (= e!146767 (and tp!21342 tp_is_empty!5929 (array_inv!3485 (_keys!6284 thiss!1504)) (array_inv!3486 (_values!4213 thiss!1504)) e!146772))))

(declare-fun b!226200 () Bool)

(assert (=> b!226200 (= e!146772 (and e!146769 mapRes!10063))))

(declare-fun condMapEmpty!10063 () Bool)

(declare-fun mapDefault!10063 () ValueCell!2621)

