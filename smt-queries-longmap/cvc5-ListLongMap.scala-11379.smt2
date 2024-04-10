; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132216 () Bool)

(assert start!132216)

(declare-fun b_free!31891 () Bool)

(declare-fun b_next!31891 () Bool)

(assert (=> start!132216 (= b_free!31891 (not b_next!31891))))

(declare-fun tp!111930 () Bool)

(declare-fun b_and!51321 () Bool)

(assert (=> start!132216 (= tp!111930 b_and!51321)))

(declare-fun b!1551160 () Bool)

(declare-fun res!1062306 () Bool)

(declare-fun e!863481 () Bool)

(assert (=> b!1551160 (=> (not res!1062306) (not e!863481))))

(declare-datatypes ((array!103534 0))(
  ( (array!103535 (arr!49967 (Array (_ BitVec 32) (_ BitVec 64))) (size!50517 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103534)

(declare-datatypes ((List!36178 0))(
  ( (Nil!36175) (Cons!36174 (h!37619 (_ BitVec 64)) (t!50888 List!36178)) )
))
(declare-fun arrayNoDuplicates!0 (array!103534 (_ BitVec 32) List!36178) Bool)

(assert (=> b!1551160 (= res!1062306 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36175))))

(declare-fun b!1551161 () Bool)

(declare-datatypes ((V!59333 0))(
  ( (V!59334 (val!19161 Int)) )
))
(declare-datatypes ((tuple2!24700 0))(
  ( (tuple2!24701 (_1!12361 (_ BitVec 64)) (_2!12361 V!59333)) )
))
(declare-datatypes ((List!36179 0))(
  ( (Nil!36176) (Cons!36175 (h!37620 tuple2!24700) (t!50889 List!36179)) )
))
(declare-datatypes ((ListLongMap!22309 0))(
  ( (ListLongMap!22310 (toList!11170 List!36179)) )
))
(declare-fun e!863485 () ListLongMap!22309)

(declare-fun call!70937 () ListLongMap!22309)

(declare-fun minValue!436 () V!59333)

(declare-fun +!4991 (ListLongMap!22309 tuple2!24700) ListLongMap!22309)

(assert (=> b!1551161 (= e!863485 (+!4991 call!70937 (tuple2!24701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551162 () Bool)

(declare-fun e!863483 () Bool)

(assert (=> b!1551162 (= e!863481 e!863483)))

(declare-fun res!1062313 () Bool)

(assert (=> b!1551162 (=> (not res!1062313) (not e!863483))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1551162 (= res!1062313 (bvslt from!762 (size!50517 _keys!618)))))

(declare-fun lt!668540 () ListLongMap!22309)

(assert (=> b!1551162 (= lt!668540 e!863485)))

(declare-fun c!142717 () Bool)

(declare-fun lt!668539 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551162 (= c!142717 (and (not lt!668539) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551162 (= lt!668539 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551163 () Bool)

(declare-fun e!863480 () ListLongMap!22309)

(declare-fun call!70938 () ListLongMap!22309)

(assert (=> b!1551163 (= e!863480 call!70938)))

(declare-fun zeroValue!436 () V!59333)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18173 0))(
  ( (ValueCellFull!18173 (v!21964 V!59333)) (EmptyCell!18173) )
))
(declare-datatypes ((array!103536 0))(
  ( (array!103537 (arr!49968 (Array (_ BitVec 32) ValueCell!18173)) (size!50518 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103536)

(declare-fun bm!70934 () Bool)

(declare-fun call!70941 () ListLongMap!22309)

(declare-fun getCurrentListMapNoExtraKeys!6618 (array!103534 array!103536 (_ BitVec 32) (_ BitVec 32) V!59333 V!59333 (_ BitVec 32) Int) ListLongMap!22309)

(assert (=> bm!70934 (= call!70941 (getCurrentListMapNoExtraKeys!6618 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551164 () Bool)

(declare-fun res!1062307 () Bool)

(assert (=> b!1551164 (=> (not res!1062307) (not e!863481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103534 (_ BitVec 32)) Bool)

(assert (=> b!1551164 (= res!1062307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551165 () Bool)

(declare-fun e!863482 () ListLongMap!22309)

(assert (=> b!1551165 (= e!863485 e!863482)))

(declare-fun c!142719 () Bool)

(assert (=> b!1551165 (= c!142719 (and (not lt!668539) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551166 () Bool)

(declare-fun e!863487 () Bool)

(declare-fun e!863484 () Bool)

(declare-fun mapRes!58960 () Bool)

(assert (=> b!1551166 (= e!863487 (and e!863484 mapRes!58960))))

(declare-fun condMapEmpty!58960 () Bool)

(declare-fun mapDefault!58960 () ValueCell!18173)

