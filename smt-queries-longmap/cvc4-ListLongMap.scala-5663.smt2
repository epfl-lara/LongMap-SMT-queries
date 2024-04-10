; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73766 () Bool)

(assert start!73766)

(declare-fun b_free!14681 () Bool)

(declare-fun b_next!14681 () Bool)

(assert (=> start!73766 (= b_free!14681 (not b_next!14681))))

(declare-fun tp!51547 () Bool)

(declare-fun b_and!24341 () Bool)

(assert (=> start!73766 (= tp!51547 b_and!24341)))

(declare-fun b!865275 () Bool)

(declare-fun res!587943 () Bool)

(declare-fun e!482024 () Bool)

(assert (=> b!865275 (=> (not res!587943) (not e!482024))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49794 0))(
  ( (array!49795 (arr!23928 (Array (_ BitVec 32) (_ BitVec 64))) (size!24368 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49794)

(assert (=> b!865275 (= res!587943 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24368 _keys!868))))))

(declare-fun b!865276 () Bool)

(declare-datatypes ((Unit!29632 0))(
  ( (Unit!29633) )
))
(declare-fun e!482018 () Unit!29632)

(declare-fun Unit!29634 () Unit!29632)

(assert (=> b!865276 (= e!482018 Unit!29634)))

(declare-fun lt!391993 () Unit!29632)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49794 (_ BitVec 32) (_ BitVec 32)) Unit!29632)

(assert (=> b!865276 (= lt!391993 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17010 0))(
  ( (Nil!17007) (Cons!17006 (h!18137 (_ BitVec 64)) (t!23957 List!17010)) )
))
(declare-fun arrayNoDuplicates!0 (array!49794 (_ BitVec 32) List!17010) Bool)

(assert (=> b!865276 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17007)))

(declare-fun lt!392005 () Unit!29632)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49794 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29632)

(assert (=> b!865276 (= lt!392005 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865276 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391997 () Unit!29632)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49794 (_ BitVec 64) (_ BitVec 32) List!17010) Unit!29632)

(assert (=> b!865276 (= lt!391997 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17007))))

(assert (=> b!865276 false))

(declare-fun b!865277 () Bool)

(declare-fun res!587935 () Bool)

(assert (=> b!865277 (=> (not res!587935) (not e!482024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865277 (= res!587935 (validKeyInArray!0 k!854))))

(declare-fun b!865278 () Bool)

(declare-fun res!587938 () Bool)

(assert (=> b!865278 (=> (not res!587938) (not e!482024))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49794 (_ BitVec 32)) Bool)

(assert (=> b!865278 (= res!587938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865279 () Bool)

(declare-fun res!587942 () Bool)

(assert (=> b!865279 (=> (not res!587942) (not e!482024))))

(assert (=> b!865279 (= res!587942 (and (= (select (arr!23928 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26825 () Bool)

(declare-fun mapRes!26825 () Bool)

(assert (=> mapIsEmpty!26825 mapRes!26825))

(declare-fun b!865280 () Bool)

(declare-fun res!587936 () Bool)

(assert (=> b!865280 (=> (not res!587936) (not e!482024))))

(declare-datatypes ((V!27469 0))(
  ( (V!27470 (val!8456 Int)) )
))
(declare-datatypes ((ValueCell!7969 0))(
  ( (ValueCellFull!7969 (v!10881 V!27469)) (EmptyCell!7969) )
))
(declare-datatypes ((array!49796 0))(
  ( (array!49797 (arr!23929 (Array (_ BitVec 32) ValueCell!7969)) (size!24369 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49796)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!865280 (= res!587936 (and (= (size!24369 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24368 _keys!868) (size!24369 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865281 () Bool)

(declare-fun e!482026 () Bool)

(declare-fun e!482020 () Bool)

(assert (=> b!865281 (= e!482026 (and e!482020 mapRes!26825))))

(declare-fun condMapEmpty!26825 () Bool)

(declare-fun mapDefault!26825 () ValueCell!7969)

