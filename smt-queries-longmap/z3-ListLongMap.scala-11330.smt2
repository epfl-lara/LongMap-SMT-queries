; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131886 () Bool)

(assert start!131886)

(declare-fun b_free!31599 () Bool)

(declare-fun b_next!31599 () Bool)

(assert (=> start!131886 (= b_free!31599 (not b_next!31599))))

(declare-fun tp!111049 () Bool)

(declare-fun b_and!51009 () Bool)

(assert (=> start!131886 (= tp!111049 b_and!51009)))

(declare-fun b!1543969 () Bool)

(declare-fun e!859392 () Bool)

(declare-fun e!859389 () Bool)

(declare-fun mapRes!58516 () Bool)

(assert (=> b!1543969 (= e!859392 (and e!859389 mapRes!58516))))

(declare-fun condMapEmpty!58516 () Bool)

(declare-datatypes ((V!58943 0))(
  ( (V!58944 (val!19015 Int)) )
))
(declare-datatypes ((ValueCell!18027 0))(
  ( (ValueCellFull!18027 (v!21816 V!58943)) (EmptyCell!18027) )
))
(declare-datatypes ((array!102964 0))(
  ( (array!102965 (arr!49684 (Array (_ BitVec 32) ValueCell!18027)) (size!50234 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102964)

(declare-fun mapDefault!58516 () ValueCell!18027)

(assert (=> b!1543969 (= condMapEmpty!58516 (= (arr!49684 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18027)) mapDefault!58516)))))

(declare-fun zeroValue!436 () V!58943)

(declare-fun bm!68717 () Bool)

(declare-datatypes ((tuple2!24420 0))(
  ( (tuple2!24421 (_1!12221 (_ BitVec 64)) (_2!12221 V!58943)) )
))
(declare-datatypes ((List!35937 0))(
  ( (Nil!35934) (Cons!35933 (h!37378 tuple2!24420) (t!50631 List!35937)) )
))
(declare-datatypes ((ListLongMap!22029 0))(
  ( (ListLongMap!22030 (toList!11030 List!35937)) )
))
(declare-fun call!68721 () ListLongMap!22029)

(declare-fun call!68723 () ListLongMap!22029)

(declare-fun minValue!436 () V!58943)

(declare-fun call!68722 () ListLongMap!22029)

(declare-fun c!141326 () Bool)

(declare-fun call!68724 () ListLongMap!22029)

(declare-fun c!141325 () Bool)

(declare-fun +!4869 (ListLongMap!22029 tuple2!24420) ListLongMap!22029)

(assert (=> bm!68717 (= call!68724 (+!4869 (ite c!141325 call!68721 (ite c!141326 call!68722 call!68723)) (ite (or c!141325 c!141326) (tuple2!24421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1543970 () Bool)

(declare-fun e!859385 () ListLongMap!22029)

(assert (=> b!1543970 (= e!859385 call!68723)))

(declare-fun b!1543971 () Bool)

(declare-fun call!68720 () ListLongMap!22029)

(assert (=> b!1543971 (= e!859385 call!68720)))

(declare-fun b!1543972 () Bool)

(declare-fun res!1059249 () Bool)

(declare-fun e!859391 () Bool)

(assert (=> b!1543972 (=> (not res!1059249) (not e!859391))))

(declare-datatypes ((array!102966 0))(
  ( (array!102967 (arr!49685 (Array (_ BitVec 32) (_ BitVec 64))) (size!50235 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102966)

(declare-datatypes ((List!35938 0))(
  ( (Nil!35935) (Cons!35934 (h!37379 (_ BitVec 64)) (t!50632 List!35938)) )
))
(declare-fun arrayNoDuplicates!0 (array!102966 (_ BitVec 32) List!35938) Bool)

(assert (=> b!1543972 (= res!1059249 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35935))))

(declare-fun b!1543973 () Bool)

(declare-fun c!141324 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666071 () Bool)

(assert (=> b!1543973 (= c!141324 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666071))))

(declare-fun e!859386 () ListLongMap!22029)

(assert (=> b!1543973 (= e!859386 e!859385)))

(declare-fun mapIsEmpty!58516 () Bool)

(assert (=> mapIsEmpty!58516 mapRes!58516))

(declare-fun bm!68718 () Bool)

(assert (=> bm!68718 (= call!68720 call!68724)))

(declare-fun b!1543974 () Bool)

(declare-fun e!859388 () Bool)

(declare-fun tp_is_empty!37875 () Bool)

(assert (=> b!1543974 (= e!859388 tp_is_empty!37875)))

(declare-fun b!1543975 () Bool)

(assert (=> b!1543975 (= e!859389 tp_is_empty!37875)))

(declare-fun res!1059248 () Bool)

(assert (=> start!131886 (=> (not res!1059248) (not e!859391))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131886 (= res!1059248 (validMask!0 mask!926))))

(assert (=> start!131886 e!859391))

(declare-fun array_inv!38649 (array!102966) Bool)

(assert (=> start!131886 (array_inv!38649 _keys!618)))

(assert (=> start!131886 tp_is_empty!37875))

(assert (=> start!131886 true))

(assert (=> start!131886 tp!111049))

(declare-fun array_inv!38650 (array!102964) Bool)

(assert (=> start!131886 (and (array_inv!38650 _values!470) e!859392)))

(declare-fun b!1543976 () Bool)

(assert (=> b!1543976 (= e!859391 false)))

(declare-fun lt!666070 () ListLongMap!22029)

(declare-fun e!859390 () ListLongMap!22029)

(assert (=> b!1543976 (= lt!666070 e!859390)))

(assert (=> b!1543976 (= c!141325 (and (not lt!666071) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1543976 (= lt!666071 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58516 () Bool)

(declare-fun tp!111048 () Bool)

(assert (=> mapNonEmpty!58516 (= mapRes!58516 (and tp!111048 e!859388))))

(declare-fun mapRest!58516 () (Array (_ BitVec 32) ValueCell!18027))

(declare-fun mapValue!58516 () ValueCell!18027)

(declare-fun mapKey!58516 () (_ BitVec 32))

(assert (=> mapNonEmpty!58516 (= (arr!49684 _values!470) (store mapRest!58516 mapKey!58516 mapValue!58516))))

(declare-fun b!1543977 () Bool)

(assert (=> b!1543977 (= e!859386 call!68720)))

(declare-fun b!1543978 () Bool)

(declare-fun res!1059251 () Bool)

(assert (=> b!1543978 (=> (not res!1059251) (not e!859391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102966 (_ BitVec 32)) Bool)

(assert (=> b!1543978 (= res!1059251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543979 () Bool)

(assert (=> b!1543979 (= e!859390 (+!4869 call!68724 (tuple2!24421 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1543980 () Bool)

(declare-fun res!1059250 () Bool)

(assert (=> b!1543980 (=> (not res!1059250) (not e!859391))))

(assert (=> b!1543980 (= res!1059250 (and (= (size!50234 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50235 _keys!618) (size!50234 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543981 () Bool)

(assert (=> b!1543981 (= e!859390 e!859386)))

(assert (=> b!1543981 (= c!141326 (and (not lt!666071) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!68719 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6502 (array!102966 array!102964 (_ BitVec 32) (_ BitVec 32) V!58943 V!58943 (_ BitVec 32) Int) ListLongMap!22029)

(assert (=> bm!68719 (= call!68721 (getCurrentListMapNoExtraKeys!6502 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!68720 () Bool)

(assert (=> bm!68720 (= call!68722 call!68721)))

(declare-fun b!1543982 () Bool)

(declare-fun res!1059252 () Bool)

(assert (=> b!1543982 (=> (not res!1059252) (not e!859391))))

(assert (=> b!1543982 (= res!1059252 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50235 _keys!618))))))

(declare-fun bm!68721 () Bool)

(assert (=> bm!68721 (= call!68723 call!68722)))

(assert (= (and start!131886 res!1059248) b!1543980))

(assert (= (and b!1543980 res!1059250) b!1543978))

(assert (= (and b!1543978 res!1059251) b!1543972))

(assert (= (and b!1543972 res!1059249) b!1543982))

(assert (= (and b!1543982 res!1059252) b!1543976))

(assert (= (and b!1543976 c!141325) b!1543979))

(assert (= (and b!1543976 (not c!141325)) b!1543981))

(assert (= (and b!1543981 c!141326) b!1543977))

(assert (= (and b!1543981 (not c!141326)) b!1543973))

(assert (= (and b!1543973 c!141324) b!1543971))

(assert (= (and b!1543973 (not c!141324)) b!1543970))

(assert (= (or b!1543971 b!1543970) bm!68721))

(assert (= (or b!1543977 bm!68721) bm!68720))

(assert (= (or b!1543977 b!1543971) bm!68718))

(assert (= (or b!1543979 bm!68720) bm!68719))

(assert (= (or b!1543979 bm!68718) bm!68717))

(assert (= (and b!1543969 condMapEmpty!58516) mapIsEmpty!58516))

(assert (= (and b!1543969 (not condMapEmpty!58516)) mapNonEmpty!58516))

(get-info :version)

(assert (= (and mapNonEmpty!58516 ((_ is ValueCellFull!18027) mapValue!58516)) b!1543974))

(assert (= (and b!1543969 ((_ is ValueCellFull!18027) mapDefault!58516)) b!1543975))

(assert (= start!131886 b!1543969))

(declare-fun m!1425079 () Bool)

(assert (=> mapNonEmpty!58516 m!1425079))

(declare-fun m!1425081 () Bool)

(assert (=> bm!68719 m!1425081))

(declare-fun m!1425083 () Bool)

(assert (=> b!1543979 m!1425083))

(declare-fun m!1425085 () Bool)

(assert (=> start!131886 m!1425085))

(declare-fun m!1425087 () Bool)

(assert (=> start!131886 m!1425087))

(declare-fun m!1425089 () Bool)

(assert (=> start!131886 m!1425089))

(declare-fun m!1425091 () Bool)

(assert (=> bm!68717 m!1425091))

(declare-fun m!1425093 () Bool)

(assert (=> b!1543972 m!1425093))

(declare-fun m!1425095 () Bool)

(assert (=> b!1543978 m!1425095))

(check-sat (not b_next!31599) tp_is_empty!37875 (not b!1543972) (not b!1543978) b_and!51009 (not b!1543979) (not bm!68717) (not mapNonEmpty!58516) (not bm!68719) (not start!131886))
(check-sat b_and!51009 (not b_next!31599))
