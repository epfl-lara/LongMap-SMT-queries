; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76644 () Bool)

(assert start!76644)

(declare-fun b!897325 () Bool)

(declare-fun b_free!15985 () Bool)

(declare-fun b_next!15985 () Bool)

(assert (=> b!897325 (= b_free!15985 (not b_next!15985))))

(declare-fun tp!56010 () Bool)

(declare-fun b_and!26251 () Bool)

(assert (=> b!897325 (= tp!56010 b_and!26251)))

(declare-fun b!897319 () Bool)

(declare-fun e!501770 () Bool)

(declare-fun e!501774 () Bool)

(declare-fun mapRes!29109 () Bool)

(assert (=> b!897319 (= e!501770 (and e!501774 mapRes!29109))))

(declare-fun condMapEmpty!29109 () Bool)

(declare-datatypes ((array!52637 0))(
  ( (array!52638 (arr!25301 (Array (_ BitVec 32) (_ BitVec 64))) (size!25758 (_ BitVec 32))) )
))
(declare-datatypes ((V!29383 0))(
  ( (V!29384 (val!9207 Int)) )
))
(declare-datatypes ((ValueCell!8675 0))(
  ( (ValueCellFull!8675 (v!11694 V!29383)) (EmptyCell!8675) )
))
(declare-datatypes ((array!52639 0))(
  ( (array!52640 (arr!25302 (Array (_ BitVec 32) ValueCell!8675)) (size!25759 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4366 0))(
  ( (LongMapFixedSize!4367 (defaultEntry!5395 Int) (mask!26084 (_ BitVec 32)) (extraKeys!5106 (_ BitVec 32)) (zeroValue!5210 V!29383) (minValue!5210 V!29383) (_size!2238 (_ BitVec 32)) (_keys!10151 array!52637) (_values!5397 array!52639) (_vacant!2238 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4366)

(declare-fun mapDefault!29109 () ValueCell!8675)

(assert (=> b!897319 (= condMapEmpty!29109 (= (arr!25302 (_values!5397 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8675)) mapDefault!29109)))))

(declare-fun b!897320 () Bool)

(declare-fun res!606563 () Bool)

(declare-fun e!501773 () Bool)

(assert (=> b!897320 (=> (not res!606563) (not e!501773))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897320 (= res!606563 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897321 () Bool)

(declare-fun e!501771 () Bool)

(assert (=> b!897321 (= e!501773 (not e!501771))))

(declare-fun res!606561 () Bool)

(assert (=> b!897321 (=> res!606561 e!501771)))

(declare-datatypes ((SeekEntryResult!8914 0))(
  ( (MissingZero!8914 (index!38027 (_ BitVec 32))) (Found!8914 (index!38028 (_ BitVec 32))) (Intermediate!8914 (undefined!9726 Bool) (index!38029 (_ BitVec 32)) (x!76474 (_ BitVec 32))) (Undefined!8914) (MissingVacant!8914 (index!38030 (_ BitVec 32))) )
))
(declare-fun lt!404990 () SeekEntryResult!8914)

(get-info :version)

(assert (=> b!897321 (= res!606561 (not ((_ is Found!8914) lt!404990)))))

(declare-fun e!501769 () Bool)

(assert (=> b!897321 e!501769))

(declare-fun res!606562 () Bool)

(assert (=> b!897321 (=> res!606562 e!501769)))

(assert (=> b!897321 (= res!606562 (not ((_ is Found!8914) lt!404990)))))

(declare-datatypes ((Unit!30448 0))(
  ( (Unit!30449) )
))
(declare-fun lt!404988 () Unit!30448)

(declare-fun lemmaSeekEntryGivesInRangeIndex!80 (array!52637 array!52639 (_ BitVec 32) (_ BitVec 32) V!29383 V!29383 (_ BitVec 64)) Unit!30448)

(assert (=> b!897321 (= lt!404988 (lemmaSeekEntryGivesInRangeIndex!80 (_keys!10151 thiss!1181) (_values!5397 thiss!1181) (mask!26084 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!897321 (= lt!404990 (seekEntry!0 key!785 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(declare-fun res!606564 () Bool)

(assert (=> start!76644 (=> (not res!606564) (not e!501773))))

(declare-fun valid!1689 (LongMapFixedSize!4366) Bool)

(assert (=> start!76644 (= res!606564 (valid!1689 thiss!1181))))

(assert (=> start!76644 e!501773))

(declare-fun e!501772 () Bool)

(assert (=> start!76644 e!501772))

(assert (=> start!76644 true))

(declare-fun mapIsEmpty!29109 () Bool)

(assert (=> mapIsEmpty!29109 mapRes!29109))

(declare-fun b!897322 () Bool)

(declare-fun tp_is_empty!18313 () Bool)

(assert (=> b!897322 (= e!501774 tp_is_empty!18313)))

(declare-fun b!897323 () Bool)

(declare-fun res!606565 () Bool)

(declare-fun e!501768 () Bool)

(assert (=> b!897323 (=> res!606565 e!501768)))

(assert (=> b!897323 (= res!606565 (or (not (= (size!25759 (_values!5397 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26084 thiss!1181)))) (not (= (size!25758 (_keys!10151 thiss!1181)) (size!25759 (_values!5397 thiss!1181)))) (bvslt (mask!26084 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5106 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5106 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897324 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897324 (= e!501769 (inRange!0 (index!38028 lt!404990) (mask!26084 thiss!1181)))))

(declare-fun mapNonEmpty!29109 () Bool)

(declare-fun tp!56009 () Bool)

(declare-fun e!501775 () Bool)

(assert (=> mapNonEmpty!29109 (= mapRes!29109 (and tp!56009 e!501775))))

(declare-fun mapValue!29109 () ValueCell!8675)

(declare-fun mapKey!29109 () (_ BitVec 32))

(declare-fun mapRest!29109 () (Array (_ BitVec 32) ValueCell!8675))

(assert (=> mapNonEmpty!29109 (= (arr!25302 (_values!5397 thiss!1181)) (store mapRest!29109 mapKey!29109 mapValue!29109))))

(declare-fun array_inv!19910 (array!52637) Bool)

(declare-fun array_inv!19911 (array!52639) Bool)

(assert (=> b!897325 (= e!501772 (and tp!56010 tp_is_empty!18313 (array_inv!19910 (_keys!10151 thiss!1181)) (array_inv!19911 (_values!5397 thiss!1181)) e!501770))))

(declare-fun b!897326 () Bool)

(assert (=> b!897326 (= e!501775 tp_is_empty!18313)))

(declare-fun b!897327 () Bool)

(assert (=> b!897327 (= e!501771 e!501768)))

(declare-fun res!606560 () Bool)

(assert (=> b!897327 (=> res!606560 e!501768)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897327 (= res!606560 (not (validMask!0 (mask!26084 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897327 (arrayContainsKey!0 (_keys!10151 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404989 () Unit!30448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52637 (_ BitVec 64) (_ BitVec 32)) Unit!30448)

(assert (=> b!897327 (= lt!404989 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10151 thiss!1181) key!785 (index!38028 lt!404990)))))

(declare-fun b!897328 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52637 (_ BitVec 32)) Bool)

(assert (=> b!897328 (= e!501768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(assert (= (and start!76644 res!606564) b!897320))

(assert (= (and b!897320 res!606563) b!897321))

(assert (= (and b!897321 (not res!606562)) b!897324))

(assert (= (and b!897321 (not res!606561)) b!897327))

(assert (= (and b!897327 (not res!606560)) b!897323))

(assert (= (and b!897323 (not res!606565)) b!897328))

(assert (= (and b!897319 condMapEmpty!29109) mapIsEmpty!29109))

(assert (= (and b!897319 (not condMapEmpty!29109)) mapNonEmpty!29109))

(assert (= (and mapNonEmpty!29109 ((_ is ValueCellFull!8675) mapValue!29109)) b!897326))

(assert (= (and b!897319 ((_ is ValueCellFull!8675) mapDefault!29109)) b!897322))

(assert (= b!897325 b!897319))

(assert (= start!76644 b!897325))

(declare-fun m!833539 () Bool)

(assert (=> b!897325 m!833539))

(declare-fun m!833541 () Bool)

(assert (=> b!897325 m!833541))

(declare-fun m!833543 () Bool)

(assert (=> b!897328 m!833543))

(declare-fun m!833545 () Bool)

(assert (=> mapNonEmpty!29109 m!833545))

(declare-fun m!833547 () Bool)

(assert (=> b!897324 m!833547))

(declare-fun m!833549 () Bool)

(assert (=> b!897321 m!833549))

(declare-fun m!833551 () Bool)

(assert (=> b!897321 m!833551))

(declare-fun m!833553 () Bool)

(assert (=> start!76644 m!833553))

(declare-fun m!833555 () Bool)

(assert (=> b!897327 m!833555))

(declare-fun m!833557 () Bool)

(assert (=> b!897327 m!833557))

(declare-fun m!833559 () Bool)

(assert (=> b!897327 m!833559))

(check-sat (not start!76644) tp_is_empty!18313 (not b!897321) (not b!897327) (not b!897328) (not b!897324) (not b_next!15985) (not mapNonEmpty!29109) b_and!26251 (not b!897325))
(check-sat b_and!26251 (not b_next!15985))
(get-model)

(declare-fun d!110919 () Bool)

(assert (=> d!110919 (= (array_inv!19910 (_keys!10151 thiss!1181)) (bvsge (size!25758 (_keys!10151 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897325 d!110919))

(declare-fun d!110921 () Bool)

(assert (=> d!110921 (= (array_inv!19911 (_values!5397 thiss!1181)) (bvsge (size!25759 (_values!5397 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897325 d!110921))

(declare-fun d!110923 () Bool)

(assert (=> d!110923 (= (validMask!0 (mask!26084 thiss!1181)) (and (or (= (mask!26084 thiss!1181) #b00000000000000000000000000000111) (= (mask!26084 thiss!1181) #b00000000000000000000000000001111) (= (mask!26084 thiss!1181) #b00000000000000000000000000011111) (= (mask!26084 thiss!1181) #b00000000000000000000000000111111) (= (mask!26084 thiss!1181) #b00000000000000000000000001111111) (= (mask!26084 thiss!1181) #b00000000000000000000000011111111) (= (mask!26084 thiss!1181) #b00000000000000000000000111111111) (= (mask!26084 thiss!1181) #b00000000000000000000001111111111) (= (mask!26084 thiss!1181) #b00000000000000000000011111111111) (= (mask!26084 thiss!1181) #b00000000000000000000111111111111) (= (mask!26084 thiss!1181) #b00000000000000000001111111111111) (= (mask!26084 thiss!1181) #b00000000000000000011111111111111) (= (mask!26084 thiss!1181) #b00000000000000000111111111111111) (= (mask!26084 thiss!1181) #b00000000000000001111111111111111) (= (mask!26084 thiss!1181) #b00000000000000011111111111111111) (= (mask!26084 thiss!1181) #b00000000000000111111111111111111) (= (mask!26084 thiss!1181) #b00000000000001111111111111111111) (= (mask!26084 thiss!1181) #b00000000000011111111111111111111) (= (mask!26084 thiss!1181) #b00000000000111111111111111111111) (= (mask!26084 thiss!1181) #b00000000001111111111111111111111) (= (mask!26084 thiss!1181) #b00000000011111111111111111111111) (= (mask!26084 thiss!1181) #b00000000111111111111111111111111) (= (mask!26084 thiss!1181) #b00000001111111111111111111111111) (= (mask!26084 thiss!1181) #b00000011111111111111111111111111) (= (mask!26084 thiss!1181) #b00000111111111111111111111111111) (= (mask!26084 thiss!1181) #b00001111111111111111111111111111) (= (mask!26084 thiss!1181) #b00011111111111111111111111111111) (= (mask!26084 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26084 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897327 d!110923))

(declare-fun d!110925 () Bool)

(declare-fun res!606606 () Bool)

(declare-fun e!501834 () Bool)

(assert (=> d!110925 (=> res!606606 e!501834)))

(assert (=> d!110925 (= res!606606 (= (select (arr!25301 (_keys!10151 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110925 (= (arrayContainsKey!0 (_keys!10151 thiss!1181) key!785 #b00000000000000000000000000000000) e!501834)))

(declare-fun b!897393 () Bool)

(declare-fun e!501835 () Bool)

(assert (=> b!897393 (= e!501834 e!501835)))

(declare-fun res!606607 () Bool)

(assert (=> b!897393 (=> (not res!606607) (not e!501835))))

(assert (=> b!897393 (= res!606607 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25758 (_keys!10151 thiss!1181))))))

(declare-fun b!897394 () Bool)

(assert (=> b!897394 (= e!501835 (arrayContainsKey!0 (_keys!10151 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110925 (not res!606606)) b!897393))

(assert (= (and b!897393 res!606607) b!897394))

(declare-fun m!833605 () Bool)

(assert (=> d!110925 m!833605))

(declare-fun m!833607 () Bool)

(assert (=> b!897394 m!833607))

(assert (=> b!897327 d!110925))

(declare-fun d!110927 () Bool)

(assert (=> d!110927 (arrayContainsKey!0 (_keys!10151 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405011 () Unit!30448)

(declare-fun choose!13 (array!52637 (_ BitVec 64) (_ BitVec 32)) Unit!30448)

(assert (=> d!110927 (= lt!405011 (choose!13 (_keys!10151 thiss!1181) key!785 (index!38028 lt!404990)))))

(assert (=> d!110927 (bvsge (index!38028 lt!404990) #b00000000000000000000000000000000)))

(assert (=> d!110927 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10151 thiss!1181) key!785 (index!38028 lt!404990)) lt!405011)))

(declare-fun bs!25161 () Bool)

(assert (= bs!25161 d!110927))

(assert (=> bs!25161 m!833557))

(declare-fun m!833609 () Bool)

(assert (=> bs!25161 m!833609))

(assert (=> b!897327 d!110927))

(declare-fun d!110929 () Bool)

(assert (=> d!110929 (= (inRange!0 (index!38028 lt!404990) (mask!26084 thiss!1181)) (and (bvsge (index!38028 lt!404990) #b00000000000000000000000000000000) (bvslt (index!38028 lt!404990) (bvadd (mask!26084 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897324 d!110929))

(declare-fun bm!39788 () Bool)

(declare-fun call!39791 () Bool)

(assert (=> bm!39788 (= call!39791 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(declare-fun b!897403 () Bool)

(declare-fun e!501844 () Bool)

(assert (=> b!897403 (= e!501844 call!39791)))

(declare-fun d!110931 () Bool)

(declare-fun res!606613 () Bool)

(declare-fun e!501842 () Bool)

(assert (=> d!110931 (=> res!606613 e!501842)))

(assert (=> d!110931 (= res!606613 (bvsge #b00000000000000000000000000000000 (size!25758 (_keys!10151 thiss!1181))))))

(assert (=> d!110931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)) e!501842)))

(declare-fun b!897404 () Bool)

(declare-fun e!501843 () Bool)

(assert (=> b!897404 (= e!501843 e!501844)))

(declare-fun lt!405018 () (_ BitVec 64))

(assert (=> b!897404 (= lt!405018 (select (arr!25301 (_keys!10151 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405019 () Unit!30448)

(assert (=> b!897404 (= lt!405019 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10151 thiss!1181) lt!405018 #b00000000000000000000000000000000))))

(assert (=> b!897404 (arrayContainsKey!0 (_keys!10151 thiss!1181) lt!405018 #b00000000000000000000000000000000)))

(declare-fun lt!405020 () Unit!30448)

(assert (=> b!897404 (= lt!405020 lt!405019)))

(declare-fun res!606612 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!897404 (= res!606612 (= (seekEntryOrOpen!0 (select (arr!25301 (_keys!10151 thiss!1181)) #b00000000000000000000000000000000) (_keys!10151 thiss!1181) (mask!26084 thiss!1181)) (Found!8914 #b00000000000000000000000000000000)))))

(assert (=> b!897404 (=> (not res!606612) (not e!501844))))

(declare-fun b!897405 () Bool)

(assert (=> b!897405 (= e!501843 call!39791)))

(declare-fun b!897406 () Bool)

(assert (=> b!897406 (= e!501842 e!501843)))

(declare-fun c!94794 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897406 (= c!94794 (validKeyInArray!0 (select (arr!25301 (_keys!10151 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110931 (not res!606613)) b!897406))

(assert (= (and b!897406 c!94794) b!897404))

(assert (= (and b!897406 (not c!94794)) b!897405))

(assert (= (and b!897404 res!606612) b!897403))

(assert (= (or b!897403 b!897405) bm!39788))

(declare-fun m!833611 () Bool)

(assert (=> bm!39788 m!833611))

(assert (=> b!897404 m!833605))

(declare-fun m!833613 () Bool)

(assert (=> b!897404 m!833613))

(declare-fun m!833615 () Bool)

(assert (=> b!897404 m!833615))

(assert (=> b!897404 m!833605))

(declare-fun m!833617 () Bool)

(assert (=> b!897404 m!833617))

(assert (=> b!897406 m!833605))

(assert (=> b!897406 m!833605))

(declare-fun m!833619 () Bool)

(assert (=> b!897406 m!833619))

(assert (=> b!897328 d!110931))

(declare-fun d!110933 () Bool)

(declare-fun e!501847 () Bool)

(assert (=> d!110933 e!501847))

(declare-fun res!606616 () Bool)

(assert (=> d!110933 (=> res!606616 e!501847)))

(declare-fun lt!405026 () SeekEntryResult!8914)

(assert (=> d!110933 (= res!606616 (not ((_ is Found!8914) lt!405026)))))

(assert (=> d!110933 (= lt!405026 (seekEntry!0 key!785 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(declare-fun lt!405025 () Unit!30448)

(declare-fun choose!1493 (array!52637 array!52639 (_ BitVec 32) (_ BitVec 32) V!29383 V!29383 (_ BitVec 64)) Unit!30448)

(assert (=> d!110933 (= lt!405025 (choose!1493 (_keys!10151 thiss!1181) (_values!5397 thiss!1181) (mask!26084 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785))))

(assert (=> d!110933 (validMask!0 (mask!26084 thiss!1181))))

(assert (=> d!110933 (= (lemmaSeekEntryGivesInRangeIndex!80 (_keys!10151 thiss!1181) (_values!5397 thiss!1181) (mask!26084 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785) lt!405025)))

(declare-fun b!897409 () Bool)

(assert (=> b!897409 (= e!501847 (inRange!0 (index!38028 lt!405026) (mask!26084 thiss!1181)))))

(assert (= (and d!110933 (not res!606616)) b!897409))

(assert (=> d!110933 m!833551))

(declare-fun m!833621 () Bool)

(assert (=> d!110933 m!833621))

(assert (=> d!110933 m!833555))

(declare-fun m!833623 () Bool)

(assert (=> b!897409 m!833623))

(assert (=> b!897321 d!110933))

(declare-fun b!897422 () Bool)

(declare-fun e!501856 () SeekEntryResult!8914)

(declare-fun lt!405037 () SeekEntryResult!8914)

(assert (=> b!897422 (= e!501856 (ite ((_ is MissingVacant!8914) lt!405037) (MissingZero!8914 (index!38030 lt!405037)) lt!405037))))

(declare-fun lt!405036 () SeekEntryResult!8914)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!897422 (= lt!405037 (seekKeyOrZeroReturnVacant!0 (x!76474 lt!405036) (index!38029 lt!405036) (index!38029 lt!405036) key!785 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(declare-fun b!897423 () Bool)

(declare-fun e!501854 () SeekEntryResult!8914)

(declare-fun e!501855 () SeekEntryResult!8914)

(assert (=> b!897423 (= e!501854 e!501855)))

(declare-fun lt!405038 () (_ BitVec 64))

(assert (=> b!897423 (= lt!405038 (select (arr!25301 (_keys!10151 thiss!1181)) (index!38029 lt!405036)))))

(declare-fun c!94801 () Bool)

(assert (=> b!897423 (= c!94801 (= lt!405038 key!785))))

(declare-fun b!897424 () Bool)

(assert (=> b!897424 (= e!501854 Undefined!8914)))

(declare-fun b!897425 () Bool)

(declare-fun c!94803 () Bool)

(assert (=> b!897425 (= c!94803 (= lt!405038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897425 (= e!501855 e!501856)))

(declare-fun b!897426 () Bool)

(assert (=> b!897426 (= e!501856 (MissingZero!8914 (index!38029 lt!405036)))))

(declare-fun b!897427 () Bool)

(assert (=> b!897427 (= e!501855 (Found!8914 (index!38029 lt!405036)))))

(declare-fun d!110935 () Bool)

(declare-fun lt!405035 () SeekEntryResult!8914)

(assert (=> d!110935 (and (or ((_ is MissingVacant!8914) lt!405035) (not ((_ is Found!8914) lt!405035)) (and (bvsge (index!38028 lt!405035) #b00000000000000000000000000000000) (bvslt (index!38028 lt!405035) (size!25758 (_keys!10151 thiss!1181))))) (not ((_ is MissingVacant!8914) lt!405035)) (or (not ((_ is Found!8914) lt!405035)) (= (select (arr!25301 (_keys!10151 thiss!1181)) (index!38028 lt!405035)) key!785)))))

(assert (=> d!110935 (= lt!405035 e!501854)))

(declare-fun c!94802 () Bool)

(assert (=> d!110935 (= c!94802 (and ((_ is Intermediate!8914) lt!405036) (undefined!9726 lt!405036)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52637 (_ BitVec 32)) SeekEntryResult!8914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110935 (= lt!405036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26084 thiss!1181)) key!785 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(assert (=> d!110935 (validMask!0 (mask!26084 thiss!1181))))

(assert (=> d!110935 (= (seekEntry!0 key!785 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)) lt!405035)))

(assert (= (and d!110935 c!94802) b!897424))

(assert (= (and d!110935 (not c!94802)) b!897423))

(assert (= (and b!897423 c!94801) b!897427))

(assert (= (and b!897423 (not c!94801)) b!897425))

(assert (= (and b!897425 c!94803) b!897426))

(assert (= (and b!897425 (not c!94803)) b!897422))

(declare-fun m!833625 () Bool)

(assert (=> b!897422 m!833625))

(declare-fun m!833627 () Bool)

(assert (=> b!897423 m!833627))

(declare-fun m!833629 () Bool)

(assert (=> d!110935 m!833629))

(declare-fun m!833631 () Bool)

(assert (=> d!110935 m!833631))

(assert (=> d!110935 m!833631))

(declare-fun m!833633 () Bool)

(assert (=> d!110935 m!833633))

(assert (=> d!110935 m!833555))

(assert (=> b!897321 d!110935))

(declare-fun d!110937 () Bool)

(declare-fun res!606623 () Bool)

(declare-fun e!501859 () Bool)

(assert (=> d!110937 (=> (not res!606623) (not e!501859))))

(declare-fun simpleValid!319 (LongMapFixedSize!4366) Bool)

(assert (=> d!110937 (= res!606623 (simpleValid!319 thiss!1181))))

(assert (=> d!110937 (= (valid!1689 thiss!1181) e!501859)))

(declare-fun b!897434 () Bool)

(declare-fun res!606624 () Bool)

(assert (=> b!897434 (=> (not res!606624) (not e!501859))))

(declare-fun arrayCountValidKeys!0 (array!52637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897434 (= res!606624 (= (arrayCountValidKeys!0 (_keys!10151 thiss!1181) #b00000000000000000000000000000000 (size!25758 (_keys!10151 thiss!1181))) (_size!2238 thiss!1181)))))

(declare-fun b!897435 () Bool)

(declare-fun res!606625 () Bool)

(assert (=> b!897435 (=> (not res!606625) (not e!501859))))

(assert (=> b!897435 (= res!606625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10151 thiss!1181) (mask!26084 thiss!1181)))))

(declare-fun b!897436 () Bool)

(declare-datatypes ((List!17837 0))(
  ( (Nil!17834) (Cons!17833 (h!18975 (_ BitVec 64)) (t!25167 List!17837)) )
))
(declare-fun arrayNoDuplicates!0 (array!52637 (_ BitVec 32) List!17837) Bool)

(assert (=> b!897436 (= e!501859 (arrayNoDuplicates!0 (_keys!10151 thiss!1181) #b00000000000000000000000000000000 Nil!17834))))

(assert (= (and d!110937 res!606623) b!897434))

(assert (= (and b!897434 res!606624) b!897435))

(assert (= (and b!897435 res!606625) b!897436))

(declare-fun m!833635 () Bool)

(assert (=> d!110937 m!833635))

(declare-fun m!833637 () Bool)

(assert (=> b!897434 m!833637))

(assert (=> b!897435 m!833543))

(declare-fun m!833639 () Bool)

(assert (=> b!897436 m!833639))

(assert (=> start!76644 d!110937))

(declare-fun b!897443 () Bool)

(declare-fun e!501865 () Bool)

(assert (=> b!897443 (= e!501865 tp_is_empty!18313)))

(declare-fun mapNonEmpty!29118 () Bool)

(declare-fun mapRes!29118 () Bool)

(declare-fun tp!56025 () Bool)

(assert (=> mapNonEmpty!29118 (= mapRes!29118 (and tp!56025 e!501865))))

(declare-fun mapRest!29118 () (Array (_ BitVec 32) ValueCell!8675))

(declare-fun mapValue!29118 () ValueCell!8675)

(declare-fun mapKey!29118 () (_ BitVec 32))

(assert (=> mapNonEmpty!29118 (= mapRest!29109 (store mapRest!29118 mapKey!29118 mapValue!29118))))

(declare-fun b!897444 () Bool)

(declare-fun e!501864 () Bool)

(assert (=> b!897444 (= e!501864 tp_is_empty!18313)))

(declare-fun mapIsEmpty!29118 () Bool)

(assert (=> mapIsEmpty!29118 mapRes!29118))

(declare-fun condMapEmpty!29118 () Bool)

(declare-fun mapDefault!29118 () ValueCell!8675)

(assert (=> mapNonEmpty!29109 (= condMapEmpty!29118 (= mapRest!29109 ((as const (Array (_ BitVec 32) ValueCell!8675)) mapDefault!29118)))))

(assert (=> mapNonEmpty!29109 (= tp!56009 (and e!501864 mapRes!29118))))

(assert (= (and mapNonEmpty!29109 condMapEmpty!29118) mapIsEmpty!29118))

(assert (= (and mapNonEmpty!29109 (not condMapEmpty!29118)) mapNonEmpty!29118))

(assert (= (and mapNonEmpty!29118 ((_ is ValueCellFull!8675) mapValue!29118)) b!897443))

(assert (= (and mapNonEmpty!29109 ((_ is ValueCellFull!8675) mapDefault!29118)) b!897444))

(declare-fun m!833641 () Bool)

(assert (=> mapNonEmpty!29118 m!833641))

(check-sat (not d!110927) (not b!897435) (not b!897406) tp_is_empty!18313 (not b!897394) (not b!897434) (not b!897422) (not b_next!15985) (not b!897404) b_and!26251 (not bm!39788) (not d!110937) (not d!110935) (not b!897436) (not b!897409) (not d!110933) (not mapNonEmpty!29118))
(check-sat b_and!26251 (not b_next!15985))
