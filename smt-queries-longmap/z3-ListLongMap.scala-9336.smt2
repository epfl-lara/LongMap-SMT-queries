; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111454 () Bool)

(assert start!111454)

(declare-fun b_free!30111 () Bool)

(declare-fun b_next!30111 () Bool)

(assert (=> start!111454 (= b_free!30111 (not b_next!30111))))

(declare-fun tp!105808 () Bool)

(declare-fun b_and!48381 () Bool)

(assert (=> start!111454 (= tp!105808 b_and!48381)))

(declare-fun b!1319160 () Bool)

(declare-fun res!875513 () Bool)

(declare-fun e!752671 () Bool)

(assert (=> b!1319160 (=> (not res!875513) (not e!752671))))

(declare-datatypes ((array!88800 0))(
  ( (array!88801 (arr!42874 (Array (_ BitVec 32) (_ BitVec 64))) (size!43424 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88800)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319160 (= res!875513 (validKeyInArray!0 (select (arr!42874 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55544 () Bool)

(declare-fun mapRes!55544 () Bool)

(assert (=> mapIsEmpty!55544 mapRes!55544))

(declare-fun b!1319162 () Bool)

(declare-fun res!875511 () Bool)

(assert (=> b!1319162 (=> (not res!875511) (not e!752671))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53011 0))(
  ( (V!53012 (val!18040 Int)) )
))
(declare-datatypes ((ValueCell!17067 0))(
  ( (ValueCellFull!17067 (v!20670 V!53011)) (EmptyCell!17067) )
))
(declare-datatypes ((array!88802 0))(
  ( (array!88803 (arr!42875 (Array (_ BitVec 32) ValueCell!17067)) (size!43425 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88802)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319162 (= res!875511 (and (= (size!43425 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43424 _keys!1609) (size!43425 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319163 () Bool)

(declare-fun res!875514 () Bool)

(assert (=> b!1319163 (=> (not res!875514) (not e!752671))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319163 (= res!875514 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43424 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319164 () Bool)

(declare-fun res!875515 () Bool)

(assert (=> b!1319164 (=> (not res!875515) (not e!752671))))

(declare-fun zeroValue!1279 () V!53011)

(declare-fun minValue!1279 () V!53011)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23214 0))(
  ( (tuple2!23215 (_1!11618 (_ BitVec 64)) (_2!11618 V!53011)) )
))
(declare-datatypes ((List!30368 0))(
  ( (Nil!30365) (Cons!30364 (h!31573 tuple2!23214) (t!44028 List!30368)) )
))
(declare-datatypes ((ListLongMap!20871 0))(
  ( (ListLongMap!20872 (toList!10451 List!30368)) )
))
(declare-fun contains!8606 (ListLongMap!20871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5462 (array!88800 array!88802 (_ BitVec 32) (_ BitVec 32) V!53011 V!53011 (_ BitVec 32) Int) ListLongMap!20871)

(assert (=> b!1319164 (= res!875515 (contains!8606 (getCurrentListMap!5462 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55544 () Bool)

(declare-fun tp!105809 () Bool)

(declare-fun e!752672 () Bool)

(assert (=> mapNonEmpty!55544 (= mapRes!55544 (and tp!105809 e!752672))))

(declare-fun mapRest!55544 () (Array (_ BitVec 32) ValueCell!17067))

(declare-fun mapKey!55544 () (_ BitVec 32))

(declare-fun mapValue!55544 () ValueCell!17067)

(assert (=> mapNonEmpty!55544 (= (arr!42875 _values!1337) (store mapRest!55544 mapKey!55544 mapValue!55544))))

(declare-fun b!1319165 () Bool)

(assert (=> b!1319165 (= e!752671 (not true))))

(declare-fun lt!586593 () ListLongMap!20871)

(assert (=> b!1319165 (contains!8606 lt!586593 k0!1164)))

(declare-datatypes ((Unit!43444 0))(
  ( (Unit!43445) )
))
(declare-fun lt!586592 () Unit!43444)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!108 ((_ BitVec 64) (_ BitVec 64) V!53011 ListLongMap!20871) Unit!43444)

(assert (=> b!1319165 (= lt!586592 (lemmaInListMapAfterAddingDiffThenInBefore!108 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586593))))

(declare-fun +!4512 (ListLongMap!20871 tuple2!23214) ListLongMap!20871)

(declare-fun getCurrentListMapNoExtraKeys!6147 (array!88800 array!88802 (_ BitVec 32) (_ BitVec 32) V!53011 V!53011 (_ BitVec 32) Int) ListLongMap!20871)

(declare-fun get!21540 (ValueCell!17067 V!53011) V!53011)

(declare-fun dynLambda!3451 (Int (_ BitVec 64)) V!53011)

(assert (=> b!1319165 (= lt!586593 (+!4512 (+!4512 (getCurrentListMapNoExtraKeys!6147 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23215 (select (arr!42874 _keys!1609) from!2000) (get!21540 (select (arr!42875 _values!1337) from!2000) (dynLambda!3451 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319166 () Bool)

(declare-fun e!752674 () Bool)

(declare-fun e!752670 () Bool)

(assert (=> b!1319166 (= e!752674 (and e!752670 mapRes!55544))))

(declare-fun condMapEmpty!55544 () Bool)

(declare-fun mapDefault!55544 () ValueCell!17067)

(assert (=> b!1319166 (= condMapEmpty!55544 (= (arr!42875 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17067)) mapDefault!55544)))))

(declare-fun b!1319167 () Bool)

(declare-fun tp_is_empty!35931 () Bool)

(assert (=> b!1319167 (= e!752672 tp_is_empty!35931)))

(declare-fun b!1319168 () Bool)

(declare-fun res!875512 () Bool)

(assert (=> b!1319168 (=> (not res!875512) (not e!752671))))

(declare-datatypes ((List!30369 0))(
  ( (Nil!30366) (Cons!30365 (h!31574 (_ BitVec 64)) (t!44029 List!30369)) )
))
(declare-fun arrayNoDuplicates!0 (array!88800 (_ BitVec 32) List!30369) Bool)

(assert (=> b!1319168 (= res!875512 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30366))))

(declare-fun b!1319161 () Bool)

(assert (=> b!1319161 (= e!752670 tp_is_empty!35931)))

(declare-fun res!875509 () Bool)

(assert (=> start!111454 (=> (not res!875509) (not e!752671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111454 (= res!875509 (validMask!0 mask!2019))))

(assert (=> start!111454 e!752671))

(declare-fun array_inv!32369 (array!88800) Bool)

(assert (=> start!111454 (array_inv!32369 _keys!1609)))

(assert (=> start!111454 true))

(assert (=> start!111454 tp_is_empty!35931))

(declare-fun array_inv!32370 (array!88802) Bool)

(assert (=> start!111454 (and (array_inv!32370 _values!1337) e!752674)))

(assert (=> start!111454 tp!105808))

(declare-fun b!1319169 () Bool)

(declare-fun res!875516 () Bool)

(assert (=> b!1319169 (=> (not res!875516) (not e!752671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88800 (_ BitVec 32)) Bool)

(assert (=> b!1319169 (= res!875516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319170 () Bool)

(declare-fun res!875510 () Bool)

(assert (=> b!1319170 (=> (not res!875510) (not e!752671))))

(assert (=> b!1319170 (= res!875510 (not (= (select (arr!42874 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111454 res!875509) b!1319162))

(assert (= (and b!1319162 res!875511) b!1319169))

(assert (= (and b!1319169 res!875516) b!1319168))

(assert (= (and b!1319168 res!875512) b!1319163))

(assert (= (and b!1319163 res!875514) b!1319164))

(assert (= (and b!1319164 res!875515) b!1319170))

(assert (= (and b!1319170 res!875510) b!1319160))

(assert (= (and b!1319160 res!875513) b!1319165))

(assert (= (and b!1319166 condMapEmpty!55544) mapIsEmpty!55544))

(assert (= (and b!1319166 (not condMapEmpty!55544)) mapNonEmpty!55544))

(get-info :version)

(assert (= (and mapNonEmpty!55544 ((_ is ValueCellFull!17067) mapValue!55544)) b!1319167))

(assert (= (and b!1319166 ((_ is ValueCellFull!17067) mapDefault!55544)) b!1319161))

(assert (= start!111454 b!1319166))

(declare-fun b_lambda!23437 () Bool)

(assert (=> (not b_lambda!23437) (not b!1319165)))

(declare-fun t!44027 () Bool)

(declare-fun tb!11463 () Bool)

(assert (=> (and start!111454 (= defaultEntry!1340 defaultEntry!1340) t!44027) tb!11463))

(declare-fun result!23981 () Bool)

(assert (=> tb!11463 (= result!23981 tp_is_empty!35931)))

(assert (=> b!1319165 t!44027))

(declare-fun b_and!48383 () Bool)

(assert (= b_and!48381 (and (=> t!44027 result!23981) b_and!48383)))

(declare-fun m!1206747 () Bool)

(assert (=> b!1319164 m!1206747))

(assert (=> b!1319164 m!1206747))

(declare-fun m!1206749 () Bool)

(assert (=> b!1319164 m!1206749))

(declare-fun m!1206751 () Bool)

(assert (=> b!1319160 m!1206751))

(assert (=> b!1319160 m!1206751))

(declare-fun m!1206753 () Bool)

(assert (=> b!1319160 m!1206753))

(declare-fun m!1206755 () Bool)

(assert (=> start!111454 m!1206755))

(declare-fun m!1206757 () Bool)

(assert (=> start!111454 m!1206757))

(declare-fun m!1206759 () Bool)

(assert (=> start!111454 m!1206759))

(declare-fun m!1206761 () Bool)

(assert (=> b!1319168 m!1206761))

(declare-fun m!1206763 () Bool)

(assert (=> b!1319165 m!1206763))

(declare-fun m!1206765 () Bool)

(assert (=> b!1319165 m!1206765))

(declare-fun m!1206767 () Bool)

(assert (=> b!1319165 m!1206767))

(declare-fun m!1206769 () Bool)

(assert (=> b!1319165 m!1206769))

(declare-fun m!1206771 () Bool)

(assert (=> b!1319165 m!1206771))

(assert (=> b!1319165 m!1206767))

(assert (=> b!1319165 m!1206765))

(declare-fun m!1206773 () Bool)

(assert (=> b!1319165 m!1206773))

(declare-fun m!1206775 () Bool)

(assert (=> b!1319165 m!1206775))

(assert (=> b!1319165 m!1206751))

(declare-fun m!1206777 () Bool)

(assert (=> b!1319165 m!1206777))

(assert (=> b!1319165 m!1206763))

(assert (=> b!1319165 m!1206769))

(declare-fun m!1206779 () Bool)

(assert (=> b!1319169 m!1206779))

(declare-fun m!1206781 () Bool)

(assert (=> mapNonEmpty!55544 m!1206781))

(assert (=> b!1319170 m!1206751))

(check-sat (not b!1319160) (not b!1319168) (not b!1319169) (not b_lambda!23437) (not start!111454) (not b!1319164) tp_is_empty!35931 (not mapNonEmpty!55544) (not b!1319165) (not b_next!30111) b_and!48383)
(check-sat b_and!48383 (not b_next!30111))
