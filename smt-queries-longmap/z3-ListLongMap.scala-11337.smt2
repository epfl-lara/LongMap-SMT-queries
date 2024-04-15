; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131876 () Bool)

(assert start!131876)

(declare-fun b_free!31639 () Bool)

(declare-fun b_next!31639 () Bool)

(assert (=> start!131876 (= b_free!31639 (not b_next!31639))))

(declare-fun tp!111169 () Bool)

(declare-fun b_and!51031 () Bool)

(assert (=> start!131876 (= tp!111169 b_and!51031)))

(declare-fun b!1544496 () Bool)

(declare-fun c!141416 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!665904 () Bool)

(assert (=> b!1544496 (= c!141416 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665904))))

(declare-datatypes ((V!58997 0))(
  ( (V!58998 (val!19035 Int)) )
))
(declare-datatypes ((tuple2!24530 0))(
  ( (tuple2!24531 (_1!12276 (_ BitVec 64)) (_2!12276 V!58997)) )
))
(declare-datatypes ((List!36014 0))(
  ( (Nil!36011) (Cons!36010 (h!37456 tuple2!24530) (t!50700 List!36014)) )
))
(declare-datatypes ((ListLongMap!22139 0))(
  ( (ListLongMap!22140 (toList!11085 List!36014)) )
))
(declare-fun e!859674 () ListLongMap!22139)

(declare-fun e!859672 () ListLongMap!22139)

(assert (=> b!1544496 (= e!859674 e!859672)))

(declare-fun b!1544497 () Bool)

(declare-fun e!859668 () Bool)

(declare-fun tp_is_empty!37915 () Bool)

(assert (=> b!1544497 (= e!859668 tp_is_empty!37915)))

(declare-datatypes ((array!102970 0))(
  ( (array!102971 (arr!49688 (Array (_ BitVec 32) (_ BitVec 64))) (size!50240 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102970)

(declare-fun zeroValue!436 () V!58997)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18047 0))(
  ( (ValueCellFull!18047 (v!21832 V!58997)) (EmptyCell!18047) )
))
(declare-datatypes ((array!102972 0))(
  ( (array!102973 (arr!49689 (Array (_ BitVec 32) ValueCell!18047)) (size!50241 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102972)

(declare-fun minValue!436 () V!58997)

(declare-fun bm!68982 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun call!68985 () ListLongMap!22139)

(declare-fun getCurrentListMapNoExtraKeys!6548 (array!102970 array!102972 (_ BitVec 32) (_ BitVec 32) V!58997 V!58997 (_ BitVec 32) Int) ListLongMap!22139)

(assert (=> bm!68982 (= call!68985 (getCurrentListMapNoExtraKeys!6548 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544498 () Bool)

(declare-fun res!1059423 () Bool)

(declare-fun e!859673 () Bool)

(assert (=> b!1544498 (=> (not res!1059423) (not e!859673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102970 (_ BitVec 32)) Bool)

(assert (=> b!1544498 (= res!1059423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58576 () Bool)

(declare-fun mapRes!58576 () Bool)

(assert (=> mapIsEmpty!58576 mapRes!58576))

(declare-fun b!1544499 () Bool)

(assert (=> b!1544499 (= e!859673 false)))

(declare-fun lt!665905 () ListLongMap!22139)

(declare-fun e!859671 () ListLongMap!22139)

(assert (=> b!1544499 (= lt!665905 e!859671)))

(declare-fun c!141415 () Bool)

(assert (=> b!1544499 (= c!141415 (and (not lt!665904) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544499 (= lt!665904 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!68983 () Bool)

(declare-fun call!68987 () ListLongMap!22139)

(declare-fun call!68988 () ListLongMap!22139)

(assert (=> bm!68983 (= call!68987 call!68988)))

(declare-fun b!1544500 () Bool)

(assert (=> b!1544500 (= e!859674 call!68987)))

(declare-fun bm!68984 () Bool)

(declare-fun call!68986 () ListLongMap!22139)

(declare-fun call!68989 () ListLongMap!22139)

(assert (=> bm!68984 (= call!68986 call!68989)))

(declare-fun b!1544501 () Bool)

(declare-fun e!859670 () Bool)

(assert (=> b!1544501 (= e!859670 tp_is_empty!37915)))

(declare-fun b!1544502 () Bool)

(assert (=> b!1544502 (= e!859672 call!68986)))

(declare-fun b!1544503 () Bool)

(declare-fun res!1059419 () Bool)

(assert (=> b!1544503 (=> (not res!1059419) (not e!859673))))

(declare-datatypes ((List!36015 0))(
  ( (Nil!36012) (Cons!36011 (h!37457 (_ BitVec 64)) (t!50701 List!36015)) )
))
(declare-fun arrayNoDuplicates!0 (array!102970 (_ BitVec 32) List!36015) Bool)

(assert (=> b!1544503 (= res!1059419 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36012))))

(declare-fun res!1059420 () Bool)

(assert (=> start!131876 (=> (not res!1059420) (not e!859673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131876 (= res!1059420 (validMask!0 mask!926))))

(assert (=> start!131876 e!859673))

(declare-fun array_inv!38847 (array!102970) Bool)

(assert (=> start!131876 (array_inv!38847 _keys!618)))

(assert (=> start!131876 tp_is_empty!37915))

(assert (=> start!131876 true))

(assert (=> start!131876 tp!111169))

(declare-fun e!859669 () Bool)

(declare-fun array_inv!38848 (array!102972) Bool)

(assert (=> start!131876 (and (array_inv!38848 _values!470) e!859669)))

(declare-fun b!1544504 () Bool)

(assert (=> b!1544504 (= e!859669 (and e!859668 mapRes!58576))))

(declare-fun condMapEmpty!58576 () Bool)

(declare-fun mapDefault!58576 () ValueCell!18047)

(assert (=> b!1544504 (= condMapEmpty!58576 (= (arr!49689 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18047)) mapDefault!58576)))))

(declare-fun b!1544505 () Bool)

(declare-fun res!1059422 () Bool)

(assert (=> b!1544505 (=> (not res!1059422) (not e!859673))))

(assert (=> b!1544505 (= res!1059422 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50240 _keys!618))))))

(declare-fun bm!68985 () Bool)

(assert (=> bm!68985 (= call!68989 call!68985)))

(declare-fun mapNonEmpty!58576 () Bool)

(declare-fun tp!111170 () Bool)

(assert (=> mapNonEmpty!58576 (= mapRes!58576 (and tp!111170 e!859670))))

(declare-fun mapKey!58576 () (_ BitVec 32))

(declare-fun mapValue!58576 () ValueCell!18047)

(declare-fun mapRest!58576 () (Array (_ BitVec 32) ValueCell!18047))

(assert (=> mapNonEmpty!58576 (= (arr!49689 _values!470) (store mapRest!58576 mapKey!58576 mapValue!58576))))

(declare-fun b!1544506 () Bool)

(declare-fun +!4918 (ListLongMap!22139 tuple2!24530) ListLongMap!22139)

(assert (=> b!1544506 (= e!859671 (+!4918 call!68988 (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544507 () Bool)

(assert (=> b!1544507 (= e!859671 e!859674)))

(declare-fun c!141417 () Bool)

(assert (=> b!1544507 (= c!141417 (and (not lt!665904) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1544508 () Bool)

(assert (=> b!1544508 (= e!859672 call!68987)))

(declare-fun b!1544509 () Bool)

(declare-fun res!1059421 () Bool)

(assert (=> b!1544509 (=> (not res!1059421) (not e!859673))))

(assert (=> b!1544509 (= res!1059421 (and (= (size!50241 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50240 _keys!618) (size!50241 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!68986 () Bool)

(assert (=> bm!68986 (= call!68988 (+!4918 (ite c!141415 call!68985 (ite c!141417 call!68989 call!68986)) (ite (or c!141415 c!141417) (tuple2!24531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!131876 res!1059420) b!1544509))

(assert (= (and b!1544509 res!1059421) b!1544498))

(assert (= (and b!1544498 res!1059423) b!1544503))

(assert (= (and b!1544503 res!1059419) b!1544505))

(assert (= (and b!1544505 res!1059422) b!1544499))

(assert (= (and b!1544499 c!141415) b!1544506))

(assert (= (and b!1544499 (not c!141415)) b!1544507))

(assert (= (and b!1544507 c!141417) b!1544500))

(assert (= (and b!1544507 (not c!141417)) b!1544496))

(assert (= (and b!1544496 c!141416) b!1544508))

(assert (= (and b!1544496 (not c!141416)) b!1544502))

(assert (= (or b!1544508 b!1544502) bm!68984))

(assert (= (or b!1544500 bm!68984) bm!68985))

(assert (= (or b!1544500 b!1544508) bm!68983))

(assert (= (or b!1544506 bm!68985) bm!68982))

(assert (= (or b!1544506 bm!68983) bm!68986))

(assert (= (and b!1544504 condMapEmpty!58576) mapIsEmpty!58576))

(assert (= (and b!1544504 (not condMapEmpty!58576)) mapNonEmpty!58576))

(get-info :version)

(assert (= (and mapNonEmpty!58576 ((_ is ValueCellFull!18047) mapValue!58576)) b!1544501))

(assert (= (and b!1544504 ((_ is ValueCellFull!18047) mapDefault!58576)) b!1544497))

(assert (= start!131876 b!1544504))

(declare-fun m!1424547 () Bool)

(assert (=> b!1544506 m!1424547))

(declare-fun m!1424549 () Bool)

(assert (=> bm!68982 m!1424549))

(declare-fun m!1424551 () Bool)

(assert (=> mapNonEmpty!58576 m!1424551))

(declare-fun m!1424553 () Bool)

(assert (=> b!1544503 m!1424553))

(declare-fun m!1424555 () Bool)

(assert (=> bm!68986 m!1424555))

(declare-fun m!1424557 () Bool)

(assert (=> start!131876 m!1424557))

(declare-fun m!1424559 () Bool)

(assert (=> start!131876 m!1424559))

(declare-fun m!1424561 () Bool)

(assert (=> start!131876 m!1424561))

(declare-fun m!1424563 () Bool)

(assert (=> b!1544498 m!1424563))

(check-sat (not b_next!31639) (not b!1544506) b_and!51031 (not mapNonEmpty!58576) (not bm!68982) tp_is_empty!37915 (not b!1544503) (not start!131876) (not b!1544498) (not bm!68986))
(check-sat b_and!51031 (not b_next!31639))
