; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97266 () Bool)

(assert start!97266)

(declare-fun b_free!23237 () Bool)

(declare-fun b_next!23237 () Bool)

(assert (=> start!97266 (= b_free!23237 (not b_next!23237))))

(declare-fun tp!82009 () Bool)

(declare-fun b_and!37305 () Bool)

(assert (=> start!97266 (= tp!82009 b_and!37305)))

(declare-fun b!1107295 () Bool)

(declare-fun e!631781 () Bool)

(declare-fun e!631785 () Bool)

(assert (=> b!1107295 (= e!631781 e!631785)))

(declare-fun res!738979 () Bool)

(assert (=> b!1107295 (=> (not res!738979) (not e!631785))))

(declare-datatypes ((array!71911 0))(
  ( (array!71912 (arr!34608 (Array (_ BitVec 32) (_ BitVec 64))) (size!35144 (_ BitVec 32))) )
))
(declare-fun lt!495604 () array!71911)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71911 (_ BitVec 32)) Bool)

(assert (=> b!1107295 (= res!738979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495604 mask!1564))))

(declare-fun _keys!1208 () array!71911)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107295 (= lt!495604 (array!71912 (store (arr!34608 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35144 _keys!1208)))))

(declare-fun b!1107296 () Bool)

(declare-fun e!631784 () Bool)

(declare-fun tp_is_empty!27497 () Bool)

(assert (=> b!1107296 (= e!631784 tp_is_empty!27497)))

(declare-fun mapNonEmpty!43063 () Bool)

(declare-fun mapRes!43063 () Bool)

(declare-fun tp!82010 () Bool)

(declare-fun e!631783 () Bool)

(assert (=> mapNonEmpty!43063 (= mapRes!43063 (and tp!82010 e!631783))))

(declare-fun mapKey!43063 () (_ BitVec 32))

(declare-datatypes ((V!41789 0))(
  ( (V!41790 (val!13805 Int)) )
))
(declare-datatypes ((ValueCell!13039 0))(
  ( (ValueCellFull!13039 (v!16438 V!41789)) (EmptyCell!13039) )
))
(declare-fun mapValue!43063 () ValueCell!13039)

(declare-fun mapRest!43063 () (Array (_ BitVec 32) ValueCell!13039))

(declare-datatypes ((array!71913 0))(
  ( (array!71914 (arr!34609 (Array (_ BitVec 32) ValueCell!13039)) (size!35145 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71913)

(assert (=> mapNonEmpty!43063 (= (arr!34609 _values!996) (store mapRest!43063 mapKey!43063 mapValue!43063))))

(declare-fun zeroValue!944 () V!41789)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41789)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46404 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17434 0))(
  ( (tuple2!17435 (_1!8728 (_ BitVec 64)) (_2!8728 V!41789)) )
))
(declare-datatypes ((List!24119 0))(
  ( (Nil!24116) (Cons!24115 (h!25324 tuple2!17434) (t!34402 List!24119)) )
))
(declare-datatypes ((ListLongMap!15403 0))(
  ( (ListLongMap!15404 (toList!7717 List!24119)) )
))
(declare-fun call!46407 () ListLongMap!15403)

(declare-fun getCurrentListMapNoExtraKeys!4215 (array!71911 array!71913 (_ BitVec 32) (_ BitVec 32) V!41789 V!41789 (_ BitVec 32) Int) ListLongMap!15403)

(assert (=> bm!46404 (= call!46407 (getCurrentListMapNoExtraKeys!4215 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107297 () Bool)

(declare-fun res!738976 () Bool)

(assert (=> b!1107297 (=> (not res!738976) (not e!631781))))

(assert (=> b!1107297 (= res!738976 (and (= (size!35145 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35144 _keys!1208) (size!35145 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!46408 () ListLongMap!15403)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!631782 () Bool)

(declare-fun b!1107298 () Bool)

(declare-fun -!998 (ListLongMap!15403 (_ BitVec 64)) ListLongMap!15403)

(assert (=> b!1107298 (= e!631782 (= call!46408 (-!998 call!46407 k!934)))))

(declare-fun b!1107299 () Bool)

(declare-fun res!738983 () Bool)

(assert (=> b!1107299 (=> (not res!738983) (not e!631781))))

(assert (=> b!1107299 (= res!738983 (= (select (arr!34608 _keys!1208) i!673) k!934))))

(declare-fun b!1107300 () Bool)

(declare-fun res!738980 () Bool)

(assert (=> b!1107300 (=> (not res!738980) (not e!631781))))

(declare-datatypes ((List!24120 0))(
  ( (Nil!24117) (Cons!24116 (h!25325 (_ BitVec 64)) (t!34403 List!24120)) )
))
(declare-fun arrayNoDuplicates!0 (array!71911 (_ BitVec 32) List!24120) Bool)

(assert (=> b!1107300 (= res!738980 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24117))))

(declare-fun b!1107301 () Bool)

(declare-fun res!738975 () Bool)

(assert (=> b!1107301 (=> (not res!738975) (not e!631781))))

(assert (=> b!1107301 (= res!738975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!738985 () Bool)

(assert (=> start!97266 (=> (not res!738985) (not e!631781))))

(assert (=> start!97266 (= res!738985 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35144 _keys!1208))))))

(assert (=> start!97266 e!631781))

(assert (=> start!97266 tp_is_empty!27497))

(declare-fun array_inv!26634 (array!71911) Bool)

(assert (=> start!97266 (array_inv!26634 _keys!1208)))

(assert (=> start!97266 true))

(assert (=> start!97266 tp!82009))

(declare-fun e!631778 () Bool)

(declare-fun array_inv!26635 (array!71913) Bool)

(assert (=> start!97266 (and (array_inv!26635 _values!996) e!631778)))

(declare-fun b!1107302 () Bool)

(declare-fun res!738984 () Bool)

(assert (=> b!1107302 (=> (not res!738984) (not e!631785))))

(assert (=> b!1107302 (= res!738984 (arrayNoDuplicates!0 lt!495604 #b00000000000000000000000000000000 Nil!24117))))

(declare-fun b!1107303 () Bool)

(assert (=> b!1107303 (= e!631783 tp_is_empty!27497)))

(declare-fun mapIsEmpty!43063 () Bool)

(assert (=> mapIsEmpty!43063 mapRes!43063))

(declare-fun b!1107304 () Bool)

(declare-fun res!738978 () Bool)

(assert (=> b!1107304 (=> (not res!738978) (not e!631781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107304 (= res!738978 (validMask!0 mask!1564))))

(declare-fun b!1107305 () Bool)

(declare-fun res!738977 () Bool)

(assert (=> b!1107305 (=> (not res!738977) (not e!631781))))

(assert (=> b!1107305 (= res!738977 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35144 _keys!1208))))))

(declare-fun b!1107306 () Bool)

(declare-fun res!738981 () Bool)

(assert (=> b!1107306 (=> (not res!738981) (not e!631781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107306 (= res!738981 (validKeyInArray!0 k!934))))

(declare-fun b!1107307 () Bool)

(declare-fun e!631779 () Bool)

(assert (=> b!1107307 (= e!631779 true)))

(assert (=> b!1107307 e!631782))

(declare-fun c!109035 () Bool)

(assert (=> b!1107307 (= c!109035 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36340 0))(
  ( (Unit!36341) )
))
(declare-fun lt!495603 () Unit!36340)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!244 (array!71911 array!71913 (_ BitVec 32) (_ BitVec 32) V!41789 V!41789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36340)

(assert (=> b!1107307 (= lt!495603 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!244 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107308 () Bool)

(assert (=> b!1107308 (= e!631782 (= call!46408 call!46407))))

(declare-fun b!1107309 () Bool)

(assert (=> b!1107309 (= e!631778 (and e!631784 mapRes!43063))))

(declare-fun condMapEmpty!43063 () Bool)

(declare-fun mapDefault!43063 () ValueCell!13039)

