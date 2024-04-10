; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100124 () Bool)

(assert start!100124)

(declare-fun b!1193987 () Bool)

(declare-fun res!794388 () Bool)

(declare-fun e!678579 () Bool)

(assert (=> b!1193987 (=> (not res!794388) (not e!678579))))

(declare-datatypes ((array!77245 0))(
  ( (array!77246 (arr!37272 (Array (_ BitVec 32) (_ BitVec 64))) (size!37808 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77245)

(declare-datatypes ((List!26251 0))(
  ( (Nil!26248) (Cons!26247 (h!27456 (_ BitVec 64)) (t!38922 List!26251)) )
))
(declare-fun arrayNoDuplicates!0 (array!77245 (_ BitVec 32) List!26251) Bool)

(assert (=> b!1193987 (= res!794388 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26248))))

(declare-fun b!1193988 () Bool)

(declare-fun e!678582 () Bool)

(declare-fun e!678583 () Bool)

(declare-fun mapRes!47177 () Bool)

(assert (=> b!1193988 (= e!678582 (and e!678583 mapRes!47177))))

(declare-fun condMapEmpty!47177 () Bool)

(declare-datatypes ((V!45437 0))(
  ( (V!45438 (val!15173 Int)) )
))
(declare-datatypes ((ValueCell!14407 0))(
  ( (ValueCellFull!14407 (v!17811 V!45437)) (EmptyCell!14407) )
))
(declare-datatypes ((array!77247 0))(
  ( (array!77248 (arr!37273 (Array (_ BitVec 32) ValueCell!14407)) (size!37809 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77247)

(declare-fun mapDefault!47177 () ValueCell!14407)

