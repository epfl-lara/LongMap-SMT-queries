; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16272 () Bool)

(assert start!16272)

(declare-fun b!162337 () Bool)

(declare-fun b_free!3733 () Bool)

(declare-fun b_next!3733 () Bool)

(assert (=> b!162337 (= b_free!3733 (not b_next!3733))))

(declare-fun tp!13769 () Bool)

(declare-fun b_and!10147 () Bool)

(assert (=> b!162337 (= tp!13769 b_and!10147)))

(declare-fun b!162335 () Bool)

(declare-fun e!106354 () Bool)

(declare-fun tp_is_empty!3535 () Bool)

(assert (=> b!162335 (= e!106354 tp_is_empty!3535)))

(declare-fun b!162336 () Bool)

(declare-fun e!106352 () Bool)

(assert (=> b!162336 (= e!106352 tp_is_empty!3535)))

(declare-fun res!76880 () Bool)

(declare-fun e!106356 () Bool)

(assert (=> start!16272 (=> (not res!76880) (not e!106356))))

(declare-datatypes ((V!4361 0))(
  ( (V!4362 (val!1812 Int)) )
))
(declare-datatypes ((ValueCell!1424 0))(
  ( (ValueCellFull!1424 (v!3677 V!4361)) (EmptyCell!1424) )
))
(declare-datatypes ((array!6149 0))(
  ( (array!6150 (arr!2919 (Array (_ BitVec 32) (_ BitVec 64))) (size!3203 (_ BitVec 32))) )
))
(declare-datatypes ((array!6151 0))(
  ( (array!6152 (arr!2920 (Array (_ BitVec 32) ValueCell!1424)) (size!3204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1756 0))(
  ( (LongMapFixedSize!1757 (defaultEntry!3320 Int) (mask!7940 (_ BitVec 32)) (extraKeys!3061 (_ BitVec 32)) (zeroValue!3163 V!4361) (minValue!3163 V!4361) (_size!927 (_ BitVec 32)) (_keys!5121 array!6149) (_values!3303 array!6151) (_vacant!927 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1756)

(declare-fun valid!794 (LongMapFixedSize!1756) Bool)

(assert (=> start!16272 (= res!76880 (valid!794 thiss!1248))))

(assert (=> start!16272 e!106356))

(declare-fun e!106353 () Bool)

(assert (=> start!16272 e!106353))

(assert (=> start!16272 true))

(declare-fun mapIsEmpty!5990 () Bool)

(declare-fun mapRes!5990 () Bool)

(assert (=> mapIsEmpty!5990 mapRes!5990))

(declare-fun mapNonEmpty!5990 () Bool)

(declare-fun tp!13768 () Bool)

(assert (=> mapNonEmpty!5990 (= mapRes!5990 (and tp!13768 e!106352))))

(declare-fun mapKey!5990 () (_ BitVec 32))

(declare-fun mapValue!5990 () ValueCell!1424)

(declare-fun mapRest!5990 () (Array (_ BitVec 32) ValueCell!1424))

(assert (=> mapNonEmpty!5990 (= (arr!2920 (_values!3303 thiss!1248)) (store mapRest!5990 mapKey!5990 mapValue!5990))))

(declare-fun e!106351 () Bool)

(declare-fun array_inv!1869 (array!6149) Bool)

(declare-fun array_inv!1870 (array!6151) Bool)

(assert (=> b!162337 (= e!106353 (and tp!13769 tp_is_empty!3535 (array_inv!1869 (_keys!5121 thiss!1248)) (array_inv!1870 (_values!3303 thiss!1248)) e!106351))))

(declare-fun b!162338 () Bool)

(assert (=> b!162338 (= e!106351 (and e!106354 mapRes!5990))))

(declare-fun condMapEmpty!5990 () Bool)

(declare-fun mapDefault!5990 () ValueCell!1424)

