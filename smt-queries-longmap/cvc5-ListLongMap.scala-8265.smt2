; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100538 () Bool)

(assert start!100538)

(declare-fun b_free!25861 () Bool)

(declare-fun b_next!25861 () Bool)

(assert (=> start!100538 (= b_free!25861 (not b_next!25861))))

(declare-fun tp!90572 () Bool)

(declare-fun b_and!42609 () Bool)

(assert (=> start!100538 (= tp!90572 b_and!42609)))

(declare-datatypes ((V!45881 0))(
  ( (V!45882 (val!15339 Int)) )
))
(declare-fun zeroValue!944 () V!45881)

(declare-fun c!117564 () Bool)

(declare-datatypes ((tuple2!19650 0))(
  ( (tuple2!19651 (_1!9836 (_ BitVec 64)) (_2!9836 V!45881)) )
))
(declare-datatypes ((List!26465 0))(
  ( (Nil!26462) (Cons!26461 (h!27670 tuple2!19650) (t!39306 List!26465)) )
))
(declare-datatypes ((ListLongMap!17619 0))(
  ( (ListLongMap!17620 (toList!8825 List!26465)) )
))
(declare-fun call!57538 () ListLongMap!17619)

(declare-fun lt!544625 () ListLongMap!17619)

(declare-fun lt!544624 () ListLongMap!17619)

(declare-fun c!117566 () Bool)

(declare-fun bm!57529 () Bool)

(declare-fun minValue!944 () V!45881)

(declare-fun +!3955 (ListLongMap!17619 tuple2!19650) ListLongMap!17619)

(assert (=> bm!57529 (= call!57538 (+!3955 (ite c!117564 lt!544625 lt!544624) (ite c!117564 (tuple2!19651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117566 (tuple2!19651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1201753 () Bool)

(declare-fun e!682434 () Bool)

(declare-fun e!682440 () Bool)

(assert (=> b!1201753 (= e!682434 e!682440)))

(declare-fun res!799955 () Bool)

(assert (=> b!1201753 (=> res!799955 e!682440)))

(declare-datatypes ((array!77903 0))(
  ( (array!77904 (arr!37596 (Array (_ BitVec 32) (_ BitVec 64))) (size!38132 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77903)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1201753 (= res!799955 (not (= (select (arr!37596 _keys!1208) from!1455) k!934)))))

(declare-fun e!682433 () Bool)

(assert (=> b!1201753 e!682433))

(declare-fun c!117563 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201753 (= c!117563 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14573 0))(
  ( (ValueCellFull!14573 (v!17977 V!45881)) (EmptyCell!14573) )
))
(declare-datatypes ((array!77905 0))(
  ( (array!77906 (arr!37597 (Array (_ BitVec 32) ValueCell!14573)) (size!38133 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77905)

(declare-datatypes ((Unit!39842 0))(
  ( (Unit!39843) )
))
(declare-fun lt!544633 () Unit!39842)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1002 (array!77903 array!77905 (_ BitVec 32) (_ BitVec 32) V!45881 V!45881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39842)

(assert (=> b!1201753 (= lt!544633 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1002 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201754 () Bool)

(declare-fun e!682435 () Bool)

(assert (=> b!1201754 (= e!682440 e!682435)))

(declare-fun res!799947 () Bool)

(assert (=> b!1201754 (=> res!799947 e!682435)))

(declare-fun contains!6882 (ListLongMap!17619 (_ BitVec 64)) Bool)

(assert (=> b!1201754 (= res!799947 (not (contains!6882 lt!544624 k!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5263 (array!77903 array!77905 (_ BitVec 32) (_ BitVec 32) V!45881 V!45881 (_ BitVec 32) Int) ListLongMap!17619)

(assert (=> b!1201754 (= lt!544624 (getCurrentListMapNoExtraKeys!5263 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201755 () Bool)

(declare-fun res!799953 () Bool)

(declare-fun e!682438 () Bool)

(assert (=> b!1201755 (=> (not res!799953) (not e!682438))))

(assert (=> b!1201755 (= res!799953 (and (= (size!38133 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38132 _keys!1208) (size!38133 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201756 () Bool)

(declare-fun call!57532 () ListLongMap!17619)

(declare-fun call!57533 () ListLongMap!17619)

(assert (=> b!1201756 (= e!682433 (= call!57532 call!57533))))

(declare-fun lt!544632 () array!77905)

(declare-fun lt!544623 () array!77903)

(declare-fun bm!57530 () Bool)

(assert (=> bm!57530 (= call!57532 (getCurrentListMapNoExtraKeys!5263 lt!544623 lt!544632 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57531 () Bool)

(declare-fun call!57539 () Bool)

(declare-fun call!57535 () Bool)

(assert (=> bm!57531 (= call!57539 call!57535)))

(declare-fun b!1201757 () Bool)

(declare-fun res!799945 () Bool)

(assert (=> b!1201757 (=> (not res!799945) (not e!682438))))

(assert (=> b!1201757 (= res!799945 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38132 _keys!1208))))))

(declare-fun b!1201758 () Bool)

(declare-fun res!799949 () Bool)

(assert (=> b!1201758 (=> (not res!799949) (not e!682438))))

(declare-datatypes ((List!26466 0))(
  ( (Nil!26463) (Cons!26462 (h!27671 (_ BitVec 64)) (t!39307 List!26466)) )
))
(declare-fun arrayNoDuplicates!0 (array!77903 (_ BitVec 32) List!26466) Bool)

(assert (=> b!1201758 (= res!799949 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26463))))

(declare-fun bm!57533 () Bool)

(declare-fun call!57537 () Unit!39842)

(declare-fun call!57536 () Unit!39842)

(assert (=> bm!57533 (= call!57537 call!57536)))

(declare-fun bm!57534 () Bool)

(declare-fun call!57534 () ListLongMap!17619)

(assert (=> bm!57534 (= call!57534 call!57538)))

(declare-fun bm!57535 () Bool)

(assert (=> bm!57535 (= call!57535 (contains!6882 (ite c!117564 lt!544625 call!57534) k!934))))

(declare-fun b!1201759 () Bool)

(declare-fun -!1797 (ListLongMap!17619 (_ BitVec 64)) ListLongMap!17619)

(assert (=> b!1201759 (= e!682433 (= call!57532 (-!1797 call!57533 k!934)))))

(declare-fun b!1201760 () Bool)

(declare-fun e!682441 () Bool)

(declare-fun tp_is_empty!30565 () Bool)

(assert (=> b!1201760 (= e!682441 tp_is_empty!30565)))

(declare-fun b!1201761 () Bool)

(declare-fun e!682432 () Bool)

(assert (=> b!1201761 (= e!682438 e!682432)))

(declare-fun res!799946 () Bool)

(assert (=> b!1201761 (=> (not res!799946) (not e!682432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77903 (_ BitVec 32)) Bool)

(assert (=> b!1201761 (= res!799946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544623 mask!1564))))

(assert (=> b!1201761 (= lt!544623 (array!77904 (store (arr!37596 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38132 _keys!1208)))))

(declare-fun mapNonEmpty!47690 () Bool)

(declare-fun mapRes!47690 () Bool)

(declare-fun tp!90573 () Bool)

(declare-fun e!682436 () Bool)

(assert (=> mapNonEmpty!47690 (= mapRes!47690 (and tp!90573 e!682436))))

(declare-fun mapValue!47690 () ValueCell!14573)

(declare-fun mapRest!47690 () (Array (_ BitVec 32) ValueCell!14573))

(declare-fun mapKey!47690 () (_ BitVec 32))

(assert (=> mapNonEmpty!47690 (= (arr!37597 _values!996) (store mapRest!47690 mapKey!47690 mapValue!47690))))

(declare-fun b!1201762 () Bool)

(assert (=> b!1201762 call!57539))

(declare-fun lt!544628 () Unit!39842)

(assert (=> b!1201762 (= lt!544628 call!57537)))

(declare-fun e!682439 () Unit!39842)

(assert (=> b!1201762 (= e!682439 lt!544628)))

(declare-fun b!1201763 () Bool)

(declare-fun res!799956 () Bool)

(assert (=> b!1201763 (=> (not res!799956) (not e!682438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201763 (= res!799956 (validKeyInArray!0 k!934))))

(declare-fun b!1201764 () Bool)

(assert (=> b!1201764 (= e!682435 true)))

(declare-fun lt!544635 () Unit!39842)

(declare-fun e!682431 () Unit!39842)

(assert (=> b!1201764 (= lt!544635 e!682431)))

(declare-fun lt!544627 () Bool)

(assert (=> b!1201764 (= c!117564 (and (not lt!544627) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201764 (= lt!544627 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201765 () Bool)

(declare-fun res!799950 () Bool)

(assert (=> b!1201765 (=> (not res!799950) (not e!682438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201765 (= res!799950 (validMask!0 mask!1564))))

(declare-fun b!1201766 () Bool)

(declare-fun c!117565 () Bool)

(assert (=> b!1201766 (= c!117565 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544627))))

(declare-fun e!682429 () Unit!39842)

(assert (=> b!1201766 (= e!682439 e!682429)))

(declare-fun mapIsEmpty!47690 () Bool)

(assert (=> mapIsEmpty!47690 mapRes!47690))

(declare-fun b!1201767 () Bool)

(declare-fun res!799951 () Bool)

(assert (=> b!1201767 (=> (not res!799951) (not e!682432))))

(assert (=> b!1201767 (= res!799951 (arrayNoDuplicates!0 lt!544623 #b00000000000000000000000000000000 Nil!26463))))

(declare-fun b!1201768 () Bool)

(assert (=> b!1201768 (= e!682436 tp_is_empty!30565)))

(declare-fun b!1201769 () Bool)

(declare-fun res!799943 () Bool)

(assert (=> b!1201769 (=> (not res!799943) (not e!682438))))

(assert (=> b!1201769 (= res!799943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201770 () Bool)

(declare-fun lt!544631 () Unit!39842)

(assert (=> b!1201770 (= e!682429 lt!544631)))

(assert (=> b!1201770 (= lt!544631 call!57537)))

(assert (=> b!1201770 call!57539))

(declare-fun b!1201771 () Bool)

(assert (=> b!1201771 (= e!682431 e!682439)))

(assert (=> b!1201771 (= c!117566 (and (not lt!544627) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201772 () Bool)

(declare-fun lt!544629 () Unit!39842)

(assert (=> b!1201772 (= e!682431 lt!544629)))

(declare-fun lt!544636 () Unit!39842)

(assert (=> b!1201772 (= lt!544636 call!57536)))

(assert (=> b!1201772 (= lt!544625 (+!3955 lt!544624 (tuple2!19651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1201772 call!57535))

(declare-fun addStillContains!983 (ListLongMap!17619 (_ BitVec 64) V!45881 (_ BitVec 64)) Unit!39842)

(assert (=> b!1201772 (= lt!544629 (addStillContains!983 lt!544625 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1201772 (contains!6882 call!57538 k!934)))

(declare-fun b!1201773 () Bool)

(declare-fun res!799952 () Bool)

(assert (=> b!1201773 (=> (not res!799952) (not e!682438))))

(assert (=> b!1201773 (= res!799952 (= (select (arr!37596 _keys!1208) i!673) k!934))))

(declare-fun b!1201774 () Bool)

(declare-fun e!682437 () Bool)

(assert (=> b!1201774 (= e!682437 e!682434)))

(declare-fun res!799954 () Bool)

(assert (=> b!1201774 (=> res!799954 e!682434)))

(assert (=> b!1201774 (= res!799954 (not (= from!1455 i!673)))))

(declare-fun lt!544626 () ListLongMap!17619)

(assert (=> b!1201774 (= lt!544626 (getCurrentListMapNoExtraKeys!5263 lt!544623 lt!544632 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3179 (Int (_ BitVec 64)) V!45881)

(assert (=> b!1201774 (= lt!544632 (array!77906 (store (arr!37597 _values!996) i!673 (ValueCellFull!14573 (dynLambda!3179 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38133 _values!996)))))

(declare-fun lt!544634 () ListLongMap!17619)

(assert (=> b!1201774 (= lt!544634 (getCurrentListMapNoExtraKeys!5263 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!799948 () Bool)

(assert (=> start!100538 (=> (not res!799948) (not e!682438))))

(assert (=> start!100538 (= res!799948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38132 _keys!1208))))))

(assert (=> start!100538 e!682438))

(assert (=> start!100538 tp_is_empty!30565))

(declare-fun array_inv!28652 (array!77903) Bool)

(assert (=> start!100538 (array_inv!28652 _keys!1208)))

(assert (=> start!100538 true))

(assert (=> start!100538 tp!90572))

(declare-fun e!682428 () Bool)

(declare-fun array_inv!28653 (array!77905) Bool)

(assert (=> start!100538 (and (array_inv!28653 _values!996) e!682428)))

(declare-fun bm!57532 () Bool)

(assert (=> bm!57532 (= call!57536 (addStillContains!983 lt!544624 (ite (or c!117564 c!117566) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117564 c!117566) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1201775 () Bool)

(assert (=> b!1201775 (= e!682428 (and e!682441 mapRes!47690))))

(declare-fun condMapEmpty!47690 () Bool)

(declare-fun mapDefault!47690 () ValueCell!14573)

