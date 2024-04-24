; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76558 () Bool)

(assert start!76558)

(declare-fun b!896989 () Bool)

(declare-fun b_free!15937 () Bool)

(declare-fun b_next!15937 () Bool)

(assert (=> b!896989 (= b_free!15937 (not b_next!15937))))

(declare-fun tp!55836 () Bool)

(declare-fun b_and!26239 () Bool)

(assert (=> b!896989 (= tp!55836 b_and!26239)))

(declare-fun b!896984 () Bool)

(declare-fun e!501374 () Bool)

(declare-datatypes ((SeekEntryResult!8844 0))(
  ( (MissingZero!8844 (index!37747 (_ BitVec 32))) (Found!8844 (index!37748 (_ BitVec 32))) (Intermediate!8844 (undefined!9656 Bool) (index!37749 (_ BitVec 32)) (x!76250 (_ BitVec 32))) (Undefined!8844) (MissingVacant!8844 (index!37750 (_ BitVec 32))) )
))
(declare-fun lt!405059 () SeekEntryResult!8844)

(declare-datatypes ((array!52581 0))(
  ( (array!52582 (arr!25276 (Array (_ BitVec 32) (_ BitVec 64))) (size!25727 (_ BitVec 32))) )
))
(declare-datatypes ((V!29319 0))(
  ( (V!29320 (val!9183 Int)) )
))
(declare-datatypes ((ValueCell!8651 0))(
  ( (ValueCellFull!8651 (v!11670 V!29319)) (EmptyCell!8651) )
))
(declare-datatypes ((array!52583 0))(
  ( (array!52584 (arr!25277 (Array (_ BitVec 32) ValueCell!8651)) (size!25728 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4318 0))(
  ( (LongMapFixedSize!4319 (defaultEntry!5371 Int) (mask!26038 (_ BitVec 32)) (extraKeys!5069 (_ BitVec 32)) (zeroValue!5173 V!29319) (minValue!5173 V!29319) (_size!2214 (_ BitVec 32)) (_keys!10124 array!52581) (_values!5360 array!52583) (_vacant!2214 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4318)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896984 (= e!501374 (inRange!0 (index!37748 lt!405059) (mask!26038 thiss!1181)))))

(declare-fun b!896985 () Bool)

(declare-fun e!501368 () Bool)

(declare-fun e!501373 () Bool)

(declare-fun mapRes!29008 () Bool)

(assert (=> b!896985 (= e!501368 (and e!501373 mapRes!29008))))

(declare-fun condMapEmpty!29008 () Bool)

(declare-fun mapDefault!29008 () ValueCell!8651)

(assert (=> b!896985 (= condMapEmpty!29008 (= (arr!25277 (_values!5360 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8651)) mapDefault!29008)))))

(declare-fun b!896986 () Bool)

(declare-fun tp_is_empty!18265 () Bool)

(assert (=> b!896986 (= e!501373 tp_is_empty!18265)))

(declare-fun b!896988 () Bool)

(declare-fun e!501371 () Bool)

(assert (=> b!896988 (= e!501371 tp_is_empty!18265)))

(declare-fun e!501372 () Bool)

(declare-fun array_inv!19888 (array!52581) Bool)

(declare-fun array_inv!19889 (array!52583) Bool)

(assert (=> b!896989 (= e!501372 (and tp!55836 tp_is_empty!18265 (array_inv!19888 (_keys!10124 thiss!1181)) (array_inv!19889 (_values!5360 thiss!1181)) e!501368))))

(declare-fun mapNonEmpty!29008 () Bool)

(declare-fun tp!55837 () Bool)

(assert (=> mapNonEmpty!29008 (= mapRes!29008 (and tp!55837 e!501371))))

(declare-fun mapRest!29008 () (Array (_ BitVec 32) ValueCell!8651))

(declare-fun mapKey!29008 () (_ BitVec 32))

(declare-fun mapValue!29008 () ValueCell!8651)

(assert (=> mapNonEmpty!29008 (= (arr!25277 (_values!5360 thiss!1181)) (store mapRest!29008 mapKey!29008 mapValue!29008))))

(declare-fun mapIsEmpty!29008 () Bool)

(assert (=> mapIsEmpty!29008 mapRes!29008))

(declare-fun b!896990 () Bool)

(declare-fun res!606339 () Bool)

(declare-fun e!501370 () Bool)

(assert (=> b!896990 (=> (not res!606339) (not e!501370))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896990 (= res!606339 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606340 () Bool)

(assert (=> start!76558 (=> (not res!606340) (not e!501370))))

(declare-fun valid!1678 (LongMapFixedSize!4318) Bool)

(assert (=> start!76558 (= res!606340 (valid!1678 thiss!1181))))

(assert (=> start!76558 e!501370))

(assert (=> start!76558 e!501372))

(assert (=> start!76558 true))

(declare-fun b!896987 () Bool)

(get-info :version)

(assert (=> b!896987 (= e!501370 (not (or (not ((_ is Found!8844) lt!405059)) (bvslt (index!37748 lt!405059) #b00000000000000000000000000000000) (bvsge (index!37748 lt!405059) (size!25727 (_keys!10124 thiss!1181))) (bvslt (size!25727 (_keys!10124 thiss!1181)) #b01111111111111111111111111111111))))))

(assert (=> b!896987 e!501374))

(declare-fun res!606338 () Bool)

(assert (=> b!896987 (=> res!606338 e!501374)))

(assert (=> b!896987 (= res!606338 (not ((_ is Found!8844) lt!405059)))))

(declare-datatypes ((Unit!30462 0))(
  ( (Unit!30463) )
))
(declare-fun lt!405058 () Unit!30462)

(declare-fun lemmaSeekEntryGivesInRangeIndex!72 (array!52581 array!52583 (_ BitVec 32) (_ BitVec 32) V!29319 V!29319 (_ BitVec 64)) Unit!30462)

(assert (=> b!896987 (= lt!405058 (lemmaSeekEntryGivesInRangeIndex!72 (_keys!10124 thiss!1181) (_values!5360 thiss!1181) (mask!26038 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8844)

(assert (=> b!896987 (= lt!405059 (seekEntry!0 key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(assert (= (and start!76558 res!606340) b!896990))

(assert (= (and b!896990 res!606339) b!896987))

(assert (= (and b!896987 (not res!606338)) b!896984))

(assert (= (and b!896985 condMapEmpty!29008) mapIsEmpty!29008))

(assert (= (and b!896985 (not condMapEmpty!29008)) mapNonEmpty!29008))

(assert (= (and mapNonEmpty!29008 ((_ is ValueCellFull!8651) mapValue!29008)) b!896988))

(assert (= (and b!896985 ((_ is ValueCellFull!8651) mapDefault!29008)) b!896986))

(assert (= b!896989 b!896985))

(assert (= start!76558 b!896989))

(declare-fun m!834697 () Bool)

(assert (=> b!896987 m!834697))

(declare-fun m!834699 () Bool)

(assert (=> b!896987 m!834699))

(declare-fun m!834701 () Bool)

(assert (=> start!76558 m!834701))

(declare-fun m!834703 () Bool)

(assert (=> b!896984 m!834703))

(declare-fun m!834705 () Bool)

(assert (=> b!896989 m!834705))

(declare-fun m!834707 () Bool)

(assert (=> b!896989 m!834707))

(declare-fun m!834709 () Bool)

(assert (=> mapNonEmpty!29008 m!834709))

(check-sat (not b_next!15937) (not b!896984) (not start!76558) (not b!896987) b_and!26239 (not b!896989) (not mapNonEmpty!29008) tp_is_empty!18265)
(check-sat b_and!26239 (not b_next!15937))
(get-model)

(declare-fun d!111181 () Bool)

(declare-fun e!501419 () Bool)

(assert (=> d!111181 e!501419))

(declare-fun res!606361 () Bool)

(assert (=> d!111181 (=> res!606361 e!501419)))

(declare-fun lt!405077 () SeekEntryResult!8844)

(assert (=> d!111181 (= res!606361 (not ((_ is Found!8844) lt!405077)))))

(assert (=> d!111181 (= lt!405077 (seekEntry!0 key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(declare-fun lt!405076 () Unit!30462)

(declare-fun choose!1482 (array!52581 array!52583 (_ BitVec 32) (_ BitVec 32) V!29319 V!29319 (_ BitVec 64)) Unit!30462)

(assert (=> d!111181 (= lt!405076 (choose!1482 (_keys!10124 thiss!1181) (_values!5360 thiss!1181) (mask!26038 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111181 (validMask!0 (mask!26038 thiss!1181))))

(assert (=> d!111181 (= (lemmaSeekEntryGivesInRangeIndex!72 (_keys!10124 thiss!1181) (_values!5360 thiss!1181) (mask!26038 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785) lt!405076)))

(declare-fun b!897035 () Bool)

(assert (=> b!897035 (= e!501419 (inRange!0 (index!37748 lt!405077) (mask!26038 thiss!1181)))))

(assert (= (and d!111181 (not res!606361)) b!897035))

(assert (=> d!111181 m!834699))

(declare-fun m!834739 () Bool)

(assert (=> d!111181 m!834739))

(declare-fun m!834741 () Bool)

(assert (=> d!111181 m!834741))

(declare-fun m!834743 () Bool)

(assert (=> b!897035 m!834743))

(assert (=> b!896987 d!111181))

(declare-fun b!897048 () Bool)

(declare-fun e!501426 () SeekEntryResult!8844)

(declare-fun lt!405089 () SeekEntryResult!8844)

(assert (=> b!897048 (= e!501426 (ite ((_ is MissingVacant!8844) lt!405089) (MissingZero!8844 (index!37750 lt!405089)) lt!405089))))

(declare-fun lt!405088 () SeekEntryResult!8844)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8844)

(assert (=> b!897048 (= lt!405089 (seekKeyOrZeroReturnVacant!0 (x!76250 lt!405088) (index!37749 lt!405088) (index!37749 lt!405088) key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(declare-fun b!897049 () Bool)

(declare-fun e!501427 () SeekEntryResult!8844)

(assert (=> b!897049 (= e!501427 Undefined!8844)))

(declare-fun b!897050 () Bool)

(declare-fun e!501428 () SeekEntryResult!8844)

(assert (=> b!897050 (= e!501428 (Found!8844 (index!37749 lt!405088)))))

(declare-fun b!897051 () Bool)

(assert (=> b!897051 (= e!501427 e!501428)))

(declare-fun lt!405087 () (_ BitVec 64))

(assert (=> b!897051 (= lt!405087 (select (arr!25276 (_keys!10124 thiss!1181)) (index!37749 lt!405088)))))

(declare-fun c!94923 () Bool)

(assert (=> b!897051 (= c!94923 (= lt!405087 key!785))))

(declare-fun b!897052 () Bool)

(assert (=> b!897052 (= e!501426 (MissingZero!8844 (index!37749 lt!405088)))))

(declare-fun b!897053 () Bool)

(declare-fun c!94925 () Bool)

(assert (=> b!897053 (= c!94925 (= lt!405087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897053 (= e!501428 e!501426)))

(declare-fun d!111183 () Bool)

(declare-fun lt!405086 () SeekEntryResult!8844)

(assert (=> d!111183 (and (or ((_ is MissingVacant!8844) lt!405086) (not ((_ is Found!8844) lt!405086)) (and (bvsge (index!37748 lt!405086) #b00000000000000000000000000000000) (bvslt (index!37748 lt!405086) (size!25727 (_keys!10124 thiss!1181))))) (not ((_ is MissingVacant!8844) lt!405086)) (or (not ((_ is Found!8844) lt!405086)) (= (select (arr!25276 (_keys!10124 thiss!1181)) (index!37748 lt!405086)) key!785)))))

(assert (=> d!111183 (= lt!405086 e!501427)))

(declare-fun c!94924 () Bool)

(assert (=> d!111183 (= c!94924 (and ((_ is Intermediate!8844) lt!405088) (undefined!9656 lt!405088)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111183 (= lt!405088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26038 thiss!1181)) key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(assert (=> d!111183 (validMask!0 (mask!26038 thiss!1181))))

(assert (=> d!111183 (= (seekEntry!0 key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)) lt!405086)))

(assert (= (and d!111183 c!94924) b!897049))

(assert (= (and d!111183 (not c!94924)) b!897051))

(assert (= (and b!897051 c!94923) b!897050))

(assert (= (and b!897051 (not c!94923)) b!897053))

(assert (= (and b!897053 c!94925) b!897052))

(assert (= (and b!897053 (not c!94925)) b!897048))

(declare-fun m!834745 () Bool)

(assert (=> b!897048 m!834745))

(declare-fun m!834747 () Bool)

(assert (=> b!897051 m!834747))

(declare-fun m!834749 () Bool)

(assert (=> d!111183 m!834749))

(declare-fun m!834751 () Bool)

(assert (=> d!111183 m!834751))

(assert (=> d!111183 m!834751))

(declare-fun m!834753 () Bool)

(assert (=> d!111183 m!834753))

(assert (=> d!111183 m!834741))

(assert (=> b!896987 d!111183))

(declare-fun d!111185 () Bool)

(assert (=> d!111185 (= (array_inv!19888 (_keys!10124 thiss!1181)) (bvsge (size!25727 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896989 d!111185))

(declare-fun d!111187 () Bool)

(assert (=> d!111187 (= (array_inv!19889 (_values!5360 thiss!1181)) (bvsge (size!25728 (_values!5360 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896989 d!111187))

(declare-fun d!111189 () Bool)

(assert (=> d!111189 (= (inRange!0 (index!37748 lt!405059) (mask!26038 thiss!1181)) (and (bvsge (index!37748 lt!405059) #b00000000000000000000000000000000) (bvslt (index!37748 lt!405059) (bvadd (mask!26038 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896984 d!111189))

(declare-fun d!111191 () Bool)

(declare-fun res!606368 () Bool)

(declare-fun e!501431 () Bool)

(assert (=> d!111191 (=> (not res!606368) (not e!501431))))

(declare-fun simpleValid!311 (LongMapFixedSize!4318) Bool)

(assert (=> d!111191 (= res!606368 (simpleValid!311 thiss!1181))))

(assert (=> d!111191 (= (valid!1678 thiss!1181) e!501431)))

(declare-fun b!897060 () Bool)

(declare-fun res!606369 () Bool)

(assert (=> b!897060 (=> (not res!606369) (not e!501431))))

(declare-fun arrayCountValidKeys!0 (array!52581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897060 (= res!606369 (= (arrayCountValidKeys!0 (_keys!10124 thiss!1181) #b00000000000000000000000000000000 (size!25727 (_keys!10124 thiss!1181))) (_size!2214 thiss!1181)))))

(declare-fun b!897061 () Bool)

(declare-fun res!606370 () Bool)

(assert (=> b!897061 (=> (not res!606370) (not e!501431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52581 (_ BitVec 32)) Bool)

(assert (=> b!897061 (= res!606370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(declare-fun b!897062 () Bool)

(declare-datatypes ((List!17771 0))(
  ( (Nil!17768) (Cons!17767 (h!18910 (_ BitVec 64)) (t!25102 List!17771)) )
))
(declare-fun arrayNoDuplicates!0 (array!52581 (_ BitVec 32) List!17771) Bool)

(assert (=> b!897062 (= e!501431 (arrayNoDuplicates!0 (_keys!10124 thiss!1181) #b00000000000000000000000000000000 Nil!17768))))

(assert (= (and d!111191 res!606368) b!897060))

(assert (= (and b!897060 res!606369) b!897061))

(assert (= (and b!897061 res!606370) b!897062))

(declare-fun m!834755 () Bool)

(assert (=> d!111191 m!834755))

(declare-fun m!834757 () Bool)

(assert (=> b!897060 m!834757))

(declare-fun m!834759 () Bool)

(assert (=> b!897061 m!834759))

(declare-fun m!834761 () Bool)

(assert (=> b!897062 m!834761))

(assert (=> start!76558 d!111191))

(declare-fun mapIsEmpty!29017 () Bool)

(declare-fun mapRes!29017 () Bool)

(assert (=> mapIsEmpty!29017 mapRes!29017))

(declare-fun b!897069 () Bool)

(declare-fun e!501436 () Bool)

(assert (=> b!897069 (= e!501436 tp_is_empty!18265)))

(declare-fun mapNonEmpty!29017 () Bool)

(declare-fun tp!55852 () Bool)

(assert (=> mapNonEmpty!29017 (= mapRes!29017 (and tp!55852 e!501436))))

(declare-fun mapValue!29017 () ValueCell!8651)

(declare-fun mapKey!29017 () (_ BitVec 32))

(declare-fun mapRest!29017 () (Array (_ BitVec 32) ValueCell!8651))

(assert (=> mapNonEmpty!29017 (= mapRest!29008 (store mapRest!29017 mapKey!29017 mapValue!29017))))

(declare-fun b!897070 () Bool)

(declare-fun e!501437 () Bool)

(assert (=> b!897070 (= e!501437 tp_is_empty!18265)))

(declare-fun condMapEmpty!29017 () Bool)

(declare-fun mapDefault!29017 () ValueCell!8651)

(assert (=> mapNonEmpty!29008 (= condMapEmpty!29017 (= mapRest!29008 ((as const (Array (_ BitVec 32) ValueCell!8651)) mapDefault!29017)))))

(assert (=> mapNonEmpty!29008 (= tp!55837 (and e!501437 mapRes!29017))))

(assert (= (and mapNonEmpty!29008 condMapEmpty!29017) mapIsEmpty!29017))

(assert (= (and mapNonEmpty!29008 (not condMapEmpty!29017)) mapNonEmpty!29017))

(assert (= (and mapNonEmpty!29017 ((_ is ValueCellFull!8651) mapValue!29017)) b!897069))

(assert (= (and mapNonEmpty!29008 ((_ is ValueCellFull!8651) mapDefault!29017)) b!897070))

(declare-fun m!834763 () Bool)

(assert (=> mapNonEmpty!29017 m!834763))

(check-sat tp_is_empty!18265 (not b_next!15937) (not b!897060) (not b!897061) (not d!111183) (not d!111181) (not mapNonEmpty!29017) (not b!897048) (not d!111191) (not b!897062) b_and!26239 (not b!897035))
(check-sat b_and!26239 (not b_next!15937))
(get-model)

(declare-fun b!897089 () Bool)

(declare-fun e!501451 () SeekEntryResult!8844)

(assert (=> b!897089 (= e!501451 (Intermediate!8844 true (toIndex!0 key!785 (mask!26038 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897090 () Bool)

(declare-fun e!501452 () SeekEntryResult!8844)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897090 (= e!501452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26038 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26038 thiss!1181)) key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(declare-fun d!111193 () Bool)

(declare-fun e!501450 () Bool)

(assert (=> d!111193 e!501450))

(declare-fun c!94932 () Bool)

(declare-fun lt!405094 () SeekEntryResult!8844)

(assert (=> d!111193 (= c!94932 (and ((_ is Intermediate!8844) lt!405094) (undefined!9656 lt!405094)))))

(assert (=> d!111193 (= lt!405094 e!501451)))

(declare-fun c!94934 () Bool)

(assert (=> d!111193 (= c!94934 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!405095 () (_ BitVec 64))

(assert (=> d!111193 (= lt!405095 (select (arr!25276 (_keys!10124 thiss!1181)) (toIndex!0 key!785 (mask!26038 thiss!1181))))))

(assert (=> d!111193 (validMask!0 (mask!26038 thiss!1181))))

(assert (=> d!111193 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26038 thiss!1181)) key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)) lt!405094)))

(declare-fun b!897091 () Bool)

(assert (=> b!897091 (= e!501450 (bvsge (x!76250 lt!405094) #b01111111111111111111111111111110))))

(declare-fun b!897092 () Bool)

(assert (=> b!897092 (and (bvsge (index!37749 lt!405094) #b00000000000000000000000000000000) (bvslt (index!37749 lt!405094) (size!25727 (_keys!10124 thiss!1181))))))

(declare-fun e!501449 () Bool)

(assert (=> b!897092 (= e!501449 (= (select (arr!25276 (_keys!10124 thiss!1181)) (index!37749 lt!405094)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!897093 () Bool)

(declare-fun e!501448 () Bool)

(assert (=> b!897093 (= e!501450 e!501448)))

(declare-fun res!606378 () Bool)

(assert (=> b!897093 (= res!606378 (and ((_ is Intermediate!8844) lt!405094) (not (undefined!9656 lt!405094)) (bvslt (x!76250 lt!405094) #b01111111111111111111111111111110) (bvsge (x!76250 lt!405094) #b00000000000000000000000000000000) (bvsge (x!76250 lt!405094) #b00000000000000000000000000000000)))))

(assert (=> b!897093 (=> (not res!606378) (not e!501448))))

(declare-fun b!897094 () Bool)

(assert (=> b!897094 (= e!501452 (Intermediate!8844 false (toIndex!0 key!785 (mask!26038 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897095 () Bool)

(assert (=> b!897095 (and (bvsge (index!37749 lt!405094) #b00000000000000000000000000000000) (bvslt (index!37749 lt!405094) (size!25727 (_keys!10124 thiss!1181))))))

(declare-fun res!606379 () Bool)

(assert (=> b!897095 (= res!606379 (= (select (arr!25276 (_keys!10124 thiss!1181)) (index!37749 lt!405094)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897095 (=> res!606379 e!501449)))

(declare-fun b!897096 () Bool)

(assert (=> b!897096 (and (bvsge (index!37749 lt!405094) #b00000000000000000000000000000000) (bvslt (index!37749 lt!405094) (size!25727 (_keys!10124 thiss!1181))))))

(declare-fun res!606377 () Bool)

(assert (=> b!897096 (= res!606377 (= (select (arr!25276 (_keys!10124 thiss!1181)) (index!37749 lt!405094)) key!785))))

(assert (=> b!897096 (=> res!606377 e!501449)))

(assert (=> b!897096 (= e!501448 e!501449)))

(declare-fun b!897097 () Bool)

(assert (=> b!897097 (= e!501451 e!501452)))

(declare-fun c!94933 () Bool)

(assert (=> b!897097 (= c!94933 (or (= lt!405095 key!785) (= (bvadd lt!405095 lt!405095) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111193 c!94934) b!897089))

(assert (= (and d!111193 (not c!94934)) b!897097))

(assert (= (and b!897097 c!94933) b!897094))

(assert (= (and b!897097 (not c!94933)) b!897090))

(assert (= (and d!111193 c!94932) b!897091))

(assert (= (and d!111193 (not c!94932)) b!897093))

(assert (= (and b!897093 res!606378) b!897096))

(assert (= (and b!897096 (not res!606377)) b!897095))

(assert (= (and b!897095 (not res!606379)) b!897092))

(declare-fun m!834765 () Bool)

(assert (=> b!897096 m!834765))

(assert (=> b!897092 m!834765))

(assert (=> b!897095 m!834765))

(assert (=> d!111193 m!834751))

(declare-fun m!834767 () Bool)

(assert (=> d!111193 m!834767))

(assert (=> d!111193 m!834741))

(assert (=> b!897090 m!834751))

(declare-fun m!834769 () Bool)

(assert (=> b!897090 m!834769))

(assert (=> b!897090 m!834769))

(declare-fun m!834771 () Bool)

(assert (=> b!897090 m!834771))

(assert (=> d!111183 d!111193))

(declare-fun d!111195 () Bool)

(declare-fun lt!405101 () (_ BitVec 32))

(declare-fun lt!405100 () (_ BitVec 32))

(assert (=> d!111195 (= lt!405101 (bvmul (bvxor lt!405100 (bvlshr lt!405100 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111195 (= lt!405100 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111195 (and (bvsge (mask!26038 thiss!1181) #b00000000000000000000000000000000) (let ((res!606380 (let ((h!18911 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76266 (bvmul (bvxor h!18911 (bvlshr h!18911 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76266 (bvlshr x!76266 #b00000000000000000000000000001101)) (mask!26038 thiss!1181)))))) (and (bvslt res!606380 (bvadd (mask!26038 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606380 #b00000000000000000000000000000000))))))

(assert (=> d!111195 (= (toIndex!0 key!785 (mask!26038 thiss!1181)) (bvand (bvxor lt!405101 (bvlshr lt!405101 #b00000000000000000000000000001101)) (mask!26038 thiss!1181)))))

(assert (=> d!111183 d!111195))

(declare-fun d!111197 () Bool)

(assert (=> d!111197 (= (validMask!0 (mask!26038 thiss!1181)) (and (or (= (mask!26038 thiss!1181) #b00000000000000000000000000000111) (= (mask!26038 thiss!1181) #b00000000000000000000000000001111) (= (mask!26038 thiss!1181) #b00000000000000000000000000011111) (= (mask!26038 thiss!1181) #b00000000000000000000000000111111) (= (mask!26038 thiss!1181) #b00000000000000000000000001111111) (= (mask!26038 thiss!1181) #b00000000000000000000000011111111) (= (mask!26038 thiss!1181) #b00000000000000000000000111111111) (= (mask!26038 thiss!1181) #b00000000000000000000001111111111) (= (mask!26038 thiss!1181) #b00000000000000000000011111111111) (= (mask!26038 thiss!1181) #b00000000000000000000111111111111) (= (mask!26038 thiss!1181) #b00000000000000000001111111111111) (= (mask!26038 thiss!1181) #b00000000000000000011111111111111) (= (mask!26038 thiss!1181) #b00000000000000000111111111111111) (= (mask!26038 thiss!1181) #b00000000000000001111111111111111) (= (mask!26038 thiss!1181) #b00000000000000011111111111111111) (= (mask!26038 thiss!1181) #b00000000000000111111111111111111) (= (mask!26038 thiss!1181) #b00000000000001111111111111111111) (= (mask!26038 thiss!1181) #b00000000000011111111111111111111) (= (mask!26038 thiss!1181) #b00000000000111111111111111111111) (= (mask!26038 thiss!1181) #b00000000001111111111111111111111) (= (mask!26038 thiss!1181) #b00000000011111111111111111111111) (= (mask!26038 thiss!1181) #b00000000111111111111111111111111) (= (mask!26038 thiss!1181) #b00000001111111111111111111111111) (= (mask!26038 thiss!1181) #b00000011111111111111111111111111) (= (mask!26038 thiss!1181) #b00000111111111111111111111111111) (= (mask!26038 thiss!1181) #b00001111111111111111111111111111) (= (mask!26038 thiss!1181) #b00011111111111111111111111111111) (= (mask!26038 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26038 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!111183 d!111197))

(assert (=> d!111181 d!111183))

(declare-fun d!111199 () Bool)

(declare-fun e!501455 () Bool)

(assert (=> d!111199 e!501455))

(declare-fun res!606383 () Bool)

(assert (=> d!111199 (=> res!606383 e!501455)))

(declare-fun lt!405104 () SeekEntryResult!8844)

(assert (=> d!111199 (= res!606383 (not ((_ is Found!8844) lt!405104)))))

(assert (=> d!111199 (= lt!405104 (seekEntry!0 key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(assert (=> d!111199 true))

(declare-fun _$36!351 () Unit!30462)

(assert (=> d!111199 (= (choose!1482 (_keys!10124 thiss!1181) (_values!5360 thiss!1181) (mask!26038 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785) _$36!351)))

(declare-fun b!897100 () Bool)

(assert (=> b!897100 (= e!501455 (inRange!0 (index!37748 lt!405104) (mask!26038 thiss!1181)))))

(assert (= (and d!111199 (not res!606383)) b!897100))

(assert (=> d!111199 m!834699))

(declare-fun m!834773 () Bool)

(assert (=> b!897100 m!834773))

(assert (=> d!111181 d!111199))

(assert (=> d!111181 d!111197))

(declare-fun d!111201 () Bool)

(declare-fun res!606388 () Bool)

(declare-fun e!501464 () Bool)

(assert (=> d!111201 (=> res!606388 e!501464)))

(assert (=> d!111201 (= res!606388 (bvsge #b00000000000000000000000000000000 (size!25727 (_keys!10124 thiss!1181))))))

(assert (=> d!111201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)) e!501464)))

(declare-fun b!897109 () Bool)

(declare-fun e!501463 () Bool)

(declare-fun call!39817 () Bool)

(assert (=> b!897109 (= e!501463 call!39817)))

(declare-fun b!897110 () Bool)

(declare-fun e!501462 () Bool)

(assert (=> b!897110 (= e!501462 call!39817)))

(declare-fun b!897111 () Bool)

(assert (=> b!897111 (= e!501463 e!501462)))

(declare-fun lt!405112 () (_ BitVec 64))

(assert (=> b!897111 (= lt!405112 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405111 () Unit!30462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52581 (_ BitVec 64) (_ BitVec 32)) Unit!30462)

(assert (=> b!897111 (= lt!405111 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10124 thiss!1181) lt!405112 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897111 (arrayContainsKey!0 (_keys!10124 thiss!1181) lt!405112 #b00000000000000000000000000000000)))

(declare-fun lt!405113 () Unit!30462)

(assert (=> b!897111 (= lt!405113 lt!405111)))

(declare-fun res!606389 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52581 (_ BitVec 32)) SeekEntryResult!8844)

(assert (=> b!897111 (= res!606389 (= (seekEntryOrOpen!0 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000) (_keys!10124 thiss!1181) (mask!26038 thiss!1181)) (Found!8844 #b00000000000000000000000000000000)))))

(assert (=> b!897111 (=> (not res!606389) (not e!501462))))

(declare-fun bm!39814 () Bool)

(assert (=> bm!39814 (= call!39817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(declare-fun b!897112 () Bool)

(assert (=> b!897112 (= e!501464 e!501463)))

(declare-fun c!94937 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897112 (= c!94937 (validKeyInArray!0 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111201 (not res!606388)) b!897112))

(assert (= (and b!897112 c!94937) b!897111))

(assert (= (and b!897112 (not c!94937)) b!897109))

(assert (= (and b!897111 res!606389) b!897110))

(assert (= (or b!897110 b!897109) bm!39814))

(declare-fun m!834775 () Bool)

(assert (=> b!897111 m!834775))

(declare-fun m!834777 () Bool)

(assert (=> b!897111 m!834777))

(declare-fun m!834779 () Bool)

(assert (=> b!897111 m!834779))

(assert (=> b!897111 m!834775))

(declare-fun m!834781 () Bool)

(assert (=> b!897111 m!834781))

(declare-fun m!834783 () Bool)

(assert (=> bm!39814 m!834783))

(assert (=> b!897112 m!834775))

(assert (=> b!897112 m!834775))

(declare-fun m!834785 () Bool)

(assert (=> b!897112 m!834785))

(assert (=> b!897061 d!111201))

(declare-fun b!897123 () Bool)

(declare-fun e!501476 () Bool)

(declare-fun call!39820 () Bool)

(assert (=> b!897123 (= e!501476 call!39820)))

(declare-fun b!897124 () Bool)

(declare-fun e!501473 () Bool)

(declare-fun e!501475 () Bool)

(assert (=> b!897124 (= e!501473 e!501475)))

(declare-fun res!606398 () Bool)

(assert (=> b!897124 (=> (not res!606398) (not e!501475))))

(declare-fun e!501474 () Bool)

(assert (=> b!897124 (= res!606398 (not e!501474))))

(declare-fun res!606396 () Bool)

(assert (=> b!897124 (=> (not res!606396) (not e!501474))))

(assert (=> b!897124 (= res!606396 (validKeyInArray!0 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897125 () Bool)

(assert (=> b!897125 (= e!501475 e!501476)))

(declare-fun c!94940 () Bool)

(assert (=> b!897125 (= c!94940 (validKeyInArray!0 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39817 () Bool)

(assert (=> bm!39817 (= call!39820 (arrayNoDuplicates!0 (_keys!10124 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94940 (Cons!17767 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000) Nil!17768) Nil!17768)))))

(declare-fun b!897126 () Bool)

(declare-fun contains!4371 (List!17771 (_ BitVec 64)) Bool)

(assert (=> b!897126 (= e!501474 (contains!4371 Nil!17768 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897127 () Bool)

(assert (=> b!897127 (= e!501476 call!39820)))

(declare-fun d!111203 () Bool)

(declare-fun res!606397 () Bool)

(assert (=> d!111203 (=> res!606397 e!501473)))

(assert (=> d!111203 (= res!606397 (bvsge #b00000000000000000000000000000000 (size!25727 (_keys!10124 thiss!1181))))))

(assert (=> d!111203 (= (arrayNoDuplicates!0 (_keys!10124 thiss!1181) #b00000000000000000000000000000000 Nil!17768) e!501473)))

(assert (= (and d!111203 (not res!606397)) b!897124))

(assert (= (and b!897124 res!606396) b!897126))

(assert (= (and b!897124 res!606398) b!897125))

(assert (= (and b!897125 c!94940) b!897127))

(assert (= (and b!897125 (not c!94940)) b!897123))

(assert (= (or b!897127 b!897123) bm!39817))

(assert (=> b!897124 m!834775))

(assert (=> b!897124 m!834775))

(assert (=> b!897124 m!834785))

(assert (=> b!897125 m!834775))

(assert (=> b!897125 m!834775))

(assert (=> b!897125 m!834785))

(assert (=> bm!39817 m!834775))

(declare-fun m!834787 () Bool)

(assert (=> bm!39817 m!834787))

(assert (=> b!897126 m!834775))

(assert (=> b!897126 m!834775))

(declare-fun m!834789 () Bool)

(assert (=> b!897126 m!834789))

(assert (=> b!897062 d!111203))

(declare-fun b!897136 () Bool)

(declare-fun e!501482 () (_ BitVec 32))

(declare-fun call!39823 () (_ BitVec 32))

(assert (=> b!897136 (= e!501482 (bvadd #b00000000000000000000000000000001 call!39823))))

(declare-fun b!897137 () Bool)

(assert (=> b!897137 (= e!501482 call!39823)))

(declare-fun bm!39820 () Bool)

(assert (=> bm!39820 (= call!39823 (arrayCountValidKeys!0 (_keys!10124 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25727 (_keys!10124 thiss!1181))))))

(declare-fun b!897139 () Bool)

(declare-fun e!501481 () (_ BitVec 32))

(assert (=> b!897139 (= e!501481 e!501482)))

(declare-fun c!94945 () Bool)

(assert (=> b!897139 (= c!94945 (validKeyInArray!0 (select (arr!25276 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111205 () Bool)

(declare-fun lt!405116 () (_ BitVec 32))

(assert (=> d!111205 (and (bvsge lt!405116 #b00000000000000000000000000000000) (bvsle lt!405116 (bvsub (size!25727 (_keys!10124 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111205 (= lt!405116 e!501481)))

(declare-fun c!94946 () Bool)

(assert (=> d!111205 (= c!94946 (bvsge #b00000000000000000000000000000000 (size!25727 (_keys!10124 thiss!1181))))))

(assert (=> d!111205 (and (bvsle #b00000000000000000000000000000000 (size!25727 (_keys!10124 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25727 (_keys!10124 thiss!1181)) (size!25727 (_keys!10124 thiss!1181))))))

(assert (=> d!111205 (= (arrayCountValidKeys!0 (_keys!10124 thiss!1181) #b00000000000000000000000000000000 (size!25727 (_keys!10124 thiss!1181))) lt!405116)))

(declare-fun b!897138 () Bool)

(assert (=> b!897138 (= e!501481 #b00000000000000000000000000000000)))

(assert (= (and d!111205 c!94946) b!897138))

(assert (= (and d!111205 (not c!94946)) b!897139))

(assert (= (and b!897139 c!94945) b!897136))

(assert (= (and b!897139 (not c!94945)) b!897137))

(assert (= (or b!897136 b!897137) bm!39820))

(declare-fun m!834791 () Bool)

(assert (=> bm!39820 m!834791))

(assert (=> b!897139 m!834775))

(assert (=> b!897139 m!834775))

(assert (=> b!897139 m!834785))

(assert (=> b!897060 d!111205))

(declare-fun d!111207 () Bool)

(assert (=> d!111207 (= (inRange!0 (index!37748 lt!405077) (mask!26038 thiss!1181)) (and (bvsge (index!37748 lt!405077) #b00000000000000000000000000000000) (bvslt (index!37748 lt!405077) (bvadd (mask!26038 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897035 d!111207))

(declare-fun e!501491 () SeekEntryResult!8844)

(declare-fun b!897152 () Bool)

(assert (=> b!897152 (= e!501491 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76250 lt!405088) #b00000000000000000000000000000001) (nextIndex!0 (index!37749 lt!405088) (bvadd (x!76250 lt!405088) #b00000000000000000000000000000001) (mask!26038 thiss!1181)) (index!37749 lt!405088) key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)))))

(declare-fun b!897153 () Bool)

(declare-fun c!94953 () Bool)

(declare-fun lt!405122 () (_ BitVec 64))

(assert (=> b!897153 (= c!94953 (= lt!405122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501489 () SeekEntryResult!8844)

(assert (=> b!897153 (= e!501489 e!501491)))

(declare-fun b!897154 () Bool)

(declare-fun e!501490 () SeekEntryResult!8844)

(assert (=> b!897154 (= e!501490 e!501489)))

(declare-fun c!94955 () Bool)

(assert (=> b!897154 (= c!94955 (= lt!405122 key!785))))

(declare-fun b!897155 () Bool)

(assert (=> b!897155 (= e!501489 (Found!8844 (index!37749 lt!405088)))))

(declare-fun b!897156 () Bool)

(assert (=> b!897156 (= e!501490 Undefined!8844)))

(declare-fun b!897157 () Bool)

(assert (=> b!897157 (= e!501491 (MissingVacant!8844 (index!37749 lt!405088)))))

(declare-fun lt!405121 () SeekEntryResult!8844)

(declare-fun d!111209 () Bool)

(assert (=> d!111209 (and (or ((_ is Undefined!8844) lt!405121) (not ((_ is Found!8844) lt!405121)) (and (bvsge (index!37748 lt!405121) #b00000000000000000000000000000000) (bvslt (index!37748 lt!405121) (size!25727 (_keys!10124 thiss!1181))))) (or ((_ is Undefined!8844) lt!405121) ((_ is Found!8844) lt!405121) (not ((_ is MissingVacant!8844) lt!405121)) (not (= (index!37750 lt!405121) (index!37749 lt!405088))) (and (bvsge (index!37750 lt!405121) #b00000000000000000000000000000000) (bvslt (index!37750 lt!405121) (size!25727 (_keys!10124 thiss!1181))))) (or ((_ is Undefined!8844) lt!405121) (ite ((_ is Found!8844) lt!405121) (= (select (arr!25276 (_keys!10124 thiss!1181)) (index!37748 lt!405121)) key!785) (and ((_ is MissingVacant!8844) lt!405121) (= (index!37750 lt!405121) (index!37749 lt!405088)) (= (select (arr!25276 (_keys!10124 thiss!1181)) (index!37750 lt!405121)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111209 (= lt!405121 e!501490)))

(declare-fun c!94954 () Bool)

(assert (=> d!111209 (= c!94954 (bvsge (x!76250 lt!405088) #b01111111111111111111111111111110))))

(assert (=> d!111209 (= lt!405122 (select (arr!25276 (_keys!10124 thiss!1181)) (index!37749 lt!405088)))))

(assert (=> d!111209 (validMask!0 (mask!26038 thiss!1181))))

(assert (=> d!111209 (= (seekKeyOrZeroReturnVacant!0 (x!76250 lt!405088) (index!37749 lt!405088) (index!37749 lt!405088) key!785 (_keys!10124 thiss!1181) (mask!26038 thiss!1181)) lt!405121)))

(assert (= (and d!111209 c!94954) b!897156))

(assert (= (and d!111209 (not c!94954)) b!897154))

(assert (= (and b!897154 c!94955) b!897155))

(assert (= (and b!897154 (not c!94955)) b!897153))

(assert (= (and b!897153 c!94953) b!897157))

(assert (= (and b!897153 (not c!94953)) b!897152))

(declare-fun m!834793 () Bool)

(assert (=> b!897152 m!834793))

(assert (=> b!897152 m!834793))

(declare-fun m!834795 () Bool)

(assert (=> b!897152 m!834795))

(declare-fun m!834797 () Bool)

(assert (=> d!111209 m!834797))

(declare-fun m!834799 () Bool)

(assert (=> d!111209 m!834799))

(assert (=> d!111209 m!834747))

(assert (=> d!111209 m!834741))

(assert (=> b!897048 d!111209))

(declare-fun b!897169 () Bool)

(declare-fun e!501494 () Bool)

(assert (=> b!897169 (= e!501494 (and (bvsge (extraKeys!5069 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5069 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2214 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!897168 () Bool)

(declare-fun res!606407 () Bool)

(assert (=> b!897168 (=> (not res!606407) (not e!501494))))

(declare-fun size!25733 (LongMapFixedSize!4318) (_ BitVec 32))

(assert (=> b!897168 (= res!606407 (= (size!25733 thiss!1181) (bvadd (_size!2214 thiss!1181) (bvsdiv (bvadd (extraKeys!5069 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!897167 () Bool)

(declare-fun res!606409 () Bool)

(assert (=> b!897167 (=> (not res!606409) (not e!501494))))

(assert (=> b!897167 (= res!606409 (bvsge (size!25733 thiss!1181) (_size!2214 thiss!1181)))))

(declare-fun d!111211 () Bool)

(declare-fun res!606408 () Bool)

(assert (=> d!111211 (=> (not res!606408) (not e!501494))))

(assert (=> d!111211 (= res!606408 (validMask!0 (mask!26038 thiss!1181)))))

(assert (=> d!111211 (= (simpleValid!311 thiss!1181) e!501494)))

(declare-fun b!897166 () Bool)

(declare-fun res!606410 () Bool)

(assert (=> b!897166 (=> (not res!606410) (not e!501494))))

(assert (=> b!897166 (= res!606410 (and (= (size!25728 (_values!5360 thiss!1181)) (bvadd (mask!26038 thiss!1181) #b00000000000000000000000000000001)) (= (size!25727 (_keys!10124 thiss!1181)) (size!25728 (_values!5360 thiss!1181))) (bvsge (_size!2214 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2214 thiss!1181) (bvadd (mask!26038 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!111211 res!606408) b!897166))

(assert (= (and b!897166 res!606410) b!897167))

(assert (= (and b!897167 res!606409) b!897168))

(assert (= (and b!897168 res!606407) b!897169))

(declare-fun m!834801 () Bool)

(assert (=> b!897168 m!834801))

(assert (=> b!897167 m!834801))

(assert (=> d!111211 m!834741))

(assert (=> d!111191 d!111211))

(declare-fun mapIsEmpty!29018 () Bool)

(declare-fun mapRes!29018 () Bool)

(assert (=> mapIsEmpty!29018 mapRes!29018))

(declare-fun b!897170 () Bool)

(declare-fun e!501495 () Bool)

(assert (=> b!897170 (= e!501495 tp_is_empty!18265)))

(declare-fun mapNonEmpty!29018 () Bool)

(declare-fun tp!55853 () Bool)

(assert (=> mapNonEmpty!29018 (= mapRes!29018 (and tp!55853 e!501495))))

(declare-fun mapValue!29018 () ValueCell!8651)

(declare-fun mapRest!29018 () (Array (_ BitVec 32) ValueCell!8651))

(declare-fun mapKey!29018 () (_ BitVec 32))

(assert (=> mapNonEmpty!29018 (= mapRest!29017 (store mapRest!29018 mapKey!29018 mapValue!29018))))

(declare-fun b!897171 () Bool)

(declare-fun e!501496 () Bool)

(assert (=> b!897171 (= e!501496 tp_is_empty!18265)))

(declare-fun condMapEmpty!29018 () Bool)

(declare-fun mapDefault!29018 () ValueCell!8651)

(assert (=> mapNonEmpty!29017 (= condMapEmpty!29018 (= mapRest!29017 ((as const (Array (_ BitVec 32) ValueCell!8651)) mapDefault!29018)))))

(assert (=> mapNonEmpty!29017 (= tp!55852 (and e!501496 mapRes!29018))))

(assert (= (and mapNonEmpty!29017 condMapEmpty!29018) mapIsEmpty!29018))

(assert (= (and mapNonEmpty!29017 (not condMapEmpty!29018)) mapNonEmpty!29018))

(assert (= (and mapNonEmpty!29018 ((_ is ValueCellFull!8651) mapValue!29018)) b!897170))

(assert (= (and mapNonEmpty!29017 ((_ is ValueCellFull!8651) mapDefault!29018)) b!897171))

(declare-fun m!834803 () Bool)

(assert (=> mapNonEmpty!29018 m!834803))

(check-sat (not d!111199) (not b_next!15937) (not bm!39814) (not b!897090) (not mapNonEmpty!29018) (not b!897112) (not b!897125) b_and!26239 (not d!111193) (not d!111211) (not d!111209) (not b!897100) tp_is_empty!18265 (not b!897152) (not b!897168) (not b!897139) (not b!897126) (not b!897124) (not b!897111) (not bm!39817) (not bm!39820) (not b!897167))
(check-sat b_and!26239 (not b_next!15937))
