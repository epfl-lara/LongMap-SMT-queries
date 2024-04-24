; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33688 () Bool)

(assert start!33688)

(declare-fun b_free!6937 () Bool)

(declare-fun b_next!6937 () Bool)

(assert (=> start!33688 (= b_free!6937 (not b_next!6937))))

(declare-fun tp!24315 () Bool)

(declare-fun b_and!14131 () Bool)

(assert (=> start!33688 (= tp!24315 b_and!14131)))

(declare-fun b!334912 () Bool)

(declare-fun res!184754 () Bool)

(declare-fun e!205569 () Bool)

(assert (=> b!334912 (=> (not res!184754) (not e!205569))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334912 (= res!184754 (validKeyInArray!0 k0!1348))))

(declare-fun b!334913 () Bool)

(declare-fun e!205568 () Bool)

(assert (=> b!334913 (= e!205568 (not true))))

(declare-datatypes ((V!10163 0))(
  ( (V!10164 (val!3489 Int)) )
))
(declare-datatypes ((tuple2!4988 0))(
  ( (tuple2!4989 (_1!2505 (_ BitVec 64)) (_2!2505 V!10163)) )
))
(declare-datatypes ((List!4605 0))(
  ( (Nil!4602) (Cons!4601 (h!5457 tuple2!4988) (t!9685 List!4605)) )
))
(declare-datatypes ((ListLongMap!3903 0))(
  ( (ListLongMap!3904 (toList!1967 List!4605)) )
))
(declare-fun lt!159678 () ListLongMap!3903)

(declare-datatypes ((array!17364 0))(
  ( (array!17365 (arr!8212 (Array (_ BitVec 32) (_ BitVec 64))) (size!8564 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17364)

(declare-datatypes ((SeekEntryResult!3139 0))(
  ( (MissingZero!3139 (index!14735 (_ BitVec 32))) (Found!3139 (index!14736 (_ BitVec 32))) (Intermediate!3139 (undefined!3951 Bool) (index!14737 (_ BitVec 32)) (x!33342 (_ BitVec 32))) (Undefined!3139) (MissingVacant!3139 (index!14738 (_ BitVec 32))) )
))
(declare-fun lt!159679 () SeekEntryResult!3139)

(declare-fun contains!2030 (ListLongMap!3903 (_ BitVec 64)) Bool)

(assert (=> b!334913 (contains!2030 lt!159678 (select (arr!8212 _keys!1895) (index!14736 lt!159679)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10163)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10163)

(declare-datatypes ((Unit!10399 0))(
  ( (Unit!10400) )
))
(declare-fun lt!159677 () Unit!10399)

(declare-datatypes ((ValueCell!3101 0))(
  ( (ValueCellFull!3101 (v!5652 V!10163)) (EmptyCell!3101) )
))
(declare-datatypes ((array!17366 0))(
  ( (array!17367 (arr!8213 (Array (_ BitVec 32) ValueCell!3101)) (size!8565 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17366)

(declare-fun lemmaValidKeyInArrayIsInListMap!157 (array!17364 array!17366 (_ BitVec 32) (_ BitVec 32) V!10163 V!10163 (_ BitVec 32) Int) Unit!10399)

(assert (=> b!334913 (= lt!159677 (lemmaValidKeyInArrayIsInListMap!157 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14736 lt!159679) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334913 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159676 () Unit!10399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17364 (_ BitVec 64) (_ BitVec 32)) Unit!10399)

(assert (=> b!334913 (= lt!159676 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14736 lt!159679)))))

(declare-fun b!334914 () Bool)

(declare-fun e!205571 () Bool)

(declare-fun tp_is_empty!6889 () Bool)

(assert (=> b!334914 (= e!205571 tp_is_empty!6889)))

(declare-fun b!334915 () Bool)

(declare-fun e!205572 () Bool)

(assert (=> b!334915 (= e!205572 tp_is_empty!6889)))

(declare-fun b!334916 () Bool)

(declare-fun res!184758 () Bool)

(assert (=> b!334916 (=> (not res!184758) (not e!205569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17364 (_ BitVec 32)) Bool)

(assert (=> b!334916 (= res!184758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11730 () Bool)

(declare-fun mapRes!11730 () Bool)

(declare-fun tp!24314 () Bool)

(assert (=> mapNonEmpty!11730 (= mapRes!11730 (and tp!24314 e!205572))))

(declare-fun mapKey!11730 () (_ BitVec 32))

(declare-fun mapValue!11730 () ValueCell!3101)

(declare-fun mapRest!11730 () (Array (_ BitVec 32) ValueCell!3101))

(assert (=> mapNonEmpty!11730 (= (arr!8213 _values!1525) (store mapRest!11730 mapKey!11730 mapValue!11730))))

(declare-fun b!334917 () Bool)

(declare-fun res!184755 () Bool)

(assert (=> b!334917 (=> (not res!184755) (not e!205569))))

(assert (=> b!334917 (= res!184755 (and (= (size!8565 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8564 _keys!1895) (size!8565 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334918 () Bool)

(declare-fun e!205573 () Bool)

(assert (=> b!334918 (= e!205569 e!205573)))

(declare-fun res!184759 () Bool)

(assert (=> b!334918 (=> (not res!184759) (not e!205573))))

(assert (=> b!334918 (= res!184759 (not (contains!2030 lt!159678 k0!1348)))))

(declare-fun getCurrentListMap!1498 (array!17364 array!17366 (_ BitVec 32) (_ BitVec 32) V!10163 V!10163 (_ BitVec 32) Int) ListLongMap!3903)

(assert (=> b!334918 (= lt!159678 (getCurrentListMap!1498 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334919 () Bool)

(assert (=> b!334919 (= e!205573 e!205568)))

(declare-fun res!184760 () Bool)

(assert (=> b!334919 (=> (not res!184760) (not e!205568))))

(get-info :version)

(assert (=> b!334919 (= res!184760 (and ((_ is Found!3139) lt!159679) (= (select (arr!8212 _keys!1895) (index!14736 lt!159679)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17364 (_ BitVec 32)) SeekEntryResult!3139)

(assert (=> b!334919 (= lt!159679 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334920 () Bool)

(declare-fun e!205574 () Bool)

(assert (=> b!334920 (= e!205574 (and e!205571 mapRes!11730))))

(declare-fun condMapEmpty!11730 () Bool)

(declare-fun mapDefault!11730 () ValueCell!3101)

(assert (=> b!334920 (= condMapEmpty!11730 (= (arr!8213 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3101)) mapDefault!11730)))))

(declare-fun b!334921 () Bool)

(declare-fun res!184753 () Bool)

(assert (=> b!334921 (=> (not res!184753) (not e!205569))))

(declare-datatypes ((List!4606 0))(
  ( (Nil!4603) (Cons!4602 (h!5458 (_ BitVec 64)) (t!9686 List!4606)) )
))
(declare-fun arrayNoDuplicates!0 (array!17364 (_ BitVec 32) List!4606) Bool)

(assert (=> b!334921 (= res!184753 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4603))))

(declare-fun b!334922 () Bool)

(declare-fun res!184756 () Bool)

(assert (=> b!334922 (=> (not res!184756) (not e!205568))))

(assert (=> b!334922 (= res!184756 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14736 lt!159679)))))

(declare-fun res!184757 () Bool)

(assert (=> start!33688 (=> (not res!184757) (not e!205569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33688 (= res!184757 (validMask!0 mask!2385))))

(assert (=> start!33688 e!205569))

(assert (=> start!33688 true))

(assert (=> start!33688 tp_is_empty!6889))

(assert (=> start!33688 tp!24315))

(declare-fun array_inv!6110 (array!17366) Bool)

(assert (=> start!33688 (and (array_inv!6110 _values!1525) e!205574)))

(declare-fun array_inv!6111 (array!17364) Bool)

(assert (=> start!33688 (array_inv!6111 _keys!1895)))

(declare-fun mapIsEmpty!11730 () Bool)

(assert (=> mapIsEmpty!11730 mapRes!11730))

(assert (= (and start!33688 res!184757) b!334917))

(assert (= (and b!334917 res!184755) b!334916))

(assert (= (and b!334916 res!184758) b!334921))

(assert (= (and b!334921 res!184753) b!334912))

(assert (= (and b!334912 res!184754) b!334918))

(assert (= (and b!334918 res!184759) b!334919))

(assert (= (and b!334919 res!184760) b!334922))

(assert (= (and b!334922 res!184756) b!334913))

(assert (= (and b!334920 condMapEmpty!11730) mapIsEmpty!11730))

(assert (= (and b!334920 (not condMapEmpty!11730)) mapNonEmpty!11730))

(assert (= (and mapNonEmpty!11730 ((_ is ValueCellFull!3101) mapValue!11730)) b!334915))

(assert (= (and b!334920 ((_ is ValueCellFull!3101) mapDefault!11730)) b!334914))

(assert (= start!33688 b!334920))

(declare-fun m!339197 () Bool)

(assert (=> b!334922 m!339197))

(declare-fun m!339199 () Bool)

(assert (=> b!334918 m!339199))

(declare-fun m!339201 () Bool)

(assert (=> b!334918 m!339201))

(declare-fun m!339203 () Bool)

(assert (=> b!334913 m!339203))

(declare-fun m!339205 () Bool)

(assert (=> b!334913 m!339205))

(declare-fun m!339207 () Bool)

(assert (=> b!334913 m!339207))

(assert (=> b!334913 m!339205))

(declare-fun m!339209 () Bool)

(assert (=> b!334913 m!339209))

(declare-fun m!339211 () Bool)

(assert (=> b!334913 m!339211))

(assert (=> b!334919 m!339205))

(declare-fun m!339213 () Bool)

(assert (=> b!334919 m!339213))

(declare-fun m!339215 () Bool)

(assert (=> start!33688 m!339215))

(declare-fun m!339217 () Bool)

(assert (=> start!33688 m!339217))

(declare-fun m!339219 () Bool)

(assert (=> start!33688 m!339219))

(declare-fun m!339221 () Bool)

(assert (=> b!334921 m!339221))

(declare-fun m!339223 () Bool)

(assert (=> b!334916 m!339223))

(declare-fun m!339225 () Bool)

(assert (=> b!334912 m!339225))

(declare-fun m!339227 () Bool)

(assert (=> mapNonEmpty!11730 m!339227))

(check-sat (not b!334922) (not mapNonEmpty!11730) (not b!334921) (not start!33688) tp_is_empty!6889 (not b!334918) (not b!334916) (not b!334912) (not b!334913) (not b!334919) b_and!14131 (not b_next!6937))
(check-sat b_and!14131 (not b_next!6937))
