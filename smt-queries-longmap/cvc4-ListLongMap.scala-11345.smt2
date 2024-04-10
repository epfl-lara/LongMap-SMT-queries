; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131978 () Bool)

(assert start!131978)

(declare-fun b_free!31691 () Bool)

(declare-fun b_next!31691 () Bool)

(assert (=> start!131978 (= b_free!31691 (not b_next!31691))))

(declare-fun tp!111325 () Bool)

(declare-fun b_and!51101 () Bool)

(assert (=> start!131978 (= tp!111325 b_and!51101)))

(declare-fun b!1546025 () Bool)

(declare-fun e!860559 () Bool)

(declare-fun e!860554 () Bool)

(assert (=> b!1546025 (= e!860559 e!860554)))

(declare-fun res!1060065 () Bool)

(assert (=> b!1546025 (=> (not res!1060065) (not e!860554))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103140 0))(
  ( (array!103141 (arr!49772 (Array (_ BitVec 32) (_ BitVec 64))) (size!50322 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103140)

(assert (=> b!1546025 (= res!1060065 (bvslt from!762 (size!50322 _keys!618)))))

(declare-datatypes ((V!59065 0))(
  ( (V!59066 (val!19061 Int)) )
))
(declare-datatypes ((tuple2!24504 0))(
  ( (tuple2!24505 (_1!12263 (_ BitVec 64)) (_2!12263 V!59065)) )
))
(declare-datatypes ((List!36012 0))(
  ( (Nil!36009) (Cons!36008 (h!37453 tuple2!24504) (t!50706 List!36012)) )
))
(declare-datatypes ((ListLongMap!22113 0))(
  ( (ListLongMap!22114 (toList!11072 List!36012)) )
))
(declare-fun lt!666462 () ListLongMap!22113)

(declare-fun e!860551 () ListLongMap!22113)

(assert (=> b!1546025 (= lt!666462 e!860551)))

(declare-fun c!141739 () Bool)

(declare-fun lt!666461 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546025 (= c!141739 (and (not lt!666461) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546025 (= lt!666461 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546026 () Bool)

(declare-fun res!1060062 () Bool)

(assert (=> b!1546026 (=> (not res!1060062) (not e!860559))))

(declare-datatypes ((List!36013 0))(
  ( (Nil!36010) (Cons!36009 (h!37454 (_ BitVec 64)) (t!50707 List!36013)) )
))
(declare-fun arrayNoDuplicates!0 (array!103140 (_ BitVec 32) List!36013) Bool)

(assert (=> b!1546026 (= res!1060062 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36010))))

(declare-fun res!1060066 () Bool)

(assert (=> start!131978 (=> (not res!1060066) (not e!860559))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131978 (= res!1060066 (validMask!0 mask!926))))

(assert (=> start!131978 e!860559))

(declare-fun array_inv!38711 (array!103140) Bool)

(assert (=> start!131978 (array_inv!38711 _keys!618)))

(declare-fun tp_is_empty!37967 () Bool)

(assert (=> start!131978 tp_is_empty!37967))

(assert (=> start!131978 true))

(assert (=> start!131978 tp!111325))

(declare-datatypes ((ValueCell!18073 0))(
  ( (ValueCellFull!18073 (v!21862 V!59065)) (EmptyCell!18073) )
))
(declare-datatypes ((array!103142 0))(
  ( (array!103143 (arr!49773 (Array (_ BitVec 32) ValueCell!18073)) (size!50323 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103142)

(declare-fun e!860557 () Bool)

(declare-fun array_inv!38712 (array!103142) Bool)

(assert (=> start!131978 (and (array_inv!38712 _values!470) e!860557)))

(declare-fun zeroValue!436 () V!59065)

(declare-fun bm!69407 () Bool)

(declare-fun call!69412 () ListLongMap!22113)

(declare-fun call!69414 () ListLongMap!22113)

(declare-fun minValue!436 () V!59065)

(declare-fun call!69411 () ListLongMap!22113)

(declare-fun call!69413 () ListLongMap!22113)

(declare-fun c!141740 () Bool)

(declare-fun +!4907 (ListLongMap!22113 tuple2!24504) ListLongMap!22113)

(assert (=> bm!69407 (= call!69414 (+!4907 (ite c!141739 call!69411 (ite c!141740 call!69412 call!69413)) (ite (or c!141739 c!141740) (tuple2!24505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546027 () Bool)

(declare-fun e!860552 () ListLongMap!22113)

(assert (=> b!1546027 (= e!860552 call!69413)))

(declare-fun b!1546028 () Bool)

(declare-fun res!1060068 () Bool)

(assert (=> b!1546028 (=> (not res!1060068) (not e!860559))))

(assert (=> b!1546028 (= res!1060068 (and (= (size!50323 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50322 _keys!618) (size!50323 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546029 () Bool)

(declare-fun e!860553 () ListLongMap!22113)

(declare-fun call!69410 () ListLongMap!22113)

(assert (=> b!1546029 (= e!860553 call!69410)))

(declare-fun b!1546030 () Bool)

(assert (=> b!1546030 (= e!860552 call!69410)))

(declare-fun b!1546031 () Bool)

(declare-fun res!1060064 () Bool)

(assert (=> b!1546031 (=> (not res!1060064) (not e!860559))))

(assert (=> b!1546031 (= res!1060064 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50322 _keys!618))))))

(declare-fun b!1546032 () Bool)

(declare-fun c!141738 () Bool)

(assert (=> b!1546032 (= c!141738 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666461))))

(assert (=> b!1546032 (= e!860553 e!860552)))

(declare-fun bm!69408 () Bool)

(assert (=> bm!69408 (= call!69412 call!69411)))

(declare-fun b!1546033 () Bool)

(declare-fun res!1060067 () Bool)

(assert (=> b!1546033 (=> (not res!1060067) (not e!860554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546033 (= res!1060067 (validKeyInArray!0 (select (arr!49772 _keys!618) from!762)))))

(declare-fun bm!69409 () Bool)

(assert (=> bm!69409 (= call!69413 call!69412)))

(declare-fun b!1546034 () Bool)

(declare-fun e!860555 () Bool)

(assert (=> b!1546034 (= e!860555 tp_is_empty!37967)))

(declare-fun b!1546035 () Bool)

(declare-fun e!860556 () Bool)

(declare-fun mapRes!58654 () Bool)

(assert (=> b!1546035 (= e!860557 (and e!860556 mapRes!58654))))

(declare-fun condMapEmpty!58654 () Bool)

(declare-fun mapDefault!58654 () ValueCell!18073)

