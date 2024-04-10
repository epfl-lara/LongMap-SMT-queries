; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73642 () Bool)

(assert start!73642)

(declare-fun b_free!14557 () Bool)

(declare-fun b_next!14557 () Bool)

(assert (=> start!73642 (= b_free!14557 (not b_next!14557))))

(declare-fun tp!51174 () Bool)

(declare-fun b_and!24093 () Bool)

(assert (=> start!73642 (= tp!51174 b_and!24093)))

(declare-fun res!585889 () Bool)

(declare-fun e!480352 () Bool)

(assert (=> start!73642 (=> (not res!585889) (not e!480352))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49550 0))(
  ( (array!49551 (arr!23806 (Array (_ BitVec 32) (_ BitVec 64))) (size!24246 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49550)

(assert (=> start!73642 (= res!585889 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24246 _keys!868))))))

(assert (=> start!73642 e!480352))

(declare-fun tp_is_empty!16693 () Bool)

(assert (=> start!73642 tp_is_empty!16693))

(assert (=> start!73642 true))

(assert (=> start!73642 tp!51174))

(declare-fun array_inv!18836 (array!49550) Bool)

(assert (=> start!73642 (array_inv!18836 _keys!868)))

(declare-datatypes ((V!27305 0))(
  ( (V!27306 (val!8394 Int)) )
))
(declare-datatypes ((ValueCell!7907 0))(
  ( (ValueCellFull!7907 (v!10819 V!27305)) (EmptyCell!7907) )
))
(declare-datatypes ((array!49552 0))(
  ( (array!49553 (arr!23807 (Array (_ BitVec 32) ValueCell!7907)) (size!24247 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49552)

(declare-fun e!480347 () Bool)

(declare-fun array_inv!18837 (array!49552) Bool)

(assert (=> start!73642 (and (array_inv!18837 _values!688) e!480347)))

(declare-fun b!862175 () Bool)

(declare-fun res!585890 () Bool)

(assert (=> b!862175 (=> (not res!585890) (not e!480352))))

(declare-datatypes ((List!16909 0))(
  ( (Nil!16906) (Cons!16905 (h!18036 (_ BitVec 64)) (t!23732 List!16909)) )
))
(declare-fun arrayNoDuplicates!0 (array!49550 (_ BitVec 32) List!16909) Bool)

(assert (=> b!862175 (= res!585890 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16906))))

(declare-fun b!862176 () Bool)

(declare-datatypes ((Unit!29433 0))(
  ( (Unit!29434) )
))
(declare-fun e!480345 () Unit!29433)

(declare-fun Unit!29435 () Unit!29433)

(assert (=> b!862176 (= e!480345 Unit!29435)))

(declare-fun b!862177 () Bool)

(declare-fun e!480350 () Bool)

(assert (=> b!862177 (= e!480352 e!480350)))

(declare-fun res!585896 () Bool)

(assert (=> b!862177 (=> (not res!585896) (not e!480350))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862177 (= res!585896 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389026 () array!49552)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11100 0))(
  ( (tuple2!11101 (_1!5561 (_ BitVec 64)) (_2!5561 V!27305)) )
))
(declare-datatypes ((List!16910 0))(
  ( (Nil!16907) (Cons!16906 (h!18037 tuple2!11100) (t!23733 List!16910)) )
))
(declare-datatypes ((ListLongMap!9869 0))(
  ( (ListLongMap!9870 (toList!4950 List!16910)) )
))
(declare-fun lt!389020 () ListLongMap!9869)

(declare-fun minValue!654 () V!27305)

(declare-fun zeroValue!654 () V!27305)

(declare-fun getCurrentListMapNoExtraKeys!2926 (array!49550 array!49552 (_ BitVec 32) (_ BitVec 32) V!27305 V!27305 (_ BitVec 32) Int) ListLongMap!9869)

(assert (=> b!862177 (= lt!389020 (getCurrentListMapNoExtraKeys!2926 _keys!868 lt!389026 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27305)

(assert (=> b!862177 (= lt!389026 (array!49553 (store (arr!23807 _values!688) i!612 (ValueCellFull!7907 v!557)) (size!24247 _values!688)))))

(declare-fun lt!389027 () ListLongMap!9869)

(assert (=> b!862177 (= lt!389027 (getCurrentListMapNoExtraKeys!2926 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862178 () Bool)

(declare-fun res!585897 () Bool)

(assert (=> b!862178 (=> (not res!585897) (not e!480352))))

(assert (=> b!862178 (= res!585897 (and (= (size!24247 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24246 _keys!868) (size!24247 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862179 () Bool)

(declare-fun res!585899 () Bool)

(assert (=> b!862179 (=> (not res!585899) (not e!480352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862179 (= res!585899 (validMask!0 mask!1196))))

(declare-fun b!862180 () Bool)

(declare-fun Unit!29436 () Unit!29433)

(assert (=> b!862180 (= e!480345 Unit!29436)))

(declare-fun lt!389030 () Unit!29433)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49550 (_ BitVec 32) (_ BitVec 32)) Unit!29433)

(assert (=> b!862180 (= lt!389030 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862180 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16906)))

(declare-fun lt!389023 () Unit!29433)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29433)

(assert (=> b!862180 (= lt!389023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862180 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389029 () Unit!29433)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49550 (_ BitVec 64) (_ BitVec 32) List!16909) Unit!29433)

(assert (=> b!862180 (= lt!389029 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16906))))

(assert (=> b!862180 false))

(declare-fun b!862181 () Bool)

(declare-fun e!480349 () Bool)

(declare-fun mapRes!26639 () Bool)

(assert (=> b!862181 (= e!480347 (and e!480349 mapRes!26639))))

(declare-fun condMapEmpty!26639 () Bool)

(declare-fun mapDefault!26639 () ValueCell!7907)

