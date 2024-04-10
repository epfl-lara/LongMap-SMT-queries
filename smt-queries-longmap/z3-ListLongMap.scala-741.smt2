; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17240 () Bool)

(assert start!17240)

(declare-fun b!172935 () Bool)

(declare-fun b_free!4287 () Bool)

(declare-fun b_next!4287 () Bool)

(assert (=> b!172935 (= b_free!4287 (not b_next!4287))))

(declare-fun tp!15518 () Bool)

(declare-fun b_and!10727 () Bool)

(assert (=> b!172935 (= tp!15518 b_and!10727)))

(declare-fun res!82107 () Bool)

(declare-fun e!114201 () Bool)

(assert (=> start!17240 (=> (not res!82107) (not e!114201))))

(declare-datatypes ((V!5059 0))(
  ( (V!5060 (val!2074 Int)) )
))
(declare-datatypes ((ValueCell!1686 0))(
  ( (ValueCellFull!1686 (v!3942 V!5059)) (EmptyCell!1686) )
))
(declare-datatypes ((array!7245 0))(
  ( (array!7246 (arr!3443 (Array (_ BitVec 32) (_ BitVec 64))) (size!3742 (_ BitVec 32))) )
))
(declare-datatypes ((array!7247 0))(
  ( (array!7248 (arr!3444 (Array (_ BitVec 32) ValueCell!1686)) (size!3743 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2280 0))(
  ( (LongMapFixedSize!2281 (defaultEntry!3586 Int) (mask!8446 (_ BitVec 32)) (extraKeys!3325 (_ BitVec 32)) (zeroValue!3427 V!5059) (minValue!3429 V!5059) (_size!1189 (_ BitVec 32)) (_keys!5425 array!7245) (_values!3569 array!7247) (_vacant!1189 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2280)

(declare-fun valid!966 (LongMapFixedSize!2280) Bool)

(assert (=> start!17240 (= res!82107 (valid!966 thiss!1248))))

(assert (=> start!17240 e!114201))

(declare-fun e!114205 () Bool)

(assert (=> start!17240 e!114205))

(assert (=> start!17240 true))

(declare-fun b!172932 () Bool)

(declare-fun e!114203 () Bool)

(declare-fun e!114206 () Bool)

(declare-fun mapRes!6909 () Bool)

(assert (=> b!172932 (= e!114203 (and e!114206 mapRes!6909))))

(declare-fun condMapEmpty!6909 () Bool)

(declare-fun mapDefault!6909 () ValueCell!1686)

(assert (=> b!172932 (= condMapEmpty!6909 (= (arr!3444 (_values!3569 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1686)) mapDefault!6909)))))

(declare-fun mapNonEmpty!6909 () Bool)

(declare-fun tp!15519 () Bool)

(declare-fun e!114204 () Bool)

(assert (=> mapNonEmpty!6909 (= mapRes!6909 (and tp!15519 e!114204))))

(declare-fun mapRest!6909 () (Array (_ BitVec 32) ValueCell!1686))

(declare-fun mapKey!6909 () (_ BitVec 32))

(declare-fun mapValue!6909 () ValueCell!1686)

(assert (=> mapNonEmpty!6909 (= (arr!3444 (_values!3569 thiss!1248)) (store mapRest!6909 mapKey!6909 mapValue!6909))))

(declare-fun b!172933 () Bool)

(assert (=> b!172933 (= e!114201 (and (= (size!3743 (_values!3569 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8446 thiss!1248))) (= (size!3742 (_keys!5425 thiss!1248)) (size!3743 (_values!3569 thiss!1248))) (bvsge (mask!8446 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3325 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3325 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3325 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3325 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3325 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3325 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)))))))

(declare-fun b!172934 () Bool)

(declare-fun tp_is_empty!4059 () Bool)

(assert (=> b!172934 (= e!114206 tp_is_empty!4059)))

(declare-fun array_inv!2203 (array!7245) Bool)

(declare-fun array_inv!2204 (array!7247) Bool)

(assert (=> b!172935 (= e!114205 (and tp!15518 tp_is_empty!4059 (array_inv!2203 (_keys!5425 thiss!1248)) (array_inv!2204 (_values!3569 thiss!1248)) e!114203))))

(declare-fun mapIsEmpty!6909 () Bool)

(assert (=> mapIsEmpty!6909 mapRes!6909))

(declare-fun b!172936 () Bool)

(declare-fun res!82105 () Bool)

(assert (=> b!172936 (=> (not res!82105) (not e!114201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172936 (= res!82105 (validMask!0 (mask!8446 thiss!1248)))))

(declare-fun b!172937 () Bool)

(assert (=> b!172937 (= e!114204 tp_is_empty!4059)))

(declare-fun b!172938 () Bool)

(declare-fun res!82106 () Bool)

(assert (=> b!172938 (=> (not res!82106) (not e!114201))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172938 (= res!82106 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!17240 res!82107) b!172938))

(assert (= (and b!172938 res!82106) b!172936))

(assert (= (and b!172936 res!82105) b!172933))

(assert (= (and b!172932 condMapEmpty!6909) mapIsEmpty!6909))

(assert (= (and b!172932 (not condMapEmpty!6909)) mapNonEmpty!6909))

(get-info :version)

(assert (= (and mapNonEmpty!6909 ((_ is ValueCellFull!1686) mapValue!6909)) b!172937))

(assert (= (and b!172932 ((_ is ValueCellFull!1686) mapDefault!6909)) b!172934))

(assert (= b!172935 b!172932))

(assert (= start!17240 b!172935))

(declare-fun m!201463 () Bool)

(assert (=> start!17240 m!201463))

(declare-fun m!201465 () Bool)

(assert (=> mapNonEmpty!6909 m!201465))

(declare-fun m!201467 () Bool)

(assert (=> b!172935 m!201467))

(declare-fun m!201469 () Bool)

(assert (=> b!172935 m!201469))

(declare-fun m!201471 () Bool)

(assert (=> b!172936 m!201471))

(check-sat (not b!172935) tp_is_empty!4059 (not start!17240) (not mapNonEmpty!6909) b_and!10727 (not b!172936) (not b_next!4287))
(check-sat b_and!10727 (not b_next!4287))
