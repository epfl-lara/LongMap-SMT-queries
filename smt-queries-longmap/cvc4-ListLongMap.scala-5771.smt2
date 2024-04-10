; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74532 () Bool)

(assert start!74532)

(declare-fun b_free!15221 () Bool)

(declare-fun b_next!15221 () Bool)

(assert (=> start!74532 (= b_free!15221 (not b_next!15221))))

(declare-fun tp!53345 () Bool)

(declare-fun b_and!25097 () Bool)

(assert (=> start!74532 (= tp!53345 b_and!25097)))

(declare-fun mapNonEmpty!27813 () Bool)

(declare-fun mapRes!27813 () Bool)

(declare-fun tp!53344 () Bool)

(declare-fun e!488695 () Bool)

(assert (=> mapNonEmpty!27813 (= mapRes!27813 (and tp!53344 e!488695))))

(declare-datatypes ((V!28333 0))(
  ( (V!28334 (val!8780 Int)) )
))
(declare-datatypes ((ValueCell!8293 0))(
  ( (ValueCellFull!8293 (v!11220 V!28333)) (EmptyCell!8293) )
))
(declare-fun mapRest!27813 () (Array (_ BitVec 32) ValueCell!8293))

(declare-fun mapValue!27813 () ValueCell!8293)

(declare-fun mapKey!27813 () (_ BitVec 32))

(declare-datatypes ((array!51058 0))(
  ( (array!51059 (arr!24555 (Array (_ BitVec 32) ValueCell!8293)) (size!24995 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51058)

(assert (=> mapNonEmpty!27813 (= (arr!24555 _values!688) (store mapRest!27813 mapKey!27813 mapValue!27813))))

(declare-fun b!877982 () Bool)

(declare-fun res!596449 () Bool)

(declare-fun e!488693 () Bool)

(assert (=> b!877982 (=> (not res!596449) (not e!488693))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51060 0))(
  ( (array!51061 (arr!24556 (Array (_ BitVec 32) (_ BitVec 64))) (size!24996 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51060)

(assert (=> b!877982 (= res!596449 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24996 _keys!868))))))

(declare-fun b!877983 () Bool)

(declare-fun res!596451 () Bool)

(assert (=> b!877983 (=> (not res!596451) (not e!488693))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!877983 (= res!596451 (and (= (size!24995 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24996 _keys!868) (size!24995 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877984 () Bool)

(declare-fun tp_is_empty!17465 () Bool)

(assert (=> b!877984 (= e!488695 tp_is_empty!17465)))

(declare-fun b!877985 () Bool)

(declare-fun e!488692 () Bool)

(assert (=> b!877985 (= e!488692 tp_is_empty!17465)))

(declare-fun b!877986 () Bool)

(declare-fun res!596454 () Bool)

(assert (=> b!877986 (=> (not res!596454) (not e!488693))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877986 (= res!596454 (validKeyInArray!0 k!854))))

(declare-fun b!877987 () Bool)

(declare-fun res!596450 () Bool)

(assert (=> b!877987 (=> (not res!596450) (not e!488693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51060 (_ BitVec 32)) Bool)

(assert (=> b!877987 (= res!596450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877988 () Bool)

(declare-fun e!488694 () Bool)

(assert (=> b!877988 (= e!488694 (and e!488692 mapRes!27813))))

(declare-fun condMapEmpty!27813 () Bool)

(declare-fun mapDefault!27813 () ValueCell!8293)

