; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132040 () Bool)

(assert start!132040)

(declare-fun b_free!31753 () Bool)

(declare-fun b_next!31753 () Bool)

(assert (=> start!132040 (= b_free!31753 (not b_next!31753))))

(declare-fun tp!111511 () Bool)

(declare-fun b_and!51163 () Bool)

(assert (=> start!132040 (= tp!111511 b_and!51163)))

(declare-fun bm!69872 () Bool)

(declare-datatypes ((V!59149 0))(
  ( (V!59150 (val!19092 Int)) )
))
(declare-datatypes ((tuple2!24564 0))(
  ( (tuple2!24565 (_1!12293 (_ BitVec 64)) (_2!12293 V!59149)) )
))
(declare-datatypes ((List!36062 0))(
  ( (Nil!36059) (Cons!36058 (h!37503 tuple2!24564) (t!50756 List!36062)) )
))
(declare-datatypes ((ListLongMap!22173 0))(
  ( (ListLongMap!22174 (toList!11102 List!36062)) )
))
(declare-fun call!69877 () ListLongMap!22173)

(declare-fun call!69876 () ListLongMap!22173)

(assert (=> bm!69872 (= call!69877 call!69876)))

(declare-fun bm!69873 () Bool)

(declare-fun zeroValue!436 () V!59149)

(declare-fun c!142019 () Bool)

(declare-fun c!142018 () Bool)

(declare-fun minValue!436 () V!59149)

(declare-fun call!69879 () ListLongMap!22173)

(declare-fun call!69875 () ListLongMap!22173)

(declare-fun call!69878 () ListLongMap!22173)

(declare-fun +!4933 (ListLongMap!22173 tuple2!24564) ListLongMap!22173)

(assert (=> bm!69873 (= call!69876 (+!4933 (ite c!142019 call!69878 (ite c!142018 call!69875 call!69879)) (ite (or c!142019 c!142018) (tuple2!24565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547513 () Bool)

(declare-fun res!1060714 () Bool)

(declare-fun e!861394 () Bool)

(assert (=> b!1547513 (=> (not res!1060714) (not e!861394))))

(declare-datatypes ((array!103258 0))(
  ( (array!103259 (arr!49831 (Array (_ BitVec 32) (_ BitVec 64))) (size!50381 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103258)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547513 (= res!1060714 (validKeyInArray!0 (select (arr!49831 _keys!618) from!762)))))

(declare-fun b!1547514 () Bool)

(declare-fun res!1060717 () Bool)

(declare-fun e!861390 () Bool)

(assert (=> b!1547514 (=> (not res!1060717) (not e!861390))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18104 0))(
  ( (ValueCellFull!18104 (v!21893 V!59149)) (EmptyCell!18104) )
))
(declare-datatypes ((array!103260 0))(
  ( (array!103261 (arr!49832 (Array (_ BitVec 32) ValueCell!18104)) (size!50382 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103260)

(assert (=> b!1547514 (= res!1060717 (and (= (size!50382 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50381 _keys!618) (size!50382 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547515 () Bool)

(assert (=> b!1547515 (= e!861390 e!861394)))

(declare-fun res!1060718 () Bool)

(assert (=> b!1547515 (=> (not res!1060718) (not e!861394))))

(assert (=> b!1547515 (= res!1060718 (bvslt from!762 (size!50381 _keys!618)))))

(declare-fun lt!666899 () ListLongMap!22173)

(declare-fun e!861393 () ListLongMap!22173)

(assert (=> b!1547515 (= lt!666899 e!861393)))

(declare-fun lt!666902 () Bool)

(assert (=> b!1547515 (= c!142019 (and (not lt!666902) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547515 (= lt!666902 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547516 () Bool)

(declare-fun c!142017 () Bool)

(assert (=> b!1547516 (= c!142017 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666902))))

(declare-fun e!861396 () ListLongMap!22173)

(declare-fun e!861392 () ListLongMap!22173)

(assert (=> b!1547516 (= e!861396 e!861392)))

(declare-fun b!1547517 () Bool)

(declare-fun e!861391 () Bool)

(declare-fun tp_is_empty!38029 () Bool)

(assert (=> b!1547517 (= e!861391 tp_is_empty!38029)))

(declare-fun res!1060719 () Bool)

(assert (=> start!132040 (=> (not res!1060719) (not e!861390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132040 (= res!1060719 (validMask!0 mask!926))))

(assert (=> start!132040 e!861390))

(declare-fun array_inv!38751 (array!103258) Bool)

(assert (=> start!132040 (array_inv!38751 _keys!618)))

(assert (=> start!132040 tp_is_empty!38029))

(assert (=> start!132040 true))

(assert (=> start!132040 tp!111511))

(declare-fun e!861388 () Bool)

(declare-fun array_inv!38752 (array!103260) Bool)

(assert (=> start!132040 (and (array_inv!38752 _values!470) e!861388)))

(declare-fun b!1547518 () Bool)

(declare-fun e!861395 () Bool)

(declare-fun mapRes!58747 () Bool)

(assert (=> b!1547518 (= e!861388 (and e!861395 mapRes!58747))))

(declare-fun condMapEmpty!58747 () Bool)

(declare-fun mapDefault!58747 () ValueCell!18104)

