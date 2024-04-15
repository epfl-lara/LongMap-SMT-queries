; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110590 () Bool)

(assert start!110590)

(declare-fun b_free!29425 () Bool)

(declare-fun b_next!29425 () Bool)

(assert (=> start!110590 (= b_free!29425 (not b_next!29425))))

(declare-fun tp!103598 () Bool)

(declare-fun b_and!47615 () Bool)

(assert (=> start!110590 (= tp!103598 b_and!47615)))

(declare-fun b!1308357 () Bool)

(declare-fun res!868529 () Bool)

(declare-fun e!746518 () Bool)

(assert (=> b!1308357 (=> (not res!868529) (not e!746518))))

(declare-datatypes ((array!87225 0))(
  ( (array!87226 (arr!42093 (Array (_ BitVec 32) (_ BitVec 64))) (size!42645 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87225)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87225 (_ BitVec 32)) Bool)

(assert (=> b!1308357 (= res!868529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308358 () Bool)

(declare-fun res!868531 () Bool)

(assert (=> b!1308358 (=> (not res!868531) (not e!746518))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308358 (= res!868531 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308360 () Bool)

(declare-fun e!746519 () Bool)

(declare-fun e!746515 () Bool)

(declare-fun mapRes!54361 () Bool)

(assert (=> b!1308360 (= e!746519 (and e!746515 mapRes!54361))))

(declare-fun condMapEmpty!54361 () Bool)

(declare-datatypes ((V!51977 0))(
  ( (V!51978 (val!17652 Int)) )
))
(declare-datatypes ((ValueCell!16679 0))(
  ( (ValueCellFull!16679 (v!20278 V!51977)) (EmptyCell!16679) )
))
(declare-datatypes ((array!87227 0))(
  ( (array!87228 (arr!42094 (Array (_ BitVec 32) ValueCell!16679)) (size!42646 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87227)

(declare-fun mapDefault!54361 () ValueCell!16679)

(assert (=> b!1308360 (= condMapEmpty!54361 (= (arr!42094 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16679)) mapDefault!54361)))))

(declare-fun mapIsEmpty!54361 () Bool)

(assert (=> mapIsEmpty!54361 mapRes!54361))

(declare-fun b!1308361 () Bool)

(declare-fun res!868530 () Bool)

(assert (=> b!1308361 (=> (not res!868530) (not e!746518))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51977)

(declare-fun zeroValue!1296 () V!51977)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22812 0))(
  ( (tuple2!22813 (_1!11417 (_ BitVec 64)) (_2!11417 V!51977)) )
))
(declare-datatypes ((List!29938 0))(
  ( (Nil!29935) (Cons!29934 (h!31143 tuple2!22812) (t!43536 List!29938)) )
))
(declare-datatypes ((ListLongMap!20469 0))(
  ( (ListLongMap!20470 (toList!10250 List!29938)) )
))
(declare-fun contains!8327 (ListLongMap!20469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5145 (array!87225 array!87227 (_ BitVec 32) (_ BitVec 32) V!51977 V!51977 (_ BitVec 32) Int) ListLongMap!20469)

(assert (=> b!1308361 (= res!868530 (contains!8327 (getCurrentListMap!5145 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308362 () Bool)

(assert (=> b!1308362 (= e!746518 (not true))))

(assert (=> b!1308362 (contains!8327 (getCurrentListMap!5145 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43133 0))(
  ( (Unit!43134) )
))
(declare-fun lt!584970 () Unit!43133)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!11 (array!87225 array!87227 (_ BitVec 32) (_ BitVec 32) V!51977 V!51977 (_ BitVec 64) (_ BitVec 32) Int) Unit!43133)

(assert (=> b!1308362 (= lt!584970 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308363 () Bool)

(declare-fun res!868534 () Bool)

(assert (=> b!1308363 (=> (not res!868534) (not e!746518))))

(assert (=> b!1308363 (= res!868534 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42645 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308359 () Bool)

(declare-fun tp_is_empty!35155 () Bool)

(assert (=> b!1308359 (= e!746515 tp_is_empty!35155)))

(declare-fun res!868533 () Bool)

(assert (=> start!110590 (=> (not res!868533) (not e!746518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110590 (= res!868533 (validMask!0 mask!2040))))

(assert (=> start!110590 e!746518))

(assert (=> start!110590 tp!103598))

(declare-fun array_inv!32007 (array!87225) Bool)

(assert (=> start!110590 (array_inv!32007 _keys!1628)))

(assert (=> start!110590 true))

(assert (=> start!110590 tp_is_empty!35155))

(declare-fun array_inv!32008 (array!87227) Bool)

(assert (=> start!110590 (and (array_inv!32008 _values!1354) e!746519)))

(declare-fun b!1308364 () Bool)

(declare-fun res!868536 () Bool)

(assert (=> b!1308364 (=> (not res!868536) (not e!746518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308364 (= res!868536 (validKeyInArray!0 (select (arr!42093 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54361 () Bool)

(declare-fun tp!103597 () Bool)

(declare-fun e!746516 () Bool)

(assert (=> mapNonEmpty!54361 (= mapRes!54361 (and tp!103597 e!746516))))

(declare-fun mapRest!54361 () (Array (_ BitVec 32) ValueCell!16679))

(declare-fun mapValue!54361 () ValueCell!16679)

(declare-fun mapKey!54361 () (_ BitVec 32))

(assert (=> mapNonEmpty!54361 (= (arr!42094 _values!1354) (store mapRest!54361 mapKey!54361 mapValue!54361))))

(declare-fun b!1308365 () Bool)

(declare-fun res!868532 () Bool)

(assert (=> b!1308365 (=> (not res!868532) (not e!746518))))

(assert (=> b!1308365 (= res!868532 (not (= (select (arr!42093 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1308366 () Bool)

(assert (=> b!1308366 (= e!746516 tp_is_empty!35155)))

(declare-fun b!1308367 () Bool)

(declare-fun res!868535 () Bool)

(assert (=> b!1308367 (=> (not res!868535) (not e!746518))))

(declare-datatypes ((List!29939 0))(
  ( (Nil!29936) (Cons!29935 (h!31144 (_ BitVec 64)) (t!43537 List!29939)) )
))
(declare-fun arrayNoDuplicates!0 (array!87225 (_ BitVec 32) List!29939) Bool)

(assert (=> b!1308367 (= res!868535 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29936))))

(declare-fun b!1308368 () Bool)

(declare-fun res!868537 () Bool)

(assert (=> b!1308368 (=> (not res!868537) (not e!746518))))

(assert (=> b!1308368 (= res!868537 (and (= (size!42646 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42645 _keys!1628) (size!42646 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110590 res!868533) b!1308368))

(assert (= (and b!1308368 res!868537) b!1308357))

(assert (= (and b!1308357 res!868529) b!1308367))

(assert (= (and b!1308367 res!868535) b!1308363))

(assert (= (and b!1308363 res!868534) b!1308361))

(assert (= (and b!1308361 res!868530) b!1308365))

(assert (= (and b!1308365 res!868532) b!1308364))

(assert (= (and b!1308364 res!868536) b!1308358))

(assert (= (and b!1308358 res!868531) b!1308362))

(assert (= (and b!1308360 condMapEmpty!54361) mapIsEmpty!54361))

(assert (= (and b!1308360 (not condMapEmpty!54361)) mapNonEmpty!54361))

(get-info :version)

(assert (= (and mapNonEmpty!54361 ((_ is ValueCellFull!16679) mapValue!54361)) b!1308366))

(assert (= (and b!1308360 ((_ is ValueCellFull!16679) mapDefault!54361)) b!1308359))

(assert (= start!110590 b!1308360))

(declare-fun m!1198299 () Bool)

(assert (=> b!1308361 m!1198299))

(assert (=> b!1308361 m!1198299))

(declare-fun m!1198301 () Bool)

(assert (=> b!1308361 m!1198301))

(declare-fun m!1198303 () Bool)

(assert (=> start!110590 m!1198303))

(declare-fun m!1198305 () Bool)

(assert (=> start!110590 m!1198305))

(declare-fun m!1198307 () Bool)

(assert (=> start!110590 m!1198307))

(declare-fun m!1198309 () Bool)

(assert (=> b!1308365 m!1198309))

(declare-fun m!1198311 () Bool)

(assert (=> mapNonEmpty!54361 m!1198311))

(declare-fun m!1198313 () Bool)

(assert (=> b!1308367 m!1198313))

(declare-fun m!1198315 () Bool)

(assert (=> b!1308357 m!1198315))

(assert (=> b!1308364 m!1198309))

(assert (=> b!1308364 m!1198309))

(declare-fun m!1198317 () Bool)

(assert (=> b!1308364 m!1198317))

(declare-fun m!1198319 () Bool)

(assert (=> b!1308362 m!1198319))

(assert (=> b!1308362 m!1198319))

(declare-fun m!1198321 () Bool)

(assert (=> b!1308362 m!1198321))

(declare-fun m!1198323 () Bool)

(assert (=> b!1308362 m!1198323))

(check-sat tp_is_empty!35155 (not b_next!29425) (not b!1308364) b_and!47615 (not b!1308357) (not b!1308367) (not start!110590) (not mapNonEmpty!54361) (not b!1308361) (not b!1308362))
(check-sat b_and!47615 (not b_next!29425))
