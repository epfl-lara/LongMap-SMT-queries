; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100050 () Bool)

(assert start!100050)

(declare-fun b_free!25629 () Bool)

(declare-fun b_next!25629 () Bool)

(assert (=> start!100050 (= b_free!25629 (not b_next!25629))))

(declare-fun tp!89601 () Bool)

(declare-fun b_and!42125 () Bool)

(assert (=> start!100050 (= tp!89601 b_and!42125)))

(declare-fun b!1192455 () Bool)

(declare-fun res!793267 () Bool)

(declare-fun e!677791 () Bool)

(assert (=> b!1192455 (=> (not res!793267) (not e!677791))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192455 (= res!793267 (validKeyInArray!0 k0!934))))

(declare-fun b!1192456 () Bool)

(declare-fun e!677789 () Bool)

(declare-fun tp_is_empty!30159 () Bool)

(assert (=> b!1192456 (= e!677789 tp_is_empty!30159)))

(declare-fun b!1192457 () Bool)

(declare-fun e!677792 () Bool)

(declare-fun mapRes!47066 () Bool)

(assert (=> b!1192457 (= e!677792 (and e!677789 mapRes!47066))))

(declare-fun condMapEmpty!47066 () Bool)

(declare-datatypes ((V!45339 0))(
  ( (V!45340 (val!15136 Int)) )
))
(declare-datatypes ((ValueCell!14370 0))(
  ( (ValueCellFull!14370 (v!17774 V!45339)) (EmptyCell!14370) )
))
(declare-datatypes ((array!77103 0))(
  ( (array!77104 (arr!37201 (Array (_ BitVec 32) ValueCell!14370)) (size!37737 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77103)

(declare-fun mapDefault!47066 () ValueCell!14370)

(assert (=> b!1192457 (= condMapEmpty!47066 (= (arr!37201 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14370)) mapDefault!47066)))))

(declare-fun b!1192458 () Bool)

(declare-fun res!793264 () Bool)

(assert (=> b!1192458 (=> (not res!793264) (not e!677791))))

(declare-datatypes ((array!77105 0))(
  ( (array!77106 (arr!37202 (Array (_ BitVec 32) (_ BitVec 64))) (size!37738 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77105)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1192458 (= res!793264 (and (= (size!37737 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37738 _keys!1208) (size!37737 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192459 () Bool)

(declare-fun res!793265 () Bool)

(assert (=> b!1192459 (=> (not res!793265) (not e!677791))))

(declare-datatypes ((List!26197 0))(
  ( (Nil!26194) (Cons!26193 (h!27402 (_ BitVec 64)) (t!38818 List!26197)) )
))
(declare-fun arrayNoDuplicates!0 (array!77105 (_ BitVec 32) List!26197) Bool)

(assert (=> b!1192459 (= res!793265 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26194))))

(declare-fun mapNonEmpty!47066 () Bool)

(declare-fun tp!89600 () Bool)

(declare-fun e!677793 () Bool)

(assert (=> mapNonEmpty!47066 (= mapRes!47066 (and tp!89600 e!677793))))

(declare-fun mapRest!47066 () (Array (_ BitVec 32) ValueCell!14370))

(declare-fun mapKey!47066 () (_ BitVec 32))

(declare-fun mapValue!47066 () ValueCell!14370)

(assert (=> mapNonEmpty!47066 (= (arr!37201 _values!996) (store mapRest!47066 mapKey!47066 mapValue!47066))))

(declare-fun b!1192460 () Bool)

(declare-fun res!793256 () Bool)

(assert (=> b!1192460 (=> (not res!793256) (not e!677791))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192460 (= res!793256 (= (select (arr!37202 _keys!1208) i!673) k0!934))))

(declare-fun b!1192461 () Bool)

(declare-fun res!793266 () Bool)

(assert (=> b!1192461 (=> (not res!793266) (not e!677791))))

(assert (=> b!1192461 (= res!793266 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37738 _keys!1208))))))

(declare-fun res!793259 () Bool)

(assert (=> start!100050 (=> (not res!793259) (not e!677791))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100050 (= res!793259 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37738 _keys!1208))))))

(assert (=> start!100050 e!677791))

(assert (=> start!100050 tp_is_empty!30159))

(declare-fun array_inv!28366 (array!77105) Bool)

(assert (=> start!100050 (array_inv!28366 _keys!1208)))

(assert (=> start!100050 true))

(assert (=> start!100050 tp!89601))

(declare-fun array_inv!28367 (array!77103) Bool)

(assert (=> start!100050 (and (array_inv!28367 _values!996) e!677792)))

(declare-fun b!1192462 () Bool)

(declare-fun e!677787 () Bool)

(assert (=> b!1192462 (= e!677791 e!677787)))

(declare-fun res!793258 () Bool)

(assert (=> b!1192462 (=> (not res!793258) (not e!677787))))

(declare-fun lt!542225 () array!77105)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77105 (_ BitVec 32)) Bool)

(assert (=> b!1192462 (= res!793258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542225 mask!1564))))

(assert (=> b!1192462 (= lt!542225 (array!77106 (store (arr!37202 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37738 _keys!1208)))))

(declare-fun b!1192463 () Bool)

(declare-fun e!677794 () Bool)

(declare-fun e!677790 () Bool)

(assert (=> b!1192463 (= e!677794 e!677790)))

(declare-fun res!793260 () Bool)

(assert (=> b!1192463 (=> res!793260 e!677790)))

(assert (=> b!1192463 (= res!793260 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45339)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542226 () array!77103)

(declare-fun minValue!944 () V!45339)

(declare-datatypes ((tuple2!19454 0))(
  ( (tuple2!19455 (_1!9738 (_ BitVec 64)) (_2!9738 V!45339)) )
))
(declare-datatypes ((List!26198 0))(
  ( (Nil!26195) (Cons!26194 (h!27403 tuple2!19454) (t!38819 List!26198)) )
))
(declare-datatypes ((ListLongMap!17423 0))(
  ( (ListLongMap!17424 (toList!8727 List!26198)) )
))
(declare-fun lt!542223 () ListLongMap!17423)

(declare-fun getCurrentListMapNoExtraKeys!5168 (array!77105 array!77103 (_ BitVec 32) (_ BitVec 32) V!45339 V!45339 (_ BitVec 32) Int) ListLongMap!17423)

(assert (=> b!1192463 (= lt!542223 (getCurrentListMapNoExtraKeys!5168 lt!542225 lt!542226 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3100 (Int (_ BitVec 64)) V!45339)

(assert (=> b!1192463 (= lt!542226 (array!77104 (store (arr!37201 _values!996) i!673 (ValueCellFull!14370 (dynLambda!3100 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37737 _values!996)))))

(declare-fun lt!542221 () ListLongMap!17423)

(assert (=> b!1192463 (= lt!542221 (getCurrentListMapNoExtraKeys!5168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192464 () Bool)

(declare-fun res!793261 () Bool)

(assert (=> b!1192464 (=> (not res!793261) (not e!677787))))

(assert (=> b!1192464 (= res!793261 (arrayNoDuplicates!0 lt!542225 #b00000000000000000000000000000000 Nil!26194))))

(declare-fun b!1192465 () Bool)

(declare-fun res!793257 () Bool)

(assert (=> b!1192465 (=> (not res!793257) (not e!677791))))

(assert (=> b!1192465 (= res!793257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192466 () Bool)

(assert (=> b!1192466 (= e!677787 (not e!677794))))

(declare-fun res!793262 () Bool)

(assert (=> b!1192466 (=> res!793262 e!677794)))

(assert (=> b!1192466 (= res!793262 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192466 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39558 0))(
  ( (Unit!39559) )
))
(declare-fun lt!542224 () Unit!39558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77105 (_ BitVec 64) (_ BitVec 32)) Unit!39558)

(assert (=> b!1192466 (= lt!542224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192467 () Bool)

(assert (=> b!1192467 (= e!677793 tp_is_empty!30159)))

(declare-fun b!1192468 () Bool)

(declare-fun res!793263 () Bool)

(assert (=> b!1192468 (=> (not res!793263) (not e!677791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192468 (= res!793263 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47066 () Bool)

(assert (=> mapIsEmpty!47066 mapRes!47066))

(declare-fun b!1192469 () Bool)

(assert (=> b!1192469 (= e!677790 true)))

(declare-fun -!1752 (ListLongMap!17423 (_ BitVec 64)) ListLongMap!17423)

(assert (=> b!1192469 (= (getCurrentListMapNoExtraKeys!5168 lt!542225 lt!542226 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1752 (getCurrentListMapNoExtraKeys!5168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542222 () Unit!39558)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!961 (array!77105 array!77103 (_ BitVec 32) (_ BitVec 32) V!45339 V!45339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39558)

(assert (=> b!1192469 (= lt!542222 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!961 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100050 res!793259) b!1192468))

(assert (= (and b!1192468 res!793263) b!1192458))

(assert (= (and b!1192458 res!793264) b!1192465))

(assert (= (and b!1192465 res!793257) b!1192459))

(assert (= (and b!1192459 res!793265) b!1192461))

(assert (= (and b!1192461 res!793266) b!1192455))

(assert (= (and b!1192455 res!793267) b!1192460))

(assert (= (and b!1192460 res!793256) b!1192462))

(assert (= (and b!1192462 res!793258) b!1192464))

(assert (= (and b!1192464 res!793261) b!1192466))

(assert (= (and b!1192466 (not res!793262)) b!1192463))

(assert (= (and b!1192463 (not res!793260)) b!1192469))

(assert (= (and b!1192457 condMapEmpty!47066) mapIsEmpty!47066))

(assert (= (and b!1192457 (not condMapEmpty!47066)) mapNonEmpty!47066))

(get-info :version)

(assert (= (and mapNonEmpty!47066 ((_ is ValueCellFull!14370) mapValue!47066)) b!1192467))

(assert (= (and b!1192457 ((_ is ValueCellFull!14370) mapDefault!47066)) b!1192456))

(assert (= start!100050 b!1192457))

(declare-fun b_lambda!20773 () Bool)

(assert (=> (not b_lambda!20773) (not b!1192463)))

(declare-fun t!38817 () Bool)

(declare-fun tb!10441 () Bool)

(assert (=> (and start!100050 (= defaultEntry!1004 defaultEntry!1004) t!38817) tb!10441))

(declare-fun result!21449 () Bool)

(assert (=> tb!10441 (= result!21449 tp_is_empty!30159)))

(assert (=> b!1192463 t!38817))

(declare-fun b_and!42127 () Bool)

(assert (= b_and!42125 (and (=> t!38817 result!21449) b_and!42127)))

(declare-fun m!1100811 () Bool)

(assert (=> b!1192469 m!1100811))

(declare-fun m!1100813 () Bool)

(assert (=> b!1192469 m!1100813))

(assert (=> b!1192469 m!1100813))

(declare-fun m!1100815 () Bool)

(assert (=> b!1192469 m!1100815))

(declare-fun m!1100817 () Bool)

(assert (=> b!1192469 m!1100817))

(declare-fun m!1100819 () Bool)

(assert (=> start!100050 m!1100819))

(declare-fun m!1100821 () Bool)

(assert (=> start!100050 m!1100821))

(declare-fun m!1100823 () Bool)

(assert (=> b!1192459 m!1100823))

(declare-fun m!1100825 () Bool)

(assert (=> b!1192455 m!1100825))

(declare-fun m!1100827 () Bool)

(assert (=> b!1192468 m!1100827))

(declare-fun m!1100829 () Bool)

(assert (=> b!1192460 m!1100829))

(declare-fun m!1100831 () Bool)

(assert (=> b!1192465 m!1100831))

(declare-fun m!1100833 () Bool)

(assert (=> b!1192466 m!1100833))

(declare-fun m!1100835 () Bool)

(assert (=> b!1192466 m!1100835))

(declare-fun m!1100837 () Bool)

(assert (=> b!1192464 m!1100837))

(declare-fun m!1100839 () Bool)

(assert (=> b!1192463 m!1100839))

(declare-fun m!1100841 () Bool)

(assert (=> b!1192463 m!1100841))

(declare-fun m!1100843 () Bool)

(assert (=> b!1192463 m!1100843))

(declare-fun m!1100845 () Bool)

(assert (=> b!1192463 m!1100845))

(declare-fun m!1100847 () Bool)

(assert (=> b!1192462 m!1100847))

(declare-fun m!1100849 () Bool)

(assert (=> b!1192462 m!1100849))

(declare-fun m!1100851 () Bool)

(assert (=> mapNonEmpty!47066 m!1100851))

(check-sat (not mapNonEmpty!47066) (not b!1192468) (not b!1192463) (not b!1192469) (not b!1192465) b_and!42127 tp_is_empty!30159 (not b!1192464) (not b!1192459) (not start!100050) (not b_next!25629) (not b!1192466) (not b!1192455) (not b!1192462) (not b_lambda!20773))
(check-sat b_and!42127 (not b_next!25629))
