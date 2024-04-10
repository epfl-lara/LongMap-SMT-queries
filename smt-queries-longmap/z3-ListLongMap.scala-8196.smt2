; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100044 () Bool)

(assert start!100044)

(declare-fun b_free!25623 () Bool)

(declare-fun b_next!25623 () Bool)

(assert (=> start!100044 (= b_free!25623 (not b_next!25623))))

(declare-fun tp!89583 () Bool)

(declare-fun b_and!42113 () Bool)

(assert (=> start!100044 (= tp!89583 b_and!42113)))

(declare-fun b!1192314 () Bool)

(declare-fun res!793155 () Bool)

(declare-fun e!677718 () Bool)

(assert (=> b!1192314 (=> (not res!793155) (not e!677718))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192314 (= res!793155 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47057 () Bool)

(declare-fun mapRes!47057 () Bool)

(declare-fun tp!89582 () Bool)

(declare-fun e!677715 () Bool)

(assert (=> mapNonEmpty!47057 (= mapRes!47057 (and tp!89582 e!677715))))

(declare-fun mapKey!47057 () (_ BitVec 32))

(declare-datatypes ((V!45331 0))(
  ( (V!45332 (val!15133 Int)) )
))
(declare-datatypes ((ValueCell!14367 0))(
  ( (ValueCellFull!14367 (v!17771 V!45331)) (EmptyCell!14367) )
))
(declare-fun mapRest!47057 () (Array (_ BitVec 32) ValueCell!14367))

(declare-datatypes ((array!77093 0))(
  ( (array!77094 (arr!37196 (Array (_ BitVec 32) ValueCell!14367)) (size!37732 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77093)

(declare-fun mapValue!47057 () ValueCell!14367)

(assert (=> mapNonEmpty!47057 (= (arr!37196 _values!996) (store mapRest!47057 mapKey!47057 mapValue!47057))))

(declare-fun b!1192315 () Bool)

(declare-fun e!677721 () Bool)

(declare-fun e!677716 () Bool)

(assert (=> b!1192315 (= e!677721 e!677716)))

(declare-fun res!793149 () Bool)

(assert (=> b!1192315 (=> res!793149 e!677716)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192315 (= res!793149 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45331)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!77095 0))(
  ( (array!77096 (arr!37197 (Array (_ BitVec 32) (_ BitVec 64))) (size!37733 (_ BitVec 32))) )
))
(declare-fun lt!542171 () array!77095)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45331)

(declare-fun lt!542168 () array!77093)

(declare-datatypes ((tuple2!19450 0))(
  ( (tuple2!19451 (_1!9736 (_ BitVec 64)) (_2!9736 V!45331)) )
))
(declare-datatypes ((List!26193 0))(
  ( (Nil!26190) (Cons!26189 (h!27398 tuple2!19450) (t!38808 List!26193)) )
))
(declare-datatypes ((ListLongMap!17419 0))(
  ( (ListLongMap!17420 (toList!8725 List!26193)) )
))
(declare-fun lt!542172 () ListLongMap!17419)

(declare-fun getCurrentListMapNoExtraKeys!5166 (array!77095 array!77093 (_ BitVec 32) (_ BitVec 32) V!45331 V!45331 (_ BitVec 32) Int) ListLongMap!17419)

(assert (=> b!1192315 (= lt!542172 (getCurrentListMapNoExtraKeys!5166 lt!542171 lt!542168 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3099 (Int (_ BitVec 64)) V!45331)

(assert (=> b!1192315 (= lt!542168 (array!77094 (store (arr!37196 _values!996) i!673 (ValueCellFull!14367 (dynLambda!3099 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37732 _values!996)))))

(declare-fun _keys!1208 () array!77095)

(declare-fun lt!542167 () ListLongMap!17419)

(assert (=> b!1192315 (= lt!542167 (getCurrentListMapNoExtraKeys!5166 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192316 () Bool)

(declare-fun tp_is_empty!30153 () Bool)

(assert (=> b!1192316 (= e!677715 tp_is_empty!30153)))

(declare-fun b!1192317 () Bool)

(declare-fun res!793150 () Bool)

(assert (=> b!1192317 (=> (not res!793150) (not e!677718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192317 (= res!793150 (validMask!0 mask!1564))))

(declare-fun b!1192318 () Bool)

(assert (=> b!1192318 (= e!677716 true)))

(declare-fun -!1750 (ListLongMap!17419 (_ BitVec 64)) ListLongMap!17419)

(assert (=> b!1192318 (= (getCurrentListMapNoExtraKeys!5166 lt!542171 lt!542168 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1750 (getCurrentListMapNoExtraKeys!5166 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39554 0))(
  ( (Unit!39555) )
))
(declare-fun lt!542170 () Unit!39554)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!959 (array!77095 array!77093 (_ BitVec 32) (_ BitVec 32) V!45331 V!45331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39554)

(assert (=> b!1192318 (= lt!542170 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!959 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192319 () Bool)

(declare-fun res!793156 () Bool)

(assert (=> b!1192319 (=> (not res!793156) (not e!677718))))

(assert (=> b!1192319 (= res!793156 (= (select (arr!37197 _keys!1208) i!673) k0!934))))

(declare-fun b!1192320 () Bool)

(declare-fun res!793158 () Bool)

(assert (=> b!1192320 (=> (not res!793158) (not e!677718))))

(assert (=> b!1192320 (= res!793158 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37733 _keys!1208))))))

(declare-fun b!1192321 () Bool)

(declare-fun e!677722 () Bool)

(assert (=> b!1192321 (= e!677722 tp_is_empty!30153)))

(declare-fun res!793159 () Bool)

(assert (=> start!100044 (=> (not res!793159) (not e!677718))))

(assert (=> start!100044 (= res!793159 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37733 _keys!1208))))))

(assert (=> start!100044 e!677718))

(assert (=> start!100044 tp_is_empty!30153))

(declare-fun array_inv!28362 (array!77095) Bool)

(assert (=> start!100044 (array_inv!28362 _keys!1208)))

(assert (=> start!100044 true))

(assert (=> start!100044 tp!89583))

(declare-fun e!677720 () Bool)

(declare-fun array_inv!28363 (array!77093) Bool)

(assert (=> start!100044 (and (array_inv!28363 _values!996) e!677720)))

(declare-fun b!1192322 () Bool)

(assert (=> b!1192322 (= e!677720 (and e!677722 mapRes!47057))))

(declare-fun condMapEmpty!47057 () Bool)

(declare-fun mapDefault!47057 () ValueCell!14367)

(assert (=> b!1192322 (= condMapEmpty!47057 (= (arr!37196 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14367)) mapDefault!47057)))))

(declare-fun mapIsEmpty!47057 () Bool)

(assert (=> mapIsEmpty!47057 mapRes!47057))

(declare-fun b!1192323 () Bool)

(declare-fun e!677717 () Bool)

(assert (=> b!1192323 (= e!677718 e!677717)))

(declare-fun res!793153 () Bool)

(assert (=> b!1192323 (=> (not res!793153) (not e!677717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77095 (_ BitVec 32)) Bool)

(assert (=> b!1192323 (= res!793153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542171 mask!1564))))

(assert (=> b!1192323 (= lt!542171 (array!77096 (store (arr!37197 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37733 _keys!1208)))))

(declare-fun b!1192324 () Bool)

(declare-fun res!793154 () Bool)

(assert (=> b!1192324 (=> (not res!793154) (not e!677718))))

(assert (=> b!1192324 (= res!793154 (and (= (size!37732 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37733 _keys!1208) (size!37732 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192325 () Bool)

(declare-fun res!793152 () Bool)

(assert (=> b!1192325 (=> (not res!793152) (not e!677717))))

(declare-datatypes ((List!26194 0))(
  ( (Nil!26191) (Cons!26190 (h!27399 (_ BitVec 64)) (t!38809 List!26194)) )
))
(declare-fun arrayNoDuplicates!0 (array!77095 (_ BitVec 32) List!26194) Bool)

(assert (=> b!1192325 (= res!793152 (arrayNoDuplicates!0 lt!542171 #b00000000000000000000000000000000 Nil!26191))))

(declare-fun b!1192326 () Bool)

(declare-fun res!793151 () Bool)

(assert (=> b!1192326 (=> (not res!793151) (not e!677718))))

(assert (=> b!1192326 (= res!793151 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26191))))

(declare-fun b!1192327 () Bool)

(declare-fun res!793157 () Bool)

(assert (=> b!1192327 (=> (not res!793157) (not e!677718))))

(assert (=> b!1192327 (= res!793157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192328 () Bool)

(assert (=> b!1192328 (= e!677717 (not e!677721))))

(declare-fun res!793148 () Bool)

(assert (=> b!1192328 (=> res!793148 e!677721)))

(assert (=> b!1192328 (= res!793148 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192328 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542169 () Unit!39554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77095 (_ BitVec 64) (_ BitVec 32)) Unit!39554)

(assert (=> b!1192328 (= lt!542169 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100044 res!793159) b!1192317))

(assert (= (and b!1192317 res!793150) b!1192324))

(assert (= (and b!1192324 res!793154) b!1192327))

(assert (= (and b!1192327 res!793157) b!1192326))

(assert (= (and b!1192326 res!793151) b!1192320))

(assert (= (and b!1192320 res!793158) b!1192314))

(assert (= (and b!1192314 res!793155) b!1192319))

(assert (= (and b!1192319 res!793156) b!1192323))

(assert (= (and b!1192323 res!793153) b!1192325))

(assert (= (and b!1192325 res!793152) b!1192328))

(assert (= (and b!1192328 (not res!793148)) b!1192315))

(assert (= (and b!1192315 (not res!793149)) b!1192318))

(assert (= (and b!1192322 condMapEmpty!47057) mapIsEmpty!47057))

(assert (= (and b!1192322 (not condMapEmpty!47057)) mapNonEmpty!47057))

(get-info :version)

(assert (= (and mapNonEmpty!47057 ((_ is ValueCellFull!14367) mapValue!47057)) b!1192316))

(assert (= (and b!1192322 ((_ is ValueCellFull!14367) mapDefault!47057)) b!1192321))

(assert (= start!100044 b!1192322))

(declare-fun b_lambda!20767 () Bool)

(assert (=> (not b_lambda!20767) (not b!1192315)))

(declare-fun t!38807 () Bool)

(declare-fun tb!10435 () Bool)

(assert (=> (and start!100044 (= defaultEntry!1004 defaultEntry!1004) t!38807) tb!10435))

(declare-fun result!21437 () Bool)

(assert (=> tb!10435 (= result!21437 tp_is_empty!30153)))

(assert (=> b!1192315 t!38807))

(declare-fun b_and!42115 () Bool)

(assert (= b_and!42113 (and (=> t!38807 result!21437) b_and!42115)))

(declare-fun m!1100685 () Bool)

(assert (=> b!1192327 m!1100685))

(declare-fun m!1100687 () Bool)

(assert (=> start!100044 m!1100687))

(declare-fun m!1100689 () Bool)

(assert (=> start!100044 m!1100689))

(declare-fun m!1100691 () Bool)

(assert (=> b!1192326 m!1100691))

(declare-fun m!1100693 () Bool)

(assert (=> b!1192328 m!1100693))

(declare-fun m!1100695 () Bool)

(assert (=> b!1192328 m!1100695))

(declare-fun m!1100697 () Bool)

(assert (=> b!1192315 m!1100697))

(declare-fun m!1100699 () Bool)

(assert (=> b!1192315 m!1100699))

(declare-fun m!1100701 () Bool)

(assert (=> b!1192315 m!1100701))

(declare-fun m!1100703 () Bool)

(assert (=> b!1192315 m!1100703))

(declare-fun m!1100705 () Bool)

(assert (=> b!1192323 m!1100705))

(declare-fun m!1100707 () Bool)

(assert (=> b!1192323 m!1100707))

(declare-fun m!1100709 () Bool)

(assert (=> b!1192319 m!1100709))

(declare-fun m!1100711 () Bool)

(assert (=> b!1192314 m!1100711))

(declare-fun m!1100713 () Bool)

(assert (=> b!1192317 m!1100713))

(declare-fun m!1100715 () Bool)

(assert (=> b!1192325 m!1100715))

(declare-fun m!1100717 () Bool)

(assert (=> mapNonEmpty!47057 m!1100717))

(declare-fun m!1100719 () Bool)

(assert (=> b!1192318 m!1100719))

(declare-fun m!1100721 () Bool)

(assert (=> b!1192318 m!1100721))

(assert (=> b!1192318 m!1100721))

(declare-fun m!1100723 () Bool)

(assert (=> b!1192318 m!1100723))

(declare-fun m!1100725 () Bool)

(assert (=> b!1192318 m!1100725))

(check-sat (not b!1192317) (not b!1192314) b_and!42115 (not b!1192325) (not b!1192315) (not b!1192323) (not b!1192327) (not start!100044) (not b!1192326) (not b_lambda!20767) tp_is_empty!30153 (not b_next!25623) (not b!1192328) (not mapNonEmpty!47057) (not b!1192318))
(check-sat b_and!42115 (not b_next!25623))
