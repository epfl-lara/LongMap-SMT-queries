; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132144 () Bool)

(assert start!132144)

(declare-fun b_free!31857 () Bool)

(declare-fun b_next!31857 () Bool)

(assert (=> start!132144 (= b_free!31857 (not b_next!31857))))

(declare-fun tp!111822 () Bool)

(declare-fun b_and!51279 () Bool)

(assert (=> start!132144 (= tp!111822 b_and!51279)))

(declare-fun b!1550155 () Bool)

(declare-fun res!1061867 () Bool)

(declare-fun e!862902 () Bool)

(assert (=> b!1550155 (=> (not res!1061867) (not e!862902))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103462 0))(
  ( (array!103463 (arr!49933 (Array (_ BitVec 32) (_ BitVec 64))) (size!50483 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103462)

(assert (=> b!1550155 (= res!1061867 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50483 _keys!618))))))

(declare-fun b!1550156 () Bool)

(declare-fun e!862896 () Bool)

(declare-fun tp_is_empty!38133 () Bool)

(assert (=> b!1550156 (= e!862896 tp_is_empty!38133)))

(declare-fun mapNonEmpty!58903 () Bool)

(declare-fun mapRes!58903 () Bool)

(declare-fun tp!111823 () Bool)

(declare-fun e!862895 () Bool)

(assert (=> mapNonEmpty!58903 (= mapRes!58903 (and tp!111823 e!862895))))

(declare-datatypes ((V!59287 0))(
  ( (V!59288 (val!19144 Int)) )
))
(declare-datatypes ((ValueCell!18156 0))(
  ( (ValueCellFull!18156 (v!21945 V!59287)) (EmptyCell!18156) )
))
(declare-fun mapValue!58903 () ValueCell!18156)

(declare-fun mapRest!58903 () (Array (_ BitVec 32) ValueCell!18156))

(declare-fun mapKey!58903 () (_ BitVec 32))

(declare-datatypes ((array!103464 0))(
  ( (array!103465 (arr!49934 (Array (_ BitVec 32) ValueCell!18156)) (size!50484 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103464)

(assert (=> mapNonEmpty!58903 (= (arr!49934 _values!470) (store mapRest!58903 mapKey!58903 mapValue!58903))))

(declare-fun mapIsEmpty!58903 () Bool)

(assert (=> mapIsEmpty!58903 mapRes!58903))

(declare-fun b!1550157 () Bool)

(declare-datatypes ((tuple2!24666 0))(
  ( (tuple2!24667 (_1!12344 (_ BitVec 64)) (_2!12344 V!59287)) )
))
(declare-datatypes ((List!36149 0))(
  ( (Nil!36146) (Cons!36145 (h!37590 tuple2!24666) (t!50855 List!36149)) )
))
(declare-datatypes ((ListLongMap!22275 0))(
  ( (ListLongMap!22276 (toList!11153 List!36149)) )
))
(declare-fun e!862898 () ListLongMap!22275)

(declare-fun call!70668 () ListLongMap!22275)

(assert (=> b!1550157 (= e!862898 call!70668)))

(declare-fun b!1550158 () Bool)

(declare-fun res!1061869 () Bool)

(assert (=> b!1550158 (=> (not res!1061869) (not e!862902))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1550158 (= res!1061869 (and (= (size!50484 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50483 _keys!618) (size!50484 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550159 () Bool)

(declare-fun e!862899 () ListLongMap!22275)

(assert (=> b!1550159 (= e!862899 call!70668)))

(declare-fun zeroValue!436 () V!59287)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!70667 () ListLongMap!22275)

(declare-fun minValue!436 () V!59287)

(declare-fun bm!70661 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6603 (array!103462 array!103464 (_ BitVec 32) (_ BitVec 32) V!59287 V!59287 (_ BitVec 32) Int) ListLongMap!22275)

(assert (=> bm!70661 (= call!70667 (getCurrentListMapNoExtraKeys!6603 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550160 () Bool)

(declare-fun c!142521 () Bool)

(declare-fun lt!668231 () Bool)

(assert (=> b!1550160 (= c!142521 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668231))))

(assert (=> b!1550160 (= e!862898 e!862899)))

(declare-fun bm!70662 () Bool)

(declare-fun call!70666 () ListLongMap!22275)

(assert (=> bm!70662 (= call!70666 call!70667)))

(declare-fun b!1550161 () Bool)

(assert (=> b!1550161 (= e!862895 tp_is_empty!38133)))

(declare-fun b!1550162 () Bool)

(assert (=> b!1550162 (= e!862902 false)))

(declare-fun lt!668230 () ListLongMap!22275)

(declare-fun e!862901 () ListLongMap!22275)

(assert (=> b!1550162 (= lt!668230 e!862901)))

(declare-fun c!142523 () Bool)

(assert (=> b!1550162 (= c!142523 (and (not lt!668231) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550162 (= lt!668231 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70663 () Bool)

(declare-fun call!70665 () ListLongMap!22275)

(assert (=> bm!70663 (= call!70668 call!70665)))

(declare-fun b!1550163 () Bool)

(declare-fun e!862897 () Bool)

(assert (=> b!1550163 (= e!862897 (and e!862896 mapRes!58903))))

(declare-fun condMapEmpty!58903 () Bool)

(declare-fun mapDefault!58903 () ValueCell!18156)

(assert (=> b!1550163 (= condMapEmpty!58903 (= (arr!49934 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18156)) mapDefault!58903)))))

(declare-fun res!1061871 () Bool)

(assert (=> start!132144 (=> (not res!1061871) (not e!862902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132144 (= res!1061871 (validMask!0 mask!926))))

(assert (=> start!132144 e!862902))

(declare-fun array_inv!38821 (array!103462) Bool)

(assert (=> start!132144 (array_inv!38821 _keys!618)))

(assert (=> start!132144 tp_is_empty!38133))

(assert (=> start!132144 true))

(assert (=> start!132144 tp!111822))

(declare-fun array_inv!38822 (array!103464) Bool)

(assert (=> start!132144 (and (array_inv!38822 _values!470) e!862897)))

(declare-fun bm!70664 () Bool)

(declare-fun call!70664 () ListLongMap!22275)

(declare-fun c!142522 () Bool)

(declare-fun +!4978 (ListLongMap!22275 tuple2!24666) ListLongMap!22275)

(assert (=> bm!70664 (= call!70665 (+!4978 (ite c!142523 call!70667 (ite c!142522 call!70666 call!70664)) (ite (or c!142523 c!142522) (tuple2!24667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550164 () Bool)

(assert (=> b!1550164 (= e!862899 call!70664)))

(declare-fun b!1550165 () Bool)

(declare-fun res!1061870 () Bool)

(assert (=> b!1550165 (=> (not res!1061870) (not e!862902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103462 (_ BitVec 32)) Bool)

(assert (=> b!1550165 (= res!1061870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550166 () Bool)

(assert (=> b!1550166 (= e!862901 (+!4978 call!70665 (tuple2!24667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550167 () Bool)

(declare-fun res!1061868 () Bool)

(assert (=> b!1550167 (=> (not res!1061868) (not e!862902))))

(declare-datatypes ((List!36150 0))(
  ( (Nil!36147) (Cons!36146 (h!37591 (_ BitVec 64)) (t!50856 List!36150)) )
))
(declare-fun arrayNoDuplicates!0 (array!103462 (_ BitVec 32) List!36150) Bool)

(assert (=> b!1550167 (= res!1061868 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36147))))

(declare-fun b!1550168 () Bool)

(assert (=> b!1550168 (= e!862901 e!862898)))

(assert (=> b!1550168 (= c!142522 (and (not lt!668231) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!70665 () Bool)

(assert (=> bm!70665 (= call!70664 call!70666)))

(assert (= (and start!132144 res!1061871) b!1550158))

(assert (= (and b!1550158 res!1061869) b!1550165))

(assert (= (and b!1550165 res!1061870) b!1550167))

(assert (= (and b!1550167 res!1061868) b!1550155))

(assert (= (and b!1550155 res!1061867) b!1550162))

(assert (= (and b!1550162 c!142523) b!1550166))

(assert (= (and b!1550162 (not c!142523)) b!1550168))

(assert (= (and b!1550168 c!142522) b!1550157))

(assert (= (and b!1550168 (not c!142522)) b!1550160))

(assert (= (and b!1550160 c!142521) b!1550159))

(assert (= (and b!1550160 (not c!142521)) b!1550164))

(assert (= (or b!1550159 b!1550164) bm!70665))

(assert (= (or b!1550157 bm!70665) bm!70662))

(assert (= (or b!1550157 b!1550159) bm!70663))

(assert (= (or b!1550166 bm!70662) bm!70661))

(assert (= (or b!1550166 bm!70663) bm!70664))

(assert (= (and b!1550163 condMapEmpty!58903) mapIsEmpty!58903))

(assert (= (and b!1550163 (not condMapEmpty!58903)) mapNonEmpty!58903))

(get-info :version)

(assert (= (and mapNonEmpty!58903 ((_ is ValueCellFull!18156) mapValue!58903)) b!1550161))

(assert (= (and b!1550163 ((_ is ValueCellFull!18156) mapDefault!58903)) b!1550156))

(assert (= start!132144 b!1550163))

(declare-fun m!1429225 () Bool)

(assert (=> start!132144 m!1429225))

(declare-fun m!1429227 () Bool)

(assert (=> start!132144 m!1429227))

(declare-fun m!1429229 () Bool)

(assert (=> start!132144 m!1429229))

(declare-fun m!1429231 () Bool)

(assert (=> b!1550167 m!1429231))

(declare-fun m!1429233 () Bool)

(assert (=> bm!70661 m!1429233))

(declare-fun m!1429235 () Bool)

(assert (=> mapNonEmpty!58903 m!1429235))

(declare-fun m!1429237 () Bool)

(assert (=> bm!70664 m!1429237))

(declare-fun m!1429239 () Bool)

(assert (=> b!1550166 m!1429239))

(declare-fun m!1429241 () Bool)

(assert (=> b!1550165 m!1429241))

(check-sat (not bm!70664) tp_is_empty!38133 (not bm!70661) (not b!1550166) (not mapNonEmpty!58903) (not start!132144) (not b_next!31857) (not b!1550167) (not b!1550165) b_and!51279)
(check-sat b_and!51279 (not b_next!31857))
