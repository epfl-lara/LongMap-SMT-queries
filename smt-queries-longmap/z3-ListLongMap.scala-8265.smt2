; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100532 () Bool)

(assert start!100532)

(declare-fun b_free!25861 () Bool)

(declare-fun b_next!25861 () Bool)

(assert (=> start!100532 (= b_free!25861 (not b_next!25861))))

(declare-fun tp!90572 () Bool)

(declare-fun b_and!42587 () Bool)

(assert (=> start!100532 (= tp!90572 b_and!42587)))

(declare-datatypes ((V!45881 0))(
  ( (V!45882 (val!15339 Int)) )
))
(declare-fun zeroValue!944 () V!45881)

(declare-datatypes ((tuple2!19730 0))(
  ( (tuple2!19731 (_1!9876 (_ BitVec 64)) (_2!9876 V!45881)) )
))
(declare-datatypes ((List!26519 0))(
  ( (Nil!26516) (Cons!26515 (h!27724 tuple2!19730) (t!39351 List!26519)) )
))
(declare-datatypes ((ListLongMap!17699 0))(
  ( (ListLongMap!17700 (toList!8865 List!26519)) )
))
(declare-fun call!57512 () ListLongMap!17699)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14573 0))(
  ( (ValueCellFull!14573 (v!17976 V!45881)) (EmptyCell!14573) )
))
(declare-datatypes ((array!77824 0))(
  ( (array!77825 (arr!37557 (Array (_ BitVec 32) ValueCell!14573)) (size!38095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77824)

(declare-fun minValue!944 () V!45881)

(declare-datatypes ((array!77826 0))(
  ( (array!77827 (arr!37558 (Array (_ BitVec 32) (_ BitVec 64))) (size!38096 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77826)

(declare-fun bm!57506 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5312 (array!77826 array!77824 (_ BitVec 32) (_ BitVec 32) V!45881 V!45881 (_ BitVec 32) Int) ListLongMap!17699)

(assert (=> bm!57506 (= call!57512 (getCurrentListMapNoExtraKeys!5312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201629 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!682363 () Bool)

(declare-fun call!57509 () ListLongMap!17699)

(declare-fun -!1763 (ListLongMap!17699 (_ BitVec 64)) ListLongMap!17699)

(assert (=> b!1201629 (= e!682363 (= call!57509 (-!1763 call!57512 k0!934)))))

(declare-fun mapNonEmpty!47690 () Bool)

(declare-fun mapRes!47690 () Bool)

(declare-fun tp!90573 () Bool)

(declare-fun e!682358 () Bool)

(assert (=> mapNonEmpty!47690 (= mapRes!47690 (and tp!90573 e!682358))))

(declare-fun mapValue!47690 () ValueCell!14573)

(declare-fun mapRest!47690 () (Array (_ BitVec 32) ValueCell!14573))

(declare-fun mapKey!47690 () (_ BitVec 32))

(assert (=> mapNonEmpty!47690 (= (arr!37557 _values!996) (store mapRest!47690 mapKey!47690 mapValue!47690))))

(declare-fun b!1201630 () Bool)

(declare-fun e!682352 () Bool)

(declare-fun e!682350 () Bool)

(assert (=> b!1201630 (= e!682352 e!682350)))

(declare-fun res!799881 () Bool)

(assert (=> b!1201630 (=> res!799881 e!682350)))

(assert (=> b!1201630 (= res!799881 (not (= (select (arr!37558 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201630 e!682363))

(declare-fun c!117540 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201630 (= c!117540 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39690 0))(
  ( (Unit!39691) )
))
(declare-fun lt!544444 () Unit!39690)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1012 (array!77826 array!77824 (_ BitVec 32) (_ BitVec 32) V!45881 V!45881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39690)

(assert (=> b!1201630 (= lt!544444 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201631 () Bool)

(declare-fun e!682351 () Bool)

(declare-fun tp_is_empty!30565 () Bool)

(assert (=> b!1201631 (= e!682351 tp_is_empty!30565)))

(declare-fun b!1201632 () Bool)

(declare-fun e!682357 () Unit!39690)

(declare-fun Unit!39692 () Unit!39690)

(assert (=> b!1201632 (= e!682357 Unit!39692)))

(declare-fun b!1201633 () Bool)

(declare-fun res!799885 () Bool)

(declare-fun e!682354 () Bool)

(assert (=> b!1201633 (=> (not res!799885) (not e!682354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77826 (_ BitVec 32)) Bool)

(assert (=> b!1201633 (= res!799885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201634 () Bool)

(declare-fun e!682356 () Bool)

(assert (=> b!1201634 (= e!682356 e!682352)))

(declare-fun res!799887 () Bool)

(assert (=> b!1201634 (=> res!799887 e!682352)))

(assert (=> b!1201634 (= res!799887 (not (= from!1455 i!673)))))

(declare-fun lt!544442 () array!77826)

(declare-fun lt!544435 () ListLongMap!17699)

(declare-fun lt!544440 () array!77824)

(assert (=> b!1201634 (= lt!544435 (getCurrentListMapNoExtraKeys!5312 lt!544442 lt!544440 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3189 (Int (_ BitVec 64)) V!45881)

(assert (=> b!1201634 (= lt!544440 (array!77825 (store (arr!37557 _values!996) i!673 (ValueCellFull!14573 (dynLambda!3189 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38095 _values!996)))))

(declare-fun lt!544441 () ListLongMap!17699)

(assert (=> b!1201634 (= lt!544441 (getCurrentListMapNoExtraKeys!5312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201635 () Bool)

(declare-fun e!682362 () Bool)

(assert (=> b!1201635 (= e!682362 true)))

(declare-fun lt!544434 () Unit!39690)

(declare-fun e!682361 () Unit!39690)

(assert (=> b!1201635 (= lt!544434 e!682361)))

(declare-fun c!117537 () Bool)

(declare-fun lt!544432 () Bool)

(assert (=> b!1201635 (= c!117537 (and (not lt!544432) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201635 (= lt!544432 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201636 () Bool)

(assert (=> b!1201636 (= e!682358 tp_is_empty!30565)))

(declare-fun lt!544436 () ListLongMap!17699)

(declare-fun bm!57508 () Bool)

(declare-fun call!57514 () ListLongMap!17699)

(declare-fun call!57515 () Bool)

(declare-fun contains!6859 (ListLongMap!17699 (_ BitVec 64)) Bool)

(assert (=> bm!57508 (= call!57515 (contains!6859 (ite c!117537 lt!544436 call!57514) k0!934))))

(declare-fun b!1201637 () Bool)

(declare-fun e!682359 () Unit!39690)

(assert (=> b!1201637 (= e!682361 e!682359)))

(declare-fun c!117538 () Bool)

(assert (=> b!1201637 (= c!117538 (and (not lt!544432) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201638 () Bool)

(assert (=> b!1201638 (= e!682350 e!682362)))

(declare-fun res!799883 () Bool)

(assert (=> b!1201638 (=> res!799883 e!682362)))

(declare-fun lt!544433 () ListLongMap!17699)

(assert (=> b!1201638 (= res!799883 (not (contains!6859 lt!544433 k0!934)))))

(assert (=> b!1201638 (= lt!544433 (getCurrentListMapNoExtraKeys!5312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201639 () Bool)

(declare-fun res!799889 () Bool)

(assert (=> b!1201639 (=> (not res!799889) (not e!682354))))

(declare-datatypes ((List!26520 0))(
  ( (Nil!26517) (Cons!26516 (h!27725 (_ BitVec 64)) (t!39352 List!26520)) )
))
(declare-fun arrayNoDuplicates!0 (array!77826 (_ BitVec 32) List!26520) Bool)

(assert (=> b!1201639 (= res!799889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26517))))

(declare-fun bm!57509 () Bool)

(declare-fun call!57511 () ListLongMap!17699)

(assert (=> bm!57509 (= call!57514 call!57511)))

(declare-fun b!1201640 () Bool)

(declare-fun res!799877 () Bool)

(assert (=> b!1201640 (=> (not res!799877) (not e!682354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201640 (= res!799877 (validKeyInArray!0 k0!934))))

(declare-fun b!1201641 () Bool)

(declare-fun res!799880 () Bool)

(declare-fun e!682355 () Bool)

(assert (=> b!1201641 (=> (not res!799880) (not e!682355))))

(assert (=> b!1201641 (= res!799880 (arrayNoDuplicates!0 lt!544442 #b00000000000000000000000000000000 Nil!26517))))

(declare-fun b!1201642 () Bool)

(declare-fun c!117539 () Bool)

(assert (=> b!1201642 (= c!117539 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544432))))

(assert (=> b!1201642 (= e!682359 e!682357)))

(declare-fun b!1201643 () Bool)

(declare-fun lt!544439 () Unit!39690)

(assert (=> b!1201643 (= e!682361 lt!544439)))

(declare-fun lt!544437 () Unit!39690)

(declare-fun addStillContains!986 (ListLongMap!17699 (_ BitVec 64) V!45881 (_ BitVec 64)) Unit!39690)

(assert (=> b!1201643 (= lt!544437 (addStillContains!986 lt!544433 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1201643 (= lt!544436 call!57511)))

(assert (=> b!1201643 call!57515))

(declare-fun call!57516 () Unit!39690)

(assert (=> b!1201643 (= lt!544439 call!57516)))

(declare-fun +!4002 (ListLongMap!17699 tuple2!19730) ListLongMap!17699)

(assert (=> b!1201643 (contains!6859 (+!4002 lt!544436 (tuple2!19731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1201644 () Bool)

(assert (=> b!1201644 (= e!682363 (= call!57509 call!57512))))

(declare-fun bm!57510 () Bool)

(declare-fun call!57510 () Unit!39690)

(assert (=> bm!57510 (= call!57510 call!57516)))

(declare-fun b!1201645 () Bool)

(declare-fun call!57513 () Bool)

(assert (=> b!1201645 call!57513))

(declare-fun lt!544438 () Unit!39690)

(assert (=> b!1201645 (= lt!544438 call!57510)))

(assert (=> b!1201645 (= e!682359 lt!544438)))

(declare-fun res!799886 () Bool)

(assert (=> start!100532 (=> (not res!799886) (not e!682354))))

(assert (=> start!100532 (= res!799886 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38096 _keys!1208))))))

(assert (=> start!100532 e!682354))

(assert (=> start!100532 tp_is_empty!30565))

(declare-fun array_inv!28728 (array!77826) Bool)

(assert (=> start!100532 (array_inv!28728 _keys!1208)))

(assert (=> start!100532 true))

(assert (=> start!100532 tp!90572))

(declare-fun e!682353 () Bool)

(declare-fun array_inv!28729 (array!77824) Bool)

(assert (=> start!100532 (and (array_inv!28729 _values!996) e!682353)))

(declare-fun bm!57507 () Bool)

(assert (=> bm!57507 (= call!57511 (+!4002 lt!544433 (ite (or c!117537 c!117538) (tuple2!19731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!57511 () Bool)

(assert (=> bm!57511 (= call!57509 (getCurrentListMapNoExtraKeys!5312 lt!544442 lt!544440 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201646 () Bool)

(declare-fun res!799890 () Bool)

(assert (=> b!1201646 (=> (not res!799890) (not e!682354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201646 (= res!799890 (validMask!0 mask!1564))))

(declare-fun b!1201647 () Bool)

(assert (=> b!1201647 (= e!682355 (not e!682356))))

(declare-fun res!799879 () Bool)

(assert (=> b!1201647 (=> res!799879 e!682356)))

(assert (=> b!1201647 (= res!799879 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201647 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544443 () Unit!39690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77826 (_ BitVec 64) (_ BitVec 32)) Unit!39690)

(assert (=> b!1201647 (= lt!544443 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201648 () Bool)

(declare-fun res!799882 () Bool)

(assert (=> b!1201648 (=> (not res!799882) (not e!682354))))

(assert (=> b!1201648 (= res!799882 (and (= (size!38095 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38096 _keys!1208) (size!38095 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57512 () Bool)

(assert (=> bm!57512 (= call!57513 call!57515)))

(declare-fun mapIsEmpty!47690 () Bool)

(assert (=> mapIsEmpty!47690 mapRes!47690))

(declare-fun b!1201649 () Bool)

(declare-fun lt!544431 () Unit!39690)

(assert (=> b!1201649 (= e!682357 lt!544431)))

(assert (=> b!1201649 (= lt!544431 call!57510)))

(assert (=> b!1201649 call!57513))

(declare-fun b!1201650 () Bool)

(assert (=> b!1201650 (= e!682353 (and e!682351 mapRes!47690))))

(declare-fun condMapEmpty!47690 () Bool)

(declare-fun mapDefault!47690 () ValueCell!14573)

(assert (=> b!1201650 (= condMapEmpty!47690 (= (arr!37557 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14573)) mapDefault!47690)))))

(declare-fun b!1201651 () Bool)

(declare-fun res!799888 () Bool)

(assert (=> b!1201651 (=> (not res!799888) (not e!682354))))

(assert (=> b!1201651 (= res!799888 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38096 _keys!1208))))))

(declare-fun b!1201652 () Bool)

(assert (=> b!1201652 (= e!682354 e!682355)))

(declare-fun res!799878 () Bool)

(assert (=> b!1201652 (=> (not res!799878) (not e!682355))))

(assert (=> b!1201652 (= res!799878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544442 mask!1564))))

(assert (=> b!1201652 (= lt!544442 (array!77827 (store (arr!37558 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38096 _keys!1208)))))

(declare-fun b!1201653 () Bool)

(declare-fun res!799884 () Bool)

(assert (=> b!1201653 (=> (not res!799884) (not e!682354))))

(assert (=> b!1201653 (= res!799884 (= (select (arr!37558 _keys!1208) i!673) k0!934))))

(declare-fun bm!57513 () Bool)

(assert (=> bm!57513 (= call!57516 (addStillContains!986 (ite c!117537 lt!544436 lt!544433) (ite c!117537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117538 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117537 minValue!944 (ite c!117538 zeroValue!944 minValue!944)) k0!934))))

(assert (= (and start!100532 res!799886) b!1201646))

(assert (= (and b!1201646 res!799890) b!1201648))

(assert (= (and b!1201648 res!799882) b!1201633))

(assert (= (and b!1201633 res!799885) b!1201639))

(assert (= (and b!1201639 res!799889) b!1201651))

(assert (= (and b!1201651 res!799888) b!1201640))

(assert (= (and b!1201640 res!799877) b!1201653))

(assert (= (and b!1201653 res!799884) b!1201652))

(assert (= (and b!1201652 res!799878) b!1201641))

(assert (= (and b!1201641 res!799880) b!1201647))

(assert (= (and b!1201647 (not res!799879)) b!1201634))

(assert (= (and b!1201634 (not res!799887)) b!1201630))

(assert (= (and b!1201630 c!117540) b!1201629))

(assert (= (and b!1201630 (not c!117540)) b!1201644))

(assert (= (or b!1201629 b!1201644) bm!57511))

(assert (= (or b!1201629 b!1201644) bm!57506))

(assert (= (and b!1201630 (not res!799881)) b!1201638))

(assert (= (and b!1201638 (not res!799883)) b!1201635))

(assert (= (and b!1201635 c!117537) b!1201643))

(assert (= (and b!1201635 (not c!117537)) b!1201637))

(assert (= (and b!1201637 c!117538) b!1201645))

(assert (= (and b!1201637 (not c!117538)) b!1201642))

(assert (= (and b!1201642 c!117539) b!1201649))

(assert (= (and b!1201642 (not c!117539)) b!1201632))

(assert (= (or b!1201645 b!1201649) bm!57510))

(assert (= (or b!1201645 b!1201649) bm!57509))

(assert (= (or b!1201645 b!1201649) bm!57512))

(assert (= (or b!1201643 bm!57512) bm!57508))

(assert (= (or b!1201643 bm!57510) bm!57513))

(assert (= (or b!1201643 bm!57509) bm!57507))

(assert (= (and b!1201650 condMapEmpty!47690) mapIsEmpty!47690))

(assert (= (and b!1201650 (not condMapEmpty!47690)) mapNonEmpty!47690))

(get-info :version)

(assert (= (and mapNonEmpty!47690 ((_ is ValueCellFull!14573) mapValue!47690)) b!1201636))

(assert (= (and b!1201650 ((_ is ValueCellFull!14573) mapDefault!47690)) b!1201631))

(assert (= start!100532 b!1201650))

(declare-fun b_lambda!21039 () Bool)

(assert (=> (not b_lambda!21039) (not b!1201634)))

(declare-fun t!39350 () Bool)

(declare-fun tb!10653 () Bool)

(assert (=> (and start!100532 (= defaultEntry!1004 defaultEntry!1004) t!39350) tb!10653))

(declare-fun result!21891 () Bool)

(assert (=> tb!10653 (= result!21891 tp_is_empty!30565)))

(assert (=> b!1201634 t!39350))

(declare-fun b_and!42589 () Bool)

(assert (= b_and!42587 (and (=> t!39350 result!21891) b_and!42589)))

(declare-fun m!1107171 () Bool)

(assert (=> bm!57507 m!1107171))

(declare-fun m!1107173 () Bool)

(assert (=> b!1201630 m!1107173))

(declare-fun m!1107175 () Bool)

(assert (=> b!1201630 m!1107175))

(declare-fun m!1107177 () Bool)

(assert (=> mapNonEmpty!47690 m!1107177))

(declare-fun m!1107179 () Bool)

(assert (=> b!1201646 m!1107179))

(declare-fun m!1107181 () Bool)

(assert (=> b!1201638 m!1107181))

(declare-fun m!1107183 () Bool)

(assert (=> b!1201638 m!1107183))

(declare-fun m!1107185 () Bool)

(assert (=> b!1201647 m!1107185))

(declare-fun m!1107187 () Bool)

(assert (=> b!1201647 m!1107187))

(declare-fun m!1107189 () Bool)

(assert (=> b!1201643 m!1107189))

(declare-fun m!1107191 () Bool)

(assert (=> b!1201643 m!1107191))

(assert (=> b!1201643 m!1107191))

(declare-fun m!1107193 () Bool)

(assert (=> b!1201643 m!1107193))

(declare-fun m!1107195 () Bool)

(assert (=> b!1201653 m!1107195))

(declare-fun m!1107197 () Bool)

(assert (=> start!100532 m!1107197))

(declare-fun m!1107199 () Bool)

(assert (=> start!100532 m!1107199))

(declare-fun m!1107201 () Bool)

(assert (=> b!1201629 m!1107201))

(declare-fun m!1107203 () Bool)

(assert (=> b!1201639 m!1107203))

(assert (=> bm!57506 m!1107183))

(declare-fun m!1107205 () Bool)

(assert (=> bm!57508 m!1107205))

(declare-fun m!1107207 () Bool)

(assert (=> bm!57513 m!1107207))

(declare-fun m!1107209 () Bool)

(assert (=> bm!57511 m!1107209))

(declare-fun m!1107211 () Bool)

(assert (=> b!1201634 m!1107211))

(declare-fun m!1107213 () Bool)

(assert (=> b!1201634 m!1107213))

(declare-fun m!1107215 () Bool)

(assert (=> b!1201634 m!1107215))

(declare-fun m!1107217 () Bool)

(assert (=> b!1201634 m!1107217))

(declare-fun m!1107219 () Bool)

(assert (=> b!1201641 m!1107219))

(declare-fun m!1107221 () Bool)

(assert (=> b!1201633 m!1107221))

(declare-fun m!1107223 () Bool)

(assert (=> b!1201640 m!1107223))

(declare-fun m!1107225 () Bool)

(assert (=> b!1201652 m!1107225))

(declare-fun m!1107227 () Bool)

(assert (=> b!1201652 m!1107227))

(check-sat (not b!1201630) (not b!1201640) (not b!1201641) (not b!1201647) (not b_next!25861) (not mapNonEmpty!47690) b_and!42589 (not b!1201639) (not bm!57506) (not b!1201652) (not bm!57511) (not start!100532) (not bm!57508) (not b!1201638) (not bm!57507) (not b!1201646) (not b!1201629) (not b!1201634) (not b!1201633) (not b!1201643) (not bm!57513) tp_is_empty!30565 (not b_lambda!21039))
(check-sat b_and!42589 (not b_next!25861))
