; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33840 () Bool)

(assert start!33840)

(declare-fun b_free!7033 () Bool)

(declare-fun b_next!7033 () Bool)

(assert (=> start!33840 (= b_free!7033 (not b_next!7033))))

(declare-fun tp!24611 () Bool)

(declare-fun b_and!14233 () Bool)

(assert (=> start!33840 (= tp!24611 b_and!14233)))

(declare-fun b!336811 () Bool)

(declare-fun e!206717 () Bool)

(declare-fun e!206716 () Bool)

(assert (=> b!336811 (= e!206717 e!206716)))

(declare-fun res!185976 () Bool)

(assert (=> b!336811 (=> (not res!185976) (not e!206716))))

(declare-datatypes ((SeekEntryResult!3174 0))(
  ( (MissingZero!3174 (index!14875 (_ BitVec 32))) (Found!3174 (index!14876 (_ BitVec 32))) (Intermediate!3174 (undefined!3986 Bool) (index!14877 (_ BitVec 32)) (x!33535 (_ BitVec 32))) (Undefined!3174) (MissingVacant!3174 (index!14878 (_ BitVec 32))) )
))
(declare-fun lt!160347 () SeekEntryResult!3174)

(get-info :version)

(assert (=> b!336811 (= res!185976 (and (not ((_ is Found!3174) lt!160347)) ((_ is MissingZero!3174) lt!160347)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17552 0))(
  ( (array!17553 (arr!8303 (Array (_ BitVec 32) (_ BitVec 64))) (size!8655 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17552)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17552 (_ BitVec 32)) SeekEntryResult!3174)

(assert (=> b!336811 (= lt!160347 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336812 () Bool)

(declare-fun e!206715 () Bool)

(declare-fun tp_is_empty!6985 () Bool)

(assert (=> b!336812 (= e!206715 tp_is_empty!6985)))

(declare-fun b!336813 () Bool)

(declare-fun res!185974 () Bool)

(assert (=> b!336813 (=> (not res!185974) (not e!206717))))

(declare-datatypes ((List!4669 0))(
  ( (Nil!4666) (Cons!4665 (h!5521 (_ BitVec 64)) (t!9755 List!4669)) )
))
(declare-fun arrayNoDuplicates!0 (array!17552 (_ BitVec 32) List!4669) Bool)

(assert (=> b!336813 (= res!185974 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4666))))

(declare-fun b!336815 () Bool)

(declare-fun res!185979 () Bool)

(assert (=> b!336815 (=> (not res!185979) (not e!206716))))

(declare-fun arrayContainsKey!0 (array!17552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336815 (= res!185979 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336816 () Bool)

(declare-fun e!206719 () Bool)

(declare-fun mapRes!11883 () Bool)

(assert (=> b!336816 (= e!206719 (and e!206715 mapRes!11883))))

(declare-fun condMapEmpty!11883 () Bool)

(declare-datatypes ((V!10291 0))(
  ( (V!10292 (val!3537 Int)) )
))
(declare-datatypes ((ValueCell!3149 0))(
  ( (ValueCellFull!3149 (v!5703 V!10291)) (EmptyCell!3149) )
))
(declare-datatypes ((array!17554 0))(
  ( (array!17555 (arr!8304 (Array (_ BitVec 32) ValueCell!3149)) (size!8656 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17554)

(declare-fun mapDefault!11883 () ValueCell!3149)

(assert (=> b!336816 (= condMapEmpty!11883 (= (arr!8304 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3149)) mapDefault!11883)))))

(declare-fun b!336817 () Bool)

(declare-fun res!185980 () Bool)

(assert (=> b!336817 (=> (not res!185980) (not e!206717))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336817 (= res!185980 (and (= (size!8656 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8655 _keys!1895) (size!8656 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11883 () Bool)

(declare-fun tp!24612 () Bool)

(declare-fun e!206720 () Bool)

(assert (=> mapNonEmpty!11883 (= mapRes!11883 (and tp!24612 e!206720))))

(declare-fun mapKey!11883 () (_ BitVec 32))

(declare-fun mapValue!11883 () ValueCell!3149)

(declare-fun mapRest!11883 () (Array (_ BitVec 32) ValueCell!3149))

(assert (=> mapNonEmpty!11883 (= (arr!8304 _values!1525) (store mapRest!11883 mapKey!11883 mapValue!11883))))

(declare-fun b!336818 () Bool)

(assert (=> b!336818 (= e!206716 false)))

(declare-fun lt!160348 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17552 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336818 (= lt!160348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336819 () Bool)

(declare-fun res!185975 () Bool)

(assert (=> b!336819 (=> (not res!185975) (not e!206717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336819 (= res!185975 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11883 () Bool)

(assert (=> mapIsEmpty!11883 mapRes!11883))

(declare-fun b!336814 () Bool)

(declare-fun res!185978 () Bool)

(assert (=> b!336814 (=> (not res!185978) (not e!206717))))

(declare-fun zeroValue!1467 () V!10291)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10291)

(declare-datatypes ((tuple2!5054 0))(
  ( (tuple2!5055 (_1!2538 (_ BitVec 64)) (_2!2538 V!10291)) )
))
(declare-datatypes ((List!4670 0))(
  ( (Nil!4667) (Cons!4666 (h!5522 tuple2!5054) (t!9756 List!4670)) )
))
(declare-datatypes ((ListLongMap!3969 0))(
  ( (ListLongMap!3970 (toList!2000 List!4670)) )
))
(declare-fun contains!2066 (ListLongMap!3969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1529 (array!17552 array!17554 (_ BitVec 32) (_ BitVec 32) V!10291 V!10291 (_ BitVec 32) Int) ListLongMap!3969)

(assert (=> b!336814 (= res!185978 (not (contains!2066 (getCurrentListMap!1529 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!185977 () Bool)

(assert (=> start!33840 (=> (not res!185977) (not e!206717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33840 (= res!185977 (validMask!0 mask!2385))))

(assert (=> start!33840 e!206717))

(assert (=> start!33840 true))

(assert (=> start!33840 tp_is_empty!6985))

(assert (=> start!33840 tp!24611))

(declare-fun array_inv!6172 (array!17554) Bool)

(assert (=> start!33840 (and (array_inv!6172 _values!1525) e!206719)))

(declare-fun array_inv!6173 (array!17552) Bool)

(assert (=> start!33840 (array_inv!6173 _keys!1895)))

(declare-fun b!336820 () Bool)

(assert (=> b!336820 (= e!206720 tp_is_empty!6985)))

(declare-fun b!336821 () Bool)

(declare-fun res!185981 () Bool)

(assert (=> b!336821 (=> (not res!185981) (not e!206717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17552 (_ BitVec 32)) Bool)

(assert (=> b!336821 (= res!185981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33840 res!185977) b!336817))

(assert (= (and b!336817 res!185980) b!336821))

(assert (= (and b!336821 res!185981) b!336813))

(assert (= (and b!336813 res!185974) b!336819))

(assert (= (and b!336819 res!185975) b!336814))

(assert (= (and b!336814 res!185978) b!336811))

(assert (= (and b!336811 res!185976) b!336815))

(assert (= (and b!336815 res!185979) b!336818))

(assert (= (and b!336816 condMapEmpty!11883) mapIsEmpty!11883))

(assert (= (and b!336816 (not condMapEmpty!11883)) mapNonEmpty!11883))

(assert (= (and mapNonEmpty!11883 ((_ is ValueCellFull!3149) mapValue!11883)) b!336820))

(assert (= (and b!336816 ((_ is ValueCellFull!3149) mapDefault!11883)) b!336812))

(assert (= start!33840 b!336816))

(declare-fun m!340771 () Bool)

(assert (=> b!336821 m!340771))

(declare-fun m!340773 () Bool)

(assert (=> b!336814 m!340773))

(assert (=> b!336814 m!340773))

(declare-fun m!340775 () Bool)

(assert (=> b!336814 m!340775))

(declare-fun m!340777 () Bool)

(assert (=> b!336819 m!340777))

(declare-fun m!340779 () Bool)

(assert (=> start!33840 m!340779))

(declare-fun m!340781 () Bool)

(assert (=> start!33840 m!340781))

(declare-fun m!340783 () Bool)

(assert (=> start!33840 m!340783))

(declare-fun m!340785 () Bool)

(assert (=> b!336815 m!340785))

(declare-fun m!340787 () Bool)

(assert (=> b!336818 m!340787))

(declare-fun m!340789 () Bool)

(assert (=> b!336811 m!340789))

(declare-fun m!340791 () Bool)

(assert (=> b!336813 m!340791))

(declare-fun m!340793 () Bool)

(assert (=> mapNonEmpty!11883 m!340793))

(check-sat (not b!336819) (not mapNonEmpty!11883) b_and!14233 (not b!336818) (not b_next!7033) (not b!336814) (not b!336815) (not start!33840) (not b!336811) (not b!336821) (not b!336813) tp_is_empty!6985)
(check-sat b_and!14233 (not b_next!7033))
