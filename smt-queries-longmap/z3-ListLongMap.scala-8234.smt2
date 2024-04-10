; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100314 () Bool)

(assert start!100314)

(declare-fun b_free!25701 () Bool)

(declare-fun b_next!25701 () Bool)

(assert (=> start!100314 (= b_free!25701 (not b_next!25701))))

(declare-fun tp!90050 () Bool)

(declare-fun b_and!42269 () Bool)

(assert (=> start!100314 (= tp!90050 b_and!42269)))

(declare-fun b!1197114 () Bool)

(declare-fun res!796692 () Bool)

(declare-fun e!680089 () Bool)

(assert (=> b!1197114 (=> (not res!796692) (not e!680089))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197114 (= res!796692 (validKeyInArray!0 k0!934))))

(declare-fun b!1197115 () Bool)

(declare-datatypes ((V!45635 0))(
  ( (V!45636 (val!15247 Int)) )
))
(declare-datatypes ((tuple2!19516 0))(
  ( (tuple2!19517 (_1!9769 (_ BitVec 64)) (_2!9769 V!45635)) )
))
(declare-datatypes ((List!26325 0))(
  ( (Nil!26322) (Cons!26321 (h!27530 tuple2!19516) (t!39018 List!26325)) )
))
(declare-datatypes ((ListLongMap!17485 0))(
  ( (ListLongMap!17486 (toList!8758 List!26325)) )
))
(declare-fun call!57224 () ListLongMap!17485)

(declare-fun call!57225 () ListLongMap!17485)

(declare-fun e!680091 () Bool)

(declare-fun -!1776 (ListLongMap!17485 (_ BitVec 64)) ListLongMap!17485)

(assert (=> b!1197115 (= e!680091 (= call!57225 (-!1776 call!57224 k0!934)))))

(declare-fun b!1197116 () Bool)

(assert (=> b!1197116 (= e!680091 (= call!57225 call!57224))))

(declare-fun b!1197117 () Bool)

(declare-fun e!680092 () Bool)

(assert (=> b!1197117 (= e!680089 e!680092)))

(declare-fun res!796691 () Bool)

(assert (=> b!1197117 (=> (not res!796691) (not e!680092))))

(declare-datatypes ((array!77541 0))(
  ( (array!77542 (arr!37417 (Array (_ BitVec 32) (_ BitVec 64))) (size!37953 (_ BitVec 32))) )
))
(declare-fun lt!543199 () array!77541)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77541 (_ BitVec 32)) Bool)

(assert (=> b!1197117 (= res!796691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543199 mask!1564))))

(declare-fun _keys!1208 () array!77541)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197117 (= lt!543199 (array!77542 (store (arr!37417 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37953 _keys!1208)))))

(declare-fun zeroValue!944 () V!45635)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14481 0))(
  ( (ValueCellFull!14481 (v!17885 V!45635)) (EmptyCell!14481) )
))
(declare-datatypes ((array!77543 0))(
  ( (array!77544 (arr!37418 (Array (_ BitVec 32) ValueCell!14481)) (size!37954 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77543)

(declare-fun minValue!944 () V!45635)

(declare-fun bm!57221 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5198 (array!77541 array!77543 (_ BitVec 32) (_ BitVec 32) V!45635 V!45635 (_ BitVec 32) Int) ListLongMap!17485)

(assert (=> bm!57221 (= call!57224 (getCurrentListMapNoExtraKeys!5198 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197118 () Bool)

(declare-fun res!796695 () Bool)

(assert (=> b!1197118 (=> (not res!796695) (not e!680089))))

(assert (=> b!1197118 (= res!796695 (= (select (arr!37417 _keys!1208) i!673) k0!934))))

(declare-fun b!1197119 () Bool)

(declare-fun res!796697 () Bool)

(assert (=> b!1197119 (=> (not res!796697) (not e!680092))))

(declare-datatypes ((List!26326 0))(
  ( (Nil!26323) (Cons!26322 (h!27531 (_ BitVec 64)) (t!39019 List!26326)) )
))
(declare-fun arrayNoDuplicates!0 (array!77541 (_ BitVec 32) List!26326) Bool)

(assert (=> b!1197119 (= res!796697 (arrayNoDuplicates!0 lt!543199 #b00000000000000000000000000000000 Nil!26323))))

(declare-fun b!1197120 () Bool)

(declare-fun res!796699 () Bool)

(assert (=> b!1197120 (=> (not res!796699) (not e!680089))))

(assert (=> b!1197120 (= res!796699 (and (= (size!37954 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37953 _keys!1208) (size!37954 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197121 () Bool)

(declare-fun e!680090 () Bool)

(declare-fun tp_is_empty!30381 () Bool)

(assert (=> b!1197121 (= e!680090 tp_is_empty!30381)))

(declare-fun b!1197122 () Bool)

(declare-fun e!680093 () Bool)

(declare-fun mapRes!47408 () Bool)

(assert (=> b!1197122 (= e!680093 (and e!680090 mapRes!47408))))

(declare-fun condMapEmpty!47408 () Bool)

(declare-fun mapDefault!47408 () ValueCell!14481)

(assert (=> b!1197122 (= condMapEmpty!47408 (= (arr!37418 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14481)) mapDefault!47408)))))

(declare-fun b!1197123 () Bool)

(declare-fun res!796693 () Bool)

(assert (=> b!1197123 (=> (not res!796693) (not e!680089))))

(assert (=> b!1197123 (= res!796693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!796696 () Bool)

(assert (=> start!100314 (=> (not res!796696) (not e!680089))))

(assert (=> start!100314 (= res!796696 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37953 _keys!1208))))))

(assert (=> start!100314 e!680089))

(assert (=> start!100314 tp_is_empty!30381))

(declare-fun array_inv!28516 (array!77541) Bool)

(assert (=> start!100314 (array_inv!28516 _keys!1208)))

(assert (=> start!100314 true))

(assert (=> start!100314 tp!90050))

(declare-fun array_inv!28517 (array!77543) Bool)

(assert (=> start!100314 (and (array_inv!28517 _values!996) e!680093)))

(declare-fun b!1197113 () Bool)

(declare-fun res!796690 () Bool)

(assert (=> b!1197113 (=> (not res!796690) (not e!680089))))

(assert (=> b!1197113 (= res!796690 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37953 _keys!1208))))))

(declare-fun mapNonEmpty!47408 () Bool)

(declare-fun tp!90051 () Bool)

(declare-fun e!680094 () Bool)

(assert (=> mapNonEmpty!47408 (= mapRes!47408 (and tp!90051 e!680094))))

(declare-fun mapRest!47408 () (Array (_ BitVec 32) ValueCell!14481))

(declare-fun mapValue!47408 () ValueCell!14481)

(declare-fun mapKey!47408 () (_ BitVec 32))

(assert (=> mapNonEmpty!47408 (= (arr!37418 _values!996) (store mapRest!47408 mapKey!47408 mapValue!47408))))

(declare-fun b!1197124 () Bool)

(declare-fun e!680088 () Bool)

(assert (=> b!1197124 (= e!680088 (bvslt i!673 (size!37954 _values!996)))))

(assert (=> b!1197124 e!680091))

(declare-fun c!117366 () Bool)

(assert (=> b!1197124 (= c!117366 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39696 0))(
  ( (Unit!39697) )
))
(declare-fun lt!543201 () Unit!39696)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!985 (array!77541 array!77543 (_ BitVec 32) (_ BitVec 32) V!45635 V!45635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39696)

(assert (=> b!1197124 (= lt!543201 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!985 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197125 () Bool)

(declare-fun res!796694 () Bool)

(assert (=> b!1197125 (=> (not res!796694) (not e!680089))))

(assert (=> b!1197125 (= res!796694 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26323))))

(declare-fun mapIsEmpty!47408 () Bool)

(assert (=> mapIsEmpty!47408 mapRes!47408))

(declare-fun b!1197126 () Bool)

(declare-fun res!796689 () Bool)

(assert (=> b!1197126 (=> (not res!796689) (not e!680089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197126 (= res!796689 (validMask!0 mask!1564))))

(declare-fun b!1197127 () Bool)

(assert (=> b!1197127 (= e!680094 tp_is_empty!30381)))

(declare-fun b!1197128 () Bool)

(assert (=> b!1197128 (= e!680092 (not e!680088))))

(declare-fun res!796698 () Bool)

(assert (=> b!1197128 (=> res!796698 e!680088)))

(assert (=> b!1197128 (= res!796698 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37953 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197128 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543200 () Unit!39696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77541 (_ BitVec 64) (_ BitVec 32)) Unit!39696)

(assert (=> b!1197128 (= lt!543200 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!57222 () Bool)

(declare-fun dynLambda!3123 (Int (_ BitVec 64)) V!45635)

(assert (=> bm!57222 (= call!57225 (getCurrentListMapNoExtraKeys!5198 lt!543199 (array!77544 (store (arr!37418 _values!996) i!673 (ValueCellFull!14481 (dynLambda!3123 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37954 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100314 res!796696) b!1197126))

(assert (= (and b!1197126 res!796689) b!1197120))

(assert (= (and b!1197120 res!796699) b!1197123))

(assert (= (and b!1197123 res!796693) b!1197125))

(assert (= (and b!1197125 res!796694) b!1197113))

(assert (= (and b!1197113 res!796690) b!1197114))

(assert (= (and b!1197114 res!796692) b!1197118))

(assert (= (and b!1197118 res!796695) b!1197117))

(assert (= (and b!1197117 res!796691) b!1197119))

(assert (= (and b!1197119 res!796697) b!1197128))

(assert (= (and b!1197128 (not res!796698)) b!1197124))

(assert (= (and b!1197124 c!117366) b!1197115))

(assert (= (and b!1197124 (not c!117366)) b!1197116))

(assert (= (or b!1197115 b!1197116) bm!57222))

(assert (= (or b!1197115 b!1197116) bm!57221))

(assert (= (and b!1197122 condMapEmpty!47408) mapIsEmpty!47408))

(assert (= (and b!1197122 (not condMapEmpty!47408)) mapNonEmpty!47408))

(get-info :version)

(assert (= (and mapNonEmpty!47408 ((_ is ValueCellFull!14481) mapValue!47408)) b!1197127))

(assert (= (and b!1197122 ((_ is ValueCellFull!14481) mapDefault!47408)) b!1197121))

(assert (= start!100314 b!1197122))

(declare-fun b_lambda!20845 () Bool)

(assert (=> (not b_lambda!20845) (not bm!57222)))

(declare-fun t!39017 () Bool)

(declare-fun tb!10513 () Bool)

(assert (=> (and start!100314 (= defaultEntry!1004 defaultEntry!1004) t!39017) tb!10513))

(declare-fun result!21599 () Bool)

(assert (=> tb!10513 (= result!21599 tp_is_empty!30381)))

(assert (=> bm!57222 t!39017))

(declare-fun b_and!42271 () Bool)

(assert (= b_and!42269 (and (=> t!39017 result!21599) b_and!42271)))

(declare-fun m!1104167 () Bool)

(assert (=> b!1197119 m!1104167))

(declare-fun m!1104169 () Bool)

(assert (=> b!1197117 m!1104169))

(declare-fun m!1104171 () Bool)

(assert (=> b!1197117 m!1104171))

(declare-fun m!1104173 () Bool)

(assert (=> b!1197115 m!1104173))

(declare-fun m!1104175 () Bool)

(assert (=> b!1197123 m!1104175))

(declare-fun m!1104177 () Bool)

(assert (=> bm!57221 m!1104177))

(declare-fun m!1104179 () Bool)

(assert (=> b!1197125 m!1104179))

(declare-fun m!1104181 () Bool)

(assert (=> start!100314 m!1104181))

(declare-fun m!1104183 () Bool)

(assert (=> start!100314 m!1104183))

(declare-fun m!1104185 () Bool)

(assert (=> b!1197118 m!1104185))

(declare-fun m!1104187 () Bool)

(assert (=> b!1197114 m!1104187))

(declare-fun m!1104189 () Bool)

(assert (=> mapNonEmpty!47408 m!1104189))

(declare-fun m!1104191 () Bool)

(assert (=> b!1197126 m!1104191))

(declare-fun m!1104193 () Bool)

(assert (=> bm!57222 m!1104193))

(declare-fun m!1104195 () Bool)

(assert (=> bm!57222 m!1104195))

(declare-fun m!1104197 () Bool)

(assert (=> bm!57222 m!1104197))

(declare-fun m!1104199 () Bool)

(assert (=> b!1197128 m!1104199))

(declare-fun m!1104201 () Bool)

(assert (=> b!1197128 m!1104201))

(declare-fun m!1104203 () Bool)

(assert (=> b!1197124 m!1104203))

(check-sat (not b!1197125) (not b_next!25701) (not bm!57221) (not b!1197128) (not b!1197115) (not b!1197123) (not bm!57222) (not mapNonEmpty!47408) (not b!1197117) (not start!100314) (not b!1197126) (not b!1197119) (not b!1197124) tp_is_empty!30381 (not b_lambda!20845) b_and!42271 (not b!1197114))
(check-sat b_and!42271 (not b_next!25701))
