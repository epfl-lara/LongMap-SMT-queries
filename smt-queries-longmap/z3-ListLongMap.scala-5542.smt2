; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73038 () Bool)

(assert start!73038)

(declare-fun b_free!13953 () Bool)

(declare-fun b_next!13953 () Bool)

(assert (=> start!73038 (= b_free!13953 (not b_next!13953))))

(declare-fun tp!49362 () Bool)

(declare-fun b_and!23065 () Bool)

(assert (=> start!73038 (= tp!49362 b_and!23065)))

(declare-fun res!576827 () Bool)

(declare-fun e!473702 () Bool)

(assert (=> start!73038 (=> (not res!576827) (not e!473702))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48384 0))(
  ( (array!48385 (arr!23223 (Array (_ BitVec 32) (_ BitVec 64))) (size!23663 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48384)

(assert (=> start!73038 (= res!576827 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23663 _keys!868))))))

(assert (=> start!73038 e!473702))

(declare-fun tp_is_empty!16089 () Bool)

(assert (=> start!73038 tp_is_empty!16089))

(assert (=> start!73038 true))

(assert (=> start!73038 tp!49362))

(declare-fun array_inv!18432 (array!48384) Bool)

(assert (=> start!73038 (array_inv!18432 _keys!868)))

(declare-datatypes ((V!26499 0))(
  ( (V!26500 (val!8092 Int)) )
))
(declare-datatypes ((ValueCell!7605 0))(
  ( (ValueCellFull!7605 (v!10517 V!26499)) (EmptyCell!7605) )
))
(declare-datatypes ((array!48386 0))(
  ( (array!48387 (arr!23224 (Array (_ BitVec 32) ValueCell!7605)) (size!23664 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48386)

(declare-fun e!473697 () Bool)

(declare-fun array_inv!18433 (array!48386) Bool)

(assert (=> start!73038 (and (array_inv!18433 _values!688) e!473697)))

(declare-fun b!849050 () Bool)

(declare-fun res!576823 () Bool)

(assert (=> b!849050 (=> (not res!576823) (not e!473702))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849050 (= res!576823 (and (= (select (arr!23223 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849051 () Bool)

(declare-fun e!473698 () Bool)

(assert (=> b!849051 (= e!473698 true)))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!382176 () array!48386)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10590 0))(
  ( (tuple2!10591 (_1!5306 (_ BitVec 64)) (_2!5306 V!26499)) )
))
(declare-datatypes ((List!16441 0))(
  ( (Nil!16438) (Cons!16437 (h!17568 tuple2!10590) (t!22840 List!16441)) )
))
(declare-datatypes ((ListLongMap!9359 0))(
  ( (ListLongMap!9360 (toList!4695 List!16441)) )
))
(declare-fun lt!382177 () ListLongMap!9359)

(declare-fun minValue!654 () V!26499)

(declare-fun zeroValue!654 () V!26499)

(declare-fun +!2101 (ListLongMap!9359 tuple2!10590) ListLongMap!9359)

(declare-fun getCurrentListMapNoExtraKeys!2677 (array!48384 array!48386 (_ BitVec 32) (_ BitVec 32) V!26499 V!26499 (_ BitVec 32) Int) ListLongMap!9359)

(declare-fun get!12220 (ValueCell!7605 V!26499) V!26499)

(declare-fun dynLambda!992 (Int (_ BitVec 64)) V!26499)

(assert (=> b!849051 (= lt!382177 (+!2101 (getCurrentListMapNoExtraKeys!2677 _keys!868 lt!382176 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10591 (select (arr!23223 _keys!868) from!1053) (get!12220 (select (arr!23224 lt!382176) from!1053) (dynLambda!992 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun call!37714 () ListLongMap!9359)

(declare-fun bm!37711 () Bool)

(assert (=> bm!37711 (= call!37714 (getCurrentListMapNoExtraKeys!2677 _keys!868 lt!382176 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25733 () Bool)

(declare-fun mapRes!25733 () Bool)

(assert (=> mapIsEmpty!25733 mapRes!25733))

(declare-fun b!849052 () Bool)

(declare-fun e!473704 () Bool)

(assert (=> b!849052 (= e!473704 (not e!473698))))

(declare-fun res!576824 () Bool)

(assert (=> b!849052 (=> res!576824 e!473698)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849052 (= res!576824 (not (validKeyInArray!0 (select (arr!23223 _keys!868) from!1053))))))

(declare-fun e!473703 () Bool)

(assert (=> b!849052 e!473703))

(declare-fun c!91600 () Bool)

(assert (=> b!849052 (= c!91600 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26499)

(declare-datatypes ((Unit!28993 0))(
  ( (Unit!28994) )
))
(declare-fun lt!382174 () Unit!28993)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!342 (array!48384 array!48386 (_ BitVec 32) (_ BitVec 32) V!26499 V!26499 (_ BitVec 32) (_ BitVec 64) V!26499 (_ BitVec 32) Int) Unit!28993)

(assert (=> b!849052 (= lt!382174 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!342 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25733 () Bool)

(declare-fun tp!49363 () Bool)

(declare-fun e!473700 () Bool)

(assert (=> mapNonEmpty!25733 (= mapRes!25733 (and tp!49363 e!473700))))

(declare-fun mapRest!25733 () (Array (_ BitVec 32) ValueCell!7605))

(declare-fun mapValue!25733 () ValueCell!7605)

(declare-fun mapKey!25733 () (_ BitVec 32))

(assert (=> mapNonEmpty!25733 (= (arr!23224 _values!688) (store mapRest!25733 mapKey!25733 mapValue!25733))))

(declare-fun b!849053 () Bool)

(declare-fun res!576820 () Bool)

(assert (=> b!849053 (=> (not res!576820) (not e!473702))))

(assert (=> b!849053 (= res!576820 (and (= (size!23664 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23663 _keys!868) (size!23664 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849054 () Bool)

(declare-fun res!576819 () Bool)

(assert (=> b!849054 (=> (not res!576819) (not e!473702))))

(assert (=> b!849054 (= res!576819 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23663 _keys!868))))))

(declare-fun call!37715 () ListLongMap!9359)

(declare-fun bm!37712 () Bool)

(assert (=> bm!37712 (= call!37715 (getCurrentListMapNoExtraKeys!2677 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849055 () Bool)

(assert (=> b!849055 (= e!473702 e!473704)))

(declare-fun res!576821 () Bool)

(assert (=> b!849055 (=> (not res!576821) (not e!473704))))

(assert (=> b!849055 (= res!576821 (= from!1053 i!612))))

(assert (=> b!849055 (= lt!382177 (getCurrentListMapNoExtraKeys!2677 _keys!868 lt!382176 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849055 (= lt!382176 (array!48387 (store (arr!23224 _values!688) i!612 (ValueCellFull!7605 v!557)) (size!23664 _values!688)))))

(declare-fun lt!382175 () ListLongMap!9359)

(assert (=> b!849055 (= lt!382175 (getCurrentListMapNoExtraKeys!2677 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849056 () Bool)

(declare-fun res!576818 () Bool)

(assert (=> b!849056 (=> (not res!576818) (not e!473702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849056 (= res!576818 (validMask!0 mask!1196))))

(declare-fun b!849057 () Bool)

(assert (=> b!849057 (= e!473700 tp_is_empty!16089)))

(declare-fun b!849058 () Bool)

(assert (=> b!849058 (= e!473703 (= call!37714 (+!2101 call!37715 (tuple2!10591 k0!854 v!557))))))

(declare-fun b!849059 () Bool)

(assert (=> b!849059 (= e!473703 (= call!37714 call!37715))))

(declare-fun b!849060 () Bool)

(declare-fun e!473701 () Bool)

(assert (=> b!849060 (= e!473701 tp_is_empty!16089)))

(declare-fun b!849061 () Bool)

(declare-fun res!576825 () Bool)

(assert (=> b!849061 (=> (not res!576825) (not e!473702))))

(assert (=> b!849061 (= res!576825 (validKeyInArray!0 k0!854))))

(declare-fun b!849062 () Bool)

(declare-fun res!576822 () Bool)

(assert (=> b!849062 (=> (not res!576822) (not e!473702))))

(declare-datatypes ((List!16442 0))(
  ( (Nil!16439) (Cons!16438 (h!17569 (_ BitVec 64)) (t!22841 List!16442)) )
))
(declare-fun arrayNoDuplicates!0 (array!48384 (_ BitVec 32) List!16442) Bool)

(assert (=> b!849062 (= res!576822 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16439))))

(declare-fun b!849063 () Bool)

(assert (=> b!849063 (= e!473697 (and e!473701 mapRes!25733))))

(declare-fun condMapEmpty!25733 () Bool)

(declare-fun mapDefault!25733 () ValueCell!7605)

(assert (=> b!849063 (= condMapEmpty!25733 (= (arr!23224 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7605)) mapDefault!25733)))))

(declare-fun b!849064 () Bool)

(declare-fun res!576826 () Bool)

(assert (=> b!849064 (=> (not res!576826) (not e!473702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48384 (_ BitVec 32)) Bool)

(assert (=> b!849064 (= res!576826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73038 res!576827) b!849056))

(assert (= (and b!849056 res!576818) b!849053))

(assert (= (and b!849053 res!576820) b!849064))

(assert (= (and b!849064 res!576826) b!849062))

(assert (= (and b!849062 res!576822) b!849054))

(assert (= (and b!849054 res!576819) b!849061))

(assert (= (and b!849061 res!576825) b!849050))

(assert (= (and b!849050 res!576823) b!849055))

(assert (= (and b!849055 res!576821) b!849052))

(assert (= (and b!849052 c!91600) b!849058))

(assert (= (and b!849052 (not c!91600)) b!849059))

(assert (= (or b!849058 b!849059) bm!37712))

(assert (= (or b!849058 b!849059) bm!37711))

(assert (= (and b!849052 (not res!576824)) b!849051))

(assert (= (and b!849063 condMapEmpty!25733) mapIsEmpty!25733))

(assert (= (and b!849063 (not condMapEmpty!25733)) mapNonEmpty!25733))

(get-info :version)

(assert (= (and mapNonEmpty!25733 ((_ is ValueCellFull!7605) mapValue!25733)) b!849057))

(assert (= (and b!849063 ((_ is ValueCellFull!7605) mapDefault!25733)) b!849060))

(assert (= start!73038 b!849063))

(declare-fun b_lambda!11485 () Bool)

(assert (=> (not b_lambda!11485) (not b!849051)))

(declare-fun t!22839 () Bool)

(declare-fun tb!4255 () Bool)

(assert (=> (and start!73038 (= defaultEntry!696 defaultEntry!696) t!22839) tb!4255))

(declare-fun result!8121 () Bool)

(assert (=> tb!4255 (= result!8121 tp_is_empty!16089)))

(assert (=> b!849051 t!22839))

(declare-fun b_and!23067 () Bool)

(assert (= b_and!23065 (and (=> t!22839 result!8121) b_and!23067)))

(declare-fun m!789771 () Bool)

(assert (=> bm!37712 m!789771))

(declare-fun m!789773 () Bool)

(assert (=> start!73038 m!789773))

(declare-fun m!789775 () Bool)

(assert (=> start!73038 m!789775))

(declare-fun m!789777 () Bool)

(assert (=> b!849061 m!789777))

(declare-fun m!789779 () Bool)

(assert (=> b!849056 m!789779))

(declare-fun m!789781 () Bool)

(assert (=> bm!37711 m!789781))

(declare-fun m!789783 () Bool)

(assert (=> b!849051 m!789783))

(declare-fun m!789785 () Bool)

(assert (=> b!849051 m!789785))

(declare-fun m!789787 () Bool)

(assert (=> b!849051 m!789787))

(assert (=> b!849051 m!789781))

(declare-fun m!789789 () Bool)

(assert (=> b!849051 m!789789))

(assert (=> b!849051 m!789783))

(assert (=> b!849051 m!789781))

(declare-fun m!789791 () Bool)

(assert (=> b!849051 m!789791))

(assert (=> b!849051 m!789785))

(assert (=> b!849052 m!789791))

(assert (=> b!849052 m!789791))

(declare-fun m!789793 () Bool)

(assert (=> b!849052 m!789793))

(declare-fun m!789795 () Bool)

(assert (=> b!849052 m!789795))

(declare-fun m!789797 () Bool)

(assert (=> b!849058 m!789797))

(declare-fun m!789799 () Bool)

(assert (=> b!849062 m!789799))

(declare-fun m!789801 () Bool)

(assert (=> b!849055 m!789801))

(declare-fun m!789803 () Bool)

(assert (=> b!849055 m!789803))

(declare-fun m!789805 () Bool)

(assert (=> b!849055 m!789805))

(declare-fun m!789807 () Bool)

(assert (=> b!849064 m!789807))

(declare-fun m!789809 () Bool)

(assert (=> mapNonEmpty!25733 m!789809))

(declare-fun m!789811 () Bool)

(assert (=> b!849050 m!789811))

(check-sat (not b!849051) (not b_lambda!11485) (not b!849052) b_and!23067 (not b!849061) (not mapNonEmpty!25733) (not bm!37712) (not bm!37711) (not b!849055) (not b!849064) (not b!849056) (not b_next!13953) tp_is_empty!16089 (not b!849062) (not start!73038) (not b!849058))
(check-sat b_and!23067 (not b_next!13953))
