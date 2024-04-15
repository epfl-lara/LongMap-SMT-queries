; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131948 () Bool)

(assert start!131948)

(declare-fun b_free!31711 () Bool)

(declare-fun b_next!31711 () Bool)

(assert (=> start!131948 (= b_free!31711 (not b_next!31711))))

(declare-fun tp!111386 () Bool)

(declare-fun b_and!51103 () Bool)

(assert (=> start!131948 (= tp!111386 b_and!51103)))

(declare-fun mapIsEmpty!58684 () Bool)

(declare-fun mapRes!58684 () Bool)

(assert (=> mapIsEmpty!58684 mapRes!58684))

(declare-fun b!1546192 () Bool)

(declare-fun e!860631 () Bool)

(declare-fun tp_is_empty!37987 () Bool)

(assert (=> b!1546192 (= e!860631 tp_is_empty!37987)))

(declare-fun b!1546193 () Bool)

(declare-datatypes ((V!59093 0))(
  ( (V!59094 (val!19071 Int)) )
))
(declare-datatypes ((tuple2!24600 0))(
  ( (tuple2!24601 (_1!12311 (_ BitVec 64)) (_2!12311 V!59093)) )
))
(declare-datatypes ((List!36072 0))(
  ( (Nil!36069) (Cons!36068 (h!37514 tuple2!24600) (t!50758 List!36072)) )
))
(declare-datatypes ((ListLongMap!22209 0))(
  ( (ListLongMap!22210 (toList!11120 List!36072)) )
))
(declare-fun e!860623 () ListLongMap!22209)

(declare-fun call!69526 () ListLongMap!22209)

(assert (=> b!1546193 (= e!860623 call!69526)))

(declare-fun b!1546194 () Bool)

(declare-fun res!1060146 () Bool)

(declare-fun e!860627 () Bool)

(assert (=> b!1546194 (=> (not res!1060146) (not e!860627))))

(declare-datatypes ((array!103108 0))(
  ( (array!103109 (arr!49757 (Array (_ BitVec 32) (_ BitVec 64))) (size!50309 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103108)

(declare-datatypes ((List!36073 0))(
  ( (Nil!36070) (Cons!36069 (h!37515 (_ BitVec 64)) (t!50759 List!36073)) )
))
(declare-fun arrayNoDuplicates!0 (array!103108 (_ BitVec 32) List!36073) Bool)

(assert (=> b!1546194 (= res!1060146 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36070))))

(declare-fun b!1546195 () Bool)

(declare-fun e!860625 () ListLongMap!22209)

(assert (=> b!1546195 (= e!860625 call!69526)))

(declare-fun b!1546196 () Bool)

(declare-fun e!860629 () ListLongMap!22209)

(assert (=> b!1546196 (= e!860629 e!860625)))

(declare-fun c!141740 () Bool)

(declare-fun lt!666298 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546196 (= c!141740 (and (not lt!666298) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546197 () Bool)

(declare-fun e!860628 () Bool)

(declare-fun e!860624 () Bool)

(assert (=> b!1546197 (= e!860628 (and e!860624 mapRes!58684))))

(declare-fun condMapEmpty!58684 () Bool)

(declare-datatypes ((ValueCell!18083 0))(
  ( (ValueCellFull!18083 (v!21868 V!59093)) (EmptyCell!18083) )
))
(declare-datatypes ((array!103110 0))(
  ( (array!103111 (arr!49758 (Array (_ BitVec 32) ValueCell!18083)) (size!50310 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103110)

(declare-fun mapDefault!58684 () ValueCell!18083)

(assert (=> b!1546197 (= condMapEmpty!58684 (= (arr!49758 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18083)) mapDefault!58684)))))

(declare-fun b!1546198 () Bool)

(declare-fun e!860630 () Bool)

(assert (=> b!1546198 (= e!860627 e!860630)))

(declare-fun res!1060143 () Bool)

(assert (=> b!1546198 (=> (not res!1060143) (not e!860630))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546198 (= res!1060143 (bvslt from!762 (size!50309 _keys!618)))))

(declare-fun lt!666301 () ListLongMap!22209)

(assert (=> b!1546198 (= lt!666301 e!860629)))

(declare-fun c!141739 () Bool)

(assert (=> b!1546198 (= c!141739 (and (not lt!666298) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546198 (= lt!666298 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546199 () Bool)

(assert (=> b!1546199 (= e!860630 (not true))))

(declare-fun lt!666299 () ListLongMap!22209)

(declare-fun lt!666297 () Bool)

(declare-fun contains!10007 (ListLongMap!22209 (_ BitVec 64)) Bool)

(assert (=> b!1546199 (= lt!666297 (contains!10007 lt!666299 (select (arr!49757 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59093)

(declare-fun +!4947 (ListLongMap!22209 tuple2!24600) ListLongMap!22209)

(assert (=> b!1546199 (contains!10007 (+!4947 lt!666299 (tuple2!24601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49757 _keys!618) from!762))))

(declare-datatypes ((Unit!51361 0))(
  ( (Unit!51362) )
))
(declare-fun lt!666300 () Unit!51361)

(declare-fun addStillContains!1230 (ListLongMap!22209 (_ BitVec 64) V!59093 (_ BitVec 64)) Unit!51361)

(assert (=> b!1546199 (= lt!666300 (addStillContains!1230 lt!666299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49757 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59093)

(declare-fun getCurrentListMapNoExtraKeys!6575 (array!103108 array!103110 (_ BitVec 32) (_ BitVec 32) V!59093 V!59093 (_ BitVec 32) Int) ListLongMap!22209)

(assert (=> b!1546199 (= lt!666299 (getCurrentListMapNoExtraKeys!6575 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060144 () Bool)

(assert (=> start!131948 (=> (not res!1060144) (not e!860627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131948 (= res!1060144 (validMask!0 mask!926))))

(assert (=> start!131948 e!860627))

(declare-fun array_inv!38895 (array!103108) Bool)

(assert (=> start!131948 (array_inv!38895 _keys!618)))

(assert (=> start!131948 tp_is_empty!37987))

(assert (=> start!131948 true))

(assert (=> start!131948 tp!111386))

(declare-fun array_inv!38896 (array!103110) Bool)

(assert (=> start!131948 (and (array_inv!38896 _values!470) e!860628)))

(declare-fun b!1546200 () Bool)

(declare-fun call!69525 () ListLongMap!22209)

(assert (=> b!1546200 (= e!860629 (+!4947 call!69525 (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69522 () Bool)

(declare-fun call!69527 () ListLongMap!22209)

(declare-fun call!69528 () ListLongMap!22209)

(assert (=> bm!69522 (= call!69527 call!69528)))

(declare-fun bm!69523 () Bool)

(assert (=> bm!69523 (= call!69526 call!69525)))

(declare-fun b!1546201 () Bool)

(declare-fun res!1060149 () Bool)

(assert (=> b!1546201 (=> (not res!1060149) (not e!860630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546201 (= res!1060149 (validKeyInArray!0 (select (arr!49757 _keys!618) from!762)))))

(declare-fun b!1546202 () Bool)

(declare-fun res!1060147 () Bool)

(assert (=> b!1546202 (=> (not res!1060147) (not e!860627))))

(assert (=> b!1546202 (= res!1060147 (and (= (size!50310 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50309 _keys!618) (size!50310 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546203 () Bool)

(declare-fun c!141741 () Bool)

(assert (=> b!1546203 (= c!141741 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666298))))

(assert (=> b!1546203 (= e!860625 e!860623)))

(declare-fun b!1546204 () Bool)

(declare-fun call!69529 () ListLongMap!22209)

(assert (=> b!1546204 (= e!860623 call!69529)))

(declare-fun b!1546205 () Bool)

(declare-fun res!1060148 () Bool)

(assert (=> b!1546205 (=> (not res!1060148) (not e!860627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103108 (_ BitVec 32)) Bool)

(assert (=> b!1546205 (= res!1060148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69524 () Bool)

(assert (=> bm!69524 (= call!69525 (+!4947 (ite c!141739 call!69528 (ite c!141740 call!69527 call!69529)) (ite (or c!141739 c!141740) (tuple2!24601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546206 () Bool)

(declare-fun res!1060145 () Bool)

(assert (=> b!1546206 (=> (not res!1060145) (not e!860627))))

(assert (=> b!1546206 (= res!1060145 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50309 _keys!618))))))

(declare-fun bm!69525 () Bool)

(assert (=> bm!69525 (= call!69529 call!69527)))

(declare-fun b!1546207 () Bool)

(assert (=> b!1546207 (= e!860624 tp_is_empty!37987)))

(declare-fun bm!69526 () Bool)

(assert (=> bm!69526 (= call!69528 (getCurrentListMapNoExtraKeys!6575 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58684 () Bool)

(declare-fun tp!111385 () Bool)

(assert (=> mapNonEmpty!58684 (= mapRes!58684 (and tp!111385 e!860631))))

(declare-fun mapKey!58684 () (_ BitVec 32))

(declare-fun mapValue!58684 () ValueCell!18083)

(declare-fun mapRest!58684 () (Array (_ BitVec 32) ValueCell!18083))

(assert (=> mapNonEmpty!58684 (= (arr!49758 _values!470) (store mapRest!58684 mapKey!58684 mapValue!58684))))

(assert (= (and start!131948 res!1060144) b!1546202))

(assert (= (and b!1546202 res!1060147) b!1546205))

(assert (= (and b!1546205 res!1060148) b!1546194))

(assert (= (and b!1546194 res!1060146) b!1546206))

(assert (= (and b!1546206 res!1060145) b!1546198))

(assert (= (and b!1546198 c!141739) b!1546200))

(assert (= (and b!1546198 (not c!141739)) b!1546196))

(assert (= (and b!1546196 c!141740) b!1546195))

(assert (= (and b!1546196 (not c!141740)) b!1546203))

(assert (= (and b!1546203 c!141741) b!1546193))

(assert (= (and b!1546203 (not c!141741)) b!1546204))

(assert (= (or b!1546193 b!1546204) bm!69525))

(assert (= (or b!1546195 bm!69525) bm!69522))

(assert (= (or b!1546195 b!1546193) bm!69523))

(assert (= (or b!1546200 bm!69522) bm!69526))

(assert (= (or b!1546200 bm!69523) bm!69524))

(assert (= (and b!1546198 res!1060143) b!1546201))

(assert (= (and b!1546201 res!1060149) b!1546199))

(assert (= (and b!1546197 condMapEmpty!58684) mapIsEmpty!58684))

(assert (= (and b!1546197 (not condMapEmpty!58684)) mapNonEmpty!58684))

(get-info :version)

(assert (= (and mapNonEmpty!58684 ((_ is ValueCellFull!18083) mapValue!58684)) b!1546192))

(assert (= (and b!1546197 ((_ is ValueCellFull!18083) mapDefault!58684)) b!1546207))

(assert (= start!131948 b!1546197))

(declare-fun m!1425483 () Bool)

(assert (=> b!1546205 m!1425483))

(declare-fun m!1425485 () Bool)

(assert (=> mapNonEmpty!58684 m!1425485))

(declare-fun m!1425487 () Bool)

(assert (=> bm!69524 m!1425487))

(declare-fun m!1425489 () Bool)

(assert (=> b!1546200 m!1425489))

(declare-fun m!1425491 () Bool)

(assert (=> b!1546199 m!1425491))

(declare-fun m!1425493 () Bool)

(assert (=> b!1546199 m!1425493))

(declare-fun m!1425495 () Bool)

(assert (=> b!1546199 m!1425495))

(declare-fun m!1425497 () Bool)

(assert (=> b!1546199 m!1425497))

(assert (=> b!1546199 m!1425495))

(declare-fun m!1425499 () Bool)

(assert (=> b!1546199 m!1425499))

(assert (=> b!1546199 m!1425493))

(assert (=> b!1546199 m!1425495))

(declare-fun m!1425501 () Bool)

(assert (=> b!1546199 m!1425501))

(assert (=> b!1546199 m!1425495))

(declare-fun m!1425503 () Bool)

(assert (=> b!1546194 m!1425503))

(assert (=> bm!69526 m!1425491))

(declare-fun m!1425505 () Bool)

(assert (=> start!131948 m!1425505))

(declare-fun m!1425507 () Bool)

(assert (=> start!131948 m!1425507))

(declare-fun m!1425509 () Bool)

(assert (=> start!131948 m!1425509))

(assert (=> b!1546201 m!1425495))

(assert (=> b!1546201 m!1425495))

(declare-fun m!1425511 () Bool)

(assert (=> b!1546201 m!1425511))

(check-sat (not bm!69526) (not b_next!31711) (not b!1546199) (not mapNonEmpty!58684) (not b!1546200) (not b!1546205) b_and!51103 tp_is_empty!37987 (not b!1546201) (not start!131948) (not b!1546194) (not bm!69524))
(check-sat b_and!51103 (not b_next!31711))
