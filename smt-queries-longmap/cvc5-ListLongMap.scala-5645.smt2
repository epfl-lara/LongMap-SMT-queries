; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73654 () Bool)

(assert start!73654)

(declare-fun b_free!14569 () Bool)

(declare-fun b_next!14569 () Bool)

(assert (=> start!73654 (= b_free!14569 (not b_next!14569))))

(declare-fun tp!51211 () Bool)

(declare-fun b_and!24117 () Bool)

(assert (=> start!73654 (= tp!51211 b_and!24117)))

(declare-fun b!862475 () Bool)

(declare-fun res!586097 () Bool)

(declare-fun e!480508 () Bool)

(assert (=> b!862475 (=> (not res!586097) (not e!480508))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862475 (= res!586097 (validMask!0 mask!1196))))

(declare-fun b!862476 () Bool)

(declare-fun res!586095 () Bool)

(assert (=> b!862476 (=> (not res!586095) (not e!480508))))

(declare-datatypes ((array!49574 0))(
  ( (array!49575 (arr!23818 (Array (_ BitVec 32) (_ BitVec 64))) (size!24258 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49574)

(declare-datatypes ((V!27321 0))(
  ( (V!27322 (val!8400 Int)) )
))
(declare-datatypes ((ValueCell!7913 0))(
  ( (ValueCellFull!7913 (v!10825 V!27321)) (EmptyCell!7913) )
))
(declare-datatypes ((array!49576 0))(
  ( (array!49577 (arr!23819 (Array (_ BitVec 32) ValueCell!7913)) (size!24259 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49576)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!862476 (= res!586095 (and (= (size!24259 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24258 _keys!868) (size!24259 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862477 () Bool)

(declare-fun res!586092 () Bool)

(assert (=> b!862477 (=> (not res!586092) (not e!480508))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862477 (= res!586092 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24258 _keys!868))))))

(declare-fun b!862478 () Bool)

(declare-fun e!480507 () Bool)

(assert (=> b!862478 (= e!480507 true)))

(declare-datatypes ((tuple2!11110 0))(
  ( (tuple2!11111 (_1!5566 (_ BitVec 64)) (_2!5566 V!27321)) )
))
(declare-fun lt!389317 () tuple2!11110)

(declare-fun lt!389314 () tuple2!11110)

(declare-datatypes ((List!16919 0))(
  ( (Nil!16916) (Cons!16915 (h!18046 tuple2!11110) (t!23754 List!16919)) )
))
(declare-datatypes ((ListLongMap!9879 0))(
  ( (ListLongMap!9880 (toList!4955 List!16919)) )
))
(declare-fun lt!389309 () ListLongMap!9879)

(declare-fun lt!389305 () ListLongMap!9879)

(declare-fun +!2304 (ListLongMap!9879 tuple2!11110) ListLongMap!9879)

(assert (=> b!862478 (= lt!389305 (+!2304 (+!2304 lt!389309 lt!389314) lt!389317))))

(declare-fun v!557 () V!27321)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!389311 () V!27321)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((Unit!29453 0))(
  ( (Unit!29454) )
))
(declare-fun lt!389308 () Unit!29453)

(declare-fun addCommutativeForDiffKeys!481 (ListLongMap!9879 (_ BitVec 64) V!27321 (_ BitVec 64) V!27321) Unit!29453)

(assert (=> b!862478 (= lt!389308 (addCommutativeForDiffKeys!481 lt!389309 k!854 v!557 (select (arr!23818 _keys!868) from!1053) lt!389311))))

(declare-fun b!862479 () Bool)

(declare-fun e!480513 () Bool)

(declare-fun tp_is_empty!16705 () Bool)

(assert (=> b!862479 (= e!480513 tp_is_empty!16705)))

(declare-fun b!862480 () Bool)

(declare-fun e!480514 () Bool)

(assert (=> b!862480 (= e!480508 e!480514)))

(declare-fun res!586094 () Bool)

(assert (=> b!862480 (=> (not res!586094) (not e!480514))))

(assert (=> b!862480 (= res!586094 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389313 () array!49576)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!389307 () ListLongMap!9879)

(declare-fun minValue!654 () V!27321)

(declare-fun zeroValue!654 () V!27321)

(declare-fun getCurrentListMapNoExtraKeys!2931 (array!49574 array!49576 (_ BitVec 32) (_ BitVec 32) V!27321 V!27321 (_ BitVec 32) Int) ListLongMap!9879)

(assert (=> b!862480 (= lt!389307 (getCurrentListMapNoExtraKeys!2931 _keys!868 lt!389313 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862480 (= lt!389313 (array!49577 (store (arr!23819 _values!688) i!612 (ValueCellFull!7913 v!557)) (size!24259 _values!688)))))

(declare-fun lt!389306 () ListLongMap!9879)

(assert (=> b!862480 (= lt!389306 (getCurrentListMapNoExtraKeys!2931 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862481 () Bool)

(declare-fun res!586087 () Bool)

(assert (=> b!862481 (=> (not res!586087) (not e!480508))))

(declare-datatypes ((List!16920 0))(
  ( (Nil!16917) (Cons!16916 (h!18047 (_ BitVec 64)) (t!23755 List!16920)) )
))
(declare-fun arrayNoDuplicates!0 (array!49574 (_ BitVec 32) List!16920) Bool)

(assert (=> b!862481 (= res!586087 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16917))))

(declare-fun b!862482 () Bool)

(declare-fun e!480509 () Unit!29453)

(declare-fun Unit!29455 () Unit!29453)

(assert (=> b!862482 (= e!480509 Unit!29455)))

(declare-fun lt!389312 () Unit!29453)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49574 (_ BitVec 32) (_ BitVec 32)) Unit!29453)

(assert (=> b!862482 (= lt!389312 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862482 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16917)))

(declare-fun lt!389315 () Unit!29453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49574 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29453)

(assert (=> b!862482 (= lt!389315 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862482 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389310 () Unit!29453)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49574 (_ BitVec 64) (_ BitVec 32) List!16920) Unit!29453)

(assert (=> b!862482 (= lt!389310 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16917))))

(assert (=> b!862482 false))

(declare-fun res!586093 () Bool)

(assert (=> start!73654 (=> (not res!586093) (not e!480508))))

(assert (=> start!73654 (= res!586093 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24258 _keys!868))))))

(assert (=> start!73654 e!480508))

(assert (=> start!73654 tp_is_empty!16705))

(assert (=> start!73654 true))

(assert (=> start!73654 tp!51211))

(declare-fun array_inv!18842 (array!49574) Bool)

(assert (=> start!73654 (array_inv!18842 _keys!868)))

(declare-fun e!480511 () Bool)

(declare-fun array_inv!18843 (array!49576) Bool)

(assert (=> start!73654 (and (array_inv!18843 _values!688) e!480511)))

(declare-fun b!862483 () Bool)

(declare-fun Unit!29456 () Unit!29453)

(assert (=> b!862483 (= e!480509 Unit!29456)))

(declare-fun b!862484 () Bool)

(declare-fun res!586089 () Bool)

(assert (=> b!862484 (=> (not res!586089) (not e!480508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49574 (_ BitVec 32)) Bool)

(assert (=> b!862484 (= res!586089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862485 () Bool)

(declare-fun e!480510 () Bool)

(declare-fun mapRes!26657 () Bool)

(assert (=> b!862485 (= e!480511 (and e!480510 mapRes!26657))))

(declare-fun condMapEmpty!26657 () Bool)

(declare-fun mapDefault!26657 () ValueCell!7913)

