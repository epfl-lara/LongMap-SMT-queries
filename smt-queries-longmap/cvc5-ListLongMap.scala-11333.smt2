; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131902 () Bool)

(assert start!131902)

(declare-fun b_free!31615 () Bool)

(declare-fun b_next!31615 () Bool)

(assert (=> start!131902 (= b_free!31615 (not b_next!31615))))

(declare-fun tp!111097 () Bool)

(declare-fun b_and!51025 () Bool)

(assert (=> start!131902 (= tp!111097 b_and!51025)))

(declare-fun b!1544305 () Bool)

(declare-fun e!859580 () Bool)

(declare-fun tp_is_empty!37891 () Bool)

(assert (=> b!1544305 (= e!859580 tp_is_empty!37891)))

(declare-datatypes ((array!102996 0))(
  ( (array!102997 (arr!49700 (Array (_ BitVec 32) (_ BitVec 64))) (size!50250 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102996)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58965 0))(
  ( (V!58966 (val!19023 Int)) )
))
(declare-datatypes ((ValueCell!18035 0))(
  ( (ValueCellFull!18035 (v!21824 V!58965)) (EmptyCell!18035) )
))
(declare-datatypes ((array!102998 0))(
  ( (array!102999 (arr!49701 (Array (_ BitVec 32) ValueCell!18035)) (size!50251 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102998)

(declare-fun bm!68837 () Bool)

(declare-fun minValue!436 () V!58965)

(declare-datatypes ((tuple2!24436 0))(
  ( (tuple2!24437 (_1!12229 (_ BitVec 64)) (_2!12229 V!58965)) )
))
(declare-datatypes ((List!35952 0))(
  ( (Nil!35949) (Cons!35948 (h!37393 tuple2!24436) (t!50646 List!35952)) )
))
(declare-datatypes ((ListLongMap!22045 0))(
  ( (ListLongMap!22046 (toList!11038 List!35952)) )
))
(declare-fun call!68841 () ListLongMap!22045)

(declare-fun zeroValue!436 () V!58965)

(declare-fun getCurrentListMapNoExtraKeys!6510 (array!102996 array!102998 (_ BitVec 32) (_ BitVec 32) V!58965 V!58965 (_ BitVec 32) Int) ListLongMap!22045)

(assert (=> bm!68837 (= call!68841 (getCurrentListMapNoExtraKeys!6510 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun c!141398 () Bool)

(declare-fun call!68840 () ListLongMap!22045)

(declare-fun c!141396 () Bool)

(declare-fun bm!68838 () Bool)

(declare-fun call!68844 () ListLongMap!22045)

(declare-fun call!68842 () ListLongMap!22045)

(declare-fun +!4876 (ListLongMap!22045 tuple2!24436) ListLongMap!22045)

(assert (=> bm!68838 (= call!68844 (+!4876 (ite c!141396 call!68841 (ite c!141398 call!68842 call!68840)) (ite (or c!141396 c!141398) (tuple2!24437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24437 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544307 () Bool)

(declare-fun e!859577 () ListLongMap!22045)

(declare-fun e!859578 () ListLongMap!22045)

(assert (=> b!1544307 (= e!859577 e!859578)))

(declare-fun lt!666119 () Bool)

(assert (=> b!1544307 (= c!141398 (and (not lt!666119) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58540 () Bool)

(declare-fun mapRes!58540 () Bool)

(declare-fun tp!111096 () Bool)

(declare-fun e!859584 () Bool)

(assert (=> mapNonEmpty!58540 (= mapRes!58540 (and tp!111096 e!859584))))

(declare-fun mapKey!58540 () (_ BitVec 32))

(declare-fun mapValue!58540 () ValueCell!18035)

(declare-fun mapRest!58540 () (Array (_ BitVec 32) ValueCell!18035))

(assert (=> mapNonEmpty!58540 (= (arr!49701 _values!470) (store mapRest!58540 mapKey!58540 mapValue!58540))))

(declare-fun mapIsEmpty!58540 () Bool)

(assert (=> mapIsEmpty!58540 mapRes!58540))

(declare-fun b!1544308 () Bool)

(declare-fun res!1059369 () Bool)

(declare-fun e!859582 () Bool)

(assert (=> b!1544308 (=> (not res!1059369) (not e!859582))))

(declare-datatypes ((List!35953 0))(
  ( (Nil!35950) (Cons!35949 (h!37394 (_ BitVec 64)) (t!50647 List!35953)) )
))
(declare-fun arrayNoDuplicates!0 (array!102996 (_ BitVec 32) List!35953) Bool)

(assert (=> b!1544308 (= res!1059369 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35950))))

(declare-fun b!1544309 () Bool)

(declare-fun e!859579 () ListLongMap!22045)

(declare-fun call!68843 () ListLongMap!22045)

(assert (=> b!1544309 (= e!859579 call!68843)))

(declare-fun b!1544310 () Bool)

(declare-fun e!859581 () Bool)

(assert (=> b!1544310 (= e!859581 (and e!859580 mapRes!58540))))

(declare-fun condMapEmpty!58540 () Bool)

(declare-fun mapDefault!58540 () ValueCell!18035)

