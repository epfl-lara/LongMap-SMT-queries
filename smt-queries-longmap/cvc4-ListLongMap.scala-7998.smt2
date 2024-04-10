; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98832 () Bool)

(assert start!98832)

(declare-fun b_free!24437 () Bool)

(declare-fun b_next!24437 () Bool)

(assert (=> start!98832 (= b_free!24437 (not b_next!24437))))

(declare-fun tp!86022 () Bool)

(declare-fun b_and!39723 () Bool)

(assert (=> start!98832 (= tp!86022 b_and!39723)))

(declare-fun b!1155114 () Bool)

(declare-fun e!656932 () Bool)

(assert (=> b!1155114 (= e!656932 true)))

(declare-fun e!656933 () Bool)

(assert (=> b!1155114 e!656933))

(declare-fun res!767509 () Bool)

(assert (=> b!1155114 (=> (not res!767509) (not e!656933))))

(declare-datatypes ((V!43749 0))(
  ( (V!43750 (val!14540 Int)) )
))
(declare-datatypes ((tuple2!18488 0))(
  ( (tuple2!18489 (_1!9255 (_ BitVec 64)) (_2!9255 V!43749)) )
))
(declare-datatypes ((List!25232 0))(
  ( (Nil!25229) (Cons!25228 (h!26437 tuple2!18488) (t!36661 List!25232)) )
))
(declare-datatypes ((ListLongMap!16457 0))(
  ( (ListLongMap!16458 (toList!8244 List!25232)) )
))
(declare-fun lt!518158 () ListLongMap!16457)

(declare-fun lt!518175 () ListLongMap!16457)

(assert (=> b!1155114 (= res!767509 (= lt!518158 lt!518175))))

(declare-fun lt!518164 () ListLongMap!16457)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1364 (ListLongMap!16457 (_ BitVec 64)) ListLongMap!16457)

(assert (=> b!1155114 (= lt!518158 (-!1364 lt!518164 k!934))))

(declare-datatypes ((array!74781 0))(
  ( (array!74782 (arr!36041 (Array (_ BitVec 32) (_ BitVec 64))) (size!36577 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74781)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!518159 () V!43749)

(declare-fun +!3657 (ListLongMap!16457 tuple2!18488) ListLongMap!16457)

(assert (=> b!1155114 (= (-!1364 (+!3657 lt!518175 (tuple2!18489 (select (arr!36041 _keys!1208) from!1455) lt!518159)) (select (arr!36041 _keys!1208) from!1455)) lt!518175)))

(declare-datatypes ((Unit!38035 0))(
  ( (Unit!38036) )
))
(declare-fun lt!518171 () Unit!38035)

(declare-fun addThenRemoveForNewKeyIsSame!204 (ListLongMap!16457 (_ BitVec 64) V!43749) Unit!38035)

(assert (=> b!1155114 (= lt!518171 (addThenRemoveForNewKeyIsSame!204 lt!518175 (select (arr!36041 _keys!1208) from!1455) lt!518159))))

(declare-datatypes ((ValueCell!13774 0))(
  ( (ValueCellFull!13774 (v!17177 V!43749)) (EmptyCell!13774) )
))
(declare-datatypes ((array!74783 0))(
  ( (array!74784 (arr!36042 (Array (_ BitVec 32) ValueCell!13774)) (size!36578 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74783)

(declare-fun lt!518169 () V!43749)

(declare-fun get!18362 (ValueCell!13774 V!43749) V!43749)

(assert (=> b!1155114 (= lt!518159 (get!18362 (select (arr!36042 _values!996) from!1455) lt!518169))))

(declare-fun lt!518172 () Unit!38035)

(declare-fun e!656938 () Unit!38035)

(assert (=> b!1155114 (= lt!518172 e!656938)))

(declare-fun c!114792 () Bool)

(declare-fun contains!6757 (ListLongMap!16457 (_ BitVec 64)) Bool)

(assert (=> b!1155114 (= c!114792 (contains!6757 lt!518175 k!934))))

(declare-fun zeroValue!944 () V!43749)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43749)

(declare-fun getCurrentListMapNoExtraKeys!4713 (array!74781 array!74783 (_ BitVec 32) (_ BitVec 32) V!43749 V!43749 (_ BitVec 32) Int) ListLongMap!16457)

(assert (=> b!1155114 (= lt!518175 (getCurrentListMapNoExtraKeys!4713 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54783 () Bool)

(declare-fun call!54793 () ListLongMap!16457)

(assert (=> bm!54783 (= call!54793 (getCurrentListMapNoExtraKeys!4713 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155116 () Bool)

(declare-fun res!767505 () Bool)

(declare-fun e!656937 () Bool)

(assert (=> b!1155116 (=> (not res!767505) (not e!656937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155116 (= res!767505 (validMask!0 mask!1564))))

(declare-fun lt!518166 () array!74781)

(declare-fun lt!518168 () array!74783)

(declare-fun b!1155117 () Bool)

(assert (=> b!1155117 (= e!656933 (= lt!518158 (getCurrentListMapNoExtraKeys!4713 lt!518166 lt!518168 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!54790 () ListLongMap!16457)

(declare-fun bm!54784 () Bool)

(assert (=> bm!54784 (= call!54790 (getCurrentListMapNoExtraKeys!4713 lt!518166 lt!518168 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54785 () Bool)

(declare-fun call!54789 () ListLongMap!16457)

(declare-fun call!54786 () ListLongMap!16457)

(assert (=> bm!54785 (= call!54789 call!54786)))

(declare-fun b!1155118 () Bool)

(declare-fun e!656931 () Unit!38035)

(declare-fun lt!518156 () Unit!38035)

(assert (=> b!1155118 (= e!656931 lt!518156)))

(declare-fun call!54787 () Unit!38035)

(assert (=> b!1155118 (= lt!518156 call!54787)))

(declare-fun call!54792 () Bool)

(assert (=> b!1155118 call!54792))

(declare-fun b!1155119 () Bool)

(assert (=> b!1155119 call!54792))

(declare-fun lt!518173 () Unit!38035)

(assert (=> b!1155119 (= lt!518173 call!54787)))

(declare-fun e!656930 () Unit!38035)

(assert (=> b!1155119 (= e!656930 lt!518173)))

(declare-fun c!114791 () Bool)

(declare-fun bm!54786 () Bool)

(declare-fun c!114795 () Bool)

(assert (=> bm!54786 (= call!54786 (+!3657 lt!518175 (ite (or c!114791 c!114795) (tuple2!18489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155120 () Bool)

(declare-fun res!767507 () Bool)

(assert (=> b!1155120 (=> (not res!767507) (not e!656937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155120 (= res!767507 (validKeyInArray!0 k!934))))

(declare-fun b!1155121 () Bool)

(assert (=> b!1155121 (= e!656931 e!656930)))

(declare-fun c!114796 () Bool)

(declare-fun lt!518162 () Bool)

(assert (=> b!1155121 (= c!114796 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518162))))

(declare-fun b!1155122 () Bool)

(declare-fun res!767504 () Bool)

(assert (=> b!1155122 (=> (not res!767504) (not e!656937))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155122 (= res!767504 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36577 _keys!1208))))))

(declare-fun b!1155123 () Bool)

(declare-fun Unit!38037 () Unit!38035)

(assert (=> b!1155123 (= e!656938 Unit!38037)))

(declare-fun bm!54787 () Bool)

(declare-fun lt!518161 () ListLongMap!16457)

(declare-fun call!54788 () Bool)

(assert (=> bm!54787 (= call!54788 (contains!6757 (ite c!114791 lt!518161 call!54789) k!934))))

(declare-fun b!1155115 () Bool)

(declare-fun e!656939 () Bool)

(declare-fun tp_is_empty!28967 () Bool)

(assert (=> b!1155115 (= e!656939 tp_is_empty!28967)))

(declare-fun res!767506 () Bool)

(assert (=> start!98832 (=> (not res!767506) (not e!656937))))

(assert (=> start!98832 (= res!767506 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36577 _keys!1208))))))

(assert (=> start!98832 e!656937))

(assert (=> start!98832 tp_is_empty!28967))

(declare-fun array_inv!27584 (array!74781) Bool)

(assert (=> start!98832 (array_inv!27584 _keys!1208)))

(assert (=> start!98832 true))

(assert (=> start!98832 tp!86022))

(declare-fun e!656942 () Bool)

(declare-fun array_inv!27585 (array!74783) Bool)

(assert (=> start!98832 (and (array_inv!27585 _values!996) e!656942)))

(declare-fun mapIsEmpty!45275 () Bool)

(declare-fun mapRes!45275 () Bool)

(assert (=> mapIsEmpty!45275 mapRes!45275))

(declare-fun b!1155124 () Bool)

(declare-fun e!656927 () Bool)

(assert (=> b!1155124 (= e!656942 (and e!656927 mapRes!45275))))

(declare-fun condMapEmpty!45275 () Bool)

(declare-fun mapDefault!45275 () ValueCell!13774)

