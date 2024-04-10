; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132064 () Bool)

(assert start!132064)

(declare-fun b_free!31777 () Bool)

(declare-fun b_next!31777 () Bool)

(assert (=> start!132064 (= b_free!31777 (not b_next!31777))))

(declare-fun tp!111583 () Bool)

(declare-fun b_and!51187 () Bool)

(assert (=> start!132064 (= tp!111583 b_and!51187)))

(declare-fun b!1548089 () Bool)

(declare-fun c!142126 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667095 () Bool)

(assert (=> b!1548089 (= c!142126 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667095))))

(declare-datatypes ((V!59181 0))(
  ( (V!59182 (val!19104 Int)) )
))
(declare-datatypes ((tuple2!24588 0))(
  ( (tuple2!24589 (_1!12305 (_ BitVec 64)) (_2!12305 V!59181)) )
))
(declare-datatypes ((List!36082 0))(
  ( (Nil!36079) (Cons!36078 (h!37523 tuple2!24588) (t!50776 List!36082)) )
))
(declare-datatypes ((ListLongMap!22197 0))(
  ( (ListLongMap!22198 (toList!11114 List!36082)) )
))
(declare-fun e!861718 () ListLongMap!22197)

(declare-fun e!861712 () ListLongMap!22197)

(assert (=> b!1548089 (= e!861718 e!861712)))

(declare-fun b!1548090 () Bool)

(declare-fun e!861717 () ListLongMap!22197)

(assert (=> b!1548090 (= e!861717 e!861718)))

(declare-fun c!142125 () Bool)

(assert (=> b!1548090 (= c!142125 (and (not lt!667095) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548091 () Bool)

(declare-fun e!861720 () Bool)

(assert (=> b!1548091 (= e!861720 (not true))))

(declare-datatypes ((array!103306 0))(
  ( (array!103307 (arr!49855 (Array (_ BitVec 32) (_ BitVec 64))) (size!50405 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103306)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667103 () V!59181)

(declare-fun lt!667099 () ListLongMap!22197)

(declare-fun apply!1063 (ListLongMap!22197 (_ BitVec 64)) V!59181)

(assert (=> b!1548091 (= (apply!1063 lt!667099 (select (arr!49855 _keys!618) from!762)) lt!667103)))

(declare-fun zeroValue!436 () V!59181)

(declare-datatypes ((Unit!51576 0))(
  ( (Unit!51577) )
))
(declare-fun lt!667097 () Unit!51576)

(declare-fun lt!667101 () ListLongMap!22197)

(declare-fun addApplyDifferent!605 (ListLongMap!22197 (_ BitVec 64) V!59181 (_ BitVec 64)) Unit!51576)

(assert (=> b!1548091 (= lt!667097 (addApplyDifferent!605 lt!667101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49855 _keys!618) from!762)))))

(declare-fun lt!667100 () V!59181)

(assert (=> b!1548091 (= lt!667100 lt!667103)))

(assert (=> b!1548091 (= lt!667103 (apply!1063 lt!667101 (select (arr!49855 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59181)

(declare-fun +!4945 (ListLongMap!22197 tuple2!24588) ListLongMap!22197)

(assert (=> b!1548091 (= lt!667100 (apply!1063 (+!4945 lt!667101 (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49855 _keys!618) from!762)))))

(declare-fun lt!667102 () Unit!51576)

(assert (=> b!1548091 (= lt!667102 (addApplyDifferent!605 lt!667101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49855 _keys!618) from!762)))))

(declare-fun contains!10070 (ListLongMap!22197 (_ BitVec 64)) Bool)

(assert (=> b!1548091 (contains!10070 lt!667099 (select (arr!49855 _keys!618) from!762))))

(assert (=> b!1548091 (= lt!667099 (+!4945 lt!667101 (tuple2!24589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667098 () Unit!51576)

(declare-fun addStillContains!1258 (ListLongMap!22197 (_ BitVec 64) V!59181 (_ BitVec 64)) Unit!51576)

(assert (=> b!1548091 (= lt!667098 (addStillContains!1258 lt!667101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49855 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18116 0))(
  ( (ValueCellFull!18116 (v!21905 V!59181)) (EmptyCell!18116) )
))
(declare-datatypes ((array!103308 0))(
  ( (array!103309 (arr!49856 (Array (_ BitVec 32) ValueCell!18116)) (size!50406 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103308)

(declare-fun getCurrentListMapNoExtraKeys!6571 (array!103306 array!103308 (_ BitVec 32) (_ BitVec 32) V!59181 V!59181 (_ BitVec 32) Int) ListLongMap!22197)

(assert (=> b!1548091 (= lt!667101 (getCurrentListMapNoExtraKeys!6571 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548092 () Bool)

(declare-fun e!861715 () Bool)

(declare-fun tp_is_empty!38053 () Bool)

(assert (=> b!1548092 (= e!861715 tp_is_empty!38053)))

(declare-fun b!1548093 () Bool)

(declare-fun e!861714 () Bool)

(assert (=> b!1548093 (= e!861714 e!861720)))

(declare-fun res!1060965 () Bool)

(assert (=> b!1548093 (=> (not res!1060965) (not e!861720))))

(assert (=> b!1548093 (= res!1060965 (bvslt from!762 (size!50405 _keys!618)))))

(declare-fun lt!667096 () ListLongMap!22197)

(assert (=> b!1548093 (= lt!667096 e!861717)))

(declare-fun c!142127 () Bool)

(assert (=> b!1548093 (= c!142127 (and (not lt!667095) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548093 (= lt!667095 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70052 () Bool)

(declare-fun call!70058 () ListLongMap!22197)

(declare-fun call!70056 () ListLongMap!22197)

(assert (=> bm!70052 (= call!70058 call!70056)))

(declare-fun b!1548094 () Bool)

(declare-fun res!1060969 () Bool)

(assert (=> b!1548094 (=> (not res!1060969) (not e!861714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103306 (_ BitVec 32)) Bool)

(assert (=> b!1548094 (= res!1060969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548095 () Bool)

(declare-fun res!1060971 () Bool)

(assert (=> b!1548095 (=> (not res!1060971) (not e!861714))))

(assert (=> b!1548095 (= res!1060971 (and (= (size!50406 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50405 _keys!618) (size!50406 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548096 () Bool)

(declare-fun e!861713 () Bool)

(assert (=> b!1548096 (= e!861713 tp_is_empty!38053)))

(declare-fun b!1548097 () Bool)

(declare-fun res!1060970 () Bool)

(assert (=> b!1548097 (=> (not res!1060970) (not e!861714))))

(assert (=> b!1548097 (= res!1060970 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50405 _keys!618))))))

(declare-fun b!1548098 () Bool)

(declare-fun call!70059 () ListLongMap!22197)

(assert (=> b!1548098 (= e!861717 (+!4945 call!70059 (tuple2!24589 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70054 () Bool)

(declare-fun call!70057 () ListLongMap!22197)

(assert (=> bm!70054 (= call!70057 call!70059)))

(declare-fun b!1548099 () Bool)

(assert (=> b!1548099 (= e!861712 call!70057)))

(declare-fun b!1548100 () Bool)

(declare-fun call!70055 () ListLongMap!22197)

(assert (=> b!1548100 (= e!861712 call!70055)))

(declare-fun b!1548101 () Bool)

(assert (=> b!1548101 (= e!861718 call!70057)))

(declare-fun b!1548102 () Bool)

(declare-fun res!1060968 () Bool)

(assert (=> b!1548102 (=> (not res!1060968) (not e!861720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548102 (= res!1060968 (validKeyInArray!0 (select (arr!49855 _keys!618) from!762)))))

(declare-fun bm!70055 () Bool)

(assert (=> bm!70055 (= call!70055 call!70058)))

(declare-fun b!1548103 () Bool)

(declare-fun e!861716 () Bool)

(declare-fun mapRes!58783 () Bool)

(assert (=> b!1548103 (= e!861716 (and e!861713 mapRes!58783))))

(declare-fun condMapEmpty!58783 () Bool)

(declare-fun mapDefault!58783 () ValueCell!18116)

