; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132154 () Bool)

(assert start!132154)

(declare-fun b_free!31867 () Bool)

(declare-fun b_next!31867 () Bool)

(assert (=> start!132154 (= b_free!31867 (not b_next!31867))))

(declare-fun tp!111853 () Bool)

(declare-fun b_and!51289 () Bool)

(assert (=> start!132154 (= tp!111853 b_and!51289)))

(declare-fun b!1550387 () Bool)

(declare-datatypes ((V!59301 0))(
  ( (V!59302 (val!19149 Int)) )
))
(declare-datatypes ((tuple2!24676 0))(
  ( (tuple2!24677 (_1!12349 (_ BitVec 64)) (_2!12349 V!59301)) )
))
(declare-datatypes ((List!36157 0))(
  ( (Nil!36154) (Cons!36153 (h!37598 tuple2!24676) (t!50863 List!36157)) )
))
(declare-datatypes ((ListLongMap!22285 0))(
  ( (ListLongMap!22286 (toList!11158 List!36157)) )
))
(declare-fun e!863030 () ListLongMap!22285)

(declare-fun call!70739 () ListLongMap!22285)

(assert (=> b!1550387 (= e!863030 call!70739)))

(declare-fun bm!70736 () Bool)

(declare-fun call!70743 () ListLongMap!22285)

(declare-fun call!70741 () ListLongMap!22285)

(assert (=> bm!70736 (= call!70743 call!70741)))

(declare-fun b!1550388 () Bool)

(declare-fun res!1061970 () Bool)

(declare-fun e!863033 () Bool)

(assert (=> b!1550388 (=> (not res!1061970) (not e!863033))))

(declare-datatypes ((array!103482 0))(
  ( (array!103483 (arr!49943 (Array (_ BitVec 32) (_ BitVec 64))) (size!50493 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103482)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103482 (_ BitVec 32)) Bool)

(assert (=> b!1550388 (= res!1061970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550389 () Bool)

(declare-fun e!863026 () Bool)

(declare-fun tp_is_empty!38143 () Bool)

(assert (=> b!1550389 (= e!863026 tp_is_empty!38143)))

(declare-fun mapNonEmpty!58918 () Bool)

(declare-fun mapRes!58918 () Bool)

(declare-fun tp!111852 () Bool)

(declare-fun e!863032 () Bool)

(assert (=> mapNonEmpty!58918 (= mapRes!58918 (and tp!111852 e!863032))))

(declare-fun mapKey!58918 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18161 0))(
  ( (ValueCellFull!18161 (v!21950 V!59301)) (EmptyCell!18161) )
))
(declare-datatypes ((array!103484 0))(
  ( (array!103485 (arr!49944 (Array (_ BitVec 32) ValueCell!18161)) (size!50494 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103484)

(declare-fun mapRest!58918 () (Array (_ BitVec 32) ValueCell!18161))

(declare-fun mapValue!58918 () ValueCell!18161)

(assert (=> mapNonEmpty!58918 (= (arr!49944 _values!470) (store mapRest!58918 mapKey!58918 mapValue!58918))))

(declare-fun mapIsEmpty!58918 () Bool)

(assert (=> mapIsEmpty!58918 mapRes!58918))

(declare-fun zeroValue!436 () V!59301)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!59301)

(declare-fun bm!70737 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6608 (array!103482 array!103484 (_ BitVec 32) (_ BitVec 32) V!59301 V!59301 (_ BitVec 32) Int) ListLongMap!22285)

(assert (=> bm!70737 (= call!70741 (getCurrentListMapNoExtraKeys!6608 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550390 () Bool)

(declare-fun e!863028 () ListLongMap!22285)

(declare-fun call!70740 () ListLongMap!22285)

(assert (=> b!1550390 (= e!863028 call!70740)))

(declare-fun b!1550391 () Bool)

(declare-fun res!1061966 () Bool)

(assert (=> b!1550391 (=> (not res!1061966) (not e!863033))))

(assert (=> b!1550391 (= res!1061966 (and (= (size!50494 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50493 _keys!618) (size!50494 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun e!863034 () Bool)

(declare-fun b!1550392 () Bool)

(declare-fun contains!10098 (ListLongMap!22285 (_ BitVec 64)) Bool)

(assert (=> b!1550392 (= e!863034 (not (contains!10098 (getCurrentListMapNoExtraKeys!6608 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49943 _keys!618) from!762))))))

(declare-fun b!1550393 () Bool)

(assert (=> b!1550393 (= e!863032 tp_is_empty!38143)))

(declare-fun b!1550394 () Bool)

(declare-fun res!1061964 () Bool)

(assert (=> b!1550394 (=> (not res!1061964) (not e!863033))))

(assert (=> b!1550394 (= res!1061964 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50493 _keys!618))))))

(declare-fun b!1550395 () Bool)

(declare-fun e!863029 () ListLongMap!22285)

(assert (=> b!1550395 (= e!863029 e!863028)))

(declare-fun c!142568 () Bool)

(declare-fun lt!668270 () Bool)

(assert (=> b!1550395 (= c!142568 (and (not lt!668270) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550396 () Bool)

(declare-fun res!1061968 () Bool)

(assert (=> b!1550396 (=> (not res!1061968) (not e!863034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550396 (= res!1061968 (validKeyInArray!0 (select (arr!49943 _keys!618) from!762)))))

(declare-fun b!1550397 () Bool)

(declare-fun e!863027 () Bool)

(assert (=> b!1550397 (= e!863027 (and e!863026 mapRes!58918))))

(declare-fun condMapEmpty!58918 () Bool)

(declare-fun mapDefault!58918 () ValueCell!18161)

