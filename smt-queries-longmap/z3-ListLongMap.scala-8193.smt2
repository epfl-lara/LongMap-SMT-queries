; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100026 () Bool)

(assert start!100026)

(declare-fun b_free!25605 () Bool)

(declare-fun b_next!25605 () Bool)

(assert (=> start!100026 (= b_free!25605 (not b_next!25605))))

(declare-fun tp!89528 () Bool)

(declare-fun b_and!42077 () Bool)

(assert (=> start!100026 (= tp!89528 b_and!42077)))

(declare-fun b!1191891 () Bool)

(declare-fun res!792829 () Bool)

(declare-fun e!677506 () Bool)

(assert (=> b!1191891 (=> (not res!792829) (not e!677506))))

(declare-datatypes ((array!77059 0))(
  ( (array!77060 (arr!37179 (Array (_ BitVec 32) (_ BitVec 64))) (size!37715 (_ BitVec 32))) )
))
(declare-fun lt!542008 () array!77059)

(declare-datatypes ((List!26183 0))(
  ( (Nil!26180) (Cons!26179 (h!27388 (_ BitVec 64)) (t!38780 List!26183)) )
))
(declare-fun arrayNoDuplicates!0 (array!77059 (_ BitVec 32) List!26183) Bool)

(assert (=> b!1191891 (= res!792829 (arrayNoDuplicates!0 lt!542008 #b00000000000000000000000000000000 Nil!26180))))

(declare-fun b!1191892 () Bool)

(declare-fun e!677505 () Bool)

(assert (=> b!1191892 (= e!677505 e!677506)))

(declare-fun res!792827 () Bool)

(assert (=> b!1191892 (=> (not res!792827) (not e!677506))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77059 (_ BitVec 32)) Bool)

(assert (=> b!1191892 (= res!792827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542008 mask!1564))))

(declare-fun _keys!1208 () array!77059)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191892 (= lt!542008 (array!77060 (store (arr!37179 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37715 _keys!1208)))))

(declare-fun b!1191893 () Bool)

(declare-fun e!677502 () Bool)

(declare-fun e!677504 () Bool)

(declare-fun mapRes!47030 () Bool)

(assert (=> b!1191893 (= e!677502 (and e!677504 mapRes!47030))))

(declare-fun condMapEmpty!47030 () Bool)

(declare-datatypes ((V!45307 0))(
  ( (V!45308 (val!15124 Int)) )
))
(declare-datatypes ((ValueCell!14358 0))(
  ( (ValueCellFull!14358 (v!17762 V!45307)) (EmptyCell!14358) )
))
(declare-datatypes ((array!77061 0))(
  ( (array!77062 (arr!37180 (Array (_ BitVec 32) ValueCell!14358)) (size!37716 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77061)

(declare-fun mapDefault!47030 () ValueCell!14358)

(assert (=> b!1191893 (= condMapEmpty!47030 (= (arr!37180 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14358)) mapDefault!47030)))))

(declare-fun b!1191894 () Bool)

(declare-fun tp_is_empty!30135 () Bool)

(assert (=> b!1191894 (= e!677504 tp_is_empty!30135)))

(declare-fun b!1191895 () Bool)

(declare-fun e!677503 () Bool)

(assert (=> b!1191895 (= e!677503 tp_is_empty!30135)))

(declare-fun mapIsEmpty!47030 () Bool)

(assert (=> mapIsEmpty!47030 mapRes!47030))

(declare-fun b!1191896 () Bool)

(declare-fun res!792833 () Bool)

(assert (=> b!1191896 (=> (not res!792833) (not e!677505))))

(assert (=> b!1191896 (= res!792833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191897 () Bool)

(declare-fun e!677501 () Bool)

(assert (=> b!1191897 (= e!677506 (not e!677501))))

(declare-fun res!792825 () Bool)

(assert (=> b!1191897 (=> res!792825 e!677501)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1191897 (= res!792825 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191897 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39538 0))(
  ( (Unit!39539) )
))
(declare-fun lt!542010 () Unit!39538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77059 (_ BitVec 64) (_ BitVec 32)) Unit!39538)

(assert (=> b!1191897 (= lt!542010 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191898 () Bool)

(declare-fun res!792832 () Bool)

(assert (=> b!1191898 (=> (not res!792832) (not e!677505))))

(assert (=> b!1191898 (= res!792832 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37715 _keys!1208))))))

(declare-fun b!1191899 () Bool)

(declare-fun res!792834 () Bool)

(assert (=> b!1191899 (=> (not res!792834) (not e!677505))))

(assert (=> b!1191899 (= res!792834 (= (select (arr!37179 _keys!1208) i!673) k0!934))))

(declare-fun b!1191900 () Bool)

(declare-fun res!792830 () Bool)

(assert (=> b!1191900 (=> (not res!792830) (not e!677505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191900 (= res!792830 (validKeyInArray!0 k0!934))))

(declare-fun b!1191901 () Bool)

(declare-fun res!792828 () Bool)

(assert (=> b!1191901 (=> (not res!792828) (not e!677505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191901 (= res!792828 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47030 () Bool)

(declare-fun tp!89529 () Bool)

(assert (=> mapNonEmpty!47030 (= mapRes!47030 (and tp!89529 e!677503))))

(declare-fun mapValue!47030 () ValueCell!14358)

(declare-fun mapKey!47030 () (_ BitVec 32))

(declare-fun mapRest!47030 () (Array (_ BitVec 32) ValueCell!14358))

(assert (=> mapNonEmpty!47030 (= (arr!37180 _values!996) (store mapRest!47030 mapKey!47030 mapValue!47030))))

(declare-fun b!1191903 () Bool)

(declare-fun res!792826 () Bool)

(assert (=> b!1191903 (=> (not res!792826) (not e!677505))))

(assert (=> b!1191903 (= res!792826 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26180))))

(declare-fun b!1191902 () Bool)

(declare-fun e!677500 () Bool)

(assert (=> b!1191902 (= e!677500 true)))

(declare-fun zeroValue!944 () V!45307)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!542007 () array!77061)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45307)

(declare-datatypes ((tuple2!19440 0))(
  ( (tuple2!19441 (_1!9731 (_ BitVec 64)) (_2!9731 V!45307)) )
))
(declare-datatypes ((List!26184 0))(
  ( (Nil!26181) (Cons!26180 (h!27389 tuple2!19440) (t!38781 List!26184)) )
))
(declare-datatypes ((ListLongMap!17409 0))(
  ( (ListLongMap!17410 (toList!8720 List!26184)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5161 (array!77059 array!77061 (_ BitVec 32) (_ BitVec 32) V!45307 V!45307 (_ BitVec 32) Int) ListLongMap!17409)

(declare-fun -!1745 (ListLongMap!17409 (_ BitVec 64)) ListLongMap!17409)

(assert (=> b!1191902 (= (getCurrentListMapNoExtraKeys!5161 lt!542008 lt!542007 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1745 (getCurrentListMapNoExtraKeys!5161 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542009 () Unit!39538)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!954 (array!77059 array!77061 (_ BitVec 32) (_ BitVec 32) V!45307 V!45307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39538)

(assert (=> b!1191902 (= lt!542009 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!954 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!792824 () Bool)

(assert (=> start!100026 (=> (not res!792824) (not e!677505))))

(assert (=> start!100026 (= res!792824 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37715 _keys!1208))))))

(assert (=> start!100026 e!677505))

(assert (=> start!100026 tp_is_empty!30135))

(declare-fun array_inv!28352 (array!77059) Bool)

(assert (=> start!100026 (array_inv!28352 _keys!1208)))

(assert (=> start!100026 true))

(assert (=> start!100026 tp!89528))

(declare-fun array_inv!28353 (array!77061) Bool)

(assert (=> start!100026 (and (array_inv!28353 _values!996) e!677502)))

(declare-fun b!1191904 () Bool)

(assert (=> b!1191904 (= e!677501 e!677500)))

(declare-fun res!792831 () Bool)

(assert (=> b!1191904 (=> res!792831 e!677500)))

(assert (=> b!1191904 (= res!792831 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542006 () ListLongMap!17409)

(assert (=> b!1191904 (= lt!542006 (getCurrentListMapNoExtraKeys!5161 lt!542008 lt!542007 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3094 (Int (_ BitVec 64)) V!45307)

(assert (=> b!1191904 (= lt!542007 (array!77062 (store (arr!37180 _values!996) i!673 (ValueCellFull!14358 (dynLambda!3094 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37716 _values!996)))))

(declare-fun lt!542005 () ListLongMap!17409)

(assert (=> b!1191904 (= lt!542005 (getCurrentListMapNoExtraKeys!5161 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191905 () Bool)

(declare-fun res!792835 () Bool)

(assert (=> b!1191905 (=> (not res!792835) (not e!677505))))

(assert (=> b!1191905 (= res!792835 (and (= (size!37716 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37715 _keys!1208) (size!37716 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100026 res!792824) b!1191901))

(assert (= (and b!1191901 res!792828) b!1191905))

(assert (= (and b!1191905 res!792835) b!1191896))

(assert (= (and b!1191896 res!792833) b!1191903))

(assert (= (and b!1191903 res!792826) b!1191898))

(assert (= (and b!1191898 res!792832) b!1191900))

(assert (= (and b!1191900 res!792830) b!1191899))

(assert (= (and b!1191899 res!792834) b!1191892))

(assert (= (and b!1191892 res!792827) b!1191891))

(assert (= (and b!1191891 res!792829) b!1191897))

(assert (= (and b!1191897 (not res!792825)) b!1191904))

(assert (= (and b!1191904 (not res!792831)) b!1191902))

(assert (= (and b!1191893 condMapEmpty!47030) mapIsEmpty!47030))

(assert (= (and b!1191893 (not condMapEmpty!47030)) mapNonEmpty!47030))

(get-info :version)

(assert (= (and mapNonEmpty!47030 ((_ is ValueCellFull!14358) mapValue!47030)) b!1191895))

(assert (= (and b!1191893 ((_ is ValueCellFull!14358) mapDefault!47030)) b!1191894))

(assert (= start!100026 b!1191893))

(declare-fun b_lambda!20749 () Bool)

(assert (=> (not b_lambda!20749) (not b!1191904)))

(declare-fun t!38779 () Bool)

(declare-fun tb!10417 () Bool)

(assert (=> (and start!100026 (= defaultEntry!1004 defaultEntry!1004) t!38779) tb!10417))

(declare-fun result!21401 () Bool)

(assert (=> tb!10417 (= result!21401 tp_is_empty!30135)))

(assert (=> b!1191904 t!38779))

(declare-fun b_and!42079 () Bool)

(assert (= b_and!42077 (and (=> t!38779 result!21401) b_and!42079)))

(declare-fun m!1100307 () Bool)

(assert (=> b!1191899 m!1100307))

(declare-fun m!1100309 () Bool)

(assert (=> mapNonEmpty!47030 m!1100309))

(declare-fun m!1100311 () Bool)

(assert (=> b!1191896 m!1100311))

(declare-fun m!1100313 () Bool)

(assert (=> b!1191902 m!1100313))

(declare-fun m!1100315 () Bool)

(assert (=> b!1191902 m!1100315))

(assert (=> b!1191902 m!1100315))

(declare-fun m!1100317 () Bool)

(assert (=> b!1191902 m!1100317))

(declare-fun m!1100319 () Bool)

(assert (=> b!1191902 m!1100319))

(declare-fun m!1100321 () Bool)

(assert (=> b!1191897 m!1100321))

(declare-fun m!1100323 () Bool)

(assert (=> b!1191897 m!1100323))

(declare-fun m!1100325 () Bool)

(assert (=> start!100026 m!1100325))

(declare-fun m!1100327 () Bool)

(assert (=> start!100026 m!1100327))

(declare-fun m!1100329 () Bool)

(assert (=> b!1191892 m!1100329))

(declare-fun m!1100331 () Bool)

(assert (=> b!1191892 m!1100331))

(declare-fun m!1100333 () Bool)

(assert (=> b!1191904 m!1100333))

(declare-fun m!1100335 () Bool)

(assert (=> b!1191904 m!1100335))

(declare-fun m!1100337 () Bool)

(assert (=> b!1191904 m!1100337))

(declare-fun m!1100339 () Bool)

(assert (=> b!1191904 m!1100339))

(declare-fun m!1100341 () Bool)

(assert (=> b!1191901 m!1100341))

(declare-fun m!1100343 () Bool)

(assert (=> b!1191903 m!1100343))

(declare-fun m!1100345 () Bool)

(assert (=> b!1191900 m!1100345))

(declare-fun m!1100347 () Bool)

(assert (=> b!1191891 m!1100347))

(check-sat (not mapNonEmpty!47030) (not b!1191901) tp_is_empty!30135 (not b!1191903) (not b!1191902) b_and!42079 (not b!1191892) (not start!100026) (not b_lambda!20749) (not b_next!25605) (not b!1191891) (not b!1191896) (not b!1191897) (not b!1191904) (not b!1191900))
(check-sat b_and!42079 (not b_next!25605))
