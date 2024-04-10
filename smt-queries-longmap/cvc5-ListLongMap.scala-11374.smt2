; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132148 () Bool)

(assert start!132148)

(declare-fun b_free!31861 () Bool)

(declare-fun b_next!31861 () Bool)

(assert (=> start!132148 (= b_free!31861 (not b_next!31861))))

(declare-fun tp!111834 () Bool)

(declare-fun b_and!51283 () Bool)

(assert (=> start!132148 (= tp!111834 b_and!51283)))

(declare-fun b!1550243 () Bool)

(declare-datatypes ((V!59293 0))(
  ( (V!59294 (val!19146 Int)) )
))
(declare-datatypes ((tuple2!24670 0))(
  ( (tuple2!24671 (_1!12346 (_ BitVec 64)) (_2!12346 V!59293)) )
))
(declare-datatypes ((List!36152 0))(
  ( (Nil!36149) (Cons!36148 (h!37593 tuple2!24670) (t!50858 List!36152)) )
))
(declare-datatypes ((ListLongMap!22279 0))(
  ( (ListLongMap!22280 (toList!11155 List!36152)) )
))
(declare-fun e!862948 () ListLongMap!22279)

(declare-fun call!70698 () ListLongMap!22279)

(assert (=> b!1550243 (= e!862948 call!70698)))

(declare-fun b!1550244 () Bool)

(declare-fun e!862949 () ListLongMap!22279)

(declare-fun call!70696 () ListLongMap!22279)

(assert (=> b!1550244 (= e!862949 call!70696)))

(declare-fun b!1550246 () Bool)

(declare-fun res!1061903 () Bool)

(declare-fun e!862950 () Bool)

(assert (=> b!1550246 (=> (not res!1061903) (not e!862950))))

(declare-datatypes ((array!103470 0))(
  ( (array!103471 (arr!49937 (Array (_ BitVec 32) (_ BitVec 64))) (size!50487 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103470)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103470 (_ BitVec 32)) Bool)

(assert (=> b!1550246 (= res!1061903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58909 () Bool)

(declare-fun mapRes!58909 () Bool)

(declare-fun tp!111835 () Bool)

(declare-fun e!862953 () Bool)

(assert (=> mapNonEmpty!58909 (= mapRes!58909 (and tp!111835 e!862953))))

(declare-fun mapKey!58909 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18158 0))(
  ( (ValueCellFull!18158 (v!21947 V!59293)) (EmptyCell!18158) )
))
(declare-fun mapRest!58909 () (Array (_ BitVec 32) ValueCell!18158))

(declare-datatypes ((array!103472 0))(
  ( (array!103473 (arr!49938 (Array (_ BitVec 32) ValueCell!18158)) (size!50488 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103472)

(declare-fun mapValue!58909 () ValueCell!18158)

(assert (=> mapNonEmpty!58909 (= (arr!49938 _values!470) (store mapRest!58909 mapKey!58909 mapValue!58909))))

(declare-fun bm!70691 () Bool)

(declare-fun call!70695 () ListLongMap!22279)

(assert (=> bm!70691 (= call!70696 call!70695)))

(declare-fun zeroValue!436 () V!59293)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun call!70697 () ListLongMap!22279)

(declare-fun bm!70692 () Bool)

(declare-fun minValue!436 () V!59293)

(declare-fun getCurrentListMapNoExtraKeys!6605 (array!103470 array!103472 (_ BitVec 32) (_ BitVec 32) V!59293 V!59293 (_ BitVec 32) Int) ListLongMap!22279)

(assert (=> bm!70692 (= call!70697 (getCurrentListMapNoExtraKeys!6605 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58909 () Bool)

(assert (=> mapIsEmpty!58909 mapRes!58909))

(declare-fun c!142540 () Bool)

(declare-fun call!70694 () ListLongMap!22279)

(declare-fun c!142539 () Bool)

(declare-fun bm!70693 () Bool)

(declare-fun +!4980 (ListLongMap!22279 tuple2!24670) ListLongMap!22279)

(assert (=> bm!70693 (= call!70694 (+!4980 (ite c!142540 call!70697 (ite c!142539 call!70695 call!70696)) (ite (or c!142540 c!142539) (tuple2!24671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550247 () Bool)

(declare-fun c!142541 () Bool)

(declare-fun lt!668244 () Bool)

(assert (=> b!1550247 (= c!142541 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668244))))

(assert (=> b!1550247 (= e!862948 e!862949)))

(declare-fun b!1550248 () Bool)

(declare-fun e!862946 () ListLongMap!22279)

(assert (=> b!1550248 (= e!862946 (+!4980 call!70694 (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70694 () Bool)

(assert (=> bm!70694 (= call!70698 call!70694)))

(declare-fun b!1550249 () Bool)

(declare-fun res!1061905 () Bool)

(assert (=> b!1550249 (=> (not res!1061905) (not e!862950))))

(declare-datatypes ((List!36153 0))(
  ( (Nil!36150) (Cons!36149 (h!37594 (_ BitVec 64)) (t!50859 List!36153)) )
))
(declare-fun arrayNoDuplicates!0 (array!103470 (_ BitVec 32) List!36153) Bool)

(assert (=> b!1550249 (= res!1061905 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36150))))

(declare-fun b!1550250 () Bool)

(declare-fun e!862952 () Bool)

(declare-fun tp_is_empty!38137 () Bool)

(assert (=> b!1550250 (= e!862952 tp_is_empty!38137)))

(declare-fun res!1061904 () Bool)

(assert (=> start!132148 (=> (not res!1061904) (not e!862950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132148 (= res!1061904 (validMask!0 mask!926))))

(assert (=> start!132148 e!862950))

(declare-fun array_inv!38825 (array!103470) Bool)

(assert (=> start!132148 (array_inv!38825 _keys!618)))

(assert (=> start!132148 tp_is_empty!38137))

(assert (=> start!132148 true))

(assert (=> start!132148 tp!111834))

(declare-fun e!862951 () Bool)

(declare-fun array_inv!38826 (array!103472) Bool)

(assert (=> start!132148 (and (array_inv!38826 _values!470) e!862951)))

(declare-fun b!1550245 () Bool)

(declare-fun res!1061907 () Bool)

(declare-fun e!862947 () Bool)

(assert (=> b!1550245 (=> (not res!1061907) (not e!862947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550245 (= res!1061907 (validKeyInArray!0 (select (arr!49937 _keys!618) from!762)))))

(declare-fun bm!70695 () Bool)

(assert (=> bm!70695 (= call!70695 call!70697)))

(declare-fun b!1550251 () Bool)

(assert (=> b!1550251 (= e!862953 tp_is_empty!38137)))

(declare-fun b!1550252 () Bool)

(declare-fun res!1061901 () Bool)

(assert (=> b!1550252 (=> (not res!1061901) (not e!862950))))

(assert (=> b!1550252 (= res!1061901 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50487 _keys!618))))))

(declare-fun b!1550253 () Bool)

(assert (=> b!1550253 (= e!862951 (and e!862952 mapRes!58909))))

(declare-fun condMapEmpty!58909 () Bool)

(declare-fun mapDefault!58909 () ValueCell!18158)

