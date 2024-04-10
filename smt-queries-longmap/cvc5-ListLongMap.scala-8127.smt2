; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99628 () Bool)

(assert start!99628)

(declare-fun b_free!25207 () Bool)

(declare-fun b_next!25207 () Bool)

(assert (=> start!99628 (= b_free!25207 (not b_next!25207))))

(declare-fun tp!88334 () Bool)

(declare-fun b_and!41281 () Bool)

(assert (=> start!99628 (= tp!88334 b_and!41281)))

(declare-fun b!1180617 () Bool)

(declare-datatypes ((Unit!39030 0))(
  ( (Unit!39031) )
))
(declare-fun e!671214 () Unit!39030)

(declare-fun Unit!39032 () Unit!39030)

(assert (=> b!1180617 (= e!671214 Unit!39032)))

(declare-datatypes ((array!76277 0))(
  ( (array!76278 (arr!36788 (Array (_ BitVec 32) (_ BitVec 64))) (size!37324 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76277)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!533824 () Unit!39030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39030)

(assert (=> b!1180617 (= lt!533824 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180617 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533825 () Unit!39030)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76277 (_ BitVec 32) (_ BitVec 32)) Unit!39030)

(assert (=> b!1180617 (= lt!533825 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25853 0))(
  ( (Nil!25850) (Cons!25849 (h!27058 (_ BitVec 64)) (t!38052 List!25853)) )
))
(declare-fun arrayNoDuplicates!0 (array!76277 (_ BitVec 32) List!25853) Bool)

(assert (=> b!1180617 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25850)))

(declare-fun lt!533829 () Unit!39030)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76277 (_ BitVec 64) (_ BitVec 32) List!25853) Unit!39030)

(assert (=> b!1180617 (= lt!533829 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25850))))

(assert (=> b!1180617 false))

(declare-fun mapNonEmpty!46433 () Bool)

(declare-fun mapRes!46433 () Bool)

(declare-fun tp!88335 () Bool)

(declare-fun e!671222 () Bool)

(assert (=> mapNonEmpty!46433 (= mapRes!46433 (and tp!88335 e!671222))))

(declare-datatypes ((V!44777 0))(
  ( (V!44778 (val!14925 Int)) )
))
(declare-datatypes ((ValueCell!14159 0))(
  ( (ValueCellFull!14159 (v!17563 V!44777)) (EmptyCell!14159) )
))
(declare-fun mapValue!46433 () ValueCell!14159)

(declare-fun mapRest!46433 () (Array (_ BitVec 32) ValueCell!14159))

(declare-datatypes ((array!76279 0))(
  ( (array!76280 (arr!36789 (Array (_ BitVec 32) ValueCell!14159)) (size!37325 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76279)

(declare-fun mapKey!46433 () (_ BitVec 32))

(assert (=> mapNonEmpty!46433 (= (arr!36789 _values!996) (store mapRest!46433 mapKey!46433 mapValue!46433))))

(declare-fun b!1180619 () Bool)

(declare-fun res!784483 () Bool)

(declare-fun e!671218 () Bool)

(assert (=> b!1180619 (=> (not res!784483) (not e!671218))))

(assert (=> b!1180619 (= res!784483 (= (select (arr!36788 _keys!1208) i!673) k!934))))

(declare-fun b!1180620 () Bool)

(declare-fun e!671223 () Bool)

(declare-fun e!671212 () Bool)

(assert (=> b!1180620 (= e!671223 e!671212)))

(declare-fun res!784487 () Bool)

(assert (=> b!1180620 (=> res!784487 e!671212)))

(assert (=> b!1180620 (= res!784487 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44777)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19114 0))(
  ( (tuple2!19115 (_1!9568 (_ BitVec 64)) (_2!9568 V!44777)) )
))
(declare-datatypes ((List!25854 0))(
  ( (Nil!25851) (Cons!25850 (h!27059 tuple2!19114) (t!38053 List!25854)) )
))
(declare-datatypes ((ListLongMap!17083 0))(
  ( (ListLongMap!17084 (toList!8557 List!25854)) )
))
(declare-fun lt!533837 () ListLongMap!17083)

(declare-fun lt!533836 () array!76279)

(declare-fun minValue!944 () V!44777)

(declare-fun lt!533828 () array!76277)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5011 (array!76277 array!76279 (_ BitVec 32) (_ BitVec 32) V!44777 V!44777 (_ BitVec 32) Int) ListLongMap!17083)

(assert (=> b!1180620 (= lt!533837 (getCurrentListMapNoExtraKeys!5011 lt!533828 lt!533836 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533831 () V!44777)

(assert (=> b!1180620 (= lt!533836 (array!76280 (store (arr!36789 _values!996) i!673 (ValueCellFull!14159 lt!533831)) (size!37325 _values!996)))))

(declare-fun dynLambda!2968 (Int (_ BitVec 64)) V!44777)

(assert (=> b!1180620 (= lt!533831 (dynLambda!2968 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533832 () ListLongMap!17083)

(assert (=> b!1180620 (= lt!533832 (getCurrentListMapNoExtraKeys!5011 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180621 () Bool)

(declare-fun res!784484 () Bool)

(assert (=> b!1180621 (=> (not res!784484) (not e!671218))))

(assert (=> b!1180621 (= res!784484 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37324 _keys!1208))))))

(declare-fun b!1180622 () Bool)

(declare-fun e!671219 () Bool)

(assert (=> b!1180622 (= e!671219 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1180623 () Bool)

(declare-fun res!784480 () Bool)

(assert (=> b!1180623 (=> (not res!784480) (not e!671218))))

(assert (=> b!1180623 (= res!784480 (and (= (size!37325 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37324 _keys!1208) (size!37325 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180624 () Bool)

(declare-fun res!784489 () Bool)

(declare-fun e!671215 () Bool)

(assert (=> b!1180624 (=> (not res!784489) (not e!671215))))

(assert (=> b!1180624 (= res!784489 (arrayNoDuplicates!0 lt!533828 #b00000000000000000000000000000000 Nil!25850))))

(declare-fun b!1180625 () Bool)

(declare-fun e!671216 () Bool)

(assert (=> b!1180625 (= e!671216 true)))

(declare-fun e!671217 () Bool)

(assert (=> b!1180625 e!671217))

(declare-fun res!784478 () Bool)

(assert (=> b!1180625 (=> (not res!784478) (not e!671217))))

(assert (=> b!1180625 (= res!784478 (not (= (select (arr!36788 _keys!1208) from!1455) k!934)))))

(declare-fun lt!533838 () Unit!39030)

(assert (=> b!1180625 (= lt!533838 e!671214)))

(declare-fun c!116934 () Bool)

(assert (=> b!1180625 (= c!116934 (= (select (arr!36788 _keys!1208) from!1455) k!934))))

(declare-fun e!671224 () Bool)

(assert (=> b!1180625 e!671224))

(declare-fun res!784488 () Bool)

(assert (=> b!1180625 (=> (not res!784488) (not e!671224))))

(declare-fun lt!533826 () ListLongMap!17083)

(declare-fun lt!533833 () tuple2!19114)

(declare-fun +!3866 (ListLongMap!17083 tuple2!19114) ListLongMap!17083)

(assert (=> b!1180625 (= res!784488 (= lt!533837 (+!3866 lt!533826 lt!533833)))))

(declare-fun get!18813 (ValueCell!14159 V!44777) V!44777)

(assert (=> b!1180625 (= lt!533833 (tuple2!19115 (select (arr!36788 _keys!1208) from!1455) (get!18813 (select (arr!36789 _values!996) from!1455) lt!533831)))))

(declare-fun b!1180626 () Bool)

(assert (=> b!1180626 (= e!671224 e!671219)))

(declare-fun res!784477 () Bool)

(assert (=> b!1180626 (=> res!784477 e!671219)))

(assert (=> b!1180626 (= res!784477 (not (= (select (arr!36788 _keys!1208) from!1455) k!934)))))

(declare-fun b!1180627 () Bool)

(declare-fun res!784482 () Bool)

(assert (=> b!1180627 (=> (not res!784482) (not e!671218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76277 (_ BitVec 32)) Bool)

(assert (=> b!1180627 (= res!784482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180628 () Bool)

(declare-fun lt!533835 () ListLongMap!17083)

(assert (=> b!1180628 (= e!671217 (= lt!533826 lt!533835))))

(declare-fun b!1180618 () Bool)

(assert (=> b!1180618 (= e!671215 (not e!671223))))

(declare-fun res!784476 () Bool)

(assert (=> b!1180618 (=> res!784476 e!671223)))

(assert (=> b!1180618 (= res!784476 (bvsgt from!1455 i!673))))

(assert (=> b!1180618 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!533827 () Unit!39030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76277 (_ BitVec 64) (_ BitVec 32)) Unit!39030)

(assert (=> b!1180618 (= lt!533827 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!784485 () Bool)

(assert (=> start!99628 (=> (not res!784485) (not e!671218))))

(assert (=> start!99628 (= res!784485 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37324 _keys!1208))))))

(assert (=> start!99628 e!671218))

(declare-fun tp_is_empty!29737 () Bool)

(assert (=> start!99628 tp_is_empty!29737))

(declare-fun array_inv!28088 (array!76277) Bool)

(assert (=> start!99628 (array_inv!28088 _keys!1208)))

(assert (=> start!99628 true))

(assert (=> start!99628 tp!88334))

(declare-fun e!671220 () Bool)

(declare-fun array_inv!28089 (array!76279) Bool)

(assert (=> start!99628 (and (array_inv!28089 _values!996) e!671220)))

(declare-fun b!1180629 () Bool)

(declare-fun e!671221 () Bool)

(assert (=> b!1180629 (= e!671220 (and e!671221 mapRes!46433))))

(declare-fun condMapEmpty!46433 () Bool)

(declare-fun mapDefault!46433 () ValueCell!14159)

