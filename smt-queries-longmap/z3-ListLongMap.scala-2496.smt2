; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38780 () Bool)

(assert start!38780)

(declare-fun b!404626 () Bool)

(declare-fun res!233423 () Bool)

(declare-fun e!243391 () Bool)

(assert (=> b!404626 (=> (not res!233423) (not e!243391))))

(declare-datatypes ((array!24306 0))(
  ( (array!24307 (arr!11602 (Array (_ BitVec 32) (_ BitVec 64))) (size!11954 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24306)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404626 (= res!233423 (or (= (select (arr!11602 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11602 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404627 () Bool)

(declare-fun res!233424 () Bool)

(assert (=> b!404627 (=> (not res!233424) (not e!243391))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404627 (= res!233424 (validMask!0 mask!1025))))

(declare-fun b!404628 () Bool)

(declare-fun res!233418 () Bool)

(assert (=> b!404628 (=> (not res!233418) (not e!243391))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404628 (= res!233418 (validKeyInArray!0 k0!794))))

(declare-fun res!233417 () Bool)

(assert (=> start!38780 (=> (not res!233417) (not e!243391))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38780 (= res!233417 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11954 _keys!709))))))

(assert (=> start!38780 e!243391))

(assert (=> start!38780 true))

(declare-datatypes ((V!14723 0))(
  ( (V!14724 (val!5151 Int)) )
))
(declare-datatypes ((ValueCell!4763 0))(
  ( (ValueCellFull!4763 (v!7399 V!14723)) (EmptyCell!4763) )
))
(declare-datatypes ((array!24308 0))(
  ( (array!24309 (arr!11603 (Array (_ BitVec 32) ValueCell!4763)) (size!11955 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24308)

(declare-fun e!243390 () Bool)

(declare-fun array_inv!8566 (array!24308) Bool)

(assert (=> start!38780 (and (array_inv!8566 _values!549) e!243390)))

(declare-fun array_inv!8567 (array!24306) Bool)

(assert (=> start!38780 (array_inv!8567 _keys!709)))

(declare-fun b!404629 () Bool)

(declare-fun res!233416 () Bool)

(assert (=> b!404629 (=> (not res!233416) (not e!243391))))

(declare-datatypes ((List!6633 0))(
  ( (Nil!6630) (Cons!6629 (h!7485 (_ BitVec 64)) (t!11799 List!6633)) )
))
(declare-fun arrayNoDuplicates!0 (array!24306 (_ BitVec 32) List!6633) Bool)

(assert (=> b!404629 (= res!233416 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6630))))

(declare-fun b!404630 () Bool)

(declare-fun res!233420 () Bool)

(assert (=> b!404630 (=> (not res!233420) (not e!243391))))

(assert (=> b!404630 (= res!233420 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11954 _keys!709))))))

(declare-fun b!404631 () Bool)

(declare-fun res!233415 () Bool)

(assert (=> b!404631 (=> (not res!233415) (not e!243391))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404631 (= res!233415 (and (= (size!11955 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11954 _keys!709) (size!11955 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404632 () Bool)

(declare-fun res!233419 () Bool)

(assert (=> b!404632 (=> (not res!233419) (not e!243391))))

(declare-fun arrayContainsKey!0 (array!24306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404632 (= res!233419 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404633 () Bool)

(declare-fun e!243389 () Bool)

(declare-fun tp_is_empty!10213 () Bool)

(assert (=> b!404633 (= e!243389 tp_is_empty!10213)))

(declare-fun b!404634 () Bool)

(declare-fun e!243393 () Bool)

(declare-fun mapRes!16941 () Bool)

(assert (=> b!404634 (= e!243390 (and e!243393 mapRes!16941))))

(declare-fun condMapEmpty!16941 () Bool)

(declare-fun mapDefault!16941 () ValueCell!4763)

(assert (=> b!404634 (= condMapEmpty!16941 (= (arr!11603 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4763)) mapDefault!16941)))))

(declare-fun b!404635 () Bool)

(declare-fun res!233422 () Bool)

(assert (=> b!404635 (=> (not res!233422) (not e!243391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24306 (_ BitVec 32)) Bool)

(assert (=> b!404635 (= res!233422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16941 () Bool)

(assert (=> mapIsEmpty!16941 mapRes!16941))

(declare-fun mapNonEmpty!16941 () Bool)

(declare-fun tp!33060 () Bool)

(assert (=> mapNonEmpty!16941 (= mapRes!16941 (and tp!33060 e!243389))))

(declare-fun mapKey!16941 () (_ BitVec 32))

(declare-fun mapRest!16941 () (Array (_ BitVec 32) ValueCell!4763))

(declare-fun mapValue!16941 () ValueCell!4763)

(assert (=> mapNonEmpty!16941 (= (arr!11603 _values!549) (store mapRest!16941 mapKey!16941 mapValue!16941))))

(declare-fun b!404636 () Bool)

(declare-fun e!243392 () Bool)

(assert (=> b!404636 (= e!243391 e!243392)))

(declare-fun res!233421 () Bool)

(assert (=> b!404636 (=> (not res!233421) (not e!243392))))

(declare-fun lt!188238 () array!24306)

(assert (=> b!404636 (= res!233421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188238 mask!1025))))

(assert (=> b!404636 (= lt!188238 (array!24307 (store (arr!11602 _keys!709) i!563 k0!794) (size!11954 _keys!709)))))

(declare-fun b!404637 () Bool)

(assert (=> b!404637 (= e!243392 false)))

(declare-fun lt!188237 () Bool)

(assert (=> b!404637 (= lt!188237 (arrayNoDuplicates!0 lt!188238 #b00000000000000000000000000000000 Nil!6630))))

(declare-fun b!404638 () Bool)

(assert (=> b!404638 (= e!243393 tp_is_empty!10213)))

(assert (= (and start!38780 res!233417) b!404627))

(assert (= (and b!404627 res!233424) b!404631))

(assert (= (and b!404631 res!233415) b!404635))

(assert (= (and b!404635 res!233422) b!404629))

(assert (= (and b!404629 res!233416) b!404630))

(assert (= (and b!404630 res!233420) b!404628))

(assert (= (and b!404628 res!233418) b!404626))

(assert (= (and b!404626 res!233423) b!404632))

(assert (= (and b!404632 res!233419) b!404636))

(assert (= (and b!404636 res!233421) b!404637))

(assert (= (and b!404634 condMapEmpty!16941) mapIsEmpty!16941))

(assert (= (and b!404634 (not condMapEmpty!16941)) mapNonEmpty!16941))

(get-info :version)

(assert (= (and mapNonEmpty!16941 ((_ is ValueCellFull!4763) mapValue!16941)) b!404633))

(assert (= (and b!404634 ((_ is ValueCellFull!4763) mapDefault!16941)) b!404638))

(assert (= start!38780 b!404634))

(declare-fun m!397653 () Bool)

(assert (=> b!404632 m!397653))

(declare-fun m!397655 () Bool)

(assert (=> b!404626 m!397655))

(declare-fun m!397657 () Bool)

(assert (=> mapNonEmpty!16941 m!397657))

(declare-fun m!397659 () Bool)

(assert (=> b!404628 m!397659))

(declare-fun m!397661 () Bool)

(assert (=> b!404629 m!397661))

(declare-fun m!397663 () Bool)

(assert (=> b!404637 m!397663))

(declare-fun m!397665 () Bool)

(assert (=> b!404635 m!397665))

(declare-fun m!397667 () Bool)

(assert (=> b!404627 m!397667))

(declare-fun m!397669 () Bool)

(assert (=> start!38780 m!397669))

(declare-fun m!397671 () Bool)

(assert (=> start!38780 m!397671))

(declare-fun m!397673 () Bool)

(assert (=> b!404636 m!397673))

(declare-fun m!397675 () Bool)

(assert (=> b!404636 m!397675))

(check-sat (not b!404632) tp_is_empty!10213 (not b!404635) (not b!404629) (not b!404627) (not start!38780) (not mapNonEmpty!16941) (not b!404636) (not b!404628) (not b!404637))
(check-sat)
