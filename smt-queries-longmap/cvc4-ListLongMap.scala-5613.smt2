; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73466 () Bool)

(assert start!73466)

(declare-fun b_free!14381 () Bool)

(declare-fun b_next!14381 () Bool)

(assert (=> start!73466 (= b_free!14381 (not b_next!14381))))

(declare-fun tp!50646 () Bool)

(declare-fun b_and!23741 () Bool)

(assert (=> start!73466 (= tp!50646 b_and!23741)))

(declare-fun b!858003 () Bool)

(declare-fun e!478189 () Bool)

(declare-fun e!478192 () Bool)

(assert (=> b!858003 (= e!478189 (not e!478192))))

(declare-fun res!582875 () Bool)

(assert (=> b!858003 (=> res!582875 e!478192)))

(declare-datatypes ((array!49222 0))(
  ( (array!49223 (arr!23642 (Array (_ BitVec 32) (_ BitVec 64))) (size!24082 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49222)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858003 (= res!582875 (not (validKeyInArray!0 (select (arr!23642 _keys!868) from!1053))))))

(declare-datatypes ((V!27069 0))(
  ( (V!27070 (val!8306 Int)) )
))
(declare-datatypes ((tuple2!10962 0))(
  ( (tuple2!10963 (_1!5492 (_ BitVec 64)) (_2!5492 V!27069)) )
))
(declare-datatypes ((List!16769 0))(
  ( (Nil!16766) (Cons!16765 (h!17896 tuple2!10962) (t!23416 List!16769)) )
))
(declare-datatypes ((ListLongMap!9731 0))(
  ( (ListLongMap!9732 (toList!4881 List!16769)) )
))
(declare-fun lt!386498 () ListLongMap!9731)

(declare-fun lt!386500 () ListLongMap!9731)

(assert (=> b!858003 (= lt!386498 lt!386500)))

(declare-fun v!557 () V!27069)

(declare-fun lt!386497 () ListLongMap!9731)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2234 (ListLongMap!9731 tuple2!10962) ListLongMap!9731)

(assert (=> b!858003 (= lt!386500 (+!2234 lt!386497 (tuple2!10963 k!854 v!557)))))

(declare-datatypes ((ValueCell!7819 0))(
  ( (ValueCellFull!7819 (v!10731 V!27069)) (EmptyCell!7819) )
))
(declare-datatypes ((array!49224 0))(
  ( (array!49225 (arr!23643 (Array (_ BitVec 32) ValueCell!7819)) (size!24083 (_ BitVec 32))) )
))
(declare-fun lt!386496 () array!49224)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27069)

(declare-fun zeroValue!654 () V!27069)

(declare-fun getCurrentListMapNoExtraKeys!2862 (array!49222 array!49224 (_ BitVec 32) (_ BitVec 32) V!27069 V!27069 (_ BitVec 32) Int) ListLongMap!9731)

(assert (=> b!858003 (= lt!386498 (getCurrentListMapNoExtraKeys!2862 _keys!868 lt!386496 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49224)

(assert (=> b!858003 (= lt!386497 (getCurrentListMapNoExtraKeys!2862 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29255 0))(
  ( (Unit!29256) )
))
(declare-fun lt!386494 () Unit!29255)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!455 (array!49222 array!49224 (_ BitVec 32) (_ BitVec 32) V!27069 V!27069 (_ BitVec 32) (_ BitVec 64) V!27069 (_ BitVec 32) Int) Unit!29255)

(assert (=> b!858003 (= lt!386494 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!455 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26375 () Bool)

(declare-fun mapRes!26375 () Bool)

(declare-fun tp!50647 () Bool)

(declare-fun e!478187 () Bool)

(assert (=> mapNonEmpty!26375 (= mapRes!26375 (and tp!50647 e!478187))))

(declare-fun mapValue!26375 () ValueCell!7819)

(declare-fun mapKey!26375 () (_ BitVec 32))

(declare-fun mapRest!26375 () (Array (_ BitVec 32) ValueCell!7819))

(assert (=> mapNonEmpty!26375 (= (arr!23643 _values!688) (store mapRest!26375 mapKey!26375 mapValue!26375))))

(declare-fun b!858004 () Bool)

(assert (=> b!858004 (= e!478192 true)))

(declare-fun lt!386499 () ListLongMap!9731)

(declare-fun get!12445 (ValueCell!7819 V!27069) V!27069)

(declare-fun dynLambda!1075 (Int (_ BitVec 64)) V!27069)

(assert (=> b!858004 (= lt!386499 (+!2234 lt!386500 (tuple2!10963 (select (arr!23642 _keys!868) from!1053) (get!12445 (select (arr!23643 _values!688) from!1053) (dynLambda!1075 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!582877 () Bool)

(declare-fun e!478190 () Bool)

(assert (=> start!73466 (=> (not res!582877) (not e!478190))))

(assert (=> start!73466 (= res!582877 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24082 _keys!868))))))

(assert (=> start!73466 e!478190))

(declare-fun tp_is_empty!16517 () Bool)

(assert (=> start!73466 tp_is_empty!16517))

(assert (=> start!73466 true))

(assert (=> start!73466 tp!50646))

(declare-fun array_inv!18726 (array!49222) Bool)

(assert (=> start!73466 (array_inv!18726 _keys!868)))

(declare-fun e!478191 () Bool)

(declare-fun array_inv!18727 (array!49224) Bool)

(assert (=> start!73466 (and (array_inv!18727 _values!688) e!478191)))

(declare-fun mapIsEmpty!26375 () Bool)

(assert (=> mapIsEmpty!26375 mapRes!26375))

(declare-fun b!858005 () Bool)

(declare-fun res!582869 () Bool)

(assert (=> b!858005 (=> (not res!582869) (not e!478190))))

(assert (=> b!858005 (= res!582869 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24082 _keys!868))))))

(declare-fun b!858006 () Bool)

(declare-fun res!582874 () Bool)

(assert (=> b!858006 (=> (not res!582874) (not e!478190))))

(assert (=> b!858006 (= res!582874 (and (= (select (arr!23642 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858007 () Bool)

(declare-fun res!582878 () Bool)

(assert (=> b!858007 (=> (not res!582878) (not e!478190))))

(assert (=> b!858007 (= res!582878 (and (= (size!24083 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24082 _keys!868) (size!24083 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858008 () Bool)

(declare-fun res!582871 () Bool)

(assert (=> b!858008 (=> (not res!582871) (not e!478190))))

(assert (=> b!858008 (= res!582871 (validKeyInArray!0 k!854))))

(declare-fun b!858009 () Bool)

(declare-fun res!582873 () Bool)

(assert (=> b!858009 (=> (not res!582873) (not e!478190))))

(declare-datatypes ((List!16770 0))(
  ( (Nil!16767) (Cons!16766 (h!17897 (_ BitVec 64)) (t!23417 List!16770)) )
))
(declare-fun arrayNoDuplicates!0 (array!49222 (_ BitVec 32) List!16770) Bool)

(assert (=> b!858009 (= res!582873 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16767))))

(declare-fun b!858010 () Bool)

(assert (=> b!858010 (= e!478187 tp_is_empty!16517)))

(declare-fun b!858011 () Bool)

(assert (=> b!858011 (= e!478190 e!478189)))

(declare-fun res!582870 () Bool)

(assert (=> b!858011 (=> (not res!582870) (not e!478189))))

(assert (=> b!858011 (= res!582870 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858011 (= lt!386499 (getCurrentListMapNoExtraKeys!2862 _keys!868 lt!386496 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858011 (= lt!386496 (array!49225 (store (arr!23643 _values!688) i!612 (ValueCellFull!7819 v!557)) (size!24083 _values!688)))))

(declare-fun lt!386495 () ListLongMap!9731)

(assert (=> b!858011 (= lt!386495 (getCurrentListMapNoExtraKeys!2862 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858012 () Bool)

(declare-fun res!582872 () Bool)

(assert (=> b!858012 (=> (not res!582872) (not e!478190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49222 (_ BitVec 32)) Bool)

(assert (=> b!858012 (= res!582872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858013 () Bool)

(declare-fun e!478186 () Bool)

(assert (=> b!858013 (= e!478191 (and e!478186 mapRes!26375))))

(declare-fun condMapEmpty!26375 () Bool)

(declare-fun mapDefault!26375 () ValueCell!7819)

