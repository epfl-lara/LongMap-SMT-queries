; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16242 () Bool)

(assert start!16242)

(declare-fun b!162051 () Bool)

(declare-fun b_free!3703 () Bool)

(declare-fun b_next!3703 () Bool)

(assert (=> b!162051 (= b_free!3703 (not b_next!3703))))

(declare-fun tp!13678 () Bool)

(declare-fun b_and!10117 () Bool)

(assert (=> b!162051 (= tp!13678 b_and!10117)))

(declare-fun b!162049 () Bool)

(declare-fun e!106069 () Bool)

(declare-fun tp_is_empty!3505 () Bool)

(assert (=> b!162049 (= e!106069 tp_is_empty!3505)))

(declare-fun b!162050 () Bool)

(declare-fun e!106071 () Bool)

(declare-fun e!106070 () Bool)

(declare-fun mapRes!5945 () Bool)

(assert (=> b!162050 (= e!106071 (and e!106070 mapRes!5945))))

(declare-fun condMapEmpty!5945 () Bool)

(declare-datatypes ((V!4321 0))(
  ( (V!4322 (val!1797 Int)) )
))
(declare-datatypes ((ValueCell!1409 0))(
  ( (ValueCellFull!1409 (v!3662 V!4321)) (EmptyCell!1409) )
))
(declare-datatypes ((array!6089 0))(
  ( (array!6090 (arr!2889 (Array (_ BitVec 32) (_ BitVec 64))) (size!3173 (_ BitVec 32))) )
))
(declare-datatypes ((array!6091 0))(
  ( (array!6092 (arr!2890 (Array (_ BitVec 32) ValueCell!1409)) (size!3174 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1726 0))(
  ( (LongMapFixedSize!1727 (defaultEntry!3305 Int) (mask!7915 (_ BitVec 32)) (extraKeys!3046 (_ BitVec 32)) (zeroValue!3148 V!4321) (minValue!3148 V!4321) (_size!912 (_ BitVec 32)) (_keys!5106 array!6089) (_values!3288 array!6091) (_vacant!912 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1726)

(declare-fun mapDefault!5945 () ValueCell!1409)

