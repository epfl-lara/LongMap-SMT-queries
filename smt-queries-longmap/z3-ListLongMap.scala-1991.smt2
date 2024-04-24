; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34816 () Bool)

(assert start!34816)

(declare-fun b_free!7615 () Bool)

(declare-fun b_next!7615 () Bool)

(assert (=> start!34816 (= b_free!7615 (not b_next!7615))))

(declare-fun tp!26412 () Bool)

(declare-fun b_and!14851 () Bool)

(assert (=> start!34816 (= tp!26412 b_and!14851)))

(declare-fun b!348654 () Bool)

(declare-fun res!193213 () Bool)

(declare-fun e!213596 () Bool)

(assert (=> b!348654 (=> (not res!193213) (not e!213596))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11067 0))(
  ( (V!11068 (val!3828 Int)) )
))
(declare-fun zeroValue!1467 () V!11067)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18706 0))(
  ( (array!18707 (arr!8862 (Array (_ BitVec 32) (_ BitVec 64))) (size!9214 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18706)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11067)

(declare-datatypes ((ValueCell!3440 0))(
  ( (ValueCellFull!3440 (v!6012 V!11067)) (EmptyCell!3440) )
))
(declare-datatypes ((array!18708 0))(
  ( (array!18709 (arr!8863 (Array (_ BitVec 32) ValueCell!3440)) (size!9215 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18708)

(declare-datatypes ((tuple2!5446 0))(
  ( (tuple2!5447 (_1!2734 (_ BitVec 64)) (_2!2734 V!11067)) )
))
(declare-datatypes ((List!5053 0))(
  ( (Nil!5050) (Cons!5049 (h!5905 tuple2!5446) (t!10175 List!5053)) )
))
(declare-datatypes ((ListLongMap!4361 0))(
  ( (ListLongMap!4362 (toList!2196 List!5053)) )
))
(declare-fun contains!2280 (ListLongMap!4361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1724 (array!18706 array!18708 (_ BitVec 32) (_ BitVec 32) V!11067 V!11067 (_ BitVec 32) Int) ListLongMap!4361)

(assert (=> b!348654 (= res!193213 (not (contains!2280 (getCurrentListMap!1724 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348655 () Bool)

(declare-fun e!213597 () Bool)

(assert (=> b!348655 (= e!213597 false)))

(declare-fun lt!163945 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18706 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348655 (= lt!163945 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348656 () Bool)

(declare-fun res!193210 () Bool)

(assert (=> b!348656 (=> (not res!193210) (not e!213596))))

(assert (=> b!348656 (= res!193210 (and (= (size!9215 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9214 _keys!1895) (size!9215 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12810 () Bool)

(declare-fun mapRes!12810 () Bool)

(declare-fun tp!26411 () Bool)

(declare-fun e!213593 () Bool)

(assert (=> mapNonEmpty!12810 (= mapRes!12810 (and tp!26411 e!213593))))

(declare-fun mapRest!12810 () (Array (_ BitVec 32) ValueCell!3440))

(declare-fun mapKey!12810 () (_ BitVec 32))

(declare-fun mapValue!12810 () ValueCell!3440)

(assert (=> mapNonEmpty!12810 (= (arr!8863 _values!1525) (store mapRest!12810 mapKey!12810 mapValue!12810))))

(declare-fun res!193208 () Bool)

(assert (=> start!34816 (=> (not res!193208) (not e!213596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34816 (= res!193208 (validMask!0 mask!2385))))

(assert (=> start!34816 e!213596))

(assert (=> start!34816 true))

(declare-fun tp_is_empty!7567 () Bool)

(assert (=> start!34816 tp_is_empty!7567))

(assert (=> start!34816 tp!26412))

(declare-fun e!213595 () Bool)

(declare-fun array_inv!6546 (array!18708) Bool)

(assert (=> start!34816 (and (array_inv!6546 _values!1525) e!213595)))

(declare-fun array_inv!6547 (array!18706) Bool)

(assert (=> start!34816 (array_inv!6547 _keys!1895)))

(declare-fun b!348657 () Bool)

(declare-fun e!213598 () Bool)

(assert (=> b!348657 (= e!213595 (and e!213598 mapRes!12810))))

(declare-fun condMapEmpty!12810 () Bool)

(declare-fun mapDefault!12810 () ValueCell!3440)

(assert (=> b!348657 (= condMapEmpty!12810 (= (arr!8863 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3440)) mapDefault!12810)))))

(declare-fun b!348658 () Bool)

(assert (=> b!348658 (= e!213593 tp_is_empty!7567)))

(declare-fun b!348659 () Bool)

(declare-fun res!193206 () Bool)

(assert (=> b!348659 (=> (not res!193206) (not e!213596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18706 (_ BitVec 32)) Bool)

(assert (=> b!348659 (= res!193206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348660 () Bool)

(assert (=> b!348660 (= e!213596 e!213597)))

(declare-fun res!193212 () Bool)

(assert (=> b!348660 (=> (not res!193212) (not e!213597))))

(declare-datatypes ((SeekEntryResult!3371 0))(
  ( (MissingZero!3371 (index!15663 (_ BitVec 32))) (Found!3371 (index!15664 (_ BitVec 32))) (Intermediate!3371 (undefined!4183 Bool) (index!15665 (_ BitVec 32)) (x!34688 (_ BitVec 32))) (Undefined!3371) (MissingVacant!3371 (index!15666 (_ BitVec 32))) )
))
(declare-fun lt!163944 () SeekEntryResult!3371)

(get-info :version)

(assert (=> b!348660 (= res!193212 (and (not ((_ is Found!3371) lt!163944)) ((_ is MissingZero!3371) lt!163944)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18706 (_ BitVec 32)) SeekEntryResult!3371)

(assert (=> b!348660 (= lt!163944 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12810 () Bool)

(assert (=> mapIsEmpty!12810 mapRes!12810))

(declare-fun b!348661 () Bool)

(declare-fun res!193207 () Bool)

(assert (=> b!348661 (=> (not res!193207) (not e!213596))))

(declare-datatypes ((List!5054 0))(
  ( (Nil!5051) (Cons!5050 (h!5906 (_ BitVec 64)) (t!10176 List!5054)) )
))
(declare-fun arrayNoDuplicates!0 (array!18706 (_ BitVec 32) List!5054) Bool)

(assert (=> b!348661 (= res!193207 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5051))))

(declare-fun b!348662 () Bool)

(declare-fun res!193211 () Bool)

(assert (=> b!348662 (=> (not res!193211) (not e!213597))))

(declare-fun arrayContainsKey!0 (array!18706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348662 (= res!193211 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348663 () Bool)

(assert (=> b!348663 (= e!213598 tp_is_empty!7567)))

(declare-fun b!348664 () Bool)

(declare-fun res!193209 () Bool)

(assert (=> b!348664 (=> (not res!193209) (not e!213596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348664 (= res!193209 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34816 res!193208) b!348656))

(assert (= (and b!348656 res!193210) b!348659))

(assert (= (and b!348659 res!193206) b!348661))

(assert (= (and b!348661 res!193207) b!348664))

(assert (= (and b!348664 res!193209) b!348654))

(assert (= (and b!348654 res!193213) b!348660))

(assert (= (and b!348660 res!193212) b!348662))

(assert (= (and b!348662 res!193211) b!348655))

(assert (= (and b!348657 condMapEmpty!12810) mapIsEmpty!12810))

(assert (= (and b!348657 (not condMapEmpty!12810)) mapNonEmpty!12810))

(assert (= (and mapNonEmpty!12810 ((_ is ValueCellFull!3440) mapValue!12810)) b!348658))

(assert (= (and b!348657 ((_ is ValueCellFull!3440) mapDefault!12810)) b!348663))

(assert (= start!34816 b!348657))

(declare-fun m!349629 () Bool)

(assert (=> b!348654 m!349629))

(assert (=> b!348654 m!349629))

(declare-fun m!349631 () Bool)

(assert (=> b!348654 m!349631))

(declare-fun m!349633 () Bool)

(assert (=> b!348661 m!349633))

(declare-fun m!349635 () Bool)

(assert (=> b!348659 m!349635))

(declare-fun m!349637 () Bool)

(assert (=> b!348664 m!349637))

(declare-fun m!349639 () Bool)

(assert (=> start!34816 m!349639))

(declare-fun m!349641 () Bool)

(assert (=> start!34816 m!349641))

(declare-fun m!349643 () Bool)

(assert (=> start!34816 m!349643))

(declare-fun m!349645 () Bool)

(assert (=> b!348655 m!349645))

(declare-fun m!349647 () Bool)

(assert (=> b!348662 m!349647))

(declare-fun m!349649 () Bool)

(assert (=> mapNonEmpty!12810 m!349649))

(declare-fun m!349651 () Bool)

(assert (=> b!348660 m!349651))

(check-sat (not start!34816) (not mapNonEmpty!12810) (not b_next!7615) (not b!348655) (not b!348661) (not b!348659) (not b!348662) b_and!14851 (not b!348660) (not b!348654) tp_is_empty!7567 (not b!348664))
(check-sat b_and!14851 (not b_next!7615))
