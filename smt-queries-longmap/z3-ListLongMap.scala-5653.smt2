; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73684 () Bool)

(assert start!73684)

(declare-fun b_free!14617 () Bool)

(declare-fun b_next!14617 () Bool)

(assert (=> start!73684 (= b_free!14617 (not b_next!14617))))

(declare-fun tp!51355 () Bool)

(declare-fun b_and!24187 () Bool)

(assert (=> start!73684 (= tp!51355 b_and!24187)))

(declare-fun b!863436 () Bool)

(declare-fun e!481013 () Bool)

(declare-fun tp_is_empty!16753 () Bool)

(assert (=> b!863436 (= e!481013 tp_is_empty!16753)))

(declare-fun b!863437 () Bool)

(declare-fun e!481011 () Bool)

(assert (=> b!863437 (= e!481011 tp_is_empty!16753)))

(declare-fun b!863438 () Bool)

(declare-fun res!586777 () Bool)

(declare-fun e!481014 () Bool)

(assert (=> b!863438 (=> (not res!586777) (not e!481014))))

(declare-datatypes ((array!49659 0))(
  ( (array!49660 (arr!23861 (Array (_ BitVec 32) (_ BitVec 64))) (size!24303 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49659)

(declare-datatypes ((List!16957 0))(
  ( (Nil!16954) (Cons!16953 (h!18084 (_ BitVec 64)) (t!23831 List!16957)) )
))
(declare-fun arrayNoDuplicates!0 (array!49659 (_ BitVec 32) List!16957) Bool)

(assert (=> b!863438 (= res!586777 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16954))))

(declare-fun b!863439 () Bool)

(declare-fun res!586775 () Bool)

(assert (=> b!863439 (=> (not res!586775) (not e!481014))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!863439 (= res!586775 (and (= (select (arr!23861 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863440 () Bool)

(declare-fun e!481009 () Bool)

(declare-fun e!481012 () Bool)

(assert (=> b!863440 (= e!481009 e!481012)))

(declare-fun res!586776 () Bool)

(assert (=> b!863440 (=> res!586776 e!481012)))

(assert (=> b!863440 (= res!586776 (= k0!854 (select (arr!23861 _keys!868) from!1053)))))

(assert (=> b!863440 (not (= (select (arr!23861 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29450 0))(
  ( (Unit!29451) )
))
(declare-fun lt!390223 () Unit!29450)

(declare-fun e!481006 () Unit!29450)

(assert (=> b!863440 (= lt!390223 e!481006)))

(declare-fun c!92081 () Bool)

(assert (=> b!863440 (= c!92081 (= (select (arr!23861 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27385 0))(
  ( (V!27386 (val!8424 Int)) )
))
(declare-datatypes ((tuple2!11164 0))(
  ( (tuple2!11165 (_1!5593 (_ BitVec 64)) (_2!5593 V!27385)) )
))
(declare-datatypes ((List!16958 0))(
  ( (Nil!16955) (Cons!16954 (h!18085 tuple2!11164) (t!23832 List!16958)) )
))
(declare-datatypes ((ListLongMap!9923 0))(
  ( (ListLongMap!9924 (toList!4977 List!16958)) )
))
(declare-fun lt!390221 () ListLongMap!9923)

(declare-fun lt!390229 () ListLongMap!9923)

(assert (=> b!863440 (= lt!390221 lt!390229)))

(declare-fun lt!390222 () ListLongMap!9923)

(declare-fun lt!390231 () tuple2!11164)

(declare-fun +!2346 (ListLongMap!9923 tuple2!11164) ListLongMap!9923)

(assert (=> b!863440 (= lt!390229 (+!2346 lt!390222 lt!390231))))

(declare-fun lt!390228 () V!27385)

(assert (=> b!863440 (= lt!390231 (tuple2!11165 (select (arr!23861 _keys!868) from!1053) lt!390228))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7937 0))(
  ( (ValueCellFull!7937 (v!10843 V!27385)) (EmptyCell!7937) )
))
(declare-datatypes ((array!49661 0))(
  ( (array!49662 (arr!23862 (Array (_ BitVec 32) ValueCell!7937)) (size!24304 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49661)

(declare-fun get!12601 (ValueCell!7937 V!27385) V!27385)

(declare-fun dynLambda!1148 (Int (_ BitVec 64)) V!27385)

(assert (=> b!863440 (= lt!390228 (get!12601 (select (arr!23862 _values!688) from!1053) (dynLambda!1148 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863441 () Bool)

(declare-fun e!481007 () Bool)

(assert (=> b!863441 (= e!481007 (not e!481009))))

(declare-fun res!586772 () Bool)

(assert (=> b!863441 (=> res!586772 e!481009)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863441 (= res!586772 (not (validKeyInArray!0 (select (arr!23861 _keys!868) from!1053))))))

(declare-fun lt!390234 () ListLongMap!9923)

(assert (=> b!863441 (= lt!390234 lt!390222)))

(declare-fun lt!390236 () ListLongMap!9923)

(declare-fun lt!390224 () tuple2!11164)

(assert (=> b!863441 (= lt!390222 (+!2346 lt!390236 lt!390224))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!390227 () array!49661)

(declare-fun minValue!654 () V!27385)

(declare-fun zeroValue!654 () V!27385)

(declare-fun getCurrentListMapNoExtraKeys!2976 (array!49659 array!49661 (_ BitVec 32) (_ BitVec 32) V!27385 V!27385 (_ BitVec 32) Int) ListLongMap!9923)

(assert (=> b!863441 (= lt!390234 (getCurrentListMapNoExtraKeys!2976 _keys!868 lt!390227 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27385)

(assert (=> b!863441 (= lt!390224 (tuple2!11165 k0!854 v!557))))

(assert (=> b!863441 (= lt!390236 (getCurrentListMapNoExtraKeys!2976 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390225 () Unit!29450)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!527 (array!49659 array!49661 (_ BitVec 32) (_ BitVec 32) V!27385 V!27385 (_ BitVec 32) (_ BitVec 64) V!27385 (_ BitVec 32) Int) Unit!29450)

(assert (=> b!863441 (= lt!390225 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!527 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863442 () Bool)

(declare-fun res!586778 () Bool)

(assert (=> b!863442 (=> (not res!586778) (not e!481014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49659 (_ BitVec 32)) Bool)

(assert (=> b!863442 (= res!586778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863443 () Bool)

(declare-fun e!481010 () Bool)

(declare-fun mapRes!26729 () Bool)

(assert (=> b!863443 (= e!481010 (and e!481013 mapRes!26729))))

(declare-fun condMapEmpty!26729 () Bool)

(declare-fun mapDefault!26729 () ValueCell!7937)

(assert (=> b!863443 (= condMapEmpty!26729 (= (arr!23862 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7937)) mapDefault!26729)))))

(declare-fun b!863444 () Bool)

(assert (=> b!863444 (= e!481012 true)))

(assert (=> b!863444 (= lt!390229 (+!2346 (+!2346 lt!390236 lt!390231) lt!390224))))

(declare-fun lt!390230 () Unit!29450)

(declare-fun addCommutativeForDiffKeys!491 (ListLongMap!9923 (_ BitVec 64) V!27385 (_ BitVec 64) V!27385) Unit!29450)

(assert (=> b!863444 (= lt!390230 (addCommutativeForDiffKeys!491 lt!390236 k0!854 v!557 (select (arr!23861 _keys!868) from!1053) lt!390228))))

(declare-fun res!586769 () Bool)

(assert (=> start!73684 (=> (not res!586769) (not e!481014))))

(assert (=> start!73684 (= res!586769 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24303 _keys!868))))))

(assert (=> start!73684 e!481014))

(assert (=> start!73684 tp_is_empty!16753))

(assert (=> start!73684 true))

(assert (=> start!73684 tp!51355))

(declare-fun array_inv!18944 (array!49659) Bool)

(assert (=> start!73684 (array_inv!18944 _keys!868)))

(declare-fun array_inv!18945 (array!49661) Bool)

(assert (=> start!73684 (and (array_inv!18945 _values!688) e!481010)))

(declare-fun b!863445 () Bool)

(assert (=> b!863445 (= e!481014 e!481007)))

(declare-fun res!586770 () Bool)

(assert (=> b!863445 (=> (not res!586770) (not e!481007))))

(assert (=> b!863445 (= res!586770 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863445 (= lt!390221 (getCurrentListMapNoExtraKeys!2976 _keys!868 lt!390227 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863445 (= lt!390227 (array!49662 (store (arr!23862 _values!688) i!612 (ValueCellFull!7937 v!557)) (size!24304 _values!688)))))

(declare-fun lt!390235 () ListLongMap!9923)

(assert (=> b!863445 (= lt!390235 (getCurrentListMapNoExtraKeys!2976 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863446 () Bool)

(declare-fun Unit!29452 () Unit!29450)

(assert (=> b!863446 (= e!481006 Unit!29452)))

(declare-fun lt!390226 () Unit!29450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49659 (_ BitVec 32) (_ BitVec 32)) Unit!29450)

(assert (=> b!863446 (= lt!390226 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863446 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16954)))

(declare-fun lt!390232 () Unit!29450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49659 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29450)

(assert (=> b!863446 (= lt!390232 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863446 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390233 () Unit!29450)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49659 (_ BitVec 64) (_ BitVec 32) List!16957) Unit!29450)

(assert (=> b!863446 (= lt!390233 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16954))))

(assert (=> b!863446 false))

(declare-fun b!863447 () Bool)

(declare-fun res!586774 () Bool)

(assert (=> b!863447 (=> (not res!586774) (not e!481014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863447 (= res!586774 (validMask!0 mask!1196))))

(declare-fun b!863448 () Bool)

(declare-fun res!586771 () Bool)

(assert (=> b!863448 (=> (not res!586771) (not e!481014))))

(assert (=> b!863448 (= res!586771 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26729 () Bool)

(assert (=> mapIsEmpty!26729 mapRes!26729))

(declare-fun b!863449 () Bool)

(declare-fun Unit!29453 () Unit!29450)

(assert (=> b!863449 (= e!481006 Unit!29453)))

(declare-fun mapNonEmpty!26729 () Bool)

(declare-fun tp!51356 () Bool)

(assert (=> mapNonEmpty!26729 (= mapRes!26729 (and tp!51356 e!481011))))

(declare-fun mapKey!26729 () (_ BitVec 32))

(declare-fun mapRest!26729 () (Array (_ BitVec 32) ValueCell!7937))

(declare-fun mapValue!26729 () ValueCell!7937)

(assert (=> mapNonEmpty!26729 (= (arr!23862 _values!688) (store mapRest!26729 mapKey!26729 mapValue!26729))))

(declare-fun b!863450 () Bool)

(declare-fun res!586773 () Bool)

(assert (=> b!863450 (=> (not res!586773) (not e!481014))))

(assert (=> b!863450 (= res!586773 (and (= (size!24304 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24303 _keys!868) (size!24304 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863451 () Bool)

(declare-fun res!586779 () Bool)

(assert (=> b!863451 (=> (not res!586779) (not e!481014))))

(assert (=> b!863451 (= res!586779 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24303 _keys!868))))))

(assert (= (and start!73684 res!586769) b!863447))

(assert (= (and b!863447 res!586774) b!863450))

(assert (= (and b!863450 res!586773) b!863442))

(assert (= (and b!863442 res!586778) b!863438))

(assert (= (and b!863438 res!586777) b!863451))

(assert (= (and b!863451 res!586779) b!863448))

(assert (= (and b!863448 res!586771) b!863439))

(assert (= (and b!863439 res!586775) b!863445))

(assert (= (and b!863445 res!586770) b!863441))

(assert (= (and b!863441 (not res!586772)) b!863440))

(assert (= (and b!863440 c!92081) b!863446))

(assert (= (and b!863440 (not c!92081)) b!863449))

(assert (= (and b!863440 (not res!586776)) b!863444))

(assert (= (and b!863443 condMapEmpty!26729) mapIsEmpty!26729))

(assert (= (and b!863443 (not condMapEmpty!26729)) mapNonEmpty!26729))

(get-info :version)

(assert (= (and mapNonEmpty!26729 ((_ is ValueCellFull!7937) mapValue!26729)) b!863437))

(assert (= (and b!863443 ((_ is ValueCellFull!7937) mapDefault!26729)) b!863436))

(assert (= start!73684 b!863443))

(declare-fun b_lambda!11951 () Bool)

(assert (=> (not b_lambda!11951) (not b!863440)))

(declare-fun t!23830 () Bool)

(declare-fun tb!4731 () Bool)

(assert (=> (and start!73684 (= defaultEntry!696 defaultEntry!696) t!23830) tb!4731))

(declare-fun result!9081 () Bool)

(assert (=> tb!4731 (= result!9081 tp_is_empty!16753)))

(assert (=> b!863440 t!23830))

(declare-fun b_and!24189 () Bool)

(assert (= b_and!24187 (and (=> t!23830 result!9081) b_and!24189)))

(declare-fun m!804135 () Bool)

(assert (=> start!73684 m!804135))

(declare-fun m!804137 () Bool)

(assert (=> start!73684 m!804137))

(declare-fun m!804139 () Bool)

(assert (=> b!863438 m!804139))

(declare-fun m!804141 () Bool)

(assert (=> b!863439 m!804141))

(declare-fun m!804143 () Bool)

(assert (=> b!863440 m!804143))

(declare-fun m!804145 () Bool)

(assert (=> b!863440 m!804145))

(declare-fun m!804147 () Bool)

(assert (=> b!863440 m!804147))

(declare-fun m!804149 () Bool)

(assert (=> b!863440 m!804149))

(assert (=> b!863440 m!804145))

(declare-fun m!804151 () Bool)

(assert (=> b!863440 m!804151))

(assert (=> b!863440 m!804147))

(declare-fun m!804153 () Bool)

(assert (=> b!863444 m!804153))

(assert (=> b!863444 m!804153))

(declare-fun m!804155 () Bool)

(assert (=> b!863444 m!804155))

(assert (=> b!863444 m!804151))

(assert (=> b!863444 m!804151))

(declare-fun m!804157 () Bool)

(assert (=> b!863444 m!804157))

(declare-fun m!804159 () Bool)

(assert (=> mapNonEmpty!26729 m!804159))

(declare-fun m!804161 () Bool)

(assert (=> b!863447 m!804161))

(declare-fun m!804163 () Bool)

(assert (=> b!863445 m!804163))

(declare-fun m!804165 () Bool)

(assert (=> b!863445 m!804165))

(declare-fun m!804167 () Bool)

(assert (=> b!863445 m!804167))

(declare-fun m!804169 () Bool)

(assert (=> b!863446 m!804169))

(declare-fun m!804171 () Bool)

(assert (=> b!863446 m!804171))

(declare-fun m!804173 () Bool)

(assert (=> b!863446 m!804173))

(declare-fun m!804175 () Bool)

(assert (=> b!863446 m!804175))

(declare-fun m!804177 () Bool)

(assert (=> b!863446 m!804177))

(assert (=> b!863441 m!804151))

(declare-fun m!804179 () Bool)

(assert (=> b!863441 m!804179))

(assert (=> b!863441 m!804151))

(declare-fun m!804181 () Bool)

(assert (=> b!863441 m!804181))

(declare-fun m!804183 () Bool)

(assert (=> b!863441 m!804183))

(declare-fun m!804185 () Bool)

(assert (=> b!863441 m!804185))

(declare-fun m!804187 () Bool)

(assert (=> b!863441 m!804187))

(declare-fun m!804189 () Bool)

(assert (=> b!863448 m!804189))

(declare-fun m!804191 () Bool)

(assert (=> b!863442 m!804191))

(check-sat (not b!863444) (not b!863442) (not b_next!14617) (not b!863448) (not b!863438) b_and!24189 tp_is_empty!16753 (not b!863440) (not mapNonEmpty!26729) (not b_lambda!11951) (not b!863447) (not start!73684) (not b!863445) (not b!863446) (not b!863441))
(check-sat b_and!24189 (not b_next!14617))
