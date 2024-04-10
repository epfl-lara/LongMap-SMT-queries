; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72890 () Bool)

(assert start!72890)

(declare-fun b_free!13805 () Bool)

(declare-fun b_next!13805 () Bool)

(assert (=> start!72890 (= b_free!13805 (not b_next!13805))))

(declare-fun tp!48918 () Bool)

(declare-fun b_and!22891 () Bool)

(assert (=> start!72890 (= tp!48918 b_and!22891)))

(declare-fun b!846166 () Bool)

(declare-fun e!472293 () Bool)

(assert (=> b!846166 (= e!472293 false)))

(declare-datatypes ((V!26301 0))(
  ( (V!26302 (val!8018 Int)) )
))
(declare-datatypes ((tuple2!10472 0))(
  ( (tuple2!10473 (_1!5247 (_ BitVec 64)) (_2!5247 V!26301)) )
))
(declare-datatypes ((List!16333 0))(
  ( (Nil!16330) (Cons!16329 (h!17460 tuple2!10472) (t!22704 List!16333)) )
))
(declare-datatypes ((ListLongMap!9241 0))(
  ( (ListLongMap!9242 (toList!4636 List!16333)) )
))
(declare-fun lt!381486 () ListLongMap!9241)

(declare-fun v!557 () V!26301)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48096 0))(
  ( (array!48097 (arr!23079 (Array (_ BitVec 32) (_ BitVec 64))) (size!23519 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48096)

(declare-datatypes ((ValueCell!7531 0))(
  ( (ValueCellFull!7531 (v!10443 V!26301)) (EmptyCell!7531) )
))
(declare-datatypes ((array!48098 0))(
  ( (array!48099 (arr!23080 (Array (_ BitVec 32) ValueCell!7531)) (size!23520 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48098)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26301)

(declare-fun zeroValue!654 () V!26301)

(declare-fun getCurrentListMapNoExtraKeys!2621 (array!48096 array!48098 (_ BitVec 32) (_ BitVec 32) V!26301 V!26301 (_ BitVec 32) Int) ListLongMap!9241)

(assert (=> b!846166 (= lt!381486 (getCurrentListMapNoExtraKeys!2621 _keys!868 (array!48099 (store (arr!23080 _values!688) i!612 (ValueCellFull!7531 v!557)) (size!23520 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381487 () ListLongMap!9241)

(assert (=> b!846166 (= lt!381487 (getCurrentListMapNoExtraKeys!2621 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846167 () Bool)

(declare-fun res!574876 () Bool)

(assert (=> b!846167 (=> (not res!574876) (not e!472293))))

(assert (=> b!846167 (= res!574876 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23519 _keys!868))))))

(declare-fun b!846168 () Bool)

(declare-fun res!574870 () Bool)

(assert (=> b!846168 (=> (not res!574870) (not e!472293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846168 (= res!574870 (validMask!0 mask!1196))))

(declare-fun b!846169 () Bool)

(declare-fun e!472294 () Bool)

(declare-fun tp_is_empty!15941 () Bool)

(assert (=> b!846169 (= e!472294 tp_is_empty!15941)))

(declare-fun mapIsEmpty!25511 () Bool)

(declare-fun mapRes!25511 () Bool)

(assert (=> mapIsEmpty!25511 mapRes!25511))

(declare-fun b!846171 () Bool)

(declare-fun e!472296 () Bool)

(declare-fun e!472297 () Bool)

(assert (=> b!846171 (= e!472296 (and e!472297 mapRes!25511))))

(declare-fun condMapEmpty!25511 () Bool)

(declare-fun mapDefault!25511 () ValueCell!7531)

