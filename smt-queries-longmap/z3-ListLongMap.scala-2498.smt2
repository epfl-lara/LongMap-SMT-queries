; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38792 () Bool)

(assert start!38792)

(declare-fun res!233470 () Bool)

(declare-fun e!243355 () Bool)

(assert (=> start!38792 (=> (not res!233470) (not e!243355))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24327 0))(
  ( (array!24328 (arr!11613 (Array (_ BitVec 32) (_ BitVec 64))) (size!11966 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24327)

(assert (=> start!38792 (= res!233470 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11966 _keys!709))))))

(assert (=> start!38792 e!243355))

(assert (=> start!38792 true))

(declare-datatypes ((V!14739 0))(
  ( (V!14740 (val!5157 Int)) )
))
(declare-datatypes ((ValueCell!4769 0))(
  ( (ValueCellFull!4769 (v!7398 V!14739)) (EmptyCell!4769) )
))
(declare-datatypes ((array!24329 0))(
  ( (array!24330 (arr!11614 (Array (_ BitVec 32) ValueCell!4769)) (size!11967 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24329)

(declare-fun e!243356 () Bool)

(declare-fun array_inv!8524 (array!24329) Bool)

(assert (=> start!38792 (and (array_inv!8524 _values!549) e!243356)))

(declare-fun array_inv!8525 (array!24327) Bool)

(assert (=> start!38792 (array_inv!8525 _keys!709)))

(declare-fun b!404638 () Bool)

(declare-fun res!233469 () Bool)

(assert (=> b!404638 (=> (not res!233469) (not e!243355))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24327 (_ BitVec 32)) Bool)

(assert (=> b!404638 (= res!233469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404639 () Bool)

(declare-fun e!243360 () Bool)

(declare-fun tp_is_empty!10225 () Bool)

(assert (=> b!404639 (= e!243360 tp_is_empty!10225)))

(declare-fun b!404640 () Bool)

(declare-fun res!233472 () Bool)

(assert (=> b!404640 (=> (not res!233472) (not e!243355))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404640 (= res!233472 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16959 () Bool)

(declare-fun mapRes!16959 () Bool)

(declare-fun tp!33078 () Bool)

(declare-fun e!243359 () Bool)

(assert (=> mapNonEmpty!16959 (= mapRes!16959 (and tp!33078 e!243359))))

(declare-fun mapValue!16959 () ValueCell!4769)

(declare-fun mapRest!16959 () (Array (_ BitVec 32) ValueCell!4769))

(declare-fun mapKey!16959 () (_ BitVec 32))

(assert (=> mapNonEmpty!16959 (= (arr!11614 _values!549) (store mapRest!16959 mapKey!16959 mapValue!16959))))

(declare-fun b!404641 () Bool)

(declare-fun res!233473 () Bool)

(assert (=> b!404641 (=> (not res!233473) (not e!243355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404641 (= res!233473 (validKeyInArray!0 k0!794))))

(declare-fun b!404642 () Bool)

(declare-fun e!243357 () Bool)

(assert (=> b!404642 (= e!243357 false)))

(declare-fun lt!188021 () Bool)

(declare-fun lt!188020 () array!24327)

(declare-datatypes ((List!6734 0))(
  ( (Nil!6731) (Cons!6730 (h!7586 (_ BitVec 64)) (t!11899 List!6734)) )
))
(declare-fun arrayNoDuplicates!0 (array!24327 (_ BitVec 32) List!6734) Bool)

(assert (=> b!404642 (= lt!188021 (arrayNoDuplicates!0 lt!188020 #b00000000000000000000000000000000 Nil!6731))))

(declare-fun b!404643 () Bool)

(declare-fun res!233476 () Bool)

(assert (=> b!404643 (=> (not res!233476) (not e!243355))))

(assert (=> b!404643 (= res!233476 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6731))))

(declare-fun b!404644 () Bool)

(assert (=> b!404644 (= e!243355 e!243357)))

(declare-fun res!233471 () Bool)

(assert (=> b!404644 (=> (not res!233471) (not e!243357))))

(assert (=> b!404644 (= res!233471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188020 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404644 (= lt!188020 (array!24328 (store (arr!11613 _keys!709) i!563 k0!794) (size!11966 _keys!709)))))

(declare-fun mapIsEmpty!16959 () Bool)

(assert (=> mapIsEmpty!16959 mapRes!16959))

(declare-fun b!404645 () Bool)

(assert (=> b!404645 (= e!243356 (and e!243360 mapRes!16959))))

(declare-fun condMapEmpty!16959 () Bool)

(declare-fun mapDefault!16959 () ValueCell!4769)

(assert (=> b!404645 (= condMapEmpty!16959 (= (arr!11614 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4769)) mapDefault!16959)))))

(declare-fun b!404646 () Bool)

(declare-fun res!233475 () Bool)

(assert (=> b!404646 (=> (not res!233475) (not e!243355))))

(assert (=> b!404646 (= res!233475 (or (= (select (arr!11613 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11613 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404647 () Bool)

(declare-fun res!233477 () Bool)

(assert (=> b!404647 (=> (not res!233477) (not e!243355))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404647 (= res!233477 (and (= (size!11967 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11966 _keys!709) (size!11967 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404648 () Bool)

(declare-fun res!233478 () Bool)

(assert (=> b!404648 (=> (not res!233478) (not e!243355))))

(assert (=> b!404648 (= res!233478 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11966 _keys!709))))))

(declare-fun b!404649 () Bool)

(declare-fun res!233474 () Bool)

(assert (=> b!404649 (=> (not res!233474) (not e!243355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404649 (= res!233474 (validMask!0 mask!1025))))

(declare-fun b!404650 () Bool)

(assert (=> b!404650 (= e!243359 tp_is_empty!10225)))

(assert (= (and start!38792 res!233470) b!404649))

(assert (= (and b!404649 res!233474) b!404647))

(assert (= (and b!404647 res!233477) b!404638))

(assert (= (and b!404638 res!233469) b!404643))

(assert (= (and b!404643 res!233476) b!404648))

(assert (= (and b!404648 res!233478) b!404641))

(assert (= (and b!404641 res!233473) b!404646))

(assert (= (and b!404646 res!233475) b!404640))

(assert (= (and b!404640 res!233472) b!404644))

(assert (= (and b!404644 res!233471) b!404642))

(assert (= (and b!404645 condMapEmpty!16959) mapIsEmpty!16959))

(assert (= (and b!404645 (not condMapEmpty!16959)) mapNonEmpty!16959))

(get-info :version)

(assert (= (and mapNonEmpty!16959 ((_ is ValueCellFull!4769) mapValue!16959)) b!404650))

(assert (= (and b!404645 ((_ is ValueCellFull!4769) mapDefault!16959)) b!404639))

(assert (= start!38792 b!404645))

(declare-fun m!396843 () Bool)

(assert (=> b!404646 m!396843))

(declare-fun m!396845 () Bool)

(assert (=> b!404642 m!396845))

(declare-fun m!396847 () Bool)

(assert (=> b!404641 m!396847))

(declare-fun m!396849 () Bool)

(assert (=> b!404638 m!396849))

(declare-fun m!396851 () Bool)

(assert (=> b!404640 m!396851))

(declare-fun m!396853 () Bool)

(assert (=> start!38792 m!396853))

(declare-fun m!396855 () Bool)

(assert (=> start!38792 m!396855))

(declare-fun m!396857 () Bool)

(assert (=> mapNonEmpty!16959 m!396857))

(declare-fun m!396859 () Bool)

(assert (=> b!404643 m!396859))

(declare-fun m!396861 () Bool)

(assert (=> b!404644 m!396861))

(declare-fun m!396863 () Bool)

(assert (=> b!404644 m!396863))

(declare-fun m!396865 () Bool)

(assert (=> b!404649 m!396865))

(check-sat (not b!404643) (not b!404642) (not b!404638) tp_is_empty!10225 (not b!404649) (not b!404641) (not b!404644) (not start!38792) (not mapNonEmpty!16959) (not b!404640))
(check-sat)
