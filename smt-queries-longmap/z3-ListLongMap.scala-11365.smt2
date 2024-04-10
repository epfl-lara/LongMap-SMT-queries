; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132096 () Bool)

(assert start!132096)

(declare-fun b_free!31809 () Bool)

(declare-fun b_next!31809 () Bool)

(assert (=> start!132096 (= b_free!31809 (not b_next!31809))))

(declare-fun tp!111678 () Bool)

(declare-fun b_and!51219 () Bool)

(assert (=> start!132096 (= tp!111678 b_and!51219)))

(declare-fun b!1548857 () Bool)

(declare-fun res!1061306 () Bool)

(declare-fun e!862148 () Bool)

(assert (=> b!1548857 (=> (not res!1061306) (not e!862148))))

(declare-datatypes ((array!103368 0))(
  ( (array!103369 (arr!49886 (Array (_ BitVec 32) (_ BitVec 64))) (size!50436 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103368)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59223 0))(
  ( (V!59224 (val!19120 Int)) )
))
(declare-datatypes ((ValueCell!18132 0))(
  ( (ValueCellFull!18132 (v!21921 V!59223)) (EmptyCell!18132) )
))
(declare-datatypes ((array!103370 0))(
  ( (array!103371 (arr!49887 (Array (_ BitVec 32) ValueCell!18132)) (size!50437 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103370)

(assert (=> b!1548857 (= res!1061306 (and (= (size!50437 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50436 _keys!618) (size!50437 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1061303 () Bool)

(assert (=> start!132096 (=> (not res!1061303) (not e!862148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132096 (= res!1061303 (validMask!0 mask!926))))

(assert (=> start!132096 e!862148))

(declare-fun array_inv!38785 (array!103368) Bool)

(assert (=> start!132096 (array_inv!38785 _keys!618)))

(declare-fun tp_is_empty!38085 () Bool)

(assert (=> start!132096 tp_is_empty!38085))

(assert (=> start!132096 true))

(assert (=> start!132096 tp!111678))

(declare-fun e!862147 () Bool)

(declare-fun array_inv!38786 (array!103370) Bool)

(assert (=> start!132096 (and (array_inv!38786 _values!470) e!862147)))

(declare-fun b!1548858 () Bool)

(declare-datatypes ((tuple2!24618 0))(
  ( (tuple2!24619 (_1!12320 (_ BitVec 64)) (_2!12320 V!59223)) )
))
(declare-datatypes ((List!36108 0))(
  ( (Nil!36105) (Cons!36104 (h!37549 tuple2!24618) (t!50802 List!36108)) )
))
(declare-datatypes ((ListLongMap!22227 0))(
  ( (ListLongMap!22228 (toList!11129 List!36108)) )
))
(declare-fun e!862151 () ListLongMap!22227)

(declare-fun call!70296 () ListLongMap!22227)

(assert (=> b!1548858 (= e!862151 call!70296)))

(declare-fun b!1548859 () Bool)

(declare-fun e!862146 () ListLongMap!22227)

(declare-fun e!862150 () ListLongMap!22227)

(assert (=> b!1548859 (= e!862146 e!862150)))

(declare-fun c!142270 () Bool)

(declare-fun lt!667533 () Bool)

(assert (=> b!1548859 (= c!142270 (and (not lt!667533) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!70298 () ListLongMap!22227)

(declare-fun c!142269 () Bool)

(declare-fun bm!70292 () Bool)

(declare-fun minValue!436 () V!59223)

(declare-fun call!70299 () ListLongMap!22227)

(declare-fun zeroValue!436 () V!59223)

(declare-fun call!70295 () ListLongMap!22227)

(declare-fun +!4958 (ListLongMap!22227 tuple2!24618) ListLongMap!22227)

(assert (=> bm!70292 (= call!70299 (+!4958 (ite c!142269 call!70298 (ite c!142270 call!70295 call!70296)) (ite (or c!142269 c!142270) (tuple2!24619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun bm!70293 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6583 (array!103368 array!103370 (_ BitVec 32) (_ BitVec 32) V!59223 V!59223 (_ BitVec 32) Int) ListLongMap!22227)

(assert (=> bm!70293 (= call!70298 (getCurrentListMapNoExtraKeys!6583 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58831 () Bool)

(declare-fun mapRes!58831 () Bool)

(assert (=> mapIsEmpty!58831 mapRes!58831))

(declare-fun b!1548860 () Bool)

(declare-fun e!862144 () Bool)

(assert (=> b!1548860 (= e!862144 tp_is_empty!38085)))

(declare-fun bm!70294 () Bool)

(assert (=> bm!70294 (= call!70296 call!70295)))

(declare-fun b!1548861 () Bool)

(declare-fun c!142271 () Bool)

(assert (=> b!1548861 (= c!142271 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667533))))

(assert (=> b!1548861 (= e!862150 e!862151)))

(declare-fun b!1548862 () Bool)

(declare-fun e!862145 () Bool)

(assert (=> b!1548862 (= e!862145 tp_is_empty!38085)))

(declare-fun b!1548863 () Bool)

(assert (=> b!1548863 (= e!862146 (+!4958 call!70299 (tuple2!24619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70295 () Bool)

(assert (=> bm!70295 (= call!70295 call!70298)))

(declare-fun b!1548864 () Bool)

(declare-fun call!70297 () ListLongMap!22227)

(assert (=> b!1548864 (= e!862150 call!70297)))

(declare-fun b!1548865 () Bool)

(declare-fun res!1061302 () Bool)

(assert (=> b!1548865 (=> (not res!1061302) (not e!862148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103368 (_ BitVec 32)) Bool)

(assert (=> b!1548865 (= res!1061302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58831 () Bool)

(declare-fun tp!111679 () Bool)

(assert (=> mapNonEmpty!58831 (= mapRes!58831 (and tp!111679 e!862144))))

(declare-fun mapKey!58831 () (_ BitVec 32))

(declare-fun mapRest!58831 () (Array (_ BitVec 32) ValueCell!18132))

(declare-fun mapValue!58831 () ValueCell!18132)

(assert (=> mapNonEmpty!58831 (= (arr!49887 _values!470) (store mapRest!58831 mapKey!58831 mapValue!58831))))

(declare-fun b!1548866 () Bool)

(declare-fun e!862152 () Bool)

(assert (=> b!1548866 (= e!862152 (not true))))

(declare-fun lt!667532 () ListLongMap!22227)

(declare-fun lt!667529 () V!59223)

(declare-fun apply!1074 (ListLongMap!22227 (_ BitVec 64)) V!59223)

(assert (=> b!1548866 (= (apply!1074 lt!667532 (select (arr!49886 _keys!618) from!762)) lt!667529)))

(declare-datatypes ((Unit!51598 0))(
  ( (Unit!51599) )
))
(declare-fun lt!667528 () Unit!51598)

(declare-fun lt!667531 () ListLongMap!22227)

(declare-fun addApplyDifferent!616 (ListLongMap!22227 (_ BitVec 64) V!59223 (_ BitVec 64)) Unit!51598)

(assert (=> b!1548866 (= lt!667528 (addApplyDifferent!616 lt!667531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49886 _keys!618) from!762)))))

(declare-fun lt!667527 () V!59223)

(assert (=> b!1548866 (= lt!667527 lt!667529)))

(assert (=> b!1548866 (= lt!667529 (apply!1074 lt!667531 (select (arr!49886 _keys!618) from!762)))))

(assert (=> b!1548866 (= lt!667527 (apply!1074 (+!4958 lt!667531 (tuple2!24619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49886 _keys!618) from!762)))))

(declare-fun lt!667535 () Unit!51598)

(assert (=> b!1548866 (= lt!667535 (addApplyDifferent!616 lt!667531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49886 _keys!618) from!762)))))

(declare-fun contains!10081 (ListLongMap!22227 (_ BitVec 64)) Bool)

(assert (=> b!1548866 (contains!10081 lt!667532 (select (arr!49886 _keys!618) from!762))))

(assert (=> b!1548866 (= lt!667532 (+!4958 lt!667531 (tuple2!24619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667530 () Unit!51598)

(declare-fun addStillContains!1269 (ListLongMap!22227 (_ BitVec 64) V!59223 (_ BitVec 64)) Unit!51598)

(assert (=> b!1548866 (= lt!667530 (addStillContains!1269 lt!667531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49886 _keys!618) from!762)))))

(assert (=> b!1548866 (= lt!667531 (getCurrentListMapNoExtraKeys!6583 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548867 () Bool)

(declare-fun res!1061307 () Bool)

(assert (=> b!1548867 (=> (not res!1061307) (not e!862152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548867 (= res!1061307 (validKeyInArray!0 (select (arr!49886 _keys!618) from!762)))))

(declare-fun b!1548868 () Bool)

(assert (=> b!1548868 (= e!862151 call!70297)))

(declare-fun b!1548869 () Bool)

(declare-fun res!1061301 () Bool)

(assert (=> b!1548869 (=> (not res!1061301) (not e!862148))))

(assert (=> b!1548869 (= res!1061301 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50436 _keys!618))))))

(declare-fun b!1548870 () Bool)

(assert (=> b!1548870 (= e!862148 e!862152)))

(declare-fun res!1061305 () Bool)

(assert (=> b!1548870 (=> (not res!1061305) (not e!862152))))

(assert (=> b!1548870 (= res!1061305 (bvslt from!762 (size!50436 _keys!618)))))

(declare-fun lt!667534 () ListLongMap!22227)

(assert (=> b!1548870 (= lt!667534 e!862146)))

(assert (=> b!1548870 (= c!142269 (and (not lt!667533) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548870 (= lt!667533 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548871 () Bool)

(declare-fun res!1061304 () Bool)

(assert (=> b!1548871 (=> (not res!1061304) (not e!862148))))

(declare-datatypes ((List!36109 0))(
  ( (Nil!36106) (Cons!36105 (h!37550 (_ BitVec 64)) (t!50803 List!36109)) )
))
(declare-fun arrayNoDuplicates!0 (array!103368 (_ BitVec 32) List!36109) Bool)

(assert (=> b!1548871 (= res!1061304 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36106))))

(declare-fun b!1548872 () Bool)

(assert (=> b!1548872 (= e!862147 (and e!862145 mapRes!58831))))

(declare-fun condMapEmpty!58831 () Bool)

(declare-fun mapDefault!58831 () ValueCell!18132)

(assert (=> b!1548872 (= condMapEmpty!58831 (= (arr!49887 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18132)) mapDefault!58831)))))

(declare-fun bm!70296 () Bool)

(assert (=> bm!70296 (= call!70297 call!70299)))

(assert (= (and start!132096 res!1061303) b!1548857))

(assert (= (and b!1548857 res!1061306) b!1548865))

(assert (= (and b!1548865 res!1061302) b!1548871))

(assert (= (and b!1548871 res!1061304) b!1548869))

(assert (= (and b!1548869 res!1061301) b!1548870))

(assert (= (and b!1548870 c!142269) b!1548863))

(assert (= (and b!1548870 (not c!142269)) b!1548859))

(assert (= (and b!1548859 c!142270) b!1548864))

(assert (= (and b!1548859 (not c!142270)) b!1548861))

(assert (= (and b!1548861 c!142271) b!1548868))

(assert (= (and b!1548861 (not c!142271)) b!1548858))

(assert (= (or b!1548868 b!1548858) bm!70294))

(assert (= (or b!1548864 bm!70294) bm!70295))

(assert (= (or b!1548864 b!1548868) bm!70296))

(assert (= (or b!1548863 bm!70295) bm!70293))

(assert (= (or b!1548863 bm!70296) bm!70292))

(assert (= (and b!1548870 res!1061305) b!1548867))

(assert (= (and b!1548867 res!1061307) b!1548866))

(assert (= (and b!1548872 condMapEmpty!58831) mapIsEmpty!58831))

(assert (= (and b!1548872 (not condMapEmpty!58831)) mapNonEmpty!58831))

(get-info :version)

(assert (= (and mapNonEmpty!58831 ((_ is ValueCellFull!18132) mapValue!58831)) b!1548860))

(assert (= (and b!1548872 ((_ is ValueCellFull!18132) mapDefault!58831)) b!1548862))

(assert (= start!132096 b!1548872))

(declare-fun m!1428191 () Bool)

(assert (=> bm!70293 m!1428191))

(declare-fun m!1428193 () Bool)

(assert (=> start!132096 m!1428193))

(declare-fun m!1428195 () Bool)

(assert (=> start!132096 m!1428195))

(declare-fun m!1428197 () Bool)

(assert (=> start!132096 m!1428197))

(declare-fun m!1428199 () Bool)

(assert (=> b!1548863 m!1428199))

(declare-fun m!1428201 () Bool)

(assert (=> b!1548871 m!1428201))

(declare-fun m!1428203 () Bool)

(assert (=> b!1548865 m!1428203))

(declare-fun m!1428205 () Bool)

(assert (=> b!1548866 m!1428205))

(declare-fun m!1428207 () Bool)

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428209 () Bool)

(assert (=> b!1548866 m!1428209))

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428211 () Bool)

(assert (=> b!1548866 m!1428211))

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428213 () Bool)

(assert (=> b!1548866 m!1428213))

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428215 () Bool)

(assert (=> b!1548866 m!1428215))

(declare-fun m!1428217 () Bool)

(assert (=> b!1548866 m!1428217))

(assert (=> b!1548866 m!1428205))

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428219 () Bool)

(assert (=> b!1548866 m!1428219))

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428221 () Bool)

(assert (=> b!1548866 m!1428221))

(assert (=> b!1548866 m!1428191))

(assert (=> b!1548866 m!1428207))

(assert (=> b!1548866 m!1428207))

(declare-fun m!1428223 () Bool)

(assert (=> b!1548866 m!1428223))

(declare-fun m!1428225 () Bool)

(assert (=> mapNonEmpty!58831 m!1428225))

(declare-fun m!1428227 () Bool)

(assert (=> bm!70292 m!1428227))

(assert (=> b!1548867 m!1428207))

(assert (=> b!1548867 m!1428207))

(declare-fun m!1428229 () Bool)

(assert (=> b!1548867 m!1428229))

(check-sat (not start!132096) (not b!1548871) (not b!1548866) (not b!1548863) (not bm!70292) tp_is_empty!38085 (not mapNonEmpty!58831) (not b!1548867) (not b_next!31809) (not b!1548865) b_and!51219 (not bm!70293))
(check-sat b_and!51219 (not b_next!31809))
