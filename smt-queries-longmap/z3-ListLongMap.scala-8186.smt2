; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99984 () Bool)

(assert start!99984)

(declare-fun b_free!25563 () Bool)

(declare-fun b_next!25563 () Bool)

(assert (=> start!99984 (= b_free!25563 (not b_next!25563))))

(declare-fun tp!89403 () Bool)

(declare-fun b_and!41993 () Bool)

(assert (=> start!99984 (= tp!89403 b_and!41993)))

(declare-fun b!1190904 () Bool)

(declare-fun res!792077 () Bool)

(declare-fun e!676997 () Bool)

(assert (=> b!1190904 (=> (not res!792077) (not e!676997))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190904 (= res!792077 (validMask!0 mask!1564))))

(declare-fun b!1190905 () Bool)

(declare-fun e!677000 () Bool)

(assert (=> b!1190905 (= e!676997 e!677000)))

(declare-fun res!792069 () Bool)

(assert (=> b!1190905 (=> (not res!792069) (not e!677000))))

(declare-datatypes ((array!76977 0))(
  ( (array!76978 (arr!37138 (Array (_ BitVec 32) (_ BitVec 64))) (size!37674 (_ BitVec 32))) )
))
(declare-fun lt!541627 () array!76977)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76977 (_ BitVec 32)) Bool)

(assert (=> b!1190905 (= res!792069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541627 mask!1564))))

(declare-fun _keys!1208 () array!76977)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190905 (= lt!541627 (array!76978 (store (arr!37138 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37674 _keys!1208)))))

(declare-fun b!1190906 () Bool)

(declare-fun res!792079 () Bool)

(assert (=> b!1190906 (=> (not res!792079) (not e!676997))))

(assert (=> b!1190906 (= res!792079 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37674 _keys!1208))))))

(declare-fun res!792070 () Bool)

(assert (=> start!99984 (=> (not res!792070) (not e!676997))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99984 (= res!792070 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37674 _keys!1208))))))

(assert (=> start!99984 e!676997))

(declare-fun tp_is_empty!30093 () Bool)

(assert (=> start!99984 tp_is_empty!30093))

(declare-fun array_inv!28322 (array!76977) Bool)

(assert (=> start!99984 (array_inv!28322 _keys!1208)))

(assert (=> start!99984 true))

(assert (=> start!99984 tp!89403))

(declare-datatypes ((V!45251 0))(
  ( (V!45252 (val!15103 Int)) )
))
(declare-datatypes ((ValueCell!14337 0))(
  ( (ValueCellFull!14337 (v!17741 V!45251)) (EmptyCell!14337) )
))
(declare-datatypes ((array!76979 0))(
  ( (array!76980 (arr!37139 (Array (_ BitVec 32) ValueCell!14337)) (size!37675 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76979)

(declare-fun e!676996 () Bool)

(declare-fun array_inv!28323 (array!76979) Bool)

(assert (=> start!99984 (and (array_inv!28323 _values!996) e!676996)))

(declare-fun b!1190907 () Bool)

(declare-fun res!792072 () Bool)

(assert (=> b!1190907 (=> (not res!792072) (not e!677000))))

(declare-datatypes ((List!26151 0))(
  ( (Nil!26148) (Cons!26147 (h!27356 (_ BitVec 64)) (t!38706 List!26151)) )
))
(declare-fun arrayNoDuplicates!0 (array!76977 (_ BitVec 32) List!26151) Bool)

(assert (=> b!1190907 (= res!792072 (arrayNoDuplicates!0 lt!541627 #b00000000000000000000000000000000 Nil!26148))))

(declare-fun mapIsEmpty!46967 () Bool)

(declare-fun mapRes!46967 () Bool)

(assert (=> mapIsEmpty!46967 mapRes!46967))

(declare-fun b!1190908 () Bool)

(declare-fun res!792074 () Bool)

(assert (=> b!1190908 (=> (not res!792074) (not e!676997))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1190908 (= res!792074 (and (= (size!37675 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37674 _keys!1208) (size!37675 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46967 () Bool)

(declare-fun tp!89402 () Bool)

(declare-fun e!677002 () Bool)

(assert (=> mapNonEmpty!46967 (= mapRes!46967 (and tp!89402 e!677002))))

(declare-fun mapRest!46967 () (Array (_ BitVec 32) ValueCell!14337))

(declare-fun mapKey!46967 () (_ BitVec 32))

(declare-fun mapValue!46967 () ValueCell!14337)

(assert (=> mapNonEmpty!46967 (= (arr!37139 _values!996) (store mapRest!46967 mapKey!46967 mapValue!46967))))

(declare-fun b!1190909 () Bool)

(assert (=> b!1190909 (= e!677002 tp_is_empty!30093)))

(declare-fun b!1190910 () Bool)

(declare-fun e!676999 () Bool)

(declare-fun e!677001 () Bool)

(assert (=> b!1190910 (= e!676999 e!677001)))

(declare-fun res!792075 () Bool)

(assert (=> b!1190910 (=> res!792075 e!677001)))

(assert (=> b!1190910 (= res!792075 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45251)

(declare-datatypes ((tuple2!19406 0))(
  ( (tuple2!19407 (_1!9714 (_ BitVec 64)) (_2!9714 V!45251)) )
))
(declare-datatypes ((List!26152 0))(
  ( (Nil!26149) (Cons!26148 (h!27357 tuple2!19406) (t!38707 List!26152)) )
))
(declare-datatypes ((ListLongMap!17375 0))(
  ( (ListLongMap!17376 (toList!8703 List!26152)) )
))
(declare-fun lt!541632 () ListLongMap!17375)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541629 () array!76979)

(declare-fun minValue!944 () V!45251)

(declare-fun getCurrentListMapNoExtraKeys!5144 (array!76977 array!76979 (_ BitVec 32) (_ BitVec 32) V!45251 V!45251 (_ BitVec 32) Int) ListLongMap!17375)

(assert (=> b!1190910 (= lt!541632 (getCurrentListMapNoExtraKeys!5144 lt!541627 lt!541629 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3081 (Int (_ BitVec 64)) V!45251)

(assert (=> b!1190910 (= lt!541629 (array!76980 (store (arr!37139 _values!996) i!673 (ValueCellFull!14337 (dynLambda!3081 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37675 _values!996)))))

(declare-fun lt!541631 () ListLongMap!17375)

(assert (=> b!1190910 (= lt!541631 (getCurrentListMapNoExtraKeys!5144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190911 () Bool)

(assert (=> b!1190911 (= e!677001 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1729 (ListLongMap!17375 (_ BitVec 64)) ListLongMap!17375)

(assert (=> b!1190911 (= (getCurrentListMapNoExtraKeys!5144 lt!541627 lt!541629 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1729 (getCurrentListMapNoExtraKeys!5144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39504 0))(
  ( (Unit!39505) )
))
(declare-fun lt!541630 () Unit!39504)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!938 (array!76977 array!76979 (_ BitVec 32) (_ BitVec 32) V!45251 V!45251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39504)

(assert (=> b!1190911 (= lt!541630 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!938 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190912 () Bool)

(declare-fun res!792078 () Bool)

(assert (=> b!1190912 (=> (not res!792078) (not e!676997))))

(assert (=> b!1190912 (= res!792078 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26148))))

(declare-fun b!1190913 () Bool)

(declare-fun res!792076 () Bool)

(assert (=> b!1190913 (=> (not res!792076) (not e!676997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190913 (= res!792076 (validKeyInArray!0 k0!934))))

(declare-fun b!1190914 () Bool)

(declare-fun res!792068 () Bool)

(assert (=> b!1190914 (=> (not res!792068) (not e!676997))))

(assert (=> b!1190914 (= res!792068 (= (select (arr!37138 _keys!1208) i!673) k0!934))))

(declare-fun b!1190915 () Bool)

(declare-fun e!676995 () Bool)

(assert (=> b!1190915 (= e!676995 tp_is_empty!30093)))

(declare-fun b!1190916 () Bool)

(declare-fun res!792071 () Bool)

(assert (=> b!1190916 (=> (not res!792071) (not e!676997))))

(assert (=> b!1190916 (= res!792071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190917 () Bool)

(assert (=> b!1190917 (= e!676996 (and e!676995 mapRes!46967))))

(declare-fun condMapEmpty!46967 () Bool)

(declare-fun mapDefault!46967 () ValueCell!14337)

(assert (=> b!1190917 (= condMapEmpty!46967 (= (arr!37139 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14337)) mapDefault!46967)))))

(declare-fun b!1190918 () Bool)

(assert (=> b!1190918 (= e!677000 (not e!676999))))

(declare-fun res!792073 () Bool)

(assert (=> b!1190918 (=> res!792073 e!676999)))

(assert (=> b!1190918 (= res!792073 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190918 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541628 () Unit!39504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76977 (_ BitVec 64) (_ BitVec 32)) Unit!39504)

(assert (=> b!1190918 (= lt!541628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99984 res!792070) b!1190904))

(assert (= (and b!1190904 res!792077) b!1190908))

(assert (= (and b!1190908 res!792074) b!1190916))

(assert (= (and b!1190916 res!792071) b!1190912))

(assert (= (and b!1190912 res!792078) b!1190906))

(assert (= (and b!1190906 res!792079) b!1190913))

(assert (= (and b!1190913 res!792076) b!1190914))

(assert (= (and b!1190914 res!792068) b!1190905))

(assert (= (and b!1190905 res!792069) b!1190907))

(assert (= (and b!1190907 res!792072) b!1190918))

(assert (= (and b!1190918 (not res!792073)) b!1190910))

(assert (= (and b!1190910 (not res!792075)) b!1190911))

(assert (= (and b!1190917 condMapEmpty!46967) mapIsEmpty!46967))

(assert (= (and b!1190917 (not condMapEmpty!46967)) mapNonEmpty!46967))

(get-info :version)

(assert (= (and mapNonEmpty!46967 ((_ is ValueCellFull!14337) mapValue!46967)) b!1190909))

(assert (= (and b!1190917 ((_ is ValueCellFull!14337) mapDefault!46967)) b!1190915))

(assert (= start!99984 b!1190917))

(declare-fun b_lambda!20707 () Bool)

(assert (=> (not b_lambda!20707) (not b!1190910)))

(declare-fun t!38705 () Bool)

(declare-fun tb!10375 () Bool)

(assert (=> (and start!99984 (= defaultEntry!1004 defaultEntry!1004) t!38705) tb!10375))

(declare-fun result!21317 () Bool)

(assert (=> tb!10375 (= result!21317 tp_is_empty!30093)))

(assert (=> b!1190910 t!38705))

(declare-fun b_and!41995 () Bool)

(assert (= b_and!41993 (and (=> t!38705 result!21317) b_and!41995)))

(declare-fun m!1099425 () Bool)

(assert (=> b!1190916 m!1099425))

(declare-fun m!1099427 () Bool)

(assert (=> mapNonEmpty!46967 m!1099427))

(declare-fun m!1099429 () Bool)

(assert (=> b!1190911 m!1099429))

(declare-fun m!1099431 () Bool)

(assert (=> b!1190911 m!1099431))

(assert (=> b!1190911 m!1099431))

(declare-fun m!1099433 () Bool)

(assert (=> b!1190911 m!1099433))

(declare-fun m!1099435 () Bool)

(assert (=> b!1190911 m!1099435))

(declare-fun m!1099437 () Bool)

(assert (=> b!1190918 m!1099437))

(declare-fun m!1099439 () Bool)

(assert (=> b!1190918 m!1099439))

(declare-fun m!1099441 () Bool)

(assert (=> b!1190910 m!1099441))

(declare-fun m!1099443 () Bool)

(assert (=> b!1190910 m!1099443))

(declare-fun m!1099445 () Bool)

(assert (=> b!1190910 m!1099445))

(declare-fun m!1099447 () Bool)

(assert (=> b!1190910 m!1099447))

(declare-fun m!1099449 () Bool)

(assert (=> b!1190913 m!1099449))

(declare-fun m!1099451 () Bool)

(assert (=> b!1190907 m!1099451))

(declare-fun m!1099453 () Bool)

(assert (=> b!1190905 m!1099453))

(declare-fun m!1099455 () Bool)

(assert (=> b!1190905 m!1099455))

(declare-fun m!1099457 () Bool)

(assert (=> start!99984 m!1099457))

(declare-fun m!1099459 () Bool)

(assert (=> start!99984 m!1099459))

(declare-fun m!1099461 () Bool)

(assert (=> b!1190904 m!1099461))

(declare-fun m!1099463 () Bool)

(assert (=> b!1190914 m!1099463))

(declare-fun m!1099465 () Bool)

(assert (=> b!1190912 m!1099465))

(check-sat (not b_next!25563) (not b!1190905) (not start!99984) (not b!1190913) (not b!1190904) (not b!1190918) (not mapNonEmpty!46967) tp_is_empty!30093 (not b!1190911) (not b!1190910) (not b!1190916) (not b!1190912) b_and!41995 (not b!1190907) (not b_lambda!20707))
(check-sat b_and!41995 (not b_next!25563))
