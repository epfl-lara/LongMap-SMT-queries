; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73012 () Bool)

(assert start!73012)

(declare-fun b_free!13945 () Bool)

(declare-fun b_next!13945 () Bool)

(assert (=> start!73012 (= b_free!13945 (not b_next!13945))))

(declare-fun tp!49340 () Bool)

(declare-fun b_and!23023 () Bool)

(assert (=> start!73012 (= tp!49340 b_and!23023)))

(declare-fun b!848623 () Bool)

(declare-fun res!576588 () Bool)

(declare-fun e!473458 () Bool)

(assert (=> b!848623 (=> (not res!576588) (not e!473458))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48369 0))(
  ( (array!48370 (arr!23216 (Array (_ BitVec 32) (_ BitVec 64))) (size!23658 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48369)

(declare-datatypes ((V!26489 0))(
  ( (V!26490 (val!8088 Int)) )
))
(declare-datatypes ((ValueCell!7601 0))(
  ( (ValueCellFull!7601 (v!10507 V!26489)) (EmptyCell!7601) )
))
(declare-datatypes ((array!48371 0))(
  ( (array!48372 (arr!23217 (Array (_ BitVec 32) ValueCell!7601)) (size!23659 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48371)

(assert (=> b!848623 (= res!576588 (and (= (size!23659 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23658 _keys!868) (size!23659 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25721 () Bool)

(declare-fun mapRes!25721 () Bool)

(declare-fun tp!49339 () Bool)

(declare-fun e!473460 () Bool)

(assert (=> mapNonEmpty!25721 (= mapRes!25721 (and tp!49339 e!473460))))

(declare-fun mapValue!25721 () ValueCell!7601)

(declare-fun mapKey!25721 () (_ BitVec 32))

(declare-fun mapRest!25721 () (Array (_ BitVec 32) ValueCell!7601))

(assert (=> mapNonEmpty!25721 (= (arr!23217 _values!688) (store mapRest!25721 mapKey!25721 mapValue!25721))))

(declare-fun b!848624 () Bool)

(declare-fun e!473453 () Bool)

(assert (=> b!848624 (= e!473453 true)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10612 0))(
  ( (tuple2!10613 (_1!5317 (_ BitVec 64)) (_2!5317 V!26489)) )
))
(declare-datatypes ((List!16459 0))(
  ( (Nil!16456) (Cons!16455 (h!17586 tuple2!10612) (t!22841 List!16459)) )
))
(declare-datatypes ((ListLongMap!9371 0))(
  ( (ListLongMap!9372 (toList!4701 List!16459)) )
))
(declare-fun lt!381891 () ListLongMap!9371)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26489)

(declare-fun zeroValue!654 () V!26489)

(declare-fun lt!381892 () array!48371)

(declare-fun +!2128 (ListLongMap!9371 tuple2!10612) ListLongMap!9371)

(declare-fun getCurrentListMapNoExtraKeys!2711 (array!48369 array!48371 (_ BitVec 32) (_ BitVec 32) V!26489 V!26489 (_ BitVec 32) Int) ListLongMap!9371)

(declare-fun get!12224 (ValueCell!7601 V!26489) V!26489)

(declare-fun dynLambda!995 (Int (_ BitVec 64)) V!26489)

(assert (=> b!848624 (= lt!381891 (+!2128 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!381892 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10613 (select (arr!23216 _keys!868) from!1053) (get!12224 (select (arr!23217 lt!381892) from!1053) (dynLambda!995 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848625 () Bool)

(declare-fun tp_is_empty!16081 () Bool)

(assert (=> b!848625 (= e!473460 tp_is_empty!16081)))

(declare-fun b!848626 () Bool)

(declare-fun res!576590 () Bool)

(assert (=> b!848626 (=> (not res!576590) (not e!473458))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!848626 (= res!576590 (and (= (select (arr!23216 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!576591 () Bool)

(assert (=> start!73012 (=> (not res!576591) (not e!473458))))

(assert (=> start!73012 (= res!576591 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23658 _keys!868))))))

(assert (=> start!73012 e!473458))

(assert (=> start!73012 tp_is_empty!16081))

(assert (=> start!73012 true))

(assert (=> start!73012 tp!49340))

(declare-fun array_inv!18512 (array!48369) Bool)

(assert (=> start!73012 (array_inv!18512 _keys!868)))

(declare-fun e!473457 () Bool)

(declare-fun array_inv!18513 (array!48371) Bool)

(assert (=> start!73012 (and (array_inv!18513 _values!688) e!473457)))

(declare-fun b!848627 () Bool)

(declare-fun e!473454 () Bool)

(assert (=> b!848627 (= e!473454 tp_is_empty!16081)))

(declare-fun b!848628 () Bool)

(declare-fun res!576592 () Bool)

(assert (=> b!848628 (=> (not res!576592) (not e!473458))))

(assert (=> b!848628 (= res!576592 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23658 _keys!868))))))

(declare-fun b!848629 () Bool)

(declare-fun res!576594 () Bool)

(assert (=> b!848629 (=> (not res!576594) (not e!473458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848629 (= res!576594 (validMask!0 mask!1196))))

(declare-fun call!37665 () ListLongMap!9371)

(declare-fun bm!37661 () Bool)

(assert (=> bm!37661 (= call!37665 (getCurrentListMapNoExtraKeys!2711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37664 () ListLongMap!9371)

(declare-fun bm!37662 () Bool)

(assert (=> bm!37662 (= call!37664 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!381892 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848630 () Bool)

(declare-fun e!473456 () Bool)

(assert (=> b!848630 (= e!473456 (not e!473453))))

(declare-fun res!576593 () Bool)

(assert (=> b!848630 (=> res!576593 e!473453)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848630 (= res!576593 (not (validKeyInArray!0 (select (arr!23216 _keys!868) from!1053))))))

(declare-fun e!473459 () Bool)

(assert (=> b!848630 e!473459))

(declare-fun c!91523 () Bool)

(assert (=> b!848630 (= c!91523 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26489)

(declare-datatypes ((Unit!28935 0))(
  ( (Unit!28936) )
))
(declare-fun lt!381893 () Unit!28935)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!342 (array!48369 array!48371 (_ BitVec 32) (_ BitVec 32) V!26489 V!26489 (_ BitVec 32) (_ BitVec 64) V!26489 (_ BitVec 32) Int) Unit!28935)

(assert (=> b!848630 (= lt!381893 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!342 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848631 () Bool)

(declare-fun res!576597 () Bool)

(assert (=> b!848631 (=> (not res!576597) (not e!473458))))

(declare-datatypes ((List!16460 0))(
  ( (Nil!16457) (Cons!16456 (h!17587 (_ BitVec 64)) (t!22842 List!16460)) )
))
(declare-fun arrayNoDuplicates!0 (array!48369 (_ BitVec 32) List!16460) Bool)

(assert (=> b!848631 (= res!576597 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16457))))

(declare-fun b!848632 () Bool)

(assert (=> b!848632 (= e!473459 (= call!37664 call!37665))))

(declare-fun mapIsEmpty!25721 () Bool)

(assert (=> mapIsEmpty!25721 mapRes!25721))

(declare-fun b!848633 () Bool)

(declare-fun res!576589 () Bool)

(assert (=> b!848633 (=> (not res!576589) (not e!473458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48369 (_ BitVec 32)) Bool)

(assert (=> b!848633 (= res!576589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848634 () Bool)

(assert (=> b!848634 (= e!473458 e!473456)))

(declare-fun res!576595 () Bool)

(assert (=> b!848634 (=> (not res!576595) (not e!473456))))

(assert (=> b!848634 (= res!576595 (= from!1053 i!612))))

(assert (=> b!848634 (= lt!381891 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!381892 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848634 (= lt!381892 (array!48372 (store (arr!23217 _values!688) i!612 (ValueCellFull!7601 v!557)) (size!23659 _values!688)))))

(declare-fun lt!381890 () ListLongMap!9371)

(assert (=> b!848634 (= lt!381890 (getCurrentListMapNoExtraKeys!2711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848635 () Bool)

(declare-fun res!576596 () Bool)

(assert (=> b!848635 (=> (not res!576596) (not e!473458))))

(assert (=> b!848635 (= res!576596 (validKeyInArray!0 k0!854))))

(declare-fun b!848636 () Bool)

(assert (=> b!848636 (= e!473459 (= call!37664 (+!2128 call!37665 (tuple2!10613 k0!854 v!557))))))

(declare-fun b!848637 () Bool)

(assert (=> b!848637 (= e!473457 (and e!473454 mapRes!25721))))

(declare-fun condMapEmpty!25721 () Bool)

(declare-fun mapDefault!25721 () ValueCell!7601)

(assert (=> b!848637 (= condMapEmpty!25721 (= (arr!23217 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7601)) mapDefault!25721)))))

(assert (= (and start!73012 res!576591) b!848629))

(assert (= (and b!848629 res!576594) b!848623))

(assert (= (and b!848623 res!576588) b!848633))

(assert (= (and b!848633 res!576589) b!848631))

(assert (= (and b!848631 res!576597) b!848628))

(assert (= (and b!848628 res!576592) b!848635))

(assert (= (and b!848635 res!576596) b!848626))

(assert (= (and b!848626 res!576590) b!848634))

(assert (= (and b!848634 res!576595) b!848630))

(assert (= (and b!848630 c!91523) b!848636))

(assert (= (and b!848630 (not c!91523)) b!848632))

(assert (= (or b!848636 b!848632) bm!37662))

(assert (= (or b!848636 b!848632) bm!37661))

(assert (= (and b!848630 (not res!576593)) b!848624))

(assert (= (and b!848637 condMapEmpty!25721) mapIsEmpty!25721))

(assert (= (and b!848637 (not condMapEmpty!25721)) mapNonEmpty!25721))

(get-info :version)

(assert (= (and mapNonEmpty!25721 ((_ is ValueCellFull!7601) mapValue!25721)) b!848625))

(assert (= (and b!848637 ((_ is ValueCellFull!7601) mapDefault!25721)) b!848627))

(assert (= start!73012 b!848637))

(declare-fun b_lambda!11459 () Bool)

(assert (=> (not b_lambda!11459) (not b!848624)))

(declare-fun t!22840 () Bool)

(declare-fun tb!4239 () Bool)

(assert (=> (and start!73012 (= defaultEntry!696 defaultEntry!696) t!22840) tb!4239))

(declare-fun result!8097 () Bool)

(assert (=> tb!4239 (= result!8097 tp_is_empty!16081)))

(assert (=> b!848624 t!22840))

(declare-fun b_and!23025 () Bool)

(assert (= b_and!23023 (and (=> t!22840 result!8097) b_and!23025)))

(declare-fun m!788849 () Bool)

(assert (=> b!848626 m!788849))

(declare-fun m!788851 () Bool)

(assert (=> b!848634 m!788851))

(declare-fun m!788853 () Bool)

(assert (=> b!848634 m!788853))

(declare-fun m!788855 () Bool)

(assert (=> b!848634 m!788855))

(declare-fun m!788857 () Bool)

(assert (=> b!848624 m!788857))

(assert (=> b!848624 m!788857))

(declare-fun m!788859 () Bool)

(assert (=> b!848624 m!788859))

(declare-fun m!788861 () Bool)

(assert (=> b!848624 m!788861))

(declare-fun m!788863 () Bool)

(assert (=> b!848624 m!788863))

(declare-fun m!788865 () Bool)

(assert (=> b!848624 m!788865))

(assert (=> b!848624 m!788863))

(declare-fun m!788867 () Bool)

(assert (=> b!848624 m!788867))

(assert (=> b!848624 m!788859))

(declare-fun m!788869 () Bool)

(assert (=> start!73012 m!788869))

(declare-fun m!788871 () Bool)

(assert (=> start!73012 m!788871))

(declare-fun m!788873 () Bool)

(assert (=> mapNonEmpty!25721 m!788873))

(declare-fun m!788875 () Bool)

(assert (=> b!848629 m!788875))

(declare-fun m!788877 () Bool)

(assert (=> b!848635 m!788877))

(assert (=> bm!37662 m!788863))

(declare-fun m!788879 () Bool)

(assert (=> b!848631 m!788879))

(assert (=> b!848630 m!788867))

(assert (=> b!848630 m!788867))

(declare-fun m!788881 () Bool)

(assert (=> b!848630 m!788881))

(declare-fun m!788883 () Bool)

(assert (=> b!848630 m!788883))

(declare-fun m!788885 () Bool)

(assert (=> bm!37661 m!788885))

(declare-fun m!788887 () Bool)

(assert (=> b!848636 m!788887))

(declare-fun m!788889 () Bool)

(assert (=> b!848633 m!788889))

(check-sat (not bm!37661) (not b!848624) (not b_next!13945) tp_is_empty!16081 (not b!848635) (not b!848634) (not start!73012) (not b!848631) b_and!23025 (not mapNonEmpty!25721) (not bm!37662) (not b_lambda!11459) (not b!848636) (not b!848633) (not b!848629) (not b!848630))
(check-sat b_and!23025 (not b_next!13945))
