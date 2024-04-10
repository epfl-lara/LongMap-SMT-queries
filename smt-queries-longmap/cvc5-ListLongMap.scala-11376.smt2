; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132178 () Bool)

(assert start!132178)

(declare-fun b_free!31873 () Bool)

(declare-fun b_next!31873 () Bool)

(assert (=> start!132178 (= b_free!31873 (not b_next!31873))))

(declare-fun tp!111873 () Bool)

(declare-fun b_and!51299 () Bool)

(assert (=> start!132178 (= tp!111873 b_and!51299)))

(declare-fun b!1550621 () Bool)

(declare-fun res!1062071 () Bool)

(declare-fun e!863172 () Bool)

(assert (=> b!1550621 (=> (not res!1062071) (not e!863172))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103496 0))(
  ( (array!103497 (arr!49949 (Array (_ BitVec 32) (_ BitVec 64))) (size!50499 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103496)

(assert (=> b!1550621 (= res!1062071 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50499 _keys!618))))))

(declare-fun b!1550622 () Bool)

(declare-fun e!863166 () Bool)

(assert (=> b!1550622 (= e!863166 (not true))))

(declare-datatypes ((V!59309 0))(
  ( (V!59310 (val!19152 Int)) )
))
(declare-fun zeroValue!436 () V!59309)

(declare-datatypes ((tuple2!24682 0))(
  ( (tuple2!24683 (_1!12352 (_ BitVec 64)) (_2!12352 V!59309)) )
))
(declare-datatypes ((List!36162 0))(
  ( (Nil!36159) (Cons!36158 (h!37603 tuple2!24682) (t!50870 List!36162)) )
))
(declare-datatypes ((ListLongMap!22291 0))(
  ( (ListLongMap!22292 (toList!11161 List!36162)) )
))
(declare-fun lt!668350 () ListLongMap!22291)

(declare-fun contains!10102 (ListLongMap!22291 (_ BitVec 64)) Bool)

(declare-fun +!4983 (ListLongMap!22291 tuple2!24682) ListLongMap!22291)

(assert (=> b!1550622 (contains!10102 (+!4983 lt!668350 (tuple2!24683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49949 _keys!618) from!762))))

(declare-datatypes ((Unit!51646 0))(
  ( (Unit!51647) )
))
(declare-fun lt!668349 () Unit!51646)

(declare-fun addStillContains!1284 (ListLongMap!22291 (_ BitVec 64) V!59309 (_ BitVec 64)) Unit!51646)

(assert (=> b!1550622 (= lt!668349 (addStillContains!1284 lt!668350 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49949 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59309)

(declare-datatypes ((ValueCell!18164 0))(
  ( (ValueCellFull!18164 (v!21954 V!59309)) (EmptyCell!18164) )
))
(declare-datatypes ((array!103498 0))(
  ( (array!103499 (arr!49950 (Array (_ BitVec 32) ValueCell!18164)) (size!50500 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103498)

(declare-fun getCurrentListMapNoExtraKeys!6610 (array!103496 array!103498 (_ BitVec 32) (_ BitVec 32) V!59309 V!59309 (_ BitVec 32) Int) ListLongMap!22291)

(assert (=> b!1550622 (= lt!668350 (getCurrentListMapNoExtraKeys!6610 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550623 () Bool)

(declare-fun e!863165 () Bool)

(declare-fun tp_is_empty!38149 () Bool)

(assert (=> b!1550623 (= e!863165 tp_is_empty!38149)))

(declare-fun b!1550624 () Bool)

(declare-fun e!863168 () Bool)

(assert (=> b!1550624 (= e!863168 tp_is_empty!38149)))

(declare-fun call!70797 () ListLongMap!22291)

(declare-fun bm!70790 () Bool)

(assert (=> bm!70790 (= call!70797 (getCurrentListMapNoExtraKeys!6610 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1062068 () Bool)

(assert (=> start!132178 (=> (not res!1062068) (not e!863172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132178 (= res!1062068 (validMask!0 mask!926))))

(assert (=> start!132178 e!863172))

(declare-fun array_inv!38835 (array!103496) Bool)

(assert (=> start!132178 (array_inv!38835 _keys!618)))

(assert (=> start!132178 tp_is_empty!38149))

(assert (=> start!132178 true))

(assert (=> start!132178 tp!111873))

(declare-fun e!863171 () Bool)

(declare-fun array_inv!38836 (array!103498) Bool)

(assert (=> start!132178 (and (array_inv!38836 _values!470) e!863171)))

(declare-fun b!1550625 () Bool)

(assert (=> b!1550625 (= e!863172 e!863166)))

(declare-fun res!1062067 () Bool)

(assert (=> b!1550625 (=> (not res!1062067) (not e!863166))))

(assert (=> b!1550625 (= res!1062067 (bvslt from!762 (size!50499 _keys!618)))))

(declare-fun lt!668352 () ListLongMap!22291)

(declare-fun e!863170 () ListLongMap!22291)

(assert (=> b!1550625 (= lt!668352 e!863170)))

(declare-fun c!142615 () Bool)

(declare-fun lt!668351 () Bool)

(assert (=> b!1550625 (= c!142615 (and (not lt!668351) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550625 (= lt!668351 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550626 () Bool)

(declare-fun e!863169 () ListLongMap!22291)

(declare-fun call!70795 () ListLongMap!22291)

(assert (=> b!1550626 (= e!863169 call!70795)))

(declare-fun b!1550627 () Bool)

(declare-fun mapRes!58930 () Bool)

(assert (=> b!1550627 (= e!863171 (and e!863168 mapRes!58930))))

(declare-fun condMapEmpty!58930 () Bool)

(declare-fun mapDefault!58930 () ValueCell!18164)

