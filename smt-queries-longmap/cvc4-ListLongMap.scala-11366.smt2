; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132104 () Bool)

(assert start!132104)

(declare-fun b_free!31817 () Bool)

(declare-fun b_next!31817 () Bool)

(assert (=> start!132104 (= b_free!31817 (not b_next!31817))))

(declare-fun tp!111702 () Bool)

(declare-fun b_and!51227 () Bool)

(assert (=> start!132104 (= tp!111702 b_and!51227)))

(declare-fun b!1549049 () Bool)

(declare-fun e!862259 () Bool)

(assert (=> b!1549049 (= e!862259 (not true))))

(declare-datatypes ((V!59233 0))(
  ( (V!59234 (val!19124 Int)) )
))
(declare-fun lt!667643 () V!59233)

(declare-datatypes ((array!103384 0))(
  ( (array!103385 (arr!49894 (Array (_ BitVec 32) (_ BitVec 64))) (size!50444 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103384)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((tuple2!24626 0))(
  ( (tuple2!24627 (_1!12324 (_ BitVec 64)) (_2!12324 V!59233)) )
))
(declare-datatypes ((List!36115 0))(
  ( (Nil!36112) (Cons!36111 (h!37556 tuple2!24626) (t!50809 List!36115)) )
))
(declare-datatypes ((ListLongMap!22235 0))(
  ( (ListLongMap!22236 (toList!11133 List!36115)) )
))
(declare-fun lt!667640 () ListLongMap!22235)

(declare-fun apply!1078 (ListLongMap!22235 (_ BitVec 64)) V!59233)

(assert (=> b!1549049 (= (apply!1078 lt!667640 (select (arr!49894 _keys!618) from!762)) lt!667643)))

(declare-fun zeroValue!436 () V!59233)

(declare-fun lt!667636 () ListLongMap!22235)

(declare-datatypes ((Unit!51606 0))(
  ( (Unit!51607) )
))
(declare-fun lt!667642 () Unit!51606)

(declare-fun addApplyDifferent!620 (ListLongMap!22235 (_ BitVec 64) V!59233 (_ BitVec 64)) Unit!51606)

(assert (=> b!1549049 (= lt!667642 (addApplyDifferent!620 lt!667636 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49894 _keys!618) from!762)))))

(declare-fun lt!667638 () V!59233)

(assert (=> b!1549049 (= lt!667638 lt!667643)))

(assert (=> b!1549049 (= lt!667643 (apply!1078 lt!667636 (select (arr!49894 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59233)

(declare-fun +!4962 (ListLongMap!22235 tuple2!24626) ListLongMap!22235)

(assert (=> b!1549049 (= lt!667638 (apply!1078 (+!4962 lt!667636 (tuple2!24627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49894 _keys!618) from!762)))))

(declare-fun lt!667635 () Unit!51606)

(assert (=> b!1549049 (= lt!667635 (addApplyDifferent!620 lt!667636 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49894 _keys!618) from!762)))))

(declare-fun contains!10085 (ListLongMap!22235 (_ BitVec 64)) Bool)

(assert (=> b!1549049 (contains!10085 lt!667640 (select (arr!49894 _keys!618) from!762))))

(assert (=> b!1549049 (= lt!667640 (+!4962 lt!667636 (tuple2!24627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667637 () Unit!51606)

(declare-fun addStillContains!1273 (ListLongMap!22235 (_ BitVec 64) V!59233 (_ BitVec 64)) Unit!51606)

(assert (=> b!1549049 (= lt!667637 (addStillContains!1273 lt!667636 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49894 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18136 0))(
  ( (ValueCellFull!18136 (v!21925 V!59233)) (EmptyCell!18136) )
))
(declare-datatypes ((array!103386 0))(
  ( (array!103387 (arr!49895 (Array (_ BitVec 32) ValueCell!18136)) (size!50445 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103386)

(declare-fun getCurrentListMapNoExtraKeys!6587 (array!103384 array!103386 (_ BitVec 32) (_ BitVec 32) V!59233 V!59233 (_ BitVec 32) Int) ListLongMap!22235)

(assert (=> b!1549049 (= lt!667636 (getCurrentListMapNoExtraKeys!6587 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549050 () Bool)

(declare-fun e!862255 () Bool)

(declare-fun tp_is_empty!38093 () Bool)

(assert (=> b!1549050 (= e!862255 tp_is_empty!38093)))

(declare-fun b!1549051 () Bool)

(declare-fun e!862257 () ListLongMap!22235)

(declare-fun call!70355 () ListLongMap!22235)

(assert (=> b!1549051 (= e!862257 call!70355)))

(declare-fun bm!70352 () Bool)

(declare-fun c!142305 () Bool)

(declare-fun call!70359 () ListLongMap!22235)

(declare-fun c!142306 () Bool)

(declare-fun call!70357 () ListLongMap!22235)

(declare-fun call!70356 () ListLongMap!22235)

(assert (=> bm!70352 (= call!70357 (+!4962 (ite c!142305 call!70359 (ite c!142306 call!70356 call!70355)) (ite (or c!142305 c!142306) (tuple2!24627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549052 () Bool)

(declare-fun res!1061386 () Bool)

(assert (=> b!1549052 (=> (not res!1061386) (not e!862259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549052 (= res!1061386 (validKeyInArray!0 (select (arr!49894 _keys!618) from!762)))))

(declare-fun b!1549053 () Bool)

(declare-fun e!862253 () Bool)

(assert (=> b!1549053 (= e!862253 tp_is_empty!38093)))

(declare-fun mapIsEmpty!58843 () Bool)

(declare-fun mapRes!58843 () Bool)

(assert (=> mapIsEmpty!58843 mapRes!58843))

(declare-fun bm!70353 () Bool)

(declare-fun call!70358 () ListLongMap!22235)

(assert (=> bm!70353 (= call!70358 call!70357)))

(declare-fun b!1549054 () Bool)

(declare-fun e!862256 () Bool)

(assert (=> b!1549054 (= e!862256 (and e!862255 mapRes!58843))))

(declare-fun condMapEmpty!58843 () Bool)

(declare-fun mapDefault!58843 () ValueCell!18136)

