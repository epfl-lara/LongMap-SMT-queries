; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97328 () Bool)

(assert start!97328)

(declare-fun b_free!23299 () Bool)

(declare-fun b_next!23299 () Bool)

(assert (=> start!97328 (= b_free!23299 (not b_next!23299))))

(declare-fun tp!82195 () Bool)

(declare-fun b_and!37431 () Bool)

(assert (=> start!97328 (= tp!82195 b_and!37431)))

(declare-fun b!1108865 () Bool)

(declare-datatypes ((V!41873 0))(
  ( (V!41874 (val!13836 Int)) )
))
(declare-datatypes ((ValueCell!13070 0))(
  ( (ValueCellFull!13070 (v!16469 V!41873)) (EmptyCell!13070) )
))
(declare-datatypes ((array!72035 0))(
  ( (array!72036 (arr!34670 (Array (_ BitVec 32) ValueCell!13070)) (size!35206 (_ BitVec 32))) )
))
(declare-fun e!632540 () array!72035)

(declare-fun _values!996 () array!72035)

(assert (=> b!1108865 (= e!632540 _values!996)))

(declare-fun zeroValue!944 () V!41873)

(declare-datatypes ((array!72037 0))(
  ( (array!72038 (arr!34671 (Array (_ BitVec 32) (_ BitVec 64))) (size!35207 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72037)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun c!109139 () Bool)

(declare-datatypes ((tuple2!17486 0))(
  ( (tuple2!17487 (_1!8754 (_ BitVec 64)) (_2!8754 V!41873)) )
))
(declare-datatypes ((List!24170 0))(
  ( (Nil!24167) (Cons!24166 (h!25375 tuple2!17486) (t!34515 List!24170)) )
))
(declare-datatypes ((ListLongMap!15455 0))(
  ( (ListLongMap!15456 (toList!7743 List!24170)) )
))
(declare-fun call!46593 () ListLongMap!15455)

(declare-fun lt!495882 () array!72037)

(declare-fun minValue!944 () V!41873)

(declare-fun bm!46590 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun e!632537 () array!72035)

(declare-fun getCurrentListMapNoExtraKeys!4237 (array!72037 array!72035 (_ BitVec 32) (_ BitVec 32) V!41873 V!41873 (_ BitVec 32) Int) ListLongMap!15455)

(assert (=> bm!46590 (= call!46593 (getCurrentListMapNoExtraKeys!4237 (ite c!109139 lt!495882 _keys!1208) e!632537 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109140 () Bool)

(assert (=> bm!46590 (= c!109140 c!109139)))

(declare-fun b!1108866 () Bool)

(declare-fun res!740003 () Bool)

(declare-fun e!632538 () Bool)

(assert (=> b!1108866 (=> (not res!740003) (not e!632538))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108866 (= res!740003 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35207 _keys!1208))))))

(declare-fun b!1108867 () Bool)

(declare-fun res!740007 () Bool)

(assert (=> b!1108867 (=> (not res!740007) (not e!632538))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1108867 (= res!740007 (= (select (arr!34671 _keys!1208) i!673) k!934))))

(declare-fun b!1108868 () Bool)

(declare-fun e!632536 () Bool)

(declare-fun e!632533 () Bool)

(declare-fun mapRes!43156 () Bool)

(assert (=> b!1108868 (= e!632536 (and e!632533 mapRes!43156))))

(declare-fun condMapEmpty!43156 () Bool)

(declare-fun mapDefault!43156 () ValueCell!13070)

