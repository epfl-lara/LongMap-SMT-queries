; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72718 () Bool)

(assert start!72718)

(declare-fun b_free!13735 () Bool)

(declare-fun b_next!13735 () Bool)

(assert (=> start!72718 (= b_free!13735 (not b_next!13735))))

(declare-fun tp!48305 () Bool)

(declare-fun b_and!22831 () Bool)

(assert (=> start!72718 (= tp!48305 b_and!22831)))

(declare-fun b!843047 () Bool)

(declare-fun res!572757 () Bool)

(declare-fun e!470310 () Bool)

(assert (=> b!843047 (=> (not res!572757) (not e!470310))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!843047 (= res!572757 (validKeyInArray!0 k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!25849 0))(
  ( (V!25850 (val!7848 Int)) )
))
(declare-datatypes ((tuple2!10350 0))(
  ( (tuple2!10351 (_1!5186 (_ BitVec 64)) (_2!5186 V!25849)) )
))
(declare-datatypes ((List!16120 0))(
  ( (Nil!16117) (Cons!16116 (h!17253 tuple2!10350) (t!22483 List!16120)) )
))
(declare-datatypes ((ListLongMap!9121 0))(
  ( (ListLongMap!9122 (toList!4576 List!16120)) )
))
(declare-fun call!37483 () ListLongMap!9121)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37480 () Bool)

(declare-datatypes ((array!47495 0))(
  ( (array!47496 (arr!22774 (Array (_ BitVec 32) (_ BitVec 64))) (size!23215 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47495)

(declare-datatypes ((ValueCell!7361 0))(
  ( (ValueCellFull!7361 (v!10273 V!25849)) (EmptyCell!7361) )
))
(declare-datatypes ((array!47497 0))(
  ( (array!47498 (arr!22775 (Array (_ BitVec 32) ValueCell!7361)) (size!23216 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47497)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25849)

(declare-fun zeroValue!654 () V!25849)

(declare-fun getCurrentListMapNoExtraKeys!2635 (array!47495 array!47497 (_ BitVec 32) (_ BitVec 32) V!25849 V!25849 (_ BitVec 32) Int) ListLongMap!9121)

(assert (=> bm!37480 (= call!37483 (getCurrentListMapNoExtraKeys!2635 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!843048 () Bool)

(declare-fun e!470309 () Bool)

(declare-fun e!470314 () Bool)

(declare-fun mapRes!25001 () Bool)

(assert (=> b!843048 (= e!470309 (and e!470314 mapRes!25001))))

(declare-fun condMapEmpty!25001 () Bool)

(declare-fun mapDefault!25001 () ValueCell!7361)

(assert (=> b!843048 (= condMapEmpty!25001 (= (arr!22775 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7361)) mapDefault!25001)))))

(declare-fun b!843049 () Bool)

(assert (=> b!843049 (= e!470310 (not true))))

(declare-fun e!470311 () Bool)

(assert (=> b!843049 e!470311))

(declare-fun c!91744 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!843049 (= c!91744 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25849)

(declare-datatypes ((Unit!28938 0))(
  ( (Unit!28939) )
))
(declare-fun lt!381329 () Unit!28938)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!305 (array!47495 array!47497 (_ BitVec 32) (_ BitVec 32) V!25849 V!25849 (_ BitVec 32) (_ BitVec 64) V!25849 (_ BitVec 32) Int) Unit!28938)

(assert (=> b!843049 (= lt!381329 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!572761 () Bool)

(assert (=> start!72718 (=> (not res!572761) (not e!470310))))

(assert (=> start!72718 (= res!572761 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23215 _keys!868))))))

(assert (=> start!72718 e!470310))

(declare-fun tp_is_empty!15601 () Bool)

(assert (=> start!72718 tp_is_empty!15601))

(assert (=> start!72718 true))

(assert (=> start!72718 tp!48305))

(declare-fun array_inv!18168 (array!47495) Bool)

(assert (=> start!72718 (array_inv!18168 _keys!868)))

(declare-fun array_inv!18169 (array!47497) Bool)

(assert (=> start!72718 (and (array_inv!18169 _values!688) e!470309)))

(declare-fun b!843050 () Bool)

(declare-fun res!572759 () Bool)

(assert (=> b!843050 (=> (not res!572759) (not e!470310))))

(assert (=> b!843050 (= res!572759 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23215 _keys!868))))))

(declare-fun b!843051 () Bool)

(declare-fun res!572754 () Bool)

(assert (=> b!843051 (=> (not res!572754) (not e!470310))))

(declare-datatypes ((List!16121 0))(
  ( (Nil!16118) (Cons!16117 (h!17254 (_ BitVec 64)) (t!22484 List!16121)) )
))
(declare-fun arrayNoDuplicates!0 (array!47495 (_ BitVec 32) List!16121) Bool)

(assert (=> b!843051 (= res!572754 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16118))))

(declare-fun call!37484 () ListLongMap!9121)

(declare-fun b!843052 () Bool)

(declare-fun +!2079 (ListLongMap!9121 tuple2!10350) ListLongMap!9121)

(assert (=> b!843052 (= e!470311 (= call!37484 (+!2079 call!37483 (tuple2!10351 k0!854 v!557))))))

(declare-fun b!843053 () Bool)

(assert (=> b!843053 (= e!470314 tp_is_empty!15601)))

(declare-fun mapNonEmpty!25001 () Bool)

(declare-fun tp!48304 () Bool)

(declare-fun e!470312 () Bool)

(assert (=> mapNonEmpty!25001 (= mapRes!25001 (and tp!48304 e!470312))))

(declare-fun mapValue!25001 () ValueCell!7361)

(declare-fun mapRest!25001 () (Array (_ BitVec 32) ValueCell!7361))

(declare-fun mapKey!25001 () (_ BitVec 32))

(assert (=> mapNonEmpty!25001 (= (arr!22775 _values!688) (store mapRest!25001 mapKey!25001 mapValue!25001))))

(declare-fun b!843054 () Bool)

(assert (=> b!843054 (= e!470312 tp_is_empty!15601)))

(declare-fun bm!37481 () Bool)

(assert (=> bm!37481 (= call!37484 (getCurrentListMapNoExtraKeys!2635 _keys!868 (array!47498 (store (arr!22775 _values!688) i!612 (ValueCellFull!7361 v!557)) (size!23216 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25001 () Bool)

(assert (=> mapIsEmpty!25001 mapRes!25001))

(declare-fun b!843055 () Bool)

(declare-fun res!572760 () Bool)

(assert (=> b!843055 (=> (not res!572760) (not e!470310))))

(assert (=> b!843055 (= res!572760 (and (= (select (arr!22774 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23215 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!843056 () Bool)

(declare-fun res!572756 () Bool)

(assert (=> b!843056 (=> (not res!572756) (not e!470310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47495 (_ BitVec 32)) Bool)

(assert (=> b!843056 (= res!572756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843057 () Bool)

(declare-fun res!572755 () Bool)

(assert (=> b!843057 (=> (not res!572755) (not e!470310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843057 (= res!572755 (validMask!0 mask!1196))))

(declare-fun b!843058 () Bool)

(declare-fun res!572758 () Bool)

(assert (=> b!843058 (=> (not res!572758) (not e!470310))))

(assert (=> b!843058 (= res!572758 (and (= (size!23216 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23215 _keys!868) (size!23216 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843059 () Bool)

(assert (=> b!843059 (= e!470311 (= call!37484 call!37483))))

(assert (= (and start!72718 res!572761) b!843057))

(assert (= (and b!843057 res!572755) b!843058))

(assert (= (and b!843058 res!572758) b!843056))

(assert (= (and b!843056 res!572756) b!843051))

(assert (= (and b!843051 res!572754) b!843050))

(assert (= (and b!843050 res!572759) b!843047))

(assert (= (and b!843047 res!572757) b!843055))

(assert (= (and b!843055 res!572760) b!843049))

(assert (= (and b!843049 c!91744) b!843052))

(assert (= (and b!843049 (not c!91744)) b!843059))

(assert (= (or b!843052 b!843059) bm!37481))

(assert (= (or b!843052 b!843059) bm!37480))

(assert (= (and b!843048 condMapEmpty!25001) mapIsEmpty!25001))

(assert (= (and b!843048 (not condMapEmpty!25001)) mapNonEmpty!25001))

(get-info :version)

(assert (= (and mapNonEmpty!25001 ((_ is ValueCellFull!7361) mapValue!25001)) b!843054))

(assert (= (and b!843048 ((_ is ValueCellFull!7361) mapDefault!25001)) b!843053))

(assert (= start!72718 b!843048))

(declare-fun m!786641 () Bool)

(assert (=> b!843049 m!786641))

(declare-fun m!786643 () Bool)

(assert (=> b!843047 m!786643))

(declare-fun m!786645 () Bool)

(assert (=> mapNonEmpty!25001 m!786645))

(declare-fun m!786647 () Bool)

(assert (=> b!843052 m!786647))

(declare-fun m!786649 () Bool)

(assert (=> bm!37480 m!786649))

(declare-fun m!786651 () Bool)

(assert (=> b!843051 m!786651))

(declare-fun m!786653 () Bool)

(assert (=> start!72718 m!786653))

(declare-fun m!786655 () Bool)

(assert (=> start!72718 m!786655))

(declare-fun m!786657 () Bool)

(assert (=> b!843056 m!786657))

(declare-fun m!786659 () Bool)

(assert (=> b!843055 m!786659))

(declare-fun m!786661 () Bool)

(assert (=> bm!37481 m!786661))

(declare-fun m!786663 () Bool)

(assert (=> bm!37481 m!786663))

(declare-fun m!786665 () Bool)

(assert (=> b!843057 m!786665))

(check-sat (not b_next!13735) (not b!843057) tp_is_empty!15601 (not mapNonEmpty!25001) b_and!22831 (not bm!37481) (not start!72718) (not b!843056) (not bm!37480) (not b!843052) (not b!843049) (not b!843051) (not b!843047))
(check-sat b_and!22831 (not b_next!13735))
