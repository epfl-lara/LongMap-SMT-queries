; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4460 () Bool)

(assert start!4460)

(declare-fun b_free!1225 () Bool)

(declare-fun b_next!1225 () Bool)

(assert (=> start!4460 (= b_free!1225 (not b_next!1225))))

(declare-fun tp!5112 () Bool)

(declare-fun b_and!2037 () Bool)

(assert (=> start!4460 (= tp!5112 b_and!2037)))

(declare-fun b!34519 () Bool)

(declare-fun e!21872 () Bool)

(declare-fun e!21873 () Bool)

(declare-fun mapRes!1915 () Bool)

(assert (=> b!34519 (= e!21872 (and e!21873 mapRes!1915))))

(declare-fun condMapEmpty!1915 () Bool)

(declare-datatypes ((V!1931 0))(
  ( (V!1932 (val!816 Int)) )
))
(declare-datatypes ((ValueCell!590 0))(
  ( (ValueCellFull!590 (v!1911 V!1931)) (EmptyCell!590) )
))
(declare-datatypes ((array!2355 0))(
  ( (array!2356 (arr!1125 (Array (_ BitVec 32) ValueCell!590)) (size!1226 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2355)

(declare-fun mapDefault!1915 () ValueCell!590)

(assert (=> b!34519 (= condMapEmpty!1915 (= (arr!1125 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!590)) mapDefault!1915)))))

(declare-fun mapNonEmpty!1915 () Bool)

(declare-fun tp!5113 () Bool)

(declare-fun e!21869 () Bool)

(assert (=> mapNonEmpty!1915 (= mapRes!1915 (and tp!5113 e!21869))))

(declare-fun mapRest!1915 () (Array (_ BitVec 32) ValueCell!590))

(declare-fun mapKey!1915 () (_ BitVec 32))

(declare-fun mapValue!1915 () ValueCell!590)

(assert (=> mapNonEmpty!1915 (= (arr!1125 _values!1501) (store mapRest!1915 mapKey!1915 mapValue!1915))))

(declare-fun b!34521 () Bool)

(declare-fun res!20957 () Bool)

(declare-fun e!21870 () Bool)

(assert (=> b!34521 (=> (not res!20957) (not e!21870))))

(declare-datatypes ((array!2357 0))(
  ( (array!2358 (arr!1126 (Array (_ BitVec 32) (_ BitVec 64))) (size!1227 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2357)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34521 (= res!20957 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34522 () Bool)

(declare-fun tp_is_empty!1579 () Bool)

(assert (=> b!34522 (= e!21869 tp_is_empty!1579)))

(declare-fun b!34523 () Bool)

(assert (=> b!34523 (= e!21870 false)))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!137 0))(
  ( (MissingZero!137 (index!2670 (_ BitVec 32))) (Found!137 (index!2671 (_ BitVec 32))) (Intermediate!137 (undefined!949 Bool) (index!2672 (_ BitVec 32)) (x!6923 (_ BitVec 32))) (Undefined!137) (MissingVacant!137 (index!2673 (_ BitVec 32))) )
))
(declare-fun lt!12751 () SeekEntryResult!137)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2357 (_ BitVec 32)) SeekEntryResult!137)

(assert (=> b!34523 (= lt!12751 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34524 () Bool)

(declare-fun res!20954 () Bool)

(assert (=> b!34524 (=> (not res!20954) (not e!21870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34524 (= res!20954 (validKeyInArray!0 k0!1304))))

(declare-fun b!34525 () Bool)

(declare-fun res!20958 () Bool)

(assert (=> b!34525 (=> (not res!20958) (not e!21870))))

(declare-datatypes ((List!895 0))(
  ( (Nil!892) (Cons!891 (h!1458 (_ BitVec 64)) (t!3594 List!895)) )
))
(declare-fun arrayNoDuplicates!0 (array!2357 (_ BitVec 32) List!895) Bool)

(assert (=> b!34525 (= res!20958 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!892))))

(declare-fun mapIsEmpty!1915 () Bool)

(assert (=> mapIsEmpty!1915 mapRes!1915))

(declare-fun b!34526 () Bool)

(declare-fun res!20955 () Bool)

(assert (=> b!34526 (=> (not res!20955) (not e!21870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2357 (_ BitVec 32)) Bool)

(assert (=> b!34526 (= res!20955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34527 () Bool)

(assert (=> b!34527 (= e!21873 tp_is_empty!1579)))

(declare-fun b!34528 () Bool)

(declare-fun res!20959 () Bool)

(assert (=> b!34528 (=> (not res!20959) (not e!21870))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1931)

(declare-fun minValue!1443 () V!1931)

(declare-datatypes ((tuple2!1302 0))(
  ( (tuple2!1303 (_1!662 (_ BitVec 64)) (_2!662 V!1931)) )
))
(declare-datatypes ((List!896 0))(
  ( (Nil!893) (Cons!892 (h!1459 tuple2!1302) (t!3595 List!896)) )
))
(declare-datatypes ((ListLongMap!873 0))(
  ( (ListLongMap!874 (toList!452 List!896)) )
))
(declare-fun contains!400 (ListLongMap!873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!273 (array!2357 array!2355 (_ BitVec 32) (_ BitVec 32) V!1931 V!1931 (_ BitVec 32) Int) ListLongMap!873)

(assert (=> b!34528 (= res!20959 (not (contains!400 (getCurrentListMap!273 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!20956 () Bool)

(assert (=> start!4460 (=> (not res!20956) (not e!21870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4460 (= res!20956 (validMask!0 mask!2294))))

(assert (=> start!4460 e!21870))

(assert (=> start!4460 true))

(assert (=> start!4460 tp!5112))

(declare-fun array_inv!769 (array!2355) Bool)

(assert (=> start!4460 (and (array_inv!769 _values!1501) e!21872)))

(declare-fun array_inv!770 (array!2357) Bool)

(assert (=> start!4460 (array_inv!770 _keys!1833)))

(assert (=> start!4460 tp_is_empty!1579))

(declare-fun b!34520 () Bool)

(declare-fun res!20960 () Bool)

(assert (=> b!34520 (=> (not res!20960) (not e!21870))))

(assert (=> b!34520 (= res!20960 (and (= (size!1226 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1227 _keys!1833) (size!1226 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4460 res!20956) b!34520))

(assert (= (and b!34520 res!20960) b!34526))

(assert (= (and b!34526 res!20955) b!34525))

(assert (= (and b!34525 res!20958) b!34524))

(assert (= (and b!34524 res!20954) b!34528))

(assert (= (and b!34528 res!20959) b!34521))

(assert (= (and b!34521 res!20957) b!34523))

(assert (= (and b!34519 condMapEmpty!1915) mapIsEmpty!1915))

(assert (= (and b!34519 (not condMapEmpty!1915)) mapNonEmpty!1915))

(get-info :version)

(assert (= (and mapNonEmpty!1915 ((_ is ValueCellFull!590) mapValue!1915)) b!34522))

(assert (= (and b!34519 ((_ is ValueCellFull!590) mapDefault!1915)) b!34527))

(assert (= start!4460 b!34519))

(declare-fun m!27727 () Bool)

(assert (=> mapNonEmpty!1915 m!27727))

(declare-fun m!27729 () Bool)

(assert (=> start!4460 m!27729))

(declare-fun m!27731 () Bool)

(assert (=> start!4460 m!27731))

(declare-fun m!27733 () Bool)

(assert (=> start!4460 m!27733))

(declare-fun m!27735 () Bool)

(assert (=> b!34525 m!27735))

(declare-fun m!27737 () Bool)

(assert (=> b!34523 m!27737))

(declare-fun m!27739 () Bool)

(assert (=> b!34526 m!27739))

(declare-fun m!27741 () Bool)

(assert (=> b!34528 m!27741))

(assert (=> b!34528 m!27741))

(declare-fun m!27743 () Bool)

(assert (=> b!34528 m!27743))

(declare-fun m!27745 () Bool)

(assert (=> b!34524 m!27745))

(declare-fun m!27747 () Bool)

(assert (=> b!34521 m!27747))

(check-sat (not b!34528) (not b!34523) (not b!34525) (not b!34521) (not b_next!1225) (not start!4460) b_and!2037 (not b!34526) (not mapNonEmpty!1915) (not b!34524) tp_is_empty!1579)
(check-sat b_and!2037 (not b_next!1225))
