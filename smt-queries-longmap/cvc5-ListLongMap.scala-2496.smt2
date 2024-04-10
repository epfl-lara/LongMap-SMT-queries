; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38794 () Bool)

(assert start!38794)

(declare-fun b!404675 () Bool)

(declare-fun res!233420 () Bool)

(declare-fun e!243424 () Bool)

(assert (=> b!404675 (=> (not res!233420) (not e!243424))))

(declare-datatypes ((array!24321 0))(
  ( (array!24322 (arr!11610 (Array (_ BitVec 32) (_ BitVec 64))) (size!11962 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24321)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24321 (_ BitVec 32)) Bool)

(assert (=> b!404675 (= res!233420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!233424 () Bool)

(assert (=> start!38794 (=> (not res!233424) (not e!243424))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38794 (= res!233424 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11962 _keys!709))))))

(assert (=> start!38794 e!243424))

(assert (=> start!38794 true))

(declare-datatypes ((V!14723 0))(
  ( (V!14724 (val!5151 Int)) )
))
(declare-datatypes ((ValueCell!4763 0))(
  ( (ValueCellFull!4763 (v!7398 V!14723)) (EmptyCell!4763) )
))
(declare-datatypes ((array!24323 0))(
  ( (array!24324 (arr!11611 (Array (_ BitVec 32) ValueCell!4763)) (size!11963 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24323)

(declare-fun e!243422 () Bool)

(declare-fun array_inv!8488 (array!24323) Bool)

(assert (=> start!38794 (and (array_inv!8488 _values!549) e!243422)))

(declare-fun array_inv!8489 (array!24321) Bool)

(assert (=> start!38794 (array_inv!8489 _keys!709)))

(declare-fun b!404676 () Bool)

(declare-fun e!243425 () Bool)

(declare-fun tp_is_empty!10213 () Bool)

(assert (=> b!404676 (= e!243425 tp_is_empty!10213)))

(declare-fun b!404677 () Bool)

(declare-fun e!243426 () Bool)

(assert (=> b!404677 (= e!243426 tp_is_empty!10213)))

(declare-fun b!404678 () Bool)

(declare-fun e!243423 () Bool)

(assert (=> b!404678 (= e!243423 false)))

(declare-fun lt!188218 () Bool)

(declare-fun lt!188219 () array!24321)

(declare-datatypes ((List!6758 0))(
  ( (Nil!6755) (Cons!6754 (h!7610 (_ BitVec 64)) (t!11932 List!6758)) )
))
(declare-fun arrayNoDuplicates!0 (array!24321 (_ BitVec 32) List!6758) Bool)

(assert (=> b!404678 (= lt!188218 (arrayNoDuplicates!0 lt!188219 #b00000000000000000000000000000000 Nil!6755))))

(declare-fun b!404679 () Bool)

(declare-fun res!233419 () Bool)

(assert (=> b!404679 (=> (not res!233419) (not e!243424))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404679 (= res!233419 (validKeyInArray!0 k!794))))

(declare-fun b!404680 () Bool)

(declare-fun res!233422 () Bool)

(assert (=> b!404680 (=> (not res!233422) (not e!243424))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404680 (= res!233422 (or (= (select (arr!11610 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11610 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404681 () Bool)

(declare-fun res!233426 () Bool)

(assert (=> b!404681 (=> (not res!233426) (not e!243424))))

(assert (=> b!404681 (= res!233426 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6755))))

(declare-fun mapNonEmpty!16941 () Bool)

(declare-fun mapRes!16941 () Bool)

(declare-fun tp!33060 () Bool)

(assert (=> mapNonEmpty!16941 (= mapRes!16941 (and tp!33060 e!243425))))

(declare-fun mapValue!16941 () ValueCell!4763)

(declare-fun mapRest!16941 () (Array (_ BitVec 32) ValueCell!4763))

(declare-fun mapKey!16941 () (_ BitVec 32))

(assert (=> mapNonEmpty!16941 (= (arr!11611 _values!549) (store mapRest!16941 mapKey!16941 mapValue!16941))))

(declare-fun b!404682 () Bool)

(declare-fun res!233425 () Bool)

(assert (=> b!404682 (=> (not res!233425) (not e!243424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404682 (= res!233425 (validMask!0 mask!1025))))

(declare-fun b!404683 () Bool)

(declare-fun res!233427 () Bool)

(assert (=> b!404683 (=> (not res!233427) (not e!243424))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404683 (= res!233427 (and (= (size!11963 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11962 _keys!709) (size!11963 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404684 () Bool)

(assert (=> b!404684 (= e!243424 e!243423)))

(declare-fun res!233418 () Bool)

(assert (=> b!404684 (=> (not res!233418) (not e!243423))))

(assert (=> b!404684 (= res!233418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188219 mask!1025))))

(assert (=> b!404684 (= lt!188219 (array!24322 (store (arr!11610 _keys!709) i!563 k!794) (size!11962 _keys!709)))))

(declare-fun b!404685 () Bool)

(assert (=> b!404685 (= e!243422 (and e!243426 mapRes!16941))))

(declare-fun condMapEmpty!16941 () Bool)

(declare-fun mapDefault!16941 () ValueCell!4763)

