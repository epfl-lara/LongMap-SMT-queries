; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38450 () Bool)

(assert start!38450)

(declare-fun mapNonEmpty!16446 () Bool)

(declare-fun mapRes!16446 () Bool)

(declare-fun tp!32241 () Bool)

(declare-fun e!239954 () Bool)

(assert (=> mapNonEmpty!16446 (= mapRes!16446 (and tp!32241 e!239954))))

(declare-fun mapKey!16446 () (_ BitVec 32))

(declare-datatypes ((V!14283 0))(
  ( (V!14284 (val!4986 Int)) )
))
(declare-datatypes ((ValueCell!4598 0))(
  ( (ValueCellFull!4598 (v!7227 V!14283)) (EmptyCell!4598) )
))
(declare-fun mapValue!16446 () ValueCell!4598)

(declare-datatypes ((array!23663 0))(
  ( (array!23664 (arr!11281 (Array (_ BitVec 32) ValueCell!4598)) (size!11634 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23663)

(declare-fun mapRest!16446 () (Array (_ BitVec 32) ValueCell!4598))

(assert (=> mapNonEmpty!16446 (= (arr!11281 _values!549) (store mapRest!16446 mapKey!16446 mapValue!16446))))

(declare-fun res!227699 () Bool)

(declare-fun e!239956 () Bool)

(assert (=> start!38450 (=> (not res!227699) (not e!239956))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23665 0))(
  ( (array!23666 (arr!11282 (Array (_ BitVec 32) (_ BitVec 64))) (size!11635 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23665)

(assert (=> start!38450 (= res!227699 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11635 _keys!709))))))

(assert (=> start!38450 e!239956))

(assert (=> start!38450 true))

(declare-fun e!239955 () Bool)

(declare-fun array_inv!8282 (array!23663) Bool)

(assert (=> start!38450 (and (array_inv!8282 _values!549) e!239955)))

(declare-fun array_inv!8283 (array!23665) Bool)

(assert (=> start!38450 (array_inv!8283 _keys!709)))

(declare-fun b!396673 () Bool)

(declare-fun res!227695 () Bool)

(assert (=> b!396673 (=> (not res!227695) (not e!239956))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396673 (= res!227695 (and (= (size!11634 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11635 _keys!709) (size!11634 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396674 () Bool)

(declare-fun tp_is_empty!9883 () Bool)

(assert (=> b!396674 (= e!239954 tp_is_empty!9883)))

(declare-fun b!396675 () Bool)

(declare-fun res!227700 () Bool)

(assert (=> b!396675 (=> (not res!227700) (not e!239956))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396675 (= res!227700 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396676 () Bool)

(declare-fun e!239957 () Bool)

(assert (=> b!396676 (= e!239957 tp_is_empty!9883)))

(declare-fun b!396677 () Bool)

(declare-fun e!239953 () Bool)

(assert (=> b!396677 (= e!239953 false)))

(declare-fun lt!186994 () Bool)

(declare-fun lt!186995 () array!23665)

(declare-datatypes ((List!6498 0))(
  ( (Nil!6495) (Cons!6494 (h!7350 (_ BitVec 64)) (t!11663 List!6498)) )
))
(declare-fun arrayNoDuplicates!0 (array!23665 (_ BitVec 32) List!6498) Bool)

(assert (=> b!396677 (= lt!186994 (arrayNoDuplicates!0 lt!186995 #b00000000000000000000000000000000 Nil!6495))))

(declare-fun b!396678 () Bool)

(declare-fun res!227693 () Bool)

(assert (=> b!396678 (=> (not res!227693) (not e!239956))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396678 (= res!227693 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11635 _keys!709))))))

(declare-fun b!396679 () Bool)

(declare-fun res!227692 () Bool)

(assert (=> b!396679 (=> (not res!227692) (not e!239956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396679 (= res!227692 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16446 () Bool)

(assert (=> mapIsEmpty!16446 mapRes!16446))

(declare-fun b!396680 () Bool)

(declare-fun res!227696 () Bool)

(assert (=> b!396680 (=> (not res!227696) (not e!239956))))

(assert (=> b!396680 (= res!227696 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6495))))

(declare-fun b!396681 () Bool)

(assert (=> b!396681 (= e!239955 (and e!239957 mapRes!16446))))

(declare-fun condMapEmpty!16446 () Bool)

(declare-fun mapDefault!16446 () ValueCell!4598)

(assert (=> b!396681 (= condMapEmpty!16446 (= (arr!11281 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4598)) mapDefault!16446)))))

(declare-fun b!396682 () Bool)

(declare-fun res!227691 () Bool)

(assert (=> b!396682 (=> (not res!227691) (not e!239956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23665 (_ BitVec 32)) Bool)

(assert (=> b!396682 (= res!227691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396683 () Bool)

(declare-fun res!227698 () Bool)

(assert (=> b!396683 (=> (not res!227698) (not e!239956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396683 (= res!227698 (validKeyInArray!0 k0!794))))

(declare-fun b!396684 () Bool)

(declare-fun res!227694 () Bool)

(assert (=> b!396684 (=> (not res!227694) (not e!239956))))

(assert (=> b!396684 (= res!227694 (or (= (select (arr!11282 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11282 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396685 () Bool)

(assert (=> b!396685 (= e!239956 e!239953)))

(declare-fun res!227697 () Bool)

(assert (=> b!396685 (=> (not res!227697) (not e!239953))))

(assert (=> b!396685 (= res!227697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186995 mask!1025))))

(assert (=> b!396685 (= lt!186995 (array!23666 (store (arr!11282 _keys!709) i!563 k0!794) (size!11635 _keys!709)))))

(assert (= (and start!38450 res!227699) b!396679))

(assert (= (and b!396679 res!227692) b!396673))

(assert (= (and b!396673 res!227695) b!396682))

(assert (= (and b!396682 res!227691) b!396680))

(assert (= (and b!396680 res!227696) b!396678))

(assert (= (and b!396678 res!227693) b!396683))

(assert (= (and b!396683 res!227698) b!396684))

(assert (= (and b!396684 res!227694) b!396675))

(assert (= (and b!396675 res!227700) b!396685))

(assert (= (and b!396685 res!227697) b!396677))

(assert (= (and b!396681 condMapEmpty!16446) mapIsEmpty!16446))

(assert (= (and b!396681 (not condMapEmpty!16446)) mapNonEmpty!16446))

(get-info :version)

(assert (= (and mapNonEmpty!16446 ((_ is ValueCellFull!4598) mapValue!16446)) b!396674))

(assert (= (and b!396681 ((_ is ValueCellFull!4598) mapDefault!16446)) b!396676))

(assert (= start!38450 b!396681))

(declare-fun m!391659 () Bool)

(assert (=> b!396683 m!391659))

(declare-fun m!391661 () Bool)

(assert (=> b!396685 m!391661))

(declare-fun m!391663 () Bool)

(assert (=> b!396685 m!391663))

(declare-fun m!391665 () Bool)

(assert (=> mapNonEmpty!16446 m!391665))

(declare-fun m!391667 () Bool)

(assert (=> b!396675 m!391667))

(declare-fun m!391669 () Bool)

(assert (=> b!396677 m!391669))

(declare-fun m!391671 () Bool)

(assert (=> b!396680 m!391671))

(declare-fun m!391673 () Bool)

(assert (=> b!396682 m!391673))

(declare-fun m!391675 () Bool)

(assert (=> start!38450 m!391675))

(declare-fun m!391677 () Bool)

(assert (=> start!38450 m!391677))

(declare-fun m!391679 () Bool)

(assert (=> b!396679 m!391679))

(declare-fun m!391681 () Bool)

(assert (=> b!396684 m!391681))

(check-sat (not b!396683) (not b!396679) (not b!396682) (not b!396677) tp_is_empty!9883 (not b!396680) (not b!396675) (not start!38450) (not mapNonEmpty!16446) (not b!396685))
(check-sat)
