; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98430 () Bool)

(assert start!98430)

(declare-fun b_free!24035 () Bool)

(declare-fun b_next!24035 () Bool)

(assert (=> start!98430 (= b_free!24035 (not b_next!24035))))

(declare-fun tp!84816 () Bool)

(declare-fun b_and!38919 () Bool)

(assert (=> start!98430 (= tp!84816 b_and!38919)))

(declare-fun b!1136866 () Bool)

(declare-fun e!646932 () Bool)

(declare-datatypes ((V!43213 0))(
  ( (V!43214 (val!14339 Int)) )
))
(declare-datatypes ((tuple2!18106 0))(
  ( (tuple2!18107 (_1!9064 (_ BitVec 64)) (_2!9064 V!43213)) )
))
(declare-datatypes ((List!24865 0))(
  ( (Nil!24862) (Cons!24861 (h!26070 tuple2!18106) (t!35892 List!24865)) )
))
(declare-datatypes ((ListLongMap!16075 0))(
  ( (ListLongMap!16076 (toList!8053 List!24865)) )
))
(declare-fun call!49967 () ListLongMap!16075)

(declare-fun call!49965 () ListLongMap!16075)

(assert (=> b!1136866 (= e!646932 (= call!49967 call!49965))))

(declare-fun b!1136867 () Bool)

(declare-fun res!758706 () Bool)

(declare-fun e!646928 () Bool)

(assert (=> b!1136867 (=> (not res!758706) (not e!646928))))

(declare-datatypes ((array!73991 0))(
  ( (array!73992 (arr!35646 (Array (_ BitVec 32) (_ BitVec 64))) (size!36182 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73991)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1136867 (= res!758706 (= (select (arr!35646 _keys!1208) i!673) k!934))))

(declare-fun c!111174 () Bool)

(declare-fun lt!505533 () ListLongMap!16075)

(declare-fun call!49969 () ListLongMap!16075)

(declare-fun bm!49959 () Bool)

(declare-fun minValue!944 () V!43213)

(declare-fun zeroValue!944 () V!43213)

(declare-fun c!111175 () Bool)

(declare-fun +!3489 (ListLongMap!16075 tuple2!18106) ListLongMap!16075)

(assert (=> bm!49959 (= call!49969 (+!3489 lt!505533 (ite (or c!111174 c!111175) (tuple2!18107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-datatypes ((ValueCell!13573 0))(
  ( (ValueCellFull!13573 (v!16976 V!43213)) (EmptyCell!13573) )
))
(declare-datatypes ((array!73993 0))(
  ( (array!73994 (arr!35647 (Array (_ BitVec 32) ValueCell!13573)) (size!36183 (_ BitVec 32))) )
))
(declare-fun lt!505536 () array!73993)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!49960 () Bool)

(declare-fun lt!505548 () array!73991)

(declare-fun getCurrentListMapNoExtraKeys!4537 (array!73991 array!73993 (_ BitVec 32) (_ BitVec 32) V!43213 V!43213 (_ BitVec 32) Int) ListLongMap!16075)

(assert (=> bm!49960 (= call!49967 (getCurrentListMapNoExtraKeys!4537 lt!505548 lt!505536 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136868 () Bool)

(declare-fun lt!505539 () Bool)

(assert (=> b!1136868 (= c!111175 (and (not lt!505539) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37234 0))(
  ( (Unit!37235) )
))
(declare-fun e!646923 () Unit!37234)

(declare-fun e!646920 () Unit!37234)

(assert (=> b!1136868 (= e!646923 e!646920)))

(declare-fun e!646921 () Bool)

(declare-fun b!1136869 () Bool)

(declare-fun arrayContainsKey!0 (array!73991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136869 (= e!646921 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49961 () Bool)

(declare-fun call!49962 () ListLongMap!16075)

(assert (=> bm!49961 (= call!49962 call!49969)))

(declare-fun b!1136870 () Bool)

(declare-fun e!646933 () Bool)

(declare-fun e!646926 () Bool)

(declare-fun mapRes!44672 () Bool)

(assert (=> b!1136870 (= e!646933 (and e!646926 mapRes!44672))))

(declare-fun condMapEmpty!44672 () Bool)

(declare-fun _values!996 () array!73993)

(declare-fun mapDefault!44672 () ValueCell!13573)

