; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132310 () Bool)

(assert start!132310)

(declare-fun b_free!31937 () Bool)

(declare-fun b_next!31937 () Bool)

(assert (=> start!132310 (= b_free!31937 (not b_next!31937))))

(declare-fun tp!112074 () Bool)

(declare-fun b_and!51379 () Bool)

(assert (=> start!132310 (= tp!112074 b_and!51379)))

(declare-fun b!1552640 () Bool)

(declare-fun e!864366 () Bool)

(declare-fun tp_is_empty!38213 () Bool)

(assert (=> b!1552640 (= e!864366 tp_is_empty!38213)))

(declare-fun b!1552641 () Bool)

(declare-fun e!864372 () Bool)

(declare-datatypes ((V!59393 0))(
  ( (V!59394 (val!19184 Int)) )
))
(declare-datatypes ((tuple2!24744 0))(
  ( (tuple2!24745 (_1!12383 (_ BitVec 64)) (_2!12383 V!59393)) )
))
(declare-datatypes ((List!36218 0))(
  ( (Nil!36215) (Cons!36214 (h!37659 tuple2!24744) (t!50938 List!36218)) )
))
(declare-datatypes ((ListLongMap!22353 0))(
  ( (ListLongMap!22354 (toList!11192 List!36218)) )
))
(declare-fun lt!669364 () ListLongMap!22353)

(declare-fun minValue!436 () V!59393)

(declare-fun apply!1112 (ListLongMap!22353 (_ BitVec 64)) V!59393)

(assert (=> b!1552641 (= e!864372 (not (= (apply!1112 lt!669364 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!436)))))

(declare-fun b!1552642 () Bool)

(declare-fun e!864375 () Bool)

(declare-fun e!864379 () Bool)

(assert (=> b!1552642 (= e!864375 e!864379)))

(declare-fun c!143028 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552642 (= c!143028 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552643 () Bool)

(declare-fun res!1062931 () Bool)

(assert (=> b!1552643 (=> res!1062931 e!864375)))

(declare-fun e!864371 () Bool)

(assert (=> b!1552643 (= res!1062931 e!864371)))

(declare-fun c!143032 () Bool)

(declare-fun lt!669363 () Bool)

(assert (=> b!1552643 (= c!143032 (not lt!669363))))

(declare-fun bm!71313 () Bool)

(declare-fun call!71319 () Bool)

(declare-fun contains!10132 (ListLongMap!22353 (_ BitVec 64)) Bool)

(assert (=> bm!71313 (= call!71319 (contains!10132 lt!669364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59035 () Bool)

(declare-fun mapRes!59035 () Bool)

(declare-fun tp!112075 () Bool)

(declare-fun e!864370 () Bool)

(assert (=> mapNonEmpty!59035 (= mapRes!59035 (and tp!112075 e!864370))))

(declare-fun mapKey!59035 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18196 0))(
  ( (ValueCellFull!18196 (v!21989 V!59393)) (EmptyCell!18196) )
))
(declare-fun mapRest!59035 () (Array (_ BitVec 32) ValueCell!18196))

(declare-datatypes ((array!103628 0))(
  ( (array!103629 (arr!50012 (Array (_ BitVec 32) ValueCell!18196)) (size!50562 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103628)

(declare-fun mapValue!59035 () ValueCell!18196)

(assert (=> mapNonEmpty!59035 (= (arr!50012 _values!470) (store mapRest!59035 mapKey!59035 mapValue!59035))))

(declare-fun b!1552644 () Bool)

(assert (=> b!1552644 (= e!864371 call!71319)))

(declare-fun b!1552645 () Bool)

(declare-fun e!864381 () ListLongMap!22353)

(declare-fun call!71317 () ListLongMap!22353)

(assert (=> b!1552645 (= e!864381 call!71317)))

(declare-fun b!1552646 () Bool)

(assert (=> b!1552646 (= e!864370 tp_is_empty!38213)))

(declare-fun bm!71314 () Bool)

(declare-fun call!71320 () ListLongMap!22353)

(assert (=> bm!71314 (= call!71317 call!71320)))

(declare-fun bm!71315 () Bool)

(declare-fun call!71321 () ListLongMap!22353)

(declare-fun call!71316 () ListLongMap!22353)

(assert (=> bm!71315 (= call!71321 call!71316)))

(declare-fun b!1552648 () Bool)

(declare-fun res!1062929 () Bool)

(declare-fun e!864369 () Bool)

(assert (=> b!1552648 (=> (not res!1062929) (not e!864369))))

(declare-datatypes ((array!103630 0))(
  ( (array!103631 (arr!50013 (Array (_ BitVec 32) (_ BitVec 64))) (size!50563 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103630)

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1552648 (= res!1062929 (and (= (size!50562 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50563 _keys!618) (size!50562 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun e!864382 () Bool)

(declare-fun b!1552649 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun get!26038 (ValueCell!18196 V!59393) V!59393)

(declare-fun dynLambda!3807 (Int (_ BitVec 64)) V!59393)

(assert (=> b!1552649 (= e!864382 (not (= (apply!1112 lt!669364 (select (arr!50013 _keys!618) from!762)) (get!26038 (select (arr!50012 _values!470) from!762) (dynLambda!3807 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552650 () Bool)

(assert (=> b!1552650 (= e!864381 call!71321)))

(declare-fun bm!71316 () Bool)

(declare-fun call!71318 () Bool)

(assert (=> bm!71316 (= call!71318 (contains!10132 lt!669364 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1552651 () Bool)

(assert (=> b!1552651 (= e!864379 e!864372)))

(declare-fun res!1062932 () Bool)

(assert (=> b!1552651 (= res!1062932 (not call!71318))))

(assert (=> b!1552651 (=> res!1062932 e!864372)))

(declare-fun b!1552652 () Bool)

(declare-fun e!864376 () Bool)

(assert (=> b!1552652 (= e!864376 (and e!864366 mapRes!59035))))

(declare-fun condMapEmpty!59035 () Bool)

(declare-fun mapDefault!59035 () ValueCell!18196)

