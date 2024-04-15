; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100066 () Bool)

(assert start!100066)

(declare-fun b_free!25651 () Bool)

(declare-fun b_next!25651 () Bool)

(assert (=> start!100066 (= b_free!25651 (not b_next!25651))))

(declare-fun tp!89666 () Bool)

(declare-fun b_and!42147 () Bool)

(assert (=> start!100066 (= tp!89666 b_and!42147)))

(declare-fun b!1192848 () Bool)

(declare-fun e!677976 () Bool)

(declare-fun tp_is_empty!30181 () Bool)

(assert (=> b!1192848 (= e!677976 tp_is_empty!30181)))

(declare-fun b!1192849 () Bool)

(declare-fun res!793595 () Bool)

(declare-fun e!677975 () Bool)

(assert (=> b!1192849 (=> (not res!793595) (not e!677975))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!77080 0))(
  ( (array!77081 (arr!37190 (Array (_ BitVec 32) (_ BitVec 64))) (size!37728 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77080)

(assert (=> b!1192849 (= res!793595 (= (select (arr!37190 _keys!1208) i!673) k0!934))))

(declare-fun b!1192850 () Bool)

(declare-fun e!677980 () Bool)

(assert (=> b!1192850 (= e!677975 e!677980)))

(declare-fun res!793586 () Bool)

(assert (=> b!1192850 (=> (not res!793586) (not e!677980))))

(declare-fun lt!542232 () array!77080)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77080 (_ BitVec 32)) Bool)

(assert (=> b!1192850 (= res!793586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542232 mask!1564))))

(assert (=> b!1192850 (= lt!542232 (array!77081 (store (arr!37190 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37728 _keys!1208)))))

(declare-fun b!1192851 () Bool)

(declare-fun e!677979 () Bool)

(assert (=> b!1192851 (= e!677979 tp_is_empty!30181)))

(declare-fun b!1192852 () Bool)

(declare-fun e!677973 () Bool)

(assert (=> b!1192852 (= e!677980 (not e!677973))))

(declare-fun res!793588 () Bool)

(assert (=> b!1192852 (=> res!793588 e!677973)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192852 (= res!793588 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192852 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39451 0))(
  ( (Unit!39452) )
))
(declare-fun lt!542231 () Unit!39451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77080 (_ BitVec 64) (_ BitVec 32)) Unit!39451)

(assert (=> b!1192852 (= lt!542231 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192853 () Bool)

(declare-fun res!793593 () Bool)

(assert (=> b!1192853 (=> (not res!793593) (not e!677975))))

(declare-datatypes ((List!26300 0))(
  ( (Nil!26297) (Cons!26296 (h!27505 (_ BitVec 64)) (t!38934 List!26300)) )
))
(declare-fun arrayNoDuplicates!0 (array!77080 (_ BitVec 32) List!26300) Bool)

(assert (=> b!1192853 (= res!793593 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26297))))

(declare-fun b!1192854 () Bool)

(declare-fun res!793591 () Bool)

(assert (=> b!1192854 (=> (not res!793591) (not e!677975))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45369 0))(
  ( (V!45370 (val!15147 Int)) )
))
(declare-datatypes ((ValueCell!14381 0))(
  ( (ValueCellFull!14381 (v!17784 V!45369)) (EmptyCell!14381) )
))
(declare-datatypes ((array!77082 0))(
  ( (array!77083 (arr!37191 (Array (_ BitVec 32) ValueCell!14381)) (size!37729 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77082)

(assert (=> b!1192854 (= res!793591 (and (= (size!37729 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37728 _keys!1208) (size!37729 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47099 () Bool)

(declare-fun mapRes!47099 () Bool)

(assert (=> mapIsEmpty!47099 mapRes!47099))

(declare-fun b!1192855 () Bool)

(declare-fun res!793589 () Bool)

(assert (=> b!1192855 (=> (not res!793589) (not e!677975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192855 (= res!793589 (validKeyInArray!0 k0!934))))

(declare-fun res!793590 () Bool)

(assert (=> start!100066 (=> (not res!793590) (not e!677975))))

(assert (=> start!100066 (= res!793590 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37728 _keys!1208))))))

(assert (=> start!100066 e!677975))

(assert (=> start!100066 tp_is_empty!30181))

(declare-fun array_inv!28480 (array!77080) Bool)

(assert (=> start!100066 (array_inv!28480 _keys!1208)))

(assert (=> start!100066 true))

(assert (=> start!100066 tp!89666))

(declare-fun e!677978 () Bool)

(declare-fun array_inv!28481 (array!77082) Bool)

(assert (=> start!100066 (and (array_inv!28481 _values!996) e!677978)))

(declare-fun b!1192856 () Bool)

(declare-fun res!793594 () Bool)

(assert (=> b!1192856 (=> (not res!793594) (not e!677975))))

(assert (=> b!1192856 (= res!793594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192857 () Bool)

(declare-fun e!677974 () Bool)

(assert (=> b!1192857 (= e!677974 true)))

(declare-fun zeroValue!944 () V!45369)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542227 () array!77082)

(declare-fun minValue!944 () V!45369)

(declare-datatypes ((tuple2!19586 0))(
  ( (tuple2!19587 (_1!9804 (_ BitVec 64)) (_2!9804 V!45369)) )
))
(declare-datatypes ((List!26301 0))(
  ( (Nil!26298) (Cons!26297 (h!27506 tuple2!19586) (t!38935 List!26301)) )
))
(declare-datatypes ((ListLongMap!17555 0))(
  ( (ListLongMap!17556 (toList!8793 List!26301)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5243 (array!77080 array!77082 (_ BitVec 32) (_ BitVec 32) V!45369 V!45369 (_ BitVec 32) Int) ListLongMap!17555)

(declare-fun -!1733 (ListLongMap!17555 (_ BitVec 64)) ListLongMap!17555)

(assert (=> b!1192857 (= (getCurrentListMapNoExtraKeys!5243 lt!542232 lt!542227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1733 (getCurrentListMapNoExtraKeys!5243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542230 () Unit!39451)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!983 (array!77080 array!77082 (_ BitVec 32) (_ BitVec 32) V!45369 V!45369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39451)

(assert (=> b!1192857 (= lt!542230 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!983 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192858 () Bool)

(assert (=> b!1192858 (= e!677978 (and e!677979 mapRes!47099))))

(declare-fun condMapEmpty!47099 () Bool)

(declare-fun mapDefault!47099 () ValueCell!14381)

(assert (=> b!1192858 (= condMapEmpty!47099 (= (arr!37191 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14381)) mapDefault!47099)))))

(declare-fun b!1192859 () Bool)

(declare-fun res!793587 () Bool)

(assert (=> b!1192859 (=> (not res!793587) (not e!677980))))

(assert (=> b!1192859 (= res!793587 (arrayNoDuplicates!0 lt!542232 #b00000000000000000000000000000000 Nil!26297))))

(declare-fun b!1192860 () Bool)

(assert (=> b!1192860 (= e!677973 e!677974)))

(declare-fun res!793597 () Bool)

(assert (=> b!1192860 (=> res!793597 e!677974)))

(assert (=> b!1192860 (= res!793597 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542228 () ListLongMap!17555)

(assert (=> b!1192860 (= lt!542228 (getCurrentListMapNoExtraKeys!5243 lt!542232 lt!542227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3128 (Int (_ BitVec 64)) V!45369)

(assert (=> b!1192860 (= lt!542227 (array!77083 (store (arr!37191 _values!996) i!673 (ValueCellFull!14381 (dynLambda!3128 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37729 _values!996)))))

(declare-fun lt!542229 () ListLongMap!17555)

(assert (=> b!1192860 (= lt!542229 (getCurrentListMapNoExtraKeys!5243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47099 () Bool)

(declare-fun tp!89667 () Bool)

(assert (=> mapNonEmpty!47099 (= mapRes!47099 (and tp!89667 e!677976))))

(declare-fun mapRest!47099 () (Array (_ BitVec 32) ValueCell!14381))

(declare-fun mapValue!47099 () ValueCell!14381)

(declare-fun mapKey!47099 () (_ BitVec 32))

(assert (=> mapNonEmpty!47099 (= (arr!37191 _values!996) (store mapRest!47099 mapKey!47099 mapValue!47099))))

(declare-fun b!1192861 () Bool)

(declare-fun res!793596 () Bool)

(assert (=> b!1192861 (=> (not res!793596) (not e!677975))))

(assert (=> b!1192861 (= res!793596 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37728 _keys!1208))))))

(declare-fun b!1192862 () Bool)

(declare-fun res!793592 () Bool)

(assert (=> b!1192862 (=> (not res!793592) (not e!677975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192862 (= res!793592 (validMask!0 mask!1564))))

(assert (= (and start!100066 res!793590) b!1192862))

(assert (= (and b!1192862 res!793592) b!1192854))

(assert (= (and b!1192854 res!793591) b!1192856))

(assert (= (and b!1192856 res!793594) b!1192853))

(assert (= (and b!1192853 res!793593) b!1192861))

(assert (= (and b!1192861 res!793596) b!1192855))

(assert (= (and b!1192855 res!793589) b!1192849))

(assert (= (and b!1192849 res!793595) b!1192850))

(assert (= (and b!1192850 res!793586) b!1192859))

(assert (= (and b!1192859 res!793587) b!1192852))

(assert (= (and b!1192852 (not res!793588)) b!1192860))

(assert (= (and b!1192860 (not res!793597)) b!1192857))

(assert (= (and b!1192858 condMapEmpty!47099) mapIsEmpty!47099))

(assert (= (and b!1192858 (not condMapEmpty!47099)) mapNonEmpty!47099))

(get-info :version)

(assert (= (and mapNonEmpty!47099 ((_ is ValueCellFull!14381) mapValue!47099)) b!1192848))

(assert (= (and b!1192858 ((_ is ValueCellFull!14381) mapDefault!47099)) b!1192851))

(assert (= start!100066 b!1192858))

(declare-fun b_lambda!20777 () Bool)

(assert (=> (not b_lambda!20777) (not b!1192860)))

(declare-fun t!38933 () Bool)

(declare-fun tb!10455 () Bool)

(assert (=> (and start!100066 (= defaultEntry!1004 defaultEntry!1004) t!38933) tb!10455))

(declare-fun result!21485 () Bool)

(assert (=> tb!10455 (= result!21485 tp_is_empty!30181)))

(assert (=> b!1192860 t!38933))

(declare-fun b_and!42149 () Bool)

(assert (= b_and!42147 (and (=> t!38933 result!21485) b_and!42149)))

(declare-fun m!1100663 () Bool)

(assert (=> b!1192857 m!1100663))

(declare-fun m!1100665 () Bool)

(assert (=> b!1192857 m!1100665))

(assert (=> b!1192857 m!1100665))

(declare-fun m!1100667 () Bool)

(assert (=> b!1192857 m!1100667))

(declare-fun m!1100669 () Bool)

(assert (=> b!1192857 m!1100669))

(declare-fun m!1100671 () Bool)

(assert (=> start!100066 m!1100671))

(declare-fun m!1100673 () Bool)

(assert (=> start!100066 m!1100673))

(declare-fun m!1100675 () Bool)

(assert (=> mapNonEmpty!47099 m!1100675))

(declare-fun m!1100677 () Bool)

(assert (=> b!1192859 m!1100677))

(declare-fun m!1100679 () Bool)

(assert (=> b!1192853 m!1100679))

(declare-fun m!1100681 () Bool)

(assert (=> b!1192855 m!1100681))

(declare-fun m!1100683 () Bool)

(assert (=> b!1192856 m!1100683))

(declare-fun m!1100685 () Bool)

(assert (=> b!1192850 m!1100685))

(declare-fun m!1100687 () Bool)

(assert (=> b!1192850 m!1100687))

(declare-fun m!1100689 () Bool)

(assert (=> b!1192862 m!1100689))

(declare-fun m!1100691 () Bool)

(assert (=> b!1192849 m!1100691))

(declare-fun m!1100693 () Bool)

(assert (=> b!1192860 m!1100693))

(declare-fun m!1100695 () Bool)

(assert (=> b!1192860 m!1100695))

(declare-fun m!1100697 () Bool)

(assert (=> b!1192860 m!1100697))

(declare-fun m!1100699 () Bool)

(assert (=> b!1192860 m!1100699))

(declare-fun m!1100701 () Bool)

(assert (=> b!1192852 m!1100701))

(declare-fun m!1100703 () Bool)

(assert (=> b!1192852 m!1100703))

(check-sat (not start!100066) (not b!1192852) (not b!1192859) b_and!42149 (not b!1192862) (not b!1192857) (not b!1192856) (not b!1192853) (not b!1192860) tp_is_empty!30181 (not mapNonEmpty!47099) (not b_lambda!20777) (not b_next!25651) (not b!1192850) (not b!1192855))
(check-sat b_and!42149 (not b_next!25651))
