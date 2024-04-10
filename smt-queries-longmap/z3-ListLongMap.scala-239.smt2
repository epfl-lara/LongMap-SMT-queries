; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4118 () Bool)

(assert start!4118)

(declare-fun b_free!1023 () Bool)

(declare-fun b_next!1023 () Bool)

(assert (=> start!4118 (= b_free!1023 (not b_next!1023))))

(declare-fun tp!4489 () Bool)

(declare-fun b_and!1833 () Bool)

(assert (=> start!4118 (= tp!4489 b_and!1833)))

(declare-fun b!30740 () Bool)

(declare-fun res!18558 () Bool)

(declare-fun e!19694 () Bool)

(assert (=> b!30740 (=> (not res!18558) (not e!19694))))

(declare-datatypes ((array!1981 0))(
  ( (array!1982 (arr!944 (Array (_ BitVec 32) (_ BitVec 64))) (size!1045 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1981)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30740 (= res!18558 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30741 () Bool)

(declare-fun e!19695 () Bool)

(assert (=> b!30741 (= e!19694 e!19695)))

(declare-fun res!18561 () Bool)

(assert (=> b!30741 (=> (not res!18561) (not e!19695))))

(declare-datatypes ((SeekEntryResult!109 0))(
  ( (MissingZero!109 (index!2558 (_ BitVec 32))) (Found!109 (index!2559 (_ BitVec 32))) (Intermediate!109 (undefined!921 Bool) (index!2560 (_ BitVec 32)) (x!6563 (_ BitVec 32))) (Undefined!109) (MissingVacant!109 (index!2561 (_ BitVec 32))) )
))
(declare-fun lt!11461 () SeekEntryResult!109)

(get-info :version)

(assert (=> b!30741 (= res!18561 ((_ is Found!109) lt!11461))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1981 (_ BitVec 32)) SeekEntryResult!109)

(assert (=> b!30741 (= lt!11461 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30742 () Bool)

(declare-fun e!19697 () Bool)

(assert (=> b!30742 (= e!19697 e!19694)))

(declare-fun res!18557 () Bool)

(assert (=> b!30742 (=> (not res!18557) (not e!19694))))

(declare-datatypes ((V!1661 0))(
  ( (V!1662 (val!715 Int)) )
))
(declare-datatypes ((tuple2!1176 0))(
  ( (tuple2!1177 (_1!599 (_ BitVec 64)) (_2!599 V!1661)) )
))
(declare-datatypes ((List!770 0))(
  ( (Nil!767) (Cons!766 (h!1333 tuple2!1176) (t!3463 List!770)) )
))
(declare-datatypes ((ListLongMap!753 0))(
  ( (ListLongMap!754 (toList!392 List!770)) )
))
(declare-fun lt!11462 () ListLongMap!753)

(declare-fun contains!332 (ListLongMap!753 (_ BitVec 64)) Bool)

(assert (=> b!30742 (= res!18557 (not (contains!332 lt!11462 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!489 0))(
  ( (ValueCellFull!489 (v!1804 V!1661)) (EmptyCell!489) )
))
(declare-datatypes ((array!1983 0))(
  ( (array!1984 (arr!945 (Array (_ BitVec 32) ValueCell!489)) (size!1046 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1983)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1661)

(declare-fun minValue!1443 () V!1661)

(declare-fun getCurrentListMap!220 (array!1981 array!1983 (_ BitVec 32) (_ BitVec 32) V!1661 V!1661 (_ BitVec 32) Int) ListLongMap!753)

(assert (=> b!30742 (= lt!11462 (getCurrentListMap!220 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30743 () Bool)

(declare-fun res!18559 () Bool)

(assert (=> b!30743 (=> (not res!18559) (not e!19697))))

(declare-datatypes ((List!771 0))(
  ( (Nil!768) (Cons!767 (h!1334 (_ BitVec 64)) (t!3464 List!771)) )
))
(declare-fun arrayNoDuplicates!0 (array!1981 (_ BitVec 32) List!771) Bool)

(assert (=> b!30743 (= res!18559 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!768))))

(declare-fun b!30744 () Bool)

(declare-fun e!19693 () Bool)

(declare-fun e!19696 () Bool)

(declare-fun mapRes!1594 () Bool)

(assert (=> b!30744 (= e!19693 (and e!19696 mapRes!1594))))

(declare-fun condMapEmpty!1594 () Bool)

(declare-fun mapDefault!1594 () ValueCell!489)

(assert (=> b!30744 (= condMapEmpty!1594 (= (arr!945 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!489)) mapDefault!1594)))))

(declare-fun b!30745 () Bool)

(assert (=> b!30745 (= e!19695 (not true))))

(assert (=> b!30745 (contains!332 lt!11462 (select (arr!944 _keys!1833) (index!2559 lt!11461)))))

(declare-datatypes ((Unit!689 0))(
  ( (Unit!690) )
))
(declare-fun lt!11460 () Unit!689)

(declare-fun lemmaValidKeyInArrayIsInListMap!38 (array!1981 array!1983 (_ BitVec 32) (_ BitVec 32) V!1661 V!1661 (_ BitVec 32) Int) Unit!689)

(assert (=> b!30745 (= lt!11460 (lemmaValidKeyInArrayIsInListMap!38 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2559 lt!11461) defaultEntry!1504))))

(declare-fun b!30746 () Bool)

(declare-fun res!18554 () Bool)

(assert (=> b!30746 (=> (not res!18554) (not e!19697))))

(assert (=> b!30746 (= res!18554 (and (= (size!1046 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1045 _keys!1833) (size!1046 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30747 () Bool)

(declare-fun res!18556 () Bool)

(assert (=> b!30747 (=> (not res!18556) (not e!19697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1981 (_ BitVec 32)) Bool)

(assert (=> b!30747 (= res!18556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!18560 () Bool)

(assert (=> start!4118 (=> (not res!18560) (not e!19697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4118 (= res!18560 (validMask!0 mask!2294))))

(assert (=> start!4118 e!19697))

(assert (=> start!4118 true))

(assert (=> start!4118 tp!4489))

(declare-fun array_inv!659 (array!1983) Bool)

(assert (=> start!4118 (and (array_inv!659 _values!1501) e!19693)))

(declare-fun array_inv!660 (array!1981) Bool)

(assert (=> start!4118 (array_inv!660 _keys!1833)))

(declare-fun tp_is_empty!1377 () Bool)

(assert (=> start!4118 tp_is_empty!1377))

(declare-fun mapNonEmpty!1594 () Bool)

(declare-fun tp!4488 () Bool)

(declare-fun e!19691 () Bool)

(assert (=> mapNonEmpty!1594 (= mapRes!1594 (and tp!4488 e!19691))))

(declare-fun mapKey!1594 () (_ BitVec 32))

(declare-fun mapValue!1594 () ValueCell!489)

(declare-fun mapRest!1594 () (Array (_ BitVec 32) ValueCell!489))

(assert (=> mapNonEmpty!1594 (= (arr!945 _values!1501) (store mapRest!1594 mapKey!1594 mapValue!1594))))

(declare-fun b!30748 () Bool)

(assert (=> b!30748 (= e!19696 tp_is_empty!1377)))

(declare-fun b!30749 () Bool)

(declare-fun res!18555 () Bool)

(assert (=> b!30749 (=> (not res!18555) (not e!19697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30749 (= res!18555 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1594 () Bool)

(assert (=> mapIsEmpty!1594 mapRes!1594))

(declare-fun b!30750 () Bool)

(assert (=> b!30750 (= e!19691 tp_is_empty!1377)))

(assert (= (and start!4118 res!18560) b!30746))

(assert (= (and b!30746 res!18554) b!30747))

(assert (= (and b!30747 res!18556) b!30743))

(assert (= (and b!30743 res!18559) b!30749))

(assert (= (and b!30749 res!18555) b!30742))

(assert (= (and b!30742 res!18557) b!30740))

(assert (= (and b!30740 res!18558) b!30741))

(assert (= (and b!30741 res!18561) b!30745))

(assert (= (and b!30744 condMapEmpty!1594) mapIsEmpty!1594))

(assert (= (and b!30744 (not condMapEmpty!1594)) mapNonEmpty!1594))

(assert (= (and mapNonEmpty!1594 ((_ is ValueCellFull!489) mapValue!1594)) b!30750))

(assert (= (and b!30744 ((_ is ValueCellFull!489) mapDefault!1594)) b!30748))

(assert (= start!4118 b!30744))

(declare-fun m!24677 () Bool)

(assert (=> b!30741 m!24677))

(declare-fun m!24679 () Bool)

(assert (=> b!30745 m!24679))

(assert (=> b!30745 m!24679))

(declare-fun m!24681 () Bool)

(assert (=> b!30745 m!24681))

(declare-fun m!24683 () Bool)

(assert (=> b!30745 m!24683))

(declare-fun m!24685 () Bool)

(assert (=> b!30742 m!24685))

(declare-fun m!24687 () Bool)

(assert (=> b!30742 m!24687))

(declare-fun m!24689 () Bool)

(assert (=> b!30743 m!24689))

(declare-fun m!24691 () Bool)

(assert (=> start!4118 m!24691))

(declare-fun m!24693 () Bool)

(assert (=> start!4118 m!24693))

(declare-fun m!24695 () Bool)

(assert (=> start!4118 m!24695))

(declare-fun m!24697 () Bool)

(assert (=> b!30749 m!24697))

(declare-fun m!24699 () Bool)

(assert (=> b!30747 m!24699))

(declare-fun m!24701 () Bool)

(assert (=> mapNonEmpty!1594 m!24701))

(declare-fun m!24703 () Bool)

(assert (=> b!30740 m!24703))

(check-sat (not start!4118) tp_is_empty!1377 (not b!30743) (not b!30747) (not b_next!1023) (not b!30742) (not b!30740) b_and!1833 (not b!30741) (not mapNonEmpty!1594) (not b!30745) (not b!30749))
(check-sat b_and!1833 (not b_next!1023))
