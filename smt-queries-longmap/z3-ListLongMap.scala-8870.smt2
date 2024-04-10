; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107672 () Bool)

(assert start!107672)

(declare-fun b!1274094 () Bool)

(declare-fun b_free!27765 () Bool)

(declare-fun b_next!27765 () Bool)

(assert (=> b!1274094 (= b_free!27765 (not b_next!27765))))

(declare-fun tp!97861 () Bool)

(declare-fun b_and!45821 () Bool)

(assert (=> b!1274094 (= tp!97861 b_and!45821)))

(declare-fun mapIsEmpty!51344 () Bool)

(declare-fun mapRes!51344 () Bool)

(assert (=> mapIsEmpty!51344 mapRes!51344))

(declare-fun b!1274093 () Bool)

(declare-fun res!847100 () Bool)

(declare-fun e!727055 () Bool)

(assert (=> b!1274093 (=> (not res!847100) (not e!727055))))

(declare-datatypes ((V!49373 0))(
  ( (V!49374 (val!16642 Int)) )
))
(declare-datatypes ((ValueCell!15714 0))(
  ( (ValueCellFull!15714 (v!19279 V!49373)) (EmptyCell!15714) )
))
(declare-datatypes ((array!83554 0))(
  ( (array!83555 (arr!40296 (Array (_ BitVec 32) ValueCell!15714)) (size!40844 (_ BitVec 32))) )
))
(declare-datatypes ((array!83556 0))(
  ( (array!83557 (arr!40297 (Array (_ BitVec 32) (_ BitVec 64))) (size!40845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6192 0))(
  ( (LongMapFixedSize!6193 (defaultEntry!6742 Int) (mask!34545 (_ BitVec 32)) (extraKeys!6421 (_ BitVec 32)) (zeroValue!6527 V!49373) (minValue!6527 V!49373) (_size!3151 (_ BitVec 32)) (_keys!12159 array!83556) (_values!6765 array!83554) (_vacant!3151 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6192)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83556 (_ BitVec 32)) Bool)

(assert (=> b!1274093 (= res!847100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12159 thiss!1551) (mask!34545 thiss!1551)))))

(declare-fun e!727058 () Bool)

(declare-fun tp_is_empty!33135 () Bool)

(declare-fun e!727056 () Bool)

(declare-fun array_inv!30633 (array!83556) Bool)

(declare-fun array_inv!30634 (array!83554) Bool)

(assert (=> b!1274094 (= e!727058 (and tp!97861 tp_is_empty!33135 (array_inv!30633 (_keys!12159 thiss!1551)) (array_inv!30634 (_values!6765 thiss!1551)) e!727056))))

(declare-fun b!1274096 () Bool)

(declare-fun e!727057 () Bool)

(assert (=> b!1274096 (= e!727057 tp_is_empty!33135)))

(declare-fun b!1274097 () Bool)

(declare-datatypes ((List!28569 0))(
  ( (Nil!28566) (Cons!28565 (h!29774 (_ BitVec 64)) (t!42102 List!28569)) )
))
(declare-fun noDuplicate!2046 (List!28569) Bool)

(assert (=> b!1274097 (= e!727055 (not (noDuplicate!2046 Nil!28566)))))

(declare-fun mapNonEmpty!51344 () Bool)

(declare-fun tp!97862 () Bool)

(declare-fun e!727054 () Bool)

(assert (=> mapNonEmpty!51344 (= mapRes!51344 (and tp!97862 e!727054))))

(declare-fun mapRest!51344 () (Array (_ BitVec 32) ValueCell!15714))

(declare-fun mapValue!51344 () ValueCell!15714)

(declare-fun mapKey!51344 () (_ BitVec 32))

(assert (=> mapNonEmpty!51344 (= (arr!40296 (_values!6765 thiss!1551)) (store mapRest!51344 mapKey!51344 mapValue!51344))))

(declare-fun b!1274098 () Bool)

(assert (=> b!1274098 (= e!727054 tp_is_empty!33135)))

(declare-fun b!1274099 () Bool)

(declare-fun res!847098 () Bool)

(assert (=> b!1274099 (=> (not res!847098) (not e!727055))))

(assert (=> b!1274099 (= res!847098 (and (bvsle #b00000000000000000000000000000000 (size!40845 (_keys!12159 thiss!1551))) (bvslt (size!40845 (_keys!12159 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1274100 () Bool)

(assert (=> b!1274100 (= e!727056 (and e!727057 mapRes!51344))))

(declare-fun condMapEmpty!51344 () Bool)

(declare-fun mapDefault!51344 () ValueCell!15714)

(assert (=> b!1274100 (= condMapEmpty!51344 (= (arr!40296 (_values!6765 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15714)) mapDefault!51344)))))

(declare-fun res!847099 () Bool)

(assert (=> start!107672 (=> (not res!847099) (not e!727055))))

(declare-fun simpleValid!481 (LongMapFixedSize!6192) Bool)

(assert (=> start!107672 (= res!847099 (simpleValid!481 thiss!1551))))

(assert (=> start!107672 e!727055))

(assert (=> start!107672 e!727058))

(declare-fun b!1274095 () Bool)

(declare-fun res!847097 () Bool)

(assert (=> b!1274095 (=> (not res!847097) (not e!727055))))

(declare-fun arrayCountValidKeys!0 (array!83556 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274095 (= res!847097 (= (arrayCountValidKeys!0 (_keys!12159 thiss!1551) #b00000000000000000000000000000000 (size!40845 (_keys!12159 thiss!1551))) (_size!3151 thiss!1551)))))

(assert (= (and start!107672 res!847099) b!1274095))

(assert (= (and b!1274095 res!847097) b!1274093))

(assert (= (and b!1274093 res!847100) b!1274099))

(assert (= (and b!1274099 res!847098) b!1274097))

(assert (= (and b!1274100 condMapEmpty!51344) mapIsEmpty!51344))

(assert (= (and b!1274100 (not condMapEmpty!51344)) mapNonEmpty!51344))

(get-info :version)

(assert (= (and mapNonEmpty!51344 ((_ is ValueCellFull!15714) mapValue!51344)) b!1274098))

(assert (= (and b!1274100 ((_ is ValueCellFull!15714) mapDefault!51344)) b!1274096))

(assert (= b!1274094 b!1274100))

(assert (= start!107672 b!1274094))

(declare-fun m!1170983 () Bool)

(assert (=> b!1274094 m!1170983))

(declare-fun m!1170985 () Bool)

(assert (=> b!1274094 m!1170985))

(declare-fun m!1170987 () Bool)

(assert (=> b!1274097 m!1170987))

(declare-fun m!1170989 () Bool)

(assert (=> mapNonEmpty!51344 m!1170989))

(declare-fun m!1170991 () Bool)

(assert (=> b!1274093 m!1170991))

(declare-fun m!1170993 () Bool)

(assert (=> start!107672 m!1170993))

(declare-fun m!1170995 () Bool)

(assert (=> b!1274095 m!1170995))

(check-sat (not b!1274094) (not b_next!27765) (not mapNonEmpty!51344) (not b!1274097) (not b!1274095) (not b!1274093) b_and!45821 (not start!107672) tp_is_empty!33135)
(check-sat b_and!45821 (not b_next!27765))
(get-model)

(declare-fun d!140083 () Bool)

(declare-fun res!847117 () Bool)

(declare-fun e!727081 () Bool)

(assert (=> d!140083 (=> res!847117 e!727081)))

(assert (=> d!140083 (= res!847117 ((_ is Nil!28566) Nil!28566))))

(assert (=> d!140083 (= (noDuplicate!2046 Nil!28566) e!727081)))

(declare-fun b!1274129 () Bool)

(declare-fun e!727082 () Bool)

(assert (=> b!1274129 (= e!727081 e!727082)))

(declare-fun res!847118 () Bool)

(assert (=> b!1274129 (=> (not res!847118) (not e!727082))))

(declare-fun contains!7675 (List!28569 (_ BitVec 64)) Bool)

(assert (=> b!1274129 (= res!847118 (not (contains!7675 (t!42102 Nil!28566) (h!29774 Nil!28566))))))

(declare-fun b!1274130 () Bool)

(assert (=> b!1274130 (= e!727082 (noDuplicate!2046 (t!42102 Nil!28566)))))

(assert (= (and d!140083 (not res!847117)) b!1274129))

(assert (= (and b!1274129 res!847118) b!1274130))

(declare-fun m!1171011 () Bool)

(assert (=> b!1274129 m!1171011))

(declare-fun m!1171013 () Bool)

(assert (=> b!1274130 m!1171013))

(assert (=> b!1274097 d!140083))

(declare-fun b!1274139 () Bool)

(declare-fun e!727090 () Bool)

(declare-fun e!727091 () Bool)

(assert (=> b!1274139 (= e!727090 e!727091)))

(declare-fun c!123810 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274139 (= c!123810 (validKeyInArray!0 (select (arr!40297 (_keys!12159 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun bm!62620 () Bool)

(declare-fun call!62623 () Bool)

(assert (=> bm!62620 (= call!62623 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12159 thiss!1551) (mask!34545 thiss!1551)))))

(declare-fun d!140085 () Bool)

(declare-fun res!847123 () Bool)

(assert (=> d!140085 (=> res!847123 e!727090)))

(assert (=> d!140085 (= res!847123 (bvsge #b00000000000000000000000000000000 (size!40845 (_keys!12159 thiss!1551))))))

(assert (=> d!140085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12159 thiss!1551) (mask!34545 thiss!1551)) e!727090)))

(declare-fun b!1274140 () Bool)

(assert (=> b!1274140 (= e!727091 call!62623)))

(declare-fun b!1274141 () Bool)

(declare-fun e!727089 () Bool)

(assert (=> b!1274141 (= e!727091 e!727089)))

(declare-fun lt!575196 () (_ BitVec 64))

(assert (=> b!1274141 (= lt!575196 (select (arr!40297 (_keys!12159 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42338 0))(
  ( (Unit!42339) )
))
(declare-fun lt!575198 () Unit!42338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83556 (_ BitVec 64) (_ BitVec 32)) Unit!42338)

(assert (=> b!1274141 (= lt!575198 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12159 thiss!1551) lt!575196 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274141 (arrayContainsKey!0 (_keys!12159 thiss!1551) lt!575196 #b00000000000000000000000000000000)))

(declare-fun lt!575197 () Unit!42338)

(assert (=> b!1274141 (= lt!575197 lt!575198)))

(declare-fun res!847124 () Bool)

(declare-datatypes ((SeekEntryResult!9999 0))(
  ( (MissingZero!9999 (index!42367 (_ BitVec 32))) (Found!9999 (index!42368 (_ BitVec 32))) (Intermediate!9999 (undefined!10811 Bool) (index!42369 (_ BitVec 32)) (x!112720 (_ BitVec 32))) (Undefined!9999) (MissingVacant!9999 (index!42370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83556 (_ BitVec 32)) SeekEntryResult!9999)

(assert (=> b!1274141 (= res!847124 (= (seekEntryOrOpen!0 (select (arr!40297 (_keys!12159 thiss!1551)) #b00000000000000000000000000000000) (_keys!12159 thiss!1551) (mask!34545 thiss!1551)) (Found!9999 #b00000000000000000000000000000000)))))

(assert (=> b!1274141 (=> (not res!847124) (not e!727089))))

(declare-fun b!1274142 () Bool)

(assert (=> b!1274142 (= e!727089 call!62623)))

(assert (= (and d!140085 (not res!847123)) b!1274139))

(assert (= (and b!1274139 c!123810) b!1274141))

(assert (= (and b!1274139 (not c!123810)) b!1274140))

(assert (= (and b!1274141 res!847124) b!1274142))

(assert (= (or b!1274142 b!1274140) bm!62620))

(declare-fun m!1171015 () Bool)

(assert (=> b!1274139 m!1171015))

(assert (=> b!1274139 m!1171015))

(declare-fun m!1171017 () Bool)

(assert (=> b!1274139 m!1171017))

(declare-fun m!1171019 () Bool)

(assert (=> bm!62620 m!1171019))

(assert (=> b!1274141 m!1171015))

(declare-fun m!1171021 () Bool)

(assert (=> b!1274141 m!1171021))

(declare-fun m!1171023 () Bool)

(assert (=> b!1274141 m!1171023))

(assert (=> b!1274141 m!1171015))

(declare-fun m!1171025 () Bool)

(assert (=> b!1274141 m!1171025))

(assert (=> b!1274093 d!140085))

(declare-fun d!140087 () Bool)

(assert (=> d!140087 (= (array_inv!30633 (_keys!12159 thiss!1551)) (bvsge (size!40845 (_keys!12159 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274094 d!140087))

(declare-fun d!140089 () Bool)

(assert (=> d!140089 (= (array_inv!30634 (_values!6765 thiss!1551)) (bvsge (size!40844 (_values!6765 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274094 d!140089))

(declare-fun bm!62623 () Bool)

(declare-fun call!62626 () (_ BitVec 32))

(assert (=> bm!62623 (= call!62626 (arrayCountValidKeys!0 (_keys!12159 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40845 (_keys!12159 thiss!1551))))))

(declare-fun b!1274151 () Bool)

(declare-fun e!727096 () (_ BitVec 32))

(assert (=> b!1274151 (= e!727096 (bvadd #b00000000000000000000000000000001 call!62626))))

(declare-fun b!1274152 () Bool)

(declare-fun e!727097 () (_ BitVec 32))

(assert (=> b!1274152 (= e!727097 e!727096)))

(declare-fun c!123816 () Bool)

(assert (=> b!1274152 (= c!123816 (validKeyInArray!0 (select (arr!40297 (_keys!12159 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274153 () Bool)

(assert (=> b!1274153 (= e!727096 call!62626)))

(declare-fun d!140091 () Bool)

(declare-fun lt!575201 () (_ BitVec 32))

(assert (=> d!140091 (and (bvsge lt!575201 #b00000000000000000000000000000000) (bvsle lt!575201 (bvsub (size!40845 (_keys!12159 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140091 (= lt!575201 e!727097)))

(declare-fun c!123815 () Bool)

(assert (=> d!140091 (= c!123815 (bvsge #b00000000000000000000000000000000 (size!40845 (_keys!12159 thiss!1551))))))

(assert (=> d!140091 (and (bvsle #b00000000000000000000000000000000 (size!40845 (_keys!12159 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40845 (_keys!12159 thiss!1551)) (size!40845 (_keys!12159 thiss!1551))))))

(assert (=> d!140091 (= (arrayCountValidKeys!0 (_keys!12159 thiss!1551) #b00000000000000000000000000000000 (size!40845 (_keys!12159 thiss!1551))) lt!575201)))

(declare-fun b!1274154 () Bool)

(assert (=> b!1274154 (= e!727097 #b00000000000000000000000000000000)))

(assert (= (and d!140091 c!123815) b!1274154))

(assert (= (and d!140091 (not c!123815)) b!1274152))

(assert (= (and b!1274152 c!123816) b!1274151))

(assert (= (and b!1274152 (not c!123816)) b!1274153))

(assert (= (or b!1274151 b!1274153) bm!62623))

(declare-fun m!1171027 () Bool)

(assert (=> bm!62623 m!1171027))

(assert (=> b!1274152 m!1171015))

(assert (=> b!1274152 m!1171015))

(assert (=> b!1274152 m!1171017))

(assert (=> b!1274095 d!140091))

(declare-fun b!1274163 () Bool)

(declare-fun res!847134 () Bool)

(declare-fun e!727100 () Bool)

(assert (=> b!1274163 (=> (not res!847134) (not e!727100))))

(assert (=> b!1274163 (= res!847134 (and (= (size!40844 (_values!6765 thiss!1551)) (bvadd (mask!34545 thiss!1551) #b00000000000000000000000000000001)) (= (size!40845 (_keys!12159 thiss!1551)) (size!40844 (_values!6765 thiss!1551))) (bvsge (_size!3151 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3151 thiss!1551) (bvadd (mask!34545 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1274164 () Bool)

(declare-fun res!847136 () Bool)

(assert (=> b!1274164 (=> (not res!847136) (not e!727100))))

(declare-fun size!40848 (LongMapFixedSize!6192) (_ BitVec 32))

(assert (=> b!1274164 (= res!847136 (bvsge (size!40848 thiss!1551) (_size!3151 thiss!1551)))))

(declare-fun d!140093 () Bool)

(declare-fun res!847133 () Bool)

(assert (=> d!140093 (=> (not res!847133) (not e!727100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140093 (= res!847133 (validMask!0 (mask!34545 thiss!1551)))))

(assert (=> d!140093 (= (simpleValid!481 thiss!1551) e!727100)))

(declare-fun b!1274165 () Bool)

(declare-fun res!847135 () Bool)

(assert (=> b!1274165 (=> (not res!847135) (not e!727100))))

(assert (=> b!1274165 (= res!847135 (= (size!40848 thiss!1551) (bvadd (_size!3151 thiss!1551) (bvsdiv (bvadd (extraKeys!6421 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1274166 () Bool)

(assert (=> b!1274166 (= e!727100 (and (bvsge (extraKeys!6421 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6421 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3151 thiss!1551) #b00000000000000000000000000000000)))))

(assert (= (and d!140093 res!847133) b!1274163))

(assert (= (and b!1274163 res!847134) b!1274164))

(assert (= (and b!1274164 res!847136) b!1274165))

(assert (= (and b!1274165 res!847135) b!1274166))

(declare-fun m!1171029 () Bool)

(assert (=> b!1274164 m!1171029))

(declare-fun m!1171031 () Bool)

(assert (=> d!140093 m!1171031))

(assert (=> b!1274165 m!1171029))

(assert (=> start!107672 d!140093))

(declare-fun b!1274174 () Bool)

(declare-fun e!727106 () Bool)

(assert (=> b!1274174 (= e!727106 tp_is_empty!33135)))

(declare-fun condMapEmpty!51350 () Bool)

(declare-fun mapDefault!51350 () ValueCell!15714)

(assert (=> mapNonEmpty!51344 (= condMapEmpty!51350 (= mapRest!51344 ((as const (Array (_ BitVec 32) ValueCell!15714)) mapDefault!51350)))))

(declare-fun mapRes!51350 () Bool)

(assert (=> mapNonEmpty!51344 (= tp!97862 (and e!727106 mapRes!51350))))

(declare-fun mapNonEmpty!51350 () Bool)

(declare-fun tp!97871 () Bool)

(declare-fun e!727105 () Bool)

(assert (=> mapNonEmpty!51350 (= mapRes!51350 (and tp!97871 e!727105))))

(declare-fun mapKey!51350 () (_ BitVec 32))

(declare-fun mapValue!51350 () ValueCell!15714)

(declare-fun mapRest!51350 () (Array (_ BitVec 32) ValueCell!15714))

(assert (=> mapNonEmpty!51350 (= mapRest!51344 (store mapRest!51350 mapKey!51350 mapValue!51350))))

(declare-fun b!1274173 () Bool)

(assert (=> b!1274173 (= e!727105 tp_is_empty!33135)))

(declare-fun mapIsEmpty!51350 () Bool)

(assert (=> mapIsEmpty!51350 mapRes!51350))

(assert (= (and mapNonEmpty!51344 condMapEmpty!51350) mapIsEmpty!51350))

(assert (= (and mapNonEmpty!51344 (not condMapEmpty!51350)) mapNonEmpty!51350))

(assert (= (and mapNonEmpty!51350 ((_ is ValueCellFull!15714) mapValue!51350)) b!1274173))

(assert (= (and mapNonEmpty!51344 ((_ is ValueCellFull!15714) mapDefault!51350)) b!1274174))

(declare-fun m!1171033 () Bool)

(assert (=> mapNonEmpty!51350 m!1171033))

(check-sat (not b!1274152) (not bm!62623) (not d!140093) (not b_next!27765) (not b!1274129) (not b!1274139) (not b!1274164) (not bm!62620) (not mapNonEmpty!51350) (not b!1274130) (not b!1274141) (not b!1274165) b_and!45821 tp_is_empty!33135)
(check-sat b_and!45821 (not b_next!27765))
