; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97304 () Bool)

(assert start!97304)

(declare-fun b_free!23275 () Bool)

(declare-fun b_next!23275 () Bool)

(assert (=> start!97304 (= b_free!23275 (not b_next!23275))))

(declare-fun tp!82123 () Bool)

(declare-fun b_and!37381 () Bool)

(assert (=> start!97304 (= tp!82123 b_and!37381)))

(declare-fun res!739608 () Bool)

(declare-fun e!632238 () Bool)

(assert (=> start!97304 (=> (not res!739608) (not e!632238))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71987 0))(
  ( (array!71988 (arr!34646 (Array (_ BitVec 32) (_ BitVec 64))) (size!35182 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71987)

(assert (=> start!97304 (= res!739608 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35182 _keys!1208))))))

(assert (=> start!97304 e!632238))

(declare-fun tp_is_empty!27535 () Bool)

(assert (=> start!97304 tp_is_empty!27535))

(declare-fun array_inv!26664 (array!71987) Bool)

(assert (=> start!97304 (array_inv!26664 _keys!1208)))

(assert (=> start!97304 true))

(assert (=> start!97304 tp!82123))

(declare-datatypes ((V!41841 0))(
  ( (V!41842 (val!13824 Int)) )
))
(declare-datatypes ((ValueCell!13058 0))(
  ( (ValueCellFull!13058 (v!16457 V!41841)) (EmptyCell!13058) )
))
(declare-datatypes ((array!71989 0))(
  ( (array!71990 (arr!34647 (Array (_ BitVec 32) ValueCell!13058)) (size!35183 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71989)

(declare-fun e!632235 () Bool)

(declare-fun array_inv!26665 (array!71989) Bool)

(assert (=> start!97304 (and (array_inv!26665 _values!996) e!632235)))

(declare-fun b!1108245 () Bool)

(declare-fun e!632236 () Bool)

(declare-fun mapRes!43120 () Bool)

(assert (=> b!1108245 (= e!632235 (and e!632236 mapRes!43120))))

(declare-fun condMapEmpty!43120 () Bool)

(declare-fun mapDefault!43120 () ValueCell!13058)

