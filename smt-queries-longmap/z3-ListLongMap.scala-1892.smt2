; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33828 () Bool)

(assert start!33828)

(declare-fun b_free!7021 () Bool)

(declare-fun b_next!7021 () Bool)

(assert (=> start!33828 (= b_free!7021 (not b_next!7021))))

(declare-fun tp!24576 () Bool)

(declare-fun b_and!14181 () Bool)

(assert (=> start!33828 (= tp!24576 b_and!14181)))

(declare-fun b!336391 () Bool)

(declare-fun e!206466 () Bool)

(declare-fun e!206469 () Bool)

(assert (=> b!336391 (= e!206466 e!206469)))

(declare-fun res!185711 () Bool)

(assert (=> b!336391 (=> (not res!185711) (not e!206469))))

(declare-datatypes ((SeekEntryResult!3206 0))(
  ( (MissingZero!3206 (index!15003 (_ BitVec 32))) (Found!3206 (index!15004 (_ BitVec 32))) (Intermediate!3206 (undefined!4018 Bool) (index!15005 (_ BitVec 32)) (x!33549 (_ BitVec 32))) (Undefined!3206) (MissingVacant!3206 (index!15006 (_ BitVec 32))) )
))
(declare-fun lt!160058 () SeekEntryResult!3206)

(get-info :version)

(assert (=> b!336391 (= res!185711 (and (not ((_ is Found!3206) lt!160058)) ((_ is MissingZero!3206) lt!160058)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17523 0))(
  ( (array!17524 (arr!8289 (Array (_ BitVec 32) (_ BitVec 64))) (size!8642 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17523)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17523 (_ BitVec 32)) SeekEntryResult!3206)

(assert (=> b!336391 (= lt!160058 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336392 () Bool)

(declare-fun e!206465 () Bool)

(declare-fun tp_is_empty!6973 () Bool)

(assert (=> b!336392 (= e!206465 tp_is_empty!6973)))

(declare-fun b!336393 () Bool)

(declare-fun res!185705 () Bool)

(assert (=> b!336393 (=> (not res!185705) (not e!206466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336393 (= res!185705 (validKeyInArray!0 k0!1348))))

(declare-fun b!336394 () Bool)

(declare-fun res!185708 () Bool)

(assert (=> b!336394 (=> (not res!185708) (not e!206466))))

(declare-datatypes ((List!4710 0))(
  ( (Nil!4707) (Cons!4706 (h!5562 (_ BitVec 64)) (t!9795 List!4710)) )
))
(declare-fun arrayNoDuplicates!0 (array!17523 (_ BitVec 32) List!4710) Bool)

(assert (=> b!336394 (= res!185708 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4707))))

(declare-fun b!336395 () Bool)

(declare-fun res!185706 () Bool)

(assert (=> b!336395 (=> (not res!185706) (not e!206466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17523 (_ BitVec 32)) Bool)

(assert (=> b!336395 (= res!185706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336396 () Bool)

(assert (=> b!336396 (= e!206469 false)))

(declare-fun lt!160059 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17523 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336396 (= lt!160059 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!185709 () Bool)

(assert (=> start!33828 (=> (not res!185709) (not e!206466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33828 (= res!185709 (validMask!0 mask!2385))))

(assert (=> start!33828 e!206466))

(assert (=> start!33828 true))

(assert (=> start!33828 tp_is_empty!6973))

(assert (=> start!33828 tp!24576))

(declare-datatypes ((V!10275 0))(
  ( (V!10276 (val!3531 Int)) )
))
(declare-datatypes ((ValueCell!3143 0))(
  ( (ValueCellFull!3143 (v!5690 V!10275)) (EmptyCell!3143) )
))
(declare-datatypes ((array!17525 0))(
  ( (array!17526 (arr!8290 (Array (_ BitVec 32) ValueCell!3143)) (size!8643 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17525)

(declare-fun e!206468 () Bool)

(declare-fun array_inv!6188 (array!17525) Bool)

(assert (=> start!33828 (and (array_inv!6188 _values!1525) e!206468)))

(declare-fun array_inv!6189 (array!17523) Bool)

(assert (=> start!33828 (array_inv!6189 _keys!1895)))

(declare-fun b!336397 () Bool)

(declare-fun res!185704 () Bool)

(assert (=> b!336397 (=> (not res!185704) (not e!206466))))

(declare-fun zeroValue!1467 () V!10275)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10275)

(declare-datatypes ((tuple2!5076 0))(
  ( (tuple2!5077 (_1!2549 (_ BitVec 64)) (_2!2549 V!10275)) )
))
(declare-datatypes ((List!4711 0))(
  ( (Nil!4708) (Cons!4707 (h!5563 tuple2!5076) (t!9796 List!4711)) )
))
(declare-datatypes ((ListLongMap!3979 0))(
  ( (ListLongMap!3980 (toList!2005 List!4711)) )
))
(declare-fun contains!2063 (ListLongMap!3979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1511 (array!17523 array!17525 (_ BitVec 32) (_ BitVec 32) V!10275 V!10275 (_ BitVec 32) Int) ListLongMap!3979)

(assert (=> b!336397 (= res!185704 (not (contains!2063 (getCurrentListMap!1511 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336398 () Bool)

(declare-fun mapRes!11865 () Bool)

(assert (=> b!336398 (= e!206468 (and e!206465 mapRes!11865))))

(declare-fun condMapEmpty!11865 () Bool)

(declare-fun mapDefault!11865 () ValueCell!3143)

(assert (=> b!336398 (= condMapEmpty!11865 (= (arr!8290 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3143)) mapDefault!11865)))))

(declare-fun b!336399 () Bool)

(declare-fun res!185707 () Bool)

(assert (=> b!336399 (=> (not res!185707) (not e!206469))))

(declare-fun arrayContainsKey!0 (array!17523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336399 (= res!185707 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11865 () Bool)

(assert (=> mapIsEmpty!11865 mapRes!11865))

(declare-fun b!336400 () Bool)

(declare-fun e!206470 () Bool)

(assert (=> b!336400 (= e!206470 tp_is_empty!6973)))

(declare-fun b!336401 () Bool)

(declare-fun res!185710 () Bool)

(assert (=> b!336401 (=> (not res!185710) (not e!206466))))

(assert (=> b!336401 (= res!185710 (and (= (size!8643 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8642 _keys!1895) (size!8643 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11865 () Bool)

(declare-fun tp!24575 () Bool)

(assert (=> mapNonEmpty!11865 (= mapRes!11865 (and tp!24575 e!206470))))

(declare-fun mapKey!11865 () (_ BitVec 32))

(declare-fun mapValue!11865 () ValueCell!3143)

(declare-fun mapRest!11865 () (Array (_ BitVec 32) ValueCell!3143))

(assert (=> mapNonEmpty!11865 (= (arr!8290 _values!1525) (store mapRest!11865 mapKey!11865 mapValue!11865))))

(assert (= (and start!33828 res!185709) b!336401))

(assert (= (and b!336401 res!185710) b!336395))

(assert (= (and b!336395 res!185706) b!336394))

(assert (= (and b!336394 res!185708) b!336393))

(assert (= (and b!336393 res!185705) b!336397))

(assert (= (and b!336397 res!185704) b!336391))

(assert (= (and b!336391 res!185711) b!336399))

(assert (= (and b!336399 res!185707) b!336396))

(assert (= (and b!336398 condMapEmpty!11865) mapIsEmpty!11865))

(assert (= (and b!336398 (not condMapEmpty!11865)) mapNonEmpty!11865))

(assert (= (and mapNonEmpty!11865 ((_ is ValueCellFull!3143) mapValue!11865)) b!336400))

(assert (= (and b!336398 ((_ is ValueCellFull!3143) mapDefault!11865)) b!336392))

(assert (= start!33828 b!336398))

(declare-fun m!339673 () Bool)

(assert (=> start!33828 m!339673))

(declare-fun m!339675 () Bool)

(assert (=> start!33828 m!339675))

(declare-fun m!339677 () Bool)

(assert (=> start!33828 m!339677))

(declare-fun m!339679 () Bool)

(assert (=> b!336399 m!339679))

(declare-fun m!339681 () Bool)

(assert (=> b!336393 m!339681))

(declare-fun m!339683 () Bool)

(assert (=> mapNonEmpty!11865 m!339683))

(declare-fun m!339685 () Bool)

(assert (=> b!336391 m!339685))

(declare-fun m!339687 () Bool)

(assert (=> b!336397 m!339687))

(assert (=> b!336397 m!339687))

(declare-fun m!339689 () Bool)

(assert (=> b!336397 m!339689))

(declare-fun m!339691 () Bool)

(assert (=> b!336394 m!339691))

(declare-fun m!339693 () Bool)

(assert (=> b!336396 m!339693))

(declare-fun m!339695 () Bool)

(assert (=> b!336395 m!339695))

(check-sat (not b!336393) tp_is_empty!6973 (not b!336396) (not b!336397) (not b!336399) (not b!336391) (not b!336394) (not b!336395) b_and!14181 (not mapNonEmpty!11865) (not b_next!7021) (not start!33828))
(check-sat b_and!14181 (not b_next!7021))
