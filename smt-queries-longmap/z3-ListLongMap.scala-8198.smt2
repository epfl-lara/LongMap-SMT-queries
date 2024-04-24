; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100290 () Bool)

(assert start!100290)

(declare-fun b_free!25633 () Bool)

(declare-fun b_next!25633 () Bool)

(assert (=> start!100290 (= b_free!25633 (not b_next!25633))))

(declare-fun tp!89613 () Bool)

(declare-fun b_and!42135 () Bool)

(assert (=> start!100290 (= tp!89613 b_and!42135)))

(declare-fun b!1193838 () Bool)

(declare-fun res!793847 () Bool)

(declare-fun e!678672 () Bool)

(assert (=> b!1193838 (=> (not res!793847) (not e!678672))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!77151 0))(
  ( (array!77152 (arr!37219 (Array (_ BitVec 32) (_ BitVec 64))) (size!37756 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77151)

(assert (=> b!1193838 (= res!793847 (= (select (arr!37219 _keys!1208) i!673) k0!934))))

(declare-fun b!1193839 () Bool)

(declare-fun e!678667 () Bool)

(assert (=> b!1193839 (= e!678667 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!45345 0))(
  ( (V!45346 (val!15138 Int)) )
))
(declare-datatypes ((ValueCell!14372 0))(
  ( (ValueCellFull!14372 (v!17772 V!45345)) (EmptyCell!14372) )
))
(declare-datatypes ((array!77153 0))(
  ( (array!77154 (arr!37220 (Array (_ BitVec 32) ValueCell!14372)) (size!37757 (_ BitVec 32))) )
))
(declare-fun lt!542741 () array!77153)

(declare-fun _values!996 () array!77153)

(declare-fun lt!542744 () array!77151)

(declare-fun minValue!944 () V!45345)

(declare-fun zeroValue!944 () V!45345)

(declare-datatypes ((tuple2!19492 0))(
  ( (tuple2!19493 (_1!9757 (_ BitVec 64)) (_2!9757 V!45345)) )
))
(declare-datatypes ((List!26233 0))(
  ( (Nil!26230) (Cons!26229 (h!27447 tuple2!19492) (t!38850 List!26233)) )
))
(declare-datatypes ((ListLongMap!17469 0))(
  ( (ListLongMap!17470 (toList!8750 List!26233)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5218 (array!77151 array!77153 (_ BitVec 32) (_ BitVec 32) V!45345 V!45345 (_ BitVec 32) Int) ListLongMap!17469)

(declare-fun -!1756 (ListLongMap!17469 (_ BitVec 64)) ListLongMap!17469)

(assert (=> b!1193839 (= (getCurrentListMapNoExtraKeys!5218 lt!542744 lt!542741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1756 (getCurrentListMapNoExtraKeys!5218 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39541 0))(
  ( (Unit!39542) )
))
(declare-fun lt!542746 () Unit!39541)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!971 (array!77151 array!77153 (_ BitVec 32) (_ BitVec 32) V!45345 V!45345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39541)

(assert (=> b!1193839 (= lt!542746 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!971 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193840 () Bool)

(declare-fun res!793839 () Bool)

(assert (=> b!1193840 (=> (not res!793839) (not e!678672))))

(declare-datatypes ((List!26234 0))(
  ( (Nil!26231) (Cons!26230 (h!27448 (_ BitVec 64)) (t!38851 List!26234)) )
))
(declare-fun arrayNoDuplicates!0 (array!77151 (_ BitVec 32) List!26234) Bool)

(assert (=> b!1193840 (= res!793839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26231))))

(declare-fun b!1193841 () Bool)

(declare-fun e!678671 () Bool)

(declare-fun e!678670 () Bool)

(declare-fun mapRes!47072 () Bool)

(assert (=> b!1193841 (= e!678671 (and e!678670 mapRes!47072))))

(declare-fun condMapEmpty!47072 () Bool)

(declare-fun mapDefault!47072 () ValueCell!14372)

(assert (=> b!1193841 (= condMapEmpty!47072 (= (arr!37220 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14372)) mapDefault!47072)))))

(declare-fun b!1193842 () Bool)

(declare-fun res!793842 () Bool)

(assert (=> b!1193842 (=> (not res!793842) (not e!678672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193842 (= res!793842 (validMask!0 mask!1564))))

(declare-fun b!1193843 () Bool)

(declare-fun res!793843 () Bool)

(declare-fun e!678669 () Bool)

(assert (=> b!1193843 (=> (not res!793843) (not e!678669))))

(assert (=> b!1193843 (= res!793843 (arrayNoDuplicates!0 lt!542744 #b00000000000000000000000000000000 Nil!26231))))

(declare-fun mapNonEmpty!47072 () Bool)

(declare-fun tp!89612 () Bool)

(declare-fun e!678668 () Bool)

(assert (=> mapNonEmpty!47072 (= mapRes!47072 (and tp!89612 e!678668))))

(declare-fun mapRest!47072 () (Array (_ BitVec 32) ValueCell!14372))

(declare-fun mapKey!47072 () (_ BitVec 32))

(declare-fun mapValue!47072 () ValueCell!14372)

(assert (=> mapNonEmpty!47072 (= (arr!37220 _values!996) (store mapRest!47072 mapKey!47072 mapValue!47072))))

(declare-fun b!1193845 () Bool)

(declare-fun tp_is_empty!30163 () Bool)

(assert (=> b!1193845 (= e!678668 tp_is_empty!30163)))

(declare-fun b!1193846 () Bool)

(declare-fun res!793846 () Bool)

(assert (=> b!1193846 (=> (not res!793846) (not e!678672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193846 (= res!793846 (validKeyInArray!0 k0!934))))

(declare-fun b!1193847 () Bool)

(declare-fun e!678674 () Bool)

(assert (=> b!1193847 (= e!678674 e!678667)))

(declare-fun res!793836 () Bool)

(assert (=> b!1193847 (=> res!793836 e!678667)))

(assert (=> b!1193847 (= res!793836 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542742 () ListLongMap!17469)

(assert (=> b!1193847 (= lt!542742 (getCurrentListMapNoExtraKeys!5218 lt!542744 lt!542741 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3168 (Int (_ BitVec 64)) V!45345)

(assert (=> b!1193847 (= lt!542741 (array!77154 (store (arr!37220 _values!996) i!673 (ValueCellFull!14372 (dynLambda!3168 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37757 _values!996)))))

(declare-fun lt!542743 () ListLongMap!17469)

(assert (=> b!1193847 (= lt!542743 (getCurrentListMapNoExtraKeys!5218 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47072 () Bool)

(assert (=> mapIsEmpty!47072 mapRes!47072))

(declare-fun b!1193848 () Bool)

(declare-fun res!793845 () Bool)

(assert (=> b!1193848 (=> (not res!793845) (not e!678672))))

(assert (=> b!1193848 (= res!793845 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37756 _keys!1208))))))

(declare-fun b!1193849 () Bool)

(assert (=> b!1193849 (= e!678670 tp_is_empty!30163)))

(declare-fun b!1193850 () Bool)

(declare-fun res!793838 () Bool)

(assert (=> b!1193850 (=> (not res!793838) (not e!678672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77151 (_ BitVec 32)) Bool)

(assert (=> b!1193850 (= res!793838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193851 () Bool)

(declare-fun res!793837 () Bool)

(assert (=> b!1193851 (=> (not res!793837) (not e!678672))))

(assert (=> b!1193851 (= res!793837 (and (= (size!37757 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37756 _keys!1208) (size!37757 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193852 () Bool)

(assert (=> b!1193852 (= e!678669 (not e!678674))))

(declare-fun res!793844 () Bool)

(assert (=> b!1193852 (=> res!793844 e!678674)))

(assert (=> b!1193852 (= res!793844 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193852 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542745 () Unit!39541)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77151 (_ BitVec 64) (_ BitVec 32)) Unit!39541)

(assert (=> b!1193852 (= lt!542745 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193844 () Bool)

(assert (=> b!1193844 (= e!678672 e!678669)))

(declare-fun res!793840 () Bool)

(assert (=> b!1193844 (=> (not res!793840) (not e!678669))))

(assert (=> b!1193844 (= res!793840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542744 mask!1564))))

(assert (=> b!1193844 (= lt!542744 (array!77152 (store (arr!37219 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37756 _keys!1208)))))

(declare-fun res!793841 () Bool)

(assert (=> start!100290 (=> (not res!793841) (not e!678672))))

(assert (=> start!100290 (= res!793841 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37756 _keys!1208))))))

(assert (=> start!100290 e!678672))

(assert (=> start!100290 tp_is_empty!30163))

(declare-fun array_inv!28442 (array!77151) Bool)

(assert (=> start!100290 (array_inv!28442 _keys!1208)))

(assert (=> start!100290 true))

(assert (=> start!100290 tp!89613))

(declare-fun array_inv!28443 (array!77153) Bool)

(assert (=> start!100290 (and (array_inv!28443 _values!996) e!678671)))

(assert (= (and start!100290 res!793841) b!1193842))

(assert (= (and b!1193842 res!793842) b!1193851))

(assert (= (and b!1193851 res!793837) b!1193850))

(assert (= (and b!1193850 res!793838) b!1193840))

(assert (= (and b!1193840 res!793839) b!1193848))

(assert (= (and b!1193848 res!793845) b!1193846))

(assert (= (and b!1193846 res!793846) b!1193838))

(assert (= (and b!1193838 res!793847) b!1193844))

(assert (= (and b!1193844 res!793840) b!1193843))

(assert (= (and b!1193843 res!793843) b!1193852))

(assert (= (and b!1193852 (not res!793844)) b!1193847))

(assert (= (and b!1193847 (not res!793836)) b!1193839))

(assert (= (and b!1193841 condMapEmpty!47072) mapIsEmpty!47072))

(assert (= (and b!1193841 (not condMapEmpty!47072)) mapNonEmpty!47072))

(get-info :version)

(assert (= (and mapNonEmpty!47072 ((_ is ValueCellFull!14372) mapValue!47072)) b!1193845))

(assert (= (and b!1193841 ((_ is ValueCellFull!14372) mapDefault!47072)) b!1193849))

(assert (= start!100290 b!1193841))

(declare-fun b_lambda!20771 () Bool)

(assert (=> (not b_lambda!20771) (not b!1193847)))

(declare-fun t!38849 () Bool)

(declare-fun tb!10437 () Bool)

(assert (=> (and start!100290 (= defaultEntry!1004 defaultEntry!1004) t!38849) tb!10437))

(declare-fun result!21449 () Bool)

(assert (=> tb!10437 (= result!21449 tp_is_empty!30163)))

(assert (=> b!1193847 t!38849))

(declare-fun b_and!42137 () Bool)

(assert (= b_and!42135 (and (=> t!38849 result!21449) b_and!42137)))

(declare-fun m!1102467 () Bool)

(assert (=> b!1193840 m!1102467))

(declare-fun m!1102469 () Bool)

(assert (=> mapNonEmpty!47072 m!1102469))

(declare-fun m!1102471 () Bool)

(assert (=> b!1193846 m!1102471))

(declare-fun m!1102473 () Bool)

(assert (=> start!100290 m!1102473))

(declare-fun m!1102475 () Bool)

(assert (=> start!100290 m!1102475))

(declare-fun m!1102477 () Bool)

(assert (=> b!1193852 m!1102477))

(declare-fun m!1102479 () Bool)

(assert (=> b!1193852 m!1102479))

(declare-fun m!1102481 () Bool)

(assert (=> b!1193843 m!1102481))

(declare-fun m!1102483 () Bool)

(assert (=> b!1193839 m!1102483))

(declare-fun m!1102485 () Bool)

(assert (=> b!1193839 m!1102485))

(assert (=> b!1193839 m!1102485))

(declare-fun m!1102487 () Bool)

(assert (=> b!1193839 m!1102487))

(declare-fun m!1102489 () Bool)

(assert (=> b!1193839 m!1102489))

(declare-fun m!1102491 () Bool)

(assert (=> b!1193847 m!1102491))

(declare-fun m!1102493 () Bool)

(assert (=> b!1193847 m!1102493))

(declare-fun m!1102495 () Bool)

(assert (=> b!1193847 m!1102495))

(declare-fun m!1102497 () Bool)

(assert (=> b!1193847 m!1102497))

(declare-fun m!1102499 () Bool)

(assert (=> b!1193844 m!1102499))

(declare-fun m!1102501 () Bool)

(assert (=> b!1193844 m!1102501))

(declare-fun m!1102503 () Bool)

(assert (=> b!1193842 m!1102503))

(declare-fun m!1102505 () Bool)

(assert (=> b!1193838 m!1102505))

(declare-fun m!1102507 () Bool)

(assert (=> b!1193850 m!1102507))

(check-sat (not b!1193839) (not b!1193844) b_and!42137 (not b!1193842) (not b_next!25633) (not b!1193840) (not b!1193852) (not b!1193846) (not b!1193850) (not mapNonEmpty!47072) (not b!1193847) tp_is_empty!30163 (not start!100290) (not b_lambda!20771) (not b!1193843))
(check-sat b_and!42137 (not b_next!25633))
