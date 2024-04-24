; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17242 () Bool)

(assert start!17242)

(declare-fun b!172959 () Bool)

(declare-fun b_free!4285 () Bool)

(declare-fun b_next!4285 () Bool)

(assert (=> b!172959 (= b_free!4285 (not b_next!4285))))

(declare-fun tp!15512 () Bool)

(declare-fun b_and!10739 () Bool)

(assert (=> b!172959 (= tp!15512 b_and!10739)))

(declare-fun b!172958 () Bool)

(declare-fun e!114211 () Bool)

(declare-fun e!114212 () Bool)

(declare-fun mapRes!6906 () Bool)

(assert (=> b!172958 (= e!114211 (and e!114212 mapRes!6906))))

(declare-fun condMapEmpty!6906 () Bool)

(declare-datatypes ((V!5057 0))(
  ( (V!5058 (val!2073 Int)) )
))
(declare-datatypes ((ValueCell!1685 0))(
  ( (ValueCellFull!1685 (v!3942 V!5057)) (EmptyCell!1685) )
))
(declare-datatypes ((array!7227 0))(
  ( (array!7228 (arr!3434 (Array (_ BitVec 32) (_ BitVec 64))) (size!3733 (_ BitVec 32))) )
))
(declare-datatypes ((array!7229 0))(
  ( (array!7230 (arr!3435 (Array (_ BitVec 32) ValueCell!1685)) (size!3734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2278 0))(
  ( (LongMapFixedSize!2279 (defaultEntry!3585 Int) (mask!8445 (_ BitVec 32)) (extraKeys!3324 (_ BitVec 32)) (zeroValue!3426 V!5057) (minValue!3428 V!5057) (_size!1188 (_ BitVec 32)) (_keys!5424 array!7227) (_values!3568 array!7229) (_vacant!1188 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2278)

(declare-fun mapDefault!6906 () ValueCell!1685)

(assert (=> b!172958 (= condMapEmpty!6906 (= (arr!3435 (_values!3568 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1685)) mapDefault!6906)))))

(declare-fun e!114207 () Bool)

(declare-fun tp_is_empty!4057 () Bool)

(declare-fun array_inv!2211 (array!7227) Bool)

(declare-fun array_inv!2212 (array!7229) Bool)

(assert (=> b!172959 (= e!114207 (and tp!15512 tp_is_empty!4057 (array_inv!2211 (_keys!5424 thiss!1248)) (array_inv!2212 (_values!3568 thiss!1248)) e!114211))))

(declare-fun b!172960 () Bool)

(declare-fun e!114209 () Bool)

(assert (=> b!172960 (= e!114209 (and (= (size!3734 (_values!3568 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8445 thiss!1248))) (= (size!3733 (_keys!5424 thiss!1248)) (size!3734 (_values!3568 thiss!1248))) (bvsge (mask!8445 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3324 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3324 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3324 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3324 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3324 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3324 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)))))))

(declare-fun res!82119 () Bool)

(assert (=> start!17242 (=> (not res!82119) (not e!114209))))

(declare-fun valid!980 (LongMapFixedSize!2278) Bool)

(assert (=> start!17242 (= res!82119 (valid!980 thiss!1248))))

(assert (=> start!17242 e!114209))

(assert (=> start!17242 e!114207))

(assert (=> start!17242 true))

(declare-fun mapNonEmpty!6906 () Bool)

(declare-fun tp!15513 () Bool)

(declare-fun e!114210 () Bool)

(assert (=> mapNonEmpty!6906 (= mapRes!6906 (and tp!15513 e!114210))))

(declare-fun mapKey!6906 () (_ BitVec 32))

(declare-fun mapValue!6906 () ValueCell!1685)

(declare-fun mapRest!6906 () (Array (_ BitVec 32) ValueCell!1685))

(assert (=> mapNonEmpty!6906 (= (arr!3435 (_values!3568 thiss!1248)) (store mapRest!6906 mapKey!6906 mapValue!6906))))

(declare-fun mapIsEmpty!6906 () Bool)

(assert (=> mapIsEmpty!6906 mapRes!6906))

(declare-fun b!172961 () Bool)

(assert (=> b!172961 (= e!114210 tp_is_empty!4057)))

(declare-fun b!172962 () Bool)

(declare-fun res!82117 () Bool)

(assert (=> b!172962 (=> (not res!82117) (not e!114209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172962 (= res!82117 (validMask!0 (mask!8445 thiss!1248)))))

(declare-fun b!172963 () Bool)

(assert (=> b!172963 (= e!114212 tp_is_empty!4057)))

(declare-fun b!172964 () Bool)

(declare-fun res!82118 () Bool)

(assert (=> b!172964 (=> (not res!82118) (not e!114209))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172964 (= res!82118 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!17242 res!82119) b!172964))

(assert (= (and b!172964 res!82118) b!172962))

(assert (= (and b!172962 res!82117) b!172960))

(assert (= (and b!172958 condMapEmpty!6906) mapIsEmpty!6906))

(assert (= (and b!172958 (not condMapEmpty!6906)) mapNonEmpty!6906))

(get-info :version)

(assert (= (and mapNonEmpty!6906 ((_ is ValueCellFull!1685) mapValue!6906)) b!172961))

(assert (= (and b!172958 ((_ is ValueCellFull!1685) mapDefault!6906)) b!172963))

(assert (= b!172959 b!172958))

(assert (= start!17242 b!172959))

(declare-fun m!201635 () Bool)

(assert (=> b!172959 m!201635))

(declare-fun m!201637 () Bool)

(assert (=> b!172959 m!201637))

(declare-fun m!201639 () Bool)

(assert (=> start!17242 m!201639))

(declare-fun m!201641 () Bool)

(assert (=> mapNonEmpty!6906 m!201641))

(declare-fun m!201643 () Bool)

(assert (=> b!172962 m!201643))

(check-sat (not b!172959) (not b_next!4285) (not mapNonEmpty!6906) b_and!10739 (not start!17242) (not b!172962) tp_is_empty!4057)
(check-sat b_and!10739 (not b_next!4285))
