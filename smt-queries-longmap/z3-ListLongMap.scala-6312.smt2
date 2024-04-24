; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81078 () Bool)

(assert start!81078)

(declare-fun b!948921 () Bool)

(declare-fun b_free!18193 () Bool)

(declare-fun b_next!18193 () Bool)

(assert (=> b!948921 (= b_free!18193 (not b_next!18193))))

(declare-fun tp!63151 () Bool)

(declare-fun b_and!29629 () Bool)

(assert (=> b!948921 (= tp!63151 b_and!29629)))

(declare-fun b!948913 () Bool)

(declare-fun e!534227 () Bool)

(declare-datatypes ((V!32567 0))(
  ( (V!32568 (val!10401 Int)) )
))
(declare-datatypes ((ValueCell!9869 0))(
  ( (ValueCellFull!9869 (v!12934 V!32567)) (EmptyCell!9869) )
))
(declare-datatypes ((array!57457 0))(
  ( (array!57458 (arr!27631 (Array (_ BitVec 32) ValueCell!9869)) (size!28105 (_ BitVec 32))) )
))
(declare-datatypes ((array!57459 0))(
  ( (array!57460 (arr!27632 (Array (_ BitVec 32) (_ BitVec 64))) (size!28106 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4888 0))(
  ( (LongMapFixedSize!4889 (defaultEntry!5744 Int) (mask!27539 (_ BitVec 32)) (extraKeys!5476 (_ BitVec 32)) (zeroValue!5580 V!32567) (minValue!5580 V!32567) (_size!2499 (_ BitVec 32)) (_keys!10687 array!57459) (_values!5767 array!57457) (_vacant!2499 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4888)

(assert (=> b!948913 (= e!534227 (not (= (size!28105 (_values!5767 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27539 thiss!1141)))))))

(declare-fun b!948914 () Bool)

(declare-fun e!534232 () Bool)

(declare-fun e!534230 () Bool)

(declare-fun mapRes!32938 () Bool)

(assert (=> b!948914 (= e!534232 (and e!534230 mapRes!32938))))

(declare-fun condMapEmpty!32938 () Bool)

(declare-fun mapDefault!32938 () ValueCell!9869)

(assert (=> b!948914 (= condMapEmpty!32938 (= (arr!27631 (_values!5767 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9869)) mapDefault!32938)))))

(declare-fun res!636459 () Bool)

(assert (=> start!81078 (=> (not res!636459) (not e!534227))))

(declare-fun valid!1875 (LongMapFixedSize!4888) Bool)

(assert (=> start!81078 (= res!636459 (valid!1875 thiss!1141))))

(assert (=> start!81078 e!534227))

(declare-fun e!534231 () Bool)

(assert (=> start!81078 e!534231))

(assert (=> start!81078 true))

(declare-fun mapIsEmpty!32938 () Bool)

(assert (=> mapIsEmpty!32938 mapRes!32938))

(declare-fun b!948915 () Bool)

(declare-fun res!636460 () Bool)

(assert (=> b!948915 (=> (not res!636460) (not e!534227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948915 (= res!636460 (validMask!0 (mask!27539 thiss!1141)))))

(declare-fun b!948916 () Bool)

(declare-fun res!636457 () Bool)

(assert (=> b!948916 (=> (not res!636457) (not e!534227))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!948916 (= res!636457 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32938 () Bool)

(declare-fun tp!63150 () Bool)

(declare-fun e!534229 () Bool)

(assert (=> mapNonEmpty!32938 (= mapRes!32938 (and tp!63150 e!534229))))

(declare-fun mapValue!32938 () ValueCell!9869)

(declare-fun mapRest!32938 () (Array (_ BitVec 32) ValueCell!9869))

(declare-fun mapKey!32938 () (_ BitVec 32))

(assert (=> mapNonEmpty!32938 (= (arr!27631 (_values!5767 thiss!1141)) (store mapRest!32938 mapKey!32938 mapValue!32938))))

(declare-fun b!948917 () Bool)

(declare-fun tp_is_empty!20701 () Bool)

(assert (=> b!948917 (= e!534230 tp_is_empty!20701)))

(declare-fun b!948918 () Bool)

(assert (=> b!948918 (= e!534229 tp_is_empty!20701)))

(declare-fun b!948919 () Bool)

(declare-fun res!636456 () Bool)

(assert (=> b!948919 (=> (not res!636456) (not e!534227))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9087 0))(
  ( (MissingZero!9087 (index!38719 (_ BitVec 32))) (Found!9087 (index!38720 (_ BitVec 32))) (Intermediate!9087 (undefined!9899 Bool) (index!38721 (_ BitVec 32)) (x!81553 (_ BitVec 32))) (Undefined!9087) (MissingVacant!9087 (index!38722 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57459 (_ BitVec 32)) SeekEntryResult!9087)

(assert (=> b!948919 (= res!636456 (not ((_ is Found!9087) (seekEntry!0 key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))))

(declare-fun b!948920 () Bool)

(declare-fun res!636458 () Bool)

(assert (=> b!948920 (=> (not res!636458) (not e!534227))))

(declare-datatypes ((tuple2!13502 0))(
  ( (tuple2!13503 (_1!6762 (_ BitVec 64)) (_2!6762 V!32567)) )
))
(declare-datatypes ((List!19302 0))(
  ( (Nil!19299) (Cons!19298 (h!20460 tuple2!13502) (t!27619 List!19302)) )
))
(declare-datatypes ((ListLongMap!12201 0))(
  ( (ListLongMap!12202 (toList!6116 List!19302)) )
))
(declare-fun contains!5209 (ListLongMap!12201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3349 (array!57459 array!57457 (_ BitVec 32) (_ BitVec 32) V!32567 V!32567 (_ BitVec 32) Int) ListLongMap!12201)

(assert (=> b!948920 (= res!636458 (contains!5209 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) key!756))))

(declare-fun array_inv!21538 (array!57459) Bool)

(declare-fun array_inv!21539 (array!57457) Bool)

(assert (=> b!948921 (= e!534231 (and tp!63151 tp_is_empty!20701 (array_inv!21538 (_keys!10687 thiss!1141)) (array_inv!21539 (_values!5767 thiss!1141)) e!534232))))

(assert (= (and start!81078 res!636459) b!948916))

(assert (= (and b!948916 res!636457) b!948919))

(assert (= (and b!948919 res!636456) b!948920))

(assert (= (and b!948920 res!636458) b!948915))

(assert (= (and b!948915 res!636460) b!948913))

(assert (= (and b!948914 condMapEmpty!32938) mapIsEmpty!32938))

(assert (= (and b!948914 (not condMapEmpty!32938)) mapNonEmpty!32938))

(assert (= (and mapNonEmpty!32938 ((_ is ValueCellFull!9869) mapValue!32938)) b!948918))

(assert (= (and b!948914 ((_ is ValueCellFull!9869) mapDefault!32938)) b!948917))

(assert (= b!948921 b!948914))

(assert (= start!81078 b!948921))

(declare-fun m!882123 () Bool)

(assert (=> mapNonEmpty!32938 m!882123))

(declare-fun m!882125 () Bool)

(assert (=> b!948915 m!882125))

(declare-fun m!882127 () Bool)

(assert (=> b!948920 m!882127))

(assert (=> b!948920 m!882127))

(declare-fun m!882129 () Bool)

(assert (=> b!948920 m!882129))

(declare-fun m!882131 () Bool)

(assert (=> start!81078 m!882131))

(declare-fun m!882133 () Bool)

(assert (=> b!948921 m!882133))

(declare-fun m!882135 () Bool)

(assert (=> b!948921 m!882135))

(declare-fun m!882137 () Bool)

(assert (=> b!948919 m!882137))

(check-sat tp_is_empty!20701 (not b_next!18193) (not b!948920) (not b!948915) (not mapNonEmpty!32938) (not start!81078) b_and!29629 (not b!948921) (not b!948919))
(check-sat b_and!29629 (not b_next!18193))
(get-model)

(declare-fun b!948988 () Bool)

(declare-fun c!99067 () Bool)

(declare-fun lt!427213 () (_ BitVec 64))

(assert (=> b!948988 (= c!99067 (= lt!427213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534275 () SeekEntryResult!9087)

(declare-fun e!534276 () SeekEntryResult!9087)

(assert (=> b!948988 (= e!534275 e!534276)))

(declare-fun b!948989 () Bool)

(declare-fun lt!427214 () SeekEntryResult!9087)

(assert (=> b!948989 (= e!534276 (ite ((_ is MissingVacant!9087) lt!427214) (MissingZero!9087 (index!38722 lt!427214)) lt!427214))))

(declare-fun lt!427212 () SeekEntryResult!9087)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57459 (_ BitVec 32)) SeekEntryResult!9087)

(assert (=> b!948989 (= lt!427214 (seekKeyOrZeroReturnVacant!0 (x!81553 lt!427212) (index!38721 lt!427212) (index!38721 lt!427212) key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))

(declare-fun b!948990 () Bool)

(assert (=> b!948990 (= e!534275 (Found!9087 (index!38721 lt!427212)))))

(declare-fun b!948991 () Bool)

(declare-fun e!534277 () SeekEntryResult!9087)

(assert (=> b!948991 (= e!534277 Undefined!9087)))

(declare-fun d!115073 () Bool)

(declare-fun lt!427211 () SeekEntryResult!9087)

(assert (=> d!115073 (and (or ((_ is MissingVacant!9087) lt!427211) (not ((_ is Found!9087) lt!427211)) (and (bvsge (index!38720 lt!427211) #b00000000000000000000000000000000) (bvslt (index!38720 lt!427211) (size!28106 (_keys!10687 thiss!1141))))) (not ((_ is MissingVacant!9087) lt!427211)) (or (not ((_ is Found!9087) lt!427211)) (= (select (arr!27632 (_keys!10687 thiss!1141)) (index!38720 lt!427211)) key!756)))))

(assert (=> d!115073 (= lt!427211 e!534277)))

(declare-fun c!99069 () Bool)

(assert (=> d!115073 (= c!99069 (and ((_ is Intermediate!9087) lt!427212) (undefined!9899 lt!427212)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57459 (_ BitVec 32)) SeekEntryResult!9087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115073 (= lt!427212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27539 thiss!1141)) key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))

(assert (=> d!115073 (validMask!0 (mask!27539 thiss!1141))))

(assert (=> d!115073 (= (seekEntry!0 key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)) lt!427211)))

(declare-fun b!948992 () Bool)

(assert (=> b!948992 (= e!534276 (MissingZero!9087 (index!38721 lt!427212)))))

(declare-fun b!948993 () Bool)

(assert (=> b!948993 (= e!534277 e!534275)))

(assert (=> b!948993 (= lt!427213 (select (arr!27632 (_keys!10687 thiss!1141)) (index!38721 lt!427212)))))

(declare-fun c!99068 () Bool)

(assert (=> b!948993 (= c!99068 (= lt!427213 key!756))))

(assert (= (and d!115073 c!99069) b!948991))

(assert (= (and d!115073 (not c!99069)) b!948993))

(assert (= (and b!948993 c!99068) b!948990))

(assert (= (and b!948993 (not c!99068)) b!948988))

(assert (= (and b!948988 c!99067) b!948992))

(assert (= (and b!948988 (not c!99067)) b!948989))

(declare-fun m!882171 () Bool)

(assert (=> b!948989 m!882171))

(declare-fun m!882173 () Bool)

(assert (=> d!115073 m!882173))

(declare-fun m!882175 () Bool)

(assert (=> d!115073 m!882175))

(assert (=> d!115073 m!882175))

(declare-fun m!882177 () Bool)

(assert (=> d!115073 m!882177))

(assert (=> d!115073 m!882125))

(declare-fun m!882179 () Bool)

(assert (=> b!948993 m!882179))

(assert (=> b!948919 d!115073))

(declare-fun d!115075 () Bool)

(declare-fun e!534283 () Bool)

(assert (=> d!115075 e!534283))

(declare-fun res!636493 () Bool)

(assert (=> d!115075 (=> res!636493 e!534283)))

(declare-fun lt!427224 () Bool)

(assert (=> d!115075 (= res!636493 (not lt!427224))))

(declare-fun lt!427226 () Bool)

(assert (=> d!115075 (= lt!427224 lt!427226)))

(declare-datatypes ((Unit!31926 0))(
  ( (Unit!31927) )
))
(declare-fun lt!427225 () Unit!31926)

(declare-fun e!534282 () Unit!31926)

(assert (=> d!115075 (= lt!427225 e!534282)))

(declare-fun c!99072 () Bool)

(assert (=> d!115075 (= c!99072 lt!427226)))

(declare-fun containsKey!459 (List!19302 (_ BitVec 64)) Bool)

(assert (=> d!115075 (= lt!427226 (containsKey!459 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(assert (=> d!115075 (= (contains!5209 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) key!756) lt!427224)))

(declare-fun b!949000 () Bool)

(declare-fun lt!427223 () Unit!31926)

(assert (=> b!949000 (= e!534282 lt!427223)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!353 (List!19302 (_ BitVec 64)) Unit!31926)

(assert (=> b!949000 (= lt!427223 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-datatypes ((Option!494 0))(
  ( (Some!493 (v!12937 V!32567)) (None!492) )
))
(declare-fun isDefined!361 (Option!494) Bool)

(declare-fun getValueByKey!488 (List!19302 (_ BitVec 64)) Option!494)

(assert (=> b!949000 (isDefined!361 (getValueByKey!488 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-fun b!949001 () Bool)

(declare-fun Unit!31928 () Unit!31926)

(assert (=> b!949001 (= e!534282 Unit!31928)))

(declare-fun b!949002 () Bool)

(assert (=> b!949002 (= e!534283 (isDefined!361 (getValueByKey!488 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756)))))

(assert (= (and d!115075 c!99072) b!949000))

(assert (= (and d!115075 (not c!99072)) b!949001))

(assert (= (and d!115075 (not res!636493)) b!949002))

(declare-fun m!882181 () Bool)

(assert (=> d!115075 m!882181))

(declare-fun m!882183 () Bool)

(assert (=> b!949000 m!882183))

(declare-fun m!882185 () Bool)

(assert (=> b!949000 m!882185))

(assert (=> b!949000 m!882185))

(declare-fun m!882187 () Bool)

(assert (=> b!949000 m!882187))

(assert (=> b!949002 m!882185))

(assert (=> b!949002 m!882185))

(assert (=> b!949002 m!882187))

(assert (=> b!948920 d!115075))

(declare-fun b!949045 () Bool)

(declare-fun e!534322 () ListLongMap!12201)

(declare-fun call!41231 () ListLongMap!12201)

(declare-fun +!2866 (ListLongMap!12201 tuple2!13502) ListLongMap!12201)

(assert (=> b!949045 (= e!534322 (+!2866 call!41231 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))

(declare-fun b!949046 () Bool)

(declare-fun e!534314 () Bool)

(declare-fun lt!427284 () ListLongMap!12201)

(declare-fun apply!880 (ListLongMap!12201 (_ BitVec 64)) V!32567)

(declare-fun get!14523 (ValueCell!9869 V!32567) V!32567)

(declare-fun dynLambda!1663 (Int (_ BitVec 64)) V!32567)

(assert (=> b!949046 (= e!534314 (= (apply!880 lt!427284 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)) (get!14523 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28105 (_values!5767 thiss!1141))))))

(assert (=> b!949046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun b!949047 () Bool)

(declare-fun e!534311 () Unit!31926)

(declare-fun lt!427286 () Unit!31926)

(assert (=> b!949047 (= e!534311 lt!427286)))

(declare-fun lt!427273 () ListLongMap!12201)

(declare-fun getCurrentListMapNoExtraKeys!3354 (array!57459 array!57457 (_ BitVec 32) (_ BitVec 32) V!32567 V!32567 (_ BitVec 32) Int) ListLongMap!12201)

(assert (=> b!949047 (= lt!427273 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!427285 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427292 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427292 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427282 () Unit!31926)

(declare-fun addStillContains!569 (ListLongMap!12201 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31926)

(assert (=> b!949047 (= lt!427282 (addStillContains!569 lt!427273 lt!427285 (zeroValue!5580 thiss!1141) lt!427292))))

(assert (=> b!949047 (contains!5209 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))) lt!427292)))

(declare-fun lt!427277 () Unit!31926)

(assert (=> b!949047 (= lt!427277 lt!427282)))

(declare-fun lt!427288 () ListLongMap!12201)

(assert (=> b!949047 (= lt!427288 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!427280 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427280 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427291 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427291 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427272 () Unit!31926)

(declare-fun addApplyDifferent!450 (ListLongMap!12201 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31926)

(assert (=> b!949047 (= lt!427272 (addApplyDifferent!450 lt!427288 lt!427280 (minValue!5580 thiss!1141) lt!427291))))

(assert (=> b!949047 (= (apply!880 (+!2866 lt!427288 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))) lt!427291) (apply!880 lt!427288 lt!427291))))

(declare-fun lt!427276 () Unit!31926)

(assert (=> b!949047 (= lt!427276 lt!427272)))

(declare-fun lt!427275 () ListLongMap!12201)

(assert (=> b!949047 (= lt!427275 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!427271 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427290 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427290 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427281 () Unit!31926)

(assert (=> b!949047 (= lt!427281 (addApplyDifferent!450 lt!427275 lt!427271 (zeroValue!5580 thiss!1141) lt!427290))))

(assert (=> b!949047 (= (apply!880 (+!2866 lt!427275 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))) lt!427290) (apply!880 lt!427275 lt!427290))))

(declare-fun lt!427287 () Unit!31926)

(assert (=> b!949047 (= lt!427287 lt!427281)))

(declare-fun lt!427283 () ListLongMap!12201)

(assert (=> b!949047 (= lt!427283 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun lt!427274 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427274 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427279 () (_ BitVec 64))

(assert (=> b!949047 (= lt!427279 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949047 (= lt!427286 (addApplyDifferent!450 lt!427283 lt!427274 (minValue!5580 thiss!1141) lt!427279))))

(assert (=> b!949047 (= (apply!880 (+!2866 lt!427283 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))) lt!427279) (apply!880 lt!427283 lt!427279))))

(declare-fun b!949048 () Bool)

(declare-fun e!534320 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949048 (= e!534320 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949049 () Bool)

(declare-fun res!636513 () Bool)

(declare-fun e!534318 () Bool)

(assert (=> b!949049 (=> (not res!636513) (not e!534318))))

(declare-fun e!534312 () Bool)

(assert (=> b!949049 (= res!636513 e!534312)))

(declare-fun res!636514 () Bool)

(assert (=> b!949049 (=> res!636514 e!534312)))

(assert (=> b!949049 (= res!636514 (not e!534320))))

(declare-fun res!636517 () Bool)

(assert (=> b!949049 (=> (not res!636517) (not e!534320))))

(assert (=> b!949049 (= res!636517 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun bm!41223 () Bool)

(declare-fun call!41228 () Bool)

(assert (=> bm!41223 (= call!41228 (contains!5209 lt!427284 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949050 () Bool)

(declare-fun Unit!31929 () Unit!31926)

(assert (=> b!949050 (= e!534311 Unit!31929)))

(declare-fun b!949051 () Bool)

(declare-fun e!534315 () ListLongMap!12201)

(declare-fun call!41230 () ListLongMap!12201)

(assert (=> b!949051 (= e!534315 call!41230)))

(declare-fun bm!41224 () Bool)

(declare-fun call!41232 () ListLongMap!12201)

(assert (=> bm!41224 (= call!41232 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))

(declare-fun bm!41225 () Bool)

(assert (=> bm!41225 (= call!41230 call!41231)))

(declare-fun b!949052 () Bool)

(declare-fun e!534310 () ListLongMap!12201)

(declare-fun call!41229 () ListLongMap!12201)

(assert (=> b!949052 (= e!534310 call!41229)))

(declare-fun b!949053 () Bool)

(assert (=> b!949053 (= e!534310 call!41230)))

(declare-fun b!949054 () Bool)

(declare-fun e!534313 () Bool)

(declare-fun e!534321 () Bool)

(assert (=> b!949054 (= e!534313 e!534321)))

(declare-fun res!636518 () Bool)

(assert (=> b!949054 (= res!636518 call!41228)))

(assert (=> b!949054 (=> (not res!636518) (not e!534321))))

(declare-fun d!115077 () Bool)

(assert (=> d!115077 e!534318))

(declare-fun res!636520 () Bool)

(assert (=> d!115077 (=> (not res!636520) (not e!534318))))

(assert (=> d!115077 (= res!636520 (or (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))))

(declare-fun lt!427289 () ListLongMap!12201)

(assert (=> d!115077 (= lt!427284 lt!427289)))

(declare-fun lt!427278 () Unit!31926)

(assert (=> d!115077 (= lt!427278 e!534311)))

(declare-fun c!99088 () Bool)

(declare-fun e!534316 () Bool)

(assert (=> d!115077 (= c!99088 e!534316)))

(declare-fun res!636515 () Bool)

(assert (=> d!115077 (=> (not res!636515) (not e!534316))))

(assert (=> d!115077 (= res!636515 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> d!115077 (= lt!427289 e!534322)))

(declare-fun c!99085 () Bool)

(assert (=> d!115077 (= c!99085 (and (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115077 (validMask!0 (mask!27539 thiss!1141))))

(assert (=> d!115077 (= (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) lt!427284)))

(declare-fun bm!41226 () Bool)

(declare-fun call!41226 () ListLongMap!12201)

(assert (=> bm!41226 (= call!41226 call!41232)))

(declare-fun b!949055 () Bool)

(assert (=> b!949055 (= e!534318 e!534313)))

(declare-fun c!99087 () Bool)

(assert (=> b!949055 (= c!99087 (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949056 () Bool)

(assert (=> b!949056 (= e!534313 (not call!41228))))

(declare-fun b!949057 () Bool)

(declare-fun res!636516 () Bool)

(assert (=> b!949057 (=> (not res!636516) (not e!534318))))

(declare-fun e!534317 () Bool)

(assert (=> b!949057 (= res!636516 e!534317)))

(declare-fun c!99086 () Bool)

(assert (=> b!949057 (= c!99086 (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!949058 () Bool)

(declare-fun c!99089 () Bool)

(assert (=> b!949058 (= c!99089 (and (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!949058 (= e!534315 e!534310)))

(declare-fun bm!41227 () Bool)

(assert (=> bm!41227 (= call!41229 call!41226)))

(declare-fun b!949059 () Bool)

(assert (=> b!949059 (= e!534316 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41228 () Bool)

(declare-fun call!41227 () Bool)

(assert (=> bm!41228 (= call!41227 (contains!5209 lt!427284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949060 () Bool)

(assert (=> b!949060 (= e!534321 (= (apply!880 lt!427284 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5580 thiss!1141)))))

(declare-fun b!949061 () Bool)

(assert (=> b!949061 (= e!534322 e!534315)))

(declare-fun c!99090 () Bool)

(assert (=> b!949061 (= c!99090 (and (not (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5476 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41229 () Bool)

(assert (=> bm!41229 (= call!41231 (+!2866 (ite c!99085 call!41232 (ite c!99090 call!41226 call!41229)) (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(declare-fun b!949062 () Bool)

(assert (=> b!949062 (= e!534317 (not call!41227))))

(declare-fun b!949063 () Bool)

(assert (=> b!949063 (= e!534312 e!534314)))

(declare-fun res!636512 () Bool)

(assert (=> b!949063 (=> (not res!636512) (not e!534314))))

(assert (=> b!949063 (= res!636512 (contains!5209 lt!427284 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun b!949064 () Bool)

(declare-fun e!534319 () Bool)

(assert (=> b!949064 (= e!534319 (= (apply!880 lt!427284 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5580 thiss!1141)))))

(declare-fun b!949065 () Bool)

(assert (=> b!949065 (= e!534317 e!534319)))

(declare-fun res!636519 () Bool)

(assert (=> b!949065 (= res!636519 call!41227)))

(assert (=> b!949065 (=> (not res!636519) (not e!534319))))

(assert (= (and d!115077 c!99085) b!949045))

(assert (= (and d!115077 (not c!99085)) b!949061))

(assert (= (and b!949061 c!99090) b!949051))

(assert (= (and b!949061 (not c!99090)) b!949058))

(assert (= (and b!949058 c!99089) b!949053))

(assert (= (and b!949058 (not c!99089)) b!949052))

(assert (= (or b!949053 b!949052) bm!41227))

(assert (= (or b!949051 bm!41227) bm!41226))

(assert (= (or b!949051 b!949053) bm!41225))

(assert (= (or b!949045 bm!41226) bm!41224))

(assert (= (or b!949045 bm!41225) bm!41229))

(assert (= (and d!115077 res!636515) b!949059))

(assert (= (and d!115077 c!99088) b!949047))

(assert (= (and d!115077 (not c!99088)) b!949050))

(assert (= (and d!115077 res!636520) b!949049))

(assert (= (and b!949049 res!636517) b!949048))

(assert (= (and b!949049 (not res!636514)) b!949063))

(assert (= (and b!949063 res!636512) b!949046))

(assert (= (and b!949049 res!636513) b!949057))

(assert (= (and b!949057 c!99086) b!949065))

(assert (= (and b!949057 (not c!99086)) b!949062))

(assert (= (and b!949065 res!636519) b!949064))

(assert (= (or b!949065 b!949062) bm!41228))

(assert (= (and b!949057 res!636516) b!949055))

(assert (= (and b!949055 c!99087) b!949054))

(assert (= (and b!949055 (not c!99087)) b!949056))

(assert (= (and b!949054 res!636518) b!949060))

(assert (= (or b!949054 b!949056) bm!41223))

(declare-fun b_lambda!14321 () Bool)

(assert (=> (not b_lambda!14321) (not b!949046)))

(declare-fun t!27622 () Bool)

(declare-fun tb!6169 () Bool)

(assert (=> (and b!948921 (= (defaultEntry!5744 thiss!1141) (defaultEntry!5744 thiss!1141)) t!27622) tb!6169))

(declare-fun result!12245 () Bool)

(assert (=> tb!6169 (= result!12245 tp_is_empty!20701)))

(assert (=> b!949046 t!27622))

(declare-fun b_and!29635 () Bool)

(assert (= b_and!29629 (and (=> t!27622 result!12245) b_and!29635)))

(declare-fun m!882189 () Bool)

(assert (=> b!949064 m!882189))

(declare-fun m!882191 () Bool)

(assert (=> b!949059 m!882191))

(assert (=> b!949059 m!882191))

(declare-fun m!882193 () Bool)

(assert (=> b!949059 m!882193))

(assert (=> d!115077 m!882125))

(declare-fun m!882195 () Bool)

(assert (=> b!949060 m!882195))

(declare-fun m!882197 () Bool)

(assert (=> bm!41223 m!882197))

(assert (=> b!949063 m!882191))

(assert (=> b!949063 m!882191))

(declare-fun m!882199 () Bool)

(assert (=> b!949063 m!882199))

(assert (=> b!949046 m!882191))

(declare-fun m!882201 () Bool)

(assert (=> b!949046 m!882201))

(declare-fun m!882203 () Bool)

(assert (=> b!949046 m!882203))

(declare-fun m!882205 () Bool)

(assert (=> b!949046 m!882205))

(assert (=> b!949046 m!882205))

(assert (=> b!949046 m!882203))

(declare-fun m!882207 () Bool)

(assert (=> b!949046 m!882207))

(assert (=> b!949046 m!882191))

(declare-fun m!882209 () Bool)

(assert (=> bm!41229 m!882209))

(declare-fun m!882211 () Bool)

(assert (=> bm!41228 m!882211))

(declare-fun m!882213 () Bool)

(assert (=> b!949047 m!882213))

(declare-fun m!882215 () Bool)

(assert (=> b!949047 m!882215))

(declare-fun m!882217 () Bool)

(assert (=> b!949047 m!882217))

(declare-fun m!882219 () Bool)

(assert (=> b!949047 m!882219))

(assert (=> b!949047 m!882191))

(declare-fun m!882221 () Bool)

(assert (=> b!949047 m!882221))

(declare-fun m!882223 () Bool)

(assert (=> b!949047 m!882223))

(declare-fun m!882225 () Bool)

(assert (=> b!949047 m!882225))

(assert (=> b!949047 m!882221))

(declare-fun m!882227 () Bool)

(assert (=> b!949047 m!882227))

(declare-fun m!882229 () Bool)

(assert (=> b!949047 m!882229))

(declare-fun m!882231 () Bool)

(assert (=> b!949047 m!882231))

(declare-fun m!882233 () Bool)

(assert (=> b!949047 m!882233))

(declare-fun m!882235 () Bool)

(assert (=> b!949047 m!882235))

(declare-fun m!882237 () Bool)

(assert (=> b!949047 m!882237))

(assert (=> b!949047 m!882217))

(declare-fun m!882239 () Bool)

(assert (=> b!949047 m!882239))

(assert (=> b!949047 m!882237))

(declare-fun m!882241 () Bool)

(assert (=> b!949047 m!882241))

(assert (=> b!949047 m!882229))

(declare-fun m!882243 () Bool)

(assert (=> b!949047 m!882243))

(assert (=> b!949048 m!882191))

(assert (=> b!949048 m!882191))

(assert (=> b!949048 m!882193))

(assert (=> bm!41224 m!882233))

(declare-fun m!882245 () Bool)

(assert (=> b!949045 m!882245))

(assert (=> b!948920 d!115077))

(declare-fun d!115079 () Bool)

(declare-fun res!636527 () Bool)

(declare-fun e!534325 () Bool)

(assert (=> d!115079 (=> (not res!636527) (not e!534325))))

(declare-fun simpleValid!367 (LongMapFixedSize!4888) Bool)

(assert (=> d!115079 (= res!636527 (simpleValid!367 thiss!1141))))

(assert (=> d!115079 (= (valid!1875 thiss!1141) e!534325)))

(declare-fun b!949074 () Bool)

(declare-fun res!636528 () Bool)

(assert (=> b!949074 (=> (not res!636528) (not e!534325))))

(declare-fun arrayCountValidKeys!0 (array!57459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949074 (= res!636528 (= (arrayCountValidKeys!0 (_keys!10687 thiss!1141) #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))) (_size!2499 thiss!1141)))))

(declare-fun b!949075 () Bool)

(declare-fun res!636529 () Bool)

(assert (=> b!949075 (=> (not res!636529) (not e!534325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57459 (_ BitVec 32)) Bool)

(assert (=> b!949075 (= res!636529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))

(declare-fun b!949076 () Bool)

(declare-datatypes ((List!19304 0))(
  ( (Nil!19301) (Cons!19300 (h!20462 (_ BitVec 64)) (t!27623 List!19304)) )
))
(declare-fun arrayNoDuplicates!0 (array!57459 (_ BitVec 32) List!19304) Bool)

(assert (=> b!949076 (= e!534325 (arrayNoDuplicates!0 (_keys!10687 thiss!1141) #b00000000000000000000000000000000 Nil!19301))))

(assert (= (and d!115079 res!636527) b!949074))

(assert (= (and b!949074 res!636528) b!949075))

(assert (= (and b!949075 res!636529) b!949076))

(declare-fun m!882247 () Bool)

(assert (=> d!115079 m!882247))

(declare-fun m!882249 () Bool)

(assert (=> b!949074 m!882249))

(declare-fun m!882251 () Bool)

(assert (=> b!949075 m!882251))

(declare-fun m!882253 () Bool)

(assert (=> b!949076 m!882253))

(assert (=> start!81078 d!115079))

(declare-fun d!115081 () Bool)

(assert (=> d!115081 (= (validMask!0 (mask!27539 thiss!1141)) (and (or (= (mask!27539 thiss!1141) #b00000000000000000000000000000111) (= (mask!27539 thiss!1141) #b00000000000000000000000000001111) (= (mask!27539 thiss!1141) #b00000000000000000000000000011111) (= (mask!27539 thiss!1141) #b00000000000000000000000000111111) (= (mask!27539 thiss!1141) #b00000000000000000000000001111111) (= (mask!27539 thiss!1141) #b00000000000000000000000011111111) (= (mask!27539 thiss!1141) #b00000000000000000000000111111111) (= (mask!27539 thiss!1141) #b00000000000000000000001111111111) (= (mask!27539 thiss!1141) #b00000000000000000000011111111111) (= (mask!27539 thiss!1141) #b00000000000000000000111111111111) (= (mask!27539 thiss!1141) #b00000000000000000001111111111111) (= (mask!27539 thiss!1141) #b00000000000000000011111111111111) (= (mask!27539 thiss!1141) #b00000000000000000111111111111111) (= (mask!27539 thiss!1141) #b00000000000000001111111111111111) (= (mask!27539 thiss!1141) #b00000000000000011111111111111111) (= (mask!27539 thiss!1141) #b00000000000000111111111111111111) (= (mask!27539 thiss!1141) #b00000000000001111111111111111111) (= (mask!27539 thiss!1141) #b00000000000011111111111111111111) (= (mask!27539 thiss!1141) #b00000000000111111111111111111111) (= (mask!27539 thiss!1141) #b00000000001111111111111111111111) (= (mask!27539 thiss!1141) #b00000000011111111111111111111111) (= (mask!27539 thiss!1141) #b00000000111111111111111111111111) (= (mask!27539 thiss!1141) #b00000001111111111111111111111111) (= (mask!27539 thiss!1141) #b00000011111111111111111111111111) (= (mask!27539 thiss!1141) #b00000111111111111111111111111111) (= (mask!27539 thiss!1141) #b00001111111111111111111111111111) (= (mask!27539 thiss!1141) #b00011111111111111111111111111111) (= (mask!27539 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27539 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948915 d!115081))

(declare-fun d!115083 () Bool)

(assert (=> d!115083 (= (array_inv!21538 (_keys!10687 thiss!1141)) (bvsge (size!28106 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948921 d!115083))

(declare-fun d!115085 () Bool)

(assert (=> d!115085 (= (array_inv!21539 (_values!5767 thiss!1141)) (bvsge (size!28105 (_values!5767 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948921 d!115085))

(declare-fun b!949084 () Bool)

(declare-fun e!534331 () Bool)

(assert (=> b!949084 (= e!534331 tp_is_empty!20701)))

(declare-fun condMapEmpty!32947 () Bool)

(declare-fun mapDefault!32947 () ValueCell!9869)

(assert (=> mapNonEmpty!32938 (= condMapEmpty!32947 (= mapRest!32938 ((as const (Array (_ BitVec 32) ValueCell!9869)) mapDefault!32947)))))

(declare-fun mapRes!32947 () Bool)

(assert (=> mapNonEmpty!32938 (= tp!63150 (and e!534331 mapRes!32947))))

(declare-fun mapNonEmpty!32947 () Bool)

(declare-fun tp!63166 () Bool)

(declare-fun e!534330 () Bool)

(assert (=> mapNonEmpty!32947 (= mapRes!32947 (and tp!63166 e!534330))))

(declare-fun mapKey!32947 () (_ BitVec 32))

(declare-fun mapValue!32947 () ValueCell!9869)

(declare-fun mapRest!32947 () (Array (_ BitVec 32) ValueCell!9869))

(assert (=> mapNonEmpty!32947 (= mapRest!32938 (store mapRest!32947 mapKey!32947 mapValue!32947))))

(declare-fun b!949083 () Bool)

(assert (=> b!949083 (= e!534330 tp_is_empty!20701)))

(declare-fun mapIsEmpty!32947 () Bool)

(assert (=> mapIsEmpty!32947 mapRes!32947))

(assert (= (and mapNonEmpty!32938 condMapEmpty!32947) mapIsEmpty!32947))

(assert (= (and mapNonEmpty!32938 (not condMapEmpty!32947)) mapNonEmpty!32947))

(assert (= (and mapNonEmpty!32947 ((_ is ValueCellFull!9869) mapValue!32947)) b!949083))

(assert (= (and mapNonEmpty!32938 ((_ is ValueCellFull!9869) mapDefault!32947)) b!949084))

(declare-fun m!882255 () Bool)

(assert (=> mapNonEmpty!32947 m!882255))

(declare-fun b_lambda!14323 () Bool)

(assert (= b_lambda!14321 (or (and b!948921 b_free!18193) b_lambda!14323)))

(check-sat tp_is_empty!20701 (not d!115075) (not d!115079) (not bm!41229) (not bm!41223) (not d!115073) (not b!949074) (not b!949063) (not b!949048) (not b!949002) (not b!949076) (not d!115077) (not b!949000) (not b!949046) (not mapNonEmpty!32947) (not b!949045) (not b_lambda!14323) (not b_next!18193) (not b!949060) (not b!949059) (not b!949075) b_and!29635 (not b!949047) (not bm!41228) (not b!948989) (not b!949064) (not bm!41224))
(check-sat b_and!29635 (not b_next!18193))
(get-model)

(declare-fun d!115087 () Bool)

(assert (=> d!115087 (= (apply!880 (+!2866 lt!427275 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))) lt!427290) (apply!880 lt!427275 lt!427290))))

(declare-fun lt!427295 () Unit!31926)

(declare-fun choose!1578 (ListLongMap!12201 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31926)

(assert (=> d!115087 (= lt!427295 (choose!1578 lt!427275 lt!427271 (zeroValue!5580 thiss!1141) lt!427290))))

(declare-fun e!534334 () Bool)

(assert (=> d!115087 e!534334))

(declare-fun res!636532 () Bool)

(assert (=> d!115087 (=> (not res!636532) (not e!534334))))

(assert (=> d!115087 (= res!636532 (contains!5209 lt!427275 lt!427290))))

(assert (=> d!115087 (= (addApplyDifferent!450 lt!427275 lt!427271 (zeroValue!5580 thiss!1141) lt!427290) lt!427295)))

(declare-fun b!949088 () Bool)

(assert (=> b!949088 (= e!534334 (not (= lt!427290 lt!427271)))))

(assert (= (and d!115087 res!636532) b!949088))

(assert (=> d!115087 m!882229))

(assert (=> d!115087 m!882231))

(declare-fun m!882257 () Bool)

(assert (=> d!115087 m!882257))

(declare-fun m!882259 () Bool)

(assert (=> d!115087 m!882259))

(assert (=> d!115087 m!882213))

(assert (=> d!115087 m!882229))

(assert (=> b!949047 d!115087))

(declare-fun d!115089 () Bool)

(assert (=> d!115089 (contains!5209 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))) lt!427292)))

(declare-fun lt!427298 () Unit!31926)

(declare-fun choose!1579 (ListLongMap!12201 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31926)

(assert (=> d!115089 (= lt!427298 (choose!1579 lt!427273 lt!427285 (zeroValue!5580 thiss!1141) lt!427292))))

(assert (=> d!115089 (contains!5209 lt!427273 lt!427292)))

(assert (=> d!115089 (= (addStillContains!569 lt!427273 lt!427285 (zeroValue!5580 thiss!1141) lt!427292) lt!427298)))

(declare-fun bs!26657 () Bool)

(assert (= bs!26657 d!115089))

(assert (=> bs!26657 m!882217))

(assert (=> bs!26657 m!882217))

(assert (=> bs!26657 m!882239))

(declare-fun m!882261 () Bool)

(assert (=> bs!26657 m!882261))

(declare-fun m!882263 () Bool)

(assert (=> bs!26657 m!882263))

(assert (=> b!949047 d!115089))

(declare-fun d!115091 () Bool)

(declare-fun e!534337 () Bool)

(assert (=> d!115091 e!534337))

(declare-fun res!636537 () Bool)

(assert (=> d!115091 (=> (not res!636537) (not e!534337))))

(declare-fun lt!427309 () ListLongMap!12201)

(assert (=> d!115091 (= res!636537 (contains!5209 lt!427309 (_1!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))))))

(declare-fun lt!427307 () List!19302)

(assert (=> d!115091 (= lt!427309 (ListLongMap!12202 lt!427307))))

(declare-fun lt!427308 () Unit!31926)

(declare-fun lt!427310 () Unit!31926)

(assert (=> d!115091 (= lt!427308 lt!427310)))

(assert (=> d!115091 (= (getValueByKey!488 lt!427307 (_1!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!263 (List!19302 (_ BitVec 64) V!32567) Unit!31926)

(assert (=> d!115091 (= lt!427310 (lemmaContainsTupThenGetReturnValue!263 lt!427307 (_1!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))))))

(declare-fun insertStrictlySorted!320 (List!19302 (_ BitVec 64) V!32567) List!19302)

(assert (=> d!115091 (= lt!427307 (insertStrictlySorted!320 (toList!6116 lt!427288) (_1!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))))))

(assert (=> d!115091 (= (+!2866 lt!427288 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))) lt!427309)))

(declare-fun b!949094 () Bool)

(declare-fun res!636538 () Bool)

(assert (=> b!949094 (=> (not res!636538) (not e!534337))))

(assert (=> b!949094 (= res!636538 (= (getValueByKey!488 (toList!6116 lt!427309) (_1!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))))))))

(declare-fun b!949095 () Bool)

(declare-fun contains!5211 (List!19302 tuple2!13502) Bool)

(assert (=> b!949095 (= e!534337 (contains!5211 (toList!6116 lt!427309) (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))))))

(assert (= (and d!115091 res!636537) b!949094))

(assert (= (and b!949094 res!636538) b!949095))

(declare-fun m!882265 () Bool)

(assert (=> d!115091 m!882265))

(declare-fun m!882267 () Bool)

(assert (=> d!115091 m!882267))

(declare-fun m!882269 () Bool)

(assert (=> d!115091 m!882269))

(declare-fun m!882271 () Bool)

(assert (=> d!115091 m!882271))

(declare-fun m!882273 () Bool)

(assert (=> b!949094 m!882273))

(declare-fun m!882275 () Bool)

(assert (=> b!949095 m!882275))

(assert (=> b!949047 d!115091))

(declare-fun d!115093 () Bool)

(declare-fun e!534338 () Bool)

(assert (=> d!115093 e!534338))

(declare-fun res!636539 () Bool)

(assert (=> d!115093 (=> (not res!636539) (not e!534338))))

(declare-fun lt!427313 () ListLongMap!12201)

(assert (=> d!115093 (= res!636539 (contains!5209 lt!427313 (_1!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))))))

(declare-fun lt!427311 () List!19302)

(assert (=> d!115093 (= lt!427313 (ListLongMap!12202 lt!427311))))

(declare-fun lt!427312 () Unit!31926)

(declare-fun lt!427314 () Unit!31926)

(assert (=> d!115093 (= lt!427312 lt!427314)))

(assert (=> d!115093 (= (getValueByKey!488 lt!427311 (_1!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))))))

(assert (=> d!115093 (= lt!427314 (lemmaContainsTupThenGetReturnValue!263 lt!427311 (_1!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))))))

(assert (=> d!115093 (= lt!427311 (insertStrictlySorted!320 (toList!6116 lt!427283) (_1!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))))))

(assert (=> d!115093 (= (+!2866 lt!427283 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))) lt!427313)))

(declare-fun b!949096 () Bool)

(declare-fun res!636540 () Bool)

(assert (=> b!949096 (=> (not res!636540) (not e!534338))))

(assert (=> b!949096 (= res!636540 (= (getValueByKey!488 (toList!6116 lt!427313) (_1!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))))))))

(declare-fun b!949097 () Bool)

(assert (=> b!949097 (= e!534338 (contains!5211 (toList!6116 lt!427313) (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))))))

(assert (= (and d!115093 res!636539) b!949096))

(assert (= (and b!949096 res!636540) b!949097))

(declare-fun m!882277 () Bool)

(assert (=> d!115093 m!882277))

(declare-fun m!882279 () Bool)

(assert (=> d!115093 m!882279))

(declare-fun m!882281 () Bool)

(assert (=> d!115093 m!882281))

(declare-fun m!882283 () Bool)

(assert (=> d!115093 m!882283))

(declare-fun m!882285 () Bool)

(assert (=> b!949096 m!882285))

(declare-fun m!882287 () Bool)

(assert (=> b!949097 m!882287))

(assert (=> b!949047 d!115093))

(declare-fun d!115095 () Bool)

(declare-fun get!14524 (Option!494) V!32567)

(assert (=> d!115095 (= (apply!880 (+!2866 lt!427288 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))) lt!427291) (get!14524 (getValueByKey!488 (toList!6116 (+!2866 lt!427288 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141)))) lt!427291)))))

(declare-fun bs!26658 () Bool)

(assert (= bs!26658 d!115095))

(declare-fun m!882289 () Bool)

(assert (=> bs!26658 m!882289))

(assert (=> bs!26658 m!882289))

(declare-fun m!882291 () Bool)

(assert (=> bs!26658 m!882291))

(assert (=> b!949047 d!115095))

(declare-fun d!115097 () Bool)

(declare-fun e!534339 () Bool)

(assert (=> d!115097 e!534339))

(declare-fun res!636541 () Bool)

(assert (=> d!115097 (=> (not res!636541) (not e!534339))))

(declare-fun lt!427317 () ListLongMap!12201)

(assert (=> d!115097 (= res!636541 (contains!5209 lt!427317 (_1!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))))))

(declare-fun lt!427315 () List!19302)

(assert (=> d!115097 (= lt!427317 (ListLongMap!12202 lt!427315))))

(declare-fun lt!427316 () Unit!31926)

(declare-fun lt!427318 () Unit!31926)

(assert (=> d!115097 (= lt!427316 lt!427318)))

(assert (=> d!115097 (= (getValueByKey!488 lt!427315 (_1!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!115097 (= lt!427318 (lemmaContainsTupThenGetReturnValue!263 lt!427315 (_1!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!115097 (= lt!427315 (insertStrictlySorted!320 (toList!6116 lt!427273) (_1!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!115097 (= (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))) lt!427317)))

(declare-fun b!949098 () Bool)

(declare-fun res!636542 () Bool)

(assert (=> b!949098 (=> (not res!636542) (not e!534339))))

(assert (=> b!949098 (= res!636542 (= (getValueByKey!488 (toList!6116 lt!427317) (_1!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))))))))

(declare-fun b!949099 () Bool)

(assert (=> b!949099 (= e!534339 (contains!5211 (toList!6116 lt!427317) (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))))))

(assert (= (and d!115097 res!636541) b!949098))

(assert (= (and b!949098 res!636542) b!949099))

(declare-fun m!882293 () Bool)

(assert (=> d!115097 m!882293))

(declare-fun m!882295 () Bool)

(assert (=> d!115097 m!882295))

(declare-fun m!882297 () Bool)

(assert (=> d!115097 m!882297))

(declare-fun m!882299 () Bool)

(assert (=> d!115097 m!882299))

(declare-fun m!882301 () Bool)

(assert (=> b!949098 m!882301))

(declare-fun m!882303 () Bool)

(assert (=> b!949099 m!882303))

(assert (=> b!949047 d!115097))

(declare-fun d!115099 () Bool)

(assert (=> d!115099 (= (apply!880 lt!427275 lt!427290) (get!14524 (getValueByKey!488 (toList!6116 lt!427275) lt!427290)))))

(declare-fun bs!26659 () Bool)

(assert (= bs!26659 d!115099))

(declare-fun m!882305 () Bool)

(assert (=> bs!26659 m!882305))

(assert (=> bs!26659 m!882305))

(declare-fun m!882307 () Bool)

(assert (=> bs!26659 m!882307))

(assert (=> b!949047 d!115099))

(declare-fun d!115101 () Bool)

(assert (=> d!115101 (= (apply!880 (+!2866 lt!427275 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))) lt!427290) (get!14524 (getValueByKey!488 (toList!6116 (+!2866 lt!427275 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))) lt!427290)))))

(declare-fun bs!26660 () Bool)

(assert (= bs!26660 d!115101))

(declare-fun m!882309 () Bool)

(assert (=> bs!26660 m!882309))

(assert (=> bs!26660 m!882309))

(declare-fun m!882311 () Bool)

(assert (=> bs!26660 m!882311))

(assert (=> b!949047 d!115101))

(declare-fun b!949124 () Bool)

(declare-fun e!534356 () ListLongMap!12201)

(declare-fun call!41235 () ListLongMap!12201)

(assert (=> b!949124 (= e!534356 call!41235)))

(declare-fun b!949125 () Bool)

(declare-fun e!534359 () Bool)

(declare-fun e!534358 () Bool)

(assert (=> b!949125 (= e!534359 e!534358)))

(assert (=> b!949125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun res!636552 () Bool)

(declare-fun lt!427333 () ListLongMap!12201)

(assert (=> b!949125 (= res!636552 (contains!5209 lt!427333 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949125 (=> (not res!636552) (not e!534358))))

(declare-fun b!949126 () Bool)

(declare-fun e!534360 () Bool)

(assert (=> b!949126 (= e!534360 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949126 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!949127 () Bool)

(declare-fun lt!427338 () Unit!31926)

(declare-fun lt!427334 () Unit!31926)

(assert (=> b!949127 (= lt!427338 lt!427334)))

(declare-fun lt!427339 () (_ BitVec 64))

(declare-fun lt!427335 () (_ BitVec 64))

(declare-fun lt!427336 () ListLongMap!12201)

(declare-fun lt!427337 () V!32567)

(assert (=> b!949127 (not (contains!5209 (+!2866 lt!427336 (tuple2!13503 lt!427339 lt!427337)) lt!427335))))

(declare-fun addStillNotContains!225 (ListLongMap!12201 (_ BitVec 64) V!32567 (_ BitVec 64)) Unit!31926)

(assert (=> b!949127 (= lt!427334 (addStillNotContains!225 lt!427336 lt!427339 lt!427337 lt!427335))))

(assert (=> b!949127 (= lt!427335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!949127 (= lt!427337 (get!14523 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!949127 (= lt!427339 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949127 (= lt!427336 call!41235)))

(assert (=> b!949127 (= e!534356 (+!2866 call!41235 (tuple2!13503 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000) (get!14523 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!949128 () Bool)

(declare-fun e!534355 () ListLongMap!12201)

(assert (=> b!949128 (= e!534355 e!534356)))

(declare-fun c!99101 () Bool)

(assert (=> b!949128 (= c!99101 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949129 () Bool)

(declare-fun e!534357 () Bool)

(declare-fun isEmpty!710 (ListLongMap!12201) Bool)

(assert (=> b!949129 (= e!534357 (isEmpty!710 lt!427333))))

(declare-fun b!949130 () Bool)

(assert (=> b!949130 (= e!534357 (= lt!427333 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5744 thiss!1141))))))

(declare-fun b!949131 () Bool)

(declare-fun e!534354 () Bool)

(assert (=> b!949131 (= e!534354 e!534359)))

(declare-fun c!99099 () Bool)

(assert (=> b!949131 (= c!99099 e!534360)))

(declare-fun res!636551 () Bool)

(assert (=> b!949131 (=> (not res!636551) (not e!534360))))

(assert (=> b!949131 (= res!636551 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun bm!41232 () Bool)

(assert (=> bm!41232 (= call!41235 (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5744 thiss!1141)))))

(declare-fun b!949133 () Bool)

(declare-fun res!636553 () Bool)

(assert (=> b!949133 (=> (not res!636553) (not e!534354))))

(assert (=> b!949133 (= res!636553 (not (contains!5209 lt!427333 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949134 () Bool)

(assert (=> b!949134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> b!949134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28105 (_values!5767 thiss!1141))))))

(assert (=> b!949134 (= e!534358 (= (apply!880 lt!427333 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)) (get!14523 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949135 () Bool)

(assert (=> b!949135 (= e!534355 (ListLongMap!12202 Nil!19299))))

(declare-fun d!115103 () Bool)

(assert (=> d!115103 e!534354))

(declare-fun res!636554 () Bool)

(assert (=> d!115103 (=> (not res!636554) (not e!534354))))

(assert (=> d!115103 (= res!636554 (not (contains!5209 lt!427333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115103 (= lt!427333 e!534355)))

(declare-fun c!99102 () Bool)

(assert (=> d!115103 (= c!99102 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> d!115103 (validMask!0 (mask!27539 thiss!1141))))

(assert (=> d!115103 (= (getCurrentListMapNoExtraKeys!3354 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)) lt!427333)))

(declare-fun b!949132 () Bool)

(assert (=> b!949132 (= e!534359 e!534357)))

(declare-fun c!99100 () Bool)

(assert (=> b!949132 (= c!99100 (bvslt #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (= (and d!115103 c!99102) b!949135))

(assert (= (and d!115103 (not c!99102)) b!949128))

(assert (= (and b!949128 c!99101) b!949127))

(assert (= (and b!949128 (not c!99101)) b!949124))

(assert (= (or b!949127 b!949124) bm!41232))

(assert (= (and d!115103 res!636554) b!949133))

(assert (= (and b!949133 res!636553) b!949131))

(assert (= (and b!949131 res!636551) b!949126))

(assert (= (and b!949131 c!99099) b!949125))

(assert (= (and b!949131 (not c!99099)) b!949132))

(assert (= (and b!949125 res!636552) b!949134))

(assert (= (and b!949132 c!99100) b!949130))

(assert (= (and b!949132 (not c!99100)) b!949129))

(declare-fun b_lambda!14325 () Bool)

(assert (=> (not b_lambda!14325) (not b!949127)))

(assert (=> b!949127 t!27622))

(declare-fun b_and!29637 () Bool)

(assert (= b_and!29635 (and (=> t!27622 result!12245) b_and!29637)))

(declare-fun b_lambda!14327 () Bool)

(assert (=> (not b_lambda!14327) (not b!949134)))

(assert (=> b!949134 t!27622))

(declare-fun b_and!29639 () Bool)

(assert (= b_and!29637 (and (=> t!27622 result!12245) b_and!29639)))

(declare-fun m!882313 () Bool)

(assert (=> b!949133 m!882313))

(declare-fun m!882315 () Bool)

(assert (=> b!949130 m!882315))

(declare-fun m!882317 () Bool)

(assert (=> d!115103 m!882317))

(assert (=> d!115103 m!882125))

(assert (=> b!949126 m!882191))

(assert (=> b!949126 m!882191))

(assert (=> b!949126 m!882193))

(assert (=> b!949125 m!882191))

(assert (=> b!949125 m!882191))

(declare-fun m!882319 () Bool)

(assert (=> b!949125 m!882319))

(assert (=> bm!41232 m!882315))

(declare-fun m!882321 () Bool)

(assert (=> b!949127 m!882321))

(assert (=> b!949127 m!882205))

(assert (=> b!949127 m!882203))

(declare-fun m!882323 () Bool)

(assert (=> b!949127 m!882323))

(declare-fun m!882325 () Bool)

(assert (=> b!949127 m!882325))

(assert (=> b!949127 m!882191))

(assert (=> b!949127 m!882321))

(declare-fun m!882327 () Bool)

(assert (=> b!949127 m!882327))

(assert (=> b!949127 m!882205))

(assert (=> b!949127 m!882203))

(assert (=> b!949127 m!882207))

(assert (=> b!949128 m!882191))

(assert (=> b!949128 m!882191))

(assert (=> b!949128 m!882193))

(assert (=> b!949134 m!882205))

(assert (=> b!949134 m!882203))

(assert (=> b!949134 m!882207))

(assert (=> b!949134 m!882205))

(assert (=> b!949134 m!882203))

(assert (=> b!949134 m!882191))

(assert (=> b!949134 m!882191))

(declare-fun m!882329 () Bool)

(assert (=> b!949134 m!882329))

(declare-fun m!882331 () Bool)

(assert (=> b!949129 m!882331))

(assert (=> b!949047 d!115103))

(declare-fun d!115105 () Bool)

(declare-fun e!534362 () Bool)

(assert (=> d!115105 e!534362))

(declare-fun res!636555 () Bool)

(assert (=> d!115105 (=> res!636555 e!534362)))

(declare-fun lt!427341 () Bool)

(assert (=> d!115105 (= res!636555 (not lt!427341))))

(declare-fun lt!427343 () Bool)

(assert (=> d!115105 (= lt!427341 lt!427343)))

(declare-fun lt!427342 () Unit!31926)

(declare-fun e!534361 () Unit!31926)

(assert (=> d!115105 (= lt!427342 e!534361)))

(declare-fun c!99103 () Bool)

(assert (=> d!115105 (= c!99103 lt!427343)))

(assert (=> d!115105 (= lt!427343 (containsKey!459 (toList!6116 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))) lt!427292))))

(assert (=> d!115105 (= (contains!5209 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141))) lt!427292) lt!427341)))

(declare-fun b!949136 () Bool)

(declare-fun lt!427340 () Unit!31926)

(assert (=> b!949136 (= e!534361 lt!427340)))

(assert (=> b!949136 (= lt!427340 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6116 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))) lt!427292))))

(assert (=> b!949136 (isDefined!361 (getValueByKey!488 (toList!6116 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))) lt!427292))))

(declare-fun b!949137 () Bool)

(declare-fun Unit!31930 () Unit!31926)

(assert (=> b!949137 (= e!534361 Unit!31930)))

(declare-fun b!949138 () Bool)

(assert (=> b!949138 (= e!534362 (isDefined!361 (getValueByKey!488 (toList!6116 (+!2866 lt!427273 (tuple2!13503 lt!427285 (zeroValue!5580 thiss!1141)))) lt!427292)))))

(assert (= (and d!115105 c!99103) b!949136))

(assert (= (and d!115105 (not c!99103)) b!949137))

(assert (= (and d!115105 (not res!636555)) b!949138))

(declare-fun m!882333 () Bool)

(assert (=> d!115105 m!882333))

(declare-fun m!882335 () Bool)

(assert (=> b!949136 m!882335))

(declare-fun m!882337 () Bool)

(assert (=> b!949136 m!882337))

(assert (=> b!949136 m!882337))

(declare-fun m!882339 () Bool)

(assert (=> b!949136 m!882339))

(assert (=> b!949138 m!882337))

(assert (=> b!949138 m!882337))

(assert (=> b!949138 m!882339))

(assert (=> b!949047 d!115105))

(declare-fun d!115107 () Bool)

(assert (=> d!115107 (= (apply!880 (+!2866 lt!427288 (tuple2!13503 lt!427280 (minValue!5580 thiss!1141))) lt!427291) (apply!880 lt!427288 lt!427291))))

(declare-fun lt!427344 () Unit!31926)

(assert (=> d!115107 (= lt!427344 (choose!1578 lt!427288 lt!427280 (minValue!5580 thiss!1141) lt!427291))))

(declare-fun e!534363 () Bool)

(assert (=> d!115107 e!534363))

(declare-fun res!636556 () Bool)

(assert (=> d!115107 (=> (not res!636556) (not e!534363))))

(assert (=> d!115107 (= res!636556 (contains!5209 lt!427288 lt!427291))))

(assert (=> d!115107 (= (addApplyDifferent!450 lt!427288 lt!427280 (minValue!5580 thiss!1141) lt!427291) lt!427344)))

(declare-fun b!949139 () Bool)

(assert (=> b!949139 (= e!534363 (not (= lt!427291 lt!427280)))))

(assert (= (and d!115107 res!636556) b!949139))

(assert (=> d!115107 m!882221))

(assert (=> d!115107 m!882227))

(declare-fun m!882341 () Bool)

(assert (=> d!115107 m!882341))

(declare-fun m!882343 () Bool)

(assert (=> d!115107 m!882343))

(assert (=> d!115107 m!882235))

(assert (=> d!115107 m!882221))

(assert (=> b!949047 d!115107))

(declare-fun d!115109 () Bool)

(assert (=> d!115109 (= (apply!880 (+!2866 lt!427283 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))) lt!427279) (get!14524 (getValueByKey!488 (toList!6116 (+!2866 lt!427283 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141)))) lt!427279)))))

(declare-fun bs!26661 () Bool)

(assert (= bs!26661 d!115109))

(declare-fun m!882345 () Bool)

(assert (=> bs!26661 m!882345))

(assert (=> bs!26661 m!882345))

(declare-fun m!882347 () Bool)

(assert (=> bs!26661 m!882347))

(assert (=> b!949047 d!115109))

(declare-fun d!115111 () Bool)

(declare-fun e!534364 () Bool)

(assert (=> d!115111 e!534364))

(declare-fun res!636557 () Bool)

(assert (=> d!115111 (=> (not res!636557) (not e!534364))))

(declare-fun lt!427347 () ListLongMap!12201)

(assert (=> d!115111 (= res!636557 (contains!5209 lt!427347 (_1!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))))))

(declare-fun lt!427345 () List!19302)

(assert (=> d!115111 (= lt!427347 (ListLongMap!12202 lt!427345))))

(declare-fun lt!427346 () Unit!31926)

(declare-fun lt!427348 () Unit!31926)

(assert (=> d!115111 (= lt!427346 lt!427348)))

(assert (=> d!115111 (= (getValueByKey!488 lt!427345 (_1!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!115111 (= lt!427348 (lemmaContainsTupThenGetReturnValue!263 lt!427345 (_1!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!115111 (= lt!427345 (insertStrictlySorted!320 (toList!6116 lt!427275) (_1!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))))))

(assert (=> d!115111 (= (+!2866 lt!427275 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))) lt!427347)))

(declare-fun b!949140 () Bool)

(declare-fun res!636558 () Bool)

(assert (=> b!949140 (=> (not res!636558) (not e!534364))))

(assert (=> b!949140 (= res!636558 (= (getValueByKey!488 (toList!6116 lt!427347) (_1!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))))))))

(declare-fun b!949141 () Bool)

(assert (=> b!949141 (= e!534364 (contains!5211 (toList!6116 lt!427347) (tuple2!13503 lt!427271 (zeroValue!5580 thiss!1141))))))

(assert (= (and d!115111 res!636557) b!949140))

(assert (= (and b!949140 res!636558) b!949141))

(declare-fun m!882349 () Bool)

(assert (=> d!115111 m!882349))

(declare-fun m!882351 () Bool)

(assert (=> d!115111 m!882351))

(declare-fun m!882353 () Bool)

(assert (=> d!115111 m!882353))

(declare-fun m!882355 () Bool)

(assert (=> d!115111 m!882355))

(declare-fun m!882357 () Bool)

(assert (=> b!949140 m!882357))

(declare-fun m!882359 () Bool)

(assert (=> b!949141 m!882359))

(assert (=> b!949047 d!115111))

(declare-fun d!115113 () Bool)

(assert (=> d!115113 (= (apply!880 lt!427283 lt!427279) (get!14524 (getValueByKey!488 (toList!6116 lt!427283) lt!427279)))))

(declare-fun bs!26662 () Bool)

(assert (= bs!26662 d!115113))

(declare-fun m!882361 () Bool)

(assert (=> bs!26662 m!882361))

(assert (=> bs!26662 m!882361))

(declare-fun m!882363 () Bool)

(assert (=> bs!26662 m!882363))

(assert (=> b!949047 d!115113))

(declare-fun d!115115 () Bool)

(assert (=> d!115115 (= (apply!880 lt!427288 lt!427291) (get!14524 (getValueByKey!488 (toList!6116 lt!427288) lt!427291)))))

(declare-fun bs!26663 () Bool)

(assert (= bs!26663 d!115115))

(declare-fun m!882365 () Bool)

(assert (=> bs!26663 m!882365))

(assert (=> bs!26663 m!882365))

(declare-fun m!882367 () Bool)

(assert (=> bs!26663 m!882367))

(assert (=> b!949047 d!115115))

(declare-fun d!115117 () Bool)

(assert (=> d!115117 (= (apply!880 (+!2866 lt!427283 (tuple2!13503 lt!427274 (minValue!5580 thiss!1141))) lt!427279) (apply!880 lt!427283 lt!427279))))

(declare-fun lt!427349 () Unit!31926)

(assert (=> d!115117 (= lt!427349 (choose!1578 lt!427283 lt!427274 (minValue!5580 thiss!1141) lt!427279))))

(declare-fun e!534365 () Bool)

(assert (=> d!115117 e!534365))

(declare-fun res!636559 () Bool)

(assert (=> d!115117 (=> (not res!636559) (not e!534365))))

(assert (=> d!115117 (= res!636559 (contains!5209 lt!427283 lt!427279))))

(assert (=> d!115117 (= (addApplyDifferent!450 lt!427283 lt!427274 (minValue!5580 thiss!1141) lt!427279) lt!427349)))

(declare-fun b!949142 () Bool)

(assert (=> b!949142 (= e!534365 (not (= lt!427279 lt!427274)))))

(assert (= (and d!115117 res!636559) b!949142))

(assert (=> d!115117 m!882237))

(assert (=> d!115117 m!882241))

(declare-fun m!882369 () Bool)

(assert (=> d!115117 m!882369))

(declare-fun m!882371 () Bool)

(assert (=> d!115117 m!882371))

(assert (=> d!115117 m!882215))

(assert (=> d!115117 m!882237))

(assert (=> b!949047 d!115117))

(declare-fun d!115119 () Bool)

(declare-fun e!534366 () Bool)

(assert (=> d!115119 e!534366))

(declare-fun res!636560 () Bool)

(assert (=> d!115119 (=> (not res!636560) (not e!534366))))

(declare-fun lt!427352 () ListLongMap!12201)

(assert (=> d!115119 (= res!636560 (contains!5209 lt!427352 (_1!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(declare-fun lt!427350 () List!19302)

(assert (=> d!115119 (= lt!427352 (ListLongMap!12202 lt!427350))))

(declare-fun lt!427351 () Unit!31926)

(declare-fun lt!427353 () Unit!31926)

(assert (=> d!115119 (= lt!427351 lt!427353)))

(assert (=> d!115119 (= (getValueByKey!488 lt!427350 (_1!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))) (Some!493 (_2!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(assert (=> d!115119 (= lt!427353 (lemmaContainsTupThenGetReturnValue!263 lt!427350 (_1!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (_2!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(assert (=> d!115119 (= lt!427350 (insertStrictlySorted!320 (toList!6116 (ite c!99085 call!41232 (ite c!99090 call!41226 call!41229))) (_1!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (_2!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(assert (=> d!115119 (= (+!2866 (ite c!99085 call!41232 (ite c!99090 call!41226 call!41229)) (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) lt!427352)))

(declare-fun b!949143 () Bool)

(declare-fun res!636561 () Bool)

(assert (=> b!949143 (=> (not res!636561) (not e!534366))))

(assert (=> b!949143 (= res!636561 (= (getValueByKey!488 (toList!6116 lt!427352) (_1!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))) (Some!493 (_2!6762 (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))))

(declare-fun b!949144 () Bool)

(assert (=> b!949144 (= e!534366 (contains!5211 (toList!6116 lt!427352) (ite (or c!99085 c!99090) (tuple2!13503 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5580 thiss!1141)) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (= (and d!115119 res!636560) b!949143))

(assert (= (and b!949143 res!636561) b!949144))

(declare-fun m!882373 () Bool)

(assert (=> d!115119 m!882373))

(declare-fun m!882375 () Bool)

(assert (=> d!115119 m!882375))

(declare-fun m!882377 () Bool)

(assert (=> d!115119 m!882377))

(declare-fun m!882379 () Bool)

(assert (=> d!115119 m!882379))

(declare-fun m!882381 () Bool)

(assert (=> b!949143 m!882381))

(declare-fun m!882383 () Bool)

(assert (=> b!949144 m!882383))

(assert (=> bm!41229 d!115119))

(declare-fun d!115121 () Bool)

(declare-fun e!534368 () Bool)

(assert (=> d!115121 e!534368))

(declare-fun res!636562 () Bool)

(assert (=> d!115121 (=> res!636562 e!534368)))

(declare-fun lt!427355 () Bool)

(assert (=> d!115121 (= res!636562 (not lt!427355))))

(declare-fun lt!427357 () Bool)

(assert (=> d!115121 (= lt!427355 lt!427357)))

(declare-fun lt!427356 () Unit!31926)

(declare-fun e!534367 () Unit!31926)

(assert (=> d!115121 (= lt!427356 e!534367)))

(declare-fun c!99104 () Bool)

(assert (=> d!115121 (= c!99104 lt!427357)))

(assert (=> d!115121 (= lt!427357 (containsKey!459 (toList!6116 lt!427284) (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115121 (= (contains!5209 lt!427284 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)) lt!427355)))

(declare-fun b!949145 () Bool)

(declare-fun lt!427354 () Unit!31926)

(assert (=> b!949145 (= e!534367 lt!427354)))

(assert (=> b!949145 (= lt!427354 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6116 lt!427284) (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949145 (isDefined!361 (getValueByKey!488 (toList!6116 lt!427284) (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949146 () Bool)

(declare-fun Unit!31931 () Unit!31926)

(assert (=> b!949146 (= e!534367 Unit!31931)))

(declare-fun b!949147 () Bool)

(assert (=> b!949147 (= e!534368 (isDefined!361 (getValueByKey!488 (toList!6116 lt!427284) (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115121 c!99104) b!949145))

(assert (= (and d!115121 (not c!99104)) b!949146))

(assert (= (and d!115121 (not res!636562)) b!949147))

(assert (=> d!115121 m!882191))

(declare-fun m!882385 () Bool)

(assert (=> d!115121 m!882385))

(assert (=> b!949145 m!882191))

(declare-fun m!882387 () Bool)

(assert (=> b!949145 m!882387))

(assert (=> b!949145 m!882191))

(declare-fun m!882389 () Bool)

(assert (=> b!949145 m!882389))

(assert (=> b!949145 m!882389))

(declare-fun m!882391 () Bool)

(assert (=> b!949145 m!882391))

(assert (=> b!949147 m!882191))

(assert (=> b!949147 m!882389))

(assert (=> b!949147 m!882389))

(assert (=> b!949147 m!882391))

(assert (=> b!949063 d!115121))

(declare-fun d!115123 () Bool)

(assert (=> d!115123 (= (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949048 d!115123))

(declare-fun d!115125 () Bool)

(declare-fun res!636567 () Bool)

(declare-fun e!534373 () Bool)

(assert (=> d!115125 (=> res!636567 e!534373)))

(assert (=> d!115125 (= res!636567 (and ((_ is Cons!19298) (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (= (_1!6762 (h!20460 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)))))

(assert (=> d!115125 (= (containsKey!459 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756) e!534373)))

(declare-fun b!949152 () Bool)

(declare-fun e!534374 () Bool)

(assert (=> b!949152 (= e!534373 e!534374)))

(declare-fun res!636568 () Bool)

(assert (=> b!949152 (=> (not res!636568) (not e!534374))))

(assert (=> b!949152 (= res!636568 (and (or (not ((_ is Cons!19298) (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) (bvsle (_1!6762 (h!20460 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)) ((_ is Cons!19298) (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (bvslt (_1!6762 (h!20460 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)))))

(declare-fun b!949153 () Bool)

(assert (=> b!949153 (= e!534374 (containsKey!459 (t!27619 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) key!756))))

(assert (= (and d!115125 (not res!636567)) b!949152))

(assert (= (and b!949152 res!636568) b!949153))

(declare-fun m!882393 () Bool)

(assert (=> b!949153 m!882393))

(assert (=> d!115075 d!115125))

(declare-fun d!115127 () Bool)

(assert (=> d!115127 (= (apply!880 lt!427284 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14524 (getValueByKey!488 (toList!6116 lt!427284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26664 () Bool)

(assert (= bs!26664 d!115127))

(declare-fun m!882395 () Bool)

(assert (=> bs!26664 m!882395))

(assert (=> bs!26664 m!882395))

(declare-fun m!882397 () Bool)

(assert (=> bs!26664 m!882397))

(assert (=> b!949060 d!115127))

(declare-fun d!115129 () Bool)

(declare-fun res!636577 () Bool)

(declare-fun e!534386 () Bool)

(assert (=> d!115129 (=> res!636577 e!534386)))

(assert (=> d!115129 (= res!636577 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> d!115129 (= (arrayNoDuplicates!0 (_keys!10687 thiss!1141) #b00000000000000000000000000000000 Nil!19301) e!534386)))

(declare-fun bm!41235 () Bool)

(declare-fun call!41238 () Bool)

(declare-fun c!99107 () Bool)

(assert (=> bm!41235 (= call!41238 (arrayNoDuplicates!0 (_keys!10687 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99107 (Cons!19300 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000) Nil!19301) Nil!19301)))))

(declare-fun b!949164 () Bool)

(declare-fun e!534383 () Bool)

(assert (=> b!949164 (= e!534383 call!41238)))

(declare-fun b!949165 () Bool)

(assert (=> b!949165 (= e!534383 call!41238)))

(declare-fun b!949166 () Bool)

(declare-fun e!534384 () Bool)

(assert (=> b!949166 (= e!534384 e!534383)))

(assert (=> b!949166 (= c!99107 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949167 () Bool)

(assert (=> b!949167 (= e!534386 e!534384)))

(declare-fun res!636575 () Bool)

(assert (=> b!949167 (=> (not res!636575) (not e!534384))))

(declare-fun e!534385 () Bool)

(assert (=> b!949167 (= res!636575 (not e!534385))))

(declare-fun res!636576 () Bool)

(assert (=> b!949167 (=> (not res!636576) (not e!534385))))

(assert (=> b!949167 (= res!636576 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949168 () Bool)

(declare-fun contains!5212 (List!19304 (_ BitVec 64)) Bool)

(assert (=> b!949168 (= e!534385 (contains!5212 Nil!19301 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115129 (not res!636577)) b!949167))

(assert (= (and b!949167 res!636576) b!949168))

(assert (= (and b!949167 res!636575) b!949166))

(assert (= (and b!949166 c!99107) b!949165))

(assert (= (and b!949166 (not c!99107)) b!949164))

(assert (= (or b!949165 b!949164) bm!41235))

(assert (=> bm!41235 m!882191))

(declare-fun m!882399 () Bool)

(assert (=> bm!41235 m!882399))

(assert (=> b!949166 m!882191))

(assert (=> b!949166 m!882191))

(assert (=> b!949166 m!882193))

(assert (=> b!949167 m!882191))

(assert (=> b!949167 m!882191))

(assert (=> b!949167 m!882193))

(assert (=> b!949168 m!882191))

(assert (=> b!949168 m!882191))

(declare-fun m!882401 () Bool)

(assert (=> b!949168 m!882401))

(assert (=> b!949076 d!115129))

(declare-fun d!115131 () Bool)

(declare-fun e!534388 () Bool)

(assert (=> d!115131 e!534388))

(declare-fun res!636578 () Bool)

(assert (=> d!115131 (=> res!636578 e!534388)))

(declare-fun lt!427359 () Bool)

(assert (=> d!115131 (= res!636578 (not lt!427359))))

(declare-fun lt!427361 () Bool)

(assert (=> d!115131 (= lt!427359 lt!427361)))

(declare-fun lt!427360 () Unit!31926)

(declare-fun e!534387 () Unit!31926)

(assert (=> d!115131 (= lt!427360 e!534387)))

(declare-fun c!99108 () Bool)

(assert (=> d!115131 (= c!99108 lt!427361)))

(assert (=> d!115131 (= lt!427361 (containsKey!459 (toList!6116 lt!427284) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115131 (= (contains!5209 lt!427284 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427359)))

(declare-fun b!949169 () Bool)

(declare-fun lt!427358 () Unit!31926)

(assert (=> b!949169 (= e!534387 lt!427358)))

(assert (=> b!949169 (= lt!427358 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6116 lt!427284) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949169 (isDefined!361 (getValueByKey!488 (toList!6116 lt!427284) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949170 () Bool)

(declare-fun Unit!31932 () Unit!31926)

(assert (=> b!949170 (= e!534387 Unit!31932)))

(declare-fun b!949171 () Bool)

(assert (=> b!949171 (= e!534388 (isDefined!361 (getValueByKey!488 (toList!6116 lt!427284) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115131 c!99108) b!949169))

(assert (= (and d!115131 (not c!99108)) b!949170))

(assert (= (and d!115131 (not res!636578)) b!949171))

(declare-fun m!882403 () Bool)

(assert (=> d!115131 m!882403))

(declare-fun m!882405 () Bool)

(assert (=> b!949169 m!882405))

(declare-fun m!882407 () Bool)

(assert (=> b!949169 m!882407))

(assert (=> b!949169 m!882407))

(declare-fun m!882409 () Bool)

(assert (=> b!949169 m!882409))

(assert (=> b!949171 m!882407))

(assert (=> b!949171 m!882407))

(assert (=> b!949171 m!882409))

(assert (=> bm!41228 d!115131))

(declare-fun d!115133 () Bool)

(assert (=> d!115133 (= (apply!880 lt!427284 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)) (get!14524 (getValueByKey!488 (toList!6116 lt!427284) (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26665 () Bool)

(assert (= bs!26665 d!115133))

(assert (=> bs!26665 m!882191))

(assert (=> bs!26665 m!882389))

(assert (=> bs!26665 m!882389))

(declare-fun m!882411 () Bool)

(assert (=> bs!26665 m!882411))

(assert (=> b!949046 d!115133))

(declare-fun d!115135 () Bool)

(declare-fun c!99111 () Bool)

(assert (=> d!115135 (= c!99111 ((_ is ValueCellFull!9869) (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534391 () V!32567)

(assert (=> d!115135 (= (get!14523 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534391)))

(declare-fun b!949176 () Bool)

(declare-fun get!14525 (ValueCell!9869 V!32567) V!32567)

(assert (=> b!949176 (= e!534391 (get!14525 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949177 () Bool)

(declare-fun get!14526 (ValueCell!9869 V!32567) V!32567)

(assert (=> b!949177 (= e!534391 (get!14526 (select (arr!27631 (_values!5767 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1663 (defaultEntry!5744 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115135 c!99111) b!949176))

(assert (= (and d!115135 (not c!99111)) b!949177))

(assert (=> b!949176 m!882205))

(assert (=> b!949176 m!882203))

(declare-fun m!882413 () Bool)

(assert (=> b!949176 m!882413))

(assert (=> b!949177 m!882205))

(assert (=> b!949177 m!882203))

(declare-fun m!882415 () Bool)

(assert (=> b!949177 m!882415))

(assert (=> b!949046 d!115135))

(declare-fun b!949196 () Bool)

(declare-fun e!534404 () Bool)

(declare-fun lt!427367 () SeekEntryResult!9087)

(assert (=> b!949196 (= e!534404 (bvsge (x!81553 lt!427367) #b01111111111111111111111111111110))))

(declare-fun b!949197 () Bool)

(declare-fun e!534402 () SeekEntryResult!9087)

(declare-fun e!534406 () SeekEntryResult!9087)

(assert (=> b!949197 (= e!534402 e!534406)))

(declare-fun c!99118 () Bool)

(declare-fun lt!427366 () (_ BitVec 64))

(assert (=> b!949197 (= c!99118 (or (= lt!427366 key!756) (= (bvadd lt!427366 lt!427366) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949198 () Bool)

(assert (=> b!949198 (= e!534402 (Intermediate!9087 true (toIndex!0 key!756 (mask!27539 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!115137 () Bool)

(assert (=> d!115137 e!534404))

(declare-fun c!99120 () Bool)

(assert (=> d!115137 (= c!99120 (and ((_ is Intermediate!9087) lt!427367) (undefined!9899 lt!427367)))))

(assert (=> d!115137 (= lt!427367 e!534402)))

(declare-fun c!99119 () Bool)

(assert (=> d!115137 (= c!99119 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115137 (= lt!427366 (select (arr!27632 (_keys!10687 thiss!1141)) (toIndex!0 key!756 (mask!27539 thiss!1141))))))

(assert (=> d!115137 (validMask!0 (mask!27539 thiss!1141))))

(assert (=> d!115137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27539 thiss!1141)) key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)) lt!427367)))

(declare-fun b!949199 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949199 (= e!534406 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27539 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27539 thiss!1141)) key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))

(declare-fun b!949200 () Bool)

(declare-fun e!534405 () Bool)

(assert (=> b!949200 (= e!534404 e!534405)))

(declare-fun res!636586 () Bool)

(assert (=> b!949200 (= res!636586 (and ((_ is Intermediate!9087) lt!427367) (not (undefined!9899 lt!427367)) (bvslt (x!81553 lt!427367) #b01111111111111111111111111111110) (bvsge (x!81553 lt!427367) #b00000000000000000000000000000000) (bvsge (x!81553 lt!427367) #b00000000000000000000000000000000)))))

(assert (=> b!949200 (=> (not res!636586) (not e!534405))))

(declare-fun b!949201 () Bool)

(assert (=> b!949201 (= e!534406 (Intermediate!9087 false (toIndex!0 key!756 (mask!27539 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949202 () Bool)

(assert (=> b!949202 (and (bvsge (index!38721 lt!427367) #b00000000000000000000000000000000) (bvslt (index!38721 lt!427367) (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun res!636585 () Bool)

(assert (=> b!949202 (= res!636585 (= (select (arr!27632 (_keys!10687 thiss!1141)) (index!38721 lt!427367)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534403 () Bool)

(assert (=> b!949202 (=> res!636585 e!534403)))

(declare-fun b!949203 () Bool)

(assert (=> b!949203 (and (bvsge (index!38721 lt!427367) #b00000000000000000000000000000000) (bvslt (index!38721 lt!427367) (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> b!949203 (= e!534403 (= (select (arr!27632 (_keys!10687 thiss!1141)) (index!38721 lt!427367)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949204 () Bool)

(assert (=> b!949204 (and (bvsge (index!38721 lt!427367) #b00000000000000000000000000000000) (bvslt (index!38721 lt!427367) (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun res!636587 () Bool)

(assert (=> b!949204 (= res!636587 (= (select (arr!27632 (_keys!10687 thiss!1141)) (index!38721 lt!427367)) key!756))))

(assert (=> b!949204 (=> res!636587 e!534403)))

(assert (=> b!949204 (= e!534405 e!534403)))

(assert (= (and d!115137 c!99119) b!949198))

(assert (= (and d!115137 (not c!99119)) b!949197))

(assert (= (and b!949197 c!99118) b!949201))

(assert (= (and b!949197 (not c!99118)) b!949199))

(assert (= (and d!115137 c!99120) b!949196))

(assert (= (and d!115137 (not c!99120)) b!949200))

(assert (= (and b!949200 res!636586) b!949204))

(assert (= (and b!949204 (not res!636587)) b!949202))

(assert (= (and b!949202 (not res!636585)) b!949203))

(assert (=> b!949199 m!882175))

(declare-fun m!882417 () Bool)

(assert (=> b!949199 m!882417))

(assert (=> b!949199 m!882417))

(declare-fun m!882419 () Bool)

(assert (=> b!949199 m!882419))

(declare-fun m!882421 () Bool)

(assert (=> b!949203 m!882421))

(assert (=> d!115137 m!882175))

(declare-fun m!882423 () Bool)

(assert (=> d!115137 m!882423))

(assert (=> d!115137 m!882125))

(assert (=> b!949202 m!882421))

(assert (=> b!949204 m!882421))

(assert (=> d!115073 d!115137))

(declare-fun d!115139 () Bool)

(declare-fun lt!427373 () (_ BitVec 32))

(declare-fun lt!427372 () (_ BitVec 32))

(assert (=> d!115139 (= lt!427373 (bvmul (bvxor lt!427372 (bvlshr lt!427372 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115139 (= lt!427372 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115139 (and (bvsge (mask!27539 thiss!1141) #b00000000000000000000000000000000) (let ((res!636588 (let ((h!20463 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81570 (bvmul (bvxor h!20463 (bvlshr h!20463 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81570 (bvlshr x!81570 #b00000000000000000000000000001101)) (mask!27539 thiss!1141)))))) (and (bvslt res!636588 (bvadd (mask!27539 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636588 #b00000000000000000000000000000000))))))

(assert (=> d!115139 (= (toIndex!0 key!756 (mask!27539 thiss!1141)) (bvand (bvxor lt!427373 (bvlshr lt!427373 #b00000000000000000000000000001101)) (mask!27539 thiss!1141)))))

(assert (=> d!115073 d!115139))

(assert (=> d!115073 d!115081))

(declare-fun d!115141 () Bool)

(declare-fun e!534407 () Bool)

(assert (=> d!115141 e!534407))

(declare-fun res!636589 () Bool)

(assert (=> d!115141 (=> (not res!636589) (not e!534407))))

(declare-fun lt!427376 () ListLongMap!12201)

(assert (=> d!115141 (= res!636589 (contains!5209 lt!427376 (_1!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(declare-fun lt!427374 () List!19302)

(assert (=> d!115141 (= lt!427376 (ListLongMap!12202 lt!427374))))

(declare-fun lt!427375 () Unit!31926)

(declare-fun lt!427377 () Unit!31926)

(assert (=> d!115141 (= lt!427375 lt!427377)))

(assert (=> d!115141 (= (getValueByKey!488 lt!427374 (_1!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (=> d!115141 (= lt!427377 (lemmaContainsTupThenGetReturnValue!263 lt!427374 (_1!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (=> d!115141 (= lt!427374 (insertStrictlySorted!320 (toList!6116 call!41231) (_1!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))) (_2!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))))))

(assert (=> d!115141 (= (+!2866 call!41231 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))) lt!427376)))

(declare-fun b!949205 () Bool)

(declare-fun res!636590 () Bool)

(assert (=> b!949205 (=> (not res!636590) (not e!534407))))

(assert (=> b!949205 (= res!636590 (= (getValueByKey!488 (toList!6116 lt!427376) (_1!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141)))) (Some!493 (_2!6762 (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))))

(declare-fun b!949206 () Bool)

(assert (=> b!949206 (= e!534407 (contains!5211 (toList!6116 lt!427376) (tuple2!13503 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5580 thiss!1141))))))

(assert (= (and d!115141 res!636589) b!949205))

(assert (= (and b!949205 res!636590) b!949206))

(declare-fun m!882425 () Bool)

(assert (=> d!115141 m!882425))

(declare-fun m!882427 () Bool)

(assert (=> d!115141 m!882427))

(declare-fun m!882429 () Bool)

(assert (=> d!115141 m!882429))

(declare-fun m!882431 () Bool)

(assert (=> d!115141 m!882431))

(declare-fun m!882433 () Bool)

(assert (=> b!949205 m!882433))

(declare-fun m!882435 () Bool)

(assert (=> b!949206 m!882435))

(assert (=> b!949045 d!115141))

(declare-fun b!949215 () Bool)

(declare-fun e!534413 () (_ BitVec 32))

(declare-fun call!41241 () (_ BitVec 32))

(assert (=> b!949215 (= e!534413 (bvadd #b00000000000000000000000000000001 call!41241))))

(declare-fun b!949216 () Bool)

(declare-fun e!534412 () (_ BitVec 32))

(assert (=> b!949216 (= e!534412 e!534413)))

(declare-fun c!99125 () Bool)

(assert (=> b!949216 (= c!99125 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41238 () Bool)

(assert (=> bm!41238 (= call!41241 (arrayCountValidKeys!0 (_keys!10687 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28106 (_keys!10687 thiss!1141))))))

(declare-fun d!115143 () Bool)

(declare-fun lt!427380 () (_ BitVec 32))

(assert (=> d!115143 (and (bvsge lt!427380 #b00000000000000000000000000000000) (bvsle lt!427380 (bvsub (size!28106 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115143 (= lt!427380 e!534412)))

(declare-fun c!99126 () Bool)

(assert (=> d!115143 (= c!99126 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> d!115143 (and (bvsle #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28106 (_keys!10687 thiss!1141)) (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> d!115143 (= (arrayCountValidKeys!0 (_keys!10687 thiss!1141) #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))) lt!427380)))

(declare-fun b!949217 () Bool)

(assert (=> b!949217 (= e!534412 #b00000000000000000000000000000000)))

(declare-fun b!949218 () Bool)

(assert (=> b!949218 (= e!534413 call!41241)))

(assert (= (and d!115143 c!99126) b!949217))

(assert (= (and d!115143 (not c!99126)) b!949216))

(assert (= (and b!949216 c!99125) b!949215))

(assert (= (and b!949216 (not c!99125)) b!949218))

(assert (= (or b!949215 b!949218) bm!41238))

(assert (=> b!949216 m!882191))

(assert (=> b!949216 m!882191))

(assert (=> b!949216 m!882193))

(declare-fun m!882437 () Bool)

(assert (=> bm!41238 m!882437))

(assert (=> b!949074 d!115143))

(assert (=> d!115077 d!115081))

(declare-fun b!949230 () Bool)

(declare-fun e!534416 () Bool)

(assert (=> b!949230 (= e!534416 (and (bvsge (extraKeys!5476 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5476 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2499 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949228 () Bool)

(declare-fun res!636602 () Bool)

(assert (=> b!949228 (=> (not res!636602) (not e!534416))))

(declare-fun size!28111 (LongMapFixedSize!4888) (_ BitVec 32))

(assert (=> b!949228 (= res!636602 (bvsge (size!28111 thiss!1141) (_size!2499 thiss!1141)))))

(declare-fun d!115145 () Bool)

(declare-fun res!636601 () Bool)

(assert (=> d!115145 (=> (not res!636601) (not e!534416))))

(assert (=> d!115145 (= res!636601 (validMask!0 (mask!27539 thiss!1141)))))

(assert (=> d!115145 (= (simpleValid!367 thiss!1141) e!534416)))

(declare-fun b!949229 () Bool)

(declare-fun res!636600 () Bool)

(assert (=> b!949229 (=> (not res!636600) (not e!534416))))

(assert (=> b!949229 (= res!636600 (= (size!28111 thiss!1141) (bvadd (_size!2499 thiss!1141) (bvsdiv (bvadd (extraKeys!5476 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!949227 () Bool)

(declare-fun res!636599 () Bool)

(assert (=> b!949227 (=> (not res!636599) (not e!534416))))

(assert (=> b!949227 (= res!636599 (and (= (size!28105 (_values!5767 thiss!1141)) (bvadd (mask!27539 thiss!1141) #b00000000000000000000000000000001)) (= (size!28106 (_keys!10687 thiss!1141)) (size!28105 (_values!5767 thiss!1141))) (bvsge (_size!2499 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2499 thiss!1141) (bvadd (mask!27539 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!115145 res!636601) b!949227))

(assert (= (and b!949227 res!636599) b!949228))

(assert (= (and b!949228 res!636602) b!949229))

(assert (= (and b!949229 res!636600) b!949230))

(declare-fun m!882439 () Bool)

(assert (=> b!949228 m!882439))

(assert (=> d!115145 m!882125))

(assert (=> b!949229 m!882439))

(assert (=> d!115079 d!115145))

(declare-fun b!949239 () Bool)

(declare-fun e!534424 () Bool)

(declare-fun call!41244 () Bool)

(assert (=> b!949239 (= e!534424 call!41244)))

(declare-fun b!949240 () Bool)

(declare-fun e!534425 () Bool)

(assert (=> b!949240 (= e!534425 call!41244)))

(declare-fun b!949241 () Bool)

(assert (=> b!949241 (= e!534424 e!534425)))

(declare-fun lt!427389 () (_ BitVec 64))

(assert (=> b!949241 (= lt!427389 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427388 () Unit!31926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57459 (_ BitVec 64) (_ BitVec 32)) Unit!31926)

(assert (=> b!949241 (= lt!427388 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10687 thiss!1141) lt!427389 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949241 (arrayContainsKey!0 (_keys!10687 thiss!1141) lt!427389 #b00000000000000000000000000000000)))

(declare-fun lt!427387 () Unit!31926)

(assert (=> b!949241 (= lt!427387 lt!427388)))

(declare-fun res!636608 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57459 (_ BitVec 32)) SeekEntryResult!9087)

(assert (=> b!949241 (= res!636608 (= (seekEntryOrOpen!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000) (_keys!10687 thiss!1141) (mask!27539 thiss!1141)) (Found!9087 #b00000000000000000000000000000000)))))

(assert (=> b!949241 (=> (not res!636608) (not e!534425))))

(declare-fun b!949242 () Bool)

(declare-fun e!534423 () Bool)

(assert (=> b!949242 (= e!534423 e!534424)))

(declare-fun c!99129 () Bool)

(assert (=> b!949242 (= c!99129 (validKeyInArray!0 (select (arr!27632 (_keys!10687 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41241 () Bool)

(assert (=> bm!41241 (= call!41244 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))

(declare-fun d!115147 () Bool)

(declare-fun res!636607 () Bool)

(assert (=> d!115147 (=> res!636607 e!534423)))

(assert (=> d!115147 (= res!636607 (bvsge #b00000000000000000000000000000000 (size!28106 (_keys!10687 thiss!1141))))))

(assert (=> d!115147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)) e!534423)))

(assert (= (and d!115147 (not res!636607)) b!949242))

(assert (= (and b!949242 c!99129) b!949241))

(assert (= (and b!949242 (not c!99129)) b!949239))

(assert (= (and b!949241 res!636608) b!949240))

(assert (= (or b!949240 b!949239) bm!41241))

(assert (=> b!949241 m!882191))

(declare-fun m!882441 () Bool)

(assert (=> b!949241 m!882441))

(declare-fun m!882443 () Bool)

(assert (=> b!949241 m!882443))

(assert (=> b!949241 m!882191))

(declare-fun m!882445 () Bool)

(assert (=> b!949241 m!882445))

(assert (=> b!949242 m!882191))

(assert (=> b!949242 m!882191))

(assert (=> b!949242 m!882193))

(declare-fun m!882447 () Bool)

(assert (=> bm!41241 m!882447))

(assert (=> b!949075 d!115147))

(assert (=> b!949059 d!115123))

(declare-fun e!534432 () SeekEntryResult!9087)

(declare-fun b!949255 () Bool)

(assert (=> b!949255 (= e!534432 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81553 lt!427212) #b00000000000000000000000000000001) (nextIndex!0 (index!38721 lt!427212) (bvadd (x!81553 lt!427212) #b00000000000000000000000000000001) (mask!27539 thiss!1141)) (index!38721 lt!427212) key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)))))

(declare-fun b!949256 () Bool)

(assert (=> b!949256 (= e!534432 (MissingVacant!9087 (index!38721 lt!427212)))))

(declare-fun b!949257 () Bool)

(declare-fun e!534433 () SeekEntryResult!9087)

(assert (=> b!949257 (= e!534433 (Found!9087 (index!38721 lt!427212)))))

(declare-fun lt!427394 () SeekEntryResult!9087)

(declare-fun d!115149 () Bool)

(assert (=> d!115149 (and (or ((_ is Undefined!9087) lt!427394) (not ((_ is Found!9087) lt!427394)) (and (bvsge (index!38720 lt!427394) #b00000000000000000000000000000000) (bvslt (index!38720 lt!427394) (size!28106 (_keys!10687 thiss!1141))))) (or ((_ is Undefined!9087) lt!427394) ((_ is Found!9087) lt!427394) (not ((_ is MissingVacant!9087) lt!427394)) (not (= (index!38722 lt!427394) (index!38721 lt!427212))) (and (bvsge (index!38722 lt!427394) #b00000000000000000000000000000000) (bvslt (index!38722 lt!427394) (size!28106 (_keys!10687 thiss!1141))))) (or ((_ is Undefined!9087) lt!427394) (ite ((_ is Found!9087) lt!427394) (= (select (arr!27632 (_keys!10687 thiss!1141)) (index!38720 lt!427394)) key!756) (and ((_ is MissingVacant!9087) lt!427394) (= (index!38722 lt!427394) (index!38721 lt!427212)) (= (select (arr!27632 (_keys!10687 thiss!1141)) (index!38722 lt!427394)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!534434 () SeekEntryResult!9087)

(assert (=> d!115149 (= lt!427394 e!534434)))

(declare-fun c!99136 () Bool)

(assert (=> d!115149 (= c!99136 (bvsge (x!81553 lt!427212) #b01111111111111111111111111111110))))

(declare-fun lt!427395 () (_ BitVec 64))

(assert (=> d!115149 (= lt!427395 (select (arr!27632 (_keys!10687 thiss!1141)) (index!38721 lt!427212)))))

(assert (=> d!115149 (validMask!0 (mask!27539 thiss!1141))))

(assert (=> d!115149 (= (seekKeyOrZeroReturnVacant!0 (x!81553 lt!427212) (index!38721 lt!427212) (index!38721 lt!427212) key!756 (_keys!10687 thiss!1141) (mask!27539 thiss!1141)) lt!427394)))

(declare-fun b!949258 () Bool)

(assert (=> b!949258 (= e!534434 e!534433)))

(declare-fun c!99138 () Bool)

(assert (=> b!949258 (= c!99138 (= lt!427395 key!756))))

(declare-fun b!949259 () Bool)

(assert (=> b!949259 (= e!534434 Undefined!9087)))

(declare-fun b!949260 () Bool)

(declare-fun c!99137 () Bool)

(assert (=> b!949260 (= c!99137 (= lt!427395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949260 (= e!534433 e!534432)))

(assert (= (and d!115149 c!99136) b!949259))

(assert (= (and d!115149 (not c!99136)) b!949258))

(assert (= (and b!949258 c!99138) b!949257))

(assert (= (and b!949258 (not c!99138)) b!949260))

(assert (= (and b!949260 c!99137) b!949256))

(assert (= (and b!949260 (not c!99137)) b!949255))

(declare-fun m!882449 () Bool)

(assert (=> b!949255 m!882449))

(assert (=> b!949255 m!882449))

(declare-fun m!882451 () Bool)

(assert (=> b!949255 m!882451))

(declare-fun m!882453 () Bool)

(assert (=> d!115149 m!882453))

(declare-fun m!882455 () Bool)

(assert (=> d!115149 m!882455))

(assert (=> d!115149 m!882179))

(assert (=> d!115149 m!882125))

(assert (=> b!948989 d!115149))

(assert (=> bm!41224 d!115103))

(declare-fun d!115151 () Bool)

(declare-fun isEmpty!711 (Option!494) Bool)

(assert (=> d!115151 (= (isDefined!361 (getValueByKey!488 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756)) (not (isEmpty!711 (getValueByKey!488 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))))

(declare-fun bs!26666 () Bool)

(assert (= bs!26666 d!115151))

(assert (=> bs!26666 m!882185))

(declare-fun m!882457 () Bool)

(assert (=> bs!26666 m!882457))

(assert (=> b!949002 d!115151))

(declare-fun d!115153 () Bool)

(declare-fun c!99143 () Bool)

(assert (=> d!115153 (= c!99143 (and ((_ is Cons!19298) (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (= (_1!6762 (h!20460 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756)))))

(declare-fun e!534439 () Option!494)

(assert (=> d!115153 (= (getValueByKey!488 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756) e!534439)))

(declare-fun b!949271 () Bool)

(declare-fun e!534440 () Option!494)

(assert (=> b!949271 (= e!534440 (getValueByKey!488 (t!27619 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) key!756))))

(declare-fun b!949272 () Bool)

(assert (=> b!949272 (= e!534440 None!492)))

(declare-fun b!949269 () Bool)

(assert (=> b!949269 (= e!534439 (Some!493 (_2!6762 (h!20460 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))))))

(declare-fun b!949270 () Bool)

(assert (=> b!949270 (= e!534439 e!534440)))

(declare-fun c!99144 () Bool)

(assert (=> b!949270 (= c!99144 (and ((_ is Cons!19298) (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))) (not (= (_1!6762 (h!20460 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))))) key!756))))))

(assert (= (and d!115153 c!99143) b!949269))

(assert (= (and d!115153 (not c!99143)) b!949270))

(assert (= (and b!949270 c!99144) b!949271))

(assert (= (and b!949270 (not c!99144)) b!949272))

(declare-fun m!882459 () Bool)

(assert (=> b!949271 m!882459))

(assert (=> b!949002 d!115153))

(declare-fun d!115155 () Bool)

(declare-fun e!534442 () Bool)

(assert (=> d!115155 e!534442))

(declare-fun res!636609 () Bool)

(assert (=> d!115155 (=> res!636609 e!534442)))

(declare-fun lt!427397 () Bool)

(assert (=> d!115155 (= res!636609 (not lt!427397))))

(declare-fun lt!427399 () Bool)

(assert (=> d!115155 (= lt!427397 lt!427399)))

(declare-fun lt!427398 () Unit!31926)

(declare-fun e!534441 () Unit!31926)

(assert (=> d!115155 (= lt!427398 e!534441)))

(declare-fun c!99145 () Bool)

(assert (=> d!115155 (= c!99145 lt!427399)))

(assert (=> d!115155 (= lt!427399 (containsKey!459 (toList!6116 lt!427284) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115155 (= (contains!5209 lt!427284 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427397)))

(declare-fun b!949273 () Bool)

(declare-fun lt!427396 () Unit!31926)

(assert (=> b!949273 (= e!534441 lt!427396)))

(assert (=> b!949273 (= lt!427396 (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6116 lt!427284) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949273 (isDefined!361 (getValueByKey!488 (toList!6116 lt!427284) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949274 () Bool)

(declare-fun Unit!31933 () Unit!31926)

(assert (=> b!949274 (= e!534441 Unit!31933)))

(declare-fun b!949275 () Bool)

(assert (=> b!949275 (= e!534442 (isDefined!361 (getValueByKey!488 (toList!6116 lt!427284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115155 c!99145) b!949273))

(assert (= (and d!115155 (not c!99145)) b!949274))

(assert (= (and d!115155 (not res!636609)) b!949275))

(declare-fun m!882461 () Bool)

(assert (=> d!115155 m!882461))

(declare-fun m!882463 () Bool)

(assert (=> b!949273 m!882463))

(assert (=> b!949273 m!882395))

(assert (=> b!949273 m!882395))

(declare-fun m!882465 () Bool)

(assert (=> b!949273 m!882465))

(assert (=> b!949275 m!882395))

(assert (=> b!949275 m!882395))

(assert (=> b!949275 m!882465))

(assert (=> bm!41223 d!115155))

(declare-fun d!115157 () Bool)

(assert (=> d!115157 (= (apply!880 lt!427284 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14524 (getValueByKey!488 (toList!6116 lt!427284) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26667 () Bool)

(assert (= bs!26667 d!115157))

(assert (=> bs!26667 m!882407))

(assert (=> bs!26667 m!882407))

(declare-fun m!882467 () Bool)

(assert (=> bs!26667 m!882467))

(assert (=> b!949064 d!115157))

(declare-fun d!115159 () Bool)

(assert (=> d!115159 (isDefined!361 (getValueByKey!488 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-fun lt!427402 () Unit!31926)

(declare-fun choose!1580 (List!19302 (_ BitVec 64)) Unit!31926)

(assert (=> d!115159 (= lt!427402 (choose!1580 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(declare-fun e!534445 () Bool)

(assert (=> d!115159 e!534445))

(declare-fun res!636612 () Bool)

(assert (=> d!115159 (=> (not res!636612) (not e!534445))))

(declare-fun isStrictlySorted!496 (List!19302) Bool)

(assert (=> d!115159 (= res!636612 (isStrictlySorted!496 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141)))))))

(assert (=> d!115159 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!353 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756) lt!427402)))

(declare-fun b!949278 () Bool)

(assert (=> b!949278 (= e!534445 (containsKey!459 (toList!6116 (getCurrentListMap!3349 (_keys!10687 thiss!1141) (_values!5767 thiss!1141) (mask!27539 thiss!1141) (extraKeys!5476 thiss!1141) (zeroValue!5580 thiss!1141) (minValue!5580 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5744 thiss!1141))) key!756))))

(assert (= (and d!115159 res!636612) b!949278))

(assert (=> d!115159 m!882185))

(assert (=> d!115159 m!882185))

(assert (=> d!115159 m!882187))

(declare-fun m!882469 () Bool)

(assert (=> d!115159 m!882469))

(declare-fun m!882471 () Bool)

(assert (=> d!115159 m!882471))

(assert (=> b!949278 m!882181))

(assert (=> b!949000 d!115159))

(assert (=> b!949000 d!115151))

(assert (=> b!949000 d!115153))

(declare-fun b!949280 () Bool)

(declare-fun e!534447 () Bool)

(assert (=> b!949280 (= e!534447 tp_is_empty!20701)))

(declare-fun condMapEmpty!32948 () Bool)

(declare-fun mapDefault!32948 () ValueCell!9869)

(assert (=> mapNonEmpty!32947 (= condMapEmpty!32948 (= mapRest!32947 ((as const (Array (_ BitVec 32) ValueCell!9869)) mapDefault!32948)))))

(declare-fun mapRes!32948 () Bool)

(assert (=> mapNonEmpty!32947 (= tp!63166 (and e!534447 mapRes!32948))))

(declare-fun mapNonEmpty!32948 () Bool)

(declare-fun tp!63167 () Bool)

(declare-fun e!534446 () Bool)

(assert (=> mapNonEmpty!32948 (= mapRes!32948 (and tp!63167 e!534446))))

(declare-fun mapKey!32948 () (_ BitVec 32))

(declare-fun mapValue!32948 () ValueCell!9869)

(declare-fun mapRest!32948 () (Array (_ BitVec 32) ValueCell!9869))

(assert (=> mapNonEmpty!32948 (= mapRest!32947 (store mapRest!32948 mapKey!32948 mapValue!32948))))

(declare-fun b!949279 () Bool)

(assert (=> b!949279 (= e!534446 tp_is_empty!20701)))

(declare-fun mapIsEmpty!32948 () Bool)

(assert (=> mapIsEmpty!32948 mapRes!32948))

(assert (= (and mapNonEmpty!32947 condMapEmpty!32948) mapIsEmpty!32948))

(assert (= (and mapNonEmpty!32947 (not condMapEmpty!32948)) mapNonEmpty!32948))

(assert (= (and mapNonEmpty!32948 ((_ is ValueCellFull!9869) mapValue!32948)) b!949279))

(assert (= (and mapNonEmpty!32947 ((_ is ValueCellFull!9869) mapDefault!32948)) b!949280))

(declare-fun m!882473 () Bool)

(assert (=> mapNonEmpty!32948 m!882473))

(declare-fun b_lambda!14329 () Bool)

(assert (= b_lambda!14327 (or (and b!948921 b_free!18193) b_lambda!14329)))

(declare-fun b_lambda!14331 () Bool)

(assert (= b_lambda!14325 (or (and b!948921 b_free!18193) b_lambda!14331)))

(check-sat (not b!949134) (not d!115103) (not b!949216) (not d!115133) (not b!949229) (not b!949133) (not d!115095) (not d!115091) (not d!115089) (not d!115119) (not b!949271) (not d!115151) tp_is_empty!20701 (not b!949145) (not d!115157) (not b!949130) (not b!949166) (not b!949228) (not b!949136) (not d!115127) (not b_lambda!14323) (not b!949278) (not b!949275) (not b_next!18193) (not d!115087) (not b!949147) (not d!115159) (not b!949171) (not bm!41241) (not d!115155) (not d!115145) (not b!949096) (not b!949205) (not d!115101) (not b!949167) (not d!115107) (not bm!41238) (not d!115137) (not b!949099) (not b!949169) (not b!949095) (not b!949127) (not b_lambda!14329) (not d!115121) (not mapNonEmpty!32948) (not b!949176) (not d!115149) (not b!949144) (not b!949129) (not b!949206) (not bm!41232) (not d!115097) (not b_lambda!14331) (not d!115099) (not d!115113) (not bm!41235) (not b!949094) (not b!949126) (not b!949242) (not b!949153) (not b!949125) (not b!949098) b_and!29639 (not b!949255) (not b!949097) (not b!949199) (not b!949140) (not b!949141) (not d!115093) (not d!115115) (not b!949177) (not b!949143) (not d!115117) (not d!115105) (not d!115109) (not b!949241) (not d!115141) (not b!949168) (not d!115111) (not b!949273) (not d!115131) (not b!949138) (not b!949128))
(check-sat b_and!29639 (not b_next!18193))
