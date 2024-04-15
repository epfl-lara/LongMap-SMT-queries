; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34762 () Bool)

(assert start!34762)

(declare-fun b_free!7561 () Bool)

(declare-fun b_next!7561 () Bool)

(assert (=> start!34762 (= b_free!7561 (not b_next!7561))))

(declare-fun tp!26249 () Bool)

(declare-fun b_and!14757 () Bool)

(assert (=> start!34762 (= tp!26249 b_and!14757)))

(declare-fun b!347541 () Bool)

(declare-fun e!212941 () Bool)

(declare-fun e!212945 () Bool)

(assert (=> b!347541 (= e!212941 e!212945)))

(declare-fun res!192435 () Bool)

(assert (=> b!347541 (=> (not res!192435) (not e!212945))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18601 0))(
  ( (array!18602 (arr!8810 (Array (_ BitVec 32) (_ BitVec 64))) (size!9163 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18601)

(declare-datatypes ((SeekEntryResult!3396 0))(
  ( (MissingZero!3396 (index!15763 (_ BitVec 32))) (Found!3396 (index!15764 (_ BitVec 32))) (Intermediate!3396 (undefined!4208 Bool) (index!15765 (_ BitVec 32)) (x!34639 (_ BitVec 32))) (Undefined!3396) (MissingVacant!3396 (index!15766 (_ BitVec 32))) )
))
(declare-fun lt!163479 () SeekEntryResult!3396)

(get-info :version)

(assert (=> b!347541 (= res!192435 (and ((_ is Found!3396) lt!163479) (= (select (arr!8810 _keys!1895) (index!15764 lt!163479)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18601 (_ BitVec 32)) SeekEntryResult!3396)

(assert (=> b!347541 (= lt!163479 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347542 () Bool)

(declare-fun e!212946 () Bool)

(declare-fun tp_is_empty!7513 () Bool)

(assert (=> b!347542 (= e!212946 tp_is_empty!7513)))

(declare-fun b!347543 () Bool)

(declare-fun res!192439 () Bool)

(declare-fun e!212942 () Bool)

(assert (=> b!347543 (=> (not res!192439) (not e!212942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347543 (= res!192439 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12729 () Bool)

(declare-fun mapRes!12729 () Bool)

(declare-fun tp!26250 () Bool)

(assert (=> mapNonEmpty!12729 (= mapRes!12729 (and tp!26250 e!212946))))

(declare-datatypes ((V!10995 0))(
  ( (V!10996 (val!3801 Int)) )
))
(declare-datatypes ((ValueCell!3413 0))(
  ( (ValueCellFull!3413 (v!5978 V!10995)) (EmptyCell!3413) )
))
(declare-fun mapRest!12729 () (Array (_ BitVec 32) ValueCell!3413))

(declare-datatypes ((array!18603 0))(
  ( (array!18604 (arr!8811 (Array (_ BitVec 32) ValueCell!3413)) (size!9164 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18603)

(declare-fun mapValue!12729 () ValueCell!3413)

(declare-fun mapKey!12729 () (_ BitVec 32))

(assert (=> mapNonEmpty!12729 (= (arr!8811 _values!1525) (store mapRest!12729 mapKey!12729 mapValue!12729))))

(declare-fun b!347544 () Bool)

(assert (=> b!347544 (= e!212945 (not true))))

(declare-datatypes ((tuple2!5458 0))(
  ( (tuple2!5459 (_1!2740 (_ BitVec 64)) (_2!2740 V!10995)) )
))
(declare-datatypes ((List!5073 0))(
  ( (Nil!5070) (Cons!5069 (h!5925 tuple2!5458) (t!10194 List!5073)) )
))
(declare-datatypes ((ListLongMap!4361 0))(
  ( (ListLongMap!4362 (toList!2196 List!5073)) )
))
(declare-fun lt!163480 () ListLongMap!4361)

(declare-fun contains!2272 (ListLongMap!4361 (_ BitVec 64)) Bool)

(assert (=> b!347544 (contains!2272 lt!163480 (select (arr!8810 _keys!1895) (index!15764 lt!163479)))))

(declare-fun zeroValue!1467 () V!10995)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10995)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((Unit!10782 0))(
  ( (Unit!10783) )
))
(declare-fun lt!163481 () Unit!10782)

(declare-fun lemmaValidKeyInArrayIsInListMap!176 (array!18601 array!18603 (_ BitVec 32) (_ BitVec 32) V!10995 V!10995 (_ BitVec 32) Int) Unit!10782)

(assert (=> b!347544 (= lt!163481 (lemmaValidKeyInArrayIsInListMap!176 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15764 lt!163479) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!18601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347544 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163482 () Unit!10782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18601 (_ BitVec 64) (_ BitVec 32)) Unit!10782)

(assert (=> b!347544 (= lt!163482 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15764 lt!163479)))))

(declare-fun b!347545 () Bool)

(declare-fun res!192436 () Bool)

(assert (=> b!347545 (=> (not res!192436) (not e!212942))))

(declare-datatypes ((List!5074 0))(
  ( (Nil!5071) (Cons!5070 (h!5926 (_ BitVec 64)) (t!10195 List!5074)) )
))
(declare-fun arrayNoDuplicates!0 (array!18601 (_ BitVec 32) List!5074) Bool)

(assert (=> b!347545 (= res!192436 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5071))))

(declare-fun res!192437 () Bool)

(assert (=> start!34762 (=> (not res!192437) (not e!212942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34762 (= res!192437 (validMask!0 mask!2385))))

(assert (=> start!34762 e!212942))

(assert (=> start!34762 true))

(assert (=> start!34762 tp_is_empty!7513))

(assert (=> start!34762 tp!26249))

(declare-fun e!212940 () Bool)

(declare-fun array_inv!6542 (array!18603) Bool)

(assert (=> start!34762 (and (array_inv!6542 _values!1525) e!212940)))

(declare-fun array_inv!6543 (array!18601) Bool)

(assert (=> start!34762 (array_inv!6543 _keys!1895)))

(declare-fun b!347546 () Bool)

(declare-fun res!192432 () Bool)

(assert (=> b!347546 (=> (not res!192432) (not e!212945))))

(assert (=> b!347546 (= res!192432 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15764 lt!163479)))))

(declare-fun b!347547 () Bool)

(declare-fun res!192433 () Bool)

(assert (=> b!347547 (=> (not res!192433) (not e!212942))))

(assert (=> b!347547 (= res!192433 (and (= (size!9164 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9163 _keys!1895) (size!9164 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347548 () Bool)

(declare-fun e!212943 () Bool)

(assert (=> b!347548 (= e!212940 (and e!212943 mapRes!12729))))

(declare-fun condMapEmpty!12729 () Bool)

(declare-fun mapDefault!12729 () ValueCell!3413)

(assert (=> b!347548 (= condMapEmpty!12729 (= (arr!8811 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3413)) mapDefault!12729)))))

(declare-fun b!347549 () Bool)

(assert (=> b!347549 (= e!212943 tp_is_empty!7513)))

(declare-fun b!347550 () Bool)

(declare-fun res!192434 () Bool)

(assert (=> b!347550 (=> (not res!192434) (not e!212942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18601 (_ BitVec 32)) Bool)

(assert (=> b!347550 (= res!192434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347551 () Bool)

(assert (=> b!347551 (= e!212942 e!212941)))

(declare-fun res!192438 () Bool)

(assert (=> b!347551 (=> (not res!192438) (not e!212941))))

(assert (=> b!347551 (= res!192438 (not (contains!2272 lt!163480 k0!1348)))))

(declare-fun getCurrentListMap!1702 (array!18601 array!18603 (_ BitVec 32) (_ BitVec 32) V!10995 V!10995 (_ BitVec 32) Int) ListLongMap!4361)

(assert (=> b!347551 (= lt!163480 (getCurrentListMap!1702 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun mapIsEmpty!12729 () Bool)

(assert (=> mapIsEmpty!12729 mapRes!12729))

(assert (= (and start!34762 res!192437) b!347547))

(assert (= (and b!347547 res!192433) b!347550))

(assert (= (and b!347550 res!192434) b!347545))

(assert (= (and b!347545 res!192436) b!347543))

(assert (= (and b!347543 res!192439) b!347551))

(assert (= (and b!347551 res!192438) b!347541))

(assert (= (and b!347541 res!192435) b!347546))

(assert (= (and b!347546 res!192432) b!347544))

(assert (= (and b!347548 condMapEmpty!12729) mapIsEmpty!12729))

(assert (= (and b!347548 (not condMapEmpty!12729)) mapNonEmpty!12729))

(assert (= (and mapNonEmpty!12729 ((_ is ValueCellFull!3413) mapValue!12729)) b!347542))

(assert (= (and b!347548 ((_ is ValueCellFull!3413) mapDefault!12729)) b!347549))

(assert (= start!34762 b!347548))

(declare-fun m!347955 () Bool)

(assert (=> b!347543 m!347955))

(declare-fun m!347957 () Bool)

(assert (=> mapNonEmpty!12729 m!347957))

(declare-fun m!347959 () Bool)

(assert (=> b!347541 m!347959))

(declare-fun m!347961 () Bool)

(assert (=> b!347541 m!347961))

(assert (=> b!347544 m!347959))

(declare-fun m!347963 () Bool)

(assert (=> b!347544 m!347963))

(declare-fun m!347965 () Bool)

(assert (=> b!347544 m!347965))

(declare-fun m!347967 () Bool)

(assert (=> b!347544 m!347967))

(declare-fun m!347969 () Bool)

(assert (=> b!347544 m!347969))

(assert (=> b!347544 m!347959))

(declare-fun m!347971 () Bool)

(assert (=> start!34762 m!347971))

(declare-fun m!347973 () Bool)

(assert (=> start!34762 m!347973))

(declare-fun m!347975 () Bool)

(assert (=> start!34762 m!347975))

(declare-fun m!347977 () Bool)

(assert (=> b!347551 m!347977))

(declare-fun m!347979 () Bool)

(assert (=> b!347551 m!347979))

(declare-fun m!347981 () Bool)

(assert (=> b!347550 m!347981))

(declare-fun m!347983 () Bool)

(assert (=> b!347546 m!347983))

(declare-fun m!347985 () Bool)

(assert (=> b!347545 m!347985))

(check-sat (not b!347546) (not start!34762) (not b!347550) (not mapNonEmpty!12729) (not b!347541) (not b!347544) (not b_next!7561) b_and!14757 (not b!347545) (not b!347543) (not b!347551) tp_is_empty!7513)
(check-sat b_and!14757 (not b_next!7561))
