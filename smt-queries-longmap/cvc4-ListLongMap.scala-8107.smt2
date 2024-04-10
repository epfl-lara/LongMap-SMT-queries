; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99512 () Bool)

(assert start!99512)

(declare-fun b_free!25091 () Bool)

(declare-fun b_next!25091 () Bool)

(assert (=> start!99512 (= b_free!25091 (not b_next!25091))))

(declare-fun tp!87987 () Bool)

(declare-fun b_and!41049 () Bool)

(assert (=> start!99512 (= tp!87987 b_and!41049)))

(declare-fun b!1176800 () Bool)

(declare-fun res!781653 () Bool)

(declare-fun e!668955 () Bool)

(assert (=> b!1176800 (=> (not res!781653) (not e!668955))))

(declare-datatypes ((array!76049 0))(
  ( (array!76050 (arr!36674 (Array (_ BitVec 32) (_ BitVec 64))) (size!37210 (_ BitVec 32))) )
))
(declare-fun lt!531219 () array!76049)

(declare-datatypes ((List!25752 0))(
  ( (Nil!25749) (Cons!25748 (h!26957 (_ BitVec 64)) (t!37835 List!25752)) )
))
(declare-fun arrayNoDuplicates!0 (array!76049 (_ BitVec 32) List!25752) Bool)

(assert (=> b!1176800 (= res!781653 (arrayNoDuplicates!0 lt!531219 #b00000000000000000000000000000000 Nil!25749))))

(declare-fun b!1176801 () Bool)

(declare-fun res!781642 () Bool)

(declare-fun e!668952 () Bool)

(assert (=> b!1176801 (=> (not res!781642) (not e!668952))))

(declare-fun _keys!1208 () array!76049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44621 0))(
  ( (V!44622 (val!14867 Int)) )
))
(declare-datatypes ((ValueCell!14101 0))(
  ( (ValueCellFull!14101 (v!17505 V!44621)) (EmptyCell!14101) )
))
(declare-datatypes ((array!76051 0))(
  ( (array!76052 (arr!36675 (Array (_ BitVec 32) ValueCell!14101)) (size!37211 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76051)

(assert (=> b!1176801 (= res!781642 (and (= (size!37211 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37210 _keys!1208) (size!37211 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1176802 () Bool)

(declare-fun e!668951 () Bool)

(declare-fun arrayContainsKey!0 (array!76049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176802 (= e!668951 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1176803 () Bool)

(declare-datatypes ((Unit!38854 0))(
  ( (Unit!38855) )
))
(declare-fun e!668953 () Unit!38854)

(declare-fun Unit!38856 () Unit!38854)

(assert (=> b!1176803 (= e!668953 Unit!38856)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!531222 () Unit!38854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76049 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38854)

(assert (=> b!1176803 (= lt!531222 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176803 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531216 () Unit!38854)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76049 (_ BitVec 32) (_ BitVec 32)) Unit!38854)

(assert (=> b!1176803 (= lt!531216 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176803 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25749)))

(declare-fun lt!531228 () Unit!38854)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76049 (_ BitVec 64) (_ BitVec 32) List!25752) Unit!38854)

(assert (=> b!1176803 (= lt!531228 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25749))))

(assert (=> b!1176803 false))

(declare-fun b!1176804 () Bool)

(declare-fun e!668954 () Bool)

(assert (=> b!1176804 (= e!668954 e!668951)))

(declare-fun res!781656 () Bool)

(assert (=> b!1176804 (=> res!781656 e!668951)))

(assert (=> b!1176804 (= res!781656 (not (= (select (arr!36674 _keys!1208) from!1455) k!934)))))

(declare-fun b!1176805 () Bool)

(assert (=> b!1176805 (= e!668952 e!668955)))

(declare-fun res!781643 () Bool)

(assert (=> b!1176805 (=> (not res!781643) (not e!668955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76049 (_ BitVec 32)) Bool)

(assert (=> b!1176805 (= res!781643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531219 mask!1564))))

(assert (=> b!1176805 (= lt!531219 (array!76050 (store (arr!36674 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37210 _keys!1208)))))

(declare-fun b!1176806 () Bool)

(declare-fun e!668959 () Bool)

(assert (=> b!1176806 (= e!668959 true)))

(declare-fun e!668962 () Bool)

(assert (=> b!1176806 e!668962))

(declare-fun res!781652 () Bool)

(assert (=> b!1176806 (=> (not res!781652) (not e!668962))))

(assert (=> b!1176806 (= res!781652 (not (= (select (arr!36674 _keys!1208) from!1455) k!934)))))

(declare-fun lt!531227 () Unit!38854)

(assert (=> b!1176806 (= lt!531227 e!668953)))

(declare-fun c!116760 () Bool)

(assert (=> b!1176806 (= c!116760 (= (select (arr!36674 _keys!1208) from!1455) k!934))))

(assert (=> b!1176806 e!668954))

(declare-fun res!781647 () Bool)

(assert (=> b!1176806 (=> (not res!781647) (not e!668954))))

(declare-datatypes ((tuple2!19014 0))(
  ( (tuple2!19015 (_1!9518 (_ BitVec 64)) (_2!9518 V!44621)) )
))
(declare-fun lt!531226 () tuple2!19014)

(declare-datatypes ((List!25753 0))(
  ( (Nil!25750) (Cons!25749 (h!26958 tuple2!19014) (t!37836 List!25753)) )
))
(declare-datatypes ((ListLongMap!16983 0))(
  ( (ListLongMap!16984 (toList!8507 List!25753)) )
))
(declare-fun lt!531220 () ListLongMap!16983)

(declare-fun lt!531225 () ListLongMap!16983)

(declare-fun +!3823 (ListLongMap!16983 tuple2!19014) ListLongMap!16983)

(assert (=> b!1176806 (= res!781647 (= lt!531220 (+!3823 lt!531225 lt!531226)))))

(declare-fun lt!531223 () V!44621)

(declare-fun get!18733 (ValueCell!14101 V!44621) V!44621)

(assert (=> b!1176806 (= lt!531226 (tuple2!19015 (select (arr!36674 _keys!1208) from!1455) (get!18733 (select (arr!36675 _values!996) from!1455) lt!531223)))))

(declare-fun res!781651 () Bool)

(assert (=> start!99512 (=> (not res!781651) (not e!668952))))

(assert (=> start!99512 (= res!781651 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37210 _keys!1208))))))

(assert (=> start!99512 e!668952))

(declare-fun tp_is_empty!29621 () Bool)

(assert (=> start!99512 tp_is_empty!29621))

(declare-fun array_inv!28008 (array!76049) Bool)

(assert (=> start!99512 (array_inv!28008 _keys!1208)))

(assert (=> start!99512 true))

(assert (=> start!99512 tp!87987))

(declare-fun e!668961 () Bool)

(declare-fun array_inv!28009 (array!76051) Bool)

(assert (=> start!99512 (and (array_inv!28009 _values!996) e!668961)))

(declare-fun b!1176807 () Bool)

(declare-fun res!781650 () Bool)

(assert (=> b!1176807 (=> (not res!781650) (not e!668952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176807 (= res!781650 (validMask!0 mask!1564))))

(declare-fun b!1176808 () Bool)

(declare-fun Unit!38857 () Unit!38854)

(assert (=> b!1176808 (= e!668953 Unit!38857)))

(declare-fun b!1176809 () Bool)

(declare-fun e!668950 () Bool)

(declare-fun mapRes!46259 () Bool)

(assert (=> b!1176809 (= e!668961 (and e!668950 mapRes!46259))))

(declare-fun condMapEmpty!46259 () Bool)

(declare-fun mapDefault!46259 () ValueCell!14101)

