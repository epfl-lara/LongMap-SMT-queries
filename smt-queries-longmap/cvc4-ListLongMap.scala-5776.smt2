; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74562 () Bool)

(assert start!74562)

(declare-fun b_free!15251 () Bool)

(declare-fun b_next!15251 () Bool)

(assert (=> start!74562 (= b_free!15251 (not b_next!15251))))

(declare-fun tp!53435 () Bool)

(declare-fun b_and!25127 () Bool)

(assert (=> start!74562 (= tp!53435 b_and!25127)))

(declare-fun mapNonEmpty!27858 () Bool)

(declare-fun mapRes!27858 () Bool)

(declare-fun tp!53434 () Bool)

(declare-fun e!488916 () Bool)

(assert (=> mapNonEmpty!27858 (= mapRes!27858 (and tp!53434 e!488916))))

(declare-datatypes ((V!28373 0))(
  ( (V!28374 (val!8795 Int)) )
))
(declare-datatypes ((ValueCell!8308 0))(
  ( (ValueCellFull!8308 (v!11235 V!28373)) (EmptyCell!8308) )
))
(declare-fun mapValue!27858 () ValueCell!8308)

(declare-fun mapKey!27858 () (_ BitVec 32))

(declare-datatypes ((array!51116 0))(
  ( (array!51117 (arr!24584 (Array (_ BitVec 32) ValueCell!8308)) (size!25024 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51116)

(declare-fun mapRest!27858 () (Array (_ BitVec 32) ValueCell!8308))

(assert (=> mapNonEmpty!27858 (= (arr!24584 _values!688) (store mapRest!27858 mapKey!27858 mapValue!27858))))

(declare-fun b!878477 () Bool)

(declare-fun res!596813 () Bool)

(declare-fun e!488918 () Bool)

(assert (=> b!878477 (=> (not res!596813) (not e!488918))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878477 (= res!596813 (validMask!0 mask!1196))))

(declare-fun b!878478 () Bool)

(declare-fun res!596815 () Bool)

(assert (=> b!878478 (=> (not res!596815) (not e!488918))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51118 0))(
  ( (array!51119 (arr!24585 (Array (_ BitVec 32) (_ BitVec 64))) (size!25025 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51118)

(assert (=> b!878478 (= res!596815 (and (= (size!25024 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25025 _keys!868) (size!25024 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878479 () Bool)

(declare-fun res!596811 () Bool)

(assert (=> b!878479 (=> (not res!596811) (not e!488918))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878479 (= res!596811 (validKeyInArray!0 k!854))))

(declare-fun b!878481 () Bool)

(declare-fun e!488920 () Bool)

(declare-fun e!488917 () Bool)

(assert (=> b!878481 (= e!488920 (and e!488917 mapRes!27858))))

(declare-fun condMapEmpty!27858 () Bool)

(declare-fun mapDefault!27858 () ValueCell!8308)

