; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99924 () Bool)

(assert start!99924)

(declare-fun b_free!25503 () Bool)

(declare-fun b_next!25503 () Bool)

(assert (=> start!99924 (= b_free!25503 (not b_next!25503))))

(declare-fun tp!89222 () Bool)

(declare-fun b_and!41873 () Bool)

(assert (=> start!99924 (= tp!89222 b_and!41873)))

(declare-fun res!790996 () Bool)

(declare-fun e!676280 () Bool)

(assert (=> start!99924 (=> (not res!790996) (not e!676280))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76861 0))(
  ( (array!76862 (arr!37080 (Array (_ BitVec 32) (_ BitVec 64))) (size!37616 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76861)

(assert (=> start!99924 (= res!790996 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37616 _keys!1208))))))

(assert (=> start!99924 e!676280))

(declare-fun tp_is_empty!30033 () Bool)

(assert (=> start!99924 tp_is_empty!30033))

(declare-fun array_inv!28284 (array!76861) Bool)

(assert (=> start!99924 (array_inv!28284 _keys!1208)))

(assert (=> start!99924 true))

(assert (=> start!99924 tp!89222))

(declare-datatypes ((V!45171 0))(
  ( (V!45172 (val!15073 Int)) )
))
(declare-datatypes ((ValueCell!14307 0))(
  ( (ValueCellFull!14307 (v!17711 V!45171)) (EmptyCell!14307) )
))
(declare-datatypes ((array!76863 0))(
  ( (array!76864 (arr!37081 (Array (_ BitVec 32) ValueCell!14307)) (size!37617 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76863)

(declare-fun e!676275 () Bool)

(declare-fun array_inv!28285 (array!76863) Bool)

(assert (=> start!99924 (and (array_inv!28285 _values!996) e!676275)))

(declare-fun b!1189494 () Bool)

(declare-fun e!676278 () Bool)

(declare-fun mapRes!46877 () Bool)

(assert (=> b!1189494 (= e!676275 (and e!676278 mapRes!46877))))

(declare-fun condMapEmpty!46877 () Bool)

(declare-fun mapDefault!46877 () ValueCell!14307)

(assert (=> b!1189494 (= condMapEmpty!46877 (= (arr!37081 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14307)) mapDefault!46877)))))

(declare-fun b!1189495 () Bool)

(declare-fun res!790990 () Bool)

(assert (=> b!1189495 (=> (not res!790990) (not e!676280))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189495 (= res!790990 (validKeyInArray!0 k0!934))))

(declare-fun b!1189496 () Bool)

(declare-fun e!676281 () Bool)

(assert (=> b!1189496 (= e!676281 true)))

(declare-fun zeroValue!944 () V!45171)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541087 () array!76861)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541092 () array!76863)

(declare-fun minValue!944 () V!45171)

(declare-datatypes ((tuple2!19360 0))(
  ( (tuple2!19361 (_1!9691 (_ BitVec 64)) (_2!9691 V!45171)) )
))
(declare-datatypes ((List!26104 0))(
  ( (Nil!26101) (Cons!26100 (h!27309 tuple2!19360) (t!38599 List!26104)) )
))
(declare-datatypes ((ListLongMap!17329 0))(
  ( (ListLongMap!17330 (toList!8680 List!26104)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5121 (array!76861 array!76863 (_ BitVec 32) (_ BitVec 32) V!45171 V!45171 (_ BitVec 32) Int) ListLongMap!17329)

(declare-fun -!1709 (ListLongMap!17329 (_ BitVec 64)) ListLongMap!17329)

(assert (=> b!1189496 (= (getCurrentListMapNoExtraKeys!5121 lt!541087 lt!541092 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1709 (getCurrentListMapNoExtraKeys!5121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39460 0))(
  ( (Unit!39461) )
))
(declare-fun lt!541088 () Unit!39460)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!918 (array!76861 array!76863 (_ BitVec 32) (_ BitVec 32) V!45171 V!45171 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39460)

(assert (=> b!1189496 (= lt!541088 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!918 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189497 () Bool)

(declare-fun res!790998 () Bool)

(assert (=> b!1189497 (=> (not res!790998) (not e!676280))))

(declare-datatypes ((List!26105 0))(
  ( (Nil!26102) (Cons!26101 (h!27310 (_ BitVec 64)) (t!38600 List!26105)) )
))
(declare-fun arrayNoDuplicates!0 (array!76861 (_ BitVec 32) List!26105) Bool)

(assert (=> b!1189497 (= res!790998 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26102))))

(declare-fun b!1189498 () Bool)

(declare-fun res!790988 () Bool)

(declare-fun e!676279 () Bool)

(assert (=> b!1189498 (=> (not res!790988) (not e!676279))))

(assert (=> b!1189498 (= res!790988 (arrayNoDuplicates!0 lt!541087 #b00000000000000000000000000000000 Nil!26102))))

(declare-fun b!1189499 () Bool)

(assert (=> b!1189499 (= e!676280 e!676279)))

(declare-fun res!790995 () Bool)

(assert (=> b!1189499 (=> (not res!790995) (not e!676279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76861 (_ BitVec 32)) Bool)

(assert (=> b!1189499 (= res!790995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541087 mask!1564))))

(assert (=> b!1189499 (= lt!541087 (array!76862 (store (arr!37080 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37616 _keys!1208)))))

(declare-fun b!1189500 () Bool)

(declare-fun e!676276 () Bool)

(assert (=> b!1189500 (= e!676279 (not e!676276))))

(declare-fun res!790991 () Bool)

(assert (=> b!1189500 (=> res!790991 e!676276)))

(assert (=> b!1189500 (= res!790991 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189500 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541090 () Unit!39460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76861 (_ BitVec 64) (_ BitVec 32)) Unit!39460)

(assert (=> b!1189500 (= lt!541090 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189501 () Bool)

(declare-fun res!790999 () Bool)

(assert (=> b!1189501 (=> (not res!790999) (not e!676280))))

(assert (=> b!1189501 (= res!790999 (and (= (size!37617 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37616 _keys!1208) (size!37617 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189502 () Bool)

(declare-fun res!790992 () Bool)

(assert (=> b!1189502 (=> (not res!790992) (not e!676280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189502 (= res!790992 (validMask!0 mask!1564))))

(declare-fun b!1189503 () Bool)

(declare-fun e!676277 () Bool)

(assert (=> b!1189503 (= e!676277 tp_is_empty!30033)))

(declare-fun mapIsEmpty!46877 () Bool)

(assert (=> mapIsEmpty!46877 mapRes!46877))

(declare-fun b!1189504 () Bool)

(assert (=> b!1189504 (= e!676276 e!676281)))

(declare-fun res!790994 () Bool)

(assert (=> b!1189504 (=> res!790994 e!676281)))

(assert (=> b!1189504 (= res!790994 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541089 () ListLongMap!17329)

(assert (=> b!1189504 (= lt!541089 (getCurrentListMapNoExtraKeys!5121 lt!541087 lt!541092 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3064 (Int (_ BitVec 64)) V!45171)

(assert (=> b!1189504 (= lt!541092 (array!76864 (store (arr!37081 _values!996) i!673 (ValueCellFull!14307 (dynLambda!3064 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37617 _values!996)))))

(declare-fun lt!541091 () ListLongMap!17329)

(assert (=> b!1189504 (= lt!541091 (getCurrentListMapNoExtraKeys!5121 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189505 () Bool)

(declare-fun res!790997 () Bool)

(assert (=> b!1189505 (=> (not res!790997) (not e!676280))))

(assert (=> b!1189505 (= res!790997 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37616 _keys!1208))))))

(declare-fun b!1189506 () Bool)

(declare-fun res!790993 () Bool)

(assert (=> b!1189506 (=> (not res!790993) (not e!676280))))

(assert (=> b!1189506 (= res!790993 (= (select (arr!37080 _keys!1208) i!673) k0!934))))

(declare-fun b!1189507 () Bool)

(assert (=> b!1189507 (= e!676278 tp_is_empty!30033)))

(declare-fun mapNonEmpty!46877 () Bool)

(declare-fun tp!89223 () Bool)

(assert (=> mapNonEmpty!46877 (= mapRes!46877 (and tp!89223 e!676277))))

(declare-fun mapValue!46877 () ValueCell!14307)

(declare-fun mapRest!46877 () (Array (_ BitVec 32) ValueCell!14307))

(declare-fun mapKey!46877 () (_ BitVec 32))

(assert (=> mapNonEmpty!46877 (= (arr!37081 _values!996) (store mapRest!46877 mapKey!46877 mapValue!46877))))

(declare-fun b!1189508 () Bool)

(declare-fun res!790989 () Bool)

(assert (=> b!1189508 (=> (not res!790989) (not e!676280))))

(assert (=> b!1189508 (= res!790989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99924 res!790996) b!1189502))

(assert (= (and b!1189502 res!790992) b!1189501))

(assert (= (and b!1189501 res!790999) b!1189508))

(assert (= (and b!1189508 res!790989) b!1189497))

(assert (= (and b!1189497 res!790998) b!1189505))

(assert (= (and b!1189505 res!790997) b!1189495))

(assert (= (and b!1189495 res!790990) b!1189506))

(assert (= (and b!1189506 res!790993) b!1189499))

(assert (= (and b!1189499 res!790995) b!1189498))

(assert (= (and b!1189498 res!790988) b!1189500))

(assert (= (and b!1189500 (not res!790991)) b!1189504))

(assert (= (and b!1189504 (not res!790994)) b!1189496))

(assert (= (and b!1189494 condMapEmpty!46877) mapIsEmpty!46877))

(assert (= (and b!1189494 (not condMapEmpty!46877)) mapNonEmpty!46877))

(get-info :version)

(assert (= (and mapNonEmpty!46877 ((_ is ValueCellFull!14307) mapValue!46877)) b!1189503))

(assert (= (and b!1189494 ((_ is ValueCellFull!14307) mapDefault!46877)) b!1189507))

(assert (= start!99924 b!1189494))

(declare-fun b_lambda!20647 () Bool)

(assert (=> (not b_lambda!20647) (not b!1189504)))

(declare-fun t!38598 () Bool)

(declare-fun tb!10315 () Bool)

(assert (=> (and start!99924 (= defaultEntry!1004 defaultEntry!1004) t!38598) tb!10315))

(declare-fun result!21197 () Bool)

(assert (=> tb!10315 (= result!21197 tp_is_empty!30033)))

(assert (=> b!1189504 t!38598))

(declare-fun b_and!41875 () Bool)

(assert (= b_and!41873 (and (=> t!38598 result!21197) b_and!41875)))

(declare-fun m!1098165 () Bool)

(assert (=> b!1189506 m!1098165))

(declare-fun m!1098167 () Bool)

(assert (=> b!1189498 m!1098167))

(declare-fun m!1098169 () Bool)

(assert (=> b!1189508 m!1098169))

(declare-fun m!1098171 () Bool)

(assert (=> b!1189504 m!1098171))

(declare-fun m!1098173 () Bool)

(assert (=> b!1189504 m!1098173))

(declare-fun m!1098175 () Bool)

(assert (=> b!1189504 m!1098175))

(declare-fun m!1098177 () Bool)

(assert (=> b!1189504 m!1098177))

(declare-fun m!1098179 () Bool)

(assert (=> b!1189497 m!1098179))

(declare-fun m!1098181 () Bool)

(assert (=> b!1189500 m!1098181))

(declare-fun m!1098183 () Bool)

(assert (=> b!1189500 m!1098183))

(declare-fun m!1098185 () Bool)

(assert (=> b!1189502 m!1098185))

(declare-fun m!1098187 () Bool)

(assert (=> b!1189499 m!1098187))

(declare-fun m!1098189 () Bool)

(assert (=> b!1189499 m!1098189))

(declare-fun m!1098191 () Bool)

(assert (=> b!1189495 m!1098191))

(declare-fun m!1098193 () Bool)

(assert (=> b!1189496 m!1098193))

(declare-fun m!1098195 () Bool)

(assert (=> b!1189496 m!1098195))

(assert (=> b!1189496 m!1098195))

(declare-fun m!1098197 () Bool)

(assert (=> b!1189496 m!1098197))

(declare-fun m!1098199 () Bool)

(assert (=> b!1189496 m!1098199))

(declare-fun m!1098201 () Bool)

(assert (=> start!99924 m!1098201))

(declare-fun m!1098203 () Bool)

(assert (=> start!99924 m!1098203))

(declare-fun m!1098205 () Bool)

(assert (=> mapNonEmpty!46877 m!1098205))

(check-sat (not b!1189499) (not start!99924) (not b!1189497) (not b!1189508) (not b!1189498) (not b!1189496) (not b_lambda!20647) b_and!41875 (not b!1189500) (not b!1189495) (not b_next!25503) (not mapNonEmpty!46877) tp_is_empty!30033 (not b!1189502) (not b!1189504))
(check-sat b_and!41875 (not b_next!25503))
