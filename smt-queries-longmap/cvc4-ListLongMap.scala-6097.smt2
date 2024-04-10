; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78694 () Bool)

(assert start!78694)

(declare-fun b_free!16907 () Bool)

(declare-fun b_next!16907 () Bool)

(assert (=> start!78694 (= b_free!16907 (not b_next!16907))))

(declare-fun tp!59162 () Bool)

(declare-fun b_and!27551 () Bool)

(assert (=> start!78694 (= tp!59162 b_and!27551)))

(declare-fun b!917673 () Bool)

(declare-fun res!618679 () Bool)

(declare-fun e!515183 () Bool)

(assert (=> b!917673 (=> (not res!618679) (not e!515183))))

(declare-datatypes ((array!54816 0))(
  ( (array!54817 (arr!26353 (Array (_ BitVec 32) (_ BitVec 64))) (size!26812 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54816)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30851 0))(
  ( (V!30852 (val!9758 Int)) )
))
(declare-datatypes ((ValueCell!9226 0))(
  ( (ValueCellFull!9226 (v!12276 V!30851)) (EmptyCell!9226) )
))
(declare-datatypes ((array!54818 0))(
  ( (array!54819 (arr!26354 (Array (_ BitVec 32) ValueCell!9226)) (size!26813 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54818)

(assert (=> b!917673 (= res!618679 (and (= (size!26813 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26812 _keys!1487) (size!26813 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917674 () Bool)

(declare-fun e!515185 () Bool)

(declare-fun e!515186 () Bool)

(declare-fun mapRes!30879 () Bool)

(assert (=> b!917674 (= e!515185 (and e!515186 mapRes!30879))))

(declare-fun condMapEmpty!30879 () Bool)

(declare-fun mapDefault!30879 () ValueCell!9226)

