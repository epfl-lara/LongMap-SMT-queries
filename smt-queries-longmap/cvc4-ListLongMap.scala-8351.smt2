; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101660 () Bool)

(assert start!101660)

(declare-fun b_free!26381 () Bool)

(declare-fun b_next!26381 () Bool)

(assert (=> start!101660 (= b_free!26381 (not b_next!26381))))

(declare-fun tp!92186 () Bool)

(declare-fun b_and!44005 () Bool)

(assert (=> start!101660 (= tp!92186 b_and!44005)))

(declare-fun b!1223038 () Bool)

(declare-datatypes ((Unit!40519 0))(
  ( (Unit!40520) )
))
(declare-fun e!694599 () Unit!40519)

(declare-fun Unit!40521 () Unit!40519)

(assert (=> b!1223038 (= e!694599 Unit!40521)))

(declare-datatypes ((array!78953 0))(
  ( (array!78954 (arr!38104 (Array (_ BitVec 32) (_ BitVec 64))) (size!38640 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78953)

(declare-fun lt!556583 () Unit!40519)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78953 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40519)

(assert (=> b!1223038 (= lt!556583 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223038 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556575 () Unit!40519)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78953 (_ BitVec 32) (_ BitVec 32)) Unit!40519)

(assert (=> b!1223038 (= lt!556575 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26898 0))(
  ( (Nil!26895) (Cons!26894 (h!28103 (_ BitVec 64)) (t!40259 List!26898)) )
))
(declare-fun arrayNoDuplicates!0 (array!78953 (_ BitVec 32) List!26898) Bool)

(assert (=> b!1223038 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26895)))

(declare-fun lt!556587 () Unit!40519)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78953 (_ BitVec 64) (_ BitVec 32) List!26898) Unit!40519)

(assert (=> b!1223038 (= lt!556587 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26895))))

(assert (=> b!1223038 false))

(declare-fun b!1223039 () Bool)

(declare-fun e!694593 () Bool)

(declare-fun e!694596 () Bool)

(assert (=> b!1223039 (= e!694593 e!694596)))

(declare-fun res!812645 () Bool)

(assert (=> b!1223039 (=> (not res!812645) (not e!694596))))

(declare-fun lt!556580 () array!78953)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78953 (_ BitVec 32)) Bool)

(assert (=> b!1223039 (= res!812645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556580 mask!1564))))

(assert (=> b!1223039 (= lt!556580 (array!78954 (store (arr!38104 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38640 _keys!1208)))))

(declare-fun b!1223040 () Bool)

(declare-fun res!812648 () Bool)

(assert (=> b!1223040 (=> (not res!812648) (not e!694593))))

(assert (=> b!1223040 (= res!812648 (= (select (arr!38104 _keys!1208) i!673) k!934))))

(declare-fun b!1223041 () Bool)

(declare-fun e!694595 () Bool)

(declare-datatypes ((V!46573 0))(
  ( (V!46574 (val!15599 Int)) )
))
(declare-datatypes ((ValueCell!14833 0))(
  ( (ValueCellFull!14833 (v!18260 V!46573)) (EmptyCell!14833) )
))
(declare-datatypes ((array!78955 0))(
  ( (array!78956 (arr!38105 (Array (_ BitVec 32) ValueCell!14833)) (size!38641 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78955)

(assert (=> b!1223041 (= e!694595 (bvslt from!1455 (size!38641 _values!996)))))

(assert (=> b!1223041 (not (= (select (arr!38104 _keys!1208) from!1455) k!934))))

(declare-fun lt!556582 () Unit!40519)

(assert (=> b!1223041 (= lt!556582 e!694599)))

(declare-fun c!120353 () Bool)

(assert (=> b!1223041 (= c!120353 (= (select (arr!38104 _keys!1208) from!1455) k!934))))

(declare-fun e!694598 () Bool)

(assert (=> b!1223041 e!694598))

(declare-fun res!812637 () Bool)

(assert (=> b!1223041 (=> (not res!812637) (not e!694598))))

(declare-datatypes ((tuple2!20098 0))(
  ( (tuple2!20099 (_1!10060 (_ BitVec 64)) (_2!10060 V!46573)) )
))
(declare-datatypes ((List!26899 0))(
  ( (Nil!26896) (Cons!26895 (h!28104 tuple2!20098) (t!40260 List!26899)) )
))
(declare-datatypes ((ListLongMap!18067 0))(
  ( (ListLongMap!18068 (toList!9049 List!26899)) )
))
(declare-fun lt!556576 () ListLongMap!18067)

(declare-fun lt!556581 () ListLongMap!18067)

(declare-fun lt!556588 () V!46573)

(declare-fun +!4108 (ListLongMap!18067 tuple2!20098) ListLongMap!18067)

(declare-fun get!19455 (ValueCell!14833 V!46573) V!46573)

(assert (=> b!1223041 (= res!812637 (= lt!556581 (+!4108 lt!556576 (tuple2!20099 (select (arr!38104 _keys!1208) from!1455) (get!19455 (select (arr!38105 _values!996) from!1455) lt!556588)))))))

(declare-fun b!1223042 () Bool)

(declare-fun res!812642 () Bool)

(assert (=> b!1223042 (=> (not res!812642) (not e!694593))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1223042 (= res!812642 (and (= (size!38641 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38640 _keys!1208) (size!38641 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223043 () Bool)

(declare-fun res!812646 () Bool)

(assert (=> b!1223043 (=> (not res!812646) (not e!694593))))

(assert (=> b!1223043 (= res!812646 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26895))))

(declare-fun b!1223044 () Bool)

(declare-fun e!694591 () Bool)

(assert (=> b!1223044 (= e!694591 e!694595)))

(declare-fun res!812640 () Bool)

(assert (=> b!1223044 (=> res!812640 e!694595)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223044 (= res!812640 (not (validKeyInArray!0 (select (arr!38104 _keys!1208) from!1455))))))

(declare-fun lt!556585 () ListLongMap!18067)

(assert (=> b!1223044 (= lt!556585 lt!556576)))

(declare-fun lt!556578 () ListLongMap!18067)

(declare-fun -!1952 (ListLongMap!18067 (_ BitVec 64)) ListLongMap!18067)

(assert (=> b!1223044 (= lt!556576 (-!1952 lt!556578 k!934))))

(declare-fun zeroValue!944 () V!46573)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46573)

(declare-fun lt!556577 () array!78955)

(declare-fun getCurrentListMapNoExtraKeys!5471 (array!78953 array!78955 (_ BitVec 32) (_ BitVec 32) V!46573 V!46573 (_ BitVec 32) Int) ListLongMap!18067)

(assert (=> b!1223044 (= lt!556585 (getCurrentListMapNoExtraKeys!5471 lt!556580 lt!556577 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223044 (= lt!556578 (getCurrentListMapNoExtraKeys!5471 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556584 () Unit!40519)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1159 (array!78953 array!78955 (_ BitVec 32) (_ BitVec 32) V!46573 V!46573 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40519)

(assert (=> b!1223044 (= lt!556584 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1159 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223045 () Bool)

(declare-fun e!694594 () Bool)

(declare-fun e!694590 () Bool)

(declare-fun mapRes!48523 () Bool)

(assert (=> b!1223045 (= e!694594 (and e!694590 mapRes!48523))))

(declare-fun condMapEmpty!48523 () Bool)

(declare-fun mapDefault!48523 () ValueCell!14833)

