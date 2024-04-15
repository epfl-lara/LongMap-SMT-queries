; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33688 () Bool)

(assert start!33688)

(declare-fun b_free!6937 () Bool)

(declare-fun b_next!6937 () Bool)

(assert (=> start!33688 (= b_free!6937 (not b_next!6937))))

(declare-fun tp!24314 () Bool)

(declare-fun b_and!14091 () Bool)

(assert (=> start!33688 (= tp!24314 b_and!14091)))

(declare-fun b!334690 () Bool)

(declare-fun res!184631 () Bool)

(declare-fun e!205432 () Bool)

(assert (=> b!334690 (=> (not res!184631) (not e!205432))))

(declare-datatypes ((array!17351 0))(
  ( (array!17352 (arr!8206 (Array (_ BitVec 32) (_ BitVec 64))) (size!8559 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17351)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17351 (_ BitVec 32)) Bool)

(assert (=> b!334690 (= res!184631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334691 () Bool)

(declare-fun e!205427 () Bool)

(declare-fun tp_is_empty!6889 () Bool)

(assert (=> b!334691 (= e!205427 tp_is_empty!6889)))

(declare-fun b!334692 () Bool)

(declare-fun e!205428 () Bool)

(assert (=> b!334692 (= e!205428 (not true))))

(declare-datatypes ((V!10163 0))(
  ( (V!10164 (val!3489 Int)) )
))
(declare-datatypes ((tuple2!5010 0))(
  ( (tuple2!5011 (_1!2516 (_ BitVec 64)) (_2!2516 V!10163)) )
))
(declare-datatypes ((List!4650 0))(
  ( (Nil!4647) (Cons!4646 (h!5502 tuple2!5010) (t!9729 List!4650)) )
))
(declare-datatypes ((ListLongMap!3913 0))(
  ( (ListLongMap!3914 (toList!1972 List!4650)) )
))
(declare-fun lt!159423 () ListLongMap!3913)

(declare-datatypes ((SeekEntryResult!3174 0))(
  ( (MissingZero!3174 (index!14875 (_ BitVec 32))) (Found!3174 (index!14876 (_ BitVec 32))) (Intermediate!3174 (undefined!3986 Bool) (index!14877 (_ BitVec 32)) (x!33375 (_ BitVec 32))) (Undefined!3174) (MissingVacant!3174 (index!14878 (_ BitVec 32))) )
))
(declare-fun lt!159426 () SeekEntryResult!3174)

(declare-fun contains!2027 (ListLongMap!3913 (_ BitVec 64)) Bool)

(assert (=> b!334692 (contains!2027 lt!159423 (select (arr!8206 _keys!1895) (index!14876 lt!159426)))))

(declare-datatypes ((Unit!10402 0))(
  ( (Unit!10403) )
))
(declare-fun lt!159424 () Unit!10402)

(declare-fun zeroValue!1467 () V!10163)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3101 0))(
  ( (ValueCellFull!3101 (v!5645 V!10163)) (EmptyCell!3101) )
))
(declare-datatypes ((array!17353 0))(
  ( (array!17354 (arr!8207 (Array (_ BitVec 32) ValueCell!3101)) (size!8560 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17353)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10163)

(declare-fun lemmaValidKeyInArrayIsInListMap!158 (array!17351 array!17353 (_ BitVec 32) (_ BitVec 32) V!10163 V!10163 (_ BitVec 32) Int) Unit!10402)

(assert (=> b!334692 (= lt!159424 (lemmaValidKeyInArrayIsInListMap!158 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14876 lt!159426) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334692 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159425 () Unit!10402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17351 (_ BitVec 64) (_ BitVec 32)) Unit!10402)

(assert (=> b!334692 (= lt!159425 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14876 lt!159426)))))

(declare-fun b!334693 () Bool)

(declare-fun res!184633 () Bool)

(assert (=> b!334693 (=> (not res!184633) (not e!205432))))

(assert (=> b!334693 (= res!184633 (and (= (size!8560 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8559 _keys!1895) (size!8560 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11730 () Bool)

(declare-fun mapRes!11730 () Bool)

(assert (=> mapIsEmpty!11730 mapRes!11730))

(declare-fun mapNonEmpty!11730 () Bool)

(declare-fun tp!24315 () Bool)

(assert (=> mapNonEmpty!11730 (= mapRes!11730 (and tp!24315 e!205427))))

(declare-fun mapRest!11730 () (Array (_ BitVec 32) ValueCell!3101))

(declare-fun mapKey!11730 () (_ BitVec 32))

(declare-fun mapValue!11730 () ValueCell!3101)

(assert (=> mapNonEmpty!11730 (= (arr!8207 _values!1525) (store mapRest!11730 mapKey!11730 mapValue!11730))))

(declare-fun b!334694 () Bool)

(declare-fun e!205430 () Bool)

(declare-fun e!205426 () Bool)

(assert (=> b!334694 (= e!205430 (and e!205426 mapRes!11730))))

(declare-fun condMapEmpty!11730 () Bool)

(declare-fun mapDefault!11730 () ValueCell!3101)

(assert (=> b!334694 (= condMapEmpty!11730 (= (arr!8207 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3101)) mapDefault!11730)))))

(declare-fun res!184632 () Bool)

(assert (=> start!33688 (=> (not res!184632) (not e!205432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33688 (= res!184632 (validMask!0 mask!2385))))

(assert (=> start!33688 e!205432))

(assert (=> start!33688 true))

(assert (=> start!33688 tp_is_empty!6889))

(assert (=> start!33688 tp!24314))

(declare-fun array_inv!6120 (array!17353) Bool)

(assert (=> start!33688 (and (array_inv!6120 _values!1525) e!205430)))

(declare-fun array_inv!6121 (array!17351) Bool)

(assert (=> start!33688 (array_inv!6121 _keys!1895)))

(declare-fun b!334695 () Bool)

(assert (=> b!334695 (= e!205426 tp_is_empty!6889)))

(declare-fun b!334696 () Bool)

(declare-fun res!184630 () Bool)

(assert (=> b!334696 (=> (not res!184630) (not e!205432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334696 (= res!184630 (validKeyInArray!0 k0!1348))))

(declare-fun b!334697 () Bool)

(declare-fun res!184629 () Bool)

(assert (=> b!334697 (=> (not res!184629) (not e!205428))))

(assert (=> b!334697 (= res!184629 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14876 lt!159426)))))

(declare-fun b!334698 () Bool)

(declare-fun res!184634 () Bool)

(assert (=> b!334698 (=> (not res!184634) (not e!205432))))

(declare-datatypes ((List!4651 0))(
  ( (Nil!4648) (Cons!4647 (h!5503 (_ BitVec 64)) (t!9730 List!4651)) )
))
(declare-fun arrayNoDuplicates!0 (array!17351 (_ BitVec 32) List!4651) Bool)

(assert (=> b!334698 (= res!184634 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4648))))

(declare-fun b!334699 () Bool)

(declare-fun e!205429 () Bool)

(assert (=> b!334699 (= e!205429 e!205428)))

(declare-fun res!184627 () Bool)

(assert (=> b!334699 (=> (not res!184627) (not e!205428))))

(get-info :version)

(assert (=> b!334699 (= res!184627 (and ((_ is Found!3174) lt!159426) (= (select (arr!8206 _keys!1895) (index!14876 lt!159426)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17351 (_ BitVec 32)) SeekEntryResult!3174)

(assert (=> b!334699 (= lt!159426 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334700 () Bool)

(assert (=> b!334700 (= e!205432 e!205429)))

(declare-fun res!184628 () Bool)

(assert (=> b!334700 (=> (not res!184628) (not e!205429))))

(assert (=> b!334700 (= res!184628 (not (contains!2027 lt!159423 k0!1348)))))

(declare-fun getCurrentListMap!1481 (array!17351 array!17353 (_ BitVec 32) (_ BitVec 32) V!10163 V!10163 (_ BitVec 32) Int) ListLongMap!3913)

(assert (=> b!334700 (= lt!159423 (getCurrentListMap!1481 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and start!33688 res!184632) b!334693))

(assert (= (and b!334693 res!184633) b!334690))

(assert (= (and b!334690 res!184631) b!334698))

(assert (= (and b!334698 res!184634) b!334696))

(assert (= (and b!334696 res!184630) b!334700))

(assert (= (and b!334700 res!184628) b!334699))

(assert (= (and b!334699 res!184627) b!334697))

(assert (= (and b!334697 res!184629) b!334692))

(assert (= (and b!334694 condMapEmpty!11730) mapIsEmpty!11730))

(assert (= (and b!334694 (not condMapEmpty!11730)) mapNonEmpty!11730))

(assert (= (and mapNonEmpty!11730 ((_ is ValueCellFull!3101) mapValue!11730)) b!334691))

(assert (= (and b!334694 ((_ is ValueCellFull!3101) mapDefault!11730)) b!334695))

(assert (= start!33688 b!334694))

(declare-fun m!338243 () Bool)

(assert (=> b!334692 m!338243))

(declare-fun m!338245 () Bool)

(assert (=> b!334692 m!338245))

(assert (=> b!334692 m!338243))

(declare-fun m!338247 () Bool)

(assert (=> b!334692 m!338247))

(declare-fun m!338249 () Bool)

(assert (=> b!334692 m!338249))

(declare-fun m!338251 () Bool)

(assert (=> b!334692 m!338251))

(declare-fun m!338253 () Bool)

(assert (=> b!334698 m!338253))

(declare-fun m!338255 () Bool)

(assert (=> b!334696 m!338255))

(declare-fun m!338257 () Bool)

(assert (=> b!334690 m!338257))

(declare-fun m!338259 () Bool)

(assert (=> b!334700 m!338259))

(declare-fun m!338261 () Bool)

(assert (=> b!334700 m!338261))

(declare-fun m!338263 () Bool)

(assert (=> mapNonEmpty!11730 m!338263))

(declare-fun m!338265 () Bool)

(assert (=> b!334697 m!338265))

(declare-fun m!338267 () Bool)

(assert (=> start!33688 m!338267))

(declare-fun m!338269 () Bool)

(assert (=> start!33688 m!338269))

(declare-fun m!338271 () Bool)

(assert (=> start!33688 m!338271))

(assert (=> b!334699 m!338243))

(declare-fun m!338273 () Bool)

(assert (=> b!334699 m!338273))

(check-sat (not b!334696) (not b!334690) tp_is_empty!6889 (not b!334692) (not b!334697) (not b_next!6937) b_and!14091 (not mapNonEmpty!11730) (not b!334698) (not b!334699) (not b!334700) (not start!33688))
(check-sat b_and!14091 (not b_next!6937))
