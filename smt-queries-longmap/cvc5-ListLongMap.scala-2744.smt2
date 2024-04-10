; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40302 () Bool)

(assert start!40302)

(declare-fun b!442554 () Bool)

(declare-fun e!260470 () Bool)

(assert (=> b!442554 (= e!260470 false)))

(declare-fun lt!203216 () Bool)

(declare-datatypes ((array!27215 0))(
  ( (array!27216 (arr!13056 (Array (_ BitVec 32) (_ BitVec 64))) (size!13408 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27215)

(declare-datatypes ((List!7839 0))(
  ( (Nil!7836) (Cons!7835 (h!8691 (_ BitVec 64)) (t!13597 List!7839)) )
))
(declare-fun arrayNoDuplicates!0 (array!27215 (_ BitVec 32) List!7839) Bool)

(assert (=> b!442554 (= lt!203216 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7836))))

(declare-fun b!442555 () Bool)

(declare-fun e!260467 () Bool)

(declare-fun tp_is_empty!11701 () Bool)

(assert (=> b!442555 (= e!260467 tp_is_empty!11701)))

(declare-fun mapIsEmpty!19176 () Bool)

(declare-fun mapRes!19176 () Bool)

(assert (=> mapIsEmpty!19176 mapRes!19176))

(declare-fun b!442556 () Bool)

(declare-fun e!260468 () Bool)

(assert (=> b!442556 (= e!260468 tp_is_empty!11701)))

(declare-fun res!262121 () Bool)

(assert (=> start!40302 (=> (not res!262121) (not e!260470))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40302 (= res!262121 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13408 _keys!709))))))

(assert (=> start!40302 e!260470))

(assert (=> start!40302 true))

(declare-datatypes ((V!16707 0))(
  ( (V!16708 (val!5895 Int)) )
))
(declare-datatypes ((ValueCell!5507 0))(
  ( (ValueCellFull!5507 (v!8146 V!16707)) (EmptyCell!5507) )
))
(declare-datatypes ((array!27217 0))(
  ( (array!27218 (arr!13057 (Array (_ BitVec 32) ValueCell!5507)) (size!13409 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27217)

(declare-fun e!260469 () Bool)

(declare-fun array_inv!9472 (array!27217) Bool)

(assert (=> start!40302 (and (array_inv!9472 _values!549) e!260469)))

(declare-fun array_inv!9473 (array!27215) Bool)

(assert (=> start!40302 (array_inv!9473 _keys!709)))

(declare-fun b!442557 () Bool)

(declare-fun res!262122 () Bool)

(assert (=> b!442557 (=> (not res!262122) (not e!260470))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442557 (= res!262122 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19176 () Bool)

(declare-fun tp!37158 () Bool)

(assert (=> mapNonEmpty!19176 (= mapRes!19176 (and tp!37158 e!260468))))

(declare-fun mapKey!19176 () (_ BitVec 32))

(declare-fun mapValue!19176 () ValueCell!5507)

(declare-fun mapRest!19176 () (Array (_ BitVec 32) ValueCell!5507))

(assert (=> mapNonEmpty!19176 (= (arr!13057 _values!549) (store mapRest!19176 mapKey!19176 mapValue!19176))))

(declare-fun b!442558 () Bool)

(declare-fun res!262124 () Bool)

(assert (=> b!442558 (=> (not res!262124) (not e!260470))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442558 (= res!262124 (and (= (size!13409 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13408 _keys!709) (size!13409 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442559 () Bool)

(assert (=> b!442559 (= e!260469 (and e!260467 mapRes!19176))))

(declare-fun condMapEmpty!19176 () Bool)

(declare-fun mapDefault!19176 () ValueCell!5507)

