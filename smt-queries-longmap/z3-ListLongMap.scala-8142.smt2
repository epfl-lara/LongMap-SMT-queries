; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99954 () Bool)

(assert start!99954)

(declare-fun b_free!25297 () Bool)

(declare-fun b_next!25297 () Bool)

(assert (=> start!99954 (= b_free!25297 (not b_next!25297))))

(declare-fun tp!88605 () Bool)

(declare-fun b_and!41463 () Bool)

(assert (=> start!99954 (= tp!88605 b_and!41463)))

(declare-fun b!1184782 () Bool)

(declare-fun e!673716 () Bool)

(declare-fun tp_is_empty!29827 () Bool)

(assert (=> b!1184782 (= e!673716 tp_is_empty!29827)))

(declare-fun b!1184783 () Bool)

(declare-fun e!673707 () Bool)

(declare-fun e!673708 () Bool)

(assert (=> b!1184783 (= e!673707 e!673708)))

(declare-fun res!787097 () Bool)

(assert (=> b!1184783 (=> res!787097 e!673708)))

(declare-datatypes ((array!76501 0))(
  ( (array!76502 (arr!36894 (Array (_ BitVec 32) (_ BitVec 64))) (size!37431 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76501)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184783 (= res!787097 (not (= (select (arr!36894 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184784 () Bool)

(declare-fun e!673713 () Bool)

(assert (=> b!1184784 (= e!673713 true)))

(declare-datatypes ((V!44897 0))(
  ( (V!44898 (val!14970 Int)) )
))
(declare-datatypes ((tuple2!19236 0))(
  ( (tuple2!19237 (_1!9629 (_ BitVec 64)) (_2!9629 V!44897)) )
))
(declare-datatypes ((List!25967 0))(
  ( (Nil!25964) (Cons!25963 (h!27181 tuple2!19236) (t!38248 List!25967)) )
))
(declare-datatypes ((ListLongMap!17213 0))(
  ( (ListLongMap!17214 (toList!8622 List!25967)) )
))
(declare-fun lt!536703 () ListLongMap!17213)

(declare-fun lt!536715 () ListLongMap!17213)

(declare-fun -!1643 (ListLongMap!17213 (_ BitVec 64)) ListLongMap!17213)

(assert (=> b!1184784 (= (-!1643 lt!536703 k0!934) lt!536715)))

(declare-fun lt!536718 () V!44897)

(declare-datatypes ((Unit!39174 0))(
  ( (Unit!39175) )
))
(declare-fun lt!536714 () Unit!39174)

(declare-fun lt!536716 () ListLongMap!17213)

(declare-fun addRemoveCommutativeForDiffKeys!157 (ListLongMap!17213 (_ BitVec 64) V!44897 (_ BitVec 64)) Unit!39174)

(assert (=> b!1184784 (= lt!536714 (addRemoveCommutativeForDiffKeys!157 lt!536716 (select (arr!36894 _keys!1208) from!1455) lt!536718 k0!934))))

(declare-fun lt!536706 () ListLongMap!17213)

(declare-fun lt!536702 () ListLongMap!17213)

(declare-fun lt!536701 () ListLongMap!17213)

(assert (=> b!1184784 (and (= lt!536701 lt!536703) (= lt!536702 lt!536706))))

(declare-fun lt!536710 () tuple2!19236)

(declare-fun +!3941 (ListLongMap!17213 tuple2!19236) ListLongMap!17213)

(assert (=> b!1184784 (= lt!536703 (+!3941 lt!536716 lt!536710))))

(assert (=> b!1184784 (not (= (select (arr!36894 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536708 () Unit!39174)

(declare-fun e!673710 () Unit!39174)

(assert (=> b!1184784 (= lt!536708 e!673710)))

(declare-fun c!117467 () Bool)

(assert (=> b!1184784 (= c!117467 (= (select (arr!36894 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184784 e!673707))

(declare-fun res!787094 () Bool)

(assert (=> b!1184784 (=> (not res!787094) (not e!673707))))

(declare-fun lt!536704 () ListLongMap!17213)

(assert (=> b!1184784 (= res!787094 (= lt!536704 lt!536715))))

(assert (=> b!1184784 (= lt!536715 (+!3941 lt!536702 lt!536710))))

(assert (=> b!1184784 (= lt!536710 (tuple2!19237 (select (arr!36894 _keys!1208) from!1455) lt!536718))))

(declare-fun lt!536711 () V!44897)

(declare-datatypes ((ValueCell!14204 0))(
  ( (ValueCellFull!14204 (v!17604 V!44897)) (EmptyCell!14204) )
))
(declare-datatypes ((array!76503 0))(
  ( (array!76504 (arr!36895 (Array (_ BitVec 32) ValueCell!14204)) (size!37432 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76503)

(declare-fun get!18918 (ValueCell!14204 V!44897) V!44897)

(assert (=> b!1184784 (= lt!536718 (get!18918 (select (arr!36895 _values!996) from!1455) lt!536711))))

(declare-fun b!1184785 () Bool)

(declare-fun e!673717 () Bool)

(assert (=> b!1184785 (= e!673717 tp_is_empty!29827)))

(declare-fun b!1184786 () Bool)

(declare-fun Unit!39176 () Unit!39174)

(assert (=> b!1184786 (= e!673710 Unit!39176)))

(declare-fun b!1184787 () Bool)

(declare-fun res!787095 () Bool)

(declare-fun e!673718 () Bool)

(assert (=> b!1184787 (=> (not res!787095) (not e!673718))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184787 (= res!787095 (validMask!0 mask!1564))))

(declare-fun b!1184788 () Bool)

(declare-fun Unit!39177 () Unit!39174)

(assert (=> b!1184788 (= e!673710 Unit!39177)))

(declare-fun lt!536717 () Unit!39174)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76501 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39174)

(assert (=> b!1184788 (= lt!536717 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184788 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536707 () Unit!39174)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76501 (_ BitVec 32) (_ BitVec 32)) Unit!39174)

(assert (=> b!1184788 (= lt!536707 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25968 0))(
  ( (Nil!25965) (Cons!25964 (h!27182 (_ BitVec 64)) (t!38249 List!25968)) )
))
(declare-fun arrayNoDuplicates!0 (array!76501 (_ BitVec 32) List!25968) Bool)

(assert (=> b!1184788 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25965)))

(declare-fun lt!536713 () Unit!39174)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76501 (_ BitVec 64) (_ BitVec 32) List!25968) Unit!39174)

(assert (=> b!1184788 (= lt!536713 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25965))))

(assert (=> b!1184788 false))

(declare-fun res!787099 () Bool)

(assert (=> start!99954 (=> (not res!787099) (not e!673718))))

(assert (=> start!99954 (= res!787099 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37431 _keys!1208))))))

(assert (=> start!99954 e!673718))

(assert (=> start!99954 tp_is_empty!29827))

(declare-fun array_inv!28238 (array!76501) Bool)

(assert (=> start!99954 (array_inv!28238 _keys!1208)))

(assert (=> start!99954 true))

(assert (=> start!99954 tp!88605))

(declare-fun e!673712 () Bool)

(declare-fun array_inv!28239 (array!76503) Bool)

(assert (=> start!99954 (and (array_inv!28239 _values!996) e!673712)))

(declare-fun b!1184789 () Bool)

(declare-fun res!787106 () Bool)

(assert (=> b!1184789 (=> (not res!787106) (not e!673718))))

(assert (=> b!1184789 (= res!787106 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25965))))

(declare-fun b!1184790 () Bool)

(declare-fun res!787103 () Bool)

(assert (=> b!1184790 (=> (not res!787103) (not e!673718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184790 (= res!787103 (validKeyInArray!0 k0!934))))

(declare-fun b!1184791 () Bool)

(declare-fun res!787093 () Bool)

(assert (=> b!1184791 (=> (not res!787093) (not e!673718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76501 (_ BitVec 32)) Bool)

(assert (=> b!1184791 (= res!787093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184792 () Bool)

(declare-fun mapRes!46568 () Bool)

(assert (=> b!1184792 (= e!673712 (and e!673716 mapRes!46568))))

(declare-fun condMapEmpty!46568 () Bool)

(declare-fun mapDefault!46568 () ValueCell!14204)

(assert (=> b!1184792 (= condMapEmpty!46568 (= (arr!36895 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14204)) mapDefault!46568)))))

(declare-fun b!1184793 () Bool)

(assert (=> b!1184793 (= e!673708 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184794 () Bool)

(declare-fun e!673711 () Bool)

(assert (=> b!1184794 (= e!673711 e!673713)))

(declare-fun res!787100 () Bool)

(assert (=> b!1184794 (=> res!787100 e!673713)))

(assert (=> b!1184794 (= res!787100 (not (validKeyInArray!0 (select (arr!36894 _keys!1208) from!1455))))))

(assert (=> b!1184794 (= lt!536706 lt!536702)))

(assert (=> b!1184794 (= lt!536702 (-!1643 lt!536716 k0!934))))

(declare-fun zeroValue!944 () V!44897)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536709 () array!76503)

(declare-fun minValue!944 () V!44897)

(declare-fun lt!536712 () array!76501)

(declare-fun getCurrentListMapNoExtraKeys!5093 (array!76501 array!76503 (_ BitVec 32) (_ BitVec 32) V!44897 V!44897 (_ BitVec 32) Int) ListLongMap!17213)

(assert (=> b!1184794 (= lt!536706 (getCurrentListMapNoExtraKeys!5093 lt!536712 lt!536709 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184794 (= lt!536716 (getCurrentListMapNoExtraKeys!5093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536705 () Unit!39174)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!865 (array!76501 array!76503 (_ BitVec 32) (_ BitVec 32) V!44897 V!44897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39174)

(assert (=> b!1184794 (= lt!536705 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!865 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184795 () Bool)

(declare-fun e!673714 () Bool)

(assert (=> b!1184795 (= e!673718 e!673714)))

(declare-fun res!787101 () Bool)

(assert (=> b!1184795 (=> (not res!787101) (not e!673714))))

(assert (=> b!1184795 (= res!787101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536712 mask!1564))))

(assert (=> b!1184795 (= lt!536712 (array!76502 (store (arr!36894 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37431 _keys!1208)))))

(declare-fun b!1184796 () Bool)

(declare-fun res!787104 () Bool)

(assert (=> b!1184796 (=> (not res!787104) (not e!673718))))

(assert (=> b!1184796 (= res!787104 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37431 _keys!1208))))))

(declare-fun mapNonEmpty!46568 () Bool)

(declare-fun tp!88604 () Bool)

(assert (=> mapNonEmpty!46568 (= mapRes!46568 (and tp!88604 e!673717))))

(declare-fun mapRest!46568 () (Array (_ BitVec 32) ValueCell!14204))

(declare-fun mapKey!46568 () (_ BitVec 32))

(declare-fun mapValue!46568 () ValueCell!14204)

(assert (=> mapNonEmpty!46568 (= (arr!36895 _values!996) (store mapRest!46568 mapKey!46568 mapValue!46568))))

(declare-fun b!1184797 () Bool)

(declare-fun res!787102 () Bool)

(assert (=> b!1184797 (=> (not res!787102) (not e!673718))))

(assert (=> b!1184797 (= res!787102 (and (= (size!37432 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37431 _keys!1208) (size!37432 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184798 () Bool)

(declare-fun res!787098 () Bool)

(assert (=> b!1184798 (=> (not res!787098) (not e!673718))))

(assert (=> b!1184798 (= res!787098 (= (select (arr!36894 _keys!1208) i!673) k0!934))))

(declare-fun b!1184799 () Bool)

(declare-fun e!673715 () Bool)

(assert (=> b!1184799 (= e!673714 (not e!673715))))

(declare-fun res!787105 () Bool)

(assert (=> b!1184799 (=> res!787105 e!673715)))

(assert (=> b!1184799 (= res!787105 (bvsgt from!1455 i!673))))

(assert (=> b!1184799 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536719 () Unit!39174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76501 (_ BitVec 64) (_ BitVec 32)) Unit!39174)

(assert (=> b!1184799 (= lt!536719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46568 () Bool)

(assert (=> mapIsEmpty!46568 mapRes!46568))

(declare-fun b!1184800 () Bool)

(assert (=> b!1184800 (= e!673715 e!673711)))

(declare-fun res!787096 () Bool)

(assert (=> b!1184800 (=> res!787096 e!673711)))

(assert (=> b!1184800 (= res!787096 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184800 (= lt!536704 (getCurrentListMapNoExtraKeys!5093 lt!536712 lt!536709 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184800 (= lt!536709 (array!76504 (store (arr!36895 _values!996) i!673 (ValueCellFull!14204 lt!536711)) (size!37432 _values!996)))))

(declare-fun dynLambda!3057 (Int (_ BitVec 64)) V!44897)

(assert (=> b!1184800 (= lt!536711 (dynLambda!3057 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184800 (= lt!536701 (getCurrentListMapNoExtraKeys!5093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184801 () Bool)

(declare-fun res!787092 () Bool)

(assert (=> b!1184801 (=> (not res!787092) (not e!673714))))

(assert (=> b!1184801 (= res!787092 (arrayNoDuplicates!0 lt!536712 #b00000000000000000000000000000000 Nil!25965))))

(assert (= (and start!99954 res!787099) b!1184787))

(assert (= (and b!1184787 res!787095) b!1184797))

(assert (= (and b!1184797 res!787102) b!1184791))

(assert (= (and b!1184791 res!787093) b!1184789))

(assert (= (and b!1184789 res!787106) b!1184796))

(assert (= (and b!1184796 res!787104) b!1184790))

(assert (= (and b!1184790 res!787103) b!1184798))

(assert (= (and b!1184798 res!787098) b!1184795))

(assert (= (and b!1184795 res!787101) b!1184801))

(assert (= (and b!1184801 res!787092) b!1184799))

(assert (= (and b!1184799 (not res!787105)) b!1184800))

(assert (= (and b!1184800 (not res!787096)) b!1184794))

(assert (= (and b!1184794 (not res!787100)) b!1184784))

(assert (= (and b!1184784 res!787094) b!1184783))

(assert (= (and b!1184783 (not res!787097)) b!1184793))

(assert (= (and b!1184784 c!117467) b!1184788))

(assert (= (and b!1184784 (not c!117467)) b!1184786))

(assert (= (and b!1184792 condMapEmpty!46568) mapIsEmpty!46568))

(assert (= (and b!1184792 (not condMapEmpty!46568)) mapNonEmpty!46568))

(get-info :version)

(assert (= (and mapNonEmpty!46568 ((_ is ValueCellFull!14204) mapValue!46568)) b!1184785))

(assert (= (and b!1184792 ((_ is ValueCellFull!14204) mapDefault!46568)) b!1184782))

(assert (= start!99954 b!1184792))

(declare-fun b_lambda!20435 () Bool)

(assert (=> (not b_lambda!20435) (not b!1184800)))

(declare-fun t!38247 () Bool)

(declare-fun tb!10101 () Bool)

(assert (=> (and start!99954 (= defaultEntry!1004 defaultEntry!1004) t!38247) tb!10101))

(declare-fun result!20777 () Bool)

(assert (=> tb!10101 (= result!20777 tp_is_empty!29827)))

(assert (=> b!1184800 t!38247))

(declare-fun b_and!41465 () Bool)

(assert (= b_and!41463 (and (=> t!38247 result!20777) b_and!41465)))

(declare-fun m!1093227 () Bool)

(assert (=> b!1184790 m!1093227))

(declare-fun m!1093229 () Bool)

(assert (=> b!1184795 m!1093229))

(declare-fun m!1093231 () Bool)

(assert (=> b!1184795 m!1093231))

(declare-fun m!1093233 () Bool)

(assert (=> b!1184787 m!1093233))

(declare-fun m!1093235 () Bool)

(assert (=> mapNonEmpty!46568 m!1093235))

(declare-fun m!1093237 () Bool)

(assert (=> b!1184789 m!1093237))

(declare-fun m!1093239 () Bool)

(assert (=> start!99954 m!1093239))

(declare-fun m!1093241 () Bool)

(assert (=> start!99954 m!1093241))

(declare-fun m!1093243 () Bool)

(assert (=> b!1184788 m!1093243))

(declare-fun m!1093245 () Bool)

(assert (=> b!1184788 m!1093245))

(declare-fun m!1093247 () Bool)

(assert (=> b!1184788 m!1093247))

(declare-fun m!1093249 () Bool)

(assert (=> b!1184788 m!1093249))

(declare-fun m!1093251 () Bool)

(assert (=> b!1184788 m!1093251))

(declare-fun m!1093253 () Bool)

(assert (=> b!1184794 m!1093253))

(declare-fun m!1093255 () Bool)

(assert (=> b!1184794 m!1093255))

(declare-fun m!1093257 () Bool)

(assert (=> b!1184794 m!1093257))

(declare-fun m!1093259 () Bool)

(assert (=> b!1184794 m!1093259))

(assert (=> b!1184794 m!1093257))

(declare-fun m!1093261 () Bool)

(assert (=> b!1184794 m!1093261))

(declare-fun m!1093263 () Bool)

(assert (=> b!1184794 m!1093263))

(assert (=> b!1184783 m!1093257))

(declare-fun m!1093265 () Bool)

(assert (=> b!1184793 m!1093265))

(declare-fun m!1093267 () Bool)

(assert (=> b!1184798 m!1093267))

(declare-fun m!1093269 () Bool)

(assert (=> b!1184800 m!1093269))

(declare-fun m!1093271 () Bool)

(assert (=> b!1184800 m!1093271))

(declare-fun m!1093273 () Bool)

(assert (=> b!1184800 m!1093273))

(declare-fun m!1093275 () Bool)

(assert (=> b!1184800 m!1093275))

(declare-fun m!1093277 () Bool)

(assert (=> b!1184799 m!1093277))

(declare-fun m!1093279 () Bool)

(assert (=> b!1184799 m!1093279))

(declare-fun m!1093281 () Bool)

(assert (=> b!1184791 m!1093281))

(declare-fun m!1093283 () Bool)

(assert (=> b!1184801 m!1093283))

(declare-fun m!1093285 () Bool)

(assert (=> b!1184784 m!1093285))

(declare-fun m!1093287 () Bool)

(assert (=> b!1184784 m!1093287))

(declare-fun m!1093289 () Bool)

(assert (=> b!1184784 m!1093289))

(declare-fun m!1093291 () Bool)

(assert (=> b!1184784 m!1093291))

(assert (=> b!1184784 m!1093285))

(declare-fun m!1093293 () Bool)

(assert (=> b!1184784 m!1093293))

(assert (=> b!1184784 m!1093257))

(assert (=> b!1184784 m!1093257))

(declare-fun m!1093295 () Bool)

(assert (=> b!1184784 m!1093295))

(check-sat (not b!1184795) (not b!1184789) (not b!1184793) (not b_lambda!20435) (not mapNonEmpty!46568) (not b!1184784) (not start!99954) (not b!1184799) (not b!1184791) (not b!1184800) (not b!1184790) tp_is_empty!29827 (not b!1184787) (not b!1184788) (not b!1184801) (not b_next!25297) (not b!1184794) b_and!41465)
(check-sat b_and!41465 (not b_next!25297))
