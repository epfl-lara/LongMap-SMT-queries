; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16570 () Bool)

(assert start!16570)

(declare-fun b!165057 () Bool)

(declare-fun b_free!3871 () Bool)

(declare-fun b_next!3871 () Bool)

(assert (=> b!165057 (= b_free!3871 (not b_next!3871))))

(declare-fun tp!14213 () Bool)

(declare-fun b_and!10299 () Bool)

(assert (=> b!165057 (= tp!14213 b_and!10299)))

(declare-fun mapIsEmpty!6228 () Bool)

(declare-fun mapRes!6228 () Bool)

(assert (=> mapIsEmpty!6228 mapRes!6228))

(declare-fun b!165055 () Bool)

(declare-fun res!78239 () Bool)

(declare-fun e!108276 () Bool)

(assert (=> b!165055 (=> (not res!78239) (not e!108276))))

(declare-datatypes ((V!4545 0))(
  ( (V!4546 (val!1881 Int)) )
))
(declare-datatypes ((ValueCell!1493 0))(
  ( (ValueCellFull!1493 (v!3747 V!4545)) (EmptyCell!1493) )
))
(declare-datatypes ((array!6429 0))(
  ( (array!6430 (arr!3050 (Array (_ BitVec 32) (_ BitVec 64))) (size!3338 (_ BitVec 32))) )
))
(declare-datatypes ((array!6431 0))(
  ( (array!6432 (arr!3051 (Array (_ BitVec 32) ValueCell!1493)) (size!3339 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1894 0))(
  ( (LongMapFixedSize!1895 (defaultEntry!3389 Int) (mask!8092 (_ BitVec 32)) (extraKeys!3130 (_ BitVec 32)) (zeroValue!3232 V!4545) (minValue!3232 V!4545) (_size!996 (_ BitVec 32)) (_keys!5214 array!6429) (_values!3372 array!6431) (_vacant!996 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1894)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6429 (_ BitVec 32)) Bool)

(assert (=> b!165055 (= res!78239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5214 thiss!1248) (mask!8092 thiss!1248)))))

(declare-fun b!165056 () Bool)

(declare-fun e!108275 () Bool)

(assert (=> b!165056 (= e!108275 e!108276)))

(declare-fun res!78238 () Bool)

(assert (=> b!165056 (=> (not res!78238) (not e!108276))))

(declare-datatypes ((SeekEntryResult!424 0))(
  ( (MissingZero!424 (index!3864 (_ BitVec 32))) (Found!424 (index!3865 (_ BitVec 32))) (Intermediate!424 (undefined!1236 Bool) (index!3866 (_ BitVec 32)) (x!18292 (_ BitVec 32))) (Undefined!424) (MissingVacant!424 (index!3867 (_ BitVec 32))) )
))
(declare-fun lt!83052 () SeekEntryResult!424)

(get-info :version)

(assert (=> b!165056 (= res!78238 (and (not ((_ is Undefined!424) lt!83052)) (not ((_ is MissingVacant!424) lt!83052)) (not ((_ is MissingZero!424) lt!83052)) ((_ is Found!424) lt!83052)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6429 (_ BitVec 32)) SeekEntryResult!424)

(assert (=> b!165056 (= lt!83052 (seekEntryOrOpen!0 key!828 (_keys!5214 thiss!1248) (mask!8092 thiss!1248)))))

(declare-fun tp_is_empty!3673 () Bool)

(declare-fun e!108277 () Bool)

(declare-fun e!108272 () Bool)

(declare-fun array_inv!1957 (array!6429) Bool)

(declare-fun array_inv!1958 (array!6431) Bool)

(assert (=> b!165057 (= e!108272 (and tp!14213 tp_is_empty!3673 (array_inv!1957 (_keys!5214 thiss!1248)) (array_inv!1958 (_values!3372 thiss!1248)) e!108277))))

(declare-fun b!165058 () Bool)

(declare-fun res!78242 () Bool)

(assert (=> b!165058 (=> (not res!78242) (not e!108276))))

(declare-datatypes ((tuple2!3006 0))(
  ( (tuple2!3007 (_1!1514 (_ BitVec 64)) (_2!1514 V!4545)) )
))
(declare-datatypes ((List!2025 0))(
  ( (Nil!2022) (Cons!2021 (h!2638 tuple2!3006) (t!6819 List!2025)) )
))
(declare-datatypes ((ListLongMap!1967 0))(
  ( (ListLongMap!1968 (toList!999 List!2025)) )
))
(declare-fun contains!1051 (ListLongMap!1967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!661 (array!6429 array!6431 (_ BitVec 32) (_ BitVec 32) V!4545 V!4545 (_ BitVec 32) Int) ListLongMap!1967)

(assert (=> b!165058 (= res!78242 (contains!1051 (getCurrentListMap!661 (_keys!5214 thiss!1248) (_values!3372 thiss!1248) (mask!8092 thiss!1248) (extraKeys!3130 thiss!1248) (zeroValue!3232 thiss!1248) (minValue!3232 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3389 thiss!1248)) key!828))))

(declare-fun b!165059 () Bool)

(declare-fun res!78241 () Bool)

(assert (=> b!165059 (=> (not res!78241) (not e!108276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165059 (= res!78241 (validMask!0 (mask!8092 thiss!1248)))))

(declare-fun mapNonEmpty!6228 () Bool)

(declare-fun tp!14214 () Bool)

(declare-fun e!108278 () Bool)

(assert (=> mapNonEmpty!6228 (= mapRes!6228 (and tp!14214 e!108278))))

(declare-fun mapKey!6228 () (_ BitVec 32))

(declare-fun mapValue!6228 () ValueCell!1493)

(declare-fun mapRest!6228 () (Array (_ BitVec 32) ValueCell!1493))

(assert (=> mapNonEmpty!6228 (= (arr!3051 (_values!3372 thiss!1248)) (store mapRest!6228 mapKey!6228 mapValue!6228))))

(declare-fun res!78237 () Bool)

(assert (=> start!16570 (=> (not res!78237) (not e!108275))))

(declare-fun valid!856 (LongMapFixedSize!1894) Bool)

(assert (=> start!16570 (= res!78237 (valid!856 thiss!1248))))

(assert (=> start!16570 e!108275))

(assert (=> start!16570 e!108272))

(assert (=> start!16570 true))

(declare-fun b!165060 () Bool)

(declare-fun res!78243 () Bool)

(assert (=> b!165060 (=> (not res!78243) (not e!108275))))

(assert (=> b!165060 (= res!78243 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165061 () Bool)

(declare-fun e!108274 () Bool)

(assert (=> b!165061 (= e!108277 (and e!108274 mapRes!6228))))

(declare-fun condMapEmpty!6228 () Bool)

(declare-fun mapDefault!6228 () ValueCell!1493)

(assert (=> b!165061 (= condMapEmpty!6228 (= (arr!3051 (_values!3372 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1493)) mapDefault!6228)))))

(declare-fun b!165062 () Bool)

(assert (=> b!165062 (= e!108276 false)))

(declare-fun lt!83051 () Bool)

(declare-datatypes ((List!2026 0))(
  ( (Nil!2023) (Cons!2022 (h!2639 (_ BitVec 64)) (t!6820 List!2026)) )
))
(declare-fun arrayNoDuplicates!0 (array!6429 (_ BitVec 32) List!2026) Bool)

(assert (=> b!165062 (= lt!83051 (arrayNoDuplicates!0 (_keys!5214 thiss!1248) #b00000000000000000000000000000000 Nil!2023))))

(declare-fun b!165063 () Bool)

(declare-fun res!78240 () Bool)

(assert (=> b!165063 (=> (not res!78240) (not e!108276))))

(assert (=> b!165063 (= res!78240 (and (= (size!3339 (_values!3372 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8092 thiss!1248))) (= (size!3338 (_keys!5214 thiss!1248)) (size!3339 (_values!3372 thiss!1248))) (bvsge (mask!8092 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3130 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3130 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165064 () Bool)

(assert (=> b!165064 (= e!108278 tp_is_empty!3673)))

(declare-fun b!165065 () Bool)

(assert (=> b!165065 (= e!108274 tp_is_empty!3673)))

(assert (= (and start!16570 res!78237) b!165060))

(assert (= (and b!165060 res!78243) b!165056))

(assert (= (and b!165056 res!78238) b!165058))

(assert (= (and b!165058 res!78242) b!165059))

(assert (= (and b!165059 res!78241) b!165063))

(assert (= (and b!165063 res!78240) b!165055))

(assert (= (and b!165055 res!78239) b!165062))

(assert (= (and b!165061 condMapEmpty!6228) mapIsEmpty!6228))

(assert (= (and b!165061 (not condMapEmpty!6228)) mapNonEmpty!6228))

(assert (= (and mapNonEmpty!6228 ((_ is ValueCellFull!1493) mapValue!6228)) b!165064))

(assert (= (and b!165061 ((_ is ValueCellFull!1493) mapDefault!6228)) b!165065))

(assert (= b!165057 b!165061))

(assert (= start!16570 b!165057))

(declare-fun m!195173 () Bool)

(assert (=> b!165062 m!195173))

(declare-fun m!195175 () Bool)

(assert (=> b!165058 m!195175))

(assert (=> b!165058 m!195175))

(declare-fun m!195177 () Bool)

(assert (=> b!165058 m!195177))

(declare-fun m!195179 () Bool)

(assert (=> b!165056 m!195179))

(declare-fun m!195181 () Bool)

(assert (=> b!165055 m!195181))

(declare-fun m!195183 () Bool)

(assert (=> mapNonEmpty!6228 m!195183))

(declare-fun m!195185 () Bool)

(assert (=> start!16570 m!195185))

(declare-fun m!195187 () Bool)

(assert (=> b!165059 m!195187))

(declare-fun m!195189 () Bool)

(assert (=> b!165057 m!195189))

(declare-fun m!195191 () Bool)

(assert (=> b!165057 m!195191))

(check-sat (not b!165055) (not b!165059) (not mapNonEmpty!6228) (not b!165058) (not b_next!3871) (not b!165062) tp_is_empty!3673 b_and!10299 (not b!165057) (not start!16570) (not b!165056))
(check-sat b_and!10299 (not b_next!3871))
