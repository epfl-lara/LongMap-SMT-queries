; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33994 () Bool)

(assert start!33994)

(declare-fun b_free!7125 () Bool)

(declare-fun b_next!7125 () Bool)

(assert (=> start!33994 (= b_free!7125 (not b_next!7125))))

(declare-fun tp!24893 () Bool)

(declare-fun b_and!14315 () Bool)

(assert (=> start!33994 (= tp!24893 b_and!14315)))

(declare-fun b!338729 () Bool)

(declare-fun e!207826 () Bool)

(assert (=> b!338729 (= e!207826 false)))

(declare-datatypes ((Unit!10531 0))(
  ( (Unit!10532) )
))
(declare-fun lt!160886 () Unit!10531)

(declare-fun e!207831 () Unit!10531)

(assert (=> b!338729 (= lt!160886 e!207831)))

(declare-fun c!52449 () Bool)

(declare-datatypes ((array!17749 0))(
  ( (array!17750 (arr!8400 (Array (_ BitVec 32) (_ BitVec 64))) (size!8752 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17749)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338729 (= c!52449 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338730 () Bool)

(declare-fun res!187121 () Bool)

(declare-fun e!207830 () Bool)

(assert (=> b!338730 (=> (not res!187121) (not e!207830))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17749 (_ BitVec 32)) Bool)

(assert (=> b!338730 (= res!187121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338731 () Bool)

(declare-fun res!187117 () Bool)

(assert (=> b!338731 (=> (not res!187117) (not e!207830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338731 (= res!187117 (validKeyInArray!0 k0!1348))))

(declare-fun b!338732 () Bool)

(declare-fun e!207827 () Bool)

(declare-fun e!207829 () Bool)

(declare-fun mapRes!12027 () Bool)

(assert (=> b!338732 (= e!207827 (and e!207829 mapRes!12027))))

(declare-fun condMapEmpty!12027 () Bool)

(declare-datatypes ((V!10413 0))(
  ( (V!10414 (val!3583 Int)) )
))
(declare-datatypes ((ValueCell!3195 0))(
  ( (ValueCellFull!3195 (v!5750 V!10413)) (EmptyCell!3195) )
))
(declare-datatypes ((array!17751 0))(
  ( (array!17752 (arr!8401 (Array (_ BitVec 32) ValueCell!3195)) (size!8753 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17751)

(declare-fun mapDefault!12027 () ValueCell!3195)

(assert (=> b!338732 (= condMapEmpty!12027 (= (arr!8401 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3195)) mapDefault!12027)))))

(declare-fun b!338733 () Bool)

(assert (=> b!338733 (= e!207830 e!207826)))

(declare-fun res!187119 () Bool)

(assert (=> b!338733 (=> (not res!187119) (not e!207826))))

(declare-datatypes ((SeekEntryResult!3245 0))(
  ( (MissingZero!3245 (index!15159 (_ BitVec 32))) (Found!3245 (index!15160 (_ BitVec 32))) (Intermediate!3245 (undefined!4057 Bool) (index!15161 (_ BitVec 32)) (x!33749 (_ BitVec 32))) (Undefined!3245) (MissingVacant!3245 (index!15162 (_ BitVec 32))) )
))
(declare-fun lt!160888 () SeekEntryResult!3245)

(get-info :version)

(assert (=> b!338733 (= res!187119 (and (not ((_ is Found!3245) lt!160888)) ((_ is MissingZero!3245) lt!160888)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17749 (_ BitVec 32)) SeekEntryResult!3245)

(assert (=> b!338733 (= lt!160888 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12027 () Bool)

(assert (=> mapIsEmpty!12027 mapRes!12027))

(declare-fun b!338734 () Bool)

(declare-fun e!207825 () Bool)

(declare-fun tp_is_empty!7077 () Bool)

(assert (=> b!338734 (= e!207825 tp_is_empty!7077)))

(declare-fun b!338735 () Bool)

(declare-fun Unit!10533 () Unit!10531)

(assert (=> b!338735 (= e!207831 Unit!10533)))

(declare-fun res!187115 () Bool)

(assert (=> start!33994 (=> (not res!187115) (not e!207830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33994 (= res!187115 (validMask!0 mask!2385))))

(assert (=> start!33994 e!207830))

(assert (=> start!33994 true))

(assert (=> start!33994 tp_is_empty!7077))

(assert (=> start!33994 tp!24893))

(declare-fun array_inv!6228 (array!17751) Bool)

(assert (=> start!33994 (and (array_inv!6228 _values!1525) e!207827)))

(declare-fun array_inv!6229 (array!17749) Bool)

(assert (=> start!33994 (array_inv!6229 _keys!1895)))

(declare-fun b!338728 () Bool)

(declare-fun res!187118 () Bool)

(assert (=> b!338728 (=> (not res!187118) (not e!207830))))

(declare-datatypes ((List!4819 0))(
  ( (Nil!4816) (Cons!4815 (h!5671 (_ BitVec 64)) (t!9917 List!4819)) )
))
(declare-fun arrayNoDuplicates!0 (array!17749 (_ BitVec 32) List!4819) Bool)

(assert (=> b!338728 (= res!187118 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4816))))

(declare-fun b!338736 () Bool)

(declare-fun Unit!10534 () Unit!10531)

(assert (=> b!338736 (= e!207831 Unit!10534)))

(declare-fun zeroValue!1467 () V!10413)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!160887 () Unit!10531)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10413)

(declare-fun lemmaArrayContainsKeyThenInListMap!276 (array!17749 array!17751 (_ BitVec 32) (_ BitVec 32) V!10413 V!10413 (_ BitVec 64) (_ BitVec 32) Int) Unit!10531)

(declare-fun arrayScanForKey!0 (array!17749 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338736 (= lt!160887 (lemmaArrayContainsKeyThenInListMap!276 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338736 false))

(declare-fun b!338737 () Bool)

(declare-fun res!187116 () Bool)

(assert (=> b!338737 (=> (not res!187116) (not e!207830))))

(assert (=> b!338737 (= res!187116 (and (= (size!8753 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8752 _keys!1895) (size!8753 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12027 () Bool)

(declare-fun tp!24894 () Bool)

(assert (=> mapNonEmpty!12027 (= mapRes!12027 (and tp!24894 e!207825))))

(declare-fun mapValue!12027 () ValueCell!3195)

(declare-fun mapKey!12027 () (_ BitVec 32))

(declare-fun mapRest!12027 () (Array (_ BitVec 32) ValueCell!3195))

(assert (=> mapNonEmpty!12027 (= (arr!8401 _values!1525) (store mapRest!12027 mapKey!12027 mapValue!12027))))

(declare-fun b!338738 () Bool)

(declare-fun res!187120 () Bool)

(assert (=> b!338738 (=> (not res!187120) (not e!207830))))

(declare-datatypes ((tuple2!5204 0))(
  ( (tuple2!5205 (_1!2613 (_ BitVec 64)) (_2!2613 V!10413)) )
))
(declare-datatypes ((List!4820 0))(
  ( (Nil!4817) (Cons!4816 (h!5672 tuple2!5204) (t!9918 List!4820)) )
))
(declare-datatypes ((ListLongMap!4117 0))(
  ( (ListLongMap!4118 (toList!2074 List!4820)) )
))
(declare-fun contains!2123 (ListLongMap!4117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1595 (array!17749 array!17751 (_ BitVec 32) (_ BitVec 32) V!10413 V!10413 (_ BitVec 32) Int) ListLongMap!4117)

(assert (=> b!338738 (= res!187120 (not (contains!2123 (getCurrentListMap!1595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338739 () Bool)

(assert (=> b!338739 (= e!207829 tp_is_empty!7077)))

(assert (= (and start!33994 res!187115) b!338737))

(assert (= (and b!338737 res!187116) b!338730))

(assert (= (and b!338730 res!187121) b!338728))

(assert (= (and b!338728 res!187118) b!338731))

(assert (= (and b!338731 res!187117) b!338738))

(assert (= (and b!338738 res!187120) b!338733))

(assert (= (and b!338733 res!187119) b!338729))

(assert (= (and b!338729 c!52449) b!338736))

(assert (= (and b!338729 (not c!52449)) b!338735))

(assert (= (and b!338732 condMapEmpty!12027) mapIsEmpty!12027))

(assert (= (and b!338732 (not condMapEmpty!12027)) mapNonEmpty!12027))

(assert (= (and mapNonEmpty!12027 ((_ is ValueCellFull!3195) mapValue!12027)) b!338734))

(assert (= (and b!338732 ((_ is ValueCellFull!3195) mapDefault!12027)) b!338739))

(assert (= start!33994 b!338732))

(declare-fun m!341899 () Bool)

(assert (=> b!338733 m!341899))

(declare-fun m!341901 () Bool)

(assert (=> b!338728 m!341901))

(declare-fun m!341903 () Bool)

(assert (=> b!338736 m!341903))

(assert (=> b!338736 m!341903))

(declare-fun m!341905 () Bool)

(assert (=> b!338736 m!341905))

(declare-fun m!341907 () Bool)

(assert (=> mapNonEmpty!12027 m!341907))

(declare-fun m!341909 () Bool)

(assert (=> b!338730 m!341909))

(declare-fun m!341911 () Bool)

(assert (=> b!338731 m!341911))

(declare-fun m!341913 () Bool)

(assert (=> start!33994 m!341913))

(declare-fun m!341915 () Bool)

(assert (=> start!33994 m!341915))

(declare-fun m!341917 () Bool)

(assert (=> start!33994 m!341917))

(declare-fun m!341919 () Bool)

(assert (=> b!338729 m!341919))

(declare-fun m!341921 () Bool)

(assert (=> b!338738 m!341921))

(assert (=> b!338738 m!341921))

(declare-fun m!341923 () Bool)

(assert (=> b!338738 m!341923))

(check-sat (not b!338730) (not b!338738) (not mapNonEmpty!12027) b_and!14315 (not b!338731) (not b!338733) (not b!338736) (not b!338728) (not b_next!7125) (not start!33994) tp_is_empty!7077 (not b!338729))
(check-sat b_and!14315 (not b_next!7125))
