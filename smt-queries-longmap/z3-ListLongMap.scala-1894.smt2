; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33840 () Bool)

(assert start!33840)

(declare-fun b_free!7033 () Bool)

(declare-fun b_next!7033 () Bool)

(assert (=> start!33840 (= b_free!7033 (not b_next!7033))))

(declare-fun tp!24611 () Bool)

(declare-fun b_and!14193 () Bool)

(assert (=> start!33840 (= tp!24611 b_and!14193)))

(declare-fun mapIsEmpty!11883 () Bool)

(declare-fun mapRes!11883 () Bool)

(assert (=> mapIsEmpty!11883 mapRes!11883))

(declare-fun b!336589 () Bool)

(declare-fun res!185855 () Bool)

(declare-fun e!206574 () Bool)

(assert (=> b!336589 (=> (not res!185855) (not e!206574))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336589 (= res!185855 (validKeyInArray!0 k0!1348))))

(declare-fun b!336590 () Bool)

(declare-fun e!206576 () Bool)

(assert (=> b!336590 (= e!206576 false)))

(declare-fun lt!160095 () (_ BitVec 32))

(declare-datatypes ((array!17545 0))(
  ( (array!17546 (arr!8300 (Array (_ BitVec 32) (_ BitVec 64))) (size!8653 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17545)

(declare-fun arrayScanForKey!0 (array!17545 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336590 (= lt!160095 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336591 () Bool)

(declare-fun res!185854 () Bool)

(assert (=> b!336591 (=> (not res!185854) (not e!206576))))

(declare-fun arrayContainsKey!0 (array!17545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336591 (= res!185854 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336592 () Bool)

(declare-fun e!206577 () Bool)

(declare-fun tp_is_empty!6985 () Bool)

(assert (=> b!336592 (= e!206577 tp_is_empty!6985)))

(declare-fun b!336593 () Bool)

(declare-fun e!206578 () Bool)

(declare-fun e!206573 () Bool)

(assert (=> b!336593 (= e!206578 (and e!206573 mapRes!11883))))

(declare-fun condMapEmpty!11883 () Bool)

(declare-datatypes ((V!10291 0))(
  ( (V!10292 (val!3537 Int)) )
))
(declare-datatypes ((ValueCell!3149 0))(
  ( (ValueCellFull!3149 (v!5696 V!10291)) (EmptyCell!3149) )
))
(declare-datatypes ((array!17547 0))(
  ( (array!17548 (arr!8301 (Array (_ BitVec 32) ValueCell!3149)) (size!8654 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17547)

(declare-fun mapDefault!11883 () ValueCell!3149)

(assert (=> b!336593 (= condMapEmpty!11883 (= (arr!8301 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3149)) mapDefault!11883)))))

(declare-fun b!336594 () Bool)

(declare-fun res!185853 () Bool)

(assert (=> b!336594 (=> (not res!185853) (not e!206574))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336594 (= res!185853 (and (= (size!8654 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8653 _keys!1895) (size!8654 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336595 () Bool)

(declare-fun res!185850 () Bool)

(assert (=> b!336595 (=> (not res!185850) (not e!206574))))

(declare-fun zeroValue!1467 () V!10291)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10291)

(declare-datatypes ((tuple2!5084 0))(
  ( (tuple2!5085 (_1!2553 (_ BitVec 64)) (_2!2553 V!10291)) )
))
(declare-datatypes ((List!4718 0))(
  ( (Nil!4715) (Cons!4714 (h!5570 tuple2!5084) (t!9803 List!4718)) )
))
(declare-datatypes ((ListLongMap!3987 0))(
  ( (ListLongMap!3988 (toList!2009 List!4718)) )
))
(declare-fun contains!2067 (ListLongMap!3987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1515 (array!17545 array!17547 (_ BitVec 32) (_ BitVec 32) V!10291 V!10291 (_ BitVec 32) Int) ListLongMap!3987)

(assert (=> b!336595 (= res!185850 (not (contains!2067 (getCurrentListMap!1515 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336596 () Bool)

(assert (=> b!336596 (= e!206573 tp_is_empty!6985)))

(declare-fun b!336597 () Bool)

(assert (=> b!336597 (= e!206574 e!206576)))

(declare-fun res!185849 () Bool)

(assert (=> b!336597 (=> (not res!185849) (not e!206576))))

(declare-datatypes ((SeekEntryResult!3210 0))(
  ( (MissingZero!3210 (index!15019 (_ BitVec 32))) (Found!3210 (index!15020 (_ BitVec 32))) (Intermediate!3210 (undefined!4022 Bool) (index!15021 (_ BitVec 32)) (x!33569 (_ BitVec 32))) (Undefined!3210) (MissingVacant!3210 (index!15022 (_ BitVec 32))) )
))
(declare-fun lt!160094 () SeekEntryResult!3210)

(get-info :version)

(assert (=> b!336597 (= res!185849 (and (not ((_ is Found!3210) lt!160094)) ((_ is MissingZero!3210) lt!160094)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17545 (_ BitVec 32)) SeekEntryResult!3210)

(assert (=> b!336597 (= lt!160094 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11883 () Bool)

(declare-fun tp!24612 () Bool)

(assert (=> mapNonEmpty!11883 (= mapRes!11883 (and tp!24612 e!206577))))

(declare-fun mapValue!11883 () ValueCell!3149)

(declare-fun mapRest!11883 () (Array (_ BitVec 32) ValueCell!3149))

(declare-fun mapKey!11883 () (_ BitVec 32))

(assert (=> mapNonEmpty!11883 (= (arr!8301 _values!1525) (store mapRest!11883 mapKey!11883 mapValue!11883))))

(declare-fun res!185851 () Bool)

(assert (=> start!33840 (=> (not res!185851) (not e!206574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33840 (= res!185851 (validMask!0 mask!2385))))

(assert (=> start!33840 e!206574))

(assert (=> start!33840 true))

(assert (=> start!33840 tp_is_empty!6985))

(assert (=> start!33840 tp!24611))

(declare-fun array_inv!6196 (array!17547) Bool)

(assert (=> start!33840 (and (array_inv!6196 _values!1525) e!206578)))

(declare-fun array_inv!6197 (array!17545) Bool)

(assert (=> start!33840 (array_inv!6197 _keys!1895)))

(declare-fun b!336598 () Bool)

(declare-fun res!185852 () Bool)

(assert (=> b!336598 (=> (not res!185852) (not e!206574))))

(declare-datatypes ((List!4719 0))(
  ( (Nil!4716) (Cons!4715 (h!5571 (_ BitVec 64)) (t!9804 List!4719)) )
))
(declare-fun arrayNoDuplicates!0 (array!17545 (_ BitVec 32) List!4719) Bool)

(assert (=> b!336598 (= res!185852 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4716))))

(declare-fun b!336599 () Bool)

(declare-fun res!185848 () Bool)

(assert (=> b!336599 (=> (not res!185848) (not e!206574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17545 (_ BitVec 32)) Bool)

(assert (=> b!336599 (= res!185848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33840 res!185851) b!336594))

(assert (= (and b!336594 res!185853) b!336599))

(assert (= (and b!336599 res!185848) b!336598))

(assert (= (and b!336598 res!185852) b!336589))

(assert (= (and b!336589 res!185855) b!336595))

(assert (= (and b!336595 res!185850) b!336597))

(assert (= (and b!336597 res!185849) b!336591))

(assert (= (and b!336591 res!185854) b!336590))

(assert (= (and b!336593 condMapEmpty!11883) mapIsEmpty!11883))

(assert (= (and b!336593 (not condMapEmpty!11883)) mapNonEmpty!11883))

(assert (= (and mapNonEmpty!11883 ((_ is ValueCellFull!3149) mapValue!11883)) b!336592))

(assert (= (and b!336593 ((_ is ValueCellFull!3149) mapDefault!11883)) b!336596))

(assert (= start!33840 b!336593))

(declare-fun m!339817 () Bool)

(assert (=> b!336599 m!339817))

(declare-fun m!339819 () Bool)

(assert (=> mapNonEmpty!11883 m!339819))

(declare-fun m!339821 () Bool)

(assert (=> b!336589 m!339821))

(declare-fun m!339823 () Bool)

(assert (=> b!336598 m!339823))

(declare-fun m!339825 () Bool)

(assert (=> b!336597 m!339825))

(declare-fun m!339827 () Bool)

(assert (=> b!336590 m!339827))

(declare-fun m!339829 () Bool)

(assert (=> b!336591 m!339829))

(declare-fun m!339831 () Bool)

(assert (=> start!33840 m!339831))

(declare-fun m!339833 () Bool)

(assert (=> start!33840 m!339833))

(declare-fun m!339835 () Bool)

(assert (=> start!33840 m!339835))

(declare-fun m!339837 () Bool)

(assert (=> b!336595 m!339837))

(assert (=> b!336595 m!339837))

(declare-fun m!339839 () Bool)

(assert (=> b!336595 m!339839))

(check-sat (not b!336599) (not start!33840) b_and!14193 tp_is_empty!6985 (not b!336590) (not b!336597) (not b!336598) (not b!336595) (not b!336589) (not b_next!7033) (not b!336591) (not mapNonEmpty!11883))
(check-sat b_and!14193 (not b_next!7033))
