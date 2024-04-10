; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37574 () Bool)

(assert start!37574)

(declare-fun b_free!8701 () Bool)

(declare-fun b_next!8701 () Bool)

(assert (=> start!37574 (= b_free!8701 (not b_next!8701))))

(declare-fun tp!30819 () Bool)

(declare-fun b_and!15943 () Bool)

(assert (=> start!37574 (= tp!30819 b_and!15943)))

(declare-fun b!383998 () Bool)

(declare-fun e!233180 () Bool)

(declare-fun e!233183 () Bool)

(assert (=> b!383998 (= e!233180 e!233183)))

(declare-fun res!218758 () Bool)

(assert (=> b!383998 (=> (not res!218758) (not e!233183))))

(declare-datatypes ((array!22603 0))(
  ( (array!22604 (arr!10770 (Array (_ BitVec 32) (_ BitVec 64))) (size!11122 (_ BitVec 32))) )
))
(declare-fun lt!180559 () array!22603)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22603 (_ BitVec 32)) Bool)

(assert (=> b!383998 (= res!218758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180559 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22603)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383998 (= lt!180559 (array!22604 (store (arr!10770 _keys!658) i!548 k!778) (size!11122 _keys!658)))))

(declare-fun mapNonEmpty!15588 () Bool)

(declare-fun mapRes!15588 () Bool)

(declare-fun tp!30818 () Bool)

(declare-fun e!233182 () Bool)

(assert (=> mapNonEmpty!15588 (= mapRes!15588 (and tp!30818 e!233182))))

(declare-datatypes ((V!13571 0))(
  ( (V!13572 (val!4719 Int)) )
))
(declare-datatypes ((ValueCell!4331 0))(
  ( (ValueCellFull!4331 (v!6916 V!13571)) (EmptyCell!4331) )
))
(declare-datatypes ((array!22605 0))(
  ( (array!22606 (arr!10771 (Array (_ BitVec 32) ValueCell!4331)) (size!11123 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22605)

(declare-fun mapRest!15588 () (Array (_ BitVec 32) ValueCell!4331))

(declare-fun mapKey!15588 () (_ BitVec 32))

(declare-fun mapValue!15588 () ValueCell!4331)

(assert (=> mapNonEmpty!15588 (= (arr!10771 _values!506) (store mapRest!15588 mapKey!15588 mapValue!15588))))

(declare-fun res!218754 () Bool)

(assert (=> start!37574 (=> (not res!218754) (not e!233180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37574 (= res!218754 (validMask!0 mask!970))))

(assert (=> start!37574 e!233180))

(declare-fun e!233185 () Bool)

(declare-fun array_inv!7926 (array!22605) Bool)

(assert (=> start!37574 (and (array_inv!7926 _values!506) e!233185)))

(assert (=> start!37574 tp!30819))

(assert (=> start!37574 true))

(declare-fun tp_is_empty!9349 () Bool)

(assert (=> start!37574 tp_is_empty!9349))

(declare-fun array_inv!7927 (array!22603) Bool)

(assert (=> start!37574 (array_inv!7927 _keys!658)))

(declare-fun b!383999 () Bool)

(declare-fun res!218757 () Bool)

(assert (=> b!383999 (=> (not res!218757) (not e!233180))))

(declare-fun arrayContainsKey!0 (array!22603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383999 (= res!218757 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384000 () Bool)

(declare-fun e!233184 () Bool)

(assert (=> b!384000 (= e!233185 (and e!233184 mapRes!15588))))

(declare-fun condMapEmpty!15588 () Bool)

(declare-fun mapDefault!15588 () ValueCell!4331)

