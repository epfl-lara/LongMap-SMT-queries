; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100254 () Bool)

(assert start!100254)

(declare-fun b_free!25597 () Bool)

(declare-fun b_next!25597 () Bool)

(assert (=> start!100254 (= b_free!25597 (not b_next!25597))))

(declare-fun tp!89504 () Bool)

(declare-fun b_and!42063 () Bool)

(assert (=> start!100254 (= tp!89504 b_and!42063)))

(declare-fun b!1192992 () Bool)

(declare-fun e!678239 () Bool)

(declare-fun tp_is_empty!30127 () Bool)

(assert (=> b!1192992 (= e!678239 tp_is_empty!30127)))

(declare-fun b!1192993 () Bool)

(declare-fun res!793188 () Bool)

(declare-fun e!678241 () Bool)

(assert (=> b!1192993 (=> (not res!793188) (not e!678241))))

(declare-datatypes ((array!77085 0))(
  ( (array!77086 (arr!37186 (Array (_ BitVec 32) (_ BitVec 64))) (size!37723 (_ BitVec 32))) )
))
(declare-fun lt!542421 () array!77085)

(declare-datatypes ((List!26209 0))(
  ( (Nil!26206) (Cons!26205 (h!27423 (_ BitVec 64)) (t!38790 List!26209)) )
))
(declare-fun arrayNoDuplicates!0 (array!77085 (_ BitVec 32) List!26209) Bool)

(assert (=> b!1192993 (= res!793188 (arrayNoDuplicates!0 lt!542421 #b00000000000000000000000000000000 Nil!26206))))

(declare-fun b!1192994 () Bool)

(declare-fun res!793192 () Bool)

(declare-fun e!678237 () Bool)

(assert (=> b!1192994 (=> (not res!793192) (not e!678237))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77085)

(assert (=> b!1192994 (= res!793192 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37723 _keys!1208))))))

(declare-fun b!1192995 () Bool)

(declare-fun res!793194 () Bool)

(assert (=> b!1192995 (=> (not res!793194) (not e!678237))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45297 0))(
  ( (V!45298 (val!15120 Int)) )
))
(declare-datatypes ((ValueCell!14354 0))(
  ( (ValueCellFull!14354 (v!17754 V!45297)) (EmptyCell!14354) )
))
(declare-datatypes ((array!77087 0))(
  ( (array!77088 (arr!37187 (Array (_ BitVec 32) ValueCell!14354)) (size!37724 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77087)

(assert (=> b!1192995 (= res!793194 (and (= (size!37724 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37723 _keys!1208) (size!37724 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47018 () Bool)

(declare-fun mapRes!47018 () Bool)

(assert (=> mapIsEmpty!47018 mapRes!47018))

(declare-fun b!1192996 () Bool)

(declare-fun res!793196 () Bool)

(assert (=> b!1192996 (=> (not res!793196) (not e!678237))))

(assert (=> b!1192996 (= res!793196 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26206))))

(declare-fun b!1192997 () Bool)

(declare-fun e!678235 () Bool)

(assert (=> b!1192997 (= e!678235 (and e!678239 mapRes!47018))))

(declare-fun condMapEmpty!47018 () Bool)

(declare-fun mapDefault!47018 () ValueCell!14354)

(assert (=> b!1192997 (= condMapEmpty!47018 (= (arr!37187 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14354)) mapDefault!47018)))))

(declare-fun b!1192998 () Bool)

(declare-fun e!678242 () Bool)

(assert (=> b!1192998 (= e!678242 true)))

(declare-fun zeroValue!944 () V!45297)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45297)

(declare-fun lt!542420 () array!77087)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!19464 0))(
  ( (tuple2!19465 (_1!9743 (_ BitVec 64)) (_2!9743 V!45297)) )
))
(declare-datatypes ((List!26210 0))(
  ( (Nil!26207) (Cons!26206 (h!27424 tuple2!19464) (t!38791 List!26210)) )
))
(declare-datatypes ((ListLongMap!17441 0))(
  ( (ListLongMap!17442 (toList!8736 List!26210)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5204 (array!77085 array!77087 (_ BitVec 32) (_ BitVec 32) V!45297 V!45297 (_ BitVec 32) Int) ListLongMap!17441)

(declare-fun -!1743 (ListLongMap!17441 (_ BitVec 64)) ListLongMap!17441)

(assert (=> b!1192998 (= (getCurrentListMapNoExtraKeys!5204 lt!542421 lt!542420 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1743 (getCurrentListMapNoExtraKeys!5204 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39513 0))(
  ( (Unit!39514) )
))
(declare-fun lt!542419 () Unit!39513)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!958 (array!77085 array!77087 (_ BitVec 32) (_ BitVec 32) V!45297 V!45297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39513)

(assert (=> b!1192998 (= lt!542419 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192999 () Bool)

(declare-fun res!793198 () Bool)

(assert (=> b!1192999 (=> (not res!793198) (not e!678237))))

(assert (=> b!1192999 (= res!793198 (= (select (arr!37186 _keys!1208) i!673) k0!934))))

(declare-fun b!1193000 () Bool)

(declare-fun e!678236 () Bool)

(assert (=> b!1193000 (= e!678236 e!678242)))

(declare-fun res!793190 () Bool)

(assert (=> b!1193000 (=> res!793190 e!678242)))

(assert (=> b!1193000 (= res!793190 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542417 () ListLongMap!17441)

(assert (=> b!1193000 (= lt!542417 (getCurrentListMapNoExtraKeys!5204 lt!542421 lt!542420 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3158 (Int (_ BitVec 64)) V!45297)

(assert (=> b!1193000 (= lt!542420 (array!77088 (store (arr!37187 _values!996) i!673 (ValueCellFull!14354 (dynLambda!3158 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37724 _values!996)))))

(declare-fun lt!542418 () ListLongMap!17441)

(assert (=> b!1193000 (= lt!542418 (getCurrentListMapNoExtraKeys!5204 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193002 () Bool)

(declare-fun res!793193 () Bool)

(assert (=> b!1193002 (=> (not res!793193) (not e!678237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77085 (_ BitVec 32)) Bool)

(assert (=> b!1193002 (= res!793193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193003 () Bool)

(assert (=> b!1193003 (= e!678237 e!678241)))

(declare-fun res!793197 () Bool)

(assert (=> b!1193003 (=> (not res!793197) (not e!678241))))

(assert (=> b!1193003 (= res!793197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542421 mask!1564))))

(assert (=> b!1193003 (= lt!542421 (array!77086 (store (arr!37186 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37723 _keys!1208)))))

(declare-fun b!1193004 () Bool)

(declare-fun e!678240 () Bool)

(assert (=> b!1193004 (= e!678240 tp_is_empty!30127)))

(declare-fun b!1193005 () Bool)

(declare-fun res!793189 () Bool)

(assert (=> b!1193005 (=> (not res!793189) (not e!678237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193005 (= res!793189 (validKeyInArray!0 k0!934))))

(declare-fun b!1193001 () Bool)

(assert (=> b!1193001 (= e!678241 (not e!678236))))

(declare-fun res!793195 () Bool)

(assert (=> b!1193001 (=> res!793195 e!678236)))

(assert (=> b!1193001 (= res!793195 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193001 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542422 () Unit!39513)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77085 (_ BitVec 64) (_ BitVec 32)) Unit!39513)

(assert (=> b!1193001 (= lt!542422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!793199 () Bool)

(assert (=> start!100254 (=> (not res!793199) (not e!678237))))

(assert (=> start!100254 (= res!793199 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37723 _keys!1208))))))

(assert (=> start!100254 e!678237))

(assert (=> start!100254 tp_is_empty!30127))

(declare-fun array_inv!28418 (array!77085) Bool)

(assert (=> start!100254 (array_inv!28418 _keys!1208)))

(assert (=> start!100254 true))

(assert (=> start!100254 tp!89504))

(declare-fun array_inv!28419 (array!77087) Bool)

(assert (=> start!100254 (and (array_inv!28419 _values!996) e!678235)))

(declare-fun mapNonEmpty!47018 () Bool)

(declare-fun tp!89505 () Bool)

(assert (=> mapNonEmpty!47018 (= mapRes!47018 (and tp!89505 e!678240))))

(declare-fun mapValue!47018 () ValueCell!14354)

(declare-fun mapRest!47018 () (Array (_ BitVec 32) ValueCell!14354))

(declare-fun mapKey!47018 () (_ BitVec 32))

(assert (=> mapNonEmpty!47018 (= (arr!37187 _values!996) (store mapRest!47018 mapKey!47018 mapValue!47018))))

(declare-fun b!1193006 () Bool)

(declare-fun res!793191 () Bool)

(assert (=> b!1193006 (=> (not res!793191) (not e!678237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193006 (= res!793191 (validMask!0 mask!1564))))

(assert (= (and start!100254 res!793199) b!1193006))

(assert (= (and b!1193006 res!793191) b!1192995))

(assert (= (and b!1192995 res!793194) b!1193002))

(assert (= (and b!1193002 res!793193) b!1192996))

(assert (= (and b!1192996 res!793196) b!1192994))

(assert (= (and b!1192994 res!793192) b!1193005))

(assert (= (and b!1193005 res!793189) b!1192999))

(assert (= (and b!1192999 res!793198) b!1193003))

(assert (= (and b!1193003 res!793197) b!1192993))

(assert (= (and b!1192993 res!793188) b!1193001))

(assert (= (and b!1193001 (not res!793195)) b!1193000))

(assert (= (and b!1193000 (not res!793190)) b!1192998))

(assert (= (and b!1192997 condMapEmpty!47018) mapIsEmpty!47018))

(assert (= (and b!1192997 (not condMapEmpty!47018)) mapNonEmpty!47018))

(get-info :version)

(assert (= (and mapNonEmpty!47018 ((_ is ValueCellFull!14354) mapValue!47018)) b!1193004))

(assert (= (and b!1192997 ((_ is ValueCellFull!14354) mapDefault!47018)) b!1192992))

(assert (= start!100254 b!1192997))

(declare-fun b_lambda!20735 () Bool)

(assert (=> (not b_lambda!20735) (not b!1193000)))

(declare-fun t!38789 () Bool)

(declare-fun tb!10401 () Bool)

(assert (=> (and start!100254 (= defaultEntry!1004 defaultEntry!1004) t!38789) tb!10401))

(declare-fun result!21377 () Bool)

(assert (=> tb!10401 (= result!21377 tp_is_empty!30127)))

(assert (=> b!1193000 t!38789))

(declare-fun b_and!42065 () Bool)

(assert (= b_and!42063 (and (=> t!38789 result!21377) b_and!42065)))

(declare-fun m!1101711 () Bool)

(assert (=> b!1193002 m!1101711))

(declare-fun m!1101713 () Bool)

(assert (=> b!1192998 m!1101713))

(declare-fun m!1101715 () Bool)

(assert (=> b!1192998 m!1101715))

(assert (=> b!1192998 m!1101715))

(declare-fun m!1101717 () Bool)

(assert (=> b!1192998 m!1101717))

(declare-fun m!1101719 () Bool)

(assert (=> b!1192998 m!1101719))

(declare-fun m!1101721 () Bool)

(assert (=> b!1192993 m!1101721))

(declare-fun m!1101723 () Bool)

(assert (=> b!1193006 m!1101723))

(declare-fun m!1101725 () Bool)

(assert (=> b!1192996 m!1101725))

(declare-fun m!1101727 () Bool)

(assert (=> b!1193001 m!1101727))

(declare-fun m!1101729 () Bool)

(assert (=> b!1193001 m!1101729))

(declare-fun m!1101731 () Bool)

(assert (=> start!100254 m!1101731))

(declare-fun m!1101733 () Bool)

(assert (=> start!100254 m!1101733))

(declare-fun m!1101735 () Bool)

(assert (=> b!1192999 m!1101735))

(declare-fun m!1101737 () Bool)

(assert (=> b!1193003 m!1101737))

(declare-fun m!1101739 () Bool)

(assert (=> b!1193003 m!1101739))

(declare-fun m!1101741 () Bool)

(assert (=> mapNonEmpty!47018 m!1101741))

(declare-fun m!1101743 () Bool)

(assert (=> b!1193000 m!1101743))

(declare-fun m!1101745 () Bool)

(assert (=> b!1193000 m!1101745))

(declare-fun m!1101747 () Bool)

(assert (=> b!1193000 m!1101747))

(declare-fun m!1101749 () Bool)

(assert (=> b!1193000 m!1101749))

(declare-fun m!1101751 () Bool)

(assert (=> b!1193005 m!1101751))

(check-sat (not b_lambda!20735) (not b!1193002) (not b!1193005) tp_is_empty!30127 b_and!42065 (not start!100254) (not b!1193001) (not b!1192996) (not b!1193006) (not b!1193000) (not b!1192998) (not b!1192993) (not b_next!25597) (not b!1193003) (not mapNonEmpty!47018))
(check-sat b_and!42065 (not b_next!25597))
