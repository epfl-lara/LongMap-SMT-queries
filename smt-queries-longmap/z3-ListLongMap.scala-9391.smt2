; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111782 () Bool)

(assert start!111782)

(declare-fun b_free!30439 () Bool)

(declare-fun b_next!30439 () Bool)

(assert (=> start!111782 (= b_free!30439 (not b_next!30439))))

(declare-fun tp!106794 () Bool)

(declare-fun b_and!48959 () Bool)

(assert (=> start!111782 (= tp!106794 b_and!48959)))

(declare-fun res!879168 () Bool)

(declare-fun e!755097 () Bool)

(assert (=> start!111782 (=> (not res!879168) (not e!755097))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111782 (= res!879168 (validMask!0 mask!2019))))

(assert (=> start!111782 e!755097))

(declare-datatypes ((array!89361 0))(
  ( (array!89362 (arr!43155 (Array (_ BitVec 32) (_ BitVec 64))) (size!43707 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89361)

(declare-fun array_inv!32763 (array!89361) Bool)

(assert (=> start!111782 (array_inv!32763 _keys!1609)))

(assert (=> start!111782 true))

(declare-fun tp_is_empty!36259 () Bool)

(assert (=> start!111782 tp_is_empty!36259))

(declare-datatypes ((V!53449 0))(
  ( (V!53450 (val!18204 Int)) )
))
(declare-datatypes ((ValueCell!17231 0))(
  ( (ValueCellFull!17231 (v!20833 V!53449)) (EmptyCell!17231) )
))
(declare-datatypes ((array!89363 0))(
  ( (array!89364 (arr!43156 (Array (_ BitVec 32) ValueCell!17231)) (size!43708 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89363)

(declare-fun e!755101 () Bool)

(declare-fun array_inv!32764 (array!89363) Bool)

(assert (=> start!111782 (and (array_inv!32764 _values!1337) e!755101)))

(assert (=> start!111782 tp!106794))

(declare-fun b!1324521 () Bool)

(declare-fun res!879171 () Bool)

(assert (=> b!1324521 (=> (not res!879171) (not e!755097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89361 (_ BitVec 32)) Bool)

(assert (=> b!1324521 (= res!879171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324522 () Bool)

(declare-fun res!879169 () Bool)

(assert (=> b!1324522 (=> (not res!879169) (not e!755097))))

(declare-datatypes ((List!30673 0))(
  ( (Nil!30670) (Cons!30669 (h!31878 (_ BitVec 64)) (t!44591 List!30673)) )
))
(declare-fun arrayNoDuplicates!0 (array!89361 (_ BitVec 32) List!30673) Bool)

(assert (=> b!1324522 (= res!879169 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30670))))

(declare-fun b!1324523 () Bool)

(declare-fun e!755099 () Bool)

(declare-fun mapRes!56036 () Bool)

(assert (=> b!1324523 (= e!755101 (and e!755099 mapRes!56036))))

(declare-fun condMapEmpty!56036 () Bool)

(declare-fun mapDefault!56036 () ValueCell!17231)

(assert (=> b!1324523 (= condMapEmpty!56036 (= (arr!43156 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17231)) mapDefault!56036)))))

(declare-fun b!1324524 () Bool)

(declare-fun res!879167 () Bool)

(assert (=> b!1324524 (=> (not res!879167) (not e!755097))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324524 (= res!879167 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43707 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324525 () Bool)

(declare-fun e!755100 () Bool)

(assert (=> b!1324525 (= e!755100 tp_is_empty!36259)))

(declare-fun b!1324526 () Bool)

(assert (=> b!1324526 (= e!755099 tp_is_empty!36259)))

(declare-fun b!1324527 () Bool)

(declare-fun res!879170 () Bool)

(assert (=> b!1324527 (=> (not res!879170) (not e!755097))))

(assert (=> b!1324527 (= res!879170 (and (= (size!43708 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43707 _keys!1609) (size!43708 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56036 () Bool)

(declare-fun tp!106793 () Bool)

(assert (=> mapNonEmpty!56036 (= mapRes!56036 (and tp!106793 e!755100))))

(declare-fun mapValue!56036 () ValueCell!17231)

(declare-fun mapRest!56036 () (Array (_ BitVec 32) ValueCell!17231))

(declare-fun mapKey!56036 () (_ BitVec 32))

(assert (=> mapNonEmpty!56036 (= (arr!43156 _values!1337) (store mapRest!56036 mapKey!56036 mapValue!56036))))

(declare-fun mapIsEmpty!56036 () Bool)

(assert (=> mapIsEmpty!56036 mapRes!56036))

(declare-fun b!1324528 () Bool)

(assert (=> b!1324528 (= e!755097 false)))

(declare-fun zeroValue!1279 () V!53449)

(declare-fun minValue!1279 () V!53449)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589296 () Bool)

(declare-datatypes ((tuple2!23542 0))(
  ( (tuple2!23543 (_1!11782 (_ BitVec 64)) (_2!11782 V!53449)) )
))
(declare-datatypes ((List!30674 0))(
  ( (Nil!30671) (Cons!30670 (h!31879 tuple2!23542) (t!44592 List!30674)) )
))
(declare-datatypes ((ListLongMap!21199 0))(
  ( (ListLongMap!21200 (toList!10615 List!30674)) )
))
(declare-fun contains!8698 (ListLongMap!21199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5494 (array!89361 array!89363 (_ BitVec 32) (_ BitVec 32) V!53449 V!53449 (_ BitVec 32) Int) ListLongMap!21199)

(assert (=> b!1324528 (= lt!589296 (contains!8698 (getCurrentListMap!5494 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111782 res!879168) b!1324527))

(assert (= (and b!1324527 res!879170) b!1324521))

(assert (= (and b!1324521 res!879171) b!1324522))

(assert (= (and b!1324522 res!879169) b!1324524))

(assert (= (and b!1324524 res!879167) b!1324528))

(assert (= (and b!1324523 condMapEmpty!56036) mapIsEmpty!56036))

(assert (= (and b!1324523 (not condMapEmpty!56036)) mapNonEmpty!56036))

(get-info :version)

(assert (= (and mapNonEmpty!56036 ((_ is ValueCellFull!17231) mapValue!56036)) b!1324525))

(assert (= (and b!1324523 ((_ is ValueCellFull!17231) mapDefault!56036)) b!1324526))

(assert (= start!111782 b!1324523))

(declare-fun m!1212879 () Bool)

(assert (=> start!111782 m!1212879))

(declare-fun m!1212881 () Bool)

(assert (=> start!111782 m!1212881))

(declare-fun m!1212883 () Bool)

(assert (=> start!111782 m!1212883))

(declare-fun m!1212885 () Bool)

(assert (=> mapNonEmpty!56036 m!1212885))

(declare-fun m!1212887 () Bool)

(assert (=> b!1324521 m!1212887))

(declare-fun m!1212889 () Bool)

(assert (=> b!1324528 m!1212889))

(assert (=> b!1324528 m!1212889))

(declare-fun m!1212891 () Bool)

(assert (=> b!1324528 m!1212891))

(declare-fun m!1212893 () Bool)

(assert (=> b!1324522 m!1212893))

(check-sat (not b_next!30439) (not start!111782) (not b!1324528) tp_is_empty!36259 (not mapNonEmpty!56036) b_and!48959 (not b!1324521) (not b!1324522))
(check-sat b_and!48959 (not b_next!30439))
