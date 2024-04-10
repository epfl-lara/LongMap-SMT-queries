; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73784 () Bool)

(assert start!73784)

(declare-fun b_free!14699 () Bool)

(declare-fun b_next!14699 () Bool)

(assert (=> start!73784 (= b_free!14699 (not b_next!14699))))

(declare-fun tp!51600 () Bool)

(declare-fun b_and!24377 () Bool)

(assert (=> start!73784 (= tp!51600 b_and!24377)))

(declare-fun b!865725 () Bool)

(declare-datatypes ((Unit!29657 0))(
  ( (Unit!29658) )
))
(declare-fun e!482262 () Unit!29657)

(declare-fun Unit!29659 () Unit!29657)

(assert (=> b!865725 (= e!482262 Unit!29659)))

(declare-fun b!865726 () Bool)

(declare-fun res!588238 () Bool)

(declare-fun e!482268 () Bool)

(assert (=> b!865726 (=> (not res!588238) (not e!482268))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49830 0))(
  ( (array!49831 (arr!23946 (Array (_ BitVec 32) (_ BitVec 64))) (size!24386 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49830)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865726 (= res!588238 (and (= (select (arr!23946 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!865727 () Bool)

(declare-fun Unit!29660 () Unit!29657)

(assert (=> b!865727 (= e!482262 Unit!29660)))

(declare-fun lt!392426 () Unit!29657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49830 (_ BitVec 32) (_ BitVec 32)) Unit!29657)

(assert (=> b!865727 (= lt!392426 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17023 0))(
  ( (Nil!17020) (Cons!17019 (h!18150 (_ BitVec 64)) (t!23988 List!17023)) )
))
(declare-fun arrayNoDuplicates!0 (array!49830 (_ BitVec 32) List!17023) Bool)

(assert (=> b!865727 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17020)))

(declare-fun lt!392440 () Unit!29657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49830 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29657)

(assert (=> b!865727 (= lt!392440 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865727 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392431 () Unit!29657)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49830 (_ BitVec 64) (_ BitVec 32) List!17023) Unit!29657)

(assert (=> b!865727 (= lt!392431 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17020))))

(assert (=> b!865727 false))

(declare-fun mapNonEmpty!26852 () Bool)

(declare-fun mapRes!26852 () Bool)

(declare-fun tp!51601 () Bool)

(declare-fun e!482269 () Bool)

(assert (=> mapNonEmpty!26852 (= mapRes!26852 (and tp!51601 e!482269))))

(declare-fun mapKey!26852 () (_ BitVec 32))

(declare-datatypes ((V!27493 0))(
  ( (V!27494 (val!8465 Int)) )
))
(declare-datatypes ((ValueCell!7978 0))(
  ( (ValueCellFull!7978 (v!10890 V!27493)) (EmptyCell!7978) )
))
(declare-fun mapRest!26852 () (Array (_ BitVec 32) ValueCell!7978))

(declare-fun mapValue!26852 () ValueCell!7978)

(declare-datatypes ((array!49832 0))(
  ( (array!49833 (arr!23947 (Array (_ BitVec 32) ValueCell!7978)) (size!24387 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49832)

(assert (=> mapNonEmpty!26852 (= (arr!23947 _values!688) (store mapRest!26852 mapKey!26852 mapValue!26852))))

(declare-fun b!865728 () Bool)

(declare-fun e!482265 () Bool)

(assert (=> b!865728 (= e!482265 true)))

(declare-datatypes ((tuple2!11220 0))(
  ( (tuple2!11221 (_1!5621 (_ BitVec 64)) (_2!5621 V!27493)) )
))
(declare-datatypes ((List!17024 0))(
  ( (Nil!17021) (Cons!17020 (h!18151 tuple2!11220) (t!23989 List!17024)) )
))
(declare-datatypes ((ListLongMap!9989 0))(
  ( (ListLongMap!9990 (toList!5010 List!17024)) )
))
(declare-fun lt!392432 () ListLongMap!9989)

(declare-fun lt!392428 () tuple2!11220)

(declare-fun lt!392435 () tuple2!11220)

(declare-fun lt!392438 () ListLongMap!9989)

(declare-fun +!2359 (ListLongMap!9989 tuple2!11220) ListLongMap!9989)

(assert (=> b!865728 (= lt!392438 (+!2359 (+!2359 lt!392432 lt!392428) lt!392435))))

(declare-fun lt!392425 () V!27493)

(declare-fun v!557 () V!27493)

(declare-fun lt!392439 () Unit!29657)

(declare-fun addCommutativeForDiffKeys!528 (ListLongMap!9989 (_ BitVec 64) V!27493 (_ BitVec 64) V!27493) Unit!29657)

(assert (=> b!865728 (= lt!392439 (addCommutativeForDiffKeys!528 lt!392432 k!854 v!557 (select (arr!23946 _keys!868) from!1053) lt!392425))))

(declare-fun mapIsEmpty!26852 () Bool)

(assert (=> mapIsEmpty!26852 mapRes!26852))

(declare-fun b!865730 () Bool)

(declare-fun e!482264 () Bool)

(assert (=> b!865730 (= e!482268 e!482264)))

(declare-fun res!588242 () Bool)

(assert (=> b!865730 (=> (not res!588242) (not e!482264))))

(assert (=> b!865730 (= res!588242 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392436 () array!49832)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!392429 () ListLongMap!9989)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27493)

(declare-fun zeroValue!654 () V!27493)

(declare-fun getCurrentListMapNoExtraKeys!2981 (array!49830 array!49832 (_ BitVec 32) (_ BitVec 32) V!27493 V!27493 (_ BitVec 32) Int) ListLongMap!9989)

(assert (=> b!865730 (= lt!392429 (getCurrentListMapNoExtraKeys!2981 _keys!868 lt!392436 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865730 (= lt!392436 (array!49833 (store (arr!23947 _values!688) i!612 (ValueCellFull!7978 v!557)) (size!24387 _values!688)))))

(declare-fun lt!392433 () ListLongMap!9989)

(assert (=> b!865730 (= lt!392433 (getCurrentListMapNoExtraKeys!2981 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865731 () Bool)

(declare-fun e!482263 () Bool)

(assert (=> b!865731 (= e!482263 e!482265)))

(declare-fun res!588232 () Bool)

(assert (=> b!865731 (=> res!588232 e!482265)))

(assert (=> b!865731 (= res!588232 (= k!854 (select (arr!23946 _keys!868) from!1053)))))

(assert (=> b!865731 (not (= (select (arr!23946 _keys!868) from!1053) k!854))))

(declare-fun lt!392430 () Unit!29657)

(assert (=> b!865731 (= lt!392430 e!482262)))

(declare-fun c!92269 () Bool)

(assert (=> b!865731 (= c!92269 (= (select (arr!23946 _keys!868) from!1053) k!854))))

(assert (=> b!865731 (= lt!392429 lt!392438)))

(declare-fun lt!392434 () ListLongMap!9989)

(assert (=> b!865731 (= lt!392438 (+!2359 lt!392434 lt!392428))))

(assert (=> b!865731 (= lt!392428 (tuple2!11221 (select (arr!23946 _keys!868) from!1053) lt!392425))))

(declare-fun get!12657 (ValueCell!7978 V!27493) V!27493)

(declare-fun dynLambda!1181 (Int (_ BitVec 64)) V!27493)

(assert (=> b!865731 (= lt!392425 (get!12657 (select (arr!23947 _values!688) from!1053) (dynLambda!1181 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865732 () Bool)

(declare-fun tp_is_empty!16835 () Bool)

(assert (=> b!865732 (= e!482269 tp_is_empty!16835)))

(declare-fun b!865733 () Bool)

(assert (=> b!865733 (= e!482264 (not e!482263))))

(declare-fun res!588235 () Bool)

(assert (=> b!865733 (=> res!588235 e!482263)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865733 (= res!588235 (not (validKeyInArray!0 (select (arr!23946 _keys!868) from!1053))))))

(declare-fun lt!392437 () ListLongMap!9989)

(assert (=> b!865733 (= lt!392437 lt!392434)))

(assert (=> b!865733 (= lt!392434 (+!2359 lt!392432 lt!392435))))

(assert (=> b!865733 (= lt!392437 (getCurrentListMapNoExtraKeys!2981 _keys!868 lt!392436 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865733 (= lt!392435 (tuple2!11221 k!854 v!557))))

(assert (=> b!865733 (= lt!392432 (getCurrentListMapNoExtraKeys!2981 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392427 () Unit!29657)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!559 (array!49830 array!49832 (_ BitVec 32) (_ BitVec 32) V!27493 V!27493 (_ BitVec 32) (_ BitVec 64) V!27493 (_ BitVec 32) Int) Unit!29657)

(assert (=> b!865733 (= lt!392427 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!559 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865734 () Bool)

(declare-fun res!588240 () Bool)

(assert (=> b!865734 (=> (not res!588240) (not e!482268))))

(assert (=> b!865734 (= res!588240 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17020))))

(declare-fun b!865735 () Bool)

(declare-fun res!588236 () Bool)

(assert (=> b!865735 (=> (not res!588236) (not e!482268))))

(assert (=> b!865735 (= res!588236 (validKeyInArray!0 k!854))))

(declare-fun b!865736 () Bool)

(declare-fun res!588239 () Bool)

(assert (=> b!865736 (=> (not res!588239) (not e!482268))))

(assert (=> b!865736 (= res!588239 (and (= (size!24387 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24386 _keys!868) (size!24387 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865737 () Bool)

(declare-fun res!588234 () Bool)

(assert (=> b!865737 (=> (not res!588234) (not e!482268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865737 (= res!588234 (validMask!0 mask!1196))))

(declare-fun b!865738 () Bool)

(declare-fun e!482266 () Bool)

(declare-fun e!482261 () Bool)

(assert (=> b!865738 (= e!482266 (and e!482261 mapRes!26852))))

(declare-fun condMapEmpty!26852 () Bool)

(declare-fun mapDefault!26852 () ValueCell!7978)

