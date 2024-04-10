; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35490 () Bool)

(assert start!35490)

(declare-fun b!355682 () Bool)

(declare-fun e!217871 () Bool)

(declare-fun tp_is_empty!7943 () Bool)

(assert (=> b!355682 (= e!217871 tp_is_empty!7943)))

(declare-fun res!197343 () Bool)

(declare-fun e!217869 () Bool)

(assert (=> start!35490 (=> (not res!197343) (not e!217869))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35490 (= res!197343 (validMask!0 mask!1842))))

(assert (=> start!35490 e!217869))

(assert (=> start!35490 true))

(declare-datatypes ((V!11567 0))(
  ( (V!11568 (val!4016 Int)) )
))
(declare-datatypes ((ValueCell!3628 0))(
  ( (ValueCellFull!3628 (v!6210 V!11567)) (EmptyCell!3628) )
))
(declare-datatypes ((array!19465 0))(
  ( (array!19466 (arr!9226 (Array (_ BitVec 32) ValueCell!3628)) (size!9578 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19465)

(declare-fun e!217870 () Bool)

(declare-fun array_inv!6780 (array!19465) Bool)

(assert (=> start!35490 (and (array_inv!6780 _values!1208) e!217870)))

(declare-datatypes ((array!19467 0))(
  ( (array!19468 (arr!9227 (Array (_ BitVec 32) (_ BitVec 64))) (size!9579 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19467)

(declare-fun array_inv!6781 (array!19467) Bool)

(assert (=> start!35490 (array_inv!6781 _keys!1456)))

(declare-fun b!355683 () Bool)

(assert (=> b!355683 (= e!217869 false)))

(declare-fun lt!165830 () Bool)

(declare-datatypes ((List!5345 0))(
  ( (Nil!5342) (Cons!5341 (h!6197 (_ BitVec 64)) (t!10495 List!5345)) )
))
(declare-fun arrayNoDuplicates!0 (array!19467 (_ BitVec 32) List!5345) Bool)

(assert (=> b!355683 (= lt!165830 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5342))))

(declare-fun b!355684 () Bool)

(declare-fun e!217868 () Bool)

(assert (=> b!355684 (= e!217868 tp_is_empty!7943)))

(declare-fun b!355685 () Bool)

(declare-fun res!197342 () Bool)

(assert (=> b!355685 (=> (not res!197342) (not e!217869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19467 (_ BitVec 32)) Bool)

(assert (=> b!355685 (= res!197342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13422 () Bool)

(declare-fun mapRes!13422 () Bool)

(assert (=> mapIsEmpty!13422 mapRes!13422))

(declare-fun b!355686 () Bool)

(assert (=> b!355686 (= e!217870 (and e!217871 mapRes!13422))))

(declare-fun condMapEmpty!13422 () Bool)

(declare-fun mapDefault!13422 () ValueCell!3628)

