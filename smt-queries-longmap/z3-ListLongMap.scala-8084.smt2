; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99606 () Bool)

(assert start!99606)

(declare-fun b_free!24949 () Bool)

(declare-fun b_next!24949 () Bool)

(assert (=> start!99606 (= b_free!24949 (not b_next!24949))))

(declare-fun tp!87561 () Bool)

(declare-fun b_and!40767 () Bool)

(assert (=> start!99606 (= tp!87561 b_and!40767)))

(declare-fun b!1173620 () Bool)

(declare-fun res!778868 () Bool)

(declare-fun e!667183 () Bool)

(assert (=> b!1173620 (=> (not res!778868) (not e!667183))))

(declare-datatypes ((array!75827 0))(
  ( (array!75828 (arr!36557 (Array (_ BitVec 32) (_ BitVec 64))) (size!37094 (_ BitVec 32))) )
))
(declare-fun lt!528698 () array!75827)

(declare-datatypes ((List!25675 0))(
  ( (Nil!25672) (Cons!25671 (h!26889 (_ BitVec 64)) (t!37608 List!25675)) )
))
(declare-fun arrayNoDuplicates!0 (array!75827 (_ BitVec 32) List!25675) Bool)

(assert (=> b!1173620 (= res!778868 (arrayNoDuplicates!0 lt!528698 #b00000000000000000000000000000000 Nil!25672))))

(declare-fun _keys!1208 () array!75827)

(declare-fun b!1173621 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!667177 () Bool)

(declare-fun arrayContainsKey!0 (array!75827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173621 (= e!667177 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173622 () Bool)

(declare-fun res!778863 () Bool)

(declare-fun e!667182 () Bool)

(assert (=> b!1173622 (=> res!778863 e!667182)))

(declare-fun contains!6890 (List!25675 (_ BitVec 64)) Bool)

(assert (=> b!1173622 (= res!778863 (contains!6890 Nil!25672 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173623 () Bool)

(declare-fun e!667179 () Bool)

(assert (=> b!1173623 (= e!667179 e!667183)))

(declare-fun res!778866 () Bool)

(assert (=> b!1173623 (=> (not res!778866) (not e!667183))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75827 (_ BitVec 32)) Bool)

(assert (=> b!1173623 (= res!778866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528698 mask!1564))))

(assert (=> b!1173623 (= lt!528698 (array!75828 (store (arr!36557 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37094 _keys!1208)))))

(declare-fun b!1173624 () Bool)

(declare-fun res!778856 () Bool)

(assert (=> b!1173624 (=> (not res!778856) (not e!667179))))

(assert (=> b!1173624 (= res!778856 (= (select (arr!36557 _keys!1208) i!673) k0!934))))

(declare-fun b!1173625 () Bool)

(declare-fun res!778867 () Bool)

(assert (=> b!1173625 (=> res!778867 e!667182)))

(declare-fun noDuplicate!1636 (List!25675) Bool)

(assert (=> b!1173625 (= res!778867 (not (noDuplicate!1636 Nil!25672)))))

(declare-fun res!778874 () Bool)

(assert (=> start!99606 (=> (not res!778874) (not e!667179))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99606 (= res!778874 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37094 _keys!1208))))))

(assert (=> start!99606 e!667179))

(declare-fun tp_is_empty!29479 () Bool)

(assert (=> start!99606 tp_is_empty!29479))

(declare-fun array_inv!28008 (array!75827) Bool)

(assert (=> start!99606 (array_inv!28008 _keys!1208)))

(assert (=> start!99606 true))

(assert (=> start!99606 tp!87561))

(declare-datatypes ((V!44433 0))(
  ( (V!44434 (val!14796 Int)) )
))
(declare-datatypes ((ValueCell!14030 0))(
  ( (ValueCellFull!14030 (v!17430 V!44433)) (EmptyCell!14030) )
))
(declare-datatypes ((array!75829 0))(
  ( (array!75830 (arr!36558 (Array (_ BitVec 32) ValueCell!14030)) (size!37095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75829)

(declare-fun e!667176 () Bool)

(declare-fun array_inv!28009 (array!75829) Bool)

(assert (=> start!99606 (and (array_inv!28009 _values!996) e!667176)))

(declare-fun b!1173626 () Bool)

(assert (=> b!1173626 (= e!667182 true)))

(declare-fun lt!528707 () Bool)

(assert (=> b!1173626 (= lt!528707 (contains!6890 Nil!25672 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1173627 () Bool)

(declare-fun res!778865 () Bool)

(assert (=> b!1173627 (=> (not res!778865) (not e!667179))))

(assert (=> b!1173627 (= res!778865 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25672))))

(declare-fun b!1173628 () Bool)

(declare-fun res!778869 () Bool)

(assert (=> b!1173628 (=> (not res!778869) (not e!667179))))

(assert (=> b!1173628 (= res!778869 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37094 _keys!1208))))))

(declare-fun b!1173629 () Bool)

(declare-fun res!778860 () Bool)

(assert (=> b!1173629 (=> (not res!778860) (not e!667179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173629 (= res!778860 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46046 () Bool)

(declare-fun mapRes!46046 () Bool)

(assert (=> mapIsEmpty!46046 mapRes!46046))

(declare-fun b!1173630 () Bool)

(declare-fun e!667180 () Bool)

(declare-fun e!667181 () Bool)

(assert (=> b!1173630 (= e!667180 e!667181)))

(declare-fun res!778858 () Bool)

(assert (=> b!1173630 (=> res!778858 e!667181)))

(assert (=> b!1173630 (= res!778858 (not (= (select (arr!36557 _keys!1208) from!1455) k0!934)))))

(declare-fun e!667187 () Bool)

(assert (=> b!1173630 e!667187))

(declare-fun res!778871 () Bool)

(assert (=> b!1173630 (=> (not res!778871) (not e!667187))))

(declare-datatypes ((tuple2!18938 0))(
  ( (tuple2!18939 (_1!9480 (_ BitVec 64)) (_2!9480 V!44433)) )
))
(declare-datatypes ((List!25676 0))(
  ( (Nil!25673) (Cons!25672 (h!26890 tuple2!18938) (t!37609 List!25676)) )
))
(declare-datatypes ((ListLongMap!16915 0))(
  ( (ListLongMap!16916 (toList!8473 List!25676)) )
))
(declare-fun lt!528702 () ListLongMap!16915)

(declare-fun lt!528706 () ListLongMap!16915)

(declare-fun lt!528704 () V!44433)

(declare-fun +!3808 (ListLongMap!16915 tuple2!18938) ListLongMap!16915)

(declare-fun get!18676 (ValueCell!14030 V!44433) V!44433)

(assert (=> b!1173630 (= res!778871 (= lt!528706 (+!3808 lt!528702 (tuple2!18939 (select (arr!36557 _keys!1208) from!1455) (get!18676 (select (arr!36558 _values!996) from!1455) lt!528704)))))))

(declare-fun b!1173631 () Bool)

(declare-fun e!667186 () Bool)

(assert (=> b!1173631 (= e!667186 tp_is_empty!29479)))

(declare-fun b!1173632 () Bool)

(declare-fun res!778864 () Bool)

(assert (=> b!1173632 (=> (not res!778864) (not e!667179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173632 (= res!778864 (validKeyInArray!0 k0!934))))

(declare-fun b!1173633 () Bool)

(declare-fun res!778870 () Bool)

(assert (=> b!1173633 (=> (not res!778870) (not e!667179))))

(assert (=> b!1173633 (= res!778870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173634 () Bool)

(assert (=> b!1173634 (= e!667187 e!667177)))

(declare-fun res!778857 () Bool)

(assert (=> b!1173634 (=> res!778857 e!667177)))

(assert (=> b!1173634 (= res!778857 (not (= (select (arr!36557 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173635 () Bool)

(declare-fun res!778873 () Bool)

(assert (=> b!1173635 (=> (not res!778873) (not e!667179))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1173635 (= res!778873 (and (= (size!37095 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37094 _keys!1208) (size!37095 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173636 () Bool)

(declare-fun e!667184 () Bool)

(assert (=> b!1173636 (= e!667184 tp_is_empty!29479)))

(declare-fun b!1173637 () Bool)

(assert (=> b!1173637 (= e!667176 (and e!667186 mapRes!46046))))

(declare-fun condMapEmpty!46046 () Bool)

(declare-fun mapDefault!46046 () ValueCell!14030)

(assert (=> b!1173637 (= condMapEmpty!46046 (= (arr!36558 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14030)) mapDefault!46046)))))

(declare-fun b!1173638 () Bool)

(assert (=> b!1173638 (= e!667181 e!667182)))

(declare-fun res!778862 () Bool)

(assert (=> b!1173638 (=> res!778862 e!667182)))

(assert (=> b!1173638 (= res!778862 (or (bvsge (size!37094 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37094 _keys!1208)) (bvsge from!1455 (size!37094 _keys!1208))))))

(assert (=> b!1173638 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25672)))

(declare-datatypes ((Unit!38639 0))(
  ( (Unit!38640) )
))
(declare-fun lt!528705 () Unit!38639)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75827 (_ BitVec 32) (_ BitVec 32)) Unit!38639)

(assert (=> b!1173638 (= lt!528705 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173638 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528708 () Unit!38639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75827 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38639)

(assert (=> b!1173638 (= lt!528708 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1173639 () Bool)

(declare-fun e!667185 () Bool)

(assert (=> b!1173639 (= e!667183 (not e!667185))))

(declare-fun res!778861 () Bool)

(assert (=> b!1173639 (=> res!778861 e!667185)))

(assert (=> b!1173639 (= res!778861 (bvsgt from!1455 i!673))))

(assert (=> b!1173639 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528697 () Unit!38639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75827 (_ BitVec 64) (_ BitVec 32)) Unit!38639)

(assert (=> b!1173639 (= lt!528697 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173640 () Bool)

(declare-fun e!667175 () Bool)

(assert (=> b!1173640 (= e!667175 e!667180)))

(declare-fun res!778872 () Bool)

(assert (=> b!1173640 (=> res!778872 e!667180)))

(assert (=> b!1173640 (= res!778872 (not (validKeyInArray!0 (select (arr!36557 _keys!1208) from!1455))))))

(declare-fun lt!528700 () ListLongMap!16915)

(assert (=> b!1173640 (= lt!528700 lt!528702)))

(declare-fun lt!528701 () ListLongMap!16915)

(declare-fun -!1525 (ListLongMap!16915 (_ BitVec 64)) ListLongMap!16915)

(assert (=> b!1173640 (= lt!528702 (-!1525 lt!528701 k0!934))))

(declare-fun lt!528703 () array!75829)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44433)

(declare-fun zeroValue!944 () V!44433)

(declare-fun getCurrentListMapNoExtraKeys!4960 (array!75827 array!75829 (_ BitVec 32) (_ BitVec 32) V!44433 V!44433 (_ BitVec 32) Int) ListLongMap!16915)

(assert (=> b!1173640 (= lt!528700 (getCurrentListMapNoExtraKeys!4960 lt!528698 lt!528703 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173640 (= lt!528701 (getCurrentListMapNoExtraKeys!4960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528709 () Unit!38639)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!750 (array!75827 array!75829 (_ BitVec 32) (_ BitVec 32) V!44433 V!44433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38639)

(assert (=> b!1173640 (= lt!528709 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!750 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173641 () Bool)

(assert (=> b!1173641 (= e!667185 e!667175)))

(declare-fun res!778859 () Bool)

(assert (=> b!1173641 (=> res!778859 e!667175)))

(assert (=> b!1173641 (= res!778859 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1173641 (= lt!528706 (getCurrentListMapNoExtraKeys!4960 lt!528698 lt!528703 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173641 (= lt!528703 (array!75830 (store (arr!36558 _values!996) i!673 (ValueCellFull!14030 lt!528704)) (size!37095 _values!996)))))

(declare-fun dynLambda!2939 (Int (_ BitVec 64)) V!44433)

(assert (=> b!1173641 (= lt!528704 (dynLambda!2939 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528699 () ListLongMap!16915)

(assert (=> b!1173641 (= lt!528699 (getCurrentListMapNoExtraKeys!4960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46046 () Bool)

(declare-fun tp!87560 () Bool)

(assert (=> mapNonEmpty!46046 (= mapRes!46046 (and tp!87560 e!667184))))

(declare-fun mapRest!46046 () (Array (_ BitVec 32) ValueCell!14030))

(declare-fun mapValue!46046 () ValueCell!14030)

(declare-fun mapKey!46046 () (_ BitVec 32))

(assert (=> mapNonEmpty!46046 (= (arr!36558 _values!996) (store mapRest!46046 mapKey!46046 mapValue!46046))))

(assert (= (and start!99606 res!778874) b!1173629))

(assert (= (and b!1173629 res!778860) b!1173635))

(assert (= (and b!1173635 res!778873) b!1173633))

(assert (= (and b!1173633 res!778870) b!1173627))

(assert (= (and b!1173627 res!778865) b!1173628))

(assert (= (and b!1173628 res!778869) b!1173632))

(assert (= (and b!1173632 res!778864) b!1173624))

(assert (= (and b!1173624 res!778856) b!1173623))

(assert (= (and b!1173623 res!778866) b!1173620))

(assert (= (and b!1173620 res!778868) b!1173639))

(assert (= (and b!1173639 (not res!778861)) b!1173641))

(assert (= (and b!1173641 (not res!778859)) b!1173640))

(assert (= (and b!1173640 (not res!778872)) b!1173630))

(assert (= (and b!1173630 res!778871) b!1173634))

(assert (= (and b!1173634 (not res!778857)) b!1173621))

(assert (= (and b!1173630 (not res!778858)) b!1173638))

(assert (= (and b!1173638 (not res!778862)) b!1173625))

(assert (= (and b!1173625 (not res!778867)) b!1173622))

(assert (= (and b!1173622 (not res!778863)) b!1173626))

(assert (= (and b!1173637 condMapEmpty!46046) mapIsEmpty!46046))

(assert (= (and b!1173637 (not condMapEmpty!46046)) mapNonEmpty!46046))

(get-info :version)

(assert (= (and mapNonEmpty!46046 ((_ is ValueCellFull!14030) mapValue!46046)) b!1173636))

(assert (= (and b!1173637 ((_ is ValueCellFull!14030) mapDefault!46046)) b!1173631))

(assert (= start!99606 b!1173637))

(declare-fun b_lambda!20087 () Bool)

(assert (=> (not b_lambda!20087) (not b!1173641)))

(declare-fun t!37607 () Bool)

(declare-fun tb!9753 () Bool)

(assert (=> (and start!99606 (= defaultEntry!1004 defaultEntry!1004) t!37607) tb!9753))

(declare-fun result!20081 () Bool)

(assert (=> tb!9753 (= result!20081 tp_is_empty!29479)))

(assert (=> b!1173641 t!37607))

(declare-fun b_and!40769 () Bool)

(assert (= b_and!40767 (and (=> t!37607 result!20081) b_and!40769)))

(declare-fun m!1081719 () Bool)

(assert (=> start!99606 m!1081719))

(declare-fun m!1081721 () Bool)

(assert (=> start!99606 m!1081721))

(declare-fun m!1081723 () Bool)

(assert (=> b!1173641 m!1081723))

(declare-fun m!1081725 () Bool)

(assert (=> b!1173641 m!1081725))

(declare-fun m!1081727 () Bool)

(assert (=> b!1173641 m!1081727))

(declare-fun m!1081729 () Bool)

(assert (=> b!1173641 m!1081729))

(declare-fun m!1081731 () Bool)

(assert (=> b!1173634 m!1081731))

(declare-fun m!1081733 () Bool)

(assert (=> b!1173627 m!1081733))

(declare-fun m!1081735 () Bool)

(assert (=> b!1173623 m!1081735))

(declare-fun m!1081737 () Bool)

(assert (=> b!1173623 m!1081737))

(declare-fun m!1081739 () Bool)

(assert (=> b!1173639 m!1081739))

(declare-fun m!1081741 () Bool)

(assert (=> b!1173639 m!1081741))

(declare-fun m!1081743 () Bool)

(assert (=> b!1173625 m!1081743))

(assert (=> b!1173630 m!1081731))

(declare-fun m!1081745 () Bool)

(assert (=> b!1173630 m!1081745))

(assert (=> b!1173630 m!1081745))

(declare-fun m!1081747 () Bool)

(assert (=> b!1173630 m!1081747))

(declare-fun m!1081749 () Bool)

(assert (=> b!1173630 m!1081749))

(declare-fun m!1081751 () Bool)

(assert (=> b!1173633 m!1081751))

(declare-fun m!1081753 () Bool)

(assert (=> b!1173620 m!1081753))

(declare-fun m!1081755 () Bool)

(assert (=> b!1173624 m!1081755))

(declare-fun m!1081757 () Bool)

(assert (=> mapNonEmpty!46046 m!1081757))

(declare-fun m!1081759 () Bool)

(assert (=> b!1173640 m!1081759))

(declare-fun m!1081761 () Bool)

(assert (=> b!1173640 m!1081761))

(assert (=> b!1173640 m!1081731))

(declare-fun m!1081763 () Bool)

(assert (=> b!1173640 m!1081763))

(assert (=> b!1173640 m!1081731))

(declare-fun m!1081765 () Bool)

(assert (=> b!1173640 m!1081765))

(declare-fun m!1081767 () Bool)

(assert (=> b!1173640 m!1081767))

(declare-fun m!1081769 () Bool)

(assert (=> b!1173626 m!1081769))

(declare-fun m!1081771 () Bool)

(assert (=> b!1173638 m!1081771))

(declare-fun m!1081773 () Bool)

(assert (=> b!1173638 m!1081773))

(declare-fun m!1081775 () Bool)

(assert (=> b!1173638 m!1081775))

(declare-fun m!1081777 () Bool)

(assert (=> b!1173638 m!1081777))

(declare-fun m!1081779 () Bool)

(assert (=> b!1173621 m!1081779))

(declare-fun m!1081781 () Bool)

(assert (=> b!1173622 m!1081781))

(declare-fun m!1081783 () Bool)

(assert (=> b!1173629 m!1081783))

(declare-fun m!1081785 () Bool)

(assert (=> b!1173632 m!1081785))

(check-sat tp_is_empty!29479 (not b!1173639) (not b!1173632) (not b!1173626) (not b!1173640) (not b!1173638) (not b_next!24949) (not mapNonEmpty!46046) (not b!1173621) (not start!99606) (not b!1173627) (not b_lambda!20087) (not b!1173630) (not b!1173633) (not b!1173625) (not b!1173622) (not b!1173623) (not b!1173629) (not b!1173641) b_and!40769 (not b!1173620))
(check-sat b_and!40769 (not b_next!24949))
