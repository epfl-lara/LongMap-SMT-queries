; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132356 () Bool)

(assert start!132356)

(declare-fun b_free!31657 () Bool)

(declare-fun b_next!31657 () Bool)

(assert (=> start!132356 (= b_free!31657 (not b_next!31657))))

(declare-fun tp!111222 () Bool)

(declare-fun b_and!51069 () Bool)

(assert (=> start!132356 (= tp!111222 b_and!51069)))

(declare-fun b!1547645 () Bool)

(declare-datatypes ((V!59021 0))(
  ( (V!59022 (val!19044 Int)) )
))
(declare-datatypes ((tuple2!24530 0))(
  ( (tuple2!24531 (_1!12276 (_ BitVec 64)) (_2!12276 V!59021)) )
))
(declare-datatypes ((List!36023 0))(
  ( (Nil!36020) (Cons!36019 (h!37482 tuple2!24530) (t!50709 List!36023)) )
))
(declare-datatypes ((ListLongMap!22147 0))(
  ( (ListLongMap!22148 (toList!11089 List!36023)) )
))
(declare-fun e!861602 () ListLongMap!22147)

(declare-fun call!69306 () ListLongMap!22147)

(assert (=> b!1547645 (= e!861602 call!69306)))

(declare-fun b!1547646 () Bool)

(declare-fun res!1060567 () Bool)

(declare-fun e!861609 () Bool)

(assert (=> b!1547646 (=> (not res!1060567) (not e!861609))))

(declare-datatypes ((array!103194 0))(
  ( (array!103195 (arr!49792 (Array (_ BitVec 32) (_ BitVec 64))) (size!50343 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103194)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103194 (_ BitVec 32)) Bool)

(assert (=> b!1547646 (= res!1060567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58603 () Bool)

(declare-fun mapRes!58603 () Bool)

(assert (=> mapIsEmpty!58603 mapRes!58603))

(declare-fun b!1547647 () Bool)

(declare-fun e!861608 () ListLongMap!22147)

(declare-fun call!69308 () ListLongMap!22147)

(assert (=> b!1547647 (= e!861608 call!69308)))

(declare-fun zeroValue!436 () V!59021)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18056 0))(
  ( (ValueCellFull!18056 (v!21837 V!59021)) (EmptyCell!18056) )
))
(declare-datatypes ((array!103196 0))(
  ( (array!103197 (arr!49793 (Array (_ BitVec 32) ValueCell!18056)) (size!50344 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103196)

(declare-fun minValue!436 () V!59021)

(declare-fun call!69307 () ListLongMap!22147)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun bm!69302 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6573 (array!103194 array!103196 (_ BitVec 32) (_ BitVec 32) V!59021 V!59021 (_ BitVec 32) Int) ListLongMap!22147)

(assert (=> bm!69302 (= call!69307 (getCurrentListMapNoExtraKeys!6573 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547648 () Bool)

(declare-fun e!861607 () Bool)

(declare-fun tp_is_empty!37933 () Bool)

(assert (=> b!1547648 (= e!861607 tp_is_empty!37933)))

(declare-fun b!1547649 () Bool)

(declare-fun res!1060565 () Bool)

(assert (=> b!1547649 (=> (not res!1060565) (not e!861609))))

(declare-datatypes ((List!36024 0))(
  ( (Nil!36021) (Cons!36020 (h!37483 (_ BitVec 64)) (t!50710 List!36024)) )
))
(declare-fun arrayNoDuplicates!0 (array!103194 (_ BitVec 32) List!36024) Bool)

(assert (=> b!1547649 (= res!1060565 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36021))))

(declare-fun b!1547650 () Bool)

(declare-fun res!1060569 () Bool)

(declare-fun e!861601 () Bool)

(assert (=> b!1547650 (=> (not res!1060569) (not e!861601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547650 (= res!1060569 (validKeyInArray!0 (select (arr!49792 _keys!618) from!762)))))

(declare-fun bm!69303 () Bool)

(declare-fun call!69305 () ListLongMap!22147)

(assert (=> bm!69303 (= call!69305 call!69307)))

(declare-fun b!1547651 () Bool)

(declare-fun res!1060570 () Bool)

(assert (=> b!1547651 (=> (not res!1060570) (not e!861609))))

(assert (=> b!1547651 (= res!1060570 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50343 _keys!618))))))

(declare-fun b!1547652 () Bool)

(assert (=> b!1547652 (= e!861609 e!861601)))

(declare-fun res!1060568 () Bool)

(assert (=> b!1547652 (=> (not res!1060568) (not e!861601))))

(assert (=> b!1547652 (= res!1060568 (bvslt from!762 (size!50343 _keys!618)))))

(declare-fun lt!667166 () ListLongMap!22147)

(declare-fun e!861605 () ListLongMap!22147)

(assert (=> b!1547652 (= lt!667166 e!861605)))

(declare-fun c!142386 () Bool)

(declare-fun lt!667168 () Bool)

(assert (=> b!1547652 (= c!142386 (and (not lt!667168) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547652 (= lt!667168 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547653 () Bool)

(declare-fun c!142387 () Bool)

(assert (=> b!1547653 (= c!142387 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667168))))

(assert (=> b!1547653 (= e!861602 e!861608)))

(declare-fun mapNonEmpty!58603 () Bool)

(declare-fun tp!111223 () Bool)

(assert (=> mapNonEmpty!58603 (= mapRes!58603 (and tp!111223 e!861607))))

(declare-fun mapRest!58603 () (Array (_ BitVec 32) ValueCell!18056))

(declare-fun mapValue!58603 () ValueCell!18056)

(declare-fun mapKey!58603 () (_ BitVec 32))

(assert (=> mapNonEmpty!58603 (= (arr!49793 _values!470) (store mapRest!58603 mapKey!58603 mapValue!58603))))

(declare-fun b!1547654 () Bool)

(declare-fun res!1060566 () Bool)

(assert (=> b!1547654 (=> (not res!1060566) (not e!861609))))

(assert (=> b!1547654 (= res!1060566 (and (= (size!50344 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50343 _keys!618) (size!50344 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547655 () Bool)

(assert (=> b!1547655 (= e!861605 e!861602)))

(declare-fun c!142385 () Bool)

(assert (=> b!1547655 (= c!142385 (and (not lt!667168) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547656 () Bool)

(assert (=> b!1547656 (= e!861608 call!69306)))

(declare-fun b!1547657 () Bool)

(declare-fun call!69309 () ListLongMap!22147)

(declare-fun +!4936 (ListLongMap!22147 tuple2!24530) ListLongMap!22147)

(assert (=> b!1547657 (= e!861605 (+!4936 call!69309 (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69304 () Bool)

(assert (=> bm!69304 (= call!69309 (+!4936 (ite c!142386 call!69307 (ite c!142385 call!69305 call!69308)) (ite (or c!142386 c!142385) (tuple2!24531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547658 () Bool)

(assert (=> b!1547658 (= e!861601 (not true))))

(declare-fun lt!667167 () ListLongMap!22147)

(declare-fun contains!10077 (ListLongMap!22147 (_ BitVec 64)) Bool)

(assert (=> b!1547658 (contains!10077 (+!4936 lt!667167 (tuple2!24531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49792 _keys!618) from!762))))

(declare-datatypes ((Unit!51423 0))(
  ( (Unit!51424) )
))
(declare-fun lt!667165 () Unit!51423)

(declare-fun addStillContains!1219 (ListLongMap!22147 (_ BitVec 64) V!59021 (_ BitVec 64)) Unit!51423)

(assert (=> b!1547658 (= lt!667165 (addStillContains!1219 lt!667167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49792 _keys!618) from!762)))))

(assert (=> b!1547658 (= lt!667167 (getCurrentListMapNoExtraKeys!6573 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060571 () Bool)

(assert (=> start!132356 (=> (not res!1060571) (not e!861609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132356 (= res!1060571 (validMask!0 mask!926))))

(assert (=> start!132356 e!861609))

(declare-fun array_inv!38993 (array!103194) Bool)

(assert (=> start!132356 (array_inv!38993 _keys!618)))

(assert (=> start!132356 tp_is_empty!37933))

(assert (=> start!132356 true))

(assert (=> start!132356 tp!111222))

(declare-fun e!861603 () Bool)

(declare-fun array_inv!38994 (array!103196) Bool)

(assert (=> start!132356 (and (array_inv!38994 _values!470) e!861603)))

(declare-fun bm!69305 () Bool)

(assert (=> bm!69305 (= call!69308 call!69305)))

(declare-fun bm!69306 () Bool)

(assert (=> bm!69306 (= call!69306 call!69309)))

(declare-fun b!1547659 () Bool)

(declare-fun e!861606 () Bool)

(assert (=> b!1547659 (= e!861603 (and e!861606 mapRes!58603))))

(declare-fun condMapEmpty!58603 () Bool)

(declare-fun mapDefault!58603 () ValueCell!18056)

(assert (=> b!1547659 (= condMapEmpty!58603 (= (arr!49793 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18056)) mapDefault!58603)))))

(declare-fun b!1547660 () Bool)

(assert (=> b!1547660 (= e!861606 tp_is_empty!37933)))

(assert (= (and start!132356 res!1060571) b!1547654))

(assert (= (and b!1547654 res!1060566) b!1547646))

(assert (= (and b!1547646 res!1060567) b!1547649))

(assert (= (and b!1547649 res!1060565) b!1547651))

(assert (= (and b!1547651 res!1060570) b!1547652))

(assert (= (and b!1547652 c!142386) b!1547657))

(assert (= (and b!1547652 (not c!142386)) b!1547655))

(assert (= (and b!1547655 c!142385) b!1547645))

(assert (= (and b!1547655 (not c!142385)) b!1547653))

(assert (= (and b!1547653 c!142387) b!1547656))

(assert (= (and b!1547653 (not c!142387)) b!1547647))

(assert (= (or b!1547656 b!1547647) bm!69305))

(assert (= (or b!1547645 bm!69305) bm!69303))

(assert (= (or b!1547645 b!1547656) bm!69306))

(assert (= (or b!1547657 bm!69303) bm!69302))

(assert (= (or b!1547657 bm!69306) bm!69304))

(assert (= (and b!1547652 res!1060568) b!1547650))

(assert (= (and b!1547650 res!1060569) b!1547658))

(assert (= (and b!1547659 condMapEmpty!58603) mapIsEmpty!58603))

(assert (= (and b!1547659 (not condMapEmpty!58603)) mapNonEmpty!58603))

(get-info :version)

(assert (= (and mapNonEmpty!58603 ((_ is ValueCellFull!18056) mapValue!58603)) b!1547648))

(assert (= (and b!1547659 ((_ is ValueCellFull!18056) mapDefault!58603)) b!1547660))

(assert (= start!132356 b!1547659))

(declare-fun m!1427877 () Bool)

(assert (=> bm!69304 m!1427877))

(declare-fun m!1427879 () Bool)

(assert (=> b!1547657 m!1427879))

(declare-fun m!1427881 () Bool)

(assert (=> start!132356 m!1427881))

(declare-fun m!1427883 () Bool)

(assert (=> start!132356 m!1427883))

(declare-fun m!1427885 () Bool)

(assert (=> start!132356 m!1427885))

(declare-fun m!1427887 () Bool)

(assert (=> mapNonEmpty!58603 m!1427887))

(declare-fun m!1427889 () Bool)

(assert (=> b!1547646 m!1427889))

(declare-fun m!1427891 () Bool)

(assert (=> b!1547650 m!1427891))

(assert (=> b!1547650 m!1427891))

(declare-fun m!1427893 () Bool)

(assert (=> b!1547650 m!1427893))

(declare-fun m!1427895 () Bool)

(assert (=> bm!69302 m!1427895))

(declare-fun m!1427897 () Bool)

(assert (=> b!1547649 m!1427897))

(assert (=> b!1547658 m!1427895))

(assert (=> b!1547658 m!1427891))

(declare-fun m!1427899 () Bool)

(assert (=> b!1547658 m!1427899))

(assert (=> b!1547658 m!1427899))

(assert (=> b!1547658 m!1427891))

(declare-fun m!1427901 () Bool)

(assert (=> b!1547658 m!1427901))

(assert (=> b!1547658 m!1427891))

(declare-fun m!1427903 () Bool)

(assert (=> b!1547658 m!1427903))

(check-sat (not start!132356) (not bm!69302) (not b!1547657) (not mapNonEmpty!58603) (not bm!69304) (not b_next!31657) (not b!1547658) (not b!1547649) tp_is_empty!37933 (not b!1547646) b_and!51069 (not b!1547650))
(check-sat b_and!51069 (not b_next!31657))
