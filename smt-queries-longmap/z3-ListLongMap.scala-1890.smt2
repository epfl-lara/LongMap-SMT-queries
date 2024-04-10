; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33832 () Bool)

(assert start!33832)

(declare-fun b_free!7011 () Bool)

(declare-fun b_next!7011 () Bool)

(assert (=> start!33832 (= b_free!7011 (not b_next!7011))))

(declare-fun tp!24546 () Bool)

(declare-fun b_and!14197 () Bool)

(assert (=> start!33832 (= tp!24546 b_and!14197)))

(declare-fun b!336509 () Bool)

(declare-fun res!185723 () Bool)

(declare-fun e!206559 () Bool)

(assert (=> b!336509 (=> (not res!185723) (not e!206559))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17523 0))(
  ( (array!17524 (arr!8289 (Array (_ BitVec 32) (_ BitVec 64))) (size!8641 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17523)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10261 0))(
  ( (V!10262 (val!3526 Int)) )
))
(declare-datatypes ((ValueCell!3138 0))(
  ( (ValueCellFull!3138 (v!5691 V!10261)) (EmptyCell!3138) )
))
(declare-datatypes ((array!17525 0))(
  ( (array!17526 (arr!8290 (Array (_ BitVec 32) ValueCell!3138)) (size!8642 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17525)

(assert (=> b!336509 (= res!185723 (and (= (size!8642 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8641 _keys!1895) (size!8642 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336510 () Bool)

(declare-fun e!206558 () Bool)

(declare-fun e!206557 () Bool)

(declare-fun mapRes!11850 () Bool)

(assert (=> b!336510 (= e!206558 (and e!206557 mapRes!11850))))

(declare-fun condMapEmpty!11850 () Bool)

(declare-fun mapDefault!11850 () ValueCell!3138)

(assert (=> b!336510 (= condMapEmpty!11850 (= (arr!8290 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3138)) mapDefault!11850)))))

(declare-fun b!336511 () Bool)

(declare-fun res!185724 () Bool)

(assert (=> b!336511 (=> (not res!185724) (not e!206559))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336511 (= res!185724 (validKeyInArray!0 k0!1348))))

(declare-fun b!336512 () Bool)

(declare-fun res!185722 () Bool)

(assert (=> b!336512 (=> (not res!185722) (not e!206559))))

(declare-datatypes ((List!4737 0))(
  ( (Nil!4734) (Cons!4733 (h!5589 (_ BitVec 64)) (t!9831 List!4737)) )
))
(declare-fun arrayNoDuplicates!0 (array!17523 (_ BitVec 32) List!4737) Bool)

(assert (=> b!336512 (= res!185722 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4734))))

(declare-fun b!336513 () Bool)

(declare-fun res!185721 () Bool)

(assert (=> b!336513 (=> (not res!185721) (not e!206559))))

(declare-fun zeroValue!1467 () V!10261)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10261)

(declare-datatypes ((tuple2!5122 0))(
  ( (tuple2!5123 (_1!2572 (_ BitVec 64)) (_2!2572 V!10261)) )
))
(declare-datatypes ((List!4738 0))(
  ( (Nil!4735) (Cons!4734 (h!5590 tuple2!5122) (t!9832 List!4738)) )
))
(declare-datatypes ((ListLongMap!4035 0))(
  ( (ListLongMap!4036 (toList!2033 List!4738)) )
))
(declare-fun contains!2080 (ListLongMap!4035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1554 (array!17523 array!17525 (_ BitVec 32) (_ BitVec 32) V!10261 V!10261 (_ BitVec 32) Int) ListLongMap!4035)

(assert (=> b!336513 (= res!185721 (not (contains!2080 (getCurrentListMap!1554 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336514 () Bool)

(declare-fun res!185725 () Bool)

(assert (=> b!336514 (=> (not res!185725) (not e!206559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17523 (_ BitVec 32)) Bool)

(assert (=> b!336514 (= res!185725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11850 () Bool)

(assert (=> mapIsEmpty!11850 mapRes!11850))

(declare-fun res!185726 () Bool)

(assert (=> start!33832 (=> (not res!185726) (not e!206559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33832 (= res!185726 (validMask!0 mask!2385))))

(assert (=> start!33832 e!206559))

(assert (=> start!33832 true))

(declare-fun tp_is_empty!6963 () Bool)

(assert (=> start!33832 tp_is_empty!6963))

(assert (=> start!33832 tp!24546))

(declare-fun array_inv!6152 (array!17525) Bool)

(assert (=> start!33832 (and (array_inv!6152 _values!1525) e!206558)))

(declare-fun array_inv!6153 (array!17523) Bool)

(assert (=> start!33832 (array_inv!6153 _keys!1895)))

(declare-fun b!336515 () Bool)

(assert (=> b!336515 (= e!206559 false)))

(declare-datatypes ((SeekEntryResult!3203 0))(
  ( (MissingZero!3203 (index!14991 (_ BitVec 32))) (Found!3203 (index!14992 (_ BitVec 32))) (Intermediate!3203 (undefined!4015 Bool) (index!14993 (_ BitVec 32)) (x!33535 (_ BitVec 32))) (Undefined!3203) (MissingVacant!3203 (index!14994 (_ BitVec 32))) )
))
(declare-fun lt!160267 () SeekEntryResult!3203)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17523 (_ BitVec 32)) SeekEntryResult!3203)

(assert (=> b!336515 (= lt!160267 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11850 () Bool)

(declare-fun tp!24545 () Bool)

(declare-fun e!206556 () Bool)

(assert (=> mapNonEmpty!11850 (= mapRes!11850 (and tp!24545 e!206556))))

(declare-fun mapValue!11850 () ValueCell!3138)

(declare-fun mapRest!11850 () (Array (_ BitVec 32) ValueCell!3138))

(declare-fun mapKey!11850 () (_ BitVec 32))

(assert (=> mapNonEmpty!11850 (= (arr!8290 _values!1525) (store mapRest!11850 mapKey!11850 mapValue!11850))))

(declare-fun b!336516 () Bool)

(assert (=> b!336516 (= e!206556 tp_is_empty!6963)))

(declare-fun b!336517 () Bool)

(assert (=> b!336517 (= e!206557 tp_is_empty!6963)))

(assert (= (and start!33832 res!185726) b!336509))

(assert (= (and b!336509 res!185723) b!336514))

(assert (= (and b!336514 res!185725) b!336512))

(assert (= (and b!336512 res!185722) b!336511))

(assert (= (and b!336511 res!185724) b!336513))

(assert (= (and b!336513 res!185721) b!336515))

(assert (= (and b!336510 condMapEmpty!11850) mapIsEmpty!11850))

(assert (= (and b!336510 (not condMapEmpty!11850)) mapNonEmpty!11850))

(get-info :version)

(assert (= (and mapNonEmpty!11850 ((_ is ValueCellFull!3138) mapValue!11850)) b!336516))

(assert (= (and b!336510 ((_ is ValueCellFull!3138) mapDefault!11850)) b!336517))

(assert (= start!33832 b!336510))

(declare-fun m!340291 () Bool)

(assert (=> start!33832 m!340291))

(declare-fun m!340293 () Bool)

(assert (=> start!33832 m!340293))

(declare-fun m!340295 () Bool)

(assert (=> start!33832 m!340295))

(declare-fun m!340297 () Bool)

(assert (=> b!336514 m!340297))

(declare-fun m!340299 () Bool)

(assert (=> b!336513 m!340299))

(assert (=> b!336513 m!340299))

(declare-fun m!340301 () Bool)

(assert (=> b!336513 m!340301))

(declare-fun m!340303 () Bool)

(assert (=> mapNonEmpty!11850 m!340303))

(declare-fun m!340305 () Bool)

(assert (=> b!336515 m!340305))

(declare-fun m!340307 () Bool)

(assert (=> b!336512 m!340307))

(declare-fun m!340309 () Bool)

(assert (=> b!336511 m!340309))

(check-sat tp_is_empty!6963 (not mapNonEmpty!11850) (not b!336513) (not b!336511) (not b_next!7011) (not start!33832) (not b!336514) (not b!336512) b_and!14197 (not b!336515))
(check-sat b_and!14197 (not b_next!7011))
