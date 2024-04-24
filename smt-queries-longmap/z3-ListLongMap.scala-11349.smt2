; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132410 () Bool)

(assert start!132410)

(declare-fun b_free!31711 () Bool)

(declare-fun b_next!31711 () Bool)

(assert (=> start!132410 (= b_free!31711 (not b_next!31711))))

(declare-fun tp!111384 () Bool)

(declare-fun b_and!51123 () Bool)

(assert (=> start!132410 (= tp!111384 b_and!51123)))

(declare-fun b!1548941 () Bool)

(declare-fun e!862330 () Bool)

(declare-fun tp_is_empty!37987 () Bool)

(assert (=> b!1548941 (= e!862330 tp_is_empty!37987)))

(declare-fun bm!69707 () Bool)

(declare-datatypes ((V!59093 0))(
  ( (V!59094 (val!19071 Int)) )
))
(declare-datatypes ((tuple2!24582 0))(
  ( (tuple2!24583 (_1!12302 (_ BitVec 64)) (_2!12302 V!59093)) )
))
(declare-datatypes ((List!36067 0))(
  ( (Nil!36064) (Cons!36063 (h!37526 tuple2!24582) (t!50753 List!36067)) )
))
(declare-datatypes ((ListLongMap!22199 0))(
  ( (ListLongMap!22200 (toList!11115 List!36067)) )
))
(declare-fun call!69713 () ListLongMap!22199)

(declare-fun call!69711 () ListLongMap!22199)

(assert (=> bm!69707 (= call!69713 call!69711)))

(declare-fun mapIsEmpty!58684 () Bool)

(declare-fun mapRes!58684 () Bool)

(assert (=> mapIsEmpty!58684 mapRes!58684))

(declare-fun b!1548942 () Bool)

(declare-fun res!1061136 () Bool)

(declare-fun e!862338 () Bool)

(assert (=> b!1548942 (=> (not res!1061136) (not e!862338))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103302 0))(
  ( (array!103303 (arr!49846 (Array (_ BitVec 32) (_ BitVec 64))) (size!50397 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103302)

(assert (=> b!1548942 (= res!1061136 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50397 _keys!618))))))

(declare-fun b!1548943 () Bool)

(declare-fun res!1061134 () Bool)

(assert (=> b!1548943 (=> (not res!1061134) (not e!862338))))

(declare-datatypes ((List!36068 0))(
  ( (Nil!36065) (Cons!36064 (h!37527 (_ BitVec 64)) (t!50754 List!36068)) )
))
(declare-fun arrayNoDuplicates!0 (array!103302 (_ BitVec 32) List!36068) Bool)

(assert (=> b!1548943 (= res!1061134 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36065))))

(declare-fun res!1061135 () Bool)

(assert (=> start!132410 (=> (not res!1061135) (not e!862338))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132410 (= res!1061135 (validMask!0 mask!926))))

(assert (=> start!132410 e!862338))

(declare-fun array_inv!39035 (array!103302) Bool)

(assert (=> start!132410 (array_inv!39035 _keys!618)))

(assert (=> start!132410 tp_is_empty!37987))

(assert (=> start!132410 true))

(assert (=> start!132410 tp!111384))

(declare-datatypes ((ValueCell!18083 0))(
  ( (ValueCellFull!18083 (v!21864 V!59093)) (EmptyCell!18083) )
))
(declare-datatypes ((array!103304 0))(
  ( (array!103305 (arr!49847 (Array (_ BitVec 32) ValueCell!18083)) (size!50398 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103304)

(declare-fun e!862336 () Bool)

(declare-fun array_inv!39036 (array!103304) Bool)

(assert (=> start!132410 (and (array_inv!39036 _values!470) e!862336)))

(declare-fun b!1548944 () Bool)

(declare-fun e!862334 () ListLongMap!22199)

(assert (=> b!1548944 (= e!862334 call!69713)))

(declare-fun b!1548945 () Bool)

(declare-fun e!862335 () ListLongMap!22199)

(declare-fun minValue!436 () V!59093)

(declare-fun +!4960 (ListLongMap!22199 tuple2!24582) ListLongMap!22199)

(assert (=> b!1548945 (= e!862335 (+!4960 call!69711 (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun call!69710 () ListLongMap!22199)

(declare-fun c!142630 () Bool)

(declare-fun zeroValue!436 () V!59093)

(declare-fun call!69714 () ListLongMap!22199)

(declare-fun bm!69708 () Bool)

(declare-fun call!69712 () ListLongMap!22199)

(declare-fun c!142629 () Bool)

(assert (=> bm!69708 (= call!69711 (+!4960 (ite c!142629 call!69714 (ite c!142630 call!69712 call!69710)) (ite (or c!142629 c!142630) (tuple2!24583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69709 () Bool)

(assert (=> bm!69709 (= call!69710 call!69712)))

(declare-fun b!1548946 () Bool)

(assert (=> b!1548946 (= e!862335 e!862334)))

(declare-fun lt!667491 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548946 (= c!142630 (and (not lt!667491) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548947 () Bool)

(declare-fun e!862331 () Bool)

(assert (=> b!1548947 (= e!862338 e!862331)))

(declare-fun res!1061138 () Bool)

(assert (=> b!1548947 (=> (not res!1061138) (not e!862331))))

(assert (=> b!1548947 (= res!1061138 (bvslt from!762 (size!50397 _keys!618)))))

(declare-fun lt!667493 () ListLongMap!22199)

(assert (=> b!1548947 (= lt!667493 e!862335)))

(assert (=> b!1548947 (= c!142629 (and (not lt!667491) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548947 (= lt!667491 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548948 () Bool)

(declare-fun res!1061137 () Bool)

(assert (=> b!1548948 (=> (not res!1061137) (not e!862331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548948 (= res!1061137 (validKeyInArray!0 (select (arr!49846 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58684 () Bool)

(declare-fun tp!111385 () Bool)

(assert (=> mapNonEmpty!58684 (= mapRes!58684 (and tp!111385 e!862330))))

(declare-fun mapRest!58684 () (Array (_ BitVec 32) ValueCell!18083))

(declare-fun mapValue!58684 () ValueCell!18083)

(declare-fun mapKey!58684 () (_ BitVec 32))

(assert (=> mapNonEmpty!58684 (= (arr!49847 _values!470) (store mapRest!58684 mapKey!58684 mapValue!58684))))

(declare-fun b!1548949 () Bool)

(declare-fun e!862332 () ListLongMap!22199)

(assert (=> b!1548949 (= e!862332 call!69710)))

(declare-fun bm!69710 () Bool)

(assert (=> bm!69710 (= call!69712 call!69714)))

(declare-fun b!1548950 () Bool)

(declare-fun res!1061133 () Bool)

(assert (=> b!1548950 (=> (not res!1061133) (not e!862338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103302 (_ BitVec 32)) Bool)

(assert (=> b!1548950 (= res!1061133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548951 () Bool)

(declare-fun c!142628 () Bool)

(assert (=> b!1548951 (= c!142628 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667491))))

(assert (=> b!1548951 (= e!862334 e!862332)))

(declare-fun b!1548952 () Bool)

(declare-fun e!862333 () Bool)

(assert (=> b!1548952 (= e!862336 (and e!862333 mapRes!58684))))

(declare-fun condMapEmpty!58684 () Bool)

(declare-fun mapDefault!58684 () ValueCell!18083)

(assert (=> b!1548952 (= condMapEmpty!58684 (= (arr!49847 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18083)) mapDefault!58684)))))

(declare-fun b!1548953 () Bool)

(declare-fun res!1061132 () Bool)

(assert (=> b!1548953 (=> (not res!1061132) (not e!862338))))

(assert (=> b!1548953 (= res!1061132 (and (= (size!50398 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50397 _keys!618) (size!50398 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548954 () Bool)

(assert (=> b!1548954 (= e!862332 call!69713)))

(declare-fun b!1548955 () Bool)

(assert (=> b!1548955 (= e!862331 (not true))))

(declare-fun lt!667494 () ListLongMap!22199)

(declare-fun lt!667492 () Bool)

(declare-fun contains!10097 (ListLongMap!22199 (_ BitVec 64)) Bool)

(assert (=> b!1548955 (= lt!667492 (contains!10097 lt!667494 (select (arr!49846 _keys!618) from!762)))))

(assert (=> b!1548955 (contains!10097 (+!4960 lt!667494 (tuple2!24583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49846 _keys!618) from!762))))

(declare-datatypes ((Unit!51463 0))(
  ( (Unit!51464) )
))
(declare-fun lt!667495 () Unit!51463)

(declare-fun addStillContains!1239 (ListLongMap!22199 (_ BitVec 64) V!59093 (_ BitVec 64)) Unit!51463)

(assert (=> b!1548955 (= lt!667495 (addStillContains!1239 lt!667494 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49846 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6595 (array!103302 array!103304 (_ BitVec 32) (_ BitVec 32) V!59093 V!59093 (_ BitVec 32) Int) ListLongMap!22199)

(assert (=> b!1548955 (= lt!667494 (getCurrentListMapNoExtraKeys!6595 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548956 () Bool)

(assert (=> b!1548956 (= e!862333 tp_is_empty!37987)))

(declare-fun bm!69711 () Bool)

(assert (=> bm!69711 (= call!69714 (getCurrentListMapNoExtraKeys!6595 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132410 res!1061135) b!1548953))

(assert (= (and b!1548953 res!1061132) b!1548950))

(assert (= (and b!1548950 res!1061133) b!1548943))

(assert (= (and b!1548943 res!1061134) b!1548942))

(assert (= (and b!1548942 res!1061136) b!1548947))

(assert (= (and b!1548947 c!142629) b!1548945))

(assert (= (and b!1548947 (not c!142629)) b!1548946))

(assert (= (and b!1548946 c!142630) b!1548944))

(assert (= (and b!1548946 (not c!142630)) b!1548951))

(assert (= (and b!1548951 c!142628) b!1548954))

(assert (= (and b!1548951 (not c!142628)) b!1548949))

(assert (= (or b!1548954 b!1548949) bm!69709))

(assert (= (or b!1548944 bm!69709) bm!69710))

(assert (= (or b!1548944 b!1548954) bm!69707))

(assert (= (or b!1548945 bm!69710) bm!69711))

(assert (= (or b!1548945 bm!69707) bm!69708))

(assert (= (and b!1548947 res!1061138) b!1548948))

(assert (= (and b!1548948 res!1061137) b!1548955))

(assert (= (and b!1548952 condMapEmpty!58684) mapIsEmpty!58684))

(assert (= (and b!1548952 (not condMapEmpty!58684)) mapNonEmpty!58684))

(get-info :version)

(assert (= (and mapNonEmpty!58684 ((_ is ValueCellFull!18083) mapValue!58684)) b!1548941))

(assert (= (and b!1548952 ((_ is ValueCellFull!18083) mapDefault!58684)) b!1548956))

(assert (= start!132410 b!1548952))

(declare-fun m!1428633 () Bool)

(assert (=> bm!69711 m!1428633))

(declare-fun m!1428635 () Bool)

(assert (=> b!1548950 m!1428635))

(declare-fun m!1428637 () Bool)

(assert (=> start!132410 m!1428637))

(declare-fun m!1428639 () Bool)

(assert (=> start!132410 m!1428639))

(declare-fun m!1428641 () Bool)

(assert (=> start!132410 m!1428641))

(declare-fun m!1428643 () Bool)

(assert (=> mapNonEmpty!58684 m!1428643))

(declare-fun m!1428645 () Bool)

(assert (=> bm!69708 m!1428645))

(declare-fun m!1428647 () Bool)

(assert (=> b!1548943 m!1428647))

(declare-fun m!1428649 () Bool)

(assert (=> b!1548948 m!1428649))

(assert (=> b!1548948 m!1428649))

(declare-fun m!1428651 () Bool)

(assert (=> b!1548948 m!1428651))

(declare-fun m!1428653 () Bool)

(assert (=> b!1548945 m!1428653))

(assert (=> b!1548955 m!1428649))

(declare-fun m!1428655 () Bool)

(assert (=> b!1548955 m!1428655))

(assert (=> b!1548955 m!1428633))

(assert (=> b!1548955 m!1428649))

(declare-fun m!1428657 () Bool)

(assert (=> b!1548955 m!1428657))

(assert (=> b!1548955 m!1428655))

(assert (=> b!1548955 m!1428649))

(declare-fun m!1428659 () Bool)

(assert (=> b!1548955 m!1428659))

(assert (=> b!1548955 m!1428649))

(declare-fun m!1428661 () Bool)

(assert (=> b!1548955 m!1428661))

(check-sat tp_is_empty!37987 (not bm!69708) (not b!1548950) (not mapNonEmpty!58684) (not b_next!31711) (not bm!69711) (not b!1548955) (not b!1548948) b_and!51123 (not start!132410) (not b!1548945) (not b!1548943))
(check-sat b_and!51123 (not b_next!31711))
