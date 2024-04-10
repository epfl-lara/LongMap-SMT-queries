; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99412 () Bool)

(assert start!99412)

(declare-fun b_free!24991 () Bool)

(declare-fun b_next!24991 () Bool)

(assert (=> start!99412 (= b_free!24991 (not b_next!24991))))

(declare-fun tp!87687 () Bool)

(declare-fun b_and!40849 () Bool)

(assert (=> start!99412 (= tp!87687 b_and!40849)))

(declare-fun b!1173665 () Bool)

(declare-fun res!779367 () Bool)

(declare-fun e!667117 () Bool)

(assert (=> b!1173665 (=> (not res!779367) (not e!667117))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75853 0))(
  ( (array!75854 (arr!36576 (Array (_ BitVec 32) (_ BitVec 64))) (size!37112 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75853)

(assert (=> b!1173665 (= res!779367 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37112 _keys!1208))))))

(declare-fun b!1173666 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!667118 () Bool)

(declare-fun arrayContainsKey!0 (array!75853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173666 (= e!667118 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173667 () Bool)

(declare-fun e!667126 () Bool)

(assert (=> b!1173667 (= e!667126 e!667118)))

(declare-fun res!779369 () Bool)

(assert (=> b!1173667 (=> res!779369 e!667118)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173667 (= res!779369 (not (= (select (arr!36576 _keys!1208) from!1455) k!934)))))

(declare-fun res!779365 () Bool)

(assert (=> start!99412 (=> (not res!779365) (not e!667117))))

(assert (=> start!99412 (= res!779365 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37112 _keys!1208))))))

(assert (=> start!99412 e!667117))

(declare-fun tp_is_empty!29521 () Bool)

(assert (=> start!99412 tp_is_empty!29521))

(declare-fun array_inv!27944 (array!75853) Bool)

(assert (=> start!99412 (array_inv!27944 _keys!1208)))

(assert (=> start!99412 true))

(assert (=> start!99412 tp!87687))

(declare-datatypes ((V!44489 0))(
  ( (V!44490 (val!14817 Int)) )
))
(declare-datatypes ((ValueCell!14051 0))(
  ( (ValueCellFull!14051 (v!17455 V!44489)) (EmptyCell!14051) )
))
(declare-datatypes ((array!75855 0))(
  ( (array!75856 (arr!36577 (Array (_ BitVec 32) ValueCell!14051)) (size!37113 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75855)

(declare-fun e!667125 () Bool)

(declare-fun array_inv!27945 (array!75855) Bool)

(assert (=> start!99412 (and (array_inv!27945 _values!996) e!667125)))

(declare-fun b!1173668 () Bool)

(declare-fun res!779366 () Bool)

(assert (=> b!1173668 (=> (not res!779366) (not e!667117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173668 (= res!779366 (validKeyInArray!0 k!934))))

(declare-fun b!1173669 () Bool)

(declare-fun e!667120 () Bool)

(assert (=> b!1173669 (= e!667117 e!667120)))

(declare-fun res!779364 () Bool)

(assert (=> b!1173669 (=> (not res!779364) (not e!667120))))

(declare-fun lt!529091 () array!75853)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75853 (_ BitVec 32)) Bool)

(assert (=> b!1173669 (= res!779364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529091 mask!1564))))

(assert (=> b!1173669 (= lt!529091 (array!75854 (store (arr!36576 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37112 _keys!1208)))))

(declare-fun b!1173670 () Bool)

(declare-fun e!667123 () Bool)

(declare-fun e!667116 () Bool)

(assert (=> b!1173670 (= e!667123 e!667116)))

(declare-fun res!779368 () Bool)

(assert (=> b!1173670 (=> res!779368 e!667116)))

(assert (=> b!1173670 (= res!779368 (not (validKeyInArray!0 (select (arr!36576 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18936 0))(
  ( (tuple2!18937 (_1!9479 (_ BitVec 64)) (_2!9479 V!44489)) )
))
(declare-datatypes ((List!25674 0))(
  ( (Nil!25671) (Cons!25670 (h!26879 tuple2!18936) (t!37657 List!25674)) )
))
(declare-datatypes ((ListLongMap!16905 0))(
  ( (ListLongMap!16906 (toList!8468 List!25674)) )
))
(declare-fun lt!529080 () ListLongMap!16905)

(declare-fun lt!529089 () ListLongMap!16905)

(assert (=> b!1173670 (= lt!529080 lt!529089)))

(declare-fun lt!529081 () ListLongMap!16905)

(declare-fun -!1530 (ListLongMap!16905 (_ BitVec 64)) ListLongMap!16905)

(assert (=> b!1173670 (= lt!529089 (-!1530 lt!529081 k!934))))

(declare-fun zeroValue!944 () V!44489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529083 () array!75855)

(declare-fun minValue!944 () V!44489)

(declare-fun getCurrentListMapNoExtraKeys!4930 (array!75853 array!75855 (_ BitVec 32) (_ BitVec 32) V!44489 V!44489 (_ BitVec 32) Int) ListLongMap!16905)

(assert (=> b!1173670 (= lt!529080 (getCurrentListMapNoExtraKeys!4930 lt!529091 lt!529083 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173670 (= lt!529081 (getCurrentListMapNoExtraKeys!4930 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38706 0))(
  ( (Unit!38707) )
))
(declare-fun lt!529090 () Unit!38706)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!757 (array!75853 array!75855 (_ BitVec 32) (_ BitVec 32) V!44489 V!44489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38706)

(assert (=> b!1173670 (= lt!529090 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!757 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173671 () Bool)

(declare-fun res!779362 () Bool)

(assert (=> b!1173671 (=> (not res!779362) (not e!667117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173671 (= res!779362 (validMask!0 mask!1564))))

(declare-fun b!1173672 () Bool)

(assert (=> b!1173672 (= e!667116 true)))

(assert (=> b!1173672 (not (= (select (arr!36576 _keys!1208) from!1455) k!934))))

(declare-fun lt!529079 () Unit!38706)

(declare-fun e!667122 () Unit!38706)

(assert (=> b!1173672 (= lt!529079 e!667122)))

(declare-fun c!116610 () Bool)

(assert (=> b!1173672 (= c!116610 (= (select (arr!36576 _keys!1208) from!1455) k!934))))

(assert (=> b!1173672 e!667126))

(declare-fun res!779359 () Bool)

(assert (=> b!1173672 (=> (not res!779359) (not e!667126))))

(declare-fun lt!529092 () V!44489)

(declare-fun lt!529085 () ListLongMap!16905)

(declare-fun +!3786 (ListLongMap!16905 tuple2!18936) ListLongMap!16905)

(declare-fun get!18664 (ValueCell!14051 V!44489) V!44489)

(assert (=> b!1173672 (= res!779359 (= lt!529085 (+!3786 lt!529089 (tuple2!18937 (select (arr!36576 _keys!1208) from!1455) (get!18664 (select (arr!36577 _values!996) from!1455) lt!529092)))))))

(declare-fun b!1173673 () Bool)

(declare-fun res!779363 () Bool)

(assert (=> b!1173673 (=> (not res!779363) (not e!667117))))

(assert (=> b!1173673 (= res!779363 (and (= (size!37113 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37112 _keys!1208) (size!37113 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173674 () Bool)

(declare-fun e!667119 () Bool)

(declare-fun mapRes!46109 () Bool)

(assert (=> b!1173674 (= e!667125 (and e!667119 mapRes!46109))))

(declare-fun condMapEmpty!46109 () Bool)

(declare-fun mapDefault!46109 () ValueCell!14051)

