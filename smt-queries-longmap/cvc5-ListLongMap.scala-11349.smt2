; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131998 () Bool)

(assert start!131998)

(declare-fun b_free!31711 () Bool)

(declare-fun b_next!31711 () Bool)

(assert (=> start!131998 (= b_free!31711 (not b_next!31711))))

(declare-fun tp!111385 () Bool)

(declare-fun b_and!51121 () Bool)

(assert (=> start!131998 (= tp!111385 b_and!51121)))

(declare-fun b!1546505 () Bool)

(declare-fun res!1060273 () Bool)

(declare-fun e!860827 () Bool)

(assert (=> b!1546505 (=> (not res!1060273) (not e!860827))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103180 0))(
  ( (array!103181 (arr!49792 (Array (_ BitVec 32) (_ BitVec 64))) (size!50342 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103180)

(assert (=> b!1546505 (= res!1060273 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50342 _keys!618))))))

(declare-fun mapIsEmpty!58684 () Bool)

(declare-fun mapRes!58684 () Bool)

(assert (=> mapIsEmpty!58684 mapRes!58684))

(declare-fun b!1546506 () Bool)

(declare-fun res!1060274 () Bool)

(assert (=> b!1546506 (=> (not res!1060274) (not e!860827))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103180 (_ BitVec 32)) Bool)

(assert (=> b!1546506 (= res!1060274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546507 () Bool)

(declare-datatypes ((V!59093 0))(
  ( (V!59094 (val!19071 Int)) )
))
(declare-datatypes ((tuple2!24524 0))(
  ( (tuple2!24525 (_1!12273 (_ BitVec 64)) (_2!12273 V!59093)) )
))
(declare-datatypes ((List!36030 0))(
  ( (Nil!36027) (Cons!36026 (h!37471 tuple2!24524) (t!50724 List!36030)) )
))
(declare-datatypes ((ListLongMap!22133 0))(
  ( (ListLongMap!22134 (toList!11082 List!36030)) )
))
(declare-fun e!860824 () ListLongMap!22133)

(declare-fun call!69560 () ListLongMap!22133)

(assert (=> b!1546507 (= e!860824 call!69560)))

(declare-fun b!1546508 () Bool)

(declare-fun e!860825 () ListLongMap!22133)

(assert (=> b!1546508 (= e!860825 call!69560)))

(declare-fun b!1546509 () Bool)

(declare-fun res!1060276 () Bool)

(declare-fun e!860823 () Bool)

(assert (=> b!1546509 (=> (not res!1060276) (not e!860823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546509 (= res!1060276 (validKeyInArray!0 (select (arr!49792 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58684 () Bool)

(declare-fun tp!111384 () Bool)

(declare-fun e!860822 () Bool)

(assert (=> mapNonEmpty!58684 (= mapRes!58684 (and tp!111384 e!860822))))

(declare-fun mapKey!58684 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18083 0))(
  ( (ValueCellFull!18083 (v!21872 V!59093)) (EmptyCell!18083) )
))
(declare-fun mapRest!58684 () (Array (_ BitVec 32) ValueCell!18083))

(declare-datatypes ((array!103182 0))(
  ( (array!103183 (arr!49793 (Array (_ BitVec 32) ValueCell!18083)) (size!50343 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103182)

(declare-fun mapValue!58684 () ValueCell!18083)

(assert (=> mapNonEmpty!58684 (= (arr!49793 _values!470) (store mapRest!58684 mapKey!58684 mapValue!58684))))

(declare-fun res!1060277 () Bool)

(assert (=> start!131998 (=> (not res!1060277) (not e!860827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131998 (= res!1060277 (validMask!0 mask!926))))

(assert (=> start!131998 e!860827))

(declare-fun array_inv!38727 (array!103180) Bool)

(assert (=> start!131998 (array_inv!38727 _keys!618)))

(declare-fun tp_is_empty!37987 () Bool)

(assert (=> start!131998 tp_is_empty!37987))

(assert (=> start!131998 true))

(assert (=> start!131998 tp!111385))

(declare-fun e!860821 () Bool)

(declare-fun array_inv!38728 (array!103182) Bool)

(assert (=> start!131998 (and (array_inv!38728 _values!470) e!860821)))

(declare-fun bm!69557 () Bool)

(declare-fun call!69562 () ListLongMap!22133)

(declare-fun call!69563 () ListLongMap!22133)

(assert (=> bm!69557 (= call!69562 call!69563)))

(declare-fun b!1546510 () Bool)

(declare-fun call!69561 () ListLongMap!22133)

(assert (=> b!1546510 (= e!860825 call!69561)))

(declare-fun zeroValue!436 () V!59093)

(declare-fun call!69564 () ListLongMap!22133)

(declare-fun bm!69558 () Bool)

(declare-fun minValue!436 () V!59093)

(declare-fun c!141828 () Bool)

(declare-fun c!141830 () Bool)

(declare-fun +!4916 (ListLongMap!22133 tuple2!24524) ListLongMap!22133)

(assert (=> bm!69558 (= call!69564 (+!4916 (ite c!141830 call!69563 (ite c!141828 call!69562 call!69561)) (ite (or c!141830 c!141828) (tuple2!24525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546511 () Bool)

(declare-fun e!860826 () Bool)

(assert (=> b!1546511 (= e!860821 (and e!860826 mapRes!58684))))

(declare-fun condMapEmpty!58684 () Bool)

(declare-fun mapDefault!58684 () ValueCell!18083)

