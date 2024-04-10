; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99736 () Bool)

(assert start!99736)

(declare-fun b_free!25315 () Bool)

(declare-fun b_next!25315 () Bool)

(assert (=> start!99736 (= b_free!25315 (not b_next!25315))))

(declare-fun tp!88658 () Bool)

(declare-fun b_and!41497 () Bool)

(assert (=> start!99736 (= tp!88658 b_and!41497)))

(declare-fun b!1184051 () Bool)

(declare-fun e!673209 () Bool)

(assert (=> b!1184051 (= e!673209 true)))

(declare-datatypes ((V!44921 0))(
  ( (V!44922 (val!14979 Int)) )
))
(declare-datatypes ((tuple2!19206 0))(
  ( (tuple2!19207 (_1!9614 (_ BitVec 64)) (_2!9614 V!44921)) )
))
(declare-datatypes ((List!25945 0))(
  ( (Nil!25942) (Cons!25941 (h!27150 tuple2!19206) (t!38252 List!25945)) )
))
(declare-datatypes ((ListLongMap!17175 0))(
  ( (ListLongMap!17176 (toList!8603 List!25945)) )
))
(declare-fun lt!536731 () ListLongMap!17175)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!536747 () ListLongMap!17175)

(declare-fun -!1638 (ListLongMap!17175 (_ BitVec 64)) ListLongMap!17175)

(assert (=> b!1184051 (= (-!1638 lt!536731 k!934) lt!536747)))

(declare-datatypes ((array!76491 0))(
  ( (array!76492 (arr!36895 (Array (_ BitVec 32) (_ BitVec 64))) (size!37431 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76491)

(declare-fun lt!536738 () ListLongMap!17175)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39196 0))(
  ( (Unit!39197) )
))
(declare-fun lt!536733 () Unit!39196)

(declare-fun lt!536742 () V!44921)

(declare-fun addRemoveCommutativeForDiffKeys!163 (ListLongMap!17175 (_ BitVec 64) V!44921 (_ BitVec 64)) Unit!39196)

(assert (=> b!1184051 (= lt!536733 (addRemoveCommutativeForDiffKeys!163 lt!536738 (select (arr!36895 _keys!1208) from!1455) lt!536742 k!934))))

(declare-fun lt!536734 () ListLongMap!17175)

(declare-fun lt!536736 () ListLongMap!17175)

(declare-fun lt!536744 () ListLongMap!17175)

(assert (=> b!1184051 (and (= lt!536744 lt!536731) (= lt!536736 lt!536734))))

(declare-fun lt!536739 () tuple2!19206)

(declare-fun +!3900 (ListLongMap!17175 tuple2!19206) ListLongMap!17175)

(assert (=> b!1184051 (= lt!536731 (+!3900 lt!536738 lt!536739))))

(assert (=> b!1184051 (not (= (select (arr!36895 _keys!1208) from!1455) k!934))))

(declare-fun lt!536730 () Unit!39196)

(declare-fun e!673207 () Unit!39196)

(assert (=> b!1184051 (= lt!536730 e!673207)))

(declare-fun c!117096 () Bool)

(assert (=> b!1184051 (= c!117096 (= (select (arr!36895 _keys!1208) from!1455) k!934))))

(declare-fun e!673208 () Bool)

(assert (=> b!1184051 e!673208))

(declare-fun res!786992 () Bool)

(assert (=> b!1184051 (=> (not res!786992) (not e!673208))))

(declare-fun lt!536746 () ListLongMap!17175)

(assert (=> b!1184051 (= res!786992 (= lt!536746 lt!536747))))

(assert (=> b!1184051 (= lt!536747 (+!3900 lt!536736 lt!536739))))

(assert (=> b!1184051 (= lt!536739 (tuple2!19207 (select (arr!36895 _keys!1208) from!1455) lt!536742))))

(declare-fun lt!536743 () V!44921)

(declare-datatypes ((ValueCell!14213 0))(
  ( (ValueCellFull!14213 (v!17617 V!44921)) (EmptyCell!14213) )
))
(declare-datatypes ((array!76493 0))(
  ( (array!76494 (arr!36896 (Array (_ BitVec 32) ValueCell!14213)) (size!37432 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76493)

(declare-fun get!18879 (ValueCell!14213 V!44921) V!44921)

(assert (=> b!1184051 (= lt!536742 (get!18879 (select (arr!36896 _values!996) from!1455) lt!536743))))

(declare-fun res!786995 () Bool)

(declare-fun e!673201 () Bool)

(assert (=> start!99736 (=> (not res!786995) (not e!673201))))

(assert (=> start!99736 (= res!786995 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37431 _keys!1208))))))

(assert (=> start!99736 e!673201))

(declare-fun tp_is_empty!29845 () Bool)

(assert (=> start!99736 tp_is_empty!29845))

(declare-fun array_inv!28160 (array!76491) Bool)

(assert (=> start!99736 (array_inv!28160 _keys!1208)))

(assert (=> start!99736 true))

(assert (=> start!99736 tp!88658))

(declare-fun e!673204 () Bool)

(declare-fun array_inv!28161 (array!76493) Bool)

(assert (=> start!99736 (and (array_inv!28161 _values!996) e!673204)))

(declare-fun mapNonEmpty!46595 () Bool)

(declare-fun mapRes!46595 () Bool)

(declare-fun tp!88659 () Bool)

(declare-fun e!673210 () Bool)

(assert (=> mapNonEmpty!46595 (= mapRes!46595 (and tp!88659 e!673210))))

(declare-fun mapKey!46595 () (_ BitVec 32))

(declare-fun mapValue!46595 () ValueCell!14213)

(declare-fun mapRest!46595 () (Array (_ BitVec 32) ValueCell!14213))

(assert (=> mapNonEmpty!46595 (= (arr!36896 _values!996) (store mapRest!46595 mapKey!46595 mapValue!46595))))

(declare-fun b!1184052 () Bool)

(declare-fun res!786999 () Bool)

(assert (=> b!1184052 (=> (not res!786999) (not e!673201))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184052 (= res!786999 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46595 () Bool)

(assert (=> mapIsEmpty!46595 mapRes!46595))

(declare-fun b!1184053 () Bool)

(declare-fun e!673203 () Bool)

(assert (=> b!1184053 (= e!673203 tp_is_empty!29845)))

(declare-fun b!1184054 () Bool)

(declare-fun e!673200 () Bool)

(assert (=> b!1184054 (= e!673200 e!673209)))

(declare-fun res!786989 () Bool)

(assert (=> b!1184054 (=> res!786989 e!673209)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184054 (= res!786989 (not (validKeyInArray!0 (select (arr!36895 _keys!1208) from!1455))))))

(assert (=> b!1184054 (= lt!536734 lt!536736)))

(assert (=> b!1184054 (= lt!536736 (-!1638 lt!536738 k!934))))

(declare-fun zeroValue!944 () V!44921)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!536735 () array!76491)

(declare-fun minValue!944 () V!44921)

(declare-fun lt!536737 () array!76493)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5053 (array!76491 array!76493 (_ BitVec 32) (_ BitVec 32) V!44921 V!44921 (_ BitVec 32) Int) ListLongMap!17175)

(assert (=> b!1184054 (= lt!536734 (getCurrentListMapNoExtraKeys!5053 lt!536735 lt!536737 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184054 (= lt!536738 (getCurrentListMapNoExtraKeys!5053 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!536732 () Unit!39196)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!858 (array!76491 array!76493 (_ BitVec 32) (_ BitVec 32) V!44921 V!44921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39196)

(assert (=> b!1184054 (= lt!536732 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!858 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184055 () Bool)

(declare-fun res!786996 () Bool)

(assert (=> b!1184055 (=> (not res!786996) (not e!673201))))

(assert (=> b!1184055 (= res!786996 (= (select (arr!36895 _keys!1208) i!673) k!934))))

(declare-fun b!1184056 () Bool)

(declare-fun e!673206 () Bool)

(assert (=> b!1184056 (= e!673208 e!673206)))

(declare-fun res!786998 () Bool)

(assert (=> b!1184056 (=> res!786998 e!673206)))

(assert (=> b!1184056 (= res!786998 (not (= (select (arr!36895 _keys!1208) from!1455) k!934)))))

(declare-fun b!1184057 () Bool)

(declare-fun res!786994 () Bool)

(assert (=> b!1184057 (=> (not res!786994) (not e!673201))))

(assert (=> b!1184057 (= res!786994 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37431 _keys!1208))))))

(declare-fun b!1184058 () Bool)

(declare-fun res!787001 () Bool)

(assert (=> b!1184058 (=> (not res!787001) (not e!673201))))

(declare-datatypes ((List!25946 0))(
  ( (Nil!25943) (Cons!25942 (h!27151 (_ BitVec 64)) (t!38253 List!25946)) )
))
(declare-fun arrayNoDuplicates!0 (array!76491 (_ BitVec 32) List!25946) Bool)

(assert (=> b!1184058 (= res!787001 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25943))))

(declare-fun b!1184059 () Bool)

(declare-fun Unit!39198 () Unit!39196)

(assert (=> b!1184059 (= e!673207 Unit!39198)))

(declare-fun lt!536745 () Unit!39196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39196)

(assert (=> b!1184059 (= lt!536745 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184059 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536740 () Unit!39196)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76491 (_ BitVec 32) (_ BitVec 32)) Unit!39196)

(assert (=> b!1184059 (= lt!536740 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184059 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25943)))

(declare-fun lt!536748 () Unit!39196)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76491 (_ BitVec 64) (_ BitVec 32) List!25946) Unit!39196)

(assert (=> b!1184059 (= lt!536748 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25943))))

(assert (=> b!1184059 false))

(declare-fun b!1184060 () Bool)

(declare-fun res!787000 () Bool)

(assert (=> b!1184060 (=> (not res!787000) (not e!673201))))

(assert (=> b!1184060 (= res!787000 (validKeyInArray!0 k!934))))

(declare-fun b!1184061 () Bool)

(declare-fun Unit!39199 () Unit!39196)

(assert (=> b!1184061 (= e!673207 Unit!39199)))

(declare-fun b!1184062 () Bool)

(declare-fun e!673202 () Bool)

(declare-fun e!673205 () Bool)

(assert (=> b!1184062 (= e!673202 (not e!673205))))

(declare-fun res!786991 () Bool)

(assert (=> b!1184062 (=> res!786991 e!673205)))

(assert (=> b!1184062 (= res!786991 (bvsgt from!1455 i!673))))

(assert (=> b!1184062 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!536741 () Unit!39196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76491 (_ BitVec 64) (_ BitVec 32)) Unit!39196)

(assert (=> b!1184062 (= lt!536741 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184063 () Bool)

(declare-fun res!787003 () Bool)

(assert (=> b!1184063 (=> (not res!787003) (not e!673201))))

(assert (=> b!1184063 (= res!787003 (and (= (size!37432 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37431 _keys!1208) (size!37432 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184064 () Bool)

(assert (=> b!1184064 (= e!673205 e!673200)))

(declare-fun res!786997 () Bool)

(assert (=> b!1184064 (=> res!786997 e!673200)))

(assert (=> b!1184064 (= res!786997 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184064 (= lt!536746 (getCurrentListMapNoExtraKeys!5053 lt!536735 lt!536737 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184064 (= lt!536737 (array!76494 (store (arr!36896 _values!996) i!673 (ValueCellFull!14213 lt!536743)) (size!37432 _values!996)))))

(declare-fun dynLambda!3004 (Int (_ BitVec 64)) V!44921)

(assert (=> b!1184064 (= lt!536743 (dynLambda!3004 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184064 (= lt!536744 (getCurrentListMapNoExtraKeys!5053 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184065 () Bool)

(assert (=> b!1184065 (= e!673204 (and e!673203 mapRes!46595))))

(declare-fun condMapEmpty!46595 () Bool)

(declare-fun mapDefault!46595 () ValueCell!14213)

