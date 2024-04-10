; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101426 () Bool)

(assert start!101426)

(declare-fun b_free!26271 () Bool)

(declare-fun b_next!26271 () Bool)

(assert (=> start!101426 (= b_free!26271 (not b_next!26271))))

(declare-fun tp!91844 () Bool)

(declare-fun b_and!43713 () Bool)

(assert (=> start!101426 (= tp!91844 b_and!43713)))

(declare-fun b!1219045 () Bool)

(declare-fun e!692149 () Bool)

(declare-fun e!692144 () Bool)

(declare-fun mapRes!48346 () Bool)

(assert (=> b!1219045 (= e!692149 (and e!692144 mapRes!48346))))

(declare-fun condMapEmpty!48346 () Bool)

(declare-datatypes ((V!46427 0))(
  ( (V!46428 (val!15544 Int)) )
))
(declare-datatypes ((ValueCell!14778 0))(
  ( (ValueCellFull!14778 (v!18200 V!46427)) (EmptyCell!14778) )
))
(declare-datatypes ((array!78725 0))(
  ( (array!78726 (arr!37994 (Array (_ BitVec 32) ValueCell!14778)) (size!38530 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78725)

(declare-fun mapDefault!48346 () ValueCell!14778)

(assert (=> b!1219045 (= condMapEmpty!48346 (= (arr!37994 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14778)) mapDefault!48346)))))

(declare-fun mapIsEmpty!48346 () Bool)

(assert (=> mapIsEmpty!48346 mapRes!48346))

(declare-fun b!1219046 () Bool)

(declare-fun e!692148 () Bool)

(declare-fun e!692147 () Bool)

(assert (=> b!1219046 (= e!692148 e!692147)))

(declare-fun res!809663 () Bool)

(assert (=> b!1219046 (=> res!809663 e!692147)))

(declare-datatypes ((array!78727 0))(
  ( (array!78728 (arr!37995 (Array (_ BitVec 32) (_ BitVec 64))) (size!38531 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78727)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219046 (= res!809663 (not (= (select (arr!37995 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692139 () Bool)

(assert (=> b!1219046 e!692139))

(declare-fun res!809664 () Bool)

(assert (=> b!1219046 (=> (not res!809664) (not e!692139))))

(declare-datatypes ((tuple2!20000 0))(
  ( (tuple2!20001 (_1!10011 (_ BitVec 64)) (_2!10011 V!46427)) )
))
(declare-datatypes ((List!26801 0))(
  ( (Nil!26798) (Cons!26797 (h!28006 tuple2!20000) (t!40052 List!26801)) )
))
(declare-datatypes ((ListLongMap!17969 0))(
  ( (ListLongMap!17970 (toList!9000 List!26801)) )
))
(declare-fun lt!554223 () ListLongMap!17969)

(declare-fun lt!554217 () ListLongMap!17969)

(declare-fun lt!554218 () V!46427)

(declare-fun +!4069 (ListLongMap!17969 tuple2!20000) ListLongMap!17969)

(declare-fun get!19372 (ValueCell!14778 V!46427) V!46427)

(assert (=> b!1219046 (= res!809664 (= lt!554223 (+!4069 lt!554217 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))))))

(declare-fun b!1219047 () Bool)

(declare-fun res!809665 () Bool)

(declare-fun e!692150 () Bool)

(assert (=> b!1219047 (=> (not res!809665) (not e!692150))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78727 (_ BitVec 32)) Bool)

(assert (=> b!1219047 (= res!809665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219048 () Bool)

(declare-fun res!809666 () Bool)

(assert (=> b!1219048 (=> (not res!809666) (not e!692150))))

(declare-datatypes ((List!26802 0))(
  ( (Nil!26799) (Cons!26798 (h!28007 (_ BitVec 64)) (t!40053 List!26802)) )
))
(declare-fun arrayNoDuplicates!0 (array!78727 (_ BitVec 32) List!26802) Bool)

(assert (=> b!1219048 (= res!809666 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26799))))

(declare-fun b!1219049 () Bool)

(declare-fun e!692145 () Bool)

(assert (=> b!1219049 (= e!692150 e!692145)))

(declare-fun res!809668 () Bool)

(assert (=> b!1219049 (=> (not res!809668) (not e!692145))))

(declare-fun lt!554219 () array!78727)

(assert (=> b!1219049 (= res!809668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554219 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219049 (= lt!554219 (array!78728 (store (arr!37995 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38531 _keys!1208)))))

(declare-fun b!1219050 () Bool)

(declare-fun e!692142 () Bool)

(assert (=> b!1219050 (= e!692145 (not e!692142))))

(declare-fun res!809670 () Bool)

(assert (=> b!1219050 (=> res!809670 e!692142)))

(assert (=> b!1219050 (= res!809670 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219050 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40400 0))(
  ( (Unit!40401) )
))
(declare-fun lt!554213 () Unit!40400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78727 (_ BitVec 64) (_ BitVec 32)) Unit!40400)

(assert (=> b!1219050 (= lt!554213 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!692143 () Bool)

(declare-fun b!1219051 () Bool)

(assert (=> b!1219051 (= e!692143 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48346 () Bool)

(declare-fun tp!91843 () Bool)

(declare-fun e!692141 () Bool)

(assert (=> mapNonEmpty!48346 (= mapRes!48346 (and tp!91843 e!692141))))

(declare-fun mapRest!48346 () (Array (_ BitVec 32) ValueCell!14778))

(declare-fun mapValue!48346 () ValueCell!14778)

(declare-fun mapKey!48346 () (_ BitVec 32))

(assert (=> mapNonEmpty!48346 (= (arr!37994 _values!996) (store mapRest!48346 mapKey!48346 mapValue!48346))))

(declare-fun b!1219052 () Bool)

(declare-fun res!809669 () Bool)

(assert (=> b!1219052 (=> (not res!809669) (not e!692150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219052 (= res!809669 (validMask!0 mask!1564))))

(declare-fun b!1219053 () Bool)

(declare-fun res!809662 () Bool)

(assert (=> b!1219053 (=> (not res!809662) (not e!692150))))

(assert (=> b!1219053 (= res!809662 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38531 _keys!1208))))))

(declare-fun b!1219054 () Bool)

(declare-fun e!692146 () Bool)

(assert (=> b!1219054 (= e!692142 e!692146)))

(declare-fun res!809667 () Bool)

(assert (=> b!1219054 (=> res!809667 e!692146)))

(assert (=> b!1219054 (= res!809667 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46427)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!554220 () array!78725)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46427)

(declare-fun getCurrentListMapNoExtraKeys!5425 (array!78727 array!78725 (_ BitVec 32) (_ BitVec 32) V!46427 V!46427 (_ BitVec 32) Int) ListLongMap!17969)

(assert (=> b!1219054 (= lt!554223 (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219054 (= lt!554220 (array!78726 (store (arr!37994 _values!996) i!673 (ValueCellFull!14778 lt!554218)) (size!38530 _values!996)))))

(declare-fun dynLambda!3308 (Int (_ BitVec 64)) V!46427)

(assert (=> b!1219054 (= lt!554218 (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554215 () ListLongMap!17969)

(assert (=> b!1219054 (= lt!554215 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219055 () Bool)

(declare-fun res!809672 () Bool)

(assert (=> b!1219055 (=> (not res!809672) (not e!692150))))

(assert (=> b!1219055 (= res!809672 (= (select (arr!37995 _keys!1208) i!673) k0!934))))

(declare-fun b!1219056 () Bool)

(declare-fun res!809658 () Bool)

(assert (=> b!1219056 (=> (not res!809658) (not e!692145))))

(assert (=> b!1219056 (= res!809658 (arrayNoDuplicates!0 lt!554219 #b00000000000000000000000000000000 Nil!26799))))

(declare-fun b!1219057 () Bool)

(assert (=> b!1219057 (= e!692139 e!692143)))

(declare-fun res!809671 () Bool)

(assert (=> b!1219057 (=> res!809671 e!692143)))

(assert (=> b!1219057 (= res!809671 (not (= (select (arr!37995 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219058 () Bool)

(declare-fun res!809660 () Bool)

(assert (=> b!1219058 (=> (not res!809660) (not e!692150))))

(assert (=> b!1219058 (= res!809660 (and (= (size!38530 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38531 _keys!1208) (size!38530 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219059 () Bool)

(assert (=> b!1219059 (= e!692147 (bvslt (size!38531 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1219059 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554214 () Unit!40400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40400)

(assert (=> b!1219059 (= lt!554214 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219061 () Bool)

(declare-fun tp_is_empty!30975 () Bool)

(assert (=> b!1219061 (= e!692141 tp_is_empty!30975)))

(declare-fun b!1219060 () Bool)

(assert (=> b!1219060 (= e!692144 tp_is_empty!30975)))

(declare-fun res!809673 () Bool)

(assert (=> start!101426 (=> (not res!809673) (not e!692150))))

(assert (=> start!101426 (= res!809673 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38531 _keys!1208))))))

(assert (=> start!101426 e!692150))

(assert (=> start!101426 tp_is_empty!30975))

(declare-fun array_inv!28916 (array!78727) Bool)

(assert (=> start!101426 (array_inv!28916 _keys!1208)))

(assert (=> start!101426 true))

(assert (=> start!101426 tp!91844))

(declare-fun array_inv!28917 (array!78725) Bool)

(assert (=> start!101426 (and (array_inv!28917 _values!996) e!692149)))

(declare-fun b!1219062 () Bool)

(declare-fun res!809661 () Bool)

(assert (=> b!1219062 (=> (not res!809661) (not e!692150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219062 (= res!809661 (validKeyInArray!0 k0!934))))

(declare-fun b!1219063 () Bool)

(assert (=> b!1219063 (= e!692146 e!692148)))

(declare-fun res!809659 () Bool)

(assert (=> b!1219063 (=> res!809659 e!692148)))

(assert (=> b!1219063 (= res!809659 (not (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455))))))

(declare-fun lt!554222 () ListLongMap!17969)

(assert (=> b!1219063 (= lt!554222 lt!554217)))

(declare-fun lt!554221 () ListLongMap!17969)

(declare-fun -!1912 (ListLongMap!17969 (_ BitVec 64)) ListLongMap!17969)

(assert (=> b!1219063 (= lt!554217 (-!1912 lt!554221 k0!934))))

(assert (=> b!1219063 (= lt!554222 (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219063 (= lt!554221 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554216 () Unit!40400)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1119 (array!78727 array!78725 (_ BitVec 32) (_ BitVec 32) V!46427 V!46427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40400)

(assert (=> b!1219063 (= lt!554216 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101426 res!809673) b!1219052))

(assert (= (and b!1219052 res!809669) b!1219058))

(assert (= (and b!1219058 res!809660) b!1219047))

(assert (= (and b!1219047 res!809665) b!1219048))

(assert (= (and b!1219048 res!809666) b!1219053))

(assert (= (and b!1219053 res!809662) b!1219062))

(assert (= (and b!1219062 res!809661) b!1219055))

(assert (= (and b!1219055 res!809672) b!1219049))

(assert (= (and b!1219049 res!809668) b!1219056))

(assert (= (and b!1219056 res!809658) b!1219050))

(assert (= (and b!1219050 (not res!809670)) b!1219054))

(assert (= (and b!1219054 (not res!809667)) b!1219063))

(assert (= (and b!1219063 (not res!809659)) b!1219046))

(assert (= (and b!1219046 res!809664) b!1219057))

(assert (= (and b!1219057 (not res!809671)) b!1219051))

(assert (= (and b!1219046 (not res!809663)) b!1219059))

(assert (= (and b!1219045 condMapEmpty!48346) mapIsEmpty!48346))

(assert (= (and b!1219045 (not condMapEmpty!48346)) mapNonEmpty!48346))

(get-info :version)

(assert (= (and mapNonEmpty!48346 ((_ is ValueCellFull!14778) mapValue!48346)) b!1219061))

(assert (= (and b!1219045 ((_ is ValueCellFull!14778) mapDefault!48346)) b!1219060))

(assert (= start!101426 b!1219045))

(declare-fun b_lambda!22061 () Bool)

(assert (=> (not b_lambda!22061) (not b!1219054)))

(declare-fun t!40051 () Bool)

(declare-fun tb!11071 () Bool)

(assert (=> (and start!101426 (= defaultEntry!1004 defaultEntry!1004) t!40051) tb!11071))

(declare-fun result!22745 () Bool)

(assert (=> tb!11071 (= result!22745 tp_is_empty!30975)))

(assert (=> b!1219054 t!40051))

(declare-fun b_and!43715 () Bool)

(assert (= b_and!43713 (and (=> t!40051 result!22745) b_and!43715)))

(declare-fun m!1123799 () Bool)

(assert (=> b!1219063 m!1123799))

(declare-fun m!1123801 () Bool)

(assert (=> b!1219063 m!1123801))

(declare-fun m!1123803 () Bool)

(assert (=> b!1219063 m!1123803))

(declare-fun m!1123805 () Bool)

(assert (=> b!1219063 m!1123805))

(declare-fun m!1123807 () Bool)

(assert (=> b!1219063 m!1123807))

(declare-fun m!1123809 () Bool)

(assert (=> b!1219063 m!1123809))

(assert (=> b!1219063 m!1123807))

(assert (=> b!1219046 m!1123807))

(declare-fun m!1123811 () Bool)

(assert (=> b!1219046 m!1123811))

(assert (=> b!1219046 m!1123811))

(declare-fun m!1123813 () Bool)

(assert (=> b!1219046 m!1123813))

(declare-fun m!1123815 () Bool)

(assert (=> b!1219046 m!1123815))

(declare-fun m!1123817 () Bool)

(assert (=> b!1219056 m!1123817))

(declare-fun m!1123819 () Bool)

(assert (=> b!1219055 m!1123819))

(declare-fun m!1123821 () Bool)

(assert (=> mapNonEmpty!48346 m!1123821))

(declare-fun m!1123823 () Bool)

(assert (=> b!1219048 m!1123823))

(declare-fun m!1123825 () Bool)

(assert (=> b!1219059 m!1123825))

(declare-fun m!1123827 () Bool)

(assert (=> b!1219059 m!1123827))

(declare-fun m!1123829 () Bool)

(assert (=> b!1219062 m!1123829))

(declare-fun m!1123831 () Bool)

(assert (=> b!1219049 m!1123831))

(declare-fun m!1123833 () Bool)

(assert (=> b!1219049 m!1123833))

(declare-fun m!1123835 () Bool)

(assert (=> b!1219051 m!1123835))

(declare-fun m!1123837 () Bool)

(assert (=> b!1219052 m!1123837))

(declare-fun m!1123839 () Bool)

(assert (=> b!1219047 m!1123839))

(declare-fun m!1123841 () Bool)

(assert (=> start!101426 m!1123841))

(declare-fun m!1123843 () Bool)

(assert (=> start!101426 m!1123843))

(declare-fun m!1123845 () Bool)

(assert (=> b!1219054 m!1123845))

(declare-fun m!1123847 () Bool)

(assert (=> b!1219054 m!1123847))

(declare-fun m!1123849 () Bool)

(assert (=> b!1219054 m!1123849))

(declare-fun m!1123851 () Bool)

(assert (=> b!1219054 m!1123851))

(declare-fun m!1123853 () Bool)

(assert (=> b!1219050 m!1123853))

(declare-fun m!1123855 () Bool)

(assert (=> b!1219050 m!1123855))

(assert (=> b!1219057 m!1123807))

(check-sat (not b!1219046) (not b!1219063) (not b!1219050) (not b!1219047) (not b_lambda!22061) (not b!1219059) (not b_next!26271) (not b!1219062) (not b!1219051) b_and!43715 (not start!101426) (not mapNonEmpty!48346) (not b!1219048) (not b!1219054) (not b!1219049) (not b!1219056) (not b!1219052) tp_is_empty!30975)
(check-sat b_and!43715 (not b_next!26271))
(get-model)

(declare-fun b_lambda!22065 () Bool)

(assert (= b_lambda!22061 (or (and start!101426 b_free!26271) b_lambda!22065)))

(check-sat (not b!1219046) (not b!1219063) (not b!1219050) (not b_lambda!22065) (not b!1219047) (not b!1219059) (not b_next!26271) (not b!1219062) (not b!1219051) b_and!43715 (not start!101426) (not mapNonEmpty!48346) (not b!1219048) (not b!1219054) (not b!1219049) (not b!1219056) (not b!1219052) tp_is_empty!30975)
(check-sat b_and!43715 (not b_next!26271))
(get-model)

(declare-fun d!133685 () Bool)

(declare-fun res!809726 () Bool)

(declare-fun e!692191 () Bool)

(assert (=> d!133685 (=> res!809726 e!692191)))

(assert (=> d!133685 (= res!809726 (= (select (arr!37995 _keys!1208) i!673) k0!934))))

(assert (=> d!133685 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!692191)))

(declare-fun b!1219129 () Bool)

(declare-fun e!692192 () Bool)

(assert (=> b!1219129 (= e!692191 e!692192)))

(declare-fun res!809727 () Bool)

(assert (=> b!1219129 (=> (not res!809727) (not e!692192))))

(assert (=> b!1219129 (= res!809727 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38531 _keys!1208)))))

(declare-fun b!1219130 () Bool)

(assert (=> b!1219130 (= e!692192 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133685 (not res!809726)) b!1219129))

(assert (= (and b!1219129 res!809727) b!1219130))

(assert (=> d!133685 m!1123819))

(declare-fun m!1123915 () Bool)

(assert (=> b!1219130 m!1123915))

(assert (=> b!1219051 d!133685))

(declare-fun d!133687 () Bool)

(declare-fun res!809728 () Bool)

(declare-fun e!692193 () Bool)

(assert (=> d!133687 (=> res!809728 e!692193)))

(assert (=> d!133687 (= res!809728 (= (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133687 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!692193)))

(declare-fun b!1219131 () Bool)

(declare-fun e!692194 () Bool)

(assert (=> b!1219131 (= e!692193 e!692194)))

(declare-fun res!809729 () Bool)

(assert (=> b!1219131 (=> (not res!809729) (not e!692194))))

(assert (=> b!1219131 (= res!809729 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38531 _keys!1208)))))

(declare-fun b!1219132 () Bool)

(assert (=> b!1219132 (= e!692194 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133687 (not res!809728)) b!1219131))

(assert (= (and b!1219131 res!809729) b!1219132))

(declare-fun m!1123917 () Bool)

(assert (=> d!133687 m!1123917))

(declare-fun m!1123919 () Bool)

(assert (=> b!1219132 m!1123919))

(assert (=> b!1219059 d!133687))

(declare-fun d!133689 () Bool)

(assert (=> d!133689 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554259 () Unit!40400)

(declare-fun choose!114 (array!78727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40400)

(assert (=> d!133689 (= lt!554259 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133689 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133689 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!554259)))

(declare-fun bs!34339 () Bool)

(assert (= bs!34339 d!133689))

(assert (=> bs!34339 m!1123825))

(declare-fun m!1123921 () Bool)

(assert (=> bs!34339 m!1123921))

(assert (=> b!1219059 d!133689))

(declare-fun d!133691 () Bool)

(assert (=> d!133691 (= (array_inv!28916 _keys!1208) (bvsge (size!38531 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101426 d!133691))

(declare-fun d!133693 () Bool)

(assert (=> d!133693 (= (array_inv!28917 _values!996) (bvsge (size!38530 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101426 d!133693))

(declare-fun d!133695 () Bool)

(declare-fun res!809730 () Bool)

(declare-fun e!692195 () Bool)

(assert (=> d!133695 (=> res!809730 e!692195)))

(assert (=> d!133695 (= res!809730 (= (select (arr!37995 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133695 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!692195)))

(declare-fun b!1219133 () Bool)

(declare-fun e!692196 () Bool)

(assert (=> b!1219133 (= e!692195 e!692196)))

(declare-fun res!809731 () Bool)

(assert (=> b!1219133 (=> (not res!809731) (not e!692196))))

(assert (=> b!1219133 (= res!809731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38531 _keys!1208)))))

(declare-fun b!1219134 () Bool)

(assert (=> b!1219134 (= e!692196 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133695 (not res!809730)) b!1219133))

(assert (= (and b!1219133 res!809731) b!1219134))

(declare-fun m!1123923 () Bool)

(assert (=> d!133695 m!1123923))

(declare-fun m!1123925 () Bool)

(assert (=> b!1219134 m!1123925))

(assert (=> b!1219050 d!133695))

(declare-fun d!133697 () Bool)

(assert (=> d!133697 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554262 () Unit!40400)

(declare-fun choose!13 (array!78727 (_ BitVec 64) (_ BitVec 32)) Unit!40400)

(assert (=> d!133697 (= lt!554262 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133697 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133697 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554262)))

(declare-fun bs!34340 () Bool)

(assert (= bs!34340 d!133697))

(assert (=> bs!34340 m!1123853))

(declare-fun m!1123927 () Bool)

(assert (=> bs!34340 m!1123927))

(assert (=> b!1219050 d!133697))

(declare-fun bm!60666 () Bool)

(declare-fun call!60669 () Bool)

(declare-fun c!120165 () Bool)

(assert (=> bm!60666 (= call!60669 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120165 (Cons!26798 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000) Nil!26799) Nil!26799)))))

(declare-fun b!1219145 () Bool)

(declare-fun e!692206 () Bool)

(declare-fun contains!7014 (List!26802 (_ BitVec 64)) Bool)

(assert (=> b!1219145 (= e!692206 (contains!7014 Nil!26799 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133699 () Bool)

(declare-fun res!809740 () Bool)

(declare-fun e!692207 () Bool)

(assert (=> d!133699 (=> res!809740 e!692207)))

(assert (=> d!133699 (= res!809740 (bvsge #b00000000000000000000000000000000 (size!38531 _keys!1208)))))

(assert (=> d!133699 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26799) e!692207)))

(declare-fun b!1219146 () Bool)

(declare-fun e!692205 () Bool)

(assert (=> b!1219146 (= e!692205 call!60669)))

(declare-fun b!1219147 () Bool)

(declare-fun e!692208 () Bool)

(assert (=> b!1219147 (= e!692208 e!692205)))

(assert (=> b!1219147 (= c!120165 (validKeyInArray!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219148 () Bool)

(assert (=> b!1219148 (= e!692207 e!692208)))

(declare-fun res!809738 () Bool)

(assert (=> b!1219148 (=> (not res!809738) (not e!692208))))

(assert (=> b!1219148 (= res!809738 (not e!692206))))

(declare-fun res!809739 () Bool)

(assert (=> b!1219148 (=> (not res!809739) (not e!692206))))

(assert (=> b!1219148 (= res!809739 (validKeyInArray!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1219149 () Bool)

(assert (=> b!1219149 (= e!692205 call!60669)))

(assert (= (and d!133699 (not res!809740)) b!1219148))

(assert (= (and b!1219148 res!809739) b!1219145))

(assert (= (and b!1219148 res!809738) b!1219147))

(assert (= (and b!1219147 c!120165) b!1219146))

(assert (= (and b!1219147 (not c!120165)) b!1219149))

(assert (= (or b!1219146 b!1219149) bm!60666))

(assert (=> bm!60666 m!1123923))

(declare-fun m!1123929 () Bool)

(assert (=> bm!60666 m!1123929))

(assert (=> b!1219145 m!1123923))

(assert (=> b!1219145 m!1123923))

(declare-fun m!1123931 () Bool)

(assert (=> b!1219145 m!1123931))

(assert (=> b!1219147 m!1123923))

(assert (=> b!1219147 m!1123923))

(declare-fun m!1123933 () Bool)

(assert (=> b!1219147 m!1123933))

(assert (=> b!1219148 m!1123923))

(assert (=> b!1219148 m!1123923))

(assert (=> b!1219148 m!1123933))

(assert (=> b!1219048 d!133699))

(declare-fun b!1219158 () Bool)

(declare-fun e!692217 () Bool)

(declare-fun call!60672 () Bool)

(assert (=> b!1219158 (= e!692217 call!60672)))

(declare-fun bm!60669 () Bool)

(assert (=> bm!60669 (= call!60672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!554219 mask!1564))))

(declare-fun b!1219159 () Bool)

(declare-fun e!692215 () Bool)

(declare-fun e!692216 () Bool)

(assert (=> b!1219159 (= e!692215 e!692216)))

(declare-fun c!120168 () Bool)

(assert (=> b!1219159 (= c!120168 (validKeyInArray!0 (select (arr!37995 lt!554219) #b00000000000000000000000000000000)))))

(declare-fun d!133701 () Bool)

(declare-fun res!809746 () Bool)

(assert (=> d!133701 (=> res!809746 e!692215)))

(assert (=> d!133701 (= res!809746 (bvsge #b00000000000000000000000000000000 (size!38531 lt!554219)))))

(assert (=> d!133701 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554219 mask!1564) e!692215)))

(declare-fun b!1219160 () Bool)

(assert (=> b!1219160 (= e!692216 call!60672)))

(declare-fun b!1219161 () Bool)

(assert (=> b!1219161 (= e!692216 e!692217)))

(declare-fun lt!554270 () (_ BitVec 64))

(assert (=> b!1219161 (= lt!554270 (select (arr!37995 lt!554219) #b00000000000000000000000000000000))))

(declare-fun lt!554271 () Unit!40400)

(assert (=> b!1219161 (= lt!554271 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!554219 lt!554270 #b00000000000000000000000000000000))))

(assert (=> b!1219161 (arrayContainsKey!0 lt!554219 lt!554270 #b00000000000000000000000000000000)))

(declare-fun lt!554269 () Unit!40400)

(assert (=> b!1219161 (= lt!554269 lt!554271)))

(declare-fun res!809745 () Bool)

(declare-datatypes ((SeekEntryResult!9946 0))(
  ( (MissingZero!9946 (index!42155 (_ BitVec 32))) (Found!9946 (index!42156 (_ BitVec 32))) (Intermediate!9946 (undefined!10758 Bool) (index!42157 (_ BitVec 32)) (x!107394 (_ BitVec 32))) (Undefined!9946) (MissingVacant!9946 (index!42158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78727 (_ BitVec 32)) SeekEntryResult!9946)

(assert (=> b!1219161 (= res!809745 (= (seekEntryOrOpen!0 (select (arr!37995 lt!554219) #b00000000000000000000000000000000) lt!554219 mask!1564) (Found!9946 #b00000000000000000000000000000000)))))

(assert (=> b!1219161 (=> (not res!809745) (not e!692217))))

(assert (= (and d!133701 (not res!809746)) b!1219159))

(assert (= (and b!1219159 c!120168) b!1219161))

(assert (= (and b!1219159 (not c!120168)) b!1219160))

(assert (= (and b!1219161 res!809745) b!1219158))

(assert (= (or b!1219158 b!1219160) bm!60669))

(declare-fun m!1123935 () Bool)

(assert (=> bm!60669 m!1123935))

(declare-fun m!1123937 () Bool)

(assert (=> b!1219159 m!1123937))

(assert (=> b!1219159 m!1123937))

(declare-fun m!1123939 () Bool)

(assert (=> b!1219159 m!1123939))

(assert (=> b!1219161 m!1123937))

(declare-fun m!1123941 () Bool)

(assert (=> b!1219161 m!1123941))

(declare-fun m!1123943 () Bool)

(assert (=> b!1219161 m!1123943))

(assert (=> b!1219161 m!1123937))

(declare-fun m!1123945 () Bool)

(assert (=> b!1219161 m!1123945))

(assert (=> b!1219049 d!133701))

(declare-fun b!1219162 () Bool)

(declare-fun e!692220 () Bool)

(declare-fun call!60673 () Bool)

(assert (=> b!1219162 (= e!692220 call!60673)))

(declare-fun bm!60670 () Bool)

(assert (=> bm!60670 (= call!60673 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1219163 () Bool)

(declare-fun e!692218 () Bool)

(declare-fun e!692219 () Bool)

(assert (=> b!1219163 (= e!692218 e!692219)))

(declare-fun c!120169 () Bool)

(assert (=> b!1219163 (= c!120169 (validKeyInArray!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133703 () Bool)

(declare-fun res!809748 () Bool)

(assert (=> d!133703 (=> res!809748 e!692218)))

(assert (=> d!133703 (= res!809748 (bvsge #b00000000000000000000000000000000 (size!38531 _keys!1208)))))

(assert (=> d!133703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!692218)))

(declare-fun b!1219164 () Bool)

(assert (=> b!1219164 (= e!692219 call!60673)))

(declare-fun b!1219165 () Bool)

(assert (=> b!1219165 (= e!692219 e!692220)))

(declare-fun lt!554273 () (_ BitVec 64))

(assert (=> b!1219165 (= lt!554273 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554274 () Unit!40400)

(assert (=> b!1219165 (= lt!554274 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554273 #b00000000000000000000000000000000))))

(assert (=> b!1219165 (arrayContainsKey!0 _keys!1208 lt!554273 #b00000000000000000000000000000000)))

(declare-fun lt!554272 () Unit!40400)

(assert (=> b!1219165 (= lt!554272 lt!554274)))

(declare-fun res!809747 () Bool)

(assert (=> b!1219165 (= res!809747 (= (seekEntryOrOpen!0 (select (arr!37995 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9946 #b00000000000000000000000000000000)))))

(assert (=> b!1219165 (=> (not res!809747) (not e!692220))))

(assert (= (and d!133703 (not res!809748)) b!1219163))

(assert (= (and b!1219163 c!120169) b!1219165))

(assert (= (and b!1219163 (not c!120169)) b!1219164))

(assert (= (and b!1219165 res!809747) b!1219162))

(assert (= (or b!1219162 b!1219164) bm!60670))

(declare-fun m!1123947 () Bool)

(assert (=> bm!60670 m!1123947))

(assert (=> b!1219163 m!1123923))

(assert (=> b!1219163 m!1123923))

(assert (=> b!1219163 m!1123933))

(assert (=> b!1219165 m!1123923))

(declare-fun m!1123949 () Bool)

(assert (=> b!1219165 m!1123949))

(declare-fun m!1123951 () Bool)

(assert (=> b!1219165 m!1123951))

(assert (=> b!1219165 m!1123923))

(declare-fun m!1123953 () Bool)

(assert (=> b!1219165 m!1123953))

(assert (=> b!1219047 d!133703))

(declare-fun bm!60671 () Bool)

(declare-fun call!60674 () Bool)

(declare-fun c!120170 () Bool)

(assert (=> bm!60671 (= call!60674 (arrayNoDuplicates!0 lt!554219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120170 (Cons!26798 (select (arr!37995 lt!554219) #b00000000000000000000000000000000) Nil!26799) Nil!26799)))))

(declare-fun b!1219166 () Bool)

(declare-fun e!692222 () Bool)

(assert (=> b!1219166 (= e!692222 (contains!7014 Nil!26799 (select (arr!37995 lt!554219) #b00000000000000000000000000000000)))))

(declare-fun d!133705 () Bool)

(declare-fun res!809751 () Bool)

(declare-fun e!692223 () Bool)

(assert (=> d!133705 (=> res!809751 e!692223)))

(assert (=> d!133705 (= res!809751 (bvsge #b00000000000000000000000000000000 (size!38531 lt!554219)))))

(assert (=> d!133705 (= (arrayNoDuplicates!0 lt!554219 #b00000000000000000000000000000000 Nil!26799) e!692223)))

(declare-fun b!1219167 () Bool)

(declare-fun e!692221 () Bool)

(assert (=> b!1219167 (= e!692221 call!60674)))

(declare-fun b!1219168 () Bool)

(declare-fun e!692224 () Bool)

(assert (=> b!1219168 (= e!692224 e!692221)))

(assert (=> b!1219168 (= c!120170 (validKeyInArray!0 (select (arr!37995 lt!554219) #b00000000000000000000000000000000)))))

(declare-fun b!1219169 () Bool)

(assert (=> b!1219169 (= e!692223 e!692224)))

(declare-fun res!809749 () Bool)

(assert (=> b!1219169 (=> (not res!809749) (not e!692224))))

(assert (=> b!1219169 (= res!809749 (not e!692222))))

(declare-fun res!809750 () Bool)

(assert (=> b!1219169 (=> (not res!809750) (not e!692222))))

(assert (=> b!1219169 (= res!809750 (validKeyInArray!0 (select (arr!37995 lt!554219) #b00000000000000000000000000000000)))))

(declare-fun b!1219170 () Bool)

(assert (=> b!1219170 (= e!692221 call!60674)))

(assert (= (and d!133705 (not res!809751)) b!1219169))

(assert (= (and b!1219169 res!809750) b!1219166))

(assert (= (and b!1219169 res!809749) b!1219168))

(assert (= (and b!1219168 c!120170) b!1219167))

(assert (= (and b!1219168 (not c!120170)) b!1219170))

(assert (= (or b!1219167 b!1219170) bm!60671))

(assert (=> bm!60671 m!1123937))

(declare-fun m!1123955 () Bool)

(assert (=> bm!60671 m!1123955))

(assert (=> b!1219166 m!1123937))

(assert (=> b!1219166 m!1123937))

(declare-fun m!1123957 () Bool)

(assert (=> b!1219166 m!1123957))

(assert (=> b!1219168 m!1123937))

(assert (=> b!1219168 m!1123937))

(assert (=> b!1219168 m!1123939))

(assert (=> b!1219169 m!1123937))

(assert (=> b!1219169 m!1123937))

(assert (=> b!1219169 m!1123939))

(assert (=> b!1219056 d!133705))

(declare-fun d!133707 () Bool)

(declare-fun e!692227 () Bool)

(assert (=> d!133707 e!692227))

(declare-fun res!809757 () Bool)

(assert (=> d!133707 (=> (not res!809757) (not e!692227))))

(declare-fun lt!554285 () ListLongMap!17969)

(declare-fun contains!7015 (ListLongMap!17969 (_ BitVec 64)) Bool)

(assert (=> d!133707 (= res!809757 (contains!7015 lt!554285 (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))))))

(declare-fun lt!554283 () List!26801)

(assert (=> d!133707 (= lt!554285 (ListLongMap!17970 lt!554283))))

(declare-fun lt!554284 () Unit!40400)

(declare-fun lt!554286 () Unit!40400)

(assert (=> d!133707 (= lt!554284 lt!554286)))

(declare-datatypes ((Option!695 0))(
  ( (Some!694 (v!18202 V!46427)) (None!693) )
))
(declare-fun getValueByKey!644 (List!26801 (_ BitVec 64)) Option!695)

(assert (=> d!133707 (= (getValueByKey!644 lt!554283 (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))) (Some!694 (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!321 (List!26801 (_ BitVec 64) V!46427) Unit!40400)

(assert (=> d!133707 (= lt!554286 (lemmaContainsTupThenGetReturnValue!321 lt!554283 (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218))) (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))))))

(declare-fun insertStrictlySorted!414 (List!26801 (_ BitVec 64) V!46427) List!26801)

(assert (=> d!133707 (= lt!554283 (insertStrictlySorted!414 (toList!9000 lt!554217) (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218))) (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))))))

(assert (=> d!133707 (= (+!4069 lt!554217 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218))) lt!554285)))

(declare-fun b!1219175 () Bool)

(declare-fun res!809756 () Bool)

(assert (=> b!1219175 (=> (not res!809756) (not e!692227))))

(assert (=> b!1219175 (= res!809756 (= (getValueByKey!644 (toList!9000 lt!554285) (_1!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218)))) (Some!694 (_2!10011 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218))))))))

(declare-fun b!1219176 () Bool)

(declare-fun contains!7016 (List!26801 tuple2!20000) Bool)

(assert (=> b!1219176 (= e!692227 (contains!7016 (toList!9000 lt!554285) (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218))))))

(assert (= (and d!133707 res!809757) b!1219175))

(assert (= (and b!1219175 res!809756) b!1219176))

(declare-fun m!1123959 () Bool)

(assert (=> d!133707 m!1123959))

(declare-fun m!1123961 () Bool)

(assert (=> d!133707 m!1123961))

(declare-fun m!1123963 () Bool)

(assert (=> d!133707 m!1123963))

(declare-fun m!1123965 () Bool)

(assert (=> d!133707 m!1123965))

(declare-fun m!1123967 () Bool)

(assert (=> b!1219175 m!1123967))

(declare-fun m!1123969 () Bool)

(assert (=> b!1219176 m!1123969))

(assert (=> b!1219046 d!133707))

(declare-fun d!133709 () Bool)

(declare-fun c!120173 () Bool)

(assert (=> d!133709 (= c!120173 ((_ is ValueCellFull!14778) (select (arr!37994 _values!996) from!1455)))))

(declare-fun e!692230 () V!46427)

(assert (=> d!133709 (= (get!19372 (select (arr!37994 _values!996) from!1455) lt!554218) e!692230)))

(declare-fun b!1219181 () Bool)

(declare-fun get!19374 (ValueCell!14778 V!46427) V!46427)

(assert (=> b!1219181 (= e!692230 (get!19374 (select (arr!37994 _values!996) from!1455) lt!554218))))

(declare-fun b!1219182 () Bool)

(declare-fun get!19375 (ValueCell!14778 V!46427) V!46427)

(assert (=> b!1219182 (= e!692230 (get!19375 (select (arr!37994 _values!996) from!1455) lt!554218))))

(assert (= (and d!133709 c!120173) b!1219181))

(assert (= (and d!133709 (not c!120173)) b!1219182))

(assert (=> b!1219181 m!1123811))

(declare-fun m!1123971 () Bool)

(assert (=> b!1219181 m!1123971))

(assert (=> b!1219182 m!1123811))

(declare-fun m!1123973 () Bool)

(assert (=> b!1219182 m!1123973))

(assert (=> b!1219046 d!133709))

(declare-fun b!1219207 () Bool)

(declare-fun e!692250 () ListLongMap!17969)

(assert (=> b!1219207 (= e!692250 (ListLongMap!17970 Nil!26798))))

(declare-fun b!1219208 () Bool)

(declare-fun e!692245 () Bool)

(declare-fun e!692251 () Bool)

(assert (=> b!1219208 (= e!692245 e!692251)))

(declare-fun c!120183 () Bool)

(declare-fun e!692249 () Bool)

(assert (=> b!1219208 (= c!120183 e!692249)))

(declare-fun res!809767 () Bool)

(assert (=> b!1219208 (=> (not res!809767) (not e!692249))))

(assert (=> b!1219208 (= res!809767 (bvslt from!1455 (size!38531 lt!554219)))))

(declare-fun b!1219209 () Bool)

(assert (=> b!1219209 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38531 lt!554219)))))

(assert (=> b!1219209 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38530 lt!554220)))))

(declare-fun lt!554306 () ListLongMap!17969)

(declare-fun e!692247 () Bool)

(declare-fun apply!973 (ListLongMap!17969 (_ BitVec 64)) V!46427)

(assert (=> b!1219209 (= e!692247 (= (apply!973 lt!554306 (select (arr!37995 lt!554219) from!1455)) (get!19372 (select (arr!37994 lt!554220) from!1455) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219210 () Bool)

(declare-fun e!692246 () Bool)

(declare-fun isEmpty!997 (ListLongMap!17969) Bool)

(assert (=> b!1219210 (= e!692246 (isEmpty!997 lt!554306))))

(declare-fun d!133711 () Bool)

(assert (=> d!133711 e!692245))

(declare-fun res!809769 () Bool)

(assert (=> d!133711 (=> (not res!809769) (not e!692245))))

(assert (=> d!133711 (= res!809769 (not (contains!7015 lt!554306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133711 (= lt!554306 e!692250)))

(declare-fun c!120182 () Bool)

(assert (=> d!133711 (= c!120182 (bvsge from!1455 (size!38531 lt!554219)))))

(assert (=> d!133711 (validMask!0 mask!1564)))

(assert (=> d!133711 (= (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554306)))

(declare-fun b!1219211 () Bool)

(declare-fun lt!554303 () Unit!40400)

(declare-fun lt!554305 () Unit!40400)

(assert (=> b!1219211 (= lt!554303 lt!554305)))

(declare-fun lt!554307 () V!46427)

(declare-fun lt!554302 () ListLongMap!17969)

(declare-fun lt!554301 () (_ BitVec 64))

(declare-fun lt!554304 () (_ BitVec 64))

(assert (=> b!1219211 (not (contains!7015 (+!4069 lt!554302 (tuple2!20001 lt!554304 lt!554307)) lt!554301))))

(declare-fun addStillNotContains!301 (ListLongMap!17969 (_ BitVec 64) V!46427 (_ BitVec 64)) Unit!40400)

(assert (=> b!1219211 (= lt!554305 (addStillNotContains!301 lt!554302 lt!554304 lt!554307 lt!554301))))

(assert (=> b!1219211 (= lt!554301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219211 (= lt!554307 (get!19372 (select (arr!37994 lt!554220) from!1455) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219211 (= lt!554304 (select (arr!37995 lt!554219) from!1455))))

(declare-fun call!60677 () ListLongMap!17969)

(assert (=> b!1219211 (= lt!554302 call!60677)))

(declare-fun e!692248 () ListLongMap!17969)

(assert (=> b!1219211 (= e!692248 (+!4069 call!60677 (tuple2!20001 (select (arr!37995 lt!554219) from!1455) (get!19372 (select (arr!37994 lt!554220) from!1455) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219212 () Bool)

(assert (=> b!1219212 (= e!692246 (= lt!554306 (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!60674 () Bool)

(assert (=> bm!60674 (= call!60677 (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1219213 () Bool)

(assert (=> b!1219213 (= e!692251 e!692246)))

(declare-fun c!120185 () Bool)

(assert (=> b!1219213 (= c!120185 (bvslt from!1455 (size!38531 lt!554219)))))

(declare-fun b!1219214 () Bool)

(assert (=> b!1219214 (= e!692250 e!692248)))

(declare-fun c!120184 () Bool)

(assert (=> b!1219214 (= c!120184 (validKeyInArray!0 (select (arr!37995 lt!554219) from!1455)))))

(declare-fun b!1219215 () Bool)

(assert (=> b!1219215 (= e!692251 e!692247)))

(assert (=> b!1219215 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38531 lt!554219)))))

(declare-fun res!809768 () Bool)

(assert (=> b!1219215 (= res!809768 (contains!7015 lt!554306 (select (arr!37995 lt!554219) from!1455)))))

(assert (=> b!1219215 (=> (not res!809768) (not e!692247))))

(declare-fun b!1219216 () Bool)

(declare-fun res!809766 () Bool)

(assert (=> b!1219216 (=> (not res!809766) (not e!692245))))

(assert (=> b!1219216 (= res!809766 (not (contains!7015 lt!554306 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219217 () Bool)

(assert (=> b!1219217 (= e!692249 (validKeyInArray!0 (select (arr!37995 lt!554219) from!1455)))))

(assert (=> b!1219217 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1219218 () Bool)

(assert (=> b!1219218 (= e!692248 call!60677)))

(assert (= (and d!133711 c!120182) b!1219207))

(assert (= (and d!133711 (not c!120182)) b!1219214))

(assert (= (and b!1219214 c!120184) b!1219211))

(assert (= (and b!1219214 (not c!120184)) b!1219218))

(assert (= (or b!1219211 b!1219218) bm!60674))

(assert (= (and d!133711 res!809769) b!1219216))

(assert (= (and b!1219216 res!809766) b!1219208))

(assert (= (and b!1219208 res!809767) b!1219217))

(assert (= (and b!1219208 c!120183) b!1219215))

(assert (= (and b!1219208 (not c!120183)) b!1219213))

(assert (= (and b!1219215 res!809768) b!1219209))

(assert (= (and b!1219213 c!120185) b!1219212))

(assert (= (and b!1219213 (not c!120185)) b!1219210))

(declare-fun b_lambda!22067 () Bool)

(assert (=> (not b_lambda!22067) (not b!1219209)))

(assert (=> b!1219209 t!40051))

(declare-fun b_and!43721 () Bool)

(assert (= b_and!43715 (and (=> t!40051 result!22745) b_and!43721)))

(declare-fun b_lambda!22069 () Bool)

(assert (=> (not b_lambda!22069) (not b!1219211)))

(assert (=> b!1219211 t!40051))

(declare-fun b_and!43723 () Bool)

(assert (= b_and!43721 (and (=> t!40051 result!22745) b_and!43723)))

(declare-fun m!1123975 () Bool)

(assert (=> b!1219217 m!1123975))

(assert (=> b!1219217 m!1123975))

(declare-fun m!1123977 () Bool)

(assert (=> b!1219217 m!1123977))

(assert (=> b!1219214 m!1123975))

(assert (=> b!1219214 m!1123975))

(assert (=> b!1219214 m!1123977))

(declare-fun m!1123979 () Bool)

(assert (=> bm!60674 m!1123979))

(declare-fun m!1123981 () Bool)

(assert (=> d!133711 m!1123981))

(assert (=> d!133711 m!1123837))

(assert (=> b!1219212 m!1123979))

(assert (=> b!1219215 m!1123975))

(assert (=> b!1219215 m!1123975))

(declare-fun m!1123983 () Bool)

(assert (=> b!1219215 m!1123983))

(declare-fun m!1123985 () Bool)

(assert (=> b!1219210 m!1123985))

(declare-fun m!1123987 () Bool)

(assert (=> b!1219216 m!1123987))

(assert (=> b!1219209 m!1123975))

(assert (=> b!1219209 m!1123975))

(declare-fun m!1123989 () Bool)

(assert (=> b!1219209 m!1123989))

(assert (=> b!1219209 m!1123849))

(declare-fun m!1123991 () Bool)

(assert (=> b!1219209 m!1123991))

(assert (=> b!1219209 m!1123849))

(declare-fun m!1123993 () Bool)

(assert (=> b!1219209 m!1123993))

(assert (=> b!1219209 m!1123991))

(declare-fun m!1123995 () Bool)

(assert (=> b!1219211 m!1123995))

(declare-fun m!1123997 () Bool)

(assert (=> b!1219211 m!1123997))

(assert (=> b!1219211 m!1123975))

(declare-fun m!1123999 () Bool)

(assert (=> b!1219211 m!1123999))

(assert (=> b!1219211 m!1123849))

(assert (=> b!1219211 m!1123995))

(assert (=> b!1219211 m!1123991))

(declare-fun m!1124001 () Bool)

(assert (=> b!1219211 m!1124001))

(assert (=> b!1219211 m!1123991))

(assert (=> b!1219211 m!1123849))

(assert (=> b!1219211 m!1123993))

(assert (=> b!1219054 d!133711))

(declare-fun b!1219219 () Bool)

(declare-fun e!692257 () ListLongMap!17969)

(assert (=> b!1219219 (= e!692257 (ListLongMap!17970 Nil!26798))))

(declare-fun b!1219220 () Bool)

(declare-fun e!692252 () Bool)

(declare-fun e!692258 () Bool)

(assert (=> b!1219220 (= e!692252 e!692258)))

(declare-fun c!120187 () Bool)

(declare-fun e!692256 () Bool)

(assert (=> b!1219220 (= c!120187 e!692256)))

(declare-fun res!809771 () Bool)

(assert (=> b!1219220 (=> (not res!809771) (not e!692256))))

(assert (=> b!1219220 (= res!809771 (bvslt from!1455 (size!38531 _keys!1208)))))

(declare-fun b!1219221 () Bool)

(assert (=> b!1219221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38531 _keys!1208)))))

(assert (=> b!1219221 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38530 _values!996)))))

(declare-fun e!692254 () Bool)

(declare-fun lt!554313 () ListLongMap!17969)

(assert (=> b!1219221 (= e!692254 (= (apply!973 lt!554313 (select (arr!37995 _keys!1208) from!1455)) (get!19372 (select (arr!37994 _values!996) from!1455) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219222 () Bool)

(declare-fun e!692253 () Bool)

(assert (=> b!1219222 (= e!692253 (isEmpty!997 lt!554313))))

(declare-fun d!133713 () Bool)

(assert (=> d!133713 e!692252))

(declare-fun res!809773 () Bool)

(assert (=> d!133713 (=> (not res!809773) (not e!692252))))

(assert (=> d!133713 (= res!809773 (not (contains!7015 lt!554313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133713 (= lt!554313 e!692257)))

(declare-fun c!120186 () Bool)

(assert (=> d!133713 (= c!120186 (bvsge from!1455 (size!38531 _keys!1208)))))

(assert (=> d!133713 (validMask!0 mask!1564)))

(assert (=> d!133713 (= (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554313)))

(declare-fun b!1219223 () Bool)

(declare-fun lt!554310 () Unit!40400)

(declare-fun lt!554312 () Unit!40400)

(assert (=> b!1219223 (= lt!554310 lt!554312)))

(declare-fun lt!554311 () (_ BitVec 64))

(declare-fun lt!554309 () ListLongMap!17969)

(declare-fun lt!554314 () V!46427)

(declare-fun lt!554308 () (_ BitVec 64))

(assert (=> b!1219223 (not (contains!7015 (+!4069 lt!554309 (tuple2!20001 lt!554311 lt!554314)) lt!554308))))

(assert (=> b!1219223 (= lt!554312 (addStillNotContains!301 lt!554309 lt!554311 lt!554314 lt!554308))))

(assert (=> b!1219223 (= lt!554308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219223 (= lt!554314 (get!19372 (select (arr!37994 _values!996) from!1455) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219223 (= lt!554311 (select (arr!37995 _keys!1208) from!1455))))

(declare-fun call!60678 () ListLongMap!17969)

(assert (=> b!1219223 (= lt!554309 call!60678)))

(declare-fun e!692255 () ListLongMap!17969)

(assert (=> b!1219223 (= e!692255 (+!4069 call!60678 (tuple2!20001 (select (arr!37995 _keys!1208) from!1455) (get!19372 (select (arr!37994 _values!996) from!1455) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219224 () Bool)

(assert (=> b!1219224 (= e!692253 (= lt!554313 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!60675 () Bool)

(assert (=> bm!60675 (= call!60678 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1219225 () Bool)

(assert (=> b!1219225 (= e!692258 e!692253)))

(declare-fun c!120189 () Bool)

(assert (=> b!1219225 (= c!120189 (bvslt from!1455 (size!38531 _keys!1208)))))

(declare-fun b!1219226 () Bool)

(assert (=> b!1219226 (= e!692257 e!692255)))

(declare-fun c!120188 () Bool)

(assert (=> b!1219226 (= c!120188 (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455)))))

(declare-fun b!1219227 () Bool)

(assert (=> b!1219227 (= e!692258 e!692254)))

(assert (=> b!1219227 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38531 _keys!1208)))))

(declare-fun res!809772 () Bool)

(assert (=> b!1219227 (= res!809772 (contains!7015 lt!554313 (select (arr!37995 _keys!1208) from!1455)))))

(assert (=> b!1219227 (=> (not res!809772) (not e!692254))))

(declare-fun b!1219228 () Bool)

(declare-fun res!809770 () Bool)

(assert (=> b!1219228 (=> (not res!809770) (not e!692252))))

(assert (=> b!1219228 (= res!809770 (not (contains!7015 lt!554313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219229 () Bool)

(assert (=> b!1219229 (= e!692256 (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455)))))

(assert (=> b!1219229 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1219230 () Bool)

(assert (=> b!1219230 (= e!692255 call!60678)))

(assert (= (and d!133713 c!120186) b!1219219))

(assert (= (and d!133713 (not c!120186)) b!1219226))

(assert (= (and b!1219226 c!120188) b!1219223))

(assert (= (and b!1219226 (not c!120188)) b!1219230))

(assert (= (or b!1219223 b!1219230) bm!60675))

(assert (= (and d!133713 res!809773) b!1219228))

(assert (= (and b!1219228 res!809770) b!1219220))

(assert (= (and b!1219220 res!809771) b!1219229))

(assert (= (and b!1219220 c!120187) b!1219227))

(assert (= (and b!1219220 (not c!120187)) b!1219225))

(assert (= (and b!1219227 res!809772) b!1219221))

(assert (= (and b!1219225 c!120189) b!1219224))

(assert (= (and b!1219225 (not c!120189)) b!1219222))

(declare-fun b_lambda!22071 () Bool)

(assert (=> (not b_lambda!22071) (not b!1219221)))

(assert (=> b!1219221 t!40051))

(declare-fun b_and!43725 () Bool)

(assert (= b_and!43723 (and (=> t!40051 result!22745) b_and!43725)))

(declare-fun b_lambda!22073 () Bool)

(assert (=> (not b_lambda!22073) (not b!1219223)))

(assert (=> b!1219223 t!40051))

(declare-fun b_and!43727 () Bool)

(assert (= b_and!43725 (and (=> t!40051 result!22745) b_and!43727)))

(assert (=> b!1219229 m!1123807))

(assert (=> b!1219229 m!1123807))

(assert (=> b!1219229 m!1123809))

(assert (=> b!1219226 m!1123807))

(assert (=> b!1219226 m!1123807))

(assert (=> b!1219226 m!1123809))

(declare-fun m!1124003 () Bool)

(assert (=> bm!60675 m!1124003))

(declare-fun m!1124005 () Bool)

(assert (=> d!133713 m!1124005))

(assert (=> d!133713 m!1123837))

(assert (=> b!1219224 m!1124003))

(assert (=> b!1219227 m!1123807))

(assert (=> b!1219227 m!1123807))

(declare-fun m!1124007 () Bool)

(assert (=> b!1219227 m!1124007))

(declare-fun m!1124009 () Bool)

(assert (=> b!1219222 m!1124009))

(declare-fun m!1124011 () Bool)

(assert (=> b!1219228 m!1124011))

(assert (=> b!1219221 m!1123807))

(assert (=> b!1219221 m!1123807))

(declare-fun m!1124013 () Bool)

(assert (=> b!1219221 m!1124013))

(assert (=> b!1219221 m!1123849))

(assert (=> b!1219221 m!1123811))

(assert (=> b!1219221 m!1123849))

(declare-fun m!1124015 () Bool)

(assert (=> b!1219221 m!1124015))

(assert (=> b!1219221 m!1123811))

(declare-fun m!1124017 () Bool)

(assert (=> b!1219223 m!1124017))

(declare-fun m!1124019 () Bool)

(assert (=> b!1219223 m!1124019))

(assert (=> b!1219223 m!1123807))

(declare-fun m!1124021 () Bool)

(assert (=> b!1219223 m!1124021))

(assert (=> b!1219223 m!1123849))

(assert (=> b!1219223 m!1124017))

(assert (=> b!1219223 m!1123811))

(declare-fun m!1124023 () Bool)

(assert (=> b!1219223 m!1124023))

(assert (=> b!1219223 m!1123811))

(assert (=> b!1219223 m!1123849))

(assert (=> b!1219223 m!1124015))

(assert (=> b!1219054 d!133713))

(declare-fun call!60683 () ListLongMap!17969)

(declare-fun b!1219237 () Bool)

(declare-fun e!692263 () Bool)

(declare-fun call!60684 () ListLongMap!17969)

(assert (=> b!1219237 (= e!692263 (= call!60683 (-!1912 call!60684 k0!934)))))

(assert (=> b!1219237 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38530 _values!996)))))

(declare-fun bm!60680 () Bool)

(assert (=> bm!60680 (= call!60684 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219238 () Bool)

(declare-fun e!692264 () Bool)

(assert (=> b!1219238 (= e!692264 e!692263)))

(declare-fun c!120192 () Bool)

(assert (=> b!1219238 (= c!120192 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1219239 () Bool)

(assert (=> b!1219239 (= e!692263 (= call!60683 call!60684))))

(assert (=> b!1219239 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38530 _values!996)))))

(declare-fun d!133715 () Bool)

(assert (=> d!133715 e!692264))

(declare-fun res!809776 () Bool)

(assert (=> d!133715 (=> (not res!809776) (not e!692264))))

(assert (=> d!133715 (= res!809776 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38531 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38531 _keys!1208))))))))

(declare-fun lt!554317 () Unit!40400)

(declare-fun choose!1824 (array!78727 array!78725 (_ BitVec 32) (_ BitVec 32) V!46427 V!46427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40400)

(assert (=> d!133715 (= lt!554317 (choose!1824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133715 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 _keys!1208)))))

(assert (=> d!133715 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554317)))

(declare-fun bm!60681 () Bool)

(assert (=> bm!60681 (= call!60683 (getCurrentListMapNoExtraKeys!5425 (array!78728 (store (arr!37995 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38531 _keys!1208)) (array!78726 (store (arr!37994 _values!996) i!673 (ValueCellFull!14778 (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38530 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133715 res!809776) b!1219238))

(assert (= (and b!1219238 c!120192) b!1219237))

(assert (= (and b!1219238 (not c!120192)) b!1219239))

(assert (= (or b!1219237 b!1219239) bm!60680))

(assert (= (or b!1219237 b!1219239) bm!60681))

(declare-fun b_lambda!22075 () Bool)

(assert (=> (not b_lambda!22075) (not bm!60681)))

(assert (=> bm!60681 t!40051))

(declare-fun b_and!43729 () Bool)

(assert (= b_and!43727 (and (=> t!40051 result!22745) b_and!43729)))

(declare-fun m!1124025 () Bool)

(assert (=> b!1219237 m!1124025))

(assert (=> bm!60680 m!1123799))

(declare-fun m!1124027 () Bool)

(assert (=> d!133715 m!1124027))

(assert (=> bm!60681 m!1123833))

(assert (=> bm!60681 m!1123849))

(declare-fun m!1124029 () Bool)

(assert (=> bm!60681 m!1124029))

(declare-fun m!1124031 () Bool)

(assert (=> bm!60681 m!1124031))

(assert (=> b!1219063 d!133715))

(declare-fun b!1219240 () Bool)

(declare-fun e!692270 () ListLongMap!17969)

(assert (=> b!1219240 (= e!692270 (ListLongMap!17970 Nil!26798))))

(declare-fun b!1219241 () Bool)

(declare-fun e!692265 () Bool)

(declare-fun e!692271 () Bool)

(assert (=> b!1219241 (= e!692265 e!692271)))

(declare-fun c!120194 () Bool)

(declare-fun e!692269 () Bool)

(assert (=> b!1219241 (= c!120194 e!692269)))

(declare-fun res!809778 () Bool)

(assert (=> b!1219241 (=> (not res!809778) (not e!692269))))

(assert (=> b!1219241 (= res!809778 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 _keys!1208)))))

(declare-fun b!1219242 () Bool)

(assert (=> b!1219242 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 _keys!1208)))))

(assert (=> b!1219242 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38530 _values!996)))))

(declare-fun e!692267 () Bool)

(declare-fun lt!554323 () ListLongMap!17969)

(assert (=> b!1219242 (= e!692267 (= (apply!973 lt!554323 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19372 (select (arr!37994 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219243 () Bool)

(declare-fun e!692266 () Bool)

(assert (=> b!1219243 (= e!692266 (isEmpty!997 lt!554323))))

(declare-fun d!133717 () Bool)

(assert (=> d!133717 e!692265))

(declare-fun res!809780 () Bool)

(assert (=> d!133717 (=> (not res!809780) (not e!692265))))

(assert (=> d!133717 (= res!809780 (not (contains!7015 lt!554323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133717 (= lt!554323 e!692270)))

(declare-fun c!120193 () Bool)

(assert (=> d!133717 (= c!120193 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 _keys!1208)))))

(assert (=> d!133717 (validMask!0 mask!1564)))

(assert (=> d!133717 (= (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554323)))

(declare-fun b!1219244 () Bool)

(declare-fun lt!554320 () Unit!40400)

(declare-fun lt!554322 () Unit!40400)

(assert (=> b!1219244 (= lt!554320 lt!554322)))

(declare-fun lt!554319 () ListLongMap!17969)

(declare-fun lt!554318 () (_ BitVec 64))

(declare-fun lt!554321 () (_ BitVec 64))

(declare-fun lt!554324 () V!46427)

(assert (=> b!1219244 (not (contains!7015 (+!4069 lt!554319 (tuple2!20001 lt!554321 lt!554324)) lt!554318))))

(assert (=> b!1219244 (= lt!554322 (addStillNotContains!301 lt!554319 lt!554321 lt!554324 lt!554318))))

(assert (=> b!1219244 (= lt!554318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219244 (= lt!554324 (get!19372 (select (arr!37994 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219244 (= lt!554321 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60685 () ListLongMap!17969)

(assert (=> b!1219244 (= lt!554319 call!60685)))

(declare-fun e!692268 () ListLongMap!17969)

(assert (=> b!1219244 (= e!692268 (+!4069 call!60685 (tuple2!20001 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19372 (select (arr!37994 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219245 () Bool)

(assert (=> b!1219245 (= e!692266 (= lt!554323 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!60682 () Bool)

(assert (=> bm!60682 (= call!60685 (getCurrentListMapNoExtraKeys!5425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1219246 () Bool)

(assert (=> b!1219246 (= e!692271 e!692266)))

(declare-fun c!120196 () Bool)

(assert (=> b!1219246 (= c!120196 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 _keys!1208)))))

(declare-fun b!1219247 () Bool)

(assert (=> b!1219247 (= e!692270 e!692268)))

(declare-fun c!120195 () Bool)

(assert (=> b!1219247 (= c!120195 (validKeyInArray!0 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1219248 () Bool)

(assert (=> b!1219248 (= e!692271 e!692267)))

(assert (=> b!1219248 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 _keys!1208)))))

(declare-fun res!809779 () Bool)

(assert (=> b!1219248 (= res!809779 (contains!7015 lt!554323 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219248 (=> (not res!809779) (not e!692267))))

(declare-fun b!1219249 () Bool)

(declare-fun res!809777 () Bool)

(assert (=> b!1219249 (=> (not res!809777) (not e!692265))))

(assert (=> b!1219249 (= res!809777 (not (contains!7015 lt!554323 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219250 () Bool)

(assert (=> b!1219250 (= e!692269 (validKeyInArray!0 (select (arr!37995 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219250 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1219251 () Bool)

(assert (=> b!1219251 (= e!692268 call!60685)))

(assert (= (and d!133717 c!120193) b!1219240))

(assert (= (and d!133717 (not c!120193)) b!1219247))

(assert (= (and b!1219247 c!120195) b!1219244))

(assert (= (and b!1219247 (not c!120195)) b!1219251))

(assert (= (or b!1219244 b!1219251) bm!60682))

(assert (= (and d!133717 res!809780) b!1219249))

(assert (= (and b!1219249 res!809777) b!1219241))

(assert (= (and b!1219241 res!809778) b!1219250))

(assert (= (and b!1219241 c!120194) b!1219248))

(assert (= (and b!1219241 (not c!120194)) b!1219246))

(assert (= (and b!1219248 res!809779) b!1219242))

(assert (= (and b!1219246 c!120196) b!1219245))

(assert (= (and b!1219246 (not c!120196)) b!1219243))

(declare-fun b_lambda!22077 () Bool)

(assert (=> (not b_lambda!22077) (not b!1219242)))

(assert (=> b!1219242 t!40051))

(declare-fun b_and!43731 () Bool)

(assert (= b_and!43729 (and (=> t!40051 result!22745) b_and!43731)))

(declare-fun b_lambda!22079 () Bool)

(assert (=> (not b_lambda!22079) (not b!1219244)))

(assert (=> b!1219244 t!40051))

(declare-fun b_and!43733 () Bool)

(assert (= b_and!43731 (and (=> t!40051 result!22745) b_and!43733)))

(assert (=> b!1219250 m!1123917))

(assert (=> b!1219250 m!1123917))

(declare-fun m!1124033 () Bool)

(assert (=> b!1219250 m!1124033))

(assert (=> b!1219247 m!1123917))

(assert (=> b!1219247 m!1123917))

(assert (=> b!1219247 m!1124033))

(declare-fun m!1124035 () Bool)

(assert (=> bm!60682 m!1124035))

(declare-fun m!1124037 () Bool)

(assert (=> d!133717 m!1124037))

(assert (=> d!133717 m!1123837))

(assert (=> b!1219245 m!1124035))

(assert (=> b!1219248 m!1123917))

(assert (=> b!1219248 m!1123917))

(declare-fun m!1124039 () Bool)

(assert (=> b!1219248 m!1124039))

(declare-fun m!1124041 () Bool)

(assert (=> b!1219243 m!1124041))

(declare-fun m!1124043 () Bool)

(assert (=> b!1219249 m!1124043))

(assert (=> b!1219242 m!1123917))

(assert (=> b!1219242 m!1123917))

(declare-fun m!1124045 () Bool)

(assert (=> b!1219242 m!1124045))

(assert (=> b!1219242 m!1123849))

(declare-fun m!1124047 () Bool)

(assert (=> b!1219242 m!1124047))

(assert (=> b!1219242 m!1123849))

(declare-fun m!1124049 () Bool)

(assert (=> b!1219242 m!1124049))

(assert (=> b!1219242 m!1124047))

(declare-fun m!1124051 () Bool)

(assert (=> b!1219244 m!1124051))

(declare-fun m!1124053 () Bool)

(assert (=> b!1219244 m!1124053))

(assert (=> b!1219244 m!1123917))

(declare-fun m!1124055 () Bool)

(assert (=> b!1219244 m!1124055))

(assert (=> b!1219244 m!1123849))

(assert (=> b!1219244 m!1124051))

(assert (=> b!1219244 m!1124047))

(declare-fun m!1124057 () Bool)

(assert (=> b!1219244 m!1124057))

(assert (=> b!1219244 m!1124047))

(assert (=> b!1219244 m!1123849))

(assert (=> b!1219244 m!1124049))

(assert (=> b!1219063 d!133717))

(declare-fun b!1219252 () Bool)

(declare-fun e!692277 () ListLongMap!17969)

(assert (=> b!1219252 (= e!692277 (ListLongMap!17970 Nil!26798))))

(declare-fun b!1219253 () Bool)

(declare-fun e!692272 () Bool)

(declare-fun e!692278 () Bool)

(assert (=> b!1219253 (= e!692272 e!692278)))

(declare-fun c!120198 () Bool)

(declare-fun e!692276 () Bool)

(assert (=> b!1219253 (= c!120198 e!692276)))

(declare-fun res!809782 () Bool)

(assert (=> b!1219253 (=> (not res!809782) (not e!692276))))

(assert (=> b!1219253 (= res!809782 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 lt!554219)))))

(declare-fun b!1219254 () Bool)

(assert (=> b!1219254 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 lt!554219)))))

(assert (=> b!1219254 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38530 lt!554220)))))

(declare-fun e!692274 () Bool)

(declare-fun lt!554330 () ListLongMap!17969)

(assert (=> b!1219254 (= e!692274 (= (apply!973 lt!554330 (select (arr!37995 lt!554219) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19372 (select (arr!37994 lt!554220) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1219255 () Bool)

(declare-fun e!692273 () Bool)

(assert (=> b!1219255 (= e!692273 (isEmpty!997 lt!554330))))

(declare-fun d!133719 () Bool)

(assert (=> d!133719 e!692272))

(declare-fun res!809784 () Bool)

(assert (=> d!133719 (=> (not res!809784) (not e!692272))))

(assert (=> d!133719 (= res!809784 (not (contains!7015 lt!554330 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133719 (= lt!554330 e!692277)))

(declare-fun c!120197 () Bool)

(assert (=> d!133719 (= c!120197 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 lt!554219)))))

(assert (=> d!133719 (validMask!0 mask!1564)))

(assert (=> d!133719 (= (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554330)))

(declare-fun b!1219256 () Bool)

(declare-fun lt!554327 () Unit!40400)

(declare-fun lt!554329 () Unit!40400)

(assert (=> b!1219256 (= lt!554327 lt!554329)))

(declare-fun lt!554328 () (_ BitVec 64))

(declare-fun lt!554331 () V!46427)

(declare-fun lt!554325 () (_ BitVec 64))

(declare-fun lt!554326 () ListLongMap!17969)

(assert (=> b!1219256 (not (contains!7015 (+!4069 lt!554326 (tuple2!20001 lt!554328 lt!554331)) lt!554325))))

(assert (=> b!1219256 (= lt!554329 (addStillNotContains!301 lt!554326 lt!554328 lt!554331 lt!554325))))

(assert (=> b!1219256 (= lt!554325 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1219256 (= lt!554331 (get!19372 (select (arr!37994 lt!554220) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1219256 (= lt!554328 (select (arr!37995 lt!554219) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60686 () ListLongMap!17969)

(assert (=> b!1219256 (= lt!554326 call!60686)))

(declare-fun e!692275 () ListLongMap!17969)

(assert (=> b!1219256 (= e!692275 (+!4069 call!60686 (tuple2!20001 (select (arr!37995 lt!554219) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19372 (select (arr!37994 lt!554220) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1219257 () Bool)

(assert (=> b!1219257 (= e!692273 (= lt!554330 (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!60683 () Bool)

(assert (=> bm!60683 (= call!60686 (getCurrentListMapNoExtraKeys!5425 lt!554219 lt!554220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1219258 () Bool)

(assert (=> b!1219258 (= e!692278 e!692273)))

(declare-fun c!120200 () Bool)

(assert (=> b!1219258 (= c!120200 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 lt!554219)))))

(declare-fun b!1219259 () Bool)

(assert (=> b!1219259 (= e!692277 e!692275)))

(declare-fun c!120199 () Bool)

(assert (=> b!1219259 (= c!120199 (validKeyInArray!0 (select (arr!37995 lt!554219) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1219260 () Bool)

(assert (=> b!1219260 (= e!692278 e!692274)))

(assert (=> b!1219260 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38531 lt!554219)))))

(declare-fun res!809783 () Bool)

(assert (=> b!1219260 (= res!809783 (contains!7015 lt!554330 (select (arr!37995 lt!554219) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219260 (=> (not res!809783) (not e!692274))))

(declare-fun b!1219261 () Bool)

(declare-fun res!809781 () Bool)

(assert (=> b!1219261 (=> (not res!809781) (not e!692272))))

(assert (=> b!1219261 (= res!809781 (not (contains!7015 lt!554330 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1219262 () Bool)

(assert (=> b!1219262 (= e!692276 (validKeyInArray!0 (select (arr!37995 lt!554219) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1219262 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1219263 () Bool)

(assert (=> b!1219263 (= e!692275 call!60686)))

(assert (= (and d!133719 c!120197) b!1219252))

(assert (= (and d!133719 (not c!120197)) b!1219259))

(assert (= (and b!1219259 c!120199) b!1219256))

(assert (= (and b!1219259 (not c!120199)) b!1219263))

(assert (= (or b!1219256 b!1219263) bm!60683))

(assert (= (and d!133719 res!809784) b!1219261))

(assert (= (and b!1219261 res!809781) b!1219253))

(assert (= (and b!1219253 res!809782) b!1219262))

(assert (= (and b!1219253 c!120198) b!1219260))

(assert (= (and b!1219253 (not c!120198)) b!1219258))

(assert (= (and b!1219260 res!809783) b!1219254))

(assert (= (and b!1219258 c!120200) b!1219257))

(assert (= (and b!1219258 (not c!120200)) b!1219255))

(declare-fun b_lambda!22081 () Bool)

(assert (=> (not b_lambda!22081) (not b!1219254)))

(assert (=> b!1219254 t!40051))

(declare-fun b_and!43735 () Bool)

(assert (= b_and!43733 (and (=> t!40051 result!22745) b_and!43735)))

(declare-fun b_lambda!22083 () Bool)

(assert (=> (not b_lambda!22083) (not b!1219256)))

(assert (=> b!1219256 t!40051))

(declare-fun b_and!43737 () Bool)

(assert (= b_and!43735 (and (=> t!40051 result!22745) b_and!43737)))

(declare-fun m!1124059 () Bool)

(assert (=> b!1219262 m!1124059))

(assert (=> b!1219262 m!1124059))

(declare-fun m!1124061 () Bool)

(assert (=> b!1219262 m!1124061))

(assert (=> b!1219259 m!1124059))

(assert (=> b!1219259 m!1124059))

(assert (=> b!1219259 m!1124061))

(declare-fun m!1124063 () Bool)

(assert (=> bm!60683 m!1124063))

(declare-fun m!1124065 () Bool)

(assert (=> d!133719 m!1124065))

(assert (=> d!133719 m!1123837))

(assert (=> b!1219257 m!1124063))

(assert (=> b!1219260 m!1124059))

(assert (=> b!1219260 m!1124059))

(declare-fun m!1124067 () Bool)

(assert (=> b!1219260 m!1124067))

(declare-fun m!1124069 () Bool)

(assert (=> b!1219255 m!1124069))

(declare-fun m!1124071 () Bool)

(assert (=> b!1219261 m!1124071))

(assert (=> b!1219254 m!1124059))

(assert (=> b!1219254 m!1124059))

(declare-fun m!1124073 () Bool)

(assert (=> b!1219254 m!1124073))

(assert (=> b!1219254 m!1123849))

(declare-fun m!1124075 () Bool)

(assert (=> b!1219254 m!1124075))

(assert (=> b!1219254 m!1123849))

(declare-fun m!1124077 () Bool)

(assert (=> b!1219254 m!1124077))

(assert (=> b!1219254 m!1124075))

(declare-fun m!1124079 () Bool)

(assert (=> b!1219256 m!1124079))

(declare-fun m!1124081 () Bool)

(assert (=> b!1219256 m!1124081))

(assert (=> b!1219256 m!1124059))

(declare-fun m!1124083 () Bool)

(assert (=> b!1219256 m!1124083))

(assert (=> b!1219256 m!1123849))

(assert (=> b!1219256 m!1124079))

(assert (=> b!1219256 m!1124075))

(declare-fun m!1124085 () Bool)

(assert (=> b!1219256 m!1124085))

(assert (=> b!1219256 m!1124075))

(assert (=> b!1219256 m!1123849))

(assert (=> b!1219256 m!1124077))

(assert (=> b!1219063 d!133719))

(declare-fun d!133721 () Bool)

(assert (=> d!133721 (= (validKeyInArray!0 (select (arr!37995 _keys!1208) from!1455)) (and (not (= (select (arr!37995 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37995 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1219063 d!133721))

(declare-fun d!133723 () Bool)

(declare-fun lt!554334 () ListLongMap!17969)

(assert (=> d!133723 (not (contains!7015 lt!554334 k0!934))))

(declare-fun removeStrictlySorted!106 (List!26801 (_ BitVec 64)) List!26801)

(assert (=> d!133723 (= lt!554334 (ListLongMap!17970 (removeStrictlySorted!106 (toList!9000 lt!554221) k0!934)))))

(assert (=> d!133723 (= (-!1912 lt!554221 k0!934) lt!554334)))

(declare-fun bs!34341 () Bool)

(assert (= bs!34341 d!133723))

(declare-fun m!1124087 () Bool)

(assert (=> bs!34341 m!1124087))

(declare-fun m!1124089 () Bool)

(assert (=> bs!34341 m!1124089))

(assert (=> b!1219063 d!133723))

(declare-fun d!133725 () Bool)

(assert (=> d!133725 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1219062 d!133725))

(declare-fun d!133727 () Bool)

(assert (=> d!133727 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1219052 d!133727))

(declare-fun b!1219271 () Bool)

(declare-fun e!692284 () Bool)

(assert (=> b!1219271 (= e!692284 tp_is_empty!30975)))

(declare-fun mapNonEmpty!48352 () Bool)

(declare-fun mapRes!48352 () Bool)

(declare-fun tp!91853 () Bool)

(declare-fun e!692283 () Bool)

(assert (=> mapNonEmpty!48352 (= mapRes!48352 (and tp!91853 e!692283))))

(declare-fun mapRest!48352 () (Array (_ BitVec 32) ValueCell!14778))

(declare-fun mapKey!48352 () (_ BitVec 32))

(declare-fun mapValue!48352 () ValueCell!14778)

(assert (=> mapNonEmpty!48352 (= mapRest!48346 (store mapRest!48352 mapKey!48352 mapValue!48352))))

(declare-fun condMapEmpty!48352 () Bool)

(declare-fun mapDefault!48352 () ValueCell!14778)

(assert (=> mapNonEmpty!48346 (= condMapEmpty!48352 (= mapRest!48346 ((as const (Array (_ BitVec 32) ValueCell!14778)) mapDefault!48352)))))

(assert (=> mapNonEmpty!48346 (= tp!91843 (and e!692284 mapRes!48352))))

(declare-fun mapIsEmpty!48352 () Bool)

(assert (=> mapIsEmpty!48352 mapRes!48352))

(declare-fun b!1219270 () Bool)

(assert (=> b!1219270 (= e!692283 tp_is_empty!30975)))

(assert (= (and mapNonEmpty!48346 condMapEmpty!48352) mapIsEmpty!48352))

(assert (= (and mapNonEmpty!48346 (not condMapEmpty!48352)) mapNonEmpty!48352))

(assert (= (and mapNonEmpty!48352 ((_ is ValueCellFull!14778) mapValue!48352)) b!1219270))

(assert (= (and mapNonEmpty!48346 ((_ is ValueCellFull!14778) mapDefault!48352)) b!1219271))

(declare-fun m!1124091 () Bool)

(assert (=> mapNonEmpty!48352 m!1124091))

(declare-fun b_lambda!22085 () Bool)

(assert (= b_lambda!22075 (or (and start!101426 b_free!26271) b_lambda!22085)))

(declare-fun b_lambda!22087 () Bool)

(assert (= b_lambda!22073 (or (and start!101426 b_free!26271) b_lambda!22087)))

(declare-fun b_lambda!22089 () Bool)

(assert (= b_lambda!22067 (or (and start!101426 b_free!26271) b_lambda!22089)))

(declare-fun b_lambda!22091 () Bool)

(assert (= b_lambda!22077 (or (and start!101426 b_free!26271) b_lambda!22091)))

(declare-fun b_lambda!22093 () Bool)

(assert (= b_lambda!22083 (or (and start!101426 b_free!26271) b_lambda!22093)))

(declare-fun b_lambda!22095 () Bool)

(assert (= b_lambda!22079 (or (and start!101426 b_free!26271) b_lambda!22095)))

(declare-fun b_lambda!22097 () Bool)

(assert (= b_lambda!22069 (or (and start!101426 b_free!26271) b_lambda!22097)))

(declare-fun b_lambda!22099 () Bool)

(assert (= b_lambda!22081 (or (and start!101426 b_free!26271) b_lambda!22099)))

(declare-fun b_lambda!22101 () Bool)

(assert (= b_lambda!22071 (or (and start!101426 b_free!26271) b_lambda!22101)))

(check-sat (not b!1219211) (not b!1219161) (not bm!60674) (not b_lambda!22093) (not b!1219181) (not bm!60680) (not b!1219169) (not b_lambda!22101) (not b!1219132) (not b_lambda!22089) (not b!1219262) (not b!1219259) (not b!1219255) (not d!133723) (not b!1219159) (not b!1219254) (not b!1219224) (not b!1219134) (not b_lambda!22095) (not b!1219145) (not b!1219209) (not d!133715) (not bm!60666) (not b!1219226) (not b_lambda!22085) (not bm!60669) (not b_lambda!22091) (not b!1219148) (not b!1219212) (not b!1219147) (not b!1219260) (not b!1219250) (not b!1219227) (not b!1219175) (not b_lambda!22099) (not b!1219163) (not d!133719) (not b!1219244) (not b!1219222) (not b!1219242) (not d!133711) (not b!1219214) (not bm!60683) (not bm!60675) (not b!1219210) (not b!1219217) (not b_lambda!22065) (not d!133717) (not d!133707) (not bm!60670) (not b!1219168) (not b!1219165) b_and!43737 (not b!1219256) (not b!1219229) (not b!1219215) (not b!1219249) (not b!1219248) (not b!1219237) (not b!1219176) (not b!1219221) (not b!1219247) (not d!133689) (not b!1219130) (not bm!60682) (not b!1219182) (not b!1219243) (not b_lambda!22087) (not mapNonEmpty!48352) (not d!133697) (not b!1219216) (not b_next!26271) (not b!1219257) (not bm!60681) (not d!133713) (not b!1219245) (not b_lambda!22097) (not b!1219223) tp_is_empty!30975 (not b!1219228) (not bm!60671) (not b!1219166) (not b!1219261))
(check-sat b_and!43737 (not b_next!26271))
