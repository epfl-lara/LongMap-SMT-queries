; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73954 () Bool)

(assert start!73954)

(declare-fun b_free!14887 () Bool)

(declare-fun b_next!14887 () Bool)

(assert (=> start!73954 (= b_free!14887 (not b_next!14887))))

(declare-fun tp!52166 () Bool)

(declare-fun b_and!24613 () Bool)

(assert (=> start!73954 (= tp!52166 b_and!24613)))

(declare-fun b!869380 () Bool)

(declare-fun res!590881 () Bool)

(declare-fun e!484132 () Bool)

(assert (=> b!869380 (=> (not res!590881) (not e!484132))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50183 0))(
  ( (array!50184 (arr!24123 (Array (_ BitVec 32) (_ BitVec 64))) (size!24565 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50183)

(declare-datatypes ((V!27745 0))(
  ( (V!27746 (val!8559 Int)) )
))
(declare-datatypes ((ValueCell!8072 0))(
  ( (ValueCellFull!8072 (v!10978 V!27745)) (EmptyCell!8072) )
))
(declare-datatypes ((array!50185 0))(
  ( (array!50186 (arr!24124 (Array (_ BitVec 32) ValueCell!8072)) (size!24566 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50185)

(assert (=> b!869380 (= res!590881 (and (= (size!24566 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24565 _keys!868) (size!24566 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869381 () Bool)

(declare-fun res!590883 () Bool)

(assert (=> b!869381 (=> (not res!590883) (not e!484132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869381 (= res!590883 (validMask!0 mask!1196))))

(declare-fun b!869382 () Bool)

(declare-fun res!590885 () Bool)

(assert (=> b!869382 (=> (not res!590885) (not e!484132))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869382 (= res!590885 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24565 _keys!868))))))

(declare-fun mapIsEmpty!27134 () Bool)

(declare-fun mapRes!27134 () Bool)

(assert (=> mapIsEmpty!27134 mapRes!27134))

(declare-fun b!869383 () Bool)

(declare-fun res!590886 () Bool)

(assert (=> b!869383 (=> (not res!590886) (not e!484132))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!869383 (= res!590886 (and (= (select (arr!24123 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869384 () Bool)

(declare-fun e!484136 () Bool)

(declare-fun e!484133 () Bool)

(assert (=> b!869384 (= e!484136 (and e!484133 mapRes!27134))))

(declare-fun condMapEmpty!27134 () Bool)

(declare-fun mapDefault!27134 () ValueCell!8072)

(assert (=> b!869384 (= condMapEmpty!27134 (= (arr!24124 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8072)) mapDefault!27134)))))

(declare-fun b!869385 () Bool)

(declare-fun tp_is_empty!17023 () Bool)

(assert (=> b!869385 (= e!484133 tp_is_empty!17023)))

(declare-fun res!590882 () Bool)

(assert (=> start!73954 (=> (not res!590882) (not e!484132))))

(assert (=> start!73954 (= res!590882 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24565 _keys!868))))))

(assert (=> start!73954 e!484132))

(assert (=> start!73954 tp_is_empty!17023))

(assert (=> start!73954 true))

(assert (=> start!73954 tp!52166))

(declare-fun array_inv!19118 (array!50183) Bool)

(assert (=> start!73954 (array_inv!19118 _keys!868)))

(declare-fun array_inv!19119 (array!50185) Bool)

(assert (=> start!73954 (and (array_inv!19119 _values!688) e!484136)))

(declare-fun b!869386 () Bool)

(declare-fun res!590880 () Bool)

(assert (=> b!869386 (=> (not res!590880) (not e!484132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869386 (= res!590880 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27134 () Bool)

(declare-fun tp!52165 () Bool)

(declare-fun e!484135 () Bool)

(assert (=> mapNonEmpty!27134 (= mapRes!27134 (and tp!52165 e!484135))))

(declare-fun mapRest!27134 () (Array (_ BitVec 32) ValueCell!8072))

(declare-fun mapValue!27134 () ValueCell!8072)

(declare-fun mapKey!27134 () (_ BitVec 32))

(assert (=> mapNonEmpty!27134 (= (arr!24124 _values!688) (store mapRest!27134 mapKey!27134 mapValue!27134))))

(declare-fun b!869387 () Bool)

(declare-fun res!590879 () Bool)

(assert (=> b!869387 (=> (not res!590879) (not e!484132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50183 (_ BitVec 32)) Bool)

(assert (=> b!869387 (= res!590879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869388 () Bool)

(declare-fun e!484137 () Bool)

(assert (=> b!869388 (= e!484132 e!484137)))

(declare-fun res!590884 () Bool)

(assert (=> b!869388 (=> (not res!590884) (not e!484137))))

(assert (=> b!869388 (= res!590884 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27745)

(declare-fun zeroValue!654 () V!27745)

(declare-fun lt!394626 () array!50185)

(declare-datatypes ((tuple2!11384 0))(
  ( (tuple2!11385 (_1!5703 (_ BitVec 64)) (_2!5703 V!27745)) )
))
(declare-datatypes ((List!17167 0))(
  ( (Nil!17164) (Cons!17163 (h!18294 tuple2!11384) (t!24195 List!17167)) )
))
(declare-datatypes ((ListLongMap!10143 0))(
  ( (ListLongMap!10144 (toList!5087 List!17167)) )
))
(declare-fun lt!394627 () ListLongMap!10143)

(declare-fun getCurrentListMapNoExtraKeys!3080 (array!50183 array!50185 (_ BitVec 32) (_ BitVec 32) V!27745 V!27745 (_ BitVec 32) Int) ListLongMap!10143)

(assert (=> b!869388 (= lt!394627 (getCurrentListMapNoExtraKeys!3080 _keys!868 lt!394626 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27745)

(assert (=> b!869388 (= lt!394626 (array!50186 (store (arr!24124 _values!688) i!612 (ValueCellFull!8072 v!557)) (size!24566 _values!688)))))

(declare-fun lt!394625 () ListLongMap!10143)

(assert (=> b!869388 (= lt!394625 (getCurrentListMapNoExtraKeys!3080 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869389 () Bool)

(assert (=> b!869389 (= e!484137 (not true))))

(declare-fun +!2449 (ListLongMap!10143 tuple2!11384) ListLongMap!10143)

(assert (=> b!869389 (= (getCurrentListMapNoExtraKeys!3080 _keys!868 lt!394626 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2449 (getCurrentListMapNoExtraKeys!3080 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11385 k0!854 v!557)))))

(declare-datatypes ((Unit!29785 0))(
  ( (Unit!29786) )
))
(declare-fun lt!394628 () Unit!29785)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!617 (array!50183 array!50185 (_ BitVec 32) (_ BitVec 32) V!27745 V!27745 (_ BitVec 32) (_ BitVec 64) V!27745 (_ BitVec 32) Int) Unit!29785)

(assert (=> b!869389 (= lt!394628 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!617 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869390 () Bool)

(declare-fun res!590878 () Bool)

(assert (=> b!869390 (=> (not res!590878) (not e!484132))))

(declare-datatypes ((List!17168 0))(
  ( (Nil!17165) (Cons!17164 (h!18295 (_ BitVec 64)) (t!24196 List!17168)) )
))
(declare-fun arrayNoDuplicates!0 (array!50183 (_ BitVec 32) List!17168) Bool)

(assert (=> b!869390 (= res!590878 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17165))))

(declare-fun b!869391 () Bool)

(assert (=> b!869391 (= e!484135 tp_is_empty!17023)))

(assert (= (and start!73954 res!590882) b!869381))

(assert (= (and b!869381 res!590883) b!869380))

(assert (= (and b!869380 res!590881) b!869387))

(assert (= (and b!869387 res!590879) b!869390))

(assert (= (and b!869390 res!590878) b!869382))

(assert (= (and b!869382 res!590885) b!869386))

(assert (= (and b!869386 res!590880) b!869383))

(assert (= (and b!869383 res!590886) b!869388))

(assert (= (and b!869388 res!590884) b!869389))

(assert (= (and b!869384 condMapEmpty!27134) mapIsEmpty!27134))

(assert (= (and b!869384 (not condMapEmpty!27134)) mapNonEmpty!27134))

(get-info :version)

(assert (= (and mapNonEmpty!27134 ((_ is ValueCellFull!8072) mapValue!27134)) b!869391))

(assert (= (and b!869384 ((_ is ValueCellFull!8072) mapDefault!27134)) b!869385))

(assert (= start!73954 b!869384))

(declare-fun m!810369 () Bool)

(assert (=> b!869389 m!810369))

(declare-fun m!810371 () Bool)

(assert (=> b!869389 m!810371))

(assert (=> b!869389 m!810371))

(declare-fun m!810373 () Bool)

(assert (=> b!869389 m!810373))

(declare-fun m!810375 () Bool)

(assert (=> b!869389 m!810375))

(declare-fun m!810377 () Bool)

(assert (=> b!869387 m!810377))

(declare-fun m!810379 () Bool)

(assert (=> b!869381 m!810379))

(declare-fun m!810381 () Bool)

(assert (=> b!869390 m!810381))

(declare-fun m!810383 () Bool)

(assert (=> b!869383 m!810383))

(declare-fun m!810385 () Bool)

(assert (=> start!73954 m!810385))

(declare-fun m!810387 () Bool)

(assert (=> start!73954 m!810387))

(declare-fun m!810389 () Bool)

(assert (=> b!869386 m!810389))

(declare-fun m!810391 () Bool)

(assert (=> b!869388 m!810391))

(declare-fun m!810393 () Bool)

(assert (=> b!869388 m!810393))

(declare-fun m!810395 () Bool)

(assert (=> b!869388 m!810395))

(declare-fun m!810397 () Bool)

(assert (=> mapNonEmpty!27134 m!810397))

(check-sat tp_is_empty!17023 (not b!869388) (not b_next!14887) (not b!869386) (not b!869387) (not start!73954) (not b!869381) (not b!869389) (not b!869390) b_and!24613 (not mapNonEmpty!27134))
(check-sat b_and!24613 (not b_next!14887))
