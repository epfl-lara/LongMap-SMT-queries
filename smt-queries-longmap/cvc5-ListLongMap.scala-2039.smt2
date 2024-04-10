; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35402 () Bool)

(assert start!35402)

(declare-fun b!354404 () Bool)

(declare-fun e!217208 () Bool)

(declare-fun tp_is_empty!7855 () Bool)

(assert (=> b!354404 (= e!217208 tp_is_empty!7855)))

(declare-fun b!354405 () Bool)

(declare-fun res!196462 () Bool)

(declare-fun e!217210 () Bool)

(assert (=> b!354405 (=> (not res!196462) (not e!217210))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19293 0))(
  ( (array!19294 (arr!9140 (Array (_ BitVec 32) (_ BitVec 64))) (size!9492 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19293)

(declare-datatypes ((V!11451 0))(
  ( (V!11452 (val!3972 Int)) )
))
(declare-datatypes ((ValueCell!3584 0))(
  ( (ValueCellFull!3584 (v!6166 V!11451)) (EmptyCell!3584) )
))
(declare-datatypes ((array!19295 0))(
  ( (array!19296 (arr!9141 (Array (_ BitVec 32) ValueCell!3584)) (size!9493 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19295)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354405 (= res!196462 (and (= (size!9493 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9492 _keys!1456) (size!9493 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13290 () Bool)

(declare-fun mapRes!13290 () Bool)

(assert (=> mapIsEmpty!13290 mapRes!13290))

(declare-fun b!354407 () Bool)

(declare-fun e!217207 () Bool)

(assert (=> b!354407 (= e!217207 tp_is_empty!7855)))

(declare-fun b!354408 () Bool)

(declare-fun e!217209 () Bool)

(assert (=> b!354408 (= e!217209 (and e!217208 mapRes!13290))))

(declare-fun condMapEmpty!13290 () Bool)

(declare-fun mapDefault!13290 () ValueCell!3584)

