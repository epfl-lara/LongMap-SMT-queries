; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80178 () Bool)

(assert start!80178)

(declare-fun b!941927 () Bool)

(declare-fun b_free!17935 () Bool)

(declare-fun b_next!17935 () Bool)

(assert (=> b!941927 (= b_free!17935 (not b_next!17935))))

(declare-fun tp!62303 () Bool)

(declare-fun b_and!29321 () Bool)

(assert (=> b!941927 (= tp!62303 b_and!29321)))

(declare-fun b!941923 () Bool)

(declare-fun res!633058 () Bool)

(declare-fun e!529572 () Bool)

(assert (=> b!941923 (=> (not res!633058) (not e!529572))))

(declare-datatypes ((V!32223 0))(
  ( (V!32224 (val!10272 Int)) )
))
(declare-datatypes ((ValueCell!9740 0))(
  ( (ValueCellFull!9740 (v!12802 V!32223)) (EmptyCell!9740) )
))
(declare-datatypes ((array!56811 0))(
  ( (array!56812 (arr!27335 (Array (_ BitVec 32) ValueCell!9740)) (size!27802 (_ BitVec 32))) )
))
(declare-datatypes ((array!56813 0))(
  ( (array!56814 (arr!27336 (Array (_ BitVec 32) (_ BitVec 64))) (size!27803 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4630 0))(
  ( (LongMapFixedSize!4631 (defaultEntry!5606 Int) (mask!27196 (_ BitVec 32)) (extraKeys!5338 (_ BitVec 32)) (zeroValue!5442 V!32223) (minValue!5442 V!32223) (_size!2370 (_ BitVec 32)) (_keys!10469 array!56813) (_values!5629 array!56811) (_vacant!2370 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4630)

(assert (=> b!941923 (= res!633058 (and (= (size!27802 (_values!5629 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27196 thiss!1141))) (= (size!27803 (_keys!10469 thiss!1141)) (size!27802 (_values!5629 thiss!1141))) (bvsge (mask!27196 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5338 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5338 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32477 () Bool)

(declare-fun mapRes!32477 () Bool)

(declare-fun tp!62302 () Bool)

(declare-fun e!529575 () Bool)

(assert (=> mapNonEmpty!32477 (= mapRes!32477 (and tp!62302 e!529575))))

(declare-fun mapValue!32477 () ValueCell!9740)

(declare-fun mapRest!32477 () (Array (_ BitVec 32) ValueCell!9740))

(declare-fun mapKey!32477 () (_ BitVec 32))

(assert (=> mapNonEmpty!32477 (= (arr!27335 (_values!5629 thiss!1141)) (store mapRest!32477 mapKey!32477 mapValue!32477))))

(declare-fun b!941925 () Bool)

(declare-fun tp_is_empty!20443 () Bool)

(assert (=> b!941925 (= e!529575 tp_is_empty!20443)))

(declare-fun b!941926 () Bool)

(declare-fun e!529577 () Bool)

(assert (=> b!941926 (= e!529577 tp_is_empty!20443)))

(declare-fun b!941924 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56813 (_ BitVec 32)) Bool)

(assert (=> b!941924 (= e!529572 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10469 thiss!1141) (mask!27196 thiss!1141))))))

(declare-fun res!633060 () Bool)

(assert (=> start!80178 (=> (not res!633060) (not e!529572))))

(declare-fun valid!1783 (LongMapFixedSize!4630) Bool)

(assert (=> start!80178 (= res!633060 (valid!1783 thiss!1141))))

(assert (=> start!80178 e!529572))

(declare-fun e!529576 () Bool)

(assert (=> start!80178 e!529576))

(assert (=> start!80178 true))

(declare-fun e!529573 () Bool)

(declare-fun array_inv!21310 (array!56813) Bool)

(declare-fun array_inv!21311 (array!56811) Bool)

(assert (=> b!941927 (= e!529576 (and tp!62303 tp_is_empty!20443 (array_inv!21310 (_keys!10469 thiss!1141)) (array_inv!21311 (_values!5629 thiss!1141)) e!529573))))

(declare-fun b!941928 () Bool)

(declare-fun res!633059 () Bool)

(assert (=> b!941928 (=> (not res!633059) (not e!529572))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9029 0))(
  ( (MissingZero!9029 (index!38487 (_ BitVec 32))) (Found!9029 (index!38488 (_ BitVec 32))) (Intermediate!9029 (undefined!9841 Bool) (index!38489 (_ BitVec 32)) (x!80881 (_ BitVec 32))) (Undefined!9029) (MissingVacant!9029 (index!38490 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56813 (_ BitVec 32)) SeekEntryResult!9029)

(assert (=> b!941928 (= res!633059 (not ((_ is Found!9029) (seekEntry!0 key!756 (_keys!10469 thiss!1141) (mask!27196 thiss!1141)))))))

(declare-fun mapIsEmpty!32477 () Bool)

(assert (=> mapIsEmpty!32477 mapRes!32477))

(declare-fun b!941929 () Bool)

(declare-fun res!633057 () Bool)

(assert (=> b!941929 (=> (not res!633057) (not e!529572))))

(assert (=> b!941929 (= res!633057 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941930 () Bool)

(assert (=> b!941930 (= e!529573 (and e!529577 mapRes!32477))))

(declare-fun condMapEmpty!32477 () Bool)

(declare-fun mapDefault!32477 () ValueCell!9740)

(assert (=> b!941930 (= condMapEmpty!32477 (= (arr!27335 (_values!5629 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9740)) mapDefault!32477)))))

(declare-fun b!941931 () Bool)

(declare-fun res!633056 () Bool)

(assert (=> b!941931 (=> (not res!633056) (not e!529572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941931 (= res!633056 (validMask!0 (mask!27196 thiss!1141)))))

(assert (= (and start!80178 res!633060) b!941929))

(assert (= (and b!941929 res!633057) b!941928))

(assert (= (and b!941928 res!633059) b!941931))

(assert (= (and b!941931 res!633056) b!941923))

(assert (= (and b!941923 res!633058) b!941924))

(assert (= (and b!941930 condMapEmpty!32477) mapIsEmpty!32477))

(assert (= (and b!941930 (not condMapEmpty!32477)) mapNonEmpty!32477))

(assert (= (and mapNonEmpty!32477 ((_ is ValueCellFull!9740) mapValue!32477)) b!941925))

(assert (= (and b!941930 ((_ is ValueCellFull!9740) mapDefault!32477)) b!941926))

(assert (= b!941927 b!941930))

(assert (= start!80178 b!941927))

(declare-fun m!876109 () Bool)

(assert (=> b!941928 m!876109))

(declare-fun m!876111 () Bool)

(assert (=> b!941927 m!876111))

(declare-fun m!876113 () Bool)

(assert (=> b!941927 m!876113))

(declare-fun m!876115 () Bool)

(assert (=> mapNonEmpty!32477 m!876115))

(declare-fun m!876117 () Bool)

(assert (=> start!80178 m!876117))

(declare-fun m!876119 () Bool)

(assert (=> b!941931 m!876119))

(declare-fun m!876121 () Bool)

(assert (=> b!941924 m!876121))

(check-sat b_and!29321 (not start!80178) (not mapNonEmpty!32477) tp_is_empty!20443 (not b!941928) (not b!941927) (not b_next!17935) (not b!941924) (not b!941931))
(check-sat b_and!29321 (not b_next!17935))
(get-model)

(declare-fun d!113961 () Bool)

(assert (=> d!113961 (= (validMask!0 (mask!27196 thiss!1141)) (and (or (= (mask!27196 thiss!1141) #b00000000000000000000000000000111) (= (mask!27196 thiss!1141) #b00000000000000000000000000001111) (= (mask!27196 thiss!1141) #b00000000000000000000000000011111) (= (mask!27196 thiss!1141) #b00000000000000000000000000111111) (= (mask!27196 thiss!1141) #b00000000000000000000000001111111) (= (mask!27196 thiss!1141) #b00000000000000000000000011111111) (= (mask!27196 thiss!1141) #b00000000000000000000000111111111) (= (mask!27196 thiss!1141) #b00000000000000000000001111111111) (= (mask!27196 thiss!1141) #b00000000000000000000011111111111) (= (mask!27196 thiss!1141) #b00000000000000000000111111111111) (= (mask!27196 thiss!1141) #b00000000000000000001111111111111) (= (mask!27196 thiss!1141) #b00000000000000000011111111111111) (= (mask!27196 thiss!1141) #b00000000000000000111111111111111) (= (mask!27196 thiss!1141) #b00000000000000001111111111111111) (= (mask!27196 thiss!1141) #b00000000000000011111111111111111) (= (mask!27196 thiss!1141) #b00000000000000111111111111111111) (= (mask!27196 thiss!1141) #b00000000000001111111111111111111) (= (mask!27196 thiss!1141) #b00000000000011111111111111111111) (= (mask!27196 thiss!1141) #b00000000000111111111111111111111) (= (mask!27196 thiss!1141) #b00000000001111111111111111111111) (= (mask!27196 thiss!1141) #b00000000011111111111111111111111) (= (mask!27196 thiss!1141) #b00000000111111111111111111111111) (= (mask!27196 thiss!1141) #b00000001111111111111111111111111) (= (mask!27196 thiss!1141) #b00000011111111111111111111111111) (= (mask!27196 thiss!1141) #b00000111111111111111111111111111) (= (mask!27196 thiss!1141) #b00001111111111111111111111111111) (= (mask!27196 thiss!1141) #b00011111111111111111111111111111) (= (mask!27196 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27196 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941931 d!113961))

(declare-fun d!113963 () Bool)

(assert (=> d!113963 (= (array_inv!21310 (_keys!10469 thiss!1141)) (bvsge (size!27803 (_keys!10469 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941927 d!113963))

(declare-fun d!113965 () Bool)

(assert (=> d!113965 (= (array_inv!21311 (_values!5629 thiss!1141)) (bvsge (size!27802 (_values!5629 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941927 d!113965))

(declare-fun d!113967 () Bool)

(declare-fun res!633097 () Bool)

(declare-fun e!529616 () Bool)

(assert (=> d!113967 (=> (not res!633097) (not e!529616))))

(declare-fun simpleValid!345 (LongMapFixedSize!4630) Bool)

(assert (=> d!113967 (= res!633097 (simpleValid!345 thiss!1141))))

(assert (=> d!113967 (= (valid!1783 thiss!1141) e!529616)))

(declare-fun b!941992 () Bool)

(declare-fun res!633098 () Bool)

(assert (=> b!941992 (=> (not res!633098) (not e!529616))))

(declare-fun arrayCountValidKeys!0 (array!56813 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941992 (= res!633098 (= (arrayCountValidKeys!0 (_keys!10469 thiss!1141) #b00000000000000000000000000000000 (size!27803 (_keys!10469 thiss!1141))) (_size!2370 thiss!1141)))))

(declare-fun b!941993 () Bool)

(declare-fun res!633099 () Bool)

(assert (=> b!941993 (=> (not res!633099) (not e!529616))))

(assert (=> b!941993 (= res!633099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10469 thiss!1141) (mask!27196 thiss!1141)))))

(declare-fun b!941994 () Bool)

(declare-datatypes ((List!19221 0))(
  ( (Nil!19218) (Cons!19217 (h!20367 (_ BitVec 64)) (t!27527 List!19221)) )
))
(declare-fun arrayNoDuplicates!0 (array!56813 (_ BitVec 32) List!19221) Bool)

(assert (=> b!941994 (= e!529616 (arrayNoDuplicates!0 (_keys!10469 thiss!1141) #b00000000000000000000000000000000 Nil!19218))))

(assert (= (and d!113967 res!633097) b!941992))

(assert (= (and b!941992 res!633098) b!941993))

(assert (= (and b!941993 res!633099) b!941994))

(declare-fun m!876151 () Bool)

(assert (=> d!113967 m!876151))

(declare-fun m!876153 () Bool)

(assert (=> b!941992 m!876153))

(assert (=> b!941993 m!876121))

(declare-fun m!876155 () Bool)

(assert (=> b!941994 m!876155))

(assert (=> start!80178 d!113967))

(declare-fun b!942007 () Bool)

(declare-fun e!529625 () SeekEntryResult!9029)

(declare-fun lt!424886 () SeekEntryResult!9029)

(assert (=> b!942007 (= e!529625 (MissingZero!9029 (index!38489 lt!424886)))))

(declare-fun b!942008 () Bool)

(declare-fun e!529623 () SeekEntryResult!9029)

(assert (=> b!942008 (= e!529623 Undefined!9029)))

(declare-fun b!942009 () Bool)

(declare-fun e!529624 () SeekEntryResult!9029)

(assert (=> b!942009 (= e!529624 (Found!9029 (index!38489 lt!424886)))))

(declare-fun d!113969 () Bool)

(declare-fun lt!424889 () SeekEntryResult!9029)

(assert (=> d!113969 (and (or ((_ is MissingVacant!9029) lt!424889) (not ((_ is Found!9029) lt!424889)) (and (bvsge (index!38488 lt!424889) #b00000000000000000000000000000000) (bvslt (index!38488 lt!424889) (size!27803 (_keys!10469 thiss!1141))))) (not ((_ is MissingVacant!9029) lt!424889)) (or (not ((_ is Found!9029) lt!424889)) (= (select (arr!27336 (_keys!10469 thiss!1141)) (index!38488 lt!424889)) key!756)))))

(assert (=> d!113969 (= lt!424889 e!529623)))

(declare-fun c!98142 () Bool)

(assert (=> d!113969 (= c!98142 (and ((_ is Intermediate!9029) lt!424886) (undefined!9841 lt!424886)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56813 (_ BitVec 32)) SeekEntryResult!9029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113969 (= lt!424886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27196 thiss!1141)) key!756 (_keys!10469 thiss!1141) (mask!27196 thiss!1141)))))

(assert (=> d!113969 (validMask!0 (mask!27196 thiss!1141))))

(assert (=> d!113969 (= (seekEntry!0 key!756 (_keys!10469 thiss!1141) (mask!27196 thiss!1141)) lt!424889)))

(declare-fun b!942010 () Bool)

(declare-fun c!98143 () Bool)

(declare-fun lt!424888 () (_ BitVec 64))

(assert (=> b!942010 (= c!98143 (= lt!424888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942010 (= e!529624 e!529625)))

(declare-fun b!942011 () Bool)

(declare-fun lt!424887 () SeekEntryResult!9029)

(assert (=> b!942011 (= e!529625 (ite ((_ is MissingVacant!9029) lt!424887) (MissingZero!9029 (index!38490 lt!424887)) lt!424887))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56813 (_ BitVec 32)) SeekEntryResult!9029)

(assert (=> b!942011 (= lt!424887 (seekKeyOrZeroReturnVacant!0 (x!80881 lt!424886) (index!38489 lt!424886) (index!38489 lt!424886) key!756 (_keys!10469 thiss!1141) (mask!27196 thiss!1141)))))

(declare-fun b!942012 () Bool)

(assert (=> b!942012 (= e!529623 e!529624)))

(assert (=> b!942012 (= lt!424888 (select (arr!27336 (_keys!10469 thiss!1141)) (index!38489 lt!424886)))))

(declare-fun c!98144 () Bool)

(assert (=> b!942012 (= c!98144 (= lt!424888 key!756))))

(assert (= (and d!113969 c!98142) b!942008))

(assert (= (and d!113969 (not c!98142)) b!942012))

(assert (= (and b!942012 c!98144) b!942009))

(assert (= (and b!942012 (not c!98144)) b!942010))

(assert (= (and b!942010 c!98143) b!942007))

(assert (= (and b!942010 (not c!98143)) b!942011))

(declare-fun m!876157 () Bool)

(assert (=> d!113969 m!876157))

(declare-fun m!876159 () Bool)

(assert (=> d!113969 m!876159))

(assert (=> d!113969 m!876159))

(declare-fun m!876161 () Bool)

(assert (=> d!113969 m!876161))

(assert (=> d!113969 m!876119))

(declare-fun m!876163 () Bool)

(assert (=> b!942011 m!876163))

(declare-fun m!876165 () Bool)

(assert (=> b!942012 m!876165))

(assert (=> b!941928 d!113969))

(declare-fun d!113971 () Bool)

(declare-fun res!633105 () Bool)

(declare-fun e!529632 () Bool)

(assert (=> d!113971 (=> res!633105 e!529632)))

(assert (=> d!113971 (= res!633105 (bvsge #b00000000000000000000000000000000 (size!27803 (_keys!10469 thiss!1141))))))

(assert (=> d!113971 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10469 thiss!1141) (mask!27196 thiss!1141)) e!529632)))

(declare-fun b!942021 () Bool)

(declare-fun e!529633 () Bool)

(declare-fun call!40927 () Bool)

(assert (=> b!942021 (= e!529633 call!40927)))

(declare-fun b!942022 () Bool)

(declare-fun e!529634 () Bool)

(assert (=> b!942022 (= e!529634 call!40927)))

(declare-fun bm!40924 () Bool)

(assert (=> bm!40924 (= call!40927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10469 thiss!1141) (mask!27196 thiss!1141)))))

(declare-fun b!942023 () Bool)

(assert (=> b!942023 (= e!529632 e!529634)))

(declare-fun c!98147 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942023 (= c!98147 (validKeyInArray!0 (select (arr!27336 (_keys!10469 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942024 () Bool)

(assert (=> b!942024 (= e!529634 e!529633)))

(declare-fun lt!424898 () (_ BitVec 64))

(assert (=> b!942024 (= lt!424898 (select (arr!27336 (_keys!10469 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31693 0))(
  ( (Unit!31694) )
))
(declare-fun lt!424896 () Unit!31693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56813 (_ BitVec 64) (_ BitVec 32)) Unit!31693)

(assert (=> b!942024 (= lt!424896 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10469 thiss!1141) lt!424898 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942024 (arrayContainsKey!0 (_keys!10469 thiss!1141) lt!424898 #b00000000000000000000000000000000)))

(declare-fun lt!424897 () Unit!31693)

(assert (=> b!942024 (= lt!424897 lt!424896)))

(declare-fun res!633104 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56813 (_ BitVec 32)) SeekEntryResult!9029)

(assert (=> b!942024 (= res!633104 (= (seekEntryOrOpen!0 (select (arr!27336 (_keys!10469 thiss!1141)) #b00000000000000000000000000000000) (_keys!10469 thiss!1141) (mask!27196 thiss!1141)) (Found!9029 #b00000000000000000000000000000000)))))

(assert (=> b!942024 (=> (not res!633104) (not e!529633))))

(assert (= (and d!113971 (not res!633105)) b!942023))

(assert (= (and b!942023 c!98147) b!942024))

(assert (= (and b!942023 (not c!98147)) b!942022))

(assert (= (and b!942024 res!633104) b!942021))

(assert (= (or b!942021 b!942022) bm!40924))

(declare-fun m!876167 () Bool)

(assert (=> bm!40924 m!876167))

(declare-fun m!876169 () Bool)

(assert (=> b!942023 m!876169))

(assert (=> b!942023 m!876169))

(declare-fun m!876171 () Bool)

(assert (=> b!942023 m!876171))

(assert (=> b!942024 m!876169))

(declare-fun m!876173 () Bool)

(assert (=> b!942024 m!876173))

(declare-fun m!876175 () Bool)

(assert (=> b!942024 m!876175))

(assert (=> b!942024 m!876169))

(declare-fun m!876177 () Bool)

(assert (=> b!942024 m!876177))

(assert (=> b!941924 d!113971))

(declare-fun mapIsEmpty!32486 () Bool)

(declare-fun mapRes!32486 () Bool)

(assert (=> mapIsEmpty!32486 mapRes!32486))

(declare-fun b!942032 () Bool)

(declare-fun e!529640 () Bool)

(assert (=> b!942032 (= e!529640 tp_is_empty!20443)))

(declare-fun b!942031 () Bool)

(declare-fun e!529639 () Bool)

(assert (=> b!942031 (= e!529639 tp_is_empty!20443)))

(declare-fun mapNonEmpty!32486 () Bool)

(declare-fun tp!62318 () Bool)

(assert (=> mapNonEmpty!32486 (= mapRes!32486 (and tp!62318 e!529639))))

(declare-fun mapValue!32486 () ValueCell!9740)

(declare-fun mapRest!32486 () (Array (_ BitVec 32) ValueCell!9740))

(declare-fun mapKey!32486 () (_ BitVec 32))

(assert (=> mapNonEmpty!32486 (= mapRest!32477 (store mapRest!32486 mapKey!32486 mapValue!32486))))

(declare-fun condMapEmpty!32486 () Bool)

(declare-fun mapDefault!32486 () ValueCell!9740)

(assert (=> mapNonEmpty!32477 (= condMapEmpty!32486 (= mapRest!32477 ((as const (Array (_ BitVec 32) ValueCell!9740)) mapDefault!32486)))))

(assert (=> mapNonEmpty!32477 (= tp!62302 (and e!529640 mapRes!32486))))

(assert (= (and mapNonEmpty!32477 condMapEmpty!32486) mapIsEmpty!32486))

(assert (= (and mapNonEmpty!32477 (not condMapEmpty!32486)) mapNonEmpty!32486))

(assert (= (and mapNonEmpty!32486 ((_ is ValueCellFull!9740) mapValue!32486)) b!942031))

(assert (= (and mapNonEmpty!32477 ((_ is ValueCellFull!9740) mapDefault!32486)) b!942032))

(declare-fun m!876179 () Bool)

(assert (=> mapNonEmpty!32486 m!876179))

(check-sat (not b!942011) b_and!29321 (not b_next!17935) (not b!941993) (not b!942024) (not d!113969) (not b!942023) (not b!941994) tp_is_empty!20443 (not bm!40924) (not d!113967) (not b!941992) (not mapNonEmpty!32486))
(check-sat b_and!29321 (not b_next!17935))
