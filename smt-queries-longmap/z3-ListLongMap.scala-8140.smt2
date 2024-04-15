; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99700 () Bool)

(assert start!99700)

(declare-fun b_free!25285 () Bool)

(declare-fun b_next!25285 () Bool)

(assert (=> start!99700 (= b_free!25285 (not b_next!25285))))

(declare-fun tp!88569 () Bool)

(declare-fun b_and!41415 () Bool)

(assert (=> start!99700 (= tp!88569 b_and!41415)))

(declare-fun b!1182997 () Bool)

(declare-fun e!672581 () Bool)

(declare-fun e!672588 () Bool)

(assert (=> b!1182997 (= e!672581 (not e!672588))))

(declare-fun res!786251 () Bool)

(assert (=> b!1182997 (=> res!786251 e!672588)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182997 (= res!786251 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76364 0))(
  ( (array!76365 (arr!36832 (Array (_ BitVec 32) (_ BitVec 64))) (size!37370 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76364)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182997 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39006 0))(
  ( (Unit!39007) )
))
(declare-fun lt!535684 () Unit!39006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76364 (_ BitVec 64) (_ BitVec 32)) Unit!39006)

(assert (=> b!1182997 (= lt!535684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46550 () Bool)

(declare-fun mapRes!46550 () Bool)

(declare-fun tp!88568 () Bool)

(declare-fun e!672584 () Bool)

(assert (=> mapNonEmpty!46550 (= mapRes!46550 (and tp!88568 e!672584))))

(declare-fun mapKey!46550 () (_ BitVec 32))

(declare-datatypes ((V!44881 0))(
  ( (V!44882 (val!14964 Int)) )
))
(declare-datatypes ((ValueCell!14198 0))(
  ( (ValueCellFull!14198 (v!17601 V!44881)) (EmptyCell!14198) )
))
(declare-fun mapRest!46550 () (Array (_ BitVec 32) ValueCell!14198))

(declare-fun mapValue!46550 () ValueCell!14198)

(declare-datatypes ((array!76366 0))(
  ( (array!76367 (arr!36833 (Array (_ BitVec 32) ValueCell!14198)) (size!37371 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76366)

(assert (=> mapNonEmpty!46550 (= (arr!36833 _values!996) (store mapRest!46550 mapKey!46550 mapValue!46550))))

(declare-fun b!1182998 () Bool)

(declare-fun res!786255 () Bool)

(declare-fun e!672592 () Bool)

(assert (=> b!1182998 (=> (not res!786255) (not e!672592))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76364 (_ BitVec 32)) Bool)

(assert (=> b!1182998 (= res!786255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182999 () Bool)

(declare-fun res!786258 () Bool)

(assert (=> b!1182999 (=> (not res!786258) (not e!672581))))

(declare-fun lt!535690 () array!76364)

(declare-datatypes ((List!25999 0))(
  ( (Nil!25996) (Cons!25995 (h!27204 (_ BitVec 64)) (t!38267 List!25999)) )
))
(declare-fun arrayNoDuplicates!0 (array!76364 (_ BitVec 32) List!25999) Bool)

(assert (=> b!1182999 (= res!786258 (arrayNoDuplicates!0 lt!535690 #b00000000000000000000000000000000 Nil!25996))))

(declare-fun b!1183000 () Bool)

(declare-fun e!672591 () Bool)

(assert (=> b!1183000 (= e!672588 e!672591)))

(declare-fun res!786253 () Bool)

(assert (=> b!1183000 (=> res!786253 e!672591)))

(assert (=> b!1183000 (= res!786253 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44881)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19292 0))(
  ( (tuple2!19293 (_1!9657 (_ BitVec 64)) (_2!9657 V!44881)) )
))
(declare-datatypes ((List!26000 0))(
  ( (Nil!25997) (Cons!25996 (h!27205 tuple2!19292) (t!38268 List!26000)) )
))
(declare-datatypes ((ListLongMap!17261 0))(
  ( (ListLongMap!17262 (toList!8646 List!26000)) )
))
(declare-fun lt!535683 () ListLongMap!17261)

(declare-fun lt!535698 () array!76366)

(declare-fun minValue!944 () V!44881)

(declare-fun getCurrentListMapNoExtraKeys!5101 (array!76364 array!76366 (_ BitVec 32) (_ BitVec 32) V!44881 V!44881 (_ BitVec 32) Int) ListLongMap!17261)

(assert (=> b!1183000 (= lt!535683 (getCurrentListMapNoExtraKeys!5101 lt!535690 lt!535698 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535697 () V!44881)

(assert (=> b!1183000 (= lt!535698 (array!76367 (store (arr!36833 _values!996) i!673 (ValueCellFull!14198 lt!535697)) (size!37371 _values!996)))))

(declare-fun dynLambda!3007 (Int (_ BitVec 64)) V!44881)

(assert (=> b!1183000 (= lt!535697 (dynLambda!3007 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535691 () ListLongMap!17261)

(assert (=> b!1183000 (= lt!535691 (getCurrentListMapNoExtraKeys!5101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183001 () Bool)

(declare-fun res!786254 () Bool)

(assert (=> b!1183001 (=> (not res!786254) (not e!672592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183001 (= res!786254 (validMask!0 mask!1564))))

(declare-fun b!1183002 () Bool)

(assert (=> b!1183002 (= e!672592 e!672581)))

(declare-fun res!786256 () Bool)

(assert (=> b!1183002 (=> (not res!786256) (not e!672581))))

(assert (=> b!1183002 (= res!786256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535690 mask!1564))))

(assert (=> b!1183002 (= lt!535690 (array!76365 (store (arr!36832 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37370 _keys!1208)))))

(declare-fun b!1183003 () Bool)

(declare-fun e!672589 () Unit!39006)

(declare-fun Unit!39008 () Unit!39006)

(assert (=> b!1183003 (= e!672589 Unit!39008)))

(declare-fun res!786257 () Bool)

(assert (=> start!99700 (=> (not res!786257) (not e!672592))))

(assert (=> start!99700 (= res!786257 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37370 _keys!1208))))))

(assert (=> start!99700 e!672592))

(declare-fun tp_is_empty!29815 () Bool)

(assert (=> start!99700 tp_is_empty!29815))

(declare-fun array_inv!28224 (array!76364) Bool)

(assert (=> start!99700 (array_inv!28224 _keys!1208)))

(assert (=> start!99700 true))

(assert (=> start!99700 tp!88569))

(declare-fun e!672590 () Bool)

(declare-fun array_inv!28225 (array!76366) Bool)

(assert (=> start!99700 (and (array_inv!28225 _values!996) e!672590)))

(declare-fun b!1183004 () Bool)

(declare-fun e!672583 () Bool)

(assert (=> b!1183004 (= e!672590 (and e!672583 mapRes!46550))))

(declare-fun condMapEmpty!46550 () Bool)

(declare-fun mapDefault!46550 () ValueCell!14198)

(assert (=> b!1183004 (= condMapEmpty!46550 (= (arr!36833 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14198)) mapDefault!46550)))))

(declare-fun b!1183005 () Bool)

(assert (=> b!1183005 (= e!672583 tp_is_empty!29815)))

(declare-fun b!1183006 () Bool)

(declare-fun Unit!39009 () Unit!39006)

(assert (=> b!1183006 (= e!672589 Unit!39009)))

(declare-fun lt!535689 () Unit!39006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39006)

(assert (=> b!1183006 (= lt!535689 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183006 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535701 () Unit!39006)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76364 (_ BitVec 32) (_ BitVec 32)) Unit!39006)

(assert (=> b!1183006 (= lt!535701 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183006 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25996)))

(declare-fun lt!535694 () Unit!39006)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76364 (_ BitVec 64) (_ BitVec 32) List!25999) Unit!39006)

(assert (=> b!1183006 (= lt!535694 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25996))))

(assert (=> b!1183006 false))

(declare-fun b!1183007 () Bool)

(declare-fun res!786249 () Bool)

(assert (=> b!1183007 (=> (not res!786249) (not e!672592))))

(assert (=> b!1183007 (= res!786249 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25996))))

(declare-fun b!1183008 () Bool)

(declare-fun e!672586 () Bool)

(assert (=> b!1183008 (= e!672591 e!672586)))

(declare-fun res!786250 () Bool)

(assert (=> b!1183008 (=> res!786250 e!672586)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183008 (= res!786250 (not (validKeyInArray!0 (select (arr!36832 _keys!1208) from!1455))))))

(declare-fun lt!535685 () ListLongMap!17261)

(declare-fun lt!535692 () ListLongMap!17261)

(assert (=> b!1183008 (= lt!535685 lt!535692)))

(declare-fun lt!535693 () ListLongMap!17261)

(declare-fun -!1602 (ListLongMap!17261 (_ BitVec 64)) ListLongMap!17261)

(assert (=> b!1183008 (= lt!535692 (-!1602 lt!535693 k0!934))))

(assert (=> b!1183008 (= lt!535685 (getCurrentListMapNoExtraKeys!5101 lt!535690 lt!535698 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183008 (= lt!535693 (getCurrentListMapNoExtraKeys!5101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535688 () Unit!39006)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!864 (array!76364 array!76366 (_ BitVec 32) (_ BitVec 32) V!44881 V!44881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39006)

(assert (=> b!1183008 (= lt!535688 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!864 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!672582 () Bool)

(declare-fun b!1183009 () Bool)

(assert (=> b!1183009 (= e!672582 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183010 () Bool)

(declare-fun res!786252 () Bool)

(assert (=> b!1183010 (=> (not res!786252) (not e!672592))))

(assert (=> b!1183010 (= res!786252 (= (select (arr!36832 _keys!1208) i!673) k0!934))))

(declare-fun b!1183011 () Bool)

(declare-fun e!672587 () Bool)

(assert (=> b!1183011 (= e!672587 e!672582)))

(declare-fun res!786261 () Bool)

(assert (=> b!1183011 (=> res!786261 e!672582)))

(assert (=> b!1183011 (= res!786261 (not (= (select (arr!36832 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183012 () Bool)

(assert (=> b!1183012 (= e!672586 true)))

(declare-fun lt!535686 () ListLongMap!17261)

(declare-fun lt!535700 () ListLongMap!17261)

(assert (=> b!1183012 (= (-!1602 lt!535686 k0!934) lt!535700)))

(declare-fun lt!535699 () V!44881)

(declare-fun lt!535696 () Unit!39006)

(declare-fun addRemoveCommutativeForDiffKeys!150 (ListLongMap!17261 (_ BitVec 64) V!44881 (_ BitVec 64)) Unit!39006)

(assert (=> b!1183012 (= lt!535696 (addRemoveCommutativeForDiffKeys!150 lt!535693 (select (arr!36832 _keys!1208) from!1455) lt!535699 k0!934))))

(assert (=> b!1183012 (and (= lt!535691 lt!535686) (= lt!535692 lt!535685))))

(declare-fun lt!535695 () tuple2!19292)

(declare-fun +!3936 (ListLongMap!17261 tuple2!19292) ListLongMap!17261)

(assert (=> b!1183012 (= lt!535686 (+!3936 lt!535693 lt!535695))))

(assert (=> b!1183012 (not (= (select (arr!36832 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535687 () Unit!39006)

(assert (=> b!1183012 (= lt!535687 e!672589)))

(declare-fun c!117025 () Bool)

(assert (=> b!1183012 (= c!117025 (= (select (arr!36832 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183012 e!672587))

(declare-fun res!786248 () Bool)

(assert (=> b!1183012 (=> (not res!786248) (not e!672587))))

(assert (=> b!1183012 (= res!786248 (= lt!535683 lt!535700))))

(assert (=> b!1183012 (= lt!535700 (+!3936 lt!535692 lt!535695))))

(assert (=> b!1183012 (= lt!535695 (tuple2!19293 (select (arr!36832 _keys!1208) from!1455) lt!535699))))

(declare-fun get!18853 (ValueCell!14198 V!44881) V!44881)

(assert (=> b!1183012 (= lt!535699 (get!18853 (select (arr!36833 _values!996) from!1455) lt!535697))))

(declare-fun b!1183013 () Bool)

(assert (=> b!1183013 (= e!672584 tp_is_empty!29815)))

(declare-fun b!1183014 () Bool)

(declare-fun res!786262 () Bool)

(assert (=> b!1183014 (=> (not res!786262) (not e!672592))))

(assert (=> b!1183014 (= res!786262 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37370 _keys!1208))))))

(declare-fun b!1183015 () Bool)

(declare-fun res!786260 () Bool)

(assert (=> b!1183015 (=> (not res!786260) (not e!672592))))

(assert (=> b!1183015 (= res!786260 (and (= (size!37371 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37370 _keys!1208) (size!37371 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46550 () Bool)

(assert (=> mapIsEmpty!46550 mapRes!46550))

(declare-fun b!1183016 () Bool)

(declare-fun res!786259 () Bool)

(assert (=> b!1183016 (=> (not res!786259) (not e!672592))))

(assert (=> b!1183016 (= res!786259 (validKeyInArray!0 k0!934))))

(assert (= (and start!99700 res!786257) b!1183001))

(assert (= (and b!1183001 res!786254) b!1183015))

(assert (= (and b!1183015 res!786260) b!1182998))

(assert (= (and b!1182998 res!786255) b!1183007))

(assert (= (and b!1183007 res!786249) b!1183014))

(assert (= (and b!1183014 res!786262) b!1183016))

(assert (= (and b!1183016 res!786259) b!1183010))

(assert (= (and b!1183010 res!786252) b!1183002))

(assert (= (and b!1183002 res!786256) b!1182999))

(assert (= (and b!1182999 res!786258) b!1182997))

(assert (= (and b!1182997 (not res!786251)) b!1183000))

(assert (= (and b!1183000 (not res!786253)) b!1183008))

(assert (= (and b!1183008 (not res!786250)) b!1183012))

(assert (= (and b!1183012 res!786248) b!1183011))

(assert (= (and b!1183011 (not res!786261)) b!1183009))

(assert (= (and b!1183012 c!117025) b!1183006))

(assert (= (and b!1183012 (not c!117025)) b!1183003))

(assert (= (and b!1183004 condMapEmpty!46550) mapIsEmpty!46550))

(assert (= (and b!1183004 (not condMapEmpty!46550)) mapNonEmpty!46550))

(get-info :version)

(assert (= (and mapNonEmpty!46550 ((_ is ValueCellFull!14198) mapValue!46550)) b!1183013))

(assert (= (and b!1183004 ((_ is ValueCellFull!14198) mapDefault!46550)) b!1183005))

(assert (= start!99700 b!1183004))

(declare-fun b_lambda!20411 () Bool)

(assert (=> (not b_lambda!20411) (not b!1183000)))

(declare-fun t!38266 () Bool)

(declare-fun tb!10089 () Bool)

(assert (=> (and start!99700 (= defaultEntry!1004 defaultEntry!1004) t!38266) tb!10089))

(declare-fun result!20753 () Bool)

(assert (=> tb!10089 (= result!20753 tp_is_empty!29815)))

(assert (=> b!1183000 t!38266))

(declare-fun b_and!41417 () Bool)

(assert (= b_and!41415 (and (=> t!38266 result!20753) b_and!41417)))

(declare-fun m!1090625 () Bool)

(assert (=> b!1182997 m!1090625))

(declare-fun m!1090627 () Bool)

(assert (=> b!1182997 m!1090627))

(declare-fun m!1090629 () Bool)

(assert (=> b!1183000 m!1090629))

(declare-fun m!1090631 () Bool)

(assert (=> b!1183000 m!1090631))

(declare-fun m!1090633 () Bool)

(assert (=> b!1183000 m!1090633))

(declare-fun m!1090635 () Bool)

(assert (=> b!1183000 m!1090635))

(declare-fun m!1090637 () Bool)

(assert (=> b!1183011 m!1090637))

(declare-fun m!1090639 () Bool)

(assert (=> b!1182999 m!1090639))

(declare-fun m!1090641 () Bool)

(assert (=> b!1183002 m!1090641))

(declare-fun m!1090643 () Bool)

(assert (=> b!1183002 m!1090643))

(declare-fun m!1090645 () Bool)

(assert (=> b!1183008 m!1090645))

(declare-fun m!1090647 () Bool)

(assert (=> b!1183008 m!1090647))

(declare-fun m!1090649 () Bool)

(assert (=> b!1183008 m!1090649))

(declare-fun m!1090651 () Bool)

(assert (=> b!1183008 m!1090651))

(assert (=> b!1183008 m!1090637))

(declare-fun m!1090653 () Bool)

(assert (=> b!1183008 m!1090653))

(assert (=> b!1183008 m!1090637))

(declare-fun m!1090655 () Bool)

(assert (=> b!1183006 m!1090655))

(declare-fun m!1090657 () Bool)

(assert (=> b!1183006 m!1090657))

(declare-fun m!1090659 () Bool)

(assert (=> b!1183006 m!1090659))

(declare-fun m!1090661 () Bool)

(assert (=> b!1183006 m!1090661))

(declare-fun m!1090663 () Bool)

(assert (=> b!1183006 m!1090663))

(declare-fun m!1090665 () Bool)

(assert (=> b!1183007 m!1090665))

(declare-fun m!1090667 () Bool)

(assert (=> b!1183010 m!1090667))

(declare-fun m!1090669 () Bool)

(assert (=> b!1183012 m!1090669))

(assert (=> b!1183012 m!1090637))

(declare-fun m!1090671 () Bool)

(assert (=> b!1183012 m!1090671))

(declare-fun m!1090673 () Bool)

(assert (=> b!1183012 m!1090673))

(assert (=> b!1183012 m!1090673))

(declare-fun m!1090675 () Bool)

(assert (=> b!1183012 m!1090675))

(declare-fun m!1090677 () Bool)

(assert (=> b!1183012 m!1090677))

(declare-fun m!1090679 () Bool)

(assert (=> b!1183012 m!1090679))

(assert (=> b!1183012 m!1090637))

(declare-fun m!1090681 () Bool)

(assert (=> start!99700 m!1090681))

(declare-fun m!1090683 () Bool)

(assert (=> start!99700 m!1090683))

(declare-fun m!1090685 () Bool)

(assert (=> mapNonEmpty!46550 m!1090685))

(declare-fun m!1090687 () Bool)

(assert (=> b!1183001 m!1090687))

(declare-fun m!1090689 () Bool)

(assert (=> b!1182998 m!1090689))

(declare-fun m!1090691 () Bool)

(assert (=> b!1183009 m!1090691))

(declare-fun m!1090693 () Bool)

(assert (=> b!1183016 m!1090693))

(check-sat (not mapNonEmpty!46550) (not b!1182999) (not b!1182997) b_and!41417 (not b!1183016) (not b_next!25285) (not b!1182998) (not b!1183008) (not b!1183009) (not b!1183000) (not start!99700) (not b_lambda!20411) (not b!1183002) (not b!1183012) (not b!1183006) (not b!1183001) tp_is_empty!29815 (not b!1183007))
(check-sat b_and!41417 (not b_next!25285))
