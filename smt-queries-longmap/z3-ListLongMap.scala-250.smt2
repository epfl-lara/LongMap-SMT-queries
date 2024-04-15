; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4172 () Bool)

(assert start!4172)

(declare-fun b_free!1087 () Bool)

(declare-fun b_next!1087 () Bool)

(assert (=> start!4172 (= b_free!1087 (not b_next!1087))))

(declare-fun tp!4681 () Bool)

(declare-fun b_and!1891 () Bool)

(assert (=> start!4172 (= tp!4681 b_and!1891)))

(declare-fun b!31623 () Bool)

(declare-fun res!19176 () Bool)

(declare-fun e!20175 () Bool)

(assert (=> b!31623 (=> (not res!19176) (not e!20175))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1747 0))(
  ( (V!1748 (val!747 Int)) )
))
(declare-datatypes ((ValueCell!521 0))(
  ( (ValueCellFull!521 (v!1835 V!1747)) (EmptyCell!521) )
))
(declare-datatypes ((array!2073 0))(
  ( (array!2074 (arr!990 (Array (_ BitVec 32) ValueCell!521)) (size!1091 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2073)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2075 0))(
  ( (array!2076 (arr!991 (Array (_ BitVec 32) (_ BitVec 64))) (size!1092 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2075)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1747)

(declare-fun minValue!1443 () V!1747)

(declare-datatypes ((tuple2!1224 0))(
  ( (tuple2!1225 (_1!623 (_ BitVec 64)) (_2!623 V!1747)) )
))
(declare-datatypes ((List!807 0))(
  ( (Nil!804) (Cons!803 (h!1370 tuple2!1224) (t!3493 List!807)) )
))
(declare-datatypes ((ListLongMap!789 0))(
  ( (ListLongMap!790 (toList!410 List!807)) )
))
(declare-fun contains!351 (ListLongMap!789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!233 (array!2075 array!2073 (_ BitVec 32) (_ BitVec 32) V!1747 V!1747 (_ BitVec 32) Int) ListLongMap!789)

(assert (=> b!31623 (= res!19176 (not (contains!351 (getCurrentListMap!233 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31624 () Bool)

(declare-fun res!19177 () Bool)

(assert (=> b!31624 (=> (not res!19177) (not e!20175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2075 (_ BitVec 32)) Bool)

(assert (=> b!31624 (= res!19177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31625 () Bool)

(declare-fun res!19171 () Bool)

(assert (=> b!31625 (=> (not res!19171) (not e!20175))))

(declare-datatypes ((List!808 0))(
  ( (Nil!805) (Cons!804 (h!1371 (_ BitVec 64)) (t!3494 List!808)) )
))
(declare-fun arrayNoDuplicates!0 (array!2075 (_ BitVec 32) List!808) Bool)

(assert (=> b!31625 (= res!19171 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!805))))

(declare-fun mapIsEmpty!1690 () Bool)

(declare-fun mapRes!1690 () Bool)

(assert (=> mapIsEmpty!1690 mapRes!1690))

(declare-fun b!31626 () Bool)

(declare-fun res!19175 () Bool)

(assert (=> b!31626 (=> (not res!19175) (not e!20175))))

(assert (=> b!31626 (= res!19175 (and (= (size!1091 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1092 _keys!1833) (size!1091 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31628 () Bool)

(declare-fun res!19174 () Bool)

(assert (=> b!31628 (=> (not res!19174) (not e!20175))))

(declare-fun arrayContainsKey!0 (array!2075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31628 (= res!19174 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31629 () Bool)

(declare-fun e!20174 () Bool)

(declare-fun e!20176 () Bool)

(assert (=> b!31629 (= e!20174 (and e!20176 mapRes!1690))))

(declare-fun condMapEmpty!1690 () Bool)

(declare-fun mapDefault!1690 () ValueCell!521)

(assert (=> b!31629 (= condMapEmpty!1690 (= (arr!990 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!521)) mapDefault!1690)))))

(declare-fun mapNonEmpty!1690 () Bool)

(declare-fun tp!4680 () Bool)

(declare-fun e!20172 () Bool)

(assert (=> mapNonEmpty!1690 (= mapRes!1690 (and tp!4680 e!20172))))

(declare-fun mapKey!1690 () (_ BitVec 32))

(declare-fun mapValue!1690 () ValueCell!521)

(declare-fun mapRest!1690 () (Array (_ BitVec 32) ValueCell!521))

(assert (=> mapNonEmpty!1690 (= (arr!990 _values!1501) (store mapRest!1690 mapKey!1690 mapValue!1690))))

(declare-fun b!31630 () Bool)

(declare-fun tp_is_empty!1441 () Bool)

(assert (=> b!31630 (= e!20176 tp_is_empty!1441)))

(declare-fun b!31631 () Bool)

(assert (=> b!31631 (= e!20172 tp_is_empty!1441)))

(declare-fun b!31632 () Bool)

(assert (=> b!31632 (= e!20175 false)))

(declare-fun lt!11587 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2075 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31632 (= lt!11587 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!19173 () Bool)

(assert (=> start!4172 (=> (not res!19173) (not e!20175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4172 (= res!19173 (validMask!0 mask!2294))))

(assert (=> start!4172 e!20175))

(assert (=> start!4172 true))

(assert (=> start!4172 tp!4681))

(declare-fun array_inv!699 (array!2073) Bool)

(assert (=> start!4172 (and (array_inv!699 _values!1501) e!20174)))

(declare-fun array_inv!700 (array!2075) Bool)

(assert (=> start!4172 (array_inv!700 _keys!1833)))

(assert (=> start!4172 tp_is_empty!1441))

(declare-fun b!31627 () Bool)

(declare-fun res!19172 () Bool)

(assert (=> b!31627 (=> (not res!19172) (not e!20175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31627 (= res!19172 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4172 res!19173) b!31626))

(assert (= (and b!31626 res!19175) b!31624))

(assert (= (and b!31624 res!19177) b!31625))

(assert (= (and b!31625 res!19171) b!31627))

(assert (= (and b!31627 res!19172) b!31623))

(assert (= (and b!31623 res!19176) b!31628))

(assert (= (and b!31628 res!19174) b!31632))

(assert (= (and b!31629 condMapEmpty!1690) mapIsEmpty!1690))

(assert (= (and b!31629 (not condMapEmpty!1690)) mapNonEmpty!1690))

(get-info :version)

(assert (= (and mapNonEmpty!1690 ((_ is ValueCellFull!521) mapValue!1690)) b!31631))

(assert (= (and b!31629 ((_ is ValueCellFull!521) mapDefault!1690)) b!31630))

(assert (= start!4172 b!31629))

(declare-fun m!25323 () Bool)

(assert (=> b!31628 m!25323))

(declare-fun m!25325 () Bool)

(assert (=> b!31623 m!25325))

(assert (=> b!31623 m!25325))

(declare-fun m!25327 () Bool)

(assert (=> b!31623 m!25327))

(declare-fun m!25329 () Bool)

(assert (=> b!31632 m!25329))

(declare-fun m!25331 () Bool)

(assert (=> b!31625 m!25331))

(declare-fun m!25333 () Bool)

(assert (=> mapNonEmpty!1690 m!25333))

(declare-fun m!25335 () Bool)

(assert (=> b!31624 m!25335))

(declare-fun m!25337 () Bool)

(assert (=> b!31627 m!25337))

(declare-fun m!25339 () Bool)

(assert (=> start!4172 m!25339))

(declare-fun m!25341 () Bool)

(assert (=> start!4172 m!25341))

(declare-fun m!25343 () Bool)

(assert (=> start!4172 m!25343))

(check-sat (not b!31632) (not mapNonEmpty!1690) (not b!31625) (not b!31624) (not b!31623) (not b!31628) (not start!4172) tp_is_empty!1441 b_and!1891 (not b_next!1087) (not b!31627))
(check-sat b_and!1891 (not b_next!1087))
