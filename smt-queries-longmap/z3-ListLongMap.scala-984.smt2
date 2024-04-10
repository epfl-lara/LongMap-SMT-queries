; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21244 () Bool)

(assert start!21244)

(declare-fun b!214064 () Bool)

(declare-fun b_free!5655 () Bool)

(declare-fun b_next!5655 () Bool)

(assert (=> b!214064 (= b_free!5655 (not b_next!5655))))

(declare-fun tp!20042 () Bool)

(declare-fun b_and!12545 () Bool)

(assert (=> b!214064 (= tp!20042 b_and!12545)))

(declare-fun b!214059 () Bool)

(declare-fun e!139191 () Bool)

(declare-fun tp_is_empty!5517 () Bool)

(assert (=> b!214059 (= e!139191 tp_is_empty!5517)))

(declare-fun b!214060 () Bool)

(declare-fun e!139188 () Bool)

(assert (=> b!214060 (= e!139188 tp_is_empty!5517)))

(declare-fun mapNonEmpty!9380 () Bool)

(declare-fun mapRes!9380 () Bool)

(declare-fun tp!20041 () Bool)

(assert (=> mapNonEmpty!9380 (= mapRes!9380 (and tp!20041 e!139191))))

(declare-datatypes ((V!7003 0))(
  ( (V!7004 (val!2803 Int)) )
))
(declare-datatypes ((ValueCell!2415 0))(
  ( (ValueCellFull!2415 (v!4821 V!7003)) (EmptyCell!2415) )
))
(declare-datatypes ((array!10239 0))(
  ( (array!10240 (arr!4858 (Array (_ BitVec 32) ValueCell!2415)) (size!5183 (_ BitVec 32))) )
))
(declare-datatypes ((array!10241 0))(
  ( (array!10242 (arr!4859 (Array (_ BitVec 32) (_ BitVec 64))) (size!5184 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2730 0))(
  ( (LongMapFixedSize!2731 (defaultEntry!4015 Int) (mask!9663 (_ BitVec 32)) (extraKeys!3752 (_ BitVec 32)) (zeroValue!3856 V!7003) (minValue!3856 V!7003) (_size!1414 (_ BitVec 32)) (_keys!6031 array!10241) (_values!3998 array!10239) (_vacant!1414 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2730)

(declare-fun mapValue!9380 () ValueCell!2415)

(declare-fun mapKey!9380 () (_ BitVec 32))

(declare-fun mapRest!9380 () (Array (_ BitVec 32) ValueCell!2415))

(assert (=> mapNonEmpty!9380 (= (arr!4858 (_values!3998 thiss!1504)) (store mapRest!9380 mapKey!9380 mapValue!9380))))

(declare-fun b!214061 () Bool)

(declare-fun e!139189 () Bool)

(assert (=> b!214061 (= e!139189 (and e!139188 mapRes!9380))))

(declare-fun condMapEmpty!9380 () Bool)

(declare-fun mapDefault!9380 () ValueCell!2415)

(assert (=> b!214061 (= condMapEmpty!9380 (= (arr!4858 (_values!3998 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2415)) mapDefault!9380)))))

(declare-fun b!214062 () Bool)

(declare-fun e!139192 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214062 (= e!139192 (not (validMask!0 (mask!9663 thiss!1504))))))

(declare-fun b!214063 () Bool)

(declare-fun res!104799 () Bool)

(assert (=> b!214063 (=> (not res!104799) (not e!139192))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214063 (= res!104799 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!104800 () Bool)

(assert (=> start!21244 (=> (not res!104800) (not e!139192))))

(declare-fun valid!1119 (LongMapFixedSize!2730) Bool)

(assert (=> start!21244 (= res!104800 (valid!1119 thiss!1504))))

(assert (=> start!21244 e!139192))

(declare-fun e!139190 () Bool)

(assert (=> start!21244 e!139190))

(assert (=> start!21244 true))

(declare-fun mapIsEmpty!9380 () Bool)

(assert (=> mapIsEmpty!9380 mapRes!9380))

(declare-fun array_inv!3213 (array!10241) Bool)

(declare-fun array_inv!3214 (array!10239) Bool)

(assert (=> b!214064 (= e!139190 (and tp!20042 tp_is_empty!5517 (array_inv!3213 (_keys!6031 thiss!1504)) (array_inv!3214 (_values!3998 thiss!1504)) e!139189))))

(assert (= (and start!21244 res!104800) b!214063))

(assert (= (and b!214063 res!104799) b!214062))

(assert (= (and b!214061 condMapEmpty!9380) mapIsEmpty!9380))

(assert (= (and b!214061 (not condMapEmpty!9380)) mapNonEmpty!9380))

(get-info :version)

(assert (= (and mapNonEmpty!9380 ((_ is ValueCellFull!2415) mapValue!9380)) b!214059))

(assert (= (and b!214061 ((_ is ValueCellFull!2415) mapDefault!9380)) b!214060))

(assert (= b!214064 b!214061))

(assert (= start!21244 b!214064))

(declare-fun m!241929 () Bool)

(assert (=> mapNonEmpty!9380 m!241929))

(declare-fun m!241931 () Bool)

(assert (=> b!214062 m!241931))

(declare-fun m!241933 () Bool)

(assert (=> start!21244 m!241933))

(declare-fun m!241935 () Bool)

(assert (=> b!214064 m!241935))

(declare-fun m!241937 () Bool)

(assert (=> b!214064 m!241937))

(check-sat (not b!214062) (not start!21244) b_and!12545 (not mapNonEmpty!9380) (not b!214064) (not b_next!5655) tp_is_empty!5517)
(check-sat b_and!12545 (not b_next!5655))
(get-model)

(declare-fun d!58261 () Bool)

(declare-fun res!104813 () Bool)

(declare-fun e!139214 () Bool)

(assert (=> d!58261 (=> (not res!104813) (not e!139214))))

(declare-fun simpleValid!207 (LongMapFixedSize!2730) Bool)

(assert (=> d!58261 (= res!104813 (simpleValid!207 thiss!1504))))

(assert (=> d!58261 (= (valid!1119 thiss!1504) e!139214)))

(declare-fun b!214089 () Bool)

(declare-fun res!104814 () Bool)

(assert (=> b!214089 (=> (not res!104814) (not e!139214))))

(declare-fun arrayCountValidKeys!0 (array!10241 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214089 (= res!104814 (= (arrayCountValidKeys!0 (_keys!6031 thiss!1504) #b00000000000000000000000000000000 (size!5184 (_keys!6031 thiss!1504))) (_size!1414 thiss!1504)))))

(declare-fun b!214090 () Bool)

(declare-fun res!104815 () Bool)

(assert (=> b!214090 (=> (not res!104815) (not e!139214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10241 (_ BitVec 32)) Bool)

(assert (=> b!214090 (= res!104815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6031 thiss!1504) (mask!9663 thiss!1504)))))

(declare-fun b!214091 () Bool)

(declare-datatypes ((List!3126 0))(
  ( (Nil!3123) (Cons!3122 (h!3764 (_ BitVec 64)) (t!8081 List!3126)) )
))
(declare-fun arrayNoDuplicates!0 (array!10241 (_ BitVec 32) List!3126) Bool)

(assert (=> b!214091 (= e!139214 (arrayNoDuplicates!0 (_keys!6031 thiss!1504) #b00000000000000000000000000000000 Nil!3123))))

(assert (= (and d!58261 res!104813) b!214089))

(assert (= (and b!214089 res!104814) b!214090))

(assert (= (and b!214090 res!104815) b!214091))

(declare-fun m!241949 () Bool)

(assert (=> d!58261 m!241949))

(declare-fun m!241951 () Bool)

(assert (=> b!214089 m!241951))

(declare-fun m!241953 () Bool)

(assert (=> b!214090 m!241953))

(declare-fun m!241955 () Bool)

(assert (=> b!214091 m!241955))

(assert (=> start!21244 d!58261))

(declare-fun d!58263 () Bool)

(assert (=> d!58263 (= (array_inv!3213 (_keys!6031 thiss!1504)) (bvsge (size!5184 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214064 d!58263))

(declare-fun d!58265 () Bool)

(assert (=> d!58265 (= (array_inv!3214 (_values!3998 thiss!1504)) (bvsge (size!5183 (_values!3998 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214064 d!58265))

(declare-fun d!58267 () Bool)

(assert (=> d!58267 (= (validMask!0 (mask!9663 thiss!1504)) (and (or (= (mask!9663 thiss!1504) #b00000000000000000000000000000111) (= (mask!9663 thiss!1504) #b00000000000000000000000000001111) (= (mask!9663 thiss!1504) #b00000000000000000000000000011111) (= (mask!9663 thiss!1504) #b00000000000000000000000000111111) (= (mask!9663 thiss!1504) #b00000000000000000000000001111111) (= (mask!9663 thiss!1504) #b00000000000000000000000011111111) (= (mask!9663 thiss!1504) #b00000000000000000000000111111111) (= (mask!9663 thiss!1504) #b00000000000000000000001111111111) (= (mask!9663 thiss!1504) #b00000000000000000000011111111111) (= (mask!9663 thiss!1504) #b00000000000000000000111111111111) (= (mask!9663 thiss!1504) #b00000000000000000001111111111111) (= (mask!9663 thiss!1504) #b00000000000000000011111111111111) (= (mask!9663 thiss!1504) #b00000000000000000111111111111111) (= (mask!9663 thiss!1504) #b00000000000000001111111111111111) (= (mask!9663 thiss!1504) #b00000000000000011111111111111111) (= (mask!9663 thiss!1504) #b00000000000000111111111111111111) (= (mask!9663 thiss!1504) #b00000000000001111111111111111111) (= (mask!9663 thiss!1504) #b00000000000011111111111111111111) (= (mask!9663 thiss!1504) #b00000000000111111111111111111111) (= (mask!9663 thiss!1504) #b00000000001111111111111111111111) (= (mask!9663 thiss!1504) #b00000000011111111111111111111111) (= (mask!9663 thiss!1504) #b00000000111111111111111111111111) (= (mask!9663 thiss!1504) #b00000001111111111111111111111111) (= (mask!9663 thiss!1504) #b00000011111111111111111111111111) (= (mask!9663 thiss!1504) #b00000111111111111111111111111111) (= (mask!9663 thiss!1504) #b00001111111111111111111111111111) (= (mask!9663 thiss!1504) #b00011111111111111111111111111111) (= (mask!9663 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9663 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214062 d!58267))

(declare-fun b!214098 () Bool)

(declare-fun e!139220 () Bool)

(assert (=> b!214098 (= e!139220 tp_is_empty!5517)))

(declare-fun b!214099 () Bool)

(declare-fun e!139219 () Bool)

(assert (=> b!214099 (= e!139219 tp_is_empty!5517)))

(declare-fun mapNonEmpty!9386 () Bool)

(declare-fun mapRes!9386 () Bool)

(declare-fun tp!20051 () Bool)

(assert (=> mapNonEmpty!9386 (= mapRes!9386 (and tp!20051 e!139220))))

(declare-fun mapValue!9386 () ValueCell!2415)

(declare-fun mapKey!9386 () (_ BitVec 32))

(declare-fun mapRest!9386 () (Array (_ BitVec 32) ValueCell!2415))

(assert (=> mapNonEmpty!9386 (= mapRest!9380 (store mapRest!9386 mapKey!9386 mapValue!9386))))

(declare-fun condMapEmpty!9386 () Bool)

(declare-fun mapDefault!9386 () ValueCell!2415)

(assert (=> mapNonEmpty!9380 (= condMapEmpty!9386 (= mapRest!9380 ((as const (Array (_ BitVec 32) ValueCell!2415)) mapDefault!9386)))))

(assert (=> mapNonEmpty!9380 (= tp!20041 (and e!139219 mapRes!9386))))

(declare-fun mapIsEmpty!9386 () Bool)

(assert (=> mapIsEmpty!9386 mapRes!9386))

(assert (= (and mapNonEmpty!9380 condMapEmpty!9386) mapIsEmpty!9386))

(assert (= (and mapNonEmpty!9380 (not condMapEmpty!9386)) mapNonEmpty!9386))

(assert (= (and mapNonEmpty!9386 ((_ is ValueCellFull!2415) mapValue!9386)) b!214098))

(assert (= (and mapNonEmpty!9380 ((_ is ValueCellFull!2415) mapDefault!9386)) b!214099))

(declare-fun m!241957 () Bool)

(assert (=> mapNonEmpty!9386 m!241957))

(check-sat (not mapNonEmpty!9386) (not d!58261) (not b!214089) (not b!214091) b_and!12545 (not b!214090) (not b_next!5655) tp_is_empty!5517)
(check-sat b_and!12545 (not b_next!5655))
(get-model)

(declare-fun bm!20304 () Bool)

(declare-fun call!20307 () Bool)

(declare-fun c!36026 () Bool)

(assert (=> bm!20304 (= call!20307 (arrayNoDuplicates!0 (_keys!6031 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36026 (Cons!3122 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000) Nil!3123) Nil!3123)))))

(declare-fun d!58269 () Bool)

(declare-fun res!104822 () Bool)

(declare-fun e!139230 () Bool)

(assert (=> d!58269 (=> res!104822 e!139230)))

(assert (=> d!58269 (= res!104822 (bvsge #b00000000000000000000000000000000 (size!5184 (_keys!6031 thiss!1504))))))

(assert (=> d!58269 (= (arrayNoDuplicates!0 (_keys!6031 thiss!1504) #b00000000000000000000000000000000 Nil!3123) e!139230)))

(declare-fun b!214110 () Bool)

(declare-fun e!139232 () Bool)

(declare-fun e!139231 () Bool)

(assert (=> b!214110 (= e!139232 e!139231)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214110 (= c!36026 (validKeyInArray!0 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214111 () Bool)

(assert (=> b!214111 (= e!139231 call!20307)))

(declare-fun b!214112 () Bool)

(declare-fun e!139229 () Bool)

(declare-fun contains!1425 (List!3126 (_ BitVec 64)) Bool)

(assert (=> b!214112 (= e!139229 (contains!1425 Nil!3123 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214113 () Bool)

(assert (=> b!214113 (= e!139230 e!139232)))

(declare-fun res!104823 () Bool)

(assert (=> b!214113 (=> (not res!104823) (not e!139232))))

(assert (=> b!214113 (= res!104823 (not e!139229))))

(declare-fun res!104824 () Bool)

(assert (=> b!214113 (=> (not res!104824) (not e!139229))))

(assert (=> b!214113 (= res!104824 (validKeyInArray!0 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214114 () Bool)

(assert (=> b!214114 (= e!139231 call!20307)))

(assert (= (and d!58269 (not res!104822)) b!214113))

(assert (= (and b!214113 res!104824) b!214112))

(assert (= (and b!214113 res!104823) b!214110))

(assert (= (and b!214110 c!36026) b!214111))

(assert (= (and b!214110 (not c!36026)) b!214114))

(assert (= (or b!214111 b!214114) bm!20304))

(declare-fun m!241959 () Bool)

(assert (=> bm!20304 m!241959))

(declare-fun m!241961 () Bool)

(assert (=> bm!20304 m!241961))

(assert (=> b!214110 m!241959))

(assert (=> b!214110 m!241959))

(declare-fun m!241963 () Bool)

(assert (=> b!214110 m!241963))

(assert (=> b!214112 m!241959))

(assert (=> b!214112 m!241959))

(declare-fun m!241965 () Bool)

(assert (=> b!214112 m!241965))

(assert (=> b!214113 m!241959))

(assert (=> b!214113 m!241959))

(assert (=> b!214113 m!241963))

(assert (=> b!214091 d!58269))

(declare-fun d!58271 () Bool)

(declare-fun res!104829 () Bool)

(declare-fun e!139240 () Bool)

(assert (=> d!58271 (=> res!104829 e!139240)))

(assert (=> d!58271 (= res!104829 (bvsge #b00000000000000000000000000000000 (size!5184 (_keys!6031 thiss!1504))))))

(assert (=> d!58271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6031 thiss!1504) (mask!9663 thiss!1504)) e!139240)))

(declare-fun b!214123 () Bool)

(declare-fun e!139239 () Bool)

(declare-fun e!139241 () Bool)

(assert (=> b!214123 (= e!139239 e!139241)))

(declare-fun lt!110775 () (_ BitVec 64))

(assert (=> b!214123 (= lt!110775 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6488 0))(
  ( (Unit!6489) )
))
(declare-fun lt!110774 () Unit!6488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10241 (_ BitVec 64) (_ BitVec 32)) Unit!6488)

(assert (=> b!214123 (= lt!110774 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6031 thiss!1504) lt!110775 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214123 (arrayContainsKey!0 (_keys!6031 thiss!1504) lt!110775 #b00000000000000000000000000000000)))

(declare-fun lt!110773 () Unit!6488)

(assert (=> b!214123 (= lt!110773 lt!110774)))

(declare-fun res!104830 () Bool)

(declare-datatypes ((SeekEntryResult!716 0))(
  ( (MissingZero!716 (index!5034 (_ BitVec 32))) (Found!716 (index!5035 (_ BitVec 32))) (Intermediate!716 (undefined!1528 Bool) (index!5036 (_ BitVec 32)) (x!22297 (_ BitVec 32))) (Undefined!716) (MissingVacant!716 (index!5037 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10241 (_ BitVec 32)) SeekEntryResult!716)

(assert (=> b!214123 (= res!104830 (= (seekEntryOrOpen!0 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000) (_keys!6031 thiss!1504) (mask!9663 thiss!1504)) (Found!716 #b00000000000000000000000000000000)))))

(assert (=> b!214123 (=> (not res!104830) (not e!139241))))

(declare-fun bm!20307 () Bool)

(declare-fun call!20310 () Bool)

(assert (=> bm!20307 (= call!20310 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6031 thiss!1504) (mask!9663 thiss!1504)))))

(declare-fun b!214124 () Bool)

(assert (=> b!214124 (= e!139241 call!20310)))

(declare-fun b!214125 () Bool)

(assert (=> b!214125 (= e!139240 e!139239)))

(declare-fun c!36029 () Bool)

(assert (=> b!214125 (= c!36029 (validKeyInArray!0 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214126 () Bool)

(assert (=> b!214126 (= e!139239 call!20310)))

(assert (= (and d!58271 (not res!104829)) b!214125))

(assert (= (and b!214125 c!36029) b!214123))

(assert (= (and b!214125 (not c!36029)) b!214126))

(assert (= (and b!214123 res!104830) b!214124))

(assert (= (or b!214124 b!214126) bm!20307))

(assert (=> b!214123 m!241959))

(declare-fun m!241967 () Bool)

(assert (=> b!214123 m!241967))

(declare-fun m!241969 () Bool)

(assert (=> b!214123 m!241969))

(assert (=> b!214123 m!241959))

(declare-fun m!241971 () Bool)

(assert (=> b!214123 m!241971))

(declare-fun m!241973 () Bool)

(assert (=> bm!20307 m!241973))

(assert (=> b!214125 m!241959))

(assert (=> b!214125 m!241959))

(assert (=> b!214125 m!241963))

(assert (=> b!214090 d!58271))

(declare-fun b!214137 () Bool)

(declare-fun res!104840 () Bool)

(declare-fun e!139244 () Bool)

(assert (=> b!214137 (=> (not res!104840) (not e!139244))))

(declare-fun size!5187 (LongMapFixedSize!2730) (_ BitVec 32))

(assert (=> b!214137 (= res!104840 (= (size!5187 thiss!1504) (bvadd (_size!1414 thiss!1504) (bvsdiv (bvadd (extraKeys!3752 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!214135 () Bool)

(declare-fun res!104839 () Bool)

(assert (=> b!214135 (=> (not res!104839) (not e!139244))))

(assert (=> b!214135 (= res!104839 (and (= (size!5183 (_values!3998 thiss!1504)) (bvadd (mask!9663 thiss!1504) #b00000000000000000000000000000001)) (= (size!5184 (_keys!6031 thiss!1504)) (size!5183 (_values!3998 thiss!1504))) (bvsge (_size!1414 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1414 thiss!1504) (bvadd (mask!9663 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!214138 () Bool)

(assert (=> b!214138 (= e!139244 (and (bvsge (extraKeys!3752 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3752 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1414 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!58273 () Bool)

(declare-fun res!104842 () Bool)

(assert (=> d!58273 (=> (not res!104842) (not e!139244))))

(assert (=> d!58273 (= res!104842 (validMask!0 (mask!9663 thiss!1504)))))

(assert (=> d!58273 (= (simpleValid!207 thiss!1504) e!139244)))

(declare-fun b!214136 () Bool)

(declare-fun res!104841 () Bool)

(assert (=> b!214136 (=> (not res!104841) (not e!139244))))

(assert (=> b!214136 (= res!104841 (bvsge (size!5187 thiss!1504) (_size!1414 thiss!1504)))))

(assert (= (and d!58273 res!104842) b!214135))

(assert (= (and b!214135 res!104839) b!214136))

(assert (= (and b!214136 res!104841) b!214137))

(assert (= (and b!214137 res!104840) b!214138))

(declare-fun m!241975 () Bool)

(assert (=> b!214137 m!241975))

(assert (=> d!58273 m!241931))

(assert (=> b!214136 m!241975))

(assert (=> d!58261 d!58273))

(declare-fun bm!20310 () Bool)

(declare-fun call!20313 () (_ BitVec 32))

(assert (=> bm!20310 (= call!20313 (arrayCountValidKeys!0 (_keys!6031 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5184 (_keys!6031 thiss!1504))))))

(declare-fun b!214147 () Bool)

(declare-fun e!139249 () (_ BitVec 32))

(assert (=> b!214147 (= e!139249 call!20313)))

(declare-fun b!214148 () Bool)

(assert (=> b!214148 (= e!139249 (bvadd #b00000000000000000000000000000001 call!20313))))

(declare-fun d!58275 () Bool)

(declare-fun lt!110778 () (_ BitVec 32))

(assert (=> d!58275 (and (bvsge lt!110778 #b00000000000000000000000000000000) (bvsle lt!110778 (bvsub (size!5184 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!139250 () (_ BitVec 32))

(assert (=> d!58275 (= lt!110778 e!139250)))

(declare-fun c!36034 () Bool)

(assert (=> d!58275 (= c!36034 (bvsge #b00000000000000000000000000000000 (size!5184 (_keys!6031 thiss!1504))))))

(assert (=> d!58275 (and (bvsle #b00000000000000000000000000000000 (size!5184 (_keys!6031 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5184 (_keys!6031 thiss!1504)) (size!5184 (_keys!6031 thiss!1504))))))

(assert (=> d!58275 (= (arrayCountValidKeys!0 (_keys!6031 thiss!1504) #b00000000000000000000000000000000 (size!5184 (_keys!6031 thiss!1504))) lt!110778)))

(declare-fun b!214149 () Bool)

(assert (=> b!214149 (= e!139250 e!139249)))

(declare-fun c!36035 () Bool)

(assert (=> b!214149 (= c!36035 (validKeyInArray!0 (select (arr!4859 (_keys!6031 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214150 () Bool)

(assert (=> b!214150 (= e!139250 #b00000000000000000000000000000000)))

(assert (= (and d!58275 c!36034) b!214150))

(assert (= (and d!58275 (not c!36034)) b!214149))

(assert (= (and b!214149 c!36035) b!214148))

(assert (= (and b!214149 (not c!36035)) b!214147))

(assert (= (or b!214148 b!214147) bm!20310))

(declare-fun m!241977 () Bool)

(assert (=> bm!20310 m!241977))

(assert (=> b!214149 m!241959))

(assert (=> b!214149 m!241959))

(assert (=> b!214149 m!241963))

(assert (=> b!214089 d!58275))

(declare-fun b!214151 () Bool)

(declare-fun e!139252 () Bool)

(assert (=> b!214151 (= e!139252 tp_is_empty!5517)))

(declare-fun b!214152 () Bool)

(declare-fun e!139251 () Bool)

(assert (=> b!214152 (= e!139251 tp_is_empty!5517)))

(declare-fun mapNonEmpty!9387 () Bool)

(declare-fun mapRes!9387 () Bool)

(declare-fun tp!20052 () Bool)

(assert (=> mapNonEmpty!9387 (= mapRes!9387 (and tp!20052 e!139252))))

(declare-fun mapRest!9387 () (Array (_ BitVec 32) ValueCell!2415))

(declare-fun mapValue!9387 () ValueCell!2415)

(declare-fun mapKey!9387 () (_ BitVec 32))

(assert (=> mapNonEmpty!9387 (= mapRest!9386 (store mapRest!9387 mapKey!9387 mapValue!9387))))

(declare-fun condMapEmpty!9387 () Bool)

(declare-fun mapDefault!9387 () ValueCell!2415)

(assert (=> mapNonEmpty!9386 (= condMapEmpty!9387 (= mapRest!9386 ((as const (Array (_ BitVec 32) ValueCell!2415)) mapDefault!9387)))))

(assert (=> mapNonEmpty!9386 (= tp!20051 (and e!139251 mapRes!9387))))

(declare-fun mapIsEmpty!9387 () Bool)

(assert (=> mapIsEmpty!9387 mapRes!9387))

(assert (= (and mapNonEmpty!9386 condMapEmpty!9387) mapIsEmpty!9387))

(assert (= (and mapNonEmpty!9386 (not condMapEmpty!9387)) mapNonEmpty!9387))

(assert (= (and mapNonEmpty!9387 ((_ is ValueCellFull!2415) mapValue!9387)) b!214151))

(assert (= (and mapNonEmpty!9386 ((_ is ValueCellFull!2415) mapDefault!9387)) b!214152))

(declare-fun m!241979 () Bool)

(assert (=> mapNonEmpty!9387 m!241979))

(check-sat (not b!214136) (not mapNonEmpty!9387) (not b!214125) (not d!58273) (not bm!20304) b_and!12545 (not b!214123) (not bm!20307) (not b!214113) (not b_next!5655) tp_is_empty!5517 (not b!214149) (not b!214112) (not b!214137) (not bm!20310) (not b!214110))
(check-sat b_and!12545 (not b_next!5655))
