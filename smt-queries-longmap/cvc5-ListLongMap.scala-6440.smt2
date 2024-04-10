; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82468 () Bool)

(assert start!82468)

(declare-fun b!961243 () Bool)

(declare-fun res!643364 () Bool)

(declare-fun e!541946 () Bool)

(assert (=> b!961243 (=> (not res!643364) (not e!541946))))

(declare-datatypes ((array!58925 0))(
  ( (array!58926 (arr!28332 (Array (_ BitVec 32) (_ BitVec 64))) (size!28811 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58925)

(assert (=> b!961243 (= res!643364 (and (bvsle #b00000000000000000000000000000000 (size!28811 _keys!1686)) (bvslt (size!28811 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!961244 () Bool)

(declare-fun e!541950 () Bool)

(declare-datatypes ((List!19684 0))(
  ( (Nil!19681) (Cons!19680 (h!20842 (_ BitVec 64)) (t!28047 List!19684)) )
))
(declare-fun contains!5393 (List!19684 (_ BitVec 64)) Bool)

(assert (=> b!961244 (= e!541950 (contains!5393 Nil!19681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!34114 () Bool)

(declare-fun mapRes!34114 () Bool)

(declare-fun tp!65043 () Bool)

(declare-fun e!541945 () Bool)

(assert (=> mapNonEmpty!34114 (= mapRes!34114 (and tp!65043 e!541945))))

(declare-datatypes ((V!33537 0))(
  ( (V!33538 (val!10758 Int)) )
))
(declare-datatypes ((ValueCell!10226 0))(
  ( (ValueCellFull!10226 (v!13315 V!33537)) (EmptyCell!10226) )
))
(declare-fun mapValue!34114 () ValueCell!10226)

(declare-fun mapKey!34114 () (_ BitVec 32))

(declare-datatypes ((array!58927 0))(
  ( (array!58928 (arr!28333 (Array (_ BitVec 32) ValueCell!10226)) (size!28812 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58927)

(declare-fun mapRest!34114 () (Array (_ BitVec 32) ValueCell!10226))

(assert (=> mapNonEmpty!34114 (= (arr!28333 _values!1400) (store mapRest!34114 mapKey!34114 mapValue!34114))))

(declare-fun b!961245 () Bool)

(declare-fun e!541948 () Bool)

(declare-fun e!541949 () Bool)

(assert (=> b!961245 (= e!541948 (and e!541949 mapRes!34114))))

(declare-fun condMapEmpty!34114 () Bool)

(declare-fun mapDefault!34114 () ValueCell!10226)

