; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33736 () Bool)

(assert start!33736)

(declare-fun b_free!6985 () Bool)

(declare-fun b_next!6985 () Bool)

(assert (=> start!33736 (= b_free!6985 (not b_next!6985))))

(declare-fun tp!24459 () Bool)

(declare-fun b_and!14179 () Bool)

(assert (=> start!33736 (= tp!24459 b_and!14179)))

(declare-fun mapNonEmpty!11802 () Bool)

(declare-fun mapRes!11802 () Bool)

(declare-fun tp!24458 () Bool)

(declare-fun e!206071 () Bool)

(assert (=> mapNonEmpty!11802 (= mapRes!11802 (and tp!24458 e!206071))))

(declare-datatypes ((V!10227 0))(
  ( (V!10228 (val!3513 Int)) )
))
(declare-datatypes ((ValueCell!3125 0))(
  ( (ValueCellFull!3125 (v!5676 V!10227)) (EmptyCell!3125) )
))
(declare-datatypes ((array!17454 0))(
  ( (array!17455 (arr!8257 (Array (_ BitVec 32) ValueCell!3125)) (size!8609 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17454)

(declare-fun mapKey!11802 () (_ BitVec 32))

(declare-fun mapValue!11802 () ValueCell!3125)

(declare-fun mapRest!11802 () (Array (_ BitVec 32) ValueCell!3125))

(assert (=> mapNonEmpty!11802 (= (arr!8257 _values!1525) (store mapRest!11802 mapKey!11802 mapValue!11802))))

(declare-fun b!335700 () Bool)

(declare-fun res!185325 () Bool)

(declare-fun e!206068 () Bool)

(assert (=> b!335700 (=> (not res!185325) (not e!206068))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10227)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17456 0))(
  ( (array!17457 (arr!8258 (Array (_ BitVec 32) (_ BitVec 64))) (size!8610 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17456)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10227)

(declare-datatypes ((tuple2!5024 0))(
  ( (tuple2!5025 (_1!2523 (_ BitVec 64)) (_2!2523 V!10227)) )
))
(declare-datatypes ((List!4641 0))(
  ( (Nil!4638) (Cons!4637 (h!5493 tuple2!5024) (t!9721 List!4641)) )
))
(declare-datatypes ((ListLongMap!3939 0))(
  ( (ListLongMap!3940 (toList!1985 List!4641)) )
))
(declare-fun contains!2048 (ListLongMap!3939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1514 (array!17456 array!17454 (_ BitVec 32) (_ BitVec 32) V!10227 V!10227 (_ BitVec 32) Int) ListLongMap!3939)

(assert (=> b!335700 (= res!185325 (not (contains!2048 (getCurrentListMap!1514 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!335701 () Bool)

(declare-fun res!185330 () Bool)

(assert (=> b!335701 (=> (not res!185330) (not e!206068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335701 (= res!185330 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11802 () Bool)

(assert (=> mapIsEmpty!11802 mapRes!11802))

(declare-fun b!335702 () Bool)

(declare-fun e!206070 () Bool)

(declare-fun e!206069 () Bool)

(assert (=> b!335702 (= e!206070 (and e!206069 mapRes!11802))))

(declare-fun condMapEmpty!11802 () Bool)

(declare-fun mapDefault!11802 () ValueCell!3125)

(assert (=> b!335702 (= condMapEmpty!11802 (= (arr!8257 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3125)) mapDefault!11802)))))

(declare-fun b!335703 () Bool)

(declare-fun tp_is_empty!6937 () Bool)

(assert (=> b!335703 (= e!206071 tp_is_empty!6937)))

(declare-fun res!185328 () Bool)

(assert (=> start!33736 (=> (not res!185328) (not e!206068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33736 (= res!185328 (validMask!0 mask!2385))))

(assert (=> start!33736 e!206068))

(assert (=> start!33736 true))

(assert (=> start!33736 tp_is_empty!6937))

(assert (=> start!33736 tp!24459))

(declare-fun array_inv!6140 (array!17454) Bool)

(assert (=> start!33736 (and (array_inv!6140 _values!1525) e!206070)))

(declare-fun array_inv!6141 (array!17456) Bool)

(assert (=> start!33736 (array_inv!6141 _keys!1895)))

(declare-fun b!335704 () Bool)

(assert (=> b!335704 (= e!206068 false)))

(declare-datatypes ((SeekEntryResult!3158 0))(
  ( (MissingZero!3158 (index!14811 (_ BitVec 32))) (Found!3158 (index!14812 (_ BitVec 32))) (Intermediate!3158 (undefined!3970 Bool) (index!14813 (_ BitVec 32)) (x!33425 (_ BitVec 32))) (Undefined!3158) (MissingVacant!3158 (index!14814 (_ BitVec 32))) )
))
(declare-fun lt!159958 () SeekEntryResult!3158)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17456 (_ BitVec 32)) SeekEntryResult!3158)

(assert (=> b!335704 (= lt!159958 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335705 () Bool)

(declare-fun res!185327 () Bool)

(assert (=> b!335705 (=> (not res!185327) (not e!206068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17456 (_ BitVec 32)) Bool)

(assert (=> b!335705 (= res!185327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335706 () Bool)

(declare-fun res!185326 () Bool)

(assert (=> b!335706 (=> (not res!185326) (not e!206068))))

(declare-datatypes ((List!4642 0))(
  ( (Nil!4639) (Cons!4638 (h!5494 (_ BitVec 64)) (t!9722 List!4642)) )
))
(declare-fun arrayNoDuplicates!0 (array!17456 (_ BitVec 32) List!4642) Bool)

(assert (=> b!335706 (= res!185326 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4639))))

(declare-fun b!335707 () Bool)

(assert (=> b!335707 (= e!206069 tp_is_empty!6937)))

(declare-fun b!335708 () Bool)

(declare-fun res!185329 () Bool)

(assert (=> b!335708 (=> (not res!185329) (not e!206068))))

(assert (=> b!335708 (= res!185329 (and (= (size!8609 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8610 _keys!1895) (size!8609 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33736 res!185328) b!335708))

(assert (= (and b!335708 res!185329) b!335705))

(assert (= (and b!335705 res!185327) b!335706))

(assert (= (and b!335706 res!185326) b!335701))

(assert (= (and b!335701 res!185330) b!335700))

(assert (= (and b!335700 res!185325) b!335704))

(assert (= (and b!335702 condMapEmpty!11802) mapIsEmpty!11802))

(assert (= (and b!335702 (not condMapEmpty!11802)) mapNonEmpty!11802))

(get-info :version)

(assert (= (and mapNonEmpty!11802 ((_ is ValueCellFull!3125) mapValue!11802)) b!335703))

(assert (= (and b!335702 ((_ is ValueCellFull!3125) mapDefault!11802)) b!335707))

(assert (= start!33736 b!335702))

(declare-fun m!339965 () Bool)

(assert (=> b!335701 m!339965))

(declare-fun m!339967 () Bool)

(assert (=> start!33736 m!339967))

(declare-fun m!339969 () Bool)

(assert (=> start!33736 m!339969))

(declare-fun m!339971 () Bool)

(assert (=> start!33736 m!339971))

(declare-fun m!339973 () Bool)

(assert (=> b!335706 m!339973))

(declare-fun m!339975 () Bool)

(assert (=> b!335705 m!339975))

(declare-fun m!339977 () Bool)

(assert (=> b!335700 m!339977))

(assert (=> b!335700 m!339977))

(declare-fun m!339979 () Bool)

(assert (=> b!335700 m!339979))

(declare-fun m!339981 () Bool)

(assert (=> b!335704 m!339981))

(declare-fun m!339983 () Bool)

(assert (=> mapNonEmpty!11802 m!339983))

(check-sat (not b!335700) (not b!335701) tp_is_empty!6937 (not mapNonEmpty!11802) (not b!335705) (not b!335704) b_and!14179 (not b!335706) (not b_next!6985) (not start!33736))
(check-sat b_and!14179 (not b_next!6985))
