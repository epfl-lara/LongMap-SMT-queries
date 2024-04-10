; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15628 () Bool)

(assert start!15628)

(declare-fun b!155706 () Bool)

(declare-fun b_free!3295 () Bool)

(declare-fun b_next!3295 () Bool)

(assert (=> b!155706 (= b_free!3295 (not b_next!3295))))

(declare-fun tp!12409 () Bool)

(declare-fun b_and!9709 () Bool)

(assert (=> b!155706 (= tp!12409 b_and!9709)))

(declare-fun mapIsEmpty!5288 () Bool)

(declare-fun mapRes!5288 () Bool)

(assert (=> mapIsEmpty!5288 mapRes!5288))

(declare-fun tp_is_empty!3097 () Bool)

(declare-fun e!101731 () Bool)

(declare-fun e!101732 () Bool)

(declare-datatypes ((V!3777 0))(
  ( (V!3778 (val!1593 Int)) )
))
(declare-datatypes ((ValueCell!1205 0))(
  ( (ValueCellFull!1205 (v!3458 V!3777)) (EmptyCell!1205) )
))
(declare-datatypes ((array!5247 0))(
  ( (array!5248 (arr!2481 (Array (_ BitVec 32) (_ BitVec 64))) (size!2759 (_ BitVec 32))) )
))
(declare-datatypes ((array!5249 0))(
  ( (array!5250 (arr!2482 (Array (_ BitVec 32) ValueCell!1205)) (size!2760 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1318 0))(
  ( (LongMapFixedSize!1319 (defaultEntry!3101 Int) (mask!7532 (_ BitVec 32)) (extraKeys!2842 (_ BitVec 32)) (zeroValue!2944 V!3777) (minValue!2944 V!3777) (_size!708 (_ BitVec 32)) (_keys!4876 array!5247) (_values!3084 array!5249) (_vacant!708 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1318)

(declare-fun array_inv!1567 (array!5247) Bool)

(declare-fun array_inv!1568 (array!5249) Bool)

(assert (=> b!155706 (= e!101732 (and tp!12409 tp_is_empty!3097 (array_inv!1567 (_keys!4876 thiss!1248)) (array_inv!1568 (_values!3084 thiss!1248)) e!101731))))

(declare-fun b!155707 () Bool)

(declare-fun res!73562 () Bool)

(declare-fun e!101728 () Bool)

(assert (=> b!155707 (=> (not res!73562) (not e!101728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5247 (_ BitVec 32)) Bool)

(assert (=> b!155707 (= res!73562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4876 thiss!1248) (mask!7532 thiss!1248)))))

(declare-fun b!155708 () Bool)

(declare-fun res!73564 () Bool)

(assert (=> b!155708 (=> (not res!73564) (not e!101728))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155708 (= res!73564 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155709 () Bool)

(declare-fun e!101729 () Bool)

(assert (=> b!155709 (= e!101731 (and e!101729 mapRes!5288))))

(declare-fun condMapEmpty!5288 () Bool)

(declare-fun mapDefault!5288 () ValueCell!1205)

