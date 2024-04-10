; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101268 () Bool)

(assert start!101268)

(declare-fun b_free!26191 () Bool)

(declare-fun b_next!26191 () Bool)

(assert (=> start!101268 (= b_free!26191 (not b_next!26191))))

(declare-fun tp!91594 () Bool)

(declare-fun b_and!43499 () Bool)

(assert (=> start!101268 (= tp!91594 b_and!43499)))

(declare-fun res!807800 () Bool)

(declare-fun e!690649 () Bool)

(assert (=> start!101268 (=> (not res!807800) (not e!690649))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78563 0))(
  ( (array!78564 (arr!37916 (Array (_ BitVec 32) (_ BitVec 64))) (size!38452 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78563)

(assert (=> start!101268 (= res!807800 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38452 _keys!1208))))))

(assert (=> start!101268 e!690649))

(declare-fun tp_is_empty!30895 () Bool)

(assert (=> start!101268 tp_is_empty!30895))

(declare-fun array_inv!28868 (array!78563) Bool)

(assert (=> start!101268 (array_inv!28868 _keys!1208)))

(assert (=> start!101268 true))

(assert (=> start!101268 tp!91594))

(declare-datatypes ((V!46321 0))(
  ( (V!46322 (val!15504 Int)) )
))
(declare-datatypes ((ValueCell!14738 0))(
  ( (ValueCellFull!14738 (v!18157 V!46321)) (EmptyCell!14738) )
))
(declare-datatypes ((array!78565 0))(
  ( (array!78566 (arr!37917 (Array (_ BitVec 32) ValueCell!14738)) (size!38453 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78565)

(declare-fun e!690653 () Bool)

(declare-fun array_inv!28869 (array!78565) Bool)

(assert (=> start!101268 (and (array_inv!28869 _values!996) e!690653)))

(declare-fun b!1216487 () Bool)

(declare-fun e!690654 () Bool)

(declare-fun e!690651 () Bool)

(assert (=> b!1216487 (= e!690654 e!690651)))

(declare-fun res!807796 () Bool)

(assert (=> b!1216487 (=> res!807796 e!690651)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216487 (= res!807796 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46321)

(declare-datatypes ((tuple2!19926 0))(
  ( (tuple2!19927 (_1!9974 (_ BitVec 64)) (_2!9974 V!46321)) )
))
(declare-datatypes ((List!26731 0))(
  ( (Nil!26728) (Cons!26727 (h!27936 tuple2!19926) (t!39902 List!26731)) )
))
(declare-datatypes ((ListLongMap!17895 0))(
  ( (ListLongMap!17896 (toList!8963 List!26731)) )
))
(declare-fun lt!552924 () ListLongMap!17895)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!552921 () array!78565)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!552920 () array!78563)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46321)

(declare-fun getCurrentListMapNoExtraKeys!5390 (array!78563 array!78565 (_ BitVec 32) (_ BitVec 32) V!46321 V!46321 (_ BitVec 32) Int) ListLongMap!17895)

(assert (=> b!1216487 (= lt!552924 (getCurrentListMapNoExtraKeys!5390 lt!552920 lt!552921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3279 (Int (_ BitVec 64)) V!46321)

(assert (=> b!1216487 (= lt!552921 (array!78566 (store (arr!37917 _values!996) i!673 (ValueCellFull!14738 (dynLambda!3279 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38453 _values!996)))))

(declare-fun lt!552923 () ListLongMap!17895)

(assert (=> b!1216487 (= lt!552923 (getCurrentListMapNoExtraKeys!5390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216488 () Bool)

(declare-fun res!807797 () Bool)

(assert (=> b!1216488 (=> (not res!807797) (not e!690649))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216488 (= res!807797 (validKeyInArray!0 k!934))))

(declare-fun b!1216489 () Bool)

(declare-fun e!690655 () Bool)

(assert (=> b!1216489 (= e!690655 (not e!690654))))

(declare-fun res!807794 () Bool)

(assert (=> b!1216489 (=> res!807794 e!690654)))

(assert (=> b!1216489 (= res!807794 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216489 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40334 0))(
  ( (Unit!40335) )
))
(declare-fun lt!552919 () Unit!40334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78563 (_ BitVec 64) (_ BitVec 32)) Unit!40334)

(assert (=> b!1216489 (= lt!552919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1216490 () Bool)

(declare-fun res!807793 () Bool)

(assert (=> b!1216490 (=> (not res!807793) (not e!690649))))

(assert (=> b!1216490 (= res!807793 (= (select (arr!37916 _keys!1208) i!673) k!934))))

(declare-fun b!1216491 () Bool)

(declare-fun e!690652 () Bool)

(assert (=> b!1216491 (= e!690652 tp_is_empty!30895)))

(declare-fun b!1216492 () Bool)

(declare-fun res!807802 () Bool)

(assert (=> b!1216492 (=> (not res!807802) (not e!690649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78563 (_ BitVec 32)) Bool)

(assert (=> b!1216492 (= res!807802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216493 () Bool)

(declare-fun res!807799 () Bool)

(assert (=> b!1216493 (=> (not res!807799) (not e!690649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216493 (= res!807799 (validMask!0 mask!1564))))

(declare-fun b!1216494 () Bool)

(declare-fun res!807795 () Bool)

(assert (=> b!1216494 (=> (not res!807795) (not e!690649))))

(assert (=> b!1216494 (= res!807795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38452 _keys!1208))))))

(declare-fun b!1216495 () Bool)

(declare-fun res!807803 () Bool)

(assert (=> b!1216495 (=> (not res!807803) (not e!690649))))

(declare-datatypes ((List!26732 0))(
  ( (Nil!26729) (Cons!26728 (h!27937 (_ BitVec 64)) (t!39903 List!26732)) )
))
(declare-fun arrayNoDuplicates!0 (array!78563 (_ BitVec 32) List!26732) Bool)

(assert (=> b!1216495 (= res!807803 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26729))))

(declare-fun b!1216496 () Bool)

(assert (=> b!1216496 (= e!690651 true)))

(declare-fun -!1882 (ListLongMap!17895 (_ BitVec 64)) ListLongMap!17895)

(assert (=> b!1216496 (= (getCurrentListMapNoExtraKeys!5390 lt!552920 lt!552921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1882 (getCurrentListMapNoExtraKeys!5390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!552922 () Unit!40334)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1089 (array!78563 array!78565 (_ BitVec 32) (_ BitVec 32) V!46321 V!46321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40334)

(assert (=> b!1216496 (= lt!552922 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1089 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216497 () Bool)

(declare-fun res!807801 () Bool)

(assert (=> b!1216497 (=> (not res!807801) (not e!690649))))

(assert (=> b!1216497 (= res!807801 (and (= (size!38453 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38452 _keys!1208) (size!38453 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216498 () Bool)

(declare-fun e!690648 () Bool)

(assert (=> b!1216498 (= e!690648 tp_is_empty!30895)))

(declare-fun b!1216499 () Bool)

(declare-fun res!807798 () Bool)

(assert (=> b!1216499 (=> (not res!807798) (not e!690655))))

(assert (=> b!1216499 (= res!807798 (arrayNoDuplicates!0 lt!552920 #b00000000000000000000000000000000 Nil!26729))))

(declare-fun mapNonEmpty!48217 () Bool)

(declare-fun mapRes!48217 () Bool)

(declare-fun tp!91595 () Bool)

(assert (=> mapNonEmpty!48217 (= mapRes!48217 (and tp!91595 e!690648))))

(declare-fun mapValue!48217 () ValueCell!14738)

(declare-fun mapRest!48217 () (Array (_ BitVec 32) ValueCell!14738))

(declare-fun mapKey!48217 () (_ BitVec 32))

(assert (=> mapNonEmpty!48217 (= (arr!37917 _values!996) (store mapRest!48217 mapKey!48217 mapValue!48217))))

(declare-fun mapIsEmpty!48217 () Bool)

(assert (=> mapIsEmpty!48217 mapRes!48217))

(declare-fun b!1216500 () Bool)

(assert (=> b!1216500 (= e!690653 (and e!690652 mapRes!48217))))

(declare-fun condMapEmpty!48217 () Bool)

(declare-fun mapDefault!48217 () ValueCell!14738)

