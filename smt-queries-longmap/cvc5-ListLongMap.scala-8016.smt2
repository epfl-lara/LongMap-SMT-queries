; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98936 () Bool)

(assert start!98936)

(declare-fun b_free!24541 () Bool)

(declare-fun b_next!24541 () Bool)

(assert (=> start!98936 (= b_free!24541 (not b_next!24541))))

(declare-fun tp!86333 () Bool)

(declare-fun b_and!39931 () Bool)

(assert (=> start!98936 (= tp!86333 b_and!39931)))

(declare-fun b!1159898 () Bool)

(declare-datatypes ((array!74983 0))(
  ( (array!74984 (arr!36142 (Array (_ BitVec 32) (_ BitVec 64))) (size!36678 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74983)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!659582 () Bool)

(declare-fun arrayContainsKey!0 (array!74983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1159898 (= e!659582 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56031 () Bool)

(declare-fun call!56036 () Bool)

(declare-fun call!56041 () Bool)

(assert (=> bm!56031 (= call!56036 call!56041)))

(declare-fun b!1159899 () Bool)

(declare-fun c!115728 () Bool)

(declare-fun lt!521598 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1159899 (= c!115728 (and (not lt!521598) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38233 0))(
  ( (Unit!38234) )
))
(declare-fun e!659594 () Unit!38233)

(declare-fun e!659592 () Unit!38233)

(assert (=> b!1159899 (= e!659594 e!659592)))

(declare-fun b!1159900 () Bool)

(declare-fun res!769846 () Bool)

(declare-fun e!659583 () Bool)

(assert (=> b!1159900 (=> (not res!769846) (not e!659583))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1159900 (= res!769846 (validMask!0 mask!1564))))

(declare-fun b!1159901 () Bool)

(declare-fun e!659584 () Bool)

(assert (=> b!1159901 (= e!659583 e!659584)))

(declare-fun res!769851 () Bool)

(assert (=> b!1159901 (=> (not res!769851) (not e!659584))))

(declare-fun lt!521593 () array!74983)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74983 (_ BitVec 32)) Bool)

(assert (=> b!1159901 (= res!769851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521593 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1159901 (= lt!521593 (array!74984 (store (arr!36142 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36678 _keys!1208)))))

(declare-fun b!1159902 () Bool)

(declare-fun res!769850 () Bool)

(assert (=> b!1159902 (=> (not res!769850) (not e!659583))))

(assert (=> b!1159902 (= res!769850 (= (select (arr!36142 _keys!1208) i!673) k!934))))

(declare-fun e!659591 () Bool)

(declare-fun b!1159903 () Bool)

(assert (=> b!1159903 (= e!659591 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56032 () Bool)

(declare-fun call!56038 () Unit!38233)

(declare-fun call!56037 () Unit!38233)

(assert (=> bm!56032 (= call!56038 call!56037)))

(declare-datatypes ((V!43889 0))(
  ( (V!43890 (val!14592 Int)) )
))
(declare-fun zeroValue!944 () V!43889)

(declare-datatypes ((ValueCell!13826 0))(
  ( (ValueCellFull!13826 (v!17229 V!43889)) (EmptyCell!13826) )
))
(declare-datatypes ((array!74985 0))(
  ( (array!74986 (arr!36143 (Array (_ BitVec 32) ValueCell!13826)) (size!36679 (_ BitVec 32))) )
))
(declare-fun lt!521601 () array!74985)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!56033 () Bool)

(declare-datatypes ((tuple2!18582 0))(
  ( (tuple2!18583 (_1!9302 (_ BitVec 64)) (_2!9302 V!43889)) )
))
(declare-datatypes ((List!25320 0))(
  ( (Nil!25317) (Cons!25316 (h!26525 tuple2!18582) (t!36853 List!25320)) )
))
(declare-datatypes ((ListLongMap!16551 0))(
  ( (ListLongMap!16552 (toList!8291 List!25320)) )
))
(declare-fun call!56039 () ListLongMap!16551)

(declare-fun minValue!944 () V!43889)

(declare-fun getCurrentListMapNoExtraKeys!4755 (array!74983 array!74985 (_ BitVec 32) (_ BitVec 32) V!43889 V!43889 (_ BitVec 32) Int) ListLongMap!16551)

(assert (=> bm!56033 (= call!56039 (getCurrentListMapNoExtraKeys!4755 lt!521593 lt!521601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1159904 () Bool)

(declare-fun res!769849 () Bool)

(assert (=> b!1159904 (=> (not res!769849) (not e!659583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1159904 (= res!769849 (validKeyInArray!0 k!934))))

(declare-fun b!1159905 () Bool)

(declare-fun e!659585 () Bool)

(declare-fun e!659590 () Bool)

(assert (=> b!1159905 (= e!659585 e!659590)))

(declare-fun res!769841 () Bool)

(assert (=> b!1159905 (=> res!769841 e!659590)))

(assert (=> b!1159905 (= res!769841 (not (= from!1455 i!673)))))

(declare-fun lt!521595 () ListLongMap!16551)

(assert (=> b!1159905 (= lt!521595 (getCurrentListMapNoExtraKeys!4755 lt!521593 lt!521601 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74985)

(declare-fun lt!521597 () V!43889)

(assert (=> b!1159905 (= lt!521601 (array!74986 (store (arr!36143 _values!996) i!673 (ValueCellFull!13826 lt!521597)) (size!36679 _values!996)))))

(declare-fun dynLambda!2755 (Int (_ BitVec 64)) V!43889)

(assert (=> b!1159905 (= lt!521597 (dynLambda!2755 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521596 () ListLongMap!16551)

(assert (=> b!1159905 (= lt!521596 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1159906 () Bool)

(declare-fun e!659588 () Bool)

(declare-fun e!659579 () Bool)

(declare-fun mapRes!45431 () Bool)

(assert (=> b!1159906 (= e!659588 (and e!659579 mapRes!45431))))

(declare-fun condMapEmpty!45431 () Bool)

(declare-fun mapDefault!45431 () ValueCell!13826)

