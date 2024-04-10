; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132022 () Bool)

(assert start!132022)

(declare-fun b_free!31735 () Bool)

(declare-fun b_next!31735 () Bool)

(assert (=> start!132022 (= b_free!31735 (not b_next!31735))))

(declare-fun tp!111456 () Bool)

(declare-fun b_and!51145 () Bool)

(assert (=> start!132022 (= tp!111456 b_and!51145)))

(declare-fun mapIsEmpty!58720 () Bool)

(declare-fun mapRes!58720 () Bool)

(assert (=> mapIsEmpty!58720 mapRes!58720))

(declare-fun b!1547081 () Bool)

(declare-datatypes ((V!59125 0))(
  ( (V!59126 (val!19083 Int)) )
))
(declare-datatypes ((tuple2!24546 0))(
  ( (tuple2!24547 (_1!12284 (_ BitVec 64)) (_2!12284 V!59125)) )
))
(declare-datatypes ((List!36047 0))(
  ( (Nil!36044) (Cons!36043 (h!37488 tuple2!24546) (t!50741 List!36047)) )
))
(declare-datatypes ((ListLongMap!22155 0))(
  ( (ListLongMap!22156 (toList!11093 List!36047)) )
))
(declare-fun e!861145 () ListLongMap!22155)

(declare-fun call!69741 () ListLongMap!22155)

(assert (=> b!1547081 (= e!861145 call!69741)))

(declare-fun b!1547082 () Bool)

(declare-fun e!861148 () Bool)

(declare-fun tp_is_empty!38011 () Bool)

(assert (=> b!1547082 (= e!861148 tp_is_empty!38011)))

(declare-fun mapNonEmpty!58720 () Bool)

(declare-fun tp!111457 () Bool)

(assert (=> mapNonEmpty!58720 (= mapRes!58720 (and tp!111457 e!861148))))

(declare-fun mapKey!58720 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18095 0))(
  ( (ValueCellFull!18095 (v!21884 V!59125)) (EmptyCell!18095) )
))
(declare-datatypes ((array!103222 0))(
  ( (array!103223 (arr!49813 (Array (_ BitVec 32) ValueCell!18095)) (size!50363 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103222)

(declare-fun mapRest!58720 () (Array (_ BitVec 32) ValueCell!18095))

(declare-fun mapValue!58720 () ValueCell!18095)

(assert (=> mapNonEmpty!58720 (= (arr!49813 _values!470) (store mapRest!58720 mapKey!58720 mapValue!58720))))

(declare-fun b!1547083 () Bool)

(declare-fun e!861152 () Bool)

(assert (=> b!1547083 (= e!861152 tp_is_empty!38011)))

(declare-fun b!1547084 () Bool)

(declare-fun e!861151 () ListLongMap!22155)

(declare-fun e!861150 () ListLongMap!22155)

(assert (=> b!1547084 (= e!861151 e!861150)))

(declare-fun c!141938 () Bool)

(declare-fun lt!666763 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1547084 (= c!141938 (and (not lt!666763) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1060524 () Bool)

(declare-fun e!861147 () Bool)

(assert (=> start!132022 (=> (not res!1060524) (not e!861147))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132022 (= res!1060524 (validMask!0 mask!926))))

(assert (=> start!132022 e!861147))

(declare-datatypes ((array!103224 0))(
  ( (array!103225 (arr!49814 (Array (_ BitVec 32) (_ BitVec 64))) (size!50364 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103224)

(declare-fun array_inv!38741 (array!103224) Bool)

(assert (=> start!132022 (array_inv!38741 _keys!618)))

(assert (=> start!132022 tp_is_empty!38011))

(assert (=> start!132022 true))

(assert (=> start!132022 tp!111456))

(declare-fun e!861149 () Bool)

(declare-fun array_inv!38742 (array!103222) Bool)

(assert (=> start!132022 (and (array_inv!38742 _values!470) e!861149)))

(declare-fun b!1547085 () Bool)

(declare-fun res!1060527 () Bool)

(assert (=> b!1547085 (=> (not res!1060527) (not e!861147))))

(assert (=> b!1547085 (= res!1060527 (and (= (size!50363 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50364 _keys!618) (size!50363 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547086 () Bool)

(assert (=> b!1547086 (= e!861149 (and e!861152 mapRes!58720))))

(declare-fun condMapEmpty!58720 () Bool)

(declare-fun mapDefault!58720 () ValueCell!18095)

