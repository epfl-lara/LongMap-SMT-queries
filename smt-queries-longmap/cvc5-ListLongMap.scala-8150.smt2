; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99766 () Bool)

(assert start!99766)

(declare-fun b_free!25345 () Bool)

(declare-fun b_next!25345 () Bool)

(assert (=> start!99766 (= b_free!25345 (not b_next!25345))))

(declare-fun tp!88748 () Bool)

(declare-fun b_and!41557 () Bool)

(assert (=> start!99766 (= tp!88748 b_and!41557)))

(declare-fun b!1184981 () Bool)

(declare-fun res!787669 () Bool)

(declare-fun e!673740 () Bool)

(assert (=> b!1184981 (=> (not res!787669) (not e!673740))))

(declare-datatypes ((array!76549 0))(
  ( (array!76550 (arr!36924 (Array (_ BitVec 32) (_ BitVec 64))) (size!37460 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76549)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1184981 (= res!787669 (= (select (arr!36924 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!46640 () Bool)

(declare-fun mapRes!46640 () Bool)

(assert (=> mapIsEmpty!46640 mapRes!46640))

(declare-fun b!1184982 () Bool)

(declare-fun e!673741 () Bool)

(declare-fun e!673748 () Bool)

(assert (=> b!1184982 (= e!673741 e!673748)))

(declare-fun res!787677 () Bool)

(assert (=> b!1184982 (=> res!787677 e!673748)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184982 (= res!787677 (not (= (select (arr!36924 _keys!1208) from!1455) k!934)))))

(declare-fun b!1184983 () Bool)

(declare-fun arrayContainsKey!0 (array!76549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184983 (= e!673748 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184984 () Bool)

(declare-fun e!673746 () Bool)

(declare-fun tp_is_empty!29875 () Bool)

(assert (=> b!1184984 (= e!673746 tp_is_empty!29875)))

(declare-fun b!1184985 () Bool)

(declare-fun e!673744 () Bool)

(assert (=> b!1184985 (= e!673740 e!673744)))

(declare-fun res!787678 () Bool)

(assert (=> b!1184985 (=> (not res!787678) (not e!673744))))

(declare-fun lt!537595 () array!76549)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76549 (_ BitVec 32)) Bool)

(assert (=> b!1184985 (= res!787678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537595 mask!1564))))

(assert (=> b!1184985 (= lt!537595 (array!76550 (store (arr!36924 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37460 _keys!1208)))))

(declare-fun b!1184986 () Bool)

(declare-fun e!673739 () Bool)

(assert (=> b!1184986 (= e!673744 (not e!673739))))

(declare-fun res!787676 () Bool)

(assert (=> b!1184986 (=> res!787676 e!673739)))

(assert (=> b!1184986 (= res!787676 (bvsgt from!1455 i!673))))

(assert (=> b!1184986 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39245 0))(
  ( (Unit!39246) )
))
(declare-fun lt!537589 () Unit!39245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76549 (_ BitVec 64) (_ BitVec 32)) Unit!39245)

(assert (=> b!1184986 (= lt!537589 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184987 () Bool)

(declare-fun res!787672 () Bool)

(assert (=> b!1184987 (=> (not res!787672) (not e!673740))))

(declare-datatypes ((List!25970 0))(
  ( (Nil!25967) (Cons!25966 (h!27175 (_ BitVec 64)) (t!38307 List!25970)) )
))
(declare-fun arrayNoDuplicates!0 (array!76549 (_ BitVec 32) List!25970) Bool)

(assert (=> b!1184987 (= res!787672 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25967))))

(declare-fun b!1184988 () Bool)

(declare-fun res!787667 () Bool)

(assert (=> b!1184988 (=> (not res!787667) (not e!673740))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44961 0))(
  ( (V!44962 (val!14994 Int)) )
))
(declare-datatypes ((ValueCell!14228 0))(
  ( (ValueCellFull!14228 (v!17632 V!44961)) (EmptyCell!14228) )
))
(declare-datatypes ((array!76551 0))(
  ( (array!76552 (arr!36925 (Array (_ BitVec 32) ValueCell!14228)) (size!37461 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76551)

(assert (=> b!1184988 (= res!787667 (and (= (size!37461 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37460 _keys!1208) (size!37461 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184989 () Bool)

(declare-fun e!673743 () Bool)

(assert (=> b!1184989 (= e!673743 tp_is_empty!29875)))

(declare-fun b!1184990 () Bool)

(declare-fun e!673747 () Bool)

(declare-fun e!673750 () Bool)

(assert (=> b!1184990 (= e!673747 e!673750)))

(declare-fun res!787670 () Bool)

(assert (=> b!1184990 (=> res!787670 e!673750)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184990 (= res!787670 (not (validKeyInArray!0 (select (arr!36924 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19230 0))(
  ( (tuple2!19231 (_1!9626 (_ BitVec 64)) (_2!9626 V!44961)) )
))
(declare-datatypes ((List!25971 0))(
  ( (Nil!25968) (Cons!25967 (h!27176 tuple2!19230) (t!38308 List!25971)) )
))
(declare-datatypes ((ListLongMap!17199 0))(
  ( (ListLongMap!17200 (toList!8615 List!25971)) )
))
(declare-fun lt!537599 () ListLongMap!17199)

(declare-fun lt!537591 () ListLongMap!17199)

(assert (=> b!1184990 (= lt!537599 lt!537591)))

(declare-fun lt!537593 () ListLongMap!17199)

(declare-fun -!1650 (ListLongMap!17199 (_ BitVec 64)) ListLongMap!17199)

(assert (=> b!1184990 (= lt!537591 (-!1650 lt!537593 k!934))))

(declare-fun zeroValue!944 () V!44961)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537601 () array!76551)

(declare-fun minValue!944 () V!44961)

(declare-fun getCurrentListMapNoExtraKeys!5062 (array!76549 array!76551 (_ BitVec 32) (_ BitVec 32) V!44961 V!44961 (_ BitVec 32) Int) ListLongMap!17199)

(assert (=> b!1184990 (= lt!537599 (getCurrentListMapNoExtraKeys!5062 lt!537595 lt!537601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184990 (= lt!537593 (getCurrentListMapNoExtraKeys!5062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537585 () Unit!39245)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!867 (array!76549 array!76551 (_ BitVec 32) (_ BitVec 32) V!44961 V!44961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39245)

(assert (=> b!1184990 (= lt!537585 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!867 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184991 () Bool)

(declare-fun res!787666 () Bool)

(assert (=> b!1184991 (=> (not res!787666) (not e!673744))))

(assert (=> b!1184991 (= res!787666 (arrayNoDuplicates!0 lt!537595 #b00000000000000000000000000000000 Nil!25967))))

(declare-fun res!787673 () Bool)

(assert (=> start!99766 (=> (not res!787673) (not e!673740))))

(assert (=> start!99766 (= res!787673 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37460 _keys!1208))))))

(assert (=> start!99766 e!673740))

(assert (=> start!99766 tp_is_empty!29875))

(declare-fun array_inv!28178 (array!76549) Bool)

(assert (=> start!99766 (array_inv!28178 _keys!1208)))

(assert (=> start!99766 true))

(assert (=> start!99766 tp!88748))

(declare-fun e!673749 () Bool)

(declare-fun array_inv!28179 (array!76551) Bool)

(assert (=> start!99766 (and (array_inv!28179 _values!996) e!673749)))

(declare-fun b!1184992 () Bool)

(declare-fun e!673742 () Unit!39245)

(declare-fun Unit!39247 () Unit!39245)

(assert (=> b!1184992 (= e!673742 Unit!39247)))

(declare-fun lt!537603 () Unit!39245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76549 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39245)

(assert (=> b!1184992 (= lt!537603 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184992 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537590 () Unit!39245)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76549 (_ BitVec 32) (_ BitVec 32)) Unit!39245)

(assert (=> b!1184992 (= lt!537590 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184992 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25967)))

(declare-fun lt!537587 () Unit!39245)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76549 (_ BitVec 64) (_ BitVec 32) List!25970) Unit!39245)

(assert (=> b!1184992 (= lt!537587 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25967))))

(assert (=> b!1184992 false))

(declare-fun b!1184993 () Bool)

(declare-fun res!787674 () Bool)

(assert (=> b!1184993 (=> (not res!787674) (not e!673740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184993 (= res!787674 (validMask!0 mask!1564))))

(declare-fun b!1184994 () Bool)

(declare-fun res!787675 () Bool)

(assert (=> b!1184994 (=> (not res!787675) (not e!673740))))

(assert (=> b!1184994 (= res!787675 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37460 _keys!1208))))))

(declare-fun mapNonEmpty!46640 () Bool)

(declare-fun tp!88749 () Bool)

(assert (=> mapNonEmpty!46640 (= mapRes!46640 (and tp!88749 e!673746))))

(declare-fun mapValue!46640 () ValueCell!14228)

(declare-fun mapKey!46640 () (_ BitVec 32))

(declare-fun mapRest!46640 () (Array (_ BitVec 32) ValueCell!14228))

(assert (=> mapNonEmpty!46640 (= (arr!36925 _values!996) (store mapRest!46640 mapKey!46640 mapValue!46640))))

(declare-fun b!1184995 () Bool)

(declare-fun Unit!39248 () Unit!39245)

(assert (=> b!1184995 (= e!673742 Unit!39248)))

(declare-fun b!1184996 () Bool)

(assert (=> b!1184996 (= e!673739 e!673747)))

(declare-fun res!787664 () Bool)

(assert (=> b!1184996 (=> res!787664 e!673747)))

(assert (=> b!1184996 (= res!787664 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!537602 () ListLongMap!17199)

(assert (=> b!1184996 (= lt!537602 (getCurrentListMapNoExtraKeys!5062 lt!537595 lt!537601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537594 () V!44961)

(assert (=> b!1184996 (= lt!537601 (array!76552 (store (arr!36925 _values!996) i!673 (ValueCellFull!14228 lt!537594)) (size!37461 _values!996)))))

(declare-fun dynLambda!3013 (Int (_ BitVec 64)) V!44961)

(assert (=> b!1184996 (= lt!537594 (dynLambda!3013 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537597 () ListLongMap!17199)

(assert (=> b!1184996 (= lt!537597 (getCurrentListMapNoExtraKeys!5062 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184997 () Bool)

(assert (=> b!1184997 (= e!673750 true)))

(declare-fun lt!537596 () ListLongMap!17199)

(declare-fun lt!537586 () ListLongMap!17199)

(assert (=> b!1184997 (= (-!1650 lt!537596 k!934) lt!537586)))

(declare-fun lt!537588 () Unit!39245)

(declare-fun lt!537600 () V!44961)

(declare-fun addRemoveCommutativeForDiffKeys!175 (ListLongMap!17199 (_ BitVec 64) V!44961 (_ BitVec 64)) Unit!39245)

(assert (=> b!1184997 (= lt!537588 (addRemoveCommutativeForDiffKeys!175 lt!537593 (select (arr!36924 _keys!1208) from!1455) lt!537600 k!934))))

(assert (=> b!1184997 (and (= lt!537597 lt!537596) (= lt!537591 lt!537599))))

(declare-fun lt!537592 () tuple2!19230)

(declare-fun +!3912 (ListLongMap!17199 tuple2!19230) ListLongMap!17199)

(assert (=> b!1184997 (= lt!537596 (+!3912 lt!537593 lt!537592))))

(assert (=> b!1184997 (not (= (select (arr!36924 _keys!1208) from!1455) k!934))))

(declare-fun lt!537598 () Unit!39245)

(assert (=> b!1184997 (= lt!537598 e!673742)))

(declare-fun c!117141 () Bool)

(assert (=> b!1184997 (= c!117141 (= (select (arr!36924 _keys!1208) from!1455) k!934))))

(assert (=> b!1184997 e!673741))

(declare-fun res!787668 () Bool)

(assert (=> b!1184997 (=> (not res!787668) (not e!673741))))

(assert (=> b!1184997 (= res!787668 (= lt!537602 lt!537586))))

(assert (=> b!1184997 (= lt!537586 (+!3912 lt!537591 lt!537592))))

(assert (=> b!1184997 (= lt!537592 (tuple2!19231 (select (arr!36924 _keys!1208) from!1455) lt!537600))))

(declare-fun get!18901 (ValueCell!14228 V!44961) V!44961)

(assert (=> b!1184997 (= lt!537600 (get!18901 (select (arr!36925 _values!996) from!1455) lt!537594))))

(declare-fun b!1184998 () Bool)

(declare-fun res!787671 () Bool)

(assert (=> b!1184998 (=> (not res!787671) (not e!673740))))

(assert (=> b!1184998 (= res!787671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184999 () Bool)

(assert (=> b!1184999 (= e!673749 (and e!673743 mapRes!46640))))

(declare-fun condMapEmpty!46640 () Bool)

(declare-fun mapDefault!46640 () ValueCell!14228)

