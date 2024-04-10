; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98616 () Bool)

(assert start!98616)

(declare-fun b_free!24221 () Bool)

(declare-fun b_next!24221 () Bool)

(assert (=> start!98616 (= b_free!24221 (not b_next!24221))))

(declare-fun tp!85374 () Bool)

(declare-fun b_and!39291 () Bool)

(assert (=> start!98616 (= tp!85374 b_and!39291)))

(declare-fun b!1145178 () Bool)

(declare-fun res!762641 () Bool)

(declare-fun e!651422 () Bool)

(assert (=> b!1145178 (=> (not res!762641) (not e!651422))))

(declare-datatypes ((array!74353 0))(
  ( (array!74354 (arr!35827 (Array (_ BitVec 32) (_ BitVec 64))) (size!36363 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74353)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1145178 (= res!762641 (= (select (arr!35827 _keys!1208) i!673) k!934))))

(declare-datatypes ((V!43461 0))(
  ( (V!43462 (val!14432 Int)) )
))
(declare-fun zeroValue!944 () V!43461)

(declare-fun c!112852 () Bool)

(declare-datatypes ((tuple2!18278 0))(
  ( (tuple2!18279 (_1!9150 (_ BitVec 64)) (_2!9150 V!43461)) )
))
(declare-datatypes ((List!25031 0))(
  ( (Nil!25028) (Cons!25027 (h!26236 tuple2!18278) (t!36244 List!25031)) )
))
(declare-datatypes ((ListLongMap!16247 0))(
  ( (ListLongMap!16248 (toList!8139 List!25031)) )
))
(declare-fun lt!511170 () ListLongMap!16247)

(declare-fun call!52199 () ListLongMap!16247)

(declare-fun bm!52191 () Bool)

(declare-fun c!112851 () Bool)

(declare-fun minValue!944 () V!43461)

(declare-fun +!3565 (ListLongMap!16247 tuple2!18278) ListLongMap!16247)

(assert (=> bm!52191 (= call!52199 (+!3565 lt!511170 (ite (or c!112851 c!112852) (tuple2!18279 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18279 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!511156 () Bool)

(declare-fun e!651424 () Bool)

(declare-fun b!1145179 () Bool)

(assert (=> b!1145179 (= e!651424 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511156) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!44951 () Bool)

(declare-fun mapRes!44951 () Bool)

(declare-fun tp!85373 () Bool)

(declare-fun e!651426 () Bool)

(assert (=> mapNonEmpty!44951 (= mapRes!44951 (and tp!85373 e!651426))))

(declare-datatypes ((ValueCell!13666 0))(
  ( (ValueCellFull!13666 (v!17069 V!43461)) (EmptyCell!13666) )
))
(declare-fun mapValue!44951 () ValueCell!13666)

(declare-fun mapRest!44951 () (Array (_ BitVec 32) ValueCell!13666))

(declare-fun mapKey!44951 () (_ BitVec 32))

(declare-datatypes ((array!74355 0))(
  ( (array!74356 (arr!35828 (Array (_ BitVec 32) ValueCell!13666)) (size!36364 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74355)

(assert (=> mapNonEmpty!44951 (= (arr!35828 _values!996) (store mapRest!44951 mapKey!44951 mapValue!44951))))

(declare-fun b!1145180 () Bool)

(declare-fun res!762648 () Bool)

(declare-fun e!651420 () Bool)

(assert (=> b!1145180 (=> (not res!762648) (not e!651420))))

(declare-fun lt!511158 () array!74353)

(declare-datatypes ((List!25032 0))(
  ( (Nil!25029) (Cons!25028 (h!26237 (_ BitVec 64)) (t!36245 List!25032)) )
))
(declare-fun arrayNoDuplicates!0 (array!74353 (_ BitVec 32) List!25032) Bool)

(assert (=> b!1145180 (= res!762648 (arrayNoDuplicates!0 lt!511158 #b00000000000000000000000000000000 Nil!25029))))

(declare-fun b!1145181 () Bool)

(declare-fun tp_is_empty!28751 () Bool)

(assert (=> b!1145181 (= e!651426 tp_is_empty!28751)))

(declare-fun b!1145182 () Bool)

(declare-fun res!762642 () Bool)

(assert (=> b!1145182 (=> (not res!762642) (not e!651422))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145182 (= res!762642 (validMask!0 mask!1564))))

(declare-fun b!1145184 () Bool)

(declare-fun e!651433 () Bool)

(assert (=> b!1145184 (= e!651433 tp_is_empty!28751)))

(declare-fun b!1145185 () Bool)

(declare-datatypes ((Unit!37593 0))(
  ( (Unit!37594) )
))
(declare-fun e!651429 () Unit!37593)

(declare-fun Unit!37595 () Unit!37593)

(assert (=> b!1145185 (= e!651429 Unit!37595)))

(declare-fun b!1145186 () Bool)

(declare-fun res!762649 () Bool)

(assert (=> b!1145186 (=> (not res!762649) (not e!651422))))

(assert (=> b!1145186 (= res!762649 (and (= (size!36364 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36363 _keys!1208) (size!36364 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52192 () Bool)

(declare-fun call!52194 () Unit!37593)

(declare-fun call!52200 () Unit!37593)

(assert (=> bm!52192 (= call!52194 call!52200)))

(declare-fun b!1145187 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145187 (= e!651424 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145188 () Bool)

(assert (=> b!1145188 (= c!112852 (and (not lt!511156) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651421 () Unit!37593)

(declare-fun e!651430 () Unit!37593)

(assert (=> b!1145188 (= e!651421 e!651430)))

(declare-fun b!1145189 () Bool)

(declare-fun res!762650 () Bool)

(assert (=> b!1145189 (=> (not res!762650) (not e!651422))))

(assert (=> b!1145189 (= res!762650 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25029))))

(declare-fun b!1145190 () Bool)

(declare-fun e!651427 () Bool)

(assert (=> b!1145190 (= e!651427 (and e!651433 mapRes!44951))))

(declare-fun condMapEmpty!44951 () Bool)

(declare-fun mapDefault!44951 () ValueCell!13666)

