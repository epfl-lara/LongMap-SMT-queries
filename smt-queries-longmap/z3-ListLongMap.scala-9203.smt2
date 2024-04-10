; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110568 () Bool)

(assert start!110568)

(declare-fun b_free!29403 () Bool)

(declare-fun b_next!29403 () Bool)

(assert (=> start!110568 (= b_free!29403 (not b_next!29403))))

(declare-fun tp!103530 () Bool)

(declare-fun b_and!47611 () Bool)

(assert (=> start!110568 (= tp!103530 b_and!47611)))

(declare-fun b!1308031 () Bool)

(declare-fun e!746385 () Bool)

(declare-fun e!746384 () Bool)

(declare-fun mapRes!54328 () Bool)

(assert (=> b!1308031 (= e!746385 (and e!746384 mapRes!54328))))

(declare-fun condMapEmpty!54328 () Bool)

(declare-datatypes ((V!51947 0))(
  ( (V!51948 (val!17641 Int)) )
))
(declare-datatypes ((ValueCell!16668 0))(
  ( (ValueCellFull!16668 (v!20268 V!51947)) (EmptyCell!16668) )
))
(declare-datatypes ((array!87264 0))(
  ( (array!87265 (arr!42112 (Array (_ BitVec 32) ValueCell!16668)) (size!42662 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87264)

(declare-fun mapDefault!54328 () ValueCell!16668)

(assert (=> b!1308031 (= condMapEmpty!54328 (= (arr!42112 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16668)) mapDefault!54328)))))

(declare-fun res!868265 () Bool)

(declare-fun e!746386 () Bool)

(assert (=> start!110568 (=> (not res!868265) (not e!746386))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110568 (= res!868265 (validMask!0 mask!2040))))

(assert (=> start!110568 e!746386))

(assert (=> start!110568 tp!103530))

(declare-datatypes ((array!87266 0))(
  ( (array!87267 (arr!42113 (Array (_ BitVec 32) (_ BitVec 64))) (size!42663 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87266)

(declare-fun array_inv!31827 (array!87266) Bool)

(assert (=> start!110568 (array_inv!31827 _keys!1628)))

(assert (=> start!110568 true))

(declare-fun tp_is_empty!35133 () Bool)

(assert (=> start!110568 tp_is_empty!35133))

(declare-fun array_inv!31828 (array!87264) Bool)

(assert (=> start!110568 (and (array_inv!31828 _values!1354) e!746385)))

(declare-fun b!1308032 () Bool)

(declare-fun res!868264 () Bool)

(assert (=> b!1308032 (=> (not res!868264) (not e!746386))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308032 (= res!868264 (validKeyInArray!0 (select (arr!42113 _keys!1628) from!2020)))))

(declare-fun b!1308033 () Bool)

(assert (=> b!1308033 (= e!746384 tp_is_empty!35133)))

(declare-fun b!1308034 () Bool)

(declare-fun e!746387 () Bool)

(assert (=> b!1308034 (= e!746387 tp_is_empty!35133)))

(declare-fun b!1308035 () Bool)

(assert (=> b!1308035 (= e!746386 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51947)

(declare-fun zeroValue!1296 () V!51947)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22712 0))(
  ( (tuple2!22713 (_1!11367 (_ BitVec 64)) (_2!11367 V!51947)) )
))
(declare-datatypes ((List!29854 0))(
  ( (Nil!29851) (Cons!29850 (h!31059 tuple2!22712) (t!43460 List!29854)) )
))
(declare-datatypes ((ListLongMap!20369 0))(
  ( (ListLongMap!20370 (toList!10200 List!29854)) )
))
(declare-fun contains!8350 (ListLongMap!20369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5213 (array!87266 array!87264 (_ BitVec 32) (_ BitVec 32) V!51947 V!51947 (_ BitVec 32) Int) ListLongMap!20369)

(assert (=> b!1308035 (contains!8350 (getCurrentListMap!5213 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43280 0))(
  ( (Unit!43281) )
))
(declare-fun lt!585123 () Unit!43280)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!4 (array!87266 array!87264 (_ BitVec 32) (_ BitVec 32) V!51947 V!51947 (_ BitVec 64) (_ BitVec 32) Int) Unit!43280)

(assert (=> b!1308035 (= lt!585123 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!4 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308036 () Bool)

(declare-fun res!868267 () Bool)

(assert (=> b!1308036 (=> (not res!868267) (not e!746386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87266 (_ BitVec 32)) Bool)

(assert (=> b!1308036 (= res!868267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308037 () Bool)

(declare-fun res!868266 () Bool)

(assert (=> b!1308037 (=> (not res!868266) (not e!746386))))

(declare-datatypes ((List!29855 0))(
  ( (Nil!29852) (Cons!29851 (h!31060 (_ BitVec 64)) (t!43461 List!29855)) )
))
(declare-fun arrayNoDuplicates!0 (array!87266 (_ BitVec 32) List!29855) Bool)

(assert (=> b!1308037 (= res!868266 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29852))))

(declare-fun b!1308038 () Bool)

(declare-fun res!868263 () Bool)

(assert (=> b!1308038 (=> (not res!868263) (not e!746386))))

(assert (=> b!1308038 (= res!868263 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42663 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308039 () Bool)

(declare-fun res!868269 () Bool)

(assert (=> b!1308039 (=> (not res!868269) (not e!746386))))

(assert (=> b!1308039 (= res!868269 (not (= (select (arr!42113 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapNonEmpty!54328 () Bool)

(declare-fun tp!103531 () Bool)

(assert (=> mapNonEmpty!54328 (= mapRes!54328 (and tp!103531 e!746387))))

(declare-fun mapValue!54328 () ValueCell!16668)

(declare-fun mapRest!54328 () (Array (_ BitVec 32) ValueCell!16668))

(declare-fun mapKey!54328 () (_ BitVec 32))

(assert (=> mapNonEmpty!54328 (= (arr!42112 _values!1354) (store mapRest!54328 mapKey!54328 mapValue!54328))))

(declare-fun mapIsEmpty!54328 () Bool)

(assert (=> mapIsEmpty!54328 mapRes!54328))

(declare-fun b!1308040 () Bool)

(declare-fun res!868268 () Bool)

(assert (=> b!1308040 (=> (not res!868268) (not e!746386))))

(assert (=> b!1308040 (= res!868268 (and (= (size!42662 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42663 _keys!1628) (size!42662 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308041 () Bool)

(declare-fun res!868261 () Bool)

(assert (=> b!1308041 (=> (not res!868261) (not e!746386))))

(assert (=> b!1308041 (= res!868261 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308042 () Bool)

(declare-fun res!868262 () Bool)

(assert (=> b!1308042 (=> (not res!868262) (not e!746386))))

(assert (=> b!1308042 (= res!868262 (contains!8350 (getCurrentListMap!5213 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110568 res!868265) b!1308040))

(assert (= (and b!1308040 res!868268) b!1308036))

(assert (= (and b!1308036 res!868267) b!1308037))

(assert (= (and b!1308037 res!868266) b!1308038))

(assert (= (and b!1308038 res!868263) b!1308042))

(assert (= (and b!1308042 res!868262) b!1308039))

(assert (= (and b!1308039 res!868269) b!1308032))

(assert (= (and b!1308032 res!868264) b!1308041))

(assert (= (and b!1308041 res!868261) b!1308035))

(assert (= (and b!1308031 condMapEmpty!54328) mapIsEmpty!54328))

(assert (= (and b!1308031 (not condMapEmpty!54328)) mapNonEmpty!54328))

(get-info :version)

(assert (= (and mapNonEmpty!54328 ((_ is ValueCellFull!16668) mapValue!54328)) b!1308034))

(assert (= (and b!1308031 ((_ is ValueCellFull!16668) mapDefault!54328)) b!1308033))

(assert (= start!110568 b!1308031))

(declare-fun m!1198529 () Bool)

(assert (=> b!1308036 m!1198529))

(declare-fun m!1198531 () Bool)

(assert (=> start!110568 m!1198531))

(declare-fun m!1198533 () Bool)

(assert (=> start!110568 m!1198533))

(declare-fun m!1198535 () Bool)

(assert (=> start!110568 m!1198535))

(declare-fun m!1198537 () Bool)

(assert (=> b!1308039 m!1198537))

(declare-fun m!1198539 () Bool)

(assert (=> mapNonEmpty!54328 m!1198539))

(declare-fun m!1198541 () Bool)

(assert (=> b!1308035 m!1198541))

(assert (=> b!1308035 m!1198541))

(declare-fun m!1198543 () Bool)

(assert (=> b!1308035 m!1198543))

(declare-fun m!1198545 () Bool)

(assert (=> b!1308035 m!1198545))

(declare-fun m!1198547 () Bool)

(assert (=> b!1308037 m!1198547))

(declare-fun m!1198549 () Bool)

(assert (=> b!1308042 m!1198549))

(assert (=> b!1308042 m!1198549))

(declare-fun m!1198551 () Bool)

(assert (=> b!1308042 m!1198551))

(assert (=> b!1308032 m!1198537))

(assert (=> b!1308032 m!1198537))

(declare-fun m!1198553 () Bool)

(assert (=> b!1308032 m!1198553))

(check-sat (not b!1308042) (not start!110568) (not mapNonEmpty!54328) (not b!1308035) tp_is_empty!35133 (not b!1308037) b_and!47611 (not b!1308036) (not b!1308032) (not b_next!29403))
(check-sat b_and!47611 (not b_next!29403))
