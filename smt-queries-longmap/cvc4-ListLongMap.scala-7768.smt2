; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97356 () Bool)

(assert start!97356)

(declare-fun b_free!23327 () Bool)

(declare-fun b_next!23327 () Bool)

(assert (=> start!97356 (= b_free!23327 (not b_next!23327))))

(declare-fun tp!82280 () Bool)

(declare-fun b_and!37489 () Bool)

(assert (=> start!97356 (= tp!82280 b_and!37489)))

(declare-fun res!740464 () Bool)

(declare-fun e!632872 () Bool)

(assert (=> start!97356 (=> (not res!740464) (not e!632872))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72091 0))(
  ( (array!72092 (arr!34698 (Array (_ BitVec 32) (_ BitVec 64))) (size!35234 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72091)

(assert (=> start!97356 (= res!740464 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35234 _keys!1208))))))

(assert (=> start!97356 e!632872))

(declare-fun tp_is_empty!27587 () Bool)

(assert (=> start!97356 tp_is_empty!27587))

(declare-fun array_inv!26702 (array!72091) Bool)

(assert (=> start!97356 (array_inv!26702 _keys!1208)))

(assert (=> start!97356 true))

(assert (=> start!97356 tp!82280))

(declare-datatypes ((V!41909 0))(
  ( (V!41910 (val!13850 Int)) )
))
(declare-datatypes ((ValueCell!13084 0))(
  ( (ValueCellFull!13084 (v!16483 V!41909)) (EmptyCell!13084) )
))
(declare-datatypes ((array!72093 0))(
  ( (array!72094 (arr!34699 (Array (_ BitVec 32) ValueCell!13084)) (size!35235 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72093)

(declare-fun e!632877 () Bool)

(declare-fun array_inv!26703 (array!72093) Bool)

(assert (=> start!97356 (and (array_inv!26703 _values!996) e!632877)))

(declare-fun zeroValue!944 () V!41909)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17508 0))(
  ( (tuple2!17509 (_1!8765 (_ BitVec 64)) (_2!8765 V!41909)) )
))
(declare-datatypes ((List!24192 0))(
  ( (Nil!24189) (Cons!24188 (h!25397 tuple2!17508) (t!34565 List!24192)) )
))
(declare-datatypes ((ListLongMap!15477 0))(
  ( (ListLongMap!15478 (toList!7754 List!24192)) )
))
(declare-fun call!46678 () ListLongMap!15477)

(declare-fun lt!496009 () array!72091)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41909)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun bm!46674 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4248 (array!72091 array!72093 (_ BitVec 32) (_ BitVec 32) V!41909 V!41909 (_ BitVec 32) Int) ListLongMap!15477)

(declare-fun dynLambda!2378 (Int (_ BitVec 64)) V!41909)

(assert (=> bm!46674 (= call!46678 (getCurrentListMapNoExtraKeys!4248 lt!496009 (array!72094 (store (arr!34699 _values!996) i!673 (ValueCellFull!13084 (dynLambda!2378 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35235 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109569 () Bool)

(declare-fun res!740468 () Bool)

(assert (=> b!1109569 (=> (not res!740468) (not e!632872))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1109569 (= res!740468 (= (select (arr!34698 _keys!1208) i!673) k!934))))

(declare-fun b!1109570 () Bool)

(declare-fun e!632876 () Bool)

(assert (=> b!1109570 (= e!632876 true)))

(declare-fun e!632873 () Bool)

(assert (=> b!1109570 e!632873))

(declare-fun c!109182 () Bool)

(assert (=> b!1109570 (= c!109182 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36414 0))(
  ( (Unit!36415) )
))
(declare-fun lt!496008 () Unit!36414)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!276 (array!72091 array!72093 (_ BitVec 32) (_ BitVec 32) V!41909 V!41909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36414)

(assert (=> b!1109570 (= lt!496008 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109571 () Bool)

(declare-fun res!740465 () Bool)

(assert (=> b!1109571 (=> (not res!740465) (not e!632872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109571 (= res!740465 (validKeyInArray!0 k!934))))

(declare-fun b!1109572 () Bool)

(declare-fun res!740461 () Bool)

(assert (=> b!1109572 (=> (not res!740461) (not e!632872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109572 (= res!740461 (validMask!0 mask!1564))))

(declare-fun b!1109573 () Bool)

(declare-fun e!632870 () Bool)

(assert (=> b!1109573 (= e!632870 tp_is_empty!27587)))

(declare-fun b!1109574 () Bool)

(declare-fun e!632874 () Bool)

(assert (=> b!1109574 (= e!632874 (not e!632876))))

(declare-fun res!740467 () Bool)

(assert (=> b!1109574 (=> res!740467 e!632876)))

(assert (=> b!1109574 (= res!740467 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35234 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109574 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!496010 () Unit!36414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72091 (_ BitVec 64) (_ BitVec 32)) Unit!36414)

(assert (=> b!1109574 (= lt!496010 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1109575 () Bool)

(declare-fun res!740460 () Bool)

(assert (=> b!1109575 (=> (not res!740460) (not e!632872))))

(assert (=> b!1109575 (= res!740460 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35234 _keys!1208))))))

(declare-fun b!1109576 () Bool)

(declare-fun mapRes!43198 () Bool)

(assert (=> b!1109576 (= e!632877 (and e!632870 mapRes!43198))))

(declare-fun condMapEmpty!43198 () Bool)

(declare-fun mapDefault!43198 () ValueCell!13084)

