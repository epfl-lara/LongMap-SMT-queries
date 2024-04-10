; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73534 () Bool)

(assert start!73534)

(declare-fun b_free!14449 () Bool)

(declare-fun b_next!14449 () Bool)

(assert (=> start!73534 (= b_free!14449 (not b_next!14449))))

(declare-fun tp!50850 () Bool)

(declare-fun b_and!23877 () Bool)

(assert (=> start!73534 (= tp!50850 b_and!23877)))

(declare-fun b!859495 () Bool)

(declare-fun e!478983 () Bool)

(declare-fun e!478980 () Bool)

(assert (=> b!859495 (= e!478983 e!478980)))

(declare-fun res!583998 () Bool)

(assert (=> b!859495 (=> res!583998 e!478980)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49346 0))(
  ( (array!49347 (arr!23704 (Array (_ BitVec 32) (_ BitVec 64))) (size!24144 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49346)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859495 (= res!583998 (not (= (select (arr!23704 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27161 0))(
  ( (V!27162 (val!8340 Int)) )
))
(declare-datatypes ((tuple2!11012 0))(
  ( (tuple2!11013 (_1!5517 (_ BitVec 64)) (_2!5517 V!27161)) )
))
(declare-datatypes ((List!16821 0))(
  ( (Nil!16818) (Cons!16817 (h!17948 tuple2!11012) (t!23536 List!16821)) )
))
(declare-datatypes ((ListLongMap!9781 0))(
  ( (ListLongMap!9782 (toList!4906 List!16821)) )
))
(declare-fun lt!387296 () ListLongMap!9781)

(declare-fun lt!387303 () ListLongMap!9781)

(declare-datatypes ((ValueCell!7853 0))(
  ( (ValueCellFull!7853 (v!10765 V!27161)) (EmptyCell!7853) )
))
(declare-datatypes ((array!49348 0))(
  ( (array!49349 (arr!23705 (Array (_ BitVec 32) ValueCell!7853)) (size!24145 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49348)

(declare-fun +!2259 (ListLongMap!9781 tuple2!11012) ListLongMap!9781)

(declare-fun get!12491 (ValueCell!7853 V!27161) V!27161)

(declare-fun dynLambda!1097 (Int (_ BitVec 64)) V!27161)

(assert (=> b!859495 (= lt!387303 (+!2259 lt!387296 (tuple2!11013 (select (arr!23704 _keys!868) from!1053) (get!12491 (select (arr!23705 _values!688) from!1053) (dynLambda!1097 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859496 () Bool)

(declare-fun res!583993 () Bool)

(declare-fun e!478981 () Bool)

(assert (=> b!859496 (=> (not res!583993) (not e!478981))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859496 (= res!583993 (validMask!0 mask!1196))))

(declare-fun res!583988 () Bool)

(assert (=> start!73534 (=> (not res!583988) (not e!478981))))

(assert (=> start!73534 (= res!583988 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24144 _keys!868))))))

(assert (=> start!73534 e!478981))

(declare-fun tp_is_empty!16585 () Bool)

(assert (=> start!73534 tp_is_empty!16585))

(assert (=> start!73534 true))

(assert (=> start!73534 tp!50850))

(declare-fun array_inv!18766 (array!49346) Bool)

(assert (=> start!73534 (array_inv!18766 _keys!868)))

(declare-fun e!478976 () Bool)

(declare-fun array_inv!18767 (array!49348) Bool)

(assert (=> start!73534 (and (array_inv!18767 _values!688) e!478976)))

(declare-fun b!859497 () Bool)

(declare-fun res!584000 () Bool)

(declare-fun e!478982 () Bool)

(assert (=> b!859497 (=> res!584000 e!478982)))

(declare-datatypes ((List!16822 0))(
  ( (Nil!16819) (Cons!16818 (h!17949 (_ BitVec 64)) (t!23537 List!16822)) )
))
(declare-fun contains!4219 (List!16822 (_ BitVec 64)) Bool)

(assert (=> b!859497 (= res!584000 (contains!4219 Nil!16819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859498 () Bool)

(declare-fun res!583990 () Bool)

(assert (=> b!859498 (=> (not res!583990) (not e!478981))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859498 (= res!583990 (and (= (select (arr!23704 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!859499 () Bool)

(declare-fun res!583991 () Bool)

(assert (=> b!859499 (=> res!583991 e!478982)))

(declare-fun noDuplicate!1301 (List!16822) Bool)

(assert (=> b!859499 (= res!583991 (not (noDuplicate!1301 Nil!16819)))))

(declare-fun b!859500 () Bool)

(declare-fun res!583989 () Bool)

(assert (=> b!859500 (=> (not res!583989) (not e!478981))))

(declare-fun arrayNoDuplicates!0 (array!49346 (_ BitVec 32) List!16822) Bool)

(assert (=> b!859500 (= res!583989 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16819))))

(declare-fun b!859501 () Bool)

(declare-fun e!478978 () Bool)

(assert (=> b!859501 (= e!478978 (not e!478983))))

(declare-fun res!583996 () Bool)

(assert (=> b!859501 (=> res!583996 e!478983)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859501 (= res!583996 (not (validKeyInArray!0 (select (arr!23704 _keys!868) from!1053))))))

(declare-fun lt!387302 () ListLongMap!9781)

(assert (=> b!859501 (= lt!387302 lt!387296)))

(declare-fun v!557 () V!27161)

(declare-fun lt!387300 () ListLongMap!9781)

(assert (=> b!859501 (= lt!387296 (+!2259 lt!387300 (tuple2!11013 k!854 v!557)))))

(declare-fun lt!387298 () array!49348)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27161)

(declare-fun zeroValue!654 () V!27161)

(declare-fun getCurrentListMapNoExtraKeys!2885 (array!49346 array!49348 (_ BitVec 32) (_ BitVec 32) V!27161 V!27161 (_ BitVec 32) Int) ListLongMap!9781)

(assert (=> b!859501 (= lt!387302 (getCurrentListMapNoExtraKeys!2885 _keys!868 lt!387298 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859501 (= lt!387300 (getCurrentListMapNoExtraKeys!2885 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29303 0))(
  ( (Unit!29304) )
))
(declare-fun lt!387295 () Unit!29303)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!475 (array!49346 array!49348 (_ BitVec 32) (_ BitVec 32) V!27161 V!27161 (_ BitVec 32) (_ BitVec 64) V!27161 (_ BitVec 32) Int) Unit!29303)

(assert (=> b!859501 (= lt!387295 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!475 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859502 () Bool)

(declare-fun e!478977 () Bool)

(assert (=> b!859502 (= e!478977 tp_is_empty!16585)))

(declare-fun mapNonEmpty!26477 () Bool)

(declare-fun mapRes!26477 () Bool)

(declare-fun tp!50851 () Bool)

(declare-fun e!478984 () Bool)

(assert (=> mapNonEmpty!26477 (= mapRes!26477 (and tp!50851 e!478984))))

(declare-fun mapRest!26477 () (Array (_ BitVec 32) ValueCell!7853))

(declare-fun mapValue!26477 () ValueCell!7853)

(declare-fun mapKey!26477 () (_ BitVec 32))

(assert (=> mapNonEmpty!26477 (= (arr!23705 _values!688) (store mapRest!26477 mapKey!26477 mapValue!26477))))

(declare-fun b!859503 () Bool)

(assert (=> b!859503 (= e!478976 (and e!478977 mapRes!26477))))

(declare-fun condMapEmpty!26477 () Bool)

(declare-fun mapDefault!26477 () ValueCell!7853)

