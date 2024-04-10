; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17208 () Bool)

(assert start!17208)

(declare-fun b!172695 () Bool)

(declare-fun b_free!4271 () Bool)

(declare-fun b_next!4271 () Bool)

(assert (=> b!172695 (= b_free!4271 (not b_next!4271))))

(declare-fun tp!15466 () Bool)

(declare-fun b_and!10711 () Bool)

(assert (=> b!172695 (= tp!15466 b_and!10711)))

(declare-fun mapNonEmpty!6881 () Bool)

(declare-fun mapRes!6881 () Bool)

(declare-fun tp!15467 () Bool)

(declare-fun e!114019 () Bool)

(assert (=> mapNonEmpty!6881 (= mapRes!6881 (and tp!15467 e!114019))))

(declare-datatypes ((V!5037 0))(
  ( (V!5038 (val!2066 Int)) )
))
(declare-datatypes ((ValueCell!1678 0))(
  ( (ValueCellFull!1678 (v!3934 V!5037)) (EmptyCell!1678) )
))
(declare-fun mapValue!6881 () ValueCell!1678)

(declare-fun mapRest!6881 () (Array (_ BitVec 32) ValueCell!1678))

(declare-fun mapKey!6881 () (_ BitVec 32))

(declare-datatypes ((array!7211 0))(
  ( (array!7212 (arr!3427 (Array (_ BitVec 32) (_ BitVec 64))) (size!3725 (_ BitVec 32))) )
))
(declare-datatypes ((array!7213 0))(
  ( (array!7214 (arr!3428 (Array (_ BitVec 32) ValueCell!1678)) (size!3726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2264 0))(
  ( (LongMapFixedSize!2265 (defaultEntry!3578 Int) (mask!8430 (_ BitVec 32)) (extraKeys!3317 (_ BitVec 32)) (zeroValue!3419 V!5037) (minValue!3421 V!5037) (_size!1181 (_ BitVec 32)) (_keys!5416 array!7211) (_values!3561 array!7213) (_vacant!1181 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2264)

(assert (=> mapNonEmpty!6881 (= (arr!3428 (_values!3561 thiss!1248)) (store mapRest!6881 mapKey!6881 mapValue!6881))))

(declare-fun b!172694 () Bool)

(declare-fun res!81997 () Bool)

(declare-fun e!114021 () Bool)

(assert (=> b!172694 (=> (not res!81997) (not e!114021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172694 (= res!81997 (validMask!0 (mask!8430 thiss!1248)))))

(declare-fun res!81998 () Bool)

(assert (=> start!17208 (=> (not res!81998) (not e!114021))))

(declare-fun valid!959 (LongMapFixedSize!2264) Bool)

(assert (=> start!17208 (= res!81998 (valid!959 thiss!1248))))

(assert (=> start!17208 e!114021))

(declare-fun e!114020 () Bool)

(assert (=> start!17208 e!114020))

(assert (=> start!17208 true))

(declare-fun e!114018 () Bool)

(declare-fun tp_is_empty!4043 () Bool)

(declare-fun array_inv!2195 (array!7211) Bool)

(declare-fun array_inv!2196 (array!7213) Bool)

(assert (=> b!172695 (= e!114020 (and tp!15466 tp_is_empty!4043 (array_inv!2195 (_keys!5416 thiss!1248)) (array_inv!2196 (_values!3561 thiss!1248)) e!114018))))

(declare-fun b!172696 () Bool)

(declare-fun e!114016 () Bool)

(assert (=> b!172696 (= e!114016 tp_is_empty!4043)))

(declare-fun b!172697 () Bool)

(declare-fun res!81999 () Bool)

(assert (=> b!172697 (=> (not res!81999) (not e!114021))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172697 (= res!81999 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172698 () Bool)

(assert (=> b!172698 (= e!114021 (and (= (size!3726 (_values!3561 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8430 thiss!1248))) (= (size!3725 (_keys!5416 thiss!1248)) (size!3726 (_values!3561 thiss!1248))) (bvsge (mask!8430 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3317 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3317 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6881 () Bool)

(assert (=> mapIsEmpty!6881 mapRes!6881))

(declare-fun b!172699 () Bool)

(assert (=> b!172699 (= e!114019 tp_is_empty!4043)))

(declare-fun b!172700 () Bool)

(assert (=> b!172700 (= e!114018 (and e!114016 mapRes!6881))))

(declare-fun condMapEmpty!6881 () Bool)

(declare-fun mapDefault!6881 () ValueCell!1678)

