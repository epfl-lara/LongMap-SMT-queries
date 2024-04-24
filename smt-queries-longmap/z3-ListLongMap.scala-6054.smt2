; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78482 () Bool)

(assert start!78482)

(declare-fun b_free!16735 () Bool)

(declare-fun b_next!16735 () Bool)

(assert (=> start!78482 (= b_free!16735 (not b_next!16735))))

(declare-fun tp!58489 () Bool)

(declare-fun b_and!27335 () Bool)

(assert (=> start!78482 (= tp!58489 b_and!27335)))

(declare-fun b!914656 () Bool)

(declare-fun res!616648 () Bool)

(declare-fun e!513143 () Bool)

(assert (=> b!914656 (=> (not res!616648) (not e!513143))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54357 0))(
  ( (array!54358 (arr!26126 (Array (_ BitVec 32) (_ BitVec 64))) (size!26586 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54357)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!914656 (= res!616648 (and (= (select (arr!26126 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914657 () Bool)

(declare-fun res!616645 () Bool)

(assert (=> b!914657 (=> (not res!616645) (not e!513143))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54357 (_ BitVec 32)) Bool)

(assert (=> b!914657 (= res!616645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914658 () Bool)

(declare-fun e!513144 () Bool)

(assert (=> b!914658 (= e!513143 (not e!513144))))

(declare-fun res!616647 () Bool)

(assert (=> b!914658 (=> res!616647 e!513144)))

(assert (=> b!914658 (= res!616647 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26586 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!54357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914658 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30503 0))(
  ( (V!30504 (val!9627 Int)) )
))
(declare-datatypes ((ValueCell!9095 0))(
  ( (ValueCellFull!9095 (v!12138 V!30503)) (EmptyCell!9095) )
))
(declare-datatypes ((array!54359 0))(
  ( (array!54360 (arr!26127 (Array (_ BitVec 32) ValueCell!9095)) (size!26587 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54359)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30503)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30503)

(declare-datatypes ((Unit!30914 0))(
  ( (Unit!30915) )
))
(declare-fun lt!411472 () Unit!30914)

(declare-fun lemmaKeyInListMapIsInArray!281 (array!54357 array!54359 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 64) Int) Unit!30914)

(assert (=> b!914658 (= lt!411472 (lemmaKeyInListMapIsInArray!281 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!30464 () Bool)

(declare-fun mapRes!30464 () Bool)

(declare-fun tp!58490 () Bool)

(declare-fun e!513145 () Bool)

(assert (=> mapNonEmpty!30464 (= mapRes!30464 (and tp!58490 e!513145))))

(declare-fun mapKey!30464 () (_ BitVec 32))

(declare-fun mapRest!30464 () (Array (_ BitVec 32) ValueCell!9095))

(declare-fun mapValue!30464 () ValueCell!9095)

(assert (=> mapNonEmpty!30464 (= (arr!26127 _values!1152) (store mapRest!30464 mapKey!30464 mapValue!30464))))

(declare-fun e!513147 () Bool)

(declare-fun b!914659 () Bool)

(declare-datatypes ((tuple2!12504 0))(
  ( (tuple2!12505 (_1!6263 (_ BitVec 64)) (_2!6263 V!30503)) )
))
(declare-datatypes ((List!18320 0))(
  ( (Nil!18317) (Cons!18316 (h!19468 tuple2!12504) (t!25907 List!18320)) )
))
(declare-datatypes ((ListLongMap!11203 0))(
  ( (ListLongMap!11204 (toList!5617 List!18320)) )
))
(declare-fun lt!411473 () ListLongMap!11203)

(declare-fun apply!528 (ListLongMap!11203 (_ BitVec 64)) V!30503)

(declare-fun get!13725 (ValueCell!9095 V!30503) V!30503)

(declare-fun dynLambda!1409 (Int (_ BitVec 64)) V!30503)

(assert (=> b!914659 (= e!513147 (= (apply!528 lt!411473 k0!1033) (get!13725 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914661 () Bool)

(declare-fun tp_is_empty!19153 () Bool)

(assert (=> b!914661 (= e!513145 tp_is_empty!19153)))

(declare-fun b!914662 () Bool)

(declare-fun res!616646 () Bool)

(assert (=> b!914662 (=> (not res!616646) (not e!513143))))

(declare-datatypes ((List!18321 0))(
  ( (Nil!18318) (Cons!18317 (h!19469 (_ BitVec 64)) (t!25908 List!18321)) )
))
(declare-fun arrayNoDuplicates!0 (array!54357 (_ BitVec 32) List!18321) Bool)

(assert (=> b!914662 (= res!616646 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18318))))

(declare-fun mapIsEmpty!30464 () Bool)

(assert (=> mapIsEmpty!30464 mapRes!30464))

(declare-fun b!914663 () Bool)

(declare-fun res!616650 () Bool)

(assert (=> b!914663 (=> (not res!616650) (not e!513143))))

(assert (=> b!914663 (= res!616650 (and (= (size!26587 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26586 _keys!1386) (size!26587 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914664 () Bool)

(assert (=> b!914664 (= e!513144 e!513147)))

(declare-fun res!616649 () Bool)

(assert (=> b!914664 (=> res!616649 e!513147)))

(declare-fun contains!4675 (ListLongMap!11203 (_ BitVec 64)) Bool)

(assert (=> b!914664 (= res!616649 (not (contains!4675 lt!411473 k0!1033)))))

(declare-fun getCurrentListMap!2878 (array!54357 array!54359 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 32) Int) ListLongMap!11203)

(assert (=> b!914664 (= lt!411473 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!914665 () Bool)

(declare-fun e!513148 () Bool)

(declare-fun e!513146 () Bool)

(assert (=> b!914665 (= e!513148 (and e!513146 mapRes!30464))))

(declare-fun condMapEmpty!30464 () Bool)

(declare-fun mapDefault!30464 () ValueCell!9095)

(assert (=> b!914665 (= condMapEmpty!30464 (= (arr!26127 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9095)) mapDefault!30464)))))

(declare-fun b!914666 () Bool)

(declare-fun res!616651 () Bool)

(assert (=> b!914666 (=> (not res!616651) (not e!513143))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914666 (= res!616651 (inRange!0 i!717 mask!1756))))

(declare-fun b!914667 () Bool)

(declare-fun res!616652 () Bool)

(assert (=> b!914667 (=> (not res!616652) (not e!513143))))

(assert (=> b!914667 (= res!616652 (contains!4675 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!914660 () Bool)

(assert (=> b!914660 (= e!513146 tp_is_empty!19153)))

(declare-fun res!616653 () Bool)

(assert (=> start!78482 (=> (not res!616653) (not e!513143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78482 (= res!616653 (validMask!0 mask!1756))))

(assert (=> start!78482 e!513143))

(declare-fun array_inv!20494 (array!54359) Bool)

(assert (=> start!78482 (and (array_inv!20494 _values!1152) e!513148)))

(assert (=> start!78482 tp!58489))

(assert (=> start!78482 true))

(assert (=> start!78482 tp_is_empty!19153))

(declare-fun array_inv!20495 (array!54357) Bool)

(assert (=> start!78482 (array_inv!20495 _keys!1386)))

(assert (= (and start!78482 res!616653) b!914663))

(assert (= (and b!914663 res!616650) b!914657))

(assert (= (and b!914657 res!616645) b!914662))

(assert (= (and b!914662 res!616646) b!914667))

(assert (= (and b!914667 res!616652) b!914666))

(assert (= (and b!914666 res!616651) b!914656))

(assert (= (and b!914656 res!616648) b!914658))

(assert (= (and b!914658 (not res!616647)) b!914664))

(assert (= (and b!914664 (not res!616649)) b!914659))

(assert (= (and b!914665 condMapEmpty!30464) mapIsEmpty!30464))

(assert (= (and b!914665 (not condMapEmpty!30464)) mapNonEmpty!30464))

(get-info :version)

(assert (= (and mapNonEmpty!30464 ((_ is ValueCellFull!9095) mapValue!30464)) b!914661))

(assert (= (and b!914665 ((_ is ValueCellFull!9095) mapDefault!30464)) b!914660))

(assert (= start!78482 b!914665))

(declare-fun b_lambda!13353 () Bool)

(assert (=> (not b_lambda!13353) (not b!914659)))

(declare-fun t!25906 () Bool)

(declare-fun tb!5437 () Bool)

(assert (=> (and start!78482 (= defaultEntry!1160 defaultEntry!1160) t!25906) tb!5437))

(declare-fun result!10691 () Bool)

(assert (=> tb!5437 (= result!10691 tp_is_empty!19153)))

(assert (=> b!914659 t!25906))

(declare-fun b_and!27337 () Bool)

(assert (= b_and!27335 (and (=> t!25906 result!10691) b_and!27337)))

(declare-fun m!849567 () Bool)

(assert (=> b!914657 m!849567))

(declare-fun m!849569 () Bool)

(assert (=> b!914659 m!849569))

(declare-fun m!849571 () Bool)

(assert (=> b!914659 m!849571))

(declare-fun m!849573 () Bool)

(assert (=> b!914659 m!849573))

(assert (=> b!914659 m!849571))

(assert (=> b!914659 m!849573))

(declare-fun m!849575 () Bool)

(assert (=> b!914659 m!849575))

(declare-fun m!849577 () Bool)

(assert (=> b!914664 m!849577))

(declare-fun m!849579 () Bool)

(assert (=> b!914664 m!849579))

(declare-fun m!849581 () Bool)

(assert (=> mapNonEmpty!30464 m!849581))

(declare-fun m!849583 () Bool)

(assert (=> b!914658 m!849583))

(declare-fun m!849585 () Bool)

(assert (=> b!914658 m!849585))

(declare-fun m!849587 () Bool)

(assert (=> b!914662 m!849587))

(declare-fun m!849589 () Bool)

(assert (=> b!914666 m!849589))

(declare-fun m!849591 () Bool)

(assert (=> start!78482 m!849591))

(declare-fun m!849593 () Bool)

(assert (=> start!78482 m!849593))

(declare-fun m!849595 () Bool)

(assert (=> start!78482 m!849595))

(declare-fun m!849597 () Bool)

(assert (=> b!914656 m!849597))

(declare-fun m!849599 () Bool)

(assert (=> b!914667 m!849599))

(assert (=> b!914667 m!849599))

(declare-fun m!849601 () Bool)

(assert (=> b!914667 m!849601))

(check-sat b_and!27337 (not mapNonEmpty!30464) (not b!914662) (not b!914666) (not start!78482) tp_is_empty!19153 (not b_lambda!13353) (not b_next!16735) (not b!914658) (not b!914657) (not b!914667) (not b!914659) (not b!914664))
(check-sat b_and!27337 (not b_next!16735))
(get-model)

(declare-fun b_lambda!13359 () Bool)

(assert (= b_lambda!13353 (or (and start!78482 b_free!16735) b_lambda!13359)))

(check-sat b_and!27337 (not mapNonEmpty!30464) (not b!914662) (not b!914666) (not start!78482) tp_is_empty!19153 (not b_next!16735) (not b!914658) (not b!914657) (not b!914667) (not b!914659) (not b!914664) (not b_lambda!13359))
(check-sat b_and!27337 (not b_next!16735))
(get-model)

(declare-fun d!112821 () Bool)

(declare-fun e!513195 () Bool)

(assert (=> d!112821 e!513195))

(declare-fun res!616710 () Bool)

(assert (=> d!112821 (=> res!616710 e!513195)))

(declare-fun lt!411495 () Bool)

(assert (=> d!112821 (= res!616710 (not lt!411495))))

(declare-fun lt!411494 () Bool)

(assert (=> d!112821 (= lt!411495 lt!411494)))

(declare-fun lt!411497 () Unit!30914)

(declare-fun e!513196 () Unit!30914)

(assert (=> d!112821 (= lt!411497 e!513196)))

(declare-fun c!96201 () Bool)

(assert (=> d!112821 (= c!96201 lt!411494)))

(declare-fun containsKey!445 (List!18320 (_ BitVec 64)) Bool)

(assert (=> d!112821 (= lt!411494 (containsKey!445 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112821 (= (contains!4675 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!411495)))

(declare-fun b!914752 () Bool)

(declare-fun lt!411496 () Unit!30914)

(assert (=> b!914752 (= e!513196 lt!411496)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!339 (List!18320 (_ BitVec 64)) Unit!30914)

(assert (=> b!914752 (= lt!411496 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!480 0))(
  ( (Some!479 (v!12141 V!30503)) (None!478) )
))
(declare-fun isDefined!347 (Option!480) Bool)

(declare-fun getValueByKey!474 (List!18320 (_ BitVec 64)) Option!480)

(assert (=> b!914752 (isDefined!347 (getValueByKey!474 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!914753 () Bool)

(declare-fun Unit!30918 () Unit!30914)

(assert (=> b!914753 (= e!513196 Unit!30918)))

(declare-fun b!914754 () Bool)

(assert (=> b!914754 (= e!513195 (isDefined!347 (getValueByKey!474 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112821 c!96201) b!914752))

(assert (= (and d!112821 (not c!96201)) b!914753))

(assert (= (and d!112821 (not res!616710)) b!914754))

(declare-fun m!849675 () Bool)

(assert (=> d!112821 m!849675))

(declare-fun m!849677 () Bool)

(assert (=> b!914752 m!849677))

(declare-fun m!849679 () Bool)

(assert (=> b!914752 m!849679))

(assert (=> b!914752 m!849679))

(declare-fun m!849681 () Bool)

(assert (=> b!914752 m!849681))

(assert (=> b!914754 m!849679))

(assert (=> b!914754 m!849679))

(assert (=> b!914754 m!849681))

(assert (=> b!914667 d!112821))

(declare-fun b!914797 () Bool)

(declare-fun e!513226 () Bool)

(declare-fun call!40526 () Bool)

(assert (=> b!914797 (= e!513226 (not call!40526))))

(declare-fun b!914798 () Bool)

(declare-fun e!513224 () Bool)

(declare-fun call!40523 () Bool)

(assert (=> b!914798 (= e!513224 (not call!40523))))

(declare-fun b!914799 () Bool)

(declare-fun e!513231 () Bool)

(declare-fun lt!411545 () ListLongMap!11203)

(assert (=> b!914799 (= e!513231 (= (apply!528 lt!411545 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914800 () Bool)

(declare-fun e!513232 () Bool)

(assert (=> b!914800 (= e!513224 e!513232)))

(declare-fun res!616733 () Bool)

(assert (=> b!914800 (= res!616733 call!40523)))

(assert (=> b!914800 (=> (not res!616733) (not e!513232))))

(declare-fun b!914801 () Bool)

(declare-fun res!616729 () Bool)

(declare-fun e!513233 () Bool)

(assert (=> b!914801 (=> (not res!616729) (not e!513233))))

(declare-fun e!513229 () Bool)

(assert (=> b!914801 (= res!616729 e!513229)))

(declare-fun res!616736 () Bool)

(assert (=> b!914801 (=> res!616736 e!513229)))

(declare-fun e!513234 () Bool)

(assert (=> b!914801 (= res!616736 (not e!513234))))

(declare-fun res!616737 () Bool)

(assert (=> b!914801 (=> (not res!616737) (not e!513234))))

(assert (=> b!914801 (= res!616737 (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(declare-fun b!914802 () Bool)

(declare-fun e!513225 () ListLongMap!11203)

(declare-fun e!513235 () ListLongMap!11203)

(assert (=> b!914802 (= e!513225 e!513235)))

(declare-fun c!96219 () Bool)

(assert (=> b!914802 (= c!96219 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40518 () Bool)

(declare-fun call!40522 () ListLongMap!11203)

(declare-fun call!40521 () ListLongMap!11203)

(assert (=> bm!40518 (= call!40522 call!40521)))

(declare-fun b!914803 () Bool)

(assert (=> b!914803 (= e!513226 e!513231)))

(declare-fun res!616734 () Bool)

(assert (=> b!914803 (= res!616734 call!40526)))

(assert (=> b!914803 (=> (not res!616734) (not e!513231))))

(declare-fun b!914804 () Bool)

(declare-fun e!513227 () Bool)

(assert (=> b!914804 (= e!513227 (= (apply!528 lt!411545 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) (get!13725 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26587 _values!1152)))))

(assert (=> b!914804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(declare-fun call!40527 () ListLongMap!11203)

(declare-fun bm!40519 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3340 (array!54357 array!54359 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 32) Int) ListLongMap!11203)

(assert (=> bm!40519 (= call!40527 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun bm!40520 () Bool)

(assert (=> bm!40520 (= call!40526 (contains!4675 lt!411545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40521 () Bool)

(declare-fun c!96216 () Bool)

(declare-fun call!40525 () ListLongMap!11203)

(declare-fun +!2619 (ListLongMap!11203 tuple2!12504) ListLongMap!11203)

(assert (=> bm!40521 (= call!40525 (+!2619 (ite c!96216 call!40527 (ite c!96219 call!40521 call!40522)) (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!914806 () Bool)

(declare-fun e!513223 () Unit!30914)

(declare-fun lt!411549 () Unit!30914)

(assert (=> b!914806 (= e!513223 lt!411549)))

(declare-fun lt!411550 () ListLongMap!11203)

(assert (=> b!914806 (= lt!411550 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411563 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411548 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411548 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411553 () Unit!30914)

(declare-fun addStillContains!350 (ListLongMap!11203 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30914)

(assert (=> b!914806 (= lt!411553 (addStillContains!350 lt!411550 lt!411563 zeroValue!1094 lt!411548))))

(assert (=> b!914806 (contains!4675 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094)) lt!411548)))

(declare-fun lt!411554 () Unit!30914)

(assert (=> b!914806 (= lt!411554 lt!411553)))

(declare-fun lt!411558 () ListLongMap!11203)

(assert (=> b!914806 (= lt!411558 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411547 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411547 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411560 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411560 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411552 () Unit!30914)

(declare-fun addApplyDifferent!350 (ListLongMap!11203 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30914)

(assert (=> b!914806 (= lt!411552 (addApplyDifferent!350 lt!411558 lt!411547 minValue!1094 lt!411560))))

(assert (=> b!914806 (= (apply!528 (+!2619 lt!411558 (tuple2!12505 lt!411547 minValue!1094)) lt!411560) (apply!528 lt!411558 lt!411560))))

(declare-fun lt!411542 () Unit!30914)

(assert (=> b!914806 (= lt!411542 lt!411552)))

(declare-fun lt!411555 () ListLongMap!11203)

(assert (=> b!914806 (= lt!411555 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411561 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411544 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411544 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411562 () Unit!30914)

(assert (=> b!914806 (= lt!411562 (addApplyDifferent!350 lt!411555 lt!411561 zeroValue!1094 lt!411544))))

(assert (=> b!914806 (= (apply!528 (+!2619 lt!411555 (tuple2!12505 lt!411561 zeroValue!1094)) lt!411544) (apply!528 lt!411555 lt!411544))))

(declare-fun lt!411556 () Unit!30914)

(assert (=> b!914806 (= lt!411556 lt!411562)))

(declare-fun lt!411543 () ListLongMap!11203)

(assert (=> b!914806 (= lt!411543 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!411559 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411559 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411551 () (_ BitVec 64))

(assert (=> b!914806 (= lt!411551 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!914806 (= lt!411549 (addApplyDifferent!350 lt!411543 lt!411559 minValue!1094 lt!411551))))

(assert (=> b!914806 (= (apply!528 (+!2619 lt!411543 (tuple2!12505 lt!411559 minValue!1094)) lt!411551) (apply!528 lt!411543 lt!411551))))

(declare-fun bm!40522 () Bool)

(assert (=> bm!40522 (= call!40521 call!40527)))

(declare-fun b!914807 () Bool)

(declare-fun e!513228 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!914807 (= e!513228 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914808 () Bool)

(declare-fun res!616730 () Bool)

(assert (=> b!914808 (=> (not res!616730) (not e!513233))))

(assert (=> b!914808 (= res!616730 e!513224)))

(declare-fun c!96215 () Bool)

(assert (=> b!914808 (= c!96215 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!914809 () Bool)

(declare-fun e!513230 () ListLongMap!11203)

(assert (=> b!914809 (= e!513230 call!40522)))

(declare-fun b!914810 () Bool)

(assert (=> b!914810 (= e!513232 (= (apply!528 lt!411545 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!914811 () Bool)

(assert (=> b!914811 (= e!513225 (+!2619 call!40525 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!914812 () Bool)

(declare-fun c!96217 () Bool)

(assert (=> b!914812 (= c!96217 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!914812 (= e!513235 e!513230)))

(declare-fun bm!40523 () Bool)

(assert (=> bm!40523 (= call!40523 (contains!4675 lt!411545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914813 () Bool)

(declare-fun call!40524 () ListLongMap!11203)

(assert (=> b!914813 (= e!513235 call!40524)))

(declare-fun bm!40524 () Bool)

(assert (=> bm!40524 (= call!40524 call!40525)))

(declare-fun b!914814 () Bool)

(assert (=> b!914814 (= e!513234 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914815 () Bool)

(assert (=> b!914815 (= e!513233 e!513226)))

(declare-fun c!96214 () Bool)

(assert (=> b!914815 (= c!96214 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!112823 () Bool)

(assert (=> d!112823 e!513233))

(declare-fun res!616731 () Bool)

(assert (=> d!112823 (=> (not res!616731) (not e!513233))))

(assert (=> d!112823 (= res!616731 (or (bvsge #b00000000000000000000000000000000 (size!26586 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))))

(declare-fun lt!411557 () ListLongMap!11203)

(assert (=> d!112823 (= lt!411545 lt!411557)))

(declare-fun lt!411546 () Unit!30914)

(assert (=> d!112823 (= lt!411546 e!513223)))

(declare-fun c!96218 () Bool)

(assert (=> d!112823 (= c!96218 e!513228)))

(declare-fun res!616732 () Bool)

(assert (=> d!112823 (=> (not res!616732) (not e!513228))))

(assert (=> d!112823 (= res!616732 (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(assert (=> d!112823 (= lt!411557 e!513225)))

(assert (=> d!112823 (= c!96216 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112823 (validMask!0 mask!1756)))

(assert (=> d!112823 (= (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411545)))

(declare-fun b!914805 () Bool)

(declare-fun Unit!30919 () Unit!30914)

(assert (=> b!914805 (= e!513223 Unit!30919)))

(declare-fun b!914816 () Bool)

(assert (=> b!914816 (= e!513230 call!40524)))

(declare-fun b!914817 () Bool)

(assert (=> b!914817 (= e!513229 e!513227)))

(declare-fun res!616735 () Bool)

(assert (=> b!914817 (=> (not res!616735) (not e!513227))))

(assert (=> b!914817 (= res!616735 (contains!4675 lt!411545 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(assert (= (and d!112823 c!96216) b!914811))

(assert (= (and d!112823 (not c!96216)) b!914802))

(assert (= (and b!914802 c!96219) b!914813))

(assert (= (and b!914802 (not c!96219)) b!914812))

(assert (= (and b!914812 c!96217) b!914816))

(assert (= (and b!914812 (not c!96217)) b!914809))

(assert (= (or b!914816 b!914809) bm!40518))

(assert (= (or b!914813 bm!40518) bm!40522))

(assert (= (or b!914813 b!914816) bm!40524))

(assert (= (or b!914811 bm!40522) bm!40519))

(assert (= (or b!914811 bm!40524) bm!40521))

(assert (= (and d!112823 res!616732) b!914807))

(assert (= (and d!112823 c!96218) b!914806))

(assert (= (and d!112823 (not c!96218)) b!914805))

(assert (= (and d!112823 res!616731) b!914801))

(assert (= (and b!914801 res!616737) b!914814))

(assert (= (and b!914801 (not res!616736)) b!914817))

(assert (= (and b!914817 res!616735) b!914804))

(assert (= (and b!914801 res!616729) b!914808))

(assert (= (and b!914808 c!96215) b!914800))

(assert (= (and b!914808 (not c!96215)) b!914798))

(assert (= (and b!914800 res!616733) b!914810))

(assert (= (or b!914800 b!914798) bm!40523))

(assert (= (and b!914808 res!616730) b!914815))

(assert (= (and b!914815 c!96214) b!914803))

(assert (= (and b!914815 (not c!96214)) b!914797))

(assert (= (and b!914803 res!616734) b!914799))

(assert (= (or b!914803 b!914797) bm!40520))

(declare-fun b_lambda!13361 () Bool)

(assert (=> (not b_lambda!13361) (not b!914804)))

(assert (=> b!914804 t!25906))

(declare-fun b_and!27347 () Bool)

(assert (= b_and!27337 (and (=> t!25906 result!10691) b_and!27347)))

(declare-fun m!849683 () Bool)

(assert (=> b!914817 m!849683))

(assert (=> b!914817 m!849683))

(declare-fun m!849685 () Bool)

(assert (=> b!914817 m!849685))

(assert (=> d!112823 m!849591))

(declare-fun m!849687 () Bool)

(assert (=> bm!40519 m!849687))

(declare-fun m!849689 () Bool)

(assert (=> b!914810 m!849689))

(declare-fun m!849691 () Bool)

(assert (=> bm!40523 m!849691))

(declare-fun m!849693 () Bool)

(assert (=> bm!40520 m!849693))

(declare-fun m!849695 () Bool)

(assert (=> bm!40521 m!849695))

(declare-fun m!849697 () Bool)

(assert (=> b!914806 m!849697))

(assert (=> b!914806 m!849697))

(declare-fun m!849699 () Bool)

(assert (=> b!914806 m!849699))

(declare-fun m!849701 () Bool)

(assert (=> b!914806 m!849701))

(declare-fun m!849703 () Bool)

(assert (=> b!914806 m!849703))

(declare-fun m!849705 () Bool)

(assert (=> b!914806 m!849705))

(declare-fun m!849707 () Bool)

(assert (=> b!914806 m!849707))

(declare-fun m!849709 () Bool)

(assert (=> b!914806 m!849709))

(declare-fun m!849711 () Bool)

(assert (=> b!914806 m!849711))

(declare-fun m!849713 () Bool)

(assert (=> b!914806 m!849713))

(assert (=> b!914806 m!849683))

(assert (=> b!914806 m!849703))

(declare-fun m!849715 () Bool)

(assert (=> b!914806 m!849715))

(declare-fun m!849717 () Bool)

(assert (=> b!914806 m!849717))

(assert (=> b!914806 m!849709))

(declare-fun m!849719 () Bool)

(assert (=> b!914806 m!849719))

(declare-fun m!849721 () Bool)

(assert (=> b!914806 m!849721))

(assert (=> b!914806 m!849707))

(declare-fun m!849723 () Bool)

(assert (=> b!914806 m!849723))

(declare-fun m!849725 () Bool)

(assert (=> b!914806 m!849725))

(assert (=> b!914806 m!849687))

(declare-fun m!849727 () Bool)

(assert (=> b!914804 m!849727))

(assert (=> b!914804 m!849573))

(declare-fun m!849729 () Bool)

(assert (=> b!914804 m!849729))

(assert (=> b!914804 m!849683))

(declare-fun m!849731 () Bool)

(assert (=> b!914804 m!849731))

(assert (=> b!914804 m!849727))

(assert (=> b!914804 m!849573))

(assert (=> b!914804 m!849683))

(declare-fun m!849733 () Bool)

(assert (=> b!914799 m!849733))

(assert (=> b!914814 m!849683))

(assert (=> b!914814 m!849683))

(declare-fun m!849735 () Bool)

(assert (=> b!914814 m!849735))

(declare-fun m!849737 () Bool)

(assert (=> b!914811 m!849737))

(assert (=> b!914807 m!849683))

(assert (=> b!914807 m!849683))

(assert (=> b!914807 m!849735))

(assert (=> b!914667 d!112823))

(declare-fun d!112825 () Bool)

(assert (=> d!112825 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78482 d!112825))

(declare-fun d!112827 () Bool)

(assert (=> d!112827 (= (array_inv!20494 _values!1152) (bvsge (size!26587 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78482 d!112827))

(declare-fun d!112829 () Bool)

(assert (=> d!112829 (= (array_inv!20495 _keys!1386) (bvsge (size!26586 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78482 d!112829))

(declare-fun d!112831 () Bool)

(declare-fun get!13728 (Option!480) V!30503)

(assert (=> d!112831 (= (apply!528 lt!411473 k0!1033) (get!13728 (getValueByKey!474 (toList!5617 lt!411473) k0!1033)))))

(declare-fun bs!25724 () Bool)

(assert (= bs!25724 d!112831))

(declare-fun m!849739 () Bool)

(assert (=> bs!25724 m!849739))

(assert (=> bs!25724 m!849739))

(declare-fun m!849741 () Bool)

(assert (=> bs!25724 m!849741))

(assert (=> b!914659 d!112831))

(declare-fun d!112833 () Bool)

(declare-fun c!96222 () Bool)

(assert (=> d!112833 (= c!96222 ((_ is ValueCellFull!9095) (select (arr!26127 _values!1152) i!717)))))

(declare-fun e!513238 () V!30503)

(assert (=> d!112833 (= (get!13725 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!513238)))

(declare-fun b!914822 () Bool)

(declare-fun get!13729 (ValueCell!9095 V!30503) V!30503)

(assert (=> b!914822 (= e!513238 (get!13729 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914823 () Bool)

(declare-fun get!13730 (ValueCell!9095 V!30503) V!30503)

(assert (=> b!914823 (= e!513238 (get!13730 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112833 c!96222) b!914822))

(assert (= (and d!112833 (not c!96222)) b!914823))

(assert (=> b!914822 m!849571))

(assert (=> b!914822 m!849573))

(declare-fun m!849743 () Bool)

(assert (=> b!914822 m!849743))

(assert (=> b!914823 m!849571))

(assert (=> b!914823 m!849573))

(declare-fun m!849745 () Bool)

(assert (=> b!914823 m!849745))

(assert (=> b!914659 d!112833))

(declare-fun d!112835 () Bool)

(declare-fun e!513239 () Bool)

(assert (=> d!112835 e!513239))

(declare-fun res!616738 () Bool)

(assert (=> d!112835 (=> res!616738 e!513239)))

(declare-fun lt!411565 () Bool)

(assert (=> d!112835 (= res!616738 (not lt!411565))))

(declare-fun lt!411564 () Bool)

(assert (=> d!112835 (= lt!411565 lt!411564)))

(declare-fun lt!411567 () Unit!30914)

(declare-fun e!513240 () Unit!30914)

(assert (=> d!112835 (= lt!411567 e!513240)))

(declare-fun c!96223 () Bool)

(assert (=> d!112835 (= c!96223 lt!411564)))

(assert (=> d!112835 (= lt!411564 (containsKey!445 (toList!5617 lt!411473) k0!1033))))

(assert (=> d!112835 (= (contains!4675 lt!411473 k0!1033) lt!411565)))

(declare-fun b!914824 () Bool)

(declare-fun lt!411566 () Unit!30914)

(assert (=> b!914824 (= e!513240 lt!411566)))

(assert (=> b!914824 (= lt!411566 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411473) k0!1033))))

(assert (=> b!914824 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411473) k0!1033))))

(declare-fun b!914825 () Bool)

(declare-fun Unit!30920 () Unit!30914)

(assert (=> b!914825 (= e!513240 Unit!30920)))

(declare-fun b!914826 () Bool)

(assert (=> b!914826 (= e!513239 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411473) k0!1033)))))

(assert (= (and d!112835 c!96223) b!914824))

(assert (= (and d!112835 (not c!96223)) b!914825))

(assert (= (and d!112835 (not res!616738)) b!914826))

(declare-fun m!849747 () Bool)

(assert (=> d!112835 m!849747))

(declare-fun m!849749 () Bool)

(assert (=> b!914824 m!849749))

(assert (=> b!914824 m!849739))

(assert (=> b!914824 m!849739))

(declare-fun m!849751 () Bool)

(assert (=> b!914824 m!849751))

(assert (=> b!914826 m!849739))

(assert (=> b!914826 m!849739))

(assert (=> b!914826 m!849751))

(assert (=> b!914664 d!112835))

(declare-fun b!914827 () Bool)

(declare-fun e!513244 () Bool)

(declare-fun call!40533 () Bool)

(assert (=> b!914827 (= e!513244 (not call!40533))))

(declare-fun b!914828 () Bool)

(declare-fun e!513242 () Bool)

(declare-fun call!40530 () Bool)

(assert (=> b!914828 (= e!513242 (not call!40530))))

(declare-fun b!914829 () Bool)

(declare-fun e!513249 () Bool)

(declare-fun lt!411571 () ListLongMap!11203)

(assert (=> b!914829 (= e!513249 (= (apply!528 lt!411571 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!914830 () Bool)

(declare-fun e!513250 () Bool)

(assert (=> b!914830 (= e!513242 e!513250)))

(declare-fun res!616743 () Bool)

(assert (=> b!914830 (= res!616743 call!40530)))

(assert (=> b!914830 (=> (not res!616743) (not e!513250))))

(declare-fun b!914831 () Bool)

(declare-fun res!616739 () Bool)

(declare-fun e!513251 () Bool)

(assert (=> b!914831 (=> (not res!616739) (not e!513251))))

(declare-fun e!513247 () Bool)

(assert (=> b!914831 (= res!616739 e!513247)))

(declare-fun res!616746 () Bool)

(assert (=> b!914831 (=> res!616746 e!513247)))

(declare-fun e!513252 () Bool)

(assert (=> b!914831 (= res!616746 (not e!513252))))

(declare-fun res!616747 () Bool)

(assert (=> b!914831 (=> (not res!616747) (not e!513252))))

(assert (=> b!914831 (= res!616747 (bvslt i!717 (size!26586 _keys!1386)))))

(declare-fun b!914832 () Bool)

(declare-fun e!513243 () ListLongMap!11203)

(declare-fun e!513253 () ListLongMap!11203)

(assert (=> b!914832 (= e!513243 e!513253)))

(declare-fun c!96229 () Bool)

(assert (=> b!914832 (= c!96229 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40525 () Bool)

(declare-fun call!40529 () ListLongMap!11203)

(declare-fun call!40528 () ListLongMap!11203)

(assert (=> bm!40525 (= call!40529 call!40528)))

(declare-fun b!914833 () Bool)

(assert (=> b!914833 (= e!513244 e!513249)))

(declare-fun res!616744 () Bool)

(assert (=> b!914833 (= res!616744 call!40533)))

(assert (=> b!914833 (=> (not res!616744) (not e!513249))))

(declare-fun b!914834 () Bool)

(declare-fun e!513245 () Bool)

(assert (=> b!914834 (= e!513245 (= (apply!528 lt!411571 (select (arr!26126 _keys!1386) i!717)) (get!13725 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914834 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26587 _values!1152)))))

(assert (=> b!914834 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26586 _keys!1386)))))

(declare-fun bm!40526 () Bool)

(declare-fun call!40534 () ListLongMap!11203)

(assert (=> bm!40526 (= call!40534 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun bm!40527 () Bool)

(assert (=> bm!40527 (= call!40533 (contains!4675 lt!411571 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!96226 () Bool)

(declare-fun call!40532 () ListLongMap!11203)

(declare-fun bm!40528 () Bool)

(assert (=> bm!40528 (= call!40532 (+!2619 (ite c!96226 call!40534 (ite c!96229 call!40528 call!40529)) (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!914836 () Bool)

(declare-fun e!513241 () Unit!30914)

(declare-fun lt!411575 () Unit!30914)

(assert (=> b!914836 (= e!513241 lt!411575)))

(declare-fun lt!411576 () ListLongMap!11203)

(assert (=> b!914836 (= lt!411576 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411589 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411589 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411574 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411574 (select (arr!26126 _keys!1386) i!717))))

(declare-fun lt!411579 () Unit!30914)

(assert (=> b!914836 (= lt!411579 (addStillContains!350 lt!411576 lt!411589 zeroValue!1094 lt!411574))))

(assert (=> b!914836 (contains!4675 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094)) lt!411574)))

(declare-fun lt!411580 () Unit!30914)

(assert (=> b!914836 (= lt!411580 lt!411579)))

(declare-fun lt!411584 () ListLongMap!11203)

(assert (=> b!914836 (= lt!411584 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411573 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411586 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411586 (select (arr!26126 _keys!1386) i!717))))

(declare-fun lt!411578 () Unit!30914)

(assert (=> b!914836 (= lt!411578 (addApplyDifferent!350 lt!411584 lt!411573 minValue!1094 lt!411586))))

(assert (=> b!914836 (= (apply!528 (+!2619 lt!411584 (tuple2!12505 lt!411573 minValue!1094)) lt!411586) (apply!528 lt!411584 lt!411586))))

(declare-fun lt!411568 () Unit!30914)

(assert (=> b!914836 (= lt!411568 lt!411578)))

(declare-fun lt!411581 () ListLongMap!11203)

(assert (=> b!914836 (= lt!411581 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411587 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411570 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411570 (select (arr!26126 _keys!1386) i!717))))

(declare-fun lt!411588 () Unit!30914)

(assert (=> b!914836 (= lt!411588 (addApplyDifferent!350 lt!411581 lt!411587 zeroValue!1094 lt!411570))))

(assert (=> b!914836 (= (apply!528 (+!2619 lt!411581 (tuple2!12505 lt!411587 zeroValue!1094)) lt!411570) (apply!528 lt!411581 lt!411570))))

(declare-fun lt!411582 () Unit!30914)

(assert (=> b!914836 (= lt!411582 lt!411588)))

(declare-fun lt!411569 () ListLongMap!11203)

(assert (=> b!914836 (= lt!411569 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!411585 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!411577 () (_ BitVec 64))

(assert (=> b!914836 (= lt!411577 (select (arr!26126 _keys!1386) i!717))))

(assert (=> b!914836 (= lt!411575 (addApplyDifferent!350 lt!411569 lt!411585 minValue!1094 lt!411577))))

(assert (=> b!914836 (= (apply!528 (+!2619 lt!411569 (tuple2!12505 lt!411585 minValue!1094)) lt!411577) (apply!528 lt!411569 lt!411577))))

(declare-fun bm!40529 () Bool)

(assert (=> bm!40529 (= call!40528 call!40534)))

(declare-fun b!914837 () Bool)

(declare-fun e!513246 () Bool)

(assert (=> b!914837 (= e!513246 (validKeyInArray!0 (select (arr!26126 _keys!1386) i!717)))))

(declare-fun b!914838 () Bool)

(declare-fun res!616740 () Bool)

(assert (=> b!914838 (=> (not res!616740) (not e!513251))))

(assert (=> b!914838 (= res!616740 e!513242)))

(declare-fun c!96225 () Bool)

(assert (=> b!914838 (= c!96225 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!914839 () Bool)

(declare-fun e!513248 () ListLongMap!11203)

(assert (=> b!914839 (= e!513248 call!40529)))

(declare-fun b!914840 () Bool)

(assert (=> b!914840 (= e!513250 (= (apply!528 lt!411571 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!914841 () Bool)

(assert (=> b!914841 (= e!513243 (+!2619 call!40532 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!914842 () Bool)

(declare-fun c!96227 () Bool)

(assert (=> b!914842 (= c!96227 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!914842 (= e!513253 e!513248)))

(declare-fun bm!40530 () Bool)

(assert (=> bm!40530 (= call!40530 (contains!4675 lt!411571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914843 () Bool)

(declare-fun call!40531 () ListLongMap!11203)

(assert (=> b!914843 (= e!513253 call!40531)))

(declare-fun bm!40531 () Bool)

(assert (=> bm!40531 (= call!40531 call!40532)))

(declare-fun b!914844 () Bool)

(assert (=> b!914844 (= e!513252 (validKeyInArray!0 (select (arr!26126 _keys!1386) i!717)))))

(declare-fun b!914845 () Bool)

(assert (=> b!914845 (= e!513251 e!513244)))

(declare-fun c!96224 () Bool)

(assert (=> b!914845 (= c!96224 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!112837 () Bool)

(assert (=> d!112837 e!513251))

(declare-fun res!616741 () Bool)

(assert (=> d!112837 (=> (not res!616741) (not e!513251))))

(assert (=> d!112837 (= res!616741 (or (bvsge i!717 (size!26586 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26586 _keys!1386)))))))

(declare-fun lt!411583 () ListLongMap!11203)

(assert (=> d!112837 (= lt!411571 lt!411583)))

(declare-fun lt!411572 () Unit!30914)

(assert (=> d!112837 (= lt!411572 e!513241)))

(declare-fun c!96228 () Bool)

(assert (=> d!112837 (= c!96228 e!513246)))

(declare-fun res!616742 () Bool)

(assert (=> d!112837 (=> (not res!616742) (not e!513246))))

(assert (=> d!112837 (= res!616742 (bvslt i!717 (size!26586 _keys!1386)))))

(assert (=> d!112837 (= lt!411583 e!513243)))

(assert (=> d!112837 (= c!96226 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112837 (validMask!0 mask!1756)))

(assert (=> d!112837 (= (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411571)))

(declare-fun b!914835 () Bool)

(declare-fun Unit!30921 () Unit!30914)

(assert (=> b!914835 (= e!513241 Unit!30921)))

(declare-fun b!914846 () Bool)

(assert (=> b!914846 (= e!513248 call!40531)))

(declare-fun b!914847 () Bool)

(assert (=> b!914847 (= e!513247 e!513245)))

(declare-fun res!616745 () Bool)

(assert (=> b!914847 (=> (not res!616745) (not e!513245))))

(assert (=> b!914847 (= res!616745 (contains!4675 lt!411571 (select (arr!26126 _keys!1386) i!717)))))

(assert (=> b!914847 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26586 _keys!1386)))))

(assert (= (and d!112837 c!96226) b!914841))

(assert (= (and d!112837 (not c!96226)) b!914832))

(assert (= (and b!914832 c!96229) b!914843))

(assert (= (and b!914832 (not c!96229)) b!914842))

(assert (= (and b!914842 c!96227) b!914846))

(assert (= (and b!914842 (not c!96227)) b!914839))

(assert (= (or b!914846 b!914839) bm!40525))

(assert (= (or b!914843 bm!40525) bm!40529))

(assert (= (or b!914843 b!914846) bm!40531))

(assert (= (or b!914841 bm!40529) bm!40526))

(assert (= (or b!914841 bm!40531) bm!40528))

(assert (= (and d!112837 res!616742) b!914837))

(assert (= (and d!112837 c!96228) b!914836))

(assert (= (and d!112837 (not c!96228)) b!914835))

(assert (= (and d!112837 res!616741) b!914831))

(assert (= (and b!914831 res!616747) b!914844))

(assert (= (and b!914831 (not res!616746)) b!914847))

(assert (= (and b!914847 res!616745) b!914834))

(assert (= (and b!914831 res!616739) b!914838))

(assert (= (and b!914838 c!96225) b!914830))

(assert (= (and b!914838 (not c!96225)) b!914828))

(assert (= (and b!914830 res!616743) b!914840))

(assert (= (or b!914830 b!914828) bm!40530))

(assert (= (and b!914838 res!616740) b!914845))

(assert (= (and b!914845 c!96224) b!914833))

(assert (= (and b!914845 (not c!96224)) b!914827))

(assert (= (and b!914833 res!616744) b!914829))

(assert (= (or b!914833 b!914827) bm!40527))

(declare-fun b_lambda!13363 () Bool)

(assert (=> (not b_lambda!13363) (not b!914834)))

(assert (=> b!914834 t!25906))

(declare-fun b_and!27349 () Bool)

(assert (= b_and!27347 (and (=> t!25906 result!10691) b_and!27349)))

(assert (=> b!914847 m!849597))

(assert (=> b!914847 m!849597))

(declare-fun m!849753 () Bool)

(assert (=> b!914847 m!849753))

(assert (=> d!112837 m!849591))

(declare-fun m!849755 () Bool)

(assert (=> bm!40526 m!849755))

(declare-fun m!849757 () Bool)

(assert (=> b!914840 m!849757))

(declare-fun m!849759 () Bool)

(assert (=> bm!40530 m!849759))

(declare-fun m!849761 () Bool)

(assert (=> bm!40527 m!849761))

(declare-fun m!849763 () Bool)

(assert (=> bm!40528 m!849763))

(declare-fun m!849765 () Bool)

(assert (=> b!914836 m!849765))

(assert (=> b!914836 m!849765))

(declare-fun m!849767 () Bool)

(assert (=> b!914836 m!849767))

(declare-fun m!849769 () Bool)

(assert (=> b!914836 m!849769))

(declare-fun m!849771 () Bool)

(assert (=> b!914836 m!849771))

(declare-fun m!849773 () Bool)

(assert (=> b!914836 m!849773))

(declare-fun m!849775 () Bool)

(assert (=> b!914836 m!849775))

(declare-fun m!849777 () Bool)

(assert (=> b!914836 m!849777))

(declare-fun m!849779 () Bool)

(assert (=> b!914836 m!849779))

(declare-fun m!849781 () Bool)

(assert (=> b!914836 m!849781))

(assert (=> b!914836 m!849597))

(assert (=> b!914836 m!849771))

(declare-fun m!849783 () Bool)

(assert (=> b!914836 m!849783))

(declare-fun m!849785 () Bool)

(assert (=> b!914836 m!849785))

(assert (=> b!914836 m!849777))

(declare-fun m!849787 () Bool)

(assert (=> b!914836 m!849787))

(declare-fun m!849789 () Bool)

(assert (=> b!914836 m!849789))

(assert (=> b!914836 m!849775))

(declare-fun m!849791 () Bool)

(assert (=> b!914836 m!849791))

(declare-fun m!849793 () Bool)

(assert (=> b!914836 m!849793))

(assert (=> b!914836 m!849755))

(assert (=> b!914834 m!849571))

(assert (=> b!914834 m!849573))

(assert (=> b!914834 m!849575))

(assert (=> b!914834 m!849597))

(declare-fun m!849795 () Bool)

(assert (=> b!914834 m!849795))

(assert (=> b!914834 m!849571))

(assert (=> b!914834 m!849573))

(assert (=> b!914834 m!849597))

(declare-fun m!849797 () Bool)

(assert (=> b!914829 m!849797))

(assert (=> b!914844 m!849597))

(assert (=> b!914844 m!849597))

(declare-fun m!849799 () Bool)

(assert (=> b!914844 m!849799))

(declare-fun m!849801 () Bool)

(assert (=> b!914841 m!849801))

(assert (=> b!914837 m!849597))

(assert (=> b!914837 m!849597))

(assert (=> b!914837 m!849799))

(assert (=> b!914664 d!112837))

(declare-fun b!914856 () Bool)

(declare-fun e!513260 () Bool)

(declare-fun e!513262 () Bool)

(assert (=> b!914856 (= e!513260 e!513262)))

(declare-fun lt!411598 () (_ BitVec 64))

(assert (=> b!914856 (= lt!411598 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!411597 () Unit!30914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54357 (_ BitVec 64) (_ BitVec 32)) Unit!30914)

(assert (=> b!914856 (= lt!411597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411598 #b00000000000000000000000000000000))))

(assert (=> b!914856 (arrayContainsKey!0 _keys!1386 lt!411598 #b00000000000000000000000000000000)))

(declare-fun lt!411596 () Unit!30914)

(assert (=> b!914856 (= lt!411596 lt!411597)))

(declare-fun res!616753 () Bool)

(declare-datatypes ((SeekEntryResult!8924 0))(
  ( (MissingZero!8924 (index!38067 (_ BitVec 32))) (Found!8924 (index!38068 (_ BitVec 32))) (Intermediate!8924 (undefined!9736 Bool) (index!38069 (_ BitVec 32)) (x!78136 (_ BitVec 32))) (Undefined!8924) (MissingVacant!8924 (index!38070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54357 (_ BitVec 32)) SeekEntryResult!8924)

(assert (=> b!914856 (= res!616753 (= (seekEntryOrOpen!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8924 #b00000000000000000000000000000000)))))

(assert (=> b!914856 (=> (not res!616753) (not e!513262))))

(declare-fun b!914857 () Bool)

(declare-fun call!40537 () Bool)

(assert (=> b!914857 (= e!513260 call!40537)))

(declare-fun d!112839 () Bool)

(declare-fun res!616752 () Bool)

(declare-fun e!513261 () Bool)

(assert (=> d!112839 (=> res!616752 e!513261)))

(assert (=> d!112839 (= res!616752 (bvsge #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(assert (=> d!112839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!513261)))

(declare-fun b!914858 () Bool)

(assert (=> b!914858 (= e!513262 call!40537)))

(declare-fun bm!40534 () Bool)

(assert (=> bm!40534 (= call!40537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!914859 () Bool)

(assert (=> b!914859 (= e!513261 e!513260)))

(declare-fun c!96232 () Bool)

(assert (=> b!914859 (= c!96232 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112839 (not res!616752)) b!914859))

(assert (= (and b!914859 c!96232) b!914856))

(assert (= (and b!914859 (not c!96232)) b!914857))

(assert (= (and b!914856 res!616753) b!914858))

(assert (= (or b!914858 b!914857) bm!40534))

(assert (=> b!914856 m!849683))

(declare-fun m!849803 () Bool)

(assert (=> b!914856 m!849803))

(declare-fun m!849805 () Bool)

(assert (=> b!914856 m!849805))

(assert (=> b!914856 m!849683))

(declare-fun m!849807 () Bool)

(assert (=> b!914856 m!849807))

(declare-fun m!849809 () Bool)

(assert (=> bm!40534 m!849809))

(assert (=> b!914859 m!849683))

(assert (=> b!914859 m!849683))

(assert (=> b!914859 m!849735))

(assert (=> b!914657 d!112839))

(declare-fun d!112841 () Bool)

(assert (=> d!112841 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!914666 d!112841))

(declare-fun d!112843 () Bool)

(declare-fun res!616760 () Bool)

(declare-fun e!513271 () Bool)

(assert (=> d!112843 (=> res!616760 e!513271)))

(assert (=> d!112843 (= res!616760 (bvsge #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(assert (=> d!112843 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18318) e!513271)))

(declare-fun b!914870 () Bool)

(declare-fun e!513273 () Bool)

(declare-fun call!40540 () Bool)

(assert (=> b!914870 (= e!513273 call!40540)))

(declare-fun b!914871 () Bool)

(declare-fun e!513272 () Bool)

(declare-fun contains!4678 (List!18321 (_ BitVec 64)) Bool)

(assert (=> b!914871 (= e!513272 (contains!4678 Nil!18318 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914872 () Bool)

(declare-fun e!513274 () Bool)

(assert (=> b!914872 (= e!513271 e!513274)))

(declare-fun res!616761 () Bool)

(assert (=> b!914872 (=> (not res!616761) (not e!513274))))

(assert (=> b!914872 (= res!616761 (not e!513272))))

(declare-fun res!616762 () Bool)

(assert (=> b!914872 (=> (not res!616762) (not e!513272))))

(assert (=> b!914872 (= res!616762 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914873 () Bool)

(assert (=> b!914873 (= e!513273 call!40540)))

(declare-fun bm!40537 () Bool)

(declare-fun c!96235 () Bool)

(assert (=> bm!40537 (= call!40540 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96235 (Cons!18317 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) Nil!18318) Nil!18318)))))

(declare-fun b!914874 () Bool)

(assert (=> b!914874 (= e!513274 e!513273)))

(assert (=> b!914874 (= c!96235 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112843 (not res!616760)) b!914872))

(assert (= (and b!914872 res!616762) b!914871))

(assert (= (and b!914872 res!616761) b!914874))

(assert (= (and b!914874 c!96235) b!914870))

(assert (= (and b!914874 (not c!96235)) b!914873))

(assert (= (or b!914870 b!914873) bm!40537))

(assert (=> b!914871 m!849683))

(assert (=> b!914871 m!849683))

(declare-fun m!849811 () Bool)

(assert (=> b!914871 m!849811))

(assert (=> b!914872 m!849683))

(assert (=> b!914872 m!849683))

(assert (=> b!914872 m!849735))

(assert (=> bm!40537 m!849683))

(declare-fun m!849813 () Bool)

(assert (=> bm!40537 m!849813))

(assert (=> b!914874 m!849683))

(assert (=> b!914874 m!849683))

(assert (=> b!914874 m!849735))

(assert (=> b!914662 d!112843))

(declare-fun d!112845 () Bool)

(declare-fun res!616767 () Bool)

(declare-fun e!513279 () Bool)

(assert (=> d!112845 (=> res!616767 e!513279)))

(assert (=> d!112845 (= res!616767 (= (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112845 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!513279)))

(declare-fun b!914879 () Bool)

(declare-fun e!513280 () Bool)

(assert (=> b!914879 (= e!513279 e!513280)))

(declare-fun res!616768 () Bool)

(assert (=> b!914879 (=> (not res!616768) (not e!513280))))

(assert (=> b!914879 (= res!616768 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26586 _keys!1386)))))

(declare-fun b!914880 () Bool)

(assert (=> b!914880 (= e!513280 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112845 (not res!616767)) b!914879))

(assert (= (and b!914879 res!616768) b!914880))

(assert (=> d!112845 m!849683))

(declare-fun m!849815 () Bool)

(assert (=> b!914880 m!849815))

(assert (=> b!914658 d!112845))

(declare-fun d!112847 () Bool)

(declare-fun e!513283 () Bool)

(assert (=> d!112847 e!513283))

(declare-fun c!96238 () Bool)

(assert (=> d!112847 (= c!96238 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!411601 () Unit!30914)

(declare-fun choose!1541 (array!54357 array!54359 (_ BitVec 32) (_ BitVec 32) V!30503 V!30503 (_ BitVec 64) Int) Unit!30914)

(assert (=> d!112847 (= lt!411601 (choose!1541 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112847 (validMask!0 mask!1756)))

(assert (=> d!112847 (= (lemmaKeyInListMapIsInArray!281 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!411601)))

(declare-fun b!914885 () Bool)

(assert (=> b!914885 (= e!513283 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!914886 () Bool)

(assert (=> b!914886 (= e!513283 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112847 c!96238) b!914885))

(assert (= (and d!112847 (not c!96238)) b!914886))

(declare-fun m!849817 () Bool)

(assert (=> d!112847 m!849817))

(assert (=> d!112847 m!849591))

(assert (=> b!914885 m!849583))

(assert (=> b!914658 d!112847))

(declare-fun b!914894 () Bool)

(declare-fun e!513288 () Bool)

(assert (=> b!914894 (= e!513288 tp_is_empty!19153)))

(declare-fun b!914893 () Bool)

(declare-fun e!513289 () Bool)

(assert (=> b!914893 (= e!513289 tp_is_empty!19153)))

(declare-fun condMapEmpty!30473 () Bool)

(declare-fun mapDefault!30473 () ValueCell!9095)

(assert (=> mapNonEmpty!30464 (= condMapEmpty!30473 (= mapRest!30464 ((as const (Array (_ BitVec 32) ValueCell!9095)) mapDefault!30473)))))

(declare-fun mapRes!30473 () Bool)

(assert (=> mapNonEmpty!30464 (= tp!58490 (and e!513288 mapRes!30473))))

(declare-fun mapNonEmpty!30473 () Bool)

(declare-fun tp!58505 () Bool)

(assert (=> mapNonEmpty!30473 (= mapRes!30473 (and tp!58505 e!513289))))

(declare-fun mapKey!30473 () (_ BitVec 32))

(declare-fun mapRest!30473 () (Array (_ BitVec 32) ValueCell!9095))

(declare-fun mapValue!30473 () ValueCell!9095)

(assert (=> mapNonEmpty!30473 (= mapRest!30464 (store mapRest!30473 mapKey!30473 mapValue!30473))))

(declare-fun mapIsEmpty!30473 () Bool)

(assert (=> mapIsEmpty!30473 mapRes!30473))

(assert (= (and mapNonEmpty!30464 condMapEmpty!30473) mapIsEmpty!30473))

(assert (= (and mapNonEmpty!30464 (not condMapEmpty!30473)) mapNonEmpty!30473))

(assert (= (and mapNonEmpty!30473 ((_ is ValueCellFull!9095) mapValue!30473)) b!914893))

(assert (= (and mapNonEmpty!30464 ((_ is ValueCellFull!9095) mapDefault!30473)) b!914894))

(declare-fun m!849819 () Bool)

(assert (=> mapNonEmpty!30473 m!849819))

(declare-fun b_lambda!13365 () Bool)

(assert (= b_lambda!13361 (or (and start!78482 b_free!16735) b_lambda!13365)))

(declare-fun b_lambda!13367 () Bool)

(assert (= b_lambda!13363 (or (and start!78482 b_free!16735) b_lambda!13367)))

(check-sat (not b!914822) (not b!914754) (not bm!40537) (not bm!40519) (not b!914807) (not d!112837) (not b!914823) (not b!914880) (not b!914811) tp_is_empty!19153 (not bm!40534) (not b!914804) (not b!914859) (not b!914824) (not b!914847) (not d!112823) (not bm!40526) (not b!914844) (not d!112821) (not b!914814) (not bm!40528) (not b_lambda!13359) (not bm!40520) (not b!914806) (not b!914885) (not b!914836) (not b!914817) (not b!914856) (not b!914871) (not d!112831) (not b!914829) (not d!112835) (not b!914752) (not bm!40523) (not b!914799) (not b!914841) (not bm!40530) (not bm!40521) (not d!112847) (not bm!40527) (not b_next!16735) (not b!914810) (not b!914837) (not b!914826) (not b!914874) (not b_lambda!13367) (not mapNonEmpty!30473) b_and!27349 (not b!914840) (not b!914872) (not b!914834) (not b_lambda!13365))
(check-sat b_and!27349 (not b_next!16735))
(get-model)

(declare-fun d!112849 () Bool)

(assert (=> d!112849 (isDefined!347 (getValueByKey!474 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411604 () Unit!30914)

(declare-fun choose!1542 (List!18320 (_ BitVec 64)) Unit!30914)

(assert (=> d!112849 (= lt!411604 (choose!1542 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun e!513292 () Bool)

(assert (=> d!112849 e!513292))

(declare-fun res!616771 () Bool)

(assert (=> d!112849 (=> (not res!616771) (not e!513292))))

(declare-fun isStrictlySorted!490 (List!18320) Bool)

(assert (=> d!112849 (= res!616771 (isStrictlySorted!490 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))

(assert (=> d!112849 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) lt!411604)))

(declare-fun b!914897 () Bool)

(assert (=> b!914897 (= e!513292 (containsKey!445 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112849 res!616771) b!914897))

(assert (=> d!112849 m!849679))

(assert (=> d!112849 m!849679))

(assert (=> d!112849 m!849681))

(declare-fun m!849821 () Bool)

(assert (=> d!112849 m!849821))

(declare-fun m!849823 () Bool)

(assert (=> d!112849 m!849823))

(assert (=> b!914897 m!849675))

(assert (=> b!914752 d!112849))

(declare-fun d!112851 () Bool)

(declare-fun isEmpty!700 (Option!480) Bool)

(assert (=> d!112851 (= (isDefined!347 (getValueByKey!474 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)) (not (isEmpty!700 (getValueByKey!474 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25725 () Bool)

(assert (= bs!25725 d!112851))

(assert (=> bs!25725 m!849679))

(declare-fun m!849825 () Bool)

(assert (=> bs!25725 m!849825))

(assert (=> b!914752 d!112851))

(declare-fun b!914907 () Bool)

(declare-fun e!513297 () Option!480)

(declare-fun e!513298 () Option!480)

(assert (=> b!914907 (= e!513297 e!513298)))

(declare-fun c!96244 () Bool)

(assert (=> b!914907 (= c!96244 (and ((_ is Cons!18316) (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (not (= (_1!6263 (h!19468 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033))))))

(declare-fun d!112853 () Bool)

(declare-fun c!96243 () Bool)

(assert (=> d!112853 (= c!96243 (and ((_ is Cons!18316) (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6263 (h!19468 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112853 (= (getValueByKey!474 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!513297)))

(declare-fun b!914906 () Bool)

(assert (=> b!914906 (= e!513297 (Some!479 (_2!6263 (h!19468 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))))

(declare-fun b!914908 () Bool)

(assert (=> b!914908 (= e!513298 (getValueByKey!474 (t!25907 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(declare-fun b!914909 () Bool)

(assert (=> b!914909 (= e!513298 None!478)))

(assert (= (and d!112853 c!96243) b!914906))

(assert (= (and d!112853 (not c!96243)) b!914907))

(assert (= (and b!914907 c!96244) b!914908))

(assert (= (and b!914907 (not c!96244)) b!914909))

(declare-fun m!849827 () Bool)

(assert (=> b!914908 m!849827))

(assert (=> b!914752 d!112853))

(declare-fun d!112855 () Bool)

(assert (=> d!112855 (= (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) (and (not (= (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914859 d!112855))

(declare-fun d!112857 () Bool)

(declare-fun e!513299 () Bool)

(assert (=> d!112857 e!513299))

(declare-fun res!616772 () Bool)

(assert (=> d!112857 (=> res!616772 e!513299)))

(declare-fun lt!411606 () Bool)

(assert (=> d!112857 (= res!616772 (not lt!411606))))

(declare-fun lt!411605 () Bool)

(assert (=> d!112857 (= lt!411606 lt!411605)))

(declare-fun lt!411608 () Unit!30914)

(declare-fun e!513300 () Unit!30914)

(assert (=> d!112857 (= lt!411608 e!513300)))

(declare-fun c!96245 () Bool)

(assert (=> d!112857 (= c!96245 lt!411605)))

(assert (=> d!112857 (= lt!411605 (containsKey!445 (toList!5617 lt!411545) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> d!112857 (= (contains!4675 lt!411545 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) lt!411606)))

(declare-fun b!914910 () Bool)

(declare-fun lt!411607 () Unit!30914)

(assert (=> b!914910 (= e!513300 lt!411607)))

(assert (=> b!914910 (= lt!411607 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411545) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!914910 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411545) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914911 () Bool)

(declare-fun Unit!30922 () Unit!30914)

(assert (=> b!914911 (= e!513300 Unit!30922)))

(declare-fun b!914912 () Bool)

(assert (=> b!914912 (= e!513299 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411545) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))))

(assert (= (and d!112857 c!96245) b!914910))

(assert (= (and d!112857 (not c!96245)) b!914911))

(assert (= (and d!112857 (not res!616772)) b!914912))

(assert (=> d!112857 m!849683))

(declare-fun m!849829 () Bool)

(assert (=> d!112857 m!849829))

(assert (=> b!914910 m!849683))

(declare-fun m!849831 () Bool)

(assert (=> b!914910 m!849831))

(assert (=> b!914910 m!849683))

(declare-fun m!849833 () Bool)

(assert (=> b!914910 m!849833))

(assert (=> b!914910 m!849833))

(declare-fun m!849835 () Bool)

(assert (=> b!914910 m!849835))

(assert (=> b!914912 m!849683))

(assert (=> b!914912 m!849833))

(assert (=> b!914912 m!849833))

(assert (=> b!914912 m!849835))

(assert (=> b!914817 d!112857))

(assert (=> b!914872 d!112855))

(declare-fun b!914913 () Bool)

(declare-fun e!513301 () Bool)

(declare-fun e!513303 () Bool)

(assert (=> b!914913 (= e!513301 e!513303)))

(declare-fun lt!411611 () (_ BitVec 64))

(assert (=> b!914913 (= lt!411611 (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!411610 () Unit!30914)

(assert (=> b!914913 (= lt!411610 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411611 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!914913 (arrayContainsKey!0 _keys!1386 lt!411611 #b00000000000000000000000000000000)))

(declare-fun lt!411609 () Unit!30914)

(assert (=> b!914913 (= lt!411609 lt!411610)))

(declare-fun res!616774 () Bool)

(assert (=> b!914913 (= res!616774 (= (seekEntryOrOpen!0 (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1386 mask!1756) (Found!8924 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!914913 (=> (not res!616774) (not e!513303))))

(declare-fun b!914914 () Bool)

(declare-fun call!40541 () Bool)

(assert (=> b!914914 (= e!513301 call!40541)))

(declare-fun d!112859 () Bool)

(declare-fun res!616773 () Bool)

(declare-fun e!513302 () Bool)

(assert (=> d!112859 (=> res!616773 e!513302)))

(assert (=> d!112859 (= res!616773 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26586 _keys!1386)))))

(assert (=> d!112859 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756) e!513302)))

(declare-fun b!914915 () Bool)

(assert (=> b!914915 (= e!513303 call!40541)))

(declare-fun bm!40538 () Bool)

(assert (=> bm!40538 (= call!40541 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!914916 () Bool)

(assert (=> b!914916 (= e!513302 e!513301)))

(declare-fun c!96246 () Bool)

(assert (=> b!914916 (= c!96246 (validKeyInArray!0 (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!112859 (not res!616773)) b!914916))

(assert (= (and b!914916 c!96246) b!914913))

(assert (= (and b!914916 (not c!96246)) b!914914))

(assert (= (and b!914913 res!616774) b!914915))

(assert (= (or b!914915 b!914914) bm!40538))

(declare-fun m!849837 () Bool)

(assert (=> b!914913 m!849837))

(declare-fun m!849839 () Bool)

(assert (=> b!914913 m!849839))

(declare-fun m!849841 () Bool)

(assert (=> b!914913 m!849841))

(assert (=> b!914913 m!849837))

(declare-fun m!849843 () Bool)

(assert (=> b!914913 m!849843))

(declare-fun m!849845 () Bool)

(assert (=> bm!40538 m!849845))

(assert (=> b!914916 m!849837))

(assert (=> b!914916 m!849837))

(declare-fun m!849847 () Bool)

(assert (=> b!914916 m!849847))

(assert (=> bm!40534 d!112859))

(declare-fun d!112861 () Bool)

(declare-fun lt!411614 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!404 (List!18321) (InoxSet (_ BitVec 64)))

(assert (=> d!112861 (= lt!411614 (select (content!404 Nil!18318) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun e!513308 () Bool)

(assert (=> d!112861 (= lt!411614 e!513308)))

(declare-fun res!616779 () Bool)

(assert (=> d!112861 (=> (not res!616779) (not e!513308))))

(assert (=> d!112861 (= res!616779 ((_ is Cons!18317) Nil!18318))))

(assert (=> d!112861 (= (contains!4678 Nil!18318 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) lt!411614)))

(declare-fun b!914921 () Bool)

(declare-fun e!513309 () Bool)

(assert (=> b!914921 (= e!513308 e!513309)))

(declare-fun res!616780 () Bool)

(assert (=> b!914921 (=> res!616780 e!513309)))

(assert (=> b!914921 (= res!616780 (= (h!19469 Nil!18318) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914922 () Bool)

(assert (=> b!914922 (= e!513309 (contains!4678 (t!25908 Nil!18318) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112861 res!616779) b!914921))

(assert (= (and b!914921 (not res!616780)) b!914922))

(declare-fun m!849849 () Bool)

(assert (=> d!112861 m!849849))

(assert (=> d!112861 m!849683))

(declare-fun m!849851 () Bool)

(assert (=> d!112861 m!849851))

(assert (=> b!914922 m!849683))

(declare-fun m!849853 () Bool)

(assert (=> b!914922 m!849853))

(assert (=> b!914871 d!112861))

(declare-fun d!112863 () Bool)

(assert (=> d!112863 (= (apply!528 lt!411571 (select (arr!26126 _keys!1386) i!717)) (get!13728 (getValueByKey!474 (toList!5617 lt!411571) (select (arr!26126 _keys!1386) i!717))))))

(declare-fun bs!25726 () Bool)

(assert (= bs!25726 d!112863))

(assert (=> bs!25726 m!849597))

(declare-fun m!849855 () Bool)

(assert (=> bs!25726 m!849855))

(assert (=> bs!25726 m!849855))

(declare-fun m!849857 () Bool)

(assert (=> bs!25726 m!849857))

(assert (=> b!914834 d!112863))

(assert (=> b!914834 d!112833))

(declare-fun d!112865 () Bool)

(assert (=> d!112865 (= (apply!528 lt!411545 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) (get!13728 (getValueByKey!474 (toList!5617 lt!411545) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))))

(declare-fun bs!25727 () Bool)

(assert (= bs!25727 d!112865))

(assert (=> bs!25727 m!849683))

(assert (=> bs!25727 m!849833))

(assert (=> bs!25727 m!849833))

(declare-fun m!849859 () Bool)

(assert (=> bs!25727 m!849859))

(assert (=> b!914804 d!112865))

(declare-fun d!112867 () Bool)

(declare-fun c!96247 () Bool)

(assert (=> d!112867 (= c!96247 ((_ is ValueCellFull!9095) (select (arr!26127 _values!1152) #b00000000000000000000000000000000)))))

(declare-fun e!513310 () V!30503)

(assert (=> d!112867 (= (get!13725 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!513310)))

(declare-fun b!914923 () Bool)

(assert (=> b!914923 (= e!513310 (get!13729 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!914924 () Bool)

(assert (=> b!914924 (= e!513310 (get!13730 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112867 c!96247) b!914923))

(assert (= (and d!112867 (not c!96247)) b!914924))

(assert (=> b!914923 m!849727))

(assert (=> b!914923 m!849573))

(declare-fun m!849861 () Bool)

(assert (=> b!914923 m!849861))

(assert (=> b!914924 m!849727))

(assert (=> b!914924 m!849573))

(declare-fun m!849863 () Bool)

(assert (=> b!914924 m!849863))

(assert (=> b!914804 d!112867))

(assert (=> b!914754 d!112851))

(assert (=> b!914754 d!112853))

(assert (=> b!914874 d!112855))

(declare-fun d!112869 () Bool)

(declare-fun res!616781 () Bool)

(declare-fun e!513311 () Bool)

(assert (=> d!112869 (=> res!616781 e!513311)))

(assert (=> d!112869 (= res!616781 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26586 _keys!1386)))))

(assert (=> d!112869 (= (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96235 (Cons!18317 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) Nil!18318) Nil!18318)) e!513311)))

(declare-fun b!914925 () Bool)

(declare-fun e!513313 () Bool)

(declare-fun call!40542 () Bool)

(assert (=> b!914925 (= e!513313 call!40542)))

(declare-fun b!914926 () Bool)

(declare-fun e!513312 () Bool)

(assert (=> b!914926 (= e!513312 (contains!4678 (ite c!96235 (Cons!18317 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) Nil!18318) Nil!18318) (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914927 () Bool)

(declare-fun e!513314 () Bool)

(assert (=> b!914927 (= e!513311 e!513314)))

(declare-fun res!616782 () Bool)

(assert (=> b!914927 (=> (not res!616782) (not e!513314))))

(assert (=> b!914927 (= res!616782 (not e!513312))))

(declare-fun res!616783 () Bool)

(assert (=> b!914927 (=> (not res!616783) (not e!513312))))

(assert (=> b!914927 (= res!616783 (validKeyInArray!0 (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!914928 () Bool)

(assert (=> b!914928 (= e!513313 call!40542)))

(declare-fun c!96248 () Bool)

(declare-fun bm!40539 () Bool)

(assert (=> bm!40539 (= call!40542 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!96248 (Cons!18317 (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!96235 (Cons!18317 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) Nil!18318) Nil!18318)) (ite c!96235 (Cons!18317 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) Nil!18318) Nil!18318))))))

(declare-fun b!914929 () Bool)

(assert (=> b!914929 (= e!513314 e!513313)))

(assert (=> b!914929 (= c!96248 (validKeyInArray!0 (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!112869 (not res!616781)) b!914927))

(assert (= (and b!914927 res!616783) b!914926))

(assert (= (and b!914927 res!616782) b!914929))

(assert (= (and b!914929 c!96248) b!914925))

(assert (= (and b!914929 (not c!96248)) b!914928))

(assert (= (or b!914925 b!914928) bm!40539))

(assert (=> b!914926 m!849837))

(assert (=> b!914926 m!849837))

(declare-fun m!849865 () Bool)

(assert (=> b!914926 m!849865))

(assert (=> b!914927 m!849837))

(assert (=> b!914927 m!849837))

(assert (=> b!914927 m!849847))

(assert (=> bm!40539 m!849837))

(declare-fun m!849867 () Bool)

(assert (=> bm!40539 m!849867))

(assert (=> b!914929 m!849837))

(assert (=> b!914929 m!849837))

(assert (=> b!914929 m!849847))

(assert (=> bm!40537 d!112869))

(assert (=> d!112837 d!112825))

(declare-fun d!112871 () Bool)

(declare-fun e!513315 () Bool)

(assert (=> d!112871 e!513315))

(declare-fun res!616784 () Bool)

(assert (=> d!112871 (=> res!616784 e!513315)))

(declare-fun lt!411616 () Bool)

(assert (=> d!112871 (= res!616784 (not lt!411616))))

(declare-fun lt!411615 () Bool)

(assert (=> d!112871 (= lt!411616 lt!411615)))

(declare-fun lt!411618 () Unit!30914)

(declare-fun e!513316 () Unit!30914)

(assert (=> d!112871 (= lt!411618 e!513316)))

(declare-fun c!96249 () Bool)

(assert (=> d!112871 (= c!96249 lt!411615)))

(assert (=> d!112871 (= lt!411615 (containsKey!445 (toList!5617 lt!411571) (select (arr!26126 _keys!1386) i!717)))))

(assert (=> d!112871 (= (contains!4675 lt!411571 (select (arr!26126 _keys!1386) i!717)) lt!411616)))

(declare-fun b!914930 () Bool)

(declare-fun lt!411617 () Unit!30914)

(assert (=> b!914930 (= e!513316 lt!411617)))

(assert (=> b!914930 (= lt!411617 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411571) (select (arr!26126 _keys!1386) i!717)))))

(assert (=> b!914930 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411571) (select (arr!26126 _keys!1386) i!717)))))

(declare-fun b!914931 () Bool)

(declare-fun Unit!30923 () Unit!30914)

(assert (=> b!914931 (= e!513316 Unit!30923)))

(declare-fun b!914932 () Bool)

(assert (=> b!914932 (= e!513315 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411571) (select (arr!26126 _keys!1386) i!717))))))

(assert (= (and d!112871 c!96249) b!914930))

(assert (= (and d!112871 (not c!96249)) b!914931))

(assert (= (and d!112871 (not res!616784)) b!914932))

(assert (=> d!112871 m!849597))

(declare-fun m!849869 () Bool)

(assert (=> d!112871 m!849869))

(assert (=> b!914930 m!849597))

(declare-fun m!849871 () Bool)

(assert (=> b!914930 m!849871))

(assert (=> b!914930 m!849597))

(assert (=> b!914930 m!849855))

(assert (=> b!914930 m!849855))

(declare-fun m!849873 () Bool)

(assert (=> b!914930 m!849873))

(assert (=> b!914932 m!849597))

(assert (=> b!914932 m!849855))

(assert (=> b!914932 m!849855))

(assert (=> b!914932 m!849873))

(assert (=> b!914847 d!112871))

(declare-fun d!112873 () Bool)

(declare-fun e!513317 () Bool)

(assert (=> d!112873 e!513317))

(declare-fun res!616785 () Bool)

(assert (=> d!112873 (=> res!616785 e!513317)))

(declare-fun lt!411620 () Bool)

(assert (=> d!112873 (= res!616785 (not lt!411620))))

(declare-fun lt!411619 () Bool)

(assert (=> d!112873 (= lt!411620 lt!411619)))

(declare-fun lt!411622 () Unit!30914)

(declare-fun e!513318 () Unit!30914)

(assert (=> d!112873 (= lt!411622 e!513318)))

(declare-fun c!96250 () Bool)

(assert (=> d!112873 (= c!96250 lt!411619)))

(assert (=> d!112873 (= lt!411619 (containsKey!445 (toList!5617 lt!411571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112873 (= (contains!4675 lt!411571 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411620)))

(declare-fun b!914933 () Bool)

(declare-fun lt!411621 () Unit!30914)

(assert (=> b!914933 (= e!513318 lt!411621)))

(assert (=> b!914933 (= lt!411621 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914933 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914934 () Bool)

(declare-fun Unit!30924 () Unit!30914)

(assert (=> b!914934 (= e!513318 Unit!30924)))

(declare-fun b!914935 () Bool)

(assert (=> b!914935 (= e!513317 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112873 c!96250) b!914933))

(assert (= (and d!112873 (not c!96250)) b!914934))

(assert (= (and d!112873 (not res!616785)) b!914935))

(declare-fun m!849875 () Bool)

(assert (=> d!112873 m!849875))

(declare-fun m!849877 () Bool)

(assert (=> b!914933 m!849877))

(declare-fun m!849879 () Bool)

(assert (=> b!914933 m!849879))

(assert (=> b!914933 m!849879))

(declare-fun m!849881 () Bool)

(assert (=> b!914933 m!849881))

(assert (=> b!914935 m!849879))

(assert (=> b!914935 m!849879))

(assert (=> b!914935 m!849881))

(assert (=> bm!40530 d!112873))

(assert (=> b!914885 d!112845))

(declare-fun d!112875 () Bool)

(declare-fun e!513319 () Bool)

(assert (=> d!112875 e!513319))

(declare-fun res!616786 () Bool)

(assert (=> d!112875 (=> res!616786 e!513319)))

(declare-fun lt!411624 () Bool)

(assert (=> d!112875 (= res!616786 (not lt!411624))))

(declare-fun lt!411623 () Bool)

(assert (=> d!112875 (= lt!411624 lt!411623)))

(declare-fun lt!411626 () Unit!30914)

(declare-fun e!513320 () Unit!30914)

(assert (=> d!112875 (= lt!411626 e!513320)))

(declare-fun c!96251 () Bool)

(assert (=> d!112875 (= c!96251 lt!411623)))

(assert (=> d!112875 (= lt!411623 (containsKey!445 (toList!5617 lt!411545) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112875 (= (contains!4675 lt!411545 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411624)))

(declare-fun b!914936 () Bool)

(declare-fun lt!411625 () Unit!30914)

(assert (=> b!914936 (= e!513320 lt!411625)))

(assert (=> b!914936 (= lt!411625 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411545) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914936 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411545) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914937 () Bool)

(declare-fun Unit!30925 () Unit!30914)

(assert (=> b!914937 (= e!513320 Unit!30925)))

(declare-fun b!914938 () Bool)

(assert (=> b!914938 (= e!513319 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112875 c!96251) b!914936))

(assert (= (and d!112875 (not c!96251)) b!914937))

(assert (= (and d!112875 (not res!616786)) b!914938))

(declare-fun m!849883 () Bool)

(assert (=> d!112875 m!849883))

(declare-fun m!849885 () Bool)

(assert (=> b!914936 m!849885))

(declare-fun m!849887 () Bool)

(assert (=> b!914936 m!849887))

(assert (=> b!914936 m!849887))

(declare-fun m!849889 () Bool)

(assert (=> b!914936 m!849889))

(assert (=> b!914938 m!849887))

(assert (=> b!914938 m!849887))

(assert (=> b!914938 m!849889))

(assert (=> bm!40523 d!112875))

(declare-fun d!112877 () Bool)

(assert (=> d!112877 (= (isDefined!347 (getValueByKey!474 (toList!5617 lt!411473) k0!1033)) (not (isEmpty!700 (getValueByKey!474 (toList!5617 lt!411473) k0!1033))))))

(declare-fun bs!25728 () Bool)

(assert (= bs!25728 d!112877))

(assert (=> bs!25728 m!849739))

(declare-fun m!849891 () Bool)

(assert (=> bs!25728 m!849891))

(assert (=> b!914826 d!112877))

(declare-fun b!914940 () Bool)

(declare-fun e!513321 () Option!480)

(declare-fun e!513322 () Option!480)

(assert (=> b!914940 (= e!513321 e!513322)))

(declare-fun c!96253 () Bool)

(assert (=> b!914940 (= c!96253 (and ((_ is Cons!18316) (toList!5617 lt!411473)) (not (= (_1!6263 (h!19468 (toList!5617 lt!411473))) k0!1033))))))

(declare-fun d!112879 () Bool)

(declare-fun c!96252 () Bool)

(assert (=> d!112879 (= c!96252 (and ((_ is Cons!18316) (toList!5617 lt!411473)) (= (_1!6263 (h!19468 (toList!5617 lt!411473))) k0!1033)))))

(assert (=> d!112879 (= (getValueByKey!474 (toList!5617 lt!411473) k0!1033) e!513321)))

(declare-fun b!914939 () Bool)

(assert (=> b!914939 (= e!513321 (Some!479 (_2!6263 (h!19468 (toList!5617 lt!411473)))))))

(declare-fun b!914941 () Bool)

(assert (=> b!914941 (= e!513322 (getValueByKey!474 (t!25907 (toList!5617 lt!411473)) k0!1033))))

(declare-fun b!914942 () Bool)

(assert (=> b!914942 (= e!513322 None!478)))

(assert (= (and d!112879 c!96252) b!914939))

(assert (= (and d!112879 (not c!96252)) b!914940))

(assert (= (and b!914940 c!96253) b!914941))

(assert (= (and b!914940 (not c!96253)) b!914942))

(declare-fun m!849893 () Bool)

(assert (=> b!914941 m!849893))

(assert (=> b!914826 d!112879))

(declare-fun d!112881 () Bool)

(declare-fun e!513325 () Bool)

(assert (=> d!112881 e!513325))

(declare-fun res!616792 () Bool)

(assert (=> d!112881 (=> (not res!616792) (not e!513325))))

(declare-fun lt!411638 () ListLongMap!11203)

(assert (=> d!112881 (= res!616792 (contains!4675 lt!411638 (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411637 () List!18320)

(assert (=> d!112881 (= lt!411638 (ListLongMap!11204 lt!411637))))

(declare-fun lt!411635 () Unit!30914)

(declare-fun lt!411636 () Unit!30914)

(assert (=> d!112881 (= lt!411635 lt!411636)))

(assert (=> d!112881 (= (getValueByKey!474 lt!411637 (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lemmaContainsTupThenGetReturnValue!254 (List!18320 (_ BitVec 64) V!30503) Unit!30914)

(assert (=> d!112881 (= lt!411636 (lemmaContainsTupThenGetReturnValue!254 lt!411637 (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun insertStrictlySorted!311 (List!18320 (_ BitVec 64) V!30503) List!18320)

(assert (=> d!112881 (= lt!411637 (insertStrictlySorted!311 (toList!5617 call!40532) (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112881 (= (+!2619 call!40532 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411638)))

(declare-fun b!914947 () Bool)

(declare-fun res!616791 () Bool)

(assert (=> b!914947 (=> (not res!616791) (not e!513325))))

(assert (=> b!914947 (= res!616791 (= (getValueByKey!474 (toList!5617 lt!411638) (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!914948 () Bool)

(declare-fun contains!4679 (List!18320 tuple2!12504) Bool)

(assert (=> b!914948 (= e!513325 (contains!4679 (toList!5617 lt!411638) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112881 res!616792) b!914947))

(assert (= (and b!914947 res!616791) b!914948))

(declare-fun m!849895 () Bool)

(assert (=> d!112881 m!849895))

(declare-fun m!849897 () Bool)

(assert (=> d!112881 m!849897))

(declare-fun m!849899 () Bool)

(assert (=> d!112881 m!849899))

(declare-fun m!849901 () Bool)

(assert (=> d!112881 m!849901))

(declare-fun m!849903 () Bool)

(assert (=> b!914947 m!849903))

(declare-fun m!849905 () Bool)

(assert (=> b!914948 m!849905))

(assert (=> b!914841 d!112881))

(declare-fun d!112883 () Bool)

(assert (=> d!112883 (= (validKeyInArray!0 (select (arr!26126 _keys!1386) i!717)) (and (not (= (select (arr!26126 _keys!1386) i!717) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26126 _keys!1386) i!717) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!914844 d!112883))

(declare-fun d!112885 () Bool)

(assert (=> d!112885 (= (get!13730 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914823 d!112885))

(declare-fun d!112887 () Bool)

(assert (=> d!112887 (= (apply!528 lt!411571 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13728 (getValueByKey!474 (toList!5617 lt!411571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25729 () Bool)

(assert (= bs!25729 d!112887))

(declare-fun m!849907 () Bool)

(assert (=> bs!25729 m!849907))

(assert (=> bs!25729 m!849907))

(declare-fun m!849909 () Bool)

(assert (=> bs!25729 m!849909))

(assert (=> b!914829 d!112887))

(assert (=> b!914814 d!112855))

(declare-fun d!112889 () Bool)

(assert (=> d!112889 (= (get!13729 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!12138 (select (arr!26127 _values!1152) i!717)))))

(assert (=> b!914822 d!112889))

(declare-fun d!112891 () Bool)

(assert (=> d!112891 (= (apply!528 lt!411545 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13728 (getValueByKey!474 (toList!5617 lt!411545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25730 () Bool)

(assert (= bs!25730 d!112891))

(declare-fun m!849911 () Bool)

(assert (=> bs!25730 m!849911))

(assert (=> bs!25730 m!849911))

(declare-fun m!849913 () Bool)

(assert (=> bs!25730 m!849913))

(assert (=> b!914799 d!112891))

(declare-fun d!112893 () Bool)

(assert (=> d!112893 (arrayContainsKey!0 _keys!1386 lt!411598 #b00000000000000000000000000000000)))

(declare-fun lt!411641 () Unit!30914)

(declare-fun choose!13 (array!54357 (_ BitVec 64) (_ BitVec 32)) Unit!30914)

(assert (=> d!112893 (= lt!411641 (choose!13 _keys!1386 lt!411598 #b00000000000000000000000000000000))))

(assert (=> d!112893 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!112893 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!411598 #b00000000000000000000000000000000) lt!411641)))

(declare-fun bs!25731 () Bool)

(assert (= bs!25731 d!112893))

(assert (=> bs!25731 m!849805))

(declare-fun m!849915 () Bool)

(assert (=> bs!25731 m!849915))

(assert (=> b!914856 d!112893))

(declare-fun d!112895 () Bool)

(declare-fun res!616793 () Bool)

(declare-fun e!513326 () Bool)

(assert (=> d!112895 (=> res!616793 e!513326)))

(assert (=> d!112895 (= res!616793 (= (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) lt!411598))))

(assert (=> d!112895 (= (arrayContainsKey!0 _keys!1386 lt!411598 #b00000000000000000000000000000000) e!513326)))

(declare-fun b!914949 () Bool)

(declare-fun e!513327 () Bool)

(assert (=> b!914949 (= e!513326 e!513327)))

(declare-fun res!616794 () Bool)

(assert (=> b!914949 (=> (not res!616794) (not e!513327))))

(assert (=> b!914949 (= res!616794 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26586 _keys!1386)))))

(declare-fun b!914950 () Bool)

(assert (=> b!914950 (= e!513327 (arrayContainsKey!0 _keys!1386 lt!411598 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112895 (not res!616793)) b!914949))

(assert (= (and b!914949 res!616794) b!914950))

(assert (=> d!112895 m!849683))

(declare-fun m!849917 () Bool)

(assert (=> b!914950 m!849917))

(assert (=> b!914856 d!112895))

(declare-fun b!914963 () Bool)

(declare-fun c!96261 () Bool)

(declare-fun lt!411649 () (_ BitVec 64))

(assert (=> b!914963 (= c!96261 (= lt!411649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!513335 () SeekEntryResult!8924)

(declare-fun e!513336 () SeekEntryResult!8924)

(assert (=> b!914963 (= e!513335 e!513336)))

(declare-fun b!914964 () Bool)

(declare-fun e!513334 () SeekEntryResult!8924)

(assert (=> b!914964 (= e!513334 Undefined!8924)))

(declare-fun lt!411650 () SeekEntryResult!8924)

(declare-fun b!914965 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54357 (_ BitVec 32)) SeekEntryResult!8924)

(assert (=> b!914965 (= e!513336 (seekKeyOrZeroReturnVacant!0 (x!78136 lt!411650) (index!38069 lt!411650) (index!38069 lt!411650) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(declare-fun d!112897 () Bool)

(declare-fun lt!411648 () SeekEntryResult!8924)

(assert (=> d!112897 (and (or ((_ is Undefined!8924) lt!411648) (not ((_ is Found!8924) lt!411648)) (and (bvsge (index!38068 lt!411648) #b00000000000000000000000000000000) (bvslt (index!38068 lt!411648) (size!26586 _keys!1386)))) (or ((_ is Undefined!8924) lt!411648) ((_ is Found!8924) lt!411648) (not ((_ is MissingZero!8924) lt!411648)) (and (bvsge (index!38067 lt!411648) #b00000000000000000000000000000000) (bvslt (index!38067 lt!411648) (size!26586 _keys!1386)))) (or ((_ is Undefined!8924) lt!411648) ((_ is Found!8924) lt!411648) ((_ is MissingZero!8924) lt!411648) (not ((_ is MissingVacant!8924) lt!411648)) (and (bvsge (index!38070 lt!411648) #b00000000000000000000000000000000) (bvslt (index!38070 lt!411648) (size!26586 _keys!1386)))) (or ((_ is Undefined!8924) lt!411648) (ite ((_ is Found!8924) lt!411648) (= (select (arr!26126 _keys!1386) (index!38068 lt!411648)) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8924) lt!411648) (= (select (arr!26126 _keys!1386) (index!38067 lt!411648)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8924) lt!411648) (= (select (arr!26126 _keys!1386) (index!38070 lt!411648)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!112897 (= lt!411648 e!513334)))

(declare-fun c!96260 () Bool)

(assert (=> d!112897 (= c!96260 (and ((_ is Intermediate!8924) lt!411650) (undefined!9736 lt!411650)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54357 (_ BitVec 32)) SeekEntryResult!8924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112897 (= lt!411650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) mask!1756) (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(assert (=> d!112897 (validMask!0 mask!1756)))

(assert (=> d!112897 (= (seekEntryOrOpen!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) lt!411648)))

(declare-fun b!914966 () Bool)

(assert (=> b!914966 (= e!513334 e!513335)))

(assert (=> b!914966 (= lt!411649 (select (arr!26126 _keys!1386) (index!38069 lt!411650)))))

(declare-fun c!96262 () Bool)

(assert (=> b!914966 (= c!96262 (= lt!411649 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!914967 () Bool)

(assert (=> b!914967 (= e!513336 (MissingZero!8924 (index!38069 lt!411650)))))

(declare-fun b!914968 () Bool)

(assert (=> b!914968 (= e!513335 (Found!8924 (index!38069 lt!411650)))))

(assert (= (and d!112897 c!96260) b!914964))

(assert (= (and d!112897 (not c!96260)) b!914966))

(assert (= (and b!914966 c!96262) b!914968))

(assert (= (and b!914966 (not c!96262)) b!914963))

(assert (= (and b!914963 c!96261) b!914967))

(assert (= (and b!914963 (not c!96261)) b!914965))

(assert (=> b!914965 m!849683))

(declare-fun m!849919 () Bool)

(assert (=> b!914965 m!849919))

(declare-fun m!849921 () Bool)

(assert (=> d!112897 m!849921))

(declare-fun m!849923 () Bool)

(assert (=> d!112897 m!849923))

(assert (=> d!112897 m!849591))

(declare-fun m!849925 () Bool)

(assert (=> d!112897 m!849925))

(assert (=> d!112897 m!849683))

(declare-fun m!849927 () Bool)

(assert (=> d!112897 m!849927))

(declare-fun m!849929 () Bool)

(assert (=> d!112897 m!849929))

(assert (=> d!112897 m!849683))

(assert (=> d!112897 m!849925))

(declare-fun m!849931 () Bool)

(assert (=> b!914966 m!849931))

(assert (=> b!914856 d!112897))

(assert (=> b!914837 d!112883))

(declare-fun d!112899 () Bool)

(declare-fun res!616795 () Bool)

(declare-fun e!513337 () Bool)

(assert (=> d!112899 (=> res!616795 e!513337)))

(assert (=> d!112899 (= res!616795 (= (select (arr!26126 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1033))))

(assert (=> d!112899 (= (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!513337)))

(declare-fun b!914969 () Bool)

(declare-fun e!513338 () Bool)

(assert (=> b!914969 (= e!513337 e!513338)))

(declare-fun res!616796 () Bool)

(assert (=> b!914969 (=> (not res!616796) (not e!513338))))

(assert (=> b!914969 (= res!616796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!26586 _keys!1386)))))

(declare-fun b!914970 () Bool)

(assert (=> b!914970 (= e!513338 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!112899 (not res!616795)) b!914969))

(assert (= (and b!914969 res!616796) b!914970))

(assert (=> d!112899 m!849837))

(declare-fun m!849933 () Bool)

(assert (=> b!914970 m!849933))

(assert (=> b!914880 d!112899))

(assert (=> b!914807 d!112855))

(declare-fun d!112901 () Bool)

(declare-fun e!513341 () Bool)

(assert (=> d!112901 e!513341))

(declare-fun c!96265 () Bool)

(assert (=> d!112901 (= c!96265 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!112901 true))

(declare-fun _$15!98 () Unit!30914)

(assert (=> d!112901 (= (choose!1541 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) _$15!98)))

(declare-fun b!914975 () Bool)

(assert (=> b!914975 (= e!513341 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!914976 () Bool)

(assert (=> b!914976 (= e!513341 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112901 c!96265) b!914975))

(assert (= (and d!112901 (not c!96265)) b!914976))

(assert (=> b!914975 m!849583))

(assert (=> d!112847 d!112901))

(assert (=> d!112847 d!112825))

(declare-fun d!112903 () Bool)

(declare-fun e!513342 () Bool)

(assert (=> d!112903 e!513342))

(declare-fun res!616798 () Bool)

(assert (=> d!112903 (=> (not res!616798) (not e!513342))))

(declare-fun lt!411654 () ListLongMap!11203)

(assert (=> d!112903 (= res!616798 (contains!4675 lt!411654 (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411653 () List!18320)

(assert (=> d!112903 (= lt!411654 (ListLongMap!11204 lt!411653))))

(declare-fun lt!411651 () Unit!30914)

(declare-fun lt!411652 () Unit!30914)

(assert (=> d!112903 (= lt!411651 lt!411652)))

(assert (=> d!112903 (= (getValueByKey!474 lt!411653 (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112903 (= lt!411652 (lemmaContainsTupThenGetReturnValue!254 lt!411653 (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112903 (= lt!411653 (insertStrictlySorted!311 (toList!5617 call!40525) (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112903 (= (+!2619 call!40525 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411654)))

(declare-fun b!914977 () Bool)

(declare-fun res!616797 () Bool)

(assert (=> b!914977 (=> (not res!616797) (not e!513342))))

(assert (=> b!914977 (= res!616797 (= (getValueByKey!474 (toList!5617 lt!411654) (_1!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!914978 () Bool)

(assert (=> b!914978 (= e!513342 (contains!4679 (toList!5617 lt!411654) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112903 res!616798) b!914977))

(assert (= (and b!914977 res!616797) b!914978))

(declare-fun m!849935 () Bool)

(assert (=> d!112903 m!849935))

(declare-fun m!849937 () Bool)

(assert (=> d!112903 m!849937))

(declare-fun m!849939 () Bool)

(assert (=> d!112903 m!849939))

(declare-fun m!849941 () Bool)

(assert (=> d!112903 m!849941))

(declare-fun m!849943 () Bool)

(assert (=> b!914977 m!849943))

(declare-fun m!849945 () Bool)

(assert (=> b!914978 m!849945))

(assert (=> b!914811 d!112903))

(declare-fun d!112905 () Bool)

(assert (=> d!112905 (= (apply!528 lt!411571 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13728 (getValueByKey!474 (toList!5617 lt!411571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25732 () Bool)

(assert (= bs!25732 d!112905))

(assert (=> bs!25732 m!849879))

(assert (=> bs!25732 m!849879))

(declare-fun m!849947 () Bool)

(assert (=> bs!25732 m!849947))

(assert (=> b!914840 d!112905))

(declare-fun d!112907 () Bool)

(assert (=> d!112907 (= (get!13728 (getValueByKey!474 (toList!5617 lt!411473) k0!1033)) (v!12141 (getValueByKey!474 (toList!5617 lt!411473) k0!1033)))))

(assert (=> d!112831 d!112907))

(assert (=> d!112831 d!112879))

(declare-fun d!112909 () Bool)

(assert (=> d!112909 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411473) k0!1033))))

(declare-fun lt!411655 () Unit!30914)

(assert (=> d!112909 (= lt!411655 (choose!1542 (toList!5617 lt!411473) k0!1033))))

(declare-fun e!513343 () Bool)

(assert (=> d!112909 e!513343))

(declare-fun res!616799 () Bool)

(assert (=> d!112909 (=> (not res!616799) (not e!513343))))

(assert (=> d!112909 (= res!616799 (isStrictlySorted!490 (toList!5617 lt!411473)))))

(assert (=> d!112909 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411473) k0!1033) lt!411655)))

(declare-fun b!914979 () Bool)

(assert (=> b!914979 (= e!513343 (containsKey!445 (toList!5617 lt!411473) k0!1033))))

(assert (= (and d!112909 res!616799) b!914979))

(assert (=> d!112909 m!849739))

(assert (=> d!112909 m!849739))

(assert (=> d!112909 m!849751))

(declare-fun m!849949 () Bool)

(assert (=> d!112909 m!849949))

(declare-fun m!849951 () Bool)

(assert (=> d!112909 m!849951))

(assert (=> b!914979 m!849747))

(assert (=> b!914824 d!112909))

(assert (=> b!914824 d!112877))

(assert (=> b!914824 d!112879))

(declare-fun d!112911 () Bool)

(assert (=> d!112911 (= (apply!528 lt!411545 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13728 (getValueByKey!474 (toList!5617 lt!411545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25733 () Bool)

(assert (= bs!25733 d!112911))

(assert (=> bs!25733 m!849887))

(assert (=> bs!25733 m!849887))

(declare-fun m!849953 () Bool)

(assert (=> bs!25733 m!849953))

(assert (=> b!914810 d!112911))

(assert (=> d!112823 d!112825))

(declare-fun d!112913 () Bool)

(declare-fun e!513344 () Bool)

(assert (=> d!112913 e!513344))

(declare-fun res!616800 () Bool)

(assert (=> d!112913 (=> res!616800 e!513344)))

(declare-fun lt!411657 () Bool)

(assert (=> d!112913 (= res!616800 (not lt!411657))))

(declare-fun lt!411656 () Bool)

(assert (=> d!112913 (= lt!411657 lt!411656)))

(declare-fun lt!411659 () Unit!30914)

(declare-fun e!513345 () Unit!30914)

(assert (=> d!112913 (= lt!411659 e!513345)))

(declare-fun c!96266 () Bool)

(assert (=> d!112913 (= c!96266 lt!411656)))

(assert (=> d!112913 (= lt!411656 (containsKey!445 (toList!5617 lt!411545) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112913 (= (contains!4675 lt!411545 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411657)))

(declare-fun b!914980 () Bool)

(declare-fun lt!411658 () Unit!30914)

(assert (=> b!914980 (= e!513345 lt!411658)))

(assert (=> b!914980 (= lt!411658 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411545) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!914980 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411545) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!914981 () Bool)

(declare-fun Unit!30926 () Unit!30914)

(assert (=> b!914981 (= e!513345 Unit!30926)))

(declare-fun b!914982 () Bool)

(assert (=> b!914982 (= e!513344 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112913 c!96266) b!914980))

(assert (= (and d!112913 (not c!96266)) b!914981))

(assert (= (and d!112913 (not res!616800)) b!914982))

(declare-fun m!849955 () Bool)

(assert (=> d!112913 m!849955))

(declare-fun m!849957 () Bool)

(assert (=> b!914980 m!849957))

(assert (=> b!914980 m!849911))

(assert (=> b!914980 m!849911))

(declare-fun m!849959 () Bool)

(assert (=> b!914980 m!849959))

(assert (=> b!914982 m!849911))

(assert (=> b!914982 m!849911))

(assert (=> b!914982 m!849959))

(assert (=> bm!40520 d!112913))

(declare-fun b!915007 () Bool)

(declare-fun e!513365 () Bool)

(declare-fun lt!411675 () ListLongMap!11203)

(declare-fun isEmpty!701 (ListLongMap!11203) Bool)

(assert (=> b!915007 (= e!513365 (isEmpty!701 lt!411675))))

(declare-fun b!915008 () Bool)

(declare-fun e!513366 () Bool)

(assert (=> b!915008 (= e!513366 (validKeyInArray!0 (select (arr!26126 _keys!1386) i!717)))))

(assert (=> b!915008 (bvsge i!717 #b00000000000000000000000000000000)))

(declare-fun b!915009 () Bool)

(declare-fun e!513364 () Bool)

(assert (=> b!915009 (= e!513364 e!513365)))

(declare-fun c!96277 () Bool)

(assert (=> b!915009 (= c!96277 (bvslt i!717 (size!26586 _keys!1386)))))

(declare-fun b!915010 () Bool)

(assert (=> b!915010 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26586 _keys!1386)))))

(assert (=> b!915010 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26587 _values!1152)))))

(declare-fun e!513361 () Bool)

(assert (=> b!915010 (= e!513361 (= (apply!528 lt!411675 (select (arr!26126 _keys!1386) i!717)) (get!13725 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!915011 () Bool)

(declare-fun e!513363 () ListLongMap!11203)

(declare-fun e!513360 () ListLongMap!11203)

(assert (=> b!915011 (= e!513363 e!513360)))

(declare-fun c!96276 () Bool)

(assert (=> b!915011 (= c!96276 (validKeyInArray!0 (select (arr!26126 _keys!1386) i!717)))))

(declare-fun d!112915 () Bool)

(declare-fun e!513362 () Bool)

(assert (=> d!112915 e!513362))

(declare-fun res!616810 () Bool)

(assert (=> d!112915 (=> (not res!616810) (not e!513362))))

(assert (=> d!112915 (= res!616810 (not (contains!4675 lt!411675 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!112915 (= lt!411675 e!513363)))

(declare-fun c!96275 () Bool)

(assert (=> d!112915 (= c!96275 (bvsge i!717 (size!26586 _keys!1386)))))

(assert (=> d!112915 (validMask!0 mask!1756)))

(assert (=> d!112915 (= (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411675)))

(declare-fun b!915012 () Bool)

(assert (=> b!915012 (= e!513364 e!513361)))

(assert (=> b!915012 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26586 _keys!1386)))))

(declare-fun res!616811 () Bool)

(assert (=> b!915012 (= res!616811 (contains!4675 lt!411675 (select (arr!26126 _keys!1386) i!717)))))

(assert (=> b!915012 (=> (not res!616811) (not e!513361))))

(declare-fun b!915013 () Bool)

(declare-fun lt!411674 () Unit!30914)

(declare-fun lt!411680 () Unit!30914)

(assert (=> b!915013 (= lt!411674 lt!411680)))

(declare-fun lt!411678 () (_ BitVec 64))

(declare-fun lt!411679 () V!30503)

(declare-fun lt!411677 () ListLongMap!11203)

(declare-fun lt!411676 () (_ BitVec 64))

(assert (=> b!915013 (not (contains!4675 (+!2619 lt!411677 (tuple2!12505 lt!411678 lt!411679)) lt!411676))))

(declare-fun addStillNotContains!221 (ListLongMap!11203 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30914)

(assert (=> b!915013 (= lt!411680 (addStillNotContains!221 lt!411677 lt!411678 lt!411679 lt!411676))))

(assert (=> b!915013 (= lt!411676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!915013 (= lt!411679 (get!13725 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!915013 (= lt!411678 (select (arr!26126 _keys!1386) i!717))))

(declare-fun call!40545 () ListLongMap!11203)

(assert (=> b!915013 (= lt!411677 call!40545)))

(assert (=> b!915013 (= e!513360 (+!2619 call!40545 (tuple2!12505 (select (arr!26126 _keys!1386) i!717) (get!13725 (select (arr!26127 _values!1152) i!717) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!915014 () Bool)

(assert (=> b!915014 (= e!513363 (ListLongMap!11204 Nil!18317))))

(declare-fun b!915015 () Bool)

(assert (=> b!915015 (= e!513362 e!513364)))

(declare-fun c!96278 () Bool)

(assert (=> b!915015 (= c!96278 e!513366)))

(declare-fun res!616809 () Bool)

(assert (=> b!915015 (=> (not res!616809) (not e!513366))))

(assert (=> b!915015 (= res!616809 (bvslt i!717 (size!26586 _keys!1386)))))

(declare-fun b!915016 () Bool)

(assert (=> b!915016 (= e!513360 call!40545)))

(declare-fun bm!40542 () Bool)

(assert (=> bm!40542 (= call!40545 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!915017 () Bool)

(declare-fun res!616812 () Bool)

(assert (=> b!915017 (=> (not res!616812) (not e!513362))))

(assert (=> b!915017 (= res!616812 (not (contains!4675 lt!411675 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!915018 () Bool)

(assert (=> b!915018 (= e!513365 (= lt!411675 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160)))))

(assert (= (and d!112915 c!96275) b!915014))

(assert (= (and d!112915 (not c!96275)) b!915011))

(assert (= (and b!915011 c!96276) b!915013))

(assert (= (and b!915011 (not c!96276)) b!915016))

(assert (= (or b!915013 b!915016) bm!40542))

(assert (= (and d!112915 res!616810) b!915017))

(assert (= (and b!915017 res!616812) b!915015))

(assert (= (and b!915015 res!616809) b!915008))

(assert (= (and b!915015 c!96278) b!915012))

(assert (= (and b!915015 (not c!96278)) b!915009))

(assert (= (and b!915012 res!616811) b!915010))

(assert (= (and b!915009 c!96277) b!915018))

(assert (= (and b!915009 (not c!96277)) b!915007))

(declare-fun b_lambda!13369 () Bool)

(assert (=> (not b_lambda!13369) (not b!915010)))

(assert (=> b!915010 t!25906))

(declare-fun b_and!27351 () Bool)

(assert (= b_and!27349 (and (=> t!25906 result!10691) b_and!27351)))

(declare-fun b_lambda!13371 () Bool)

(assert (=> (not b_lambda!13371) (not b!915013)))

(assert (=> b!915013 t!25906))

(declare-fun b_and!27353 () Bool)

(assert (= b_and!27351 (and (=> t!25906 result!10691) b_and!27353)))

(declare-fun m!849961 () Bool)

(assert (=> b!915013 m!849961))

(assert (=> b!915013 m!849571))

(assert (=> b!915013 m!849597))

(assert (=> b!915013 m!849573))

(assert (=> b!915013 m!849571))

(assert (=> b!915013 m!849573))

(assert (=> b!915013 m!849575))

(assert (=> b!915013 m!849961))

(declare-fun m!849963 () Bool)

(assert (=> b!915013 m!849963))

(declare-fun m!849965 () Bool)

(assert (=> b!915013 m!849965))

(declare-fun m!849967 () Bool)

(assert (=> b!915013 m!849967))

(declare-fun m!849969 () Bool)

(assert (=> b!915017 m!849969))

(declare-fun m!849971 () Bool)

(assert (=> bm!40542 m!849971))

(declare-fun m!849973 () Bool)

(assert (=> d!112915 m!849973))

(assert (=> d!112915 m!849591))

(assert (=> b!915012 m!849597))

(assert (=> b!915012 m!849597))

(declare-fun m!849975 () Bool)

(assert (=> b!915012 m!849975))

(assert (=> b!915018 m!849971))

(assert (=> b!915011 m!849597))

(assert (=> b!915011 m!849597))

(assert (=> b!915011 m!849799))

(assert (=> b!915010 m!849571))

(assert (=> b!915010 m!849573))

(assert (=> b!915010 m!849575))

(assert (=> b!915010 m!849571))

(assert (=> b!915010 m!849597))

(assert (=> b!915010 m!849597))

(declare-fun m!849977 () Bool)

(assert (=> b!915010 m!849977))

(assert (=> b!915010 m!849573))

(declare-fun m!849979 () Bool)

(assert (=> b!915007 m!849979))

(assert (=> b!915008 m!849597))

(assert (=> b!915008 m!849597))

(assert (=> b!915008 m!849799))

(assert (=> bm!40526 d!112915))

(declare-fun d!112917 () Bool)

(declare-fun res!616817 () Bool)

(declare-fun e!513371 () Bool)

(assert (=> d!112917 (=> res!616817 e!513371)))

(assert (=> d!112917 (= res!616817 (and ((_ is Cons!18316) (toList!5617 lt!411473)) (= (_1!6263 (h!19468 (toList!5617 lt!411473))) k0!1033)))))

(assert (=> d!112917 (= (containsKey!445 (toList!5617 lt!411473) k0!1033) e!513371)))

(declare-fun b!915023 () Bool)

(declare-fun e!513372 () Bool)

(assert (=> b!915023 (= e!513371 e!513372)))

(declare-fun res!616818 () Bool)

(assert (=> b!915023 (=> (not res!616818) (not e!513372))))

(assert (=> b!915023 (= res!616818 (and (or (not ((_ is Cons!18316) (toList!5617 lt!411473))) (bvsle (_1!6263 (h!19468 (toList!5617 lt!411473))) k0!1033)) ((_ is Cons!18316) (toList!5617 lt!411473)) (bvslt (_1!6263 (h!19468 (toList!5617 lt!411473))) k0!1033)))))

(declare-fun b!915024 () Bool)

(assert (=> b!915024 (= e!513372 (containsKey!445 (t!25907 (toList!5617 lt!411473)) k0!1033))))

(assert (= (and d!112917 (not res!616817)) b!915023))

(assert (= (and b!915023 res!616818) b!915024))

(declare-fun m!849981 () Bool)

(assert (=> b!915024 m!849981))

(assert (=> d!112835 d!112917))

(declare-fun b!915025 () Bool)

(declare-fun e!513378 () Bool)

(declare-fun lt!411682 () ListLongMap!11203)

(assert (=> b!915025 (= e!513378 (isEmpty!701 lt!411682))))

(declare-fun b!915026 () Bool)

(declare-fun e!513379 () Bool)

(assert (=> b!915026 (= e!513379 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!915026 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!915027 () Bool)

(declare-fun e!513377 () Bool)

(assert (=> b!915027 (= e!513377 e!513378)))

(declare-fun c!96281 () Bool)

(assert (=> b!915027 (= c!96281 (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(declare-fun b!915028 () Bool)

(assert (=> b!915028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(assert (=> b!915028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26587 _values!1152)))))

(declare-fun e!513374 () Bool)

(assert (=> b!915028 (= e!513374 (= (apply!528 lt!411682 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)) (get!13725 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!915029 () Bool)

(declare-fun e!513376 () ListLongMap!11203)

(declare-fun e!513373 () ListLongMap!11203)

(assert (=> b!915029 (= e!513376 e!513373)))

(declare-fun c!96280 () Bool)

(assert (=> b!915029 (= c!96280 (validKeyInArray!0 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112919 () Bool)

(declare-fun e!513375 () Bool)

(assert (=> d!112919 e!513375))

(declare-fun res!616820 () Bool)

(assert (=> d!112919 (=> (not res!616820) (not e!513375))))

(assert (=> d!112919 (= res!616820 (not (contains!4675 lt!411682 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!112919 (= lt!411682 e!513376)))

(declare-fun c!96279 () Bool)

(assert (=> d!112919 (= c!96279 (bvsge #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(assert (=> d!112919 (validMask!0 mask!1756)))

(assert (=> d!112919 (= (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!411682)))

(declare-fun b!915030 () Bool)

(assert (=> b!915030 (= e!513377 e!513374)))

(assert (=> b!915030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(declare-fun res!616821 () Bool)

(assert (=> b!915030 (= res!616821 (contains!4675 lt!411682 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!915030 (=> (not res!616821) (not e!513374))))

(declare-fun b!915031 () Bool)

(declare-fun lt!411681 () Unit!30914)

(declare-fun lt!411687 () Unit!30914)

(assert (=> b!915031 (= lt!411681 lt!411687)))

(declare-fun lt!411686 () V!30503)

(declare-fun lt!411683 () (_ BitVec 64))

(declare-fun lt!411685 () (_ BitVec 64))

(declare-fun lt!411684 () ListLongMap!11203)

(assert (=> b!915031 (not (contains!4675 (+!2619 lt!411684 (tuple2!12505 lt!411685 lt!411686)) lt!411683))))

(assert (=> b!915031 (= lt!411687 (addStillNotContains!221 lt!411684 lt!411685 lt!411686 lt!411683))))

(assert (=> b!915031 (= lt!411683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!915031 (= lt!411686 (get!13725 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!915031 (= lt!411685 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun call!40546 () ListLongMap!11203)

(assert (=> b!915031 (= lt!411684 call!40546)))

(assert (=> b!915031 (= e!513373 (+!2619 call!40546 (tuple2!12505 (select (arr!26126 _keys!1386) #b00000000000000000000000000000000) (get!13725 (select (arr!26127 _values!1152) #b00000000000000000000000000000000) (dynLambda!1409 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!915032 () Bool)

(assert (=> b!915032 (= e!513376 (ListLongMap!11204 Nil!18317))))

(declare-fun b!915033 () Bool)

(assert (=> b!915033 (= e!513375 e!513377)))

(declare-fun c!96282 () Bool)

(assert (=> b!915033 (= c!96282 e!513379)))

(declare-fun res!616819 () Bool)

(assert (=> b!915033 (=> (not res!616819) (not e!513379))))

(assert (=> b!915033 (= res!616819 (bvslt #b00000000000000000000000000000000 (size!26586 _keys!1386)))))

(declare-fun b!915034 () Bool)

(assert (=> b!915034 (= e!513373 call!40546)))

(declare-fun bm!40543 () Bool)

(assert (=> bm!40543 (= call!40546 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!915035 () Bool)

(declare-fun res!616822 () Bool)

(assert (=> b!915035 (=> (not res!616822) (not e!513375))))

(assert (=> b!915035 (= res!616822 (not (contains!4675 lt!411682 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!915036 () Bool)

(assert (=> b!915036 (= e!513378 (= lt!411682 (getCurrentListMapNoExtraKeys!3340 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160)))))

(assert (= (and d!112919 c!96279) b!915032))

(assert (= (and d!112919 (not c!96279)) b!915029))

(assert (= (and b!915029 c!96280) b!915031))

(assert (= (and b!915029 (not c!96280)) b!915034))

(assert (= (or b!915031 b!915034) bm!40543))

(assert (= (and d!112919 res!616820) b!915035))

(assert (= (and b!915035 res!616822) b!915033))

(assert (= (and b!915033 res!616819) b!915026))

(assert (= (and b!915033 c!96282) b!915030))

(assert (= (and b!915033 (not c!96282)) b!915027))

(assert (= (and b!915030 res!616821) b!915028))

(assert (= (and b!915027 c!96281) b!915036))

(assert (= (and b!915027 (not c!96281)) b!915025))

(declare-fun b_lambda!13373 () Bool)

(assert (=> (not b_lambda!13373) (not b!915028)))

(assert (=> b!915028 t!25906))

(declare-fun b_and!27355 () Bool)

(assert (= b_and!27353 (and (=> t!25906 result!10691) b_and!27355)))

(declare-fun b_lambda!13375 () Bool)

(assert (=> (not b_lambda!13375) (not b!915031)))

(assert (=> b!915031 t!25906))

(declare-fun b_and!27357 () Bool)

(assert (= b_and!27355 (and (=> t!25906 result!10691) b_and!27357)))

(declare-fun m!849983 () Bool)

(assert (=> b!915031 m!849983))

(assert (=> b!915031 m!849727))

(assert (=> b!915031 m!849683))

(assert (=> b!915031 m!849573))

(assert (=> b!915031 m!849727))

(assert (=> b!915031 m!849573))

(assert (=> b!915031 m!849729))

(assert (=> b!915031 m!849983))

(declare-fun m!849985 () Bool)

(assert (=> b!915031 m!849985))

(declare-fun m!849987 () Bool)

(assert (=> b!915031 m!849987))

(declare-fun m!849989 () Bool)

(assert (=> b!915031 m!849989))

(declare-fun m!849991 () Bool)

(assert (=> b!915035 m!849991))

(declare-fun m!849993 () Bool)

(assert (=> bm!40543 m!849993))

(declare-fun m!849995 () Bool)

(assert (=> d!112919 m!849995))

(assert (=> d!112919 m!849591))

(assert (=> b!915030 m!849683))

(assert (=> b!915030 m!849683))

(declare-fun m!849997 () Bool)

(assert (=> b!915030 m!849997))

(assert (=> b!915036 m!849993))

(assert (=> b!915029 m!849683))

(assert (=> b!915029 m!849683))

(assert (=> b!915029 m!849735))

(assert (=> b!915028 m!849727))

(assert (=> b!915028 m!849573))

(assert (=> b!915028 m!849729))

(assert (=> b!915028 m!849727))

(assert (=> b!915028 m!849683))

(assert (=> b!915028 m!849683))

(declare-fun m!849999 () Bool)

(assert (=> b!915028 m!849999))

(assert (=> b!915028 m!849573))

(declare-fun m!850001 () Bool)

(assert (=> b!915025 m!850001))

(assert (=> b!915026 m!849683))

(assert (=> b!915026 m!849683))

(assert (=> b!915026 m!849735))

(assert (=> bm!40519 d!112919))

(declare-fun d!112921 () Bool)

(declare-fun e!513380 () Bool)

(assert (=> d!112921 e!513380))

(declare-fun res!616823 () Bool)

(assert (=> d!112921 (=> res!616823 e!513380)))

(declare-fun lt!411689 () Bool)

(assert (=> d!112921 (= res!616823 (not lt!411689))))

(declare-fun lt!411688 () Bool)

(assert (=> d!112921 (= lt!411689 lt!411688)))

(declare-fun lt!411691 () Unit!30914)

(declare-fun e!513381 () Unit!30914)

(assert (=> d!112921 (= lt!411691 e!513381)))

(declare-fun c!96283 () Bool)

(assert (=> d!112921 (= c!96283 lt!411688)))

(assert (=> d!112921 (= lt!411688 (containsKey!445 (toList!5617 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094))) lt!411574))))

(assert (=> d!112921 (= (contains!4675 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094)) lt!411574) lt!411689)))

(declare-fun b!915037 () Bool)

(declare-fun lt!411690 () Unit!30914)

(assert (=> b!915037 (= e!513381 lt!411690)))

(assert (=> b!915037 (= lt!411690 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094))) lt!411574))))

(assert (=> b!915037 (isDefined!347 (getValueByKey!474 (toList!5617 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094))) lt!411574))))

(declare-fun b!915038 () Bool)

(declare-fun Unit!30927 () Unit!30914)

(assert (=> b!915038 (= e!513381 Unit!30927)))

(declare-fun b!915039 () Bool)

(assert (=> b!915039 (= e!513380 (isDefined!347 (getValueByKey!474 (toList!5617 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094))) lt!411574)))))

(assert (= (and d!112921 c!96283) b!915037))

(assert (= (and d!112921 (not c!96283)) b!915038))

(assert (= (and d!112921 (not res!616823)) b!915039))

(declare-fun m!850003 () Bool)

(assert (=> d!112921 m!850003))

(declare-fun m!850005 () Bool)

(assert (=> b!915037 m!850005))

(declare-fun m!850007 () Bool)

(assert (=> b!915037 m!850007))

(assert (=> b!915037 m!850007))

(declare-fun m!850009 () Bool)

(assert (=> b!915037 m!850009))

(assert (=> b!915039 m!850007))

(assert (=> b!915039 m!850007))

(assert (=> b!915039 m!850009))

(assert (=> b!914836 d!112921))

(declare-fun d!112923 () Bool)

(assert (=> d!112923 (= (apply!528 (+!2619 lt!411581 (tuple2!12505 lt!411587 zeroValue!1094)) lt!411570) (apply!528 lt!411581 lt!411570))))

(declare-fun lt!411694 () Unit!30914)

(declare-fun choose!1543 (ListLongMap!11203 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30914)

(assert (=> d!112923 (= lt!411694 (choose!1543 lt!411581 lt!411587 zeroValue!1094 lt!411570))))

(declare-fun e!513384 () Bool)

(assert (=> d!112923 e!513384))

(declare-fun res!616826 () Bool)

(assert (=> d!112923 (=> (not res!616826) (not e!513384))))

(assert (=> d!112923 (= res!616826 (contains!4675 lt!411581 lt!411570))))

(assert (=> d!112923 (= (addApplyDifferent!350 lt!411581 lt!411587 zeroValue!1094 lt!411570) lt!411694)))

(declare-fun b!915043 () Bool)

(assert (=> b!915043 (= e!513384 (not (= lt!411570 lt!411587)))))

(assert (= (and d!112923 res!616826) b!915043))

(assert (=> d!112923 m!849771))

(assert (=> d!112923 m!849773))

(declare-fun m!850011 () Bool)

(assert (=> d!112923 m!850011))

(assert (=> d!112923 m!849793))

(declare-fun m!850013 () Bool)

(assert (=> d!112923 m!850013))

(assert (=> d!112923 m!849771))

(assert (=> b!914836 d!112923))

(declare-fun d!112925 () Bool)

(assert (=> d!112925 (= (apply!528 (+!2619 lt!411584 (tuple2!12505 lt!411573 minValue!1094)) lt!411586) (apply!528 lt!411584 lt!411586))))

(declare-fun lt!411695 () Unit!30914)

(assert (=> d!112925 (= lt!411695 (choose!1543 lt!411584 lt!411573 minValue!1094 lt!411586))))

(declare-fun e!513385 () Bool)

(assert (=> d!112925 e!513385))

(declare-fun res!616827 () Bool)

(assert (=> d!112925 (=> (not res!616827) (not e!513385))))

(assert (=> d!112925 (= res!616827 (contains!4675 lt!411584 lt!411586))))

(assert (=> d!112925 (= (addApplyDifferent!350 lt!411584 lt!411573 minValue!1094 lt!411586) lt!411695)))

(declare-fun b!915044 () Bool)

(assert (=> b!915044 (= e!513385 (not (= lt!411586 lt!411573)))))

(assert (= (and d!112925 res!616827) b!915044))

(assert (=> d!112925 m!849765))

(assert (=> d!112925 m!849767))

(declare-fun m!850015 () Bool)

(assert (=> d!112925 m!850015))

(assert (=> d!112925 m!849769))

(declare-fun m!850017 () Bool)

(assert (=> d!112925 m!850017))

(assert (=> d!112925 m!849765))

(assert (=> b!914836 d!112925))

(assert (=> b!914836 d!112915))

(declare-fun d!112927 () Bool)

(assert (=> d!112927 (= (apply!528 (+!2619 lt!411569 (tuple2!12505 lt!411585 minValue!1094)) lt!411577) (apply!528 lt!411569 lt!411577))))

(declare-fun lt!411696 () Unit!30914)

(assert (=> d!112927 (= lt!411696 (choose!1543 lt!411569 lt!411585 minValue!1094 lt!411577))))

(declare-fun e!513386 () Bool)

(assert (=> d!112927 e!513386))

(declare-fun res!616828 () Bool)

(assert (=> d!112927 (=> (not res!616828) (not e!513386))))

(assert (=> d!112927 (= res!616828 (contains!4675 lt!411569 lt!411577))))

(assert (=> d!112927 (= (addApplyDifferent!350 lt!411569 lt!411585 minValue!1094 lt!411577) lt!411696)))

(declare-fun b!915045 () Bool)

(assert (=> b!915045 (= e!513386 (not (= lt!411577 lt!411585)))))

(assert (= (and d!112927 res!616828) b!915045))

(assert (=> d!112927 m!849775))

(assert (=> d!112927 m!849791))

(declare-fun m!850019 () Bool)

(assert (=> d!112927 m!850019))

(assert (=> d!112927 m!849779))

(declare-fun m!850021 () Bool)

(assert (=> d!112927 m!850021))

(assert (=> d!112927 m!849775))

(assert (=> b!914836 d!112927))

(declare-fun d!112929 () Bool)

(declare-fun e!513387 () Bool)

(assert (=> d!112929 e!513387))

(declare-fun res!616830 () Bool)

(assert (=> d!112929 (=> (not res!616830) (not e!513387))))

(declare-fun lt!411700 () ListLongMap!11203)

(assert (=> d!112929 (= res!616830 (contains!4675 lt!411700 (_1!6263 (tuple2!12505 lt!411585 minValue!1094))))))

(declare-fun lt!411699 () List!18320)

(assert (=> d!112929 (= lt!411700 (ListLongMap!11204 lt!411699))))

(declare-fun lt!411697 () Unit!30914)

(declare-fun lt!411698 () Unit!30914)

(assert (=> d!112929 (= lt!411697 lt!411698)))

(assert (=> d!112929 (= (getValueByKey!474 lt!411699 (_1!6263 (tuple2!12505 lt!411585 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411585 minValue!1094))))))

(assert (=> d!112929 (= lt!411698 (lemmaContainsTupThenGetReturnValue!254 lt!411699 (_1!6263 (tuple2!12505 lt!411585 minValue!1094)) (_2!6263 (tuple2!12505 lt!411585 minValue!1094))))))

(assert (=> d!112929 (= lt!411699 (insertStrictlySorted!311 (toList!5617 lt!411569) (_1!6263 (tuple2!12505 lt!411585 minValue!1094)) (_2!6263 (tuple2!12505 lt!411585 minValue!1094))))))

(assert (=> d!112929 (= (+!2619 lt!411569 (tuple2!12505 lt!411585 minValue!1094)) lt!411700)))

(declare-fun b!915046 () Bool)

(declare-fun res!616829 () Bool)

(assert (=> b!915046 (=> (not res!616829) (not e!513387))))

(assert (=> b!915046 (= res!616829 (= (getValueByKey!474 (toList!5617 lt!411700) (_1!6263 (tuple2!12505 lt!411585 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411585 minValue!1094)))))))

(declare-fun b!915047 () Bool)

(assert (=> b!915047 (= e!513387 (contains!4679 (toList!5617 lt!411700) (tuple2!12505 lt!411585 minValue!1094)))))

(assert (= (and d!112929 res!616830) b!915046))

(assert (= (and b!915046 res!616829) b!915047))

(declare-fun m!850023 () Bool)

(assert (=> d!112929 m!850023))

(declare-fun m!850025 () Bool)

(assert (=> d!112929 m!850025))

(declare-fun m!850027 () Bool)

(assert (=> d!112929 m!850027))

(declare-fun m!850029 () Bool)

(assert (=> d!112929 m!850029))

(declare-fun m!850031 () Bool)

(assert (=> b!915046 m!850031))

(declare-fun m!850033 () Bool)

(assert (=> b!915047 m!850033))

(assert (=> b!914836 d!112929))

(declare-fun d!112931 () Bool)

(declare-fun e!513388 () Bool)

(assert (=> d!112931 e!513388))

(declare-fun res!616832 () Bool)

(assert (=> d!112931 (=> (not res!616832) (not e!513388))))

(declare-fun lt!411704 () ListLongMap!11203)

(assert (=> d!112931 (= res!616832 (contains!4675 lt!411704 (_1!6263 (tuple2!12505 lt!411587 zeroValue!1094))))))

(declare-fun lt!411703 () List!18320)

(assert (=> d!112931 (= lt!411704 (ListLongMap!11204 lt!411703))))

(declare-fun lt!411701 () Unit!30914)

(declare-fun lt!411702 () Unit!30914)

(assert (=> d!112931 (= lt!411701 lt!411702)))

(assert (=> d!112931 (= (getValueByKey!474 lt!411703 (_1!6263 (tuple2!12505 lt!411587 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411587 zeroValue!1094))))))

(assert (=> d!112931 (= lt!411702 (lemmaContainsTupThenGetReturnValue!254 lt!411703 (_1!6263 (tuple2!12505 lt!411587 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411587 zeroValue!1094))))))

(assert (=> d!112931 (= lt!411703 (insertStrictlySorted!311 (toList!5617 lt!411581) (_1!6263 (tuple2!12505 lt!411587 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411587 zeroValue!1094))))))

(assert (=> d!112931 (= (+!2619 lt!411581 (tuple2!12505 lt!411587 zeroValue!1094)) lt!411704)))

(declare-fun b!915048 () Bool)

(declare-fun res!616831 () Bool)

(assert (=> b!915048 (=> (not res!616831) (not e!513388))))

(assert (=> b!915048 (= res!616831 (= (getValueByKey!474 (toList!5617 lt!411704) (_1!6263 (tuple2!12505 lt!411587 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411587 zeroValue!1094)))))))

(declare-fun b!915049 () Bool)

(assert (=> b!915049 (= e!513388 (contains!4679 (toList!5617 lt!411704) (tuple2!12505 lt!411587 zeroValue!1094)))))

(assert (= (and d!112931 res!616832) b!915048))

(assert (= (and b!915048 res!616831) b!915049))

(declare-fun m!850035 () Bool)

(assert (=> d!112931 m!850035))

(declare-fun m!850037 () Bool)

(assert (=> d!112931 m!850037))

(declare-fun m!850039 () Bool)

(assert (=> d!112931 m!850039))

(declare-fun m!850041 () Bool)

(assert (=> d!112931 m!850041))

(declare-fun m!850043 () Bool)

(assert (=> b!915048 m!850043))

(declare-fun m!850045 () Bool)

(assert (=> b!915049 m!850045))

(assert (=> b!914836 d!112931))

(declare-fun d!112933 () Bool)

(assert (=> d!112933 (= (apply!528 (+!2619 lt!411581 (tuple2!12505 lt!411587 zeroValue!1094)) lt!411570) (get!13728 (getValueByKey!474 (toList!5617 (+!2619 lt!411581 (tuple2!12505 lt!411587 zeroValue!1094))) lt!411570)))))

(declare-fun bs!25734 () Bool)

(assert (= bs!25734 d!112933))

(declare-fun m!850047 () Bool)

(assert (=> bs!25734 m!850047))

(assert (=> bs!25734 m!850047))

(declare-fun m!850049 () Bool)

(assert (=> bs!25734 m!850049))

(assert (=> b!914836 d!112933))

(declare-fun d!112935 () Bool)

(declare-fun e!513389 () Bool)

(assert (=> d!112935 e!513389))

(declare-fun res!616834 () Bool)

(assert (=> d!112935 (=> (not res!616834) (not e!513389))))

(declare-fun lt!411708 () ListLongMap!11203)

(assert (=> d!112935 (= res!616834 (contains!4675 lt!411708 (_1!6263 (tuple2!12505 lt!411573 minValue!1094))))))

(declare-fun lt!411707 () List!18320)

(assert (=> d!112935 (= lt!411708 (ListLongMap!11204 lt!411707))))

(declare-fun lt!411705 () Unit!30914)

(declare-fun lt!411706 () Unit!30914)

(assert (=> d!112935 (= lt!411705 lt!411706)))

(assert (=> d!112935 (= (getValueByKey!474 lt!411707 (_1!6263 (tuple2!12505 lt!411573 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411573 minValue!1094))))))

(assert (=> d!112935 (= lt!411706 (lemmaContainsTupThenGetReturnValue!254 lt!411707 (_1!6263 (tuple2!12505 lt!411573 minValue!1094)) (_2!6263 (tuple2!12505 lt!411573 minValue!1094))))))

(assert (=> d!112935 (= lt!411707 (insertStrictlySorted!311 (toList!5617 lt!411584) (_1!6263 (tuple2!12505 lt!411573 minValue!1094)) (_2!6263 (tuple2!12505 lt!411573 minValue!1094))))))

(assert (=> d!112935 (= (+!2619 lt!411584 (tuple2!12505 lt!411573 minValue!1094)) lt!411708)))

(declare-fun b!915050 () Bool)

(declare-fun res!616833 () Bool)

(assert (=> b!915050 (=> (not res!616833) (not e!513389))))

(assert (=> b!915050 (= res!616833 (= (getValueByKey!474 (toList!5617 lt!411708) (_1!6263 (tuple2!12505 lt!411573 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411573 minValue!1094)))))))

(declare-fun b!915051 () Bool)

(assert (=> b!915051 (= e!513389 (contains!4679 (toList!5617 lt!411708) (tuple2!12505 lt!411573 minValue!1094)))))

(assert (= (and d!112935 res!616834) b!915050))

(assert (= (and b!915050 res!616833) b!915051))

(declare-fun m!850051 () Bool)

(assert (=> d!112935 m!850051))

(declare-fun m!850053 () Bool)

(assert (=> d!112935 m!850053))

(declare-fun m!850055 () Bool)

(assert (=> d!112935 m!850055))

(declare-fun m!850057 () Bool)

(assert (=> d!112935 m!850057))

(declare-fun m!850059 () Bool)

(assert (=> b!915050 m!850059))

(declare-fun m!850061 () Bool)

(assert (=> b!915051 m!850061))

(assert (=> b!914836 d!112935))

(declare-fun d!112937 () Bool)

(assert (=> d!112937 (contains!4675 (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094)) lt!411574)))

(declare-fun lt!411711 () Unit!30914)

(declare-fun choose!1544 (ListLongMap!11203 (_ BitVec 64) V!30503 (_ BitVec 64)) Unit!30914)

(assert (=> d!112937 (= lt!411711 (choose!1544 lt!411576 lt!411589 zeroValue!1094 lt!411574))))

(assert (=> d!112937 (contains!4675 lt!411576 lt!411574)))

(assert (=> d!112937 (= (addStillContains!350 lt!411576 lt!411589 zeroValue!1094 lt!411574) lt!411711)))

(declare-fun bs!25735 () Bool)

(assert (= bs!25735 d!112937))

(assert (=> bs!25735 m!849777))

(assert (=> bs!25735 m!849777))

(assert (=> bs!25735 m!849787))

(declare-fun m!850063 () Bool)

(assert (=> bs!25735 m!850063))

(declare-fun m!850065 () Bool)

(assert (=> bs!25735 m!850065))

(assert (=> b!914836 d!112937))

(declare-fun d!112939 () Bool)

(assert (=> d!112939 (= (apply!528 (+!2619 lt!411584 (tuple2!12505 lt!411573 minValue!1094)) lt!411586) (get!13728 (getValueByKey!474 (toList!5617 (+!2619 lt!411584 (tuple2!12505 lt!411573 minValue!1094))) lt!411586)))))

(declare-fun bs!25736 () Bool)

(assert (= bs!25736 d!112939))

(declare-fun m!850067 () Bool)

(assert (=> bs!25736 m!850067))

(assert (=> bs!25736 m!850067))

(declare-fun m!850069 () Bool)

(assert (=> bs!25736 m!850069))

(assert (=> b!914836 d!112939))

(declare-fun d!112941 () Bool)

(assert (=> d!112941 (= (apply!528 lt!411569 lt!411577) (get!13728 (getValueByKey!474 (toList!5617 lt!411569) lt!411577)))))

(declare-fun bs!25737 () Bool)

(assert (= bs!25737 d!112941))

(declare-fun m!850071 () Bool)

(assert (=> bs!25737 m!850071))

(assert (=> bs!25737 m!850071))

(declare-fun m!850073 () Bool)

(assert (=> bs!25737 m!850073))

(assert (=> b!914836 d!112941))

(declare-fun d!112943 () Bool)

(assert (=> d!112943 (= (apply!528 lt!411584 lt!411586) (get!13728 (getValueByKey!474 (toList!5617 lt!411584) lt!411586)))))

(declare-fun bs!25738 () Bool)

(assert (= bs!25738 d!112943))

(declare-fun m!850075 () Bool)

(assert (=> bs!25738 m!850075))

(assert (=> bs!25738 m!850075))

(declare-fun m!850077 () Bool)

(assert (=> bs!25738 m!850077))

(assert (=> b!914836 d!112943))

(declare-fun d!112945 () Bool)

(assert (=> d!112945 (= (apply!528 lt!411581 lt!411570) (get!13728 (getValueByKey!474 (toList!5617 lt!411581) lt!411570)))))

(declare-fun bs!25739 () Bool)

(assert (= bs!25739 d!112945))

(declare-fun m!850079 () Bool)

(assert (=> bs!25739 m!850079))

(assert (=> bs!25739 m!850079))

(declare-fun m!850081 () Bool)

(assert (=> bs!25739 m!850081))

(assert (=> b!914836 d!112945))

(declare-fun d!112947 () Bool)

(assert (=> d!112947 (= (apply!528 (+!2619 lt!411569 (tuple2!12505 lt!411585 minValue!1094)) lt!411577) (get!13728 (getValueByKey!474 (toList!5617 (+!2619 lt!411569 (tuple2!12505 lt!411585 minValue!1094))) lt!411577)))))

(declare-fun bs!25740 () Bool)

(assert (= bs!25740 d!112947))

(declare-fun m!850083 () Bool)

(assert (=> bs!25740 m!850083))

(assert (=> bs!25740 m!850083))

(declare-fun m!850085 () Bool)

(assert (=> bs!25740 m!850085))

(assert (=> b!914836 d!112947))

(declare-fun d!112949 () Bool)

(declare-fun e!513390 () Bool)

(assert (=> d!112949 e!513390))

(declare-fun res!616836 () Bool)

(assert (=> d!112949 (=> (not res!616836) (not e!513390))))

(declare-fun lt!411715 () ListLongMap!11203)

(assert (=> d!112949 (= res!616836 (contains!4675 lt!411715 (_1!6263 (tuple2!12505 lt!411589 zeroValue!1094))))))

(declare-fun lt!411714 () List!18320)

(assert (=> d!112949 (= lt!411715 (ListLongMap!11204 lt!411714))))

(declare-fun lt!411712 () Unit!30914)

(declare-fun lt!411713 () Unit!30914)

(assert (=> d!112949 (= lt!411712 lt!411713)))

(assert (=> d!112949 (= (getValueByKey!474 lt!411714 (_1!6263 (tuple2!12505 lt!411589 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411589 zeroValue!1094))))))

(assert (=> d!112949 (= lt!411713 (lemmaContainsTupThenGetReturnValue!254 lt!411714 (_1!6263 (tuple2!12505 lt!411589 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411589 zeroValue!1094))))))

(assert (=> d!112949 (= lt!411714 (insertStrictlySorted!311 (toList!5617 lt!411576) (_1!6263 (tuple2!12505 lt!411589 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411589 zeroValue!1094))))))

(assert (=> d!112949 (= (+!2619 lt!411576 (tuple2!12505 lt!411589 zeroValue!1094)) lt!411715)))

(declare-fun b!915053 () Bool)

(declare-fun res!616835 () Bool)

(assert (=> b!915053 (=> (not res!616835) (not e!513390))))

(assert (=> b!915053 (= res!616835 (= (getValueByKey!474 (toList!5617 lt!411715) (_1!6263 (tuple2!12505 lt!411589 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411589 zeroValue!1094)))))))

(declare-fun b!915054 () Bool)

(assert (=> b!915054 (= e!513390 (contains!4679 (toList!5617 lt!411715) (tuple2!12505 lt!411589 zeroValue!1094)))))

(assert (= (and d!112949 res!616836) b!915053))

(assert (= (and b!915053 res!616835) b!915054))

(declare-fun m!850087 () Bool)

(assert (=> d!112949 m!850087))

(declare-fun m!850089 () Bool)

(assert (=> d!112949 m!850089))

(declare-fun m!850091 () Bool)

(assert (=> d!112949 m!850091))

(declare-fun m!850093 () Bool)

(assert (=> d!112949 m!850093))

(declare-fun m!850095 () Bool)

(assert (=> b!915053 m!850095))

(declare-fun m!850097 () Bool)

(assert (=> b!915054 m!850097))

(assert (=> b!914836 d!112949))

(declare-fun d!112951 () Bool)

(declare-fun res!616837 () Bool)

(declare-fun e!513391 () Bool)

(assert (=> d!112951 (=> res!616837 e!513391)))

(assert (=> d!112951 (= res!616837 (and ((_ is Cons!18316) (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6263 (h!19468 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112951 (= (containsKey!445 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!513391)))

(declare-fun b!915055 () Bool)

(declare-fun e!513392 () Bool)

(assert (=> b!915055 (= e!513391 e!513392)))

(declare-fun res!616838 () Bool)

(assert (=> b!915055 (=> (not res!616838) (not e!513392))))

(assert (=> b!915055 (= res!616838 (and (or (not ((_ is Cons!18316) (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) (bvsle (_1!6263 (h!19468 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18316) (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (bvslt (_1!6263 (h!19468 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!915056 () Bool)

(assert (=> b!915056 (= e!513392 (containsKey!445 (t!25907 (toList!5617 (getCurrentListMap!2878 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112951 (not res!616837)) b!915055))

(assert (= (and b!915055 res!616838) b!915056))

(declare-fun m!850099 () Bool)

(assert (=> b!915056 m!850099))

(assert (=> d!112821 d!112951))

(declare-fun d!112953 () Bool)

(declare-fun e!513393 () Bool)

(assert (=> d!112953 e!513393))

(declare-fun res!616839 () Bool)

(assert (=> d!112953 (=> res!616839 e!513393)))

(declare-fun lt!411717 () Bool)

(assert (=> d!112953 (= res!616839 (not lt!411717))))

(declare-fun lt!411716 () Bool)

(assert (=> d!112953 (= lt!411717 lt!411716)))

(declare-fun lt!411719 () Unit!30914)

(declare-fun e!513394 () Unit!30914)

(assert (=> d!112953 (= lt!411719 e!513394)))

(declare-fun c!96284 () Bool)

(assert (=> d!112953 (= c!96284 lt!411716)))

(assert (=> d!112953 (= lt!411716 (containsKey!445 (toList!5617 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094))) lt!411548))))

(assert (=> d!112953 (= (contains!4675 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094)) lt!411548) lt!411717)))

(declare-fun b!915057 () Bool)

(declare-fun lt!411718 () Unit!30914)

(assert (=> b!915057 (= e!513394 lt!411718)))

(assert (=> b!915057 (= lt!411718 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094))) lt!411548))))

(assert (=> b!915057 (isDefined!347 (getValueByKey!474 (toList!5617 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094))) lt!411548))))

(declare-fun b!915058 () Bool)

(declare-fun Unit!30928 () Unit!30914)

(assert (=> b!915058 (= e!513394 Unit!30928)))

(declare-fun b!915059 () Bool)

(assert (=> b!915059 (= e!513393 (isDefined!347 (getValueByKey!474 (toList!5617 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094))) lt!411548)))))

(assert (= (and d!112953 c!96284) b!915057))

(assert (= (and d!112953 (not c!96284)) b!915058))

(assert (= (and d!112953 (not res!616839)) b!915059))

(declare-fun m!850101 () Bool)

(assert (=> d!112953 m!850101))

(declare-fun m!850103 () Bool)

(assert (=> b!915057 m!850103))

(declare-fun m!850105 () Bool)

(assert (=> b!915057 m!850105))

(assert (=> b!915057 m!850105))

(declare-fun m!850107 () Bool)

(assert (=> b!915057 m!850107))

(assert (=> b!915059 m!850105))

(assert (=> b!915059 m!850105))

(assert (=> b!915059 m!850107))

(assert (=> b!914806 d!112953))

(declare-fun d!112955 () Bool)

(assert (=> d!112955 (= (apply!528 (+!2619 lt!411558 (tuple2!12505 lt!411547 minValue!1094)) lt!411560) (apply!528 lt!411558 lt!411560))))

(declare-fun lt!411720 () Unit!30914)

(assert (=> d!112955 (= lt!411720 (choose!1543 lt!411558 lt!411547 minValue!1094 lt!411560))))

(declare-fun e!513395 () Bool)

(assert (=> d!112955 e!513395))

(declare-fun res!616840 () Bool)

(assert (=> d!112955 (=> (not res!616840) (not e!513395))))

(assert (=> d!112955 (= res!616840 (contains!4675 lt!411558 lt!411560))))

(assert (=> d!112955 (= (addApplyDifferent!350 lt!411558 lt!411547 minValue!1094 lt!411560) lt!411720)))

(declare-fun b!915060 () Bool)

(assert (=> b!915060 (= e!513395 (not (= lt!411560 lt!411547)))))

(assert (= (and d!112955 res!616840) b!915060))

(assert (=> d!112955 m!849697))

(assert (=> d!112955 m!849699))

(declare-fun m!850109 () Bool)

(assert (=> d!112955 m!850109))

(assert (=> d!112955 m!849701))

(declare-fun m!850111 () Bool)

(assert (=> d!112955 m!850111))

(assert (=> d!112955 m!849697))

(assert (=> b!914806 d!112955))

(declare-fun d!112957 () Bool)

(assert (=> d!112957 (= (apply!528 (+!2619 lt!411555 (tuple2!12505 lt!411561 zeroValue!1094)) lt!411544) (apply!528 lt!411555 lt!411544))))

(declare-fun lt!411721 () Unit!30914)

(assert (=> d!112957 (= lt!411721 (choose!1543 lt!411555 lt!411561 zeroValue!1094 lt!411544))))

(declare-fun e!513396 () Bool)

(assert (=> d!112957 e!513396))

(declare-fun res!616841 () Bool)

(assert (=> d!112957 (=> (not res!616841) (not e!513396))))

(assert (=> d!112957 (= res!616841 (contains!4675 lt!411555 lt!411544))))

(assert (=> d!112957 (= (addApplyDifferent!350 lt!411555 lt!411561 zeroValue!1094 lt!411544) lt!411721)))

(declare-fun b!915061 () Bool)

(assert (=> b!915061 (= e!513396 (not (= lt!411544 lt!411561)))))

(assert (= (and d!112957 res!616841) b!915061))

(assert (=> d!112957 m!849703))

(assert (=> d!112957 m!849705))

(declare-fun m!850113 () Bool)

(assert (=> d!112957 m!850113))

(assert (=> d!112957 m!849725))

(declare-fun m!850115 () Bool)

(assert (=> d!112957 m!850115))

(assert (=> d!112957 m!849703))

(assert (=> b!914806 d!112957))

(declare-fun d!112959 () Bool)

(assert (=> d!112959 (= (apply!528 (+!2619 lt!411543 (tuple2!12505 lt!411559 minValue!1094)) lt!411551) (apply!528 lt!411543 lt!411551))))

(declare-fun lt!411722 () Unit!30914)

(assert (=> d!112959 (= lt!411722 (choose!1543 lt!411543 lt!411559 minValue!1094 lt!411551))))

(declare-fun e!513397 () Bool)

(assert (=> d!112959 e!513397))

(declare-fun res!616842 () Bool)

(assert (=> d!112959 (=> (not res!616842) (not e!513397))))

(assert (=> d!112959 (= res!616842 (contains!4675 lt!411543 lt!411551))))

(assert (=> d!112959 (= (addApplyDifferent!350 lt!411543 lt!411559 minValue!1094 lt!411551) lt!411722)))

(declare-fun b!915062 () Bool)

(assert (=> b!915062 (= e!513397 (not (= lt!411551 lt!411559)))))

(assert (= (and d!112959 res!616842) b!915062))

(assert (=> d!112959 m!849707))

(assert (=> d!112959 m!849723))

(declare-fun m!850117 () Bool)

(assert (=> d!112959 m!850117))

(assert (=> d!112959 m!849711))

(declare-fun m!850119 () Bool)

(assert (=> d!112959 m!850119))

(assert (=> d!112959 m!849707))

(assert (=> b!914806 d!112959))

(declare-fun d!112961 () Bool)

(assert (=> d!112961 (contains!4675 (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094)) lt!411548)))

(declare-fun lt!411723 () Unit!30914)

(assert (=> d!112961 (= lt!411723 (choose!1544 lt!411550 lt!411563 zeroValue!1094 lt!411548))))

(assert (=> d!112961 (contains!4675 lt!411550 lt!411548)))

(assert (=> d!112961 (= (addStillContains!350 lt!411550 lt!411563 zeroValue!1094 lt!411548) lt!411723)))

(declare-fun bs!25741 () Bool)

(assert (= bs!25741 d!112961))

(assert (=> bs!25741 m!849709))

(assert (=> bs!25741 m!849709))

(assert (=> bs!25741 m!849719))

(declare-fun m!850121 () Bool)

(assert (=> bs!25741 m!850121))

(declare-fun m!850123 () Bool)

(assert (=> bs!25741 m!850123))

(assert (=> b!914806 d!112961))

(declare-fun d!112963 () Bool)

(declare-fun e!513398 () Bool)

(assert (=> d!112963 e!513398))

(declare-fun res!616844 () Bool)

(assert (=> d!112963 (=> (not res!616844) (not e!513398))))

(declare-fun lt!411727 () ListLongMap!11203)

(assert (=> d!112963 (= res!616844 (contains!4675 lt!411727 (_1!6263 (tuple2!12505 lt!411559 minValue!1094))))))

(declare-fun lt!411726 () List!18320)

(assert (=> d!112963 (= lt!411727 (ListLongMap!11204 lt!411726))))

(declare-fun lt!411724 () Unit!30914)

(declare-fun lt!411725 () Unit!30914)

(assert (=> d!112963 (= lt!411724 lt!411725)))

(assert (=> d!112963 (= (getValueByKey!474 lt!411726 (_1!6263 (tuple2!12505 lt!411559 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411559 minValue!1094))))))

(assert (=> d!112963 (= lt!411725 (lemmaContainsTupThenGetReturnValue!254 lt!411726 (_1!6263 (tuple2!12505 lt!411559 minValue!1094)) (_2!6263 (tuple2!12505 lt!411559 minValue!1094))))))

(assert (=> d!112963 (= lt!411726 (insertStrictlySorted!311 (toList!5617 lt!411543) (_1!6263 (tuple2!12505 lt!411559 minValue!1094)) (_2!6263 (tuple2!12505 lt!411559 minValue!1094))))))

(assert (=> d!112963 (= (+!2619 lt!411543 (tuple2!12505 lt!411559 minValue!1094)) lt!411727)))

(declare-fun b!915063 () Bool)

(declare-fun res!616843 () Bool)

(assert (=> b!915063 (=> (not res!616843) (not e!513398))))

(assert (=> b!915063 (= res!616843 (= (getValueByKey!474 (toList!5617 lt!411727) (_1!6263 (tuple2!12505 lt!411559 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411559 minValue!1094)))))))

(declare-fun b!915064 () Bool)

(assert (=> b!915064 (= e!513398 (contains!4679 (toList!5617 lt!411727) (tuple2!12505 lt!411559 minValue!1094)))))

(assert (= (and d!112963 res!616844) b!915063))

(assert (= (and b!915063 res!616843) b!915064))

(declare-fun m!850125 () Bool)

(assert (=> d!112963 m!850125))

(declare-fun m!850127 () Bool)

(assert (=> d!112963 m!850127))

(declare-fun m!850129 () Bool)

(assert (=> d!112963 m!850129))

(declare-fun m!850131 () Bool)

(assert (=> d!112963 m!850131))

(declare-fun m!850133 () Bool)

(assert (=> b!915063 m!850133))

(declare-fun m!850135 () Bool)

(assert (=> b!915064 m!850135))

(assert (=> b!914806 d!112963))

(declare-fun d!112965 () Bool)

(declare-fun e!513399 () Bool)

(assert (=> d!112965 e!513399))

(declare-fun res!616846 () Bool)

(assert (=> d!112965 (=> (not res!616846) (not e!513399))))

(declare-fun lt!411731 () ListLongMap!11203)

(assert (=> d!112965 (= res!616846 (contains!4675 lt!411731 (_1!6263 (tuple2!12505 lt!411547 minValue!1094))))))

(declare-fun lt!411730 () List!18320)

(assert (=> d!112965 (= lt!411731 (ListLongMap!11204 lt!411730))))

(declare-fun lt!411728 () Unit!30914)

(declare-fun lt!411729 () Unit!30914)

(assert (=> d!112965 (= lt!411728 lt!411729)))

(assert (=> d!112965 (= (getValueByKey!474 lt!411730 (_1!6263 (tuple2!12505 lt!411547 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411547 minValue!1094))))))

(assert (=> d!112965 (= lt!411729 (lemmaContainsTupThenGetReturnValue!254 lt!411730 (_1!6263 (tuple2!12505 lt!411547 minValue!1094)) (_2!6263 (tuple2!12505 lt!411547 minValue!1094))))))

(assert (=> d!112965 (= lt!411730 (insertStrictlySorted!311 (toList!5617 lt!411558) (_1!6263 (tuple2!12505 lt!411547 minValue!1094)) (_2!6263 (tuple2!12505 lt!411547 minValue!1094))))))

(assert (=> d!112965 (= (+!2619 lt!411558 (tuple2!12505 lt!411547 minValue!1094)) lt!411731)))

(declare-fun b!915065 () Bool)

(declare-fun res!616845 () Bool)

(assert (=> b!915065 (=> (not res!616845) (not e!513399))))

(assert (=> b!915065 (= res!616845 (= (getValueByKey!474 (toList!5617 lt!411731) (_1!6263 (tuple2!12505 lt!411547 minValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411547 minValue!1094)))))))

(declare-fun b!915066 () Bool)

(assert (=> b!915066 (= e!513399 (contains!4679 (toList!5617 lt!411731) (tuple2!12505 lt!411547 minValue!1094)))))

(assert (= (and d!112965 res!616846) b!915065))

(assert (= (and b!915065 res!616845) b!915066))

(declare-fun m!850137 () Bool)

(assert (=> d!112965 m!850137))

(declare-fun m!850139 () Bool)

(assert (=> d!112965 m!850139))

(declare-fun m!850141 () Bool)

(assert (=> d!112965 m!850141))

(declare-fun m!850143 () Bool)

(assert (=> d!112965 m!850143))

(declare-fun m!850145 () Bool)

(assert (=> b!915065 m!850145))

(declare-fun m!850147 () Bool)

(assert (=> b!915066 m!850147))

(assert (=> b!914806 d!112965))

(declare-fun d!112967 () Bool)

(assert (=> d!112967 (= (apply!528 lt!411558 lt!411560) (get!13728 (getValueByKey!474 (toList!5617 lt!411558) lt!411560)))))

(declare-fun bs!25742 () Bool)

(assert (= bs!25742 d!112967))

(declare-fun m!850149 () Bool)

(assert (=> bs!25742 m!850149))

(assert (=> bs!25742 m!850149))

(declare-fun m!850151 () Bool)

(assert (=> bs!25742 m!850151))

(assert (=> b!914806 d!112967))

(declare-fun d!112969 () Bool)

(assert (=> d!112969 (= (apply!528 (+!2619 lt!411558 (tuple2!12505 lt!411547 minValue!1094)) lt!411560) (get!13728 (getValueByKey!474 (toList!5617 (+!2619 lt!411558 (tuple2!12505 lt!411547 minValue!1094))) lt!411560)))))

(declare-fun bs!25743 () Bool)

(assert (= bs!25743 d!112969))

(declare-fun m!850153 () Bool)

(assert (=> bs!25743 m!850153))

(assert (=> bs!25743 m!850153))

(declare-fun m!850155 () Bool)

(assert (=> bs!25743 m!850155))

(assert (=> b!914806 d!112969))

(declare-fun d!112971 () Bool)

(assert (=> d!112971 (= (apply!528 (+!2619 lt!411543 (tuple2!12505 lt!411559 minValue!1094)) lt!411551) (get!13728 (getValueByKey!474 (toList!5617 (+!2619 lt!411543 (tuple2!12505 lt!411559 minValue!1094))) lt!411551)))))

(declare-fun bs!25744 () Bool)

(assert (= bs!25744 d!112971))

(declare-fun m!850157 () Bool)

(assert (=> bs!25744 m!850157))

(assert (=> bs!25744 m!850157))

(declare-fun m!850159 () Bool)

(assert (=> bs!25744 m!850159))

(assert (=> b!914806 d!112971))

(declare-fun d!112973 () Bool)

(declare-fun e!513400 () Bool)

(assert (=> d!112973 e!513400))

(declare-fun res!616848 () Bool)

(assert (=> d!112973 (=> (not res!616848) (not e!513400))))

(declare-fun lt!411735 () ListLongMap!11203)

(assert (=> d!112973 (= res!616848 (contains!4675 lt!411735 (_1!6263 (tuple2!12505 lt!411563 zeroValue!1094))))))

(declare-fun lt!411734 () List!18320)

(assert (=> d!112973 (= lt!411735 (ListLongMap!11204 lt!411734))))

(declare-fun lt!411732 () Unit!30914)

(declare-fun lt!411733 () Unit!30914)

(assert (=> d!112973 (= lt!411732 lt!411733)))

(assert (=> d!112973 (= (getValueByKey!474 lt!411734 (_1!6263 (tuple2!12505 lt!411563 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411563 zeroValue!1094))))))

(assert (=> d!112973 (= lt!411733 (lemmaContainsTupThenGetReturnValue!254 lt!411734 (_1!6263 (tuple2!12505 lt!411563 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411563 zeroValue!1094))))))

(assert (=> d!112973 (= lt!411734 (insertStrictlySorted!311 (toList!5617 lt!411550) (_1!6263 (tuple2!12505 lt!411563 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411563 zeroValue!1094))))))

(assert (=> d!112973 (= (+!2619 lt!411550 (tuple2!12505 lt!411563 zeroValue!1094)) lt!411735)))

(declare-fun b!915067 () Bool)

(declare-fun res!616847 () Bool)

(assert (=> b!915067 (=> (not res!616847) (not e!513400))))

(assert (=> b!915067 (= res!616847 (= (getValueByKey!474 (toList!5617 lt!411735) (_1!6263 (tuple2!12505 lt!411563 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411563 zeroValue!1094)))))))

(declare-fun b!915068 () Bool)

(assert (=> b!915068 (= e!513400 (contains!4679 (toList!5617 lt!411735) (tuple2!12505 lt!411563 zeroValue!1094)))))

(assert (= (and d!112973 res!616848) b!915067))

(assert (= (and b!915067 res!616847) b!915068))

(declare-fun m!850161 () Bool)

(assert (=> d!112973 m!850161))

(declare-fun m!850163 () Bool)

(assert (=> d!112973 m!850163))

(declare-fun m!850165 () Bool)

(assert (=> d!112973 m!850165))

(declare-fun m!850167 () Bool)

(assert (=> d!112973 m!850167))

(declare-fun m!850169 () Bool)

(assert (=> b!915067 m!850169))

(declare-fun m!850171 () Bool)

(assert (=> b!915068 m!850171))

(assert (=> b!914806 d!112973))

(declare-fun d!112975 () Bool)

(assert (=> d!112975 (= (apply!528 lt!411543 lt!411551) (get!13728 (getValueByKey!474 (toList!5617 lt!411543) lt!411551)))))

(declare-fun bs!25745 () Bool)

(assert (= bs!25745 d!112975))

(declare-fun m!850173 () Bool)

(assert (=> bs!25745 m!850173))

(assert (=> bs!25745 m!850173))

(declare-fun m!850175 () Bool)

(assert (=> bs!25745 m!850175))

(assert (=> b!914806 d!112975))

(declare-fun d!112977 () Bool)

(declare-fun e!513401 () Bool)

(assert (=> d!112977 e!513401))

(declare-fun res!616850 () Bool)

(assert (=> d!112977 (=> (not res!616850) (not e!513401))))

(declare-fun lt!411739 () ListLongMap!11203)

(assert (=> d!112977 (= res!616850 (contains!4675 lt!411739 (_1!6263 (tuple2!12505 lt!411561 zeroValue!1094))))))

(declare-fun lt!411738 () List!18320)

(assert (=> d!112977 (= lt!411739 (ListLongMap!11204 lt!411738))))

(declare-fun lt!411736 () Unit!30914)

(declare-fun lt!411737 () Unit!30914)

(assert (=> d!112977 (= lt!411736 lt!411737)))

(assert (=> d!112977 (= (getValueByKey!474 lt!411738 (_1!6263 (tuple2!12505 lt!411561 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411561 zeroValue!1094))))))

(assert (=> d!112977 (= lt!411737 (lemmaContainsTupThenGetReturnValue!254 lt!411738 (_1!6263 (tuple2!12505 lt!411561 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411561 zeroValue!1094))))))

(assert (=> d!112977 (= lt!411738 (insertStrictlySorted!311 (toList!5617 lt!411555) (_1!6263 (tuple2!12505 lt!411561 zeroValue!1094)) (_2!6263 (tuple2!12505 lt!411561 zeroValue!1094))))))

(assert (=> d!112977 (= (+!2619 lt!411555 (tuple2!12505 lt!411561 zeroValue!1094)) lt!411739)))

(declare-fun b!915069 () Bool)

(declare-fun res!616849 () Bool)

(assert (=> b!915069 (=> (not res!616849) (not e!513401))))

(assert (=> b!915069 (= res!616849 (= (getValueByKey!474 (toList!5617 lt!411739) (_1!6263 (tuple2!12505 lt!411561 zeroValue!1094))) (Some!479 (_2!6263 (tuple2!12505 lt!411561 zeroValue!1094)))))))

(declare-fun b!915070 () Bool)

(assert (=> b!915070 (= e!513401 (contains!4679 (toList!5617 lt!411739) (tuple2!12505 lt!411561 zeroValue!1094)))))

(assert (= (and d!112977 res!616850) b!915069))

(assert (= (and b!915069 res!616849) b!915070))

(declare-fun m!850177 () Bool)

(assert (=> d!112977 m!850177))

(declare-fun m!850179 () Bool)

(assert (=> d!112977 m!850179))

(declare-fun m!850181 () Bool)

(assert (=> d!112977 m!850181))

(declare-fun m!850183 () Bool)

(assert (=> d!112977 m!850183))

(declare-fun m!850185 () Bool)

(assert (=> b!915069 m!850185))

(declare-fun m!850187 () Bool)

(assert (=> b!915070 m!850187))

(assert (=> b!914806 d!112977))

(declare-fun d!112979 () Bool)

(assert (=> d!112979 (= (apply!528 lt!411555 lt!411544) (get!13728 (getValueByKey!474 (toList!5617 lt!411555) lt!411544)))))

(declare-fun bs!25746 () Bool)

(assert (= bs!25746 d!112979))

(declare-fun m!850189 () Bool)

(assert (=> bs!25746 m!850189))

(assert (=> bs!25746 m!850189))

(declare-fun m!850191 () Bool)

(assert (=> bs!25746 m!850191))

(assert (=> b!914806 d!112979))

(declare-fun d!112981 () Bool)

(assert (=> d!112981 (= (apply!528 (+!2619 lt!411555 (tuple2!12505 lt!411561 zeroValue!1094)) lt!411544) (get!13728 (getValueByKey!474 (toList!5617 (+!2619 lt!411555 (tuple2!12505 lt!411561 zeroValue!1094))) lt!411544)))))

(declare-fun bs!25747 () Bool)

(assert (= bs!25747 d!112981))

(declare-fun m!850193 () Bool)

(assert (=> bs!25747 m!850193))

(assert (=> bs!25747 m!850193))

(declare-fun m!850195 () Bool)

(assert (=> bs!25747 m!850195))

(assert (=> b!914806 d!112981))

(assert (=> b!914806 d!112919))

(declare-fun d!112983 () Bool)

(declare-fun e!513402 () Bool)

(assert (=> d!112983 e!513402))

(declare-fun res!616852 () Bool)

(assert (=> d!112983 (=> (not res!616852) (not e!513402))))

(declare-fun lt!411743 () ListLongMap!11203)

(assert (=> d!112983 (= res!616852 (contains!4675 lt!411743 (_1!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411742 () List!18320)

(assert (=> d!112983 (= lt!411743 (ListLongMap!11204 lt!411742))))

(declare-fun lt!411740 () Unit!30914)

(declare-fun lt!411741 () Unit!30914)

(assert (=> d!112983 (= lt!411740 lt!411741)))

(assert (=> d!112983 (= (getValueByKey!474 lt!411742 (_1!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!479 (_2!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112983 (= lt!411741 (lemmaContainsTupThenGetReturnValue!254 lt!411742 (_1!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112983 (= lt!411742 (insertStrictlySorted!311 (toList!5617 (ite c!96226 call!40534 (ite c!96229 call!40528 call!40529))) (_1!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112983 (= (+!2619 (ite c!96226 call!40534 (ite c!96229 call!40528 call!40529)) (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411743)))

(declare-fun b!915071 () Bool)

(declare-fun res!616851 () Bool)

(assert (=> b!915071 (=> (not res!616851) (not e!513402))))

(assert (=> b!915071 (= res!616851 (= (getValueByKey!474 (toList!5617 lt!411743) (_1!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!479 (_2!6263 (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!915072 () Bool)

(assert (=> b!915072 (= e!513402 (contains!4679 (toList!5617 lt!411743) (ite (or c!96226 c!96229) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112983 res!616852) b!915071))

(assert (= (and b!915071 res!616851) b!915072))

(declare-fun m!850197 () Bool)

(assert (=> d!112983 m!850197))

(declare-fun m!850199 () Bool)

(assert (=> d!112983 m!850199))

(declare-fun m!850201 () Bool)

(assert (=> d!112983 m!850201))

(declare-fun m!850203 () Bool)

(assert (=> d!112983 m!850203))

(declare-fun m!850205 () Bool)

(assert (=> b!915071 m!850205))

(declare-fun m!850207 () Bool)

(assert (=> b!915072 m!850207))

(assert (=> bm!40528 d!112983))

(declare-fun d!112985 () Bool)

(declare-fun e!513403 () Bool)

(assert (=> d!112985 e!513403))

(declare-fun res!616854 () Bool)

(assert (=> d!112985 (=> (not res!616854) (not e!513403))))

(declare-fun lt!411747 () ListLongMap!11203)

(assert (=> d!112985 (= res!616854 (contains!4675 lt!411747 (_1!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411746 () List!18320)

(assert (=> d!112985 (= lt!411747 (ListLongMap!11204 lt!411746))))

(declare-fun lt!411744 () Unit!30914)

(declare-fun lt!411745 () Unit!30914)

(assert (=> d!112985 (= lt!411744 lt!411745)))

(assert (=> d!112985 (= (getValueByKey!474 lt!411746 (_1!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!479 (_2!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112985 (= lt!411745 (lemmaContainsTupThenGetReturnValue!254 lt!411746 (_1!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112985 (= lt!411746 (insertStrictlySorted!311 (toList!5617 (ite c!96216 call!40527 (ite c!96219 call!40521 call!40522))) (_1!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112985 (= (+!2619 (ite c!96216 call!40527 (ite c!96219 call!40521 call!40522)) (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411747)))

(declare-fun b!915073 () Bool)

(declare-fun res!616853 () Bool)

(assert (=> b!915073 (=> (not res!616853) (not e!513403))))

(assert (=> b!915073 (= res!616853 (= (getValueByKey!474 (toList!5617 lt!411747) (_1!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!479 (_2!6263 (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!915074 () Bool)

(assert (=> b!915074 (= e!513403 (contains!4679 (toList!5617 lt!411747) (ite (or c!96216 c!96219) (tuple2!12505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112985 res!616854) b!915073))

(assert (= (and b!915073 res!616853) b!915074))

(declare-fun m!850209 () Bool)

(assert (=> d!112985 m!850209))

(declare-fun m!850211 () Bool)

(assert (=> d!112985 m!850211))

(declare-fun m!850213 () Bool)

(assert (=> d!112985 m!850213))

(declare-fun m!850215 () Bool)

(assert (=> d!112985 m!850215))

(declare-fun m!850217 () Bool)

(assert (=> b!915073 m!850217))

(declare-fun m!850219 () Bool)

(assert (=> b!915074 m!850219))

(assert (=> bm!40521 d!112985))

(declare-fun d!112987 () Bool)

(declare-fun e!513404 () Bool)

(assert (=> d!112987 e!513404))

(declare-fun res!616855 () Bool)

(assert (=> d!112987 (=> res!616855 e!513404)))

(declare-fun lt!411749 () Bool)

(assert (=> d!112987 (= res!616855 (not lt!411749))))

(declare-fun lt!411748 () Bool)

(assert (=> d!112987 (= lt!411749 lt!411748)))

(declare-fun lt!411751 () Unit!30914)

(declare-fun e!513405 () Unit!30914)

(assert (=> d!112987 (= lt!411751 e!513405)))

(declare-fun c!96285 () Bool)

(assert (=> d!112987 (= c!96285 lt!411748)))

(assert (=> d!112987 (= lt!411748 (containsKey!445 (toList!5617 lt!411571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112987 (= (contains!4675 lt!411571 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411749)))

(declare-fun b!915075 () Bool)

(declare-fun lt!411750 () Unit!30914)

(assert (=> b!915075 (= e!513405 lt!411750)))

(assert (=> b!915075 (= lt!411750 (lemmaContainsKeyImpliesGetValueByKeyDefined!339 (toList!5617 lt!411571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!915075 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915076 () Bool)

(declare-fun Unit!30929 () Unit!30914)

(assert (=> b!915076 (= e!513405 Unit!30929)))

(declare-fun b!915077 () Bool)

(assert (=> b!915077 (= e!513404 (isDefined!347 (getValueByKey!474 (toList!5617 lt!411571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112987 c!96285) b!915075))

(assert (= (and d!112987 (not c!96285)) b!915076))

(assert (= (and d!112987 (not res!616855)) b!915077))

(declare-fun m!850221 () Bool)

(assert (=> d!112987 m!850221))

(declare-fun m!850223 () Bool)

(assert (=> b!915075 m!850223))

(assert (=> b!915075 m!849907))

(assert (=> b!915075 m!849907))

(declare-fun m!850225 () Bool)

(assert (=> b!915075 m!850225))

(assert (=> b!915077 m!849907))

(assert (=> b!915077 m!849907))

(assert (=> b!915077 m!850225))

(assert (=> bm!40527 d!112987))

(declare-fun b!915079 () Bool)

(declare-fun e!513406 () Bool)

(assert (=> b!915079 (= e!513406 tp_is_empty!19153)))

(declare-fun b!915078 () Bool)

(declare-fun e!513407 () Bool)

(assert (=> b!915078 (= e!513407 tp_is_empty!19153)))

(declare-fun condMapEmpty!30474 () Bool)

(declare-fun mapDefault!30474 () ValueCell!9095)

(assert (=> mapNonEmpty!30473 (= condMapEmpty!30474 (= mapRest!30473 ((as const (Array (_ BitVec 32) ValueCell!9095)) mapDefault!30474)))))

(declare-fun mapRes!30474 () Bool)

(assert (=> mapNonEmpty!30473 (= tp!58505 (and e!513406 mapRes!30474))))

(declare-fun mapNonEmpty!30474 () Bool)

(declare-fun tp!58506 () Bool)

(assert (=> mapNonEmpty!30474 (= mapRes!30474 (and tp!58506 e!513407))))

(declare-fun mapValue!30474 () ValueCell!9095)

(declare-fun mapKey!30474 () (_ BitVec 32))

(declare-fun mapRest!30474 () (Array (_ BitVec 32) ValueCell!9095))

(assert (=> mapNonEmpty!30474 (= mapRest!30473 (store mapRest!30474 mapKey!30474 mapValue!30474))))

(declare-fun mapIsEmpty!30474 () Bool)

(assert (=> mapIsEmpty!30474 mapRes!30474))

(assert (= (and mapNonEmpty!30473 condMapEmpty!30474) mapIsEmpty!30474))

(assert (= (and mapNonEmpty!30473 (not condMapEmpty!30474)) mapNonEmpty!30474))

(assert (= (and mapNonEmpty!30474 ((_ is ValueCellFull!9095) mapValue!30474)) b!915078))

(assert (= (and mapNonEmpty!30473 ((_ is ValueCellFull!9095) mapDefault!30474)) b!915079))

(declare-fun m!850227 () Bool)

(assert (=> mapNonEmpty!30474 m!850227))

(declare-fun b_lambda!13377 () Bool)

(assert (= b_lambda!13369 (or (and start!78482 b_free!16735) b_lambda!13377)))

(declare-fun b_lambda!13379 () Bool)

(assert (= b_lambda!13375 (or (and start!78482 b_free!16735) b_lambda!13379)))

(declare-fun b_lambda!13381 () Bool)

(assert (= b_lambda!13373 (or (and start!78482 b_free!16735) b_lambda!13381)))

(declare-fun b_lambda!13383 () Bool)

(assert (= b_lambda!13371 (or (and start!78482 b_free!16735) b_lambda!13383)))

(check-sat (not b!914926) (not b!914935) (not b!915035) (not b_lambda!13381) (not b!915028) (not b!915067) (not b!914979) (not b!915008) (not b!914929) (not d!112905) (not b!914948) (not b!915064) (not d!112875) (not b!915036) (not d!112919) (not d!112969) (not d!112945) (not mapNonEmpty!30474) (not b!915037) (not d!112979) (not b!915063) (not b!915049) (not d!112937) (not b!915051) (not b!914933) (not b_lambda!13359) (not d!112873) (not d!112987) (not d!112963) (not d!112967) (not d!112921) (not d!112911) (not b!915013) (not d!112957) (not b!915071) (not b!914913) (not b_lambda!13383) (not b!914970) (not b!915030) (not d!112865) (not d!112927) (not b!914910) (not d!112915) (not b!915047) (not b!914922) (not d!112941) (not b!914975) (not b!914938) (not b!915059) (not b!914936) (not b!915029) (not d!112887) (not d!112897) (not b!914977) (not b!915046) (not d!112871) (not d!112849) (not d!112973) (not d!112851) (not d!112857) (not b!915072) (not b!915068) (not d!112949) (not bm!40539) (not b!915011) (not b!914965) (not b_lambda!13379) (not b!914908) (not b!914980) (not d!112863) (not b!915056) (not b!915070) (not b!914912) (not d!112929) (not d!112971) (not b!915054) (not d!112925) (not bm!40538) (not b!915077) (not b!915053) (not d!112983) (not b!914927) (not b!915069) (not b!915031) (not b!915026) (not b!915057) (not bm!40542) (not d!112903) (not b!914941) (not b!915065) (not b!915018) (not b!915074) (not d!112909) (not d!112953) (not d!112939) (not d!112913) (not b!915012) (not b!915025) (not d!112975) tp_is_empty!19153 (not d!112861) (not b!915007) (not d!112985) (not bm!40543) (not d!112959) (not b!915024) (not d!112943) (not b!914897) (not b!914930) (not d!112893) (not b!915050) (not d!112947) (not b_next!16735) (not d!112931) (not b!915066) (not b!914947) (not d!112981) (not b!914978) (not b!915073) (not b!914924) (not d!112877) (not d!112965) (not d!112955) (not d!112923) (not d!112935) (not b_lambda!13367) (not b!914923) (not b!914950) (not b!915048) (not b!915075) (not d!112881) (not b!914982) (not b!915039) (not b_lambda!13377) b_and!27357 (not b!914916) (not b!915010) (not d!112977) (not d!112961) (not d!112933) (not d!112891) (not b_lambda!13365) (not b!914932) (not b!915017))
(check-sat b_and!27357 (not b_next!16735))
