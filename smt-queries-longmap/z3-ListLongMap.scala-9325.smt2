; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111386 () Bool)

(assert start!111386)

(declare-fun b_free!30043 () Bool)

(declare-fun b_next!30043 () Bool)

(assert (=> start!111386 (= b_free!30043 (not b_next!30043))))

(declare-fun tp!105605 () Bool)

(declare-fun b_and!48245 () Bool)

(assert (=> start!111386 (= tp!105605 b_and!48245)))

(declare-fun res!874715 () Bool)

(declare-fun e!752130 () Bool)

(assert (=> start!111386 (=> (not res!874715) (not e!752130))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111386 (= res!874715 (validMask!0 mask!2019))))

(assert (=> start!111386 e!752130))

(declare-datatypes ((array!88595 0))(
  ( (array!88596 (arr!42772 (Array (_ BitVec 32) (_ BitVec 64))) (size!43324 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88595)

(declare-fun array_inv!32481 (array!88595) Bool)

(assert (=> start!111386 (array_inv!32481 _keys!1609)))

(assert (=> start!111386 true))

(declare-fun tp_is_empty!35863 () Bool)

(assert (=> start!111386 tp_is_empty!35863))

(declare-datatypes ((V!52921 0))(
  ( (V!52922 (val!18006 Int)) )
))
(declare-datatypes ((ValueCell!17033 0))(
  ( (ValueCellFull!17033 (v!20635 V!52921)) (EmptyCell!17033) )
))
(declare-datatypes ((array!88597 0))(
  ( (array!88598 (arr!42773 (Array (_ BitVec 32) ValueCell!17033)) (size!43325 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88597)

(declare-fun e!752128 () Bool)

(declare-fun array_inv!32482 (array!88597) Bool)

(assert (=> start!111386 (and (array_inv!32482 _values!1337) e!752128)))

(assert (=> start!111386 tp!105605))

(declare-fun b!1317966 () Bool)

(declare-fun res!874716 () Bool)

(assert (=> b!1317966 (=> (not res!874716) (not e!752130))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317966 (= res!874716 (and (= (size!43325 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43324 _keys!1609) (size!43325 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317967 () Bool)

(declare-fun res!874714 () Bool)

(assert (=> b!1317967 (=> (not res!874714) (not e!752130))))

(declare-datatypes ((List!30393 0))(
  ( (Nil!30390) (Cons!30389 (h!31598 (_ BitVec 64)) (t!43993 List!30393)) )
))
(declare-fun arrayNoDuplicates!0 (array!88595 (_ BitVec 32) List!30393) Bool)

(assert (=> b!1317967 (= res!874714 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30390))))

(declare-fun mapIsEmpty!55442 () Bool)

(declare-fun mapRes!55442 () Bool)

(assert (=> mapIsEmpty!55442 mapRes!55442))

(declare-fun b!1317968 () Bool)

(declare-fun res!874713 () Bool)

(assert (=> b!1317968 (=> (not res!874713) (not e!752130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88595 (_ BitVec 32)) Bool)

(assert (=> b!1317968 (= res!874713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317969 () Bool)

(declare-fun e!752129 () Bool)

(assert (=> b!1317969 (= e!752129 tp_is_empty!35863)))

(declare-fun b!1317970 () Bool)

(declare-fun e!752131 () Bool)

(assert (=> b!1317970 (= e!752131 tp_is_empty!35863)))

(declare-fun b!1317971 () Bool)

(assert (=> b!1317971 (= e!752128 (and e!752129 mapRes!55442))))

(declare-fun condMapEmpty!55442 () Bool)

(declare-fun mapDefault!55442 () ValueCell!17033)

(assert (=> b!1317971 (= condMapEmpty!55442 (= (arr!42773 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17033)) mapDefault!55442)))))

(declare-fun b!1317972 () Bool)

(declare-fun res!874712 () Bool)

(assert (=> b!1317972 (=> (not res!874712) (not e!752130))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1317972 (= res!874712 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43324 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55442 () Bool)

(declare-fun tp!105606 () Bool)

(assert (=> mapNonEmpty!55442 (= mapRes!55442 (and tp!105606 e!752131))))

(declare-fun mapRest!55442 () (Array (_ BitVec 32) ValueCell!17033))

(declare-fun mapKey!55442 () (_ BitVec 32))

(declare-fun mapValue!55442 () ValueCell!17033)

(assert (=> mapNonEmpty!55442 (= (arr!42773 _values!1337) (store mapRest!55442 mapKey!55442 mapValue!55442))))

(declare-fun b!1317973 () Bool)

(assert (=> b!1317973 (= e!752130 false)))

(declare-fun zeroValue!1279 () V!52921)

(declare-fun minValue!1279 () V!52921)

(declare-fun lt!586254 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23254 0))(
  ( (tuple2!23255 (_1!11638 (_ BitVec 64)) (_2!11638 V!52921)) )
))
(declare-datatypes ((List!30394 0))(
  ( (Nil!30391) (Cons!30390 (h!31599 tuple2!23254) (t!43994 List!30394)) )
))
(declare-datatypes ((ListLongMap!20911 0))(
  ( (ListLongMap!20912 (toList!10471 List!30394)) )
))
(declare-fun contains!8554 (ListLongMap!20911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5366 (array!88595 array!88597 (_ BitVec 32) (_ BitVec 32) V!52921 V!52921 (_ BitVec 32) Int) ListLongMap!20911)

(assert (=> b!1317973 (= lt!586254 (contains!8554 (getCurrentListMap!5366 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111386 res!874715) b!1317966))

(assert (= (and b!1317966 res!874716) b!1317968))

(assert (= (and b!1317968 res!874713) b!1317967))

(assert (= (and b!1317967 res!874714) b!1317972))

(assert (= (and b!1317972 res!874712) b!1317973))

(assert (= (and b!1317971 condMapEmpty!55442) mapIsEmpty!55442))

(assert (= (and b!1317971 (not condMapEmpty!55442)) mapNonEmpty!55442))

(get-info :version)

(assert (= (and mapNonEmpty!55442 ((_ is ValueCellFull!17033) mapValue!55442)) b!1317970))

(assert (= (and b!1317971 ((_ is ValueCellFull!17033) mapDefault!55442)) b!1317969))

(assert (= start!111386 b!1317971))

(declare-fun m!1205175 () Bool)

(assert (=> b!1317967 m!1205175))

(declare-fun m!1205177 () Bool)

(assert (=> b!1317968 m!1205177))

(declare-fun m!1205179 () Bool)

(assert (=> mapNonEmpty!55442 m!1205179))

(declare-fun m!1205181 () Bool)

(assert (=> start!111386 m!1205181))

(declare-fun m!1205183 () Bool)

(assert (=> start!111386 m!1205183))

(declare-fun m!1205185 () Bool)

(assert (=> start!111386 m!1205185))

(declare-fun m!1205187 () Bool)

(assert (=> b!1317973 m!1205187))

(assert (=> b!1317973 m!1205187))

(declare-fun m!1205189 () Bool)

(assert (=> b!1317973 m!1205189))

(check-sat (not mapNonEmpty!55442) (not start!111386) b_and!48245 tp_is_empty!35863 (not b_next!30043) (not b!1317968) (not b!1317973) (not b!1317967))
(check-sat b_and!48245 (not b_next!30043))
