; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72914 () Bool)

(assert start!72914)

(declare-fun b_free!13829 () Bool)

(declare-fun b_next!13829 () Bool)

(assert (=> start!72914 (= b_free!13829 (not b_next!13829))))

(declare-fun tp!48990 () Bool)

(declare-fun b_and!22915 () Bool)

(assert (=> start!72914 (= tp!48990 b_and!22915)))

(declare-fun b!846562 () Bool)

(declare-fun res!575163 () Bool)

(declare-fun e!472473 () Bool)

(assert (=> b!846562 (=> (not res!575163) (not e!472473))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48142 0))(
  ( (array!48143 (arr!23102 (Array (_ BitVec 32) (_ BitVec 64))) (size!23542 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48142)

(declare-datatypes ((V!26333 0))(
  ( (V!26334 (val!8030 Int)) )
))
(declare-datatypes ((ValueCell!7543 0))(
  ( (ValueCellFull!7543 (v!10455 V!26333)) (EmptyCell!7543) )
))
(declare-datatypes ((array!48144 0))(
  ( (array!48145 (arr!23103 (Array (_ BitVec 32) ValueCell!7543)) (size!23543 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48144)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!846562 (= res!575163 (and (= (size!23543 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23542 _keys!868) (size!23543 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846563 () Bool)

(declare-fun e!472474 () Bool)

(declare-fun tp_is_empty!15965 () Bool)

(assert (=> b!846563 (= e!472474 tp_is_empty!15965)))

(declare-fun b!846564 () Bool)

(declare-fun res!575159 () Bool)

(assert (=> b!846564 (=> (not res!575159) (not e!472473))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846564 (= res!575159 (and (= (select (arr!23102 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25547 () Bool)

(declare-fun mapRes!25547 () Bool)

(assert (=> mapIsEmpty!25547 mapRes!25547))

(declare-fun b!846565 () Bool)

(declare-fun e!472477 () Bool)

(assert (=> b!846565 (= e!472477 (and e!472474 mapRes!25547))))

(declare-fun condMapEmpty!25547 () Bool)

(declare-fun mapDefault!25547 () ValueCell!7543)

