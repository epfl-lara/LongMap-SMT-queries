; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3914 () Bool)

(assert start!3914)

(declare-fun b_free!823 () Bool)

(declare-fun b_next!823 () Bool)

(assert (=> start!3914 (= b_free!823 (not b_next!823))))

(declare-fun tp!3889 () Bool)

(declare-fun b_and!1623 () Bool)

(assert (=> start!3914 (= tp!3889 b_and!1623)))

(declare-fun b!27654 () Bool)

(declare-fun res!16405 () Bool)

(declare-fun e!17971 () Bool)

(assert (=> b!27654 (=> (not res!16405) (not e!17971))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1395 0))(
  ( (V!1396 (val!615 Int)) )
))
(declare-datatypes ((ValueCell!389 0))(
  ( (ValueCellFull!389 (v!1704 V!1395)) (EmptyCell!389) )
))
(declare-datatypes ((array!1577 0))(
  ( (array!1578 (arr!742 (Array (_ BitVec 32) ValueCell!389)) (size!843 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1577)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1579 0))(
  ( (array!1580 (arr!743 (Array (_ BitVec 32) (_ BitVec 64))) (size!844 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1579)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1395)

(declare-fun minValue!1443 () V!1395)

(declare-datatypes ((tuple2!1030 0))(
  ( (tuple2!1031 (_1!526 (_ BitVec 64)) (_2!526 V!1395)) )
))
(declare-datatypes ((List!623 0))(
  ( (Nil!620) (Cons!619 (h!1186 tuple2!1030) (t!3310 List!623)) )
))
(declare-datatypes ((ListLongMap!601 0))(
  ( (ListLongMap!602 (toList!316 List!623)) )
))
(declare-fun contains!258 (ListLongMap!601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!146 (array!1579 array!1577 (_ BitVec 32) (_ BitVec 32) V!1395 V!1395 (_ BitVec 32) Int) ListLongMap!601)

(assert (=> b!27654 (= res!16405 (not (contains!258 (getCurrentListMap!146 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27655 () Bool)

(declare-fun e!17968 () Bool)

(declare-fun tp_is_empty!1177 () Bool)

(assert (=> b!27655 (= e!17968 tp_is_empty!1177)))

(declare-fun b!27656 () Bool)

(declare-fun res!16403 () Bool)

(assert (=> b!27656 (=> (not res!16403) (not e!17971))))

(declare-datatypes ((List!624 0))(
  ( (Nil!621) (Cons!620 (h!1187 (_ BitVec 64)) (t!3311 List!624)) )
))
(declare-fun arrayNoDuplicates!0 (array!1579 (_ BitVec 32) List!624) Bool)

(assert (=> b!27656 (= res!16403 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!621))))

(declare-fun b!27657 () Bool)

(declare-fun res!16402 () Bool)

(assert (=> b!27657 (=> (not res!16402) (not e!17971))))

(assert (=> b!27657 (= res!16402 (and (= (size!843 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!844 _keys!1833) (size!843 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27658 () Bool)

(declare-fun res!16400 () Bool)

(assert (=> b!27658 (=> (not res!16400) (not e!17971))))

(declare-fun arrayContainsKey!0 (array!1579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27658 (= res!16400 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27659 () Bool)

(assert (=> b!27659 (= e!17971 false)))

(declare-fun lt!10665 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1579 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27659 (= lt!10665 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27660 () Bool)

(declare-fun res!16406 () Bool)

(assert (=> b!27660 (=> (not res!16406) (not e!17971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27660 (= res!16406 (validKeyInArray!0 k0!1304))))

(declare-fun b!27661 () Bool)

(declare-fun res!16401 () Bool)

(assert (=> b!27661 (=> (not res!16401) (not e!17971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1579 (_ BitVec 32)) Bool)

(assert (=> b!27661 (= res!16401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1294 () Bool)

(declare-fun mapRes!1294 () Bool)

(declare-fun tp!3888 () Bool)

(declare-fun e!17970 () Bool)

(assert (=> mapNonEmpty!1294 (= mapRes!1294 (and tp!3888 e!17970))))

(declare-fun mapKey!1294 () (_ BitVec 32))

(declare-fun mapRest!1294 () (Array (_ BitVec 32) ValueCell!389))

(declare-fun mapValue!1294 () ValueCell!389)

(assert (=> mapNonEmpty!1294 (= (arr!742 _values!1501) (store mapRest!1294 mapKey!1294 mapValue!1294))))

(declare-fun mapIsEmpty!1294 () Bool)

(assert (=> mapIsEmpty!1294 mapRes!1294))

(declare-fun res!16404 () Bool)

(assert (=> start!3914 (=> (not res!16404) (not e!17971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3914 (= res!16404 (validMask!0 mask!2294))))

(assert (=> start!3914 e!17971))

(assert (=> start!3914 true))

(assert (=> start!3914 tp!3889))

(declare-fun e!17967 () Bool)

(declare-fun array_inv!517 (array!1577) Bool)

(assert (=> start!3914 (and (array_inv!517 _values!1501) e!17967)))

(declare-fun array_inv!518 (array!1579) Bool)

(assert (=> start!3914 (array_inv!518 _keys!1833)))

(assert (=> start!3914 tp_is_empty!1177))

(declare-fun b!27662 () Bool)

(assert (=> b!27662 (= e!17970 tp_is_empty!1177)))

(declare-fun b!27663 () Bool)

(assert (=> b!27663 (= e!17967 (and e!17968 mapRes!1294))))

(declare-fun condMapEmpty!1294 () Bool)

(declare-fun mapDefault!1294 () ValueCell!389)

(assert (=> b!27663 (= condMapEmpty!1294 (= (arr!742 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!389)) mapDefault!1294)))))

(assert (= (and start!3914 res!16404) b!27657))

(assert (= (and b!27657 res!16402) b!27661))

(assert (= (and b!27661 res!16401) b!27656))

(assert (= (and b!27656 res!16403) b!27660))

(assert (= (and b!27660 res!16406) b!27654))

(assert (= (and b!27654 res!16405) b!27658))

(assert (= (and b!27658 res!16400) b!27659))

(assert (= (and b!27663 condMapEmpty!1294) mapIsEmpty!1294))

(assert (= (and b!27663 (not condMapEmpty!1294)) mapNonEmpty!1294))

(get-info :version)

(assert (= (and mapNonEmpty!1294 ((_ is ValueCellFull!389) mapValue!1294)) b!27662))

(assert (= (and b!27663 ((_ is ValueCellFull!389) mapDefault!1294)) b!27655))

(assert (= start!3914 b!27663))

(declare-fun m!21953 () Bool)

(assert (=> start!3914 m!21953))

(declare-fun m!21955 () Bool)

(assert (=> start!3914 m!21955))

(declare-fun m!21957 () Bool)

(assert (=> start!3914 m!21957))

(declare-fun m!21959 () Bool)

(assert (=> mapNonEmpty!1294 m!21959))

(declare-fun m!21961 () Bool)

(assert (=> b!27660 m!21961))

(declare-fun m!21963 () Bool)

(assert (=> b!27659 m!21963))

(declare-fun m!21965 () Bool)

(assert (=> b!27658 m!21965))

(declare-fun m!21967 () Bool)

(assert (=> b!27654 m!21967))

(assert (=> b!27654 m!21967))

(declare-fun m!21969 () Bool)

(assert (=> b!27654 m!21969))

(declare-fun m!21971 () Bool)

(assert (=> b!27661 m!21971))

(declare-fun m!21973 () Bool)

(assert (=> b!27656 m!21973))

(check-sat (not b!27656) (not b!27660) (not b!27658) (not b!27659) (not b!27654) (not mapNonEmpty!1294) (not start!3914) (not b!27661) (not b_next!823) b_and!1623 tp_is_empty!1177)
(check-sat b_and!1623 (not b_next!823))
