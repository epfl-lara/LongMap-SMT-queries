; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15802 () Bool)

(assert start!15802)

(declare-fun b!157535 () Bool)

(declare-fun b_free!3445 () Bool)

(declare-fun b_next!3445 () Bool)

(assert (=> b!157535 (= b_free!3445 (not b_next!3445))))

(declare-fun tp!12867 () Bool)

(declare-fun b_and!9859 () Bool)

(assert (=> b!157535 (= tp!12867 b_and!9859)))

(declare-fun mapNonEmpty!5520 () Bool)

(declare-fun mapRes!5520 () Bool)

(declare-fun tp!12866 () Bool)

(declare-fun e!103167 () Bool)

(assert (=> mapNonEmpty!5520 (= mapRes!5520 (and tp!12866 e!103167))))

(declare-datatypes ((V!3977 0))(
  ( (V!3978 (val!1668 Int)) )
))
(declare-datatypes ((ValueCell!1280 0))(
  ( (ValueCellFull!1280 (v!3533 V!3977)) (EmptyCell!1280) )
))
(declare-fun mapValue!5520 () ValueCell!1280)

(declare-fun mapRest!5520 () (Array (_ BitVec 32) ValueCell!1280))

(declare-fun mapKey!5520 () (_ BitVec 32))

(declare-datatypes ((array!5551 0))(
  ( (array!5552 (arr!2631 (Array (_ BitVec 32) (_ BitVec 64))) (size!2910 (_ BitVec 32))) )
))
(declare-datatypes ((array!5553 0))(
  ( (array!5554 (arr!2632 (Array (_ BitVec 32) ValueCell!1280)) (size!2911 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1468 0))(
  ( (LongMapFixedSize!1469 (defaultEntry!3176 Int) (mask!7660 (_ BitVec 32)) (extraKeys!2917 (_ BitVec 32)) (zeroValue!3019 V!3977) (minValue!3019 V!3977) (_size!783 (_ BitVec 32)) (_keys!4952 array!5551) (_values!3159 array!5553) (_vacant!783 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1468)

(assert (=> mapNonEmpty!5520 (= (arr!2632 (_values!3159 thiss!1248)) (store mapRest!5520 mapKey!5520 mapValue!5520))))

(declare-fun e!103164 () Bool)

(declare-fun e!103169 () Bool)

(declare-fun tp_is_empty!3247 () Bool)

(declare-fun array_inv!1669 (array!5551) Bool)

(declare-fun array_inv!1670 (array!5553) Bool)

(assert (=> b!157535 (= e!103164 (and tp!12867 tp_is_empty!3247 (array_inv!1669 (_keys!4952 thiss!1248)) (array_inv!1670 (_values!3159 thiss!1248)) e!103169))))

(declare-fun b!157536 () Bool)

(declare-fun e!103165 () Bool)

(assert (=> b!157536 (= e!103165 (and (bvsge (mask!7660 thiss!1248) #b00000000000000000000000000000000) (not (= (size!2910 (_keys!4952 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7660 thiss!1248))))))))

(declare-fun b!157537 () Bool)

(declare-fun e!103168 () Bool)

(assert (=> b!157537 (= e!103168 tp_is_empty!3247)))

(declare-fun mapIsEmpty!5520 () Bool)

(assert (=> mapIsEmpty!5520 mapRes!5520))

(declare-fun res!74448 () Bool)

(assert (=> start!15802 (=> (not res!74448) (not e!103165))))

(declare-fun valid!696 (LongMapFixedSize!1468) Bool)

(assert (=> start!15802 (= res!74448 (valid!696 thiss!1248))))

(assert (=> start!15802 e!103165))

(assert (=> start!15802 e!103164))

(assert (=> start!15802 true))

(declare-fun b!157538 () Bool)

(declare-fun res!74449 () Bool)

(assert (=> b!157538 (=> (not res!74449) (not e!103165))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157538 (= res!74449 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157539 () Bool)

(assert (=> b!157539 (= e!103169 (and e!103168 mapRes!5520))))

(declare-fun condMapEmpty!5520 () Bool)

(declare-fun mapDefault!5520 () ValueCell!1280)

