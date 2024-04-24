; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100218 () Bool)

(assert start!100218)

(declare-fun b_free!25561 () Bool)

(declare-fun b_next!25561 () Bool)

(assert (=> start!100218 (= b_free!25561 (not b_next!25561))))

(declare-fun tp!89397 () Bool)

(declare-fun b_and!41991 () Bool)

(assert (=> start!100218 (= tp!89397 b_and!41991)))

(declare-fun b!1192146 () Bool)

(declare-fun res!792548 () Bool)

(declare-fun e!677807 () Bool)

(assert (=> b!1192146 (=> (not res!792548) (not e!677807))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192146 (= res!792548 (validKeyInArray!0 k0!934))))

(declare-fun b!1192147 () Bool)

(declare-fun res!792543 () Bool)

(assert (=> b!1192147 (=> (not res!792543) (not e!677807))))

(declare-datatypes ((array!77017 0))(
  ( (array!77018 (arr!37152 (Array (_ BitVec 32) (_ BitVec 64))) (size!37689 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77017)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192147 (= res!792543 (= (select (arr!37152 _keys!1208) i!673) k0!934))))

(declare-fun b!1192148 () Bool)

(declare-fun res!792550 () Bool)

(assert (=> b!1192148 (=> (not res!792550) (not e!677807))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192148 (= res!792550 (validMask!0 mask!1564))))

(declare-fun b!1192150 () Bool)

(declare-fun e!677803 () Bool)

(declare-fun e!677804 () Bool)

(assert (=> b!1192150 (= e!677803 (not e!677804))))

(declare-fun res!792547 () Bool)

(assert (=> b!1192150 (=> res!792547 e!677804)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192150 (= res!792547 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192150 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39485 0))(
  ( (Unit!39486) )
))
(declare-fun lt!542093 () Unit!39485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77017 (_ BitVec 64) (_ BitVec 32)) Unit!39485)

(assert (=> b!1192150 (= lt!542093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192151 () Bool)

(declare-fun res!792540 () Bool)

(assert (=> b!1192151 (=> (not res!792540) (not e!677807))))

(declare-datatypes ((List!26179 0))(
  ( (Nil!26176) (Cons!26175 (h!27393 (_ BitVec 64)) (t!38724 List!26179)) )
))
(declare-fun arrayNoDuplicates!0 (array!77017 (_ BitVec 32) List!26179) Bool)

(assert (=> b!1192151 (= res!792540 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26176))))

(declare-fun b!1192152 () Bool)

(declare-fun res!792541 () Bool)

(assert (=> b!1192152 (=> (not res!792541) (not e!677807))))

(assert (=> b!1192152 (= res!792541 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37689 _keys!1208))))))

(declare-fun mapIsEmpty!46964 () Bool)

(declare-fun mapRes!46964 () Bool)

(assert (=> mapIsEmpty!46964 mapRes!46964))

(declare-fun mapNonEmpty!46964 () Bool)

(declare-fun tp!89396 () Bool)

(declare-fun e!677810 () Bool)

(assert (=> mapNonEmpty!46964 (= mapRes!46964 (and tp!89396 e!677810))))

(declare-datatypes ((V!45249 0))(
  ( (V!45250 (val!15102 Int)) )
))
(declare-datatypes ((ValueCell!14336 0))(
  ( (ValueCellFull!14336 (v!17736 V!45249)) (EmptyCell!14336) )
))
(declare-fun mapValue!46964 () ValueCell!14336)

(declare-fun mapRest!46964 () (Array (_ BitVec 32) ValueCell!14336))

(declare-fun mapKey!46964 () (_ BitVec 32))

(declare-datatypes ((array!77019 0))(
  ( (array!77020 (arr!37153 (Array (_ BitVec 32) ValueCell!14336)) (size!37690 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77019)

(assert (=> mapNonEmpty!46964 (= (arr!37153 _values!996) (store mapRest!46964 mapKey!46964 mapValue!46964))))

(declare-fun b!1192149 () Bool)

(declare-fun e!677805 () Bool)

(assert (=> b!1192149 (= e!677804 e!677805)))

(declare-fun res!792542 () Bool)

(assert (=> b!1192149 (=> res!792542 e!677805)))

(assert (=> b!1192149 (= res!792542 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542094 () array!77017)

(declare-datatypes ((tuple2!19436 0))(
  ( (tuple2!19437 (_1!9729 (_ BitVec 64)) (_2!9729 V!45249)) )
))
(declare-datatypes ((List!26180 0))(
  ( (Nil!26177) (Cons!26176 (h!27394 tuple2!19436) (t!38725 List!26180)) )
))
(declare-datatypes ((ListLongMap!17413 0))(
  ( (ListLongMap!17414 (toList!8722 List!26180)) )
))
(declare-fun lt!542096 () ListLongMap!17413)

(declare-fun minValue!944 () V!45249)

(declare-fun zeroValue!944 () V!45249)

(declare-fun lt!542097 () array!77019)

(declare-fun getCurrentListMapNoExtraKeys!5190 (array!77017 array!77019 (_ BitVec 32) (_ BitVec 32) V!45249 V!45249 (_ BitVec 32) Int) ListLongMap!17413)

(assert (=> b!1192149 (= lt!542096 (getCurrentListMapNoExtraKeys!5190 lt!542094 lt!542097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3145 (Int (_ BitVec 64)) V!45249)

(assert (=> b!1192149 (= lt!542097 (array!77020 (store (arr!37153 _values!996) i!673 (ValueCellFull!14336 (dynLambda!3145 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37690 _values!996)))))

(declare-fun lt!542098 () ListLongMap!17413)

(assert (=> b!1192149 (= lt!542098 (getCurrentListMapNoExtraKeys!5190 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!792546 () Bool)

(assert (=> start!100218 (=> (not res!792546) (not e!677807))))

(assert (=> start!100218 (= res!792546 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37689 _keys!1208))))))

(assert (=> start!100218 e!677807))

(declare-fun tp_is_empty!30091 () Bool)

(assert (=> start!100218 tp_is_empty!30091))

(declare-fun array_inv!28396 (array!77017) Bool)

(assert (=> start!100218 (array_inv!28396 _keys!1208)))

(assert (=> start!100218 true))

(assert (=> start!100218 tp!89397))

(declare-fun e!677806 () Bool)

(declare-fun array_inv!28397 (array!77019) Bool)

(assert (=> start!100218 (and (array_inv!28397 _values!996) e!677806)))

(declare-fun b!1192153 () Bool)

(declare-fun res!792544 () Bool)

(assert (=> b!1192153 (=> (not res!792544) (not e!677807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77017 (_ BitVec 32)) Bool)

(assert (=> b!1192153 (= res!792544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192154 () Bool)

(assert (=> b!1192154 (= e!677810 tp_is_empty!30091)))

(declare-fun b!1192155 () Bool)

(assert (=> b!1192155 (= e!677805 true)))

(declare-fun -!1731 (ListLongMap!17413 (_ BitVec 64)) ListLongMap!17413)

(assert (=> b!1192155 (= (getCurrentListMapNoExtraKeys!5190 lt!542094 lt!542097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1731 (getCurrentListMapNoExtraKeys!5190 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542095 () Unit!39485)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!946 (array!77017 array!77019 (_ BitVec 32) (_ BitVec 32) V!45249 V!45249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39485)

(assert (=> b!1192155 (= lt!542095 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!946 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192156 () Bool)

(declare-fun e!677809 () Bool)

(assert (=> b!1192156 (= e!677806 (and e!677809 mapRes!46964))))

(declare-fun condMapEmpty!46964 () Bool)

(declare-fun mapDefault!46964 () ValueCell!14336)

(assert (=> b!1192156 (= condMapEmpty!46964 (= (arr!37153 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14336)) mapDefault!46964)))))

(declare-fun b!1192157 () Bool)

(declare-fun res!792551 () Bool)

(assert (=> b!1192157 (=> (not res!792551) (not e!677803))))

(assert (=> b!1192157 (= res!792551 (arrayNoDuplicates!0 lt!542094 #b00000000000000000000000000000000 Nil!26176))))

(declare-fun b!1192158 () Bool)

(declare-fun res!792545 () Bool)

(assert (=> b!1192158 (=> (not res!792545) (not e!677807))))

(assert (=> b!1192158 (= res!792545 (and (= (size!37690 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37689 _keys!1208) (size!37690 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192159 () Bool)

(assert (=> b!1192159 (= e!677809 tp_is_empty!30091)))

(declare-fun b!1192160 () Bool)

(assert (=> b!1192160 (= e!677807 e!677803)))

(declare-fun res!792549 () Bool)

(assert (=> b!1192160 (=> (not res!792549) (not e!677803))))

(assert (=> b!1192160 (= res!792549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542094 mask!1564))))

(assert (=> b!1192160 (= lt!542094 (array!77018 (store (arr!37152 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37689 _keys!1208)))))

(assert (= (and start!100218 res!792546) b!1192148))

(assert (= (and b!1192148 res!792550) b!1192158))

(assert (= (and b!1192158 res!792545) b!1192153))

(assert (= (and b!1192153 res!792544) b!1192151))

(assert (= (and b!1192151 res!792540) b!1192152))

(assert (= (and b!1192152 res!792541) b!1192146))

(assert (= (and b!1192146 res!792548) b!1192147))

(assert (= (and b!1192147 res!792543) b!1192160))

(assert (= (and b!1192160 res!792549) b!1192157))

(assert (= (and b!1192157 res!792551) b!1192150))

(assert (= (and b!1192150 (not res!792547)) b!1192149))

(assert (= (and b!1192149 (not res!792542)) b!1192155))

(assert (= (and b!1192156 condMapEmpty!46964) mapIsEmpty!46964))

(assert (= (and b!1192156 (not condMapEmpty!46964)) mapNonEmpty!46964))

(get-info :version)

(assert (= (and mapNonEmpty!46964 ((_ is ValueCellFull!14336) mapValue!46964)) b!1192154))

(assert (= (and b!1192156 ((_ is ValueCellFull!14336) mapDefault!46964)) b!1192159))

(assert (= start!100218 b!1192156))

(declare-fun b_lambda!20699 () Bool)

(assert (=> (not b_lambda!20699) (not b!1192149)))

(declare-fun t!38723 () Bool)

(declare-fun tb!10365 () Bool)

(assert (=> (and start!100218 (= defaultEntry!1004 defaultEntry!1004) t!38723) tb!10365))

(declare-fun result!21305 () Bool)

(assert (=> tb!10365 (= result!21305 tp_is_empty!30091)))

(assert (=> b!1192149 t!38723))

(declare-fun b_and!41993 () Bool)

(assert (= b_and!41991 (and (=> t!38723 result!21305) b_and!41993)))

(declare-fun m!1100955 () Bool)

(assert (=> b!1192151 m!1100955))

(declare-fun m!1100957 () Bool)

(assert (=> b!1192157 m!1100957))

(declare-fun m!1100959 () Bool)

(assert (=> b!1192148 m!1100959))

(declare-fun m!1100961 () Bool)

(assert (=> start!100218 m!1100961))

(declare-fun m!1100963 () Bool)

(assert (=> start!100218 m!1100963))

(declare-fun m!1100965 () Bool)

(assert (=> b!1192149 m!1100965))

(declare-fun m!1100967 () Bool)

(assert (=> b!1192149 m!1100967))

(declare-fun m!1100969 () Bool)

(assert (=> b!1192149 m!1100969))

(declare-fun m!1100971 () Bool)

(assert (=> b!1192149 m!1100971))

(declare-fun m!1100973 () Bool)

(assert (=> b!1192160 m!1100973))

(declare-fun m!1100975 () Bool)

(assert (=> b!1192160 m!1100975))

(declare-fun m!1100977 () Bool)

(assert (=> mapNonEmpty!46964 m!1100977))

(declare-fun m!1100979 () Bool)

(assert (=> b!1192153 m!1100979))

(declare-fun m!1100981 () Bool)

(assert (=> b!1192147 m!1100981))

(declare-fun m!1100983 () Bool)

(assert (=> b!1192146 m!1100983))

(declare-fun m!1100985 () Bool)

(assert (=> b!1192155 m!1100985))

(declare-fun m!1100987 () Bool)

(assert (=> b!1192155 m!1100987))

(assert (=> b!1192155 m!1100987))

(declare-fun m!1100989 () Bool)

(assert (=> b!1192155 m!1100989))

(declare-fun m!1100991 () Bool)

(assert (=> b!1192155 m!1100991))

(declare-fun m!1100993 () Bool)

(assert (=> b!1192150 m!1100993))

(declare-fun m!1100995 () Bool)

(assert (=> b!1192150 m!1100995))

(check-sat (not b_next!25561) (not b!1192153) (not b!1192150) b_and!41993 (not b!1192155) (not b!1192157) (not b!1192146) (not b!1192148) (not mapNonEmpty!46964) tp_is_empty!30091 (not b!1192149) (not b!1192151) (not start!100218) (not b!1192160) (not b_lambda!20699))
(check-sat b_and!41993 (not b_next!25561))
