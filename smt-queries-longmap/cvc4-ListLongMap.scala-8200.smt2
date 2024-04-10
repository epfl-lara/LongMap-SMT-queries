; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100070 () Bool)

(assert start!100070)

(declare-fun b_free!25649 () Bool)

(declare-fun b_next!25649 () Bool)

(assert (=> start!100070 (= b_free!25649 (not b_next!25649))))

(declare-fun tp!89660 () Bool)

(declare-fun b_and!42165 () Bool)

(assert (=> start!100070 (= tp!89660 b_and!42165)))

(declare-fun b!1192925 () Bool)

(declare-fun e!678029 () Bool)

(declare-fun e!678028 () Bool)

(assert (=> b!1192925 (= e!678029 e!678028)))

(declare-fun res!793622 () Bool)

(assert (=> b!1192925 (=> (not res!793622) (not e!678028))))

(declare-datatypes ((array!77141 0))(
  ( (array!77142 (arr!37220 (Array (_ BitVec 32) (_ BitVec 64))) (size!37756 (_ BitVec 32))) )
))
(declare-fun lt!542401 () array!77141)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77141 (_ BitVec 32)) Bool)

(assert (=> b!1192925 (= res!793622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542401 mask!1564))))

(declare-fun _keys!1208 () array!77141)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192925 (= lt!542401 (array!77142 (store (arr!37220 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37756 _keys!1208)))))

(declare-fun b!1192926 () Bool)

(declare-fun res!793619 () Bool)

(assert (=> b!1192926 (=> (not res!793619) (not e!678029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192926 (= res!793619 (validMask!0 mask!1564))))

(declare-fun b!1192927 () Bool)

(declare-fun res!793620 () Bool)

(assert (=> b!1192927 (=> (not res!793620) (not e!678029))))

(assert (=> b!1192927 (= res!793620 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37756 _keys!1208))))))

(declare-fun b!1192928 () Bool)

(declare-fun e!678027 () Bool)

(assert (=> b!1192928 (= e!678027 true)))

(declare-datatypes ((V!45365 0))(
  ( (V!45366 (val!15146 Int)) )
))
(declare-fun zeroValue!944 () V!45365)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14380 0))(
  ( (ValueCellFull!14380 (v!17784 V!45365)) (EmptyCell!14380) )
))
(declare-datatypes ((array!77143 0))(
  ( (array!77144 (arr!37221 (Array (_ BitVec 32) ValueCell!14380)) (size!37757 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77143)

(declare-fun minValue!944 () V!45365)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!542404 () array!77143)

(declare-datatypes ((tuple2!19472 0))(
  ( (tuple2!19473 (_1!9747 (_ BitVec 64)) (_2!9747 V!45365)) )
))
(declare-datatypes ((List!26215 0))(
  ( (Nil!26212) (Cons!26211 (h!27420 tuple2!19472) (t!38856 List!26215)) )
))
(declare-datatypes ((ListLongMap!17441 0))(
  ( (ListLongMap!17442 (toList!8736 List!26215)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5177 (array!77141 array!77143 (_ BitVec 32) (_ BitVec 32) V!45365 V!45365 (_ BitVec 32) Int) ListLongMap!17441)

(declare-fun -!1761 (ListLongMap!17441 (_ BitVec 64)) ListLongMap!17441)

(assert (=> b!1192928 (= (getCurrentListMapNoExtraKeys!5177 lt!542401 lt!542404 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1761 (getCurrentListMapNoExtraKeys!5177 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39576 0))(
  ( (Unit!39577) )
))
(declare-fun lt!542405 () Unit!39576)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!970 (array!77141 array!77143 (_ BitVec 32) (_ BitVec 32) V!45365 V!45365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39576)

(assert (=> b!1192928 (= lt!542405 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!970 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192929 () Bool)

(declare-fun res!793618 () Bool)

(assert (=> b!1192929 (=> (not res!793618) (not e!678029))))

(assert (=> b!1192929 (= res!793618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192930 () Bool)

(declare-fun res!793623 () Bool)

(assert (=> b!1192930 (=> (not res!793623) (not e!678029))))

(assert (=> b!1192930 (= res!793623 (= (select (arr!37220 _keys!1208) i!673) k!934))))

(declare-fun b!1192931 () Bool)

(declare-fun e!678032 () Bool)

(declare-fun tp_is_empty!30179 () Bool)

(assert (=> b!1192931 (= e!678032 tp_is_empty!30179)))

(declare-fun b!1192932 () Bool)

(declare-fun res!793617 () Bool)

(assert (=> b!1192932 (=> (not res!793617) (not e!678029))))

(assert (=> b!1192932 (= res!793617 (and (= (size!37757 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37756 _keys!1208) (size!37757 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192933 () Bool)

(declare-fun res!793625 () Bool)

(assert (=> b!1192933 (=> (not res!793625) (not e!678029))))

(declare-datatypes ((List!26216 0))(
  ( (Nil!26213) (Cons!26212 (h!27421 (_ BitVec 64)) (t!38857 List!26216)) )
))
(declare-fun arrayNoDuplicates!0 (array!77141 (_ BitVec 32) List!26216) Bool)

(assert (=> b!1192933 (= res!793625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26213))))

(declare-fun b!1192934 () Bool)

(declare-fun e!678034 () Bool)

(declare-fun e!678030 () Bool)

(declare-fun mapRes!47096 () Bool)

(assert (=> b!1192934 (= e!678034 (and e!678030 mapRes!47096))))

(declare-fun condMapEmpty!47096 () Bool)

(declare-fun mapDefault!47096 () ValueCell!14380)

