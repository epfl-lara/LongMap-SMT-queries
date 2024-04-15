; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34194 () Bool)

(assert start!34194)

(declare-fun b_free!7231 () Bool)

(declare-fun b_next!7231 () Bool)

(assert (=> start!34194 (= b_free!7231 (not b_next!7231))))

(declare-fun tp!25226 () Bool)

(declare-fun b_and!14405 () Bool)

(assert (=> start!34194 (= tp!25226 b_and!14405)))

(declare-fun res!188420 () Bool)

(declare-fun e!209068 () Bool)

(assert (=> start!34194 (=> (not res!188420) (not e!209068))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34194 (= res!188420 (validMask!0 mask!2385))))

(assert (=> start!34194 e!209068))

(assert (=> start!34194 true))

(declare-fun tp_is_empty!7183 () Bool)

(assert (=> start!34194 tp_is_empty!7183))

(assert (=> start!34194 tp!25226))

(declare-datatypes ((V!10555 0))(
  ( (V!10556 (val!3636 Int)) )
))
(declare-datatypes ((ValueCell!3248 0))(
  ( (ValueCellFull!3248 (v!5802 V!10555)) (EmptyCell!3248) )
))
(declare-datatypes ((array!17941 0))(
  ( (array!17942 (arr!8491 (Array (_ BitVec 32) ValueCell!3248)) (size!8844 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17941)

(declare-fun e!209067 () Bool)

(declare-fun array_inv!6318 (array!17941) Bool)

(assert (=> start!34194 (and (array_inv!6318 _values!1525) e!209067)))

(declare-datatypes ((array!17943 0))(
  ( (array!17944 (arr!8492 (Array (_ BitVec 32) (_ BitVec 64))) (size!8845 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17943)

(declare-fun array_inv!6319 (array!17943) Bool)

(assert (=> start!34194 (array_inv!6319 _keys!1895)))

(declare-fun b!340880 () Bool)

(declare-fun res!188417 () Bool)

(assert (=> b!340880 (=> (not res!188417) (not e!209068))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10555)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10555)

(declare-datatypes ((tuple2!5214 0))(
  ( (tuple2!5215 (_1!2618 (_ BitVec 64)) (_2!2618 V!10555)) )
))
(declare-datatypes ((List!4838 0))(
  ( (Nil!4835) (Cons!4834 (h!5690 tuple2!5214) (t!9937 List!4838)) )
))
(declare-datatypes ((ListLongMap!4117 0))(
  ( (ListLongMap!4118 (toList!2074 List!4838)) )
))
(declare-fun contains!2139 (ListLongMap!4117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1580 (array!17943 array!17941 (_ BitVec 32) (_ BitVec 32) V!10555 V!10555 (_ BitVec 32) Int) ListLongMap!4117)

(assert (=> b!340880 (= res!188417 (not (contains!2139 (getCurrentListMap!1580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340881 () Bool)

(declare-fun res!188422 () Bool)

(declare-fun e!209063 () Bool)

(assert (=> b!340881 (=> (not res!188422) (not e!209063))))

(declare-fun arrayContainsKey!0 (array!17943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340881 (= res!188422 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340882 () Bool)

(assert (=> b!340882 (= e!209068 e!209063)))

(declare-fun res!188423 () Bool)

(assert (=> b!340882 (=> (not res!188423) (not e!209063))))

(declare-datatypes ((SeekEntryResult!3270 0))(
  ( (MissingZero!3270 (index!15259 (_ BitVec 32))) (Found!3270 (index!15260 (_ BitVec 32))) (Intermediate!3270 (undefined!4082 Bool) (index!15261 (_ BitVec 32)) (x!33963 (_ BitVec 32))) (Undefined!3270) (MissingVacant!3270 (index!15262 (_ BitVec 32))) )
))
(declare-fun lt!161484 () SeekEntryResult!3270)

(get-info :version)

(assert (=> b!340882 (= res!188423 (and (not ((_ is Found!3270) lt!161484)) (not ((_ is MissingZero!3270) lt!161484)) ((_ is MissingVacant!3270) lt!161484)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17943 (_ BitVec 32)) SeekEntryResult!3270)

(assert (=> b!340882 (= lt!161484 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340883 () Bool)

(declare-fun e!209064 () Bool)

(assert (=> b!340883 (= e!209064 tp_is_empty!7183)))

(declare-fun b!340884 () Bool)

(declare-fun res!188419 () Bool)

(assert (=> b!340884 (=> (not res!188419) (not e!209068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17943 (_ BitVec 32)) Bool)

(assert (=> b!340884 (= res!188419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340885 () Bool)

(declare-fun res!188416 () Bool)

(assert (=> b!340885 (=> (not res!188416) (not e!209068))))

(assert (=> b!340885 (= res!188416 (and (= (size!8844 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8845 _keys!1895) (size!8844 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340886 () Bool)

(declare-fun res!188421 () Bool)

(assert (=> b!340886 (=> (not res!188421) (not e!209068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340886 (= res!188421 (validKeyInArray!0 k0!1348))))

(declare-fun b!340887 () Bool)

(assert (=> b!340887 (= e!209063 false)))

(declare-fun lt!161483 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17943 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340887 (= lt!161483 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340888 () Bool)

(declare-fun e!209066 () Bool)

(assert (=> b!340888 (= e!209066 tp_is_empty!7183)))

(declare-fun mapNonEmpty!12201 () Bool)

(declare-fun mapRes!12201 () Bool)

(declare-fun tp!25227 () Bool)

(assert (=> mapNonEmpty!12201 (= mapRes!12201 (and tp!25227 e!209066))))

(declare-fun mapKey!12201 () (_ BitVec 32))

(declare-fun mapValue!12201 () ValueCell!3248)

(declare-fun mapRest!12201 () (Array (_ BitVec 32) ValueCell!3248))

(assert (=> mapNonEmpty!12201 (= (arr!8491 _values!1525) (store mapRest!12201 mapKey!12201 mapValue!12201))))

(declare-fun b!340889 () Bool)

(declare-fun res!188418 () Bool)

(assert (=> b!340889 (=> (not res!188418) (not e!209068))))

(declare-datatypes ((List!4839 0))(
  ( (Nil!4836) (Cons!4835 (h!5691 (_ BitVec 64)) (t!9938 List!4839)) )
))
(declare-fun arrayNoDuplicates!0 (array!17943 (_ BitVec 32) List!4839) Bool)

(assert (=> b!340889 (= res!188418 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4836))))

(declare-fun mapIsEmpty!12201 () Bool)

(assert (=> mapIsEmpty!12201 mapRes!12201))

(declare-fun b!340890 () Bool)

(assert (=> b!340890 (= e!209067 (and e!209064 mapRes!12201))))

(declare-fun condMapEmpty!12201 () Bool)

(declare-fun mapDefault!12201 () ValueCell!3248)

(assert (=> b!340890 (= condMapEmpty!12201 (= (arr!8491 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3248)) mapDefault!12201)))))

(assert (= (and start!34194 res!188420) b!340885))

(assert (= (and b!340885 res!188416) b!340884))

(assert (= (and b!340884 res!188419) b!340889))

(assert (= (and b!340889 res!188418) b!340886))

(assert (= (and b!340886 res!188421) b!340880))

(assert (= (and b!340880 res!188417) b!340882))

(assert (= (and b!340882 res!188423) b!340881))

(assert (= (and b!340881 res!188422) b!340887))

(assert (= (and b!340890 condMapEmpty!12201) mapIsEmpty!12201))

(assert (= (and b!340890 (not condMapEmpty!12201)) mapNonEmpty!12201))

(assert (= (and mapNonEmpty!12201 ((_ is ValueCellFull!3248) mapValue!12201)) b!340888))

(assert (= (and b!340890 ((_ is ValueCellFull!3248) mapDefault!12201)) b!340883))

(assert (= start!34194 b!340890))

(declare-fun m!342933 () Bool)

(assert (=> mapNonEmpty!12201 m!342933))

(declare-fun m!342935 () Bool)

(assert (=> b!340889 m!342935))

(declare-fun m!342937 () Bool)

(assert (=> b!340881 m!342937))

(declare-fun m!342939 () Bool)

(assert (=> b!340880 m!342939))

(assert (=> b!340880 m!342939))

(declare-fun m!342941 () Bool)

(assert (=> b!340880 m!342941))

(declare-fun m!342943 () Bool)

(assert (=> start!34194 m!342943))

(declare-fun m!342945 () Bool)

(assert (=> start!34194 m!342945))

(declare-fun m!342947 () Bool)

(assert (=> start!34194 m!342947))

(declare-fun m!342949 () Bool)

(assert (=> b!340886 m!342949))

(declare-fun m!342951 () Bool)

(assert (=> b!340887 m!342951))

(declare-fun m!342953 () Bool)

(assert (=> b!340884 m!342953))

(declare-fun m!342955 () Bool)

(assert (=> b!340882 m!342955))

(check-sat (not b!340882) (not b!340884) b_and!14405 (not b!340886) (not b!340889) tp_is_empty!7183 (not b_next!7231) (not b!340887) (not b!340881) (not mapNonEmpty!12201) (not b!340880) (not start!34194))
(check-sat b_and!14405 (not b_next!7231))
