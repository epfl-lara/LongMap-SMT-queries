; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97998 () Bool)

(assert start!97998)

(declare-fun b_free!23699 () Bool)

(declare-fun b_next!23699 () Bool)

(assert (=> start!97998 (= b_free!23699 (not b_next!23699))))

(declare-fun tp!83801 () Bool)

(declare-fun b_and!38181 () Bool)

(assert (=> start!97998 (= tp!83801 b_and!38181)))

(declare-fun b!1124016 () Bool)

(declare-fun e!639884 () Bool)

(declare-datatypes ((V!42765 0))(
  ( (V!42766 (val!14171 Int)) )
))
(declare-datatypes ((tuple2!17798 0))(
  ( (tuple2!17799 (_1!8910 (_ BitVec 64)) (_2!8910 V!42765)) )
))
(declare-datatypes ((List!24577 0))(
  ( (Nil!24574) (Cons!24573 (h!25782 tuple2!17798) (t!35268 List!24577)) )
))
(declare-datatypes ((ListLongMap!15767 0))(
  ( (ListLongMap!15768 (toList!7899 List!24577)) )
))
(declare-fun call!47379 () ListLongMap!15767)

(declare-fun call!47380 () ListLongMap!15767)

(assert (=> b!1124016 (= e!639884 (= call!47379 call!47380))))

(declare-fun mapNonEmpty!44161 () Bool)

(declare-fun mapRes!44161 () Bool)

(declare-fun tp!83800 () Bool)

(declare-fun e!639875 () Bool)

(assert (=> mapNonEmpty!44161 (= mapRes!44161 (and tp!83800 e!639875))))

(declare-fun mapKey!44161 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13405 0))(
  ( (ValueCellFull!13405 (v!16804 V!42765)) (EmptyCell!13405) )
))
(declare-datatypes ((array!73325 0))(
  ( (array!73326 (arr!35315 (Array (_ BitVec 32) ValueCell!13405)) (size!35851 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73325)

(declare-fun mapValue!44161 () ValueCell!13405)

(declare-fun mapRest!44161 () (Array (_ BitVec 32) ValueCell!13405))

(assert (=> mapNonEmpty!44161 (= (arr!35315 _values!996) (store mapRest!44161 mapKey!44161 mapValue!44161))))

(declare-fun b!1124017 () Bool)

(declare-fun e!639880 () Bool)

(assert (=> b!1124017 (= e!639880 true)))

(declare-fun lt!499297 () ListLongMap!15767)

(declare-fun zeroValue!944 () V!42765)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6438 (ListLongMap!15767 (_ BitVec 64)) Bool)

(declare-fun +!3410 (ListLongMap!15767 tuple2!17798) ListLongMap!15767)

(assert (=> b!1124017 (contains!6438 (+!3410 lt!499297 (tuple2!17799 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36852 0))(
  ( (Unit!36853) )
))
(declare-fun lt!499301 () Unit!36852)

(declare-fun addStillContains!672 (ListLongMap!15767 (_ BitVec 64) V!42765 (_ BitVec 64)) Unit!36852)

(assert (=> b!1124017 (= lt!499301 (addStillContains!672 lt!499297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun b!1124018 () Bool)

(declare-fun -!1104 (ListLongMap!15767 (_ BitVec 64)) ListLongMap!15767)

(assert (=> b!1124018 (= e!639884 (= call!47379 (-!1104 call!47380 k!934)))))

(declare-fun b!1124019 () Bool)

(declare-fun e!639877 () Bool)

(declare-fun e!639885 () Bool)

(assert (=> b!1124019 (= e!639877 e!639885)))

(declare-fun res!750995 () Bool)

(assert (=> b!1124019 (=> res!750995 e!639885)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124019 (= res!750995 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!73327 0))(
  ( (array!73328 (arr!35316 (Array (_ BitVec 32) (_ BitVec 64))) (size!35852 (_ BitVec 32))) )
))
(declare-fun lt!499299 () array!73327)

(declare-fun lt!499302 () ListLongMap!15767)

(declare-fun minValue!944 () V!42765)

(declare-fun lt!499303 () array!73325)

(declare-fun getCurrentListMapNoExtraKeys!4387 (array!73327 array!73325 (_ BitVec 32) (_ BitVec 32) V!42765 V!42765 (_ BitVec 32) Int) ListLongMap!15767)

(assert (=> b!1124019 (= lt!499302 (getCurrentListMapNoExtraKeys!4387 lt!499299 lt!499303 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2483 (Int (_ BitVec 64)) V!42765)

(assert (=> b!1124019 (= lt!499303 (array!73326 (store (arr!35315 _values!996) i!673 (ValueCellFull!13405 (dynLambda!2483 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35851 _values!996)))))

(declare-fun _keys!1208 () array!73327)

(declare-fun lt!499298 () ListLongMap!15767)

(assert (=> b!1124019 (= lt!499298 (getCurrentListMapNoExtraKeys!4387 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124021 () Bool)

(declare-fun res!750990 () Bool)

(declare-fun e!639883 () Bool)

(assert (=> b!1124021 (=> (not res!750990) (not e!639883))))

(assert (=> b!1124021 (= res!750990 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35852 _keys!1208))))))

(declare-fun b!1124022 () Bool)

(declare-fun res!750992 () Bool)

(assert (=> b!1124022 (=> res!750992 e!639880)))

(assert (=> b!1124022 (= res!750992 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1124023 () Bool)

(declare-fun res!750991 () Bool)

(assert (=> b!1124023 (=> (not res!750991) (not e!639883))))

(assert (=> b!1124023 (= res!750991 (and (= (size!35851 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35852 _keys!1208) (size!35851 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!47376 () Bool)

(assert (=> bm!47376 (= call!47379 (getCurrentListMapNoExtraKeys!4387 lt!499299 lt!499303 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124024 () Bool)

(declare-fun tp_is_empty!28229 () Bool)

(assert (=> b!1124024 (= e!639875 tp_is_empty!28229)))

(declare-fun b!1124025 () Bool)

(declare-fun res!750986 () Bool)

(assert (=> b!1124025 (=> (not res!750986) (not e!639883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73327 (_ BitVec 32)) Bool)

(assert (=> b!1124025 (= res!750986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124026 () Bool)

(declare-fun e!639876 () Bool)

(assert (=> b!1124026 (= e!639876 (not e!639877))))

(declare-fun res!750999 () Bool)

(assert (=> b!1124026 (=> res!750999 e!639877)))

(assert (=> b!1124026 (= res!750999 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124026 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499304 () Unit!36852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73327 (_ BitVec 64) (_ BitVec 32)) Unit!36852)

(assert (=> b!1124026 (= lt!499304 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1124027 () Bool)

(declare-fun e!639879 () Bool)

(assert (=> b!1124027 (= e!639879 tp_is_empty!28229)))

(declare-fun b!1124028 () Bool)

(declare-fun res!750994 () Bool)

(assert (=> b!1124028 (=> (not res!750994) (not e!639883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124028 (= res!750994 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44161 () Bool)

(assert (=> mapIsEmpty!44161 mapRes!44161))

(declare-fun bm!47377 () Bool)

(assert (=> bm!47377 (= call!47380 (getCurrentListMapNoExtraKeys!4387 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124029 () Bool)

(declare-fun res!750988 () Bool)

(assert (=> b!1124029 (=> (not res!750988) (not e!639883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124029 (= res!750988 (validKeyInArray!0 k!934))))

(declare-fun b!1124030 () Bool)

(declare-fun e!639878 () Bool)

(assert (=> b!1124030 (= e!639885 e!639878)))

(declare-fun res!750987 () Bool)

(assert (=> b!1124030 (=> res!750987 e!639878)))

(assert (=> b!1124030 (= res!750987 (not (= (select (arr!35316 _keys!1208) from!1455) k!934)))))

(assert (=> b!1124030 e!639884))

(declare-fun c!109539 () Bool)

(assert (=> b!1124030 (= c!109539 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499300 () Unit!36852)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!351 (array!73327 array!73325 (_ BitVec 32) (_ BitVec 32) V!42765 V!42765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36852)

(assert (=> b!1124030 (= lt!499300 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124031 () Bool)

(declare-fun res!750993 () Bool)

(assert (=> b!1124031 (=> (not res!750993) (not e!639876))))

(declare-datatypes ((List!24578 0))(
  ( (Nil!24575) (Cons!24574 (h!25783 (_ BitVec 64)) (t!35269 List!24578)) )
))
(declare-fun arrayNoDuplicates!0 (array!73327 (_ BitVec 32) List!24578) Bool)

(assert (=> b!1124031 (= res!750993 (arrayNoDuplicates!0 lt!499299 #b00000000000000000000000000000000 Nil!24575))))

(declare-fun b!1124032 () Bool)

(declare-fun e!639882 () Bool)

(assert (=> b!1124032 (= e!639882 (and e!639879 mapRes!44161))))

(declare-fun condMapEmpty!44161 () Bool)

(declare-fun mapDefault!44161 () ValueCell!13405)

