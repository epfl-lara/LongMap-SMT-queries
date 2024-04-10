; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132024 () Bool)

(assert start!132024)

(declare-fun b_free!31737 () Bool)

(declare-fun b_next!31737 () Bool)

(assert (=> start!132024 (= b_free!31737 (not b_next!31737))))

(declare-fun tp!111463 () Bool)

(declare-fun b_and!51147 () Bool)

(assert (=> start!132024 (= tp!111463 b_and!51147)))

(declare-fun b!1547129 () Bool)

(declare-fun res!1060549 () Bool)

(declare-fun e!861173 () Bool)

(assert (=> b!1547129 (=> (not res!1060549) (not e!861173))))

(declare-datatypes ((array!103226 0))(
  ( (array!103227 (arr!49815 (Array (_ BitVec 32) (_ BitVec 64))) (size!50365 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103226)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547129 (= res!1060549 (validKeyInArray!0 (select (arr!49815 _keys!618) from!762)))))

(declare-fun b!1547130 () Bool)

(declare-fun c!141947 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666778 () Bool)

(assert (=> b!1547130 (= c!141947 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666778))))

(declare-datatypes ((V!59127 0))(
  ( (V!59128 (val!19084 Int)) )
))
(declare-datatypes ((tuple2!24548 0))(
  ( (tuple2!24549 (_1!12285 (_ BitVec 64)) (_2!12285 V!59127)) )
))
(declare-datatypes ((List!36048 0))(
  ( (Nil!36045) (Cons!36044 (h!37489 tuple2!24548) (t!50742 List!36048)) )
))
(declare-datatypes ((ListLongMap!22157 0))(
  ( (ListLongMap!22158 (toList!11094 List!36048)) )
))
(declare-fun e!861179 () ListLongMap!22157)

(declare-fun e!861175 () ListLongMap!22157)

(assert (=> b!1547130 (= e!861179 e!861175)))

(declare-fun b!1547131 () Bool)

(declare-fun res!1060546 () Bool)

(declare-fun e!861180 () Bool)

(assert (=> b!1547131 (=> (not res!1060546) (not e!861180))))

(declare-datatypes ((List!36049 0))(
  ( (Nil!36046) (Cons!36045 (h!37490 (_ BitVec 64)) (t!50743 List!36049)) )
))
(declare-fun arrayNoDuplicates!0 (array!103226 (_ BitVec 32) List!36049) Bool)

(assert (=> b!1547131 (= res!1060546 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36046))))

(declare-fun b!1547132 () Bool)

(declare-fun e!861176 () Bool)

(declare-fun tp_is_empty!38013 () Bool)

(assert (=> b!1547132 (= e!861176 tp_is_empty!38013)))

(declare-fun b!1547133 () Bool)

(assert (=> b!1547133 (= e!861173 (not true))))

(declare-fun lt!666781 () ListLongMap!22157)

(declare-fun minValue!436 () V!59127)

(declare-fun apply!1047 (ListLongMap!22157 (_ BitVec 64)) V!59127)

(declare-fun +!4925 (ListLongMap!22157 tuple2!24548) ListLongMap!22157)

(assert (=> b!1547133 (= (apply!1047 (+!4925 lt!666781 (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49815 _keys!618) from!762)) (apply!1047 lt!666781 (select (arr!49815 _keys!618) from!762)))))

(declare-datatypes ((Unit!51544 0))(
  ( (Unit!51545) )
))
(declare-fun lt!666782 () Unit!51544)

(declare-fun addApplyDifferent!589 (ListLongMap!22157 (_ BitVec 64) V!59127 (_ BitVec 64)) Unit!51544)

(assert (=> b!1547133 (= lt!666782 (addApplyDifferent!589 lt!666781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49815 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59127)

(declare-fun contains!10054 (ListLongMap!22157 (_ BitVec 64)) Bool)

(assert (=> b!1547133 (contains!10054 (+!4925 lt!666781 (tuple2!24549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49815 _keys!618) from!762))))

(declare-fun lt!666780 () Unit!51544)

(declare-fun addStillContains!1242 (ListLongMap!22157 (_ BitVec 64) V!59127 (_ BitVec 64)) Unit!51544)

(assert (=> b!1547133 (= lt!666780 (addStillContains!1242 lt!666781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49815 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18096 0))(
  ( (ValueCellFull!18096 (v!21885 V!59127)) (EmptyCell!18096) )
))
(declare-datatypes ((array!103228 0))(
  ( (array!103229 (arr!49816 (Array (_ BitVec 32) ValueCell!18096)) (size!50366 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103228)

(declare-fun getCurrentListMapNoExtraKeys!6554 (array!103226 array!103228 (_ BitVec 32) (_ BitVec 32) V!59127 V!59127 (_ BitVec 32) Int) ListLongMap!22157)

(assert (=> b!1547133 (= lt!666781 (getCurrentListMapNoExtraKeys!6554 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547134 () Bool)

(declare-fun call!69756 () ListLongMap!22157)

(assert (=> b!1547134 (= e!861175 call!69756)))

(declare-fun b!1547135 () Bool)

(declare-fun res!1060545 () Bool)

(assert (=> b!1547135 (=> (not res!1060545) (not e!861180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103226 (_ BitVec 32)) Bool)

(assert (=> b!1547135 (= res!1060545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547136 () Bool)

(assert (=> b!1547136 (= e!861180 e!861173)))

(declare-fun res!1060548 () Bool)

(assert (=> b!1547136 (=> (not res!1060548) (not e!861173))))

(assert (=> b!1547136 (= res!1060548 (bvslt from!762 (size!50365 _keys!618)))))

(declare-fun lt!666779 () ListLongMap!22157)

(declare-fun e!861172 () ListLongMap!22157)

(assert (=> b!1547136 (= lt!666779 e!861172)))

(declare-fun c!141946 () Bool)

(assert (=> b!1547136 (= c!141946 (and (not lt!666778) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547136 (= lt!666778 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547137 () Bool)

(declare-fun e!861174 () Bool)

(declare-fun e!861178 () Bool)

(declare-fun mapRes!58723 () Bool)

(assert (=> b!1547137 (= e!861174 (and e!861178 mapRes!58723))))

(declare-fun condMapEmpty!58723 () Bool)

(declare-fun mapDefault!58723 () ValueCell!18096)

(assert (=> b!1547137 (= condMapEmpty!58723 (= (arr!49816 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18096)) mapDefault!58723)))))

(declare-fun bm!69752 () Bool)

(declare-fun call!69758 () ListLongMap!22157)

(assert (=> bm!69752 (= call!69756 call!69758)))

(declare-fun b!1547138 () Bool)

(assert (=> b!1547138 (= e!861178 tp_is_empty!38013)))

(declare-fun b!1547139 () Bool)

(declare-fun call!69755 () ListLongMap!22157)

(assert (=> b!1547139 (= e!861179 call!69755)))

(declare-fun b!1547140 () Bool)

(declare-fun res!1060550 () Bool)

(assert (=> b!1547140 (=> (not res!1060550) (not e!861180))))

(assert (=> b!1547140 (= res!1060550 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50365 _keys!618))))))

(declare-fun b!1547141 () Bool)

(assert (=> b!1547141 (= e!861175 call!69755)))

(declare-fun mapNonEmpty!58723 () Bool)

(declare-fun tp!111462 () Bool)

(assert (=> mapNonEmpty!58723 (= mapRes!58723 (and tp!111462 e!861176))))

(declare-fun mapRest!58723 () (Array (_ BitVec 32) ValueCell!18096))

(declare-fun mapKey!58723 () (_ BitVec 32))

(declare-fun mapValue!58723 () ValueCell!18096)

(assert (=> mapNonEmpty!58723 (= (arr!49816 _values!470) (store mapRest!58723 mapKey!58723 mapValue!58723))))

(declare-fun b!1547142 () Bool)

(declare-fun call!69759 () ListLongMap!22157)

(assert (=> b!1547142 (= e!861172 (+!4925 call!69759 (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69754 () Bool)

(declare-fun c!141945 () Bool)

(declare-fun call!69757 () ListLongMap!22157)

(assert (=> bm!69754 (= call!69759 (+!4925 (ite c!141946 call!69757 (ite c!141945 call!69758 call!69756)) (ite (or c!141946 c!141945) (tuple2!24549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547143 () Bool)

(declare-fun res!1060547 () Bool)

(assert (=> b!1547143 (=> (not res!1060547) (not e!861180))))

(assert (=> b!1547143 (= res!1060547 (and (= (size!50366 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50365 _keys!618) (size!50366 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69755 () Bool)

(assert (=> bm!69755 (= call!69757 (getCurrentListMapNoExtraKeys!6554 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69756 () Bool)

(assert (=> bm!69756 (= call!69758 call!69757)))

(declare-fun mapIsEmpty!58723 () Bool)

(assert (=> mapIsEmpty!58723 mapRes!58723))

(declare-fun b!1547144 () Bool)

(assert (=> b!1547144 (= e!861172 e!861179)))

(assert (=> b!1547144 (= c!141945 (and (not lt!666778) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69753 () Bool)

(assert (=> bm!69753 (= call!69755 call!69759)))

(declare-fun res!1060551 () Bool)

(assert (=> start!132024 (=> (not res!1060551) (not e!861180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132024 (= res!1060551 (validMask!0 mask!926))))

(assert (=> start!132024 e!861180))

(declare-fun array_inv!38743 (array!103226) Bool)

(assert (=> start!132024 (array_inv!38743 _keys!618)))

(assert (=> start!132024 tp_is_empty!38013))

(assert (=> start!132024 true))

(assert (=> start!132024 tp!111463))

(declare-fun array_inv!38744 (array!103228) Bool)

(assert (=> start!132024 (and (array_inv!38744 _values!470) e!861174)))

(assert (= (and start!132024 res!1060551) b!1547143))

(assert (= (and b!1547143 res!1060547) b!1547135))

(assert (= (and b!1547135 res!1060545) b!1547131))

(assert (= (and b!1547131 res!1060546) b!1547140))

(assert (= (and b!1547140 res!1060550) b!1547136))

(assert (= (and b!1547136 c!141946) b!1547142))

(assert (= (and b!1547136 (not c!141946)) b!1547144))

(assert (= (and b!1547144 c!141945) b!1547139))

(assert (= (and b!1547144 (not c!141945)) b!1547130))

(assert (= (and b!1547130 c!141947) b!1547141))

(assert (= (and b!1547130 (not c!141947)) b!1547134))

(assert (= (or b!1547141 b!1547134) bm!69752))

(assert (= (or b!1547139 bm!69752) bm!69756))

(assert (= (or b!1547139 b!1547141) bm!69753))

(assert (= (or b!1547142 bm!69756) bm!69755))

(assert (= (or b!1547142 bm!69753) bm!69754))

(assert (= (and b!1547136 res!1060548) b!1547129))

(assert (= (and b!1547129 res!1060549) b!1547133))

(assert (= (and b!1547137 condMapEmpty!58723) mapIsEmpty!58723))

(assert (= (and b!1547137 (not condMapEmpty!58723)) mapNonEmpty!58723))

(get-info :version)

(assert (= (and mapNonEmpty!58723 ((_ is ValueCellFull!18096) mapValue!58723)) b!1547132))

(assert (= (and b!1547137 ((_ is ValueCellFull!18096) mapDefault!58723)) b!1547138))

(assert (= start!132024 b!1547137))

(declare-fun m!1426825 () Bool)

(assert (=> b!1547131 m!1426825))

(declare-fun m!1426827 () Bool)

(assert (=> bm!69755 m!1426827))

(declare-fun m!1426829 () Bool)

(assert (=> bm!69754 m!1426829))

(declare-fun m!1426831 () Bool)

(assert (=> b!1547142 m!1426831))

(declare-fun m!1426833 () Bool)

(assert (=> b!1547135 m!1426833))

(declare-fun m!1426835 () Bool)

(assert (=> mapNonEmpty!58723 m!1426835))

(declare-fun m!1426837 () Bool)

(assert (=> start!132024 m!1426837))

(declare-fun m!1426839 () Bool)

(assert (=> start!132024 m!1426839))

(declare-fun m!1426841 () Bool)

(assert (=> start!132024 m!1426841))

(declare-fun m!1426843 () Bool)

(assert (=> b!1547129 m!1426843))

(assert (=> b!1547129 m!1426843))

(declare-fun m!1426845 () Bool)

(assert (=> b!1547129 m!1426845))

(declare-fun m!1426847 () Bool)

(assert (=> b!1547133 m!1426847))

(assert (=> b!1547133 m!1426843))

(declare-fun m!1426849 () Bool)

(assert (=> b!1547133 m!1426849))

(declare-fun m!1426851 () Bool)

(assert (=> b!1547133 m!1426851))

(assert (=> b!1547133 m!1426827))

(assert (=> b!1547133 m!1426843))

(assert (=> b!1547133 m!1426843))

(declare-fun m!1426853 () Bool)

(assert (=> b!1547133 m!1426853))

(assert (=> b!1547133 m!1426843))

(declare-fun m!1426855 () Bool)

(assert (=> b!1547133 m!1426855))

(assert (=> b!1547133 m!1426843))

(declare-fun m!1426857 () Bool)

(assert (=> b!1547133 m!1426857))

(assert (=> b!1547133 m!1426847))

(assert (=> b!1547133 m!1426851))

(assert (=> b!1547133 m!1426843))

(declare-fun m!1426859 () Bool)

(assert (=> b!1547133 m!1426859))

(check-sat tp_is_empty!38013 (not b!1547131) (not bm!69754) b_and!51147 (not b!1547133) (not bm!69755) (not mapNonEmpty!58723) (not b_next!31737) (not b!1547142) (not b!1547129) (not start!132024) (not b!1547135))
(check-sat b_and!51147 (not b_next!31737))
