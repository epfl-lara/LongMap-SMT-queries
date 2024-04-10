; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98086 () Bool)

(assert start!98086)

(declare-fun b_free!23787 () Bool)

(declare-fun b_next!23787 () Bool)

(assert (=> start!98086 (= b_free!23787 (not b_next!23787))))

(declare-fun tp!84065 () Bool)

(declare-fun b_and!38357 () Bool)

(assert (=> start!98086 (= tp!84065 b_and!38357)))

(declare-fun b!1126626 () Bool)

(declare-fun e!641272 () Bool)

(declare-fun e!641277 () Bool)

(declare-fun mapRes!44293 () Bool)

(assert (=> b!1126626 (= e!641272 (and e!641277 mapRes!44293))))

(declare-fun condMapEmpty!44293 () Bool)

(declare-datatypes ((V!42883 0))(
  ( (V!42884 (val!14215 Int)) )
))
(declare-datatypes ((ValueCell!13449 0))(
  ( (ValueCellFull!13449 (v!16848 V!42883)) (EmptyCell!13449) )
))
(declare-datatypes ((array!73497 0))(
  ( (array!73498 (arr!35401 (Array (_ BitVec 32) ValueCell!13449)) (size!35937 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73497)

(declare-fun mapDefault!44293 () ValueCell!13449)

(assert (=> b!1126626 (= condMapEmpty!44293 (= (arr!35401 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13449)) mapDefault!44293)))))

(declare-fun b!1126627 () Bool)

(declare-fun e!641274 () Bool)

(declare-fun tp_is_empty!28317 () Bool)

(assert (=> b!1126627 (= e!641274 tp_is_empty!28317)))

(declare-fun b!1126628 () Bool)

(declare-fun e!641276 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!17874 0))(
  ( (tuple2!17875 (_1!8948 (_ BitVec 64)) (_2!8948 V!42883)) )
))
(declare-datatypes ((List!24650 0))(
  ( (Nil!24647) (Cons!24646 (h!25855 tuple2!17874) (t!35429 List!24650)) )
))
(declare-datatypes ((ListLongMap!15843 0))(
  ( (ListLongMap!15844 (toList!7937 List!24650)) )
))
(declare-fun call!47643 () ListLongMap!15843)

(declare-fun call!47644 () ListLongMap!15843)

(declare-fun -!1131 (ListLongMap!15843 (_ BitVec 64)) ListLongMap!15843)

(assert (=> b!1126628 (= e!641276 (= call!47643 (-!1131 call!47644 k0!934)))))

(declare-fun zeroValue!944 () V!42883)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500299 () array!73497)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47640 () Bool)

(declare-datatypes ((array!73499 0))(
  ( (array!73500 (arr!35402 (Array (_ BitVec 32) (_ BitVec 64))) (size!35938 (_ BitVec 32))) )
))
(declare-fun lt!500296 () array!73499)

(declare-fun minValue!944 () V!42883)

(declare-fun getCurrentListMapNoExtraKeys!4425 (array!73499 array!73497 (_ BitVec 32) (_ BitVec 32) V!42883 V!42883 (_ BitVec 32) Int) ListLongMap!15843)

(assert (=> bm!47640 (= call!47643 (getCurrentListMapNoExtraKeys!4425 lt!500296 lt!500299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!752853 () Bool)

(declare-fun e!641270 () Bool)

(assert (=> start!98086 (=> (not res!752853) (not e!641270))))

(declare-fun _keys!1208 () array!73499)

(assert (=> start!98086 (= res!752853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35938 _keys!1208))))))

(assert (=> start!98086 e!641270))

(assert (=> start!98086 tp_is_empty!28317))

(declare-fun array_inv!27170 (array!73499) Bool)

(assert (=> start!98086 (array_inv!27170 _keys!1208)))

(assert (=> start!98086 true))

(assert (=> start!98086 tp!84065))

(declare-fun array_inv!27171 (array!73497) Bool)

(assert (=> start!98086 (and (array_inv!27171 _values!996) e!641272)))

(declare-fun b!1126629 () Bool)

(declare-fun res!752855 () Bool)

(assert (=> b!1126629 (=> (not res!752855) (not e!641270))))

(assert (=> b!1126629 (= res!752855 (and (= (size!35937 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35938 _keys!1208) (size!35937 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126630 () Bool)

(assert (=> b!1126630 (= e!641276 (= call!47643 call!47644))))

(declare-fun b!1126631 () Bool)

(declare-fun e!641275 () Bool)

(declare-fun e!641273 () Bool)

(assert (=> b!1126631 (= e!641275 e!641273)))

(declare-fun res!752848 () Bool)

(assert (=> b!1126631 (=> res!752848 e!641273)))

(assert (=> b!1126631 (= res!752848 (not (= (select (arr!35402 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126631 e!641276))

(declare-fun c!109671 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126631 (= c!109671 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36920 0))(
  ( (Unit!36921) )
))
(declare-fun lt!500300 () Unit!36920)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!381 (array!73499 array!73497 (_ BitVec 32) (_ BitVec 32) V!42883 V!42883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36920)

(assert (=> b!1126631 (= lt!500300 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126632 () Bool)

(declare-fun e!641269 () Bool)

(assert (=> b!1126632 (= e!641270 e!641269)))

(declare-fun res!752859 () Bool)

(assert (=> b!1126632 (=> (not res!752859) (not e!641269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73499 (_ BitVec 32)) Bool)

(assert (=> b!1126632 (= res!752859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500296 mask!1564))))

(assert (=> b!1126632 (= lt!500296 (array!73500 (store (arr!35402 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35938 _keys!1208)))))

(declare-fun b!1126633 () Bool)

(declare-fun res!752849 () Bool)

(assert (=> b!1126633 (=> (not res!752849) (not e!641270))))

(declare-datatypes ((List!24651 0))(
  ( (Nil!24648) (Cons!24647 (h!25856 (_ BitVec 64)) (t!35430 List!24651)) )
))
(declare-fun arrayNoDuplicates!0 (array!73499 (_ BitVec 32) List!24651) Bool)

(assert (=> b!1126633 (= res!752849 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24648))))

(declare-fun b!1126634 () Bool)

(declare-fun e!641268 () Bool)

(assert (=> b!1126634 (= e!641269 (not e!641268))))

(declare-fun res!752857 () Bool)

(assert (=> b!1126634 (=> res!752857 e!641268)))

(assert (=> b!1126634 (= res!752857 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126634 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500298 () Unit!36920)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73499 (_ BitVec 64) (_ BitVec 32)) Unit!36920)

(assert (=> b!1126634 (= lt!500298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126635 () Bool)

(declare-fun res!752850 () Bool)

(assert (=> b!1126635 (=> (not res!752850) (not e!641270))))

(assert (=> b!1126635 (= res!752850 (= (select (arr!35402 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44293 () Bool)

(assert (=> mapIsEmpty!44293 mapRes!44293))

(declare-fun b!1126636 () Bool)

(declare-fun res!752860 () Bool)

(assert (=> b!1126636 (=> (not res!752860) (not e!641270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126636 (= res!752860 (validMask!0 mask!1564))))

(declare-fun b!1126637 () Bool)

(declare-fun res!752858 () Bool)

(assert (=> b!1126637 (=> (not res!752858) (not e!641270))))

(assert (=> b!1126637 (= res!752858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126638 () Bool)

(declare-fun res!752856 () Bool)

(assert (=> b!1126638 (=> (not res!752856) (not e!641270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126638 (= res!752856 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44293 () Bool)

(declare-fun tp!84064 () Bool)

(assert (=> mapNonEmpty!44293 (= mapRes!44293 (and tp!84064 e!641274))))

(declare-fun mapValue!44293 () ValueCell!13449)

(declare-fun mapKey!44293 () (_ BitVec 32))

(declare-fun mapRest!44293 () (Array (_ BitVec 32) ValueCell!13449))

(assert (=> mapNonEmpty!44293 (= (arr!35401 _values!996) (store mapRest!44293 mapKey!44293 mapValue!44293))))

(declare-fun b!1126639 () Bool)

(declare-fun res!752851 () Bool)

(assert (=> b!1126639 (=> (not res!752851) (not e!641270))))

(assert (=> b!1126639 (= res!752851 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35938 _keys!1208))))))

(declare-fun b!1126640 () Bool)

(assert (=> b!1126640 (= e!641268 e!641275)))

(declare-fun res!752854 () Bool)

(assert (=> b!1126640 (=> res!752854 e!641275)))

(assert (=> b!1126640 (= res!752854 (not (= from!1455 i!673)))))

(declare-fun lt!500297 () ListLongMap!15843)

(assert (=> b!1126640 (= lt!500297 (getCurrentListMapNoExtraKeys!4425 lt!500296 lt!500299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2514 (Int (_ BitVec 64)) V!42883)

(assert (=> b!1126640 (= lt!500299 (array!73498 (store (arr!35401 _values!996) i!673 (ValueCellFull!13449 (dynLambda!2514 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35937 _values!996)))))

(declare-fun lt!500294 () ListLongMap!15843)

(assert (=> b!1126640 (= lt!500294 (getCurrentListMapNoExtraKeys!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47641 () Bool)

(assert (=> bm!47641 (= call!47644 (getCurrentListMapNoExtraKeys!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126641 () Bool)

(assert (=> b!1126641 (= e!641273 true)))

(declare-fun lt!500295 () Bool)

(declare-fun contains!6470 (ListLongMap!15843 (_ BitVec 64)) Bool)

(assert (=> b!1126641 (= lt!500295 (contains!6470 (getCurrentListMapNoExtraKeys!4425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126642 () Bool)

(declare-fun res!752852 () Bool)

(assert (=> b!1126642 (=> (not res!752852) (not e!641269))))

(assert (=> b!1126642 (= res!752852 (arrayNoDuplicates!0 lt!500296 #b00000000000000000000000000000000 Nil!24648))))

(declare-fun b!1126643 () Bool)

(assert (=> b!1126643 (= e!641277 tp_is_empty!28317)))

(assert (= (and start!98086 res!752853) b!1126636))

(assert (= (and b!1126636 res!752860) b!1126629))

(assert (= (and b!1126629 res!752855) b!1126637))

(assert (= (and b!1126637 res!752858) b!1126633))

(assert (= (and b!1126633 res!752849) b!1126639))

(assert (= (and b!1126639 res!752851) b!1126638))

(assert (= (and b!1126638 res!752856) b!1126635))

(assert (= (and b!1126635 res!752850) b!1126632))

(assert (= (and b!1126632 res!752859) b!1126642))

(assert (= (and b!1126642 res!752852) b!1126634))

(assert (= (and b!1126634 (not res!752857)) b!1126640))

(assert (= (and b!1126640 (not res!752854)) b!1126631))

(assert (= (and b!1126631 c!109671) b!1126628))

(assert (= (and b!1126631 (not c!109671)) b!1126630))

(assert (= (or b!1126628 b!1126630) bm!47640))

(assert (= (or b!1126628 b!1126630) bm!47641))

(assert (= (and b!1126631 (not res!752848)) b!1126641))

(assert (= (and b!1126626 condMapEmpty!44293) mapIsEmpty!44293))

(assert (= (and b!1126626 (not condMapEmpty!44293)) mapNonEmpty!44293))

(get-info :version)

(assert (= (and mapNonEmpty!44293 ((_ is ValueCellFull!13449) mapValue!44293)) b!1126627))

(assert (= (and b!1126626 ((_ is ValueCellFull!13449) mapDefault!44293)) b!1126643))

(assert (= start!98086 b!1126626))

(declare-fun b_lambda!18757 () Bool)

(assert (=> (not b_lambda!18757) (not b!1126640)))

(declare-fun t!35428 () Bool)

(declare-fun tb!8599 () Bool)

(assert (=> (and start!98086 (= defaultEntry!1004 defaultEntry!1004) t!35428) tb!8599))

(declare-fun result!17759 () Bool)

(assert (=> tb!8599 (= result!17759 tp_is_empty!28317)))

(assert (=> b!1126640 t!35428))

(declare-fun b_and!38359 () Bool)

(assert (= b_and!38357 (and (=> t!35428 result!17759) b_and!38359)))

(declare-fun m!1040557 () Bool)

(assert (=> b!1126633 m!1040557))

(declare-fun m!1040559 () Bool)

(assert (=> b!1126638 m!1040559))

(declare-fun m!1040561 () Bool)

(assert (=> b!1126637 m!1040561))

(declare-fun m!1040563 () Bool)

(assert (=> b!1126634 m!1040563))

(declare-fun m!1040565 () Bool)

(assert (=> b!1126634 m!1040565))

(declare-fun m!1040567 () Bool)

(assert (=> b!1126635 m!1040567))

(declare-fun m!1040569 () Bool)

(assert (=> b!1126636 m!1040569))

(declare-fun m!1040571 () Bool)

(assert (=> b!1126642 m!1040571))

(declare-fun m!1040573 () Bool)

(assert (=> start!98086 m!1040573))

(declare-fun m!1040575 () Bool)

(assert (=> start!98086 m!1040575))

(declare-fun m!1040577 () Bool)

(assert (=> mapNonEmpty!44293 m!1040577))

(declare-fun m!1040579 () Bool)

(assert (=> b!1126641 m!1040579))

(assert (=> b!1126641 m!1040579))

(declare-fun m!1040581 () Bool)

(assert (=> b!1126641 m!1040581))

(declare-fun m!1040583 () Bool)

(assert (=> b!1126632 m!1040583))

(declare-fun m!1040585 () Bool)

(assert (=> b!1126632 m!1040585))

(declare-fun m!1040587 () Bool)

(assert (=> b!1126640 m!1040587))

(declare-fun m!1040589 () Bool)

(assert (=> b!1126640 m!1040589))

(declare-fun m!1040591 () Bool)

(assert (=> b!1126640 m!1040591))

(declare-fun m!1040593 () Bool)

(assert (=> b!1126640 m!1040593))

(declare-fun m!1040595 () Bool)

(assert (=> b!1126631 m!1040595))

(declare-fun m!1040597 () Bool)

(assert (=> b!1126631 m!1040597))

(assert (=> bm!47641 m!1040579))

(declare-fun m!1040599 () Bool)

(assert (=> b!1126628 m!1040599))

(declare-fun m!1040601 () Bool)

(assert (=> bm!47640 m!1040601))

(check-sat (not bm!47641) (not bm!47640) (not b!1126631) (not b_lambda!18757) (not mapNonEmpty!44293) tp_is_empty!28317 (not b!1126632) (not start!98086) (not b!1126628) (not b!1126641) (not b!1126640) (not b!1126638) (not b!1126633) (not b_next!23787) (not b!1126642) b_and!38359 (not b!1126636) (not b!1126637) (not b!1126634))
(check-sat b_and!38359 (not b_next!23787))
