; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4112 () Bool)

(assert start!4112)

(declare-fun b_free!1021 () Bool)

(declare-fun b_next!1021 () Bool)

(assert (=> start!4112 (= b_free!1021 (not b_next!1021))))

(declare-fun tp!4483 () Bool)

(declare-fun b_and!1821 () Bool)

(assert (=> start!4112 (= tp!4483 b_and!1821)))

(declare-fun b!30635 () Bool)

(declare-fun e!19623 () Bool)

(declare-fun tp_is_empty!1375 () Bool)

(assert (=> b!30635 (= e!19623 tp_is_empty!1375)))

(declare-fun res!18495 () Bool)

(declare-fun e!19620 () Bool)

(assert (=> start!4112 (=> (not res!18495) (not e!19620))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4112 (= res!18495 (validMask!0 mask!2294))))

(assert (=> start!4112 e!19620))

(assert (=> start!4112 true))

(assert (=> start!4112 tp!4483))

(declare-datatypes ((V!1659 0))(
  ( (V!1660 (val!714 Int)) )
))
(declare-datatypes ((ValueCell!488 0))(
  ( (ValueCellFull!488 (v!1803 V!1659)) (EmptyCell!488) )
))
(declare-datatypes ((array!1955 0))(
  ( (array!1956 (arr!931 (Array (_ BitVec 32) ValueCell!488)) (size!1032 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1955)

(declare-fun e!19622 () Bool)

(declare-fun array_inv!641 (array!1955) Bool)

(assert (=> start!4112 (and (array_inv!641 _values!1501) e!19622)))

(declare-datatypes ((array!1957 0))(
  ( (array!1958 (arr!932 (Array (_ BitVec 32) (_ BitVec 64))) (size!1033 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1957)

(declare-fun array_inv!642 (array!1957) Bool)

(assert (=> start!4112 (array_inv!642 _keys!1833)))

(assert (=> start!4112 tp_is_empty!1375))

(declare-fun b!30636 () Bool)

(declare-fun e!19624 () Bool)

(assert (=> b!30636 (= e!19620 e!19624)))

(declare-fun res!18493 () Bool)

(assert (=> b!30636 (=> (not res!18493) (not e!19624))))

(declare-datatypes ((tuple2!1170 0))(
  ( (tuple2!1171 (_1!596 (_ BitVec 64)) (_2!596 V!1659)) )
))
(declare-datatypes ((List!763 0))(
  ( (Nil!760) (Cons!759 (h!1326 tuple2!1170) (t!3450 List!763)) )
))
(declare-datatypes ((ListLongMap!741 0))(
  ( (ListLongMap!742 (toList!386 List!763)) )
))
(declare-fun lt!11408 () ListLongMap!741)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!328 (ListLongMap!741 (_ BitVec 64)) Bool)

(assert (=> b!30636 (= res!18493 (not (contains!328 lt!11408 k0!1304)))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1659)

(declare-fun minValue!1443 () V!1659)

(declare-fun getCurrentListMap!211 (array!1957 array!1955 (_ BitVec 32) (_ BitVec 32) V!1659 V!1659 (_ BitVec 32) Int) ListLongMap!741)

(assert (=> b!30636 (= lt!11408 (getCurrentListMap!211 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30637 () Bool)

(declare-fun res!18490 () Bool)

(assert (=> b!30637 (=> (not res!18490) (not e!19620))))

(declare-datatypes ((List!764 0))(
  ( (Nil!761) (Cons!760 (h!1327 (_ BitVec 64)) (t!3451 List!764)) )
))
(declare-fun arrayNoDuplicates!0 (array!1957 (_ BitVec 32) List!764) Bool)

(assert (=> b!30637 (= res!18490 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!761))))

(declare-fun b!30638 () Bool)

(declare-fun res!18492 () Bool)

(assert (=> b!30638 (=> (not res!18492) (not e!19620))))

(assert (=> b!30638 (= res!18492 (and (= (size!1032 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1033 _keys!1833) (size!1032 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30639 () Bool)

(declare-fun e!19621 () Bool)

(assert (=> b!30639 (= e!19621 (not true))))

(declare-datatypes ((SeekEntryResult!107 0))(
  ( (MissingZero!107 (index!2550 (_ BitVec 32))) (Found!107 (index!2551 (_ BitVec 32))) (Intermediate!107 (undefined!919 Bool) (index!2552 (_ BitVec 32)) (x!6561 (_ BitVec 32))) (Undefined!107) (MissingVacant!107 (index!2553 (_ BitVec 32))) )
))
(declare-fun lt!11407 () SeekEntryResult!107)

(assert (=> b!30639 (contains!328 lt!11408 (select (arr!932 _keys!1833) (index!2551 lt!11407)))))

(declare-datatypes ((Unit!707 0))(
  ( (Unit!708) )
))
(declare-fun lt!11409 () Unit!707)

(declare-fun lemmaValidKeyInArrayIsInListMap!43 (array!1957 array!1955 (_ BitVec 32) (_ BitVec 32) V!1659 V!1659 (_ BitVec 32) Int) Unit!707)

(assert (=> b!30639 (= lt!11409 (lemmaValidKeyInArrayIsInListMap!43 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2551 lt!11407) defaultEntry!1504))))

(declare-fun b!30640 () Bool)

(declare-fun e!19619 () Bool)

(declare-fun mapRes!1591 () Bool)

(assert (=> b!30640 (= e!19622 (and e!19619 mapRes!1591))))

(declare-fun condMapEmpty!1591 () Bool)

(declare-fun mapDefault!1591 () ValueCell!488)

(assert (=> b!30640 (= condMapEmpty!1591 (= (arr!931 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!488)) mapDefault!1591)))))

(declare-fun mapNonEmpty!1591 () Bool)

(declare-fun tp!4482 () Bool)

(assert (=> mapNonEmpty!1591 (= mapRes!1591 (and tp!4482 e!19623))))

(declare-fun mapKey!1591 () (_ BitVec 32))

(declare-fun mapValue!1591 () ValueCell!488)

(declare-fun mapRest!1591 () (Array (_ BitVec 32) ValueCell!488))

(assert (=> mapNonEmpty!1591 (= (arr!931 _values!1501) (store mapRest!1591 mapKey!1591 mapValue!1591))))

(declare-fun b!30641 () Bool)

(declare-fun res!18496 () Bool)

(assert (=> b!30641 (=> (not res!18496) (not e!19620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1957 (_ BitVec 32)) Bool)

(assert (=> b!30641 (= res!18496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30642 () Bool)

(assert (=> b!30642 (= e!19624 e!19621)))

(declare-fun res!18491 () Bool)

(assert (=> b!30642 (=> (not res!18491) (not e!19621))))

(get-info :version)

(assert (=> b!30642 (= res!18491 ((_ is Found!107) lt!11407))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1957 (_ BitVec 32)) SeekEntryResult!107)

(assert (=> b!30642 (= lt!11407 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1591 () Bool)

(assert (=> mapIsEmpty!1591 mapRes!1591))

(declare-fun b!30643 () Bool)

(declare-fun res!18497 () Bool)

(assert (=> b!30643 (=> (not res!18497) (not e!19624))))

(declare-fun arrayContainsKey!0 (array!1957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30643 (= res!18497 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30644 () Bool)

(assert (=> b!30644 (= e!19619 tp_is_empty!1375)))

(declare-fun b!30645 () Bool)

(declare-fun res!18494 () Bool)

(assert (=> b!30645 (=> (not res!18494) (not e!19620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30645 (= res!18494 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4112 res!18495) b!30638))

(assert (= (and b!30638 res!18492) b!30641))

(assert (= (and b!30641 res!18496) b!30637))

(assert (= (and b!30637 res!18490) b!30645))

(assert (= (and b!30645 res!18494) b!30636))

(assert (= (and b!30636 res!18493) b!30643))

(assert (= (and b!30643 res!18497) b!30642))

(assert (= (and b!30642 res!18491) b!30639))

(assert (= (and b!30640 condMapEmpty!1591) mapIsEmpty!1591))

(assert (= (and b!30640 (not condMapEmpty!1591)) mapNonEmpty!1591))

(assert (= (and mapNonEmpty!1591 ((_ is ValueCellFull!488) mapValue!1591)) b!30635))

(assert (= (and b!30640 ((_ is ValueCellFull!488) mapDefault!1591)) b!30644))

(assert (= start!4112 b!30640))

(declare-fun m!24497 () Bool)

(assert (=> b!30645 m!24497))

(declare-fun m!24499 () Bool)

(assert (=> b!30639 m!24499))

(assert (=> b!30639 m!24499))

(declare-fun m!24501 () Bool)

(assert (=> b!30639 m!24501))

(declare-fun m!24503 () Bool)

(assert (=> b!30639 m!24503))

(declare-fun m!24505 () Bool)

(assert (=> b!30636 m!24505))

(declare-fun m!24507 () Bool)

(assert (=> b!30636 m!24507))

(declare-fun m!24509 () Bool)

(assert (=> b!30641 m!24509))

(declare-fun m!24511 () Bool)

(assert (=> mapNonEmpty!1591 m!24511))

(declare-fun m!24513 () Bool)

(assert (=> start!4112 m!24513))

(declare-fun m!24515 () Bool)

(assert (=> start!4112 m!24515))

(declare-fun m!24517 () Bool)

(assert (=> start!4112 m!24517))

(declare-fun m!24519 () Bool)

(assert (=> b!30643 m!24519))

(declare-fun m!24521 () Bool)

(assert (=> b!30642 m!24521))

(declare-fun m!24523 () Bool)

(assert (=> b!30637 m!24523))

(check-sat (not b!30645) (not b_next!1021) (not b!30641) (not b!30636) (not mapNonEmpty!1591) tp_is_empty!1375 b_and!1821 (not start!4112) (not b!30637) (not b!30643) (not b!30642) (not b!30639))
(check-sat b_and!1821 (not b_next!1021))
