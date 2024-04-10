; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74146 () Bool)

(assert start!74146)

(declare-fun b!872236 () Bool)

(declare-fun e!485694 () Bool)

(assert (=> b!872236 (= e!485694 false)))

(declare-fun lt!395593 () Bool)

(declare-datatypes ((array!50504 0))(
  ( (array!50505 (arr!24282 (Array (_ BitVec 32) (_ BitVec 64))) (size!24722 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50504)

(declare-datatypes ((List!17256 0))(
  ( (Nil!17253) (Cons!17252 (h!18383 (_ BitVec 64)) (t!24293 List!17256)) )
))
(declare-fun arrayNoDuplicates!0 (array!50504 (_ BitVec 32) List!17256) Bool)

(assert (=> b!872236 (= lt!395593 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17253))))

(declare-fun res!592838 () Bool)

(assert (=> start!74146 (=> (not res!592838) (not e!485694))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74146 (= res!592838 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24722 _keys!868))))))

(assert (=> start!74146 e!485694))

(assert (=> start!74146 true))

(declare-fun array_inv!19172 (array!50504) Bool)

(assert (=> start!74146 (array_inv!19172 _keys!868)))

(declare-datatypes ((V!27961 0))(
  ( (V!27962 (val!8640 Int)) )
))
(declare-datatypes ((ValueCell!8153 0))(
  ( (ValueCellFull!8153 (v!11065 V!27961)) (EmptyCell!8153) )
))
(declare-datatypes ((array!50506 0))(
  ( (array!50507 (arr!24283 (Array (_ BitVec 32) ValueCell!8153)) (size!24723 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50506)

(declare-fun e!485695 () Bool)

(declare-fun array_inv!19173 (array!50506) Bool)

(assert (=> start!74146 (and (array_inv!19173 _values!688) e!485695)))

(declare-fun b!872237 () Bool)

(declare-fun res!592839 () Bool)

(assert (=> b!872237 (=> (not res!592839) (not e!485694))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50504 (_ BitVec 32)) Bool)

(assert (=> b!872237 (= res!592839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872238 () Bool)

(declare-fun e!485693 () Bool)

(declare-fun mapRes!27380 () Bool)

(assert (=> b!872238 (= e!485695 (and e!485693 mapRes!27380))))

(declare-fun condMapEmpty!27380 () Bool)

(declare-fun mapDefault!27380 () ValueCell!8153)

