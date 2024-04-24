; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132712 () Bool)

(assert start!132712)

(declare-fun b_free!31927 () Bool)

(declare-fun b_next!31927 () Bool)

(assert (=> start!132712 (= b_free!31927 (not b_next!31927))))

(declare-fun tp!112045 () Bool)

(declare-fun b_and!51367 () Bool)

(assert (=> start!132712 (= tp!112045 b_and!51367)))

(declare-fun b!1554723 () Bool)

(declare-fun res!1063639 () Bool)

(declare-fun e!865665 () Bool)

(assert (=> b!1554723 (=> (not res!1063639) (not e!865665))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103734 0))(
  ( (array!103735 (arr!50058 (Array (_ BitVec 32) (_ BitVec 64))) (size!50609 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103734)

(assert (=> b!1554723 (= res!1063639 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50609 _keys!618))))))

(declare-fun b!1554724 () Bool)

(declare-datatypes ((V!59381 0))(
  ( (V!59382 (val!19179 Int)) )
))
(declare-datatypes ((tuple2!24788 0))(
  ( (tuple2!24789 (_1!12405 (_ BitVec 64)) (_2!12405 V!59381)) )
))
(declare-datatypes ((List!36237 0))(
  ( (Nil!36234) (Cons!36233 (h!37696 tuple2!24788) (t!50943 List!36237)) )
))
(declare-datatypes ((ListLongMap!22405 0))(
  ( (ListLongMap!22406 (toList!11218 List!36237)) )
))
(declare-fun e!865667 () ListLongMap!22405)

(declare-fun call!71376 () ListLongMap!22405)

(assert (=> b!1554724 (= e!865667 call!71376)))

(declare-fun b!1554725 () Bool)

(declare-fun e!865663 () ListLongMap!22405)

(declare-fun call!71378 () ListLongMap!22405)

(declare-fun minValue!436 () V!59381)

(declare-fun +!5047 (ListLongMap!22405 tuple2!24788) ListLongMap!22405)

(assert (=> b!1554725 (= e!865663 (+!5047 call!71378 (tuple2!24789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1554726 () Bool)

(declare-fun e!865664 () Bool)

(declare-fun e!865671 () Bool)

(declare-fun mapRes!59020 () Bool)

(assert (=> b!1554726 (= e!865664 (and e!865671 mapRes!59020))))

(declare-fun condMapEmpty!59020 () Bool)

(declare-datatypes ((ValueCell!18191 0))(
  ( (ValueCellFull!18191 (v!21976 V!59381)) (EmptyCell!18191) )
))
(declare-datatypes ((array!103736 0))(
  ( (array!103737 (arr!50059 (Array (_ BitVec 32) ValueCell!18191)) (size!50610 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103736)

(declare-fun mapDefault!59020 () ValueCell!18191)

(assert (=> b!1554726 (= condMapEmpty!59020 (= (arr!50059 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18191)) mapDefault!59020)))))

(declare-fun mapNonEmpty!59020 () Bool)

(declare-fun tp!112044 () Bool)

(declare-fun e!865669 () Bool)

(assert (=> mapNonEmpty!59020 (= mapRes!59020 (and tp!112044 e!865669))))

(declare-fun mapKey!59020 () (_ BitVec 32))

(declare-fun mapRest!59020 () (Array (_ BitVec 32) ValueCell!18191))

(declare-fun mapValue!59020 () ValueCell!18191)

(assert (=> mapNonEmpty!59020 (= (arr!50059 _values!470) (store mapRest!59020 mapKey!59020 mapValue!59020))))

(declare-fun b!1554727 () Bool)

(declare-fun e!865662 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1554727 (= e!865662 (not (validKeyInArray!0 (select (arr!50058 _keys!618) from!762))))))

(declare-fun bm!71372 () Bool)

(declare-fun call!71377 () ListLongMap!22405)

(declare-fun call!71379 () ListLongMap!22405)

(declare-fun zeroValue!436 () V!59381)

(declare-fun call!71375 () ListLongMap!22405)

(declare-fun c!143755 () Bool)

(declare-fun c!143754 () Bool)

(assert (=> bm!71372 (= call!71378 (+!5047 (ite c!143754 call!71375 (ite c!143755 call!71377 call!71379)) (ite (or c!143754 c!143755) (tuple2!24789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1554728 () Bool)

(declare-fun tp_is_empty!38203 () Bool)

(assert (=> b!1554728 (= e!865669 tp_is_empty!38203)))

(declare-fun mapIsEmpty!59020 () Bool)

(assert (=> mapIsEmpty!59020 mapRes!59020))

(declare-fun b!1554729 () Bool)

(declare-fun e!865668 () ListLongMap!22405)

(assert (=> b!1554729 (= e!865668 call!71379)))

(declare-fun b!1554730 () Bool)

(declare-fun e!865666 () Bool)

(assert (=> b!1554730 (= e!865666 (bvsge from!762 (size!50610 _values!470)))))

(declare-fun b!1554731 () Bool)

(assert (=> b!1554731 (= e!865671 tp_is_empty!38203)))

(declare-fun bm!71373 () Bool)

(assert (=> bm!71373 (= call!71376 call!71378)))

(declare-fun res!1063637 () Bool)

(assert (=> start!132712 (=> (not res!1063637) (not e!865665))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132712 (= res!1063637 (validMask!0 mask!926))))

(assert (=> start!132712 e!865665))

(declare-fun array_inv!39175 (array!103734) Bool)

(assert (=> start!132712 (array_inv!39175 _keys!618)))

(assert (=> start!132712 tp_is_empty!38203))

(assert (=> start!132712 true))

(assert (=> start!132712 tp!112045))

(declare-fun array_inv!39176 (array!103736) Bool)

(assert (=> start!132712 (and (array_inv!39176 _values!470) e!865664)))

(declare-fun b!1554732 () Bool)

(declare-datatypes ((Unit!51613 0))(
  ( (Unit!51614) )
))
(declare-fun e!865672 () Unit!51613)

(declare-fun lt!670105 () Unit!51613)

(assert (=> b!1554732 (= e!865672 lt!670105)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun lt!670111 () ListLongMap!22405)

(declare-fun getCurrentListMapNoExtraKeys!6679 (array!103734 array!103736 (_ BitVec 32) (_ BitVec 32) V!59381 V!59381 (_ BitVec 32) Int) ListLongMap!22405)

(assert (=> b!1554732 (= lt!670111 (getCurrentListMapNoExtraKeys!6679 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!670108 () Unit!51613)

(declare-fun addStillContains!1303 (ListLongMap!22405 (_ BitVec 64) V!59381 (_ BitVec 64)) Unit!51613)

(assert (=> b!1554732 (= lt!670108 (addStillContains!1303 lt!670111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50058 _keys!618) from!762)))))

(declare-fun lt!670113 () ListLongMap!22405)

(assert (=> b!1554732 (= lt!670113 (+!5047 lt!670111 (tuple2!24789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10172 (ListLongMap!22405 (_ BitVec 64)) Bool)

(assert (=> b!1554732 (contains!10172 lt!670113 (select (arr!50058 _keys!618) from!762))))

(declare-fun addApplyDifferent!638 (ListLongMap!22405 (_ BitVec 64) V!59381 (_ BitVec 64)) Unit!51613)

(assert (=> b!1554732 (= lt!670105 (addApplyDifferent!638 lt!670111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50058 _keys!618) from!762)))))

(declare-fun lt!670112 () V!59381)

(declare-fun apply!1111 (ListLongMap!22405 (_ BitVec 64)) V!59381)

(assert (=> b!1554732 (= lt!670112 (apply!1111 (+!5047 lt!670111 (tuple2!24789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50058 _keys!618) from!762)))))

(declare-fun lt!670110 () V!59381)

(assert (=> b!1554732 (= lt!670110 (apply!1111 lt!670111 (select (arr!50058 _keys!618) from!762)))))

(assert (=> b!1554732 (= lt!670112 lt!670110)))

(declare-fun lt!670114 () Unit!51613)

(assert (=> b!1554732 (= lt!670114 (addApplyDifferent!638 lt!670111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50058 _keys!618) from!762)))))

(assert (=> b!1554732 (= (apply!1111 lt!670113 (select (arr!50058 _keys!618) from!762)) lt!670110)))

(declare-fun bm!71374 () Bool)

(assert (=> bm!71374 (= call!71377 call!71375)))

(declare-fun b!1554733 () Bool)

(declare-fun c!143753 () Bool)

(declare-fun lt!670115 () Bool)

(assert (=> b!1554733 (= c!143753 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!670115))))

(assert (=> b!1554733 (= e!865667 e!865668)))

(declare-fun b!1554734 () Bool)

(declare-fun res!1063638 () Bool)

(assert (=> b!1554734 (=> (not res!1063638) (not e!865665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103734 (_ BitVec 32)) Bool)

(assert (=> b!1554734 (= res!1063638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!71375 () Bool)

(assert (=> bm!71375 (= call!71375 (getCurrentListMapNoExtraKeys!6679 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1554735 () Bool)

(assert (=> b!1554735 (= e!865668 call!71376)))

(declare-fun b!1554736 () Bool)

(declare-fun Unit!51615 () Unit!51613)

(assert (=> b!1554736 (= e!865672 Unit!51615)))

(declare-fun b!1554737 () Bool)

(declare-fun res!1063640 () Bool)

(assert (=> b!1554737 (=> (not res!1063640) (not e!865666))))

(declare-fun lt!670107 () ListLongMap!22405)

(assert (=> b!1554737 (= res!1063640 (contains!10172 lt!670107 (select (arr!50058 _keys!618) from!762)))))

(declare-fun b!1554738 () Bool)

(assert (=> b!1554738 (= e!865665 e!865666)))

(declare-fun res!1063642 () Bool)

(assert (=> b!1554738 (=> (not res!1063642) (not e!865666))))

(declare-fun lt!670109 () Bool)

(assert (=> b!1554738 (= res!1063642 (not lt!670109))))

(declare-fun lt!670106 () Unit!51613)

(assert (=> b!1554738 (= lt!670106 e!865672)))

(declare-fun c!143752 () Bool)

(assert (=> b!1554738 (= c!143752 (not lt!670109))))

(assert (=> b!1554738 (= lt!670109 e!865662)))

(declare-fun res!1063643 () Bool)

(assert (=> b!1554738 (=> res!1063643 e!865662)))

(assert (=> b!1554738 (= res!1063643 (bvsge from!762 (size!50609 _keys!618)))))

(assert (=> b!1554738 (= lt!670107 e!865663)))

(assert (=> b!1554738 (= c!143754 (and (not lt!670115) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1554738 (= lt!670115 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1554739 () Bool)

(declare-fun res!1063641 () Bool)

(assert (=> b!1554739 (=> (not res!1063641) (not e!865665))))

(declare-datatypes ((List!36238 0))(
  ( (Nil!36235) (Cons!36234 (h!37697 (_ BitVec 64)) (t!50944 List!36238)) )
))
(declare-fun arrayNoDuplicates!0 (array!103734 (_ BitVec 32) List!36238) Bool)

(assert (=> b!1554739 (= res!1063641 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36235))))

(declare-fun bm!71376 () Bool)

(assert (=> bm!71376 (= call!71379 call!71377)))

(declare-fun b!1554740 () Bool)

(declare-fun res!1063644 () Bool)

(assert (=> b!1554740 (=> (not res!1063644) (not e!865665))))

(assert (=> b!1554740 (= res!1063644 (and (= (size!50610 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50609 _keys!618) (size!50610 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1554741 () Bool)

(assert (=> b!1554741 (= e!865663 e!865667)))

(assert (=> b!1554741 (= c!143755 (and (not lt!670115) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!132712 res!1063637) b!1554740))

(assert (= (and b!1554740 res!1063644) b!1554734))

(assert (= (and b!1554734 res!1063638) b!1554739))

(assert (= (and b!1554739 res!1063641) b!1554723))

(assert (= (and b!1554723 res!1063639) b!1554738))

(assert (= (and b!1554738 c!143754) b!1554725))

(assert (= (and b!1554738 (not c!143754)) b!1554741))

(assert (= (and b!1554741 c!143755) b!1554724))

(assert (= (and b!1554741 (not c!143755)) b!1554733))

(assert (= (and b!1554733 c!143753) b!1554735))

(assert (= (and b!1554733 (not c!143753)) b!1554729))

(assert (= (or b!1554735 b!1554729) bm!71376))

(assert (= (or b!1554724 bm!71376) bm!71374))

(assert (= (or b!1554724 b!1554735) bm!71373))

(assert (= (or b!1554725 bm!71374) bm!71375))

(assert (= (or b!1554725 bm!71373) bm!71372))

(assert (= (and b!1554738 (not res!1063643)) b!1554727))

(assert (= (and b!1554738 c!143752) b!1554732))

(assert (= (and b!1554738 (not c!143752)) b!1554736))

(assert (= (and b!1554738 res!1063642) b!1554737))

(assert (= (and b!1554737 res!1063640) b!1554730))

(assert (= (and b!1554726 condMapEmpty!59020) mapIsEmpty!59020))

(assert (= (and b!1554726 (not condMapEmpty!59020)) mapNonEmpty!59020))

(get-info :version)

(assert (= (and mapNonEmpty!59020 ((_ is ValueCellFull!18191) mapValue!59020)) b!1554728))

(assert (= (and b!1554726 ((_ is ValueCellFull!18191) mapDefault!59020)) b!1554731))

(assert (= start!132712 b!1554726))

(declare-fun m!1433083 () Bool)

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433085 () Bool)

(assert (=> b!1554732 m!1433085))

(declare-fun m!1433087 () Bool)

(assert (=> b!1554732 m!1433087))

(assert (=> b!1554732 m!1433083))

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433089 () Bool)

(assert (=> b!1554732 m!1433089))

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433091 () Bool)

(assert (=> b!1554732 m!1433091))

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433093 () Bool)

(assert (=> b!1554732 m!1433093))

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433095 () Bool)

(assert (=> b!1554732 m!1433095))

(declare-fun m!1433097 () Bool)

(assert (=> b!1554732 m!1433097))

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433099 () Bool)

(assert (=> b!1554732 m!1433099))

(declare-fun m!1433101 () Bool)

(assert (=> b!1554732 m!1433101))

(assert (=> b!1554732 m!1433083))

(declare-fun m!1433103 () Bool)

(assert (=> b!1554732 m!1433103))

(assert (=> b!1554732 m!1433101))

(declare-fun m!1433105 () Bool)

(assert (=> b!1554725 m!1433105))

(declare-fun m!1433107 () Bool)

(assert (=> mapNonEmpty!59020 m!1433107))

(assert (=> b!1554737 m!1433083))

(assert (=> b!1554737 m!1433083))

(declare-fun m!1433109 () Bool)

(assert (=> b!1554737 m!1433109))

(declare-fun m!1433111 () Bool)

(assert (=> start!132712 m!1433111))

(declare-fun m!1433113 () Bool)

(assert (=> start!132712 m!1433113))

(declare-fun m!1433115 () Bool)

(assert (=> start!132712 m!1433115))

(assert (=> bm!71375 m!1433087))

(declare-fun m!1433117 () Bool)

(assert (=> b!1554739 m!1433117))

(declare-fun m!1433119 () Bool)

(assert (=> bm!71372 m!1433119))

(declare-fun m!1433121 () Bool)

(assert (=> b!1554734 m!1433121))

(assert (=> b!1554727 m!1433083))

(assert (=> b!1554727 m!1433083))

(declare-fun m!1433123 () Bool)

(assert (=> b!1554727 m!1433123))

(check-sat (not b!1554732) (not b!1554725) (not b!1554739) (not b!1554727) (not b!1554737) b_and!51367 tp_is_empty!38203 (not b!1554734) (not bm!71375) (not start!132712) (not bm!71372) (not mapNonEmpty!59020) (not b_next!31927))
(check-sat b_and!51367 (not b_next!31927))
