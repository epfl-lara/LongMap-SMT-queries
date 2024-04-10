; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97260 () Bool)

(assert start!97260)

(declare-fun b_free!23231 () Bool)

(declare-fun b_next!23231 () Bool)

(assert (=> start!97260 (= b_free!23231 (not b_next!23231))))

(declare-fun tp!81992 () Bool)

(declare-fun b_and!37293 () Bool)

(assert (=> start!97260 (= tp!81992 b_and!37293)))

(declare-fun b!1107145 () Bool)

(declare-fun res!738883 () Bool)

(declare-fun e!631709 () Bool)

(assert (=> b!1107145 (=> (not res!738883) (not e!631709))))

(declare-datatypes ((array!71899 0))(
  ( (array!71900 (arr!34602 (Array (_ BitVec 32) (_ BitVec 64))) (size!35138 (_ BitVec 32))) )
))
(declare-fun lt!495578 () array!71899)

(declare-datatypes ((List!24114 0))(
  ( (Nil!24111) (Cons!24110 (h!25319 (_ BitVec 64)) (t!34391 List!24114)) )
))
(declare-fun arrayNoDuplicates!0 (array!71899 (_ BitVec 32) List!24114) Bool)

(assert (=> b!1107145 (= res!738883 (arrayNoDuplicates!0 lt!495578 #b00000000000000000000000000000000 Nil!24111))))

(declare-fun mapIsEmpty!43054 () Bool)

(declare-fun mapRes!43054 () Bool)

(assert (=> mapIsEmpty!43054 mapRes!43054))

(declare-fun b!1107146 () Bool)

(declare-fun e!631708 () Bool)

(declare-fun tp_is_empty!27491 () Bool)

(assert (=> b!1107146 (= e!631708 tp_is_empty!27491)))

(declare-fun b!1107147 () Bool)

(declare-fun res!738877 () Bool)

(declare-fun e!631713 () Bool)

(assert (=> b!1107147 (=> (not res!738877) (not e!631713))))

(declare-fun _keys!1208 () array!71899)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41781 0))(
  ( (V!41782 (val!13802 Int)) )
))
(declare-datatypes ((ValueCell!13036 0))(
  ( (ValueCellFull!13036 (v!16435 V!41781)) (EmptyCell!13036) )
))
(declare-datatypes ((array!71901 0))(
  ( (array!71902 (arr!34603 (Array (_ BitVec 32) ValueCell!13036)) (size!35139 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71901)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1107147 (= res!738877 (and (= (size!35139 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35138 _keys!1208) (size!35139 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43054 () Bool)

(declare-fun tp!81991 () Bool)

(assert (=> mapNonEmpty!43054 (= mapRes!43054 (and tp!81991 e!631708))))

(declare-fun mapRest!43054 () (Array (_ BitVec 32) ValueCell!13036))

(declare-fun mapValue!43054 () ValueCell!13036)

(declare-fun mapKey!43054 () (_ BitVec 32))

(assert (=> mapNonEmpty!43054 (= (arr!34603 _values!996) (store mapRest!43054 mapKey!43054 mapValue!43054))))

(declare-fun e!631707 () Bool)

(declare-datatypes ((tuple2!17428 0))(
  ( (tuple2!17429 (_1!8725 (_ BitVec 64)) (_2!8725 V!41781)) )
))
(declare-datatypes ((List!24115 0))(
  ( (Nil!24112) (Cons!24111 (h!25320 tuple2!17428) (t!34392 List!24115)) )
))
(declare-datatypes ((ListLongMap!15397 0))(
  ( (ListLongMap!15398 (toList!7714 List!24115)) )
))
(declare-fun call!46390 () ListLongMap!15397)

(declare-fun call!46389 () ListLongMap!15397)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1107148 () Bool)

(declare-fun -!996 (ListLongMap!15397 (_ BitVec 64)) ListLongMap!15397)

(assert (=> b!1107148 (= e!631707 (= call!46390 (-!996 call!46389 k!934)))))

(declare-fun b!1107149 () Bool)

(declare-fun e!631711 () Bool)

(assert (=> b!1107149 (= e!631709 (not e!631711))))

(declare-fun res!738885 () Bool)

(assert (=> b!1107149 (=> res!738885 e!631711)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107149 (= res!738885 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35138 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107149 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36334 0))(
  ( (Unit!36335) )
))
(declare-fun lt!495576 () Unit!36334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71899 (_ BitVec 64) (_ BitVec 32)) Unit!36334)

(assert (=> b!1107149 (= lt!495576 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!738878 () Bool)

(assert (=> start!97260 (=> (not res!738878) (not e!631713))))

(assert (=> start!97260 (= res!738878 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35138 _keys!1208))))))

(assert (=> start!97260 e!631713))

(assert (=> start!97260 tp_is_empty!27491))

(declare-fun array_inv!26628 (array!71899) Bool)

(assert (=> start!97260 (array_inv!26628 _keys!1208)))

(assert (=> start!97260 true))

(assert (=> start!97260 tp!81992))

(declare-fun e!631712 () Bool)

(declare-fun array_inv!26629 (array!71901) Bool)

(assert (=> start!97260 (and (array_inv!26629 _values!996) e!631712)))

(declare-fun b!1107150 () Bool)

(declare-fun res!738879 () Bool)

(assert (=> b!1107150 (=> (not res!738879) (not e!631713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107150 (= res!738879 (validMask!0 mask!1564))))

(declare-fun minValue!944 () V!41781)

(declare-fun bm!46386 () Bool)

(declare-fun zeroValue!944 () V!41781)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4212 (array!71899 array!71901 (_ BitVec 32) (_ BitVec 32) V!41781 V!41781 (_ BitVec 32) Int) ListLongMap!15397)

(declare-fun dynLambda!2347 (Int (_ BitVec 64)) V!41781)

(assert (=> bm!46386 (= call!46390 (getCurrentListMapNoExtraKeys!4212 lt!495578 (array!71902 (store (arr!34603 _values!996) i!673 (ValueCellFull!13036 (dynLambda!2347 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35139 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107151 () Bool)

(assert (=> b!1107151 (= e!631707 (= call!46390 call!46389))))

(declare-fun b!1107152 () Bool)

(declare-fun res!738880 () Bool)

(assert (=> b!1107152 (=> (not res!738880) (not e!631713))))

(assert (=> b!1107152 (= res!738880 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35138 _keys!1208))))))

(declare-fun bm!46387 () Bool)

(assert (=> bm!46387 (= call!46389 (getCurrentListMapNoExtraKeys!4212 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107153 () Bool)

(declare-fun res!738876 () Bool)

(assert (=> b!1107153 (=> (not res!738876) (not e!631713))))

(assert (=> b!1107153 (= res!738876 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24111))))

(declare-fun b!1107154 () Bool)

(declare-fun e!631706 () Bool)

(assert (=> b!1107154 (= e!631712 (and e!631706 mapRes!43054))))

(declare-fun condMapEmpty!43054 () Bool)

(declare-fun mapDefault!43054 () ValueCell!13036)

