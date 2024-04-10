; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4202 () Bool)

(assert start!4202)

(declare-fun b_free!1107 () Bool)

(declare-fun b_next!1107 () Bool)

(assert (=> start!4202 (= b_free!1107 (not b_next!1107))))

(declare-fun tp!4741 () Bool)

(declare-fun b_and!1917 () Bool)

(assert (=> start!4202 (= tp!4741 b_and!1917)))

(declare-fun b!31977 () Bool)

(declare-fun e!20367 () Bool)

(declare-fun tp_is_empty!1461 () Bool)

(assert (=> b!31977 (= e!20367 tp_is_empty!1461)))

(declare-fun b!31978 () Bool)

(declare-fun res!19415 () Bool)

(declare-fun e!20365 () Bool)

(assert (=> b!31978 (=> (not res!19415) (not e!20365))))

(declare-datatypes ((array!2135 0))(
  ( (array!2136 (arr!1021 (Array (_ BitVec 32) (_ BitVec 64))) (size!1122 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2135)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31978 (= res!19415 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31979 () Bool)

(declare-fun res!19417 () Bool)

(assert (=> b!31979 (=> (not res!19417) (not e!20365))))

(declare-datatypes ((List!824 0))(
  ( (Nil!821) (Cons!820 (h!1387 (_ BitVec 64)) (t!3517 List!824)) )
))
(declare-fun arrayNoDuplicates!0 (array!2135 (_ BitVec 32) List!824) Bool)

(assert (=> b!31979 (= res!19417 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!821))))

(declare-fun b!31980 () Bool)

(declare-fun res!19419 () Bool)

(assert (=> b!31980 (=> (not res!19419) (not e!20365))))

(declare-datatypes ((V!1773 0))(
  ( (V!1774 (val!757 Int)) )
))
(declare-datatypes ((ValueCell!531 0))(
  ( (ValueCellFull!531 (v!1846 V!1773)) (EmptyCell!531) )
))
(declare-datatypes ((array!2137 0))(
  ( (array!2138 (arr!1022 (Array (_ BitVec 32) ValueCell!531)) (size!1123 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2137)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31980 (= res!19419 (and (= (size!1123 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1122 _keys!1833) (size!1123 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31982 () Bool)

(declare-fun e!20369 () Bool)

(declare-fun e!20366 () Bool)

(declare-fun mapRes!1720 () Bool)

(assert (=> b!31982 (= e!20369 (and e!20366 mapRes!1720))))

(declare-fun condMapEmpty!1720 () Bool)

(declare-fun mapDefault!1720 () ValueCell!531)

(assert (=> b!31982 (= condMapEmpty!1720 (= (arr!1022 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!531)) mapDefault!1720)))))

(declare-fun b!31983 () Bool)

(assert (=> b!31983 (= e!20365 false)))

(declare-fun lt!11621 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2135 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31983 (= lt!11621 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31984 () Bool)

(declare-fun res!19414 () Bool)

(assert (=> b!31984 (=> (not res!19414) (not e!20365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2135 (_ BitVec 32)) Bool)

(assert (=> b!31984 (= res!19414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31985 () Bool)

(declare-fun res!19413 () Bool)

(assert (=> b!31985 (=> (not res!19413) (not e!20365))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1773)

(declare-fun minValue!1443 () V!1773)

(declare-datatypes ((tuple2!1230 0))(
  ( (tuple2!1231 (_1!626 (_ BitVec 64)) (_2!626 V!1773)) )
))
(declare-datatypes ((List!825 0))(
  ( (Nil!822) (Cons!821 (h!1388 tuple2!1230) (t!3518 List!825)) )
))
(declare-datatypes ((ListLongMap!807 0))(
  ( (ListLongMap!808 (toList!419 List!825)) )
))
(declare-fun contains!359 (ListLongMap!807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!247 (array!2135 array!2137 (_ BitVec 32) (_ BitVec 32) V!1773 V!1773 (_ BitVec 32) Int) ListLongMap!807)

(assert (=> b!31985 (= res!19413 (not (contains!359 (getCurrentListMap!247 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31986 () Bool)

(declare-fun res!19416 () Bool)

(assert (=> b!31986 (=> (not res!19416) (not e!20365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31986 (= res!19416 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1720 () Bool)

(assert (=> mapIsEmpty!1720 mapRes!1720))

(declare-fun mapNonEmpty!1720 () Bool)

(declare-fun tp!4740 () Bool)

(assert (=> mapNonEmpty!1720 (= mapRes!1720 (and tp!4740 e!20367))))

(declare-fun mapKey!1720 () (_ BitVec 32))

(declare-fun mapRest!1720 () (Array (_ BitVec 32) ValueCell!531))

(declare-fun mapValue!1720 () ValueCell!531)

(assert (=> mapNonEmpty!1720 (= (arr!1022 _values!1501) (store mapRest!1720 mapKey!1720 mapValue!1720))))

(declare-fun res!19418 () Bool)

(assert (=> start!4202 (=> (not res!19418) (not e!20365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4202 (= res!19418 (validMask!0 mask!2294))))

(assert (=> start!4202 e!20365))

(assert (=> start!4202 true))

(assert (=> start!4202 tp!4741))

(declare-fun array_inv!713 (array!2137) Bool)

(assert (=> start!4202 (and (array_inv!713 _values!1501) e!20369)))

(declare-fun array_inv!714 (array!2135) Bool)

(assert (=> start!4202 (array_inv!714 _keys!1833)))

(assert (=> start!4202 tp_is_empty!1461))

(declare-fun b!31981 () Bool)

(assert (=> b!31981 (= e!20366 tp_is_empty!1461)))

(assert (= (and start!4202 res!19418) b!31980))

(assert (= (and b!31980 res!19419) b!31984))

(assert (= (and b!31984 res!19414) b!31979))

(assert (= (and b!31979 res!19417) b!31986))

(assert (= (and b!31986 res!19416) b!31985))

(assert (= (and b!31985 res!19413) b!31978))

(assert (= (and b!31978 res!19415) b!31983))

(assert (= (and b!31982 condMapEmpty!1720) mapIsEmpty!1720))

(assert (= (and b!31982 (not condMapEmpty!1720)) mapNonEmpty!1720))

(get-info :version)

(assert (= (and mapNonEmpty!1720 ((_ is ValueCellFull!531) mapValue!1720)) b!31977))

(assert (= (and b!31982 ((_ is ValueCellFull!531) mapDefault!1720)) b!31981))

(assert (= start!4202 b!31982))

(declare-fun m!25613 () Bool)

(assert (=> b!31979 m!25613))

(declare-fun m!25615 () Bool)

(assert (=> b!31984 m!25615))

(declare-fun m!25617 () Bool)

(assert (=> b!31986 m!25617))

(declare-fun m!25619 () Bool)

(assert (=> start!4202 m!25619))

(declare-fun m!25621 () Bool)

(assert (=> start!4202 m!25621))

(declare-fun m!25623 () Bool)

(assert (=> start!4202 m!25623))

(declare-fun m!25625 () Bool)

(assert (=> mapNonEmpty!1720 m!25625))

(declare-fun m!25627 () Bool)

(assert (=> b!31985 m!25627))

(assert (=> b!31985 m!25627))

(declare-fun m!25629 () Bool)

(assert (=> b!31985 m!25629))

(declare-fun m!25631 () Bool)

(assert (=> b!31983 m!25631))

(declare-fun m!25633 () Bool)

(assert (=> b!31978 m!25633))

(check-sat (not b!31979) (not b_next!1107) (not b!31978) (not b!31985) (not mapNonEmpty!1720) (not b!31983) tp_is_empty!1461 (not b!31986) (not b!31984) (not start!4202) b_and!1917)
(check-sat b_and!1917 (not b_next!1107))
