; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35000 () Bool)

(assert start!35000)

(declare-fun b_free!7689 () Bool)

(declare-fun b_next!7689 () Bool)

(assert (=> start!35000 (= b_free!7689 (not b_next!7689))))

(declare-fun tp!26646 () Bool)

(declare-fun b_and!14919 () Bool)

(assert (=> start!35000 (= tp!26646 b_and!14919)))

(declare-fun b!350612 () Bool)

(declare-fun res!194323 () Bool)

(declare-fun e!214757 () Bool)

(assert (=> b!350612 (=> (not res!194323) (not e!214757))))

(declare-datatypes ((array!18869 0))(
  ( (array!18870 (arr!8940 (Array (_ BitVec 32) (_ BitVec 64))) (size!9292 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18869)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18869 (_ BitVec 32)) Bool)

(assert (=> b!350612 (= res!194323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12933 () Bool)

(declare-fun mapRes!12933 () Bool)

(declare-fun tp!26645 () Bool)

(declare-fun e!214758 () Bool)

(assert (=> mapNonEmpty!12933 (= mapRes!12933 (and tp!26645 e!214758))))

(declare-datatypes ((V!11165 0))(
  ( (V!11166 (val!3865 Int)) )
))
(declare-datatypes ((ValueCell!3477 0))(
  ( (ValueCellFull!3477 (v!6052 V!11165)) (EmptyCell!3477) )
))
(declare-fun mapValue!12933 () ValueCell!3477)

(declare-fun mapRest!12933 () (Array (_ BitVec 32) ValueCell!3477))

(declare-fun mapKey!12933 () (_ BitVec 32))

(declare-datatypes ((array!18871 0))(
  ( (array!18872 (arr!8941 (Array (_ BitVec 32) ValueCell!3477)) (size!9293 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18871)

(assert (=> mapNonEmpty!12933 (= (arr!8941 _values!1525) (store mapRest!12933 mapKey!12933 mapValue!12933))))

(declare-fun b!350613 () Bool)

(declare-fun res!194325 () Bool)

(assert (=> b!350613 (=> (not res!194325) (not e!214757))))

(declare-datatypes ((List!5200 0))(
  ( (Nil!5197) (Cons!5196 (h!6052 (_ BitVec 64)) (t!10338 List!5200)) )
))
(declare-fun arrayNoDuplicates!0 (array!18869 (_ BitVec 32) List!5200) Bool)

(assert (=> b!350613 (= res!194325 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5197))))

(declare-fun b!350614 () Bool)

(declare-fun e!214759 () Bool)

(assert (=> b!350614 (= e!214759 false)))

(declare-fun lt!164613 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18869 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350614 (= lt!164613 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350615 () Bool)

(declare-fun tp_is_empty!7641 () Bool)

(assert (=> b!350615 (= e!214758 tp_is_empty!7641)))

(declare-fun b!350616 () Bool)

(declare-fun e!214754 () Bool)

(assert (=> b!350616 (= e!214754 tp_is_empty!7641)))

(declare-fun res!194328 () Bool)

(assert (=> start!35000 (=> (not res!194328) (not e!214757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35000 (= res!194328 (validMask!0 mask!2385))))

(assert (=> start!35000 e!214757))

(assert (=> start!35000 true))

(assert (=> start!35000 tp_is_empty!7641))

(assert (=> start!35000 tp!26646))

(declare-fun e!214756 () Bool)

(declare-fun array_inv!6600 (array!18871) Bool)

(assert (=> start!35000 (and (array_inv!6600 _values!1525) e!214756)))

(declare-fun array_inv!6601 (array!18869) Bool)

(assert (=> start!35000 (array_inv!6601 _keys!1895)))

(declare-fun b!350617 () Bool)

(declare-fun res!194322 () Bool)

(assert (=> b!350617 (=> (not res!194322) (not e!214757))))

(declare-fun zeroValue!1467 () V!11165)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11165)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5578 0))(
  ( (tuple2!5579 (_1!2800 (_ BitVec 64)) (_2!2800 V!11165)) )
))
(declare-datatypes ((List!5201 0))(
  ( (Nil!5198) (Cons!5197 (h!6053 tuple2!5578) (t!10339 List!5201)) )
))
(declare-datatypes ((ListLongMap!4491 0))(
  ( (ListLongMap!4492 (toList!2261 List!5201)) )
))
(declare-fun contains!2330 (ListLongMap!4491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1782 (array!18869 array!18871 (_ BitVec 32) (_ BitVec 32) V!11165 V!11165 (_ BitVec 32) Int) ListLongMap!4491)

(assert (=> b!350617 (= res!194322 (not (contains!2330 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350618 () Bool)

(declare-fun res!194326 () Bool)

(assert (=> b!350618 (=> (not res!194326) (not e!214757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350618 (= res!194326 (validKeyInArray!0 k0!1348))))

(declare-fun b!350619 () Bool)

(assert (=> b!350619 (= e!214757 e!214759)))

(declare-fun res!194327 () Bool)

(assert (=> b!350619 (=> (not res!194327) (not e!214759))))

(declare-datatypes ((SeekEntryResult!3442 0))(
  ( (MissingZero!3442 (index!15947 (_ BitVec 32))) (Found!3442 (index!15948 (_ BitVec 32))) (Intermediate!3442 (undefined!4254 Bool) (index!15949 (_ BitVec 32)) (x!34898 (_ BitVec 32))) (Undefined!3442) (MissingVacant!3442 (index!15950 (_ BitVec 32))) )
))
(declare-fun lt!164614 () SeekEntryResult!3442)

(get-info :version)

(assert (=> b!350619 (= res!194327 (and (not ((_ is Found!3442) lt!164614)) (not ((_ is MissingZero!3442) lt!164614)) ((_ is MissingVacant!3442) lt!164614)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18869 (_ BitVec 32)) SeekEntryResult!3442)

(assert (=> b!350619 (= lt!164614 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350620 () Bool)

(assert (=> b!350620 (= e!214756 (and e!214754 mapRes!12933))))

(declare-fun condMapEmpty!12933 () Bool)

(declare-fun mapDefault!12933 () ValueCell!3477)

(assert (=> b!350620 (= condMapEmpty!12933 (= (arr!8941 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3477)) mapDefault!12933)))))

(declare-fun b!350621 () Bool)

(declare-fun res!194324 () Bool)

(assert (=> b!350621 (=> (not res!194324) (not e!214757))))

(assert (=> b!350621 (= res!194324 (and (= (size!9293 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9292 _keys!1895) (size!9293 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12933 () Bool)

(assert (=> mapIsEmpty!12933 mapRes!12933))

(declare-fun b!350622 () Bool)

(declare-fun res!194321 () Bool)

(assert (=> b!350622 (=> (not res!194321) (not e!214759))))

(declare-fun arrayContainsKey!0 (array!18869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350622 (= res!194321 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35000 res!194328) b!350621))

(assert (= (and b!350621 res!194324) b!350612))

(assert (= (and b!350612 res!194323) b!350613))

(assert (= (and b!350613 res!194325) b!350618))

(assert (= (and b!350618 res!194326) b!350617))

(assert (= (and b!350617 res!194322) b!350619))

(assert (= (and b!350619 res!194327) b!350622))

(assert (= (and b!350622 res!194321) b!350614))

(assert (= (and b!350620 condMapEmpty!12933) mapIsEmpty!12933))

(assert (= (and b!350620 (not condMapEmpty!12933)) mapNonEmpty!12933))

(assert (= (and mapNonEmpty!12933 ((_ is ValueCellFull!3477) mapValue!12933)) b!350615))

(assert (= (and b!350620 ((_ is ValueCellFull!3477) mapDefault!12933)) b!350616))

(assert (= start!35000 b!350620))

(declare-fun m!350761 () Bool)

(assert (=> b!350614 m!350761))

(declare-fun m!350763 () Bool)

(assert (=> start!35000 m!350763))

(declare-fun m!350765 () Bool)

(assert (=> start!35000 m!350765))

(declare-fun m!350767 () Bool)

(assert (=> start!35000 m!350767))

(declare-fun m!350769 () Bool)

(assert (=> b!350612 m!350769))

(declare-fun m!350771 () Bool)

(assert (=> b!350617 m!350771))

(assert (=> b!350617 m!350771))

(declare-fun m!350773 () Bool)

(assert (=> b!350617 m!350773))

(declare-fun m!350775 () Bool)

(assert (=> b!350613 m!350775))

(declare-fun m!350777 () Bool)

(assert (=> mapNonEmpty!12933 m!350777))

(declare-fun m!350779 () Bool)

(assert (=> b!350622 m!350779))

(declare-fun m!350781 () Bool)

(assert (=> b!350619 m!350781))

(declare-fun m!350783 () Bool)

(assert (=> b!350618 m!350783))

(check-sat (not b!350612) (not b!350618) (not b!350622) (not b_next!7689) b_and!14919 (not b!350619) tp_is_empty!7641 (not b!350617) (not b!350613) (not start!35000) (not b!350614) (not mapNonEmpty!12933))
(check-sat b_and!14919 (not b_next!7689))
