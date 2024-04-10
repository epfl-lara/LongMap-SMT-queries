; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101364 () Bool)

(assert start!101364)

(declare-fun b_free!26235 () Bool)

(declare-fun b_next!26235 () Bool)

(assert (=> start!101364 (= b_free!26235 (not b_next!26235))))

(declare-fun tp!91733 () Bool)

(declare-fun b_and!43623 () Bool)

(assert (=> start!101364 (= tp!91733 b_and!43623)))

(declare-fun b!1217887 () Bool)

(declare-fun res!808795 () Bool)

(declare-fun e!691447 () Bool)

(assert (=> b!1217887 (=> (not res!808795) (not e!691447))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78653 0))(
  ( (array!78654 (arr!37959 (Array (_ BitVec 32) (_ BitVec 64))) (size!38495 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78653)

(assert (=> b!1217887 (= res!808795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38495 _keys!1208))))))

(declare-fun b!1217888 () Bool)

(declare-fun e!691453 () Bool)

(declare-fun e!691446 () Bool)

(assert (=> b!1217888 (= e!691453 e!691446)))

(declare-fun res!808796 () Bool)

(assert (=> b!1217888 (=> res!808796 e!691446)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1217888 (= res!808796 (not (= (select (arr!37959 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1217889 () Bool)

(declare-fun res!808790 () Bool)

(assert (=> b!1217889 (=> (not res!808790) (not e!691447))))

(assert (=> b!1217889 (= res!808790 (= (select (arr!37959 _keys!1208) i!673) k0!934))))

(declare-fun b!1217890 () Bool)

(declare-fun e!691445 () Bool)

(declare-fun tp_is_empty!30939 () Bool)

(assert (=> b!1217890 (= e!691445 tp_is_empty!30939)))

(declare-fun b!1217891 () Bool)

(declare-fun e!691452 () Bool)

(assert (=> b!1217891 (= e!691447 e!691452)))

(declare-fun res!808785 () Bool)

(assert (=> b!1217891 (=> (not res!808785) (not e!691452))))

(declare-fun lt!553599 () array!78653)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78653 (_ BitVec 32)) Bool)

(assert (=> b!1217891 (= res!808785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553599 mask!1564))))

(assert (=> b!1217891 (= lt!553599 (array!78654 (store (arr!37959 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38495 _keys!1208)))))

(declare-fun b!1217892 () Bool)

(declare-fun res!808784 () Bool)

(assert (=> b!1217892 (=> (not res!808784) (not e!691447))))

(declare-datatypes ((List!26772 0))(
  ( (Nil!26769) (Cons!26768 (h!27977 (_ BitVec 64)) (t!39987 List!26772)) )
))
(declare-fun arrayNoDuplicates!0 (array!78653 (_ BitVec 32) List!26772) Bool)

(assert (=> b!1217892 (= res!808784 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26769))))

(declare-fun b!1217893 () Bool)

(declare-fun e!691444 () Bool)

(assert (=> b!1217893 (= e!691444 tp_is_empty!30939)))

(declare-fun b!1217894 () Bool)

(declare-fun res!808783 () Bool)

(assert (=> b!1217894 (=> (not res!808783) (not e!691447))))

(assert (=> b!1217894 (= res!808783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217895 () Bool)

(declare-fun e!691454 () Bool)

(assert (=> b!1217895 (= e!691452 (not e!691454))))

(declare-fun res!808792 () Bool)

(assert (=> b!1217895 (=> res!808792 e!691454)))

(assert (=> b!1217895 (= res!808792 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217895 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40372 0))(
  ( (Unit!40373) )
))
(declare-fun lt!553597 () Unit!40372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78653 (_ BitVec 64) (_ BitVec 32)) Unit!40372)

(assert (=> b!1217895 (= lt!553597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217896 () Bool)

(declare-fun res!808794 () Bool)

(assert (=> b!1217896 (=> (not res!808794) (not e!691447))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46379 0))(
  ( (V!46380 (val!15526 Int)) )
))
(declare-datatypes ((ValueCell!14760 0))(
  ( (ValueCellFull!14760 (v!18181 V!46379)) (EmptyCell!14760) )
))
(declare-datatypes ((array!78655 0))(
  ( (array!78656 (arr!37960 (Array (_ BitVec 32) ValueCell!14760)) (size!38496 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78655)

(assert (=> b!1217896 (= res!808794 (and (= (size!38496 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38495 _keys!1208) (size!38496 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217897 () Bool)

(declare-fun e!691450 () Bool)

(declare-fun e!691449 () Bool)

(assert (=> b!1217897 (= e!691450 e!691449)))

(declare-fun res!808787 () Bool)

(assert (=> b!1217897 (=> res!808787 e!691449)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217897 (= res!808787 (not (validKeyInArray!0 (select (arr!37959 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19968 0))(
  ( (tuple2!19969 (_1!9995 (_ BitVec 64)) (_2!9995 V!46379)) )
))
(declare-datatypes ((List!26773 0))(
  ( (Nil!26770) (Cons!26769 (h!27978 tuple2!19968) (t!39988 List!26773)) )
))
(declare-datatypes ((ListLongMap!17937 0))(
  ( (ListLongMap!17938 (toList!8984 List!26773)) )
))
(declare-fun lt!553602 () ListLongMap!17937)

(declare-fun lt!553593 () ListLongMap!17937)

(assert (=> b!1217897 (= lt!553602 lt!553593)))

(declare-fun lt!553600 () ListLongMap!17937)

(declare-fun -!1900 (ListLongMap!17937 (_ BitVec 64)) ListLongMap!17937)

(assert (=> b!1217897 (= lt!553593 (-!1900 lt!553600 k0!934))))

(declare-fun zeroValue!944 () V!46379)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!553594 () array!78655)

(declare-fun minValue!944 () V!46379)

(declare-fun getCurrentListMapNoExtraKeys!5411 (array!78653 array!78655 (_ BitVec 32) (_ BitVec 32) V!46379 V!46379 (_ BitVec 32) Int) ListLongMap!17937)

(assert (=> b!1217897 (= lt!553602 (getCurrentListMapNoExtraKeys!5411 lt!553599 lt!553594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217897 (= lt!553600 (getCurrentListMapNoExtraKeys!5411 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553598 () Unit!40372)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 (array!78653 array!78655 (_ BitVec 32) (_ BitVec 32) V!46379 V!46379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40372)

(assert (=> b!1217897 (= lt!553598 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1107 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217898 () Bool)

(declare-fun e!691451 () Bool)

(declare-fun mapRes!48289 () Bool)

(assert (=> b!1217898 (= e!691451 (and e!691444 mapRes!48289))))

(declare-fun condMapEmpty!48289 () Bool)

(declare-fun mapDefault!48289 () ValueCell!14760)

(assert (=> b!1217898 (= condMapEmpty!48289 (= (arr!37960 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14760)) mapDefault!48289)))))

(declare-fun b!1217899 () Bool)

(declare-fun res!808788 () Bool)

(assert (=> b!1217899 (=> (not res!808788) (not e!691452))))

(assert (=> b!1217899 (= res!808788 (arrayNoDuplicates!0 lt!553599 #b00000000000000000000000000000000 Nil!26769))))

(declare-fun res!808791 () Bool)

(assert (=> start!101364 (=> (not res!808791) (not e!691447))))

(assert (=> start!101364 (= res!808791 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38495 _keys!1208))))))

(assert (=> start!101364 e!691447))

(assert (=> start!101364 tp_is_empty!30939))

(declare-fun array_inv!28894 (array!78653) Bool)

(assert (=> start!101364 (array_inv!28894 _keys!1208)))

(assert (=> start!101364 true))

(assert (=> start!101364 tp!91733))

(declare-fun array_inv!28895 (array!78655) Bool)

(assert (=> start!101364 (and (array_inv!28895 _values!996) e!691451)))

(declare-fun mapNonEmpty!48289 () Bool)

(declare-fun tp!91732 () Bool)

(assert (=> mapNonEmpty!48289 (= mapRes!48289 (and tp!91732 e!691445))))

(declare-fun mapKey!48289 () (_ BitVec 32))

(declare-fun mapValue!48289 () ValueCell!14760)

(declare-fun mapRest!48289 () (Array (_ BitVec 32) ValueCell!14760))

(assert (=> mapNonEmpty!48289 (= (arr!37960 _values!996) (store mapRest!48289 mapKey!48289 mapValue!48289))))

(declare-fun b!1217900 () Bool)

(assert (=> b!1217900 (= e!691449 true)))

(assert (=> b!1217900 e!691453))

(declare-fun res!808786 () Bool)

(assert (=> b!1217900 (=> (not res!808786) (not e!691453))))

(declare-fun lt!553601 () V!46379)

(declare-fun lt!553596 () ListLongMap!17937)

(declare-fun +!4055 (ListLongMap!17937 tuple2!19968) ListLongMap!17937)

(declare-fun get!19344 (ValueCell!14760 V!46379) V!46379)

(assert (=> b!1217900 (= res!808786 (= lt!553596 (+!4055 lt!553593 (tuple2!19969 (select (arr!37959 _keys!1208) from!1455) (get!19344 (select (arr!37960 _values!996) from!1455) lt!553601)))))))

(declare-fun b!1217901 () Bool)

(assert (=> b!1217901 (= e!691454 e!691450)))

(declare-fun res!808782 () Bool)

(assert (=> b!1217901 (=> res!808782 e!691450)))

(assert (=> b!1217901 (= res!808782 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1217901 (= lt!553596 (getCurrentListMapNoExtraKeys!5411 lt!553599 lt!553594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1217901 (= lt!553594 (array!78656 (store (arr!37960 _values!996) i!673 (ValueCellFull!14760 lt!553601)) (size!38496 _values!996)))))

(declare-fun dynLambda!3296 (Int (_ BitVec 64)) V!46379)

(assert (=> b!1217901 (= lt!553601 (dynLambda!3296 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553595 () ListLongMap!17937)

(assert (=> b!1217901 (= lt!553595 (getCurrentListMapNoExtraKeys!5411 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217902 () Bool)

(assert (=> b!1217902 (= e!691446 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1217903 () Bool)

(declare-fun res!808793 () Bool)

(assert (=> b!1217903 (=> (not res!808793) (not e!691447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217903 (= res!808793 (validMask!0 mask!1564))))

(declare-fun b!1217904 () Bool)

(declare-fun res!808789 () Bool)

(assert (=> b!1217904 (=> (not res!808789) (not e!691447))))

(assert (=> b!1217904 (= res!808789 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!48289 () Bool)

(assert (=> mapIsEmpty!48289 mapRes!48289))

(assert (= (and start!101364 res!808791) b!1217903))

(assert (= (and b!1217903 res!808793) b!1217896))

(assert (= (and b!1217896 res!808794) b!1217894))

(assert (= (and b!1217894 res!808783) b!1217892))

(assert (= (and b!1217892 res!808784) b!1217887))

(assert (= (and b!1217887 res!808795) b!1217904))

(assert (= (and b!1217904 res!808789) b!1217889))

(assert (= (and b!1217889 res!808790) b!1217891))

(assert (= (and b!1217891 res!808785) b!1217899))

(assert (= (and b!1217899 res!808788) b!1217895))

(assert (= (and b!1217895 (not res!808792)) b!1217901))

(assert (= (and b!1217901 (not res!808782)) b!1217897))

(assert (= (and b!1217897 (not res!808787)) b!1217900))

(assert (= (and b!1217900 res!808786) b!1217888))

(assert (= (and b!1217888 (not res!808796)) b!1217902))

(assert (= (and b!1217898 condMapEmpty!48289) mapIsEmpty!48289))

(assert (= (and b!1217898 (not condMapEmpty!48289)) mapNonEmpty!48289))

(get-info :version)

(assert (= (and mapNonEmpty!48289 ((_ is ValueCellFull!14760) mapValue!48289)) b!1217890))

(assert (= (and b!1217898 ((_ is ValueCellFull!14760) mapDefault!48289)) b!1217893))

(assert (= start!101364 b!1217898))

(declare-fun b_lambda!21987 () Bool)

(assert (=> (not b_lambda!21987) (not b!1217901)))

(declare-fun t!39986 () Bool)

(declare-fun tb!11035 () Bool)

(assert (=> (and start!101364 (= defaultEntry!1004 defaultEntry!1004) t!39986) tb!11035))

(declare-fun result!22671 () Bool)

(assert (=> tb!11035 (= result!22671 tp_is_empty!30939)))

(assert (=> b!1217901 t!39986))

(declare-fun b_and!43625 () Bool)

(assert (= b_and!43623 (and (=> t!39986 result!22671) b_and!43625)))

(declare-fun m!1122649 () Bool)

(assert (=> b!1217903 m!1122649))

(declare-fun m!1122651 () Bool)

(assert (=> b!1217891 m!1122651))

(declare-fun m!1122653 () Bool)

(assert (=> b!1217891 m!1122653))

(declare-fun m!1122655 () Bool)

(assert (=> b!1217895 m!1122655))

(declare-fun m!1122657 () Bool)

(assert (=> b!1217895 m!1122657))

(declare-fun m!1122659 () Bool)

(assert (=> mapNonEmpty!48289 m!1122659))

(declare-fun m!1122661 () Bool)

(assert (=> b!1217894 m!1122661))

(declare-fun m!1122663 () Bool)

(assert (=> b!1217892 m!1122663))

(declare-fun m!1122665 () Bool)

(assert (=> b!1217899 m!1122665))

(declare-fun m!1122667 () Bool)

(assert (=> b!1217904 m!1122667))

(declare-fun m!1122669 () Bool)

(assert (=> b!1217897 m!1122669))

(declare-fun m!1122671 () Bool)

(assert (=> b!1217897 m!1122671))

(declare-fun m!1122673 () Bool)

(assert (=> b!1217897 m!1122673))

(declare-fun m!1122675 () Bool)

(assert (=> b!1217897 m!1122675))

(declare-fun m!1122677 () Bool)

(assert (=> b!1217897 m!1122677))

(assert (=> b!1217897 m!1122675))

(declare-fun m!1122679 () Bool)

(assert (=> b!1217897 m!1122679))

(assert (=> b!1217888 m!1122675))

(assert (=> b!1217900 m!1122675))

(declare-fun m!1122681 () Bool)

(assert (=> b!1217900 m!1122681))

(assert (=> b!1217900 m!1122681))

(declare-fun m!1122683 () Bool)

(assert (=> b!1217900 m!1122683))

(declare-fun m!1122685 () Bool)

(assert (=> b!1217900 m!1122685))

(declare-fun m!1122687 () Bool)

(assert (=> b!1217901 m!1122687))

(declare-fun m!1122689 () Bool)

(assert (=> b!1217901 m!1122689))

(declare-fun m!1122691 () Bool)

(assert (=> b!1217901 m!1122691))

(declare-fun m!1122693 () Bool)

(assert (=> b!1217901 m!1122693))

(declare-fun m!1122695 () Bool)

(assert (=> b!1217902 m!1122695))

(declare-fun m!1122697 () Bool)

(assert (=> b!1217889 m!1122697))

(declare-fun m!1122699 () Bool)

(assert (=> start!101364 m!1122699))

(declare-fun m!1122701 () Bool)

(assert (=> start!101364 m!1122701))

(check-sat (not b!1217902) (not b!1217904) (not b_next!26235) (not b!1217892) tp_is_empty!30939 (not b!1217891) (not start!101364) b_and!43625 (not b!1217901) (not b!1217897) (not b!1217894) (not b!1217900) (not b!1217895) (not b!1217903) (not b!1217899) (not b_lambda!21987) (not mapNonEmpty!48289))
(check-sat b_and!43625 (not b_next!26235))
