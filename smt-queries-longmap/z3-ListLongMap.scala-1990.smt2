; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34826 () Bool)

(assert start!34826)

(declare-fun b_free!7611 () Bool)

(declare-fun b_next!7611 () Bool)

(assert (=> start!34826 (= b_free!7611 (not b_next!7611))))

(declare-fun tp!26399 () Bool)

(declare-fun b_and!14833 () Bool)

(assert (=> start!34826 (= tp!26399 b_and!14833)))

(declare-fun b!348641 () Bool)

(declare-fun e!213595 () Bool)

(assert (=> b!348641 (= e!213595 false)))

(declare-fun lt!163914 () (_ BitVec 32))

(declare-datatypes ((array!18713 0))(
  ( (array!18714 (arr!8866 (Array (_ BitVec 32) (_ BitVec 64))) (size!9218 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18713)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18713 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348641 (= lt!163914 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348642 () Bool)

(declare-fun res!193167 () Bool)

(declare-fun e!213592 () Bool)

(assert (=> b!348642 (=> (not res!193167) (not e!213592))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18713 (_ BitVec 32)) Bool)

(assert (=> b!348642 (= res!193167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348643 () Bool)

(declare-fun res!193164 () Bool)

(assert (=> b!348643 (=> (not res!193164) (not e!213592))))

(declare-datatypes ((V!11061 0))(
  ( (V!11062 (val!3826 Int)) )
))
(declare-datatypes ((ValueCell!3438 0))(
  ( (ValueCellFull!3438 (v!6009 V!11061)) (EmptyCell!3438) )
))
(declare-datatypes ((array!18715 0))(
  ( (array!18716 (arr!8867 (Array (_ BitVec 32) ValueCell!3438)) (size!9219 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18715)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348643 (= res!193164 (and (= (size!9219 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9218 _keys!1895) (size!9219 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348644 () Bool)

(declare-fun e!213591 () Bool)

(declare-fun tp_is_empty!7563 () Bool)

(assert (=> b!348644 (= e!213591 tp_is_empty!7563)))

(declare-fun b!348645 () Bool)

(assert (=> b!348645 (= e!213592 e!213595)))

(declare-fun res!193166 () Bool)

(assert (=> b!348645 (=> (not res!193166) (not e!213595))))

(declare-datatypes ((SeekEntryResult!3419 0))(
  ( (MissingZero!3419 (index!15855 (_ BitVec 32))) (Found!3419 (index!15856 (_ BitVec 32))) (Intermediate!3419 (undefined!4231 Bool) (index!15857 (_ BitVec 32)) (x!34731 (_ BitVec 32))) (Undefined!3419) (MissingVacant!3419 (index!15858 (_ BitVec 32))) )
))
(declare-fun lt!163915 () SeekEntryResult!3419)

(get-info :version)

(assert (=> b!348645 (= res!193166 (and (not ((_ is Found!3419) lt!163915)) ((_ is MissingZero!3419) lt!163915)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18713 (_ BitVec 32)) SeekEntryResult!3419)

(assert (=> b!348645 (= lt!163915 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12804 () Bool)

(declare-fun mapRes!12804 () Bool)

(declare-fun tp!26400 () Bool)

(assert (=> mapNonEmpty!12804 (= mapRes!12804 (and tp!26400 e!213591))))

(declare-fun mapRest!12804 () (Array (_ BitVec 32) ValueCell!3438))

(declare-fun mapValue!12804 () ValueCell!3438)

(declare-fun mapKey!12804 () (_ BitVec 32))

(assert (=> mapNonEmpty!12804 (= (arr!8867 _values!1525) (store mapRest!12804 mapKey!12804 mapValue!12804))))

(declare-fun b!348646 () Bool)

(declare-fun res!193163 () Bool)

(assert (=> b!348646 (=> (not res!193163) (not e!213595))))

(declare-fun arrayContainsKey!0 (array!18713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348646 (= res!193163 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348647 () Bool)

(declare-fun res!193168 () Bool)

(assert (=> b!348647 (=> (not res!193168) (not e!213592))))

(declare-datatypes ((List!5152 0))(
  ( (Nil!5149) (Cons!5148 (h!6004 (_ BitVec 64)) (t!10282 List!5152)) )
))
(declare-fun arrayNoDuplicates!0 (array!18713 (_ BitVec 32) List!5152) Bool)

(assert (=> b!348647 (= res!193168 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5149))))

(declare-fun mapIsEmpty!12804 () Bool)

(assert (=> mapIsEmpty!12804 mapRes!12804))

(declare-fun res!193165 () Bool)

(assert (=> start!34826 (=> (not res!193165) (not e!213592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34826 (= res!193165 (validMask!0 mask!2385))))

(assert (=> start!34826 e!213592))

(assert (=> start!34826 true))

(assert (=> start!34826 tp_is_empty!7563))

(assert (=> start!34826 tp!26399))

(declare-fun e!213593 () Bool)

(declare-fun array_inv!6562 (array!18715) Bool)

(assert (=> start!34826 (and (array_inv!6562 _values!1525) e!213593)))

(declare-fun array_inv!6563 (array!18713) Bool)

(assert (=> start!34826 (array_inv!6563 _keys!1895)))

(declare-fun b!348648 () Bool)

(declare-fun res!193162 () Bool)

(assert (=> b!348648 (=> (not res!193162) (not e!213592))))

(declare-fun zeroValue!1467 () V!11061)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11061)

(declare-datatypes ((tuple2!5532 0))(
  ( (tuple2!5533 (_1!2777 (_ BitVec 64)) (_2!2777 V!11061)) )
))
(declare-datatypes ((List!5153 0))(
  ( (Nil!5150) (Cons!5149 (h!6005 tuple2!5532) (t!10283 List!5153)) )
))
(declare-datatypes ((ListLongMap!4445 0))(
  ( (ListLongMap!4446 (toList!2238 List!5153)) )
))
(declare-fun contains!2303 (ListLongMap!4445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1759 (array!18713 array!18715 (_ BitVec 32) (_ BitVec 32) V!11061 V!11061 (_ BitVec 32) Int) ListLongMap!4445)

(assert (=> b!348648 (= res!193162 (not (contains!2303 (getCurrentListMap!1759 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348649 () Bool)

(declare-fun e!213596 () Bool)

(assert (=> b!348649 (= e!213593 (and e!213596 mapRes!12804))))

(declare-fun condMapEmpty!12804 () Bool)

(declare-fun mapDefault!12804 () ValueCell!3438)

(assert (=> b!348649 (= condMapEmpty!12804 (= (arr!8867 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3438)) mapDefault!12804)))))

(declare-fun b!348650 () Bool)

(assert (=> b!348650 (= e!213596 tp_is_empty!7563)))

(declare-fun b!348651 () Bool)

(declare-fun res!193161 () Bool)

(assert (=> b!348651 (=> (not res!193161) (not e!213592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348651 (= res!193161 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34826 res!193165) b!348643))

(assert (= (and b!348643 res!193164) b!348642))

(assert (= (and b!348642 res!193167) b!348647))

(assert (= (and b!348647 res!193168) b!348651))

(assert (= (and b!348651 res!193161) b!348648))

(assert (= (and b!348648 res!193162) b!348645))

(assert (= (and b!348645 res!193166) b!348646))

(assert (= (and b!348646 res!193163) b!348641))

(assert (= (and b!348649 condMapEmpty!12804) mapIsEmpty!12804))

(assert (= (and b!348649 (not condMapEmpty!12804)) mapNonEmpty!12804))

(assert (= (and mapNonEmpty!12804 ((_ is ValueCellFull!3438) mapValue!12804)) b!348644))

(assert (= (and b!348649 ((_ is ValueCellFull!3438) mapDefault!12804)) b!348650))

(assert (= start!34826 b!348649))

(declare-fun m!349357 () Bool)

(assert (=> b!348651 m!349357))

(declare-fun m!349359 () Bool)

(assert (=> start!34826 m!349359))

(declare-fun m!349361 () Bool)

(assert (=> start!34826 m!349361))

(declare-fun m!349363 () Bool)

(assert (=> start!34826 m!349363))

(declare-fun m!349365 () Bool)

(assert (=> b!348648 m!349365))

(assert (=> b!348648 m!349365))

(declare-fun m!349367 () Bool)

(assert (=> b!348648 m!349367))

(declare-fun m!349369 () Bool)

(assert (=> mapNonEmpty!12804 m!349369))

(declare-fun m!349371 () Bool)

(assert (=> b!348646 m!349371))

(declare-fun m!349373 () Bool)

(assert (=> b!348642 m!349373))

(declare-fun m!349375 () Bool)

(assert (=> b!348641 m!349375))

(declare-fun m!349377 () Bool)

(assert (=> b!348645 m!349377))

(declare-fun m!349379 () Bool)

(assert (=> b!348647 m!349379))

(check-sat (not b!348645) (not b_next!7611) (not b!348647) (not mapNonEmpty!12804) tp_is_empty!7563 (not b!348641) (not start!34826) (not b!348646) b_and!14833 (not b!348651) (not b!348642) (not b!348648))
(check-sat b_and!14833 (not b_next!7611))
