; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22056 () Bool)

(assert start!22056)

(declare-fun b!228174 () Bool)

(declare-fun b_free!6123 () Bool)

(declare-fun b_next!6123 () Bool)

(assert (=> b!228174 (= b_free!6123 (not b_next!6123))))

(declare-fun tp!21511 () Bool)

(declare-fun b_and!13021 () Bool)

(assert (=> b!228174 (= tp!21511 b_and!13021)))

(declare-datatypes ((V!7627 0))(
  ( (V!7628 (val!3037 Int)) )
))
(declare-datatypes ((ValueCell!2649 0))(
  ( (ValueCellFull!2649 (v!5057 V!7627)) (EmptyCell!2649) )
))
(declare-datatypes ((array!11213 0))(
  ( (array!11214 (arr!5326 (Array (_ BitVec 32) ValueCell!2649)) (size!5659 (_ BitVec 32))) )
))
(declare-datatypes ((array!11215 0))(
  ( (array!11216 (arr!5327 (Array (_ BitVec 32) (_ BitVec 64))) (size!5660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3198 0))(
  ( (LongMapFixedSize!3199 (defaultEntry!4258 Int) (mask!10126 (_ BitVec 32)) (extraKeys!3995 (_ BitVec 32)) (zeroValue!4099 V!7627) (minValue!4099 V!7627) (_size!1648 (_ BitVec 32)) (_keys!6312 array!11215) (_values!4241 array!11213) (_vacant!1648 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3198)

(declare-datatypes ((SeekEntryResult!904 0))(
  ( (MissingZero!904 (index!5786 (_ BitVec 32))) (Found!904 (index!5787 (_ BitVec 32))) (Intermediate!904 (undefined!1716 Bool) (index!5788 (_ BitVec 32)) (x!23316 (_ BitVec 32))) (Undefined!904) (MissingVacant!904 (index!5789 (_ BitVec 32))) )
))
(declare-fun lt!114799 () SeekEntryResult!904)

(declare-fun bm!21200 () Bool)

(declare-fun call!21204 () Bool)

(declare-fun c!37835 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21200 (= call!21204 (inRange!0 (ite c!37835 (index!5786 lt!114799) (index!5789 lt!114799)) (mask!10126 thiss!1504)))))

(declare-fun b!228160 () Bool)

(declare-fun res!112307 () Bool)

(assert (=> b!228160 (= res!112307 (= (select (arr!5327 (_keys!6312 thiss!1504)) (index!5789 lt!114799)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148026 () Bool)

(assert (=> b!228160 (=> (not res!112307) (not e!148026))))

(declare-fun b!228161 () Bool)

(declare-fun c!37833 () Bool)

(get-info :version)

(assert (=> b!228161 (= c!37833 ((_ is MissingVacant!904) lt!114799))))

(declare-fun e!148028 () Bool)

(declare-fun e!148020 () Bool)

(assert (=> b!228161 (= e!148028 e!148020)))

(declare-fun b!228162 () Bool)

(declare-fun call!21203 () Bool)

(assert (=> b!228162 (= e!148026 (not call!21203))))

(declare-fun b!228163 () Bool)

(declare-datatypes ((Unit!6932 0))(
  ( (Unit!6933) )
))
(declare-fun e!148022 () Unit!6932)

(declare-fun Unit!6934 () Unit!6932)

(assert (=> b!228163 (= e!148022 Unit!6934)))

(declare-fun bm!21201 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21201 (= call!21203 (arrayContainsKey!0 (_keys!6312 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228164 () Bool)

(declare-fun e!148024 () Unit!6932)

(declare-fun lt!114796 () Unit!6932)

(assert (=> b!228164 (= e!148024 lt!114796)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!285 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7627 V!7627 (_ BitVec 64) Int) Unit!6932)

(assert (=> b!228164 (= lt!114796 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!285 (_keys!6312 thiss!1504) (_values!4241 thiss!1504) (mask!10126 thiss!1504) (extraKeys!3995 thiss!1504) (zeroValue!4099 thiss!1504) (minValue!4099 thiss!1504) key!932 (defaultEntry!4258 thiss!1504)))))

(assert (=> b!228164 (= c!37835 ((_ is MissingZero!904) lt!114799))))

(assert (=> b!228164 e!148028))

(declare-fun b!228165 () Bool)

(declare-fun e!148030 () Bool)

(declare-fun tp_is_empty!5985 () Bool)

(assert (=> b!228165 (= e!148030 tp_is_empty!5985)))

(declare-fun b!228166 () Bool)

(declare-fun e!148031 () Bool)

(assert (=> b!228166 (= e!148031 true)))

(declare-fun lt!114800 () Bool)

(declare-datatypes ((List!3404 0))(
  ( (Nil!3401) (Cons!3400 (h!4048 (_ BitVec 64)) (t!8363 List!3404)) )
))
(declare-fun arrayNoDuplicates!0 (array!11215 (_ BitVec 32) List!3404) Bool)

(assert (=> b!228166 (= lt!114800 (arrayNoDuplicates!0 (_keys!6312 thiss!1504) #b00000000000000000000000000000000 Nil!3401))))

(declare-fun b!228167 () Bool)

(declare-fun e!148025 () Bool)

(declare-fun e!148033 () Bool)

(assert (=> b!228167 (= e!148025 e!148033)))

(declare-fun res!112305 () Bool)

(assert (=> b!228167 (=> (not res!112305) (not e!148033))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228167 (= res!112305 (or (= lt!114799 (MissingZero!904 index!297)) (= lt!114799 (MissingVacant!904 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11215 (_ BitVec 32)) SeekEntryResult!904)

(assert (=> b!228167 (= lt!114799 (seekEntryOrOpen!0 key!932 (_keys!6312 thiss!1504) (mask!10126 thiss!1504)))))

(declare-fun b!228168 () Bool)

(declare-fun res!112306 () Bool)

(declare-fun e!148034 () Bool)

(assert (=> b!228168 (=> (not res!112306) (not e!148034))))

(assert (=> b!228168 (= res!112306 (= (select (arr!5327 (_keys!6312 thiss!1504)) (index!5786 lt!114799)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228159 () Bool)

(assert (=> b!228159 (= e!148020 ((_ is Undefined!904) lt!114799))))

(declare-fun res!112312 () Bool)

(assert (=> start!22056 (=> (not res!112312) (not e!148025))))

(declare-fun valid!1280 (LongMapFixedSize!3198) Bool)

(assert (=> start!22056 (= res!112312 (valid!1280 thiss!1504))))

(assert (=> start!22056 e!148025))

(declare-fun e!148027 () Bool)

(assert (=> start!22056 e!148027))

(assert (=> start!22056 true))

(declare-fun b!228169 () Bool)

(declare-fun res!112311 () Bool)

(assert (=> b!228169 (=> res!112311 e!148031)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11215 (_ BitVec 32)) Bool)

(assert (=> b!228169 (= res!112311 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6312 thiss!1504) (mask!10126 thiss!1504))))))

(declare-fun b!228170 () Bool)

(declare-fun e!148021 () Bool)

(declare-fun mapRes!10147 () Bool)

(assert (=> b!228170 (= e!148021 (and e!148030 mapRes!10147))))

(declare-fun condMapEmpty!10147 () Bool)

(declare-fun mapDefault!10147 () ValueCell!2649)

(assert (=> b!228170 (= condMapEmpty!10147 (= (arr!5326 (_values!4241 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2649)) mapDefault!10147)))))

(declare-fun b!228171 () Bool)

(declare-fun e!148029 () Bool)

(assert (=> b!228171 (= e!148033 e!148029)))

(declare-fun res!112310 () Bool)

(assert (=> b!228171 (=> (not res!112310) (not e!148029))))

(assert (=> b!228171 (= res!112310 (inRange!0 index!297 (mask!10126 thiss!1504)))))

(declare-fun lt!114795 () Unit!6932)

(assert (=> b!228171 (= lt!114795 e!148024)))

(declare-fun c!37836 () Bool)

(declare-datatypes ((tuple2!4482 0))(
  ( (tuple2!4483 (_1!2252 (_ BitVec 64)) (_2!2252 V!7627)) )
))
(declare-datatypes ((List!3405 0))(
  ( (Nil!3402) (Cons!3401 (h!4049 tuple2!4482) (t!8364 List!3405)) )
))
(declare-datatypes ((ListLongMap!3395 0))(
  ( (ListLongMap!3396 (toList!1713 List!3405)) )
))
(declare-fun contains!1587 (ListLongMap!3395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1241 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7627 V!7627 (_ BitVec 32) Int) ListLongMap!3395)

(assert (=> b!228171 (= c!37836 (contains!1587 (getCurrentListMap!1241 (_keys!6312 thiss!1504) (_values!4241 thiss!1504) (mask!10126 thiss!1504) (extraKeys!3995 thiss!1504) (zeroValue!4099 thiss!1504) (minValue!4099 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4258 thiss!1504)) key!932))))

(declare-fun b!228172 () Bool)

(assert (=> b!228172 (= e!148029 (not e!148031))))

(declare-fun res!112313 () Bool)

(assert (=> b!228172 (=> res!112313 e!148031)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228172 (= res!112313 (not (validMask!0 (mask!10126 thiss!1504))))))

(declare-fun lt!114798 () array!11215)

(assert (=> b!228172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114798 (mask!10126 thiss!1504))))

(declare-fun lt!114801 () Unit!6932)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11215 (_ BitVec 32) (_ BitVec 32)) Unit!6932)

(assert (=> b!228172 (= lt!114801 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6312 thiss!1504) index!297 (mask!10126 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228172 (= (arrayCountValidKeys!0 lt!114798 #b00000000000000000000000000000000 (size!5660 (_keys!6312 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6312 thiss!1504) #b00000000000000000000000000000000 (size!5660 (_keys!6312 thiss!1504)))))))

(declare-fun lt!114803 () Unit!6932)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11215 (_ BitVec 32) (_ BitVec 64)) Unit!6932)

(assert (=> b!228172 (= lt!114803 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6312 thiss!1504) index!297 key!932))))

(assert (=> b!228172 (arrayNoDuplicates!0 lt!114798 #b00000000000000000000000000000000 Nil!3401)))

(assert (=> b!228172 (= lt!114798 (array!11216 (store (arr!5327 (_keys!6312 thiss!1504)) index!297 key!932) (size!5660 (_keys!6312 thiss!1504))))))

(declare-fun lt!114793 () Unit!6932)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3404) Unit!6932)

(assert (=> b!228172 (= lt!114793 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6312 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3401))))

(declare-fun lt!114797 () Unit!6932)

(assert (=> b!228172 (= lt!114797 e!148022)))

(declare-fun c!37834 () Bool)

(assert (=> b!228172 (= c!37834 (arrayContainsKey!0 (_keys!6312 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228173 () Bool)

(declare-fun res!112314 () Bool)

(assert (=> b!228173 (=> (not res!112314) (not e!148025))))

(assert (=> b!228173 (= res!112314 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10147 () Bool)

(assert (=> mapIsEmpty!10147 mapRes!10147))

(declare-fun array_inv!3523 (array!11215) Bool)

(declare-fun array_inv!3524 (array!11213) Bool)

(assert (=> b!228174 (= e!148027 (and tp!21511 tp_is_empty!5985 (array_inv!3523 (_keys!6312 thiss!1504)) (array_inv!3524 (_values!4241 thiss!1504)) e!148021))))

(declare-fun b!228175 () Bool)

(assert (=> b!228175 (= e!148020 e!148026)))

(declare-fun res!112308 () Bool)

(assert (=> b!228175 (= res!112308 call!21204)))

(assert (=> b!228175 (=> (not res!112308) (not e!148026))))

(declare-fun b!228176 () Bool)

(declare-fun Unit!6935 () Unit!6932)

(assert (=> b!228176 (= e!148022 Unit!6935)))

(declare-fun lt!114802 () Unit!6932)

(declare-fun lemmaArrayContainsKeyThenInListMap!108 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7627 V!7627 (_ BitVec 64) (_ BitVec 32) Int) Unit!6932)

(assert (=> b!228176 (= lt!114802 (lemmaArrayContainsKeyThenInListMap!108 (_keys!6312 thiss!1504) (_values!4241 thiss!1504) (mask!10126 thiss!1504) (extraKeys!3995 thiss!1504) (zeroValue!4099 thiss!1504) (minValue!4099 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4258 thiss!1504)))))

(assert (=> b!228176 false))

(declare-fun b!228177 () Bool)

(declare-fun res!112309 () Bool)

(assert (=> b!228177 (=> (not res!112309) (not e!148034))))

(assert (=> b!228177 (= res!112309 call!21204)))

(assert (=> b!228177 (= e!148028 e!148034)))

(declare-fun b!228178 () Bool)

(declare-fun Unit!6936 () Unit!6932)

(assert (=> b!228178 (= e!148024 Unit!6936)))

(declare-fun lt!114794 () Unit!6932)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!271 (array!11215 array!11213 (_ BitVec 32) (_ BitVec 32) V!7627 V!7627 (_ BitVec 64) Int) Unit!6932)

(assert (=> b!228178 (= lt!114794 (lemmaInListMapThenSeekEntryOrOpenFindsIt!271 (_keys!6312 thiss!1504) (_values!4241 thiss!1504) (mask!10126 thiss!1504) (extraKeys!3995 thiss!1504) (zeroValue!4099 thiss!1504) (minValue!4099 thiss!1504) key!932 (defaultEntry!4258 thiss!1504)))))

(assert (=> b!228178 false))

(declare-fun b!228179 () Bool)

(declare-fun res!112315 () Bool)

(assert (=> b!228179 (=> res!112315 e!148031)))

(assert (=> b!228179 (= res!112315 (or (not (= (size!5659 (_values!4241 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10126 thiss!1504)))) (not (= (size!5660 (_keys!6312 thiss!1504)) (size!5659 (_values!4241 thiss!1504)))) (bvslt (mask!10126 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3995 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3995 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228180 () Bool)

(declare-fun e!148032 () Bool)

(assert (=> b!228180 (= e!148032 tp_is_empty!5985)))

(declare-fun mapNonEmpty!10147 () Bool)

(declare-fun tp!21510 () Bool)

(assert (=> mapNonEmpty!10147 (= mapRes!10147 (and tp!21510 e!148032))))

(declare-fun mapRest!10147 () (Array (_ BitVec 32) ValueCell!2649))

(declare-fun mapKey!10147 () (_ BitVec 32))

(declare-fun mapValue!10147 () ValueCell!2649)

(assert (=> mapNonEmpty!10147 (= (arr!5326 (_values!4241 thiss!1504)) (store mapRest!10147 mapKey!10147 mapValue!10147))))

(declare-fun b!228181 () Bool)

(assert (=> b!228181 (= e!148034 (not call!21203))))

(assert (= (and start!22056 res!112312) b!228173))

(assert (= (and b!228173 res!112314) b!228167))

(assert (= (and b!228167 res!112305) b!228171))

(assert (= (and b!228171 c!37836) b!228178))

(assert (= (and b!228171 (not c!37836)) b!228164))

(assert (= (and b!228164 c!37835) b!228177))

(assert (= (and b!228164 (not c!37835)) b!228161))

(assert (= (and b!228177 res!112309) b!228168))

(assert (= (and b!228168 res!112306) b!228181))

(assert (= (and b!228161 c!37833) b!228175))

(assert (= (and b!228161 (not c!37833)) b!228159))

(assert (= (and b!228175 res!112308) b!228160))

(assert (= (and b!228160 res!112307) b!228162))

(assert (= (or b!228177 b!228175) bm!21200))

(assert (= (or b!228181 b!228162) bm!21201))

(assert (= (and b!228171 res!112310) b!228172))

(assert (= (and b!228172 c!37834) b!228176))

(assert (= (and b!228172 (not c!37834)) b!228163))

(assert (= (and b!228172 (not res!112313)) b!228179))

(assert (= (and b!228179 (not res!112315)) b!228169))

(assert (= (and b!228169 (not res!112311)) b!228166))

(assert (= (and b!228170 condMapEmpty!10147) mapIsEmpty!10147))

(assert (= (and b!228170 (not condMapEmpty!10147)) mapNonEmpty!10147))

(assert (= (and mapNonEmpty!10147 ((_ is ValueCellFull!2649) mapValue!10147)) b!228180))

(assert (= (and b!228170 ((_ is ValueCellFull!2649) mapDefault!10147)) b!228165))

(assert (= b!228174 b!228170))

(assert (= start!22056 b!228174))

(declare-fun m!249987 () Bool)

(assert (=> mapNonEmpty!10147 m!249987))

(declare-fun m!249989 () Bool)

(assert (=> b!228178 m!249989))

(declare-fun m!249991 () Bool)

(assert (=> b!228168 m!249991))

(declare-fun m!249993 () Bool)

(assert (=> b!228166 m!249993))

(declare-fun m!249995 () Bool)

(assert (=> b!228160 m!249995))

(declare-fun m!249997 () Bool)

(assert (=> b!228167 m!249997))

(declare-fun m!249999 () Bool)

(assert (=> start!22056 m!249999))

(declare-fun m!250001 () Bool)

(assert (=> bm!21200 m!250001))

(declare-fun m!250003 () Bool)

(assert (=> b!228172 m!250003))

(declare-fun m!250005 () Bool)

(assert (=> b!228172 m!250005))

(declare-fun m!250007 () Bool)

(assert (=> b!228172 m!250007))

(declare-fun m!250009 () Bool)

(assert (=> b!228172 m!250009))

(declare-fun m!250011 () Bool)

(assert (=> b!228172 m!250011))

(declare-fun m!250013 () Bool)

(assert (=> b!228172 m!250013))

(declare-fun m!250015 () Bool)

(assert (=> b!228172 m!250015))

(declare-fun m!250017 () Bool)

(assert (=> b!228172 m!250017))

(declare-fun m!250019 () Bool)

(assert (=> b!228172 m!250019))

(declare-fun m!250021 () Bool)

(assert (=> b!228172 m!250021))

(declare-fun m!250023 () Bool)

(assert (=> b!228164 m!250023))

(declare-fun m!250025 () Bool)

(assert (=> b!228169 m!250025))

(declare-fun m!250027 () Bool)

(assert (=> b!228174 m!250027))

(declare-fun m!250029 () Bool)

(assert (=> b!228174 m!250029))

(declare-fun m!250031 () Bool)

(assert (=> b!228171 m!250031))

(declare-fun m!250033 () Bool)

(assert (=> b!228171 m!250033))

(assert (=> b!228171 m!250033))

(declare-fun m!250035 () Bool)

(assert (=> b!228171 m!250035))

(declare-fun m!250037 () Bool)

(assert (=> b!228176 m!250037))

(assert (=> bm!21201 m!250005))

(check-sat (not b!228167) (not b!228172) (not bm!21201) b_and!13021 (not mapNonEmpty!10147) (not start!22056) (not bm!21200) (not b!228166) (not b!228174) (not b!228169) (not b!228171) (not b!228176) tp_is_empty!5985 (not b!228178) (not b_next!6123) (not b!228164))
(check-sat b_and!13021 (not b_next!6123))
