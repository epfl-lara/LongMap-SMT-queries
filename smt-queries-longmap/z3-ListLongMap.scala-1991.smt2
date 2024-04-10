; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34832 () Bool)

(assert start!34832)

(declare-fun b_free!7617 () Bool)

(declare-fun b_next!7617 () Bool)

(assert (=> start!34832 (= b_free!7617 (not b_next!7617))))

(declare-fun tp!26418 () Bool)

(declare-fun b_and!14839 () Bool)

(assert (=> start!34832 (= tp!26418 b_and!14839)))

(declare-fun b!348740 () Bool)

(declare-fun e!213648 () Bool)

(declare-fun e!213646 () Bool)

(assert (=> b!348740 (= e!213648 e!213646)))

(declare-fun res!193233 () Bool)

(assert (=> b!348740 (=> (not res!193233) (not e!213646))))

(declare-datatypes ((SeekEntryResult!3421 0))(
  ( (MissingZero!3421 (index!15863 (_ BitVec 32))) (Found!3421 (index!15864 (_ BitVec 32))) (Intermediate!3421 (undefined!4233 Bool) (index!15865 (_ BitVec 32)) (x!34741 (_ BitVec 32))) (Undefined!3421) (MissingVacant!3421 (index!15866 (_ BitVec 32))) )
))
(declare-fun lt!163932 () SeekEntryResult!3421)

(get-info :version)

(assert (=> b!348740 (= res!193233 (and (not ((_ is Found!3421) lt!163932)) ((_ is MissingZero!3421) lt!163932)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18725 0))(
  ( (array!18726 (arr!8872 (Array (_ BitVec 32) (_ BitVec 64))) (size!9224 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18725)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18725 (_ BitVec 32)) SeekEntryResult!3421)

(assert (=> b!348740 (= lt!163932 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348741 () Bool)

(declare-fun e!213647 () Bool)

(declare-fun tp_is_empty!7569 () Bool)

(assert (=> b!348741 (= e!213647 tp_is_empty!7569)))

(declare-fun b!348742 () Bool)

(declare-fun e!213649 () Bool)

(declare-fun mapRes!12813 () Bool)

(assert (=> b!348742 (= e!213649 (and e!213647 mapRes!12813))))

(declare-fun condMapEmpty!12813 () Bool)

(declare-datatypes ((V!11069 0))(
  ( (V!11070 (val!3829 Int)) )
))
(declare-datatypes ((ValueCell!3441 0))(
  ( (ValueCellFull!3441 (v!6012 V!11069)) (EmptyCell!3441) )
))
(declare-datatypes ((array!18727 0))(
  ( (array!18728 (arr!8873 (Array (_ BitVec 32) ValueCell!3441)) (size!9225 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18727)

(declare-fun mapDefault!12813 () ValueCell!3441)

(assert (=> b!348742 (= condMapEmpty!12813 (= (arr!8873 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3441)) mapDefault!12813)))))

(declare-fun b!348743 () Bool)

(declare-fun res!193240 () Bool)

(assert (=> b!348743 (=> (not res!193240) (not e!213648))))

(declare-datatypes ((List!5156 0))(
  ( (Nil!5153) (Cons!5152 (h!6008 (_ BitVec 64)) (t!10286 List!5156)) )
))
(declare-fun arrayNoDuplicates!0 (array!18725 (_ BitVec 32) List!5156) Bool)

(assert (=> b!348743 (= res!193240 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5153))))

(declare-fun b!348744 () Bool)

(declare-fun res!193235 () Bool)

(assert (=> b!348744 (=> (not res!193235) (not e!213648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18725 (_ BitVec 32)) Bool)

(assert (=> b!348744 (= res!193235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348745 () Bool)

(declare-fun res!193234 () Bool)

(assert (=> b!348745 (=> (not res!193234) (not e!213646))))

(declare-fun arrayContainsKey!0 (array!18725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348745 (= res!193234 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348746 () Bool)

(assert (=> b!348746 (= e!213646 false)))

(declare-fun lt!163933 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18725 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348746 (= lt!163933 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12813 () Bool)

(assert (=> mapIsEmpty!12813 mapRes!12813))

(declare-fun b!348747 () Bool)

(declare-fun res!193236 () Bool)

(assert (=> b!348747 (=> (not res!193236) (not e!213648))))

(declare-fun zeroValue!1467 () V!11069)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11069)

(declare-datatypes ((tuple2!5534 0))(
  ( (tuple2!5535 (_1!2778 (_ BitVec 64)) (_2!2778 V!11069)) )
))
(declare-datatypes ((List!5157 0))(
  ( (Nil!5154) (Cons!5153 (h!6009 tuple2!5534) (t!10287 List!5157)) )
))
(declare-datatypes ((ListLongMap!4447 0))(
  ( (ListLongMap!4448 (toList!2239 List!5157)) )
))
(declare-fun contains!2304 (ListLongMap!4447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1760 (array!18725 array!18727 (_ BitVec 32) (_ BitVec 32) V!11069 V!11069 (_ BitVec 32) Int) ListLongMap!4447)

(assert (=> b!348747 (= res!193236 (not (contains!2304 (getCurrentListMap!1760 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348748 () Bool)

(declare-fun res!193237 () Bool)

(assert (=> b!348748 (=> (not res!193237) (not e!213648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348748 (= res!193237 (validKeyInArray!0 k0!1348))))

(declare-fun b!348749 () Bool)

(declare-fun res!193238 () Bool)

(assert (=> b!348749 (=> (not res!193238) (not e!213648))))

(assert (=> b!348749 (= res!193238 (and (= (size!9225 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9224 _keys!1895) (size!9225 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12813 () Bool)

(declare-fun tp!26417 () Bool)

(declare-fun e!213645 () Bool)

(assert (=> mapNonEmpty!12813 (= mapRes!12813 (and tp!26417 e!213645))))

(declare-fun mapKey!12813 () (_ BitVec 32))

(declare-fun mapValue!12813 () ValueCell!3441)

(declare-fun mapRest!12813 () (Array (_ BitVec 32) ValueCell!3441))

(assert (=> mapNonEmpty!12813 (= (arr!8873 _values!1525) (store mapRest!12813 mapKey!12813 mapValue!12813))))

(declare-fun res!193239 () Bool)

(assert (=> start!34832 (=> (not res!193239) (not e!213648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34832 (= res!193239 (validMask!0 mask!2385))))

(assert (=> start!34832 e!213648))

(assert (=> start!34832 true))

(assert (=> start!34832 tp_is_empty!7569))

(assert (=> start!34832 tp!26418))

(declare-fun array_inv!6564 (array!18727) Bool)

(assert (=> start!34832 (and (array_inv!6564 _values!1525) e!213649)))

(declare-fun array_inv!6565 (array!18725) Bool)

(assert (=> start!34832 (array_inv!6565 _keys!1895)))

(declare-fun b!348750 () Bool)

(assert (=> b!348750 (= e!213645 tp_is_empty!7569)))

(assert (= (and start!34832 res!193239) b!348749))

(assert (= (and b!348749 res!193238) b!348744))

(assert (= (and b!348744 res!193235) b!348743))

(assert (= (and b!348743 res!193240) b!348748))

(assert (= (and b!348748 res!193237) b!348747))

(assert (= (and b!348747 res!193236) b!348740))

(assert (= (and b!348740 res!193233) b!348745))

(assert (= (and b!348745 res!193234) b!348746))

(assert (= (and b!348742 condMapEmpty!12813) mapIsEmpty!12813))

(assert (= (and b!348742 (not condMapEmpty!12813)) mapNonEmpty!12813))

(assert (= (and mapNonEmpty!12813 ((_ is ValueCellFull!3441) mapValue!12813)) b!348750))

(assert (= (and b!348742 ((_ is ValueCellFull!3441) mapDefault!12813)) b!348741))

(assert (= start!34832 b!348742))

(declare-fun m!349429 () Bool)

(assert (=> mapNonEmpty!12813 m!349429))

(declare-fun m!349431 () Bool)

(assert (=> b!348744 m!349431))

(declare-fun m!349433 () Bool)

(assert (=> b!348743 m!349433))

(declare-fun m!349435 () Bool)

(assert (=> b!348747 m!349435))

(assert (=> b!348747 m!349435))

(declare-fun m!349437 () Bool)

(assert (=> b!348747 m!349437))

(declare-fun m!349439 () Bool)

(assert (=> start!34832 m!349439))

(declare-fun m!349441 () Bool)

(assert (=> start!34832 m!349441))

(declare-fun m!349443 () Bool)

(assert (=> start!34832 m!349443))

(declare-fun m!349445 () Bool)

(assert (=> b!348748 m!349445))

(declare-fun m!349447 () Bool)

(assert (=> b!348745 m!349447))

(declare-fun m!349449 () Bool)

(assert (=> b!348740 m!349449))

(declare-fun m!349451 () Bool)

(assert (=> b!348746 m!349451))

(check-sat (not b!348748) (not b!348747) (not b!348746) (not b!348743) (not b_next!7617) b_and!14839 (not b!348744) (not mapNonEmpty!12813) (not b!348745) tp_is_empty!7569 (not start!34832) (not b!348740))
(check-sat b_and!14839 (not b_next!7617))
