; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21664 () Bool)

(assert start!21664)

(declare-fun b!217431 () Bool)

(declare-fun b_free!5813 () Bool)

(declare-fun b_next!5813 () Bool)

(assert (=> b!217431 (= b_free!5813 (not b_next!5813))))

(declare-fun tp!20574 () Bool)

(declare-fun b_and!12703 () Bool)

(assert (=> b!217431 (= tp!20574 b_and!12703)))

(declare-fun b!217426 () Bool)

(declare-fun e!141449 () Bool)

(declare-fun tp_is_empty!5675 () Bool)

(assert (=> b!217426 (= e!141449 tp_is_empty!5675)))

(declare-fun mapNonEmpty!9675 () Bool)

(declare-fun mapRes!9675 () Bool)

(declare-fun tp!20573 () Bool)

(declare-fun e!141448 () Bool)

(assert (=> mapNonEmpty!9675 (= mapRes!9675 (and tp!20573 e!141448))))

(declare-fun mapKey!9675 () (_ BitVec 32))

(declare-datatypes ((V!7213 0))(
  ( (V!7214 (val!2882 Int)) )
))
(declare-datatypes ((ValueCell!2494 0))(
  ( (ValueCellFull!2494 (v!4900 V!7213)) (EmptyCell!2494) )
))
(declare-datatypes ((array!10589 0))(
  ( (array!10590 (arr!5016 (Array (_ BitVec 32) ValueCell!2494)) (size!5348 (_ BitVec 32))) )
))
(declare-datatypes ((array!10591 0))(
  ( (array!10592 (arr!5017 (Array (_ BitVec 32) (_ BitVec 64))) (size!5349 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2888 0))(
  ( (LongMapFixedSize!2889 (defaultEntry!4094 Int) (mask!9849 (_ BitVec 32)) (extraKeys!3831 (_ BitVec 32)) (zeroValue!3935 V!7213) (minValue!3935 V!7213) (_size!1493 (_ BitVec 32)) (_keys!6143 array!10591) (_values!4077 array!10589) (_vacant!1493 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2888)

(declare-fun mapRest!9675 () (Array (_ BitVec 32) ValueCell!2494))

(declare-fun mapValue!9675 () ValueCell!2494)

(assert (=> mapNonEmpty!9675 (= (arr!5016 (_values!4077 thiss!1504)) (store mapRest!9675 mapKey!9675 mapValue!9675))))

(declare-fun mapIsEmpty!9675 () Bool)

(assert (=> mapIsEmpty!9675 mapRes!9675))

(declare-fun b!217427 () Bool)

(declare-fun res!106467 () Bool)

(declare-fun e!141451 () Bool)

(assert (=> b!217427 (=> (not res!106467) (not e!141451))))

(assert (=> b!217427 (= res!106467 (and (= (size!5348 (_values!4077 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9849 thiss!1504))) (= (size!5349 (_keys!6143 thiss!1504)) (size!5348 (_values!4077 thiss!1504))) (bvsge (mask!9849 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3831 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3831 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217428 () Bool)

(declare-fun e!141447 () Bool)

(assert (=> b!217428 (= e!141447 (and e!141449 mapRes!9675))))

(declare-fun condMapEmpty!9675 () Bool)

(declare-fun mapDefault!9675 () ValueCell!2494)
