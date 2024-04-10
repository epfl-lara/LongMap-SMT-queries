; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100030 () Bool)

(assert start!100030)

(declare-fun b_free!25609 () Bool)

(declare-fun b_next!25609 () Bool)

(assert (=> start!100030 (= b_free!25609 (not b_next!25609))))

(declare-fun tp!89541 () Bool)

(declare-fun b_and!42085 () Bool)

(assert (=> start!100030 (= tp!89541 b_and!42085)))

(declare-fun b!1191985 () Bool)

(declare-fun res!792899 () Bool)

(declare-fun e!677550 () Bool)

(assert (=> b!1191985 (=> (not res!792899) (not e!677550))))

(declare-datatypes ((array!77067 0))(
  ( (array!77068 (arr!37183 (Array (_ BitVec 32) (_ BitVec 64))) (size!37719 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77067)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45313 0))(
  ( (V!45314 (val!15126 Int)) )
))
(declare-datatypes ((ValueCell!14360 0))(
  ( (ValueCellFull!14360 (v!17764 V!45313)) (EmptyCell!14360) )
))
(declare-datatypes ((array!77069 0))(
  ( (array!77070 (arr!37184 (Array (_ BitVec 32) ValueCell!14360)) (size!37720 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77069)

(assert (=> b!1191985 (= res!792899 (and (= (size!37720 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37719 _keys!1208) (size!37720 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191986 () Bool)

(declare-fun e!677552 () Bool)

(declare-fun e!677553 () Bool)

(assert (=> b!1191986 (= e!677552 (not e!677553))))

(declare-fun res!792903 () Bool)

(assert (=> b!1191986 (=> res!792903 e!677553)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191986 (= res!792903 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191986 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39542 0))(
  ( (Unit!39543) )
))
(declare-fun lt!542045 () Unit!39542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77067 (_ BitVec 64) (_ BitVec 32)) Unit!39542)

(assert (=> b!1191986 (= lt!542045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191987 () Bool)

(assert (=> b!1191987 (= e!677550 e!677552)))

(declare-fun res!792897 () Bool)

(assert (=> b!1191987 (=> (not res!792897) (not e!677552))))

(declare-fun lt!542043 () array!77067)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77067 (_ BitVec 32)) Bool)

(assert (=> b!1191987 (= res!792897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542043 mask!1564))))

(assert (=> b!1191987 (= lt!542043 (array!77068 (store (arr!37183 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37719 _keys!1208)))))

(declare-fun mapIsEmpty!47036 () Bool)

(declare-fun mapRes!47036 () Bool)

(assert (=> mapIsEmpty!47036 mapRes!47036))

(declare-fun b!1191988 () Bool)

(declare-fun res!792901 () Bool)

(assert (=> b!1191988 (=> (not res!792901) (not e!677550))))

(assert (=> b!1191988 (= res!792901 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37719 _keys!1208))))))

(declare-fun b!1191989 () Bool)

(declare-fun res!792900 () Bool)

(assert (=> b!1191989 (=> (not res!792900) (not e!677550))))

(declare-datatypes ((List!26187 0))(
  ( (Nil!26184) (Cons!26183 (h!27392 (_ BitVec 64)) (t!38788 List!26187)) )
))
(declare-fun arrayNoDuplicates!0 (array!77067 (_ BitVec 32) List!26187) Bool)

(assert (=> b!1191989 (= res!792900 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26184))))

(declare-fun b!1191990 () Bool)

(declare-fun e!677549 () Bool)

(declare-fun tp_is_empty!30139 () Bool)

(assert (=> b!1191990 (= e!677549 tp_is_empty!30139)))

(declare-fun b!1191991 () Bool)

(declare-fun e!677547 () Bool)

(assert (=> b!1191991 (= e!677547 (and e!677549 mapRes!47036))))

(declare-fun condMapEmpty!47036 () Bool)

(declare-fun mapDefault!47036 () ValueCell!14360)

