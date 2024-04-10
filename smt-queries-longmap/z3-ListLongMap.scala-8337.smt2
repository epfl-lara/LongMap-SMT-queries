; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101478 () Bool)

(assert start!101478)

(declare-fun b_free!26295 () Bool)

(declare-fun b_next!26295 () Bool)

(assert (=> start!101478 (= b_free!26295 (not b_next!26295))))

(declare-fun tp!91919 () Bool)

(declare-fun b_and!43779 () Bool)

(assert (=> start!101478 (= tp!91919 b_and!43779)))

(declare-fun mapIsEmpty!48385 () Bool)

(declare-fun mapRes!48385 () Bool)

(assert (=> mapIsEmpty!48385 mapRes!48385))

(declare-fun b!1219900 () Bool)

(declare-fun e!692677 () Bool)

(assert (=> b!1219900 (= e!692677 true)))

(declare-datatypes ((array!78775 0))(
  ( (array!78776 (arr!38018 (Array (_ BitVec 32) (_ BitVec 64))) (size!38554 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78775)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219900 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40424 0))(
  ( (Unit!40425) )
))
(declare-fun lt!554690 () Unit!40424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78775 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40424)

(assert (=> b!1219900 (= lt!554690 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219901 () Bool)

(declare-fun e!692670 () Bool)

(declare-fun e!692680 () Bool)

(assert (=> b!1219901 (= e!692670 e!692680)))

(declare-fun res!810311 () Bool)

(assert (=> b!1219901 (=> res!810311 e!692680)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219901 (= res!810311 (not (validKeyInArray!0 (select (arr!38018 _keys!1208) from!1455))))))

(declare-datatypes ((V!46459 0))(
  ( (V!46460 (val!15556 Int)) )
))
(declare-datatypes ((tuple2!20024 0))(
  ( (tuple2!20025 (_1!10023 (_ BitVec 64)) (_2!10023 V!46459)) )
))
(declare-datatypes ((List!26823 0))(
  ( (Nil!26820) (Cons!26819 (h!28028 tuple2!20024) (t!40098 List!26823)) )
))
(declare-datatypes ((ListLongMap!17993 0))(
  ( (ListLongMap!17994 (toList!9012 List!26823)) )
))
(declare-fun lt!554694 () ListLongMap!17993)

(declare-fun lt!554688 () ListLongMap!17993)

(assert (=> b!1219901 (= lt!554694 lt!554688)))

(declare-fun lt!554687 () ListLongMap!17993)

(declare-fun -!1922 (ListLongMap!17993 (_ BitVec 64)) ListLongMap!17993)

(assert (=> b!1219901 (= lt!554688 (-!1922 lt!554687 k0!934))))

(declare-fun zeroValue!944 () V!46459)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554696 () array!78775)

(declare-fun minValue!944 () V!46459)

(declare-datatypes ((ValueCell!14790 0))(
  ( (ValueCellFull!14790 (v!18213 V!46459)) (EmptyCell!14790) )
))
(declare-datatypes ((array!78777 0))(
  ( (array!78778 (arr!38019 (Array (_ BitVec 32) ValueCell!14790)) (size!38555 (_ BitVec 32))) )
))
(declare-fun lt!554695 () array!78777)

(declare-fun getCurrentListMapNoExtraKeys!5435 (array!78775 array!78777 (_ BitVec 32) (_ BitVec 32) V!46459 V!46459 (_ BitVec 32) Int) ListLongMap!17993)

(assert (=> b!1219901 (= lt!554694 (getCurrentListMapNoExtraKeys!5435 lt!554696 lt!554695 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78777)

(assert (=> b!1219901 (= lt!554687 (getCurrentListMapNoExtraKeys!5435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554689 () Unit!40424)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 (array!78775 array!78777 (_ BitVec 32) (_ BitVec 32) V!46459 V!46459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40424)

(assert (=> b!1219901 (= lt!554689 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1129 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219902 () Bool)

(assert (=> b!1219902 (= e!692680 e!692677)))

(declare-fun res!810306 () Bool)

(assert (=> b!1219902 (=> res!810306 e!692677)))

(assert (=> b!1219902 (= res!810306 (not (= (select (arr!38018 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692669 () Bool)

(assert (=> b!1219902 e!692669))

(declare-fun res!810300 () Bool)

(assert (=> b!1219902 (=> (not res!810300) (not e!692669))))

(declare-fun lt!554693 () ListLongMap!17993)

(declare-fun lt!554691 () V!46459)

(declare-fun +!4080 (ListLongMap!17993 tuple2!20024) ListLongMap!17993)

(declare-fun get!19393 (ValueCell!14790 V!46459) V!46459)

(assert (=> b!1219902 (= res!810300 (= lt!554693 (+!4080 lt!554688 (tuple2!20025 (select (arr!38018 _keys!1208) from!1455) (get!19393 (select (arr!38019 _values!996) from!1455) lt!554691)))))))

(declare-fun b!1219903 () Bool)

(declare-fun res!810310 () Bool)

(declare-fun e!692675 () Bool)

(assert (=> b!1219903 (=> (not res!810310) (not e!692675))))

(declare-datatypes ((List!26824 0))(
  ( (Nil!26821) (Cons!26820 (h!28029 (_ BitVec 64)) (t!40099 List!26824)) )
))
(declare-fun arrayNoDuplicates!0 (array!78775 (_ BitVec 32) List!26824) Bool)

(assert (=> b!1219903 (= res!810310 (arrayNoDuplicates!0 lt!554696 #b00000000000000000000000000000000 Nil!26821))))

(declare-fun b!1219904 () Bool)

(declare-fun e!692672 () Bool)

(assert (=> b!1219904 (= e!692672 e!692675)))

(declare-fun res!810301 () Bool)

(assert (=> b!1219904 (=> (not res!810301) (not e!692675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78775 (_ BitVec 32)) Bool)

(assert (=> b!1219904 (= res!810301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554696 mask!1564))))

(assert (=> b!1219904 (= lt!554696 (array!78776 (store (arr!38018 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38554 _keys!1208)))))

(declare-fun b!1219905 () Bool)

(declare-fun e!692671 () Bool)

(assert (=> b!1219905 (= e!692669 e!692671)))

(declare-fun res!810312 () Bool)

(assert (=> b!1219905 (=> res!810312 e!692671)))

(assert (=> b!1219905 (= res!810312 (not (= (select (arr!38018 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219906 () Bool)

(assert (=> b!1219906 (= e!692671 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219907 () Bool)

(declare-fun res!810302 () Bool)

(assert (=> b!1219907 (=> (not res!810302) (not e!692672))))

(assert (=> b!1219907 (= res!810302 (= (select (arr!38018 _keys!1208) i!673) k0!934))))

(declare-fun b!1219908 () Bool)

(declare-fun res!810299 () Bool)

(assert (=> b!1219908 (=> (not res!810299) (not e!692672))))

(assert (=> b!1219908 (= res!810299 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38554 _keys!1208))))))

(declare-fun b!1219909 () Bool)

(declare-fun res!810303 () Bool)

(assert (=> b!1219909 (=> (not res!810303) (not e!692672))))

(assert (=> b!1219909 (= res!810303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219910 () Bool)

(declare-fun e!692679 () Bool)

(assert (=> b!1219910 (= e!692675 (not e!692679))))

(declare-fun res!810308 () Bool)

(assert (=> b!1219910 (=> res!810308 e!692679)))

(assert (=> b!1219910 (= res!810308 (bvsgt from!1455 i!673))))

(assert (=> b!1219910 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554692 () Unit!40424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78775 (_ BitVec 64) (_ BitVec 32)) Unit!40424)

(assert (=> b!1219910 (= lt!554692 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219911 () Bool)

(assert (=> b!1219911 (= e!692679 e!692670)))

(declare-fun res!810304 () Bool)

(assert (=> b!1219911 (=> res!810304 e!692670)))

(assert (=> b!1219911 (= res!810304 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1219911 (= lt!554693 (getCurrentListMapNoExtraKeys!5435 lt!554696 lt!554695 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219911 (= lt!554695 (array!78778 (store (arr!38019 _values!996) i!673 (ValueCellFull!14790 lt!554691)) (size!38555 _values!996)))))

(declare-fun dynLambda!3317 (Int (_ BitVec 64)) V!46459)

(assert (=> b!1219911 (= lt!554691 (dynLambda!3317 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554697 () ListLongMap!17993)

(assert (=> b!1219911 (= lt!554697 (getCurrentListMapNoExtraKeys!5435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219912 () Bool)

(declare-fun res!810298 () Bool)

(assert (=> b!1219912 (=> (not res!810298) (not e!692672))))

(assert (=> b!1219912 (= res!810298 (validKeyInArray!0 k0!934))))

(declare-fun b!1219913 () Bool)

(declare-fun e!692676 () Bool)

(declare-fun e!692673 () Bool)

(assert (=> b!1219913 (= e!692676 (and e!692673 mapRes!48385))))

(declare-fun condMapEmpty!48385 () Bool)

(declare-fun mapDefault!48385 () ValueCell!14790)

(assert (=> b!1219913 (= condMapEmpty!48385 (= (arr!38019 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14790)) mapDefault!48385)))))

(declare-fun res!810307 () Bool)

(assert (=> start!101478 (=> (not res!810307) (not e!692672))))

(assert (=> start!101478 (= res!810307 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38554 _keys!1208))))))

(assert (=> start!101478 e!692672))

(declare-fun tp_is_empty!30999 () Bool)

(assert (=> start!101478 tp_is_empty!30999))

(declare-fun array_inv!28932 (array!78775) Bool)

(assert (=> start!101478 (array_inv!28932 _keys!1208)))

(assert (=> start!101478 true))

(assert (=> start!101478 tp!91919))

(declare-fun array_inv!28933 (array!78777) Bool)

(assert (=> start!101478 (and (array_inv!28933 _values!996) e!692676)))

(declare-fun mapNonEmpty!48385 () Bool)

(declare-fun tp!91918 () Bool)

(declare-fun e!692674 () Bool)

(assert (=> mapNonEmpty!48385 (= mapRes!48385 (and tp!91918 e!692674))))

(declare-fun mapValue!48385 () ValueCell!14790)

(declare-fun mapKey!48385 () (_ BitVec 32))

(declare-fun mapRest!48385 () (Array (_ BitVec 32) ValueCell!14790))

(assert (=> mapNonEmpty!48385 (= (arr!38019 _values!996) (store mapRest!48385 mapKey!48385 mapValue!48385))))

(declare-fun b!1219914 () Bool)

(declare-fun res!810309 () Bool)

(assert (=> b!1219914 (=> (not res!810309) (not e!692672))))

(assert (=> b!1219914 (= res!810309 (and (= (size!38555 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38554 _keys!1208) (size!38555 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219915 () Bool)

(assert (=> b!1219915 (= e!692673 tp_is_empty!30999)))

(declare-fun b!1219916 () Bool)

(assert (=> b!1219916 (= e!692674 tp_is_empty!30999)))

(declare-fun b!1219917 () Bool)

(declare-fun res!810297 () Bool)

(assert (=> b!1219917 (=> (not res!810297) (not e!692672))))

(assert (=> b!1219917 (= res!810297 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26821))))

(declare-fun b!1219918 () Bool)

(declare-fun res!810305 () Bool)

(assert (=> b!1219918 (=> (not res!810305) (not e!692672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219918 (= res!810305 (validMask!0 mask!1564))))

(assert (= (and start!101478 res!810307) b!1219918))

(assert (= (and b!1219918 res!810305) b!1219914))

(assert (= (and b!1219914 res!810309) b!1219909))

(assert (= (and b!1219909 res!810303) b!1219917))

(assert (= (and b!1219917 res!810297) b!1219908))

(assert (= (and b!1219908 res!810299) b!1219912))

(assert (= (and b!1219912 res!810298) b!1219907))

(assert (= (and b!1219907 res!810302) b!1219904))

(assert (= (and b!1219904 res!810301) b!1219903))

(assert (= (and b!1219903 res!810310) b!1219910))

(assert (= (and b!1219910 (not res!810308)) b!1219911))

(assert (= (and b!1219911 (not res!810304)) b!1219901))

(assert (= (and b!1219901 (not res!810311)) b!1219902))

(assert (= (and b!1219902 res!810300) b!1219905))

(assert (= (and b!1219905 (not res!810312)) b!1219906))

(assert (= (and b!1219902 (not res!810306)) b!1219900))

(assert (= (and b!1219913 condMapEmpty!48385) mapIsEmpty!48385))

(assert (= (and b!1219913 (not condMapEmpty!48385)) mapNonEmpty!48385))

(get-info :version)

(assert (= (and mapNonEmpty!48385 ((_ is ValueCellFull!14790) mapValue!48385)) b!1219916))

(assert (= (and b!1219913 ((_ is ValueCellFull!14790) mapDefault!48385)) b!1219915))

(assert (= start!101478 b!1219913))

(declare-fun b_lambda!22123 () Bool)

(assert (=> (not b_lambda!22123) (not b!1219911)))

(declare-fun t!40097 () Bool)

(declare-fun tb!11095 () Bool)

(assert (=> (and start!101478 (= defaultEntry!1004 defaultEntry!1004) t!40097) tb!11095))

(declare-fun result!22795 () Bool)

(assert (=> tb!11095 (= result!22795 tp_is_empty!30999)))

(assert (=> b!1219911 t!40097))

(declare-fun b_and!43781 () Bool)

(assert (= b_and!43779 (and (=> t!40097 result!22795) b_and!43781)))

(declare-fun m!1124673 () Bool)

(assert (=> mapNonEmpty!48385 m!1124673))

(declare-fun m!1124675 () Bool)

(assert (=> b!1219901 m!1124675))

(declare-fun m!1124677 () Bool)

(assert (=> b!1219901 m!1124677))

(declare-fun m!1124679 () Bool)

(assert (=> b!1219901 m!1124679))

(declare-fun m!1124681 () Bool)

(assert (=> b!1219901 m!1124681))

(declare-fun m!1124683 () Bool)

(assert (=> b!1219901 m!1124683))

(declare-fun m!1124685 () Bool)

(assert (=> b!1219901 m!1124685))

(assert (=> b!1219901 m!1124681))

(declare-fun m!1124687 () Bool)

(assert (=> b!1219904 m!1124687))

(declare-fun m!1124689 () Bool)

(assert (=> b!1219904 m!1124689))

(declare-fun m!1124691 () Bool)

(assert (=> b!1219918 m!1124691))

(declare-fun m!1124693 () Bool)

(assert (=> b!1219903 m!1124693))

(declare-fun m!1124695 () Bool)

(assert (=> b!1219900 m!1124695))

(declare-fun m!1124697 () Bool)

(assert (=> b!1219900 m!1124697))

(declare-fun m!1124699 () Bool)

(assert (=> b!1219909 m!1124699))

(assert (=> b!1219905 m!1124681))

(declare-fun m!1124701 () Bool)

(assert (=> b!1219910 m!1124701))

(declare-fun m!1124703 () Bool)

(assert (=> b!1219910 m!1124703))

(declare-fun m!1124705 () Bool)

(assert (=> b!1219917 m!1124705))

(declare-fun m!1124707 () Bool)

(assert (=> b!1219907 m!1124707))

(declare-fun m!1124709 () Bool)

(assert (=> start!101478 m!1124709))

(declare-fun m!1124711 () Bool)

(assert (=> start!101478 m!1124711))

(declare-fun m!1124713 () Bool)

(assert (=> b!1219906 m!1124713))

(assert (=> b!1219902 m!1124681))

(declare-fun m!1124715 () Bool)

(assert (=> b!1219902 m!1124715))

(assert (=> b!1219902 m!1124715))

(declare-fun m!1124717 () Bool)

(assert (=> b!1219902 m!1124717))

(declare-fun m!1124719 () Bool)

(assert (=> b!1219902 m!1124719))

(declare-fun m!1124721 () Bool)

(assert (=> b!1219912 m!1124721))

(declare-fun m!1124723 () Bool)

(assert (=> b!1219911 m!1124723))

(declare-fun m!1124725 () Bool)

(assert (=> b!1219911 m!1124725))

(declare-fun m!1124727 () Bool)

(assert (=> b!1219911 m!1124727))

(declare-fun m!1124729 () Bool)

(assert (=> b!1219911 m!1124729))

(check-sat (not b!1219901) (not b_lambda!22123) (not b!1219904) (not b_next!26295) (not b!1219910) (not b!1219900) (not mapNonEmpty!48385) (not b!1219903) (not start!101478) b_and!43781 (not b!1219906) (not b!1219902) (not b!1219909) (not b!1219912) tp_is_empty!30999 (not b!1219911) (not b!1219917) (not b!1219918))
(check-sat b_and!43781 (not b_next!26295))
