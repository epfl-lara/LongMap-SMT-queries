; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132210 () Bool)

(assert start!132210)

(declare-fun b_free!31885 () Bool)

(declare-fun b_next!31885 () Bool)

(assert (=> start!132210 (= b_free!31885 (not b_next!31885))))

(declare-fun tp!111912 () Bool)

(declare-fun b_and!51315 () Bool)

(assert (=> start!132210 (= tp!111912 b_and!51315)))

(declare-fun b!1551014 () Bool)

(declare-datatypes ((V!59325 0))(
  ( (V!59326 (val!19158 Int)) )
))
(declare-datatypes ((tuple2!24694 0))(
  ( (tuple2!24695 (_1!12358 (_ BitVec 64)) (_2!12358 V!59325)) )
))
(declare-datatypes ((List!36172 0))(
  ( (Nil!36169) (Cons!36168 (h!37613 tuple2!24694) (t!50882 List!36172)) )
))
(declare-datatypes ((ListLongMap!22303 0))(
  ( (ListLongMap!22304 (toList!11167 List!36172)) )
))
(declare-fun e!863399 () ListLongMap!22303)

(declare-fun call!70896 () ListLongMap!22303)

(assert (=> b!1551014 (= e!863399 call!70896)))

(declare-fun call!70895 () ListLongMap!22303)

(declare-fun zeroValue!436 () V!59325)

(declare-fun c!142691 () Bool)

(declare-fun call!70892 () ListLongMap!22303)

(declare-fun c!142692 () Bool)

(declare-fun minValue!436 () V!59325)

(declare-fun bm!70889 () Bool)

(declare-fun call!70894 () ListLongMap!22303)

(declare-fun call!70893 () ListLongMap!22303)

(declare-fun +!4988 (ListLongMap!22303 tuple2!24694) ListLongMap!22303)

(assert (=> bm!70889 (= call!70893 (+!4988 (ite c!142691 call!70892 (ite c!142692 call!70894 call!70895)) (ite (or c!142691 c!142692) (tuple2!24695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70890 () Bool)

(assert (=> bm!70890 (= call!70896 call!70893)))

(declare-fun b!1551015 () Bool)

(declare-fun e!863402 () Bool)

(assert (=> b!1551015 (= e!863402 (not true))))

(declare-datatypes ((array!103522 0))(
  ( (array!103523 (arr!49961 (Array (_ BitVec 32) (_ BitVec 64))) (size!50511 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103522)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!668494 () ListLongMap!22303)

(declare-fun apply!1093 (ListLongMap!22303 (_ BitVec 64)) V!59325)

(assert (=> b!1551015 (= (apply!1093 (+!4988 lt!668494 (tuple2!24695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49961 _keys!618) from!762)) (apply!1093 lt!668494 (select (arr!49961 _keys!618) from!762)))))

(declare-datatypes ((Unit!51658 0))(
  ( (Unit!51659) )
))
(declare-fun lt!668492 () Unit!51658)

(declare-fun addApplyDifferent!631 (ListLongMap!22303 (_ BitVec 64) V!59325 (_ BitVec 64)) Unit!51658)

(assert (=> b!1551015 (= lt!668492 (addApplyDifferent!631 lt!668494 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49961 _keys!618) from!762)))))

(declare-fun contains!10109 (ListLongMap!22303 (_ BitVec 64)) Bool)

(assert (=> b!1551015 (contains!10109 (+!4988 lt!668494 (tuple2!24695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49961 _keys!618) from!762))))

(declare-fun lt!668495 () Unit!51658)

(declare-fun addStillContains!1289 (ListLongMap!22303 (_ BitVec 64) V!59325 (_ BitVec 64)) Unit!51658)

(assert (=> b!1551015 (= lt!668495 (addStillContains!1289 lt!668494 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49961 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18170 0))(
  ( (ValueCellFull!18170 (v!21961 V!59325)) (EmptyCell!18170) )
))
(declare-datatypes ((array!103524 0))(
  ( (array!103525 (arr!49962 (Array (_ BitVec 32) ValueCell!18170)) (size!50512 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103524)

(declare-fun getCurrentListMapNoExtraKeys!6615 (array!103522 array!103524 (_ BitVec 32) (_ BitVec 32) V!59325 V!59325 (_ BitVec 32) Int) ListLongMap!22303)

(assert (=> b!1551015 (= lt!668494 (getCurrentListMapNoExtraKeys!6615 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58951 () Bool)

(declare-fun mapRes!58951 () Bool)

(assert (=> mapIsEmpty!58951 mapRes!58951))

(declare-fun b!1551016 () Bool)

(declare-fun e!863405 () Bool)

(declare-fun tp_is_empty!38161 () Bool)

(assert (=> b!1551016 (= e!863405 tp_is_empty!38161)))

(declare-fun b!1551017 () Bool)

(declare-fun res!1062244 () Bool)

(declare-fun e!863400 () Bool)

(assert (=> b!1551017 (=> (not res!1062244) (not e!863400))))

(declare-datatypes ((List!36173 0))(
  ( (Nil!36170) (Cons!36169 (h!37614 (_ BitVec 64)) (t!50883 List!36173)) )
))
(declare-fun arrayNoDuplicates!0 (array!103522 (_ BitVec 32) List!36173) Bool)

(assert (=> b!1551017 (= res!1062244 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36170))))

(declare-fun b!1551018 () Bool)

(declare-fun e!863398 () ListLongMap!22303)

(assert (=> b!1551018 (= e!863398 (+!4988 call!70893 (tuple2!24695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1062247 () Bool)

(assert (=> start!132210 (=> (not res!1062247) (not e!863400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132210 (= res!1062247 (validMask!0 mask!926))))

(assert (=> start!132210 e!863400))

(declare-fun array_inv!38843 (array!103522) Bool)

(assert (=> start!132210 (array_inv!38843 _keys!618)))

(assert (=> start!132210 tp_is_empty!38161))

(assert (=> start!132210 true))

(assert (=> start!132210 tp!111912))

(declare-fun e!863401 () Bool)

(declare-fun array_inv!38844 (array!103524) Bool)

(assert (=> start!132210 (and (array_inv!38844 _values!470) e!863401)))

(declare-fun mapNonEmpty!58951 () Bool)

(declare-fun tp!111913 () Bool)

(declare-fun e!863397 () Bool)

(assert (=> mapNonEmpty!58951 (= mapRes!58951 (and tp!111913 e!863397))))

(declare-fun mapRest!58951 () (Array (_ BitVec 32) ValueCell!18170))

(declare-fun mapKey!58951 () (_ BitVec 32))

(declare-fun mapValue!58951 () ValueCell!18170)

(assert (=> mapNonEmpty!58951 (= (arr!49962 _values!470) (store mapRest!58951 mapKey!58951 mapValue!58951))))

(declare-fun b!1551019 () Bool)

(declare-fun e!863404 () ListLongMap!22303)

(assert (=> b!1551019 (= e!863404 call!70895)))

(declare-fun b!1551020 () Bool)

(assert (=> b!1551020 (= e!863401 (and e!863405 mapRes!58951))))

(declare-fun condMapEmpty!58951 () Bool)

(declare-fun mapDefault!58951 () ValueCell!18170)

