; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33856 () Bool)

(assert start!33856)

(declare-fun b_free!7035 () Bool)

(declare-fun b_next!7035 () Bool)

(assert (=> start!33856 (= b_free!7035 (not b_next!7035))))

(declare-fun tp!24617 () Bool)

(declare-fun b_and!14221 () Bool)

(assert (=> start!33856 (= tp!24617 b_and!14221)))

(declare-fun b!336897 () Bool)

(declare-fun res!186005 () Bool)

(declare-fun e!206771 () Bool)

(assert (=> b!336897 (=> (not res!186005) (not e!206771))))

(declare-datatypes ((array!17569 0))(
  ( (array!17570 (arr!8312 (Array (_ BitVec 32) (_ BitVec 64))) (size!8664 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17569)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17569 (_ BitVec 32)) Bool)

(assert (=> b!336897 (= res!186005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336898 () Bool)

(declare-fun res!186003 () Bool)

(assert (=> b!336898 (=> (not res!186003) (not e!206771))))

(declare-datatypes ((List!4753 0))(
  ( (Nil!4750) (Cons!4749 (h!5605 (_ BitVec 64)) (t!9847 List!4753)) )
))
(declare-fun arrayNoDuplicates!0 (array!17569 (_ BitVec 32) List!4753) Bool)

(assert (=> b!336898 (= res!186003 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4750))))

(declare-fun b!336899 () Bool)

(declare-fun e!206770 () Bool)

(assert (=> b!336899 (= e!206771 e!206770)))

(declare-fun res!186007 () Bool)

(assert (=> b!336899 (=> (not res!186007) (not e!206770))))

(declare-datatypes ((SeekEntryResult!3212 0))(
  ( (MissingZero!3212 (index!15027 (_ BitVec 32))) (Found!3212 (index!15028 (_ BitVec 32))) (Intermediate!3212 (undefined!4024 Bool) (index!15029 (_ BitVec 32)) (x!33576 (_ BitVec 32))) (Undefined!3212) (MissingVacant!3212 (index!15030 (_ BitVec 32))) )
))
(declare-fun lt!160335 () SeekEntryResult!3212)

(get-info :version)

(assert (=> b!336899 (= res!186007 (and (not ((_ is Found!3212) lt!160335)) ((_ is MissingZero!3212) lt!160335)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17569 (_ BitVec 32)) SeekEntryResult!3212)

(assert (=> b!336899 (= lt!160335 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336900 () Bool)

(declare-fun e!206768 () Bool)

(declare-fun tp_is_empty!6987 () Bool)

(assert (=> b!336900 (= e!206768 tp_is_empty!6987)))

(declare-fun mapIsEmpty!11886 () Bool)

(declare-fun mapRes!11886 () Bool)

(assert (=> mapIsEmpty!11886 mapRes!11886))

(declare-fun b!336901 () Bool)

(declare-fun e!206767 () Bool)

(assert (=> b!336901 (= e!206767 tp_is_empty!6987)))

(declare-fun res!186002 () Bool)

(assert (=> start!33856 (=> (not res!186002) (not e!206771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33856 (= res!186002 (validMask!0 mask!2385))))

(assert (=> start!33856 e!206771))

(assert (=> start!33856 true))

(assert (=> start!33856 tp_is_empty!6987))

(assert (=> start!33856 tp!24617))

(declare-datatypes ((V!10293 0))(
  ( (V!10294 (val!3538 Int)) )
))
(declare-datatypes ((ValueCell!3150 0))(
  ( (ValueCellFull!3150 (v!5703 V!10293)) (EmptyCell!3150) )
))
(declare-datatypes ((array!17571 0))(
  ( (array!17572 (arr!8313 (Array (_ BitVec 32) ValueCell!3150)) (size!8665 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17571)

(declare-fun e!206772 () Bool)

(declare-fun array_inv!6170 (array!17571) Bool)

(assert (=> start!33856 (and (array_inv!6170 _values!1525) e!206772)))

(declare-fun array_inv!6171 (array!17569) Bool)

(assert (=> start!33856 (array_inv!6171 _keys!1895)))

(declare-fun b!336902 () Bool)

(declare-fun res!186001 () Bool)

(assert (=> b!336902 (=> (not res!186001) (not e!206771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336902 (= res!186001 (validKeyInArray!0 k0!1348))))

(declare-fun b!336903 () Bool)

(declare-fun res!186006 () Bool)

(assert (=> b!336903 (=> (not res!186006) (not e!206770))))

(declare-fun arrayContainsKey!0 (array!17569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336903 (= res!186006 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336904 () Bool)

(declare-fun res!186004 () Bool)

(assert (=> b!336904 (=> (not res!186004) (not e!206771))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336904 (= res!186004 (and (= (size!8665 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8664 _keys!1895) (size!8665 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11886 () Bool)

(declare-fun tp!24618 () Bool)

(assert (=> mapNonEmpty!11886 (= mapRes!11886 (and tp!24618 e!206767))))

(declare-fun mapRest!11886 () (Array (_ BitVec 32) ValueCell!3150))

(declare-fun mapKey!11886 () (_ BitVec 32))

(declare-fun mapValue!11886 () ValueCell!3150)

(assert (=> mapNonEmpty!11886 (= (arr!8313 _values!1525) (store mapRest!11886 mapKey!11886 mapValue!11886))))

(declare-fun b!336905 () Bool)

(assert (=> b!336905 (= e!206772 (and e!206768 mapRes!11886))))

(declare-fun condMapEmpty!11886 () Bool)

(declare-fun mapDefault!11886 () ValueCell!3150)

(assert (=> b!336905 (= condMapEmpty!11886 (= (arr!8313 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3150)) mapDefault!11886)))))

(declare-fun b!336906 () Bool)

(declare-fun res!186008 () Bool)

(assert (=> b!336906 (=> (not res!186008) (not e!206771))))

(declare-fun zeroValue!1467 () V!10293)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10293)

(declare-datatypes ((tuple2!5138 0))(
  ( (tuple2!5139 (_1!2580 (_ BitVec 64)) (_2!2580 V!10293)) )
))
(declare-datatypes ((List!4754 0))(
  ( (Nil!4751) (Cons!4750 (h!5606 tuple2!5138) (t!9848 List!4754)) )
))
(declare-datatypes ((ListLongMap!4051 0))(
  ( (ListLongMap!4052 (toList!2041 List!4754)) )
))
(declare-fun contains!2088 (ListLongMap!4051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1562 (array!17569 array!17571 (_ BitVec 32) (_ BitVec 32) V!10293 V!10293 (_ BitVec 32) Int) ListLongMap!4051)

(assert (=> b!336906 (= res!186008 (not (contains!2088 (getCurrentListMap!1562 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336907 () Bool)

(assert (=> b!336907 (= e!206770 false)))

(declare-fun lt!160336 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17569 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336907 (= lt!160336 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!33856 res!186002) b!336904))

(assert (= (and b!336904 res!186004) b!336897))

(assert (= (and b!336897 res!186005) b!336898))

(assert (= (and b!336898 res!186003) b!336902))

(assert (= (and b!336902 res!186001) b!336906))

(assert (= (and b!336906 res!186008) b!336899))

(assert (= (and b!336899 res!186007) b!336903))

(assert (= (and b!336903 res!186006) b!336907))

(assert (= (and b!336905 condMapEmpty!11886) mapIsEmpty!11886))

(assert (= (and b!336905 (not condMapEmpty!11886)) mapNonEmpty!11886))

(assert (= (and mapNonEmpty!11886 ((_ is ValueCellFull!3150) mapValue!11886)) b!336901))

(assert (= (and b!336905 ((_ is ValueCellFull!3150) mapDefault!11886)) b!336900))

(assert (= start!33856 b!336905))

(declare-fun m!340571 () Bool)

(assert (=> b!336897 m!340571))

(declare-fun m!340573 () Bool)

(assert (=> start!33856 m!340573))

(declare-fun m!340575 () Bool)

(assert (=> start!33856 m!340575))

(declare-fun m!340577 () Bool)

(assert (=> start!33856 m!340577))

(declare-fun m!340579 () Bool)

(assert (=> b!336903 m!340579))

(declare-fun m!340581 () Bool)

(assert (=> b!336902 m!340581))

(declare-fun m!340583 () Bool)

(assert (=> mapNonEmpty!11886 m!340583))

(declare-fun m!340585 () Bool)

(assert (=> b!336907 m!340585))

(declare-fun m!340587 () Bool)

(assert (=> b!336898 m!340587))

(declare-fun m!340589 () Bool)

(assert (=> b!336906 m!340589))

(assert (=> b!336906 m!340589))

(declare-fun m!340591 () Bool)

(assert (=> b!336906 m!340591))

(declare-fun m!340593 () Bool)

(assert (=> b!336899 m!340593))

(check-sat (not b!336902) (not b!336897) (not b!336906) (not b!336899) (not b!336907) tp_is_empty!6987 (not b_next!7035) (not mapNonEmpty!11886) (not start!33856) (not b!336903) b_and!14221 (not b!336898))
(check-sat b_and!14221 (not b_next!7035))
