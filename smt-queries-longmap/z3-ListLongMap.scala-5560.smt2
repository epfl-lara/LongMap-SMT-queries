; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73312 () Bool)

(assert start!73312)

(declare-fun b_free!14059 () Bool)

(declare-fun b_next!14059 () Bool)

(assert (=> start!73312 (= b_free!14059 (not b_next!14059))))

(declare-fun tp!49682 () Bool)

(declare-fun b_and!23287 () Bool)

(assert (=> start!73312 (= tp!49682 b_and!23287)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26641 0))(
  ( (V!26642 (val!8145 Int)) )
))
(declare-datatypes ((tuple2!10608 0))(
  ( (tuple2!10609 (_1!5315 (_ BitVec 64)) (_2!5315 V!26641)) )
))
(declare-datatypes ((List!16465 0))(
  ( (Nil!16462) (Cons!16461 (h!17598 tuple2!10608) (t!22962 List!16465)) )
))
(declare-datatypes ((ListLongMap!9379 0))(
  ( (ListLongMap!9380 (toList!4705 List!16465)) )
))
(declare-fun call!38078 () ListLongMap!9379)

(declare-datatypes ((array!48639 0))(
  ( (array!48640 (arr!23346 (Array (_ BitVec 32) (_ BitVec 64))) (size!23787 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48639)

(declare-datatypes ((ValueCell!7658 0))(
  ( (ValueCellFull!7658 (v!10570 V!26641)) (EmptyCell!7658) )
))
(declare-datatypes ((array!48641 0))(
  ( (array!48642 (arr!23347 (Array (_ BitVec 32) ValueCell!7658)) (size!23788 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48641)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26641)

(declare-fun zeroValue!654 () V!26641)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38074 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2763 (array!48639 array!48641 (_ BitVec 32) (_ BitVec 32) V!26641 V!26641 (_ BitVec 32) Int) ListLongMap!9379)

(assert (=> bm!38074 (= call!38078 (getCurrentListMapNoExtraKeys!2763 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852444 () Bool)

(declare-fun e!475554 () Bool)

(declare-fun call!38077 () ListLongMap!9379)

(assert (=> b!852444 (= e!475554 (= call!38077 call!38078))))

(declare-fun b!852445 () Bool)

(declare-fun res!578755 () Bool)

(declare-fun e!475552 () Bool)

(assert (=> b!852445 (=> (not res!578755) (not e!475552))))

(assert (=> b!852445 (= res!578755 (and (= (size!23788 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23787 _keys!868) (size!23788 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38075 () Bool)

(declare-fun lt!383888 () array!48641)

(assert (=> bm!38075 (= call!38077 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!383888 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852446 () Bool)

(declare-fun e!475556 () Bool)

(assert (=> b!852446 (= e!475556 true)))

(declare-fun lt!383889 () ListLongMap!9379)

(declare-fun lt!383886 () V!26641)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!383893 () tuple2!10608)

(declare-fun +!2152 (ListLongMap!9379 tuple2!10608) ListLongMap!9379)

(assert (=> b!852446 (= (+!2152 lt!383889 lt!383893) (+!2152 (+!2152 lt!383889 (tuple2!10609 k0!854 lt!383886)) lt!383893))))

(declare-fun lt!383891 () V!26641)

(assert (=> b!852446 (= lt!383893 (tuple2!10609 k0!854 lt!383891))))

(declare-datatypes ((Unit!29066 0))(
  ( (Unit!29067) )
))
(declare-fun lt!383894 () Unit!29066)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!281 (ListLongMap!9379 (_ BitVec 64) V!26641 V!26641) Unit!29066)

(assert (=> b!852446 (= lt!383894 (addSameAsAddTwiceSameKeyDiffValues!281 lt!383889 k0!854 lt!383886 lt!383891))))

(declare-fun lt!383885 () V!26641)

(declare-fun get!12298 (ValueCell!7658 V!26641) V!26641)

(assert (=> b!852446 (= lt!383886 (get!12298 (select (arr!23347 _values!688) from!1053) lt!383885))))

(declare-fun lt!383892 () ListLongMap!9379)

(assert (=> b!852446 (= lt!383892 (+!2152 lt!383889 (tuple2!10609 (select (arr!23346 _keys!868) from!1053) lt!383891)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun v!557 () V!26641)

(assert (=> b!852446 (= lt!383891 (get!12298 (select (store (arr!23347 _values!688) i!612 (ValueCellFull!7658 v!557)) from!1053) lt!383885))))

(declare-fun dynLambda!1028 (Int (_ BitVec 64)) V!26641)

(assert (=> b!852446 (= lt!383885 (dynLambda!1028 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852446 (= lt!383889 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!383888 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852447 () Bool)

(declare-fun res!578757 () Bool)

(assert (=> b!852447 (=> (not res!578757) (not e!475552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852447 (= res!578757 (validMask!0 mask!1196))))

(declare-fun res!578761 () Bool)

(assert (=> start!73312 (=> (not res!578761) (not e!475552))))

(assert (=> start!73312 (= res!578761 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23787 _keys!868))))))

(assert (=> start!73312 e!475552))

(declare-fun tp_is_empty!16195 () Bool)

(assert (=> start!73312 tp_is_empty!16195))

(assert (=> start!73312 true))

(assert (=> start!73312 tp!49682))

(declare-fun array_inv!18566 (array!48639) Bool)

(assert (=> start!73312 (array_inv!18566 _keys!868)))

(declare-fun e!475555 () Bool)

(declare-fun array_inv!18567 (array!48641) Bool)

(assert (=> start!73312 (and (array_inv!18567 _values!688) e!475555)))

(declare-fun b!852448 () Bool)

(declare-fun res!578760 () Bool)

(assert (=> b!852448 (=> (not res!578760) (not e!475552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48639 (_ BitVec 32)) Bool)

(assert (=> b!852448 (= res!578760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852449 () Bool)

(declare-fun e!475557 () Bool)

(assert (=> b!852449 (= e!475557 tp_is_empty!16195)))

(declare-fun b!852450 () Bool)

(declare-fun res!578754 () Bool)

(assert (=> b!852450 (=> (not res!578754) (not e!475552))))

(declare-datatypes ((List!16466 0))(
  ( (Nil!16463) (Cons!16462 (h!17599 (_ BitVec 64)) (t!22963 List!16466)) )
))
(declare-fun arrayNoDuplicates!0 (array!48639 (_ BitVec 32) List!16466) Bool)

(assert (=> b!852450 (= res!578754 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16463))))

(declare-fun b!852451 () Bool)

(declare-fun e!475553 () Bool)

(assert (=> b!852451 (= e!475553 tp_is_empty!16195)))

(declare-fun b!852452 () Bool)

(declare-fun mapRes!25892 () Bool)

(assert (=> b!852452 (= e!475555 (and e!475553 mapRes!25892))))

(declare-fun condMapEmpty!25892 () Bool)

(declare-fun mapDefault!25892 () ValueCell!7658)

(assert (=> b!852452 (= condMapEmpty!25892 (= (arr!23347 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7658)) mapDefault!25892)))))

(declare-fun b!852453 () Bool)

(declare-fun res!578758 () Bool)

(assert (=> b!852453 (=> (not res!578758) (not e!475552))))

(assert (=> b!852453 (= res!578758 (and (= (select (arr!23346 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852454 () Bool)

(declare-fun res!578753 () Bool)

(assert (=> b!852454 (=> (not res!578753) (not e!475552))))

(assert (=> b!852454 (= res!578753 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23787 _keys!868))))))

(declare-fun b!852455 () Bool)

(declare-fun e!475551 () Bool)

(assert (=> b!852455 (= e!475552 e!475551)))

(declare-fun res!578756 () Bool)

(assert (=> b!852455 (=> (not res!578756) (not e!475551))))

(assert (=> b!852455 (= res!578756 (= from!1053 i!612))))

(assert (=> b!852455 (= lt!383892 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!383888 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852455 (= lt!383888 (array!48642 (store (arr!23347 _values!688) i!612 (ValueCellFull!7658 v!557)) (size!23788 _values!688)))))

(declare-fun lt!383890 () ListLongMap!9379)

(assert (=> b!852455 (= lt!383890 (getCurrentListMapNoExtraKeys!2763 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25892 () Bool)

(assert (=> mapIsEmpty!25892 mapRes!25892))

(declare-fun mapNonEmpty!25892 () Bool)

(declare-fun tp!49681 () Bool)

(assert (=> mapNonEmpty!25892 (= mapRes!25892 (and tp!49681 e!475557))))

(declare-fun mapKey!25892 () (_ BitVec 32))

(declare-fun mapValue!25892 () ValueCell!7658)

(declare-fun mapRest!25892 () (Array (_ BitVec 32) ValueCell!7658))

(assert (=> mapNonEmpty!25892 (= (arr!23347 _values!688) (store mapRest!25892 mapKey!25892 mapValue!25892))))

(declare-fun b!852456 () Bool)

(assert (=> b!852456 (= e!475554 (= call!38077 (+!2152 call!38078 (tuple2!10609 k0!854 v!557))))))

(declare-fun b!852457 () Bool)

(assert (=> b!852457 (= e!475551 (not e!475556))))

(declare-fun res!578752 () Bool)

(assert (=> b!852457 (=> res!578752 e!475556)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852457 (= res!578752 (not (validKeyInArray!0 (select (arr!23346 _keys!868) from!1053))))))

(assert (=> b!852457 e!475554))

(declare-fun c!92041 () Bool)

(assert (=> b!852457 (= c!92041 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383887 () Unit!29066)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!365 (array!48639 array!48641 (_ BitVec 32) (_ BitVec 32) V!26641 V!26641 (_ BitVec 32) (_ BitVec 64) V!26641 (_ BitVec 32) Int) Unit!29066)

(assert (=> b!852457 (= lt!383887 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!365 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852458 () Bool)

(declare-fun res!578759 () Bool)

(assert (=> b!852458 (=> (not res!578759) (not e!475552))))

(assert (=> b!852458 (= res!578759 (validKeyInArray!0 k0!854))))

(assert (= (and start!73312 res!578761) b!852447))

(assert (= (and b!852447 res!578757) b!852445))

(assert (= (and b!852445 res!578755) b!852448))

(assert (= (and b!852448 res!578760) b!852450))

(assert (= (and b!852450 res!578754) b!852454))

(assert (= (and b!852454 res!578753) b!852458))

(assert (= (and b!852458 res!578759) b!852453))

(assert (= (and b!852453 res!578758) b!852455))

(assert (= (and b!852455 res!578756) b!852457))

(assert (= (and b!852457 c!92041) b!852456))

(assert (= (and b!852457 (not c!92041)) b!852444))

(assert (= (or b!852456 b!852444) bm!38075))

(assert (= (or b!852456 b!852444) bm!38074))

(assert (= (and b!852457 (not res!578752)) b!852446))

(assert (= (and b!852452 condMapEmpty!25892) mapIsEmpty!25892))

(assert (= (and b!852452 (not condMapEmpty!25892)) mapNonEmpty!25892))

(get-info :version)

(assert (= (and mapNonEmpty!25892 ((_ is ValueCellFull!7658) mapValue!25892)) b!852449))

(assert (= (and b!852452 ((_ is ValueCellFull!7658) mapDefault!25892)) b!852451))

(assert (= start!73312 b!852452))

(declare-fun b_lambda!11605 () Bool)

(assert (=> (not b_lambda!11605) (not b!852446)))

(declare-fun t!22961 () Bool)

(declare-fun tb!4353 () Bool)

(assert (=> (and start!73312 (= defaultEntry!696 defaultEntry!696) t!22961) tb!4353))

(declare-fun result!8325 () Bool)

(assert (=> tb!4353 (= result!8325 tp_is_empty!16195)))

(assert (=> b!852446 t!22961))

(declare-fun b_and!23289 () Bool)

(assert (= b_and!23287 (and (=> t!22961 result!8325) b_and!23289)))

(declare-fun m!793759 () Bool)

(assert (=> b!852447 m!793759))

(declare-fun m!793761 () Bool)

(assert (=> b!852455 m!793761))

(declare-fun m!793763 () Bool)

(assert (=> b!852455 m!793763))

(declare-fun m!793765 () Bool)

(assert (=> b!852455 m!793765))

(declare-fun m!793767 () Bool)

(assert (=> start!73312 m!793767))

(declare-fun m!793769 () Bool)

(assert (=> start!73312 m!793769))

(declare-fun m!793771 () Bool)

(assert (=> b!852450 m!793771))

(declare-fun m!793773 () Bool)

(assert (=> b!852448 m!793773))

(declare-fun m!793775 () Bool)

(assert (=> bm!38074 m!793775))

(declare-fun m!793777 () Bool)

(assert (=> b!852457 m!793777))

(assert (=> b!852457 m!793777))

(declare-fun m!793779 () Bool)

(assert (=> b!852457 m!793779))

(declare-fun m!793781 () Bool)

(assert (=> b!852457 m!793781))

(declare-fun m!793783 () Bool)

(assert (=> b!852458 m!793783))

(declare-fun m!793785 () Bool)

(assert (=> mapNonEmpty!25892 m!793785))

(declare-fun m!793787 () Bool)

(assert (=> b!852453 m!793787))

(declare-fun m!793789 () Bool)

(assert (=> bm!38075 m!793789))

(declare-fun m!793791 () Bool)

(assert (=> b!852446 m!793791))

(declare-fun m!793793 () Bool)

(assert (=> b!852446 m!793793))

(declare-fun m!793795 () Bool)

(assert (=> b!852446 m!793795))

(declare-fun m!793797 () Bool)

(assert (=> b!852446 m!793797))

(declare-fun m!793799 () Bool)

(assert (=> b!852446 m!793799))

(declare-fun m!793801 () Bool)

(assert (=> b!852446 m!793801))

(assert (=> b!852446 m!793793))

(assert (=> b!852446 m!793797))

(declare-fun m!793803 () Bool)

(assert (=> b!852446 m!793803))

(declare-fun m!793805 () Bool)

(assert (=> b!852446 m!793805))

(assert (=> b!852446 m!793789))

(assert (=> b!852446 m!793803))

(assert (=> b!852446 m!793777))

(declare-fun m!793807 () Bool)

(assert (=> b!852446 m!793807))

(declare-fun m!793809 () Bool)

(assert (=> b!852446 m!793809))

(assert (=> b!852446 m!793763))

(declare-fun m!793811 () Bool)

(assert (=> b!852456 m!793811))

(check-sat (not b!852448) (not b_next!14059) (not b!852446) b_and!23289 (not bm!38075) (not mapNonEmpty!25892) tp_is_empty!16195 (not b!852447) (not b!852455) (not bm!38074) (not b!852456) (not b!852457) (not start!73312) (not b_lambda!11605) (not b!852458) (not b!852450))
(check-sat b_and!23289 (not b_next!14059))
