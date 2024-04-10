; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73346 () Bool)

(assert start!73346)

(declare-fun b_free!14261 () Bool)

(declare-fun b_next!14261 () Bool)

(assert (=> start!73346 (= b_free!14261 (not b_next!14261))))

(declare-fun tp!50286 () Bool)

(declare-fun b_and!23617 () Bool)

(assert (=> start!73346 (= tp!50286 b_and!23617)))

(declare-fun b!855832 () Bool)

(declare-fun res!581249 () Bool)

(declare-fun e!477099 () Bool)

(assert (=> b!855832 (=> (not res!581249) (not e!477099))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48990 0))(
  ( (array!48991 (arr!23526 (Array (_ BitVec 32) (_ BitVec 64))) (size!23966 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48990)

(declare-datatypes ((V!26909 0))(
  ( (V!26910 (val!8246 Int)) )
))
(declare-datatypes ((ValueCell!7759 0))(
  ( (ValueCellFull!7759 (v!10671 V!26909)) (EmptyCell!7759) )
))
(declare-datatypes ((array!48992 0))(
  ( (array!48993 (arr!23527 (Array (_ BitVec 32) ValueCell!7759)) (size!23967 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48992)

(assert (=> b!855832 (= res!581249 (and (= (size!23967 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23966 _keys!868) (size!23967 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855833 () Bool)

(declare-fun res!581247 () Bool)

(assert (=> b!855833 (=> (not res!581247) (not e!477099))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855833 (= res!581247 (and (= (select (arr!23526 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!855834 () Bool)

(declare-fun e!477102 () Bool)

(declare-fun e!477100 () Bool)

(declare-fun mapRes!26195 () Bool)

(assert (=> b!855834 (= e!477102 (and e!477100 mapRes!26195))))

(declare-fun condMapEmpty!26195 () Bool)

(declare-fun mapDefault!26195 () ValueCell!7759)

