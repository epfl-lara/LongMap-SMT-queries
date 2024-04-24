; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73072 () Bool)

(assert start!73072)

(declare-fun b_free!13819 () Bool)

(declare-fun b_next!13819 () Bool)

(assert (=> start!73072 (= b_free!13819 (not b_next!13819))))

(declare-fun tp!48961 () Bool)

(declare-fun b_and!22915 () Bool)

(assert (=> start!73072 (= tp!48961 b_and!22915)))

(declare-fun b!847300 () Bool)

(declare-fun res!575387 () Bool)

(declare-fun e!472981 () Bool)

(assert (=> b!847300 (=> (not res!575387) (not e!472981))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48173 0))(
  ( (array!48174 (arr!23113 (Array (_ BitVec 32) (_ BitVec 64))) (size!23554 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48173)

(declare-datatypes ((V!26321 0))(
  ( (V!26322 (val!8025 Int)) )
))
(declare-datatypes ((ValueCell!7538 0))(
  ( (ValueCellFull!7538 (v!10450 V!26321)) (EmptyCell!7538) )
))
(declare-datatypes ((array!48175 0))(
  ( (array!48176 (arr!23114 (Array (_ BitVec 32) ValueCell!7538)) (size!23555 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48175)

(assert (=> b!847300 (= res!575387 (and (= (size!23555 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23554 _keys!868) (size!23555 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847301 () Bool)

(declare-fun e!472982 () Bool)

(declare-fun e!472980 () Bool)

(declare-fun mapRes!25532 () Bool)

(assert (=> b!847301 (= e!472982 (and e!472980 mapRes!25532))))

(declare-fun condMapEmpty!25532 () Bool)

(declare-fun mapDefault!25532 () ValueCell!7538)

(assert (=> b!847301 (= condMapEmpty!25532 (= (arr!23114 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7538)) mapDefault!25532)))))

(declare-fun b!847302 () Bool)

(declare-fun tp_is_empty!15955 () Bool)

(assert (=> b!847302 (= e!472980 tp_is_empty!15955)))

(declare-fun b!847303 () Bool)

(declare-fun res!575384 () Bool)

(assert (=> b!847303 (=> (not res!575384) (not e!472981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847303 (= res!575384 (validMask!0 mask!1196))))

(declare-fun b!847304 () Bool)

(declare-fun res!575389 () Bool)

(assert (=> b!847304 (=> (not res!575389) (not e!472981))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847304 (= res!575389 (and (= (select (arr!23113 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847305 () Bool)

(declare-fun res!575382 () Bool)

(assert (=> b!847305 (=> (not res!575382) (not e!472981))))

(assert (=> b!847305 (= res!575382 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23554 _keys!868))))))

(declare-fun b!847306 () Bool)

(declare-fun e!472983 () Bool)

(assert (=> b!847306 (= e!472983 tp_is_empty!15955)))

(declare-fun b!847307 () Bool)

(declare-fun res!575386 () Bool)

(assert (=> b!847307 (=> (not res!575386) (not e!472981))))

(declare-datatypes ((List!16274 0))(
  ( (Nil!16271) (Cons!16270 (h!17407 (_ BitVec 64)) (t!22637 List!16274)) )
))
(declare-fun arrayNoDuplicates!0 (array!48173 (_ BitVec 32) List!16274) Bool)

(assert (=> b!847307 (= res!575386 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16271))))

(declare-fun res!575385 () Bool)

(assert (=> start!73072 (=> (not res!575385) (not e!472981))))

(assert (=> start!73072 (= res!575385 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23554 _keys!868))))))

(assert (=> start!73072 e!472981))

(assert (=> start!73072 tp_is_empty!15955))

(assert (=> start!73072 true))

(assert (=> start!73072 tp!48961))

(declare-fun array_inv!18414 (array!48173) Bool)

(assert (=> start!73072 (array_inv!18414 _keys!868)))

(declare-fun array_inv!18415 (array!48175) Bool)

(assert (=> start!73072 (and (array_inv!18415 _values!688) e!472982)))

(declare-fun b!847308 () Bool)

(declare-fun res!575383 () Bool)

(assert (=> b!847308 (=> (not res!575383) (not e!472981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48173 (_ BitVec 32)) Bool)

(assert (=> b!847308 (= res!575383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847309 () Bool)

(declare-fun res!575388 () Bool)

(assert (=> b!847309 (=> (not res!575388) (not e!472981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847309 (= res!575388 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25532 () Bool)

(declare-fun tp!48962 () Bool)

(assert (=> mapNonEmpty!25532 (= mapRes!25532 (and tp!48962 e!472983))))

(declare-fun mapKey!25532 () (_ BitVec 32))

(declare-fun mapRest!25532 () (Array (_ BitVec 32) ValueCell!7538))

(declare-fun mapValue!25532 () ValueCell!7538)

(assert (=> mapNonEmpty!25532 (= (arr!23114 _values!688) (store mapRest!25532 mapKey!25532 mapValue!25532))))

(declare-fun b!847310 () Bool)

(assert (=> b!847310 (= e!472981 false)))

(declare-fun v!557 () V!26321)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10402 0))(
  ( (tuple2!10403 (_1!5212 (_ BitVec 64)) (_2!5212 V!26321)) )
))
(declare-datatypes ((List!16275 0))(
  ( (Nil!16272) (Cons!16271 (h!17408 tuple2!10402) (t!22638 List!16275)) )
))
(declare-datatypes ((ListLongMap!9173 0))(
  ( (ListLongMap!9174 (toList!4602 List!16275)) )
))
(declare-fun lt!381889 () ListLongMap!9173)

(declare-fun minValue!654 () V!26321)

(declare-fun zeroValue!654 () V!26321)

(declare-fun getCurrentListMapNoExtraKeys!2660 (array!48173 array!48175 (_ BitVec 32) (_ BitVec 32) V!26321 V!26321 (_ BitVec 32) Int) ListLongMap!9173)

(assert (=> b!847310 (= lt!381889 (getCurrentListMapNoExtraKeys!2660 _keys!868 (array!48176 (store (arr!23114 _values!688) i!612 (ValueCellFull!7538 v!557)) (size!23555 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381890 () ListLongMap!9173)

(assert (=> b!847310 (= lt!381890 (getCurrentListMapNoExtraKeys!2660 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25532 () Bool)

(assert (=> mapIsEmpty!25532 mapRes!25532))

(assert (= (and start!73072 res!575385) b!847303))

(assert (= (and b!847303 res!575384) b!847300))

(assert (= (and b!847300 res!575387) b!847308))

(assert (= (and b!847308 res!575383) b!847307))

(assert (= (and b!847307 res!575386) b!847305))

(assert (= (and b!847305 res!575382) b!847309))

(assert (= (and b!847309 res!575388) b!847304))

(assert (= (and b!847304 res!575389) b!847310))

(assert (= (and b!847301 condMapEmpty!25532) mapIsEmpty!25532))

(assert (= (and b!847301 (not condMapEmpty!25532)) mapNonEmpty!25532))

(get-info :version)

(assert (= (and mapNonEmpty!25532 ((_ is ValueCellFull!7538) mapValue!25532)) b!847306))

(assert (= (and b!847301 ((_ is ValueCellFull!7538) mapDefault!25532)) b!847302))

(assert (= start!73072 b!847301))

(declare-fun m!789101 () Bool)

(assert (=> b!847308 m!789101))

(declare-fun m!789103 () Bool)

(assert (=> b!847304 m!789103))

(declare-fun m!789105 () Bool)

(assert (=> b!847307 m!789105))

(declare-fun m!789107 () Bool)

(assert (=> mapNonEmpty!25532 m!789107))

(declare-fun m!789109 () Bool)

(assert (=> b!847303 m!789109))

(declare-fun m!789111 () Bool)

(assert (=> b!847310 m!789111))

(declare-fun m!789113 () Bool)

(assert (=> b!847310 m!789113))

(declare-fun m!789115 () Bool)

(assert (=> b!847310 m!789115))

(declare-fun m!789117 () Bool)

(assert (=> b!847309 m!789117))

(declare-fun m!789119 () Bool)

(assert (=> start!73072 m!789119))

(declare-fun m!789121 () Bool)

(assert (=> start!73072 m!789121))

(check-sat (not b_next!13819) (not b!847309) (not b!847310) (not b!847307) (not start!73072) tp_is_empty!15955 (not mapNonEmpty!25532) (not b!847303) (not b!847308) b_and!22915)
(check-sat b_and!22915 (not b_next!13819))
