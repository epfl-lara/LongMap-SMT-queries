; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72420 () Bool)

(assert start!72420)

(declare-fun b_free!13605 () Bool)

(declare-fun b_next!13605 () Bool)

(assert (=> start!72420 (= b_free!13605 (not b_next!13605))))

(declare-fun tp!47914 () Bool)

(declare-fun b_and!22691 () Bool)

(assert (=> start!72420 (= tp!47914 b_and!22691)))

(declare-fun b!839609 () Bool)

(declare-fun e!468558 () Bool)

(declare-fun tp_is_empty!15471 () Bool)

(assert (=> b!839609 (= e!468558 tp_is_empty!15471)))

(declare-fun b!839610 () Bool)

(declare-fun res!570854 () Bool)

(declare-fun e!468559 () Bool)

(assert (=> b!839610 (=> (not res!570854) (not e!468559))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47224 0))(
  ( (array!47225 (arr!22643 (Array (_ BitVec 32) (_ BitVec 64))) (size!23083 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47224)

(assert (=> b!839610 (= res!570854 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23083 _keys!868))))))

(declare-fun b!839611 () Bool)

(declare-fun e!468562 () Bool)

(declare-datatypes ((V!25675 0))(
  ( (V!25676 (val!7783 Int)) )
))
(declare-datatypes ((tuple2!10306 0))(
  ( (tuple2!10307 (_1!5164 (_ BitVec 64)) (_2!5164 V!25675)) )
))
(declare-datatypes ((List!16104 0))(
  ( (Nil!16101) (Cons!16100 (h!17231 tuple2!10306) (t!22475 List!16104)) )
))
(declare-datatypes ((ListLongMap!9075 0))(
  ( (ListLongMap!9076 (toList!4553 List!16104)) )
))
(declare-fun call!37049 () ListLongMap!9075)

(declare-fun call!37048 () ListLongMap!9075)

(assert (=> b!839611 (= e!468562 (= call!37049 call!37048))))

(declare-fun v!557 () V!25675)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7296 0))(
  ( (ValueCellFull!7296 (v!10208 V!25675)) (EmptyCell!7296) )
))
(declare-datatypes ((array!47226 0))(
  ( (array!47227 (arr!22644 (Array (_ BitVec 32) ValueCell!7296)) (size!23084 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47226)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25675)

(declare-fun zeroValue!654 () V!25675)

(declare-fun bm!37045 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2543 (array!47224 array!47226 (_ BitVec 32) (_ BitVec 32) V!25675 V!25675 (_ BitVec 32) Int) ListLongMap!9075)

(assert (=> bm!37045 (= call!37049 (getCurrentListMapNoExtraKeys!2543 _keys!868 (array!47227 (store (arr!22644 _values!688) i!612 (ValueCellFull!7296 v!557)) (size!23084 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839612 () Bool)

(declare-fun res!570855 () Bool)

(assert (=> b!839612 (=> (not res!570855) (not e!468559))))

(declare-datatypes ((List!16105 0))(
  ( (Nil!16102) (Cons!16101 (h!17232 (_ BitVec 64)) (t!22476 List!16105)) )
))
(declare-fun arrayNoDuplicates!0 (array!47224 (_ BitVec 32) List!16105) Bool)

(assert (=> b!839612 (= res!570855 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16102))))

(declare-fun b!839613 () Bool)

(declare-fun e!468561 () Bool)

(declare-fun mapRes!24806 () Bool)

(assert (=> b!839613 (= e!468561 (and e!468558 mapRes!24806))))

(declare-fun condMapEmpty!24806 () Bool)

(declare-fun mapDefault!24806 () ValueCell!7296)

(assert (=> b!839613 (= condMapEmpty!24806 (= (arr!22644 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7296)) mapDefault!24806)))))

(declare-fun b!839614 () Bool)

(declare-fun res!570851 () Bool)

(assert (=> b!839614 (=> (not res!570851) (not e!468559))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839614 (= res!570851 (and (= (select (arr!22643 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23083 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24806 () Bool)

(assert (=> mapIsEmpty!24806 mapRes!24806))

(declare-fun b!839615 () Bool)

(declare-fun res!570852 () Bool)

(assert (=> b!839615 (=> (not res!570852) (not e!468559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839615 (= res!570852 (validMask!0 mask!1196))))

(declare-fun b!839616 () Bool)

(declare-fun res!570850 () Bool)

(assert (=> b!839616 (=> (not res!570850) (not e!468559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839616 (= res!570850 (validKeyInArray!0 k0!854))))

(declare-fun b!839617 () Bool)

(declare-fun res!570856 () Bool)

(assert (=> b!839617 (=> (not res!570856) (not e!468559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47224 (_ BitVec 32)) Bool)

(assert (=> b!839617 (= res!570856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37046 () Bool)

(assert (=> bm!37046 (= call!37048 (getCurrentListMapNoExtraKeys!2543 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24806 () Bool)

(declare-fun tp!47913 () Bool)

(declare-fun e!468557 () Bool)

(assert (=> mapNonEmpty!24806 (= mapRes!24806 (and tp!47913 e!468557))))

(declare-fun mapKey!24806 () (_ BitVec 32))

(declare-fun mapRest!24806 () (Array (_ BitVec 32) ValueCell!7296))

(declare-fun mapValue!24806 () ValueCell!7296)

(assert (=> mapNonEmpty!24806 (= (arr!22644 _values!688) (store mapRest!24806 mapKey!24806 mapValue!24806))))

(declare-fun b!839618 () Bool)

(declare-fun res!570857 () Bool)

(assert (=> b!839618 (=> (not res!570857) (not e!468559))))

(assert (=> b!839618 (= res!570857 (and (= (size!23084 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23083 _keys!868) (size!23084 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839619 () Bool)

(assert (=> b!839619 (= e!468557 tp_is_empty!15471)))

(declare-fun b!839620 () Bool)

(assert (=> b!839620 (= e!468559 (not true))))

(assert (=> b!839620 e!468562))

(declare-fun c!91267 () Bool)

(assert (=> b!839620 (= c!91267 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28835 0))(
  ( (Unit!28836) )
))
(declare-fun lt!380773 () Unit!28835)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!263 (array!47224 array!47226 (_ BitVec 32) (_ BitVec 32) V!25675 V!25675 (_ BitVec 32) (_ BitVec 64) V!25675 (_ BitVec 32) Int) Unit!28835)

(assert (=> b!839620 (= lt!380773 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!263 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570853 () Bool)

(assert (=> start!72420 (=> (not res!570853) (not e!468559))))

(assert (=> start!72420 (= res!570853 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23083 _keys!868))))))

(assert (=> start!72420 e!468559))

(assert (=> start!72420 tp_is_empty!15471))

(assert (=> start!72420 true))

(assert (=> start!72420 tp!47914))

(declare-fun array_inv!18036 (array!47224) Bool)

(assert (=> start!72420 (array_inv!18036 _keys!868)))

(declare-fun array_inv!18037 (array!47226) Bool)

(assert (=> start!72420 (and (array_inv!18037 _values!688) e!468561)))

(declare-fun b!839621 () Bool)

(declare-fun +!2024 (ListLongMap!9075 tuple2!10306) ListLongMap!9075)

(assert (=> b!839621 (= e!468562 (= call!37049 (+!2024 call!37048 (tuple2!10307 k0!854 v!557))))))

(assert (= (and start!72420 res!570853) b!839615))

(assert (= (and b!839615 res!570852) b!839618))

(assert (= (and b!839618 res!570857) b!839617))

(assert (= (and b!839617 res!570856) b!839612))

(assert (= (and b!839612 res!570855) b!839610))

(assert (= (and b!839610 res!570854) b!839616))

(assert (= (and b!839616 res!570850) b!839614))

(assert (= (and b!839614 res!570851) b!839620))

(assert (= (and b!839620 c!91267) b!839621))

(assert (= (and b!839620 (not c!91267)) b!839611))

(assert (= (or b!839621 b!839611) bm!37045))

(assert (= (or b!839621 b!839611) bm!37046))

(assert (= (and b!839613 condMapEmpty!24806) mapIsEmpty!24806))

(assert (= (and b!839613 (not condMapEmpty!24806)) mapNonEmpty!24806))

(get-info :version)

(assert (= (and mapNonEmpty!24806 ((_ is ValueCellFull!7296) mapValue!24806)) b!839619))

(assert (= (and b!839613 ((_ is ValueCellFull!7296) mapDefault!24806)) b!839609))

(assert (= start!72420 b!839613))

(declare-fun m!783659 () Bool)

(assert (=> b!839617 m!783659))

(declare-fun m!783661 () Bool)

(assert (=> b!839612 m!783661))

(declare-fun m!783663 () Bool)

(assert (=> b!839614 m!783663))

(declare-fun m!783665 () Bool)

(assert (=> b!839616 m!783665))

(declare-fun m!783667 () Bool)

(assert (=> bm!37045 m!783667))

(declare-fun m!783669 () Bool)

(assert (=> bm!37045 m!783669))

(declare-fun m!783671 () Bool)

(assert (=> bm!37046 m!783671))

(declare-fun m!783673 () Bool)

(assert (=> mapNonEmpty!24806 m!783673))

(declare-fun m!783675 () Bool)

(assert (=> b!839620 m!783675))

(declare-fun m!783677 () Bool)

(assert (=> b!839615 m!783677))

(declare-fun m!783679 () Bool)

(assert (=> b!839621 m!783679))

(declare-fun m!783681 () Bool)

(assert (=> start!72420 m!783681))

(declare-fun m!783683 () Bool)

(assert (=> start!72420 m!783683))

(check-sat (not b!839615) (not mapNonEmpty!24806) (not b!839616) (not b!839621) (not bm!37045) (not bm!37046) (not b!839620) (not b!839612) (not start!72420) b_and!22691 (not b!839617) tp_is_empty!15471 (not b_next!13605))
(check-sat b_and!22691 (not b_next!13605))
