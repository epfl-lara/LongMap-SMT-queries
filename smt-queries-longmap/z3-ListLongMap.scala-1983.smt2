; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34768 () Bool)

(assert start!34768)

(declare-fun b_free!7567 () Bool)

(declare-fun b_next!7567 () Bool)

(assert (=> start!34768 (= b_free!7567 (not b_next!7567))))

(declare-fun tp!26267 () Bool)

(declare-fun b_and!14803 () Bool)

(assert (=> start!34768 (= tp!26267 b_and!14803)))

(declare-fun b!347862 () Bool)

(declare-fun e!213146 () Bool)

(declare-fun e!213151 () Bool)

(assert (=> b!347862 (= e!213146 e!213151)))

(declare-fun res!192633 () Bool)

(assert (=> b!347862 (=> (not res!192633) (not e!213151))))

(declare-datatypes ((SeekEntryResult!3356 0))(
  ( (MissingZero!3356 (index!15603 (_ BitVec 32))) (Found!3356 (index!15604 (_ BitVec 32))) (Intermediate!3356 (undefined!4168 Bool) (index!15605 (_ BitVec 32)) (x!34609 (_ BitVec 32))) (Undefined!3356) (MissingVacant!3356 (index!15606 (_ BitVec 32))) )
))
(declare-fun lt!163770 () SeekEntryResult!3356)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18620 0))(
  ( (array!18621 (arr!8819 (Array (_ BitVec 32) (_ BitVec 64))) (size!9171 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18620)

(get-info :version)

(assert (=> b!347862 (= res!192633 (and ((_ is Found!3356) lt!163770) (= (select (arr!8819 _keys!1895) (index!15604 lt!163770)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18620 (_ BitVec 32)) SeekEntryResult!3356)

(assert (=> b!347862 (= lt!163770 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347863 () Bool)

(declare-fun e!213149 () Bool)

(declare-fun tp_is_empty!7519 () Bool)

(assert (=> b!347863 (= e!213149 tp_is_empty!7519)))

(declare-fun b!347864 () Bool)

(declare-fun res!192636 () Bool)

(declare-fun e!213148 () Bool)

(assert (=> b!347864 (=> (not res!192636) (not e!213148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347864 (= res!192636 (validKeyInArray!0 k0!1348))))

(declare-fun b!347865 () Bool)

(assert (=> b!347865 (= e!213148 e!213146)))

(declare-fun res!192634 () Bool)

(assert (=> b!347865 (=> (not res!192634) (not e!213146))))

(declare-datatypes ((V!11003 0))(
  ( (V!11004 (val!3804 Int)) )
))
(declare-datatypes ((tuple2!5416 0))(
  ( (tuple2!5417 (_1!2719 (_ BitVec 64)) (_2!2719 V!11003)) )
))
(declare-datatypes ((List!5023 0))(
  ( (Nil!5020) (Cons!5019 (h!5875 tuple2!5416) (t!10145 List!5023)) )
))
(declare-datatypes ((ListLongMap!4331 0))(
  ( (ListLongMap!4332 (toList!2181 List!5023)) )
))
(declare-fun lt!163769 () ListLongMap!4331)

(declare-fun contains!2265 (ListLongMap!4331 (_ BitVec 64)) Bool)

(assert (=> b!347865 (= res!192634 (not (contains!2265 lt!163769 k0!1348)))))

(declare-fun zeroValue!1467 () V!11003)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3416 0))(
  ( (ValueCellFull!3416 (v!5988 V!11003)) (EmptyCell!3416) )
))
(declare-datatypes ((array!18622 0))(
  ( (array!18623 (arr!8820 (Array (_ BitVec 32) ValueCell!3416)) (size!9172 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18622)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11003)

(declare-fun getCurrentListMap!1709 (array!18620 array!18622 (_ BitVec 32) (_ BitVec 32) V!11003 V!11003 (_ BitVec 32) Int) ListLongMap!4331)

(assert (=> b!347865 (= lt!163769 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347866 () Bool)

(declare-fun res!192632 () Bool)

(assert (=> b!347866 (=> (not res!192632) (not e!213148))))

(declare-datatypes ((List!5024 0))(
  ( (Nil!5021) (Cons!5020 (h!5876 (_ BitVec 64)) (t!10146 List!5024)) )
))
(declare-fun arrayNoDuplicates!0 (array!18620 (_ BitVec 32) List!5024) Bool)

(assert (=> b!347866 (= res!192632 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5021))))

(declare-fun mapNonEmpty!12738 () Bool)

(declare-fun mapRes!12738 () Bool)

(declare-fun tp!26268 () Bool)

(declare-fun e!213147 () Bool)

(assert (=> mapNonEmpty!12738 (= mapRes!12738 (and tp!26268 e!213147))))

(declare-fun mapKey!12738 () (_ BitVec 32))

(declare-fun mapRest!12738 () (Array (_ BitVec 32) ValueCell!3416))

(declare-fun mapValue!12738 () ValueCell!3416)

(assert (=> mapNonEmpty!12738 (= (arr!8820 _values!1525) (store mapRest!12738 mapKey!12738 mapValue!12738))))

(declare-fun b!347867 () Bool)

(declare-fun res!192637 () Bool)

(assert (=> b!347867 (=> (not res!192637) (not e!213151))))

(declare-fun arrayContainsKey!0 (array!18620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347867 (= res!192637 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15604 lt!163770)))))

(declare-fun b!347868 () Bool)

(declare-fun res!192635 () Bool)

(assert (=> b!347868 (=> (not res!192635) (not e!213148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18620 (_ BitVec 32)) Bool)

(assert (=> b!347868 (= res!192635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347870 () Bool)

(declare-fun e!213145 () Bool)

(assert (=> b!347870 (= e!213145 (and e!213149 mapRes!12738))))

(declare-fun condMapEmpty!12738 () Bool)

(declare-fun mapDefault!12738 () ValueCell!3416)

(assert (=> b!347870 (= condMapEmpty!12738 (= (arr!8820 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3416)) mapDefault!12738)))))

(declare-fun b!347871 () Bool)

(assert (=> b!347871 (= e!213151 (not true))))

(assert (=> b!347871 (contains!2265 lt!163769 (select (arr!8819 _keys!1895) (index!15604 lt!163770)))))

(declare-datatypes ((Unit!10769 0))(
  ( (Unit!10770) )
))
(declare-fun lt!163771 () Unit!10769)

(declare-fun lemmaValidKeyInArrayIsInListMap!174 (array!18620 array!18622 (_ BitVec 32) (_ BitVec 32) V!11003 V!11003 (_ BitVec 32) Int) Unit!10769)

(assert (=> b!347871 (= lt!163771 (lemmaValidKeyInArrayIsInListMap!174 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15604 lt!163770) defaultEntry!1528))))

(assert (=> b!347871 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163768 () Unit!10769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18620 (_ BitVec 64) (_ BitVec 32)) Unit!10769)

(assert (=> b!347871 (= lt!163768 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15604 lt!163770)))))

(declare-fun b!347872 () Bool)

(declare-fun res!192631 () Bool)

(assert (=> b!347872 (=> (not res!192631) (not e!213148))))

(assert (=> b!347872 (= res!192631 (and (= (size!9172 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9171 _keys!1895) (size!9172 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12738 () Bool)

(assert (=> mapIsEmpty!12738 mapRes!12738))

(declare-fun b!347869 () Bool)

(assert (=> b!347869 (= e!213147 tp_is_empty!7519)))

(declare-fun res!192630 () Bool)

(assert (=> start!34768 (=> (not res!192630) (not e!213148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34768 (= res!192630 (validMask!0 mask!2385))))

(assert (=> start!34768 e!213148))

(assert (=> start!34768 true))

(assert (=> start!34768 tp_is_empty!7519))

(assert (=> start!34768 tp!26267))

(declare-fun array_inv!6516 (array!18622) Bool)

(assert (=> start!34768 (and (array_inv!6516 _values!1525) e!213145)))

(declare-fun array_inv!6517 (array!18620) Bool)

(assert (=> start!34768 (array_inv!6517 _keys!1895)))

(assert (= (and start!34768 res!192630) b!347872))

(assert (= (and b!347872 res!192631) b!347868))

(assert (= (and b!347868 res!192635) b!347866))

(assert (= (and b!347866 res!192632) b!347864))

(assert (= (and b!347864 res!192636) b!347865))

(assert (= (and b!347865 res!192634) b!347862))

(assert (= (and b!347862 res!192633) b!347867))

(assert (= (and b!347867 res!192637) b!347871))

(assert (= (and b!347870 condMapEmpty!12738) mapIsEmpty!12738))

(assert (= (and b!347870 (not condMapEmpty!12738)) mapNonEmpty!12738))

(assert (= (and mapNonEmpty!12738 ((_ is ValueCellFull!3416) mapValue!12738)) b!347869))

(assert (= (and b!347870 ((_ is ValueCellFull!3416) mapDefault!12738)) b!347863))

(assert (= start!34768 b!347870))

(declare-fun m!349005 () Bool)

(assert (=> mapNonEmpty!12738 m!349005))

(declare-fun m!349007 () Bool)

(assert (=> b!347866 m!349007))

(declare-fun m!349009 () Bool)

(assert (=> b!347865 m!349009))

(declare-fun m!349011 () Bool)

(assert (=> b!347865 m!349011))

(declare-fun m!349013 () Bool)

(assert (=> start!34768 m!349013))

(declare-fun m!349015 () Bool)

(assert (=> start!34768 m!349015))

(declare-fun m!349017 () Bool)

(assert (=> start!34768 m!349017))

(declare-fun m!349019 () Bool)

(assert (=> b!347868 m!349019))

(declare-fun m!349021 () Bool)

(assert (=> b!347864 m!349021))

(declare-fun m!349023 () Bool)

(assert (=> b!347867 m!349023))

(declare-fun m!349025 () Bool)

(assert (=> b!347871 m!349025))

(declare-fun m!349027 () Bool)

(assert (=> b!347871 m!349027))

(declare-fun m!349029 () Bool)

(assert (=> b!347871 m!349029))

(declare-fun m!349031 () Bool)

(assert (=> b!347871 m!349031))

(assert (=> b!347871 m!349029))

(declare-fun m!349033 () Bool)

(assert (=> b!347871 m!349033))

(assert (=> b!347862 m!349029))

(declare-fun m!349035 () Bool)

(assert (=> b!347862 m!349035))

(check-sat (not start!34768) b_and!14803 (not b!347862) (not b!347868) (not b!347866) (not b!347871) (not b_next!7567) (not b!347865) (not b!347867) (not b!347864) tp_is_empty!7519 (not mapNonEmpty!12738))
(check-sat b_and!14803 (not b_next!7567))
