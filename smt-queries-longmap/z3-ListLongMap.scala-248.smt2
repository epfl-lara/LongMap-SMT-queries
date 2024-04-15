; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4160 () Bool)

(assert start!4160)

(declare-fun b_free!1075 () Bool)

(declare-fun b_next!1075 () Bool)

(assert (=> start!4160 (= b_free!1075 (not b_next!1075))))

(declare-fun tp!4645 () Bool)

(declare-fun b_and!1879 () Bool)

(assert (=> start!4160 (= tp!4645 b_and!1879)))

(declare-fun b!31443 () Bool)

(declare-fun res!19045 () Bool)

(declare-fun e!20086 () Bool)

(assert (=> b!31443 (=> (not res!19045) (not e!20086))))

(declare-datatypes ((array!2049 0))(
  ( (array!2050 (arr!978 (Array (_ BitVec 32) (_ BitVec 64))) (size!1079 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2049)

(declare-datatypes ((List!797 0))(
  ( (Nil!794) (Cons!793 (h!1360 (_ BitVec 64)) (t!3483 List!797)) )
))
(declare-fun arrayNoDuplicates!0 (array!2049 (_ BitVec 32) List!797) Bool)

(assert (=> b!31443 (= res!19045 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!794))))

(declare-fun mapIsEmpty!1672 () Bool)

(declare-fun mapRes!1672 () Bool)

(assert (=> mapIsEmpty!1672 mapRes!1672))

(declare-fun b!31445 () Bool)

(declare-fun res!19047 () Bool)

(assert (=> b!31445 (=> (not res!19047) (not e!20086))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1731 0))(
  ( (V!1732 (val!741 Int)) )
))
(declare-datatypes ((ValueCell!515 0))(
  ( (ValueCellFull!515 (v!1829 V!1731)) (EmptyCell!515) )
))
(declare-datatypes ((array!2051 0))(
  ( (array!2052 (arr!979 (Array (_ BitVec 32) ValueCell!515)) (size!1080 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2051)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1731)

(declare-fun minValue!1443 () V!1731)

(declare-datatypes ((tuple2!1214 0))(
  ( (tuple2!1215 (_1!618 (_ BitVec 64)) (_2!618 V!1731)) )
))
(declare-datatypes ((List!798 0))(
  ( (Nil!795) (Cons!794 (h!1361 tuple2!1214) (t!3484 List!798)) )
))
(declare-datatypes ((ListLongMap!779 0))(
  ( (ListLongMap!780 (toList!405 List!798)) )
))
(declare-fun contains!346 (ListLongMap!779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!228 (array!2049 array!2051 (_ BitVec 32) (_ BitVec 32) V!1731 V!1731 (_ BitVec 32) Int) ListLongMap!779)

(assert (=> b!31445 (= res!19047 (not (contains!346 (getCurrentListMap!228 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31446 () Bool)

(declare-fun res!19051 () Bool)

(assert (=> b!31446 (=> (not res!19051) (not e!20086))))

(declare-fun arrayContainsKey!0 (array!2049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31446 (= res!19051 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31447 () Bool)

(declare-fun res!19048 () Bool)

(assert (=> b!31447 (=> (not res!19048) (not e!20086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31447 (= res!19048 (validKeyInArray!0 k0!1304))))

(declare-fun b!31448 () Bool)

(declare-fun e!20082 () Bool)

(declare-fun tp_is_empty!1429 () Bool)

(assert (=> b!31448 (= e!20082 tp_is_empty!1429)))

(declare-fun mapNonEmpty!1672 () Bool)

(declare-fun tp!4644 () Bool)

(assert (=> mapNonEmpty!1672 (= mapRes!1672 (and tp!4644 e!20082))))

(declare-fun mapValue!1672 () ValueCell!515)

(declare-fun mapRest!1672 () (Array (_ BitVec 32) ValueCell!515))

(declare-fun mapKey!1672 () (_ BitVec 32))

(assert (=> mapNonEmpty!1672 (= (arr!979 _values!1501) (store mapRest!1672 mapKey!1672 mapValue!1672))))

(declare-fun res!19046 () Bool)

(assert (=> start!4160 (=> (not res!19046) (not e!20086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4160 (= res!19046 (validMask!0 mask!2294))))

(assert (=> start!4160 e!20086))

(assert (=> start!4160 true))

(assert (=> start!4160 tp!4645))

(declare-fun e!20084 () Bool)

(declare-fun array_inv!691 (array!2051) Bool)

(assert (=> start!4160 (and (array_inv!691 _values!1501) e!20084)))

(declare-fun array_inv!692 (array!2049) Bool)

(assert (=> start!4160 (array_inv!692 _keys!1833)))

(assert (=> start!4160 tp_is_empty!1429))

(declare-fun b!31444 () Bool)

(declare-fun res!19050 () Bool)

(assert (=> b!31444 (=> (not res!19050) (not e!20086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2049 (_ BitVec 32)) Bool)

(assert (=> b!31444 (= res!19050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31449 () Bool)

(assert (=> b!31449 (= e!20086 false)))

(declare-fun lt!11569 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2049 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31449 (= lt!11569 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31450 () Bool)

(declare-fun res!19049 () Bool)

(assert (=> b!31450 (=> (not res!19049) (not e!20086))))

(assert (=> b!31450 (= res!19049 (and (= (size!1080 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1079 _keys!1833) (size!1080 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31451 () Bool)

(declare-fun e!20083 () Bool)

(assert (=> b!31451 (= e!20084 (and e!20083 mapRes!1672))))

(declare-fun condMapEmpty!1672 () Bool)

(declare-fun mapDefault!1672 () ValueCell!515)

(assert (=> b!31451 (= condMapEmpty!1672 (= (arr!979 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!515)) mapDefault!1672)))))

(declare-fun b!31452 () Bool)

(assert (=> b!31452 (= e!20083 tp_is_empty!1429)))

(assert (= (and start!4160 res!19046) b!31450))

(assert (= (and b!31450 res!19049) b!31444))

(assert (= (and b!31444 res!19050) b!31443))

(assert (= (and b!31443 res!19045) b!31447))

(assert (= (and b!31447 res!19048) b!31445))

(assert (= (and b!31445 res!19047) b!31446))

(assert (= (and b!31446 res!19051) b!31449))

(assert (= (and b!31451 condMapEmpty!1672) mapIsEmpty!1672))

(assert (= (and b!31451 (not condMapEmpty!1672)) mapNonEmpty!1672))

(get-info :version)

(assert (= (and mapNonEmpty!1672 ((_ is ValueCellFull!515) mapValue!1672)) b!31448))

(assert (= (and b!31451 ((_ is ValueCellFull!515) mapDefault!1672)) b!31452))

(assert (= start!4160 b!31451))

(declare-fun m!25191 () Bool)

(assert (=> b!31445 m!25191))

(assert (=> b!31445 m!25191))

(declare-fun m!25193 () Bool)

(assert (=> b!31445 m!25193))

(declare-fun m!25195 () Bool)

(assert (=> mapNonEmpty!1672 m!25195))

(declare-fun m!25197 () Bool)

(assert (=> b!31447 m!25197))

(declare-fun m!25199 () Bool)

(assert (=> b!31443 m!25199))

(declare-fun m!25201 () Bool)

(assert (=> b!31444 m!25201))

(declare-fun m!25203 () Bool)

(assert (=> start!4160 m!25203))

(declare-fun m!25205 () Bool)

(assert (=> start!4160 m!25205))

(declare-fun m!25207 () Bool)

(assert (=> start!4160 m!25207))

(declare-fun m!25209 () Bool)

(assert (=> b!31449 m!25209))

(declare-fun m!25211 () Bool)

(assert (=> b!31446 m!25211))

(check-sat (not b!31445) (not b!31443) (not b_next!1075) tp_is_empty!1429 (not b!31446) (not mapNonEmpty!1672) (not b!31449) (not b!31447) (not start!4160) b_and!1879 (not b!31444))
(check-sat b_and!1879 (not b_next!1075))
