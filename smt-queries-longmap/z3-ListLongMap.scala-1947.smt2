; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34414 () Bool)

(assert start!34414)

(declare-fun b_free!7351 () Bool)

(declare-fun b_next!7351 () Bool)

(assert (=> start!34414 (= b_free!7351 (not b_next!7351))))

(declare-fun tp!25599 () Bool)

(declare-fun b_and!14573 () Bool)

(assert (=> start!34414 (= tp!25599 b_and!14573)))

(declare-fun b!343733 () Bool)

(declare-fun res!190048 () Bool)

(declare-fun e!210754 () Bool)

(assert (=> b!343733 (=> (not res!190048) (not e!210754))))

(declare-datatypes ((array!18194 0))(
  ( (array!18195 (arr!8613 (Array (_ BitVec 32) (_ BitVec 64))) (size!8965 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18194)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18194 (_ BitVec 32)) Bool)

(assert (=> b!343733 (= res!190048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343734 () Bool)

(declare-fun res!190049 () Bool)

(assert (=> b!343734 (=> (not res!190049) (not e!210754))))

(declare-datatypes ((V!10715 0))(
  ( (V!10716 (val!3696 Int)) )
))
(declare-datatypes ((ValueCell!3308 0))(
  ( (ValueCellFull!3308 (v!5873 V!10715)) (EmptyCell!3308) )
))
(declare-datatypes ((array!18196 0))(
  ( (array!18197 (arr!8614 (Array (_ BitVec 32) ValueCell!3308)) (size!8966 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18196)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343734 (= res!190049 (and (= (size!8966 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8965 _keys!1895) (size!8966 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343736 () Bool)

(declare-fun res!190051 () Bool)

(assert (=> b!343736 (=> (not res!190051) (not e!210754))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343736 (= res!190051 (validKeyInArray!0 k0!1348))))

(declare-fun b!343737 () Bool)

(declare-fun res!190047 () Bool)

(assert (=> b!343737 (=> (not res!190047) (not e!210754))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10715)

(declare-fun zeroValue!1467 () V!10715)

(declare-datatypes ((tuple2!5274 0))(
  ( (tuple2!5275 (_1!2648 (_ BitVec 64)) (_2!2648 V!10715)) )
))
(declare-datatypes ((List!4877 0))(
  ( (Nil!4874) (Cons!4873 (h!5729 tuple2!5274) (t!9985 List!4877)) )
))
(declare-datatypes ((ListLongMap!4189 0))(
  ( (ListLongMap!4190 (toList!2110 List!4877)) )
))
(declare-fun contains!2187 (ListLongMap!4189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1639 (array!18194 array!18196 (_ BitVec 32) (_ BitVec 32) V!10715 V!10715 (_ BitVec 32) Int) ListLongMap!4189)

(assert (=> b!343737 (= res!190047 (not (contains!2187 (getCurrentListMap!1639 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12393 () Bool)

(declare-fun mapRes!12393 () Bool)

(assert (=> mapIsEmpty!12393 mapRes!12393))

(declare-fun b!343738 () Bool)

(declare-fun e!210755 () Bool)

(declare-fun tp_is_empty!7303 () Bool)

(assert (=> b!343738 (= e!210755 tp_is_empty!7303)))

(declare-fun b!343739 () Bool)

(declare-fun e!210753 () Bool)

(declare-fun e!210752 () Bool)

(assert (=> b!343739 (= e!210753 (and e!210752 mapRes!12393))))

(declare-fun condMapEmpty!12393 () Bool)

(declare-fun mapDefault!12393 () ValueCell!3308)

(assert (=> b!343739 (= condMapEmpty!12393 (= (arr!8614 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3308)) mapDefault!12393)))))

(declare-fun b!343740 () Bool)

(assert (=> b!343740 (= e!210752 tp_is_empty!7303)))

(declare-fun res!190052 () Bool)

(assert (=> start!34414 (=> (not res!190052) (not e!210754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34414 (= res!190052 (validMask!0 mask!2385))))

(assert (=> start!34414 e!210754))

(assert (=> start!34414 true))

(assert (=> start!34414 tp_is_empty!7303))

(assert (=> start!34414 tp!25599))

(declare-fun array_inv!6364 (array!18196) Bool)

(assert (=> start!34414 (and (array_inv!6364 _values!1525) e!210753)))

(declare-fun array_inv!6365 (array!18194) Bool)

(assert (=> start!34414 (array_inv!6365 _keys!1895)))

(declare-fun b!343735 () Bool)

(declare-fun res!190050 () Bool)

(assert (=> b!343735 (=> (not res!190050) (not e!210754))))

(declare-datatypes ((List!4878 0))(
  ( (Nil!4875) (Cons!4874 (h!5730 (_ BitVec 64)) (t!9986 List!4878)) )
))
(declare-fun arrayNoDuplicates!0 (array!18194 (_ BitVec 32) List!4878) Bool)

(assert (=> b!343735 (= res!190050 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4875))))

(declare-fun b!343741 () Bool)

(assert (=> b!343741 (= e!210754 false)))

(declare-datatypes ((SeekEntryResult!3275 0))(
  ( (MissingZero!3275 (index!15279 (_ BitVec 32))) (Found!3275 (index!15280 (_ BitVec 32))) (Intermediate!3275 (undefined!4087 Bool) (index!15281 (_ BitVec 32)) (x!34170 (_ BitVec 32))) (Undefined!3275) (MissingVacant!3275 (index!15282 (_ BitVec 32))) )
))
(declare-fun lt!162619 () SeekEntryResult!3275)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18194 (_ BitVec 32)) SeekEntryResult!3275)

(assert (=> b!343741 (= lt!162619 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12393 () Bool)

(declare-fun tp!25598 () Bool)

(assert (=> mapNonEmpty!12393 (= mapRes!12393 (and tp!25598 e!210755))))

(declare-fun mapRest!12393 () (Array (_ BitVec 32) ValueCell!3308))

(declare-fun mapValue!12393 () ValueCell!3308)

(declare-fun mapKey!12393 () (_ BitVec 32))

(assert (=> mapNonEmpty!12393 (= (arr!8614 _values!1525) (store mapRest!12393 mapKey!12393 mapValue!12393))))

(assert (= (and start!34414 res!190052) b!343734))

(assert (= (and b!343734 res!190049) b!343733))

(assert (= (and b!343733 res!190048) b!343735))

(assert (= (and b!343735 res!190050) b!343736))

(assert (= (and b!343736 res!190051) b!343737))

(assert (= (and b!343737 res!190047) b!343741))

(assert (= (and b!343739 condMapEmpty!12393) mapIsEmpty!12393))

(assert (= (and b!343739 (not condMapEmpty!12393)) mapNonEmpty!12393))

(get-info :version)

(assert (= (and mapNonEmpty!12393 ((_ is ValueCellFull!3308) mapValue!12393)) b!343738))

(assert (= (and b!343739 ((_ is ValueCellFull!3308) mapDefault!12393)) b!343740))

(assert (= start!34414 b!343739))

(declare-fun m!345801 () Bool)

(assert (=> b!343736 m!345801))

(declare-fun m!345803 () Bool)

(assert (=> b!343733 m!345803))

(declare-fun m!345805 () Bool)

(assert (=> mapNonEmpty!12393 m!345805))

(declare-fun m!345807 () Bool)

(assert (=> start!34414 m!345807))

(declare-fun m!345809 () Bool)

(assert (=> start!34414 m!345809))

(declare-fun m!345811 () Bool)

(assert (=> start!34414 m!345811))

(declare-fun m!345813 () Bool)

(assert (=> b!343735 m!345813))

(declare-fun m!345815 () Bool)

(assert (=> b!343741 m!345815))

(declare-fun m!345817 () Bool)

(assert (=> b!343737 m!345817))

(assert (=> b!343737 m!345817))

(declare-fun m!345819 () Bool)

(assert (=> b!343737 m!345819))

(check-sat b_and!14573 tp_is_empty!7303 (not start!34414) (not b!343737) (not b!343741) (not b!343735) (not b!343736) (not b!343733) (not mapNonEmpty!12393) (not b_next!7351))
(check-sat b_and!14573 (not b_next!7351))
