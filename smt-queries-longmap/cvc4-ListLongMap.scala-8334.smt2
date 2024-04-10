; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101462 () Bool)

(assert start!101462)

(declare-fun b_free!26279 () Bool)

(declare-fun b_next!26279 () Bool)

(assert (=> start!101462 (= b_free!26279 (not b_next!26279))))

(declare-fun tp!91870 () Bool)

(declare-fun b_and!43747 () Bool)

(assert (=> start!101462 (= tp!91870 b_and!43747)))

(declare-fun mapNonEmpty!48361 () Bool)

(declare-fun mapRes!48361 () Bool)

(declare-fun tp!91871 () Bool)

(declare-fun e!692391 () Bool)

(assert (=> mapNonEmpty!48361 (= mapRes!48361 (and tp!91871 e!692391))))

(declare-datatypes ((V!46437 0))(
  ( (V!46438 (val!15548 Int)) )
))
(declare-datatypes ((ValueCell!14782 0))(
  ( (ValueCellFull!14782 (v!18205 V!46437)) (EmptyCell!14782) )
))
(declare-fun mapRest!48361 () (Array (_ BitVec 32) ValueCell!14782))

(declare-fun mapValue!48361 () ValueCell!14782)

(declare-fun mapKey!48361 () (_ BitVec 32))

(declare-datatypes ((array!78743 0))(
  ( (array!78744 (arr!38002 (Array (_ BitVec 32) ValueCell!14782)) (size!38538 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78743)

(assert (=> mapNonEmpty!48361 (= (arr!38002 _values!996) (store mapRest!48361 mapKey!48361 mapValue!48361))))

(declare-fun b!1219428 () Bool)

(declare-fun e!692388 () Bool)

(declare-fun e!692390 () Bool)

(assert (=> b!1219428 (= e!692388 e!692390)))

(declare-fun res!809920 () Bool)

(assert (=> b!1219428 (=> res!809920 e!692390)))

(declare-datatypes ((array!78745 0))(
  ( (array!78746 (arr!38003 (Array (_ BitVec 32) (_ BitVec 64))) (size!38539 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78745)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219428 (= res!809920 (not (= (select (arr!38003 _keys!1208) from!1455) k!934)))))

(declare-fun e!692392 () Bool)

(assert (=> b!1219428 e!692392))

(declare-fun res!809926 () Bool)

(assert (=> b!1219428 (=> (not res!809926) (not e!692392))))

(declare-datatypes ((tuple2!20008 0))(
  ( (tuple2!20009 (_1!10015 (_ BitVec 64)) (_2!10015 V!46437)) )
))
(declare-datatypes ((List!26809 0))(
  ( (Nil!26806) (Cons!26805 (h!28014 tuple2!20008) (t!40068 List!26809)) )
))
(declare-datatypes ((ListLongMap!17977 0))(
  ( (ListLongMap!17978 (toList!9004 List!26809)) )
))
(declare-fun lt!554430 () ListLongMap!17977)

(declare-fun lt!554428 () ListLongMap!17977)

(declare-fun lt!554424 () V!46437)

(declare-fun +!4073 (ListLongMap!17977 tuple2!20008) ListLongMap!17977)

(declare-fun get!19380 (ValueCell!14782 V!46437) V!46437)

(assert (=> b!1219428 (= res!809926 (= lt!554430 (+!4073 lt!554428 (tuple2!20009 (select (arr!38003 _keys!1208) from!1455) (get!19380 (select (arr!38002 _values!996) from!1455) lt!554424)))))))

(declare-fun b!1219429 () Bool)

(declare-fun e!692381 () Bool)

(declare-fun e!692384 () Bool)

(assert (=> b!1219429 (= e!692381 e!692384)))

(declare-fun res!809916 () Bool)

(assert (=> b!1219429 (=> res!809916 e!692384)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219429 (= res!809916 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554423 () array!78743)

(declare-fun minValue!944 () V!46437)

(declare-fun lt!554426 () array!78745)

(declare-fun zeroValue!944 () V!46437)

(declare-fun getCurrentListMapNoExtraKeys!5429 (array!78745 array!78743 (_ BitVec 32) (_ BitVec 32) V!46437 V!46437 (_ BitVec 32) Int) ListLongMap!17977)

(assert (=> b!1219429 (= lt!554430 (getCurrentListMapNoExtraKeys!5429 lt!554426 lt!554423 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219429 (= lt!554423 (array!78744 (store (arr!38002 _values!996) i!673 (ValueCellFull!14782 lt!554424)) (size!38538 _values!996)))))

(declare-fun dynLambda!3311 (Int (_ BitVec 64)) V!46437)

(assert (=> b!1219429 (= lt!554424 (dynLambda!3311 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554427 () ListLongMap!17977)

(assert (=> b!1219429 (= lt!554427 (getCurrentListMapNoExtraKeys!5429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219430 () Bool)

(assert (=> b!1219430 (= e!692384 e!692388)))

(declare-fun res!809921 () Bool)

(assert (=> b!1219430 (=> res!809921 e!692388)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219430 (= res!809921 (not (validKeyInArray!0 (select (arr!38003 _keys!1208) from!1455))))))

(declare-fun lt!554425 () ListLongMap!17977)

(assert (=> b!1219430 (= lt!554425 lt!554428)))

(declare-fun lt!554433 () ListLongMap!17977)

(declare-fun -!1916 (ListLongMap!17977 (_ BitVec 64)) ListLongMap!17977)

(assert (=> b!1219430 (= lt!554428 (-!1916 lt!554433 k!934))))

(assert (=> b!1219430 (= lt!554425 (getCurrentListMapNoExtraKeys!5429 lt!554426 lt!554423 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219430 (= lt!554433 (getCurrentListMapNoExtraKeys!5429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40408 0))(
  ( (Unit!40409) )
))
(declare-fun lt!554431 () Unit!40408)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1123 (array!78745 array!78743 (_ BitVec 32) (_ BitVec 32) V!46437 V!46437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40408)

(assert (=> b!1219430 (= lt!554431 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219431 () Bool)

(declare-fun e!692389 () Bool)

(declare-fun e!692385 () Bool)

(assert (=> b!1219431 (= e!692389 e!692385)))

(declare-fun res!809914 () Bool)

(assert (=> b!1219431 (=> (not res!809914) (not e!692385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78745 (_ BitVec 32)) Bool)

(assert (=> b!1219431 (= res!809914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554426 mask!1564))))

(assert (=> b!1219431 (= lt!554426 (array!78746 (store (arr!38003 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38539 _keys!1208)))))

(declare-fun b!1219432 () Bool)

(declare-fun res!809927 () Bool)

(assert (=> b!1219432 (=> (not res!809927) (not e!692389))))

(assert (=> b!1219432 (= res!809927 (validKeyInArray!0 k!934))))

(declare-fun b!1219433 () Bool)

(declare-fun res!809925 () Bool)

(assert (=> b!1219433 (=> (not res!809925) (not e!692389))))

(declare-datatypes ((List!26810 0))(
  ( (Nil!26807) (Cons!26806 (h!28015 (_ BitVec 64)) (t!40069 List!26810)) )
))
(declare-fun arrayNoDuplicates!0 (array!78745 (_ BitVec 32) List!26810) Bool)

(assert (=> b!1219433 (= res!809925 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26807))))

(declare-fun b!1219434 () Bool)

(declare-fun e!692387 () Bool)

(declare-fun e!692386 () Bool)

(assert (=> b!1219434 (= e!692387 (and e!692386 mapRes!48361))))

(declare-fun condMapEmpty!48361 () Bool)

(declare-fun mapDefault!48361 () ValueCell!14782)

