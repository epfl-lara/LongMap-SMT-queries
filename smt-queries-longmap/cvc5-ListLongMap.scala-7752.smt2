; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97256 () Bool)

(assert start!97256)

(declare-fun b_free!23227 () Bool)

(declare-fun b_next!23227 () Bool)

(assert (=> start!97256 (= b_free!23227 (not b_next!23227))))

(declare-fun tp!81980 () Bool)

(declare-fun b_and!37285 () Bool)

(assert (=> start!97256 (= tp!81980 b_and!37285)))

(declare-fun b!1107045 () Bool)

(declare-fun e!631660 () Bool)

(declare-datatypes ((V!41777 0))(
  ( (V!41778 (val!13800 Int)) )
))
(declare-datatypes ((tuple2!17424 0))(
  ( (tuple2!17425 (_1!8723 (_ BitVec 64)) (_2!8723 V!41777)) )
))
(declare-datatypes ((List!24111 0))(
  ( (Nil!24108) (Cons!24107 (h!25316 tuple2!17424) (t!34384 List!24111)) )
))
(declare-datatypes ((ListLongMap!15393 0))(
  ( (ListLongMap!15394 (toList!7712 List!24111)) )
))
(declare-fun call!46378 () ListLongMap!15393)

(declare-fun call!46377 () ListLongMap!15393)

(assert (=> b!1107045 (= e!631660 (= call!46378 call!46377))))

(declare-fun res!738812 () Bool)

(declare-fun e!631662 () Bool)

(assert (=> start!97256 (=> (not res!738812) (not e!631662))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71891 0))(
  ( (array!71892 (arr!34598 (Array (_ BitVec 32) (_ BitVec 64))) (size!35134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71891)

(assert (=> start!97256 (= res!738812 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35134 _keys!1208))))))

(assert (=> start!97256 e!631662))

(declare-fun tp_is_empty!27487 () Bool)

(assert (=> start!97256 tp_is_empty!27487))

(declare-fun array_inv!26624 (array!71891) Bool)

(assert (=> start!97256 (array_inv!26624 _keys!1208)))

(assert (=> start!97256 true))

(assert (=> start!97256 tp!81980))

(declare-datatypes ((ValueCell!13034 0))(
  ( (ValueCellFull!13034 (v!16433 V!41777)) (EmptyCell!13034) )
))
(declare-datatypes ((array!71893 0))(
  ( (array!71894 (arr!34599 (Array (_ BitVec 32) ValueCell!13034)) (size!35135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71893)

(declare-fun e!631658 () Bool)

(declare-fun array_inv!26625 (array!71893) Bool)

(assert (=> start!97256 (and (array_inv!26625 _values!996) e!631658)))

(declare-fun b!1107046 () Bool)

(declare-fun res!738815 () Bool)

(assert (=> b!1107046 (=> (not res!738815) (not e!631662))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107046 (= res!738815 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43048 () Bool)

(declare-fun mapRes!43048 () Bool)

(declare-fun tp!81979 () Bool)

(declare-fun e!631661 () Bool)

(assert (=> mapNonEmpty!43048 (= mapRes!43048 (and tp!81979 e!631661))))

(declare-fun mapValue!43048 () ValueCell!13034)

(declare-fun mapRest!43048 () (Array (_ BitVec 32) ValueCell!13034))

(declare-fun mapKey!43048 () (_ BitVec 32))

(assert (=> mapNonEmpty!43048 (= (arr!34599 _values!996) (store mapRest!43048 mapKey!43048 mapValue!43048))))

(declare-fun b!1107047 () Bool)

(declare-fun res!738814 () Bool)

(assert (=> b!1107047 (=> (not res!738814) (not e!631662))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107047 (= res!738814 (validMask!0 mask!1564))))

(declare-fun b!1107048 () Bool)

(declare-fun e!631663 () Bool)

(declare-fun e!631659 () Bool)

(assert (=> b!1107048 (= e!631663 (not e!631659))))

(declare-fun res!738820 () Bool)

(assert (=> b!1107048 (=> res!738820 e!631659)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107048 (= res!738820 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35134 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107048 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36330 0))(
  ( (Unit!36331) )
))
(declare-fun lt!495560 () Unit!36330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71891 (_ BitVec 64) (_ BitVec 32)) Unit!36330)

(assert (=> b!1107048 (= lt!495560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1107049 () Bool)

(declare-fun e!631664 () Bool)

(assert (=> b!1107049 (= e!631658 (and e!631664 mapRes!43048))))

(declare-fun condMapEmpty!43048 () Bool)

(declare-fun mapDefault!43048 () ValueCell!13034)

