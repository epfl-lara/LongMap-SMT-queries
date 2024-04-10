; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99742 () Bool)

(assert start!99742)

(declare-fun b_free!25321 () Bool)

(declare-fun b_next!25321 () Bool)

(assert (=> start!99742 (= b_free!25321 (not b_next!25321))))

(declare-fun tp!88676 () Bool)

(declare-fun b_and!41509 () Bool)

(assert (=> start!99742 (= tp!88676 b_and!41509)))

(declare-fun mapNonEmpty!46604 () Bool)

(declare-fun mapRes!46604 () Bool)

(declare-fun tp!88677 () Bool)

(declare-fun e!673313 () Bool)

(assert (=> mapNonEmpty!46604 (= mapRes!46604 (and tp!88677 e!673313))))

(declare-datatypes ((V!44929 0))(
  ( (V!44930 (val!14982 Int)) )
))
(declare-datatypes ((ValueCell!14216 0))(
  ( (ValueCellFull!14216 (v!17620 V!44929)) (EmptyCell!14216) )
))
(declare-fun mapRest!46604 () (Array (_ BitVec 32) ValueCell!14216))

(declare-fun mapValue!46604 () ValueCell!14216)

(declare-datatypes ((array!76501 0))(
  ( (array!76502 (arr!36900 (Array (_ BitVec 32) ValueCell!14216)) (size!37436 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76501)

(declare-fun mapKey!46604 () (_ BitVec 32))

(assert (=> mapNonEmpty!46604 (= (arr!36900 _values!996) (store mapRest!46604 mapKey!46604 mapValue!46604))))

(declare-fun b!1184237 () Bool)

(declare-fun res!787129 () Bool)

(declare-fun e!673312 () Bool)

(assert (=> b!1184237 (=> (not res!787129) (not e!673312))))

(declare-datatypes ((array!76503 0))(
  ( (array!76504 (arr!36901 (Array (_ BitVec 32) (_ BitVec 64))) (size!37437 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76503)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1184237 (= res!787129 (and (= (size!37436 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37437 _keys!1208) (size!37436 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184238 () Bool)

(declare-fun res!787132 () Bool)

(assert (=> b!1184238 (=> (not res!787132) (not e!673312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76503 (_ BitVec 32)) Bool)

(assert (=> b!1184238 (= res!787132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184239 () Bool)

(declare-datatypes ((Unit!39204 0))(
  ( (Unit!39205) )
))
(declare-fun e!673309 () Unit!39204)

(declare-fun Unit!39206 () Unit!39204)

(assert (=> b!1184239 (= e!673309 Unit!39206)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!536915 () Unit!39204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39204)

(assert (=> b!1184239 (= lt!536915 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184239 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536907 () Unit!39204)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76503 (_ BitVec 32) (_ BitVec 32)) Unit!39204)

(assert (=> b!1184239 (= lt!536907 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25949 0))(
  ( (Nil!25946) (Cons!25945 (h!27154 (_ BitVec 64)) (t!38262 List!25949)) )
))
(declare-fun arrayNoDuplicates!0 (array!76503 (_ BitVec 32) List!25949) Bool)

(assert (=> b!1184239 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25946)))

(declare-fun lt!536902 () Unit!39204)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76503 (_ BitVec 64) (_ BitVec 32) List!25949) Unit!39204)

(assert (=> b!1184239 (= lt!536902 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25946))))

(assert (=> b!1184239 false))

(declare-fun b!1184240 () Bool)

(declare-fun e!673308 () Bool)

(declare-fun e!673311 () Bool)

(assert (=> b!1184240 (= e!673308 (and e!673311 mapRes!46604))))

(declare-fun condMapEmpty!46604 () Bool)

(declare-fun mapDefault!46604 () ValueCell!14216)

