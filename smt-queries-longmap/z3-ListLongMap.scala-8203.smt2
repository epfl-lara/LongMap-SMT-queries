; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100078 () Bool)

(assert start!100078)

(declare-fun b_free!25663 () Bool)

(declare-fun b_next!25663 () Bool)

(assert (=> start!100078 (= b_free!25663 (not b_next!25663))))

(declare-fun tp!89703 () Bool)

(declare-fun b_and!42171 () Bool)

(assert (=> start!100078 (= tp!89703 b_and!42171)))

(declare-fun b!1193130 () Bool)

(declare-fun res!793805 () Bool)

(declare-fun e!678124 () Bool)

(assert (=> b!1193130 (=> (not res!793805) (not e!678124))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193130 (= res!793805 (validKeyInArray!0 k0!934))))

(declare-fun b!1193131 () Bool)

(declare-fun res!793813 () Bool)

(assert (=> b!1193131 (=> (not res!793813) (not e!678124))))

(declare-datatypes ((array!77102 0))(
  ( (array!77103 (arr!37201 (Array (_ BitVec 32) (_ BitVec 64))) (size!37739 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77102)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193131 (= res!793813 (= (select (arr!37201 _keys!1208) i!673) k0!934))))

(declare-fun b!1193132 () Bool)

(declare-fun res!793809 () Bool)

(assert (=> b!1193132 (=> (not res!793809) (not e!678124))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45385 0))(
  ( (V!45386 (val!15153 Int)) )
))
(declare-datatypes ((ValueCell!14387 0))(
  ( (ValueCellFull!14387 (v!17790 V!45385)) (EmptyCell!14387) )
))
(declare-datatypes ((array!77104 0))(
  ( (array!77105 (arr!37202 (Array (_ BitVec 32) ValueCell!14387)) (size!37740 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77104)

(assert (=> b!1193132 (= res!793809 (and (= (size!37740 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37739 _keys!1208) (size!37740 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193133 () Bool)

(declare-fun e!678121 () Bool)

(declare-fun tp_is_empty!30193 () Bool)

(assert (=> b!1193133 (= e!678121 tp_is_empty!30193)))

(declare-fun b!1193135 () Bool)

(declare-fun res!793812 () Bool)

(assert (=> b!1193135 (=> (not res!793812) (not e!678124))))

(assert (=> b!1193135 (= res!793812 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37739 _keys!1208))))))

(declare-fun b!1193136 () Bool)

(declare-fun e!678118 () Bool)

(declare-fun mapRes!47117 () Bool)

(assert (=> b!1193136 (= e!678118 (and e!678121 mapRes!47117))))

(declare-fun condMapEmpty!47117 () Bool)

(declare-fun mapDefault!47117 () ValueCell!14387)

(assert (=> b!1193136 (= condMapEmpty!47117 (= (arr!37202 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14387)) mapDefault!47117)))))

(declare-fun b!1193137 () Bool)

(declare-fun e!678123 () Bool)

(assert (=> b!1193137 (= e!678124 e!678123)))

(declare-fun res!793811 () Bool)

(assert (=> b!1193137 (=> (not res!793811) (not e!678123))))

(declare-fun lt!542338 () array!77102)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77102 (_ BitVec 32)) Bool)

(assert (=> b!1193137 (= res!793811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542338 mask!1564))))

(assert (=> b!1193137 (= lt!542338 (array!77103 (store (arr!37201 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37739 _keys!1208)))))

(declare-fun b!1193138 () Bool)

(declare-fun res!793804 () Bool)

(assert (=> b!1193138 (=> (not res!793804) (not e!678124))))

(declare-datatypes ((List!26306 0))(
  ( (Nil!26303) (Cons!26302 (h!27511 (_ BitVec 64)) (t!38952 List!26306)) )
))
(declare-fun arrayNoDuplicates!0 (array!77102 (_ BitVec 32) List!26306) Bool)

(assert (=> b!1193138 (= res!793804 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26303))))

(declare-fun b!1193139 () Bool)

(declare-fun res!793810 () Bool)

(assert (=> b!1193139 (=> (not res!793810) (not e!678123))))

(assert (=> b!1193139 (= res!793810 (arrayNoDuplicates!0 lt!542338 #b00000000000000000000000000000000 Nil!26303))))

(declare-fun b!1193140 () Bool)

(declare-fun res!793802 () Bool)

(assert (=> b!1193140 (=> (not res!793802) (not e!678124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193140 (= res!793802 (validMask!0 mask!1564))))

(declare-fun b!1193134 () Bool)

(declare-fun e!678122 () Bool)

(declare-fun e!678120 () Bool)

(assert (=> b!1193134 (= e!678122 e!678120)))

(declare-fun res!793808 () Bool)

(assert (=> b!1193134 (=> res!793808 e!678120)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1193134 (= res!793808 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19592 0))(
  ( (tuple2!19593 (_1!9807 (_ BitVec 64)) (_2!9807 V!45385)) )
))
(declare-datatypes ((List!26307 0))(
  ( (Nil!26304) (Cons!26303 (h!27512 tuple2!19592) (t!38953 List!26307)) )
))
(declare-datatypes ((ListLongMap!17561 0))(
  ( (ListLongMap!17562 (toList!8796 List!26307)) )
))
(declare-fun lt!542339 () ListLongMap!17561)

(declare-fun minValue!944 () V!45385)

(declare-fun lt!542340 () array!77104)

(declare-fun zeroValue!944 () V!45385)

(declare-fun getCurrentListMapNoExtraKeys!5246 (array!77102 array!77104 (_ BitVec 32) (_ BitVec 32) V!45385 V!45385 (_ BitVec 32) Int) ListLongMap!17561)

(assert (=> b!1193134 (= lt!542339 (getCurrentListMapNoExtraKeys!5246 lt!542338 lt!542340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3131 (Int (_ BitVec 64)) V!45385)

(assert (=> b!1193134 (= lt!542340 (array!77105 (store (arr!37202 _values!996) i!673 (ValueCellFull!14387 (dynLambda!3131 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37740 _values!996)))))

(declare-fun lt!542337 () ListLongMap!17561)

(assert (=> b!1193134 (= lt!542337 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!793807 () Bool)

(assert (=> start!100078 (=> (not res!793807) (not e!678124))))

(assert (=> start!100078 (= res!793807 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37739 _keys!1208))))))

(assert (=> start!100078 e!678124))

(assert (=> start!100078 tp_is_empty!30193))

(declare-fun array_inv!28486 (array!77102) Bool)

(assert (=> start!100078 (array_inv!28486 _keys!1208)))

(assert (=> start!100078 true))

(assert (=> start!100078 tp!89703))

(declare-fun array_inv!28487 (array!77104) Bool)

(assert (=> start!100078 (and (array_inv!28487 _values!996) e!678118)))

(declare-fun b!1193141 () Bool)

(declare-fun e!678119 () Bool)

(assert (=> b!1193141 (= e!678119 tp_is_empty!30193)))

(declare-fun b!1193142 () Bool)

(assert (=> b!1193142 (= e!678120 true)))

(declare-fun -!1736 (ListLongMap!17561 (_ BitVec 64)) ListLongMap!17561)

(assert (=> b!1193142 (= (getCurrentListMapNoExtraKeys!5246 lt!542338 lt!542340 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1736 (getCurrentListMapNoExtraKeys!5246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39457 0))(
  ( (Unit!39458) )
))
(declare-fun lt!542335 () Unit!39457)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!986 (array!77102 array!77104 (_ BitVec 32) (_ BitVec 32) V!45385 V!45385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39457)

(assert (=> b!1193142 (= lt!542335 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193143 () Bool)

(assert (=> b!1193143 (= e!678123 (not e!678122))))

(declare-fun res!793806 () Bool)

(assert (=> b!1193143 (=> res!793806 e!678122)))

(assert (=> b!1193143 (= res!793806 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193143 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542336 () Unit!39457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77102 (_ BitVec 64) (_ BitVec 32)) Unit!39457)

(assert (=> b!1193143 (= lt!542336 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47117 () Bool)

(declare-fun tp!89702 () Bool)

(assert (=> mapNonEmpty!47117 (= mapRes!47117 (and tp!89702 e!678119))))

(declare-fun mapRest!47117 () (Array (_ BitVec 32) ValueCell!14387))

(declare-fun mapValue!47117 () ValueCell!14387)

(declare-fun mapKey!47117 () (_ BitVec 32))

(assert (=> mapNonEmpty!47117 (= (arr!37202 _values!996) (store mapRest!47117 mapKey!47117 mapValue!47117))))

(declare-fun b!1193144 () Bool)

(declare-fun res!793803 () Bool)

(assert (=> b!1193144 (=> (not res!793803) (not e!678124))))

(assert (=> b!1193144 (= res!793803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47117 () Bool)

(assert (=> mapIsEmpty!47117 mapRes!47117))

(assert (= (and start!100078 res!793807) b!1193140))

(assert (= (and b!1193140 res!793802) b!1193132))

(assert (= (and b!1193132 res!793809) b!1193144))

(assert (= (and b!1193144 res!793803) b!1193138))

(assert (= (and b!1193138 res!793804) b!1193135))

(assert (= (and b!1193135 res!793812) b!1193130))

(assert (= (and b!1193130 res!793805) b!1193131))

(assert (= (and b!1193131 res!793813) b!1193137))

(assert (= (and b!1193137 res!793811) b!1193139))

(assert (= (and b!1193139 res!793810) b!1193143))

(assert (= (and b!1193143 (not res!793806)) b!1193134))

(assert (= (and b!1193134 (not res!793808)) b!1193142))

(assert (= (and b!1193136 condMapEmpty!47117) mapIsEmpty!47117))

(assert (= (and b!1193136 (not condMapEmpty!47117)) mapNonEmpty!47117))

(get-info :version)

(assert (= (and mapNonEmpty!47117 ((_ is ValueCellFull!14387) mapValue!47117)) b!1193141))

(assert (= (and b!1193136 ((_ is ValueCellFull!14387) mapDefault!47117)) b!1193133))

(assert (= start!100078 b!1193136))

(declare-fun b_lambda!20789 () Bool)

(assert (=> (not b_lambda!20789) (not b!1193134)))

(declare-fun t!38951 () Bool)

(declare-fun tb!10467 () Bool)

(assert (=> (and start!100078 (= defaultEntry!1004 defaultEntry!1004) t!38951) tb!10467))

(declare-fun result!21509 () Bool)

(assert (=> tb!10467 (= result!21509 tp_is_empty!30193)))

(assert (=> b!1193134 t!38951))

(declare-fun b_and!42173 () Bool)

(assert (= b_and!42171 (and (=> t!38951 result!21509) b_and!42173)))

(declare-fun m!1100915 () Bool)

(assert (=> b!1193144 m!1100915))

(declare-fun m!1100917 () Bool)

(assert (=> b!1193143 m!1100917))

(declare-fun m!1100919 () Bool)

(assert (=> b!1193143 m!1100919))

(declare-fun m!1100921 () Bool)

(assert (=> mapNonEmpty!47117 m!1100921))

(declare-fun m!1100923 () Bool)

(assert (=> start!100078 m!1100923))

(declare-fun m!1100925 () Bool)

(assert (=> start!100078 m!1100925))

(declare-fun m!1100927 () Bool)

(assert (=> b!1193142 m!1100927))

(declare-fun m!1100929 () Bool)

(assert (=> b!1193142 m!1100929))

(assert (=> b!1193142 m!1100929))

(declare-fun m!1100931 () Bool)

(assert (=> b!1193142 m!1100931))

(declare-fun m!1100933 () Bool)

(assert (=> b!1193142 m!1100933))

(declare-fun m!1100935 () Bool)

(assert (=> b!1193131 m!1100935))

(declare-fun m!1100937 () Bool)

(assert (=> b!1193139 m!1100937))

(declare-fun m!1100939 () Bool)

(assert (=> b!1193130 m!1100939))

(declare-fun m!1100941 () Bool)

(assert (=> b!1193134 m!1100941))

(declare-fun m!1100943 () Bool)

(assert (=> b!1193134 m!1100943))

(declare-fun m!1100945 () Bool)

(assert (=> b!1193134 m!1100945))

(declare-fun m!1100947 () Bool)

(assert (=> b!1193134 m!1100947))

(declare-fun m!1100949 () Bool)

(assert (=> b!1193138 m!1100949))

(declare-fun m!1100951 () Bool)

(assert (=> b!1193137 m!1100951))

(declare-fun m!1100953 () Bool)

(assert (=> b!1193137 m!1100953))

(declare-fun m!1100955 () Bool)

(assert (=> b!1193140 m!1100955))

(check-sat (not b!1193144) (not b!1193142) (not b!1193137) (not b_lambda!20789) (not b!1193143) (not start!100078) (not b_next!25663) (not b!1193138) (not b!1193139) (not b!1193130) (not mapNonEmpty!47117) (not b!1193140) (not b!1193134) tp_is_empty!30193 b_and!42173)
(check-sat b_and!42173 (not b_next!25663))
