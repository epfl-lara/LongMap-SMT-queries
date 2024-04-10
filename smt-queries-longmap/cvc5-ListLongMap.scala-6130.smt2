; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78888 () Bool)

(assert start!78888)

(declare-fun b_free!17101 () Bool)

(declare-fun b_next!17101 () Bool)

(assert (=> start!78888 (= b_free!17101 (not b_next!17101))))

(declare-fun tp!59744 () Bool)

(declare-fun b_and!27939 () Bool)

(assert (=> start!78888 (= tp!59744 b_and!27939)))

(declare-fun b!922095 () Bool)

(declare-fun res!621825 () Bool)

(declare-fun e!517404 () Bool)

(assert (=> b!922095 (=> (not res!621825) (not e!517404))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922095 (= res!621825 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922096 () Bool)

(declare-fun e!517405 () Bool)

(declare-fun e!517401 () Bool)

(declare-fun mapRes!31170 () Bool)

(assert (=> b!922096 (= e!517405 (and e!517401 mapRes!31170))))

(declare-fun condMapEmpty!31170 () Bool)

(declare-datatypes ((V!31111 0))(
  ( (V!31112 (val!9855 Int)) )
))
(declare-datatypes ((ValueCell!9323 0))(
  ( (ValueCellFull!9323 (v!12373 V!31111)) (EmptyCell!9323) )
))
(declare-datatypes ((array!55196 0))(
  ( (array!55197 (arr!26543 (Array (_ BitVec 32) ValueCell!9323)) (size!27002 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55196)

(declare-fun mapDefault!31170 () ValueCell!9323)

