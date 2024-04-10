; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101632 () Bool)

(assert start!101632)

(declare-fun b_free!26353 () Bool)

(declare-fun b_next!26353 () Bool)

(assert (=> start!101632 (= b_free!26353 (not b_next!26353))))

(declare-fun tp!92101 () Bool)

(declare-fun b_and!43949 () Bool)

(assert (=> start!101632 (= tp!92101 b_and!43949)))

(declare-fun mapIsEmpty!48481 () Bool)

(declare-fun mapRes!48481 () Bool)

(assert (=> mapIsEmpty!48481 mapRes!48481))

(declare-fun b!1222177 () Bool)

(declare-fun e!694088 () Bool)

(declare-fun e!694094 () Bool)

(assert (=> b!1222177 (= e!694088 e!694094)))

(declare-fun res!812002 () Bool)

(assert (=> b!1222177 (=> res!812002 e!694094)))

(declare-datatypes ((array!78897 0))(
  ( (array!78898 (arr!38076 (Array (_ BitVec 32) (_ BitVec 64))) (size!38612 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78897)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222177 (= res!812002 (not (= (select (arr!38076 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222178 () Bool)

(declare-fun res!812010 () Bool)

(declare-fun e!694087 () Bool)

(assert (=> b!1222178 (=> (not res!812010) (not e!694087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222178 (= res!812010 (validKeyInArray!0 k!934))))

(declare-fun b!1222179 () Bool)

(declare-fun e!694092 () Bool)

(declare-fun e!694086 () Bool)

(assert (=> b!1222179 (= e!694092 e!694086)))

(declare-fun res!811997 () Bool)

(assert (=> b!1222179 (=> res!811997 e!694086)))

(assert (=> b!1222179 (= res!811997 (not (validKeyInArray!0 (select (arr!38076 _keys!1208) from!1455))))))

(declare-datatypes ((V!46537 0))(
  ( (V!46538 (val!15585 Int)) )
))
(declare-datatypes ((tuple2!20072 0))(
  ( (tuple2!20073 (_1!10047 (_ BitVec 64)) (_2!10047 V!46537)) )
))
(declare-datatypes ((List!26873 0))(
  ( (Nil!26870) (Cons!26869 (h!28078 tuple2!20072) (t!40206 List!26873)) )
))
(declare-datatypes ((ListLongMap!18041 0))(
  ( (ListLongMap!18042 (toList!9036 List!26873)) )
))
(declare-fun lt!556000 () ListLongMap!18041)

(declare-fun lt!555995 () ListLongMap!18041)

(assert (=> b!1222179 (= lt!556000 lt!555995)))

(declare-fun lt!555996 () ListLongMap!18041)

(declare-fun -!1940 (ListLongMap!18041 (_ BitVec 64)) ListLongMap!18041)

(assert (=> b!1222179 (= lt!555995 (-!1940 lt!555996 k!934))))

(declare-fun zeroValue!944 () V!46537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555997 () array!78897)

(declare-datatypes ((ValueCell!14819 0))(
  ( (ValueCellFull!14819 (v!18246 V!46537)) (EmptyCell!14819) )
))
(declare-datatypes ((array!78899 0))(
  ( (array!78900 (arr!38077 (Array (_ BitVec 32) ValueCell!14819)) (size!38613 (_ BitVec 32))) )
))
(declare-fun lt!555999 () array!78899)

(declare-fun minValue!944 () V!46537)

(declare-fun getCurrentListMapNoExtraKeys!5458 (array!78897 array!78899 (_ BitVec 32) (_ BitVec 32) V!46537 V!46537 (_ BitVec 32) Int) ListLongMap!18041)

(assert (=> b!1222179 (= lt!556000 (getCurrentListMapNoExtraKeys!5458 lt!555997 lt!555999 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78899)

(assert (=> b!1222179 (= lt!555996 (getCurrentListMapNoExtraKeys!5458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40476 0))(
  ( (Unit!40477) )
))
(declare-fun lt!556002 () Unit!40476)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1147 (array!78897 array!78899 (_ BitVec 32) (_ BitVec 32) V!46537 V!46537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40476)

(assert (=> b!1222179 (= lt!556002 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1147 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222180 () Bool)

(declare-fun e!694084 () Bool)

(declare-fun e!694091 () Bool)

(assert (=> b!1222180 (= e!694084 (and e!694091 mapRes!48481))))

(declare-fun condMapEmpty!48481 () Bool)

(declare-fun mapDefault!48481 () ValueCell!14819)

