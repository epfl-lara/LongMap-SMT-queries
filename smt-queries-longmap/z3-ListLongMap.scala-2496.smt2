; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38796 () Bool)

(assert start!38796)

(declare-fun b!404714 () Bool)

(declare-fun res!233451 () Bool)

(declare-fun e!243440 () Bool)

(assert (=> b!404714 (=> (not res!233451) (not e!243440))))

(declare-datatypes ((array!24325 0))(
  ( (array!24326 (arr!11612 (Array (_ BitVec 32) (_ BitVec 64))) (size!11964 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24325)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24325 (_ BitVec 32)) Bool)

(assert (=> b!404714 (= res!233451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404715 () Bool)

(declare-fun e!243444 () Bool)

(assert (=> b!404715 (= e!243440 e!243444)))

(declare-fun res!233452 () Bool)

(assert (=> b!404715 (=> (not res!233452) (not e!243444))))

(declare-fun lt!188225 () array!24325)

(assert (=> b!404715 (= res!233452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188225 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404715 (= lt!188225 (array!24326 (store (arr!11612 _keys!709) i!563 k0!794) (size!11964 _keys!709)))))

(declare-fun mapIsEmpty!16944 () Bool)

(declare-fun mapRes!16944 () Bool)

(assert (=> mapIsEmpty!16944 mapRes!16944))

(declare-fun mapNonEmpty!16944 () Bool)

(declare-fun tp!33063 () Bool)

(declare-fun e!243439 () Bool)

(assert (=> mapNonEmpty!16944 (= mapRes!16944 (and tp!33063 e!243439))))

(declare-datatypes ((V!14725 0))(
  ( (V!14726 (val!5152 Int)) )
))
(declare-datatypes ((ValueCell!4764 0))(
  ( (ValueCellFull!4764 (v!7399 V!14725)) (EmptyCell!4764) )
))
(declare-datatypes ((array!24327 0))(
  ( (array!24328 (arr!11613 (Array (_ BitVec 32) ValueCell!4764)) (size!11965 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24327)

(declare-fun mapRest!16944 () (Array (_ BitVec 32) ValueCell!4764))

(declare-fun mapKey!16944 () (_ BitVec 32))

(declare-fun mapValue!16944 () ValueCell!4764)

(assert (=> mapNonEmpty!16944 (= (arr!11613 _values!549) (store mapRest!16944 mapKey!16944 mapValue!16944))))

(declare-fun b!404716 () Bool)

(declare-fun res!233453 () Bool)

(assert (=> b!404716 (=> (not res!233453) (not e!243440))))

(assert (=> b!404716 (= res!233453 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11964 _keys!709))))))

(declare-fun b!404717 () Bool)

(declare-fun res!233454 () Bool)

(assert (=> b!404717 (=> (not res!233454) (not e!243440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404717 (= res!233454 (validMask!0 mask!1025))))

(declare-fun b!404718 () Bool)

(declare-fun res!233457 () Bool)

(assert (=> b!404718 (=> (not res!233457) (not e!243440))))

(assert (=> b!404718 (= res!233457 (or (= (select (arr!11612 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11612 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404720 () Bool)

(declare-fun e!243442 () Bool)

(declare-fun tp_is_empty!10215 () Bool)

(assert (=> b!404720 (= e!243442 tp_is_empty!10215)))

(declare-fun b!404721 () Bool)

(declare-fun res!233456 () Bool)

(assert (=> b!404721 (=> (not res!233456) (not e!243440))))

(declare-fun arrayContainsKey!0 (array!24325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404721 (= res!233456 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404722 () Bool)

(declare-fun res!233449 () Bool)

(assert (=> b!404722 (=> (not res!233449) (not e!243440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404722 (= res!233449 (validKeyInArray!0 k0!794))))

(declare-fun b!404723 () Bool)

(assert (=> b!404723 (= e!243444 false)))

(declare-fun lt!188224 () Bool)

(declare-datatypes ((List!6759 0))(
  ( (Nil!6756) (Cons!6755 (h!7611 (_ BitVec 64)) (t!11933 List!6759)) )
))
(declare-fun arrayNoDuplicates!0 (array!24325 (_ BitVec 32) List!6759) Bool)

(assert (=> b!404723 (= lt!188224 (arrayNoDuplicates!0 lt!188225 #b00000000000000000000000000000000 Nil!6756))))

(declare-fun b!404724 () Bool)

(assert (=> b!404724 (= e!243439 tp_is_empty!10215)))

(declare-fun b!404719 () Bool)

(declare-fun res!233450 () Bool)

(assert (=> b!404719 (=> (not res!233450) (not e!243440))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404719 (= res!233450 (and (= (size!11965 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11964 _keys!709) (size!11965 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!233448 () Bool)

(assert (=> start!38796 (=> (not res!233448) (not e!243440))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38796 (= res!233448 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11964 _keys!709))))))

(assert (=> start!38796 e!243440))

(assert (=> start!38796 true))

(declare-fun e!243441 () Bool)

(declare-fun array_inv!8490 (array!24327) Bool)

(assert (=> start!38796 (and (array_inv!8490 _values!549) e!243441)))

(declare-fun array_inv!8491 (array!24325) Bool)

(assert (=> start!38796 (array_inv!8491 _keys!709)))

(declare-fun b!404725 () Bool)

(declare-fun res!233455 () Bool)

(assert (=> b!404725 (=> (not res!233455) (not e!243440))))

(assert (=> b!404725 (= res!233455 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6756))))

(declare-fun b!404726 () Bool)

(assert (=> b!404726 (= e!243441 (and e!243442 mapRes!16944))))

(declare-fun condMapEmpty!16944 () Bool)

(declare-fun mapDefault!16944 () ValueCell!4764)

(assert (=> b!404726 (= condMapEmpty!16944 (= (arr!11613 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4764)) mapDefault!16944)))))

(assert (= (and start!38796 res!233448) b!404717))

(assert (= (and b!404717 res!233454) b!404719))

(assert (= (and b!404719 res!233450) b!404714))

(assert (= (and b!404714 res!233451) b!404725))

(assert (= (and b!404725 res!233455) b!404716))

(assert (= (and b!404716 res!233453) b!404722))

(assert (= (and b!404722 res!233449) b!404718))

(assert (= (and b!404718 res!233457) b!404721))

(assert (= (and b!404721 res!233456) b!404715))

(assert (= (and b!404715 res!233452) b!404723))

(assert (= (and b!404726 condMapEmpty!16944) mapIsEmpty!16944))

(assert (= (and b!404726 (not condMapEmpty!16944)) mapNonEmpty!16944))

(get-info :version)

(assert (= (and mapNonEmpty!16944 ((_ is ValueCellFull!4764) mapValue!16944)) b!404724))

(assert (= (and b!404726 ((_ is ValueCellFull!4764) mapDefault!16944)) b!404720))

(assert (= start!38796 b!404726))

(declare-fun m!397447 () Bool)

(assert (=> b!404725 m!397447))

(declare-fun m!397449 () Bool)

(assert (=> b!404714 m!397449))

(declare-fun m!397451 () Bool)

(assert (=> b!404717 m!397451))

(declare-fun m!397453 () Bool)

(assert (=> start!38796 m!397453))

(declare-fun m!397455 () Bool)

(assert (=> start!38796 m!397455))

(declare-fun m!397457 () Bool)

(assert (=> b!404721 m!397457))

(declare-fun m!397459 () Bool)

(assert (=> b!404715 m!397459))

(declare-fun m!397461 () Bool)

(assert (=> b!404715 m!397461))

(declare-fun m!397463 () Bool)

(assert (=> mapNonEmpty!16944 m!397463))

(declare-fun m!397465 () Bool)

(assert (=> b!404723 m!397465))

(declare-fun m!397467 () Bool)

(assert (=> b!404722 m!397467))

(declare-fun m!397469 () Bool)

(assert (=> b!404718 m!397469))

(check-sat (not start!38796) tp_is_empty!10215 (not b!404717) (not b!404723) (not b!404725) (not mapNonEmpty!16944) (not b!404722) (not b!404714) (not b!404715) (not b!404721))
(check-sat)
