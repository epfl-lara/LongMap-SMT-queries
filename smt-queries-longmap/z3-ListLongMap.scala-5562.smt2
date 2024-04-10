; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73158 () Bool)

(assert start!73158)

(declare-fun b_free!14073 () Bool)

(declare-fun b_next!14073 () Bool)

(assert (=> start!73158 (= b_free!14073 (not b_next!14073))))

(declare-fun tp!49723 () Bool)

(declare-fun b_and!23305 () Bool)

(assert (=> start!73158 (= tp!49723 b_and!23305)))

(declare-fun b!851870 () Bool)

(declare-fun e!475139 () Bool)

(declare-fun tp_is_empty!16209 () Bool)

(assert (=> b!851870 (= e!475139 tp_is_empty!16209)))

(declare-fun b!851871 () Bool)

(declare-fun res!578626 () Bool)

(declare-fun e!475140 () Bool)

(assert (=> b!851871 (=> (not res!578626) (not e!475140))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48616 0))(
  ( (array!48617 (arr!23339 (Array (_ BitVec 32) (_ BitVec 64))) (size!23779 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48616)

(declare-datatypes ((V!26659 0))(
  ( (V!26660 (val!8152 Int)) )
))
(declare-datatypes ((ValueCell!7665 0))(
  ( (ValueCellFull!7665 (v!10577 V!26659)) (EmptyCell!7665) )
))
(declare-datatypes ((array!48618 0))(
  ( (array!48619 (arr!23340 (Array (_ BitVec 32) ValueCell!7665)) (size!23780 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48618)

(assert (=> b!851871 (= res!578626 (and (= (size!23780 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23779 _keys!868) (size!23780 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851872 () Bool)

(declare-fun e!475143 () Bool)

(declare-datatypes ((tuple2!10698 0))(
  ( (tuple2!10699 (_1!5360 (_ BitVec 64)) (_2!5360 V!26659)) )
))
(declare-datatypes ((List!16533 0))(
  ( (Nil!16530) (Cons!16529 (h!17660 tuple2!10698) (t!23052 List!16533)) )
))
(declare-datatypes ((ListLongMap!9467 0))(
  ( (ListLongMap!9468 (toList!4749 List!16533)) )
))
(declare-fun call!38074 () ListLongMap!9467)

(declare-fun call!38075 () ListLongMap!9467)

(assert (=> b!851872 (= e!475143 (= call!38074 call!38075))))

(declare-fun b!851873 () Bool)

(declare-fun res!578620 () Bool)

(assert (=> b!851873 (=> (not res!578620) (not e!475140))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851873 (= res!578620 (validKeyInArray!0 k0!854))))

(declare-fun b!851874 () Bool)

(declare-fun e!475142 () Bool)

(declare-fun e!475144 () Bool)

(assert (=> b!851874 (= e!475142 (not e!475144))))

(declare-fun res!578619 () Bool)

(assert (=> b!851874 (=> res!578619 e!475144)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!851874 (= res!578619 (not (validKeyInArray!0 (select (arr!23339 _keys!868) from!1053))))))

(assert (=> b!851874 e!475143))

(declare-fun c!91780 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851874 (= c!91780 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29083 0))(
  ( (Unit!29084) )
))
(declare-fun lt!383743 () Unit!29083)

(declare-fun v!557 () V!26659)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26659)

(declare-fun zeroValue!654 () V!26659)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!382 (array!48616 array!48618 (_ BitVec 32) (_ BitVec 32) V!26659 V!26659 (_ BitVec 32) (_ BitVec 64) V!26659 (_ BitVec 32) Int) Unit!29083)

(assert (=> b!851874 (= lt!383743 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!382 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578621 () Bool)

(assert (=> start!73158 (=> (not res!578621) (not e!475140))))

(assert (=> start!73158 (= res!578621 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23779 _keys!868))))))

(assert (=> start!73158 e!475140))

(assert (=> start!73158 tp_is_empty!16209))

(assert (=> start!73158 true))

(assert (=> start!73158 tp!49723))

(declare-fun array_inv!18514 (array!48616) Bool)

(assert (=> start!73158 (array_inv!18514 _keys!868)))

(declare-fun e!475138 () Bool)

(declare-fun array_inv!18515 (array!48618) Bool)

(assert (=> start!73158 (and (array_inv!18515 _values!688) e!475138)))

(declare-fun b!851875 () Bool)

(declare-fun res!578624 () Bool)

(assert (=> b!851875 (=> (not res!578624) (not e!475140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48616 (_ BitVec 32)) Bool)

(assert (=> b!851875 (= res!578624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851876 () Bool)

(declare-fun e!475141 () Bool)

(assert (=> b!851876 (= e!475141 tp_is_empty!16209)))

(declare-fun b!851877 () Bool)

(declare-fun res!578623 () Bool)

(assert (=> b!851877 (=> (not res!578623) (not e!475140))))

(assert (=> b!851877 (= res!578623 (and (= (select (arr!23339 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851878 () Bool)

(assert (=> b!851878 (= e!475140 e!475142)))

(declare-fun res!578618 () Bool)

(assert (=> b!851878 (=> (not res!578618) (not e!475142))))

(assert (=> b!851878 (= res!578618 (= from!1053 i!612))))

(declare-fun lt!383742 () ListLongMap!9467)

(declare-fun lt!383735 () array!48618)

(declare-fun getCurrentListMapNoExtraKeys!2731 (array!48616 array!48618 (_ BitVec 32) (_ BitVec 32) V!26659 V!26659 (_ BitVec 32) Int) ListLongMap!9467)

(assert (=> b!851878 (= lt!383742 (getCurrentListMapNoExtraKeys!2731 _keys!868 lt!383735 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851878 (= lt!383735 (array!48619 (store (arr!23340 _values!688) i!612 (ValueCellFull!7665 v!557)) (size!23780 _values!688)))))

(declare-fun lt!383740 () ListLongMap!9467)

(assert (=> b!851878 (= lt!383740 (getCurrentListMapNoExtraKeys!2731 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25913 () Bool)

(declare-fun mapRes!25913 () Bool)

(declare-fun tp!49722 () Bool)

(assert (=> mapNonEmpty!25913 (= mapRes!25913 (and tp!49722 e!475139))))

(declare-fun mapValue!25913 () ValueCell!7665)

(declare-fun mapRest!25913 () (Array (_ BitVec 32) ValueCell!7665))

(declare-fun mapKey!25913 () (_ BitVec 32))

(assert (=> mapNonEmpty!25913 (= (arr!23340 _values!688) (store mapRest!25913 mapKey!25913 mapValue!25913))))

(declare-fun b!851879 () Bool)

(assert (=> b!851879 (= e!475144 true)))

(declare-fun lt!383738 () V!26659)

(declare-fun lt!383739 () tuple2!10698)

(declare-fun lt!383734 () ListLongMap!9467)

(declare-fun +!2148 (ListLongMap!9467 tuple2!10698) ListLongMap!9467)

(assert (=> b!851879 (= (+!2148 lt!383734 lt!383739) (+!2148 (+!2148 lt!383734 (tuple2!10699 k0!854 lt!383738)) lt!383739))))

(declare-fun lt!383737 () V!26659)

(assert (=> b!851879 (= lt!383739 (tuple2!10699 k0!854 lt!383737))))

(declare-fun lt!383736 () Unit!29083)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!279 (ListLongMap!9467 (_ BitVec 64) V!26659 V!26659) Unit!29083)

(assert (=> b!851879 (= lt!383736 (addSameAsAddTwiceSameKeyDiffValues!279 lt!383734 k0!854 lt!383738 lt!383737))))

(declare-fun lt!383741 () V!26659)

(declare-fun get!12301 (ValueCell!7665 V!26659) V!26659)

(assert (=> b!851879 (= lt!383738 (get!12301 (select (arr!23340 _values!688) from!1053) lt!383741))))

(assert (=> b!851879 (= lt!383742 (+!2148 lt!383734 (tuple2!10699 (select (arr!23339 _keys!868) from!1053) lt!383737)))))

(assert (=> b!851879 (= lt!383737 (get!12301 (select (store (arr!23340 _values!688) i!612 (ValueCellFull!7665 v!557)) from!1053) lt!383741))))

(declare-fun dynLambda!1033 (Int (_ BitVec 64)) V!26659)

(assert (=> b!851879 (= lt!383741 (dynLambda!1033 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851879 (= lt!383734 (getCurrentListMapNoExtraKeys!2731 _keys!868 lt!383735 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38071 () Bool)

(assert (=> bm!38071 (= call!38075 (getCurrentListMapNoExtraKeys!2731 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851880 () Bool)

(assert (=> b!851880 (= e!475138 (and e!475141 mapRes!25913))))

(declare-fun condMapEmpty!25913 () Bool)

(declare-fun mapDefault!25913 () ValueCell!7665)

(assert (=> b!851880 (= condMapEmpty!25913 (= (arr!23340 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7665)) mapDefault!25913)))))

(declare-fun mapIsEmpty!25913 () Bool)

(assert (=> mapIsEmpty!25913 mapRes!25913))

(declare-fun b!851881 () Bool)

(declare-fun res!578625 () Bool)

(assert (=> b!851881 (=> (not res!578625) (not e!475140))))

(assert (=> b!851881 (= res!578625 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23779 _keys!868))))))

(declare-fun b!851882 () Bool)

(assert (=> b!851882 (= e!475143 (= call!38074 (+!2148 call!38075 (tuple2!10699 k0!854 v!557))))))

(declare-fun b!851883 () Bool)

(declare-fun res!578622 () Bool)

(assert (=> b!851883 (=> (not res!578622) (not e!475140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851883 (= res!578622 (validMask!0 mask!1196))))

(declare-fun bm!38072 () Bool)

(assert (=> bm!38072 (= call!38074 (getCurrentListMapNoExtraKeys!2731 _keys!868 lt!383735 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851884 () Bool)

(declare-fun res!578627 () Bool)

(assert (=> b!851884 (=> (not res!578627) (not e!475140))))

(declare-datatypes ((List!16534 0))(
  ( (Nil!16531) (Cons!16530 (h!17661 (_ BitVec 64)) (t!23053 List!16534)) )
))
(declare-fun arrayNoDuplicates!0 (array!48616 (_ BitVec 32) List!16534) Bool)

(assert (=> b!851884 (= res!578627 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16531))))

(assert (= (and start!73158 res!578621) b!851883))

(assert (= (and b!851883 res!578622) b!851871))

(assert (= (and b!851871 res!578626) b!851875))

(assert (= (and b!851875 res!578624) b!851884))

(assert (= (and b!851884 res!578627) b!851881))

(assert (= (and b!851881 res!578625) b!851873))

(assert (= (and b!851873 res!578620) b!851877))

(assert (= (and b!851877 res!578623) b!851878))

(assert (= (and b!851878 res!578618) b!851874))

(assert (= (and b!851874 c!91780) b!851882))

(assert (= (and b!851874 (not c!91780)) b!851872))

(assert (= (or b!851882 b!851872) bm!38072))

(assert (= (or b!851882 b!851872) bm!38071))

(assert (= (and b!851874 (not res!578619)) b!851879))

(assert (= (and b!851880 condMapEmpty!25913) mapIsEmpty!25913))

(assert (= (and b!851880 (not condMapEmpty!25913)) mapNonEmpty!25913))

(get-info :version)

(assert (= (and mapNonEmpty!25913 ((_ is ValueCellFull!7665) mapValue!25913)) b!851870))

(assert (= (and b!851880 ((_ is ValueCellFull!7665) mapDefault!25913)) b!851876))

(assert (= start!73158 b!851880))

(declare-fun b_lambda!11605 () Bool)

(assert (=> (not b_lambda!11605) (not b!851879)))

(declare-fun t!23051 () Bool)

(declare-fun tb!4375 () Bool)

(assert (=> (and start!73158 (= defaultEntry!696 defaultEntry!696) t!23051) tb!4375))

(declare-fun result!8361 () Bool)

(assert (=> tb!4375 (= result!8361 tp_is_empty!16209)))

(assert (=> b!851879 t!23051))

(declare-fun b_and!23307 () Bool)

(assert (= b_and!23305 (and (=> t!23051 result!8361) b_and!23307)))

(declare-fun m!792847 () Bool)

(assert (=> b!851878 m!792847))

(declare-fun m!792849 () Bool)

(assert (=> b!851878 m!792849))

(declare-fun m!792851 () Bool)

(assert (=> b!851878 m!792851))

(declare-fun m!792853 () Bool)

(assert (=> b!851874 m!792853))

(assert (=> b!851874 m!792853))

(declare-fun m!792855 () Bool)

(assert (=> b!851874 m!792855))

(declare-fun m!792857 () Bool)

(assert (=> b!851874 m!792857))

(declare-fun m!792859 () Bool)

(assert (=> b!851879 m!792859))

(declare-fun m!792861 () Bool)

(assert (=> b!851879 m!792861))

(declare-fun m!792863 () Bool)

(assert (=> b!851879 m!792863))

(declare-fun m!792865 () Bool)

(assert (=> b!851879 m!792865))

(declare-fun m!792867 () Bool)

(assert (=> b!851879 m!792867))

(declare-fun m!792869 () Bool)

(assert (=> b!851879 m!792869))

(declare-fun m!792871 () Bool)

(assert (=> b!851879 m!792871))

(declare-fun m!792873 () Bool)

(assert (=> b!851879 m!792873))

(declare-fun m!792875 () Bool)

(assert (=> b!851879 m!792875))

(declare-fun m!792877 () Bool)

(assert (=> b!851879 m!792877))

(assert (=> b!851879 m!792869))

(assert (=> b!851879 m!792849))

(assert (=> b!851879 m!792875))

(assert (=> b!851879 m!792863))

(assert (=> b!851879 m!792853))

(declare-fun m!792879 () Bool)

(assert (=> b!851879 m!792879))

(declare-fun m!792881 () Bool)

(assert (=> b!851884 m!792881))

(declare-fun m!792883 () Bool)

(assert (=> mapNonEmpty!25913 m!792883))

(declare-fun m!792885 () Bool)

(assert (=> b!851875 m!792885))

(declare-fun m!792887 () Bool)

(assert (=> start!73158 m!792887))

(declare-fun m!792889 () Bool)

(assert (=> start!73158 m!792889))

(declare-fun m!792891 () Bool)

(assert (=> bm!38071 m!792891))

(assert (=> bm!38072 m!792873))

(declare-fun m!792893 () Bool)

(assert (=> b!851877 m!792893))

(declare-fun m!792895 () Bool)

(assert (=> b!851882 m!792895))

(declare-fun m!792897 () Bool)

(assert (=> b!851883 m!792897))

(declare-fun m!792899 () Bool)

(assert (=> b!851873 m!792899))

(check-sat b_and!23307 (not b!851874) (not bm!38072) (not b_next!14073) tp_is_empty!16209 (not start!73158) (not b!851879) (not b!851873) (not b!851884) (not b!851882) (not b!851875) (not b_lambda!11605) (not b!851878) (not bm!38071) (not mapNonEmpty!25913) (not b!851883))
(check-sat b_and!23307 (not b_next!14073))
