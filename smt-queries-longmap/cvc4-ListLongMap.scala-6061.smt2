; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78440 () Bool)

(assert start!78440)

(declare-fun b!914858 () Bool)

(declare-fun res!616907 () Bool)

(declare-fun e!513314 () Bool)

(assert (=> b!914858 (=> (not res!616907) (not e!513314))))

(declare-datatypes ((array!54390 0))(
  ( (array!54391 (arr!26144 (Array (_ BitVec 32) (_ BitVec 64))) (size!26603 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54390)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30563 0))(
  ( (V!30564 (val!9650 Int)) )
))
(declare-datatypes ((ValueCell!9118 0))(
  ( (ValueCellFull!9118 (v!12167 V!30563)) (EmptyCell!9118) )
))
(declare-datatypes ((array!54392 0))(
  ( (array!54393 (arr!26145 (Array (_ BitVec 32) ValueCell!9118)) (size!26604 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54392)

(assert (=> b!914858 (= res!616907 (and (= (size!26604 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26603 _keys!1487) (size!26604 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914859 () Bool)

(declare-fun e!513317 () Bool)

(declare-fun e!513315 () Bool)

(declare-fun mapRes!30543 () Bool)

(assert (=> b!914859 (= e!513317 (and e!513315 mapRes!30543))))

(declare-fun condMapEmpty!30543 () Bool)

(declare-fun mapDefault!30543 () ValueCell!9118)

