; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72532 () Bool)

(assert start!72532)

(declare-fun b_free!13735 () Bool)

(declare-fun b_next!13735 () Bool)

(assert (=> start!72532 (= b_free!13735 (not b_next!13735))))

(declare-fun tp!48304 () Bool)

(declare-fun b_and!22795 () Bool)

(assert (=> start!72532 (= tp!48304 b_and!22795)))

(declare-fun b!841905 () Bool)

(declare-fun res!572305 () Bool)

(declare-fun e!469584 () Bool)

(assert (=> b!841905 (=> (not res!572305) (not e!469584))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841905 (= res!572305 (validKeyInArray!0 k0!854))))

(declare-datatypes ((V!25849 0))(
  ( (V!25850 (val!7848 Int)) )
))
(declare-datatypes ((tuple2!10442 0))(
  ( (tuple2!10443 (_1!5232 (_ BitVec 64)) (_2!5232 V!25849)) )
))
(declare-datatypes ((List!16211 0))(
  ( (Nil!16208) (Cons!16207 (h!17338 tuple2!10442) (t!22573 List!16211)) )
))
(declare-datatypes ((ListLongMap!9201 0))(
  ( (ListLongMap!9202 (toList!4616 List!16211)) )
))
(declare-fun call!37412 () ListLongMap!9201)

(declare-fun b!841906 () Bool)

(declare-fun call!37413 () ListLongMap!9201)

(declare-fun v!557 () V!25849)

(declare-fun e!469580 () Bool)

(declare-fun +!2095 (ListLongMap!9201 tuple2!10442) ListLongMap!9201)

(assert (=> b!841906 (= e!469580 (= call!37413 (+!2095 call!37412 (tuple2!10443 k0!854 v!557))))))

(declare-fun mapIsEmpty!25001 () Bool)

(declare-fun mapRes!25001 () Bool)

(assert (=> mapIsEmpty!25001 mapRes!25001))

(declare-fun res!572302 () Bool)

(assert (=> start!72532 (=> (not res!572302) (not e!469584))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47455 0))(
  ( (array!47456 (arr!22759 (Array (_ BitVec 32) (_ BitVec 64))) (size!23201 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47455)

(assert (=> start!72532 (= res!572302 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23201 _keys!868))))))

(assert (=> start!72532 e!469584))

(declare-fun tp_is_empty!15601 () Bool)

(assert (=> start!72532 tp_is_empty!15601))

(assert (=> start!72532 true))

(assert (=> start!72532 tp!48304))

(declare-fun array_inv!18186 (array!47455) Bool)

(assert (=> start!72532 (array_inv!18186 _keys!868)))

(declare-datatypes ((ValueCell!7361 0))(
  ( (ValueCellFull!7361 (v!10267 V!25849)) (EmptyCell!7361) )
))
(declare-datatypes ((array!47457 0))(
  ( (array!47458 (arr!22760 (Array (_ BitVec 32) ValueCell!7361)) (size!23202 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47457)

(declare-fun e!469581 () Bool)

(declare-fun array_inv!18187 (array!47457) Bool)

(assert (=> start!72532 (and (array_inv!18187 _values!688) e!469581)))

(declare-fun b!841907 () Bool)

(declare-fun res!572306 () Bool)

(assert (=> b!841907 (=> (not res!572306) (not e!469584))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841907 (= res!572306 (validMask!0 mask!1196))))

(declare-fun b!841908 () Bool)

(assert (=> b!841908 (= e!469580 (= call!37413 call!37412))))

(declare-fun b!841909 () Bool)

(assert (=> b!841909 (= e!469584 (not true))))

(assert (=> b!841909 e!469580))

(declare-fun c!91397 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841909 (= c!91397 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28875 0))(
  ( (Unit!28876) )
))
(declare-fun lt!380732 () Unit!28875)

(declare-fun minValue!654 () V!25849)

(declare-fun zeroValue!654 () V!25849)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!312 (array!47455 array!47457 (_ BitVec 32) (_ BitVec 32) V!25849 V!25849 (_ BitVec 32) (_ BitVec 64) V!25849 (_ BitVec 32) Int) Unit!28875)

(assert (=> b!841909 (= lt!380732 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!312 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37409 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2631 (array!47455 array!47457 (_ BitVec 32) (_ BitVec 32) V!25849 V!25849 (_ BitVec 32) Int) ListLongMap!9201)

(assert (=> bm!37409 (= call!37413 (getCurrentListMapNoExtraKeys!2631 _keys!868 (array!47458 (store (arr!22760 _values!688) i!612 (ValueCellFull!7361 v!557)) (size!23202 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25001 () Bool)

(declare-fun tp!48305 () Bool)

(declare-fun e!469583 () Bool)

(assert (=> mapNonEmpty!25001 (= mapRes!25001 (and tp!48305 e!469583))))

(declare-fun mapValue!25001 () ValueCell!7361)

(declare-fun mapKey!25001 () (_ BitVec 32))

(declare-fun mapRest!25001 () (Array (_ BitVec 32) ValueCell!7361))

(assert (=> mapNonEmpty!25001 (= (arr!22760 _values!688) (store mapRest!25001 mapKey!25001 mapValue!25001))))

(declare-fun b!841910 () Bool)

(declare-fun e!469582 () Bool)

(assert (=> b!841910 (= e!469581 (and e!469582 mapRes!25001))))

(declare-fun condMapEmpty!25001 () Bool)

(declare-fun mapDefault!25001 () ValueCell!7361)

(assert (=> b!841910 (= condMapEmpty!25001 (= (arr!22760 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7361)) mapDefault!25001)))))

(declare-fun b!841911 () Bool)

(declare-fun res!572307 () Bool)

(assert (=> b!841911 (=> (not res!572307) (not e!469584))))

(assert (=> b!841911 (= res!572307 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23201 _keys!868))))))

(declare-fun b!841912 () Bool)

(declare-fun res!572301 () Bool)

(assert (=> b!841912 (=> (not res!572301) (not e!469584))))

(assert (=> b!841912 (= res!572301 (and (= (size!23202 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23201 _keys!868) (size!23202 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841913 () Bool)

(declare-fun res!572303 () Bool)

(assert (=> b!841913 (=> (not res!572303) (not e!469584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47455 (_ BitVec 32)) Bool)

(assert (=> b!841913 (= res!572303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841914 () Bool)

(declare-fun res!572300 () Bool)

(assert (=> b!841914 (=> (not res!572300) (not e!469584))))

(assert (=> b!841914 (= res!572300 (and (= (select (arr!22759 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23201 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841915 () Bool)

(assert (=> b!841915 (= e!469583 tp_is_empty!15601)))

(declare-fun bm!37410 () Bool)

(assert (=> bm!37410 (= call!37412 (getCurrentListMapNoExtraKeys!2631 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841916 () Bool)

(declare-fun res!572304 () Bool)

(assert (=> b!841916 (=> (not res!572304) (not e!469584))))

(declare-datatypes ((List!16212 0))(
  ( (Nil!16209) (Cons!16208 (h!17339 (_ BitVec 64)) (t!22574 List!16212)) )
))
(declare-fun arrayNoDuplicates!0 (array!47455 (_ BitVec 32) List!16212) Bool)

(assert (=> b!841916 (= res!572304 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16209))))

(declare-fun b!841917 () Bool)

(assert (=> b!841917 (= e!469582 tp_is_empty!15601)))

(assert (= (and start!72532 res!572302) b!841907))

(assert (= (and b!841907 res!572306) b!841912))

(assert (= (and b!841912 res!572301) b!841913))

(assert (= (and b!841913 res!572303) b!841916))

(assert (= (and b!841916 res!572304) b!841911))

(assert (= (and b!841911 res!572307) b!841905))

(assert (= (and b!841905 res!572305) b!841914))

(assert (= (and b!841914 res!572300) b!841909))

(assert (= (and b!841909 c!91397) b!841906))

(assert (= (and b!841909 (not c!91397)) b!841908))

(assert (= (or b!841906 b!841908) bm!37409))

(assert (= (or b!841906 b!841908) bm!37410))

(assert (= (and b!841910 condMapEmpty!25001) mapIsEmpty!25001))

(assert (= (and b!841910 (not condMapEmpty!25001)) mapNonEmpty!25001))

(get-info :version)

(assert (= (and mapNonEmpty!25001 ((_ is ValueCellFull!7361) mapValue!25001)) b!841915))

(assert (= (and b!841910 ((_ is ValueCellFull!7361) mapDefault!25001)) b!841917))

(assert (= start!72532 b!841910))

(declare-fun m!784595 () Bool)

(assert (=> b!841909 m!784595))

(declare-fun m!784597 () Bool)

(assert (=> b!841907 m!784597))

(declare-fun m!784599 () Bool)

(assert (=> bm!37409 m!784599))

(declare-fun m!784601 () Bool)

(assert (=> bm!37409 m!784601))

(declare-fun m!784603 () Bool)

(assert (=> mapNonEmpty!25001 m!784603))

(declare-fun m!784605 () Bool)

(assert (=> b!841914 m!784605))

(declare-fun m!784607 () Bool)

(assert (=> b!841913 m!784607))

(declare-fun m!784609 () Bool)

(assert (=> start!72532 m!784609))

(declare-fun m!784611 () Bool)

(assert (=> start!72532 m!784611))

(declare-fun m!784613 () Bool)

(assert (=> b!841906 m!784613))

(declare-fun m!784615 () Bool)

(assert (=> b!841916 m!784615))

(declare-fun m!784617 () Bool)

(assert (=> bm!37410 m!784617))

(declare-fun m!784619 () Bool)

(assert (=> b!841905 m!784619))

(check-sat (not bm!37410) (not b!841907) tp_is_empty!15601 (not b!841906) (not b!841909) (not b_next!13735) (not mapNonEmpty!25001) (not bm!37409) b_and!22795 (not b!841913) (not b!841905) (not b!841916) (not start!72532))
(check-sat b_and!22795 (not b_next!13735))
