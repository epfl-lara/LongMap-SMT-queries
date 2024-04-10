; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17102 () Bool)

(assert start!17102)

(declare-fun b!172049 () Bool)

(declare-fun b_free!4237 () Bool)

(declare-fun b_next!4237 () Bool)

(assert (=> b!172049 (= b_free!4237 (not b_next!4237))))

(declare-fun tp!15346 () Bool)

(declare-fun b_and!10677 () Bool)

(assert (=> b!172049 (= tp!15346 b_and!10677)))

(declare-fun mapNonEmpty!6811 () Bool)

(declare-fun mapRes!6811 () Bool)

(declare-fun tp!15345 () Bool)

(declare-fun e!113541 () Bool)

(assert (=> mapNonEmpty!6811 (= mapRes!6811 (and tp!15345 e!113541))))

(declare-datatypes ((V!4993 0))(
  ( (V!4994 (val!2049 Int)) )
))
(declare-datatypes ((ValueCell!1661 0))(
  ( (ValueCellFull!1661 (v!3917 V!4993)) (EmptyCell!1661) )
))
(declare-fun mapValue!6811 () ValueCell!1661)

(declare-fun mapKey!6811 () (_ BitVec 32))

(declare-fun mapRest!6811 () (Array (_ BitVec 32) ValueCell!1661))

(declare-datatypes ((array!7133 0))(
  ( (array!7134 (arr!3393 (Array (_ BitVec 32) (_ BitVec 64))) (size!3687 (_ BitVec 32))) )
))
(declare-datatypes ((array!7135 0))(
  ( (array!7136 (arr!3394 (Array (_ BitVec 32) ValueCell!1661)) (size!3688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2230 0))(
  ( (LongMapFixedSize!2231 (defaultEntry!3561 Int) (mask!8394 (_ BitVec 32)) (extraKeys!3300 (_ BitVec 32)) (zeroValue!3402 V!4993) (minValue!3404 V!4993) (_size!1164 (_ BitVec 32)) (_keys!5395 array!7133) (_values!3544 array!7135) (_vacant!1164 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2230)

(assert (=> mapNonEmpty!6811 (= (arr!3394 (_values!3544 thiss!1248)) (store mapRest!6811 mapKey!6811 mapValue!6811))))

(declare-fun b!172047 () Bool)

(declare-fun res!81699 () Bool)

(declare-fun e!113540 () Bool)

(assert (=> b!172047 (=> (not res!81699) (not e!113540))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172047 (= res!81699 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172048 () Bool)

(declare-fun e!113542 () Bool)

(declare-fun e!113539 () Bool)

(assert (=> b!172048 (= e!113542 (and e!113539 mapRes!6811))))

(declare-fun condMapEmpty!6811 () Bool)

(declare-fun mapDefault!6811 () ValueCell!1661)

