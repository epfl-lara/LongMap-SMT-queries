; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33712 () Bool)

(assert start!33712)

(declare-fun b_free!6961 () Bool)

(declare-fun b_next!6961 () Bool)

(assert (=> start!33712 (= b_free!6961 (not b_next!6961))))

(declare-fun tp!24386 () Bool)

(declare-fun b_and!14155 () Bool)

(assert (=> start!33712 (= tp!24386 b_and!14155)))

(declare-fun b!335308 () Bool)

(declare-fun res!185041 () Bool)

(declare-fun e!205820 () Bool)

(assert (=> b!335308 (=> (not res!185041) (not e!205820))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335308 (= res!185041 (validKeyInArray!0 k0!1348))))

(declare-fun b!335309 () Bool)

(declare-fun e!205825 () Bool)

(declare-fun tp_is_empty!6913 () Bool)

(assert (=> b!335309 (= e!205825 tp_is_empty!6913)))

(declare-fun b!335310 () Bool)

(declare-fun e!205821 () Bool)

(assert (=> b!335310 (= e!205821 (not true))))

(declare-datatypes ((V!10195 0))(
  ( (V!10196 (val!3501 Int)) )
))
(declare-datatypes ((tuple2!5004 0))(
  ( (tuple2!5005 (_1!2513 (_ BitVec 64)) (_2!2513 V!10195)) )
))
(declare-datatypes ((List!4622 0))(
  ( (Nil!4619) (Cons!4618 (h!5474 tuple2!5004) (t!9702 List!4622)) )
))
(declare-datatypes ((ListLongMap!3919 0))(
  ( (ListLongMap!3920 (toList!1975 List!4622)) )
))
(declare-fun lt!159820 () ListLongMap!3919)

(declare-datatypes ((array!17408 0))(
  ( (array!17409 (arr!8234 (Array (_ BitVec 32) (_ BitVec 64))) (size!8586 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17408)

(declare-datatypes ((SeekEntryResult!3148 0))(
  ( (MissingZero!3148 (index!14771 (_ BitVec 32))) (Found!3148 (index!14772 (_ BitVec 32))) (Intermediate!3148 (undefined!3960 Bool) (index!14773 (_ BitVec 32)) (x!33383 (_ BitVec 32))) (Undefined!3148) (MissingVacant!3148 (index!14774 (_ BitVec 32))) )
))
(declare-fun lt!159822 () SeekEntryResult!3148)

(declare-fun contains!2038 (ListLongMap!3919 (_ BitVec 64)) Bool)

(assert (=> b!335310 (contains!2038 lt!159820 (select (arr!8234 _keys!1895) (index!14772 lt!159822)))))

(declare-datatypes ((Unit!10413 0))(
  ( (Unit!10414) )
))
(declare-fun lt!159821 () Unit!10413)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3113 0))(
  ( (ValueCellFull!3113 (v!5664 V!10195)) (EmptyCell!3113) )
))
(declare-datatypes ((array!17410 0))(
  ( (array!17411 (arr!8235 (Array (_ BitVec 32) ValueCell!3113)) (size!8587 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17410)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10195)

(declare-fun zeroValue!1467 () V!10195)

(declare-fun lemmaValidKeyInArrayIsInListMap!164 (array!17408 array!17410 (_ BitVec 32) (_ BitVec 32) V!10195 V!10195 (_ BitVec 32) Int) Unit!10413)

(assert (=> b!335310 (= lt!159821 (lemmaValidKeyInArrayIsInListMap!164 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14772 lt!159822) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335310 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159823 () Unit!10413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17408 (_ BitVec 64) (_ BitVec 32)) Unit!10413)

(assert (=> b!335310 (= lt!159823 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14772 lt!159822)))))

(declare-fun b!335311 () Bool)

(declare-fun e!205822 () Bool)

(assert (=> b!335311 (= e!205822 tp_is_empty!6913)))

(declare-fun mapNonEmpty!11766 () Bool)

(declare-fun mapRes!11766 () Bool)

(declare-fun tp!24387 () Bool)

(assert (=> mapNonEmpty!11766 (= mapRes!11766 (and tp!24387 e!205825))))

(declare-fun mapKey!11766 () (_ BitVec 32))

(declare-fun mapValue!11766 () ValueCell!3113)

(declare-fun mapRest!11766 () (Array (_ BitVec 32) ValueCell!3113))

(assert (=> mapNonEmpty!11766 (= (arr!8235 _values!1525) (store mapRest!11766 mapKey!11766 mapValue!11766))))

(declare-fun b!335313 () Bool)

(declare-fun e!205824 () Bool)

(assert (=> b!335313 (= e!205824 (and e!205822 mapRes!11766))))

(declare-fun condMapEmpty!11766 () Bool)

(declare-fun mapDefault!11766 () ValueCell!3113)

(assert (=> b!335313 (= condMapEmpty!11766 (= (arr!8235 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3113)) mapDefault!11766)))))

(declare-fun b!335314 () Bool)

(declare-fun res!185043 () Bool)

(assert (=> b!335314 (=> (not res!185043) (not e!205820))))

(assert (=> b!335314 (= res!185043 (and (= (size!8587 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8586 _keys!1895) (size!8587 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335315 () Bool)

(declare-fun e!205823 () Bool)

(assert (=> b!335315 (= e!205820 e!205823)))

(declare-fun res!185045 () Bool)

(assert (=> b!335315 (=> (not res!185045) (not e!205823))))

(assert (=> b!335315 (= res!185045 (not (contains!2038 lt!159820 k0!1348)))))

(declare-fun getCurrentListMap!1505 (array!17408 array!17410 (_ BitVec 32) (_ BitVec 32) V!10195 V!10195 (_ BitVec 32) Int) ListLongMap!3919)

(assert (=> b!335315 (= lt!159820 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun mapIsEmpty!11766 () Bool)

(assert (=> mapIsEmpty!11766 mapRes!11766))

(declare-fun b!335316 () Bool)

(declare-fun res!185048 () Bool)

(assert (=> b!335316 (=> (not res!185048) (not e!205821))))

(assert (=> b!335316 (= res!185048 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14772 lt!159822)))))

(declare-fun res!185047 () Bool)

(assert (=> start!33712 (=> (not res!185047) (not e!205820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33712 (= res!185047 (validMask!0 mask!2385))))

(assert (=> start!33712 e!205820))

(assert (=> start!33712 true))

(assert (=> start!33712 tp_is_empty!6913))

(assert (=> start!33712 tp!24386))

(declare-fun array_inv!6126 (array!17410) Bool)

(assert (=> start!33712 (and (array_inv!6126 _values!1525) e!205824)))

(declare-fun array_inv!6127 (array!17408) Bool)

(assert (=> start!33712 (array_inv!6127 _keys!1895)))

(declare-fun b!335312 () Bool)

(assert (=> b!335312 (= e!205823 e!205821)))

(declare-fun res!185046 () Bool)

(assert (=> b!335312 (=> (not res!185046) (not e!205821))))

(get-info :version)

(assert (=> b!335312 (= res!185046 (and ((_ is Found!3148) lt!159822) (= (select (arr!8234 _keys!1895) (index!14772 lt!159822)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17408 (_ BitVec 32)) SeekEntryResult!3148)

(assert (=> b!335312 (= lt!159822 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335317 () Bool)

(declare-fun res!185044 () Bool)

(assert (=> b!335317 (=> (not res!185044) (not e!205820))))

(declare-datatypes ((List!4623 0))(
  ( (Nil!4620) (Cons!4619 (h!5475 (_ BitVec 64)) (t!9703 List!4623)) )
))
(declare-fun arrayNoDuplicates!0 (array!17408 (_ BitVec 32) List!4623) Bool)

(assert (=> b!335317 (= res!185044 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4620))))

(declare-fun b!335318 () Bool)

(declare-fun res!185042 () Bool)

(assert (=> b!335318 (=> (not res!185042) (not e!205820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17408 (_ BitVec 32)) Bool)

(assert (=> b!335318 (= res!185042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33712 res!185047) b!335314))

(assert (= (and b!335314 res!185043) b!335318))

(assert (= (and b!335318 res!185042) b!335317))

(assert (= (and b!335317 res!185044) b!335308))

(assert (= (and b!335308 res!185041) b!335315))

(assert (= (and b!335315 res!185045) b!335312))

(assert (= (and b!335312 res!185046) b!335316))

(assert (= (and b!335316 res!185048) b!335310))

(assert (= (and b!335313 condMapEmpty!11766) mapIsEmpty!11766))

(assert (= (and b!335313 (not condMapEmpty!11766)) mapNonEmpty!11766))

(assert (= (and mapNonEmpty!11766 ((_ is ValueCellFull!3113) mapValue!11766)) b!335309))

(assert (= (and b!335313 ((_ is ValueCellFull!3113) mapDefault!11766)) b!335311))

(assert (= start!33712 b!335313))

(declare-fun m!339581 () Bool)

(assert (=> b!335308 m!339581))

(declare-fun m!339583 () Bool)

(assert (=> b!335315 m!339583))

(declare-fun m!339585 () Bool)

(assert (=> b!335315 m!339585))

(declare-fun m!339587 () Bool)

(assert (=> b!335318 m!339587))

(declare-fun m!339589 () Bool)

(assert (=> mapNonEmpty!11766 m!339589))

(declare-fun m!339591 () Bool)

(assert (=> b!335317 m!339591))

(declare-fun m!339593 () Bool)

(assert (=> start!33712 m!339593))

(declare-fun m!339595 () Bool)

(assert (=> start!33712 m!339595))

(declare-fun m!339597 () Bool)

(assert (=> start!33712 m!339597))

(declare-fun m!339599 () Bool)

(assert (=> b!335310 m!339599))

(declare-fun m!339601 () Bool)

(assert (=> b!335310 m!339601))

(declare-fun m!339603 () Bool)

(assert (=> b!335310 m!339603))

(assert (=> b!335310 m!339599))

(declare-fun m!339605 () Bool)

(assert (=> b!335310 m!339605))

(declare-fun m!339607 () Bool)

(assert (=> b!335310 m!339607))

(assert (=> b!335312 m!339599))

(declare-fun m!339609 () Bool)

(assert (=> b!335312 m!339609))

(declare-fun m!339611 () Bool)

(assert (=> b!335316 m!339611))

(check-sat (not b!335312) (not b!335310) (not mapNonEmpty!11766) (not b!335315) (not start!33712) (not b!335316) (not b_next!6961) (not b!335318) (not b!335308) (not b!335317) tp_is_empty!6913 b_and!14155)
(check-sat b_and!14155 (not b_next!6961))
