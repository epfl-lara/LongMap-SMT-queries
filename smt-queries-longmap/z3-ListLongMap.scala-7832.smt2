; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97972 () Bool)

(assert start!97972)

(declare-fun b_free!23437 () Bool)

(declare-fun b_next!23437 () Bool)

(assert (=> start!97972 (= b_free!23437 (not b_next!23437))))

(declare-fun tp!83015 () Bool)

(declare-fun b_and!37721 () Bool)

(assert (=> start!97972 (= tp!83015 b_and!37721)))

(declare-fun b!1118919 () Bool)

(declare-fun res!746850 () Bool)

(declare-fun e!637482 () Bool)

(assert (=> b!1118919 (=> (not res!746850) (not e!637482))))

(declare-datatypes ((array!72871 0))(
  ( (array!72872 (arr!35082 (Array (_ BitVec 32) (_ BitVec 64))) (size!35619 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72871)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42417 0))(
  ( (V!42418 (val!14040 Int)) )
))
(declare-datatypes ((ValueCell!13274 0))(
  ( (ValueCellFull!13274 (v!16669 V!42417)) (EmptyCell!13274) )
))
(declare-datatypes ((array!72873 0))(
  ( (array!72874 (arr!35083 (Array (_ BitVec 32) ValueCell!13274)) (size!35620 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72873)

(assert (=> b!1118919 (= res!746850 (and (= (size!35620 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35619 _keys!1208) (size!35620 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118920 () Bool)

(declare-fun res!746856 () Bool)

(assert (=> b!1118920 (=> (not res!746856) (not e!637482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118920 (= res!746856 (validMask!0 mask!1564))))

(declare-fun b!1118921 () Bool)

(declare-fun e!637483 () Bool)

(declare-fun e!637484 () Bool)

(assert (=> b!1118921 (= e!637483 (not e!637484))))

(declare-fun res!746847 () Bool)

(assert (=> b!1118921 (=> res!746847 e!637484)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118921 (= res!746847 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118921 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36661 0))(
  ( (Unit!36662) )
))
(declare-fun lt!497829 () Unit!36661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72871 (_ BitVec 64) (_ BitVec 32)) Unit!36661)

(assert (=> b!1118921 (= lt!497829 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118922 () Bool)

(declare-fun e!637480 () Bool)

(declare-fun tp_is_empty!27967 () Bool)

(assert (=> b!1118922 (= e!637480 tp_is_empty!27967)))

(declare-fun b!1118923 () Bool)

(declare-fun res!746853 () Bool)

(assert (=> b!1118923 (=> (not res!746853) (not e!637482))))

(assert (=> b!1118923 (= res!746853 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35619 _keys!1208))))))

(declare-fun b!1118924 () Bool)

(declare-fun res!746854 () Bool)

(assert (=> b!1118924 (=> (not res!746854) (not e!637482))))

(assert (=> b!1118924 (= res!746854 (= (select (arr!35082 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43768 () Bool)

(declare-fun mapRes!43768 () Bool)

(assert (=> mapIsEmpty!43768 mapRes!43768))

(declare-fun b!1118925 () Bool)

(declare-fun res!746848 () Bool)

(assert (=> b!1118925 (=> (not res!746848) (not e!637482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72871 (_ BitVec 32)) Bool)

(assert (=> b!1118925 (= res!746848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118926 () Bool)

(declare-fun res!746849 () Bool)

(assert (=> b!1118926 (=> (not res!746849) (not e!637483))))

(declare-fun lt!497828 () array!72871)

(declare-datatypes ((List!24415 0))(
  ( (Nil!24412) (Cons!24411 (h!25629 (_ BitVec 64)) (t!34888 List!24415)) )
))
(declare-fun arrayNoDuplicates!0 (array!72871 (_ BitVec 32) List!24415) Bool)

(assert (=> b!1118926 (= res!746849 (arrayNoDuplicates!0 lt!497828 #b00000000000000000000000000000000 Nil!24412))))

(declare-fun b!1118927 () Bool)

(declare-fun res!746857 () Bool)

(assert (=> b!1118927 (=> (not res!746857) (not e!637482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118927 (= res!746857 (validKeyInArray!0 k0!934))))

(declare-fun b!1118928 () Bool)

(declare-fun e!637479 () Bool)

(assert (=> b!1118928 (= e!637479 (and e!637480 mapRes!43768))))

(declare-fun condMapEmpty!43768 () Bool)

(declare-fun mapDefault!43768 () ValueCell!13274)

(assert (=> b!1118928 (= condMapEmpty!43768 (= (arr!35083 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13274)) mapDefault!43768)))))

(declare-fun res!746852 () Bool)

(assert (=> start!97972 (=> (not res!746852) (not e!637482))))

(assert (=> start!97972 (= res!746852 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35619 _keys!1208))))))

(assert (=> start!97972 e!637482))

(assert (=> start!97972 tp_is_empty!27967))

(declare-fun array_inv!27026 (array!72871) Bool)

(assert (=> start!97972 (array_inv!27026 _keys!1208)))

(assert (=> start!97972 true))

(assert (=> start!97972 tp!83015))

(declare-fun array_inv!27027 (array!72873) Bool)

(assert (=> start!97972 (and (array_inv!27027 _values!996) e!637479)))

(declare-fun mapNonEmpty!43768 () Bool)

(declare-fun tp!83014 () Bool)

(declare-fun e!637485 () Bool)

(assert (=> mapNonEmpty!43768 (= mapRes!43768 (and tp!83014 e!637485))))

(declare-fun mapKey!43768 () (_ BitVec 32))

(declare-fun mapRest!43768 () (Array (_ BitVec 32) ValueCell!13274))

(declare-fun mapValue!43768 () ValueCell!13274)

(assert (=> mapNonEmpty!43768 (= (arr!35083 _values!996) (store mapRest!43768 mapKey!43768 mapValue!43768))))

(declare-fun b!1118929 () Bool)

(assert (=> b!1118929 (= e!637482 e!637483)))

(declare-fun res!746855 () Bool)

(assert (=> b!1118929 (=> (not res!746855) (not e!637483))))

(assert (=> b!1118929 (= res!746855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497828 mask!1564))))

(assert (=> b!1118929 (= lt!497828 (array!72872 (store (arr!35082 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35619 _keys!1208)))))

(declare-fun b!1118930 () Bool)

(assert (=> b!1118930 (= e!637484 true)))

(declare-fun zeroValue!944 () V!42417)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42417)

(declare-datatypes ((tuple2!17626 0))(
  ( (tuple2!17627 (_1!8824 (_ BitVec 64)) (_2!8824 V!42417)) )
))
(declare-datatypes ((List!24416 0))(
  ( (Nil!24413) (Cons!24412 (h!25630 tuple2!17626) (t!34889 List!24416)) )
))
(declare-datatypes ((ListLongMap!15603 0))(
  ( (ListLongMap!15604 (toList!7817 List!24416)) )
))
(declare-fun lt!497830 () ListLongMap!15603)

(declare-fun getCurrentListMapNoExtraKeys!4347 (array!72871 array!72873 (_ BitVec 32) (_ BitVec 32) V!42417 V!42417 (_ BitVec 32) Int) ListLongMap!15603)

(assert (=> b!1118930 (= lt!497830 (getCurrentListMapNoExtraKeys!4347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118931 () Bool)

(declare-fun res!746851 () Bool)

(assert (=> b!1118931 (=> (not res!746851) (not e!637482))))

(assert (=> b!1118931 (= res!746851 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24412))))

(declare-fun b!1118932 () Bool)

(assert (=> b!1118932 (= e!637485 tp_is_empty!27967)))

(assert (= (and start!97972 res!746852) b!1118920))

(assert (= (and b!1118920 res!746856) b!1118919))

(assert (= (and b!1118919 res!746850) b!1118925))

(assert (= (and b!1118925 res!746848) b!1118931))

(assert (= (and b!1118931 res!746851) b!1118923))

(assert (= (and b!1118923 res!746853) b!1118927))

(assert (= (and b!1118927 res!746857) b!1118924))

(assert (= (and b!1118924 res!746854) b!1118929))

(assert (= (and b!1118929 res!746855) b!1118926))

(assert (= (and b!1118926 res!746849) b!1118921))

(assert (= (and b!1118921 (not res!746847)) b!1118930))

(assert (= (and b!1118928 condMapEmpty!43768) mapIsEmpty!43768))

(assert (= (and b!1118928 (not condMapEmpty!43768)) mapNonEmpty!43768))

(get-info :version)

(assert (= (and mapNonEmpty!43768 ((_ is ValueCellFull!13274) mapValue!43768)) b!1118932))

(assert (= (and b!1118928 ((_ is ValueCellFull!13274) mapDefault!43768)) b!1118922))

(assert (= start!97972 b!1118928))

(declare-fun m!1035087 () Bool)

(assert (=> b!1118926 m!1035087))

(declare-fun m!1035089 () Bool)

(assert (=> start!97972 m!1035089))

(declare-fun m!1035091 () Bool)

(assert (=> start!97972 m!1035091))

(declare-fun m!1035093 () Bool)

(assert (=> b!1118924 m!1035093))

(declare-fun m!1035095 () Bool)

(assert (=> b!1118929 m!1035095))

(declare-fun m!1035097 () Bool)

(assert (=> b!1118929 m!1035097))

(declare-fun m!1035099 () Bool)

(assert (=> b!1118920 m!1035099))

(declare-fun m!1035101 () Bool)

(assert (=> mapNonEmpty!43768 m!1035101))

(declare-fun m!1035103 () Bool)

(assert (=> b!1118931 m!1035103))

(declare-fun m!1035105 () Bool)

(assert (=> b!1118921 m!1035105))

(declare-fun m!1035107 () Bool)

(assert (=> b!1118921 m!1035107))

(declare-fun m!1035109 () Bool)

(assert (=> b!1118927 m!1035109))

(declare-fun m!1035111 () Bool)

(assert (=> b!1118930 m!1035111))

(declare-fun m!1035113 () Bool)

(assert (=> b!1118925 m!1035113))

(check-sat (not b!1118920) (not b_next!23437) b_and!37721 tp_is_empty!27967 (not start!97972) (not b!1118931) (not b!1118925) (not b!1118926) (not b!1118921) (not mapNonEmpty!43768) (not b!1118927) (not b!1118929) (not b!1118930))
(check-sat b_and!37721 (not b_next!23437))
