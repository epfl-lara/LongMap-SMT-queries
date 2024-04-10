; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17250 () Bool)

(assert start!17250)

(declare-fun b!173043 () Bool)

(declare-fun b_free!4297 () Bool)

(declare-fun b_next!4297 () Bool)

(assert (=> b!173043 (= b_free!4297 (not b_next!4297))))

(declare-fun tp!15548 () Bool)

(declare-fun b_and!10737 () Bool)

(assert (=> b!173043 (= tp!15548 b_and!10737)))

(declare-fun b!173039 () Bool)

(declare-fun e!114294 () Bool)

(declare-datatypes ((V!5073 0))(
  ( (V!5074 (val!2079 Int)) )
))
(declare-datatypes ((ValueCell!1691 0))(
  ( (ValueCellFull!1691 (v!3947 V!5073)) (EmptyCell!1691) )
))
(declare-datatypes ((array!7265 0))(
  ( (array!7266 (arr!3453 (Array (_ BitVec 32) (_ BitVec 64))) (size!3752 (_ BitVec 32))) )
))
(declare-datatypes ((array!7267 0))(
  ( (array!7268 (arr!3454 (Array (_ BitVec 32) ValueCell!1691)) (size!3753 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2290 0))(
  ( (LongMapFixedSize!2291 (defaultEntry!3591 Int) (mask!8455 (_ BitVec 32)) (extraKeys!3330 (_ BitVec 32)) (zeroValue!3432 V!5073) (minValue!3434 V!5073) (_size!1194 (_ BitVec 32)) (_keys!5430 array!7265) (_values!3574 array!7267) (_vacant!1194 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2290)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7265 (_ BitVec 32)) Bool)

(assert (=> b!173039 (= e!114294 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5430 thiss!1248) (mask!8455 thiss!1248))))))

(declare-fun b!173040 () Bool)

(declare-fun res!82154 () Bool)

(assert (=> b!173040 (=> (not res!82154) (not e!114294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173040 (= res!82154 (validMask!0 (mask!8455 thiss!1248)))))

(declare-fun b!173041 () Bool)

(declare-fun res!82155 () Bool)

(assert (=> b!173041 (=> (not res!82155) (not e!114294))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173041 (= res!82155 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173042 () Bool)

(declare-fun e!114292 () Bool)

(declare-fun tp_is_empty!4069 () Bool)

(assert (=> b!173042 (= e!114292 tp_is_empty!4069)))

(declare-fun mapNonEmpty!6924 () Bool)

(declare-fun mapRes!6924 () Bool)

(declare-fun tp!15549 () Bool)

(declare-fun e!114293 () Bool)

(assert (=> mapNonEmpty!6924 (= mapRes!6924 (and tp!15549 e!114293))))

(declare-fun mapKey!6924 () (_ BitVec 32))

(declare-fun mapValue!6924 () ValueCell!1691)

(declare-fun mapRest!6924 () (Array (_ BitVec 32) ValueCell!1691))

(assert (=> mapNonEmpty!6924 (= (arr!3454 (_values!3574 thiss!1248)) (store mapRest!6924 mapKey!6924 mapValue!6924))))

(declare-fun e!114296 () Bool)

(declare-fun e!114295 () Bool)

(declare-fun array_inv!2209 (array!7265) Bool)

(declare-fun array_inv!2210 (array!7267) Bool)

(assert (=> b!173043 (= e!114296 (and tp!15548 tp_is_empty!4069 (array_inv!2209 (_keys!5430 thiss!1248)) (array_inv!2210 (_values!3574 thiss!1248)) e!114295))))

(declare-fun b!173044 () Bool)

(assert (=> b!173044 (= e!114293 tp_is_empty!4069)))

(declare-fun b!173045 () Bool)

(declare-fun res!82153 () Bool)

(assert (=> b!173045 (=> (not res!82153) (not e!114294))))

(assert (=> b!173045 (= res!82153 (and (= (size!3753 (_values!3574 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8455 thiss!1248))) (= (size!3752 (_keys!5430 thiss!1248)) (size!3753 (_values!3574 thiss!1248))) (bvsge (mask!8455 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3330 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3330 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3330 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3330 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!173046 () Bool)

(assert (=> b!173046 (= e!114295 (and e!114292 mapRes!6924))))

(declare-fun condMapEmpty!6924 () Bool)

(declare-fun mapDefault!6924 () ValueCell!1691)

