; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72944 () Bool)

(assert start!72944)

(declare-fun b_free!13859 () Bool)

(declare-fun b_next!13859 () Bool)

(assert (=> start!72944 (= b_free!13859 (not b_next!13859))))

(declare-fun tp!49081 () Bool)

(declare-fun b_and!22945 () Bool)

(assert (=> start!72944 (= tp!49081 b_and!22945)))

(declare-fun b!847057 () Bool)

(declare-fun res!575522 () Bool)

(declare-fun e!472700 () Bool)

(assert (=> b!847057 (=> (not res!575522) (not e!472700))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48202 0))(
  ( (array!48203 (arr!23132 (Array (_ BitVec 32) (_ BitVec 64))) (size!23572 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48202)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!847057 (= res!575522 (and (= (select (arr!23132 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!575525 () Bool)

(assert (=> start!72944 (=> (not res!575525) (not e!472700))))

(assert (=> start!72944 (= res!575525 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23572 _keys!868))))))

(assert (=> start!72944 e!472700))

(declare-fun tp_is_empty!15995 () Bool)

(assert (=> start!72944 tp_is_empty!15995))

(assert (=> start!72944 true))

(assert (=> start!72944 tp!49081))

(declare-fun array_inv!18372 (array!48202) Bool)

(assert (=> start!72944 (array_inv!18372 _keys!868)))

(declare-datatypes ((V!26373 0))(
  ( (V!26374 (val!8045 Int)) )
))
(declare-datatypes ((ValueCell!7558 0))(
  ( (ValueCellFull!7558 (v!10470 V!26373)) (EmptyCell!7558) )
))
(declare-datatypes ((array!48204 0))(
  ( (array!48205 (arr!23133 (Array (_ BitVec 32) ValueCell!7558)) (size!23573 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48204)

(declare-fun e!472698 () Bool)

(declare-fun array_inv!18373 (array!48204) Bool)

(assert (=> start!72944 (and (array_inv!18373 _values!688) e!472698)))

(declare-fun b!847058 () Bool)

(declare-fun e!472699 () Bool)

(declare-fun mapRes!25592 () Bool)

(assert (=> b!847058 (= e!472698 (and e!472699 mapRes!25592))))

(declare-fun condMapEmpty!25592 () Bool)

(declare-fun mapDefault!25592 () ValueCell!7558)

