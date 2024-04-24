; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33828 () Bool)

(assert start!33828)

(declare-fun b_free!7021 () Bool)

(declare-fun b_next!7021 () Bool)

(assert (=> start!33828 (= b_free!7021 (not b_next!7021))))

(declare-fun tp!24576 () Bool)

(declare-fun b_and!14221 () Bool)

(assert (=> start!33828 (= tp!24576 b_and!14221)))

(declare-fun b!336613 () Bool)

(declare-fun e!206610 () Bool)

(declare-fun tp_is_empty!6973 () Bool)

(assert (=> b!336613 (= e!206610 tp_is_empty!6973)))

(declare-fun mapIsEmpty!11865 () Bool)

(declare-fun mapRes!11865 () Bool)

(assert (=> mapIsEmpty!11865 mapRes!11865))

(declare-fun b!336614 () Bool)

(declare-fun e!206608 () Bool)

(assert (=> b!336614 (= e!206608 tp_is_empty!6973)))

(declare-fun b!336615 () Bool)

(declare-fun res!185833 () Bool)

(declare-fun e!206607 () Bool)

(assert (=> b!336615 (=> (not res!185833) (not e!206607))))

(declare-datatypes ((array!17528 0))(
  ( (array!17529 (arr!8291 (Array (_ BitVec 32) (_ BitVec 64))) (size!8643 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17528)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17528 (_ BitVec 32)) Bool)

(assert (=> b!336615 (= res!185833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336616 () Bool)

(declare-fun e!206609 () Bool)

(assert (=> b!336616 (= e!206609 false)))

(declare-fun lt!160312 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17528 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336616 (= lt!160312 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11865 () Bool)

(declare-fun tp!24575 () Bool)

(assert (=> mapNonEmpty!11865 (= mapRes!11865 (and tp!24575 e!206610))))

(declare-datatypes ((V!10275 0))(
  ( (V!10276 (val!3531 Int)) )
))
(declare-datatypes ((ValueCell!3143 0))(
  ( (ValueCellFull!3143 (v!5697 V!10275)) (EmptyCell!3143) )
))
(declare-fun mapRest!11865 () (Array (_ BitVec 32) ValueCell!3143))

(declare-fun mapKey!11865 () (_ BitVec 32))

(declare-fun mapValue!11865 () ValueCell!3143)

(declare-datatypes ((array!17530 0))(
  ( (array!17531 (arr!8292 (Array (_ BitVec 32) ValueCell!3143)) (size!8644 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17530)

(assert (=> mapNonEmpty!11865 (= (arr!8292 _values!1525) (store mapRest!11865 mapKey!11865 mapValue!11865))))

(declare-fun b!336618 () Bool)

(declare-fun res!185831 () Bool)

(assert (=> b!336618 (=> (not res!185831) (not e!206609))))

(declare-fun arrayContainsKey!0 (array!17528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336618 (= res!185831 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336619 () Bool)

(declare-fun res!185834 () Bool)

(assert (=> b!336619 (=> (not res!185834) (not e!206607))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336619 (= res!185834 (and (= (size!8644 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8643 _keys!1895) (size!8644 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336620 () Bool)

(declare-fun res!185832 () Bool)

(assert (=> b!336620 (=> (not res!185832) (not e!206607))))

(declare-datatypes ((List!4664 0))(
  ( (Nil!4661) (Cons!4660 (h!5516 (_ BitVec 64)) (t!9750 List!4664)) )
))
(declare-fun arrayNoDuplicates!0 (array!17528 (_ BitVec 32) List!4664) Bool)

(assert (=> b!336620 (= res!185832 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4661))))

(declare-fun b!336621 () Bool)

(assert (=> b!336621 (= e!206607 e!206609)))

(declare-fun res!185835 () Bool)

(assert (=> b!336621 (=> (not res!185835) (not e!206609))))

(declare-datatypes ((SeekEntryResult!3169 0))(
  ( (MissingZero!3169 (index!14855 (_ BitVec 32))) (Found!3169 (index!14856 (_ BitVec 32))) (Intermediate!3169 (undefined!3981 Bool) (index!14857 (_ BitVec 32)) (x!33514 (_ BitVec 32))) (Undefined!3169) (MissingVacant!3169 (index!14858 (_ BitVec 32))) )
))
(declare-fun lt!160311 () SeekEntryResult!3169)

(get-info :version)

(assert (=> b!336621 (= res!185835 (and (not ((_ is Found!3169) lt!160311)) ((_ is MissingZero!3169) lt!160311)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17528 (_ BitVec 32)) SeekEntryResult!3169)

(assert (=> b!336621 (= lt!160311 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336622 () Bool)

(declare-fun e!206612 () Bool)

(assert (=> b!336622 (= e!206612 (and e!206608 mapRes!11865))))

(declare-fun condMapEmpty!11865 () Bool)

(declare-fun mapDefault!11865 () ValueCell!3143)

(assert (=> b!336622 (= condMapEmpty!11865 (= (arr!8292 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3143)) mapDefault!11865)))))

(declare-fun b!336623 () Bool)

(declare-fun res!185830 () Bool)

(assert (=> b!336623 (=> (not res!185830) (not e!206607))))

(declare-fun zeroValue!1467 () V!10275)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10275)

(declare-datatypes ((tuple2!5048 0))(
  ( (tuple2!5049 (_1!2535 (_ BitVec 64)) (_2!2535 V!10275)) )
))
(declare-datatypes ((List!4665 0))(
  ( (Nil!4662) (Cons!4661 (h!5517 tuple2!5048) (t!9751 List!4665)) )
))
(declare-datatypes ((ListLongMap!3963 0))(
  ( (ListLongMap!3964 (toList!1997 List!4665)) )
))
(declare-fun contains!2063 (ListLongMap!3963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1526 (array!17528 array!17530 (_ BitVec 32) (_ BitVec 32) V!10275 V!10275 (_ BitVec 32) Int) ListLongMap!3963)

(assert (=> b!336623 (= res!185830 (not (contains!2063 (getCurrentListMap!1526 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!185837 () Bool)

(assert (=> start!33828 (=> (not res!185837) (not e!206607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33828 (= res!185837 (validMask!0 mask!2385))))

(assert (=> start!33828 e!206607))

(assert (=> start!33828 true))

(assert (=> start!33828 tp_is_empty!6973))

(assert (=> start!33828 tp!24576))

(declare-fun array_inv!6164 (array!17530) Bool)

(assert (=> start!33828 (and (array_inv!6164 _values!1525) e!206612)))

(declare-fun array_inv!6165 (array!17528) Bool)

(assert (=> start!33828 (array_inv!6165 _keys!1895)))

(declare-fun b!336617 () Bool)

(declare-fun res!185836 () Bool)

(assert (=> b!336617 (=> (not res!185836) (not e!206607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336617 (= res!185836 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33828 res!185837) b!336619))

(assert (= (and b!336619 res!185834) b!336615))

(assert (= (and b!336615 res!185833) b!336620))

(assert (= (and b!336620 res!185832) b!336617))

(assert (= (and b!336617 res!185836) b!336623))

(assert (= (and b!336623 res!185830) b!336621))

(assert (= (and b!336621 res!185835) b!336618))

(assert (= (and b!336618 res!185831) b!336616))

(assert (= (and b!336622 condMapEmpty!11865) mapIsEmpty!11865))

(assert (= (and b!336622 (not condMapEmpty!11865)) mapNonEmpty!11865))

(assert (= (and mapNonEmpty!11865 ((_ is ValueCellFull!3143) mapValue!11865)) b!336613))

(assert (= (and b!336622 ((_ is ValueCellFull!3143) mapDefault!11865)) b!336614))

(assert (= start!33828 b!336622))

(declare-fun m!340627 () Bool)

(assert (=> b!336618 m!340627))

(declare-fun m!340629 () Bool)

(assert (=> b!336617 m!340629))

(declare-fun m!340631 () Bool)

(assert (=> b!336615 m!340631))

(declare-fun m!340633 () Bool)

(assert (=> start!33828 m!340633))

(declare-fun m!340635 () Bool)

(assert (=> start!33828 m!340635))

(declare-fun m!340637 () Bool)

(assert (=> start!33828 m!340637))

(declare-fun m!340639 () Bool)

(assert (=> b!336623 m!340639))

(assert (=> b!336623 m!340639))

(declare-fun m!340641 () Bool)

(assert (=> b!336623 m!340641))

(declare-fun m!340643 () Bool)

(assert (=> mapNonEmpty!11865 m!340643))

(declare-fun m!340645 () Bool)

(assert (=> b!336621 m!340645))

(declare-fun m!340647 () Bool)

(assert (=> b!336616 m!340647))

(declare-fun m!340649 () Bool)

(assert (=> b!336620 m!340649))

(check-sat (not start!33828) tp_is_empty!6973 (not b!336616) (not b!336621) (not mapNonEmpty!11865) b_and!14221 (not b_next!7021) (not b!336623) (not b!336618) (not b!336620) (not b!336617) (not b!336615))
(check-sat b_and!14221 (not b_next!7021))
