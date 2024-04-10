; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73728 () Bool)

(assert start!73728)

(declare-fun b_free!14643 () Bool)

(declare-fun b_next!14643 () Bool)

(assert (=> start!73728 (= b_free!14643 (not b_next!14643))))

(declare-fun tp!51433 () Bool)

(declare-fun b_and!24265 () Bool)

(assert (=> start!73728 (= tp!51433 b_and!24265)))

(declare-fun mapIsEmpty!26768 () Bool)

(declare-fun mapRes!26768 () Bool)

(assert (=> mapIsEmpty!26768 mapRes!26768))

(declare-fun b!864325 () Bool)

(declare-fun e!481510 () Bool)

(declare-fun tp_is_empty!16779 () Bool)

(assert (=> b!864325 (= e!481510 tp_is_empty!16779)))

(declare-fun b!864326 () Bool)

(declare-fun res!587314 () Bool)

(declare-fun e!481505 () Bool)

(assert (=> b!864326 (=> (not res!587314) (not e!481505))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49720 0))(
  ( (array!49721 (arr!23891 (Array (_ BitVec 32) (_ BitVec 64))) (size!24331 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49720)

(assert (=> b!864326 (= res!587314 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24331 _keys!868))))))

(declare-fun b!864327 () Bool)

(declare-fun res!587309 () Bool)

(assert (=> b!864327 (=> (not res!587309) (not e!481505))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864327 (= res!587309 (validMask!0 mask!1196))))

(declare-fun b!864328 () Bool)

(declare-fun res!587317 () Bool)

(assert (=> b!864328 (=> (not res!587317) (not e!481505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49720 (_ BitVec 32)) Bool)

(assert (=> b!864328 (= res!587317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864329 () Bool)

(declare-fun e!481506 () Bool)

(assert (=> b!864329 (= e!481506 tp_is_empty!16779)))

(declare-fun b!864330 () Bool)

(declare-fun res!587316 () Bool)

(assert (=> b!864330 (=> (not res!587316) (not e!481505))))

(declare-datatypes ((List!16978 0))(
  ( (Nil!16975) (Cons!16974 (h!18105 (_ BitVec 64)) (t!23887 List!16978)) )
))
(declare-fun arrayNoDuplicates!0 (array!49720 (_ BitVec 32) List!16978) Bool)

(assert (=> b!864330 (= res!587316 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16975))))

(declare-fun b!864331 () Bool)

(declare-fun res!587311 () Bool)

(assert (=> b!864331 (=> (not res!587311) (not e!481505))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864331 (= res!587311 (and (= (select (arr!23891 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864333 () Bool)

(declare-datatypes ((Unit!29567 0))(
  ( (Unit!29568) )
))
(declare-fun e!481513 () Unit!29567)

(declare-fun Unit!29569 () Unit!29567)

(assert (=> b!864333 (= e!481513 Unit!29569)))

(declare-fun b!864334 () Bool)

(declare-fun e!481511 () Bool)

(assert (=> b!864334 (= e!481505 e!481511)))

(declare-fun res!587315 () Bool)

(assert (=> b!864334 (=> (not res!587315) (not e!481511))))

(assert (=> b!864334 (= res!587315 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27419 0))(
  ( (V!27420 (val!8437 Int)) )
))
(declare-fun minValue!654 () V!27419)

(declare-datatypes ((ValueCell!7950 0))(
  ( (ValueCellFull!7950 (v!10862 V!27419)) (EmptyCell!7950) )
))
(declare-datatypes ((array!49722 0))(
  ( (array!49723 (arr!23892 (Array (_ BitVec 32) ValueCell!7950)) (size!24332 (_ BitVec 32))) )
))
(declare-fun lt!391093 () array!49722)

(declare-fun zeroValue!654 () V!27419)

(declare-datatypes ((tuple2!11174 0))(
  ( (tuple2!11175 (_1!5598 (_ BitVec 64)) (_2!5598 V!27419)) )
))
(declare-datatypes ((List!16979 0))(
  ( (Nil!16976) (Cons!16975 (h!18106 tuple2!11174) (t!23888 List!16979)) )
))
(declare-datatypes ((ListLongMap!9943 0))(
  ( (ListLongMap!9944 (toList!4987 List!16979)) )
))
(declare-fun lt!391091 () ListLongMap!9943)

(declare-fun getCurrentListMapNoExtraKeys!2959 (array!49720 array!49722 (_ BitVec 32) (_ BitVec 32) V!27419 V!27419 (_ BitVec 32) Int) ListLongMap!9943)

(assert (=> b!864334 (= lt!391091 (getCurrentListMapNoExtraKeys!2959 _keys!868 lt!391093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27419)

(declare-fun _values!688 () array!49722)

(assert (=> b!864334 (= lt!391093 (array!49723 (store (arr!23892 _values!688) i!612 (ValueCellFull!7950 v!557)) (size!24332 _values!688)))))

(declare-fun lt!391086 () ListLongMap!9943)

(assert (=> b!864334 (= lt!391086 (getCurrentListMapNoExtraKeys!2959 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864335 () Bool)

(declare-fun res!587313 () Bool)

(assert (=> b!864335 (=> (not res!587313) (not e!481505))))

(assert (=> b!864335 (= res!587313 (and (= (size!24332 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24331 _keys!868) (size!24332 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864336 () Bool)

(declare-fun e!481507 () Bool)

(assert (=> b!864336 (= e!481507 true)))

(declare-fun lt!391084 () ListLongMap!9943)

(declare-fun lt!391082 () tuple2!11174)

(declare-fun lt!391096 () tuple2!11174)

(declare-fun lt!391088 () ListLongMap!9943)

(declare-fun +!2336 (ListLongMap!9943 tuple2!11174) ListLongMap!9943)

(assert (=> b!864336 (= lt!391088 (+!2336 (+!2336 lt!391084 lt!391096) lt!391082))))

(declare-fun lt!391083 () V!27419)

(declare-fun lt!391094 () Unit!29567)

(declare-fun addCommutativeForDiffKeys!508 (ListLongMap!9943 (_ BitVec 64) V!27419 (_ BitVec 64) V!27419) Unit!29567)

(assert (=> b!864336 (= lt!391094 (addCommutativeForDiffKeys!508 lt!391084 k0!854 v!557 (select (arr!23891 _keys!868) from!1053) lt!391083))))

(declare-fun b!864337 () Bool)

(declare-fun e!481509 () Bool)

(assert (=> b!864337 (= e!481511 (not e!481509))))

(declare-fun res!587318 () Bool)

(assert (=> b!864337 (=> res!587318 e!481509)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864337 (= res!587318 (not (validKeyInArray!0 (select (arr!23891 _keys!868) from!1053))))))

(declare-fun lt!391081 () ListLongMap!9943)

(declare-fun lt!391095 () ListLongMap!9943)

(assert (=> b!864337 (= lt!391081 lt!391095)))

(assert (=> b!864337 (= lt!391095 (+!2336 lt!391084 lt!391082))))

(assert (=> b!864337 (= lt!391081 (getCurrentListMapNoExtraKeys!2959 _keys!868 lt!391093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864337 (= lt!391082 (tuple2!11175 k0!854 v!557))))

(assert (=> b!864337 (= lt!391084 (getCurrentListMapNoExtraKeys!2959 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391085 () Unit!29567)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!539 (array!49720 array!49722 (_ BitVec 32) (_ BitVec 32) V!27419 V!27419 (_ BitVec 32) (_ BitVec 64) V!27419 (_ BitVec 32) Int) Unit!29567)

(assert (=> b!864337 (= lt!391085 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!539 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864338 () Bool)

(assert (=> b!864338 (= e!481509 e!481507)))

(declare-fun res!587308 () Bool)

(assert (=> b!864338 (=> res!587308 e!481507)))

(assert (=> b!864338 (= res!587308 (= k0!854 (select (arr!23891 _keys!868) from!1053)))))

(assert (=> b!864338 (not (= (select (arr!23891 _keys!868) from!1053) k0!854))))

(declare-fun lt!391090 () Unit!29567)

(assert (=> b!864338 (= lt!391090 e!481513)))

(declare-fun c!92185 () Bool)

(assert (=> b!864338 (= c!92185 (= (select (arr!23891 _keys!868) from!1053) k0!854))))

(assert (=> b!864338 (= lt!391091 lt!391088)))

(assert (=> b!864338 (= lt!391088 (+!2336 lt!391095 lt!391096))))

(assert (=> b!864338 (= lt!391096 (tuple2!11175 (select (arr!23891 _keys!868) from!1053) lt!391083))))

(declare-fun get!12620 (ValueCell!7950 V!27419) V!27419)

(declare-fun dynLambda!1162 (Int (_ BitVec 64)) V!27419)

(assert (=> b!864338 (= lt!391083 (get!12620 (select (arr!23892 _values!688) from!1053) (dynLambda!1162 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864339 () Bool)

(declare-fun Unit!29570 () Unit!29567)

(assert (=> b!864339 (= e!481513 Unit!29570)))

(declare-fun lt!391092 () Unit!29567)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49720 (_ BitVec 32) (_ BitVec 32)) Unit!29567)

(assert (=> b!864339 (= lt!391092 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864339 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16975)))

(declare-fun lt!391089 () Unit!29567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29567)

(assert (=> b!864339 (= lt!391089 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864339 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391087 () Unit!29567)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49720 (_ BitVec 64) (_ BitVec 32) List!16978) Unit!29567)

(assert (=> b!864339 (= lt!391087 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16975))))

(assert (=> b!864339 false))

(declare-fun b!864340 () Bool)

(declare-fun e!481508 () Bool)

(assert (=> b!864340 (= e!481508 (and e!481510 mapRes!26768))))

(declare-fun condMapEmpty!26768 () Bool)

(declare-fun mapDefault!26768 () ValueCell!7950)

(assert (=> b!864340 (= condMapEmpty!26768 (= (arr!23892 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7950)) mapDefault!26768)))))

(declare-fun mapNonEmpty!26768 () Bool)

(declare-fun tp!51432 () Bool)

(assert (=> mapNonEmpty!26768 (= mapRes!26768 (and tp!51432 e!481506))))

(declare-fun mapValue!26768 () ValueCell!7950)

(declare-fun mapKey!26768 () (_ BitVec 32))

(declare-fun mapRest!26768 () (Array (_ BitVec 32) ValueCell!7950))

(assert (=> mapNonEmpty!26768 (= (arr!23892 _values!688) (store mapRest!26768 mapKey!26768 mapValue!26768))))

(declare-fun b!864332 () Bool)

(declare-fun res!587312 () Bool)

(assert (=> b!864332 (=> (not res!587312) (not e!481505))))

(assert (=> b!864332 (= res!587312 (validKeyInArray!0 k0!854))))

(declare-fun res!587310 () Bool)

(assert (=> start!73728 (=> (not res!587310) (not e!481505))))

(assert (=> start!73728 (= res!587310 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24331 _keys!868))))))

(assert (=> start!73728 e!481505))

(assert (=> start!73728 tp_is_empty!16779))

(assert (=> start!73728 true))

(assert (=> start!73728 tp!51433))

(declare-fun array_inv!18894 (array!49720) Bool)

(assert (=> start!73728 (array_inv!18894 _keys!868)))

(declare-fun array_inv!18895 (array!49722) Bool)

(assert (=> start!73728 (and (array_inv!18895 _values!688) e!481508)))

(assert (= (and start!73728 res!587310) b!864327))

(assert (= (and b!864327 res!587309) b!864335))

(assert (= (and b!864335 res!587313) b!864328))

(assert (= (and b!864328 res!587317) b!864330))

(assert (= (and b!864330 res!587316) b!864326))

(assert (= (and b!864326 res!587314) b!864332))

(assert (= (and b!864332 res!587312) b!864331))

(assert (= (and b!864331 res!587311) b!864334))

(assert (= (and b!864334 res!587315) b!864337))

(assert (= (and b!864337 (not res!587318)) b!864338))

(assert (= (and b!864338 c!92185) b!864339))

(assert (= (and b!864338 (not c!92185)) b!864333))

(assert (= (and b!864338 (not res!587308)) b!864336))

(assert (= (and b!864340 condMapEmpty!26768) mapIsEmpty!26768))

(assert (= (and b!864340 (not condMapEmpty!26768)) mapNonEmpty!26768))

(get-info :version)

(assert (= (and mapNonEmpty!26768 ((_ is ValueCellFull!7950) mapValue!26768)) b!864329))

(assert (= (and b!864340 ((_ is ValueCellFull!7950) mapDefault!26768)) b!864325))

(assert (= start!73728 b!864340))

(declare-fun b_lambda!11995 () Bool)

(assert (=> (not b_lambda!11995) (not b!864338)))

(declare-fun t!23886 () Bool)

(declare-fun tb!4765 () Bool)

(assert (=> (and start!73728 (= defaultEntry!696 defaultEntry!696) t!23886) tb!4765))

(declare-fun result!9141 () Bool)

(assert (=> tb!4765 (= result!9141 tp_is_empty!16779)))

(assert (=> b!864338 t!23886))

(declare-fun b_and!24267 () Bool)

(assert (= b_and!24265 (and (=> t!23886 result!9141) b_and!24267)))

(declare-fun m!805647 () Bool)

(assert (=> b!864332 m!805647))

(declare-fun m!805649 () Bool)

(assert (=> b!864336 m!805649))

(assert (=> b!864336 m!805649))

(declare-fun m!805651 () Bool)

(assert (=> b!864336 m!805651))

(declare-fun m!805653 () Bool)

(assert (=> b!864336 m!805653))

(assert (=> b!864336 m!805653))

(declare-fun m!805655 () Bool)

(assert (=> b!864336 m!805655))

(declare-fun m!805657 () Bool)

(assert (=> b!864328 m!805657))

(declare-fun m!805659 () Bool)

(assert (=> b!864337 m!805659))

(declare-fun m!805661 () Bool)

(assert (=> b!864337 m!805661))

(assert (=> b!864337 m!805653))

(declare-fun m!805663 () Bool)

(assert (=> b!864337 m!805663))

(assert (=> b!864337 m!805653))

(declare-fun m!805665 () Bool)

(assert (=> b!864337 m!805665))

(declare-fun m!805667 () Bool)

(assert (=> b!864337 m!805667))

(declare-fun m!805669 () Bool)

(assert (=> b!864338 m!805669))

(declare-fun m!805671 () Bool)

(assert (=> b!864338 m!805671))

(declare-fun m!805673 () Bool)

(assert (=> b!864338 m!805673))

(declare-fun m!805675 () Bool)

(assert (=> b!864338 m!805675))

(assert (=> b!864338 m!805671))

(assert (=> b!864338 m!805653))

(assert (=> b!864338 m!805673))

(declare-fun m!805677 () Bool)

(assert (=> start!73728 m!805677))

(declare-fun m!805679 () Bool)

(assert (=> start!73728 m!805679))

(declare-fun m!805681 () Bool)

(assert (=> b!864334 m!805681))

(declare-fun m!805683 () Bool)

(assert (=> b!864334 m!805683))

(declare-fun m!805685 () Bool)

(assert (=> b!864334 m!805685))

(declare-fun m!805687 () Bool)

(assert (=> b!864339 m!805687))

(declare-fun m!805689 () Bool)

(assert (=> b!864339 m!805689))

(declare-fun m!805691 () Bool)

(assert (=> b!864339 m!805691))

(declare-fun m!805693 () Bool)

(assert (=> b!864339 m!805693))

(declare-fun m!805695 () Bool)

(assert (=> b!864339 m!805695))

(declare-fun m!805697 () Bool)

(assert (=> b!864327 m!805697))

(declare-fun m!805699 () Bool)

(assert (=> mapNonEmpty!26768 m!805699))

(declare-fun m!805701 () Bool)

(assert (=> b!864331 m!805701))

(declare-fun m!805703 () Bool)

(assert (=> b!864330 m!805703))

(check-sat (not b!864332) (not b!864337) (not b!864339) (not b!864327) (not b_next!14643) (not mapNonEmpty!26768) (not b!864330) tp_is_empty!16779 b_and!24267 (not b!864338) (not b_lambda!11995) (not b!864328) (not b!864334) (not b!864336) (not start!73728))
(check-sat b_and!24267 (not b_next!14643))
