; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17234 () Bool)

(assert start!17234)

(declare-fun b!172870 () Bool)

(declare-fun b_free!4281 () Bool)

(declare-fun b_next!4281 () Bool)

(assert (=> b!172870 (= b_free!4281 (not b_next!4281))))

(declare-fun tp!15501 () Bool)

(declare-fun b_and!10721 () Bool)

(assert (=> b!172870 (= tp!15501 b_and!10721)))

(declare-fun b!172869 () Bool)

(declare-fun e!114150 () Bool)

(declare-datatypes ((V!5051 0))(
  ( (V!5052 (val!2071 Int)) )
))
(declare-datatypes ((ValueCell!1683 0))(
  ( (ValueCellFull!1683 (v!3939 V!5051)) (EmptyCell!1683) )
))
(declare-datatypes ((array!7233 0))(
  ( (array!7234 (arr!3437 (Array (_ BitVec 32) (_ BitVec 64))) (size!3736 (_ BitVec 32))) )
))
(declare-datatypes ((array!7235 0))(
  ( (array!7236 (arr!3438 (Array (_ BitVec 32) ValueCell!1683)) (size!3737 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2274 0))(
  ( (LongMapFixedSize!2275 (defaultEntry!3583 Int) (mask!8441 (_ BitVec 32)) (extraKeys!3322 (_ BitVec 32)) (zeroValue!3424 V!5051) (minValue!3426 V!5051) (_size!1186 (_ BitVec 32)) (_keys!5422 array!7233) (_values!3566 array!7235) (_vacant!1186 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2274)

(assert (=> b!172869 (= e!114150 (and (= (size!3737 (_values!3566 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8441 thiss!1248))) (= (size!3736 (_keys!5422 thiss!1248)) (size!3737 (_values!3566 thiss!1248))) (bvsge (mask!8441 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3322 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3322 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3322 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvor (extraKeys!3322 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(declare-fun e!114151 () Bool)

(declare-fun tp_is_empty!4053 () Bool)

(declare-fun e!114148 () Bool)

(declare-fun array_inv!2201 (array!7233) Bool)

(declare-fun array_inv!2202 (array!7235) Bool)

(assert (=> b!172870 (= e!114151 (and tp!15501 tp_is_empty!4053 (array_inv!2201 (_keys!5422 thiss!1248)) (array_inv!2202 (_values!3566 thiss!1248)) e!114148))))

(declare-fun b!172871 () Bool)

(declare-fun res!82078 () Bool)

(assert (=> b!172871 (=> (not res!82078) (not e!114150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172871 (= res!82078 (validMask!0 (mask!8441 thiss!1248)))))

(declare-fun mapIsEmpty!6900 () Bool)

(declare-fun mapRes!6900 () Bool)

(assert (=> mapIsEmpty!6900 mapRes!6900))

(declare-fun b!172872 () Bool)

(declare-fun e!114149 () Bool)

(assert (=> b!172872 (= e!114148 (and e!114149 mapRes!6900))))

(declare-fun condMapEmpty!6900 () Bool)

(declare-fun mapDefault!6900 () ValueCell!1683)

(assert (=> b!172872 (= condMapEmpty!6900 (= (arr!3438 (_values!3566 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1683)) mapDefault!6900)))))

(declare-fun b!172873 () Bool)

(declare-fun res!82080 () Bool)

(assert (=> b!172873 (=> (not res!82080) (not e!114150))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172873 (= res!82080 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!6900 () Bool)

(declare-fun tp!15500 () Bool)

(declare-fun e!114152 () Bool)

(assert (=> mapNonEmpty!6900 (= mapRes!6900 (and tp!15500 e!114152))))

(declare-fun mapKey!6900 () (_ BitVec 32))

(declare-fun mapValue!6900 () ValueCell!1683)

(declare-fun mapRest!6900 () (Array (_ BitVec 32) ValueCell!1683))

(assert (=> mapNonEmpty!6900 (= (arr!3438 (_values!3566 thiss!1248)) (store mapRest!6900 mapKey!6900 mapValue!6900))))

(declare-fun res!82079 () Bool)

(assert (=> start!17234 (=> (not res!82079) (not e!114150))))

(declare-fun valid!964 (LongMapFixedSize!2274) Bool)

(assert (=> start!17234 (= res!82079 (valid!964 thiss!1248))))

(assert (=> start!17234 e!114150))

(assert (=> start!17234 e!114151))

(assert (=> start!17234 true))

(declare-fun b!172874 () Bool)

(assert (=> b!172874 (= e!114149 tp_is_empty!4053)))

(declare-fun b!172875 () Bool)

(assert (=> b!172875 (= e!114152 tp_is_empty!4053)))

(assert (= (and start!17234 res!82079) b!172873))

(assert (= (and b!172873 res!82080) b!172871))

(assert (= (and b!172871 res!82078) b!172869))

(assert (= (and b!172872 condMapEmpty!6900) mapIsEmpty!6900))

(assert (= (and b!172872 (not condMapEmpty!6900)) mapNonEmpty!6900))

(get-info :version)

(assert (= (and mapNonEmpty!6900 ((_ is ValueCellFull!1683) mapValue!6900)) b!172875))

(assert (= (and b!172872 ((_ is ValueCellFull!1683) mapDefault!6900)) b!172874))

(assert (= b!172870 b!172872))

(assert (= start!17234 b!172870))

(declare-fun m!201433 () Bool)

(assert (=> b!172870 m!201433))

(declare-fun m!201435 () Bool)

(assert (=> b!172870 m!201435))

(declare-fun m!201437 () Bool)

(assert (=> b!172871 m!201437))

(declare-fun m!201439 () Bool)

(assert (=> mapNonEmpty!6900 m!201439))

(declare-fun m!201441 () Bool)

(assert (=> start!17234 m!201441))

(check-sat (not b_next!4281) tp_is_empty!4053 (not mapNonEmpty!6900) b_and!10721 (not b!172871) (not b!172870) (not start!17234))
(check-sat b_and!10721 (not b_next!4281))
