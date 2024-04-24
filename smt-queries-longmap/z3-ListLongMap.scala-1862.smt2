; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33592 () Bool)

(assert start!33592)

(declare-fun b_free!6841 () Bool)

(declare-fun b_next!6841 () Bool)

(assert (=> start!33592 (= b_free!6841 (not b_next!6841))))

(declare-fun tp!24027 () Bool)

(declare-fun b_and!14035 () Bool)

(assert (=> start!33592 (= tp!24027 b_and!14035)))

(declare-fun mapIsEmpty!11586 () Bool)

(declare-fun mapRes!11586 () Bool)

(assert (=> mapIsEmpty!11586 mapRes!11586))

(declare-fun b!333396 () Bool)

(declare-fun e!204721 () Bool)

(declare-fun tp_is_empty!6793 () Bool)

(assert (=> b!333396 (= e!204721 tp_is_empty!6793)))

(declare-fun b!333397 () Bool)

(declare-fun res!183671 () Bool)

(declare-fun e!204720 () Bool)

(assert (=> b!333397 (=> (not res!183671) (not e!204720))))

(declare-datatypes ((array!17180 0))(
  ( (array!17181 (arr!8120 (Array (_ BitVec 32) (_ BitVec 64))) (size!8472 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17180)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17180 (_ BitVec 32)) Bool)

(assert (=> b!333397 (= res!183671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11586 () Bool)

(declare-fun tp!24026 () Bool)

(assert (=> mapNonEmpty!11586 (= mapRes!11586 (and tp!24026 e!204721))))

(declare-datatypes ((V!10035 0))(
  ( (V!10036 (val!3441 Int)) )
))
(declare-datatypes ((ValueCell!3053 0))(
  ( (ValueCellFull!3053 (v!5604 V!10035)) (EmptyCell!3053) )
))
(declare-fun mapValue!11586 () ValueCell!3053)

(declare-datatypes ((array!17182 0))(
  ( (array!17183 (arr!8121 (Array (_ BitVec 32) ValueCell!3053)) (size!8473 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17182)

(declare-fun mapRest!11586 () (Array (_ BitVec 32) ValueCell!3053))

(declare-fun mapKey!11586 () (_ BitVec 32))

(assert (=> mapNonEmpty!11586 (= (arr!8121 _values!1525) (store mapRest!11586 mapKey!11586 mapValue!11586))))

(declare-fun b!333398 () Bool)

(declare-fun res!183674 () Bool)

(assert (=> b!333398 (=> (not res!183674) (not e!204720))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333398 (= res!183674 (and (= (size!8473 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8472 _keys!1895) (size!8473 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333399 () Bool)

(declare-fun res!183672 () Bool)

(assert (=> b!333399 (=> (not res!183672) (not e!204720))))

(declare-datatypes ((List!4537 0))(
  ( (Nil!4534) (Cons!4533 (h!5389 (_ BitVec 64)) (t!9617 List!4537)) )
))
(declare-fun arrayNoDuplicates!0 (array!17180 (_ BitVec 32) List!4537) Bool)

(assert (=> b!333399 (= res!183672 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4534))))

(declare-fun b!333400 () Bool)

(declare-fun e!204718 () Bool)

(declare-fun e!204722 () Bool)

(assert (=> b!333400 (= e!204718 (and e!204722 mapRes!11586))))

(declare-fun condMapEmpty!11586 () Bool)

(declare-fun mapDefault!11586 () ValueCell!3053)

(assert (=> b!333400 (= condMapEmpty!11586 (= (arr!8121 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3053)) mapDefault!11586)))))

(declare-fun b!333401 () Bool)

(assert (=> b!333401 (= e!204722 tp_is_empty!6793)))

(declare-fun b!333402 () Bool)

(assert (=> b!333402 (= e!204720 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3103 0))(
  ( (MissingZero!3103 (index!14591 (_ BitVec 32))) (Found!3103 (index!14592 (_ BitVec 32))) (Intermediate!3103 (undefined!3915 Bool) (index!14593 (_ BitVec 32)) (x!33178 (_ BitVec 32))) (Undefined!3103) (MissingVacant!3103 (index!14594 (_ BitVec 32))) )
))
(declare-fun lt!159382 () SeekEntryResult!3103)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17180 (_ BitVec 32)) SeekEntryResult!3103)

(assert (=> b!333402 (= lt!159382 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!183670 () Bool)

(assert (=> start!33592 (=> (not res!183670) (not e!204720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33592 (= res!183670 (validMask!0 mask!2385))))

(assert (=> start!33592 e!204720))

(assert (=> start!33592 true))

(assert (=> start!33592 tp_is_empty!6793))

(assert (=> start!33592 tp!24027))

(declare-fun array_inv!6042 (array!17182) Bool)

(assert (=> start!33592 (and (array_inv!6042 _values!1525) e!204718)))

(declare-fun array_inv!6043 (array!17180) Bool)

(assert (=> start!33592 (array_inv!6043 _keys!1895)))

(declare-fun b!333403 () Bool)

(declare-fun res!183673 () Bool)

(assert (=> b!333403 (=> (not res!183673) (not e!204720))))

(declare-fun zeroValue!1467 () V!10035)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10035)

(declare-datatypes ((tuple2!4922 0))(
  ( (tuple2!4923 (_1!2472 (_ BitVec 64)) (_2!2472 V!10035)) )
))
(declare-datatypes ((List!4538 0))(
  ( (Nil!4535) (Cons!4534 (h!5390 tuple2!4922) (t!9618 List!4538)) )
))
(declare-datatypes ((ListLongMap!3837 0))(
  ( (ListLongMap!3838 (toList!1934 List!4538)) )
))
(declare-fun contains!1997 (ListLongMap!3837 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1466 (array!17180 array!17182 (_ BitVec 32) (_ BitVec 32) V!10035 V!10035 (_ BitVec 32) Int) ListLongMap!3837)

(assert (=> b!333403 (= res!183673 (not (contains!1997 (getCurrentListMap!1466 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333404 () Bool)

(declare-fun res!183669 () Bool)

(assert (=> b!333404 (=> (not res!183669) (not e!204720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333404 (= res!183669 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33592 res!183670) b!333398))

(assert (= (and b!333398 res!183674) b!333397))

(assert (= (and b!333397 res!183671) b!333399))

(assert (= (and b!333399 res!183672) b!333404))

(assert (= (and b!333404 res!183669) b!333403))

(assert (= (and b!333403 res!183673) b!333402))

(assert (= (and b!333400 condMapEmpty!11586) mapIsEmpty!11586))

(assert (= (and b!333400 (not condMapEmpty!11586)) mapNonEmpty!11586))

(get-info :version)

(assert (= (and mapNonEmpty!11586 ((_ is ValueCellFull!3053) mapValue!11586)) b!333396))

(assert (= (and b!333400 ((_ is ValueCellFull!3053) mapDefault!11586)) b!333401))

(assert (= start!33592 b!333400))

(declare-fun m!337925 () Bool)

(assert (=> mapNonEmpty!11586 m!337925))

(declare-fun m!337927 () Bool)

(assert (=> b!333399 m!337927))

(declare-fun m!337929 () Bool)

(assert (=> b!333402 m!337929))

(declare-fun m!337931 () Bool)

(assert (=> b!333397 m!337931))

(declare-fun m!337933 () Bool)

(assert (=> start!33592 m!337933))

(declare-fun m!337935 () Bool)

(assert (=> start!33592 m!337935))

(declare-fun m!337937 () Bool)

(assert (=> start!33592 m!337937))

(declare-fun m!337939 () Bool)

(assert (=> b!333403 m!337939))

(assert (=> b!333403 m!337939))

(declare-fun m!337941 () Bool)

(assert (=> b!333403 m!337941))

(declare-fun m!337943 () Bool)

(assert (=> b!333404 m!337943))

(check-sat (not start!33592) (not b_next!6841) (not b!333402) (not b!333399) b_and!14035 (not mapNonEmpty!11586) (not b!333404) tp_is_empty!6793 (not b!333403) (not b!333397))
(check-sat b_and!14035 (not b_next!6841))
