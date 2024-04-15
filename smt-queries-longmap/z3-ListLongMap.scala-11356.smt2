; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131990 () Bool)

(assert start!131990)

(declare-fun b_free!31753 () Bool)

(declare-fun b_next!31753 () Bool)

(assert (=> start!131990 (= b_free!31753 (not b_next!31753))))

(declare-fun tp!111512 () Bool)

(declare-fun b_and!51145 () Bool)

(assert (=> start!131990 (= tp!111512 b_and!51145)))

(declare-fun bm!69837 () Bool)

(declare-datatypes ((V!59149 0))(
  ( (V!59150 (val!19092 Int)) )
))
(declare-datatypes ((tuple2!24640 0))(
  ( (tuple2!24641 (_1!12331 (_ BitVec 64)) (_2!12331 V!59149)) )
))
(declare-datatypes ((List!36109 0))(
  ( (Nil!36106) (Cons!36105 (h!37551 tuple2!24640) (t!50795 List!36109)) )
))
(declare-datatypes ((ListLongMap!22249 0))(
  ( (ListLongMap!22250 (toList!11140 List!36109)) )
))
(declare-fun call!69843 () ListLongMap!22249)

(declare-fun call!69841 () ListLongMap!22249)

(assert (=> bm!69837 (= call!69843 call!69841)))

(declare-fun b!1547200 () Bool)

(declare-fun e!861192 () ListLongMap!22249)

(declare-fun call!69844 () ListLongMap!22249)

(declare-fun minValue!436 () V!59149)

(declare-fun +!4966 (ListLongMap!22249 tuple2!24640) ListLongMap!22249)

(assert (=> b!1547200 (= e!861192 (+!4966 call!69844 (tuple2!24641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547201 () Bool)

(declare-fun res!1060584 () Bool)

(declare-fun e!861191 () Bool)

(assert (=> b!1547201 (=> (not res!1060584) (not e!861191))))

(declare-datatypes ((array!103188 0))(
  ( (array!103189 (arr!49797 (Array (_ BitVec 32) (_ BitVec 64))) (size!50349 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103188)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18104 0))(
  ( (ValueCellFull!18104 (v!21889 V!59149)) (EmptyCell!18104) )
))
(declare-datatypes ((array!103190 0))(
  ( (array!103191 (arr!49798 (Array (_ BitVec 32) ValueCell!18104)) (size!50350 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103190)

(assert (=> b!1547201 (= res!1060584 (and (= (size!50350 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50349 _keys!618) (size!50350 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547202 () Bool)

(declare-fun c!141930 () Bool)

(declare-fun lt!666613 () Bool)

(assert (=> b!1547202 (= c!141930 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666613))))

(declare-fun e!861190 () ListLongMap!22249)

(declare-fun e!861198 () ListLongMap!22249)

(assert (=> b!1547202 (= e!861190 e!861198)))

(declare-fun b!1547203 () Bool)

(declare-fun e!861195 () Bool)

(assert (=> b!1547203 (= e!861195 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666612 () ListLongMap!22249)

(declare-fun apply!1050 (ListLongMap!22249 (_ BitVec 64)) V!59149)

(assert (=> b!1547203 (= (apply!1050 (+!4966 lt!666612 (tuple2!24641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49797 _keys!618) from!762)) (apply!1050 lt!666612 (select (arr!49797 _keys!618) from!762)))))

(declare-datatypes ((Unit!51397 0))(
  ( (Unit!51398) )
))
(declare-fun lt!666616 () Unit!51397)

(declare-fun addApplyDifferent!588 (ListLongMap!22249 (_ BitVec 64) V!59149 (_ BitVec 64)) Unit!51397)

(assert (=> b!1547203 (= lt!666616 (addApplyDifferent!588 lt!666612 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49797 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59149)

(declare-fun contains!10025 (ListLongMap!22249 (_ BitVec 64)) Bool)

(assert (=> b!1547203 (contains!10025 (+!4966 lt!666612 (tuple2!24641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49797 _keys!618) from!762))))

(declare-fun lt!666615 () Unit!51397)

(declare-fun addStillContains!1248 (ListLongMap!22249 (_ BitVec 64) V!59149 (_ BitVec 64)) Unit!51397)

(assert (=> b!1547203 (= lt!666615 (addStillContains!1248 lt!666612 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49797 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6594 (array!103188 array!103190 (_ BitVec 32) (_ BitVec 32) V!59149 V!59149 (_ BitVec 32) Int) ListLongMap!22249)

(assert (=> b!1547203 (= lt!666612 (getCurrentListMapNoExtraKeys!6594 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547204 () Bool)

(declare-fun e!861194 () Bool)

(declare-fun tp_is_empty!38029 () Bool)

(assert (=> b!1547204 (= e!861194 tp_is_empty!38029)))

(declare-fun b!1547205 () Bool)

(declare-fun call!69842 () ListLongMap!22249)

(assert (=> b!1547205 (= e!861198 call!69842)))

(declare-fun b!1547206 () Bool)

(assert (=> b!1547206 (= e!861198 call!69843)))

(declare-fun b!1547207 () Bool)

(assert (=> b!1547207 (= e!861190 call!69842)))

(declare-fun b!1547208 () Bool)

(declare-fun e!861196 () Bool)

(assert (=> b!1547208 (= e!861196 tp_is_empty!38029)))

(declare-fun b!1547209 () Bool)

(assert (=> b!1547209 (= e!861192 e!861190)))

(declare-fun c!141929 () Bool)

(assert (=> b!1547209 (= c!141929 (and (not lt!666613) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547210 () Bool)

(declare-fun res!1060586 () Bool)

(assert (=> b!1547210 (=> (not res!1060586) (not e!861195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547210 (= res!1060586 (validKeyInArray!0 (select (arr!49797 _keys!618) from!762)))))

(declare-fun b!1547211 () Bool)

(declare-fun res!1060588 () Bool)

(assert (=> b!1547211 (=> (not res!1060588) (not e!861191))))

(assert (=> b!1547211 (= res!1060588 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50349 _keys!618))))))

(declare-fun b!1547212 () Bool)

(assert (=> b!1547212 (= e!861191 e!861195)))

(declare-fun res!1060589 () Bool)

(assert (=> b!1547212 (=> (not res!1060589) (not e!861195))))

(assert (=> b!1547212 (= res!1060589 (bvslt from!762 (size!50349 _keys!618)))))

(declare-fun lt!666614 () ListLongMap!22249)

(assert (=> b!1547212 (= lt!666614 e!861192)))

(declare-fun c!141928 () Bool)

(assert (=> b!1547212 (= c!141928 (and (not lt!666613) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547212 (= lt!666613 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547213 () Bool)

(declare-fun e!861193 () Bool)

(declare-fun mapRes!58747 () Bool)

(assert (=> b!1547213 (= e!861193 (and e!861196 mapRes!58747))))

(declare-fun condMapEmpty!58747 () Bool)

(declare-fun mapDefault!58747 () ValueCell!18104)

(assert (=> b!1547213 (= condMapEmpty!58747 (= (arr!49798 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18104)) mapDefault!58747)))))

(declare-fun b!1547214 () Bool)

(declare-fun res!1060587 () Bool)

(assert (=> b!1547214 (=> (not res!1060587) (not e!861191))))

(declare-datatypes ((List!36110 0))(
  ( (Nil!36107) (Cons!36106 (h!37552 (_ BitVec 64)) (t!50796 List!36110)) )
))
(declare-fun arrayNoDuplicates!0 (array!103188 (_ BitVec 32) List!36110) Bool)

(assert (=> b!1547214 (= res!1060587 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36107))))

(declare-fun bm!69839 () Bool)

(assert (=> bm!69839 (= call!69842 call!69844)))

(declare-fun b!1547215 () Bool)

(declare-fun res!1060590 () Bool)

(assert (=> b!1547215 (=> (not res!1060590) (not e!861191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103188 (_ BitVec 32)) Bool)

(assert (=> b!1547215 (= res!1060590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58747 () Bool)

(declare-fun tp!111511 () Bool)

(assert (=> mapNonEmpty!58747 (= mapRes!58747 (and tp!111511 e!861194))))

(declare-fun mapRest!58747 () (Array (_ BitVec 32) ValueCell!18104))

(declare-fun mapValue!58747 () ValueCell!18104)

(declare-fun mapKey!58747 () (_ BitVec 32))

(assert (=> mapNonEmpty!58747 (= (arr!49798 _values!470) (store mapRest!58747 mapKey!58747 mapValue!58747))))

(declare-fun bm!69838 () Bool)

(declare-fun call!69840 () ListLongMap!22249)

(assert (=> bm!69838 (= call!69841 call!69840)))

(declare-fun res!1060585 () Bool)

(assert (=> start!131990 (=> (not res!1060585) (not e!861191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131990 (= res!1060585 (validMask!0 mask!926))))

(assert (=> start!131990 e!861191))

(declare-fun array_inv!38931 (array!103188) Bool)

(assert (=> start!131990 (array_inv!38931 _keys!618)))

(assert (=> start!131990 tp_is_empty!38029))

(assert (=> start!131990 true))

(assert (=> start!131990 tp!111512))

(declare-fun array_inv!38932 (array!103190) Bool)

(assert (=> start!131990 (and (array_inv!38932 _values!470) e!861193)))

(declare-fun bm!69840 () Bool)

(assert (=> bm!69840 (= call!69844 (+!4966 (ite c!141928 call!69840 (ite c!141929 call!69841 call!69843)) (ite (or c!141928 c!141929) (tuple2!24641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69841 () Bool)

(assert (=> bm!69841 (= call!69840 (getCurrentListMapNoExtraKeys!6594 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58747 () Bool)

(assert (=> mapIsEmpty!58747 mapRes!58747))

(assert (= (and start!131990 res!1060585) b!1547201))

(assert (= (and b!1547201 res!1060584) b!1547215))

(assert (= (and b!1547215 res!1060590) b!1547214))

(assert (= (and b!1547214 res!1060587) b!1547211))

(assert (= (and b!1547211 res!1060588) b!1547212))

(assert (= (and b!1547212 c!141928) b!1547200))

(assert (= (and b!1547212 (not c!141928)) b!1547209))

(assert (= (and b!1547209 c!141929) b!1547207))

(assert (= (and b!1547209 (not c!141929)) b!1547202))

(assert (= (and b!1547202 c!141930) b!1547205))

(assert (= (and b!1547202 (not c!141930)) b!1547206))

(assert (= (or b!1547205 b!1547206) bm!69837))

(assert (= (or b!1547207 bm!69837) bm!69838))

(assert (= (or b!1547207 b!1547205) bm!69839))

(assert (= (or b!1547200 bm!69838) bm!69841))

(assert (= (or b!1547200 bm!69839) bm!69840))

(assert (= (and b!1547212 res!1060589) b!1547210))

(assert (= (and b!1547210 res!1060586) b!1547203))

(assert (= (and b!1547213 condMapEmpty!58747) mapIsEmpty!58747))

(assert (= (and b!1547213 (not condMapEmpty!58747)) mapNonEmpty!58747))

(get-info :version)

(assert (= (and mapNonEmpty!58747 ((_ is ValueCellFull!18104) mapValue!58747)) b!1547204))

(assert (= (and b!1547213 ((_ is ValueCellFull!18104) mapDefault!58747)) b!1547208))

(assert (= start!131990 b!1547213))

(declare-fun m!1426221 () Bool)

(assert (=> bm!69840 m!1426221))

(declare-fun m!1426223 () Bool)

(assert (=> b!1547214 m!1426223))

(declare-fun m!1426225 () Bool)

(assert (=> bm!69841 m!1426225))

(declare-fun m!1426227 () Bool)

(assert (=> mapNonEmpty!58747 m!1426227))

(declare-fun m!1426229 () Bool)

(assert (=> b!1547200 m!1426229))

(declare-fun m!1426231 () Bool)

(assert (=> b!1547210 m!1426231))

(assert (=> b!1547210 m!1426231))

(declare-fun m!1426233 () Bool)

(assert (=> b!1547210 m!1426233))

(declare-fun m!1426235 () Bool)

(assert (=> b!1547203 m!1426235))

(assert (=> b!1547203 m!1426231))

(declare-fun m!1426237 () Bool)

(assert (=> b!1547203 m!1426237))

(assert (=> b!1547203 m!1426231))

(declare-fun m!1426239 () Bool)

(assert (=> b!1547203 m!1426239))

(declare-fun m!1426241 () Bool)

(assert (=> b!1547203 m!1426241))

(assert (=> b!1547203 m!1426231))

(declare-fun m!1426243 () Bool)

(assert (=> b!1547203 m!1426243))

(assert (=> b!1547203 m!1426241))

(assert (=> b!1547203 m!1426235))

(assert (=> b!1547203 m!1426231))

(declare-fun m!1426245 () Bool)

(assert (=> b!1547203 m!1426245))

(assert (=> b!1547203 m!1426225))

(assert (=> b!1547203 m!1426231))

(assert (=> b!1547203 m!1426231))

(declare-fun m!1426247 () Bool)

(assert (=> b!1547203 m!1426247))

(declare-fun m!1426249 () Bool)

(assert (=> b!1547215 m!1426249))

(declare-fun m!1426251 () Bool)

(assert (=> start!131990 m!1426251))

(declare-fun m!1426253 () Bool)

(assert (=> start!131990 m!1426253))

(declare-fun m!1426255 () Bool)

(assert (=> start!131990 m!1426255))

(check-sat b_and!51145 (not bm!69840) (not b!1547214) (not b!1547203) (not mapNonEmpty!58747) (not b!1547200) (not b!1547210) (not b!1547215) tp_is_empty!38029 (not start!131990) (not bm!69841) (not b_next!31753))
(check-sat b_and!51145 (not b_next!31753))
