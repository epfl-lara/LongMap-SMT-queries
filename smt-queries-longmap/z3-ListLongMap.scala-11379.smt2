; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132628 () Bool)

(assert start!132628)

(declare-fun b_free!31891 () Bool)

(declare-fun b_next!31891 () Bool)

(assert (=> start!132628 (= b_free!31891 (not b_next!31891))))

(declare-fun tp!111930 () Bool)

(declare-fun b_and!51323 () Bool)

(assert (=> start!132628 (= tp!111930 b_and!51323)))

(declare-fun b!1553596 () Bool)

(declare-fun e!864991 () Bool)

(declare-datatypes ((array!103658 0))(
  ( (array!103659 (arr!50022 (Array (_ BitVec 32) (_ BitVec 64))) (size!50573 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103658)

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1553596 (= e!864991 (not (= (select (arr!50022 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553597 () Bool)

(declare-fun c!143519 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!669446 () Bool)

(assert (=> b!1553597 (= c!143519 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669446))))

(declare-datatypes ((V!59333 0))(
  ( (V!59334 (val!19161 Int)) )
))
(declare-datatypes ((tuple2!24752 0))(
  ( (tuple2!24753 (_1!12387 (_ BitVec 64)) (_2!12387 V!59333)) )
))
(declare-datatypes ((List!36207 0))(
  ( (Nil!36204) (Cons!36203 (h!37666 tuple2!24752) (t!50909 List!36207)) )
))
(declare-datatypes ((ListLongMap!22369 0))(
  ( (ListLongMap!22370 (toList!11200 List!36207)) )
))
(declare-fun e!864994 () ListLongMap!22369)

(declare-fun e!864995 () ListLongMap!22369)

(assert (=> b!1553597 (= e!864994 e!864995)))

(declare-fun b!1553598 () Bool)

(declare-fun call!71090 () ListLongMap!22369)

(assert (=> b!1553598 (= e!864995 call!71090)))

(declare-fun b!1553599 () Bool)

(declare-fun res!1063171 () Bool)

(declare-fun e!864993 () Bool)

(assert (=> b!1553599 (=> (not res!1063171) (not e!864993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1553599 (= res!1063171 (validKeyInArray!0 (select (arr!50022 _keys!618) from!762)))))

(declare-fun b!1553600 () Bool)

(declare-fun call!71088 () ListLongMap!22369)

(assert (=> b!1553600 (= e!864994 call!71088)))

(declare-fun b!1553601 () Bool)

(declare-fun e!864996 () ListLongMap!22369)

(declare-fun call!71091 () ListLongMap!22369)

(declare-fun minValue!436 () V!59333)

(declare-fun +!5030 (ListLongMap!22369 tuple2!24752) ListLongMap!22369)

(assert (=> b!1553601 (= e!864996 (+!5030 call!71091 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!71084 () Bool)

(declare-fun call!71087 () ListLongMap!22369)

(declare-fun call!71089 () ListLongMap!22369)

(assert (=> bm!71084 (= call!71087 call!71089)))

(declare-fun b!1553602 () Bool)

(declare-fun res!1063170 () Bool)

(declare-fun e!864989 () Bool)

(assert (=> b!1553602 (=> (not res!1063170) (not e!864989))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103658 (_ BitVec 32)) Bool)

(assert (=> b!1553602 (= res!1063170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!71085 () Bool)

(assert (=> bm!71085 (= call!71088 call!71091)))

(declare-fun b!1553603 () Bool)

(declare-fun e!864990 () Bool)

(declare-fun tp_is_empty!38167 () Bool)

(assert (=> b!1553603 (= e!864990 tp_is_empty!38167)))

(declare-fun bm!71086 () Bool)

(declare-fun zeroValue!436 () V!59333)

(declare-fun c!143518 () Bool)

(declare-fun c!143517 () Bool)

(assert (=> bm!71086 (= call!71091 (+!5030 (ite c!143517 call!71089 (ite c!143518 call!71087 call!71090)) (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!71087 () Bool)

(assert (=> bm!71087 (= call!71090 call!71087)))

(declare-fun b!1553604 () Bool)

(assert (=> b!1553604 (= e!864995 call!71088)))

(declare-fun b!1553605 () Bool)

(declare-fun e!864992 () Bool)

(declare-fun e!864998 () Bool)

(declare-fun mapRes!58960 () Bool)

(assert (=> b!1553605 (= e!864992 (and e!864998 mapRes!58960))))

(declare-fun condMapEmpty!58960 () Bool)

(declare-datatypes ((ValueCell!18173 0))(
  ( (ValueCellFull!18173 (v!21956 V!59333)) (EmptyCell!18173) )
))
(declare-datatypes ((array!103660 0))(
  ( (array!103661 (arr!50023 (Array (_ BitVec 32) ValueCell!18173)) (size!50574 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103660)

(declare-fun mapDefault!58960 () ValueCell!18173)

(assert (=> b!1553605 (= condMapEmpty!58960 (= (arr!50023 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18173)) mapDefault!58960)))))

(declare-fun b!1553606 () Bool)

(declare-fun res!1063167 () Bool)

(assert (=> b!1553606 (=> (not res!1063167) (not e!864989))))

(declare-datatypes ((List!36208 0))(
  ( (Nil!36205) (Cons!36204 (h!37667 (_ BitVec 64)) (t!50910 List!36208)) )
))
(declare-fun arrayNoDuplicates!0 (array!103658 (_ BitVec 32) List!36208) Bool)

(assert (=> b!1553606 (= res!1063167 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36205))))

(declare-fun b!1553607 () Bool)

(declare-fun res!1063168 () Bool)

(assert (=> b!1553607 (=> (not res!1063168) (not e!864989))))

(assert (=> b!1553607 (= res!1063168 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50573 _keys!618))))))

(declare-fun b!1553608 () Bool)

(assert (=> b!1553608 (= e!864993 (not e!864991))))

(declare-fun res!1063169 () Bool)

(assert (=> b!1553608 (=> (not res!1063169) (not e!864991))))

(declare-fun lt!669449 () ListLongMap!22369)

(declare-fun contains!10157 (ListLongMap!22369 (_ BitVec 64)) Bool)

(assert (=> b!1553608 (= res!1063169 (contains!10157 lt!669449 (select (arr!50022 _keys!618) from!762)))))

(declare-fun apply!1100 (ListLongMap!22369 (_ BitVec 64)) V!59333)

(assert (=> b!1553608 (= (apply!1100 (+!5030 lt!669449 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50022 _keys!618) from!762)) (apply!1100 lt!669449 (select (arr!50022 _keys!618) from!762)))))

(declare-datatypes ((Unit!51579 0))(
  ( (Unit!51580) )
))
(declare-fun lt!669447 () Unit!51579)

(declare-fun addApplyDifferent!627 (ListLongMap!22369 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51579)

(assert (=> b!1553608 (= lt!669447 (addApplyDifferent!627 lt!669449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50022 _keys!618) from!762)))))

(assert (=> b!1553608 (contains!10157 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50022 _keys!618) from!762))))

(declare-fun lt!669445 () Unit!51579)

(declare-fun addStillContains!1292 (ListLongMap!22369 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51579)

(assert (=> b!1553608 (= lt!669445 (addStillContains!1292 lt!669449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50022 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6663 (array!103658 array!103660 (_ BitVec 32) (_ BitVec 32) V!59333 V!59333 (_ BitVec 32) Int) ListLongMap!22369)

(assert (=> b!1553608 (= lt!669449 (getCurrentListMapNoExtraKeys!6663 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553609 () Bool)

(assert (=> b!1553609 (= e!864989 e!864993)))

(declare-fun res!1063173 () Bool)

(assert (=> b!1553609 (=> (not res!1063173) (not e!864993))))

(assert (=> b!1553609 (= res!1063173 (bvslt from!762 (size!50573 _keys!618)))))

(declare-fun lt!669448 () ListLongMap!22369)

(assert (=> b!1553609 (= lt!669448 e!864996)))

(assert (=> b!1553609 (= c!143517 (and (not lt!669446) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1553609 (= lt!669446 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1553610 () Bool)

(assert (=> b!1553610 (= e!864998 tp_is_empty!38167)))

(declare-fun b!1553611 () Bool)

(assert (=> b!1553611 (= e!864996 e!864994)))

(assert (=> b!1553611 (= c!143518 (and (not lt!669446) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!71088 () Bool)

(assert (=> bm!71088 (= call!71089 (getCurrentListMapNoExtraKeys!6663 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1063172 () Bool)

(assert (=> start!132628 (=> (not res!1063172) (not e!864989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132628 (= res!1063172 (validMask!0 mask!926))))

(assert (=> start!132628 e!864989))

(declare-fun array_inv!39149 (array!103658) Bool)

(assert (=> start!132628 (array_inv!39149 _keys!618)))

(assert (=> start!132628 tp_is_empty!38167))

(assert (=> start!132628 true))

(assert (=> start!132628 tp!111930))

(declare-fun array_inv!39150 (array!103660) Bool)

(assert (=> start!132628 (and (array_inv!39150 _values!470) e!864992)))

(declare-fun mapIsEmpty!58960 () Bool)

(assert (=> mapIsEmpty!58960 mapRes!58960))

(declare-fun mapNonEmpty!58960 () Bool)

(declare-fun tp!111931 () Bool)

(assert (=> mapNonEmpty!58960 (= mapRes!58960 (and tp!111931 e!864990))))

(declare-fun mapKey!58960 () (_ BitVec 32))

(declare-fun mapValue!58960 () ValueCell!18173)

(declare-fun mapRest!58960 () (Array (_ BitVec 32) ValueCell!18173))

(assert (=> mapNonEmpty!58960 (= (arr!50023 _values!470) (store mapRest!58960 mapKey!58960 mapValue!58960))))

(declare-fun b!1553612 () Bool)

(declare-fun res!1063166 () Bool)

(assert (=> b!1553612 (=> (not res!1063166) (not e!864989))))

(assert (=> b!1553612 (= res!1063166 (and (= (size!50574 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50573 _keys!618) (size!50574 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132628 res!1063172) b!1553612))

(assert (= (and b!1553612 res!1063166) b!1553602))

(assert (= (and b!1553602 res!1063170) b!1553606))

(assert (= (and b!1553606 res!1063167) b!1553607))

(assert (= (and b!1553607 res!1063168) b!1553609))

(assert (= (and b!1553609 c!143517) b!1553601))

(assert (= (and b!1553609 (not c!143517)) b!1553611))

(assert (= (and b!1553611 c!143518) b!1553600))

(assert (= (and b!1553611 (not c!143518)) b!1553597))

(assert (= (and b!1553597 c!143519) b!1553604))

(assert (= (and b!1553597 (not c!143519)) b!1553598))

(assert (= (or b!1553604 b!1553598) bm!71087))

(assert (= (or b!1553600 bm!71087) bm!71084))

(assert (= (or b!1553600 b!1553604) bm!71085))

(assert (= (or b!1553601 bm!71084) bm!71088))

(assert (= (or b!1553601 bm!71085) bm!71086))

(assert (= (and b!1553609 res!1063173) b!1553599))

(assert (= (and b!1553599 res!1063171) b!1553608))

(assert (= (and b!1553608 res!1063169) b!1553596))

(assert (= (and b!1553605 condMapEmpty!58960) mapIsEmpty!58960))

(assert (= (and b!1553605 (not condMapEmpty!58960)) mapNonEmpty!58960))

(get-info :version)

(assert (= (and mapNonEmpty!58960 ((_ is ValueCellFull!18173) mapValue!58960)) b!1553603))

(assert (= (and b!1553605 ((_ is ValueCellFull!18173) mapDefault!58960)) b!1553610))

(assert (= start!132628 b!1553605))

(declare-fun m!1432113 () Bool)

(assert (=> b!1553601 m!1432113))

(declare-fun m!1432115 () Bool)

(assert (=> b!1553596 m!1432115))

(declare-fun m!1432117 () Bool)

(assert (=> bm!71086 m!1432117))

(declare-fun m!1432119 () Bool)

(assert (=> b!1553608 m!1432119))

(assert (=> b!1553608 m!1432115))

(assert (=> b!1553608 m!1432115))

(declare-fun m!1432121 () Bool)

(assert (=> b!1553608 m!1432121))

(declare-fun m!1432123 () Bool)

(assert (=> b!1553608 m!1432123))

(assert (=> b!1553608 m!1432115))

(declare-fun m!1432125 () Bool)

(assert (=> b!1553608 m!1432125))

(declare-fun m!1432127 () Bool)

(assert (=> b!1553608 m!1432127))

(assert (=> b!1553608 m!1432115))

(declare-fun m!1432129 () Bool)

(assert (=> b!1553608 m!1432129))

(assert (=> b!1553608 m!1432115))

(declare-fun m!1432131 () Bool)

(assert (=> b!1553608 m!1432131))

(assert (=> b!1553608 m!1432127))

(assert (=> b!1553608 m!1432115))

(declare-fun m!1432133 () Bool)

(assert (=> b!1553608 m!1432133))

(assert (=> b!1553608 m!1432115))

(declare-fun m!1432135 () Bool)

(assert (=> b!1553608 m!1432135))

(assert (=> b!1553608 m!1432123))

(declare-fun m!1432137 () Bool)

(assert (=> start!132628 m!1432137))

(declare-fun m!1432139 () Bool)

(assert (=> start!132628 m!1432139))

(declare-fun m!1432141 () Bool)

(assert (=> start!132628 m!1432141))

(declare-fun m!1432143 () Bool)

(assert (=> b!1553606 m!1432143))

(assert (=> bm!71088 m!1432119))

(declare-fun m!1432145 () Bool)

(assert (=> b!1553602 m!1432145))

(declare-fun m!1432147 () Bool)

(assert (=> mapNonEmpty!58960 m!1432147))

(assert (=> b!1553599 m!1432115))

(assert (=> b!1553599 m!1432115))

(declare-fun m!1432149 () Bool)

(assert (=> b!1553599 m!1432149))

(check-sat (not mapNonEmpty!58960) (not b!1553608) (not bm!71088) (not b!1553599) (not b!1553606) (not b!1553601) (not b!1553602) b_and!51323 (not b_next!31891) (not bm!71086) (not start!132628) tp_is_empty!38167)
(check-sat b_and!51323 (not b_next!31891))
(get-model)

(declare-fun d!161659 () Bool)

(declare-fun res!1063228 () Bool)

(declare-fun e!865070 () Bool)

(assert (=> d!161659 (=> res!1063228 e!865070)))

(assert (=> d!161659 (= res!1063228 (bvsge #b00000000000000000000000000000000 (size!50573 _keys!618)))))

(assert (=> d!161659 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36205) e!865070)))

(declare-fun b!1553725 () Bool)

(declare-fun e!865067 () Bool)

(declare-fun call!71124 () Bool)

(assert (=> b!1553725 (= e!865067 call!71124)))

(declare-fun b!1553726 () Bool)

(declare-fun e!865068 () Bool)

(assert (=> b!1553726 (= e!865070 e!865068)))

(declare-fun res!1063230 () Bool)

(assert (=> b!1553726 (=> (not res!1063230) (not e!865068))))

(declare-fun e!865069 () Bool)

(assert (=> b!1553726 (= res!1063230 (not e!865069))))

(declare-fun res!1063229 () Bool)

(assert (=> b!1553726 (=> (not res!1063229) (not e!865069))))

(assert (=> b!1553726 (= res!1063229 (validKeyInArray!0 (select (arr!50022 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!71121 () Bool)

(declare-fun c!143540 () Bool)

(assert (=> bm!71121 (= call!71124 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143540 (Cons!36204 (select (arr!50022 _keys!618) #b00000000000000000000000000000000) Nil!36205) Nil!36205)))))

(declare-fun b!1553727 () Bool)

(declare-fun contains!10158 (List!36208 (_ BitVec 64)) Bool)

(assert (=> b!1553727 (= e!865069 (contains!10158 Nil!36205 (select (arr!50022 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553728 () Bool)

(assert (=> b!1553728 (= e!865068 e!865067)))

(assert (=> b!1553728 (= c!143540 (validKeyInArray!0 (select (arr!50022 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553729 () Bool)

(assert (=> b!1553729 (= e!865067 call!71124)))

(assert (= (and d!161659 (not res!1063228)) b!1553726))

(assert (= (and b!1553726 res!1063229) b!1553727))

(assert (= (and b!1553726 res!1063230) b!1553728))

(assert (= (and b!1553728 c!143540) b!1553725))

(assert (= (and b!1553728 (not c!143540)) b!1553729))

(assert (= (or b!1553725 b!1553729) bm!71121))

(declare-fun m!1432227 () Bool)

(assert (=> b!1553726 m!1432227))

(assert (=> b!1553726 m!1432227))

(declare-fun m!1432229 () Bool)

(assert (=> b!1553726 m!1432229))

(assert (=> bm!71121 m!1432227))

(declare-fun m!1432231 () Bool)

(assert (=> bm!71121 m!1432231))

(assert (=> b!1553727 m!1432227))

(assert (=> b!1553727 m!1432227))

(declare-fun m!1432233 () Bool)

(assert (=> b!1553727 m!1432233))

(assert (=> b!1553728 m!1432227))

(assert (=> b!1553728 m!1432227))

(assert (=> b!1553728 m!1432229))

(assert (=> b!1553606 d!161659))

(declare-fun b!1553754 () Bool)

(declare-fun e!865087 () Bool)

(declare-fun e!865085 () Bool)

(assert (=> b!1553754 (= e!865087 e!865085)))

(declare-fun c!143549 () Bool)

(declare-fun e!865090 () Bool)

(assert (=> b!1553754 (= c!143549 e!865090)))

(declare-fun res!1063241 () Bool)

(assert (=> b!1553754 (=> (not res!1063241) (not e!865090))))

(assert (=> b!1553754 (= res!1063241 (bvslt from!762 (size!50573 _keys!618)))))

(declare-fun e!865086 () Bool)

(declare-fun b!1553755 () Bool)

(declare-fun lt!669497 () ListLongMap!22369)

(assert (=> b!1553755 (= e!865086 (= lt!669497 (getCurrentListMapNoExtraKeys!6663 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1553757 () Bool)

(assert (=> b!1553757 (= e!865085 e!865086)))

(declare-fun c!143551 () Bool)

(assert (=> b!1553757 (= c!143551 (bvslt from!762 (size!50573 _keys!618)))))

(declare-fun b!1553758 () Bool)

(declare-fun res!1063240 () Bool)

(assert (=> b!1553758 (=> (not res!1063240) (not e!865087))))

(assert (=> b!1553758 (= res!1063240 (not (contains!10157 lt!669497 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1553759 () Bool)

(assert (=> b!1553759 (= e!865090 (validKeyInArray!0 (select (arr!50022 _keys!618) from!762)))))

(assert (=> b!1553759 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun bm!71124 () Bool)

(declare-fun call!71127 () ListLongMap!22369)

(assert (=> bm!71124 (= call!71127 (getCurrentListMapNoExtraKeys!6663 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1553760 () Bool)

(declare-fun e!865091 () Bool)

(assert (=> b!1553760 (= e!865085 e!865091)))

(assert (=> b!1553760 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50573 _keys!618)))))

(declare-fun res!1063242 () Bool)

(assert (=> b!1553760 (= res!1063242 (contains!10157 lt!669497 (select (arr!50022 _keys!618) from!762)))))

(assert (=> b!1553760 (=> (not res!1063242) (not e!865091))))

(declare-fun b!1553756 () Bool)

(assert (=> b!1553756 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50573 _keys!618)))))

(assert (=> b!1553756 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50574 _values!470)))))

(declare-fun get!26060 (ValueCell!18173 V!59333) V!59333)

(declare-fun dynLambda!3857 (Int (_ BitVec 64)) V!59333)

(assert (=> b!1553756 (= e!865091 (= (apply!1100 lt!669497 (select (arr!50022 _keys!618) from!762)) (get!26060 (select (arr!50023 _values!470) from!762) (dynLambda!3857 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!161661 () Bool)

(assert (=> d!161661 e!865087))

(declare-fun res!1063239 () Bool)

(assert (=> d!161661 (=> (not res!1063239) (not e!865087))))

(assert (=> d!161661 (= res!1063239 (not (contains!10157 lt!669497 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!865088 () ListLongMap!22369)

(assert (=> d!161661 (= lt!669497 e!865088)))

(declare-fun c!143552 () Bool)

(assert (=> d!161661 (= c!143552 (bvsge from!762 (size!50573 _keys!618)))))

(assert (=> d!161661 (validMask!0 mask!926)))

(assert (=> d!161661 (= (getCurrentListMapNoExtraKeys!6663 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!669497)))

(declare-fun b!1553761 () Bool)

(assert (=> b!1553761 (= e!865088 (ListLongMap!22370 Nil!36204))))

(declare-fun b!1553762 () Bool)

(declare-fun e!865089 () ListLongMap!22369)

(assert (=> b!1553762 (= e!865089 call!71127)))

(declare-fun b!1553763 () Bool)

(assert (=> b!1553763 (= e!865088 e!865089)))

(declare-fun c!143550 () Bool)

(assert (=> b!1553763 (= c!143550 (validKeyInArray!0 (select (arr!50022 _keys!618) from!762)))))

(declare-fun b!1553764 () Bool)

(declare-fun lt!669500 () Unit!51579)

(declare-fun lt!669499 () Unit!51579)

(assert (=> b!1553764 (= lt!669500 lt!669499)))

(declare-fun lt!669498 () (_ BitVec 64))

(declare-fun lt!669494 () (_ BitVec 64))

(declare-fun lt!669496 () V!59333)

(declare-fun lt!669495 () ListLongMap!22369)

(assert (=> b!1553764 (not (contains!10157 (+!5030 lt!669495 (tuple2!24753 lt!669494 lt!669496)) lt!669498))))

(declare-fun addStillNotContains!512 (ListLongMap!22369 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51579)

(assert (=> b!1553764 (= lt!669499 (addStillNotContains!512 lt!669495 lt!669494 lt!669496 lt!669498))))

(assert (=> b!1553764 (= lt!669498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1553764 (= lt!669496 (get!26060 (select (arr!50023 _values!470) from!762) (dynLambda!3857 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1553764 (= lt!669494 (select (arr!50022 _keys!618) from!762))))

(assert (=> b!1553764 (= lt!669495 call!71127)))

(assert (=> b!1553764 (= e!865089 (+!5030 call!71127 (tuple2!24753 (select (arr!50022 _keys!618) from!762) (get!26060 (select (arr!50023 _values!470) from!762) (dynLambda!3857 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1553765 () Bool)

(declare-fun isEmpty!1133 (ListLongMap!22369) Bool)

(assert (=> b!1553765 (= e!865086 (isEmpty!1133 lt!669497))))

(assert (= (and d!161661 c!143552) b!1553761))

(assert (= (and d!161661 (not c!143552)) b!1553763))

(assert (= (and b!1553763 c!143550) b!1553764))

(assert (= (and b!1553763 (not c!143550)) b!1553762))

(assert (= (or b!1553764 b!1553762) bm!71124))

(assert (= (and d!161661 res!1063239) b!1553758))

(assert (= (and b!1553758 res!1063240) b!1553754))

(assert (= (and b!1553754 res!1063241) b!1553759))

(assert (= (and b!1553754 c!143549) b!1553760))

(assert (= (and b!1553754 (not c!143549)) b!1553757))

(assert (= (and b!1553760 res!1063242) b!1553756))

(assert (= (and b!1553757 c!143551) b!1553755))

(assert (= (and b!1553757 (not c!143551)) b!1553765))

(declare-fun b_lambda!24765 () Bool)

(assert (=> (not b_lambda!24765) (not b!1553756)))

(declare-fun t!50914 () Bool)

(declare-fun tb!12471 () Bool)

(assert (=> (and start!132628 (= defaultEntry!478 defaultEntry!478) t!50914) tb!12471))

(declare-fun result!26065 () Bool)

(assert (=> tb!12471 (= result!26065 tp_is_empty!38167)))

(assert (=> b!1553756 t!50914))

(declare-fun b_and!51329 () Bool)

(assert (= b_and!51323 (and (=> t!50914 result!26065) b_and!51329)))

(declare-fun b_lambda!24767 () Bool)

(assert (=> (not b_lambda!24767) (not b!1553764)))

(assert (=> b!1553764 t!50914))

(declare-fun b_and!51331 () Bool)

(assert (= b_and!51329 (and (=> t!50914 result!26065) b_and!51331)))

(declare-fun m!1432235 () Bool)

(assert (=> d!161661 m!1432235))

(assert (=> d!161661 m!1432137))

(declare-fun m!1432237 () Bool)

(assert (=> b!1553764 m!1432237))

(declare-fun m!1432239 () Bool)

(assert (=> b!1553764 m!1432239))

(assert (=> b!1553764 m!1432115))

(declare-fun m!1432241 () Bool)

(assert (=> b!1553764 m!1432241))

(declare-fun m!1432243 () Bool)

(assert (=> b!1553764 m!1432243))

(assert (=> b!1553764 m!1432237))

(assert (=> b!1553764 m!1432239))

(declare-fun m!1432245 () Bool)

(assert (=> b!1553764 m!1432245))

(assert (=> b!1553764 m!1432243))

(declare-fun m!1432247 () Bool)

(assert (=> b!1553764 m!1432247))

(declare-fun m!1432249 () Bool)

(assert (=> b!1553764 m!1432249))

(declare-fun m!1432251 () Bool)

(assert (=> bm!71124 m!1432251))

(assert (=> b!1553756 m!1432237))

(assert (=> b!1553756 m!1432239))

(assert (=> b!1553756 m!1432115))

(declare-fun m!1432253 () Bool)

(assert (=> b!1553756 m!1432253))

(assert (=> b!1553756 m!1432115))

(assert (=> b!1553756 m!1432237))

(assert (=> b!1553756 m!1432239))

(assert (=> b!1553756 m!1432245))

(assert (=> b!1553759 m!1432115))

(assert (=> b!1553759 m!1432115))

(assert (=> b!1553759 m!1432149))

(declare-fun m!1432255 () Bool)

(assert (=> b!1553758 m!1432255))

(assert (=> b!1553763 m!1432115))

(assert (=> b!1553763 m!1432115))

(assert (=> b!1553763 m!1432149))

(assert (=> b!1553760 m!1432115))

(assert (=> b!1553760 m!1432115))

(declare-fun m!1432257 () Bool)

(assert (=> b!1553760 m!1432257))

(assert (=> b!1553755 m!1432251))

(declare-fun m!1432259 () Bool)

(assert (=> b!1553765 m!1432259))

(assert (=> bm!71088 d!161661))

(declare-fun d!161663 () Bool)

(assert (=> d!161663 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132628 d!161663))

(declare-fun d!161665 () Bool)

(assert (=> d!161665 (= (array_inv!39149 _keys!618) (bvsge (size!50573 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132628 d!161665))

(declare-fun d!161667 () Bool)

(assert (=> d!161667 (= (array_inv!39150 _values!470) (bvsge (size!50574 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132628 d!161667))

(declare-fun d!161669 () Bool)

(assert (=> d!161669 (= (validKeyInArray!0 (select (arr!50022 _keys!618) from!762)) (and (not (= (select (arr!50022 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50022 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1553599 d!161669))

(declare-fun b!1553776 () Bool)

(declare-fun e!865099 () Bool)

(declare-fun e!865098 () Bool)

(assert (=> b!1553776 (= e!865099 e!865098)))

(declare-fun c!143555 () Bool)

(assert (=> b!1553776 (= c!143555 (validKeyInArray!0 (select (arr!50022 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1553777 () Bool)

(declare-fun call!71130 () Bool)

(assert (=> b!1553777 (= e!865098 call!71130)))

(declare-fun b!1553778 () Bool)

(declare-fun e!865100 () Bool)

(assert (=> b!1553778 (= e!865098 e!865100)))

(declare-fun lt!669509 () (_ BitVec 64))

(assert (=> b!1553778 (= lt!669509 (select (arr!50022 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!669507 () Unit!51579)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103658 (_ BitVec 64) (_ BitVec 32)) Unit!51579)

(assert (=> b!1553778 (= lt!669507 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669509 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1553778 (arrayContainsKey!0 _keys!618 lt!669509 #b00000000000000000000000000000000)))

(declare-fun lt!669508 () Unit!51579)

(assert (=> b!1553778 (= lt!669508 lt!669507)))

(declare-fun res!1063247 () Bool)

(declare-datatypes ((SeekEntryResult!13462 0))(
  ( (MissingZero!13462 (index!56246 (_ BitVec 32))) (Found!13462 (index!56247 (_ BitVec 32))) (Intermediate!13462 (undefined!14274 Bool) (index!56248 (_ BitVec 32)) (x!139126 (_ BitVec 32))) (Undefined!13462) (MissingVacant!13462 (index!56249 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103658 (_ BitVec 32)) SeekEntryResult!13462)

(assert (=> b!1553778 (= res!1063247 (= (seekEntryOrOpen!0 (select (arr!50022 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13462 #b00000000000000000000000000000000)))))

(assert (=> b!1553778 (=> (not res!1063247) (not e!865100))))

(declare-fun bm!71127 () Bool)

(assert (=> bm!71127 (= call!71130 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun d!161671 () Bool)

(declare-fun res!1063248 () Bool)

(assert (=> d!161671 (=> res!1063248 e!865099)))

(assert (=> d!161671 (= res!1063248 (bvsge #b00000000000000000000000000000000 (size!50573 _keys!618)))))

(assert (=> d!161671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!865099)))

(declare-fun b!1553779 () Bool)

(assert (=> b!1553779 (= e!865100 call!71130)))

(assert (= (and d!161671 (not res!1063248)) b!1553776))

(assert (= (and b!1553776 c!143555) b!1553778))

(assert (= (and b!1553776 (not c!143555)) b!1553777))

(assert (= (and b!1553778 res!1063247) b!1553779))

(assert (= (or b!1553779 b!1553777) bm!71127))

(assert (=> b!1553776 m!1432227))

(assert (=> b!1553776 m!1432227))

(assert (=> b!1553776 m!1432229))

(assert (=> b!1553778 m!1432227))

(declare-fun m!1432261 () Bool)

(assert (=> b!1553778 m!1432261))

(declare-fun m!1432263 () Bool)

(assert (=> b!1553778 m!1432263))

(assert (=> b!1553778 m!1432227))

(declare-fun m!1432265 () Bool)

(assert (=> b!1553778 m!1432265))

(declare-fun m!1432267 () Bool)

(assert (=> bm!71127 m!1432267))

(assert (=> b!1553602 d!161671))

(declare-fun d!161673 () Bool)

(declare-fun e!865103 () Bool)

(assert (=> d!161673 e!865103))

(declare-fun res!1063254 () Bool)

(assert (=> d!161673 (=> (not res!1063254) (not e!865103))))

(declare-fun lt!669521 () ListLongMap!22369)

(assert (=> d!161673 (= res!1063254 (contains!10157 lt!669521 (_1!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669518 () List!36207)

(assert (=> d!161673 (= lt!669521 (ListLongMap!22370 lt!669518))))

(declare-fun lt!669519 () Unit!51579)

(declare-fun lt!669520 () Unit!51579)

(assert (=> d!161673 (= lt!669519 lt!669520)))

(declare-datatypes ((Option!801 0))(
  ( (Some!800 (v!21959 V!59333)) (None!799) )
))
(declare-fun getValueByKey!726 (List!36207 (_ BitVec 64)) Option!801)

(assert (=> d!161673 (= (getValueByKey!726 lt!669518 (_1!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!800 (_2!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!373 (List!36207 (_ BitVec 64) V!59333) Unit!51579)

(assert (=> d!161673 (= lt!669520 (lemmaContainsTupThenGetReturnValue!373 lt!669518 (_1!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun insertStrictlySorted!502 (List!36207 (_ BitVec 64) V!59333) List!36207)

(assert (=> d!161673 (= lt!669518 (insertStrictlySorted!502 (toList!11200 (ite c!143517 call!71089 (ite c!143518 call!71087 call!71090))) (_1!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161673 (= (+!5030 (ite c!143517 call!71089 (ite c!143518 call!71087 call!71090)) (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669521)))

(declare-fun b!1553784 () Bool)

(declare-fun res!1063253 () Bool)

(assert (=> b!1553784 (=> (not res!1063253) (not e!865103))))

(assert (=> b!1553784 (= res!1063253 (= (getValueByKey!726 (toList!11200 lt!669521) (_1!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!800 (_2!12387 (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1553785 () Bool)

(declare-fun contains!10159 (List!36207 tuple2!24752) Bool)

(assert (=> b!1553785 (= e!865103 (contains!10159 (toList!11200 lt!669521) (ite (or c!143517 c!143518) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161673 res!1063254) b!1553784))

(assert (= (and b!1553784 res!1063253) b!1553785))

(declare-fun m!1432269 () Bool)

(assert (=> d!161673 m!1432269))

(declare-fun m!1432271 () Bool)

(assert (=> d!161673 m!1432271))

(declare-fun m!1432273 () Bool)

(assert (=> d!161673 m!1432273))

(declare-fun m!1432275 () Bool)

(assert (=> d!161673 m!1432275))

(declare-fun m!1432277 () Bool)

(assert (=> b!1553784 m!1432277))

(declare-fun m!1432279 () Bool)

(assert (=> b!1553785 m!1432279))

(assert (=> bm!71086 d!161673))

(declare-fun d!161675 () Bool)

(declare-fun e!865104 () Bool)

(assert (=> d!161675 e!865104))

(declare-fun res!1063256 () Bool)

(assert (=> d!161675 (=> (not res!1063256) (not e!865104))))

(declare-fun lt!669525 () ListLongMap!22369)

(assert (=> d!161675 (= res!1063256 (contains!10157 lt!669525 (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669522 () List!36207)

(assert (=> d!161675 (= lt!669525 (ListLongMap!22370 lt!669522))))

(declare-fun lt!669523 () Unit!51579)

(declare-fun lt!669524 () Unit!51579)

(assert (=> d!161675 (= lt!669523 lt!669524)))

(assert (=> d!161675 (= (getValueByKey!726 lt!669522 (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!800 (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161675 (= lt!669524 (lemmaContainsTupThenGetReturnValue!373 lt!669522 (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161675 (= lt!669522 (insertStrictlySorted!502 (toList!11200 call!71091) (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161675 (= (+!5030 call!71091 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669525)))

(declare-fun b!1553786 () Bool)

(declare-fun res!1063255 () Bool)

(assert (=> b!1553786 (=> (not res!1063255) (not e!865104))))

(assert (=> b!1553786 (= res!1063255 (= (getValueByKey!726 (toList!11200 lt!669525) (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!800 (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553787 () Bool)

(assert (=> b!1553787 (= e!865104 (contains!10159 (toList!11200 lt!669525) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161675 res!1063256) b!1553786))

(assert (= (and b!1553786 res!1063255) b!1553787))

(declare-fun m!1432281 () Bool)

(assert (=> d!161675 m!1432281))

(declare-fun m!1432283 () Bool)

(assert (=> d!161675 m!1432283))

(declare-fun m!1432285 () Bool)

(assert (=> d!161675 m!1432285))

(declare-fun m!1432287 () Bool)

(assert (=> d!161675 m!1432287))

(declare-fun m!1432289 () Bool)

(assert (=> b!1553786 m!1432289))

(declare-fun m!1432291 () Bool)

(assert (=> b!1553787 m!1432291))

(assert (=> b!1553601 d!161675))

(declare-fun d!161677 () Bool)

(assert (=> d!161677 (contains!10157 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50022 _keys!618) from!762))))

(declare-fun lt!669528 () Unit!51579)

(declare-fun choose!2026 (ListLongMap!22369 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51579)

(assert (=> d!161677 (= lt!669528 (choose!2026 lt!669449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50022 _keys!618) from!762)))))

(assert (=> d!161677 (contains!10157 lt!669449 (select (arr!50022 _keys!618) from!762))))

(assert (=> d!161677 (= (addStillContains!1292 lt!669449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50022 _keys!618) from!762)) lt!669528)))

(declare-fun bs!44591 () Bool)

(assert (= bs!44591 d!161677))

(assert (=> bs!44591 m!1432127))

(assert (=> bs!44591 m!1432127))

(assert (=> bs!44591 m!1432115))

(assert (=> bs!44591 m!1432133))

(assert (=> bs!44591 m!1432115))

(declare-fun m!1432293 () Bool)

(assert (=> bs!44591 m!1432293))

(assert (=> bs!44591 m!1432115))

(assert (=> bs!44591 m!1432121))

(assert (=> b!1553608 d!161677))

(declare-fun d!161679 () Bool)

(declare-fun e!865109 () Bool)

(assert (=> d!161679 e!865109))

(declare-fun res!1063259 () Bool)

(assert (=> d!161679 (=> res!1063259 e!865109)))

(declare-fun lt!669540 () Bool)

(assert (=> d!161679 (= res!1063259 (not lt!669540))))

(declare-fun lt!669537 () Bool)

(assert (=> d!161679 (= lt!669540 lt!669537)))

(declare-fun lt!669539 () Unit!51579)

(declare-fun e!865110 () Unit!51579)

(assert (=> d!161679 (= lt!669539 e!865110)))

(declare-fun c!143558 () Bool)

(assert (=> d!161679 (= c!143558 lt!669537)))

(declare-fun containsKey!752 (List!36207 (_ BitVec 64)) Bool)

(assert (=> d!161679 (= lt!669537 (containsKey!752 (toList!11200 lt!669449) (select (arr!50022 _keys!618) from!762)))))

(assert (=> d!161679 (= (contains!10157 lt!669449 (select (arr!50022 _keys!618) from!762)) lt!669540)))

(declare-fun b!1553795 () Bool)

(declare-fun lt!669538 () Unit!51579)

(assert (=> b!1553795 (= e!865110 lt!669538)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!498 (List!36207 (_ BitVec 64)) Unit!51579)

(assert (=> b!1553795 (= lt!669538 (lemmaContainsKeyImpliesGetValueByKeyDefined!498 (toList!11200 lt!669449) (select (arr!50022 _keys!618) from!762)))))

(declare-fun isDefined!544 (Option!801) Bool)

(assert (=> b!1553795 (isDefined!544 (getValueByKey!726 (toList!11200 lt!669449) (select (arr!50022 _keys!618) from!762)))))

(declare-fun b!1553796 () Bool)

(declare-fun Unit!51581 () Unit!51579)

(assert (=> b!1553796 (= e!865110 Unit!51581)))

(declare-fun b!1553797 () Bool)

(assert (=> b!1553797 (= e!865109 (isDefined!544 (getValueByKey!726 (toList!11200 lt!669449) (select (arr!50022 _keys!618) from!762))))))

(assert (= (and d!161679 c!143558) b!1553795))

(assert (= (and d!161679 (not c!143558)) b!1553796))

(assert (= (and d!161679 (not res!1063259)) b!1553797))

(assert (=> d!161679 m!1432115))

(declare-fun m!1432295 () Bool)

(assert (=> d!161679 m!1432295))

(assert (=> b!1553795 m!1432115))

(declare-fun m!1432297 () Bool)

(assert (=> b!1553795 m!1432297))

(assert (=> b!1553795 m!1432115))

(declare-fun m!1432299 () Bool)

(assert (=> b!1553795 m!1432299))

(assert (=> b!1553795 m!1432299))

(declare-fun m!1432301 () Bool)

(assert (=> b!1553795 m!1432301))

(assert (=> b!1553797 m!1432115))

(assert (=> b!1553797 m!1432299))

(assert (=> b!1553797 m!1432299))

(assert (=> b!1553797 m!1432301))

(assert (=> b!1553608 d!161679))

(declare-fun d!161681 () Bool)

(declare-fun e!865111 () Bool)

(assert (=> d!161681 e!865111))

(declare-fun res!1063261 () Bool)

(assert (=> d!161681 (=> (not res!1063261) (not e!865111))))

(declare-fun lt!669544 () ListLongMap!22369)

(assert (=> d!161681 (= res!1063261 (contains!10157 lt!669544 (_1!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669541 () List!36207)

(assert (=> d!161681 (= lt!669544 (ListLongMap!22370 lt!669541))))

(declare-fun lt!669542 () Unit!51579)

(declare-fun lt!669543 () Unit!51579)

(assert (=> d!161681 (= lt!669542 lt!669543)))

(assert (=> d!161681 (= (getValueByKey!726 lt!669541 (_1!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!800 (_2!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161681 (= lt!669543 (lemmaContainsTupThenGetReturnValue!373 lt!669541 (_1!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161681 (= lt!669541 (insertStrictlySorted!502 (toList!11200 lt!669449) (_1!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161681 (= (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669544)))

(declare-fun b!1553798 () Bool)

(declare-fun res!1063260 () Bool)

(assert (=> b!1553798 (=> (not res!1063260) (not e!865111))))

(assert (=> b!1553798 (= res!1063260 (= (getValueByKey!726 (toList!11200 lt!669544) (_1!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!800 (_2!12387 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1553799 () Bool)

(assert (=> b!1553799 (= e!865111 (contains!10159 (toList!11200 lt!669544) (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161681 res!1063261) b!1553798))

(assert (= (and b!1553798 res!1063260) b!1553799))

(declare-fun m!1432303 () Bool)

(assert (=> d!161681 m!1432303))

(declare-fun m!1432305 () Bool)

(assert (=> d!161681 m!1432305))

(declare-fun m!1432307 () Bool)

(assert (=> d!161681 m!1432307))

(declare-fun m!1432309 () Bool)

(assert (=> d!161681 m!1432309))

(declare-fun m!1432311 () Bool)

(assert (=> b!1553798 m!1432311))

(declare-fun m!1432313 () Bool)

(assert (=> b!1553799 m!1432313))

(assert (=> b!1553608 d!161681))

(assert (=> b!1553608 d!161661))

(declare-fun d!161683 () Bool)

(declare-fun e!865112 () Bool)

(assert (=> d!161683 e!865112))

(declare-fun res!1063262 () Bool)

(assert (=> d!161683 (=> res!1063262 e!865112)))

(declare-fun lt!669548 () Bool)

(assert (=> d!161683 (= res!1063262 (not lt!669548))))

(declare-fun lt!669545 () Bool)

(assert (=> d!161683 (= lt!669548 lt!669545)))

(declare-fun lt!669547 () Unit!51579)

(declare-fun e!865113 () Unit!51579)

(assert (=> d!161683 (= lt!669547 e!865113)))

(declare-fun c!143559 () Bool)

(assert (=> d!161683 (= c!143559 lt!669545)))

(assert (=> d!161683 (= lt!669545 (containsKey!752 (toList!11200 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50022 _keys!618) from!762)))))

(assert (=> d!161683 (= (contains!10157 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50022 _keys!618) from!762)) lt!669548)))

(declare-fun b!1553800 () Bool)

(declare-fun lt!669546 () Unit!51579)

(assert (=> b!1553800 (= e!865113 lt!669546)))

(assert (=> b!1553800 (= lt!669546 (lemmaContainsKeyImpliesGetValueByKeyDefined!498 (toList!11200 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50022 _keys!618) from!762)))))

(assert (=> b!1553800 (isDefined!544 (getValueByKey!726 (toList!11200 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50022 _keys!618) from!762)))))

(declare-fun b!1553801 () Bool)

(declare-fun Unit!51582 () Unit!51579)

(assert (=> b!1553801 (= e!865113 Unit!51582)))

(declare-fun b!1553802 () Bool)

(assert (=> b!1553802 (= e!865112 (isDefined!544 (getValueByKey!726 (toList!11200 (+!5030 lt!669449 (tuple2!24753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!50022 _keys!618) from!762))))))

(assert (= (and d!161683 c!143559) b!1553800))

(assert (= (and d!161683 (not c!143559)) b!1553801))

(assert (= (and d!161683 (not res!1063262)) b!1553802))

(assert (=> d!161683 m!1432115))

(declare-fun m!1432315 () Bool)

(assert (=> d!161683 m!1432315))

(assert (=> b!1553800 m!1432115))

(declare-fun m!1432317 () Bool)

(assert (=> b!1553800 m!1432317))

(assert (=> b!1553800 m!1432115))

(declare-fun m!1432319 () Bool)

(assert (=> b!1553800 m!1432319))

(assert (=> b!1553800 m!1432319))

(declare-fun m!1432321 () Bool)

(assert (=> b!1553800 m!1432321))

(assert (=> b!1553802 m!1432115))

(assert (=> b!1553802 m!1432319))

(assert (=> b!1553802 m!1432319))

(assert (=> b!1553802 m!1432321))

(assert (=> b!1553608 d!161683))

(declare-fun d!161685 () Bool)

(declare-fun get!26061 (Option!801) V!59333)

(assert (=> d!161685 (= (apply!1100 (+!5030 lt!669449 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50022 _keys!618) from!762)) (get!26061 (getValueByKey!726 (toList!11200 (+!5030 lt!669449 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50022 _keys!618) from!762))))))

(declare-fun bs!44592 () Bool)

(assert (= bs!44592 d!161685))

(assert (=> bs!44592 m!1432115))

(declare-fun m!1432323 () Bool)

(assert (=> bs!44592 m!1432323))

(assert (=> bs!44592 m!1432323))

(declare-fun m!1432325 () Bool)

(assert (=> bs!44592 m!1432325))

(assert (=> b!1553608 d!161685))

(declare-fun d!161687 () Bool)

(declare-fun e!865114 () Bool)

(assert (=> d!161687 e!865114))

(declare-fun res!1063264 () Bool)

(assert (=> d!161687 (=> (not res!1063264) (not e!865114))))

(declare-fun lt!669552 () ListLongMap!22369)

(assert (=> d!161687 (= res!1063264 (contains!10157 lt!669552 (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669549 () List!36207)

(assert (=> d!161687 (= lt!669552 (ListLongMap!22370 lt!669549))))

(declare-fun lt!669550 () Unit!51579)

(declare-fun lt!669551 () Unit!51579)

(assert (=> d!161687 (= lt!669550 lt!669551)))

(assert (=> d!161687 (= (getValueByKey!726 lt!669549 (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!800 (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161687 (= lt!669551 (lemmaContainsTupThenGetReturnValue!373 lt!669549 (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161687 (= lt!669549 (insertStrictlySorted!502 (toList!11200 lt!669449) (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161687 (= (+!5030 lt!669449 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669552)))

(declare-fun b!1553803 () Bool)

(declare-fun res!1063263 () Bool)

(assert (=> b!1553803 (=> (not res!1063263) (not e!865114))))

(assert (=> b!1553803 (= res!1063263 (= (getValueByKey!726 (toList!11200 lt!669552) (_1!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!800 (_2!12387 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1553804 () Bool)

(assert (=> b!1553804 (= e!865114 (contains!10159 (toList!11200 lt!669552) (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161687 res!1063264) b!1553803))

(assert (= (and b!1553803 res!1063263) b!1553804))

(declare-fun m!1432327 () Bool)

(assert (=> d!161687 m!1432327))

(declare-fun m!1432329 () Bool)

(assert (=> d!161687 m!1432329))

(declare-fun m!1432331 () Bool)

(assert (=> d!161687 m!1432331))

(declare-fun m!1432333 () Bool)

(assert (=> d!161687 m!1432333))

(declare-fun m!1432335 () Bool)

(assert (=> b!1553803 m!1432335))

(declare-fun m!1432337 () Bool)

(assert (=> b!1553804 m!1432337))

(assert (=> b!1553608 d!161687))

(declare-fun d!161689 () Bool)

(assert (=> d!161689 (= (apply!1100 lt!669449 (select (arr!50022 _keys!618) from!762)) (get!26061 (getValueByKey!726 (toList!11200 lt!669449) (select (arr!50022 _keys!618) from!762))))))

(declare-fun bs!44593 () Bool)

(assert (= bs!44593 d!161689))

(assert (=> bs!44593 m!1432115))

(assert (=> bs!44593 m!1432299))

(assert (=> bs!44593 m!1432299))

(declare-fun m!1432339 () Bool)

(assert (=> bs!44593 m!1432339))

(assert (=> b!1553608 d!161689))

(declare-fun d!161691 () Bool)

(assert (=> d!161691 (= (apply!1100 (+!5030 lt!669449 (tuple2!24753 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50022 _keys!618) from!762)) (apply!1100 lt!669449 (select (arr!50022 _keys!618) from!762)))))

(declare-fun lt!669555 () Unit!51579)

(declare-fun choose!2027 (ListLongMap!22369 (_ BitVec 64) V!59333 (_ BitVec 64)) Unit!51579)

(assert (=> d!161691 (= lt!669555 (choose!2027 lt!669449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50022 _keys!618) from!762)))))

(declare-fun e!865117 () Bool)

(assert (=> d!161691 e!865117))

(declare-fun res!1063267 () Bool)

(assert (=> d!161691 (=> (not res!1063267) (not e!865117))))

(assert (=> d!161691 (= res!1063267 (contains!10157 lt!669449 (select (arr!50022 _keys!618) from!762)))))

(assert (=> d!161691 (= (addApplyDifferent!627 lt!669449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50022 _keys!618) from!762)) lt!669555)))

(declare-fun b!1553808 () Bool)

(assert (=> b!1553808 (= e!865117 (not (= (select (arr!50022 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161691 res!1063267) b!1553808))

(assert (=> d!161691 m!1432123))

(assert (=> d!161691 m!1432115))

(assert (=> d!161691 m!1432125))

(assert (=> d!161691 m!1432115))

(assert (=> d!161691 m!1432121))

(assert (=> d!161691 m!1432123))

(assert (=> d!161691 m!1432115))

(declare-fun m!1432341 () Bool)

(assert (=> d!161691 m!1432341))

(assert (=> d!161691 m!1432115))

(assert (=> d!161691 m!1432131))

(assert (=> b!1553608 d!161691))

(declare-fun mapIsEmpty!58969 () Bool)

(declare-fun mapRes!58969 () Bool)

(assert (=> mapIsEmpty!58969 mapRes!58969))

(declare-fun b!1553815 () Bool)

(declare-fun e!865122 () Bool)

(assert (=> b!1553815 (= e!865122 tp_is_empty!38167)))

(declare-fun condMapEmpty!58969 () Bool)

(declare-fun mapDefault!58969 () ValueCell!18173)

(assert (=> mapNonEmpty!58960 (= condMapEmpty!58969 (= mapRest!58960 ((as const (Array (_ BitVec 32) ValueCell!18173)) mapDefault!58969)))))

(declare-fun e!865123 () Bool)

(assert (=> mapNonEmpty!58960 (= tp!111931 (and e!865123 mapRes!58969))))

(declare-fun mapNonEmpty!58969 () Bool)

(declare-fun tp!111946 () Bool)

(assert (=> mapNonEmpty!58969 (= mapRes!58969 (and tp!111946 e!865122))))

(declare-fun mapRest!58969 () (Array (_ BitVec 32) ValueCell!18173))

(declare-fun mapValue!58969 () ValueCell!18173)

(declare-fun mapKey!58969 () (_ BitVec 32))

(assert (=> mapNonEmpty!58969 (= mapRest!58960 (store mapRest!58969 mapKey!58969 mapValue!58969))))

(declare-fun b!1553816 () Bool)

(assert (=> b!1553816 (= e!865123 tp_is_empty!38167)))

(assert (= (and mapNonEmpty!58960 condMapEmpty!58969) mapIsEmpty!58969))

(assert (= (and mapNonEmpty!58960 (not condMapEmpty!58969)) mapNonEmpty!58969))

(assert (= (and mapNonEmpty!58969 ((_ is ValueCellFull!18173) mapValue!58969)) b!1553815))

(assert (= (and mapNonEmpty!58960 ((_ is ValueCellFull!18173) mapDefault!58969)) b!1553816))

(declare-fun m!1432343 () Bool)

(assert (=> mapNonEmpty!58969 m!1432343))

(declare-fun b_lambda!24769 () Bool)

(assert (= b_lambda!24767 (or (and start!132628 b_free!31891) b_lambda!24769)))

(declare-fun b_lambda!24771 () Bool)

(assert (= b_lambda!24765 (or (and start!132628 b_free!31891) b_lambda!24771)))

(check-sat (not bm!71127) (not d!161691) (not b!1553765) (not b!1553784) (not b!1553755) (not b!1553800) (not b!1553798) (not b!1553804) (not b!1553760) (not b!1553763) (not d!161661) (not d!161685) (not b!1553756) (not b!1553803) (not b!1553795) (not b!1553778) (not bm!71121) (not b!1553799) b_and!51331 (not b!1553764) (not b!1553776) (not b!1553802) (not b!1553726) (not b!1553728) (not d!161681) (not d!161679) (not b!1553787) (not d!161673) (not mapNonEmpty!58969) (not d!161689) (not d!161677) (not b_lambda!24771) (not bm!71124) (not b_next!31891) (not b_lambda!24769) (not b!1553727) (not b!1553797) (not b!1553759) (not d!161683) (not b!1553786) (not b!1553785) tp_is_empty!38167 (not b!1553758) (not d!161675) (not d!161687))
(check-sat b_and!51331 (not b_next!31891))
