; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38518 () Bool)

(assert start!38518)

(declare-fun b!397997 () Bool)

(declare-fun res!228632 () Bool)

(declare-fun e!240615 () Bool)

(assert (=> b!397997 (=> (not res!228632) (not e!240615))))

(declare-datatypes ((array!23785 0))(
  ( (array!23786 (arr!11342 (Array (_ BitVec 32) (_ BitVec 64))) (size!11694 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23785)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14355 0))(
  ( (V!14356 (val!5013 Int)) )
))
(declare-datatypes ((ValueCell!4625 0))(
  ( (ValueCellFull!4625 (v!7260 V!14355)) (EmptyCell!4625) )
))
(declare-datatypes ((array!23787 0))(
  ( (array!23788 (arr!11343 (Array (_ BitVec 32) ValueCell!4625)) (size!11695 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23787)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397997 (= res!228632 (and (= (size!11695 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11694 _keys!709) (size!11695 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397998 () Bool)

(declare-fun res!228638 () Bool)

(assert (=> b!397998 (=> (not res!228638) (not e!240615))))

(declare-datatypes ((List!6562 0))(
  ( (Nil!6559) (Cons!6558 (h!7414 (_ BitVec 64)) (t!11736 List!6562)) )
))
(declare-fun arrayNoDuplicates!0 (array!23785 (_ BitVec 32) List!6562) Bool)

(assert (=> b!397998 (= res!228638 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6559))))

(declare-fun b!397999 () Bool)

(declare-fun e!240613 () Bool)

(assert (=> b!397999 (= e!240613 false)))

(declare-fun lt!187390 () Bool)

(declare-fun lt!187391 () array!23785)

(assert (=> b!397999 (= lt!187390 (arrayNoDuplicates!0 lt!187391 #b00000000000000000000000000000000 Nil!6559))))

(declare-fun b!398000 () Bool)

(declare-fun res!228630 () Bool)

(assert (=> b!398000 (=> (not res!228630) (not e!240615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23785 (_ BitVec 32)) Bool)

(assert (=> b!398000 (= res!228630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398001 () Bool)

(assert (=> b!398001 (= e!240615 e!240613)))

(declare-fun res!228634 () Bool)

(assert (=> b!398001 (=> (not res!228634) (not e!240613))))

(assert (=> b!398001 (= res!228634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187391 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398001 (= lt!187391 (array!23786 (store (arr!11342 _keys!709) i!563 k!794) (size!11694 _keys!709)))))

(declare-fun b!398002 () Bool)

(declare-fun res!228636 () Bool)

(assert (=> b!398002 (=> (not res!228636) (not e!240615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398002 (= res!228636 (validMask!0 mask!1025))))

(declare-fun res!228633 () Bool)

(assert (=> start!38518 (=> (not res!228633) (not e!240615))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38518 (= res!228633 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11694 _keys!709))))))

(assert (=> start!38518 e!240615))

(assert (=> start!38518 true))

(declare-fun e!240618 () Bool)

(declare-fun array_inv!8314 (array!23787) Bool)

(assert (=> start!38518 (and (array_inv!8314 _values!549) e!240618)))

(declare-fun array_inv!8315 (array!23785) Bool)

(assert (=> start!38518 (array_inv!8315 _keys!709)))

(declare-fun b!398003 () Bool)

(declare-fun res!228639 () Bool)

(assert (=> b!398003 (=> (not res!228639) (not e!240615))))

(assert (=> b!398003 (= res!228639 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11694 _keys!709))))))

(declare-fun b!398004 () Bool)

(declare-fun e!240617 () Bool)

(declare-fun tp_is_empty!9937 () Bool)

(assert (=> b!398004 (= e!240617 tp_is_empty!9937)))

(declare-fun mapIsEmpty!16527 () Bool)

(declare-fun mapRes!16527 () Bool)

(assert (=> mapIsEmpty!16527 mapRes!16527))

(declare-fun b!398005 () Bool)

(declare-fun e!240614 () Bool)

(assert (=> b!398005 (= e!240618 (and e!240614 mapRes!16527))))

(declare-fun condMapEmpty!16527 () Bool)

(declare-fun mapDefault!16527 () ValueCell!4625)

