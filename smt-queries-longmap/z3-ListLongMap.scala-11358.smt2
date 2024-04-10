; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132054 () Bool)

(assert start!132054)

(declare-fun b_free!31767 () Bool)

(declare-fun b_next!31767 () Bool)

(assert (=> start!132054 (= b_free!31767 (not b_next!31767))))

(declare-fun tp!111552 () Bool)

(declare-fun b_and!51177 () Bool)

(assert (=> start!132054 (= tp!111552 b_and!51177)))

(declare-fun bm!69977 () Bool)

(declare-datatypes ((array!103286 0))(
  ( (array!103287 (arr!49845 (Array (_ BitVec 32) (_ BitVec 64))) (size!50395 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103286)

(declare-datatypes ((V!59167 0))(
  ( (V!59168 (val!19099 Int)) )
))
(declare-fun zeroValue!436 () V!59167)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18111 0))(
  ( (ValueCellFull!18111 (v!21900 V!59167)) (EmptyCell!18111) )
))
(declare-datatypes ((array!103288 0))(
  ( (array!103289 (arr!49846 (Array (_ BitVec 32) ValueCell!18111)) (size!50396 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103288)

(declare-fun minValue!436 () V!59167)

(declare-datatypes ((tuple2!24578 0))(
  ( (tuple2!24579 (_1!12300 (_ BitVec 64)) (_2!12300 V!59167)) )
))
(declare-datatypes ((List!36073 0))(
  ( (Nil!36070) (Cons!36069 (h!37514 tuple2!24578) (t!50767 List!36073)) )
))
(declare-datatypes ((ListLongMap!22187 0))(
  ( (ListLongMap!22188 (toList!11109 List!36073)) )
))
(declare-fun call!69983 () ListLongMap!22187)

(declare-fun getCurrentListMapNoExtraKeys!6567 (array!103286 array!103288 (_ BitVec 32) (_ BitVec 32) V!59167 V!59167 (_ BitVec 32) Int) ListLongMap!22187)

(assert (=> bm!69977 (= call!69983 (getCurrentListMapNoExtraKeys!6567 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547849 () Bool)

(declare-fun e!861584 () ListLongMap!22187)

(declare-fun call!69981 () ListLongMap!22187)

(assert (=> b!1547849 (= e!861584 call!69981)))

(declare-fun c!142080 () Bool)

(declare-fun c!142082 () Bool)

(declare-fun call!69984 () ListLongMap!22187)

(declare-fun call!69980 () ListLongMap!22187)

(declare-fun bm!69978 () Bool)

(declare-fun +!4940 (ListLongMap!22187 tuple2!24578) ListLongMap!22187)

(assert (=> bm!69978 (= call!69984 (+!4940 (ite c!142080 call!69983 (ite c!142082 call!69980 call!69981)) (ite (or c!142080 c!142082) (tuple2!24579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547850 () Bool)

(declare-fun res!1060865 () Bool)

(declare-fun e!861581 () Bool)

(assert (=> b!1547850 (=> (not res!1060865) (not e!861581))))

(declare-datatypes ((List!36074 0))(
  ( (Nil!36071) (Cons!36070 (h!37515 (_ BitVec 64)) (t!50768 List!36074)) )
))
(declare-fun arrayNoDuplicates!0 (array!103286 (_ BitVec 32) List!36074) Bool)

(assert (=> b!1547850 (= res!1060865 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36071))))

(declare-fun b!1547851 () Bool)

(declare-fun e!861579 () Bool)

(declare-fun e!861585 () Bool)

(declare-fun mapRes!58768 () Bool)

(assert (=> b!1547851 (= e!861579 (and e!861585 mapRes!58768))))

(declare-fun condMapEmpty!58768 () Bool)

(declare-fun mapDefault!58768 () ValueCell!18111)

(assert (=> b!1547851 (= condMapEmpty!58768 (= (arr!49846 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18111)) mapDefault!58768)))))

(declare-fun mapNonEmpty!58768 () Bool)

(declare-fun tp!111553 () Bool)

(declare-fun e!861577 () Bool)

(assert (=> mapNonEmpty!58768 (= mapRes!58768 (and tp!111553 e!861577))))

(declare-fun mapValue!58768 () ValueCell!18111)

(declare-fun mapKey!58768 () (_ BitVec 32))

(declare-fun mapRest!58768 () (Array (_ BitVec 32) ValueCell!18111))

(assert (=> mapNonEmpty!58768 (= (arr!49846 _values!470) (store mapRest!58768 mapKey!58768 mapValue!58768))))

(declare-fun b!1547852 () Bool)

(declare-fun call!69982 () ListLongMap!22187)

(assert (=> b!1547852 (= e!861584 call!69982)))

(declare-fun b!1547853 () Bool)

(declare-fun res!1060861 () Bool)

(assert (=> b!1547853 (=> (not res!1060861) (not e!861581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103286 (_ BitVec 32)) Bool)

(assert (=> b!1547853 (= res!1060861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1060866 () Bool)

(assert (=> start!132054 (=> (not res!1060866) (not e!861581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132054 (= res!1060866 (validMask!0 mask!926))))

(assert (=> start!132054 e!861581))

(declare-fun array_inv!38761 (array!103286) Bool)

(assert (=> start!132054 (array_inv!38761 _keys!618)))

(declare-fun tp_is_empty!38043 () Bool)

(assert (=> start!132054 tp_is_empty!38043))

(assert (=> start!132054 true))

(assert (=> start!132054 tp!111552))

(declare-fun array_inv!38762 (array!103288) Bool)

(assert (=> start!132054 (and (array_inv!38762 _values!470) e!861579)))

(declare-fun b!1547854 () Bool)

(declare-fun e!861582 () Bool)

(assert (=> b!1547854 (= e!861581 e!861582)))

(declare-fun res!1060863 () Bool)

(assert (=> b!1547854 (=> (not res!1060863) (not e!861582))))

(assert (=> b!1547854 (= res!1060863 (bvslt from!762 (size!50395 _keys!618)))))

(declare-fun lt!667004 () ListLongMap!22187)

(declare-fun e!861583 () ListLongMap!22187)

(assert (=> b!1547854 (= lt!667004 e!861583)))

(declare-fun lt!667006 () Bool)

(assert (=> b!1547854 (= c!142080 (and (not lt!667006) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547854 (= lt!667006 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547855 () Bool)

(declare-fun c!142081 () Bool)

(assert (=> b!1547855 (= c!142081 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667006))))

(declare-fun e!861580 () ListLongMap!22187)

(assert (=> b!1547855 (= e!861580 e!861584)))

(declare-fun bm!69979 () Bool)

(assert (=> bm!69979 (= call!69982 call!69984)))

(declare-fun bm!69980 () Bool)

(assert (=> bm!69980 (= call!69981 call!69980)))

(declare-fun mapIsEmpty!58768 () Bool)

(assert (=> mapIsEmpty!58768 mapRes!58768))

(declare-fun b!1547856 () Bool)

(assert (=> b!1547856 (= e!861582 (not true))))

(declare-fun lt!667003 () ListLongMap!22187)

(declare-fun apply!1059 (ListLongMap!22187 (_ BitVec 64)) V!59167)

(assert (=> b!1547856 (= (apply!1059 (+!4940 lt!667003 (tuple2!24579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49845 _keys!618) from!762)) (apply!1059 lt!667003 (select (arr!49845 _keys!618) from!762)))))

(declare-datatypes ((Unit!51568 0))(
  ( (Unit!51569) )
))
(declare-fun lt!667007 () Unit!51568)

(declare-fun addApplyDifferent!601 (ListLongMap!22187 (_ BitVec 64) V!59167 (_ BitVec 64)) Unit!51568)

(assert (=> b!1547856 (= lt!667007 (addApplyDifferent!601 lt!667003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49845 _keys!618) from!762)))))

(declare-fun contains!10066 (ListLongMap!22187 (_ BitVec 64)) Bool)

(assert (=> b!1547856 (contains!10066 (+!4940 lt!667003 (tuple2!24579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49845 _keys!618) from!762))))

(declare-fun lt!667005 () Unit!51568)

(declare-fun addStillContains!1254 (ListLongMap!22187 (_ BitVec 64) V!59167 (_ BitVec 64)) Unit!51568)

(assert (=> b!1547856 (= lt!667005 (addStillContains!1254 lt!667003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49845 _keys!618) from!762)))))

(assert (=> b!1547856 (= lt!667003 (getCurrentListMapNoExtraKeys!6567 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69981 () Bool)

(assert (=> bm!69981 (= call!69980 call!69983)))

(declare-fun b!1547857 () Bool)

(assert (=> b!1547857 (= e!861583 e!861580)))

(assert (=> b!1547857 (= c!142082 (and (not lt!667006) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547858 () Bool)

(declare-fun res!1060864 () Bool)

(assert (=> b!1547858 (=> (not res!1060864) (not e!861581))))

(assert (=> b!1547858 (= res!1060864 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50395 _keys!618))))))

(declare-fun b!1547859 () Bool)

(assert (=> b!1547859 (= e!861577 tp_is_empty!38043)))

(declare-fun b!1547860 () Bool)

(declare-fun res!1060862 () Bool)

(assert (=> b!1547860 (=> (not res!1060862) (not e!861581))))

(assert (=> b!1547860 (= res!1060862 (and (= (size!50396 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50395 _keys!618) (size!50396 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547861 () Bool)

(assert (=> b!1547861 (= e!861585 tp_is_empty!38043)))

(declare-fun b!1547862 () Bool)

(assert (=> b!1547862 (= e!861583 (+!4940 call!69984 (tuple2!24579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547863 () Bool)

(declare-fun res!1060860 () Bool)

(assert (=> b!1547863 (=> (not res!1060860) (not e!861582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547863 (= res!1060860 (validKeyInArray!0 (select (arr!49845 _keys!618) from!762)))))

(declare-fun b!1547864 () Bool)

(assert (=> b!1547864 (= e!861580 call!69982)))

(assert (= (and start!132054 res!1060866) b!1547860))

(assert (= (and b!1547860 res!1060862) b!1547853))

(assert (= (and b!1547853 res!1060861) b!1547850))

(assert (= (and b!1547850 res!1060865) b!1547858))

(assert (= (and b!1547858 res!1060864) b!1547854))

(assert (= (and b!1547854 c!142080) b!1547862))

(assert (= (and b!1547854 (not c!142080)) b!1547857))

(assert (= (and b!1547857 c!142082) b!1547864))

(assert (= (and b!1547857 (not c!142082)) b!1547855))

(assert (= (and b!1547855 c!142081) b!1547852))

(assert (= (and b!1547855 (not c!142081)) b!1547849))

(assert (= (or b!1547852 b!1547849) bm!69980))

(assert (= (or b!1547864 bm!69980) bm!69981))

(assert (= (or b!1547864 b!1547852) bm!69979))

(assert (= (or b!1547862 bm!69981) bm!69977))

(assert (= (or b!1547862 bm!69979) bm!69978))

(assert (= (and b!1547854 res!1060863) b!1547863))

(assert (= (and b!1547863 res!1060860) b!1547856))

(assert (= (and b!1547851 condMapEmpty!58768) mapIsEmpty!58768))

(assert (= (and b!1547851 (not condMapEmpty!58768)) mapNonEmpty!58768))

(get-info :version)

(assert (= (and mapNonEmpty!58768 ((_ is ValueCellFull!18111) mapValue!58768)) b!1547859))

(assert (= (and b!1547851 ((_ is ValueCellFull!18111) mapDefault!58768)) b!1547861))

(assert (= start!132054 b!1547851))

(declare-fun m!1427365 () Bool)

(assert (=> b!1547853 m!1427365))

(declare-fun m!1427367 () Bool)

(assert (=> b!1547850 m!1427367))

(declare-fun m!1427369 () Bool)

(assert (=> bm!69977 m!1427369))

(assert (=> b!1547856 m!1427369))

(declare-fun m!1427371 () Bool)

(assert (=> b!1547856 m!1427371))

(declare-fun m!1427373 () Bool)

(assert (=> b!1547856 m!1427373))

(assert (=> b!1547856 m!1427373))

(assert (=> b!1547856 m!1427371))

(declare-fun m!1427375 () Bool)

(assert (=> b!1547856 m!1427375))

(assert (=> b!1547856 m!1427371))

(declare-fun m!1427377 () Bool)

(assert (=> b!1547856 m!1427377))

(declare-fun m!1427379 () Bool)

(assert (=> b!1547856 m!1427379))

(assert (=> b!1547856 m!1427371))

(declare-fun m!1427381 () Bool)

(assert (=> b!1547856 m!1427381))

(assert (=> b!1547856 m!1427371))

(declare-fun m!1427383 () Bool)

(assert (=> b!1547856 m!1427383))

(assert (=> b!1547856 m!1427379))

(assert (=> b!1547856 m!1427371))

(declare-fun m!1427385 () Bool)

(assert (=> b!1547856 m!1427385))

(declare-fun m!1427387 () Bool)

(assert (=> bm!69978 m!1427387))

(declare-fun m!1427389 () Bool)

(assert (=> mapNonEmpty!58768 m!1427389))

(assert (=> b!1547863 m!1427371))

(assert (=> b!1547863 m!1427371))

(declare-fun m!1427391 () Bool)

(assert (=> b!1547863 m!1427391))

(declare-fun m!1427393 () Bool)

(assert (=> b!1547862 m!1427393))

(declare-fun m!1427395 () Bool)

(assert (=> start!132054 m!1427395))

(declare-fun m!1427397 () Bool)

(assert (=> start!132054 m!1427397))

(declare-fun m!1427399 () Bool)

(assert (=> start!132054 m!1427399))

(check-sat (not mapNonEmpty!58768) (not b!1547863) (not b!1547856) tp_is_empty!38043 (not b_next!31767) (not b!1547850) (not bm!69977) b_and!51177 (not bm!69978) (not start!132054) (not b!1547862) (not b!1547853))
(check-sat b_and!51177 (not b_next!31767))
