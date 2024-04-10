; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38358 () Bool)

(assert start!38358)

(declare-fun b!395626 () Bool)

(declare-fun res!226834 () Bool)

(declare-fun e!239508 () Bool)

(assert (=> b!395626 (=> (not res!226834) (not e!239508))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395626 (= res!226834 (validMask!0 mask!1025))))

(declare-fun b!395627 () Bool)

(declare-fun e!239510 () Bool)

(declare-fun tp_is_empty!9825 () Bool)

(assert (=> b!395627 (= e!239510 tp_is_empty!9825)))

(declare-fun b!395628 () Bool)

(declare-fun res!226836 () Bool)

(assert (=> b!395628 (=> (not res!226836) (not e!239508))))

(declare-datatypes ((array!23557 0))(
  ( (array!23558 (arr!11231 (Array (_ BitVec 32) (_ BitVec 64))) (size!11583 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23557)

(declare-datatypes ((V!14205 0))(
  ( (V!14206 (val!4957 Int)) )
))
(declare-datatypes ((ValueCell!4569 0))(
  ( (ValueCellFull!4569 (v!7203 V!14205)) (EmptyCell!4569) )
))
(declare-datatypes ((array!23559 0))(
  ( (array!23560 (arr!11232 (Array (_ BitVec 32) ValueCell!4569)) (size!11584 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23559)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395628 (= res!226836 (and (= (size!11584 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11583 _keys!709) (size!11584 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395629 () Bool)

(declare-fun e!239509 () Bool)

(declare-fun e!239512 () Bool)

(declare-fun mapRes!16350 () Bool)

(assert (=> b!395629 (= e!239509 (and e!239512 mapRes!16350))))

(declare-fun condMapEmpty!16350 () Bool)

(declare-fun mapDefault!16350 () ValueCell!4569)

(assert (=> b!395629 (= condMapEmpty!16350 (= (arr!11232 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4569)) mapDefault!16350)))))

(declare-fun mapNonEmpty!16350 () Bool)

(declare-fun tp!32145 () Bool)

(assert (=> mapNonEmpty!16350 (= mapRes!16350 (and tp!32145 e!239510))))

(declare-fun mapKey!16350 () (_ BitVec 32))

(declare-fun mapValue!16350 () ValueCell!4569)

(declare-fun mapRest!16350 () (Array (_ BitVec 32) ValueCell!4569))

(assert (=> mapNonEmpty!16350 (= (arr!11232 _values!549) (store mapRest!16350 mapKey!16350 mapValue!16350))))

(declare-fun res!226833 () Bool)

(assert (=> start!38358 (=> (not res!226833) (not e!239508))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38358 (= res!226833 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11583 _keys!709))))))

(assert (=> start!38358 e!239508))

(assert (=> start!38358 true))

(declare-fun array_inv!8244 (array!23559) Bool)

(assert (=> start!38358 (and (array_inv!8244 _values!549) e!239509)))

(declare-fun array_inv!8245 (array!23557) Bool)

(assert (=> start!38358 (array_inv!8245 _keys!709)))

(declare-fun b!395630 () Bool)

(assert (=> b!395630 (= e!239512 tp_is_empty!9825)))

(declare-fun b!395631 () Bool)

(declare-fun res!226837 () Bool)

(assert (=> b!395631 (=> (not res!226837) (not e!239508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23557 (_ BitVec 32)) Bool)

(assert (=> b!395631 (= res!226837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16350 () Bool)

(assert (=> mapIsEmpty!16350 mapRes!16350))

(declare-fun b!395632 () Bool)

(declare-fun res!226831 () Bool)

(assert (=> b!395632 (=> (not res!226831) (not e!239508))))

(declare-datatypes ((List!6514 0))(
  ( (Nil!6511) (Cons!6510 (h!7366 (_ BitVec 64)) (t!11688 List!6514)) )
))
(declare-fun arrayNoDuplicates!0 (array!23557 (_ BitVec 32) List!6514) Bool)

(assert (=> b!395632 (= res!226831 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6511))))

(declare-fun b!395633 () Bool)

(assert (=> b!395633 (= e!239508 (and (= (size!11583 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11583 _keys!709))))))

(declare-fun b!395634 () Bool)

(declare-fun res!226830 () Bool)

(assert (=> b!395634 (=> (not res!226830) (not e!239508))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395634 (= res!226830 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11583 _keys!709))))))

(declare-fun b!395635 () Bool)

(declare-fun res!226832 () Bool)

(assert (=> b!395635 (=> (not res!226832) (not e!239508))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395635 (= res!226832 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395636 () Bool)

(declare-fun res!226835 () Bool)

(assert (=> b!395636 (=> (not res!226835) (not e!239508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395636 (= res!226835 (validKeyInArray!0 k0!794))))

(declare-fun b!395637 () Bool)

(declare-fun res!226829 () Bool)

(assert (=> b!395637 (=> (not res!226829) (not e!239508))))

(assert (=> b!395637 (= res!226829 (or (= (select (arr!11231 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11231 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38358 res!226833) b!395626))

(assert (= (and b!395626 res!226834) b!395628))

(assert (= (and b!395628 res!226836) b!395631))

(assert (= (and b!395631 res!226837) b!395632))

(assert (= (and b!395632 res!226831) b!395634))

(assert (= (and b!395634 res!226830) b!395636))

(assert (= (and b!395636 res!226835) b!395637))

(assert (= (and b!395637 res!226829) b!395635))

(assert (= (and b!395635 res!226832) b!395633))

(assert (= (and b!395629 condMapEmpty!16350) mapIsEmpty!16350))

(assert (= (and b!395629 (not condMapEmpty!16350)) mapNonEmpty!16350))

(get-info :version)

(assert (= (and mapNonEmpty!16350 ((_ is ValueCellFull!4569) mapValue!16350)) b!395627))

(assert (= (and b!395629 ((_ is ValueCellFull!4569) mapDefault!16350)) b!395630))

(assert (= start!38358 b!395629))

(declare-fun m!391585 () Bool)

(assert (=> start!38358 m!391585))

(declare-fun m!391587 () Bool)

(assert (=> start!38358 m!391587))

(declare-fun m!391589 () Bool)

(assert (=> b!395637 m!391589))

(declare-fun m!391591 () Bool)

(assert (=> b!395631 m!391591))

(declare-fun m!391593 () Bool)

(assert (=> mapNonEmpty!16350 m!391593))

(declare-fun m!391595 () Bool)

(assert (=> b!395635 m!391595))

(declare-fun m!391597 () Bool)

(assert (=> b!395636 m!391597))

(declare-fun m!391599 () Bool)

(assert (=> b!395626 m!391599))

(declare-fun m!391601 () Bool)

(assert (=> b!395632 m!391601))

(check-sat (not b!395631) (not b!395626) (not b!395632) (not mapNonEmpty!16350) (not b!395635) tp_is_empty!9825 (not start!38358) (not b!395636))
(check-sat)
