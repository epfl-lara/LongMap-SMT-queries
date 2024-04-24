; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100038 () Bool)

(assert start!100038)

(declare-fun b_free!25381 () Bool)

(declare-fun b_next!25381 () Bool)

(assert (=> start!100038 (= b_free!25381 (not b_next!25381))))

(declare-fun tp!88857 () Bool)

(declare-fun b_and!41631 () Bool)

(assert (=> start!100038 (= tp!88857 b_and!41631)))

(declare-fun b!1187386 () Bool)

(declare-fun res!788991 () Bool)

(declare-fun e!675219 () Bool)

(assert (=> b!1187386 (=> (not res!788991) (not e!675219))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187386 (= res!788991 (validMask!0 mask!1564))))

(declare-datatypes ((array!76665 0))(
  ( (array!76666 (arr!36976 (Array (_ BitVec 32) (_ BitVec 64))) (size!37513 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76665)

(declare-fun e!675226 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1187387 () Bool)

(declare-fun arrayContainsKey!0 (array!76665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187387 (= e!675226 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187388 () Bool)

(declare-fun e!675229 () Bool)

(assert (=> b!1187388 (= e!675219 e!675229)))

(declare-fun res!788995 () Bool)

(assert (=> b!1187388 (=> (not res!788995) (not e!675229))))

(declare-fun lt!539096 () array!76665)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76665 (_ BitVec 32)) Bool)

(assert (=> b!1187388 (= res!788995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539096 mask!1564))))

(assert (=> b!1187388 (= lt!539096 (array!76666 (store (arr!36976 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37513 _keys!1208)))))

(declare-fun b!1187389 () Bool)

(declare-fun e!675227 () Bool)

(declare-fun e!675220 () Bool)

(declare-fun mapRes!46694 () Bool)

(assert (=> b!1187389 (= e!675227 (and e!675220 mapRes!46694))))

(declare-fun condMapEmpty!46694 () Bool)

(declare-datatypes ((V!45009 0))(
  ( (V!45010 (val!15012 Int)) )
))
(declare-datatypes ((ValueCell!14246 0))(
  ( (ValueCellFull!14246 (v!17646 V!45009)) (EmptyCell!14246) )
))
(declare-datatypes ((array!76667 0))(
  ( (array!76668 (arr!36977 (Array (_ BitVec 32) ValueCell!14246)) (size!37514 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76667)

(declare-fun mapDefault!46694 () ValueCell!14246)

(assert (=> b!1187389 (= condMapEmpty!46694 (= (arr!36977 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14246)) mapDefault!46694)))))

(declare-fun b!1187390 () Bool)

(declare-datatypes ((Unit!39304 0))(
  ( (Unit!39305) )
))
(declare-fun e!675230 () Unit!39304)

(declare-fun Unit!39306 () Unit!39304)

(assert (=> b!1187390 (= e!675230 Unit!39306)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539104 () Unit!39304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39304)

(assert (=> b!1187390 (= lt!539104 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187390 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539112 () Unit!39304)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76665 (_ BitVec 32) (_ BitVec 32)) Unit!39304)

(assert (=> b!1187390 (= lt!539112 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26039 0))(
  ( (Nil!26036) (Cons!26035 (h!27253 (_ BitVec 64)) (t!38404 List!26039)) )
))
(declare-fun arrayNoDuplicates!0 (array!76665 (_ BitVec 32) List!26039) Bool)

(assert (=> b!1187390 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26036)))

(declare-fun lt!539105 () Unit!39304)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76665 (_ BitVec 64) (_ BitVec 32) List!26039) Unit!39304)

(assert (=> b!1187390 (= lt!539105 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26036))))

(assert (=> b!1187390 false))

(declare-fun b!1187391 () Bool)

(declare-fun res!788996 () Bool)

(assert (=> b!1187391 (=> (not res!788996) (not e!675219))))

(assert (=> b!1187391 (= res!788996 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37513 _keys!1208))))))

(declare-fun b!1187393 () Bool)

(declare-fun res!788984 () Bool)

(assert (=> b!1187393 (=> (not res!788984) (not e!675219))))

(assert (=> b!1187393 (= res!788984 (= (select (arr!36976 _keys!1208) i!673) k0!934))))

(declare-fun b!1187394 () Bool)

(declare-fun e!675221 () Bool)

(declare-fun e!675225 () Bool)

(assert (=> b!1187394 (= e!675221 e!675225)))

(declare-fun res!788986 () Bool)

(assert (=> b!1187394 (=> res!788986 e!675225)))

(assert (=> b!1187394 (= res!788986 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539098 () array!76667)

(declare-fun minValue!944 () V!45009)

(declare-datatypes ((tuple2!19304 0))(
  ( (tuple2!19305 (_1!9663 (_ BitVec 64)) (_2!9663 V!45009)) )
))
(declare-datatypes ((List!26040 0))(
  ( (Nil!26037) (Cons!26036 (h!27254 tuple2!19304) (t!38405 List!26040)) )
))
(declare-datatypes ((ListLongMap!17281 0))(
  ( (ListLongMap!17282 (toList!8656 List!26040)) )
))
(declare-fun lt!539107 () ListLongMap!17281)

(declare-fun getCurrentListMapNoExtraKeys!5125 (array!76665 array!76667 (_ BitVec 32) (_ BitVec 32) V!45009 V!45009 (_ BitVec 32) Int) ListLongMap!17281)

(assert (=> b!1187394 (= lt!539107 (getCurrentListMapNoExtraKeys!5125 lt!539096 lt!539098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539103 () V!45009)

(assert (=> b!1187394 (= lt!539098 (array!76668 (store (arr!36977 _values!996) i!673 (ValueCellFull!14246 lt!539103)) (size!37514 _values!996)))))

(declare-fun dynLambda!3086 (Int (_ BitVec 64)) V!45009)

(assert (=> b!1187394 (= lt!539103 (dynLambda!3086 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539111 () ListLongMap!17281)

(assert (=> b!1187394 (= lt!539111 (getCurrentListMapNoExtraKeys!5125 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187395 () Bool)

(declare-fun res!788982 () Bool)

(assert (=> b!1187395 (=> (not res!788982) (not e!675219))))

(assert (=> b!1187395 (= res!788982 (and (= (size!37514 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37513 _keys!1208) (size!37514 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187396 () Bool)

(declare-fun res!788987 () Bool)

(assert (=> b!1187396 (=> (not res!788987) (not e!675219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187396 (= res!788987 (validKeyInArray!0 k0!934))))

(declare-fun b!1187397 () Bool)

(declare-fun e!675228 () Bool)

(assert (=> b!1187397 (= e!675225 e!675228)))

(declare-fun res!788992 () Bool)

(assert (=> b!1187397 (=> res!788992 e!675228)))

(assert (=> b!1187397 (= res!788992 (not (validKeyInArray!0 (select (arr!36976 _keys!1208) from!1455))))))

(declare-fun lt!539099 () ListLongMap!17281)

(declare-fun lt!539102 () ListLongMap!17281)

(assert (=> b!1187397 (= lt!539099 lt!539102)))

(declare-fun lt!539097 () ListLongMap!17281)

(declare-fun -!1676 (ListLongMap!17281 (_ BitVec 64)) ListLongMap!17281)

(assert (=> b!1187397 (= lt!539102 (-!1676 lt!539097 k0!934))))

(assert (=> b!1187397 (= lt!539099 (getCurrentListMapNoExtraKeys!5125 lt!539096 lt!539098 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187397 (= lt!539097 (getCurrentListMapNoExtraKeys!5125 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539101 () Unit!39304)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!894 (array!76665 array!76667 (_ BitVec 32) (_ BitVec 32) V!45009 V!45009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39304)

(assert (=> b!1187397 (= lt!539101 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46694 () Bool)

(assert (=> mapIsEmpty!46694 mapRes!46694))

(declare-fun b!1187398 () Bool)

(declare-fun res!788989 () Bool)

(assert (=> b!1187398 (=> (not res!788989) (not e!675229))))

(assert (=> b!1187398 (= res!788989 (arrayNoDuplicates!0 lt!539096 #b00000000000000000000000000000000 Nil!26036))))

(declare-fun b!1187399 () Bool)

(declare-fun res!788993 () Bool)

(assert (=> b!1187399 (=> (not res!788993) (not e!675219))))

(assert (=> b!1187399 (= res!788993 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26036))))

(declare-fun b!1187400 () Bool)

(declare-fun e!675223 () Bool)

(declare-fun tp_is_empty!29911 () Bool)

(assert (=> b!1187400 (= e!675223 tp_is_empty!29911)))

(declare-fun b!1187401 () Bool)

(assert (=> b!1187401 (= e!675220 tp_is_empty!29911)))

(declare-fun b!1187402 () Bool)

(assert (=> b!1187402 (= e!675228 true)))

(declare-fun lt!539110 () ListLongMap!17281)

(declare-fun lt!539106 () ListLongMap!17281)

(assert (=> b!1187402 (= (-!1676 lt!539110 k0!934) lt!539106)))

(declare-fun lt!539109 () Unit!39304)

(declare-fun lt!539095 () V!45009)

(declare-fun addRemoveCommutativeForDiffKeys!189 (ListLongMap!17281 (_ BitVec 64) V!45009 (_ BitVec 64)) Unit!39304)

(assert (=> b!1187402 (= lt!539109 (addRemoveCommutativeForDiffKeys!189 lt!539097 (select (arr!36976 _keys!1208) from!1455) lt!539095 k0!934))))

(assert (=> b!1187402 (and (= lt!539111 lt!539110) (= lt!539102 lt!539099))))

(declare-fun lt!539108 () tuple2!19304)

(declare-fun +!3973 (ListLongMap!17281 tuple2!19304) ListLongMap!17281)

(assert (=> b!1187402 (= lt!539110 (+!3973 lt!539097 lt!539108))))

(assert (=> b!1187402 (not (= (select (arr!36976 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539100 () Unit!39304)

(assert (=> b!1187402 (= lt!539100 e!675230)))

(declare-fun c!117593 () Bool)

(assert (=> b!1187402 (= c!117593 (= (select (arr!36976 _keys!1208) from!1455) k0!934))))

(declare-fun e!675224 () Bool)

(assert (=> b!1187402 e!675224))

(declare-fun res!788990 () Bool)

(assert (=> b!1187402 (=> (not res!788990) (not e!675224))))

(assert (=> b!1187402 (= res!788990 (= lt!539107 lt!539106))))

(assert (=> b!1187402 (= lt!539106 (+!3973 lt!539102 lt!539108))))

(assert (=> b!1187402 (= lt!539108 (tuple2!19305 (select (arr!36976 _keys!1208) from!1455) lt!539095))))

(declare-fun get!18978 (ValueCell!14246 V!45009) V!45009)

(assert (=> b!1187402 (= lt!539095 (get!18978 (select (arr!36977 _values!996) from!1455) lt!539103))))

(declare-fun b!1187403 () Bool)

(declare-fun res!788988 () Bool)

(assert (=> b!1187403 (=> (not res!788988) (not e!675219))))

(assert (=> b!1187403 (= res!788988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187404 () Bool)

(assert (=> b!1187404 (= e!675229 (not e!675221))))

(declare-fun res!788994 () Bool)

(assert (=> b!1187404 (=> res!788994 e!675221)))

(assert (=> b!1187404 (= res!788994 (bvsgt from!1455 i!673))))

(assert (=> b!1187404 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539113 () Unit!39304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76665 (_ BitVec 64) (_ BitVec 32)) Unit!39304)

(assert (=> b!1187404 (= lt!539113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187392 () Bool)

(declare-fun Unit!39307 () Unit!39304)

(assert (=> b!1187392 (= e!675230 Unit!39307)))

(declare-fun res!788983 () Bool)

(assert (=> start!100038 (=> (not res!788983) (not e!675219))))

(assert (=> start!100038 (= res!788983 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37513 _keys!1208))))))

(assert (=> start!100038 e!675219))

(assert (=> start!100038 tp_is_empty!29911))

(declare-fun array_inv!28292 (array!76665) Bool)

(assert (=> start!100038 (array_inv!28292 _keys!1208)))

(assert (=> start!100038 true))

(assert (=> start!100038 tp!88857))

(declare-fun array_inv!28293 (array!76667) Bool)

(assert (=> start!100038 (and (array_inv!28293 _values!996) e!675227)))

(declare-fun mapNonEmpty!46694 () Bool)

(declare-fun tp!88856 () Bool)

(assert (=> mapNonEmpty!46694 (= mapRes!46694 (and tp!88856 e!675223))))

(declare-fun mapRest!46694 () (Array (_ BitVec 32) ValueCell!14246))

(declare-fun mapValue!46694 () ValueCell!14246)

(declare-fun mapKey!46694 () (_ BitVec 32))

(assert (=> mapNonEmpty!46694 (= (arr!36977 _values!996) (store mapRest!46694 mapKey!46694 mapValue!46694))))

(declare-fun b!1187405 () Bool)

(assert (=> b!1187405 (= e!675224 e!675226)))

(declare-fun res!788985 () Bool)

(assert (=> b!1187405 (=> res!788985 e!675226)))

(assert (=> b!1187405 (= res!788985 (not (= (select (arr!36976 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!100038 res!788983) b!1187386))

(assert (= (and b!1187386 res!788991) b!1187395))

(assert (= (and b!1187395 res!788982) b!1187403))

(assert (= (and b!1187403 res!788988) b!1187399))

(assert (= (and b!1187399 res!788993) b!1187391))

(assert (= (and b!1187391 res!788996) b!1187396))

(assert (= (and b!1187396 res!788987) b!1187393))

(assert (= (and b!1187393 res!788984) b!1187388))

(assert (= (and b!1187388 res!788995) b!1187398))

(assert (= (and b!1187398 res!788989) b!1187404))

(assert (= (and b!1187404 (not res!788994)) b!1187394))

(assert (= (and b!1187394 (not res!788986)) b!1187397))

(assert (= (and b!1187397 (not res!788992)) b!1187402))

(assert (= (and b!1187402 res!788990) b!1187405))

(assert (= (and b!1187405 (not res!788985)) b!1187387))

(assert (= (and b!1187402 c!117593) b!1187390))

(assert (= (and b!1187402 (not c!117593)) b!1187392))

(assert (= (and b!1187389 condMapEmpty!46694) mapIsEmpty!46694))

(assert (= (and b!1187389 (not condMapEmpty!46694)) mapNonEmpty!46694))

(get-info :version)

(assert (= (and mapNonEmpty!46694 ((_ is ValueCellFull!14246) mapValue!46694)) b!1187400))

(assert (= (and b!1187389 ((_ is ValueCellFull!14246) mapDefault!46694)) b!1187401))

(assert (= start!100038 b!1187389))

(declare-fun b_lambda!20519 () Bool)

(assert (=> (not b_lambda!20519) (not b!1187394)))

(declare-fun t!38403 () Bool)

(declare-fun tb!10185 () Bool)

(assert (=> (and start!100038 (= defaultEntry!1004 defaultEntry!1004) t!38403) tb!10185))

(declare-fun result!20945 () Bool)

(assert (=> tb!10185 (= result!20945 tp_is_empty!29911)))

(assert (=> b!1187394 t!38403))

(declare-fun b_and!41633 () Bool)

(assert (= b_and!41631 (and (=> t!38403 result!20945) b_and!41633)))

(declare-fun m!1096167 () Bool)

(assert (=> b!1187387 m!1096167))

(declare-fun m!1096169 () Bool)

(assert (=> b!1187388 m!1096169))

(declare-fun m!1096171 () Bool)

(assert (=> b!1187388 m!1096171))

(declare-fun m!1096173 () Bool)

(assert (=> b!1187396 m!1096173))

(declare-fun m!1096175 () Bool)

(assert (=> b!1187394 m!1096175))

(declare-fun m!1096177 () Bool)

(assert (=> b!1187394 m!1096177))

(declare-fun m!1096179 () Bool)

(assert (=> b!1187394 m!1096179))

(declare-fun m!1096181 () Bool)

(assert (=> b!1187394 m!1096181))

(declare-fun m!1096183 () Bool)

(assert (=> start!100038 m!1096183))

(declare-fun m!1096185 () Bool)

(assert (=> start!100038 m!1096185))

(declare-fun m!1096187 () Bool)

(assert (=> b!1187399 m!1096187))

(declare-fun m!1096189 () Bool)

(assert (=> b!1187397 m!1096189))

(declare-fun m!1096191 () Bool)

(assert (=> b!1187397 m!1096191))

(declare-fun m!1096193 () Bool)

(assert (=> b!1187397 m!1096193))

(declare-fun m!1096195 () Bool)

(assert (=> b!1187397 m!1096195))

(declare-fun m!1096197 () Bool)

(assert (=> b!1187397 m!1096197))

(declare-fun m!1096199 () Bool)

(assert (=> b!1187397 m!1096199))

(assert (=> b!1187397 m!1096195))

(assert (=> b!1187402 m!1096195))

(declare-fun m!1096201 () Bool)

(assert (=> b!1187402 m!1096201))

(declare-fun m!1096203 () Bool)

(assert (=> b!1187402 m!1096203))

(declare-fun m!1096205 () Bool)

(assert (=> b!1187402 m!1096205))

(declare-fun m!1096207 () Bool)

(assert (=> b!1187402 m!1096207))

(declare-fun m!1096209 () Bool)

(assert (=> b!1187402 m!1096209))

(assert (=> b!1187402 m!1096195))

(assert (=> b!1187402 m!1096203))

(declare-fun m!1096211 () Bool)

(assert (=> b!1187402 m!1096211))

(declare-fun m!1096213 () Bool)

(assert (=> b!1187390 m!1096213))

(declare-fun m!1096215 () Bool)

(assert (=> b!1187390 m!1096215))

(declare-fun m!1096217 () Bool)

(assert (=> b!1187390 m!1096217))

(declare-fun m!1096219 () Bool)

(assert (=> b!1187390 m!1096219))

(declare-fun m!1096221 () Bool)

(assert (=> b!1187390 m!1096221))

(declare-fun m!1096223 () Bool)

(assert (=> b!1187398 m!1096223))

(assert (=> b!1187405 m!1096195))

(declare-fun m!1096225 () Bool)

(assert (=> b!1187404 m!1096225))

(declare-fun m!1096227 () Bool)

(assert (=> b!1187404 m!1096227))

(declare-fun m!1096229 () Bool)

(assert (=> mapNonEmpty!46694 m!1096229))

(declare-fun m!1096231 () Bool)

(assert (=> b!1187393 m!1096231))

(declare-fun m!1096233 () Bool)

(assert (=> b!1187386 m!1096233))

(declare-fun m!1096235 () Bool)

(assert (=> b!1187403 m!1096235))

(check-sat (not b!1187398) b_and!41633 tp_is_empty!29911 (not b!1187386) (not b_next!25381) (not b!1187388) (not mapNonEmpty!46694) (not b_lambda!20519) (not b!1187387) (not start!100038) (not b!1187397) (not b!1187394) (not b!1187403) (not b!1187390) (not b!1187396) (not b!1187402) (not b!1187404) (not b!1187399))
(check-sat b_and!41633 (not b_next!25381))
