; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73664 () Bool)

(assert start!73664)

(declare-fun b_free!14579 () Bool)

(declare-fun b_next!14579 () Bool)

(assert (=> start!73664 (= b_free!14579 (not b_next!14579))))

(declare-fun tp!51241 () Bool)

(declare-fun b_and!24137 () Bool)

(assert (=> start!73664 (= tp!51241 b_and!24137)))

(declare-fun res!586257 () Bool)

(declare-fun e!480647 () Bool)

(assert (=> start!73664 (=> (not res!586257) (not e!480647))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49594 0))(
  ( (array!49595 (arr!23828 (Array (_ BitVec 32) (_ BitVec 64))) (size!24268 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49594)

(assert (=> start!73664 (= res!586257 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24268 _keys!868))))))

(assert (=> start!73664 e!480647))

(declare-fun tp_is_empty!16715 () Bool)

(assert (=> start!73664 tp_is_empty!16715))

(assert (=> start!73664 true))

(assert (=> start!73664 tp!51241))

(declare-fun array_inv!18852 (array!49594) Bool)

(assert (=> start!73664 (array_inv!18852 _keys!868)))

(declare-datatypes ((V!27333 0))(
  ( (V!27334 (val!8405 Int)) )
))
(declare-datatypes ((ValueCell!7918 0))(
  ( (ValueCellFull!7918 (v!10830 V!27333)) (EmptyCell!7918) )
))
(declare-datatypes ((array!49596 0))(
  ( (array!49597 (arr!23829 (Array (_ BitVec 32) ValueCell!7918)) (size!24269 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49596)

(declare-fun e!480644 () Bool)

(declare-fun array_inv!18853 (array!49596) Bool)

(assert (=> start!73664 (and (array_inv!18853 _values!688) e!480644)))

(declare-fun b!862725 () Bool)

(declare-fun e!480648 () Bool)

(assert (=> b!862725 (= e!480647 e!480648)))

(declare-fun res!586254 () Bool)

(assert (=> b!862725 (=> (not res!586254) (not e!480648))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862725 (= res!586254 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11120 0))(
  ( (tuple2!11121 (_1!5571 (_ BitVec 64)) (_2!5571 V!27333)) )
))
(declare-datatypes ((List!16929 0))(
  ( (Nil!16926) (Cons!16925 (h!18056 tuple2!11120) (t!23774 List!16929)) )
))
(declare-datatypes ((ListLongMap!9889 0))(
  ( (ListLongMap!9890 (toList!4960 List!16929)) )
))
(declare-fun lt!389554 () ListLongMap!9889)

(declare-fun minValue!654 () V!27333)

(declare-fun zeroValue!654 () V!27333)

(declare-fun lt!389550 () array!49596)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2936 (array!49594 array!49596 (_ BitVec 32) (_ BitVec 32) V!27333 V!27333 (_ BitVec 32) Int) ListLongMap!9889)

(assert (=> b!862725 (= lt!389554 (getCurrentListMapNoExtraKeys!2936 _keys!868 lt!389550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27333)

(assert (=> b!862725 (= lt!389550 (array!49597 (store (arr!23829 _values!688) i!612 (ValueCellFull!7918 v!557)) (size!24269 _values!688)))))

(declare-fun lt!389560 () ListLongMap!9889)

(assert (=> b!862725 (= lt!389560 (getCurrentListMapNoExtraKeys!2936 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862726 () Bool)

(declare-fun res!586253 () Bool)

(assert (=> b!862726 (=> (not res!586253) (not e!480647))))

(assert (=> b!862726 (= res!586253 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24268 _keys!868))))))

(declare-fun b!862727 () Bool)

(declare-fun res!586262 () Bool)

(assert (=> b!862727 (=> (not res!586262) (not e!480647))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862727 (= res!586262 (validKeyInArray!0 k!854))))

(declare-fun b!862728 () Bool)

(declare-fun e!480649 () Bool)

(assert (=> b!862728 (= e!480649 true)))

(declare-fun lt!389545 () tuple2!11120)

(declare-fun lt!389546 () ListLongMap!9889)

(declare-fun lt!389552 () tuple2!11120)

(declare-fun lt!389555 () ListLongMap!9889)

(declare-fun +!2309 (ListLongMap!9889 tuple2!11120) ListLongMap!9889)

(assert (=> b!862728 (= lt!389546 (+!2309 (+!2309 lt!389555 lt!389545) lt!389552))))

(declare-datatypes ((Unit!29473 0))(
  ( (Unit!29474) )
))
(declare-fun lt!389551 () Unit!29473)

(declare-fun lt!389549 () V!27333)

(declare-fun addCommutativeForDiffKeys!485 (ListLongMap!9889 (_ BitVec 64) V!27333 (_ BitVec 64) V!27333) Unit!29473)

(assert (=> b!862728 (= lt!389551 (addCommutativeForDiffKeys!485 lt!389555 k!854 v!557 (select (arr!23828 _keys!868) from!1053) lt!389549))))

(declare-fun b!862729 () Bool)

(declare-fun e!480646 () Unit!29473)

(declare-fun Unit!29475 () Unit!29473)

(assert (=> b!862729 (= e!480646 Unit!29475)))

(declare-fun b!862730 () Bool)

(declare-fun res!586256 () Bool)

(assert (=> b!862730 (=> (not res!586256) (not e!480647))))

(declare-datatypes ((List!16930 0))(
  ( (Nil!16927) (Cons!16926 (h!18057 (_ BitVec 64)) (t!23775 List!16930)) )
))
(declare-fun arrayNoDuplicates!0 (array!49594 (_ BitVec 32) List!16930) Bool)

(assert (=> b!862730 (= res!586256 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16927))))

(declare-fun mapIsEmpty!26672 () Bool)

(declare-fun mapRes!26672 () Bool)

(assert (=> mapIsEmpty!26672 mapRes!26672))

(declare-fun b!862731 () Bool)

(declare-fun res!586255 () Bool)

(assert (=> b!862731 (=> (not res!586255) (not e!480647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862731 (= res!586255 (validMask!0 mask!1196))))

(declare-fun b!862732 () Bool)

(declare-fun res!586260 () Bool)

(assert (=> b!862732 (=> (not res!586260) (not e!480647))))

(assert (=> b!862732 (= res!586260 (and (= (select (arr!23828 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!862733 () Bool)

(declare-fun Unit!29476 () Unit!29473)

(assert (=> b!862733 (= e!480646 Unit!29476)))

(declare-fun lt!389553 () Unit!29473)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49594 (_ BitVec 32) (_ BitVec 32)) Unit!29473)

(assert (=> b!862733 (= lt!389553 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862733 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16927)))

(declare-fun lt!389558 () Unit!29473)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29473)

(assert (=> b!862733 (= lt!389558 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862733 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389559 () Unit!29473)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49594 (_ BitVec 64) (_ BitVec 32) List!16930) Unit!29473)

(assert (=> b!862733 (= lt!389559 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16927))))

(assert (=> b!862733 false))

(declare-fun b!862734 () Bool)

(declare-fun e!480641 () Bool)

(assert (=> b!862734 (= e!480648 (not e!480641))))

(declare-fun res!586261 () Bool)

(assert (=> b!862734 (=> res!586261 e!480641)))

(assert (=> b!862734 (= res!586261 (not (validKeyInArray!0 (select (arr!23828 _keys!868) from!1053))))))

(declare-fun lt!389557 () ListLongMap!9889)

(declare-fun lt!389548 () ListLongMap!9889)

(assert (=> b!862734 (= lt!389557 lt!389548)))

(assert (=> b!862734 (= lt!389548 (+!2309 lt!389555 lt!389552))))

(assert (=> b!862734 (= lt!389557 (getCurrentListMapNoExtraKeys!2936 _keys!868 lt!389550 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862734 (= lt!389552 (tuple2!11121 k!854 v!557))))

(assert (=> b!862734 (= lt!389555 (getCurrentListMapNoExtraKeys!2936 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389556 () Unit!29473)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!518 (array!49594 array!49596 (_ BitVec 32) (_ BitVec 32) V!27333 V!27333 (_ BitVec 32) (_ BitVec 64) V!27333 (_ BitVec 32) Int) Unit!29473)

(assert (=> b!862734 (= lt!389556 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!518 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862735 () Bool)

(declare-fun e!480643 () Bool)

(assert (=> b!862735 (= e!480644 (and e!480643 mapRes!26672))))

(declare-fun condMapEmpty!26672 () Bool)

(declare-fun mapDefault!26672 () ValueCell!7918)

