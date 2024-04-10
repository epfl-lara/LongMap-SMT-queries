; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78122 () Bool)

(assert start!78122)

(declare-fun b_free!16633 () Bool)

(declare-fun b_next!16633 () Bool)

(assert (=> start!78122 (= b_free!16633 (not b_next!16633))))

(declare-fun tp!58173 () Bool)

(declare-fun b_and!27207 () Bool)

(assert (=> start!78122 (= tp!58173 b_and!27207)))

(declare-fun mapIsEmpty!30301 () Bool)

(declare-fun mapRes!30301 () Bool)

(assert (=> mapIsEmpty!30301 mapRes!30301))

(declare-fun b!911788 () Bool)

(declare-fun e!511404 () Bool)

(declare-fun tp_is_empty!19051 () Bool)

(assert (=> b!911788 (= e!511404 tp_is_empty!19051)))

(declare-fun b!911789 () Bool)

(declare-fun res!615126 () Bool)

(declare-fun e!511403 () Bool)

(assert (=> b!911789 (=> (not res!615126) (not e!511403))))

(declare-datatypes ((array!54102 0))(
  ( (array!54103 (arr!26006 (Array (_ BitVec 32) (_ BitVec 64))) (size!26465 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54102)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54102 (_ BitVec 32)) Bool)

(assert (=> b!911789 (= res!615126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30301 () Bool)

(declare-fun tp!58172 () Bool)

(declare-fun e!511407 () Bool)

(assert (=> mapNonEmpty!30301 (= mapRes!30301 (and tp!58172 e!511407))))

(declare-datatypes ((V!30367 0))(
  ( (V!30368 (val!9576 Int)) )
))
(declare-datatypes ((ValueCell!9044 0))(
  ( (ValueCellFull!9044 (v!12086 V!30367)) (EmptyCell!9044) )
))
(declare-datatypes ((array!54104 0))(
  ( (array!54105 (arr!26007 (Array (_ BitVec 32) ValueCell!9044)) (size!26466 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54104)

(declare-fun mapValue!30301 () ValueCell!9044)

(declare-fun mapKey!30301 () (_ BitVec 32))

(declare-fun mapRest!30301 () (Array (_ BitVec 32) ValueCell!9044))

(assert (=> mapNonEmpty!30301 (= (arr!26007 _values!1152) (store mapRest!30301 mapKey!30301 mapValue!30301))))

(declare-fun b!911790 () Bool)

(declare-fun e!511406 () Bool)

(assert (=> b!911790 (= e!511406 (and e!511404 mapRes!30301))))

(declare-fun condMapEmpty!30301 () Bool)

(declare-fun mapDefault!30301 () ValueCell!9044)

