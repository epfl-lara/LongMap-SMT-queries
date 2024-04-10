; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73440 () Bool)

(assert start!73440)

(declare-fun b_free!14355 () Bool)

(declare-fun b_next!14355 () Bool)

(assert (=> start!73440 (= b_free!14355 (not b_next!14355))))

(declare-fun tp!50568 () Bool)

(declare-fun b_and!23711 () Bool)

(assert (=> start!73440 (= tp!50568 b_and!23711)))

(declare-fun b!857514 () Bool)

(declare-fun res!582508 () Bool)

(declare-fun e!477939 () Bool)

(assert (=> b!857514 (=> (not res!582508) (not e!477939))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49172 0))(
  ( (array!49173 (arr!23617 (Array (_ BitVec 32) (_ BitVec 64))) (size!24057 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49172)

(assert (=> b!857514 (= res!582508 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24057 _keys!868))))))

(declare-fun res!582501 () Bool)

(assert (=> start!73440 (=> (not res!582501) (not e!477939))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73440 (= res!582501 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24057 _keys!868))))))

(assert (=> start!73440 e!477939))

(declare-fun tp_is_empty!16491 () Bool)

(assert (=> start!73440 tp_is_empty!16491))

(assert (=> start!73440 true))

(assert (=> start!73440 tp!50568))

(declare-fun array_inv!18702 (array!49172) Bool)

(assert (=> start!73440 (array_inv!18702 _keys!868)))

(declare-datatypes ((V!27035 0))(
  ( (V!27036 (val!8293 Int)) )
))
(declare-datatypes ((ValueCell!7806 0))(
  ( (ValueCellFull!7806 (v!10718 V!27035)) (EmptyCell!7806) )
))
(declare-datatypes ((array!49174 0))(
  ( (array!49175 (arr!23618 (Array (_ BitVec 32) ValueCell!7806)) (size!24058 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49174)

(declare-fun e!477935 () Bool)

(declare-fun array_inv!18703 (array!49174) Bool)

(assert (=> start!73440 (and (array_inv!18703 _values!688) e!477935)))

(declare-fun b!857515 () Bool)

(declare-fun e!477936 () Bool)

(assert (=> b!857515 (= e!477939 e!477936)))

(declare-fun res!582504 () Bool)

(assert (=> b!857515 (=> (not res!582504) (not e!477936))))

(assert (=> b!857515 (= res!582504 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27035)

(declare-fun zeroValue!654 () V!27035)

(declare-datatypes ((tuple2!10942 0))(
  ( (tuple2!10943 (_1!5482 (_ BitVec 64)) (_2!5482 V!27035)) )
))
(declare-datatypes ((List!16749 0))(
  ( (Nil!16746) (Cons!16745 (h!17876 tuple2!10942) (t!23390 List!16749)) )
))
(declare-datatypes ((ListLongMap!9711 0))(
  ( (ListLongMap!9712 (toList!4871 List!16749)) )
))
(declare-fun lt!386316 () ListLongMap!9711)

(declare-fun lt!386315 () array!49174)

(declare-fun getCurrentListMapNoExtraKeys!2852 (array!49172 array!49174 (_ BitVec 32) (_ BitVec 32) V!27035 V!27035 (_ BitVec 32) Int) ListLongMap!9711)

(assert (=> b!857515 (= lt!386316 (getCurrentListMapNoExtraKeys!2852 _keys!868 lt!386315 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27035)

(assert (=> b!857515 (= lt!386315 (array!49175 (store (arr!23618 _values!688) i!612 (ValueCellFull!7806 v!557)) (size!24058 _values!688)))))

(declare-fun lt!386314 () ListLongMap!9711)

(assert (=> b!857515 (= lt!386314 (getCurrentListMapNoExtraKeys!2852 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857516 () Bool)

(declare-fun res!582507 () Bool)

(assert (=> b!857516 (=> (not res!582507) (not e!477939))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857516 (= res!582507 (validKeyInArray!0 k0!854))))

(declare-fun b!857517 () Bool)

(declare-fun res!582506 () Bool)

(assert (=> b!857517 (=> (not res!582506) (not e!477939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857517 (= res!582506 (validMask!0 mask!1196))))

(declare-fun b!857518 () Bool)

(declare-fun res!582502 () Bool)

(assert (=> b!857518 (=> (not res!582502) (not e!477939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49172 (_ BitVec 32)) Bool)

(assert (=> b!857518 (= res!582502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857519 () Bool)

(declare-fun res!582509 () Bool)

(assert (=> b!857519 (=> (not res!582509) (not e!477939))))

(declare-datatypes ((List!16750 0))(
  ( (Nil!16747) (Cons!16746 (h!17877 (_ BitVec 64)) (t!23391 List!16750)) )
))
(declare-fun arrayNoDuplicates!0 (array!49172 (_ BitVec 32) List!16750) Bool)

(assert (=> b!857519 (= res!582509 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16747))))

(declare-fun b!857520 () Bool)

(declare-fun e!477937 () Bool)

(assert (=> b!857520 (= e!477937 tp_is_empty!16491)))

(declare-fun b!857521 () Bool)

(declare-fun res!582505 () Bool)

(assert (=> b!857521 (=> (not res!582505) (not e!477939))))

(assert (=> b!857521 (= res!582505 (and (= (select (arr!23617 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857522 () Bool)

(assert (=> b!857522 (= e!477936 (not true))))

(declare-fun +!2225 (ListLongMap!9711 tuple2!10942) ListLongMap!9711)

(assert (=> b!857522 (= (getCurrentListMapNoExtraKeys!2852 _keys!868 lt!386315 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2225 (getCurrentListMapNoExtraKeys!2852 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10943 k0!854 v!557)))))

(declare-datatypes ((Unit!29237 0))(
  ( (Unit!29238) )
))
(declare-fun lt!386317 () Unit!29237)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!446 (array!49172 array!49174 (_ BitVec 32) (_ BitVec 32) V!27035 V!27035 (_ BitVec 32) (_ BitVec 64) V!27035 (_ BitVec 32) Int) Unit!29237)

(assert (=> b!857522 (= lt!386317 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!446 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857523 () Bool)

(declare-fun e!477938 () Bool)

(assert (=> b!857523 (= e!477938 tp_is_empty!16491)))

(declare-fun b!857524 () Bool)

(declare-fun mapRes!26336 () Bool)

(assert (=> b!857524 (= e!477935 (and e!477937 mapRes!26336))))

(declare-fun condMapEmpty!26336 () Bool)

(declare-fun mapDefault!26336 () ValueCell!7806)

(assert (=> b!857524 (= condMapEmpty!26336 (= (arr!23618 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7806)) mapDefault!26336)))))

(declare-fun mapIsEmpty!26336 () Bool)

(assert (=> mapIsEmpty!26336 mapRes!26336))

(declare-fun mapNonEmpty!26336 () Bool)

(declare-fun tp!50569 () Bool)

(assert (=> mapNonEmpty!26336 (= mapRes!26336 (and tp!50569 e!477938))))

(declare-fun mapKey!26336 () (_ BitVec 32))

(declare-fun mapValue!26336 () ValueCell!7806)

(declare-fun mapRest!26336 () (Array (_ BitVec 32) ValueCell!7806))

(assert (=> mapNonEmpty!26336 (= (arr!23618 _values!688) (store mapRest!26336 mapKey!26336 mapValue!26336))))

(declare-fun b!857525 () Bool)

(declare-fun res!582503 () Bool)

(assert (=> b!857525 (=> (not res!582503) (not e!477939))))

(assert (=> b!857525 (= res!582503 (and (= (size!24058 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24057 _keys!868) (size!24058 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73440 res!582501) b!857517))

(assert (= (and b!857517 res!582506) b!857525))

(assert (= (and b!857525 res!582503) b!857518))

(assert (= (and b!857518 res!582502) b!857519))

(assert (= (and b!857519 res!582509) b!857514))

(assert (= (and b!857514 res!582508) b!857516))

(assert (= (and b!857516 res!582507) b!857521))

(assert (= (and b!857521 res!582505) b!857515))

(assert (= (and b!857515 res!582504) b!857522))

(assert (= (and b!857524 condMapEmpty!26336) mapIsEmpty!26336))

(assert (= (and b!857524 (not condMapEmpty!26336)) mapNonEmpty!26336))

(get-info :version)

(assert (= (and mapNonEmpty!26336 ((_ is ValueCellFull!7806) mapValue!26336)) b!857523))

(assert (= (and b!857524 ((_ is ValueCellFull!7806) mapDefault!26336)) b!857520))

(assert (= start!73440 b!857524))

(declare-fun m!798281 () Bool)

(assert (=> b!857517 m!798281))

(declare-fun m!798283 () Bool)

(assert (=> b!857518 m!798283))

(declare-fun m!798285 () Bool)

(assert (=> mapNonEmpty!26336 m!798285))

(declare-fun m!798287 () Bool)

(assert (=> b!857521 m!798287))

(declare-fun m!798289 () Bool)

(assert (=> b!857516 m!798289))

(declare-fun m!798291 () Bool)

(assert (=> b!857519 m!798291))

(declare-fun m!798293 () Bool)

(assert (=> b!857522 m!798293))

(declare-fun m!798295 () Bool)

(assert (=> b!857522 m!798295))

(assert (=> b!857522 m!798295))

(declare-fun m!798297 () Bool)

(assert (=> b!857522 m!798297))

(declare-fun m!798299 () Bool)

(assert (=> b!857522 m!798299))

(declare-fun m!798301 () Bool)

(assert (=> b!857515 m!798301))

(declare-fun m!798303 () Bool)

(assert (=> b!857515 m!798303))

(declare-fun m!798305 () Bool)

(assert (=> b!857515 m!798305))

(declare-fun m!798307 () Bool)

(assert (=> start!73440 m!798307))

(declare-fun m!798309 () Bool)

(assert (=> start!73440 m!798309))

(check-sat (not b!857516) (not mapNonEmpty!26336) (not b!857522) (not b_next!14355) (not b!857517) tp_is_empty!16491 (not b!857515) b_and!23711 (not start!73440) (not b!857518) (not b!857519))
(check-sat b_and!23711 (not b_next!14355))
