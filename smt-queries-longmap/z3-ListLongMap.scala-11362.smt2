; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132488 () Bool)

(assert start!132488)

(declare-fun b_free!31789 () Bool)

(declare-fun b_next!31789 () Bool)

(assert (=> start!132488 (= b_free!31789 (not b_next!31789))))

(declare-fun tp!111619 () Bool)

(declare-fun b_and!51201 () Bool)

(assert (=> start!132488 (= tp!111619 b_and!51201)))

(declare-fun res!1061957 () Bool)

(declare-fun e!863383 () Bool)

(assert (=> start!132488 (=> (not res!1061957) (not e!863383))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132488 (= res!1061957 (validMask!0 mask!926))))

(assert (=> start!132488 e!863383))

(declare-datatypes ((array!103454 0))(
  ( (array!103455 (arr!49922 (Array (_ BitVec 32) (_ BitVec 64))) (size!50473 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103454)

(declare-fun array_inv!39083 (array!103454) Bool)

(assert (=> start!132488 (array_inv!39083 _keys!618)))

(declare-fun tp_is_empty!38065 () Bool)

(assert (=> start!132488 tp_is_empty!38065))

(assert (=> start!132488 true))

(assert (=> start!132488 tp!111619))

(declare-datatypes ((V!59197 0))(
  ( (V!59198 (val!19110 Int)) )
))
(declare-datatypes ((ValueCell!18122 0))(
  ( (ValueCellFull!18122 (v!21903 V!59197)) (EmptyCell!18122) )
))
(declare-datatypes ((array!103456 0))(
  ( (array!103457 (arr!49923 (Array (_ BitVec 32) ValueCell!18122)) (size!50474 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103456)

(declare-fun e!863389 () Bool)

(declare-fun array_inv!39084 (array!103456) Bool)

(assert (=> start!132488 (and (array_inv!39084 _values!470) e!863389)))

(declare-fun b!1550813 () Bool)

(declare-fun res!1061952 () Bool)

(assert (=> b!1550813 (=> (not res!1061952) (not e!863383))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1550813 (= res!1061952 (and (= (size!50474 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50473 _keys!618) (size!50474 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550814 () Bool)

(declare-datatypes ((tuple2!24658 0))(
  ( (tuple2!24659 (_1!12340 (_ BitVec 64)) (_2!12340 V!59197)) )
))
(declare-datatypes ((List!36131 0))(
  ( (Nil!36128) (Cons!36127 (h!37590 tuple2!24658) (t!50817 List!36131)) )
))
(declare-datatypes ((ListLongMap!22275 0))(
  ( (ListLongMap!22276 (toList!11153 List!36131)) )
))
(declare-fun e!863385 () ListLongMap!22275)

(declare-fun e!863387 () ListLongMap!22275)

(assert (=> b!1550814 (= e!863385 e!863387)))

(declare-fun c!142981 () Bool)

(declare-fun lt!668171 () Bool)

(assert (=> b!1550814 (= c!142981 (and (not lt!668171) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550815 () Bool)

(declare-fun e!863386 () Bool)

(declare-fun mapRes!58801 () Bool)

(assert (=> b!1550815 (= e!863389 (and e!863386 mapRes!58801))))

(declare-fun condMapEmpty!58801 () Bool)

(declare-fun mapDefault!58801 () ValueCell!18122)

(assert (=> b!1550815 (= condMapEmpty!58801 (= (arr!49923 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18122)) mapDefault!58801)))))

(declare-fun b!1550816 () Bool)

(declare-fun e!863388 () Bool)

(assert (=> b!1550816 (= e!863383 e!863388)))

(declare-fun res!1061955 () Bool)

(assert (=> b!1550816 (=> (not res!1061955) (not e!863388))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1550816 (= res!1061955 (bvslt from!762 (size!50473 _keys!618)))))

(declare-fun lt!668168 () ListLongMap!22275)

(assert (=> b!1550816 (= lt!668168 e!863385)))

(declare-fun c!142979 () Bool)

(assert (=> b!1550816 (= c!142979 (and (not lt!668171) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550816 (= lt!668171 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550817 () Bool)

(declare-fun e!863391 () Bool)

(assert (=> b!1550817 (= e!863391 tp_is_empty!38065)))

(declare-fun b!1550818 () Bool)

(assert (=> b!1550818 (= e!863386 tp_is_empty!38065)))

(declare-fun mapIsEmpty!58801 () Bool)

(assert (=> mapIsEmpty!58801 mapRes!58801))

(declare-fun b!1550819 () Bool)

(declare-fun res!1061954 () Bool)

(assert (=> b!1550819 (=> (not res!1061954) (not e!863388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550819 (= res!1061954 (validKeyInArray!0 (select (arr!49922 _keys!618) from!762)))))

(declare-fun mapNonEmpty!58801 () Bool)

(declare-fun tp!111618 () Bool)

(assert (=> mapNonEmpty!58801 (= mapRes!58801 (and tp!111618 e!863391))))

(declare-fun mapValue!58801 () ValueCell!18122)

(declare-fun mapKey!58801 () (_ BitVec 32))

(declare-fun mapRest!58801 () (Array (_ BitVec 32) ValueCell!18122))

(assert (=> mapNonEmpty!58801 (= (arr!49923 _values!470) (store mapRest!58801 mapKey!58801 mapValue!58801))))

(declare-fun defaultEntry!478 () Int)

(declare-fun call!70295 () ListLongMap!22275)

(declare-fun minValue!436 () V!59197)

(declare-fun bm!70292 () Bool)

(declare-fun zeroValue!436 () V!59197)

(declare-fun getCurrentListMapNoExtraKeys!6626 (array!103454 array!103456 (_ BitVec 32) (_ BitVec 32) V!59197 V!59197 (_ BitVec 32) Int) ListLongMap!22275)

(assert (=> bm!70292 (= call!70295 (getCurrentListMapNoExtraKeys!6626 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70293 () Bool)

(declare-fun call!70297 () ListLongMap!22275)

(declare-fun call!70299 () ListLongMap!22275)

(assert (=> bm!70293 (= call!70297 call!70299)))

(declare-fun b!1550820 () Bool)

(declare-fun e!863390 () ListLongMap!22275)

(declare-fun call!70296 () ListLongMap!22275)

(assert (=> b!1550820 (= e!863390 call!70296)))

(declare-fun b!1550821 () Bool)

(declare-fun res!1061956 () Bool)

(assert (=> b!1550821 (=> (not res!1061956) (not e!863383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103454 (_ BitVec 32)) Bool)

(assert (=> b!1550821 (= res!1061956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70294 () Bool)

(declare-fun call!70298 () ListLongMap!22275)

(assert (=> bm!70294 (= call!70296 call!70298)))

(declare-fun b!1550822 () Bool)

(declare-fun res!1061953 () Bool)

(assert (=> b!1550822 (=> (not res!1061953) (not e!863383))))

(assert (=> b!1550822 (= res!1061953 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50473 _keys!618))))))

(declare-fun b!1550823 () Bool)

(assert (=> b!1550823 (= e!863388 (not true))))

(declare-fun lt!668166 () ListLongMap!22275)

(declare-fun lt!668170 () V!59197)

(declare-fun apply!1075 (ListLongMap!22275 (_ BitVec 64)) V!59197)

(assert (=> b!1550823 (= (apply!1075 lt!668166 (select (arr!49922 _keys!618) from!762)) lt!668170)))

(declare-datatypes ((Unit!51515 0))(
  ( (Unit!51516) )
))
(declare-fun lt!668165 () Unit!51515)

(declare-fun lt!668167 () ListLongMap!22275)

(declare-fun addApplyDifferent!604 (ListLongMap!22275 (_ BitVec 64) V!59197 (_ BitVec 64)) Unit!51515)

(assert (=> b!1550823 (= lt!668165 (addApplyDifferent!604 lt!668167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49922 _keys!618) from!762)))))

(declare-fun lt!668169 () V!59197)

(assert (=> b!1550823 (= lt!668169 lt!668170)))

(assert (=> b!1550823 (= lt!668170 (apply!1075 lt!668167 (select (arr!49922 _keys!618) from!762)))))

(declare-fun +!4994 (ListLongMap!22275 tuple2!24658) ListLongMap!22275)

(assert (=> b!1550823 (= lt!668169 (apply!1075 (+!4994 lt!668167 (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49922 _keys!618) from!762)))))

(declare-fun lt!668172 () Unit!51515)

(assert (=> b!1550823 (= lt!668172 (addApplyDifferent!604 lt!668167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49922 _keys!618) from!762)))))

(declare-fun contains!10123 (ListLongMap!22275 (_ BitVec 64)) Bool)

(assert (=> b!1550823 (contains!10123 lt!668166 (select (arr!49922 _keys!618) from!762))))

(assert (=> b!1550823 (= lt!668166 (+!4994 lt!668167 (tuple2!24659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668173 () Unit!51515)

(declare-fun addStillContains!1265 (ListLongMap!22275 (_ BitVec 64) V!59197 (_ BitVec 64)) Unit!51515)

(assert (=> b!1550823 (= lt!668173 (addStillContains!1265 lt!668167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49922 _keys!618) from!762)))))

(assert (=> b!1550823 (= lt!668167 (getCurrentListMapNoExtraKeys!6626 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550824 () Bool)

(declare-fun res!1061951 () Bool)

(assert (=> b!1550824 (=> (not res!1061951) (not e!863383))))

(declare-datatypes ((List!36132 0))(
  ( (Nil!36129) (Cons!36128 (h!37591 (_ BitVec 64)) (t!50818 List!36132)) )
))
(declare-fun arrayNoDuplicates!0 (array!103454 (_ BitVec 32) List!36132) Bool)

(assert (=> b!1550824 (= res!1061951 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36129))))

(declare-fun b!1550825 () Bool)

(declare-fun c!142980 () Bool)

(assert (=> b!1550825 (= c!142980 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668171))))

(assert (=> b!1550825 (= e!863387 e!863390)))

(declare-fun b!1550826 () Bool)

(assert (=> b!1550826 (= e!863385 (+!4994 call!70299 (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550827 () Bool)

(assert (=> b!1550827 (= e!863387 call!70297)))

(declare-fun bm!70295 () Bool)

(assert (=> bm!70295 (= call!70298 call!70295)))

(declare-fun b!1550828 () Bool)

(assert (=> b!1550828 (= e!863390 call!70297)))

(declare-fun bm!70296 () Bool)

(assert (=> bm!70296 (= call!70299 (+!4994 (ite c!142979 call!70295 (ite c!142981 call!70298 call!70296)) (ite (or c!142979 c!142981) (tuple2!24659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and start!132488 res!1061957) b!1550813))

(assert (= (and b!1550813 res!1061952) b!1550821))

(assert (= (and b!1550821 res!1061956) b!1550824))

(assert (= (and b!1550824 res!1061951) b!1550822))

(assert (= (and b!1550822 res!1061953) b!1550816))

(assert (= (and b!1550816 c!142979) b!1550826))

(assert (= (and b!1550816 (not c!142979)) b!1550814))

(assert (= (and b!1550814 c!142981) b!1550827))

(assert (= (and b!1550814 (not c!142981)) b!1550825))

(assert (= (and b!1550825 c!142980) b!1550828))

(assert (= (and b!1550825 (not c!142980)) b!1550820))

(assert (= (or b!1550828 b!1550820) bm!70294))

(assert (= (or b!1550827 bm!70294) bm!70295))

(assert (= (or b!1550827 b!1550828) bm!70293))

(assert (= (or b!1550826 bm!70295) bm!70292))

(assert (= (or b!1550826 bm!70293) bm!70296))

(assert (= (and b!1550816 res!1061955) b!1550819))

(assert (= (and b!1550819 res!1061954) b!1550823))

(assert (= (and b!1550815 condMapEmpty!58801) mapIsEmpty!58801))

(assert (= (and b!1550815 (not condMapEmpty!58801)) mapNonEmpty!58801))

(get-info :version)

(assert (= (and mapNonEmpty!58801 ((_ is ValueCellFull!18122) mapValue!58801)) b!1550817))

(assert (= (and b!1550815 ((_ is ValueCellFull!18122) mapDefault!58801)) b!1550818))

(assert (= start!132488 b!1550815))

(declare-fun m!1430049 () Bool)

(assert (=> b!1550823 m!1430049))

(declare-fun m!1430051 () Bool)

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430053 () Bool)

(assert (=> b!1550823 m!1430053))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430055 () Bool)

(assert (=> b!1550823 m!1430055))

(declare-fun m!1430057 () Bool)

(assert (=> b!1550823 m!1430057))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430059 () Bool)

(assert (=> b!1550823 m!1430059))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430061 () Bool)

(assert (=> b!1550823 m!1430061))

(assert (=> b!1550823 m!1430057))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430063 () Bool)

(assert (=> b!1550823 m!1430063))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430065 () Bool)

(assert (=> b!1550823 m!1430065))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430067 () Bool)

(assert (=> b!1550823 m!1430067))

(assert (=> b!1550823 m!1430051))

(declare-fun m!1430069 () Bool)

(assert (=> b!1550823 m!1430069))

(declare-fun m!1430071 () Bool)

(assert (=> mapNonEmpty!58801 m!1430071))

(assert (=> bm!70292 m!1430049))

(declare-fun m!1430073 () Bool)

(assert (=> b!1550821 m!1430073))

(declare-fun m!1430075 () Bool)

(assert (=> b!1550824 m!1430075))

(declare-fun m!1430077 () Bool)

(assert (=> b!1550826 m!1430077))

(assert (=> b!1550819 m!1430051))

(assert (=> b!1550819 m!1430051))

(declare-fun m!1430079 () Bool)

(assert (=> b!1550819 m!1430079))

(declare-fun m!1430081 () Bool)

(assert (=> start!132488 m!1430081))

(declare-fun m!1430083 () Bool)

(assert (=> start!132488 m!1430083))

(declare-fun m!1430085 () Bool)

(assert (=> start!132488 m!1430085))

(declare-fun m!1430087 () Bool)

(assert (=> bm!70296 m!1430087))

(check-sat (not mapNonEmpty!58801) (not bm!70292) (not b!1550824) (not b!1550821) (not b_next!31789) (not b!1550819) (not b!1550826) (not start!132488) (not b!1550823) b_and!51201 (not bm!70296) tp_is_empty!38065)
(check-sat b_and!51201 (not b_next!31789))
