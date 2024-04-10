; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73548 () Bool)

(assert start!73548)

(declare-fun b_free!14463 () Bool)

(declare-fun b_next!14463 () Bool)

(assert (=> start!73548 (= b_free!14463 (not b_next!14463))))

(declare-fun tp!50893 () Bool)

(declare-fun b_and!23905 () Bool)

(assert (=> start!73548 (= tp!50893 b_and!23905)))

(declare-fun b!859866 () Bool)

(declare-fun e!479169 () Bool)

(assert (=> b!859866 (= e!479169 true)))

(declare-fun lt!387505 () Bool)

(declare-datatypes ((List!16835 0))(
  ( (Nil!16832) (Cons!16831 (h!17962 (_ BitVec 64)) (t!23564 List!16835)) )
))
(declare-fun contains!4226 (List!16835 (_ BitVec 64)) Bool)

(assert (=> b!859866 (= lt!387505 (contains!4226 Nil!16832 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859867 () Bool)

(declare-fun res!584282 () Bool)

(declare-fun e!479165 () Bool)

(assert (=> b!859867 (=> (not res!584282) (not e!479165))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859867 (= res!584282 (validMask!0 mask!1196))))

(declare-fun b!859868 () Bool)

(declare-fun e!479166 () Bool)

(declare-fun e!479173 () Bool)

(assert (=> b!859868 (= e!479166 (not e!479173))))

(declare-fun res!584294 () Bool)

(assert (=> b!859868 (=> res!584294 e!479173)))

(declare-datatypes ((array!49374 0))(
  ( (array!49375 (arr!23718 (Array (_ BitVec 32) (_ BitVec 64))) (size!24158 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49374)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859868 (= res!584294 (not (validKeyInArray!0 (select (arr!23718 _keys!868) from!1053))))))

(declare-datatypes ((V!27179 0))(
  ( (V!27180 (val!8347 Int)) )
))
(declare-datatypes ((tuple2!11026 0))(
  ( (tuple2!11027 (_1!5524 (_ BitVec 64)) (_2!5524 V!27179)) )
))
(declare-datatypes ((List!16836 0))(
  ( (Nil!16833) (Cons!16832 (h!17963 tuple2!11026) (t!23565 List!16836)) )
))
(declare-datatypes ((ListLongMap!9795 0))(
  ( (ListLongMap!9796 (toList!4913 List!16836)) )
))
(declare-fun lt!387513 () ListLongMap!9795)

(declare-fun lt!387509 () ListLongMap!9795)

(assert (=> b!859868 (= lt!387513 lt!387509)))

(declare-fun v!557 () V!27179)

(declare-fun lt!387512 () ListLongMap!9795)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2266 (ListLongMap!9795 tuple2!11026) ListLongMap!9795)

(assert (=> b!859868 (= lt!387509 (+!2266 lt!387512 (tuple2!11027 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7860 0))(
  ( (ValueCellFull!7860 (v!10772 V!27179)) (EmptyCell!7860) )
))
(declare-datatypes ((array!49376 0))(
  ( (array!49377 (arr!23719 (Array (_ BitVec 32) ValueCell!7860)) (size!24159 (_ BitVec 32))) )
))
(declare-fun lt!387511 () array!49376)

(declare-fun minValue!654 () V!27179)

(declare-fun zeroValue!654 () V!27179)

(declare-fun getCurrentListMapNoExtraKeys!2891 (array!49374 array!49376 (_ BitVec 32) (_ BitVec 32) V!27179 V!27179 (_ BitVec 32) Int) ListLongMap!9795)

(assert (=> b!859868 (= lt!387513 (getCurrentListMapNoExtraKeys!2891 _keys!868 lt!387511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49376)

(assert (=> b!859868 (= lt!387512 (getCurrentListMapNoExtraKeys!2891 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29315 0))(
  ( (Unit!29316) )
))
(declare-fun lt!387508 () Unit!29315)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!481 (array!49374 array!49376 (_ BitVec 32) (_ BitVec 32) V!27179 V!27179 (_ BitVec 32) (_ BitVec 64) V!27179 (_ BitVec 32) Int) Unit!29315)

(assert (=> b!859868 (= lt!387508 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!481 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859869 () Bool)

(declare-fun res!584286 () Bool)

(assert (=> b!859869 (=> (not res!584286) (not e!479165))))

(declare-fun arrayNoDuplicates!0 (array!49374 (_ BitVec 32) List!16835) Bool)

(assert (=> b!859869 (= res!584286 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16832))))

(declare-fun b!859870 () Bool)

(declare-fun e!479170 () Bool)

(assert (=> b!859870 (= e!479173 e!479170)))

(declare-fun res!584283 () Bool)

(assert (=> b!859870 (=> res!584283 e!479170)))

(assert (=> b!859870 (= res!584283 (not (= (select (arr!23718 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387514 () ListLongMap!9795)

(declare-fun get!12502 (ValueCell!7860 V!27179) V!27179)

(declare-fun dynLambda!1104 (Int (_ BitVec 64)) V!27179)

(assert (=> b!859870 (= lt!387514 (+!2266 lt!387509 (tuple2!11027 (select (arr!23718 _keys!868) from!1053) (get!12502 (select (arr!23719 _values!688) from!1053) (dynLambda!1104 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859872 () Bool)

(declare-fun e!479167 () Bool)

(declare-fun tp_is_empty!16599 () Bool)

(assert (=> b!859872 (= e!479167 tp_is_empty!16599)))

(declare-fun b!859873 () Bool)

(declare-fun res!584281 () Bool)

(assert (=> b!859873 (=> (not res!584281) (not e!479165))))

(assert (=> b!859873 (= res!584281 (and (= (select (arr!23718 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859874 () Bool)

(assert (=> b!859874 (= e!479170 e!479169)))

(declare-fun res!584287 () Bool)

(assert (=> b!859874 (=> res!584287 e!479169)))

(assert (=> b!859874 (= res!584287 (or (bvsge (size!24158 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24158 _keys!868)) (bvsge from!1053 (size!24158 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859874 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387507 () Unit!29315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29315)

(assert (=> b!859874 (= lt!387507 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859874 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16832)))

(declare-fun lt!387510 () Unit!29315)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49374 (_ BitVec 32) (_ BitVec 32)) Unit!29315)

(assert (=> b!859874 (= lt!387510 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859875 () Bool)

(assert (=> b!859875 (= e!479165 e!479166)))

(declare-fun res!584290 () Bool)

(assert (=> b!859875 (=> (not res!584290) (not e!479166))))

(assert (=> b!859875 (= res!584290 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!859875 (= lt!387514 (getCurrentListMapNoExtraKeys!2891 _keys!868 lt!387511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859875 (= lt!387511 (array!49377 (store (arr!23719 _values!688) i!612 (ValueCellFull!7860 v!557)) (size!24159 _values!688)))))

(declare-fun lt!387506 () ListLongMap!9795)

(assert (=> b!859875 (= lt!387506 (getCurrentListMapNoExtraKeys!2891 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859876 () Bool)

(declare-fun res!584285 () Bool)

(assert (=> b!859876 (=> (not res!584285) (not e!479165))))

(assert (=> b!859876 (= res!584285 (and (= (size!24159 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24158 _keys!868) (size!24159 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859871 () Bool)

(declare-fun res!584293 () Bool)

(assert (=> b!859871 (=> (not res!584293) (not e!479165))))

(assert (=> b!859871 (= res!584293 (validKeyInArray!0 k0!854))))

(declare-fun res!584284 () Bool)

(assert (=> start!73548 (=> (not res!584284) (not e!479165))))

(assert (=> start!73548 (= res!584284 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24158 _keys!868))))))

(assert (=> start!73548 e!479165))

(assert (=> start!73548 tp_is_empty!16599))

(assert (=> start!73548 true))

(assert (=> start!73548 tp!50893))

(declare-fun array_inv!18776 (array!49374) Bool)

(assert (=> start!73548 (array_inv!18776 _keys!868)))

(declare-fun e!479172 () Bool)

(declare-fun array_inv!18777 (array!49376) Bool)

(assert (=> start!73548 (and (array_inv!18777 _values!688) e!479172)))

(declare-fun b!859877 () Bool)

(declare-fun mapRes!26498 () Bool)

(assert (=> b!859877 (= e!479172 (and e!479167 mapRes!26498))))

(declare-fun condMapEmpty!26498 () Bool)

(declare-fun mapDefault!26498 () ValueCell!7860)

(assert (=> b!859877 (= condMapEmpty!26498 (= (arr!23719 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7860)) mapDefault!26498)))))

(declare-fun mapNonEmpty!26498 () Bool)

(declare-fun tp!50892 () Bool)

(declare-fun e!479168 () Bool)

(assert (=> mapNonEmpty!26498 (= mapRes!26498 (and tp!50892 e!479168))))

(declare-fun mapKey!26498 () (_ BitVec 32))

(declare-fun mapValue!26498 () ValueCell!7860)

(declare-fun mapRest!26498 () (Array (_ BitVec 32) ValueCell!7860))

(assert (=> mapNonEmpty!26498 (= (arr!23719 _values!688) (store mapRest!26498 mapKey!26498 mapValue!26498))))

(declare-fun b!859878 () Bool)

(declare-fun res!584291 () Bool)

(assert (=> b!859878 (=> res!584291 e!479169)))

(declare-fun noDuplicate!1308 (List!16835) Bool)

(assert (=> b!859878 (= res!584291 (not (noDuplicate!1308 Nil!16832)))))

(declare-fun mapIsEmpty!26498 () Bool)

(assert (=> mapIsEmpty!26498 mapRes!26498))

(declare-fun b!859879 () Bool)

(assert (=> b!859879 (= e!479168 tp_is_empty!16599)))

(declare-fun b!859880 () Bool)

(declare-fun res!584288 () Bool)

(assert (=> b!859880 (=> (not res!584288) (not e!479165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49374 (_ BitVec 32)) Bool)

(assert (=> b!859880 (= res!584288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859881 () Bool)

(declare-fun res!584289 () Bool)

(assert (=> b!859881 (=> res!584289 e!479169)))

(assert (=> b!859881 (= res!584289 (contains!4226 Nil!16832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859882 () Bool)

(declare-fun res!584292 () Bool)

(assert (=> b!859882 (=> (not res!584292) (not e!479165))))

(assert (=> b!859882 (= res!584292 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24158 _keys!868))))))

(assert (= (and start!73548 res!584284) b!859867))

(assert (= (and b!859867 res!584282) b!859876))

(assert (= (and b!859876 res!584285) b!859880))

(assert (= (and b!859880 res!584288) b!859869))

(assert (= (and b!859869 res!584286) b!859882))

(assert (= (and b!859882 res!584292) b!859871))

(assert (= (and b!859871 res!584293) b!859873))

(assert (= (and b!859873 res!584281) b!859875))

(assert (= (and b!859875 res!584290) b!859868))

(assert (= (and b!859868 (not res!584294)) b!859870))

(assert (= (and b!859870 (not res!584283)) b!859874))

(assert (= (and b!859874 (not res!584287)) b!859878))

(assert (= (and b!859878 (not res!584291)) b!859881))

(assert (= (and b!859881 (not res!584289)) b!859866))

(assert (= (and b!859877 condMapEmpty!26498) mapIsEmpty!26498))

(assert (= (and b!859877 (not condMapEmpty!26498)) mapNonEmpty!26498))

(get-info :version)

(assert (= (and mapNonEmpty!26498 ((_ is ValueCellFull!7860) mapValue!26498)) b!859879))

(assert (= (and b!859877 ((_ is ValueCellFull!7860) mapDefault!26498)) b!859872))

(assert (= start!73548 b!859877))

(declare-fun b_lambda!11815 () Bool)

(assert (=> (not b_lambda!11815) (not b!859870)))

(declare-fun t!23563 () Bool)

(declare-fun tb!4585 () Bool)

(assert (=> (and start!73548 (= defaultEntry!696 defaultEntry!696) t!23563) tb!4585))

(declare-fun result!8781 () Bool)

(assert (=> tb!4585 (= result!8781 tp_is_empty!16599)))

(assert (=> b!859870 t!23563))

(declare-fun b_and!23907 () Bool)

(assert (= b_and!23905 (and (=> t!23563 result!8781) b_and!23907)))

(declare-fun m!800641 () Bool)

(assert (=> b!859874 m!800641))

(declare-fun m!800643 () Bool)

(assert (=> b!859874 m!800643))

(declare-fun m!800645 () Bool)

(assert (=> b!859874 m!800645))

(declare-fun m!800647 () Bool)

(assert (=> b!859874 m!800647))

(declare-fun m!800649 () Bool)

(assert (=> b!859873 m!800649))

(declare-fun m!800651 () Bool)

(assert (=> b!859871 m!800651))

(declare-fun m!800653 () Bool)

(assert (=> b!859867 m!800653))

(declare-fun m!800655 () Bool)

(assert (=> b!859878 m!800655))

(declare-fun m!800657 () Bool)

(assert (=> b!859870 m!800657))

(declare-fun m!800659 () Bool)

(assert (=> b!859870 m!800659))

(declare-fun m!800661 () Bool)

(assert (=> b!859870 m!800661))

(declare-fun m!800663 () Bool)

(assert (=> b!859870 m!800663))

(assert (=> b!859870 m!800659))

(declare-fun m!800665 () Bool)

(assert (=> b!859870 m!800665))

(assert (=> b!859870 m!800661))

(declare-fun m!800667 () Bool)

(assert (=> b!859868 m!800667))

(declare-fun m!800669 () Bool)

(assert (=> b!859868 m!800669))

(declare-fun m!800671 () Bool)

(assert (=> b!859868 m!800671))

(assert (=> b!859868 m!800665))

(declare-fun m!800673 () Bool)

(assert (=> b!859868 m!800673))

(assert (=> b!859868 m!800665))

(declare-fun m!800675 () Bool)

(assert (=> b!859868 m!800675))

(declare-fun m!800677 () Bool)

(assert (=> start!73548 m!800677))

(declare-fun m!800679 () Bool)

(assert (=> start!73548 m!800679))

(declare-fun m!800681 () Bool)

(assert (=> b!859866 m!800681))

(declare-fun m!800683 () Bool)

(assert (=> b!859875 m!800683))

(declare-fun m!800685 () Bool)

(assert (=> b!859875 m!800685))

(declare-fun m!800687 () Bool)

(assert (=> b!859875 m!800687))

(declare-fun m!800689 () Bool)

(assert (=> b!859881 m!800689))

(declare-fun m!800691 () Bool)

(assert (=> mapNonEmpty!26498 m!800691))

(declare-fun m!800693 () Bool)

(assert (=> b!859880 m!800693))

(declare-fun m!800695 () Bool)

(assert (=> b!859869 m!800695))

(check-sat (not b!859869) (not b!859881) (not b_next!14463) (not b!859871) (not b_lambda!11815) (not b!859874) (not b!859867) (not b!859870) (not b!859875) b_and!23907 (not mapNonEmpty!26498) tp_is_empty!16599 (not b!859880) (not b!859878) (not b!859866) (not start!73548) (not b!859868))
(check-sat b_and!23907 (not b_next!14463))
