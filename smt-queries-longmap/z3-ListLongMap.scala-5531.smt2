; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72972 () Bool)

(assert start!72972)

(declare-fun b_free!13887 () Bool)

(declare-fun b_next!13887 () Bool)

(assert (=> start!72972 (= b_free!13887 (not b_next!13887))))

(declare-fun tp!49164 () Bool)

(declare-fun b_and!22973 () Bool)

(assert (=> start!72972 (= tp!49164 b_and!22973)))

(declare-fun bm!37513 () Bool)

(declare-datatypes ((V!26411 0))(
  ( (V!26412 (val!8059 Int)) )
))
(declare-datatypes ((tuple2!10528 0))(
  ( (tuple2!10529 (_1!5275 (_ BitVec 64)) (_2!5275 V!26411)) )
))
(declare-datatypes ((List!16386 0))(
  ( (Nil!16383) (Cons!16382 (h!17513 tuple2!10528) (t!22757 List!16386)) )
))
(declare-datatypes ((ListLongMap!9297 0))(
  ( (ListLongMap!9298 (toList!4664 List!16386)) )
))
(declare-fun call!37516 () ListLongMap!9297)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48256 0))(
  ( (array!48257 (arr!23159 (Array (_ BitVec 32) (_ BitVec 64))) (size!23599 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48256)

(declare-datatypes ((ValueCell!7572 0))(
  ( (ValueCellFull!7572 (v!10484 V!26411)) (EmptyCell!7572) )
))
(declare-datatypes ((array!48258 0))(
  ( (array!48259 (arr!23160 (Array (_ BitVec 32) ValueCell!7572)) (size!23600 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48258)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26411)

(declare-fun zeroValue!654 () V!26411)

(declare-fun getCurrentListMapNoExtraKeys!2648 (array!48256 array!48258 (_ BitVec 32) (_ BitVec 32) V!26411 V!26411 (_ BitVec 32) Int) ListLongMap!9297)

(assert (=> bm!37513 (= call!37516 (getCurrentListMapNoExtraKeys!2648 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847588 () Bool)

(declare-fun res!575885 () Bool)

(declare-fun e!472956 () Bool)

(assert (=> b!847588 (=> (not res!575885) (not e!472956))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!847588 (= res!575885 (and (= (select (arr!23159 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847589 () Bool)

(declare-fun e!472959 () Bool)

(assert (=> b!847589 (= e!472956 e!472959)))

(declare-fun res!575879 () Bool)

(assert (=> b!847589 (=> (not res!575879) (not e!472959))))

(assert (=> b!847589 (= res!575879 (= from!1053 i!612))))

(declare-fun lt!381781 () array!48258)

(declare-fun lt!381780 () ListLongMap!9297)

(assert (=> b!847589 (= lt!381780 (getCurrentListMapNoExtraKeys!2648 _keys!868 lt!381781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26411)

(assert (=> b!847589 (= lt!381781 (array!48259 (store (arr!23160 _values!688) i!612 (ValueCellFull!7572 v!557)) (size!23600 _values!688)))))

(declare-fun lt!381778 () ListLongMap!9297)

(assert (=> b!847589 (= lt!381778 (getCurrentListMapNoExtraKeys!2648 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847590 () Bool)

(assert (=> b!847590 (= e!472959 (not true))))

(declare-fun e!472958 () Bool)

(assert (=> b!847590 e!472958))

(declare-fun c!91501 () Bool)

(assert (=> b!847590 (= c!91501 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28943 0))(
  ( (Unit!28944) )
))
(declare-fun lt!381779 () Unit!28943)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!317 (array!48256 array!48258 (_ BitVec 32) (_ BitVec 32) V!26411 V!26411 (_ BitVec 32) (_ BitVec 64) V!26411 (_ BitVec 32) Int) Unit!28943)

(assert (=> b!847590 (= lt!381779 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!317 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!575884 () Bool)

(assert (=> start!72972 (=> (not res!575884) (not e!472956))))

(assert (=> start!72972 (= res!575884 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23599 _keys!868))))))

(assert (=> start!72972 e!472956))

(declare-fun tp_is_empty!16023 () Bool)

(assert (=> start!72972 tp_is_empty!16023))

(assert (=> start!72972 true))

(assert (=> start!72972 tp!49164))

(declare-fun array_inv!18392 (array!48256) Bool)

(assert (=> start!72972 (array_inv!18392 _keys!868)))

(declare-fun e!472957 () Bool)

(declare-fun array_inv!18393 (array!48258) Bool)

(assert (=> start!72972 (and (array_inv!18393 _values!688) e!472957)))

(declare-fun b!847591 () Bool)

(declare-fun call!37517 () ListLongMap!9297)

(assert (=> b!847591 (= e!472958 (= call!37517 call!37516))))

(declare-fun b!847592 () Bool)

(declare-fun res!575883 () Bool)

(assert (=> b!847592 (=> (not res!575883) (not e!472956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847592 (= res!575883 (validMask!0 mask!1196))))

(declare-fun b!847593 () Bool)

(declare-fun res!575881 () Bool)

(assert (=> b!847593 (=> (not res!575881) (not e!472956))))

(declare-datatypes ((List!16387 0))(
  ( (Nil!16384) (Cons!16383 (h!17514 (_ BitVec 64)) (t!22758 List!16387)) )
))
(declare-fun arrayNoDuplicates!0 (array!48256 (_ BitVec 32) List!16387) Bool)

(assert (=> b!847593 (= res!575881 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16384))))

(declare-fun mapIsEmpty!25634 () Bool)

(declare-fun mapRes!25634 () Bool)

(assert (=> mapIsEmpty!25634 mapRes!25634))

(declare-fun b!847594 () Bool)

(declare-fun res!575882 () Bool)

(assert (=> b!847594 (=> (not res!575882) (not e!472956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48256 (_ BitVec 32)) Bool)

(assert (=> b!847594 (= res!575882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847595 () Bool)

(declare-fun res!575880 () Bool)

(assert (=> b!847595 (=> (not res!575880) (not e!472956))))

(assert (=> b!847595 (= res!575880 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23599 _keys!868))))))

(declare-fun b!847596 () Bool)

(declare-fun res!575877 () Bool)

(assert (=> b!847596 (=> (not res!575877) (not e!472956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847596 (= res!575877 (validKeyInArray!0 k0!854))))

(declare-fun bm!37514 () Bool)

(assert (=> bm!37514 (= call!37517 (getCurrentListMapNoExtraKeys!2648 _keys!868 lt!381781 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25634 () Bool)

(declare-fun tp!49165 () Bool)

(declare-fun e!472955 () Bool)

(assert (=> mapNonEmpty!25634 (= mapRes!25634 (and tp!49165 e!472955))))

(declare-fun mapValue!25634 () ValueCell!7572)

(declare-fun mapKey!25634 () (_ BitVec 32))

(declare-fun mapRest!25634 () (Array (_ BitVec 32) ValueCell!7572))

(assert (=> mapNonEmpty!25634 (= (arr!23160 _values!688) (store mapRest!25634 mapKey!25634 mapValue!25634))))

(declare-fun b!847597 () Bool)

(declare-fun e!472954 () Bool)

(assert (=> b!847597 (= e!472954 tp_is_empty!16023)))

(declare-fun b!847598 () Bool)

(assert (=> b!847598 (= e!472955 tp_is_empty!16023)))

(declare-fun b!847599 () Bool)

(declare-fun +!2080 (ListLongMap!9297 tuple2!10528) ListLongMap!9297)

(assert (=> b!847599 (= e!472958 (= call!37517 (+!2080 call!37516 (tuple2!10529 k0!854 v!557))))))

(declare-fun b!847600 () Bool)

(declare-fun res!575878 () Bool)

(assert (=> b!847600 (=> (not res!575878) (not e!472956))))

(assert (=> b!847600 (= res!575878 (and (= (size!23600 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23599 _keys!868) (size!23600 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847601 () Bool)

(assert (=> b!847601 (= e!472957 (and e!472954 mapRes!25634))))

(declare-fun condMapEmpty!25634 () Bool)

(declare-fun mapDefault!25634 () ValueCell!7572)

(assert (=> b!847601 (= condMapEmpty!25634 (= (arr!23160 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7572)) mapDefault!25634)))))

(assert (= (and start!72972 res!575884) b!847592))

(assert (= (and b!847592 res!575883) b!847600))

(assert (= (and b!847600 res!575878) b!847594))

(assert (= (and b!847594 res!575882) b!847593))

(assert (= (and b!847593 res!575881) b!847595))

(assert (= (and b!847595 res!575880) b!847596))

(assert (= (and b!847596 res!575877) b!847588))

(assert (= (and b!847588 res!575885) b!847589))

(assert (= (and b!847589 res!575879) b!847590))

(assert (= (and b!847590 c!91501) b!847599))

(assert (= (and b!847590 (not c!91501)) b!847591))

(assert (= (or b!847599 b!847591) bm!37514))

(assert (= (or b!847599 b!847591) bm!37513))

(assert (= (and b!847601 condMapEmpty!25634) mapIsEmpty!25634))

(assert (= (and b!847601 (not condMapEmpty!25634)) mapNonEmpty!25634))

(get-info :version)

(assert (= (and mapNonEmpty!25634 ((_ is ValueCellFull!7572) mapValue!25634)) b!847598))

(assert (= (and b!847601 ((_ is ValueCellFull!7572) mapDefault!25634)) b!847597))

(assert (= start!72972 b!847601))

(declare-fun m!788613 () Bool)

(assert (=> b!847593 m!788613))

(declare-fun m!788615 () Bool)

(assert (=> b!847589 m!788615))

(declare-fun m!788617 () Bool)

(assert (=> b!847589 m!788617))

(declare-fun m!788619 () Bool)

(assert (=> b!847589 m!788619))

(declare-fun m!788621 () Bool)

(assert (=> mapNonEmpty!25634 m!788621))

(declare-fun m!788623 () Bool)

(assert (=> b!847588 m!788623))

(declare-fun m!788625 () Bool)

(assert (=> start!72972 m!788625))

(declare-fun m!788627 () Bool)

(assert (=> start!72972 m!788627))

(declare-fun m!788629 () Bool)

(assert (=> bm!37513 m!788629))

(declare-fun m!788631 () Bool)

(assert (=> bm!37514 m!788631))

(declare-fun m!788633 () Bool)

(assert (=> b!847592 m!788633))

(declare-fun m!788635 () Bool)

(assert (=> b!847590 m!788635))

(declare-fun m!788637 () Bool)

(assert (=> b!847596 m!788637))

(declare-fun m!788639 () Bool)

(assert (=> b!847594 m!788639))

(declare-fun m!788641 () Bool)

(assert (=> b!847599 m!788641))

(check-sat b_and!22973 (not mapNonEmpty!25634) (not start!72972) (not bm!37514) (not b!847589) (not b_next!13887) (not b!847592) (not b!847594) (not b!847599) (not b!847596) tp_is_empty!16023 (not b!847590) (not b!847593) (not bm!37513))
(check-sat b_and!22973 (not b_next!13887))
