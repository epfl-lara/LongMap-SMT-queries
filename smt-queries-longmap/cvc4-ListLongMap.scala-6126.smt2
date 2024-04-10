; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78868 () Bool)

(assert start!78868)

(declare-fun b_free!17081 () Bool)

(declare-fun b_next!17081 () Bool)

(assert (=> start!78868 (= b_free!17081 (not b_next!17081))))

(declare-fun tp!59684 () Bool)

(declare-fun b_and!27899 () Bool)

(assert (=> start!78868 (= tp!59684 b_and!27899)))

(declare-fun b!921595 () Bool)

(declare-fun res!621493 () Bool)

(declare-fun e!517153 () Bool)

(assert (=> b!921595 (=> (not res!621493) (not e!517153))))

(declare-datatypes ((array!55156 0))(
  ( (array!55157 (arr!26523 (Array (_ BitVec 32) (_ BitVec 64))) (size!26982 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55156)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31083 0))(
  ( (V!31084 (val!9845 Int)) )
))
(declare-datatypes ((ValueCell!9313 0))(
  ( (ValueCellFull!9313 (v!12363 V!31083)) (EmptyCell!9313) )
))
(declare-datatypes ((array!55158 0))(
  ( (array!55159 (arr!26524 (Array (_ BitVec 32) ValueCell!9313)) (size!26983 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55158)

(assert (=> b!921595 (= res!621493 (and (= (size!26983 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26982 _keys!1487) (size!26983 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921596 () Bool)

(declare-fun e!517155 () Bool)

(declare-fun e!517151 () Bool)

(declare-fun mapRes!31140 () Bool)

(assert (=> b!921596 (= e!517155 (and e!517151 mapRes!31140))))

(declare-fun condMapEmpty!31140 () Bool)

(declare-fun mapDefault!31140 () ValueCell!9313)

