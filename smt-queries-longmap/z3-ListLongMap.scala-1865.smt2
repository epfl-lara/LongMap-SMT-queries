; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33610 () Bool)

(assert start!33610)

(declare-fun b_free!6859 () Bool)

(declare-fun b_next!6859 () Bool)

(assert (=> start!33610 (= b_free!6859 (not b_next!6859))))

(declare-fun tp!24081 () Bool)

(declare-fun b_and!14053 () Bool)

(assert (=> start!33610 (= tp!24081 b_and!14053)))

(declare-fun b!333639 () Bool)

(declare-fun res!183831 () Bool)

(declare-fun e!204855 () Bool)

(assert (=> b!333639 (=> (not res!183831) (not e!204855))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333639 (= res!183831 (validKeyInArray!0 k0!1348))))

(declare-fun b!333640 () Bool)

(declare-fun res!183833 () Bool)

(assert (=> b!333640 (=> (not res!183833) (not e!204855))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17210 0))(
  ( (array!17211 (arr!8135 (Array (_ BitVec 32) (_ BitVec 64))) (size!8487 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17210)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((V!10059 0))(
  ( (V!10060 (val!3450 Int)) )
))
(declare-datatypes ((ValueCell!3062 0))(
  ( (ValueCellFull!3062 (v!5613 V!10059)) (EmptyCell!3062) )
))
(declare-datatypes ((array!17212 0))(
  ( (array!17213 (arr!8136 (Array (_ BitVec 32) ValueCell!3062)) (size!8488 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17212)

(assert (=> b!333640 (= res!183833 (and (= (size!8488 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8487 _keys!1895) (size!8488 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333641 () Bool)

(declare-fun res!183836 () Bool)

(assert (=> b!333641 (=> (not res!183836) (not e!204855))))

(declare-datatypes ((List!4547 0))(
  ( (Nil!4544) (Cons!4543 (h!5399 (_ BitVec 64)) (t!9627 List!4547)) )
))
(declare-fun arrayNoDuplicates!0 (array!17210 (_ BitVec 32) List!4547) Bool)

(assert (=> b!333641 (= res!183836 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4544))))

(declare-fun b!333642 () Bool)

(declare-fun e!204856 () Bool)

(declare-fun tp_is_empty!6811 () Bool)

(assert (=> b!333642 (= e!204856 tp_is_empty!6811)))

(declare-fun mapIsEmpty!11613 () Bool)

(declare-fun mapRes!11613 () Bool)

(assert (=> mapIsEmpty!11613 mapRes!11613))

(declare-fun mapNonEmpty!11613 () Bool)

(declare-fun tp!24080 () Bool)

(declare-fun e!204854 () Bool)

(assert (=> mapNonEmpty!11613 (= mapRes!11613 (and tp!24080 e!204854))))

(declare-fun mapValue!11613 () ValueCell!3062)

(declare-fun mapRest!11613 () (Array (_ BitVec 32) ValueCell!3062))

(declare-fun mapKey!11613 () (_ BitVec 32))

(assert (=> mapNonEmpty!11613 (= (arr!8136 _values!1525) (store mapRest!11613 mapKey!11613 mapValue!11613))))

(declare-fun b!333643 () Bool)

(declare-fun res!183832 () Bool)

(assert (=> b!333643 (=> (not res!183832) (not e!204855))))

(declare-fun zeroValue!1467 () V!10059)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10059)

(declare-datatypes ((tuple2!4932 0))(
  ( (tuple2!4933 (_1!2477 (_ BitVec 64)) (_2!2477 V!10059)) )
))
(declare-datatypes ((List!4548 0))(
  ( (Nil!4545) (Cons!4544 (h!5400 tuple2!4932) (t!9628 List!4548)) )
))
(declare-datatypes ((ListLongMap!3847 0))(
  ( (ListLongMap!3848 (toList!1939 List!4548)) )
))
(declare-fun contains!2002 (ListLongMap!3847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1471 (array!17210 array!17212 (_ BitVec 32) (_ BitVec 32) V!10059 V!10059 (_ BitVec 32) Int) ListLongMap!3847)

(assert (=> b!333643 (= res!183832 (not (contains!2002 (getCurrentListMap!1471 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333644 () Bool)

(declare-fun res!183834 () Bool)

(assert (=> b!333644 (=> (not res!183834) (not e!204855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17210 (_ BitVec 32)) Bool)

(assert (=> b!333644 (= res!183834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333645 () Bool)

(declare-fun e!204853 () Bool)

(assert (=> b!333645 (= e!204853 (and e!204856 mapRes!11613))))

(declare-fun condMapEmpty!11613 () Bool)

(declare-fun mapDefault!11613 () ValueCell!3062)

(assert (=> b!333645 (= condMapEmpty!11613 (= (arr!8136 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3062)) mapDefault!11613)))))

(declare-fun res!183835 () Bool)

(assert (=> start!33610 (=> (not res!183835) (not e!204855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33610 (= res!183835 (validMask!0 mask!2385))))

(assert (=> start!33610 e!204855))

(assert (=> start!33610 true))

(assert (=> start!33610 tp_is_empty!6811))

(assert (=> start!33610 tp!24081))

(declare-fun array_inv!6054 (array!17212) Bool)

(assert (=> start!33610 (and (array_inv!6054 _values!1525) e!204853)))

(declare-fun array_inv!6055 (array!17210) Bool)

(assert (=> start!33610 (array_inv!6055 _keys!1895)))

(declare-fun b!333646 () Bool)

(assert (=> b!333646 (= e!204854 tp_is_empty!6811)))

(declare-fun b!333647 () Bool)

(assert (=> b!333647 (= e!204855 false)))

(declare-datatypes ((SeekEntryResult!3107 0))(
  ( (MissingZero!3107 (index!14607 (_ BitVec 32))) (Found!3107 (index!14608 (_ BitVec 32))) (Intermediate!3107 (undefined!3919 Bool) (index!14609 (_ BitVec 32)) (x!33206 (_ BitVec 32))) (Undefined!3107) (MissingVacant!3107 (index!14610 (_ BitVec 32))) )
))
(declare-fun lt!159409 () SeekEntryResult!3107)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17210 (_ BitVec 32)) SeekEntryResult!3107)

(assert (=> b!333647 (= lt!159409 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33610 res!183835) b!333640))

(assert (= (and b!333640 res!183833) b!333644))

(assert (= (and b!333644 res!183834) b!333641))

(assert (= (and b!333641 res!183836) b!333639))

(assert (= (and b!333639 res!183831) b!333643))

(assert (= (and b!333643 res!183832) b!333647))

(assert (= (and b!333645 condMapEmpty!11613) mapIsEmpty!11613))

(assert (= (and b!333645 (not condMapEmpty!11613)) mapNonEmpty!11613))

(get-info :version)

(assert (= (and mapNonEmpty!11613 ((_ is ValueCellFull!3062) mapValue!11613)) b!333646))

(assert (= (and b!333645 ((_ is ValueCellFull!3062) mapDefault!11613)) b!333642))

(assert (= start!33610 b!333645))

(declare-fun m!338105 () Bool)

(assert (=> start!33610 m!338105))

(declare-fun m!338107 () Bool)

(assert (=> start!33610 m!338107))

(declare-fun m!338109 () Bool)

(assert (=> start!33610 m!338109))

(declare-fun m!338111 () Bool)

(assert (=> b!333643 m!338111))

(assert (=> b!333643 m!338111))

(declare-fun m!338113 () Bool)

(assert (=> b!333643 m!338113))

(declare-fun m!338115 () Bool)

(assert (=> b!333647 m!338115))

(declare-fun m!338117 () Bool)

(assert (=> b!333644 m!338117))

(declare-fun m!338119 () Bool)

(assert (=> b!333639 m!338119))

(declare-fun m!338121 () Bool)

(assert (=> mapNonEmpty!11613 m!338121))

(declare-fun m!338123 () Bool)

(assert (=> b!333641 m!338123))

(check-sat (not b!333641) (not b!333643) (not b!333639) b_and!14053 (not mapNonEmpty!11613) (not start!33610) (not b!333644) tp_is_empty!6811 (not b_next!6859) (not b!333647))
(check-sat b_and!14053 (not b_next!6859))
