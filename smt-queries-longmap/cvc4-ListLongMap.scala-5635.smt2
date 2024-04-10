; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73598 () Bool)

(assert start!73598)

(declare-fun b_free!14513 () Bool)

(declare-fun b_next!14513 () Bool)

(assert (=> start!73598 (= b_free!14513 (not b_next!14513))))

(declare-fun tp!51043 () Bool)

(declare-fun b_and!24005 () Bool)

(assert (=> start!73598 (= tp!51043 b_and!24005)))

(declare-fun b!861139 () Bool)

(declare-fun res!585235 () Bool)

(declare-fun e!479816 () Bool)

(assert (=> b!861139 (=> (not res!585235) (not e!479816))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49468 0))(
  ( (array!49469 (arr!23765 (Array (_ BitVec 32) (_ BitVec 64))) (size!24205 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49468)

(declare-datatypes ((V!27245 0))(
  ( (V!27246 (val!8372 Int)) )
))
(declare-datatypes ((ValueCell!7885 0))(
  ( (ValueCellFull!7885 (v!10797 V!27245)) (EmptyCell!7885) )
))
(declare-datatypes ((array!49470 0))(
  ( (array!49471 (arr!23766 (Array (_ BitVec 32) ValueCell!7885)) (size!24206 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49470)

(assert (=> b!861139 (= res!585235 (and (= (size!24206 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24205 _keys!868) (size!24206 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861140 () Bool)

(declare-fun e!479820 () Bool)

(declare-fun tp_is_empty!16649 () Bool)

(assert (=> b!861140 (= e!479820 tp_is_empty!16649)))

(declare-fun b!861141 () Bool)

(declare-fun res!585232 () Bool)

(assert (=> b!861141 (=> (not res!585232) (not e!479816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861141 (= res!585232 (validMask!0 mask!1196))))

(declare-fun b!861142 () Bool)

(declare-datatypes ((Unit!29366 0))(
  ( (Unit!29367) )
))
(declare-fun e!479814 () Unit!29366)

(declare-fun Unit!29368 () Unit!29366)

(assert (=> b!861142 (= e!479814 Unit!29368)))

(declare-fun b!861143 () Bool)

(declare-fun Unit!29369 () Unit!29366)

(assert (=> b!861143 (= e!479814 Unit!29369)))

(declare-fun lt!388287 () Unit!29366)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49468 (_ BitVec 32) (_ BitVec 32)) Unit!29366)

(assert (=> b!861143 (= lt!388287 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16874 0))(
  ( (Nil!16871) (Cons!16870 (h!18001 (_ BitVec 64)) (t!23653 List!16874)) )
))
(declare-fun arrayNoDuplicates!0 (array!49468 (_ BitVec 32) List!16874) Bool)

(assert (=> b!861143 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16871)))

(declare-fun lt!388282 () Unit!29366)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29366)

(assert (=> b!861143 (= lt!388282 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861143 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388289 () Unit!29366)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49468 (_ BitVec 64) (_ BitVec 32) List!16874) Unit!29366)

(assert (=> b!861143 (= lt!388289 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16871))))

(assert (=> b!861143 false))

(declare-fun b!861144 () Bool)

(declare-fun e!479819 () Bool)

(assert (=> b!861144 (= e!479819 tp_is_empty!16649)))

(declare-fun b!861145 () Bool)

(declare-fun res!585229 () Bool)

(assert (=> b!861145 (=> (not res!585229) (not e!479816))))

(assert (=> b!861145 (= res!585229 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16871))))

(declare-fun b!861146 () Bool)

(declare-fun e!479818 () Bool)

(declare-fun e!479821 () Bool)

(assert (=> b!861146 (= e!479818 (not e!479821))))

(declare-fun res!585230 () Bool)

(assert (=> b!861146 (=> res!585230 e!479821)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861146 (= res!585230 (not (validKeyInArray!0 (select (arr!23765 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11064 0))(
  ( (tuple2!11065 (_1!5543 (_ BitVec 64)) (_2!5543 V!27245)) )
))
(declare-datatypes ((List!16875 0))(
  ( (Nil!16872) (Cons!16871 (h!18002 tuple2!11064) (t!23654 List!16875)) )
))
(declare-datatypes ((ListLongMap!9833 0))(
  ( (ListLongMap!9834 (toList!4932 List!16875)) )
))
(declare-fun lt!388291 () ListLongMap!9833)

(declare-fun lt!388290 () ListLongMap!9833)

(assert (=> b!861146 (= lt!388291 lt!388290)))

(declare-fun lt!388288 () ListLongMap!9833)

(declare-fun v!557 () V!27245)

(declare-fun +!2283 (ListLongMap!9833 tuple2!11064) ListLongMap!9833)

(assert (=> b!861146 (= lt!388290 (+!2283 lt!388288 (tuple2!11065 k!854 v!557)))))

(declare-fun lt!388281 () array!49470)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27245)

(declare-fun zeroValue!654 () V!27245)

(declare-fun getCurrentListMapNoExtraKeys!2909 (array!49468 array!49470 (_ BitVec 32) (_ BitVec 32) V!27245 V!27245 (_ BitVec 32) Int) ListLongMap!9833)

(assert (=> b!861146 (= lt!388291 (getCurrentListMapNoExtraKeys!2909 _keys!868 lt!388281 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861146 (= lt!388288 (getCurrentListMapNoExtraKeys!2909 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388285 () Unit!29366)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!495 (array!49468 array!49470 (_ BitVec 32) (_ BitVec 32) V!27245 V!27245 (_ BitVec 32) (_ BitVec 64) V!27245 (_ BitVec 32) Int) Unit!29366)

(assert (=> b!861146 (= lt!388285 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!495 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861147 () Bool)

(declare-fun res!585227 () Bool)

(assert (=> b!861147 (=> (not res!585227) (not e!479816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49468 (_ BitVec 32)) Bool)

(assert (=> b!861147 (= res!585227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861148 () Bool)

(declare-fun res!585234 () Bool)

(assert (=> b!861148 (=> (not res!585234) (not e!479816))))

(assert (=> b!861148 (= res!585234 (and (= (select (arr!23765 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861149 () Bool)

(declare-fun res!585231 () Bool)

(assert (=> b!861149 (=> (not res!585231) (not e!479816))))

(assert (=> b!861149 (= res!585231 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24205 _keys!868))))))

(declare-fun res!585228 () Bool)

(assert (=> start!73598 (=> (not res!585228) (not e!479816))))

(assert (=> start!73598 (= res!585228 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24205 _keys!868))))))

(assert (=> start!73598 e!479816))

(assert (=> start!73598 tp_is_empty!16649))

(assert (=> start!73598 true))

(assert (=> start!73598 tp!51043))

(declare-fun array_inv!18810 (array!49468) Bool)

(assert (=> start!73598 (array_inv!18810 _keys!868)))

(declare-fun e!479815 () Bool)

(declare-fun array_inv!18811 (array!49470) Bool)

(assert (=> start!73598 (and (array_inv!18811 _values!688) e!479815)))

(declare-fun mapIsEmpty!26573 () Bool)

(declare-fun mapRes!26573 () Bool)

(assert (=> mapIsEmpty!26573 mapRes!26573))

(declare-fun b!861150 () Bool)

(declare-fun res!585233 () Bool)

(assert (=> b!861150 (=> (not res!585233) (not e!479816))))

(assert (=> b!861150 (= res!585233 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26573 () Bool)

(declare-fun tp!51042 () Bool)

(assert (=> mapNonEmpty!26573 (= mapRes!26573 (and tp!51042 e!479819))))

(declare-fun mapKey!26573 () (_ BitVec 32))

(declare-fun mapValue!26573 () ValueCell!7885)

(declare-fun mapRest!26573 () (Array (_ BitVec 32) ValueCell!7885))

(assert (=> mapNonEmpty!26573 (= (arr!23766 _values!688) (store mapRest!26573 mapKey!26573 mapValue!26573))))

(declare-fun b!861151 () Bool)

(assert (=> b!861151 (= e!479821 true)))

(assert (=> b!861151 (not (= (select (arr!23765 _keys!868) from!1053) k!854))))

(declare-fun lt!388286 () Unit!29366)

(assert (=> b!861151 (= lt!388286 e!479814)))

(declare-fun c!91990 () Bool)

(assert (=> b!861151 (= c!91990 (= (select (arr!23765 _keys!868) from!1053) k!854))))

(declare-fun lt!388284 () ListLongMap!9833)

(declare-fun get!12533 (ValueCell!7885 V!27245) V!27245)

(declare-fun dynLambda!1119 (Int (_ BitVec 64)) V!27245)

(assert (=> b!861151 (= lt!388284 (+!2283 lt!388290 (tuple2!11065 (select (arr!23765 _keys!868) from!1053) (get!12533 (select (arr!23766 _values!688) from!1053) (dynLambda!1119 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861152 () Bool)

(assert (=> b!861152 (= e!479816 e!479818)))

(declare-fun res!585236 () Bool)

(assert (=> b!861152 (=> (not res!585236) (not e!479818))))

(assert (=> b!861152 (= res!585236 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861152 (= lt!388284 (getCurrentListMapNoExtraKeys!2909 _keys!868 lt!388281 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861152 (= lt!388281 (array!49471 (store (arr!23766 _values!688) i!612 (ValueCellFull!7885 v!557)) (size!24206 _values!688)))))

(declare-fun lt!388283 () ListLongMap!9833)

(assert (=> b!861152 (= lt!388283 (getCurrentListMapNoExtraKeys!2909 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861153 () Bool)

(assert (=> b!861153 (= e!479815 (and e!479820 mapRes!26573))))

(declare-fun condMapEmpty!26573 () Bool)

(declare-fun mapDefault!26573 () ValueCell!7885)

