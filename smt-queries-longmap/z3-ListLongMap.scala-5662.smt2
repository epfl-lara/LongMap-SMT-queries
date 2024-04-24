; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73924 () Bool)

(assert start!73924)

(declare-fun b_free!14671 () Bool)

(declare-fun b_next!14671 () Bool)

(assert (=> start!73924 (= b_free!14671 (not b_next!14671))))

(declare-fun tp!51517 () Bool)

(declare-fun b_and!24331 () Bool)

(assert (=> start!73924 (= tp!51517 b_and!24331)))

(declare-fun b!865928 () Bool)

(declare-fun e!482472 () Bool)

(assert (=> b!865928 (= e!482472 true)))

(declare-datatypes ((V!27457 0))(
  ( (V!27458 (val!8451 Int)) )
))
(declare-datatypes ((tuple2!11118 0))(
  ( (tuple2!11119 (_1!5570 (_ BitVec 64)) (_2!5570 V!27457)) )
))
(declare-datatypes ((List!16948 0))(
  ( (Nil!16945) (Cons!16944 (h!18081 tuple2!11118) (t!23877 List!16948)) )
))
(declare-datatypes ((ListLongMap!9889 0))(
  ( (ListLongMap!9890 (toList!4960 List!16948)) )
))
(declare-fun lt!392118 () ListLongMap!9889)

(declare-fun lt!392115 () ListLongMap!9889)

(declare-fun lt!392116 () tuple2!11118)

(declare-fun lt!392123 () tuple2!11118)

(declare-fun +!2363 (ListLongMap!9889 tuple2!11118) ListLongMap!9889)

(assert (=> b!865928 (= lt!392115 (+!2363 (+!2363 lt!392118 lt!392116) lt!392123))))

(declare-fun v!557 () V!27457)

(declare-fun lt!392120 () V!27457)

(declare-datatypes ((array!49825 0))(
  ( (array!49826 (arr!23939 (Array (_ BitVec 32) (_ BitVec 64))) (size!24380 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49825)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((Unit!29599 0))(
  ( (Unit!29600) )
))
(declare-fun lt!392125 () Unit!29599)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!511 (ListLongMap!9889 (_ BitVec 64) V!27457 (_ BitVec 64) V!27457) Unit!29599)

(assert (=> b!865928 (= lt!392125 (addCommutativeForDiffKeys!511 lt!392118 k0!854 v!557 (select (arr!23939 _keys!868) from!1053) lt!392120))))

(declare-fun b!865929 () Bool)

(declare-fun e!482471 () Unit!29599)

(declare-fun Unit!29601 () Unit!29599)

(assert (=> b!865929 (= e!482471 Unit!29601)))

(declare-fun res!588114 () Bool)

(declare-fun e!482473 () Bool)

(assert (=> start!73924 (=> (not res!588114) (not e!482473))))

(assert (=> start!73924 (= res!588114 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24380 _keys!868))))))

(assert (=> start!73924 e!482473))

(declare-fun tp_is_empty!16807 () Bool)

(assert (=> start!73924 tp_is_empty!16807))

(assert (=> start!73924 true))

(assert (=> start!73924 tp!51517))

(declare-fun array_inv!18982 (array!49825) Bool)

(assert (=> start!73924 (array_inv!18982 _keys!868)))

(declare-datatypes ((ValueCell!7964 0))(
  ( (ValueCellFull!7964 (v!10876 V!27457)) (EmptyCell!7964) )
))
(declare-datatypes ((array!49827 0))(
  ( (array!49828 (arr!23940 (Array (_ BitVec 32) ValueCell!7964)) (size!24381 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49827)

(declare-fun e!482470 () Bool)

(declare-fun array_inv!18983 (array!49827) Bool)

(assert (=> start!73924 (and (array_inv!18983 _values!688) e!482470)))

(declare-fun b!865930 () Bool)

(declare-fun res!588116 () Bool)

(assert (=> b!865930 (=> (not res!588116) (not e!482473))))

(declare-datatypes ((List!16949 0))(
  ( (Nil!16946) (Cons!16945 (h!18082 (_ BitVec 64)) (t!23878 List!16949)) )
))
(declare-fun arrayNoDuplicates!0 (array!49825 (_ BitVec 32) List!16949) Bool)

(assert (=> b!865930 (= res!588116 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16946))))

(declare-fun b!865931 () Bool)

(declare-fun e!482469 () Bool)

(assert (=> b!865931 (= e!482473 e!482469)))

(declare-fun res!588124 () Bool)

(assert (=> b!865931 (=> (not res!588124) (not e!482469))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865931 (= res!588124 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392124 () array!49827)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27457)

(declare-fun zeroValue!654 () V!27457)

(declare-fun lt!392129 () ListLongMap!9889)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3010 (array!49825 array!49827 (_ BitVec 32) (_ BitVec 32) V!27457 V!27457 (_ BitVec 32) Int) ListLongMap!9889)

(assert (=> b!865931 (= lt!392129 (getCurrentListMapNoExtraKeys!3010 _keys!868 lt!392124 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865931 (= lt!392124 (array!49828 (store (arr!23940 _values!688) i!612 (ValueCellFull!7964 v!557)) (size!24381 _values!688)))))

(declare-fun lt!392126 () ListLongMap!9889)

(assert (=> b!865931 (= lt!392126 (getCurrentListMapNoExtraKeys!3010 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865932 () Bool)

(declare-fun e!482465 () Bool)

(declare-fun mapRes!26810 () Bool)

(assert (=> b!865932 (= e!482470 (and e!482465 mapRes!26810))))

(declare-fun condMapEmpty!26810 () Bool)

(declare-fun mapDefault!26810 () ValueCell!7964)

(assert (=> b!865932 (= condMapEmpty!26810 (= (arr!23940 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7964)) mapDefault!26810)))))

(declare-fun b!865933 () Bool)

(declare-fun res!588121 () Bool)

(assert (=> b!865933 (=> (not res!588121) (not e!482473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865933 (= res!588121 (validMask!0 mask!1196))))

(declare-fun b!865934 () Bool)

(declare-fun res!588119 () Bool)

(assert (=> b!865934 (=> (not res!588119) (not e!482473))))

(assert (=> b!865934 (= res!588119 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24380 _keys!868))))))

(declare-fun b!865935 () Bool)

(declare-fun res!588117 () Bool)

(assert (=> b!865935 (=> (not res!588117) (not e!482473))))

(assert (=> b!865935 (= res!588117 (and (= (select (arr!23939 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865936 () Bool)

(declare-fun e!482467 () Bool)

(assert (=> b!865936 (= e!482467 e!482472)))

(declare-fun res!588118 () Bool)

(assert (=> b!865936 (=> res!588118 e!482472)))

(assert (=> b!865936 (= res!588118 (= k0!854 (select (arr!23939 _keys!868) from!1053)))))

(assert (=> b!865936 (not (= (select (arr!23939 _keys!868) from!1053) k0!854))))

(declare-fun lt!392127 () Unit!29599)

(assert (=> b!865936 (= lt!392127 e!482471)))

(declare-fun c!92509 () Bool)

(assert (=> b!865936 (= c!92509 (= (select (arr!23939 _keys!868) from!1053) k0!854))))

(assert (=> b!865936 (= lt!392129 lt!392115)))

(declare-fun lt!392128 () ListLongMap!9889)

(assert (=> b!865936 (= lt!392115 (+!2363 lt!392128 lt!392116))))

(assert (=> b!865936 (= lt!392116 (tuple2!11119 (select (arr!23939 _keys!868) from!1053) lt!392120))))

(declare-fun get!12660 (ValueCell!7964 V!27457) V!27457)

(declare-fun dynLambda!1186 (Int (_ BitVec 64)) V!27457)

(assert (=> b!865936 (= lt!392120 (get!12660 (select (arr!23940 _values!688) from!1053) (dynLambda!1186 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!26810 () Bool)

(assert (=> mapIsEmpty!26810 mapRes!26810))

(declare-fun b!865937 () Bool)

(declare-fun res!588123 () Bool)

(assert (=> b!865937 (=> (not res!588123) (not e!482473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49825 (_ BitVec 32)) Bool)

(assert (=> b!865937 (= res!588123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865938 () Bool)

(declare-fun Unit!29602 () Unit!29599)

(assert (=> b!865938 (= e!482471 Unit!29602)))

(declare-fun lt!392122 () Unit!29599)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49825 (_ BitVec 32) (_ BitVec 32)) Unit!29599)

(assert (=> b!865938 (= lt!392122 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865938 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16946)))

(declare-fun lt!392119 () Unit!29599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49825 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29599)

(assert (=> b!865938 (= lt!392119 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865938 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392121 () Unit!29599)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49825 (_ BitVec 64) (_ BitVec 32) List!16949) Unit!29599)

(assert (=> b!865938 (= lt!392121 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16946))))

(assert (=> b!865938 false))

(declare-fun b!865939 () Bool)

(declare-fun res!588120 () Bool)

(assert (=> b!865939 (=> (not res!588120) (not e!482473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865939 (= res!588120 (validKeyInArray!0 k0!854))))

(declare-fun b!865940 () Bool)

(declare-fun e!482466 () Bool)

(assert (=> b!865940 (= e!482466 tp_is_empty!16807)))

(declare-fun b!865941 () Bool)

(assert (=> b!865941 (= e!482469 (not e!482467))))

(declare-fun res!588115 () Bool)

(assert (=> b!865941 (=> res!588115 e!482467)))

(assert (=> b!865941 (= res!588115 (not (validKeyInArray!0 (select (arr!23939 _keys!868) from!1053))))))

(declare-fun lt!392114 () ListLongMap!9889)

(assert (=> b!865941 (= lt!392114 lt!392128)))

(assert (=> b!865941 (= lt!392128 (+!2363 lt!392118 lt!392123))))

(assert (=> b!865941 (= lt!392114 (getCurrentListMapNoExtraKeys!3010 _keys!868 lt!392124 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865941 (= lt!392123 (tuple2!11119 k0!854 v!557))))

(assert (=> b!865941 (= lt!392118 (getCurrentListMapNoExtraKeys!3010 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392117 () Unit!29599)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!545 (array!49825 array!49827 (_ BitVec 32) (_ BitVec 32) V!27457 V!27457 (_ BitVec 32) (_ BitVec 64) V!27457 (_ BitVec 32) Int) Unit!29599)

(assert (=> b!865941 (= lt!392117 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!545 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865942 () Bool)

(declare-fun res!588122 () Bool)

(assert (=> b!865942 (=> (not res!588122) (not e!482473))))

(assert (=> b!865942 (= res!588122 (and (= (size!24381 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24380 _keys!868) (size!24381 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865943 () Bool)

(assert (=> b!865943 (= e!482465 tp_is_empty!16807)))

(declare-fun mapNonEmpty!26810 () Bool)

(declare-fun tp!51518 () Bool)

(assert (=> mapNonEmpty!26810 (= mapRes!26810 (and tp!51518 e!482466))))

(declare-fun mapKey!26810 () (_ BitVec 32))

(declare-fun mapValue!26810 () ValueCell!7964)

(declare-fun mapRest!26810 () (Array (_ BitVec 32) ValueCell!7964))

(assert (=> mapNonEmpty!26810 (= (arr!23940 _values!688) (store mapRest!26810 mapKey!26810 mapValue!26810))))

(assert (= (and start!73924 res!588114) b!865933))

(assert (= (and b!865933 res!588121) b!865942))

(assert (= (and b!865942 res!588122) b!865937))

(assert (= (and b!865937 res!588123) b!865930))

(assert (= (and b!865930 res!588116) b!865934))

(assert (= (and b!865934 res!588119) b!865939))

(assert (= (and b!865939 res!588120) b!865935))

(assert (= (and b!865935 res!588117) b!865931))

(assert (= (and b!865931 res!588124) b!865941))

(assert (= (and b!865941 (not res!588115)) b!865936))

(assert (= (and b!865936 c!92509) b!865938))

(assert (= (and b!865936 (not c!92509)) b!865929))

(assert (= (and b!865936 (not res!588118)) b!865928))

(assert (= (and b!865932 condMapEmpty!26810) mapIsEmpty!26810))

(assert (= (and b!865932 (not condMapEmpty!26810)) mapNonEmpty!26810))

(get-info :version)

(assert (= (and mapNonEmpty!26810 ((_ is ValueCellFull!7964) mapValue!26810)) b!865940))

(assert (= (and b!865932 ((_ is ValueCellFull!7964) mapDefault!26810)) b!865943))

(assert (= start!73924 b!865932))

(declare-fun b_lambda!12037 () Bool)

(assert (=> (not b_lambda!12037) (not b!865936)))

(declare-fun t!23876 () Bool)

(declare-fun tb!4785 () Bool)

(assert (=> (and start!73924 (= defaultEntry!696 defaultEntry!696) t!23876) tb!4785))

(declare-fun result!9189 () Bool)

(assert (=> tb!4785 (= result!9189 tp_is_empty!16807)))

(assert (=> b!865936 t!23876))

(declare-fun b_and!24333 () Bool)

(assert (= b_and!24331 (and (=> t!23876 result!9189) b_and!24333)))

(declare-fun m!807749 () Bool)

(assert (=> b!865936 m!807749))

(declare-fun m!807751 () Bool)

(assert (=> b!865936 m!807751))

(declare-fun m!807753 () Bool)

(assert (=> b!865936 m!807753))

(assert (=> b!865936 m!807749))

(declare-fun m!807755 () Bool)

(assert (=> b!865936 m!807755))

(declare-fun m!807757 () Bool)

(assert (=> b!865936 m!807757))

(assert (=> b!865936 m!807751))

(declare-fun m!807759 () Bool)

(assert (=> b!865937 m!807759))

(declare-fun m!807761 () Bool)

(assert (=> b!865935 m!807761))

(declare-fun m!807763 () Bool)

(assert (=> b!865933 m!807763))

(declare-fun m!807765 () Bool)

(assert (=> start!73924 m!807765))

(declare-fun m!807767 () Bool)

(assert (=> start!73924 m!807767))

(declare-fun m!807769 () Bool)

(assert (=> b!865939 m!807769))

(declare-fun m!807771 () Bool)

(assert (=> b!865941 m!807771))

(assert (=> b!865941 m!807757))

(declare-fun m!807773 () Bool)

(assert (=> b!865941 m!807773))

(assert (=> b!865941 m!807757))

(declare-fun m!807775 () Bool)

(assert (=> b!865941 m!807775))

(declare-fun m!807777 () Bool)

(assert (=> b!865941 m!807777))

(declare-fun m!807779 () Bool)

(assert (=> b!865941 m!807779))

(declare-fun m!807781 () Bool)

(assert (=> b!865930 m!807781))

(declare-fun m!807783 () Bool)

(assert (=> mapNonEmpty!26810 m!807783))

(declare-fun m!807785 () Bool)

(assert (=> b!865928 m!807785))

(assert (=> b!865928 m!807785))

(declare-fun m!807787 () Bool)

(assert (=> b!865928 m!807787))

(assert (=> b!865928 m!807757))

(assert (=> b!865928 m!807757))

(declare-fun m!807789 () Bool)

(assert (=> b!865928 m!807789))

(declare-fun m!807791 () Bool)

(assert (=> b!865938 m!807791))

(declare-fun m!807793 () Bool)

(assert (=> b!865938 m!807793))

(declare-fun m!807795 () Bool)

(assert (=> b!865938 m!807795))

(declare-fun m!807797 () Bool)

(assert (=> b!865938 m!807797))

(declare-fun m!807799 () Bool)

(assert (=> b!865938 m!807799))

(declare-fun m!807801 () Bool)

(assert (=> b!865931 m!807801))

(declare-fun m!807803 () Bool)

(assert (=> b!865931 m!807803))

(declare-fun m!807805 () Bool)

(assert (=> b!865931 m!807805))

(check-sat (not b!865938) (not mapNonEmpty!26810) (not b!865930) (not b!865939) (not b!865936) (not b!865931) (not b_next!14671) tp_is_empty!16807 (not start!73924) (not b!865941) b_and!24333 (not b!865937) (not b!865933) (not b!865928) (not b_lambda!12037))
(check-sat b_and!24333 (not b_next!14671))
