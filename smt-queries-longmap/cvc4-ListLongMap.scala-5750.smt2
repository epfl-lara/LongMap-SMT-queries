; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74332 () Bool)

(assert start!74332)

(declare-fun b_free!15095 () Bool)

(declare-fun b_next!15095 () Bool)

(assert (=> start!74332 (= b_free!15095 (not b_next!15095))))

(declare-fun tp!52960 () Bool)

(declare-fun b_and!24871 () Bool)

(assert (=> start!74332 (= tp!52960 b_and!24871)))

(declare-fun b!874742 () Bool)

(declare-fun res!594474 () Bool)

(declare-fun e!487006 () Bool)

(assert (=> b!874742 (=> (not res!594474) (not e!487006))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50806 0))(
  ( (array!50807 (arr!24431 (Array (_ BitVec 32) (_ BitVec 64))) (size!24871 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50806)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874742 (= res!594474 (and (= (select (arr!24431 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874743 () Bool)

(declare-fun res!594468 () Bool)

(assert (=> b!874743 (=> (not res!594468) (not e!487006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874743 (= res!594468 (validKeyInArray!0 k!854))))

(declare-fun b!874744 () Bool)

(declare-fun res!594470 () Bool)

(assert (=> b!874744 (=> (not res!594470) (not e!487006))))

(assert (=> b!874744 (= res!594470 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24871 _keys!868))))))

(declare-fun b!874745 () Bool)

(declare-fun res!594467 () Bool)

(assert (=> b!874745 (=> (not res!594467) (not e!487006))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50806 (_ BitVec 32)) Bool)

(assert (=> b!874745 (= res!594467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!594471 () Bool)

(assert (=> start!74332 (=> (not res!594471) (not e!487006))))

(assert (=> start!74332 (= res!594471 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24871 _keys!868))))))

(assert (=> start!74332 e!487006))

(declare-fun tp_is_empty!17339 () Bool)

(assert (=> start!74332 tp_is_empty!17339))

(assert (=> start!74332 true))

(assert (=> start!74332 tp!52960))

(declare-fun array_inv!19266 (array!50806) Bool)

(assert (=> start!74332 (array_inv!19266 _keys!868)))

(declare-datatypes ((V!28165 0))(
  ( (V!28166 (val!8717 Int)) )
))
(declare-datatypes ((ValueCell!8230 0))(
  ( (ValueCellFull!8230 (v!11146 V!28165)) (EmptyCell!8230) )
))
(declare-datatypes ((array!50808 0))(
  ( (array!50809 (arr!24432 (Array (_ BitVec 32) ValueCell!8230)) (size!24872 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50808)

(declare-fun e!487010 () Bool)

(declare-fun array_inv!19267 (array!50808) Bool)

(assert (=> start!74332 (and (array_inv!19267 _values!688) e!487010)))

(declare-fun b!874746 () Bool)

(declare-fun e!487008 () Bool)

(declare-fun mapRes!27617 () Bool)

(assert (=> b!874746 (= e!487010 (and e!487008 mapRes!27617))))

(declare-fun condMapEmpty!27617 () Bool)

(declare-fun mapDefault!27617 () ValueCell!8230)

