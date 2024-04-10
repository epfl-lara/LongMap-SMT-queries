; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131950 () Bool)

(assert start!131950)

(declare-fun b_free!31663 () Bool)

(declare-fun b_next!31663 () Bool)

(assert (=> start!131950 (= b_free!31663 (not b_next!31663))))

(declare-fun tp!111240 () Bool)

(declare-fun b_and!51073 () Bool)

(assert (=> start!131950 (= tp!111240 b_and!51073)))

(declare-fun b!1545353 () Bool)

(declare-fun e!860176 () Bool)

(declare-fun tp_is_empty!37939 () Bool)

(assert (=> b!1545353 (= e!860176 tp_is_empty!37939)))

(declare-fun mapIsEmpty!58612 () Bool)

(declare-fun mapRes!58612 () Bool)

(assert (=> mapIsEmpty!58612 mapRes!58612))

(declare-fun b!1545354 () Bool)

(declare-fun res!1059770 () Bool)

(declare-fun e!860174 () Bool)

(assert (=> b!1545354 (=> (not res!1059770) (not e!860174))))

(declare-datatypes ((array!103084 0))(
  ( (array!103085 (arr!49744 (Array (_ BitVec 32) (_ BitVec 64))) (size!50294 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103084)

(declare-datatypes ((List!35987 0))(
  ( (Nil!35984) (Cons!35983 (h!37428 (_ BitVec 64)) (t!50681 List!35987)) )
))
(declare-fun arrayNoDuplicates!0 (array!103084 (_ BitVec 32) List!35987) Bool)

(assert (=> b!1545354 (= res!1059770 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35984))))

(declare-fun b!1545355 () Bool)

(declare-fun res!1059771 () Bool)

(assert (=> b!1545355 (=> (not res!1059771) (not e!860174))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103084 (_ BitVec 32)) Bool)

(assert (=> b!1545355 (= res!1059771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545356 () Bool)

(declare-fun res!1059774 () Bool)

(declare-fun e!860173 () Bool)

(assert (=> b!1545356 (=> (not res!1059774) (not e!860173))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545356 (= res!1059774 (validKeyInArray!0 (select (arr!49744 _keys!618) from!762)))))

(declare-fun bm!69197 () Bool)

(declare-datatypes ((V!59029 0))(
  ( (V!59030 (val!19047 Int)) )
))
(declare-datatypes ((tuple2!24476 0))(
  ( (tuple2!24477 (_1!12249 (_ BitVec 64)) (_2!12249 V!59029)) )
))
(declare-datatypes ((List!35988 0))(
  ( (Nil!35985) (Cons!35984 (h!37429 tuple2!24476) (t!50682 List!35988)) )
))
(declare-datatypes ((ListLongMap!22085 0))(
  ( (ListLongMap!22086 (toList!11058 List!35988)) )
))
(declare-fun call!69200 () ListLongMap!22085)

(declare-fun call!69201 () ListLongMap!22085)

(assert (=> bm!69197 (= call!69200 call!69201)))

(declare-fun zeroValue!436 () V!59029)

(declare-fun call!69204 () ListLongMap!22085)

(declare-fun c!141612 () Bool)

(declare-fun c!141613 () Bool)

(declare-fun bm!69198 () Bool)

(declare-fun minValue!436 () V!59029)

(declare-fun call!69202 () ListLongMap!22085)

(declare-fun +!4894 (ListLongMap!22085 tuple2!24476) ListLongMap!22085)

(assert (=> bm!69198 (= call!69202 (+!4894 (ite c!141613 call!69204 (ite c!141612 call!69201 call!69200)) (ite (or c!141613 c!141612) (tuple2!24477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545357 () Bool)

(declare-fun e!860177 () ListLongMap!22085)

(declare-fun call!69203 () ListLongMap!22085)

(assert (=> b!1545357 (= e!860177 call!69203)))

(declare-fun b!1545358 () Bool)

(assert (=> b!1545358 (= e!860177 call!69200)))

(declare-fun bm!69199 () Bool)

(assert (=> bm!69199 (= call!69203 call!69202)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18059 0))(
  ( (ValueCellFull!18059 (v!21848 V!59029)) (EmptyCell!18059) )
))
(declare-datatypes ((array!103086 0))(
  ( (array!103087 (arr!49745 (Array (_ BitVec 32) ValueCell!18059)) (size!50295 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103086)

(declare-fun bm!69200 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6527 (array!103084 array!103086 (_ BitVec 32) (_ BitVec 32) V!59029 V!59029 (_ BitVec 32) Int) ListLongMap!22085)

(assert (=> bm!69200 (= call!69204 (getCurrentListMapNoExtraKeys!6527 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58612 () Bool)

(declare-fun tp!111241 () Bool)

(declare-fun e!860181 () Bool)

(assert (=> mapNonEmpty!58612 (= mapRes!58612 (and tp!111241 e!860181))))

(declare-fun mapKey!58612 () (_ BitVec 32))

(declare-fun mapValue!58612 () ValueCell!18059)

(declare-fun mapRest!58612 () (Array (_ BitVec 32) ValueCell!18059))

(assert (=> mapNonEmpty!58612 (= (arr!49745 _values!470) (store mapRest!58612 mapKey!58612 mapValue!58612))))

(declare-fun b!1545359 () Bool)

(declare-fun e!860179 () Bool)

(assert (=> b!1545359 (= e!860179 (and e!860176 mapRes!58612))))

(declare-fun condMapEmpty!58612 () Bool)

(declare-fun mapDefault!58612 () ValueCell!18059)

