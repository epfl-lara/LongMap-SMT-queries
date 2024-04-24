; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76830 () Bool)

(assert start!76830)

(declare-fun b!898465 () Bool)

(declare-fun b_free!15985 () Bool)

(declare-fun b_next!15985 () Bool)

(assert (=> b!898465 (= b_free!15985 (not b_next!15985))))

(declare-fun tp!56010 () Bool)

(declare-fun b_and!26287 () Bool)

(assert (=> b!898465 (= tp!56010 b_and!26287)))

(declare-fun mapNonEmpty!29109 () Bool)

(declare-fun mapRes!29109 () Bool)

(declare-fun tp!56009 () Bool)

(declare-fun e!502499 () Bool)

(assert (=> mapNonEmpty!29109 (= mapRes!29109 (and tp!56009 e!502499))))

(declare-datatypes ((V!29383 0))(
  ( (V!29384 (val!9207 Int)) )
))
(declare-datatypes ((ValueCell!8675 0))(
  ( (ValueCellFull!8675 (v!11694 V!29383)) (EmptyCell!8675) )
))
(declare-fun mapValue!29109 () ValueCell!8675)

(declare-datatypes ((array!52693 0))(
  ( (array!52694 (arr!25324 (Array (_ BitVec 32) (_ BitVec 64))) (size!25780 (_ BitVec 32))) )
))
(declare-datatypes ((array!52695 0))(
  ( (array!52696 (arr!25325 (Array (_ BitVec 32) ValueCell!8675)) (size!25781 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4366 0))(
  ( (LongMapFixedSize!4367 (defaultEntry!5395 Int) (mask!26134 (_ BitVec 32)) (extraKeys!5106 (_ BitVec 32)) (zeroValue!5210 V!29383) (minValue!5210 V!29383) (_size!2238 (_ BitVec 32)) (_keys!10184 array!52693) (_values!5397 array!52695) (_vacant!2238 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4366)

(declare-fun mapKey!29109 () (_ BitVec 32))

(declare-fun mapRest!29109 () (Array (_ BitVec 32) ValueCell!8675))

(assert (=> mapNonEmpty!29109 (= (arr!25325 (_values!5397 thiss!1181)) (store mapRest!29109 mapKey!29109 mapValue!29109))))

(declare-fun b!898461 () Bool)

(declare-fun res!607015 () Bool)

(declare-fun e!502497 () Bool)

(assert (=> b!898461 (=> (not res!607015) (not e!502497))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898461 (= res!607015 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898462 () Bool)

(declare-fun res!607016 () Bool)

(declare-fun e!502503 () Bool)

(assert (=> b!898462 (=> res!607016 e!502503)))

(assert (=> b!898462 (= res!607016 (or (not (= (size!25781 (_values!5397 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26134 thiss!1181)))) (not (= (size!25780 (_keys!10184 thiss!1181)) (size!25781 (_values!5397 thiss!1181)))) (bvslt (mask!26134 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5106 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5106 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29109 () Bool)

(assert (=> mapIsEmpty!29109 mapRes!29109))

(declare-fun b!898463 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52693 (_ BitVec 32)) Bool)

(assert (=> b!898463 (= e!502503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(declare-fun res!607018 () Bool)

(assert (=> start!76830 (=> (not res!607018) (not e!502497))))

(declare-fun valid!1692 (LongMapFixedSize!4366) Bool)

(assert (=> start!76830 (= res!607018 (valid!1692 thiss!1181))))

(assert (=> start!76830 e!502497))

(declare-fun e!502500 () Bool)

(assert (=> start!76830 e!502500))

(assert (=> start!76830 true))

(declare-fun b!898464 () Bool)

(declare-fun tp_is_empty!18313 () Bool)

(assert (=> b!898464 (= e!502499 tp_is_empty!18313)))

(declare-fun e!502501 () Bool)

(declare-fun array_inv!19932 (array!52693) Bool)

(declare-fun array_inv!19933 (array!52695) Bool)

(assert (=> b!898465 (= e!502500 (and tp!56010 tp_is_empty!18313 (array_inv!19932 (_keys!10184 thiss!1181)) (array_inv!19933 (_values!5397 thiss!1181)) e!502501))))

(declare-fun b!898466 () Bool)

(declare-fun e!502504 () Bool)

(declare-datatypes ((SeekEntryResult!8864 0))(
  ( (MissingZero!8864 (index!37827 (_ BitVec 32))) (Found!8864 (index!37828 (_ BitVec 32))) (Intermediate!8864 (undefined!9676 Bool) (index!37829 (_ BitVec 32)) (x!76443 (_ BitVec 32))) (Undefined!8864) (MissingVacant!8864 (index!37830 (_ BitVec 32))) )
))
(declare-fun lt!405585 () SeekEntryResult!8864)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898466 (= e!502504 (inRange!0 (index!37828 lt!405585) (mask!26134 thiss!1181)))))

(declare-fun b!898467 () Bool)

(declare-fun e!502498 () Bool)

(assert (=> b!898467 (= e!502497 (not e!502498))))

(declare-fun res!607014 () Bool)

(assert (=> b!898467 (=> res!607014 e!502498)))

(get-info :version)

(assert (=> b!898467 (= res!607014 (not ((_ is Found!8864) lt!405585)))))

(assert (=> b!898467 e!502504))

(declare-fun res!607019 () Bool)

(assert (=> b!898467 (=> res!607019 e!502504)))

(assert (=> b!898467 (= res!607019 (not ((_ is Found!8864) lt!405585)))))

(declare-datatypes ((Unit!30498 0))(
  ( (Unit!30499) )
))
(declare-fun lt!405586 () Unit!30498)

(declare-fun lemmaSeekEntryGivesInRangeIndex!88 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29383 V!29383 (_ BitVec 64)) Unit!30498)

(assert (=> b!898467 (= lt!405586 (lemmaSeekEntryGivesInRangeIndex!88 (_keys!10184 thiss!1181) (_values!5397 thiss!1181) (mask!26134 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!898467 (= lt!405585 (seekEntry!0 key!785 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(declare-fun b!898468 () Bool)

(declare-fun e!502505 () Bool)

(assert (=> b!898468 (= e!502501 (and e!502505 mapRes!29109))))

(declare-fun condMapEmpty!29109 () Bool)

(declare-fun mapDefault!29109 () ValueCell!8675)

(assert (=> b!898468 (= condMapEmpty!29109 (= (arr!25325 (_values!5397 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8675)) mapDefault!29109)))))

(declare-fun b!898469 () Bool)

(assert (=> b!898469 (= e!502498 e!502503)))

(declare-fun res!607017 () Bool)

(assert (=> b!898469 (=> res!607017 e!502503)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898469 (= res!607017 (not (validMask!0 (mask!26134 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898469 (arrayContainsKey!0 (_keys!10184 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405587 () Unit!30498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52693 (_ BitVec 64) (_ BitVec 32)) Unit!30498)

(assert (=> b!898469 (= lt!405587 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10184 thiss!1181) key!785 (index!37828 lt!405585)))))

(declare-fun b!898470 () Bool)

(assert (=> b!898470 (= e!502505 tp_is_empty!18313)))

(assert (= (and start!76830 res!607018) b!898461))

(assert (= (and b!898461 res!607015) b!898467))

(assert (= (and b!898467 (not res!607019)) b!898466))

(assert (= (and b!898467 (not res!607014)) b!898469))

(assert (= (and b!898469 (not res!607017)) b!898462))

(assert (= (and b!898462 (not res!607016)) b!898463))

(assert (= (and b!898468 condMapEmpty!29109) mapIsEmpty!29109))

(assert (= (and b!898468 (not condMapEmpty!29109)) mapNonEmpty!29109))

(assert (= (and mapNonEmpty!29109 ((_ is ValueCellFull!8675) mapValue!29109)) b!898464))

(assert (= (and b!898468 ((_ is ValueCellFull!8675) mapDefault!29109)) b!898470))

(assert (= b!898465 b!898468))

(assert (= start!76830 b!898465))

(declare-fun m!835591 () Bool)

(assert (=> b!898467 m!835591))

(declare-fun m!835593 () Bool)

(assert (=> b!898467 m!835593))

(declare-fun m!835595 () Bool)

(assert (=> b!898466 m!835595))

(declare-fun m!835597 () Bool)

(assert (=> mapNonEmpty!29109 m!835597))

(declare-fun m!835599 () Bool)

(assert (=> b!898465 m!835599))

(declare-fun m!835601 () Bool)

(assert (=> b!898465 m!835601))

(declare-fun m!835603 () Bool)

(assert (=> b!898463 m!835603))

(declare-fun m!835605 () Bool)

(assert (=> start!76830 m!835605))

(declare-fun m!835607 () Bool)

(assert (=> b!898469 m!835607))

(declare-fun m!835609 () Bool)

(assert (=> b!898469 m!835609))

(declare-fun m!835611 () Bool)

(assert (=> b!898469 m!835611))

(check-sat (not b!898467) (not b_next!15985) tp_is_empty!18313 (not mapNonEmpty!29109) (not b!898466) (not b!898465) b_and!26287 (not b!898469) (not start!76830) (not b!898463))
(check-sat b_and!26287 (not b_next!15985))
(get-model)

(declare-fun d!111439 () Bool)

(declare-fun res!607061 () Bool)

(declare-fun e!502566 () Bool)

(assert (=> d!111439 (=> res!607061 e!502566)))

(assert (=> d!111439 (= res!607061 (bvsge #b00000000000000000000000000000000 (size!25780 (_keys!10184 thiss!1181))))))

(assert (=> d!111439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)) e!502566)))

(declare-fun b!898539 () Bool)

(declare-fun e!502568 () Bool)

(declare-fun call!39862 () Bool)

(assert (=> b!898539 (= e!502568 call!39862)))

(declare-fun b!898540 () Bool)

(declare-fun e!502567 () Bool)

(assert (=> b!898540 (= e!502566 e!502567)))

(declare-fun c!95141 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898540 (= c!95141 (validKeyInArray!0 (select (arr!25324 (_keys!10184 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39859 () Bool)

(assert (=> bm!39859 (= call!39862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(declare-fun b!898541 () Bool)

(assert (=> b!898541 (= e!502567 e!502568)))

(declare-fun lt!405613 () (_ BitVec 64))

(assert (=> b!898541 (= lt!405613 (select (arr!25324 (_keys!10184 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405612 () Unit!30498)

(assert (=> b!898541 (= lt!405612 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10184 thiss!1181) lt!405613 #b00000000000000000000000000000000))))

(assert (=> b!898541 (arrayContainsKey!0 (_keys!10184 thiss!1181) lt!405613 #b00000000000000000000000000000000)))

(declare-fun lt!405614 () Unit!30498)

(assert (=> b!898541 (= lt!405614 lt!405612)))

(declare-fun res!607060 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!898541 (= res!607060 (= (seekEntryOrOpen!0 (select (arr!25324 (_keys!10184 thiss!1181)) #b00000000000000000000000000000000) (_keys!10184 thiss!1181) (mask!26134 thiss!1181)) (Found!8864 #b00000000000000000000000000000000)))))

(assert (=> b!898541 (=> (not res!607060) (not e!502568))))

(declare-fun b!898542 () Bool)

(assert (=> b!898542 (= e!502567 call!39862)))

(assert (= (and d!111439 (not res!607061)) b!898540))

(assert (= (and b!898540 c!95141) b!898541))

(assert (= (and b!898540 (not c!95141)) b!898542))

(assert (= (and b!898541 res!607060) b!898539))

(assert (= (or b!898539 b!898542) bm!39859))

(declare-fun m!835657 () Bool)

(assert (=> b!898540 m!835657))

(assert (=> b!898540 m!835657))

(declare-fun m!835659 () Bool)

(assert (=> b!898540 m!835659))

(declare-fun m!835661 () Bool)

(assert (=> bm!39859 m!835661))

(assert (=> b!898541 m!835657))

(declare-fun m!835663 () Bool)

(assert (=> b!898541 m!835663))

(declare-fun m!835665 () Bool)

(assert (=> b!898541 m!835665))

(assert (=> b!898541 m!835657))

(declare-fun m!835667 () Bool)

(assert (=> b!898541 m!835667))

(assert (=> b!898463 d!111439))

(declare-fun d!111441 () Bool)

(assert (=> d!111441 (= (validMask!0 (mask!26134 thiss!1181)) (and (or (= (mask!26134 thiss!1181) #b00000000000000000000000000000111) (= (mask!26134 thiss!1181) #b00000000000000000000000000001111) (= (mask!26134 thiss!1181) #b00000000000000000000000000011111) (= (mask!26134 thiss!1181) #b00000000000000000000000000111111) (= (mask!26134 thiss!1181) #b00000000000000000000000001111111) (= (mask!26134 thiss!1181) #b00000000000000000000000011111111) (= (mask!26134 thiss!1181) #b00000000000000000000000111111111) (= (mask!26134 thiss!1181) #b00000000000000000000001111111111) (= (mask!26134 thiss!1181) #b00000000000000000000011111111111) (= (mask!26134 thiss!1181) #b00000000000000000000111111111111) (= (mask!26134 thiss!1181) #b00000000000000000001111111111111) (= (mask!26134 thiss!1181) #b00000000000000000011111111111111) (= (mask!26134 thiss!1181) #b00000000000000000111111111111111) (= (mask!26134 thiss!1181) #b00000000000000001111111111111111) (= (mask!26134 thiss!1181) #b00000000000000011111111111111111) (= (mask!26134 thiss!1181) #b00000000000000111111111111111111) (= (mask!26134 thiss!1181) #b00000000000001111111111111111111) (= (mask!26134 thiss!1181) #b00000000000011111111111111111111) (= (mask!26134 thiss!1181) #b00000000000111111111111111111111) (= (mask!26134 thiss!1181) #b00000000001111111111111111111111) (= (mask!26134 thiss!1181) #b00000000011111111111111111111111) (= (mask!26134 thiss!1181) #b00000000111111111111111111111111) (= (mask!26134 thiss!1181) #b00000001111111111111111111111111) (= (mask!26134 thiss!1181) #b00000011111111111111111111111111) (= (mask!26134 thiss!1181) #b00000111111111111111111111111111) (= (mask!26134 thiss!1181) #b00001111111111111111111111111111) (= (mask!26134 thiss!1181) #b00011111111111111111111111111111) (= (mask!26134 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26134 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898469 d!111441))

(declare-fun d!111443 () Bool)

(declare-fun res!607066 () Bool)

(declare-fun e!502573 () Bool)

(assert (=> d!111443 (=> res!607066 e!502573)))

(assert (=> d!111443 (= res!607066 (= (select (arr!25324 (_keys!10184 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111443 (= (arrayContainsKey!0 (_keys!10184 thiss!1181) key!785 #b00000000000000000000000000000000) e!502573)))

(declare-fun b!898547 () Bool)

(declare-fun e!502574 () Bool)

(assert (=> b!898547 (= e!502573 e!502574)))

(declare-fun res!607067 () Bool)

(assert (=> b!898547 (=> (not res!607067) (not e!502574))))

(assert (=> b!898547 (= res!607067 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25780 (_keys!10184 thiss!1181))))))

(declare-fun b!898548 () Bool)

(assert (=> b!898548 (= e!502574 (arrayContainsKey!0 (_keys!10184 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111443 (not res!607066)) b!898547))

(assert (= (and b!898547 res!607067) b!898548))

(assert (=> d!111443 m!835657))

(declare-fun m!835669 () Bool)

(assert (=> b!898548 m!835669))

(assert (=> b!898469 d!111443))

(declare-fun d!111445 () Bool)

(assert (=> d!111445 (arrayContainsKey!0 (_keys!10184 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405617 () Unit!30498)

(declare-fun choose!13 (array!52693 (_ BitVec 64) (_ BitVec 32)) Unit!30498)

(assert (=> d!111445 (= lt!405617 (choose!13 (_keys!10184 thiss!1181) key!785 (index!37828 lt!405585)))))

(assert (=> d!111445 (bvsge (index!37828 lt!405585) #b00000000000000000000000000000000)))

(assert (=> d!111445 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10184 thiss!1181) key!785 (index!37828 lt!405585)) lt!405617)))

(declare-fun bs!25207 () Bool)

(assert (= bs!25207 d!111445))

(assert (=> bs!25207 m!835609))

(declare-fun m!835671 () Bool)

(assert (=> bs!25207 m!835671))

(assert (=> b!898469 d!111445))

(declare-fun d!111447 () Bool)

(declare-fun e!502577 () Bool)

(assert (=> d!111447 e!502577))

(declare-fun res!607070 () Bool)

(assert (=> d!111447 (=> res!607070 e!502577)))

(declare-fun lt!405623 () SeekEntryResult!8864)

(assert (=> d!111447 (= res!607070 (not ((_ is Found!8864) lt!405623)))))

(assert (=> d!111447 (= lt!405623 (seekEntry!0 key!785 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(declare-fun lt!405622 () Unit!30498)

(declare-fun choose!1490 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29383 V!29383 (_ BitVec 64)) Unit!30498)

(assert (=> d!111447 (= lt!405622 (choose!1490 (_keys!10184 thiss!1181) (_values!5397 thiss!1181) (mask!26134 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785))))

(assert (=> d!111447 (validMask!0 (mask!26134 thiss!1181))))

(assert (=> d!111447 (= (lemmaSeekEntryGivesInRangeIndex!88 (_keys!10184 thiss!1181) (_values!5397 thiss!1181) (mask!26134 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785) lt!405622)))

(declare-fun b!898551 () Bool)

(assert (=> b!898551 (= e!502577 (inRange!0 (index!37828 lt!405623) (mask!26134 thiss!1181)))))

(assert (= (and d!111447 (not res!607070)) b!898551))

(assert (=> d!111447 m!835593))

(declare-fun m!835673 () Bool)

(assert (=> d!111447 m!835673))

(assert (=> d!111447 m!835607))

(declare-fun m!835675 () Bool)

(assert (=> b!898551 m!835675))

(assert (=> b!898467 d!111447))

(declare-fun b!898564 () Bool)

(declare-fun c!95149 () Bool)

(declare-fun lt!405634 () (_ BitVec 64))

(assert (=> b!898564 (= c!95149 (= lt!405634 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502585 () SeekEntryResult!8864)

(declare-fun e!502584 () SeekEntryResult!8864)

(assert (=> b!898564 (= e!502585 e!502584)))

(declare-fun b!898565 () Bool)

(declare-fun lt!405635 () SeekEntryResult!8864)

(assert (=> b!898565 (= e!502584 (ite ((_ is MissingVacant!8864) lt!405635) (MissingZero!8864 (index!37830 lt!405635)) lt!405635))))

(declare-fun lt!405633 () SeekEntryResult!8864)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!898565 (= lt!405635 (seekKeyOrZeroReturnVacant!0 (x!76443 lt!405633) (index!37829 lt!405633) (index!37829 lt!405633) key!785 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(declare-fun b!898566 () Bool)

(declare-fun e!502586 () SeekEntryResult!8864)

(assert (=> b!898566 (= e!502586 e!502585)))

(assert (=> b!898566 (= lt!405634 (select (arr!25324 (_keys!10184 thiss!1181)) (index!37829 lt!405633)))))

(declare-fun c!95150 () Bool)

(assert (=> b!898566 (= c!95150 (= lt!405634 key!785))))

(declare-fun b!898567 () Bool)

(assert (=> b!898567 (= e!502586 Undefined!8864)))

(declare-fun b!898568 () Bool)

(assert (=> b!898568 (= e!502584 (MissingZero!8864 (index!37829 lt!405633)))))

(declare-fun b!898569 () Bool)

(assert (=> b!898569 (= e!502585 (Found!8864 (index!37829 lt!405633)))))

(declare-fun d!111449 () Bool)

(declare-fun lt!405632 () SeekEntryResult!8864)

(assert (=> d!111449 (and (or ((_ is MissingVacant!8864) lt!405632) (not ((_ is Found!8864) lt!405632)) (and (bvsge (index!37828 lt!405632) #b00000000000000000000000000000000) (bvslt (index!37828 lt!405632) (size!25780 (_keys!10184 thiss!1181))))) (not ((_ is MissingVacant!8864) lt!405632)) (or (not ((_ is Found!8864) lt!405632)) (= (select (arr!25324 (_keys!10184 thiss!1181)) (index!37828 lt!405632)) key!785)))))

(assert (=> d!111449 (= lt!405632 e!502586)))

(declare-fun c!95148 () Bool)

(assert (=> d!111449 (= c!95148 (and ((_ is Intermediate!8864) lt!405633) (undefined!9676 lt!405633)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111449 (= lt!405633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26134 thiss!1181)) key!785 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(assert (=> d!111449 (validMask!0 (mask!26134 thiss!1181))))

(assert (=> d!111449 (= (seekEntry!0 key!785 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)) lt!405632)))

(assert (= (and d!111449 c!95148) b!898567))

(assert (= (and d!111449 (not c!95148)) b!898566))

(assert (= (and b!898566 c!95150) b!898569))

(assert (= (and b!898566 (not c!95150)) b!898564))

(assert (= (and b!898564 c!95149) b!898568))

(assert (= (and b!898564 (not c!95149)) b!898565))

(declare-fun m!835677 () Bool)

(assert (=> b!898565 m!835677))

(declare-fun m!835679 () Bool)

(assert (=> b!898566 m!835679))

(declare-fun m!835681 () Bool)

(assert (=> d!111449 m!835681))

(declare-fun m!835683 () Bool)

(assert (=> d!111449 m!835683))

(assert (=> d!111449 m!835683))

(declare-fun m!835685 () Bool)

(assert (=> d!111449 m!835685))

(assert (=> d!111449 m!835607))

(assert (=> b!898467 d!111449))

(declare-fun d!111451 () Bool)

(assert (=> d!111451 (= (inRange!0 (index!37828 lt!405585) (mask!26134 thiss!1181)) (and (bvsge (index!37828 lt!405585) #b00000000000000000000000000000000) (bvslt (index!37828 lt!405585) (bvadd (mask!26134 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898466 d!111451))

(declare-fun d!111453 () Bool)

(declare-fun res!607077 () Bool)

(declare-fun e!502589 () Bool)

(assert (=> d!111453 (=> (not res!607077) (not e!502589))))

(declare-fun simpleValid!319 (LongMapFixedSize!4366) Bool)

(assert (=> d!111453 (= res!607077 (simpleValid!319 thiss!1181))))

(assert (=> d!111453 (= (valid!1692 thiss!1181) e!502589)))

(declare-fun b!898576 () Bool)

(declare-fun res!607078 () Bool)

(assert (=> b!898576 (=> (not res!607078) (not e!502589))))

(declare-fun arrayCountValidKeys!0 (array!52693 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898576 (= res!607078 (= (arrayCountValidKeys!0 (_keys!10184 thiss!1181) #b00000000000000000000000000000000 (size!25780 (_keys!10184 thiss!1181))) (_size!2238 thiss!1181)))))

(declare-fun b!898577 () Bool)

(declare-fun res!607079 () Bool)

(assert (=> b!898577 (=> (not res!607079) (not e!502589))))

(assert (=> b!898577 (= res!607079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10184 thiss!1181) (mask!26134 thiss!1181)))))

(declare-fun b!898578 () Bool)

(declare-datatypes ((List!17779 0))(
  ( (Nil!17776) (Cons!17775 (h!18923 (_ BitVec 64)) (t!25110 List!17779)) )
))
(declare-fun arrayNoDuplicates!0 (array!52693 (_ BitVec 32) List!17779) Bool)

(assert (=> b!898578 (= e!502589 (arrayNoDuplicates!0 (_keys!10184 thiss!1181) #b00000000000000000000000000000000 Nil!17776))))

(assert (= (and d!111453 res!607077) b!898576))

(assert (= (and b!898576 res!607078) b!898577))

(assert (= (and b!898577 res!607079) b!898578))

(declare-fun m!835687 () Bool)

(assert (=> d!111453 m!835687))

(declare-fun m!835689 () Bool)

(assert (=> b!898576 m!835689))

(assert (=> b!898577 m!835603))

(declare-fun m!835691 () Bool)

(assert (=> b!898578 m!835691))

(assert (=> start!76830 d!111453))

(declare-fun d!111455 () Bool)

(assert (=> d!111455 (= (array_inv!19932 (_keys!10184 thiss!1181)) (bvsge (size!25780 (_keys!10184 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898465 d!111455))

(declare-fun d!111457 () Bool)

(assert (=> d!111457 (= (array_inv!19933 (_values!5397 thiss!1181)) (bvsge (size!25781 (_values!5397 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898465 d!111457))

(declare-fun b!898585 () Bool)

(declare-fun e!502595 () Bool)

(assert (=> b!898585 (= e!502595 tp_is_empty!18313)))

(declare-fun mapIsEmpty!29118 () Bool)

(declare-fun mapRes!29118 () Bool)

(assert (=> mapIsEmpty!29118 mapRes!29118))

(declare-fun b!898586 () Bool)

(declare-fun e!502594 () Bool)

(assert (=> b!898586 (= e!502594 tp_is_empty!18313)))

(declare-fun condMapEmpty!29118 () Bool)

(declare-fun mapDefault!29118 () ValueCell!8675)

(assert (=> mapNonEmpty!29109 (= condMapEmpty!29118 (= mapRest!29109 ((as const (Array (_ BitVec 32) ValueCell!8675)) mapDefault!29118)))))

(assert (=> mapNonEmpty!29109 (= tp!56009 (and e!502594 mapRes!29118))))

(declare-fun mapNonEmpty!29118 () Bool)

(declare-fun tp!56025 () Bool)

(assert (=> mapNonEmpty!29118 (= mapRes!29118 (and tp!56025 e!502595))))

(declare-fun mapValue!29118 () ValueCell!8675)

(declare-fun mapRest!29118 () (Array (_ BitVec 32) ValueCell!8675))

(declare-fun mapKey!29118 () (_ BitVec 32))

(assert (=> mapNonEmpty!29118 (= mapRest!29109 (store mapRest!29118 mapKey!29118 mapValue!29118))))

(assert (= (and mapNonEmpty!29109 condMapEmpty!29118) mapIsEmpty!29118))

(assert (= (and mapNonEmpty!29109 (not condMapEmpty!29118)) mapNonEmpty!29118))

(assert (= (and mapNonEmpty!29118 ((_ is ValueCellFull!8675) mapValue!29118)) b!898585))

(assert (= (and mapNonEmpty!29109 ((_ is ValueCellFull!8675) mapDefault!29118)) b!898586))

(declare-fun m!835693 () Bool)

(assert (=> mapNonEmpty!29118 m!835693))

(check-sat (not bm!39859) (not d!111445) (not d!111447) (not mapNonEmpty!29118) (not d!111453) (not b!898540) (not b!898551) (not b!898578) b_and!26287 (not d!111449) (not b!898565) (not b!898541) (not b_next!15985) (not b!898548) tp_is_empty!18313 (not b!898576) (not b!898577))
(check-sat b_and!26287 (not b_next!15985))
