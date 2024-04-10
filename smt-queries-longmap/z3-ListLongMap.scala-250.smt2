; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4184 () Bool)

(assert start!4184)

(declare-fun b_free!1089 () Bool)

(declare-fun b_next!1089 () Bool)

(assert (=> start!4184 (= b_free!1089 (not b_next!1089))))

(declare-fun tp!4687 () Bool)

(declare-fun b_and!1899 () Bool)

(assert (=> start!4184 (= tp!4687 b_and!1899)))

(declare-fun b!31707 () Bool)

(declare-fun res!19228 () Bool)

(declare-fun e!20233 () Bool)

(assert (=> b!31707 (=> (not res!19228) (not e!20233))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1749 0))(
  ( (V!1750 (val!748 Int)) )
))
(declare-datatypes ((ValueCell!522 0))(
  ( (ValueCellFull!522 (v!1837 V!1749)) (EmptyCell!522) )
))
(declare-datatypes ((array!2101 0))(
  ( (array!2102 (arr!1004 (Array (_ BitVec 32) ValueCell!522)) (size!1105 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2101)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2103 0))(
  ( (array!2104 (arr!1005 (Array (_ BitVec 32) (_ BitVec 64))) (size!1106 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2103)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1749)

(declare-fun minValue!1443 () V!1749)

(declare-datatypes ((tuple2!1220 0))(
  ( (tuple2!1221 (_1!621 (_ BitVec 64)) (_2!621 V!1749)) )
))
(declare-datatypes ((List!813 0))(
  ( (Nil!810) (Cons!809 (h!1376 tuple2!1220) (t!3506 List!813)) )
))
(declare-datatypes ((ListLongMap!797 0))(
  ( (ListLongMap!798 (toList!414 List!813)) )
))
(declare-fun contains!354 (ListLongMap!797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!242 (array!2103 array!2101 (_ BitVec 32) (_ BitVec 32) V!1749 V!1749 (_ BitVec 32) Int) ListLongMap!797)

(assert (=> b!31707 (= res!19228 (not (contains!354 (getCurrentListMap!242 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31708 () Bool)

(declare-fun res!19224 () Bool)

(assert (=> b!31708 (=> (not res!19224) (not e!20233))))

(declare-fun arrayContainsKey!0 (array!2103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31708 (= res!19224 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31709 () Bool)

(declare-fun res!19230 () Bool)

(assert (=> b!31709 (=> (not res!19230) (not e!20233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31709 (= res!19230 (validKeyInArray!0 k0!1304))))

(declare-fun b!31710 () Bool)

(declare-fun e!20231 () Bool)

(declare-fun e!20230 () Bool)

(declare-fun mapRes!1693 () Bool)

(assert (=> b!31710 (= e!20231 (and e!20230 mapRes!1693))))

(declare-fun condMapEmpty!1693 () Bool)

(declare-fun mapDefault!1693 () ValueCell!522)

(assert (=> b!31710 (= condMapEmpty!1693 (= (arr!1004 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!522)) mapDefault!1693)))))

(declare-fun b!31711 () Bool)

(declare-fun res!19229 () Bool)

(assert (=> b!31711 (=> (not res!19229) (not e!20233))))

(assert (=> b!31711 (= res!19229 (and (= (size!1105 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1106 _keys!1833) (size!1105 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31712 () Bool)

(declare-fun res!19226 () Bool)

(assert (=> b!31712 (=> (not res!19226) (not e!20233))))

(declare-datatypes ((List!814 0))(
  ( (Nil!811) (Cons!810 (h!1377 (_ BitVec 64)) (t!3507 List!814)) )
))
(declare-fun arrayNoDuplicates!0 (array!2103 (_ BitVec 32) List!814) Bool)

(assert (=> b!31712 (= res!19226 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!811))))

(declare-fun b!31713 () Bool)

(declare-fun e!20234 () Bool)

(declare-fun tp_is_empty!1443 () Bool)

(assert (=> b!31713 (= e!20234 tp_is_empty!1443)))

(declare-fun b!31714 () Bool)

(declare-fun res!19225 () Bool)

(assert (=> b!31714 (=> (not res!19225) (not e!20233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2103 (_ BitVec 32)) Bool)

(assert (=> b!31714 (= res!19225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31715 () Bool)

(assert (=> b!31715 (= e!20233 false)))

(declare-fun lt!11594 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2103 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31715 (= lt!11594 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1693 () Bool)

(assert (=> mapIsEmpty!1693 mapRes!1693))

(declare-fun b!31716 () Bool)

(assert (=> b!31716 (= e!20230 tp_is_empty!1443)))

(declare-fun res!19227 () Bool)

(assert (=> start!4184 (=> (not res!19227) (not e!20233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4184 (= res!19227 (validMask!0 mask!2294))))

(assert (=> start!4184 e!20233))

(assert (=> start!4184 true))

(assert (=> start!4184 tp!4687))

(declare-fun array_inv!701 (array!2101) Bool)

(assert (=> start!4184 (and (array_inv!701 _values!1501) e!20231)))

(declare-fun array_inv!702 (array!2103) Bool)

(assert (=> start!4184 (array_inv!702 _keys!1833)))

(assert (=> start!4184 tp_is_empty!1443))

(declare-fun mapNonEmpty!1693 () Bool)

(declare-fun tp!4686 () Bool)

(assert (=> mapNonEmpty!1693 (= mapRes!1693 (and tp!4686 e!20234))))

(declare-fun mapRest!1693 () (Array (_ BitVec 32) ValueCell!522))

(declare-fun mapKey!1693 () (_ BitVec 32))

(declare-fun mapValue!1693 () ValueCell!522)

(assert (=> mapNonEmpty!1693 (= (arr!1004 _values!1501) (store mapRest!1693 mapKey!1693 mapValue!1693))))

(assert (= (and start!4184 res!19227) b!31711))

(assert (= (and b!31711 res!19229) b!31714))

(assert (= (and b!31714 res!19225) b!31712))

(assert (= (and b!31712 res!19226) b!31709))

(assert (= (and b!31709 res!19230) b!31707))

(assert (= (and b!31707 res!19228) b!31708))

(assert (= (and b!31708 res!19224) b!31715))

(assert (= (and b!31710 condMapEmpty!1693) mapIsEmpty!1693))

(assert (= (and b!31710 (not condMapEmpty!1693)) mapNonEmpty!1693))

(get-info :version)

(assert (= (and mapNonEmpty!1693 ((_ is ValueCellFull!522) mapValue!1693)) b!31713))

(assert (= (and b!31710 ((_ is ValueCellFull!522) mapDefault!1693)) b!31716))

(assert (= start!4184 b!31710))

(declare-fun m!25415 () Bool)

(assert (=> b!31709 m!25415))

(declare-fun m!25417 () Bool)

(assert (=> b!31708 m!25417))

(declare-fun m!25419 () Bool)

(assert (=> mapNonEmpty!1693 m!25419))

(declare-fun m!25421 () Bool)

(assert (=> b!31714 m!25421))

(declare-fun m!25423 () Bool)

(assert (=> b!31707 m!25423))

(assert (=> b!31707 m!25423))

(declare-fun m!25425 () Bool)

(assert (=> b!31707 m!25425))

(declare-fun m!25427 () Bool)

(assert (=> b!31712 m!25427))

(declare-fun m!25429 () Bool)

(assert (=> b!31715 m!25429))

(declare-fun m!25431 () Bool)

(assert (=> start!4184 m!25431))

(declare-fun m!25433 () Bool)

(assert (=> start!4184 m!25433))

(declare-fun m!25435 () Bool)

(assert (=> start!4184 m!25435))

(check-sat (not b!31709) (not b!31707) tp_is_empty!1443 (not b!31708) (not b!31715) (not start!4184) (not b!31714) (not b!31712) b_and!1899 (not b_next!1089) (not mapNonEmpty!1693))
(check-sat b_and!1899 (not b_next!1089))
