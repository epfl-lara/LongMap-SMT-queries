; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33960 () Bool)

(assert start!33960)

(declare-fun b_free!7105 () Bool)

(declare-fun b_next!7105 () Bool)

(assert (=> start!33960 (= b_free!7105 (not b_next!7105))))

(declare-fun tp!24833 () Bool)

(declare-fun b_and!14269 () Bool)

(assert (=> start!33960 (= tp!24833 b_and!14269)))

(declare-fun b!338093 () Bool)

(declare-fun e!207440 () Bool)

(declare-fun tp_is_empty!7057 () Bool)

(assert (=> b!338093 (= e!207440 tp_is_empty!7057)))

(declare-fun b!338094 () Bool)

(declare-datatypes ((Unit!10484 0))(
  ( (Unit!10485) )
))
(declare-fun e!207439 () Unit!10484)

(declare-fun Unit!10486 () Unit!10484)

(assert (=> b!338094 (= e!207439 Unit!10486)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10387 0))(
  ( (V!10388 (val!3573 Int)) )
))
(declare-fun zeroValue!1467 () V!10387)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!160553 () Unit!10484)

(declare-datatypes ((ValueCell!3185 0))(
  ( (ValueCellFull!3185 (v!5734 V!10387)) (EmptyCell!3185) )
))
(declare-datatypes ((array!17691 0))(
  ( (array!17692 (arr!8371 (Array (_ BitVec 32) ValueCell!3185)) (size!8724 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17691)

(declare-datatypes ((array!17693 0))(
  ( (array!17694 (arr!8372 (Array (_ BitVec 32) (_ BitVec 64))) (size!8725 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17693)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10387)

(declare-fun lemmaArrayContainsKeyThenInListMap!274 (array!17693 array!17691 (_ BitVec 32) (_ BitVec 32) V!10387 V!10387 (_ BitVec 64) (_ BitVec 32) Int) Unit!10484)

(declare-fun arrayScanForKey!0 (array!17693 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338094 (= lt!160553 (lemmaArrayContainsKeyThenInListMap!274 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338094 false))

(declare-fun b!338095 () Bool)

(declare-fun e!207445 () Bool)

(assert (=> b!338095 (= e!207445 false)))

(declare-fun lt!160552 () Unit!10484)

(assert (=> b!338095 (= lt!160552 e!207439)))

(declare-fun c!52346 () Bool)

(declare-fun arrayContainsKey!0 (array!17693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338095 (= c!52346 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338096 () Bool)

(declare-fun e!207444 () Bool)

(assert (=> b!338096 (= e!207444 e!207445)))

(declare-fun res!186778 () Bool)

(assert (=> b!338096 (=> (not res!186778) (not e!207445))))

(declare-datatypes ((SeekEntryResult!3232 0))(
  ( (MissingZero!3232 (index!15107 (_ BitVec 32))) (Found!3232 (index!15108 (_ BitVec 32))) (Intermediate!3232 (undefined!4044 Bool) (index!15109 (_ BitVec 32)) (x!33707 (_ BitVec 32))) (Undefined!3232) (MissingVacant!3232 (index!15110 (_ BitVec 32))) )
))
(declare-fun lt!160554 () SeekEntryResult!3232)

(get-info :version)

(assert (=> b!338096 (= res!186778 (and (not ((_ is Found!3232) lt!160554)) ((_ is MissingZero!3232) lt!160554)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17693 (_ BitVec 32)) SeekEntryResult!3232)

(assert (=> b!338096 (= lt!160554 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11997 () Bool)

(declare-fun mapRes!11997 () Bool)

(assert (=> mapIsEmpty!11997 mapRes!11997))

(declare-fun b!338097 () Bool)

(declare-fun Unit!10487 () Unit!10484)

(assert (=> b!338097 (= e!207439 Unit!10487)))

(declare-fun b!338098 () Bool)

(declare-fun res!186782 () Bool)

(assert (=> b!338098 (=> (not res!186782) (not e!207444))))

(assert (=> b!338098 (= res!186782 (and (= (size!8724 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8725 _keys!1895) (size!8724 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!186781 () Bool)

(assert (=> start!33960 (=> (not res!186781) (not e!207444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33960 (= res!186781 (validMask!0 mask!2385))))

(assert (=> start!33960 e!207444))

(assert (=> start!33960 true))

(assert (=> start!33960 tp_is_empty!7057))

(assert (=> start!33960 tp!24833))

(declare-fun e!207441 () Bool)

(declare-fun array_inv!6238 (array!17691) Bool)

(assert (=> start!33960 (and (array_inv!6238 _values!1525) e!207441)))

(declare-fun array_inv!6239 (array!17693) Bool)

(assert (=> start!33960 (array_inv!6239 _keys!1895)))

(declare-fun b!338099 () Bool)

(declare-fun e!207443 () Bool)

(assert (=> b!338099 (= e!207441 (and e!207443 mapRes!11997))))

(declare-fun condMapEmpty!11997 () Bool)

(declare-fun mapDefault!11997 () ValueCell!3185)

(assert (=> b!338099 (= condMapEmpty!11997 (= (arr!8371 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3185)) mapDefault!11997)))))

(declare-fun b!338100 () Bool)

(declare-fun res!186777 () Bool)

(assert (=> b!338100 (=> (not res!186777) (not e!207444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338100 (= res!186777 (validKeyInArray!0 k0!1348))))

(declare-fun b!338101 () Bool)

(declare-fun res!186776 () Bool)

(assert (=> b!338101 (=> (not res!186776) (not e!207444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17693 (_ BitVec 32)) Bool)

(assert (=> b!338101 (= res!186776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338102 () Bool)

(declare-fun res!186780 () Bool)

(assert (=> b!338102 (=> (not res!186780) (not e!207444))))

(declare-datatypes ((tuple2!5130 0))(
  ( (tuple2!5131 (_1!2576 (_ BitVec 64)) (_2!2576 V!10387)) )
))
(declare-datatypes ((List!4762 0))(
  ( (Nil!4759) (Cons!4758 (h!5614 tuple2!5130) (t!9851 List!4762)) )
))
(declare-datatypes ((ListLongMap!4033 0))(
  ( (ListLongMap!4034 (toList!2032 List!4762)) )
))
(declare-fun contains!2092 (ListLongMap!4033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1538 (array!17693 array!17691 (_ BitVec 32) (_ BitVec 32) V!10387 V!10387 (_ BitVec 32) Int) ListLongMap!4033)

(assert (=> b!338102 (= res!186780 (not (contains!2092 (getCurrentListMap!1538 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338103 () Bool)

(declare-fun res!186779 () Bool)

(assert (=> b!338103 (=> (not res!186779) (not e!207444))))

(declare-datatypes ((List!4763 0))(
  ( (Nil!4760) (Cons!4759 (h!5615 (_ BitVec 64)) (t!9852 List!4763)) )
))
(declare-fun arrayNoDuplicates!0 (array!17693 (_ BitVec 32) List!4763) Bool)

(assert (=> b!338103 (= res!186779 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4760))))

(declare-fun mapNonEmpty!11997 () Bool)

(declare-fun tp!24834 () Bool)

(assert (=> mapNonEmpty!11997 (= mapRes!11997 (and tp!24834 e!207440))))

(declare-fun mapKey!11997 () (_ BitVec 32))

(declare-fun mapValue!11997 () ValueCell!3185)

(declare-fun mapRest!11997 () (Array (_ BitVec 32) ValueCell!3185))

(assert (=> mapNonEmpty!11997 (= (arr!8371 _values!1525) (store mapRest!11997 mapKey!11997 mapValue!11997))))

(declare-fun b!338104 () Bool)

(assert (=> b!338104 (= e!207443 tp_is_empty!7057)))

(assert (= (and start!33960 res!186781) b!338098))

(assert (= (and b!338098 res!186782) b!338101))

(assert (= (and b!338101 res!186776) b!338103))

(assert (= (and b!338103 res!186779) b!338100))

(assert (= (and b!338100 res!186777) b!338102))

(assert (= (and b!338102 res!186780) b!338096))

(assert (= (and b!338096 res!186778) b!338095))

(assert (= (and b!338095 c!52346) b!338094))

(assert (= (and b!338095 (not c!52346)) b!338097))

(assert (= (and b!338099 condMapEmpty!11997) mapIsEmpty!11997))

(assert (= (and b!338099 (not condMapEmpty!11997)) mapNonEmpty!11997))

(assert (= (and mapNonEmpty!11997 ((_ is ValueCellFull!3185) mapValue!11997)) b!338093))

(assert (= (and b!338099 ((_ is ValueCellFull!3185) mapDefault!11997)) b!338104))

(assert (= start!33960 b!338099))

(declare-fun m!340909 () Bool)

(assert (=> start!33960 m!340909))

(declare-fun m!340911 () Bool)

(assert (=> start!33960 m!340911))

(declare-fun m!340913 () Bool)

(assert (=> start!33960 m!340913))

(declare-fun m!340915 () Bool)

(assert (=> mapNonEmpty!11997 m!340915))

(declare-fun m!340917 () Bool)

(assert (=> b!338094 m!340917))

(assert (=> b!338094 m!340917))

(declare-fun m!340919 () Bool)

(assert (=> b!338094 m!340919))

(declare-fun m!340921 () Bool)

(assert (=> b!338102 m!340921))

(assert (=> b!338102 m!340921))

(declare-fun m!340923 () Bool)

(assert (=> b!338102 m!340923))

(declare-fun m!340925 () Bool)

(assert (=> b!338095 m!340925))

(declare-fun m!340927 () Bool)

(assert (=> b!338096 m!340927))

(declare-fun m!340929 () Bool)

(assert (=> b!338100 m!340929))

(declare-fun m!340931 () Bool)

(assert (=> b!338103 m!340931))

(declare-fun m!340933 () Bool)

(assert (=> b!338101 m!340933))

(check-sat (not b!338102) (not b!338094) (not b_next!7105) (not start!33960) (not b!338101) b_and!14269 (not b!338096) (not b!338095) (not mapNonEmpty!11997) (not b!338103) (not b!338100) tp_is_empty!7057)
(check-sat b_and!14269 (not b_next!7105))
