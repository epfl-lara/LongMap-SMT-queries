; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97428 () Bool)

(assert start!97428)

(declare-fun b_free!23399 () Bool)

(declare-fun b_next!23399 () Bool)

(assert (=> start!97428 (= b_free!23399 (not b_next!23399))))

(declare-fun tp!82495 () Bool)

(declare-fun b_and!37635 () Bool)

(assert (=> start!97428 (= tp!82495 b_and!37635)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!72235 0))(
  ( (array!72236 (arr!34770 (Array (_ BitVec 32) (_ BitVec 64))) (size!35306 (_ BitVec 32))) )
))
(declare-fun lt!496333 () array!72235)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42005 0))(
  ( (V!42006 (val!13886 Int)) )
))
(declare-datatypes ((ValueCell!13120 0))(
  ( (ValueCellFull!13120 (v!16519 V!42005)) (EmptyCell!13120) )
))
(declare-datatypes ((array!72237 0))(
  ( (array!72238 (arr!34771 (Array (_ BitVec 32) ValueCell!13120)) (size!35307 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72237)

(declare-datatypes ((tuple2!17574 0))(
  ( (tuple2!17575 (_1!8798 (_ BitVec 64)) (_2!8798 V!42005)) )
))
(declare-datatypes ((List!24257 0))(
  ( (Nil!24254) (Cons!24253 (h!25462 tuple2!17574) (t!34702 List!24257)) )
))
(declare-datatypes ((ListLongMap!15543 0))(
  ( (ListLongMap!15544 (toList!7787 List!24257)) )
))
(declare-fun call!46893 () ListLongMap!15543)

(declare-fun zeroValue!944 () V!42005)

(declare-fun bm!46890 () Bool)

(declare-fun minValue!944 () V!42005)

(declare-fun getCurrentListMapNoExtraKeys!4279 (array!72235 array!72237 (_ BitVec 32) (_ BitVec 32) V!42005 V!42005 (_ BitVec 32) Int) ListLongMap!15543)

(declare-fun dynLambda!2406 (Int (_ BitVec 64)) V!42005)

(assert (=> bm!46890 (= call!46893 (getCurrentListMapNoExtraKeys!4279 lt!496333 (array!72238 (store (arr!34771 _values!996) i!673 (ValueCellFull!13120 (dynLambda!2406 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35307 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111381 () Bool)

(declare-fun res!741649 () Bool)

(declare-fun e!633744 () Bool)

(assert (=> b!1111381 (=> (not res!741649) (not e!633744))))

(declare-fun _keys!1208 () array!72235)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72235 (_ BitVec 32)) Bool)

(assert (=> b!1111381 (= res!741649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111382 () Bool)

(declare-fun res!741656 () Bool)

(declare-fun e!633747 () Bool)

(assert (=> b!1111382 (=> (not res!741656) (not e!633747))))

(declare-datatypes ((List!24258 0))(
  ( (Nil!24255) (Cons!24254 (h!25463 (_ BitVec 64)) (t!34703 List!24258)) )
))
(declare-fun arrayNoDuplicates!0 (array!72235 (_ BitVec 32) List!24258) Bool)

(assert (=> b!1111382 (= res!741656 (arrayNoDuplicates!0 lt!496333 #b00000000000000000000000000000000 Nil!24255))))

(declare-fun b!1111383 () Bool)

(declare-fun res!741652 () Bool)

(assert (=> b!1111383 (=> (not res!741652) (not e!633744))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1111383 (= res!741652 (= (select (arr!34770 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43306 () Bool)

(declare-fun mapRes!43306 () Bool)

(assert (=> mapIsEmpty!43306 mapRes!43306))

(declare-fun call!46894 () ListLongMap!15543)

(declare-fun bm!46891 () Bool)

(assert (=> bm!46891 (= call!46894 (getCurrentListMapNoExtraKeys!4279 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111384 () Bool)

(declare-fun res!741658 () Bool)

(assert (=> b!1111384 (=> (not res!741658) (not e!633744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111384 (= res!741658 (validKeyInArray!0 k!934))))

(declare-fun b!1111385 () Bool)

(declare-fun e!633741 () Bool)

(declare-fun e!633743 () Bool)

(assert (=> b!1111385 (= e!633741 (and e!633743 mapRes!43306))))

(declare-fun condMapEmpty!43306 () Bool)

(declare-fun mapDefault!43306 () ValueCell!13120)

