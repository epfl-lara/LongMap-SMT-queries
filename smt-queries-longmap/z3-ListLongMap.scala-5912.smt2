; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76560 () Bool)

(assert start!76560)

(declare-fun b!896869 () Bool)

(declare-fun b_free!15973 () Bool)

(declare-fun b_next!15973 () Bool)

(assert (=> b!896869 (= b_free!15973 (not b_next!15973))))

(declare-fun tp!55966 () Bool)

(declare-fun b_and!26239 () Bool)

(assert (=> b!896869 (= tp!55966 b_and!26239)))

(declare-fun mapIsEmpty!29083 () Bool)

(declare-fun mapRes!29083 () Bool)

(assert (=> mapIsEmpty!29083 mapRes!29083))

(declare-fun b!896861 () Bool)

(declare-fun e!501437 () Bool)

(declare-fun e!501431 () Bool)

(assert (=> b!896861 (= e!501437 (not e!501431))))

(declare-fun res!606350 () Bool)

(assert (=> b!896861 (=> res!606350 e!501431)))

(declare-datatypes ((SeekEntryResult!8910 0))(
  ( (MissingZero!8910 (index!38011 (_ BitVec 32))) (Found!8910 (index!38012 (_ BitVec 32))) (Intermediate!8910 (undefined!9722 Bool) (index!38013 (_ BitVec 32)) (x!76420 (_ BitVec 32))) (Undefined!8910) (MissingVacant!8910 (index!38014 (_ BitVec 32))) )
))
(declare-fun lt!404827 () SeekEntryResult!8910)

(get-info :version)

(assert (=> b!896861 (= res!606350 (not ((_ is Found!8910) lt!404827)))))

(declare-fun e!501432 () Bool)

(assert (=> b!896861 e!501432))

(declare-fun res!606351 () Bool)

(assert (=> b!896861 (=> res!606351 e!501432)))

(assert (=> b!896861 (= res!606351 (not ((_ is Found!8910) lt!404827)))))

(declare-datatypes ((Unit!30442 0))(
  ( (Unit!30443) )
))
(declare-fun lt!404828 () Unit!30442)

(declare-datatypes ((array!52609 0))(
  ( (array!52610 (arr!25289 (Array (_ BitVec 32) (_ BitVec 64))) (size!25744 (_ BitVec 32))) )
))
(declare-datatypes ((V!29367 0))(
  ( (V!29368 (val!9201 Int)) )
))
(declare-datatypes ((ValueCell!8669 0))(
  ( (ValueCellFull!8669 (v!11688 V!29367)) (EmptyCell!8669) )
))
(declare-datatypes ((array!52611 0))(
  ( (array!52612 (arr!25290 (Array (_ BitVec 32) ValueCell!8669)) (size!25745 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4354 0))(
  ( (LongMapFixedSize!4355 (defaultEntry!5389 Int) (mask!26056 (_ BitVec 32)) (extraKeys!5096 (_ BitVec 32)) (zeroValue!5200 V!29367) (minValue!5200 V!29367) (_size!2232 (_ BitVec 32)) (_keys!10133 array!52609) (_values!5387 array!52611) (_vacant!2232 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4354)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!78 (array!52609 array!52611 (_ BitVec 32) (_ BitVec 32) V!29367 V!29367 (_ BitVec 64)) Unit!30442)

(assert (=> b!896861 (= lt!404828 (lemmaSeekEntryGivesInRangeIndex!78 (_keys!10133 thiss!1181) (_values!5387 thiss!1181) (mask!26056 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8910)

(assert (=> b!896861 (= lt!404827 (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun res!606348 () Bool)

(assert (=> start!76560 (=> (not res!606348) (not e!501437))))

(declare-fun valid!1684 (LongMapFixedSize!4354) Bool)

(assert (=> start!76560 (= res!606348 (valid!1684 thiss!1181))))

(assert (=> start!76560 e!501437))

(declare-fun e!501429 () Bool)

(assert (=> start!76560 e!501429))

(assert (=> start!76560 true))

(declare-fun mapNonEmpty!29083 () Bool)

(declare-fun tp!55965 () Bool)

(declare-fun e!501434 () Bool)

(assert (=> mapNonEmpty!29083 (= mapRes!29083 (and tp!55965 e!501434))))

(declare-fun mapKey!29083 () (_ BitVec 32))

(declare-fun mapRest!29083 () (Array (_ BitVec 32) ValueCell!8669))

(declare-fun mapValue!29083 () ValueCell!8669)

(assert (=> mapNonEmpty!29083 (= (arr!25290 (_values!5387 thiss!1181)) (store mapRest!29083 mapKey!29083 mapValue!29083))))

(declare-fun b!896862 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896862 (= e!501432 (inRange!0 (index!38012 lt!404827) (mask!26056 thiss!1181)))))

(declare-fun b!896863 () Bool)

(declare-fun e!501430 () Bool)

(declare-fun e!501435 () Bool)

(assert (=> b!896863 (= e!501430 (and e!501435 mapRes!29083))))

(declare-fun condMapEmpty!29083 () Bool)

(declare-fun mapDefault!29083 () ValueCell!8669)

(assert (=> b!896863 (= condMapEmpty!29083 (= (arr!25290 (_values!5387 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8669)) mapDefault!29083)))))

(declare-fun b!896864 () Bool)

(declare-fun tp_is_empty!18301 () Bool)

(assert (=> b!896864 (= e!501434 tp_is_empty!18301)))

(declare-fun b!896865 () Bool)

(declare-fun e!501433 () Bool)

(assert (=> b!896865 (= e!501433 (or (not (= (size!25745 (_values!5387 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26056 thiss!1181)))) (not (= (size!25744 (_keys!10133 thiss!1181)) (size!25745 (_values!5387 thiss!1181)))) (bvslt (mask!26056 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5096 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!896866 () Bool)

(assert (=> b!896866 (= e!501435 tp_is_empty!18301)))

(declare-fun b!896867 () Bool)

(declare-fun res!606352 () Bool)

(assert (=> b!896867 (=> (not res!606352) (not e!501437))))

(assert (=> b!896867 (= res!606352 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896868 () Bool)

(assert (=> b!896868 (= e!501431 e!501433)))

(declare-fun res!606349 () Bool)

(assert (=> b!896868 (=> res!606349 e!501433)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896868 (= res!606349 (not (validMask!0 (mask!26056 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896868 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404826 () Unit!30442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52609 (_ BitVec 64) (_ BitVec 32)) Unit!30442)

(assert (=> b!896868 (= lt!404826 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10133 thiss!1181) key!785 (index!38012 lt!404827)))))

(declare-fun array_inv!19902 (array!52609) Bool)

(declare-fun array_inv!19903 (array!52611) Bool)

(assert (=> b!896869 (= e!501429 (and tp!55966 tp_is_empty!18301 (array_inv!19902 (_keys!10133 thiss!1181)) (array_inv!19903 (_values!5387 thiss!1181)) e!501430))))

(assert (= (and start!76560 res!606348) b!896867))

(assert (= (and b!896867 res!606352) b!896861))

(assert (= (and b!896861 (not res!606351)) b!896862))

(assert (= (and b!896861 (not res!606350)) b!896868))

(assert (= (and b!896868 (not res!606349)) b!896865))

(assert (= (and b!896863 condMapEmpty!29083) mapIsEmpty!29083))

(assert (= (and b!896863 (not condMapEmpty!29083)) mapNonEmpty!29083))

(assert (= (and mapNonEmpty!29083 ((_ is ValueCellFull!8669) mapValue!29083)) b!896864))

(assert (= (and b!896863 ((_ is ValueCellFull!8669) mapDefault!29083)) b!896866))

(assert (= b!896869 b!896863))

(assert (= start!76560 b!896869))

(declare-fun m!833275 () Bool)

(assert (=> b!896868 m!833275))

(declare-fun m!833277 () Bool)

(assert (=> b!896868 m!833277))

(declare-fun m!833279 () Bool)

(assert (=> b!896868 m!833279))

(declare-fun m!833281 () Bool)

(assert (=> b!896862 m!833281))

(declare-fun m!833283 () Bool)

(assert (=> start!76560 m!833283))

(declare-fun m!833285 () Bool)

(assert (=> b!896869 m!833285))

(declare-fun m!833287 () Bool)

(assert (=> b!896869 m!833287))

(declare-fun m!833289 () Bool)

(assert (=> mapNonEmpty!29083 m!833289))

(declare-fun m!833291 () Bool)

(assert (=> b!896861 m!833291))

(declare-fun m!833293 () Bool)

(assert (=> b!896861 m!833293))

(check-sat (not b!896861) (not b!896869) (not mapNonEmpty!29083) (not b!896862) (not b_next!15973) (not b!896868) tp_is_empty!18301 b_and!26239 (not start!76560))
(check-sat b_and!26239 (not b_next!15973))
(get-model)

(declare-fun d!110835 () Bool)

(assert (=> d!110835 (= (array_inv!19902 (_keys!10133 thiss!1181)) (bvsge (size!25744 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896869 d!110835))

(declare-fun d!110837 () Bool)

(assert (=> d!110837 (= (array_inv!19903 (_values!5387 thiss!1181)) (bvsge (size!25745 (_values!5387 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896869 d!110837))

(declare-fun d!110839 () Bool)

(declare-fun res!606389 () Bool)

(declare-fun e!501494 () Bool)

(assert (=> d!110839 (=> (not res!606389) (not e!501494))))

(declare-fun simpleValid!317 (LongMapFixedSize!4354) Bool)

(assert (=> d!110839 (= res!606389 (simpleValid!317 thiss!1181))))

(assert (=> d!110839 (= (valid!1684 thiss!1181) e!501494)))

(declare-fun b!896930 () Bool)

(declare-fun res!606390 () Bool)

(assert (=> b!896930 (=> (not res!606390) (not e!501494))))

(declare-fun arrayCountValidKeys!0 (array!52609 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896930 (= res!606390 (= (arrayCountValidKeys!0 (_keys!10133 thiss!1181) #b00000000000000000000000000000000 (size!25744 (_keys!10133 thiss!1181))) (_size!2232 thiss!1181)))))

(declare-fun b!896931 () Bool)

(declare-fun res!606391 () Bool)

(assert (=> b!896931 (=> (not res!606391) (not e!501494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52609 (_ BitVec 32)) Bool)

(assert (=> b!896931 (= res!606391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun b!896932 () Bool)

(declare-datatypes ((List!17835 0))(
  ( (Nil!17832) (Cons!17831 (h!18971 (_ BitVec 64)) (t!25165 List!17835)) )
))
(declare-fun arrayNoDuplicates!0 (array!52609 (_ BitVec 32) List!17835) Bool)

(assert (=> b!896932 (= e!501494 (arrayNoDuplicates!0 (_keys!10133 thiss!1181) #b00000000000000000000000000000000 Nil!17832))))

(assert (= (and d!110839 res!606389) b!896930))

(assert (= (and b!896930 res!606390) b!896931))

(assert (= (and b!896931 res!606391) b!896932))

(declare-fun m!833335 () Bool)

(assert (=> d!110839 m!833335))

(declare-fun m!833337 () Bool)

(assert (=> b!896930 m!833337))

(declare-fun m!833339 () Bool)

(assert (=> b!896931 m!833339))

(declare-fun m!833341 () Bool)

(assert (=> b!896932 m!833341))

(assert (=> start!76560 d!110839))

(declare-fun d!110841 () Bool)

(declare-fun e!501497 () Bool)

(assert (=> d!110841 e!501497))

(declare-fun res!606394 () Bool)

(assert (=> d!110841 (=> res!606394 e!501497)))

(declare-fun lt!404852 () SeekEntryResult!8910)

(assert (=> d!110841 (= res!606394 (not ((_ is Found!8910) lt!404852)))))

(assert (=> d!110841 (= lt!404852 (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun lt!404851 () Unit!30442)

(declare-fun choose!1491 (array!52609 array!52611 (_ BitVec 32) (_ BitVec 32) V!29367 V!29367 (_ BitVec 64)) Unit!30442)

(assert (=> d!110841 (= lt!404851 (choose!1491 (_keys!10133 thiss!1181) (_values!5387 thiss!1181) (mask!26056 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785))))

(assert (=> d!110841 (validMask!0 (mask!26056 thiss!1181))))

(assert (=> d!110841 (= (lemmaSeekEntryGivesInRangeIndex!78 (_keys!10133 thiss!1181) (_values!5387 thiss!1181) (mask!26056 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785) lt!404851)))

(declare-fun b!896935 () Bool)

(assert (=> b!896935 (= e!501497 (inRange!0 (index!38012 lt!404852) (mask!26056 thiss!1181)))))

(assert (= (and d!110841 (not res!606394)) b!896935))

(assert (=> d!110841 m!833293))

(declare-fun m!833343 () Bool)

(assert (=> d!110841 m!833343))

(assert (=> d!110841 m!833275))

(declare-fun m!833345 () Bool)

(assert (=> b!896935 m!833345))

(assert (=> b!896861 d!110841))

(declare-fun d!110843 () Bool)

(declare-fun lt!404861 () SeekEntryResult!8910)

(assert (=> d!110843 (and (or ((_ is MissingVacant!8910) lt!404861) (not ((_ is Found!8910) lt!404861)) (and (bvsge (index!38012 lt!404861) #b00000000000000000000000000000000) (bvslt (index!38012 lt!404861) (size!25744 (_keys!10133 thiss!1181))))) (not ((_ is MissingVacant!8910) lt!404861)) (or (not ((_ is Found!8910) lt!404861)) (= (select (arr!25289 (_keys!10133 thiss!1181)) (index!38012 lt!404861)) key!785)))))

(declare-fun e!501504 () SeekEntryResult!8910)

(assert (=> d!110843 (= lt!404861 e!501504)))

(declare-fun c!94722 () Bool)

(declare-fun lt!404863 () SeekEntryResult!8910)

(assert (=> d!110843 (= c!94722 (and ((_ is Intermediate!8910) lt!404863) (undefined!9722 lt!404863)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110843 (= lt!404863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26056 thiss!1181)) key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(assert (=> d!110843 (validMask!0 (mask!26056 thiss!1181))))

(assert (=> d!110843 (= (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)) lt!404861)))

(declare-fun b!896948 () Bool)

(declare-fun e!501505 () SeekEntryResult!8910)

(assert (=> b!896948 (= e!501504 e!501505)))

(declare-fun lt!404864 () (_ BitVec 64))

(assert (=> b!896948 (= lt!404864 (select (arr!25289 (_keys!10133 thiss!1181)) (index!38013 lt!404863)))))

(declare-fun c!94720 () Bool)

(assert (=> b!896948 (= c!94720 (= lt!404864 key!785))))

(declare-fun b!896949 () Bool)

(assert (=> b!896949 (= e!501505 (Found!8910 (index!38013 lt!404863)))))

(declare-fun b!896950 () Bool)

(declare-fun e!501506 () SeekEntryResult!8910)

(assert (=> b!896950 (= e!501506 (MissingZero!8910 (index!38013 lt!404863)))))

(declare-fun b!896951 () Bool)

(declare-fun c!94721 () Bool)

(assert (=> b!896951 (= c!94721 (= lt!404864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896951 (= e!501505 e!501506)))

(declare-fun b!896952 () Bool)

(declare-fun lt!404862 () SeekEntryResult!8910)

(assert (=> b!896952 (= e!501506 (ite ((_ is MissingVacant!8910) lt!404862) (MissingZero!8910 (index!38014 lt!404862)) lt!404862))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8910)

(assert (=> b!896952 (= lt!404862 (seekKeyOrZeroReturnVacant!0 (x!76420 lt!404863) (index!38013 lt!404863) (index!38013 lt!404863) key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun b!896953 () Bool)

(assert (=> b!896953 (= e!501504 Undefined!8910)))

(assert (= (and d!110843 c!94722) b!896953))

(assert (= (and d!110843 (not c!94722)) b!896948))

(assert (= (and b!896948 c!94720) b!896949))

(assert (= (and b!896948 (not c!94720)) b!896951))

(assert (= (and b!896951 c!94721) b!896950))

(assert (= (and b!896951 (not c!94721)) b!896952))

(declare-fun m!833347 () Bool)

(assert (=> d!110843 m!833347))

(declare-fun m!833349 () Bool)

(assert (=> d!110843 m!833349))

(assert (=> d!110843 m!833349))

(declare-fun m!833351 () Bool)

(assert (=> d!110843 m!833351))

(assert (=> d!110843 m!833275))

(declare-fun m!833353 () Bool)

(assert (=> b!896948 m!833353))

(declare-fun m!833355 () Bool)

(assert (=> b!896952 m!833355))

(assert (=> b!896861 d!110843))

(declare-fun d!110845 () Bool)

(assert (=> d!110845 (= (validMask!0 (mask!26056 thiss!1181)) (and (or (= (mask!26056 thiss!1181) #b00000000000000000000000000000111) (= (mask!26056 thiss!1181) #b00000000000000000000000000001111) (= (mask!26056 thiss!1181) #b00000000000000000000000000011111) (= (mask!26056 thiss!1181) #b00000000000000000000000000111111) (= (mask!26056 thiss!1181) #b00000000000000000000000001111111) (= (mask!26056 thiss!1181) #b00000000000000000000000011111111) (= (mask!26056 thiss!1181) #b00000000000000000000000111111111) (= (mask!26056 thiss!1181) #b00000000000000000000001111111111) (= (mask!26056 thiss!1181) #b00000000000000000000011111111111) (= (mask!26056 thiss!1181) #b00000000000000000000111111111111) (= (mask!26056 thiss!1181) #b00000000000000000001111111111111) (= (mask!26056 thiss!1181) #b00000000000000000011111111111111) (= (mask!26056 thiss!1181) #b00000000000000000111111111111111) (= (mask!26056 thiss!1181) #b00000000000000001111111111111111) (= (mask!26056 thiss!1181) #b00000000000000011111111111111111) (= (mask!26056 thiss!1181) #b00000000000000111111111111111111) (= (mask!26056 thiss!1181) #b00000000000001111111111111111111) (= (mask!26056 thiss!1181) #b00000000000011111111111111111111) (= (mask!26056 thiss!1181) #b00000000000111111111111111111111) (= (mask!26056 thiss!1181) #b00000000001111111111111111111111) (= (mask!26056 thiss!1181) #b00000000011111111111111111111111) (= (mask!26056 thiss!1181) #b00000000111111111111111111111111) (= (mask!26056 thiss!1181) #b00000001111111111111111111111111) (= (mask!26056 thiss!1181) #b00000011111111111111111111111111) (= (mask!26056 thiss!1181) #b00000111111111111111111111111111) (= (mask!26056 thiss!1181) #b00001111111111111111111111111111) (= (mask!26056 thiss!1181) #b00011111111111111111111111111111) (= (mask!26056 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26056 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896868 d!110845))

(declare-fun d!110847 () Bool)

(declare-fun res!606399 () Bool)

(declare-fun e!501511 () Bool)

(assert (=> d!110847 (=> res!606399 e!501511)))

(assert (=> d!110847 (= res!606399 (= (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110847 (= (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 #b00000000000000000000000000000000) e!501511)))

(declare-fun b!896958 () Bool)

(declare-fun e!501512 () Bool)

(assert (=> b!896958 (= e!501511 e!501512)))

(declare-fun res!606400 () Bool)

(assert (=> b!896958 (=> (not res!606400) (not e!501512))))

(assert (=> b!896958 (= res!606400 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25744 (_keys!10133 thiss!1181))))))

(declare-fun b!896959 () Bool)

(assert (=> b!896959 (= e!501512 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110847 (not res!606399)) b!896958))

(assert (= (and b!896958 res!606400) b!896959))

(declare-fun m!833357 () Bool)

(assert (=> d!110847 m!833357))

(declare-fun m!833359 () Bool)

(assert (=> b!896959 m!833359))

(assert (=> b!896868 d!110847))

(declare-fun d!110849 () Bool)

(assert (=> d!110849 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404867 () Unit!30442)

(declare-fun choose!13 (array!52609 (_ BitVec 64) (_ BitVec 32)) Unit!30442)

(assert (=> d!110849 (= lt!404867 (choose!13 (_keys!10133 thiss!1181) key!785 (index!38012 lt!404827)))))

(assert (=> d!110849 (bvsge (index!38012 lt!404827) #b00000000000000000000000000000000)))

(assert (=> d!110849 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10133 thiss!1181) key!785 (index!38012 lt!404827)) lt!404867)))

(declare-fun bs!25151 () Bool)

(assert (= bs!25151 d!110849))

(assert (=> bs!25151 m!833277))

(declare-fun m!833361 () Bool)

(assert (=> bs!25151 m!833361))

(assert (=> b!896868 d!110849))

(declare-fun d!110851 () Bool)

(assert (=> d!110851 (= (inRange!0 (index!38012 lt!404827) (mask!26056 thiss!1181)) (and (bvsge (index!38012 lt!404827) #b00000000000000000000000000000000) (bvslt (index!38012 lt!404827) (bvadd (mask!26056 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896862 d!110851))

(declare-fun mapNonEmpty!29092 () Bool)

(declare-fun mapRes!29092 () Bool)

(declare-fun tp!55981 () Bool)

(declare-fun e!501517 () Bool)

(assert (=> mapNonEmpty!29092 (= mapRes!29092 (and tp!55981 e!501517))))

(declare-fun mapKey!29092 () (_ BitVec 32))

(declare-fun mapValue!29092 () ValueCell!8669)

(declare-fun mapRest!29092 () (Array (_ BitVec 32) ValueCell!8669))

(assert (=> mapNonEmpty!29092 (= mapRest!29083 (store mapRest!29092 mapKey!29092 mapValue!29092))))

(declare-fun mapIsEmpty!29092 () Bool)

(assert (=> mapIsEmpty!29092 mapRes!29092))

(declare-fun b!896967 () Bool)

(declare-fun e!501518 () Bool)

(assert (=> b!896967 (= e!501518 tp_is_empty!18301)))

(declare-fun condMapEmpty!29092 () Bool)

(declare-fun mapDefault!29092 () ValueCell!8669)

(assert (=> mapNonEmpty!29083 (= condMapEmpty!29092 (= mapRest!29083 ((as const (Array (_ BitVec 32) ValueCell!8669)) mapDefault!29092)))))

(assert (=> mapNonEmpty!29083 (= tp!55965 (and e!501518 mapRes!29092))))

(declare-fun b!896966 () Bool)

(assert (=> b!896966 (= e!501517 tp_is_empty!18301)))

(assert (= (and mapNonEmpty!29083 condMapEmpty!29092) mapIsEmpty!29092))

(assert (= (and mapNonEmpty!29083 (not condMapEmpty!29092)) mapNonEmpty!29092))

(assert (= (and mapNonEmpty!29092 ((_ is ValueCellFull!8669) mapValue!29092)) b!896966))

(assert (= (and mapNonEmpty!29083 ((_ is ValueCellFull!8669) mapDefault!29092)) b!896967))

(declare-fun m!833363 () Bool)

(assert (=> mapNonEmpty!29092 m!833363))

(check-sat b_and!26239 (not d!110839) (not d!110849) (not d!110843) (not b!896932) (not b!896935) (not mapNonEmpty!29092) (not b!896931) (not b!896930) (not d!110841) (not b_next!15973) (not b!896959) (not b!896952) tp_is_empty!18301)
(check-sat b_and!26239 (not b_next!15973))
(get-model)

(declare-fun bm!39770 () Bool)

(declare-fun call!39773 () (_ BitVec 32))

(assert (=> bm!39770 (= call!39773 (arrayCountValidKeys!0 (_keys!10133 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25744 (_keys!10133 thiss!1181))))))

(declare-fun d!110853 () Bool)

(declare-fun lt!404870 () (_ BitVec 32))

(assert (=> d!110853 (and (bvsge lt!404870 #b00000000000000000000000000000000) (bvsle lt!404870 (bvsub (size!25744 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!501524 () (_ BitVec 32))

(assert (=> d!110853 (= lt!404870 e!501524)))

(declare-fun c!94727 () Bool)

(assert (=> d!110853 (= c!94727 (bvsge #b00000000000000000000000000000000 (size!25744 (_keys!10133 thiss!1181))))))

(assert (=> d!110853 (and (bvsle #b00000000000000000000000000000000 (size!25744 (_keys!10133 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25744 (_keys!10133 thiss!1181)) (size!25744 (_keys!10133 thiss!1181))))))

(assert (=> d!110853 (= (arrayCountValidKeys!0 (_keys!10133 thiss!1181) #b00000000000000000000000000000000 (size!25744 (_keys!10133 thiss!1181))) lt!404870)))

(declare-fun b!896976 () Bool)

(assert (=> b!896976 (= e!501524 #b00000000000000000000000000000000)))

(declare-fun b!896977 () Bool)

(declare-fun e!501523 () (_ BitVec 32))

(assert (=> b!896977 (= e!501523 call!39773)))

(declare-fun b!896978 () Bool)

(assert (=> b!896978 (= e!501524 e!501523)))

(declare-fun c!94728 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!896978 (= c!94728 (validKeyInArray!0 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!896979 () Bool)

(assert (=> b!896979 (= e!501523 (bvadd #b00000000000000000000000000000001 call!39773))))

(assert (= (and d!110853 c!94727) b!896976))

(assert (= (and d!110853 (not c!94727)) b!896978))

(assert (= (and b!896978 c!94728) b!896979))

(assert (= (and b!896978 (not c!94728)) b!896977))

(assert (= (or b!896979 b!896977) bm!39770))

(declare-fun m!833365 () Bool)

(assert (=> bm!39770 m!833365))

(assert (=> b!896978 m!833357))

(assert (=> b!896978 m!833357))

(declare-fun m!833367 () Bool)

(assert (=> b!896978 m!833367))

(assert (=> b!896930 d!110853))

(declare-fun b!896998 () Bool)

(declare-fun e!501539 () SeekEntryResult!8910)

(assert (=> b!896998 (= e!501539 (Intermediate!8910 false (toIndex!0 key!785 (mask!26056 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!896999 () Bool)

(declare-fun e!501536 () Bool)

(declare-fun e!501538 () Bool)

(assert (=> b!896999 (= e!501536 e!501538)))

(declare-fun res!606409 () Bool)

(declare-fun lt!404876 () SeekEntryResult!8910)

(assert (=> b!896999 (= res!606409 (and ((_ is Intermediate!8910) lt!404876) (not (undefined!9722 lt!404876)) (bvslt (x!76420 lt!404876) #b01111111111111111111111111111110) (bvsge (x!76420 lt!404876) #b00000000000000000000000000000000) (bvsge (x!76420 lt!404876) #b00000000000000000000000000000000)))))

(assert (=> b!896999 (=> (not res!606409) (not e!501538))))

(declare-fun b!897000 () Bool)

(declare-fun e!501537 () SeekEntryResult!8910)

(assert (=> b!897000 (= e!501537 (Intermediate!8910 true (toIndex!0 key!785 (mask!26056 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897001 () Bool)

(assert (=> b!897001 (and (bvsge (index!38013 lt!404876) #b00000000000000000000000000000000) (bvslt (index!38013 lt!404876) (size!25744 (_keys!10133 thiss!1181))))))

(declare-fun res!606408 () Bool)

(assert (=> b!897001 (= res!606408 (= (select (arr!25289 (_keys!10133 thiss!1181)) (index!38013 lt!404876)) key!785))))

(declare-fun e!501535 () Bool)

(assert (=> b!897001 (=> res!606408 e!501535)))

(assert (=> b!897001 (= e!501538 e!501535)))

(declare-fun b!897002 () Bool)

(assert (=> b!897002 (= e!501537 e!501539)))

(declare-fun c!94737 () Bool)

(declare-fun lt!404875 () (_ BitVec 64))

(assert (=> b!897002 (= c!94737 (or (= lt!404875 key!785) (= (bvadd lt!404875 lt!404875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!897003 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897003 (= e!501539 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26056 thiss!1181)) #b00000000000000000000000000000000 (mask!26056 thiss!1181)) key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun b!897004 () Bool)

(assert (=> b!897004 (and (bvsge (index!38013 lt!404876) #b00000000000000000000000000000000) (bvslt (index!38013 lt!404876) (size!25744 (_keys!10133 thiss!1181))))))

(declare-fun res!606407 () Bool)

(assert (=> b!897004 (= res!606407 (= (select (arr!25289 (_keys!10133 thiss!1181)) (index!38013 lt!404876)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897004 (=> res!606407 e!501535)))

(declare-fun d!110855 () Bool)

(assert (=> d!110855 e!501536))

(declare-fun c!94736 () Bool)

(assert (=> d!110855 (= c!94736 (and ((_ is Intermediate!8910) lt!404876) (undefined!9722 lt!404876)))))

(assert (=> d!110855 (= lt!404876 e!501537)))

(declare-fun c!94735 () Bool)

(assert (=> d!110855 (= c!94735 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110855 (= lt!404875 (select (arr!25289 (_keys!10133 thiss!1181)) (toIndex!0 key!785 (mask!26056 thiss!1181))))))

(assert (=> d!110855 (validMask!0 (mask!26056 thiss!1181))))

(assert (=> d!110855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26056 thiss!1181)) key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)) lt!404876)))

(declare-fun b!897005 () Bool)

(assert (=> b!897005 (= e!501536 (bvsge (x!76420 lt!404876) #b01111111111111111111111111111110))))

(declare-fun b!897006 () Bool)

(assert (=> b!897006 (and (bvsge (index!38013 lt!404876) #b00000000000000000000000000000000) (bvslt (index!38013 lt!404876) (size!25744 (_keys!10133 thiss!1181))))))

(assert (=> b!897006 (= e!501535 (= (select (arr!25289 (_keys!10133 thiss!1181)) (index!38013 lt!404876)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!110855 c!94735) b!897000))

(assert (= (and d!110855 (not c!94735)) b!897002))

(assert (= (and b!897002 c!94737) b!896998))

(assert (= (and b!897002 (not c!94737)) b!897003))

(assert (= (and d!110855 c!94736) b!897005))

(assert (= (and d!110855 (not c!94736)) b!896999))

(assert (= (and b!896999 res!606409) b!897001))

(assert (= (and b!897001 (not res!606408)) b!897004))

(assert (= (and b!897004 (not res!606407)) b!897006))

(declare-fun m!833369 () Bool)

(assert (=> b!897006 m!833369))

(assert (=> b!897003 m!833349))

(declare-fun m!833371 () Bool)

(assert (=> b!897003 m!833371))

(assert (=> b!897003 m!833371))

(declare-fun m!833373 () Bool)

(assert (=> b!897003 m!833373))

(assert (=> d!110855 m!833349))

(declare-fun m!833375 () Bool)

(assert (=> d!110855 m!833375))

(assert (=> d!110855 m!833275))

(assert (=> b!897001 m!833369))

(assert (=> b!897004 m!833369))

(assert (=> d!110843 d!110855))

(declare-fun d!110857 () Bool)

(declare-fun lt!404882 () (_ BitVec 32))

(declare-fun lt!404881 () (_ BitVec 32))

(assert (=> d!110857 (= lt!404882 (bvmul (bvxor lt!404881 (bvlshr lt!404881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110857 (= lt!404881 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110857 (and (bvsge (mask!26056 thiss!1181) #b00000000000000000000000000000000) (let ((res!606410 (let ((h!18972 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76437 (bvmul (bvxor h!18972 (bvlshr h!18972 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76437 (bvlshr x!76437 #b00000000000000000000000000001101)) (mask!26056 thiss!1181)))))) (and (bvslt res!606410 (bvadd (mask!26056 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606410 #b00000000000000000000000000000000))))))

(assert (=> d!110857 (= (toIndex!0 key!785 (mask!26056 thiss!1181)) (bvand (bvxor lt!404882 (bvlshr lt!404882 #b00000000000000000000000000001101)) (mask!26056 thiss!1181)))))

(assert (=> d!110843 d!110857))

(assert (=> d!110843 d!110845))

(declare-fun b!897017 () Bool)

(declare-fun res!606420 () Bool)

(declare-fun e!501542 () Bool)

(assert (=> b!897017 (=> (not res!606420) (not e!501542))))

(declare-fun size!25750 (LongMapFixedSize!4354) (_ BitVec 32))

(assert (=> b!897017 (= res!606420 (= (size!25750 thiss!1181) (bvadd (_size!2232 thiss!1181) (bvsdiv (bvadd (extraKeys!5096 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!897015 () Bool)

(declare-fun res!606422 () Bool)

(assert (=> b!897015 (=> (not res!606422) (not e!501542))))

(assert (=> b!897015 (= res!606422 (and (= (size!25745 (_values!5387 thiss!1181)) (bvadd (mask!26056 thiss!1181) #b00000000000000000000000000000001)) (= (size!25744 (_keys!10133 thiss!1181)) (size!25745 (_values!5387 thiss!1181))) (bvsge (_size!2232 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2232 thiss!1181) (bvadd (mask!26056 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!897016 () Bool)

(declare-fun res!606421 () Bool)

(assert (=> b!897016 (=> (not res!606421) (not e!501542))))

(assert (=> b!897016 (= res!606421 (bvsge (size!25750 thiss!1181) (_size!2232 thiss!1181)))))

(declare-fun d!110859 () Bool)

(declare-fun res!606419 () Bool)

(assert (=> d!110859 (=> (not res!606419) (not e!501542))))

(assert (=> d!110859 (= res!606419 (validMask!0 (mask!26056 thiss!1181)))))

(assert (=> d!110859 (= (simpleValid!317 thiss!1181) e!501542)))

(declare-fun b!897018 () Bool)

(assert (=> b!897018 (= e!501542 (and (bvsge (extraKeys!5096 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5096 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2232 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110859 res!606419) b!897015))

(assert (= (and b!897015 res!606422) b!897016))

(assert (= (and b!897016 res!606421) b!897017))

(assert (= (and b!897017 res!606420) b!897018))

(declare-fun m!833377 () Bool)

(assert (=> b!897017 m!833377))

(assert (=> b!897016 m!833377))

(assert (=> d!110859 m!833275))

(assert (=> d!110839 d!110859))

(assert (=> d!110841 d!110843))

(declare-fun d!110861 () Bool)

(declare-fun e!501545 () Bool)

(assert (=> d!110861 e!501545))

(declare-fun res!606425 () Bool)

(assert (=> d!110861 (=> res!606425 e!501545)))

(declare-fun lt!404885 () SeekEntryResult!8910)

(assert (=> d!110861 (= res!606425 (not ((_ is Found!8910) lt!404885)))))

(assert (=> d!110861 (= lt!404885 (seekEntry!0 key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(assert (=> d!110861 true))

(declare-fun _$36!360 () Unit!30442)

(assert (=> d!110861 (= (choose!1491 (_keys!10133 thiss!1181) (_values!5387 thiss!1181) (mask!26056 thiss!1181) (extraKeys!5096 thiss!1181) (zeroValue!5200 thiss!1181) (minValue!5200 thiss!1181) key!785) _$36!360)))

(declare-fun b!897021 () Bool)

(assert (=> b!897021 (= e!501545 (inRange!0 (index!38012 lt!404885) (mask!26056 thiss!1181)))))

(assert (= (and d!110861 (not res!606425)) b!897021))

(assert (=> d!110861 m!833293))

(declare-fun m!833379 () Bool)

(assert (=> b!897021 m!833379))

(assert (=> d!110841 d!110861))

(assert (=> d!110841 d!110845))

(declare-fun d!110863 () Bool)

(declare-fun res!606431 () Bool)

(declare-fun e!501552 () Bool)

(assert (=> d!110863 (=> res!606431 e!501552)))

(assert (=> d!110863 (= res!606431 (bvsge #b00000000000000000000000000000000 (size!25744 (_keys!10133 thiss!1181))))))

(assert (=> d!110863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)) e!501552)))

(declare-fun b!897030 () Bool)

(declare-fun e!501554 () Bool)

(declare-fun call!39776 () Bool)

(assert (=> b!897030 (= e!501554 call!39776)))

(declare-fun bm!39773 () Bool)

(assert (=> bm!39773 (= call!39776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun b!897031 () Bool)

(declare-fun e!501553 () Bool)

(assert (=> b!897031 (= e!501553 call!39776)))

(declare-fun b!897032 () Bool)

(assert (=> b!897032 (= e!501552 e!501553)))

(declare-fun c!94740 () Bool)

(assert (=> b!897032 (= c!94740 (validKeyInArray!0 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897033 () Bool)

(assert (=> b!897033 (= e!501553 e!501554)))

(declare-fun lt!404892 () (_ BitVec 64))

(assert (=> b!897033 (= lt!404892 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404893 () Unit!30442)

(assert (=> b!897033 (= lt!404893 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10133 thiss!1181) lt!404892 #b00000000000000000000000000000000))))

(assert (=> b!897033 (arrayContainsKey!0 (_keys!10133 thiss!1181) lt!404892 #b00000000000000000000000000000000)))

(declare-fun lt!404894 () Unit!30442)

(assert (=> b!897033 (= lt!404894 lt!404893)))

(declare-fun res!606430 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52609 (_ BitVec 32)) SeekEntryResult!8910)

(assert (=> b!897033 (= res!606430 (= (seekEntryOrOpen!0 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000) (_keys!10133 thiss!1181) (mask!26056 thiss!1181)) (Found!8910 #b00000000000000000000000000000000)))))

(assert (=> b!897033 (=> (not res!606430) (not e!501554))))

(assert (= (and d!110863 (not res!606431)) b!897032))

(assert (= (and b!897032 c!94740) b!897033))

(assert (= (and b!897032 (not c!94740)) b!897031))

(assert (= (and b!897033 res!606430) b!897030))

(assert (= (or b!897030 b!897031) bm!39773))

(declare-fun m!833381 () Bool)

(assert (=> bm!39773 m!833381))

(assert (=> b!897032 m!833357))

(assert (=> b!897032 m!833357))

(assert (=> b!897032 m!833367))

(assert (=> b!897033 m!833357))

(declare-fun m!833383 () Bool)

(assert (=> b!897033 m!833383))

(declare-fun m!833385 () Bool)

(assert (=> b!897033 m!833385))

(assert (=> b!897033 m!833357))

(declare-fun m!833387 () Bool)

(assert (=> b!897033 m!833387))

(assert (=> b!896931 d!110863))

(declare-fun d!110865 () Bool)

(declare-fun res!606432 () Bool)

(declare-fun e!501555 () Bool)

(assert (=> d!110865 (=> res!606432 e!501555)))

(assert (=> d!110865 (= res!606432 (= (select (arr!25289 (_keys!10133 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110865 (= (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501555)))

(declare-fun b!897034 () Bool)

(declare-fun e!501556 () Bool)

(assert (=> b!897034 (= e!501555 e!501556)))

(declare-fun res!606433 () Bool)

(assert (=> b!897034 (=> (not res!606433) (not e!501556))))

(assert (=> b!897034 (= res!606433 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25744 (_keys!10133 thiss!1181))))))

(declare-fun b!897035 () Bool)

(assert (=> b!897035 (= e!501556 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110865 (not res!606432)) b!897034))

(assert (= (and b!897034 res!606433) b!897035))

(declare-fun m!833389 () Bool)

(assert (=> d!110865 m!833389))

(declare-fun m!833391 () Bool)

(assert (=> b!897035 m!833391))

(assert (=> b!896959 d!110865))

(declare-fun b!897046 () Bool)

(declare-fun e!501567 () Bool)

(declare-fun call!39779 () Bool)

(assert (=> b!897046 (= e!501567 call!39779)))

(declare-fun d!110867 () Bool)

(declare-fun res!606440 () Bool)

(declare-fun e!501566 () Bool)

(assert (=> d!110867 (=> res!606440 e!501566)))

(assert (=> d!110867 (= res!606440 (bvsge #b00000000000000000000000000000000 (size!25744 (_keys!10133 thiss!1181))))))

(assert (=> d!110867 (= (arrayNoDuplicates!0 (_keys!10133 thiss!1181) #b00000000000000000000000000000000 Nil!17832) e!501566)))

(declare-fun b!897047 () Bool)

(declare-fun e!501565 () Bool)

(assert (=> b!897047 (= e!501566 e!501565)))

(declare-fun res!606442 () Bool)

(assert (=> b!897047 (=> (not res!606442) (not e!501565))))

(declare-fun e!501568 () Bool)

(assert (=> b!897047 (= res!606442 (not e!501568))))

(declare-fun res!606441 () Bool)

(assert (=> b!897047 (=> (not res!606441) (not e!501568))))

(assert (=> b!897047 (= res!606441 (validKeyInArray!0 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897048 () Bool)

(assert (=> b!897048 (= e!501565 e!501567)))

(declare-fun c!94743 () Bool)

(assert (=> b!897048 (= c!94743 (validKeyInArray!0 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39776 () Bool)

(assert (=> bm!39776 (= call!39779 (arrayNoDuplicates!0 (_keys!10133 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94743 (Cons!17831 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000) Nil!17832) Nil!17832)))))

(declare-fun b!897049 () Bool)

(assert (=> b!897049 (= e!501567 call!39779)))

(declare-fun b!897050 () Bool)

(declare-fun contains!4373 (List!17835 (_ BitVec 64)) Bool)

(assert (=> b!897050 (= e!501568 (contains!4373 Nil!17832 (select (arr!25289 (_keys!10133 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110867 (not res!606440)) b!897047))

(assert (= (and b!897047 res!606441) b!897050))

(assert (= (and b!897047 res!606442) b!897048))

(assert (= (and b!897048 c!94743) b!897046))

(assert (= (and b!897048 (not c!94743)) b!897049))

(assert (= (or b!897046 b!897049) bm!39776))

(assert (=> b!897047 m!833357))

(assert (=> b!897047 m!833357))

(assert (=> b!897047 m!833367))

(assert (=> b!897048 m!833357))

(assert (=> b!897048 m!833357))

(assert (=> b!897048 m!833367))

(assert (=> bm!39776 m!833357))

(declare-fun m!833393 () Bool)

(assert (=> bm!39776 m!833393))

(assert (=> b!897050 m!833357))

(assert (=> b!897050 m!833357))

(declare-fun m!833395 () Bool)

(assert (=> b!897050 m!833395))

(assert (=> b!896932 d!110867))

(declare-fun b!897063 () Bool)

(declare-fun e!501576 () SeekEntryResult!8910)

(assert (=> b!897063 (= e!501576 Undefined!8910)))

(declare-fun e!501577 () SeekEntryResult!8910)

(declare-fun b!897064 () Bool)

(assert (=> b!897064 (= e!501577 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76420 lt!404863) #b00000000000000000000000000000001) (nextIndex!0 (index!38013 lt!404863) (x!76420 lt!404863) (mask!26056 thiss!1181)) (index!38013 lt!404863) key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)))))

(declare-fun b!897065 () Bool)

(declare-fun e!501575 () SeekEntryResult!8910)

(assert (=> b!897065 (= e!501576 e!501575)))

(declare-fun c!94751 () Bool)

(declare-fun lt!404899 () (_ BitVec 64))

(assert (=> b!897065 (= c!94751 (= lt!404899 key!785))))

(declare-fun b!897066 () Bool)

(declare-fun c!94752 () Bool)

(assert (=> b!897066 (= c!94752 (= lt!404899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897066 (= e!501575 e!501577)))

(declare-fun d!110869 () Bool)

(declare-fun lt!404900 () SeekEntryResult!8910)

(assert (=> d!110869 (and (or ((_ is Undefined!8910) lt!404900) (not ((_ is Found!8910) lt!404900)) (and (bvsge (index!38012 lt!404900) #b00000000000000000000000000000000) (bvslt (index!38012 lt!404900) (size!25744 (_keys!10133 thiss!1181))))) (or ((_ is Undefined!8910) lt!404900) ((_ is Found!8910) lt!404900) (not ((_ is MissingVacant!8910) lt!404900)) (not (= (index!38014 lt!404900) (index!38013 lt!404863))) (and (bvsge (index!38014 lt!404900) #b00000000000000000000000000000000) (bvslt (index!38014 lt!404900) (size!25744 (_keys!10133 thiss!1181))))) (or ((_ is Undefined!8910) lt!404900) (ite ((_ is Found!8910) lt!404900) (= (select (arr!25289 (_keys!10133 thiss!1181)) (index!38012 lt!404900)) key!785) (and ((_ is MissingVacant!8910) lt!404900) (= (index!38014 lt!404900) (index!38013 lt!404863)) (= (select (arr!25289 (_keys!10133 thiss!1181)) (index!38014 lt!404900)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110869 (= lt!404900 e!501576)))

(declare-fun c!94750 () Bool)

(assert (=> d!110869 (= c!94750 (bvsge (x!76420 lt!404863) #b01111111111111111111111111111110))))

(assert (=> d!110869 (= lt!404899 (select (arr!25289 (_keys!10133 thiss!1181)) (index!38013 lt!404863)))))

(assert (=> d!110869 (validMask!0 (mask!26056 thiss!1181))))

(assert (=> d!110869 (= (seekKeyOrZeroReturnVacant!0 (x!76420 lt!404863) (index!38013 lt!404863) (index!38013 lt!404863) key!785 (_keys!10133 thiss!1181) (mask!26056 thiss!1181)) lt!404900)))

(declare-fun b!897067 () Bool)

(assert (=> b!897067 (= e!501577 (MissingVacant!8910 (index!38013 lt!404863)))))

(declare-fun b!897068 () Bool)

(assert (=> b!897068 (= e!501575 (Found!8910 (index!38013 lt!404863)))))

(assert (= (and d!110869 c!94750) b!897063))

(assert (= (and d!110869 (not c!94750)) b!897065))

(assert (= (and b!897065 c!94751) b!897068))

(assert (= (and b!897065 (not c!94751)) b!897066))

(assert (= (and b!897066 c!94752) b!897067))

(assert (= (and b!897066 (not c!94752)) b!897064))

(declare-fun m!833397 () Bool)

(assert (=> b!897064 m!833397))

(assert (=> b!897064 m!833397))

(declare-fun m!833399 () Bool)

(assert (=> b!897064 m!833399))

(declare-fun m!833401 () Bool)

(assert (=> d!110869 m!833401))

(declare-fun m!833403 () Bool)

(assert (=> d!110869 m!833403))

(assert (=> d!110869 m!833353))

(assert (=> d!110869 m!833275))

(assert (=> b!896952 d!110869))

(declare-fun d!110871 () Bool)

(assert (=> d!110871 (= (inRange!0 (index!38012 lt!404852) (mask!26056 thiss!1181)) (and (bvsge (index!38012 lt!404852) #b00000000000000000000000000000000) (bvslt (index!38012 lt!404852) (bvadd (mask!26056 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896935 d!110871))

(assert (=> d!110849 d!110847))

(declare-fun d!110873 () Bool)

(assert (=> d!110873 (arrayContainsKey!0 (_keys!10133 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110873 true))

(declare-fun _$60!409 () Unit!30442)

(assert (=> d!110873 (= (choose!13 (_keys!10133 thiss!1181) key!785 (index!38012 lt!404827)) _$60!409)))

(declare-fun bs!25152 () Bool)

(assert (= bs!25152 d!110873))

(assert (=> bs!25152 m!833277))

(assert (=> d!110849 d!110873))

(declare-fun mapNonEmpty!29093 () Bool)

(declare-fun mapRes!29093 () Bool)

(declare-fun tp!55982 () Bool)

(declare-fun e!501578 () Bool)

(assert (=> mapNonEmpty!29093 (= mapRes!29093 (and tp!55982 e!501578))))

(declare-fun mapKey!29093 () (_ BitVec 32))

(declare-fun mapRest!29093 () (Array (_ BitVec 32) ValueCell!8669))

(declare-fun mapValue!29093 () ValueCell!8669)

(assert (=> mapNonEmpty!29093 (= mapRest!29092 (store mapRest!29093 mapKey!29093 mapValue!29093))))

(declare-fun mapIsEmpty!29093 () Bool)

(assert (=> mapIsEmpty!29093 mapRes!29093))

(declare-fun b!897070 () Bool)

(declare-fun e!501579 () Bool)

(assert (=> b!897070 (= e!501579 tp_is_empty!18301)))

(declare-fun condMapEmpty!29093 () Bool)

(declare-fun mapDefault!29093 () ValueCell!8669)

(assert (=> mapNonEmpty!29092 (= condMapEmpty!29093 (= mapRest!29092 ((as const (Array (_ BitVec 32) ValueCell!8669)) mapDefault!29093)))))

(assert (=> mapNonEmpty!29092 (= tp!55981 (and e!501579 mapRes!29093))))

(declare-fun b!897069 () Bool)

(assert (=> b!897069 (= e!501578 tp_is_empty!18301)))

(assert (= (and mapNonEmpty!29092 condMapEmpty!29093) mapIsEmpty!29093))

(assert (= (and mapNonEmpty!29092 (not condMapEmpty!29093)) mapNonEmpty!29093))

(assert (= (and mapNonEmpty!29093 ((_ is ValueCellFull!8669) mapValue!29093)) b!897069))

(assert (= (and mapNonEmpty!29092 ((_ is ValueCellFull!8669) mapDefault!29093)) b!897070))

(declare-fun m!833405 () Bool)

(assert (=> mapNonEmpty!29093 m!833405))

(check-sat (not mapNonEmpty!29093) (not bm!39770) (not b!897048) (not b!897033) (not d!110859) (not b!897032) (not bm!39773) tp_is_empty!18301 (not d!110869) b_and!26239 (not b!897064) (not d!110855) (not b!897047) (not b!897017) (not b!897003) (not b!897016) (not b!896978) (not b!897035) (not bm!39776) (not b_next!15973) (not b!897021) (not d!110873) (not b!897050) (not d!110861))
(check-sat b_and!26239 (not b_next!15973))
