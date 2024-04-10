; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73298 () Bool)

(assert start!73298)

(declare-fun b_free!14213 () Bool)

(declare-fun b_next!14213 () Bool)

(assert (=> start!73298 (= b_free!14213 (not b_next!14213))))

(declare-fun tp!50143 () Bool)

(declare-fun b_and!23569 () Bool)

(assert (=> start!73298 (= tp!50143 b_and!23569)))

(declare-fun b!855040 () Bool)

(declare-fun res!580671 () Bool)

(declare-fun e!476742 () Bool)

(assert (=> b!855040 (=> (not res!580671) (not e!476742))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48894 0))(
  ( (array!48895 (arr!23478 (Array (_ BitVec 32) (_ BitVec 64))) (size!23918 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48894)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855040 (= res!580671 (and (= (select (arr!23478 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855041 () Bool)

(declare-fun e!476739 () Bool)

(declare-fun e!476743 () Bool)

(declare-fun mapRes!26123 () Bool)

(assert (=> b!855041 (= e!476739 (and e!476743 mapRes!26123))))

(declare-fun condMapEmpty!26123 () Bool)

(declare-datatypes ((V!26845 0))(
  ( (V!26846 (val!8222 Int)) )
))
(declare-datatypes ((ValueCell!7735 0))(
  ( (ValueCellFull!7735 (v!10647 V!26845)) (EmptyCell!7735) )
))
(declare-datatypes ((array!48896 0))(
  ( (array!48897 (arr!23479 (Array (_ BitVec 32) ValueCell!7735)) (size!23919 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48896)

(declare-fun mapDefault!26123 () ValueCell!7735)

