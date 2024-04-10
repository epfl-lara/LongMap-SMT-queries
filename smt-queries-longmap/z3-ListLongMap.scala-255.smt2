; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4214 () Bool)

(assert start!4214)

(declare-fun b_free!1119 () Bool)

(declare-fun b_next!1119 () Bool)

(assert (=> start!4214 (= b_free!1119 (not b_next!1119))))

(declare-fun tp!4776 () Bool)

(declare-fun b_and!1929 () Bool)

(assert (=> start!4214 (= tp!4776 b_and!1929)))

(declare-fun b!32157 () Bool)

(declare-fun res!19542 () Bool)

(declare-fun e!20455 () Bool)

(assert (=> b!32157 (=> (not res!19542) (not e!20455))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1789 0))(
  ( (V!1790 (val!763 Int)) )
))
(declare-datatypes ((ValueCell!537 0))(
  ( (ValueCellFull!537 (v!1852 V!1789)) (EmptyCell!537) )
))
(declare-datatypes ((array!2155 0))(
  ( (array!2156 (arr!1031 (Array (_ BitVec 32) ValueCell!537)) (size!1132 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2155)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2157 0))(
  ( (array!2158 (arr!1032 (Array (_ BitVec 32) (_ BitVec 64))) (size!1133 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2157)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1789)

(declare-fun minValue!1443 () V!1789)

(declare-datatypes ((tuple2!1238 0))(
  ( (tuple2!1239 (_1!630 (_ BitVec 64)) (_2!630 V!1789)) )
))
(declare-datatypes ((List!832 0))(
  ( (Nil!829) (Cons!828 (h!1395 tuple2!1238) (t!3525 List!832)) )
))
(declare-datatypes ((ListLongMap!815 0))(
  ( (ListLongMap!816 (toList!423 List!832)) )
))
(declare-fun contains!363 (ListLongMap!815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!251 (array!2157 array!2155 (_ BitVec 32) (_ BitVec 32) V!1789 V!1789 (_ BitVec 32) Int) ListLongMap!815)

(assert (=> b!32157 (= res!19542 (not (contains!363 (getCurrentListMap!251 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!19541 () Bool)

(assert (=> start!4214 (=> (not res!19541) (not e!20455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4214 (= res!19541 (validMask!0 mask!2294))))

(assert (=> start!4214 e!20455))

(assert (=> start!4214 true))

(assert (=> start!4214 tp!4776))

(declare-fun e!20458 () Bool)

(declare-fun array_inv!721 (array!2155) Bool)

(assert (=> start!4214 (and (array_inv!721 _values!1501) e!20458)))

(declare-fun array_inv!722 (array!2157) Bool)

(assert (=> start!4214 (array_inv!722 _keys!1833)))

(declare-fun tp_is_empty!1473 () Bool)

(assert (=> start!4214 tp_is_empty!1473))

(declare-fun b!32158 () Bool)

(declare-fun res!19545 () Bool)

(assert (=> b!32158 (=> (not res!19545) (not e!20455))))

(declare-datatypes ((List!833 0))(
  ( (Nil!830) (Cons!829 (h!1396 (_ BitVec 64)) (t!3526 List!833)) )
))
(declare-fun arrayNoDuplicates!0 (array!2157 (_ BitVec 32) List!833) Bool)

(assert (=> b!32158 (= res!19545 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!830))))

(declare-fun mapNonEmpty!1738 () Bool)

(declare-fun mapRes!1738 () Bool)

(declare-fun tp!4777 () Bool)

(declare-fun e!20457 () Bool)

(assert (=> mapNonEmpty!1738 (= mapRes!1738 (and tp!4777 e!20457))))

(declare-fun mapKey!1738 () (_ BitVec 32))

(declare-fun mapValue!1738 () ValueCell!537)

(declare-fun mapRest!1738 () (Array (_ BitVec 32) ValueCell!537))

(assert (=> mapNonEmpty!1738 (= (arr!1031 _values!1501) (store mapRest!1738 mapKey!1738 mapValue!1738))))

(declare-fun b!32159 () Bool)

(declare-fun res!19539 () Bool)

(assert (=> b!32159 (=> (not res!19539) (not e!20455))))

(assert (=> b!32159 (= res!19539 (and (= (size!1132 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1133 _keys!1833) (size!1132 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32160 () Bool)

(declare-fun res!19543 () Bool)

(assert (=> b!32160 (=> (not res!19543) (not e!20455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32160 (= res!19543 (validKeyInArray!0 k0!1304))))

(declare-fun b!32161 () Bool)

(declare-fun res!19544 () Bool)

(assert (=> b!32161 (=> (not res!19544) (not e!20455))))

(declare-fun arrayContainsKey!0 (array!2157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32161 (= res!19544 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32162 () Bool)

(declare-fun e!20456 () Bool)

(assert (=> b!32162 (= e!20456 tp_is_empty!1473)))

(declare-fun b!32163 () Bool)

(declare-fun res!19540 () Bool)

(assert (=> b!32163 (=> (not res!19540) (not e!20455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2157 (_ BitVec 32)) Bool)

(assert (=> b!32163 (= res!19540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32164 () Bool)

(assert (=> b!32164 (= e!20458 (and e!20456 mapRes!1738))))

(declare-fun condMapEmpty!1738 () Bool)

(declare-fun mapDefault!1738 () ValueCell!537)

(assert (=> b!32164 (= condMapEmpty!1738 (= (arr!1031 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!537)) mapDefault!1738)))))

(declare-fun mapIsEmpty!1738 () Bool)

(assert (=> mapIsEmpty!1738 mapRes!1738))

(declare-fun b!32165 () Bool)

(assert (=> b!32165 (= e!20457 tp_is_empty!1473)))

(declare-fun b!32166 () Bool)

(assert (=> b!32166 (= e!20455 false)))

(declare-fun lt!11639 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2157 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32166 (= lt!11639 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4214 res!19541) b!32159))

(assert (= (and b!32159 res!19539) b!32163))

(assert (= (and b!32163 res!19540) b!32158))

(assert (= (and b!32158 res!19545) b!32160))

(assert (= (and b!32160 res!19543) b!32157))

(assert (= (and b!32157 res!19542) b!32161))

(assert (= (and b!32161 res!19544) b!32166))

(assert (= (and b!32164 condMapEmpty!1738) mapIsEmpty!1738))

(assert (= (and b!32164 (not condMapEmpty!1738)) mapNonEmpty!1738))

(get-info :version)

(assert (= (and mapNonEmpty!1738 ((_ is ValueCellFull!537) mapValue!1738)) b!32165))

(assert (= (and b!32164 ((_ is ValueCellFull!537) mapDefault!1738)) b!32162))

(assert (= start!4214 b!32164))

(declare-fun m!25745 () Bool)

(assert (=> b!32157 m!25745))

(assert (=> b!32157 m!25745))

(declare-fun m!25747 () Bool)

(assert (=> b!32157 m!25747))

(declare-fun m!25749 () Bool)

(assert (=> b!32160 m!25749))

(declare-fun m!25751 () Bool)

(assert (=> b!32163 m!25751))

(declare-fun m!25753 () Bool)

(assert (=> b!32166 m!25753))

(declare-fun m!25755 () Bool)

(assert (=> mapNonEmpty!1738 m!25755))

(declare-fun m!25757 () Bool)

(assert (=> b!32158 m!25757))

(declare-fun m!25759 () Bool)

(assert (=> start!4214 m!25759))

(declare-fun m!25761 () Bool)

(assert (=> start!4214 m!25761))

(declare-fun m!25763 () Bool)

(assert (=> start!4214 m!25763))

(declare-fun m!25765 () Bool)

(assert (=> b!32161 m!25765))

(check-sat tp_is_empty!1473 (not b!32166) (not b!32163) (not start!4214) (not b!32160) (not mapNonEmpty!1738) (not b!32158) b_and!1929 (not b!32161) (not b_next!1119) (not b!32157))
(check-sat b_and!1929 (not b_next!1119))
