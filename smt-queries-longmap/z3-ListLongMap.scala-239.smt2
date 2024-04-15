; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4106 () Bool)

(assert start!4106)

(declare-fun b_free!1021 () Bool)

(declare-fun b_next!1021 () Bool)

(assert (=> start!4106 (= b_free!1021 (not b_next!1021))))

(declare-fun tp!4483 () Bool)

(declare-fun b_and!1825 () Bool)

(assert (=> start!4106 (= tp!4483 b_and!1825)))

(declare-fun b!30653 () Bool)

(declare-fun e!19630 () Bool)

(declare-fun e!19628 () Bool)

(assert (=> b!30653 (= e!19630 e!19628)))

(declare-fun res!18500 () Bool)

(assert (=> b!30653 (=> (not res!18500) (not e!19628))))

(declare-datatypes ((SeekEntryResult!115 0))(
  ( (MissingZero!115 (index!2582 (_ BitVec 32))) (Found!115 (index!2583 (_ BitVec 32))) (Intermediate!115 (undefined!927 Bool) (index!2584 (_ BitVec 32)) (x!6569 (_ BitVec 32))) (Undefined!115) (MissingVacant!115 (index!2585 (_ BitVec 32))) )
))
(declare-fun lt!11447 () SeekEntryResult!115)

(get-info :version)

(assert (=> b!30653 (= res!18500 ((_ is Found!115) lt!11447))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!1947 0))(
  ( (array!1948 (arr!927 (Array (_ BitVec 32) (_ BitVec 64))) (size!1028 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1947)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1947 (_ BitVec 32)) SeekEntryResult!115)

(assert (=> b!30653 (= lt!11447 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30654 () Bool)

(declare-fun e!19627 () Bool)

(declare-fun tp_is_empty!1375 () Bool)

(assert (=> b!30654 (= e!19627 tp_is_empty!1375)))

(declare-fun b!30655 () Bool)

(declare-fun res!18498 () Bool)

(assert (=> b!30655 (=> (not res!18498) (not e!19630))))

(declare-fun arrayContainsKey!0 (array!1947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30655 (= res!18498 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1591 () Bool)

(declare-fun mapRes!1591 () Bool)

(declare-fun tp!4482 () Bool)

(assert (=> mapNonEmpty!1591 (= mapRes!1591 (and tp!4482 e!19627))))

(declare-datatypes ((V!1659 0))(
  ( (V!1660 (val!714 Int)) )
))
(declare-datatypes ((ValueCell!488 0))(
  ( (ValueCellFull!488 (v!1802 V!1659)) (EmptyCell!488) )
))
(declare-datatypes ((array!1949 0))(
  ( (array!1950 (arr!928 (Array (_ BitVec 32) ValueCell!488)) (size!1029 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1949)

(declare-fun mapValue!1591 () ValueCell!488)

(declare-fun mapKey!1591 () (_ BitVec 32))

(declare-fun mapRest!1591 () (Array (_ BitVec 32) ValueCell!488))

(assert (=> mapNonEmpty!1591 (= (arr!928 _values!1501) (store mapRest!1591 mapKey!1591 mapValue!1591))))

(declare-fun b!30656 () Bool)

(declare-fun e!19632 () Bool)

(assert (=> b!30656 (= e!19632 e!19630)))

(declare-fun res!18499 () Bool)

(assert (=> b!30656 (=> (not res!18499) (not e!19630))))

(declare-datatypes ((tuple2!1180 0))(
  ( (tuple2!1181 (_1!601 (_ BitVec 64)) (_2!601 V!1659)) )
))
(declare-datatypes ((List!762 0))(
  ( (Nil!759) (Cons!758 (h!1325 tuple2!1180) (t!3448 List!762)) )
))
(declare-datatypes ((ListLongMap!745 0))(
  ( (ListLongMap!746 (toList!388 List!762)) )
))
(declare-fun lt!11449 () ListLongMap!745)

(declare-fun contains!329 (ListLongMap!745 (_ BitVec 64)) Bool)

(assert (=> b!30656 (= res!18499 (not (contains!329 lt!11449 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1659)

(declare-fun minValue!1443 () V!1659)

(declare-fun getCurrentListMap!212 (array!1947 array!1949 (_ BitVec 32) (_ BitVec 32) V!1659 V!1659 (_ BitVec 32) Int) ListLongMap!745)

(assert (=> b!30656 (= lt!11449 (getCurrentListMap!212 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30657 () Bool)

(declare-fun res!18503 () Bool)

(assert (=> b!30657 (=> (not res!18503) (not e!19632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1947 (_ BitVec 32)) Bool)

(assert (=> b!30657 (= res!18503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30658 () Bool)

(declare-fun res!18502 () Bool)

(assert (=> b!30658 (=> (not res!18502) (not e!19632))))

(declare-datatypes ((List!763 0))(
  ( (Nil!760) (Cons!759 (h!1326 (_ BitVec 64)) (t!3449 List!763)) )
))
(declare-fun arrayNoDuplicates!0 (array!1947 (_ BitVec 32) List!763) Bool)

(assert (=> b!30658 (= res!18502 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!760))))

(declare-fun b!30659 () Bool)

(declare-fun res!18505 () Bool)

(assert (=> b!30659 (=> (not res!18505) (not e!19632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30659 (= res!18505 (validKeyInArray!0 k0!1304))))

(declare-fun b!30660 () Bool)

(declare-fun e!19631 () Bool)

(declare-fun e!19629 () Bool)

(assert (=> b!30660 (= e!19631 (and e!19629 mapRes!1591))))

(declare-fun condMapEmpty!1591 () Bool)

(declare-fun mapDefault!1591 () ValueCell!488)

(assert (=> b!30660 (= condMapEmpty!1591 (= (arr!928 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!488)) mapDefault!1591)))))

(declare-fun b!30661 () Bool)

(declare-fun res!18501 () Bool)

(assert (=> b!30661 (=> (not res!18501) (not e!19632))))

(assert (=> b!30661 (= res!18501 (and (= (size!1029 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1028 _keys!1833) (size!1029 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30662 () Bool)

(assert (=> b!30662 (= e!19628 (not true))))

(assert (=> b!30662 (contains!329 lt!11449 (select (arr!927 _keys!1833) (index!2583 lt!11447)))))

(declare-datatypes ((Unit!698 0))(
  ( (Unit!699) )
))
(declare-fun lt!11448 () Unit!698)

(declare-fun lemmaValidKeyInArrayIsInListMap!39 (array!1947 array!1949 (_ BitVec 32) (_ BitVec 32) V!1659 V!1659 (_ BitVec 32) Int) Unit!698)

(assert (=> b!30662 (= lt!11448 (lemmaValidKeyInArrayIsInListMap!39 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2583 lt!11447) defaultEntry!1504))))

(declare-fun b!30663 () Bool)

(assert (=> b!30663 (= e!19629 tp_is_empty!1375)))

(declare-fun res!18504 () Bool)

(assert (=> start!4106 (=> (not res!18504) (not e!19632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4106 (= res!18504 (validMask!0 mask!2294))))

(assert (=> start!4106 e!19632))

(assert (=> start!4106 true))

(assert (=> start!4106 tp!4483))

(declare-fun array_inv!647 (array!1949) Bool)

(assert (=> start!4106 (and (array_inv!647 _values!1501) e!19631)))

(declare-fun array_inv!648 (array!1947) Bool)

(assert (=> start!4106 (array_inv!648 _keys!1833)))

(assert (=> start!4106 tp_is_empty!1375))

(declare-fun mapIsEmpty!1591 () Bool)

(assert (=> mapIsEmpty!1591 mapRes!1591))

(assert (= (and start!4106 res!18504) b!30661))

(assert (= (and b!30661 res!18501) b!30657))

(assert (= (and b!30657 res!18503) b!30658))

(assert (= (and b!30658 res!18502) b!30659))

(assert (= (and b!30659 res!18505) b!30656))

(assert (= (and b!30656 res!18499) b!30655))

(assert (= (and b!30655 res!18498) b!30653))

(assert (= (and b!30653 res!18500) b!30662))

(assert (= (and b!30660 condMapEmpty!1591) mapIsEmpty!1591))

(assert (= (and b!30660 (not condMapEmpty!1591)) mapNonEmpty!1591))

(assert (= (and mapNonEmpty!1591 ((_ is ValueCellFull!488) mapValue!1591)) b!30654))

(assert (= (and b!30660 ((_ is ValueCellFull!488) mapDefault!1591)) b!30663))

(assert (= start!4106 b!30660))

(declare-fun m!24579 () Bool)

(assert (=> start!4106 m!24579))

(declare-fun m!24581 () Bool)

(assert (=> start!4106 m!24581))

(declare-fun m!24583 () Bool)

(assert (=> start!4106 m!24583))

(declare-fun m!24585 () Bool)

(assert (=> b!30656 m!24585))

(declare-fun m!24587 () Bool)

(assert (=> b!30656 m!24587))

(declare-fun m!24589 () Bool)

(assert (=> b!30655 m!24589))

(declare-fun m!24591 () Bool)

(assert (=> b!30658 m!24591))

(declare-fun m!24593 () Bool)

(assert (=> mapNonEmpty!1591 m!24593))

(declare-fun m!24595 () Bool)

(assert (=> b!30659 m!24595))

(declare-fun m!24597 () Bool)

(assert (=> b!30662 m!24597))

(assert (=> b!30662 m!24597))

(declare-fun m!24599 () Bool)

(assert (=> b!30662 m!24599))

(declare-fun m!24601 () Bool)

(assert (=> b!30662 m!24601))

(declare-fun m!24603 () Bool)

(assert (=> b!30653 m!24603))

(declare-fun m!24605 () Bool)

(assert (=> b!30657 m!24605))

(check-sat tp_is_empty!1375 (not start!4106) (not b!30662) (not mapNonEmpty!1591) b_and!1825 (not b!30658) (not b_next!1021) (not b!30659) (not b!30653) (not b!30656) (not b!30657) (not b!30655))
(check-sat b_and!1825 (not b_next!1021))
