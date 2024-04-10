; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97280 () Bool)

(assert start!97280)

(declare-fun b_free!23251 () Bool)

(declare-fun b_next!23251 () Bool)

(assert (=> start!97280 (= b_free!23251 (not b_next!23251))))

(declare-fun tp!82052 () Bool)

(declare-fun b_and!37333 () Bool)

(assert (=> start!97280 (= tp!82052 b_and!37333)))

(declare-fun b!1107645 () Bool)

(declare-fun e!631951 () Bool)

(declare-fun e!631952 () Bool)

(assert (=> b!1107645 (= e!631951 e!631952)))

(declare-fun res!739208 () Bool)

(assert (=> b!1107645 (=> (not res!739208) (not e!631952))))

(declare-datatypes ((array!71939 0))(
  ( (array!71940 (arr!34622 (Array (_ BitVec 32) (_ BitVec 64))) (size!35158 (_ BitVec 32))) )
))
(declare-fun lt!495668 () array!71939)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71939 (_ BitVec 32)) Bool)

(assert (=> b!1107645 (= res!739208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495668 mask!1564))))

(declare-fun _keys!1208 () array!71939)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107645 (= lt!495668 (array!71940 (store (arr!34622 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35158 _keys!1208)))))

(declare-datatypes ((V!41809 0))(
  ( (V!41810 (val!13812 Int)) )
))
(declare-fun zeroValue!944 () V!41809)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13046 0))(
  ( (ValueCellFull!13046 (v!16445 V!41809)) (EmptyCell!13046) )
))
(declare-datatypes ((array!71941 0))(
  ( (array!71942 (arr!34623 (Array (_ BitVec 32) ValueCell!13046)) (size!35159 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71941)

(declare-fun minValue!944 () V!41809)

(declare-fun bm!46446 () Bool)

(declare-datatypes ((tuple2!17448 0))(
  ( (tuple2!17449 (_1!8735 (_ BitVec 64)) (_2!8735 V!41809)) )
))
(declare-datatypes ((List!24132 0))(
  ( (Nil!24129) (Cons!24128 (h!25337 tuple2!17448) (t!34429 List!24132)) )
))
(declare-datatypes ((ListLongMap!15417 0))(
  ( (ListLongMap!15418 (toList!7724 List!24132)) )
))
(declare-fun call!46449 () ListLongMap!15417)

(declare-fun getCurrentListMapNoExtraKeys!4222 (array!71939 array!71941 (_ BitVec 32) (_ BitVec 32) V!41809 V!41809 (_ BitVec 32) Int) ListLongMap!15417)

(assert (=> bm!46446 (= call!46449 (getCurrentListMapNoExtraKeys!4222 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107646 () Bool)

(declare-fun res!739207 () Bool)

(assert (=> b!1107646 (=> (not res!739207) (not e!631951))))

(declare-datatypes ((List!24133 0))(
  ( (Nil!24130) (Cons!24129 (h!25338 (_ BitVec 64)) (t!34430 List!24133)) )
))
(declare-fun arrayNoDuplicates!0 (array!71939 (_ BitVec 32) List!24133) Bool)

(assert (=> b!1107646 (= res!739207 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24130))))

(declare-fun b!1107647 () Bool)

(declare-fun res!739215 () Bool)

(assert (=> b!1107647 (=> (not res!739215) (not e!631951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107647 (= res!739215 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43084 () Bool)

(declare-fun mapRes!43084 () Bool)

(declare-fun tp!82051 () Bool)

(declare-fun e!631953 () Bool)

(assert (=> mapNonEmpty!43084 (= mapRes!43084 (and tp!82051 e!631953))))

(declare-fun mapRest!43084 () (Array (_ BitVec 32) ValueCell!13046))

(declare-fun mapValue!43084 () ValueCell!13046)

(declare-fun mapKey!43084 () (_ BitVec 32))

(assert (=> mapNonEmpty!43084 (= (arr!34623 _values!996) (store mapRest!43084 mapKey!43084 mapValue!43084))))

(declare-fun b!1107648 () Bool)

(declare-fun tp_is_empty!27511 () Bool)

(assert (=> b!1107648 (= e!631953 tp_is_empty!27511)))

(declare-fun res!739209 () Bool)

(assert (=> start!97280 (=> (not res!739209) (not e!631951))))

(assert (=> start!97280 (= res!739209 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35158 _keys!1208))))))

(assert (=> start!97280 e!631951))

(assert (=> start!97280 tp_is_empty!27511))

(declare-fun array_inv!26646 (array!71939) Bool)

(assert (=> start!97280 (array_inv!26646 _keys!1208)))

(assert (=> start!97280 true))

(assert (=> start!97280 tp!82052))

(declare-fun e!631948 () Bool)

(declare-fun array_inv!26647 (array!71941) Bool)

(assert (=> start!97280 (and (array_inv!26647 _values!996) e!631948)))

(declare-fun b!1107649 () Bool)

(declare-fun e!631949 () Bool)

(assert (=> b!1107649 (= e!631949 tp_is_empty!27511)))

(declare-fun b!1107650 () Bool)

(declare-fun e!631946 () Bool)

(assert (=> b!1107650 (= e!631946 true)))

(declare-fun e!631950 () Bool)

(assert (=> b!1107650 e!631950))

(declare-fun c!109056 () Bool)

(assert (=> b!1107650 (= c!109056 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36354 0))(
  ( (Unit!36355) )
))
(declare-fun lt!495667 () Unit!36354)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!250 (array!71939 array!71941 (_ BitVec 32) (_ BitVec 32) V!41809 V!41809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36354)

(assert (=> b!1107650 (= lt!495667 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!250 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107651 () Bool)

(declare-fun res!739212 () Bool)

(assert (=> b!1107651 (=> (not res!739212) (not e!631951))))

(assert (=> b!1107651 (= res!739212 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35158 _keys!1208))))))

(declare-fun call!46450 () ListLongMap!15417)

(declare-fun b!1107652 () Bool)

(declare-fun -!1004 (ListLongMap!15417 (_ BitVec 64)) ListLongMap!15417)

(assert (=> b!1107652 (= e!631950 (= call!46450 (-!1004 call!46449 k!934)))))

(declare-fun b!1107653 () Bool)

(assert (=> b!1107653 (= e!631948 (and e!631949 mapRes!43084))))

(declare-fun condMapEmpty!43084 () Bool)

(declare-fun mapDefault!43084 () ValueCell!13046)

