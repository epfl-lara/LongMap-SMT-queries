; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132014 () Bool)

(assert start!132014)

(declare-fun b_free!31777 () Bool)

(declare-fun b_next!31777 () Bool)

(assert (=> start!132014 (= b_free!31777 (not b_next!31777))))

(declare-fun tp!111584 () Bool)

(declare-fun b_and!51169 () Bool)

(assert (=> start!132014 (= tp!111584 b_and!51169)))

(declare-fun b!1547776 () Bool)

(declare-fun c!142037 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666814 () Bool)

(assert (=> b!1547776 (= c!142037 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666814))))

(declare-datatypes ((V!59181 0))(
  ( (V!59182 (val!19104 Int)) )
))
(declare-datatypes ((tuple2!24664 0))(
  ( (tuple2!24665 (_1!12343 (_ BitVec 64)) (_2!12343 V!59181)) )
))
(declare-datatypes ((List!36130 0))(
  ( (Nil!36127) (Cons!36126 (h!37572 tuple2!24664) (t!50816 List!36130)) )
))
(declare-datatypes ((ListLongMap!22273 0))(
  ( (ListLongMap!22274 (toList!11152 List!36130)) )
))
(declare-fun e!861516 () ListLongMap!22273)

(declare-fun e!861515 () ListLongMap!22273)

(assert (=> b!1547776 (= e!861516 e!861515)))

(declare-fun b!1547777 () Bool)

(declare-fun res!1060836 () Bool)

(declare-fun e!861518 () Bool)

(assert (=> b!1547777 (=> (not res!1060836) (not e!861518))))

(declare-datatypes ((array!103236 0))(
  ( (array!103237 (arr!49821 (Array (_ BitVec 32) (_ BitVec 64))) (size!50373 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103236)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547777 (= res!1060836 (validKeyInArray!0 (select (arr!49821 _keys!618) from!762)))))

(declare-fun b!1547778 () Bool)

(declare-fun call!70021 () ListLongMap!22273)

(assert (=> b!1547778 (= e!861515 call!70021)))

(declare-fun bm!70017 () Bool)

(declare-fun zeroValue!436 () V!59181)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18116 0))(
  ( (ValueCellFull!18116 (v!21901 V!59181)) (EmptyCell!18116) )
))
(declare-datatypes ((array!103238 0))(
  ( (array!103239 (arr!49822 (Array (_ BitVec 32) ValueCell!18116)) (size!50374 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103238)

(declare-fun minValue!436 () V!59181)

(declare-fun call!70023 () ListLongMap!22273)

(declare-fun getCurrentListMapNoExtraKeys!6605 (array!103236 array!103238 (_ BitVec 32) (_ BitVec 32) V!59181 V!59181 (_ BitVec 32) Int) ListLongMap!22273)

(assert (=> bm!70017 (= call!70023 (getCurrentListMapNoExtraKeys!6605 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547779 () Bool)

(declare-fun e!861517 () Bool)

(assert (=> b!1547779 (= e!861517 e!861518)))

(declare-fun res!1060838 () Bool)

(assert (=> b!1547779 (=> (not res!1060838) (not e!861518))))

(assert (=> b!1547779 (= res!1060838 (bvslt from!762 (size!50373 _keys!618)))))

(declare-fun lt!666810 () ListLongMap!22273)

(declare-fun e!861519 () ListLongMap!22273)

(assert (=> b!1547779 (= lt!666810 e!861519)))

(declare-fun c!142036 () Bool)

(assert (=> b!1547779 (= c!142036 (and (not lt!666814) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547779 (= lt!666814 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547780 () Bool)

(declare-fun res!1060841 () Bool)

(assert (=> b!1547780 (=> (not res!1060841) (not e!861517))))

(assert (=> b!1547780 (= res!1060841 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50373 _keys!618))))))

(declare-fun bm!70018 () Bool)

(declare-fun call!70020 () ListLongMap!22273)

(declare-fun call!70024 () ListLongMap!22273)

(assert (=> bm!70018 (= call!70020 call!70024)))

(declare-fun b!1547781 () Bool)

(assert (=> b!1547781 (= e!861519 e!861516)))

(declare-fun c!142038 () Bool)

(assert (=> b!1547781 (= c!142038 (and (not lt!666814) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547782 () Bool)

(declare-fun e!861522 () Bool)

(declare-fun tp_is_empty!38053 () Bool)

(assert (=> b!1547782 (= e!861522 tp_is_empty!38053)))

(declare-fun b!1547783 () Bool)

(declare-fun res!1060837 () Bool)

(assert (=> b!1547783 (=> (not res!1060837) (not e!861517))))

(declare-datatypes ((List!36131 0))(
  ( (Nil!36128) (Cons!36127 (h!37573 (_ BitVec 64)) (t!50817 List!36131)) )
))
(declare-fun arrayNoDuplicates!0 (array!103236 (_ BitVec 32) List!36131) Bool)

(assert (=> b!1547783 (= res!1060837 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36128))))

(declare-fun b!1547784 () Bool)

(assert (=> b!1547784 (= e!861515 call!70020)))

(declare-fun b!1547785 () Bool)

(declare-fun res!1060842 () Bool)

(assert (=> b!1547785 (=> (not res!1060842) (not e!861517))))

(assert (=> b!1547785 (= res!1060842 (and (= (size!50374 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50373 _keys!618) (size!50374 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547786 () Bool)

(declare-fun e!861520 () Bool)

(assert (=> b!1547786 (= e!861520 tp_is_empty!38053)))

(declare-fun b!1547787 () Bool)

(assert (=> b!1547787 (= e!861518 (not true))))

(declare-fun lt!666815 () V!59181)

(declare-fun lt!666809 () ListLongMap!22273)

(declare-fun apply!1059 (ListLongMap!22273 (_ BitVec 64)) V!59181)

(assert (=> b!1547787 (= (apply!1059 lt!666809 (select (arr!49821 _keys!618) from!762)) lt!666815)))

(declare-datatypes ((Unit!51415 0))(
  ( (Unit!51416) )
))
(declare-fun lt!666811 () Unit!51415)

(declare-fun lt!666817 () ListLongMap!22273)

(declare-fun addApplyDifferent!597 (ListLongMap!22273 (_ BitVec 64) V!59181 (_ BitVec 64)) Unit!51415)

(assert (=> b!1547787 (= lt!666811 (addApplyDifferent!597 lt!666817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49821 _keys!618) from!762)))))

(declare-fun lt!666812 () V!59181)

(assert (=> b!1547787 (= lt!666812 lt!666815)))

(assert (=> b!1547787 (= lt!666815 (apply!1059 lt!666817 (select (arr!49821 _keys!618) from!762)))))

(declare-fun +!4977 (ListLongMap!22273 tuple2!24664) ListLongMap!22273)

(assert (=> b!1547787 (= lt!666812 (apply!1059 (+!4977 lt!666817 (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49821 _keys!618) from!762)))))

(declare-fun lt!666813 () Unit!51415)

(assert (=> b!1547787 (= lt!666813 (addApplyDifferent!597 lt!666817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49821 _keys!618) from!762)))))

(declare-fun contains!10034 (ListLongMap!22273 (_ BitVec 64)) Bool)

(assert (=> b!1547787 (contains!10034 lt!666809 (select (arr!49821 _keys!618) from!762))))

(assert (=> b!1547787 (= lt!666809 (+!4977 lt!666817 (tuple2!24665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!666816 () Unit!51415)

(declare-fun addStillContains!1257 (ListLongMap!22273 (_ BitVec 64) V!59181 (_ BitVec 64)) Unit!51415)

(assert (=> b!1547787 (= lt!666816 (addStillContains!1257 lt!666817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49821 _keys!618) from!762)))))

(assert (=> b!1547787 (= lt!666817 (getCurrentListMapNoExtraKeys!6605 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547788 () Bool)

(declare-fun e!861521 () Bool)

(declare-fun mapRes!58783 () Bool)

(assert (=> b!1547788 (= e!861521 (and e!861520 mapRes!58783))))

(declare-fun condMapEmpty!58783 () Bool)

(declare-fun mapDefault!58783 () ValueCell!18116)

(assert (=> b!1547788 (= condMapEmpty!58783 (= (arr!49822 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18116)) mapDefault!58783)))))

(declare-fun b!1547789 () Bool)

(assert (=> b!1547789 (= e!861519 (+!4977 call!70024 (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1060840 () Bool)

(assert (=> start!132014 (=> (not res!1060840) (not e!861517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132014 (= res!1060840 (validMask!0 mask!926))))

(assert (=> start!132014 e!861517))

(declare-fun array_inv!38949 (array!103236) Bool)

(assert (=> start!132014 (array_inv!38949 _keys!618)))

(assert (=> start!132014 tp_is_empty!38053))

(assert (=> start!132014 true))

(assert (=> start!132014 tp!111584))

(declare-fun array_inv!38950 (array!103238) Bool)

(assert (=> start!132014 (and (array_inv!38950 _values!470) e!861521)))

(declare-fun bm!70019 () Bool)

(declare-fun call!70022 () ListLongMap!22273)

(assert (=> bm!70019 (= call!70021 call!70022)))

(declare-fun bm!70020 () Bool)

(assert (=> bm!70020 (= call!70024 (+!4977 (ite c!142036 call!70023 (ite c!142038 call!70022 call!70021)) (ite (or c!142036 c!142038) (tuple2!24665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58783 () Bool)

(assert (=> mapIsEmpty!58783 mapRes!58783))

(declare-fun mapNonEmpty!58783 () Bool)

(declare-fun tp!111583 () Bool)

(assert (=> mapNonEmpty!58783 (= mapRes!58783 (and tp!111583 e!861522))))

(declare-fun mapKey!58783 () (_ BitVec 32))

(declare-fun mapRest!58783 () (Array (_ BitVec 32) ValueCell!18116))

(declare-fun mapValue!58783 () ValueCell!18116)

(assert (=> mapNonEmpty!58783 (= (arr!49822 _values!470) (store mapRest!58783 mapKey!58783 mapValue!58783))))

(declare-fun b!1547790 () Bool)

(declare-fun res!1060839 () Bool)

(assert (=> b!1547790 (=> (not res!1060839) (not e!861517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103236 (_ BitVec 32)) Bool)

(assert (=> b!1547790 (= res!1060839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1547791 () Bool)

(assert (=> b!1547791 (= e!861516 call!70020)))

(declare-fun bm!70021 () Bool)

(assert (=> bm!70021 (= call!70022 call!70023)))

(assert (= (and start!132014 res!1060840) b!1547785))

(assert (= (and b!1547785 res!1060842) b!1547790))

(assert (= (and b!1547790 res!1060839) b!1547783))

(assert (= (and b!1547783 res!1060837) b!1547780))

(assert (= (and b!1547780 res!1060841) b!1547779))

(assert (= (and b!1547779 c!142036) b!1547789))

(assert (= (and b!1547779 (not c!142036)) b!1547781))

(assert (= (and b!1547781 c!142038) b!1547791))

(assert (= (and b!1547781 (not c!142038)) b!1547776))

(assert (= (and b!1547776 c!142037) b!1547784))

(assert (= (and b!1547776 (not c!142037)) b!1547778))

(assert (= (or b!1547784 b!1547778) bm!70019))

(assert (= (or b!1547791 bm!70019) bm!70021))

(assert (= (or b!1547791 b!1547784) bm!70018))

(assert (= (or b!1547789 bm!70021) bm!70017))

(assert (= (or b!1547789 bm!70018) bm!70020))

(assert (= (and b!1547779 res!1060838) b!1547777))

(assert (= (and b!1547777 res!1060836) b!1547787))

(assert (= (and b!1547788 condMapEmpty!58783) mapIsEmpty!58783))

(assert (= (and b!1547788 (not condMapEmpty!58783)) mapNonEmpty!58783))

(get-info :version)

(assert (= (and mapNonEmpty!58783 ((_ is ValueCellFull!18116) mapValue!58783)) b!1547782))

(assert (= (and b!1547788 ((_ is ValueCellFull!18116) mapDefault!58783)) b!1547786))

(assert (= start!132014 b!1547788))

(declare-fun m!1426659 () Bool)

(assert (=> b!1547787 m!1426659))

(declare-fun m!1426661 () Bool)

(assert (=> b!1547787 m!1426661))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426663 () Bool)

(assert (=> b!1547787 m!1426663))

(declare-fun m!1426665 () Bool)

(assert (=> b!1547787 m!1426665))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426667 () Bool)

(assert (=> b!1547787 m!1426667))

(assert (=> b!1547787 m!1426665))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426669 () Bool)

(assert (=> b!1547787 m!1426669))

(declare-fun m!1426671 () Bool)

(assert (=> b!1547787 m!1426671))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426673 () Bool)

(assert (=> b!1547787 m!1426673))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426675 () Bool)

(assert (=> b!1547787 m!1426675))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426677 () Bool)

(assert (=> b!1547787 m!1426677))

(assert (=> b!1547787 m!1426661))

(declare-fun m!1426679 () Bool)

(assert (=> b!1547787 m!1426679))

(declare-fun m!1426681 () Bool)

(assert (=> b!1547790 m!1426681))

(declare-fun m!1426683 () Bool)

(assert (=> b!1547783 m!1426683))

(assert (=> b!1547777 m!1426661))

(assert (=> b!1547777 m!1426661))

(declare-fun m!1426685 () Bool)

(assert (=> b!1547777 m!1426685))

(declare-fun m!1426687 () Bool)

(assert (=> mapNonEmpty!58783 m!1426687))

(assert (=> bm!70017 m!1426659))

(declare-fun m!1426689 () Bool)

(assert (=> bm!70020 m!1426689))

(declare-fun m!1426691 () Bool)

(assert (=> b!1547789 m!1426691))

(declare-fun m!1426693 () Bool)

(assert (=> start!132014 m!1426693))

(declare-fun m!1426695 () Bool)

(assert (=> start!132014 m!1426695))

(declare-fun m!1426697 () Bool)

(assert (=> start!132014 m!1426697))

(check-sat (not b_next!31777) (not b!1547787) (not start!132014) (not mapNonEmpty!58783) (not b!1547777) (not b!1547790) (not b!1547783) (not bm!70017) (not bm!70020) (not b!1547789) tp_is_empty!38053 b_and!51169)
(check-sat b_and!51169 (not b_next!31777))
