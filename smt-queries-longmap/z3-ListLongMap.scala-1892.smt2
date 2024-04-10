; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33844 () Bool)

(assert start!33844)

(declare-fun b_free!7023 () Bool)

(declare-fun b_next!7023 () Bool)

(assert (=> start!33844 (= b_free!7023 (not b_next!7023))))

(declare-fun tp!24581 () Bool)

(declare-fun b_and!14209 () Bool)

(assert (=> start!33844 (= tp!24581 b_and!14209)))

(declare-fun b!336699 () Bool)

(declare-fun res!185859 () Bool)

(declare-fun e!206661 () Bool)

(assert (=> b!336699 (=> (not res!185859) (not e!206661))))

(declare-datatypes ((array!17547 0))(
  ( (array!17548 (arr!8301 (Array (_ BitVec 32) (_ BitVec 64))) (size!8653 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17547)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336699 (= res!185859 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336700 () Bool)

(declare-fun e!206662 () Bool)

(declare-fun e!206663 () Bool)

(declare-fun mapRes!11868 () Bool)

(assert (=> b!336700 (= e!206662 (and e!206663 mapRes!11868))))

(declare-fun condMapEmpty!11868 () Bool)

(declare-datatypes ((V!10277 0))(
  ( (V!10278 (val!3532 Int)) )
))
(declare-datatypes ((ValueCell!3144 0))(
  ( (ValueCellFull!3144 (v!5697 V!10277)) (EmptyCell!3144) )
))
(declare-datatypes ((array!17549 0))(
  ( (array!17550 (arr!8302 (Array (_ BitVec 32) ValueCell!3144)) (size!8654 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17549)

(declare-fun mapDefault!11868 () ValueCell!3144)

(assert (=> b!336700 (= condMapEmpty!11868 (= (arr!8302 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3144)) mapDefault!11868)))))

(declare-fun b!336701 () Bool)

(declare-fun e!206660 () Bool)

(assert (=> b!336701 (= e!206660 e!206661)))

(declare-fun res!185858 () Bool)

(assert (=> b!336701 (=> (not res!185858) (not e!206661))))

(declare-datatypes ((SeekEntryResult!3208 0))(
  ( (MissingZero!3208 (index!15011 (_ BitVec 32))) (Found!3208 (index!15012 (_ BitVec 32))) (Intermediate!3208 (undefined!4020 Bool) (index!15013 (_ BitVec 32)) (x!33556 (_ BitVec 32))) (Undefined!3208) (MissingVacant!3208 (index!15014 (_ BitVec 32))) )
))
(declare-fun lt!160299 () SeekEntryResult!3208)

(get-info :version)

(assert (=> b!336701 (= res!185858 (and (not ((_ is Found!3208) lt!160299)) ((_ is MissingZero!3208) lt!160299)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17547 (_ BitVec 32)) SeekEntryResult!3208)

(assert (=> b!336701 (= lt!160299 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11868 () Bool)

(assert (=> mapIsEmpty!11868 mapRes!11868))

(declare-fun res!185864 () Bool)

(assert (=> start!33844 (=> (not res!185864) (not e!206660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33844 (= res!185864 (validMask!0 mask!2385))))

(assert (=> start!33844 e!206660))

(assert (=> start!33844 true))

(declare-fun tp_is_empty!6975 () Bool)

(assert (=> start!33844 tp_is_empty!6975))

(assert (=> start!33844 tp!24581))

(declare-fun array_inv!6162 (array!17549) Bool)

(assert (=> start!33844 (and (array_inv!6162 _values!1525) e!206662)))

(declare-fun array_inv!6163 (array!17547) Bool)

(assert (=> start!33844 (array_inv!6163 _keys!1895)))

(declare-fun b!336702 () Bool)

(declare-fun res!185857 () Bool)

(assert (=> b!336702 (=> (not res!185857) (not e!206660))))

(declare-fun zeroValue!1467 () V!10277)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10277)

(declare-datatypes ((tuple2!5130 0))(
  ( (tuple2!5131 (_1!2576 (_ BitVec 64)) (_2!2576 V!10277)) )
))
(declare-datatypes ((List!4745 0))(
  ( (Nil!4742) (Cons!4741 (h!5597 tuple2!5130) (t!9839 List!4745)) )
))
(declare-datatypes ((ListLongMap!4043 0))(
  ( (ListLongMap!4044 (toList!2037 List!4745)) )
))
(declare-fun contains!2084 (ListLongMap!4043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1558 (array!17547 array!17549 (_ BitVec 32) (_ BitVec 32) V!10277 V!10277 (_ BitVec 32) Int) ListLongMap!4043)

(assert (=> b!336702 (= res!185857 (not (contains!2084 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336703 () Bool)

(declare-fun res!185860 () Bool)

(assert (=> b!336703 (=> (not res!185860) (not e!206660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17547 (_ BitVec 32)) Bool)

(assert (=> b!336703 (= res!185860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336704 () Bool)

(declare-fun res!185862 () Bool)

(assert (=> b!336704 (=> (not res!185862) (not e!206660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336704 (= res!185862 (validKeyInArray!0 k0!1348))))

(declare-fun b!336705 () Bool)

(declare-fun res!185861 () Bool)

(assert (=> b!336705 (=> (not res!185861) (not e!206660))))

(declare-datatypes ((List!4746 0))(
  ( (Nil!4743) (Cons!4742 (h!5598 (_ BitVec 64)) (t!9840 List!4746)) )
))
(declare-fun arrayNoDuplicates!0 (array!17547 (_ BitVec 32) List!4746) Bool)

(assert (=> b!336705 (= res!185861 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4743))))

(declare-fun b!336706 () Bool)

(declare-fun e!206659 () Bool)

(assert (=> b!336706 (= e!206659 tp_is_empty!6975)))

(declare-fun mapNonEmpty!11868 () Bool)

(declare-fun tp!24582 () Bool)

(assert (=> mapNonEmpty!11868 (= mapRes!11868 (and tp!24582 e!206659))))

(declare-fun mapRest!11868 () (Array (_ BitVec 32) ValueCell!3144))

(declare-fun mapKey!11868 () (_ BitVec 32))

(declare-fun mapValue!11868 () ValueCell!3144)

(assert (=> mapNonEmpty!11868 (= (arr!8302 _values!1525) (store mapRest!11868 mapKey!11868 mapValue!11868))))

(declare-fun b!336707 () Bool)

(assert (=> b!336707 (= e!206663 tp_is_empty!6975)))

(declare-fun b!336708 () Bool)

(declare-fun res!185863 () Bool)

(assert (=> b!336708 (=> (not res!185863) (not e!206660))))

(assert (=> b!336708 (= res!185863 (and (= (size!8654 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8653 _keys!1895) (size!8654 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336709 () Bool)

(assert (=> b!336709 (= e!206661 false)))

(declare-fun lt!160300 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17547 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336709 (= lt!160300 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!33844 res!185864) b!336708))

(assert (= (and b!336708 res!185863) b!336703))

(assert (= (and b!336703 res!185860) b!336705))

(assert (= (and b!336705 res!185861) b!336704))

(assert (= (and b!336704 res!185862) b!336702))

(assert (= (and b!336702 res!185857) b!336701))

(assert (= (and b!336701 res!185858) b!336699))

(assert (= (and b!336699 res!185859) b!336709))

(assert (= (and b!336700 condMapEmpty!11868) mapIsEmpty!11868))

(assert (= (and b!336700 (not condMapEmpty!11868)) mapNonEmpty!11868))

(assert (= (and mapNonEmpty!11868 ((_ is ValueCellFull!3144) mapValue!11868)) b!336706))

(assert (= (and b!336700 ((_ is ValueCellFull!3144) mapDefault!11868)) b!336707))

(assert (= start!33844 b!336700))

(declare-fun m!340427 () Bool)

(assert (=> b!336701 m!340427))

(declare-fun m!340429 () Bool)

(assert (=> mapNonEmpty!11868 m!340429))

(declare-fun m!340431 () Bool)

(assert (=> b!336699 m!340431))

(declare-fun m!340433 () Bool)

(assert (=> b!336702 m!340433))

(assert (=> b!336702 m!340433))

(declare-fun m!340435 () Bool)

(assert (=> b!336702 m!340435))

(declare-fun m!340437 () Bool)

(assert (=> b!336709 m!340437))

(declare-fun m!340439 () Bool)

(assert (=> b!336703 m!340439))

(declare-fun m!340441 () Bool)

(assert (=> b!336704 m!340441))

(declare-fun m!340443 () Bool)

(assert (=> start!33844 m!340443))

(declare-fun m!340445 () Bool)

(assert (=> start!33844 m!340445))

(declare-fun m!340447 () Bool)

(assert (=> start!33844 m!340447))

(declare-fun m!340449 () Bool)

(assert (=> b!336705 m!340449))

(check-sat (not b!336709) b_and!14209 (not mapNonEmpty!11868) (not b!336705) (not start!33844) (not b!336704) (not b!336702) (not b!336703) (not b!336699) (not b_next!7023) tp_is_empty!6975 (not b!336701))
(check-sat b_and!14209 (not b_next!7023))
