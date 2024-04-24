; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100302 () Bool)

(assert start!100302)

(declare-fun b_free!25645 () Bool)

(declare-fun b_next!25645 () Bool)

(assert (=> start!100302 (= b_free!25645 (not b_next!25645))))

(declare-fun tp!89649 () Bool)

(declare-fun b_and!42159 () Bool)

(assert (=> start!100302 (= tp!89649 b_and!42159)))

(declare-fun b!1194120 () Bool)

(declare-fun e!678818 () Bool)

(declare-fun e!678816 () Bool)

(assert (=> b!1194120 (= e!678818 (not e!678816))))

(declare-fun res!794053 () Bool)

(assert (=> b!1194120 (=> res!794053 e!678816)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194120 (= res!794053 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77173 0))(
  ( (array!77174 (arr!37230 (Array (_ BitVec 32) (_ BitVec 64))) (size!37767 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77173)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194120 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39549 0))(
  ( (Unit!39550) )
))
(declare-fun lt!542853 () Unit!39549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77173 (_ BitVec 64) (_ BitVec 32)) Unit!39549)

(assert (=> b!1194120 (= lt!542853 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194121 () Bool)

(declare-fun res!794060 () Bool)

(declare-fun e!678814 () Bool)

(assert (=> b!1194121 (=> (not res!794060) (not e!678814))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77173 (_ BitVec 32)) Bool)

(assert (=> b!1194121 (= res!794060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194123 () Bool)

(declare-fun res!794059 () Bool)

(assert (=> b!1194123 (=> (not res!794059) (not e!678814))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45361 0))(
  ( (V!45362 (val!15144 Int)) )
))
(declare-datatypes ((ValueCell!14378 0))(
  ( (ValueCellFull!14378 (v!17778 V!45361)) (EmptyCell!14378) )
))
(declare-datatypes ((array!77175 0))(
  ( (array!77176 (arr!37231 (Array (_ BitVec 32) ValueCell!14378)) (size!37768 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77175)

(assert (=> b!1194123 (= res!794059 (and (= (size!37768 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37767 _keys!1208) (size!37768 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194124 () Bool)

(declare-fun res!794063 () Bool)

(assert (=> b!1194124 (=> (not res!794063) (not e!678814))))

(assert (=> b!1194124 (= res!794063 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37767 _keys!1208))))))

(declare-fun b!1194125 () Bool)

(declare-fun e!678817 () Bool)

(declare-fun tp_is_empty!30175 () Bool)

(assert (=> b!1194125 (= e!678817 tp_is_empty!30175)))

(declare-fun b!1194126 () Bool)

(declare-fun res!794061 () Bool)

(assert (=> b!1194126 (=> (not res!794061) (not e!678814))))

(declare-datatypes ((List!26242 0))(
  ( (Nil!26239) (Cons!26238 (h!27456 (_ BitVec 64)) (t!38871 List!26242)) )
))
(declare-fun arrayNoDuplicates!0 (array!77173 (_ BitVec 32) List!26242) Bool)

(assert (=> b!1194126 (= res!794061 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26239))))

(declare-fun b!1194127 () Bool)

(declare-fun e!678815 () Bool)

(declare-fun mapRes!47090 () Bool)

(assert (=> b!1194127 (= e!678815 (and e!678817 mapRes!47090))))

(declare-fun condMapEmpty!47090 () Bool)

(declare-fun mapDefault!47090 () ValueCell!14378)

(assert (=> b!1194127 (= condMapEmpty!47090 (= (arr!37231 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14378)) mapDefault!47090)))))

(declare-fun b!1194128 () Bool)

(declare-fun res!794055 () Bool)

(assert (=> b!1194128 (=> (not res!794055) (not e!678814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194128 (= res!794055 (validKeyInArray!0 k0!934))))

(declare-fun b!1194129 () Bool)

(declare-fun res!794052 () Bool)

(assert (=> b!1194129 (=> (not res!794052) (not e!678814))))

(assert (=> b!1194129 (= res!794052 (= (select (arr!37230 _keys!1208) i!673) k0!934))))

(declare-fun b!1194130 () Bool)

(declare-fun e!678813 () Bool)

(assert (=> b!1194130 (= e!678813 tp_is_empty!30175)))

(declare-fun b!1194131 () Bool)

(declare-fun res!794056 () Bool)

(assert (=> b!1194131 (=> (not res!794056) (not e!678814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194131 (= res!794056 (validMask!0 mask!1564))))

(declare-fun b!1194132 () Bool)

(declare-fun e!678811 () Bool)

(assert (=> b!1194132 (= e!678811 true)))

(declare-fun zeroValue!944 () V!45361)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542851 () array!77173)

(declare-fun minValue!944 () V!45361)

(declare-fun lt!542849 () array!77175)

(declare-datatypes ((tuple2!19500 0))(
  ( (tuple2!19501 (_1!9761 (_ BitVec 64)) (_2!9761 V!45361)) )
))
(declare-datatypes ((List!26243 0))(
  ( (Nil!26240) (Cons!26239 (h!27457 tuple2!19500) (t!38872 List!26243)) )
))
(declare-datatypes ((ListLongMap!17477 0))(
  ( (ListLongMap!17478 (toList!8754 List!26243)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5222 (array!77173 array!77175 (_ BitVec 32) (_ BitVec 32) V!45361 V!45361 (_ BitVec 32) Int) ListLongMap!17477)

(declare-fun -!1759 (ListLongMap!17477 (_ BitVec 64)) ListLongMap!17477)

(assert (=> b!1194132 (= (getCurrentListMapNoExtraKeys!5222 lt!542851 lt!542849 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1759 (getCurrentListMapNoExtraKeys!5222 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542852 () Unit!39549)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!974 (array!77173 array!77175 (_ BitVec 32) (_ BitVec 32) V!45361 V!45361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39549)

(assert (=> b!1194132 (= lt!542852 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!974 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1194133 () Bool)

(assert (=> b!1194133 (= e!678814 e!678818)))

(declare-fun res!794058 () Bool)

(assert (=> b!1194133 (=> (not res!794058) (not e!678818))))

(assert (=> b!1194133 (= res!794058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542851 mask!1564))))

(assert (=> b!1194133 (= lt!542851 (array!77174 (store (arr!37230 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37767 _keys!1208)))))

(declare-fun b!1194134 () Bool)

(assert (=> b!1194134 (= e!678816 e!678811)))

(declare-fun res!794057 () Bool)

(assert (=> b!1194134 (=> res!794057 e!678811)))

(assert (=> b!1194134 (= res!794057 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542854 () ListLongMap!17477)

(assert (=> b!1194134 (= lt!542854 (getCurrentListMapNoExtraKeys!5222 lt!542851 lt!542849 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3172 (Int (_ BitVec 64)) V!45361)

(assert (=> b!1194134 (= lt!542849 (array!77176 (store (arr!37231 _values!996) i!673 (ValueCellFull!14378 (dynLambda!3172 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37768 _values!996)))))

(declare-fun lt!542850 () ListLongMap!17477)

(assert (=> b!1194134 (= lt!542850 (getCurrentListMapNoExtraKeys!5222 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1194122 () Bool)

(declare-fun res!794062 () Bool)

(assert (=> b!1194122 (=> (not res!794062) (not e!678818))))

(assert (=> b!1194122 (= res!794062 (arrayNoDuplicates!0 lt!542851 #b00000000000000000000000000000000 Nil!26239))))

(declare-fun res!794054 () Bool)

(assert (=> start!100302 (=> (not res!794054) (not e!678814))))

(assert (=> start!100302 (= res!794054 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37767 _keys!1208))))))

(assert (=> start!100302 e!678814))

(assert (=> start!100302 tp_is_empty!30175))

(declare-fun array_inv!28450 (array!77173) Bool)

(assert (=> start!100302 (array_inv!28450 _keys!1208)))

(assert (=> start!100302 true))

(assert (=> start!100302 tp!89649))

(declare-fun array_inv!28451 (array!77175) Bool)

(assert (=> start!100302 (and (array_inv!28451 _values!996) e!678815)))

(declare-fun mapNonEmpty!47090 () Bool)

(declare-fun tp!89648 () Bool)

(assert (=> mapNonEmpty!47090 (= mapRes!47090 (and tp!89648 e!678813))))

(declare-fun mapRest!47090 () (Array (_ BitVec 32) ValueCell!14378))

(declare-fun mapKey!47090 () (_ BitVec 32))

(declare-fun mapValue!47090 () ValueCell!14378)

(assert (=> mapNonEmpty!47090 (= (arr!37231 _values!996) (store mapRest!47090 mapKey!47090 mapValue!47090))))

(declare-fun mapIsEmpty!47090 () Bool)

(assert (=> mapIsEmpty!47090 mapRes!47090))

(assert (= (and start!100302 res!794054) b!1194131))

(assert (= (and b!1194131 res!794056) b!1194123))

(assert (= (and b!1194123 res!794059) b!1194121))

(assert (= (and b!1194121 res!794060) b!1194126))

(assert (= (and b!1194126 res!794061) b!1194124))

(assert (= (and b!1194124 res!794063) b!1194128))

(assert (= (and b!1194128 res!794055) b!1194129))

(assert (= (and b!1194129 res!794052) b!1194133))

(assert (= (and b!1194133 res!794058) b!1194122))

(assert (= (and b!1194122 res!794062) b!1194120))

(assert (= (and b!1194120 (not res!794053)) b!1194134))

(assert (= (and b!1194134 (not res!794057)) b!1194132))

(assert (= (and b!1194127 condMapEmpty!47090) mapIsEmpty!47090))

(assert (= (and b!1194127 (not condMapEmpty!47090)) mapNonEmpty!47090))

(get-info :version)

(assert (= (and mapNonEmpty!47090 ((_ is ValueCellFull!14378) mapValue!47090)) b!1194130))

(assert (= (and b!1194127 ((_ is ValueCellFull!14378) mapDefault!47090)) b!1194125))

(assert (= start!100302 b!1194127))

(declare-fun b_lambda!20783 () Bool)

(assert (=> (not b_lambda!20783) (not b!1194134)))

(declare-fun t!38870 () Bool)

(declare-fun tb!10449 () Bool)

(assert (=> (and start!100302 (= defaultEntry!1004 defaultEntry!1004) t!38870) tb!10449))

(declare-fun result!21473 () Bool)

(assert (=> tb!10449 (= result!21473 tp_is_empty!30175)))

(assert (=> b!1194134 t!38870))

(declare-fun b_and!42161 () Bool)

(assert (= b_and!42159 (and (=> t!38870 result!21473) b_and!42161)))

(declare-fun m!1102719 () Bool)

(assert (=> b!1194121 m!1102719))

(declare-fun m!1102721 () Bool)

(assert (=> b!1194126 m!1102721))

(declare-fun m!1102723 () Bool)

(assert (=> b!1194131 m!1102723))

(declare-fun m!1102725 () Bool)

(assert (=> b!1194122 m!1102725))

(declare-fun m!1102727 () Bool)

(assert (=> b!1194129 m!1102727))

(declare-fun m!1102729 () Bool)

(assert (=> b!1194120 m!1102729))

(declare-fun m!1102731 () Bool)

(assert (=> b!1194120 m!1102731))

(declare-fun m!1102733 () Bool)

(assert (=> start!100302 m!1102733))

(declare-fun m!1102735 () Bool)

(assert (=> start!100302 m!1102735))

(declare-fun m!1102737 () Bool)

(assert (=> b!1194132 m!1102737))

(declare-fun m!1102739 () Bool)

(assert (=> b!1194132 m!1102739))

(assert (=> b!1194132 m!1102739))

(declare-fun m!1102741 () Bool)

(assert (=> b!1194132 m!1102741))

(declare-fun m!1102743 () Bool)

(assert (=> b!1194132 m!1102743))

(declare-fun m!1102745 () Bool)

(assert (=> b!1194128 m!1102745))

(declare-fun m!1102747 () Bool)

(assert (=> mapNonEmpty!47090 m!1102747))

(declare-fun m!1102749 () Bool)

(assert (=> b!1194133 m!1102749))

(declare-fun m!1102751 () Bool)

(assert (=> b!1194133 m!1102751))

(declare-fun m!1102753 () Bool)

(assert (=> b!1194134 m!1102753))

(declare-fun m!1102755 () Bool)

(assert (=> b!1194134 m!1102755))

(declare-fun m!1102757 () Bool)

(assert (=> b!1194134 m!1102757))

(declare-fun m!1102759 () Bool)

(assert (=> b!1194134 m!1102759))

(check-sat (not start!100302) (not b!1194120) (not mapNonEmpty!47090) (not b_lambda!20783) (not b!1194122) (not b!1194132) (not b!1194126) (not b!1194133) (not b!1194134) (not b!1194131) (not b_next!25645) (not b!1194121) b_and!42161 (not b!1194128) tp_is_empty!30175)
(check-sat b_and!42161 (not b_next!25645))
