; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73262 () Bool)

(assert start!73262)

(declare-fun b_free!14177 () Bool)

(declare-fun b_next!14177 () Bool)

(assert (=> start!73262 (= b_free!14177 (not b_next!14177))))

(declare-fun tp!50034 () Bool)

(declare-fun b_and!23513 () Bool)

(assert (=> start!73262 (= tp!50034 b_and!23513)))

(declare-fun b!854314 () Bool)

(declare-fun e!476386 () Bool)

(declare-fun tp_is_empty!16313 () Bool)

(assert (=> b!854314 (= e!476386 tp_is_empty!16313)))

(declare-datatypes ((V!26797 0))(
  ( (V!26798 (val!8204 Int)) )
))
(declare-fun v!557 () V!26797)

(declare-datatypes ((tuple2!10798 0))(
  ( (tuple2!10799 (_1!5410 (_ BitVec 64)) (_2!5410 V!26797)) )
))
(declare-datatypes ((List!16615 0))(
  ( (Nil!16612) (Cons!16611 (h!17742 tuple2!10798) (t!23238 List!16615)) )
))
(declare-datatypes ((ListLongMap!9567 0))(
  ( (ListLongMap!9568 (toList!4799 List!16615)) )
))
(declare-fun call!38387 () ListLongMap!9567)

(declare-fun call!38386 () ListLongMap!9567)

(declare-fun e!476392 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!854315 () Bool)

(declare-fun +!2188 (ListLongMap!9567 tuple2!10798) ListLongMap!9567)

(assert (=> b!854315 (= e!476392 (= call!38386 (+!2188 call!38387 (tuple2!10799 k!854 v!557))))))

(declare-fun b!854316 () Bool)

(declare-fun e!476385 () Bool)

(assert (=> b!854316 (= e!476385 tp_is_empty!16313)))

(declare-datatypes ((ValueCell!7717 0))(
  ( (ValueCellFull!7717 (v!10629 V!26797)) (EmptyCell!7717) )
))
(declare-datatypes ((array!48824 0))(
  ( (array!48825 (arr!23443 (Array (_ BitVec 32) ValueCell!7717)) (size!23883 (_ BitVec 32))) )
))
(declare-fun lt!385301 () array!48824)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48826 0))(
  ( (array!48827 (arr!23444 (Array (_ BitVec 32) (_ BitVec 64))) (size!23884 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48826)

(declare-fun minValue!654 () V!26797)

(declare-fun zeroValue!654 () V!26797)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!38383 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2780 (array!48826 array!48824 (_ BitVec 32) (_ BitVec 32) V!26797 V!26797 (_ BitVec 32) Int) ListLongMap!9567)

(assert (=> bm!38383 (= call!38386 (getCurrentListMapNoExtraKeys!2780 _keys!868 lt!385301 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854317 () Bool)

(declare-fun res!580187 () Bool)

(declare-fun e!476390 () Bool)

(assert (=> b!854317 (=> (not res!580187) (not e!476390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854317 (= res!580187 (validMask!0 mask!1196))))

(declare-fun b!854318 () Bool)

(assert (=> b!854318 (= e!476392 (= call!38386 call!38387))))

(declare-fun b!854319 () Bool)

(declare-fun res!580185 () Bool)

(assert (=> b!854319 (=> (not res!580185) (not e!476390))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854319 (= res!580185 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23884 _keys!868))))))

(declare-fun mapNonEmpty!26069 () Bool)

(declare-fun mapRes!26069 () Bool)

(declare-fun tp!50035 () Bool)

(assert (=> mapNonEmpty!26069 (= mapRes!26069 (and tp!50035 e!476386))))

(declare-fun mapValue!26069 () ValueCell!7717)

(declare-fun mapKey!26069 () (_ BitVec 32))

(declare-fun mapRest!26069 () (Array (_ BitVec 32) ValueCell!7717))

(declare-fun _values!688 () array!48824)

(assert (=> mapNonEmpty!26069 (= (arr!23443 _values!688) (store mapRest!26069 mapKey!26069 mapValue!26069))))

(declare-fun b!854320 () Bool)

(declare-fun e!476387 () Bool)

(declare-fun e!476389 () Bool)

(assert (=> b!854320 (= e!476387 (not e!476389))))

(declare-fun res!580186 () Bool)

(assert (=> b!854320 (=> res!580186 e!476389)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854320 (= res!580186 (not (validKeyInArray!0 (select (arr!23444 _keys!868) from!1053))))))

(assert (=> b!854320 e!476392))

(declare-fun c!91936 () Bool)

(assert (=> b!854320 (= c!91936 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29161 0))(
  ( (Unit!29162) )
))
(declare-fun lt!385302 () Unit!29161)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!410 (array!48826 array!48824 (_ BitVec 32) (_ BitVec 32) V!26797 V!26797 (_ BitVec 32) (_ BitVec 64) V!26797 (_ BitVec 32) Int) Unit!29161)

(assert (=> b!854320 (= lt!385302 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!410 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854321 () Bool)

(declare-fun res!580182 () Bool)

(assert (=> b!854321 (=> (not res!580182) (not e!476390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48826 (_ BitVec 32)) Bool)

(assert (=> b!854321 (= res!580182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854322 () Bool)

(assert (=> b!854322 (= e!476389 true)))

(declare-fun lt!385298 () tuple2!10798)

(declare-fun lt!385299 () ListLongMap!9567)

(declare-fun lt!385296 () V!26797)

(assert (=> b!854322 (= (+!2188 lt!385299 lt!385298) (+!2188 (+!2188 lt!385299 (tuple2!10799 k!854 lt!385296)) lt!385298))))

(declare-fun lt!385295 () V!26797)

(assert (=> b!854322 (= lt!385298 (tuple2!10799 k!854 lt!385295))))

(declare-fun lt!385303 () Unit!29161)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!313 (ListLongMap!9567 (_ BitVec 64) V!26797 V!26797) Unit!29161)

(assert (=> b!854322 (= lt!385303 (addSameAsAddTwiceSameKeyDiffValues!313 lt!385299 k!854 lt!385296 lt!385295))))

(declare-fun lt!385297 () V!26797)

(declare-fun get!12369 (ValueCell!7717 V!26797) V!26797)

(assert (=> b!854322 (= lt!385296 (get!12369 (select (arr!23443 _values!688) from!1053) lt!385297))))

(declare-fun lt!385294 () ListLongMap!9567)

(assert (=> b!854322 (= lt!385294 (+!2188 lt!385299 (tuple2!10799 (select (arr!23444 _keys!868) from!1053) lt!385295)))))

(assert (=> b!854322 (= lt!385295 (get!12369 (select (store (arr!23443 _values!688) i!612 (ValueCellFull!7717 v!557)) from!1053) lt!385297))))

(declare-fun dynLambda!1067 (Int (_ BitVec 64)) V!26797)

(assert (=> b!854322 (= lt!385297 (dynLambda!1067 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854322 (= lt!385299 (getCurrentListMapNoExtraKeys!2780 _keys!868 lt!385301 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854323 () Bool)

(declare-fun res!580184 () Bool)

(assert (=> b!854323 (=> (not res!580184) (not e!476390))))

(declare-datatypes ((List!16616 0))(
  ( (Nil!16613) (Cons!16612 (h!17743 (_ BitVec 64)) (t!23239 List!16616)) )
))
(declare-fun arrayNoDuplicates!0 (array!48826 (_ BitVec 32) List!16616) Bool)

(assert (=> b!854323 (= res!580184 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16613))))

(declare-fun b!854324 () Bool)

(declare-fun res!580179 () Bool)

(assert (=> b!854324 (=> (not res!580179) (not e!476390))))

(assert (=> b!854324 (= res!580179 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26069 () Bool)

(assert (=> mapIsEmpty!26069 mapRes!26069))

(declare-fun b!854325 () Bool)

(declare-fun e!476391 () Bool)

(assert (=> b!854325 (= e!476391 (and e!476385 mapRes!26069))))

(declare-fun condMapEmpty!26069 () Bool)

(declare-fun mapDefault!26069 () ValueCell!7717)

