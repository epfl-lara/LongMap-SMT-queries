; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101374 () Bool)

(assert start!101374)

(declare-fun b_free!26251 () Bool)

(declare-fun b_next!26251 () Bool)

(assert (=> start!101374 (= b_free!26251 (not b_next!26251))))

(declare-fun tp!91781 () Bool)

(declare-fun b_and!43637 () Bool)

(assert (=> start!101374 (= tp!91781 b_and!43637)))

(declare-fun mapNonEmpty!48313 () Bool)

(declare-fun mapRes!48313 () Bool)

(declare-fun tp!91780 () Bool)

(declare-fun e!691644 () Bool)

(assert (=> mapNonEmpty!48313 (= mapRes!48313 (and tp!91780 e!691644))))

(declare-fun mapKey!48313 () (_ BitVec 32))

(declare-datatypes ((V!46401 0))(
  ( (V!46402 (val!15534 Int)) )
))
(declare-datatypes ((ValueCell!14768 0))(
  ( (ValueCellFull!14768 (v!18188 V!46401)) (EmptyCell!14768) )
))
(declare-fun mapRest!48313 () (Array (_ BitVec 32) ValueCell!14768))

(declare-fun mapValue!48313 () ValueCell!14768)

(declare-datatypes ((array!78604 0))(
  ( (array!78605 (arr!37935 (Array (_ BitVec 32) ValueCell!14768)) (size!38473 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78604)

(assert (=> mapNonEmpty!48313 (= (arr!37935 _values!996) (store mapRest!48313 mapKey!48313 mapValue!48313))))

(declare-fun b!1218226 () Bool)

(declare-fun res!809090 () Bool)

(declare-fun e!691642 () Bool)

(assert (=> b!1218226 (=> (not res!809090) (not e!691642))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218226 (= res!809090 (validKeyInArray!0 k0!934))))

(declare-fun b!1218227 () Bool)

(declare-fun e!691641 () Bool)

(declare-fun e!691649 () Bool)

(assert (=> b!1218227 (= e!691641 e!691649)))

(declare-fun res!809091 () Bool)

(assert (=> b!1218227 (=> res!809091 e!691649)))

(declare-datatypes ((array!78606 0))(
  ( (array!78607 (arr!37936 (Array (_ BitVec 32) (_ BitVec 64))) (size!38474 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78606)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218227 (= res!809091 (not (= (select (arr!37936 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218228 () Bool)

(declare-fun e!691639 () Bool)

(declare-fun e!691647 () Bool)

(assert (=> b!1218228 (= e!691639 e!691647)))

(declare-fun res!809086 () Bool)

(assert (=> b!1218228 (=> res!809086 e!691647)))

(assert (=> b!1218228 (= res!809086 (not (validKeyInArray!0 (select (arr!37936 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20068 0))(
  ( (tuple2!20069 (_1!10045 (_ BitVec 64)) (_2!10045 V!46401)) )
))
(declare-datatypes ((List!26847 0))(
  ( (Nil!26844) (Cons!26843 (h!28052 tuple2!20068) (t!40069 List!26847)) )
))
(declare-datatypes ((ListLongMap!18037 0))(
  ( (ListLongMap!18038 (toList!9034 List!26847)) )
))
(declare-fun lt!553659 () ListLongMap!18037)

(declare-fun lt!553654 () ListLongMap!18037)

(assert (=> b!1218228 (= lt!553659 lt!553654)))

(declare-fun lt!553656 () ListLongMap!18037)

(declare-fun -!1867 (ListLongMap!18037 (_ BitVec 64)) ListLongMap!18037)

(assert (=> b!1218228 (= lt!553654 (-!1867 lt!553656 k0!934))))

(declare-fun zeroValue!944 () V!46401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553658 () array!78604)

(declare-fun minValue!944 () V!46401)

(declare-fun lt!553655 () array!78606)

(declare-fun getCurrentListMapNoExtraKeys!5473 (array!78606 array!78604 (_ BitVec 32) (_ BitVec 32) V!46401 V!46401 (_ BitVec 32) Int) ListLongMap!18037)

(assert (=> b!1218228 (= lt!553659 (getCurrentListMapNoExtraKeys!5473 lt!553655 lt!553658 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218228 (= lt!553656 (getCurrentListMapNoExtraKeys!5473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40241 0))(
  ( (Unit!40242) )
))
(declare-fun lt!553657 () Unit!40241)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1102 (array!78606 array!78604 (_ BitVec 32) (_ BitVec 32) V!46401 V!46401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40241)

(assert (=> b!1218228 (= lt!553657 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1102 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218229 () Bool)

(declare-fun res!809081 () Bool)

(assert (=> b!1218229 (=> (not res!809081) (not e!691642))))

(assert (=> b!1218229 (= res!809081 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38474 _keys!1208))))))

(declare-fun b!1218230 () Bool)

(declare-fun res!809089 () Bool)

(assert (=> b!1218230 (=> (not res!809089) (not e!691642))))

(assert (=> b!1218230 (= res!809089 (and (= (size!38473 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38474 _keys!1208) (size!38473 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218231 () Bool)

(declare-fun tp_is_empty!30955 () Bool)

(assert (=> b!1218231 (= e!691644 tp_is_empty!30955)))

(declare-fun b!1218232 () Bool)

(declare-fun res!809085 () Bool)

(assert (=> b!1218232 (=> (not res!809085) (not e!691642))))

(declare-datatypes ((List!26848 0))(
  ( (Nil!26845) (Cons!26844 (h!28053 (_ BitVec 64)) (t!40070 List!26848)) )
))
(declare-fun arrayNoDuplicates!0 (array!78606 (_ BitVec 32) List!26848) Bool)

(assert (=> b!1218232 (= res!809085 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26845))))

(declare-fun res!809083 () Bool)

(assert (=> start!101374 (=> (not res!809083) (not e!691642))))

(assert (=> start!101374 (= res!809083 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38474 _keys!1208))))))

(assert (=> start!101374 e!691642))

(assert (=> start!101374 tp_is_empty!30955))

(declare-fun array_inv!28994 (array!78606) Bool)

(assert (=> start!101374 (array_inv!28994 _keys!1208)))

(assert (=> start!101374 true))

(assert (=> start!101374 tp!91781))

(declare-fun e!691643 () Bool)

(declare-fun array_inv!28995 (array!78604) Bool)

(assert (=> start!101374 (and (array_inv!28995 _values!996) e!691643)))

(declare-fun b!1218233 () Bool)

(declare-fun e!691645 () Bool)

(declare-fun e!691648 () Bool)

(assert (=> b!1218233 (= e!691645 (not e!691648))))

(declare-fun res!809094 () Bool)

(assert (=> b!1218233 (=> res!809094 e!691648)))

(assert (=> b!1218233 (= res!809094 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218233 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553653 () Unit!40241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78606 (_ BitVec 64) (_ BitVec 32)) Unit!40241)

(assert (=> b!1218233 (= lt!553653 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218234 () Bool)

(assert (=> b!1218234 (= e!691649 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218235 () Bool)

(declare-fun res!809095 () Bool)

(assert (=> b!1218235 (=> (not res!809095) (not e!691642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78606 (_ BitVec 32)) Bool)

(assert (=> b!1218235 (= res!809095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218236 () Bool)

(declare-fun res!809087 () Bool)

(assert (=> b!1218236 (=> (not res!809087) (not e!691645))))

(assert (=> b!1218236 (= res!809087 (arrayNoDuplicates!0 lt!553655 #b00000000000000000000000000000000 Nil!26845))))

(declare-fun b!1218237 () Bool)

(declare-fun e!691640 () Bool)

(assert (=> b!1218237 (= e!691643 (and e!691640 mapRes!48313))))

(declare-fun condMapEmpty!48313 () Bool)

(declare-fun mapDefault!48313 () ValueCell!14768)

(assert (=> b!1218237 (= condMapEmpty!48313 (= (arr!37935 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14768)) mapDefault!48313)))))

(declare-fun b!1218238 () Bool)

(declare-fun res!809088 () Bool)

(assert (=> b!1218238 (=> (not res!809088) (not e!691642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218238 (= res!809088 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48313 () Bool)

(assert (=> mapIsEmpty!48313 mapRes!48313))

(declare-fun b!1218239 () Bool)

(assert (=> b!1218239 (= e!691640 tp_is_empty!30955)))

(declare-fun b!1218240 () Bool)

(assert (=> b!1218240 (= e!691648 e!691639)))

(declare-fun res!809092 () Bool)

(assert (=> b!1218240 (=> res!809092 e!691639)))

(assert (=> b!1218240 (= res!809092 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553660 () ListLongMap!18037)

(assert (=> b!1218240 (= lt!553660 (getCurrentListMapNoExtraKeys!5473 lt!553655 lt!553658 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553661 () V!46401)

(assert (=> b!1218240 (= lt!553658 (array!78605 (store (arr!37935 _values!996) i!673 (ValueCellFull!14768 lt!553661)) (size!38473 _values!996)))))

(declare-fun dynLambda!3324 (Int (_ BitVec 64)) V!46401)

(assert (=> b!1218240 (= lt!553661 (dynLambda!3324 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553652 () ListLongMap!18037)

(assert (=> b!1218240 (= lt!553652 (getCurrentListMapNoExtraKeys!5473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218241 () Bool)

(assert (=> b!1218241 (= e!691642 e!691645)))

(declare-fun res!809084 () Bool)

(assert (=> b!1218241 (=> (not res!809084) (not e!691645))))

(assert (=> b!1218241 (= res!809084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553655 mask!1564))))

(assert (=> b!1218241 (= lt!553655 (array!78607 (store (arr!37936 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38474 _keys!1208)))))

(declare-fun b!1218242 () Bool)

(assert (=> b!1218242 (= e!691647 true)))

(assert (=> b!1218242 e!691641))

(declare-fun res!809082 () Bool)

(assert (=> b!1218242 (=> (not res!809082) (not e!691641))))

(declare-fun +!4102 (ListLongMap!18037 tuple2!20068) ListLongMap!18037)

(declare-fun get!19349 (ValueCell!14768 V!46401) V!46401)

(assert (=> b!1218242 (= res!809082 (= lt!553660 (+!4102 lt!553654 (tuple2!20069 (select (arr!37936 _keys!1208) from!1455) (get!19349 (select (arr!37935 _values!996) from!1455) lt!553661)))))))

(declare-fun b!1218243 () Bool)

(declare-fun res!809093 () Bool)

(assert (=> b!1218243 (=> (not res!809093) (not e!691642))))

(assert (=> b!1218243 (= res!809093 (= (select (arr!37936 _keys!1208) i!673) k0!934))))

(assert (= (and start!101374 res!809083) b!1218238))

(assert (= (and b!1218238 res!809088) b!1218230))

(assert (= (and b!1218230 res!809089) b!1218235))

(assert (= (and b!1218235 res!809095) b!1218232))

(assert (= (and b!1218232 res!809085) b!1218229))

(assert (= (and b!1218229 res!809081) b!1218226))

(assert (= (and b!1218226 res!809090) b!1218243))

(assert (= (and b!1218243 res!809093) b!1218241))

(assert (= (and b!1218241 res!809084) b!1218236))

(assert (= (and b!1218236 res!809087) b!1218233))

(assert (= (and b!1218233 (not res!809094)) b!1218240))

(assert (= (and b!1218240 (not res!809092)) b!1218228))

(assert (= (and b!1218228 (not res!809086)) b!1218242))

(assert (= (and b!1218242 res!809082) b!1218227))

(assert (= (and b!1218227 (not res!809091)) b!1218234))

(assert (= (and b!1218237 condMapEmpty!48313) mapIsEmpty!48313))

(assert (= (and b!1218237 (not condMapEmpty!48313)) mapNonEmpty!48313))

(get-info :version)

(assert (= (and mapNonEmpty!48313 ((_ is ValueCellFull!14768) mapValue!48313)) b!1218231))

(assert (= (and b!1218237 ((_ is ValueCellFull!14768) mapDefault!48313)) b!1218239))

(assert (= start!101374 b!1218237))

(declare-fun b_lambda!21993 () Bool)

(assert (=> (not b_lambda!21993) (not b!1218240)))

(declare-fun t!40068 () Bool)

(declare-fun tb!11043 () Bool)

(assert (=> (and start!101374 (= defaultEntry!1004 defaultEntry!1004) t!40068) tb!11043))

(declare-fun result!22695 () Bool)

(assert (=> tb!11043 (= result!22695 tp_is_empty!30955)))

(assert (=> b!1218240 t!40068))

(declare-fun b_and!43639 () Bool)

(assert (= b_and!43637 (and (=> t!40068 result!22695) b_and!43639)))

(declare-fun m!1122517 () Bool)

(assert (=> b!1218226 m!1122517))

(declare-fun m!1122519 () Bool)

(assert (=> b!1218234 m!1122519))

(declare-fun m!1122521 () Bool)

(assert (=> b!1218232 m!1122521))

(declare-fun m!1122523 () Bool)

(assert (=> b!1218227 m!1122523))

(declare-fun m!1122525 () Bool)

(assert (=> mapNonEmpty!48313 m!1122525))

(declare-fun m!1122527 () Bool)

(assert (=> b!1218228 m!1122527))

(declare-fun m!1122529 () Bool)

(assert (=> b!1218228 m!1122529))

(declare-fun m!1122531 () Bool)

(assert (=> b!1218228 m!1122531))

(declare-fun m!1122533 () Bool)

(assert (=> b!1218228 m!1122533))

(assert (=> b!1218228 m!1122523))

(declare-fun m!1122535 () Bool)

(assert (=> b!1218228 m!1122535))

(assert (=> b!1218228 m!1122523))

(declare-fun m!1122537 () Bool)

(assert (=> start!101374 m!1122537))

(declare-fun m!1122539 () Bool)

(assert (=> start!101374 m!1122539))

(assert (=> b!1218242 m!1122523))

(declare-fun m!1122541 () Bool)

(assert (=> b!1218242 m!1122541))

(assert (=> b!1218242 m!1122541))

(declare-fun m!1122543 () Bool)

(assert (=> b!1218242 m!1122543))

(declare-fun m!1122545 () Bool)

(assert (=> b!1218242 m!1122545))

(declare-fun m!1122547 () Bool)

(assert (=> b!1218236 m!1122547))

(declare-fun m!1122549 () Bool)

(assert (=> b!1218235 m!1122549))

(declare-fun m!1122551 () Bool)

(assert (=> b!1218233 m!1122551))

(declare-fun m!1122553 () Bool)

(assert (=> b!1218233 m!1122553))

(declare-fun m!1122555 () Bool)

(assert (=> b!1218243 m!1122555))

(declare-fun m!1122557 () Bool)

(assert (=> b!1218241 m!1122557))

(declare-fun m!1122559 () Bool)

(assert (=> b!1218241 m!1122559))

(declare-fun m!1122561 () Bool)

(assert (=> b!1218240 m!1122561))

(declare-fun m!1122563 () Bool)

(assert (=> b!1218240 m!1122563))

(declare-fun m!1122565 () Bool)

(assert (=> b!1218240 m!1122565))

(declare-fun m!1122567 () Bool)

(assert (=> b!1218240 m!1122567))

(declare-fun m!1122569 () Bool)

(assert (=> b!1218238 m!1122569))

(check-sat (not b!1218232) tp_is_empty!30955 (not start!101374) (not b!1218228) (not b_next!26251) (not b!1218238) (not b_lambda!21993) (not b!1218235) (not b!1218233) (not b!1218240) (not b!1218242) (not b!1218241) (not mapNonEmpty!48313) (not b!1218236) b_and!43639 (not b!1218234) (not b!1218226))
(check-sat b_and!43639 (not b_next!26251))
