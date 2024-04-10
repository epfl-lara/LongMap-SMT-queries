; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99996 () Bool)

(assert start!99996)

(declare-fun b_free!25575 () Bool)

(declare-fun b_next!25575 () Bool)

(assert (=> start!99996 (= b_free!25575 (not b_next!25575))))

(declare-fun tp!89438 () Bool)

(declare-fun b_and!42017 () Bool)

(assert (=> start!99996 (= tp!89438 b_and!42017)))

(declare-fun b!1191186 () Bool)

(declare-fun e!677139 () Bool)

(declare-fun e!677146 () Bool)

(assert (=> b!1191186 (= e!677139 e!677146)))

(declare-fun res!792288 () Bool)

(assert (=> b!1191186 (=> (not res!792288) (not e!677146))))

(declare-datatypes ((array!77001 0))(
  ( (array!77002 (arr!37150 (Array (_ BitVec 32) (_ BitVec 64))) (size!37686 (_ BitVec 32))) )
))
(declare-fun lt!541736 () array!77001)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77001 (_ BitVec 32)) Bool)

(assert (=> b!1191186 (= res!792288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541736 mask!1564))))

(declare-fun _keys!1208 () array!77001)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191186 (= lt!541736 (array!77002 (store (arr!37150 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37686 _keys!1208)))))

(declare-fun b!1191187 () Bool)

(declare-fun e!677143 () Bool)

(assert (=> b!1191187 (= e!677143 true)))

(declare-datatypes ((V!45267 0))(
  ( (V!45268 (val!15109 Int)) )
))
(declare-fun zeroValue!944 () V!45267)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45267)

(declare-datatypes ((ValueCell!14343 0))(
  ( (ValueCellFull!14343 (v!17747 V!45267)) (EmptyCell!14343) )
))
(declare-datatypes ((array!77003 0))(
  ( (array!77004 (arr!37151 (Array (_ BitVec 32) ValueCell!14343)) (size!37687 (_ BitVec 32))) )
))
(declare-fun lt!541735 () array!77003)

(declare-fun _values!996 () array!77003)

(declare-datatypes ((tuple2!19416 0))(
  ( (tuple2!19417 (_1!9719 (_ BitVec 64)) (_2!9719 V!45267)) )
))
(declare-datatypes ((List!26161 0))(
  ( (Nil!26158) (Cons!26157 (h!27366 tuple2!19416) (t!38728 List!26161)) )
))
(declare-datatypes ((ListLongMap!17385 0))(
  ( (ListLongMap!17386 (toList!8708 List!26161)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5149 (array!77001 array!77003 (_ BitVec 32) (_ BitVec 32) V!45267 V!45267 (_ BitVec 32) Int) ListLongMap!17385)

(declare-fun -!1733 (ListLongMap!17385 (_ BitVec 64)) ListLongMap!17385)

(assert (=> b!1191187 (= (getCurrentListMapNoExtraKeys!5149 lt!541736 lt!541735 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1733 (getCurrentListMapNoExtraKeys!5149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39512 0))(
  ( (Unit!39513) )
))
(declare-fun lt!541740 () Unit!39512)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!942 (array!77001 array!77003 (_ BitVec 32) (_ BitVec 32) V!45267 V!45267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39512)

(assert (=> b!1191187 (= lt!541740 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!942 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191188 () Bool)

(declare-fun res!792287 () Bool)

(assert (=> b!1191188 (=> (not res!792287) (not e!677139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191188 (= res!792287 (validMask!0 mask!1564))))

(declare-fun b!1191189 () Bool)

(declare-fun res!792289 () Bool)

(assert (=> b!1191189 (=> (not res!792289) (not e!677146))))

(declare-datatypes ((List!26162 0))(
  ( (Nil!26159) (Cons!26158 (h!27367 (_ BitVec 64)) (t!38729 List!26162)) )
))
(declare-fun arrayNoDuplicates!0 (array!77001 (_ BitVec 32) List!26162) Bool)

(assert (=> b!1191189 (= res!792289 (arrayNoDuplicates!0 lt!541736 #b00000000000000000000000000000000 Nil!26159))))

(declare-fun b!1191190 () Bool)

(declare-fun e!677142 () Bool)

(assert (=> b!1191190 (= e!677142 e!677143)))

(declare-fun res!792291 () Bool)

(assert (=> b!1191190 (=> res!792291 e!677143)))

(assert (=> b!1191190 (= res!792291 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541739 () ListLongMap!17385)

(assert (=> b!1191190 (= lt!541739 (getCurrentListMapNoExtraKeys!5149 lt!541736 lt!541735 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3084 (Int (_ BitVec 64)) V!45267)

(assert (=> b!1191190 (= lt!541735 (array!77004 (store (arr!37151 _values!996) i!673 (ValueCellFull!14343 (dynLambda!3084 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37687 _values!996)))))

(declare-fun lt!541738 () ListLongMap!17385)

(assert (=> b!1191190 (= lt!541738 (getCurrentListMapNoExtraKeys!5149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191191 () Bool)

(declare-fun res!792294 () Bool)

(assert (=> b!1191191 (=> (not res!792294) (not e!677139))))

(assert (=> b!1191191 (= res!792294 (and (= (size!37687 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37686 _keys!1208) (size!37687 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191192 () Bool)

(declare-fun res!792292 () Bool)

(assert (=> b!1191192 (=> (not res!792292) (not e!677139))))

(assert (=> b!1191192 (= res!792292 (= (select (arr!37150 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46985 () Bool)

(declare-fun mapRes!46985 () Bool)

(assert (=> mapIsEmpty!46985 mapRes!46985))

(declare-fun b!1191193 () Bool)

(declare-fun res!792285 () Bool)

(assert (=> b!1191193 (=> (not res!792285) (not e!677139))))

(assert (=> b!1191193 (= res!792285 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37686 _keys!1208))))))

(declare-fun b!1191194 () Bool)

(declare-fun e!677144 () Bool)

(declare-fun tp_is_empty!30105 () Bool)

(assert (=> b!1191194 (= e!677144 tp_is_empty!30105)))

(declare-fun mapNonEmpty!46985 () Bool)

(declare-fun tp!89439 () Bool)

(declare-fun e!677141 () Bool)

(assert (=> mapNonEmpty!46985 (= mapRes!46985 (and tp!89439 e!677141))))

(declare-fun mapValue!46985 () ValueCell!14343)

(declare-fun mapKey!46985 () (_ BitVec 32))

(declare-fun mapRest!46985 () (Array (_ BitVec 32) ValueCell!14343))

(assert (=> mapNonEmpty!46985 (= (arr!37151 _values!996) (store mapRest!46985 mapKey!46985 mapValue!46985))))

(declare-fun res!792286 () Bool)

(assert (=> start!99996 (=> (not res!792286) (not e!677139))))

(assert (=> start!99996 (= res!792286 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37686 _keys!1208))))))

(assert (=> start!99996 e!677139))

(assert (=> start!99996 tp_is_empty!30105))

(declare-fun array_inv!28330 (array!77001) Bool)

(assert (=> start!99996 (array_inv!28330 _keys!1208)))

(assert (=> start!99996 true))

(assert (=> start!99996 tp!89438))

(declare-fun e!677140 () Bool)

(declare-fun array_inv!28331 (array!77003) Bool)

(assert (=> start!99996 (and (array_inv!28331 _values!996) e!677140)))

(declare-fun b!1191195 () Bool)

(declare-fun res!792290 () Bool)

(assert (=> b!1191195 (=> (not res!792290) (not e!677139))))

(assert (=> b!1191195 (= res!792290 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26159))))

(declare-fun b!1191196 () Bool)

(declare-fun res!792295 () Bool)

(assert (=> b!1191196 (=> (not res!792295) (not e!677139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191196 (= res!792295 (validKeyInArray!0 k0!934))))

(declare-fun b!1191197 () Bool)

(assert (=> b!1191197 (= e!677141 tp_is_empty!30105)))

(declare-fun b!1191198 () Bool)

(assert (=> b!1191198 (= e!677140 (and e!677144 mapRes!46985))))

(declare-fun condMapEmpty!46985 () Bool)

(declare-fun mapDefault!46985 () ValueCell!14343)

(assert (=> b!1191198 (= condMapEmpty!46985 (= (arr!37151 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14343)) mapDefault!46985)))))

(declare-fun b!1191199 () Bool)

(declare-fun res!792293 () Bool)

(assert (=> b!1191199 (=> (not res!792293) (not e!677139))))

(assert (=> b!1191199 (= res!792293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191200 () Bool)

(assert (=> b!1191200 (= e!677146 (not e!677142))))

(declare-fun res!792284 () Bool)

(assert (=> b!1191200 (=> res!792284 e!677142)))

(assert (=> b!1191200 (= res!792284 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191200 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541737 () Unit!39512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77001 (_ BitVec 64) (_ BitVec 32)) Unit!39512)

(assert (=> b!1191200 (= lt!541737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99996 res!792286) b!1191188))

(assert (= (and b!1191188 res!792287) b!1191191))

(assert (= (and b!1191191 res!792294) b!1191199))

(assert (= (and b!1191199 res!792293) b!1191195))

(assert (= (and b!1191195 res!792290) b!1191193))

(assert (= (and b!1191193 res!792285) b!1191196))

(assert (= (and b!1191196 res!792295) b!1191192))

(assert (= (and b!1191192 res!792292) b!1191186))

(assert (= (and b!1191186 res!792288) b!1191189))

(assert (= (and b!1191189 res!792289) b!1191200))

(assert (= (and b!1191200 (not res!792284)) b!1191190))

(assert (= (and b!1191190 (not res!792291)) b!1191187))

(assert (= (and b!1191198 condMapEmpty!46985) mapIsEmpty!46985))

(assert (= (and b!1191198 (not condMapEmpty!46985)) mapNonEmpty!46985))

(get-info :version)

(assert (= (and mapNonEmpty!46985 ((_ is ValueCellFull!14343) mapValue!46985)) b!1191197))

(assert (= (and b!1191198 ((_ is ValueCellFull!14343) mapDefault!46985)) b!1191194))

(assert (= start!99996 b!1191198))

(declare-fun b_lambda!20719 () Bool)

(assert (=> (not b_lambda!20719) (not b!1191190)))

(declare-fun t!38727 () Bool)

(declare-fun tb!10387 () Bool)

(assert (=> (and start!99996 (= defaultEntry!1004 defaultEntry!1004) t!38727) tb!10387))

(declare-fun result!21341 () Bool)

(assert (=> tb!10387 (= result!21341 tp_is_empty!30105)))

(assert (=> b!1191190 t!38727))

(declare-fun b_and!42019 () Bool)

(assert (= b_and!42017 (and (=> t!38727 result!21341) b_and!42019)))

(declare-fun m!1099677 () Bool)

(assert (=> b!1191186 m!1099677))

(declare-fun m!1099679 () Bool)

(assert (=> b!1191186 m!1099679))

(declare-fun m!1099681 () Bool)

(assert (=> start!99996 m!1099681))

(declare-fun m!1099683 () Bool)

(assert (=> start!99996 m!1099683))

(declare-fun m!1099685 () Bool)

(assert (=> b!1191188 m!1099685))

(declare-fun m!1099687 () Bool)

(assert (=> b!1191192 m!1099687))

(declare-fun m!1099689 () Bool)

(assert (=> b!1191187 m!1099689))

(declare-fun m!1099691 () Bool)

(assert (=> b!1191187 m!1099691))

(assert (=> b!1191187 m!1099691))

(declare-fun m!1099693 () Bool)

(assert (=> b!1191187 m!1099693))

(declare-fun m!1099695 () Bool)

(assert (=> b!1191187 m!1099695))

(declare-fun m!1099697 () Bool)

(assert (=> b!1191196 m!1099697))

(declare-fun m!1099699 () Bool)

(assert (=> b!1191189 m!1099699))

(declare-fun m!1099701 () Bool)

(assert (=> mapNonEmpty!46985 m!1099701))

(declare-fun m!1099703 () Bool)

(assert (=> b!1191200 m!1099703))

(declare-fun m!1099705 () Bool)

(assert (=> b!1191200 m!1099705))

(declare-fun m!1099707 () Bool)

(assert (=> b!1191195 m!1099707))

(declare-fun m!1099709 () Bool)

(assert (=> b!1191190 m!1099709))

(declare-fun m!1099711 () Bool)

(assert (=> b!1191190 m!1099711))

(declare-fun m!1099713 () Bool)

(assert (=> b!1191190 m!1099713))

(declare-fun m!1099715 () Bool)

(assert (=> b!1191190 m!1099715))

(declare-fun m!1099717 () Bool)

(assert (=> b!1191199 m!1099717))

(check-sat (not b!1191199) (not b_lambda!20719) (not b!1191195) (not b!1191187) (not b!1191186) (not b_next!25575) (not b!1191196) tp_is_empty!30105 (not mapNonEmpty!46985) (not b!1191188) b_and!42019 (not b!1191189) (not b!1191200) (not b!1191190) (not start!99996))
(check-sat b_and!42019 (not b_next!25575))
