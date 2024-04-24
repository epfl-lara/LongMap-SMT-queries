; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111384 () Bool)

(assert start!111384)

(declare-fun b_free!29995 () Bool)

(declare-fun b_next!29995 () Bool)

(assert (=> start!111384 (= b_free!29995 (not b_next!29995))))

(declare-fun tp!105306 () Bool)

(declare-fun b_and!48205 () Bool)

(assert (=> start!111384 (= tp!105306 b_and!48205)))

(declare-fun b!1317457 () Bool)

(declare-fun e!751667 () Bool)

(declare-fun e!751668 () Bool)

(declare-fun mapRes!55216 () Bool)

(assert (=> b!1317457 (= e!751667 (and e!751668 mapRes!55216))))

(declare-fun condMapEmpty!55216 () Bool)

(declare-datatypes ((V!52737 0))(
  ( (V!52738 (val!17937 Int)) )
))
(declare-datatypes ((ValueCell!16964 0))(
  ( (ValueCellFull!16964 (v!20559 V!52737)) (EmptyCell!16964) )
))
(declare-datatypes ((array!88465 0))(
  ( (array!88466 (arr!42708 (Array (_ BitVec 32) ValueCell!16964)) (size!43259 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88465)

(declare-fun mapDefault!55216 () ValueCell!16964)

(assert (=> b!1317457 (= condMapEmpty!55216 (= (arr!42708 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16964)) mapDefault!55216)))))

(declare-fun mapNonEmpty!55216 () Bool)

(declare-fun tp!105307 () Bool)

(declare-fun e!751669 () Bool)

(assert (=> mapNonEmpty!55216 (= mapRes!55216 (and tp!105307 e!751669))))

(declare-fun mapKey!55216 () (_ BitVec 32))

(declare-fun mapRest!55216 () (Array (_ BitVec 32) ValueCell!16964))

(declare-fun mapValue!55216 () ValueCell!16964)

(assert (=> mapNonEmpty!55216 (= (arr!42708 _values!1354) (store mapRest!55216 mapKey!55216 mapValue!55216))))

(declare-fun b!1317458 () Bool)

(declare-fun res!874244 () Bool)

(declare-fun e!751666 () Bool)

(assert (=> b!1317458 (=> (not res!874244) (not e!751666))))

(declare-datatypes ((array!88467 0))(
  ( (array!88468 (arr!42709 (Array (_ BitVec 32) (_ BitVec 64))) (size!43260 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88467)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1317458 (= res!874244 (and (= (size!43259 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43260 _keys!1628) (size!43259 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1317459 () Bool)

(declare-fun res!874249 () Bool)

(assert (=> b!1317459 (=> (not res!874249) (not e!751666))))

(declare-datatypes ((List!30313 0))(
  ( (Nil!30310) (Cons!30309 (h!31527 (_ BitVec 64)) (t!43911 List!30313)) )
))
(declare-fun arrayNoDuplicates!0 (array!88467 (_ BitVec 32) List!30313) Bool)

(assert (=> b!1317459 (= res!874249 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30310))))

(declare-fun res!874248 () Bool)

(assert (=> start!111384 (=> (not res!874248) (not e!751666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111384 (= res!874248 (validMask!0 mask!2040))))

(assert (=> start!111384 e!751666))

(assert (=> start!111384 tp!105306))

(declare-fun array_inv!32521 (array!88467) Bool)

(assert (=> start!111384 (array_inv!32521 _keys!1628)))

(assert (=> start!111384 true))

(declare-fun tp_is_empty!35725 () Bool)

(assert (=> start!111384 tp_is_empty!35725))

(declare-fun array_inv!32522 (array!88465) Bool)

(assert (=> start!111384 (and (array_inv!32522 _values!1354) e!751667)))

(declare-fun mapIsEmpty!55216 () Bool)

(assert (=> mapIsEmpty!55216 mapRes!55216))

(declare-fun b!1317460 () Bool)

(declare-fun res!874246 () Bool)

(assert (=> b!1317460 (=> (not res!874246) (not e!751666))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1317460 (= res!874246 (not (= (select (arr!42709 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1317461 () Bool)

(declare-fun res!874245 () Bool)

(assert (=> b!1317461 (=> (not res!874245) (not e!751666))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52737)

(declare-fun zeroValue!1296 () V!52737)

(declare-datatypes ((tuple2!23170 0))(
  ( (tuple2!23171 (_1!11596 (_ BitVec 64)) (_2!11596 V!52737)) )
))
(declare-datatypes ((List!30314 0))(
  ( (Nil!30311) (Cons!30310 (h!31528 tuple2!23170) (t!43912 List!30314)) )
))
(declare-datatypes ((ListLongMap!20835 0))(
  ( (ListLongMap!20836 (toList!10433 List!30314)) )
))
(declare-fun contains!8595 (ListLongMap!20835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5437 (array!88467 array!88465 (_ BitVec 32) (_ BitVec 32) V!52737 V!52737 (_ BitVec 32) Int) ListLongMap!20835)

(assert (=> b!1317461 (= res!874245 (contains!8595 (getCurrentListMap!5437 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1317462 () Bool)

(declare-fun res!874247 () Bool)

(assert (=> b!1317462 (=> (not res!874247) (not e!751666))))

(assert (=> b!1317462 (= res!874247 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1317463 () Bool)

(assert (=> b!1317463 (= e!751666 (not true))))

(assert (=> b!1317463 (contains!8595 (getCurrentListMap!5437 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43359 0))(
  ( (Unit!43360) )
))
(declare-fun lt!586478 () Unit!43359)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!16 (array!88467 array!88465 (_ BitVec 32) (_ BitVec 32) V!52737 V!52737 (_ BitVec 64) (_ BitVec 32) Int) Unit!43359)

(assert (=> b!1317463 (= lt!586478 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!16 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1317464 () Bool)

(declare-fun res!874242 () Bool)

(assert (=> b!1317464 (=> (not res!874242) (not e!751666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88467 (_ BitVec 32)) Bool)

(assert (=> b!1317464 (= res!874242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1317465 () Bool)

(declare-fun res!874250 () Bool)

(assert (=> b!1317465 (=> (not res!874250) (not e!751666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1317465 (= res!874250 (validKeyInArray!0 (select (arr!42709 _keys!1628) from!2020)))))

(declare-fun b!1317466 () Bool)

(assert (=> b!1317466 (= e!751668 tp_is_empty!35725)))

(declare-fun b!1317467 () Bool)

(assert (=> b!1317467 (= e!751669 tp_is_empty!35725)))

(declare-fun b!1317468 () Bool)

(declare-fun res!874243 () Bool)

(assert (=> b!1317468 (=> (not res!874243) (not e!751666))))

(assert (=> b!1317468 (= res!874243 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43260 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111384 res!874248) b!1317458))

(assert (= (and b!1317458 res!874244) b!1317464))

(assert (= (and b!1317464 res!874242) b!1317459))

(assert (= (and b!1317459 res!874249) b!1317468))

(assert (= (and b!1317468 res!874243) b!1317461))

(assert (= (and b!1317461 res!874245) b!1317460))

(assert (= (and b!1317460 res!874246) b!1317465))

(assert (= (and b!1317465 res!874250) b!1317462))

(assert (= (and b!1317462 res!874247) b!1317463))

(assert (= (and b!1317457 condMapEmpty!55216) mapIsEmpty!55216))

(assert (= (and b!1317457 (not condMapEmpty!55216)) mapNonEmpty!55216))

(get-info :version)

(assert (= (and mapNonEmpty!55216 ((_ is ValueCellFull!16964) mapValue!55216)) b!1317467))

(assert (= (and b!1317457 ((_ is ValueCellFull!16964) mapDefault!55216)) b!1317466))

(assert (= start!111384 b!1317457))

(declare-fun m!1205705 () Bool)

(assert (=> b!1317464 m!1205705))

(declare-fun m!1205707 () Bool)

(assert (=> mapNonEmpty!55216 m!1205707))

(declare-fun m!1205709 () Bool)

(assert (=> b!1317463 m!1205709))

(assert (=> b!1317463 m!1205709))

(declare-fun m!1205711 () Bool)

(assert (=> b!1317463 m!1205711))

(declare-fun m!1205713 () Bool)

(assert (=> b!1317463 m!1205713))

(declare-fun m!1205715 () Bool)

(assert (=> b!1317460 m!1205715))

(declare-fun m!1205717 () Bool)

(assert (=> b!1317459 m!1205717))

(declare-fun m!1205719 () Bool)

(assert (=> start!111384 m!1205719))

(declare-fun m!1205721 () Bool)

(assert (=> start!111384 m!1205721))

(declare-fun m!1205723 () Bool)

(assert (=> start!111384 m!1205723))

(declare-fun m!1205725 () Bool)

(assert (=> b!1317461 m!1205725))

(assert (=> b!1317461 m!1205725))

(declare-fun m!1205727 () Bool)

(assert (=> b!1317461 m!1205727))

(assert (=> b!1317465 m!1205715))

(assert (=> b!1317465 m!1205715))

(declare-fun m!1205729 () Bool)

(assert (=> b!1317465 m!1205729))

(check-sat (not b!1317459) (not b!1317463) tp_is_empty!35725 (not start!111384) (not b_next!29995) (not b!1317464) (not b!1317461) b_and!48205 (not mapNonEmpty!55216) (not b!1317465))
(check-sat b_and!48205 (not b_next!29995))
