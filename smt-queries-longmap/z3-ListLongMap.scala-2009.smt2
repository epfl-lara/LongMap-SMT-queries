; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35020 () Bool)

(assert start!35020)

(declare-fun b_free!7723 () Bool)

(declare-fun b_next!7723 () Bool)

(assert (=> start!35020 (= b_free!7723 (not b_next!7723))))

(declare-fun tp!26748 () Bool)

(declare-fun b_and!14927 () Bool)

(assert (=> start!35020 (= tp!26748 b_and!14927)))

(declare-fun b!350898 () Bool)

(declare-fun res!194603 () Bool)

(declare-fun e!214888 () Bool)

(assert (=> b!350898 (=> (not res!194603) (not e!214888))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350898 (= res!194603 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12984 () Bool)

(declare-fun mapRes!12984 () Bool)

(declare-fun tp!26747 () Bool)

(declare-fun e!214884 () Bool)

(assert (=> mapNonEmpty!12984 (= mapRes!12984 (and tp!26747 e!214884))))

(declare-datatypes ((V!11211 0))(
  ( (V!11212 (val!3882 Int)) )
))
(declare-datatypes ((ValueCell!3494 0))(
  ( (ValueCellFull!3494 (v!6063 V!11211)) (EmptyCell!3494) )
))
(declare-fun mapRest!12984 () (Array (_ BitVec 32) ValueCell!3494))

(declare-fun mapValue!12984 () ValueCell!3494)

(declare-fun mapKey!12984 () (_ BitVec 32))

(declare-datatypes ((array!18917 0))(
  ( (array!18918 (arr!8964 (Array (_ BitVec 32) ValueCell!3494)) (size!9317 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18917)

(assert (=> mapNonEmpty!12984 (= (arr!8964 _values!1525) (store mapRest!12984 mapKey!12984 mapValue!12984))))

(declare-fun b!350899 () Bool)

(declare-fun e!214889 () Bool)

(assert (=> b!350899 (= e!214888 e!214889)))

(declare-fun res!194600 () Bool)

(assert (=> b!350899 (=> (not res!194600) (not e!214889))))

(declare-datatypes ((SeekEntryResult!3452 0))(
  ( (MissingZero!3452 (index!15987 (_ BitVec 32))) (Found!3452 (index!15988 (_ BitVec 32))) (Intermediate!3452 (undefined!4264 Bool) (index!15989 (_ BitVec 32)) (x!34951 (_ BitVec 32))) (Undefined!3452) (MissingVacant!3452 (index!15990 (_ BitVec 32))) )
))
(declare-fun lt!164481 () SeekEntryResult!3452)

(get-info :version)

(assert (=> b!350899 (= res!194600 (and (not ((_ is Found!3452) lt!164481)) (not ((_ is MissingZero!3452) lt!164481)) ((_ is MissingVacant!3452) lt!164481)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18919 0))(
  ( (array!18920 (arr!8965 (Array (_ BitVec 32) (_ BitVec 64))) (size!9318 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18919)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18919 (_ BitVec 32)) SeekEntryResult!3452)

(assert (=> b!350899 (= lt!164481 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12984 () Bool)

(assert (=> mapIsEmpty!12984 mapRes!12984))

(declare-fun b!350900 () Bool)

(declare-fun res!194602 () Bool)

(assert (=> b!350900 (=> (not res!194602) (not e!214889))))

(declare-fun arrayContainsKey!0 (array!18919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350900 (= res!194602 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350901 () Bool)

(declare-fun res!194601 () Bool)

(assert (=> b!350901 (=> (not res!194601) (not e!214888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18919 (_ BitVec 32)) Bool)

(assert (=> b!350901 (= res!194601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!194605 () Bool)

(assert (=> start!35020 (=> (not res!194605) (not e!214888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35020 (= res!194605 (validMask!0 mask!2385))))

(assert (=> start!35020 e!214888))

(assert (=> start!35020 true))

(declare-fun tp_is_empty!7675 () Bool)

(assert (=> start!35020 tp_is_empty!7675))

(assert (=> start!35020 tp!26748))

(declare-fun e!214885 () Bool)

(declare-fun array_inv!6640 (array!18917) Bool)

(assert (=> start!35020 (and (array_inv!6640 _values!1525) e!214885)))

(declare-fun array_inv!6641 (array!18919) Bool)

(assert (=> start!35020 (array_inv!6641 _keys!1895)))

(declare-fun b!350902 () Bool)

(declare-fun e!214886 () Bool)

(assert (=> b!350902 (= e!214886 tp_is_empty!7675)))

(declare-fun b!350903 () Bool)

(declare-fun res!194606 () Bool)

(assert (=> b!350903 (=> (not res!194606) (not e!214888))))

(declare-fun zeroValue!1467 () V!11211)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11211)

(declare-datatypes ((tuple2!5574 0))(
  ( (tuple2!5575 (_1!2798 (_ BitVec 64)) (_2!2798 V!11211)) )
))
(declare-datatypes ((List!5190 0))(
  ( (Nil!5187) (Cons!5186 (h!6042 tuple2!5574) (t!10319 List!5190)) )
))
(declare-datatypes ((ListLongMap!4477 0))(
  ( (ListLongMap!4478 (toList!2254 List!5190)) )
))
(declare-fun contains!2334 (ListLongMap!4477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1759 (array!18919 array!18917 (_ BitVec 32) (_ BitVec 32) V!11211 V!11211 (_ BitVec 32) Int) ListLongMap!4477)

(assert (=> b!350903 (= res!194606 (not (contains!2334 (getCurrentListMap!1759 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350904 () Bool)

(declare-fun res!194607 () Bool)

(assert (=> b!350904 (=> (not res!194607) (not e!214888))))

(declare-datatypes ((List!5191 0))(
  ( (Nil!5188) (Cons!5187 (h!6043 (_ BitVec 64)) (t!10320 List!5191)) )
))
(declare-fun arrayNoDuplicates!0 (array!18919 (_ BitVec 32) List!5191) Bool)

(assert (=> b!350904 (= res!194607 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5188))))

(declare-fun b!350905 () Bool)

(assert (=> b!350905 (= e!214889 false)))

(declare-fun lt!164480 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18919 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350905 (= lt!164480 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350906 () Bool)

(declare-fun res!194604 () Bool)

(assert (=> b!350906 (=> (not res!194604) (not e!214888))))

(assert (=> b!350906 (= res!194604 (and (= (size!9317 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9318 _keys!1895) (size!9317 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350907 () Bool)

(assert (=> b!350907 (= e!214885 (and e!214886 mapRes!12984))))

(declare-fun condMapEmpty!12984 () Bool)

(declare-fun mapDefault!12984 () ValueCell!3494)

(assert (=> b!350907 (= condMapEmpty!12984 (= (arr!8964 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3494)) mapDefault!12984)))))

(declare-fun b!350908 () Bool)

(assert (=> b!350908 (= e!214884 tp_is_empty!7675)))

(assert (= (and start!35020 res!194605) b!350906))

(assert (= (and b!350906 res!194604) b!350901))

(assert (= (and b!350901 res!194601) b!350904))

(assert (= (and b!350904 res!194607) b!350898))

(assert (= (and b!350898 res!194603) b!350903))

(assert (= (and b!350903 res!194606) b!350899))

(assert (= (and b!350899 res!194600) b!350900))

(assert (= (and b!350900 res!194602) b!350905))

(assert (= (and b!350907 condMapEmpty!12984) mapIsEmpty!12984))

(assert (= (and b!350907 (not condMapEmpty!12984)) mapNonEmpty!12984))

(assert (= (and mapNonEmpty!12984 ((_ is ValueCellFull!3494) mapValue!12984)) b!350908))

(assert (= (and b!350907 ((_ is ValueCellFull!3494) mapDefault!12984)) b!350902))

(assert (= start!35020 b!350907))

(declare-fun m!350439 () Bool)

(assert (=> b!350898 m!350439))

(declare-fun m!350441 () Bool)

(assert (=> b!350905 m!350441))

(declare-fun m!350443 () Bool)

(assert (=> b!350901 m!350443))

(declare-fun m!350445 () Bool)

(assert (=> b!350904 m!350445))

(declare-fun m!350447 () Bool)

(assert (=> mapNonEmpty!12984 m!350447))

(declare-fun m!350449 () Bool)

(assert (=> b!350899 m!350449))

(declare-fun m!350451 () Bool)

(assert (=> b!350903 m!350451))

(assert (=> b!350903 m!350451))

(declare-fun m!350453 () Bool)

(assert (=> b!350903 m!350453))

(declare-fun m!350455 () Bool)

(assert (=> b!350900 m!350455))

(declare-fun m!350457 () Bool)

(assert (=> start!35020 m!350457))

(declare-fun m!350459 () Bool)

(assert (=> start!35020 m!350459))

(declare-fun m!350461 () Bool)

(assert (=> start!35020 m!350461))

(check-sat (not b!350904) (not b!350900) (not b!350899) tp_is_empty!7675 (not start!35020) (not b!350905) b_and!14927 (not b!350898) (not b_next!7723) (not mapNonEmpty!12984) (not b!350903) (not b!350901))
(check-sat b_and!14927 (not b_next!7723))
