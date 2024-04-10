; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33414 () Bool)

(assert start!33414)

(declare-fun mapIsEmpty!11412 () Bool)

(declare-fun mapRes!11412 () Bool)

(assert (=> mapIsEmpty!11412 mapRes!11412))

(declare-fun b!331823 () Bool)

(declare-fun res!182808 () Bool)

(declare-fun e!203645 () Bool)

(assert (=> b!331823 (=> (not res!182808) (not e!203645))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9895 0))(
  ( (V!9896 (val!3389 Int)) )
))
(declare-datatypes ((ValueCell!3001 0))(
  ( (ValueCellFull!3001 (v!5547 V!9895)) (EmptyCell!3001) )
))
(declare-datatypes ((array!16975 0))(
  ( (array!16976 (arr!8024 (Array (_ BitVec 32) ValueCell!3001)) (size!8376 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16975)

(declare-datatypes ((array!16977 0))(
  ( (array!16978 (arr!8025 (Array (_ BitVec 32) (_ BitVec 64))) (size!8377 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16977)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331823 (= res!182808 (and (= (size!8376 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8377 _keys!1895) (size!8376 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331824 () Bool)

(declare-fun e!203646 () Bool)

(declare-fun tp_is_empty!6689 () Bool)

(assert (=> b!331824 (= e!203646 tp_is_empty!6689)))

(declare-fun b!331825 () Bool)

(declare-datatypes ((List!4576 0))(
  ( (Nil!4573) (Cons!4572 (h!5428 (_ BitVec 64)) (t!9658 List!4576)) )
))
(declare-fun noDuplicate!174 (List!4576) Bool)

(assert (=> b!331825 (= e!203645 (not (noDuplicate!174 Nil!4573)))))

(declare-fun mapNonEmpty!11412 () Bool)

(declare-fun tp!23787 () Bool)

(declare-fun e!203647 () Bool)

(assert (=> mapNonEmpty!11412 (= mapRes!11412 (and tp!23787 e!203647))))

(declare-fun mapValue!11412 () ValueCell!3001)

(declare-fun mapRest!11412 () (Array (_ BitVec 32) ValueCell!3001))

(declare-fun mapKey!11412 () (_ BitVec 32))

(assert (=> mapNonEmpty!11412 (= (arr!8024 _values!1525) (store mapRest!11412 mapKey!11412 mapValue!11412))))

(declare-fun b!331826 () Bool)

(declare-fun res!182811 () Bool)

(assert (=> b!331826 (=> (not res!182811) (not e!203645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16977 (_ BitVec 32)) Bool)

(assert (=> b!331826 (= res!182811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!182810 () Bool)

(assert (=> start!33414 (=> (not res!182810) (not e!203645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33414 (= res!182810 (validMask!0 mask!2385))))

(assert (=> start!33414 e!203645))

(assert (=> start!33414 true))

(declare-fun e!203643 () Bool)

(declare-fun array_inv!5978 (array!16975) Bool)

(assert (=> start!33414 (and (array_inv!5978 _values!1525) e!203643)))

(declare-fun array_inv!5979 (array!16977) Bool)

(assert (=> start!33414 (array_inv!5979 _keys!1895)))

(declare-fun b!331827 () Bool)

(assert (=> b!331827 (= e!203643 (and e!203646 mapRes!11412))))

(declare-fun condMapEmpty!11412 () Bool)

(declare-fun mapDefault!11412 () ValueCell!3001)

