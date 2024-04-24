; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35020 () Bool)

(assert start!35020)

(declare-fun b_free!7723 () Bool)

(declare-fun b_next!7723 () Bool)

(assert (=> start!35020 (= b_free!7723 (not b_next!7723))))

(declare-fun tp!26747 () Bool)

(declare-fun b_and!14967 () Bool)

(assert (=> start!35020 (= tp!26747 b_and!14967)))

(declare-fun b!351120 () Bool)

(declare-fun res!194728 () Bool)

(declare-fun e!215031 () Bool)

(assert (=> b!351120 (=> (not res!194728) (not e!215031))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351120 (= res!194728 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12984 () Bool)

(declare-fun mapRes!12984 () Bool)

(assert (=> mapIsEmpty!12984 mapRes!12984))

(declare-fun mapNonEmpty!12984 () Bool)

(declare-fun tp!26748 () Bool)

(declare-fun e!215029 () Bool)

(assert (=> mapNonEmpty!12984 (= mapRes!12984 (and tp!26748 e!215029))))

(declare-datatypes ((V!11211 0))(
  ( (V!11212 (val!3882 Int)) )
))
(declare-datatypes ((ValueCell!3494 0))(
  ( (ValueCellFull!3494 (v!6070 V!11211)) (EmptyCell!3494) )
))
(declare-fun mapValue!12984 () ValueCell!3494)

(declare-datatypes ((array!18926 0))(
  ( (array!18927 (arr!8968 (Array (_ BitVec 32) ValueCell!3494)) (size!9320 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18926)

(declare-fun mapRest!12984 () (Array (_ BitVec 32) ValueCell!3494))

(declare-fun mapKey!12984 () (_ BitVec 32))

(assert (=> mapNonEmpty!12984 (= (arr!8968 _values!1525) (store mapRest!12984 mapKey!12984 mapValue!12984))))

(declare-fun b!351122 () Bool)

(declare-fun e!215030 () Bool)

(assert (=> b!351122 (= e!215031 e!215030)))

(declare-fun res!194727 () Bool)

(assert (=> b!351122 (=> (not res!194727) (not e!215030))))

(declare-datatypes ((SeekEntryResult!3407 0))(
  ( (MissingZero!3407 (index!15807 (_ BitVec 32))) (Found!3407 (index!15808 (_ BitVec 32))) (Intermediate!3407 (undefined!4219 Bool) (index!15809 (_ BitVec 32)) (x!34908 (_ BitVec 32))) (Undefined!3407) (MissingVacant!3407 (index!15810 (_ BitVec 32))) )
))
(declare-fun lt!164734 () SeekEntryResult!3407)

(get-info :version)

(assert (=> b!351122 (= res!194727 (and (not ((_ is Found!3407) lt!164734)) (not ((_ is MissingZero!3407) lt!164734)) ((_ is MissingVacant!3407) lt!164734)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18928 0))(
  ( (array!18929 (arr!8969 (Array (_ BitVec 32) (_ BitVec 64))) (size!9321 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18928)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18928 (_ BitVec 32)) SeekEntryResult!3407)

(assert (=> b!351122 (= lt!164734 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351123 () Bool)

(declare-fun res!194726 () Bool)

(assert (=> b!351123 (=> (not res!194726) (not e!215030))))

(declare-fun arrayContainsKey!0 (array!18928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351123 (= res!194726 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351124 () Bool)

(declare-fun res!194730 () Bool)

(assert (=> b!351124 (=> (not res!194730) (not e!215031))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351124 (= res!194730 (and (= (size!9320 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9321 _keys!1895) (size!9320 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351125 () Bool)

(declare-fun res!194732 () Bool)

(assert (=> b!351125 (=> (not res!194732) (not e!215031))))

(declare-datatypes ((List!5124 0))(
  ( (Nil!5121) (Cons!5120 (h!5976 (_ BitVec 64)) (t!10254 List!5124)) )
))
(declare-fun arrayNoDuplicates!0 (array!18928 (_ BitVec 32) List!5124) Bool)

(assert (=> b!351125 (= res!194732 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5121))))

(declare-fun res!194729 () Bool)

(assert (=> start!35020 (=> (not res!194729) (not e!215031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35020 (= res!194729 (validMask!0 mask!2385))))

(assert (=> start!35020 e!215031))

(assert (=> start!35020 true))

(declare-fun tp_is_empty!7675 () Bool)

(assert (=> start!35020 tp_is_empty!7675))

(assert (=> start!35020 tp!26747))

(declare-fun e!215028 () Bool)

(declare-fun array_inv!6626 (array!18926) Bool)

(assert (=> start!35020 (and (array_inv!6626 _values!1525) e!215028)))

(declare-fun array_inv!6627 (array!18928) Bool)

(assert (=> start!35020 (array_inv!6627 _keys!1895)))

(declare-fun b!351121 () Bool)

(declare-fun res!194731 () Bool)

(assert (=> b!351121 (=> (not res!194731) (not e!215031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18928 (_ BitVec 32)) Bool)

(assert (=> b!351121 (= res!194731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351126 () Bool)

(declare-fun e!215026 () Bool)

(assert (=> b!351126 (= e!215026 tp_is_empty!7675)))

(declare-fun b!351127 () Bool)

(assert (=> b!351127 (= e!215029 tp_is_empty!7675)))

(declare-fun b!351128 () Bool)

(declare-fun res!194733 () Bool)

(assert (=> b!351128 (=> (not res!194733) (not e!215031))))

(declare-fun zeroValue!1467 () V!11211)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11211)

(declare-datatypes ((tuple2!5518 0))(
  ( (tuple2!5519 (_1!2770 (_ BitVec 64)) (_2!2770 V!11211)) )
))
(declare-datatypes ((List!5125 0))(
  ( (Nil!5122) (Cons!5121 (h!5977 tuple2!5518) (t!10255 List!5125)) )
))
(declare-datatypes ((ListLongMap!4433 0))(
  ( (ListLongMap!4434 (toList!2232 List!5125)) )
))
(declare-fun contains!2320 (ListLongMap!4433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1760 (array!18928 array!18926 (_ BitVec 32) (_ BitVec 32) V!11211 V!11211 (_ BitVec 32) Int) ListLongMap!4433)

(assert (=> b!351128 (= res!194733 (not (contains!2320 (getCurrentListMap!1760 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351129 () Bool)

(assert (=> b!351129 (= e!215030 false)))

(declare-fun lt!164733 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18928 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351129 (= lt!164733 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351130 () Bool)

(assert (=> b!351130 (= e!215028 (and e!215026 mapRes!12984))))

(declare-fun condMapEmpty!12984 () Bool)

(declare-fun mapDefault!12984 () ValueCell!3494)

(assert (=> b!351130 (= condMapEmpty!12984 (= (arr!8968 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3494)) mapDefault!12984)))))

(assert (= (and start!35020 res!194729) b!351124))

(assert (= (and b!351124 res!194730) b!351121))

(assert (= (and b!351121 res!194731) b!351125))

(assert (= (and b!351125 res!194732) b!351120))

(assert (= (and b!351120 res!194728) b!351128))

(assert (= (and b!351128 res!194733) b!351122))

(assert (= (and b!351122 res!194727) b!351123))

(assert (= (and b!351123 res!194726) b!351129))

(assert (= (and b!351130 condMapEmpty!12984) mapIsEmpty!12984))

(assert (= (and b!351130 (not condMapEmpty!12984)) mapNonEmpty!12984))

(assert (= (and mapNonEmpty!12984 ((_ is ValueCellFull!3494) mapValue!12984)) b!351127))

(assert (= (and b!351130 ((_ is ValueCellFull!3494) mapDefault!12984)) b!351126))

(assert (= start!35020 b!351130))

(declare-fun m!351393 () Bool)

(assert (=> b!351121 m!351393))

(declare-fun m!351395 () Bool)

(assert (=> b!351128 m!351395))

(assert (=> b!351128 m!351395))

(declare-fun m!351397 () Bool)

(assert (=> b!351128 m!351397))

(declare-fun m!351399 () Bool)

(assert (=> mapNonEmpty!12984 m!351399))

(declare-fun m!351401 () Bool)

(assert (=> b!351120 m!351401))

(declare-fun m!351403 () Bool)

(assert (=> b!351123 m!351403))

(declare-fun m!351405 () Bool)

(assert (=> b!351125 m!351405))

(declare-fun m!351407 () Bool)

(assert (=> b!351129 m!351407))

(declare-fun m!351409 () Bool)

(assert (=> b!351122 m!351409))

(declare-fun m!351411 () Bool)

(assert (=> start!35020 m!351411))

(declare-fun m!351413 () Bool)

(assert (=> start!35020 m!351413))

(declare-fun m!351415 () Bool)

(assert (=> start!35020 m!351415))

(check-sat (not start!35020) (not b!351121) tp_is_empty!7675 b_and!14967 (not b!351122) (not b!351123) (not b!351128) (not b!351125) (not mapNonEmpty!12984) (not b!351129) (not b!351120) (not b_next!7723))
(check-sat b_and!14967 (not b_next!7723))
