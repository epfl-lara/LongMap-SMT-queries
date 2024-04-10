; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75762 () Bool)

(assert start!75762)

(declare-fun b!890965 () Bool)

(declare-fun b_free!15733 () Bool)

(declare-fun b_next!15733 () Bool)

(assert (=> b!890965 (= b_free!15733 (not b_next!15733))))

(declare-fun tp!55167 () Bool)

(declare-fun b_and!25973 () Bool)

(assert (=> b!890965 (= tp!55167 b_and!25973)))

(declare-fun res!603655 () Bool)

(declare-fun e!497056 () Bool)

(assert (=> start!75762 (=> (not res!603655) (not e!497056))))

(declare-datatypes ((array!52102 0))(
  ( (array!52103 (arr!25057 (Array (_ BitVec 32) (_ BitVec 64))) (size!25501 (_ BitVec 32))) )
))
(declare-datatypes ((V!29047 0))(
  ( (V!29048 (val!9081 Int)) )
))
(declare-datatypes ((ValueCell!8549 0))(
  ( (ValueCellFull!8549 (v!11559 V!29047)) (EmptyCell!8549) )
))
(declare-datatypes ((array!52104 0))(
  ( (array!52105 (arr!25058 (Array (_ BitVec 32) ValueCell!8549)) (size!25502 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4114 0))(
  ( (LongMapFixedSize!4115 (defaultEntry!5254 Int) (mask!25739 (_ BitVec 32)) (extraKeys!4948 (_ BitVec 32)) (zeroValue!5052 V!29047) (minValue!5052 V!29047) (_size!2112 (_ BitVec 32)) (_keys!9937 array!52102) (_values!5239 array!52104) (_vacant!2112 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4114)

(declare-fun valid!1597 (LongMapFixedSize!4114) Bool)

(assert (=> start!75762 (= res!603655 (valid!1597 thiss!1181))))

(assert (=> start!75762 e!497056))

(declare-fun e!497054 () Bool)

(assert (=> start!75762 e!497054))

(assert (=> start!75762 true))

(declare-fun b!890960 () Bool)

(declare-fun e!497061 () Bool)

(declare-fun e!497057 () Bool)

(declare-fun mapRes!28646 () Bool)

(assert (=> b!890960 (= e!497061 (and e!497057 mapRes!28646))))

(declare-fun condMapEmpty!28646 () Bool)

(declare-fun mapDefault!28646 () ValueCell!8549)

