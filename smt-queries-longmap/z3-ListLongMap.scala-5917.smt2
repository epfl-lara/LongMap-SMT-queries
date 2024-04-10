; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76746 () Bool)

(assert start!76746)

(declare-fun b!898109 () Bool)

(declare-fun b_free!16005 () Bool)

(declare-fun b_next!16005 () Bool)

(assert (=> b!898109 (= b_free!16005 (not b_next!16005))))

(declare-fun tp!56077 () Bool)

(declare-fun b_and!26297 () Bool)

(assert (=> b!898109 (= tp!56077 b_and!26297)))

(declare-fun b!898098 () Bool)

(declare-fun res!606987 () Bool)

(declare-fun e!502317 () Bool)

(assert (=> b!898098 (=> res!606987 e!502317)))

(declare-datatypes ((array!52700 0))(
  ( (array!52701 (arr!25329 (Array (_ BitVec 32) (_ BitVec 64))) (size!25784 (_ BitVec 32))) )
))
(declare-datatypes ((V!29409 0))(
  ( (V!29410 (val!9217 Int)) )
))
(declare-datatypes ((ValueCell!8685 0))(
  ( (ValueCellFull!8685 (v!11707 V!29409)) (EmptyCell!8685) )
))
(declare-datatypes ((array!52702 0))(
  ( (array!52703 (arr!25330 (Array (_ BitVec 32) ValueCell!8685)) (size!25785 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4386 0))(
  ( (LongMapFixedSize!4387 (defaultEntry!5405 Int) (mask!26122 (_ BitVec 32)) (extraKeys!5119 (_ BitVec 32)) (zeroValue!5223 V!29409) (minValue!5223 V!29409) (_size!2248 (_ BitVec 32)) (_keys!10175 array!52700) (_values!5410 array!52702) (_vacant!2248 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4386)

(declare-datatypes ((List!17835 0))(
  ( (Nil!17832) (Cons!17831 (h!18973 (_ BitVec 64)) (t!25174 List!17835)) )
))
(declare-fun arrayNoDuplicates!0 (array!52700 (_ BitVec 32) List!17835) Bool)

(assert (=> b!898098 (= res!606987 (not (arrayNoDuplicates!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 Nil!17832)))))

(declare-fun b!898099 () Bool)

(declare-fun e!502321 () Bool)

(declare-fun tp_is_empty!18333 () Bool)

(assert (=> b!898099 (= e!502321 tp_is_empty!18333)))

(declare-fun b!898100 () Bool)

(declare-fun res!606985 () Bool)

(assert (=> b!898100 (=> res!606985 e!502317)))

(declare-datatypes ((SeekEntryResult!8920 0))(
  ( (MissingZero!8920 (index!38051 (_ BitVec 32))) (Found!8920 (index!38052 (_ BitVec 32))) (Intermediate!8920 (undefined!9732 Bool) (index!38053 (_ BitVec 32)) (x!76533 (_ BitVec 32))) (Undefined!8920) (MissingVacant!8920 (index!38054 (_ BitVec 32))) )
))
(declare-fun lt!405406 () SeekEntryResult!8920)

(assert (=> b!898100 (= res!606985 (or (bvslt (index!38052 lt!405406) #b00000000000000000000000000000000) (bvsge (index!38052 lt!405406) (size!25784 (_keys!10175 thiss!1181)))))))

(declare-fun b!898101 () Bool)

(declare-fun e!502320 () Bool)

(assert (=> b!898101 (= e!502320 e!502317)))

(declare-fun res!606984 () Bool)

(assert (=> b!898101 (=> res!606984 e!502317)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898101 (= res!606984 (not (validMask!0 (mask!26122 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898101 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30530 0))(
  ( (Unit!30531) )
))
(declare-fun lt!405405 () Unit!30530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52700 (_ BitVec 64) (_ BitVec 32)) Unit!30530)

(assert (=> b!898101 (= lt!405405 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) key!785 (index!38052 lt!405406)))))

(declare-fun b!898103 () Bool)

(declare-fun e!502322 () Bool)

(assert (=> b!898103 (= e!502322 tp_is_empty!18333)))

(declare-fun b!898104 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898104 (= e!502317 (validKeyInArray!0 (select (arr!25329 (_keys!10175 thiss!1181)) (index!38052 lt!405406))))))

(declare-fun b!898105 () Bool)

(declare-fun e!502325 () Bool)

(declare-fun mapRes!29148 () Bool)

(assert (=> b!898105 (= e!502325 (and e!502322 mapRes!29148))))

(declare-fun condMapEmpty!29148 () Bool)

(declare-fun mapDefault!29148 () ValueCell!8685)

(assert (=> b!898105 (= condMapEmpty!29148 (= (arr!25330 (_values!5410 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8685)) mapDefault!29148)))))

(declare-fun b!898106 () Bool)

(declare-fun res!606983 () Bool)

(declare-fun e!502324 () Bool)

(assert (=> b!898106 (=> (not res!606983) (not e!502324))))

(assert (=> b!898106 (= res!606983 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898107 () Bool)

(declare-fun res!606986 () Bool)

(assert (=> b!898107 (=> res!606986 e!502317)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52700 (_ BitVec 32)) Bool)

(assert (=> b!898107 (= res!606986 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10175 thiss!1181) (mask!26122 thiss!1181))))))

(declare-fun mapIsEmpty!29148 () Bool)

(assert (=> mapIsEmpty!29148 mapRes!29148))

(declare-fun b!898108 () Bool)

(declare-fun e!502323 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898108 (= e!502323 (inRange!0 (index!38052 lt!405406) (mask!26122 thiss!1181)))))

(declare-fun e!502318 () Bool)

(declare-fun array_inv!19882 (array!52700) Bool)

(declare-fun array_inv!19883 (array!52702) Bool)

(assert (=> b!898109 (= e!502318 (and tp!56077 tp_is_empty!18333 (array_inv!19882 (_keys!10175 thiss!1181)) (array_inv!19883 (_values!5410 thiss!1181)) e!502325))))

(declare-fun res!606988 () Bool)

(assert (=> start!76746 (=> (not res!606988) (not e!502324))))

(declare-fun valid!1689 (LongMapFixedSize!4386) Bool)

(assert (=> start!76746 (= res!606988 (valid!1689 thiss!1181))))

(assert (=> start!76746 e!502324))

(assert (=> start!76746 e!502318))

(assert (=> start!76746 true))

(declare-fun b!898102 () Bool)

(assert (=> b!898102 (= e!502324 (not e!502320))))

(declare-fun res!606989 () Bool)

(assert (=> b!898102 (=> res!606989 e!502320)))

(get-info :version)

(assert (=> b!898102 (= res!606989 (not ((_ is Found!8920) lt!405406)))))

(assert (=> b!898102 e!502323))

(declare-fun res!606990 () Bool)

(assert (=> b!898102 (=> res!606990 e!502323)))

(assert (=> b!898102 (= res!606990 (not ((_ is Found!8920) lt!405406)))))

(declare-fun lt!405404 () Unit!30530)

(declare-fun lemmaSeekEntryGivesInRangeIndex!89 (array!52700 array!52702 (_ BitVec 32) (_ BitVec 32) V!29409 V!29409 (_ BitVec 64)) Unit!30530)

(assert (=> b!898102 (= lt!405404 (lemmaSeekEntryGivesInRangeIndex!89 (_keys!10175 thiss!1181) (_values!5410 thiss!1181) (mask!26122 thiss!1181) (extraKeys!5119 thiss!1181) (zeroValue!5223 thiss!1181) (minValue!5223 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52700 (_ BitVec 32)) SeekEntryResult!8920)

(assert (=> b!898102 (= lt!405406 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)))))

(declare-fun mapNonEmpty!29148 () Bool)

(declare-fun tp!56078 () Bool)

(assert (=> mapNonEmpty!29148 (= mapRes!29148 (and tp!56078 e!502321))))

(declare-fun mapValue!29148 () ValueCell!8685)

(declare-fun mapKey!29148 () (_ BitVec 32))

(declare-fun mapRest!29148 () (Array (_ BitVec 32) ValueCell!8685))

(assert (=> mapNonEmpty!29148 (= (arr!25330 (_values!5410 thiss!1181)) (store mapRest!29148 mapKey!29148 mapValue!29148))))

(declare-fun b!898110 () Bool)

(declare-fun res!606982 () Bool)

(assert (=> b!898110 (=> res!606982 e!502317)))

(assert (=> b!898110 (= res!606982 (or (not (= (size!25785 (_values!5410 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26122 thiss!1181)))) (not (= (size!25784 (_keys!10175 thiss!1181)) (size!25785 (_values!5410 thiss!1181)))) (bvslt (mask!26122 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5119 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5119 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!76746 res!606988) b!898106))

(assert (= (and b!898106 res!606983) b!898102))

(assert (= (and b!898102 (not res!606990)) b!898108))

(assert (= (and b!898102 (not res!606989)) b!898101))

(assert (= (and b!898101 (not res!606984)) b!898110))

(assert (= (and b!898110 (not res!606982)) b!898107))

(assert (= (and b!898107 (not res!606986)) b!898098))

(assert (= (and b!898098 (not res!606987)) b!898100))

(assert (= (and b!898100 (not res!606985)) b!898104))

(assert (= (and b!898105 condMapEmpty!29148) mapIsEmpty!29148))

(assert (= (and b!898105 (not condMapEmpty!29148)) mapNonEmpty!29148))

(assert (= (and mapNonEmpty!29148 ((_ is ValueCellFull!8685) mapValue!29148)) b!898099))

(assert (= (and b!898105 ((_ is ValueCellFull!8685) mapDefault!29148)) b!898103))

(assert (= b!898109 b!898105))

(assert (= start!76746 b!898109))

(declare-fun m!834653 () Bool)

(assert (=> b!898102 m!834653))

(declare-fun m!834655 () Bool)

(assert (=> b!898102 m!834655))

(declare-fun m!834657 () Bool)

(assert (=> b!898109 m!834657))

(declare-fun m!834659 () Bool)

(assert (=> b!898109 m!834659))

(declare-fun m!834661 () Bool)

(assert (=> b!898107 m!834661))

(declare-fun m!834663 () Bool)

(assert (=> b!898108 m!834663))

(declare-fun m!834665 () Bool)

(assert (=> b!898104 m!834665))

(assert (=> b!898104 m!834665))

(declare-fun m!834667 () Bool)

(assert (=> b!898104 m!834667))

(declare-fun m!834669 () Bool)

(assert (=> mapNonEmpty!29148 m!834669))

(declare-fun m!834671 () Bool)

(assert (=> start!76746 m!834671))

(declare-fun m!834673 () Bool)

(assert (=> b!898098 m!834673))

(declare-fun m!834675 () Bool)

(assert (=> b!898101 m!834675))

(declare-fun m!834677 () Bool)

(assert (=> b!898101 m!834677))

(declare-fun m!834679 () Bool)

(assert (=> b!898101 m!834679))

(check-sat (not b!898107) (not b!898102) (not b!898104) (not b!898098) (not start!76746) tp_is_empty!18333 (not b!898109) (not b!898108) b_and!26297 (not mapNonEmpty!29148) (not b!898101) (not b_next!16005))
(check-sat b_and!26297 (not b_next!16005))
(get-model)

(declare-fun d!111187 () Bool)

(declare-fun res!607024 () Bool)

(declare-fun e!502355 () Bool)

(assert (=> d!111187 (=> (not res!607024) (not e!502355))))

(declare-fun simpleValid!322 (LongMapFixedSize!4386) Bool)

(assert (=> d!111187 (= res!607024 (simpleValid!322 thiss!1181))))

(assert (=> d!111187 (= (valid!1689 thiss!1181) e!502355)))

(declare-fun b!898156 () Bool)

(declare-fun res!607025 () Bool)

(assert (=> b!898156 (=> (not res!607025) (not e!502355))))

(declare-fun arrayCountValidKeys!0 (array!52700 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898156 (= res!607025 (= (arrayCountValidKeys!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 (size!25784 (_keys!10175 thiss!1181))) (_size!2248 thiss!1181)))))

(declare-fun b!898157 () Bool)

(declare-fun res!607026 () Bool)

(assert (=> b!898157 (=> (not res!607026) (not e!502355))))

(assert (=> b!898157 (= res!607026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)))))

(declare-fun b!898158 () Bool)

(assert (=> b!898158 (= e!502355 (arrayNoDuplicates!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 Nil!17832))))

(assert (= (and d!111187 res!607024) b!898156))

(assert (= (and b!898156 res!607025) b!898157))

(assert (= (and b!898157 res!607026) b!898158))

(declare-fun m!834709 () Bool)

(assert (=> d!111187 m!834709))

(declare-fun m!834711 () Bool)

(assert (=> b!898156 m!834711))

(assert (=> b!898157 m!834661))

(assert (=> b!898158 m!834673))

(assert (=> start!76746 d!111187))

(declare-fun d!111189 () Bool)

(assert (=> d!111189 (= (validMask!0 (mask!26122 thiss!1181)) (and (or (= (mask!26122 thiss!1181) #b00000000000000000000000000000111) (= (mask!26122 thiss!1181) #b00000000000000000000000000001111) (= (mask!26122 thiss!1181) #b00000000000000000000000000011111) (= (mask!26122 thiss!1181) #b00000000000000000000000000111111) (= (mask!26122 thiss!1181) #b00000000000000000000000001111111) (= (mask!26122 thiss!1181) #b00000000000000000000000011111111) (= (mask!26122 thiss!1181) #b00000000000000000000000111111111) (= (mask!26122 thiss!1181) #b00000000000000000000001111111111) (= (mask!26122 thiss!1181) #b00000000000000000000011111111111) (= (mask!26122 thiss!1181) #b00000000000000000000111111111111) (= (mask!26122 thiss!1181) #b00000000000000000001111111111111) (= (mask!26122 thiss!1181) #b00000000000000000011111111111111) (= (mask!26122 thiss!1181) #b00000000000000000111111111111111) (= (mask!26122 thiss!1181) #b00000000000000001111111111111111) (= (mask!26122 thiss!1181) #b00000000000000011111111111111111) (= (mask!26122 thiss!1181) #b00000000000000111111111111111111) (= (mask!26122 thiss!1181) #b00000000000001111111111111111111) (= (mask!26122 thiss!1181) #b00000000000011111111111111111111) (= (mask!26122 thiss!1181) #b00000000000111111111111111111111) (= (mask!26122 thiss!1181) #b00000000001111111111111111111111) (= (mask!26122 thiss!1181) #b00000000011111111111111111111111) (= (mask!26122 thiss!1181) #b00000000111111111111111111111111) (= (mask!26122 thiss!1181) #b00000001111111111111111111111111) (= (mask!26122 thiss!1181) #b00000011111111111111111111111111) (= (mask!26122 thiss!1181) #b00000111111111111111111111111111) (= (mask!26122 thiss!1181) #b00001111111111111111111111111111) (= (mask!26122 thiss!1181) #b00011111111111111111111111111111) (= (mask!26122 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26122 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898101 d!111189))

(declare-fun d!111191 () Bool)

(declare-fun res!607031 () Bool)

(declare-fun e!502360 () Bool)

(assert (=> d!111191 (=> res!607031 e!502360)))

(assert (=> d!111191 (= res!607031 (= (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111191 (= (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000) e!502360)))

(declare-fun b!898163 () Bool)

(declare-fun e!502361 () Bool)

(assert (=> b!898163 (= e!502360 e!502361)))

(declare-fun res!607032 () Bool)

(assert (=> b!898163 (=> (not res!607032) (not e!502361))))

(assert (=> b!898163 (= res!607032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25784 (_keys!10175 thiss!1181))))))

(declare-fun b!898164 () Bool)

(assert (=> b!898164 (= e!502361 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111191 (not res!607031)) b!898163))

(assert (= (and b!898163 res!607032) b!898164))

(declare-fun m!834713 () Bool)

(assert (=> d!111191 m!834713))

(declare-fun m!834715 () Bool)

(assert (=> b!898164 m!834715))

(assert (=> b!898101 d!111191))

(declare-fun d!111193 () Bool)

(assert (=> d!111193 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405418 () Unit!30530)

(declare-fun choose!13 (array!52700 (_ BitVec 64) (_ BitVec 32)) Unit!30530)

(assert (=> d!111193 (= lt!405418 (choose!13 (_keys!10175 thiss!1181) key!785 (index!38052 lt!405406)))))

(assert (=> d!111193 (bvsge (index!38052 lt!405406) #b00000000000000000000000000000000)))

(assert (=> d!111193 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) key!785 (index!38052 lt!405406)) lt!405418)))

(declare-fun bs!25206 () Bool)

(assert (= bs!25206 d!111193))

(assert (=> bs!25206 m!834677))

(declare-fun m!834717 () Bool)

(assert (=> bs!25206 m!834717))

(assert (=> b!898101 d!111193))

(declare-fun b!898173 () Bool)

(declare-fun e!502370 () Bool)

(declare-fun call!39832 () Bool)

(assert (=> b!898173 (= e!502370 call!39832)))

(declare-fun d!111195 () Bool)

(declare-fun res!607038 () Bool)

(declare-fun e!502368 () Bool)

(assert (=> d!111195 (=> res!607038 e!502368)))

(assert (=> d!111195 (= res!607038 (bvsge #b00000000000000000000000000000000 (size!25784 (_keys!10175 thiss!1181))))))

(assert (=> d!111195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)) e!502368)))

(declare-fun b!898174 () Bool)

(declare-fun e!502369 () Bool)

(assert (=> b!898174 (= e!502369 call!39832)))

(declare-fun b!898175 () Bool)

(assert (=> b!898175 (= e!502369 e!502370)))

(declare-fun lt!405427 () (_ BitVec 64))

(assert (=> b!898175 (= lt!405427 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405426 () Unit!30530)

(assert (=> b!898175 (= lt!405426 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) lt!405427 #b00000000000000000000000000000000))))

(assert (=> b!898175 (arrayContainsKey!0 (_keys!10175 thiss!1181) lt!405427 #b00000000000000000000000000000000)))

(declare-fun lt!405425 () Unit!30530)

(assert (=> b!898175 (= lt!405425 lt!405426)))

(declare-fun res!607037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52700 (_ BitVec 32)) SeekEntryResult!8920)

(assert (=> b!898175 (= res!607037 (= (seekEntryOrOpen!0 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) (_keys!10175 thiss!1181) (mask!26122 thiss!1181)) (Found!8920 #b00000000000000000000000000000000)))))

(assert (=> b!898175 (=> (not res!607037) (not e!502370))))

(declare-fun bm!39829 () Bool)

(assert (=> bm!39829 (= call!39832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10175 thiss!1181) (mask!26122 thiss!1181)))))

(declare-fun b!898176 () Bool)

(assert (=> b!898176 (= e!502368 e!502369)))

(declare-fun c!94901 () Bool)

(assert (=> b!898176 (= c!94901 (validKeyInArray!0 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111195 (not res!607038)) b!898176))

(assert (= (and b!898176 c!94901) b!898175))

(assert (= (and b!898176 (not c!94901)) b!898174))

(assert (= (and b!898175 res!607037) b!898173))

(assert (= (or b!898173 b!898174) bm!39829))

(assert (=> b!898175 m!834713))

(declare-fun m!834719 () Bool)

(assert (=> b!898175 m!834719))

(declare-fun m!834721 () Bool)

(assert (=> b!898175 m!834721))

(assert (=> b!898175 m!834713))

(declare-fun m!834723 () Bool)

(assert (=> b!898175 m!834723))

(declare-fun m!834725 () Bool)

(assert (=> bm!39829 m!834725))

(assert (=> b!898176 m!834713))

(assert (=> b!898176 m!834713))

(declare-fun m!834727 () Bool)

(assert (=> b!898176 m!834727))

(assert (=> b!898107 d!111195))

(declare-fun d!111197 () Bool)

(assert (=> d!111197 (= (array_inv!19882 (_keys!10175 thiss!1181)) (bvsge (size!25784 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898109 d!111197))

(declare-fun d!111199 () Bool)

(assert (=> d!111199 (= (array_inv!19883 (_values!5410 thiss!1181)) (bvsge (size!25785 (_values!5410 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898109 d!111199))

(declare-fun b!898187 () Bool)

(declare-fun e!502382 () Bool)

(declare-fun contains!4407 (List!17835 (_ BitVec 64)) Bool)

(assert (=> b!898187 (= e!502382 (contains!4407 Nil!17832 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898188 () Bool)

(declare-fun e!502379 () Bool)

(declare-fun call!39835 () Bool)

(assert (=> b!898188 (= e!502379 call!39835)))

(declare-fun b!898189 () Bool)

(declare-fun e!502380 () Bool)

(declare-fun e!502381 () Bool)

(assert (=> b!898189 (= e!502380 e!502381)))

(declare-fun res!607045 () Bool)

(assert (=> b!898189 (=> (not res!607045) (not e!502381))))

(assert (=> b!898189 (= res!607045 (not e!502382))))

(declare-fun res!607047 () Bool)

(assert (=> b!898189 (=> (not res!607047) (not e!502382))))

(assert (=> b!898189 (= res!607047 (validKeyInArray!0 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898190 () Bool)

(assert (=> b!898190 (= e!502379 call!39835)))

(declare-fun d!111201 () Bool)

(declare-fun res!607046 () Bool)

(assert (=> d!111201 (=> res!607046 e!502380)))

(assert (=> d!111201 (= res!607046 (bvsge #b00000000000000000000000000000000 (size!25784 (_keys!10175 thiss!1181))))))

(assert (=> d!111201 (= (arrayNoDuplicates!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 Nil!17832) e!502380)))

(declare-fun bm!39832 () Bool)

(declare-fun c!94904 () Bool)

(assert (=> bm!39832 (= call!39835 (arrayNoDuplicates!0 (_keys!10175 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94904 (Cons!17831 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) Nil!17832) Nil!17832)))))

(declare-fun b!898191 () Bool)

(assert (=> b!898191 (= e!502381 e!502379)))

(assert (=> b!898191 (= c!94904 (validKeyInArray!0 (select (arr!25329 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111201 (not res!607046)) b!898189))

(assert (= (and b!898189 res!607047) b!898187))

(assert (= (and b!898189 res!607045) b!898191))

(assert (= (and b!898191 c!94904) b!898188))

(assert (= (and b!898191 (not c!94904)) b!898190))

(assert (= (or b!898188 b!898190) bm!39832))

(assert (=> b!898187 m!834713))

(assert (=> b!898187 m!834713))

(declare-fun m!834729 () Bool)

(assert (=> b!898187 m!834729))

(assert (=> b!898189 m!834713))

(assert (=> b!898189 m!834713))

(assert (=> b!898189 m!834727))

(assert (=> bm!39832 m!834713))

(declare-fun m!834731 () Bool)

(assert (=> bm!39832 m!834731))

(assert (=> b!898191 m!834713))

(assert (=> b!898191 m!834713))

(assert (=> b!898191 m!834727))

(assert (=> b!898098 d!111201))

(declare-fun d!111203 () Bool)

(assert (=> d!111203 (= (inRange!0 (index!38052 lt!405406) (mask!26122 thiss!1181)) (and (bvsge (index!38052 lt!405406) #b00000000000000000000000000000000) (bvslt (index!38052 lt!405406) (bvadd (mask!26122 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898108 d!111203))

(declare-fun d!111205 () Bool)

(assert (=> d!111205 (= (validKeyInArray!0 (select (arr!25329 (_keys!10175 thiss!1181)) (index!38052 lt!405406))) (and (not (= (select (arr!25329 (_keys!10175 thiss!1181)) (index!38052 lt!405406)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25329 (_keys!10175 thiss!1181)) (index!38052 lt!405406)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898104 d!111205))

(declare-fun d!111207 () Bool)

(declare-fun e!502385 () Bool)

(assert (=> d!111207 e!502385))

(declare-fun res!607050 () Bool)

(assert (=> d!111207 (=> res!607050 e!502385)))

(declare-fun lt!405433 () SeekEntryResult!8920)

(assert (=> d!111207 (= res!607050 (not ((_ is Found!8920) lt!405433)))))

(assert (=> d!111207 (= lt!405433 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)))))

(declare-fun lt!405432 () Unit!30530)

(declare-fun choose!1487 (array!52700 array!52702 (_ BitVec 32) (_ BitVec 32) V!29409 V!29409 (_ BitVec 64)) Unit!30530)

(assert (=> d!111207 (= lt!405432 (choose!1487 (_keys!10175 thiss!1181) (_values!5410 thiss!1181) (mask!26122 thiss!1181) (extraKeys!5119 thiss!1181) (zeroValue!5223 thiss!1181) (minValue!5223 thiss!1181) key!785))))

(assert (=> d!111207 (validMask!0 (mask!26122 thiss!1181))))

(assert (=> d!111207 (= (lemmaSeekEntryGivesInRangeIndex!89 (_keys!10175 thiss!1181) (_values!5410 thiss!1181) (mask!26122 thiss!1181) (extraKeys!5119 thiss!1181) (zeroValue!5223 thiss!1181) (minValue!5223 thiss!1181) key!785) lt!405432)))

(declare-fun b!898194 () Bool)

(assert (=> b!898194 (= e!502385 (inRange!0 (index!38052 lt!405433) (mask!26122 thiss!1181)))))

(assert (= (and d!111207 (not res!607050)) b!898194))

(assert (=> d!111207 m!834655))

(declare-fun m!834733 () Bool)

(assert (=> d!111207 m!834733))

(assert (=> d!111207 m!834675))

(declare-fun m!834735 () Bool)

(assert (=> b!898194 m!834735))

(assert (=> b!898102 d!111207))

(declare-fun b!898207 () Bool)

(declare-fun e!502394 () SeekEntryResult!8920)

(declare-fun lt!405443 () SeekEntryResult!8920)

(assert (=> b!898207 (= e!502394 (MissingZero!8920 (index!38053 lt!405443)))))

(declare-fun b!898208 () Bool)

(declare-fun e!502392 () SeekEntryResult!8920)

(assert (=> b!898208 (= e!502392 Undefined!8920)))

(declare-fun d!111209 () Bool)

(declare-fun lt!405442 () SeekEntryResult!8920)

(assert (=> d!111209 (and (or ((_ is MissingVacant!8920) lt!405442) (not ((_ is Found!8920) lt!405442)) (and (bvsge (index!38052 lt!405442) #b00000000000000000000000000000000) (bvslt (index!38052 lt!405442) (size!25784 (_keys!10175 thiss!1181))))) (not ((_ is MissingVacant!8920) lt!405442)) (or (not ((_ is Found!8920) lt!405442)) (= (select (arr!25329 (_keys!10175 thiss!1181)) (index!38052 lt!405442)) key!785)))))

(assert (=> d!111209 (= lt!405442 e!502392)))

(declare-fun c!94912 () Bool)

(assert (=> d!111209 (= c!94912 (and ((_ is Intermediate!8920) lt!405443) (undefined!9732 lt!405443)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52700 (_ BitVec 32)) SeekEntryResult!8920)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111209 (= lt!405443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26122 thiss!1181)) key!785 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)))))

(assert (=> d!111209 (validMask!0 (mask!26122 thiss!1181))))

(assert (=> d!111209 (= (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)) lt!405442)))

(declare-fun b!898209 () Bool)

(declare-fun e!502393 () SeekEntryResult!8920)

(assert (=> b!898209 (= e!502392 e!502393)))

(declare-fun lt!405444 () (_ BitVec 64))

(assert (=> b!898209 (= lt!405444 (select (arr!25329 (_keys!10175 thiss!1181)) (index!38053 lt!405443)))))

(declare-fun c!94911 () Bool)

(assert (=> b!898209 (= c!94911 (= lt!405444 key!785))))

(declare-fun b!898210 () Bool)

(assert (=> b!898210 (= e!502393 (Found!8920 (index!38053 lt!405443)))))

(declare-fun b!898211 () Bool)

(declare-fun lt!405445 () SeekEntryResult!8920)

(assert (=> b!898211 (= e!502394 (ite ((_ is MissingVacant!8920) lt!405445) (MissingZero!8920 (index!38054 lt!405445)) lt!405445))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52700 (_ BitVec 32)) SeekEntryResult!8920)

(assert (=> b!898211 (= lt!405445 (seekKeyOrZeroReturnVacant!0 (x!76533 lt!405443) (index!38053 lt!405443) (index!38053 lt!405443) key!785 (_keys!10175 thiss!1181) (mask!26122 thiss!1181)))))

(declare-fun b!898212 () Bool)

(declare-fun c!94913 () Bool)

(assert (=> b!898212 (= c!94913 (= lt!405444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898212 (= e!502393 e!502394)))

(assert (= (and d!111209 c!94912) b!898208))

(assert (= (and d!111209 (not c!94912)) b!898209))

(assert (= (and b!898209 c!94911) b!898210))

(assert (= (and b!898209 (not c!94911)) b!898212))

(assert (= (and b!898212 c!94913) b!898207))

(assert (= (and b!898212 (not c!94913)) b!898211))

(declare-fun m!834737 () Bool)

(assert (=> d!111209 m!834737))

(declare-fun m!834739 () Bool)

(assert (=> d!111209 m!834739))

(assert (=> d!111209 m!834739))

(declare-fun m!834741 () Bool)

(assert (=> d!111209 m!834741))

(assert (=> d!111209 m!834675))

(declare-fun m!834743 () Bool)

(assert (=> b!898209 m!834743))

(declare-fun m!834745 () Bool)

(assert (=> b!898211 m!834745))

(assert (=> b!898102 d!111209))

(declare-fun mapIsEmpty!29154 () Bool)

(declare-fun mapRes!29154 () Bool)

(assert (=> mapIsEmpty!29154 mapRes!29154))

(declare-fun mapNonEmpty!29154 () Bool)

(declare-fun tp!56087 () Bool)

(declare-fun e!502400 () Bool)

(assert (=> mapNonEmpty!29154 (= mapRes!29154 (and tp!56087 e!502400))))

(declare-fun mapValue!29154 () ValueCell!8685)

(declare-fun mapRest!29154 () (Array (_ BitVec 32) ValueCell!8685))

(declare-fun mapKey!29154 () (_ BitVec 32))

(assert (=> mapNonEmpty!29154 (= mapRest!29148 (store mapRest!29154 mapKey!29154 mapValue!29154))))

(declare-fun condMapEmpty!29154 () Bool)

(declare-fun mapDefault!29154 () ValueCell!8685)

(assert (=> mapNonEmpty!29148 (= condMapEmpty!29154 (= mapRest!29148 ((as const (Array (_ BitVec 32) ValueCell!8685)) mapDefault!29154)))))

(declare-fun e!502399 () Bool)

(assert (=> mapNonEmpty!29148 (= tp!56078 (and e!502399 mapRes!29154))))

(declare-fun b!898220 () Bool)

(assert (=> b!898220 (= e!502399 tp_is_empty!18333)))

(declare-fun b!898219 () Bool)

(assert (=> b!898219 (= e!502400 tp_is_empty!18333)))

(assert (= (and mapNonEmpty!29148 condMapEmpty!29154) mapIsEmpty!29154))

(assert (= (and mapNonEmpty!29148 (not condMapEmpty!29154)) mapNonEmpty!29154))

(assert (= (and mapNonEmpty!29154 ((_ is ValueCellFull!8685) mapValue!29154)) b!898219))

(assert (= (and mapNonEmpty!29148 ((_ is ValueCellFull!8685) mapDefault!29154)) b!898220))

(declare-fun m!834747 () Bool)

(assert (=> mapNonEmpty!29154 m!834747))

(check-sat (not b!898187) (not b_next!16005) (not mapNonEmpty!29154) (not b!898191) (not d!111187) (not b!898164) (not b!898157) tp_is_empty!18333 (not b!898156) (not b!898211) b_and!26297 (not d!111193) (not b!898194) (not d!111207) (not b!898175) (not bm!39829) (not bm!39832) (not d!111209) (not b!898158) (not b!898176) (not b!898189))
(check-sat b_and!26297 (not b_next!16005))
