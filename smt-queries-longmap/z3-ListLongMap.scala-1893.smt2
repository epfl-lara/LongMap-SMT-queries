; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33850 () Bool)

(assert start!33850)

(declare-fun b_free!7029 () Bool)

(declare-fun b_next!7029 () Bool)

(assert (=> start!33850 (= b_free!7029 (not b_next!7029))))

(declare-fun tp!24600 () Bool)

(declare-fun b_and!14215 () Bool)

(assert (=> start!33850 (= tp!24600 b_and!14215)))

(declare-fun mapIsEmpty!11877 () Bool)

(declare-fun mapRes!11877 () Bool)

(assert (=> mapIsEmpty!11877 mapRes!11877))

(declare-fun b!336798 () Bool)

(declare-fun res!185931 () Bool)

(declare-fun e!206716 () Bool)

(assert (=> b!336798 (=> (not res!185931) (not e!206716))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336798 (= res!185931 (validKeyInArray!0 k0!1348))))

(declare-fun b!336799 () Bool)

(declare-fun res!185935 () Bool)

(assert (=> b!336799 (=> (not res!185935) (not e!206716))))

(declare-datatypes ((array!17559 0))(
  ( (array!17560 (arr!8307 (Array (_ BitVec 32) (_ BitVec 64))) (size!8659 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17559)

(declare-datatypes ((List!4750 0))(
  ( (Nil!4747) (Cons!4746 (h!5602 (_ BitVec 64)) (t!9844 List!4750)) )
))
(declare-fun arrayNoDuplicates!0 (array!17559 (_ BitVec 32) List!4750) Bool)

(assert (=> b!336799 (= res!185935 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4747))))

(declare-fun res!185930 () Bool)

(assert (=> start!33850 (=> (not res!185930) (not e!206716))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33850 (= res!185930 (validMask!0 mask!2385))))

(assert (=> start!33850 e!206716))

(assert (=> start!33850 true))

(declare-fun tp_is_empty!6981 () Bool)

(assert (=> start!33850 tp_is_empty!6981))

(assert (=> start!33850 tp!24600))

(declare-datatypes ((V!10285 0))(
  ( (V!10286 (val!3535 Int)) )
))
(declare-datatypes ((ValueCell!3147 0))(
  ( (ValueCellFull!3147 (v!5700 V!10285)) (EmptyCell!3147) )
))
(declare-datatypes ((array!17561 0))(
  ( (array!17562 (arr!8308 (Array (_ BitVec 32) ValueCell!3147)) (size!8660 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17561)

(declare-fun e!206715 () Bool)

(declare-fun array_inv!6166 (array!17561) Bool)

(assert (=> start!33850 (and (array_inv!6166 _values!1525) e!206715)))

(declare-fun array_inv!6167 (array!17559) Bool)

(assert (=> start!33850 (array_inv!6167 _keys!1895)))

(declare-fun b!336800 () Bool)

(declare-fun e!206714 () Bool)

(assert (=> b!336800 (= e!206716 e!206714)))

(declare-fun res!185932 () Bool)

(assert (=> b!336800 (=> (not res!185932) (not e!206714))))

(declare-datatypes ((SeekEntryResult!3210 0))(
  ( (MissingZero!3210 (index!15019 (_ BitVec 32))) (Found!3210 (index!15020 (_ BitVec 32))) (Intermediate!3210 (undefined!4022 Bool) (index!15021 (_ BitVec 32)) (x!33566 (_ BitVec 32))) (Undefined!3210) (MissingVacant!3210 (index!15022 (_ BitVec 32))) )
))
(declare-fun lt!160317 () SeekEntryResult!3210)

(get-info :version)

(assert (=> b!336800 (= res!185932 (and (not ((_ is Found!3210) lt!160317)) ((_ is MissingZero!3210) lt!160317)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17559 (_ BitVec 32)) SeekEntryResult!3210)

(assert (=> b!336800 (= lt!160317 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11877 () Bool)

(declare-fun tp!24599 () Bool)

(declare-fun e!206713 () Bool)

(assert (=> mapNonEmpty!11877 (= mapRes!11877 (and tp!24599 e!206713))))

(declare-fun mapRest!11877 () (Array (_ BitVec 32) ValueCell!3147))

(declare-fun mapKey!11877 () (_ BitVec 32))

(declare-fun mapValue!11877 () ValueCell!3147)

(assert (=> mapNonEmpty!11877 (= (arr!8308 _values!1525) (store mapRest!11877 mapKey!11877 mapValue!11877))))

(declare-fun b!336801 () Bool)

(declare-fun res!185934 () Bool)

(assert (=> b!336801 (=> (not res!185934) (not e!206716))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10285)

(declare-fun zeroValue!1467 () V!10285)

(declare-datatypes ((tuple2!5134 0))(
  ( (tuple2!5135 (_1!2578 (_ BitVec 64)) (_2!2578 V!10285)) )
))
(declare-datatypes ((List!4751 0))(
  ( (Nil!4748) (Cons!4747 (h!5603 tuple2!5134) (t!9845 List!4751)) )
))
(declare-datatypes ((ListLongMap!4047 0))(
  ( (ListLongMap!4048 (toList!2039 List!4751)) )
))
(declare-fun contains!2086 (ListLongMap!4047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1560 (array!17559 array!17561 (_ BitVec 32) (_ BitVec 32) V!10285 V!10285 (_ BitVec 32) Int) ListLongMap!4047)

(assert (=> b!336801 (= res!185934 (not (contains!2086 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336802 () Bool)

(declare-fun e!206717 () Bool)

(assert (=> b!336802 (= e!206717 tp_is_empty!6981)))

(declare-fun b!336803 () Bool)

(declare-fun res!185929 () Bool)

(assert (=> b!336803 (=> (not res!185929) (not e!206716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17559 (_ BitVec 32)) Bool)

(assert (=> b!336803 (= res!185929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336804 () Bool)

(assert (=> b!336804 (= e!206713 tp_is_empty!6981)))

(declare-fun b!336805 () Bool)

(declare-fun res!185933 () Bool)

(assert (=> b!336805 (=> (not res!185933) (not e!206714))))

(declare-fun arrayContainsKey!0 (array!17559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336805 (= res!185933 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336806 () Bool)

(assert (=> b!336806 (= e!206715 (and e!206717 mapRes!11877))))

(declare-fun condMapEmpty!11877 () Bool)

(declare-fun mapDefault!11877 () ValueCell!3147)

(assert (=> b!336806 (= condMapEmpty!11877 (= (arr!8308 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3147)) mapDefault!11877)))))

(declare-fun b!336807 () Bool)

(declare-fun res!185936 () Bool)

(assert (=> b!336807 (=> (not res!185936) (not e!206716))))

(assert (=> b!336807 (= res!185936 (and (= (size!8660 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8659 _keys!1895) (size!8660 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336808 () Bool)

(assert (=> b!336808 (= e!206714 false)))

(declare-fun lt!160318 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17559 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336808 (= lt!160318 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!33850 res!185930) b!336807))

(assert (= (and b!336807 res!185936) b!336803))

(assert (= (and b!336803 res!185929) b!336799))

(assert (= (and b!336799 res!185935) b!336798))

(assert (= (and b!336798 res!185931) b!336801))

(assert (= (and b!336801 res!185934) b!336800))

(assert (= (and b!336800 res!185932) b!336805))

(assert (= (and b!336805 res!185933) b!336808))

(assert (= (and b!336806 condMapEmpty!11877) mapIsEmpty!11877))

(assert (= (and b!336806 (not condMapEmpty!11877)) mapNonEmpty!11877))

(assert (= (and mapNonEmpty!11877 ((_ is ValueCellFull!3147) mapValue!11877)) b!336804))

(assert (= (and b!336806 ((_ is ValueCellFull!3147) mapDefault!11877)) b!336802))

(assert (= start!33850 b!336806))

(declare-fun m!340499 () Bool)

(assert (=> b!336799 m!340499))

(declare-fun m!340501 () Bool)

(assert (=> b!336803 m!340501))

(declare-fun m!340503 () Bool)

(assert (=> b!336798 m!340503))

(declare-fun m!340505 () Bool)

(assert (=> b!336808 m!340505))

(declare-fun m!340507 () Bool)

(assert (=> b!336801 m!340507))

(assert (=> b!336801 m!340507))

(declare-fun m!340509 () Bool)

(assert (=> b!336801 m!340509))

(declare-fun m!340511 () Bool)

(assert (=> b!336800 m!340511))

(declare-fun m!340513 () Bool)

(assert (=> start!33850 m!340513))

(declare-fun m!340515 () Bool)

(assert (=> start!33850 m!340515))

(declare-fun m!340517 () Bool)

(assert (=> start!33850 m!340517))

(declare-fun m!340519 () Bool)

(assert (=> mapNonEmpty!11877 m!340519))

(declare-fun m!340521 () Bool)

(assert (=> b!336805 m!340521))

(check-sat (not b!336803) (not b!336800) (not start!33850) b_and!14215 (not b!336799) (not b!336801) tp_is_empty!6981 (not b_next!7029) (not mapNonEmpty!11877) (not b!336805) (not b!336798) (not b!336808))
(check-sat b_and!14215 (not b_next!7029))
