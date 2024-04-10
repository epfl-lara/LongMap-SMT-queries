; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132076 () Bool)

(assert start!132076)

(declare-fun b_free!31789 () Bool)

(declare-fun b_next!31789 () Bool)

(assert (=> start!132076 (= b_free!31789 (not b_next!31789))))

(declare-fun tp!111618 () Bool)

(declare-fun b_and!51199 () Bool)

(assert (=> start!132076 (= tp!111618 b_and!51199)))

(declare-fun mapIsEmpty!58801 () Bool)

(declare-fun mapRes!58801 () Bool)

(assert (=> mapIsEmpty!58801 mapRes!58801))

(declare-fun mapNonEmpty!58801 () Bool)

(declare-fun tp!111619 () Bool)

(declare-fun e!861875 () Bool)

(assert (=> mapNonEmpty!58801 (= mapRes!58801 (and tp!111619 e!861875))))

(declare-datatypes ((V!59197 0))(
  ( (V!59198 (val!19110 Int)) )
))
(declare-datatypes ((ValueCell!18122 0))(
  ( (ValueCellFull!18122 (v!21911 V!59197)) (EmptyCell!18122) )
))
(declare-fun mapRest!58801 () (Array (_ BitVec 32) ValueCell!18122))

(declare-datatypes ((array!103330 0))(
  ( (array!103331 (arr!49867 (Array (_ BitVec 32) ValueCell!18122)) (size!50417 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103330)

(declare-fun mapKey!58801 () (_ BitVec 32))

(declare-fun mapValue!58801 () ValueCell!18122)

(assert (=> mapNonEmpty!58801 (= (arr!49867 _values!470) (store mapRest!58801 mapKey!58801 mapValue!58801))))

(declare-fun b!1548377 () Bool)

(declare-fun res!1061091 () Bool)

(declare-fun e!861882 () Bool)

(assert (=> b!1548377 (=> (not res!1061091) (not e!861882))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103332 0))(
  ( (array!103333 (arr!49868 (Array (_ BitVec 32) (_ BitVec 64))) (size!50418 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103332)

(assert (=> b!1548377 (= res!1061091 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50418 _keys!618))))))

(declare-fun b!1548378 () Bool)

(declare-fun tp_is_empty!38065 () Bool)

(assert (=> b!1548378 (= e!861875 tp_is_empty!38065)))

(declare-fun bm!70142 () Bool)

(declare-datatypes ((tuple2!24598 0))(
  ( (tuple2!24599 (_1!12310 (_ BitVec 64)) (_2!12310 V!59197)) )
))
(declare-datatypes ((List!36090 0))(
  ( (Nil!36087) (Cons!36086 (h!37531 tuple2!24598) (t!50784 List!36090)) )
))
(declare-datatypes ((ListLongMap!22207 0))(
  ( (ListLongMap!22208 (toList!11119 List!36090)) )
))
(declare-fun call!70149 () ListLongMap!22207)

(declare-fun call!70146 () ListLongMap!22207)

(assert (=> bm!70142 (= call!70149 call!70146)))

(declare-fun b!1548379 () Bool)

(declare-fun res!1061093 () Bool)

(assert (=> b!1548379 (=> (not res!1061093) (not e!861882))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103332 (_ BitVec 32)) Bool)

(assert (=> b!1548379 (= res!1061093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1061092 () Bool)

(assert (=> start!132076 (=> (not res!1061092) (not e!861882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132076 (= res!1061092 (validMask!0 mask!926))))

(assert (=> start!132076 e!861882))

(declare-fun array_inv!38773 (array!103332) Bool)

(assert (=> start!132076 (array_inv!38773 _keys!618)))

(assert (=> start!132076 tp_is_empty!38065))

(assert (=> start!132076 true))

(assert (=> start!132076 tp!111618))

(declare-fun e!861879 () Bool)

(declare-fun array_inv!38774 (array!103330) Bool)

(assert (=> start!132076 (and (array_inv!38774 _values!470) e!861879)))

(declare-fun bm!70143 () Bool)

(declare-fun call!70145 () ListLongMap!22207)

(declare-fun call!70148 () ListLongMap!22207)

(assert (=> bm!70143 (= call!70145 call!70148)))

(declare-fun zeroValue!436 () V!59197)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70144 () Bool)

(declare-fun minValue!436 () V!59197)

(declare-fun getCurrentListMapNoExtraKeys!6576 (array!103332 array!103330 (_ BitVec 32) (_ BitVec 32) V!59197 V!59197 (_ BitVec 32) Int) ListLongMap!22207)

(assert (=> bm!70144 (= call!70148 (getCurrentListMapNoExtraKeys!6576 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548380 () Bool)

(declare-fun e!861877 () Bool)

(assert (=> b!1548380 (= e!861879 (and e!861877 mapRes!58801))))

(declare-fun condMapEmpty!58801 () Bool)

(declare-fun mapDefault!58801 () ValueCell!18122)

