; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98564 () Bool)

(assert start!98564)

(declare-fun b_free!24169 () Bool)

(declare-fun b_next!24169 () Bool)

(assert (=> start!98564 (= b_free!24169 (not b_next!24169))))

(declare-fun tp!85218 () Bool)

(declare-fun b_and!39187 () Bool)

(assert (=> start!98564 (= tp!85218 b_and!39187)))

(declare-fun b!1142829 () Bool)

(declare-datatypes ((Unit!37494 0))(
  ( (Unit!37495) )
))
(declare-fun e!650138 () Unit!37494)

(declare-fun Unit!37496 () Unit!37494)

(assert (=> b!1142829 (= e!650138 Unit!37496)))

(declare-fun b!1142830 () Bool)

(declare-fun e!650143 () Bool)

(declare-fun tp_is_empty!28699 () Bool)

(assert (=> b!1142830 (= e!650143 tp_is_empty!28699)))

(declare-datatypes ((V!43393 0))(
  ( (V!43394 (val!14406 Int)) )
))
(declare-fun zeroValue!944 () V!43393)

(declare-datatypes ((array!74251 0))(
  ( (array!74252 (arr!35776 (Array (_ BitVec 32) (_ BitVec 64))) (size!36312 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74251)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!51567 () Bool)

(declare-fun minValue!944 () V!43393)

(declare-datatypes ((ValueCell!13640 0))(
  ( (ValueCellFull!13640 (v!17043 V!43393)) (EmptyCell!13640) )
))
(declare-datatypes ((array!74253 0))(
  ( (array!74254 (arr!35777 (Array (_ BitVec 32) ValueCell!13640)) (size!36313 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74253)

(declare-datatypes ((tuple2!18232 0))(
  ( (tuple2!18233 (_1!9127 (_ BitVec 64)) (_2!9127 V!43393)) )
))
(declare-datatypes ((List!24985 0))(
  ( (Nil!24982) (Cons!24981 (h!26190 tuple2!18232) (t!36146 List!24985)) )
))
(declare-datatypes ((ListLongMap!16201 0))(
  ( (ListLongMap!16202 (toList!8116 List!24985)) )
))
(declare-fun call!51575 () ListLongMap!16201)

(declare-fun getCurrentListMapNoExtraKeys!4596 (array!74251 array!74253 (_ BitVec 32) (_ BitVec 32) V!43393 V!43393 (_ BitVec 32) Int) ListLongMap!16201)

(assert (=> bm!51567 (= call!51575 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142831 () Bool)

(declare-fun res!761520 () Bool)

(declare-fun e!650150 () Bool)

(assert (=> b!1142831 (=> (not res!761520) (not e!650150))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1142831 (= res!761520 (= (select (arr!35776 _keys!1208) i!673) k!934))))

(declare-fun b!1142832 () Bool)

(declare-fun e!650142 () Bool)

(declare-fun e!650136 () Bool)

(assert (=> b!1142832 (= e!650142 e!650136)))

(declare-fun res!761512 () Bool)

(assert (=> b!1142832 (=> res!761512 e!650136)))

(assert (=> b!1142832 (= res!761512 (not (= from!1455 i!673)))))

(declare-fun lt!509528 () ListLongMap!16201)

(declare-fun lt!509525 () array!74253)

(declare-fun lt!509523 () array!74251)

(assert (=> b!1142832 (= lt!509528 (getCurrentListMapNoExtraKeys!4596 lt!509523 lt!509525 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509519 () V!43393)

(assert (=> b!1142832 (= lt!509525 (array!74254 (store (arr!35777 _values!996) i!673 (ValueCellFull!13640 lt!509519)) (size!36313 _values!996)))))

(declare-fun dynLambda!2636 (Int (_ BitVec 64)) V!43393)

(assert (=> b!1142832 (= lt!509519 (dynLambda!2636 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509516 () ListLongMap!16201)

(assert (=> b!1142832 (= lt!509516 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142833 () Bool)

(declare-fun res!761515 () Bool)

(assert (=> b!1142833 (=> (not res!761515) (not e!650150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142833 (= res!761515 (validKeyInArray!0 k!934))))

(declare-fun bm!51568 () Bool)

(declare-fun call!51570 () Bool)

(declare-fun call!51577 () Bool)

(assert (=> bm!51568 (= call!51570 call!51577)))

(declare-fun b!1142834 () Bool)

(declare-fun c!112383 () Bool)

(declare-fun lt!509530 () Bool)

(assert (=> b!1142834 (= c!112383 (and (not lt!509530) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650145 () Unit!37494)

(declare-fun e!650139 () Unit!37494)

(assert (=> b!1142834 (= e!650145 e!650139)))

(declare-fun mapIsEmpty!44873 () Bool)

(declare-fun mapRes!44873 () Bool)

(assert (=> mapIsEmpty!44873 mapRes!44873))

(declare-fun b!1142835 () Bool)

(declare-fun e!650141 () Bool)

(assert (=> b!1142835 (= e!650150 e!650141)))

(declare-fun res!761516 () Bool)

(assert (=> b!1142835 (=> (not res!761516) (not e!650141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74251 (_ BitVec 32)) Bool)

(assert (=> b!1142835 (= res!761516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509523 mask!1564))))

(assert (=> b!1142835 (= lt!509523 (array!74252 (store (arr!35776 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36312 _keys!1208)))))

(declare-fun b!1142836 () Bool)

(declare-fun lt!509527 () Unit!37494)

(assert (=> b!1142836 (= e!650139 lt!509527)))

(declare-fun call!51573 () Unit!37494)

(assert (=> b!1142836 (= lt!509527 call!51573)))

(assert (=> b!1142836 call!51570))

(declare-fun b!1142837 () Bool)

(declare-fun call!51572 () ListLongMap!16201)

(declare-fun contains!6648 (ListLongMap!16201 (_ BitVec 64)) Bool)

(assert (=> b!1142837 (contains!6648 call!51572 k!934)))

(declare-fun lt!509529 () Unit!37494)

(declare-fun call!51576 () Unit!37494)

(assert (=> b!1142837 (= lt!509529 call!51576)))

(assert (=> b!1142837 call!51577))

(declare-fun lt!509526 () ListLongMap!16201)

(declare-fun lt!509533 () ListLongMap!16201)

(declare-fun +!3545 (ListLongMap!16201 tuple2!18232) ListLongMap!16201)

(assert (=> b!1142837 (= lt!509526 (+!3545 lt!509533 (tuple2!18233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509535 () Unit!37494)

(declare-fun addStillContains!801 (ListLongMap!16201 (_ BitVec 64) V!43393 (_ BitVec 64)) Unit!37494)

(assert (=> b!1142837 (= lt!509535 (addStillContains!801 lt!509533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1142837 (= e!650145 lt!509529)))

(declare-fun call!51571 () ListLongMap!16201)

(declare-fun bm!51569 () Bool)

(assert (=> bm!51569 (= call!51571 (getCurrentListMapNoExtraKeys!4596 lt!509523 lt!509525 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142838 () Bool)

(declare-fun res!761521 () Bool)

(assert (=> b!1142838 (=> (not res!761521) (not e!650141))))

(declare-datatypes ((List!24986 0))(
  ( (Nil!24983) (Cons!24982 (h!26191 (_ BitVec 64)) (t!36147 List!24986)) )
))
(declare-fun arrayNoDuplicates!0 (array!74251 (_ BitVec 32) List!24986) Bool)

(assert (=> b!1142838 (= res!761521 (arrayNoDuplicates!0 lt!509523 #b00000000000000000000000000000000 Nil!24983))))

(declare-fun b!1142839 () Bool)

(declare-fun e!650144 () Unit!37494)

(declare-fun Unit!37497 () Unit!37494)

(assert (=> b!1142839 (= e!650144 Unit!37497)))

(declare-fun c!112382 () Bool)

(declare-fun call!51574 () ListLongMap!16201)

(declare-fun bm!51570 () Bool)

(assert (=> bm!51570 (= call!51577 (contains!6648 (ite c!112382 lt!509526 call!51574) k!934))))

(declare-fun b!1142840 () Bool)

(assert (=> b!1142840 call!51570))

(declare-fun lt!509521 () Unit!37494)

(assert (=> b!1142840 (= lt!509521 call!51573)))

(assert (=> b!1142840 (= e!650144 lt!509521)))

(declare-fun b!1142841 () Bool)

(declare-fun e!650137 () Bool)

(declare-fun e!650146 () Bool)

(assert (=> b!1142841 (= e!650137 (and e!650146 mapRes!44873))))

(declare-fun condMapEmpty!44873 () Bool)

(declare-fun mapDefault!44873 () ValueCell!13640)

