; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38154 () Bool)

(assert start!38154)

(declare-fun b_free!9035 () Bool)

(declare-fun b_next!9035 () Bool)

(assert (=> start!38154 (= b_free!9035 (not b_next!9035))))

(declare-fun tp!31887 () Bool)

(declare-fun b_and!16397 () Bool)

(assert (=> start!38154 (= tp!31887 b_and!16397)))

(declare-fun b!393299 () Bool)

(declare-fun res!225324 () Bool)

(declare-fun e!238141 () Bool)

(assert (=> b!393299 (=> (not res!225324) (not e!238141))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393299 (= res!225324 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!16155 () Bool)

(declare-fun mapRes!16155 () Bool)

(assert (=> mapIsEmpty!16155 mapRes!16155))

(declare-fun b!393300 () Bool)

(declare-fun e!238137 () Bool)

(declare-fun e!238139 () Bool)

(assert (=> b!393300 (= e!238137 (and e!238139 mapRes!16155))))

(declare-fun condMapEmpty!16155 () Bool)

(declare-datatypes ((V!14047 0))(
  ( (V!14048 (val!4898 Int)) )
))
(declare-datatypes ((ValueCell!4510 0))(
  ( (ValueCellFull!4510 (v!7135 V!14047)) (EmptyCell!4510) )
))
(declare-datatypes ((array!23321 0))(
  ( (array!23322 (arr!11119 (Array (_ BitVec 32) ValueCell!4510)) (size!11471 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23321)

(declare-fun mapDefault!16155 () ValueCell!4510)

