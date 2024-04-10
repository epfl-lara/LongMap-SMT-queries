; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33838 () Bool)

(assert start!33838)

(declare-fun b_free!7017 () Bool)

(declare-fun b_next!7017 () Bool)

(assert (=> start!33838 (= b_free!7017 (not b_next!7017))))

(declare-fun tp!24563 () Bool)

(declare-fun b_and!14203 () Bool)

(assert (=> start!33838 (= tp!24563 b_and!14203)))

(declare-fun b!336600 () Bool)

(declare-fun res!185789 () Bool)

(declare-fun e!206608 () Bool)

(assert (=> b!336600 (=> (not res!185789) (not e!206608))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336600 (= res!185789 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11859 () Bool)

(declare-fun mapRes!11859 () Bool)

(assert (=> mapIsEmpty!11859 mapRes!11859))

(declare-fun res!185785 () Bool)

(assert (=> start!33838 (=> (not res!185785) (not e!206608))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33838 (= res!185785 (validMask!0 mask!2385))))

(assert (=> start!33838 e!206608))

(assert (=> start!33838 true))

(declare-fun tp_is_empty!6969 () Bool)

(assert (=> start!33838 tp_is_empty!6969))

(assert (=> start!33838 tp!24563))

(declare-datatypes ((V!10269 0))(
  ( (V!10270 (val!3529 Int)) )
))
(declare-datatypes ((ValueCell!3141 0))(
  ( (ValueCellFull!3141 (v!5694 V!10269)) (EmptyCell!3141) )
))
(declare-datatypes ((array!17535 0))(
  ( (array!17536 (arr!8295 (Array (_ BitVec 32) ValueCell!3141)) (size!8647 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17535)

(declare-fun e!206607 () Bool)

(declare-fun array_inv!6156 (array!17535) Bool)

(assert (=> start!33838 (and (array_inv!6156 _values!1525) e!206607)))

(declare-datatypes ((array!17537 0))(
  ( (array!17538 (arr!8296 (Array (_ BitVec 32) (_ BitVec 64))) (size!8648 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17537)

(declare-fun array_inv!6157 (array!17537) Bool)

(assert (=> start!33838 (array_inv!6157 _keys!1895)))

(declare-fun b!336601 () Bool)

(declare-fun res!185787 () Bool)

(declare-fun e!206606 () Bool)

(assert (=> b!336601 (=> (not res!185787) (not e!206606))))

(declare-fun arrayContainsKey!0 (array!17537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336601 (= res!185787 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336602 () Bool)

(assert (=> b!336602 (= e!206608 e!206606)))

(declare-fun res!185790 () Bool)

(assert (=> b!336602 (=> (not res!185790) (not e!206606))))

(declare-datatypes ((SeekEntryResult!3205 0))(
  ( (MissingZero!3205 (index!14999 (_ BitVec 32))) (Found!3205 (index!15000 (_ BitVec 32))) (Intermediate!3205 (undefined!4017 Bool) (index!15001 (_ BitVec 32)) (x!33545 (_ BitVec 32))) (Undefined!3205) (MissingVacant!3205 (index!15002 (_ BitVec 32))) )
))
(declare-fun lt!160281 () SeekEntryResult!3205)

(get-info :version)

(assert (=> b!336602 (= res!185790 (and (not ((_ is Found!3205) lt!160281)) ((_ is MissingZero!3205) lt!160281)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17537 (_ BitVec 32)) SeekEntryResult!3205)

(assert (=> b!336602 (= lt!160281 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336603 () Bool)

(declare-fun res!185788 () Bool)

(assert (=> b!336603 (=> (not res!185788) (not e!206608))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336603 (= res!185788 (and (= (size!8647 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8648 _keys!1895) (size!8647 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336604 () Bool)

(assert (=> b!336604 (= e!206606 false)))

(declare-fun lt!160282 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17537 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336604 (= lt!160282 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336605 () Bool)

(declare-fun e!206610 () Bool)

(assert (=> b!336605 (= e!206610 tp_is_empty!6969)))

(declare-fun b!336606 () Bool)

(declare-fun res!185791 () Bool)

(assert (=> b!336606 (=> (not res!185791) (not e!206608))))

(declare-datatypes ((List!4740 0))(
  ( (Nil!4737) (Cons!4736 (h!5592 (_ BitVec 64)) (t!9834 List!4740)) )
))
(declare-fun arrayNoDuplicates!0 (array!17537 (_ BitVec 32) List!4740) Bool)

(assert (=> b!336606 (= res!185791 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4737))))

(declare-fun b!336607 () Bool)

(assert (=> b!336607 (= e!206607 (and e!206610 mapRes!11859))))

(declare-fun condMapEmpty!11859 () Bool)

(declare-fun mapDefault!11859 () ValueCell!3141)

(assert (=> b!336607 (= condMapEmpty!11859 (= (arr!8295 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3141)) mapDefault!11859)))))

(declare-fun b!336608 () Bool)

(declare-fun res!185786 () Bool)

(assert (=> b!336608 (=> (not res!185786) (not e!206608))))

(declare-fun zeroValue!1467 () V!10269)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10269)

(declare-datatypes ((tuple2!5126 0))(
  ( (tuple2!5127 (_1!2574 (_ BitVec 64)) (_2!2574 V!10269)) )
))
(declare-datatypes ((List!4741 0))(
  ( (Nil!4738) (Cons!4737 (h!5593 tuple2!5126) (t!9835 List!4741)) )
))
(declare-datatypes ((ListLongMap!4039 0))(
  ( (ListLongMap!4040 (toList!2035 List!4741)) )
))
(declare-fun contains!2082 (ListLongMap!4039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1556 (array!17537 array!17535 (_ BitVec 32) (_ BitVec 32) V!10269 V!10269 (_ BitVec 32) Int) ListLongMap!4039)

(assert (=> b!336608 (= res!185786 (not (contains!2082 (getCurrentListMap!1556 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!11859 () Bool)

(declare-fun tp!24564 () Bool)

(declare-fun e!206605 () Bool)

(assert (=> mapNonEmpty!11859 (= mapRes!11859 (and tp!24564 e!206605))))

(declare-fun mapKey!11859 () (_ BitVec 32))

(declare-fun mapValue!11859 () ValueCell!3141)

(declare-fun mapRest!11859 () (Array (_ BitVec 32) ValueCell!3141))

(assert (=> mapNonEmpty!11859 (= (arr!8295 _values!1525) (store mapRest!11859 mapKey!11859 mapValue!11859))))

(declare-fun b!336609 () Bool)

(declare-fun res!185792 () Bool)

(assert (=> b!336609 (=> (not res!185792) (not e!206608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17537 (_ BitVec 32)) Bool)

(assert (=> b!336609 (= res!185792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336610 () Bool)

(assert (=> b!336610 (= e!206605 tp_is_empty!6969)))

(assert (= (and start!33838 res!185785) b!336603))

(assert (= (and b!336603 res!185788) b!336609))

(assert (= (and b!336609 res!185792) b!336606))

(assert (= (and b!336606 res!185791) b!336600))

(assert (= (and b!336600 res!185789) b!336608))

(assert (= (and b!336608 res!185786) b!336602))

(assert (= (and b!336602 res!185790) b!336601))

(assert (= (and b!336601 res!185787) b!336604))

(assert (= (and b!336607 condMapEmpty!11859) mapIsEmpty!11859))

(assert (= (and b!336607 (not condMapEmpty!11859)) mapNonEmpty!11859))

(assert (= (and mapNonEmpty!11859 ((_ is ValueCellFull!3141) mapValue!11859)) b!336610))

(assert (= (and b!336607 ((_ is ValueCellFull!3141) mapDefault!11859)) b!336605))

(assert (= start!33838 b!336607))

(declare-fun m!340355 () Bool)

(assert (=> mapNonEmpty!11859 m!340355))

(declare-fun m!340357 () Bool)

(assert (=> start!33838 m!340357))

(declare-fun m!340359 () Bool)

(assert (=> start!33838 m!340359))

(declare-fun m!340361 () Bool)

(assert (=> start!33838 m!340361))

(declare-fun m!340363 () Bool)

(assert (=> b!336600 m!340363))

(declare-fun m!340365 () Bool)

(assert (=> b!336602 m!340365))

(declare-fun m!340367 () Bool)

(assert (=> b!336609 m!340367))

(declare-fun m!340369 () Bool)

(assert (=> b!336608 m!340369))

(assert (=> b!336608 m!340369))

(declare-fun m!340371 () Bool)

(assert (=> b!336608 m!340371))

(declare-fun m!340373 () Bool)

(assert (=> b!336601 m!340373))

(declare-fun m!340375 () Bool)

(assert (=> b!336604 m!340375))

(declare-fun m!340377 () Bool)

(assert (=> b!336606 m!340377))

(check-sat (not b!336604) (not b!336608) (not b_next!7017) (not b!336609) b_and!14203 (not start!33838) (not b!336606) (not mapNonEmpty!11859) (not b!336600) tp_is_empty!6969 (not b!336602) (not b!336601))
(check-sat b_and!14203 (not b_next!7017))
