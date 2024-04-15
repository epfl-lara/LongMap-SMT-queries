; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99544 () Bool)

(assert start!99544)

(declare-fun b_free!25129 () Bool)

(declare-fun b_next!25129 () Bool)

(assert (=> start!99544 (= b_free!25129 (not b_next!25129))))

(declare-fun tp!88100 () Bool)

(declare-fun b_and!41103 () Bool)

(assert (=> start!99544 (= tp!88100 b_and!41103)))

(declare-fun b!1177911 () Bool)

(declare-fun res!782499 () Bool)

(declare-fun e!669613 () Bool)

(assert (=> b!1177911 (=> (not res!782499) (not e!669613))))

(declare-datatypes ((array!76056 0))(
  ( (array!76057 (arr!36678 (Array (_ BitVec 32) (_ BitVec 64))) (size!37216 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76056)

(declare-datatypes ((List!25861 0))(
  ( (Nil!25858) (Cons!25857 (h!27066 (_ BitVec 64)) (t!37973 List!25861)) )
))
(declare-fun arrayNoDuplicates!0 (array!76056 (_ BitVec 32) List!25861) Bool)

(assert (=> b!1177911 (= res!782499 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25858))))

(declare-fun b!1177912 () Bool)

(declare-fun res!782490 () Bool)

(assert (=> b!1177912 (=> (not res!782490) (not e!669613))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76056 (_ BitVec 32)) Bool)

(assert (=> b!1177912 (= res!782490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177913 () Bool)

(declare-fun e!669614 () Bool)

(assert (=> b!1177913 (= e!669614 true)))

(declare-fun e!669616 () Bool)

(assert (=> b!1177913 e!669616))

(declare-fun res!782494 () Bool)

(assert (=> b!1177913 (=> (not res!782494) (not e!669616))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177913 (= res!782494 (not (= (select (arr!36678 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38752 0))(
  ( (Unit!38753) )
))
(declare-fun lt!531882 () Unit!38752)

(declare-fun e!669621 () Unit!38752)

(assert (=> b!1177913 (= lt!531882 e!669621)))

(declare-fun c!116791 () Bool)

(assert (=> b!1177913 (= c!116791 (= (select (arr!36678 _keys!1208) from!1455) k0!934))))

(declare-fun e!669620 () Bool)

(assert (=> b!1177913 e!669620))

(declare-fun res!782496 () Bool)

(assert (=> b!1177913 (=> (not res!782496) (not e!669620))))

(declare-datatypes ((V!44673 0))(
  ( (V!44674 (val!14886 Int)) )
))
(declare-datatypes ((tuple2!19154 0))(
  ( (tuple2!19155 (_1!9588 (_ BitVec 64)) (_2!9588 V!44673)) )
))
(declare-datatypes ((List!25862 0))(
  ( (Nil!25859) (Cons!25858 (h!27067 tuple2!19154) (t!37974 List!25862)) )
))
(declare-datatypes ((ListLongMap!17123 0))(
  ( (ListLongMap!17124 (toList!8577 List!25862)) )
))
(declare-fun lt!531881 () ListLongMap!17123)

(declare-fun lt!531887 () ListLongMap!17123)

(declare-fun lt!531885 () tuple2!19154)

(declare-fun +!3879 (ListLongMap!17123 tuple2!19154) ListLongMap!17123)

(assert (=> b!1177913 (= res!782496 (= lt!531881 (+!3879 lt!531887 lt!531885)))))

(declare-fun lt!531890 () V!44673)

(declare-datatypes ((ValueCell!14120 0))(
  ( (ValueCellFull!14120 (v!17523 V!44673)) (EmptyCell!14120) )
))
(declare-datatypes ((array!76058 0))(
  ( (array!76059 (arr!36679 (Array (_ BitVec 32) ValueCell!14120)) (size!37217 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76058)

(declare-fun get!18749 (ValueCell!14120 V!44673) V!44673)

(assert (=> b!1177913 (= lt!531885 (tuple2!19155 (select (arr!36678 _keys!1208) from!1455) (get!18749 (select (arr!36679 _values!996) from!1455) lt!531890)))))

(declare-fun mapNonEmpty!46316 () Bool)

(declare-fun mapRes!46316 () Bool)

(declare-fun tp!88101 () Bool)

(declare-fun e!669617 () Bool)

(assert (=> mapNonEmpty!46316 (= mapRes!46316 (and tp!88101 e!669617))))

(declare-fun mapKey!46316 () (_ BitVec 32))

(declare-fun mapRest!46316 () (Array (_ BitVec 32) ValueCell!14120))

(declare-fun mapValue!46316 () ValueCell!14120)

(assert (=> mapNonEmpty!46316 (= (arr!36679 _values!996) (store mapRest!46316 mapKey!46316 mapValue!46316))))

(declare-fun b!1177914 () Bool)

(declare-fun res!782492 () Bool)

(declare-fun e!669624 () Bool)

(assert (=> b!1177914 (=> (not res!782492) (not e!669624))))

(declare-fun lt!531884 () array!76056)

(assert (=> b!1177914 (= res!782492 (arrayNoDuplicates!0 lt!531884 #b00000000000000000000000000000000 Nil!25858))))

(declare-fun b!1177915 () Bool)

(declare-fun e!669622 () Bool)

(assert (=> b!1177915 (= e!669622 e!669614)))

(declare-fun res!782502 () Bool)

(assert (=> b!1177915 (=> res!782502 e!669614)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177915 (= res!782502 (not (validKeyInArray!0 (select (arr!36678 _keys!1208) from!1455))))))

(declare-fun lt!531883 () ListLongMap!17123)

(assert (=> b!1177915 (= lt!531883 lt!531887)))

(declare-fun lt!531878 () ListLongMap!17123)

(declare-fun -!1546 (ListLongMap!17123 (_ BitVec 64)) ListLongMap!17123)

(assert (=> b!1177915 (= lt!531887 (-!1546 lt!531878 k0!934))))

(declare-fun zeroValue!944 () V!44673)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!44673)

(declare-fun lt!531880 () array!76058)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5039 (array!76056 array!76058 (_ BitVec 32) (_ BitVec 32) V!44673 V!44673 (_ BitVec 32) Int) ListLongMap!17123)

(assert (=> b!1177915 (= lt!531883 (getCurrentListMapNoExtraKeys!5039 lt!531884 lt!531880 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177915 (= lt!531878 (getCurrentListMapNoExtraKeys!5039 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!531886 () Unit!38752)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!810 (array!76056 array!76058 (_ BitVec 32) (_ BitVec 32) V!44673 V!44673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38752)

(assert (=> b!1177915 (= lt!531886 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177916 () Bool)

(assert (=> b!1177916 (= e!669613 e!669624)))

(declare-fun res!782503 () Bool)

(assert (=> b!1177916 (=> (not res!782503) (not e!669624))))

(assert (=> b!1177916 (= res!782503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531884 mask!1564))))

(assert (=> b!1177916 (= lt!531884 (array!76057 (store (arr!36678 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37216 _keys!1208)))))

(declare-fun b!1177917 () Bool)

(declare-fun tp_is_empty!29659 () Bool)

(assert (=> b!1177917 (= e!669617 tp_is_empty!29659)))

(declare-fun b!1177918 () Bool)

(declare-fun res!782497 () Bool)

(assert (=> b!1177918 (=> (not res!782497) (not e!669613))))

(assert (=> b!1177918 (= res!782497 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37216 _keys!1208))))))

(declare-fun lt!531888 () ListLongMap!17123)

(declare-fun b!1177919 () Bool)

(assert (=> b!1177919 (= e!669616 (= lt!531888 (+!3879 lt!531878 lt!531885)))))

(declare-fun b!1177920 () Bool)

(declare-fun res!782488 () Bool)

(assert (=> b!1177920 (=> (not res!782488) (not e!669613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177920 (= res!782488 (validMask!0 mask!1564))))

(declare-fun b!1177921 () Bool)

(declare-fun Unit!38754 () Unit!38752)

(assert (=> b!1177921 (= e!669621 Unit!38754)))

(declare-fun lt!531891 () Unit!38752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76056 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38752)

(assert (=> b!1177921 (= lt!531891 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177921 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531877 () Unit!38752)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76056 (_ BitVec 32) (_ BitVec 32)) Unit!38752)

(assert (=> b!1177921 (= lt!531877 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177921 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25858)))

(declare-fun lt!531879 () Unit!38752)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76056 (_ BitVec 64) (_ BitVec 32) List!25861) Unit!38752)

(assert (=> b!1177921 (= lt!531879 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25858))))

(assert (=> b!1177921 false))

(declare-fun mapIsEmpty!46316 () Bool)

(assert (=> mapIsEmpty!46316 mapRes!46316))

(declare-fun e!669615 () Bool)

(declare-fun b!1177922 () Bool)

(assert (=> b!1177922 (= e!669615 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177923 () Bool)

(declare-fun Unit!38755 () Unit!38752)

(assert (=> b!1177923 (= e!669621 Unit!38755)))

(declare-fun b!1177924 () Bool)

(declare-fun res!782489 () Bool)

(assert (=> b!1177924 (=> (not res!782489) (not e!669613))))

(assert (=> b!1177924 (= res!782489 (validKeyInArray!0 k0!934))))

(declare-fun b!1177925 () Bool)

(assert (=> b!1177925 (= e!669620 e!669615)))

(declare-fun res!782495 () Bool)

(assert (=> b!1177925 (=> res!782495 e!669615)))

(assert (=> b!1177925 (= res!782495 (not (= (select (arr!36678 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177926 () Bool)

(declare-fun e!669619 () Bool)

(assert (=> b!1177926 (= e!669624 (not e!669619))))

(declare-fun res!782501 () Bool)

(assert (=> b!1177926 (=> res!782501 e!669619)))

(assert (=> b!1177926 (= res!782501 (bvsgt from!1455 i!673))))

(assert (=> b!1177926 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531889 () Unit!38752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76056 (_ BitVec 64) (_ BitVec 32)) Unit!38752)

(assert (=> b!1177926 (= lt!531889 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177927 () Bool)

(declare-fun res!782500 () Bool)

(assert (=> b!1177927 (=> (not res!782500) (not e!669613))))

(assert (=> b!1177927 (= res!782500 (= (select (arr!36678 _keys!1208) i!673) k0!934))))

(declare-fun res!782491 () Bool)

(assert (=> start!99544 (=> (not res!782491) (not e!669613))))

(assert (=> start!99544 (= res!782491 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37216 _keys!1208))))))

(assert (=> start!99544 e!669613))

(assert (=> start!99544 tp_is_empty!29659))

(declare-fun array_inv!28118 (array!76056) Bool)

(assert (=> start!99544 (array_inv!28118 _keys!1208)))

(assert (=> start!99544 true))

(assert (=> start!99544 tp!88100))

(declare-fun e!669623 () Bool)

(declare-fun array_inv!28119 (array!76058) Bool)

(assert (=> start!99544 (and (array_inv!28119 _values!996) e!669623)))

(declare-fun b!1177928 () Bool)

(assert (=> b!1177928 (= e!669619 e!669622)))

(declare-fun res!782498 () Bool)

(assert (=> b!1177928 (=> res!782498 e!669622)))

(assert (=> b!1177928 (= res!782498 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1177928 (= lt!531881 (getCurrentListMapNoExtraKeys!5039 lt!531884 lt!531880 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177928 (= lt!531880 (array!76059 (store (arr!36679 _values!996) i!673 (ValueCellFull!14120 lt!531890)) (size!37217 _values!996)))))

(declare-fun dynLambda!2955 (Int (_ BitVec 64)) V!44673)

(assert (=> b!1177928 (= lt!531890 (dynLambda!2955 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177928 (= lt!531888 (getCurrentListMapNoExtraKeys!5039 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177929 () Bool)

(declare-fun e!669618 () Bool)

(assert (=> b!1177929 (= e!669618 tp_is_empty!29659)))

(declare-fun b!1177930 () Bool)

(declare-fun res!782493 () Bool)

(assert (=> b!1177930 (=> (not res!782493) (not e!669613))))

(assert (=> b!1177930 (= res!782493 (and (= (size!37217 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37216 _keys!1208) (size!37217 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177931 () Bool)

(assert (=> b!1177931 (= e!669623 (and e!669618 mapRes!46316))))

(declare-fun condMapEmpty!46316 () Bool)

(declare-fun mapDefault!46316 () ValueCell!14120)

(assert (=> b!1177931 (= condMapEmpty!46316 (= (arr!36679 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14120)) mapDefault!46316)))))

(assert (= (and start!99544 res!782491) b!1177920))

(assert (= (and b!1177920 res!782488) b!1177930))

(assert (= (and b!1177930 res!782493) b!1177912))

(assert (= (and b!1177912 res!782490) b!1177911))

(assert (= (and b!1177911 res!782499) b!1177918))

(assert (= (and b!1177918 res!782497) b!1177924))

(assert (= (and b!1177924 res!782489) b!1177927))

(assert (= (and b!1177927 res!782500) b!1177916))

(assert (= (and b!1177916 res!782503) b!1177914))

(assert (= (and b!1177914 res!782492) b!1177926))

(assert (= (and b!1177926 (not res!782501)) b!1177928))

(assert (= (and b!1177928 (not res!782498)) b!1177915))

(assert (= (and b!1177915 (not res!782502)) b!1177913))

(assert (= (and b!1177913 res!782496) b!1177925))

(assert (= (and b!1177925 (not res!782495)) b!1177922))

(assert (= (and b!1177913 c!116791) b!1177921))

(assert (= (and b!1177913 (not c!116791)) b!1177923))

(assert (= (and b!1177913 res!782494) b!1177919))

(assert (= (and b!1177931 condMapEmpty!46316) mapIsEmpty!46316))

(assert (= (and b!1177931 (not condMapEmpty!46316)) mapNonEmpty!46316))

(get-info :version)

(assert (= (and mapNonEmpty!46316 ((_ is ValueCellFull!14120) mapValue!46316)) b!1177917))

(assert (= (and b!1177931 ((_ is ValueCellFull!14120) mapDefault!46316)) b!1177929))

(assert (= start!99544 b!1177931))

(declare-fun b_lambda!20255 () Bool)

(assert (=> (not b_lambda!20255) (not b!1177928)))

(declare-fun t!37972 () Bool)

(declare-fun tb!9933 () Bool)

(assert (=> (and start!99544 (= defaultEntry!1004 defaultEntry!1004) t!37972) tb!9933))

(declare-fun result!20441 () Bool)

(assert (=> tb!9933 (= result!20441 tp_is_empty!29659)))

(assert (=> b!1177928 t!37972))

(declare-fun b_and!41105 () Bool)

(assert (= b_and!41103 (and (=> t!37972 result!20441) b_and!41105)))

(declare-fun m!1085381 () Bool)

(assert (=> b!1177922 m!1085381))

(declare-fun m!1085383 () Bool)

(assert (=> b!1177916 m!1085383))

(declare-fun m!1085385 () Bool)

(assert (=> b!1177916 m!1085385))

(declare-fun m!1085387 () Bool)

(assert (=> b!1177912 m!1085387))

(declare-fun m!1085389 () Bool)

(assert (=> b!1177914 m!1085389))

(declare-fun m!1085391 () Bool)

(assert (=> b!1177924 m!1085391))

(declare-fun m!1085393 () Bool)

(assert (=> b!1177921 m!1085393))

(declare-fun m!1085395 () Bool)

(assert (=> b!1177921 m!1085395))

(declare-fun m!1085397 () Bool)

(assert (=> b!1177921 m!1085397))

(declare-fun m!1085399 () Bool)

(assert (=> b!1177921 m!1085399))

(declare-fun m!1085401 () Bool)

(assert (=> b!1177921 m!1085401))

(declare-fun m!1085403 () Bool)

(assert (=> b!1177915 m!1085403))

(declare-fun m!1085405 () Bool)

(assert (=> b!1177915 m!1085405))

(declare-fun m!1085407 () Bool)

(assert (=> b!1177915 m!1085407))

(declare-fun m!1085409 () Bool)

(assert (=> b!1177915 m!1085409))

(declare-fun m!1085411 () Bool)

(assert (=> b!1177915 m!1085411))

(declare-fun m!1085413 () Bool)

(assert (=> b!1177915 m!1085413))

(assert (=> b!1177915 m!1085409))

(declare-fun m!1085415 () Bool)

(assert (=> b!1177919 m!1085415))

(declare-fun m!1085417 () Bool)

(assert (=> start!99544 m!1085417))

(declare-fun m!1085419 () Bool)

(assert (=> start!99544 m!1085419))

(declare-fun m!1085421 () Bool)

(assert (=> mapNonEmpty!46316 m!1085421))

(assert (=> b!1177913 m!1085409))

(declare-fun m!1085423 () Bool)

(assert (=> b!1177913 m!1085423))

(declare-fun m!1085425 () Bool)

(assert (=> b!1177913 m!1085425))

(assert (=> b!1177913 m!1085425))

(declare-fun m!1085427 () Bool)

(assert (=> b!1177913 m!1085427))

(assert (=> b!1177925 m!1085409))

(declare-fun m!1085429 () Bool)

(assert (=> b!1177927 m!1085429))

(declare-fun m!1085431 () Bool)

(assert (=> b!1177920 m!1085431))

(declare-fun m!1085433 () Bool)

(assert (=> b!1177911 m!1085433))

(declare-fun m!1085435 () Bool)

(assert (=> b!1177928 m!1085435))

(declare-fun m!1085437 () Bool)

(assert (=> b!1177928 m!1085437))

(declare-fun m!1085439 () Bool)

(assert (=> b!1177928 m!1085439))

(declare-fun m!1085441 () Bool)

(assert (=> b!1177928 m!1085441))

(declare-fun m!1085443 () Bool)

(assert (=> b!1177926 m!1085443))

(declare-fun m!1085445 () Bool)

(assert (=> b!1177926 m!1085445))

(check-sat (not mapNonEmpty!46316) (not b!1177919) (not b_next!25129) b_and!41105 (not b_lambda!20255) (not b!1177928) (not b!1177924) (not b!1177921) (not b!1177914) (not b!1177915) (not b!1177911) (not b!1177920) (not b!1177912) (not start!99544) (not b!1177913) (not b!1177926) (not b!1177922) tp_is_empty!29659 (not b!1177916))
(check-sat b_and!41105 (not b_next!25129))
