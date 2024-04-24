; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100762 () Bool)

(assert start!100762)

(declare-fun b_free!25849 () Bool)

(declare-fun b_next!25849 () Bool)

(assert (=> start!100762 (= b_free!25849 (not b_next!25849))))

(declare-fun tp!90536 () Bool)

(declare-fun b_and!42587 () Bool)

(assert (=> start!100762 (= tp!90536 b_and!42587)))

(declare-fun b!1202580 () Bool)

(declare-fun res!800199 () Bool)

(declare-fun e!683018 () Bool)

(assert (=> b!1202580 (=> (not res!800199) (not e!683018))))

(declare-datatypes ((array!77917 0))(
  ( (array!77918 (arr!37597 (Array (_ BitVec 32) (_ BitVec 64))) (size!38134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77917)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1202580 (= res!800199 (= (select (arr!37597 _keys!1208) i!673) k0!934))))

(declare-datatypes ((V!45865 0))(
  ( (V!45866 (val!15333 Int)) )
))
(declare-fun zeroValue!944 () V!45865)

(declare-fun c!117890 () Bool)

(declare-fun bm!57450 () Bool)

(declare-fun c!117889 () Bool)

(declare-fun minValue!944 () V!45865)

(declare-datatypes ((tuple2!19654 0))(
  ( (tuple2!19655 (_1!9838 (_ BitVec 64)) (_2!9838 V!45865)) )
))
(declare-datatypes ((List!26470 0))(
  ( (Nil!26467) (Cons!26466 (h!27684 tuple2!19654) (t!39291 List!26470)) )
))
(declare-datatypes ((ListLongMap!17631 0))(
  ( (ListLongMap!17632 (toList!8831 List!26470)) )
))
(declare-fun lt!544862 () ListLongMap!17631)

(declare-datatypes ((Unit!39787 0))(
  ( (Unit!39788) )
))
(declare-fun call!57460 () Unit!39787)

(declare-fun lt!544860 () ListLongMap!17631)

(declare-fun addStillContains!988 (ListLongMap!17631 (_ BitVec 64) V!45865 (_ BitVec 64)) Unit!39787)

(assert (=> bm!57450 (= call!57460 (addStillContains!988 (ite c!117890 lt!544862 lt!544860) (ite c!117890 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117889 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117890 minValue!944 (ite c!117889 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1202581 () Bool)

(declare-fun e!683013 () Unit!39787)

(declare-fun Unit!39789 () Unit!39787)

(assert (=> b!1202581 (= e!683013 Unit!39789)))

(declare-fun b!1202582 () Bool)

(declare-fun call!57453 () Bool)

(assert (=> b!1202582 call!57453))

(declare-fun lt!544857 () Unit!39787)

(declare-fun call!57457 () Unit!39787)

(assert (=> b!1202582 (= lt!544857 call!57457)))

(declare-fun e!683010 () Unit!39787)

(assert (=> b!1202582 (= e!683010 lt!544857)))

(declare-fun b!1202583 () Bool)

(declare-fun e!683012 () Bool)

(declare-fun tp_is_empty!30553 () Bool)

(assert (=> b!1202583 (= e!683012 tp_is_empty!30553)))

(declare-fun b!1202584 () Bool)

(declare-fun e!683021 () Bool)

(declare-fun e!683014 () Bool)

(assert (=> b!1202584 (= e!683021 e!683014)))

(declare-fun res!800202 () Bool)

(assert (=> b!1202584 (=> res!800202 e!683014)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1202584 (= res!800202 (not (= (select (arr!37597 _keys!1208) from!1455) k0!934)))))

(declare-fun e!683017 () Bool)

(assert (=> b!1202584 e!683017))

(declare-fun c!117891 () Bool)

(assert (=> b!1202584 (= c!117891 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14567 0))(
  ( (ValueCellFull!14567 (v!17967 V!45865)) (EmptyCell!14567) )
))
(declare-datatypes ((array!77919 0))(
  ( (array!77920 (arr!37598 (Array (_ BitVec 32) ValueCell!14567)) (size!38135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77919)

(declare-fun lt!544855 () Unit!39787)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1007 (array!77917 array!77919 (_ BitVec 32) (_ BitVec 32) V!45865 V!45865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39787)

(assert (=> b!1202584 (= lt!544855 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1007 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47672 () Bool)

(declare-fun mapRes!47672 () Bool)

(declare-fun tp!90537 () Bool)

(declare-fun e!683011 () Bool)

(assert (=> mapNonEmpty!47672 (= mapRes!47672 (and tp!90537 e!683011))))

(declare-fun mapKey!47672 () (_ BitVec 32))

(declare-fun mapRest!47672 () (Array (_ BitVec 32) ValueCell!14567))

(declare-fun mapValue!47672 () ValueCell!14567)

(assert (=> mapNonEmpty!47672 (= (arr!37598 _values!996) (store mapRest!47672 mapKey!47672 mapValue!47672))))

(declare-fun b!1202585 () Bool)

(declare-fun e!683008 () Unit!39787)

(assert (=> b!1202585 (= e!683008 e!683010)))

(declare-fun lt!544858 () Bool)

(assert (=> b!1202585 (= c!117889 (and (not lt!544858) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202586 () Bool)

(declare-fun e!683015 () Bool)

(assert (=> b!1202586 (= e!683015 true)))

(declare-fun lt!544863 () Unit!39787)

(assert (=> b!1202586 (= lt!544863 e!683008)))

(assert (=> b!1202586 (= c!117890 (and (not lt!544858) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202586 (= lt!544858 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202587 () Bool)

(declare-fun res!800209 () Bool)

(assert (=> b!1202587 (=> (not res!800209) (not e!683018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202587 (= res!800209 (validMask!0 mask!1564))))

(declare-fun res!800212 () Bool)

(assert (=> start!100762 (=> (not res!800212) (not e!683018))))

(assert (=> start!100762 (= res!800212 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38134 _keys!1208))))))

(assert (=> start!100762 e!683018))

(assert (=> start!100762 tp_is_empty!30553))

(declare-fun array_inv!28716 (array!77917) Bool)

(assert (=> start!100762 (array_inv!28716 _keys!1208)))

(assert (=> start!100762 true))

(assert (=> start!100762 tp!90536))

(declare-fun e!683016 () Bool)

(declare-fun array_inv!28717 (array!77919) Bool)

(assert (=> start!100762 (and (array_inv!28717 _values!996) e!683016)))

(declare-fun b!1202588 () Bool)

(declare-fun call!57459 () ListLongMap!17631)

(declare-fun call!57454 () ListLongMap!17631)

(assert (=> b!1202588 (= e!683017 (= call!57459 call!57454))))

(declare-fun b!1202589 () Bool)

(declare-fun res!800206 () Bool)

(assert (=> b!1202589 (=> (not res!800206) (not e!683018))))

(assert (=> b!1202589 (= res!800206 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38134 _keys!1208))))))

(declare-fun call!57455 () ListLongMap!17631)

(declare-fun bm!57451 () Bool)

(declare-fun +!4001 (ListLongMap!17631 tuple2!19654) ListLongMap!17631)

(assert (=> bm!57451 (= call!57455 (+!4001 (ite c!117890 lt!544862 lt!544860) (ite c!117890 (tuple2!19655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117889 (tuple2!19655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202590 () Bool)

(assert (=> b!1202590 (= e!683011 tp_is_empty!30553)))

(declare-fun b!1202591 () Bool)

(declare-fun e!683020 () Bool)

(assert (=> b!1202591 (= e!683020 e!683021)))

(declare-fun res!800208 () Bool)

(assert (=> b!1202591 (=> res!800208 e!683021)))

(assert (=> b!1202591 (= res!800208 (not (= from!1455 i!673)))))

(declare-fun lt!544866 () array!77917)

(declare-fun lt!544867 () array!77919)

(declare-fun lt!544861 () ListLongMap!17631)

(declare-fun getCurrentListMapNoExtraKeys!5298 (array!77917 array!77919 (_ BitVec 32) (_ BitVec 32) V!45865 V!45865 (_ BitVec 32) Int) ListLongMap!17631)

(assert (=> b!1202591 (= lt!544861 (getCurrentListMapNoExtraKeys!5298 lt!544866 lt!544867 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3237 (Int (_ BitVec 64)) V!45865)

(assert (=> b!1202591 (= lt!544867 (array!77920 (store (arr!37598 _values!996) i!673 (ValueCellFull!14567 (dynLambda!3237 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38135 _values!996)))))

(declare-fun lt!544865 () ListLongMap!17631)

(assert (=> b!1202591 (= lt!544865 (getCurrentListMapNoExtraKeys!5298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202592 () Bool)

(assert (=> b!1202592 (= e!683016 (and e!683012 mapRes!47672))))

(declare-fun condMapEmpty!47672 () Bool)

(declare-fun mapDefault!47672 () ValueCell!14567)

(assert (=> b!1202592 (= condMapEmpty!47672 (= (arr!37598 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14567)) mapDefault!47672)))))

(declare-fun b!1202593 () Bool)

(declare-fun e!683009 () Bool)

(assert (=> b!1202593 (= e!683009 (not e!683020))))

(declare-fun res!800200 () Bool)

(assert (=> b!1202593 (=> res!800200 e!683020)))

(assert (=> b!1202593 (= res!800200 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202593 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544864 () Unit!39787)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77917 (_ BitVec 64) (_ BitVec 32)) Unit!39787)

(assert (=> b!1202593 (= lt!544864 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!57452 () Bool)

(declare-fun call!57458 () Bool)

(declare-fun call!57456 () ListLongMap!17631)

(declare-fun contains!6910 (ListLongMap!17631 (_ BitVec 64)) Bool)

(assert (=> bm!57452 (= call!57458 (contains!6910 (ite c!117890 lt!544862 call!57456) k0!934))))

(declare-fun bm!57453 () Bool)

(assert (=> bm!57453 (= call!57459 (getCurrentListMapNoExtraKeys!5298 lt!544866 lt!544867 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57454 () Bool)

(assert (=> bm!57454 (= call!57454 (getCurrentListMapNoExtraKeys!5298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202594 () Bool)

(declare-fun res!800211 () Bool)

(assert (=> b!1202594 (=> (not res!800211) (not e!683018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202594 (= res!800211 (validKeyInArray!0 k0!934))))

(declare-fun b!1202595 () Bool)

(declare-fun c!117892 () Bool)

(assert (=> b!1202595 (= c!117892 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544858))))

(assert (=> b!1202595 (= e!683010 e!683013)))

(declare-fun b!1202596 () Bool)

(declare-fun res!800204 () Bool)

(assert (=> b!1202596 (=> (not res!800204) (not e!683018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77917 (_ BitVec 32)) Bool)

(assert (=> b!1202596 (= res!800204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202597 () Bool)

(declare-fun res!800205 () Bool)

(assert (=> b!1202597 (=> (not res!800205) (not e!683018))))

(declare-datatypes ((List!26471 0))(
  ( (Nil!26468) (Cons!26467 (h!27685 (_ BitVec 64)) (t!39292 List!26471)) )
))
(declare-fun arrayNoDuplicates!0 (array!77917 (_ BitVec 32) List!26471) Bool)

(assert (=> b!1202597 (= res!800205 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26468))))

(declare-fun bm!57455 () Bool)

(assert (=> bm!57455 (= call!57456 call!57455)))

(declare-fun bm!57456 () Bool)

(assert (=> bm!57456 (= call!57453 call!57458)))

(declare-fun mapIsEmpty!47672 () Bool)

(assert (=> mapIsEmpty!47672 mapRes!47672))

(declare-fun b!1202598 () Bool)

(assert (=> b!1202598 (= e!683018 e!683009)))

(declare-fun res!800203 () Bool)

(assert (=> b!1202598 (=> (not res!800203) (not e!683009))))

(assert (=> b!1202598 (= res!800203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544866 mask!1564))))

(assert (=> b!1202598 (= lt!544866 (array!77918 (store (arr!37597 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38134 _keys!1208)))))

(declare-fun b!1202599 () Bool)

(assert (=> b!1202599 (= e!683014 e!683015)))

(declare-fun res!800207 () Bool)

(assert (=> b!1202599 (=> res!800207 e!683015)))

(assert (=> b!1202599 (= res!800207 (not (contains!6910 lt!544860 k0!934)))))

(assert (=> b!1202599 (= lt!544860 (getCurrentListMapNoExtraKeys!5298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202600 () Bool)

(declare-fun lt!544859 () Unit!39787)

(assert (=> b!1202600 (= e!683008 lt!544859)))

(declare-fun lt!544856 () Unit!39787)

(assert (=> b!1202600 (= lt!544856 (addStillContains!988 lt!544860 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1202600 (= lt!544862 (+!4001 lt!544860 (tuple2!19655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1202600 call!57458))

(assert (=> b!1202600 (= lt!544859 call!57460)))

(assert (=> b!1202600 (contains!6910 call!57455 k0!934)))

(declare-fun b!1202601 () Bool)

(declare-fun -!1788 (ListLongMap!17631 (_ BitVec 64)) ListLongMap!17631)

(assert (=> b!1202601 (= e!683017 (= call!57459 (-!1788 call!57454 k0!934)))))

(declare-fun b!1202602 () Bool)

(declare-fun res!800210 () Bool)

(assert (=> b!1202602 (=> (not res!800210) (not e!683009))))

(assert (=> b!1202602 (= res!800210 (arrayNoDuplicates!0 lt!544866 #b00000000000000000000000000000000 Nil!26468))))

(declare-fun bm!57457 () Bool)

(assert (=> bm!57457 (= call!57457 call!57460)))

(declare-fun b!1202603 () Bool)

(declare-fun lt!544868 () Unit!39787)

(assert (=> b!1202603 (= e!683013 lt!544868)))

(assert (=> b!1202603 (= lt!544868 call!57457)))

(assert (=> b!1202603 call!57453))

(declare-fun b!1202604 () Bool)

(declare-fun res!800201 () Bool)

(assert (=> b!1202604 (=> (not res!800201) (not e!683018))))

(assert (=> b!1202604 (= res!800201 (and (= (size!38135 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38134 _keys!1208) (size!38135 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100762 res!800212) b!1202587))

(assert (= (and b!1202587 res!800209) b!1202604))

(assert (= (and b!1202604 res!800201) b!1202596))

(assert (= (and b!1202596 res!800204) b!1202597))

(assert (= (and b!1202597 res!800205) b!1202589))

(assert (= (and b!1202589 res!800206) b!1202594))

(assert (= (and b!1202594 res!800211) b!1202580))

(assert (= (and b!1202580 res!800199) b!1202598))

(assert (= (and b!1202598 res!800203) b!1202602))

(assert (= (and b!1202602 res!800210) b!1202593))

(assert (= (and b!1202593 (not res!800200)) b!1202591))

(assert (= (and b!1202591 (not res!800208)) b!1202584))

(assert (= (and b!1202584 c!117891) b!1202601))

(assert (= (and b!1202584 (not c!117891)) b!1202588))

(assert (= (or b!1202601 b!1202588) bm!57453))

(assert (= (or b!1202601 b!1202588) bm!57454))

(assert (= (and b!1202584 (not res!800202)) b!1202599))

(assert (= (and b!1202599 (not res!800207)) b!1202586))

(assert (= (and b!1202586 c!117890) b!1202600))

(assert (= (and b!1202586 (not c!117890)) b!1202585))

(assert (= (and b!1202585 c!117889) b!1202582))

(assert (= (and b!1202585 (not c!117889)) b!1202595))

(assert (= (and b!1202595 c!117892) b!1202603))

(assert (= (and b!1202595 (not c!117892)) b!1202581))

(assert (= (or b!1202582 b!1202603) bm!57457))

(assert (= (or b!1202582 b!1202603) bm!57455))

(assert (= (or b!1202582 b!1202603) bm!57456))

(assert (= (or b!1202600 bm!57456) bm!57452))

(assert (= (or b!1202600 bm!57457) bm!57450))

(assert (= (or b!1202600 bm!57455) bm!57451))

(assert (= (and b!1202592 condMapEmpty!47672) mapIsEmpty!47672))

(assert (= (and b!1202592 (not condMapEmpty!47672)) mapNonEmpty!47672))

(get-info :version)

(assert (= (and mapNonEmpty!47672 ((_ is ValueCellFull!14567) mapValue!47672)) b!1202590))

(assert (= (and b!1202592 ((_ is ValueCellFull!14567) mapDefault!47672)) b!1202583))

(assert (= start!100762 b!1202592))

(declare-fun b_lambda!21039 () Bool)

(assert (=> (not b_lambda!21039) (not b!1202591)))

(declare-fun t!39290 () Bool)

(declare-fun tb!10641 () Bool)

(assert (=> (and start!100762 (= defaultEntry!1004 defaultEntry!1004) t!39290) tb!10641))

(declare-fun result!21867 () Bool)

(assert (=> tb!10641 (= result!21867 tp_is_empty!30553)))

(assert (=> b!1202591 t!39290))

(declare-fun b_and!42589 () Bool)

(assert (= b_and!42587 (and (=> t!39290 result!21867) b_and!42589)))

(declare-fun m!1109003 () Bool)

(assert (=> b!1202600 m!1109003))

(declare-fun m!1109005 () Bool)

(assert (=> b!1202600 m!1109005))

(declare-fun m!1109007 () Bool)

(assert (=> b!1202600 m!1109007))

(declare-fun m!1109009 () Bool)

(assert (=> b!1202580 m!1109009))

(declare-fun m!1109011 () Bool)

(assert (=> b!1202593 m!1109011))

(declare-fun m!1109013 () Bool)

(assert (=> b!1202593 m!1109013))

(declare-fun m!1109015 () Bool)

(assert (=> b!1202597 m!1109015))

(declare-fun m!1109017 () Bool)

(assert (=> b!1202602 m!1109017))

(declare-fun m!1109019 () Bool)

(assert (=> bm!57450 m!1109019))

(declare-fun m!1109021 () Bool)

(assert (=> b!1202591 m!1109021))

(declare-fun m!1109023 () Bool)

(assert (=> b!1202591 m!1109023))

(declare-fun m!1109025 () Bool)

(assert (=> b!1202591 m!1109025))

(declare-fun m!1109027 () Bool)

(assert (=> b!1202591 m!1109027))

(declare-fun m!1109029 () Bool)

(assert (=> bm!57452 m!1109029))

(declare-fun m!1109031 () Bool)

(assert (=> bm!57454 m!1109031))

(declare-fun m!1109033 () Bool)

(assert (=> bm!57451 m!1109033))

(declare-fun m!1109035 () Bool)

(assert (=> b!1202594 m!1109035))

(declare-fun m!1109037 () Bool)

(assert (=> start!100762 m!1109037))

(declare-fun m!1109039 () Bool)

(assert (=> start!100762 m!1109039))

(declare-fun m!1109041 () Bool)

(assert (=> mapNonEmpty!47672 m!1109041))

(declare-fun m!1109043 () Bool)

(assert (=> b!1202596 m!1109043))

(declare-fun m!1109045 () Bool)

(assert (=> bm!57453 m!1109045))

(declare-fun m!1109047 () Bool)

(assert (=> b!1202598 m!1109047))

(declare-fun m!1109049 () Bool)

(assert (=> b!1202598 m!1109049))

(declare-fun m!1109051 () Bool)

(assert (=> b!1202584 m!1109051))

(declare-fun m!1109053 () Bool)

(assert (=> b!1202584 m!1109053))

(declare-fun m!1109055 () Bool)

(assert (=> b!1202599 m!1109055))

(assert (=> b!1202599 m!1109031))

(declare-fun m!1109057 () Bool)

(assert (=> b!1202601 m!1109057))

(declare-fun m!1109059 () Bool)

(assert (=> b!1202587 m!1109059))

(check-sat (not b!1202600) (not b!1202596) (not bm!57451) (not start!100762) (not b!1202597) (not b!1202594) (not b_lambda!21039) (not b!1202601) (not b!1202593) (not bm!57450) (not bm!57454) (not b_next!25849) (not b!1202587) (not mapNonEmpty!47672) b_and!42589 tp_is_empty!30553 (not bm!57453) (not b!1202602) (not b!1202584) (not b!1202591) (not b!1202599) (not bm!57452) (not b!1202598))
(check-sat b_and!42589 (not b_next!25849))
