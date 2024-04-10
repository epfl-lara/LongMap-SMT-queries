; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74522 () Bool)

(assert start!74522)

(declare-fun b_free!15211 () Bool)

(declare-fun b_next!15211 () Bool)

(assert (=> start!74522 (= b_free!15211 (not b_next!15211))))

(declare-fun tp!53315 () Bool)

(declare-fun b_and!25087 () Bool)

(assert (=> start!74522 (= tp!53315 b_and!25087)))

(declare-fun b!877817 () Bool)

(declare-fun res!596336 () Bool)

(declare-fun e!488620 () Bool)

(assert (=> b!877817 (=> (not res!596336) (not e!488620))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51038 0))(
  ( (array!51039 (arr!24545 (Array (_ BitVec 32) (_ BitVec 64))) (size!24985 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51038)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877817 (= res!596336 (and (= (select (arr!24545 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!596332 () Bool)

(assert (=> start!74522 (=> (not res!596332) (not e!488620))))

(assert (=> start!74522 (= res!596332 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24985 _keys!868))))))

(assert (=> start!74522 e!488620))

(declare-fun tp_is_empty!17455 () Bool)

(assert (=> start!74522 tp_is_empty!17455))

(assert (=> start!74522 true))

(assert (=> start!74522 tp!53315))

(declare-fun array_inv!19348 (array!51038) Bool)

(assert (=> start!74522 (array_inv!19348 _keys!868)))

(declare-datatypes ((V!28321 0))(
  ( (V!28322 (val!8775 Int)) )
))
(declare-datatypes ((ValueCell!8288 0))(
  ( (ValueCellFull!8288 (v!11215 V!28321)) (EmptyCell!8288) )
))
(declare-datatypes ((array!51040 0))(
  ( (array!51041 (arr!24546 (Array (_ BitVec 32) ValueCell!8288)) (size!24986 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51040)

(declare-fun e!488619 () Bool)

(declare-fun array_inv!19349 (array!51040) Bool)

(assert (=> start!74522 (and (array_inv!19349 _values!688) e!488619)))

(declare-fun b!877818 () Bool)

(declare-fun res!596335 () Bool)

(assert (=> b!877818 (=> (not res!596335) (not e!488620))))

(assert (=> b!877818 (= res!596335 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24985 _keys!868))))))

(declare-fun b!877819 () Bool)

(declare-fun res!596333 () Bool)

(assert (=> b!877819 (=> (not res!596333) (not e!488620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877819 (= res!596333 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!27798 () Bool)

(declare-fun mapRes!27798 () Bool)

(declare-fun tp!53314 () Bool)

(declare-fun e!488616 () Bool)

(assert (=> mapNonEmpty!27798 (= mapRes!27798 (and tp!53314 e!488616))))

(declare-fun mapValue!27798 () ValueCell!8288)

(declare-fun mapKey!27798 () (_ BitVec 32))

(declare-fun mapRest!27798 () (Array (_ BitVec 32) ValueCell!8288))

(assert (=> mapNonEmpty!27798 (= (arr!24546 _values!688) (store mapRest!27798 mapKey!27798 mapValue!27798))))

(declare-fun b!877820 () Bool)

(declare-fun res!596330 () Bool)

(assert (=> b!877820 (=> (not res!596330) (not e!488620))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877820 (= res!596330 (validMask!0 mask!1196))))

(declare-fun b!877821 () Bool)

(declare-fun res!596334 () Bool)

(assert (=> b!877821 (=> (not res!596334) (not e!488620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51038 (_ BitVec 32)) Bool)

(assert (=> b!877821 (= res!596334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877822 () Bool)

(declare-fun res!596329 () Bool)

(assert (=> b!877822 (=> (not res!596329) (not e!488620))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!877822 (= res!596329 (and (= (size!24986 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24985 _keys!868) (size!24986 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877823 () Bool)

(declare-fun e!488618 () Bool)

(assert (=> b!877823 (= e!488619 (and e!488618 mapRes!27798))))

(declare-fun condMapEmpty!27798 () Bool)

(declare-fun mapDefault!27798 () ValueCell!8288)

