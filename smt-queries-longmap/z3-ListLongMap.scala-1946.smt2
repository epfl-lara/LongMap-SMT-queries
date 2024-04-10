; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34424 () Bool)

(assert start!34424)

(declare-fun b_free!7347 () Bool)

(declare-fun b_next!7347 () Bool)

(assert (=> start!34424 (= b_free!7347 (not b_next!7347))))

(declare-fun tp!25586 () Bool)

(declare-fun b_and!14555 () Bool)

(assert (=> start!34424 (= tp!25586 b_and!14555)))

(declare-fun res!190018 () Bool)

(declare-fun e!210759 () Bool)

(assert (=> start!34424 (=> (not res!190018) (not e!210759))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34424 (= res!190018 (validMask!0 mask!2385))))

(assert (=> start!34424 e!210759))

(assert (=> start!34424 true))

(declare-fun tp_is_empty!7299 () Bool)

(assert (=> start!34424 tp_is_empty!7299))

(assert (=> start!34424 tp!25586))

(declare-datatypes ((V!10709 0))(
  ( (V!10710 (val!3694 Int)) )
))
(declare-datatypes ((ValueCell!3306 0))(
  ( (ValueCellFull!3306 (v!5870 V!10709)) (EmptyCell!3306) )
))
(declare-datatypes ((array!18191 0))(
  ( (array!18192 (arr!8612 (Array (_ BitVec 32) ValueCell!3306)) (size!8964 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18191)

(declare-fun e!210755 () Bool)

(declare-fun array_inv!6380 (array!18191) Bool)

(assert (=> start!34424 (and (array_inv!6380 _values!1525) e!210755)))

(declare-datatypes ((array!18193 0))(
  ( (array!18194 (arr!8613 (Array (_ BitVec 32) (_ BitVec 64))) (size!8965 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18193)

(declare-fun array_inv!6381 (array!18193) Bool)

(assert (=> start!34424 (array_inv!6381 _keys!1895)))

(declare-fun b!343732 () Bool)

(declare-fun res!190015 () Bool)

(assert (=> b!343732 (=> (not res!190015) (not e!210759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18193 (_ BitVec 32)) Bool)

(assert (=> b!343732 (= res!190015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343733 () Bool)

(declare-fun e!210756 () Bool)

(declare-fun mapRes!12387 () Bool)

(assert (=> b!343733 (= e!210755 (and e!210756 mapRes!12387))))

(declare-fun condMapEmpty!12387 () Bool)

(declare-fun mapDefault!12387 () ValueCell!3306)

(assert (=> b!343733 (= condMapEmpty!12387 (= (arr!8612 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3306)) mapDefault!12387)))))

(declare-fun mapNonEmpty!12387 () Bool)

(declare-fun tp!25587 () Bool)

(declare-fun e!210757 () Bool)

(assert (=> mapNonEmpty!12387 (= mapRes!12387 (and tp!25587 e!210757))))

(declare-fun mapKey!12387 () (_ BitVec 32))

(declare-fun mapValue!12387 () ValueCell!3306)

(declare-fun mapRest!12387 () (Array (_ BitVec 32) ValueCell!3306))

(assert (=> mapNonEmpty!12387 (= (arr!8612 _values!1525) (store mapRest!12387 mapKey!12387 mapValue!12387))))

(declare-fun b!343734 () Bool)

(declare-fun res!190014 () Bool)

(assert (=> b!343734 (=> (not res!190014) (not e!210759))))

(declare-datatypes ((List!4968 0))(
  ( (Nil!4965) (Cons!4964 (h!5820 (_ BitVec 64)) (t!10084 List!4968)) )
))
(declare-fun arrayNoDuplicates!0 (array!18193 (_ BitVec 32) List!4968) Bool)

(assert (=> b!343734 (= res!190014 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4965))))

(declare-fun b!343735 () Bool)

(declare-fun res!190016 () Bool)

(assert (=> b!343735 (=> (not res!190016) (not e!210759))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343735 (= res!190016 (validKeyInArray!0 k0!1348))))

(declare-fun b!343736 () Bool)

(declare-fun res!190019 () Bool)

(assert (=> b!343736 (=> (not res!190019) (not e!210759))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343736 (= res!190019 (and (= (size!8964 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8965 _keys!1895) (size!8964 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12387 () Bool)

(assert (=> mapIsEmpty!12387 mapRes!12387))

(declare-fun b!343737 () Bool)

(assert (=> b!343737 (= e!210756 tp_is_empty!7299)))

(declare-datatypes ((SeekEntryResult!3324 0))(
  ( (MissingZero!3324 (index!15475 (_ BitVec 32))) (Found!3324 (index!15476 (_ BitVec 32))) (Intermediate!3324 (undefined!4136 Bool) (index!15477 (_ BitVec 32)) (x!34214 (_ BitVec 32))) (Undefined!3324) (MissingVacant!3324 (index!15478 (_ BitVec 32))) )
))
(declare-fun lt!162595 () SeekEntryResult!3324)

(declare-fun b!343738 () Bool)

(get-info :version)

(assert (=> b!343738 (= e!210759 (and (not ((_ is Found!3324) lt!162595)) (not ((_ is MissingZero!3324) lt!162595)) (not ((_ is MissingVacant!3324) lt!162595)) ((_ is Undefined!3324) lt!162595) (not (= (size!8965 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18193 (_ BitVec 32)) SeekEntryResult!3324)

(assert (=> b!343738 (= lt!162595 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343739 () Bool)

(assert (=> b!343739 (= e!210757 tp_is_empty!7299)))

(declare-fun b!343740 () Bool)

(declare-fun res!190017 () Bool)

(assert (=> b!343740 (=> (not res!190017) (not e!210759))))

(declare-fun zeroValue!1467 () V!10709)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10709)

(declare-datatypes ((tuple2!5348 0))(
  ( (tuple2!5349 (_1!2685 (_ BitVec 64)) (_2!2685 V!10709)) )
))
(declare-datatypes ((List!4969 0))(
  ( (Nil!4966) (Cons!4965 (h!5821 tuple2!5348) (t!10085 List!4969)) )
))
(declare-datatypes ((ListLongMap!4261 0))(
  ( (ListLongMap!4262 (toList!2146 List!4969)) )
))
(declare-fun contains!2204 (ListLongMap!4261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1667 (array!18193 array!18191 (_ BitVec 32) (_ BitVec 32) V!10709 V!10709 (_ BitVec 32) Int) ListLongMap!4261)

(assert (=> b!343740 (= res!190017 (not (contains!2204 (getCurrentListMap!1667 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34424 res!190018) b!343736))

(assert (= (and b!343736 res!190019) b!343732))

(assert (= (and b!343732 res!190015) b!343734))

(assert (= (and b!343734 res!190014) b!343735))

(assert (= (and b!343735 res!190016) b!343740))

(assert (= (and b!343740 res!190017) b!343738))

(assert (= (and b!343733 condMapEmpty!12387) mapIsEmpty!12387))

(assert (= (and b!343733 (not condMapEmpty!12387)) mapNonEmpty!12387))

(assert (= (and mapNonEmpty!12387 ((_ is ValueCellFull!3306) mapValue!12387)) b!343739))

(assert (= (and b!343733 ((_ is ValueCellFull!3306) mapDefault!12387)) b!343737))

(assert (= start!34424 b!343733))

(declare-fun m!345537 () Bool)

(assert (=> mapNonEmpty!12387 m!345537))

(declare-fun m!345539 () Bool)

(assert (=> b!343732 m!345539))

(declare-fun m!345541 () Bool)

(assert (=> b!343735 m!345541))

(declare-fun m!345543 () Bool)

(assert (=> b!343740 m!345543))

(assert (=> b!343740 m!345543))

(declare-fun m!345545 () Bool)

(assert (=> b!343740 m!345545))

(declare-fun m!345547 () Bool)

(assert (=> b!343738 m!345547))

(declare-fun m!345549 () Bool)

(assert (=> start!34424 m!345549))

(declare-fun m!345551 () Bool)

(assert (=> start!34424 m!345551))

(declare-fun m!345553 () Bool)

(assert (=> start!34424 m!345553))

(declare-fun m!345555 () Bool)

(assert (=> b!343734 m!345555))

(check-sat (not b!343732) (not b!343740) (not b_next!7347) (not b!343734) b_and!14555 (not mapNonEmpty!12387) (not b!343738) (not b!343735) (not start!34424) tp_is_empty!7299)
(check-sat b_and!14555 (not b_next!7347))
