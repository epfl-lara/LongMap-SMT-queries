; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38828 () Bool)

(assert start!38828)

(declare-fun b!405562 () Bool)

(declare-fun res!234138 () Bool)

(declare-fun e!243822 () Bool)

(assert (=> b!405562 (=> (not res!234138) (not e!243822))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405562 (= res!234138 (validKeyInArray!0 k0!794))))

(declare-fun b!405563 () Bool)

(declare-fun res!234143 () Bool)

(assert (=> b!405563 (=> (not res!234143) (not e!243822))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24402 0))(
  ( (array!24403 (arr!11650 (Array (_ BitVec 32) (_ BitVec 64))) (size!12002 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24402)

(assert (=> b!405563 (= res!234143 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12002 _keys!709))))))

(declare-fun res!234135 () Bool)

(assert (=> start!38828 (=> (not res!234135) (not e!243822))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38828 (= res!234135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12002 _keys!709))))))

(assert (=> start!38828 e!243822))

(assert (=> start!38828 true))

(declare-datatypes ((V!14787 0))(
  ( (V!14788 (val!5175 Int)) )
))
(declare-datatypes ((ValueCell!4787 0))(
  ( (ValueCellFull!4787 (v!7423 V!14787)) (EmptyCell!4787) )
))
(declare-datatypes ((array!24404 0))(
  ( (array!24405 (arr!11651 (Array (_ BitVec 32) ValueCell!4787)) (size!12003 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24404)

(declare-fun e!243826 () Bool)

(declare-fun array_inv!8606 (array!24404) Bool)

(assert (=> start!38828 (and (array_inv!8606 _values!549) e!243826)))

(declare-fun array_inv!8607 (array!24402) Bool)

(assert (=> start!38828 (array_inv!8607 _keys!709)))

(declare-fun mapIsEmpty!17013 () Bool)

(declare-fun mapRes!17013 () Bool)

(assert (=> mapIsEmpty!17013 mapRes!17013))

(declare-fun b!405564 () Bool)

(declare-fun e!243825 () Bool)

(assert (=> b!405564 (= e!243822 e!243825)))

(declare-fun res!234141 () Bool)

(assert (=> b!405564 (=> (not res!234141) (not e!243825))))

(declare-fun lt!188382 () array!24402)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24402 (_ BitVec 32)) Bool)

(assert (=> b!405564 (= res!234141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188382 mask!1025))))

(assert (=> b!405564 (= lt!188382 (array!24403 (store (arr!11650 _keys!709) i!563 k0!794) (size!12002 _keys!709)))))

(declare-fun b!405565 () Bool)

(declare-fun e!243823 () Bool)

(declare-fun tp_is_empty!10261 () Bool)

(assert (=> b!405565 (= e!243823 tp_is_empty!10261)))

(declare-fun b!405566 () Bool)

(declare-fun res!234136 () Bool)

(assert (=> b!405566 (=> (not res!234136) (not e!243822))))

(assert (=> b!405566 (= res!234136 (or (= (select (arr!11650 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11650 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405567 () Bool)

(declare-fun res!234142 () Bool)

(assert (=> b!405567 (=> (not res!234142) (not e!243822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405567 (= res!234142 (validMask!0 mask!1025))))

(declare-fun b!405568 () Bool)

(declare-fun res!234139 () Bool)

(assert (=> b!405568 (=> (not res!234139) (not e!243822))))

(declare-fun arrayContainsKey!0 (array!24402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405568 (= res!234139 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17013 () Bool)

(declare-fun tp!33132 () Bool)

(assert (=> mapNonEmpty!17013 (= mapRes!17013 (and tp!33132 e!243823))))

(declare-fun mapRest!17013 () (Array (_ BitVec 32) ValueCell!4787))

(declare-fun mapKey!17013 () (_ BitVec 32))

(declare-fun mapValue!17013 () ValueCell!4787)

(assert (=> mapNonEmpty!17013 (= (arr!11651 _values!549) (store mapRest!17013 mapKey!17013 mapValue!17013))))

(declare-fun b!405569 () Bool)

(declare-fun res!234140 () Bool)

(assert (=> b!405569 (=> (not res!234140) (not e!243822))))

(declare-datatypes ((List!6651 0))(
  ( (Nil!6648) (Cons!6647 (h!7503 (_ BitVec 64)) (t!11817 List!6651)) )
))
(declare-fun arrayNoDuplicates!0 (array!24402 (_ BitVec 32) List!6651) Bool)

(assert (=> b!405569 (= res!234140 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6648))))

(declare-fun b!405570 () Bool)

(declare-fun e!243824 () Bool)

(assert (=> b!405570 (= e!243826 (and e!243824 mapRes!17013))))

(declare-fun condMapEmpty!17013 () Bool)

(declare-fun mapDefault!17013 () ValueCell!4787)

(assert (=> b!405570 (= condMapEmpty!17013 (= (arr!11651 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4787)) mapDefault!17013)))))

(declare-fun b!405571 () Bool)

(declare-fun res!234137 () Bool)

(assert (=> b!405571 (=> (not res!234137) (not e!243822))))

(assert (=> b!405571 (= res!234137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405572 () Bool)

(assert (=> b!405572 (= e!243824 tp_is_empty!10261)))

(declare-fun b!405573 () Bool)

(declare-fun res!234144 () Bool)

(assert (=> b!405573 (=> (not res!234144) (not e!243822))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405573 (= res!234144 (and (= (size!12003 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12002 _keys!709) (size!12003 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405574 () Bool)

(assert (=> b!405574 (= e!243825 false)))

(declare-fun lt!188381 () Bool)

(assert (=> b!405574 (= lt!188381 (arrayNoDuplicates!0 lt!188382 #b00000000000000000000000000000000 Nil!6648))))

(assert (= (and start!38828 res!234135) b!405567))

(assert (= (and b!405567 res!234142) b!405573))

(assert (= (and b!405573 res!234144) b!405571))

(assert (= (and b!405571 res!234137) b!405569))

(assert (= (and b!405569 res!234140) b!405563))

(assert (= (and b!405563 res!234143) b!405562))

(assert (= (and b!405562 res!234138) b!405566))

(assert (= (and b!405566 res!234136) b!405568))

(assert (= (and b!405568 res!234139) b!405564))

(assert (= (and b!405564 res!234141) b!405574))

(assert (= (and b!405570 condMapEmpty!17013) mapIsEmpty!17013))

(assert (= (and b!405570 (not condMapEmpty!17013)) mapNonEmpty!17013))

(get-info :version)

(assert (= (and mapNonEmpty!17013 ((_ is ValueCellFull!4787) mapValue!17013)) b!405565))

(assert (= (and b!405570 ((_ is ValueCellFull!4787) mapDefault!17013)) b!405572))

(assert (= start!38828 b!405570))

(declare-fun m!398229 () Bool)

(assert (=> b!405569 m!398229))

(declare-fun m!398231 () Bool)

(assert (=> b!405566 m!398231))

(declare-fun m!398233 () Bool)

(assert (=> start!38828 m!398233))

(declare-fun m!398235 () Bool)

(assert (=> start!38828 m!398235))

(declare-fun m!398237 () Bool)

(assert (=> b!405571 m!398237))

(declare-fun m!398239 () Bool)

(assert (=> mapNonEmpty!17013 m!398239))

(declare-fun m!398241 () Bool)

(assert (=> b!405568 m!398241))

(declare-fun m!398243 () Bool)

(assert (=> b!405564 m!398243))

(declare-fun m!398245 () Bool)

(assert (=> b!405564 m!398245))

(declare-fun m!398247 () Bool)

(assert (=> b!405562 m!398247))

(declare-fun m!398249 () Bool)

(assert (=> b!405567 m!398249))

(declare-fun m!398251 () Bool)

(assert (=> b!405574 m!398251))

(check-sat (not b!405568) (not b!405571) (not b!405574) (not b!405562) (not mapNonEmpty!17013) (not b!405569) tp_is_empty!10261 (not b!405567) (not b!405564) (not start!38828))
(check-sat)
