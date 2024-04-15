; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34828 () Bool)

(assert start!34828)

(declare-fun b_free!7627 () Bool)

(declare-fun b_next!7627 () Bool)

(assert (=> start!34828 (= b_free!7627 (not b_next!7627))))

(declare-fun tp!26448 () Bool)

(declare-fun b_and!14823 () Bool)

(assert (=> start!34828 (= tp!26448 b_and!14823)))

(declare-fun b!348630 () Bool)

(declare-fun res!193228 () Bool)

(declare-fun e!213560 () Bool)

(assert (=> b!348630 (=> (not res!193228) (not e!213560))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11083 0))(
  ( (V!11084 (val!3834 Int)) )
))
(declare-datatypes ((ValueCell!3446 0))(
  ( (ValueCellFull!3446 (v!6011 V!11083)) (EmptyCell!3446) )
))
(declare-datatypes ((array!18723 0))(
  ( (array!18724 (arr!8871 (Array (_ BitVec 32) ValueCell!3446)) (size!9224 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18723)

(declare-datatypes ((array!18725 0))(
  ( (array!18726 (arr!8872 (Array (_ BitVec 32) (_ BitVec 64))) (size!9225 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18725)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348630 (= res!193228 (and (= (size!9224 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9225 _keys!1895) (size!9224 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348631 () Bool)

(declare-fun res!193227 () Bool)

(assert (=> b!348631 (=> (not res!193227) (not e!213560))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348631 (= res!193227 (validKeyInArray!0 k0!1348))))

(declare-fun b!348632 () Bool)

(declare-fun res!193229 () Bool)

(declare-fun e!213559 () Bool)

(assert (=> b!348632 (=> (not res!193229) (not e!213559))))

(declare-fun arrayContainsKey!0 (array!18725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348632 (= res!193229 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12828 () Bool)

(declare-fun mapRes!12828 () Bool)

(declare-fun tp!26447 () Bool)

(declare-fun e!213562 () Bool)

(assert (=> mapNonEmpty!12828 (= mapRes!12828 (and tp!26447 e!213562))))

(declare-fun mapKey!12828 () (_ BitVec 32))

(declare-fun mapValue!12828 () ValueCell!3446)

(declare-fun mapRest!12828 () (Array (_ BitVec 32) ValueCell!3446))

(assert (=> mapNonEmpty!12828 (= (arr!8871 _values!1525) (store mapRest!12828 mapKey!12828 mapValue!12828))))

(declare-fun b!348633 () Bool)

(declare-fun res!193231 () Bool)

(assert (=> b!348633 (=> (not res!193231) (not e!213560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18725 (_ BitVec 32)) Bool)

(assert (=> b!348633 (= res!193231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348634 () Bool)

(declare-fun tp_is_empty!7579 () Bool)

(assert (=> b!348634 (= e!213562 tp_is_empty!7579)))

(declare-fun b!348635 () Bool)

(declare-fun res!193226 () Bool)

(assert (=> b!348635 (=> (not res!193226) (not e!213560))))

(declare-fun zeroValue!1467 () V!11083)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11083)

(declare-datatypes ((tuple2!5506 0))(
  ( (tuple2!5507 (_1!2764 (_ BitVec 64)) (_2!2764 V!11083)) )
))
(declare-datatypes ((List!5120 0))(
  ( (Nil!5117) (Cons!5116 (h!5972 tuple2!5506) (t!10241 List!5120)) )
))
(declare-datatypes ((ListLongMap!4409 0))(
  ( (ListLongMap!4410 (toList!2220 List!5120)) )
))
(declare-fun contains!2296 (ListLongMap!4409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1725 (array!18725 array!18723 (_ BitVec 32) (_ BitVec 32) V!11083 V!11083 (_ BitVec 32) Int) ListLongMap!4409)

(assert (=> b!348635 (= res!193226 (not (contains!2296 (getCurrentListMap!1725 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!193224 () Bool)

(assert (=> start!34828 (=> (not res!193224) (not e!213560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34828 (= res!193224 (validMask!0 mask!2385))))

(assert (=> start!34828 e!213560))

(assert (=> start!34828 true))

(assert (=> start!34828 tp_is_empty!7579))

(assert (=> start!34828 tp!26448))

(declare-fun e!213564 () Bool)

(declare-fun array_inv!6584 (array!18723) Bool)

(assert (=> start!34828 (and (array_inv!6584 _values!1525) e!213564)))

(declare-fun array_inv!6585 (array!18725) Bool)

(assert (=> start!34828 (array_inv!6585 _keys!1895)))

(declare-fun b!348636 () Bool)

(assert (=> b!348636 (= e!213560 e!213559)))

(declare-fun res!193225 () Bool)

(assert (=> b!348636 (=> (not res!193225) (not e!213559))))

(declare-datatypes ((SeekEntryResult!3419 0))(
  ( (MissingZero!3419 (index!15855 (_ BitVec 32))) (Found!3419 (index!15856 (_ BitVec 32))) (Intermediate!3419 (undefined!4231 Bool) (index!15857 (_ BitVec 32)) (x!34750 (_ BitVec 32))) (Undefined!3419) (MissingVacant!3419 (index!15858 (_ BitVec 32))) )
))
(declare-fun lt!163727 () SeekEntryResult!3419)

(get-info :version)

(assert (=> b!348636 (= res!193225 (and (not ((_ is Found!3419) lt!163727)) ((_ is MissingZero!3419) lt!163727)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18725 (_ BitVec 32)) SeekEntryResult!3419)

(assert (=> b!348636 (= lt!163727 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12828 () Bool)

(assert (=> mapIsEmpty!12828 mapRes!12828))

(declare-fun b!348637 () Bool)

(declare-fun e!213561 () Bool)

(assert (=> b!348637 (= e!213564 (and e!213561 mapRes!12828))))

(declare-fun condMapEmpty!12828 () Bool)

(declare-fun mapDefault!12828 () ValueCell!3446)

(assert (=> b!348637 (= condMapEmpty!12828 (= (arr!8871 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3446)) mapDefault!12828)))))

(declare-fun b!348638 () Bool)

(assert (=> b!348638 (= e!213561 tp_is_empty!7579)))

(declare-fun b!348639 () Bool)

(declare-fun res!193230 () Bool)

(assert (=> b!348639 (=> (not res!193230) (not e!213560))))

(declare-datatypes ((List!5121 0))(
  ( (Nil!5118) (Cons!5117 (h!5973 (_ BitVec 64)) (t!10242 List!5121)) )
))
(declare-fun arrayNoDuplicates!0 (array!18725 (_ BitVec 32) List!5121) Bool)

(assert (=> b!348639 (= res!193230 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5118))))

(declare-fun b!348640 () Bool)

(assert (=> b!348640 (= e!213559 false)))

(declare-fun lt!163728 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18725 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348640 (= lt!163728 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34828 res!193224) b!348630))

(assert (= (and b!348630 res!193228) b!348633))

(assert (= (and b!348633 res!193231) b!348639))

(assert (= (and b!348639 res!193230) b!348631))

(assert (= (and b!348631 res!193227) b!348635))

(assert (= (and b!348635 res!193226) b!348636))

(assert (= (and b!348636 res!193225) b!348632))

(assert (= (and b!348632 res!193229) b!348640))

(assert (= (and b!348637 condMapEmpty!12828) mapIsEmpty!12828))

(assert (= (and b!348637 (not condMapEmpty!12828)) mapNonEmpty!12828))

(assert (= (and mapNonEmpty!12828 ((_ is ValueCellFull!3446) mapValue!12828)) b!348634))

(assert (= (and b!348637 ((_ is ValueCellFull!3446) mapDefault!12828)) b!348638))

(assert (= start!34828 b!348637))

(declare-fun m!348819 () Bool)

(assert (=> b!348633 m!348819))

(declare-fun m!348821 () Bool)

(assert (=> mapNonEmpty!12828 m!348821))

(declare-fun m!348823 () Bool)

(assert (=> b!348639 m!348823))

(declare-fun m!348825 () Bool)

(assert (=> b!348631 m!348825))

(declare-fun m!348827 () Bool)

(assert (=> b!348632 m!348827))

(declare-fun m!348829 () Bool)

(assert (=> start!34828 m!348829))

(declare-fun m!348831 () Bool)

(assert (=> start!34828 m!348831))

(declare-fun m!348833 () Bool)

(assert (=> start!34828 m!348833))

(declare-fun m!348835 () Bool)

(assert (=> b!348636 m!348835))

(declare-fun m!348837 () Bool)

(assert (=> b!348640 m!348837))

(declare-fun m!348839 () Bool)

(assert (=> b!348635 m!348839))

(assert (=> b!348635 m!348839))

(declare-fun m!348841 () Bool)

(assert (=> b!348635 m!348841))

(check-sat (not b!348632) (not b!348635) (not start!34828) (not b!348636) tp_is_empty!7579 (not b!348633) (not b!348631) (not b_next!7627) (not b!348639) (not mapNonEmpty!12828) (not b!348640) b_and!14823)
(check-sat b_and!14823 (not b_next!7627))
