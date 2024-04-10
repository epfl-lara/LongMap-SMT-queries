; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75902 () Bool)

(assert start!75902)

(declare-fun b!893054 () Bool)

(declare-fun b_free!15837 () Bool)

(declare-fun b_next!15837 () Bool)

(assert (=> b!893054 (= b_free!15837 (not b_next!15837))))

(declare-fun tp!55482 () Bool)

(declare-fun b_and!26099 () Bool)

(assert (=> b!893054 (= tp!55482 b_and!26099)))

(declare-fun b!893051 () Bool)

(declare-fun e!498656 () Bool)

(declare-fun tp_is_empty!18165 () Bool)

(assert (=> b!893051 (= e!498656 tp_is_empty!18165)))

(declare-fun b!893052 () Bool)

(declare-fun e!498655 () Bool)

(declare-fun e!498657 () Bool)

(declare-fun mapRes!28805 () Bool)

(assert (=> b!893052 (= e!498655 (and e!498657 mapRes!28805))))

(declare-fun condMapEmpty!28805 () Bool)

(declare-datatypes ((array!52312 0))(
  ( (array!52313 (arr!25161 (Array (_ BitVec 32) (_ BitVec 64))) (size!25605 (_ BitVec 32))) )
))
(declare-datatypes ((V!29185 0))(
  ( (V!29186 (val!9133 Int)) )
))
(declare-datatypes ((ValueCell!8601 0))(
  ( (ValueCellFull!8601 (v!11612 V!29185)) (EmptyCell!8601) )
))
(declare-datatypes ((array!52314 0))(
  ( (array!52315 (arr!25162 (Array (_ BitVec 32) ValueCell!8601)) (size!25606 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4218 0))(
  ( (LongMapFixedSize!4219 (defaultEntry!5309 Int) (mask!25831 (_ BitVec 32)) (extraKeys!5004 (_ BitVec 32)) (zeroValue!5108 V!29185) (minValue!5108 V!29185) (_size!2164 (_ BitVec 32)) (_keys!9994 array!52312) (_values!5295 array!52314) (_vacant!2164 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4218)

(declare-fun mapDefault!28805 () ValueCell!8601)

(assert (=> b!893052 (= condMapEmpty!28805 (= (arr!25162 (_values!5295 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8601)) mapDefault!28805)))))

(declare-fun b!893053 () Bool)

(declare-fun e!498653 () Bool)

(declare-datatypes ((SeekEntryResult!8857 0))(
  ( (MissingZero!8857 (index!37799 (_ BitVec 32))) (Found!8857 (index!37800 (_ BitVec 32))) (Intermediate!8857 (undefined!9669 Bool) (index!37801 (_ BitVec 32)) (x!75909 (_ BitVec 32))) (Undefined!8857) (MissingVacant!8857 (index!37802 (_ BitVec 32))) )
))
(declare-fun lt!403513 () SeekEntryResult!8857)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893053 (= e!498653 (inRange!0 (index!37800 lt!403513) (mask!25831 thiss!1181)))))

(declare-fun res!604867 () Bool)

(declare-fun e!498652 () Bool)

(assert (=> start!75902 (=> (not res!604867) (not e!498652))))

(declare-fun valid!1630 (LongMapFixedSize!4218) Bool)

(assert (=> start!75902 (= res!604867 (valid!1630 thiss!1181))))

(assert (=> start!75902 e!498652))

(declare-fun e!498651 () Bool)

(assert (=> start!75902 e!498651))

(assert (=> start!75902 true))

(declare-fun mapIsEmpty!28805 () Bool)

(assert (=> mapIsEmpty!28805 mapRes!28805))

(declare-fun array_inv!19760 (array!52312) Bool)

(declare-fun array_inv!19761 (array!52314) Bool)

(assert (=> b!893054 (= e!498651 (and tp!55482 tp_is_empty!18165 (array_inv!19760 (_keys!9994 thiss!1181)) (array_inv!19761 (_values!5295 thiss!1181)) e!498655))))

(declare-fun b!893055 () Bool)

(assert (=> b!893055 (= e!498652 (not true))))

(assert (=> b!893055 e!498653))

(declare-fun res!604868 () Bool)

(assert (=> b!893055 (=> res!604868 e!498653)))

(get-info :version)

(assert (=> b!893055 (= res!604868 (not ((_ is Found!8857) lt!403513)))))

(declare-datatypes ((Unit!30412 0))(
  ( (Unit!30413) )
))
(declare-fun lt!403512 () Unit!30412)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!56 (array!52312 array!52314 (_ BitVec 32) (_ BitVec 32) V!29185 V!29185 (_ BitVec 64)) Unit!30412)

(assert (=> b!893055 (= lt!403512 (lemmaSeekEntryGivesInRangeIndex!56 (_keys!9994 thiss!1181) (_values!5295 thiss!1181) (mask!25831 thiss!1181) (extraKeys!5004 thiss!1181) (zeroValue!5108 thiss!1181) (minValue!5108 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52312 (_ BitVec 32)) SeekEntryResult!8857)

(assert (=> b!893055 (= lt!403513 (seekEntry!0 key!785 (_keys!9994 thiss!1181) (mask!25831 thiss!1181)))))

(declare-fun b!893056 () Bool)

(assert (=> b!893056 (= e!498657 tp_is_empty!18165)))

(declare-fun mapNonEmpty!28805 () Bool)

(declare-fun tp!55483 () Bool)

(assert (=> mapNonEmpty!28805 (= mapRes!28805 (and tp!55483 e!498656))))

(declare-fun mapRest!28805 () (Array (_ BitVec 32) ValueCell!8601))

(declare-fun mapKey!28805 () (_ BitVec 32))

(declare-fun mapValue!28805 () ValueCell!8601)

(assert (=> mapNonEmpty!28805 (= (arr!25162 (_values!5295 thiss!1181)) (store mapRest!28805 mapKey!28805 mapValue!28805))))

(declare-fun b!893057 () Bool)

(declare-fun res!604866 () Bool)

(assert (=> b!893057 (=> (not res!604866) (not e!498652))))

(assert (=> b!893057 (= res!604866 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!75902 res!604867) b!893057))

(assert (= (and b!893057 res!604866) b!893055))

(assert (= (and b!893055 (not res!604868)) b!893053))

(assert (= (and b!893052 condMapEmpty!28805) mapIsEmpty!28805))

(assert (= (and b!893052 (not condMapEmpty!28805)) mapNonEmpty!28805))

(assert (= (and mapNonEmpty!28805 ((_ is ValueCellFull!8601) mapValue!28805)) b!893051))

(assert (= (and b!893052 ((_ is ValueCellFull!8601) mapDefault!28805)) b!893056))

(assert (= b!893054 b!893052))

(assert (= start!75902 b!893054))

(declare-fun m!831205 () Bool)

(assert (=> b!893053 m!831205))

(declare-fun m!831207 () Bool)

(assert (=> b!893054 m!831207))

(declare-fun m!831209 () Bool)

(assert (=> b!893054 m!831209))

(declare-fun m!831211 () Bool)

(assert (=> start!75902 m!831211))

(declare-fun m!831213 () Bool)

(assert (=> mapNonEmpty!28805 m!831213))

(declare-fun m!831215 () Bool)

(assert (=> b!893055 m!831215))

(declare-fun m!831217 () Bool)

(assert (=> b!893055 m!831217))

(check-sat tp_is_empty!18165 (not b_next!15837) (not start!75902) (not mapNonEmpty!28805) b_and!26099 (not b!893054) (not b!893055) (not b!893053))
(check-sat b_and!26099 (not b_next!15837))
