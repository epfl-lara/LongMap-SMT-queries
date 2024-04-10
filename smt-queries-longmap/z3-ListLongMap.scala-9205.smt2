; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110580 () Bool)

(assert start!110580)

(declare-fun b_free!29415 () Bool)

(declare-fun b_next!29415 () Bool)

(assert (=> start!110580 (= b_free!29415 (not b_next!29415))))

(declare-fun tp!103566 () Bool)

(declare-fun b_and!47623 () Bool)

(assert (=> start!110580 (= tp!103566 b_and!47623)))

(declare-fun b!1308247 () Bool)

(declare-fun e!746476 () Bool)

(declare-fun e!746473 () Bool)

(declare-fun mapRes!54346 () Bool)

(assert (=> b!1308247 (= e!746476 (and e!746473 mapRes!54346))))

(declare-fun condMapEmpty!54346 () Bool)

(declare-datatypes ((V!51963 0))(
  ( (V!51964 (val!17647 Int)) )
))
(declare-datatypes ((ValueCell!16674 0))(
  ( (ValueCellFull!16674 (v!20274 V!51963)) (EmptyCell!16674) )
))
(declare-datatypes ((array!87288 0))(
  ( (array!87289 (arr!42124 (Array (_ BitVec 32) ValueCell!16674)) (size!42674 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87288)

(declare-fun mapDefault!54346 () ValueCell!16674)

(assert (=> b!1308247 (= condMapEmpty!54346 (= (arr!42124 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16674)) mapDefault!54346)))))

(declare-fun b!1308248 () Bool)

(declare-fun res!868426 () Bool)

(declare-fun e!746475 () Bool)

(assert (=> b!1308248 (=> (not res!868426) (not e!746475))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87290 0))(
  ( (array!87291 (arr!42125 (Array (_ BitVec 32) (_ BitVec 64))) (size!42675 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87290)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51963)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!51963)

(declare-datatypes ((tuple2!22722 0))(
  ( (tuple2!22723 (_1!11372 (_ BitVec 64)) (_2!11372 V!51963)) )
))
(declare-datatypes ((List!29863 0))(
  ( (Nil!29860) (Cons!29859 (h!31068 tuple2!22722) (t!43469 List!29863)) )
))
(declare-datatypes ((ListLongMap!20379 0))(
  ( (ListLongMap!20380 (toList!10205 List!29863)) )
))
(declare-fun contains!8355 (ListLongMap!20379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5218 (array!87290 array!87288 (_ BitVec 32) (_ BitVec 32) V!51963 V!51963 (_ BitVec 32) Int) ListLongMap!20379)

(assert (=> b!1308248 (= res!868426 (contains!8355 (getCurrentListMap!5218 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308249 () Bool)

(assert (=> b!1308249 (= e!746475 (not true))))

(assert (=> b!1308249 (contains!8355 (getCurrentListMap!5218 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43290 0))(
  ( (Unit!43291) )
))
(declare-fun lt!585141 () Unit!43290)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!9 (array!87290 array!87288 (_ BitVec 32) (_ BitVec 32) V!51963 V!51963 (_ BitVec 64) (_ BitVec 32) Int) Unit!43290)

(assert (=> b!1308249 (= lt!585141 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!9 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54346 () Bool)

(assert (=> mapIsEmpty!54346 mapRes!54346))

(declare-fun b!1308250 () Bool)

(declare-fun res!868430 () Bool)

(assert (=> b!1308250 (=> (not res!868430) (not e!746475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87290 (_ BitVec 32)) Bool)

(assert (=> b!1308250 (= res!868430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308251 () Bool)

(declare-fun res!868425 () Bool)

(assert (=> b!1308251 (=> (not res!868425) (not e!746475))))

(declare-datatypes ((List!29864 0))(
  ( (Nil!29861) (Cons!29860 (h!31069 (_ BitVec 64)) (t!43470 List!29864)) )
))
(declare-fun arrayNoDuplicates!0 (array!87290 (_ BitVec 32) List!29864) Bool)

(assert (=> b!1308251 (= res!868425 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29861))))

(declare-fun b!1308253 () Bool)

(declare-fun res!868427 () Bool)

(assert (=> b!1308253 (=> (not res!868427) (not e!746475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308253 (= res!868427 (validKeyInArray!0 (select (arr!42125 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54346 () Bool)

(declare-fun tp!103567 () Bool)

(declare-fun e!746477 () Bool)

(assert (=> mapNonEmpty!54346 (= mapRes!54346 (and tp!103567 e!746477))))

(declare-fun mapRest!54346 () (Array (_ BitVec 32) ValueCell!16674))

(declare-fun mapValue!54346 () ValueCell!16674)

(declare-fun mapKey!54346 () (_ BitVec 32))

(assert (=> mapNonEmpty!54346 (= (arr!42124 _values!1354) (store mapRest!54346 mapKey!54346 mapValue!54346))))

(declare-fun b!1308254 () Bool)

(declare-fun res!868429 () Bool)

(assert (=> b!1308254 (=> (not res!868429) (not e!746475))))

(assert (=> b!1308254 (= res!868429 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42675 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308255 () Bool)

(declare-fun res!868431 () Bool)

(assert (=> b!1308255 (=> (not res!868431) (not e!746475))))

(assert (=> b!1308255 (= res!868431 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308256 () Bool)

(declare-fun res!868424 () Bool)

(assert (=> b!1308256 (=> (not res!868424) (not e!746475))))

(assert (=> b!1308256 (= res!868424 (not (= (select (arr!42125 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308257 () Bool)

(declare-fun tp_is_empty!35145 () Bool)

(assert (=> b!1308257 (= e!746477 tp_is_empty!35145)))

(declare-fun b!1308258 () Bool)

(declare-fun res!868428 () Bool)

(assert (=> b!1308258 (=> (not res!868428) (not e!746475))))

(assert (=> b!1308258 (= res!868428 (and (= (size!42674 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42675 _keys!1628) (size!42674 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308252 () Bool)

(assert (=> b!1308252 (= e!746473 tp_is_empty!35145)))

(declare-fun res!868423 () Bool)

(assert (=> start!110580 (=> (not res!868423) (not e!746475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110580 (= res!868423 (validMask!0 mask!2040))))

(assert (=> start!110580 e!746475))

(assert (=> start!110580 tp!103566))

(declare-fun array_inv!31837 (array!87290) Bool)

(assert (=> start!110580 (array_inv!31837 _keys!1628)))

(assert (=> start!110580 true))

(assert (=> start!110580 tp_is_empty!35145))

(declare-fun array_inv!31838 (array!87288) Bool)

(assert (=> start!110580 (and (array_inv!31838 _values!1354) e!746476)))

(assert (= (and start!110580 res!868423) b!1308258))

(assert (= (and b!1308258 res!868428) b!1308250))

(assert (= (and b!1308250 res!868430) b!1308251))

(assert (= (and b!1308251 res!868425) b!1308254))

(assert (= (and b!1308254 res!868429) b!1308248))

(assert (= (and b!1308248 res!868426) b!1308256))

(assert (= (and b!1308256 res!868424) b!1308253))

(assert (= (and b!1308253 res!868427) b!1308255))

(assert (= (and b!1308255 res!868431) b!1308249))

(assert (= (and b!1308247 condMapEmpty!54346) mapIsEmpty!54346))

(assert (= (and b!1308247 (not condMapEmpty!54346)) mapNonEmpty!54346))

(get-info :version)

(assert (= (and mapNonEmpty!54346 ((_ is ValueCellFull!16674) mapValue!54346)) b!1308257))

(assert (= (and b!1308247 ((_ is ValueCellFull!16674) mapDefault!54346)) b!1308252))

(assert (= start!110580 b!1308247))

(declare-fun m!1198685 () Bool)

(assert (=> b!1308249 m!1198685))

(assert (=> b!1308249 m!1198685))

(declare-fun m!1198687 () Bool)

(assert (=> b!1308249 m!1198687))

(declare-fun m!1198689 () Bool)

(assert (=> b!1308249 m!1198689))

(declare-fun m!1198691 () Bool)

(assert (=> start!110580 m!1198691))

(declare-fun m!1198693 () Bool)

(assert (=> start!110580 m!1198693))

(declare-fun m!1198695 () Bool)

(assert (=> start!110580 m!1198695))

(declare-fun m!1198697 () Bool)

(assert (=> mapNonEmpty!54346 m!1198697))

(declare-fun m!1198699 () Bool)

(assert (=> b!1308251 m!1198699))

(declare-fun m!1198701 () Bool)

(assert (=> b!1308248 m!1198701))

(assert (=> b!1308248 m!1198701))

(declare-fun m!1198703 () Bool)

(assert (=> b!1308248 m!1198703))

(declare-fun m!1198705 () Bool)

(assert (=> b!1308256 m!1198705))

(declare-fun m!1198707 () Bool)

(assert (=> b!1308250 m!1198707))

(assert (=> b!1308253 m!1198705))

(assert (=> b!1308253 m!1198705))

(declare-fun m!1198709 () Bool)

(assert (=> b!1308253 m!1198709))

(check-sat b_and!47623 (not b!1308253) tp_is_empty!35145 (not b!1308248) (not start!110580) (not mapNonEmpty!54346) (not b!1308251) (not b!1308249) (not b!1308250) (not b_next!29415))
(check-sat b_and!47623 (not b_next!29415))
