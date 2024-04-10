; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98106 () Bool)

(assert start!98106)

(declare-fun b_free!23807 () Bool)

(declare-fun b_next!23807 () Bool)

(assert (=> start!98106 (= b_free!23807 (not b_next!23807))))

(declare-fun tp!84124 () Bool)

(declare-fun b_and!38397 () Bool)

(assert (=> start!98106 (= tp!84124 b_and!38397)))

(declare-fun b!1127195 () Bool)

(declare-fun res!753247 () Bool)

(declare-fun e!641571 () Bool)

(assert (=> b!1127195 (=> (not res!753247) (not e!641571))))

(declare-datatypes ((array!73535 0))(
  ( (array!73536 (arr!35420 (Array (_ BitVec 32) (_ BitVec 64))) (size!35956 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73535)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73535 (_ BitVec 32)) Bool)

(assert (=> b!1127195 (= res!753247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127196 () Bool)

(declare-fun res!753254 () Bool)

(assert (=> b!1127196 (=> (not res!753254) (not e!641571))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42909 0))(
  ( (V!42910 (val!14225 Int)) )
))
(declare-datatypes ((ValueCell!13459 0))(
  ( (ValueCellFull!13459 (v!16858 V!42909)) (EmptyCell!13459) )
))
(declare-datatypes ((array!73537 0))(
  ( (array!73538 (arr!35421 (Array (_ BitVec 32) ValueCell!13459)) (size!35957 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73537)

(assert (=> b!1127196 (= res!753254 (and (= (size!35957 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35956 _keys!1208) (size!35957 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127197 () Bool)

(declare-fun e!641573 () Bool)

(declare-fun e!641576 () Bool)

(assert (=> b!1127197 (= e!641573 (not e!641576))))

(declare-fun res!753252 () Bool)

(assert (=> b!1127197 (=> res!753252 e!641576)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127197 (= res!753252 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127197 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36936 0))(
  ( (Unit!36937) )
))
(declare-fun lt!500496 () Unit!36936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73535 (_ BitVec 64) (_ BitVec 32)) Unit!36936)

(assert (=> b!1127197 (= lt!500496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1127198 () Bool)

(declare-fun res!753249 () Bool)

(assert (=> b!1127198 (=> (not res!753249) (not e!641571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127198 (= res!753249 (validKeyInArray!0 k!934))))

(declare-fun b!1127199 () Bool)

(declare-fun e!641577 () Bool)

(declare-fun tp_is_empty!28337 () Bool)

(assert (=> b!1127199 (= e!641577 tp_is_empty!28337)))

(declare-fun mapIsEmpty!44323 () Bool)

(declare-fun mapRes!44323 () Bool)

(assert (=> mapIsEmpty!44323 mapRes!44323))

(declare-fun b!1127200 () Bool)

(declare-fun res!753255 () Bool)

(assert (=> b!1127200 (=> (not res!753255) (not e!641571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127200 (= res!753255 (validMask!0 mask!1564))))

(declare-fun b!1127201 () Bool)

(declare-fun res!753256 () Bool)

(assert (=> b!1127201 (=> (not res!753256) (not e!641571))))

(declare-datatypes ((List!24662 0))(
  ( (Nil!24659) (Cons!24658 (h!25867 (_ BitVec 64)) (t!35461 List!24662)) )
))
(declare-fun arrayNoDuplicates!0 (array!73535 (_ BitVec 32) List!24662) Bool)

(assert (=> b!1127201 (= res!753256 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24659))))

(declare-fun b!1127202 () Bool)

(assert (=> b!1127202 (= e!641571 e!641573)))

(declare-fun res!753251 () Bool)

(assert (=> b!1127202 (=> (not res!753251) (not e!641573))))

(declare-fun lt!500500 () array!73535)

(assert (=> b!1127202 (= res!753251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500500 mask!1564))))

(assert (=> b!1127202 (= lt!500500 (array!73536 (store (arr!35420 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35956 _keys!1208)))))

(declare-fun b!1127203 () Bool)

(declare-fun e!641575 () Bool)

(declare-fun e!641572 () Bool)

(assert (=> b!1127203 (= e!641575 e!641572)))

(declare-fun res!753248 () Bool)

(assert (=> b!1127203 (=> res!753248 e!641572)))

(assert (=> b!1127203 (= res!753248 (not (= (select (arr!35420 _keys!1208) from!1455) k!934)))))

(declare-fun e!641569 () Bool)

(assert (=> b!1127203 e!641569))

(declare-fun c!109701 () Bool)

(assert (=> b!1127203 (= c!109701 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500495 () Unit!36936)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42909)

(declare-fun zeroValue!944 () V!42909)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!388 (array!73535 array!73537 (_ BitVec 32) (_ BitVec 32) V!42909 V!42909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36936)

(assert (=> b!1127203 (= lt!500495 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!753253 () Bool)

(assert (=> start!98106 (=> (not res!753253) (not e!641571))))

(assert (=> start!98106 (= res!753253 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35956 _keys!1208))))))

(assert (=> start!98106 e!641571))

(assert (=> start!98106 tp_is_empty!28337))

(declare-fun array_inv!27182 (array!73535) Bool)

(assert (=> start!98106 (array_inv!27182 _keys!1208)))

(assert (=> start!98106 true))

(assert (=> start!98106 tp!84124))

(declare-fun e!641574 () Bool)

(declare-fun array_inv!27183 (array!73537) Bool)

(assert (=> start!98106 (and (array_inv!27183 _values!996) e!641574)))

(declare-fun b!1127204 () Bool)

(assert (=> b!1127204 (= e!641576 e!641575)))

(declare-fun res!753258 () Bool)

(assert (=> b!1127204 (=> res!753258 e!641575)))

(assert (=> b!1127204 (= res!753258 (not (= from!1455 i!673)))))

(declare-fun lt!500501 () array!73537)

(declare-datatypes ((tuple2!17890 0))(
  ( (tuple2!17891 (_1!8956 (_ BitVec 64)) (_2!8956 V!42909)) )
))
(declare-datatypes ((List!24663 0))(
  ( (Nil!24660) (Cons!24659 (h!25868 tuple2!17890) (t!35462 List!24663)) )
))
(declare-datatypes ((ListLongMap!15859 0))(
  ( (ListLongMap!15860 (toList!7945 List!24663)) )
))
(declare-fun lt!500498 () ListLongMap!15859)

(declare-fun getCurrentListMapNoExtraKeys!4433 (array!73535 array!73537 (_ BitVec 32) (_ BitVec 32) V!42909 V!42909 (_ BitVec 32) Int) ListLongMap!15859)

(assert (=> b!1127204 (= lt!500498 (getCurrentListMapNoExtraKeys!4433 lt!500500 lt!500501 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2520 (Int (_ BitVec 64)) V!42909)

(assert (=> b!1127204 (= lt!500501 (array!73538 (store (arr!35421 _values!996) i!673 (ValueCellFull!13459 (dynLambda!2520 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35957 _values!996)))))

(declare-fun lt!500497 () ListLongMap!15859)

(assert (=> b!1127204 (= lt!500497 (getCurrentListMapNoExtraKeys!4433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127205 () Bool)

(declare-fun call!47704 () ListLongMap!15859)

(declare-fun call!47703 () ListLongMap!15859)

(assert (=> b!1127205 (= e!641569 (= call!47704 call!47703))))

(declare-fun b!1127206 () Bool)

(declare-fun res!753250 () Bool)

(assert (=> b!1127206 (=> (not res!753250) (not e!641573))))

(assert (=> b!1127206 (= res!753250 (arrayNoDuplicates!0 lt!500500 #b00000000000000000000000000000000 Nil!24659))))

(declare-fun b!1127207 () Bool)

(declare-fun res!753257 () Bool)

(assert (=> b!1127207 (=> (not res!753257) (not e!641571))))

(assert (=> b!1127207 (= res!753257 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35956 _keys!1208))))))

(declare-fun b!1127208 () Bool)

(declare-fun -!1135 (ListLongMap!15859 (_ BitVec 64)) ListLongMap!15859)

(assert (=> b!1127208 (= e!641569 (= call!47704 (-!1135 call!47703 k!934)))))

(declare-fun b!1127209 () Bool)

(assert (=> b!1127209 (= e!641574 (and e!641577 mapRes!44323))))

(declare-fun condMapEmpty!44323 () Bool)

(declare-fun mapDefault!44323 () ValueCell!13459)

