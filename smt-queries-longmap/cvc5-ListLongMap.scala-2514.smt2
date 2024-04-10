; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38902 () Bool)

(assert start!38902)

(declare-fun b!406781 () Bool)

(declare-fun res!235040 () Bool)

(declare-fun e!244393 () Bool)

(assert (=> b!406781 (=> (not res!235040) (not e!244393))))

(declare-datatypes ((array!24529 0))(
  ( (array!24530 (arr!11714 (Array (_ BitVec 32) (_ BitVec 64))) (size!12066 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24529)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406781 (= res!235040 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!406782 () Bool)

(declare-fun e!244396 () Bool)

(declare-fun tp_is_empty!10321 () Bool)

(assert (=> b!406782 (= e!244396 tp_is_empty!10321)))

(declare-fun b!406783 () Bool)

(declare-fun e!244398 () Bool)

(assert (=> b!406783 (= e!244398 tp_is_empty!10321)))

(declare-fun b!406784 () Bool)

(declare-fun e!244395 () Bool)

(assert (=> b!406784 (= e!244395 false)))

(declare-fun lt!188542 () Bool)

(declare-fun lt!188543 () array!24529)

(declare-datatypes ((List!6800 0))(
  ( (Nil!6797) (Cons!6796 (h!7652 (_ BitVec 64)) (t!11974 List!6800)) )
))
(declare-fun arrayNoDuplicates!0 (array!24529 (_ BitVec 32) List!6800) Bool)

(assert (=> b!406784 (= lt!188542 (arrayNoDuplicates!0 lt!188543 #b00000000000000000000000000000000 Nil!6797))))

(declare-fun b!406785 () Bool)

(declare-fun res!235043 () Bool)

(assert (=> b!406785 (=> (not res!235043) (not e!244393))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14867 0))(
  ( (V!14868 (val!5205 Int)) )
))
(declare-datatypes ((ValueCell!4817 0))(
  ( (ValueCellFull!4817 (v!7452 V!14867)) (EmptyCell!4817) )
))
(declare-datatypes ((array!24531 0))(
  ( (array!24532 (arr!11715 (Array (_ BitVec 32) ValueCell!4817)) (size!12067 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24531)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406785 (= res!235043 (and (= (size!12067 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12066 _keys!709) (size!12067 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406786 () Bool)

(declare-fun res!235044 () Bool)

(assert (=> b!406786 (=> (not res!235044) (not e!244393))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406786 (= res!235044 (or (= (select (arr!11714 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11714 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406787 () Bool)

(declare-fun res!235038 () Bool)

(assert (=> b!406787 (=> (not res!235038) (not e!244393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406787 (= res!235038 (validMask!0 mask!1025))))

(declare-fun b!406788 () Bool)

(declare-fun res!235047 () Bool)

(assert (=> b!406788 (=> (not res!235047) (not e!244393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24529 (_ BitVec 32)) Bool)

(assert (=> b!406788 (= res!235047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17103 () Bool)

(declare-fun mapRes!17103 () Bool)

(assert (=> mapIsEmpty!17103 mapRes!17103))

(declare-fun b!406789 () Bool)

(declare-fun res!235042 () Bool)

(assert (=> b!406789 (=> (not res!235042) (not e!244393))))

(assert (=> b!406789 (= res!235042 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12066 _keys!709))))))

(declare-fun b!406790 () Bool)

(assert (=> b!406790 (= e!244393 e!244395)))

(declare-fun res!235039 () Bool)

(assert (=> b!406790 (=> (not res!235039) (not e!244395))))

(assert (=> b!406790 (= res!235039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188543 mask!1025))))

(assert (=> b!406790 (= lt!188543 (array!24530 (store (arr!11714 _keys!709) i!563 k!794) (size!12066 _keys!709)))))

(declare-fun b!406791 () Bool)

(declare-fun res!235046 () Bool)

(assert (=> b!406791 (=> (not res!235046) (not e!244393))))

(assert (=> b!406791 (= res!235046 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6797))))

(declare-fun b!406792 () Bool)

(declare-fun e!244394 () Bool)

(assert (=> b!406792 (= e!244394 (and e!244398 mapRes!17103))))

(declare-fun condMapEmpty!17103 () Bool)

(declare-fun mapDefault!17103 () ValueCell!4817)

