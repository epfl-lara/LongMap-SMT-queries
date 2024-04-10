; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33868 () Bool)

(assert start!33868)

(declare-fun b_free!7047 () Bool)

(declare-fun b_next!7047 () Bool)

(assert (=> start!33868 (= b_free!7047 (not b_next!7047))))

(declare-fun tp!24653 () Bool)

(declare-fun b_and!14233 () Bool)

(assert (=> start!33868 (= tp!24653 b_and!14233)))

(declare-fun b!337096 () Bool)

(declare-fun res!186149 () Bool)

(declare-fun e!206875 () Bool)

(assert (=> b!337096 (=> (not res!186149) (not e!206875))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10309 0))(
  ( (V!10310 (val!3544 Int)) )
))
(declare-datatypes ((ValueCell!3156 0))(
  ( (ValueCellFull!3156 (v!5709 V!10309)) (EmptyCell!3156) )
))
(declare-datatypes ((array!17593 0))(
  ( (array!17594 (arr!8324 (Array (_ BitVec 32) ValueCell!3156)) (size!8676 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17593)

(declare-datatypes ((array!17595 0))(
  ( (array!17596 (arr!8325 (Array (_ BitVec 32) (_ BitVec 64))) (size!8677 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17595)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337096 (= res!186149 (and (= (size!8676 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8677 _keys!1895) (size!8676 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337097 () Bool)

(declare-fun res!186148 () Bool)

(assert (=> b!337097 (=> (not res!186148) (not e!206875))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10309)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10309)

(declare-datatypes ((tuple2!5148 0))(
  ( (tuple2!5149 (_1!2585 (_ BitVec 64)) (_2!2585 V!10309)) )
))
(declare-datatypes ((List!4763 0))(
  ( (Nil!4760) (Cons!4759 (h!5615 tuple2!5148) (t!9857 List!4763)) )
))
(declare-datatypes ((ListLongMap!4061 0))(
  ( (ListLongMap!4062 (toList!2046 List!4763)) )
))
(declare-fun contains!2093 (ListLongMap!4061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1567 (array!17595 array!17593 (_ BitVec 32) (_ BitVec 32) V!10309 V!10309 (_ BitVec 32) Int) ListLongMap!4061)

(assert (=> b!337097 (= res!186148 (not (contains!2093 (getCurrentListMap!1567 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337098 () Bool)

(declare-fun e!206879 () Bool)

(assert (=> b!337098 (= e!206879 false)))

(declare-fun lt!160371 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17595 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337098 (= lt!160371 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11904 () Bool)

(declare-fun mapRes!11904 () Bool)

(declare-fun tp!24654 () Bool)

(declare-fun e!206878 () Bool)

(assert (=> mapNonEmpty!11904 (= mapRes!11904 (and tp!24654 e!206878))))

(declare-fun mapValue!11904 () ValueCell!3156)

(declare-fun mapRest!11904 () (Array (_ BitVec 32) ValueCell!3156))

(declare-fun mapKey!11904 () (_ BitVec 32))

(assert (=> mapNonEmpty!11904 (= (arr!8324 _values!1525) (store mapRest!11904 mapKey!11904 mapValue!11904))))

(declare-fun b!337099 () Bool)

(declare-fun tp_is_empty!6999 () Bool)

(assert (=> b!337099 (= e!206878 tp_is_empty!6999)))

(declare-fun b!337100 () Bool)

(declare-fun res!186146 () Bool)

(assert (=> b!337100 (=> (not res!186146) (not e!206875))))

(declare-datatypes ((List!4764 0))(
  ( (Nil!4761) (Cons!4760 (h!5616 (_ BitVec 64)) (t!9858 List!4764)) )
))
(declare-fun arrayNoDuplicates!0 (array!17595 (_ BitVec 32) List!4764) Bool)

(assert (=> b!337100 (= res!186146 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4761))))

(declare-fun b!337101 () Bool)

(declare-fun e!206877 () Bool)

(assert (=> b!337101 (= e!206877 tp_is_empty!6999)))

(declare-fun b!337102 () Bool)

(assert (=> b!337102 (= e!206875 e!206879)))

(declare-fun res!186150 () Bool)

(assert (=> b!337102 (=> (not res!186150) (not e!206879))))

(declare-datatypes ((SeekEntryResult!3217 0))(
  ( (MissingZero!3217 (index!15047 (_ BitVec 32))) (Found!3217 (index!15048 (_ BitVec 32))) (Intermediate!3217 (undefined!4029 Bool) (index!15049 (_ BitVec 32)) (x!33597 (_ BitVec 32))) (Undefined!3217) (MissingVacant!3217 (index!15050 (_ BitVec 32))) )
))
(declare-fun lt!160372 () SeekEntryResult!3217)

(get-info :version)

(assert (=> b!337102 (= res!186150 (and (not ((_ is Found!3217) lt!160372)) ((_ is MissingZero!3217) lt!160372)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17595 (_ BitVec 32)) SeekEntryResult!3217)

(assert (=> b!337102 (= lt!160372 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337095 () Bool)

(declare-fun e!206876 () Bool)

(assert (=> b!337095 (= e!206876 (and e!206877 mapRes!11904))))

(declare-fun condMapEmpty!11904 () Bool)

(declare-fun mapDefault!11904 () ValueCell!3156)

(assert (=> b!337095 (= condMapEmpty!11904 (= (arr!8324 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3156)) mapDefault!11904)))))

(declare-fun res!186152 () Bool)

(assert (=> start!33868 (=> (not res!186152) (not e!206875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33868 (= res!186152 (validMask!0 mask!2385))))

(assert (=> start!33868 e!206875))

(assert (=> start!33868 true))

(assert (=> start!33868 tp_is_empty!6999))

(assert (=> start!33868 tp!24653))

(declare-fun array_inv!6180 (array!17593) Bool)

(assert (=> start!33868 (and (array_inv!6180 _values!1525) e!206876)))

(declare-fun array_inv!6181 (array!17595) Bool)

(assert (=> start!33868 (array_inv!6181 _keys!1895)))

(declare-fun mapIsEmpty!11904 () Bool)

(assert (=> mapIsEmpty!11904 mapRes!11904))

(declare-fun b!337103 () Bool)

(declare-fun res!186147 () Bool)

(assert (=> b!337103 (=> (not res!186147) (not e!206879))))

(declare-fun arrayContainsKey!0 (array!17595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337103 (= res!186147 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337104 () Bool)

(declare-fun res!186151 () Bool)

(assert (=> b!337104 (=> (not res!186151) (not e!206875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337104 (= res!186151 (validKeyInArray!0 k0!1348))))

(declare-fun b!337105 () Bool)

(declare-fun res!186145 () Bool)

(assert (=> b!337105 (=> (not res!186145) (not e!206875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17595 (_ BitVec 32)) Bool)

(assert (=> b!337105 (= res!186145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33868 res!186152) b!337096))

(assert (= (and b!337096 res!186149) b!337105))

(assert (= (and b!337105 res!186145) b!337100))

(assert (= (and b!337100 res!186146) b!337104))

(assert (= (and b!337104 res!186151) b!337097))

(assert (= (and b!337097 res!186148) b!337102))

(assert (= (and b!337102 res!186150) b!337103))

(assert (= (and b!337103 res!186147) b!337098))

(assert (= (and b!337095 condMapEmpty!11904) mapIsEmpty!11904))

(assert (= (and b!337095 (not condMapEmpty!11904)) mapNonEmpty!11904))

(assert (= (and mapNonEmpty!11904 ((_ is ValueCellFull!3156) mapValue!11904)) b!337099))

(assert (= (and b!337095 ((_ is ValueCellFull!3156) mapDefault!11904)) b!337101))

(assert (= start!33868 b!337095))

(declare-fun m!340715 () Bool)

(assert (=> b!337105 m!340715))

(declare-fun m!340717 () Bool)

(assert (=> b!337103 m!340717))

(declare-fun m!340719 () Bool)

(assert (=> b!337098 m!340719))

(declare-fun m!340721 () Bool)

(assert (=> b!337097 m!340721))

(assert (=> b!337097 m!340721))

(declare-fun m!340723 () Bool)

(assert (=> b!337097 m!340723))

(declare-fun m!340725 () Bool)

(assert (=> start!33868 m!340725))

(declare-fun m!340727 () Bool)

(assert (=> start!33868 m!340727))

(declare-fun m!340729 () Bool)

(assert (=> start!33868 m!340729))

(declare-fun m!340731 () Bool)

(assert (=> mapNonEmpty!11904 m!340731))

(declare-fun m!340733 () Bool)

(assert (=> b!337100 m!340733))

(declare-fun m!340735 () Bool)

(assert (=> b!337104 m!340735))

(declare-fun m!340737 () Bool)

(assert (=> b!337102 m!340737))

(check-sat (not b!337098) b_and!14233 (not b_next!7047) (not b!337104) (not b!337105) (not b!337097) (not b!337103) (not b!337100) (not mapNonEmpty!11904) (not b!337102) tp_is_empty!6999 (not start!33868))
(check-sat b_and!14233 (not b_next!7047))
