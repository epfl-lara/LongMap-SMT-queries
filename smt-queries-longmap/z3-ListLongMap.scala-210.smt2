; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3938 () Bool)

(assert start!3938)

(declare-fun b_free!847 () Bool)

(declare-fun b_next!847 () Bool)

(assert (=> start!3938 (= b_free!847 (not b_next!847))))

(declare-fun tp!3960 () Bool)

(declare-fun b_and!1647 () Bool)

(assert (=> start!3938 (= tp!3960 b_and!1647)))

(declare-fun mapIsEmpty!1330 () Bool)

(declare-fun mapRes!1330 () Bool)

(assert (=> mapIsEmpty!1330 mapRes!1330))

(declare-fun b!28014 () Bool)

(declare-fun e!18148 () Bool)

(declare-fun tp_is_empty!1201 () Bool)

(assert (=> b!28014 (= e!18148 tp_is_empty!1201)))

(declare-fun b!28015 () Bool)

(declare-fun res!16655 () Bool)

(declare-fun e!18150 () Bool)

(assert (=> b!28015 (=> (not res!16655) (not e!18150))))

(declare-datatypes ((array!1623 0))(
  ( (array!1624 (arr!765 (Array (_ BitVec 32) (_ BitVec 64))) (size!866 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1623)

(declare-datatypes ((List!638 0))(
  ( (Nil!635) (Cons!634 (h!1201 (_ BitVec 64)) (t!3325 List!638)) )
))
(declare-fun arrayNoDuplicates!0 (array!1623 (_ BitVec 32) List!638) Bool)

(assert (=> b!28015 (= res!16655 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!635))))

(declare-fun b!28016 () Bool)

(declare-fun e!18147 () Bool)

(assert (=> b!28016 (= e!18147 (and e!18148 mapRes!1330))))

(declare-fun condMapEmpty!1330 () Bool)

(declare-datatypes ((V!1427 0))(
  ( (V!1428 (val!627 Int)) )
))
(declare-datatypes ((ValueCell!401 0))(
  ( (ValueCellFull!401 (v!1716 V!1427)) (EmptyCell!401) )
))
(declare-datatypes ((array!1625 0))(
  ( (array!1626 (arr!766 (Array (_ BitVec 32) ValueCell!401)) (size!867 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1625)

(declare-fun mapDefault!1330 () ValueCell!401)

(assert (=> b!28016 (= condMapEmpty!1330 (= (arr!766 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!401)) mapDefault!1330)))))

(declare-fun b!28017 () Bool)

(assert (=> b!28017 (= e!18150 false)))

(declare-fun lt!10701 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1623 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28017 (= lt!10701 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28018 () Bool)

(declare-fun res!16652 () Bool)

(assert (=> b!28018 (=> (not res!16652) (not e!18150))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1623 (_ BitVec 32)) Bool)

(assert (=> b!28018 (= res!16652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28019 () Bool)

(declare-fun e!18149 () Bool)

(assert (=> b!28019 (= e!18149 tp_is_empty!1201)))

(declare-fun b!28020 () Bool)

(declare-fun res!16653 () Bool)

(assert (=> b!28020 (=> (not res!16653) (not e!18150))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1427)

(declare-fun minValue!1443 () V!1427)

(declare-datatypes ((tuple2!1044 0))(
  ( (tuple2!1045 (_1!533 (_ BitVec 64)) (_2!533 V!1427)) )
))
(declare-datatypes ((List!639 0))(
  ( (Nil!636) (Cons!635 (h!1202 tuple2!1044) (t!3326 List!639)) )
))
(declare-datatypes ((ListLongMap!615 0))(
  ( (ListLongMap!616 (toList!323 List!639)) )
))
(declare-fun contains!265 (ListLongMap!615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!153 (array!1623 array!1625 (_ BitVec 32) (_ BitVec 32) V!1427 V!1427 (_ BitVec 32) Int) ListLongMap!615)

(assert (=> b!28020 (= res!16653 (not (contains!265 (getCurrentListMap!153 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!28021 () Bool)

(declare-fun res!16658 () Bool)

(assert (=> b!28021 (=> (not res!16658) (not e!18150))))

(declare-fun arrayContainsKey!0 (array!1623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28021 (= res!16658 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28022 () Bool)

(declare-fun res!16654 () Bool)

(assert (=> b!28022 (=> (not res!16654) (not e!18150))))

(assert (=> b!28022 (= res!16654 (and (= (size!867 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!866 _keys!1833) (size!867 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28023 () Bool)

(declare-fun res!16657 () Bool)

(assert (=> b!28023 (=> (not res!16657) (not e!18150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28023 (= res!16657 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1330 () Bool)

(declare-fun tp!3961 () Bool)

(assert (=> mapNonEmpty!1330 (= mapRes!1330 (and tp!3961 e!18149))))

(declare-fun mapValue!1330 () ValueCell!401)

(declare-fun mapRest!1330 () (Array (_ BitVec 32) ValueCell!401))

(declare-fun mapKey!1330 () (_ BitVec 32))

(assert (=> mapNonEmpty!1330 (= (arr!766 _values!1501) (store mapRest!1330 mapKey!1330 mapValue!1330))))

(declare-fun res!16656 () Bool)

(assert (=> start!3938 (=> (not res!16656) (not e!18150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3938 (= res!16656 (validMask!0 mask!2294))))

(assert (=> start!3938 e!18150))

(assert (=> start!3938 true))

(assert (=> start!3938 tp!3960))

(declare-fun array_inv!533 (array!1625) Bool)

(assert (=> start!3938 (and (array_inv!533 _values!1501) e!18147)))

(declare-fun array_inv!534 (array!1623) Bool)

(assert (=> start!3938 (array_inv!534 _keys!1833)))

(assert (=> start!3938 tp_is_empty!1201))

(assert (= (and start!3938 res!16656) b!28022))

(assert (= (and b!28022 res!16654) b!28018))

(assert (= (and b!28018 res!16652) b!28015))

(assert (= (and b!28015 res!16655) b!28023))

(assert (= (and b!28023 res!16657) b!28020))

(assert (= (and b!28020 res!16653) b!28021))

(assert (= (and b!28021 res!16658) b!28017))

(assert (= (and b!28016 condMapEmpty!1330) mapIsEmpty!1330))

(assert (= (and b!28016 (not condMapEmpty!1330)) mapNonEmpty!1330))

(get-info :version)

(assert (= (and mapNonEmpty!1330 ((_ is ValueCellFull!401) mapValue!1330)) b!28019))

(assert (= (and b!28016 ((_ is ValueCellFull!401) mapDefault!1330)) b!28014))

(assert (= start!3938 b!28016))

(declare-fun m!22217 () Bool)

(assert (=> b!28017 m!22217))

(declare-fun m!22219 () Bool)

(assert (=> mapNonEmpty!1330 m!22219))

(declare-fun m!22221 () Bool)

(assert (=> b!28018 m!22221))

(declare-fun m!22223 () Bool)

(assert (=> b!28020 m!22223))

(assert (=> b!28020 m!22223))

(declare-fun m!22225 () Bool)

(assert (=> b!28020 m!22225))

(declare-fun m!22227 () Bool)

(assert (=> b!28015 m!22227))

(declare-fun m!22229 () Bool)

(assert (=> b!28021 m!22229))

(declare-fun m!22231 () Bool)

(assert (=> start!3938 m!22231))

(declare-fun m!22233 () Bool)

(assert (=> start!3938 m!22233))

(declare-fun m!22235 () Bool)

(assert (=> start!3938 m!22235))

(declare-fun m!22237 () Bool)

(assert (=> b!28023 m!22237))

(check-sat (not b_next!847) (not b!28017) b_and!1647 (not start!3938) (not b!28020) (not b!28018) (not b!28021) tp_is_empty!1201 (not b!28015) (not b!28023) (not mapNonEmpty!1330))
(check-sat b_and!1647 (not b_next!847))
