; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72706 () Bool)

(assert start!72706)

(declare-fun b_free!13723 () Bool)

(declare-fun b_next!13723 () Bool)

(assert (=> start!72706 (= b_free!13723 (not b_next!13723))))

(declare-fun tp!48269 () Bool)

(declare-fun b_and!22819 () Bool)

(assert (=> start!72706 (= tp!48269 b_and!22819)))

(declare-fun mapIsEmpty!24983 () Bool)

(declare-fun mapRes!24983 () Bool)

(assert (=> mapIsEmpty!24983 mapRes!24983))

(declare-fun b!842813 () Bool)

(declare-fun e!470204 () Bool)

(declare-fun tp_is_empty!15589 () Bool)

(assert (=> b!842813 (= e!470204 tp_is_empty!15589)))

(declare-fun b!842814 () Bool)

(declare-fun res!572613 () Bool)

(declare-fun e!470205 () Bool)

(assert (=> b!842814 (=> (not res!572613) (not e!470205))))

(declare-datatypes ((array!47471 0))(
  ( (array!47472 (arr!22762 (Array (_ BitVec 32) (_ BitVec 64))) (size!23203 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47471)

(declare-datatypes ((List!16111 0))(
  ( (Nil!16108) (Cons!16107 (h!17244 (_ BitVec 64)) (t!22474 List!16111)) )
))
(declare-fun arrayNoDuplicates!0 (array!47471 (_ BitVec 32) List!16111) Bool)

(assert (=> b!842814 (= res!572613 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16108))))

(declare-fun b!842815 () Bool)

(declare-fun e!470206 () Bool)

(assert (=> b!842815 (= e!470206 tp_is_empty!15589)))

(declare-datatypes ((V!25833 0))(
  ( (V!25834 (val!7842 Int)) )
))
(declare-fun v!557 () V!25833)

(declare-datatypes ((tuple2!10340 0))(
  ( (tuple2!10341 (_1!5181 (_ BitVec 64)) (_2!5181 V!25833)) )
))
(declare-datatypes ((List!16112 0))(
  ( (Nil!16109) (Cons!16108 (h!17245 tuple2!10340) (t!22475 List!16112)) )
))
(declare-datatypes ((ListLongMap!9111 0))(
  ( (ListLongMap!9112 (toList!4571 List!16112)) )
))
(declare-fun call!37448 () ListLongMap!9111)

(declare-fun b!842816 () Bool)

(declare-fun e!470202 () Bool)

(declare-fun call!37447 () ListLongMap!9111)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2075 (ListLongMap!9111 tuple2!10340) ListLongMap!9111)

(assert (=> b!842816 (= e!470202 (= call!37447 (+!2075 call!37448 (tuple2!10341 k0!854 v!557))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25833)

(declare-fun zeroValue!654 () V!25833)

(declare-fun bm!37444 () Bool)

(declare-datatypes ((ValueCell!7355 0))(
  ( (ValueCellFull!7355 (v!10267 V!25833)) (EmptyCell!7355) )
))
(declare-datatypes ((array!47473 0))(
  ( (array!47474 (arr!22763 (Array (_ BitVec 32) ValueCell!7355)) (size!23204 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47473)

(declare-fun getCurrentListMapNoExtraKeys!2630 (array!47471 array!47473 (_ BitVec 32) (_ BitVec 32) V!25833 V!25833 (_ BitVec 32) Int) ListLongMap!9111)

(assert (=> bm!37444 (= call!37448 (getCurrentListMapNoExtraKeys!2630 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842818 () Bool)

(declare-fun res!572614 () Bool)

(assert (=> b!842818 (=> (not res!572614) (not e!470205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842818 (= res!572614 (validMask!0 mask!1196))))

(declare-fun b!842819 () Bool)

(declare-fun res!572612 () Bool)

(assert (=> b!842819 (=> (not res!572612) (not e!470205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842819 (= res!572612 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!24983 () Bool)

(declare-fun tp!48268 () Bool)

(assert (=> mapNonEmpty!24983 (= mapRes!24983 (and tp!48268 e!470206))))

(declare-fun mapRest!24983 () (Array (_ BitVec 32) ValueCell!7355))

(declare-fun mapValue!24983 () ValueCell!7355)

(declare-fun mapKey!24983 () (_ BitVec 32))

(assert (=> mapNonEmpty!24983 (= (arr!22763 _values!688) (store mapRest!24983 mapKey!24983 mapValue!24983))))

(declare-fun b!842820 () Bool)

(declare-fun res!572617 () Bool)

(assert (=> b!842820 (=> (not res!572617) (not e!470205))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842820 (= res!572617 (and (= (select (arr!22762 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23203 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842821 () Bool)

(declare-fun res!572611 () Bool)

(assert (=> b!842821 (=> (not res!572611) (not e!470205))))

(assert (=> b!842821 (= res!572611 (and (= (size!23204 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23203 _keys!868) (size!23204 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842822 () Bool)

(declare-fun e!470201 () Bool)

(assert (=> b!842822 (= e!470201 (and e!470204 mapRes!24983))))

(declare-fun condMapEmpty!24983 () Bool)

(declare-fun mapDefault!24983 () ValueCell!7355)

(assert (=> b!842822 (= condMapEmpty!24983 (= (arr!22763 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7355)) mapDefault!24983)))))

(declare-fun bm!37445 () Bool)

(assert (=> bm!37445 (= call!37447 (getCurrentListMapNoExtraKeys!2630 _keys!868 (array!47474 (store (arr!22763 _values!688) i!612 (ValueCellFull!7355 v!557)) (size!23204 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842823 () Bool)

(assert (=> b!842823 (= e!470202 (= call!37447 call!37448))))

(declare-fun b!842824 () Bool)

(declare-fun res!572610 () Bool)

(assert (=> b!842824 (=> (not res!572610) (not e!470205))))

(assert (=> b!842824 (= res!572610 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23203 _keys!868))))))

(declare-fun b!842825 () Bool)

(declare-fun res!572615 () Bool)

(assert (=> b!842825 (=> (not res!572615) (not e!470205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47471 (_ BitVec 32)) Bool)

(assert (=> b!842825 (= res!572615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572616 () Bool)

(assert (=> start!72706 (=> (not res!572616) (not e!470205))))

(assert (=> start!72706 (= res!572616 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23203 _keys!868))))))

(assert (=> start!72706 e!470205))

(assert (=> start!72706 tp_is_empty!15589))

(assert (=> start!72706 true))

(assert (=> start!72706 tp!48269))

(declare-fun array_inv!18158 (array!47471) Bool)

(assert (=> start!72706 (array_inv!18158 _keys!868)))

(declare-fun array_inv!18159 (array!47473) Bool)

(assert (=> start!72706 (and (array_inv!18159 _values!688) e!470201)))

(declare-fun b!842817 () Bool)

(assert (=> b!842817 (= e!470205 (not true))))

(assert (=> b!842817 e!470202))

(declare-fun c!91726 () Bool)

(assert (=> b!842817 (= c!91726 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28932 0))(
  ( (Unit!28933) )
))
(declare-fun lt!381311 () Unit!28932)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!302 (array!47471 array!47473 (_ BitVec 32) (_ BitVec 32) V!25833 V!25833 (_ BitVec 32) (_ BitVec 64) V!25833 (_ BitVec 32) Int) Unit!28932)

(assert (=> b!842817 (= lt!381311 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!302 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72706 res!572616) b!842818))

(assert (= (and b!842818 res!572614) b!842821))

(assert (= (and b!842821 res!572611) b!842825))

(assert (= (and b!842825 res!572615) b!842814))

(assert (= (and b!842814 res!572613) b!842824))

(assert (= (and b!842824 res!572610) b!842819))

(assert (= (and b!842819 res!572612) b!842820))

(assert (= (and b!842820 res!572617) b!842817))

(assert (= (and b!842817 c!91726) b!842816))

(assert (= (and b!842817 (not c!91726)) b!842823))

(assert (= (or b!842816 b!842823) bm!37445))

(assert (= (or b!842816 b!842823) bm!37444))

(assert (= (and b!842822 condMapEmpty!24983) mapIsEmpty!24983))

(assert (= (and b!842822 (not condMapEmpty!24983)) mapNonEmpty!24983))

(get-info :version)

(assert (= (and mapNonEmpty!24983 ((_ is ValueCellFull!7355) mapValue!24983)) b!842815))

(assert (= (and b!842822 ((_ is ValueCellFull!7355) mapDefault!24983)) b!842813))

(assert (= start!72706 b!842822))

(declare-fun m!786485 () Bool)

(assert (=> b!842820 m!786485))

(declare-fun m!786487 () Bool)

(assert (=> b!842817 m!786487))

(declare-fun m!786489 () Bool)

(assert (=> b!842816 m!786489))

(declare-fun m!786491 () Bool)

(assert (=> mapNonEmpty!24983 m!786491))

(declare-fun m!786493 () Bool)

(assert (=> b!842819 m!786493))

(declare-fun m!786495 () Bool)

(assert (=> bm!37445 m!786495))

(declare-fun m!786497 () Bool)

(assert (=> bm!37445 m!786497))

(declare-fun m!786499 () Bool)

(assert (=> b!842814 m!786499))

(declare-fun m!786501 () Bool)

(assert (=> bm!37444 m!786501))

(declare-fun m!786503 () Bool)

(assert (=> b!842825 m!786503))

(declare-fun m!786505 () Bool)

(assert (=> start!72706 m!786505))

(declare-fun m!786507 () Bool)

(assert (=> start!72706 m!786507))

(declare-fun m!786509 () Bool)

(assert (=> b!842818 m!786509))

(check-sat (not b!842816) (not b_next!13723) (not b!842825) b_and!22819 (not b!842818) (not b!842817) (not b!842814) tp_is_empty!15589 (not start!72706) (not b!842819) (not bm!37445) (not bm!37444) (not mapNonEmpty!24983))
(check-sat b_and!22819 (not b_next!13723))
