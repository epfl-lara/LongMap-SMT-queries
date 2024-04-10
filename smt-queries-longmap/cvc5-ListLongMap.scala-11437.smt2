; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133420 () Bool)

(assert start!133420)

(declare-fun b!1559736 () Bool)

(declare-fun res!1066582 () Bool)

(declare-fun e!869101 () Bool)

(assert (=> b!1559736 (=> (not res!1066582) (not e!869101))))

(declare-datatypes ((array!103732 0))(
  ( (array!103733 (arr!50058 (Array (_ BitVec 32) (_ BitVec 64))) (size!50608 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103732)

(declare-datatypes ((List!36361 0))(
  ( (Nil!36358) (Cons!36357 (h!37803 (_ BitVec 64)) (t!51094 List!36361)) )
))
(declare-fun arrayNoDuplicates!0 (array!103732 (_ BitVec 32) List!36361) Bool)

(assert (=> b!1559736 (= res!1066582 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36358))))

(declare-fun b!1559737 () Bool)

(declare-fun e!869100 () Bool)

(declare-fun tp_is_empty!38503 () Bool)

(assert (=> b!1559737 (= e!869100 tp_is_empty!38503)))

(declare-fun b!1559739 () Bool)

(declare-fun e!869103 () Bool)

(declare-fun mapRes!59130 () Bool)

(assert (=> b!1559739 (= e!869103 (and e!869100 mapRes!59130))))

(declare-fun condMapEmpty!59130 () Bool)

(declare-datatypes ((V!59545 0))(
  ( (V!59546 (val!19335 Int)) )
))
(declare-datatypes ((ValueCell!18221 0))(
  ( (ValueCellFull!18221 (v!22087 V!59545)) (EmptyCell!18221) )
))
(declare-datatypes ((array!103734 0))(
  ( (array!103735 (arr!50059 (Array (_ BitVec 32) ValueCell!18221)) (size!50609 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103734)

(declare-fun mapDefault!59130 () ValueCell!18221)

