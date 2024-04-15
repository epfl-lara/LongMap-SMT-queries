; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!836 () Bool)

(assert start!836)

(declare-fun b_free!229 () Bool)

(declare-fun b_next!229 () Bool)

(assert (=> start!836 (= b_free!229 (not b_next!229))))

(declare-fun tp!916 () Bool)

(declare-fun b_and!375 () Bool)

(assert (=> start!836 (= tp!916 b_and!375)))

(declare-fun b!6626 () Bool)

(declare-fun e!3653 () Bool)

(declare-fun e!3658 () Bool)

(declare-fun mapRes!431 () Bool)

(assert (=> b!6626 (= e!3653 (and e!3658 mapRes!431))))

(declare-fun condMapEmpty!431 () Bool)

(declare-datatypes ((V!587 0))(
  ( (V!588 (val!159 Int)) )
))
(declare-datatypes ((ValueCell!137 0))(
  ( (ValueCellFull!137 (v!1250 V!587)) (EmptyCell!137) )
))
(declare-datatypes ((array!537 0))(
  ( (array!538 (arr!257 (Array (_ BitVec 32) ValueCell!137)) (size!319 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!537)

(declare-fun mapDefault!431 () ValueCell!137)

(assert (=> b!6626 (= condMapEmpty!431 (= (arr!257 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!137)) mapDefault!431)))))

(declare-fun res!6940 () Bool)

(declare-fun e!3655 () Bool)

(assert (=> start!836 (=> (not res!6940) (not e!3655))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!836 (= res!6940 (validMask!0 mask!2250))))

(assert (=> start!836 e!3655))

(assert (=> start!836 tp!916))

(assert (=> start!836 true))

(declare-fun array_inv!185 (array!537) Bool)

(assert (=> start!836 (and (array_inv!185 _values!1492) e!3653)))

(declare-fun tp_is_empty!307 () Bool)

(assert (=> start!836 tp_is_empty!307))

(declare-datatypes ((array!539 0))(
  ( (array!540 (arr!258 (Array (_ BitVec 32) (_ BitVec 64))) (size!320 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!539)

(declare-fun array_inv!186 (array!539) Bool)

(assert (=> start!836 (array_inv!186 _keys!1806)))

(declare-fun b!6627 () Bool)

(declare-fun e!3652 () Bool)

(assert (=> b!6627 (= e!3652 true)))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!21 0))(
  ( (MissingZero!21 (index!2203 (_ BitVec 32))) (Found!21 (index!2204 (_ BitVec 32))) (Intermediate!21 (undefined!833 Bool) (index!2205 (_ BitVec 32)) (x!2543 (_ BitVec 32))) (Undefined!21) (MissingVacant!21 (index!2206 (_ BitVec 32))) )
))
(declare-fun lt!1265 () SeekEntryResult!21)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!539 (_ BitVec 32)) SeekEntryResult!21)

(assert (=> b!6627 (= lt!1265 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6628 () Bool)

(declare-fun e!3654 () Bool)

(assert (=> b!6628 (= e!3654 tp_is_empty!307)))

(declare-fun b!6629 () Bool)

(declare-fun e!3656 () Bool)

(declare-fun arrayContainsKey!0 (array!539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6629 (= e!3656 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!431 () Bool)

(assert (=> mapIsEmpty!431 mapRes!431))

(declare-fun b!6630 () Bool)

(declare-fun res!6933 () Bool)

(assert (=> b!6630 (=> (not res!6933) (not e!3655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6630 (= res!6933 (validKeyInArray!0 k0!1278))))

(declare-fun b!6631 () Bool)

(assert (=> b!6631 (= e!3658 tp_is_empty!307)))

(declare-fun b!6632 () Bool)

(declare-fun e!3659 () Bool)

(assert (=> b!6632 (= e!3659 e!3652)))

(declare-fun res!6939 () Bool)

(assert (=> b!6632 (=> res!6939 e!3652)))

(assert (=> b!6632 (= res!6939 (not (= (size!320 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!539 (_ BitVec 32)) Bool)

(assert (=> b!6632 (arrayForallSeekEntryOrOpenFound!0 lt!1266 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!117 0))(
  ( (Unit!118) )
))
(declare-fun lt!1264 () Unit!117)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!117)

(assert (=> b!6632 (= lt!1264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1266))))

(declare-fun arrayScanForKey!0 (array!539 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6632 (= lt!1266 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6633 () Bool)

(declare-fun res!6934 () Bool)

(assert (=> b!6633 (=> (not res!6934) (not e!3655))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!587)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!587)

(declare-datatypes ((tuple2!164 0))(
  ( (tuple2!165 (_1!82 (_ BitVec 64)) (_2!82 V!587)) )
))
(declare-datatypes ((List!173 0))(
  ( (Nil!170) (Cons!169 (h!735 tuple2!164) (t!2308 List!173)) )
))
(declare-datatypes ((ListLongMap!169 0))(
  ( (ListLongMap!170 (toList!100 List!173)) )
))
(declare-fun contains!74 (ListLongMap!169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!59 (array!539 array!537 (_ BitVec 32) (_ BitVec 32) V!587 V!587 (_ BitVec 32) Int) ListLongMap!169)

(assert (=> b!6633 (= res!6934 (contains!74 (getCurrentListMap!59 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6634 () Bool)

(declare-fun res!6938 () Bool)

(assert (=> b!6634 (=> (not res!6938) (not e!3655))))

(declare-datatypes ((List!174 0))(
  ( (Nil!171) (Cons!170 (h!736 (_ BitVec 64)) (t!2309 List!174)) )
))
(declare-fun arrayNoDuplicates!0 (array!539 (_ BitVec 32) List!174) Bool)

(assert (=> b!6634 (= res!6938 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!171))))

(declare-fun mapNonEmpty!431 () Bool)

(declare-fun tp!917 () Bool)

(assert (=> mapNonEmpty!431 (= mapRes!431 (and tp!917 e!3654))))

(declare-fun mapKey!431 () (_ BitVec 32))

(declare-fun mapValue!431 () ValueCell!137)

(declare-fun mapRest!431 () (Array (_ BitVec 32) ValueCell!137))

(assert (=> mapNonEmpty!431 (= (arr!257 _values!1492) (store mapRest!431 mapKey!431 mapValue!431))))

(declare-fun b!6635 () Bool)

(assert (=> b!6635 (= e!3655 (not e!3659))))

(declare-fun res!6935 () Bool)

(assert (=> b!6635 (=> res!6935 e!3659)))

(assert (=> b!6635 (= res!6935 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6635 e!3656))

(declare-fun c!476 () Bool)

(assert (=> b!6635 (= c!476 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1263 () Unit!117)

(declare-fun lemmaKeyInListMapIsInArray!42 (array!539 array!537 (_ BitVec 32) (_ BitVec 32) V!587 V!587 (_ BitVec 64) Int) Unit!117)

(assert (=> b!6635 (= lt!1263 (lemmaKeyInListMapIsInArray!42 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6636 () Bool)

(declare-fun res!6937 () Bool)

(assert (=> b!6636 (=> (not res!6937) (not e!3655))))

(assert (=> b!6636 (= res!6937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6637 () Bool)

(assert (=> b!6637 (= e!3656 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6638 () Bool)

(declare-fun res!6936 () Bool)

(assert (=> b!6638 (=> (not res!6936) (not e!3655))))

(assert (=> b!6638 (= res!6936 (and (= (size!319 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!320 _keys!1806) (size!319 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(assert (= (and start!836 res!6940) b!6638))

(assert (= (and b!6638 res!6936) b!6636))

(assert (= (and b!6636 res!6937) b!6634))

(assert (= (and b!6634 res!6938) b!6633))

(assert (= (and b!6633 res!6934) b!6630))

(assert (= (and b!6630 res!6933) b!6635))

(assert (= (and b!6635 c!476) b!6629))

(assert (= (and b!6635 (not c!476)) b!6637))

(assert (= (and b!6635 (not res!6935)) b!6632))

(assert (= (and b!6632 (not res!6939)) b!6627))

(assert (= (and b!6626 condMapEmpty!431) mapIsEmpty!431))

(assert (= (and b!6626 (not condMapEmpty!431)) mapNonEmpty!431))

(get-info :version)

(assert (= (and mapNonEmpty!431 ((_ is ValueCellFull!137) mapValue!431)) b!6628))

(assert (= (and b!6626 ((_ is ValueCellFull!137) mapDefault!431)) b!6631))

(assert (= start!836 b!6626))

(declare-fun m!3857 () Bool)

(assert (=> b!6632 m!3857))

(declare-fun m!3859 () Bool)

(assert (=> b!6632 m!3859))

(declare-fun m!3861 () Bool)

(assert (=> b!6632 m!3861))

(declare-fun m!3863 () Bool)

(assert (=> b!6634 m!3863))

(declare-fun m!3865 () Bool)

(assert (=> b!6629 m!3865))

(declare-fun m!3867 () Bool)

(assert (=> b!6633 m!3867))

(assert (=> b!6633 m!3867))

(declare-fun m!3869 () Bool)

(assert (=> b!6633 m!3869))

(declare-fun m!3871 () Bool)

(assert (=> b!6630 m!3871))

(declare-fun m!3873 () Bool)

(assert (=> mapNonEmpty!431 m!3873))

(declare-fun m!3875 () Bool)

(assert (=> start!836 m!3875))

(declare-fun m!3877 () Bool)

(assert (=> start!836 m!3877))

(declare-fun m!3879 () Bool)

(assert (=> start!836 m!3879))

(declare-fun m!3881 () Bool)

(assert (=> b!6636 m!3881))

(assert (=> b!6635 m!3865))

(declare-fun m!3883 () Bool)

(assert (=> b!6635 m!3883))

(declare-fun m!3885 () Bool)

(assert (=> b!6627 m!3885))

(check-sat (not b!6627) (not b!6636) (not b_next!229) (not start!836) (not b!6633) tp_is_empty!307 (not mapNonEmpty!431) (not b!6632) (not b!6634) (not b!6635) (not b!6629) (not b!6630) b_and!375)
(check-sat b_and!375 (not b_next!229))
