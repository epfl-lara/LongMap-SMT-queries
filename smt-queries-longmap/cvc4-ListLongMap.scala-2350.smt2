; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37566 () Bool)

(assert start!37566)

(declare-fun b_free!8693 () Bool)

(declare-fun b_next!8693 () Bool)

(assert (=> start!37566 (= b_free!8693 (not b_next!8693))))

(declare-fun tp!30794 () Bool)

(declare-fun b_and!15935 () Bool)

(assert (=> start!37566 (= tp!30794 b_and!15935)))

(declare-fun b!383830 () Bool)

(declare-fun res!218623 () Bool)

(declare-fun e!233100 () Bool)

(assert (=> b!383830 (=> (not res!218623) (not e!233100))))

(declare-datatypes ((array!22589 0))(
  ( (array!22590 (arr!10763 (Array (_ BitVec 32) (_ BitVec 64))) (size!11115 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22589)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383830 (= res!218623 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383831 () Bool)

(declare-fun res!218621 () Bool)

(assert (=> b!383831 (=> (not res!218621) (not e!233100))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22589 (_ BitVec 32)) Bool)

(assert (=> b!383831 (= res!218621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383832 () Bool)

(declare-fun e!233102 () Bool)

(declare-fun tp_is_empty!9341 () Bool)

(assert (=> b!383832 (= e!233102 tp_is_empty!9341)))

(declare-fun b!383833 () Bool)

(declare-fun res!218626 () Bool)

(declare-fun e!233097 () Bool)

(assert (=> b!383833 (=> (not res!218626) (not e!233097))))

(declare-fun lt!180426 () array!22589)

(declare-datatypes ((List!6181 0))(
  ( (Nil!6178) (Cons!6177 (h!7033 (_ BitVec 64)) (t!11331 List!6181)) )
))
(declare-fun arrayNoDuplicates!0 (array!22589 (_ BitVec 32) List!6181) Bool)

(assert (=> b!383833 (= res!218626 (arrayNoDuplicates!0 lt!180426 #b00000000000000000000000000000000 Nil!6178))))

(declare-fun b!383834 () Bool)

(declare-fun res!218617 () Bool)

(assert (=> b!383834 (=> (not res!218617) (not e!233100))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13559 0))(
  ( (V!13560 (val!4715 Int)) )
))
(declare-datatypes ((ValueCell!4327 0))(
  ( (ValueCellFull!4327 (v!6912 V!13559)) (EmptyCell!4327) )
))
(declare-datatypes ((array!22591 0))(
  ( (array!22592 (arr!10764 (Array (_ BitVec 32) ValueCell!4327)) (size!11116 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22591)

(assert (=> b!383834 (= res!218617 (and (= (size!11116 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11115 _keys!658) (size!11116 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15576 () Bool)

(declare-fun mapRes!15576 () Bool)

(declare-fun tp!30795 () Bool)

(declare-fun e!233098 () Bool)

(assert (=> mapNonEmpty!15576 (= mapRes!15576 (and tp!30795 e!233098))))

(declare-fun mapKey!15576 () (_ BitVec 32))

(declare-fun mapRest!15576 () (Array (_ BitVec 32) ValueCell!4327))

(declare-fun mapValue!15576 () ValueCell!4327)

(assert (=> mapNonEmpty!15576 (= (arr!10764 _values!506) (store mapRest!15576 mapKey!15576 mapValue!15576))))

(declare-fun b!383835 () Bool)

(assert (=> b!383835 (= e!233098 tp_is_empty!9341)))

(declare-fun b!383836 () Bool)

(declare-fun res!218620 () Bool)

(assert (=> b!383836 (=> (not res!218620) (not e!233100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383836 (= res!218620 (validKeyInArray!0 k!778))))

(declare-fun b!383837 () Bool)

(declare-fun e!233099 () Bool)

(assert (=> b!383837 (= e!233099 (and e!233102 mapRes!15576))))

(declare-fun condMapEmpty!15576 () Bool)

(declare-fun mapDefault!15576 () ValueCell!4327)

