; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74132 () Bool)

(assert start!74132)

(declare-fun mapIsEmpty!27359 () Bool)

(declare-fun mapRes!27359 () Bool)

(assert (=> mapIsEmpty!27359 mapRes!27359))

(declare-fun mapNonEmpty!27359 () Bool)

(declare-fun tp!52558 () Bool)

(declare-fun e!485589 () Bool)

(assert (=> mapNonEmpty!27359 (= mapRes!27359 (and tp!52558 e!485589))))

(declare-datatypes ((V!27941 0))(
  ( (V!27942 (val!8633 Int)) )
))
(declare-datatypes ((ValueCell!8146 0))(
  ( (ValueCellFull!8146 (v!11058 V!27941)) (EmptyCell!8146) )
))
(declare-fun mapValue!27359 () ValueCell!8146)

(declare-fun mapKey!27359 () (_ BitVec 32))

(declare-fun mapRest!27359 () (Array (_ BitVec 32) ValueCell!8146))

(declare-datatypes ((array!50476 0))(
  ( (array!50477 (arr!24268 (Array (_ BitVec 32) ValueCell!8146)) (size!24708 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50476)

(assert (=> mapNonEmpty!27359 (= (arr!24268 _values!688) (store mapRest!27359 mapKey!27359 mapValue!27359))))

(declare-fun b!872089 () Bool)

(declare-fun e!485588 () Bool)

(assert (=> b!872089 (= e!485588 false)))

(declare-fun lt!395572 () Bool)

(declare-datatypes ((array!50478 0))(
  ( (array!50479 (arr!24269 (Array (_ BitVec 32) (_ BitVec 64))) (size!24709 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50478)

(declare-datatypes ((List!17251 0))(
  ( (Nil!17248) (Cons!17247 (h!18378 (_ BitVec 64)) (t!24288 List!17251)) )
))
(declare-fun arrayNoDuplicates!0 (array!50478 (_ BitVec 32) List!17251) Bool)

(assert (=> b!872089 (= lt!395572 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17248))))

(declare-fun b!872090 () Bool)

(declare-fun res!592755 () Bool)

(assert (=> b!872090 (=> (not res!592755) (not e!485588))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872090 (= res!592755 (and (= (size!24708 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24709 _keys!868) (size!24708 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592754 () Bool)

(assert (=> start!74132 (=> (not res!592754) (not e!485588))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74132 (= res!592754 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24709 _keys!868))))))

(assert (=> start!74132 e!485588))

(assert (=> start!74132 true))

(declare-fun array_inv!19160 (array!50478) Bool)

(assert (=> start!74132 (array_inv!19160 _keys!868)))

(declare-fun e!485587 () Bool)

(declare-fun array_inv!19161 (array!50476) Bool)

(assert (=> start!74132 (and (array_inv!19161 _values!688) e!485587)))

(declare-fun b!872091 () Bool)

(declare-fun e!485586 () Bool)

(assert (=> b!872091 (= e!485587 (and e!485586 mapRes!27359))))

(declare-fun condMapEmpty!27359 () Bool)

(declare-fun mapDefault!27359 () ValueCell!8146)

