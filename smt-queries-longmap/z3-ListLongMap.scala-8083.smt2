; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99600 () Bool)

(assert start!99600)

(declare-fun b_free!24943 () Bool)

(declare-fun b_next!24943 () Bool)

(assert (=> start!99600 (= b_free!24943 (not b_next!24943))))

(declare-fun tp!87542 () Bool)

(declare-fun b_and!40755 () Bool)

(assert (=> start!99600 (= tp!87542 b_and!40755)))

(declare-fun b!1173416 () Bool)

(declare-fun res!778702 () Bool)

(declare-fun e!667060 () Bool)

(assert (=> b!1173416 (=> (not res!778702) (not e!667060))))

(declare-datatypes ((array!75815 0))(
  ( (array!75816 (arr!36551 (Array (_ BitVec 32) (_ BitVec 64))) (size!37088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75815)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1173416 (= res!778702 (= (select (arr!36551 _keys!1208) i!673) k0!934))))

(declare-fun b!1173417 () Bool)

(declare-fun e!667064 () Bool)

(declare-fun e!667067 () Bool)

(assert (=> b!1173417 (= e!667064 (not e!667067))))

(declare-fun res!778686 () Bool)

(assert (=> b!1173417 (=> res!778686 e!667067)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173417 (= res!778686 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173417 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38633 0))(
  ( (Unit!38634) )
))
(declare-fun lt!528589 () Unit!38633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75815 (_ BitVec 64) (_ BitVec 32)) Unit!38633)

(assert (=> b!1173417 (= lt!528589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173418 () Bool)

(declare-fun e!667062 () Bool)

(assert (=> b!1173418 (= e!667067 e!667062)))

(declare-fun res!778689 () Bool)

(assert (=> b!1173418 (=> res!778689 e!667062)))

(assert (=> b!1173418 (= res!778689 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44425 0))(
  ( (V!44426 (val!14793 Int)) )
))
(declare-fun zeroValue!944 () V!44425)

(declare-datatypes ((ValueCell!14027 0))(
  ( (ValueCellFull!14027 (v!17427 V!44425)) (EmptyCell!14027) )
))
(declare-datatypes ((array!75817 0))(
  ( (array!75818 (arr!36552 (Array (_ BitVec 32) ValueCell!14027)) (size!37089 (_ BitVec 32))) )
))
(declare-fun lt!528580 () array!75817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528583 () array!75815)

(declare-fun minValue!944 () V!44425)

(declare-datatypes ((tuple2!18934 0))(
  ( (tuple2!18935 (_1!9478 (_ BitVec 64)) (_2!9478 V!44425)) )
))
(declare-datatypes ((List!25670 0))(
  ( (Nil!25667) (Cons!25666 (h!26884 tuple2!18934) (t!37597 List!25670)) )
))
(declare-datatypes ((ListLongMap!16911 0))(
  ( (ListLongMap!16912 (toList!8471 List!25670)) )
))
(declare-fun lt!528591 () ListLongMap!16911)

(declare-fun getCurrentListMapNoExtraKeys!4958 (array!75815 array!75817 (_ BitVec 32) (_ BitVec 32) V!44425 V!44425 (_ BitVec 32) Int) ListLongMap!16911)

(assert (=> b!1173418 (= lt!528591 (getCurrentListMapNoExtraKeys!4958 lt!528583 lt!528580 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528582 () V!44425)

(declare-fun _values!996 () array!75817)

(assert (=> b!1173418 (= lt!528580 (array!75818 (store (arr!36552 _values!996) i!673 (ValueCellFull!14027 lt!528582)) (size!37089 _values!996)))))

(declare-fun dynLambda!2937 (Int (_ BitVec 64)) V!44425)

(assert (=> b!1173418 (= lt!528582 (dynLambda!2937 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528588 () ListLongMap!16911)

(assert (=> b!1173418 (= lt!528588 (getCurrentListMapNoExtraKeys!4958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173419 () Bool)

(declare-fun e!667069 () Bool)

(assert (=> b!1173419 (= e!667069 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173420 () Bool)

(declare-fun e!667063 () Bool)

(assert (=> b!1173420 (= e!667063 e!667069)))

(declare-fun res!778687 () Bool)

(assert (=> b!1173420 (=> res!778687 e!667069)))

(assert (=> b!1173420 (= res!778687 (not (= (select (arr!36551 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173421 () Bool)

(declare-fun res!778692 () Bool)

(assert (=> b!1173421 (=> (not res!778692) (not e!667060))))

(declare-datatypes ((List!25671 0))(
  ( (Nil!25668) (Cons!25667 (h!26885 (_ BitVec 64)) (t!37598 List!25671)) )
))
(declare-fun arrayNoDuplicates!0 (array!75815 (_ BitVec 32) List!25671) Bool)

(assert (=> b!1173421 (= res!778692 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25668))))

(declare-fun b!1173422 () Bool)

(declare-fun res!778685 () Bool)

(assert (=> b!1173422 (=> (not res!778685) (not e!667064))))

(assert (=> b!1173422 (= res!778685 (arrayNoDuplicates!0 lt!528583 #b00000000000000000000000000000000 Nil!25668))))

(declare-fun b!1173423 () Bool)

(declare-fun res!778697 () Bool)

(declare-fun e!667061 () Bool)

(assert (=> b!1173423 (=> res!778697 e!667061)))

(declare-fun noDuplicate!1635 (List!25671) Bool)

(assert (=> b!1173423 (= res!778697 (not (noDuplicate!1635 Nil!25668)))))

(declare-fun b!1173424 () Bool)

(declare-fun e!667058 () Bool)

(declare-fun tp_is_empty!29473 () Bool)

(assert (=> b!1173424 (= e!667058 tp_is_empty!29473)))

(declare-fun b!1173425 () Bool)

(declare-fun e!667065 () Bool)

(assert (=> b!1173425 (= e!667062 e!667065)))

(declare-fun res!778693 () Bool)

(assert (=> b!1173425 (=> res!778693 e!667065)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173425 (= res!778693 (not (validKeyInArray!0 (select (arr!36551 _keys!1208) from!1455))))))

(declare-fun lt!528586 () ListLongMap!16911)

(declare-fun lt!528590 () ListLongMap!16911)

(assert (=> b!1173425 (= lt!528586 lt!528590)))

(declare-fun lt!528581 () ListLongMap!16911)

(declare-fun -!1523 (ListLongMap!16911 (_ BitVec 64)) ListLongMap!16911)

(assert (=> b!1173425 (= lt!528590 (-!1523 lt!528581 k0!934))))

(assert (=> b!1173425 (= lt!528586 (getCurrentListMapNoExtraKeys!4958 lt!528583 lt!528580 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173425 (= lt!528581 (getCurrentListMapNoExtraKeys!4958 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528592 () Unit!38633)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!748 (array!75815 array!75817 (_ BitVec 32) (_ BitVec 32) V!44425 V!44425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38633)

(assert (=> b!1173425 (= lt!528592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!748 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173426 () Bool)

(declare-fun res!778698 () Bool)

(assert (=> b!1173426 (=> res!778698 e!667061)))

(declare-fun contains!6887 (List!25671 (_ BitVec 64)) Bool)

(assert (=> b!1173426 (= res!778698 (contains!6887 Nil!25668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173427 () Bool)

(declare-fun res!778696 () Bool)

(assert (=> b!1173427 (=> (not res!778696) (not e!667060))))

(assert (=> b!1173427 (= res!778696 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37088 _keys!1208))))))

(declare-fun b!1173428 () Bool)

(declare-fun res!778703 () Bool)

(assert (=> b!1173428 (=> (not res!778703) (not e!667060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173428 (= res!778703 (validMask!0 mask!1564))))

(declare-fun res!778701 () Bool)

(assert (=> start!99600 (=> (not res!778701) (not e!667060))))

(assert (=> start!99600 (= res!778701 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37088 _keys!1208))))))

(assert (=> start!99600 e!667060))

(assert (=> start!99600 tp_is_empty!29473))

(declare-fun array_inv!28004 (array!75815) Bool)

(assert (=> start!99600 (array_inv!28004 _keys!1208)))

(assert (=> start!99600 true))

(assert (=> start!99600 tp!87542))

(declare-fun e!667066 () Bool)

(declare-fun array_inv!28005 (array!75817) Bool)

(assert (=> start!99600 (and (array_inv!28005 _values!996) e!667066)))

(declare-fun b!1173429 () Bool)

(declare-fun e!667070 () Bool)

(assert (=> b!1173429 (= e!667070 tp_is_empty!29473)))

(declare-fun b!1173430 () Bool)

(assert (=> b!1173430 (= e!667061 true)))

(declare-fun lt!528584 () Bool)

(assert (=> b!1173430 (= lt!528584 (contains!6887 Nil!25668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173431 () Bool)

(assert (=> b!1173431 (= e!667060 e!667064)))

(declare-fun res!778700 () Bool)

(assert (=> b!1173431 (=> (not res!778700) (not e!667064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75815 (_ BitVec 32)) Bool)

(assert (=> b!1173431 (= res!778700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528583 mask!1564))))

(assert (=> b!1173431 (= lt!528583 (array!75816 (store (arr!36551 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37088 _keys!1208)))))

(declare-fun b!1173432 () Bool)

(declare-fun res!778691 () Bool)

(assert (=> b!1173432 (=> (not res!778691) (not e!667060))))

(assert (=> b!1173432 (= res!778691 (and (= (size!37089 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37088 _keys!1208) (size!37089 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46037 () Bool)

(declare-fun mapRes!46037 () Bool)

(declare-fun tp!87543 () Bool)

(assert (=> mapNonEmpty!46037 (= mapRes!46037 (and tp!87543 e!667058))))

(declare-fun mapRest!46037 () (Array (_ BitVec 32) ValueCell!14027))

(declare-fun mapKey!46037 () (_ BitVec 32))

(declare-fun mapValue!46037 () ValueCell!14027)

(assert (=> mapNonEmpty!46037 (= (arr!36552 _values!996) (store mapRest!46037 mapKey!46037 mapValue!46037))))

(declare-fun b!1173433 () Bool)

(declare-fun e!667068 () Bool)

(assert (=> b!1173433 (= e!667068 e!667061)))

(declare-fun res!778690 () Bool)

(assert (=> b!1173433 (=> res!778690 e!667061)))

(assert (=> b!1173433 (= res!778690 (or (bvsge (size!37088 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37088 _keys!1208)) (bvsge from!1455 (size!37088 _keys!1208))))))

(assert (=> b!1173433 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25668)))

(declare-fun lt!528585 () Unit!38633)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75815 (_ BitVec 32) (_ BitVec 32)) Unit!38633)

(assert (=> b!1173433 (= lt!528585 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173433 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528587 () Unit!38633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75815 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38633)

(assert (=> b!1173433 (= lt!528587 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1173434 () Bool)

(declare-fun res!778694 () Bool)

(assert (=> b!1173434 (=> (not res!778694) (not e!667060))))

(assert (=> b!1173434 (= res!778694 (validKeyInArray!0 k0!934))))

(declare-fun b!1173435 () Bool)

(assert (=> b!1173435 (= e!667065 e!667068)))

(declare-fun res!778699 () Bool)

(assert (=> b!1173435 (=> res!778699 e!667068)))

(assert (=> b!1173435 (= res!778699 (not (= (select (arr!36551 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1173435 e!667063))

(declare-fun res!778688 () Bool)

(assert (=> b!1173435 (=> (not res!778688) (not e!667063))))

(declare-fun +!3806 (ListLongMap!16911 tuple2!18934) ListLongMap!16911)

(declare-fun get!18672 (ValueCell!14027 V!44425) V!44425)

(assert (=> b!1173435 (= res!778688 (= lt!528591 (+!3806 lt!528590 (tuple2!18935 (select (arr!36551 _keys!1208) from!1455) (get!18672 (select (arr!36552 _values!996) from!1455) lt!528582)))))))

(declare-fun b!1173436 () Bool)

(declare-fun res!778695 () Bool)

(assert (=> b!1173436 (=> (not res!778695) (not e!667060))))

(assert (=> b!1173436 (= res!778695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173437 () Bool)

(assert (=> b!1173437 (= e!667066 (and e!667070 mapRes!46037))))

(declare-fun condMapEmpty!46037 () Bool)

(declare-fun mapDefault!46037 () ValueCell!14027)

(assert (=> b!1173437 (= condMapEmpty!46037 (= (arr!36552 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14027)) mapDefault!46037)))))

(declare-fun mapIsEmpty!46037 () Bool)

(assert (=> mapIsEmpty!46037 mapRes!46037))

(assert (= (and start!99600 res!778701) b!1173428))

(assert (= (and b!1173428 res!778703) b!1173432))

(assert (= (and b!1173432 res!778691) b!1173436))

(assert (= (and b!1173436 res!778695) b!1173421))

(assert (= (and b!1173421 res!778692) b!1173427))

(assert (= (and b!1173427 res!778696) b!1173434))

(assert (= (and b!1173434 res!778694) b!1173416))

(assert (= (and b!1173416 res!778702) b!1173431))

(assert (= (and b!1173431 res!778700) b!1173422))

(assert (= (and b!1173422 res!778685) b!1173417))

(assert (= (and b!1173417 (not res!778686)) b!1173418))

(assert (= (and b!1173418 (not res!778689)) b!1173425))

(assert (= (and b!1173425 (not res!778693)) b!1173435))

(assert (= (and b!1173435 res!778688) b!1173420))

(assert (= (and b!1173420 (not res!778687)) b!1173419))

(assert (= (and b!1173435 (not res!778699)) b!1173433))

(assert (= (and b!1173433 (not res!778690)) b!1173423))

(assert (= (and b!1173423 (not res!778697)) b!1173426))

(assert (= (and b!1173426 (not res!778698)) b!1173430))

(assert (= (and b!1173437 condMapEmpty!46037) mapIsEmpty!46037))

(assert (= (and b!1173437 (not condMapEmpty!46037)) mapNonEmpty!46037))

(get-info :version)

(assert (= (and mapNonEmpty!46037 ((_ is ValueCellFull!14027) mapValue!46037)) b!1173424))

(assert (= (and b!1173437 ((_ is ValueCellFull!14027) mapDefault!46037)) b!1173429))

(assert (= start!99600 b!1173437))

(declare-fun b_lambda!20081 () Bool)

(assert (=> (not b_lambda!20081) (not b!1173418)))

(declare-fun t!37596 () Bool)

(declare-fun tb!9747 () Bool)

(assert (=> (and start!99600 (= defaultEntry!1004 defaultEntry!1004) t!37596) tb!9747))

(declare-fun result!20069 () Bool)

(assert (=> tb!9747 (= result!20069 tp_is_empty!29473)))

(assert (=> b!1173418 t!37596))

(declare-fun b_and!40757 () Bool)

(assert (= b_and!40755 (and (=> t!37596 result!20069) b_and!40757)))

(declare-fun m!1081515 () Bool)

(assert (=> b!1173422 m!1081515))

(declare-fun m!1081517 () Bool)

(assert (=> mapNonEmpty!46037 m!1081517))

(declare-fun m!1081519 () Bool)

(assert (=> b!1173420 m!1081519))

(declare-fun m!1081521 () Bool)

(assert (=> b!1173421 m!1081521))

(declare-fun m!1081523 () Bool)

(assert (=> b!1173423 m!1081523))

(declare-fun m!1081525 () Bool)

(assert (=> b!1173436 m!1081525))

(declare-fun m!1081527 () Bool)

(assert (=> b!1173416 m!1081527))

(declare-fun m!1081529 () Bool)

(assert (=> b!1173419 m!1081529))

(declare-fun m!1081531 () Bool)

(assert (=> b!1173425 m!1081531))

(declare-fun m!1081533 () Bool)

(assert (=> b!1173425 m!1081533))

(assert (=> b!1173425 m!1081519))

(declare-fun m!1081535 () Bool)

(assert (=> b!1173425 m!1081535))

(declare-fun m!1081537 () Bool)

(assert (=> b!1173425 m!1081537))

(assert (=> b!1173425 m!1081519))

(declare-fun m!1081539 () Bool)

(assert (=> b!1173425 m!1081539))

(declare-fun m!1081541 () Bool)

(assert (=> start!99600 m!1081541))

(declare-fun m!1081543 () Bool)

(assert (=> start!99600 m!1081543))

(declare-fun m!1081545 () Bool)

(assert (=> b!1173428 m!1081545))

(declare-fun m!1081547 () Bool)

(assert (=> b!1173418 m!1081547))

(declare-fun m!1081549 () Bool)

(assert (=> b!1173418 m!1081549))

(declare-fun m!1081551 () Bool)

(assert (=> b!1173418 m!1081551))

(declare-fun m!1081553 () Bool)

(assert (=> b!1173418 m!1081553))

(declare-fun m!1081555 () Bool)

(assert (=> b!1173434 m!1081555))

(declare-fun m!1081557 () Bool)

(assert (=> b!1173433 m!1081557))

(declare-fun m!1081559 () Bool)

(assert (=> b!1173433 m!1081559))

(declare-fun m!1081561 () Bool)

(assert (=> b!1173433 m!1081561))

(declare-fun m!1081563 () Bool)

(assert (=> b!1173433 m!1081563))

(declare-fun m!1081565 () Bool)

(assert (=> b!1173431 m!1081565))

(declare-fun m!1081567 () Bool)

(assert (=> b!1173431 m!1081567))

(assert (=> b!1173435 m!1081519))

(declare-fun m!1081569 () Bool)

(assert (=> b!1173435 m!1081569))

(assert (=> b!1173435 m!1081569))

(declare-fun m!1081571 () Bool)

(assert (=> b!1173435 m!1081571))

(declare-fun m!1081573 () Bool)

(assert (=> b!1173435 m!1081573))

(declare-fun m!1081575 () Bool)

(assert (=> b!1173426 m!1081575))

(declare-fun m!1081577 () Bool)

(assert (=> b!1173417 m!1081577))

(declare-fun m!1081579 () Bool)

(assert (=> b!1173417 m!1081579))

(declare-fun m!1081581 () Bool)

(assert (=> b!1173430 m!1081581))

(check-sat (not b!1173436) (not b!1173430) (not b!1173422) (not b_lambda!20081) (not b!1173425) (not b!1173418) (not b!1173417) (not b!1173428) (not b!1173419) (not b!1173421) (not b!1173426) tp_is_empty!29473 (not b_next!24943) (not b!1173433) (not b!1173431) (not start!99600) b_and!40757 (not b!1173435) (not b!1173423) (not mapNonEmpty!46037) (not b!1173434))
(check-sat b_and!40757 (not b_next!24943))
