; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34796 () Bool)

(assert start!34796)

(declare-fun b_free!7581 () Bool)

(declare-fun b_next!7581 () Bool)

(assert (=> start!34796 (= b_free!7581 (not b_next!7581))))

(declare-fun tp!26309 () Bool)

(declare-fun b_and!14803 () Bool)

(assert (=> start!34796 (= tp!26309 b_and!14803)))

(declare-fun b!348146 () Bool)

(declare-fun res!192807 () Bool)

(declare-fun e!213325 () Bool)

(assert (=> b!348146 (=> (not res!192807) (not e!213325))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348146 (= res!192807 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12759 () Bool)

(declare-fun mapRes!12759 () Bool)

(declare-fun tp!26310 () Bool)

(declare-fun e!213323 () Bool)

(assert (=> mapNonEmpty!12759 (= mapRes!12759 (and tp!26310 e!213323))))

(declare-datatypes ((V!11021 0))(
  ( (V!11022 (val!3811 Int)) )
))
(declare-datatypes ((ValueCell!3423 0))(
  ( (ValueCellFull!3423 (v!5994 V!11021)) (EmptyCell!3423) )
))
(declare-datatypes ((array!18653 0))(
  ( (array!18654 (arr!8836 (Array (_ BitVec 32) ValueCell!3423)) (size!9188 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18653)

(declare-fun mapKey!12759 () (_ BitVec 32))

(declare-fun mapValue!12759 () ValueCell!3423)

(declare-fun mapRest!12759 () (Array (_ BitVec 32) ValueCell!3423))

(assert (=> mapNonEmpty!12759 (= (arr!8836 _values!1525) (store mapRest!12759 mapKey!12759 mapValue!12759))))

(declare-fun b!348147 () Bool)

(declare-fun res!192806 () Bool)

(declare-fun e!213324 () Bool)

(assert (=> b!348147 (=> (not res!192806) (not e!213324))))

(declare-datatypes ((array!18655 0))(
  ( (array!18656 (arr!8837 (Array (_ BitVec 32) (_ BitVec 64))) (size!9189 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18655)

(declare-fun arrayContainsKey!0 (array!18655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348147 (= res!192806 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348148 () Bool)

(declare-fun e!213321 () Bool)

(declare-fun e!213326 () Bool)

(assert (=> b!348148 (= e!213321 (and e!213326 mapRes!12759))))

(declare-fun condMapEmpty!12759 () Bool)

(declare-fun mapDefault!12759 () ValueCell!3423)

(assert (=> b!348148 (= condMapEmpty!12759 (= (arr!8836 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3423)) mapDefault!12759)))))

(declare-fun b!348150 () Bool)

(declare-fun tp_is_empty!7533 () Bool)

(assert (=> b!348150 (= e!213326 tp_is_empty!7533)))

(declare-fun b!348151 () Bool)

(assert (=> b!348151 (= e!213324 false)))

(declare-fun lt!163825 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18655 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348151 (= lt!163825 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348152 () Bool)

(assert (=> b!348152 (= e!213323 tp_is_empty!7533)))

(declare-fun b!348153 () Bool)

(declare-fun res!192802 () Bool)

(assert (=> b!348153 (=> (not res!192802) (not e!213325))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!11021)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11021)

(declare-datatypes ((tuple2!5510 0))(
  ( (tuple2!5511 (_1!2766 (_ BitVec 64)) (_2!2766 V!11021)) )
))
(declare-datatypes ((List!5132 0))(
  ( (Nil!5129) (Cons!5128 (h!5984 tuple2!5510) (t!10262 List!5132)) )
))
(declare-datatypes ((ListLongMap!4423 0))(
  ( (ListLongMap!4424 (toList!2227 List!5132)) )
))
(declare-fun contains!2292 (ListLongMap!4423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1748 (array!18655 array!18653 (_ BitVec 32) (_ BitVec 32) V!11021 V!11021 (_ BitVec 32) Int) ListLongMap!4423)

(assert (=> b!348153 (= res!192802 (not (contains!2292 (getCurrentListMap!1748 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348154 () Bool)

(declare-fun res!192808 () Bool)

(assert (=> b!348154 (=> (not res!192808) (not e!213325))))

(assert (=> b!348154 (= res!192808 (and (= (size!9188 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9189 _keys!1895) (size!9188 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348155 () Bool)

(assert (=> b!348155 (= e!213325 e!213324)))

(declare-fun res!192805 () Bool)

(assert (=> b!348155 (=> (not res!192805) (not e!213324))))

(declare-datatypes ((SeekEntryResult!3409 0))(
  ( (MissingZero!3409 (index!15815 (_ BitVec 32))) (Found!3409 (index!15816 (_ BitVec 32))) (Intermediate!3409 (undefined!4221 Bool) (index!15817 (_ BitVec 32)) (x!34681 (_ BitVec 32))) (Undefined!3409) (MissingVacant!3409 (index!15818 (_ BitVec 32))) )
))
(declare-fun lt!163824 () SeekEntryResult!3409)

(get-info :version)

(assert (=> b!348155 (= res!192805 (and (not ((_ is Found!3409) lt!163824)) ((_ is MissingZero!3409) lt!163824)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18655 (_ BitVec 32)) SeekEntryResult!3409)

(assert (=> b!348155 (= lt!163824 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!192803 () Bool)

(assert (=> start!34796 (=> (not res!192803) (not e!213325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34796 (= res!192803 (validMask!0 mask!2385))))

(assert (=> start!34796 e!213325))

(assert (=> start!34796 true))

(assert (=> start!34796 tp_is_empty!7533))

(assert (=> start!34796 tp!26309))

(declare-fun array_inv!6542 (array!18653) Bool)

(assert (=> start!34796 (and (array_inv!6542 _values!1525) e!213321)))

(declare-fun array_inv!6543 (array!18655) Bool)

(assert (=> start!34796 (array_inv!6543 _keys!1895)))

(declare-fun b!348149 () Bool)

(declare-fun res!192801 () Bool)

(assert (=> b!348149 (=> (not res!192801) (not e!213325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18655 (_ BitVec 32)) Bool)

(assert (=> b!348149 (= res!192801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348156 () Bool)

(declare-fun res!192804 () Bool)

(assert (=> b!348156 (=> (not res!192804) (not e!213325))))

(declare-datatypes ((List!5133 0))(
  ( (Nil!5130) (Cons!5129 (h!5985 (_ BitVec 64)) (t!10263 List!5133)) )
))
(declare-fun arrayNoDuplicates!0 (array!18655 (_ BitVec 32) List!5133) Bool)

(assert (=> b!348156 (= res!192804 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5130))))

(declare-fun mapIsEmpty!12759 () Bool)

(assert (=> mapIsEmpty!12759 mapRes!12759))

(assert (= (and start!34796 res!192803) b!348154))

(assert (= (and b!348154 res!192808) b!348149))

(assert (= (and b!348149 res!192801) b!348156))

(assert (= (and b!348156 res!192804) b!348146))

(assert (= (and b!348146 res!192807) b!348153))

(assert (= (and b!348153 res!192802) b!348155))

(assert (= (and b!348155 res!192805) b!348147))

(assert (= (and b!348147 res!192806) b!348151))

(assert (= (and b!348148 condMapEmpty!12759) mapIsEmpty!12759))

(assert (= (and b!348148 (not condMapEmpty!12759)) mapNonEmpty!12759))

(assert (= (and mapNonEmpty!12759 ((_ is ValueCellFull!3423) mapValue!12759)) b!348152))

(assert (= (and b!348148 ((_ is ValueCellFull!3423) mapDefault!12759)) b!348150))

(assert (= start!34796 b!348148))

(declare-fun m!348997 () Bool)

(assert (=> b!348147 m!348997))

(declare-fun m!348999 () Bool)

(assert (=> b!348156 m!348999))

(declare-fun m!349001 () Bool)

(assert (=> start!34796 m!349001))

(declare-fun m!349003 () Bool)

(assert (=> start!34796 m!349003))

(declare-fun m!349005 () Bool)

(assert (=> start!34796 m!349005))

(declare-fun m!349007 () Bool)

(assert (=> b!348155 m!349007))

(declare-fun m!349009 () Bool)

(assert (=> b!348153 m!349009))

(assert (=> b!348153 m!349009))

(declare-fun m!349011 () Bool)

(assert (=> b!348153 m!349011))

(declare-fun m!349013 () Bool)

(assert (=> b!348151 m!349013))

(declare-fun m!349015 () Bool)

(assert (=> b!348146 m!349015))

(declare-fun m!349017 () Bool)

(assert (=> b!348149 m!349017))

(declare-fun m!349019 () Bool)

(assert (=> mapNonEmpty!12759 m!349019))

(check-sat tp_is_empty!7533 (not b!348151) (not b!348153) (not b!348147) (not start!34796) b_and!14803 (not b!348146) (not b!348149) (not mapNonEmpty!12759) (not b_next!7581) (not b!348156) (not b!348155))
(check-sat b_and!14803 (not b_next!7581))
