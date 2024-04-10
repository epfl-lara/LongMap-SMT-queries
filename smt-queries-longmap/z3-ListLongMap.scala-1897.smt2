; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33874 () Bool)

(assert start!33874)

(declare-fun b_free!7053 () Bool)

(declare-fun b_next!7053 () Bool)

(assert (=> start!33874 (= b_free!7053 (not b_next!7053))))

(declare-fun tp!24671 () Bool)

(declare-fun b_and!14239 () Bool)

(assert (=> start!33874 (= tp!24671 b_and!14239)))

(declare-fun b!337194 () Bool)

(declare-fun res!186220 () Bool)

(declare-fun e!206929 () Bool)

(assert (=> b!337194 (=> (not res!186220) (not e!206929))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10317 0))(
  ( (V!10318 (val!3547 Int)) )
))
(declare-fun zeroValue!1467 () V!10317)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3159 0))(
  ( (ValueCellFull!3159 (v!5712 V!10317)) (EmptyCell!3159) )
))
(declare-datatypes ((array!17605 0))(
  ( (array!17606 (arr!8330 (Array (_ BitVec 32) ValueCell!3159)) (size!8682 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17605)

(declare-datatypes ((array!17607 0))(
  ( (array!17608 (arr!8331 (Array (_ BitVec 32) (_ BitVec 64))) (size!8683 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17607)

(declare-fun minValue!1467 () V!10317)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5152 0))(
  ( (tuple2!5153 (_1!2587 (_ BitVec 64)) (_2!2587 V!10317)) )
))
(declare-datatypes ((List!4767 0))(
  ( (Nil!4764) (Cons!4763 (h!5619 tuple2!5152) (t!9861 List!4767)) )
))
(declare-datatypes ((ListLongMap!4065 0))(
  ( (ListLongMap!4066 (toList!2048 List!4767)) )
))
(declare-fun contains!2095 (ListLongMap!4065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1569 (array!17607 array!17605 (_ BitVec 32) (_ BitVec 32) V!10317 V!10317 (_ BitVec 32) Int) ListLongMap!4065)

(assert (=> b!337194 (= res!186220 (not (contains!2095 (getCurrentListMap!1569 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337195 () Bool)

(declare-fun res!186221 () Bool)

(assert (=> b!337195 (=> (not res!186221) (not e!206929))))

(assert (=> b!337195 (= res!186221 (and (= (size!8682 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8683 _keys!1895) (size!8682 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!186218 () Bool)

(assert (=> start!33874 (=> (not res!186218) (not e!206929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33874 (= res!186218 (validMask!0 mask!2385))))

(assert (=> start!33874 e!206929))

(assert (=> start!33874 true))

(declare-fun tp_is_empty!7005 () Bool)

(assert (=> start!33874 tp_is_empty!7005))

(assert (=> start!33874 tp!24671))

(declare-fun e!206934 () Bool)

(declare-fun array_inv!6184 (array!17605) Bool)

(assert (=> start!33874 (and (array_inv!6184 _values!1525) e!206934)))

(declare-fun array_inv!6185 (array!17607) Bool)

(assert (=> start!33874 (array_inv!6185 _keys!1895)))

(declare-fun b!337196 () Bool)

(declare-fun e!206930 () Bool)

(assert (=> b!337196 (= e!206930 tp_is_empty!7005)))

(declare-fun b!337197 () Bool)

(declare-fun res!186217 () Bool)

(declare-fun e!206932 () Bool)

(assert (=> b!337197 (=> (not res!186217) (not e!206932))))

(declare-fun arrayContainsKey!0 (array!17607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337197 (= res!186217 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337198 () Bool)

(assert (=> b!337198 (= e!206929 e!206932)))

(declare-fun res!186219 () Bool)

(assert (=> b!337198 (=> (not res!186219) (not e!206932))))

(declare-datatypes ((SeekEntryResult!3219 0))(
  ( (MissingZero!3219 (index!15055 (_ BitVec 32))) (Found!3219 (index!15056 (_ BitVec 32))) (Intermediate!3219 (undefined!4031 Bool) (index!15057 (_ BitVec 32)) (x!33607 (_ BitVec 32))) (Undefined!3219) (MissingVacant!3219 (index!15058 (_ BitVec 32))) )
))
(declare-fun lt!160389 () SeekEntryResult!3219)

(get-info :version)

(assert (=> b!337198 (= res!186219 (and (not ((_ is Found!3219) lt!160389)) ((_ is MissingZero!3219) lt!160389)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17607 (_ BitVec 32)) SeekEntryResult!3219)

(assert (=> b!337198 (= lt!160389 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337199 () Bool)

(declare-fun res!186224 () Bool)

(assert (=> b!337199 (=> (not res!186224) (not e!206929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17607 (_ BitVec 32)) Bool)

(assert (=> b!337199 (= res!186224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337200 () Bool)

(declare-fun e!206931 () Bool)

(assert (=> b!337200 (= e!206931 tp_is_empty!7005)))

(declare-fun b!337201 () Bool)

(declare-fun mapRes!11913 () Bool)

(assert (=> b!337201 (= e!206934 (and e!206930 mapRes!11913))))

(declare-fun condMapEmpty!11913 () Bool)

(declare-fun mapDefault!11913 () ValueCell!3159)

(assert (=> b!337201 (= condMapEmpty!11913 (= (arr!8330 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3159)) mapDefault!11913)))))

(declare-fun b!337202 () Bool)

(declare-fun res!186223 () Bool)

(assert (=> b!337202 (=> (not res!186223) (not e!206929))))

(declare-datatypes ((List!4768 0))(
  ( (Nil!4765) (Cons!4764 (h!5620 (_ BitVec 64)) (t!9862 List!4768)) )
))
(declare-fun arrayNoDuplicates!0 (array!17607 (_ BitVec 32) List!4768) Bool)

(assert (=> b!337202 (= res!186223 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4765))))

(declare-fun b!337203 () Bool)

(declare-fun res!186222 () Bool)

(assert (=> b!337203 (=> (not res!186222) (not e!206929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337203 (= res!186222 (validKeyInArray!0 k0!1348))))

(declare-fun b!337204 () Bool)

(assert (=> b!337204 (= e!206932 false)))

(declare-fun lt!160390 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17607 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337204 (= lt!160390 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11913 () Bool)

(declare-fun tp!24672 () Bool)

(assert (=> mapNonEmpty!11913 (= mapRes!11913 (and tp!24672 e!206931))))

(declare-fun mapRest!11913 () (Array (_ BitVec 32) ValueCell!3159))

(declare-fun mapKey!11913 () (_ BitVec 32))

(declare-fun mapValue!11913 () ValueCell!3159)

(assert (=> mapNonEmpty!11913 (= (arr!8330 _values!1525) (store mapRest!11913 mapKey!11913 mapValue!11913))))

(declare-fun mapIsEmpty!11913 () Bool)

(assert (=> mapIsEmpty!11913 mapRes!11913))

(assert (= (and start!33874 res!186218) b!337195))

(assert (= (and b!337195 res!186221) b!337199))

(assert (= (and b!337199 res!186224) b!337202))

(assert (= (and b!337202 res!186223) b!337203))

(assert (= (and b!337203 res!186222) b!337194))

(assert (= (and b!337194 res!186220) b!337198))

(assert (= (and b!337198 res!186219) b!337197))

(assert (= (and b!337197 res!186217) b!337204))

(assert (= (and b!337201 condMapEmpty!11913) mapIsEmpty!11913))

(assert (= (and b!337201 (not condMapEmpty!11913)) mapNonEmpty!11913))

(assert (= (and mapNonEmpty!11913 ((_ is ValueCellFull!3159) mapValue!11913)) b!337200))

(assert (= (and b!337201 ((_ is ValueCellFull!3159) mapDefault!11913)) b!337196))

(assert (= start!33874 b!337201))

(declare-fun m!340787 () Bool)

(assert (=> b!337203 m!340787))

(declare-fun m!340789 () Bool)

(assert (=> mapNonEmpty!11913 m!340789))

(declare-fun m!340791 () Bool)

(assert (=> b!337204 m!340791))

(declare-fun m!340793 () Bool)

(assert (=> b!337197 m!340793))

(declare-fun m!340795 () Bool)

(assert (=> b!337199 m!340795))

(declare-fun m!340797 () Bool)

(assert (=> start!33874 m!340797))

(declare-fun m!340799 () Bool)

(assert (=> start!33874 m!340799))

(declare-fun m!340801 () Bool)

(assert (=> start!33874 m!340801))

(declare-fun m!340803 () Bool)

(assert (=> b!337194 m!340803))

(assert (=> b!337194 m!340803))

(declare-fun m!340805 () Bool)

(assert (=> b!337194 m!340805))

(declare-fun m!340807 () Bool)

(assert (=> b!337198 m!340807))

(declare-fun m!340809 () Bool)

(assert (=> b!337202 m!340809))

(check-sat (not b!337204) (not b!337202) (not mapNonEmpty!11913) (not start!33874) (not b!337197) (not b!337199) (not b!337194) b_and!14239 (not b_next!7053) (not b!337203) tp_is_empty!7005 (not b!337198))
(check-sat b_and!14239 (not b_next!7053))
