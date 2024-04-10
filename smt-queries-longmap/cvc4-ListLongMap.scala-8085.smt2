; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99380 () Bool)

(assert start!99380)

(declare-fun b_free!24959 () Bool)

(declare-fun b_next!24959 () Bool)

(assert (=> start!99380 (= b_free!24959 (not b_next!24959))))

(declare-fun tp!87590 () Bool)

(declare-fun b_and!40785 () Bool)

(assert (=> start!99380 (= tp!87590 b_and!40785)))

(declare-fun b!1172671 () Bool)

(declare-fun e!666547 () Bool)

(declare-fun e!666542 () Bool)

(assert (=> b!1172671 (= e!666547 e!666542)))

(declare-fun res!778646 () Bool)

(assert (=> b!1172671 (=> res!778646 e!666542)))

(declare-datatypes ((array!75791 0))(
  ( (array!75792 (arr!36545 (Array (_ BitVec 32) (_ BitVec 64))) (size!37081 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75791)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172671 (= res!778646 (not (= (select (arr!36545 _keys!1208) from!1455) k!934)))))

(declare-fun e!666544 () Bool)

(assert (=> b!1172671 e!666544))

(declare-fun res!778638 () Bool)

(assert (=> b!1172671 (=> (not res!778638) (not e!666544))))

(declare-datatypes ((V!44445 0))(
  ( (V!44446 (val!14801 Int)) )
))
(declare-datatypes ((tuple2!18912 0))(
  ( (tuple2!18913 (_1!9467 (_ BitVec 64)) (_2!9467 V!44445)) )
))
(declare-datatypes ((List!25649 0))(
  ( (Nil!25646) (Cons!25645 (h!26854 tuple2!18912) (t!37600 List!25649)) )
))
(declare-datatypes ((ListLongMap!16881 0))(
  ( (ListLongMap!16882 (toList!8456 List!25649)) )
))
(declare-fun lt!528409 () ListLongMap!16881)

(declare-fun lt!528418 () V!44445)

(declare-datatypes ((ValueCell!14035 0))(
  ( (ValueCellFull!14035 (v!17439 V!44445)) (EmptyCell!14035) )
))
(declare-datatypes ((array!75793 0))(
  ( (array!75794 (arr!36546 (Array (_ BitVec 32) ValueCell!14035)) (size!37082 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75793)

(declare-fun lt!528416 () ListLongMap!16881)

(declare-fun +!3776 (ListLongMap!16881 tuple2!18912) ListLongMap!16881)

(declare-fun get!18642 (ValueCell!14035 V!44445) V!44445)

(assert (=> b!1172671 (= res!778638 (= lt!528416 (+!3776 lt!528409 (tuple2!18913 (select (arr!36545 _keys!1208) from!1455) (get!18642 (select (arr!36546 _values!996) from!1455) lt!528418)))))))

(declare-fun b!1172672 () Bool)

(declare-fun e!666540 () Bool)

(assert (=> b!1172672 (= e!666540 e!666547)))

(declare-fun res!778643 () Bool)

(assert (=> b!1172672 (=> res!778643 e!666547)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172672 (= res!778643 (not (validKeyInArray!0 (select (arr!36545 _keys!1208) from!1455))))))

(declare-fun lt!528408 () ListLongMap!16881)

(assert (=> b!1172672 (= lt!528408 lt!528409)))

(declare-fun lt!528415 () ListLongMap!16881)

(declare-fun -!1523 (ListLongMap!16881 (_ BitVec 64)) ListLongMap!16881)

(assert (=> b!1172672 (= lt!528409 (-!1523 lt!528415 k!934))))

(declare-fun zeroValue!944 () V!44445)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44445)

(declare-fun lt!528412 () array!75793)

(declare-fun lt!528413 () array!75791)

(declare-fun getCurrentListMapNoExtraKeys!4920 (array!75791 array!75793 (_ BitVec 32) (_ BitVec 32) V!44445 V!44445 (_ BitVec 32) Int) ListLongMap!16881)

(assert (=> b!1172672 (= lt!528408 (getCurrentListMapNoExtraKeys!4920 lt!528413 lt!528412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172672 (= lt!528415 (getCurrentListMapNoExtraKeys!4920 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38666 0))(
  ( (Unit!38667) )
))
(declare-fun lt!528410 () Unit!38666)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!750 (array!75791 array!75793 (_ BitVec 32) (_ BitVec 32) V!44445 V!44445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38666)

(assert (=> b!1172672 (= lt!528410 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172673 () Bool)

(declare-fun e!666545 () Bool)

(declare-fun tp_is_empty!29489 () Bool)

(assert (=> b!1172673 (= e!666545 tp_is_empty!29489)))

(declare-fun b!1172674 () Bool)

(declare-fun res!778647 () Bool)

(declare-fun e!666549 () Bool)

(assert (=> b!1172674 (=> (not res!778647) (not e!666549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172674 (= res!778647 (validMask!0 mask!1564))))

(declare-fun b!1172675 () Bool)

(declare-fun res!778637 () Bool)

(declare-fun e!666539 () Bool)

(assert (=> b!1172675 (=> (not res!778637) (not e!666539))))

(declare-datatypes ((List!25650 0))(
  ( (Nil!25647) (Cons!25646 (h!26855 (_ BitVec 64)) (t!37601 List!25650)) )
))
(declare-fun arrayNoDuplicates!0 (array!75791 (_ BitVec 32) List!25650) Bool)

(assert (=> b!1172675 (= res!778637 (arrayNoDuplicates!0 lt!528413 #b00000000000000000000000000000000 Nil!25647))))

(declare-fun b!1172676 () Bool)

(declare-fun e!666541 () Bool)

(assert (=> b!1172676 (= e!666542 e!666541)))

(declare-fun res!778641 () Bool)

(assert (=> b!1172676 (=> res!778641 e!666541)))

(assert (=> b!1172676 (= res!778641 (or (bvsge (size!37081 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37081 _keys!1208)) (bvsge from!1455 (size!37081 _keys!1208))))))

(assert (=> b!1172676 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25647)))

(declare-fun lt!528414 () Unit!38666)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75791 (_ BitVec 32) (_ BitVec 32)) Unit!38666)

(assert (=> b!1172676 (= lt!528414 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172676 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528411 () Unit!38666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75791 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38666)

(assert (=> b!1172676 (= lt!528411 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172677 () Bool)

(declare-fun e!666550 () Bool)

(assert (=> b!1172677 (= e!666550 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1172678 () Bool)

(declare-fun res!778644 () Bool)

(assert (=> b!1172678 (=> res!778644 e!666541)))

(declare-fun noDuplicate!1622 (List!25650) Bool)

(assert (=> b!1172678 (= res!778644 (not (noDuplicate!1622 Nil!25647)))))

(declare-fun b!1172679 () Bool)

(declare-fun res!778633 () Bool)

(assert (=> b!1172679 (=> (not res!778633) (not e!666549))))

(assert (=> b!1172679 (= res!778633 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37081 _keys!1208))))))

(declare-fun b!1172680 () Bool)

(assert (=> b!1172680 (= e!666549 e!666539)))

(declare-fun res!778645 () Bool)

(assert (=> b!1172680 (=> (not res!778645) (not e!666539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75791 (_ BitVec 32)) Bool)

(assert (=> b!1172680 (= res!778645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528413 mask!1564))))

(assert (=> b!1172680 (= lt!528413 (array!75792 (store (arr!36545 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37081 _keys!1208)))))

(declare-fun b!1172681 () Bool)

(declare-fun res!778634 () Bool)

(assert (=> b!1172681 (=> (not res!778634) (not e!666549))))

(assert (=> b!1172681 (= res!778634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172682 () Bool)

(declare-fun e!666543 () Bool)

(assert (=> b!1172682 (= e!666543 e!666540)))

(declare-fun res!778635 () Bool)

(assert (=> b!1172682 (=> res!778635 e!666540)))

(assert (=> b!1172682 (= res!778635 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172682 (= lt!528416 (getCurrentListMapNoExtraKeys!4920 lt!528413 lt!528412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172682 (= lt!528412 (array!75794 (store (arr!36546 _values!996) i!673 (ValueCellFull!14035 lt!528418)) (size!37082 _values!996)))))

(declare-fun dynLambda!2891 (Int (_ BitVec 64)) V!44445)

(assert (=> b!1172682 (= lt!528418 (dynLambda!2891 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528420 () ListLongMap!16881)

(assert (=> b!1172682 (= lt!528420 (getCurrentListMapNoExtraKeys!4920 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172683 () Bool)

(declare-fun res!778642 () Bool)

(assert (=> b!1172683 (=> (not res!778642) (not e!666549))))

(assert (=> b!1172683 (= res!778642 (and (= (size!37082 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37081 _keys!1208) (size!37082 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172685 () Bool)

(declare-fun res!778640 () Bool)

(assert (=> b!1172685 (=> res!778640 e!666541)))

(declare-fun contains!6860 (List!25650 (_ BitVec 64)) Bool)

(assert (=> b!1172685 (= res!778640 (contains!6860 Nil!25647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172686 () Bool)

(declare-fun res!778636 () Bool)

(assert (=> b!1172686 (=> (not res!778636) (not e!666549))))

(assert (=> b!1172686 (= res!778636 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25647))))

(declare-fun mapIsEmpty!46061 () Bool)

(declare-fun mapRes!46061 () Bool)

(assert (=> mapIsEmpty!46061 mapRes!46061))

(declare-fun b!1172687 () Bool)

(assert (=> b!1172687 (= e!666544 e!666550)))

(declare-fun res!778639 () Bool)

(assert (=> b!1172687 (=> res!778639 e!666550)))

(assert (=> b!1172687 (= res!778639 (not (= (select (arr!36545 _keys!1208) from!1455) k!934)))))

(declare-fun b!1172688 () Bool)

(declare-fun res!778651 () Bool)

(assert (=> b!1172688 (=> (not res!778651) (not e!666549))))

(assert (=> b!1172688 (= res!778651 (validKeyInArray!0 k!934))))

(declare-fun b!1172689 () Bool)

(declare-fun e!666538 () Bool)

(assert (=> b!1172689 (= e!666538 (and e!666545 mapRes!46061))))

(declare-fun condMapEmpty!46061 () Bool)

(declare-fun mapDefault!46061 () ValueCell!14035)

