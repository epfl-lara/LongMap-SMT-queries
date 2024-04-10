; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78004 () Bool)

(assert start!78004)

(declare-fun b_free!16531 () Bool)

(declare-fun b_next!16531 () Bool)

(assert (=> start!78004 (= b_free!16531 (not b_next!16531))))

(declare-fun tp!57864 () Bool)

(declare-fun b_and!27103 () Bool)

(assert (=> start!78004 (= tp!57864 b_and!27103)))

(declare-fun b!910590 () Bool)

(declare-fun res!614449 () Bool)

(declare-fun e!510567 () Bool)

(assert (=> b!910590 (=> (not res!614449) (not e!510567))))

(declare-datatypes ((V!30231 0))(
  ( (V!30232 (val!9525 Int)) )
))
(declare-datatypes ((ValueCell!8993 0))(
  ( (ValueCellFull!8993 (v!12034 V!30231)) (EmptyCell!8993) )
))
(declare-datatypes ((array!53914 0))(
  ( (array!53915 (arr!25913 (Array (_ BitVec 32) ValueCell!8993)) (size!26372 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53914)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53916 0))(
  ( (array!53917 (arr!25914 (Array (_ BitVec 32) (_ BitVec 64))) (size!26373 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53916)

(assert (=> b!910590 (= res!614449 (and (= (size!26372 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26373 _keys!1386) (size!26372 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910591 () Bool)

(declare-fun res!614448 () Bool)

(assert (=> b!910591 (=> (not res!614448) (not e!510567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53916 (_ BitVec 32)) Bool)

(assert (=> b!910591 (= res!614448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910592 () Bool)

(declare-fun e!510570 () Bool)

(declare-fun e!510568 () Bool)

(declare-fun mapRes!30145 () Bool)

(assert (=> b!910592 (= e!510570 (and e!510568 mapRes!30145))))

(declare-fun condMapEmpty!30145 () Bool)

(declare-fun mapDefault!30145 () ValueCell!8993)

