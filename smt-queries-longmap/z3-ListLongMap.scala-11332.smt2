; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132308 () Bool)

(assert start!132308)

(declare-fun b_free!31609 () Bool)

(declare-fun b_next!31609 () Bool)

(assert (=> start!132308 (= b_free!31609 (not b_next!31609))))

(declare-fun tp!111078 () Bool)

(declare-fun b_and!51021 () Bool)

(assert (=> start!132308 (= tp!111078 b_and!51021)))

(declare-fun b!1546615 () Bool)

(declare-fun c!142169 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667009 () Bool)

(assert (=> b!1546615 (= c!142169 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667009))))

(declare-datatypes ((V!58957 0))(
  ( (V!58958 (val!19020 Int)) )
))
(declare-datatypes ((tuple2!24486 0))(
  ( (tuple2!24487 (_1!12254 (_ BitVec 64)) (_2!12254 V!58957)) )
))
(declare-datatypes ((List!35982 0))(
  ( (Nil!35979) (Cons!35978 (h!37441 tuple2!24486) (t!50668 List!35982)) )
))
(declare-datatypes ((ListLongMap!22103 0))(
  ( (ListLongMap!22104 (toList!11067 List!35982)) )
))
(declare-fun e!861014 () ListLongMap!22103)

(declare-fun e!861015 () ListLongMap!22103)

(assert (=> b!1546615 (= e!861014 e!861015)))

(declare-fun bm!68942 () Bool)

(declare-fun call!68948 () ListLongMap!22103)

(declare-fun call!68946 () ListLongMap!22103)

(assert (=> bm!68942 (= call!68948 call!68946)))

(declare-fun b!1546616 () Bool)

(declare-fun e!861016 () Bool)

(declare-fun tp_is_empty!37885 () Bool)

(assert (=> b!1546616 (= e!861016 tp_is_empty!37885)))

(declare-fun bm!68943 () Bool)

(declare-fun call!68949 () ListLongMap!22103)

(assert (=> bm!68943 (= call!68949 call!68948)))

(declare-fun b!1546617 () Bool)

(declare-fun res!1060183 () Bool)

(declare-fun e!861021 () Bool)

(assert (=> b!1546617 (=> (not res!1060183) (not e!861021))))

(declare-datatypes ((array!103102 0))(
  ( (array!103103 (arr!49746 (Array (_ BitVec 32) (_ BitVec 64))) (size!50297 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103102)

(declare-datatypes ((List!35983 0))(
  ( (Nil!35980) (Cons!35979 (h!37442 (_ BitVec 64)) (t!50669 List!35983)) )
))
(declare-fun arrayNoDuplicates!0 (array!103102 (_ BitVec 32) List!35983) Bool)

(assert (=> b!1546617 (= res!1060183 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35980))))

(declare-fun mapNonEmpty!58531 () Bool)

(declare-fun mapRes!58531 () Bool)

(declare-fun tp!111079 () Bool)

(declare-fun e!861020 () Bool)

(assert (=> mapNonEmpty!58531 (= mapRes!58531 (and tp!111079 e!861020))))

(declare-datatypes ((ValueCell!18032 0))(
  ( (ValueCellFull!18032 (v!21813 V!58957)) (EmptyCell!18032) )
))
(declare-fun mapValue!58531 () ValueCell!18032)

(declare-fun mapKey!58531 () (_ BitVec 32))

(declare-fun mapRest!58531 () (Array (_ BitVec 32) ValueCell!18032))

(declare-datatypes ((array!103104 0))(
  ( (array!103105 (arr!49747 (Array (_ BitVec 32) ValueCell!18032)) (size!50298 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103104)

(assert (=> mapNonEmpty!58531 (= (arr!49747 _values!470) (store mapRest!58531 mapKey!58531 mapValue!58531))))

(declare-fun b!1546618 () Bool)

(declare-fun res!1060185 () Bool)

(assert (=> b!1546618 (=> (not res!1060185) (not e!861021))))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1546618 (= res!1060185 (and (= (size!50298 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50297 _keys!618) (size!50298 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546619 () Bool)

(assert (=> b!1546619 (= e!861020 tp_is_empty!37885)))

(declare-fun bm!68944 () Bool)

(declare-fun call!68947 () ListLongMap!22103)

(declare-fun call!68945 () ListLongMap!22103)

(assert (=> bm!68944 (= call!68947 call!68945)))

(declare-fun b!1546620 () Bool)

(assert (=> b!1546620 (= e!861014 call!68947)))

(declare-fun mapIsEmpty!58531 () Bool)

(assert (=> mapIsEmpty!58531 mapRes!58531))

(declare-fun res!1060184 () Bool)

(assert (=> start!132308 (=> (not res!1060184) (not e!861021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132308 (= res!1060184 (validMask!0 mask!926))))

(assert (=> start!132308 e!861021))

(declare-fun array_inv!38959 (array!103102) Bool)

(assert (=> start!132308 (array_inv!38959 _keys!618)))

(assert (=> start!132308 tp_is_empty!37885))

(assert (=> start!132308 true))

(assert (=> start!132308 tp!111078))

(declare-fun e!861017 () Bool)

(declare-fun array_inv!38960 (array!103104) Bool)

(assert (=> start!132308 (and (array_inv!38960 _values!470) e!861017)))

(declare-fun b!1546621 () Bool)

(declare-fun res!1060187 () Bool)

(assert (=> b!1546621 (=> (not res!1060187) (not e!861021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103102 (_ BitVec 32)) Bool)

(assert (=> b!1546621 (= res!1060187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546622 () Bool)

(assert (=> b!1546622 (= e!861017 (and e!861016 mapRes!58531))))

(declare-fun condMapEmpty!58531 () Bool)

(declare-fun mapDefault!58531 () ValueCell!18032)

(assert (=> b!1546622 (= condMapEmpty!58531 (= (arr!49747 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18032)) mapDefault!58531)))))

(declare-fun b!1546623 () Bool)

(declare-fun res!1060186 () Bool)

(assert (=> b!1546623 (=> (not res!1060186) (not e!861021))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1546623 (= res!1060186 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50297 _keys!618))))))

(declare-fun zeroValue!436 () V!58957)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!58957)

(declare-fun bm!68945 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6555 (array!103102 array!103104 (_ BitVec 32) (_ BitVec 32) V!58957 V!58957 (_ BitVec 32) Int) ListLongMap!22103)

(assert (=> bm!68945 (= call!68946 (getCurrentListMapNoExtraKeys!6555 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546624 () Bool)

(assert (=> b!1546624 (= e!861021 false)))

(declare-fun lt!667008 () ListLongMap!22103)

(declare-fun e!861018 () ListLongMap!22103)

(assert (=> b!1546624 (= lt!667008 e!861018)))

(declare-fun c!142171 () Bool)

(assert (=> b!1546624 (= c!142171 (and (not lt!667009) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546624 (= lt!667009 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546625 () Bool)

(assert (=> b!1546625 (= e!861018 e!861014)))

(declare-fun c!142170 () Bool)

(assert (=> b!1546625 (= c!142170 (and (not lt!667009) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546626 () Bool)

(assert (=> b!1546626 (= e!861015 call!68949)))

(declare-fun b!1546627 () Bool)

(assert (=> b!1546627 (= e!861015 call!68947)))

(declare-fun bm!68946 () Bool)

(declare-fun +!4914 (ListLongMap!22103 tuple2!24486) ListLongMap!22103)

(assert (=> bm!68946 (= call!68945 (+!4914 (ite c!142171 call!68946 (ite c!142170 call!68948 call!68949)) (ite (or c!142171 c!142170) (tuple2!24487 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546628 () Bool)

(assert (=> b!1546628 (= e!861018 (+!4914 call!68945 (tuple2!24487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!132308 res!1060184) b!1546618))

(assert (= (and b!1546618 res!1060185) b!1546621))

(assert (= (and b!1546621 res!1060187) b!1546617))

(assert (= (and b!1546617 res!1060183) b!1546623))

(assert (= (and b!1546623 res!1060186) b!1546624))

(assert (= (and b!1546624 c!142171) b!1546628))

(assert (= (and b!1546624 (not c!142171)) b!1546625))

(assert (= (and b!1546625 c!142170) b!1546620))

(assert (= (and b!1546625 (not c!142170)) b!1546615))

(assert (= (and b!1546615 c!142169) b!1546627))

(assert (= (and b!1546615 (not c!142169)) b!1546626))

(assert (= (or b!1546627 b!1546626) bm!68943))

(assert (= (or b!1546620 bm!68943) bm!68942))

(assert (= (or b!1546620 b!1546627) bm!68944))

(assert (= (or b!1546628 bm!68942) bm!68945))

(assert (= (or b!1546628 bm!68944) bm!68946))

(assert (= (and b!1546622 condMapEmpty!58531) mapIsEmpty!58531))

(assert (= (and b!1546622 (not condMapEmpty!58531)) mapNonEmpty!58531))

(get-info :version)

(assert (= (and mapNonEmpty!58531 ((_ is ValueCellFull!18032) mapValue!58531)) b!1546619))

(assert (= (and b!1546622 ((_ is ValueCellFull!18032) mapDefault!58531)) b!1546616))

(assert (= start!132308 b!1546622))

(declare-fun m!1427427 () Bool)

(assert (=> mapNonEmpty!58531 m!1427427))

(declare-fun m!1427429 () Bool)

(assert (=> b!1546628 m!1427429))

(declare-fun m!1427431 () Bool)

(assert (=> b!1546617 m!1427431))

(declare-fun m!1427433 () Bool)

(assert (=> bm!68945 m!1427433))

(declare-fun m!1427435 () Bool)

(assert (=> bm!68946 m!1427435))

(declare-fun m!1427437 () Bool)

(assert (=> b!1546621 m!1427437))

(declare-fun m!1427439 () Bool)

(assert (=> start!132308 m!1427439))

(declare-fun m!1427441 () Bool)

(assert (=> start!132308 m!1427441))

(declare-fun m!1427443 () Bool)

(assert (=> start!132308 m!1427443))

(check-sat (not b_next!31609) tp_is_empty!37885 (not bm!68946) (not start!132308) (not b!1546617) (not mapNonEmpty!58531) (not bm!68945) (not b!1546628) b_and!51021 (not b!1546621))
(check-sat b_and!51021 (not b_next!31609))
