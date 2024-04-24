; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34762 () Bool)

(assert start!34762)

(declare-fun b_free!7561 () Bool)

(declare-fun b_next!7561 () Bool)

(assert (=> start!34762 (= b_free!7561 (not b_next!7561))))

(declare-fun tp!26250 () Bool)

(declare-fun b_and!14797 () Bool)

(assert (=> start!34762 (= tp!26250 b_and!14797)))

(declare-fun b!347763 () Bool)

(declare-fun res!192563 () Bool)

(declare-fun e!213083 () Bool)

(assert (=> b!347763 (=> (not res!192563) (not e!213083))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10995 0))(
  ( (V!10996 (val!3801 Int)) )
))
(declare-datatypes ((ValueCell!3413 0))(
  ( (ValueCellFull!3413 (v!5985 V!10995)) (EmptyCell!3413) )
))
(declare-datatypes ((array!18608 0))(
  ( (array!18609 (arr!8813 (Array (_ BitVec 32) ValueCell!3413)) (size!9165 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18608)

(declare-datatypes ((array!18610 0))(
  ( (array!18611 (arr!8814 (Array (_ BitVec 32) (_ BitVec 64))) (size!9166 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18610)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347763 (= res!192563 (and (= (size!9165 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9166 _keys!1895) (size!9165 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347764 () Bool)

(declare-fun res!192558 () Bool)

(assert (=> b!347764 (=> (not res!192558) (not e!213083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18610 (_ BitVec 32)) Bool)

(assert (=> b!347764 (= res!192558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347765 () Bool)

(declare-fun e!213086 () Bool)

(declare-fun tp_is_empty!7513 () Bool)

(assert (=> b!347765 (= e!213086 tp_is_empty!7513)))

(declare-fun b!347766 () Bool)

(declare-fun e!213084 () Bool)

(assert (=> b!347766 (= e!213084 (not true))))

(declare-datatypes ((tuple2!5412 0))(
  ( (tuple2!5413 (_1!2717 (_ BitVec 64)) (_2!2717 V!10995)) )
))
(declare-datatypes ((List!5019 0))(
  ( (Nil!5016) (Cons!5015 (h!5871 tuple2!5412) (t!10141 List!5019)) )
))
(declare-datatypes ((ListLongMap!4327 0))(
  ( (ListLongMap!4328 (toList!2179 List!5019)) )
))
(declare-fun lt!163733 () ListLongMap!4327)

(declare-datatypes ((SeekEntryResult!3354 0))(
  ( (MissingZero!3354 (index!15595 (_ BitVec 32))) (Found!3354 (index!15596 (_ BitVec 32))) (Intermediate!3354 (undefined!4166 Bool) (index!15597 (_ BitVec 32)) (x!34599 (_ BitVec 32))) (Undefined!3354) (MissingVacant!3354 (index!15598 (_ BitVec 32))) )
))
(declare-fun lt!163734 () SeekEntryResult!3354)

(declare-fun contains!2263 (ListLongMap!4327 (_ BitVec 64)) Bool)

(assert (=> b!347766 (contains!2263 lt!163733 (select (arr!8814 _keys!1895) (index!15596 lt!163734)))))

(declare-datatypes ((Unit!10765 0))(
  ( (Unit!10766) )
))
(declare-fun lt!163735 () Unit!10765)

(declare-fun zeroValue!1467 () V!10995)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10995)

(declare-fun lemmaValidKeyInArrayIsInListMap!172 (array!18610 array!18608 (_ BitVec 32) (_ BitVec 32) V!10995 V!10995 (_ BitVec 32) Int) Unit!10765)

(assert (=> b!347766 (= lt!163735 (lemmaValidKeyInArrayIsInListMap!172 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15596 lt!163734) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347766 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163732 () Unit!10765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18610 (_ BitVec 64) (_ BitVec 32)) Unit!10765)

(assert (=> b!347766 (= lt!163732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15596 lt!163734)))))

(declare-fun b!347767 () Bool)

(declare-fun res!192565 () Bool)

(assert (=> b!347767 (=> (not res!192565) (not e!213084))))

(assert (=> b!347767 (= res!192565 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15596 lt!163734)))))

(declare-fun b!347768 () Bool)

(declare-fun e!213088 () Bool)

(declare-fun e!213087 () Bool)

(declare-fun mapRes!12729 () Bool)

(assert (=> b!347768 (= e!213088 (and e!213087 mapRes!12729))))

(declare-fun condMapEmpty!12729 () Bool)

(declare-fun mapDefault!12729 () ValueCell!3413)

(assert (=> b!347768 (= condMapEmpty!12729 (= (arr!8813 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3413)) mapDefault!12729)))))

(declare-fun mapIsEmpty!12729 () Bool)

(assert (=> mapIsEmpty!12729 mapRes!12729))

(declare-fun res!192561 () Bool)

(assert (=> start!34762 (=> (not res!192561) (not e!213083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34762 (= res!192561 (validMask!0 mask!2385))))

(assert (=> start!34762 e!213083))

(assert (=> start!34762 true))

(assert (=> start!34762 tp_is_empty!7513))

(assert (=> start!34762 tp!26250))

(declare-fun array_inv!6510 (array!18608) Bool)

(assert (=> start!34762 (and (array_inv!6510 _values!1525) e!213088)))

(declare-fun array_inv!6511 (array!18610) Bool)

(assert (=> start!34762 (array_inv!6511 _keys!1895)))

(declare-fun mapNonEmpty!12729 () Bool)

(declare-fun tp!26249 () Bool)

(assert (=> mapNonEmpty!12729 (= mapRes!12729 (and tp!26249 e!213086))))

(declare-fun mapRest!12729 () (Array (_ BitVec 32) ValueCell!3413))

(declare-fun mapKey!12729 () (_ BitVec 32))

(declare-fun mapValue!12729 () ValueCell!3413)

(assert (=> mapNonEmpty!12729 (= (arr!8813 _values!1525) (store mapRest!12729 mapKey!12729 mapValue!12729))))

(declare-fun b!347769 () Bool)

(declare-fun res!192559 () Bool)

(assert (=> b!347769 (=> (not res!192559) (not e!213083))))

(declare-datatypes ((List!5020 0))(
  ( (Nil!5017) (Cons!5016 (h!5872 (_ BitVec 64)) (t!10142 List!5020)) )
))
(declare-fun arrayNoDuplicates!0 (array!18610 (_ BitVec 32) List!5020) Bool)

(assert (=> b!347769 (= res!192559 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5017))))

(declare-fun b!347770 () Bool)

(declare-fun e!213085 () Bool)

(assert (=> b!347770 (= e!213083 e!213085)))

(declare-fun res!192560 () Bool)

(assert (=> b!347770 (=> (not res!192560) (not e!213085))))

(assert (=> b!347770 (= res!192560 (not (contains!2263 lt!163733 k0!1348)))))

(declare-fun getCurrentListMap!1707 (array!18610 array!18608 (_ BitVec 32) (_ BitVec 32) V!10995 V!10995 (_ BitVec 32) Int) ListLongMap!4327)

(assert (=> b!347770 (= lt!163733 (getCurrentListMap!1707 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347771 () Bool)

(assert (=> b!347771 (= e!213085 e!213084)))

(declare-fun res!192562 () Bool)

(assert (=> b!347771 (=> (not res!192562) (not e!213084))))

(get-info :version)

(assert (=> b!347771 (= res!192562 (and ((_ is Found!3354) lt!163734) (= (select (arr!8814 _keys!1895) (index!15596 lt!163734)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18610 (_ BitVec 32)) SeekEntryResult!3354)

(assert (=> b!347771 (= lt!163734 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347772 () Bool)

(assert (=> b!347772 (= e!213087 tp_is_empty!7513)))

(declare-fun b!347773 () Bool)

(declare-fun res!192564 () Bool)

(assert (=> b!347773 (=> (not res!192564) (not e!213083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347773 (= res!192564 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34762 res!192561) b!347763))

(assert (= (and b!347763 res!192563) b!347764))

(assert (= (and b!347764 res!192558) b!347769))

(assert (= (and b!347769 res!192559) b!347773))

(assert (= (and b!347773 res!192564) b!347770))

(assert (= (and b!347770 res!192560) b!347771))

(assert (= (and b!347771 res!192562) b!347767))

(assert (= (and b!347767 res!192565) b!347766))

(assert (= (and b!347768 condMapEmpty!12729) mapIsEmpty!12729))

(assert (= (and b!347768 (not condMapEmpty!12729)) mapNonEmpty!12729))

(assert (= (and mapNonEmpty!12729 ((_ is ValueCellFull!3413) mapValue!12729)) b!347765))

(assert (= (and b!347768 ((_ is ValueCellFull!3413) mapDefault!12729)) b!347772))

(assert (= start!34762 b!347768))

(declare-fun m!348909 () Bool)

(assert (=> b!347766 m!348909))

(declare-fun m!348911 () Bool)

(assert (=> b!347766 m!348911))

(declare-fun m!348913 () Bool)

(assert (=> b!347766 m!348913))

(declare-fun m!348915 () Bool)

(assert (=> b!347766 m!348915))

(assert (=> b!347766 m!348909))

(declare-fun m!348917 () Bool)

(assert (=> b!347766 m!348917))

(declare-fun m!348919 () Bool)

(assert (=> b!347767 m!348919))

(declare-fun m!348921 () Bool)

(assert (=> mapNonEmpty!12729 m!348921))

(assert (=> b!347771 m!348909))

(declare-fun m!348923 () Bool)

(assert (=> b!347771 m!348923))

(declare-fun m!348925 () Bool)

(assert (=> b!347773 m!348925))

(declare-fun m!348927 () Bool)

(assert (=> b!347770 m!348927))

(declare-fun m!348929 () Bool)

(assert (=> b!347770 m!348929))

(declare-fun m!348931 () Bool)

(assert (=> start!34762 m!348931))

(declare-fun m!348933 () Bool)

(assert (=> start!34762 m!348933))

(declare-fun m!348935 () Bool)

(assert (=> start!34762 m!348935))

(declare-fun m!348937 () Bool)

(assert (=> b!347769 m!348937))

(declare-fun m!348939 () Bool)

(assert (=> b!347764 m!348939))

(check-sat (not b!347770) (not b!347769) b_and!14797 (not mapNonEmpty!12729) (not start!34762) (not b_next!7561) tp_is_empty!7513 (not b!347764) (not b!347766) (not b!347771) (not b!347773) (not b!347767))
(check-sat b_and!14797 (not b_next!7561))
