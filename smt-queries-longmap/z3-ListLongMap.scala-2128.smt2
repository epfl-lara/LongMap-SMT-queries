; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35998 () Bool)

(assert start!35998)

(declare-fun b!361580 () Bool)

(declare-fun res!201141 () Bool)

(declare-fun e!221447 () Bool)

(assert (=> b!361580 (=> (not res!201141) (not e!221447))))

(declare-datatypes ((array!20333 0))(
  ( (array!20334 (arr!9654 (Array (_ BitVec 32) (_ BitVec 64))) (size!10006 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20333)

(declare-datatypes ((List!5511 0))(
  ( (Nil!5508) (Cons!5507 (h!6363 (_ BitVec 64)) (t!10661 List!5511)) )
))
(declare-fun arrayNoDuplicates!0 (array!20333 (_ BitVec 32) List!5511) Bool)

(assert (=> b!361580 (= res!201141 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5508))))

(declare-fun mapIsEmpty!14112 () Bool)

(declare-fun mapRes!14112 () Bool)

(assert (=> mapIsEmpty!14112 mapRes!14112))

(declare-fun res!201140 () Bool)

(assert (=> start!35998 (=> (not res!201140) (not e!221447))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35998 (= res!201140 (validMask!0 mask!1943))))

(assert (=> start!35998 e!221447))

(assert (=> start!35998 true))

(declare-fun array_inv!7100 (array!20333) Bool)

(assert (=> start!35998 (array_inv!7100 _keys!1541)))

(declare-datatypes ((V!12165 0))(
  ( (V!12166 (val!4240 Int)) )
))
(declare-datatypes ((ValueCell!3852 0))(
  ( (ValueCellFull!3852 (v!6435 V!12165)) (EmptyCell!3852) )
))
(declare-datatypes ((array!20335 0))(
  ( (array!20336 (arr!9655 (Array (_ BitVec 32) ValueCell!3852)) (size!10007 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20335)

(declare-fun e!221448 () Bool)

(declare-fun array_inv!7101 (array!20335) Bool)

(assert (=> start!35998 (and (array_inv!7101 _values!1277) e!221448)))

(declare-fun b!361581 () Bool)

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361581 (= e!221447 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10006 _keys!1541)) (bvsge (size!10006 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361582 () Bool)

(declare-fun res!201143 () Bool)

(assert (=> b!361582 (=> (not res!201143) (not e!221447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20333 (_ BitVec 32)) Bool)

(assert (=> b!361582 (= res!201143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361583 () Bool)

(declare-fun res!201142 () Bool)

(assert (=> b!361583 (=> (not res!201142) (not e!221447))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361583 (= res!201142 (and (= (size!10007 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10006 _keys!1541) (size!10007 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361584 () Bool)

(declare-fun e!221450 () Bool)

(declare-fun tp_is_empty!8391 () Bool)

(assert (=> b!361584 (= e!221450 tp_is_empty!8391)))

(declare-fun mapNonEmpty!14112 () Bool)

(declare-fun tp!28188 () Bool)

(declare-fun e!221451 () Bool)

(assert (=> mapNonEmpty!14112 (= mapRes!14112 (and tp!28188 e!221451))))

(declare-fun mapRest!14112 () (Array (_ BitVec 32) ValueCell!3852))

(declare-fun mapKey!14112 () (_ BitVec 32))

(declare-fun mapValue!14112 () ValueCell!3852)

(assert (=> mapNonEmpty!14112 (= (arr!9655 _values!1277) (store mapRest!14112 mapKey!14112 mapValue!14112))))

(declare-fun b!361585 () Bool)

(assert (=> b!361585 (= e!221451 tp_is_empty!8391)))

(declare-fun b!361586 () Bool)

(assert (=> b!361586 (= e!221448 (and e!221450 mapRes!14112))))

(declare-fun condMapEmpty!14112 () Bool)

(declare-fun mapDefault!14112 () ValueCell!3852)

(assert (=> b!361586 (= condMapEmpty!14112 (= (arr!9655 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3852)) mapDefault!14112)))))

(assert (= (and start!35998 res!201140) b!361583))

(assert (= (and b!361583 res!201142) b!361582))

(assert (= (and b!361582 res!201143) b!361580))

(assert (= (and b!361580 res!201141) b!361581))

(assert (= (and b!361586 condMapEmpty!14112) mapIsEmpty!14112))

(assert (= (and b!361586 (not condMapEmpty!14112)) mapNonEmpty!14112))

(get-info :version)

(assert (= (and mapNonEmpty!14112 ((_ is ValueCellFull!3852) mapValue!14112)) b!361585))

(assert (= (and b!361586 ((_ is ValueCellFull!3852) mapDefault!14112)) b!361584))

(assert (= start!35998 b!361586))

(declare-fun m!358357 () Bool)

(assert (=> b!361580 m!358357))

(declare-fun m!358359 () Bool)

(assert (=> start!35998 m!358359))

(declare-fun m!358361 () Bool)

(assert (=> start!35998 m!358361))

(declare-fun m!358363 () Bool)

(assert (=> start!35998 m!358363))

(declare-fun m!358365 () Bool)

(assert (=> b!361582 m!358365))

(declare-fun m!358367 () Bool)

(assert (=> mapNonEmpty!14112 m!358367))

(check-sat (not start!35998) (not mapNonEmpty!14112) (not b!361582) (not b!361580) tp_is_empty!8391)
(check-sat)
(get-model)

(declare-fun b!361616 () Bool)

(declare-fun e!221474 () Bool)

(declare-fun e!221473 () Bool)

(assert (=> b!361616 (= e!221474 e!221473)))

(declare-fun c!53730 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361616 (= c!53730 (validKeyInArray!0 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27178 () Bool)

(declare-fun call!27181 () Bool)

(assert (=> bm!27178 (= call!27181 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361617 () Bool)

(assert (=> b!361617 (= e!221473 call!27181)))

(declare-fun d!71941 () Bool)

(declare-fun res!201161 () Bool)

(assert (=> d!71941 (=> res!201161 e!221474)))

(assert (=> d!71941 (= res!201161 (bvsge #b00000000000000000000000000000000 (size!10006 _keys!1541)))))

(assert (=> d!71941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221474)))

(declare-fun b!361618 () Bool)

(declare-fun e!221475 () Bool)

(assert (=> b!361618 (= e!221475 call!27181)))

(declare-fun b!361619 () Bool)

(assert (=> b!361619 (= e!221473 e!221475)))

(declare-fun lt!166583 () (_ BitVec 64))

(assert (=> b!361619 (= lt!166583 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11116 0))(
  ( (Unit!11117) )
))
(declare-fun lt!166582 () Unit!11116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20333 (_ BitVec 64) (_ BitVec 32)) Unit!11116)

(assert (=> b!361619 (= lt!166582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166583 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361619 (arrayContainsKey!0 _keys!1541 lt!166583 #b00000000000000000000000000000000)))

(declare-fun lt!166584 () Unit!11116)

(assert (=> b!361619 (= lt!166584 lt!166582)))

(declare-fun res!201160 () Bool)

(declare-datatypes ((SeekEntryResult!3496 0))(
  ( (MissingZero!3496 (index!16163 (_ BitVec 32))) (Found!3496 (index!16164 (_ BitVec 32))) (Intermediate!3496 (undefined!4308 Bool) (index!16165 (_ BitVec 32)) (x!36038 (_ BitVec 32))) (Undefined!3496) (MissingVacant!3496 (index!16166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20333 (_ BitVec 32)) SeekEntryResult!3496)

(assert (=> b!361619 (= res!201160 (= (seekEntryOrOpen!0 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3496 #b00000000000000000000000000000000)))))

(assert (=> b!361619 (=> (not res!201160) (not e!221475))))

(assert (= (and d!71941 (not res!201161)) b!361616))

(assert (= (and b!361616 c!53730) b!361619))

(assert (= (and b!361616 (not c!53730)) b!361617))

(assert (= (and b!361619 res!201160) b!361618))

(assert (= (or b!361618 b!361617) bm!27178))

(declare-fun m!358381 () Bool)

(assert (=> b!361616 m!358381))

(assert (=> b!361616 m!358381))

(declare-fun m!358383 () Bool)

(assert (=> b!361616 m!358383))

(declare-fun m!358385 () Bool)

(assert (=> bm!27178 m!358385))

(assert (=> b!361619 m!358381))

(declare-fun m!358387 () Bool)

(assert (=> b!361619 m!358387))

(declare-fun m!358389 () Bool)

(assert (=> b!361619 m!358389))

(assert (=> b!361619 m!358381))

(declare-fun m!358391 () Bool)

(assert (=> b!361619 m!358391))

(assert (=> b!361582 d!71941))

(declare-fun d!71943 () Bool)

(assert (=> d!71943 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35998 d!71943))

(declare-fun d!71945 () Bool)

(assert (=> d!71945 (= (array_inv!7100 _keys!1541) (bvsge (size!10006 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35998 d!71945))

(declare-fun d!71947 () Bool)

(assert (=> d!71947 (= (array_inv!7101 _values!1277) (bvsge (size!10007 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35998 d!71947))

(declare-fun bm!27181 () Bool)

(declare-fun call!27184 () Bool)

(declare-fun c!53733 () Bool)

(assert (=> bm!27181 (= call!27184 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53733 (Cons!5507 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000) Nil!5508) Nil!5508)))))

(declare-fun b!361630 () Bool)

(declare-fun e!221486 () Bool)

(assert (=> b!361630 (= e!221486 call!27184)))

(declare-fun b!361631 () Bool)

(declare-fun e!221487 () Bool)

(declare-fun contains!2427 (List!5511 (_ BitVec 64)) Bool)

(assert (=> b!361631 (= e!221487 (contains!2427 Nil!5508 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361632 () Bool)

(declare-fun e!221485 () Bool)

(assert (=> b!361632 (= e!221485 e!221486)))

(assert (=> b!361632 (= c!53733 (validKeyInArray!0 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71949 () Bool)

(declare-fun res!201168 () Bool)

(declare-fun e!221484 () Bool)

(assert (=> d!71949 (=> res!201168 e!221484)))

(assert (=> d!71949 (= res!201168 (bvsge #b00000000000000000000000000000000 (size!10006 _keys!1541)))))

(assert (=> d!71949 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5508) e!221484)))

(declare-fun b!361633 () Bool)

(assert (=> b!361633 (= e!221486 call!27184)))

(declare-fun b!361634 () Bool)

(assert (=> b!361634 (= e!221484 e!221485)))

(declare-fun res!201170 () Bool)

(assert (=> b!361634 (=> (not res!201170) (not e!221485))))

(assert (=> b!361634 (= res!201170 (not e!221487))))

(declare-fun res!201169 () Bool)

(assert (=> b!361634 (=> (not res!201169) (not e!221487))))

(assert (=> b!361634 (= res!201169 (validKeyInArray!0 (select (arr!9654 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71949 (not res!201168)) b!361634))

(assert (= (and b!361634 res!201169) b!361631))

(assert (= (and b!361634 res!201170) b!361632))

(assert (= (and b!361632 c!53733) b!361630))

(assert (= (and b!361632 (not c!53733)) b!361633))

(assert (= (or b!361630 b!361633) bm!27181))

(assert (=> bm!27181 m!358381))

(declare-fun m!358393 () Bool)

(assert (=> bm!27181 m!358393))

(assert (=> b!361631 m!358381))

(assert (=> b!361631 m!358381))

(declare-fun m!358395 () Bool)

(assert (=> b!361631 m!358395))

(assert (=> b!361632 m!358381))

(assert (=> b!361632 m!358381))

(assert (=> b!361632 m!358383))

(assert (=> b!361634 m!358381))

(assert (=> b!361634 m!358381))

(assert (=> b!361634 m!358383))

(assert (=> b!361580 d!71949))

(declare-fun condMapEmpty!14118 () Bool)

(declare-fun mapDefault!14118 () ValueCell!3852)

(assert (=> mapNonEmpty!14112 (= condMapEmpty!14118 (= mapRest!14112 ((as const (Array (_ BitVec 32) ValueCell!3852)) mapDefault!14118)))))

(declare-fun e!221493 () Bool)

(declare-fun mapRes!14118 () Bool)

(assert (=> mapNonEmpty!14112 (= tp!28188 (and e!221493 mapRes!14118))))

(declare-fun b!361642 () Bool)

(assert (=> b!361642 (= e!221493 tp_is_empty!8391)))

(declare-fun mapIsEmpty!14118 () Bool)

(assert (=> mapIsEmpty!14118 mapRes!14118))

(declare-fun mapNonEmpty!14118 () Bool)

(declare-fun tp!28194 () Bool)

(declare-fun e!221492 () Bool)

(assert (=> mapNonEmpty!14118 (= mapRes!14118 (and tp!28194 e!221492))))

(declare-fun mapRest!14118 () (Array (_ BitVec 32) ValueCell!3852))

(declare-fun mapValue!14118 () ValueCell!3852)

(declare-fun mapKey!14118 () (_ BitVec 32))

(assert (=> mapNonEmpty!14118 (= mapRest!14112 (store mapRest!14118 mapKey!14118 mapValue!14118))))

(declare-fun b!361641 () Bool)

(assert (=> b!361641 (= e!221492 tp_is_empty!8391)))

(assert (= (and mapNonEmpty!14112 condMapEmpty!14118) mapIsEmpty!14118))

(assert (= (and mapNonEmpty!14112 (not condMapEmpty!14118)) mapNonEmpty!14118))

(assert (= (and mapNonEmpty!14118 ((_ is ValueCellFull!3852) mapValue!14118)) b!361641))

(assert (= (and mapNonEmpty!14112 ((_ is ValueCellFull!3852) mapDefault!14118)) b!361642))

(declare-fun m!358397 () Bool)

(assert (=> mapNonEmpty!14118 m!358397))

(check-sat (not bm!27181) (not mapNonEmpty!14118) (not b!361616) (not b!361632) (not b!361619) (not b!361631) (not b!361634) (not bm!27178) tp_is_empty!8391)
(check-sat)
