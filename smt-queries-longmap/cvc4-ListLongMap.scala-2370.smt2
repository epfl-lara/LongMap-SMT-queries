; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37686 () Bool)

(assert start!37686)

(declare-fun b_free!8789 () Bool)

(declare-fun b_next!8789 () Bool)

(assert (=> start!37686 (= b_free!8789 (not b_next!8789))))

(declare-fun tp!31119 () Bool)

(declare-fun b_and!16031 () Bool)

(assert (=> start!37686 (= tp!31119 b_and!16031)))

(declare-fun b!386090 () Bool)

(declare-fun res!220343 () Bool)

(declare-fun e!234268 () Bool)

(assert (=> b!386090 (=> (not res!220343) (not e!234268))))

(declare-datatypes ((array!22821 0))(
  ( (array!22822 (arr!10879 (Array (_ BitVec 32) (_ BitVec 64))) (size!11231 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22821)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386090 (= res!220343 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386091 () Bool)

(declare-fun e!234272 () Bool)

(declare-fun tp_is_empty!9461 () Bool)

(assert (=> b!386091 (= e!234272 tp_is_empty!9461)))

(declare-fun b!386092 () Bool)

(declare-fun e!234270 () Bool)

(assert (=> b!386092 (= e!234270 tp_is_empty!9461)))

(declare-fun b!386093 () Bool)

(declare-fun e!234269 () Bool)

(declare-fun mapRes!15756 () Bool)

(assert (=> b!386093 (= e!234269 (and e!234270 mapRes!15756))))

(declare-fun condMapEmpty!15756 () Bool)

(declare-datatypes ((V!13719 0))(
  ( (V!13720 (val!4775 Int)) )
))
(declare-datatypes ((ValueCell!4387 0))(
  ( (ValueCellFull!4387 (v!6972 V!13719)) (EmptyCell!4387) )
))
(declare-datatypes ((array!22823 0))(
  ( (array!22824 (arr!10880 (Array (_ BitVec 32) ValueCell!4387)) (size!11232 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22823)

(declare-fun mapDefault!15756 () ValueCell!4387)

