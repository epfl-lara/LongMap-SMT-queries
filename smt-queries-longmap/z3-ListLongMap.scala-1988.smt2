; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34798 () Bool)

(assert start!34798)

(declare-fun b_free!7597 () Bool)

(declare-fun b_next!7597 () Bool)

(assert (=> start!34798 (= b_free!7597 (not b_next!7597))))

(declare-fun tp!26357 () Bool)

(declare-fun b_and!14793 () Bool)

(assert (=> start!34798 (= tp!26357 b_and!14793)))

(declare-fun b!348135 () Bool)

(declare-fun e!213292 () Bool)

(declare-fun e!213290 () Bool)

(assert (=> b!348135 (= e!213292 e!213290)))

(declare-fun res!192868 () Bool)

(assert (=> b!348135 (=> (not res!192868) (not e!213290))))

(declare-datatypes ((SeekEntryResult!3408 0))(
  ( (MissingZero!3408 (index!15811 (_ BitVec 32))) (Found!3408 (index!15812 (_ BitVec 32))) (Intermediate!3408 (undefined!4220 Bool) (index!15813 (_ BitVec 32)) (x!34699 (_ BitVec 32))) (Undefined!3408) (MissingVacant!3408 (index!15814 (_ BitVec 32))) )
))
(declare-fun lt!163638 () SeekEntryResult!3408)

(get-info :version)

(assert (=> b!348135 (= res!192868 (and (not ((_ is Found!3408) lt!163638)) ((_ is MissingZero!3408) lt!163638)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18667 0))(
  ( (array!18668 (arr!8843 (Array (_ BitVec 32) (_ BitVec 64))) (size!9196 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18667)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18667 (_ BitVec 32)) SeekEntryResult!3408)

(assert (=> b!348135 (= lt!163638 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348136 () Bool)

(declare-fun e!213294 () Bool)

(declare-fun tp_is_empty!7549 () Bool)

(assert (=> b!348136 (= e!213294 tp_is_empty!7549)))

(declare-fun b!348137 () Bool)

(declare-fun res!192866 () Bool)

(assert (=> b!348137 (=> (not res!192866) (not e!213290))))

(declare-fun arrayContainsKey!0 (array!18667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348137 (= res!192866 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348138 () Bool)

(declare-fun res!192864 () Bool)

(assert (=> b!348138 (=> (not res!192864) (not e!213292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348138 (= res!192864 (validKeyInArray!0 k0!1348))))

(declare-fun b!348139 () Bool)

(declare-fun res!192869 () Bool)

(assert (=> b!348139 (=> (not res!192869) (not e!213292))))

(declare-datatypes ((V!11043 0))(
  ( (V!11044 (val!3819 Int)) )
))
(declare-datatypes ((ValueCell!3431 0))(
  ( (ValueCellFull!3431 (v!5996 V!11043)) (EmptyCell!3431) )
))
(declare-datatypes ((array!18669 0))(
  ( (array!18670 (arr!8844 (Array (_ BitVec 32) ValueCell!3431)) (size!9197 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18669)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348139 (= res!192869 (and (= (size!9197 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9196 _keys!1895) (size!9197 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348140 () Bool)

(assert (=> b!348140 (= e!213290 false)))

(declare-fun lt!163637 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348140 (= lt!163637 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12783 () Bool)

(declare-fun mapRes!12783 () Bool)

(assert (=> mapIsEmpty!12783 mapRes!12783))

(declare-fun b!348141 () Bool)

(declare-fun res!192867 () Bool)

(assert (=> b!348141 (=> (not res!192867) (not e!213292))))

(declare-fun zeroValue!1467 () V!11043)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11043)

(declare-datatypes ((tuple2!5482 0))(
  ( (tuple2!5483 (_1!2752 (_ BitVec 64)) (_2!2752 V!11043)) )
))
(declare-datatypes ((List!5099 0))(
  ( (Nil!5096) (Cons!5095 (h!5951 tuple2!5482) (t!10220 List!5099)) )
))
(declare-datatypes ((ListLongMap!4385 0))(
  ( (ListLongMap!4386 (toList!2208 List!5099)) )
))
(declare-fun contains!2284 (ListLongMap!4385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1713 (array!18667 array!18669 (_ BitVec 32) (_ BitVec 32) V!11043 V!11043 (_ BitVec 32) Int) ListLongMap!4385)

(assert (=> b!348141 (= res!192867 (not (contains!2284 (getCurrentListMap!1713 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!192870 () Bool)

(assert (=> start!34798 (=> (not res!192870) (not e!213292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34798 (= res!192870 (validMask!0 mask!2385))))

(assert (=> start!34798 e!213292))

(assert (=> start!34798 true))

(assert (=> start!34798 tp_is_empty!7549))

(assert (=> start!34798 tp!26357))

(declare-fun e!213289 () Bool)

(declare-fun array_inv!6564 (array!18669) Bool)

(assert (=> start!34798 (and (array_inv!6564 _values!1525) e!213289)))

(declare-fun array_inv!6565 (array!18667) Bool)

(assert (=> start!34798 (array_inv!6565 _keys!1895)))

(declare-fun b!348142 () Bool)

(declare-fun res!192871 () Bool)

(assert (=> b!348142 (=> (not res!192871) (not e!213292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18667 (_ BitVec 32)) Bool)

(assert (=> b!348142 (= res!192871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348143 () Bool)

(declare-fun e!213291 () Bool)

(assert (=> b!348143 (= e!213289 (and e!213291 mapRes!12783))))

(declare-fun condMapEmpty!12783 () Bool)

(declare-fun mapDefault!12783 () ValueCell!3431)

(assert (=> b!348143 (= condMapEmpty!12783 (= (arr!8844 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3431)) mapDefault!12783)))))

(declare-fun b!348144 () Bool)

(assert (=> b!348144 (= e!213291 tp_is_empty!7549)))

(declare-fun mapNonEmpty!12783 () Bool)

(declare-fun tp!26358 () Bool)

(assert (=> mapNonEmpty!12783 (= mapRes!12783 (and tp!26358 e!213294))))

(declare-fun mapValue!12783 () ValueCell!3431)

(declare-fun mapRest!12783 () (Array (_ BitVec 32) ValueCell!3431))

(declare-fun mapKey!12783 () (_ BitVec 32))

(assert (=> mapNonEmpty!12783 (= (arr!8844 _values!1525) (store mapRest!12783 mapKey!12783 mapValue!12783))))

(declare-fun b!348145 () Bool)

(declare-fun res!192865 () Bool)

(assert (=> b!348145 (=> (not res!192865) (not e!213292))))

(declare-datatypes ((List!5100 0))(
  ( (Nil!5097) (Cons!5096 (h!5952 (_ BitVec 64)) (t!10221 List!5100)) )
))
(declare-fun arrayNoDuplicates!0 (array!18667 (_ BitVec 32) List!5100) Bool)

(assert (=> b!348145 (= res!192865 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5097))))

(assert (= (and start!34798 res!192870) b!348139))

(assert (= (and b!348139 res!192869) b!348142))

(assert (= (and b!348142 res!192871) b!348145))

(assert (= (and b!348145 res!192865) b!348138))

(assert (= (and b!348138 res!192864) b!348141))

(assert (= (and b!348141 res!192867) b!348135))

(assert (= (and b!348135 res!192868) b!348137))

(assert (= (and b!348137 res!192866) b!348140))

(assert (= (and b!348143 condMapEmpty!12783) mapIsEmpty!12783))

(assert (= (and b!348143 (not condMapEmpty!12783)) mapNonEmpty!12783))

(assert (= (and mapNonEmpty!12783 ((_ is ValueCellFull!3431) mapValue!12783)) b!348136))

(assert (= (and b!348143 ((_ is ValueCellFull!3431) mapDefault!12783)) b!348144))

(assert (= start!34798 b!348143))

(declare-fun m!348459 () Bool)

(assert (=> b!348141 m!348459))

(assert (=> b!348141 m!348459))

(declare-fun m!348461 () Bool)

(assert (=> b!348141 m!348461))

(declare-fun m!348463 () Bool)

(assert (=> b!348135 m!348463))

(declare-fun m!348465 () Bool)

(assert (=> b!348145 m!348465))

(declare-fun m!348467 () Bool)

(assert (=> mapNonEmpty!12783 m!348467))

(declare-fun m!348469 () Bool)

(assert (=> b!348138 m!348469))

(declare-fun m!348471 () Bool)

(assert (=> b!348140 m!348471))

(declare-fun m!348473 () Bool)

(assert (=> b!348137 m!348473))

(declare-fun m!348475 () Bool)

(assert (=> start!34798 m!348475))

(declare-fun m!348477 () Bool)

(assert (=> start!34798 m!348477))

(declare-fun m!348479 () Bool)

(assert (=> start!34798 m!348479))

(declare-fun m!348481 () Bool)

(assert (=> b!348142 m!348481))

(check-sat (not b!348140) (not b!348145) tp_is_empty!7549 (not b!348137) (not b!348138) (not b!348135) (not mapNonEmpty!12783) (not start!34798) b_and!14793 (not b_next!7597) (not b!348142) (not b!348141))
(check-sat b_and!14793 (not b_next!7597))
