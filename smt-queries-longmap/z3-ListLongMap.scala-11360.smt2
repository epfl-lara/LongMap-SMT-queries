; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132476 () Bool)

(assert start!132476)

(declare-fun b_free!31777 () Bool)

(declare-fun b_next!31777 () Bool)

(assert (=> start!132476 (= b_free!31777 (not b_next!31777))))

(declare-fun tp!111582 () Bool)

(declare-fun b_and!51189 () Bool)

(assert (=> start!132476 (= tp!111582 b_and!51189)))

(declare-fun b!1550525 () Bool)

(declare-fun res!1061827 () Bool)

(declare-fun e!863221 () Bool)

(assert (=> b!1550525 (=> (not res!1061827) (not e!863221))))

(declare-datatypes ((array!103432 0))(
  ( (array!103433 (arr!49911 (Array (_ BitVec 32) (_ BitVec 64))) (size!50462 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103432)

(declare-datatypes ((List!36123 0))(
  ( (Nil!36120) (Cons!36119 (h!37582 (_ BitVec 64)) (t!50809 List!36123)) )
))
(declare-fun arrayNoDuplicates!0 (array!103432 (_ BitVec 32) List!36123) Bool)

(assert (=> b!1550525 (= res!1061827 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36120))))

(declare-datatypes ((V!59181 0))(
  ( (V!59182 (val!19104 Int)) )
))
(declare-fun zeroValue!436 () V!59181)

(declare-datatypes ((tuple2!24648 0))(
  ( (tuple2!24649 (_1!12335 (_ BitVec 64)) (_2!12335 V!59181)) )
))
(declare-datatypes ((List!36124 0))(
  ( (Nil!36121) (Cons!36120 (h!37583 tuple2!24648) (t!50810 List!36124)) )
))
(declare-datatypes ((ListLongMap!22265 0))(
  ( (ListLongMap!22266 (toList!11148 List!36124)) )
))
(declare-fun call!70209 () ListLongMap!22265)

(declare-fun call!70206 () ListLongMap!22265)

(declare-fun c!142926 () Bool)

(declare-fun call!70208 () ListLongMap!22265)

(declare-fun call!70205 () ListLongMap!22265)

(declare-fun bm!70202 () Bool)

(declare-fun c!142927 () Bool)

(declare-fun minValue!436 () V!59181)

(declare-fun +!4991 (ListLongMap!22265 tuple2!24648) ListLongMap!22265)

(assert (=> bm!70202 (= call!70205 (+!4991 (ite c!142927 call!70209 (ite c!142926 call!70206 call!70208)) (ite (or c!142927 c!142926) (tuple2!24649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550526 () Bool)

(declare-fun e!863225 () Bool)

(assert (=> b!1550526 (= e!863225 (not true))))

(declare-fun lt!668009 () ListLongMap!22265)

(declare-fun lt!668006 () V!59181)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun apply!1072 (ListLongMap!22265 (_ BitVec 64)) V!59181)

(assert (=> b!1550526 (= (apply!1072 lt!668009 (select (arr!49911 _keys!618) from!762)) lt!668006)))

(declare-fun lt!668004 () ListLongMap!22265)

(declare-datatypes ((Unit!51509 0))(
  ( (Unit!51510) )
))
(declare-fun lt!668010 () Unit!51509)

(declare-fun addApplyDifferent!601 (ListLongMap!22265 (_ BitVec 64) V!59181 (_ BitVec 64)) Unit!51509)

(assert (=> b!1550526 (= lt!668010 (addApplyDifferent!601 lt!668004 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49911 _keys!618) from!762)))))

(declare-fun lt!668008 () V!59181)

(assert (=> b!1550526 (= lt!668008 lt!668006)))

(assert (=> b!1550526 (= lt!668006 (apply!1072 lt!668004 (select (arr!49911 _keys!618) from!762)))))

(assert (=> b!1550526 (= lt!668008 (apply!1072 (+!4991 lt!668004 (tuple2!24649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49911 _keys!618) from!762)))))

(declare-fun lt!668007 () Unit!51509)

(assert (=> b!1550526 (= lt!668007 (addApplyDifferent!601 lt!668004 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49911 _keys!618) from!762)))))

(declare-fun contains!10120 (ListLongMap!22265 (_ BitVec 64)) Bool)

(assert (=> b!1550526 (contains!10120 lt!668009 (select (arr!49911 _keys!618) from!762))))

(assert (=> b!1550526 (= lt!668009 (+!4991 lt!668004 (tuple2!24649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668011 () Unit!51509)

(declare-fun addStillContains!1262 (ListLongMap!22265 (_ BitVec 64) V!59181 (_ BitVec 64)) Unit!51509)

(assert (=> b!1550526 (= lt!668011 (addStillContains!1262 lt!668004 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49911 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18116 0))(
  ( (ValueCellFull!18116 (v!21897 V!59181)) (EmptyCell!18116) )
))
(declare-datatypes ((array!103434 0))(
  ( (array!103435 (arr!49912 (Array (_ BitVec 32) ValueCell!18116)) (size!50463 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103434)

(declare-fun getCurrentListMapNoExtraKeys!6621 (array!103432 array!103434 (_ BitVec 32) (_ BitVec 32) V!59181 V!59181 (_ BitVec 32) Int) ListLongMap!22265)

(assert (=> b!1550526 (= lt!668004 (getCurrentListMapNoExtraKeys!6621 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550527 () Bool)

(declare-fun e!863226 () ListLongMap!22265)

(declare-fun call!70207 () ListLongMap!22265)

(assert (=> b!1550527 (= e!863226 call!70207)))

(declare-fun mapNonEmpty!58783 () Bool)

(declare-fun mapRes!58783 () Bool)

(declare-fun tp!111583 () Bool)

(declare-fun e!863227 () Bool)

(assert (=> mapNonEmpty!58783 (= mapRes!58783 (and tp!111583 e!863227))))

(declare-fun mapRest!58783 () (Array (_ BitVec 32) ValueCell!18116))

(declare-fun mapKey!58783 () (_ BitVec 32))

(declare-fun mapValue!58783 () ValueCell!18116)

(assert (=> mapNonEmpty!58783 (= (arr!49912 _values!470) (store mapRest!58783 mapKey!58783 mapValue!58783))))

(declare-fun bm!70203 () Bool)

(assert (=> bm!70203 (= call!70206 call!70209)))

(declare-fun b!1550528 () Bool)

(declare-fun e!863222 () Bool)

(declare-fun e!863229 () Bool)

(assert (=> b!1550528 (= e!863222 (and e!863229 mapRes!58783))))

(declare-fun condMapEmpty!58783 () Bool)

(declare-fun mapDefault!58783 () ValueCell!18116)

(assert (=> b!1550528 (= condMapEmpty!58783 (= (arr!49912 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18116)) mapDefault!58783)))))

(declare-fun bm!70204 () Bool)

(assert (=> bm!70204 (= call!70208 call!70206)))

(declare-fun res!1061831 () Bool)

(assert (=> start!132476 (=> (not res!1061831) (not e!863221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132476 (= res!1061831 (validMask!0 mask!926))))

(assert (=> start!132476 e!863221))

(declare-fun array_inv!39075 (array!103432) Bool)

(assert (=> start!132476 (array_inv!39075 _keys!618)))

(declare-fun tp_is_empty!38053 () Bool)

(assert (=> start!132476 tp_is_empty!38053))

(assert (=> start!132476 true))

(assert (=> start!132476 tp!111582))

(declare-fun array_inv!39076 (array!103434) Bool)

(assert (=> start!132476 (and (array_inv!39076 _values!470) e!863222)))

(declare-fun b!1550529 () Bool)

(declare-fun c!142925 () Bool)

(declare-fun lt!668005 () Bool)

(assert (=> b!1550529 (= c!142925 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668005))))

(declare-fun e!863228 () ListLongMap!22265)

(assert (=> b!1550529 (= e!863226 e!863228)))

(declare-fun b!1550530 () Bool)

(declare-fun e!863224 () ListLongMap!22265)

(assert (=> b!1550530 (= e!863224 (+!4991 call!70205 (tuple2!24649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70205 () Bool)

(assert (=> bm!70205 (= call!70207 call!70205)))

(declare-fun b!1550531 () Bool)

(assert (=> b!1550531 (= e!863227 tp_is_empty!38053)))

(declare-fun b!1550532 () Bool)

(declare-fun res!1061826 () Bool)

(assert (=> b!1550532 (=> (not res!1061826) (not e!863221))))

(assert (=> b!1550532 (= res!1061826 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50462 _keys!618))))))

(declare-fun b!1550533 () Bool)

(assert (=> b!1550533 (= e!863224 e!863226)))

(assert (=> b!1550533 (= c!142926 (and (not lt!668005) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550534 () Bool)

(declare-fun res!1061830 () Bool)

(assert (=> b!1550534 (=> (not res!1061830) (not e!863225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550534 (= res!1061830 (validKeyInArray!0 (select (arr!49911 _keys!618) from!762)))))

(declare-fun b!1550535 () Bool)

(assert (=> b!1550535 (= e!863229 tp_is_empty!38053)))

(declare-fun b!1550536 () Bool)

(declare-fun res!1061829 () Bool)

(assert (=> b!1550536 (=> (not res!1061829) (not e!863221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103432 (_ BitVec 32)) Bool)

(assert (=> b!1550536 (= res!1061829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550537 () Bool)

(assert (=> b!1550537 (= e!863228 call!70207)))

(declare-fun b!1550538 () Bool)

(assert (=> b!1550538 (= e!863221 e!863225)))

(declare-fun res!1061828 () Bool)

(assert (=> b!1550538 (=> (not res!1061828) (not e!863225))))

(assert (=> b!1550538 (= res!1061828 (bvslt from!762 (size!50462 _keys!618)))))

(declare-fun lt!668003 () ListLongMap!22265)

(assert (=> b!1550538 (= lt!668003 e!863224)))

(assert (=> b!1550538 (= c!142927 (and (not lt!668005) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550538 (= lt!668005 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58783 () Bool)

(assert (=> mapIsEmpty!58783 mapRes!58783))

(declare-fun b!1550539 () Bool)

(declare-fun res!1061825 () Bool)

(assert (=> b!1550539 (=> (not res!1061825) (not e!863221))))

(assert (=> b!1550539 (= res!1061825 (and (= (size!50463 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50462 _keys!618) (size!50463 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550540 () Bool)

(assert (=> b!1550540 (= e!863228 call!70208)))

(declare-fun bm!70206 () Bool)

(assert (=> bm!70206 (= call!70209 (getCurrentListMapNoExtraKeys!6621 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132476 res!1061831) b!1550539))

(assert (= (and b!1550539 res!1061825) b!1550536))

(assert (= (and b!1550536 res!1061829) b!1550525))

(assert (= (and b!1550525 res!1061827) b!1550532))

(assert (= (and b!1550532 res!1061826) b!1550538))

(assert (= (and b!1550538 c!142927) b!1550530))

(assert (= (and b!1550538 (not c!142927)) b!1550533))

(assert (= (and b!1550533 c!142926) b!1550527))

(assert (= (and b!1550533 (not c!142926)) b!1550529))

(assert (= (and b!1550529 c!142925) b!1550537))

(assert (= (and b!1550529 (not c!142925)) b!1550540))

(assert (= (or b!1550537 b!1550540) bm!70204))

(assert (= (or b!1550527 bm!70204) bm!70203))

(assert (= (or b!1550527 b!1550537) bm!70205))

(assert (= (or b!1550530 bm!70203) bm!70206))

(assert (= (or b!1550530 bm!70205) bm!70202))

(assert (= (and b!1550538 res!1061828) b!1550534))

(assert (= (and b!1550534 res!1061830) b!1550526))

(assert (= (and b!1550528 condMapEmpty!58783) mapIsEmpty!58783))

(assert (= (and b!1550528 (not condMapEmpty!58783)) mapNonEmpty!58783))

(get-info :version)

(assert (= (and mapNonEmpty!58783 ((_ is ValueCellFull!18116) mapValue!58783)) b!1550531))

(assert (= (and b!1550528 ((_ is ValueCellFull!18116) mapDefault!58783)) b!1550535))

(assert (= start!132476 b!1550528))

(declare-fun m!1429809 () Bool)

(assert (=> start!132476 m!1429809))

(declare-fun m!1429811 () Bool)

(assert (=> start!132476 m!1429811))

(declare-fun m!1429813 () Bool)

(assert (=> start!132476 m!1429813))

(declare-fun m!1429815 () Bool)

(assert (=> bm!70206 m!1429815))

(declare-fun m!1429817 () Bool)

(assert (=> b!1550536 m!1429817))

(declare-fun m!1429819 () Bool)

(assert (=> bm!70202 m!1429819))

(declare-fun m!1429821 () Bool)

(assert (=> b!1550530 m!1429821))

(declare-fun m!1429823 () Bool)

(assert (=> b!1550525 m!1429823))

(declare-fun m!1429825 () Bool)

(assert (=> mapNonEmpty!58783 m!1429825))

(declare-fun m!1429827 () Bool)

(assert (=> b!1550526 m!1429827))

(assert (=> b!1550526 m!1429827))

(declare-fun m!1429829 () Bool)

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429831 () Bool)

(assert (=> b!1550526 m!1429831))

(assert (=> b!1550526 m!1429829))

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429833 () Bool)

(assert (=> b!1550526 m!1429833))

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429835 () Bool)

(assert (=> b!1550526 m!1429835))

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429837 () Bool)

(assert (=> b!1550526 m!1429837))

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429839 () Bool)

(assert (=> b!1550526 m!1429839))

(assert (=> b!1550526 m!1429815))

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429841 () Bool)

(assert (=> b!1550526 m!1429841))

(assert (=> b!1550526 m!1429829))

(declare-fun m!1429843 () Bool)

(assert (=> b!1550526 m!1429843))

(declare-fun m!1429845 () Bool)

(assert (=> b!1550526 m!1429845))

(assert (=> b!1550534 m!1429829))

(assert (=> b!1550534 m!1429829))

(declare-fun m!1429847 () Bool)

(assert (=> b!1550534 m!1429847))

(check-sat (not start!132476) b_and!51189 (not b!1550530) (not b!1550526) (not b_next!31777) (not bm!70202) (not mapNonEmpty!58783) (not b!1550534) (not b!1550525) (not bm!70206) tp_is_empty!38053 (not b!1550536))
(check-sat b_and!51189 (not b_next!31777))
