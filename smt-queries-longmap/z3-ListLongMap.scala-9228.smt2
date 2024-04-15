; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110716 () Bool)

(assert start!110716)

(declare-fun b_free!29551 () Bool)

(declare-fun b_next!29551 () Bool)

(assert (=> start!110716 (= b_free!29551 (not b_next!29551))))

(declare-fun tp!103975 () Bool)

(declare-fun b_and!47741 () Bool)

(assert (=> start!110716 (= tp!103975 b_and!47741)))

(declare-fun b!1310193 () Bool)

(declare-fun e!747461 () Bool)

(declare-fun tp_is_empty!35281 () Bool)

(assert (=> b!1310193 (= e!747461 tp_is_empty!35281)))

(declare-fun mapNonEmpty!54550 () Bool)

(declare-fun mapRes!54550 () Bool)

(declare-fun tp!103976 () Bool)

(declare-fun e!747464 () Bool)

(assert (=> mapNonEmpty!54550 (= mapRes!54550 (and tp!103976 e!747464))))

(declare-fun mapKey!54550 () (_ BitVec 32))

(declare-datatypes ((V!52145 0))(
  ( (V!52146 (val!17715 Int)) )
))
(declare-datatypes ((ValueCell!16742 0))(
  ( (ValueCellFull!16742 (v!20341 V!52145)) (EmptyCell!16742) )
))
(declare-datatypes ((array!87467 0))(
  ( (array!87468 (arr!42214 (Array (_ BitVec 32) ValueCell!16742)) (size!42766 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87467)

(declare-fun mapValue!54550 () ValueCell!16742)

(declare-fun mapRest!54550 () (Array (_ BitVec 32) ValueCell!16742))

(assert (=> mapNonEmpty!54550 (= (arr!42214 _values!1354) (store mapRest!54550 mapKey!54550 mapValue!54550))))

(declare-fun res!869803 () Bool)

(declare-fun e!747463 () Bool)

(assert (=> start!110716 (=> (not res!869803) (not e!747463))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110716 (= res!869803 (validMask!0 mask!2040))))

(assert (=> start!110716 e!747463))

(assert (=> start!110716 tp!103975))

(declare-datatypes ((array!87469 0))(
  ( (array!87470 (arr!42215 (Array (_ BitVec 32) (_ BitVec 64))) (size!42767 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87469)

(declare-fun array_inv!32087 (array!87469) Bool)

(assert (=> start!110716 (array_inv!32087 _keys!1628)))

(assert (=> start!110716 true))

(assert (=> start!110716 tp_is_empty!35281))

(declare-fun e!747462 () Bool)

(declare-fun array_inv!32088 (array!87467) Bool)

(assert (=> start!110716 (and (array_inv!32088 _values!1354) e!747462)))

(declare-fun b!1310194 () Bool)

(declare-fun res!869800 () Bool)

(assert (=> b!1310194 (=> (not res!869800) (not e!747463))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(assert (=> b!1310194 (= res!869800 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42767 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310195 () Bool)

(declare-fun res!869798 () Bool)

(assert (=> b!1310195 (=> (not res!869798) (not e!747463))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310195 (= res!869798 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310196 () Bool)

(assert (=> b!1310196 (= e!747464 tp_is_empty!35281)))

(declare-fun b!1310197 () Bool)

(declare-fun res!869806 () Bool)

(assert (=> b!1310197 (=> (not res!869806) (not e!747463))))

(assert (=> b!1310197 (= res!869806 (not (= (select (arr!42215 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310198 () Bool)

(declare-fun res!869799 () Bool)

(assert (=> b!1310198 (=> (not res!869799) (not e!747463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87469 (_ BitVec 32)) Bool)

(assert (=> b!1310198 (= res!869799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310199 () Bool)

(assert (=> b!1310199 (= e!747462 (and e!747461 mapRes!54550))))

(declare-fun condMapEmpty!54550 () Bool)

(declare-fun mapDefault!54550 () ValueCell!16742)

(assert (=> b!1310199 (= condMapEmpty!54550 (= (arr!42214 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16742)) mapDefault!54550)))))

(declare-fun b!1310200 () Bool)

(declare-fun res!869804 () Bool)

(assert (=> b!1310200 (=> (not res!869804) (not e!747463))))

(assert (=> b!1310200 (= res!869804 (and (= (size!42766 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42767 _keys!1628) (size!42766 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310201 () Bool)

(declare-fun res!869802 () Bool)

(assert (=> b!1310201 (=> (not res!869802) (not e!747463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310201 (= res!869802 (validKeyInArray!0 (select (arr!42215 _keys!1628) from!2020)))))

(declare-fun b!1310202 () Bool)

(assert (=> b!1310202 (= e!747463 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52145)

(declare-fun zeroValue!1296 () V!52145)

(declare-datatypes ((tuple2!22908 0))(
  ( (tuple2!22909 (_1!11465 (_ BitVec 64)) (_2!11465 V!52145)) )
))
(declare-datatypes ((List!30033 0))(
  ( (Nil!30030) (Cons!30029 (h!31238 tuple2!22908) (t!43631 List!30033)) )
))
(declare-datatypes ((ListLongMap!20565 0))(
  ( (ListLongMap!20566 (toList!10298 List!30033)) )
))
(declare-fun contains!8375 (ListLongMap!20565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5193 (array!87469 array!87467 (_ BitVec 32) (_ BitVec 32) V!52145 V!52145 (_ BitVec 32) Int) ListLongMap!20565)

(assert (=> b!1310202 (contains!8375 (getCurrentListMap!5193 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43169 0))(
  ( (Unit!43170) )
))
(declare-fun lt!585159 () Unit!43169)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!11 (array!87469 array!87467 (_ BitVec 32) (_ BitVec 32) V!52145 V!52145 (_ BitVec 64) (_ BitVec 32) Int) Unit!43169)

(assert (=> b!1310202 (= lt!585159 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310203 () Bool)

(declare-fun res!869801 () Bool)

(assert (=> b!1310203 (=> (not res!869801) (not e!747463))))

(declare-datatypes ((List!30034 0))(
  ( (Nil!30031) (Cons!30030 (h!31239 (_ BitVec 64)) (t!43632 List!30034)) )
))
(declare-fun arrayNoDuplicates!0 (array!87469 (_ BitVec 32) List!30034) Bool)

(assert (=> b!1310203 (= res!869801 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30031))))

(declare-fun mapIsEmpty!54550 () Bool)

(assert (=> mapIsEmpty!54550 mapRes!54550))

(declare-fun b!1310204 () Bool)

(declare-fun res!869805 () Bool)

(assert (=> b!1310204 (=> (not res!869805) (not e!747463))))

(assert (=> b!1310204 (= res!869805 (contains!8375 (getCurrentListMap!5193 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110716 res!869803) b!1310200))

(assert (= (and b!1310200 res!869804) b!1310198))

(assert (= (and b!1310198 res!869799) b!1310203))

(assert (= (and b!1310203 res!869801) b!1310194))

(assert (= (and b!1310194 res!869800) b!1310204))

(assert (= (and b!1310204 res!869805) b!1310197))

(assert (= (and b!1310197 res!869806) b!1310201))

(assert (= (and b!1310201 res!869802) b!1310195))

(assert (= (and b!1310195 res!869798) b!1310202))

(assert (= (and b!1310199 condMapEmpty!54550) mapIsEmpty!54550))

(assert (= (and b!1310199 (not condMapEmpty!54550)) mapNonEmpty!54550))

(get-info :version)

(assert (= (and mapNonEmpty!54550 ((_ is ValueCellFull!16742) mapValue!54550)) b!1310196))

(assert (= (and b!1310199 ((_ is ValueCellFull!16742) mapDefault!54550)) b!1310193))

(assert (= start!110716 b!1310199))

(declare-fun m!1199577 () Bool)

(assert (=> b!1310204 m!1199577))

(assert (=> b!1310204 m!1199577))

(declare-fun m!1199579 () Bool)

(assert (=> b!1310204 m!1199579))

(declare-fun m!1199581 () Bool)

(assert (=> b!1310197 m!1199581))

(declare-fun m!1199583 () Bool)

(assert (=> b!1310202 m!1199583))

(assert (=> b!1310202 m!1199583))

(declare-fun m!1199585 () Bool)

(assert (=> b!1310202 m!1199585))

(declare-fun m!1199587 () Bool)

(assert (=> b!1310202 m!1199587))

(declare-fun m!1199589 () Bool)

(assert (=> b!1310203 m!1199589))

(declare-fun m!1199591 () Bool)

(assert (=> start!110716 m!1199591))

(declare-fun m!1199593 () Bool)

(assert (=> start!110716 m!1199593))

(declare-fun m!1199595 () Bool)

(assert (=> start!110716 m!1199595))

(declare-fun m!1199597 () Bool)

(assert (=> mapNonEmpty!54550 m!1199597))

(declare-fun m!1199599 () Bool)

(assert (=> b!1310198 m!1199599))

(assert (=> b!1310201 m!1199581))

(assert (=> b!1310201 m!1199581))

(declare-fun m!1199601 () Bool)

(assert (=> b!1310201 m!1199601))

(check-sat (not start!110716) (not b!1310203) (not b!1310202) (not mapNonEmpty!54550) (not b_next!29551) (not b!1310201) b_and!47741 tp_is_empty!35281 (not b!1310198) (not b!1310204))
(check-sat b_and!47741 (not b_next!29551))
