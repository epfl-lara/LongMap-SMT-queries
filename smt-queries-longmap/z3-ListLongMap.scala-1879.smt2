; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33694 () Bool)

(assert start!33694)

(declare-fun b_free!6943 () Bool)

(declare-fun b_next!6943 () Bool)

(assert (=> start!33694 (= b_free!6943 (not b_next!6943))))

(declare-fun tp!24333 () Bool)

(declare-fun b_and!14137 () Bool)

(assert (=> start!33694 (= tp!24333 b_and!14137)))

(declare-fun b!335011 () Bool)

(declare-fun e!205635 () Bool)

(declare-fun e!205636 () Bool)

(assert (=> b!335011 (= e!205635 e!205636)))

(declare-fun res!184828 () Bool)

(assert (=> b!335011 (=> (not res!184828) (not e!205636))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3141 0))(
  ( (MissingZero!3141 (index!14743 (_ BitVec 32))) (Found!3141 (index!14744 (_ BitVec 32))) (Intermediate!3141 (undefined!3953 Bool) (index!14745 (_ BitVec 32)) (x!33352 (_ BitVec 32))) (Undefined!3141) (MissingVacant!3141 (index!14746 (_ BitVec 32))) )
))
(declare-fun lt!159715 () SeekEntryResult!3141)

(declare-datatypes ((array!17374 0))(
  ( (array!17375 (arr!8217 (Array (_ BitVec 32) (_ BitVec 64))) (size!8569 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17374)

(get-info :version)

(assert (=> b!335011 (= res!184828 (and ((_ is Found!3141) lt!159715) (= (select (arr!8217 _keys!1895) (index!14744 lt!159715)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17374 (_ BitVec 32)) SeekEntryResult!3141)

(assert (=> b!335011 (= lt!159715 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335012 () Bool)

(declare-fun e!205637 () Bool)

(declare-fun tp_is_empty!6895 () Bool)

(assert (=> b!335012 (= e!205637 tp_is_empty!6895)))

(declare-fun b!335013 () Bool)

(declare-fun res!184831 () Bool)

(declare-fun e!205631 () Bool)

(assert (=> b!335013 (=> (not res!184831) (not e!205631))))

(declare-datatypes ((V!10171 0))(
  ( (V!10172 (val!3492 Int)) )
))
(declare-datatypes ((ValueCell!3104 0))(
  ( (ValueCellFull!3104 (v!5655 V!10171)) (EmptyCell!3104) )
))
(declare-datatypes ((array!17376 0))(
  ( (array!17377 (arr!8218 (Array (_ BitVec 32) ValueCell!3104)) (size!8570 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17376)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335013 (= res!184831 (and (= (size!8570 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8569 _keys!1895) (size!8570 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335014 () Bool)

(declare-fun e!205632 () Bool)

(declare-fun e!205634 () Bool)

(declare-fun mapRes!11739 () Bool)

(assert (=> b!335014 (= e!205632 (and e!205634 mapRes!11739))))

(declare-fun condMapEmpty!11739 () Bool)

(declare-fun mapDefault!11739 () ValueCell!3104)

(assert (=> b!335014 (= condMapEmpty!11739 (= (arr!8218 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3104)) mapDefault!11739)))))

(declare-fun b!335015 () Bool)

(declare-fun res!184832 () Bool)

(assert (=> b!335015 (=> (not res!184832) (not e!205631))))

(declare-datatypes ((List!4608 0))(
  ( (Nil!4605) (Cons!4604 (h!5460 (_ BitVec 64)) (t!9688 List!4608)) )
))
(declare-fun arrayNoDuplicates!0 (array!17374 (_ BitVec 32) List!4608) Bool)

(assert (=> b!335015 (= res!184832 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4605))))

(declare-fun b!335016 () Bool)

(declare-fun res!184830 () Bool)

(assert (=> b!335016 (=> (not res!184830) (not e!205631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335016 (= res!184830 (validKeyInArray!0 k0!1348))))

(declare-fun b!335017 () Bool)

(declare-fun res!184829 () Bool)

(assert (=> b!335017 (=> (not res!184829) (not e!205636))))

(declare-fun arrayContainsKey!0 (array!17374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335017 (= res!184829 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14744 lt!159715)))))

(declare-fun b!335018 () Bool)

(assert (=> b!335018 (= e!205636 (not true))))

(declare-datatypes ((tuple2!4990 0))(
  ( (tuple2!4991 (_1!2506 (_ BitVec 64)) (_2!2506 V!10171)) )
))
(declare-datatypes ((List!4609 0))(
  ( (Nil!4606) (Cons!4605 (h!5461 tuple2!4990) (t!9689 List!4609)) )
))
(declare-datatypes ((ListLongMap!3905 0))(
  ( (ListLongMap!3906 (toList!1968 List!4609)) )
))
(declare-fun lt!159712 () ListLongMap!3905)

(declare-fun contains!2031 (ListLongMap!3905 (_ BitVec 64)) Bool)

(assert (=> b!335018 (contains!2031 lt!159712 (select (arr!8217 _keys!1895) (index!14744 lt!159715)))))

(declare-fun zeroValue!1467 () V!10171)

(declare-fun minValue!1467 () V!10171)

(declare-datatypes ((Unit!10401 0))(
  ( (Unit!10402) )
))
(declare-fun lt!159714 () Unit!10401)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lemmaValidKeyInArrayIsInListMap!158 (array!17374 array!17376 (_ BitVec 32) (_ BitVec 32) V!10171 V!10171 (_ BitVec 32) Int) Unit!10401)

(assert (=> b!335018 (= lt!159714 (lemmaValidKeyInArrayIsInListMap!158 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14744 lt!159715) defaultEntry!1528))))

(assert (=> b!335018 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159713 () Unit!10401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17374 (_ BitVec 64) (_ BitVec 32)) Unit!10401)

(assert (=> b!335018 (= lt!159713 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14744 lt!159715)))))

(declare-fun b!335019 () Bool)

(assert (=> b!335019 (= e!205634 tp_is_empty!6895)))

(declare-fun mapIsEmpty!11739 () Bool)

(assert (=> mapIsEmpty!11739 mapRes!11739))

(declare-fun b!335020 () Bool)

(declare-fun res!184825 () Bool)

(assert (=> b!335020 (=> (not res!184825) (not e!205631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17374 (_ BitVec 32)) Bool)

(assert (=> b!335020 (= res!184825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335021 () Bool)

(assert (=> b!335021 (= e!205631 e!205635)))

(declare-fun res!184827 () Bool)

(assert (=> b!335021 (=> (not res!184827) (not e!205635))))

(assert (=> b!335021 (= res!184827 (not (contains!2031 lt!159712 k0!1348)))))

(declare-fun getCurrentListMap!1499 (array!17374 array!17376 (_ BitVec 32) (_ BitVec 32) V!10171 V!10171 (_ BitVec 32) Int) ListLongMap!3905)

(assert (=> b!335021 (= lt!159712 (getCurrentListMap!1499 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun res!184826 () Bool)

(assert (=> start!33694 (=> (not res!184826) (not e!205631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33694 (= res!184826 (validMask!0 mask!2385))))

(assert (=> start!33694 e!205631))

(assert (=> start!33694 true))

(assert (=> start!33694 tp_is_empty!6895))

(assert (=> start!33694 tp!24333))

(declare-fun array_inv!6114 (array!17376) Bool)

(assert (=> start!33694 (and (array_inv!6114 _values!1525) e!205632)))

(declare-fun array_inv!6115 (array!17374) Bool)

(assert (=> start!33694 (array_inv!6115 _keys!1895)))

(declare-fun mapNonEmpty!11739 () Bool)

(declare-fun tp!24332 () Bool)

(assert (=> mapNonEmpty!11739 (= mapRes!11739 (and tp!24332 e!205637))))

(declare-fun mapRest!11739 () (Array (_ BitVec 32) ValueCell!3104))

(declare-fun mapKey!11739 () (_ BitVec 32))

(declare-fun mapValue!11739 () ValueCell!3104)

(assert (=> mapNonEmpty!11739 (= (arr!8218 _values!1525) (store mapRest!11739 mapKey!11739 mapValue!11739))))

(assert (= (and start!33694 res!184826) b!335013))

(assert (= (and b!335013 res!184831) b!335020))

(assert (= (and b!335020 res!184825) b!335015))

(assert (= (and b!335015 res!184832) b!335016))

(assert (= (and b!335016 res!184830) b!335021))

(assert (= (and b!335021 res!184827) b!335011))

(assert (= (and b!335011 res!184828) b!335017))

(assert (= (and b!335017 res!184829) b!335018))

(assert (= (and b!335014 condMapEmpty!11739) mapIsEmpty!11739))

(assert (= (and b!335014 (not condMapEmpty!11739)) mapNonEmpty!11739))

(assert (= (and mapNonEmpty!11739 ((_ is ValueCellFull!3104) mapValue!11739)) b!335012))

(assert (= (and b!335014 ((_ is ValueCellFull!3104) mapDefault!11739)) b!335019))

(assert (= start!33694 b!335014))

(declare-fun m!339293 () Bool)

(assert (=> b!335021 m!339293))

(declare-fun m!339295 () Bool)

(assert (=> b!335021 m!339295))

(declare-fun m!339297 () Bool)

(assert (=> b!335017 m!339297))

(declare-fun m!339299 () Bool)

(assert (=> b!335016 m!339299))

(declare-fun m!339301 () Bool)

(assert (=> b!335020 m!339301))

(declare-fun m!339303 () Bool)

(assert (=> b!335015 m!339303))

(declare-fun m!339305 () Bool)

(assert (=> start!33694 m!339305))

(declare-fun m!339307 () Bool)

(assert (=> start!33694 m!339307))

(declare-fun m!339309 () Bool)

(assert (=> start!33694 m!339309))

(declare-fun m!339311 () Bool)

(assert (=> b!335011 m!339311))

(declare-fun m!339313 () Bool)

(assert (=> b!335011 m!339313))

(assert (=> b!335018 m!339311))

(declare-fun m!339315 () Bool)

(assert (=> b!335018 m!339315))

(declare-fun m!339317 () Bool)

(assert (=> b!335018 m!339317))

(declare-fun m!339319 () Bool)

(assert (=> b!335018 m!339319))

(declare-fun m!339321 () Bool)

(assert (=> b!335018 m!339321))

(assert (=> b!335018 m!339311))

(declare-fun m!339323 () Bool)

(assert (=> mapNonEmpty!11739 m!339323))

(check-sat (not mapNonEmpty!11739) (not b!335011) (not b!335015) tp_is_empty!6895 (not b!335021) (not b!335017) (not b!335018) (not b!335020) b_and!14137 (not start!33694) (not b_next!6943) (not b!335016))
(check-sat b_and!14137 (not b_next!6943))
