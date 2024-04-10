; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7416 () Bool)

(assert start!7416)

(declare-fun mapNonEmpty!2123 () Bool)

(declare-fun mapRes!2123 () Bool)

(declare-fun tp!6272 () Bool)

(declare-fun e!30534 () Bool)

(assert (=> mapNonEmpty!2123 (= mapRes!2123 (and tp!6272 e!30534))))

(declare-datatypes ((V!2471 0))(
  ( (V!2472 (val!1065 Int)) )
))
(declare-datatypes ((ValueCell!737 0))(
  ( (ValueCellFull!737 (v!2126 V!2471)) (EmptyCell!737) )
))
(declare-fun mapRest!2123 () (Array (_ BitVec 32) ValueCell!737))

(declare-datatypes ((array!3169 0))(
  ( (array!3170 (arr!1519 (Array (_ BitVec 32) ValueCell!737)) (size!1741 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3169)

(declare-fun mapKey!2123 () (_ BitVec 32))

(declare-fun mapValue!2123 () ValueCell!737)

(assert (=> mapNonEmpty!2123 (= (arr!1519 _values!1550) (store mapRest!2123 mapKey!2123 mapValue!2123))))

(declare-fun b!47650 () Bool)

(declare-fun res!27719 () Bool)

(declare-fun e!30537 () Bool)

(assert (=> b!47650 (=> (not res!27719) (not e!30537))))

(declare-datatypes ((array!3171 0))(
  ( (array!3172 (arr!1520 (Array (_ BitVec 32) (_ BitVec 64))) (size!1742 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3171)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3171 (_ BitVec 32)) Bool)

(assert (=> b!47650 (= res!27719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47651 () Bool)

(declare-fun e!30535 () Bool)

(declare-fun tp_is_empty!2053 () Bool)

(assert (=> b!47651 (= e!30535 tp_is_empty!2053)))

(declare-fun b!47652 () Bool)

(declare-fun e!30538 () Bool)

(assert (=> b!47652 (= e!30538 (and e!30535 mapRes!2123))))

(declare-fun condMapEmpty!2123 () Bool)

(declare-fun mapDefault!2123 () ValueCell!737)

