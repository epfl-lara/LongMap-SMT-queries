; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17204 () Bool)

(assert start!17204)

(declare-fun b!172656 () Bool)

(declare-fun b_free!4267 () Bool)

(declare-fun b_next!4267 () Bool)

(assert (=> b!172656 (= b_free!4267 (not b_next!4267))))

(declare-fun tp!15455 () Bool)

(declare-fun b_and!10707 () Bool)

(assert (=> b!172656 (= tp!15455 b_and!10707)))

(declare-fun mapIsEmpty!6875 () Bool)

(declare-fun mapRes!6875 () Bool)

(assert (=> mapIsEmpty!6875 mapRes!6875))

(declare-fun b!172652 () Bool)

(declare-fun res!81981 () Bool)

(declare-fun e!113980 () Bool)

(assert (=> b!172652 (=> (not res!81981) (not e!113980))))

(declare-datatypes ((V!5033 0))(
  ( (V!5034 (val!2064 Int)) )
))
(declare-datatypes ((ValueCell!1676 0))(
  ( (ValueCellFull!1676 (v!3932 V!5033)) (EmptyCell!1676) )
))
(declare-datatypes ((array!7203 0))(
  ( (array!7204 (arr!3423 (Array (_ BitVec 32) (_ BitVec 64))) (size!3721 (_ BitVec 32))) )
))
(declare-datatypes ((array!7205 0))(
  ( (array!7206 (arr!3424 (Array (_ BitVec 32) ValueCell!1676)) (size!3722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2260 0))(
  ( (LongMapFixedSize!2261 (defaultEntry!3576 Int) (mask!8428 (_ BitVec 32)) (extraKeys!3315 (_ BitVec 32)) (zeroValue!3417 V!5033) (minValue!3419 V!5033) (_size!1179 (_ BitVec 32)) (_keys!5414 array!7203) (_values!3559 array!7205) (_vacant!1179 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2260)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172652 (= res!81981 (validMask!0 (mask!8428 thiss!1248)))))

(declare-fun b!172653 () Bool)

(declare-fun res!81979 () Bool)

(assert (=> b!172653 (=> (not res!81979) (not e!113980))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172653 (= res!81979 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172654 () Bool)

(declare-fun e!113984 () Bool)

(declare-fun tp_is_empty!4039 () Bool)

(assert (=> b!172654 (= e!113984 tp_is_empty!4039)))

(declare-fun b!172655 () Bool)

(declare-fun e!113985 () Bool)

(assert (=> b!172655 (= e!113985 tp_is_empty!4039)))

(declare-fun e!113981 () Bool)

(declare-fun e!113983 () Bool)

(declare-fun array_inv!2191 (array!7203) Bool)

(declare-fun array_inv!2192 (array!7205) Bool)

(assert (=> b!172656 (= e!113983 (and tp!15455 tp_is_empty!4039 (array_inv!2191 (_keys!5414 thiss!1248)) (array_inv!2192 (_values!3559 thiss!1248)) e!113981))))

(declare-fun mapNonEmpty!6875 () Bool)

(declare-fun tp!15454 () Bool)

(assert (=> mapNonEmpty!6875 (= mapRes!6875 (and tp!15454 e!113985))))

(declare-fun mapKey!6875 () (_ BitVec 32))

(declare-fun mapValue!6875 () ValueCell!1676)

(declare-fun mapRest!6875 () (Array (_ BitVec 32) ValueCell!1676))

(assert (=> mapNonEmpty!6875 (= (arr!3424 (_values!3559 thiss!1248)) (store mapRest!6875 mapKey!6875 mapValue!6875))))

(declare-fun b!172658 () Bool)

(assert (=> b!172658 (= e!113980 (and (= (size!3722 (_values!3559 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8428 thiss!1248))) (= (size!3721 (_keys!5414 thiss!1248)) (size!3722 (_values!3559 thiss!1248))) (bvsge (mask!8428 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3315 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3315 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!172657 () Bool)

(assert (=> b!172657 (= e!113981 (and e!113984 mapRes!6875))))

(declare-fun condMapEmpty!6875 () Bool)

(declare-fun mapDefault!6875 () ValueCell!1676)

