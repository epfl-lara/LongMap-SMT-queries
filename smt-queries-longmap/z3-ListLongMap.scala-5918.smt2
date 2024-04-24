; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76942 () Bool)

(assert start!76942)

(declare-fun b!899146 () Bool)

(declare-fun b_free!16009 () Bool)

(declare-fun b_next!16009 () Bool)

(assert (=> b!899146 (= b_free!16009 (not b_next!16009))))

(declare-fun tp!56093 () Bool)

(declare-fun b_and!26311 () Bool)

(assert (=> b!899146 (= tp!56093 b_and!26311)))

(declare-fun b!899140 () Bool)

(declare-fun res!607405 () Bool)

(declare-fun e!503003 () Bool)

(assert (=> b!899140 (=> (not res!607405) (not e!503003))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!899140 (= res!607405 (not (= key!785 (bvneg key!785))))))

(declare-fun res!607404 () Bool)

(assert (=> start!76942 (=> (not res!607404) (not e!503003))))

(declare-datatypes ((array!52749 0))(
  ( (array!52750 (arr!25348 (Array (_ BitVec 32) (_ BitVec 64))) (size!25804 (_ BitVec 32))) )
))
(declare-datatypes ((V!29415 0))(
  ( (V!29416 (val!9219 Int)) )
))
(declare-datatypes ((ValueCell!8687 0))(
  ( (ValueCellFull!8687 (v!11706 V!29415)) (EmptyCell!8687) )
))
(declare-datatypes ((array!52751 0))(
  ( (array!52752 (arr!25349 (Array (_ BitVec 32) ValueCell!8687)) (size!25805 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4390 0))(
  ( (LongMapFixedSize!4391 (defaultEntry!5407 Int) (mask!26174 (_ BitVec 32)) (extraKeys!5122 (_ BitVec 32)) (zeroValue!5226 V!29415) (minValue!5226 V!29415) (_size!2250 (_ BitVec 32)) (_keys!10208 array!52749) (_values!5413 array!52751) (_vacant!2250 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4390)

(declare-fun valid!1700 (LongMapFixedSize!4390) Bool)

(assert (=> start!76942 (= res!607404 (valid!1700 thiss!1181))))

(assert (=> start!76942 e!503003))

(declare-fun e!503002 () Bool)

(assert (=> start!76942 e!503002))

(assert (=> start!76942 true))

(declare-fun b!899141 () Bool)

(declare-fun e!503000 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899141 (= e!503000 (validMask!0 (mask!26174 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8876 0))(
  ( (MissingZero!8876 (index!37875 (_ BitVec 32))) (Found!8876 (index!37876 (_ BitVec 32))) (Intermediate!8876 (undefined!9688 Bool) (index!37877 (_ BitVec 32)) (x!76519 (_ BitVec 32))) (Undefined!8876) (MissingVacant!8876 (index!37878 (_ BitVec 32))) )
))
(declare-fun lt!405815 () SeekEntryResult!8876)

(declare-datatypes ((tuple2!11946 0))(
  ( (tuple2!11947 (_1!5984 (_ BitVec 64)) (_2!5984 V!29415)) )
))
(declare-datatypes ((List!17787 0))(
  ( (Nil!17784) (Cons!17783 (h!18931 tuple2!11946) (t!25118 List!17787)) )
))
(declare-datatypes ((ListLongMap!10645 0))(
  ( (ListLongMap!10646 (toList!5338 List!17787)) )
))
(declare-fun contains!4379 (ListLongMap!10645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2610 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) ListLongMap!10645)

(assert (=> b!899141 (contains!4379 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815)))))

(declare-datatypes ((Unit!30520 0))(
  ( (Unit!30521) )
))
(declare-fun lt!405816 () Unit!30520)

(declare-fun lemmaValidKeyInArrayIsInListMap!240 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) Unit!30520)

(assert (=> b!899141 (= lt!405816 (lemmaValidKeyInArrayIsInListMap!240 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!37876 lt!405815) (defaultEntry!5407 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899141 (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405817 () Unit!30520)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52749 (_ BitVec 64) (_ BitVec 32)) Unit!30520)

(assert (=> b!899141 (= lt!405817 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10208 thiss!1181) key!785 (index!37876 lt!405815)))))

(declare-fun b!899142 () Bool)

(declare-fun e!503006 () Bool)

(declare-fun e!503005 () Bool)

(declare-fun mapRes!29157 () Bool)

(assert (=> b!899142 (= e!503006 (and e!503005 mapRes!29157))))

(declare-fun condMapEmpty!29157 () Bool)

(declare-fun mapDefault!29157 () ValueCell!8687)

(assert (=> b!899142 (= condMapEmpty!29157 (= (arr!25349 (_values!5413 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8687)) mapDefault!29157)))))

(declare-fun b!899143 () Bool)

(assert (=> b!899143 (= e!503003 (not e!503000))))

(declare-fun res!607406 () Bool)

(assert (=> b!899143 (=> res!607406 e!503000)))

(get-info :version)

(assert (=> b!899143 (= res!607406 (not ((_ is Found!8876) lt!405815)))))

(declare-fun e!502999 () Bool)

(assert (=> b!899143 e!502999))

(declare-fun res!607403 () Bool)

(assert (=> b!899143 (=> res!607403 e!502999)))

(assert (=> b!899143 (= res!607403 (not ((_ is Found!8876) lt!405815)))))

(declare-fun lt!405818 () Unit!30520)

(declare-fun lemmaSeekEntryGivesInRangeIndex!97 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 64)) Unit!30520)

(assert (=> b!899143 (= lt!405818 (lemmaSeekEntryGivesInRangeIndex!97 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8876)

(assert (=> b!899143 (= lt!405815 (seekEntry!0 key!785 (_keys!10208 thiss!1181) (mask!26174 thiss!1181)))))

(declare-fun mapNonEmpty!29157 () Bool)

(declare-fun tp!56094 () Bool)

(declare-fun e!503001 () Bool)

(assert (=> mapNonEmpty!29157 (= mapRes!29157 (and tp!56094 e!503001))))

(declare-fun mapKey!29157 () (_ BitVec 32))

(declare-fun mapRest!29157 () (Array (_ BitVec 32) ValueCell!8687))

(declare-fun mapValue!29157 () ValueCell!8687)

(assert (=> mapNonEmpty!29157 (= (arr!25349 (_values!5413 thiss!1181)) (store mapRest!29157 mapKey!29157 mapValue!29157))))

(declare-fun b!899144 () Bool)

(declare-fun tp_is_empty!18337 () Bool)

(assert (=> b!899144 (= e!503005 tp_is_empty!18337)))

(declare-fun mapIsEmpty!29157 () Bool)

(assert (=> mapIsEmpty!29157 mapRes!29157))

(declare-fun b!899145 () Bool)

(assert (=> b!899145 (= e!503001 tp_is_empty!18337)))

(declare-fun array_inv!19948 (array!52749) Bool)

(declare-fun array_inv!19949 (array!52751) Bool)

(assert (=> b!899146 (= e!503002 (and tp!56093 tp_is_empty!18337 (array_inv!19948 (_keys!10208 thiss!1181)) (array_inv!19949 (_values!5413 thiss!1181)) e!503006))))

(declare-fun b!899147 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899147 (= e!502999 (inRange!0 (index!37876 lt!405815) (mask!26174 thiss!1181)))))

(assert (= (and start!76942 res!607404) b!899140))

(assert (= (and b!899140 res!607405) b!899143))

(assert (= (and b!899143 (not res!607403)) b!899147))

(assert (= (and b!899143 (not res!607406)) b!899141))

(assert (= (and b!899142 condMapEmpty!29157) mapIsEmpty!29157))

(assert (= (and b!899142 (not condMapEmpty!29157)) mapNonEmpty!29157))

(assert (= (and mapNonEmpty!29157 ((_ is ValueCellFull!8687) mapValue!29157)) b!899145))

(assert (= (and b!899142 ((_ is ValueCellFull!8687) mapDefault!29157)) b!899144))

(assert (= b!899146 b!899142))

(assert (= start!76942 b!899146))

(declare-fun m!836043 () Bool)

(assert (=> b!899146 m!836043))

(declare-fun m!836045 () Bool)

(assert (=> b!899146 m!836045))

(declare-fun m!836047 () Bool)

(assert (=> b!899147 m!836047))

(declare-fun m!836049 () Bool)

(assert (=> start!76942 m!836049))

(declare-fun m!836051 () Bool)

(assert (=> mapNonEmpty!29157 m!836051))

(declare-fun m!836053 () Bool)

(assert (=> b!899141 m!836053))

(declare-fun m!836055 () Bool)

(assert (=> b!899141 m!836055))

(declare-fun m!836057 () Bool)

(assert (=> b!899141 m!836057))

(declare-fun m!836059 () Bool)

(assert (=> b!899141 m!836059))

(assert (=> b!899141 m!836055))

(declare-fun m!836061 () Bool)

(assert (=> b!899141 m!836061))

(assert (=> b!899141 m!836053))

(declare-fun m!836063 () Bool)

(assert (=> b!899141 m!836063))

(declare-fun m!836065 () Bool)

(assert (=> b!899141 m!836065))

(declare-fun m!836067 () Bool)

(assert (=> b!899143 m!836067))

(declare-fun m!836069 () Bool)

(assert (=> b!899143 m!836069))

(check-sat b_and!26311 (not b!899146) (not b!899143) (not start!76942) tp_is_empty!18337 (not b_next!16009) (not b!899147) (not b!899141) (not mapNonEmpty!29157))
(check-sat b_and!26311 (not b_next!16009))
(get-model)

(declare-fun d!111535 () Bool)

(assert (=> d!111535 (= (array_inv!19948 (_keys!10208 thiss!1181)) (bvsge (size!25804 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899146 d!111535))

(declare-fun d!111537 () Bool)

(assert (=> d!111537 (= (array_inv!19949 (_values!5413 thiss!1181)) (bvsge (size!25805 (_values!5413 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899146 d!111537))

(declare-fun d!111539 () Bool)

(declare-fun e!503057 () Bool)

(assert (=> d!111539 e!503057))

(declare-fun res!607433 () Bool)

(assert (=> d!111539 (=> res!607433 e!503057)))

(declare-fun lt!405848 () SeekEntryResult!8876)

(assert (=> d!111539 (= res!607433 (not ((_ is Found!8876) lt!405848)))))

(assert (=> d!111539 (= lt!405848 (seekEntry!0 key!785 (_keys!10208 thiss!1181) (mask!26174 thiss!1181)))))

(declare-fun lt!405847 () Unit!30520)

(declare-fun choose!1494 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 64)) Unit!30520)

(assert (=> d!111539 (= lt!405847 (choose!1494 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) key!785))))

(assert (=> d!111539 (validMask!0 (mask!26174 thiss!1181))))

(assert (=> d!111539 (= (lemmaSeekEntryGivesInRangeIndex!97 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) key!785) lt!405847)))

(declare-fun b!899198 () Bool)

(assert (=> b!899198 (= e!503057 (inRange!0 (index!37876 lt!405848) (mask!26174 thiss!1181)))))

(assert (= (and d!111539 (not res!607433)) b!899198))

(assert (=> d!111539 m!836069))

(declare-fun m!836127 () Bool)

(assert (=> d!111539 m!836127))

(assert (=> d!111539 m!836061))

(declare-fun m!836129 () Bool)

(assert (=> b!899198 m!836129))

(assert (=> b!899143 d!111539))

(declare-fun b!899211 () Bool)

(declare-fun e!503064 () SeekEntryResult!8876)

(assert (=> b!899211 (= e!503064 Undefined!8876)))

(declare-fun b!899212 () Bool)

(declare-fun e!503066 () SeekEntryResult!8876)

(declare-fun lt!405859 () SeekEntryResult!8876)

(assert (=> b!899212 (= e!503066 (MissingZero!8876 (index!37877 lt!405859)))))

(declare-fun b!899213 () Bool)

(declare-fun c!95204 () Bool)

(declare-fun lt!405858 () (_ BitVec 64))

(assert (=> b!899213 (= c!95204 (= lt!405858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503065 () SeekEntryResult!8876)

(assert (=> b!899213 (= e!503065 e!503066)))

(declare-fun b!899214 () Bool)

(assert (=> b!899214 (= e!503064 e!503065)))

(assert (=> b!899214 (= lt!405858 (select (arr!25348 (_keys!10208 thiss!1181)) (index!37877 lt!405859)))))

(declare-fun c!95202 () Bool)

(assert (=> b!899214 (= c!95202 (= lt!405858 key!785))))

(declare-fun b!899215 () Bool)

(declare-fun lt!405860 () SeekEntryResult!8876)

(assert (=> b!899215 (= e!503066 (ite ((_ is MissingVacant!8876) lt!405860) (MissingZero!8876 (index!37878 lt!405860)) lt!405860))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8876)

(assert (=> b!899215 (= lt!405860 (seekKeyOrZeroReturnVacant!0 (x!76519 lt!405859) (index!37877 lt!405859) (index!37877 lt!405859) key!785 (_keys!10208 thiss!1181) (mask!26174 thiss!1181)))))

(declare-fun b!899216 () Bool)

(assert (=> b!899216 (= e!503065 (Found!8876 (index!37877 lt!405859)))))

(declare-fun d!111541 () Bool)

(declare-fun lt!405857 () SeekEntryResult!8876)

(assert (=> d!111541 (and (or ((_ is MissingVacant!8876) lt!405857) (not ((_ is Found!8876) lt!405857)) (and (bvsge (index!37876 lt!405857) #b00000000000000000000000000000000) (bvslt (index!37876 lt!405857) (size!25804 (_keys!10208 thiss!1181))))) (not ((_ is MissingVacant!8876) lt!405857)) (or (not ((_ is Found!8876) lt!405857)) (= (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405857)) key!785)))))

(assert (=> d!111541 (= lt!405857 e!503064)))

(declare-fun c!95203 () Bool)

(assert (=> d!111541 (= c!95203 (and ((_ is Intermediate!8876) lt!405859) (undefined!9688 lt!405859)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52749 (_ BitVec 32)) SeekEntryResult!8876)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111541 (= lt!405859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26174 thiss!1181)) key!785 (_keys!10208 thiss!1181) (mask!26174 thiss!1181)))))

(assert (=> d!111541 (validMask!0 (mask!26174 thiss!1181))))

(assert (=> d!111541 (= (seekEntry!0 key!785 (_keys!10208 thiss!1181) (mask!26174 thiss!1181)) lt!405857)))

(assert (= (and d!111541 c!95203) b!899211))

(assert (= (and d!111541 (not c!95203)) b!899214))

(assert (= (and b!899214 c!95202) b!899216))

(assert (= (and b!899214 (not c!95202)) b!899213))

(assert (= (and b!899213 c!95204) b!899212))

(assert (= (and b!899213 (not c!95204)) b!899215))

(declare-fun m!836131 () Bool)

(assert (=> b!899214 m!836131))

(declare-fun m!836133 () Bool)

(assert (=> b!899215 m!836133))

(declare-fun m!836135 () Bool)

(assert (=> d!111541 m!836135))

(declare-fun m!836137 () Bool)

(assert (=> d!111541 m!836137))

(assert (=> d!111541 m!836137))

(declare-fun m!836139 () Bool)

(assert (=> d!111541 m!836139))

(assert (=> d!111541 m!836061))

(assert (=> b!899143 d!111541))

(declare-fun d!111543 () Bool)

(assert (=> d!111543 (= (inRange!0 (index!37876 lt!405815) (mask!26174 thiss!1181)) (and (bvsge (index!37876 lt!405815) #b00000000000000000000000000000000) (bvslt (index!37876 lt!405815) (bvadd (mask!26174 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899147 d!111543))

(declare-fun d!111545 () Bool)

(declare-fun e!503071 () Bool)

(assert (=> d!111545 e!503071))

(declare-fun res!607436 () Bool)

(assert (=> d!111545 (=> res!607436 e!503071)))

(declare-fun lt!405869 () Bool)

(assert (=> d!111545 (= res!607436 (not lt!405869))))

(declare-fun lt!405871 () Bool)

(assert (=> d!111545 (= lt!405869 lt!405871)))

(declare-fun lt!405870 () Unit!30520)

(declare-fun e!503072 () Unit!30520)

(assert (=> d!111545 (= lt!405870 e!503072)))

(declare-fun c!95207 () Bool)

(assert (=> d!111545 (= c!95207 lt!405871)))

(declare-fun containsKey!426 (List!17787 (_ BitVec 64)) Bool)

(assert (=> d!111545 (= lt!405871 (containsKey!426 (toList!5338 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815))))))

(assert (=> d!111545 (= (contains!4379 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815))) lt!405869)))

(declare-fun b!899223 () Bool)

(declare-fun lt!405872 () Unit!30520)

(assert (=> b!899223 (= e!503072 lt!405872)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!320 (List!17787 (_ BitVec 64)) Unit!30520)

(assert (=> b!899223 (= lt!405872 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5338 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815))))))

(declare-datatypes ((Option!459 0))(
  ( (Some!458 (v!11709 V!29415)) (None!457) )
))
(declare-fun isDefined!328 (Option!459) Bool)

(declare-fun getValueByKey!453 (List!17787 (_ BitVec 64)) Option!459)

(assert (=> b!899223 (isDefined!328 (getValueByKey!453 (toList!5338 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815))))))

(declare-fun b!899224 () Bool)

(declare-fun Unit!30526 () Unit!30520)

(assert (=> b!899224 (= e!503072 Unit!30526)))

(declare-fun b!899225 () Bool)

(assert (=> b!899225 (= e!503071 (isDefined!328 (getValueByKey!453 (toList!5338 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815)))))))

(assert (= (and d!111545 c!95207) b!899223))

(assert (= (and d!111545 (not c!95207)) b!899224))

(assert (= (and d!111545 (not res!607436)) b!899225))

(assert (=> d!111545 m!836055))

(declare-fun m!836141 () Bool)

(assert (=> d!111545 m!836141))

(assert (=> b!899223 m!836055))

(declare-fun m!836143 () Bool)

(assert (=> b!899223 m!836143))

(assert (=> b!899223 m!836055))

(declare-fun m!836145 () Bool)

(assert (=> b!899223 m!836145))

(assert (=> b!899223 m!836145))

(declare-fun m!836147 () Bool)

(assert (=> b!899223 m!836147))

(assert (=> b!899225 m!836055))

(assert (=> b!899225 m!836145))

(assert (=> b!899225 m!836145))

(assert (=> b!899225 m!836147))

(assert (=> b!899141 d!111545))

(declare-fun d!111547 () Bool)

(assert (=> d!111547 (= (validMask!0 (mask!26174 thiss!1181)) (and (or (= (mask!26174 thiss!1181) #b00000000000000000000000000000111) (= (mask!26174 thiss!1181) #b00000000000000000000000000001111) (= (mask!26174 thiss!1181) #b00000000000000000000000000011111) (= (mask!26174 thiss!1181) #b00000000000000000000000000111111) (= (mask!26174 thiss!1181) #b00000000000000000000000001111111) (= (mask!26174 thiss!1181) #b00000000000000000000000011111111) (= (mask!26174 thiss!1181) #b00000000000000000000000111111111) (= (mask!26174 thiss!1181) #b00000000000000000000001111111111) (= (mask!26174 thiss!1181) #b00000000000000000000011111111111) (= (mask!26174 thiss!1181) #b00000000000000000000111111111111) (= (mask!26174 thiss!1181) #b00000000000000000001111111111111) (= (mask!26174 thiss!1181) #b00000000000000000011111111111111) (= (mask!26174 thiss!1181) #b00000000000000000111111111111111) (= (mask!26174 thiss!1181) #b00000000000000001111111111111111) (= (mask!26174 thiss!1181) #b00000000000000011111111111111111) (= (mask!26174 thiss!1181) #b00000000000000111111111111111111) (= (mask!26174 thiss!1181) #b00000000000001111111111111111111) (= (mask!26174 thiss!1181) #b00000000000011111111111111111111) (= (mask!26174 thiss!1181) #b00000000000111111111111111111111) (= (mask!26174 thiss!1181) #b00000000001111111111111111111111) (= (mask!26174 thiss!1181) #b00000000011111111111111111111111) (= (mask!26174 thiss!1181) #b00000000111111111111111111111111) (= (mask!26174 thiss!1181) #b00000001111111111111111111111111) (= (mask!26174 thiss!1181) #b00000011111111111111111111111111) (= (mask!26174 thiss!1181) #b00000111111111111111111111111111) (= (mask!26174 thiss!1181) #b00001111111111111111111111111111) (= (mask!26174 thiss!1181) #b00011111111111111111111111111111) (= (mask!26174 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26174 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899141 d!111547))

(declare-fun d!111549 () Bool)

(declare-fun res!607441 () Bool)

(declare-fun e!503077 () Bool)

(assert (=> d!111549 (=> res!607441 e!503077)))

(assert (=> d!111549 (= res!607441 (= (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111549 (= (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 #b00000000000000000000000000000000) e!503077)))

(declare-fun b!899230 () Bool)

(declare-fun e!503078 () Bool)

(assert (=> b!899230 (= e!503077 e!503078)))

(declare-fun res!607442 () Bool)

(assert (=> b!899230 (=> (not res!607442) (not e!503078))))

(assert (=> b!899230 (= res!607442 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25804 (_keys!10208 thiss!1181))))))

(declare-fun b!899231 () Bool)

(assert (=> b!899231 (= e!503078 (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111549 (not res!607441)) b!899230))

(assert (= (and b!899230 res!607442) b!899231))

(declare-fun m!836149 () Bool)

(assert (=> d!111549 m!836149))

(declare-fun m!836151 () Bool)

(assert (=> b!899231 m!836151))

(assert (=> b!899141 d!111549))

(declare-fun d!111551 () Bool)

(assert (=> d!111551 (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405875 () Unit!30520)

(declare-fun choose!13 (array!52749 (_ BitVec 64) (_ BitVec 32)) Unit!30520)

(assert (=> d!111551 (= lt!405875 (choose!13 (_keys!10208 thiss!1181) key!785 (index!37876 lt!405815)))))

(assert (=> d!111551 (bvsge (index!37876 lt!405815) #b00000000000000000000000000000000)))

(assert (=> d!111551 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10208 thiss!1181) key!785 (index!37876 lt!405815)) lt!405875)))

(declare-fun bs!25223 () Bool)

(assert (= bs!25223 d!111551))

(assert (=> bs!25223 m!836059))

(declare-fun m!836153 () Bool)

(assert (=> bs!25223 m!836153))

(assert (=> b!899141 d!111551))

(declare-fun d!111553 () Bool)

(declare-fun e!503105 () Bool)

(assert (=> d!111553 e!503105))

(declare-fun res!607464 () Bool)

(assert (=> d!111553 (=> (not res!607464) (not e!503105))))

(assert (=> d!111553 (= res!607464 (or (bvsge #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))))))))

(declare-fun lt!405932 () ListLongMap!10645)

(declare-fun lt!405935 () ListLongMap!10645)

(assert (=> d!111553 (= lt!405932 lt!405935)))

(declare-fun lt!405933 () Unit!30520)

(declare-fun e!503115 () Unit!30520)

(assert (=> d!111553 (= lt!405933 e!503115)))

(declare-fun c!95224 () Bool)

(declare-fun e!503108 () Bool)

(assert (=> d!111553 (= c!95224 e!503108)))

(declare-fun res!607463 () Bool)

(assert (=> d!111553 (=> (not res!607463) (not e!503108))))

(assert (=> d!111553 (= res!607463 (bvslt #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))))))

(declare-fun e!503114 () ListLongMap!10645)

(assert (=> d!111553 (= lt!405935 e!503114)))

(declare-fun c!95225 () Bool)

(assert (=> d!111553 (= c!95225 (and (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111553 (validMask!0 (mask!26174 thiss!1181))))

(assert (=> d!111553 (= (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) lt!405932)))

(declare-fun b!899274 () Bool)

(declare-fun e!503110 () Bool)

(declare-fun call!39899 () Bool)

(assert (=> b!899274 (= e!503110 (not call!39899))))

(declare-fun bm!39892 () Bool)

(assert (=> bm!39892 (= call!39899 (contains!4379 lt!405932 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899275 () Bool)

(declare-fun e!503106 () ListLongMap!10645)

(declare-fun call!39901 () ListLongMap!10645)

(assert (=> b!899275 (= e!503106 call!39901)))

(declare-fun bm!39893 () Bool)

(declare-fun call!39897 () Bool)

(assert (=> bm!39893 (= call!39897 (contains!4379 lt!405932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899276 () Bool)

(declare-fun e!503112 () ListLongMap!10645)

(assert (=> b!899276 (= e!503114 e!503112)))

(declare-fun c!95221 () Bool)

(assert (=> b!899276 (= c!95221 (and (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899277 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899277 (= e!503108 (validKeyInArray!0 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899278 () Bool)

(declare-fun call!39896 () ListLongMap!10645)

(declare-fun +!2600 (ListLongMap!10645 tuple2!11946) ListLongMap!10645)

(assert (=> b!899278 (= e!503114 (+!2600 call!39896 (tuple2!11947 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5226 thiss!1181))))))

(declare-fun b!899279 () Bool)

(assert (=> b!899279 (= e!503112 call!39901)))

(declare-fun b!899280 () Bool)

(declare-fun call!39900 () ListLongMap!10645)

(assert (=> b!899280 (= e!503106 call!39900)))

(declare-fun b!899281 () Bool)

(declare-fun lt!405921 () Unit!30520)

(assert (=> b!899281 (= e!503115 lt!405921)))

(declare-fun lt!405937 () ListLongMap!10645)

(declare-fun getCurrentListMapNoExtraKeys!3321 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) ListLongMap!10645)

(assert (=> b!899281 (= lt!405937 (getCurrentListMapNoExtraKeys!3321 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405925 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405925 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405940 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405940 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405926 () Unit!30520)

(declare-fun addStillContains!331 (ListLongMap!10645 (_ BitVec 64) V!29415 (_ BitVec 64)) Unit!30520)

(assert (=> b!899281 (= lt!405926 (addStillContains!331 lt!405937 lt!405925 (zeroValue!5226 thiss!1181) lt!405940))))

(assert (=> b!899281 (contains!4379 (+!2600 lt!405937 (tuple2!11947 lt!405925 (zeroValue!5226 thiss!1181))) lt!405940)))

(declare-fun lt!405936 () Unit!30520)

(assert (=> b!899281 (= lt!405936 lt!405926)))

(declare-fun lt!405920 () ListLongMap!10645)

(assert (=> b!899281 (= lt!405920 (getCurrentListMapNoExtraKeys!3321 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405938 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405938 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405924 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405924 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405927 () Unit!30520)

(declare-fun addApplyDifferent!331 (ListLongMap!10645 (_ BitVec 64) V!29415 (_ BitVec 64)) Unit!30520)

(assert (=> b!899281 (= lt!405927 (addApplyDifferent!331 lt!405920 lt!405938 (minValue!5226 thiss!1181) lt!405924))))

(declare-fun apply!405 (ListLongMap!10645 (_ BitVec 64)) V!29415)

(assert (=> b!899281 (= (apply!405 (+!2600 lt!405920 (tuple2!11947 lt!405938 (minValue!5226 thiss!1181))) lt!405924) (apply!405 lt!405920 lt!405924))))

(declare-fun lt!405939 () Unit!30520)

(assert (=> b!899281 (= lt!405939 lt!405927)))

(declare-fun lt!405931 () ListLongMap!10645)

(assert (=> b!899281 (= lt!405931 (getCurrentListMapNoExtraKeys!3321 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405930 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405922 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405922 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405929 () Unit!30520)

(assert (=> b!899281 (= lt!405929 (addApplyDifferent!331 lt!405931 lt!405930 (zeroValue!5226 thiss!1181) lt!405922))))

(assert (=> b!899281 (= (apply!405 (+!2600 lt!405931 (tuple2!11947 lt!405930 (zeroValue!5226 thiss!1181))) lt!405922) (apply!405 lt!405931 lt!405922))))

(declare-fun lt!405928 () Unit!30520)

(assert (=> b!899281 (= lt!405928 lt!405929)))

(declare-fun lt!405934 () ListLongMap!10645)

(assert (=> b!899281 (= lt!405934 (getCurrentListMapNoExtraKeys!3321 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405923 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405923 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405941 () (_ BitVec 64))

(assert (=> b!899281 (= lt!405941 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899281 (= lt!405921 (addApplyDifferent!331 lt!405934 lt!405923 (minValue!5226 thiss!1181) lt!405941))))

(assert (=> b!899281 (= (apply!405 (+!2600 lt!405934 (tuple2!11947 lt!405923 (minValue!5226 thiss!1181))) lt!405941) (apply!405 lt!405934 lt!405941))))

(declare-fun b!899282 () Bool)

(declare-fun e!503109 () Bool)

(assert (=> b!899282 (= e!503109 (= (apply!405 lt!405932 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5226 thiss!1181)))))

(declare-fun b!899283 () Bool)

(declare-fun e!503107 () Bool)

(declare-fun get!13340 (ValueCell!8687 V!29415) V!29415)

(declare-fun dynLambda!1320 (Int (_ BitVec 64)) V!29415)

(assert (=> b!899283 (= e!503107 (= (apply!405 lt!405932 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)) (get!13340 (select (arr!25349 (_values!5413 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1320 (defaultEntry!5407 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899283 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25805 (_values!5413 thiss!1181))))))

(assert (=> b!899283 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))))))

(declare-fun b!899284 () Bool)

(declare-fun e!503116 () Bool)

(assert (=> b!899284 (= e!503116 (not call!39897))))

(declare-fun bm!39894 () Bool)

(declare-fun call!39898 () ListLongMap!10645)

(assert (=> bm!39894 (= call!39900 call!39898)))

(declare-fun b!899285 () Bool)

(declare-fun Unit!30527 () Unit!30520)

(assert (=> b!899285 (= e!503115 Unit!30527)))

(declare-fun bm!39895 () Bool)

(declare-fun call!39895 () ListLongMap!10645)

(assert (=> bm!39895 (= call!39895 (getCurrentListMapNoExtraKeys!3321 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun bm!39896 () Bool)

(assert (=> bm!39896 (= call!39898 call!39895)))

(declare-fun b!899286 () Bool)

(declare-fun e!503117 () Bool)

(assert (=> b!899286 (= e!503116 e!503117)))

(declare-fun res!607467 () Bool)

(assert (=> b!899286 (= res!607467 call!39897)))

(assert (=> b!899286 (=> (not res!607467) (not e!503117))))

(declare-fun b!899287 () Bool)

(declare-fun res!607462 () Bool)

(assert (=> b!899287 (=> (not res!607462) (not e!503105))))

(declare-fun e!503113 () Bool)

(assert (=> b!899287 (= res!607462 e!503113)))

(declare-fun res!607468 () Bool)

(assert (=> b!899287 (=> res!607468 e!503113)))

(declare-fun e!503111 () Bool)

(assert (=> b!899287 (= res!607468 (not e!503111))))

(declare-fun res!607469 () Bool)

(assert (=> b!899287 (=> (not res!607469) (not e!503111))))

(assert (=> b!899287 (= res!607469 (bvslt #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))))))

(declare-fun bm!39897 () Bool)

(assert (=> bm!39897 (= call!39896 (+!2600 (ite c!95225 call!39895 (ite c!95221 call!39898 call!39900)) (ite (or c!95225 c!95221) (tuple2!11947 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5226 thiss!1181)) (tuple2!11947 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5226 thiss!1181)))))))

(declare-fun b!899288 () Bool)

(assert (=> b!899288 (= e!503117 (= (apply!405 lt!405932 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5226 thiss!1181)))))

(declare-fun bm!39898 () Bool)

(assert (=> bm!39898 (= call!39901 call!39896)))

(declare-fun b!899289 () Bool)

(assert (=> b!899289 (= e!503111 (validKeyInArray!0 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899290 () Bool)

(assert (=> b!899290 (= e!503105 e!503110)))

(declare-fun c!95222 () Bool)

(assert (=> b!899290 (= c!95222 (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899291 () Bool)

(declare-fun c!95220 () Bool)

(assert (=> b!899291 (= c!95220 (and (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!899291 (= e!503112 e!503106)))

(declare-fun b!899292 () Bool)

(assert (=> b!899292 (= e!503110 e!503109)))

(declare-fun res!607466 () Bool)

(assert (=> b!899292 (= res!607466 call!39899)))

(assert (=> b!899292 (=> (not res!607466) (not e!503109))))

(declare-fun b!899293 () Bool)

(declare-fun res!607461 () Bool)

(assert (=> b!899293 (=> (not res!607461) (not e!503105))))

(assert (=> b!899293 (= res!607461 e!503116)))

(declare-fun c!95223 () Bool)

(assert (=> b!899293 (= c!95223 (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!899294 () Bool)

(assert (=> b!899294 (= e!503113 e!503107)))

(declare-fun res!607465 () Bool)

(assert (=> b!899294 (=> (not res!607465) (not e!503107))))

(assert (=> b!899294 (= res!607465 (contains!4379 lt!405932 (select (arr!25348 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))))))

(assert (= (and d!111553 c!95225) b!899278))

(assert (= (and d!111553 (not c!95225)) b!899276))

(assert (= (and b!899276 c!95221) b!899279))

(assert (= (and b!899276 (not c!95221)) b!899291))

(assert (= (and b!899291 c!95220) b!899275))

(assert (= (and b!899291 (not c!95220)) b!899280))

(assert (= (or b!899275 b!899280) bm!39894))

(assert (= (or b!899279 bm!39894) bm!39896))

(assert (= (or b!899279 b!899275) bm!39898))

(assert (= (or b!899278 bm!39896) bm!39895))

(assert (= (or b!899278 bm!39898) bm!39897))

(assert (= (and d!111553 res!607463) b!899277))

(assert (= (and d!111553 c!95224) b!899281))

(assert (= (and d!111553 (not c!95224)) b!899285))

(assert (= (and d!111553 res!607464) b!899287))

(assert (= (and b!899287 res!607469) b!899289))

(assert (= (and b!899287 (not res!607468)) b!899294))

(assert (= (and b!899294 res!607465) b!899283))

(assert (= (and b!899287 res!607462) b!899293))

(assert (= (and b!899293 c!95223) b!899286))

(assert (= (and b!899293 (not c!95223)) b!899284))

(assert (= (and b!899286 res!607467) b!899288))

(assert (= (or b!899286 b!899284) bm!39893))

(assert (= (and b!899293 res!607461) b!899290))

(assert (= (and b!899290 c!95222) b!899292))

(assert (= (and b!899290 (not c!95222)) b!899274))

(assert (= (and b!899292 res!607466) b!899282))

(assert (= (or b!899292 b!899274) bm!39892))

(declare-fun b_lambda!12973 () Bool)

(assert (=> (not b_lambda!12973) (not b!899283)))

(declare-fun t!25121 () Bool)

(declare-fun tb!5183 () Bool)

(assert (=> (and b!899146 (= (defaultEntry!5407 thiss!1181) (defaultEntry!5407 thiss!1181)) t!25121) tb!5183))

(declare-fun result!10137 () Bool)

(assert (=> tb!5183 (= result!10137 tp_is_empty!18337)))

(assert (=> b!899283 t!25121))

(declare-fun b_and!26317 () Bool)

(assert (= b_and!26311 (and (=> t!25121 result!10137) b_and!26317)))

(declare-fun m!836155 () Bool)

(assert (=> bm!39892 m!836155))

(declare-fun m!836157 () Bool)

(assert (=> b!899283 m!836157))

(declare-fun m!836159 () Bool)

(assert (=> b!899283 m!836159))

(declare-fun m!836161 () Bool)

(assert (=> b!899283 m!836161))

(assert (=> b!899283 m!836149))

(declare-fun m!836163 () Bool)

(assert (=> b!899283 m!836163))

(assert (=> b!899283 m!836159))

(assert (=> b!899283 m!836149))

(assert (=> b!899283 m!836157))

(assert (=> b!899294 m!836149))

(assert (=> b!899294 m!836149))

(declare-fun m!836165 () Bool)

(assert (=> b!899294 m!836165))

(declare-fun m!836167 () Bool)

(assert (=> bm!39893 m!836167))

(declare-fun m!836169 () Bool)

(assert (=> b!899281 m!836169))

(declare-fun m!836171 () Bool)

(assert (=> b!899281 m!836171))

(declare-fun m!836173 () Bool)

(assert (=> b!899281 m!836173))

(declare-fun m!836175 () Bool)

(assert (=> b!899281 m!836175))

(declare-fun m!836177 () Bool)

(assert (=> b!899281 m!836177))

(declare-fun m!836179 () Bool)

(assert (=> b!899281 m!836179))

(declare-fun m!836181 () Bool)

(assert (=> b!899281 m!836181))

(declare-fun m!836183 () Bool)

(assert (=> b!899281 m!836183))

(declare-fun m!836185 () Bool)

(assert (=> b!899281 m!836185))

(declare-fun m!836187 () Bool)

(assert (=> b!899281 m!836187))

(declare-fun m!836189 () Bool)

(assert (=> b!899281 m!836189))

(declare-fun m!836191 () Bool)

(assert (=> b!899281 m!836191))

(assert (=> b!899281 m!836189))

(declare-fun m!836193 () Bool)

(assert (=> b!899281 m!836193))

(assert (=> b!899281 m!836181))

(assert (=> b!899281 m!836149))

(assert (=> b!899281 m!836173))

(declare-fun m!836195 () Bool)

(assert (=> b!899281 m!836195))

(declare-fun m!836197 () Bool)

(assert (=> b!899281 m!836197))

(assert (=> b!899281 m!836175))

(declare-fun m!836199 () Bool)

(assert (=> b!899281 m!836199))

(declare-fun m!836201 () Bool)

(assert (=> bm!39897 m!836201))

(declare-fun m!836203 () Bool)

(assert (=> b!899278 m!836203))

(assert (=> b!899289 m!836149))

(assert (=> b!899289 m!836149))

(declare-fun m!836205 () Bool)

(assert (=> b!899289 m!836205))

(assert (=> bm!39895 m!836187))

(declare-fun m!836207 () Bool)

(assert (=> b!899282 m!836207))

(assert (=> d!111553 m!836061))

(assert (=> b!899277 m!836149))

(assert (=> b!899277 m!836149))

(assert (=> b!899277 m!836205))

(declare-fun m!836209 () Bool)

(assert (=> b!899288 m!836209))

(assert (=> b!899141 d!111553))

(declare-fun d!111555 () Bool)

(declare-fun e!503120 () Bool)

(assert (=> d!111555 e!503120))

(declare-fun res!607472 () Bool)

(assert (=> d!111555 (=> (not res!607472) (not e!503120))))

(assert (=> d!111555 (= res!607472 (and (bvsge (index!37876 lt!405815) #b00000000000000000000000000000000) (bvslt (index!37876 lt!405815) (size!25804 (_keys!10208 thiss!1181)))))))

(declare-fun lt!405944 () Unit!30520)

(declare-fun choose!1495 (array!52749 array!52751 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) Unit!30520)

(assert (=> d!111555 (= lt!405944 (choose!1495 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!37876 lt!405815) (defaultEntry!5407 thiss!1181)))))

(assert (=> d!111555 (validMask!0 (mask!26174 thiss!1181))))

(assert (=> d!111555 (= (lemmaValidKeyInArrayIsInListMap!240 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!37876 lt!405815) (defaultEntry!5407 thiss!1181)) lt!405944)))

(declare-fun b!899299 () Bool)

(assert (=> b!899299 (= e!503120 (contains!4379 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5413 thiss!1181) (mask!26174 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25348 (_keys!10208 thiss!1181)) (index!37876 lt!405815))))))

(assert (= (and d!111555 res!607472) b!899299))

(declare-fun m!836211 () Bool)

(assert (=> d!111555 m!836211))

(assert (=> d!111555 m!836061))

(assert (=> b!899299 m!836053))

(assert (=> b!899299 m!836055))

(assert (=> b!899299 m!836053))

(assert (=> b!899299 m!836055))

(assert (=> b!899299 m!836057))

(assert (=> b!899141 d!111555))

(declare-fun d!111557 () Bool)

(declare-fun res!607479 () Bool)

(declare-fun e!503123 () Bool)

(assert (=> d!111557 (=> (not res!607479) (not e!503123))))

(declare-fun simpleValid!323 (LongMapFixedSize!4390) Bool)

(assert (=> d!111557 (= res!607479 (simpleValid!323 thiss!1181))))

(assert (=> d!111557 (= (valid!1700 thiss!1181) e!503123)))

(declare-fun b!899306 () Bool)

(declare-fun res!607480 () Bool)

(assert (=> b!899306 (=> (not res!607480) (not e!503123))))

(declare-fun arrayCountValidKeys!0 (array!52749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899306 (= res!607480 (= (arrayCountValidKeys!0 (_keys!10208 thiss!1181) #b00000000000000000000000000000000 (size!25804 (_keys!10208 thiss!1181))) (_size!2250 thiss!1181)))))

(declare-fun b!899307 () Bool)

(declare-fun res!607481 () Bool)

(assert (=> b!899307 (=> (not res!607481) (not e!503123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52749 (_ BitVec 32)) Bool)

(assert (=> b!899307 (= res!607481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10208 thiss!1181) (mask!26174 thiss!1181)))))

(declare-fun b!899308 () Bool)

(declare-datatypes ((List!17789 0))(
  ( (Nil!17786) (Cons!17785 (h!18933 (_ BitVec 64)) (t!25122 List!17789)) )
))
(declare-fun arrayNoDuplicates!0 (array!52749 (_ BitVec 32) List!17789) Bool)

(assert (=> b!899308 (= e!503123 (arrayNoDuplicates!0 (_keys!10208 thiss!1181) #b00000000000000000000000000000000 Nil!17786))))

(assert (= (and d!111557 res!607479) b!899306))

(assert (= (and b!899306 res!607480) b!899307))

(assert (= (and b!899307 res!607481) b!899308))

(declare-fun m!836213 () Bool)

(assert (=> d!111557 m!836213))

(declare-fun m!836215 () Bool)

(assert (=> b!899306 m!836215))

(declare-fun m!836217 () Bool)

(assert (=> b!899307 m!836217))

(declare-fun m!836219 () Bool)

(assert (=> b!899308 m!836219))

(assert (=> start!76942 d!111557))

(declare-fun b!899316 () Bool)

(declare-fun e!503128 () Bool)

(assert (=> b!899316 (= e!503128 tp_is_empty!18337)))

(declare-fun mapNonEmpty!29166 () Bool)

(declare-fun mapRes!29166 () Bool)

(declare-fun tp!56109 () Bool)

(declare-fun e!503129 () Bool)

(assert (=> mapNonEmpty!29166 (= mapRes!29166 (and tp!56109 e!503129))))

(declare-fun mapKey!29166 () (_ BitVec 32))

(declare-fun mapValue!29166 () ValueCell!8687)

(declare-fun mapRest!29166 () (Array (_ BitVec 32) ValueCell!8687))

(assert (=> mapNonEmpty!29166 (= mapRest!29157 (store mapRest!29166 mapKey!29166 mapValue!29166))))

(declare-fun mapIsEmpty!29166 () Bool)

(assert (=> mapIsEmpty!29166 mapRes!29166))

(declare-fun condMapEmpty!29166 () Bool)

(declare-fun mapDefault!29166 () ValueCell!8687)

(assert (=> mapNonEmpty!29157 (= condMapEmpty!29166 (= mapRest!29157 ((as const (Array (_ BitVec 32) ValueCell!8687)) mapDefault!29166)))))

(assert (=> mapNonEmpty!29157 (= tp!56094 (and e!503128 mapRes!29166))))

(declare-fun b!899315 () Bool)

(assert (=> b!899315 (= e!503129 tp_is_empty!18337)))

(assert (= (and mapNonEmpty!29157 condMapEmpty!29166) mapIsEmpty!29166))

(assert (= (and mapNonEmpty!29157 (not condMapEmpty!29166)) mapNonEmpty!29166))

(assert (= (and mapNonEmpty!29166 ((_ is ValueCellFull!8687) mapValue!29166)) b!899315))

(assert (= (and mapNonEmpty!29157 ((_ is ValueCellFull!8687) mapDefault!29166)) b!899316))

(declare-fun m!836221 () Bool)

(assert (=> mapNonEmpty!29166 m!836221))

(declare-fun b_lambda!12975 () Bool)

(assert (= b_lambda!12973 (or (and b!899146 b_free!16009) b_lambda!12975)))

(check-sat (not b!899282) (not d!111557) (not bm!39893) (not b!899278) tp_is_empty!18337 (not b_lambda!12975) (not b_next!16009) (not b!899283) (not d!111541) (not d!111545) (not b!899294) (not b!899281) (not b!899299) (not b!899225) (not b!899277) (not d!111551) (not b!899289) (not b!899308) (not bm!39892) (not mapNonEmpty!29166) (not d!111553) (not bm!39897) (not d!111539) (not b!899223) (not b!899307) (not b!899215) (not b!899231) (not b!899288) b_and!26317 (not bm!39895) (not b!899198) (not d!111555) (not b!899306))
(check-sat b_and!26317 (not b_next!16009))
