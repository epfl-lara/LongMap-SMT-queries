; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38814 () Bool)

(assert start!38814)

(declare-fun b!405065 () Bool)

(declare-fun res!233722 () Bool)

(declare-fun e!243603 () Bool)

(assert (=> b!405065 (=> (not res!233722) (not e!243603))))

(declare-datatypes ((array!24359 0))(
  ( (array!24360 (arr!11629 (Array (_ BitVec 32) (_ BitVec 64))) (size!11981 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24359)

(declare-datatypes ((List!6767 0))(
  ( (Nil!6764) (Cons!6763 (h!7619 (_ BitVec 64)) (t!11941 List!6767)) )
))
(declare-fun arrayNoDuplicates!0 (array!24359 (_ BitVec 32) List!6767) Bool)

(assert (=> b!405065 (= res!233722 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6764))))

(declare-fun mapIsEmpty!16971 () Bool)

(declare-fun mapRes!16971 () Bool)

(assert (=> mapIsEmpty!16971 mapRes!16971))

(declare-fun res!233719 () Bool)

(assert (=> start!38814 (=> (not res!233719) (not e!243603))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38814 (= res!233719 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11981 _keys!709))))))

(assert (=> start!38814 e!243603))

(assert (=> start!38814 true))

(declare-datatypes ((V!14749 0))(
  ( (V!14750 (val!5161 Int)) )
))
(declare-datatypes ((ValueCell!4773 0))(
  ( (ValueCellFull!4773 (v!7408 V!14749)) (EmptyCell!4773) )
))
(declare-datatypes ((array!24361 0))(
  ( (array!24362 (arr!11630 (Array (_ BitVec 32) ValueCell!4773)) (size!11982 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24361)

(declare-fun e!243604 () Bool)

(declare-fun array_inv!8502 (array!24361) Bool)

(assert (=> start!38814 (and (array_inv!8502 _values!549) e!243604)))

(declare-fun array_inv!8503 (array!24359) Bool)

(assert (=> start!38814 (array_inv!8503 _keys!709)))

(declare-fun b!405066 () Bool)

(declare-fun res!233726 () Bool)

(assert (=> b!405066 (=> (not res!233726) (not e!243603))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405066 (= res!233726 (validKeyInArray!0 k0!794))))

(declare-fun b!405067 () Bool)

(declare-fun res!233725 () Bool)

(assert (=> b!405067 (=> (not res!233725) (not e!243603))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405067 (= res!233725 (or (= (select (arr!11629 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11629 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405068 () Bool)

(declare-fun res!233720 () Bool)

(assert (=> b!405068 (=> (not res!233720) (not e!243603))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!405068 (= res!233720 (and (= (size!11982 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11981 _keys!709) (size!11982 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405069 () Bool)

(declare-fun res!233718 () Bool)

(assert (=> b!405069 (=> (not res!233718) (not e!243603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24359 (_ BitVec 32)) Bool)

(assert (=> b!405069 (= res!233718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405070 () Bool)

(declare-fun e!243605 () Bool)

(declare-fun tp_is_empty!10233 () Bool)

(assert (=> b!405070 (= e!243605 tp_is_empty!10233)))

(declare-fun b!405071 () Bool)

(assert (=> b!405071 (= e!243604 (and e!243605 mapRes!16971))))

(declare-fun condMapEmpty!16971 () Bool)

(declare-fun mapDefault!16971 () ValueCell!4773)

(assert (=> b!405071 (= condMapEmpty!16971 (= (arr!11630 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4773)) mapDefault!16971)))))

(declare-fun mapNonEmpty!16971 () Bool)

(declare-fun tp!33090 () Bool)

(declare-fun e!243601 () Bool)

(assert (=> mapNonEmpty!16971 (= mapRes!16971 (and tp!33090 e!243601))))

(declare-fun mapValue!16971 () ValueCell!4773)

(declare-fun mapKey!16971 () (_ BitVec 32))

(declare-fun mapRest!16971 () (Array (_ BitVec 32) ValueCell!4773))

(assert (=> mapNonEmpty!16971 (= (arr!11630 _values!549) (store mapRest!16971 mapKey!16971 mapValue!16971))))

(declare-fun b!405072 () Bool)

(declare-fun res!233724 () Bool)

(assert (=> b!405072 (=> (not res!233724) (not e!243603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405072 (= res!233724 (validMask!0 mask!1025))))

(declare-fun b!405073 () Bool)

(declare-fun e!243602 () Bool)

(assert (=> b!405073 (= e!243603 e!243602)))

(declare-fun res!233727 () Bool)

(assert (=> b!405073 (=> (not res!233727) (not e!243602))))

(declare-fun lt!188278 () array!24359)

(assert (=> b!405073 (= res!233727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188278 mask!1025))))

(assert (=> b!405073 (= lt!188278 (array!24360 (store (arr!11629 _keys!709) i!563 k0!794) (size!11981 _keys!709)))))

(declare-fun b!405074 () Bool)

(assert (=> b!405074 (= e!243602 false)))

(declare-fun lt!188279 () Bool)

(assert (=> b!405074 (= lt!188279 (arrayNoDuplicates!0 lt!188278 #b00000000000000000000000000000000 Nil!6764))))

(declare-fun b!405075 () Bool)

(assert (=> b!405075 (= e!243601 tp_is_empty!10233)))

(declare-fun b!405076 () Bool)

(declare-fun res!233723 () Bool)

(assert (=> b!405076 (=> (not res!233723) (not e!243603))))

(declare-fun arrayContainsKey!0 (array!24359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405076 (= res!233723 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405077 () Bool)

(declare-fun res!233721 () Bool)

(assert (=> b!405077 (=> (not res!233721) (not e!243603))))

(assert (=> b!405077 (= res!233721 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11981 _keys!709))))))

(assert (= (and start!38814 res!233719) b!405072))

(assert (= (and b!405072 res!233724) b!405068))

(assert (= (and b!405068 res!233720) b!405069))

(assert (= (and b!405069 res!233718) b!405065))

(assert (= (and b!405065 res!233722) b!405077))

(assert (= (and b!405077 res!233721) b!405066))

(assert (= (and b!405066 res!233726) b!405067))

(assert (= (and b!405067 res!233725) b!405076))

(assert (= (and b!405076 res!233723) b!405073))

(assert (= (and b!405073 res!233727) b!405074))

(assert (= (and b!405071 condMapEmpty!16971) mapIsEmpty!16971))

(assert (= (and b!405071 (not condMapEmpty!16971)) mapNonEmpty!16971))

(get-info :version)

(assert (= (and mapNonEmpty!16971 ((_ is ValueCellFull!4773) mapValue!16971)) b!405075))

(assert (= (and b!405071 ((_ is ValueCellFull!4773) mapDefault!16971)) b!405070))

(assert (= start!38814 b!405071))

(declare-fun m!397663 () Bool)

(assert (=> b!405069 m!397663))

(declare-fun m!397665 () Bool)

(assert (=> b!405073 m!397665))

(declare-fun m!397667 () Bool)

(assert (=> b!405073 m!397667))

(declare-fun m!397669 () Bool)

(assert (=> start!38814 m!397669))

(declare-fun m!397671 () Bool)

(assert (=> start!38814 m!397671))

(declare-fun m!397673 () Bool)

(assert (=> mapNonEmpty!16971 m!397673))

(declare-fun m!397675 () Bool)

(assert (=> b!405076 m!397675))

(declare-fun m!397677 () Bool)

(assert (=> b!405072 m!397677))

(declare-fun m!397679 () Bool)

(assert (=> b!405067 m!397679))

(declare-fun m!397681 () Bool)

(assert (=> b!405074 m!397681))

(declare-fun m!397683 () Bool)

(assert (=> b!405065 m!397683))

(declare-fun m!397685 () Bool)

(assert (=> b!405066 m!397685))

(check-sat (not b!405072) (not b!405065) (not b!405073) (not b!405076) (not b!405066) tp_is_empty!10233 (not b!405074) (not b!405069) (not mapNonEmpty!16971) (not start!38814))
(check-sat)
