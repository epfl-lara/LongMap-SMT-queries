; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100992 () Bool)

(assert start!100992)

(declare-fun b_free!25991 () Bool)

(declare-fun b_next!25991 () Bool)

(assert (=> start!100992 (= b_free!25991 (not b_next!25991))))

(declare-fun tp!90988 () Bool)

(declare-fun b_and!43063 () Bool)

(assert (=> start!100992 (= tp!90988 b_and!43063)))

(declare-fun b!1209313 () Bool)

(declare-fun c!119051 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!548921 () Bool)

(assert (=> b!1209313 (= c!119051 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548921))))

(declare-datatypes ((Unit!40080 0))(
  ( (Unit!40081) )
))
(declare-fun e!686828 () Unit!40080)

(declare-fun e!686823 () Unit!40080)

(assert (=> b!1209313 (= e!686828 e!686823)))

(declare-fun b!1209314 () Bool)

(declare-fun e!686836 () Bool)

(declare-fun e!686834 () Bool)

(assert (=> b!1209314 (= e!686836 e!686834)))

(declare-fun res!803742 () Bool)

(assert (=> b!1209314 (=> (not res!803742) (not e!686834))))

(declare-datatypes ((array!78175 0))(
  ( (array!78176 (arr!37724 (Array (_ BitVec 32) (_ BitVec 64))) (size!38260 (_ BitVec 32))) )
))
(declare-fun lt!548915 () array!78175)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78175 (_ BitVec 32)) Bool)

(assert (=> b!1209314 (= res!803742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548915 mask!1564))))

(declare-fun _keys!1208 () array!78175)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1209314 (= lt!548915 (array!78176 (store (arr!37724 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38260 _keys!1208)))))

(declare-fun e!686831 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1209315 () Bool)

(declare-datatypes ((V!46053 0))(
  ( (V!46054 (val!15404 Int)) )
))
(declare-datatypes ((tuple2!19774 0))(
  ( (tuple2!19775 (_1!9898 (_ BitVec 64)) (_2!9898 V!46053)) )
))
(declare-datatypes ((List!26575 0))(
  ( (Nil!26572) (Cons!26571 (h!27780 tuple2!19774) (t!39546 List!26575)) )
))
(declare-datatypes ((ListLongMap!17743 0))(
  ( (ListLongMap!17744 (toList!8887 List!26575)) )
))
(declare-fun call!59339 () ListLongMap!17743)

(declare-fun call!59336 () ListLongMap!17743)

(declare-fun -!1841 (ListLongMap!17743 (_ BitVec 64)) ListLongMap!17743)

(assert (=> b!1209315 (= e!686831 (= call!59339 (-!1841 call!59336 k!934)))))

(declare-fun b!1209316 () Bool)

(declare-fun res!803738 () Bool)

(assert (=> b!1209316 (=> (not res!803738) (not e!686836))))

(assert (=> b!1209316 (= res!803738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!803736 () Bool)

(assert (=> start!100992 (=> (not res!803736) (not e!686836))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100992 (= res!803736 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38260 _keys!1208))))))

(assert (=> start!100992 e!686836))

(declare-fun tp_is_empty!30695 () Bool)

(assert (=> start!100992 tp_is_empty!30695))

(declare-fun array_inv!28736 (array!78175) Bool)

(assert (=> start!100992 (array_inv!28736 _keys!1208)))

(assert (=> start!100992 true))

(assert (=> start!100992 tp!90988))

(declare-datatypes ((ValueCell!14638 0))(
  ( (ValueCellFull!14638 (v!18055 V!46053)) (EmptyCell!14638) )
))
(declare-datatypes ((array!78177 0))(
  ( (array!78178 (arr!37725 (Array (_ BitVec 32) ValueCell!14638)) (size!38261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78177)

(declare-fun e!686833 () Bool)

(declare-fun array_inv!28737 (array!78177) Bool)

(assert (=> start!100992 (and (array_inv!28737 _values!996) e!686833)))

(declare-fun b!1209317 () Bool)

(declare-fun res!803746 () Bool)

(declare-fun e!686832 () Bool)

(assert (=> b!1209317 (=> res!803746 e!686832)))

(declare-datatypes ((List!26576 0))(
  ( (Nil!26573) (Cons!26572 (h!27781 (_ BitVec 64)) (t!39547 List!26576)) )
))
(declare-fun contains!6954 (List!26576 (_ BitVec 64)) Bool)

(assert (=> b!1209317 (= res!803746 (contains!6954 Nil!26573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209318 () Bool)

(declare-fun e!686826 () Bool)

(assert (=> b!1209318 (= e!686834 (not e!686826))))

(declare-fun res!803737 () Bool)

(assert (=> b!1209318 (=> res!803737 e!686826)))

(assert (=> b!1209318 (= res!803737 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209318 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!548924 () Unit!40080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78175 (_ BitVec 64) (_ BitVec 32)) Unit!40080)

(assert (=> b!1209318 (= lt!548924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1209319 () Bool)

(assert (=> b!1209319 (= e!686831 (= call!59339 call!59336))))

(declare-fun zeroValue!944 () V!46053)

(declare-fun bm!59330 () Bool)

(declare-fun call!59338 () ListLongMap!17743)

(declare-fun c!119052 () Bool)

(declare-fun lt!548920 () ListLongMap!17743)

(declare-fun c!119053 () Bool)

(declare-fun minValue!944 () V!46053)

(declare-fun +!4006 (ListLongMap!17743 tuple2!19774) ListLongMap!17743)

(assert (=> bm!59330 (= call!59338 (+!4006 lt!548920 (ite (or c!119052 c!119053) (tuple2!19775 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19775 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!59331 () Bool)

(declare-fun call!59334 () ListLongMap!17743)

(assert (=> bm!59331 (= call!59334 call!59338)))

(declare-fun b!1209320 () Bool)

(declare-fun e!686827 () Bool)

(declare-fun e!686837 () Bool)

(assert (=> b!1209320 (= e!686827 e!686837)))

(declare-fun res!803744 () Bool)

(assert (=> b!1209320 (=> res!803744 e!686837)))

(declare-fun contains!6955 (ListLongMap!17743 (_ BitVec 64)) Bool)

(assert (=> b!1209320 (= res!803744 (not (contains!6955 lt!548920 k!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5321 (array!78175 array!78177 (_ BitVec 32) (_ BitVec 32) V!46053 V!46053 (_ BitVec 32) Int) ListLongMap!17743)

(assert (=> b!1209320 (= lt!548920 (getCurrentListMapNoExtraKeys!5321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209321 () Bool)

(declare-fun res!803743 () Bool)

(assert (=> b!1209321 (=> (not res!803743) (not e!686836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209321 (= res!803743 (validKeyInArray!0 k!934))))

(declare-fun bm!59332 () Bool)

(declare-fun call!59340 () Unit!40080)

(declare-fun call!59335 () Unit!40080)

(assert (=> bm!59332 (= call!59340 call!59335)))

(declare-fun b!1209322 () Bool)

(declare-fun e!686824 () Bool)

(assert (=> b!1209322 (= e!686824 e!686827)))

(declare-fun res!803739 () Bool)

(assert (=> b!1209322 (=> res!803739 e!686827)))

(assert (=> b!1209322 (= res!803739 (not (= (select (arr!37724 _keys!1208) from!1455) k!934)))))

(assert (=> b!1209322 e!686831))

(declare-fun c!119054 () Bool)

(assert (=> b!1209322 (= c!119054 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548917 () Unit!40080)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1049 (array!78175 array!78177 (_ BitVec 32) (_ BitVec 32) V!46053 V!46053 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40080)

(assert (=> b!1209322 (= lt!548917 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1049 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209323 () Bool)

(declare-fun e!686830 () Bool)

(declare-fun mapRes!47911 () Bool)

(assert (=> b!1209323 (= e!686833 (and e!686830 mapRes!47911))))

(declare-fun condMapEmpty!47911 () Bool)

(declare-fun mapDefault!47911 () ValueCell!14638)

