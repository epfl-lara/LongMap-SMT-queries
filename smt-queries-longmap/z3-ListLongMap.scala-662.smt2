; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16358 () Bool)

(assert start!16358)

(declare-fun b!163101 () Bool)

(declare-fun b_free!3781 () Bool)

(declare-fun b_next!3781 () Bool)

(assert (=> b!163101 (= b_free!3781 (not b_next!3781))))

(declare-fun tp!13920 () Bool)

(declare-fun b_and!10209 () Bool)

(assert (=> b!163101 (= tp!13920 b_and!10209)))

(declare-fun b!163094 () Bool)

(declare-fun res!77213 () Bool)

(declare-fun e!106987 () Bool)

(assert (=> b!163094 (=> (not res!77213) (not e!106987))))

(declare-datatypes ((V!4425 0))(
  ( (V!4426 (val!1836 Int)) )
))
(declare-datatypes ((ValueCell!1448 0))(
  ( (ValueCellFull!1448 (v!3702 V!4425)) (EmptyCell!1448) )
))
(declare-datatypes ((array!6235 0))(
  ( (array!6236 (arr!2960 (Array (_ BitVec 32) (_ BitVec 64))) (size!3245 (_ BitVec 32))) )
))
(declare-datatypes ((array!6237 0))(
  ( (array!6238 (arr!2961 (Array (_ BitVec 32) ValueCell!1448)) (size!3246 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1804 0))(
  ( (LongMapFixedSize!1805 (defaultEntry!3344 Int) (mask!7988 (_ BitVec 32)) (extraKeys!3085 (_ BitVec 32)) (zeroValue!3187 V!4425) (minValue!3187 V!4425) (_size!951 (_ BitVec 32)) (_keys!5150 array!6235) (_values!3327 array!6237) (_vacant!951 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1804)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163094 (= res!77213 (validMask!0 (mask!7988 thiss!1248)))))

(declare-fun b!163095 () Bool)

(declare-fun e!106983 () Bool)

(assert (=> b!163095 (= e!106983 e!106987)))

(declare-fun res!77212 () Bool)

(assert (=> b!163095 (=> (not res!77212) (not e!106987))))

(declare-datatypes ((SeekEntryResult!396 0))(
  ( (MissingZero!396 (index!3752 (_ BitVec 32))) (Found!396 (index!3753 (_ BitVec 32))) (Intermediate!396 (undefined!1208 Bool) (index!3754 (_ BitVec 32)) (x!18061 (_ BitVec 32))) (Undefined!396) (MissingVacant!396 (index!3755 (_ BitVec 32))) )
))
(declare-fun lt!82662 () SeekEntryResult!396)

(get-info :version)

(assert (=> b!163095 (= res!77212 (and (not ((_ is Undefined!396) lt!82662)) (not ((_ is MissingVacant!396) lt!82662)) (not ((_ is MissingZero!396) lt!82662)) ((_ is Found!396) lt!82662)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6235 (_ BitVec 32)) SeekEntryResult!396)

(assert (=> b!163095 (= lt!82662 (seekEntryOrOpen!0 key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163096 () Bool)

(assert (=> b!163096 (= e!106987 (and (= (size!3246 (_values!3327 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7988 thiss!1248))) (not (= (size!3245 (_keys!5150 thiss!1248)) (size!3246 (_values!3327 thiss!1248))))))))

(declare-fun b!163097 () Bool)

(declare-fun e!106982 () Bool)

(declare-fun e!106984 () Bool)

(declare-fun mapRes!6069 () Bool)

(assert (=> b!163097 (= e!106982 (and e!106984 mapRes!6069))))

(declare-fun condMapEmpty!6069 () Bool)

(declare-fun mapDefault!6069 () ValueCell!1448)

(assert (=> b!163097 (= condMapEmpty!6069 (= (arr!2961 (_values!3327 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1448)) mapDefault!6069)))))

(declare-fun mapNonEmpty!6069 () Bool)

(declare-fun tp!13919 () Bool)

(declare-fun e!106986 () Bool)

(assert (=> mapNonEmpty!6069 (= mapRes!6069 (and tp!13919 e!106986))))

(declare-fun mapValue!6069 () ValueCell!1448)

(declare-fun mapKey!6069 () (_ BitVec 32))

(declare-fun mapRest!6069 () (Array (_ BitVec 32) ValueCell!1448))

(assert (=> mapNonEmpty!6069 (= (arr!2961 (_values!3327 thiss!1248)) (store mapRest!6069 mapKey!6069 mapValue!6069))))

(declare-fun b!163099 () Bool)

(declare-fun tp_is_empty!3583 () Bool)

(assert (=> b!163099 (= e!106986 tp_is_empty!3583)))

(declare-fun mapIsEmpty!6069 () Bool)

(assert (=> mapIsEmpty!6069 mapRes!6069))

(declare-fun b!163098 () Bool)

(assert (=> b!163098 (= e!106984 tp_is_empty!3583)))

(declare-fun res!77214 () Bool)

(assert (=> start!16358 (=> (not res!77214) (not e!106983))))

(declare-fun valid!832 (LongMapFixedSize!1804) Bool)

(assert (=> start!16358 (= res!77214 (valid!832 thiss!1248))))

(assert (=> start!16358 e!106983))

(declare-fun e!106985 () Bool)

(assert (=> start!16358 e!106985))

(assert (=> start!16358 true))

(declare-fun b!163100 () Bool)

(declare-fun res!77211 () Bool)

(assert (=> b!163100 (=> (not res!77211) (not e!106983))))

(assert (=> b!163100 (= res!77211 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1903 (array!6235) Bool)

(declare-fun array_inv!1904 (array!6237) Bool)

(assert (=> b!163101 (= e!106985 (and tp!13920 tp_is_empty!3583 (array_inv!1903 (_keys!5150 thiss!1248)) (array_inv!1904 (_values!3327 thiss!1248)) e!106982))))

(assert (= (and start!16358 res!77214) b!163100))

(assert (= (and b!163100 res!77211) b!163095))

(assert (= (and b!163095 res!77212) b!163094))

(assert (= (and b!163094 res!77213) b!163096))

(assert (= (and b!163097 condMapEmpty!6069) mapIsEmpty!6069))

(assert (= (and b!163097 (not condMapEmpty!6069)) mapNonEmpty!6069))

(assert (= (and mapNonEmpty!6069 ((_ is ValueCellFull!1448) mapValue!6069)) b!163099))

(assert (= (and b!163097 ((_ is ValueCellFull!1448) mapDefault!6069)) b!163098))

(assert (= b!163101 b!163097))

(assert (= start!16358 b!163101))

(declare-fun m!194095 () Bool)

(assert (=> start!16358 m!194095))

(declare-fun m!194097 () Bool)

(assert (=> b!163094 m!194097))

(declare-fun m!194099 () Bool)

(assert (=> b!163101 m!194099))

(declare-fun m!194101 () Bool)

(assert (=> b!163101 m!194101))

(declare-fun m!194103 () Bool)

(assert (=> b!163095 m!194103))

(declare-fun m!194105 () Bool)

(assert (=> mapNonEmpty!6069 m!194105))

(check-sat tp_is_empty!3583 (not b!163094) (not b!163095) (not start!16358) (not mapNonEmpty!6069) (not b_next!3781) b_and!10209 (not b!163101))
(check-sat b_and!10209 (not b_next!3781))
(get-model)

(declare-fun d!51469 () Bool)

(assert (=> d!51469 (= (validMask!0 (mask!7988 thiss!1248)) (and (or (= (mask!7988 thiss!1248) #b00000000000000000000000000000111) (= (mask!7988 thiss!1248) #b00000000000000000000000000001111) (= (mask!7988 thiss!1248) #b00000000000000000000000000011111) (= (mask!7988 thiss!1248) #b00000000000000000000000000111111) (= (mask!7988 thiss!1248) #b00000000000000000000000001111111) (= (mask!7988 thiss!1248) #b00000000000000000000000011111111) (= (mask!7988 thiss!1248) #b00000000000000000000000111111111) (= (mask!7988 thiss!1248) #b00000000000000000000001111111111) (= (mask!7988 thiss!1248) #b00000000000000000000011111111111) (= (mask!7988 thiss!1248) #b00000000000000000000111111111111) (= (mask!7988 thiss!1248) #b00000000000000000001111111111111) (= (mask!7988 thiss!1248) #b00000000000000000011111111111111) (= (mask!7988 thiss!1248) #b00000000000000000111111111111111) (= (mask!7988 thiss!1248) #b00000000000000001111111111111111) (= (mask!7988 thiss!1248) #b00000000000000011111111111111111) (= (mask!7988 thiss!1248) #b00000000000000111111111111111111) (= (mask!7988 thiss!1248) #b00000000000001111111111111111111) (= (mask!7988 thiss!1248) #b00000000000011111111111111111111) (= (mask!7988 thiss!1248) #b00000000000111111111111111111111) (= (mask!7988 thiss!1248) #b00000000001111111111111111111111) (= (mask!7988 thiss!1248) #b00000000011111111111111111111111) (= (mask!7988 thiss!1248) #b00000000111111111111111111111111) (= (mask!7988 thiss!1248) #b00000001111111111111111111111111) (= (mask!7988 thiss!1248) #b00000011111111111111111111111111) (= (mask!7988 thiss!1248) #b00000111111111111111111111111111) (= (mask!7988 thiss!1248) #b00001111111111111111111111111111) (= (mask!7988 thiss!1248) #b00011111111111111111111111111111) (= (mask!7988 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7988 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163094 d!51469))

(declare-fun d!51471 () Bool)

(assert (=> d!51471 (= (array_inv!1903 (_keys!5150 thiss!1248)) (bvsge (size!3245 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163101 d!51471))

(declare-fun d!51473 () Bool)

(assert (=> d!51473 (= (array_inv!1904 (_values!3327 thiss!1248)) (bvsge (size!3246 (_values!3327 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163101 d!51473))

(declare-fun d!51475 () Bool)

(declare-fun res!77245 () Bool)

(declare-fun e!107033 () Bool)

(assert (=> d!51475 (=> (not res!77245) (not e!107033))))

(declare-fun simpleValid!120 (LongMapFixedSize!1804) Bool)

(assert (=> d!51475 (= res!77245 (simpleValid!120 thiss!1248))))

(assert (=> d!51475 (= (valid!832 thiss!1248) e!107033)))

(declare-fun b!163156 () Bool)

(declare-fun res!77246 () Bool)

(assert (=> b!163156 (=> (not res!77246) (not e!107033))))

(declare-fun arrayCountValidKeys!0 (array!6235 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163156 (= res!77246 (= (arrayCountValidKeys!0 (_keys!5150 thiss!1248) #b00000000000000000000000000000000 (size!3245 (_keys!5150 thiss!1248))) (_size!951 thiss!1248)))))

(declare-fun b!163157 () Bool)

(declare-fun res!77247 () Bool)

(assert (=> b!163157 (=> (not res!77247) (not e!107033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6235 (_ BitVec 32)) Bool)

(assert (=> b!163157 (= res!77247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163158 () Bool)

(declare-datatypes ((List!1985 0))(
  ( (Nil!1982) (Cons!1981 (h!2595 (_ BitVec 64)) (t!6779 List!1985)) )
))
(declare-fun arrayNoDuplicates!0 (array!6235 (_ BitVec 32) List!1985) Bool)

(assert (=> b!163158 (= e!107033 (arrayNoDuplicates!0 (_keys!5150 thiss!1248) #b00000000000000000000000000000000 Nil!1982))))

(assert (= (and d!51475 res!77245) b!163156))

(assert (= (and b!163156 res!77246) b!163157))

(assert (= (and b!163157 res!77247) b!163158))

(declare-fun m!194131 () Bool)

(assert (=> d!51475 m!194131))

(declare-fun m!194133 () Bool)

(assert (=> b!163156 m!194133))

(declare-fun m!194135 () Bool)

(assert (=> b!163157 m!194135))

(declare-fun m!194137 () Bool)

(assert (=> b!163158 m!194137))

(assert (=> start!16358 d!51475))

(declare-fun b!163171 () Bool)

(declare-fun c!30046 () Bool)

(declare-fun lt!82677 () (_ BitVec 64))

(assert (=> b!163171 (= c!30046 (= lt!82677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107042 () SeekEntryResult!396)

(declare-fun e!107041 () SeekEntryResult!396)

(assert (=> b!163171 (= e!107042 e!107041)))

(declare-fun b!163172 () Bool)

(declare-fun lt!82676 () SeekEntryResult!396)

(assert (=> b!163172 (= e!107042 (Found!396 (index!3754 lt!82676)))))

(declare-fun d!51477 () Bool)

(declare-fun lt!82675 () SeekEntryResult!396)

(assert (=> d!51477 (and (or ((_ is Undefined!396) lt!82675) (not ((_ is Found!396) lt!82675)) (and (bvsge (index!3753 lt!82675) #b00000000000000000000000000000000) (bvslt (index!3753 lt!82675) (size!3245 (_keys!5150 thiss!1248))))) (or ((_ is Undefined!396) lt!82675) ((_ is Found!396) lt!82675) (not ((_ is MissingZero!396) lt!82675)) (and (bvsge (index!3752 lt!82675) #b00000000000000000000000000000000) (bvslt (index!3752 lt!82675) (size!3245 (_keys!5150 thiss!1248))))) (or ((_ is Undefined!396) lt!82675) ((_ is Found!396) lt!82675) ((_ is MissingZero!396) lt!82675) (not ((_ is MissingVacant!396) lt!82675)) (and (bvsge (index!3755 lt!82675) #b00000000000000000000000000000000) (bvslt (index!3755 lt!82675) (size!3245 (_keys!5150 thiss!1248))))) (or ((_ is Undefined!396) lt!82675) (ite ((_ is Found!396) lt!82675) (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3753 lt!82675)) key!828) (ite ((_ is MissingZero!396) lt!82675) (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3752 lt!82675)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!396) lt!82675) (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3755 lt!82675)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!107040 () SeekEntryResult!396)

(assert (=> d!51477 (= lt!82675 e!107040)))

(declare-fun c!30047 () Bool)

(assert (=> d!51477 (= c!30047 (and ((_ is Intermediate!396) lt!82676) (undefined!1208 lt!82676)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6235 (_ BitVec 32)) SeekEntryResult!396)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51477 (= lt!82676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7988 thiss!1248)) key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(assert (=> d!51477 (validMask!0 (mask!7988 thiss!1248))))

(assert (=> d!51477 (= (seekEntryOrOpen!0 key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)) lt!82675)))

(declare-fun b!163173 () Bool)

(assert (=> b!163173 (= e!107040 e!107042)))

(assert (=> b!163173 (= lt!82677 (select (arr!2960 (_keys!5150 thiss!1248)) (index!3754 lt!82676)))))

(declare-fun c!30045 () Bool)

(assert (=> b!163173 (= c!30045 (= lt!82677 key!828))))

(declare-fun b!163174 () Bool)

(assert (=> b!163174 (= e!107040 Undefined!396)))

(declare-fun b!163175 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6235 (_ BitVec 32)) SeekEntryResult!396)

(assert (=> b!163175 (= e!107041 (seekKeyOrZeroReturnVacant!0 (x!18061 lt!82676) (index!3754 lt!82676) (index!3754 lt!82676) key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163176 () Bool)

(assert (=> b!163176 (= e!107041 (MissingZero!396 (index!3754 lt!82676)))))

(assert (= (and d!51477 c!30047) b!163174))

(assert (= (and d!51477 (not c!30047)) b!163173))

(assert (= (and b!163173 c!30045) b!163172))

(assert (= (and b!163173 (not c!30045)) b!163171))

(assert (= (and b!163171 c!30046) b!163176))

(assert (= (and b!163171 (not c!30046)) b!163175))

(declare-fun m!194139 () Bool)

(assert (=> d!51477 m!194139))

(declare-fun m!194141 () Bool)

(assert (=> d!51477 m!194141))

(declare-fun m!194143 () Bool)

(assert (=> d!51477 m!194143))

(declare-fun m!194145 () Bool)

(assert (=> d!51477 m!194145))

(assert (=> d!51477 m!194097))

(declare-fun m!194147 () Bool)

(assert (=> d!51477 m!194147))

(assert (=> d!51477 m!194139))

(declare-fun m!194149 () Bool)

(assert (=> b!163173 m!194149))

(declare-fun m!194151 () Bool)

(assert (=> b!163175 m!194151))

(assert (=> b!163095 d!51477))

(declare-fun mapIsEmpty!6078 () Bool)

(declare-fun mapRes!6078 () Bool)

(assert (=> mapIsEmpty!6078 mapRes!6078))

(declare-fun condMapEmpty!6078 () Bool)

(declare-fun mapDefault!6078 () ValueCell!1448)

(assert (=> mapNonEmpty!6069 (= condMapEmpty!6078 (= mapRest!6069 ((as const (Array (_ BitVec 32) ValueCell!1448)) mapDefault!6078)))))

(declare-fun e!107047 () Bool)

(assert (=> mapNonEmpty!6069 (= tp!13919 (and e!107047 mapRes!6078))))

(declare-fun b!163183 () Bool)

(declare-fun e!107048 () Bool)

(assert (=> b!163183 (= e!107048 tp_is_empty!3583)))

(declare-fun b!163184 () Bool)

(assert (=> b!163184 (= e!107047 tp_is_empty!3583)))

(declare-fun mapNonEmpty!6078 () Bool)

(declare-fun tp!13935 () Bool)

(assert (=> mapNonEmpty!6078 (= mapRes!6078 (and tp!13935 e!107048))))

(declare-fun mapKey!6078 () (_ BitVec 32))

(declare-fun mapRest!6078 () (Array (_ BitVec 32) ValueCell!1448))

(declare-fun mapValue!6078 () ValueCell!1448)

(assert (=> mapNonEmpty!6078 (= mapRest!6069 (store mapRest!6078 mapKey!6078 mapValue!6078))))

(assert (= (and mapNonEmpty!6069 condMapEmpty!6078) mapIsEmpty!6078))

(assert (= (and mapNonEmpty!6069 (not condMapEmpty!6078)) mapNonEmpty!6078))

(assert (= (and mapNonEmpty!6078 ((_ is ValueCellFull!1448) mapValue!6078)) b!163183))

(assert (= (and mapNonEmpty!6069 ((_ is ValueCellFull!1448) mapDefault!6078)) b!163184))

(declare-fun m!194153 () Bool)

(assert (=> mapNonEmpty!6078 m!194153))

(check-sat tp_is_empty!3583 (not b!163157) (not d!51477) (not b!163158) (not mapNonEmpty!6078) (not b!163175) (not d!51475) (not b_next!3781) (not b!163156) b_and!10209)
(check-sat b_and!10209 (not b_next!3781))
(get-model)

(declare-fun b!163193 () Bool)

(declare-fun e!107054 () (_ BitVec 32))

(declare-fun call!17284 () (_ BitVec 32))

(assert (=> b!163193 (= e!107054 call!17284)))

(declare-fun b!163194 () Bool)

(declare-fun e!107053 () (_ BitVec 32))

(assert (=> b!163194 (= e!107053 e!107054)))

(declare-fun c!30053 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163194 (= c!30053 (validKeyInArray!0 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17281 () Bool)

(assert (=> bm!17281 (= call!17284 (arrayCountValidKeys!0 (_keys!5150 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3245 (_keys!5150 thiss!1248))))))

(declare-fun d!51479 () Bool)

(declare-fun lt!82680 () (_ BitVec 32))

(assert (=> d!51479 (and (bvsge lt!82680 #b00000000000000000000000000000000) (bvsle lt!82680 (bvsub (size!3245 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51479 (= lt!82680 e!107053)))

(declare-fun c!30052 () Bool)

(assert (=> d!51479 (= c!30052 (bvsge #b00000000000000000000000000000000 (size!3245 (_keys!5150 thiss!1248))))))

(assert (=> d!51479 (and (bvsle #b00000000000000000000000000000000 (size!3245 (_keys!5150 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3245 (_keys!5150 thiss!1248)) (size!3245 (_keys!5150 thiss!1248))))))

(assert (=> d!51479 (= (arrayCountValidKeys!0 (_keys!5150 thiss!1248) #b00000000000000000000000000000000 (size!3245 (_keys!5150 thiss!1248))) lt!82680)))

(declare-fun b!163195 () Bool)

(assert (=> b!163195 (= e!107053 #b00000000000000000000000000000000)))

(declare-fun b!163196 () Bool)

(assert (=> b!163196 (= e!107054 (bvadd #b00000000000000000000000000000001 call!17284))))

(assert (= (and d!51479 c!30052) b!163195))

(assert (= (and d!51479 (not c!30052)) b!163194))

(assert (= (and b!163194 c!30053) b!163196))

(assert (= (and b!163194 (not c!30053)) b!163193))

(assert (= (or b!163196 b!163193) bm!17281))

(declare-fun m!194155 () Bool)

(assert (=> b!163194 m!194155))

(assert (=> b!163194 m!194155))

(declare-fun m!194157 () Bool)

(assert (=> b!163194 m!194157))

(declare-fun m!194159 () Bool)

(assert (=> bm!17281 m!194159))

(assert (=> b!163156 d!51479))

(declare-fun lt!82686 () SeekEntryResult!396)

(declare-fun d!51481 () Bool)

(assert (=> d!51481 (and (or ((_ is Undefined!396) lt!82686) (not ((_ is Found!396) lt!82686)) (and (bvsge (index!3753 lt!82686) #b00000000000000000000000000000000) (bvslt (index!3753 lt!82686) (size!3245 (_keys!5150 thiss!1248))))) (or ((_ is Undefined!396) lt!82686) ((_ is Found!396) lt!82686) (not ((_ is MissingVacant!396) lt!82686)) (not (= (index!3755 lt!82686) (index!3754 lt!82676))) (and (bvsge (index!3755 lt!82686) #b00000000000000000000000000000000) (bvslt (index!3755 lt!82686) (size!3245 (_keys!5150 thiss!1248))))) (or ((_ is Undefined!396) lt!82686) (ite ((_ is Found!396) lt!82686) (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3753 lt!82686)) key!828) (and ((_ is MissingVacant!396) lt!82686) (= (index!3755 lt!82686) (index!3754 lt!82676)) (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3755 lt!82686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!107061 () SeekEntryResult!396)

(assert (=> d!51481 (= lt!82686 e!107061)))

(declare-fun c!30061 () Bool)

(assert (=> d!51481 (= c!30061 (bvsge (x!18061 lt!82676) #b01111111111111111111111111111110))))

(declare-fun lt!82685 () (_ BitVec 64))

(assert (=> d!51481 (= lt!82685 (select (arr!2960 (_keys!5150 thiss!1248)) (index!3754 lt!82676)))))

(assert (=> d!51481 (validMask!0 (mask!7988 thiss!1248))))

(assert (=> d!51481 (= (seekKeyOrZeroReturnVacant!0 (x!18061 lt!82676) (index!3754 lt!82676) (index!3754 lt!82676) key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)) lt!82686)))

(declare-fun b!163209 () Bool)

(declare-fun c!30060 () Bool)

(assert (=> b!163209 (= c!30060 (= lt!82685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107062 () SeekEntryResult!396)

(declare-fun e!107063 () SeekEntryResult!396)

(assert (=> b!163209 (= e!107062 e!107063)))

(declare-fun b!163210 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163210 (= e!107063 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18061 lt!82676) #b00000000000000000000000000000001) (nextIndex!0 (index!3754 lt!82676) (bvadd (x!18061 lt!82676) #b00000000000000000000000000000001) (mask!7988 thiss!1248)) (index!3754 lt!82676) key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163211 () Bool)

(assert (=> b!163211 (= e!107061 Undefined!396)))

(declare-fun b!163212 () Bool)

(assert (=> b!163212 (= e!107062 (Found!396 (index!3754 lt!82676)))))

(declare-fun b!163213 () Bool)

(assert (=> b!163213 (= e!107061 e!107062)))

(declare-fun c!30062 () Bool)

(assert (=> b!163213 (= c!30062 (= lt!82685 key!828))))

(declare-fun b!163214 () Bool)

(assert (=> b!163214 (= e!107063 (MissingVacant!396 (index!3754 lt!82676)))))

(assert (= (and d!51481 c!30061) b!163211))

(assert (= (and d!51481 (not c!30061)) b!163213))

(assert (= (and b!163213 c!30062) b!163212))

(assert (= (and b!163213 (not c!30062)) b!163209))

(assert (= (and b!163209 c!30060) b!163214))

(assert (= (and b!163209 (not c!30060)) b!163210))

(declare-fun m!194161 () Bool)

(assert (=> d!51481 m!194161))

(declare-fun m!194163 () Bool)

(assert (=> d!51481 m!194163))

(assert (=> d!51481 m!194149))

(assert (=> d!51481 m!194097))

(declare-fun m!194165 () Bool)

(assert (=> b!163210 m!194165))

(assert (=> b!163210 m!194165))

(declare-fun m!194167 () Bool)

(assert (=> b!163210 m!194167))

(assert (=> b!163175 d!51481))

(declare-fun b!163224 () Bool)

(declare-fun res!77257 () Bool)

(declare-fun e!107066 () Bool)

(assert (=> b!163224 (=> (not res!77257) (not e!107066))))

(declare-fun size!3251 (LongMapFixedSize!1804) (_ BitVec 32))

(assert (=> b!163224 (= res!77257 (bvsge (size!3251 thiss!1248) (_size!951 thiss!1248)))))

(declare-fun b!163225 () Bool)

(declare-fun res!77259 () Bool)

(assert (=> b!163225 (=> (not res!77259) (not e!107066))))

(assert (=> b!163225 (= res!77259 (= (size!3251 thiss!1248) (bvadd (_size!951 thiss!1248) (bvsdiv (bvadd (extraKeys!3085 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163226 () Bool)

(assert (=> b!163226 (= e!107066 (and (bvsge (extraKeys!3085 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3085 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!951 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163223 () Bool)

(declare-fun res!77256 () Bool)

(assert (=> b!163223 (=> (not res!77256) (not e!107066))))

(assert (=> b!163223 (= res!77256 (and (= (size!3246 (_values!3327 thiss!1248)) (bvadd (mask!7988 thiss!1248) #b00000000000000000000000000000001)) (= (size!3245 (_keys!5150 thiss!1248)) (size!3246 (_values!3327 thiss!1248))) (bvsge (_size!951 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!951 thiss!1248) (bvadd (mask!7988 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51483 () Bool)

(declare-fun res!77258 () Bool)

(assert (=> d!51483 (=> (not res!77258) (not e!107066))))

(assert (=> d!51483 (= res!77258 (validMask!0 (mask!7988 thiss!1248)))))

(assert (=> d!51483 (= (simpleValid!120 thiss!1248) e!107066)))

(assert (= (and d!51483 res!77258) b!163223))

(assert (= (and b!163223 res!77256) b!163224))

(assert (= (and b!163224 res!77257) b!163225))

(assert (= (and b!163225 res!77259) b!163226))

(declare-fun m!194169 () Bool)

(assert (=> b!163224 m!194169))

(assert (=> b!163225 m!194169))

(assert (=> d!51483 m!194097))

(assert (=> d!51475 d!51483))

(declare-fun b!163245 () Bool)

(declare-fun lt!82691 () SeekEntryResult!396)

(assert (=> b!163245 (and (bvsge (index!3754 lt!82691) #b00000000000000000000000000000000) (bvslt (index!3754 lt!82691) (size!3245 (_keys!5150 thiss!1248))))))

(declare-fun res!77267 () Bool)

(assert (=> b!163245 (= res!77267 (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3754 lt!82691)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107078 () Bool)

(assert (=> b!163245 (=> res!77267 e!107078)))

(declare-fun b!163247 () Bool)

(declare-fun e!107079 () Bool)

(declare-fun e!107077 () Bool)

(assert (=> b!163247 (= e!107079 e!107077)))

(declare-fun res!77268 () Bool)

(assert (=> b!163247 (= res!77268 (and ((_ is Intermediate!396) lt!82691) (not (undefined!1208 lt!82691)) (bvslt (x!18061 lt!82691) #b01111111111111111111111111111110) (bvsge (x!18061 lt!82691) #b00000000000000000000000000000000) (bvsge (x!18061 lt!82691) #b00000000000000000000000000000000)))))

(assert (=> b!163247 (=> (not res!77268) (not e!107077))))

(declare-fun b!163248 () Bool)

(assert (=> b!163248 (and (bvsge (index!3754 lt!82691) #b00000000000000000000000000000000) (bvslt (index!3754 lt!82691) (size!3245 (_keys!5150 thiss!1248))))))

(declare-fun res!77266 () Bool)

(assert (=> b!163248 (= res!77266 (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3754 lt!82691)) key!828))))

(assert (=> b!163248 (=> res!77266 e!107078)))

(assert (=> b!163248 (= e!107077 e!107078)))

(declare-fun b!163249 () Bool)

(assert (=> b!163249 (= e!107079 (bvsge (x!18061 lt!82691) #b01111111111111111111111111111110))))

(declare-fun b!163250 () Bool)

(declare-fun e!107080 () SeekEntryResult!396)

(assert (=> b!163250 (= e!107080 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7988 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7988 thiss!1248)) key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163251 () Bool)

(declare-fun e!107081 () SeekEntryResult!396)

(assert (=> b!163251 (= e!107081 (Intermediate!396 true (toIndex!0 key!828 (mask!7988 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163252 () Bool)

(assert (=> b!163252 (= e!107080 (Intermediate!396 false (toIndex!0 key!828 (mask!7988 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163253 () Bool)

(assert (=> b!163253 (= e!107081 e!107080)))

(declare-fun c!30069 () Bool)

(declare-fun lt!82692 () (_ BitVec 64))

(assert (=> b!163253 (= c!30069 (or (= lt!82692 key!828) (= (bvadd lt!82692 lt!82692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!51485 () Bool)

(assert (=> d!51485 e!107079))

(declare-fun c!30071 () Bool)

(assert (=> d!51485 (= c!30071 (and ((_ is Intermediate!396) lt!82691) (undefined!1208 lt!82691)))))

(assert (=> d!51485 (= lt!82691 e!107081)))

(declare-fun c!30070 () Bool)

(assert (=> d!51485 (= c!30070 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51485 (= lt!82692 (select (arr!2960 (_keys!5150 thiss!1248)) (toIndex!0 key!828 (mask!7988 thiss!1248))))))

(assert (=> d!51485 (validMask!0 (mask!7988 thiss!1248))))

(assert (=> d!51485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7988 thiss!1248)) key!828 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)) lt!82691)))

(declare-fun b!163246 () Bool)

(assert (=> b!163246 (and (bvsge (index!3754 lt!82691) #b00000000000000000000000000000000) (bvslt (index!3754 lt!82691) (size!3245 (_keys!5150 thiss!1248))))))

(assert (=> b!163246 (= e!107078 (= (select (arr!2960 (_keys!5150 thiss!1248)) (index!3754 lt!82691)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51485 c!30070) b!163251))

(assert (= (and d!51485 (not c!30070)) b!163253))

(assert (= (and b!163253 c!30069) b!163252))

(assert (= (and b!163253 (not c!30069)) b!163250))

(assert (= (and d!51485 c!30071) b!163249))

(assert (= (and d!51485 (not c!30071)) b!163247))

(assert (= (and b!163247 res!77268) b!163248))

(assert (= (and b!163248 (not res!77266)) b!163245))

(assert (= (and b!163245 (not res!77267)) b!163246))

(assert (=> b!163250 m!194139))

(declare-fun m!194171 () Bool)

(assert (=> b!163250 m!194171))

(assert (=> b!163250 m!194171))

(declare-fun m!194173 () Bool)

(assert (=> b!163250 m!194173))

(declare-fun m!194175 () Bool)

(assert (=> b!163248 m!194175))

(assert (=> d!51485 m!194139))

(declare-fun m!194177 () Bool)

(assert (=> d!51485 m!194177))

(assert (=> d!51485 m!194097))

(assert (=> b!163246 m!194175))

(assert (=> b!163245 m!194175))

(assert (=> d!51477 d!51485))

(declare-fun d!51487 () Bool)

(declare-fun lt!82698 () (_ BitVec 32))

(declare-fun lt!82697 () (_ BitVec 32))

(assert (=> d!51487 (= lt!82698 (bvmul (bvxor lt!82697 (bvlshr lt!82697 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51487 (= lt!82697 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51487 (and (bvsge (mask!7988 thiss!1248) #b00000000000000000000000000000000) (let ((res!77269 (let ((h!2596 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18079 (bvmul (bvxor h!2596 (bvlshr h!2596 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18079 (bvlshr x!18079 #b00000000000000000000000000001101)) (mask!7988 thiss!1248)))))) (and (bvslt res!77269 (bvadd (mask!7988 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77269 #b00000000000000000000000000000000))))))

(assert (=> d!51487 (= (toIndex!0 key!828 (mask!7988 thiss!1248)) (bvand (bvxor lt!82698 (bvlshr lt!82698 #b00000000000000000000000000001101)) (mask!7988 thiss!1248)))))

(assert (=> d!51477 d!51487))

(assert (=> d!51477 d!51469))

(declare-fun b!163262 () Bool)

(declare-fun e!107090 () Bool)

(declare-fun e!107089 () Bool)

(assert (=> b!163262 (= e!107090 e!107089)))

(declare-fun lt!82707 () (_ BitVec 64))

(assert (=> b!163262 (= lt!82707 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5044 0))(
  ( (Unit!5045) )
))
(declare-fun lt!82706 () Unit!5044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6235 (_ BitVec 64) (_ BitVec 32)) Unit!5044)

(assert (=> b!163262 (= lt!82706 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5150 thiss!1248) lt!82707 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163262 (arrayContainsKey!0 (_keys!5150 thiss!1248) lt!82707 #b00000000000000000000000000000000)))

(declare-fun lt!82705 () Unit!5044)

(assert (=> b!163262 (= lt!82705 lt!82706)))

(declare-fun res!77274 () Bool)

(assert (=> b!163262 (= res!77274 (= (seekEntryOrOpen!0 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000) (_keys!5150 thiss!1248) (mask!7988 thiss!1248)) (Found!396 #b00000000000000000000000000000000)))))

(assert (=> b!163262 (=> (not res!77274) (not e!107089))))

(declare-fun bm!17284 () Bool)

(declare-fun call!17287 () Bool)

(assert (=> bm!17284 (= call!17287 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5150 thiss!1248) (mask!7988 thiss!1248)))))

(declare-fun b!163263 () Bool)

(assert (=> b!163263 (= e!107089 call!17287)))

(declare-fun d!51489 () Bool)

(declare-fun res!77275 () Bool)

(declare-fun e!107088 () Bool)

(assert (=> d!51489 (=> res!77275 e!107088)))

(assert (=> d!51489 (= res!77275 (bvsge #b00000000000000000000000000000000 (size!3245 (_keys!5150 thiss!1248))))))

(assert (=> d!51489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5150 thiss!1248) (mask!7988 thiss!1248)) e!107088)))

(declare-fun b!163264 () Bool)

(assert (=> b!163264 (= e!107090 call!17287)))

(declare-fun b!163265 () Bool)

(assert (=> b!163265 (= e!107088 e!107090)))

(declare-fun c!30074 () Bool)

(assert (=> b!163265 (= c!30074 (validKeyInArray!0 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51489 (not res!77275)) b!163265))

(assert (= (and b!163265 c!30074) b!163262))

(assert (= (and b!163265 (not c!30074)) b!163264))

(assert (= (and b!163262 res!77274) b!163263))

(assert (= (or b!163263 b!163264) bm!17284))

(assert (=> b!163262 m!194155))

(declare-fun m!194179 () Bool)

(assert (=> b!163262 m!194179))

(declare-fun m!194181 () Bool)

(assert (=> b!163262 m!194181))

(assert (=> b!163262 m!194155))

(declare-fun m!194183 () Bool)

(assert (=> b!163262 m!194183))

(declare-fun m!194185 () Bool)

(assert (=> bm!17284 m!194185))

(assert (=> b!163265 m!194155))

(assert (=> b!163265 m!194155))

(assert (=> b!163265 m!194157))

(assert (=> b!163157 d!51489))

(declare-fun bm!17287 () Bool)

(declare-fun call!17290 () Bool)

(declare-fun c!30077 () Bool)

(assert (=> bm!17287 (= call!17290 (arrayNoDuplicates!0 (_keys!5150 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30077 (Cons!1981 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000) Nil!1982) Nil!1982)))))

(declare-fun d!51491 () Bool)

(declare-fun res!77283 () Bool)

(declare-fun e!107100 () Bool)

(assert (=> d!51491 (=> res!77283 e!107100)))

(assert (=> d!51491 (= res!77283 (bvsge #b00000000000000000000000000000000 (size!3245 (_keys!5150 thiss!1248))))))

(assert (=> d!51491 (= (arrayNoDuplicates!0 (_keys!5150 thiss!1248) #b00000000000000000000000000000000 Nil!1982) e!107100)))

(declare-fun b!163276 () Bool)

(declare-fun e!107102 () Bool)

(assert (=> b!163276 (= e!107102 call!17290)))

(declare-fun b!163277 () Bool)

(declare-fun e!107099 () Bool)

(declare-fun contains!1029 (List!1985 (_ BitVec 64)) Bool)

(assert (=> b!163277 (= e!107099 (contains!1029 Nil!1982 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163278 () Bool)

(declare-fun e!107101 () Bool)

(assert (=> b!163278 (= e!107100 e!107101)))

(declare-fun res!77284 () Bool)

(assert (=> b!163278 (=> (not res!77284) (not e!107101))))

(assert (=> b!163278 (= res!77284 (not e!107099))))

(declare-fun res!77282 () Bool)

(assert (=> b!163278 (=> (not res!77282) (not e!107099))))

(assert (=> b!163278 (= res!77282 (validKeyInArray!0 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163279 () Bool)

(assert (=> b!163279 (= e!107101 e!107102)))

(assert (=> b!163279 (= c!30077 (validKeyInArray!0 (select (arr!2960 (_keys!5150 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163280 () Bool)

(assert (=> b!163280 (= e!107102 call!17290)))

(assert (= (and d!51491 (not res!77283)) b!163278))

(assert (= (and b!163278 res!77282) b!163277))

(assert (= (and b!163278 res!77284) b!163279))

(assert (= (and b!163279 c!30077) b!163276))

(assert (= (and b!163279 (not c!30077)) b!163280))

(assert (= (or b!163276 b!163280) bm!17287))

(assert (=> bm!17287 m!194155))

(declare-fun m!194187 () Bool)

(assert (=> bm!17287 m!194187))

(assert (=> b!163277 m!194155))

(assert (=> b!163277 m!194155))

(declare-fun m!194189 () Bool)

(assert (=> b!163277 m!194189))

(assert (=> b!163278 m!194155))

(assert (=> b!163278 m!194155))

(assert (=> b!163278 m!194157))

(assert (=> b!163279 m!194155))

(assert (=> b!163279 m!194155))

(assert (=> b!163279 m!194157))

(assert (=> b!163158 d!51491))

(declare-fun mapIsEmpty!6079 () Bool)

(declare-fun mapRes!6079 () Bool)

(assert (=> mapIsEmpty!6079 mapRes!6079))

(declare-fun condMapEmpty!6079 () Bool)

(declare-fun mapDefault!6079 () ValueCell!1448)

(assert (=> mapNonEmpty!6078 (= condMapEmpty!6079 (= mapRest!6078 ((as const (Array (_ BitVec 32) ValueCell!1448)) mapDefault!6079)))))

(declare-fun e!107103 () Bool)

(assert (=> mapNonEmpty!6078 (= tp!13935 (and e!107103 mapRes!6079))))

(declare-fun b!163281 () Bool)

(declare-fun e!107104 () Bool)

(assert (=> b!163281 (= e!107104 tp_is_empty!3583)))

(declare-fun b!163282 () Bool)

(assert (=> b!163282 (= e!107103 tp_is_empty!3583)))

(declare-fun mapNonEmpty!6079 () Bool)

(declare-fun tp!13936 () Bool)

(assert (=> mapNonEmpty!6079 (= mapRes!6079 (and tp!13936 e!107104))))

(declare-fun mapValue!6079 () ValueCell!1448)

(declare-fun mapRest!6079 () (Array (_ BitVec 32) ValueCell!1448))

(declare-fun mapKey!6079 () (_ BitVec 32))

(assert (=> mapNonEmpty!6079 (= mapRest!6078 (store mapRest!6079 mapKey!6079 mapValue!6079))))

(assert (= (and mapNonEmpty!6078 condMapEmpty!6079) mapIsEmpty!6079))

(assert (= (and mapNonEmpty!6078 (not condMapEmpty!6079)) mapNonEmpty!6079))

(assert (= (and mapNonEmpty!6079 ((_ is ValueCellFull!1448) mapValue!6079)) b!163281))

(assert (= (and mapNonEmpty!6078 ((_ is ValueCellFull!1448) mapDefault!6079)) b!163282))

(declare-fun m!194191 () Bool)

(assert (=> mapNonEmpty!6079 m!194191))

(check-sat (not b!163225) (not mapNonEmpty!6079) (not b!163279) (not b!163210) (not d!51483) (not d!51481) (not b_next!3781) (not b!163262) tp_is_empty!3583 (not bm!17287) (not b!163250) (not b!163278) (not b!163265) b_and!10209 (not d!51485) (not bm!17281) (not b!163194) (not b!163277) (not bm!17284) (not b!163224))
(check-sat b_and!10209 (not b_next!3781))
