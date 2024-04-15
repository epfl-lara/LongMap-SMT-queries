; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100496 () Bool)

(assert start!100496)

(declare-fun b_free!25825 () Bool)

(declare-fun b_next!25825 () Bool)

(assert (=> start!100496 (= b_free!25825 (not b_next!25825))))

(declare-fun tp!90465 () Bool)

(declare-fun b_and!42515 () Bool)

(assert (=> start!100496 (= tp!90465 b_and!42515)))

(declare-fun b!1200463 () Bool)

(declare-fun e!681730 () Bool)

(declare-fun tp_is_empty!30529 () Bool)

(assert (=> b!1200463 (= e!681730 tp_is_empty!30529)))

(declare-fun mapIsEmpty!47636 () Bool)

(declare-fun mapRes!47636 () Bool)

(assert (=> mapIsEmpty!47636 mapRes!47636))

(declare-fun b!1200464 () Bool)

(declare-fun res!799148 () Bool)

(declare-fun e!681721 () Bool)

(assert (=> b!1200464 (=> (not res!799148) (not e!681721))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200464 (= res!799148 (validMask!0 mask!1564))))

(declare-fun res!799147 () Bool)

(assert (=> start!100496 (=> (not res!799147) (not e!681721))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77756 0))(
  ( (array!77757 (arr!37523 (Array (_ BitVec 32) (_ BitVec 64))) (size!38061 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77756)

(assert (=> start!100496 (= res!799147 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38061 _keys!1208))))))

(assert (=> start!100496 e!681721))

(assert (=> start!100496 tp_is_empty!30529))

(declare-fun array_inv!28706 (array!77756) Bool)

(assert (=> start!100496 (array_inv!28706 _keys!1208)))

(assert (=> start!100496 true))

(assert (=> start!100496 tp!90465))

(declare-datatypes ((V!45833 0))(
  ( (V!45834 (val!15321 Int)) )
))
(declare-datatypes ((ValueCell!14555 0))(
  ( (ValueCellFull!14555 (v!17958 V!45833)) (EmptyCell!14555) )
))
(declare-datatypes ((array!77758 0))(
  ( (array!77759 (arr!37524 (Array (_ BitVec 32) ValueCell!14555)) (size!38062 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77758)

(declare-fun e!681727 () Bool)

(declare-fun array_inv!28707 (array!77758) Bool)

(assert (=> start!100496 (and (array_inv!28707 _values!996) e!681727)))

(declare-datatypes ((tuple2!19700 0))(
  ( (tuple2!19701 (_1!9861 (_ BitVec 64)) (_2!9861 V!45833)) )
))
(declare-datatypes ((List!26491 0))(
  ( (Nil!26488) (Cons!26487 (h!27696 tuple2!19700) (t!39287 List!26491)) )
))
(declare-datatypes ((ListLongMap!17669 0))(
  ( (ListLongMap!17670 (toList!8850 List!26491)) )
))
(declare-fun call!57281 () ListLongMap!17669)

(declare-fun e!681726 () Bool)

(declare-fun b!1200465 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!57282 () ListLongMap!17669)

(declare-fun -!1750 (ListLongMap!17669 (_ BitVec 64)) ListLongMap!17669)

(assert (=> b!1200465 (= e!681726 (= call!57281 (-!1750 call!57282 k0!934)))))

(declare-fun b!1200466 () Bool)

(declare-fun res!799142 () Bool)

(assert (=> b!1200466 (=> (not res!799142) (not e!681721))))

(declare-datatypes ((List!26492 0))(
  ( (Nil!26489) (Cons!26488 (h!27697 (_ BitVec 64)) (t!39288 List!26492)) )
))
(declare-fun arrayNoDuplicates!0 (array!77756 (_ BitVec 32) List!26492) Bool)

(assert (=> b!1200466 (= res!799142 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26489))))

(declare-fun b!1200467 () Bool)

(assert (=> b!1200467 (= e!681727 (and e!681730 mapRes!47636))))

(declare-fun condMapEmpty!47636 () Bool)

(declare-fun mapDefault!47636 () ValueCell!14555)

(assert (=> b!1200467 (= condMapEmpty!47636 (= (arr!37524 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14555)) mapDefault!47636)))))

(declare-fun b!1200468 () Bool)

(declare-fun e!681729 () Bool)

(assert (=> b!1200468 (= e!681729 tp_is_empty!30529)))

(declare-fun b!1200469 () Bool)

(assert (=> b!1200469 (= e!681726 (= call!57281 call!57282))))

(declare-fun b!1200470 () Bool)

(declare-fun res!799143 () Bool)

(assert (=> b!1200470 (=> (not res!799143) (not e!681721))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200470 (= res!799143 (and (= (size!38062 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38061 _keys!1208) (size!38062 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200471 () Bool)

(declare-fun res!799149 () Bool)

(assert (=> b!1200471 (=> (not res!799149) (not e!681721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77756 (_ BitVec 32)) Bool)

(assert (=> b!1200471 (= res!799149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200472 () Bool)

(declare-fun e!681722 () Bool)

(assert (=> b!1200472 (= e!681721 e!681722)))

(declare-fun res!799137 () Bool)

(assert (=> b!1200472 (=> (not res!799137) (not e!681722))))

(declare-fun lt!543909 () array!77756)

(assert (=> b!1200472 (= res!799137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543909 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200472 (= lt!543909 (array!77757 (store (arr!37523 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38061 _keys!1208)))))

(declare-fun b!1200473 () Bool)

(declare-fun res!799139 () Bool)

(assert (=> b!1200473 (=> (not res!799139) (not e!681721))))

(assert (=> b!1200473 (= res!799139 (= (select (arr!37523 _keys!1208) i!673) k0!934))))

(declare-fun b!1200474 () Bool)

(declare-fun e!681724 () Bool)

(assert (=> b!1200474 (= e!681724 true)))

(declare-fun zeroValue!944 () V!45833)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45833)

(declare-fun lt!543905 () Bool)

(declare-fun contains!6848 (ListLongMap!17669 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!5299 (array!77756 array!77758 (_ BitVec 32) (_ BitVec 32) V!45833 V!45833 (_ BitVec 32) Int) ListLongMap!17669)

(assert (=> b!1200474 (= lt!543905 (contains!6848 (getCurrentListMapNoExtraKeys!5299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapNonEmpty!47636 () Bool)

(declare-fun tp!90464 () Bool)

(assert (=> mapNonEmpty!47636 (= mapRes!47636 (and tp!90464 e!681729))))

(declare-fun mapKey!47636 () (_ BitVec 32))

(declare-fun mapValue!47636 () ValueCell!14555)

(declare-fun mapRest!47636 () (Array (_ BitVec 32) ValueCell!14555))

(assert (=> mapNonEmpty!47636 (= (arr!37524 _values!996) (store mapRest!47636 mapKey!47636 mapValue!47636))))

(declare-fun b!1200475 () Bool)

(declare-fun e!681728 () Bool)

(assert (=> b!1200475 (= e!681728 e!681724)))

(declare-fun res!799140 () Bool)

(assert (=> b!1200475 (=> res!799140 e!681724)))

(assert (=> b!1200475 (= res!799140 (not (= (select (arr!37523 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1200475 e!681726))

(declare-fun c!117423 () Bool)

(assert (=> b!1200475 (= c!117423 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39661 0))(
  ( (Unit!39662) )
))
(declare-fun lt!543907 () Unit!39661)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1001 (array!77756 array!77758 (_ BitVec 32) (_ BitVec 32) V!45833 V!45833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39661)

(assert (=> b!1200475 (= lt!543907 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200476 () Bool)

(declare-fun res!799146 () Bool)

(assert (=> b!1200476 (=> (not res!799146) (not e!681721))))

(assert (=> b!1200476 (= res!799146 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38061 _keys!1208))))))

(declare-fun b!1200477 () Bool)

(declare-fun e!681723 () Bool)

(assert (=> b!1200477 (= e!681723 e!681728)))

(declare-fun res!799141 () Bool)

(assert (=> b!1200477 (=> res!799141 e!681728)))

(assert (=> b!1200477 (= res!799141 (not (= from!1455 i!673)))))

(declare-fun lt!543906 () array!77758)

(declare-fun lt!543908 () ListLongMap!17669)

(assert (=> b!1200477 (= lt!543908 (getCurrentListMapNoExtraKeys!5299 lt!543909 lt!543906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3179 (Int (_ BitVec 64)) V!45833)

(assert (=> b!1200477 (= lt!543906 (array!77759 (store (arr!37524 _values!996) i!673 (ValueCellFull!14555 (dynLambda!3179 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38062 _values!996)))))

(declare-fun lt!543904 () ListLongMap!17669)

(assert (=> b!1200477 (= lt!543904 (getCurrentListMapNoExtraKeys!5299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57278 () Bool)

(assert (=> bm!57278 (= call!57281 (getCurrentListMapNoExtraKeys!5299 lt!543909 lt!543906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200478 () Bool)

(declare-fun res!799145 () Bool)

(assert (=> b!1200478 (=> (not res!799145) (not e!681722))))

(assert (=> b!1200478 (= res!799145 (arrayNoDuplicates!0 lt!543909 #b00000000000000000000000000000000 Nil!26489))))

(declare-fun b!1200479 () Bool)

(declare-fun res!799138 () Bool)

(assert (=> b!1200479 (=> (not res!799138) (not e!681721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200479 (= res!799138 (validKeyInArray!0 k0!934))))

(declare-fun b!1200480 () Bool)

(assert (=> b!1200480 (= e!681722 (not e!681723))))

(declare-fun res!799144 () Bool)

(assert (=> b!1200480 (=> res!799144 e!681723)))

(assert (=> b!1200480 (= res!799144 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200480 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543910 () Unit!39661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77756 (_ BitVec 64) (_ BitVec 32)) Unit!39661)

(assert (=> b!1200480 (= lt!543910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!57279 () Bool)

(assert (=> bm!57279 (= call!57282 (getCurrentListMapNoExtraKeys!5299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100496 res!799147) b!1200464))

(assert (= (and b!1200464 res!799148) b!1200470))

(assert (= (and b!1200470 res!799143) b!1200471))

(assert (= (and b!1200471 res!799149) b!1200466))

(assert (= (and b!1200466 res!799142) b!1200476))

(assert (= (and b!1200476 res!799146) b!1200479))

(assert (= (and b!1200479 res!799138) b!1200473))

(assert (= (and b!1200473 res!799139) b!1200472))

(assert (= (and b!1200472 res!799137) b!1200478))

(assert (= (and b!1200478 res!799145) b!1200480))

(assert (= (and b!1200480 (not res!799144)) b!1200477))

(assert (= (and b!1200477 (not res!799141)) b!1200475))

(assert (= (and b!1200475 c!117423) b!1200465))

(assert (= (and b!1200475 (not c!117423)) b!1200469))

(assert (= (or b!1200465 b!1200469) bm!57278))

(assert (= (or b!1200465 b!1200469) bm!57279))

(assert (= (and b!1200475 (not res!799140)) b!1200474))

(assert (= (and b!1200467 condMapEmpty!47636) mapIsEmpty!47636))

(assert (= (and b!1200467 (not condMapEmpty!47636)) mapNonEmpty!47636))

(get-info :version)

(assert (= (and mapNonEmpty!47636 ((_ is ValueCellFull!14555) mapValue!47636)) b!1200468))

(assert (= (and b!1200467 ((_ is ValueCellFull!14555) mapDefault!47636)) b!1200463))

(assert (= start!100496 b!1200467))

(declare-fun b_lambda!21003 () Bool)

(assert (=> (not b_lambda!21003) (not b!1200477)))

(declare-fun t!39286 () Bool)

(declare-fun tb!10617 () Bool)

(assert (=> (and start!100496 (= defaultEntry!1004 defaultEntry!1004) t!39286) tb!10617))

(declare-fun result!21819 () Bool)

(assert (=> tb!10617 (= result!21819 tp_is_empty!30529)))

(assert (=> b!1200477 t!39286))

(declare-fun b_and!42517 () Bool)

(assert (= b_and!42515 (and (=> t!39286 result!21819) b_and!42517)))

(declare-fun m!1106251 () Bool)

(assert (=> b!1200465 m!1106251))

(declare-fun m!1106253 () Bool)

(assert (=> b!1200464 m!1106253))

(declare-fun m!1106255 () Bool)

(assert (=> b!1200472 m!1106255))

(declare-fun m!1106257 () Bool)

(assert (=> b!1200472 m!1106257))

(declare-fun m!1106259 () Bool)

(assert (=> bm!57279 m!1106259))

(declare-fun m!1106261 () Bool)

(assert (=> b!1200471 m!1106261))

(declare-fun m!1106263 () Bool)

(assert (=> b!1200466 m!1106263))

(assert (=> b!1200474 m!1106259))

(assert (=> b!1200474 m!1106259))

(declare-fun m!1106265 () Bool)

(assert (=> b!1200474 m!1106265))

(declare-fun m!1106267 () Bool)

(assert (=> b!1200479 m!1106267))

(declare-fun m!1106269 () Bool)

(assert (=> b!1200477 m!1106269))

(declare-fun m!1106271 () Bool)

(assert (=> b!1200477 m!1106271))

(declare-fun m!1106273 () Bool)

(assert (=> b!1200477 m!1106273))

(declare-fun m!1106275 () Bool)

(assert (=> b!1200477 m!1106275))

(declare-fun m!1106277 () Bool)

(assert (=> b!1200478 m!1106277))

(declare-fun m!1106279 () Bool)

(assert (=> mapNonEmpty!47636 m!1106279))

(declare-fun m!1106281 () Bool)

(assert (=> b!1200480 m!1106281))

(declare-fun m!1106283 () Bool)

(assert (=> b!1200480 m!1106283))

(declare-fun m!1106285 () Bool)

(assert (=> b!1200473 m!1106285))

(declare-fun m!1106287 () Bool)

(assert (=> bm!57278 m!1106287))

(declare-fun m!1106289 () Bool)

(assert (=> start!100496 m!1106289))

(declare-fun m!1106291 () Bool)

(assert (=> start!100496 m!1106291))

(declare-fun m!1106293 () Bool)

(assert (=> b!1200475 m!1106293))

(declare-fun m!1106295 () Bool)

(assert (=> b!1200475 m!1106295))

(check-sat (not b!1200474) (not b!1200464) (not b!1200475) (not b!1200472) (not start!100496) (not mapNonEmpty!47636) (not b_lambda!21003) (not b!1200471) (not b!1200477) (not bm!57279) (not b!1200465) (not b!1200478) tp_is_empty!30529 (not b_next!25825) (not bm!57278) (not b!1200466) (not b!1200480) (not b!1200479) b_and!42517)
(check-sat b_and!42517 (not b_next!25825))
