; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100514 () Bool)

(assert start!100514)

(declare-fun b_free!25837 () Bool)

(declare-fun b_next!25837 () Bool)

(assert (=> start!100514 (= b_free!25837 (not b_next!25837))))

(declare-fun tp!90500 () Bool)

(declare-fun b_and!42561 () Bool)

(assert (=> start!100514 (= tp!90500 b_and!42561)))

(declare-fun b!1200941 () Bool)

(declare-fun e!681997 () Bool)

(declare-fun e!681991 () Bool)

(assert (=> b!1200941 (= e!681997 e!681991)))

(declare-fun res!799461 () Bool)

(assert (=> b!1200941 (=> (not res!799461) (not e!681991))))

(declare-datatypes ((array!77855 0))(
  ( (array!77856 (arr!37572 (Array (_ BitVec 32) (_ BitVec 64))) (size!38108 (_ BitVec 32))) )
))
(declare-fun lt!544235 () array!77855)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77855 (_ BitVec 32)) Bool)

(assert (=> b!1200941 (= res!799461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544235 mask!1564))))

(declare-fun _keys!1208 () array!77855)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200941 (= lt!544235 (array!77856 (store (arr!37572 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38108 _keys!1208)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!681990 () Bool)

(declare-datatypes ((V!45849 0))(
  ( (V!45850 (val!15327 Int)) )
))
(declare-datatypes ((tuple2!19626 0))(
  ( (tuple2!19627 (_1!9824 (_ BitVec 64)) (_2!9824 V!45849)) )
))
(declare-datatypes ((List!26444 0))(
  ( (Nil!26441) (Cons!26440 (h!27649 tuple2!19626) (t!39261 List!26444)) )
))
(declare-datatypes ((ListLongMap!17595 0))(
  ( (ListLongMap!17596 (toList!8813 List!26444)) )
))
(declare-fun call!57340 () ListLongMap!17595)

(declare-fun b!1200942 () Bool)

(declare-fun call!57341 () ListLongMap!17595)

(declare-fun -!1787 (ListLongMap!17595 (_ BitVec 64)) ListLongMap!17595)

(assert (=> b!1200942 (= e!681990 (= call!57341 (-!1787 call!57340 k!934)))))

(declare-fun mapIsEmpty!47654 () Bool)

(declare-fun mapRes!47654 () Bool)

(assert (=> mapIsEmpty!47654 mapRes!47654))

(declare-fun res!799456 () Bool)

(assert (=> start!100514 (=> (not res!799456) (not e!681997))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100514 (= res!799456 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38108 _keys!1208))))))

(assert (=> start!100514 e!681997))

(declare-fun tp_is_empty!30541 () Bool)

(assert (=> start!100514 tp_is_empty!30541))

(declare-fun array_inv!28634 (array!77855) Bool)

(assert (=> start!100514 (array_inv!28634 _keys!1208)))

(assert (=> start!100514 true))

(assert (=> start!100514 tp!90500))

(declare-datatypes ((ValueCell!14561 0))(
  ( (ValueCellFull!14561 (v!17965 V!45849)) (EmptyCell!14561) )
))
(declare-datatypes ((array!77857 0))(
  ( (array!77858 (arr!37573 (Array (_ BitVec 32) ValueCell!14561)) (size!38109 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77857)

(declare-fun e!681995 () Bool)

(declare-fun array_inv!28635 (array!77857) Bool)

(assert (=> start!100514 (and (array_inv!28635 _values!996) e!681995)))

(declare-fun b!1200943 () Bool)

(declare-fun e!681988 () Bool)

(assert (=> b!1200943 (= e!681988 tp_is_empty!30541)))

(declare-fun b!1200944 () Bool)

(declare-fun e!681993 () Bool)

(assert (=> b!1200944 (= e!681993 tp_is_empty!30541)))

(declare-fun b!1200945 () Bool)

(declare-fun e!681996 () Bool)

(assert (=> b!1200945 (= e!681996 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45849)

(declare-fun lt!544233 () Bool)

(declare-fun zeroValue!944 () V!45849)

(declare-fun contains!6872 (ListLongMap!17595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!5252 (array!77855 array!77857 (_ BitVec 32) (_ BitVec 32) V!45849 V!45849 (_ BitVec 32) Int) ListLongMap!17595)

(assert (=> b!1200945 (= lt!544233 (contains!6872 (getCurrentListMapNoExtraKeys!5252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1200946 () Bool)

(declare-fun res!799455 () Bool)

(assert (=> b!1200946 (=> (not res!799455) (not e!681997))))

(assert (=> b!1200946 (= res!799455 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38108 _keys!1208))))))

(declare-fun b!1200947 () Bool)

(declare-fun res!799464 () Bool)

(assert (=> b!1200947 (=> (not res!799464) (not e!681997))))

(assert (=> b!1200947 (= res!799464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200948 () Bool)

(declare-fun res!799463 () Bool)

(assert (=> b!1200948 (=> (not res!799463) (not e!681997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200948 (= res!799463 (validKeyInArray!0 k!934))))

(declare-fun b!1200949 () Bool)

(declare-fun e!681989 () Bool)

(assert (=> b!1200949 (= e!681991 (not e!681989))))

(declare-fun res!799465 () Bool)

(assert (=> b!1200949 (=> res!799465 e!681989)))

(assert (=> b!1200949 (= res!799465 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200949 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39814 0))(
  ( (Unit!39815) )
))
(declare-fun lt!544234 () Unit!39814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77855 (_ BitVec 64) (_ BitVec 32)) Unit!39814)

(assert (=> b!1200949 (= lt!544234 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!57337 () Bool)

(assert (=> bm!57337 (= call!57340 (getCurrentListMapNoExtraKeys!5252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200950 () Bool)

(declare-fun e!681994 () Bool)

(assert (=> b!1200950 (= e!681994 e!681996)))

(declare-fun res!799466 () Bool)

(assert (=> b!1200950 (=> res!799466 e!681996)))

(assert (=> b!1200950 (= res!799466 (not (= (select (arr!37572 _keys!1208) from!1455) k!934)))))

(assert (=> b!1200950 e!681990))

(declare-fun c!117467 () Bool)

(assert (=> b!1200950 (= c!117467 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544232 () Unit!39814)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!993 (array!77855 array!77857 (_ BitVec 32) (_ BitVec 32) V!45849 V!45849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39814)

(assert (=> b!1200950 (= lt!544232 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!993 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57338 () Bool)

(declare-fun lt!544237 () array!77857)

(assert (=> bm!57338 (= call!57341 (getCurrentListMapNoExtraKeys!5252 lt!544235 lt!544237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47654 () Bool)

(declare-fun tp!90501 () Bool)

(assert (=> mapNonEmpty!47654 (= mapRes!47654 (and tp!90501 e!681988))))

(declare-fun mapRest!47654 () (Array (_ BitVec 32) ValueCell!14561))

(declare-fun mapKey!47654 () (_ BitVec 32))

(declare-fun mapValue!47654 () ValueCell!14561)

(assert (=> mapNonEmpty!47654 (= (arr!37573 _values!996) (store mapRest!47654 mapKey!47654 mapValue!47654))))

(declare-fun b!1200951 () Bool)

(assert (=> b!1200951 (= e!681989 e!681994)))

(declare-fun res!799462 () Bool)

(assert (=> b!1200951 (=> res!799462 e!681994)))

(assert (=> b!1200951 (= res!799462 (not (= from!1455 i!673)))))

(declare-fun lt!544236 () ListLongMap!17595)

(assert (=> b!1200951 (= lt!544236 (getCurrentListMapNoExtraKeys!5252 lt!544235 lt!544237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3169 (Int (_ BitVec 64)) V!45849)

(assert (=> b!1200951 (= lt!544237 (array!77858 (store (arr!37573 _values!996) i!673 (ValueCellFull!14561 (dynLambda!3169 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38109 _values!996)))))

(declare-fun lt!544231 () ListLongMap!17595)

(assert (=> b!1200951 (= lt!544231 (getCurrentListMapNoExtraKeys!5252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200952 () Bool)

(declare-fun res!799457 () Bool)

(assert (=> b!1200952 (=> (not res!799457) (not e!681991))))

(declare-datatypes ((List!26445 0))(
  ( (Nil!26442) (Cons!26441 (h!27650 (_ BitVec 64)) (t!39262 List!26445)) )
))
(declare-fun arrayNoDuplicates!0 (array!77855 (_ BitVec 32) List!26445) Bool)

(assert (=> b!1200952 (= res!799457 (arrayNoDuplicates!0 lt!544235 #b00000000000000000000000000000000 Nil!26442))))

(declare-fun b!1200953 () Bool)

(assert (=> b!1200953 (= e!681990 (= call!57341 call!57340))))

(declare-fun b!1200954 () Bool)

(declare-fun res!799458 () Bool)

(assert (=> b!1200954 (=> (not res!799458) (not e!681997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200954 (= res!799458 (validMask!0 mask!1564))))

(declare-fun b!1200955 () Bool)

(declare-fun res!799467 () Bool)

(assert (=> b!1200955 (=> (not res!799467) (not e!681997))))

(assert (=> b!1200955 (= res!799467 (and (= (size!38109 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38108 _keys!1208) (size!38109 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200956 () Bool)

(declare-fun res!799459 () Bool)

(assert (=> b!1200956 (=> (not res!799459) (not e!681997))))

(assert (=> b!1200956 (= res!799459 (= (select (arr!37572 _keys!1208) i!673) k!934))))

(declare-fun b!1200957 () Bool)

(assert (=> b!1200957 (= e!681995 (and e!681993 mapRes!47654))))

(declare-fun condMapEmpty!47654 () Bool)

(declare-fun mapDefault!47654 () ValueCell!14561)

