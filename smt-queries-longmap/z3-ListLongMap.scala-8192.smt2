; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100012 () Bool)

(assert start!100012)

(declare-fun b_free!25597 () Bool)

(declare-fun b_next!25597 () Bool)

(assert (=> start!100012 (= b_free!25597 (not b_next!25597))))

(declare-fun tp!89504 () Bool)

(declare-fun b_and!42039 () Bool)

(assert (=> start!100012 (= tp!89504 b_and!42039)))

(declare-fun b!1191579 () Bool)

(declare-fun res!792624 () Bool)

(declare-fun e!677326 () Bool)

(assert (=> b!1191579 (=> (not res!792624) (not e!677326))))

(declare-datatypes ((array!76974 0))(
  ( (array!76975 (arr!37137 (Array (_ BitVec 32) (_ BitVec 64))) (size!37675 (_ BitVec 32))) )
))
(declare-fun lt!541746 () array!76974)

(declare-datatypes ((List!26256 0))(
  ( (Nil!26253) (Cons!26252 (h!27461 (_ BitVec 64)) (t!38836 List!26256)) )
))
(declare-fun arrayNoDuplicates!0 (array!76974 (_ BitVec 32) List!26256) Bool)

(assert (=> b!1191579 (= res!792624 (arrayNoDuplicates!0 lt!541746 #b00000000000000000000000000000000 Nil!26253))))

(declare-fun b!1191580 () Bool)

(declare-fun res!792617 () Bool)

(declare-fun e!677331 () Bool)

(assert (=> b!1191580 (=> (not res!792617) (not e!677331))))

(declare-fun _keys!1208 () array!76974)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1191580 (= res!792617 (= (select (arr!37137 _keys!1208) i!673) k0!934))))

(declare-fun b!1191581 () Bool)

(declare-fun res!792619 () Bool)

(assert (=> b!1191581 (=> (not res!792619) (not e!677331))))

(assert (=> b!1191581 (= res!792619 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37675 _keys!1208))))))

(declare-fun b!1191582 () Bool)

(declare-fun res!792622 () Bool)

(assert (=> b!1191582 (=> (not res!792622) (not e!677331))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191582 (= res!792622 (validMask!0 mask!1564))))

(declare-fun b!1191583 () Bool)

(declare-fun res!792615 () Bool)

(assert (=> b!1191583 (=> (not res!792615) (not e!677331))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45297 0))(
  ( (V!45298 (val!15120 Int)) )
))
(declare-datatypes ((ValueCell!14354 0))(
  ( (ValueCellFull!14354 (v!17757 V!45297)) (EmptyCell!14354) )
))
(declare-datatypes ((array!76976 0))(
  ( (array!76977 (arr!37138 (Array (_ BitVec 32) ValueCell!14354)) (size!37676 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76976)

(assert (=> b!1191583 (= res!792615 (and (= (size!37676 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37675 _keys!1208) (size!37676 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191584 () Bool)

(declare-fun res!792623 () Bool)

(assert (=> b!1191584 (=> (not res!792623) (not e!677331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191584 (= res!792623 (validKeyInArray!0 k0!934))))

(declare-fun b!1191585 () Bool)

(declare-fun e!677329 () Bool)

(declare-fun e!677327 () Bool)

(declare-fun mapRes!47018 () Bool)

(assert (=> b!1191585 (= e!677329 (and e!677327 mapRes!47018))))

(declare-fun condMapEmpty!47018 () Bool)

(declare-fun mapDefault!47018 () ValueCell!14354)

(assert (=> b!1191585 (= condMapEmpty!47018 (= (arr!37138 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14354)) mapDefault!47018)))))

(declare-fun b!1191586 () Bool)

(declare-fun e!677332 () Bool)

(assert (=> b!1191586 (= e!677326 (not e!677332))))

(declare-fun res!792620 () Bool)

(assert (=> b!1191586 (=> res!792620 e!677332)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191586 (= res!792620 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191586 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39409 0))(
  ( (Unit!39410) )
))
(declare-fun lt!541742 () Unit!39409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76974 (_ BitVec 64) (_ BitVec 32)) Unit!39409)

(assert (=> b!1191586 (= lt!541742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!792618 () Bool)

(assert (=> start!100012 (=> (not res!792618) (not e!677331))))

(assert (=> start!100012 (= res!792618 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37675 _keys!1208))))))

(assert (=> start!100012 e!677331))

(declare-fun tp_is_empty!30127 () Bool)

(assert (=> start!100012 tp_is_empty!30127))

(declare-fun array_inv!28444 (array!76974) Bool)

(assert (=> start!100012 (array_inv!28444 _keys!1208)))

(assert (=> start!100012 true))

(assert (=> start!100012 tp!89504))

(declare-fun array_inv!28445 (array!76976) Bool)

(assert (=> start!100012 (and (array_inv!28445 _values!996) e!677329)))

(declare-fun b!1191587 () Bool)

(assert (=> b!1191587 (= e!677327 tp_is_empty!30127)))

(declare-fun b!1191588 () Bool)

(declare-fun e!677325 () Bool)

(assert (=> b!1191588 (= e!677325 true)))

(declare-fun zeroValue!944 () V!45297)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45297)

(declare-fun lt!541741 () array!76976)

(declare-datatypes ((tuple2!19544 0))(
  ( (tuple2!19545 (_1!9783 (_ BitVec 64)) (_2!9783 V!45297)) )
))
(declare-datatypes ((List!26257 0))(
  ( (Nil!26254) (Cons!26253 (h!27462 tuple2!19544) (t!38837 List!26257)) )
))
(declare-datatypes ((ListLongMap!17513 0))(
  ( (ListLongMap!17514 (toList!8772 List!26257)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5222 (array!76974 array!76976 (_ BitVec 32) (_ BitVec 32) V!45297 V!45297 (_ BitVec 32) Int) ListLongMap!17513)

(declare-fun -!1715 (ListLongMap!17513 (_ BitVec 64)) ListLongMap!17513)

(assert (=> b!1191588 (= (getCurrentListMapNoExtraKeys!5222 lt!541746 lt!541741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1715 (getCurrentListMapNoExtraKeys!5222 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541744 () Unit!39409)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!965 (array!76974 array!76976 (_ BitVec 32) (_ BitVec 32) V!45297 V!45297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39409)

(assert (=> b!1191588 (= lt!541744 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!965 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191589 () Bool)

(assert (=> b!1191589 (= e!677332 e!677325)))

(declare-fun res!792621 () Bool)

(assert (=> b!1191589 (=> res!792621 e!677325)))

(assert (=> b!1191589 (= res!792621 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541745 () ListLongMap!17513)

(assert (=> b!1191589 (= lt!541745 (getCurrentListMapNoExtraKeys!5222 lt!541746 lt!541741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3110 (Int (_ BitVec 64)) V!45297)

(assert (=> b!1191589 (= lt!541741 (array!76977 (store (arr!37138 _values!996) i!673 (ValueCellFull!14354 (dynLambda!3110 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37676 _values!996)))))

(declare-fun lt!541743 () ListLongMap!17513)

(assert (=> b!1191589 (= lt!541743 (getCurrentListMapNoExtraKeys!5222 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191590 () Bool)

(declare-fun e!677330 () Bool)

(assert (=> b!1191590 (= e!677330 tp_is_empty!30127)))

(declare-fun b!1191591 () Bool)

(declare-fun res!792614 () Bool)

(assert (=> b!1191591 (=> (not res!792614) (not e!677331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76974 (_ BitVec 32)) Bool)

(assert (=> b!1191591 (= res!792614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191592 () Bool)

(assert (=> b!1191592 (= e!677331 e!677326)))

(declare-fun res!792616 () Bool)

(assert (=> b!1191592 (=> (not res!792616) (not e!677326))))

(assert (=> b!1191592 (= res!792616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541746 mask!1564))))

(assert (=> b!1191592 (= lt!541746 (array!76975 (store (arr!37137 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37675 _keys!1208)))))

(declare-fun mapNonEmpty!47018 () Bool)

(declare-fun tp!89505 () Bool)

(assert (=> mapNonEmpty!47018 (= mapRes!47018 (and tp!89505 e!677330))))

(declare-fun mapValue!47018 () ValueCell!14354)

(declare-fun mapRest!47018 () (Array (_ BitVec 32) ValueCell!14354))

(declare-fun mapKey!47018 () (_ BitVec 32))

(assert (=> mapNonEmpty!47018 (= (arr!37138 _values!996) (store mapRest!47018 mapKey!47018 mapValue!47018))))

(declare-fun b!1191593 () Bool)

(declare-fun res!792625 () Bool)

(assert (=> b!1191593 (=> (not res!792625) (not e!677331))))

(assert (=> b!1191593 (= res!792625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26253))))

(declare-fun mapIsEmpty!47018 () Bool)

(assert (=> mapIsEmpty!47018 mapRes!47018))

(assert (= (and start!100012 res!792618) b!1191582))

(assert (= (and b!1191582 res!792622) b!1191583))

(assert (= (and b!1191583 res!792615) b!1191591))

(assert (= (and b!1191591 res!792614) b!1191593))

(assert (= (and b!1191593 res!792625) b!1191581))

(assert (= (and b!1191581 res!792619) b!1191584))

(assert (= (and b!1191584 res!792623) b!1191580))

(assert (= (and b!1191580 res!792617) b!1191592))

(assert (= (and b!1191592 res!792616) b!1191579))

(assert (= (and b!1191579 res!792624) b!1191586))

(assert (= (and b!1191586 (not res!792620)) b!1191589))

(assert (= (and b!1191589 (not res!792621)) b!1191588))

(assert (= (and b!1191585 condMapEmpty!47018) mapIsEmpty!47018))

(assert (= (and b!1191585 (not condMapEmpty!47018)) mapNonEmpty!47018))

(get-info :version)

(assert (= (and mapNonEmpty!47018 ((_ is ValueCellFull!14354) mapValue!47018)) b!1191590))

(assert (= (and b!1191585 ((_ is ValueCellFull!14354) mapDefault!47018)) b!1191587))

(assert (= start!100012 b!1191585))

(declare-fun b_lambda!20723 () Bool)

(assert (=> (not b_lambda!20723) (not b!1191589)))

(declare-fun t!38835 () Bool)

(declare-fun tb!10401 () Bool)

(assert (=> (and start!100012 (= defaultEntry!1004 defaultEntry!1004) t!38835) tb!10401))

(declare-fun result!21377 () Bool)

(assert (=> tb!10401 (= result!21377 tp_is_empty!30127)))

(assert (=> b!1191589 t!38835))

(declare-fun b_and!42041 () Bool)

(assert (= b_and!42039 (and (=> t!38835 result!21377) b_and!42041)))

(declare-fun m!1099529 () Bool)

(assert (=> b!1191582 m!1099529))

(declare-fun m!1099531 () Bool)

(assert (=> b!1191586 m!1099531))

(declare-fun m!1099533 () Bool)

(assert (=> b!1191586 m!1099533))

(declare-fun m!1099535 () Bool)

(assert (=> b!1191589 m!1099535))

(declare-fun m!1099537 () Bool)

(assert (=> b!1191589 m!1099537))

(declare-fun m!1099539 () Bool)

(assert (=> b!1191589 m!1099539))

(declare-fun m!1099541 () Bool)

(assert (=> b!1191589 m!1099541))

(declare-fun m!1099543 () Bool)

(assert (=> b!1191588 m!1099543))

(declare-fun m!1099545 () Bool)

(assert (=> b!1191588 m!1099545))

(assert (=> b!1191588 m!1099545))

(declare-fun m!1099547 () Bool)

(assert (=> b!1191588 m!1099547))

(declare-fun m!1099549 () Bool)

(assert (=> b!1191588 m!1099549))

(declare-fun m!1099551 () Bool)

(assert (=> mapNonEmpty!47018 m!1099551))

(declare-fun m!1099553 () Bool)

(assert (=> b!1191579 m!1099553))

(declare-fun m!1099555 () Bool)

(assert (=> start!100012 m!1099555))

(declare-fun m!1099557 () Bool)

(assert (=> start!100012 m!1099557))

(declare-fun m!1099559 () Bool)

(assert (=> b!1191591 m!1099559))

(declare-fun m!1099561 () Bool)

(assert (=> b!1191584 m!1099561))

(declare-fun m!1099563 () Bool)

(assert (=> b!1191580 m!1099563))

(declare-fun m!1099565 () Bool)

(assert (=> b!1191593 m!1099565))

(declare-fun m!1099567 () Bool)

(assert (=> b!1191592 m!1099567))

(declare-fun m!1099569 () Bool)

(assert (=> b!1191592 m!1099569))

(check-sat b_and!42041 (not b!1191582) (not b!1191586) (not b_next!25597) (not start!100012) (not b_lambda!20723) tp_is_empty!30127 (not b!1191588) (not b!1191584) (not b!1191592) (not b!1191579) (not b!1191593) (not mapNonEmpty!47018) (not b!1191589) (not b!1191591))
(check-sat b_and!42041 (not b_next!25597))
