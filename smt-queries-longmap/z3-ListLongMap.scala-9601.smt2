; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113528 () Bool)

(assert start!113528)

(declare-fun b_free!31521 () Bool)

(declare-fun b_next!31521 () Bool)

(assert (=> start!113528 (= b_free!31521 (not b_next!31521))))

(declare-fun tp!110372 () Bool)

(declare-fun b_and!50831 () Bool)

(assert (=> start!113528 (= tp!110372 b_and!50831)))

(declare-fun b!1347541 () Bool)

(declare-fun res!894087 () Bool)

(declare-fun e!766709 () Bool)

(assert (=> b!1347541 (=> (not res!894087) (not e!766709))))

(declare-datatypes ((array!91876 0))(
  ( (array!91877 (arr!44393 (Array (_ BitVec 32) (_ BitVec 64))) (size!44943 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91876)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347541 (= res!894087 (validKeyInArray!0 (select (arr!44393 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57992 () Bool)

(declare-fun mapRes!57992 () Bool)

(declare-fun tp!110371 () Bool)

(declare-fun e!766711 () Bool)

(assert (=> mapNonEmpty!57992 (= mapRes!57992 (and tp!110371 e!766711))))

(declare-fun mapKey!57992 () (_ BitVec 32))

(declare-datatypes ((V!55131 0))(
  ( (V!55132 (val!18835 Int)) )
))
(declare-datatypes ((ValueCell!17862 0))(
  ( (ValueCellFull!17862 (v!21486 V!55131)) (EmptyCell!17862) )
))
(declare-datatypes ((array!91878 0))(
  ( (array!91879 (arr!44394 (Array (_ BitVec 32) ValueCell!17862)) (size!44944 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91878)

(declare-fun mapValue!57992 () ValueCell!17862)

(declare-fun mapRest!57992 () (Array (_ BitVec 32) ValueCell!17862))

(assert (=> mapNonEmpty!57992 (= (arr!44394 _values!1303) (store mapRest!57992 mapKey!57992 mapValue!57992))))

(declare-fun b!1347542 () Bool)

(declare-fun e!766710 () Bool)

(declare-fun tp_is_empty!37521 () Bool)

(assert (=> b!1347542 (= e!766710 tp_is_empty!37521)))

(declare-fun b!1347543 () Bool)

(declare-fun res!894089 () Bool)

(assert (=> b!1347543 (=> (not res!894089) (not e!766709))))

(declare-fun minValue!1245 () V!55131)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55131)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24282 0))(
  ( (tuple2!24283 (_1!12152 (_ BitVec 64)) (_2!12152 V!55131)) )
))
(declare-datatypes ((List!31437 0))(
  ( (Nil!31434) (Cons!31433 (h!32642 tuple2!24282) (t!46037 List!31437)) )
))
(declare-datatypes ((ListLongMap!21939 0))(
  ( (ListLongMap!21940 (toList!10985 List!31437)) )
))
(declare-fun contains!9163 (ListLongMap!21939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5936 (array!91876 array!91878 (_ BitVec 32) (_ BitVec 32) V!55131 V!55131 (_ BitVec 32) Int) ListLongMap!21939)

(assert (=> b!1347543 (= res!894089 (contains!9163 (getCurrentListMap!5936 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347544 () Bool)

(assert (=> b!1347544 (= e!766709 false)))

(declare-fun lt!595825 () Bool)

(declare-fun +!4840 (ListLongMap!21939 tuple2!24282) ListLongMap!21939)

(declare-fun getCurrentListMapNoExtraKeys!6486 (array!91876 array!91878 (_ BitVec 32) (_ BitVec 32) V!55131 V!55131 (_ BitVec 32) Int) ListLongMap!21939)

(declare-fun get!22422 (ValueCell!17862 V!55131) V!55131)

(declare-fun dynLambda!3779 (Int (_ BitVec 64)) V!55131)

(assert (=> b!1347544 (= lt!595825 (contains!9163 (+!4840 (+!4840 (getCurrentListMapNoExtraKeys!6486 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24283 (select (arr!44393 _keys!1571) from!1960) (get!22422 (select (arr!44394 _values!1303) from!1960) (dynLambda!3779 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1347545 () Bool)

(declare-fun e!766708 () Bool)

(assert (=> b!1347545 (= e!766708 (and e!766710 mapRes!57992))))

(declare-fun condMapEmpty!57992 () Bool)

(declare-fun mapDefault!57992 () ValueCell!17862)

(assert (=> b!1347545 (= condMapEmpty!57992 (= (arr!44394 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17862)) mapDefault!57992)))))

(declare-fun res!894094 () Bool)

(assert (=> start!113528 (=> (not res!894094) (not e!766709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113528 (= res!894094 (validMask!0 mask!1977))))

(assert (=> start!113528 e!766709))

(assert (=> start!113528 tp_is_empty!37521))

(assert (=> start!113528 true))

(declare-fun array_inv!33445 (array!91876) Bool)

(assert (=> start!113528 (array_inv!33445 _keys!1571)))

(declare-fun array_inv!33446 (array!91878) Bool)

(assert (=> start!113528 (and (array_inv!33446 _values!1303) e!766708)))

(assert (=> start!113528 tp!110372))

(declare-fun b!1347546 () Bool)

(declare-fun res!894088 () Bool)

(assert (=> b!1347546 (=> (not res!894088) (not e!766709))))

(assert (=> b!1347546 (= res!894088 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44943 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347547 () Bool)

(declare-fun res!894092 () Bool)

(assert (=> b!1347547 (=> (not res!894092) (not e!766709))))

(assert (=> b!1347547 (= res!894092 (not (= (select (arr!44393 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347548 () Bool)

(declare-fun res!894091 () Bool)

(assert (=> b!1347548 (=> (not res!894091) (not e!766709))))

(declare-datatypes ((List!31438 0))(
  ( (Nil!31435) (Cons!31434 (h!32643 (_ BitVec 64)) (t!46038 List!31438)) )
))
(declare-fun arrayNoDuplicates!0 (array!91876 (_ BitVec 32) List!31438) Bool)

(assert (=> b!1347548 (= res!894091 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31435))))

(declare-fun mapIsEmpty!57992 () Bool)

(assert (=> mapIsEmpty!57992 mapRes!57992))

(declare-fun b!1347549 () Bool)

(declare-fun res!894090 () Bool)

(assert (=> b!1347549 (=> (not res!894090) (not e!766709))))

(assert (=> b!1347549 (= res!894090 (and (= (size!44944 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44943 _keys!1571) (size!44944 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347550 () Bool)

(declare-fun res!894095 () Bool)

(assert (=> b!1347550 (=> (not res!894095) (not e!766709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91876 (_ BitVec 32)) Bool)

(assert (=> b!1347550 (= res!894095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347551 () Bool)

(assert (=> b!1347551 (= e!766711 tp_is_empty!37521)))

(declare-fun b!1347552 () Bool)

(declare-fun res!894093 () Bool)

(assert (=> b!1347552 (=> (not res!894093) (not e!766709))))

(assert (=> b!1347552 (= res!894093 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113528 res!894094) b!1347549))

(assert (= (and b!1347549 res!894090) b!1347550))

(assert (= (and b!1347550 res!894095) b!1347548))

(assert (= (and b!1347548 res!894091) b!1347546))

(assert (= (and b!1347546 res!894088) b!1347543))

(assert (= (and b!1347543 res!894089) b!1347547))

(assert (= (and b!1347547 res!894092) b!1347541))

(assert (= (and b!1347541 res!894087) b!1347552))

(assert (= (and b!1347552 res!894093) b!1347544))

(assert (= (and b!1347545 condMapEmpty!57992) mapIsEmpty!57992))

(assert (= (and b!1347545 (not condMapEmpty!57992)) mapNonEmpty!57992))

(get-info :version)

(assert (= (and mapNonEmpty!57992 ((_ is ValueCellFull!17862) mapValue!57992)) b!1347551))

(assert (= (and b!1347545 ((_ is ValueCellFull!17862) mapDefault!57992)) b!1347542))

(assert (= start!113528 b!1347545))

(declare-fun b_lambda!24595 () Bool)

(assert (=> (not b_lambda!24595) (not b!1347544)))

(declare-fun t!46036 () Bool)

(declare-fun tb!12403 () Bool)

(assert (=> (and start!113528 (= defaultEntry!1306 defaultEntry!1306) t!46036) tb!12403))

(declare-fun result!25899 () Bool)

(assert (=> tb!12403 (= result!25899 tp_is_empty!37521)))

(assert (=> b!1347544 t!46036))

(declare-fun b_and!50833 () Bool)

(assert (= b_and!50831 (and (=> t!46036 result!25899) b_and!50833)))

(declare-fun m!1234617 () Bool)

(assert (=> b!1347541 m!1234617))

(assert (=> b!1347541 m!1234617))

(declare-fun m!1234619 () Bool)

(assert (=> b!1347541 m!1234619))

(declare-fun m!1234621 () Bool)

(assert (=> b!1347543 m!1234621))

(assert (=> b!1347543 m!1234621))

(declare-fun m!1234623 () Bool)

(assert (=> b!1347543 m!1234623))

(declare-fun m!1234625 () Bool)

(assert (=> b!1347550 m!1234625))

(declare-fun m!1234627 () Bool)

(assert (=> mapNonEmpty!57992 m!1234627))

(declare-fun m!1234629 () Bool)

(assert (=> b!1347548 m!1234629))

(assert (=> b!1347547 m!1234617))

(declare-fun m!1234631 () Bool)

(assert (=> b!1347544 m!1234631))

(declare-fun m!1234633 () Bool)

(assert (=> b!1347544 m!1234633))

(declare-fun m!1234635 () Bool)

(assert (=> b!1347544 m!1234635))

(declare-fun m!1234637 () Bool)

(assert (=> b!1347544 m!1234637))

(declare-fun m!1234639 () Bool)

(assert (=> b!1347544 m!1234639))

(declare-fun m!1234641 () Bool)

(assert (=> b!1347544 m!1234641))

(assert (=> b!1347544 m!1234635))

(declare-fun m!1234643 () Bool)

(assert (=> b!1347544 m!1234643))

(assert (=> b!1347544 m!1234637))

(assert (=> b!1347544 m!1234639))

(assert (=> b!1347544 m!1234617))

(assert (=> b!1347544 m!1234643))

(assert (=> b!1347544 m!1234631))

(declare-fun m!1234645 () Bool)

(assert (=> start!113528 m!1234645))

(declare-fun m!1234647 () Bool)

(assert (=> start!113528 m!1234647))

(declare-fun m!1234649 () Bool)

(assert (=> start!113528 m!1234649))

(check-sat (not b!1347550) tp_is_empty!37521 (not b!1347544) (not mapNonEmpty!57992) (not start!113528) (not b!1347541) (not b_next!31521) (not b!1347548) (not b!1347543) (not b_lambda!24595) b_and!50833)
(check-sat b_and!50833 (not b_next!31521))
