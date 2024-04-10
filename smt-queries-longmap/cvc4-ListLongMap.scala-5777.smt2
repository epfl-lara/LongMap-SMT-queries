; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74568 () Bool)

(assert start!74568)

(declare-fun b_free!15257 () Bool)

(declare-fun b_next!15257 () Bool)

(assert (=> start!74568 (= b_free!15257 (not b_next!15257))))

(declare-fun tp!53452 () Bool)

(declare-fun b_and!25133 () Bool)

(assert (=> start!74568 (= tp!53452 b_and!25133)))

(declare-fun mapIsEmpty!27867 () Bool)

(declare-fun mapRes!27867 () Bool)

(assert (=> mapIsEmpty!27867 mapRes!27867))

(declare-fun b!878576 () Bool)

(declare-fun res!596884 () Bool)

(declare-fun e!488961 () Bool)

(assert (=> b!878576 (=> (not res!596884) (not e!488961))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878576 (= res!596884 (validMask!0 mask!1196))))

(declare-fun b!878577 () Bool)

(declare-fun res!596883 () Bool)

(assert (=> b!878577 (=> (not res!596883) (not e!488961))))

(declare-datatypes ((array!51128 0))(
  ( (array!51129 (arr!24590 (Array (_ BitVec 32) (_ BitVec 64))) (size!25030 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51128)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51128 (_ BitVec 32)) Bool)

(assert (=> b!878577 (= res!596883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878578 () Bool)

(declare-fun res!596887 () Bool)

(assert (=> b!878578 (=> (not res!596887) (not e!488961))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878578 (= res!596887 (validKeyInArray!0 k!854))))

(declare-fun b!878579 () Bool)

(declare-fun res!596882 () Bool)

(assert (=> b!878579 (=> (not res!596882) (not e!488961))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878579 (= res!596882 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25030 _keys!868))))))

(declare-fun b!878580 () Bool)

(declare-fun e!488963 () Bool)

(declare-fun e!488965 () Bool)

(assert (=> b!878580 (= e!488963 (and e!488965 mapRes!27867))))

(declare-fun condMapEmpty!27867 () Bool)

(declare-datatypes ((V!28381 0))(
  ( (V!28382 (val!8798 Int)) )
))
(declare-datatypes ((ValueCell!8311 0))(
  ( (ValueCellFull!8311 (v!11238 V!28381)) (EmptyCell!8311) )
))
(declare-datatypes ((array!51130 0))(
  ( (array!51131 (arr!24591 (Array (_ BitVec 32) ValueCell!8311)) (size!25031 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51130)

(declare-fun mapDefault!27867 () ValueCell!8311)

