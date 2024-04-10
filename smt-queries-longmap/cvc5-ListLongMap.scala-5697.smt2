; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73966 () Bool)

(assert start!73966)

(declare-fun b_free!14881 () Bool)

(declare-fun b_next!14881 () Bool)

(assert (=> start!73966 (= b_free!14881 (not b_next!14881))))

(declare-fun tp!52147 () Bool)

(declare-fun b_and!24633 () Bool)

(assert (=> start!73966 (= tp!52147 b_and!24633)))

(declare-fun b!869511 () Bool)

(declare-fun e!484230 () Bool)

(declare-fun tp_is_empty!17017 () Bool)

(assert (=> b!869511 (= e!484230 tp_is_empty!17017)))

(declare-fun b!869512 () Bool)

(declare-fun res!590909 () Bool)

(declare-fun e!484231 () Bool)

(assert (=> b!869512 (=> (not res!590909) (not e!484231))))

(declare-datatypes ((array!50182 0))(
  ( (array!50183 (arr!24122 (Array (_ BitVec 32) (_ BitVec 64))) (size!24562 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50182)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50182 (_ BitVec 32)) Bool)

(assert (=> b!869512 (= res!590909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869513 () Bool)

(declare-fun res!590912 () Bool)

(assert (=> b!869513 (=> (not res!590912) (not e!484231))))

(declare-datatypes ((List!17156 0))(
  ( (Nil!17153) (Cons!17152 (h!18283 (_ BitVec 64)) (t!24193 List!17156)) )
))
(declare-fun arrayNoDuplicates!0 (array!50182 (_ BitVec 32) List!17156) Bool)

(assert (=> b!869513 (= res!590912 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17153))))

(declare-fun res!590908 () Bool)

(assert (=> start!73966 (=> (not res!590908) (not e!484231))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73966 (= res!590908 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24562 _keys!868))))))

(assert (=> start!73966 e!484231))

(assert (=> start!73966 tp_is_empty!17017))

(assert (=> start!73966 true))

(assert (=> start!73966 tp!52147))

(declare-fun array_inv!19054 (array!50182) Bool)

(assert (=> start!73966 (array_inv!19054 _keys!868)))

(declare-datatypes ((V!27737 0))(
  ( (V!27738 (val!8556 Int)) )
))
(declare-datatypes ((ValueCell!8069 0))(
  ( (ValueCellFull!8069 (v!10981 V!27737)) (EmptyCell!8069) )
))
(declare-datatypes ((array!50184 0))(
  ( (array!50185 (arr!24123 (Array (_ BitVec 32) ValueCell!8069)) (size!24563 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50184)

(declare-fun e!484229 () Bool)

(declare-fun array_inv!19055 (array!50184) Bool)

(assert (=> start!73966 (and (array_inv!19055 _values!688) e!484229)))

(declare-fun b!869514 () Bool)

(declare-fun res!590910 () Bool)

(assert (=> b!869514 (=> (not res!590910) (not e!484231))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869514 (= res!590910 (and (= (size!24563 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24562 _keys!868) (size!24563 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27125 () Bool)

(declare-fun mapRes!27125 () Bool)

(declare-fun tp!52146 () Bool)

(assert (=> mapNonEmpty!27125 (= mapRes!27125 (and tp!52146 e!484230))))

(declare-fun mapRest!27125 () (Array (_ BitVec 32) ValueCell!8069))

(declare-fun mapValue!27125 () ValueCell!8069)

(declare-fun mapKey!27125 () (_ BitVec 32))

(assert (=> mapNonEmpty!27125 (= (arr!24123 _values!688) (store mapRest!27125 mapKey!27125 mapValue!27125))))

(declare-fun mapIsEmpty!27125 () Bool)

(assert (=> mapIsEmpty!27125 mapRes!27125))

(declare-fun b!869515 () Bool)

(declare-fun e!484228 () Bool)

(assert (=> b!869515 (= e!484228 (not true))))

(declare-fun lt!394828 () array!50184)

(declare-fun v!557 () V!27737)

(declare-fun defaultEntry!696 () Int)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27737)

(declare-fun zeroValue!654 () V!27737)

(declare-datatypes ((tuple2!11366 0))(
  ( (tuple2!11367 (_1!5694 (_ BitVec 64)) (_2!5694 V!27737)) )
))
(declare-datatypes ((List!17157 0))(
  ( (Nil!17154) (Cons!17153 (h!18284 tuple2!11366) (t!24194 List!17157)) )
))
(declare-datatypes ((ListLongMap!10135 0))(
  ( (ListLongMap!10136 (toList!5083 List!17157)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3052 (array!50182 array!50184 (_ BitVec 32) (_ BitVec 32) V!27737 V!27737 (_ BitVec 32) Int) ListLongMap!10135)

(declare-fun +!2423 (ListLongMap!10135 tuple2!11366) ListLongMap!10135)

(assert (=> b!869515 (= (getCurrentListMapNoExtraKeys!3052 _keys!868 lt!394828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2423 (getCurrentListMapNoExtraKeys!3052 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11367 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29844 0))(
  ( (Unit!29845) )
))
(declare-fun lt!394826 () Unit!29844)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!617 (array!50182 array!50184 (_ BitVec 32) (_ BitVec 32) V!27737 V!27737 (_ BitVec 32) (_ BitVec 64) V!27737 (_ BitVec 32) Int) Unit!29844)

(assert (=> b!869515 (= lt!394826 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!617 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869516 () Bool)

(declare-fun res!590911 () Bool)

(assert (=> b!869516 (=> (not res!590911) (not e!484231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869516 (= res!590911 (validMask!0 mask!1196))))

(declare-fun b!869517 () Bool)

(declare-fun res!590915 () Bool)

(assert (=> b!869517 (=> (not res!590915) (not e!484231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869517 (= res!590915 (validKeyInArray!0 k!854))))

(declare-fun b!869518 () Bool)

(declare-fun res!590913 () Bool)

(assert (=> b!869518 (=> (not res!590913) (not e!484231))))

(assert (=> b!869518 (= res!590913 (and (= (select (arr!24122 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869519 () Bool)

(declare-fun e!484227 () Bool)

(assert (=> b!869519 (= e!484229 (and e!484227 mapRes!27125))))

(declare-fun condMapEmpty!27125 () Bool)

(declare-fun mapDefault!27125 () ValueCell!8069)

