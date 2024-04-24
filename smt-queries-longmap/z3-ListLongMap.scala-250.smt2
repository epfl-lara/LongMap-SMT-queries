; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4178 () Bool)

(assert start!4178)

(declare-fun b_free!1087 () Bool)

(declare-fun b_next!1087 () Bool)

(assert (=> start!4178 (= b_free!1087 (not b_next!1087))))

(declare-fun tp!4681 () Bool)

(declare-fun b_and!1887 () Bool)

(assert (=> start!4178 (= tp!4681 b_and!1887)))

(declare-fun b!31605 () Bool)

(declare-fun e!20167 () Bool)

(declare-fun tp_is_empty!1441 () Bool)

(assert (=> b!31605 (= e!20167 tp_is_empty!1441)))

(declare-fun b!31606 () Bool)

(declare-fun res!19164 () Bool)

(declare-fun e!20166 () Bool)

(assert (=> b!31606 (=> (not res!19164) (not e!20166))))

(declare-datatypes ((array!2083 0))(
  ( (array!2084 (arr!995 (Array (_ BitVec 32) (_ BitVec 64))) (size!1096 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2083)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31606 (= res!19164 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!19167 () Bool)

(assert (=> start!4178 (=> (not res!19167) (not e!20166))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4178 (= res!19167 (validMask!0 mask!2294))))

(assert (=> start!4178 e!20166))

(assert (=> start!4178 true))

(assert (=> start!4178 tp!4681))

(declare-datatypes ((V!1747 0))(
  ( (V!1748 (val!747 Int)) )
))
(declare-datatypes ((ValueCell!521 0))(
  ( (ValueCellFull!521 (v!1836 V!1747)) (EmptyCell!521) )
))
(declare-datatypes ((array!2085 0))(
  ( (array!2086 (arr!996 (Array (_ BitVec 32) ValueCell!521)) (size!1097 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2085)

(declare-fun e!20164 () Bool)

(declare-fun array_inv!681 (array!2085) Bool)

(assert (=> start!4178 (and (array_inv!681 _values!1501) e!20164)))

(declare-fun array_inv!682 (array!2083) Bool)

(assert (=> start!4178 (array_inv!682 _keys!1833)))

(assert (=> start!4178 tp_is_empty!1441))

(declare-fun b!31607 () Bool)

(assert (=> b!31607 (= e!20166 false)))

(declare-fun lt!11547 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2083 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31607 (= lt!11547 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31608 () Bool)

(declare-fun res!19168 () Bool)

(assert (=> b!31608 (=> (not res!19168) (not e!20166))))

(declare-datatypes ((List!809 0))(
  ( (Nil!806) (Cons!805 (h!1372 (_ BitVec 64)) (t!3496 List!809)) )
))
(declare-fun arrayNoDuplicates!0 (array!2083 (_ BitVec 32) List!809) Bool)

(assert (=> b!31608 (= res!19168 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!806))))

(declare-fun mapNonEmpty!1690 () Bool)

(declare-fun mapRes!1690 () Bool)

(declare-fun tp!4680 () Bool)

(assert (=> mapNonEmpty!1690 (= mapRes!1690 (and tp!4680 e!20167))))

(declare-fun mapKey!1690 () (_ BitVec 32))

(declare-fun mapRest!1690 () (Array (_ BitVec 32) ValueCell!521))

(declare-fun mapValue!1690 () ValueCell!521)

(assert (=> mapNonEmpty!1690 (= (arr!996 _values!1501) (store mapRest!1690 mapKey!1690 mapValue!1690))))

(declare-fun mapIsEmpty!1690 () Bool)

(assert (=> mapIsEmpty!1690 mapRes!1690))

(declare-fun b!31609 () Bool)

(declare-fun res!19166 () Bool)

(assert (=> b!31609 (=> (not res!19166) (not e!20166))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31609 (= res!19166 (and (= (size!1097 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1096 _keys!1833) (size!1097 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31610 () Bool)

(declare-fun res!19165 () Bool)

(assert (=> b!31610 (=> (not res!19165) (not e!20166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31610 (= res!19165 (validKeyInArray!0 k0!1304))))

(declare-fun b!31611 () Bool)

(declare-fun e!20163 () Bool)

(assert (=> b!31611 (= e!20164 (and e!20163 mapRes!1690))))

(declare-fun condMapEmpty!1690 () Bool)

(declare-fun mapDefault!1690 () ValueCell!521)

(assert (=> b!31611 (= condMapEmpty!1690 (= (arr!996 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!521)) mapDefault!1690)))))

(declare-fun b!31612 () Bool)

(declare-fun res!19169 () Bool)

(assert (=> b!31612 (=> (not res!19169) (not e!20166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2083 (_ BitVec 32)) Bool)

(assert (=> b!31612 (= res!19169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31613 () Bool)

(declare-fun res!19163 () Bool)

(assert (=> b!31613 (=> (not res!19163) (not e!20166))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1747)

(declare-fun minValue!1443 () V!1747)

(declare-datatypes ((tuple2!1214 0))(
  ( (tuple2!1215 (_1!618 (_ BitVec 64)) (_2!618 V!1747)) )
))
(declare-datatypes ((List!810 0))(
  ( (Nil!807) (Cons!806 (h!1373 tuple2!1214) (t!3497 List!810)) )
))
(declare-datatypes ((ListLongMap!785 0))(
  ( (ListLongMap!786 (toList!408 List!810)) )
))
(declare-fun contains!350 (ListLongMap!785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!233 (array!2083 array!2085 (_ BitVec 32) (_ BitVec 32) V!1747 V!1747 (_ BitVec 32) Int) ListLongMap!785)

(assert (=> b!31613 (= res!19163 (not (contains!350 (getCurrentListMap!233 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31614 () Bool)

(assert (=> b!31614 (= e!20163 tp_is_empty!1441)))

(assert (= (and start!4178 res!19167) b!31609))

(assert (= (and b!31609 res!19166) b!31612))

(assert (= (and b!31612 res!19169) b!31608))

(assert (= (and b!31608 res!19168) b!31610))

(assert (= (and b!31610 res!19165) b!31613))

(assert (= (and b!31613 res!19163) b!31606))

(assert (= (and b!31606 res!19164) b!31607))

(assert (= (and b!31611 condMapEmpty!1690) mapIsEmpty!1690))

(assert (= (and b!31611 (not condMapEmpty!1690)) mapNonEmpty!1690))

(get-info :version)

(assert (= (and mapNonEmpty!1690 ((_ is ValueCellFull!521) mapValue!1690)) b!31605))

(assert (= (and b!31611 ((_ is ValueCellFull!521) mapDefault!1690)) b!31614))

(assert (= start!4178 b!31611))

(declare-fun m!25241 () Bool)

(assert (=> b!31613 m!25241))

(assert (=> b!31613 m!25241))

(declare-fun m!25243 () Bool)

(assert (=> b!31613 m!25243))

(declare-fun m!25245 () Bool)

(assert (=> b!31610 m!25245))

(declare-fun m!25247 () Bool)

(assert (=> b!31608 m!25247))

(declare-fun m!25249 () Bool)

(assert (=> mapNonEmpty!1690 m!25249))

(declare-fun m!25251 () Bool)

(assert (=> start!4178 m!25251))

(declare-fun m!25253 () Bool)

(assert (=> start!4178 m!25253))

(declare-fun m!25255 () Bool)

(assert (=> start!4178 m!25255))

(declare-fun m!25257 () Bool)

(assert (=> b!31607 m!25257))

(declare-fun m!25259 () Bool)

(assert (=> b!31612 m!25259))

(declare-fun m!25261 () Bool)

(assert (=> b!31606 m!25261))

(check-sat (not b!31613) (not mapNonEmpty!1690) (not b!31612) (not b!31606) (not b!31608) b_and!1887 (not b!31607) (not b!31610) (not start!4178) tp_is_empty!1441 (not b_next!1087))
(check-sat b_and!1887 (not b_next!1087))
