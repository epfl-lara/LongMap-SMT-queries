; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73726 () Bool)

(assert start!73726)

(declare-fun b_free!14641 () Bool)

(declare-fun b_next!14641 () Bool)

(assert (=> start!73726 (= b_free!14641 (not b_next!14641))))

(declare-fun tp!51426 () Bool)

(declare-fun b_and!24261 () Bool)

(assert (=> start!73726 (= tp!51426 b_and!24261)))

(declare-fun res!587275 () Bool)

(declare-fun e!481485 () Bool)

(assert (=> start!73726 (=> (not res!587275) (not e!481485))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49716 0))(
  ( (array!49717 (arr!23889 (Array (_ BitVec 32) (_ BitVec 64))) (size!24329 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49716)

(assert (=> start!73726 (= res!587275 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24329 _keys!868))))))

(assert (=> start!73726 e!481485))

(declare-fun tp_is_empty!16777 () Bool)

(assert (=> start!73726 tp_is_empty!16777))

(assert (=> start!73726 true))

(assert (=> start!73726 tp!51426))

(declare-fun array_inv!18892 (array!49716) Bool)

(assert (=> start!73726 (array_inv!18892 _keys!868)))

(declare-datatypes ((V!27417 0))(
  ( (V!27418 (val!8436 Int)) )
))
(declare-datatypes ((ValueCell!7949 0))(
  ( (ValueCellFull!7949 (v!10861 V!27417)) (EmptyCell!7949) )
))
(declare-datatypes ((array!49718 0))(
  ( (array!49719 (arr!23890 (Array (_ BitVec 32) ValueCell!7949)) (size!24330 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49718)

(declare-fun e!481478 () Bool)

(declare-fun array_inv!18893 (array!49718) Bool)

(assert (=> start!73726 (and (array_inv!18893 _values!688) e!481478)))

(declare-fun b!864275 () Bool)

(declare-fun res!587277 () Bool)

(assert (=> b!864275 (=> (not res!587277) (not e!481485))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!864275 (= res!587277 (and (= (size!24330 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24329 _keys!868) (size!24330 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864276 () Bool)

(declare-fun res!587281 () Bool)

(assert (=> b!864276 (=> (not res!587281) (not e!481485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49716 (_ BitVec 32)) Bool)

(assert (=> b!864276 (= res!587281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864277 () Bool)

(declare-fun e!481482 () Bool)

(declare-fun e!481484 () Bool)

(assert (=> b!864277 (= e!481482 e!481484)))

(declare-fun res!587276 () Bool)

(assert (=> b!864277 (=> res!587276 e!481484)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!864277 (= res!587276 (= k!854 (select (arr!23889 _keys!868) from!1053)))))

(assert (=> b!864277 (not (= (select (arr!23889 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29565 0))(
  ( (Unit!29566) )
))
(declare-fun lt!391047 () Unit!29565)

(declare-fun e!481486 () Unit!29565)

(assert (=> b!864277 (= lt!391047 e!481486)))

(declare-fun c!92182 () Bool)

(assert (=> b!864277 (= c!92182 (= (select (arr!23889 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11172 0))(
  ( (tuple2!11173 (_1!5597 (_ BitVec 64)) (_2!5597 V!27417)) )
))
(declare-datatypes ((List!16977 0))(
  ( (Nil!16974) (Cons!16973 (h!18104 tuple2!11172) (t!23884 List!16977)) )
))
(declare-datatypes ((ListLongMap!9941 0))(
  ( (ListLongMap!9942 (toList!4986 List!16977)) )
))
(declare-fun lt!391035 () ListLongMap!9941)

(declare-fun lt!391048 () ListLongMap!9941)

(assert (=> b!864277 (= lt!391035 lt!391048)))

(declare-fun lt!391040 () ListLongMap!9941)

(declare-fun lt!391043 () tuple2!11172)

(declare-fun +!2335 (ListLongMap!9941 tuple2!11172) ListLongMap!9941)

(assert (=> b!864277 (= lt!391048 (+!2335 lt!391040 lt!391043))))

(declare-fun lt!391038 () V!27417)

(assert (=> b!864277 (= lt!391043 (tuple2!11173 (select (arr!23889 _keys!868) from!1053) lt!391038))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12619 (ValueCell!7949 V!27417) V!27417)

(declare-fun dynLambda!1161 (Int (_ BitVec 64)) V!27417)

(assert (=> b!864277 (= lt!391038 (get!12619 (select (arr!23890 _values!688) from!1053) (dynLambda!1161 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864278 () Bool)

(assert (=> b!864278 (= e!481484 true)))

(declare-fun lt!391044 () ListLongMap!9941)

(declare-fun lt!391034 () tuple2!11172)

(assert (=> b!864278 (= lt!391048 (+!2335 (+!2335 lt!391044 lt!391043) lt!391034))))

(declare-fun v!557 () V!27417)

(declare-fun lt!391045 () Unit!29565)

(declare-fun addCommutativeForDiffKeys!507 (ListLongMap!9941 (_ BitVec 64) V!27417 (_ BitVec 64) V!27417) Unit!29565)

(assert (=> b!864278 (= lt!391045 (addCommutativeForDiffKeys!507 lt!391044 k!854 v!557 (select (arr!23889 _keys!868) from!1053) lt!391038))))

(declare-fun b!864279 () Bool)

(declare-fun res!587282 () Bool)

(assert (=> b!864279 (=> (not res!587282) (not e!481485))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864279 (= res!587282 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24329 _keys!868))))))

(declare-fun b!864280 () Bool)

(declare-fun res!587283 () Bool)

(assert (=> b!864280 (=> (not res!587283) (not e!481485))))

(assert (=> b!864280 (= res!587283 (and (= (select (arr!23889 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!864281 () Bool)

(declare-fun e!481480 () Bool)

(declare-fun mapRes!26765 () Bool)

(assert (=> b!864281 (= e!481478 (and e!481480 mapRes!26765))))

(declare-fun condMapEmpty!26765 () Bool)

(declare-fun mapDefault!26765 () ValueCell!7949)

