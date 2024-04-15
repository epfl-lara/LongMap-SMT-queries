; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34060 () Bool)

(assert start!34060)

(declare-fun b_free!7153 () Bool)

(declare-fun b_next!7153 () Bool)

(assert (=> start!34060 (= b_free!7153 (not b_next!7153))))

(declare-fun tp!24984 () Bool)

(declare-fun b_and!14321 () Bool)

(assert (=> start!34060 (= tp!24984 b_and!14321)))

(declare-fun b!339271 () Bool)

(declare-fun res!187422 () Bool)

(declare-fun e!208142 () Bool)

(assert (=> b!339271 (=> (not res!187422) (not e!208142))))

(declare-datatypes ((V!10451 0))(
  ( (V!10452 (val!3597 Int)) )
))
(declare-datatypes ((ValueCell!3209 0))(
  ( (ValueCellFull!3209 (v!5760 V!10451)) (EmptyCell!3209) )
))
(declare-datatypes ((array!17785 0))(
  ( (array!17786 (arr!8416 (Array (_ BitVec 32) ValueCell!3209)) (size!8769 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17785)

(declare-datatypes ((array!17787 0))(
  ( (array!17788 (arr!8417 (Array (_ BitVec 32) (_ BitVec 64))) (size!8770 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17787)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!339271 (= res!187422 (and (= (size!8769 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8770 _keys!1895) (size!8769 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!187423 () Bool)

(assert (=> start!34060 (=> (not res!187423) (not e!208142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34060 (= res!187423 (validMask!0 mask!2385))))

(assert (=> start!34060 e!208142))

(assert (=> start!34060 true))

(declare-fun tp_is_empty!7105 () Bool)

(assert (=> start!34060 tp_is_empty!7105))

(assert (=> start!34060 tp!24984))

(declare-fun e!208145 () Bool)

(declare-fun array_inv!6266 (array!17785) Bool)

(assert (=> start!34060 (and (array_inv!6266 _values!1525) e!208145)))

(declare-fun array_inv!6267 (array!17787) Bool)

(assert (=> start!34060 (array_inv!6267 _keys!1895)))

(declare-fun b!339272 () Bool)

(declare-fun e!208147 () Bool)

(assert (=> b!339272 (= e!208147 tp_is_empty!7105)))

(declare-fun mapNonEmpty!12075 () Bool)

(declare-fun mapRes!12075 () Bool)

(declare-fun tp!24983 () Bool)

(assert (=> mapNonEmpty!12075 (= mapRes!12075 (and tp!24983 e!208147))))

(declare-fun mapRest!12075 () (Array (_ BitVec 32) ValueCell!3209))

(declare-fun mapKey!12075 () (_ BitVec 32))

(declare-fun mapValue!12075 () ValueCell!3209)

(assert (=> mapNonEmpty!12075 (= (arr!8416 _values!1525) (store mapRest!12075 mapKey!12075 mapValue!12075))))

(declare-fun b!339273 () Bool)

(declare-datatypes ((Unit!10554 0))(
  ( (Unit!10555) )
))
(declare-fun e!208143 () Unit!10554)

(declare-fun Unit!10556 () Unit!10554)

(assert (=> b!339273 (= e!208143 Unit!10556)))

(declare-fun b!339274 () Bool)

(declare-fun e!208141 () Bool)

(assert (=> b!339274 (= e!208141 false)))

(declare-fun lt!161000 () Unit!10554)

(assert (=> b!339274 (= lt!161000 e!208143)))

(declare-fun c!52496 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339274 (= c!52496 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339275 () Bool)

(declare-fun res!187419 () Bool)

(assert (=> b!339275 (=> (not res!187419) (not e!208142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17787 (_ BitVec 32)) Bool)

(assert (=> b!339275 (= res!187419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339276 () Bool)

(assert (=> b!339276 (= e!208142 e!208141)))

(declare-fun res!187418 () Bool)

(assert (=> b!339276 (=> (not res!187418) (not e!208141))))

(declare-datatypes ((SeekEntryResult!3248 0))(
  ( (MissingZero!3248 (index!15171 (_ BitVec 32))) (Found!3248 (index!15172 (_ BitVec 32))) (Intermediate!3248 (undefined!4060 Bool) (index!15173 (_ BitVec 32)) (x!33807 (_ BitVec 32))) (Undefined!3248) (MissingVacant!3248 (index!15174 (_ BitVec 32))) )
))
(declare-fun lt!160999 () SeekEntryResult!3248)

(get-info :version)

(assert (=> b!339276 (= res!187418 (and (not ((_ is Found!3248) lt!160999)) ((_ is MissingZero!3248) lt!160999)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17787 (_ BitVec 32)) SeekEntryResult!3248)

(assert (=> b!339276 (= lt!160999 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339277 () Bool)

(declare-fun Unit!10557 () Unit!10554)

(assert (=> b!339277 (= e!208143 Unit!10557)))

(declare-fun zeroValue!1467 () V!10451)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10451)

(declare-fun lt!161001 () Unit!10554)

(declare-fun lemmaArrayContainsKeyThenInListMap!287 (array!17787 array!17785 (_ BitVec 32) (_ BitVec 32) V!10451 V!10451 (_ BitVec 64) (_ BitVec 32) Int) Unit!10554)

(declare-fun arrayScanForKey!0 (array!17787 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339277 (= lt!161001 (lemmaArrayContainsKeyThenInListMap!287 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339277 false))

(declare-fun b!339278 () Bool)

(declare-fun res!187421 () Bool)

(assert (=> b!339278 (=> (not res!187421) (not e!208142))))

(declare-datatypes ((tuple2!5164 0))(
  ( (tuple2!5165 (_1!2593 (_ BitVec 64)) (_2!2593 V!10451)) )
))
(declare-datatypes ((List!4788 0))(
  ( (Nil!4785) (Cons!4784 (h!5640 tuple2!5164) (t!9881 List!4788)) )
))
(declare-datatypes ((ListLongMap!4067 0))(
  ( (ListLongMap!4068 (toList!2049 List!4788)) )
))
(declare-fun contains!2111 (ListLongMap!4067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1555 (array!17787 array!17785 (_ BitVec 32) (_ BitVec 32) V!10451 V!10451 (_ BitVec 32) Int) ListLongMap!4067)

(assert (=> b!339278 (= res!187421 (not (contains!2111 (getCurrentListMap!1555 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339279 () Bool)

(declare-fun res!187420 () Bool)

(assert (=> b!339279 (=> (not res!187420) (not e!208142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339279 (= res!187420 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12075 () Bool)

(assert (=> mapIsEmpty!12075 mapRes!12075))

(declare-fun b!339280 () Bool)

(declare-fun e!208144 () Bool)

(assert (=> b!339280 (= e!208145 (and e!208144 mapRes!12075))))

(declare-fun condMapEmpty!12075 () Bool)

(declare-fun mapDefault!12075 () ValueCell!3209)

(assert (=> b!339280 (= condMapEmpty!12075 (= (arr!8416 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3209)) mapDefault!12075)))))

(declare-fun b!339281 () Bool)

(declare-fun res!187424 () Bool)

(assert (=> b!339281 (=> (not res!187424) (not e!208142))))

(declare-datatypes ((List!4789 0))(
  ( (Nil!4786) (Cons!4785 (h!5641 (_ BitVec 64)) (t!9882 List!4789)) )
))
(declare-fun arrayNoDuplicates!0 (array!17787 (_ BitVec 32) List!4789) Bool)

(assert (=> b!339281 (= res!187424 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4786))))

(declare-fun b!339282 () Bool)

(assert (=> b!339282 (= e!208144 tp_is_empty!7105)))

(assert (= (and start!34060 res!187423) b!339271))

(assert (= (and b!339271 res!187422) b!339275))

(assert (= (and b!339275 res!187419) b!339281))

(assert (= (and b!339281 res!187424) b!339279))

(assert (= (and b!339279 res!187420) b!339278))

(assert (= (and b!339278 res!187421) b!339276))

(assert (= (and b!339276 res!187418) b!339274))

(assert (= (and b!339274 c!52496) b!339277))

(assert (= (and b!339274 (not c!52496)) b!339273))

(assert (= (and b!339280 condMapEmpty!12075) mapIsEmpty!12075))

(assert (= (and b!339280 (not condMapEmpty!12075)) mapNonEmpty!12075))

(assert (= (and mapNonEmpty!12075 ((_ is ValueCellFull!3209) mapValue!12075)) b!339272))

(assert (= (and b!339280 ((_ is ValueCellFull!3209) mapDefault!12075)) b!339282))

(assert (= start!34060 b!339280))

(declare-fun m!341761 () Bool)

(assert (=> b!339276 m!341761))

(declare-fun m!341763 () Bool)

(assert (=> start!34060 m!341763))

(declare-fun m!341765 () Bool)

(assert (=> start!34060 m!341765))

(declare-fun m!341767 () Bool)

(assert (=> start!34060 m!341767))

(declare-fun m!341769 () Bool)

(assert (=> mapNonEmpty!12075 m!341769))

(declare-fun m!341771 () Bool)

(assert (=> b!339279 m!341771))

(declare-fun m!341773 () Bool)

(assert (=> b!339274 m!341773))

(declare-fun m!341775 () Bool)

(assert (=> b!339278 m!341775))

(assert (=> b!339278 m!341775))

(declare-fun m!341777 () Bool)

(assert (=> b!339278 m!341777))

(declare-fun m!341779 () Bool)

(assert (=> b!339281 m!341779))

(declare-fun m!341781 () Bool)

(assert (=> b!339277 m!341781))

(assert (=> b!339277 m!341781))

(declare-fun m!341783 () Bool)

(assert (=> b!339277 m!341783))

(declare-fun m!341785 () Bool)

(assert (=> b!339275 m!341785))

(check-sat (not b!339281) (not mapNonEmpty!12075) (not b!339276) (not b!339279) b_and!14321 (not b!339275) (not b_next!7153) (not start!34060) (not b!339277) tp_is_empty!7105 (not b!339274) (not b!339278))
(check-sat b_and!14321 (not b_next!7153))
