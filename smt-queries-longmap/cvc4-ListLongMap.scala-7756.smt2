; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97284 () Bool)

(assert start!97284)

(declare-fun b_free!23255 () Bool)

(declare-fun b_next!23255 () Bool)

(assert (=> start!97284 (= b_free!23255 (not b_next!23255))))

(declare-fun tp!82063 () Bool)

(declare-fun b_and!37341 () Bool)

(assert (=> start!97284 (= tp!82063 b_and!37341)))

(declare-fun e!632000 () Bool)

(declare-datatypes ((V!41813 0))(
  ( (V!41814 (val!13814 Int)) )
))
(declare-datatypes ((tuple2!17452 0))(
  ( (tuple2!17453 (_1!8737 (_ BitVec 64)) (_2!8737 V!41813)) )
))
(declare-datatypes ((List!24136 0))(
  ( (Nil!24133) (Cons!24132 (h!25341 tuple2!17452) (t!34437 List!24136)) )
))
(declare-datatypes ((ListLongMap!15421 0))(
  ( (ListLongMap!15422 (toList!7726 List!24136)) )
))
(declare-fun call!46461 () ListLongMap!15421)

(declare-fun b!1107745 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!46462 () ListLongMap!15421)

(declare-fun -!1006 (ListLongMap!15421 (_ BitVec 64)) ListLongMap!15421)

(assert (=> b!1107745 (= e!632000 (= call!46462 (-!1006 call!46461 k!934)))))

(declare-fun b!1107746 () Bool)

(declare-fun res!739281 () Bool)

(declare-fun e!632001 () Bool)

(assert (=> b!1107746 (=> (not res!739281) (not e!632001))))

(declare-datatypes ((array!71947 0))(
  ( (array!71948 (arr!34626 (Array (_ BitVec 32) (_ BitVec 64))) (size!35162 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71947)

(declare-datatypes ((List!24137 0))(
  ( (Nil!24134) (Cons!24133 (h!25342 (_ BitVec 64)) (t!34438 List!24137)) )
))
(declare-fun arrayNoDuplicates!0 (array!71947 (_ BitVec 32) List!24137) Bool)

(assert (=> b!1107746 (= res!739281 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24134))))

(declare-fun b!1107748 () Bool)

(declare-fun e!631994 () Bool)

(assert (=> b!1107748 (= e!632001 e!631994)))

(declare-fun res!739278 () Bool)

(assert (=> b!1107748 (=> (not res!739278) (not e!631994))))

(declare-fun lt!495686 () array!71947)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71947 (_ BitVec 32)) Bool)

(assert (=> b!1107748 (= res!739278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495686 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107748 (= lt!495686 (array!71948 (store (arr!34626 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35162 _keys!1208)))))

(declare-fun mapNonEmpty!43090 () Bool)

(declare-fun mapRes!43090 () Bool)

(declare-fun tp!82064 () Bool)

(declare-fun e!631998 () Bool)

(assert (=> mapNonEmpty!43090 (= mapRes!43090 (and tp!82064 e!631998))))

(declare-datatypes ((ValueCell!13048 0))(
  ( (ValueCellFull!13048 (v!16447 V!41813)) (EmptyCell!13048) )
))
(declare-fun mapRest!43090 () (Array (_ BitVec 32) ValueCell!13048))

(declare-fun mapValue!43090 () ValueCell!13048)

(declare-fun mapKey!43090 () (_ BitVec 32))

(declare-datatypes ((array!71949 0))(
  ( (array!71950 (arr!34627 (Array (_ BitVec 32) ValueCell!13048)) (size!35163 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71949)

(assert (=> mapNonEmpty!43090 (= (arr!34627 _values!996) (store mapRest!43090 mapKey!43090 mapValue!43090))))

(declare-fun b!1107749 () Bool)

(declare-fun e!631997 () Bool)

(assert (=> b!1107749 (= e!631997 true)))

(assert (=> b!1107749 e!632000))

(declare-fun c!109062 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107749 (= c!109062 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41813)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36358 0))(
  ( (Unit!36359) )
))
(declare-fun lt!495685 () Unit!36358)

(declare-fun minValue!944 () V!41813)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 (array!71947 array!71949 (_ BitVec 32) (_ BitVec 32) V!41813 V!41813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36358)

(assert (=> b!1107749 (= lt!495685 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107750 () Bool)

(declare-fun res!739275 () Bool)

(assert (=> b!1107750 (=> (not res!739275) (not e!632001))))

(assert (=> b!1107750 (= res!739275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107751 () Bool)

(declare-fun res!739279 () Bool)

(assert (=> b!1107751 (=> (not res!739279) (not e!632001))))

(assert (=> b!1107751 (= res!739279 (= (select (arr!34626 _keys!1208) i!673) k!934))))

(declare-fun b!1107752 () Bool)

(declare-fun res!739282 () Bool)

(assert (=> b!1107752 (=> (not res!739282) (not e!632001))))

(assert (=> b!1107752 (= res!739282 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35162 _keys!1208))))))

(declare-fun b!1107753 () Bool)

(declare-fun res!739276 () Bool)

(assert (=> b!1107753 (=> (not res!739276) (not e!632001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107753 (= res!739276 (validKeyInArray!0 k!934))))

(declare-fun b!1107754 () Bool)

(declare-fun e!631999 () Bool)

(declare-fun e!631995 () Bool)

(assert (=> b!1107754 (= e!631999 (and e!631995 mapRes!43090))))

(declare-fun condMapEmpty!43090 () Bool)

(declare-fun mapDefault!43090 () ValueCell!13048)

