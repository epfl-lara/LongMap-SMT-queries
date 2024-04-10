; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133456 () Bool)

(assert start!133456)

(declare-fun b!1560222 () Bool)

(declare-fun res!1066911 () Bool)

(declare-fun e!869374 () Bool)

(assert (=> b!1560222 (=> (not res!1066911) (not e!869374))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103802 0))(
  ( (array!103803 (arr!50093 (Array (_ BitVec 32) (_ BitVec 64))) (size!50643 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103802)

(declare-datatypes ((V!59593 0))(
  ( (V!59594 (val!19353 Int)) )
))
(declare-datatypes ((ValueCell!18239 0))(
  ( (ValueCellFull!18239 (v!22105 V!59593)) (EmptyCell!18239) )
))
(declare-datatypes ((array!103804 0))(
  ( (array!103805 (arr!50094 (Array (_ BitVec 32) ValueCell!18239)) (size!50644 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103804)

(assert (=> b!1560222 (= res!1066911 (and (= (size!50644 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50643 _keys!637) (size!50644 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1066906 () Bool)

(assert (=> start!133456 (=> (not res!1066906) (not e!869374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133456 (= res!1066906 (validMask!0 mask!947))))

(assert (=> start!133456 e!869374))

(assert (=> start!133456 true))

(declare-fun array_inv!38939 (array!103802) Bool)

(assert (=> start!133456 (array_inv!38939 _keys!637)))

(declare-fun e!869371 () Bool)

(declare-fun array_inv!38940 (array!103804) Bool)

(assert (=> start!133456 (and (array_inv!38940 _values!487) e!869371)))

(declare-fun b!1560223 () Bool)

(declare-fun res!1066908 () Bool)

(assert (=> b!1560223 (=> (not res!1066908) (not e!869374))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560223 (= res!1066908 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50643 _keys!637)) (bvsge from!782 (size!50643 _keys!637))))))

(declare-fun b!1560224 () Bool)

(declare-fun res!1066909 () Bool)

(assert (=> b!1560224 (=> (not res!1066909) (not e!869374))))

(declare-datatypes ((List!36387 0))(
  ( (Nil!36384) (Cons!36383 (h!37829 (_ BitVec 64)) (t!51120 List!36387)) )
))
(declare-fun arrayNoDuplicates!0 (array!103802 (_ BitVec 32) List!36387) Bool)

(assert (=> b!1560224 (= res!1066909 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36384))))

(declare-fun b!1560225 () Bool)

(declare-fun e!869372 () Bool)

(declare-fun mapRes!59184 () Bool)

(assert (=> b!1560225 (= e!869371 (and e!869372 mapRes!59184))))

(declare-fun condMapEmpty!59184 () Bool)

(declare-fun mapDefault!59184 () ValueCell!18239)

