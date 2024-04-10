; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34714 () Bool)

(assert start!34714)

(declare-fun b_free!7521 () Bool)

(declare-fun b_next!7521 () Bool)

(assert (=> start!34714 (= b_free!7521 (not b_next!7521))))

(declare-fun tp!26127 () Bool)

(declare-fun b_and!14741 () Bool)

(assert (=> start!34714 (= tp!26127 b_and!14741)))

(declare-fun b!347012 () Bool)

(declare-fun res!192024 () Bool)

(declare-fun e!212651 () Bool)

(assert (=> b!347012 (=> (not res!192024) (not e!212651))))

(declare-datatypes ((array!18537 0))(
  ( (array!18538 (arr!8779 (Array (_ BitVec 32) (_ BitVec 64))) (size!9131 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18537)

(declare-datatypes ((List!5096 0))(
  ( (Nil!5093) (Cons!5092 (h!5948 (_ BitVec 64)) (t!10224 List!5096)) )
))
(declare-fun arrayNoDuplicates!0 (array!18537 (_ BitVec 32) List!5096) Bool)

(assert (=> b!347012 (= res!192024 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5093))))

(declare-fun mapIsEmpty!12666 () Bool)

(declare-fun mapRes!12666 () Bool)

(assert (=> mapIsEmpty!12666 mapRes!12666))

(declare-fun b!347013 () Bool)

(declare-fun e!212647 () Bool)

(declare-fun e!212648 () Bool)

(assert (=> b!347013 (= e!212647 (and e!212648 mapRes!12666))))

(declare-fun condMapEmpty!12666 () Bool)

(declare-datatypes ((V!10941 0))(
  ( (V!10942 (val!3781 Int)) )
))
(declare-datatypes ((ValueCell!3393 0))(
  ( (ValueCellFull!3393 (v!5963 V!10941)) (EmptyCell!3393) )
))
(declare-datatypes ((array!18539 0))(
  ( (array!18540 (arr!8780 (Array (_ BitVec 32) ValueCell!3393)) (size!9132 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18539)

(declare-fun mapDefault!12666 () ValueCell!3393)

(assert (=> b!347013 (= condMapEmpty!12666 (= (arr!8780 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3393)) mapDefault!12666)))))

(declare-fun b!347014 () Bool)

(declare-fun res!192021 () Bool)

(declare-fun e!212649 () Bool)

(assert (=> b!347014 (=> (not res!192021) (not e!212649))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3387 0))(
  ( (MissingZero!3387 (index!15727 (_ BitVec 32))) (Found!3387 (index!15728 (_ BitVec 32))) (Intermediate!3387 (undefined!4199 Bool) (index!15729 (_ BitVec 32)) (x!34569 (_ BitVec 32))) (Undefined!3387) (MissingVacant!3387 (index!15730 (_ BitVec 32))) )
))
(declare-fun lt!163473 () SeekEntryResult!3387)

(declare-fun arrayContainsKey!0 (array!18537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347014 (= res!192021 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15728 lt!163473)))))

(declare-fun res!192020 () Bool)

(assert (=> start!34714 (=> (not res!192020) (not e!212651))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34714 (= res!192020 (validMask!0 mask!2385))))

(assert (=> start!34714 e!212651))

(assert (=> start!34714 true))

(declare-fun tp_is_empty!7473 () Bool)

(assert (=> start!34714 tp_is_empty!7473))

(assert (=> start!34714 tp!26127))

(declare-fun array_inv!6502 (array!18539) Bool)

(assert (=> start!34714 (and (array_inv!6502 _values!1525) e!212647)))

(declare-fun array_inv!6503 (array!18537) Bool)

(assert (=> start!34714 (array_inv!6503 _keys!1895)))

(declare-fun b!347015 () Bool)

(assert (=> b!347015 (= e!212648 tp_is_empty!7473)))

(declare-fun b!347016 () Bool)

(declare-fun e!212652 () Bool)

(assert (=> b!347016 (= e!212652 tp_is_empty!7473)))

(declare-fun mapNonEmpty!12666 () Bool)

(declare-fun tp!26126 () Bool)

(assert (=> mapNonEmpty!12666 (= mapRes!12666 (and tp!26126 e!212652))))

(declare-fun mapKey!12666 () (_ BitVec 32))

(declare-fun mapRest!12666 () (Array (_ BitVec 32) ValueCell!3393))

(declare-fun mapValue!12666 () ValueCell!3393)

(assert (=> mapNonEmpty!12666 (= (arr!8780 _values!1525) (store mapRest!12666 mapKey!12666 mapValue!12666))))

(declare-fun b!347017 () Bool)

(declare-fun res!192019 () Bool)

(assert (=> b!347017 (=> (not res!192019) (not e!212651))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10941)

(declare-fun zeroValue!1467 () V!10941)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5474 0))(
  ( (tuple2!5475 (_1!2748 (_ BitVec 64)) (_2!2748 V!10941)) )
))
(declare-datatypes ((List!5097 0))(
  ( (Nil!5094) (Cons!5093 (h!5949 tuple2!5474) (t!10225 List!5097)) )
))
(declare-datatypes ((ListLongMap!4387 0))(
  ( (ListLongMap!4388 (toList!2209 List!5097)) )
))
(declare-fun contains!2273 (ListLongMap!4387 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1730 (array!18537 array!18539 (_ BitVec 32) (_ BitVec 32) V!10941 V!10941 (_ BitVec 32) Int) ListLongMap!4387)

(assert (=> b!347017 (= res!192019 (not (contains!2273 (getCurrentListMap!1730 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347018 () Bool)

(declare-fun res!192022 () Bool)

(assert (=> b!347018 (=> (not res!192022) (not e!212651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18537 (_ BitVec 32)) Bool)

(assert (=> b!347018 (= res!192022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347019 () Bool)

(declare-fun res!192025 () Bool)

(assert (=> b!347019 (=> (not res!192025) (not e!212651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347019 (= res!192025 (validKeyInArray!0 k0!1348))))

(declare-fun b!347020 () Bool)

(assert (=> b!347020 (= e!212651 e!212649)))

(declare-fun res!192023 () Bool)

(assert (=> b!347020 (=> (not res!192023) (not e!212649))))

(get-info :version)

(assert (=> b!347020 (= res!192023 (and ((_ is Found!3387) lt!163473) (= (select (arr!8779 _keys!1895) (index!15728 lt!163473)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18537 (_ BitVec 32)) SeekEntryResult!3387)

(assert (=> b!347020 (= lt!163473 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347021 () Bool)

(declare-fun res!192026 () Bool)

(assert (=> b!347021 (=> (not res!192026) (not e!212651))))

(assert (=> b!347021 (= res!192026 (and (= (size!9132 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9131 _keys!1895) (size!9132 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347022 () Bool)

(assert (=> b!347022 (= e!212649 (not true))))

(assert (=> b!347022 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10773 0))(
  ( (Unit!10774) )
))
(declare-fun lt!163474 () Unit!10773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18537 (_ BitVec 64) (_ BitVec 32)) Unit!10773)

(assert (=> b!347022 (= lt!163474 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15728 lt!163473)))))

(assert (= (and start!34714 res!192020) b!347021))

(assert (= (and b!347021 res!192026) b!347018))

(assert (= (and b!347018 res!192022) b!347012))

(assert (= (and b!347012 res!192024) b!347019))

(assert (= (and b!347019 res!192025) b!347017))

(assert (= (and b!347017 res!192019) b!347020))

(assert (= (and b!347020 res!192023) b!347014))

(assert (= (and b!347014 res!192021) b!347022))

(assert (= (and b!347013 condMapEmpty!12666) mapIsEmpty!12666))

(assert (= (and b!347013 (not condMapEmpty!12666)) mapNonEmpty!12666))

(assert (= (and mapNonEmpty!12666 ((_ is ValueCellFull!3393) mapValue!12666)) b!347016))

(assert (= (and b!347013 ((_ is ValueCellFull!3393) mapDefault!12666)) b!347015))

(assert (= start!34714 b!347013))

(declare-fun m!348007 () Bool)

(assert (=> b!347014 m!348007))

(declare-fun m!348009 () Bool)

(assert (=> b!347022 m!348009))

(declare-fun m!348011 () Bool)

(assert (=> b!347022 m!348011))

(declare-fun m!348013 () Bool)

(assert (=> b!347018 m!348013))

(declare-fun m!348015 () Bool)

(assert (=> start!34714 m!348015))

(declare-fun m!348017 () Bool)

(assert (=> start!34714 m!348017))

(declare-fun m!348019 () Bool)

(assert (=> start!34714 m!348019))

(declare-fun m!348021 () Bool)

(assert (=> b!347019 m!348021))

(declare-fun m!348023 () Bool)

(assert (=> b!347012 m!348023))

(declare-fun m!348025 () Bool)

(assert (=> mapNonEmpty!12666 m!348025))

(declare-fun m!348027 () Bool)

(assert (=> b!347017 m!348027))

(assert (=> b!347017 m!348027))

(declare-fun m!348029 () Bool)

(assert (=> b!347017 m!348029))

(declare-fun m!348031 () Bool)

(assert (=> b!347020 m!348031))

(declare-fun m!348033 () Bool)

(assert (=> b!347020 m!348033))

(check-sat (not b_next!7521) (not start!34714) (not b!347017) (not b!347022) (not b!347019) tp_is_empty!7473 (not b!347018) (not mapNonEmpty!12666) (not b!347014) (not b!347012) (not b!347020) b_and!14741)
(check-sat b_and!14741 (not b_next!7521))
