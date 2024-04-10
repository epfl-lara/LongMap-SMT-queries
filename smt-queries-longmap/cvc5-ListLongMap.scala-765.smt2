; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18038 () Bool)

(assert start!18038)

(declare-fun b!179609 () Bool)

(declare-fun b_free!4429 () Bool)

(declare-fun b_next!4429 () Bool)

(assert (=> b!179609 (= b_free!4429 (not b_next!4429))))

(declare-fun tp!16015 () Bool)

(declare-fun b_and!10961 () Bool)

(assert (=> b!179609 (= tp!16015 b_and!10961)))

(declare-fun b!179601 () Bool)

(declare-fun res!85071 () Bool)

(declare-fun e!118310 () Bool)

(assert (=> b!179601 (=> (not res!85071) (not e!118310))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!179601 (= res!85071 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7192 () Bool)

(declare-fun mapRes!7192 () Bool)

(declare-fun tp!16014 () Bool)

(declare-fun e!118309 () Bool)

(assert (=> mapNonEmpty!7192 (= mapRes!7192 (and tp!16014 e!118309))))

(declare-datatypes ((V!5249 0))(
  ( (V!5250 (val!2145 Int)) )
))
(declare-datatypes ((ValueCell!1757 0))(
  ( (ValueCellFull!1757 (v!4033 V!5249)) (EmptyCell!1757) )
))
(declare-fun mapValue!7192 () ValueCell!1757)

(declare-fun mapKey!7192 () (_ BitVec 32))

(declare-fun mapRest!7192 () (Array (_ BitVec 32) ValueCell!1757))

(declare-datatypes ((array!7569 0))(
  ( (array!7570 (arr!3585 (Array (_ BitVec 32) (_ BitVec 64))) (size!3893 (_ BitVec 32))) )
))
(declare-datatypes ((array!7571 0))(
  ( (array!7572 (arr!3586 (Array (_ BitVec 32) ValueCell!1757)) (size!3894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2422 0))(
  ( (LongMapFixedSize!2423 (defaultEntry!3686 Int) (mask!8672 (_ BitVec 32)) (extraKeys!3423 (_ BitVec 32)) (zeroValue!3527 V!5249) (minValue!3527 V!5249) (_size!1260 (_ BitVec 32)) (_keys!5575 array!7569) (_values!3669 array!7571) (_vacant!1260 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2422)

(assert (=> mapNonEmpty!7192 (= (arr!3586 (_values!3669 thiss!1248)) (store mapRest!7192 mapKey!7192 mapValue!7192))))

(declare-fun b!179603 () Bool)

(declare-fun e!118311 () Bool)

(declare-fun e!118308 () Bool)

(assert (=> b!179603 (= e!118311 (and e!118308 mapRes!7192))))

(declare-fun condMapEmpty!7192 () Bool)

(declare-fun mapDefault!7192 () ValueCell!1757)

