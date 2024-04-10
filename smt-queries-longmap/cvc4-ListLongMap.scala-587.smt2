; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15668 () Bool)

(assert start!15668)

(declare-fun b!156134 () Bool)

(declare-fun b_free!3335 () Bool)

(declare-fun b_next!3335 () Bool)

(assert (=> b!156134 (= b_free!3335 (not b_next!3335))))

(declare-fun tp!12529 () Bool)

(declare-fun b_and!9749 () Bool)

(assert (=> b!156134 (= tp!12529 b_and!9749)))

(declare-fun b!156129 () Bool)

(declare-fun res!73746 () Bool)

(declare-fun e!102106 () Bool)

(assert (=> b!156129 (=> (not res!73746) (not e!102106))))

(declare-datatypes ((V!3829 0))(
  ( (V!3830 (val!1613 Int)) )
))
(declare-datatypes ((ValueCell!1225 0))(
  ( (ValueCellFull!1225 (v!3478 V!3829)) (EmptyCell!1225) )
))
(declare-datatypes ((array!5327 0))(
  ( (array!5328 (arr!2521 (Array (_ BitVec 32) (_ BitVec 64))) (size!2799 (_ BitVec 32))) )
))
(declare-datatypes ((array!5329 0))(
  ( (array!5330 (arr!2522 (Array (_ BitVec 32) ValueCell!1225)) (size!2800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1358 0))(
  ( (LongMapFixedSize!1359 (defaultEntry!3121 Int) (mask!7564 (_ BitVec 32)) (extraKeys!2862 (_ BitVec 32)) (zeroValue!2964 V!3829) (minValue!2964 V!3829) (_size!728 (_ BitVec 32)) (_keys!4896 array!5327) (_values!3104 array!5329) (_vacant!728 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1358)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5327 (_ BitVec 32)) Bool)

(assert (=> b!156129 (= res!73746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4896 thiss!1248) (mask!7564 thiss!1248)))))

(declare-fun b!156130 () Bool)

(declare-fun res!73743 () Bool)

(assert (=> b!156130 (=> (not res!73743) (not e!102106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156130 (= res!73743 (validMask!0 (mask!7564 thiss!1248)))))

(declare-fun b!156131 () Bool)

(declare-fun e!102108 () Bool)

(declare-fun tp_is_empty!3137 () Bool)

(assert (=> b!156131 (= e!102108 tp_is_empty!3137)))

(declare-fun b!156132 () Bool)

(declare-fun res!73744 () Bool)

(assert (=> b!156132 (=> (not res!73744) (not e!102106))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156132 (= res!73744 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5348 () Bool)

(declare-fun mapRes!5348 () Bool)

(declare-fun tp!12530 () Bool)

(declare-fun e!102107 () Bool)

(assert (=> mapNonEmpty!5348 (= mapRes!5348 (and tp!12530 e!102107))))

(declare-fun mapValue!5348 () ValueCell!1225)

(declare-fun mapRest!5348 () (Array (_ BitVec 32) ValueCell!1225))

(declare-fun mapKey!5348 () (_ BitVec 32))

(assert (=> mapNonEmpty!5348 (= (arr!2522 (_values!3104 thiss!1248)) (store mapRest!5348 mapKey!5348 mapValue!5348))))

(declare-fun res!73747 () Bool)

(assert (=> start!15668 (=> (not res!73747) (not e!102106))))

(declare-fun valid!660 (LongMapFixedSize!1358) Bool)

(assert (=> start!15668 (= res!73747 (valid!660 thiss!1248))))

(assert (=> start!15668 e!102106))

(declare-fun e!102110 () Bool)

(assert (=> start!15668 e!102110))

(assert (=> start!15668 true))

(declare-fun b!156133 () Bool)

(assert (=> b!156133 (= e!102106 false)))

(declare-fun lt!81517 () Bool)

(declare-datatypes ((List!1847 0))(
  ( (Nil!1844) (Cons!1843 (h!2452 (_ BitVec 64)) (t!6649 List!1847)) )
))
(declare-fun arrayNoDuplicates!0 (array!5327 (_ BitVec 32) List!1847) Bool)

(assert (=> b!156133 (= lt!81517 (arrayNoDuplicates!0 (_keys!4896 thiss!1248) #b00000000000000000000000000000000 Nil!1844))))

(declare-fun e!102111 () Bool)

(declare-fun array_inv!1591 (array!5327) Bool)

(declare-fun array_inv!1592 (array!5329) Bool)

(assert (=> b!156134 (= e!102110 (and tp!12529 tp_is_empty!3137 (array_inv!1591 (_keys!4896 thiss!1248)) (array_inv!1592 (_values!3104 thiss!1248)) e!102111))))

(declare-fun mapIsEmpty!5348 () Bool)

(assert (=> mapIsEmpty!5348 mapRes!5348))

(declare-fun b!156135 () Bool)

(declare-fun res!73745 () Bool)

(assert (=> b!156135 (=> (not res!73745) (not e!102106))))

(assert (=> b!156135 (= res!73745 (and (= (size!2800 (_values!3104 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7564 thiss!1248))) (= (size!2799 (_keys!4896 thiss!1248)) (size!2800 (_values!3104 thiss!1248))) (bvsge (mask!7564 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2862 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2862 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2862 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2862 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2862 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2862 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2862 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156136 () Bool)

(assert (=> b!156136 (= e!102107 tp_is_empty!3137)))

(declare-fun b!156137 () Bool)

(assert (=> b!156137 (= e!102111 (and e!102108 mapRes!5348))))

(declare-fun condMapEmpty!5348 () Bool)

(declare-fun mapDefault!5348 () ValueCell!1225)

