; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72886 () Bool)

(assert start!72886)

(declare-fun b_free!13819 () Bool)

(declare-fun b_next!13819 () Bool)

(assert (=> start!72886 (= b_free!13819 (not b_next!13819))))

(declare-fun tp!48961 () Bool)

(declare-fun b_and!22879 () Bool)

(assert (=> start!72886 (= tp!48961 b_and!22879)))

(declare-fun b!846158 () Bool)

(declare-fun e!472253 () Bool)

(declare-fun e!472252 () Bool)

(declare-fun mapRes!25532 () Bool)

(assert (=> b!846158 (= e!472253 (and e!472252 mapRes!25532))))

(declare-fun condMapEmpty!25532 () Bool)

(declare-datatypes ((V!26321 0))(
  ( (V!26322 (val!8025 Int)) )
))
(declare-datatypes ((ValueCell!7538 0))(
  ( (ValueCellFull!7538 (v!10444 V!26321)) (EmptyCell!7538) )
))
(declare-datatypes ((array!48125 0))(
  ( (array!48126 (arr!23094 (Array (_ BitVec 32) ValueCell!7538)) (size!23536 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48125)

(declare-fun mapDefault!25532 () ValueCell!7538)

(assert (=> b!846158 (= condMapEmpty!25532 (= (arr!23094 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7538)) mapDefault!25532)))))

(declare-fun b!846159 () Bool)

(declare-fun res!574928 () Bool)

(declare-fun e!472250 () Bool)

(assert (=> b!846159 (=> (not res!574928) (not e!472250))))

(declare-datatypes ((array!48127 0))(
  ( (array!48128 (arr!23095 (Array (_ BitVec 32) (_ BitVec 64))) (size!23537 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48127)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48127 (_ BitVec 32)) Bool)

(assert (=> b!846159 (= res!574928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846160 () Bool)

(declare-fun tp_is_empty!15955 () Bool)

(assert (=> b!846160 (= e!472252 tp_is_empty!15955)))

(declare-fun mapIsEmpty!25532 () Bool)

(assert (=> mapIsEmpty!25532 mapRes!25532))

(declare-fun mapNonEmpty!25532 () Bool)

(declare-fun tp!48962 () Bool)

(declare-fun e!472254 () Bool)

(assert (=> mapNonEmpty!25532 (= mapRes!25532 (and tp!48962 e!472254))))

(declare-fun mapRest!25532 () (Array (_ BitVec 32) ValueCell!7538))

(declare-fun mapValue!25532 () ValueCell!7538)

(declare-fun mapKey!25532 () (_ BitVec 32))

(assert (=> mapNonEmpty!25532 (= (arr!23094 _values!688) (store mapRest!25532 mapKey!25532 mapValue!25532))))

(declare-fun b!846161 () Bool)

(declare-fun res!574932 () Bool)

(assert (=> b!846161 (=> (not res!574932) (not e!472250))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!846161 (= res!574932 (and (= (size!23536 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23537 _keys!868) (size!23536 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846162 () Bool)

(declare-fun res!574935 () Bool)

(assert (=> b!846162 (=> (not res!574935) (not e!472250))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846162 (= res!574935 (validKeyInArray!0 k0!854))))

(declare-fun b!846163 () Bool)

(declare-fun res!574929 () Bool)

(assert (=> b!846163 (=> (not res!574929) (not e!472250))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846163 (= res!574929 (and (= (select (arr!23095 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846164 () Bool)

(declare-fun res!574931 () Bool)

(assert (=> b!846164 (=> (not res!574931) (not e!472250))))

(assert (=> b!846164 (= res!574931 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23537 _keys!868))))))

(declare-fun b!846165 () Bool)

(assert (=> b!846165 (= e!472250 false)))

(declare-fun v!557 () V!26321)

(declare-fun minValue!654 () V!26321)

(declare-fun zeroValue!654 () V!26321)

(declare-datatypes ((tuple2!10510 0))(
  ( (tuple2!10511 (_1!5266 (_ BitVec 64)) (_2!5266 V!26321)) )
))
(declare-datatypes ((List!16368 0))(
  ( (Nil!16365) (Cons!16364 (h!17495 tuple2!10510) (t!22730 List!16368)) )
))
(declare-datatypes ((ListLongMap!9269 0))(
  ( (ListLongMap!9270 (toList!4650 List!16368)) )
))
(declare-fun lt!381292 () ListLongMap!9269)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2664 (array!48127 array!48125 (_ BitVec 32) (_ BitVec 32) V!26321 V!26321 (_ BitVec 32) Int) ListLongMap!9269)

(assert (=> b!846165 (= lt!381292 (getCurrentListMapNoExtraKeys!2664 _keys!868 (array!48126 (store (arr!23094 _values!688) i!612 (ValueCellFull!7538 v!557)) (size!23536 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381293 () ListLongMap!9269)

(assert (=> b!846165 (= lt!381293 (getCurrentListMapNoExtraKeys!2664 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846166 () Bool)

(declare-fun res!574934 () Bool)

(assert (=> b!846166 (=> (not res!574934) (not e!472250))))

(declare-datatypes ((List!16369 0))(
  ( (Nil!16366) (Cons!16365 (h!17496 (_ BitVec 64)) (t!22731 List!16369)) )
))
(declare-fun arrayNoDuplicates!0 (array!48127 (_ BitVec 32) List!16369) Bool)

(assert (=> b!846166 (= res!574934 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16366))))

(declare-fun res!574930 () Bool)

(assert (=> start!72886 (=> (not res!574930) (not e!472250))))

(assert (=> start!72886 (= res!574930 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23537 _keys!868))))))

(assert (=> start!72886 e!472250))

(assert (=> start!72886 tp_is_empty!15955))

(assert (=> start!72886 true))

(assert (=> start!72886 tp!48961))

(declare-fun array_inv!18422 (array!48127) Bool)

(assert (=> start!72886 (array_inv!18422 _keys!868)))

(declare-fun array_inv!18423 (array!48125) Bool)

(assert (=> start!72886 (and (array_inv!18423 _values!688) e!472253)))

(declare-fun b!846167 () Bool)

(assert (=> b!846167 (= e!472254 tp_is_empty!15955)))

(declare-fun b!846168 () Bool)

(declare-fun res!574933 () Bool)

(assert (=> b!846168 (=> (not res!574933) (not e!472250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846168 (= res!574933 (validMask!0 mask!1196))))

(assert (= (and start!72886 res!574930) b!846168))

(assert (= (and b!846168 res!574933) b!846161))

(assert (= (and b!846161 res!574932) b!846159))

(assert (= (and b!846159 res!574928) b!846166))

(assert (= (and b!846166 res!574934) b!846164))

(assert (= (and b!846164 res!574931) b!846162))

(assert (= (and b!846162 res!574935) b!846163))

(assert (= (and b!846163 res!574929) b!846165))

(assert (= (and b!846158 condMapEmpty!25532) mapIsEmpty!25532))

(assert (= (and b!846158 (not condMapEmpty!25532)) mapNonEmpty!25532))

(get-info :version)

(assert (= (and mapNonEmpty!25532 ((_ is ValueCellFull!7538) mapValue!25532)) b!846167))

(assert (= (and b!846158 ((_ is ValueCellFull!7538) mapDefault!25532)) b!846160))

(assert (= start!72886 b!846158))

(declare-fun m!787055 () Bool)

(assert (=> b!846168 m!787055))

(declare-fun m!787057 () Bool)

(assert (=> b!846162 m!787057))

(declare-fun m!787059 () Bool)

(assert (=> start!72886 m!787059))

(declare-fun m!787061 () Bool)

(assert (=> start!72886 m!787061))

(declare-fun m!787063 () Bool)

(assert (=> mapNonEmpty!25532 m!787063))

(declare-fun m!787065 () Bool)

(assert (=> b!846166 m!787065))

(declare-fun m!787067 () Bool)

(assert (=> b!846165 m!787067))

(declare-fun m!787069 () Bool)

(assert (=> b!846165 m!787069))

(declare-fun m!787071 () Bool)

(assert (=> b!846165 m!787071))

(declare-fun m!787073 () Bool)

(assert (=> b!846159 m!787073))

(declare-fun m!787075 () Bool)

(assert (=> b!846163 m!787075))

(check-sat (not b_next!13819) (not b!846168) (not mapNonEmpty!25532) (not b!846166) (not b!846165) tp_is_empty!15955 (not b!846159) (not start!72886) b_and!22879 (not b!846162))
(check-sat b_and!22879 (not b_next!13819))
