; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133480 () Bool)

(assert start!133480)

(declare-fun b!1560486 () Bool)

(declare-fun e!869554 () Bool)

(declare-fun tp_is_empty!38563 () Bool)

(assert (=> b!1560486 (= e!869554 tp_is_empty!38563)))

(declare-fun res!1067062 () Bool)

(declare-fun e!869552 () Bool)

(assert (=> start!133480 (=> (not res!1067062) (not e!869552))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133480 (= res!1067062 (validMask!0 mask!947))))

(assert (=> start!133480 e!869552))

(assert (=> start!133480 true))

(declare-datatypes ((V!59625 0))(
  ( (V!59626 (val!19365 Int)) )
))
(declare-datatypes ((ValueCell!18251 0))(
  ( (ValueCellFull!18251 (v!22117 V!59625)) (EmptyCell!18251) )
))
(declare-datatypes ((array!103848 0))(
  ( (array!103849 (arr!50116 (Array (_ BitVec 32) ValueCell!18251)) (size!50666 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103848)

(declare-fun e!869550 () Bool)

(declare-fun array_inv!38957 (array!103848) Bool)

(assert (=> start!133480 (and (array_inv!38957 _values!487) e!869550)))

(declare-datatypes ((array!103850 0))(
  ( (array!103851 (arr!50117 (Array (_ BitVec 32) (_ BitVec 64))) (size!50667 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103850)

(declare-fun array_inv!38958 (array!103850) Bool)

(assert (=> start!133480 (array_inv!38958 _keys!637)))

(declare-fun mapIsEmpty!59220 () Bool)

(declare-fun mapRes!59220 () Bool)

(assert (=> mapIsEmpty!59220 mapRes!59220))

(declare-fun b!1560487 () Bool)

(assert (=> b!1560487 (= e!869552 false)))

(declare-fun lt!671001 () Bool)

(declare-datatypes ((List!36398 0))(
  ( (Nil!36395) (Cons!36394 (h!37840 (_ BitVec 64)) (t!51131 List!36398)) )
))
(declare-fun arrayNoDuplicates!0 (array!103850 (_ BitVec 32) List!36398) Bool)

(assert (=> b!1560487 (= lt!671001 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36395))))

(declare-fun b!1560488 () Bool)

(declare-fun e!869551 () Bool)

(assert (=> b!1560488 (= e!869551 tp_is_empty!38563)))

(declare-fun b!1560489 () Bool)

(declare-fun res!1067063 () Bool)

(assert (=> b!1560489 (=> (not res!1067063) (not e!869552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103850 (_ BitVec 32)) Bool)

(assert (=> b!1560489 (= res!1067063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560490 () Bool)

(assert (=> b!1560490 (= e!869550 (and e!869551 mapRes!59220))))

(declare-fun condMapEmpty!59220 () Bool)

(declare-fun mapDefault!59220 () ValueCell!18251)

