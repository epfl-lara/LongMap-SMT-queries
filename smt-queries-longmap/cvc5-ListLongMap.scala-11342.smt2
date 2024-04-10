; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131956 () Bool)

(assert start!131956)

(declare-fun b_free!31669 () Bool)

(declare-fun b_next!31669 () Bool)

(assert (=> start!131956 (= b_free!31669 (not b_next!31669))))

(declare-fun tp!111258 () Bool)

(declare-fun b_and!51079 () Bool)

(assert (=> start!131956 (= tp!111258 b_and!51079)))

(declare-fun mapIsEmpty!58621 () Bool)

(declare-fun mapRes!58621 () Bool)

(assert (=> mapIsEmpty!58621 mapRes!58621))

(declare-datatypes ((V!59037 0))(
  ( (V!59038 (val!19050 Int)) )
))
(declare-fun zeroValue!436 () V!59037)

(declare-datatypes ((tuple2!24482 0))(
  ( (tuple2!24483 (_1!12252 (_ BitVec 64)) (_2!12252 V!59037)) )
))
(declare-datatypes ((List!35992 0))(
  ( (Nil!35989) (Cons!35988 (h!37433 tuple2!24482) (t!50686 List!35992)) )
))
(declare-datatypes ((ListLongMap!22091 0))(
  ( (ListLongMap!22092 (toList!11061 List!35992)) )
))
(declare-fun call!69247 () ListLongMap!22091)

(declare-fun call!69246 () ListLongMap!22091)

(declare-fun call!69249 () ListLongMap!22091)

(declare-fun minValue!436 () V!59037)

(declare-fun call!69248 () ListLongMap!22091)

(declare-fun bm!69242 () Bool)

(declare-fun c!141641 () Bool)

(declare-fun c!141639 () Bool)

(declare-fun +!4897 (ListLongMap!22091 tuple2!24482) ListLongMap!22091)

(assert (=> bm!69242 (= call!69246 (+!4897 (ite c!141639 call!69247 (ite c!141641 call!69249 call!69248)) (ite (or c!141639 c!141641) (tuple2!24483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545497 () Bool)

(declare-fun e!860259 () ListLongMap!22091)

(declare-fun call!69245 () ListLongMap!22091)

(assert (=> b!1545497 (= e!860259 call!69245)))

(declare-fun b!1545498 () Bool)

(declare-fun res!1059832 () Bool)

(declare-fun e!860258 () Bool)

(assert (=> b!1545498 (=> (not res!1059832) (not e!860258))))

(declare-datatypes ((array!103096 0))(
  ( (array!103097 (arr!49750 (Array (_ BitVec 32) (_ BitVec 64))) (size!50300 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103096)

(declare-datatypes ((List!35993 0))(
  ( (Nil!35990) (Cons!35989 (h!37434 (_ BitVec 64)) (t!50687 List!35993)) )
))
(declare-fun arrayNoDuplicates!0 (array!103096 (_ BitVec 32) List!35993) Bool)

(assert (=> b!1545498 (= res!1059832 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35990))))

(declare-fun bm!69243 () Bool)

(assert (=> bm!69243 (= call!69245 call!69246)))

(declare-fun mapNonEmpty!58621 () Bool)

(declare-fun tp!111259 () Bool)

(declare-fun e!860256 () Bool)

(assert (=> mapNonEmpty!58621 (= mapRes!58621 (and tp!111259 e!860256))))

(declare-datatypes ((ValueCell!18062 0))(
  ( (ValueCellFull!18062 (v!21851 V!59037)) (EmptyCell!18062) )
))
(declare-fun mapValue!58621 () ValueCell!18062)

(declare-datatypes ((array!103098 0))(
  ( (array!103099 (arr!49751 (Array (_ BitVec 32) ValueCell!18062)) (size!50301 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103098)

(declare-fun mapRest!58621 () (Array (_ BitVec 32) ValueCell!18062))

(declare-fun mapKey!58621 () (_ BitVec 32))

(assert (=> mapNonEmpty!58621 (= (arr!49751 _values!470) (store mapRest!58621 mapKey!58621 mapValue!58621))))

(declare-fun b!1545499 () Bool)

(declare-fun e!860260 () ListLongMap!22091)

(assert (=> b!1545499 (= e!860260 call!69245)))

(declare-fun b!1545500 () Bool)

(declare-fun tp_is_empty!37945 () Bool)

(assert (=> b!1545500 (= e!860256 tp_is_empty!37945)))

(declare-fun b!1545501 () Bool)

(declare-fun res!1059831 () Bool)

(declare-fun e!860262 () Bool)

(assert (=> b!1545501 (=> (not res!1059831) (not e!860262))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545501 (= res!1059831 (validKeyInArray!0 (select (arr!49750 _keys!618) from!762)))))

(declare-fun b!1545502 () Bool)

(declare-fun e!860257 () ListLongMap!22091)

(assert (=> b!1545502 (= e!860257 (+!4897 call!69246 (tuple2!24483 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1059833 () Bool)

(assert (=> start!131956 (=> (not res!1059833) (not e!860258))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131956 (= res!1059833 (validMask!0 mask!926))))

(assert (=> start!131956 e!860258))

(declare-fun array_inv!38695 (array!103096) Bool)

(assert (=> start!131956 (array_inv!38695 _keys!618)))

(assert (=> start!131956 tp_is_empty!37945))

(assert (=> start!131956 true))

(assert (=> start!131956 tp!111258))

(declare-fun e!860255 () Bool)

(declare-fun array_inv!38696 (array!103098) Bool)

(assert (=> start!131956 (and (array_inv!38696 _values!470) e!860255)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69244 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6530 (array!103096 array!103098 (_ BitVec 32) (_ BitVec 32) V!59037 V!59037 (_ BitVec 32) Int) ListLongMap!22091)

(assert (=> bm!69244 (= call!69247 (getCurrentListMapNoExtraKeys!6530 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545503 () Bool)

(assert (=> b!1545503 (= e!860262 (not true))))

(declare-fun lt!666331 () ListLongMap!22091)

(declare-fun contains!10032 (ListLongMap!22091 (_ BitVec 64)) Bool)

(assert (=> b!1545503 (contains!10032 (+!4897 lt!666331 (tuple2!24483 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49750 _keys!618) from!762))))

(declare-datatypes ((Unit!51500 0))(
  ( (Unit!51501) )
))
(declare-fun lt!666330 () Unit!51500)

(declare-fun addStillContains!1220 (ListLongMap!22091 (_ BitVec 64) V!59037 (_ BitVec 64)) Unit!51500)

(assert (=> b!1545503 (= lt!666330 (addStillContains!1220 lt!666331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49750 _keys!618) from!762)))))

(assert (=> b!1545503 (= lt!666331 (getCurrentListMapNoExtraKeys!6530 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545504 () Bool)

(declare-fun res!1059834 () Bool)

(assert (=> b!1545504 (=> (not res!1059834) (not e!860258))))

(assert (=> b!1545504 (= res!1059834 (and (= (size!50301 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50300 _keys!618) (size!50301 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545505 () Bool)

(declare-fun res!1059835 () Bool)

(assert (=> b!1545505 (=> (not res!1059835) (not e!860258))))

(assert (=> b!1545505 (= res!1059835 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50300 _keys!618))))))

(declare-fun b!1545506 () Bool)

(assert (=> b!1545506 (= e!860257 e!860259)))

(declare-fun lt!666329 () Bool)

(assert (=> b!1545506 (= c!141641 (and (not lt!666329) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545507 () Bool)

(declare-fun e!860261 () Bool)

(assert (=> b!1545507 (= e!860261 tp_is_empty!37945)))

(declare-fun b!1545508 () Bool)

(declare-fun c!141640 () Bool)

(assert (=> b!1545508 (= c!141640 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666329))))

(assert (=> b!1545508 (= e!860259 e!860260)))

(declare-fun bm!69245 () Bool)

(assert (=> bm!69245 (= call!69249 call!69247)))

(declare-fun b!1545509 () Bool)

(declare-fun res!1059836 () Bool)

(assert (=> b!1545509 (=> (not res!1059836) (not e!860258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103096 (_ BitVec 32)) Bool)

(assert (=> b!1545509 (= res!1059836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545510 () Bool)

(assert (=> b!1545510 (= e!860255 (and e!860261 mapRes!58621))))

(declare-fun condMapEmpty!58621 () Bool)

(declare-fun mapDefault!58621 () ValueCell!18062)

