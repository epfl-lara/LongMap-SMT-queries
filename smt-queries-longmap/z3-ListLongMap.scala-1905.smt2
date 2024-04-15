; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33954 () Bool)

(assert start!33954)

(declare-fun b_free!7099 () Bool)

(declare-fun b_next!7099 () Bool)

(assert (=> start!33954 (= b_free!7099 (not b_next!7099))))

(declare-fun tp!24815 () Bool)

(declare-fun b_and!14263 () Bool)

(assert (=> start!33954 (= tp!24815 b_and!14263)))

(declare-fun b!337985 () Bool)

(declare-fun e!207378 () Bool)

(declare-fun tp_is_empty!7051 () Bool)

(assert (=> b!337985 (= e!207378 tp_is_empty!7051)))

(declare-fun b!337986 () Bool)

(declare-datatypes ((Unit!10477 0))(
  ( (Unit!10478) )
))
(declare-fun e!207380 () Unit!10477)

(declare-fun Unit!10479 () Unit!10477)

(assert (=> b!337986 (= e!207380 Unit!10479)))

(declare-fun lt!160525 () Unit!10477)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10379 0))(
  ( (V!10380 (val!3570 Int)) )
))
(declare-fun zeroValue!1467 () V!10379)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3182 0))(
  ( (ValueCellFull!3182 (v!5731 V!10379)) (EmptyCell!3182) )
))
(declare-datatypes ((array!17679 0))(
  ( (array!17680 (arr!8365 (Array (_ BitVec 32) ValueCell!3182)) (size!8718 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17679)

(declare-datatypes ((array!17681 0))(
  ( (array!17682 (arr!8366 (Array (_ BitVec 32) (_ BitVec 64))) (size!8719 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17681)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10379)

(declare-fun lemmaArrayContainsKeyThenInListMap!272 (array!17681 array!17679 (_ BitVec 32) (_ BitVec 32) V!10379 V!10379 (_ BitVec 64) (_ BitVec 32) Int) Unit!10477)

(declare-fun arrayScanForKey!0 (array!17681 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337986 (= lt!160525 (lemmaArrayContainsKeyThenInListMap!272 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337986 false))

(declare-fun res!186719 () Bool)

(declare-fun e!207376 () Bool)

(assert (=> start!33954 (=> (not res!186719) (not e!207376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33954 (= res!186719 (validMask!0 mask!2385))))

(assert (=> start!33954 e!207376))

(assert (=> start!33954 true))

(assert (=> start!33954 tp_is_empty!7051))

(assert (=> start!33954 tp!24815))

(declare-fun e!207382 () Bool)

(declare-fun array_inv!6236 (array!17679) Bool)

(assert (=> start!33954 (and (array_inv!6236 _values!1525) e!207382)))

(declare-fun array_inv!6237 (array!17681) Bool)

(assert (=> start!33954 (array_inv!6237 _keys!1895)))

(declare-fun b!337987 () Bool)

(declare-fun res!186713 () Bool)

(assert (=> b!337987 (=> (not res!186713) (not e!207376))))

(declare-datatypes ((tuple2!5126 0))(
  ( (tuple2!5127 (_1!2574 (_ BitVec 64)) (_2!2574 V!10379)) )
))
(declare-datatypes ((List!4759 0))(
  ( (Nil!4756) (Cons!4755 (h!5611 tuple2!5126) (t!9848 List!4759)) )
))
(declare-datatypes ((ListLongMap!4029 0))(
  ( (ListLongMap!4030 (toList!2030 List!4759)) )
))
(declare-fun contains!2090 (ListLongMap!4029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1536 (array!17681 array!17679 (_ BitVec 32) (_ BitVec 32) V!10379 V!10379 (_ BitVec 32) Int) ListLongMap!4029)

(assert (=> b!337987 (= res!186713 (not (contains!2090 (getCurrentListMap!1536 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337988 () Bool)

(declare-fun res!186714 () Bool)

(assert (=> b!337988 (=> (not res!186714) (not e!207376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337988 (= res!186714 (validKeyInArray!0 k0!1348))))

(declare-fun b!337989 () Bool)

(declare-fun e!207381 () Bool)

(declare-fun mapRes!11988 () Bool)

(assert (=> b!337989 (= e!207382 (and e!207381 mapRes!11988))))

(declare-fun condMapEmpty!11988 () Bool)

(declare-fun mapDefault!11988 () ValueCell!3182)

(assert (=> b!337989 (= condMapEmpty!11988 (= (arr!8365 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3182)) mapDefault!11988)))))

(declare-fun b!337990 () Bool)

(declare-fun res!186715 () Bool)

(assert (=> b!337990 (=> (not res!186715) (not e!207376))))

(declare-datatypes ((List!4760 0))(
  ( (Nil!4757) (Cons!4756 (h!5612 (_ BitVec 64)) (t!9849 List!4760)) )
))
(declare-fun arrayNoDuplicates!0 (array!17681 (_ BitVec 32) List!4760) Bool)

(assert (=> b!337990 (= res!186715 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4757))))

(declare-fun b!337991 () Bool)

(declare-fun e!207377 () Bool)

(assert (=> b!337991 (= e!207376 e!207377)))

(declare-fun res!186718 () Bool)

(assert (=> b!337991 (=> (not res!186718) (not e!207377))))

(declare-datatypes ((SeekEntryResult!3231 0))(
  ( (MissingZero!3231 (index!15103 (_ BitVec 32))) (Found!3231 (index!15104 (_ BitVec 32))) (Intermediate!3231 (undefined!4043 Bool) (index!15105 (_ BitVec 32)) (x!33698 (_ BitVec 32))) (Undefined!3231) (MissingVacant!3231 (index!15106 (_ BitVec 32))) )
))
(declare-fun lt!160527 () SeekEntryResult!3231)

(get-info :version)

(assert (=> b!337991 (= res!186718 (and (not ((_ is Found!3231) lt!160527)) ((_ is MissingZero!3231) lt!160527)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17681 (_ BitVec 32)) SeekEntryResult!3231)

(assert (=> b!337991 (= lt!160527 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11988 () Bool)

(assert (=> mapIsEmpty!11988 mapRes!11988))

(declare-fun mapNonEmpty!11988 () Bool)

(declare-fun tp!24816 () Bool)

(assert (=> mapNonEmpty!11988 (= mapRes!11988 (and tp!24816 e!207378))))

(declare-fun mapKey!11988 () (_ BitVec 32))

(declare-fun mapValue!11988 () ValueCell!3182)

(declare-fun mapRest!11988 () (Array (_ BitVec 32) ValueCell!3182))

(assert (=> mapNonEmpty!11988 (= (arr!8365 _values!1525) (store mapRest!11988 mapKey!11988 mapValue!11988))))

(declare-fun b!337992 () Bool)

(declare-fun Unit!10480 () Unit!10477)

(assert (=> b!337992 (= e!207380 Unit!10480)))

(declare-fun b!337993 () Bool)

(declare-fun res!186717 () Bool)

(assert (=> b!337993 (=> (not res!186717) (not e!207376))))

(assert (=> b!337993 (= res!186717 (and (= (size!8718 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8719 _keys!1895) (size!8718 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337994 () Bool)

(assert (=> b!337994 (= e!207377 false)))

(declare-fun lt!160526 () Unit!10477)

(assert (=> b!337994 (= lt!160526 e!207380)))

(declare-fun c!52337 () Bool)

(declare-fun arrayContainsKey!0 (array!17681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337994 (= c!52337 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337995 () Bool)

(declare-fun res!186716 () Bool)

(assert (=> b!337995 (=> (not res!186716) (not e!207376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17681 (_ BitVec 32)) Bool)

(assert (=> b!337995 (= res!186716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337996 () Bool)

(assert (=> b!337996 (= e!207381 tp_is_empty!7051)))

(assert (= (and start!33954 res!186719) b!337993))

(assert (= (and b!337993 res!186717) b!337995))

(assert (= (and b!337995 res!186716) b!337990))

(assert (= (and b!337990 res!186715) b!337988))

(assert (= (and b!337988 res!186714) b!337987))

(assert (= (and b!337987 res!186713) b!337991))

(assert (= (and b!337991 res!186718) b!337994))

(assert (= (and b!337994 c!52337) b!337986))

(assert (= (and b!337994 (not c!52337)) b!337992))

(assert (= (and b!337989 condMapEmpty!11988) mapIsEmpty!11988))

(assert (= (and b!337989 (not condMapEmpty!11988)) mapNonEmpty!11988))

(assert (= (and mapNonEmpty!11988 ((_ is ValueCellFull!3182) mapValue!11988)) b!337985))

(assert (= (and b!337989 ((_ is ValueCellFull!3182) mapDefault!11988)) b!337996))

(assert (= start!33954 b!337989))

(declare-fun m!340831 () Bool)

(assert (=> b!337995 m!340831))

(declare-fun m!340833 () Bool)

(assert (=> b!337991 m!340833))

(declare-fun m!340835 () Bool)

(assert (=> b!337986 m!340835))

(assert (=> b!337986 m!340835))

(declare-fun m!340837 () Bool)

(assert (=> b!337986 m!340837))

(declare-fun m!340839 () Bool)

(assert (=> mapNonEmpty!11988 m!340839))

(declare-fun m!340841 () Bool)

(assert (=> start!33954 m!340841))

(declare-fun m!340843 () Bool)

(assert (=> start!33954 m!340843))

(declare-fun m!340845 () Bool)

(assert (=> start!33954 m!340845))

(declare-fun m!340847 () Bool)

(assert (=> b!337994 m!340847))

(declare-fun m!340849 () Bool)

(assert (=> b!337988 m!340849))

(declare-fun m!340851 () Bool)

(assert (=> b!337990 m!340851))

(declare-fun m!340853 () Bool)

(assert (=> b!337987 m!340853))

(assert (=> b!337987 m!340853))

(declare-fun m!340855 () Bool)

(assert (=> b!337987 m!340855))

(check-sat (not b!337991) (not mapNonEmpty!11988) tp_is_empty!7051 b_and!14263 (not b!337990) (not b!337988) (not b!337987) (not b!337994) (not b!337986) (not b_next!7099) (not start!33954) (not b!337995))
(check-sat b_and!14263 (not b_next!7099))
