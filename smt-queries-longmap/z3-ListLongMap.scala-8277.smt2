; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100756 () Bool)

(assert start!100756)

(declare-fun b_free!25933 () Bool)

(declare-fun b_next!25933 () Bool)

(assert (=> start!100756 (= b_free!25933 (not b_next!25933))))

(declare-fun tp!90801 () Bool)

(declare-fun b_and!42827 () Bool)

(assert (=> start!100756 (= tp!90801 b_and!42827)))

(declare-fun b!1205569 () Bool)

(declare-datatypes ((V!45977 0))(
  ( (V!45978 (val!15375 Int)) )
))
(declare-datatypes ((tuple2!19792 0))(
  ( (tuple2!19793 (_1!9907 (_ BitVec 64)) (_2!9907 V!45977)) )
))
(declare-datatypes ((List!26577 0))(
  ( (Nil!26574) (Cons!26573 (h!27782 tuple2!19792) (t!39481 List!26577)) )
))
(declare-datatypes ((ListLongMap!17761 0))(
  ( (ListLongMap!17762 (toList!8896 List!26577)) )
))
(declare-fun call!58506 () ListLongMap!17761)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!684628 () Bool)

(declare-fun call!58503 () ListLongMap!17761)

(declare-fun -!1785 (ListLongMap!17761 (_ BitVec 64)) ListLongMap!17761)

(assert (=> b!1205569 (= e!684628 (= call!58506 (-!1785 call!58503 k0!934)))))

(declare-fun b!1205570 () Bool)

(declare-fun e!684617 () Bool)

(declare-fun e!684632 () Bool)

(assert (=> b!1205570 (= e!684617 e!684632)))

(declare-fun res!801864 () Bool)

(assert (=> b!1205570 (=> (not res!801864) (not e!684632))))

(declare-datatypes ((array!77968 0))(
  ( (array!77969 (arr!37625 (Array (_ BitVec 32) (_ BitVec 64))) (size!38163 (_ BitVec 32))) )
))
(declare-fun lt!546693 () array!77968)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77968 (_ BitVec 32)) Bool)

(assert (=> b!1205570 (= res!801864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546693 mask!1564))))

(declare-fun _keys!1208 () array!77968)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205570 (= lt!546693 (array!77969 (store (arr!37625 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38163 _keys!1208)))))

(declare-fun b!1205572 () Bool)

(declare-datatypes ((Unit!39811 0))(
  ( (Unit!39812) )
))
(declare-fun e!684627 () Unit!39811)

(declare-fun Unit!39813 () Unit!39811)

(assert (=> b!1205572 (= e!684627 Unit!39813)))

(declare-fun zeroValue!944 () V!45977)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45977)

(declare-fun bm!58498 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14609 0))(
  ( (ValueCellFull!14609 (v!18018 V!45977)) (EmptyCell!14609) )
))
(declare-datatypes ((array!77970 0))(
  ( (array!77971 (arr!37626 (Array (_ BitVec 32) ValueCell!14609)) (size!38164 (_ BitVec 32))) )
))
(declare-fun lt!546689 () array!77970)

(declare-fun getCurrentListMapNoExtraKeys!5341 (array!77968 array!77970 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 32) Int) ListLongMap!17761)

(assert (=> bm!58498 (= call!58506 (getCurrentListMapNoExtraKeys!5341 lt!546693 lt!546689 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205573 () Bool)

(declare-fun e!684630 () Bool)

(declare-fun e!684618 () Bool)

(assert (=> b!1205573 (= e!684630 e!684618)))

(declare-fun res!801860 () Bool)

(assert (=> b!1205573 (=> res!801860 e!684618)))

(assert (=> b!1205573 (= res!801860 (not (= (select (arr!37625 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1205573 e!684628))

(declare-fun c!118300 () Bool)

(assert (=> b!1205573 (= c!118300 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!77970)

(declare-fun lt!546686 () Unit!39811)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1032 (array!77968 array!77970 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39811)

(assert (=> b!1205573 (= lt!546686 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58499 () Bool)

(declare-fun call!58507 () Unit!39811)

(declare-fun call!58508 () Unit!39811)

(assert (=> bm!58499 (= call!58507 call!58508)))

(declare-fun mapIsEmpty!47811 () Bool)

(declare-fun mapRes!47811 () Bool)

(assert (=> mapIsEmpty!47811 mapRes!47811))

(declare-fun b!1205574 () Bool)

(declare-fun res!801857 () Bool)

(assert (=> b!1205574 (=> (not res!801857) (not e!684617))))

(assert (=> b!1205574 (= res!801857 (= (select (arr!37625 _keys!1208) i!673) k0!934))))

(declare-fun b!1205575 () Bool)

(declare-fun e!684619 () Bool)

(declare-fun arrayContainsKey!0 (array!77968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205575 (= e!684619 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58500 () Bool)

(declare-fun call!58502 () Bool)

(declare-fun call!58501 () Bool)

(assert (=> bm!58500 (= call!58502 call!58501)))

(declare-fun c!118303 () Bool)

(declare-fun lt!546687 () ListLongMap!17761)

(declare-fun lt!546695 () ListLongMap!17761)

(declare-fun bm!58501 () Bool)

(declare-fun c!118299 () Bool)

(declare-fun addStillContains!1009 (ListLongMap!17761 (_ BitVec 64) V!45977 (_ BitVec 64)) Unit!39811)

(assert (=> bm!58501 (= call!58508 (addStillContains!1009 (ite c!118303 lt!546695 lt!546687) (ite c!118303 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118299 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118303 minValue!944 (ite c!118299 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1205576 () Bool)

(declare-fun e!684622 () Unit!39811)

(declare-fun lt!546697 () Unit!39811)

(assert (=> b!1205576 (= e!684622 lt!546697)))

(declare-fun lt!546684 () Unit!39811)

(assert (=> b!1205576 (= lt!546684 (addStillContains!1009 lt!546687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun +!4027 (ListLongMap!17761 tuple2!19792) ListLongMap!17761)

(assert (=> b!1205576 (= lt!546695 (+!4027 lt!546687 (tuple2!19793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205576 call!58501))

(assert (=> b!1205576 (= lt!546697 call!58508)))

(declare-fun call!58504 () ListLongMap!17761)

(declare-fun contains!6897 (ListLongMap!17761 (_ BitVec 64)) Bool)

(assert (=> b!1205576 (contains!6897 call!58504 k0!934)))

(declare-fun bm!58502 () Bool)

(declare-fun call!58505 () ListLongMap!17761)

(assert (=> bm!58502 (= call!58505 call!58504)))

(declare-fun b!1205577 () Bool)

(declare-fun e!684631 () Unit!39811)

(assert (=> b!1205577 (= e!684622 e!684631)))

(declare-fun lt!546696 () Bool)

(assert (=> b!1205577 (= c!118299 (and (not lt!546696) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205578 () Bool)

(declare-fun e!684625 () Bool)

(assert (=> b!1205578 (= e!684618 e!684625)))

(declare-fun res!801870 () Bool)

(assert (=> b!1205578 (=> res!801870 e!684625)))

(assert (=> b!1205578 (= res!801870 (not (contains!6897 lt!546687 k0!934)))))

(assert (=> b!1205578 (= lt!546687 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47811 () Bool)

(declare-fun tp!90802 () Bool)

(declare-fun e!684629 () Bool)

(assert (=> mapNonEmpty!47811 (= mapRes!47811 (and tp!90802 e!684629))))

(declare-fun mapKey!47811 () (_ BitVec 32))

(declare-fun mapValue!47811 () ValueCell!14609)

(declare-fun mapRest!47811 () (Array (_ BitVec 32) ValueCell!14609))

(assert (=> mapNonEmpty!47811 (= (arr!37626 _values!996) (store mapRest!47811 mapKey!47811 mapValue!47811))))

(declare-fun b!1205579 () Bool)

(declare-fun tp_is_empty!30637 () Bool)

(assert (=> b!1205579 (= e!684629 tp_is_empty!30637)))

(declare-fun bm!58503 () Bool)

(assert (=> bm!58503 (= call!58503 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!684621 () Bool)

(declare-fun b!1205580 () Bool)

(assert (=> b!1205580 (= e!684621 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205581 () Bool)

(declare-fun res!801868 () Bool)

(assert (=> b!1205581 (=> (not res!801868) (not e!684617))))

(assert (=> b!1205581 (= res!801868 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38163 _keys!1208))))))

(declare-fun res!801869 () Bool)

(assert (=> start!100756 (=> (not res!801869) (not e!684617))))

(assert (=> start!100756 (= res!801869 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38163 _keys!1208))))))

(assert (=> start!100756 e!684617))

(assert (=> start!100756 tp_is_empty!30637))

(declare-fun array_inv!28774 (array!77968) Bool)

(assert (=> start!100756 (array_inv!28774 _keys!1208)))

(assert (=> start!100756 true))

(assert (=> start!100756 tp!90801))

(declare-fun e!684624 () Bool)

(declare-fun array_inv!28775 (array!77970) Bool)

(assert (=> start!100756 (and (array_inv!28775 _values!996) e!684624)))

(declare-fun b!1205571 () Bool)

(declare-fun e!684620 () Bool)

(assert (=> b!1205571 (= e!684620 tp_is_empty!30637)))

(declare-fun b!1205582 () Bool)

(assert (=> b!1205582 (= e!684624 (and e!684620 mapRes!47811))))

(declare-fun condMapEmpty!47811 () Bool)

(declare-fun mapDefault!47811 () ValueCell!14609)

(assert (=> b!1205582 (= condMapEmpty!47811 (= (arr!37626 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14609)) mapDefault!47811)))))

(declare-fun bm!58504 () Bool)

(assert (=> bm!58504 (= call!58501 (contains!6897 (ite c!118303 lt!546695 call!58505) k0!934))))

(declare-fun b!1205583 () Bool)

(declare-fun res!801867 () Bool)

(assert (=> b!1205583 (=> (not res!801867) (not e!684617))))

(assert (=> b!1205583 (= res!801867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205584 () Bool)

(assert (=> b!1205584 call!58502))

(declare-fun lt!546685 () Unit!39811)

(assert (=> b!1205584 (= lt!546685 call!58507)))

(assert (=> b!1205584 (= e!684631 lt!546685)))

(declare-fun b!1205585 () Bool)

(declare-fun res!801871 () Bool)

(assert (=> b!1205585 (=> (not res!801871) (not e!684617))))

(declare-datatypes ((List!26578 0))(
  ( (Nil!26575) (Cons!26574 (h!27783 (_ BitVec 64)) (t!39482 List!26578)) )
))
(declare-fun arrayNoDuplicates!0 (array!77968 (_ BitVec 32) List!26578) Bool)

(assert (=> b!1205585 (= res!801871 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26575))))

(declare-fun b!1205586 () Bool)

(declare-fun c!118302 () Bool)

(assert (=> b!1205586 (= c!118302 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546696))))

(assert (=> b!1205586 (= e!684631 e!684627)))

(declare-fun b!1205587 () Bool)

(assert (=> b!1205587 (= e!684625 true)))

(assert (=> b!1205587 e!684619))

(declare-fun res!801861 () Bool)

(assert (=> b!1205587 (=> (not res!801861) (not e!684619))))

(assert (=> b!1205587 (= res!801861 e!684621)))

(declare-fun c!118301 () Bool)

(assert (=> b!1205587 (= c!118301 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546690 () Unit!39811)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!561 (array!77968 array!77970 (_ BitVec 32) (_ BitVec 32) V!45977 V!45977 (_ BitVec 64) (_ BitVec 32) Int) Unit!39811)

(assert (=> b!1205587 (= lt!546690 (lemmaListMapContainsThenArrayContainsFrom!561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546691 () Unit!39811)

(assert (=> b!1205587 (= lt!546691 e!684622)))

(assert (=> b!1205587 (= c!118303 (and (not lt!546696) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205587 (= lt!546696 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205588 () Bool)

(declare-fun res!801859 () Bool)

(assert (=> b!1205588 (=> (not res!801859) (not e!684617))))

(assert (=> b!1205588 (= res!801859 (and (= (size!38164 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38163 _keys!1208) (size!38164 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205589 () Bool)

(assert (=> b!1205589 (= e!684628 (= call!58506 call!58503))))

(declare-fun b!1205590 () Bool)

(declare-fun e!684626 () Bool)

(assert (=> b!1205590 (= e!684626 e!684630)))

(declare-fun res!801862 () Bool)

(assert (=> b!1205590 (=> res!801862 e!684630)))

(assert (=> b!1205590 (= res!801862 (not (= from!1455 i!673)))))

(declare-fun lt!546692 () ListLongMap!17761)

(assert (=> b!1205590 (= lt!546692 (getCurrentListMapNoExtraKeys!5341 lt!546693 lt!546689 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3210 (Int (_ BitVec 64)) V!45977)

(assert (=> b!1205590 (= lt!546689 (array!77971 (store (arr!37626 _values!996) i!673 (ValueCellFull!14609 (dynLambda!3210 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38164 _values!996)))))

(declare-fun lt!546683 () ListLongMap!17761)

(assert (=> b!1205590 (= lt!546683 (getCurrentListMapNoExtraKeys!5341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205591 () Bool)

(declare-fun res!801863 () Bool)

(assert (=> b!1205591 (=> (not res!801863) (not e!684617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205591 (= res!801863 (validMask!0 mask!1564))))

(declare-fun b!1205592 () Bool)

(declare-fun res!801858 () Bool)

(assert (=> b!1205592 (=> (not res!801858) (not e!684632))))

(assert (=> b!1205592 (= res!801858 (arrayNoDuplicates!0 lt!546693 #b00000000000000000000000000000000 Nil!26575))))

(declare-fun bm!58505 () Bool)

(assert (=> bm!58505 (= call!58504 (+!4027 (ite c!118303 lt!546695 lt!546687) (ite c!118303 (tuple2!19793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118299 (tuple2!19793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205593 () Bool)

(declare-fun lt!546694 () Unit!39811)

(assert (=> b!1205593 (= e!684627 lt!546694)))

(assert (=> b!1205593 (= lt!546694 call!58507)))

(assert (=> b!1205593 call!58502))

(declare-fun b!1205594 () Bool)

(declare-fun res!801866 () Bool)

(assert (=> b!1205594 (=> (not res!801866) (not e!684617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205594 (= res!801866 (validKeyInArray!0 k0!934))))

(declare-fun b!1205595 () Bool)

(assert (=> b!1205595 (= e!684632 (not e!684626))))

(declare-fun res!801865 () Bool)

(assert (=> b!1205595 (=> res!801865 e!684626)))

(assert (=> b!1205595 (= res!801865 (bvsgt from!1455 i!673))))

(assert (=> b!1205595 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546688 () Unit!39811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77968 (_ BitVec 64) (_ BitVec 32)) Unit!39811)

(assert (=> b!1205595 (= lt!546688 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1205596 () Bool)

(assert (=> b!1205596 (= e!684621 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546696) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!100756 res!801869) b!1205591))

(assert (= (and b!1205591 res!801863) b!1205588))

(assert (= (and b!1205588 res!801859) b!1205583))

(assert (= (and b!1205583 res!801867) b!1205585))

(assert (= (and b!1205585 res!801871) b!1205581))

(assert (= (and b!1205581 res!801868) b!1205594))

(assert (= (and b!1205594 res!801866) b!1205574))

(assert (= (and b!1205574 res!801857) b!1205570))

(assert (= (and b!1205570 res!801864) b!1205592))

(assert (= (and b!1205592 res!801858) b!1205595))

(assert (= (and b!1205595 (not res!801865)) b!1205590))

(assert (= (and b!1205590 (not res!801862)) b!1205573))

(assert (= (and b!1205573 c!118300) b!1205569))

(assert (= (and b!1205573 (not c!118300)) b!1205589))

(assert (= (or b!1205569 b!1205589) bm!58498))

(assert (= (or b!1205569 b!1205589) bm!58503))

(assert (= (and b!1205573 (not res!801860)) b!1205578))

(assert (= (and b!1205578 (not res!801870)) b!1205587))

(assert (= (and b!1205587 c!118303) b!1205576))

(assert (= (and b!1205587 (not c!118303)) b!1205577))

(assert (= (and b!1205577 c!118299) b!1205584))

(assert (= (and b!1205577 (not c!118299)) b!1205586))

(assert (= (and b!1205586 c!118302) b!1205593))

(assert (= (and b!1205586 (not c!118302)) b!1205572))

(assert (= (or b!1205584 b!1205593) bm!58499))

(assert (= (or b!1205584 b!1205593) bm!58502))

(assert (= (or b!1205584 b!1205593) bm!58500))

(assert (= (or b!1205576 bm!58500) bm!58504))

(assert (= (or b!1205576 bm!58499) bm!58501))

(assert (= (or b!1205576 bm!58502) bm!58505))

(assert (= (and b!1205587 c!118301) b!1205580))

(assert (= (and b!1205587 (not c!118301)) b!1205596))

(assert (= (and b!1205587 res!801861) b!1205575))

(assert (= (and b!1205582 condMapEmpty!47811) mapIsEmpty!47811))

(assert (= (and b!1205582 (not condMapEmpty!47811)) mapNonEmpty!47811))

(get-info :version)

(assert (= (and mapNonEmpty!47811 ((_ is ValueCellFull!14609) mapValue!47811)) b!1205579))

(assert (= (and b!1205582 ((_ is ValueCellFull!14609) mapDefault!47811)) b!1205571))

(assert (= start!100756 b!1205582))

(declare-fun b_lambda!21311 () Bool)

(assert (=> (not b_lambda!21311) (not b!1205590)))

(declare-fun t!39480 () Bool)

(declare-fun tb!10725 () Bool)

(assert (=> (and start!100756 (= defaultEntry!1004 defaultEntry!1004) t!39480) tb!10725))

(declare-fun result!22043 () Bool)

(assert (=> tb!10725 (= result!22043 tp_is_empty!30637)))

(assert (=> b!1205590 t!39480))

(declare-fun b_and!42829 () Bool)

(assert (= b_and!42827 (and (=> t!39480 result!22043) b_and!42829)))

(declare-fun m!1110915 () Bool)

(assert (=> b!1205570 m!1110915))

(declare-fun m!1110917 () Bool)

(assert (=> b!1205570 m!1110917))

(declare-fun m!1110919 () Bool)

(assert (=> bm!58505 m!1110919))

(declare-fun m!1110921 () Bool)

(assert (=> mapNonEmpty!47811 m!1110921))

(declare-fun m!1110923 () Bool)

(assert (=> b!1205590 m!1110923))

(declare-fun m!1110925 () Bool)

(assert (=> b!1205590 m!1110925))

(declare-fun m!1110927 () Bool)

(assert (=> b!1205590 m!1110927))

(declare-fun m!1110929 () Bool)

(assert (=> b!1205590 m!1110929))

(declare-fun m!1110931 () Bool)

(assert (=> bm!58498 m!1110931))

(declare-fun m!1110933 () Bool)

(assert (=> b!1205580 m!1110933))

(assert (=> b!1205575 m!1110933))

(declare-fun m!1110935 () Bool)

(assert (=> b!1205573 m!1110935))

(declare-fun m!1110937 () Bool)

(assert (=> b!1205573 m!1110937))

(declare-fun m!1110939 () Bool)

(assert (=> b!1205585 m!1110939))

(declare-fun m!1110941 () Bool)

(assert (=> b!1205569 m!1110941))

(declare-fun m!1110943 () Bool)

(assert (=> bm!58503 m!1110943))

(declare-fun m!1110945 () Bool)

(assert (=> bm!58501 m!1110945))

(declare-fun m!1110947 () Bool)

(assert (=> b!1205574 m!1110947))

(declare-fun m!1110949 () Bool)

(assert (=> bm!58504 m!1110949))

(declare-fun m!1110951 () Bool)

(assert (=> b!1205592 m!1110951))

(declare-fun m!1110953 () Bool)

(assert (=> b!1205591 m!1110953))

(declare-fun m!1110955 () Bool)

(assert (=> b!1205595 m!1110955))

(declare-fun m!1110957 () Bool)

(assert (=> b!1205595 m!1110957))

(declare-fun m!1110959 () Bool)

(assert (=> start!100756 m!1110959))

(declare-fun m!1110961 () Bool)

(assert (=> start!100756 m!1110961))

(declare-fun m!1110963 () Bool)

(assert (=> b!1205583 m!1110963))

(declare-fun m!1110965 () Bool)

(assert (=> b!1205578 m!1110965))

(assert (=> b!1205578 m!1110943))

(declare-fun m!1110967 () Bool)

(assert (=> b!1205587 m!1110967))

(declare-fun m!1110969 () Bool)

(assert (=> b!1205576 m!1110969))

(declare-fun m!1110971 () Bool)

(assert (=> b!1205576 m!1110971))

(declare-fun m!1110973 () Bool)

(assert (=> b!1205576 m!1110973))

(declare-fun m!1110975 () Bool)

(assert (=> b!1205594 m!1110975))

(check-sat (not bm!58498) (not bm!58503) (not b!1205570) (not b!1205595) (not bm!58501) (not b!1205592) (not b_lambda!21311) (not b!1205576) (not b!1205569) (not b!1205573) (not b!1205590) (not b_next!25933) (not b!1205594) (not b!1205583) b_and!42829 (not b!1205575) (not b!1205591) (not b!1205585) (not mapNonEmpty!47811) tp_is_empty!30637 (not b!1205587) (not bm!58505) (not b!1205578) (not bm!58504) (not start!100756) (not b!1205580))
(check-sat b_and!42829 (not b_next!25933))
