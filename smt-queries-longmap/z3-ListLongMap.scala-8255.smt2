; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100472 () Bool)

(assert start!100472)

(declare-fun b_free!25801 () Bool)

(declare-fun b_next!25801 () Bool)

(assert (=> start!100472 (= b_free!25801 (not b_next!25801))))

(declare-fun tp!90393 () Bool)

(declare-fun b_and!42467 () Bool)

(assert (=> start!100472 (= tp!90393 b_and!42467)))

(declare-fun b!1199900 () Bool)

(declare-fun res!798733 () Bool)

(declare-fun e!681445 () Bool)

(assert (=> b!1199900 (=> (not res!798733) (not e!681445))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77710 0))(
  ( (array!77711 (arr!37500 (Array (_ BitVec 32) (_ BitVec 64))) (size!38038 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77710)

(assert (=> b!1199900 (= res!798733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38038 _keys!1208))))))

(declare-fun b!1199901 () Bool)

(declare-fun e!681450 () Bool)

(declare-fun tp_is_empty!30505 () Bool)

(assert (=> b!1199901 (= e!681450 tp_is_empty!30505)))

(declare-fun b!1199902 () Bool)

(declare-fun e!681451 () Bool)

(assert (=> b!1199902 (= e!681445 e!681451)))

(declare-fun res!798736 () Bool)

(assert (=> b!1199902 (=> (not res!798736) (not e!681451))))

(declare-fun lt!543738 () array!77710)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77710 (_ BitVec 32)) Bool)

(assert (=> b!1199902 (= res!798736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543738 mask!1564))))

(assert (=> b!1199902 (= lt!543738 (array!77711 (store (arr!37500 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38038 _keys!1208)))))

(declare-fun mapIsEmpty!47600 () Bool)

(declare-fun mapRes!47600 () Bool)

(assert (=> mapIsEmpty!47600 mapRes!47600))

(declare-fun b!1199903 () Bool)

(declare-fun res!798728 () Bool)

(assert (=> b!1199903 (=> (not res!798728) (not e!681451))))

(declare-datatypes ((List!26476 0))(
  ( (Nil!26473) (Cons!26472 (h!27681 (_ BitVec 64)) (t!39248 List!26476)) )
))
(declare-fun arrayNoDuplicates!0 (array!77710 (_ BitVec 32) List!26476) Bool)

(assert (=> b!1199903 (= res!798728 (arrayNoDuplicates!0 lt!543738 #b00000000000000000000000000000000 Nil!26473))))

(declare-fun b!1199904 () Bool)

(declare-fun res!798732 () Bool)

(assert (=> b!1199904 (=> (not res!798732) (not e!681445))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199904 (= res!798732 (= (select (arr!37500 _keys!1208) i!673) k0!934))))

(declare-fun res!798731 () Bool)

(assert (=> start!100472 (=> (not res!798731) (not e!681445))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100472 (= res!798731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38038 _keys!1208))))))

(assert (=> start!100472 e!681445))

(assert (=> start!100472 tp_is_empty!30505))

(declare-fun array_inv!28696 (array!77710) Bool)

(assert (=> start!100472 (array_inv!28696 _keys!1208)))

(assert (=> start!100472 true))

(assert (=> start!100472 tp!90393))

(declare-datatypes ((V!45801 0))(
  ( (V!45802 (val!15309 Int)) )
))
(declare-datatypes ((ValueCell!14543 0))(
  ( (ValueCellFull!14543 (v!17946 V!45801)) (EmptyCell!14543) )
))
(declare-datatypes ((array!77712 0))(
  ( (array!77713 (arr!37501 (Array (_ BitVec 32) ValueCell!14543)) (size!38039 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77712)

(declare-fun e!681448 () Bool)

(declare-fun array_inv!28697 (array!77712) Bool)

(assert (=> start!100472 (and (array_inv!28697 _values!996) e!681448)))

(declare-fun b!1199905 () Bool)

(declare-fun res!798735 () Bool)

(assert (=> b!1199905 (=> (not res!798735) (not e!681445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199905 (= res!798735 (validMask!0 mask!1564))))

(declare-fun b!1199906 () Bool)

(declare-fun e!681449 () Bool)

(assert (=> b!1199906 (= e!681449 tp_is_empty!30505)))

(declare-fun b!1199907 () Bool)

(declare-fun res!798738 () Bool)

(assert (=> b!1199907 (=> (not res!798738) (not e!681445))))

(assert (=> b!1199907 (= res!798738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199908 () Bool)

(declare-fun res!798737 () Bool)

(assert (=> b!1199908 (=> (not res!798737) (not e!681445))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199908 (= res!798737 (and (= (size!38039 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38038 _keys!1208) (size!38039 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47600 () Bool)

(declare-fun tp!90392 () Bool)

(assert (=> mapNonEmpty!47600 (= mapRes!47600 (and tp!90392 e!681449))))

(declare-fun mapValue!47600 () ValueCell!14543)

(declare-fun mapKey!47600 () (_ BitVec 32))

(declare-fun mapRest!47600 () (Array (_ BitVec 32) ValueCell!14543))

(assert (=> mapNonEmpty!47600 (= (arr!37501 _values!996) (store mapRest!47600 mapKey!47600 mapValue!47600))))

(declare-fun b!1199909 () Bool)

(declare-fun res!798734 () Bool)

(assert (=> b!1199909 (=> (not res!798734) (not e!681445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199909 (= res!798734 (validKeyInArray!0 k0!934))))

(declare-fun b!1199910 () Bool)

(declare-fun res!798730 () Bool)

(assert (=> b!1199910 (=> (not res!798730) (not e!681445))))

(assert (=> b!1199910 (= res!798730 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26473))))

(declare-fun b!1199911 () Bool)

(assert (=> b!1199911 (= e!681448 (and e!681450 mapRes!47600))))

(declare-fun condMapEmpty!47600 () Bool)

(declare-fun mapDefault!47600 () ValueCell!14543)

(assert (=> b!1199911 (= condMapEmpty!47600 (= (arr!37501 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14543)) mapDefault!47600)))))

(declare-fun b!1199912 () Bool)

(declare-fun e!681447 () Bool)

(assert (=> b!1199912 (= e!681447 true)))

(declare-fun zeroValue!944 () V!45801)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19686 0))(
  ( (tuple2!19687 (_1!9854 (_ BitVec 64)) (_2!9854 V!45801)) )
))
(declare-datatypes ((List!26477 0))(
  ( (Nil!26474) (Cons!26473 (h!27682 tuple2!19686) (t!39249 List!26477)) )
))
(declare-datatypes ((ListLongMap!17655 0))(
  ( (ListLongMap!17656 (toList!8843 List!26477)) )
))
(declare-fun lt!543739 () ListLongMap!17655)

(declare-fun minValue!944 () V!45801)

(declare-fun getCurrentListMapNoExtraKeys!5292 (array!77710 array!77712 (_ BitVec 32) (_ BitVec 32) V!45801 V!45801 (_ BitVec 32) Int) ListLongMap!17655)

(declare-fun dynLambda!3172 (Int (_ BitVec 64)) V!45801)

(assert (=> b!1199912 (= lt!543739 (getCurrentListMapNoExtraKeys!5292 lt!543738 (array!77713 (store (arr!37501 _values!996) i!673 (ValueCellFull!14543 (dynLambda!3172 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38039 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543736 () ListLongMap!17655)

(assert (=> b!1199912 (= lt!543736 (getCurrentListMapNoExtraKeys!5292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199913 () Bool)

(assert (=> b!1199913 (= e!681451 (not e!681447))))

(declare-fun res!798729 () Bool)

(assert (=> b!1199913 (=> res!798729 e!681447)))

(assert (=> b!1199913 (= res!798729 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199913 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39645 0))(
  ( (Unit!39646) )
))
(declare-fun lt!543737 () Unit!39645)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77710 (_ BitVec 64) (_ BitVec 32)) Unit!39645)

(assert (=> b!1199913 (= lt!543737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100472 res!798731) b!1199905))

(assert (= (and b!1199905 res!798735) b!1199908))

(assert (= (and b!1199908 res!798737) b!1199907))

(assert (= (and b!1199907 res!798738) b!1199910))

(assert (= (and b!1199910 res!798730) b!1199900))

(assert (= (and b!1199900 res!798733) b!1199909))

(assert (= (and b!1199909 res!798734) b!1199904))

(assert (= (and b!1199904 res!798732) b!1199902))

(assert (= (and b!1199902 res!798736) b!1199903))

(assert (= (and b!1199903 res!798728) b!1199913))

(assert (= (and b!1199913 (not res!798729)) b!1199912))

(assert (= (and b!1199911 condMapEmpty!47600) mapIsEmpty!47600))

(assert (= (and b!1199911 (not condMapEmpty!47600)) mapNonEmpty!47600))

(get-info :version)

(assert (= (and mapNonEmpty!47600 ((_ is ValueCellFull!14543) mapValue!47600)) b!1199906))

(assert (= (and b!1199911 ((_ is ValueCellFull!14543) mapDefault!47600)) b!1199901))

(assert (= start!100472 b!1199911))

(declare-fun b_lambda!20979 () Bool)

(assert (=> (not b_lambda!20979) (not b!1199912)))

(declare-fun t!39247 () Bool)

(declare-fun tb!10593 () Bool)

(assert (=> (and start!100472 (= defaultEntry!1004 defaultEntry!1004) t!39247) tb!10593))

(declare-fun result!21771 () Bool)

(assert (=> tb!10593 (= result!21771 tp_is_empty!30505)))

(assert (=> b!1199912 t!39247))

(declare-fun b_and!42469 () Bool)

(assert (= b_and!42467 (and (=> t!39247 result!21771) b_and!42469)))

(declare-fun m!1105819 () Bool)

(assert (=> b!1199904 m!1105819))

(declare-fun m!1105821 () Bool)

(assert (=> b!1199909 m!1105821))

(declare-fun m!1105823 () Bool)

(assert (=> b!1199913 m!1105823))

(declare-fun m!1105825 () Bool)

(assert (=> b!1199913 m!1105825))

(declare-fun m!1105827 () Bool)

(assert (=> b!1199912 m!1105827))

(declare-fun m!1105829 () Bool)

(assert (=> b!1199912 m!1105829))

(declare-fun m!1105831 () Bool)

(assert (=> b!1199912 m!1105831))

(declare-fun m!1105833 () Bool)

(assert (=> b!1199912 m!1105833))

(declare-fun m!1105835 () Bool)

(assert (=> b!1199902 m!1105835))

(declare-fun m!1105837 () Bool)

(assert (=> b!1199902 m!1105837))

(declare-fun m!1105839 () Bool)

(assert (=> mapNonEmpty!47600 m!1105839))

(declare-fun m!1105841 () Bool)

(assert (=> b!1199903 m!1105841))

(declare-fun m!1105843 () Bool)

(assert (=> b!1199910 m!1105843))

(declare-fun m!1105845 () Bool)

(assert (=> b!1199905 m!1105845))

(declare-fun m!1105847 () Bool)

(assert (=> start!100472 m!1105847))

(declare-fun m!1105849 () Bool)

(assert (=> start!100472 m!1105849))

(declare-fun m!1105851 () Bool)

(assert (=> b!1199907 m!1105851))

(check-sat (not b!1199910) (not b!1199903) (not b!1199912) (not b!1199902) b_and!42469 (not b!1199913) (not mapNonEmpty!47600) (not b!1199905) (not b!1199907) (not b_lambda!20979) tp_is_empty!30505 (not b!1199909) (not start!100472) (not b_next!25801))
(check-sat b_and!42469 (not b_next!25801))
