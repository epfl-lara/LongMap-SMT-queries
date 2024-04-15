; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18814 () Bool)

(assert start!18814)

(declare-fun b!185768 () Bool)

(declare-fun b_free!4585 () Bool)

(declare-fun b_next!4585 () Bool)

(assert (=> b!185768 (= b_free!4585 (not b_next!4585))))

(declare-fun tp!16553 () Bool)

(declare-fun b_and!11161 () Bool)

(assert (=> b!185768 (= tp!16553 b_and!11161)))

(declare-fun res!87867 () Bool)

(declare-fun e!122242 () Bool)

(assert (=> start!18814 (=> (not res!87867) (not e!122242))))

(declare-datatypes ((V!5457 0))(
  ( (V!5458 (val!2223 Int)) )
))
(declare-datatypes ((ValueCell!1835 0))(
  ( (ValueCellFull!1835 (v!4128 V!5457)) (EmptyCell!1835) )
))
(declare-datatypes ((array!7903 0))(
  ( (array!7904 (arr!3730 (Array (_ BitVec 32) (_ BitVec 64))) (size!4047 (_ BitVec 32))) )
))
(declare-datatypes ((array!7905 0))(
  ( (array!7906 (arr!3731 (Array (_ BitVec 32) ValueCell!1835)) (size!4048 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2578 0))(
  ( (LongMapFixedSize!2579 (defaultEntry!3791 Int) (mask!8907 (_ BitVec 32)) (extraKeys!3528 (_ BitVec 32)) (zeroValue!3632 V!5457) (minValue!3632 V!5457) (_size!1338 (_ BitVec 32)) (_keys!5731 array!7903) (_values!3774 array!7905) (_vacant!1338 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2578)

(declare-fun valid!1082 (LongMapFixedSize!2578) Bool)

(assert (=> start!18814 (= res!87867 (valid!1082 thiss!1248))))

(assert (=> start!18814 e!122242))

(declare-fun e!122241 () Bool)

(assert (=> start!18814 e!122241))

(assert (=> start!18814 true))

(declare-fun b!185760 () Bool)

(declare-fun e!122243 () Bool)

(declare-fun tp_is_empty!4357 () Bool)

(assert (=> b!185760 (= e!122243 tp_is_empty!4357)))

(declare-fun b!185761 () Bool)

(declare-fun res!87864 () Bool)

(assert (=> b!185761 (=> (not res!87864) (not e!122242))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185761 (= res!87864 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185762 () Bool)

(declare-fun e!122246 () Bool)

(assert (=> b!185762 (= e!122242 e!122246)))

(declare-fun res!87866 () Bool)

(assert (=> b!185762 (=> (not res!87866) (not e!122246))))

(declare-datatypes ((SeekEntryResult!641 0))(
  ( (MissingZero!641 (index!4734 (_ BitVec 32))) (Found!641 (index!4735 (_ BitVec 32))) (Intermediate!641 (undefined!1453 Bool) (index!4736 (_ BitVec 32)) (x!20186 (_ BitVec 32))) (Undefined!641) (MissingVacant!641 (index!4737 (_ BitVec 32))) )
))
(declare-fun lt!91716 () SeekEntryResult!641)

(get-info :version)

(assert (=> b!185762 (= res!87866 (and (not ((_ is Undefined!641) lt!91716)) (not ((_ is MissingVacant!641) lt!91716)) (not ((_ is MissingZero!641) lt!91716)) ((_ is Found!641) lt!91716)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7903 (_ BitVec 32)) SeekEntryResult!641)

(assert (=> b!185762 (= lt!91716 (seekEntryOrOpen!0 key!828 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)))))

(declare-fun e!122238 () Bool)

(declare-fun b!185763 () Bool)

(assert (=> b!185763 (= e!122238 (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4735 lt!91716)) key!828))))

(declare-fun mapIsEmpty!7497 () Bool)

(declare-fun mapRes!7497 () Bool)

(assert (=> mapIsEmpty!7497 mapRes!7497))

(declare-fun b!185764 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185764 (= e!122246 (not (validMask!0 (mask!8907 thiss!1248))))))

(declare-datatypes ((Unit!5571 0))(
  ( (Unit!5572) )
))
(declare-fun lt!91717 () Unit!5571)

(declare-fun e!122240 () Unit!5571)

(assert (=> b!185764 (= lt!91717 e!122240)))

(declare-fun c!33299 () Bool)

(declare-datatypes ((tuple2!3426 0))(
  ( (tuple2!3427 (_1!1724 (_ BitVec 64)) (_2!1724 V!5457)) )
))
(declare-datatypes ((List!2358 0))(
  ( (Nil!2355) (Cons!2354 (h!2987 tuple2!3426) (t!7233 List!2358)) )
))
(declare-datatypes ((ListLongMap!2335 0))(
  ( (ListLongMap!2336 (toList!1183 List!2358)) )
))
(declare-fun contains!1285 (ListLongMap!2335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!816 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 32) Int) ListLongMap!2335)

(assert (=> b!185764 (= c!33299 (contains!1285 (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) key!828))))

(declare-fun b!185765 () Bool)

(declare-fun e!122244 () Bool)

(declare-fun e!122245 () Bool)

(assert (=> b!185765 (= e!122244 (and e!122245 mapRes!7497))))

(declare-fun condMapEmpty!7497 () Bool)

(declare-fun mapDefault!7497 () ValueCell!1835)

(assert (=> b!185765 (= condMapEmpty!7497 (= (arr!3731 (_values!3774 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1835)) mapDefault!7497)))))

(declare-fun b!185766 () Bool)

(assert (=> b!185766 (= e!122245 tp_is_empty!4357)))

(declare-fun b!185767 () Bool)

(declare-fun Unit!5573 () Unit!5571)

(assert (=> b!185767 (= e!122240 Unit!5573)))

(declare-fun lt!91718 () Unit!5571)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!139 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5571)

(assert (=> b!185767 (= lt!91718 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!139 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(assert (=> b!185767 false))

(declare-fun mapNonEmpty!7497 () Bool)

(declare-fun tp!16554 () Bool)

(assert (=> mapNonEmpty!7497 (= mapRes!7497 (and tp!16554 e!122243))))

(declare-fun mapKey!7497 () (_ BitVec 32))

(declare-fun mapValue!7497 () ValueCell!1835)

(declare-fun mapRest!7497 () (Array (_ BitVec 32) ValueCell!1835))

(assert (=> mapNonEmpty!7497 (= (arr!3731 (_values!3774 thiss!1248)) (store mapRest!7497 mapKey!7497 mapValue!7497))))

(declare-fun array_inv!2415 (array!7903) Bool)

(declare-fun array_inv!2416 (array!7905) Bool)

(assert (=> b!185768 (= e!122241 (and tp!16553 tp_is_empty!4357 (array_inv!2415 (_keys!5731 thiss!1248)) (array_inv!2416 (_values!3774 thiss!1248)) e!122244))))

(declare-fun b!185769 () Bool)

(declare-fun lt!91715 () Unit!5571)

(assert (=> b!185769 (= e!122240 lt!91715)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!142 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5571)

(assert (=> b!185769 (= lt!91715 (lemmaInListMapThenSeekEntryOrOpenFindsIt!142 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(declare-fun res!87865 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185769 (= res!87865 (inRange!0 (index!4735 lt!91716) (mask!8907 thiss!1248)))))

(assert (=> b!185769 (=> (not res!87865) (not e!122238))))

(assert (=> b!185769 e!122238))

(assert (= (and start!18814 res!87867) b!185761))

(assert (= (and b!185761 res!87864) b!185762))

(assert (= (and b!185762 res!87866) b!185764))

(assert (= (and b!185764 c!33299) b!185769))

(assert (= (and b!185764 (not c!33299)) b!185767))

(assert (= (and b!185769 res!87865) b!185763))

(assert (= (and b!185765 condMapEmpty!7497) mapIsEmpty!7497))

(assert (= (and b!185765 (not condMapEmpty!7497)) mapNonEmpty!7497))

(assert (= (and mapNonEmpty!7497 ((_ is ValueCellFull!1835) mapValue!7497)) b!185760))

(assert (= (and b!185765 ((_ is ValueCellFull!1835) mapDefault!7497)) b!185766))

(assert (= b!185768 b!185765))

(assert (= start!18814 b!185768))

(declare-fun m!212357 () Bool)

(assert (=> mapNonEmpty!7497 m!212357))

(declare-fun m!212359 () Bool)

(assert (=> b!185764 m!212359))

(declare-fun m!212361 () Bool)

(assert (=> b!185764 m!212361))

(assert (=> b!185764 m!212361))

(declare-fun m!212363 () Bool)

(assert (=> b!185764 m!212363))

(declare-fun m!212365 () Bool)

(assert (=> b!185762 m!212365))

(declare-fun m!212367 () Bool)

(assert (=> b!185767 m!212367))

(declare-fun m!212369 () Bool)

(assert (=> b!185769 m!212369))

(declare-fun m!212371 () Bool)

(assert (=> b!185769 m!212371))

(declare-fun m!212373 () Bool)

(assert (=> start!18814 m!212373))

(declare-fun m!212375 () Bool)

(assert (=> b!185763 m!212375))

(declare-fun m!212377 () Bool)

(assert (=> b!185768 m!212377))

(declare-fun m!212379 () Bool)

(assert (=> b!185768 m!212379))

(check-sat (not b!185764) b_and!11161 (not start!18814) (not mapNonEmpty!7497) (not b!185767) (not b_next!4585) (not b!185769) (not b!185762) (not b!185768) tp_is_empty!4357)
(check-sat b_and!11161 (not b_next!4585))
(get-model)

(declare-fun b!185842 () Bool)

(declare-fun e!122309 () SeekEntryResult!641)

(declare-fun e!122308 () SeekEntryResult!641)

(assert (=> b!185842 (= e!122309 e!122308)))

(declare-fun lt!91749 () (_ BitVec 64))

(declare-fun lt!91750 () SeekEntryResult!641)

(assert (=> b!185842 (= lt!91749 (select (arr!3730 (_keys!5731 thiss!1248)) (index!4736 lt!91750)))))

(declare-fun c!33312 () Bool)

(assert (=> b!185842 (= c!33312 (= lt!91749 key!828))))

(declare-fun d!54995 () Bool)

(declare-fun lt!91751 () SeekEntryResult!641)

(assert (=> d!54995 (and (or ((_ is Undefined!641) lt!91751) (not ((_ is Found!641) lt!91751)) (and (bvsge (index!4735 lt!91751) #b00000000000000000000000000000000) (bvslt (index!4735 lt!91751) (size!4047 (_keys!5731 thiss!1248))))) (or ((_ is Undefined!641) lt!91751) ((_ is Found!641) lt!91751) (not ((_ is MissingZero!641) lt!91751)) (and (bvsge (index!4734 lt!91751) #b00000000000000000000000000000000) (bvslt (index!4734 lt!91751) (size!4047 (_keys!5731 thiss!1248))))) (or ((_ is Undefined!641) lt!91751) ((_ is Found!641) lt!91751) ((_ is MissingZero!641) lt!91751) (not ((_ is MissingVacant!641) lt!91751)) (and (bvsge (index!4737 lt!91751) #b00000000000000000000000000000000) (bvslt (index!4737 lt!91751) (size!4047 (_keys!5731 thiss!1248))))) (or ((_ is Undefined!641) lt!91751) (ite ((_ is Found!641) lt!91751) (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4735 lt!91751)) key!828) (ite ((_ is MissingZero!641) lt!91751) (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4734 lt!91751)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!641) lt!91751) (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4737 lt!91751)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54995 (= lt!91751 e!122309)))

(declare-fun c!33313 () Bool)

(assert (=> d!54995 (= c!33313 (and ((_ is Intermediate!641) lt!91750) (undefined!1453 lt!91750)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7903 (_ BitVec 32)) SeekEntryResult!641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54995 (= lt!91750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8907 thiss!1248)) key!828 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)))))

(assert (=> d!54995 (validMask!0 (mask!8907 thiss!1248))))

(assert (=> d!54995 (= (seekEntryOrOpen!0 key!828 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)) lt!91751)))

(declare-fun b!185843 () Bool)

(assert (=> b!185843 (= e!122308 (Found!641 (index!4736 lt!91750)))))

(declare-fun b!185844 () Bool)

(assert (=> b!185844 (= e!122309 Undefined!641)))

(declare-fun b!185845 () Bool)

(declare-fun c!33314 () Bool)

(assert (=> b!185845 (= c!33314 (= lt!91749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122307 () SeekEntryResult!641)

(assert (=> b!185845 (= e!122308 e!122307)))

(declare-fun b!185846 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7903 (_ BitVec 32)) SeekEntryResult!641)

(assert (=> b!185846 (= e!122307 (seekKeyOrZeroReturnVacant!0 (x!20186 lt!91750) (index!4736 lt!91750) (index!4736 lt!91750) key!828 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)))))

(declare-fun b!185847 () Bool)

(assert (=> b!185847 (= e!122307 (MissingZero!641 (index!4736 lt!91750)))))

(assert (= (and d!54995 c!33313) b!185844))

(assert (= (and d!54995 (not c!33313)) b!185842))

(assert (= (and b!185842 c!33312) b!185843))

(assert (= (and b!185842 (not c!33312)) b!185845))

(assert (= (and b!185845 c!33314) b!185847))

(assert (= (and b!185845 (not c!33314)) b!185846))

(declare-fun m!212429 () Bool)

(assert (=> b!185842 m!212429))

(declare-fun m!212431 () Bool)

(assert (=> d!54995 m!212431))

(assert (=> d!54995 m!212359))

(declare-fun m!212433 () Bool)

(assert (=> d!54995 m!212433))

(declare-fun m!212435 () Bool)

(assert (=> d!54995 m!212435))

(declare-fun m!212437 () Bool)

(assert (=> d!54995 m!212437))

(assert (=> d!54995 m!212435))

(declare-fun m!212439 () Bool)

(assert (=> d!54995 m!212439))

(declare-fun m!212441 () Bool)

(assert (=> b!185846 m!212441))

(assert (=> b!185762 d!54995))

(declare-fun d!54997 () Bool)

(declare-fun res!87898 () Bool)

(declare-fun e!122312 () Bool)

(assert (=> d!54997 (=> (not res!87898) (not e!122312))))

(declare-fun simpleValid!183 (LongMapFixedSize!2578) Bool)

(assert (=> d!54997 (= res!87898 (simpleValid!183 thiss!1248))))

(assert (=> d!54997 (= (valid!1082 thiss!1248) e!122312)))

(declare-fun b!185854 () Bool)

(declare-fun res!87899 () Bool)

(assert (=> b!185854 (=> (not res!87899) (not e!122312))))

(declare-fun arrayCountValidKeys!0 (array!7903 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185854 (= res!87899 (= (arrayCountValidKeys!0 (_keys!5731 thiss!1248) #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))) (_size!1338 thiss!1248)))))

(declare-fun b!185855 () Bool)

(declare-fun res!87900 () Bool)

(assert (=> b!185855 (=> (not res!87900) (not e!122312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7903 (_ BitVec 32)) Bool)

(assert (=> b!185855 (= res!87900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)))))

(declare-fun b!185856 () Bool)

(declare-datatypes ((List!2359 0))(
  ( (Nil!2356) (Cons!2355 (h!2988 (_ BitVec 64)) (t!7236 List!2359)) )
))
(declare-fun arrayNoDuplicates!0 (array!7903 (_ BitVec 32) List!2359) Bool)

(assert (=> b!185856 (= e!122312 (arrayNoDuplicates!0 (_keys!5731 thiss!1248) #b00000000000000000000000000000000 Nil!2356))))

(assert (= (and d!54997 res!87898) b!185854))

(assert (= (and b!185854 res!87899) b!185855))

(assert (= (and b!185855 res!87900) b!185856))

(declare-fun m!212443 () Bool)

(assert (=> d!54997 m!212443))

(declare-fun m!212445 () Bool)

(assert (=> b!185854 m!212445))

(declare-fun m!212447 () Bool)

(assert (=> b!185855 m!212447))

(declare-fun m!212449 () Bool)

(assert (=> b!185856 m!212449))

(assert (=> start!18814 d!54997))

(declare-fun b!185873 () Bool)

(declare-fun res!87910 () Bool)

(declare-fun e!122322 () Bool)

(assert (=> b!185873 (=> (not res!87910) (not e!122322))))

(declare-fun lt!91757 () SeekEntryResult!641)

(assert (=> b!185873 (= res!87910 (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4737 lt!91757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185873 (and (bvsge (index!4737 lt!91757) #b00000000000000000000000000000000) (bvslt (index!4737 lt!91757) (size!4047 (_keys!5731 thiss!1248))))))

(declare-fun b!185874 () Bool)

(declare-fun e!122323 () Bool)

(declare-fun e!122324 () Bool)

(assert (=> b!185874 (= e!122323 e!122324)))

(declare-fun c!33319 () Bool)

(assert (=> b!185874 (= c!33319 ((_ is MissingVacant!641) lt!91757))))

(declare-fun b!185875 () Bool)

(declare-fun e!122321 () Bool)

(declare-fun call!18720 () Bool)

(assert (=> b!185875 (= e!122321 (not call!18720))))

(declare-fun call!18721 () Bool)

(declare-fun bm!18717 () Bool)

(declare-fun c!33320 () Bool)

(assert (=> bm!18717 (= call!18721 (inRange!0 (ite c!33320 (index!4734 lt!91757) (index!4737 lt!91757)) (mask!8907 thiss!1248)))))

(declare-fun b!185876 () Bool)

(assert (=> b!185876 (= e!122322 (not call!18720))))

(declare-fun b!185877 () Bool)

(assert (=> b!185877 (= e!122324 ((_ is Undefined!641) lt!91757))))

(declare-fun b!185878 () Bool)

(assert (=> b!185878 (= e!122323 e!122321)))

(declare-fun res!87911 () Bool)

(assert (=> b!185878 (= res!87911 call!18721)))

(assert (=> b!185878 (=> (not res!87911) (not e!122321))))

(declare-fun bm!18718 () Bool)

(declare-fun arrayContainsKey!0 (array!7903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18718 (= call!18720 (arrayContainsKey!0 (_keys!5731 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!185879 () Bool)

(declare-fun res!87912 () Bool)

(assert (=> b!185879 (=> (not res!87912) (not e!122322))))

(assert (=> b!185879 (= res!87912 call!18721)))

(assert (=> b!185879 (= e!122324 e!122322)))

(declare-fun b!185880 () Bool)

(assert (=> b!185880 (and (bvsge (index!4734 lt!91757) #b00000000000000000000000000000000) (bvslt (index!4734 lt!91757) (size!4047 (_keys!5731 thiss!1248))))))

(declare-fun res!87909 () Bool)

(assert (=> b!185880 (= res!87909 (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4734 lt!91757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185880 (=> (not res!87909) (not e!122321))))

(declare-fun d!54999 () Bool)

(assert (=> d!54999 e!122323))

(assert (=> d!54999 (= c!33320 ((_ is MissingZero!641) lt!91757))))

(assert (=> d!54999 (= lt!91757 (seekEntryOrOpen!0 key!828 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)))))

(declare-fun lt!91756 () Unit!5571)

(declare-fun choose!989 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5571)

(assert (=> d!54999 (= lt!91756 (choose!989 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(assert (=> d!54999 (validMask!0 (mask!8907 thiss!1248))))

(assert (=> d!54999 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!139 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)) lt!91756)))

(assert (= (and d!54999 c!33320) b!185878))

(assert (= (and d!54999 (not c!33320)) b!185874))

(assert (= (and b!185878 res!87911) b!185880))

(assert (= (and b!185880 res!87909) b!185875))

(assert (= (and b!185874 c!33319) b!185879))

(assert (= (and b!185874 (not c!33319)) b!185877))

(assert (= (and b!185879 res!87912) b!185873))

(assert (= (and b!185873 res!87910) b!185876))

(assert (= (or b!185878 b!185879) bm!18717))

(assert (= (or b!185875 b!185876) bm!18718))

(declare-fun m!212451 () Bool)

(assert (=> bm!18718 m!212451))

(declare-fun m!212453 () Bool)

(assert (=> b!185873 m!212453))

(assert (=> d!54999 m!212365))

(declare-fun m!212455 () Bool)

(assert (=> d!54999 m!212455))

(assert (=> d!54999 m!212359))

(declare-fun m!212457 () Bool)

(assert (=> b!185880 m!212457))

(declare-fun m!212459 () Bool)

(assert (=> bm!18717 m!212459))

(assert (=> b!185767 d!54999))

(declare-fun d!55001 () Bool)

(assert (=> d!55001 (= (validMask!0 (mask!8907 thiss!1248)) (and (or (= (mask!8907 thiss!1248) #b00000000000000000000000000000111) (= (mask!8907 thiss!1248) #b00000000000000000000000000001111) (= (mask!8907 thiss!1248) #b00000000000000000000000000011111) (= (mask!8907 thiss!1248) #b00000000000000000000000000111111) (= (mask!8907 thiss!1248) #b00000000000000000000000001111111) (= (mask!8907 thiss!1248) #b00000000000000000000000011111111) (= (mask!8907 thiss!1248) #b00000000000000000000000111111111) (= (mask!8907 thiss!1248) #b00000000000000000000001111111111) (= (mask!8907 thiss!1248) #b00000000000000000000011111111111) (= (mask!8907 thiss!1248) #b00000000000000000000111111111111) (= (mask!8907 thiss!1248) #b00000000000000000001111111111111) (= (mask!8907 thiss!1248) #b00000000000000000011111111111111) (= (mask!8907 thiss!1248) #b00000000000000000111111111111111) (= (mask!8907 thiss!1248) #b00000000000000001111111111111111) (= (mask!8907 thiss!1248) #b00000000000000011111111111111111) (= (mask!8907 thiss!1248) #b00000000000000111111111111111111) (= (mask!8907 thiss!1248) #b00000000000001111111111111111111) (= (mask!8907 thiss!1248) #b00000000000011111111111111111111) (= (mask!8907 thiss!1248) #b00000000000111111111111111111111) (= (mask!8907 thiss!1248) #b00000000001111111111111111111111) (= (mask!8907 thiss!1248) #b00000000011111111111111111111111) (= (mask!8907 thiss!1248) #b00000000111111111111111111111111) (= (mask!8907 thiss!1248) #b00000001111111111111111111111111) (= (mask!8907 thiss!1248) #b00000011111111111111111111111111) (= (mask!8907 thiss!1248) #b00000111111111111111111111111111) (= (mask!8907 thiss!1248) #b00001111111111111111111111111111) (= (mask!8907 thiss!1248) #b00011111111111111111111111111111) (= (mask!8907 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8907 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185764 d!55001))

(declare-fun d!55003 () Bool)

(declare-fun e!122329 () Bool)

(assert (=> d!55003 e!122329))

(declare-fun res!87915 () Bool)

(assert (=> d!55003 (=> res!87915 e!122329)))

(declare-fun lt!91768 () Bool)

(assert (=> d!55003 (= res!87915 (not lt!91768))))

(declare-fun lt!91766 () Bool)

(assert (=> d!55003 (= lt!91768 lt!91766)))

(declare-fun lt!91769 () Unit!5571)

(declare-fun e!122330 () Unit!5571)

(assert (=> d!55003 (= lt!91769 e!122330)))

(declare-fun c!33323 () Bool)

(assert (=> d!55003 (= c!33323 lt!91766)))

(declare-fun containsKey!226 (List!2358 (_ BitVec 64)) Bool)

(assert (=> d!55003 (= lt!91766 (containsKey!226 (toList!1183 (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828))))

(assert (=> d!55003 (= (contains!1285 (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) key!828) lt!91768)))

(declare-fun b!185887 () Bool)

(declare-fun lt!91767 () Unit!5571)

(assert (=> b!185887 (= e!122330 lt!91767)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!175 (List!2358 (_ BitVec 64)) Unit!5571)

(assert (=> b!185887 (= lt!91767 (lemmaContainsKeyImpliesGetValueByKeyDefined!175 (toList!1183 (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828))))

(declare-datatypes ((Option!228 0))(
  ( (Some!227 (v!4131 V!5457)) (None!226) )
))
(declare-fun isDefined!176 (Option!228) Bool)

(declare-fun getValueByKey!222 (List!2358 (_ BitVec 64)) Option!228)

(assert (=> b!185887 (isDefined!176 (getValueByKey!222 (toList!1183 (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828))))

(declare-fun b!185888 () Bool)

(declare-fun Unit!5576 () Unit!5571)

(assert (=> b!185888 (= e!122330 Unit!5576)))

(declare-fun b!185889 () Bool)

(assert (=> b!185889 (= e!122329 (isDefined!176 (getValueByKey!222 (toList!1183 (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248))) key!828)))))

(assert (= (and d!55003 c!33323) b!185887))

(assert (= (and d!55003 (not c!33323)) b!185888))

(assert (= (and d!55003 (not res!87915)) b!185889))

(declare-fun m!212461 () Bool)

(assert (=> d!55003 m!212461))

(declare-fun m!212463 () Bool)

(assert (=> b!185887 m!212463))

(declare-fun m!212465 () Bool)

(assert (=> b!185887 m!212465))

(assert (=> b!185887 m!212465))

(declare-fun m!212467 () Bool)

(assert (=> b!185887 m!212467))

(assert (=> b!185889 m!212465))

(assert (=> b!185889 m!212465))

(assert (=> b!185889 m!212467))

(assert (=> b!185764 d!55003))

(declare-fun b!185933 () Bool)

(declare-fun e!122358 () Unit!5571)

(declare-fun Unit!5577 () Unit!5571)

(assert (=> b!185933 (= e!122358 Unit!5577)))

(declare-fun b!185934 () Bool)

(declare-fun e!122359 () Bool)

(declare-fun e!122357 () Bool)

(assert (=> b!185934 (= e!122359 e!122357)))

(declare-fun c!33341 () Bool)

(assert (=> b!185934 (= c!33341 (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185935 () Bool)

(declare-fun call!18736 () Bool)

(assert (=> b!185935 (= e!122357 (not call!18736))))

(declare-fun c!33340 () Bool)

(declare-fun c!33339 () Bool)

(declare-fun call!18739 () ListLongMap!2335)

(declare-fun call!18738 () ListLongMap!2335)

(declare-fun bm!18733 () Bool)

(declare-fun call!18742 () ListLongMap!2335)

(declare-fun call!18740 () ListLongMap!2335)

(declare-fun +!284 (ListLongMap!2335 tuple2!3426) ListLongMap!2335)

(assert (=> bm!18733 (= call!18739 (+!284 (ite c!33339 call!18740 (ite c!33340 call!18738 call!18742)) (ite (or c!33339 c!33340) (tuple2!3427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3632 thiss!1248)) (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3632 thiss!1248)))))))

(declare-fun b!185936 () Bool)

(declare-fun e!122366 () Bool)

(declare-fun call!18741 () Bool)

(assert (=> b!185936 (= e!122366 (not call!18741))))

(declare-fun b!185937 () Bool)

(declare-fun e!122363 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185937 (= e!122363 (validKeyInArray!0 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185938 () Bool)

(declare-fun lt!91835 () Unit!5571)

(assert (=> b!185938 (= e!122358 lt!91835)))

(declare-fun lt!91828 () ListLongMap!2335)

(declare-fun getCurrentListMapNoExtraKeys!188 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 32) Int) ListLongMap!2335)

(assert (=> b!185938 (= lt!91828 (getCurrentListMapNoExtraKeys!188 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!91832 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91825 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91825 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91815 () Unit!5571)

(declare-fun addStillContains!143 (ListLongMap!2335 (_ BitVec 64) V!5457 (_ BitVec 64)) Unit!5571)

(assert (=> b!185938 (= lt!91815 (addStillContains!143 lt!91828 lt!91832 (zeroValue!3632 thiss!1248) lt!91825))))

(assert (=> b!185938 (contains!1285 (+!284 lt!91828 (tuple2!3427 lt!91832 (zeroValue!3632 thiss!1248))) lt!91825)))

(declare-fun lt!91834 () Unit!5571)

(assert (=> b!185938 (= lt!91834 lt!91815)))

(declare-fun lt!91833 () ListLongMap!2335)

(assert (=> b!185938 (= lt!91833 (getCurrentListMapNoExtraKeys!188 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!91830 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91830 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91820 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91820 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91823 () Unit!5571)

(declare-fun addApplyDifferent!143 (ListLongMap!2335 (_ BitVec 64) V!5457 (_ BitVec 64)) Unit!5571)

(assert (=> b!185938 (= lt!91823 (addApplyDifferent!143 lt!91833 lt!91830 (minValue!3632 thiss!1248) lt!91820))))

(declare-fun apply!167 (ListLongMap!2335 (_ BitVec 64)) V!5457)

(assert (=> b!185938 (= (apply!167 (+!284 lt!91833 (tuple2!3427 lt!91830 (minValue!3632 thiss!1248))) lt!91820) (apply!167 lt!91833 lt!91820))))

(declare-fun lt!91822 () Unit!5571)

(assert (=> b!185938 (= lt!91822 lt!91823)))

(declare-fun lt!91814 () ListLongMap!2335)

(assert (=> b!185938 (= lt!91814 (getCurrentListMapNoExtraKeys!188 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!91824 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91831 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91831 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91816 () Unit!5571)

(assert (=> b!185938 (= lt!91816 (addApplyDifferent!143 lt!91814 lt!91824 (zeroValue!3632 thiss!1248) lt!91831))))

(assert (=> b!185938 (= (apply!167 (+!284 lt!91814 (tuple2!3427 lt!91824 (zeroValue!3632 thiss!1248))) lt!91831) (apply!167 lt!91814 lt!91831))))

(declare-fun lt!91818 () Unit!5571)

(assert (=> b!185938 (= lt!91818 lt!91816)))

(declare-fun lt!91819 () ListLongMap!2335)

(assert (=> b!185938 (= lt!91819 (getCurrentListMapNoExtraKeys!188 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun lt!91826 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91821 () (_ BitVec 64))

(assert (=> b!185938 (= lt!91821 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185938 (= lt!91835 (addApplyDifferent!143 lt!91819 lt!91826 (minValue!3632 thiss!1248) lt!91821))))

(assert (=> b!185938 (= (apply!167 (+!284 lt!91819 (tuple2!3427 lt!91826 (minValue!3632 thiss!1248))) lt!91821) (apply!167 lt!91819 lt!91821))))

(declare-fun b!185939 () Bool)

(declare-fun e!122360 () Bool)

(assert (=> b!185939 (= e!122366 e!122360)))

(declare-fun res!87938 () Bool)

(assert (=> b!185939 (= res!87938 call!18741)))

(assert (=> b!185939 (=> (not res!87938) (not e!122360))))

(declare-fun bm!18734 () Bool)

(declare-fun call!18737 () ListLongMap!2335)

(assert (=> bm!18734 (= call!18737 call!18739)))

(declare-fun b!185940 () Bool)

(declare-fun e!122368 () ListLongMap!2335)

(assert (=> b!185940 (= e!122368 call!18737)))

(declare-fun b!185941 () Bool)

(declare-fun e!122361 () Bool)

(declare-fun lt!91817 () ListLongMap!2335)

(declare-fun get!2142 (ValueCell!1835 V!5457) V!5457)

(declare-fun dynLambda!501 (Int (_ BitVec 64)) V!5457)

(assert (=> b!185941 (= e!122361 (= (apply!167 lt!91817 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000)) (get!2142 (select (arr!3731 (_values!3774 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!501 (defaultEntry!3791 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4048 (_values!3774 thiss!1248))))))

(assert (=> b!185941 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))))))

(declare-fun d!55005 () Bool)

(assert (=> d!55005 e!122359))

(declare-fun res!87942 () Bool)

(assert (=> d!55005 (=> (not res!87942) (not e!122359))))

(assert (=> d!55005 (= res!87942 (or (bvsge #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))))))))

(declare-fun lt!91829 () ListLongMap!2335)

(assert (=> d!55005 (= lt!91817 lt!91829)))

(declare-fun lt!91827 () Unit!5571)

(assert (=> d!55005 (= lt!91827 e!122358)))

(declare-fun c!33337 () Bool)

(assert (=> d!55005 (= c!33337 e!122363)))

(declare-fun res!87936 () Bool)

(assert (=> d!55005 (=> (not res!87936) (not e!122363))))

(assert (=> d!55005 (= res!87936 (bvslt #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))))))

(declare-fun e!122369 () ListLongMap!2335)

(assert (=> d!55005 (= lt!91829 e!122369)))

(assert (=> d!55005 (= c!33339 (and (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55005 (validMask!0 (mask!8907 thiss!1248))))

(assert (=> d!55005 (= (getCurrentListMap!816 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)) lt!91817)))

(declare-fun b!185932 () Bool)

(declare-fun e!122367 () Bool)

(assert (=> b!185932 (= e!122367 (= (apply!167 lt!91817 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3632 thiss!1248)))))

(declare-fun bm!18735 () Bool)

(assert (=> bm!18735 (= call!18742 call!18738)))

(declare-fun b!185942 () Bool)

(declare-fun c!33338 () Bool)

(assert (=> b!185942 (= c!33338 (and (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122365 () ListLongMap!2335)

(assert (=> b!185942 (= e!122368 e!122365)))

(declare-fun b!185943 () Bool)

(assert (=> b!185943 (= e!122360 (= (apply!167 lt!91817 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3632 thiss!1248)))))

(declare-fun b!185944 () Bool)

(assert (=> b!185944 (= e!122369 e!122368)))

(assert (=> b!185944 (= c!33340 (and (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185945 () Bool)

(declare-fun e!122364 () Bool)

(assert (=> b!185945 (= e!122364 (validKeyInArray!0 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185946 () Bool)

(assert (=> b!185946 (= e!122365 call!18737)))

(declare-fun b!185947 () Bool)

(declare-fun res!87940 () Bool)

(assert (=> b!185947 (=> (not res!87940) (not e!122359))))

(assert (=> b!185947 (= res!87940 e!122366)))

(declare-fun c!33336 () Bool)

(assert (=> b!185947 (= c!33336 (not (= (bvand (extraKeys!3528 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!185948 () Bool)

(assert (=> b!185948 (= e!122365 call!18742)))

(declare-fun b!185949 () Bool)

(declare-fun e!122362 () Bool)

(assert (=> b!185949 (= e!122362 e!122361)))

(declare-fun res!87934 () Bool)

(assert (=> b!185949 (=> (not res!87934) (not e!122361))))

(assert (=> b!185949 (= res!87934 (contains!1285 lt!91817 (select (arr!3730 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))))))

(declare-fun bm!18736 () Bool)

(assert (=> bm!18736 (= call!18741 (contains!1285 lt!91817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185950 () Bool)

(assert (=> b!185950 (= e!122369 (+!284 call!18739 (tuple2!3427 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3632 thiss!1248))))))

(declare-fun bm!18737 () Bool)

(assert (=> bm!18737 (= call!18740 (getCurrentListMapNoExtraKeys!188 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3791 thiss!1248)))))

(declare-fun b!185951 () Bool)

(assert (=> b!185951 (= e!122357 e!122367)))

(declare-fun res!87939 () Bool)

(assert (=> b!185951 (= res!87939 call!18736)))

(assert (=> b!185951 (=> (not res!87939) (not e!122367))))

(declare-fun b!185952 () Bool)

(declare-fun res!87935 () Bool)

(assert (=> b!185952 (=> (not res!87935) (not e!122359))))

(assert (=> b!185952 (= res!87935 e!122362)))

(declare-fun res!87941 () Bool)

(assert (=> b!185952 (=> res!87941 e!122362)))

(assert (=> b!185952 (= res!87941 (not e!122364))))

(declare-fun res!87937 () Bool)

(assert (=> b!185952 (=> (not res!87937) (not e!122364))))

(assert (=> b!185952 (= res!87937 (bvslt #b00000000000000000000000000000000 (size!4047 (_keys!5731 thiss!1248))))))

(declare-fun bm!18738 () Bool)

(assert (=> bm!18738 (= call!18738 call!18740)))

(declare-fun bm!18739 () Bool)

(assert (=> bm!18739 (= call!18736 (contains!1285 lt!91817 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55005 c!33339) b!185950))

(assert (= (and d!55005 (not c!33339)) b!185944))

(assert (= (and b!185944 c!33340) b!185940))

(assert (= (and b!185944 (not c!33340)) b!185942))

(assert (= (and b!185942 c!33338) b!185946))

(assert (= (and b!185942 (not c!33338)) b!185948))

(assert (= (or b!185946 b!185948) bm!18735))

(assert (= (or b!185940 bm!18735) bm!18738))

(assert (= (or b!185940 b!185946) bm!18734))

(assert (= (or b!185950 bm!18738) bm!18737))

(assert (= (or b!185950 bm!18734) bm!18733))

(assert (= (and d!55005 res!87936) b!185937))

(assert (= (and d!55005 c!33337) b!185938))

(assert (= (and d!55005 (not c!33337)) b!185933))

(assert (= (and d!55005 res!87942) b!185952))

(assert (= (and b!185952 res!87937) b!185945))

(assert (= (and b!185952 (not res!87941)) b!185949))

(assert (= (and b!185949 res!87934) b!185941))

(assert (= (and b!185952 res!87935) b!185947))

(assert (= (and b!185947 c!33336) b!185939))

(assert (= (and b!185947 (not c!33336)) b!185936))

(assert (= (and b!185939 res!87938) b!185943))

(assert (= (or b!185939 b!185936) bm!18736))

(assert (= (and b!185947 res!87940) b!185934))

(assert (= (and b!185934 c!33341) b!185951))

(assert (= (and b!185934 (not c!33341)) b!185935))

(assert (= (and b!185951 res!87939) b!185932))

(assert (= (or b!185951 b!185935) bm!18739))

(declare-fun b_lambda!7237 () Bool)

(assert (=> (not b_lambda!7237) (not b!185941)))

(declare-fun t!7235 () Bool)

(declare-fun tb!2837 () Bool)

(assert (=> (and b!185768 (= (defaultEntry!3791 thiss!1248) (defaultEntry!3791 thiss!1248)) t!7235) tb!2837))

(declare-fun result!4805 () Bool)

(assert (=> tb!2837 (= result!4805 tp_is_empty!4357)))

(assert (=> b!185941 t!7235))

(declare-fun b_and!11167 () Bool)

(assert (= b_and!11161 (and (=> t!7235 result!4805) b_and!11167)))

(declare-fun m!212469 () Bool)

(assert (=> b!185941 m!212469))

(declare-fun m!212471 () Bool)

(assert (=> b!185941 m!212471))

(declare-fun m!212473 () Bool)

(assert (=> b!185941 m!212473))

(assert (=> b!185941 m!212469))

(declare-fun m!212475 () Bool)

(assert (=> b!185941 m!212475))

(declare-fun m!212477 () Bool)

(assert (=> b!185941 m!212477))

(assert (=> b!185941 m!212471))

(assert (=> b!185941 m!212475))

(declare-fun m!212479 () Bool)

(assert (=> bm!18739 m!212479))

(assert (=> b!185937 m!212475))

(assert (=> b!185937 m!212475))

(declare-fun m!212481 () Bool)

(assert (=> b!185937 m!212481))

(declare-fun m!212483 () Bool)

(assert (=> bm!18736 m!212483))

(assert (=> d!55005 m!212359))

(declare-fun m!212485 () Bool)

(assert (=> bm!18737 m!212485))

(declare-fun m!212487 () Bool)

(assert (=> b!185950 m!212487))

(declare-fun m!212489 () Bool)

(assert (=> bm!18733 m!212489))

(assert (=> b!185949 m!212475))

(assert (=> b!185949 m!212475))

(declare-fun m!212491 () Bool)

(assert (=> b!185949 m!212491))

(declare-fun m!212493 () Bool)

(assert (=> b!185932 m!212493))

(assert (=> b!185945 m!212475))

(assert (=> b!185945 m!212475))

(assert (=> b!185945 m!212481))

(assert (=> b!185938 m!212485))

(declare-fun m!212495 () Bool)

(assert (=> b!185938 m!212495))

(declare-fun m!212497 () Bool)

(assert (=> b!185938 m!212497))

(declare-fun m!212499 () Bool)

(assert (=> b!185938 m!212499))

(declare-fun m!212501 () Bool)

(assert (=> b!185938 m!212501))

(declare-fun m!212503 () Bool)

(assert (=> b!185938 m!212503))

(declare-fun m!212505 () Bool)

(assert (=> b!185938 m!212505))

(assert (=> b!185938 m!212475))

(assert (=> b!185938 m!212497))

(declare-fun m!212507 () Bool)

(assert (=> b!185938 m!212507))

(declare-fun m!212509 () Bool)

(assert (=> b!185938 m!212509))

(declare-fun m!212511 () Bool)

(assert (=> b!185938 m!212511))

(assert (=> b!185938 m!212499))

(declare-fun m!212513 () Bool)

(assert (=> b!185938 m!212513))

(declare-fun m!212515 () Bool)

(assert (=> b!185938 m!212515))

(declare-fun m!212517 () Bool)

(assert (=> b!185938 m!212517))

(declare-fun m!212519 () Bool)

(assert (=> b!185938 m!212519))

(assert (=> b!185938 m!212511))

(declare-fun m!212521 () Bool)

(assert (=> b!185938 m!212521))

(assert (=> b!185938 m!212515))

(declare-fun m!212523 () Bool)

(assert (=> b!185938 m!212523))

(declare-fun m!212525 () Bool)

(assert (=> b!185943 m!212525))

(assert (=> b!185764 d!55005))

(declare-fun d!55007 () Bool)

(assert (=> d!55007 (= (array_inv!2415 (_keys!5731 thiss!1248)) (bvsge (size!4047 (_keys!5731 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185768 d!55007))

(declare-fun d!55009 () Bool)

(assert (=> d!55009 (= (array_inv!2416 (_values!3774 thiss!1248)) (bvsge (size!4048 (_values!3774 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185768 d!55009))

(declare-fun d!55011 () Bool)

(declare-fun e!122372 () Bool)

(assert (=> d!55011 e!122372))

(declare-fun res!87947 () Bool)

(assert (=> d!55011 (=> (not res!87947) (not e!122372))))

(declare-fun lt!91840 () SeekEntryResult!641)

(assert (=> d!55011 (= res!87947 ((_ is Found!641) lt!91840))))

(assert (=> d!55011 (= lt!91840 (seekEntryOrOpen!0 key!828 (_keys!5731 thiss!1248) (mask!8907 thiss!1248)))))

(declare-fun lt!91841 () Unit!5571)

(declare-fun choose!990 (array!7903 array!7905 (_ BitVec 32) (_ BitVec 32) V!5457 V!5457 (_ BitVec 64) Int) Unit!5571)

(assert (=> d!55011 (= lt!91841 (choose!990 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)))))

(assert (=> d!55011 (validMask!0 (mask!8907 thiss!1248))))

(assert (=> d!55011 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!142 (_keys!5731 thiss!1248) (_values!3774 thiss!1248) (mask!8907 thiss!1248) (extraKeys!3528 thiss!1248) (zeroValue!3632 thiss!1248) (minValue!3632 thiss!1248) key!828 (defaultEntry!3791 thiss!1248)) lt!91841)))

(declare-fun b!185959 () Bool)

(declare-fun res!87948 () Bool)

(assert (=> b!185959 (=> (not res!87948) (not e!122372))))

(assert (=> b!185959 (= res!87948 (inRange!0 (index!4735 lt!91840) (mask!8907 thiss!1248)))))

(declare-fun b!185960 () Bool)

(assert (=> b!185960 (= e!122372 (= (select (arr!3730 (_keys!5731 thiss!1248)) (index!4735 lt!91840)) key!828))))

(assert (=> b!185960 (and (bvsge (index!4735 lt!91840) #b00000000000000000000000000000000) (bvslt (index!4735 lt!91840) (size!4047 (_keys!5731 thiss!1248))))))

(assert (= (and d!55011 res!87947) b!185959))

(assert (= (and b!185959 res!87948) b!185960))

(assert (=> d!55011 m!212365))

(declare-fun m!212527 () Bool)

(assert (=> d!55011 m!212527))

(assert (=> d!55011 m!212359))

(declare-fun m!212529 () Bool)

(assert (=> b!185959 m!212529))

(declare-fun m!212531 () Bool)

(assert (=> b!185960 m!212531))

(assert (=> b!185769 d!55011))

(declare-fun d!55013 () Bool)

(assert (=> d!55013 (= (inRange!0 (index!4735 lt!91716) (mask!8907 thiss!1248)) (and (bvsge (index!4735 lt!91716) #b00000000000000000000000000000000) (bvslt (index!4735 lt!91716) (bvadd (mask!8907 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!185769 d!55013))

(declare-fun mapNonEmpty!7506 () Bool)

(declare-fun mapRes!7506 () Bool)

(declare-fun tp!16569 () Bool)

(declare-fun e!122377 () Bool)

(assert (=> mapNonEmpty!7506 (= mapRes!7506 (and tp!16569 e!122377))))

(declare-fun mapKey!7506 () (_ BitVec 32))

(declare-fun mapValue!7506 () ValueCell!1835)

(declare-fun mapRest!7506 () (Array (_ BitVec 32) ValueCell!1835))

(assert (=> mapNonEmpty!7506 (= mapRest!7497 (store mapRest!7506 mapKey!7506 mapValue!7506))))

(declare-fun b!185967 () Bool)

(assert (=> b!185967 (= e!122377 tp_is_empty!4357)))

(declare-fun b!185968 () Bool)

(declare-fun e!122378 () Bool)

(assert (=> b!185968 (= e!122378 tp_is_empty!4357)))

(declare-fun condMapEmpty!7506 () Bool)

(declare-fun mapDefault!7506 () ValueCell!1835)

(assert (=> mapNonEmpty!7497 (= condMapEmpty!7506 (= mapRest!7497 ((as const (Array (_ BitVec 32) ValueCell!1835)) mapDefault!7506)))))

(assert (=> mapNonEmpty!7497 (= tp!16554 (and e!122378 mapRes!7506))))

(declare-fun mapIsEmpty!7506 () Bool)

(assert (=> mapIsEmpty!7506 mapRes!7506))

(assert (= (and mapNonEmpty!7497 condMapEmpty!7506) mapIsEmpty!7506))

(assert (= (and mapNonEmpty!7497 (not condMapEmpty!7506)) mapNonEmpty!7506))

(assert (= (and mapNonEmpty!7506 ((_ is ValueCellFull!1835) mapValue!7506)) b!185967))

(assert (= (and mapNonEmpty!7497 ((_ is ValueCellFull!1835) mapDefault!7506)) b!185968))

(declare-fun m!212533 () Bool)

(assert (=> mapNonEmpty!7506 m!212533))

(declare-fun b_lambda!7239 () Bool)

(assert (= b_lambda!7237 (or (and b!185768 b_free!4585) b_lambda!7239)))

(check-sat (not d!54995) (not b!185959) (not b!185943) (not b!185889) (not b!185932) (not bm!18733) (not b!185856) (not b!185937) (not bm!18737) tp_is_empty!4357 (not d!55003) (not b_lambda!7239) (not b!185855) (not d!55005) b_and!11167 (not d!54999) (not b!185938) (not bm!18736) (not b!185950) (not bm!18739) (not b!185846) (not b!185945) (not b!185949) (not mapNonEmpty!7506) (not d!55011) (not b!185941) (not b!185887) (not bm!18718) (not b_next!4585) (not d!54997) (not bm!18717) (not b!185854))
(check-sat b_and!11167 (not b_next!4585))
