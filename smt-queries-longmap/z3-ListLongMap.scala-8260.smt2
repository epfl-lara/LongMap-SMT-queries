; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100744 () Bool)

(assert start!100744)

(declare-fun b_free!25831 () Bool)

(declare-fun b_next!25831 () Bool)

(assert (=> start!100744 (= b_free!25831 (not b_next!25831))))

(declare-fun tp!90482 () Bool)

(declare-fun b_and!42551 () Bool)

(assert (=> start!100744 (= tp!90482 b_and!42551)))

(declare-fun mapIsEmpty!47645 () Bool)

(declare-fun mapRes!47645 () Bool)

(assert (=> mapIsEmpty!47645 mapRes!47645))

(declare-fun b!1202048 () Bool)

(declare-fun e!682729 () Bool)

(declare-fun e!682723 () Bool)

(assert (=> b!1202048 (= e!682729 (not e!682723))))

(declare-fun res!799843 () Bool)

(assert (=> b!1202048 (=> res!799843 e!682723)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202048 (= res!799843 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77881 0))(
  ( (array!77882 (arr!37579 (Array (_ BitVec 32) (_ BitVec 64))) (size!38116 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77881)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202048 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39771 0))(
  ( (Unit!39772) )
))
(declare-fun lt!544647 () Unit!39771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77881 (_ BitVec 64) (_ BitVec 32)) Unit!39771)

(assert (=> b!1202048 (= lt!544647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202049 () Bool)

(declare-fun e!682732 () Bool)

(declare-fun e!682725 () Bool)

(assert (=> b!1202049 (= e!682732 e!682725)))

(declare-fun res!799841 () Bool)

(assert (=> b!1202049 (=> res!799841 e!682725)))

(declare-datatypes ((V!45841 0))(
  ( (V!45842 (val!15324 Int)) )
))
(declare-datatypes ((tuple2!19638 0))(
  ( (tuple2!19639 (_1!9830 (_ BitVec 64)) (_2!9830 V!45841)) )
))
(declare-datatypes ((List!26453 0))(
  ( (Nil!26450) (Cons!26449 (h!27667 tuple2!19638) (t!39256 List!26453)) )
))
(declare-datatypes ((ListLongMap!17615 0))(
  ( (ListLongMap!17616 (toList!8823 List!26453)) )
))
(declare-fun lt!544649 () ListLongMap!17615)

(declare-fun contains!6902 (ListLongMap!17615 (_ BitVec 64)) Bool)

(assert (=> b!1202049 (= res!799841 (not (contains!6902 lt!544649 k0!934)))))

(declare-fun zeroValue!944 () V!45841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14558 0))(
  ( (ValueCellFull!14558 (v!17958 V!45841)) (EmptyCell!14558) )
))
(declare-datatypes ((array!77883 0))(
  ( (array!77884 (arr!37580 (Array (_ BitVec 32) ValueCell!14558)) (size!38117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77883)

(declare-fun minValue!944 () V!45841)

(declare-fun getCurrentListMapNoExtraKeys!5290 (array!77881 array!77883 (_ BitVec 32) (_ BitVec 32) V!45841 V!45841 (_ BitVec 32) Int) ListLongMap!17615)

(assert (=> b!1202049 (= lt!544649 (getCurrentListMapNoExtraKeys!5290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!682726 () Bool)

(declare-fun b!1202050 () Bool)

(declare-fun call!57387 () ListLongMap!17615)

(declare-fun call!57388 () ListLongMap!17615)

(declare-fun -!1783 (ListLongMap!17615 (_ BitVec 64)) ListLongMap!17615)

(assert (=> b!1202050 (= e!682726 (= call!57388 (-!1783 call!57387 k0!934)))))

(declare-fun b!1202051 () Bool)

(declare-fun res!799832 () Bool)

(declare-fun e!682727 () Bool)

(assert (=> b!1202051 (=> (not res!799832) (not e!682727))))

(assert (=> b!1202051 (= res!799832 (= (select (arr!37579 _keys!1208) i!673) k0!934))))

(declare-fun res!799845 () Bool)

(assert (=> start!100744 (=> (not res!799845) (not e!682727))))

(assert (=> start!100744 (= res!799845 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38116 _keys!1208))))))

(assert (=> start!100744 e!682727))

(declare-fun tp_is_empty!30535 () Bool)

(assert (=> start!100744 tp_is_empty!30535))

(declare-fun array_inv!28704 (array!77881) Bool)

(assert (=> start!100744 (array_inv!28704 _keys!1208)))

(assert (=> start!100744 true))

(assert (=> start!100744 tp!90482))

(declare-fun e!682731 () Bool)

(declare-fun array_inv!28705 (array!77883) Bool)

(assert (=> start!100744 (and (array_inv!28705 _values!996) e!682731)))

(declare-fun b!1202052 () Bool)

(declare-fun res!799839 () Bool)

(assert (=> b!1202052 (=> (not res!799839) (not e!682727))))

(declare-datatypes ((List!26454 0))(
  ( (Nil!26451) (Cons!26450 (h!27668 (_ BitVec 64)) (t!39257 List!26454)) )
))
(declare-fun arrayNoDuplicates!0 (array!77881 (_ BitVec 32) List!26454) Bool)

(assert (=> b!1202052 (= res!799839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26451))))

(declare-fun b!1202053 () Bool)

(assert (=> b!1202053 (= e!682726 (= call!57388 call!57387))))

(declare-fun b!1202054 () Bool)

(assert (=> b!1202054 (= e!682727 e!682729)))

(declare-fun res!799833 () Bool)

(assert (=> b!1202054 (=> (not res!799833) (not e!682729))))

(declare-fun lt!544650 () array!77881)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77881 (_ BitVec 32)) Bool)

(assert (=> b!1202054 (= res!799833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544650 mask!1564))))

(assert (=> b!1202054 (= lt!544650 (array!77882 (store (arr!37579 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38116 _keys!1208)))))

(declare-fun b!1202055 () Bool)

(declare-fun e!682724 () Bool)

(assert (=> b!1202055 (= e!682731 (and e!682724 mapRes!47645))))

(declare-fun condMapEmpty!47645 () Bool)

(declare-fun mapDefault!47645 () ValueCell!14558)

(assert (=> b!1202055 (= condMapEmpty!47645 (= (arr!37580 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14558)) mapDefault!47645)))))

(declare-fun bm!57384 () Bool)

(assert (=> bm!57384 (= call!57387 (getCurrentListMapNoExtraKeys!5290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57385 () Bool)

(declare-fun lt!544646 () array!77883)

(assert (=> bm!57385 (= call!57388 (getCurrentListMapNoExtraKeys!5290 lt!544650 lt!544646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202056 () Bool)

(declare-fun e!682733 () Bool)

(assert (=> b!1202056 (= e!682723 e!682733)))

(declare-fun res!799840 () Bool)

(assert (=> b!1202056 (=> res!799840 e!682733)))

(assert (=> b!1202056 (= res!799840 (not (= from!1455 i!673)))))

(declare-fun lt!544645 () ListLongMap!17615)

(assert (=> b!1202056 (= lt!544645 (getCurrentListMapNoExtraKeys!5290 lt!544650 lt!544646 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3233 (Int (_ BitVec 64)) V!45841)

(assert (=> b!1202056 (= lt!544646 (array!77884 (store (arr!37580 _values!996) i!673 (ValueCellFull!14558 (dynLambda!3233 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38117 _values!996)))))

(declare-fun lt!544651 () ListLongMap!17615)

(assert (=> b!1202056 (= lt!544651 (getCurrentListMapNoExtraKeys!5290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202057 () Bool)

(declare-fun res!799836 () Bool)

(assert (=> b!1202057 (=> (not res!799836) (not e!682727))))

(assert (=> b!1202057 (= res!799836 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38116 _keys!1208))))))

(declare-fun b!1202058 () Bool)

(declare-fun res!799834 () Bool)

(assert (=> b!1202058 (=> (not res!799834) (not e!682727))))

(assert (=> b!1202058 (= res!799834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202059 () Bool)

(declare-fun res!799835 () Bool)

(assert (=> b!1202059 (=> (not res!799835) (not e!682727))))

(assert (=> b!1202059 (= res!799835 (and (= (size!38117 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38116 _keys!1208) (size!38117 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202060 () Bool)

(declare-fun res!799842 () Bool)

(assert (=> b!1202060 (=> (not res!799842) (not e!682729))))

(assert (=> b!1202060 (= res!799842 (arrayNoDuplicates!0 lt!544650 #b00000000000000000000000000000000 Nil!26451))))

(declare-fun b!1202061 () Bool)

(assert (=> b!1202061 (= e!682725 true)))

(declare-fun +!3998 (ListLongMap!17615 tuple2!19638) ListLongMap!17615)

(assert (=> b!1202061 (contains!6902 (+!3998 lt!544649 (tuple2!19639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!544648 () Unit!39771)

(declare-fun addStillContains!985 (ListLongMap!17615 (_ BitVec 64) V!45841 (_ BitVec 64)) Unit!39771)

(assert (=> b!1202061 (= lt!544648 (addStillContains!985 lt!544649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun mapNonEmpty!47645 () Bool)

(declare-fun tp!90483 () Bool)

(declare-fun e!682730 () Bool)

(assert (=> mapNonEmpty!47645 (= mapRes!47645 (and tp!90483 e!682730))))

(declare-fun mapValue!47645 () ValueCell!14558)

(declare-fun mapRest!47645 () (Array (_ BitVec 32) ValueCell!14558))

(declare-fun mapKey!47645 () (_ BitVec 32))

(assert (=> mapNonEmpty!47645 (= (arr!37580 _values!996) (store mapRest!47645 mapKey!47645 mapValue!47645))))

(declare-fun b!1202062 () Bool)

(assert (=> b!1202062 (= e!682730 tp_is_empty!30535)))

(declare-fun b!1202063 () Bool)

(declare-fun res!799838 () Bool)

(assert (=> b!1202063 (=> (not res!799838) (not e!682727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202063 (= res!799838 (validMask!0 mask!1564))))

(declare-fun b!1202064 () Bool)

(declare-fun res!799837 () Bool)

(assert (=> b!1202064 (=> (not res!799837) (not e!682727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202064 (= res!799837 (validKeyInArray!0 k0!934))))

(declare-fun b!1202065 () Bool)

(assert (=> b!1202065 (= e!682733 e!682732)))

(declare-fun res!799844 () Bool)

(assert (=> b!1202065 (=> res!799844 e!682732)))

(assert (=> b!1202065 (= res!799844 (not (= (select (arr!37579 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202065 e!682726))

(declare-fun c!117856 () Bool)

(assert (=> b!1202065 (= c!117856 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544652 () Unit!39771)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1001 (array!77881 array!77883 (_ BitVec 32) (_ BitVec 32) V!45841 V!45841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39771)

(assert (=> b!1202065 (= lt!544652 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1001 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202066 () Bool)

(assert (=> b!1202066 (= e!682724 tp_is_empty!30535)))

(declare-fun b!1202067 () Bool)

(declare-fun res!799846 () Bool)

(assert (=> b!1202067 (=> res!799846 e!682725)))

(assert (=> b!1202067 (= res!799846 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!100744 res!799845) b!1202063))

(assert (= (and b!1202063 res!799838) b!1202059))

(assert (= (and b!1202059 res!799835) b!1202058))

(assert (= (and b!1202058 res!799834) b!1202052))

(assert (= (and b!1202052 res!799839) b!1202057))

(assert (= (and b!1202057 res!799836) b!1202064))

(assert (= (and b!1202064 res!799837) b!1202051))

(assert (= (and b!1202051 res!799832) b!1202054))

(assert (= (and b!1202054 res!799833) b!1202060))

(assert (= (and b!1202060 res!799842) b!1202048))

(assert (= (and b!1202048 (not res!799843)) b!1202056))

(assert (= (and b!1202056 (not res!799840)) b!1202065))

(assert (= (and b!1202065 c!117856) b!1202050))

(assert (= (and b!1202065 (not c!117856)) b!1202053))

(assert (= (or b!1202050 b!1202053) bm!57385))

(assert (= (or b!1202050 b!1202053) bm!57384))

(assert (= (and b!1202065 (not res!799844)) b!1202049))

(assert (= (and b!1202049 (not res!799841)) b!1202067))

(assert (= (and b!1202067 (not res!799846)) b!1202061))

(assert (= (and b!1202055 condMapEmpty!47645) mapIsEmpty!47645))

(assert (= (and b!1202055 (not condMapEmpty!47645)) mapNonEmpty!47645))

(get-info :version)

(assert (= (and mapNonEmpty!47645 ((_ is ValueCellFull!14558) mapValue!47645)) b!1202062))

(assert (= (and b!1202055 ((_ is ValueCellFull!14558) mapDefault!47645)) b!1202066))

(assert (= start!100744 b!1202055))

(declare-fun b_lambda!21021 () Bool)

(assert (=> (not b_lambda!21021) (not b!1202056)))

(declare-fun t!39255 () Bool)

(declare-fun tb!10623 () Bool)

(assert (=> (and start!100744 (= defaultEntry!1004 defaultEntry!1004) t!39255) tb!10623))

(declare-fun result!21831 () Bool)

(assert (=> tb!10623 (= result!21831 tp_is_empty!30535)))

(assert (=> b!1202056 t!39255))

(declare-fun b_and!42553 () Bool)

(assert (= b_and!42551 (and (=> t!39255 result!21831) b_and!42553)))

(declare-fun m!1108571 () Bool)

(assert (=> b!1202056 m!1108571))

(declare-fun m!1108573 () Bool)

(assert (=> b!1202056 m!1108573))

(declare-fun m!1108575 () Bool)

(assert (=> b!1202056 m!1108575))

(declare-fun m!1108577 () Bool)

(assert (=> b!1202056 m!1108577))

(declare-fun m!1108579 () Bool)

(assert (=> b!1202064 m!1108579))

(declare-fun m!1108581 () Bool)

(assert (=> b!1202060 m!1108581))

(declare-fun m!1108583 () Bool)

(assert (=> b!1202049 m!1108583))

(declare-fun m!1108585 () Bool)

(assert (=> b!1202049 m!1108585))

(declare-fun m!1108587 () Bool)

(assert (=> bm!57385 m!1108587))

(declare-fun m!1108589 () Bool)

(assert (=> b!1202052 m!1108589))

(assert (=> bm!57384 m!1108585))

(declare-fun m!1108591 () Bool)

(assert (=> b!1202061 m!1108591))

(assert (=> b!1202061 m!1108591))

(declare-fun m!1108593 () Bool)

(assert (=> b!1202061 m!1108593))

(declare-fun m!1108595 () Bool)

(assert (=> b!1202061 m!1108595))

(declare-fun m!1108597 () Bool)

(assert (=> b!1202065 m!1108597))

(declare-fun m!1108599 () Bool)

(assert (=> b!1202065 m!1108599))

(declare-fun m!1108601 () Bool)

(assert (=> b!1202054 m!1108601))

(declare-fun m!1108603 () Bool)

(assert (=> b!1202054 m!1108603))

(declare-fun m!1108605 () Bool)

(assert (=> b!1202050 m!1108605))

(declare-fun m!1108607 () Bool)

(assert (=> b!1202063 m!1108607))

(declare-fun m!1108609 () Bool)

(assert (=> start!100744 m!1108609))

(declare-fun m!1108611 () Bool)

(assert (=> start!100744 m!1108611))

(declare-fun m!1108613 () Bool)

(assert (=> b!1202058 m!1108613))

(declare-fun m!1108615 () Bool)

(assert (=> b!1202051 m!1108615))

(declare-fun m!1108617 () Bool)

(assert (=> b!1202048 m!1108617))

(declare-fun m!1108619 () Bool)

(assert (=> b!1202048 m!1108619))

(declare-fun m!1108621 () Bool)

(assert (=> mapNonEmpty!47645 m!1108621))

(check-sat (not b!1202065) (not b!1202064) (not bm!57384) (not bm!57385) (not b_next!25831) (not b!1202061) (not b!1202056) (not b_lambda!21021) (not b!1202050) b_and!42553 (not start!100744) (not b!1202049) (not b!1202063) (not b!1202054) (not b!1202058) (not b!1202048) (not b!1202060) (not mapNonEmpty!47645) (not b!1202052) tp_is_empty!30535)
(check-sat b_and!42553 (not b_next!25831))
