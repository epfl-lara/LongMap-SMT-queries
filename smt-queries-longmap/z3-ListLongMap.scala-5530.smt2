; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72946 () Bool)

(assert start!72946)

(declare-fun b_free!13879 () Bool)

(declare-fun b_next!13879 () Bool)

(assert (=> start!72946 (= b_free!13879 (not b_next!13879))))

(declare-fun tp!49141 () Bool)

(declare-fun b_and!22939 () Bool)

(assert (=> start!72946 (= tp!49141 b_and!22939)))

(declare-datatypes ((V!26401 0))(
  ( (V!26402 (val!8055 Int)) )
))
(declare-datatypes ((tuple2!10550 0))(
  ( (tuple2!10551 (_1!5286 (_ BitVec 64)) (_2!5286 V!26401)) )
))
(declare-datatypes ((List!16407 0))(
  ( (Nil!16404) (Cons!16403 (h!17534 tuple2!10550) (t!22769 List!16407)) )
))
(declare-datatypes ((ListLongMap!9309 0))(
  ( (ListLongMap!9310 (toList!4670 List!16407)) )
))
(declare-fun call!37466 () ListLongMap!9309)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37463 () Bool)

(declare-datatypes ((array!48239 0))(
  ( (array!48240 (arr!23151 (Array (_ BitVec 32) (_ BitVec 64))) (size!23593 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48239)

(declare-datatypes ((ValueCell!7568 0))(
  ( (ValueCellFull!7568 (v!10474 V!26401)) (EmptyCell!7568) )
))
(declare-datatypes ((array!48241 0))(
  ( (array!48242 (arr!23152 (Array (_ BitVec 32) ValueCell!7568)) (size!23594 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48241)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26401)

(declare-fun zeroValue!654 () V!26401)

(declare-fun getCurrentListMapNoExtraKeys!2683 (array!48239 array!48241 (_ BitVec 32) (_ BitVec 32) V!26401 V!26401 (_ BitVec 32) Int) ListLongMap!9309)

(assert (=> bm!37463 (= call!37466 (getCurrentListMapNoExtraKeys!2683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25622 () Bool)

(declare-fun mapRes!25622 () Bool)

(declare-fun tp!49142 () Bool)

(declare-fun e!472727 () Bool)

(assert (=> mapNonEmpty!25622 (= mapRes!25622 (and tp!49142 e!472727))))

(declare-fun mapRest!25622 () (Array (_ BitVec 32) ValueCell!7568))

(declare-fun mapValue!25622 () ValueCell!7568)

(declare-fun mapKey!25622 () (_ BitVec 32))

(assert (=> mapNonEmpty!25622 (= (arr!23152 _values!688) (store mapRest!25622 mapKey!25622 mapValue!25622))))

(declare-fun b!847181 () Bool)

(declare-fun res!575665 () Bool)

(declare-fun e!472728 () Bool)

(assert (=> b!847181 (=> (not res!575665) (not e!472728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847181 (= res!575665 (validMask!0 mask!1196))))

(declare-fun b!847182 () Bool)

(declare-fun e!472724 () Bool)

(declare-fun tp_is_empty!16015 () Bool)

(assert (=> b!847182 (= e!472724 tp_is_empty!16015)))

(declare-fun b!847183 () Bool)

(declare-fun res!575666 () Bool)

(assert (=> b!847183 (=> (not res!575666) (not e!472728))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847183 (= res!575666 (validKeyInArray!0 k0!854))))

(declare-fun b!847184 () Bool)

(declare-fun e!472726 () Bool)

(assert (=> b!847184 (= e!472726 (and e!472724 mapRes!25622))))

(declare-fun condMapEmpty!25622 () Bool)

(declare-fun mapDefault!25622 () ValueCell!7568)

(assert (=> b!847184 (= condMapEmpty!25622 (= (arr!23152 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7568)) mapDefault!25622)))))

(declare-fun b!847185 () Bool)

(declare-fun res!575662 () Bool)

(assert (=> b!847185 (=> (not res!575662) (not e!472728))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847185 (= res!575662 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23593 _keys!868))))))

(declare-fun b!847186 () Bool)

(declare-fun e!472723 () Bool)

(assert (=> b!847186 (= e!472728 e!472723)))

(declare-fun res!575659 () Bool)

(assert (=> b!847186 (=> (not res!575659) (not e!472723))))

(assert (=> b!847186 (= res!575659 (= from!1053 i!612))))

(declare-fun lt!381497 () ListLongMap!9309)

(declare-fun lt!381494 () array!48241)

(assert (=> b!847186 (= lt!381497 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!381494 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26401)

(assert (=> b!847186 (= lt!381494 (array!48242 (store (arr!23152 _values!688) i!612 (ValueCellFull!7568 v!557)) (size!23594 _values!688)))))

(declare-fun lt!381495 () ListLongMap!9309)

(assert (=> b!847186 (= lt!381495 (getCurrentListMapNoExtraKeys!2683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847187 () Bool)

(declare-fun res!575660 () Bool)

(assert (=> b!847187 (=> (not res!575660) (not e!472728))))

(declare-datatypes ((List!16408 0))(
  ( (Nil!16405) (Cons!16404 (h!17535 (_ BitVec 64)) (t!22770 List!16408)) )
))
(declare-fun arrayNoDuplicates!0 (array!48239 (_ BitVec 32) List!16408) Bool)

(assert (=> b!847187 (= res!575660 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16405))))

(declare-fun b!847188 () Bool)

(declare-fun e!472725 () Bool)

(declare-fun call!37467 () ListLongMap!9309)

(assert (=> b!847188 (= e!472725 (= call!37467 call!37466))))

(declare-fun b!847189 () Bool)

(assert (=> b!847189 (= e!472727 tp_is_empty!16015)))

(declare-fun b!847190 () Bool)

(declare-fun res!575661 () Bool)

(assert (=> b!847190 (=> (not res!575661) (not e!472728))))

(assert (=> b!847190 (= res!575661 (and (= (size!23594 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23593 _keys!868) (size!23594 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25622 () Bool)

(assert (=> mapIsEmpty!25622 mapRes!25622))

(declare-fun bm!37464 () Bool)

(assert (=> bm!37464 (= call!37467 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!381494 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!575663 () Bool)

(assert (=> start!72946 (=> (not res!575663) (not e!472728))))

(assert (=> start!72946 (= res!575663 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23593 _keys!868))))))

(assert (=> start!72946 e!472728))

(assert (=> start!72946 tp_is_empty!16015))

(assert (=> start!72946 true))

(assert (=> start!72946 tp!49141))

(declare-fun array_inv!18462 (array!48239) Bool)

(assert (=> start!72946 (array_inv!18462 _keys!868)))

(declare-fun array_inv!18463 (array!48241) Bool)

(assert (=> start!72946 (and (array_inv!18463 _values!688) e!472726)))

(declare-fun b!847191 () Bool)

(declare-fun res!575664 () Bool)

(assert (=> b!847191 (=> (not res!575664) (not e!472728))))

(assert (=> b!847191 (= res!575664 (and (= (select (arr!23151 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847192 () Bool)

(declare-fun +!2102 (ListLongMap!9309 tuple2!10550) ListLongMap!9309)

(assert (=> b!847192 (= e!472725 (= call!37467 (+!2102 call!37466 (tuple2!10551 k0!854 v!557))))))

(declare-fun b!847193 () Bool)

(assert (=> b!847193 (= e!472723 (not true))))

(assert (=> b!847193 e!472725))

(declare-fun c!91424 () Bool)

(assert (=> b!847193 (= c!91424 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28883 0))(
  ( (Unit!28884) )
))
(declare-fun lt!381496 () Unit!28883)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!316 (array!48239 array!48241 (_ BitVec 32) (_ BitVec 32) V!26401 V!26401 (_ BitVec 32) (_ BitVec 64) V!26401 (_ BitVec 32) Int) Unit!28883)

(assert (=> b!847193 (= lt!381496 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!316 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847194 () Bool)

(declare-fun res!575667 () Bool)

(assert (=> b!847194 (=> (not res!575667) (not e!472728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48239 (_ BitVec 32)) Bool)

(assert (=> b!847194 (= res!575667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72946 res!575663) b!847181))

(assert (= (and b!847181 res!575665) b!847190))

(assert (= (and b!847190 res!575661) b!847194))

(assert (= (and b!847194 res!575667) b!847187))

(assert (= (and b!847187 res!575660) b!847185))

(assert (= (and b!847185 res!575662) b!847183))

(assert (= (and b!847183 res!575666) b!847191))

(assert (= (and b!847191 res!575664) b!847186))

(assert (= (and b!847186 res!575659) b!847193))

(assert (= (and b!847193 c!91424) b!847192))

(assert (= (and b!847193 (not c!91424)) b!847188))

(assert (= (or b!847192 b!847188) bm!37464))

(assert (= (or b!847192 b!847188) bm!37463))

(assert (= (and b!847184 condMapEmpty!25622) mapIsEmpty!25622))

(assert (= (and b!847184 (not condMapEmpty!25622)) mapNonEmpty!25622))

(get-info :version)

(assert (= (and mapNonEmpty!25622 ((_ is ValueCellFull!7568) mapValue!25622)) b!847189))

(assert (= (and b!847184 ((_ is ValueCellFull!7568) mapDefault!25622)) b!847182))

(assert (= start!72946 b!847184))

(declare-fun m!787739 () Bool)

(assert (=> mapNonEmpty!25622 m!787739))

(declare-fun m!787741 () Bool)

(assert (=> b!847181 m!787741))

(declare-fun m!787743 () Bool)

(assert (=> b!847191 m!787743))

(declare-fun m!787745 () Bool)

(assert (=> b!847186 m!787745))

(declare-fun m!787747 () Bool)

(assert (=> b!847186 m!787747))

(declare-fun m!787749 () Bool)

(assert (=> b!847186 m!787749))

(declare-fun m!787751 () Bool)

(assert (=> bm!37463 m!787751))

(declare-fun m!787753 () Bool)

(assert (=> b!847183 m!787753))

(declare-fun m!787755 () Bool)

(assert (=> b!847194 m!787755))

(declare-fun m!787757 () Bool)

(assert (=> b!847192 m!787757))

(declare-fun m!787759 () Bool)

(assert (=> bm!37464 m!787759))

(declare-fun m!787761 () Bool)

(assert (=> start!72946 m!787761))

(declare-fun m!787763 () Bool)

(assert (=> start!72946 m!787763))

(declare-fun m!787765 () Bool)

(assert (=> b!847187 m!787765))

(declare-fun m!787767 () Bool)

(assert (=> b!847193 m!787767))

(check-sat (not b!847181) (not b!847192) (not b!847193) (not b_next!13879) (not bm!37463) (not b!847186) (not bm!37464) b_and!22939 tp_is_empty!16015 (not b!847194) (not b!847183) (not start!72946) (not b!847187) (not mapNonEmpty!25622))
(check-sat b_and!22939 (not b_next!13879))
