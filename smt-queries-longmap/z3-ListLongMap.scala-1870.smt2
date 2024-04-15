; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33640 () Bool)

(assert start!33640)

(declare-fun b_free!6889 () Bool)

(declare-fun b_next!6889 () Bool)

(assert (=> start!33640 (= b_free!6889 (not b_next!6889))))

(declare-fun tp!24171 () Bool)

(declare-fun b_and!14043 () Bool)

(assert (=> start!33640 (= tp!24171 b_and!14043)))

(declare-fun b!333898 () Bool)

(declare-fun res!184058 () Bool)

(declare-fun e!204975 () Bool)

(assert (=> b!333898 (=> (not res!184058) (not e!204975))))

(declare-datatypes ((array!17257 0))(
  ( (array!17258 (arr!8159 (Array (_ BitVec 32) (_ BitVec 64))) (size!8512 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17257)

(declare-datatypes ((List!4619 0))(
  ( (Nil!4616) (Cons!4615 (h!5471 (_ BitVec 64)) (t!9698 List!4619)) )
))
(declare-fun arrayNoDuplicates!0 (array!17257 (_ BitVec 32) List!4619) Bool)

(assert (=> b!333898 (= res!184058 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4616))))

(declare-fun res!184057 () Bool)

(assert (=> start!33640 (=> (not res!184057) (not e!204975))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33640 (= res!184057 (validMask!0 mask!2385))))

(assert (=> start!33640 e!204975))

(assert (=> start!33640 true))

(declare-fun tp_is_empty!6841 () Bool)

(assert (=> start!33640 tp_is_empty!6841))

(assert (=> start!33640 tp!24171))

(declare-datatypes ((V!10099 0))(
  ( (V!10100 (val!3465 Int)) )
))
(declare-datatypes ((ValueCell!3077 0))(
  ( (ValueCellFull!3077 (v!5621 V!10099)) (EmptyCell!3077) )
))
(declare-datatypes ((array!17259 0))(
  ( (array!17260 (arr!8160 (Array (_ BitVec 32) ValueCell!3077)) (size!8513 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17259)

(declare-fun e!204976 () Bool)

(declare-fun array_inv!6086 (array!17259) Bool)

(assert (=> start!33640 (and (array_inv!6086 _values!1525) e!204976)))

(declare-fun array_inv!6087 (array!17257) Bool)

(assert (=> start!33640 (array_inv!6087 _keys!1895)))

(declare-fun b!333899 () Bool)

(declare-fun e!204977 () Bool)

(assert (=> b!333899 (= e!204977 (not true))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333899 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10368 0))(
  ( (Unit!10369) )
))
(declare-fun lt!159240 () Unit!10368)

(declare-datatypes ((SeekEntryResult!3153 0))(
  ( (MissingZero!3153 (index!14791 (_ BitVec 32))) (Found!3153 (index!14792 (_ BitVec 32))) (Intermediate!3153 (undefined!3965 Bool) (index!14793 (_ BitVec 32)) (x!33290 (_ BitVec 32))) (Undefined!3153) (MissingVacant!3153 (index!14794 (_ BitVec 32))) )
))
(declare-fun lt!159239 () SeekEntryResult!3153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17257 (_ BitVec 64) (_ BitVec 32)) Unit!10368)

(assert (=> b!333899 (= lt!159240 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14792 lt!159239)))))

(declare-fun b!333900 () Bool)

(assert (=> b!333900 (= e!204975 e!204977)))

(declare-fun res!184052 () Bool)

(assert (=> b!333900 (=> (not res!184052) (not e!204977))))

(get-info :version)

(assert (=> b!333900 (= res!184052 (and ((_ is Found!3153) lt!159239) (= (select (arr!8159 _keys!1895) (index!14792 lt!159239)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17257 (_ BitVec 32)) SeekEntryResult!3153)

(assert (=> b!333900 (= lt!159239 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11658 () Bool)

(declare-fun mapRes!11658 () Bool)

(assert (=> mapIsEmpty!11658 mapRes!11658))

(declare-fun b!333901 () Bool)

(declare-fun res!184053 () Bool)

(assert (=> b!333901 (=> (not res!184053) (not e!204977))))

(assert (=> b!333901 (= res!184053 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14792 lt!159239)))))

(declare-fun b!333902 () Bool)

(declare-fun res!184051 () Bool)

(assert (=> b!333902 (=> (not res!184051) (not e!204975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333902 (= res!184051 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11658 () Bool)

(declare-fun tp!24170 () Bool)

(declare-fun e!204974 () Bool)

(assert (=> mapNonEmpty!11658 (= mapRes!11658 (and tp!24170 e!204974))))

(declare-fun mapRest!11658 () (Array (_ BitVec 32) ValueCell!3077))

(declare-fun mapKey!11658 () (_ BitVec 32))

(declare-fun mapValue!11658 () ValueCell!3077)

(assert (=> mapNonEmpty!11658 (= (arr!8160 _values!1525) (store mapRest!11658 mapKey!11658 mapValue!11658))))

(declare-fun b!333903 () Bool)

(declare-fun res!184055 () Bool)

(assert (=> b!333903 (=> (not res!184055) (not e!204975))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333903 (= res!184055 (and (= (size!8513 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8512 _keys!1895) (size!8513 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333904 () Bool)

(declare-fun res!184056 () Bool)

(assert (=> b!333904 (=> (not res!184056) (not e!204975))))

(declare-fun zeroValue!1467 () V!10099)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10099)

(declare-datatypes ((tuple2!4978 0))(
  ( (tuple2!4979 (_1!2500 (_ BitVec 64)) (_2!2500 V!10099)) )
))
(declare-datatypes ((List!4620 0))(
  ( (Nil!4617) (Cons!4616 (h!5472 tuple2!4978) (t!9699 List!4620)) )
))
(declare-datatypes ((ListLongMap!3881 0))(
  ( (ListLongMap!3882 (toList!1956 List!4620)) )
))
(declare-fun contains!2011 (ListLongMap!3881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1465 (array!17257 array!17259 (_ BitVec 32) (_ BitVec 32) V!10099 V!10099 (_ BitVec 32) Int) ListLongMap!3881)

(assert (=> b!333904 (= res!184056 (not (contains!2011 (getCurrentListMap!1465 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333905 () Bool)

(declare-fun e!204979 () Bool)

(assert (=> b!333905 (= e!204979 tp_is_empty!6841)))

(declare-fun b!333906 () Bool)

(assert (=> b!333906 (= e!204974 tp_is_empty!6841)))

(declare-fun b!333907 () Bool)

(declare-fun res!184054 () Bool)

(assert (=> b!333907 (=> (not res!184054) (not e!204975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17257 (_ BitVec 32)) Bool)

(assert (=> b!333907 (= res!184054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333908 () Bool)

(assert (=> b!333908 (= e!204976 (and e!204979 mapRes!11658))))

(declare-fun condMapEmpty!11658 () Bool)

(declare-fun mapDefault!11658 () ValueCell!3077)

(assert (=> b!333908 (= condMapEmpty!11658 (= (arr!8160 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3077)) mapDefault!11658)))))

(assert (= (and start!33640 res!184057) b!333903))

(assert (= (and b!333903 res!184055) b!333907))

(assert (= (and b!333907 res!184054) b!333898))

(assert (= (and b!333898 res!184058) b!333902))

(assert (= (and b!333902 res!184051) b!333904))

(assert (= (and b!333904 res!184056) b!333900))

(assert (= (and b!333900 res!184052) b!333901))

(assert (= (and b!333901 res!184053) b!333899))

(assert (= (and b!333908 condMapEmpty!11658) mapIsEmpty!11658))

(assert (= (and b!333908 (not condMapEmpty!11658)) mapNonEmpty!11658))

(assert (= (and mapNonEmpty!11658 ((_ is ValueCellFull!3077) mapValue!11658)) b!333906))

(assert (= (and b!333908 ((_ is ValueCellFull!3077) mapDefault!11658)) b!333905))

(assert (= start!33640 b!333908))

(declare-fun m!337547 () Bool)

(assert (=> b!333898 m!337547))

(declare-fun m!337549 () Bool)

(assert (=> b!333907 m!337549))

(declare-fun m!337551 () Bool)

(assert (=> start!33640 m!337551))

(declare-fun m!337553 () Bool)

(assert (=> start!33640 m!337553))

(declare-fun m!337555 () Bool)

(assert (=> start!33640 m!337555))

(declare-fun m!337557 () Bool)

(assert (=> mapNonEmpty!11658 m!337557))

(declare-fun m!337559 () Bool)

(assert (=> b!333904 m!337559))

(assert (=> b!333904 m!337559))

(declare-fun m!337561 () Bool)

(assert (=> b!333904 m!337561))

(declare-fun m!337563 () Bool)

(assert (=> b!333902 m!337563))

(declare-fun m!337565 () Bool)

(assert (=> b!333901 m!337565))

(declare-fun m!337567 () Bool)

(assert (=> b!333900 m!337567))

(declare-fun m!337569 () Bool)

(assert (=> b!333900 m!337569))

(declare-fun m!337571 () Bool)

(assert (=> b!333899 m!337571))

(declare-fun m!337573 () Bool)

(assert (=> b!333899 m!337573))

(check-sat tp_is_empty!6841 (not start!33640) (not b!333899) (not mapNonEmpty!11658) (not b!333900) (not b!333902) (not b!333904) (not b!333901) (not b!333898) (not b!333907) (not b_next!6889) b_and!14043)
(check-sat b_and!14043 (not b_next!6889))
