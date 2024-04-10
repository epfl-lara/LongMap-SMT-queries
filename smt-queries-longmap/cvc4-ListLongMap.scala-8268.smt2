; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100560 () Bool)

(assert start!100560)

(declare-fun b_free!25883 () Bool)

(declare-fun b_next!25883 () Bool)

(assert (=> start!100560 (= b_free!25883 (not b_next!25883))))

(declare-fun tp!90639 () Bool)

(declare-fun b_and!42653 () Bool)

(assert (=> start!100560 (= tp!90639 b_and!42653)))

(declare-fun bm!57793 () Bool)

(declare-fun call!57799 () Bool)

(declare-fun call!57801 () Bool)

(assert (=> bm!57793 (= call!57799 call!57801)))

(declare-fun b!1202600 () Bool)

(declare-datatypes ((Unit!39868 0))(
  ( (Unit!39869) )
))
(declare-fun e!682903 () Unit!39868)

(declare-fun lt!545094 () Unit!39868)

(assert (=> b!1202600 (= e!682903 lt!545094)))

(declare-fun lt!545093 () Unit!39868)

(declare-fun call!57798 () Unit!39868)

(assert (=> b!1202600 (= lt!545093 call!57798)))

(declare-datatypes ((V!45909 0))(
  ( (V!45910 (val!15350 Int)) )
))
(declare-datatypes ((tuple2!19672 0))(
  ( (tuple2!19673 (_1!9847 (_ BitVec 64)) (_2!9847 V!45909)) )
))
(declare-datatypes ((List!26483 0))(
  ( (Nil!26480) (Cons!26479 (h!27688 tuple2!19672) (t!39346 List!26483)) )
))
(declare-datatypes ((ListLongMap!17641 0))(
  ( (ListLongMap!17642 (toList!8836 List!26483)) )
))
(declare-fun lt!545086 () ListLongMap!17641)

(declare-fun call!57800 () ListLongMap!17641)

(assert (=> b!1202600 (= lt!545086 call!57800)))

(assert (=> b!1202600 call!57801))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!45909)

(declare-fun addStillContains!992 (ListLongMap!17641 (_ BitVec 64) V!45909 (_ BitVec 64)) Unit!39868)

(assert (=> b!1202600 (= lt!545094 (addStillContains!992 lt!545086 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6891 (ListLongMap!17641 (_ BitVec 64)) Bool)

(declare-fun +!3964 (ListLongMap!17641 tuple2!19672) ListLongMap!17641)

(assert (=> b!1202600 (contains!6891 (+!3964 lt!545086 (tuple2!19673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1202601 () Bool)

(declare-fun e!682900 () Bool)

(declare-fun e!682898 () Bool)

(assert (=> b!1202601 (= e!682900 e!682898)))

(declare-fun res!800414 () Bool)

(assert (=> b!1202601 (=> res!800414 e!682898)))

(declare-datatypes ((array!77947 0))(
  ( (array!77948 (arr!37618 (Array (_ BitVec 32) (_ BitVec 64))) (size!38154 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77947)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1202601 (= res!800414 (not (= (select (arr!37618 _keys!1208) from!1455) k!934)))))

(declare-fun e!682902 () Bool)

(assert (=> b!1202601 e!682902))

(declare-fun c!117696 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202601 (= c!117696 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45909)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14584 0))(
  ( (ValueCellFull!14584 (v!17988 V!45909)) (EmptyCell!14584) )
))
(declare-datatypes ((array!77949 0))(
  ( (array!77950 (arr!37619 (Array (_ BitVec 32) ValueCell!14584)) (size!38155 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77949)

(declare-fun lt!545097 () Unit!39868)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1009 (array!77947 array!77949 (_ BitVec 32) (_ BitVec 32) V!45909 V!45909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39868)

(assert (=> b!1202601 (= lt!545097 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1009 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57794 () Bool)

(declare-fun call!57802 () ListLongMap!17641)

(declare-fun c!117695 () Bool)

(assert (=> bm!57794 (= call!57801 (contains!6891 (ite c!117695 lt!545086 call!57802) k!934))))

(declare-fun bm!57795 () Bool)

(assert (=> bm!57795 (= call!57802 call!57800)))

(declare-fun b!1202602 () Bool)

(declare-fun e!682895 () Unit!39868)

(assert (=> b!1202602 (= e!682903 e!682895)))

(declare-fun c!117697 () Bool)

(declare-fun lt!545096 () Bool)

(assert (=> b!1202602 (= c!117697 (and (not lt!545096) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202603 () Bool)

(declare-fun e!682896 () Bool)

(declare-fun e!682893 () Bool)

(assert (=> b!1202603 (= e!682896 (not e!682893))))

(declare-fun res!800405 () Bool)

(assert (=> b!1202603 (=> res!800405 e!682893)))

(assert (=> b!1202603 (= res!800405 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202603 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!545098 () Unit!39868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77947 (_ BitVec 64) (_ BitVec 32)) Unit!39868)

(assert (=> b!1202603 (= lt!545098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun lt!545089 () ListLongMap!17641)

(declare-fun bm!57796 () Bool)

(assert (=> bm!57796 (= call!57798 (addStillContains!992 lt!545089 (ite (or c!117695 c!117697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117695 c!117697) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1202604 () Bool)

(declare-fun e!682894 () Unit!39868)

(declare-fun Unit!39870 () Unit!39868)

(assert (=> b!1202604 (= e!682894 Unit!39870)))

(declare-fun res!800410 () Bool)

(declare-fun e!682891 () Bool)

(assert (=> start!100560 (=> (not res!800410) (not e!682891))))

(assert (=> start!100560 (= res!800410 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38154 _keys!1208))))))

(assert (=> start!100560 e!682891))

(declare-fun tp_is_empty!30587 () Bool)

(assert (=> start!100560 tp_is_empty!30587))

(declare-fun array_inv!28664 (array!77947) Bool)

(assert (=> start!100560 (array_inv!28664 _keys!1208)))

(assert (=> start!100560 true))

(assert (=> start!100560 tp!90639))

(declare-fun e!682892 () Bool)

(declare-fun array_inv!28665 (array!77949) Bool)

(assert (=> start!100560 (and (array_inv!28665 _values!996) e!682892)))

(declare-fun b!1202605 () Bool)

(declare-fun res!800412 () Bool)

(assert (=> b!1202605 (=> (not res!800412) (not e!682891))))

(assert (=> b!1202605 (= res!800412 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38154 _keys!1208))))))

(declare-fun b!1202606 () Bool)

(assert (=> b!1202606 call!57799))

(declare-fun lt!545087 () Unit!39868)

(declare-fun call!57797 () Unit!39868)

(assert (=> b!1202606 (= lt!545087 call!57797)))

(assert (=> b!1202606 (= e!682895 lt!545087)))

(declare-fun b!1202607 () Bool)

(declare-fun e!682897 () Bool)

(assert (=> b!1202607 (= e!682897 tp_is_empty!30587)))

(declare-fun mapNonEmpty!47723 () Bool)

(declare-fun mapRes!47723 () Bool)

(declare-fun tp!90638 () Bool)

(declare-fun e!682890 () Bool)

(assert (=> mapNonEmpty!47723 (= mapRes!47723 (and tp!90638 e!682890))))

(declare-fun mapRest!47723 () (Array (_ BitVec 32) ValueCell!14584))

(declare-fun mapKey!47723 () (_ BitVec 32))

(declare-fun mapValue!47723 () ValueCell!14584)

(assert (=> mapNonEmpty!47723 (= (arr!37619 _values!996) (store mapRest!47723 mapKey!47723 mapValue!47723))))

(declare-fun b!1202608 () Bool)

(declare-fun res!800411 () Bool)

(assert (=> b!1202608 (=> (not res!800411) (not e!682891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77947 (_ BitVec 32)) Bool)

(assert (=> b!1202608 (= res!800411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!545085 () array!77949)

(declare-fun lt!545091 () array!77947)

(declare-fun call!57796 () ListLongMap!17641)

(declare-fun bm!57797 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5272 (array!77947 array!77949 (_ BitVec 32) (_ BitVec 32) V!45909 V!45909 (_ BitVec 32) Int) ListLongMap!17641)

(assert (=> bm!57797 (= call!57796 (getCurrentListMapNoExtraKeys!5272 lt!545091 lt!545085 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202609 () Bool)

(declare-fun c!117698 () Bool)

(assert (=> b!1202609 (= c!117698 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545096))))

(assert (=> b!1202609 (= e!682895 e!682894)))

(declare-fun call!57803 () ListLongMap!17641)

(declare-fun bm!57798 () Bool)

(assert (=> bm!57798 (= call!57803 (getCurrentListMapNoExtraKeys!5272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202610 () Bool)

(assert (=> b!1202610 (= e!682902 (= call!57796 call!57803))))

(declare-fun b!1202611 () Bool)

(declare-fun res!800407 () Bool)

(assert (=> b!1202611 (=> (not res!800407) (not e!682891))))

(declare-datatypes ((List!26484 0))(
  ( (Nil!26481) (Cons!26480 (h!27689 (_ BitVec 64)) (t!39347 List!26484)) )
))
(declare-fun arrayNoDuplicates!0 (array!77947 (_ BitVec 32) List!26484) Bool)

(assert (=> b!1202611 (= res!800407 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26481))))

(declare-fun bm!57799 () Bool)

(assert (=> bm!57799 (= call!57800 (+!3964 lt!545089 (ite (or c!117695 c!117697) (tuple2!19673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1202612 () Bool)

(declare-fun res!800416 () Bool)

(assert (=> b!1202612 (=> (not res!800416) (not e!682891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202612 (= res!800416 (validMask!0 mask!1564))))

(declare-fun b!1202613 () Bool)

(declare-fun e!682901 () Bool)

(assert (=> b!1202613 (= e!682901 true)))

(declare-fun lt!545095 () Unit!39868)

(assert (=> b!1202613 (= lt!545095 e!682903)))

(assert (=> b!1202613 (= c!117695 (and (not lt!545096) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202613 (= lt!545096 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202614 () Bool)

(declare-fun res!800415 () Bool)

(assert (=> b!1202614 (=> (not res!800415) (not e!682891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202614 (= res!800415 (validKeyInArray!0 k!934))))

(declare-fun b!1202615 () Bool)

(declare-fun res!800406 () Bool)

(assert (=> b!1202615 (=> (not res!800406) (not e!682891))))

(assert (=> b!1202615 (= res!800406 (= (select (arr!37618 _keys!1208) i!673) k!934))))

(declare-fun b!1202616 () Bool)

(assert (=> b!1202616 (= e!682898 e!682901)))

(declare-fun res!800408 () Bool)

(assert (=> b!1202616 (=> res!800408 e!682901)))

(assert (=> b!1202616 (= res!800408 (not (contains!6891 lt!545089 k!934)))))

(assert (=> b!1202616 (= lt!545089 (getCurrentListMapNoExtraKeys!5272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202617 () Bool)

(assert (=> b!1202617 (= e!682891 e!682896)))

(declare-fun res!800417 () Bool)

(assert (=> b!1202617 (=> (not res!800417) (not e!682896))))

(assert (=> b!1202617 (= res!800417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545091 mask!1564))))

(assert (=> b!1202617 (= lt!545091 (array!77948 (store (arr!37618 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38154 _keys!1208)))))

(declare-fun b!1202618 () Bool)

(declare-fun lt!545090 () Unit!39868)

(assert (=> b!1202618 (= e!682894 lt!545090)))

(assert (=> b!1202618 (= lt!545090 call!57797)))

(assert (=> b!1202618 call!57799))

(declare-fun bm!57800 () Bool)

(assert (=> bm!57800 (= call!57797 call!57798)))

(declare-fun b!1202619 () Bool)

(declare-fun res!800413 () Bool)

(assert (=> b!1202619 (=> (not res!800413) (not e!682896))))

(assert (=> b!1202619 (= res!800413 (arrayNoDuplicates!0 lt!545091 #b00000000000000000000000000000000 Nil!26481))))

(declare-fun b!1202620 () Bool)

(declare-fun res!800418 () Bool)

(assert (=> b!1202620 (=> (not res!800418) (not e!682891))))

(assert (=> b!1202620 (= res!800418 (and (= (size!38155 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38154 _keys!1208) (size!38155 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202621 () Bool)

(assert (=> b!1202621 (= e!682890 tp_is_empty!30587)))

(declare-fun b!1202622 () Bool)

(assert (=> b!1202622 (= e!682892 (and e!682897 mapRes!47723))))

(declare-fun condMapEmpty!47723 () Bool)

(declare-fun mapDefault!47723 () ValueCell!14584)

