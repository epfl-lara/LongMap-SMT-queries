; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99448 () Bool)

(assert start!99448)

(declare-fun b_free!25027 () Bool)

(declare-fun b_next!25027 () Bool)

(assert (=> start!99448 (= b_free!25027 (not b_next!25027))))

(declare-fun tp!87795 () Bool)

(declare-fun b_and!40921 () Bool)

(assert (=> start!99448 (= tp!87795 b_and!40921)))

(declare-fun b!1174781 () Bool)

(declare-fun res!780173 () Bool)

(declare-fun e!667768 () Bool)

(assert (=> b!1174781 (=> (not res!780173) (not e!667768))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75925 0))(
  ( (array!75926 (arr!36612 (Array (_ BitVec 32) (_ BitVec 64))) (size!37148 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75925)

(assert (=> b!1174781 (= res!780173 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37148 _keys!1208))))))

(declare-fun b!1174782 () Bool)

(declare-fun res!780180 () Bool)

(assert (=> b!1174782 (=> (not res!780180) (not e!667768))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174782 (= res!780180 (validMask!0 mask!1564))))

(declare-fun b!1174783 () Bool)

(declare-fun e!667773 () Bool)

(declare-fun tp_is_empty!29557 () Bool)

(assert (=> b!1174783 (= e!667773 tp_is_empty!29557)))

(declare-fun b!1174784 () Bool)

(declare-fun e!667769 () Bool)

(assert (=> b!1174784 (= e!667769 true)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1174784 (not (= (select (arr!36612 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38766 0))(
  ( (Unit!38767) )
))
(declare-fun lt!529838 () Unit!38766)

(declare-fun e!667766 () Unit!38766)

(assert (=> b!1174784 (= lt!529838 e!667766)))

(declare-fun c!116664 () Bool)

(assert (=> b!1174784 (= c!116664 (= (select (arr!36612 _keys!1208) from!1455) k!934))))

(declare-fun e!667771 () Bool)

(assert (=> b!1174784 e!667771))

(declare-fun res!780170 () Bool)

(assert (=> b!1174784 (=> (not res!780170) (not e!667771))))

(declare-datatypes ((V!44537 0))(
  ( (V!44538 (val!14835 Int)) )
))
(declare-fun lt!529841 () V!44537)

(declare-datatypes ((tuple2!18968 0))(
  ( (tuple2!18969 (_1!9495 (_ BitVec 64)) (_2!9495 V!44537)) )
))
(declare-datatypes ((List!25705 0))(
  ( (Nil!25702) (Cons!25701 (h!26910 tuple2!18968) (t!37724 List!25705)) )
))
(declare-datatypes ((ListLongMap!16937 0))(
  ( (ListLongMap!16938 (toList!8484 List!25705)) )
))
(declare-fun lt!529835 () ListLongMap!16937)

(declare-datatypes ((ValueCell!14069 0))(
  ( (ValueCellFull!14069 (v!17473 V!44537)) (EmptyCell!14069) )
))
(declare-datatypes ((array!75927 0))(
  ( (array!75928 (arr!36613 (Array (_ BitVec 32) ValueCell!14069)) (size!37149 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75927)

(declare-fun lt!529846 () ListLongMap!16937)

(declare-fun +!3801 (ListLongMap!16937 tuple2!18968) ListLongMap!16937)

(declare-fun get!18691 (ValueCell!14069 V!44537) V!44537)

(assert (=> b!1174784 (= res!780170 (= lt!529846 (+!3801 lt!529835 (tuple2!18969 (select (arr!36612 _keys!1208) from!1455) (get!18691 (select (arr!36613 _values!996) from!1455) lt!529841)))))))

(declare-fun res!780175 () Bool)

(assert (=> start!99448 (=> (not res!780175) (not e!667768))))

(assert (=> start!99448 (= res!780175 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37148 _keys!1208))))))

(assert (=> start!99448 e!667768))

(assert (=> start!99448 tp_is_empty!29557))

(declare-fun array_inv!27970 (array!75925) Bool)

(assert (=> start!99448 (array_inv!27970 _keys!1208)))

(assert (=> start!99448 true))

(assert (=> start!99448 tp!87795))

(declare-fun e!667770 () Bool)

(declare-fun array_inv!27971 (array!75927) Bool)

(assert (=> start!99448 (and (array_inv!27971 _values!996) e!667770)))

(declare-fun mapNonEmpty!46163 () Bool)

(declare-fun mapRes!46163 () Bool)

(declare-fun tp!87794 () Bool)

(assert (=> mapNonEmpty!46163 (= mapRes!46163 (and tp!87794 e!667773))))

(declare-fun mapValue!46163 () ValueCell!14069)

(declare-fun mapKey!46163 () (_ BitVec 32))

(declare-fun mapRest!46163 () (Array (_ BitVec 32) ValueCell!14069))

(assert (=> mapNonEmpty!46163 (= (arr!36613 _values!996) (store mapRest!46163 mapKey!46163 mapValue!46163))))

(declare-fun mapIsEmpty!46163 () Bool)

(assert (=> mapIsEmpty!46163 mapRes!46163))

(declare-fun b!1174785 () Bool)

(declare-fun Unit!38768 () Unit!38766)

(assert (=> b!1174785 (= e!667766 Unit!38768)))

(declare-fun lt!529840 () Unit!38766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75925 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38766)

(assert (=> b!1174785 (= lt!529840 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174785 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529848 () Unit!38766)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75925 (_ BitVec 32) (_ BitVec 32)) Unit!38766)

(assert (=> b!1174785 (= lt!529848 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25706 0))(
  ( (Nil!25703) (Cons!25702 (h!26911 (_ BitVec 64)) (t!37725 List!25706)) )
))
(declare-fun arrayNoDuplicates!0 (array!75925 (_ BitVec 32) List!25706) Bool)

(assert (=> b!1174785 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25703)))

(declare-fun lt!529843 () Unit!38766)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75925 (_ BitVec 64) (_ BitVec 32) List!25706) Unit!38766)

(assert (=> b!1174785 (= lt!529843 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25703))))

(assert (=> b!1174785 false))

(declare-fun b!1174786 () Bool)

(declare-fun res!780174 () Bool)

(assert (=> b!1174786 (=> (not res!780174) (not e!667768))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1174786 (= res!780174 (and (= (size!37149 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37148 _keys!1208) (size!37149 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174787 () Bool)

(declare-fun res!780181 () Bool)

(assert (=> b!1174787 (=> (not res!780181) (not e!667768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174787 (= res!780181 (validKeyInArray!0 k!934))))

(declare-fun b!1174788 () Bool)

(declare-fun e!667772 () Bool)

(assert (=> b!1174788 (= e!667768 e!667772)))

(declare-fun res!780177 () Bool)

(assert (=> b!1174788 (=> (not res!780177) (not e!667772))))

(declare-fun lt!529839 () array!75925)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75925 (_ BitVec 32)) Bool)

(assert (=> b!1174788 (= res!780177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529839 mask!1564))))

(assert (=> b!1174788 (= lt!529839 (array!75926 (store (arr!36612 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37148 _keys!1208)))))

(declare-fun b!1174789 () Bool)

(declare-fun e!667767 () Bool)

(declare-fun e!667774 () Bool)

(assert (=> b!1174789 (= e!667767 e!667774)))

(declare-fun res!780169 () Bool)

(assert (=> b!1174789 (=> res!780169 e!667774)))

(assert (=> b!1174789 (= res!780169 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529836 () array!75927)

(declare-fun zeroValue!944 () V!44537)

(declare-fun minValue!944 () V!44537)

(declare-fun getCurrentListMapNoExtraKeys!4944 (array!75925 array!75927 (_ BitVec 32) (_ BitVec 32) V!44537 V!44537 (_ BitVec 32) Int) ListLongMap!16937)

(assert (=> b!1174789 (= lt!529846 (getCurrentListMapNoExtraKeys!4944 lt!529839 lt!529836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174789 (= lt!529836 (array!75928 (store (arr!36613 _values!996) i!673 (ValueCellFull!14069 lt!529841)) (size!37149 _values!996)))))

(declare-fun dynLambda!2912 (Int (_ BitVec 64)) V!44537)

(assert (=> b!1174789 (= lt!529841 (dynLambda!2912 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529847 () ListLongMap!16937)

(assert (=> b!1174789 (= lt!529847 (getCurrentListMapNoExtraKeys!4944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174790 () Bool)

(assert (=> b!1174790 (= e!667772 (not e!667767))))

(declare-fun res!780178 () Bool)

(assert (=> b!1174790 (=> res!780178 e!667767)))

(assert (=> b!1174790 (= res!780178 (bvsgt from!1455 i!673))))

(assert (=> b!1174790 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529844 () Unit!38766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75925 (_ BitVec 64) (_ BitVec 32)) Unit!38766)

(assert (=> b!1174790 (= lt!529844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174791 () Bool)

(declare-fun e!667765 () Bool)

(assert (=> b!1174791 (= e!667765 tp_is_empty!29557)))

(declare-fun b!1174792 () Bool)

(declare-fun res!780179 () Bool)

(assert (=> b!1174792 (=> (not res!780179) (not e!667768))))

(assert (=> b!1174792 (= res!780179 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25703))))

(declare-fun e!667763 () Bool)

(declare-fun b!1174793 () Bool)

(assert (=> b!1174793 (= e!667763 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1174794 () Bool)

(declare-fun res!780167 () Bool)

(assert (=> b!1174794 (=> (not res!780167) (not e!667772))))

(assert (=> b!1174794 (= res!780167 (arrayNoDuplicates!0 lt!529839 #b00000000000000000000000000000000 Nil!25703))))

(declare-fun b!1174795 () Bool)

(assert (=> b!1174795 (= e!667771 e!667763)))

(declare-fun res!780172 () Bool)

(assert (=> b!1174795 (=> res!780172 e!667763)))

(assert (=> b!1174795 (= res!780172 (not (= (select (arr!36612 _keys!1208) from!1455) k!934)))))

(declare-fun b!1174796 () Bool)

(declare-fun res!780176 () Bool)

(assert (=> b!1174796 (=> (not res!780176) (not e!667768))))

(assert (=> b!1174796 (= res!780176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174797 () Bool)

(assert (=> b!1174797 (= e!667774 e!667769)))

(declare-fun res!780171 () Bool)

(assert (=> b!1174797 (=> res!780171 e!667769)))

(assert (=> b!1174797 (= res!780171 (not (validKeyInArray!0 (select (arr!36612 _keys!1208) from!1455))))))

(declare-fun lt!529842 () ListLongMap!16937)

(assert (=> b!1174797 (= lt!529842 lt!529835)))

(declare-fun lt!529845 () ListLongMap!16937)

(declare-fun -!1541 (ListLongMap!16937 (_ BitVec 64)) ListLongMap!16937)

(assert (=> b!1174797 (= lt!529835 (-!1541 lt!529845 k!934))))

(assert (=> b!1174797 (= lt!529842 (getCurrentListMapNoExtraKeys!4944 lt!529839 lt!529836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174797 (= lt!529845 (getCurrentListMapNoExtraKeys!4944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529837 () Unit!38766)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!768 (array!75925 array!75927 (_ BitVec 32) (_ BitVec 32) V!44537 V!44537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38766)

(assert (=> b!1174797 (= lt!529837 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!768 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174798 () Bool)

(declare-fun Unit!38769 () Unit!38766)

(assert (=> b!1174798 (= e!667766 Unit!38769)))

(declare-fun b!1174799 () Bool)

(assert (=> b!1174799 (= e!667770 (and e!667765 mapRes!46163))))

(declare-fun condMapEmpty!46163 () Bool)

(declare-fun mapDefault!46163 () ValueCell!14069)

