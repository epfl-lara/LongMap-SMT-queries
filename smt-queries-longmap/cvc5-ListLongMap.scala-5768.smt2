; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74510 () Bool)

(assert start!74510)

(declare-fun b_free!15199 () Bool)

(declare-fun b_next!15199 () Bool)

(assert (=> start!74510 (= b_free!15199 (not b_next!15199))))

(declare-fun tp!53278 () Bool)

(declare-fun b_and!25075 () Bool)

(assert (=> start!74510 (= tp!53278 b_and!25075)))

(declare-fun b!877619 () Bool)

(declare-fun res!596192 () Bool)

(declare-fun e!488526 () Bool)

(assert (=> b!877619 (=> (not res!596192) (not e!488526))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51014 0))(
  ( (array!51015 (arr!24533 (Array (_ BitVec 32) (_ BitVec 64))) (size!24973 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51014)

(assert (=> b!877619 (= res!596192 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24973 _keys!868))))))

(declare-fun b!877620 () Bool)

(declare-fun e!488527 () Bool)

(declare-fun e!488528 () Bool)

(declare-fun mapRes!27780 () Bool)

(assert (=> b!877620 (= e!488527 (and e!488528 mapRes!27780))))

(declare-fun condMapEmpty!27780 () Bool)

(declare-datatypes ((V!28305 0))(
  ( (V!28306 (val!8769 Int)) )
))
(declare-datatypes ((ValueCell!8282 0))(
  ( (ValueCellFull!8282 (v!11209 V!28305)) (EmptyCell!8282) )
))
(declare-datatypes ((array!51016 0))(
  ( (array!51017 (arr!24534 (Array (_ BitVec 32) ValueCell!8282)) (size!24974 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51016)

(declare-fun mapDefault!27780 () ValueCell!8282)

