; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33626 () Bool)

(assert start!33626)

(declare-fun b_free!6861 () Bool)

(declare-fun b_next!6861 () Bool)

(assert (=> start!33626 (= b_free!6861 (not b_next!6861))))

(declare-fun tp!24086 () Bool)

(declare-fun b_and!14041 () Bool)

(assert (=> start!33626 (= tp!24086 b_and!14041)))

(declare-fun b!333719 () Bool)

(declare-fun res!183857 () Bool)

(declare-fun e!204906 () Bool)

(assert (=> b!333719 (=> (not res!183857) (not e!204906))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10061 0))(
  ( (V!10062 (val!3451 Int)) )
))
(declare-fun zeroValue!1467 () V!10061)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17221 0))(
  ( (array!17222 (arr!8141 (Array (_ BitVec 32) (_ BitVec 64))) (size!8493 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17221)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10061)

(declare-datatypes ((ValueCell!3063 0))(
  ( (ValueCellFull!3063 (v!5613 V!10061)) (EmptyCell!3063) )
))
(declare-datatypes ((array!17223 0))(
  ( (array!17224 (arr!8142 (Array (_ BitVec 32) ValueCell!3063)) (size!8494 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17223)

(declare-datatypes ((tuple2!5016 0))(
  ( (tuple2!5017 (_1!2519 (_ BitVec 64)) (_2!2519 V!10061)) )
))
(declare-datatypes ((List!4634 0))(
  ( (Nil!4631) (Cons!4630 (h!5486 tuple2!5016) (t!9722 List!4634)) )
))
(declare-datatypes ((ListLongMap!3929 0))(
  ( (ListLongMap!3930 (toList!1980 List!4634)) )
))
(declare-fun contains!2024 (ListLongMap!3929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1508 (array!17221 array!17223 (_ BitVec 32) (_ BitVec 32) V!10061 V!10061 (_ BitVec 32) Int) ListLongMap!3929)

(assert (=> b!333719 (= res!183857 (not (contains!2024 (getCurrentListMap!1508 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333720 () Bool)

(declare-fun res!183852 () Bool)

(assert (=> b!333720 (=> (not res!183852) (not e!204906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17221 (_ BitVec 32)) Bool)

(assert (=> b!333720 (= res!183852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333721 () Bool)

(declare-fun e!204905 () Bool)

(declare-fun tp_is_empty!6813 () Bool)

(assert (=> b!333721 (= e!204905 tp_is_empty!6813)))

(declare-fun b!333722 () Bool)

(assert (=> b!333722 (= e!204906 false)))

(declare-datatypes ((SeekEntryResult!3143 0))(
  ( (MissingZero!3143 (index!14751 (_ BitVec 32))) (Found!3143 (index!14752 (_ BitVec 32))) (Intermediate!3143 (undefined!3955 Bool) (index!14753 (_ BitVec 32)) (x!33245 (_ BitVec 32))) (Undefined!3143) (MissingVacant!3143 (index!14754 (_ BitVec 32))) )
))
(declare-fun lt!159394 () SeekEntryResult!3143)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17221 (_ BitVec 32)) SeekEntryResult!3143)

(assert (=> b!333722 (= lt!159394 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333723 () Bool)

(declare-fun res!183856 () Bool)

(assert (=> b!333723 (=> (not res!183856) (not e!204906))))

(assert (=> b!333723 (= res!183856 (and (= (size!8494 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8493 _keys!1895) (size!8494 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11616 () Bool)

(declare-fun mapRes!11616 () Bool)

(assert (=> mapIsEmpty!11616 mapRes!11616))

(declare-fun b!333724 () Bool)

(declare-fun res!183855 () Bool)

(assert (=> b!333724 (=> (not res!183855) (not e!204906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333724 (= res!183855 (validKeyInArray!0 k0!1348))))

(declare-fun res!183853 () Bool)

(assert (=> start!33626 (=> (not res!183853) (not e!204906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33626 (= res!183853 (validMask!0 mask!2385))))

(assert (=> start!33626 e!204906))

(assert (=> start!33626 true))

(assert (=> start!33626 tp_is_empty!6813))

(assert (=> start!33626 tp!24086))

(declare-fun e!204903 () Bool)

(declare-fun array_inv!6054 (array!17223) Bool)

(assert (=> start!33626 (and (array_inv!6054 _values!1525) e!204903)))

(declare-fun array_inv!6055 (array!17221) Bool)

(assert (=> start!33626 (array_inv!6055 _keys!1895)))

(declare-fun mapNonEmpty!11616 () Bool)

(declare-fun tp!24087 () Bool)

(declare-fun e!204902 () Bool)

(assert (=> mapNonEmpty!11616 (= mapRes!11616 (and tp!24087 e!204902))))

(declare-fun mapRest!11616 () (Array (_ BitVec 32) ValueCell!3063))

(declare-fun mapKey!11616 () (_ BitVec 32))

(declare-fun mapValue!11616 () ValueCell!3063)

(assert (=> mapNonEmpty!11616 (= (arr!8142 _values!1525) (store mapRest!11616 mapKey!11616 mapValue!11616))))

(declare-fun b!333725 () Bool)

(assert (=> b!333725 (= e!204902 tp_is_empty!6813)))

(declare-fun b!333726 () Bool)

(assert (=> b!333726 (= e!204903 (and e!204905 mapRes!11616))))

(declare-fun condMapEmpty!11616 () Bool)

(declare-fun mapDefault!11616 () ValueCell!3063)

(assert (=> b!333726 (= condMapEmpty!11616 (= (arr!8142 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3063)) mapDefault!11616)))))

(declare-fun b!333727 () Bool)

(declare-fun res!183854 () Bool)

(assert (=> b!333727 (=> (not res!183854) (not e!204906))))

(declare-datatypes ((List!4635 0))(
  ( (Nil!4632) (Cons!4631 (h!5487 (_ BitVec 64)) (t!9723 List!4635)) )
))
(declare-fun arrayNoDuplicates!0 (array!17221 (_ BitVec 32) List!4635) Bool)

(assert (=> b!333727 (= res!183854 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4632))))

(assert (= (and start!33626 res!183853) b!333723))

(assert (= (and b!333723 res!183856) b!333720))

(assert (= (and b!333720 res!183852) b!333727))

(assert (= (and b!333727 res!183854) b!333724))

(assert (= (and b!333724 res!183855) b!333719))

(assert (= (and b!333719 res!183857) b!333722))

(assert (= (and b!333726 condMapEmpty!11616) mapIsEmpty!11616))

(assert (= (and b!333726 (not condMapEmpty!11616)) mapNonEmpty!11616))

(get-info :version)

(assert (= (and mapNonEmpty!11616 ((_ is ValueCellFull!3063) mapValue!11616)) b!333725))

(assert (= (and b!333726 ((_ is ValueCellFull!3063) mapDefault!11616)) b!333721))

(assert (= start!33626 b!333726))

(declare-fun m!337901 () Bool)

(assert (=> b!333720 m!337901))

(declare-fun m!337903 () Bool)

(assert (=> b!333719 m!337903))

(assert (=> b!333719 m!337903))

(declare-fun m!337905 () Bool)

(assert (=> b!333719 m!337905))

(declare-fun m!337907 () Bool)

(assert (=> b!333727 m!337907))

(declare-fun m!337909 () Bool)

(assert (=> mapNonEmpty!11616 m!337909))

(declare-fun m!337911 () Bool)

(assert (=> b!333724 m!337911))

(declare-fun m!337913 () Bool)

(assert (=> start!33626 m!337913))

(declare-fun m!337915 () Bool)

(assert (=> start!33626 m!337915))

(declare-fun m!337917 () Bool)

(assert (=> start!33626 m!337917))

(declare-fun m!337919 () Bool)

(assert (=> b!333722 m!337919))

(check-sat (not b!333719) b_and!14041 (not start!33626) (not b!333722) (not b!333727) tp_is_empty!6813 (not b!333720) (not b!333724) (not mapNonEmpty!11616) (not b_next!6861))
(check-sat b_and!14041 (not b_next!6861))
