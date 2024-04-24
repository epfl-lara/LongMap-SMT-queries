; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16576 () Bool)

(assert start!16576)

(declare-fun b!165158 () Bool)

(declare-fun b_free!3877 () Bool)

(declare-fun b_next!3877 () Bool)

(assert (=> b!165158 (= b_free!3877 (not b_next!3877))))

(declare-fun tp!14231 () Bool)

(declare-fun b_and!10305 () Bool)

(assert (=> b!165158 (= tp!14231 b_and!10305)))

(declare-fun b!165154 () Bool)

(declare-fun e!108335 () Bool)

(declare-fun tp_is_empty!3679 () Bool)

(assert (=> b!165154 (= e!108335 tp_is_empty!3679)))

(declare-fun b!165155 () Bool)

(declare-fun res!78305 () Bool)

(declare-fun e!108337 () Bool)

(assert (=> b!165155 (=> (not res!78305) (not e!108337))))

(declare-datatypes ((V!4553 0))(
  ( (V!4554 (val!1884 Int)) )
))
(declare-datatypes ((ValueCell!1496 0))(
  ( (ValueCellFull!1496 (v!3750 V!4553)) (EmptyCell!1496) )
))
(declare-datatypes ((array!6441 0))(
  ( (array!6442 (arr!3056 (Array (_ BitVec 32) (_ BitVec 64))) (size!3344 (_ BitVec 32))) )
))
(declare-datatypes ((array!6443 0))(
  ( (array!6444 (arr!3057 (Array (_ BitVec 32) ValueCell!1496)) (size!3345 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1900 0))(
  ( (LongMapFixedSize!1901 (defaultEntry!3392 Int) (mask!8097 (_ BitVec 32)) (extraKeys!3133 (_ BitVec 32)) (zeroValue!3235 V!4553) (minValue!3235 V!4553) (_size!999 (_ BitVec 32)) (_keys!5217 array!6441) (_values!3375 array!6443) (_vacant!999 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1900)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165155 (= res!78305 (validMask!0 (mask!8097 thiss!1248)))))

(declare-fun b!165156 () Bool)

(declare-fun e!108341 () Bool)

(assert (=> b!165156 (= e!108341 tp_is_empty!3679)))

(declare-fun b!165157 () Bool)

(declare-fun e!108338 () Bool)

(declare-fun mapRes!6237 () Bool)

(assert (=> b!165157 (= e!108338 (and e!108335 mapRes!6237))))

(declare-fun condMapEmpty!6237 () Bool)

(declare-fun mapDefault!6237 () ValueCell!1496)

(assert (=> b!165157 (= condMapEmpty!6237 (= (arr!3057 (_values!3375 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1496)) mapDefault!6237)))))

(declare-fun e!108336 () Bool)

(declare-fun array_inv!1963 (array!6441) Bool)

(declare-fun array_inv!1964 (array!6443) Bool)

(assert (=> b!165158 (= e!108336 (and tp!14231 tp_is_empty!3679 (array_inv!1963 (_keys!5217 thiss!1248)) (array_inv!1964 (_values!3375 thiss!1248)) e!108338))))

(declare-fun mapIsEmpty!6237 () Bool)

(assert (=> mapIsEmpty!6237 mapRes!6237))

(declare-fun b!165159 () Bool)

(declare-fun res!78306 () Bool)

(assert (=> b!165159 (=> (not res!78306) (not e!108337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6441 (_ BitVec 32)) Bool)

(assert (=> b!165159 (= res!78306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5217 thiss!1248) (mask!8097 thiss!1248)))))

(declare-fun res!78304 () Bool)

(declare-fun e!108339 () Bool)

(assert (=> start!16576 (=> (not res!78304) (not e!108339))))

(declare-fun valid!858 (LongMapFixedSize!1900) Bool)

(assert (=> start!16576 (= res!78304 (valid!858 thiss!1248))))

(assert (=> start!16576 e!108339))

(assert (=> start!16576 e!108336))

(assert (=> start!16576 true))

(declare-fun b!165160 () Bool)

(declare-fun res!78300 () Bool)

(assert (=> b!165160 (=> (not res!78300) (not e!108337))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3010 0))(
  ( (tuple2!3011 (_1!1516 (_ BitVec 64)) (_2!1516 V!4553)) )
))
(declare-datatypes ((List!2030 0))(
  ( (Nil!2027) (Cons!2026 (h!2643 tuple2!3010) (t!6824 List!2030)) )
))
(declare-datatypes ((ListLongMap!1971 0))(
  ( (ListLongMap!1972 (toList!1001 List!2030)) )
))
(declare-fun contains!1053 (ListLongMap!1971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!663 (array!6441 array!6443 (_ BitVec 32) (_ BitVec 32) V!4553 V!4553 (_ BitVec 32) Int) ListLongMap!1971)

(assert (=> b!165160 (= res!78300 (contains!1053 (getCurrentListMap!663 (_keys!5217 thiss!1248) (_values!3375 thiss!1248) (mask!8097 thiss!1248) (extraKeys!3133 thiss!1248) (zeroValue!3235 thiss!1248) (minValue!3235 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3392 thiss!1248)) key!828))))

(declare-fun b!165161 () Bool)

(declare-fun res!78302 () Bool)

(assert (=> b!165161 (=> (not res!78302) (not e!108337))))

(assert (=> b!165161 (= res!78302 (and (= (size!3345 (_values!3375 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8097 thiss!1248))) (= (size!3344 (_keys!5217 thiss!1248)) (size!3345 (_values!3375 thiss!1248))) (bvsge (mask!8097 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3133 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3133 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165162 () Bool)

(declare-fun res!78303 () Bool)

(assert (=> b!165162 (=> (not res!78303) (not e!108339))))

(assert (=> b!165162 (= res!78303 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165163 () Bool)

(assert (=> b!165163 (= e!108337 false)))

(declare-fun lt!83069 () Bool)

(declare-datatypes ((List!2031 0))(
  ( (Nil!2028) (Cons!2027 (h!2644 (_ BitVec 64)) (t!6825 List!2031)) )
))
(declare-fun arrayNoDuplicates!0 (array!6441 (_ BitVec 32) List!2031) Bool)

(assert (=> b!165163 (= lt!83069 (arrayNoDuplicates!0 (_keys!5217 thiss!1248) #b00000000000000000000000000000000 Nil!2028))))

(declare-fun mapNonEmpty!6237 () Bool)

(declare-fun tp!14232 () Bool)

(assert (=> mapNonEmpty!6237 (= mapRes!6237 (and tp!14232 e!108341))))

(declare-fun mapKey!6237 () (_ BitVec 32))

(declare-fun mapRest!6237 () (Array (_ BitVec 32) ValueCell!1496))

(declare-fun mapValue!6237 () ValueCell!1496)

(assert (=> mapNonEmpty!6237 (= (arr!3057 (_values!3375 thiss!1248)) (store mapRest!6237 mapKey!6237 mapValue!6237))))

(declare-fun b!165164 () Bool)

(assert (=> b!165164 (= e!108339 e!108337)))

(declare-fun res!78301 () Bool)

(assert (=> b!165164 (=> (not res!78301) (not e!108337))))

(declare-datatypes ((SeekEntryResult!426 0))(
  ( (MissingZero!426 (index!3872 (_ BitVec 32))) (Found!426 (index!3873 (_ BitVec 32))) (Intermediate!426 (undefined!1238 Bool) (index!3874 (_ BitVec 32)) (x!18302 (_ BitVec 32))) (Undefined!426) (MissingVacant!426 (index!3875 (_ BitVec 32))) )
))
(declare-fun lt!83070 () SeekEntryResult!426)

(get-info :version)

(assert (=> b!165164 (= res!78301 (and (not ((_ is Undefined!426) lt!83070)) (not ((_ is MissingVacant!426) lt!83070)) (not ((_ is MissingZero!426) lt!83070)) ((_ is Found!426) lt!83070)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6441 (_ BitVec 32)) SeekEntryResult!426)

(assert (=> b!165164 (= lt!83070 (seekEntryOrOpen!0 key!828 (_keys!5217 thiss!1248) (mask!8097 thiss!1248)))))

(assert (= (and start!16576 res!78304) b!165162))

(assert (= (and b!165162 res!78303) b!165164))

(assert (= (and b!165164 res!78301) b!165160))

(assert (= (and b!165160 res!78300) b!165155))

(assert (= (and b!165155 res!78305) b!165161))

(assert (= (and b!165161 res!78302) b!165159))

(assert (= (and b!165159 res!78306) b!165163))

(assert (= (and b!165157 condMapEmpty!6237) mapIsEmpty!6237))

(assert (= (and b!165157 (not condMapEmpty!6237)) mapNonEmpty!6237))

(assert (= (and mapNonEmpty!6237 ((_ is ValueCellFull!1496) mapValue!6237)) b!165156))

(assert (= (and b!165157 ((_ is ValueCellFull!1496) mapDefault!6237)) b!165154))

(assert (= b!165158 b!165157))

(assert (= start!16576 b!165158))

(declare-fun m!195233 () Bool)

(assert (=> start!16576 m!195233))

(declare-fun m!195235 () Bool)

(assert (=> b!165158 m!195235))

(declare-fun m!195237 () Bool)

(assert (=> b!165158 m!195237))

(declare-fun m!195239 () Bool)

(assert (=> b!165155 m!195239))

(declare-fun m!195241 () Bool)

(assert (=> b!165163 m!195241))

(declare-fun m!195243 () Bool)

(assert (=> b!165164 m!195243))

(declare-fun m!195245 () Bool)

(assert (=> b!165160 m!195245))

(assert (=> b!165160 m!195245))

(declare-fun m!195247 () Bool)

(assert (=> b!165160 m!195247))

(declare-fun m!195249 () Bool)

(assert (=> mapNonEmpty!6237 m!195249))

(declare-fun m!195251 () Bool)

(assert (=> b!165159 m!195251))

(check-sat (not b!165164) (not b!165158) (not b!165155) tp_is_empty!3679 (not b!165159) (not b!165163) (not mapNonEmpty!6237) (not b!165160) (not start!16576) (not b_next!3877) b_and!10305)
(check-sat b_and!10305 (not b_next!3877))
