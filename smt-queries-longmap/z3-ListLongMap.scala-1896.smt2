; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33852 () Bool)

(assert start!33852)

(declare-fun b_free!7045 () Bool)

(declare-fun b_next!7045 () Bool)

(assert (=> start!33852 (= b_free!7045 (not b_next!7045))))

(declare-fun tp!24647 () Bool)

(declare-fun b_and!14245 () Bool)

(assert (=> start!33852 (= tp!24647 b_and!14245)))

(declare-fun mapIsEmpty!11901 () Bool)

(declare-fun mapRes!11901 () Bool)

(assert (=> mapIsEmpty!11901 mapRes!11901))

(declare-fun b!337009 () Bool)

(declare-fun e!206826 () Bool)

(declare-fun e!206827 () Bool)

(assert (=> b!337009 (= e!206826 e!206827)))

(declare-fun res!186118 () Bool)

(assert (=> b!337009 (=> (not res!186118) (not e!206827))))

(declare-datatypes ((SeekEntryResult!3176 0))(
  ( (MissingZero!3176 (index!14883 (_ BitVec 32))) (Found!3176 (index!14884 (_ BitVec 32))) (Intermediate!3176 (undefined!3988 Bool) (index!14885 (_ BitVec 32)) (x!33553 (_ BitVec 32))) (Undefined!3176) (MissingVacant!3176 (index!14886 (_ BitVec 32))) )
))
(declare-fun lt!160383 () SeekEntryResult!3176)

(get-info :version)

(assert (=> b!337009 (= res!186118 (and (not ((_ is Found!3176) lt!160383)) ((_ is MissingZero!3176) lt!160383)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17576 0))(
  ( (array!17577 (arr!8315 (Array (_ BitVec 32) (_ BitVec 64))) (size!8667 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17576)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17576 (_ BitVec 32)) SeekEntryResult!3176)

(assert (=> b!337009 (= lt!160383 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337010 () Bool)

(declare-fun res!186119 () Bool)

(assert (=> b!337010 (=> (not res!186119) (not e!206827))))

(declare-fun arrayContainsKey!0 (array!17576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337010 (= res!186119 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337011 () Bool)

(assert (=> b!337011 (= e!206827 false)))

(declare-fun lt!160384 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17576 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337011 (= lt!160384 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337012 () Bool)

(declare-fun res!186125 () Bool)

(assert (=> b!337012 (=> (not res!186125) (not e!206826))))

(declare-datatypes ((V!10307 0))(
  ( (V!10308 (val!3543 Int)) )
))
(declare-fun zeroValue!1467 () V!10307)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3155 0))(
  ( (ValueCellFull!3155 (v!5709 V!10307)) (EmptyCell!3155) )
))
(declare-datatypes ((array!17578 0))(
  ( (array!17579 (arr!8316 (Array (_ BitVec 32) ValueCell!3155)) (size!8668 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17578)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10307)

(declare-datatypes ((tuple2!5062 0))(
  ( (tuple2!5063 (_1!2542 (_ BitVec 64)) (_2!2542 V!10307)) )
))
(declare-datatypes ((List!4675 0))(
  ( (Nil!4672) (Cons!4671 (h!5527 tuple2!5062) (t!9761 List!4675)) )
))
(declare-datatypes ((ListLongMap!3977 0))(
  ( (ListLongMap!3978 (toList!2004 List!4675)) )
))
(declare-fun contains!2070 (ListLongMap!3977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1533 (array!17576 array!17578 (_ BitVec 32) (_ BitVec 32) V!10307 V!10307 (_ BitVec 32) Int) ListLongMap!3977)

(assert (=> b!337012 (= res!186125 (not (contains!2070 (getCurrentListMap!1533 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11901 () Bool)

(declare-fun tp!24648 () Bool)

(declare-fun e!206823 () Bool)

(assert (=> mapNonEmpty!11901 (= mapRes!11901 (and tp!24648 e!206823))))

(declare-fun mapKey!11901 () (_ BitVec 32))

(declare-fun mapRest!11901 () (Array (_ BitVec 32) ValueCell!3155))

(declare-fun mapValue!11901 () ValueCell!3155)

(assert (=> mapNonEmpty!11901 (= (arr!8316 _values!1525) (store mapRest!11901 mapKey!11901 mapValue!11901))))

(declare-fun b!337014 () Bool)

(declare-fun tp_is_empty!6997 () Bool)

(assert (=> b!337014 (= e!206823 tp_is_empty!6997)))

(declare-fun b!337015 () Bool)

(declare-fun e!206824 () Bool)

(assert (=> b!337015 (= e!206824 tp_is_empty!6997)))

(declare-fun b!337016 () Bool)

(declare-fun e!206825 () Bool)

(assert (=> b!337016 (= e!206825 (and e!206824 mapRes!11901))))

(declare-fun condMapEmpty!11901 () Bool)

(declare-fun mapDefault!11901 () ValueCell!3155)

(assert (=> b!337016 (= condMapEmpty!11901 (= (arr!8316 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3155)) mapDefault!11901)))))

(declare-fun b!337017 () Bool)

(declare-fun res!186122 () Bool)

(assert (=> b!337017 (=> (not res!186122) (not e!206826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17576 (_ BitVec 32)) Bool)

(assert (=> b!337017 (= res!186122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337018 () Bool)

(declare-fun res!186120 () Bool)

(assert (=> b!337018 (=> (not res!186120) (not e!206826))))

(declare-datatypes ((List!4676 0))(
  ( (Nil!4673) (Cons!4672 (h!5528 (_ BitVec 64)) (t!9762 List!4676)) )
))
(declare-fun arrayNoDuplicates!0 (array!17576 (_ BitVec 32) List!4676) Bool)

(assert (=> b!337018 (= res!186120 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4673))))

(declare-fun b!337019 () Bool)

(declare-fun res!186123 () Bool)

(assert (=> b!337019 (=> (not res!186123) (not e!206826))))

(assert (=> b!337019 (= res!186123 (and (= (size!8668 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8667 _keys!1895) (size!8668 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337013 () Bool)

(declare-fun res!186124 () Bool)

(assert (=> b!337013 (=> (not res!186124) (not e!206826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337013 (= res!186124 (validKeyInArray!0 k0!1348))))

(declare-fun res!186121 () Bool)

(assert (=> start!33852 (=> (not res!186121) (not e!206826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33852 (= res!186121 (validMask!0 mask!2385))))

(assert (=> start!33852 e!206826))

(assert (=> start!33852 true))

(assert (=> start!33852 tp_is_empty!6997))

(assert (=> start!33852 tp!24647))

(declare-fun array_inv!6182 (array!17578) Bool)

(assert (=> start!33852 (and (array_inv!6182 _values!1525) e!206825)))

(declare-fun array_inv!6183 (array!17576) Bool)

(assert (=> start!33852 (array_inv!6183 _keys!1895)))

(assert (= (and start!33852 res!186121) b!337019))

(assert (= (and b!337019 res!186123) b!337017))

(assert (= (and b!337017 res!186122) b!337018))

(assert (= (and b!337018 res!186120) b!337013))

(assert (= (and b!337013 res!186124) b!337012))

(assert (= (and b!337012 res!186125) b!337009))

(assert (= (and b!337009 res!186118) b!337010))

(assert (= (and b!337010 res!186119) b!337011))

(assert (= (and b!337016 condMapEmpty!11901) mapIsEmpty!11901))

(assert (= (and b!337016 (not condMapEmpty!11901)) mapNonEmpty!11901))

(assert (= (and mapNonEmpty!11901 ((_ is ValueCellFull!3155) mapValue!11901)) b!337014))

(assert (= (and b!337016 ((_ is ValueCellFull!3155) mapDefault!11901)) b!337015))

(assert (= start!33852 b!337016))

(declare-fun m!340915 () Bool)

(assert (=> b!337013 m!340915))

(declare-fun m!340917 () Bool)

(assert (=> b!337009 m!340917))

(declare-fun m!340919 () Bool)

(assert (=> b!337017 m!340919))

(declare-fun m!340921 () Bool)

(assert (=> b!337018 m!340921))

(declare-fun m!340923 () Bool)

(assert (=> mapNonEmpty!11901 m!340923))

(declare-fun m!340925 () Bool)

(assert (=> b!337011 m!340925))

(declare-fun m!340927 () Bool)

(assert (=> b!337012 m!340927))

(assert (=> b!337012 m!340927))

(declare-fun m!340929 () Bool)

(assert (=> b!337012 m!340929))

(declare-fun m!340931 () Bool)

(assert (=> start!33852 m!340931))

(declare-fun m!340933 () Bool)

(assert (=> start!33852 m!340933))

(declare-fun m!340935 () Bool)

(assert (=> start!33852 m!340935))

(declare-fun m!340937 () Bool)

(assert (=> b!337010 m!340937))

(check-sat (not b!337011) (not start!33852) tp_is_empty!6997 (not b!337013) (not b!337009) b_and!14245 (not mapNonEmpty!11901) (not b!337018) (not b!337017) (not b!337012) (not b_next!7045) (not b!337010))
(check-sat b_and!14245 (not b_next!7045))
