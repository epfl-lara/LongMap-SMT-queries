; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131990 () Bool)

(assert start!131990)

(declare-fun b_free!31703 () Bool)

(declare-fun b_next!31703 () Bool)

(assert (=> start!131990 (= b_free!31703 (not b_next!31703))))

(declare-fun tp!111360 () Bool)

(declare-fun b_and!51113 () Bool)

(assert (=> start!131990 (= tp!111360 b_and!51113)))

(declare-fun mapNonEmpty!58672 () Bool)

(declare-fun mapRes!58672 () Bool)

(declare-fun tp!111361 () Bool)

(declare-fun e!860713 () Bool)

(assert (=> mapNonEmpty!58672 (= mapRes!58672 (and tp!111361 e!860713))))

(declare-datatypes ((V!59081 0))(
  ( (V!59082 (val!19067 Int)) )
))
(declare-datatypes ((ValueCell!18079 0))(
  ( (ValueCellFull!18079 (v!21868 V!59081)) (EmptyCell!18079) )
))
(declare-datatypes ((array!103164 0))(
  ( (array!103165 (arr!49784 (Array (_ BitVec 32) ValueCell!18079)) (size!50334 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103164)

(declare-fun mapRest!58672 () (Array (_ BitVec 32) ValueCell!18079))

(declare-fun mapKey!58672 () (_ BitVec 32))

(declare-fun mapValue!58672 () ValueCell!18079)

(assert (=> mapNonEmpty!58672 (= (arr!49784 _values!470) (store mapRest!58672 mapKey!58672 mapValue!58672))))

(declare-fun b!1546313 () Bool)

(declare-datatypes ((tuple2!24516 0))(
  ( (tuple2!24517 (_1!12269 (_ BitVec 64)) (_2!12269 V!59081)) )
))
(declare-datatypes ((List!36023 0))(
  ( (Nil!36020) (Cons!36019 (h!37464 tuple2!24516) (t!50717 List!36023)) )
))
(declare-datatypes ((ListLongMap!22125 0))(
  ( (ListLongMap!22126 (toList!11078 List!36023)) )
))
(declare-fun e!860720 () ListLongMap!22125)

(declare-fun call!69502 () ListLongMap!22125)

(assert (=> b!1546313 (= e!860720 call!69502)))

(declare-fun bm!69497 () Bool)

(declare-datatypes ((array!103166 0))(
  ( (array!103167 (arr!49785 (Array (_ BitVec 32) (_ BitVec 64))) (size!50335 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103166)

(declare-fun zeroValue!436 () V!59081)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59081)

(declare-fun call!69504 () ListLongMap!22125)

(declare-fun getCurrentListMapNoExtraKeys!6544 (array!103166 array!103164 (_ BitVec 32) (_ BitVec 32) V!59081 V!59081 (_ BitVec 32) Int) ListLongMap!22125)

(assert (=> bm!69497 (= call!69504 (getCurrentListMapNoExtraKeys!6544 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546314 () Bool)

(declare-fun e!860719 () ListLongMap!22125)

(assert (=> b!1546314 (= e!860719 call!69502)))

(declare-fun b!1546315 () Bool)

(declare-fun e!860721 () Bool)

(declare-fun tp_is_empty!37979 () Bool)

(assert (=> b!1546315 (= e!860721 tp_is_empty!37979)))

(declare-fun b!1546316 () Bool)

(declare-fun e!860715 () ListLongMap!22125)

(declare-fun call!69503 () ListLongMap!22125)

(declare-fun +!4913 (ListLongMap!22125 tuple2!24516) ListLongMap!22125)

(assert (=> b!1546316 (= e!860715 (+!4913 call!69503 (tuple2!24517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546317 () Bool)

(declare-fun res!1060189 () Bool)

(declare-fun e!860717 () Bool)

(assert (=> b!1546317 (=> (not res!1060189) (not e!860717))))

(declare-datatypes ((List!36024 0))(
  ( (Nil!36021) (Cons!36020 (h!37465 (_ BitVec 64)) (t!50718 List!36024)) )
))
(declare-fun arrayNoDuplicates!0 (array!103166 (_ BitVec 32) List!36024) Bool)

(assert (=> b!1546317 (= res!1060189 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36021))))

(declare-fun bm!69499 () Bool)

(declare-fun call!69501 () ListLongMap!22125)

(declare-fun call!69500 () ListLongMap!22125)

(assert (=> bm!69499 (= call!69501 call!69500)))

(declare-fun b!1546318 () Bool)

(declare-fun e!860716 () Bool)

(assert (=> b!1546318 (= e!860717 e!860716)))

(declare-fun res!1060192 () Bool)

(assert (=> b!1546318 (=> (not res!1060192) (not e!860716))))

(assert (=> b!1546318 (= res!1060192 (bvslt from!762 (size!50335 _keys!618)))))

(declare-fun lt!666536 () ListLongMap!22125)

(assert (=> b!1546318 (= lt!666536 e!860715)))

(declare-fun c!141792 () Bool)

(declare-fun lt!666533 () Bool)

(assert (=> b!1546318 (= c!141792 (and (not lt!666533) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546318 (= lt!666533 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546319 () Bool)

(assert (=> b!1546319 (= e!860715 e!860720)))

(declare-fun c!141793 () Bool)

(assert (=> b!1546319 (= c!141793 (and (not lt!666533) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58672 () Bool)

(assert (=> mapIsEmpty!58672 mapRes!58672))

(declare-fun bm!69500 () Bool)

(assert (=> bm!69500 (= call!69503 (+!4913 (ite c!141792 call!69504 (ite c!141793 call!69500 call!69501)) (ite (or c!141792 c!141793) (tuple2!24517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546320 () Bool)

(declare-fun e!860714 () Bool)

(assert (=> b!1546320 (= e!860714 (and e!860721 mapRes!58672))))

(declare-fun condMapEmpty!58672 () Bool)

(declare-fun mapDefault!58672 () ValueCell!18079)

