; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99310 () Bool)

(assert start!99310)

(declare-fun b_free!24895 () Bool)

(declare-fun b_next!24895 () Bool)

(assert (=> start!99310 (= b_free!24895 (not b_next!24895))))

(declare-fun tp!87398 () Bool)

(declare-fun b_and!40635 () Bool)

(assert (=> start!99310 (= tp!87398 b_and!40635)))

(declare-fun b!1170419 () Bool)

(declare-fun e!665228 () Bool)

(declare-fun e!665237 () Bool)

(assert (=> b!1170419 (= e!665228 e!665237)))

(declare-fun res!776796 () Bool)

(assert (=> b!1170419 (=> res!776796 e!665237)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170419 (= res!776796 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44361 0))(
  ( (V!44362 (val!14769 Int)) )
))
(declare-fun zeroValue!944 () V!44361)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14003 0))(
  ( (ValueCellFull!14003 (v!17406 V!44361)) (EmptyCell!14003) )
))
(declare-datatypes ((array!75598 0))(
  ( (array!75599 (arr!36449 (Array (_ BitVec 32) ValueCell!14003)) (size!36987 (_ BitVec 32))) )
))
(declare-fun lt!527003 () array!75598)

(declare-datatypes ((tuple2!18954 0))(
  ( (tuple2!18955 (_1!9488 (_ BitVec 64)) (_2!9488 V!44361)) )
))
(declare-datatypes ((List!25667 0))(
  ( (Nil!25664) (Cons!25663 (h!26872 tuple2!18954) (t!37545 List!25667)) )
))
(declare-datatypes ((ListLongMap!16923 0))(
  ( (ListLongMap!16924 (toList!8477 List!25667)) )
))
(declare-fun lt!527010 () ListLongMap!16923)

(declare-fun minValue!944 () V!44361)

(declare-datatypes ((array!75600 0))(
  ( (array!75601 (arr!36450 (Array (_ BitVec 32) (_ BitVec 64))) (size!36988 (_ BitVec 32))) )
))
(declare-fun lt!527006 () array!75600)

(declare-fun getCurrentListMapNoExtraKeys!4952 (array!75600 array!75598 (_ BitVec 32) (_ BitVec 32) V!44361 V!44361 (_ BitVec 32) Int) ListLongMap!16923)

(assert (=> b!1170419 (= lt!527010 (getCurrentListMapNoExtraKeys!4952 lt!527006 lt!527003 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527008 () V!44361)

(declare-fun _values!996 () array!75598)

(assert (=> b!1170419 (= lt!527003 (array!75599 (store (arr!36449 _values!996) i!673 (ValueCellFull!14003 lt!527008)) (size!36987 _values!996)))))

(declare-fun dynLambda!2877 (Int (_ BitVec 64)) V!44361)

(assert (=> b!1170419 (= lt!527008 (dynLambda!2877 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75600)

(declare-fun lt!527009 () ListLongMap!16923)

(assert (=> b!1170419 (= lt!527009 (getCurrentListMapNoExtraKeys!4952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45965 () Bool)

(declare-fun mapRes!45965 () Bool)

(assert (=> mapIsEmpty!45965 mapRes!45965))

(declare-fun b!1170420 () Bool)

(declare-fun res!776803 () Bool)

(declare-fun e!665229 () Bool)

(assert (=> b!1170420 (=> (not res!776803) (not e!665229))))

(declare-datatypes ((List!25668 0))(
  ( (Nil!25665) (Cons!25664 (h!26873 (_ BitVec 64)) (t!37546 List!25668)) )
))
(declare-fun arrayNoDuplicates!0 (array!75600 (_ BitVec 32) List!25668) Bool)

(assert (=> b!1170420 (= res!776803 (arrayNoDuplicates!0 lt!527006 #b00000000000000000000000000000000 Nil!25665))))

(declare-fun b!1170421 () Bool)

(declare-fun res!776793 () Bool)

(declare-fun e!665232 () Bool)

(assert (=> b!1170421 (=> (not res!776793) (not e!665232))))

(assert (=> b!1170421 (= res!776793 (and (= (size!36987 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36988 _keys!1208) (size!36987 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170422 () Bool)

(declare-fun e!665235 () Bool)

(declare-fun e!665234 () Bool)

(assert (=> b!1170422 (= e!665235 e!665234)))

(declare-fun res!776795 () Bool)

(assert (=> b!1170422 (=> res!776795 e!665234)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1170422 (= res!776795 (not (= (select (arr!36450 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665239 () Bool)

(assert (=> b!1170422 e!665239))

(declare-fun res!776792 () Bool)

(assert (=> b!1170422 (=> (not res!776792) (not e!665239))))

(declare-fun lt!527007 () ListLongMap!16923)

(declare-fun +!3796 (ListLongMap!16923 tuple2!18954) ListLongMap!16923)

(declare-fun get!18594 (ValueCell!14003 V!44361) V!44361)

(assert (=> b!1170422 (= res!776792 (= lt!527010 (+!3796 lt!527007 (tuple2!18955 (select (arr!36450 _keys!1208) from!1455) (get!18594 (select (arr!36449 _values!996) from!1455) lt!527008)))))))

(declare-fun res!776800 () Bool)

(assert (=> start!99310 (=> (not res!776800) (not e!665232))))

(assert (=> start!99310 (= res!776800 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36988 _keys!1208))))))

(assert (=> start!99310 e!665232))

(declare-fun tp_is_empty!29425 () Bool)

(assert (=> start!99310 tp_is_empty!29425))

(declare-fun array_inv!27960 (array!75600) Bool)

(assert (=> start!99310 (array_inv!27960 _keys!1208)))

(assert (=> start!99310 true))

(assert (=> start!99310 tp!87398))

(declare-fun e!665230 () Bool)

(declare-fun array_inv!27961 (array!75598) Bool)

(assert (=> start!99310 (and (array_inv!27961 _values!996) e!665230)))

(declare-fun b!1170423 () Bool)

(declare-fun e!665231 () Bool)

(assert (=> b!1170423 (= e!665239 e!665231)))

(declare-fun res!776805 () Bool)

(assert (=> b!1170423 (=> res!776805 e!665231)))

(assert (=> b!1170423 (= res!776805 (not (= (select (arr!36450 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170424 () Bool)

(declare-fun res!776798 () Bool)

(assert (=> b!1170424 (=> (not res!776798) (not e!665232))))

(assert (=> b!1170424 (= res!776798 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25665))))

(declare-fun b!1170425 () Bool)

(declare-fun res!776806 () Bool)

(assert (=> b!1170425 (=> (not res!776806) (not e!665232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75600 (_ BitVec 32)) Bool)

(assert (=> b!1170425 (= res!776806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170426 () Bool)

(assert (=> b!1170426 (= e!665234 true)))

(declare-fun arrayContainsKey!0 (array!75600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170426 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!38435 0))(
  ( (Unit!38436) )
))
(declare-fun lt!527004 () Unit!38435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38435)

(assert (=> b!1170426 (= lt!527004 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170427 () Bool)

(assert (=> b!1170427 (= e!665229 (not e!665228))))

(declare-fun res!776802 () Bool)

(assert (=> b!1170427 (=> res!776802 e!665228)))

(assert (=> b!1170427 (= res!776802 (bvsgt from!1455 i!673))))

(assert (=> b!1170427 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527000 () Unit!38435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75600 (_ BitVec 64) (_ BitVec 32)) Unit!38435)

(assert (=> b!1170427 (= lt!527000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170428 () Bool)

(declare-fun e!665238 () Bool)

(assert (=> b!1170428 (= e!665238 tp_is_empty!29425)))

(declare-fun b!1170429 () Bool)

(declare-fun e!665233 () Bool)

(assert (=> b!1170429 (= e!665233 tp_is_empty!29425)))

(declare-fun b!1170430 () Bool)

(assert (=> b!1170430 (= e!665232 e!665229)))

(declare-fun res!776801 () Bool)

(assert (=> b!1170430 (=> (not res!776801) (not e!665229))))

(assert (=> b!1170430 (= res!776801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527006 mask!1564))))

(assert (=> b!1170430 (= lt!527006 (array!75601 (store (arr!36450 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36988 _keys!1208)))))

(declare-fun b!1170431 () Bool)

(assert (=> b!1170431 (= e!665231 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45965 () Bool)

(declare-fun tp!87399 () Bool)

(assert (=> mapNonEmpty!45965 (= mapRes!45965 (and tp!87399 e!665233))))

(declare-fun mapKey!45965 () (_ BitVec 32))

(declare-fun mapValue!45965 () ValueCell!14003)

(declare-fun mapRest!45965 () (Array (_ BitVec 32) ValueCell!14003))

(assert (=> mapNonEmpty!45965 (= (arr!36449 _values!996) (store mapRest!45965 mapKey!45965 mapValue!45965))))

(declare-fun b!1170432 () Bool)

(declare-fun res!776794 () Bool)

(assert (=> b!1170432 (=> (not res!776794) (not e!665232))))

(assert (=> b!1170432 (= res!776794 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36988 _keys!1208))))))

(declare-fun b!1170433 () Bool)

(assert (=> b!1170433 (= e!665230 (and e!665238 mapRes!45965))))

(declare-fun condMapEmpty!45965 () Bool)

(declare-fun mapDefault!45965 () ValueCell!14003)

(assert (=> b!1170433 (= condMapEmpty!45965 (= (arr!36449 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14003)) mapDefault!45965)))))

(declare-fun b!1170434 () Bool)

(declare-fun res!776797 () Bool)

(assert (=> b!1170434 (=> (not res!776797) (not e!665232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170434 (= res!776797 (validMask!0 mask!1564))))

(declare-fun b!1170435 () Bool)

(assert (=> b!1170435 (= e!665237 e!665235)))

(declare-fun res!776804 () Bool)

(assert (=> b!1170435 (=> res!776804 e!665235)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170435 (= res!776804 (not (validKeyInArray!0 (select (arr!36450 _keys!1208) from!1455))))))

(declare-fun lt!527001 () ListLongMap!16923)

(assert (=> b!1170435 (= lt!527001 lt!527007)))

(declare-fun lt!527005 () ListLongMap!16923)

(declare-fun -!1475 (ListLongMap!16923 (_ BitVec 64)) ListLongMap!16923)

(assert (=> b!1170435 (= lt!527007 (-!1475 lt!527005 k0!934))))

(assert (=> b!1170435 (= lt!527001 (getCurrentListMapNoExtraKeys!4952 lt!527006 lt!527003 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170435 (= lt!527005 (getCurrentListMapNoExtraKeys!4952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527002 () Unit!38435)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!739 (array!75600 array!75598 (_ BitVec 32) (_ BitVec 32) V!44361 V!44361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38435)

(assert (=> b!1170435 (= lt!527002 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170436 () Bool)

(declare-fun res!776799 () Bool)

(assert (=> b!1170436 (=> (not res!776799) (not e!665232))))

(assert (=> b!1170436 (= res!776799 (validKeyInArray!0 k0!934))))

(declare-fun b!1170437 () Bool)

(declare-fun res!776791 () Bool)

(assert (=> b!1170437 (=> (not res!776791) (not e!665232))))

(assert (=> b!1170437 (= res!776791 (= (select (arr!36450 _keys!1208) i!673) k0!934))))

(assert (= (and start!99310 res!776800) b!1170434))

(assert (= (and b!1170434 res!776797) b!1170421))

(assert (= (and b!1170421 res!776793) b!1170425))

(assert (= (and b!1170425 res!776806) b!1170424))

(assert (= (and b!1170424 res!776798) b!1170432))

(assert (= (and b!1170432 res!776794) b!1170436))

(assert (= (and b!1170436 res!776799) b!1170437))

(assert (= (and b!1170437 res!776791) b!1170430))

(assert (= (and b!1170430 res!776801) b!1170420))

(assert (= (and b!1170420 res!776803) b!1170427))

(assert (= (and b!1170427 (not res!776802)) b!1170419))

(assert (= (and b!1170419 (not res!776796)) b!1170435))

(assert (= (and b!1170435 (not res!776804)) b!1170422))

(assert (= (and b!1170422 res!776792) b!1170423))

(assert (= (and b!1170423 (not res!776805)) b!1170431))

(assert (= (and b!1170422 (not res!776795)) b!1170426))

(assert (= (and b!1170433 condMapEmpty!45965) mapIsEmpty!45965))

(assert (= (and b!1170433 (not condMapEmpty!45965)) mapNonEmpty!45965))

(get-info :version)

(assert (= (and mapNonEmpty!45965 ((_ is ValueCellFull!14003) mapValue!45965)) b!1170429))

(assert (= (and b!1170433 ((_ is ValueCellFull!14003) mapDefault!45965)) b!1170428))

(assert (= start!99310 b!1170433))

(declare-fun b_lambda!20021 () Bool)

(assert (=> (not b_lambda!20021) (not b!1170419)))

(declare-fun t!37544 () Bool)

(declare-fun tb!9699 () Bool)

(assert (=> (and start!99310 (= defaultEntry!1004 defaultEntry!1004) t!37544) tb!9699))

(declare-fun result!19973 () Bool)

(assert (=> tb!9699 (= result!19973 tp_is_empty!29425)))

(assert (=> b!1170419 t!37544))

(declare-fun b_and!40637 () Bool)

(assert (= b_and!40635 (and (=> t!37544 result!19973) b_and!40637)))

(declare-fun m!1077761 () Bool)

(assert (=> mapNonEmpty!45965 m!1077761))

(declare-fun m!1077763 () Bool)

(assert (=> b!1170422 m!1077763))

(declare-fun m!1077765 () Bool)

(assert (=> b!1170422 m!1077765))

(assert (=> b!1170422 m!1077765))

(declare-fun m!1077767 () Bool)

(assert (=> b!1170422 m!1077767))

(declare-fun m!1077769 () Bool)

(assert (=> b!1170422 m!1077769))

(declare-fun m!1077771 () Bool)

(assert (=> b!1170420 m!1077771))

(declare-fun m!1077773 () Bool)

(assert (=> b!1170425 m!1077773))

(declare-fun m!1077775 () Bool)

(assert (=> b!1170435 m!1077775))

(declare-fun m!1077777 () Bool)

(assert (=> b!1170435 m!1077777))

(declare-fun m!1077779 () Bool)

(assert (=> b!1170435 m!1077779))

(assert (=> b!1170435 m!1077763))

(declare-fun m!1077781 () Bool)

(assert (=> b!1170435 m!1077781))

(assert (=> b!1170435 m!1077763))

(declare-fun m!1077783 () Bool)

(assert (=> b!1170435 m!1077783))

(assert (=> b!1170423 m!1077763))

(declare-fun m!1077785 () Bool)

(assert (=> b!1170427 m!1077785))

(declare-fun m!1077787 () Bool)

(assert (=> b!1170427 m!1077787))

(declare-fun m!1077789 () Bool)

(assert (=> b!1170436 m!1077789))

(declare-fun m!1077791 () Bool)

(assert (=> b!1170431 m!1077791))

(declare-fun m!1077793 () Bool)

(assert (=> b!1170424 m!1077793))

(declare-fun m!1077795 () Bool)

(assert (=> b!1170426 m!1077795))

(declare-fun m!1077797 () Bool)

(assert (=> b!1170426 m!1077797))

(declare-fun m!1077799 () Bool)

(assert (=> b!1170430 m!1077799))

(declare-fun m!1077801 () Bool)

(assert (=> b!1170430 m!1077801))

(declare-fun m!1077803 () Bool)

(assert (=> b!1170419 m!1077803))

(declare-fun m!1077805 () Bool)

(assert (=> b!1170419 m!1077805))

(declare-fun m!1077807 () Bool)

(assert (=> b!1170419 m!1077807))

(declare-fun m!1077809 () Bool)

(assert (=> b!1170419 m!1077809))

(declare-fun m!1077811 () Bool)

(assert (=> start!99310 m!1077811))

(declare-fun m!1077813 () Bool)

(assert (=> start!99310 m!1077813))

(declare-fun m!1077815 () Bool)

(assert (=> b!1170437 m!1077815))

(declare-fun m!1077817 () Bool)

(assert (=> b!1170434 m!1077817))

(check-sat (not mapNonEmpty!45965) (not b_lambda!20021) b_and!40637 (not b!1170420) (not b!1170426) (not b!1170430) (not b!1170427) (not b!1170422) (not b!1170431) (not b!1170424) (not b!1170419) (not start!99310) (not b!1170425) (not b!1170434) (not b!1170436) tp_is_empty!29425 (not b!1170435) (not b_next!24895))
(check-sat b_and!40637 (not b_next!24895))
