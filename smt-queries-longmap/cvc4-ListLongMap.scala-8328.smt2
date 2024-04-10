; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101372 () Bool)

(assert start!101372)

(declare-fun b_free!26243 () Bool)

(declare-fun b_next!26243 () Bool)

(assert (=> start!101372 (= b_free!26243 (not b_next!26243))))

(declare-fun tp!91756 () Bool)

(declare-fun b_and!43639 () Bool)

(assert (=> start!101372 (= tp!91756 b_and!43639)))

(declare-fun b!1218111 () Bool)

(declare-fun e!691586 () Bool)

(assert (=> b!1218111 (= e!691586 true)))

(declare-fun e!691580 () Bool)

(assert (=> b!1218111 e!691580))

(declare-fun res!808973 () Bool)

(assert (=> b!1218111 (=> (not res!808973) (not e!691580))))

(declare-datatypes ((V!46389 0))(
  ( (V!46390 (val!15530 Int)) )
))
(declare-datatypes ((tuple2!19976 0))(
  ( (tuple2!19977 (_1!9999 (_ BitVec 64)) (_2!9999 V!46389)) )
))
(declare-datatypes ((List!26779 0))(
  ( (Nil!26776) (Cons!26775 (h!27984 tuple2!19976) (t!40002 List!26779)) )
))
(declare-datatypes ((ListLongMap!17945 0))(
  ( (ListLongMap!17946 (toList!8988 List!26779)) )
))
(declare-fun lt!553721 () ListLongMap!17945)

(declare-datatypes ((array!78669 0))(
  ( (array!78670 (arr!37967 (Array (_ BitVec 32) (_ BitVec 64))) (size!38503 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78669)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!553718 () ListLongMap!17945)

(declare-datatypes ((ValueCell!14764 0))(
  ( (ValueCellFull!14764 (v!18185 V!46389)) (EmptyCell!14764) )
))
(declare-datatypes ((array!78671 0))(
  ( (array!78672 (arr!37968 (Array (_ BitVec 32) ValueCell!14764)) (size!38504 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78671)

(declare-fun lt!553715 () V!46389)

(declare-fun +!4059 (ListLongMap!17945 tuple2!19976) ListLongMap!17945)

(declare-fun get!19350 (ValueCell!14764 V!46389) V!46389)

(assert (=> b!1218111 (= res!808973 (= lt!553718 (+!4059 lt!553721 (tuple2!19977 (select (arr!37967 _keys!1208) from!1455) (get!19350 (select (arr!37968 _values!996) from!1455) lt!553715)))))))

(declare-fun b!1218112 () Bool)

(declare-fun e!691585 () Bool)

(assert (=> b!1218112 (= e!691580 e!691585)))

(declare-fun res!808963 () Bool)

(assert (=> b!1218112 (=> res!808963 e!691585)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1218112 (= res!808963 (not (= (select (arr!37967 _keys!1208) from!1455) k!934)))))

(declare-fun b!1218113 () Bool)

(declare-fun res!808974 () Bool)

(declare-fun e!691582 () Bool)

(assert (=> b!1218113 (=> (not res!808974) (not e!691582))))

(declare-datatypes ((List!26780 0))(
  ( (Nil!26777) (Cons!26776 (h!27985 (_ BitVec 64)) (t!40003 List!26780)) )
))
(declare-fun arrayNoDuplicates!0 (array!78669 (_ BitVec 32) List!26780) Bool)

(assert (=> b!1218113 (= res!808974 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26777))))

(declare-fun b!1218114 () Bool)

(declare-fun res!808976 () Bool)

(declare-fun e!691581 () Bool)

(assert (=> b!1218114 (=> (not res!808976) (not e!691581))))

(declare-fun lt!553717 () array!78669)

(assert (=> b!1218114 (= res!808976 (arrayNoDuplicates!0 lt!553717 #b00000000000000000000000000000000 Nil!26777))))

(declare-fun mapNonEmpty!48301 () Bool)

(declare-fun mapRes!48301 () Bool)

(declare-fun tp!91757 () Bool)

(declare-fun e!691578 () Bool)

(assert (=> mapNonEmpty!48301 (= mapRes!48301 (and tp!91757 e!691578))))

(declare-fun mapValue!48301 () ValueCell!14764)

(declare-fun mapKey!48301 () (_ BitVec 32))

(declare-fun mapRest!48301 () (Array (_ BitVec 32) ValueCell!14764))

(assert (=> mapNonEmpty!48301 (= (arr!37968 _values!996) (store mapRest!48301 mapKey!48301 mapValue!48301))))

(declare-fun res!808972 () Bool)

(assert (=> start!101372 (=> (not res!808972) (not e!691582))))

(assert (=> start!101372 (= res!808972 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38503 _keys!1208))))))

(assert (=> start!101372 e!691582))

(declare-fun tp_is_empty!30947 () Bool)

(assert (=> start!101372 tp_is_empty!30947))

(declare-fun array_inv!28898 (array!78669) Bool)

(assert (=> start!101372 (array_inv!28898 _keys!1208)))

(assert (=> start!101372 true))

(assert (=> start!101372 tp!91756))

(declare-fun e!691584 () Bool)

(declare-fun array_inv!28899 (array!78671) Bool)

(assert (=> start!101372 (and (array_inv!28899 _values!996) e!691584)))

(declare-fun b!1218115 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218115 (= e!691585 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218116 () Bool)

(declare-fun res!808970 () Bool)

(assert (=> b!1218116 (=> (not res!808970) (not e!691582))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78669 (_ BitVec 32)) Bool)

(assert (=> b!1218116 (= res!808970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48301 () Bool)

(assert (=> mapIsEmpty!48301 mapRes!48301))

(declare-fun b!1218117 () Bool)

(declare-fun e!691579 () Bool)

(declare-fun e!691577 () Bool)

(assert (=> b!1218117 (= e!691579 e!691577)))

(declare-fun res!808965 () Bool)

(assert (=> b!1218117 (=> res!808965 e!691577)))

(assert (=> b!1218117 (= res!808965 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46389)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46389)

(declare-fun lt!553720 () array!78671)

(declare-fun getCurrentListMapNoExtraKeys!5414 (array!78669 array!78671 (_ BitVec 32) (_ BitVec 32) V!46389 V!46389 (_ BitVec 32) Int) ListLongMap!17945)

(assert (=> b!1218117 (= lt!553718 (getCurrentListMapNoExtraKeys!5414 lt!553717 lt!553720 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218117 (= lt!553720 (array!78672 (store (arr!37968 _values!996) i!673 (ValueCellFull!14764 lt!553715)) (size!38504 _values!996)))))

(declare-fun dynLambda!3298 (Int (_ BitVec 64)) V!46389)

(assert (=> b!1218117 (= lt!553715 (dynLambda!3298 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553722 () ListLongMap!17945)

(assert (=> b!1218117 (= lt!553722 (getCurrentListMapNoExtraKeys!5414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218118 () Bool)

(assert (=> b!1218118 (= e!691578 tp_is_empty!30947)))

(declare-fun b!1218119 () Bool)

(assert (=> b!1218119 (= e!691581 (not e!691579))))

(declare-fun res!808967 () Bool)

(assert (=> b!1218119 (=> res!808967 e!691579)))

(assert (=> b!1218119 (= res!808967 (bvsgt from!1455 i!673))))

(assert (=> b!1218119 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40380 0))(
  ( (Unit!40381) )
))
(declare-fun lt!553716 () Unit!40380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78669 (_ BitVec 64) (_ BitVec 32)) Unit!40380)

(assert (=> b!1218119 (= lt!553716 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218120 () Bool)

(declare-fun res!808962 () Bool)

(assert (=> b!1218120 (=> (not res!808962) (not e!691582))))

(assert (=> b!1218120 (= res!808962 (and (= (size!38504 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38503 _keys!1208) (size!38504 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218121 () Bool)

(assert (=> b!1218121 (= e!691577 e!691586)))

(declare-fun res!808969 () Bool)

(assert (=> b!1218121 (=> res!808969 e!691586)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218121 (= res!808969 (not (validKeyInArray!0 (select (arr!37967 _keys!1208) from!1455))))))

(declare-fun lt!553719 () ListLongMap!17945)

(assert (=> b!1218121 (= lt!553719 lt!553721)))

(declare-fun lt!553713 () ListLongMap!17945)

(declare-fun -!1903 (ListLongMap!17945 (_ BitVec 64)) ListLongMap!17945)

(assert (=> b!1218121 (= lt!553721 (-!1903 lt!553713 k!934))))

(assert (=> b!1218121 (= lt!553719 (getCurrentListMapNoExtraKeys!5414 lt!553717 lt!553720 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218121 (= lt!553713 (getCurrentListMapNoExtraKeys!5414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553714 () Unit!40380)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1110 (array!78669 array!78671 (_ BitVec 32) (_ BitVec 32) V!46389 V!46389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40380)

(assert (=> b!1218121 (= lt!553714 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1110 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218122 () Bool)

(declare-fun res!808968 () Bool)

(assert (=> b!1218122 (=> (not res!808968) (not e!691582))))

(assert (=> b!1218122 (= res!808968 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38503 _keys!1208))))))

(declare-fun b!1218123 () Bool)

(declare-fun res!808964 () Bool)

(assert (=> b!1218123 (=> (not res!808964) (not e!691582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218123 (= res!808964 (validMask!0 mask!1564))))

(declare-fun b!1218124 () Bool)

(declare-fun res!808975 () Bool)

(assert (=> b!1218124 (=> (not res!808975) (not e!691582))))

(assert (=> b!1218124 (= res!808975 (= (select (arr!37967 _keys!1208) i!673) k!934))))

(declare-fun b!1218125 () Bool)

(declare-fun res!808966 () Bool)

(assert (=> b!1218125 (=> (not res!808966) (not e!691582))))

(assert (=> b!1218125 (= res!808966 (validKeyInArray!0 k!934))))

(declare-fun b!1218126 () Bool)

(assert (=> b!1218126 (= e!691582 e!691581)))

(declare-fun res!808971 () Bool)

(assert (=> b!1218126 (=> (not res!808971) (not e!691581))))

(assert (=> b!1218126 (= res!808971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553717 mask!1564))))

(assert (=> b!1218126 (= lt!553717 (array!78670 (store (arr!37967 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38503 _keys!1208)))))

(declare-fun b!1218127 () Bool)

(declare-fun e!691583 () Bool)

(assert (=> b!1218127 (= e!691583 tp_is_empty!30947)))

(declare-fun b!1218128 () Bool)

(assert (=> b!1218128 (= e!691584 (and e!691583 mapRes!48301))))

(declare-fun condMapEmpty!48301 () Bool)

(declare-fun mapDefault!48301 () ValueCell!14764)

