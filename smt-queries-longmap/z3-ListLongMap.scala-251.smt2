; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4184 () Bool)

(assert start!4184)

(declare-fun b_free!1093 () Bool)

(declare-fun b_next!1093 () Bool)

(assert (=> start!4184 (= b_free!1093 (not b_next!1093))))

(declare-fun tp!4698 () Bool)

(declare-fun b_and!1893 () Bool)

(assert (=> start!4184 (= tp!4698 b_and!1893)))

(declare-fun b!31695 () Bool)

(declare-fun e!20209 () Bool)

(declare-fun e!20210 () Bool)

(declare-fun mapRes!1699 () Bool)

(assert (=> b!31695 (= e!20209 (and e!20210 mapRes!1699))))

(declare-fun condMapEmpty!1699 () Bool)

(declare-datatypes ((V!1755 0))(
  ( (V!1756 (val!750 Int)) )
))
(declare-datatypes ((ValueCell!524 0))(
  ( (ValueCellFull!524 (v!1839 V!1755)) (EmptyCell!524) )
))
(declare-datatypes ((array!2093 0))(
  ( (array!2094 (arr!1000 (Array (_ BitVec 32) ValueCell!524)) (size!1101 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2093)

(declare-fun mapDefault!1699 () ValueCell!524)

(assert (=> b!31695 (= condMapEmpty!1699 (= (arr!1000 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!524)) mapDefault!1699)))))

(declare-fun b!31696 () Bool)

(declare-fun res!19227 () Bool)

(declare-fun e!20211 () Bool)

(assert (=> b!31696 (=> (not res!19227) (not e!20211))))

(declare-datatypes ((array!2095 0))(
  ( (array!2096 (arr!1001 (Array (_ BitVec 32) (_ BitVec 64))) (size!1102 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2095)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31696 (= res!19227 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31697 () Bool)

(assert (=> b!31697 (= e!20211 false)))

(declare-fun lt!11556 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2095 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31697 (= lt!11556 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31698 () Bool)

(declare-fun res!19231 () Bool)

(assert (=> b!31698 (=> (not res!19231) (not e!20211))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1755)

(declare-fun minValue!1443 () V!1755)

(declare-datatypes ((tuple2!1216 0))(
  ( (tuple2!1217 (_1!619 (_ BitVec 64)) (_2!619 V!1755)) )
))
(declare-datatypes ((List!812 0))(
  ( (Nil!809) (Cons!808 (h!1375 tuple2!1216) (t!3499 List!812)) )
))
(declare-datatypes ((ListLongMap!787 0))(
  ( (ListLongMap!788 (toList!409 List!812)) )
))
(declare-fun contains!351 (ListLongMap!787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!234 (array!2095 array!2093 (_ BitVec 32) (_ BitVec 32) V!1755 V!1755 (_ BitVec 32) Int) ListLongMap!787)

(assert (=> b!31698 (= res!19231 (not (contains!351 (getCurrentListMap!234 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1699 () Bool)

(assert (=> mapIsEmpty!1699 mapRes!1699))

(declare-fun b!31699 () Bool)

(declare-fun res!19228 () Bool)

(assert (=> b!31699 (=> (not res!19228) (not e!20211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2095 (_ BitVec 32)) Bool)

(assert (=> b!31699 (= res!19228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31700 () Bool)

(declare-fun res!19230 () Bool)

(assert (=> b!31700 (=> (not res!19230) (not e!20211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31700 (= res!19230 (validKeyInArray!0 k0!1304))))

(declare-fun res!19226 () Bool)

(assert (=> start!4184 (=> (not res!19226) (not e!20211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4184 (= res!19226 (validMask!0 mask!2294))))

(assert (=> start!4184 e!20211))

(assert (=> start!4184 true))

(assert (=> start!4184 tp!4698))

(declare-fun array_inv!683 (array!2093) Bool)

(assert (=> start!4184 (and (array_inv!683 _values!1501) e!20209)))

(declare-fun array_inv!684 (array!2095) Bool)

(assert (=> start!4184 (array_inv!684 _keys!1833)))

(declare-fun tp_is_empty!1447 () Bool)

(assert (=> start!4184 tp_is_empty!1447))

(declare-fun b!31701 () Bool)

(declare-fun res!19232 () Bool)

(assert (=> b!31701 (=> (not res!19232) (not e!20211))))

(assert (=> b!31701 (= res!19232 (and (= (size!1101 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1102 _keys!1833) (size!1101 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31702 () Bool)

(declare-fun e!20208 () Bool)

(assert (=> b!31702 (= e!20208 tp_is_empty!1447)))

(declare-fun mapNonEmpty!1699 () Bool)

(declare-fun tp!4699 () Bool)

(assert (=> mapNonEmpty!1699 (= mapRes!1699 (and tp!4699 e!20208))))

(declare-fun mapKey!1699 () (_ BitVec 32))

(declare-fun mapValue!1699 () ValueCell!524)

(declare-fun mapRest!1699 () (Array (_ BitVec 32) ValueCell!524))

(assert (=> mapNonEmpty!1699 (= (arr!1000 _values!1501) (store mapRest!1699 mapKey!1699 mapValue!1699))))

(declare-fun b!31703 () Bool)

(assert (=> b!31703 (= e!20210 tp_is_empty!1447)))

(declare-fun b!31704 () Bool)

(declare-fun res!19229 () Bool)

(assert (=> b!31704 (=> (not res!19229) (not e!20211))))

(declare-datatypes ((List!813 0))(
  ( (Nil!810) (Cons!809 (h!1376 (_ BitVec 64)) (t!3500 List!813)) )
))
(declare-fun arrayNoDuplicates!0 (array!2095 (_ BitVec 32) List!813) Bool)

(assert (=> b!31704 (= res!19229 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!810))))

(assert (= (and start!4184 res!19226) b!31701))

(assert (= (and b!31701 res!19232) b!31699))

(assert (= (and b!31699 res!19228) b!31704))

(assert (= (and b!31704 res!19229) b!31700))

(assert (= (and b!31700 res!19230) b!31698))

(assert (= (and b!31698 res!19231) b!31696))

(assert (= (and b!31696 res!19227) b!31697))

(assert (= (and b!31695 condMapEmpty!1699) mapIsEmpty!1699))

(assert (= (and b!31695 (not condMapEmpty!1699)) mapNonEmpty!1699))

(get-info :version)

(assert (= (and mapNonEmpty!1699 ((_ is ValueCellFull!524) mapValue!1699)) b!31702))

(assert (= (and b!31695 ((_ is ValueCellFull!524) mapDefault!1699)) b!31703))

(assert (= start!4184 b!31695))

(declare-fun m!25307 () Bool)

(assert (=> b!31699 m!25307))

(declare-fun m!25309 () Bool)

(assert (=> b!31700 m!25309))

(declare-fun m!25311 () Bool)

(assert (=> b!31704 m!25311))

(declare-fun m!25313 () Bool)

(assert (=> b!31698 m!25313))

(assert (=> b!31698 m!25313))

(declare-fun m!25315 () Bool)

(assert (=> b!31698 m!25315))

(declare-fun m!25317 () Bool)

(assert (=> start!4184 m!25317))

(declare-fun m!25319 () Bool)

(assert (=> start!4184 m!25319))

(declare-fun m!25321 () Bool)

(assert (=> start!4184 m!25321))

(declare-fun m!25323 () Bool)

(assert (=> b!31696 m!25323))

(declare-fun m!25325 () Bool)

(assert (=> b!31697 m!25325))

(declare-fun m!25327 () Bool)

(assert (=> mapNonEmpty!1699 m!25327))

(check-sat (not start!4184) (not b!31699) (not b!31697) (not b!31704) (not b!31700) (not b!31696) tp_is_empty!1447 (not b!31698) (not mapNonEmpty!1699) b_and!1893 (not b_next!1093))
(check-sat b_and!1893 (not b_next!1093))
