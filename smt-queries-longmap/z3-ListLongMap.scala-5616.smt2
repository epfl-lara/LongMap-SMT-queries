; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73648 () Bool)

(assert start!73648)

(declare-fun b_free!14395 () Bool)

(declare-fun b_next!14395 () Bool)

(assert (=> start!73648 (= b_free!14395 (not b_next!14395))))

(declare-fun tp!50689 () Bool)

(declare-fun b_and!23779 () Bool)

(assert (=> start!73648 (= tp!50689 b_and!23779)))

(declare-fun mapNonEmpty!26396 () Bool)

(declare-fun mapRes!26396 () Bool)

(declare-fun tp!50690 () Bool)

(declare-fun e!478915 () Bool)

(assert (=> mapNonEmpty!26396 (= mapRes!26396 (and tp!50690 e!478915))))

(declare-datatypes ((V!27089 0))(
  ( (V!27090 (val!8313 Int)) )
))
(declare-datatypes ((ValueCell!7826 0))(
  ( (ValueCellFull!7826 (v!10738 V!27089)) (EmptyCell!7826) )
))
(declare-fun mapRest!26396 () (Array (_ BitVec 32) ValueCell!7826))

(declare-datatypes ((array!49293 0))(
  ( (array!49294 (arr!23673 (Array (_ BitVec 32) ValueCell!7826)) (size!24114 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49293)

(declare-fun mapValue!26396 () ValueCell!7826)

(declare-fun mapKey!26396 () (_ BitVec 32))

(assert (=> mapNonEmpty!26396 (= (arr!23673 _values!688) (store mapRest!26396 mapKey!26396 mapValue!26396))))

(declare-fun b!859194 () Bool)

(declare-fun e!478917 () Bool)

(declare-fun tp_is_empty!16531 () Bool)

(assert (=> b!859194 (= e!478917 tp_is_empty!16531)))

(declare-fun b!859195 () Bool)

(declare-fun res!583431 () Bool)

(declare-fun e!478919 () Bool)

(assert (=> b!859195 (=> (not res!583431) (not e!478919))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49295 0))(
  ( (array!49296 (arr!23674 (Array (_ BitVec 32) (_ BitVec 64))) (size!24115 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49295)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859195 (= res!583431 (and (= (select (arr!23674 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859196 () Bool)

(declare-fun res!583429 () Bool)

(assert (=> b!859196 (=> (not res!583429) (not e!478919))))

(declare-datatypes ((List!16735 0))(
  ( (Nil!16732) (Cons!16731 (h!17868 (_ BitVec 64)) (t!23388 List!16735)) )
))
(declare-fun arrayNoDuplicates!0 (array!49295 (_ BitVec 32) List!16735) Bool)

(assert (=> b!859196 (= res!583429 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16732))))

(declare-fun b!859197 () Bool)

(declare-fun e!478921 () Bool)

(assert (=> b!859197 (= e!478919 e!478921)))

(declare-fun res!583432 () Bool)

(assert (=> b!859197 (=> (not res!583432) (not e!478921))))

(assert (=> b!859197 (= res!583432 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387002 () array!49293)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27089)

(declare-fun zeroValue!654 () V!27089)

(declare-datatypes ((tuple2!10896 0))(
  ( (tuple2!10897 (_1!5459 (_ BitVec 64)) (_2!5459 V!27089)) )
))
(declare-datatypes ((List!16736 0))(
  ( (Nil!16733) (Cons!16732 (h!17869 tuple2!10896) (t!23389 List!16736)) )
))
(declare-datatypes ((ListLongMap!9667 0))(
  ( (ListLongMap!9668 (toList!4849 List!16736)) )
))
(declare-fun lt!387004 () ListLongMap!9667)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2905 (array!49295 array!49293 (_ BitVec 32) (_ BitVec 32) V!27089 V!27089 (_ BitVec 32) Int) ListLongMap!9667)

(assert (=> b!859197 (= lt!387004 (getCurrentListMapNoExtraKeys!2905 _keys!868 lt!387002 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27089)

(assert (=> b!859197 (= lt!387002 (array!49294 (store (arr!23673 _values!688) i!612 (ValueCellFull!7826 v!557)) (size!24114 _values!688)))))

(declare-fun lt!387008 () ListLongMap!9667)

(assert (=> b!859197 (= lt!387008 (getCurrentListMapNoExtraKeys!2905 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859198 () Bool)

(declare-fun e!478916 () Bool)

(assert (=> b!859198 (= e!478916 true)))

(declare-fun lt!387005 () ListLongMap!9667)

(declare-fun +!2256 (ListLongMap!9667 tuple2!10896) ListLongMap!9667)

(declare-fun get!12472 (ValueCell!7826 V!27089) V!27089)

(declare-fun dynLambda!1090 (Int (_ BitVec 64)) V!27089)

(assert (=> b!859198 (= lt!387004 (+!2256 lt!387005 (tuple2!10897 (select (arr!23674 _keys!868) from!1053) (get!12472 (select (arr!23673 _values!688) from!1053) (dynLambda!1090 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859199 () Bool)

(assert (=> b!859199 (= e!478915 tp_is_empty!16531)))

(declare-fun b!859200 () Bool)

(declare-fun e!478918 () Bool)

(assert (=> b!859200 (= e!478918 (and e!478917 mapRes!26396))))

(declare-fun condMapEmpty!26396 () Bool)

(declare-fun mapDefault!26396 () ValueCell!7826)

(assert (=> b!859200 (= condMapEmpty!26396 (= (arr!23673 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7826)) mapDefault!26396)))))

(declare-fun b!859201 () Bool)

(declare-fun res!583428 () Bool)

(assert (=> b!859201 (=> (not res!583428) (not e!478919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859201 (= res!583428 (validMask!0 mask!1196))))

(declare-fun b!859202 () Bool)

(declare-fun res!583424 () Bool)

(assert (=> b!859202 (=> (not res!583424) (not e!478919))))

(assert (=> b!859202 (= res!583424 (and (= (size!24114 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24115 _keys!868) (size!24114 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859203 () Bool)

(assert (=> b!859203 (= e!478921 (not e!478916))))

(declare-fun res!583426 () Bool)

(assert (=> b!859203 (=> res!583426 e!478916)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859203 (= res!583426 (not (validKeyInArray!0 (select (arr!23674 _keys!868) from!1053))))))

(declare-fun lt!387006 () ListLongMap!9667)

(assert (=> b!859203 (= lt!387006 lt!387005)))

(declare-fun lt!387007 () ListLongMap!9667)

(assert (=> b!859203 (= lt!387005 (+!2256 lt!387007 (tuple2!10897 k0!854 v!557)))))

(assert (=> b!859203 (= lt!387006 (getCurrentListMapNoExtraKeys!2905 _keys!868 lt!387002 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859203 (= lt!387007 (getCurrentListMapNoExtraKeys!2905 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29266 0))(
  ( (Unit!29267) )
))
(declare-fun lt!387003 () Unit!29266)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!453 (array!49295 array!49293 (_ BitVec 32) (_ BitVec 32) V!27089 V!27089 (_ BitVec 32) (_ BitVec 64) V!27089 (_ BitVec 32) Int) Unit!29266)

(assert (=> b!859203 (= lt!387003 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!453 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26396 () Bool)

(assert (=> mapIsEmpty!26396 mapRes!26396))

(declare-fun b!859193 () Bool)

(declare-fun res!583430 () Bool)

(assert (=> b!859193 (=> (not res!583430) (not e!478919))))

(assert (=> b!859193 (= res!583430 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24115 _keys!868))))))

(declare-fun res!583425 () Bool)

(assert (=> start!73648 (=> (not res!583425) (not e!478919))))

(assert (=> start!73648 (= res!583425 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24115 _keys!868))))))

(assert (=> start!73648 e!478919))

(assert (=> start!73648 tp_is_empty!16531))

(assert (=> start!73648 true))

(assert (=> start!73648 tp!50689))

(declare-fun array_inv!18796 (array!49295) Bool)

(assert (=> start!73648 (array_inv!18796 _keys!868)))

(declare-fun array_inv!18797 (array!49293) Bool)

(assert (=> start!73648 (and (array_inv!18797 _values!688) e!478918)))

(declare-fun b!859204 () Bool)

(declare-fun res!583423 () Bool)

(assert (=> b!859204 (=> (not res!583423) (not e!478919))))

(assert (=> b!859204 (= res!583423 (validKeyInArray!0 k0!854))))

(declare-fun b!859205 () Bool)

(declare-fun res!583427 () Bool)

(assert (=> b!859205 (=> (not res!583427) (not e!478919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49295 (_ BitVec 32)) Bool)

(assert (=> b!859205 (= res!583427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73648 res!583425) b!859201))

(assert (= (and b!859201 res!583428) b!859202))

(assert (= (and b!859202 res!583424) b!859205))

(assert (= (and b!859205 res!583427) b!859196))

(assert (= (and b!859196 res!583429) b!859193))

(assert (= (and b!859193 res!583430) b!859204))

(assert (= (and b!859204 res!583423) b!859195))

(assert (= (and b!859195 res!583431) b!859197))

(assert (= (and b!859197 res!583432) b!859203))

(assert (= (and b!859203 (not res!583426)) b!859198))

(assert (= (and b!859200 condMapEmpty!26396) mapIsEmpty!26396))

(assert (= (and b!859200 (not condMapEmpty!26396)) mapNonEmpty!26396))

(get-info :version)

(assert (= (and mapNonEmpty!26396 ((_ is ValueCellFull!7826) mapValue!26396)) b!859199))

(assert (= (and b!859200 ((_ is ValueCellFull!7826) mapDefault!26396)) b!859194))

(assert (= start!73648 b!859200))

(declare-fun b_lambda!11761 () Bool)

(assert (=> (not b_lambda!11761) (not b!859198)))

(declare-fun t!23387 () Bool)

(declare-fun tb!4509 () Bool)

(assert (=> (and start!73648 (= defaultEntry!696 defaultEntry!696) t!23387) tb!4509))

(declare-fun result!8637 () Bool)

(assert (=> tb!4509 (= result!8637 tp_is_empty!16531)))

(assert (=> b!859198 t!23387))

(declare-fun b_and!23781 () Bool)

(assert (= b_and!23779 (and (=> t!23387 result!8637) b_and!23781)))

(declare-fun m!800291 () Bool)

(assert (=> b!859203 m!800291))

(declare-fun m!800293 () Bool)

(assert (=> b!859203 m!800293))

(declare-fun m!800295 () Bool)

(assert (=> b!859203 m!800295))

(declare-fun m!800297 () Bool)

(assert (=> b!859203 m!800297))

(assert (=> b!859203 m!800295))

(declare-fun m!800299 () Bool)

(assert (=> b!859203 m!800299))

(declare-fun m!800301 () Bool)

(assert (=> b!859203 m!800301))

(declare-fun m!800303 () Bool)

(assert (=> b!859197 m!800303))

(declare-fun m!800305 () Bool)

(assert (=> b!859197 m!800305))

(declare-fun m!800307 () Bool)

(assert (=> b!859197 m!800307))

(declare-fun m!800309 () Bool)

(assert (=> b!859195 m!800309))

(declare-fun m!800311 () Bool)

(assert (=> b!859201 m!800311))

(declare-fun m!800313 () Bool)

(assert (=> start!73648 m!800313))

(declare-fun m!800315 () Bool)

(assert (=> start!73648 m!800315))

(declare-fun m!800317 () Bool)

(assert (=> b!859205 m!800317))

(declare-fun m!800319 () Bool)

(assert (=> b!859204 m!800319))

(declare-fun m!800321 () Bool)

(assert (=> b!859196 m!800321))

(declare-fun m!800323 () Bool)

(assert (=> b!859198 m!800323))

(declare-fun m!800325 () Bool)

(assert (=> b!859198 m!800325))

(declare-fun m!800327 () Bool)

(assert (=> b!859198 m!800327))

(assert (=> b!859198 m!800323))

(declare-fun m!800329 () Bool)

(assert (=> b!859198 m!800329))

(assert (=> b!859198 m!800295))

(assert (=> b!859198 m!800325))

(declare-fun m!800331 () Bool)

(assert (=> mapNonEmpty!26396 m!800331))

(check-sat (not b!859198) b_and!23781 (not b!859201) (not mapNonEmpty!26396) (not b!859205) (not b!859197) (not b_lambda!11761) (not start!73648) (not b!859204) (not b!859196) (not b!859203) (not b_next!14395) tp_is_empty!16531)
(check-sat b_and!23781 (not b_next!14395))
