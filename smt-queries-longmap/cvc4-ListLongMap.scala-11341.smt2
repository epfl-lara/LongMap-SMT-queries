; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131954 () Bool)

(assert start!131954)

(declare-fun b_free!31667 () Bool)

(declare-fun b_next!31667 () Bool)

(assert (=> start!131954 (= b_free!31667 (not b_next!31667))))

(declare-fun tp!111253 () Bool)

(declare-fun b_and!51077 () Bool)

(assert (=> start!131954 (= tp!111253 b_and!51077)))

(declare-fun bm!69227 () Bool)

(declare-datatypes ((V!59033 0))(
  ( (V!59034 (val!19049 Int)) )
))
(declare-datatypes ((tuple2!24480 0))(
  ( (tuple2!24481 (_1!12251 (_ BitVec 64)) (_2!12251 V!59033)) )
))
(declare-datatypes ((List!35991 0))(
  ( (Nil!35988) (Cons!35987 (h!37432 tuple2!24480) (t!50685 List!35991)) )
))
(declare-datatypes ((ListLongMap!22089 0))(
  ( (ListLongMap!22090 (toList!11060 List!35991)) )
))
(declare-fun call!69230 () ListLongMap!22089)

(declare-fun call!69231 () ListLongMap!22089)

(assert (=> bm!69227 (= call!69230 call!69231)))

(declare-fun b!1545449 () Bool)

(declare-fun e!860228 () Bool)

(assert (=> b!1545449 (= e!860228 (not true))))

(declare-datatypes ((array!103092 0))(
  ( (array!103093 (arr!49748 (Array (_ BitVec 32) (_ BitVec 64))) (size!50298 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103092)

(declare-fun zeroValue!436 () V!59033)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666319 () ListLongMap!22089)

(declare-fun contains!10031 (ListLongMap!22089 (_ BitVec 64)) Bool)

(declare-fun +!4896 (ListLongMap!22089 tuple2!24480) ListLongMap!22089)

(assert (=> b!1545449 (contains!10031 (+!4896 lt!666319 (tuple2!24481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49748 _keys!618) from!762))))

(declare-datatypes ((Unit!51498 0))(
  ( (Unit!51499) )
))
(declare-fun lt!666318 () Unit!51498)

(declare-fun addStillContains!1219 (ListLongMap!22089 (_ BitVec 64) V!59033 (_ BitVec 64)) Unit!51498)

(assert (=> b!1545449 (= lt!666318 (addStillContains!1219 lt!666319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49748 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59033)

(declare-datatypes ((ValueCell!18061 0))(
  ( (ValueCellFull!18061 (v!21850 V!59033)) (EmptyCell!18061) )
))
(declare-datatypes ((array!103094 0))(
  ( (array!103095 (arr!49749 (Array (_ BitVec 32) ValueCell!18061)) (size!50299 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103094)

(declare-fun getCurrentListMapNoExtraKeys!6529 (array!103092 array!103094 (_ BitVec 32) (_ BitVec 32) V!59033 V!59033 (_ BitVec 32) Int) ListLongMap!22089)

(assert (=> b!1545449 (= lt!666319 (getCurrentListMapNoExtraKeys!6529 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58618 () Bool)

(declare-fun mapRes!58618 () Bool)

(assert (=> mapIsEmpty!58618 mapRes!58618))

(declare-fun b!1545450 () Bool)

(declare-fun e!860230 () ListLongMap!22089)

(assert (=> b!1545450 (= e!860230 call!69230)))

(declare-fun bm!69228 () Bool)

(declare-fun call!69233 () ListLongMap!22089)

(assert (=> bm!69228 (= call!69231 call!69233)))

(declare-fun b!1545451 () Bool)

(declare-fun e!860233 () Bool)

(declare-fun tp_is_empty!37943 () Bool)

(assert (=> b!1545451 (= e!860233 tp_is_empty!37943)))

(declare-fun mapNonEmpty!58618 () Bool)

(declare-fun tp!111252 () Bool)

(declare-fun e!860227 () Bool)

(assert (=> mapNonEmpty!58618 (= mapRes!58618 (and tp!111252 e!860227))))

(declare-fun mapRest!58618 () (Array (_ BitVec 32) ValueCell!18061))

(declare-fun mapKey!58618 () (_ BitVec 32))

(declare-fun mapValue!58618 () ValueCell!18061)

(assert (=> mapNonEmpty!58618 (= (arr!49749 _values!470) (store mapRest!58618 mapKey!58618 mapValue!58618))))

(declare-fun bm!69229 () Bool)

(declare-fun c!141631 () Bool)

(declare-fun call!69232 () ListLongMap!22089)

(declare-fun c!141632 () Bool)

(assert (=> bm!69229 (= call!69232 (+!4896 (ite c!141631 call!69233 (ite c!141632 call!69231 call!69230)) (ite (or c!141631 c!141632) (tuple2!24481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69230 () Bool)

(declare-fun call!69234 () ListLongMap!22089)

(assert (=> bm!69230 (= call!69234 call!69232)))

(declare-fun b!1545453 () Bool)

(declare-fun e!860229 () Bool)

(assert (=> b!1545453 (= e!860229 (and e!860233 mapRes!58618))))

(declare-fun condMapEmpty!58618 () Bool)

(declare-fun mapDefault!58618 () ValueCell!18061)

