; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131972 () Bool)

(assert start!131972)

(declare-fun b_free!31685 () Bool)

(declare-fun b_next!31685 () Bool)

(assert (=> start!131972 (= b_free!31685 (not b_next!31685))))

(declare-fun tp!111306 () Bool)

(declare-fun b_and!51095 () Bool)

(assert (=> start!131972 (= tp!111306 b_and!51095)))

(declare-fun b!1545881 () Bool)

(declare-fun res!1059999 () Bool)

(declare-fun e!860474 () Bool)

(assert (=> b!1545881 (=> (not res!1059999) (not e!860474))))

(declare-datatypes ((array!103128 0))(
  ( (array!103129 (arr!49766 (Array (_ BitVec 32) (_ BitVec 64))) (size!50316 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103128)

(declare-datatypes ((List!36007 0))(
  ( (Nil!36004) (Cons!36003 (h!37448 (_ BitVec 64)) (t!50701 List!36007)) )
))
(declare-fun arrayNoDuplicates!0 (array!103128 (_ BitVec 32) List!36007) Bool)

(assert (=> b!1545881 (= res!1059999 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36004))))

(declare-fun mapIsEmpty!58645 () Bool)

(declare-fun mapRes!58645 () Bool)

(assert (=> mapIsEmpty!58645 mapRes!58645))

(declare-fun mapNonEmpty!58645 () Bool)

(declare-fun tp!111307 () Bool)

(declare-fun e!860473 () Bool)

(assert (=> mapNonEmpty!58645 (= mapRes!58645 (and tp!111307 e!860473))))

(declare-fun mapKey!58645 () (_ BitVec 32))

(declare-datatypes ((V!59057 0))(
  ( (V!59058 (val!19058 Int)) )
))
(declare-datatypes ((ValueCell!18070 0))(
  ( (ValueCellFull!18070 (v!21859 V!59057)) (EmptyCell!18070) )
))
(declare-datatypes ((array!103130 0))(
  ( (array!103131 (arr!49767 (Array (_ BitVec 32) ValueCell!18070)) (size!50317 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103130)

(declare-fun mapRest!58645 () (Array (_ BitVec 32) ValueCell!18070))

(declare-fun mapValue!58645 () ValueCell!18070)

(assert (=> mapNonEmpty!58645 (= (arr!49767 _values!470) (store mapRest!58645 mapKey!58645 mapValue!58645))))

(declare-fun b!1545882 () Bool)

(declare-datatypes ((tuple2!24498 0))(
  ( (tuple2!24499 (_1!12260 (_ BitVec 64)) (_2!12260 V!59057)) )
))
(declare-datatypes ((List!36008 0))(
  ( (Nil!36005) (Cons!36004 (h!37449 tuple2!24498) (t!50702 List!36008)) )
))
(declare-datatypes ((ListLongMap!22107 0))(
  ( (ListLongMap!22108 (toList!11069 List!36008)) )
))
(declare-fun e!860475 () ListLongMap!22107)

(declare-fun call!69367 () ListLongMap!22107)

(declare-fun minValue!436 () V!59057)

(declare-fun +!4904 (ListLongMap!22107 tuple2!24498) ListLongMap!22107)

(assert (=> b!1545882 (= e!860475 (+!4904 call!69367 (tuple2!24499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545883 () Bool)

(declare-fun e!860478 () Bool)

(assert (=> b!1545883 (= e!860478 (not true))))

(declare-fun zeroValue!436 () V!59057)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666427 () ListLongMap!22107)

(declare-fun contains!10038 (ListLongMap!22107 (_ BitVec 64)) Bool)

(assert (=> b!1545883 (contains!10038 (+!4904 lt!666427 (tuple2!24499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49766 _keys!618) from!762))))

(declare-datatypes ((Unit!51512 0))(
  ( (Unit!51513) )
))
(declare-fun lt!666425 () Unit!51512)

(declare-fun addStillContains!1226 (ListLongMap!22107 (_ BitVec 64) V!59057 (_ BitVec 64)) Unit!51512)

(assert (=> b!1545883 (= lt!666425 (addStillContains!1226 lt!666427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49766 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6536 (array!103128 array!103130 (_ BitVec 32) (_ BitVec 32) V!59057 V!59057 (_ BitVec 32) Int) ListLongMap!22107)

(assert (=> b!1545883 (= lt!666427 (getCurrentListMapNoExtraKeys!6536 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545884 () Bool)

(declare-fun c!141713 () Bool)

(declare-fun lt!666428 () Bool)

(assert (=> b!1545884 (= c!141713 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666428))))

(declare-fun e!860472 () ListLongMap!22107)

(declare-fun e!860477 () ListLongMap!22107)

(assert (=> b!1545884 (= e!860472 e!860477)))

(declare-fun bm!69362 () Bool)

(declare-fun call!69368 () ListLongMap!22107)

(declare-fun call!69365 () ListLongMap!22107)

(assert (=> bm!69362 (= call!69368 call!69365)))

(declare-fun bm!69363 () Bool)

(declare-fun call!69366 () ListLongMap!22107)

(assert (=> bm!69363 (= call!69366 call!69368)))

(declare-fun b!1545885 () Bool)

(declare-fun res!1060001 () Bool)

(assert (=> b!1545885 (=> (not res!1060001) (not e!860474))))

(assert (=> b!1545885 (= res!1060001 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50316 _keys!618))))))

(declare-fun b!1545886 () Bool)

(assert (=> b!1545886 (= e!860477 call!69366)))

(declare-fun b!1545887 () Bool)

(declare-fun call!69369 () ListLongMap!22107)

(assert (=> b!1545887 (= e!860472 call!69369)))

(declare-fun bm!69364 () Bool)

(assert (=> bm!69364 (= call!69369 call!69367)))

(declare-fun b!1545888 () Bool)

(declare-fun e!860476 () Bool)

(declare-fun tp_is_empty!37961 () Bool)

(assert (=> b!1545888 (= e!860476 tp_is_empty!37961)))

(declare-fun b!1545889 () Bool)

(assert (=> b!1545889 (= e!860477 call!69369)))

(declare-fun b!1545890 () Bool)

(declare-fun e!860471 () Bool)

(assert (=> b!1545890 (= e!860471 (and e!860476 mapRes!58645))))

(declare-fun condMapEmpty!58645 () Bool)

(declare-fun mapDefault!58645 () ValueCell!18070)

