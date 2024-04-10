; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73940 () Bool)

(assert start!73940)

(declare-fun b_free!14855 () Bool)

(declare-fun b_next!14855 () Bool)

(assert (=> start!73940 (= b_free!14855 (not b_next!14855))))

(declare-fun tp!52068 () Bool)

(declare-fun b_and!24607 () Bool)

(assert (=> start!73940 (= tp!52068 b_and!24607)))

(declare-fun b!869043 () Bool)

(declare-fun res!590558 () Bool)

(declare-fun e!483992 () Bool)

(assert (=> b!869043 (=> (not res!590558) (not e!483992))))

(declare-datatypes ((array!50130 0))(
  ( (array!50131 (arr!24096 (Array (_ BitVec 32) (_ BitVec 64))) (size!24536 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50130)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50130 (_ BitVec 32)) Bool)

(assert (=> b!869043 (= res!590558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869044 () Bool)

(declare-fun e!483997 () Bool)

(assert (=> b!869044 (= e!483997 (not true))))

(declare-datatypes ((V!27701 0))(
  ( (V!27702 (val!8543 Int)) )
))
(declare-fun v!557 () V!27701)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8056 0))(
  ( (ValueCellFull!8056 (v!10968 V!27701)) (EmptyCell!8056) )
))
(declare-datatypes ((array!50132 0))(
  ( (array!50133 (arr!24097 (Array (_ BitVec 32) ValueCell!8056)) (size!24537 (_ BitVec 32))) )
))
(declare-fun lt!394669 () array!50132)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun _values!688 () array!50132)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27701)

(declare-fun zeroValue!654 () V!27701)

(declare-datatypes ((tuple2!11344 0))(
  ( (tuple2!11345 (_1!5683 (_ BitVec 64)) (_2!5683 V!27701)) )
))
(declare-datatypes ((List!17138 0))(
  ( (Nil!17135) (Cons!17134 (h!18265 tuple2!11344) (t!24175 List!17138)) )
))
(declare-datatypes ((ListLongMap!10113 0))(
  ( (ListLongMap!10114 (toList!5072 List!17138)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3041 (array!50130 array!50132 (_ BitVec 32) (_ BitVec 32) V!27701 V!27701 (_ BitVec 32) Int) ListLongMap!10113)

(declare-fun +!2413 (ListLongMap!10113 tuple2!11344) ListLongMap!10113)

(assert (=> b!869044 (= (getCurrentListMapNoExtraKeys!3041 _keys!868 lt!394669 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2413 (getCurrentListMapNoExtraKeys!3041 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11345 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29824 0))(
  ( (Unit!29825) )
))
(declare-fun lt!394671 () Unit!29824)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!607 (array!50130 array!50132 (_ BitVec 32) (_ BitVec 32) V!27701 V!27701 (_ BitVec 32) (_ BitVec 64) V!27701 (_ BitVec 32) Int) Unit!29824)

(assert (=> b!869044 (= lt!394671 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!607 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869045 () Bool)

(declare-fun res!590564 () Bool)

(assert (=> b!869045 (=> (not res!590564) (not e!483992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869045 (= res!590564 (validMask!0 mask!1196))))

(declare-fun b!869046 () Bool)

(declare-fun res!590560 () Bool)

(assert (=> b!869046 (=> (not res!590560) (not e!483992))))

(assert (=> b!869046 (= res!590560 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24536 _keys!868))))))

(declare-fun b!869047 () Bool)

(declare-fun res!590557 () Bool)

(assert (=> b!869047 (=> (not res!590557) (not e!483992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869047 (= res!590557 (validKeyInArray!0 k!854))))

(declare-fun b!869048 () Bool)

(declare-fun res!590556 () Bool)

(assert (=> b!869048 (=> (not res!590556) (not e!483992))))

(assert (=> b!869048 (= res!590556 (and (= (select (arr!24096 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869049 () Bool)

(declare-fun e!483996 () Bool)

(declare-fun tp_is_empty!16991 () Bool)

(assert (=> b!869049 (= e!483996 tp_is_empty!16991)))

(declare-fun b!869050 () Bool)

(declare-fun e!483995 () Bool)

(assert (=> b!869050 (= e!483995 tp_is_empty!16991)))

(declare-fun b!869051 () Bool)

(declare-fun e!483994 () Bool)

(declare-fun mapRes!27086 () Bool)

(assert (=> b!869051 (= e!483994 (and e!483996 mapRes!27086))))

(declare-fun condMapEmpty!27086 () Bool)

(declare-fun mapDefault!27086 () ValueCell!8056)

