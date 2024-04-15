; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34510 () Bool)

(assert start!34510)

(declare-fun b_free!7447 () Bool)

(declare-fun b_next!7447 () Bool)

(assert (=> start!34510 (= b_free!7447 (not b_next!7447))))

(declare-fun tp!25887 () Bool)

(declare-fun b_and!14629 () Bool)

(assert (=> start!34510 (= tp!25887 b_and!14629)))

(declare-fun b!344807 () Bool)

(declare-fun res!190787 () Bool)

(declare-fun e!211333 () Bool)

(assert (=> b!344807 (=> (not res!190787) (not e!211333))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10843 0))(
  ( (V!10844 (val!3744 Int)) )
))
(declare-fun zeroValue!1467 () V!10843)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3356 0))(
  ( (ValueCellFull!3356 (v!5914 V!10843)) (EmptyCell!3356) )
))
(declare-datatypes ((array!18367 0))(
  ( (array!18368 (arr!8700 (Array (_ BitVec 32) ValueCell!3356)) (size!9053 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18367)

(declare-datatypes ((array!18369 0))(
  ( (array!18370 (arr!8701 (Array (_ BitVec 32) (_ BitVec 64))) (size!9054 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18369)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10843)

(declare-datatypes ((tuple2!5376 0))(
  ( (tuple2!5377 (_1!2699 (_ BitVec 64)) (_2!2699 V!10843)) )
))
(declare-datatypes ((List!4994 0))(
  ( (Nil!4991) (Cons!4990 (h!5846 tuple2!5376) (t!10101 List!4994)) )
))
(declare-datatypes ((ListLongMap!4279 0))(
  ( (ListLongMap!4280 (toList!2155 List!4994)) )
))
(declare-fun contains!2224 (ListLongMap!4279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1661 (array!18369 array!18367 (_ BitVec 32) (_ BitVec 32) V!10843 V!10843 (_ BitVec 32) Int) ListLongMap!4279)

(assert (=> b!344807 (= res!190787 (not (contains!2224 (getCurrentListMap!1661 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344809 () Bool)

(declare-fun res!190786 () Bool)

(assert (=> b!344809 (=> (not res!190786) (not e!211333))))

(assert (=> b!344809 (= res!190786 (and (= (size!9053 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9054 _keys!1895) (size!9053 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344810 () Bool)

(declare-fun e!211329 () Bool)

(declare-fun tp_is_empty!7399 () Bool)

(assert (=> b!344810 (= e!211329 tp_is_empty!7399)))

(declare-fun b!344811 () Bool)

(declare-fun res!190788 () Bool)

(assert (=> b!344811 (=> (not res!190788) (not e!211333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18369 (_ BitVec 32)) Bool)

(assert (=> b!344811 (= res!190788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344812 () Bool)

(declare-fun e!211332 () Bool)

(declare-fun e!211331 () Bool)

(declare-fun mapRes!12537 () Bool)

(assert (=> b!344812 (= e!211332 (and e!211331 mapRes!12537))))

(declare-fun condMapEmpty!12537 () Bool)

(declare-fun mapDefault!12537 () ValueCell!3356)

(assert (=> b!344812 (= condMapEmpty!12537 (= (arr!8700 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3356)) mapDefault!12537)))))

(declare-fun b!344813 () Bool)

(declare-fun res!190785 () Bool)

(assert (=> b!344813 (=> (not res!190785) (not e!211333))))

(declare-datatypes ((List!4995 0))(
  ( (Nil!4992) (Cons!4991 (h!5847 (_ BitVec 64)) (t!10102 List!4995)) )
))
(declare-fun arrayNoDuplicates!0 (array!18369 (_ BitVec 32) List!4995) Bool)

(assert (=> b!344813 (= res!190785 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4992))))

(declare-fun b!344814 () Bool)

(assert (=> b!344814 (= e!211333 false)))

(declare-datatypes ((SeekEntryResult!3350 0))(
  ( (MissingZero!3350 (index!15579 (_ BitVec 32))) (Found!3350 (index!15580 (_ BitVec 32))) (Intermediate!3350 (undefined!4162 Bool) (index!15581 (_ BitVec 32)) (x!34371 (_ BitVec 32))) (Undefined!3350) (MissingVacant!3350 (index!15582 (_ BitVec 32))) )
))
(declare-fun lt!162510 () SeekEntryResult!3350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18369 (_ BitVec 32)) SeekEntryResult!3350)

(assert (=> b!344814 (= lt!162510 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12537 () Bool)

(declare-fun tp!25886 () Bool)

(assert (=> mapNonEmpty!12537 (= mapRes!12537 (and tp!25886 e!211329))))

(declare-fun mapKey!12537 () (_ BitVec 32))

(declare-fun mapRest!12537 () (Array (_ BitVec 32) ValueCell!3356))

(declare-fun mapValue!12537 () ValueCell!3356)

(assert (=> mapNonEmpty!12537 (= (arr!8700 _values!1525) (store mapRest!12537 mapKey!12537 mapValue!12537))))

(declare-fun mapIsEmpty!12537 () Bool)

(assert (=> mapIsEmpty!12537 mapRes!12537))

(declare-fun b!344815 () Bool)

(assert (=> b!344815 (= e!211331 tp_is_empty!7399)))

(declare-fun b!344808 () Bool)

(declare-fun res!190789 () Bool)

(assert (=> b!344808 (=> (not res!190789) (not e!211333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344808 (= res!190789 (validKeyInArray!0 k0!1348))))

(declare-fun res!190790 () Bool)

(assert (=> start!34510 (=> (not res!190790) (not e!211333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34510 (= res!190790 (validMask!0 mask!2385))))

(assert (=> start!34510 e!211333))

(assert (=> start!34510 true))

(assert (=> start!34510 tp_is_empty!7399))

(assert (=> start!34510 tp!25887))

(declare-fun array_inv!6468 (array!18367) Bool)

(assert (=> start!34510 (and (array_inv!6468 _values!1525) e!211332)))

(declare-fun array_inv!6469 (array!18369) Bool)

(assert (=> start!34510 (array_inv!6469 _keys!1895)))

(assert (= (and start!34510 res!190790) b!344809))

(assert (= (and b!344809 res!190786) b!344811))

(assert (= (and b!344811 res!190788) b!344813))

(assert (= (and b!344813 res!190785) b!344808))

(assert (= (and b!344808 res!190789) b!344807))

(assert (= (and b!344807 res!190787) b!344814))

(assert (= (and b!344812 condMapEmpty!12537) mapIsEmpty!12537))

(assert (= (and b!344812 (not condMapEmpty!12537)) mapNonEmpty!12537))

(get-info :version)

(assert (= (and mapNonEmpty!12537 ((_ is ValueCellFull!3356) mapValue!12537)) b!344810))

(assert (= (and b!344812 ((_ is ValueCellFull!3356) mapDefault!12537)) b!344815))

(assert (= start!34510 b!344812))

(declare-fun m!345807 () Bool)

(assert (=> b!344807 m!345807))

(assert (=> b!344807 m!345807))

(declare-fun m!345809 () Bool)

(assert (=> b!344807 m!345809))

(declare-fun m!345811 () Bool)

(assert (=> b!344808 m!345811))

(declare-fun m!345813 () Bool)

(assert (=> mapNonEmpty!12537 m!345813))

(declare-fun m!345815 () Bool)

(assert (=> b!344813 m!345815))

(declare-fun m!345817 () Bool)

(assert (=> b!344814 m!345817))

(declare-fun m!345819 () Bool)

(assert (=> start!34510 m!345819))

(declare-fun m!345821 () Bool)

(assert (=> start!34510 m!345821))

(declare-fun m!345823 () Bool)

(assert (=> start!34510 m!345823))

(declare-fun m!345825 () Bool)

(assert (=> b!344811 m!345825))

(check-sat b_and!14629 (not b_next!7447) tp_is_empty!7399 (not start!34510) (not b!344811) (not b!344813) (not mapNonEmpty!12537) (not b!344807) (not b!344814) (not b!344808))
(check-sat b_and!14629 (not b_next!7447))
