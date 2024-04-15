; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76452 () Bool)

(assert start!76452)

(declare-fun b!896283 () Bool)

(declare-fun b_free!15955 () Bool)

(declare-fun b_next!15955 () Bool)

(assert (=> b!896283 (= b_free!15955 (not b_next!15955))))

(declare-fun tp!55900 () Bool)

(declare-fun b_and!26221 () Bool)

(assert (=> b!896283 (= tp!55900 b_and!26221)))

(declare-fun b!896280 () Bool)

(declare-fun e!500989 () Bool)

(declare-fun tp_is_empty!18283 () Bool)

(assert (=> b!896280 (= e!500989 tp_is_empty!18283)))

(declare-fun mapNonEmpty!29045 () Bool)

(declare-fun mapRes!29045 () Bool)

(declare-fun tp!55901 () Bool)

(declare-fun e!500988 () Bool)

(assert (=> mapNonEmpty!29045 (= mapRes!29045 (and tp!55901 e!500988))))

(declare-fun mapKey!29045 () (_ BitVec 32))

(declare-datatypes ((array!52567 0))(
  ( (array!52568 (arr!25271 (Array (_ BitVec 32) (_ BitVec 64))) (size!25724 (_ BitVec 32))) )
))
(declare-datatypes ((V!29343 0))(
  ( (V!29344 (val!9192 Int)) )
))
(declare-datatypes ((ValueCell!8660 0))(
  ( (ValueCellFull!8660 (v!11679 V!29343)) (EmptyCell!8660) )
))
(declare-datatypes ((array!52569 0))(
  ( (array!52570 (arr!25272 (Array (_ BitVec 32) ValueCell!8660)) (size!25725 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4336 0))(
  ( (LongMapFixedSize!4337 (defaultEntry!5380 Int) (mask!26019 (_ BitVec 32)) (extraKeys!5082 (_ BitVec 32)) (zeroValue!5186 V!29343) (minValue!5186 V!29343) (_size!2223 (_ BitVec 32)) (_keys!10110 array!52567) (_values!5373 array!52569) (_vacant!2223 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4336)

(declare-fun mapRest!29045 () (Array (_ BitVec 32) ValueCell!8660))

(declare-fun mapValue!29045 () ValueCell!8660)

(assert (=> mapNonEmpty!29045 (= (arr!25272 (_values!5373 thiss!1181)) (store mapRest!29045 mapKey!29045 mapValue!29045))))

(declare-fun mapIsEmpty!29045 () Bool)

(assert (=> mapIsEmpty!29045 mapRes!29045))

(declare-fun b!896281 () Bool)

(declare-fun e!500983 () Bool)

(declare-datatypes ((SeekEntryResult!8904 0))(
  ( (MissingZero!8904 (index!37987 (_ BitVec 32))) (Found!8904 (index!37988 (_ BitVec 32))) (Intermediate!8904 (undefined!9716 Bool) (index!37989 (_ BitVec 32)) (x!76348 (_ BitVec 32))) (Undefined!8904) (MissingVacant!8904 (index!37990 (_ BitVec 32))) )
))
(declare-fun lt!404616 () SeekEntryResult!8904)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896281 (= e!500983 (inRange!0 (index!37988 lt!404616) (mask!26019 thiss!1181)))))

(declare-fun res!606078 () Bool)

(declare-fun e!500984 () Bool)

(assert (=> start!76452 (=> (not res!606078) (not e!500984))))

(declare-fun valid!1678 (LongMapFixedSize!4336) Bool)

(assert (=> start!76452 (= res!606078 (valid!1678 thiss!1181))))

(assert (=> start!76452 e!500984))

(declare-fun e!500985 () Bool)

(assert (=> start!76452 e!500985))

(assert (=> start!76452 true))

(declare-fun b!896282 () Bool)

(declare-fun e!500986 () Bool)

(assert (=> b!896282 (= e!500984 (not e!500986))))

(declare-fun res!606076 () Bool)

(assert (=> b!896282 (=> res!606076 e!500986)))

(get-info :version)

(assert (=> b!896282 (= res!606076 (not ((_ is Found!8904) lt!404616)))))

(assert (=> b!896282 e!500983))

(declare-fun res!606075 () Bool)

(assert (=> b!896282 (=> res!606075 e!500983)))

(assert (=> b!896282 (= res!606075 (not ((_ is Found!8904) lt!404616)))))

(declare-datatypes ((Unit!30432 0))(
  ( (Unit!30433) )
))
(declare-fun lt!404618 () Unit!30432)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!75 (array!52567 array!52569 (_ BitVec 32) (_ BitVec 32) V!29343 V!29343 (_ BitVec 64)) Unit!30432)

(assert (=> b!896282 (= lt!404618 (lemmaSeekEntryGivesInRangeIndex!75 (_keys!10110 thiss!1181) (_values!5373 thiss!1181) (mask!26019 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8904)

(assert (=> b!896282 (= lt!404616 (seekEntry!0 key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun e!500987 () Bool)

(declare-fun array_inv!19890 (array!52567) Bool)

(declare-fun array_inv!19891 (array!52569) Bool)

(assert (=> b!896283 (= e!500985 (and tp!55900 tp_is_empty!18283 (array_inv!19890 (_keys!10110 thiss!1181)) (array_inv!19891 (_values!5373 thiss!1181)) e!500987))))

(declare-fun b!896284 () Bool)

(assert (=> b!896284 (= e!500988 tp_is_empty!18283)))

(declare-fun b!896285 () Bool)

(assert (=> b!896285 (= e!500987 (and e!500989 mapRes!29045))))

(declare-fun condMapEmpty!29045 () Bool)

(declare-fun mapDefault!29045 () ValueCell!8660)

(assert (=> b!896285 (= condMapEmpty!29045 (= (arr!25272 (_values!5373 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8660)) mapDefault!29045)))))

(declare-fun b!896286 () Bool)

(declare-fun e!500991 () Bool)

(assert (=> b!896286 (= e!500986 e!500991)))

(declare-fun res!606077 () Bool)

(assert (=> b!896286 (=> res!606077 e!500991)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896286 (= res!606077 (not (validMask!0 (mask!26019 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896286 (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404617 () Unit!30432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52567 (_ BitVec 64) (_ BitVec 32)) Unit!30432)

(assert (=> b!896286 (= lt!404617 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10110 thiss!1181) key!785 (index!37988 lt!404616)))))

(declare-fun b!896287 () Bool)

(declare-fun res!606079 () Bool)

(assert (=> b!896287 (=> (not res!606079) (not e!500984))))

(assert (=> b!896287 (= res!606079 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896288 () Bool)

(assert (=> b!896288 (= e!500991 (= (size!25725 (_values!5373 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26019 thiss!1181))))))

(assert (= (and start!76452 res!606078) b!896287))

(assert (= (and b!896287 res!606079) b!896282))

(assert (= (and b!896282 (not res!606075)) b!896281))

(assert (= (and b!896282 (not res!606076)) b!896286))

(assert (= (and b!896286 (not res!606077)) b!896288))

(assert (= (and b!896285 condMapEmpty!29045) mapIsEmpty!29045))

(assert (= (and b!896285 (not condMapEmpty!29045)) mapNonEmpty!29045))

(assert (= (and mapNonEmpty!29045 ((_ is ValueCellFull!8660) mapValue!29045)) b!896284))

(assert (= (and b!896285 ((_ is ValueCellFull!8660) mapDefault!29045)) b!896280))

(assert (= b!896283 b!896285))

(assert (= start!76452 b!896283))

(declare-fun m!832921 () Bool)

(assert (=> b!896286 m!832921))

(declare-fun m!832923 () Bool)

(assert (=> b!896286 m!832923))

(declare-fun m!832925 () Bool)

(assert (=> b!896286 m!832925))

(declare-fun m!832927 () Bool)

(assert (=> start!76452 m!832927))

(declare-fun m!832929 () Bool)

(assert (=> b!896282 m!832929))

(declare-fun m!832931 () Bool)

(assert (=> b!896282 m!832931))

(declare-fun m!832933 () Bool)

(assert (=> mapNonEmpty!29045 m!832933))

(declare-fun m!832935 () Bool)

(assert (=> b!896281 m!832935))

(declare-fun m!832937 () Bool)

(assert (=> b!896283 m!832937))

(declare-fun m!832939 () Bool)

(assert (=> b!896283 m!832939))

(check-sat b_and!26221 (not mapNonEmpty!29045) (not start!76452) (not b!896282) (not b_next!15955) (not b!896283) (not b!896281) (not b!896286) tp_is_empty!18283)
(check-sat b_and!26221 (not b_next!15955))
(get-model)

(declare-fun d!110731 () Bool)

(declare-fun res!606116 () Bool)

(declare-fun e!501048 () Bool)

(assert (=> d!110731 (=> (not res!606116) (not e!501048))))

(declare-fun simpleValid!314 (LongMapFixedSize!4336) Bool)

(assert (=> d!110731 (= res!606116 (simpleValid!314 thiss!1181))))

(assert (=> d!110731 (= (valid!1678 thiss!1181) e!501048)))

(declare-fun b!896349 () Bool)

(declare-fun res!606117 () Bool)

(assert (=> b!896349 (=> (not res!606117) (not e!501048))))

(declare-fun arrayCountValidKeys!0 (array!52567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896349 (= res!606117 (= (arrayCountValidKeys!0 (_keys!10110 thiss!1181) #b00000000000000000000000000000000 (size!25724 (_keys!10110 thiss!1181))) (_size!2223 thiss!1181)))))

(declare-fun b!896350 () Bool)

(declare-fun res!606118 () Bool)

(assert (=> b!896350 (=> (not res!606118) (not e!501048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52567 (_ BitVec 32)) Bool)

(assert (=> b!896350 (= res!606118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun b!896351 () Bool)

(declare-datatypes ((List!17832 0))(
  ( (Nil!17829) (Cons!17828 (h!18966 (_ BitVec 64)) (t!25162 List!17832)) )
))
(declare-fun arrayNoDuplicates!0 (array!52567 (_ BitVec 32) List!17832) Bool)

(assert (=> b!896351 (= e!501048 (arrayNoDuplicates!0 (_keys!10110 thiss!1181) #b00000000000000000000000000000000 Nil!17829))))

(assert (= (and d!110731 res!606116) b!896349))

(assert (= (and b!896349 res!606117) b!896350))

(assert (= (and b!896350 res!606118) b!896351))

(declare-fun m!832981 () Bool)

(assert (=> d!110731 m!832981))

(declare-fun m!832983 () Bool)

(assert (=> b!896349 m!832983))

(declare-fun m!832985 () Bool)

(assert (=> b!896350 m!832985))

(declare-fun m!832987 () Bool)

(assert (=> b!896351 m!832987))

(assert (=> start!76452 d!110731))

(declare-fun d!110733 () Bool)

(assert (=> d!110733 (= (array_inv!19890 (_keys!10110 thiss!1181)) (bvsge (size!25724 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896283 d!110733))

(declare-fun d!110735 () Bool)

(assert (=> d!110735 (= (array_inv!19891 (_values!5373 thiss!1181)) (bvsge (size!25725 (_values!5373 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896283 d!110735))

(declare-fun d!110737 () Bool)

(declare-fun e!501051 () Bool)

(assert (=> d!110737 e!501051))

(declare-fun res!606121 () Bool)

(assert (=> d!110737 (=> res!606121 e!501051)))

(declare-fun lt!404642 () SeekEntryResult!8904)

(assert (=> d!110737 (= res!606121 (not ((_ is Found!8904) lt!404642)))))

(assert (=> d!110737 (= lt!404642 (seekEntry!0 key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun lt!404641 () Unit!30432)

(declare-fun choose!1488 (array!52567 array!52569 (_ BitVec 32) (_ BitVec 32) V!29343 V!29343 (_ BitVec 64)) Unit!30432)

(assert (=> d!110737 (= lt!404641 (choose!1488 (_keys!10110 thiss!1181) (_values!5373 thiss!1181) (mask!26019 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785))))

(assert (=> d!110737 (validMask!0 (mask!26019 thiss!1181))))

(assert (=> d!110737 (= (lemmaSeekEntryGivesInRangeIndex!75 (_keys!10110 thiss!1181) (_values!5373 thiss!1181) (mask!26019 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785) lt!404641)))

(declare-fun b!896354 () Bool)

(assert (=> b!896354 (= e!501051 (inRange!0 (index!37988 lt!404642) (mask!26019 thiss!1181)))))

(assert (= (and d!110737 (not res!606121)) b!896354))

(assert (=> d!110737 m!832931))

(declare-fun m!832989 () Bool)

(assert (=> d!110737 m!832989))

(assert (=> d!110737 m!832921))

(declare-fun m!832991 () Bool)

(assert (=> b!896354 m!832991))

(assert (=> b!896282 d!110737))

(declare-fun b!896367 () Bool)

(declare-fun e!501059 () SeekEntryResult!8904)

(declare-fun lt!404652 () SeekEntryResult!8904)

(assert (=> b!896367 (= e!501059 (ite ((_ is MissingVacant!8904) lt!404652) (MissingZero!8904 (index!37990 lt!404652)) lt!404652))))

(declare-fun lt!404654 () SeekEntryResult!8904)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8904)

(assert (=> b!896367 (= lt!404652 (seekKeyOrZeroReturnVacant!0 (x!76348 lt!404654) (index!37989 lt!404654) (index!37989 lt!404654) key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun b!896368 () Bool)

(declare-fun e!501060 () SeekEntryResult!8904)

(assert (=> b!896368 (= e!501060 Undefined!8904)))

(declare-fun d!110739 () Bool)

(declare-fun lt!404653 () SeekEntryResult!8904)

(assert (=> d!110739 (and (or ((_ is MissingVacant!8904) lt!404653) (not ((_ is Found!8904) lt!404653)) (and (bvsge (index!37988 lt!404653) #b00000000000000000000000000000000) (bvslt (index!37988 lt!404653) (size!25724 (_keys!10110 thiss!1181))))) (not ((_ is MissingVacant!8904) lt!404653)) (or (not ((_ is Found!8904) lt!404653)) (= (select (arr!25271 (_keys!10110 thiss!1181)) (index!37988 lt!404653)) key!785)))))

(assert (=> d!110739 (= lt!404653 e!501060)))

(declare-fun c!94634 () Bool)

(assert (=> d!110739 (= c!94634 (and ((_ is Intermediate!8904) lt!404654) (undefined!9716 lt!404654)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110739 (= lt!404654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26019 thiss!1181)) key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(assert (=> d!110739 (validMask!0 (mask!26019 thiss!1181))))

(assert (=> d!110739 (= (seekEntry!0 key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)) lt!404653)))

(declare-fun b!896369 () Bool)

(declare-fun c!94633 () Bool)

(declare-fun lt!404651 () (_ BitVec 64))

(assert (=> b!896369 (= c!94633 (= lt!404651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501058 () SeekEntryResult!8904)

(assert (=> b!896369 (= e!501058 e!501059)))

(declare-fun b!896370 () Bool)

(assert (=> b!896370 (= e!501058 (Found!8904 (index!37989 lt!404654)))))

(declare-fun b!896371 () Bool)

(assert (=> b!896371 (= e!501060 e!501058)))

(assert (=> b!896371 (= lt!404651 (select (arr!25271 (_keys!10110 thiss!1181)) (index!37989 lt!404654)))))

(declare-fun c!94635 () Bool)

(assert (=> b!896371 (= c!94635 (= lt!404651 key!785))))

(declare-fun b!896372 () Bool)

(assert (=> b!896372 (= e!501059 (MissingZero!8904 (index!37989 lt!404654)))))

(assert (= (and d!110739 c!94634) b!896368))

(assert (= (and d!110739 (not c!94634)) b!896371))

(assert (= (and b!896371 c!94635) b!896370))

(assert (= (and b!896371 (not c!94635)) b!896369))

(assert (= (and b!896369 c!94633) b!896372))

(assert (= (and b!896369 (not c!94633)) b!896367))

(declare-fun m!832993 () Bool)

(assert (=> b!896367 m!832993))

(declare-fun m!832995 () Bool)

(assert (=> d!110739 m!832995))

(declare-fun m!832997 () Bool)

(assert (=> d!110739 m!832997))

(assert (=> d!110739 m!832997))

(declare-fun m!832999 () Bool)

(assert (=> d!110739 m!832999))

(assert (=> d!110739 m!832921))

(declare-fun m!833001 () Bool)

(assert (=> b!896371 m!833001))

(assert (=> b!896282 d!110739))

(declare-fun d!110741 () Bool)

(assert (=> d!110741 (= (inRange!0 (index!37988 lt!404616) (mask!26019 thiss!1181)) (and (bvsge (index!37988 lt!404616) #b00000000000000000000000000000000) (bvslt (index!37988 lt!404616) (bvadd (mask!26019 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896281 d!110741))

(declare-fun d!110743 () Bool)

(assert (=> d!110743 (= (validMask!0 (mask!26019 thiss!1181)) (and (or (= (mask!26019 thiss!1181) #b00000000000000000000000000000111) (= (mask!26019 thiss!1181) #b00000000000000000000000000001111) (= (mask!26019 thiss!1181) #b00000000000000000000000000011111) (= (mask!26019 thiss!1181) #b00000000000000000000000000111111) (= (mask!26019 thiss!1181) #b00000000000000000000000001111111) (= (mask!26019 thiss!1181) #b00000000000000000000000011111111) (= (mask!26019 thiss!1181) #b00000000000000000000000111111111) (= (mask!26019 thiss!1181) #b00000000000000000000001111111111) (= (mask!26019 thiss!1181) #b00000000000000000000011111111111) (= (mask!26019 thiss!1181) #b00000000000000000000111111111111) (= (mask!26019 thiss!1181) #b00000000000000000001111111111111) (= (mask!26019 thiss!1181) #b00000000000000000011111111111111) (= (mask!26019 thiss!1181) #b00000000000000000111111111111111) (= (mask!26019 thiss!1181) #b00000000000000001111111111111111) (= (mask!26019 thiss!1181) #b00000000000000011111111111111111) (= (mask!26019 thiss!1181) #b00000000000000111111111111111111) (= (mask!26019 thiss!1181) #b00000000000001111111111111111111) (= (mask!26019 thiss!1181) #b00000000000011111111111111111111) (= (mask!26019 thiss!1181) #b00000000000111111111111111111111) (= (mask!26019 thiss!1181) #b00000000001111111111111111111111) (= (mask!26019 thiss!1181) #b00000000011111111111111111111111) (= (mask!26019 thiss!1181) #b00000000111111111111111111111111) (= (mask!26019 thiss!1181) #b00000001111111111111111111111111) (= (mask!26019 thiss!1181) #b00000011111111111111111111111111) (= (mask!26019 thiss!1181) #b00000111111111111111111111111111) (= (mask!26019 thiss!1181) #b00001111111111111111111111111111) (= (mask!26019 thiss!1181) #b00011111111111111111111111111111) (= (mask!26019 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26019 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896286 d!110743))

(declare-fun d!110745 () Bool)

(declare-fun res!606126 () Bool)

(declare-fun e!501065 () Bool)

(assert (=> d!110745 (=> res!606126 e!501065)))

(assert (=> d!110745 (= res!606126 (= (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110745 (= (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 #b00000000000000000000000000000000) e!501065)))

(declare-fun b!896377 () Bool)

(declare-fun e!501066 () Bool)

(assert (=> b!896377 (= e!501065 e!501066)))

(declare-fun res!606127 () Bool)

(assert (=> b!896377 (=> (not res!606127) (not e!501066))))

(assert (=> b!896377 (= res!606127 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25724 (_keys!10110 thiss!1181))))))

(declare-fun b!896378 () Bool)

(assert (=> b!896378 (= e!501066 (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110745 (not res!606126)) b!896377))

(assert (= (and b!896377 res!606127) b!896378))

(declare-fun m!833003 () Bool)

(assert (=> d!110745 m!833003))

(declare-fun m!833005 () Bool)

(assert (=> b!896378 m!833005))

(assert (=> b!896286 d!110745))

(declare-fun d!110747 () Bool)

(assert (=> d!110747 (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404657 () Unit!30432)

(declare-fun choose!13 (array!52567 (_ BitVec 64) (_ BitVec 32)) Unit!30432)

(assert (=> d!110747 (= lt!404657 (choose!13 (_keys!10110 thiss!1181) key!785 (index!37988 lt!404616)))))

(assert (=> d!110747 (bvsge (index!37988 lt!404616) #b00000000000000000000000000000000)))

(assert (=> d!110747 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10110 thiss!1181) key!785 (index!37988 lt!404616)) lt!404657)))

(declare-fun bs!25137 () Bool)

(assert (= bs!25137 d!110747))

(assert (=> bs!25137 m!832923))

(declare-fun m!833007 () Bool)

(assert (=> bs!25137 m!833007))

(assert (=> b!896286 d!110747))

(declare-fun b!896385 () Bool)

(declare-fun e!501072 () Bool)

(assert (=> b!896385 (= e!501072 tp_is_empty!18283)))

(declare-fun condMapEmpty!29054 () Bool)

(declare-fun mapDefault!29054 () ValueCell!8660)

(assert (=> mapNonEmpty!29045 (= condMapEmpty!29054 (= mapRest!29045 ((as const (Array (_ BitVec 32) ValueCell!8660)) mapDefault!29054)))))

(declare-fun e!501071 () Bool)

(declare-fun mapRes!29054 () Bool)

(assert (=> mapNonEmpty!29045 (= tp!55901 (and e!501071 mapRes!29054))))

(declare-fun b!896386 () Bool)

(assert (=> b!896386 (= e!501071 tp_is_empty!18283)))

(declare-fun mapNonEmpty!29054 () Bool)

(declare-fun tp!55916 () Bool)

(assert (=> mapNonEmpty!29054 (= mapRes!29054 (and tp!55916 e!501072))))

(declare-fun mapRest!29054 () (Array (_ BitVec 32) ValueCell!8660))

(declare-fun mapKey!29054 () (_ BitVec 32))

(declare-fun mapValue!29054 () ValueCell!8660)

(assert (=> mapNonEmpty!29054 (= mapRest!29045 (store mapRest!29054 mapKey!29054 mapValue!29054))))

(declare-fun mapIsEmpty!29054 () Bool)

(assert (=> mapIsEmpty!29054 mapRes!29054))

(assert (= (and mapNonEmpty!29045 condMapEmpty!29054) mapIsEmpty!29054))

(assert (= (and mapNonEmpty!29045 (not condMapEmpty!29054)) mapNonEmpty!29054))

(assert (= (and mapNonEmpty!29054 ((_ is ValueCellFull!8660) mapValue!29054)) b!896385))

(assert (= (and mapNonEmpty!29045 ((_ is ValueCellFull!8660) mapDefault!29054)) b!896386))

(declare-fun m!833009 () Bool)

(assert (=> mapNonEmpty!29054 m!833009))

(check-sat b_and!26221 (not b!896367) (not b!896350) (not mapNonEmpty!29054) (not b!896349) (not d!110731) (not b_next!15955) (not b!896354) (not d!110739) tp_is_empty!18283 (not d!110737) (not b!896378) (not b!896351) (not d!110747))
(check-sat b_and!26221 (not b_next!15955))
(get-model)

(declare-fun d!110749 () Bool)

(declare-fun res!606138 () Bool)

(declare-fun e!501075 () Bool)

(assert (=> d!110749 (=> (not res!606138) (not e!501075))))

(assert (=> d!110749 (= res!606138 (validMask!0 (mask!26019 thiss!1181)))))

(assert (=> d!110749 (= (simpleValid!314 thiss!1181) e!501075)))

(declare-fun b!896397 () Bool)

(declare-fun res!606139 () Bool)

(assert (=> b!896397 (=> (not res!606139) (not e!501075))))

(declare-fun size!25730 (LongMapFixedSize!4336) (_ BitVec 32))

(assert (=> b!896397 (= res!606139 (= (size!25730 thiss!1181) (bvadd (_size!2223 thiss!1181) (bvsdiv (bvadd (extraKeys!5082 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!896398 () Bool)

(assert (=> b!896398 (= e!501075 (and (bvsge (extraKeys!5082 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5082 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2223 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!896396 () Bool)

(declare-fun res!606137 () Bool)

(assert (=> b!896396 (=> (not res!606137) (not e!501075))))

(assert (=> b!896396 (= res!606137 (bvsge (size!25730 thiss!1181) (_size!2223 thiss!1181)))))

(declare-fun b!896395 () Bool)

(declare-fun res!606136 () Bool)

(assert (=> b!896395 (=> (not res!606136) (not e!501075))))

(assert (=> b!896395 (= res!606136 (and (= (size!25725 (_values!5373 thiss!1181)) (bvadd (mask!26019 thiss!1181) #b00000000000000000000000000000001)) (= (size!25724 (_keys!10110 thiss!1181)) (size!25725 (_values!5373 thiss!1181))) (bvsge (_size!2223 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2223 thiss!1181) (bvadd (mask!26019 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!110749 res!606138) b!896395))

(assert (= (and b!896395 res!606136) b!896396))

(assert (= (and b!896396 res!606137) b!896397))

(assert (= (and b!896397 res!606139) b!896398))

(assert (=> d!110749 m!832921))

(declare-fun m!833011 () Bool)

(assert (=> b!896397 m!833011))

(assert (=> b!896396 m!833011))

(assert (=> d!110731 d!110749))

(declare-fun b!896417 () Bool)

(declare-fun e!501089 () SeekEntryResult!8904)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896417 (= e!501089 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26019 thiss!1181)) #b00000000000000000000000000000000 (mask!26019 thiss!1181)) key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun d!110751 () Bool)

(declare-fun e!501087 () Bool)

(assert (=> d!110751 e!501087))

(declare-fun c!94644 () Bool)

(declare-fun lt!404663 () SeekEntryResult!8904)

(assert (=> d!110751 (= c!94644 (and ((_ is Intermediate!8904) lt!404663) (undefined!9716 lt!404663)))))

(declare-fun e!501086 () SeekEntryResult!8904)

(assert (=> d!110751 (= lt!404663 e!501086)))

(declare-fun c!94643 () Bool)

(assert (=> d!110751 (= c!94643 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404662 () (_ BitVec 64))

(assert (=> d!110751 (= lt!404662 (select (arr!25271 (_keys!10110 thiss!1181)) (toIndex!0 key!785 (mask!26019 thiss!1181))))))

(assert (=> d!110751 (validMask!0 (mask!26019 thiss!1181))))

(assert (=> d!110751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26019 thiss!1181)) key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)) lt!404663)))

(declare-fun b!896418 () Bool)

(assert (=> b!896418 (= e!501087 (bvsge (x!76348 lt!404663) #b01111111111111111111111111111110))))

(declare-fun b!896419 () Bool)

(assert (=> b!896419 (and (bvsge (index!37989 lt!404663) #b00000000000000000000000000000000) (bvslt (index!37989 lt!404663) (size!25724 (_keys!10110 thiss!1181))))))

(declare-fun e!501088 () Bool)

(assert (=> b!896419 (= e!501088 (= (select (arr!25271 (_keys!10110 thiss!1181)) (index!37989 lt!404663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!896420 () Bool)

(assert (=> b!896420 (and (bvsge (index!37989 lt!404663) #b00000000000000000000000000000000) (bvslt (index!37989 lt!404663) (size!25724 (_keys!10110 thiss!1181))))))

(declare-fun res!606146 () Bool)

(assert (=> b!896420 (= res!606146 (= (select (arr!25271 (_keys!10110 thiss!1181)) (index!37989 lt!404663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896420 (=> res!606146 e!501088)))

(declare-fun b!896421 () Bool)

(declare-fun e!501090 () Bool)

(assert (=> b!896421 (= e!501087 e!501090)))

(declare-fun res!606148 () Bool)

(assert (=> b!896421 (= res!606148 (and ((_ is Intermediate!8904) lt!404663) (not (undefined!9716 lt!404663)) (bvslt (x!76348 lt!404663) #b01111111111111111111111111111110) (bvsge (x!76348 lt!404663) #b00000000000000000000000000000000) (bvsge (x!76348 lt!404663) #b00000000000000000000000000000000)))))

(assert (=> b!896421 (=> (not res!606148) (not e!501090))))

(declare-fun b!896422 () Bool)

(assert (=> b!896422 (= e!501086 e!501089)))

(declare-fun c!94642 () Bool)

(assert (=> b!896422 (= c!94642 (or (= lt!404662 key!785) (= (bvadd lt!404662 lt!404662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!896423 () Bool)

(assert (=> b!896423 (= e!501086 (Intermediate!8904 true (toIndex!0 key!785 (mask!26019 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896424 () Bool)

(assert (=> b!896424 (= e!501089 (Intermediate!8904 false (toIndex!0 key!785 (mask!26019 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896425 () Bool)

(assert (=> b!896425 (and (bvsge (index!37989 lt!404663) #b00000000000000000000000000000000) (bvslt (index!37989 lt!404663) (size!25724 (_keys!10110 thiss!1181))))))

(declare-fun res!606147 () Bool)

(assert (=> b!896425 (= res!606147 (= (select (arr!25271 (_keys!10110 thiss!1181)) (index!37989 lt!404663)) key!785))))

(assert (=> b!896425 (=> res!606147 e!501088)))

(assert (=> b!896425 (= e!501090 e!501088)))

(assert (= (and d!110751 c!94643) b!896423))

(assert (= (and d!110751 (not c!94643)) b!896422))

(assert (= (and b!896422 c!94642) b!896424))

(assert (= (and b!896422 (not c!94642)) b!896417))

(assert (= (and d!110751 c!94644) b!896418))

(assert (= (and d!110751 (not c!94644)) b!896421))

(assert (= (and b!896421 res!606148) b!896425))

(assert (= (and b!896425 (not res!606147)) b!896420))

(assert (= (and b!896420 (not res!606146)) b!896419))

(declare-fun m!833013 () Bool)

(assert (=> b!896425 m!833013))

(assert (=> b!896417 m!832997))

(declare-fun m!833015 () Bool)

(assert (=> b!896417 m!833015))

(assert (=> b!896417 m!833015))

(declare-fun m!833017 () Bool)

(assert (=> b!896417 m!833017))

(assert (=> b!896420 m!833013))

(assert (=> b!896419 m!833013))

(assert (=> d!110751 m!832997))

(declare-fun m!833019 () Bool)

(assert (=> d!110751 m!833019))

(assert (=> d!110751 m!832921))

(assert (=> d!110739 d!110751))

(declare-fun d!110753 () Bool)

(declare-fun lt!404669 () (_ BitVec 32))

(declare-fun lt!404668 () (_ BitVec 32))

(assert (=> d!110753 (= lt!404669 (bvmul (bvxor lt!404668 (bvlshr lt!404668 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110753 (= lt!404668 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110753 (and (bvsge (mask!26019 thiss!1181) #b00000000000000000000000000000000) (let ((res!606149 (let ((h!18967 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76365 (bvmul (bvxor h!18967 (bvlshr h!18967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76365 (bvlshr x!76365 #b00000000000000000000000000001101)) (mask!26019 thiss!1181)))))) (and (bvslt res!606149 (bvadd (mask!26019 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606149 #b00000000000000000000000000000000))))))

(assert (=> d!110753 (= (toIndex!0 key!785 (mask!26019 thiss!1181)) (bvand (bvxor lt!404669 (bvlshr lt!404669 #b00000000000000000000000000001101)) (mask!26019 thiss!1181)))))

(assert (=> d!110739 d!110753))

(assert (=> d!110739 d!110743))

(assert (=> d!110747 d!110745))

(declare-fun d!110755 () Bool)

(assert (=> d!110755 (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110755 true))

(declare-fun _$60!403 () Unit!30432)

(assert (=> d!110755 (= (choose!13 (_keys!10110 thiss!1181) key!785 (index!37988 lt!404616)) _$60!403)))

(declare-fun bs!25138 () Bool)

(assert (= bs!25138 d!110755))

(assert (=> bs!25138 m!832923))

(assert (=> d!110747 d!110755))

(declare-fun d!110757 () Bool)

(assert (=> d!110757 (= (inRange!0 (index!37988 lt!404642) (mask!26019 thiss!1181)) (and (bvsge (index!37988 lt!404642) #b00000000000000000000000000000000) (bvslt (index!37988 lt!404642) (bvadd (mask!26019 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896354 d!110757))

(declare-fun d!110759 () Bool)

(declare-fun res!606150 () Bool)

(declare-fun e!501091 () Bool)

(assert (=> d!110759 (=> res!606150 e!501091)))

(assert (=> d!110759 (= res!606150 (= (select (arr!25271 (_keys!10110 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110759 (= (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501091)))

(declare-fun b!896426 () Bool)

(declare-fun e!501092 () Bool)

(assert (=> b!896426 (= e!501091 e!501092)))

(declare-fun res!606151 () Bool)

(assert (=> b!896426 (=> (not res!606151) (not e!501092))))

(assert (=> b!896426 (= res!606151 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25724 (_keys!10110 thiss!1181))))))

(declare-fun b!896427 () Bool)

(assert (=> b!896427 (= e!501092 (arrayContainsKey!0 (_keys!10110 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110759 (not res!606150)) b!896426))

(assert (= (and b!896426 res!606151) b!896427))

(declare-fun m!833021 () Bool)

(assert (=> d!110759 m!833021))

(declare-fun m!833023 () Bool)

(assert (=> b!896427 m!833023))

(assert (=> b!896378 d!110759))

(declare-fun b!896438 () Bool)

(declare-fun e!501104 () Bool)

(declare-fun e!501103 () Bool)

(assert (=> b!896438 (= e!501104 e!501103)))

(declare-fun res!606158 () Bool)

(assert (=> b!896438 (=> (not res!606158) (not e!501103))))

(declare-fun e!501101 () Bool)

(assert (=> b!896438 (= res!606158 (not e!501101))))

(declare-fun res!606159 () Bool)

(assert (=> b!896438 (=> (not res!606159) (not e!501101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896438 (= res!606159 (validKeyInArray!0 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896439 () Bool)

(declare-fun e!501102 () Bool)

(assert (=> b!896439 (= e!501103 e!501102)))

(declare-fun c!94647 () Bool)

(assert (=> b!896439 (= c!94647 (validKeyInArray!0 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896440 () Bool)

(declare-fun call!39755 () Bool)

(assert (=> b!896440 (= e!501102 call!39755)))

(declare-fun bm!39752 () Bool)

(assert (=> bm!39752 (= call!39755 (arrayNoDuplicates!0 (_keys!10110 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94647 (Cons!17828 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000) Nil!17829) Nil!17829)))))

(declare-fun b!896441 () Bool)

(assert (=> b!896441 (= e!501102 call!39755)))

(declare-fun b!896442 () Bool)

(declare-fun contains!4371 (List!17832 (_ BitVec 64)) Bool)

(assert (=> b!896442 (= e!501101 (contains!4371 Nil!17829 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110761 () Bool)

(declare-fun res!606160 () Bool)

(assert (=> d!110761 (=> res!606160 e!501104)))

(assert (=> d!110761 (= res!606160 (bvsge #b00000000000000000000000000000000 (size!25724 (_keys!10110 thiss!1181))))))

(assert (=> d!110761 (= (arrayNoDuplicates!0 (_keys!10110 thiss!1181) #b00000000000000000000000000000000 Nil!17829) e!501104)))

(assert (= (and d!110761 (not res!606160)) b!896438))

(assert (= (and b!896438 res!606159) b!896442))

(assert (= (and b!896438 res!606158) b!896439))

(assert (= (and b!896439 c!94647) b!896441))

(assert (= (and b!896439 (not c!94647)) b!896440))

(assert (= (or b!896441 b!896440) bm!39752))

(assert (=> b!896438 m!833003))

(assert (=> b!896438 m!833003))

(declare-fun m!833025 () Bool)

(assert (=> b!896438 m!833025))

(assert (=> b!896439 m!833003))

(assert (=> b!896439 m!833003))

(assert (=> b!896439 m!833025))

(assert (=> bm!39752 m!833003))

(declare-fun m!833027 () Bool)

(assert (=> bm!39752 m!833027))

(assert (=> b!896442 m!833003))

(assert (=> b!896442 m!833003))

(declare-fun m!833029 () Bool)

(assert (=> b!896442 m!833029))

(assert (=> b!896351 d!110761))

(declare-fun bm!39755 () Bool)

(declare-fun call!39758 () Bool)

(assert (=> bm!39755 (= call!39758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(declare-fun d!110763 () Bool)

(declare-fun res!606166 () Bool)

(declare-fun e!501112 () Bool)

(assert (=> d!110763 (=> res!606166 e!501112)))

(assert (=> d!110763 (= res!606166 (bvsge #b00000000000000000000000000000000 (size!25724 (_keys!10110 thiss!1181))))))

(assert (=> d!110763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)) e!501112)))

(declare-fun b!896451 () Bool)

(declare-fun e!501113 () Bool)

(declare-fun e!501111 () Bool)

(assert (=> b!896451 (= e!501113 e!501111)))

(declare-fun lt!404677 () (_ BitVec 64))

(assert (=> b!896451 (= lt!404677 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404678 () Unit!30432)

(assert (=> b!896451 (= lt!404678 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10110 thiss!1181) lt!404677 #b00000000000000000000000000000000))))

(assert (=> b!896451 (arrayContainsKey!0 (_keys!10110 thiss!1181) lt!404677 #b00000000000000000000000000000000)))

(declare-fun lt!404676 () Unit!30432)

(assert (=> b!896451 (= lt!404676 lt!404678)))

(declare-fun res!606165 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8904)

(assert (=> b!896451 (= res!606165 (= (seekEntryOrOpen!0 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000) (_keys!10110 thiss!1181) (mask!26019 thiss!1181)) (Found!8904 #b00000000000000000000000000000000)))))

(assert (=> b!896451 (=> (not res!606165) (not e!501111))))

(declare-fun b!896452 () Bool)

(assert (=> b!896452 (= e!501111 call!39758)))

(declare-fun b!896453 () Bool)

(assert (=> b!896453 (= e!501112 e!501113)))

(declare-fun c!94650 () Bool)

(assert (=> b!896453 (= c!94650 (validKeyInArray!0 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896454 () Bool)

(assert (=> b!896454 (= e!501113 call!39758)))

(assert (= (and d!110763 (not res!606166)) b!896453))

(assert (= (and b!896453 c!94650) b!896451))

(assert (= (and b!896453 (not c!94650)) b!896454))

(assert (= (and b!896451 res!606165) b!896452))

(assert (= (or b!896452 b!896454) bm!39755))

(declare-fun m!833031 () Bool)

(assert (=> bm!39755 m!833031))

(assert (=> b!896451 m!833003))

(declare-fun m!833033 () Bool)

(assert (=> b!896451 m!833033))

(declare-fun m!833035 () Bool)

(assert (=> b!896451 m!833035))

(assert (=> b!896451 m!833003))

(declare-fun m!833037 () Bool)

(assert (=> b!896451 m!833037))

(assert (=> b!896453 m!833003))

(assert (=> b!896453 m!833003))

(assert (=> b!896453 m!833025))

(assert (=> b!896350 d!110763))

(assert (=> d!110737 d!110739))

(declare-fun d!110765 () Bool)

(declare-fun e!501116 () Bool)

(assert (=> d!110765 e!501116))

(declare-fun res!606169 () Bool)

(assert (=> d!110765 (=> res!606169 e!501116)))

(declare-fun lt!404681 () SeekEntryResult!8904)

(assert (=> d!110765 (= res!606169 (not ((_ is Found!8904) lt!404681)))))

(assert (=> d!110765 (= lt!404681 (seekEntry!0 key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(assert (=> d!110765 true))

(declare-fun _$36!354 () Unit!30432)

(assert (=> d!110765 (= (choose!1488 (_keys!10110 thiss!1181) (_values!5373 thiss!1181) (mask!26019 thiss!1181) (extraKeys!5082 thiss!1181) (zeroValue!5186 thiss!1181) (minValue!5186 thiss!1181) key!785) _$36!354)))

(declare-fun b!896457 () Bool)

(assert (=> b!896457 (= e!501116 (inRange!0 (index!37988 lt!404681) (mask!26019 thiss!1181)))))

(assert (= (and d!110765 (not res!606169)) b!896457))

(assert (=> d!110765 m!832931))

(declare-fun m!833039 () Bool)

(assert (=> b!896457 m!833039))

(assert (=> d!110737 d!110765))

(assert (=> d!110737 d!110743))

(declare-fun lt!404686 () SeekEntryResult!8904)

(declare-fun d!110767 () Bool)

(assert (=> d!110767 (and (or ((_ is Undefined!8904) lt!404686) (not ((_ is Found!8904) lt!404686)) (and (bvsge (index!37988 lt!404686) #b00000000000000000000000000000000) (bvslt (index!37988 lt!404686) (size!25724 (_keys!10110 thiss!1181))))) (or ((_ is Undefined!8904) lt!404686) ((_ is Found!8904) lt!404686) (not ((_ is MissingVacant!8904) lt!404686)) (not (= (index!37990 lt!404686) (index!37989 lt!404654))) (and (bvsge (index!37990 lt!404686) #b00000000000000000000000000000000) (bvslt (index!37990 lt!404686) (size!25724 (_keys!10110 thiss!1181))))) (or ((_ is Undefined!8904) lt!404686) (ite ((_ is Found!8904) lt!404686) (= (select (arr!25271 (_keys!10110 thiss!1181)) (index!37988 lt!404686)) key!785) (and ((_ is MissingVacant!8904) lt!404686) (= (index!37990 lt!404686) (index!37989 lt!404654)) (= (select (arr!25271 (_keys!10110 thiss!1181)) (index!37990 lt!404686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!501124 () SeekEntryResult!8904)

(assert (=> d!110767 (= lt!404686 e!501124)))

(declare-fun c!94658 () Bool)

(assert (=> d!110767 (= c!94658 (bvsge (x!76348 lt!404654) #b01111111111111111111111111111110))))

(declare-fun lt!404687 () (_ BitVec 64))

(assert (=> d!110767 (= lt!404687 (select (arr!25271 (_keys!10110 thiss!1181)) (index!37989 lt!404654)))))

(assert (=> d!110767 (validMask!0 (mask!26019 thiss!1181))))

(assert (=> d!110767 (= (seekKeyOrZeroReturnVacant!0 (x!76348 lt!404654) (index!37989 lt!404654) (index!37989 lt!404654) key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)) lt!404686)))

(declare-fun b!896470 () Bool)

(declare-fun e!501123 () SeekEntryResult!8904)

(assert (=> b!896470 (= e!501123 (MissingVacant!8904 (index!37989 lt!404654)))))

(declare-fun b!896471 () Bool)

(declare-fun c!94659 () Bool)

(assert (=> b!896471 (= c!94659 (= lt!404687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501125 () SeekEntryResult!8904)

(assert (=> b!896471 (= e!501125 e!501123)))

(declare-fun b!896472 () Bool)

(assert (=> b!896472 (= e!501125 (Found!8904 (index!37989 lt!404654)))))

(declare-fun b!896473 () Bool)

(assert (=> b!896473 (= e!501124 Undefined!8904)))

(declare-fun b!896474 () Bool)

(assert (=> b!896474 (= e!501124 e!501125)))

(declare-fun c!94657 () Bool)

(assert (=> b!896474 (= c!94657 (= lt!404687 key!785))))

(declare-fun b!896475 () Bool)

(assert (=> b!896475 (= e!501123 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76348 lt!404654) #b00000000000000000000000000000001) (nextIndex!0 (index!37989 lt!404654) (x!76348 lt!404654) (mask!26019 thiss!1181)) (index!37989 lt!404654) key!785 (_keys!10110 thiss!1181) (mask!26019 thiss!1181)))))

(assert (= (and d!110767 c!94658) b!896473))

(assert (= (and d!110767 (not c!94658)) b!896474))

(assert (= (and b!896474 c!94657) b!896472))

(assert (= (and b!896474 (not c!94657)) b!896471))

(assert (= (and b!896471 c!94659) b!896470))

(assert (= (and b!896471 (not c!94659)) b!896475))

(declare-fun m!833041 () Bool)

(assert (=> d!110767 m!833041))

(declare-fun m!833043 () Bool)

(assert (=> d!110767 m!833043))

(assert (=> d!110767 m!833001))

(assert (=> d!110767 m!832921))

(declare-fun m!833045 () Bool)

(assert (=> b!896475 m!833045))

(assert (=> b!896475 m!833045))

(declare-fun m!833047 () Bool)

(assert (=> b!896475 m!833047))

(assert (=> b!896367 d!110767))

(declare-fun b!896485 () Bool)

(declare-fun e!501131 () (_ BitVec 32))

(declare-fun e!501130 () (_ BitVec 32))

(assert (=> b!896485 (= e!501131 e!501130)))

(declare-fun c!94665 () Bool)

(assert (=> b!896485 (= c!94665 (validKeyInArray!0 (select (arr!25271 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896486 () Bool)

(declare-fun call!39761 () (_ BitVec 32))

(assert (=> b!896486 (= e!501130 call!39761)))

(declare-fun b!896487 () Bool)

(assert (=> b!896487 (= e!501130 (bvadd #b00000000000000000000000000000001 call!39761))))

(declare-fun bm!39758 () Bool)

(assert (=> bm!39758 (= call!39761 (arrayCountValidKeys!0 (_keys!10110 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25724 (_keys!10110 thiss!1181))))))

(declare-fun b!896484 () Bool)

(assert (=> b!896484 (= e!501131 #b00000000000000000000000000000000)))

(declare-fun d!110769 () Bool)

(declare-fun lt!404690 () (_ BitVec 32))

(assert (=> d!110769 (and (bvsge lt!404690 #b00000000000000000000000000000000) (bvsle lt!404690 (bvsub (size!25724 (_keys!10110 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110769 (= lt!404690 e!501131)))

(declare-fun c!94664 () Bool)

(assert (=> d!110769 (= c!94664 (bvsge #b00000000000000000000000000000000 (size!25724 (_keys!10110 thiss!1181))))))

(assert (=> d!110769 (and (bvsle #b00000000000000000000000000000000 (size!25724 (_keys!10110 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25724 (_keys!10110 thiss!1181)) (size!25724 (_keys!10110 thiss!1181))))))

(assert (=> d!110769 (= (arrayCountValidKeys!0 (_keys!10110 thiss!1181) #b00000000000000000000000000000000 (size!25724 (_keys!10110 thiss!1181))) lt!404690)))

(assert (= (and d!110769 c!94664) b!896484))

(assert (= (and d!110769 (not c!94664)) b!896485))

(assert (= (and b!896485 c!94665) b!896487))

(assert (= (and b!896485 (not c!94665)) b!896486))

(assert (= (or b!896487 b!896486) bm!39758))

(assert (=> b!896485 m!833003))

(assert (=> b!896485 m!833003))

(assert (=> b!896485 m!833025))

(declare-fun m!833049 () Bool)

(assert (=> bm!39758 m!833049))

(assert (=> b!896349 d!110769))

(declare-fun b!896488 () Bool)

(declare-fun e!501133 () Bool)

(assert (=> b!896488 (= e!501133 tp_is_empty!18283)))

(declare-fun condMapEmpty!29055 () Bool)

(declare-fun mapDefault!29055 () ValueCell!8660)

(assert (=> mapNonEmpty!29054 (= condMapEmpty!29055 (= mapRest!29054 ((as const (Array (_ BitVec 32) ValueCell!8660)) mapDefault!29055)))))

(declare-fun e!501132 () Bool)

(declare-fun mapRes!29055 () Bool)

(assert (=> mapNonEmpty!29054 (= tp!55916 (and e!501132 mapRes!29055))))

(declare-fun b!896489 () Bool)

(assert (=> b!896489 (= e!501132 tp_is_empty!18283)))

(declare-fun mapNonEmpty!29055 () Bool)

(declare-fun tp!55917 () Bool)

(assert (=> mapNonEmpty!29055 (= mapRes!29055 (and tp!55917 e!501133))))

(declare-fun mapKey!29055 () (_ BitVec 32))

(declare-fun mapValue!29055 () ValueCell!8660)

(declare-fun mapRest!29055 () (Array (_ BitVec 32) ValueCell!8660))

(assert (=> mapNonEmpty!29055 (= mapRest!29054 (store mapRest!29055 mapKey!29055 mapValue!29055))))

(declare-fun mapIsEmpty!29055 () Bool)

(assert (=> mapIsEmpty!29055 mapRes!29055))

(assert (= (and mapNonEmpty!29054 condMapEmpty!29055) mapIsEmpty!29055))

(assert (= (and mapNonEmpty!29054 (not condMapEmpty!29055)) mapNonEmpty!29055))

(assert (= (and mapNonEmpty!29055 ((_ is ValueCellFull!8660) mapValue!29055)) b!896488))

(assert (= (and mapNonEmpty!29054 ((_ is ValueCellFull!8660) mapDefault!29055)) b!896489))

(declare-fun m!833051 () Bool)

(assert (=> mapNonEmpty!29055 m!833051))

(check-sat b_and!26221 (not bm!39758) (not d!110749) (not b!896485) (not bm!39752) (not b!896442) (not d!110767) (not d!110765) (not b!896475) (not mapNonEmpty!29055) (not b!896451) (not b!896438) (not b!896417) (not b!896427) tp_is_empty!18283 (not b!896397) (not b!896457) (not d!110755) (not b!896439) (not b!896396) (not bm!39755) (not b_next!15955) (not d!110751) (not b!896453))
(check-sat b_and!26221 (not b_next!15955))
