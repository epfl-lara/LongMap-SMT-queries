; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73462 () Bool)

(assert start!73462)

(declare-fun b_free!14395 () Bool)

(declare-fun b_next!14395 () Bool)

(assert (=> start!73462 (= b_free!14395 (not b_next!14395))))

(declare-fun tp!50689 () Bool)

(declare-fun b_and!23743 () Bool)

(assert (=> start!73462 (= tp!50689 b_and!23743)))

(declare-fun mapNonEmpty!26396 () Bool)

(declare-fun mapRes!26396 () Bool)

(declare-fun tp!50690 () Bool)

(declare-fun e!478186 () Bool)

(assert (=> mapNonEmpty!26396 (= mapRes!26396 (and tp!50690 e!478186))))

(declare-datatypes ((V!27089 0))(
  ( (V!27090 (val!8313 Int)) )
))
(declare-datatypes ((ValueCell!7826 0))(
  ( (ValueCellFull!7826 (v!10732 V!27089)) (EmptyCell!7826) )
))
(declare-fun mapRest!26396 () (Array (_ BitVec 32) ValueCell!7826))

(declare-fun mapValue!26396 () ValueCell!7826)

(declare-fun mapKey!26396 () (_ BitVec 32))

(declare-datatypes ((array!49229 0))(
  ( (array!49230 (arr!23646 (Array (_ BitVec 32) ValueCell!7826)) (size!24088 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49229)

(assert (=> mapNonEmpty!26396 (= (arr!23646 _values!688) (store mapRest!26396 mapKey!26396 mapValue!26396))))

(declare-fun b!858051 () Bool)

(declare-fun e!478187 () Bool)

(assert (=> b!858051 (= e!478187 true)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10978 0))(
  ( (tuple2!10979 (_1!5500 (_ BitVec 64)) (_2!5500 V!27089)) )
))
(declare-datatypes ((List!16779 0))(
  ( (Nil!16776) (Cons!16775 (h!17906 tuple2!10978) (t!23431 List!16779)) )
))
(declare-datatypes ((ListLongMap!9737 0))(
  ( (ListLongMap!9738 (toList!4884 List!16779)) )
))
(declare-fun lt!386405 () ListLongMap!9737)

(declare-fun lt!386407 () ListLongMap!9737)

(declare-datatypes ((array!49231 0))(
  ( (array!49232 (arr!23647 (Array (_ BitVec 32) (_ BitVec 64))) (size!24089 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49231)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun +!2258 (ListLongMap!9737 tuple2!10978) ListLongMap!9737)

(declare-fun get!12457 (ValueCell!7826 V!27089) V!27089)

(declare-fun dynLambda!1078 (Int (_ BitVec 64)) V!27089)

(assert (=> b!858051 (= lt!386407 (+!2258 lt!386405 (tuple2!10979 (select (arr!23647 _keys!868) from!1053) (get!12457 (select (arr!23646 _values!688) from!1053) (dynLambda!1078 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858052 () Bool)

(declare-fun e!478190 () Bool)

(declare-fun e!478189 () Bool)

(assert (=> b!858052 (= e!478190 (and e!478189 mapRes!26396))))

(declare-fun condMapEmpty!26396 () Bool)

(declare-fun mapDefault!26396 () ValueCell!7826)

(assert (=> b!858052 (= condMapEmpty!26396 (= (arr!23646 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7826)) mapDefault!26396)))))

(declare-fun b!858053 () Bool)

(declare-fun res!582972 () Bool)

(declare-fun e!478191 () Bool)

(assert (=> b!858053 (=> (not res!582972) (not e!478191))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!858053 (= res!582972 (and (= (select (arr!23647 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858054 () Bool)

(declare-fun res!582973 () Bool)

(assert (=> b!858054 (=> (not res!582973) (not e!478191))))

(declare-datatypes ((List!16780 0))(
  ( (Nil!16777) (Cons!16776 (h!17907 (_ BitVec 64)) (t!23432 List!16780)) )
))
(declare-fun arrayNoDuplicates!0 (array!49231 (_ BitVec 32) List!16780) Bool)

(assert (=> b!858054 (= res!582973 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16777))))

(declare-fun b!858056 () Bool)

(declare-fun e!478185 () Bool)

(assert (=> b!858056 (= e!478185 (not e!478187))))

(declare-fun res!582969 () Bool)

(assert (=> b!858056 (=> res!582969 e!478187)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858056 (= res!582969 (not (validKeyInArray!0 (select (arr!23647 _keys!868) from!1053))))))

(declare-fun lt!386406 () ListLongMap!9737)

(assert (=> b!858056 (= lt!386406 lt!386405)))

(declare-fun lt!386411 () ListLongMap!9737)

(declare-fun v!557 () V!27089)

(assert (=> b!858056 (= lt!386405 (+!2258 lt!386411 (tuple2!10979 k0!854 v!557)))))

(declare-fun lt!386408 () array!49229)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27089)

(declare-fun zeroValue!654 () V!27089)

(declare-fun getCurrentListMapNoExtraKeys!2891 (array!49231 array!49229 (_ BitVec 32) (_ BitVec 32) V!27089 V!27089 (_ BitVec 32) Int) ListLongMap!9737)

(assert (=> b!858056 (= lt!386406 (getCurrentListMapNoExtraKeys!2891 _keys!868 lt!386408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858056 (= lt!386411 (getCurrentListMapNoExtraKeys!2891 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29185 0))(
  ( (Unit!29186) )
))
(declare-fun lt!386409 () Unit!29185)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!455 (array!49231 array!49229 (_ BitVec 32) (_ BitVec 32) V!27089 V!27089 (_ BitVec 32) (_ BitVec 64) V!27089 (_ BitVec 32) Int) Unit!29185)

(assert (=> b!858056 (= lt!386409 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!455 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858057 () Bool)

(declare-fun res!582976 () Bool)

(assert (=> b!858057 (=> (not res!582976) (not e!478191))))

(assert (=> b!858057 (= res!582976 (and (= (size!24088 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24089 _keys!868) (size!24088 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858058 () Bool)

(declare-fun tp_is_empty!16531 () Bool)

(assert (=> b!858058 (= e!478186 tp_is_empty!16531)))

(declare-fun b!858059 () Bool)

(assert (=> b!858059 (= e!478191 e!478185)))

(declare-fun res!582970 () Bool)

(assert (=> b!858059 (=> (not res!582970) (not e!478185))))

(assert (=> b!858059 (= res!582970 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858059 (= lt!386407 (getCurrentListMapNoExtraKeys!2891 _keys!868 lt!386408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858059 (= lt!386408 (array!49230 (store (arr!23646 _values!688) i!612 (ValueCellFull!7826 v!557)) (size!24088 _values!688)))))

(declare-fun lt!386410 () ListLongMap!9737)

(assert (=> b!858059 (= lt!386410 (getCurrentListMapNoExtraKeys!2891 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858060 () Bool)

(assert (=> b!858060 (= e!478189 tp_is_empty!16531)))

(declare-fun b!858061 () Bool)

(declare-fun res!582975 () Bool)

(assert (=> b!858061 (=> (not res!582975) (not e!478191))))

(assert (=> b!858061 (= res!582975 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24089 _keys!868))))))

(declare-fun b!858062 () Bool)

(declare-fun res!582977 () Bool)

(assert (=> b!858062 (=> (not res!582977) (not e!478191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49231 (_ BitVec 32)) Bool)

(assert (=> b!858062 (= res!582977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!582974 () Bool)

(assert (=> start!73462 (=> (not res!582974) (not e!478191))))

(assert (=> start!73462 (= res!582974 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24089 _keys!868))))))

(assert (=> start!73462 e!478191))

(assert (=> start!73462 tp_is_empty!16531))

(assert (=> start!73462 true))

(assert (=> start!73462 tp!50689))

(declare-fun array_inv!18786 (array!49231) Bool)

(assert (=> start!73462 (array_inv!18786 _keys!868)))

(declare-fun array_inv!18787 (array!49229) Bool)

(assert (=> start!73462 (and (array_inv!18787 _values!688) e!478190)))

(declare-fun b!858055 () Bool)

(declare-fun res!582971 () Bool)

(assert (=> b!858055 (=> (not res!582971) (not e!478191))))

(assert (=> b!858055 (= res!582971 (validKeyInArray!0 k0!854))))

(declare-fun b!858063 () Bool)

(declare-fun res!582978 () Bool)

(assert (=> b!858063 (=> (not res!582978) (not e!478191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858063 (= res!582978 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26396 () Bool)

(assert (=> mapIsEmpty!26396 mapRes!26396))

(assert (= (and start!73462 res!582974) b!858063))

(assert (= (and b!858063 res!582978) b!858057))

(assert (= (and b!858057 res!582976) b!858062))

(assert (= (and b!858062 res!582977) b!858054))

(assert (= (and b!858054 res!582973) b!858061))

(assert (= (and b!858061 res!582975) b!858055))

(assert (= (and b!858055 res!582971) b!858053))

(assert (= (and b!858053 res!582972) b!858059))

(assert (= (and b!858059 res!582970) b!858056))

(assert (= (and b!858056 (not res!582969)) b!858051))

(assert (= (and b!858052 condMapEmpty!26396) mapIsEmpty!26396))

(assert (= (and b!858052 (not condMapEmpty!26396)) mapNonEmpty!26396))

(get-info :version)

(assert (= (and mapNonEmpty!26396 ((_ is ValueCellFull!7826) mapValue!26396)) b!858058))

(assert (= (and b!858052 ((_ is ValueCellFull!7826) mapDefault!26396)) b!858060))

(assert (= start!73462 b!858052))

(declare-fun b_lambda!11729 () Bool)

(assert (=> (not b_lambda!11729) (not b!858051)))

(declare-fun t!23430 () Bool)

(declare-fun tb!4509 () Bool)

(assert (=> (and start!73462 (= defaultEntry!696 defaultEntry!696) t!23430) tb!4509))

(declare-fun result!8637 () Bool)

(assert (=> tb!4509 (= result!8637 tp_is_empty!16531)))

(assert (=> b!858051 t!23430))

(declare-fun b_and!23745 () Bool)

(assert (= b_and!23743 (and (=> t!23430 result!8637) b_and!23745)))

(declare-fun m!798243 () Bool)

(assert (=> b!858055 m!798243))

(declare-fun m!798245 () Bool)

(assert (=> start!73462 m!798245))

(declare-fun m!798247 () Bool)

(assert (=> start!73462 m!798247))

(declare-fun m!798249 () Bool)

(assert (=> b!858053 m!798249))

(declare-fun m!798251 () Bool)

(assert (=> b!858062 m!798251))

(declare-fun m!798253 () Bool)

(assert (=> b!858063 m!798253))

(declare-fun m!798255 () Bool)

(assert (=> mapNonEmpty!26396 m!798255))

(declare-fun m!798257 () Bool)

(assert (=> b!858054 m!798257))

(declare-fun m!798259 () Bool)

(assert (=> b!858056 m!798259))

(declare-fun m!798261 () Bool)

(assert (=> b!858056 m!798261))

(declare-fun m!798263 () Bool)

(assert (=> b!858056 m!798263))

(declare-fun m!798265 () Bool)

(assert (=> b!858056 m!798265))

(assert (=> b!858056 m!798263))

(declare-fun m!798267 () Bool)

(assert (=> b!858056 m!798267))

(declare-fun m!798269 () Bool)

(assert (=> b!858056 m!798269))

(declare-fun m!798271 () Bool)

(assert (=> b!858059 m!798271))

(declare-fun m!798273 () Bool)

(assert (=> b!858059 m!798273))

(declare-fun m!798275 () Bool)

(assert (=> b!858059 m!798275))

(declare-fun m!798277 () Bool)

(assert (=> b!858051 m!798277))

(declare-fun m!798279 () Bool)

(assert (=> b!858051 m!798279))

(declare-fun m!798281 () Bool)

(assert (=> b!858051 m!798281))

(assert (=> b!858051 m!798277))

(declare-fun m!798283 () Bool)

(assert (=> b!858051 m!798283))

(assert (=> b!858051 m!798263))

(assert (=> b!858051 m!798279))

(check-sat tp_is_empty!16531 (not b!858051) (not b_lambda!11729) (not b_next!14395) (not b!858054) (not start!73462) (not b!858063) (not b!858059) (not b!858056) (not mapNonEmpty!26396) b_and!23745 (not b!858055) (not b!858062))
(check-sat b_and!23745 (not b_next!14395))
