; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17246 () Bool)

(assert start!17246)

(declare-fun b!172997 () Bool)

(declare-fun b_free!4293 () Bool)

(declare-fun b_next!4293 () Bool)

(assert (=> b!172997 (= b_free!4293 (not b_next!4293))))

(declare-fun tp!15536 () Bool)

(declare-fun b_and!10733 () Bool)

(assert (=> b!172997 (= tp!15536 b_and!10733)))

(declare-fun b!172995 () Bool)

(declare-fun e!114260 () Bool)

(declare-fun e!114255 () Bool)

(declare-fun mapRes!6918 () Bool)

(assert (=> b!172995 (= e!114260 (and e!114255 mapRes!6918))))

(declare-fun condMapEmpty!6918 () Bool)

(declare-datatypes ((V!5067 0))(
  ( (V!5068 (val!2077 Int)) )
))
(declare-datatypes ((ValueCell!1689 0))(
  ( (ValueCellFull!1689 (v!3945 V!5067)) (EmptyCell!1689) )
))
(declare-datatypes ((array!7257 0))(
  ( (array!7258 (arr!3449 (Array (_ BitVec 32) (_ BitVec 64))) (size!3748 (_ BitVec 32))) )
))
(declare-datatypes ((array!7259 0))(
  ( (array!7260 (arr!3450 (Array (_ BitVec 32) ValueCell!1689)) (size!3749 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2286 0))(
  ( (LongMapFixedSize!2287 (defaultEntry!3589 Int) (mask!8451 (_ BitVec 32)) (extraKeys!3328 (_ BitVec 32)) (zeroValue!3430 V!5067) (minValue!3432 V!5067) (_size!1192 (_ BitVec 32)) (_keys!5428 array!7257) (_values!3572 array!7259) (_vacant!1192 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2286)

(declare-fun mapDefault!6918 () ValueCell!1689)

(assert (=> b!172995 (= condMapEmpty!6918 (= (arr!3450 (_values!3572 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1689)) mapDefault!6918)))))

(declare-fun res!82133 () Bool)

(declare-fun e!114258 () Bool)

(assert (=> start!17246 (=> (not res!82133) (not e!114258))))

(declare-fun valid!968 (LongMapFixedSize!2286) Bool)

(assert (=> start!17246 (= res!82133 (valid!968 thiss!1248))))

(assert (=> start!17246 e!114258))

(declare-fun e!114256 () Bool)

(assert (=> start!17246 e!114256))

(assert (=> start!17246 true))

(declare-fun b!172996 () Bool)

(assert (=> b!172996 (= e!114258 (and (= (size!3749 (_values!3572 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8451 thiss!1248))) (= (size!3748 (_keys!5428 thiss!1248)) (size!3749 (_values!3572 thiss!1248))) (bvsge (mask!8451 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3328 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3328 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3328 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3328 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3328 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3328 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (= (bvand (bvor (extraKeys!3328 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6918 () Bool)

(declare-fun tp!15537 () Bool)

(declare-fun e!114257 () Bool)

(assert (=> mapNonEmpty!6918 (= mapRes!6918 (and tp!15537 e!114257))))

(declare-fun mapKey!6918 () (_ BitVec 32))

(declare-fun mapRest!6918 () (Array (_ BitVec 32) ValueCell!1689))

(declare-fun mapValue!6918 () ValueCell!1689)

(assert (=> mapNonEmpty!6918 (= (arr!3450 (_values!3572 thiss!1248)) (store mapRest!6918 mapKey!6918 mapValue!6918))))

(declare-fun tp_is_empty!4065 () Bool)

(declare-fun array_inv!2205 (array!7257) Bool)

(declare-fun array_inv!2206 (array!7259) Bool)

(assert (=> b!172997 (= e!114256 (and tp!15536 tp_is_empty!4065 (array_inv!2205 (_keys!5428 thiss!1248)) (array_inv!2206 (_values!3572 thiss!1248)) e!114260))))

(declare-fun b!172998 () Bool)

(assert (=> b!172998 (= e!114257 tp_is_empty!4065)))

(declare-fun b!172999 () Bool)

(declare-fun res!82132 () Bool)

(assert (=> b!172999 (=> (not res!82132) (not e!114258))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172999 (= res!82132 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!6918 () Bool)

(assert (=> mapIsEmpty!6918 mapRes!6918))

(declare-fun b!173000 () Bool)

(declare-fun res!82134 () Bool)

(assert (=> b!173000 (=> (not res!82134) (not e!114258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173000 (= res!82134 (validMask!0 (mask!8451 thiss!1248)))))

(declare-fun b!173001 () Bool)

(assert (=> b!173001 (= e!114255 tp_is_empty!4065)))

(assert (= (and start!17246 res!82133) b!172999))

(assert (= (and b!172999 res!82132) b!173000))

(assert (= (and b!173000 res!82134) b!172996))

(assert (= (and b!172995 condMapEmpty!6918) mapIsEmpty!6918))

(assert (= (and b!172995 (not condMapEmpty!6918)) mapNonEmpty!6918))

(get-info :version)

(assert (= (and mapNonEmpty!6918 ((_ is ValueCellFull!1689) mapValue!6918)) b!172998))

(assert (= (and b!172995 ((_ is ValueCellFull!1689) mapDefault!6918)) b!173001))

(assert (= b!172997 b!172995))

(assert (= start!17246 b!172997))

(declare-fun m!201493 () Bool)

(assert (=> start!17246 m!201493))

(declare-fun m!201495 () Bool)

(assert (=> mapNonEmpty!6918 m!201495))

(declare-fun m!201497 () Bool)

(assert (=> b!172997 m!201497))

(declare-fun m!201499 () Bool)

(assert (=> b!172997 m!201499))

(declare-fun m!201501 () Bool)

(assert (=> b!173000 m!201501))

(check-sat (not start!17246) tp_is_empty!4065 (not b_next!4293) (not mapNonEmpty!6918) b_and!10733 (not b!172997) (not b!173000))
(check-sat b_and!10733 (not b_next!4293))
