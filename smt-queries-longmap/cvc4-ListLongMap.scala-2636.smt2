; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39638 () Bool)

(assert start!39638)

(declare-fun b_free!9905 () Bool)

(declare-fun b_next!9905 () Bool)

(assert (=> start!39638 (= b_free!9905 (not b_next!9905))))

(declare-fun tp!35244 () Bool)

(declare-fun b_and!17561 () Bool)

(assert (=> start!39638 (= tp!35244 b_and!17561)))

(declare-fun b!425135 () Bool)

(declare-fun e!252432 () Bool)

(declare-fun e!252433 () Bool)

(assert (=> b!425135 (= e!252432 e!252433)))

(declare-fun res!248840 () Bool)

(assert (=> b!425135 (=> (not res!248840) (not e!252433))))

(declare-datatypes ((array!25953 0))(
  ( (array!25954 (arr!12426 (Array (_ BitVec 32) (_ BitVec 64))) (size!12778 (_ BitVec 32))) )
))
(declare-fun lt!194556 () array!25953)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25953 (_ BitVec 32)) Bool)

(assert (=> b!425135 (= res!248840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194556 mask!1025))))

(declare-fun _keys!709 () array!25953)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425135 (= lt!194556 (array!25954 (store (arr!12426 _keys!709) i!563 k!794) (size!12778 _keys!709)))))

(declare-fun b!425136 () Bool)

(declare-fun res!248839 () Bool)

(assert (=> b!425136 (=> (not res!248839) (not e!252432))))

(assert (=> b!425136 (= res!248839 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12778 _keys!709))))))

(declare-fun b!425137 () Bool)

(declare-fun res!248848 () Bool)

(assert (=> b!425137 (=> (not res!248848) (not e!252432))))

(declare-fun arrayContainsKey!0 (array!25953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425137 (= res!248848 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425138 () Bool)

(declare-fun e!252429 () Bool)

(declare-fun e!252431 () Bool)

(declare-fun mapRes!18207 () Bool)

(assert (=> b!425138 (= e!252429 (and e!252431 mapRes!18207))))

(declare-fun condMapEmpty!18207 () Bool)

(declare-datatypes ((V!15847 0))(
  ( (V!15848 (val!5573 Int)) )
))
(declare-datatypes ((ValueCell!5185 0))(
  ( (ValueCellFull!5185 (v!7820 V!15847)) (EmptyCell!5185) )
))
(declare-datatypes ((array!25955 0))(
  ( (array!25956 (arr!12427 (Array (_ BitVec 32) ValueCell!5185)) (size!12779 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25955)

(declare-fun mapDefault!18207 () ValueCell!5185)

