; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132124 () Bool)

(assert start!132124)

(declare-fun b_free!31837 () Bool)

(declare-fun b_next!31837 () Bool)

(assert (=> start!132124 (= b_free!31837 (not b_next!31837))))

(declare-fun tp!111762 () Bool)

(declare-fun b_and!51247 () Bool)

(assert (=> start!132124 (= tp!111762 b_and!51247)))

(declare-fun b!1549533 () Bool)

(declare-fun res!1061595 () Bool)

(declare-fun e!862533 () Bool)

(assert (=> b!1549533 (=> (not res!1061595) (not e!862533))))

(declare-datatypes ((array!103422 0))(
  ( (array!103423 (arr!49913 (Array (_ BitVec 32) (_ BitVec 64))) (size!50463 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103422)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103422 (_ BitVec 32)) Bool)

(assert (=> b!1549533 (= res!1061595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549534 () Bool)

(declare-datatypes ((Unit!51616 0))(
  ( (Unit!51617) )
))
(declare-fun e!862528 () Unit!51616)

(declare-fun Unit!51618 () Unit!51616)

(assert (=> b!1549534 (= e!862528 Unit!51618)))

(declare-fun b!1549535 () Bool)

(declare-fun e!862527 () Bool)

(assert (=> b!1549535 (= e!862533 e!862527)))

(declare-fun res!1061598 () Bool)

(assert (=> b!1549535 (=> (not res!1061598) (not e!862527))))

(declare-fun lt!667922 () Bool)

(assert (=> b!1549535 (= res!1061598 (not lt!667922))))

(declare-fun lt!667928 () Unit!51616)

(assert (=> b!1549535 (= lt!667928 e!862528)))

(declare-fun c!142400 () Bool)

(assert (=> b!1549535 (= c!142400 (not lt!667922))))

(declare-fun e!862529 () Bool)

(assert (=> b!1549535 (= lt!667922 e!862529)))

(declare-fun res!1061597 () Bool)

(assert (=> b!1549535 (=> res!1061597 e!862529)))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1549535 (= res!1061597 (bvsge from!762 (size!50463 _keys!618)))))

(declare-datatypes ((V!59261 0))(
  ( (V!59262 (val!19134 Int)) )
))
(declare-datatypes ((tuple2!24646 0))(
  ( (tuple2!24647 (_1!12334 (_ BitVec 64)) (_2!12334 V!59261)) )
))
(declare-datatypes ((List!36130 0))(
  ( (Nil!36127) (Cons!36126 (h!37571 tuple2!24646) (t!50824 List!36130)) )
))
(declare-datatypes ((ListLongMap!22255 0))(
  ( (ListLongMap!22256 (toList!11143 List!36130)) )
))
(declare-fun lt!667923 () ListLongMap!22255)

(declare-fun e!862526 () ListLongMap!22255)

(assert (=> b!1549535 (= lt!667923 e!862526)))

(declare-fun c!142398 () Bool)

(declare-fun lt!667921 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549535 (= c!142398 (and (not lt!667921) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549535 (= lt!667921 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70503 () Bool)

(declare-fun call!70506 () ListLongMap!22255)

(declare-fun call!70508 () ListLongMap!22255)

(assert (=> bm!70503 (= call!70506 call!70508)))

(declare-fun mapIsEmpty!58873 () Bool)

(declare-fun mapRes!58873 () Bool)

(assert (=> mapIsEmpty!58873 mapRes!58873))

(declare-fun b!1549536 () Bool)

(declare-fun res!1061601 () Bool)

(assert (=> b!1549536 (=> (not res!1061601) (not e!862533))))

(declare-datatypes ((List!36131 0))(
  ( (Nil!36128) (Cons!36127 (h!37572 (_ BitVec 64)) (t!50825 List!36131)) )
))
(declare-fun arrayNoDuplicates!0 (array!103422 (_ BitVec 32) List!36131) Bool)

(assert (=> b!1549536 (= res!1061601 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36128))))

(declare-fun mapNonEmpty!58873 () Bool)

(declare-fun tp!111763 () Bool)

(declare-fun e!862536 () Bool)

(assert (=> mapNonEmpty!58873 (= mapRes!58873 (and tp!111763 e!862536))))

(declare-fun mapKey!58873 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18146 0))(
  ( (ValueCellFull!18146 (v!21935 V!59261)) (EmptyCell!18146) )
))
(declare-datatypes ((array!103424 0))(
  ( (array!103425 (arr!49914 (Array (_ BitVec 32) ValueCell!18146)) (size!50464 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103424)

(declare-fun mapRest!58873 () (Array (_ BitVec 32) ValueCell!18146))

(declare-fun mapValue!58873 () ValueCell!18146)

(assert (=> mapNonEmpty!58873 (= (arr!49914 _values!470) (store mapRest!58873 mapKey!58873 mapValue!58873))))

(declare-fun bm!70504 () Bool)

(declare-fun call!70509 () ListLongMap!22255)

(declare-fun call!70507 () ListLongMap!22255)

(assert (=> bm!70504 (= call!70509 call!70507)))

(declare-fun b!1549537 () Bool)

(declare-fun c!142397 () Bool)

(assert (=> b!1549537 (= c!142397 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667921))))

(declare-fun e!862532 () ListLongMap!22255)

(declare-fun e!862535 () ListLongMap!22255)

(assert (=> b!1549537 (= e!862532 e!862535)))

(declare-fun b!1549538 () Bool)

(assert (=> b!1549538 (= e!862526 e!862532)))

(declare-fun c!142399 () Bool)

(assert (=> b!1549538 (= c!142399 (and (not lt!667921) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1061600 () Bool)

(assert (=> start!132124 (=> (not res!1061600) (not e!862533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132124 (= res!1061600 (validMask!0 mask!926))))

(assert (=> start!132124 e!862533))

(declare-fun array_inv!38803 (array!103422) Bool)

(assert (=> start!132124 (array_inv!38803 _keys!618)))

(declare-fun tp_is_empty!38113 () Bool)

(assert (=> start!132124 tp_is_empty!38113))

(assert (=> start!132124 true))

(assert (=> start!132124 tp!111762))

(declare-fun e!862530 () Bool)

(declare-fun array_inv!38804 (array!103424) Bool)

(assert (=> start!132124 (and (array_inv!38804 _values!470) e!862530)))

(declare-fun zeroValue!436 () V!59261)

(declare-fun bm!70502 () Bool)

(declare-fun call!70505 () ListLongMap!22255)

(declare-fun minValue!436 () V!59261)

(declare-fun +!4969 (ListLongMap!22255 tuple2!24646) ListLongMap!22255)

(assert (=> bm!70502 (= call!70507 (+!4969 (ite c!142398 call!70508 (ite c!142399 call!70506 call!70505)) (ite (or c!142398 c!142399) (tuple2!24647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549539 () Bool)

(assert (=> b!1549539 (= e!862535 call!70505)))

(declare-fun b!1549540 () Bool)

(assert (=> b!1549540 (= e!862526 (+!4969 call!70507 (tuple2!24647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549541 () Bool)

(declare-fun e!862531 () Bool)

(assert (=> b!1549541 (= e!862531 tp_is_empty!38113)))

(declare-fun b!1549542 () Bool)

(assert (=> b!1549542 (= e!862530 (and e!862531 mapRes!58873))))

(declare-fun condMapEmpty!58873 () Bool)

(declare-fun mapDefault!58873 () ValueCell!18146)

