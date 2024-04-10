; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91992 () Bool)

(assert start!91992)

(declare-fun b!1046193 () Bool)

(declare-fun b_free!21165 () Bool)

(declare-fun b_next!21165 () Bool)

(assert (=> b!1046193 (= b_free!21165 (not b_next!21165))))

(declare-fun tp!74756 () Bool)

(declare-fun b_and!33825 () Bool)

(assert (=> b!1046193 (= tp!74756 b_and!33825)))

(declare-fun b!1046188 () Bool)

(declare-fun e!593138 () Bool)

(declare-fun e!593132 () Bool)

(declare-fun mapRes!38972 () Bool)

(assert (=> b!1046188 (= e!593138 (and e!593132 mapRes!38972))))

(declare-fun condMapEmpty!38972 () Bool)

(declare-datatypes ((V!38053 0))(
  ( (V!38054 (val!12493 Int)) )
))
(declare-datatypes ((ValueCell!11739 0))(
  ( (ValueCellFull!11739 (v!15090 V!38053)) (EmptyCell!11739) )
))
(declare-datatypes ((array!65948 0))(
  ( (array!65949 (arr!31719 (Array (_ BitVec 32) (_ BitVec 64))) (size!32254 (_ BitVec 32))) )
))
(declare-datatypes ((array!65950 0))(
  ( (array!65951 (arr!31720 (Array (_ BitVec 32) ValueCell!11739)) (size!32255 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6072 0))(
  ( (LongMapFixedSize!6073 (defaultEntry!6434 Int) (mask!30577 (_ BitVec 32)) (extraKeys!6162 (_ BitVec 32)) (zeroValue!6268 V!38053) (minValue!6268 V!38053) (_size!3091 (_ BitVec 32)) (_keys!11708 array!65948) (_values!6457 array!65950) (_vacant!3091 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6072)

(declare-fun mapDefault!38972 () ValueCell!11739)

(assert (=> b!1046188 (= condMapEmpty!38972 (= (arr!31720 (_values!6457 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11739)) mapDefault!38972)))))

(declare-fun b!1046189 () Bool)

(declare-fun e!593139 () Bool)

(declare-fun tp_is_empty!24885 () Bool)

(assert (=> b!1046189 (= e!593139 tp_is_empty!24885)))

(declare-fun b!1046190 () Bool)

(assert (=> b!1046190 (= e!593132 tp_is_empty!24885)))

(declare-fun b!1046192 () Bool)

(declare-fun e!593136 () Bool)

(declare-fun e!593137 () Bool)

(assert (=> b!1046192 (= e!593136 e!593137)))

(declare-fun res!696488 () Bool)

(assert (=> b!1046192 (=> (not res!696488) (not e!593137))))

(declare-datatypes ((SeekEntryResult!9858 0))(
  ( (MissingZero!9858 (index!41803 (_ BitVec 32))) (Found!9858 (index!41804 (_ BitVec 32))) (Intermediate!9858 (undefined!10670 Bool) (index!41805 (_ BitVec 32)) (x!93476 (_ BitVec 32))) (Undefined!9858) (MissingVacant!9858 (index!41806 (_ BitVec 32))) )
))
(declare-fun lt!462124 () SeekEntryResult!9858)

(get-info :version)

(assert (=> b!1046192 (= res!696488 ((_ is Found!9858) lt!462124))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65948 (_ BitVec 32)) SeekEntryResult!9858)

(assert (=> b!1046192 (= lt!462124 (seekEntry!0 key!909 (_keys!11708 thiss!1427) (mask!30577 thiss!1427)))))

(declare-fun e!593131 () Bool)

(declare-fun array_inv!24501 (array!65948) Bool)

(declare-fun array_inv!24502 (array!65950) Bool)

(assert (=> b!1046193 (= e!593131 (and tp!74756 tp_is_empty!24885 (array_inv!24501 (_keys!11708 thiss!1427)) (array_inv!24502 (_values!6457 thiss!1427)) e!593138))))

(declare-fun mapIsEmpty!38972 () Bool)

(assert (=> mapIsEmpty!38972 mapRes!38972))

(declare-fun b!1046194 () Bool)

(declare-fun res!696486 () Bool)

(assert (=> b!1046194 (=> (not res!696486) (not e!593136))))

(assert (=> b!1046194 (= res!696486 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1046195 () Bool)

(declare-fun e!593134 () Bool)

(assert (=> b!1046195 (= e!593137 (not e!593134))))

(declare-fun res!696489 () Bool)

(assert (=> b!1046195 (=> res!696489 e!593134)))

(declare-datatypes ((Unit!34197 0))(
  ( (Unit!34198) )
))
(declare-datatypes ((tuple2!15834 0))(
  ( (tuple2!15835 (_1!7928 Unit!34197) (_2!7928 LongMapFixedSize!6072)) )
))
(declare-fun lt!462122 () tuple2!15834)

(declare-datatypes ((tuple2!15836 0))(
  ( (tuple2!15837 (_1!7929 (_ BitVec 64)) (_2!7929 V!38053)) )
))
(declare-datatypes ((List!22038 0))(
  ( (Nil!22035) (Cons!22034 (h!23242 tuple2!15836) (t!31334 List!22038)) )
))
(declare-datatypes ((ListLongMap!13813 0))(
  ( (ListLongMap!13814 (toList!6922 List!22038)) )
))
(declare-fun contains!6092 (ListLongMap!13813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3970 (array!65948 array!65950 (_ BitVec 32) (_ BitVec 32) V!38053 V!38053 (_ BitVec 32) Int) ListLongMap!13813)

(assert (=> b!1046195 (= res!696489 (not (contains!6092 (getCurrentListMap!3970 (_keys!11708 (_2!7928 lt!462122)) (_values!6457 (_2!7928 lt!462122)) (mask!30577 (_2!7928 lt!462122)) (extraKeys!6162 (_2!7928 lt!462122)) (zeroValue!6268 (_2!7928 lt!462122)) (minValue!6268 (_2!7928 lt!462122)) #b00000000000000000000000000000000 (defaultEntry!6434 (_2!7928 lt!462122))) key!909)))))

(declare-fun lt!462125 () array!65950)

(declare-fun lt!462123 () array!65948)

(declare-fun Unit!34199 () Unit!34197)

(declare-fun Unit!34200 () Unit!34197)

(assert (=> b!1046195 (= lt!462122 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3091 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15835 Unit!34199 (LongMapFixedSize!6073 (defaultEntry!6434 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6162 thiss!1427) (zeroValue!6268 thiss!1427) (minValue!6268 thiss!1427) (bvsub (_size!3091 thiss!1427) #b00000000000000000000000000000001) lt!462123 lt!462125 (bvadd #b00000000000000000000000000000001 (_vacant!3091 thiss!1427)))) (tuple2!15835 Unit!34200 (LongMapFixedSize!6073 (defaultEntry!6434 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6162 thiss!1427) (zeroValue!6268 thiss!1427) (minValue!6268 thiss!1427) (bvsub (_size!3091 thiss!1427) #b00000000000000000000000000000001) lt!462123 lt!462125 (_vacant!3091 thiss!1427)))))))

(declare-fun -!549 (ListLongMap!13813 (_ BitVec 64)) ListLongMap!13813)

(assert (=> b!1046195 (= (-!549 (getCurrentListMap!3970 (_keys!11708 thiss!1427) (_values!6457 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6162 thiss!1427) (zeroValue!6268 thiss!1427) (minValue!6268 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6434 thiss!1427)) key!909) (getCurrentListMap!3970 lt!462123 lt!462125 (mask!30577 thiss!1427) (extraKeys!6162 thiss!1427) (zeroValue!6268 thiss!1427) (minValue!6268 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6434 thiss!1427)))))

(declare-fun dynLambda!2019 (Int (_ BitVec 64)) V!38053)

(assert (=> b!1046195 (= lt!462125 (array!65951 (store (arr!31720 (_values!6457 thiss!1427)) (index!41804 lt!462124) (ValueCellFull!11739 (dynLambda!2019 (defaultEntry!6434 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32255 (_values!6457 thiss!1427))))))

(declare-fun lt!462128 () Unit!34197)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!70 (array!65948 array!65950 (_ BitVec 32) (_ BitVec 32) V!38053 V!38053 (_ BitVec 32) (_ BitVec 64) Int) Unit!34197)

(assert (=> b!1046195 (= lt!462128 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!70 (_keys!11708 thiss!1427) (_values!6457 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6162 thiss!1427) (zeroValue!6268 thiss!1427) (minValue!6268 thiss!1427) (index!41804 lt!462124) key!909 (defaultEntry!6434 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046195 (not (arrayContainsKey!0 lt!462123 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462129 () Unit!34197)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65948 (_ BitVec 32) (_ BitVec 64)) Unit!34197)

(assert (=> b!1046195 (= lt!462129 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11708 thiss!1427) (index!41804 lt!462124) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65948 (_ BitVec 32)) Bool)

(assert (=> b!1046195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462123 (mask!30577 thiss!1427))))

(declare-fun lt!462126 () Unit!34197)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65948 (_ BitVec 32) (_ BitVec 32)) Unit!34197)

(assert (=> b!1046195 (= lt!462126 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11708 thiss!1427) (index!41804 lt!462124) (mask!30577 thiss!1427)))))

(declare-datatypes ((List!22039 0))(
  ( (Nil!22036) (Cons!22035 (h!23243 (_ BitVec 64)) (t!31335 List!22039)) )
))
(declare-fun arrayNoDuplicates!0 (array!65948 (_ BitVec 32) List!22039) Bool)

(assert (=> b!1046195 (arrayNoDuplicates!0 lt!462123 #b00000000000000000000000000000000 Nil!22036)))

(declare-fun lt!462131 () Unit!34197)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65948 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22039) Unit!34197)

(assert (=> b!1046195 (= lt!462131 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11708 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41804 lt!462124) #b00000000000000000000000000000000 Nil!22036))))

(declare-fun arrayCountValidKeys!0 (array!65948 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046195 (= (arrayCountValidKeys!0 lt!462123 #b00000000000000000000000000000000 (size!32254 (_keys!11708 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11708 thiss!1427) #b00000000000000000000000000000000 (size!32254 (_keys!11708 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046195 (= lt!462123 (array!65949 (store (arr!31719 (_keys!11708 thiss!1427)) (index!41804 lt!462124) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32254 (_keys!11708 thiss!1427))))))

(declare-fun lt!462130 () Unit!34197)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65948 (_ BitVec 32) (_ BitVec 64)) Unit!34197)

(assert (=> b!1046195 (= lt!462130 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11708 thiss!1427) (index!41804 lt!462124) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046196 () Bool)

(declare-fun e!593135 () Bool)

(assert (=> b!1046196 (= e!593135 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!6162 (_2!7928 lt!462122)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6162 (_2!7928 lt!462122)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1046191 () Bool)

(assert (=> b!1046191 (= e!593134 false)))

(assert (=> b!1046191 e!593135))

(declare-fun c!106368 () Bool)

(assert (=> b!1046191 (= c!106368 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!462127 () Unit!34197)

(declare-fun lemmaKeyInListMapIsInArray!356 (array!65948 array!65950 (_ BitVec 32) (_ BitVec 32) V!38053 V!38053 (_ BitVec 64) Int) Unit!34197)

(assert (=> b!1046191 (= lt!462127 (lemmaKeyInListMapIsInArray!356 (_keys!11708 (_2!7928 lt!462122)) (_values!6457 (_2!7928 lt!462122)) (mask!30577 (_2!7928 lt!462122)) (extraKeys!6162 (_2!7928 lt!462122)) (zeroValue!6268 (_2!7928 lt!462122)) (minValue!6268 (_2!7928 lt!462122)) key!909 (defaultEntry!6434 (_2!7928 lt!462122))))))

(declare-fun res!696487 () Bool)

(assert (=> start!91992 (=> (not res!696487) (not e!593136))))

(declare-fun valid!2279 (LongMapFixedSize!6072) Bool)

(assert (=> start!91992 (= res!696487 (valid!2279 thiss!1427))))

(assert (=> start!91992 e!593136))

(assert (=> start!91992 e!593131))

(assert (=> start!91992 true))

(declare-fun mapNonEmpty!38972 () Bool)

(declare-fun tp!74757 () Bool)

(assert (=> mapNonEmpty!38972 (= mapRes!38972 (and tp!74757 e!593139))))

(declare-fun mapRest!38972 () (Array (_ BitVec 32) ValueCell!11739))

(declare-fun mapKey!38972 () (_ BitVec 32))

(declare-fun mapValue!38972 () ValueCell!11739)

(assert (=> mapNonEmpty!38972 (= (arr!31720 (_values!6457 thiss!1427)) (store mapRest!38972 mapKey!38972 mapValue!38972))))

(declare-fun b!1046197 () Bool)

(assert (=> b!1046197 (= e!593135 (arrayContainsKey!0 (_keys!11708 (_2!7928 lt!462122)) key!909 #b00000000000000000000000000000000))))

(assert (= (and start!91992 res!696487) b!1046194))

(assert (= (and b!1046194 res!696486) b!1046192))

(assert (= (and b!1046192 res!696488) b!1046195))

(assert (= (and b!1046195 (not res!696489)) b!1046191))

(assert (= (and b!1046191 c!106368) b!1046197))

(assert (= (and b!1046191 (not c!106368)) b!1046196))

(assert (= (and b!1046188 condMapEmpty!38972) mapIsEmpty!38972))

(assert (= (and b!1046188 (not condMapEmpty!38972)) mapNonEmpty!38972))

(assert (= (and mapNonEmpty!38972 ((_ is ValueCellFull!11739) mapValue!38972)) b!1046189))

(assert (= (and b!1046188 ((_ is ValueCellFull!11739) mapDefault!38972)) b!1046190))

(assert (= b!1046193 b!1046188))

(assert (= start!91992 b!1046193))

(declare-fun b_lambda!16349 () Bool)

(assert (=> (not b_lambda!16349) (not b!1046195)))

(declare-fun t!31333 () Bool)

(declare-fun tb!7117 () Bool)

(assert (=> (and b!1046193 (= (defaultEntry!6434 thiss!1427) (defaultEntry!6434 thiss!1427)) t!31333) tb!7117))

(declare-fun result!14659 () Bool)

(assert (=> tb!7117 (= result!14659 tp_is_empty!24885)))

(assert (=> b!1046195 t!31333))

(declare-fun b_and!33827 () Bool)

(assert (= b_and!33825 (and (=> t!31333 result!14659) b_and!33827)))

(declare-fun m!966163 () Bool)

(assert (=> mapNonEmpty!38972 m!966163))

(declare-fun m!966165 () Bool)

(assert (=> b!1046192 m!966165))

(declare-fun m!966167 () Bool)

(assert (=> b!1046197 m!966167))

(declare-fun m!966169 () Bool)

(assert (=> b!1046193 m!966169))

(declare-fun m!966171 () Bool)

(assert (=> b!1046193 m!966171))

(declare-fun m!966173 () Bool)

(assert (=> start!91992 m!966173))

(declare-fun m!966175 () Bool)

(assert (=> b!1046191 m!966175))

(declare-fun m!966177 () Bool)

(assert (=> b!1046195 m!966177))

(declare-fun m!966179 () Bool)

(assert (=> b!1046195 m!966179))

(declare-fun m!966181 () Bool)

(assert (=> b!1046195 m!966181))

(declare-fun m!966183 () Bool)

(assert (=> b!1046195 m!966183))

(declare-fun m!966185 () Bool)

(assert (=> b!1046195 m!966185))

(declare-fun m!966187 () Bool)

(assert (=> b!1046195 m!966187))

(declare-fun m!966189 () Bool)

(assert (=> b!1046195 m!966189))

(declare-fun m!966191 () Bool)

(assert (=> b!1046195 m!966191))

(assert (=> b!1046195 m!966189))

(declare-fun m!966193 () Bool)

(assert (=> b!1046195 m!966193))

(declare-fun m!966195 () Bool)

(assert (=> b!1046195 m!966195))

(declare-fun m!966197 () Bool)

(assert (=> b!1046195 m!966197))

(declare-fun m!966199 () Bool)

(assert (=> b!1046195 m!966199))

(declare-fun m!966201 () Bool)

(assert (=> b!1046195 m!966201))

(assert (=> b!1046195 m!966199))

(declare-fun m!966203 () Bool)

(assert (=> b!1046195 m!966203))

(declare-fun m!966205 () Bool)

(assert (=> b!1046195 m!966205))

(declare-fun m!966207 () Bool)

(assert (=> b!1046195 m!966207))

(declare-fun m!966209 () Bool)

(assert (=> b!1046195 m!966209))

(declare-fun m!966211 () Bool)

(assert (=> b!1046195 m!966211))

(check-sat (not b_lambda!16349) (not b_next!21165) (not b!1046193) (not b!1046192) (not mapNonEmpty!38972) (not start!91992) b_and!33827 tp_is_empty!24885 (not b!1046191) (not b!1046197) (not b!1046195))
(check-sat b_and!33827 (not b_next!21165))
