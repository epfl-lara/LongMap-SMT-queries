; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132052 () Bool)

(assert start!132052)

(declare-fun b_free!31765 () Bool)

(declare-fun b_next!31765 () Bool)

(assert (=> start!132052 (= b_free!31765 (not b_next!31765))))

(declare-fun tp!111547 () Bool)

(declare-fun b_and!51175 () Bool)

(assert (=> start!132052 (= tp!111547 b_and!51175)))

(declare-fun b!1547801 () Bool)

(declare-fun res!1060841 () Bool)

(declare-fun e!861554 () Bool)

(assert (=> b!1547801 (=> (not res!1060841) (not e!861554))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103282 0))(
  ( (array!103283 (arr!49843 (Array (_ BitVec 32) (_ BitVec 64))) (size!50393 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103282)

(assert (=> b!1547801 (= res!1060841 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50393 _keys!618))))))

(declare-fun b!1547802 () Bool)

(declare-fun res!1060844 () Bool)

(assert (=> b!1547802 (=> (not res!1060844) (not e!861554))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103282 (_ BitVec 32)) Bool)

(assert (=> b!1547802 (= res!1060844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58765 () Bool)

(declare-fun mapRes!58765 () Bool)

(declare-fun tp!111546 () Bool)

(declare-fun e!861553 () Bool)

(assert (=> mapNonEmpty!58765 (= mapRes!58765 (and tp!111546 e!861553))))

(declare-datatypes ((V!59165 0))(
  ( (V!59166 (val!19098 Int)) )
))
(declare-datatypes ((ValueCell!18110 0))(
  ( (ValueCellFull!18110 (v!21899 V!59165)) (EmptyCell!18110) )
))
(declare-fun mapValue!58765 () ValueCell!18110)

(declare-fun mapKey!58765 () (_ BitVec 32))

(declare-datatypes ((array!103284 0))(
  ( (array!103285 (arr!49844 (Array (_ BitVec 32) ValueCell!18110)) (size!50394 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103284)

(declare-fun mapRest!58765 () (Array (_ BitVec 32) ValueCell!18110))

(assert (=> mapNonEmpty!58765 (= (arr!49844 _values!470) (store mapRest!58765 mapKey!58765 mapValue!58765))))

(declare-fun res!1060839 () Bool)

(assert (=> start!132052 (=> (not res!1060839) (not e!861554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132052 (= res!1060839 (validMask!0 mask!926))))

(assert (=> start!132052 e!861554))

(declare-fun array_inv!38759 (array!103282) Bool)

(assert (=> start!132052 (array_inv!38759 _keys!618)))

(declare-fun tp_is_empty!38041 () Bool)

(assert (=> start!132052 tp_is_empty!38041))

(assert (=> start!132052 true))

(assert (=> start!132052 tp!111547))

(declare-fun e!861557 () Bool)

(declare-fun array_inv!38760 (array!103284) Bool)

(assert (=> start!132052 (and (array_inv!38760 _values!470) e!861557)))

(declare-fun b!1547803 () Bool)

(declare-datatypes ((tuple2!24576 0))(
  ( (tuple2!24577 (_1!12299 (_ BitVec 64)) (_2!12299 V!59165)) )
))
(declare-datatypes ((List!36071 0))(
  ( (Nil!36068) (Cons!36067 (h!37512 tuple2!24576) (t!50765 List!36071)) )
))
(declare-datatypes ((ListLongMap!22185 0))(
  ( (ListLongMap!22186 (toList!11108 List!36071)) )
))
(declare-fun e!861551 () ListLongMap!22185)

(declare-fun call!69968 () ListLongMap!22185)

(declare-fun minValue!436 () V!59165)

(declare-fun +!4939 (ListLongMap!22185 tuple2!24576) ListLongMap!22185)

(assert (=> b!1547803 (= e!861551 (+!4939 call!69968 (tuple2!24577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69962 () Bool)

(declare-fun call!69966 () ListLongMap!22185)

(declare-fun call!69965 () ListLongMap!22185)

(assert (=> bm!69962 (= call!69966 call!69965)))

(declare-fun b!1547804 () Bool)

(declare-fun e!861558 () ListLongMap!22185)

(declare-fun call!69969 () ListLongMap!22185)

(assert (=> b!1547804 (= e!861558 call!69969)))

(declare-fun b!1547805 () Bool)

(declare-fun res!1060845 () Bool)

(assert (=> b!1547805 (=> (not res!1060845) (not e!861554))))

(declare-datatypes ((List!36072 0))(
  ( (Nil!36069) (Cons!36068 (h!37513 (_ BitVec 64)) (t!50766 List!36072)) )
))
(declare-fun arrayNoDuplicates!0 (array!103282 (_ BitVec 32) List!36072) Bool)

(assert (=> b!1547805 (= res!1060845 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36069))))

(declare-fun b!1547806 () Bool)

(declare-fun e!861555 () Bool)

(assert (=> b!1547806 (= e!861557 (and e!861555 mapRes!58765))))

(declare-fun condMapEmpty!58765 () Bool)

(declare-fun mapDefault!58765 () ValueCell!18110)

