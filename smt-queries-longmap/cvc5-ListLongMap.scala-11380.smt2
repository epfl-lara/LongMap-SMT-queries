; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132246 () Bool)

(assert start!132246)

(declare-fun b_free!31897 () Bool)

(declare-fun b_next!31897 () Bool)

(assert (=> start!132246 (= b_free!31897 (not b_next!31897))))

(declare-fun tp!111951 () Bool)

(declare-fun b_and!51331 () Bool)

(assert (=> start!132246 (= tp!111951 b_and!51331)))

(declare-datatypes ((V!59341 0))(
  ( (V!59342 (val!19164 Int)) )
))
(declare-datatypes ((tuple2!24706 0))(
  ( (tuple2!24707 (_1!12364 (_ BitVec 64)) (_2!12364 V!59341)) )
))
(declare-datatypes ((List!36184 0))(
  ( (Nil!36181) (Cons!36180 (h!37625 tuple2!24706) (t!50896 List!36184)) )
))
(declare-datatypes ((ListLongMap!22315 0))(
  ( (ListLongMap!22316 (toList!11173 List!36184)) )
))
(declare-fun call!70992 () ListLongMap!22315)

(declare-fun zeroValue!436 () V!59341)

(declare-fun c!142767 () Bool)

(declare-fun bm!70988 () Bool)

(declare-fun minValue!436 () V!59341)

(declare-fun call!70993 () ListLongMap!22315)

(declare-fun c!142768 () Bool)

(declare-fun call!70995 () ListLongMap!22315)

(declare-fun call!70991 () ListLongMap!22315)

(declare-fun +!4994 (ListLongMap!22315 tuple2!24706) ListLongMap!22315)

(assert (=> bm!70988 (= call!70995 (+!4994 (ite c!142767 call!70992 (ite c!142768 call!70991 call!70993)) (ite (or c!142767 c!142768) (tuple2!24707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551413 () Bool)

(declare-fun e!863640 () Bool)

(declare-fun e!863636 () Bool)

(assert (=> b!1551413 (= e!863640 e!863636)))

(declare-fun res!1062426 () Bool)

(assert (=> b!1551413 (=> (not res!1062426) (not e!863636))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103548 0))(
  ( (array!103549 (arr!49973 (Array (_ BitVec 32) (_ BitVec 64))) (size!50523 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103548)

(assert (=> b!1551413 (= res!1062426 (bvslt from!762 (size!50523 _keys!618)))))

(declare-fun lt!668668 () ListLongMap!22315)

(declare-fun e!863635 () ListLongMap!22315)

(assert (=> b!1551413 (= lt!668668 e!863635)))

(declare-fun lt!668670 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551413 (= c!142767 (and (not lt!668670) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551413 (= lt!668670 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551414 () Bool)

(declare-fun e!863634 () ListLongMap!22315)

(assert (=> b!1551414 (= e!863635 e!863634)))

(assert (=> b!1551414 (= c!142768 (and (not lt!668670) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58972 () Bool)

(declare-fun mapRes!58972 () Bool)

(assert (=> mapIsEmpty!58972 mapRes!58972))

(declare-fun b!1551415 () Bool)

(declare-fun res!1062422 () Bool)

(assert (=> b!1551415 (=> (not res!1062422) (not e!863636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551415 (= res!1062422 (validKeyInArray!0 (select (arr!49973 _keys!618) from!762)))))

(declare-fun b!1551416 () Bool)

(declare-fun e!863637 () Bool)

(declare-fun e!863638 () Bool)

(assert (=> b!1551416 (= e!863637 (and e!863638 mapRes!58972))))

(declare-fun condMapEmpty!58972 () Bool)

(declare-datatypes ((ValueCell!18176 0))(
  ( (ValueCellFull!18176 (v!21968 V!59341)) (EmptyCell!18176) )
))
(declare-datatypes ((array!103550 0))(
  ( (array!103551 (arr!49974 (Array (_ BitVec 32) ValueCell!18176)) (size!50524 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103550)

(declare-fun mapDefault!58972 () ValueCell!18176)

