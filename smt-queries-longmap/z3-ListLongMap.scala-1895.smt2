; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33846 () Bool)

(assert start!33846)

(declare-fun b_free!7039 () Bool)

(declare-fun b_next!7039 () Bool)

(assert (=> start!33846 (= b_free!7039 (not b_next!7039))))

(declare-fun tp!24629 () Bool)

(declare-fun b_and!14239 () Bool)

(assert (=> start!33846 (= tp!24629 b_and!14239)))

(declare-fun b!336910 () Bool)

(declare-fun res!186049 () Bool)

(declare-fun e!206774 () Bool)

(assert (=> b!336910 (=> (not res!186049) (not e!206774))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336910 (= res!186049 (validKeyInArray!0 k0!1348))))

(declare-fun b!336911 () Bool)

(declare-fun e!206772 () Bool)

(assert (=> b!336911 (= e!206774 e!206772)))

(declare-fun res!186052 () Bool)

(assert (=> b!336911 (=> (not res!186052) (not e!206772))))

(declare-datatypes ((SeekEntryResult!3175 0))(
  ( (MissingZero!3175 (index!14879 (_ BitVec 32))) (Found!3175 (index!14880 (_ BitVec 32))) (Intermediate!3175 (undefined!3987 Bool) (index!14881 (_ BitVec 32)) (x!33544 (_ BitVec 32))) (Undefined!3175) (MissingVacant!3175 (index!14882 (_ BitVec 32))) )
))
(declare-fun lt!160366 () SeekEntryResult!3175)

(get-info :version)

(assert (=> b!336911 (= res!186052 (and (not ((_ is Found!3175) lt!160366)) ((_ is MissingZero!3175) lt!160366)))))

(declare-datatypes ((array!17564 0))(
  ( (array!17565 (arr!8309 (Array (_ BitVec 32) (_ BitVec 64))) (size!8661 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17564)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17564 (_ BitVec 32)) SeekEntryResult!3175)

(assert (=> b!336911 (= lt!160366 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!186046 () Bool)

(assert (=> start!33846 (=> (not res!186046) (not e!206774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33846 (= res!186046 (validMask!0 mask!2385))))

(assert (=> start!33846 e!206774))

(assert (=> start!33846 true))

(declare-fun tp_is_empty!6991 () Bool)

(assert (=> start!33846 tp_is_empty!6991))

(assert (=> start!33846 tp!24629))

(declare-datatypes ((V!10299 0))(
  ( (V!10300 (val!3540 Int)) )
))
(declare-datatypes ((ValueCell!3152 0))(
  ( (ValueCellFull!3152 (v!5706 V!10299)) (EmptyCell!3152) )
))
(declare-datatypes ((array!17566 0))(
  ( (array!17567 (arr!8310 (Array (_ BitVec 32) ValueCell!3152)) (size!8662 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17566)

(declare-fun e!206773 () Bool)

(declare-fun array_inv!6176 (array!17566) Bool)

(assert (=> start!33846 (and (array_inv!6176 _values!1525) e!206773)))

(declare-fun array_inv!6177 (array!17564) Bool)

(assert (=> start!33846 (array_inv!6177 _keys!1895)))

(declare-fun b!336912 () Bool)

(assert (=> b!336912 (= e!206772 false)))

(declare-fun lt!160365 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17564 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336912 (= lt!160365 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336913 () Bool)

(declare-fun res!186053 () Bool)

(assert (=> b!336913 (=> (not res!186053) (not e!206774))))

(declare-datatypes ((List!4672 0))(
  ( (Nil!4669) (Cons!4668 (h!5524 (_ BitVec 64)) (t!9758 List!4672)) )
))
(declare-fun arrayNoDuplicates!0 (array!17564 (_ BitVec 32) List!4672) Bool)

(assert (=> b!336913 (= res!186053 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4669))))

(declare-fun b!336914 () Bool)

(declare-fun res!186051 () Bool)

(assert (=> b!336914 (=> (not res!186051) (not e!206774))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336914 (= res!186051 (and (= (size!8662 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8661 _keys!1895) (size!8662 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11892 () Bool)

(declare-fun mapRes!11892 () Bool)

(declare-fun tp!24630 () Bool)

(declare-fun e!206769 () Bool)

(assert (=> mapNonEmpty!11892 (= mapRes!11892 (and tp!24630 e!206769))))

(declare-fun mapRest!11892 () (Array (_ BitVec 32) ValueCell!3152))

(declare-fun mapValue!11892 () ValueCell!3152)

(declare-fun mapKey!11892 () (_ BitVec 32))

(assert (=> mapNonEmpty!11892 (= (arr!8310 _values!1525) (store mapRest!11892 mapKey!11892 mapValue!11892))))

(declare-fun b!336915 () Bool)

(declare-fun e!206770 () Bool)

(assert (=> b!336915 (= e!206773 (and e!206770 mapRes!11892))))

(declare-fun condMapEmpty!11892 () Bool)

(declare-fun mapDefault!11892 () ValueCell!3152)

(assert (=> b!336915 (= condMapEmpty!11892 (= (arr!8310 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3152)) mapDefault!11892)))))

(declare-fun b!336916 () Bool)

(assert (=> b!336916 (= e!206769 tp_is_empty!6991)))

(declare-fun b!336917 () Bool)

(declare-fun res!186047 () Bool)

(assert (=> b!336917 (=> (not res!186047) (not e!206774))))

(declare-fun zeroValue!1467 () V!10299)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10299)

(declare-datatypes ((tuple2!5058 0))(
  ( (tuple2!5059 (_1!2540 (_ BitVec 64)) (_2!2540 V!10299)) )
))
(declare-datatypes ((List!4673 0))(
  ( (Nil!4670) (Cons!4669 (h!5525 tuple2!5058) (t!9759 List!4673)) )
))
(declare-datatypes ((ListLongMap!3973 0))(
  ( (ListLongMap!3974 (toList!2002 List!4673)) )
))
(declare-fun contains!2068 (ListLongMap!3973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1531 (array!17564 array!17566 (_ BitVec 32) (_ BitVec 32) V!10299 V!10299 (_ BitVec 32) Int) ListLongMap!3973)

(assert (=> b!336917 (= res!186047 (not (contains!2068 (getCurrentListMap!1531 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!11892 () Bool)

(assert (=> mapIsEmpty!11892 mapRes!11892))

(declare-fun b!336918 () Bool)

(assert (=> b!336918 (= e!206770 tp_is_empty!6991)))

(declare-fun b!336919 () Bool)

(declare-fun res!186048 () Bool)

(assert (=> b!336919 (=> (not res!186048) (not e!206772))))

(declare-fun arrayContainsKey!0 (array!17564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336919 (= res!186048 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336920 () Bool)

(declare-fun res!186050 () Bool)

(assert (=> b!336920 (=> (not res!186050) (not e!206774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17564 (_ BitVec 32)) Bool)

(assert (=> b!336920 (= res!186050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33846 res!186046) b!336914))

(assert (= (and b!336914 res!186051) b!336920))

(assert (= (and b!336920 res!186050) b!336913))

(assert (= (and b!336913 res!186053) b!336910))

(assert (= (and b!336910 res!186049) b!336917))

(assert (= (and b!336917 res!186047) b!336911))

(assert (= (and b!336911 res!186052) b!336919))

(assert (= (and b!336919 res!186048) b!336912))

(assert (= (and b!336915 condMapEmpty!11892) mapIsEmpty!11892))

(assert (= (and b!336915 (not condMapEmpty!11892)) mapNonEmpty!11892))

(assert (= (and mapNonEmpty!11892 ((_ is ValueCellFull!3152) mapValue!11892)) b!336916))

(assert (= (and b!336915 ((_ is ValueCellFull!3152) mapDefault!11892)) b!336918))

(assert (= start!33846 b!336915))

(declare-fun m!340843 () Bool)

(assert (=> b!336919 m!340843))

(declare-fun m!340845 () Bool)

(assert (=> b!336912 m!340845))

(declare-fun m!340847 () Bool)

(assert (=> b!336913 m!340847))

(declare-fun m!340849 () Bool)

(assert (=> b!336911 m!340849))

(declare-fun m!340851 () Bool)

(assert (=> b!336917 m!340851))

(assert (=> b!336917 m!340851))

(declare-fun m!340853 () Bool)

(assert (=> b!336917 m!340853))

(declare-fun m!340855 () Bool)

(assert (=> start!33846 m!340855))

(declare-fun m!340857 () Bool)

(assert (=> start!33846 m!340857))

(declare-fun m!340859 () Bool)

(assert (=> start!33846 m!340859))

(declare-fun m!340861 () Bool)

(assert (=> b!336920 m!340861))

(declare-fun m!340863 () Bool)

(assert (=> b!336910 m!340863))

(declare-fun m!340865 () Bool)

(assert (=> mapNonEmpty!11892 m!340865))

(check-sat (not b!336911) (not mapNonEmpty!11892) (not b!336917) (not b!336912) (not start!33846) (not b!336920) (not b!336910) b_and!14239 (not b!336913) (not b!336919) tp_is_empty!6991 (not b_next!7039))
(check-sat b_and!14239 (not b_next!7039))
