; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38840 () Bool)

(assert start!38840)

(declare-fun b!405574 () Bool)

(declare-fun res!234195 () Bool)

(declare-fun e!243789 () Bool)

(assert (=> b!405574 (=> (not res!234195) (not e!243789))))

(declare-datatypes ((array!24421 0))(
  ( (array!24422 (arr!11660 (Array (_ BitVec 32) (_ BitVec 64))) (size!12013 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24421)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405574 (= res!234195 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405575 () Bool)

(declare-fun res!234191 () Bool)

(assert (=> b!405575 (=> (not res!234191) (not e!243789))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405575 (= res!234191 (or (= (select (arr!11660 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11660 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405576 () Bool)

(declare-fun res!234194 () Bool)

(assert (=> b!405576 (=> (not res!234194) (not e!243789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405576 (= res!234194 (validKeyInArray!0 k0!794))))

(declare-fun b!405577 () Bool)

(declare-fun e!243790 () Bool)

(declare-fun e!243788 () Bool)

(declare-fun mapRes!17031 () Bool)

(assert (=> b!405577 (= e!243790 (and e!243788 mapRes!17031))))

(declare-fun condMapEmpty!17031 () Bool)

(declare-datatypes ((V!14803 0))(
  ( (V!14804 (val!5181 Int)) )
))
(declare-datatypes ((ValueCell!4793 0))(
  ( (ValueCellFull!4793 (v!7422 V!14803)) (EmptyCell!4793) )
))
(declare-datatypes ((array!24423 0))(
  ( (array!24424 (arr!11661 (Array (_ BitVec 32) ValueCell!4793)) (size!12014 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24423)

(declare-fun mapDefault!17031 () ValueCell!4793)

(assert (=> b!405577 (= condMapEmpty!17031 (= (arr!11661 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4793)) mapDefault!17031)))))

(declare-fun b!405578 () Bool)

(declare-fun e!243787 () Bool)

(assert (=> b!405578 (= e!243789 e!243787)))

(declare-fun res!234198 () Bool)

(assert (=> b!405578 (=> (not res!234198) (not e!243787))))

(declare-fun lt!188164 () array!24421)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24421 (_ BitVec 32)) Bool)

(assert (=> b!405578 (= res!234198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188164 mask!1025))))

(assert (=> b!405578 (= lt!188164 (array!24422 (store (arr!11660 _keys!709) i!563 k0!794) (size!12013 _keys!709)))))

(declare-fun mapIsEmpty!17031 () Bool)

(assert (=> mapIsEmpty!17031 mapRes!17031))

(declare-fun b!405580 () Bool)

(declare-fun res!234196 () Bool)

(assert (=> b!405580 (=> (not res!234196) (not e!243789))))

(assert (=> b!405580 (= res!234196 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12013 _keys!709))))))

(declare-fun b!405581 () Bool)

(declare-fun res!234190 () Bool)

(assert (=> b!405581 (=> (not res!234190) (not e!243789))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405581 (= res!234190 (and (= (size!12014 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12013 _keys!709) (size!12014 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405582 () Bool)

(declare-fun res!234193 () Bool)

(assert (=> b!405582 (=> (not res!234193) (not e!243789))))

(declare-datatypes ((List!6754 0))(
  ( (Nil!6751) (Cons!6750 (h!7606 (_ BitVec 64)) (t!11919 List!6754)) )
))
(declare-fun arrayNoDuplicates!0 (array!24421 (_ BitVec 32) List!6754) Bool)

(assert (=> b!405582 (= res!234193 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6751))))

(declare-fun b!405583 () Bool)

(assert (=> b!405583 (= e!243787 false)))

(declare-fun lt!188165 () Bool)

(assert (=> b!405583 (= lt!188165 (arrayNoDuplicates!0 lt!188164 #b00000000000000000000000000000000 Nil!6751))))

(declare-fun mapNonEmpty!17031 () Bool)

(declare-fun tp!33150 () Bool)

(declare-fun e!243792 () Bool)

(assert (=> mapNonEmpty!17031 (= mapRes!17031 (and tp!33150 e!243792))))

(declare-fun mapRest!17031 () (Array (_ BitVec 32) ValueCell!4793))

(declare-fun mapKey!17031 () (_ BitVec 32))

(declare-fun mapValue!17031 () ValueCell!4793)

(assert (=> mapNonEmpty!17031 (= (arr!11661 _values!549) (store mapRest!17031 mapKey!17031 mapValue!17031))))

(declare-fun b!405584 () Bool)

(declare-fun res!234189 () Bool)

(assert (=> b!405584 (=> (not res!234189) (not e!243789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405584 (= res!234189 (validMask!0 mask!1025))))

(declare-fun b!405579 () Bool)

(declare-fun tp_is_empty!10273 () Bool)

(assert (=> b!405579 (= e!243788 tp_is_empty!10273)))

(declare-fun res!234192 () Bool)

(assert (=> start!38840 (=> (not res!234192) (not e!243789))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38840 (= res!234192 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12013 _keys!709))))))

(assert (=> start!38840 e!243789))

(assert (=> start!38840 true))

(declare-fun array_inv!8556 (array!24423) Bool)

(assert (=> start!38840 (and (array_inv!8556 _values!549) e!243790)))

(declare-fun array_inv!8557 (array!24421) Bool)

(assert (=> start!38840 (array_inv!8557 _keys!709)))

(declare-fun b!405585 () Bool)

(declare-fun res!234197 () Bool)

(assert (=> b!405585 (=> (not res!234197) (not e!243789))))

(assert (=> b!405585 (= res!234197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405586 () Bool)

(assert (=> b!405586 (= e!243792 tp_is_empty!10273)))

(assert (= (and start!38840 res!234192) b!405584))

(assert (= (and b!405584 res!234189) b!405581))

(assert (= (and b!405581 res!234190) b!405585))

(assert (= (and b!405585 res!234197) b!405582))

(assert (= (and b!405582 res!234193) b!405580))

(assert (= (and b!405580 res!234196) b!405576))

(assert (= (and b!405576 res!234194) b!405575))

(assert (= (and b!405575 res!234191) b!405574))

(assert (= (and b!405574 res!234195) b!405578))

(assert (= (and b!405578 res!234198) b!405583))

(assert (= (and b!405577 condMapEmpty!17031) mapIsEmpty!17031))

(assert (= (and b!405577 (not condMapEmpty!17031)) mapNonEmpty!17031))

(get-info :version)

(assert (= (and mapNonEmpty!17031 ((_ is ValueCellFull!4793) mapValue!17031)) b!405586))

(assert (= (and b!405577 ((_ is ValueCellFull!4793) mapDefault!17031)) b!405579))

(assert (= start!38840 b!405577))

(declare-fun m!397419 () Bool)

(assert (=> b!405582 m!397419))

(declare-fun m!397421 () Bool)

(assert (=> b!405578 m!397421))

(declare-fun m!397423 () Bool)

(assert (=> b!405578 m!397423))

(declare-fun m!397425 () Bool)

(assert (=> b!405584 m!397425))

(declare-fun m!397427 () Bool)

(assert (=> start!38840 m!397427))

(declare-fun m!397429 () Bool)

(assert (=> start!38840 m!397429))

(declare-fun m!397431 () Bool)

(assert (=> b!405583 m!397431))

(declare-fun m!397433 () Bool)

(assert (=> b!405585 m!397433))

(declare-fun m!397435 () Bool)

(assert (=> b!405574 m!397435))

(declare-fun m!397437 () Bool)

(assert (=> mapNonEmpty!17031 m!397437))

(declare-fun m!397439 () Bool)

(assert (=> b!405576 m!397439))

(declare-fun m!397441 () Bool)

(assert (=> b!405575 m!397441))

(check-sat (not start!38840) (not b!405576) tp_is_empty!10273 (not b!405578) (not b!405583) (not b!405584) (not b!405585) (not b!405574) (not mapNonEmpty!17031) (not b!405582))
(check-sat)
