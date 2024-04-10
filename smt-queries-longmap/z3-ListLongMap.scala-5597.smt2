; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73368 () Bool)

(assert start!73368)

(declare-fun b_free!14283 () Bool)

(declare-fun b_next!14283 () Bool)

(assert (=> start!73368 (= b_free!14283 (not b_next!14283))))

(declare-fun tp!50353 () Bool)

(declare-fun b_and!23639 () Bool)

(assert (=> start!73368 (= tp!50353 b_and!23639)))

(declare-fun b!856218 () Bool)

(declare-fun res!581536 () Bool)

(declare-fun e!477287 () Bool)

(assert (=> b!856218 (=> (not res!581536) (not e!477287))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856218 (= res!581536 (validKeyInArray!0 k0!854))))

(declare-fun b!856219 () Bool)

(declare-fun res!581530 () Bool)

(assert (=> b!856219 (=> (not res!581530) (not e!477287))))

(declare-datatypes ((array!49030 0))(
  ( (array!49031 (arr!23546 (Array (_ BitVec 32) (_ BitVec 64))) (size!23986 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49030)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49030 (_ BitVec 32)) Bool)

(assert (=> b!856219 (= res!581530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856221 () Bool)

(declare-fun e!477288 () Bool)

(declare-fun e!477292 () Bool)

(declare-fun mapRes!26228 () Bool)

(assert (=> b!856221 (= e!477288 (and e!477292 mapRes!26228))))

(declare-fun condMapEmpty!26228 () Bool)

(declare-datatypes ((V!26939 0))(
  ( (V!26940 (val!8257 Int)) )
))
(declare-datatypes ((ValueCell!7770 0))(
  ( (ValueCellFull!7770 (v!10682 V!26939)) (EmptyCell!7770) )
))
(declare-datatypes ((array!49032 0))(
  ( (array!49033 (arr!23547 (Array (_ BitVec 32) ValueCell!7770)) (size!23987 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49032)

(declare-fun mapDefault!26228 () ValueCell!7770)

(assert (=> b!856221 (= condMapEmpty!26228 (= (arr!23547 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7770)) mapDefault!26228)))))

(declare-fun b!856222 () Bool)

(declare-fun e!477291 () Bool)

(assert (=> b!856222 (= e!477291 (not true))))

(declare-fun v!557 () V!26939)

(declare-fun lt!385885 () array!49032)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26939)

(declare-fun zeroValue!654 () V!26939)

(declare-datatypes ((tuple2!10884 0))(
  ( (tuple2!10885 (_1!5453 (_ BitVec 64)) (_2!5453 V!26939)) )
))
(declare-datatypes ((List!16696 0))(
  ( (Nil!16693) (Cons!16692 (h!17823 tuple2!10884) (t!23337 List!16696)) )
))
(declare-datatypes ((ListLongMap!9653 0))(
  ( (ListLongMap!9654 (toList!4842 List!16696)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2823 (array!49030 array!49032 (_ BitVec 32) (_ BitVec 32) V!26939 V!26939 (_ BitVec 32) Int) ListLongMap!9653)

(declare-fun +!2199 (ListLongMap!9653 tuple2!10884) ListLongMap!9653)

(assert (=> b!856222 (= (getCurrentListMapNoExtraKeys!2823 _keys!868 lt!385885 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2199 (getCurrentListMapNoExtraKeys!2823 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10885 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29185 0))(
  ( (Unit!29186) )
))
(declare-fun lt!385882 () Unit!29185)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!420 (array!49030 array!49032 (_ BitVec 32) (_ BitVec 32) V!26939 V!26939 (_ BitVec 32) (_ BitVec 64) V!26939 (_ BitVec 32) Int) Unit!29185)

(assert (=> b!856222 (= lt!385882 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!420 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856223 () Bool)

(declare-fun res!581533 () Bool)

(assert (=> b!856223 (=> (not res!581533) (not e!477287))))

(assert (=> b!856223 (= res!581533 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23986 _keys!868))))))

(declare-fun b!856224 () Bool)

(declare-fun tp_is_empty!16419 () Bool)

(assert (=> b!856224 (= e!477292 tp_is_empty!16419)))

(declare-fun b!856225 () Bool)

(declare-fun res!581531 () Bool)

(assert (=> b!856225 (=> (not res!581531) (not e!477287))))

(declare-datatypes ((List!16697 0))(
  ( (Nil!16694) (Cons!16693 (h!17824 (_ BitVec 64)) (t!23338 List!16697)) )
))
(declare-fun arrayNoDuplicates!0 (array!49030 (_ BitVec 32) List!16697) Bool)

(assert (=> b!856225 (= res!581531 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16694))))

(declare-fun b!856226 () Bool)

(declare-fun res!581532 () Bool)

(assert (=> b!856226 (=> (not res!581532) (not e!477287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856226 (= res!581532 (validMask!0 mask!1196))))

(declare-fun res!581534 () Bool)

(assert (=> start!73368 (=> (not res!581534) (not e!477287))))

(assert (=> start!73368 (= res!581534 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23986 _keys!868))))))

(assert (=> start!73368 e!477287))

(assert (=> start!73368 tp_is_empty!16419))

(assert (=> start!73368 true))

(assert (=> start!73368 tp!50353))

(declare-fun array_inv!18652 (array!49030) Bool)

(assert (=> start!73368 (array_inv!18652 _keys!868)))

(declare-fun array_inv!18653 (array!49032) Bool)

(assert (=> start!73368 (and (array_inv!18653 _values!688) e!477288)))

(declare-fun b!856220 () Bool)

(declare-fun res!581529 () Bool)

(assert (=> b!856220 (=> (not res!581529) (not e!477287))))

(assert (=> b!856220 (= res!581529 (and (= (select (arr!23546 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856227 () Bool)

(declare-fun res!581537 () Bool)

(assert (=> b!856227 (=> (not res!581537) (not e!477287))))

(assert (=> b!856227 (= res!581537 (and (= (size!23987 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23986 _keys!868) (size!23987 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26228 () Bool)

(declare-fun tp!50352 () Bool)

(declare-fun e!477290 () Bool)

(assert (=> mapNonEmpty!26228 (= mapRes!26228 (and tp!50352 e!477290))))

(declare-fun mapValue!26228 () ValueCell!7770)

(declare-fun mapRest!26228 () (Array (_ BitVec 32) ValueCell!7770))

(declare-fun mapKey!26228 () (_ BitVec 32))

(assert (=> mapNonEmpty!26228 (= (arr!23547 _values!688) (store mapRest!26228 mapKey!26228 mapValue!26228))))

(declare-fun b!856228 () Bool)

(assert (=> b!856228 (= e!477287 e!477291)))

(declare-fun res!581535 () Bool)

(assert (=> b!856228 (=> (not res!581535) (not e!477291))))

(assert (=> b!856228 (= res!581535 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385884 () ListLongMap!9653)

(assert (=> b!856228 (= lt!385884 (getCurrentListMapNoExtraKeys!2823 _keys!868 lt!385885 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856228 (= lt!385885 (array!49033 (store (arr!23547 _values!688) i!612 (ValueCellFull!7770 v!557)) (size!23987 _values!688)))))

(declare-fun lt!385883 () ListLongMap!9653)

(assert (=> b!856228 (= lt!385883 (getCurrentListMapNoExtraKeys!2823 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26228 () Bool)

(assert (=> mapIsEmpty!26228 mapRes!26228))

(declare-fun b!856229 () Bool)

(assert (=> b!856229 (= e!477290 tp_is_empty!16419)))

(assert (= (and start!73368 res!581534) b!856226))

(assert (= (and b!856226 res!581532) b!856227))

(assert (= (and b!856227 res!581537) b!856219))

(assert (= (and b!856219 res!581530) b!856225))

(assert (= (and b!856225 res!581531) b!856223))

(assert (= (and b!856223 res!581533) b!856218))

(assert (= (and b!856218 res!581536) b!856220))

(assert (= (and b!856220 res!581529) b!856228))

(assert (= (and b!856228 res!581535) b!856222))

(assert (= (and b!856221 condMapEmpty!26228) mapIsEmpty!26228))

(assert (= (and b!856221 (not condMapEmpty!26228)) mapNonEmpty!26228))

(get-info :version)

(assert (= (and mapNonEmpty!26228 ((_ is ValueCellFull!7770) mapValue!26228)) b!856229))

(assert (= (and b!856221 ((_ is ValueCellFull!7770) mapDefault!26228)) b!856224))

(assert (= start!73368 b!856221))

(declare-fun m!797201 () Bool)

(assert (=> mapNonEmpty!26228 m!797201))

(declare-fun m!797203 () Bool)

(assert (=> start!73368 m!797203))

(declare-fun m!797205 () Bool)

(assert (=> start!73368 m!797205))

(declare-fun m!797207 () Bool)

(assert (=> b!856226 m!797207))

(declare-fun m!797209 () Bool)

(assert (=> b!856222 m!797209))

(declare-fun m!797211 () Bool)

(assert (=> b!856222 m!797211))

(assert (=> b!856222 m!797211))

(declare-fun m!797213 () Bool)

(assert (=> b!856222 m!797213))

(declare-fun m!797215 () Bool)

(assert (=> b!856222 m!797215))

(declare-fun m!797217 () Bool)

(assert (=> b!856228 m!797217))

(declare-fun m!797219 () Bool)

(assert (=> b!856228 m!797219))

(declare-fun m!797221 () Bool)

(assert (=> b!856228 m!797221))

(declare-fun m!797223 () Bool)

(assert (=> b!856225 m!797223))

(declare-fun m!797225 () Bool)

(assert (=> b!856218 m!797225))

(declare-fun m!797227 () Bool)

(assert (=> b!856220 m!797227))

(declare-fun m!797229 () Bool)

(assert (=> b!856219 m!797229))

(check-sat (not mapNonEmpty!26228) (not start!73368) (not b!856222) (not b_next!14283) (not b!856228) tp_is_empty!16419 (not b!856218) (not b!856219) (not b!856226) (not b!856225) b_and!23639)
(check-sat b_and!23639 (not b_next!14283))
