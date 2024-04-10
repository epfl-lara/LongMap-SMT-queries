; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38898 () Bool)

(assert start!38898)

(declare-fun mapIsEmpty!17097 () Bool)

(declare-fun mapRes!17097 () Bool)

(assert (=> mapIsEmpty!17097 mapRes!17097))

(declare-fun mapNonEmpty!17097 () Bool)

(declare-fun tp!33216 () Bool)

(declare-fun e!244362 () Bool)

(assert (=> mapNonEmpty!17097 (= mapRes!17097 (and tp!33216 e!244362))))

(declare-datatypes ((V!14861 0))(
  ( (V!14862 (val!5203 Int)) )
))
(declare-datatypes ((ValueCell!4815 0))(
  ( (ValueCellFull!4815 (v!7450 V!14861)) (EmptyCell!4815) )
))
(declare-datatypes ((array!24523 0))(
  ( (array!24524 (arr!11711 (Array (_ BitVec 32) ValueCell!4815)) (size!12063 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24523)

(declare-fun mapRest!17097 () (Array (_ BitVec 32) ValueCell!4815))

(declare-fun mapKey!17097 () (_ BitVec 32))

(declare-fun mapValue!17097 () ValueCell!4815)

(assert (=> mapNonEmpty!17097 (= (arr!11711 _values!549) (store mapRest!17097 mapKey!17097 mapValue!17097))))

(declare-fun b!406703 () Bool)

(declare-fun res!234983 () Bool)

(declare-fun e!244361 () Bool)

(assert (=> b!406703 (=> (not res!234983) (not e!244361))))

(declare-datatypes ((array!24525 0))(
  ( (array!24526 (arr!11712 (Array (_ BitVec 32) (_ BitVec 64))) (size!12064 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24525)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406703 (= res!234983 (or (= (select (arr!11712 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11712 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406704 () Bool)

(declare-fun e!244359 () Bool)

(assert (=> b!406704 (= e!244361 e!244359)))

(declare-fun res!234986 () Bool)

(assert (=> b!406704 (=> (not res!234986) (not e!244359))))

(declare-fun lt!188531 () array!24525)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24525 (_ BitVec 32)) Bool)

(assert (=> b!406704 (= res!234986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188531 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!406704 (= lt!188531 (array!24526 (store (arr!11712 _keys!709) i!563 k0!794) (size!12064 _keys!709)))))

(declare-fun b!406705 () Bool)

(declare-fun tp_is_empty!10317 () Bool)

(assert (=> b!406705 (= e!244362 tp_is_empty!10317)))

(declare-fun b!406706 () Bool)

(declare-fun res!234978 () Bool)

(assert (=> b!406706 (=> (not res!234978) (not e!244361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406706 (= res!234978 (validMask!0 mask!1025))))

(declare-fun b!406707 () Bool)

(declare-fun e!244360 () Bool)

(assert (=> b!406707 (= e!244360 tp_is_empty!10317)))

(declare-fun b!406708 () Bool)

(declare-fun res!234987 () Bool)

(assert (=> b!406708 (=> (not res!234987) (not e!244361))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406708 (= res!234987 (and (= (size!12063 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12064 _keys!709) (size!12063 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406709 () Bool)

(declare-fun res!234979 () Bool)

(assert (=> b!406709 (=> (not res!234979) (not e!244361))))

(assert (=> b!406709 (= res!234979 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12064 _keys!709))))))

(declare-fun res!234982 () Bool)

(assert (=> start!38898 (=> (not res!234982) (not e!244361))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38898 (= res!234982 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12064 _keys!709))))))

(assert (=> start!38898 e!244361))

(assert (=> start!38898 true))

(declare-fun e!244358 () Bool)

(declare-fun array_inv!8552 (array!24523) Bool)

(assert (=> start!38898 (and (array_inv!8552 _values!549) e!244358)))

(declare-fun array_inv!8553 (array!24525) Bool)

(assert (=> start!38898 (array_inv!8553 _keys!709)))

(declare-fun b!406710 () Bool)

(assert (=> b!406710 (= e!244359 false)))

(declare-fun lt!188530 () Bool)

(declare-datatypes ((List!6799 0))(
  ( (Nil!6796) (Cons!6795 (h!7651 (_ BitVec 64)) (t!11973 List!6799)) )
))
(declare-fun arrayNoDuplicates!0 (array!24525 (_ BitVec 32) List!6799) Bool)

(assert (=> b!406710 (= lt!188530 (arrayNoDuplicates!0 lt!188531 #b00000000000000000000000000000000 Nil!6796))))

(declare-fun b!406711 () Bool)

(assert (=> b!406711 (= e!244358 (and e!244360 mapRes!17097))))

(declare-fun condMapEmpty!17097 () Bool)

(declare-fun mapDefault!17097 () ValueCell!4815)

(assert (=> b!406711 (= condMapEmpty!17097 (= (arr!11711 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4815)) mapDefault!17097)))))

(declare-fun b!406712 () Bool)

(declare-fun res!234984 () Bool)

(assert (=> b!406712 (=> (not res!234984) (not e!244361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406712 (= res!234984 (validKeyInArray!0 k0!794))))

(declare-fun b!406713 () Bool)

(declare-fun res!234980 () Bool)

(assert (=> b!406713 (=> (not res!234980) (not e!244361))))

(declare-fun arrayContainsKey!0 (array!24525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406713 (= res!234980 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406714 () Bool)

(declare-fun res!234981 () Bool)

(assert (=> b!406714 (=> (not res!234981) (not e!244361))))

(assert (=> b!406714 (= res!234981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406715 () Bool)

(declare-fun res!234985 () Bool)

(assert (=> b!406715 (=> (not res!234985) (not e!244361))))

(assert (=> b!406715 (= res!234985 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6796))))

(assert (= (and start!38898 res!234982) b!406706))

(assert (= (and b!406706 res!234978) b!406708))

(assert (= (and b!406708 res!234987) b!406714))

(assert (= (and b!406714 res!234981) b!406715))

(assert (= (and b!406715 res!234985) b!406709))

(assert (= (and b!406709 res!234979) b!406712))

(assert (= (and b!406712 res!234984) b!406703))

(assert (= (and b!406703 res!234983) b!406713))

(assert (= (and b!406713 res!234980) b!406704))

(assert (= (and b!406704 res!234986) b!406710))

(assert (= (and b!406711 condMapEmpty!17097) mapIsEmpty!17097))

(assert (= (and b!406711 (not condMapEmpty!17097)) mapNonEmpty!17097))

(get-info :version)

(assert (= (and mapNonEmpty!17097 ((_ is ValueCellFull!4815) mapValue!17097)) b!406705))

(assert (= (and b!406711 ((_ is ValueCellFull!4815) mapDefault!17097)) b!406707))

(assert (= start!38898 b!406711))

(declare-fun m!398671 () Bool)

(assert (=> b!406710 m!398671))

(declare-fun m!398673 () Bool)

(assert (=> b!406703 m!398673))

(declare-fun m!398675 () Bool)

(assert (=> b!406704 m!398675))

(declare-fun m!398677 () Bool)

(assert (=> b!406704 m!398677))

(declare-fun m!398679 () Bool)

(assert (=> b!406713 m!398679))

(declare-fun m!398681 () Bool)

(assert (=> b!406706 m!398681))

(declare-fun m!398683 () Bool)

(assert (=> mapNonEmpty!17097 m!398683))

(declare-fun m!398685 () Bool)

(assert (=> start!38898 m!398685))

(declare-fun m!398687 () Bool)

(assert (=> start!38898 m!398687))

(declare-fun m!398689 () Bool)

(assert (=> b!406714 m!398689))

(declare-fun m!398691 () Bool)

(assert (=> b!406715 m!398691))

(declare-fun m!398693 () Bool)

(assert (=> b!406712 m!398693))

(check-sat (not b!406710) (not start!38898) (not b!406715) (not b!406713) (not b!406706) (not b!406712) (not b!406704) tp_is_empty!10317 (not mapNonEmpty!17097) (not b!406714))
(check-sat)
