; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34692 () Bool)

(assert start!34692)

(declare-fun b_free!7513 () Bool)

(declare-fun b_next!7513 () Bool)

(assert (=> start!34692 (= b_free!7513 (not b_next!7513))))

(declare-fun tp!26103 () Bool)

(declare-fun b_and!14747 () Bool)

(assert (=> start!34692 (= tp!26103 b_and!14747)))

(declare-fun b!346827 () Bool)

(declare-fun res!191920 () Bool)

(declare-fun e!212541 () Bool)

(assert (=> b!346827 (=> (not res!191920) (not e!212541))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10931 0))(
  ( (V!10932 (val!3777 Int)) )
))
(declare-fun zeroValue!1467 () V!10931)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3389 0))(
  ( (ValueCellFull!3389 (v!5960 V!10931)) (EmptyCell!3389) )
))
(declare-datatypes ((array!18516 0))(
  ( (array!18517 (arr!8768 (Array (_ BitVec 32) ValueCell!3389)) (size!9120 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18516)

(declare-datatypes ((array!18518 0))(
  ( (array!18519 (arr!8769 (Array (_ BitVec 32) (_ BitVec 64))) (size!9121 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18518)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10931)

(declare-datatypes ((tuple2!5382 0))(
  ( (tuple2!5383 (_1!2702 (_ BitVec 64)) (_2!2702 V!10931)) )
))
(declare-datatypes ((List!4988 0))(
  ( (Nil!4985) (Cons!4984 (h!5840 tuple2!5382) (t!10108 List!4988)) )
))
(declare-datatypes ((ListLongMap!4297 0))(
  ( (ListLongMap!4298 (toList!2164 List!4988)) )
))
(declare-fun contains!2247 (ListLongMap!4297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1693 (array!18518 array!18516 (_ BitVec 32) (_ BitVec 32) V!10931 V!10931 (_ BitVec 32) Int) ListLongMap!4297)

(assert (=> b!346827 (= res!191920 (not (contains!2247 (getCurrentListMap!1693 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346828 () Bool)

(declare-fun res!191922 () Bool)

(assert (=> b!346828 (=> (not res!191922) (not e!212541))))

(assert (=> b!346828 (= res!191922 (and (= (size!9120 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9121 _keys!1895) (size!9120 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346829 () Bool)

(declare-fun e!212542 () Bool)

(declare-fun tp_is_empty!7465 () Bool)

(assert (=> b!346829 (= e!212542 tp_is_empty!7465)))

(declare-fun b!346830 () Bool)

(declare-fun res!191921 () Bool)

(declare-fun e!212545 () Bool)

(assert (=> b!346830 (=> (not res!191921) (not e!212545))))

(declare-datatypes ((SeekEntryResult!3336 0))(
  ( (MissingZero!3336 (index!15523 (_ BitVec 32))) (Found!3336 (index!15524 (_ BitVec 32))) (Intermediate!3336 (undefined!4148 Bool) (index!15525 (_ BitVec 32)) (x!34507 (_ BitVec 32))) (Undefined!3336) (MissingVacant!3336 (index!15526 (_ BitVec 32))) )
))
(declare-fun lt!163468 () SeekEntryResult!3336)

(declare-fun arrayContainsKey!0 (array!18518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346830 (= res!191921 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15524 lt!163468)))))

(declare-fun b!346831 () Bool)

(declare-fun res!191923 () Bool)

(assert (=> b!346831 (=> (not res!191923) (not e!212541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346831 (= res!191923 (validKeyInArray!0 k0!1348))))

(declare-fun b!346832 () Bool)

(declare-fun e!212544 () Bool)

(declare-fun e!212543 () Bool)

(declare-fun mapRes!12654 () Bool)

(assert (=> b!346832 (= e!212544 (and e!212543 mapRes!12654))))

(declare-fun condMapEmpty!12654 () Bool)

(declare-fun mapDefault!12654 () ValueCell!3389)

(assert (=> b!346832 (= condMapEmpty!12654 (= (arr!8768 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3389)) mapDefault!12654)))))

(declare-fun res!191925 () Bool)

(assert (=> start!34692 (=> (not res!191925) (not e!212541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34692 (= res!191925 (validMask!0 mask!2385))))

(assert (=> start!34692 e!212541))

(assert (=> start!34692 true))

(assert (=> start!34692 tp_is_empty!7465))

(assert (=> start!34692 tp!26103))

(declare-fun array_inv!6482 (array!18516) Bool)

(assert (=> start!34692 (and (array_inv!6482 _values!1525) e!212544)))

(declare-fun array_inv!6483 (array!18518) Bool)

(assert (=> start!34692 (array_inv!6483 _keys!1895)))

(declare-fun b!346833 () Bool)

(declare-fun res!191924 () Bool)

(assert (=> b!346833 (=> (not res!191924) (not e!212541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18518 (_ BitVec 32)) Bool)

(assert (=> b!346833 (= res!191924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346834 () Bool)

(assert (=> b!346834 (= e!212545 (not true))))

(assert (=> b!346834 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10733 0))(
  ( (Unit!10734) )
))
(declare-fun lt!163467 () Unit!10733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18518 (_ BitVec 64) (_ BitVec 32)) Unit!10733)

(assert (=> b!346834 (= lt!163467 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15524 lt!163468)))))

(declare-fun mapNonEmpty!12654 () Bool)

(declare-fun tp!26102 () Bool)

(assert (=> mapNonEmpty!12654 (= mapRes!12654 (and tp!26102 e!212542))))

(declare-fun mapRest!12654 () (Array (_ BitVec 32) ValueCell!3389))

(declare-fun mapKey!12654 () (_ BitVec 32))

(declare-fun mapValue!12654 () ValueCell!3389)

(assert (=> mapNonEmpty!12654 (= (arr!8768 _values!1525) (store mapRest!12654 mapKey!12654 mapValue!12654))))

(declare-fun b!346835 () Bool)

(assert (=> b!346835 (= e!212543 tp_is_empty!7465)))

(declare-fun b!346836 () Bool)

(assert (=> b!346836 (= e!212541 e!212545)))

(declare-fun res!191927 () Bool)

(assert (=> b!346836 (=> (not res!191927) (not e!212545))))

(get-info :version)

(assert (=> b!346836 (= res!191927 (and ((_ is Found!3336) lt!163468) (= (select (arr!8769 _keys!1895) (index!15524 lt!163468)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18518 (_ BitVec 32)) SeekEntryResult!3336)

(assert (=> b!346836 (= lt!163468 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346837 () Bool)

(declare-fun res!191926 () Bool)

(assert (=> b!346837 (=> (not res!191926) (not e!212541))))

(declare-datatypes ((List!4989 0))(
  ( (Nil!4986) (Cons!4985 (h!5841 (_ BitVec 64)) (t!10109 List!4989)) )
))
(declare-fun arrayNoDuplicates!0 (array!18518 (_ BitVec 32) List!4989) Bool)

(assert (=> b!346837 (= res!191926 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4986))))

(declare-fun mapIsEmpty!12654 () Bool)

(assert (=> mapIsEmpty!12654 mapRes!12654))

(assert (= (and start!34692 res!191925) b!346828))

(assert (= (and b!346828 res!191922) b!346833))

(assert (= (and b!346833 res!191924) b!346837))

(assert (= (and b!346837 res!191926) b!346831))

(assert (= (and b!346831 res!191923) b!346827))

(assert (= (and b!346827 res!191920) b!346836))

(assert (= (and b!346836 res!191927) b!346830))

(assert (= (and b!346830 res!191921) b!346834))

(assert (= (and b!346832 condMapEmpty!12654) mapIsEmpty!12654))

(assert (= (and b!346832 (not condMapEmpty!12654)) mapNonEmpty!12654))

(assert (= (and mapNonEmpty!12654 ((_ is ValueCellFull!3389) mapValue!12654)) b!346829))

(assert (= (and b!346832 ((_ is ValueCellFull!3389) mapDefault!12654)) b!346835))

(assert (= start!34692 b!346832))

(declare-fun m!348119 () Bool)

(assert (=> mapNonEmpty!12654 m!348119))

(declare-fun m!348121 () Bool)

(assert (=> b!346833 m!348121))

(declare-fun m!348123 () Bool)

(assert (=> b!346836 m!348123))

(declare-fun m!348125 () Bool)

(assert (=> b!346836 m!348125))

(declare-fun m!348127 () Bool)

(assert (=> b!346830 m!348127))

(declare-fun m!348129 () Bool)

(assert (=> b!346837 m!348129))

(declare-fun m!348131 () Bool)

(assert (=> b!346834 m!348131))

(declare-fun m!348133 () Bool)

(assert (=> b!346834 m!348133))

(declare-fun m!348135 () Bool)

(assert (=> start!34692 m!348135))

(declare-fun m!348137 () Bool)

(assert (=> start!34692 m!348137))

(declare-fun m!348139 () Bool)

(assert (=> start!34692 m!348139))

(declare-fun m!348141 () Bool)

(assert (=> b!346827 m!348141))

(assert (=> b!346827 m!348141))

(declare-fun m!348143 () Bool)

(assert (=> b!346827 m!348143))

(declare-fun m!348145 () Bool)

(assert (=> b!346831 m!348145))

(check-sat (not b!346837) (not b!346827) tp_is_empty!7465 (not b!346830) (not mapNonEmpty!12654) b_and!14747 (not b!346833) (not b!346834) (not start!34692) (not b!346831) (not b!346836) (not b_next!7513))
(check-sat b_and!14747 (not b_next!7513))
