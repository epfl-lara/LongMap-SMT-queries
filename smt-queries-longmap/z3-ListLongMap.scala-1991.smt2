; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34816 () Bool)

(assert start!34816)

(declare-fun b_free!7615 () Bool)

(declare-fun b_next!7615 () Bool)

(assert (=> start!34816 (= b_free!7615 (not b_next!7615))))

(declare-fun tp!26412 () Bool)

(declare-fun b_and!14811 () Bool)

(assert (=> start!34816 (= tp!26412 b_and!14811)))

(declare-fun b!348432 () Bool)

(declare-fun res!193083 () Bool)

(declare-fun e!213452 () Bool)

(assert (=> b!348432 (=> (not res!193083) (not e!213452))))

(declare-datatypes ((array!18703 0))(
  ( (array!18704 (arr!8861 (Array (_ BitVec 32) (_ BitVec 64))) (size!9214 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18703)

(declare-datatypes ((List!5115 0))(
  ( (Nil!5112) (Cons!5111 (h!5967 (_ BitVec 64)) (t!10236 List!5115)) )
))
(declare-fun arrayNoDuplicates!0 (array!18703 (_ BitVec 32) List!5115) Bool)

(assert (=> b!348432 (= res!193083 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5112))))

(declare-fun b!348433 () Bool)

(declare-fun res!193080 () Bool)

(assert (=> b!348433 (=> (not res!193080) (not e!213452))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11067 0))(
  ( (V!11068 (val!3828 Int)) )
))
(declare-datatypes ((ValueCell!3440 0))(
  ( (ValueCellFull!3440 (v!6005 V!11067)) (EmptyCell!3440) )
))
(declare-datatypes ((array!18705 0))(
  ( (array!18706 (arr!8862 (Array (_ BitVec 32) ValueCell!3440)) (size!9215 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18705)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348433 (= res!193080 (and (= (size!9215 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9214 _keys!1895) (size!9215 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348434 () Bool)

(declare-fun e!213456 () Bool)

(assert (=> b!348434 (= e!213452 e!213456)))

(declare-fun res!193082 () Bool)

(assert (=> b!348434 (=> (not res!193082) (not e!213456))))

(declare-datatypes ((SeekEntryResult!3416 0))(
  ( (MissingZero!3416 (index!15843 (_ BitVec 32))) (Found!3416 (index!15844 (_ BitVec 32))) (Intermediate!3416 (undefined!4228 Bool) (index!15845 (_ BitVec 32)) (x!34731 (_ BitVec 32))) (Undefined!3416) (MissingVacant!3416 (index!15846 (_ BitVec 32))) )
))
(declare-fun lt!163691 () SeekEntryResult!3416)

(get-info :version)

(assert (=> b!348434 (= res!193082 (and (not ((_ is Found!3416) lt!163691)) ((_ is MissingZero!3416) lt!163691)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18703 (_ BitVec 32)) SeekEntryResult!3416)

(assert (=> b!348434 (= lt!163691 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348435 () Bool)

(declare-fun res!193081 () Bool)

(assert (=> b!348435 (=> (not res!193081) (not e!213452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348435 (= res!193081 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12810 () Bool)

(declare-fun mapRes!12810 () Bool)

(declare-fun tp!26411 () Bool)

(declare-fun e!213453 () Bool)

(assert (=> mapNonEmpty!12810 (= mapRes!12810 (and tp!26411 e!213453))))

(declare-fun mapValue!12810 () ValueCell!3440)

(declare-fun mapRest!12810 () (Array (_ BitVec 32) ValueCell!3440))

(declare-fun mapKey!12810 () (_ BitVec 32))

(assert (=> mapNonEmpty!12810 (= (arr!8862 _values!1525) (store mapRest!12810 mapKey!12810 mapValue!12810))))

(declare-fun b!348436 () Bool)

(declare-fun res!193084 () Bool)

(assert (=> b!348436 (=> (not res!193084) (not e!213452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18703 (_ BitVec 32)) Bool)

(assert (=> b!348436 (= res!193084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348437 () Bool)

(declare-fun res!193085 () Bool)

(assert (=> b!348437 (=> (not res!193085) (not e!213452))))

(declare-fun zeroValue!1467 () V!11067)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11067)

(declare-datatypes ((tuple2!5500 0))(
  ( (tuple2!5501 (_1!2761 (_ BitVec 64)) (_2!2761 V!11067)) )
))
(declare-datatypes ((List!5116 0))(
  ( (Nil!5113) (Cons!5112 (h!5968 tuple2!5500) (t!10237 List!5116)) )
))
(declare-datatypes ((ListLongMap!4403 0))(
  ( (ListLongMap!4404 (toList!2217 List!5116)) )
))
(declare-fun contains!2293 (ListLongMap!4403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1722 (array!18703 array!18705 (_ BitVec 32) (_ BitVec 32) V!11067 V!11067 (_ BitVec 32) Int) ListLongMap!4403)

(assert (=> b!348437 (= res!193085 (not (contains!2293 (getCurrentListMap!1722 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348439 () Bool)

(assert (=> b!348439 (= e!213456 false)))

(declare-fun lt!163692 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18703 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348439 (= lt!163692 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348438 () Bool)

(declare-fun res!193086 () Bool)

(assert (=> b!348438 (=> (not res!193086) (not e!213456))))

(declare-fun arrayContainsKey!0 (array!18703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348438 (= res!193086 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!193087 () Bool)

(assert (=> start!34816 (=> (not res!193087) (not e!213452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34816 (= res!193087 (validMask!0 mask!2385))))

(assert (=> start!34816 e!213452))

(assert (=> start!34816 true))

(declare-fun tp_is_empty!7567 () Bool)

(assert (=> start!34816 tp_is_empty!7567))

(assert (=> start!34816 tp!26412))

(declare-fun e!213454 () Bool)

(declare-fun array_inv!6578 (array!18705) Bool)

(assert (=> start!34816 (and (array_inv!6578 _values!1525) e!213454)))

(declare-fun array_inv!6579 (array!18703) Bool)

(assert (=> start!34816 (array_inv!6579 _keys!1895)))

(declare-fun b!348440 () Bool)

(declare-fun e!213455 () Bool)

(assert (=> b!348440 (= e!213454 (and e!213455 mapRes!12810))))

(declare-fun condMapEmpty!12810 () Bool)

(declare-fun mapDefault!12810 () ValueCell!3440)

(assert (=> b!348440 (= condMapEmpty!12810 (= (arr!8862 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3440)) mapDefault!12810)))))

(declare-fun b!348441 () Bool)

(assert (=> b!348441 (= e!213453 tp_is_empty!7567)))

(declare-fun b!348442 () Bool)

(assert (=> b!348442 (= e!213455 tp_is_empty!7567)))

(declare-fun mapIsEmpty!12810 () Bool)

(assert (=> mapIsEmpty!12810 mapRes!12810))

(assert (= (and start!34816 res!193087) b!348433))

(assert (= (and b!348433 res!193080) b!348436))

(assert (= (and b!348436 res!193084) b!348432))

(assert (= (and b!348432 res!193083) b!348435))

(assert (= (and b!348435 res!193081) b!348437))

(assert (= (and b!348437 res!193085) b!348434))

(assert (= (and b!348434 res!193082) b!348438))

(assert (= (and b!348438 res!193086) b!348439))

(assert (= (and b!348440 condMapEmpty!12810) mapIsEmpty!12810))

(assert (= (and b!348440 (not condMapEmpty!12810)) mapNonEmpty!12810))

(assert (= (and mapNonEmpty!12810 ((_ is ValueCellFull!3440) mapValue!12810)) b!348441))

(assert (= (and b!348440 ((_ is ValueCellFull!3440) mapDefault!12810)) b!348442))

(assert (= start!34816 b!348440))

(declare-fun m!348675 () Bool)

(assert (=> b!348436 m!348675))

(declare-fun m!348677 () Bool)

(assert (=> b!348438 m!348677))

(declare-fun m!348679 () Bool)

(assert (=> b!348434 m!348679))

(declare-fun m!348681 () Bool)

(assert (=> b!348437 m!348681))

(assert (=> b!348437 m!348681))

(declare-fun m!348683 () Bool)

(assert (=> b!348437 m!348683))

(declare-fun m!348685 () Bool)

(assert (=> mapNonEmpty!12810 m!348685))

(declare-fun m!348687 () Bool)

(assert (=> start!34816 m!348687))

(declare-fun m!348689 () Bool)

(assert (=> start!34816 m!348689))

(declare-fun m!348691 () Bool)

(assert (=> start!34816 m!348691))

(declare-fun m!348693 () Bool)

(assert (=> b!348435 m!348693))

(declare-fun m!348695 () Bool)

(assert (=> b!348432 m!348695))

(declare-fun m!348697 () Bool)

(assert (=> b!348439 m!348697))

(check-sat (not b!348435) (not mapNonEmpty!12810) (not b!348439) (not b!348437) tp_is_empty!7567 b_and!14811 (not b!348436) (not b!348438) (not b!348432) (not b!348434) (not b_next!7615) (not start!34816))
(check-sat b_and!14811 (not b_next!7615))
