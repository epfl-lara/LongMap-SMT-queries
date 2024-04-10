; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20536 () Bool)

(assert start!20536)

(declare-fun b_free!5195 () Bool)

(declare-fun b_next!5195 () Bool)

(assert (=> start!20536 (= b_free!5195 (not b_next!5195))))

(declare-fun tp!18617 () Bool)

(declare-fun b_and!11941 () Bool)

(assert (=> start!20536 (= tp!18617 b_and!11941)))

(declare-fun b!204147 () Bool)

(declare-fun res!98285 () Bool)

(declare-fun e!133600 () Bool)

(assert (=> b!204147 (=> (not res!98285) (not e!133600))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9321 0))(
  ( (array!9322 (arr!4411 (Array (_ BitVec 32) (_ BitVec 64))) (size!4736 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9321)

(assert (=> b!204147 (= res!98285 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4736 _keys!825))))))

(declare-fun b!204148 () Bool)

(declare-fun res!98289 () Bool)

(assert (=> b!204148 (=> (not res!98289) (not e!133600))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!204148 (= res!98289 (= (select (arr!4411 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8645 () Bool)

(declare-fun mapRes!8645 () Bool)

(declare-fun tp!18616 () Bool)

(declare-fun e!133595 () Bool)

(assert (=> mapNonEmpty!8645 (= mapRes!8645 (and tp!18616 e!133595))))

(declare-fun mapKey!8645 () (_ BitVec 32))

(declare-datatypes ((V!6381 0))(
  ( (V!6382 (val!2570 Int)) )
))
(declare-datatypes ((ValueCell!2182 0))(
  ( (ValueCellFull!2182 (v!4540 V!6381)) (EmptyCell!2182) )
))
(declare-fun mapRest!8645 () (Array (_ BitVec 32) ValueCell!2182))

(declare-datatypes ((array!9323 0))(
  ( (array!9324 (arr!4412 (Array (_ BitVec 32) ValueCell!2182)) (size!4737 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9323)

(declare-fun mapValue!8645 () ValueCell!2182)

(assert (=> mapNonEmpty!8645 (= (arr!4412 _values!649) (store mapRest!8645 mapKey!8645 mapValue!8645))))

(declare-fun b!204149 () Bool)

(declare-fun res!98287 () Bool)

(assert (=> b!204149 (=> (not res!98287) (not e!133600))))

(declare-datatypes ((List!2799 0))(
  ( (Nil!2796) (Cons!2795 (h!3437 (_ BitVec 64)) (t!7730 List!2799)) )
))
(declare-fun arrayNoDuplicates!0 (array!9321 (_ BitVec 32) List!2799) Bool)

(assert (=> b!204149 (= res!98287 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2796))))

(declare-fun b!204150 () Bool)

(declare-fun res!98290 () Bool)

(assert (=> b!204150 (=> (not res!98290) (not e!133600))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9321 (_ BitVec 32)) Bool)

(assert (=> b!204150 (= res!98290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204151 () Bool)

(declare-fun e!133597 () Bool)

(declare-fun e!133599 () Bool)

(assert (=> b!204151 (= e!133597 (and e!133599 mapRes!8645))))

(declare-fun condMapEmpty!8645 () Bool)

(declare-fun mapDefault!8645 () ValueCell!2182)

