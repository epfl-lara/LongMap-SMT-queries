; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38838 () Bool)

(assert start!38838)

(declare-fun b!405533 () Bool)

(declare-fun res!234078 () Bool)

(declare-fun e!243818 () Bool)

(assert (=> b!405533 (=> (not res!234078) (not e!243818))))

(declare-datatypes ((array!24405 0))(
  ( (array!24406 (arr!11652 (Array (_ BitVec 32) (_ BitVec 64))) (size!12004 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24405)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24405 (_ BitVec 32)) Bool)

(assert (=> b!405533 (= res!234078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!234086 () Bool)

(assert (=> start!38838 (=> (not res!234086) (not e!243818))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38838 (= res!234086 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12004 _keys!709))))))

(assert (=> start!38838 e!243818))

(assert (=> start!38838 true))

(declare-datatypes ((V!14781 0))(
  ( (V!14782 (val!5173 Int)) )
))
(declare-datatypes ((ValueCell!4785 0))(
  ( (ValueCellFull!4785 (v!7420 V!14781)) (EmptyCell!4785) )
))
(declare-datatypes ((array!24407 0))(
  ( (array!24408 (arr!11653 (Array (_ BitVec 32) ValueCell!4785)) (size!12005 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24407)

(declare-fun e!243819 () Bool)

(declare-fun array_inv!8516 (array!24407) Bool)

(assert (=> start!38838 (and (array_inv!8516 _values!549) e!243819)))

(declare-fun array_inv!8517 (array!24405) Bool)

(assert (=> start!38838 (array_inv!8517 _keys!709)))

(declare-fun b!405534 () Bool)

(declare-fun res!234084 () Bool)

(assert (=> b!405534 (=> (not res!234084) (not e!243818))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405534 (= res!234084 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12004 _keys!709))))))

(declare-fun b!405535 () Bool)

(declare-fun res!234082 () Bool)

(assert (=> b!405535 (=> (not res!234082) (not e!243818))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405535 (= res!234082 (and (= (size!12005 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12004 _keys!709) (size!12005 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405536 () Bool)

(declare-fun res!234080 () Bool)

(assert (=> b!405536 (=> (not res!234080) (not e!243818))))

(declare-datatypes ((List!6775 0))(
  ( (Nil!6772) (Cons!6771 (h!7627 (_ BitVec 64)) (t!11949 List!6775)) )
))
(declare-fun arrayNoDuplicates!0 (array!24405 (_ BitVec 32) List!6775) Bool)

(assert (=> b!405536 (= res!234080 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6772))))

(declare-fun b!405537 () Bool)

(declare-fun e!243821 () Bool)

(declare-fun mapRes!17007 () Bool)

(assert (=> b!405537 (= e!243819 (and e!243821 mapRes!17007))))

(declare-fun condMapEmpty!17007 () Bool)

(declare-fun mapDefault!17007 () ValueCell!4785)

(assert (=> b!405537 (= condMapEmpty!17007 (= (arr!11653 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4785)) mapDefault!17007)))))

(declare-fun mapIsEmpty!17007 () Bool)

(assert (=> mapIsEmpty!17007 mapRes!17007))

(declare-fun b!405538 () Bool)

(declare-fun res!234087 () Bool)

(assert (=> b!405538 (=> (not res!234087) (not e!243818))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405538 (= res!234087 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405539 () Bool)

(declare-fun res!234081 () Bool)

(assert (=> b!405539 (=> (not res!234081) (not e!243818))))

(assert (=> b!405539 (= res!234081 (or (= (select (arr!11652 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11652 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405540 () Bool)

(declare-fun res!234085 () Bool)

(assert (=> b!405540 (=> (not res!234085) (not e!243818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405540 (= res!234085 (validKeyInArray!0 k0!794))))

(declare-fun b!405541 () Bool)

(declare-fun e!243817 () Bool)

(assert (=> b!405541 (= e!243817 false)))

(declare-fun lt!188351 () Bool)

(declare-fun lt!188350 () array!24405)

(assert (=> b!405541 (= lt!188351 (arrayNoDuplicates!0 lt!188350 #b00000000000000000000000000000000 Nil!6772))))

(declare-fun b!405542 () Bool)

(declare-fun res!234079 () Bool)

(assert (=> b!405542 (=> (not res!234079) (not e!243818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405542 (= res!234079 (validMask!0 mask!1025))))

(declare-fun b!405543 () Bool)

(declare-fun e!243822 () Bool)

(declare-fun tp_is_empty!10257 () Bool)

(assert (=> b!405543 (= e!243822 tp_is_empty!10257)))

(declare-fun mapNonEmpty!17007 () Bool)

(declare-fun tp!33126 () Bool)

(assert (=> mapNonEmpty!17007 (= mapRes!17007 (and tp!33126 e!243822))))

(declare-fun mapRest!17007 () (Array (_ BitVec 32) ValueCell!4785))

(declare-fun mapKey!17007 () (_ BitVec 32))

(declare-fun mapValue!17007 () ValueCell!4785)

(assert (=> mapNonEmpty!17007 (= (arr!11653 _values!549) (store mapRest!17007 mapKey!17007 mapValue!17007))))

(declare-fun b!405544 () Bool)

(assert (=> b!405544 (= e!243818 e!243817)))

(declare-fun res!234083 () Bool)

(assert (=> b!405544 (=> (not res!234083) (not e!243817))))

(assert (=> b!405544 (= res!234083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188350 mask!1025))))

(assert (=> b!405544 (= lt!188350 (array!24406 (store (arr!11652 _keys!709) i!563 k0!794) (size!12004 _keys!709)))))

(declare-fun b!405545 () Bool)

(assert (=> b!405545 (= e!243821 tp_is_empty!10257)))

(assert (= (and start!38838 res!234086) b!405542))

(assert (= (and b!405542 res!234079) b!405535))

(assert (= (and b!405535 res!234082) b!405533))

(assert (= (and b!405533 res!234078) b!405536))

(assert (= (and b!405536 res!234080) b!405534))

(assert (= (and b!405534 res!234084) b!405540))

(assert (= (and b!405540 res!234085) b!405539))

(assert (= (and b!405539 res!234081) b!405538))

(assert (= (and b!405538 res!234087) b!405544))

(assert (= (and b!405544 res!234083) b!405541))

(assert (= (and b!405537 condMapEmpty!17007) mapIsEmpty!17007))

(assert (= (and b!405537 (not condMapEmpty!17007)) mapNonEmpty!17007))

(get-info :version)

(assert (= (and mapNonEmpty!17007 ((_ is ValueCellFull!4785) mapValue!17007)) b!405543))

(assert (= (and b!405537 ((_ is ValueCellFull!4785) mapDefault!17007)) b!405545))

(assert (= start!38838 b!405537))

(declare-fun m!397951 () Bool)

(assert (=> mapNonEmpty!17007 m!397951))

(declare-fun m!397953 () Bool)

(assert (=> start!38838 m!397953))

(declare-fun m!397955 () Bool)

(assert (=> start!38838 m!397955))

(declare-fun m!397957 () Bool)

(assert (=> b!405541 m!397957))

(declare-fun m!397959 () Bool)

(assert (=> b!405542 m!397959))

(declare-fun m!397961 () Bool)

(assert (=> b!405540 m!397961))

(declare-fun m!397963 () Bool)

(assert (=> b!405544 m!397963))

(declare-fun m!397965 () Bool)

(assert (=> b!405544 m!397965))

(declare-fun m!397967 () Bool)

(assert (=> b!405536 m!397967))

(declare-fun m!397969 () Bool)

(assert (=> b!405539 m!397969))

(declare-fun m!397971 () Bool)

(assert (=> b!405538 m!397971))

(declare-fun m!397973 () Bool)

(assert (=> b!405533 m!397973))

(check-sat (not b!405542) (not mapNonEmpty!17007) tp_is_empty!10257 (not start!38838) (not b!405533) (not b!405541) (not b!405540) (not b!405544) (not b!405538) (not b!405536))
(check-sat)
