; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99716 () Bool)

(assert start!99716)

(declare-fun b_free!25295 () Bool)

(declare-fun b_next!25295 () Bool)

(assert (=> start!99716 (= b_free!25295 (not b_next!25295))))

(declare-fun tp!88598 () Bool)

(declare-fun b_and!41457 () Bool)

(assert (=> start!99716 (= tp!88598 b_and!41457)))

(declare-fun b!1183432 () Bool)

(declare-fun e!672843 () Bool)

(declare-fun e!672844 () Bool)

(assert (=> b!1183432 (= e!672843 e!672844)))

(declare-fun res!786549 () Bool)

(assert (=> b!1183432 (=> (not res!786549) (not e!672844))))

(declare-datatypes ((array!76451 0))(
  ( (array!76452 (arr!36875 (Array (_ BitVec 32) (_ BitVec 64))) (size!37411 (_ BitVec 32))) )
))
(declare-fun lt!536166 () array!76451)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76451 (_ BitVec 32)) Bool)

(assert (=> b!1183432 (= res!786549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536166 mask!1564))))

(declare-fun _keys!1208 () array!76451)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183432 (= lt!536166 (array!76452 (store (arr!36875 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37411 _keys!1208)))))

(declare-fun mapIsEmpty!46565 () Bool)

(declare-fun mapRes!46565 () Bool)

(assert (=> mapIsEmpty!46565 mapRes!46565))

(declare-fun b!1183433 () Bool)

(declare-fun res!786547 () Bool)

(assert (=> b!1183433 (=> (not res!786547) (not e!672843))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183433 (= res!786547 (validKeyInArray!0 k!934))))

(declare-fun b!1183434 () Bool)

(declare-fun res!786548 () Bool)

(assert (=> b!1183434 (=> (not res!786548) (not e!672843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183434 (= res!786548 (validMask!0 mask!1564))))

(declare-fun b!1183435 () Bool)

(declare-datatypes ((Unit!39167 0))(
  ( (Unit!39168) )
))
(declare-fun e!672840 () Unit!39167)

(declare-fun Unit!39169 () Unit!39167)

(assert (=> b!1183435 (= e!672840 Unit!39169)))

(declare-fun lt!536165 () Unit!39167)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76451 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39167)

(assert (=> b!1183435 (= lt!536165 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183435 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536171 () Unit!39167)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76451 (_ BitVec 32) (_ BitVec 32)) Unit!39167)

(assert (=> b!1183435 (= lt!536171 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25931 0))(
  ( (Nil!25928) (Cons!25927 (h!27136 (_ BitVec 64)) (t!38218 List!25931)) )
))
(declare-fun arrayNoDuplicates!0 (array!76451 (_ BitVec 32) List!25931) Bool)

(assert (=> b!1183435 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25928)))

(declare-fun lt!536164 () Unit!39167)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76451 (_ BitVec 64) (_ BitVec 32) List!25931) Unit!39167)

(assert (=> b!1183435 (= lt!536164 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25928))))

(assert (=> b!1183435 false))

(declare-fun b!1183436 () Bool)

(declare-fun res!786544 () Bool)

(assert (=> b!1183436 (=> (not res!786544) (not e!672844))))

(assert (=> b!1183436 (= res!786544 (arrayNoDuplicates!0 lt!536166 #b00000000000000000000000000000000 Nil!25928))))

(declare-fun b!1183437 () Bool)

(declare-fun res!786553 () Bool)

(assert (=> b!1183437 (=> (not res!786553) (not e!672843))))

(assert (=> b!1183437 (= res!786553 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25928))))

(declare-fun b!1183438 () Bool)

(declare-fun res!786539 () Bool)

(assert (=> b!1183438 (=> (not res!786539) (not e!672843))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44893 0))(
  ( (V!44894 (val!14969 Int)) )
))
(declare-datatypes ((ValueCell!14203 0))(
  ( (ValueCellFull!14203 (v!17607 V!44893)) (EmptyCell!14203) )
))
(declare-datatypes ((array!76453 0))(
  ( (array!76454 (arr!36876 (Array (_ BitVec 32) ValueCell!14203)) (size!37412 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76453)

(assert (=> b!1183438 (= res!786539 (and (= (size!37412 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37411 _keys!1208) (size!37412 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183439 () Bool)

(declare-fun e!672841 () Bool)

(assert (=> b!1183439 (= e!672841 true)))

(declare-datatypes ((tuple2!19192 0))(
  ( (tuple2!19193 (_1!9607 (_ BitVec 64)) (_2!9607 V!44893)) )
))
(declare-datatypes ((List!25932 0))(
  ( (Nil!25929) (Cons!25928 (h!27137 tuple2!19192) (t!38219 List!25932)) )
))
(declare-datatypes ((ListLongMap!17161 0))(
  ( (ListLongMap!17162 (toList!8596 List!25932)) )
))
(declare-fun lt!536160 () ListLongMap!17161)

(declare-fun lt!536175 () ListLongMap!17161)

(declare-fun -!1631 (ListLongMap!17161 (_ BitVec 64)) ListLongMap!17161)

(assert (=> b!1183439 (= (-!1631 lt!536160 k!934) lt!536175)))

(declare-fun lt!536170 () ListLongMap!17161)

(declare-fun lt!536173 () Unit!39167)

(declare-fun lt!536162 () V!44893)

(declare-fun addRemoveCommutativeForDiffKeys!157 (ListLongMap!17161 (_ BitVec 64) V!44893 (_ BitVec 64)) Unit!39167)

(assert (=> b!1183439 (= lt!536173 (addRemoveCommutativeForDiffKeys!157 lt!536170 (select (arr!36875 _keys!1208) from!1455) lt!536162 k!934))))

(declare-fun lt!536168 () ListLongMap!17161)

(declare-fun lt!536169 () ListLongMap!17161)

(declare-fun lt!536167 () ListLongMap!17161)

(assert (=> b!1183439 (and (= lt!536169 lt!536160) (= lt!536167 lt!536168))))

(declare-fun lt!536177 () tuple2!19192)

(declare-fun +!3894 (ListLongMap!17161 tuple2!19192) ListLongMap!17161)

(assert (=> b!1183439 (= lt!536160 (+!3894 lt!536170 lt!536177))))

(assert (=> b!1183439 (not (= (select (arr!36875 _keys!1208) from!1455) k!934))))

(declare-fun lt!536163 () Unit!39167)

(assert (=> b!1183439 (= lt!536163 e!672840)))

(declare-fun c!117066 () Bool)

(assert (=> b!1183439 (= c!117066 (= (select (arr!36875 _keys!1208) from!1455) k!934))))

(declare-fun e!672850 () Bool)

(assert (=> b!1183439 e!672850))

(declare-fun res!786545 () Bool)

(assert (=> b!1183439 (=> (not res!786545) (not e!672850))))

(declare-fun lt!536161 () ListLongMap!17161)

(assert (=> b!1183439 (= res!786545 (= lt!536161 lt!536175))))

(assert (=> b!1183439 (= lt!536175 (+!3894 lt!536167 lt!536177))))

(assert (=> b!1183439 (= lt!536177 (tuple2!19193 (select (arr!36875 _keys!1208) from!1455) lt!536162))))

(declare-fun lt!536172 () V!44893)

(declare-fun get!18865 (ValueCell!14203 V!44893) V!44893)

(assert (=> b!1183439 (= lt!536162 (get!18865 (select (arr!36876 _values!996) from!1455) lt!536172))))

(declare-fun b!1183440 () Bool)

(declare-fun e!672842 () Bool)

(declare-fun e!672848 () Bool)

(assert (=> b!1183440 (= e!672842 (and e!672848 mapRes!46565))))

(declare-fun condMapEmpty!46565 () Bool)

(declare-fun mapDefault!46565 () ValueCell!14203)

