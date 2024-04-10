; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33698 () Bool)

(assert start!33698)

(declare-fun b_free!6933 () Bool)

(declare-fun b_next!6933 () Bool)

(assert (=> start!33698 (= b_free!6933 (not b_next!6933))))

(declare-fun tp!24302 () Bool)

(declare-fun b_and!14113 () Bool)

(assert (=> start!33698 (= tp!24302 b_and!14113)))

(declare-fun b!334899 () Bool)

(declare-fun res!184712 () Bool)

(declare-fun e!205560 () Bool)

(assert (=> b!334899 (=> (not res!184712) (not e!205560))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17363 0))(
  ( (array!17364 (arr!8212 (Array (_ BitVec 32) (_ BitVec 64))) (size!8564 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17363)

(declare-datatypes ((SeekEntryResult!3173 0))(
  ( (MissingZero!3173 (index!14871 (_ BitVec 32))) (Found!3173 (index!14872 (_ BitVec 32))) (Intermediate!3173 (undefined!3985 Bool) (index!14873 (_ BitVec 32)) (x!33371 (_ BitVec 32))) (Undefined!3173) (MissingVacant!3173 (index!14874 (_ BitVec 32))) )
))
(declare-fun lt!159636 () SeekEntryResult!3173)

(declare-fun arrayContainsKey!0 (array!17363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334899 (= res!184712 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14872 lt!159636)))))

(declare-fun b!334900 () Bool)

(declare-fun res!184710 () Bool)

(declare-fun e!205565 () Bool)

(assert (=> b!334900 (=> (not res!184710) (not e!205565))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10157 0))(
  ( (V!10158 (val!3487 Int)) )
))
(declare-datatypes ((ValueCell!3099 0))(
  ( (ValueCellFull!3099 (v!5649 V!10157)) (EmptyCell!3099) )
))
(declare-datatypes ((array!17365 0))(
  ( (array!17366 (arr!8213 (Array (_ BitVec 32) ValueCell!3099)) (size!8565 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17365)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334900 (= res!184710 (and (= (size!8565 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8564 _keys!1895) (size!8565 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11724 () Bool)

(declare-fun mapRes!11724 () Bool)

(assert (=> mapIsEmpty!11724 mapRes!11724))

(declare-fun b!334901 () Bool)

(declare-fun e!205566 () Bool)

(assert (=> b!334901 (= e!205565 e!205566)))

(declare-fun res!184709 () Bool)

(assert (=> b!334901 (=> (not res!184709) (not e!205566))))

(declare-datatypes ((tuple2!5060 0))(
  ( (tuple2!5061 (_1!2541 (_ BitVec 64)) (_2!2541 V!10157)) )
))
(declare-datatypes ((List!4684 0))(
  ( (Nil!4681) (Cons!4680 (h!5536 tuple2!5060) (t!9772 List!4684)) )
))
(declare-datatypes ((ListLongMap!3973 0))(
  ( (ListLongMap!3974 (toList!2002 List!4684)) )
))
(declare-fun lt!159637 () ListLongMap!3973)

(declare-fun contains!2046 (ListLongMap!3973 (_ BitVec 64)) Bool)

(assert (=> b!334901 (= res!184709 (not (contains!2046 lt!159637 k0!1348)))))

(declare-fun zeroValue!1467 () V!10157)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10157)

(declare-fun getCurrentListMap!1530 (array!17363 array!17365 (_ BitVec 32) (_ BitVec 32) V!10157 V!10157 (_ BitVec 32) Int) ListLongMap!3973)

(assert (=> b!334901 (= lt!159637 (getCurrentListMap!1530 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334902 () Bool)

(declare-fun res!184715 () Bool)

(assert (=> b!334902 (=> (not res!184715) (not e!205565))))

(declare-datatypes ((List!4685 0))(
  ( (Nil!4682) (Cons!4681 (h!5537 (_ BitVec 64)) (t!9773 List!4685)) )
))
(declare-fun arrayNoDuplicates!0 (array!17363 (_ BitVec 32) List!4685) Bool)

(assert (=> b!334902 (= res!184715 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4682))))

(declare-fun res!184708 () Bool)

(assert (=> start!33698 (=> (not res!184708) (not e!205565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33698 (= res!184708 (validMask!0 mask!2385))))

(assert (=> start!33698 e!205565))

(assert (=> start!33698 true))

(declare-fun tp_is_empty!6885 () Bool)

(assert (=> start!33698 tp_is_empty!6885))

(assert (=> start!33698 tp!24302))

(declare-fun e!205561 () Bool)

(declare-fun array_inv!6104 (array!17365) Bool)

(assert (=> start!33698 (and (array_inv!6104 _values!1525) e!205561)))

(declare-fun array_inv!6105 (array!17363) Bool)

(assert (=> start!33698 (array_inv!6105 _keys!1895)))

(declare-fun b!334903 () Bool)

(declare-fun res!184711 () Bool)

(assert (=> b!334903 (=> (not res!184711) (not e!205565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17363 (_ BitVec 32)) Bool)

(assert (=> b!334903 (= res!184711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11724 () Bool)

(declare-fun tp!24303 () Bool)

(declare-fun e!205563 () Bool)

(assert (=> mapNonEmpty!11724 (= mapRes!11724 (and tp!24303 e!205563))))

(declare-fun mapRest!11724 () (Array (_ BitVec 32) ValueCell!3099))

(declare-fun mapValue!11724 () ValueCell!3099)

(declare-fun mapKey!11724 () (_ BitVec 32))

(assert (=> mapNonEmpty!11724 (= (arr!8213 _values!1525) (store mapRest!11724 mapKey!11724 mapValue!11724))))

(declare-fun b!334904 () Bool)

(assert (=> b!334904 (= e!205563 tp_is_empty!6885)))

(declare-fun b!334905 () Bool)

(assert (=> b!334905 (= e!205560 (not true))))

(assert (=> b!334905 (contains!2046 lt!159637 (select (arr!8212 _keys!1895) (index!14872 lt!159636)))))

(declare-datatypes ((Unit!10417 0))(
  ( (Unit!10418) )
))
(declare-fun lt!159635 () Unit!10417)

(declare-fun lemmaValidKeyInArrayIsInListMap!155 (array!17363 array!17365 (_ BitVec 32) (_ BitVec 32) V!10157 V!10157 (_ BitVec 32) Int) Unit!10417)

(assert (=> b!334905 (= lt!159635 (lemmaValidKeyInArrayIsInListMap!155 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14872 lt!159636) defaultEntry!1528))))

(assert (=> b!334905 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159634 () Unit!10417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17363 (_ BitVec 64) (_ BitVec 32)) Unit!10417)

(assert (=> b!334905 (= lt!159634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14872 lt!159636)))))

(declare-fun b!334906 () Bool)

(declare-fun e!205562 () Bool)

(assert (=> b!334906 (= e!205562 tp_is_empty!6885)))

(declare-fun b!334907 () Bool)

(assert (=> b!334907 (= e!205566 e!205560)))

(declare-fun res!184714 () Bool)

(assert (=> b!334907 (=> (not res!184714) (not e!205560))))

(get-info :version)

(assert (=> b!334907 (= res!184714 (and ((_ is Found!3173) lt!159636) (= (select (arr!8212 _keys!1895) (index!14872 lt!159636)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17363 (_ BitVec 32)) SeekEntryResult!3173)

(assert (=> b!334907 (= lt!159636 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334908 () Bool)

(declare-fun res!184713 () Bool)

(assert (=> b!334908 (=> (not res!184713) (not e!205565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334908 (= res!184713 (validKeyInArray!0 k0!1348))))

(declare-fun b!334909 () Bool)

(assert (=> b!334909 (= e!205561 (and e!205562 mapRes!11724))))

(declare-fun condMapEmpty!11724 () Bool)

(declare-fun mapDefault!11724 () ValueCell!3099)

(assert (=> b!334909 (= condMapEmpty!11724 (= (arr!8213 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3099)) mapDefault!11724)))))

(assert (= (and start!33698 res!184708) b!334900))

(assert (= (and b!334900 res!184710) b!334903))

(assert (= (and b!334903 res!184711) b!334902))

(assert (= (and b!334902 res!184715) b!334908))

(assert (= (and b!334908 res!184713) b!334901))

(assert (= (and b!334901 res!184709) b!334907))

(assert (= (and b!334907 res!184714) b!334899))

(assert (= (and b!334899 res!184712) b!334905))

(assert (= (and b!334909 condMapEmpty!11724) mapIsEmpty!11724))

(assert (= (and b!334909 (not condMapEmpty!11724)) mapNonEmpty!11724))

(assert (= (and mapNonEmpty!11724 ((_ is ValueCellFull!3099) mapValue!11724)) b!334904))

(assert (= (and b!334909 ((_ is ValueCellFull!3099) mapDefault!11724)) b!334906))

(assert (= start!33698 b!334909))

(declare-fun m!338909 () Bool)

(assert (=> b!334902 m!338909))

(declare-fun m!338911 () Bool)

(assert (=> b!334905 m!338911))

(declare-fun m!338913 () Bool)

(assert (=> b!334905 m!338913))

(declare-fun m!338915 () Bool)

(assert (=> b!334905 m!338915))

(declare-fun m!338917 () Bool)

(assert (=> b!334905 m!338917))

(declare-fun m!338919 () Bool)

(assert (=> b!334905 m!338919))

(assert (=> b!334905 m!338913))

(assert (=> b!334907 m!338913))

(declare-fun m!338921 () Bool)

(assert (=> b!334907 m!338921))

(declare-fun m!338923 () Bool)

(assert (=> b!334899 m!338923))

(declare-fun m!338925 () Bool)

(assert (=> b!334901 m!338925))

(declare-fun m!338927 () Bool)

(assert (=> b!334901 m!338927))

(declare-fun m!338929 () Bool)

(assert (=> start!33698 m!338929))

(declare-fun m!338931 () Bool)

(assert (=> start!33698 m!338931))

(declare-fun m!338933 () Bool)

(assert (=> start!33698 m!338933))

(declare-fun m!338935 () Bool)

(assert (=> mapNonEmpty!11724 m!338935))

(declare-fun m!338937 () Bool)

(assert (=> b!334908 m!338937))

(declare-fun m!338939 () Bool)

(assert (=> b!334903 m!338939))

(check-sat (not start!33698) (not b_next!6933) (not b!334902) (not b!334905) b_and!14113 tp_is_empty!6885 (not b!334908) (not mapNonEmpty!11724) (not b!334899) (not b!334907) (not b!334901) (not b!334903))
(check-sat b_and!14113 (not b_next!6933))
