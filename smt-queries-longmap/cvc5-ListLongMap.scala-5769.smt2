; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74516 () Bool)

(assert start!74516)

(declare-fun b_free!15205 () Bool)

(declare-fun b_next!15205 () Bool)

(assert (=> start!74516 (= b_free!15205 (not b_next!15205))))

(declare-fun tp!53296 () Bool)

(declare-fun b_and!25081 () Bool)

(assert (=> start!74516 (= tp!53296 b_and!25081)))

(declare-fun mapIsEmpty!27789 () Bool)

(declare-fun mapRes!27789 () Bool)

(assert (=> mapIsEmpty!27789 mapRes!27789))

(declare-fun b!877718 () Bool)

(declare-fun res!596259 () Bool)

(declare-fun e!488573 () Bool)

(assert (=> b!877718 (=> (not res!596259) (not e!488573))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51026 0))(
  ( (array!51027 (arr!24539 (Array (_ BitVec 32) (_ BitVec 64))) (size!24979 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51026)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877718 (= res!596259 (and (= (select (arr!24539 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!877719 () Bool)

(declare-fun res!596262 () Bool)

(assert (=> b!877719 (=> (not res!596262) (not e!488573))))

(assert (=> b!877719 (= res!596262 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24979 _keys!868))))))

(declare-fun res!596261 () Bool)

(assert (=> start!74516 (=> (not res!596261) (not e!488573))))

(assert (=> start!74516 (= res!596261 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24979 _keys!868))))))

(assert (=> start!74516 e!488573))

(declare-fun tp_is_empty!17449 () Bool)

(assert (=> start!74516 tp_is_empty!17449))

(assert (=> start!74516 true))

(assert (=> start!74516 tp!53296))

(declare-fun array_inv!19342 (array!51026) Bool)

(assert (=> start!74516 (array_inv!19342 _keys!868)))

(declare-datatypes ((V!28313 0))(
  ( (V!28314 (val!8772 Int)) )
))
(declare-datatypes ((ValueCell!8285 0))(
  ( (ValueCellFull!8285 (v!11212 V!28313)) (EmptyCell!8285) )
))
(declare-datatypes ((array!51028 0))(
  ( (array!51029 (arr!24540 (Array (_ BitVec 32) ValueCell!8285)) (size!24980 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51028)

(declare-fun e!488575 () Bool)

(declare-fun array_inv!19343 (array!51028) Bool)

(assert (=> start!74516 (and (array_inv!19343 _values!688) e!488575)))

(declare-fun b!877720 () Bool)

(declare-fun res!596263 () Bool)

(assert (=> b!877720 (=> (not res!596263) (not e!488573))))

(declare-datatypes ((List!17414 0))(
  ( (Nil!17411) (Cons!17410 (h!18541 (_ BitVec 64)) (t!24503 List!17414)) )
))
(declare-fun arrayNoDuplicates!0 (array!51026 (_ BitVec 32) List!17414) Bool)

(assert (=> b!877720 (= res!596263 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17411))))

(declare-fun b!877721 () Bool)

(declare-fun e!488574 () Bool)

(assert (=> b!877721 (= e!488574 tp_is_empty!17449)))

(declare-fun b!877722 () Bool)

(declare-fun e!488572 () Bool)

(assert (=> b!877722 (= e!488575 (and e!488572 mapRes!27789))))

(declare-fun condMapEmpty!27789 () Bool)

(declare-fun mapDefault!27789 () ValueCell!8285)

