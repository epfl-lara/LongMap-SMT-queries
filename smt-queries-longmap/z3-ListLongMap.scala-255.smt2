; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4202 () Bool)

(assert start!4202)

(declare-fun b_free!1117 () Bool)

(declare-fun b_next!1117 () Bool)

(assert (=> start!4202 (= b_free!1117 (not b_next!1117))))

(declare-fun tp!4771 () Bool)

(declare-fun b_and!1921 () Bool)

(assert (=> start!4202 (= tp!4771 b_and!1921)))

(declare-fun b!32073 () Bool)

(declare-fun res!19488 () Bool)

(declare-fun e!20397 () Bool)

(assert (=> b!32073 (=> (not res!19488) (not e!20397))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32073 (= res!19488 (validKeyInArray!0 k0!1304))))

(declare-fun b!32074 () Bool)

(assert (=> b!32074 (= e!20397 false)))

(declare-fun lt!11632 () (_ BitVec 32))

(declare-datatypes ((array!2125 0))(
  ( (array!2126 (arr!1016 (Array (_ BitVec 32) (_ BitVec 64))) (size!1117 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2125)

(declare-fun arrayScanForKey!0 (array!2125 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32074 (= lt!11632 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32075 () Bool)

(declare-fun res!19492 () Bool)

(assert (=> b!32075 (=> (not res!19492) (not e!20397))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1787 0))(
  ( (V!1788 (val!762 Int)) )
))
(declare-datatypes ((ValueCell!536 0))(
  ( (ValueCellFull!536 (v!1850 V!1787)) (EmptyCell!536) )
))
(declare-datatypes ((array!2127 0))(
  ( (array!2128 (arr!1017 (Array (_ BitVec 32) ValueCell!536)) (size!1118 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2127)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1787)

(declare-fun minValue!1443 () V!1787)

(declare-datatypes ((tuple2!1240 0))(
  ( (tuple2!1241 (_1!631 (_ BitVec 64)) (_2!631 V!1787)) )
))
(declare-datatypes ((List!823 0))(
  ( (Nil!820) (Cons!819 (h!1386 tuple2!1240) (t!3509 List!823)) )
))
(declare-datatypes ((ListLongMap!805 0))(
  ( (ListLongMap!806 (toList!418 List!823)) )
))
(declare-fun contains!359 (ListLongMap!805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!241 (array!2125 array!2127 (_ BitVec 32) (_ BitVec 32) V!1787 V!1787 (_ BitVec 32) Int) ListLongMap!805)

(assert (=> b!32075 (= res!19492 (not (contains!359 (getCurrentListMap!241 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32077 () Bool)

(declare-fun res!19490 () Bool)

(assert (=> b!32077 (=> (not res!19490) (not e!20397))))

(declare-fun arrayContainsKey!0 (array!2125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32077 (= res!19490 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32078 () Bool)

(declare-fun res!19487 () Bool)

(assert (=> b!32078 (=> (not res!19487) (not e!20397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2125 (_ BitVec 32)) Bool)

(assert (=> b!32078 (= res!19487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32079 () Bool)

(declare-fun res!19489 () Bool)

(assert (=> b!32079 (=> (not res!19489) (not e!20397))))

(assert (=> b!32079 (= res!19489 (and (= (size!1118 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1117 _keys!1833) (size!1118 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32076 () Bool)

(declare-fun res!19486 () Bool)

(assert (=> b!32076 (=> (not res!19486) (not e!20397))))

(declare-datatypes ((List!824 0))(
  ( (Nil!821) (Cons!820 (h!1387 (_ BitVec 64)) (t!3510 List!824)) )
))
(declare-fun arrayNoDuplicates!0 (array!2125 (_ BitVec 32) List!824) Bool)

(assert (=> b!32076 (= res!19486 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!821))))

(declare-fun res!19491 () Bool)

(assert (=> start!4202 (=> (not res!19491) (not e!20397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4202 (= res!19491 (validMask!0 mask!2294))))

(assert (=> start!4202 e!20397))

(assert (=> start!4202 true))

(assert (=> start!4202 tp!4771))

(declare-fun e!20400 () Bool)

(declare-fun array_inv!717 (array!2127) Bool)

(assert (=> start!4202 (and (array_inv!717 _values!1501) e!20400)))

(declare-fun array_inv!718 (array!2125) Bool)

(assert (=> start!4202 (array_inv!718 _keys!1833)))

(declare-fun tp_is_empty!1471 () Bool)

(assert (=> start!4202 tp_is_empty!1471))

(declare-fun b!32080 () Bool)

(declare-fun e!20398 () Bool)

(declare-fun mapRes!1735 () Bool)

(assert (=> b!32080 (= e!20400 (and e!20398 mapRes!1735))))

(declare-fun condMapEmpty!1735 () Bool)

(declare-fun mapDefault!1735 () ValueCell!536)

(assert (=> b!32080 (= condMapEmpty!1735 (= (arr!1017 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!536)) mapDefault!1735)))))

(declare-fun b!32081 () Bool)

(assert (=> b!32081 (= e!20398 tp_is_empty!1471)))

(declare-fun mapNonEmpty!1735 () Bool)

(declare-fun tp!4770 () Bool)

(declare-fun e!20401 () Bool)

(assert (=> mapNonEmpty!1735 (= mapRes!1735 (and tp!4770 e!20401))))

(declare-fun mapValue!1735 () ValueCell!536)

(declare-fun mapKey!1735 () (_ BitVec 32))

(declare-fun mapRest!1735 () (Array (_ BitVec 32) ValueCell!536))

(assert (=> mapNonEmpty!1735 (= (arr!1017 _values!1501) (store mapRest!1735 mapKey!1735 mapValue!1735))))

(declare-fun mapIsEmpty!1735 () Bool)

(assert (=> mapIsEmpty!1735 mapRes!1735))

(declare-fun b!32082 () Bool)

(assert (=> b!32082 (= e!20401 tp_is_empty!1471)))

(assert (= (and start!4202 res!19491) b!32079))

(assert (= (and b!32079 res!19489) b!32078))

(assert (= (and b!32078 res!19487) b!32076))

(assert (= (and b!32076 res!19486) b!32073))

(assert (= (and b!32073 res!19488) b!32075))

(assert (= (and b!32075 res!19492) b!32077))

(assert (= (and b!32077 res!19490) b!32074))

(assert (= (and b!32080 condMapEmpty!1735) mapIsEmpty!1735))

(assert (= (and b!32080 (not condMapEmpty!1735)) mapNonEmpty!1735))

(get-info :version)

(assert (= (and mapNonEmpty!1735 ((_ is ValueCellFull!536) mapValue!1735)) b!32082))

(assert (= (and b!32080 ((_ is ValueCellFull!536) mapDefault!1735)) b!32081))

(assert (= start!4202 b!32080))

(declare-fun m!25653 () Bool)

(assert (=> b!32078 m!25653))

(declare-fun m!25655 () Bool)

(assert (=> b!32074 m!25655))

(declare-fun m!25657 () Bool)

(assert (=> b!32073 m!25657))

(declare-fun m!25659 () Bool)

(assert (=> b!32075 m!25659))

(assert (=> b!32075 m!25659))

(declare-fun m!25661 () Bool)

(assert (=> b!32075 m!25661))

(declare-fun m!25663 () Bool)

(assert (=> start!4202 m!25663))

(declare-fun m!25665 () Bool)

(assert (=> start!4202 m!25665))

(declare-fun m!25667 () Bool)

(assert (=> start!4202 m!25667))

(declare-fun m!25669 () Bool)

(assert (=> b!32077 m!25669))

(declare-fun m!25671 () Bool)

(assert (=> b!32076 m!25671))

(declare-fun m!25673 () Bool)

(assert (=> mapNonEmpty!1735 m!25673))

(check-sat b_and!1921 (not b_next!1117) (not start!4202) (not b!32078) (not b!32077) (not b!32076) (not b!32073) (not mapNonEmpty!1735) tp_is_empty!1471 (not b!32075) (not b!32074))
(check-sat b_and!1921 (not b_next!1117))
