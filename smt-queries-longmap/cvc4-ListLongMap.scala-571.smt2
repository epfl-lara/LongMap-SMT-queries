; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15572 () Bool)

(assert start!15572)

(declare-fun b!154952 () Bool)

(declare-fun b_free!3239 () Bool)

(declare-fun b_next!3239 () Bool)

(assert (=> b!154952 (= b_free!3239 (not b_next!3239))))

(declare-fun tp!12242 () Bool)

(declare-fun b_and!9653 () Bool)

(assert (=> b!154952 (= tp!12242 b_and!9653)))

(declare-fun b!154950 () Bool)

(declare-fun res!73140 () Bool)

(declare-fun e!101224 () Bool)

(assert (=> b!154950 (=> (not res!73140) (not e!101224))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154950 (= res!73140 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154951 () Bool)

(declare-fun e!101229 () Bool)

(declare-fun tp_is_empty!3041 () Bool)

(assert (=> b!154951 (= e!101229 tp_is_empty!3041)))

(declare-fun e!101227 () Bool)

(declare-datatypes ((V!3701 0))(
  ( (V!3702 (val!1565 Int)) )
))
(declare-datatypes ((ValueCell!1177 0))(
  ( (ValueCellFull!1177 (v!3430 V!3701)) (EmptyCell!1177) )
))
(declare-datatypes ((array!5135 0))(
  ( (array!5136 (arr!2425 (Array (_ BitVec 32) (_ BitVec 64))) (size!2703 (_ BitVec 32))) )
))
(declare-datatypes ((array!5137 0))(
  ( (array!5138 (arr!2426 (Array (_ BitVec 32) ValueCell!1177)) (size!2704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1262 0))(
  ( (LongMapFixedSize!1263 (defaultEntry!3073 Int) (mask!7484 (_ BitVec 32)) (extraKeys!2814 (_ BitVec 32)) (zeroValue!2916 V!3701) (minValue!2916 V!3701) (_size!680 (_ BitVec 32)) (_keys!4848 array!5135) (_values!3056 array!5137) (_vacant!680 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1262)

(declare-fun e!101225 () Bool)

(declare-fun array_inv!1531 (array!5135) Bool)

(declare-fun array_inv!1532 (array!5137) Bool)

(assert (=> b!154952 (= e!101227 (and tp!12242 tp_is_empty!3041 (array_inv!1531 (_keys!4848 thiss!1248)) (array_inv!1532 (_values!3056 thiss!1248)) e!101225))))

(declare-fun res!73143 () Bool)

(assert (=> start!15572 (=> (not res!73143) (not e!101224))))

(declare-fun valid!623 (LongMapFixedSize!1262) Bool)

(assert (=> start!15572 (= res!73143 (valid!623 thiss!1248))))

(assert (=> start!15572 e!101224))

(assert (=> start!15572 e!101227))

(assert (=> start!15572 true))

(declare-fun b!154953 () Bool)

(declare-fun res!73141 () Bool)

(assert (=> b!154953 (=> (not res!73141) (not e!101224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154953 (= res!73141 (validMask!0 (mask!7484 thiss!1248)))))

(declare-fun b!154954 () Bool)

(declare-fun res!73142 () Bool)

(assert (=> b!154954 (=> (not res!73142) (not e!101224))))

(assert (=> b!154954 (= res!73142 (and (= (size!2704 (_values!3056 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7484 thiss!1248))) (= (size!2703 (_keys!4848 thiss!1248)) (size!2704 (_values!3056 thiss!1248))) (bvsge (mask!7484 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2814 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2814 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2814 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2814 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2814 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2814 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2814 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5204 () Bool)

(declare-fun mapRes!5204 () Bool)

(declare-fun tp!12241 () Bool)

(declare-fun e!101226 () Bool)

(assert (=> mapNonEmpty!5204 (= mapRes!5204 (and tp!12241 e!101226))))

(declare-fun mapRest!5204 () (Array (_ BitVec 32) ValueCell!1177))

(declare-fun mapValue!5204 () ValueCell!1177)

(declare-fun mapKey!5204 () (_ BitVec 32))

(assert (=> mapNonEmpty!5204 (= (arr!2426 (_values!3056 thiss!1248)) (store mapRest!5204 mapKey!5204 mapValue!5204))))

(declare-fun mapIsEmpty!5204 () Bool)

(assert (=> mapIsEmpty!5204 mapRes!5204))

(declare-fun b!154955 () Bool)

(assert (=> b!154955 (= e!101226 tp_is_empty!3041)))

(declare-fun b!154956 () Bool)

(assert (=> b!154956 (= e!101225 (and e!101229 mapRes!5204))))

(declare-fun condMapEmpty!5204 () Bool)

(declare-fun mapDefault!5204 () ValueCell!1177)

