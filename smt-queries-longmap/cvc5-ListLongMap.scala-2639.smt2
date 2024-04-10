; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39652 () Bool)

(assert start!39652)

(declare-fun b_free!9919 () Bool)

(declare-fun b_next!9919 () Bool)

(assert (=> start!39652 (= b_free!9919 (not b_next!9919))))

(declare-fun tp!35285 () Bool)

(declare-fun b_and!17575 () Bool)

(assert (=> start!39652 (= tp!35285 b_and!17575)))

(declare-fun b!425471 () Bool)

(declare-fun res!249112 () Bool)

(declare-fun e!252577 () Bool)

(assert (=> b!425471 (=> (not res!249112) (not e!252577))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425471 (= res!249112 (bvsle from!863 i!563))))

(declare-fun b!425472 () Bool)

(declare-fun e!252578 () Bool)

(assert (=> b!425472 (= e!252578 e!252577)))

(declare-fun res!249111 () Bool)

(assert (=> b!425472 (=> (not res!249111) (not e!252577))))

(declare-datatypes ((array!25981 0))(
  ( (array!25982 (arr!12440 (Array (_ BitVec 32) (_ BitVec 64))) (size!12792 (_ BitVec 32))) )
))
(declare-fun lt!194663 () array!25981)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25981 (_ BitVec 32)) Bool)

(assert (=> b!425472 (= res!249111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194663 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun _keys!709 () array!25981)

(assert (=> b!425472 (= lt!194663 (array!25982 (store (arr!12440 _keys!709) i!563 k!794) (size!12792 _keys!709)))))

(declare-fun b!425473 () Bool)

(declare-fun e!252581 () Bool)

(declare-fun tp_is_empty!11071 () Bool)

(assert (=> b!425473 (= e!252581 tp_is_empty!11071)))

(declare-fun b!425474 () Bool)

(declare-fun res!249121 () Bool)

(assert (=> b!425474 (=> (not res!249121) (not e!252578))))

(assert (=> b!425474 (= res!249121 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12792 _keys!709))))))

(declare-fun b!425475 () Bool)

(declare-fun res!249115 () Bool)

(assert (=> b!425475 (=> (not res!249115) (not e!252578))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15867 0))(
  ( (V!15868 (val!5580 Int)) )
))
(declare-datatypes ((ValueCell!5192 0))(
  ( (ValueCellFull!5192 (v!7827 V!15867)) (EmptyCell!5192) )
))
(declare-datatypes ((array!25983 0))(
  ( (array!25984 (arr!12441 (Array (_ BitVec 32) ValueCell!5192)) (size!12793 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25983)

(assert (=> b!425475 (= res!249115 (and (= (size!12793 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12792 _keys!709) (size!12793 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425476 () Bool)

(declare-fun e!252579 () Bool)

(declare-fun e!252580 () Bool)

(declare-fun mapRes!18228 () Bool)

(assert (=> b!425476 (= e!252579 (and e!252580 mapRes!18228))))

(declare-fun condMapEmpty!18228 () Bool)

(declare-fun mapDefault!18228 () ValueCell!5192)

