; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99030 () Bool)

(assert start!99030)

(declare-fun b_free!24635 () Bool)

(declare-fun b_next!24635 () Bool)

(assert (=> start!99030 (= b_free!24635 (not b_next!24635))))

(declare-fun tp!86615 () Bool)

(declare-fun b_and!40119 () Bool)

(assert (=> start!99030 (= tp!86615 b_and!40119)))

(declare-fun b!1164094 () Bool)

(declare-fun res!771925 () Bool)

(declare-fun e!661901 () Bool)

(assert (=> b!1164094 (=> (not res!771925) (not e!661901))))

(declare-datatypes ((array!75169 0))(
  ( (array!75170 (arr!36235 (Array (_ BitVec 32) (_ BitVec 64))) (size!36771 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75169)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44013 0))(
  ( (V!44014 (val!14639 Int)) )
))
(declare-datatypes ((ValueCell!13873 0))(
  ( (ValueCellFull!13873 (v!17276 V!44013)) (EmptyCell!13873) )
))
(declare-datatypes ((array!75171 0))(
  ( (array!75172 (arr!36236 (Array (_ BitVec 32) ValueCell!13873)) (size!36772 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75171)

(assert (=> b!1164094 (= res!771925 (and (= (size!36772 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36771 _keys!1208) (size!36772 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164095 () Bool)

(declare-fun e!661899 () Bool)

(declare-fun e!661900 () Bool)

(assert (=> b!1164095 (= e!661899 (not e!661900))))

(declare-fun res!771930 () Bool)

(assert (=> b!1164095 (=> res!771930 e!661900)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164095 (= res!771930 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164095 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38424 0))(
  ( (Unit!38425) )
))
(declare-fun lt!524546 () Unit!38424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75169 (_ BitVec 64) (_ BitVec 32)) Unit!38424)

(assert (=> b!1164095 (= lt!524546 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1164096 () Bool)

(declare-fun res!771927 () Bool)

(assert (=> b!1164096 (=> (not res!771927) (not e!661901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164096 (= res!771927 (validKeyInArray!0 k!934))))

(declare-fun b!1164097 () Bool)

(declare-fun e!661902 () Bool)

(declare-fun tp_is_empty!29165 () Bool)

(assert (=> b!1164097 (= e!661902 tp_is_empty!29165)))

(declare-fun b!1164099 () Bool)

(declare-fun res!771931 () Bool)

(assert (=> b!1164099 (=> (not res!771931) (not e!661901))))

(assert (=> b!1164099 (= res!771931 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36771 _keys!1208))))))

(declare-fun b!1164100 () Bool)

(declare-fun res!771928 () Bool)

(assert (=> b!1164100 (=> (not res!771928) (not e!661901))))

(assert (=> b!1164100 (= res!771928 (= (select (arr!36235 _keys!1208) i!673) k!934))))

(declare-fun b!1164101 () Bool)

(declare-fun res!771922 () Bool)

(assert (=> b!1164101 (=> (not res!771922) (not e!661901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164101 (= res!771922 (validMask!0 mask!1564))))

(declare-fun b!1164102 () Bool)

(declare-fun e!661897 () Bool)

(declare-fun mapRes!45572 () Bool)

(assert (=> b!1164102 (= e!661897 (and e!661902 mapRes!45572))))

(declare-fun condMapEmpty!45572 () Bool)

(declare-fun mapDefault!45572 () ValueCell!13873)

