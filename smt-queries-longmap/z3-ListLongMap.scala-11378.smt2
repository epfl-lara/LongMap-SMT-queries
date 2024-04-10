; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132212 () Bool)

(assert start!132212)

(declare-fun b_free!31887 () Bool)

(declare-fun b_next!31887 () Bool)

(assert (=> start!132212 (= b_free!31887 (not b_next!31887))))

(declare-fun tp!111919 () Bool)

(declare-fun b_and!51317 () Bool)

(assert (=> start!132212 (= tp!111919 b_and!51317)))

(declare-fun b!1551062 () Bool)

(declare-datatypes ((V!59327 0))(
  ( (V!59328 (val!19159 Int)) )
))
(declare-datatypes ((tuple2!24696 0))(
  ( (tuple2!24697 (_1!12359 (_ BitVec 64)) (_2!12359 V!59327)) )
))
(declare-datatypes ((List!36174 0))(
  ( (Nil!36171) (Cons!36170 (h!37615 tuple2!24696) (t!50884 List!36174)) )
))
(declare-datatypes ((ListLongMap!22305 0))(
  ( (ListLongMap!22306 (toList!11168 List!36174)) )
))
(declare-fun e!863426 () ListLongMap!22305)

(declare-fun call!70910 () ListLongMap!22305)

(assert (=> b!1551062 (= e!863426 call!70910)))

(declare-fun b!1551063 () Bool)

(declare-fun e!863425 () ListLongMap!22305)

(declare-fun e!863431 () ListLongMap!22305)

(assert (=> b!1551063 (= e!863425 e!863431)))

(declare-fun c!142701 () Bool)

(declare-fun lt!668508 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1551063 (= c!142701 (and (not lt!668508) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1551064 () Bool)

(declare-fun res!1062264 () Bool)

(declare-fun e!863428 () Bool)

(assert (=> b!1551064 (=> (not res!1062264) (not e!863428))))

(declare-datatypes ((array!103526 0))(
  ( (array!103527 (arr!49963 (Array (_ BitVec 32) (_ BitVec 64))) (size!50513 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103526)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551064 (= res!1062264 (validKeyInArray!0 (select (arr!49963 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58954 () Bool)

(declare-fun mapRes!58954 () Bool)

(assert (=> mapIsEmpty!58954 mapRes!58954))

(declare-fun bm!70904 () Bool)

(declare-fun call!70909 () ListLongMap!22305)

(declare-fun call!70907 () ListLongMap!22305)

(assert (=> bm!70904 (= call!70909 call!70907)))

(declare-fun zeroValue!436 () V!59327)

(declare-fun c!142699 () Bool)

(declare-fun call!70908 () ListLongMap!22305)

(declare-fun minValue!436 () V!59327)

(declare-fun call!70911 () ListLongMap!22305)

(declare-fun bm!70905 () Bool)

(declare-fun +!4989 (ListLongMap!22305 tuple2!24696) ListLongMap!22305)

(assert (=> bm!70905 (= call!70911 (+!4989 (ite c!142699 call!70907 (ite c!142701 call!70909 call!70908)) (ite (or c!142699 c!142701) (tuple2!24697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70906 () Bool)

(assert (=> bm!70906 (= call!70910 call!70911)))

(declare-fun b!1551065 () Bool)

(assert (=> b!1551065 (= e!863428 (not true))))

(declare-fun lt!668507 () ListLongMap!22305)

(declare-fun apply!1094 (ListLongMap!22305 (_ BitVec 64)) V!59327)

(assert (=> b!1551065 (= (apply!1094 (+!4989 lt!668507 (tuple2!24697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49963 _keys!618) from!762)) (apply!1094 lt!668507 (select (arr!49963 _keys!618) from!762)))))

(declare-datatypes ((Unit!51660 0))(
  ( (Unit!51661) )
))
(declare-fun lt!668510 () Unit!51660)

(declare-fun addApplyDifferent!632 (ListLongMap!22305 (_ BitVec 64) V!59327 (_ BitVec 64)) Unit!51660)

(assert (=> b!1551065 (= lt!668510 (addApplyDifferent!632 lt!668507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49963 _keys!618) from!762)))))

(declare-fun contains!10110 (ListLongMap!22305 (_ BitVec 64)) Bool)

(assert (=> b!1551065 (contains!10110 (+!4989 lt!668507 (tuple2!24697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49963 _keys!618) from!762))))

(declare-fun lt!668509 () Unit!51660)

(declare-fun addStillContains!1290 (ListLongMap!22305 (_ BitVec 64) V!59327 (_ BitVec 64)) Unit!51660)

(assert (=> b!1551065 (= lt!668509 (addStillContains!1290 lt!668507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49963 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18171 0))(
  ( (ValueCellFull!18171 (v!21962 V!59327)) (EmptyCell!18171) )
))
(declare-datatypes ((array!103528 0))(
  ( (array!103529 (arr!49964 (Array (_ BitVec 32) ValueCell!18171)) (size!50514 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103528)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6616 (array!103526 array!103528 (_ BitVec 32) (_ BitVec 32) V!59327 V!59327 (_ BitVec 32) Int) ListLongMap!22305)

(assert (=> b!1551065 (= lt!668507 (getCurrentListMapNoExtraKeys!6616 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70907 () Bool)

(assert (=> bm!70907 (= call!70907 (getCurrentListMapNoExtraKeys!6616 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1551066 () Bool)

(assert (=> b!1551066 (= e!863426 call!70908)))

(declare-fun b!1551067 () Bool)

(declare-fun c!142700 () Bool)

(assert (=> b!1551067 (= c!142700 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668508))))

(assert (=> b!1551067 (= e!863431 e!863426)))

(declare-fun b!1551068 () Bool)

(declare-fun e!863430 () Bool)

(declare-fun e!863427 () Bool)

(assert (=> b!1551068 (= e!863430 (and e!863427 mapRes!58954))))

(declare-fun condMapEmpty!58954 () Bool)

(declare-fun mapDefault!58954 () ValueCell!18171)

(assert (=> b!1551068 (= condMapEmpty!58954 (= (arr!49964 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18171)) mapDefault!58954)))))

(declare-fun res!1062262 () Bool)

(declare-fun e!863429 () Bool)

(assert (=> start!132212 (=> (not res!1062262) (not e!863429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132212 (= res!1062262 (validMask!0 mask!926))))

(assert (=> start!132212 e!863429))

(declare-fun array_inv!38845 (array!103526) Bool)

(assert (=> start!132212 (array_inv!38845 _keys!618)))

(declare-fun tp_is_empty!38163 () Bool)

(assert (=> start!132212 tp_is_empty!38163))

(assert (=> start!132212 true))

(assert (=> start!132212 tp!111919))

(declare-fun array_inv!38846 (array!103528) Bool)

(assert (=> start!132212 (and (array_inv!38846 _values!470) e!863430)))

(declare-fun b!1551069 () Bool)

(declare-fun e!863424 () Bool)

(assert (=> b!1551069 (= e!863424 tp_is_empty!38163)))

(declare-fun b!1551070 () Bool)

(assert (=> b!1551070 (= e!863425 (+!4989 call!70911 (tuple2!24697 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551071 () Bool)

(declare-fun res!1062268 () Bool)

(assert (=> b!1551071 (=> (not res!1062268) (not e!863429))))

(assert (=> b!1551071 (= res!1062268 (and (= (size!50514 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50513 _keys!618) (size!50514 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551072 () Bool)

(declare-fun res!1062267 () Bool)

(assert (=> b!1551072 (=> (not res!1062267) (not e!863429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103526 (_ BitVec 32)) Bool)

(assert (=> b!1551072 (= res!1062267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551073 () Bool)

(assert (=> b!1551073 (= e!863429 e!863428)))

(declare-fun res!1062266 () Bool)

(assert (=> b!1551073 (=> (not res!1062266) (not e!863428))))

(assert (=> b!1551073 (= res!1062266 (bvslt from!762 (size!50513 _keys!618)))))

(declare-fun lt!668511 () ListLongMap!22305)

(assert (=> b!1551073 (= lt!668511 e!863425)))

(assert (=> b!1551073 (= c!142699 (and (not lt!668508) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551073 (= lt!668508 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70908 () Bool)

(assert (=> bm!70908 (= call!70908 call!70909)))

(declare-fun mapNonEmpty!58954 () Bool)

(declare-fun tp!111918 () Bool)

(assert (=> mapNonEmpty!58954 (= mapRes!58954 (and tp!111918 e!863424))))

(declare-fun mapKey!58954 () (_ BitVec 32))

(declare-fun mapValue!58954 () ValueCell!18171)

(declare-fun mapRest!58954 () (Array (_ BitVec 32) ValueCell!18171))

(assert (=> mapNonEmpty!58954 (= (arr!49964 _values!470) (store mapRest!58954 mapKey!58954 mapValue!58954))))

(declare-fun b!1551074 () Bool)

(assert (=> b!1551074 (= e!863427 tp_is_empty!38163)))

(declare-fun b!1551075 () Bool)

(declare-fun res!1062265 () Bool)

(assert (=> b!1551075 (=> (not res!1062265) (not e!863429))))

(assert (=> b!1551075 (= res!1062265 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50513 _keys!618))))))

(declare-fun b!1551076 () Bool)

(assert (=> b!1551076 (= e!863431 call!70910)))

(declare-fun b!1551077 () Bool)

(declare-fun res!1062263 () Bool)

(assert (=> b!1551077 (=> (not res!1062263) (not e!863429))))

(declare-datatypes ((List!36175 0))(
  ( (Nil!36172) (Cons!36171 (h!37616 (_ BitVec 64)) (t!50885 List!36175)) )
))
(declare-fun arrayNoDuplicates!0 (array!103526 (_ BitVec 32) List!36175) Bool)

(assert (=> b!1551077 (= res!1062263 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36172))))

(assert (= (and start!132212 res!1062262) b!1551071))

(assert (= (and b!1551071 res!1062268) b!1551072))

(assert (= (and b!1551072 res!1062267) b!1551077))

(assert (= (and b!1551077 res!1062263) b!1551075))

(assert (= (and b!1551075 res!1062265) b!1551073))

(assert (= (and b!1551073 c!142699) b!1551070))

(assert (= (and b!1551073 (not c!142699)) b!1551063))

(assert (= (and b!1551063 c!142701) b!1551076))

(assert (= (and b!1551063 (not c!142701)) b!1551067))

(assert (= (and b!1551067 c!142700) b!1551062))

(assert (= (and b!1551067 (not c!142700)) b!1551066))

(assert (= (or b!1551062 b!1551066) bm!70908))

(assert (= (or b!1551076 bm!70908) bm!70904))

(assert (= (or b!1551076 b!1551062) bm!70906))

(assert (= (or b!1551070 bm!70904) bm!70907))

(assert (= (or b!1551070 bm!70906) bm!70905))

(assert (= (and b!1551073 res!1062266) b!1551064))

(assert (= (and b!1551064 res!1062264) b!1551065))

(assert (= (and b!1551068 condMapEmpty!58954) mapIsEmpty!58954))

(assert (= (and b!1551068 (not condMapEmpty!58954)) mapNonEmpty!58954))

(get-info :version)

(assert (= (and mapNonEmpty!58954 ((_ is ValueCellFull!18171) mapValue!58954)) b!1551069))

(assert (= (and b!1551068 ((_ is ValueCellFull!18171) mapDefault!58954)) b!1551074))

(assert (= start!132212 b!1551068))

(declare-fun m!1429783 () Bool)

(assert (=> bm!70905 m!1429783))

(declare-fun m!1429785 () Bool)

(assert (=> b!1551064 m!1429785))

(assert (=> b!1551064 m!1429785))

(declare-fun m!1429787 () Bool)

(assert (=> b!1551064 m!1429787))

(declare-fun m!1429789 () Bool)

(assert (=> bm!70907 m!1429789))

(declare-fun m!1429791 () Bool)

(assert (=> start!132212 m!1429791))

(declare-fun m!1429793 () Bool)

(assert (=> start!132212 m!1429793))

(declare-fun m!1429795 () Bool)

(assert (=> start!132212 m!1429795))

(declare-fun m!1429797 () Bool)

(assert (=> b!1551077 m!1429797))

(declare-fun m!1429799 () Bool)

(assert (=> b!1551072 m!1429799))

(declare-fun m!1429801 () Bool)

(assert (=> b!1551070 m!1429801))

(assert (=> b!1551065 m!1429789))

(assert (=> b!1551065 m!1429785))

(declare-fun m!1429803 () Bool)

(assert (=> b!1551065 m!1429803))

(assert (=> b!1551065 m!1429785))

(declare-fun m!1429805 () Bool)

(assert (=> b!1551065 m!1429805))

(declare-fun m!1429807 () Bool)

(assert (=> b!1551065 m!1429807))

(assert (=> b!1551065 m!1429785))

(declare-fun m!1429809 () Bool)

(assert (=> b!1551065 m!1429809))

(assert (=> b!1551065 m!1429785))

(declare-fun m!1429811 () Bool)

(assert (=> b!1551065 m!1429811))

(assert (=> b!1551065 m!1429803))

(assert (=> b!1551065 m!1429785))

(declare-fun m!1429813 () Bool)

(assert (=> b!1551065 m!1429813))

(assert (=> b!1551065 m!1429807))

(assert (=> b!1551065 m!1429785))

(declare-fun m!1429815 () Bool)

(assert (=> b!1551065 m!1429815))

(declare-fun m!1429817 () Bool)

(assert (=> mapNonEmpty!58954 m!1429817))

(check-sat (not b!1551072) (not b_next!31887) (not b!1551077) (not mapNonEmpty!58954) (not bm!70907) (not start!132212) (not b!1551065) (not b!1551070) (not bm!70905) b_and!51317 tp_is_empty!38163 (not b!1551064))
(check-sat b_and!51317 (not b_next!31887))
