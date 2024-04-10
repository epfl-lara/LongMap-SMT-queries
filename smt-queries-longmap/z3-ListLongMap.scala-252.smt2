; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4196 () Bool)

(assert start!4196)

(declare-fun b_free!1101 () Bool)

(declare-fun b_next!1101 () Bool)

(assert (=> start!4196 (= b_free!1101 (not b_next!1101))))

(declare-fun tp!4722 () Bool)

(declare-fun b_and!1911 () Bool)

(assert (=> start!4196 (= tp!4722 b_and!1911)))

(declare-fun b!31887 () Bool)

(declare-fun res!19352 () Bool)

(declare-fun e!20324 () Bool)

(assert (=> b!31887 (=> (not res!19352) (not e!20324))))

(declare-datatypes ((V!1765 0))(
  ( (V!1766 (val!754 Int)) )
))
(declare-datatypes ((ValueCell!528 0))(
  ( (ValueCellFull!528 (v!1843 V!1765)) (EmptyCell!528) )
))
(declare-datatypes ((array!2125 0))(
  ( (array!2126 (arr!1016 (Array (_ BitVec 32) ValueCell!528)) (size!1117 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2125)

(declare-datatypes ((array!2127 0))(
  ( (array!2128 (arr!1017 (Array (_ BitVec 32) (_ BitVec 64))) (size!1118 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2127)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31887 (= res!19352 (and (= (size!1117 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1118 _keys!1833) (size!1117 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19351 () Bool)

(assert (=> start!4196 (=> (not res!19351) (not e!20324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4196 (= res!19351 (validMask!0 mask!2294))))

(assert (=> start!4196 e!20324))

(assert (=> start!4196 true))

(assert (=> start!4196 tp!4722))

(declare-fun e!20321 () Bool)

(declare-fun array_inv!709 (array!2125) Bool)

(assert (=> start!4196 (and (array_inv!709 _values!1501) e!20321)))

(declare-fun array_inv!710 (array!2127) Bool)

(assert (=> start!4196 (array_inv!710 _keys!1833)))

(declare-fun tp_is_empty!1455 () Bool)

(assert (=> start!4196 tp_is_empty!1455))

(declare-fun b!31888 () Bool)

(declare-fun e!20323 () Bool)

(assert (=> b!31888 (= e!20323 tp_is_empty!1455)))

(declare-fun b!31889 () Bool)

(declare-fun res!19355 () Bool)

(assert (=> b!31889 (=> (not res!19355) (not e!20324))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1765)

(declare-fun minValue!1443 () V!1765)

(declare-datatypes ((tuple2!1228 0))(
  ( (tuple2!1229 (_1!625 (_ BitVec 64)) (_2!625 V!1765)) )
))
(declare-datatypes ((List!821 0))(
  ( (Nil!818) (Cons!817 (h!1384 tuple2!1228) (t!3514 List!821)) )
))
(declare-datatypes ((ListLongMap!805 0))(
  ( (ListLongMap!806 (toList!418 List!821)) )
))
(declare-fun contains!358 (ListLongMap!805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!246 (array!2127 array!2125 (_ BitVec 32) (_ BitVec 32) V!1765 V!1765 (_ BitVec 32) Int) ListLongMap!805)

(assert (=> b!31889 (= res!19355 (not (contains!358 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31890 () Bool)

(declare-fun res!19353 () Bool)

(assert (=> b!31890 (=> (not res!19353) (not e!20324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31890 (= res!19353 (validKeyInArray!0 k0!1304))))

(declare-fun b!31891 () Bool)

(declare-fun mapRes!1711 () Bool)

(assert (=> b!31891 (= e!20321 (and e!20323 mapRes!1711))))

(declare-fun condMapEmpty!1711 () Bool)

(declare-fun mapDefault!1711 () ValueCell!528)

(assert (=> b!31891 (= condMapEmpty!1711 (= (arr!1016 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!528)) mapDefault!1711)))))

(declare-fun b!31892 () Bool)

(declare-fun e!20320 () Bool)

(assert (=> b!31892 (= e!20320 tp_is_empty!1455)))

(declare-fun b!31893 () Bool)

(assert (=> b!31893 (= e!20324 false)))

(declare-fun lt!11612 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2127 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31893 (= lt!11612 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31894 () Bool)

(declare-fun res!19354 () Bool)

(assert (=> b!31894 (=> (not res!19354) (not e!20324))))

(declare-fun arrayContainsKey!0 (array!2127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31894 (= res!19354 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31895 () Bool)

(declare-fun res!19350 () Bool)

(assert (=> b!31895 (=> (not res!19350) (not e!20324))))

(declare-datatypes ((List!822 0))(
  ( (Nil!819) (Cons!818 (h!1385 (_ BitVec 64)) (t!3515 List!822)) )
))
(declare-fun arrayNoDuplicates!0 (array!2127 (_ BitVec 32) List!822) Bool)

(assert (=> b!31895 (= res!19350 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!819))))

(declare-fun mapNonEmpty!1711 () Bool)

(declare-fun tp!4723 () Bool)

(assert (=> mapNonEmpty!1711 (= mapRes!1711 (and tp!4723 e!20320))))

(declare-fun mapValue!1711 () ValueCell!528)

(declare-fun mapRest!1711 () (Array (_ BitVec 32) ValueCell!528))

(declare-fun mapKey!1711 () (_ BitVec 32))

(assert (=> mapNonEmpty!1711 (= (arr!1016 _values!1501) (store mapRest!1711 mapKey!1711 mapValue!1711))))

(declare-fun b!31896 () Bool)

(declare-fun res!19356 () Bool)

(assert (=> b!31896 (=> (not res!19356) (not e!20324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2127 (_ BitVec 32)) Bool)

(assert (=> b!31896 (= res!19356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1711 () Bool)

(assert (=> mapIsEmpty!1711 mapRes!1711))

(assert (= (and start!4196 res!19351) b!31887))

(assert (= (and b!31887 res!19352) b!31896))

(assert (= (and b!31896 res!19356) b!31895))

(assert (= (and b!31895 res!19350) b!31890))

(assert (= (and b!31890 res!19353) b!31889))

(assert (= (and b!31889 res!19355) b!31894))

(assert (= (and b!31894 res!19354) b!31893))

(assert (= (and b!31891 condMapEmpty!1711) mapIsEmpty!1711))

(assert (= (and b!31891 (not condMapEmpty!1711)) mapNonEmpty!1711))

(get-info :version)

(assert (= (and mapNonEmpty!1711 ((_ is ValueCellFull!528) mapValue!1711)) b!31892))

(assert (= (and b!31891 ((_ is ValueCellFull!528) mapDefault!1711)) b!31888))

(assert (= start!4196 b!31891))

(declare-fun m!25547 () Bool)

(assert (=> b!31893 m!25547))

(declare-fun m!25549 () Bool)

(assert (=> b!31889 m!25549))

(assert (=> b!31889 m!25549))

(declare-fun m!25551 () Bool)

(assert (=> b!31889 m!25551))

(declare-fun m!25553 () Bool)

(assert (=> b!31890 m!25553))

(declare-fun m!25555 () Bool)

(assert (=> b!31894 m!25555))

(declare-fun m!25557 () Bool)

(assert (=> mapNonEmpty!1711 m!25557))

(declare-fun m!25559 () Bool)

(assert (=> b!31895 m!25559))

(declare-fun m!25561 () Bool)

(assert (=> start!4196 m!25561))

(declare-fun m!25563 () Bool)

(assert (=> start!4196 m!25563))

(declare-fun m!25565 () Bool)

(assert (=> start!4196 m!25565))

(declare-fun m!25567 () Bool)

(assert (=> b!31896 m!25567))

(check-sat (not b!31893) tp_is_empty!1455 (not b!31894) (not start!4196) (not b!31895) (not b!31889) b_and!1911 (not b_next!1101) (not b!31890) (not b!31896) (not mapNonEmpty!1711))
(check-sat b_and!1911 (not b_next!1101))
