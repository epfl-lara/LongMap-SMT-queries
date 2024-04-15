; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16582 () Bool)

(assert start!16582)

(declare-fun b!165066 () Bool)

(declare-fun b_free!3883 () Bool)

(declare-fun b_next!3883 () Bool)

(assert (=> b!165066 (= b_free!3883 (not b_next!3883))))

(declare-fun tp!14250 () Bool)

(declare-fun b_and!10271 () Bool)

(assert (=> b!165066 (= tp!14250 b_and!10271)))

(declare-fun b!165059 () Bool)

(declare-fun e!108275 () Bool)

(declare-fun e!108276 () Bool)

(assert (=> b!165059 (= e!108275 e!108276)))

(declare-fun res!78248 () Bool)

(assert (=> b!165059 (=> (not res!78248) (not e!108276))))

(declare-datatypes ((SeekEntryResult!441 0))(
  ( (MissingZero!441 (index!3932 (_ BitVec 32))) (Found!441 (index!3933 (_ BitVec 32))) (Intermediate!441 (undefined!1253 Bool) (index!3934 (_ BitVec 32)) (x!18324 (_ BitVec 32))) (Undefined!441) (MissingVacant!441 (index!3935 (_ BitVec 32))) )
))
(declare-fun lt!82847 () SeekEntryResult!441)

(get-info :version)

(assert (=> b!165059 (= res!78248 (and (not ((_ is Undefined!441) lt!82847)) (not ((_ is MissingVacant!441) lt!82847)) (not ((_ is MissingZero!441) lt!82847)) ((_ is Found!441) lt!82847)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4561 0))(
  ( (V!4562 (val!1887 Int)) )
))
(declare-datatypes ((ValueCell!1499 0))(
  ( (ValueCellFull!1499 (v!3746 V!4561)) (EmptyCell!1499) )
))
(declare-datatypes ((array!6447 0))(
  ( (array!6448 (arr!3058 (Array (_ BitVec 32) (_ BitVec 64))) (size!3347 (_ BitVec 32))) )
))
(declare-datatypes ((array!6449 0))(
  ( (array!6450 (arr!3059 (Array (_ BitVec 32) ValueCell!1499)) (size!3348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1906 0))(
  ( (LongMapFixedSize!1907 (defaultEntry!3395 Int) (mask!8101 (_ BitVec 32)) (extraKeys!3136 (_ BitVec 32)) (zeroValue!3238 V!4561) (minValue!3238 V!4561) (_size!1002 (_ BitVec 32)) (_keys!5219 array!6447) (_values!3378 array!6449) (_vacant!1002 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1906)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6447 (_ BitVec 32)) SeekEntryResult!441)

(assert (=> b!165059 (= lt!82847 (seekEntryOrOpen!0 key!828 (_keys!5219 thiss!1248) (mask!8101 thiss!1248)))))

(declare-fun b!165060 () Bool)

(declare-fun e!108278 () Bool)

(declare-fun tp_is_empty!3685 () Bool)

(assert (=> b!165060 (= e!108278 tp_is_empty!3685)))

(declare-fun b!165061 () Bool)

(declare-fun e!108279 () Bool)

(declare-fun e!108274 () Bool)

(declare-fun mapRes!6246 () Bool)

(assert (=> b!165061 (= e!108279 (and e!108274 mapRes!6246))))

(declare-fun condMapEmpty!6246 () Bool)

(declare-fun mapDefault!6246 () ValueCell!1499)

(assert (=> b!165061 (= condMapEmpty!6246 (= (arr!3059 (_values!3378 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1499)) mapDefault!6246)))))

(declare-fun b!165062 () Bool)

(declare-fun res!78247 () Bool)

(assert (=> b!165062 (=> (not res!78247) (not e!108276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6447 (_ BitVec 32)) Bool)

(assert (=> b!165062 (= res!78247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5219 thiss!1248) (mask!8101 thiss!1248)))))

(declare-fun b!165063 () Bool)

(declare-fun res!78252 () Bool)

(assert (=> b!165063 (=> (not res!78252) (not e!108276))))

(assert (=> b!165063 (= res!78252 (and (= (size!3348 (_values!3378 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8101 thiss!1248))) (= (size!3347 (_keys!5219 thiss!1248)) (size!3348 (_values!3378 thiss!1248))) (bvsge (mask!8101 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3136 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3136 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6246 () Bool)

(declare-fun tp!14249 () Bool)

(assert (=> mapNonEmpty!6246 (= mapRes!6246 (and tp!14249 e!108278))))

(declare-fun mapKey!6246 () (_ BitVec 32))

(declare-fun mapValue!6246 () ValueCell!1499)

(declare-fun mapRest!6246 () (Array (_ BitVec 32) ValueCell!1499))

(assert (=> mapNonEmpty!6246 (= (arr!3059 (_values!3378 thiss!1248)) (store mapRest!6246 mapKey!6246 mapValue!6246))))

(declare-fun b!165065 () Bool)

(declare-fun res!78250 () Bool)

(assert (=> b!165065 (=> (not res!78250) (not e!108275))))

(assert (=> b!165065 (= res!78250 (not (= key!828 (bvneg key!828))))))

(declare-fun e!108273 () Bool)

(declare-fun array_inv!1963 (array!6447) Bool)

(declare-fun array_inv!1964 (array!6449) Bool)

(assert (=> b!165066 (= e!108273 (and tp!14250 tp_is_empty!3685 (array_inv!1963 (_keys!5219 thiss!1248)) (array_inv!1964 (_values!3378 thiss!1248)) e!108279))))

(declare-fun mapIsEmpty!6246 () Bool)

(assert (=> mapIsEmpty!6246 mapRes!6246))

(declare-fun b!165067 () Bool)

(assert (=> b!165067 (= e!108274 tp_is_empty!3685)))

(declare-fun res!78253 () Bool)

(assert (=> start!16582 (=> (not res!78253) (not e!108275))))

(declare-fun valid!850 (LongMapFixedSize!1906) Bool)

(assert (=> start!16582 (= res!78253 (valid!850 thiss!1248))))

(assert (=> start!16582 e!108275))

(assert (=> start!16582 e!108273))

(assert (=> start!16582 true))

(declare-fun b!165064 () Bool)

(declare-fun res!78249 () Bool)

(assert (=> b!165064 (=> (not res!78249) (not e!108276))))

(declare-datatypes ((tuple2!3046 0))(
  ( (tuple2!3047 (_1!1534 (_ BitVec 64)) (_2!1534 V!4561)) )
))
(declare-datatypes ((List!2046 0))(
  ( (Nil!2043) (Cons!2042 (h!2659 tuple2!3046) (t!6839 List!2046)) )
))
(declare-datatypes ((ListLongMap!1989 0))(
  ( (ListLongMap!1990 (toList!1010 List!2046)) )
))
(declare-fun contains!1055 (ListLongMap!1989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!652 (array!6447 array!6449 (_ BitVec 32) (_ BitVec 32) V!4561 V!4561 (_ BitVec 32) Int) ListLongMap!1989)

(assert (=> b!165064 (= res!78249 (not (contains!1055 (getCurrentListMap!652 (_keys!5219 thiss!1248) (_values!3378 thiss!1248) (mask!8101 thiss!1248) (extraKeys!3136 thiss!1248) (zeroValue!3238 thiss!1248) (minValue!3238 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3395 thiss!1248)) key!828)))))

(declare-fun b!165068 () Bool)

(declare-fun res!78251 () Bool)

(assert (=> b!165068 (=> (not res!78251) (not e!108276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165068 (= res!78251 (validMask!0 (mask!8101 thiss!1248)))))

(declare-fun b!165069 () Bool)

(assert (=> b!165069 (= e!108276 false)))

(declare-fun lt!82848 () Bool)

(declare-datatypes ((List!2047 0))(
  ( (Nil!2044) (Cons!2043 (h!2660 (_ BitVec 64)) (t!6840 List!2047)) )
))
(declare-fun arrayNoDuplicates!0 (array!6447 (_ BitVec 32) List!2047) Bool)

(assert (=> b!165069 (= lt!82848 (arrayNoDuplicates!0 (_keys!5219 thiss!1248) #b00000000000000000000000000000000 Nil!2044))))

(assert (= (and start!16582 res!78253) b!165065))

(assert (= (and b!165065 res!78250) b!165059))

(assert (= (and b!165059 res!78248) b!165064))

(assert (= (and b!165064 res!78249) b!165068))

(assert (= (and b!165068 res!78251) b!165063))

(assert (= (and b!165063 res!78252) b!165062))

(assert (= (and b!165062 res!78247) b!165069))

(assert (= (and b!165061 condMapEmpty!6246) mapIsEmpty!6246))

(assert (= (and b!165061 (not condMapEmpty!6246)) mapNonEmpty!6246))

(assert (= (and mapNonEmpty!6246 ((_ is ValueCellFull!1499) mapValue!6246)) b!165060))

(assert (= (and b!165061 ((_ is ValueCellFull!1499) mapDefault!6246)) b!165067))

(assert (= b!165066 b!165061))

(assert (= start!16582 b!165066))

(declare-fun m!194491 () Bool)

(assert (=> b!165062 m!194491))

(declare-fun m!194493 () Bool)

(assert (=> b!165059 m!194493))

(declare-fun m!194495 () Bool)

(assert (=> start!16582 m!194495))

(declare-fun m!194497 () Bool)

(assert (=> b!165066 m!194497))

(declare-fun m!194499 () Bool)

(assert (=> b!165066 m!194499))

(declare-fun m!194501 () Bool)

(assert (=> b!165064 m!194501))

(assert (=> b!165064 m!194501))

(declare-fun m!194503 () Bool)

(assert (=> b!165064 m!194503))

(declare-fun m!194505 () Bool)

(assert (=> b!165069 m!194505))

(declare-fun m!194507 () Bool)

(assert (=> b!165068 m!194507))

(declare-fun m!194509 () Bool)

(assert (=> mapNonEmpty!6246 m!194509))

(check-sat (not start!16582) (not mapNonEmpty!6246) tp_is_empty!3685 (not b!165069) (not b!165068) (not b!165066) (not b_next!3883) (not b!165062) (not b!165064) b_and!10271 (not b!165059))
(check-sat b_and!10271 (not b_next!3883))
