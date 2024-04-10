; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100522 () Bool)

(assert start!100522)

(declare-fun b_free!25845 () Bool)

(declare-fun b_next!25845 () Bool)

(assert (=> start!100522 (= b_free!25845 (not b_next!25845))))

(declare-fun tp!90524 () Bool)

(declare-fun b_and!42577 () Bool)

(assert (=> start!100522 (= tp!90524 b_and!42577)))

(declare-fun b!1201165 () Bool)

(declare-fun res!799619 () Bool)

(declare-fun e!682109 () Bool)

(assert (=> b!1201165 (=> (not res!799619) (not e!682109))))

(declare-datatypes ((array!77871 0))(
  ( (array!77872 (arr!37580 (Array (_ BitVec 32) (_ BitVec 64))) (size!38116 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77871)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201165 (= res!799619 (= (select (arr!37580 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47666 () Bool)

(declare-fun mapRes!47666 () Bool)

(declare-fun tp!90525 () Bool)

(declare-fun e!682114 () Bool)

(assert (=> mapNonEmpty!47666 (= mapRes!47666 (and tp!90525 e!682114))))

(declare-datatypes ((V!45859 0))(
  ( (V!45860 (val!15331 Int)) )
))
(declare-datatypes ((ValueCell!14565 0))(
  ( (ValueCellFull!14565 (v!17969 V!45859)) (EmptyCell!14565) )
))
(declare-fun mapRest!47666 () (Array (_ BitVec 32) ValueCell!14565))

(declare-fun mapKey!47666 () (_ BitVec 32))

(declare-fun mapValue!47666 () ValueCell!14565)

(declare-datatypes ((array!77873 0))(
  ( (array!77874 (arr!37581 (Array (_ BitVec 32) ValueCell!14565)) (size!38117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77873)

(assert (=> mapNonEmpty!47666 (= (arr!37581 _values!996) (store mapRest!47666 mapKey!47666 mapValue!47666))))

(declare-fun res!799613 () Bool)

(assert (=> start!100522 (=> (not res!799613) (not e!682109))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100522 (= res!799613 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38116 _keys!1208))))))

(assert (=> start!100522 e!682109))

(declare-fun tp_is_empty!30549 () Bool)

(assert (=> start!100522 tp_is_empty!30549))

(declare-fun array_inv!28640 (array!77871) Bool)

(assert (=> start!100522 (array_inv!28640 _keys!1208)))

(assert (=> start!100522 true))

(assert (=> start!100522 tp!90524))

(declare-fun e!682111 () Bool)

(declare-fun array_inv!28641 (array!77873) Bool)

(assert (=> start!100522 (and (array_inv!28641 _values!996) e!682111)))

(declare-fun b!1201166 () Bool)

(declare-fun e!682110 () Bool)

(declare-datatypes ((tuple2!19634 0))(
  ( (tuple2!19635 (_1!9828 (_ BitVec 64)) (_2!9828 V!45859)) )
))
(declare-datatypes ((List!26452 0))(
  ( (Nil!26449) (Cons!26448 (h!27657 tuple2!19634) (t!39277 List!26452)) )
))
(declare-datatypes ((ListLongMap!17603 0))(
  ( (ListLongMap!17604 (toList!8817 List!26452)) )
))
(declare-fun call!57365 () ListLongMap!17603)

(declare-fun call!57364 () ListLongMap!17603)

(assert (=> b!1201166 (= e!682110 (= call!57365 call!57364))))

(declare-fun b!1201167 () Bool)

(declare-fun e!682113 () Bool)

(declare-fun e!682117 () Bool)

(assert (=> b!1201167 (= e!682113 (not e!682117))))

(declare-fun res!799614 () Bool)

(assert (=> b!1201167 (=> res!799614 e!682117)))

(assert (=> b!1201167 (= res!799614 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201167 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39822 0))(
  ( (Unit!39823) )
))
(declare-fun lt!544317 () Unit!39822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77871 (_ BitVec 64) (_ BitVec 32)) Unit!39822)

(assert (=> b!1201167 (= lt!544317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201168 () Bool)

(declare-fun -!1790 (ListLongMap!17603 (_ BitVec 64)) ListLongMap!17603)

(assert (=> b!1201168 (= e!682110 (= call!57365 (-!1790 call!57364 k0!934)))))

(declare-fun b!1201169 () Bool)

(declare-fun res!799618 () Bool)

(assert (=> b!1201169 (=> (not res!799618) (not e!682113))))

(declare-fun lt!544321 () array!77871)

(declare-datatypes ((List!26453 0))(
  ( (Nil!26450) (Cons!26449 (h!27658 (_ BitVec 64)) (t!39278 List!26453)) )
))
(declare-fun arrayNoDuplicates!0 (array!77871 (_ BitVec 32) List!26453) Bool)

(assert (=> b!1201169 (= res!799618 (arrayNoDuplicates!0 lt!544321 #b00000000000000000000000000000000 Nil!26450))))

(declare-fun b!1201170 () Bool)

(declare-fun e!682115 () Bool)

(assert (=> b!1201170 (= e!682115 true)))

(declare-fun zeroValue!944 () V!45859)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45859)

(declare-fun lt!544316 () Bool)

(declare-fun contains!6875 (ListLongMap!17603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!5256 (array!77871 array!77873 (_ BitVec 32) (_ BitVec 32) V!45859 V!45859 (_ BitVec 32) Int) ListLongMap!17603)

(assert (=> b!1201170 (= lt!544316 (contains!6875 (getCurrentListMapNoExtraKeys!5256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1201171 () Bool)

(declare-fun res!799622 () Bool)

(assert (=> b!1201171 (=> (not res!799622) (not e!682109))))

(assert (=> b!1201171 (= res!799622 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38116 _keys!1208))))))

(declare-fun b!1201172 () Bool)

(declare-fun res!799620 () Bool)

(assert (=> b!1201172 (=> (not res!799620) (not e!682109))))

(assert (=> b!1201172 (= res!799620 (and (= (size!38117 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38116 _keys!1208) (size!38117 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201173 () Bool)

(declare-fun e!682116 () Bool)

(assert (=> b!1201173 (= e!682117 e!682116)))

(declare-fun res!799616 () Bool)

(assert (=> b!1201173 (=> res!799616 e!682116)))

(assert (=> b!1201173 (= res!799616 (not (= from!1455 i!673)))))

(declare-fun lt!544319 () array!77873)

(declare-fun lt!544318 () ListLongMap!17603)

(assert (=> b!1201173 (= lt!544318 (getCurrentListMapNoExtraKeys!5256 lt!544321 lt!544319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3173 (Int (_ BitVec 64)) V!45859)

(assert (=> b!1201173 (= lt!544319 (array!77874 (store (arr!37581 _values!996) i!673 (ValueCellFull!14565 (dynLambda!3173 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38117 _values!996)))))

(declare-fun lt!544320 () ListLongMap!17603)

(assert (=> b!1201173 (= lt!544320 (getCurrentListMapNoExtraKeys!5256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201174 () Bool)

(declare-fun res!799611 () Bool)

(assert (=> b!1201174 (=> (not res!799611) (not e!682109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201174 (= res!799611 (validKeyInArray!0 k0!934))))

(declare-fun b!1201175 () Bool)

(declare-fun res!799615 () Bool)

(assert (=> b!1201175 (=> (not res!799615) (not e!682109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77871 (_ BitVec 32)) Bool)

(assert (=> b!1201175 (= res!799615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47666 () Bool)

(assert (=> mapIsEmpty!47666 mapRes!47666))

(declare-fun b!1201176 () Bool)

(declare-fun e!682112 () Bool)

(assert (=> b!1201176 (= e!682112 tp_is_empty!30549)))

(declare-fun bm!57361 () Bool)

(assert (=> bm!57361 (= call!57365 (getCurrentListMapNoExtraKeys!5256 lt!544321 lt!544319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201177 () Bool)

(assert (=> b!1201177 (= e!682111 (and e!682112 mapRes!47666))))

(declare-fun condMapEmpty!47666 () Bool)

(declare-fun mapDefault!47666 () ValueCell!14565)

(assert (=> b!1201177 (= condMapEmpty!47666 (= (arr!37581 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14565)) mapDefault!47666)))))

(declare-fun bm!57362 () Bool)

(assert (=> bm!57362 (= call!57364 (getCurrentListMapNoExtraKeys!5256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201178 () Bool)

(assert (=> b!1201178 (= e!682114 tp_is_empty!30549)))

(declare-fun b!1201179 () Bool)

(declare-fun res!799617 () Bool)

(assert (=> b!1201179 (=> (not res!799617) (not e!682109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201179 (= res!799617 (validMask!0 mask!1564))))

(declare-fun b!1201180 () Bool)

(assert (=> b!1201180 (= e!682109 e!682113)))

(declare-fun res!799612 () Bool)

(assert (=> b!1201180 (=> (not res!799612) (not e!682113))))

(assert (=> b!1201180 (= res!799612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544321 mask!1564))))

(assert (=> b!1201180 (= lt!544321 (array!77872 (store (arr!37580 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38116 _keys!1208)))))

(declare-fun b!1201181 () Bool)

(assert (=> b!1201181 (= e!682116 e!682115)))

(declare-fun res!799623 () Bool)

(assert (=> b!1201181 (=> res!799623 e!682115)))

(assert (=> b!1201181 (= res!799623 (not (= (select (arr!37580 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201181 e!682110))

(declare-fun c!117479 () Bool)

(assert (=> b!1201181 (= c!117479 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544315 () Unit!39822)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!996 (array!77871 array!77873 (_ BitVec 32) (_ BitVec 32) V!45859 V!45859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39822)

(assert (=> b!1201181 (= lt!544315 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!996 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201182 () Bool)

(declare-fun res!799621 () Bool)

(assert (=> b!1201182 (=> (not res!799621) (not e!682109))))

(assert (=> b!1201182 (= res!799621 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26450))))

(assert (= (and start!100522 res!799613) b!1201179))

(assert (= (and b!1201179 res!799617) b!1201172))

(assert (= (and b!1201172 res!799620) b!1201175))

(assert (= (and b!1201175 res!799615) b!1201182))

(assert (= (and b!1201182 res!799621) b!1201171))

(assert (= (and b!1201171 res!799622) b!1201174))

(assert (= (and b!1201174 res!799611) b!1201165))

(assert (= (and b!1201165 res!799619) b!1201180))

(assert (= (and b!1201180 res!799612) b!1201169))

(assert (= (and b!1201169 res!799618) b!1201167))

(assert (= (and b!1201167 (not res!799614)) b!1201173))

(assert (= (and b!1201173 (not res!799616)) b!1201181))

(assert (= (and b!1201181 c!117479) b!1201168))

(assert (= (and b!1201181 (not c!117479)) b!1201166))

(assert (= (or b!1201168 b!1201166) bm!57361))

(assert (= (or b!1201168 b!1201166) bm!57362))

(assert (= (and b!1201181 (not res!799623)) b!1201170))

(assert (= (and b!1201177 condMapEmpty!47666) mapIsEmpty!47666))

(assert (= (and b!1201177 (not condMapEmpty!47666)) mapNonEmpty!47666))

(get-info :version)

(assert (= (and mapNonEmpty!47666 ((_ is ValueCellFull!14565) mapValue!47666)) b!1201178))

(assert (= (and b!1201177 ((_ is ValueCellFull!14565) mapDefault!47666)) b!1201176))

(assert (= start!100522 b!1201177))

(declare-fun b_lambda!21041 () Bool)

(assert (=> (not b_lambda!21041) (not b!1201173)))

(declare-fun t!39276 () Bool)

(declare-fun tb!10645 () Bool)

(assert (=> (and start!100522 (= defaultEntry!1004 defaultEntry!1004) t!39276) tb!10645))

(declare-fun result!21867 () Bool)

(assert (=> tb!10645 (= result!21867 tp_is_empty!30549)))

(assert (=> b!1201173 t!39276))

(declare-fun b_and!42579 () Bool)

(assert (= b_and!42577 (and (=> t!39276 result!21867) b_and!42579)))

(declare-fun m!1107339 () Bool)

(assert (=> b!1201182 m!1107339))

(declare-fun m!1107341 () Bool)

(assert (=> bm!57362 m!1107341))

(declare-fun m!1107343 () Bool)

(assert (=> b!1201165 m!1107343))

(declare-fun m!1107345 () Bool)

(assert (=> b!1201174 m!1107345))

(declare-fun m!1107347 () Bool)

(assert (=> b!1201181 m!1107347))

(declare-fun m!1107349 () Bool)

(assert (=> b!1201181 m!1107349))

(declare-fun m!1107351 () Bool)

(assert (=> bm!57361 m!1107351))

(declare-fun m!1107353 () Bool)

(assert (=> mapNonEmpty!47666 m!1107353))

(declare-fun m!1107355 () Bool)

(assert (=> b!1201173 m!1107355))

(declare-fun m!1107357 () Bool)

(assert (=> b!1201173 m!1107357))

(declare-fun m!1107359 () Bool)

(assert (=> b!1201173 m!1107359))

(declare-fun m!1107361 () Bool)

(assert (=> b!1201173 m!1107361))

(declare-fun m!1107363 () Bool)

(assert (=> b!1201169 m!1107363))

(declare-fun m!1107365 () Bool)

(assert (=> start!100522 m!1107365))

(declare-fun m!1107367 () Bool)

(assert (=> start!100522 m!1107367))

(declare-fun m!1107369 () Bool)

(assert (=> b!1201179 m!1107369))

(declare-fun m!1107371 () Bool)

(assert (=> b!1201168 m!1107371))

(declare-fun m!1107373 () Bool)

(assert (=> b!1201180 m!1107373))

(declare-fun m!1107375 () Bool)

(assert (=> b!1201180 m!1107375))

(declare-fun m!1107377 () Bool)

(assert (=> b!1201175 m!1107377))

(assert (=> b!1201170 m!1107341))

(assert (=> b!1201170 m!1107341))

(declare-fun m!1107379 () Bool)

(assert (=> b!1201170 m!1107379))

(declare-fun m!1107381 () Bool)

(assert (=> b!1201167 m!1107381))

(declare-fun m!1107383 () Bool)

(assert (=> b!1201167 m!1107383))

(check-sat (not b_lambda!21041) (not b!1201170) (not start!100522) (not b!1201173) (not b!1201168) (not b!1201179) (not b!1201174) (not bm!57362) (not b_next!25845) (not mapNonEmpty!47666) b_and!42579 (not b!1201175) (not bm!57361) (not b!1201180) (not b!1201169) tp_is_empty!30549 (not b!1201167) (not b!1201181) (not b!1201182))
(check-sat b_and!42579 (not b_next!25845))
