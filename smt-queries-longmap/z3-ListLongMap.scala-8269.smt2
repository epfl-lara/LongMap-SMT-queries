; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100564 () Bool)

(assert start!100564)

(declare-fun b_free!25887 () Bool)

(declare-fun b_next!25887 () Bool)

(assert (=> start!100564 (= b_free!25887 (not b_next!25887))))

(declare-fun tp!90650 () Bool)

(declare-fun b_and!42661 () Bool)

(assert (=> start!100564 (= tp!90650 b_and!42661)))

(declare-fun b!1202754 () Bool)

(declare-datatypes ((Unit!39873 0))(
  ( (Unit!39874) )
))
(declare-fun e!682979 () Unit!39873)

(declare-fun lt!545181 () Unit!39873)

(assert (=> b!1202754 (= e!682979 lt!545181)))

(declare-fun call!57847 () Unit!39873)

(assert (=> b!1202754 (= lt!545181 call!57847)))

(declare-fun call!57848 () Bool)

(assert (=> b!1202754 call!57848))

(declare-fun b!1202755 () Bool)

(declare-fun e!682987 () Bool)

(declare-fun tp_is_empty!30591 () Bool)

(assert (=> b!1202755 (= e!682987 tp_is_empty!30591)))

(declare-fun b!1202756 () Bool)

(declare-fun e!682974 () Bool)

(declare-fun e!682978 () Bool)

(assert (=> b!1202756 (= e!682974 e!682978)))

(declare-fun res!800497 () Bool)

(assert (=> b!1202756 (=> res!800497 e!682978)))

(declare-datatypes ((V!45915 0))(
  ( (V!45916 (val!15352 Int)) )
))
(declare-datatypes ((tuple2!19676 0))(
  ( (tuple2!19677 (_1!9849 (_ BitVec 64)) (_2!9849 V!45915)) )
))
(declare-datatypes ((List!26487 0))(
  ( (Nil!26484) (Cons!26483 (h!27692 tuple2!19676) (t!39354 List!26487)) )
))
(declare-datatypes ((ListLongMap!17645 0))(
  ( (ListLongMap!17646 (toList!8838 List!26487)) )
))
(declare-fun lt!545174 () ListLongMap!17645)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6893 (ListLongMap!17645 (_ BitVec 64)) Bool)

(assert (=> b!1202756 (= res!800497 (not (contains!6893 lt!545174 k0!934)))))

(declare-fun zeroValue!944 () V!45915)

(declare-datatypes ((array!77955 0))(
  ( (array!77956 (arr!37622 (Array (_ BitVec 32) (_ BitVec 64))) (size!38158 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77955)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45915)

(declare-datatypes ((ValueCell!14586 0))(
  ( (ValueCellFull!14586 (v!17990 V!45915)) (EmptyCell!14586) )
))
(declare-datatypes ((array!77957 0))(
  ( (array!77958 (arr!37623 (Array (_ BitVec 32) ValueCell!14586)) (size!38159 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77957)

(declare-fun getCurrentListMapNoExtraKeys!5274 (array!77955 array!77957 (_ BitVec 32) (_ BitVec 32) V!45915 V!45915 (_ BitVec 32) Int) ListLongMap!17645)

(assert (=> b!1202756 (= lt!545174 (getCurrentListMapNoExtraKeys!5274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57851 () ListLongMap!17645)

(declare-fun bm!57841 () Bool)

(assert (=> bm!57841 (= call!57851 (getCurrentListMapNoExtraKeys!5274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545178 () array!77955)

(declare-fun call!57845 () ListLongMap!17645)

(declare-fun lt!545175 () array!77957)

(declare-fun bm!57842 () Bool)

(assert (=> bm!57842 (= call!57845 (getCurrentListMapNoExtraKeys!5274 lt!545178 lt!545175 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202757 () Bool)

(declare-fun res!800496 () Bool)

(declare-fun e!682986 () Bool)

(assert (=> b!1202757 (=> (not res!800496) (not e!682986))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202757 (= res!800496 (= (select (arr!37622 _keys!1208) i!673) k0!934))))

(declare-fun b!1202758 () Bool)

(declare-fun Unit!39875 () Unit!39873)

(assert (=> b!1202758 (= e!682979 Unit!39875)))

(declare-fun call!57844 () Unit!39873)

(declare-fun bm!57843 () Bool)

(declare-fun c!117722 () Bool)

(declare-fun c!117719 () Bool)

(declare-fun addStillContains!994 (ListLongMap!17645 (_ BitVec 64) V!45915 (_ BitVec 64)) Unit!39873)

(assert (=> bm!57843 (= call!57844 (addStillContains!994 lt!545174 (ite (or c!117722 c!117719) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117722 c!117719) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1202759 () Bool)

(declare-fun e!682975 () Unit!39873)

(declare-fun e!682982 () Unit!39873)

(assert (=> b!1202759 (= e!682975 e!682982)))

(declare-fun lt!545180 () Bool)

(assert (=> b!1202759 (= c!117719 (and (not lt!545180) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202760 () Bool)

(assert (=> b!1202760 (= e!682978 true)))

(declare-fun lt!545179 () Unit!39873)

(assert (=> b!1202760 (= lt!545179 e!682975)))

(assert (=> b!1202760 (= c!117722 (and (not lt!545180) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202760 (= lt!545180 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202761 () Bool)

(declare-fun res!800494 () Bool)

(assert (=> b!1202761 (=> (not res!800494) (not e!682986))))

(assert (=> b!1202761 (= res!800494 (and (= (size!38159 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38158 _keys!1208) (size!38159 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202762 () Bool)

(declare-fun res!800492 () Bool)

(assert (=> b!1202762 (=> (not res!800492) (not e!682986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77955 (_ BitVec 32)) Bool)

(assert (=> b!1202762 (= res!800492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202763 () Bool)

(declare-fun res!800498 () Bool)

(assert (=> b!1202763 (=> (not res!800498) (not e!682986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202763 (= res!800498 (validKeyInArray!0 k0!934))))

(declare-fun b!1202764 () Bool)

(declare-fun e!682981 () Bool)

(assert (=> b!1202764 (= e!682986 e!682981)))

(declare-fun res!800501 () Bool)

(assert (=> b!1202764 (=> (not res!800501) (not e!682981))))

(assert (=> b!1202764 (= res!800501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545178 mask!1564))))

(assert (=> b!1202764 (= lt!545178 (array!77956 (store (arr!37622 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38158 _keys!1208)))))

(declare-fun call!57850 () ListLongMap!17645)

(declare-fun lt!545170 () ListLongMap!17645)

(declare-fun bm!57844 () Bool)

(declare-fun +!3965 (ListLongMap!17645 tuple2!19676) ListLongMap!17645)

(assert (=> bm!57844 (= call!57850 (+!3965 (ite c!117722 lt!545170 lt!545174) (ite c!117722 (tuple2!19677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117719 (tuple2!19677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202765 () Bool)

(declare-fun e!682980 () Bool)

(assert (=> b!1202765 (= e!682980 (= call!57845 call!57851))))

(declare-fun b!1202766 () Bool)

(declare-fun e!682977 () Bool)

(assert (=> b!1202766 (= e!682977 e!682974)))

(declare-fun res!800495 () Bool)

(assert (=> b!1202766 (=> res!800495 e!682974)))

(assert (=> b!1202766 (= res!800495 (not (= (select (arr!37622 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202766 e!682980))

(declare-fun c!117721 () Bool)

(assert (=> b!1202766 (= c!117721 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545177 () Unit!39873)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1011 (array!77955 array!77957 (_ BitVec 32) (_ BitVec 32) V!45915 V!45915 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39873)

(assert (=> b!1202766 (= lt!545177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1011 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202767 () Bool)

(declare-fun res!800502 () Bool)

(assert (=> b!1202767 (=> (not res!800502) (not e!682986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202767 (= res!800502 (validMask!0 mask!1564))))

(declare-fun bm!57845 () Bool)

(assert (=> bm!57845 (= call!57847 call!57844)))

(declare-fun b!1202768 () Bool)

(declare-fun lt!545172 () Unit!39873)

(assert (=> b!1202768 (= e!682975 lt!545172)))

(declare-fun lt!545182 () Unit!39873)

(assert (=> b!1202768 (= lt!545182 call!57844)))

(assert (=> b!1202768 (= lt!545170 (+!3965 lt!545174 (tuple2!19677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57846 () Bool)

(assert (=> b!1202768 call!57846))

(assert (=> b!1202768 (= lt!545172 (addStillContains!994 lt!545170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1202768 (contains!6893 call!57850 k0!934)))

(declare-fun mapNonEmpty!47729 () Bool)

(declare-fun mapRes!47729 () Bool)

(declare-fun tp!90651 () Bool)

(assert (=> mapNonEmpty!47729 (= mapRes!47729 (and tp!90651 e!682987))))

(declare-fun mapValue!47729 () ValueCell!14586)

(declare-fun mapKey!47729 () (_ BitVec 32))

(declare-fun mapRest!47729 () (Array (_ BitVec 32) ValueCell!14586))

(assert (=> mapNonEmpty!47729 (= (arr!37623 _values!996) (store mapRest!47729 mapKey!47729 mapValue!47729))))

(declare-fun b!1202769 () Bool)

(declare-fun e!682985 () Bool)

(assert (=> b!1202769 (= e!682981 (not e!682985))))

(declare-fun res!800500 () Bool)

(assert (=> b!1202769 (=> res!800500 e!682985)))

(assert (=> b!1202769 (= res!800500 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202769 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545176 () Unit!39873)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77955 (_ BitVec 64) (_ BitVec 32)) Unit!39873)

(assert (=> b!1202769 (= lt!545176 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202770 () Bool)

(declare-fun -!1805 (ListLongMap!17645 (_ BitVec 64)) ListLongMap!17645)

(assert (=> b!1202770 (= e!682980 (= call!57845 (-!1805 call!57851 k0!934)))))

(declare-fun b!1202771 () Bool)

(declare-fun res!800493 () Bool)

(assert (=> b!1202771 (=> (not res!800493) (not e!682986))))

(assert (=> b!1202771 (= res!800493 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38158 _keys!1208))))))

(declare-fun bm!57846 () Bool)

(declare-fun call!57849 () ListLongMap!17645)

(assert (=> bm!57846 (= call!57849 call!57850)))

(declare-fun res!800490 () Bool)

(assert (=> start!100564 (=> (not res!800490) (not e!682986))))

(assert (=> start!100564 (= res!800490 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38158 _keys!1208))))))

(assert (=> start!100564 e!682986))

(assert (=> start!100564 tp_is_empty!30591))

(declare-fun array_inv!28666 (array!77955) Bool)

(assert (=> start!100564 (array_inv!28666 _keys!1208)))

(assert (=> start!100564 true))

(assert (=> start!100564 tp!90650))

(declare-fun e!682983 () Bool)

(declare-fun array_inv!28667 (array!77957) Bool)

(assert (=> start!100564 (and (array_inv!28667 _values!996) e!682983)))

(declare-fun b!1202772 () Bool)

(declare-fun e!682984 () Bool)

(assert (=> b!1202772 (= e!682983 (and e!682984 mapRes!47729))))

(declare-fun condMapEmpty!47729 () Bool)

(declare-fun mapDefault!47729 () ValueCell!14586)

(assert (=> b!1202772 (= condMapEmpty!47729 (= (arr!37623 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14586)) mapDefault!47729)))))

(declare-fun mapIsEmpty!47729 () Bool)

(assert (=> mapIsEmpty!47729 mapRes!47729))

(declare-fun b!1202773 () Bool)

(assert (=> b!1202773 call!57848))

(declare-fun lt!545171 () Unit!39873)

(assert (=> b!1202773 (= lt!545171 call!57847)))

(assert (=> b!1202773 (= e!682982 lt!545171)))

(declare-fun b!1202774 () Bool)

(assert (=> b!1202774 (= e!682984 tp_is_empty!30591)))

(declare-fun b!1202775 () Bool)

(declare-fun res!800491 () Bool)

(assert (=> b!1202775 (=> (not res!800491) (not e!682986))))

(declare-datatypes ((List!26488 0))(
  ( (Nil!26485) (Cons!26484 (h!27693 (_ BitVec 64)) (t!39355 List!26488)) )
))
(declare-fun arrayNoDuplicates!0 (array!77955 (_ BitVec 32) List!26488) Bool)

(assert (=> b!1202775 (= res!800491 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26485))))

(declare-fun bm!57847 () Bool)

(assert (=> bm!57847 (= call!57848 call!57846)))

(declare-fun bm!57848 () Bool)

(assert (=> bm!57848 (= call!57846 (contains!6893 (ite c!117722 lt!545170 call!57849) k0!934))))

(declare-fun b!1202776 () Bool)

(declare-fun res!800489 () Bool)

(assert (=> b!1202776 (=> (not res!800489) (not e!682981))))

(assert (=> b!1202776 (= res!800489 (arrayNoDuplicates!0 lt!545178 #b00000000000000000000000000000000 Nil!26485))))

(declare-fun b!1202777 () Bool)

(declare-fun c!117720 () Bool)

(assert (=> b!1202777 (= c!117720 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545180))))

(assert (=> b!1202777 (= e!682982 e!682979)))

(declare-fun b!1202778 () Bool)

(assert (=> b!1202778 (= e!682985 e!682977)))

(declare-fun res!800499 () Bool)

(assert (=> b!1202778 (=> res!800499 e!682977)))

(assert (=> b!1202778 (= res!800499 (not (= from!1455 i!673)))))

(declare-fun lt!545169 () ListLongMap!17645)

(assert (=> b!1202778 (= lt!545169 (getCurrentListMapNoExtraKeys!5274 lt!545178 lt!545175 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3188 (Int (_ BitVec 64)) V!45915)

(assert (=> b!1202778 (= lt!545175 (array!77958 (store (arr!37623 _values!996) i!673 (ValueCellFull!14586 (dynLambda!3188 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38159 _values!996)))))

(declare-fun lt!545173 () ListLongMap!17645)

(assert (=> b!1202778 (= lt!545173 (getCurrentListMapNoExtraKeys!5274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100564 res!800490) b!1202767))

(assert (= (and b!1202767 res!800502) b!1202761))

(assert (= (and b!1202761 res!800494) b!1202762))

(assert (= (and b!1202762 res!800492) b!1202775))

(assert (= (and b!1202775 res!800491) b!1202771))

(assert (= (and b!1202771 res!800493) b!1202763))

(assert (= (and b!1202763 res!800498) b!1202757))

(assert (= (and b!1202757 res!800496) b!1202764))

(assert (= (and b!1202764 res!800501) b!1202776))

(assert (= (and b!1202776 res!800489) b!1202769))

(assert (= (and b!1202769 (not res!800500)) b!1202778))

(assert (= (and b!1202778 (not res!800499)) b!1202766))

(assert (= (and b!1202766 c!117721) b!1202770))

(assert (= (and b!1202766 (not c!117721)) b!1202765))

(assert (= (or b!1202770 b!1202765) bm!57842))

(assert (= (or b!1202770 b!1202765) bm!57841))

(assert (= (and b!1202766 (not res!800495)) b!1202756))

(assert (= (and b!1202756 (not res!800497)) b!1202760))

(assert (= (and b!1202760 c!117722) b!1202768))

(assert (= (and b!1202760 (not c!117722)) b!1202759))

(assert (= (and b!1202759 c!117719) b!1202773))

(assert (= (and b!1202759 (not c!117719)) b!1202777))

(assert (= (and b!1202777 c!117720) b!1202754))

(assert (= (and b!1202777 (not c!117720)) b!1202758))

(assert (= (or b!1202773 b!1202754) bm!57845))

(assert (= (or b!1202773 b!1202754) bm!57846))

(assert (= (or b!1202773 b!1202754) bm!57847))

(assert (= (or b!1202768 bm!57847) bm!57848))

(assert (= (or b!1202768 bm!57845) bm!57843))

(assert (= (or b!1202768 bm!57846) bm!57844))

(assert (= (and b!1202772 condMapEmpty!47729) mapIsEmpty!47729))

(assert (= (and b!1202772 (not condMapEmpty!47729)) mapNonEmpty!47729))

(get-info :version)

(assert (= (and mapNonEmpty!47729 ((_ is ValueCellFull!14586) mapValue!47729)) b!1202755))

(assert (= (and b!1202772 ((_ is ValueCellFull!14586) mapDefault!47729)) b!1202774))

(assert (= start!100564 b!1202772))

(declare-fun b_lambda!21083 () Bool)

(assert (=> (not b_lambda!21083) (not b!1202778)))

(declare-fun t!39353 () Bool)

(declare-fun tb!10687 () Bool)

(assert (=> (and start!100564 (= defaultEntry!1004 defaultEntry!1004) t!39353) tb!10687))

(declare-fun result!21951 () Bool)

(assert (=> tb!10687 (= result!21951 tp_is_empty!30591)))

(assert (=> b!1202778 t!39353))

(declare-fun b_and!42663 () Bool)

(assert (= b_and!42661 (and (=> t!39353 result!21951) b_and!42663)))

(declare-fun m!1108535 () Bool)

(assert (=> bm!57842 m!1108535))

(declare-fun m!1108537 () Bool)

(assert (=> b!1202767 m!1108537))

(declare-fun m!1108539 () Bool)

(assert (=> b!1202762 m!1108539))

(declare-fun m!1108541 () Bool)

(assert (=> mapNonEmpty!47729 m!1108541))

(declare-fun m!1108543 () Bool)

(assert (=> b!1202757 m!1108543))

(declare-fun m!1108545 () Bool)

(assert (=> b!1202770 m!1108545))

(declare-fun m!1108547 () Bool)

(assert (=> b!1202756 m!1108547))

(declare-fun m!1108549 () Bool)

(assert (=> b!1202756 m!1108549))

(assert (=> bm!57841 m!1108549))

(declare-fun m!1108551 () Bool)

(assert (=> b!1202778 m!1108551))

(declare-fun m!1108553 () Bool)

(assert (=> b!1202778 m!1108553))

(declare-fun m!1108555 () Bool)

(assert (=> b!1202778 m!1108555))

(declare-fun m!1108557 () Bool)

(assert (=> b!1202778 m!1108557))

(declare-fun m!1108559 () Bool)

(assert (=> bm!57844 m!1108559))

(declare-fun m!1108561 () Bool)

(assert (=> b!1202763 m!1108561))

(declare-fun m!1108563 () Bool)

(assert (=> bm!57843 m!1108563))

(declare-fun m!1108565 () Bool)

(assert (=> bm!57848 m!1108565))

(declare-fun m!1108567 () Bool)

(assert (=> b!1202769 m!1108567))

(declare-fun m!1108569 () Bool)

(assert (=> b!1202769 m!1108569))

(declare-fun m!1108571 () Bool)

(assert (=> b!1202768 m!1108571))

(declare-fun m!1108573 () Bool)

(assert (=> b!1202768 m!1108573))

(declare-fun m!1108575 () Bool)

(assert (=> b!1202768 m!1108575))

(declare-fun m!1108577 () Bool)

(assert (=> b!1202775 m!1108577))

(declare-fun m!1108579 () Bool)

(assert (=> b!1202764 m!1108579))

(declare-fun m!1108581 () Bool)

(assert (=> b!1202764 m!1108581))

(declare-fun m!1108583 () Bool)

(assert (=> b!1202776 m!1108583))

(declare-fun m!1108585 () Bool)

(assert (=> b!1202766 m!1108585))

(declare-fun m!1108587 () Bool)

(assert (=> b!1202766 m!1108587))

(declare-fun m!1108589 () Bool)

(assert (=> start!100564 m!1108589))

(declare-fun m!1108591 () Bool)

(assert (=> start!100564 m!1108591))

(check-sat (not bm!57844) (not b_next!25887) (not b!1202768) (not b!1202766) b_and!42663 (not b!1202764) (not b_lambda!21083) (not start!100564) (not mapNonEmpty!47729) (not bm!57843) (not bm!57841) (not b!1202775) (not b!1202776) (not b!1202767) tp_is_empty!30591 (not b!1202763) (not b!1202762) (not b!1202756) (not b!1202778) (not bm!57842) (not b!1202769) (not b!1202770) (not bm!57848))
(check-sat b_and!42663 (not b_next!25887))
