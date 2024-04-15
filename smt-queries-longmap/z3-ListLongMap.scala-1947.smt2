; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34414 () Bool)

(assert start!34414)

(declare-fun b_free!7351 () Bool)

(declare-fun b_next!7351 () Bool)

(assert (=> start!34414 (= b_free!7351 (not b_next!7351))))

(declare-fun tp!25599 () Bool)

(declare-fun b_and!14533 () Bool)

(assert (=> start!34414 (= tp!25599 b_and!14533)))

(declare-fun mapIsEmpty!12393 () Bool)

(declare-fun mapRes!12393 () Bool)

(assert (=> mapIsEmpty!12393 mapRes!12393))

(declare-fun b!343511 () Bool)

(declare-fun res!189922 () Bool)

(declare-fun e!210610 () Bool)

(assert (=> b!343511 (=> (not res!189922) (not e!210610))))

(declare-datatypes ((array!18189 0))(
  ( (array!18190 (arr!8611 (Array (_ BitVec 32) (_ BitVec 64))) (size!8964 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18189)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18189 (_ BitVec 32)) Bool)

(assert (=> b!343511 (= res!189922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343513 () Bool)

(declare-fun res!189923 () Bool)

(assert (=> b!343513 (=> (not res!189923) (not e!210610))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343513 (= res!189923 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12393 () Bool)

(declare-fun tp!25598 () Bool)

(declare-fun e!210609 () Bool)

(assert (=> mapNonEmpty!12393 (= mapRes!12393 (and tp!25598 e!210609))))

(declare-fun mapKey!12393 () (_ BitVec 32))

(declare-datatypes ((V!10715 0))(
  ( (V!10716 (val!3696 Int)) )
))
(declare-datatypes ((ValueCell!3308 0))(
  ( (ValueCellFull!3308 (v!5866 V!10715)) (EmptyCell!3308) )
))
(declare-fun mapRest!12393 () (Array (_ BitVec 32) ValueCell!3308))

(declare-datatypes ((array!18191 0))(
  ( (array!18192 (arr!8612 (Array (_ BitVec 32) ValueCell!3308)) (size!8965 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18191)

(declare-fun mapValue!12393 () ValueCell!3308)

(assert (=> mapNonEmpty!12393 (= (arr!8612 _values!1525) (store mapRest!12393 mapKey!12393 mapValue!12393))))

(declare-fun b!343514 () Bool)

(declare-fun tp_is_empty!7303 () Bool)

(assert (=> b!343514 (= e!210609 tp_is_empty!7303)))

(declare-fun b!343515 () Bool)

(declare-fun res!189921 () Bool)

(assert (=> b!343515 (=> (not res!189921) (not e!210610))))

(declare-datatypes ((List!4925 0))(
  ( (Nil!4922) (Cons!4921 (h!5777 (_ BitVec 64)) (t!10032 List!4925)) )
))
(declare-fun arrayNoDuplicates!0 (array!18189 (_ BitVec 32) List!4925) Bool)

(assert (=> b!343515 (= res!189921 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4922))))

(declare-fun b!343516 () Bool)

(declare-fun e!210611 () Bool)

(declare-fun e!210613 () Bool)

(assert (=> b!343516 (= e!210611 (and e!210613 mapRes!12393))))

(declare-fun condMapEmpty!12393 () Bool)

(declare-fun mapDefault!12393 () ValueCell!3308)

(assert (=> b!343516 (= condMapEmpty!12393 (= (arr!8612 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3308)) mapDefault!12393)))))

(declare-fun b!343517 () Bool)

(declare-fun res!189925 () Bool)

(assert (=> b!343517 (=> (not res!189925) (not e!210610))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343517 (= res!189925 (and (= (size!8965 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8964 _keys!1895) (size!8965 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343512 () Bool)

(declare-fun res!189926 () Bool)

(assert (=> b!343512 (=> (not res!189926) (not e!210610))))

(declare-fun zeroValue!1467 () V!10715)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10715)

(declare-datatypes ((tuple2!5302 0))(
  ( (tuple2!5303 (_1!2662 (_ BitVec 64)) (_2!2662 V!10715)) )
))
(declare-datatypes ((List!4926 0))(
  ( (Nil!4923) (Cons!4922 (h!5778 tuple2!5302) (t!10033 List!4926)) )
))
(declare-datatypes ((ListLongMap!4205 0))(
  ( (ListLongMap!4206 (toList!2118 List!4926)) )
))
(declare-fun contains!2187 (ListLongMap!4205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1624 (array!18189 array!18191 (_ BitVec 32) (_ BitVec 32) V!10715 V!10715 (_ BitVec 32) Int) ListLongMap!4205)

(assert (=> b!343512 (= res!189926 (not (contains!2187 (getCurrentListMap!1624 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!189924 () Bool)

(assert (=> start!34414 (=> (not res!189924) (not e!210610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34414 (= res!189924 (validMask!0 mask!2385))))

(assert (=> start!34414 e!210610))

(assert (=> start!34414 true))

(assert (=> start!34414 tp_is_empty!7303))

(assert (=> start!34414 tp!25599))

(declare-fun array_inv!6398 (array!18191) Bool)

(assert (=> start!34414 (and (array_inv!6398 _values!1525) e!210611)))

(declare-fun array_inv!6399 (array!18189) Bool)

(assert (=> start!34414 (array_inv!6399 _keys!1895)))

(declare-fun b!343518 () Bool)

(assert (=> b!343518 (= e!210610 false)))

(declare-datatypes ((SeekEntryResult!3319 0))(
  ( (MissingZero!3319 (index!15455 (_ BitVec 32))) (Found!3319 (index!15456 (_ BitVec 32))) (Intermediate!3319 (undefined!4131 Bool) (index!15457 (_ BitVec 32)) (x!34212 (_ BitVec 32))) (Undefined!3319) (MissingVacant!3319 (index!15458 (_ BitVec 32))) )
))
(declare-fun lt!162366 () SeekEntryResult!3319)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18189 (_ BitVec 32)) SeekEntryResult!3319)

(assert (=> b!343518 (= lt!162366 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343519 () Bool)

(assert (=> b!343519 (= e!210613 tp_is_empty!7303)))

(assert (= (and start!34414 res!189924) b!343517))

(assert (= (and b!343517 res!189925) b!343511))

(assert (= (and b!343511 res!189922) b!343515))

(assert (= (and b!343515 res!189921) b!343513))

(assert (= (and b!343513 res!189923) b!343512))

(assert (= (and b!343512 res!189926) b!343518))

(assert (= (and b!343516 condMapEmpty!12393) mapIsEmpty!12393))

(assert (= (and b!343516 (not condMapEmpty!12393)) mapNonEmpty!12393))

(get-info :version)

(assert (= (and mapNonEmpty!12393 ((_ is ValueCellFull!3308) mapValue!12393)) b!343514))

(assert (= (and b!343516 ((_ is ValueCellFull!3308) mapDefault!12393)) b!343519))

(assert (= start!34414 b!343516))

(declare-fun m!344847 () Bool)

(assert (=> start!34414 m!344847))

(declare-fun m!344849 () Bool)

(assert (=> start!34414 m!344849))

(declare-fun m!344851 () Bool)

(assert (=> start!34414 m!344851))

(declare-fun m!344853 () Bool)

(assert (=> b!343512 m!344853))

(assert (=> b!343512 m!344853))

(declare-fun m!344855 () Bool)

(assert (=> b!343512 m!344855))

(declare-fun m!344857 () Bool)

(assert (=> b!343518 m!344857))

(declare-fun m!344859 () Bool)

(assert (=> b!343515 m!344859))

(declare-fun m!344861 () Bool)

(assert (=> b!343511 m!344861))

(declare-fun m!344863 () Bool)

(assert (=> b!343513 m!344863))

(declare-fun m!344865 () Bool)

(assert (=> mapNonEmpty!12393 m!344865))

(check-sat (not b!343512) (not b_next!7351) (not start!34414) (not b!343513) (not b!343511) (not b!343518) (not b!343515) b_and!14533 tp_is_empty!7303 (not mapNonEmpty!12393))
(check-sat b_and!14533 (not b_next!7351))
