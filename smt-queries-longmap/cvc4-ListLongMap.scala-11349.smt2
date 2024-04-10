; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132002 () Bool)

(assert start!132002)

(declare-fun b_free!31715 () Bool)

(declare-fun b_next!31715 () Bool)

(assert (=> start!132002 (= b_free!31715 (not b_next!31715))))

(declare-fun tp!111397 () Bool)

(declare-fun b_and!51125 () Bool)

(assert (=> start!132002 (= tp!111397 b_and!51125)))

(declare-fun b!1546601 () Bool)

(declare-datatypes ((V!59097 0))(
  ( (V!59098 (val!19073 Int)) )
))
(declare-datatypes ((tuple2!24528 0))(
  ( (tuple2!24529 (_1!12275 (_ BitVec 64)) (_2!12275 V!59097)) )
))
(declare-datatypes ((List!36033 0))(
  ( (Nil!36030) (Cons!36029 (h!37474 tuple2!24528) (t!50727 List!36033)) )
))
(declare-datatypes ((ListLongMap!22137 0))(
  ( (ListLongMap!22138 (toList!11084 List!36033)) )
))
(declare-fun e!860875 () ListLongMap!22137)

(declare-fun e!860877 () ListLongMap!22137)

(assert (=> b!1546601 (= e!860875 e!860877)))

(declare-fun c!141847 () Bool)

(declare-fun lt!666615 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546601 (= c!141847 (and (not lt!666615) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69587 () Bool)

(declare-fun c!141848 () Bool)

(declare-fun call!69593 () ListLongMap!22137)

(declare-fun zeroValue!436 () V!59097)

(declare-fun minValue!436 () V!59097)

(declare-fun call!69594 () ListLongMap!22137)

(declare-fun call!69592 () ListLongMap!22137)

(declare-fun call!69591 () ListLongMap!22137)

(declare-fun +!4918 (ListLongMap!22137 tuple2!24528) ListLongMap!22137)

(assert (=> bm!69587 (= call!69592 (+!4918 (ite c!141848 call!69593 (ite c!141847 call!69591 call!69594)) (ite (or c!141848 c!141847) (tuple2!24529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapNonEmpty!58690 () Bool)

(declare-fun mapRes!58690 () Bool)

(declare-fun tp!111396 () Bool)

(declare-fun e!860883 () Bool)

(assert (=> mapNonEmpty!58690 (= mapRes!58690 (and tp!111396 e!860883))))

(declare-fun mapKey!58690 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18085 0))(
  ( (ValueCellFull!18085 (v!21874 V!59097)) (EmptyCell!18085) )
))
(declare-fun mapRest!58690 () (Array (_ BitVec 32) ValueCell!18085))

(declare-datatypes ((array!103188 0))(
  ( (array!103189 (arr!49796 (Array (_ BitVec 32) ValueCell!18085)) (size!50346 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103188)

(declare-fun mapValue!58690 () ValueCell!18085)

(assert (=> mapNonEmpty!58690 (= (arr!49796 _values!470) (store mapRest!58690 mapKey!58690 mapValue!58690))))

(declare-fun b!1546602 () Bool)

(declare-fun e!860876 () ListLongMap!22137)

(declare-fun call!69590 () ListLongMap!22137)

(assert (=> b!1546602 (= e!860876 call!69590)))

(declare-fun b!1546603 () Bool)

(declare-fun c!141846 () Bool)

(assert (=> b!1546603 (= c!141846 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666615))))

(assert (=> b!1546603 (= e!860877 e!860876)))

(declare-fun mapIsEmpty!58690 () Bool)

(assert (=> mapIsEmpty!58690 mapRes!58690))

(declare-fun res!1060318 () Bool)

(declare-fun e!860878 () Bool)

(assert (=> start!132002 (=> (not res!1060318) (not e!860878))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132002 (= res!1060318 (validMask!0 mask!926))))

(assert (=> start!132002 e!860878))

(declare-datatypes ((array!103190 0))(
  ( (array!103191 (arr!49797 (Array (_ BitVec 32) (_ BitVec 64))) (size!50347 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103190)

(declare-fun array_inv!38731 (array!103190) Bool)

(assert (=> start!132002 (array_inv!38731 _keys!618)))

(declare-fun tp_is_empty!37991 () Bool)

(assert (=> start!132002 tp_is_empty!37991))

(assert (=> start!132002 true))

(assert (=> start!132002 tp!111397))

(declare-fun e!860882 () Bool)

(declare-fun array_inv!38732 (array!103188) Bool)

(assert (=> start!132002 (and (array_inv!38732 _values!470) e!860882)))

(declare-fun b!1546604 () Bool)

(declare-fun e!860880 () Bool)

(assert (=> b!1546604 (= e!860882 (and e!860880 mapRes!58690))))

(declare-fun condMapEmpty!58690 () Bool)

(declare-fun mapDefault!58690 () ValueCell!18085)

