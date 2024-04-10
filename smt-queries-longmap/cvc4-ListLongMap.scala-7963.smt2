; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98622 () Bool)

(assert start!98622)

(declare-fun b_free!24227 () Bool)

(declare-fun b_next!24227 () Bool)

(assert (=> start!98622 (= b_free!24227 (not b_next!24227))))

(declare-fun tp!85391 () Bool)

(declare-fun b_and!39303 () Bool)

(assert (=> start!98622 (= tp!85391 b_and!39303)))

(declare-fun bm!52263 () Bool)

(declare-fun call!52272 () Bool)

(declare-fun call!52270 () Bool)

(assert (=> bm!52263 (= call!52272 call!52270)))

(declare-fun b!1145455 () Bool)

(declare-datatypes ((Unit!37606 0))(
  ( (Unit!37607) )
))
(declare-fun e!651587 () Unit!37606)

(declare-fun lt!511344 () Unit!37606)

(assert (=> b!1145455 (= e!651587 lt!511344)))

(declare-fun call!52268 () Unit!37606)

(assert (=> b!1145455 (= lt!511344 call!52268)))

(assert (=> b!1145455 call!52272))

(declare-fun b!1145456 () Bool)

(declare-fun res!762775 () Bool)

(declare-fun e!651580 () Bool)

(assert (=> b!1145456 (=> (not res!762775) (not e!651580))))

(declare-datatypes ((array!74365 0))(
  ( (array!74366 (arr!35833 (Array (_ BitVec 32) (_ BitVec 64))) (size!36369 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74365)

(declare-datatypes ((List!25037 0))(
  ( (Nil!25034) (Cons!25033 (h!26242 (_ BitVec 64)) (t!36256 List!25037)) )
))
(declare-fun arrayNoDuplicates!0 (array!74365 (_ BitVec 32) List!25037) Bool)

(assert (=> b!1145456 (= res!762775 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25034))))

(declare-fun b!1145457 () Bool)

(declare-fun e!651582 () Unit!37606)

(declare-fun Unit!37608 () Unit!37606)

(assert (=> b!1145457 (= e!651582 Unit!37608)))

(declare-datatypes ((V!43469 0))(
  ( (V!43470 (val!14435 Int)) )
))
(declare-fun zeroValue!944 () V!43469)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18284 0))(
  ( (tuple2!18285 (_1!9153 (_ BitVec 64)) (_2!9153 V!43469)) )
))
(declare-datatypes ((List!25038 0))(
  ( (Nil!25035) (Cons!25034 (h!26243 tuple2!18284) (t!36257 List!25038)) )
))
(declare-datatypes ((ListLongMap!16253 0))(
  ( (ListLongMap!16254 (toList!8142 List!25038)) )
))
(declare-fun call!52271 () ListLongMap!16253)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!52264 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13669 0))(
  ( (ValueCellFull!13669 (v!17072 V!43469)) (EmptyCell!13669) )
))
(declare-datatypes ((array!74367 0))(
  ( (array!74368 (arr!35834 (Array (_ BitVec 32) ValueCell!13669)) (size!36370 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74367)

(declare-fun minValue!944 () V!43469)

(declare-fun getCurrentListMapNoExtraKeys!4618 (array!74365 array!74367 (_ BitVec 32) (_ BitVec 32) V!43469 V!43469 (_ BitVec 32) Int) ListLongMap!16253)

(assert (=> bm!52264 (= call!52271 (getCurrentListMapNoExtraKeys!4618 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145458 () Bool)

(declare-fun e!651581 () Unit!37606)

(declare-fun Unit!37609 () Unit!37606)

(assert (=> b!1145458 (= e!651581 Unit!37609)))

(declare-fun b!1145459 () Bool)

(declare-fun call!52267 () ListLongMap!16253)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6670 (ListLongMap!16253 (_ BitVec 64)) Bool)

(assert (=> b!1145459 (contains!6670 call!52267 k!934)))

(declare-fun lt!511352 () Unit!37606)

(declare-fun lt!511350 () ListLongMap!16253)

(declare-fun addStillContains!822 (ListLongMap!16253 (_ BitVec 64) V!43469 (_ BitVec 64)) Unit!37606)

(assert (=> b!1145459 (= lt!511352 (addStillContains!822 lt!511350 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1145459 call!52270))

(declare-fun lt!511343 () ListLongMap!16253)

(declare-fun +!3568 (ListLongMap!16253 tuple2!18284) ListLongMap!16253)

(assert (=> b!1145459 (= lt!511350 (+!3568 lt!511343 (tuple2!18285 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511351 () Unit!37606)

(declare-fun call!52269 () Unit!37606)

(assert (=> b!1145459 (= lt!511351 call!52269)))

(declare-fun e!651577 () Unit!37606)

(assert (=> b!1145459 (= e!651577 lt!511352)))

(declare-fun b!1145460 () Bool)

(declare-fun e!651574 () Bool)

(declare-fun e!651576 () Bool)

(declare-fun mapRes!44960 () Bool)

(assert (=> b!1145460 (= e!651574 (and e!651576 mapRes!44960))))

(declare-fun condMapEmpty!44960 () Bool)

(declare-fun mapDefault!44960 () ValueCell!13669)

