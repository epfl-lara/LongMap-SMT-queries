; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101662 () Bool)

(assert start!101662)

(declare-fun b_free!26383 () Bool)

(declare-fun b_next!26383 () Bool)

(assert (=> start!101662 (= b_free!26383 (not b_next!26383))))

(declare-fun tp!92192 () Bool)

(declare-fun b_and!44009 () Bool)

(assert (=> start!101662 (= tp!92192 b_and!44009)))

(declare-fun b!1223100 () Bool)

(declare-fun res!812679 () Bool)

(declare-fun e!694626 () Bool)

(assert (=> b!1223100 (=> (not res!812679) (not e!694626))))

(declare-datatypes ((array!78957 0))(
  ( (array!78958 (arr!38106 (Array (_ BitVec 32) (_ BitVec 64))) (size!38642 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78957)

(declare-datatypes ((List!26900 0))(
  ( (Nil!26897) (Cons!26896 (h!28105 (_ BitVec 64)) (t!40263 List!26900)) )
))
(declare-fun arrayNoDuplicates!0 (array!78957 (_ BitVec 32) List!26900) Bool)

(assert (=> b!1223100 (= res!812679 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26897))))

(declare-fun b!1223101 () Bool)

(declare-fun res!812686 () Bool)

(assert (=> b!1223101 (=> (not res!812686) (not e!694626))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223101 (= res!812686 (validMask!0 mask!1564))))

(declare-fun b!1223102 () Bool)

(declare-fun e!694625 () Bool)

(declare-fun e!694627 () Bool)

(declare-fun mapRes!48526 () Bool)

(assert (=> b!1223102 (= e!694625 (and e!694627 mapRes!48526))))

(declare-fun condMapEmpty!48526 () Bool)

(declare-datatypes ((V!46577 0))(
  ( (V!46578 (val!15600 Int)) )
))
(declare-datatypes ((ValueCell!14834 0))(
  ( (ValueCellFull!14834 (v!18261 V!46577)) (EmptyCell!14834) )
))
(declare-datatypes ((array!78959 0))(
  ( (array!78960 (arr!38107 (Array (_ BitVec 32) ValueCell!14834)) (size!38643 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78959)

(declare-fun mapDefault!48526 () ValueCell!14834)

