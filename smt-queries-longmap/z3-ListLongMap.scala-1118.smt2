; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22958 () Bool)

(assert start!22958)

(declare-fun b!240177 () Bool)

(declare-fun b_free!6457 () Bool)

(declare-fun b_next!6457 () Bool)

(assert (=> b!240177 (= b_free!6457 (not b_next!6457))))

(declare-fun tp!22574 () Bool)

(declare-fun b_and!13437 () Bool)

(assert (=> b!240177 (= tp!22574 b_and!13437)))

(declare-fun b!240160 () Bool)

(declare-fun res!117722 () Bool)

(declare-fun e!155912 () Bool)

(assert (=> b!240160 (=> (not res!117722) (not e!155912))))

(declare-datatypes ((V!8073 0))(
  ( (V!8074 (val!3204 Int)) )
))
(declare-datatypes ((ValueCell!2816 0))(
  ( (ValueCellFull!2816 (v!5243 V!8073)) (EmptyCell!2816) )
))
(declare-datatypes ((array!11915 0))(
  ( (array!11916 (arr!5659 (Array (_ BitVec 32) ValueCell!2816)) (size!6000 (_ BitVec 32))) )
))
(declare-datatypes ((array!11917 0))(
  ( (array!11918 (arr!5660 (Array (_ BitVec 32) (_ BitVec 64))) (size!6001 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3532 0))(
  ( (LongMapFixedSize!3533 (defaultEntry!4451 Int) (mask!10505 (_ BitVec 32)) (extraKeys!4188 (_ BitVec 32)) (zeroValue!4292 V!8073) (minValue!4292 V!8073) (_size!1815 (_ BitVec 32)) (_keys!6553 array!11917) (_values!4434 array!11915) (_vacant!1815 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3532)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240160 (= res!117722 (arrayContainsKey!0 (_keys!6553 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240161 () Bool)

(declare-fun e!155906 () Bool)

(declare-datatypes ((SeekEntryResult!1009 0))(
  ( (MissingZero!1009 (index!6206 (_ BitVec 32))) (Found!1009 (index!6207 (_ BitVec 32))) (Intermediate!1009 (undefined!1821 Bool) (index!6208 (_ BitVec 32)) (x!24113 (_ BitVec 32))) (Undefined!1009) (MissingVacant!1009 (index!6209 (_ BitVec 32))) )
))
(declare-fun lt!120977 () SeekEntryResult!1009)

(get-info :version)

(assert (=> b!240161 (= e!155906 ((_ is Undefined!1009) lt!120977))))

(declare-fun b!240162 () Bool)

(declare-fun res!117732 () Bool)

(declare-fun e!155910 () Bool)

(assert (=> b!240162 (=> (not res!117732) (not e!155910))))

(declare-fun call!22320 () Bool)

(assert (=> b!240162 (= res!117732 call!22320)))

(declare-fun e!155903 () Bool)

(assert (=> b!240162 (= e!155903 e!155910)))

(declare-fun b!240163 () Bool)

(declare-fun e!155913 () Bool)

(declare-fun e!155902 () Bool)

(declare-fun mapRes!10710 () Bool)

(assert (=> b!240163 (= e!155913 (and e!155902 mapRes!10710))))

(declare-fun condMapEmpty!10710 () Bool)

(declare-fun mapDefault!10710 () ValueCell!2816)

(assert (=> b!240163 (= condMapEmpty!10710 (= (arr!5659 (_values!4434 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2816)) mapDefault!10710)))))

(declare-fun b!240164 () Bool)

(declare-fun e!155904 () Bool)

(declare-fun tp_is_empty!6319 () Bool)

(assert (=> b!240164 (= e!155904 tp_is_empty!6319)))

(declare-fun b!240165 () Bool)

(declare-fun res!117723 () Bool)

(assert (=> b!240165 (=> (not res!117723) (not e!155912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240165 (= res!117723 (validMask!0 (mask!10505 thiss!1504)))))

(declare-fun b!240166 () Bool)

(declare-fun c!40021 () Bool)

(assert (=> b!240166 (= c!40021 ((_ is MissingVacant!1009) lt!120977))))

(assert (=> b!240166 (= e!155903 e!155906)))

(declare-fun b!240167 () Bool)

(declare-datatypes ((Unit!7359 0))(
  ( (Unit!7360) )
))
(declare-fun e!155911 () Unit!7359)

(declare-fun lt!120980 () Unit!7359)

(assert (=> b!240167 (= e!155911 lt!120980)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!331 (array!11917 array!11915 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 64) Int) Unit!7359)

(assert (=> b!240167 (= lt!120980 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!331 (_keys!6553 thiss!1504) (_values!4434 thiss!1504) (mask!10505 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) key!932 (defaultEntry!4451 thiss!1504)))))

(declare-fun c!40022 () Bool)

(assert (=> b!240167 (= c!40022 ((_ is MissingZero!1009) lt!120977))))

(assert (=> b!240167 e!155903))

(declare-fun res!117729 () Bool)

(declare-fun e!155901 () Bool)

(assert (=> start!22958 (=> (not res!117729) (not e!155901))))

(declare-fun valid!1401 (LongMapFixedSize!3532) Bool)

(assert (=> start!22958 (= res!117729 (valid!1401 thiss!1504))))

(assert (=> start!22958 e!155901))

(declare-fun e!155905 () Bool)

(assert (=> start!22958 e!155905))

(assert (=> start!22958 true))

(declare-fun bm!22316 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22316 (= call!22320 (inRange!0 (ite c!40022 (index!6206 lt!120977) (index!6209 lt!120977)) (mask!10505 thiss!1504)))))

(declare-fun b!240168 () Bool)

(declare-fun call!22319 () Bool)

(assert (=> b!240168 (= e!155910 (not call!22319))))

(declare-fun b!240169 () Bool)

(declare-fun e!155907 () Bool)

(assert (=> b!240169 (= e!155901 e!155907)))

(declare-fun res!117728 () Bool)

(assert (=> b!240169 (=> (not res!117728) (not e!155907))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240169 (= res!117728 (or (= lt!120977 (MissingZero!1009 index!297)) (= lt!120977 (MissingVacant!1009 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11917 (_ BitVec 32)) SeekEntryResult!1009)

(assert (=> b!240169 (= lt!120977 (seekEntryOrOpen!0 key!932 (_keys!6553 thiss!1504) (mask!10505 thiss!1504)))))

(declare-fun mapIsEmpty!10710 () Bool)

(assert (=> mapIsEmpty!10710 mapRes!10710))

(declare-fun b!240170 () Bool)

(declare-fun e!155908 () Bool)

(assert (=> b!240170 (= e!155906 e!155908)))

(declare-fun res!117726 () Bool)

(assert (=> b!240170 (= res!117726 call!22320)))

(assert (=> b!240170 (=> (not res!117726) (not e!155908))))

(declare-fun b!240171 () Bool)

(declare-fun Unit!7361 () Unit!7359)

(assert (=> b!240171 (= e!155911 Unit!7361)))

(declare-fun lt!120979 () Unit!7359)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!337 (array!11917 array!11915 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 64) Int) Unit!7359)

(assert (=> b!240171 (= lt!120979 (lemmaInListMapThenSeekEntryOrOpenFindsIt!337 (_keys!6553 thiss!1504) (_values!4434 thiss!1504) (mask!10505 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) key!932 (defaultEntry!4451 thiss!1504)))))

(assert (=> b!240171 false))

(declare-fun b!240172 () Bool)

(declare-fun res!117730 () Bool)

(assert (=> b!240172 (=> (not res!117730) (not e!155912))))

(declare-datatypes ((List!3522 0))(
  ( (Nil!3519) (Cons!3518 (h!4174 (_ BitVec 64)) (t!8509 List!3522)) )
))
(declare-fun arrayNoDuplicates!0 (array!11917 (_ BitVec 32) List!3522) Bool)

(assert (=> b!240172 (= res!117730 (arrayNoDuplicates!0 (_keys!6553 thiss!1504) #b00000000000000000000000000000000 Nil!3519))))

(declare-fun b!240173 () Bool)

(assert (=> b!240173 (= e!155908 (not call!22319))))

(declare-fun bm!22317 () Bool)

(assert (=> bm!22317 (= call!22319 (arrayContainsKey!0 (_keys!6553 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240174 () Bool)

(declare-fun res!117734 () Bool)

(assert (=> b!240174 (=> (not res!117734) (not e!155912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11917 (_ BitVec 32)) Bool)

(assert (=> b!240174 (= res!117734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6553 thiss!1504) (mask!10505 thiss!1504)))))

(declare-fun b!240175 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240175 (= e!155912 (not (validKeyInArray!0 key!932)))))

(declare-fun b!240176 () Bool)

(declare-fun res!117724 () Bool)

(assert (=> b!240176 (=> (not res!117724) (not e!155901))))

(assert (=> b!240176 (= res!117724 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!3717 (array!11917) Bool)

(declare-fun array_inv!3718 (array!11915) Bool)

(assert (=> b!240177 (= e!155905 (and tp!22574 tp_is_empty!6319 (array_inv!3717 (_keys!6553 thiss!1504)) (array_inv!3718 (_values!4434 thiss!1504)) e!155913))))

(declare-fun b!240178 () Bool)

(declare-fun res!117727 () Bool)

(assert (=> b!240178 (=> (not res!117727) (not e!155910))))

(assert (=> b!240178 (= res!117727 (= (select (arr!5660 (_keys!6553 thiss!1504)) (index!6206 lt!120977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240179 () Bool)

(assert (=> b!240179 (= e!155902 tp_is_empty!6319)))

(declare-fun b!240180 () Bool)

(declare-fun res!117731 () Bool)

(assert (=> b!240180 (=> (not res!117731) (not e!155912))))

(assert (=> b!240180 (= res!117731 (and (= (size!6000 (_values!4434 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10505 thiss!1504))) (= (size!6001 (_keys!6553 thiss!1504)) (size!6000 (_values!4434 thiss!1504))) (bvsge (mask!10505 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4188 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4188 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!10710 () Bool)

(declare-fun tp!22575 () Bool)

(assert (=> mapNonEmpty!10710 (= mapRes!10710 (and tp!22575 e!155904))))

(declare-fun mapRest!10710 () (Array (_ BitVec 32) ValueCell!2816))

(declare-fun mapKey!10710 () (_ BitVec 32))

(declare-fun mapValue!10710 () ValueCell!2816)

(assert (=> mapNonEmpty!10710 (= (arr!5659 (_values!4434 thiss!1504)) (store mapRest!10710 mapKey!10710 mapValue!10710))))

(declare-fun b!240181 () Bool)

(assert (=> b!240181 (= e!155907 e!155912)))

(declare-fun res!117733 () Bool)

(assert (=> b!240181 (=> (not res!117733) (not e!155912))))

(assert (=> b!240181 (= res!117733 (inRange!0 index!297 (mask!10505 thiss!1504)))))

(declare-fun lt!120978 () Unit!7359)

(assert (=> b!240181 (= lt!120978 e!155911)))

(declare-fun c!40023 () Bool)

(declare-datatypes ((tuple2!4646 0))(
  ( (tuple2!4647 (_1!2334 (_ BitVec 64)) (_2!2334 V!8073)) )
))
(declare-datatypes ((List!3523 0))(
  ( (Nil!3520) (Cons!3519 (h!4175 tuple2!4646) (t!8510 List!3523)) )
))
(declare-datatypes ((ListLongMap!3561 0))(
  ( (ListLongMap!3562 (toList!1796 List!3523)) )
))
(declare-fun contains!1698 (ListLongMap!3561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1328 (array!11917 array!11915 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 32) Int) ListLongMap!3561)

(assert (=> b!240181 (= c!40023 (contains!1698 (getCurrentListMap!1328 (_keys!6553 thiss!1504) (_values!4434 thiss!1504) (mask!10505 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4451 thiss!1504)) key!932))))

(declare-fun b!240182 () Bool)

(declare-fun res!117725 () Bool)

(assert (=> b!240182 (= res!117725 (= (select (arr!5660 (_keys!6553 thiss!1504)) (index!6209 lt!120977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240182 (=> (not res!117725) (not e!155908))))

(assert (= (and start!22958 res!117729) b!240176))

(assert (= (and b!240176 res!117724) b!240169))

(assert (= (and b!240169 res!117728) b!240181))

(assert (= (and b!240181 c!40023) b!240171))

(assert (= (and b!240181 (not c!40023)) b!240167))

(assert (= (and b!240167 c!40022) b!240162))

(assert (= (and b!240167 (not c!40022)) b!240166))

(assert (= (and b!240162 res!117732) b!240178))

(assert (= (and b!240178 res!117727) b!240168))

(assert (= (and b!240166 c!40021) b!240170))

(assert (= (and b!240166 (not c!40021)) b!240161))

(assert (= (and b!240170 res!117726) b!240182))

(assert (= (and b!240182 res!117725) b!240173))

(assert (= (or b!240162 b!240170) bm!22316))

(assert (= (or b!240168 b!240173) bm!22317))

(assert (= (and b!240181 res!117733) b!240160))

(assert (= (and b!240160 res!117722) b!240165))

(assert (= (and b!240165 res!117723) b!240180))

(assert (= (and b!240180 res!117731) b!240174))

(assert (= (and b!240174 res!117734) b!240172))

(assert (= (and b!240172 res!117730) b!240175))

(assert (= (and b!240163 condMapEmpty!10710) mapIsEmpty!10710))

(assert (= (and b!240163 (not condMapEmpty!10710)) mapNonEmpty!10710))

(assert (= (and mapNonEmpty!10710 ((_ is ValueCellFull!2816) mapValue!10710)) b!240164))

(assert (= (and b!240163 ((_ is ValueCellFull!2816) mapDefault!10710)) b!240179))

(assert (= b!240177 b!240163))

(assert (= start!22958 b!240177))

(declare-fun m!260029 () Bool)

(assert (=> b!240178 m!260029))

(declare-fun m!260031 () Bool)

(assert (=> start!22958 m!260031))

(declare-fun m!260033 () Bool)

(assert (=> bm!22317 m!260033))

(declare-fun m!260035 () Bool)

(assert (=> b!240181 m!260035))

(declare-fun m!260037 () Bool)

(assert (=> b!240181 m!260037))

(assert (=> b!240181 m!260037))

(declare-fun m!260039 () Bool)

(assert (=> b!240181 m!260039))

(assert (=> b!240160 m!260033))

(declare-fun m!260041 () Bool)

(assert (=> b!240171 m!260041))

(declare-fun m!260043 () Bool)

(assert (=> b!240167 m!260043))

(declare-fun m!260045 () Bool)

(assert (=> b!240165 m!260045))

(declare-fun m!260047 () Bool)

(assert (=> b!240172 m!260047))

(declare-fun m!260049 () Bool)

(assert (=> b!240169 m!260049))

(declare-fun m!260051 () Bool)

(assert (=> mapNonEmpty!10710 m!260051))

(declare-fun m!260053 () Bool)

(assert (=> b!240175 m!260053))

(declare-fun m!260055 () Bool)

(assert (=> b!240177 m!260055))

(declare-fun m!260057 () Bool)

(assert (=> b!240177 m!260057))

(declare-fun m!260059 () Bool)

(assert (=> bm!22316 m!260059))

(declare-fun m!260061 () Bool)

(assert (=> b!240174 m!260061))

(declare-fun m!260063 () Bool)

(assert (=> b!240182 m!260063))

(check-sat (not b!240165) (not b!240172) (not start!22958) (not bm!22316) (not b!240177) tp_is_empty!6319 (not b!240167) (not b_next!6457) (not b!240174) (not b!240169) (not mapNonEmpty!10710) (not b!240160) (not b!240181) (not b!240175) b_and!13437 (not bm!22317) (not b!240171))
(check-sat b_and!13437 (not b_next!6457))
