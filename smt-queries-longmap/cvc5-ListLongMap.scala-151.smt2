; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2946 () Bool)

(assert start!2946)

(declare-fun b!16818 () Bool)

(declare-fun b_free!583 () Bool)

(declare-fun b_next!583 () Bool)

(assert (=> b!16818 (= b_free!583 (not b_next!583))))

(declare-fun tp!2936 () Bool)

(declare-fun b_and!1225 () Bool)

(assert (=> b!16818 (= tp!2936 b_and!1225)))

(declare-fun b!16811 () Bool)

(declare-fun e!10463 () Bool)

(declare-fun e!10462 () Bool)

(assert (=> b!16811 (= e!10463 e!10462)))

(declare-fun res!12394 () Bool)

(assert (=> b!16811 (=> (not res!12394) (not e!10462))))

(declare-datatypes ((V!955 0))(
  ( (V!956 (val!450 Int)) )
))
(declare-datatypes ((ValueCell!224 0))(
  ( (ValueCellFull!224 (v!1400 V!955)) (EmptyCell!224) )
))
(declare-datatypes ((array!897 0))(
  ( (array!898 (arr!431 (Array (_ BitVec 32) ValueCell!224)) (size!520 (_ BitVec 32))) )
))
(declare-datatypes ((array!899 0))(
  ( (array!900 (arr!432 (Array (_ BitVec 32) (_ BitVec 64))) (size!521 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!34 0))(
  ( (LongMapFixedSize!35 (defaultEntry!1627 Int) (mask!4537 (_ BitVec 32)) (extraKeys!1541 (_ BitVec 32)) (zeroValue!1564 V!955) (minValue!1564 V!955) (_size!48 (_ BitVec 32)) (_keys!3052 array!899) (_values!1625 array!897) (_vacant!48 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!34 0))(
  ( (Cell!35 (v!1401 LongMapFixedSize!34)) )
))
(declare-datatypes ((LongMap!34 0))(
  ( (LongMap!35 (underlying!28 Cell!34)) )
))
(declare-datatypes ((tuple2!694 0))(
  ( (tuple2!695 (_1!347 Bool) (_2!347 LongMap!34)) )
))
(declare-fun lt!4141 () tuple2!694)

(assert (=> b!16811 (= res!12394 (_1!347 lt!4141))))

(declare-fun e!10467 () tuple2!694)

(assert (=> b!16811 (= lt!4141 e!10467)))

(declare-fun c!1620 () Bool)

(declare-fun thiss!848 () LongMap!34)

(declare-fun imbalanced!2 (LongMap!34) Bool)

(assert (=> b!16811 (= c!1620 (imbalanced!2 thiss!848))))

(declare-fun b!16812 () Bool)

(declare-fun e!10461 () Bool)

(declare-fun e!10468 () Bool)

(declare-fun mapRes!701 () Bool)

(assert (=> b!16812 (= e!10461 (and e!10468 mapRes!701))))

(declare-fun condMapEmpty!701 () Bool)

(declare-fun mapDefault!701 () ValueCell!224)

