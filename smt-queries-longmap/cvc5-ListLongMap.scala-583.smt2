; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15640 () Bool)

(assert start!15640)

(declare-fun b!155838 () Bool)

(declare-fun b_free!3307 () Bool)

(declare-fun b_next!3307 () Bool)

(assert (=> b!155838 (= b_free!3307 (not b_next!3307))))

(declare-fun tp!12446 () Bool)

(declare-fun b_and!9721 () Bool)

(assert (=> b!155838 (= tp!12446 b_and!9721)))

(declare-fun mapNonEmpty!5306 () Bool)

(declare-fun mapRes!5306 () Bool)

(declare-fun tp!12445 () Bool)

(declare-fun e!101841 () Bool)

(assert (=> mapNonEmpty!5306 (= mapRes!5306 (and tp!12445 e!101841))))

(declare-datatypes ((V!3793 0))(
  ( (V!3794 (val!1599 Int)) )
))
(declare-datatypes ((ValueCell!1211 0))(
  ( (ValueCellFull!1211 (v!3464 V!3793)) (EmptyCell!1211) )
))
(declare-fun mapRest!5306 () (Array (_ BitVec 32) ValueCell!1211))

(declare-fun mapValue!5306 () ValueCell!1211)

(declare-fun mapKey!5306 () (_ BitVec 32))

(declare-datatypes ((array!5271 0))(
  ( (array!5272 (arr!2493 (Array (_ BitVec 32) (_ BitVec 64))) (size!2771 (_ BitVec 32))) )
))
(declare-datatypes ((array!5273 0))(
  ( (array!5274 (arr!2494 (Array (_ BitVec 32) ValueCell!1211)) (size!2772 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1330 0))(
  ( (LongMapFixedSize!1331 (defaultEntry!3107 Int) (mask!7542 (_ BitVec 32)) (extraKeys!2848 (_ BitVec 32)) (zeroValue!2950 V!3793) (minValue!2950 V!3793) (_size!714 (_ BitVec 32)) (_keys!4882 array!5271) (_values!3090 array!5273) (_vacant!714 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1330)

(assert (=> mapNonEmpty!5306 (= (arr!2494 (_values!3090 thiss!1248)) (store mapRest!5306 mapKey!5306 mapValue!5306))))

(declare-fun b!155837 () Bool)

(declare-fun tp_is_empty!3109 () Bool)

(assert (=> b!155837 (= e!101841 tp_is_empty!3109)))

(declare-fun e!101844 () Bool)

(declare-fun e!101838 () Bool)

(declare-fun array_inv!1573 (array!5271) Bool)

(declare-fun array_inv!1574 (array!5273) Bool)

(assert (=> b!155838 (= e!101844 (and tp!12446 tp_is_empty!3109 (array_inv!1573 (_keys!4882 thiss!1248)) (array_inv!1574 (_values!3090 thiss!1248)) e!101838))))

(declare-fun b!155839 () Bool)

(declare-fun e!101839 () Bool)

(assert (=> b!155839 (= e!101839 tp_is_empty!3109)))

(declare-fun b!155840 () Bool)

(assert (=> b!155840 (= e!101838 (and e!101839 mapRes!5306))))

(declare-fun condMapEmpty!5306 () Bool)

(declare-fun mapDefault!5306 () ValueCell!1211)

