; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76722 () Bool)

(assert start!76722)

(declare-fun b!897884 () Bool)

(declare-fun b_free!15967 () Bool)

(declare-fun b_next!15967 () Bool)

(assert (=> b!897884 (= b_free!15967 (not b_next!15967))))

(declare-fun tp!55945 () Bool)

(declare-fun b_and!26269 () Bool)

(assert (=> b!897884 (= tp!55945 b_and!26269)))

(declare-fun b!897878 () Bool)

(declare-fun res!606741 () Bool)

(declare-fun e!502055 () Bool)

(assert (=> b!897878 (=> (not res!606741) (not e!502055))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897878 (= res!606741 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897879 () Bool)

(declare-fun e!502058 () Bool)

(declare-datatypes ((SeekEntryResult!8856 0))(
  ( (MissingZero!8856 (index!37795 (_ BitVec 32))) (Found!8856 (index!37796 (_ BitVec 32))) (Intermediate!8856 (undefined!9668 Bool) (index!37797 (_ BitVec 32)) (x!76369 (_ BitVec 32))) (Undefined!8856) (MissingVacant!8856 (index!37798 (_ BitVec 32))) )
))
(declare-fun lt!405376 () SeekEntryResult!8856)

(declare-datatypes ((array!52651 0))(
  ( (array!52652 (arr!25306 (Array (_ BitVec 32) (_ BitVec 64))) (size!25760 (_ BitVec 32))) )
))
(declare-datatypes ((V!29359 0))(
  ( (V!29360 (val!9198 Int)) )
))
(declare-datatypes ((ValueCell!8666 0))(
  ( (ValueCellFull!8666 (v!11685 V!29359)) (EmptyCell!8666) )
))
(declare-datatypes ((array!52653 0))(
  ( (array!52654 (arr!25307 (Array (_ BitVec 32) ValueCell!8666)) (size!25761 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4348 0))(
  ( (LongMapFixedSize!4349 (defaultEntry!5386 Int) (mask!26097 (_ BitVec 32)) (extraKeys!5092 (_ BitVec 32)) (zeroValue!5196 V!29359) (minValue!5196 V!29359) (_size!2229 (_ BitVec 32)) (_keys!10161 array!52651) (_values!5383 array!52653) (_vacant!2229 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4348)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897879 (= e!502058 (inRange!0 (index!37796 lt!405376) (mask!26097 thiss!1181)))))

(declare-fun b!897880 () Bool)

(declare-fun e!502057 () Bool)

(declare-fun tp_is_empty!18295 () Bool)

(assert (=> b!897880 (= e!502057 tp_is_empty!18295)))

(declare-fun mapNonEmpty!29071 () Bool)

(declare-fun mapRes!29071 () Bool)

(declare-fun tp!55944 () Bool)

(declare-fun e!502052 () Bool)

(assert (=> mapNonEmpty!29071 (= mapRes!29071 (and tp!55944 e!502052))))

(declare-fun mapValue!29071 () ValueCell!8666)

(declare-fun mapKey!29071 () (_ BitVec 32))

(declare-fun mapRest!29071 () (Array (_ BitVec 32) ValueCell!8666))

(assert (=> mapNonEmpty!29071 (= (arr!25307 (_values!5383 thiss!1181)) (store mapRest!29071 mapKey!29071 mapValue!29071))))

(declare-fun res!606743 () Bool)

(assert (=> start!76722 (=> (not res!606743) (not e!502055))))

(declare-fun valid!1685 (LongMapFixedSize!4348) Bool)

(assert (=> start!76722 (= res!606743 (valid!1685 thiss!1181))))

(assert (=> start!76722 e!502055))

(declare-fun e!502056 () Bool)

(assert (=> start!76722 e!502056))

(assert (=> start!76722 true))

(declare-fun b!897881 () Bool)

(declare-fun e!502059 () Bool)

(declare-fun e!502051 () Bool)

(assert (=> b!897881 (= e!502059 e!502051)))

(declare-fun res!606739 () Bool)

(assert (=> b!897881 (=> res!606739 e!502051)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897881 (= res!606739 (not (validMask!0 (mask!26097 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897881 (arrayContainsKey!0 (_keys!10161 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30484 0))(
  ( (Unit!30485) )
))
(declare-fun lt!405377 () Unit!30484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52651 (_ BitVec 64) (_ BitVec 32)) Unit!30484)

(assert (=> b!897881 (= lt!405377 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10161 thiss!1181) key!785 (index!37796 lt!405376)))))

(declare-fun mapIsEmpty!29071 () Bool)

(assert (=> mapIsEmpty!29071 mapRes!29071))

(declare-fun b!897882 () Bool)

(declare-fun e!502054 () Bool)

(assert (=> b!897882 (= e!502054 (and e!502057 mapRes!29071))))

(declare-fun condMapEmpty!29071 () Bool)

(declare-fun mapDefault!29071 () ValueCell!8666)

(assert (=> b!897882 (= condMapEmpty!29071 (= (arr!25307 (_values!5383 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8666)) mapDefault!29071)))))

(declare-fun b!897883 () Bool)

(assert (=> b!897883 (= e!502052 tp_is_empty!18295)))

(declare-fun array_inv!19914 (array!52651) Bool)

(declare-fun array_inv!19915 (array!52653) Bool)

(assert (=> b!897884 (= e!502056 (and tp!55945 tp_is_empty!18295 (array_inv!19914 (_keys!10161 thiss!1181)) (array_inv!19915 (_values!5383 thiss!1181)) e!502054))))

(declare-fun b!897885 () Bool)

(assert (=> b!897885 (= e!502051 (or (not (= (size!25761 (_values!5383 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26097 thiss!1181)))) (not (= (size!25760 (_keys!10161 thiss!1181)) (size!25761 (_values!5383 thiss!1181)))) (bvsge (mask!26097 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!897886 () Bool)

(assert (=> b!897886 (= e!502055 (not e!502059))))

(declare-fun res!606742 () Bool)

(assert (=> b!897886 (=> res!606742 e!502059)))

(get-info :version)

(assert (=> b!897886 (= res!606742 (not ((_ is Found!8856) lt!405376)))))

(assert (=> b!897886 e!502058))

(declare-fun res!606740 () Bool)

(assert (=> b!897886 (=> res!606740 e!502058)))

(assert (=> b!897886 (= res!606740 (not ((_ is Found!8856) lt!405376)))))

(declare-fun lt!405375 () Unit!30484)

(declare-fun lemmaSeekEntryGivesInRangeIndex!83 (array!52651 array!52653 (_ BitVec 32) (_ BitVec 32) V!29359 V!29359 (_ BitVec 64)) Unit!30484)

(assert (=> b!897886 (= lt!405375 (lemmaSeekEntryGivesInRangeIndex!83 (_keys!10161 thiss!1181) (_values!5383 thiss!1181) (mask!26097 thiss!1181) (extraKeys!5092 thiss!1181) (zeroValue!5196 thiss!1181) (minValue!5196 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8856)

(assert (=> b!897886 (= lt!405376 (seekEntry!0 key!785 (_keys!10161 thiss!1181) (mask!26097 thiss!1181)))))

(assert (= (and start!76722 res!606743) b!897878))

(assert (= (and b!897878 res!606741) b!897886))

(assert (= (and b!897886 (not res!606740)) b!897879))

(assert (= (and b!897886 (not res!606742)) b!897881))

(assert (= (and b!897881 (not res!606739)) b!897885))

(assert (= (and b!897882 condMapEmpty!29071) mapIsEmpty!29071))

(assert (= (and b!897882 (not condMapEmpty!29071)) mapNonEmpty!29071))

(assert (= (and mapNonEmpty!29071 ((_ is ValueCellFull!8666) mapValue!29071)) b!897883))

(assert (= (and b!897882 ((_ is ValueCellFull!8666) mapDefault!29071)) b!897880))

(assert (= b!897884 b!897882))

(assert (= start!76722 b!897884))

(declare-fun m!835237 () Bool)

(assert (=> b!897879 m!835237))

(declare-fun m!835239 () Bool)

(assert (=> b!897884 m!835239))

(declare-fun m!835241 () Bool)

(assert (=> b!897884 m!835241))

(declare-fun m!835243 () Bool)

(assert (=> mapNonEmpty!29071 m!835243))

(declare-fun m!835245 () Bool)

(assert (=> b!897886 m!835245))

(declare-fun m!835247 () Bool)

(assert (=> b!897886 m!835247))

(declare-fun m!835249 () Bool)

(assert (=> start!76722 m!835249))

(declare-fun m!835251 () Bool)

(assert (=> b!897881 m!835251))

(declare-fun m!835253 () Bool)

(assert (=> b!897881 m!835253))

(declare-fun m!835255 () Bool)

(assert (=> b!897881 m!835255))

(check-sat (not b!897884) (not b_next!15967) tp_is_empty!18295 b_and!26269 (not mapNonEmpty!29071) (not start!76722) (not b!897881) (not b!897879) (not b!897886))
(check-sat b_and!26269 (not b_next!15967))
(get-model)

(declare-fun d!111335 () Bool)

(assert (=> d!111335 (= (validMask!0 (mask!26097 thiss!1181)) (and (or (= (mask!26097 thiss!1181) #b00000000000000000000000000000111) (= (mask!26097 thiss!1181) #b00000000000000000000000000001111) (= (mask!26097 thiss!1181) #b00000000000000000000000000011111) (= (mask!26097 thiss!1181) #b00000000000000000000000000111111) (= (mask!26097 thiss!1181) #b00000000000000000000000001111111) (= (mask!26097 thiss!1181) #b00000000000000000000000011111111) (= (mask!26097 thiss!1181) #b00000000000000000000000111111111) (= (mask!26097 thiss!1181) #b00000000000000000000001111111111) (= (mask!26097 thiss!1181) #b00000000000000000000011111111111) (= (mask!26097 thiss!1181) #b00000000000000000000111111111111) (= (mask!26097 thiss!1181) #b00000000000000000001111111111111) (= (mask!26097 thiss!1181) #b00000000000000000011111111111111) (= (mask!26097 thiss!1181) #b00000000000000000111111111111111) (= (mask!26097 thiss!1181) #b00000000000000001111111111111111) (= (mask!26097 thiss!1181) #b00000000000000011111111111111111) (= (mask!26097 thiss!1181) #b00000000000000111111111111111111) (= (mask!26097 thiss!1181) #b00000000000001111111111111111111) (= (mask!26097 thiss!1181) #b00000000000011111111111111111111) (= (mask!26097 thiss!1181) #b00000000000111111111111111111111) (= (mask!26097 thiss!1181) #b00000000001111111111111111111111) (= (mask!26097 thiss!1181) #b00000000011111111111111111111111) (= (mask!26097 thiss!1181) #b00000000111111111111111111111111) (= (mask!26097 thiss!1181) #b00000001111111111111111111111111) (= (mask!26097 thiss!1181) #b00000011111111111111111111111111) (= (mask!26097 thiss!1181) #b00000111111111111111111111111111) (= (mask!26097 thiss!1181) #b00001111111111111111111111111111) (= (mask!26097 thiss!1181) #b00011111111111111111111111111111) (= (mask!26097 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26097 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897881 d!111335))

(declare-fun d!111337 () Bool)

(declare-fun res!606778 () Bool)

(declare-fun e!502118 () Bool)

(assert (=> d!111337 (=> res!606778 e!502118)))

(assert (=> d!111337 (= res!606778 (= (select (arr!25306 (_keys!10161 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111337 (= (arrayContainsKey!0 (_keys!10161 thiss!1181) key!785 #b00000000000000000000000000000000) e!502118)))

(declare-fun b!897945 () Bool)

(declare-fun e!502119 () Bool)

(assert (=> b!897945 (= e!502118 e!502119)))

(declare-fun res!606779 () Bool)

(assert (=> b!897945 (=> (not res!606779) (not e!502119))))

(assert (=> b!897945 (= res!606779 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25760 (_keys!10161 thiss!1181))))))

(declare-fun b!897946 () Bool)

(assert (=> b!897946 (= e!502119 (arrayContainsKey!0 (_keys!10161 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111337 (not res!606778)) b!897945))

(assert (= (and b!897945 res!606779) b!897946))

(declare-fun m!835297 () Bool)

(assert (=> d!111337 m!835297))

(declare-fun m!835299 () Bool)

(assert (=> b!897946 m!835299))

(assert (=> b!897881 d!111337))

(declare-fun d!111339 () Bool)

(assert (=> d!111339 (arrayContainsKey!0 (_keys!10161 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405398 () Unit!30484)

(declare-fun choose!13 (array!52651 (_ BitVec 64) (_ BitVec 32)) Unit!30484)

(assert (=> d!111339 (= lt!405398 (choose!13 (_keys!10161 thiss!1181) key!785 (index!37796 lt!405376)))))

(assert (=> d!111339 (bvsge (index!37796 lt!405376) #b00000000000000000000000000000000)))

(assert (=> d!111339 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10161 thiss!1181) key!785 (index!37796 lt!405376)) lt!405398)))

(declare-fun bs!25193 () Bool)

(assert (= bs!25193 d!111339))

(assert (=> bs!25193 m!835253))

(declare-fun m!835301 () Bool)

(assert (=> bs!25193 m!835301))

(assert (=> b!897881 d!111339))

(declare-fun d!111341 () Bool)

(assert (=> d!111341 (= (array_inv!19914 (_keys!10161 thiss!1181)) (bvsge (size!25760 (_keys!10161 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897884 d!111341))

(declare-fun d!111343 () Bool)

(assert (=> d!111343 (= (array_inv!19915 (_values!5383 thiss!1181)) (bvsge (size!25761 (_values!5383 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897884 d!111343))

(declare-fun d!111345 () Bool)

(declare-fun res!606786 () Bool)

(declare-fun e!502122 () Bool)

(assert (=> d!111345 (=> (not res!606786) (not e!502122))))

(declare-fun simpleValid!316 (LongMapFixedSize!4348) Bool)

(assert (=> d!111345 (= res!606786 (simpleValid!316 thiss!1181))))

(assert (=> d!111345 (= (valid!1685 thiss!1181) e!502122)))

(declare-fun b!897953 () Bool)

(declare-fun res!606787 () Bool)

(assert (=> b!897953 (=> (not res!606787) (not e!502122))))

(declare-fun arrayCountValidKeys!0 (array!52651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897953 (= res!606787 (= (arrayCountValidKeys!0 (_keys!10161 thiss!1181) #b00000000000000000000000000000000 (size!25760 (_keys!10161 thiss!1181))) (_size!2229 thiss!1181)))))

(declare-fun b!897954 () Bool)

(declare-fun res!606788 () Bool)

(assert (=> b!897954 (=> (not res!606788) (not e!502122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52651 (_ BitVec 32)) Bool)

(assert (=> b!897954 (= res!606788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10161 thiss!1181) (mask!26097 thiss!1181)))))

(declare-fun b!897955 () Bool)

(declare-datatypes ((List!17776 0))(
  ( (Nil!17773) (Cons!17772 (h!18918 (_ BitVec 64)) (t!25107 List!17776)) )
))
(declare-fun arrayNoDuplicates!0 (array!52651 (_ BitVec 32) List!17776) Bool)

(assert (=> b!897955 (= e!502122 (arrayNoDuplicates!0 (_keys!10161 thiss!1181) #b00000000000000000000000000000000 Nil!17773))))

(assert (= (and d!111345 res!606786) b!897953))

(assert (= (and b!897953 res!606787) b!897954))

(assert (= (and b!897954 res!606788) b!897955))

(declare-fun m!835303 () Bool)

(assert (=> d!111345 m!835303))

(declare-fun m!835305 () Bool)

(assert (=> b!897953 m!835305))

(declare-fun m!835307 () Bool)

(assert (=> b!897954 m!835307))

(declare-fun m!835309 () Bool)

(assert (=> b!897955 m!835309))

(assert (=> start!76722 d!111345))

(declare-fun d!111347 () Bool)

(assert (=> d!111347 (= (inRange!0 (index!37796 lt!405376) (mask!26097 thiss!1181)) (and (bvsge (index!37796 lt!405376) #b00000000000000000000000000000000) (bvslt (index!37796 lt!405376) (bvadd (mask!26097 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897879 d!111347))

(declare-fun d!111349 () Bool)

(declare-fun e!502125 () Bool)

(assert (=> d!111349 e!502125))

(declare-fun res!606791 () Bool)

(assert (=> d!111349 (=> res!606791 e!502125)))

(declare-fun lt!405404 () SeekEntryResult!8856)

(assert (=> d!111349 (= res!606791 (not ((_ is Found!8856) lt!405404)))))

(assert (=> d!111349 (= lt!405404 (seekEntry!0 key!785 (_keys!10161 thiss!1181) (mask!26097 thiss!1181)))))

(declare-fun lt!405403 () Unit!30484)

(declare-fun choose!1487 (array!52651 array!52653 (_ BitVec 32) (_ BitVec 32) V!29359 V!29359 (_ BitVec 64)) Unit!30484)

(assert (=> d!111349 (= lt!405403 (choose!1487 (_keys!10161 thiss!1181) (_values!5383 thiss!1181) (mask!26097 thiss!1181) (extraKeys!5092 thiss!1181) (zeroValue!5196 thiss!1181) (minValue!5196 thiss!1181) key!785))))

(assert (=> d!111349 (validMask!0 (mask!26097 thiss!1181))))

(assert (=> d!111349 (= (lemmaSeekEntryGivesInRangeIndex!83 (_keys!10161 thiss!1181) (_values!5383 thiss!1181) (mask!26097 thiss!1181) (extraKeys!5092 thiss!1181) (zeroValue!5196 thiss!1181) (minValue!5196 thiss!1181) key!785) lt!405403)))

(declare-fun b!897958 () Bool)

(assert (=> b!897958 (= e!502125 (inRange!0 (index!37796 lt!405404) (mask!26097 thiss!1181)))))

(assert (= (and d!111349 (not res!606791)) b!897958))

(assert (=> d!111349 m!835247))

(declare-fun m!835311 () Bool)

(assert (=> d!111349 m!835311))

(assert (=> d!111349 m!835251))

(declare-fun m!835313 () Bool)

(assert (=> b!897958 m!835313))

(assert (=> b!897886 d!111349))

(declare-fun b!897971 () Bool)

(declare-fun c!95060 () Bool)

(declare-fun lt!405415 () (_ BitVec 64))

(assert (=> b!897971 (= c!95060 (= lt!405415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502134 () SeekEntryResult!8856)

(declare-fun e!502133 () SeekEntryResult!8856)

(assert (=> b!897971 (= e!502134 e!502133)))

(declare-fun b!897972 () Bool)

(declare-fun lt!405416 () SeekEntryResult!8856)

(assert (=> b!897972 (= e!502133 (MissingZero!8856 (index!37797 lt!405416)))))

(declare-fun b!897973 () Bool)

(assert (=> b!897973 (= e!502134 (Found!8856 (index!37797 lt!405416)))))

(declare-fun b!897974 () Bool)

(declare-fun e!502132 () SeekEntryResult!8856)

(assert (=> b!897974 (= e!502132 Undefined!8856)))

(declare-fun d!111351 () Bool)

(declare-fun lt!405413 () SeekEntryResult!8856)

(assert (=> d!111351 (and (or ((_ is MissingVacant!8856) lt!405413) (not ((_ is Found!8856) lt!405413)) (and (bvsge (index!37796 lt!405413) #b00000000000000000000000000000000) (bvslt (index!37796 lt!405413) (size!25760 (_keys!10161 thiss!1181))))) (not ((_ is MissingVacant!8856) lt!405413)) (or (not ((_ is Found!8856) lt!405413)) (= (select (arr!25306 (_keys!10161 thiss!1181)) (index!37796 lt!405413)) key!785)))))

(assert (=> d!111351 (= lt!405413 e!502132)))

(declare-fun c!95059 () Bool)

(assert (=> d!111351 (= c!95059 (and ((_ is Intermediate!8856) lt!405416) (undefined!9668 lt!405416)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8856)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111351 (= lt!405416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26097 thiss!1181)) key!785 (_keys!10161 thiss!1181) (mask!26097 thiss!1181)))))

(assert (=> d!111351 (validMask!0 (mask!26097 thiss!1181))))

(assert (=> d!111351 (= (seekEntry!0 key!785 (_keys!10161 thiss!1181) (mask!26097 thiss!1181)) lt!405413)))

(declare-fun b!897975 () Bool)

(declare-fun lt!405414 () SeekEntryResult!8856)

(assert (=> b!897975 (= e!502133 (ite ((_ is MissingVacant!8856) lt!405414) (MissingZero!8856 (index!37798 lt!405414)) lt!405414))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52651 (_ BitVec 32)) SeekEntryResult!8856)

(assert (=> b!897975 (= lt!405414 (seekKeyOrZeroReturnVacant!0 (x!76369 lt!405416) (index!37797 lt!405416) (index!37797 lt!405416) key!785 (_keys!10161 thiss!1181) (mask!26097 thiss!1181)))))

(declare-fun b!897976 () Bool)

(assert (=> b!897976 (= e!502132 e!502134)))

(assert (=> b!897976 (= lt!405415 (select (arr!25306 (_keys!10161 thiss!1181)) (index!37797 lt!405416)))))

(declare-fun c!95058 () Bool)

(assert (=> b!897976 (= c!95058 (= lt!405415 key!785))))

(assert (= (and d!111351 c!95059) b!897974))

(assert (= (and d!111351 (not c!95059)) b!897976))

(assert (= (and b!897976 c!95058) b!897973))

(assert (= (and b!897976 (not c!95058)) b!897971))

(assert (= (and b!897971 c!95060) b!897972))

(assert (= (and b!897971 (not c!95060)) b!897975))

(declare-fun m!835315 () Bool)

(assert (=> d!111351 m!835315))

(declare-fun m!835317 () Bool)

(assert (=> d!111351 m!835317))

(assert (=> d!111351 m!835317))

(declare-fun m!835319 () Bool)

(assert (=> d!111351 m!835319))

(assert (=> d!111351 m!835251))

(declare-fun m!835321 () Bool)

(assert (=> b!897975 m!835321))

(declare-fun m!835323 () Bool)

(assert (=> b!897976 m!835323))

(assert (=> b!897886 d!111351))

(declare-fun b!897984 () Bool)

(declare-fun e!502140 () Bool)

(assert (=> b!897984 (= e!502140 tp_is_empty!18295)))

(declare-fun b!897983 () Bool)

(declare-fun e!502139 () Bool)

(assert (=> b!897983 (= e!502139 tp_is_empty!18295)))

(declare-fun condMapEmpty!29080 () Bool)

(declare-fun mapDefault!29080 () ValueCell!8666)

(assert (=> mapNonEmpty!29071 (= condMapEmpty!29080 (= mapRest!29071 ((as const (Array (_ BitVec 32) ValueCell!8666)) mapDefault!29080)))))

(declare-fun mapRes!29080 () Bool)

(assert (=> mapNonEmpty!29071 (= tp!55944 (and e!502140 mapRes!29080))))

(declare-fun mapIsEmpty!29080 () Bool)

(assert (=> mapIsEmpty!29080 mapRes!29080))

(declare-fun mapNonEmpty!29080 () Bool)

(declare-fun tp!55960 () Bool)

(assert (=> mapNonEmpty!29080 (= mapRes!29080 (and tp!55960 e!502139))))

(declare-fun mapValue!29080 () ValueCell!8666)

(declare-fun mapKey!29080 () (_ BitVec 32))

(declare-fun mapRest!29080 () (Array (_ BitVec 32) ValueCell!8666))

(assert (=> mapNonEmpty!29080 (= mapRest!29071 (store mapRest!29080 mapKey!29080 mapValue!29080))))

(assert (= (and mapNonEmpty!29071 condMapEmpty!29080) mapIsEmpty!29080))

(assert (= (and mapNonEmpty!29071 (not condMapEmpty!29080)) mapNonEmpty!29080))

(assert (= (and mapNonEmpty!29080 ((_ is ValueCellFull!8666) mapValue!29080)) b!897983))

(assert (= (and mapNonEmpty!29071 ((_ is ValueCellFull!8666) mapDefault!29080)) b!897984))

(declare-fun m!835325 () Bool)

(assert (=> mapNonEmpty!29080 m!835325))

(check-sat (not b!897975) b_and!26269 (not b!897953) (not d!111349) (not b!897946) (not d!111351) (not mapNonEmpty!29080) (not b!897958) (not b_next!15967) tp_is_empty!18295 (not b!897954) (not d!111339) (not d!111345) (not b!897955))
(check-sat b_and!26269 (not b_next!15967))
