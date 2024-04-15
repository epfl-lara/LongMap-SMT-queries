; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101208 () Bool)

(assert start!101208)

(declare-fun b_free!26137 () Bool)

(declare-fun b_next!26137 () Bool)

(assert (=> start!101208 (= b_free!26137 (not b_next!26137))))

(declare-fun tp!91433 () Bool)

(declare-fun b_and!43373 () Bool)

(assert (=> start!101208 (= tp!91433 b_and!43373)))

(declare-fun mapIsEmpty!48136 () Bool)

(declare-fun mapRes!48136 () Bool)

(assert (=> mapIsEmpty!48136 mapRes!48136))

(declare-fun b!1215179 () Bool)

(declare-fun e!690004 () Bool)

(declare-fun e!690002 () Bool)

(assert (=> b!1215179 (= e!690004 e!690002)))

(declare-fun res!806836 () Bool)

(assert (=> b!1215179 (=> (not res!806836) (not e!690002))))

(declare-datatypes ((array!78380 0))(
  ( (array!78381 (arr!37825 (Array (_ BitVec 32) (_ BitVec 64))) (size!38363 (_ BitVec 32))) )
))
(declare-fun lt!552394 () array!78380)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78380 (_ BitVec 32)) Bool)

(assert (=> b!1215179 (= res!806836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552394 mask!1564))))

(declare-fun _keys!1208 () array!78380)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215179 (= lt!552394 (array!78381 (store (arr!37825 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38363 _keys!1208)))))

(declare-fun b!1215180 () Bool)

(declare-fun res!806834 () Bool)

(assert (=> b!1215180 (=> (not res!806834) (not e!690004))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46249 0))(
  ( (V!46250 (val!15477 Int)) )
))
(declare-datatypes ((ValueCell!14711 0))(
  ( (ValueCellFull!14711 (v!18129 V!46249)) (EmptyCell!14711) )
))
(declare-datatypes ((array!78382 0))(
  ( (array!78383 (arr!37826 (Array (_ BitVec 32) ValueCell!14711)) (size!38364 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78382)

(assert (=> b!1215180 (= res!806834 (and (= (size!38364 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38363 _keys!1208) (size!38364 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215181 () Bool)

(declare-fun res!806837 () Bool)

(assert (=> b!1215181 (=> (not res!806837) (not e!690004))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215181 (= res!806837 (= (select (arr!37825 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48136 () Bool)

(declare-fun tp!91432 () Bool)

(declare-fun e!690007 () Bool)

(assert (=> mapNonEmpty!48136 (= mapRes!48136 (and tp!91432 e!690007))))

(declare-fun mapKey!48136 () (_ BitVec 32))

(declare-fun mapValue!48136 () ValueCell!14711)

(declare-fun mapRest!48136 () (Array (_ BitVec 32) ValueCell!14711))

(assert (=> mapNonEmpty!48136 (= (arr!37826 _values!996) (store mapRest!48136 mapKey!48136 mapValue!48136))))

(declare-fun res!806831 () Bool)

(assert (=> start!101208 (=> (not res!806831) (not e!690004))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101208 (= res!806831 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38363 _keys!1208))))))

(assert (=> start!101208 e!690004))

(declare-fun tp_is_empty!30841 () Bool)

(assert (=> start!101208 tp_is_empty!30841))

(declare-fun array_inv!28916 (array!78380) Bool)

(assert (=> start!101208 (array_inv!28916 _keys!1208)))

(assert (=> start!101208 true))

(assert (=> start!101208 tp!91433))

(declare-fun e!690005 () Bool)

(declare-fun array_inv!28917 (array!78382) Bool)

(assert (=> start!101208 (and (array_inv!28917 _values!996) e!690005)))

(declare-fun b!1215182 () Bool)

(declare-fun res!806839 () Bool)

(assert (=> b!1215182 (=> (not res!806839) (not e!690004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215182 (= res!806839 (validMask!0 mask!1564))))

(declare-fun b!1215183 () Bool)

(declare-fun res!806835 () Bool)

(assert (=> b!1215183 (=> (not res!806835) (not e!690004))))

(assert (=> b!1215183 (= res!806835 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38363 _keys!1208))))))

(declare-fun b!1215184 () Bool)

(declare-fun e!690006 () Bool)

(assert (=> b!1215184 (= e!690002 (not e!690006))))

(declare-fun res!806829 () Bool)

(assert (=> b!1215184 (=> res!806829 e!690006)))

(assert (=> b!1215184 (= res!806829 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215184 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40155 0))(
  ( (Unit!40156) )
))
(declare-fun lt!552395 () Unit!40155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78380 (_ BitVec 64) (_ BitVec 32)) Unit!40155)

(assert (=> b!1215184 (= lt!552395 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215185 () Bool)

(assert (=> b!1215185 (= e!690007 tp_is_empty!30841)))

(declare-fun b!1215186 () Bool)

(declare-fun res!806830 () Bool)

(assert (=> b!1215186 (=> (not res!806830) (not e!690004))))

(declare-datatypes ((List!26758 0))(
  ( (Nil!26755) (Cons!26754 (h!27963 (_ BitVec 64)) (t!39866 List!26758)) )
))
(declare-fun arrayNoDuplicates!0 (array!78380 (_ BitVec 32) List!26758) Bool)

(assert (=> b!1215186 (= res!806830 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26755))))

(declare-fun b!1215187 () Bool)

(declare-fun res!806838 () Bool)

(assert (=> b!1215187 (=> (not res!806838) (not e!690004))))

(assert (=> b!1215187 (= res!806838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215188 () Bool)

(declare-fun e!690003 () Bool)

(assert (=> b!1215188 (= e!690005 (and e!690003 mapRes!48136))))

(declare-fun condMapEmpty!48136 () Bool)

(declare-fun mapDefault!48136 () ValueCell!14711)

(assert (=> b!1215188 (= condMapEmpty!48136 (= (arr!37826 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14711)) mapDefault!48136)))))

(declare-fun b!1215189 () Bool)

(declare-fun res!806832 () Bool)

(assert (=> b!1215189 (=> (not res!806832) (not e!690002))))

(assert (=> b!1215189 (= res!806832 (arrayNoDuplicates!0 lt!552394 #b00000000000000000000000000000000 Nil!26755))))

(declare-fun b!1215190 () Bool)

(assert (=> b!1215190 (= e!690006 true)))

(declare-fun zeroValue!944 () V!46249)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19978 0))(
  ( (tuple2!19979 (_1!10000 (_ BitVec 64)) (_2!10000 V!46249)) )
))
(declare-datatypes ((List!26759 0))(
  ( (Nil!26756) (Cons!26755 (h!27964 tuple2!19978) (t!39867 List!26759)) )
))
(declare-datatypes ((ListLongMap!17947 0))(
  ( (ListLongMap!17948 (toList!8989 List!26759)) )
))
(declare-fun lt!552393 () ListLongMap!17947)

(declare-fun minValue!944 () V!46249)

(declare-fun getCurrentListMapNoExtraKeys!5428 (array!78380 array!78382 (_ BitVec 32) (_ BitVec 32) V!46249 V!46249 (_ BitVec 32) Int) ListLongMap!17947)

(declare-fun dynLambda!3280 (Int (_ BitVec 64)) V!46249)

(assert (=> b!1215190 (= lt!552393 (getCurrentListMapNoExtraKeys!5428 lt!552394 (array!78383 (store (arr!37826 _values!996) i!673 (ValueCellFull!14711 (dynLambda!3280 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38364 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552392 () ListLongMap!17947)

(assert (=> b!1215190 (= lt!552392 (getCurrentListMapNoExtraKeys!5428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1215191 () Bool)

(assert (=> b!1215191 (= e!690003 tp_is_empty!30841)))

(declare-fun b!1215192 () Bool)

(declare-fun res!806833 () Bool)

(assert (=> b!1215192 (=> (not res!806833) (not e!690004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215192 (= res!806833 (validKeyInArray!0 k0!934))))

(assert (= (and start!101208 res!806831) b!1215182))

(assert (= (and b!1215182 res!806839) b!1215180))

(assert (= (and b!1215180 res!806834) b!1215187))

(assert (= (and b!1215187 res!806838) b!1215186))

(assert (= (and b!1215186 res!806830) b!1215183))

(assert (= (and b!1215183 res!806835) b!1215192))

(assert (= (and b!1215192 res!806833) b!1215181))

(assert (= (and b!1215181 res!806837) b!1215179))

(assert (= (and b!1215179 res!806836) b!1215189))

(assert (= (and b!1215189 res!806832) b!1215184))

(assert (= (and b!1215184 (not res!806829)) b!1215190))

(assert (= (and b!1215188 condMapEmpty!48136) mapIsEmpty!48136))

(assert (= (and b!1215188 (not condMapEmpty!48136)) mapNonEmpty!48136))

(get-info :version)

(assert (= (and mapNonEmpty!48136 ((_ is ValueCellFull!14711) mapValue!48136)) b!1215185))

(assert (= (and b!1215188 ((_ is ValueCellFull!14711) mapDefault!48136)) b!1215191))

(assert (= start!101208 b!1215188))

(declare-fun b_lambda!21803 () Bool)

(assert (=> (not b_lambda!21803) (not b!1215190)))

(declare-fun t!39865 () Bool)

(declare-fun tb!10929 () Bool)

(assert (=> (and start!101208 (= defaultEntry!1004 defaultEntry!1004) t!39865) tb!10929))

(declare-fun result!22463 () Bool)

(assert (=> tb!10929 (= result!22463 tp_is_empty!30841)))

(assert (=> b!1215190 t!39865))

(declare-fun b_and!43375 () Bool)

(assert (= b_and!43373 (and (=> t!39865 result!22463) b_and!43375)))

(declare-fun m!1119729 () Bool)

(assert (=> b!1215189 m!1119729))

(declare-fun m!1119731 () Bool)

(assert (=> b!1215182 m!1119731))

(declare-fun m!1119733 () Bool)

(assert (=> start!101208 m!1119733))

(declare-fun m!1119735 () Bool)

(assert (=> start!101208 m!1119735))

(declare-fun m!1119737 () Bool)

(assert (=> b!1215192 m!1119737))

(declare-fun m!1119739 () Bool)

(assert (=> b!1215184 m!1119739))

(declare-fun m!1119741 () Bool)

(assert (=> b!1215184 m!1119741))

(declare-fun m!1119743 () Bool)

(assert (=> b!1215181 m!1119743))

(declare-fun m!1119745 () Bool)

(assert (=> b!1215179 m!1119745))

(declare-fun m!1119747 () Bool)

(assert (=> b!1215179 m!1119747))

(declare-fun m!1119749 () Bool)

(assert (=> b!1215187 m!1119749))

(declare-fun m!1119751 () Bool)

(assert (=> b!1215190 m!1119751))

(declare-fun m!1119753 () Bool)

(assert (=> b!1215190 m!1119753))

(declare-fun m!1119755 () Bool)

(assert (=> b!1215190 m!1119755))

(declare-fun m!1119757 () Bool)

(assert (=> b!1215190 m!1119757))

(declare-fun m!1119759 () Bool)

(assert (=> mapNonEmpty!48136 m!1119759))

(declare-fun m!1119761 () Bool)

(assert (=> b!1215186 m!1119761))

(check-sat tp_is_empty!30841 b_and!43375 (not b!1215184) (not b_lambda!21803) (not b!1215189) (not b!1215186) (not start!101208) (not b!1215187) (not b!1215179) (not mapNonEmpty!48136) (not b!1215192) (not b!1215190) (not b_next!26137) (not b!1215182))
(check-sat b_and!43375 (not b_next!26137))
