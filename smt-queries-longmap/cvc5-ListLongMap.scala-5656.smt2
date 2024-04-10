; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73720 () Bool)

(assert start!73720)

(declare-fun b_free!14635 () Bool)

(declare-fun b_next!14635 () Bool)

(assert (=> start!73720 (= b_free!14635 (not b_next!14635))))

(declare-fun tp!51408 () Bool)

(declare-fun b_and!24249 () Bool)

(assert (=> start!73720 (= tp!51408 b_and!24249)))

(declare-fun b!864125 () Bool)

(declare-fun res!587186 () Bool)

(declare-fun e!481402 () Bool)

(assert (=> b!864125 (=> (not res!587186) (not e!481402))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49704 0))(
  ( (array!49705 (arr!23883 (Array (_ BitVec 32) (_ BitVec 64))) (size!24323 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49704)

(declare-datatypes ((V!27409 0))(
  ( (V!27410 (val!8433 Int)) )
))
(declare-datatypes ((ValueCell!7946 0))(
  ( (ValueCellFull!7946 (v!10858 V!27409)) (EmptyCell!7946) )
))
(declare-datatypes ((array!49706 0))(
  ( (array!49707 (arr!23884 (Array (_ BitVec 32) ValueCell!7946)) (size!24324 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49706)

(assert (=> b!864125 (= res!587186 (and (= (size!24324 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24323 _keys!868) (size!24324 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864126 () Bool)

(declare-fun e!481398 () Bool)

(declare-fun e!481404 () Bool)

(declare-fun mapRes!26756 () Bool)

(assert (=> b!864126 (= e!481398 (and e!481404 mapRes!26756))))

(declare-fun condMapEmpty!26756 () Bool)

(declare-fun mapDefault!26756 () ValueCell!7946)

