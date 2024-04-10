; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4178 () Bool)

(assert start!4178)

(declare-fun b_free!1083 () Bool)

(declare-fun b_next!1083 () Bool)

(assert (=> start!4178 (= b_free!1083 (not b_next!1083))))

(declare-fun tp!4669 () Bool)

(declare-fun b_and!1893 () Bool)

(assert (=> start!4178 (= tp!4669 b_and!1893)))

(declare-fun res!19162 () Bool)

(declare-fun e!20189 () Bool)

(assert (=> start!4178 (=> (not res!19162) (not e!20189))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4178 (= res!19162 (validMask!0 mask!2294))))

(assert (=> start!4178 e!20189))

(assert (=> start!4178 true))

(assert (=> start!4178 tp!4669))

(declare-datatypes ((V!1741 0))(
  ( (V!1742 (val!745 Int)) )
))
(declare-datatypes ((ValueCell!519 0))(
  ( (ValueCellFull!519 (v!1834 V!1741)) (EmptyCell!519) )
))
(declare-datatypes ((array!2091 0))(
  ( (array!2092 (arr!999 (Array (_ BitVec 32) ValueCell!519)) (size!1100 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2091)

(declare-fun e!20185 () Bool)

(declare-fun array_inv!699 (array!2091) Bool)

(assert (=> start!4178 (and (array_inv!699 _values!1501) e!20185)))

(declare-datatypes ((array!2093 0))(
  ( (array!2094 (arr!1000 (Array (_ BitVec 32) (_ BitVec 64))) (size!1101 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2093)

(declare-fun array_inv!700 (array!2093) Bool)

(assert (=> start!4178 (array_inv!700 _keys!1833)))

(declare-fun tp_is_empty!1437 () Bool)

(assert (=> start!4178 tp_is_empty!1437))

(declare-fun b!31617 () Bool)

(declare-fun res!19167 () Bool)

(assert (=> b!31617 (=> (not res!19167) (not e!20189))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1741)

(declare-fun minValue!1443 () V!1741)

(declare-datatypes ((tuple2!1216 0))(
  ( (tuple2!1217 (_1!619 (_ BitVec 64)) (_2!619 V!1741)) )
))
(declare-datatypes ((List!809 0))(
  ( (Nil!806) (Cons!805 (h!1372 tuple2!1216) (t!3502 List!809)) )
))
(declare-datatypes ((ListLongMap!793 0))(
  ( (ListLongMap!794 (toList!412 List!809)) )
))
(declare-fun contains!352 (ListLongMap!793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!240 (array!2093 array!2091 (_ BitVec 32) (_ BitVec 32) V!1741 V!1741 (_ BitVec 32) Int) ListLongMap!793)

(assert (=> b!31617 (= res!19167 (not (contains!352 (getCurrentListMap!240 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31618 () Bool)

(declare-fun res!19165 () Bool)

(assert (=> b!31618 (=> (not res!19165) (not e!20189))))

(declare-datatypes ((List!810 0))(
  ( (Nil!807) (Cons!806 (h!1373 (_ BitVec 64)) (t!3503 List!810)) )
))
(declare-fun arrayNoDuplicates!0 (array!2093 (_ BitVec 32) List!810) Bool)

(assert (=> b!31618 (= res!19165 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!807))))

(declare-fun b!31619 () Bool)

(declare-fun e!20187 () Bool)

(assert (=> b!31619 (= e!20187 tp_is_empty!1437)))

(declare-fun mapNonEmpty!1684 () Bool)

(declare-fun mapRes!1684 () Bool)

(declare-fun tp!4668 () Bool)

(declare-fun e!20186 () Bool)

(assert (=> mapNonEmpty!1684 (= mapRes!1684 (and tp!4668 e!20186))))

(declare-fun mapValue!1684 () ValueCell!519)

(declare-fun mapKey!1684 () (_ BitVec 32))

(declare-fun mapRest!1684 () (Array (_ BitVec 32) ValueCell!519))

(assert (=> mapNonEmpty!1684 (= (arr!999 _values!1501) (store mapRest!1684 mapKey!1684 mapValue!1684))))

(declare-fun b!31620 () Bool)

(declare-fun res!19163 () Bool)

(assert (=> b!31620 (=> (not res!19163) (not e!20189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31620 (= res!19163 (validKeyInArray!0 k0!1304))))

(declare-fun b!31621 () Bool)

(declare-fun res!19166 () Bool)

(assert (=> b!31621 (=> (not res!19166) (not e!20189))))

(declare-fun arrayContainsKey!0 (array!2093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31621 (= res!19166 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31622 () Bool)

(declare-fun res!19164 () Bool)

(assert (=> b!31622 (=> (not res!19164) (not e!20189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2093 (_ BitVec 32)) Bool)

(assert (=> b!31622 (= res!19164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31623 () Bool)

(assert (=> b!31623 (= e!20189 false)))

(declare-fun lt!11585 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2093 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31623 (= lt!11585 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31624 () Bool)

(assert (=> b!31624 (= e!20185 (and e!20187 mapRes!1684))))

(declare-fun condMapEmpty!1684 () Bool)

(declare-fun mapDefault!1684 () ValueCell!519)

(assert (=> b!31624 (= condMapEmpty!1684 (= (arr!999 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!519)) mapDefault!1684)))))

(declare-fun b!31625 () Bool)

(declare-fun res!19161 () Bool)

(assert (=> b!31625 (=> (not res!19161) (not e!20189))))

(assert (=> b!31625 (= res!19161 (and (= (size!1100 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1101 _keys!1833) (size!1100 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1684 () Bool)

(assert (=> mapIsEmpty!1684 mapRes!1684))

(declare-fun b!31626 () Bool)

(assert (=> b!31626 (= e!20186 tp_is_empty!1437)))

(assert (= (and start!4178 res!19162) b!31625))

(assert (= (and b!31625 res!19161) b!31622))

(assert (= (and b!31622 res!19164) b!31618))

(assert (= (and b!31618 res!19165) b!31620))

(assert (= (and b!31620 res!19163) b!31617))

(assert (= (and b!31617 res!19167) b!31621))

(assert (= (and b!31621 res!19166) b!31623))

(assert (= (and b!31624 condMapEmpty!1684) mapIsEmpty!1684))

(assert (= (and b!31624 (not condMapEmpty!1684)) mapNonEmpty!1684))

(get-info :version)

(assert (= (and mapNonEmpty!1684 ((_ is ValueCellFull!519) mapValue!1684)) b!31626))

(assert (= (and b!31624 ((_ is ValueCellFull!519) mapDefault!1684)) b!31619))

(assert (= start!4178 b!31624))

(declare-fun m!25349 () Bool)

(assert (=> b!31620 m!25349))

(declare-fun m!25351 () Bool)

(assert (=> b!31621 m!25351))

(declare-fun m!25353 () Bool)

(assert (=> b!31618 m!25353))

(declare-fun m!25355 () Bool)

(assert (=> b!31617 m!25355))

(assert (=> b!31617 m!25355))

(declare-fun m!25357 () Bool)

(assert (=> b!31617 m!25357))

(declare-fun m!25359 () Bool)

(assert (=> b!31622 m!25359))

(declare-fun m!25361 () Bool)

(assert (=> b!31623 m!25361))

(declare-fun m!25363 () Bool)

(assert (=> start!4178 m!25363))

(declare-fun m!25365 () Bool)

(assert (=> start!4178 m!25365))

(declare-fun m!25367 () Bool)

(assert (=> start!4178 m!25367))

(declare-fun m!25369 () Bool)

(assert (=> mapNonEmpty!1684 m!25369))

(check-sat (not b!31618) (not b!31622) b_and!1893 tp_is_empty!1437 (not b!31617) (not b_next!1083) (not mapNonEmpty!1684) (not b!31623) (not b!31621) (not b!31620) (not start!4178))
(check-sat b_and!1893 (not b_next!1083))
