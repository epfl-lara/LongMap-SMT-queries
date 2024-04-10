; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77886 () Bool)

(assert start!77886)

(declare-fun b_free!16445 () Bool)

(declare-fun b_next!16445 () Bool)

(assert (=> start!77886 (= b_free!16445 (not b_next!16445))))

(declare-fun tp!57599 () Bool)

(declare-fun b_and!27013 () Bool)

(assert (=> start!77886 (= tp!57599 b_and!27013)))

(declare-fun b!909433 () Bool)

(declare-fun res!613809 () Bool)

(declare-fun e!509777 () Bool)

(assert (=> b!909433 (=> (not res!613809) (not e!509777))))

(declare-datatypes ((V!30115 0))(
  ( (V!30116 (val!9482 Int)) )
))
(declare-datatypes ((ValueCell!8950 0))(
  ( (ValueCellFull!8950 (v!11989 V!30115)) (EmptyCell!8950) )
))
(declare-datatypes ((array!53752 0))(
  ( (array!53753 (arr!25834 (Array (_ BitVec 32) ValueCell!8950)) (size!26293 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53752)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53754 0))(
  ( (array!53755 (arr!25835 (Array (_ BitVec 32) (_ BitVec 64))) (size!26294 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53754)

(assert (=> b!909433 (= res!613809 (and (= (size!26293 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26294 _keys!1386) (size!26293 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909434 () Bool)

(declare-fun res!613808 () Bool)

(assert (=> b!909434 (=> (not res!613808) (not e!509777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53754 (_ BitVec 32)) Bool)

(assert (=> b!909434 (= res!613808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909435 () Bool)

(declare-fun e!509779 () Bool)

(declare-fun tp_is_empty!18863 () Bool)

(assert (=> b!909435 (= e!509779 tp_is_empty!18863)))

(declare-fun mapIsEmpty!30010 () Bool)

(declare-fun mapRes!30010 () Bool)

(assert (=> mapIsEmpty!30010 mapRes!30010))

(declare-fun mapNonEmpty!30010 () Bool)

(declare-fun tp!57600 () Bool)

(assert (=> mapNonEmpty!30010 (= mapRes!30010 (and tp!57600 e!509779))))

(declare-fun mapRest!30010 () (Array (_ BitVec 32) ValueCell!8950))

(declare-fun mapKey!30010 () (_ BitVec 32))

(declare-fun mapValue!30010 () ValueCell!8950)

(assert (=> mapNonEmpty!30010 (= (arr!25834 _values!1152) (store mapRest!30010 mapKey!30010 mapValue!30010))))

(declare-fun b!909437 () Bool)

(declare-fun e!509778 () Bool)

(declare-fun e!509781 () Bool)

(assert (=> b!909437 (= e!509778 (and e!509781 mapRes!30010))))

(declare-fun condMapEmpty!30010 () Bool)

(declare-fun mapDefault!30010 () ValueCell!8950)

