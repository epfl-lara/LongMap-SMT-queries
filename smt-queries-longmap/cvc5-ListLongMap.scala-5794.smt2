; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74706 () Bool)

(assert start!74706)

(declare-fun b_free!15355 () Bool)

(declare-fun b_next!15355 () Bool)

(assert (=> start!74706 (= b_free!15355 (not b_next!15355))))

(declare-fun tp!53753 () Bool)

(declare-fun b_and!25329 () Bool)

(assert (=> start!74706 (= tp!53753 b_and!25329)))

(declare-fun b!880822 () Bool)

(declare-fun res!598462 () Bool)

(declare-fun e!490166 () Bool)

(assert (=> b!880822 (=> (not res!598462) (not e!490166))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880822 (= res!598462 (validKeyInArray!0 k!854))))

(declare-fun b!880823 () Bool)

(declare-fun res!598461 () Bool)

(assert (=> b!880823 (=> (not res!598461) (not e!490166))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51324 0))(
  ( (array!51325 (arr!24686 (Array (_ BitVec 32) (_ BitVec 64))) (size!25126 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51324)

(declare-datatypes ((V!28513 0))(
  ( (V!28514 (val!8847 Int)) )
))
(declare-datatypes ((ValueCell!8360 0))(
  ( (ValueCellFull!8360 (v!11295 V!28513)) (EmptyCell!8360) )
))
(declare-datatypes ((array!51326 0))(
  ( (array!51327 (arr!24687 (Array (_ BitVec 32) ValueCell!8360)) (size!25127 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51326)

(assert (=> b!880823 (= res!598461 (and (= (size!25127 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25126 _keys!868) (size!25127 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880824 () Bool)

(declare-fun e!490168 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880824 (= e!490168 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (size!25126 _keys!868) #b01111111111111111111111111111111)))))

(declare-datatypes ((List!17526 0))(
  ( (Nil!17523) (Cons!17522 (h!18653 (_ BitVec 64)) (t!24683 List!17526)) )
))
(declare-fun arrayNoDuplicates!0 (array!51324 (_ BitVec 32) List!17526) Bool)

(assert (=> b!880824 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17523)))

(declare-datatypes ((Unit!30072 0))(
  ( (Unit!30073) )
))
(declare-fun lt!398333 () Unit!30072)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51324 (_ BitVec 32) (_ BitVec 32)) Unit!30072)

(assert (=> b!880824 (= lt!398333 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880825 () Bool)

(declare-fun res!598470 () Bool)

(assert (=> b!880825 (=> (not res!598470) (not e!490166))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880825 (= res!598470 (and (= (select (arr!24686 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!598464 () Bool)

(assert (=> start!74706 (=> (not res!598464) (not e!490166))))

(assert (=> start!74706 (= res!598464 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25126 _keys!868))))))

(assert (=> start!74706 e!490166))

(declare-fun tp_is_empty!17599 () Bool)

(assert (=> start!74706 tp_is_empty!17599))

(assert (=> start!74706 true))

(assert (=> start!74706 tp!53753))

(declare-fun array_inv!19442 (array!51324) Bool)

(assert (=> start!74706 (array_inv!19442 _keys!868)))

(declare-fun e!490169 () Bool)

(declare-fun array_inv!19443 (array!51326) Bool)

(assert (=> start!74706 (and (array_inv!19443 _values!688) e!490169)))

(declare-fun b!880826 () Bool)

(declare-fun res!598465 () Bool)

(assert (=> b!880826 (=> (not res!598465) (not e!490166))))

(assert (=> b!880826 (= res!598465 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17523))))

(declare-fun b!880827 () Bool)

(declare-fun e!490170 () Bool)

(declare-fun mapRes!28020 () Bool)

(assert (=> b!880827 (= e!490169 (and e!490170 mapRes!28020))))

(declare-fun condMapEmpty!28020 () Bool)

(declare-fun mapDefault!28020 () ValueCell!8360)

