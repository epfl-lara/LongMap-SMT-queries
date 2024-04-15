; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100508 () Bool)

(assert start!100508)

(declare-fun b_free!25837 () Bool)

(declare-fun b_next!25837 () Bool)

(assert (=> start!100508 (= b_free!25837 (not b_next!25837))))

(declare-fun tp!90501 () Bool)

(declare-fun b_and!42539 () Bool)

(assert (=> start!100508 (= tp!90501 b_and!42539)))

(declare-fun b!1200817 () Bool)

(declare-fun e!681918 () Bool)

(declare-fun tp_is_empty!30541 () Bool)

(assert (=> b!1200817 (= e!681918 tp_is_empty!30541)))

(declare-fun b!1200818 () Bool)

(declare-fun res!799401 () Bool)

(declare-fun e!681913 () Bool)

(assert (=> b!1200818 (=> (not res!799401) (not e!681913))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200818 (= res!799401 (validKeyInArray!0 k0!934))))

(declare-fun b!1200819 () Bool)

(declare-fun res!799398 () Bool)

(assert (=> b!1200819 (=> (not res!799398) (not e!681913))))

(declare-datatypes ((array!77780 0))(
  ( (array!77781 (arr!37535 (Array (_ BitVec 32) (_ BitVec 64))) (size!38073 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77780)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45849 0))(
  ( (V!45850 (val!15327 Int)) )
))
(declare-datatypes ((ValueCell!14561 0))(
  ( (ValueCellFull!14561 (v!17964 V!45849)) (EmptyCell!14561) )
))
(declare-datatypes ((array!77782 0))(
  ( (array!77783 (arr!37536 (Array (_ BitVec 32) ValueCell!14561)) (size!38074 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77782)

(assert (=> b!1200819 (= res!799398 (and (= (size!38074 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38073 _keys!1208) (size!38074 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200820 () Bool)

(declare-fun res!799392 () Bool)

(assert (=> b!1200820 (=> (not res!799392) (not e!681913))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200820 (= res!799392 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38073 _keys!1208))))))

(declare-fun b!1200821 () Bool)

(declare-fun res!799395 () Bool)

(assert (=> b!1200821 (=> (not res!799395) (not e!681913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77780 (_ BitVec 32)) Bool)

(assert (=> b!1200821 (= res!799395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57314 () Bool)

(declare-fun minValue!944 () V!45849)

(declare-datatypes ((tuple2!19712 0))(
  ( (tuple2!19713 (_1!9867 (_ BitVec 64)) (_2!9867 V!45849)) )
))
(declare-datatypes ((List!26501 0))(
  ( (Nil!26498) (Cons!26497 (h!27706 tuple2!19712) (t!39309 List!26501)) )
))
(declare-datatypes ((ListLongMap!17681 0))(
  ( (ListLongMap!17682 (toList!8856 List!26501)) )
))
(declare-fun call!57318 () ListLongMap!17681)

(declare-fun zeroValue!944 () V!45849)

(declare-fun getCurrentListMapNoExtraKeys!5304 (array!77780 array!77782 (_ BitVec 32) (_ BitVec 32) V!45849 V!45849 (_ BitVec 32) Int) ListLongMap!17681)

(assert (=> bm!57314 (= call!57318 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47654 () Bool)

(declare-fun mapRes!47654 () Bool)

(assert (=> mapIsEmpty!47654 mapRes!47654))

(declare-fun b!1200822 () Bool)

(declare-fun res!799399 () Bool)

(assert (=> b!1200822 (=> (not res!799399) (not e!681913))))

(assert (=> b!1200822 (= res!799399 (= (select (arr!37535 _keys!1208) i!673) k0!934))))

(declare-fun res!799400 () Bool)

(assert (=> start!100508 (=> (not res!799400) (not e!681913))))

(assert (=> start!100508 (= res!799400 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38073 _keys!1208))))))

(assert (=> start!100508 e!681913))

(assert (=> start!100508 tp_is_empty!30541))

(declare-fun array_inv!28712 (array!77780) Bool)

(assert (=> start!100508 (array_inv!28712 _keys!1208)))

(assert (=> start!100508 true))

(assert (=> start!100508 tp!90501))

(declare-fun e!681915 () Bool)

(declare-fun array_inv!28713 (array!77782) Bool)

(assert (=> start!100508 (and (array_inv!28713 _values!996) e!681915)))

(declare-fun b!1200823 () Bool)

(declare-fun e!681914 () Bool)

(declare-fun e!681910 () Bool)

(assert (=> b!1200823 (= e!681914 e!681910)))

(declare-fun res!799393 () Bool)

(assert (=> b!1200823 (=> res!799393 e!681910)))

(assert (=> b!1200823 (= res!799393 (not (= (select (arr!37535 _keys!1208) from!1455) k0!934)))))

(declare-fun e!681917 () Bool)

(assert (=> b!1200823 e!681917))

(declare-fun c!117441 () Bool)

(assert (=> b!1200823 (= c!117441 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39671 0))(
  ( (Unit!39672) )
))
(declare-fun lt!544042 () Unit!39671)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1005 (array!77780 array!77782 (_ BitVec 32) (_ BitVec 32) V!45849 V!45849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39671)

(assert (=> b!1200823 (= lt!544042 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200824 () Bool)

(declare-fun e!681919 () Bool)

(assert (=> b!1200824 (= e!681915 (and e!681919 mapRes!47654))))

(declare-fun condMapEmpty!47654 () Bool)

(declare-fun mapDefault!47654 () ValueCell!14561)

(assert (=> b!1200824 (= condMapEmpty!47654 (= (arr!37536 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14561)) mapDefault!47654)))))

(declare-fun b!1200825 () Bool)

(declare-fun res!799390 () Bool)

(assert (=> b!1200825 (=> (not res!799390) (not e!681913))))

(declare-datatypes ((List!26502 0))(
  ( (Nil!26499) (Cons!26498 (h!27707 (_ BitVec 64)) (t!39310 List!26502)) )
))
(declare-fun arrayNoDuplicates!0 (array!77780 (_ BitVec 32) List!26502) Bool)

(assert (=> b!1200825 (= res!799390 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26499))))

(declare-fun b!1200826 () Bool)

(assert (=> b!1200826 (= e!681919 tp_is_empty!30541)))

(declare-fun b!1200827 () Bool)

(declare-fun call!57317 () ListLongMap!17681)

(assert (=> b!1200827 (= e!681917 (= call!57317 call!57318))))

(declare-fun b!1200828 () Bool)

(declare-fun e!681916 () Bool)

(assert (=> b!1200828 (= e!681916 e!681914)))

(declare-fun res!799394 () Bool)

(assert (=> b!1200828 (=> res!799394 e!681914)))

(assert (=> b!1200828 (= res!799394 (not (= from!1455 i!673)))))

(declare-fun lt!544043 () array!77782)

(declare-fun lt!544040 () ListLongMap!17681)

(declare-fun lt!544039 () array!77780)

(assert (=> b!1200828 (= lt!544040 (getCurrentListMapNoExtraKeys!5304 lt!544039 lt!544043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3183 (Int (_ BitVec 64)) V!45849)

(assert (=> b!1200828 (= lt!544043 (array!77783 (store (arr!37536 _values!996) i!673 (ValueCellFull!14561 (dynLambda!3183 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38074 _values!996)))))

(declare-fun lt!544045 () ListLongMap!17681)

(assert (=> b!1200828 (= lt!544045 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47654 () Bool)

(declare-fun tp!90500 () Bool)

(assert (=> mapNonEmpty!47654 (= mapRes!47654 (and tp!90500 e!681918))))

(declare-fun mapValue!47654 () ValueCell!14561)

(declare-fun mapKey!47654 () (_ BitVec 32))

(declare-fun mapRest!47654 () (Array (_ BitVec 32) ValueCell!14561))

(assert (=> mapNonEmpty!47654 (= (arr!37536 _values!996) (store mapRest!47654 mapKey!47654 mapValue!47654))))

(declare-fun b!1200829 () Bool)

(declare-fun -!1755 (ListLongMap!17681 (_ BitVec 64)) ListLongMap!17681)

(assert (=> b!1200829 (= e!681917 (= call!57317 (-!1755 call!57318 k0!934)))))

(declare-fun b!1200830 () Bool)

(declare-fun e!681911 () Bool)

(assert (=> b!1200830 (= e!681913 e!681911)))

(declare-fun res!799391 () Bool)

(assert (=> b!1200830 (=> (not res!799391) (not e!681911))))

(assert (=> b!1200830 (= res!799391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544039 mask!1564))))

(assert (=> b!1200830 (= lt!544039 (array!77781 (store (arr!37535 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38073 _keys!1208)))))

(declare-fun bm!57315 () Bool)

(assert (=> bm!57315 (= call!57317 (getCurrentListMapNoExtraKeys!5304 lt!544039 lt!544043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200831 () Bool)

(declare-fun res!799396 () Bool)

(assert (=> b!1200831 (=> (not res!799396) (not e!681911))))

(assert (=> b!1200831 (= res!799396 (arrayNoDuplicates!0 lt!544039 #b00000000000000000000000000000000 Nil!26499))))

(declare-fun b!1200832 () Bool)

(declare-fun res!799397 () Bool)

(assert (=> b!1200832 (=> (not res!799397) (not e!681913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200832 (= res!799397 (validMask!0 mask!1564))))

(declare-fun b!1200833 () Bool)

(assert (=> b!1200833 (= e!681910 true)))

(declare-fun lt!544041 () Bool)

(declare-fun contains!6851 (ListLongMap!17681 (_ BitVec 64)) Bool)

(assert (=> b!1200833 (= lt!544041 (contains!6851 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1200834 () Bool)

(assert (=> b!1200834 (= e!681911 (not e!681916))))

(declare-fun res!799389 () Bool)

(assert (=> b!1200834 (=> res!799389 e!681916)))

(assert (=> b!1200834 (= res!799389 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200834 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544044 () Unit!39671)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77780 (_ BitVec 64) (_ BitVec 32)) Unit!39671)

(assert (=> b!1200834 (= lt!544044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100508 res!799400) b!1200832))

(assert (= (and b!1200832 res!799397) b!1200819))

(assert (= (and b!1200819 res!799398) b!1200821))

(assert (= (and b!1200821 res!799395) b!1200825))

(assert (= (and b!1200825 res!799390) b!1200820))

(assert (= (and b!1200820 res!799392) b!1200818))

(assert (= (and b!1200818 res!799401) b!1200822))

(assert (= (and b!1200822 res!799399) b!1200830))

(assert (= (and b!1200830 res!799391) b!1200831))

(assert (= (and b!1200831 res!799396) b!1200834))

(assert (= (and b!1200834 (not res!799389)) b!1200828))

(assert (= (and b!1200828 (not res!799394)) b!1200823))

(assert (= (and b!1200823 c!117441) b!1200829))

(assert (= (and b!1200823 (not c!117441)) b!1200827))

(assert (= (or b!1200829 b!1200827) bm!57315))

(assert (= (or b!1200829 b!1200827) bm!57314))

(assert (= (and b!1200823 (not res!799393)) b!1200833))

(assert (= (and b!1200824 condMapEmpty!47654) mapIsEmpty!47654))

(assert (= (and b!1200824 (not condMapEmpty!47654)) mapNonEmpty!47654))

(get-info :version)

(assert (= (and mapNonEmpty!47654 ((_ is ValueCellFull!14561) mapValue!47654)) b!1200817))

(assert (= (and b!1200824 ((_ is ValueCellFull!14561) mapDefault!47654)) b!1200826))

(assert (= start!100508 b!1200824))

(declare-fun b_lambda!21015 () Bool)

(assert (=> (not b_lambda!21015) (not b!1200828)))

(declare-fun t!39308 () Bool)

(declare-fun tb!10629 () Bool)

(assert (=> (and start!100508 (= defaultEntry!1004 defaultEntry!1004) t!39308) tb!10629))

(declare-fun result!21843 () Bool)

(assert (=> tb!10629 (= result!21843 tp_is_empty!30541)))

(assert (=> b!1200828 t!39308))

(declare-fun b_and!42541 () Bool)

(assert (= b_and!42539 (and (=> t!39308 result!21843) b_and!42541)))

(declare-fun m!1106545 () Bool)

(assert (=> b!1200830 m!1106545))

(declare-fun m!1106547 () Bool)

(assert (=> b!1200830 m!1106547))

(declare-fun m!1106549 () Bool)

(assert (=> b!1200833 m!1106549))

(assert (=> b!1200833 m!1106549))

(declare-fun m!1106551 () Bool)

(assert (=> b!1200833 m!1106551))

(declare-fun m!1106553 () Bool)

(assert (=> b!1200823 m!1106553))

(declare-fun m!1106555 () Bool)

(assert (=> b!1200823 m!1106555))

(declare-fun m!1106557 () Bool)

(assert (=> mapNonEmpty!47654 m!1106557))

(declare-fun m!1106559 () Bool)

(assert (=> start!100508 m!1106559))

(declare-fun m!1106561 () Bool)

(assert (=> start!100508 m!1106561))

(declare-fun m!1106563 () Bool)

(assert (=> b!1200828 m!1106563))

(declare-fun m!1106565 () Bool)

(assert (=> b!1200828 m!1106565))

(declare-fun m!1106567 () Bool)

(assert (=> b!1200828 m!1106567))

(declare-fun m!1106569 () Bool)

(assert (=> b!1200828 m!1106569))

(declare-fun m!1106571 () Bool)

(assert (=> b!1200832 m!1106571))

(declare-fun m!1106573 () Bool)

(assert (=> bm!57315 m!1106573))

(declare-fun m!1106575 () Bool)

(assert (=> b!1200831 m!1106575))

(declare-fun m!1106577 () Bool)

(assert (=> b!1200822 m!1106577))

(declare-fun m!1106579 () Bool)

(assert (=> b!1200821 m!1106579))

(declare-fun m!1106581 () Bool)

(assert (=> b!1200834 m!1106581))

(declare-fun m!1106583 () Bool)

(assert (=> b!1200834 m!1106583))

(declare-fun m!1106585 () Bool)

(assert (=> b!1200818 m!1106585))

(assert (=> bm!57314 m!1106549))

(declare-fun m!1106587 () Bool)

(assert (=> b!1200829 m!1106587))

(declare-fun m!1106589 () Bool)

(assert (=> b!1200825 m!1106589))

(check-sat (not b_next!25837) (not b!1200831) (not b!1200833) b_and!42541 (not b!1200818) tp_is_empty!30541 (not b_lambda!21015) (not b!1200821) (not b!1200825) (not b!1200828) (not b!1200829) (not mapNonEmpty!47654) (not b!1200823) (not bm!57315) (not bm!57314) (not b!1200832) (not start!100508) (not b!1200830) (not b!1200834))
(check-sat b_and!42541 (not b_next!25837))
