; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99446 () Bool)

(assert start!99446)

(declare-fun b_free!25025 () Bool)

(declare-fun b_next!25025 () Bool)

(assert (=> start!99446 (= b_free!25025 (not b_next!25025))))

(declare-fun tp!87789 () Bool)

(declare-fun b_and!40917 () Bool)

(assert (=> start!99446 (= tp!87789 b_and!40917)))

(declare-fun b!1174719 () Bool)

(declare-datatypes ((Unit!38762 0))(
  ( (Unit!38763) )
))
(declare-fun e!667729 () Unit!38762)

(declare-fun Unit!38764 () Unit!38762)

(assert (=> b!1174719 (= e!667729 Unit!38764)))

(declare-fun b!1174720 () Bool)

(declare-fun res!780131 () Bool)

(declare-fun e!667735 () Bool)

(assert (=> b!1174720 (=> (not res!780131) (not e!667735))))

(declare-datatypes ((array!75921 0))(
  ( (array!75922 (arr!36610 (Array (_ BitVec 32) (_ BitVec 64))) (size!37146 (_ BitVec 32))) )
))
(declare-fun lt!529798 () array!75921)

(declare-datatypes ((List!25703 0))(
  ( (Nil!25700) (Cons!25699 (h!26908 (_ BitVec 64)) (t!37720 List!25703)) )
))
(declare-fun arrayNoDuplicates!0 (array!75921 (_ BitVec 32) List!25703) Bool)

(assert (=> b!1174720 (= res!780131 (arrayNoDuplicates!0 lt!529798 #b00000000000000000000000000000000 Nil!25700))))

(declare-fun mapIsEmpty!46160 () Bool)

(declare-fun mapRes!46160 () Bool)

(assert (=> mapIsEmpty!46160 mapRes!46160))

(declare-fun b!1174721 () Bool)

(declare-fun Unit!38765 () Unit!38762)

(assert (=> b!1174721 (= e!667729 Unit!38765)))

(declare-fun _keys!1208 () array!75921)

(declare-fun lt!529797 () Unit!38762)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75921 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38762)

(assert (=> b!1174721 (= lt!529797 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174721 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529803 () Unit!38762)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75921 (_ BitVec 32) (_ BitVec 32)) Unit!38762)

(assert (=> b!1174721 (= lt!529803 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174721 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25700)))

(declare-fun lt!529802 () Unit!38762)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75921 (_ BitVec 64) (_ BitVec 32) List!25703) Unit!38762)

(assert (=> b!1174721 (= lt!529802 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25700))))

(assert (=> b!1174721 false))

(declare-fun b!1174722 () Bool)

(declare-fun res!780133 () Bool)

(declare-fun e!667727 () Bool)

(assert (=> b!1174722 (=> (not res!780133) (not e!667727))))

(assert (=> b!1174722 (= res!780133 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25700))))

(declare-fun b!1174723 () Bool)

(declare-fun res!780122 () Bool)

(assert (=> b!1174723 (=> (not res!780122) (not e!667727))))

(assert (=> b!1174723 (= res!780122 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37146 _keys!1208))))))

(declare-fun b!1174724 () Bool)

(declare-fun e!667731 () Bool)

(declare-fun e!667738 () Bool)

(assert (=> b!1174724 (= e!667731 e!667738)))

(declare-fun res!780128 () Bool)

(assert (=> b!1174724 (=> res!780128 e!667738)))

(assert (=> b!1174724 (= res!780128 (not (= (select (arr!36610 _keys!1208) from!1455) k!934)))))

(declare-fun b!1174725 () Bool)

(assert (=> b!1174725 (= e!667738 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174726 () Bool)

(declare-fun res!780123 () Bool)

(assert (=> b!1174726 (=> (not res!780123) (not e!667727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174726 (= res!780123 (validKeyInArray!0 k!934))))

(declare-fun b!1174727 () Bool)

(declare-fun res!780124 () Bool)

(assert (=> b!1174727 (=> (not res!780124) (not e!667727))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174727 (= res!780124 (validMask!0 mask!1564))))

(declare-fun b!1174728 () Bool)

(declare-fun res!780129 () Bool)

(assert (=> b!1174728 (=> (not res!780129) (not e!667727))))

(assert (=> b!1174728 (= res!780129 (= (select (arr!36610 _keys!1208) i!673) k!934))))

(declare-fun res!780135 () Bool)

(assert (=> start!99446 (=> (not res!780135) (not e!667727))))

(assert (=> start!99446 (= res!780135 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37146 _keys!1208))))))

(assert (=> start!99446 e!667727))

(declare-fun tp_is_empty!29555 () Bool)

(assert (=> start!99446 tp_is_empty!29555))

(declare-fun array_inv!27968 (array!75921) Bool)

(assert (=> start!99446 (array_inv!27968 _keys!1208)))

(assert (=> start!99446 true))

(assert (=> start!99446 tp!87789))

(declare-datatypes ((V!44533 0))(
  ( (V!44534 (val!14834 Int)) )
))
(declare-datatypes ((ValueCell!14068 0))(
  ( (ValueCellFull!14068 (v!17472 V!44533)) (EmptyCell!14068) )
))
(declare-datatypes ((array!75923 0))(
  ( (array!75924 (arr!36611 (Array (_ BitVec 32) ValueCell!14068)) (size!37147 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75923)

(declare-fun e!667736 () Bool)

(declare-fun array_inv!27969 (array!75923) Bool)

(assert (=> start!99446 (and (array_inv!27969 _values!996) e!667736)))

(declare-fun mapNonEmpty!46160 () Bool)

(declare-fun tp!87788 () Bool)

(declare-fun e!667732 () Bool)

(assert (=> mapNonEmpty!46160 (= mapRes!46160 (and tp!87788 e!667732))))

(declare-fun mapKey!46160 () (_ BitVec 32))

(declare-fun mapValue!46160 () ValueCell!14068)

(declare-fun mapRest!46160 () (Array (_ BitVec 32) ValueCell!14068))

(assert (=> mapNonEmpty!46160 (= (arr!36611 _values!996) (store mapRest!46160 mapKey!46160 mapValue!46160))))

(declare-fun b!1174729 () Bool)

(declare-fun res!780126 () Bool)

(assert (=> b!1174729 (=> (not res!780126) (not e!667727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75921 (_ BitVec 32)) Bool)

(assert (=> b!1174729 (= res!780126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174730 () Bool)

(declare-fun res!780130 () Bool)

(assert (=> b!1174730 (=> (not res!780130) (not e!667727))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1174730 (= res!780130 (and (= (size!37147 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37146 _keys!1208) (size!37147 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174731 () Bool)

(declare-fun e!667728 () Bool)

(assert (=> b!1174731 (= e!667735 (not e!667728))))

(declare-fun res!780127 () Bool)

(assert (=> b!1174731 (=> res!780127 e!667728)))

(assert (=> b!1174731 (= res!780127 (bvsgt from!1455 i!673))))

(assert (=> b!1174731 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529801 () Unit!38762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75921 (_ BitVec 64) (_ BitVec 32)) Unit!38762)

(assert (=> b!1174731 (= lt!529801 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174732 () Bool)

(declare-fun e!667733 () Bool)

(assert (=> b!1174732 (= e!667733 true)))

(assert (=> b!1174732 (not (= (select (arr!36610 _keys!1208) from!1455) k!934))))

(declare-fun lt!529799 () Unit!38762)

(assert (=> b!1174732 (= lt!529799 e!667729)))

(declare-fun c!116661 () Bool)

(assert (=> b!1174732 (= c!116661 (= (select (arr!36610 _keys!1208) from!1455) k!934))))

(assert (=> b!1174732 e!667731))

(declare-fun res!780134 () Bool)

(assert (=> b!1174732 (=> (not res!780134) (not e!667731))))

(declare-datatypes ((tuple2!18966 0))(
  ( (tuple2!18967 (_1!9494 (_ BitVec 64)) (_2!9494 V!44533)) )
))
(declare-datatypes ((List!25704 0))(
  ( (Nil!25701) (Cons!25700 (h!26909 tuple2!18966) (t!37721 List!25704)) )
))
(declare-datatypes ((ListLongMap!16935 0))(
  ( (ListLongMap!16936 (toList!8483 List!25704)) )
))
(declare-fun lt!529794 () ListLongMap!16935)

(declare-fun lt!529804 () ListLongMap!16935)

(declare-fun lt!529796 () V!44533)

(declare-fun +!3800 (ListLongMap!16935 tuple2!18966) ListLongMap!16935)

(declare-fun get!18688 (ValueCell!14068 V!44533) V!44533)

(assert (=> b!1174732 (= res!780134 (= lt!529804 (+!3800 lt!529794 (tuple2!18967 (select (arr!36610 _keys!1208) from!1455) (get!18688 (select (arr!36611 _values!996) from!1455) lt!529796)))))))

(declare-fun b!1174733 () Bool)

(declare-fun e!667737 () Bool)

(assert (=> b!1174733 (= e!667728 e!667737)))

(declare-fun res!780132 () Bool)

(assert (=> b!1174733 (=> res!780132 e!667737)))

(assert (=> b!1174733 (= res!780132 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44533)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44533)

(declare-fun lt!529793 () array!75923)

(declare-fun getCurrentListMapNoExtraKeys!4943 (array!75921 array!75923 (_ BitVec 32) (_ BitVec 32) V!44533 V!44533 (_ BitVec 32) Int) ListLongMap!16935)

(assert (=> b!1174733 (= lt!529804 (getCurrentListMapNoExtraKeys!4943 lt!529798 lt!529793 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174733 (= lt!529793 (array!75924 (store (arr!36611 _values!996) i!673 (ValueCellFull!14068 lt!529796)) (size!37147 _values!996)))))

(declare-fun dynLambda!2911 (Int (_ BitVec 64)) V!44533)

(assert (=> b!1174733 (= lt!529796 (dynLambda!2911 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529806 () ListLongMap!16935)

(assert (=> b!1174733 (= lt!529806 (getCurrentListMapNoExtraKeys!4943 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174734 () Bool)

(assert (=> b!1174734 (= e!667732 tp_is_empty!29555)))

(declare-fun b!1174735 () Bool)

(assert (=> b!1174735 (= e!667727 e!667735)))

(declare-fun res!780136 () Bool)

(assert (=> b!1174735 (=> (not res!780136) (not e!667735))))

(assert (=> b!1174735 (= res!780136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529798 mask!1564))))

(assert (=> b!1174735 (= lt!529798 (array!75922 (store (arr!36610 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37146 _keys!1208)))))

(declare-fun b!1174736 () Bool)

(declare-fun e!667734 () Bool)

(assert (=> b!1174736 (= e!667736 (and e!667734 mapRes!46160))))

(declare-fun condMapEmpty!46160 () Bool)

(declare-fun mapDefault!46160 () ValueCell!14068)

