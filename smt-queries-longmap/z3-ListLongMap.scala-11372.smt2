; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132138 () Bool)

(assert start!132138)

(declare-fun b_free!31851 () Bool)

(declare-fun b_next!31851 () Bool)

(assert (=> start!132138 (= b_free!31851 (not b_next!31851))))

(declare-fun tp!111805 () Bool)

(declare-fun b_and!51269 () Bool)

(assert (=> start!132138 (= tp!111805 b_and!51269)))

(declare-fun b!1549981 () Bool)

(declare-fun e!862803 () Bool)

(declare-datatypes ((array!103450 0))(
  ( (array!103451 (arr!49927 (Array (_ BitVec 32) (_ BitVec 64))) (size!50477 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103450)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549981 (= e!862803 (not (validKeyInArray!0 (select (arr!49927 _keys!618) from!762))))))

(declare-fun b!1549982 () Bool)

(declare-fun res!1061800 () Bool)

(declare-fun e!862799 () Bool)

(assert (=> b!1549982 (=> (not res!1061800) (not e!862799))))

(declare-datatypes ((List!36144 0))(
  ( (Nil!36141) (Cons!36140 (h!37585 (_ BitVec 64)) (t!50848 List!36144)) )
))
(declare-fun arrayNoDuplicates!0 (array!103450 (_ BitVec 32) List!36144) Bool)

(assert (=> b!1549982 (= res!1061800 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36141))))

(declare-fun b!1549983 () Bool)

(declare-fun res!1061797 () Bool)

(declare-fun e!862805 () Bool)

(assert (=> b!1549983 (=> (not res!1061797) (not e!862805))))

(declare-fun e!862806 () Bool)

(assert (=> b!1549983 (= res!1061797 e!862806)))

(declare-fun c!142486 () Bool)

(declare-fun lt!668180 () Bool)

(assert (=> b!1549983 (= c!142486 (not lt!668180))))

(declare-fun bm!70612 () Bool)

(declare-fun call!70620 () Bool)

(declare-datatypes ((V!59279 0))(
  ( (V!59280 (val!19141 Int)) )
))
(declare-datatypes ((tuple2!24660 0))(
  ( (tuple2!24661 (_1!12341 (_ BitVec 64)) (_2!12341 V!59279)) )
))
(declare-datatypes ((List!36145 0))(
  ( (Nil!36142) (Cons!36141 (h!37586 tuple2!24660) (t!50849 List!36145)) )
))
(declare-datatypes ((ListLongMap!22269 0))(
  ( (ListLongMap!22270 (toList!11150 List!36145)) )
))
(declare-fun lt!668183 () ListLongMap!22269)

(declare-fun contains!10096 (ListLongMap!22269 (_ BitVec 64)) Bool)

(assert (=> bm!70612 (= call!70620 (contains!10096 lt!668183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549985 () Bool)

(declare-datatypes ((Unit!51637 0))(
  ( (Unit!51638) )
))
(declare-fun e!862798 () Unit!51637)

(declare-fun lt!668182 () Unit!51637)

(assert (=> b!1549985 (= e!862798 lt!668182)))

(declare-fun zeroValue!436 () V!59279)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18153 0))(
  ( (ValueCellFull!18153 (v!21942 V!59279)) (EmptyCell!18153) )
))
(declare-datatypes ((array!103452 0))(
  ( (array!103453 (arr!49928 (Array (_ BitVec 32) ValueCell!18153)) (size!50478 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103452)

(declare-fun minValue!436 () V!59279)

(declare-fun lt!668176 () ListLongMap!22269)

(declare-fun getCurrentListMapNoExtraKeys!6600 (array!103450 array!103452 (_ BitVec 32) (_ BitVec 32) V!59279 V!59279 (_ BitVec 32) Int) ListLongMap!22269)

(assert (=> b!1549985 (= lt!668176 (getCurrentListMapNoExtraKeys!6600 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668177 () Unit!51637)

(declare-fun addStillContains!1283 (ListLongMap!22269 (_ BitVec 64) V!59279 (_ BitVec 64)) Unit!51637)

(assert (=> b!1549985 (= lt!668177 (addStillContains!1283 lt!668176 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49927 _keys!618) from!762)))))

(declare-fun lt!668174 () ListLongMap!22269)

(declare-fun +!4975 (ListLongMap!22269 tuple2!24660) ListLongMap!22269)

(assert (=> b!1549985 (= lt!668174 (+!4975 lt!668176 (tuple2!24661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (=> b!1549985 (contains!10096 lt!668174 (select (arr!49927 _keys!618) from!762))))

(declare-fun addApplyDifferent!630 (ListLongMap!22269 (_ BitVec 64) V!59279 (_ BitVec 64)) Unit!51637)

(assert (=> b!1549985 (= lt!668182 (addApplyDifferent!630 lt!668176 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49927 _keys!618) from!762)))))

(declare-fun lt!668175 () V!59279)

(declare-fun apply!1089 (ListLongMap!22269 (_ BitVec 64)) V!59279)

(assert (=> b!1549985 (= lt!668175 (apply!1089 (+!4975 lt!668176 (tuple2!24661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49927 _keys!618) from!762)))))

(declare-fun lt!668172 () V!59279)

(assert (=> b!1549985 (= lt!668172 (apply!1089 lt!668176 (select (arr!49927 _keys!618) from!762)))))

(assert (=> b!1549985 (= lt!668175 lt!668172)))

(declare-fun lt!668181 () Unit!51637)

(assert (=> b!1549985 (= lt!668181 (addApplyDifferent!630 lt!668176 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49927 _keys!618) from!762)))))

(assert (=> b!1549985 (= (apply!1089 lt!668174 (select (arr!49927 _keys!618) from!762)) lt!668172)))

(declare-fun call!70616 () ListLongMap!22269)

(declare-fun bm!70613 () Bool)

(assert (=> bm!70613 (= call!70616 (getCurrentListMapNoExtraKeys!6600 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549986 () Bool)

(assert (=> b!1549986 (= e!862805 false)))

(declare-fun lt!668178 () Bool)

(assert (=> b!1549986 (= lt!668178 (contains!10096 lt!668183 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549987 () Bool)

(declare-fun res!1061803 () Bool)

(assert (=> b!1549987 (=> (not res!1061803) (not e!862799))))

(assert (=> b!1549987 (= res!1061803 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50477 _keys!618))))))

(declare-fun bm!70614 () Bool)

(declare-fun call!70618 () ListLongMap!22269)

(assert (=> bm!70614 (= call!70618 call!70616)))

(declare-fun b!1549988 () Bool)

(declare-fun e!862796 () Bool)

(assert (=> b!1549988 (= e!862796 (= (apply!1089 lt!668183 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!436))))

(declare-fun b!1549984 () Bool)

(declare-fun e!862800 () Bool)

(declare-fun e!862802 () Bool)

(declare-fun mapRes!58894 () Bool)

(assert (=> b!1549984 (= e!862800 (and e!862802 mapRes!58894))))

(declare-fun condMapEmpty!58894 () Bool)

(declare-fun mapDefault!58894 () ValueCell!18153)

(assert (=> b!1549984 (= condMapEmpty!58894 (= (arr!49928 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18153)) mapDefault!58894)))))

(declare-fun res!1061796 () Bool)

(assert (=> start!132138 (=> (not res!1061796) (not e!862799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132138 (= res!1061796 (validMask!0 mask!926))))

(assert (=> start!132138 e!862799))

(declare-fun array_inv!38817 (array!103450) Bool)

(assert (=> start!132138 (array_inv!38817 _keys!618)))

(declare-fun tp_is_empty!38127 () Bool)

(assert (=> start!132138 tp_is_empty!38127))

(assert (=> start!132138 true))

(assert (=> start!132138 tp!111805))

(declare-fun array_inv!38818 (array!103452) Bool)

(assert (=> start!132138 (and (array_inv!38818 _values!470) e!862800)))

(declare-fun b!1549989 () Bool)

(declare-fun c!142487 () Bool)

(assert (=> b!1549989 (= c!142487 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668180))))

(declare-fun e!862801 () ListLongMap!22269)

(declare-fun e!862809 () ListLongMap!22269)

(assert (=> b!1549989 (= e!862801 e!862809)))

(declare-fun b!1549990 () Bool)

(declare-fun e!862808 () Bool)

(declare-fun e!862797 () Bool)

(assert (=> b!1549990 (= e!862808 e!862797)))

(declare-fun res!1061794 () Bool)

(assert (=> b!1549990 (=> (not res!1061794) (not e!862797))))

(assert (=> b!1549990 (= res!1061794 (contains!10096 lt!668183 (select (arr!49927 _keys!618) from!762)))))

(declare-fun call!70615 () ListLongMap!22269)

(declare-fun c!142490 () Bool)

(declare-fun call!70619 () ListLongMap!22269)

(declare-fun bm!70615 () Bool)

(declare-fun c!142488 () Bool)

(assert (=> bm!70615 (= call!70615 (+!4975 (ite c!142488 call!70616 (ite c!142490 call!70618 call!70619)) (ite (or c!142488 c!142490) (tuple2!24661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1549991 () Bool)

(declare-fun get!26000 (ValueCell!18153 V!59279) V!59279)

(declare-fun dynLambda!3799 (Int (_ BitVec 64)) V!59279)

(assert (=> b!1549991 (= e!862797 (= (apply!1089 lt!668183 (select (arr!49927 _keys!618) from!762)) (get!26000 (select (arr!49928 _values!470) from!762) (dynLambda!3799 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1549992 () Bool)

(assert (=> b!1549992 (= e!862799 e!862805)))

(declare-fun res!1061802 () Bool)

(assert (=> b!1549992 (=> (not res!1061802) (not e!862805))))

(assert (=> b!1549992 (= res!1061802 e!862808)))

(declare-fun res!1061799 () Bool)

(assert (=> b!1549992 (=> res!1061799 e!862808)))

(declare-fun lt!668173 () Bool)

(assert (=> b!1549992 (= res!1061799 lt!668173)))

(declare-fun lt!668179 () Unit!51637)

(assert (=> b!1549992 (= lt!668179 e!862798)))

(declare-fun c!142489 () Bool)

(assert (=> b!1549992 (= c!142489 (not lt!668173))))

(assert (=> b!1549992 (= lt!668173 e!862803)))

(declare-fun res!1061801 () Bool)

(assert (=> b!1549992 (=> res!1061801 e!862803)))

(assert (=> b!1549992 (= res!1061801 (bvsge from!762 (size!50477 _keys!618)))))

(declare-fun e!862807 () ListLongMap!22269)

(assert (=> b!1549992 (= lt!668183 e!862807)))

(assert (=> b!1549992 (= c!142488 (and (not lt!668180) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549992 (= lt!668180 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70616 () Bool)

(assert (=> bm!70616 (= call!70619 call!70618)))

(declare-fun b!1549993 () Bool)

(declare-fun res!1061805 () Bool)

(assert (=> b!1549993 (=> (not res!1061805) (not e!862805))))

(assert (=> b!1549993 (= res!1061805 (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549994 () Bool)

(declare-fun call!70617 () ListLongMap!22269)

(assert (=> b!1549994 (= e!862801 call!70617)))

(declare-fun b!1549995 () Bool)

(assert (=> b!1549995 (= e!862809 call!70619)))

(declare-fun b!1549996 () Bool)

(declare-fun res!1061795 () Bool)

(assert (=> b!1549996 (=> (not res!1061795) (not e!862799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103450 (_ BitVec 32)) Bool)

(assert (=> b!1549996 (= res!1061795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549997 () Bool)

(assert (=> b!1549997 (= e!862807 (+!4975 call!70615 (tuple2!24661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549998 () Bool)

(declare-fun Unit!51639 () Unit!51637)

(assert (=> b!1549998 (= e!862798 Unit!51639)))

(declare-fun b!1549999 () Bool)

(declare-fun res!1061804 () Bool)

(assert (=> b!1549999 (=> (not res!1061804) (not e!862799))))

(assert (=> b!1549999 (= res!1061804 (and (= (size!50478 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50477 _keys!618) (size!50478 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550000 () Bool)

(assert (=> b!1550000 (= e!862802 tp_is_empty!38127)))

(declare-fun b!1550001 () Bool)

(declare-fun e!862804 () Bool)

(assert (=> b!1550001 (= e!862804 tp_is_empty!38127)))

(declare-fun b!1550002 () Bool)

(assert (=> b!1550002 (= e!862806 (not call!70620))))

(declare-fun b!1550003 () Bool)

(assert (=> b!1550003 (= e!862807 e!862801)))

(assert (=> b!1550003 (= c!142490 (and (not lt!668180) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!58894 () Bool)

(declare-fun tp!111804 () Bool)

(assert (=> mapNonEmpty!58894 (= mapRes!58894 (and tp!111804 e!862804))))

(declare-fun mapKey!58894 () (_ BitVec 32))

(declare-fun mapValue!58894 () ValueCell!18153)

(declare-fun mapRest!58894 () (Array (_ BitVec 32) ValueCell!18153))

(assert (=> mapNonEmpty!58894 (= (arr!49928 _values!470) (store mapRest!58894 mapKey!58894 mapValue!58894))))

(declare-fun b!1550004 () Bool)

(assert (=> b!1550004 (= e!862809 call!70617)))

(declare-fun bm!70617 () Bool)

(assert (=> bm!70617 (= call!70617 call!70615)))

(declare-fun mapIsEmpty!58894 () Bool)

(assert (=> mapIsEmpty!58894 mapRes!58894))

(declare-fun b!1550005 () Bool)

(assert (=> b!1550005 (= e!862806 e!862796)))

(declare-fun res!1061798 () Bool)

(assert (=> b!1550005 (= res!1061798 call!70620)))

(assert (=> b!1550005 (=> (not res!1061798) (not e!862796))))

(assert (= (and start!132138 res!1061796) b!1549999))

(assert (= (and b!1549999 res!1061804) b!1549996))

(assert (= (and b!1549996 res!1061795) b!1549982))

(assert (= (and b!1549982 res!1061800) b!1549987))

(assert (= (and b!1549987 res!1061803) b!1549992))

(assert (= (and b!1549992 c!142488) b!1549997))

(assert (= (and b!1549992 (not c!142488)) b!1550003))

(assert (= (and b!1550003 c!142490) b!1549994))

(assert (= (and b!1550003 (not c!142490)) b!1549989))

(assert (= (and b!1549989 c!142487) b!1550004))

(assert (= (and b!1549989 (not c!142487)) b!1549995))

(assert (= (or b!1550004 b!1549995) bm!70616))

(assert (= (or b!1549994 bm!70616) bm!70614))

(assert (= (or b!1549994 b!1550004) bm!70617))

(assert (= (or b!1549997 bm!70614) bm!70613))

(assert (= (or b!1549997 bm!70617) bm!70615))

(assert (= (and b!1549992 (not res!1061801)) b!1549981))

(assert (= (and b!1549992 c!142489) b!1549985))

(assert (= (and b!1549992 (not c!142489)) b!1549998))

(assert (= (and b!1549992 (not res!1061799)) b!1549990))

(assert (= (and b!1549990 res!1061794) b!1549991))

(assert (= (and b!1549992 res!1061802) b!1549983))

(assert (= (and b!1549983 c!142486) b!1550005))

(assert (= (and b!1549983 (not c!142486)) b!1550002))

(assert (= (and b!1550005 res!1061798) b!1549988))

(assert (= (or b!1550005 b!1550002) bm!70612))

(assert (= (and b!1549983 res!1061797) b!1549993))

(assert (= (and b!1549993 res!1061805) b!1549986))

(assert (= (and b!1549984 condMapEmpty!58894) mapIsEmpty!58894))

(assert (= (and b!1549984 (not condMapEmpty!58894)) mapNonEmpty!58894))

(get-info :version)

(assert (= (and mapNonEmpty!58894 ((_ is ValueCellFull!18153) mapValue!58894)) b!1550001))

(assert (= (and b!1549984 ((_ is ValueCellFull!18153) mapDefault!58894)) b!1550000))

(assert (= start!132138 b!1549984))

(declare-fun b_lambda!24751 () Bool)

(assert (=> (not b_lambda!24751) (not b!1549991)))

(declare-fun t!50847 () Bool)

(declare-fun tb!12471 () Bool)

(assert (=> (and start!132138 (= defaultEntry!478 defaultEntry!478) t!50847) tb!12471))

(declare-fun result!26053 () Bool)

(assert (=> tb!12471 (= result!26053 tp_is_empty!38127)))

(assert (=> b!1549991 t!50847))

(declare-fun b_and!51271 () Bool)

(assert (= b_and!51269 (and (=> t!50847 result!26053) b_and!51271)))

(declare-fun m!1429095 () Bool)

(assert (=> b!1549981 m!1429095))

(assert (=> b!1549981 m!1429095))

(declare-fun m!1429097 () Bool)

(assert (=> b!1549981 m!1429097))

(declare-fun m!1429099 () Bool)

(assert (=> b!1549985 m!1429099))

(declare-fun m!1429101 () Bool)

(assert (=> b!1549985 m!1429101))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429103 () Bool)

(assert (=> b!1549985 m!1429103))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429105 () Bool)

(assert (=> b!1549985 m!1429105))

(declare-fun m!1429107 () Bool)

(assert (=> b!1549985 m!1429107))

(assert (=> b!1549985 m!1429101))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429109 () Bool)

(assert (=> b!1549985 m!1429109))

(assert (=> b!1549985 m!1429095))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429111 () Bool)

(assert (=> b!1549985 m!1429111))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429113 () Bool)

(assert (=> b!1549985 m!1429113))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429115 () Bool)

(assert (=> b!1549985 m!1429115))

(assert (=> b!1549985 m!1429095))

(declare-fun m!1429117 () Bool)

(assert (=> b!1549985 m!1429117))

(declare-fun m!1429119 () Bool)

(assert (=> start!132138 m!1429119))

(declare-fun m!1429121 () Bool)

(assert (=> start!132138 m!1429121))

(declare-fun m!1429123 () Bool)

(assert (=> start!132138 m!1429123))

(declare-fun m!1429125 () Bool)

(assert (=> bm!70615 m!1429125))

(declare-fun m!1429127 () Bool)

(assert (=> mapNonEmpty!58894 m!1429127))

(declare-fun m!1429129 () Bool)

(assert (=> b!1549996 m!1429129))

(declare-fun m!1429131 () Bool)

(assert (=> b!1549982 m!1429131))

(declare-fun m!1429133 () Bool)

(assert (=> b!1549988 m!1429133))

(assert (=> bm!70613 m!1429099))

(assert (=> b!1549990 m!1429095))

(assert (=> b!1549990 m!1429095))

(declare-fun m!1429135 () Bool)

(assert (=> b!1549990 m!1429135))

(declare-fun m!1429137 () Bool)

(assert (=> b!1549997 m!1429137))

(declare-fun m!1429139 () Bool)

(assert (=> bm!70612 m!1429139))

(assert (=> b!1549991 m!1429095))

(declare-fun m!1429141 () Bool)

(assert (=> b!1549991 m!1429141))

(declare-fun m!1429143 () Bool)

(assert (=> b!1549991 m!1429143))

(assert (=> b!1549991 m!1429141))

(declare-fun m!1429145 () Bool)

(assert (=> b!1549991 m!1429145))

(assert (=> b!1549991 m!1429095))

(declare-fun m!1429147 () Bool)

(assert (=> b!1549991 m!1429147))

(assert (=> b!1549991 m!1429143))

(declare-fun m!1429149 () Bool)

(assert (=> b!1549986 m!1429149))

(check-sat (not b!1549986) (not b!1549985) (not b!1549997) (not b!1549981) (not b!1549988) b_and!51271 (not mapNonEmpty!58894) (not b_next!31851) (not bm!70615) (not b!1549982) (not b!1549991) (not b!1549990) (not bm!70612) (not b!1549996) (not b_lambda!24751) tp_is_empty!38127 (not start!132138) (not bm!70613))
(check-sat b_and!51271 (not b_next!31851))
