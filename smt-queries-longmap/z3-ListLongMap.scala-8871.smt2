; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107690 () Bool)

(assert start!107690)

(declare-fun b!1274234 () Bool)

(declare-fun b_free!27771 () Bool)

(declare-fun b_next!27771 () Bool)

(assert (=> b!1274234 (= b_free!27771 (not b_next!27771))))

(declare-fun tp!97882 () Bool)

(declare-fun b_and!45827 () Bool)

(assert (=> b!1274234 (= tp!97882 b_and!45827)))

(declare-fun mapNonEmpty!51356 () Bool)

(declare-fun mapRes!51356 () Bool)

(declare-fun tp!97883 () Bool)

(declare-fun e!727144 () Bool)

(assert (=> mapNonEmpty!51356 (= mapRes!51356 (and tp!97883 e!727144))))

(declare-fun mapKey!51356 () (_ BitVec 32))

(declare-datatypes ((V!49381 0))(
  ( (V!49382 (val!16645 Int)) )
))
(declare-datatypes ((ValueCell!15717 0))(
  ( (ValueCellFull!15717 (v!19282 V!49381)) (EmptyCell!15717) )
))
(declare-fun mapValue!51356 () ValueCell!15717)

(declare-fun mapRest!51356 () (Array (_ BitVec 32) ValueCell!15717))

(declare-datatypes ((array!83568 0))(
  ( (array!83569 (arr!40302 (Array (_ BitVec 32) ValueCell!15717)) (size!40851 (_ BitVec 32))) )
))
(declare-datatypes ((array!83570 0))(
  ( (array!83571 (arr!40303 (Array (_ BitVec 32) (_ BitVec 64))) (size!40852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6198 0))(
  ( (LongMapFixedSize!6199 (defaultEntry!6745 Int) (mask!34551 (_ BitVec 32)) (extraKeys!6424 (_ BitVec 32)) (zeroValue!6530 V!49381) (minValue!6530 V!49381) (_size!3154 (_ BitVec 32)) (_keys!12163 array!83570) (_values!6768 array!83568) (_vacant!3154 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6198)

(assert (=> mapNonEmpty!51356 (= (arr!40302 (_values!6768 thiss!1551)) (store mapRest!51356 mapKey!51356 mapValue!51356))))

(declare-fun mapIsEmpty!51356 () Bool)

(assert (=> mapIsEmpty!51356 mapRes!51356))

(declare-fun b!1274225 () Bool)

(declare-fun e!727143 () Bool)

(declare-fun e!727146 () Bool)

(assert (=> b!1274225 (= e!727143 (and e!727146 mapRes!51356))))

(declare-fun condMapEmpty!51356 () Bool)

(declare-fun mapDefault!51356 () ValueCell!15717)

(assert (=> b!1274225 (= condMapEmpty!51356 (= (arr!40302 (_values!6768 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15717)) mapDefault!51356)))))

(declare-fun b!1274226 () Bool)

(declare-fun res!847169 () Bool)

(declare-fun e!727142 () Bool)

(assert (=> b!1274226 (=> (not res!847169) (not e!727142))))

(declare-fun arrayCountValidKeys!0 (array!83570 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274226 (= res!847169 (= (arrayCountValidKeys!0 (_keys!12163 thiss!1551) #b00000000000000000000000000000000 (size!40852 (_keys!12163 thiss!1551))) (_size!3154 thiss!1551)))))

(declare-fun b!1274227 () Bool)

(declare-fun res!847172 () Bool)

(assert (=> b!1274227 (=> (not res!847172) (not e!727142))))

(assert (=> b!1274227 (= res!847172 (and (bvsle #b00000000000000000000000000000000 (size!40852 (_keys!12163 thiss!1551))) (bvslt (size!40852 (_keys!12163 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1274228 () Bool)

(declare-fun e!727148 () Bool)

(declare-datatypes ((List!28571 0))(
  ( (Nil!28568) (Cons!28567 (h!29776 (_ BitVec 64)) (t!42104 List!28571)) )
))
(declare-fun contains!7677 (List!28571 (_ BitVec 64)) Bool)

(assert (=> b!1274228 (= e!727148 (contains!7677 Nil!28568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274229 () Bool)

(declare-fun res!847171 () Bool)

(assert (=> b!1274229 (=> (not res!847171) (not e!727142))))

(declare-fun noDuplicate!2048 (List!28571) Bool)

(assert (=> b!1274229 (= res!847171 (noDuplicate!2048 Nil!28568))))

(declare-fun b!1274230 () Bool)

(assert (=> b!1274230 (= e!727142 e!727148)))

(declare-fun res!847168 () Bool)

(assert (=> b!1274230 (=> res!847168 e!727148)))

(assert (=> b!1274230 (= res!847168 (contains!7677 Nil!28568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274231 () Bool)

(declare-fun tp_is_empty!33141 () Bool)

(assert (=> b!1274231 (= e!727146 tp_is_empty!33141)))

(declare-fun b!1274232 () Bool)

(declare-fun res!847170 () Bool)

(assert (=> b!1274232 (=> (not res!847170) (not e!727142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83570 (_ BitVec 32)) Bool)

(assert (=> b!1274232 (= res!847170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12163 thiss!1551) (mask!34551 thiss!1551)))))

(declare-fun res!847167 () Bool)

(assert (=> start!107690 (=> (not res!847167) (not e!727142))))

(declare-fun simpleValid!483 (LongMapFixedSize!6198) Bool)

(assert (=> start!107690 (= res!847167 (simpleValid!483 thiss!1551))))

(assert (=> start!107690 e!727142))

(declare-fun e!727147 () Bool)

(assert (=> start!107690 e!727147))

(declare-fun b!1274233 () Bool)

(assert (=> b!1274233 (= e!727144 tp_is_empty!33141)))

(declare-fun array_inv!30635 (array!83570) Bool)

(declare-fun array_inv!30636 (array!83568) Bool)

(assert (=> b!1274234 (= e!727147 (and tp!97882 tp_is_empty!33141 (array_inv!30635 (_keys!12163 thiss!1551)) (array_inv!30636 (_values!6768 thiss!1551)) e!727143))))

(assert (= (and start!107690 res!847167) b!1274226))

(assert (= (and b!1274226 res!847169) b!1274232))

(assert (= (and b!1274232 res!847170) b!1274227))

(assert (= (and b!1274227 res!847172) b!1274229))

(assert (= (and b!1274229 res!847171) b!1274230))

(assert (= (and b!1274230 (not res!847168)) b!1274228))

(assert (= (and b!1274225 condMapEmpty!51356) mapIsEmpty!51356))

(assert (= (and b!1274225 (not condMapEmpty!51356)) mapNonEmpty!51356))

(get-info :version)

(assert (= (and mapNonEmpty!51356 ((_ is ValueCellFull!15717) mapValue!51356)) b!1274233))

(assert (= (and b!1274225 ((_ is ValueCellFull!15717) mapDefault!51356)) b!1274231))

(assert (= b!1274234 b!1274225))

(assert (= start!107690 b!1274234))

(declare-fun m!1171053 () Bool)

(assert (=> b!1274228 m!1171053))

(declare-fun m!1171055 () Bool)

(assert (=> b!1274234 m!1171055))

(declare-fun m!1171057 () Bool)

(assert (=> b!1274234 m!1171057))

(declare-fun m!1171059 () Bool)

(assert (=> b!1274226 m!1171059))

(declare-fun m!1171061 () Bool)

(assert (=> start!107690 m!1171061))

(declare-fun m!1171063 () Bool)

(assert (=> b!1274232 m!1171063))

(declare-fun m!1171065 () Bool)

(assert (=> b!1274230 m!1171065))

(declare-fun m!1171067 () Bool)

(assert (=> b!1274229 m!1171067))

(declare-fun m!1171069 () Bool)

(assert (=> mapNonEmpty!51356 m!1171069))

(check-sat (not b_next!27771) (not b!1274232) tp_is_empty!33141 (not b!1274230) (not b!1274234) (not b!1274226) (not b!1274229) (not mapNonEmpty!51356) b_and!45827 (not start!107690) (not b!1274228))
(check-sat b_and!45827 (not b_next!27771))
(get-model)

(declare-fun d!140097 () Bool)

(declare-fun res!847196 () Bool)

(declare-fun e!727177 () Bool)

(assert (=> d!140097 (=> res!847196 e!727177)))

(assert (=> d!140097 (= res!847196 (bvsge #b00000000000000000000000000000000 (size!40852 (_keys!12163 thiss!1551))))))

(assert (=> d!140097 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12163 thiss!1551) (mask!34551 thiss!1551)) e!727177)))

(declare-fun b!1274273 () Bool)

(declare-fun e!727178 () Bool)

(declare-fun call!62629 () Bool)

(assert (=> b!1274273 (= e!727178 call!62629)))

(declare-fun bm!62626 () Bool)

(assert (=> bm!62626 (= call!62629 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12163 thiss!1551) (mask!34551 thiss!1551)))))

(declare-fun b!1274274 () Bool)

(declare-fun e!727176 () Bool)

(assert (=> b!1274274 (= e!727176 call!62629)))

(declare-fun b!1274275 () Bool)

(assert (=> b!1274275 (= e!727177 e!727176)))

(declare-fun c!123819 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274275 (= c!123819 (validKeyInArray!0 (select (arr!40303 (_keys!12163 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274276 () Bool)

(assert (=> b!1274276 (= e!727176 e!727178)))

(declare-fun lt!575209 () (_ BitVec 64))

(assert (=> b!1274276 (= lt!575209 (select (arr!40303 (_keys!12163 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42340 0))(
  ( (Unit!42341) )
))
(declare-fun lt!575210 () Unit!42340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83570 (_ BitVec 64) (_ BitVec 32)) Unit!42340)

(assert (=> b!1274276 (= lt!575210 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12163 thiss!1551) lt!575209 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274276 (arrayContainsKey!0 (_keys!12163 thiss!1551) lt!575209 #b00000000000000000000000000000000)))

(declare-fun lt!575208 () Unit!42340)

(assert (=> b!1274276 (= lt!575208 lt!575210)))

(declare-fun res!847195 () Bool)

(declare-datatypes ((SeekEntryResult!10000 0))(
  ( (MissingZero!10000 (index!42371 (_ BitVec 32))) (Found!10000 (index!42372 (_ BitVec 32))) (Intermediate!10000 (undefined!10812 Bool) (index!42373 (_ BitVec 32)) (x!112737 (_ BitVec 32))) (Undefined!10000) (MissingVacant!10000 (index!42374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83570 (_ BitVec 32)) SeekEntryResult!10000)

(assert (=> b!1274276 (= res!847195 (= (seekEntryOrOpen!0 (select (arr!40303 (_keys!12163 thiss!1551)) #b00000000000000000000000000000000) (_keys!12163 thiss!1551) (mask!34551 thiss!1551)) (Found!10000 #b00000000000000000000000000000000)))))

(assert (=> b!1274276 (=> (not res!847195) (not e!727178))))

(assert (= (and d!140097 (not res!847196)) b!1274275))

(assert (= (and b!1274275 c!123819) b!1274276))

(assert (= (and b!1274275 (not c!123819)) b!1274274))

(assert (= (and b!1274276 res!847195) b!1274273))

(assert (= (or b!1274273 b!1274274) bm!62626))

(declare-fun m!1171089 () Bool)

(assert (=> bm!62626 m!1171089))

(declare-fun m!1171091 () Bool)

(assert (=> b!1274275 m!1171091))

(assert (=> b!1274275 m!1171091))

(declare-fun m!1171093 () Bool)

(assert (=> b!1274275 m!1171093))

(assert (=> b!1274276 m!1171091))

(declare-fun m!1171095 () Bool)

(assert (=> b!1274276 m!1171095))

(declare-fun m!1171097 () Bool)

(assert (=> b!1274276 m!1171097))

(assert (=> b!1274276 m!1171091))

(declare-fun m!1171099 () Bool)

(assert (=> b!1274276 m!1171099))

(assert (=> b!1274232 d!140097))

(declare-fun d!140099 () Bool)

(declare-fun lt!575213 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!640 (List!28571) (InoxSet (_ BitVec 64)))

(assert (=> d!140099 (= lt!575213 (select (content!640 Nil!28568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!727183 () Bool)

(assert (=> d!140099 (= lt!575213 e!727183)))

(declare-fun res!847201 () Bool)

(assert (=> d!140099 (=> (not res!847201) (not e!727183))))

(assert (=> d!140099 (= res!847201 ((_ is Cons!28567) Nil!28568))))

(assert (=> d!140099 (= (contains!7677 Nil!28568 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575213)))

(declare-fun b!1274281 () Bool)

(declare-fun e!727184 () Bool)

(assert (=> b!1274281 (= e!727183 e!727184)))

(declare-fun res!847202 () Bool)

(assert (=> b!1274281 (=> res!847202 e!727184)))

(assert (=> b!1274281 (= res!847202 (= (h!29776 Nil!28568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274282 () Bool)

(assert (=> b!1274282 (= e!727184 (contains!7677 (t!42104 Nil!28568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140099 res!847201) b!1274281))

(assert (= (and b!1274281 (not res!847202)) b!1274282))

(declare-fun m!1171101 () Bool)

(assert (=> d!140099 m!1171101))

(declare-fun m!1171103 () Bool)

(assert (=> d!140099 m!1171103))

(declare-fun m!1171105 () Bool)

(assert (=> b!1274282 m!1171105))

(assert (=> b!1274228 d!140099))

(declare-fun d!140101 () Bool)

(assert (=> d!140101 (= (array_inv!30635 (_keys!12163 thiss!1551)) (bvsge (size!40852 (_keys!12163 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274234 d!140101))

(declare-fun d!140103 () Bool)

(assert (=> d!140103 (= (array_inv!30636 (_values!6768 thiss!1551)) (bvsge (size!40851 (_values!6768 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274234 d!140103))

(declare-fun d!140105 () Bool)

(declare-fun res!847211 () Bool)

(declare-fun e!727187 () Bool)

(assert (=> d!140105 (=> (not res!847211) (not e!727187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140105 (= res!847211 (validMask!0 (mask!34551 thiss!1551)))))

(assert (=> d!140105 (= (simpleValid!483 thiss!1551) e!727187)))

(declare-fun b!1274294 () Bool)

(assert (=> b!1274294 (= e!727187 (and (bvsge (extraKeys!6424 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6424 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3154 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1274292 () Bool)

(declare-fun res!847214 () Bool)

(assert (=> b!1274292 (=> (not res!847214) (not e!727187))))

(declare-fun size!40855 (LongMapFixedSize!6198) (_ BitVec 32))

(assert (=> b!1274292 (= res!847214 (bvsge (size!40855 thiss!1551) (_size!3154 thiss!1551)))))

(declare-fun b!1274293 () Bool)

(declare-fun res!847213 () Bool)

(assert (=> b!1274293 (=> (not res!847213) (not e!727187))))

(assert (=> b!1274293 (= res!847213 (= (size!40855 thiss!1551) (bvadd (_size!3154 thiss!1551) (bvsdiv (bvadd (extraKeys!6424 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1274291 () Bool)

(declare-fun res!847212 () Bool)

(assert (=> b!1274291 (=> (not res!847212) (not e!727187))))

(assert (=> b!1274291 (= res!847212 (and (= (size!40851 (_values!6768 thiss!1551)) (bvadd (mask!34551 thiss!1551) #b00000000000000000000000000000001)) (= (size!40852 (_keys!12163 thiss!1551)) (size!40851 (_values!6768 thiss!1551))) (bvsge (_size!3154 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3154 thiss!1551) (bvadd (mask!34551 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!140105 res!847211) b!1274291))

(assert (= (and b!1274291 res!847212) b!1274292))

(assert (= (and b!1274292 res!847214) b!1274293))

(assert (= (and b!1274293 res!847213) b!1274294))

(declare-fun m!1171107 () Bool)

(assert (=> d!140105 m!1171107))

(declare-fun m!1171109 () Bool)

(assert (=> b!1274292 m!1171109))

(assert (=> b!1274293 m!1171109))

(assert (=> start!107690 d!140105))

(declare-fun d!140107 () Bool)

(declare-fun res!847219 () Bool)

(declare-fun e!727192 () Bool)

(assert (=> d!140107 (=> res!847219 e!727192)))

(assert (=> d!140107 (= res!847219 ((_ is Nil!28568) Nil!28568))))

(assert (=> d!140107 (= (noDuplicate!2048 Nil!28568) e!727192)))

(declare-fun b!1274299 () Bool)

(declare-fun e!727193 () Bool)

(assert (=> b!1274299 (= e!727192 e!727193)))

(declare-fun res!847220 () Bool)

(assert (=> b!1274299 (=> (not res!847220) (not e!727193))))

(assert (=> b!1274299 (= res!847220 (not (contains!7677 (t!42104 Nil!28568) (h!29776 Nil!28568))))))

(declare-fun b!1274300 () Bool)

(assert (=> b!1274300 (= e!727193 (noDuplicate!2048 (t!42104 Nil!28568)))))

(assert (= (and d!140107 (not res!847219)) b!1274299))

(assert (= (and b!1274299 res!847220) b!1274300))

(declare-fun m!1171111 () Bool)

(assert (=> b!1274299 m!1171111))

(declare-fun m!1171113 () Bool)

(assert (=> b!1274300 m!1171113))

(assert (=> b!1274229 d!140107))

(declare-fun d!140109 () Bool)

(declare-fun lt!575214 () Bool)

(assert (=> d!140109 (= lt!575214 (select (content!640 Nil!28568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!727194 () Bool)

(assert (=> d!140109 (= lt!575214 e!727194)))

(declare-fun res!847221 () Bool)

(assert (=> d!140109 (=> (not res!847221) (not e!727194))))

(assert (=> d!140109 (= res!847221 ((_ is Cons!28567) Nil!28568))))

(assert (=> d!140109 (= (contains!7677 Nil!28568 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575214)))

(declare-fun b!1274301 () Bool)

(declare-fun e!727195 () Bool)

(assert (=> b!1274301 (= e!727194 e!727195)))

(declare-fun res!847222 () Bool)

(assert (=> b!1274301 (=> res!847222 e!727195)))

(assert (=> b!1274301 (= res!847222 (= (h!29776 Nil!28568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274302 () Bool)

(assert (=> b!1274302 (= e!727195 (contains!7677 (t!42104 Nil!28568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140109 res!847221) b!1274301))

(assert (= (and b!1274301 (not res!847222)) b!1274302))

(assert (=> d!140109 m!1171101))

(declare-fun m!1171115 () Bool)

(assert (=> d!140109 m!1171115))

(declare-fun m!1171117 () Bool)

(assert (=> b!1274302 m!1171117))

(assert (=> b!1274230 d!140109))

(declare-fun b!1274311 () Bool)

(declare-fun e!727200 () (_ BitVec 32))

(declare-fun e!727201 () (_ BitVec 32))

(assert (=> b!1274311 (= e!727200 e!727201)))

(declare-fun c!123825 () Bool)

(assert (=> b!1274311 (= c!123825 (validKeyInArray!0 (select (arr!40303 (_keys!12163 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!140111 () Bool)

(declare-fun lt!575217 () (_ BitVec 32))

(assert (=> d!140111 (and (bvsge lt!575217 #b00000000000000000000000000000000) (bvsle lt!575217 (bvsub (size!40852 (_keys!12163 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140111 (= lt!575217 e!727200)))

(declare-fun c!123824 () Bool)

(assert (=> d!140111 (= c!123824 (bvsge #b00000000000000000000000000000000 (size!40852 (_keys!12163 thiss!1551))))))

(assert (=> d!140111 (and (bvsle #b00000000000000000000000000000000 (size!40852 (_keys!12163 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40852 (_keys!12163 thiss!1551)) (size!40852 (_keys!12163 thiss!1551))))))

(assert (=> d!140111 (= (arrayCountValidKeys!0 (_keys!12163 thiss!1551) #b00000000000000000000000000000000 (size!40852 (_keys!12163 thiss!1551))) lt!575217)))

(declare-fun b!1274312 () Bool)

(declare-fun call!62632 () (_ BitVec 32))

(assert (=> b!1274312 (= e!727201 (bvadd #b00000000000000000000000000000001 call!62632))))

(declare-fun b!1274313 () Bool)

(assert (=> b!1274313 (= e!727201 call!62632)))

(declare-fun b!1274314 () Bool)

(assert (=> b!1274314 (= e!727200 #b00000000000000000000000000000000)))

(declare-fun bm!62629 () Bool)

(assert (=> bm!62629 (= call!62632 (arrayCountValidKeys!0 (_keys!12163 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40852 (_keys!12163 thiss!1551))))))

(assert (= (and d!140111 c!123824) b!1274314))

(assert (= (and d!140111 (not c!123824)) b!1274311))

(assert (= (and b!1274311 c!123825) b!1274312))

(assert (= (and b!1274311 (not c!123825)) b!1274313))

(assert (= (or b!1274312 b!1274313) bm!62629))

(assert (=> b!1274311 m!1171091))

(assert (=> b!1274311 m!1171091))

(assert (=> b!1274311 m!1171093))

(declare-fun m!1171119 () Bool)

(assert (=> bm!62629 m!1171119))

(assert (=> b!1274226 d!140111))

(declare-fun mapIsEmpty!51362 () Bool)

(declare-fun mapRes!51362 () Bool)

(assert (=> mapIsEmpty!51362 mapRes!51362))

(declare-fun b!1274321 () Bool)

(declare-fun e!727206 () Bool)

(assert (=> b!1274321 (= e!727206 tp_is_empty!33141)))

(declare-fun b!1274322 () Bool)

(declare-fun e!727207 () Bool)

(assert (=> b!1274322 (= e!727207 tp_is_empty!33141)))

(declare-fun mapNonEmpty!51362 () Bool)

(declare-fun tp!97892 () Bool)

(assert (=> mapNonEmpty!51362 (= mapRes!51362 (and tp!97892 e!727206))))

(declare-fun mapValue!51362 () ValueCell!15717)

(declare-fun mapRest!51362 () (Array (_ BitVec 32) ValueCell!15717))

(declare-fun mapKey!51362 () (_ BitVec 32))

(assert (=> mapNonEmpty!51362 (= mapRest!51356 (store mapRest!51362 mapKey!51362 mapValue!51362))))

(declare-fun condMapEmpty!51362 () Bool)

(declare-fun mapDefault!51362 () ValueCell!15717)

(assert (=> mapNonEmpty!51356 (= condMapEmpty!51362 (= mapRest!51356 ((as const (Array (_ BitVec 32) ValueCell!15717)) mapDefault!51362)))))

(assert (=> mapNonEmpty!51356 (= tp!97883 (and e!727207 mapRes!51362))))

(assert (= (and mapNonEmpty!51356 condMapEmpty!51362) mapIsEmpty!51362))

(assert (= (and mapNonEmpty!51356 (not condMapEmpty!51362)) mapNonEmpty!51362))

(assert (= (and mapNonEmpty!51362 ((_ is ValueCellFull!15717) mapValue!51362)) b!1274321))

(assert (= (and mapNonEmpty!51356 ((_ is ValueCellFull!15717) mapDefault!51362)) b!1274322))

(declare-fun m!1171121 () Bool)

(assert (=> mapNonEmpty!51362 m!1171121))

(check-sat (not b!1274299) (not b!1274275) (not b!1274292) (not b!1274276) (not mapNonEmpty!51362) (not b!1274311) (not b!1274302) (not d!140099) (not b!1274293) (not b!1274282) (not d!140109) (not b_next!27771) (not bm!62626) b_and!45827 (not bm!62629) tp_is_empty!33141 (not d!140105) (not b!1274300))
(check-sat b_and!45827 (not b_next!27771))
