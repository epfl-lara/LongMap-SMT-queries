; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101616 () Bool)

(assert start!101616)

(declare-fun b_free!26251 () Bool)

(declare-fun b_next!26251 () Bool)

(assert (=> start!101616 (= b_free!26251 (not b_next!26251))))

(declare-fun tp!91781 () Bool)

(declare-fun b_and!43657 () Bool)

(assert (=> start!101616 (= tp!91781 b_and!43657)))

(declare-fun res!809662 () Bool)

(declare-fun e!692544 () Bool)

(assert (=> start!101616 (=> (not res!809662) (not e!692544))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78725 0))(
  ( (array!78726 (arr!37989 (Array (_ BitVec 32) (_ BitVec 64))) (size!38526 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78725)

(assert (=> start!101616 (= res!809662 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38526 _keys!1208))))))

(assert (=> start!101616 e!692544))

(declare-fun tp_is_empty!30955 () Bool)

(assert (=> start!101616 tp_is_empty!30955))

(declare-fun array_inv!28982 (array!78725) Bool)

(assert (=> start!101616 (array_inv!28982 _keys!1208)))

(assert (=> start!101616 true))

(assert (=> start!101616 tp!91781))

(declare-datatypes ((V!46401 0))(
  ( (V!46402 (val!15534 Int)) )
))
(declare-datatypes ((ValueCell!14768 0))(
  ( (ValueCellFull!14768 (v!18185 V!46401)) (EmptyCell!14768) )
))
(declare-datatypes ((array!78727 0))(
  ( (array!78728 (arr!37990 (Array (_ BitVec 32) ValueCell!14768)) (size!38527 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78727)

(declare-fun e!692545 () Bool)

(declare-fun array_inv!28983 (array!78727) Bool)

(assert (=> start!101616 (and (array_inv!28983 _values!996) e!692545)))

(declare-fun b!1219622 () Bool)

(declare-fun e!692539 () Bool)

(declare-fun mapRes!48313 () Bool)

(assert (=> b!1219622 (= e!692545 (and e!692539 mapRes!48313))))

(declare-fun condMapEmpty!48313 () Bool)

(declare-fun mapDefault!48313 () ValueCell!14768)

(assert (=> b!1219622 (= condMapEmpty!48313 (= (arr!37990 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14768)) mapDefault!48313)))))

(declare-fun b!1219623 () Bool)

(declare-fun res!809656 () Bool)

(assert (=> b!1219623 (=> (not res!809656) (not e!692544))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219623 (= res!809656 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38526 _keys!1208))))))

(declare-fun b!1219624 () Bool)

(declare-fun res!809655 () Bool)

(assert (=> b!1219624 (=> (not res!809655) (not e!692544))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219624 (= res!809655 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48313 () Bool)

(declare-fun tp!91780 () Bool)

(declare-fun e!692546 () Bool)

(assert (=> mapNonEmpty!48313 (= mapRes!48313 (and tp!91780 e!692546))))

(declare-fun mapKey!48313 () (_ BitVec 32))

(declare-fun mapRest!48313 () (Array (_ BitVec 32) ValueCell!14768))

(declare-fun mapValue!48313 () ValueCell!14768)

(assert (=> mapNonEmpty!48313 (= (arr!37990 _values!996) (store mapRest!48313 mapKey!48313 mapValue!48313))))

(declare-fun b!1219625 () Bool)

(declare-fun e!692542 () Bool)

(declare-fun e!692540 () Bool)

(assert (=> b!1219625 (= e!692542 e!692540)))

(declare-fun res!809659 () Bool)

(assert (=> b!1219625 (=> res!809659 e!692540)))

(assert (=> b!1219625 (= res!809659 (not (= (select (arr!37989 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219626 () Bool)

(declare-fun e!692543 () Bool)

(assert (=> b!1219626 (= e!692544 e!692543)))

(declare-fun res!809658 () Bool)

(assert (=> b!1219626 (=> (not res!809658) (not e!692543))))

(declare-fun lt!554318 () array!78725)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78725 (_ BitVec 32)) Bool)

(assert (=> b!1219626 (= res!809658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554318 mask!1564))))

(assert (=> b!1219626 (= lt!554318 (array!78726 (store (arr!37989 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38526 _keys!1208)))))

(declare-fun b!1219627 () Bool)

(declare-fun res!809650 () Bool)

(assert (=> b!1219627 (=> (not res!809650) (not e!692544))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1219627 (= res!809650 (and (= (size!38527 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38526 _keys!1208) (size!38527 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219628 () Bool)

(assert (=> b!1219628 (= e!692539 tp_is_empty!30955)))

(declare-fun b!1219629 () Bool)

(assert (=> b!1219629 (= e!692546 tp_is_empty!30955)))

(declare-fun b!1219630 () Bool)

(declare-fun e!692548 () Bool)

(declare-fun e!692547 () Bool)

(assert (=> b!1219630 (= e!692548 e!692547)))

(declare-fun res!809661 () Bool)

(assert (=> b!1219630 (=> res!809661 e!692547)))

(assert (=> b!1219630 (= res!809661 (not (validKeyInArray!0 (select (arr!37989 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19994 0))(
  ( (tuple2!19995 (_1!10008 (_ BitVec 64)) (_2!10008 V!46401)) )
))
(declare-datatypes ((List!26804 0))(
  ( (Nil!26801) (Cons!26800 (h!28018 tuple2!19994) (t!40027 List!26804)) )
))
(declare-datatypes ((ListLongMap!17971 0))(
  ( (ListLongMap!17972 (toList!9001 List!26804)) )
))
(declare-fun lt!554319 () ListLongMap!17971)

(declare-fun lt!554321 () ListLongMap!17971)

(assert (=> b!1219630 (= lt!554319 lt!554321)))

(declare-fun lt!554315 () ListLongMap!17971)

(declare-fun -!1892 (ListLongMap!17971 (_ BitVec 64)) ListLongMap!17971)

(assert (=> b!1219630 (= lt!554321 (-!1892 lt!554315 k0!934))))

(declare-fun zeroValue!944 () V!46401)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554314 () array!78727)

(declare-fun minValue!944 () V!46401)

(declare-fun getCurrentListMapNoExtraKeys!5458 (array!78725 array!78727 (_ BitVec 32) (_ BitVec 32) V!46401 V!46401 (_ BitVec 32) Int) ListLongMap!17971)

(assert (=> b!1219630 (= lt!554319 (getCurrentListMapNoExtraKeys!5458 lt!554318 lt!554314 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219630 (= lt!554315 (getCurrentListMapNoExtraKeys!5458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40360 0))(
  ( (Unit!40361) )
))
(declare-fun lt!554322 () Unit!40360)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 (array!78725 array!78727 (_ BitVec 32) (_ BitVec 32) V!46401 V!46401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40360)

(assert (=> b!1219630 (= lt!554322 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219631 () Bool)

(declare-fun e!692541 () Bool)

(assert (=> b!1219631 (= e!692541 e!692548)))

(declare-fun res!809651 () Bool)

(assert (=> b!1219631 (=> res!809651 e!692548)))

(assert (=> b!1219631 (= res!809651 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!554320 () ListLongMap!17971)

(assert (=> b!1219631 (= lt!554320 (getCurrentListMapNoExtraKeys!5458 lt!554318 lt!554314 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554317 () V!46401)

(assert (=> b!1219631 (= lt!554314 (array!78728 (store (arr!37990 _values!996) i!673 (ValueCellFull!14768 lt!554317)) (size!38527 _values!996)))))

(declare-fun dynLambda!3362 (Int (_ BitVec 64)) V!46401)

(assert (=> b!1219631 (= lt!554317 (dynLambda!3362 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554313 () ListLongMap!17971)

(assert (=> b!1219631 (= lt!554313 (getCurrentListMapNoExtraKeys!5458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219632 () Bool)

(declare-fun res!809660 () Bool)

(assert (=> b!1219632 (=> (not res!809660) (not e!692544))))

(assert (=> b!1219632 (= res!809660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219633 () Bool)

(declare-fun arrayContainsKey!0 (array!78725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219633 (= e!692540 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48313 () Bool)

(assert (=> mapIsEmpty!48313 mapRes!48313))

(declare-fun b!1219634 () Bool)

(declare-fun res!809652 () Bool)

(assert (=> b!1219634 (=> (not res!809652) (not e!692544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219634 (= res!809652 (validMask!0 mask!1564))))

(declare-fun b!1219635 () Bool)

(assert (=> b!1219635 (= e!692547 true)))

(assert (=> b!1219635 e!692542))

(declare-fun res!809653 () Bool)

(assert (=> b!1219635 (=> (not res!809653) (not e!692542))))

(declare-fun +!4112 (ListLongMap!17971 tuple2!19994) ListLongMap!17971)

(declare-fun get!19404 (ValueCell!14768 V!46401) V!46401)

(assert (=> b!1219635 (= res!809653 (= lt!554320 (+!4112 lt!554321 (tuple2!19995 (select (arr!37989 _keys!1208) from!1455) (get!19404 (select (arr!37990 _values!996) from!1455) lt!554317)))))))

(declare-fun b!1219636 () Bool)

(declare-fun res!809654 () Bool)

(assert (=> b!1219636 (=> (not res!809654) (not e!692544))))

(assert (=> b!1219636 (= res!809654 (= (select (arr!37989 _keys!1208) i!673) k0!934))))

(declare-fun b!1219637 () Bool)

(assert (=> b!1219637 (= e!692543 (not e!692541))))

(declare-fun res!809657 () Bool)

(assert (=> b!1219637 (=> res!809657 e!692541)))

(assert (=> b!1219637 (= res!809657 (bvsgt from!1455 i!673))))

(assert (=> b!1219637 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554316 () Unit!40360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78725 (_ BitVec 64) (_ BitVec 32)) Unit!40360)

(assert (=> b!1219637 (= lt!554316 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219638 () Bool)

(declare-fun res!809648 () Bool)

(assert (=> b!1219638 (=> (not res!809648) (not e!692543))))

(declare-datatypes ((List!26805 0))(
  ( (Nil!26802) (Cons!26801 (h!28019 (_ BitVec 64)) (t!40028 List!26805)) )
))
(declare-fun arrayNoDuplicates!0 (array!78725 (_ BitVec 32) List!26805) Bool)

(assert (=> b!1219638 (= res!809648 (arrayNoDuplicates!0 lt!554318 #b00000000000000000000000000000000 Nil!26802))))

(declare-fun b!1219639 () Bool)

(declare-fun res!809649 () Bool)

(assert (=> b!1219639 (=> (not res!809649) (not e!692544))))

(assert (=> b!1219639 (= res!809649 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26802))))

(assert (= (and start!101616 res!809662) b!1219634))

(assert (= (and b!1219634 res!809652) b!1219627))

(assert (= (and b!1219627 res!809650) b!1219632))

(assert (= (and b!1219632 res!809660) b!1219639))

(assert (= (and b!1219639 res!809649) b!1219623))

(assert (= (and b!1219623 res!809656) b!1219624))

(assert (= (and b!1219624 res!809655) b!1219636))

(assert (= (and b!1219636 res!809654) b!1219626))

(assert (= (and b!1219626 res!809658) b!1219638))

(assert (= (and b!1219638 res!809648) b!1219637))

(assert (= (and b!1219637 (not res!809657)) b!1219631))

(assert (= (and b!1219631 (not res!809651)) b!1219630))

(assert (= (and b!1219630 (not res!809661)) b!1219635))

(assert (= (and b!1219635 res!809653) b!1219625))

(assert (= (and b!1219625 (not res!809659)) b!1219633))

(assert (= (and b!1219622 condMapEmpty!48313) mapIsEmpty!48313))

(assert (= (and b!1219622 (not condMapEmpty!48313)) mapNonEmpty!48313))

(get-info :version)

(assert (= (and mapNonEmpty!48313 ((_ is ValueCellFull!14768) mapValue!48313)) b!1219629))

(assert (= (and b!1219622 ((_ is ValueCellFull!14768) mapDefault!48313)) b!1219628))

(assert (= start!101616 b!1219622))

(declare-fun b_lambda!21997 () Bool)

(assert (=> (not b_lambda!21997) (not b!1219631)))

(declare-fun t!40026 () Bool)

(declare-fun tb!11043 () Bool)

(assert (=> (and start!101616 (= defaultEntry!1004 defaultEntry!1004) t!40026) tb!11043))

(declare-fun result!22695 () Bool)

(assert (=> tb!11043 (= result!22695 tp_is_empty!30955)))

(assert (=> b!1219631 t!40026))

(declare-fun b_and!43659 () Bool)

(assert (= b_and!43657 (and (=> t!40026 result!22695) b_and!43659)))

(declare-fun m!1124671 () Bool)

(assert (=> b!1219637 m!1124671))

(declare-fun m!1124673 () Bool)

(assert (=> b!1219637 m!1124673))

(declare-fun m!1124675 () Bool)

(assert (=> b!1219639 m!1124675))

(declare-fun m!1124677 () Bool)

(assert (=> b!1219632 m!1124677))

(declare-fun m!1124679 () Bool)

(assert (=> b!1219638 m!1124679))

(declare-fun m!1124681 () Bool)

(assert (=> b!1219624 m!1124681))

(declare-fun m!1124683 () Bool)

(assert (=> b!1219630 m!1124683))

(declare-fun m!1124685 () Bool)

(assert (=> b!1219630 m!1124685))

(declare-fun m!1124687 () Bool)

(assert (=> b!1219630 m!1124687))

(declare-fun m!1124689 () Bool)

(assert (=> b!1219630 m!1124689))

(declare-fun m!1124691 () Bool)

(assert (=> b!1219630 m!1124691))

(declare-fun m!1124693 () Bool)

(assert (=> b!1219630 m!1124693))

(assert (=> b!1219630 m!1124689))

(declare-fun m!1124695 () Bool)

(assert (=> mapNonEmpty!48313 m!1124695))

(declare-fun m!1124697 () Bool)

(assert (=> b!1219631 m!1124697))

(declare-fun m!1124699 () Bool)

(assert (=> b!1219631 m!1124699))

(declare-fun m!1124701 () Bool)

(assert (=> b!1219631 m!1124701))

(declare-fun m!1124703 () Bool)

(assert (=> b!1219631 m!1124703))

(declare-fun m!1124705 () Bool)

(assert (=> b!1219633 m!1124705))

(assert (=> b!1219635 m!1124689))

(declare-fun m!1124707 () Bool)

(assert (=> b!1219635 m!1124707))

(assert (=> b!1219635 m!1124707))

(declare-fun m!1124709 () Bool)

(assert (=> b!1219635 m!1124709))

(declare-fun m!1124711 () Bool)

(assert (=> b!1219635 m!1124711))

(assert (=> b!1219625 m!1124689))

(declare-fun m!1124713 () Bool)

(assert (=> start!101616 m!1124713))

(declare-fun m!1124715 () Bool)

(assert (=> start!101616 m!1124715))

(declare-fun m!1124717 () Bool)

(assert (=> b!1219626 m!1124717))

(declare-fun m!1124719 () Bool)

(assert (=> b!1219626 m!1124719))

(declare-fun m!1124721 () Bool)

(assert (=> b!1219634 m!1124721))

(declare-fun m!1124723 () Bool)

(assert (=> b!1219636 m!1124723))

(check-sat (not b!1219635) b_and!43659 (not b!1219634) (not b!1219637) (not b!1219630) (not b!1219626) (not b!1219631) (not b!1219633) (not b!1219624) (not b_lambda!21997) (not b!1219639) (not b!1219638) (not b_next!26251) (not mapNonEmpty!48313) tp_is_empty!30955 (not b!1219632) (not start!101616))
(check-sat b_and!43659 (not b_next!26251))
