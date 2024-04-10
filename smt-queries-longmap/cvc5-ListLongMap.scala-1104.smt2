; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22716 () Bool)

(assert start!22716)

(declare-fun b!237070 () Bool)

(declare-fun b_free!6373 () Bool)

(declare-fun b_next!6373 () Bool)

(assert (=> b!237070 (= b_free!6373 (not b_next!6373))))

(declare-fun tp!22305 () Bool)

(declare-fun b_and!13321 () Bool)

(assert (=> b!237070 (= tp!22305 b_and!13321)))

(declare-fun res!116210 () Bool)

(declare-fun e!153955 () Bool)

(assert (=> start!22716 (=> (not res!116210) (not e!153955))))

(declare-datatypes ((V!7961 0))(
  ( (V!7962 (val!3162 Int)) )
))
(declare-datatypes ((ValueCell!2774 0))(
  ( (ValueCellFull!2774 (v!5195 V!7961)) (EmptyCell!2774) )
))
(declare-datatypes ((array!11739 0))(
  ( (array!11740 (arr!5576 (Array (_ BitVec 32) ValueCell!2774)) (size!5915 (_ BitVec 32))) )
))
(declare-datatypes ((array!11741 0))(
  ( (array!11742 (arr!5577 (Array (_ BitVec 32) (_ BitVec 64))) (size!5916 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3448 0))(
  ( (LongMapFixedSize!3449 (defaultEntry!4402 Int) (mask!10407 (_ BitVec 32)) (extraKeys!4139 (_ BitVec 32)) (zeroValue!4243 V!7961) (minValue!4243 V!7961) (_size!1773 (_ BitVec 32)) (_keys!6490 array!11741) (_values!4385 array!11739) (_vacant!1773 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3448)

(declare-fun valid!1360 (LongMapFixedSize!3448) Bool)

(assert (=> start!22716 (= res!116210 (valid!1360 thiss!1504))))

(assert (=> start!22716 e!153955))

(declare-fun e!153953 () Bool)

(assert (=> start!22716 e!153953))

(assert (=> start!22716 true))

(declare-fun b!237066 () Bool)

(declare-fun e!153959 () Bool)

(declare-fun tp_is_empty!6235 () Bool)

(assert (=> b!237066 (= e!153959 tp_is_empty!6235)))

(declare-fun mapNonEmpty!10567 () Bool)

(declare-fun mapRes!10567 () Bool)

(declare-fun tp!22306 () Bool)

(declare-fun e!153957 () Bool)

(assert (=> mapNonEmpty!10567 (= mapRes!10567 (and tp!22306 e!153957))))

(declare-fun mapRest!10567 () (Array (_ BitVec 32) ValueCell!2774))

(declare-fun mapKey!10567 () (_ BitVec 32))

(declare-fun mapValue!10567 () ValueCell!2774)

(assert (=> mapNonEmpty!10567 (= (arr!5576 (_values!4385 thiss!1504)) (store mapRest!10567 mapKey!10567 mapValue!10567))))

(declare-fun b!237067 () Bool)

(declare-fun e!153954 () Bool)

(assert (=> b!237067 (= e!153954 (and e!153959 mapRes!10567))))

(declare-fun condMapEmpty!10567 () Bool)

(declare-fun mapDefault!10567 () ValueCell!2774)

