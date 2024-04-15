; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110584 () Bool)

(assert start!110584)

(declare-fun b_free!29419 () Bool)

(declare-fun b_next!29419 () Bool)

(assert (=> start!110584 (= b_free!29419 (not b_next!29419))))

(declare-fun tp!103579 () Bool)

(declare-fun b_and!47609 () Bool)

(assert (=> start!110584 (= tp!103579 b_and!47609)))

(declare-fun mapNonEmpty!54352 () Bool)

(declare-fun mapRes!54352 () Bool)

(declare-fun tp!103580 () Bool)

(declare-fun e!746474 () Bool)

(assert (=> mapNonEmpty!54352 (= mapRes!54352 (and tp!103580 e!746474))))

(declare-datatypes ((V!51969 0))(
  ( (V!51970 (val!17649 Int)) )
))
(declare-datatypes ((ValueCell!16676 0))(
  ( (ValueCellFull!16676 (v!20275 V!51969)) (EmptyCell!16676) )
))
(declare-fun mapRest!54352 () (Array (_ BitVec 32) ValueCell!16676))

(declare-datatypes ((array!87213 0))(
  ( (array!87214 (arr!42087 (Array (_ BitVec 32) ValueCell!16676)) (size!42639 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87213)

(declare-fun mapKey!54352 () (_ BitVec 32))

(declare-fun mapValue!54352 () ValueCell!16676)

(assert (=> mapNonEmpty!54352 (= (arr!42087 _values!1354) (store mapRest!54352 mapKey!54352 mapValue!54352))))

(declare-fun b!1308249 () Bool)

(declare-fun e!746472 () Bool)

(declare-fun tp_is_empty!35149 () Bool)

(assert (=> b!1308249 (= e!746472 tp_is_empty!35149)))

(declare-fun mapIsEmpty!54352 () Bool)

(assert (=> mapIsEmpty!54352 mapRes!54352))

(declare-fun b!1308251 () Bool)

(declare-fun res!868448 () Bool)

(declare-fun e!746471 () Bool)

(assert (=> b!1308251 (=> (not res!868448) (not e!746471))))

(declare-datatypes ((array!87215 0))(
  ( (array!87216 (arr!42088 (Array (_ BitVec 32) (_ BitVec 64))) (size!42640 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87215)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308251 (= res!868448 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42640 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308252 () Bool)

(declare-fun res!868456 () Bool)

(assert (=> b!1308252 (=> (not res!868456) (not e!746471))))

(assert (=> b!1308252 (= res!868456 (not (= (select (arr!42088 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308253 () Bool)

(declare-fun res!868453 () Bool)

(assert (=> b!1308253 (=> (not res!868453) (not e!746471))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87215 (_ BitVec 32)) Bool)

(assert (=> b!1308253 (= res!868453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308254 () Bool)

(declare-fun e!746473 () Bool)

(assert (=> b!1308254 (= e!746473 (and e!746472 mapRes!54352))))

(declare-fun condMapEmpty!54352 () Bool)

(declare-fun mapDefault!54352 () ValueCell!16676)

(assert (=> b!1308254 (= condMapEmpty!54352 (= (arr!42087 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16676)) mapDefault!54352)))))

(declare-fun b!1308255 () Bool)

(assert (=> b!1308255 (= e!746474 tp_is_empty!35149)))

(declare-fun b!1308256 () Bool)

(declare-fun res!868450 () Bool)

(assert (=> b!1308256 (=> (not res!868450) (not e!746471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308256 (= res!868450 (validKeyInArray!0 (select (arr!42088 _keys!1628) from!2020)))))

(declare-fun b!1308257 () Bool)

(declare-fun res!868451 () Bool)

(assert (=> b!1308257 (=> (not res!868451) (not e!746471))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308257 (= res!868451 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308258 () Bool)

(declare-fun res!868454 () Bool)

(assert (=> b!1308258 (=> (not res!868454) (not e!746471))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51969)

(declare-fun zeroValue!1296 () V!51969)

(declare-datatypes ((tuple2!22808 0))(
  ( (tuple2!22809 (_1!11415 (_ BitVec 64)) (_2!11415 V!51969)) )
))
(declare-datatypes ((List!29934 0))(
  ( (Nil!29931) (Cons!29930 (h!31139 tuple2!22808) (t!43532 List!29934)) )
))
(declare-datatypes ((ListLongMap!20465 0))(
  ( (ListLongMap!20466 (toList!10248 List!29934)) )
))
(declare-fun contains!8325 (ListLongMap!20465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5143 (array!87215 array!87213 (_ BitVec 32) (_ BitVec 32) V!51969 V!51969 (_ BitVec 32) Int) ListLongMap!20465)

(assert (=> b!1308258 (= res!868454 (contains!8325 (getCurrentListMap!5143 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308259 () Bool)

(declare-fun res!868449 () Bool)

(assert (=> b!1308259 (=> (not res!868449) (not e!746471))))

(assert (=> b!1308259 (= res!868449 (and (= (size!42639 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42640 _keys!1628) (size!42639 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308260 () Bool)

(declare-fun res!868455 () Bool)

(assert (=> b!1308260 (=> (not res!868455) (not e!746471))))

(declare-datatypes ((List!29935 0))(
  ( (Nil!29932) (Cons!29931 (h!31140 (_ BitVec 64)) (t!43533 List!29935)) )
))
(declare-fun arrayNoDuplicates!0 (array!87215 (_ BitVec 32) List!29935) Bool)

(assert (=> b!1308260 (= res!868455 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29932))))

(declare-fun b!1308250 () Bool)

(assert (=> b!1308250 (= e!746471 (not true))))

(assert (=> b!1308250 (contains!8325 (getCurrentListMap!5143 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43129 0))(
  ( (Unit!43130) )
))
(declare-fun lt!584961 () Unit!43129)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!9 (array!87215 array!87213 (_ BitVec 32) (_ BitVec 32) V!51969 V!51969 (_ BitVec 64) (_ BitVec 32) Int) Unit!43129)

(assert (=> b!1308250 (= lt!584961 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!9 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun res!868452 () Bool)

(assert (=> start!110584 (=> (not res!868452) (not e!746471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110584 (= res!868452 (validMask!0 mask!2040))))

(assert (=> start!110584 e!746471))

(assert (=> start!110584 tp!103579))

(declare-fun array_inv!32003 (array!87215) Bool)

(assert (=> start!110584 (array_inv!32003 _keys!1628)))

(assert (=> start!110584 true))

(assert (=> start!110584 tp_is_empty!35149))

(declare-fun array_inv!32004 (array!87213) Bool)

(assert (=> start!110584 (and (array_inv!32004 _values!1354) e!746473)))

(assert (= (and start!110584 res!868452) b!1308259))

(assert (= (and b!1308259 res!868449) b!1308253))

(assert (= (and b!1308253 res!868453) b!1308260))

(assert (= (and b!1308260 res!868455) b!1308251))

(assert (= (and b!1308251 res!868448) b!1308258))

(assert (= (and b!1308258 res!868454) b!1308252))

(assert (= (and b!1308252 res!868456) b!1308256))

(assert (= (and b!1308256 res!868450) b!1308257))

(assert (= (and b!1308257 res!868451) b!1308250))

(assert (= (and b!1308254 condMapEmpty!54352) mapIsEmpty!54352))

(assert (= (and b!1308254 (not condMapEmpty!54352)) mapNonEmpty!54352))

(get-info :version)

(assert (= (and mapNonEmpty!54352 ((_ is ValueCellFull!16676) mapValue!54352)) b!1308255))

(assert (= (and b!1308254 ((_ is ValueCellFull!16676) mapDefault!54352)) b!1308249))

(assert (= start!110584 b!1308254))

(declare-fun m!1198221 () Bool)

(assert (=> b!1308258 m!1198221))

(assert (=> b!1308258 m!1198221))

(declare-fun m!1198223 () Bool)

(assert (=> b!1308258 m!1198223))

(declare-fun m!1198225 () Bool)

(assert (=> b!1308253 m!1198225))

(declare-fun m!1198227 () Bool)

(assert (=> mapNonEmpty!54352 m!1198227))

(declare-fun m!1198229 () Bool)

(assert (=> b!1308250 m!1198229))

(assert (=> b!1308250 m!1198229))

(declare-fun m!1198231 () Bool)

(assert (=> b!1308250 m!1198231))

(declare-fun m!1198233 () Bool)

(assert (=> b!1308250 m!1198233))

(declare-fun m!1198235 () Bool)

(assert (=> b!1308252 m!1198235))

(assert (=> b!1308256 m!1198235))

(assert (=> b!1308256 m!1198235))

(declare-fun m!1198237 () Bool)

(assert (=> b!1308256 m!1198237))

(declare-fun m!1198239 () Bool)

(assert (=> b!1308260 m!1198239))

(declare-fun m!1198241 () Bool)

(assert (=> start!110584 m!1198241))

(declare-fun m!1198243 () Bool)

(assert (=> start!110584 m!1198243))

(declare-fun m!1198245 () Bool)

(assert (=> start!110584 m!1198245))

(check-sat tp_is_empty!35149 (not mapNonEmpty!54352) (not b_next!29419) (not b!1308250) (not b!1308253) (not b!1308256) (not b!1308258) (not b!1308260) b_and!47609 (not start!110584))
(check-sat b_and!47609 (not b_next!29419))
