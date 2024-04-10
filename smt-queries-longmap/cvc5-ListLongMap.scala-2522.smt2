; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38950 () Bool)

(assert start!38950)

(declare-fun b!407717 () Bool)

(declare-fun res!235759 () Bool)

(declare-fun e!244828 () Bool)

(assert (=> b!407717 (=> (not res!235759) (not e!244828))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24619 0))(
  ( (array!24620 (arr!11759 (Array (_ BitVec 32) (_ BitVec 64))) (size!12111 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24619)

(assert (=> b!407717 (= res!235759 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12111 _keys!709))))))

(declare-fun b!407718 () Bool)

(declare-fun res!235767 () Bool)

(assert (=> b!407718 (=> (not res!235767) (not e!244828))))

(declare-datatypes ((List!6819 0))(
  ( (Nil!6816) (Cons!6815 (h!7671 (_ BitVec 64)) (t!11993 List!6819)) )
))
(declare-fun arrayNoDuplicates!0 (array!24619 (_ BitVec 32) List!6819) Bool)

(assert (=> b!407718 (= res!235767 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6816))))

(declare-fun b!407719 () Bool)

(declare-fun res!235758 () Bool)

(assert (=> b!407719 (=> (not res!235758) (not e!244828))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407719 (= res!235758 (validKeyInArray!0 k!794))))

(declare-fun b!407720 () Bool)

(declare-fun e!244829 () Bool)

(declare-fun tp_is_empty!10369 () Bool)

(assert (=> b!407720 (= e!244829 tp_is_empty!10369)))

(declare-fun b!407721 () Bool)

(declare-fun res!235764 () Bool)

(assert (=> b!407721 (=> (not res!235764) (not e!244828))))

(assert (=> b!407721 (= res!235764 (or (= (select (arr!11759 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11759 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!235760 () Bool)

(assert (=> start!38950 (=> (not res!235760) (not e!244828))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38950 (= res!235760 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12111 _keys!709))))))

(assert (=> start!38950 e!244828))

(assert (=> start!38950 true))

(declare-datatypes ((V!14931 0))(
  ( (V!14932 (val!5229 Int)) )
))
(declare-datatypes ((ValueCell!4841 0))(
  ( (ValueCellFull!4841 (v!7476 V!14931)) (EmptyCell!4841) )
))
(declare-datatypes ((array!24621 0))(
  ( (array!24622 (arr!11760 (Array (_ BitVec 32) ValueCell!4841)) (size!12112 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24621)

(declare-fun e!244825 () Bool)

(declare-fun array_inv!8578 (array!24621) Bool)

(assert (=> start!38950 (and (array_inv!8578 _values!549) e!244825)))

(declare-fun array_inv!8579 (array!24619) Bool)

(assert (=> start!38950 (array_inv!8579 _keys!709)))

(declare-fun b!407722 () Bool)

(declare-fun res!235761 () Bool)

(assert (=> b!407722 (=> (not res!235761) (not e!244828))))

(declare-fun arrayContainsKey!0 (array!24619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407722 (= res!235761 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!407723 () Bool)

(declare-fun res!235763 () Bool)

(assert (=> b!407723 (=> (not res!235763) (not e!244828))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407723 (= res!235763 (validMask!0 mask!1025))))

(declare-fun b!407724 () Bool)

(declare-fun res!235766 () Bool)

(assert (=> b!407724 (=> (not res!235766) (not e!244828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24619 (_ BitVec 32)) Bool)

(assert (=> b!407724 (= res!235766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407725 () Bool)

(declare-fun res!235765 () Bool)

(assert (=> b!407725 (=> (not res!235765) (not e!244828))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407725 (= res!235765 (and (= (size!12112 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12111 _keys!709) (size!12112 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407726 () Bool)

(declare-fun e!244827 () Bool)

(assert (=> b!407726 (= e!244827 tp_is_empty!10369)))

(declare-fun b!407727 () Bool)

(declare-fun e!244826 () Bool)

(assert (=> b!407727 (= e!244828 e!244826)))

(declare-fun res!235762 () Bool)

(assert (=> b!407727 (=> (not res!235762) (not e!244826))))

(declare-fun lt!188686 () array!24619)

(assert (=> b!407727 (= res!235762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188686 mask!1025))))

(assert (=> b!407727 (= lt!188686 (array!24620 (store (arr!11759 _keys!709) i!563 k!794) (size!12111 _keys!709)))))

(declare-fun mapIsEmpty!17175 () Bool)

(declare-fun mapRes!17175 () Bool)

(assert (=> mapIsEmpty!17175 mapRes!17175))

(declare-fun b!407728 () Bool)

(assert (=> b!407728 (= e!244826 false)))

(declare-fun lt!188687 () Bool)

(assert (=> b!407728 (= lt!188687 (arrayNoDuplicates!0 lt!188686 #b00000000000000000000000000000000 Nil!6816))))

(declare-fun b!407729 () Bool)

(assert (=> b!407729 (= e!244825 (and e!244829 mapRes!17175))))

(declare-fun condMapEmpty!17175 () Bool)

(declare-fun mapDefault!17175 () ValueCell!4841)

