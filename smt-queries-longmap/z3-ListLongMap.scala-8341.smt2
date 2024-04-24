; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101766 () Bool)

(assert start!101766)

(declare-fun b_free!26317 () Bool)

(declare-fun b_next!26317 () Bool)

(assert (=> start!101766 (= b_free!26317 (not b_next!26317))))

(declare-fun tp!91987 () Bool)

(declare-fun b_and!43843 () Bool)

(assert (=> start!101766 (= tp!91987 b_and!43843)))

(declare-fun b!1221988 () Bool)

(declare-fun e!694009 () Bool)

(declare-fun e!694006 () Bool)

(assert (=> b!1221988 (= e!694009 e!694006)))

(declare-fun res!811410 () Bool)

(assert (=> b!1221988 (=> res!811410 e!694006)))

(declare-datatypes ((array!78859 0))(
  ( (array!78860 (arr!38053 (Array (_ BitVec 32) (_ BitVec 64))) (size!38590 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78859)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221988 (= res!811410 (not (= (select (arr!38053 _keys!1208) from!1455) k0!934)))))

(declare-fun e!694005 () Bool)

(assert (=> b!1221988 e!694005))

(declare-fun res!811401 () Bool)

(assert (=> b!1221988 (=> (not res!811401) (not e!694005))))

(declare-datatypes ((V!46489 0))(
  ( (V!46490 (val!15567 Int)) )
))
(declare-fun lt!555649 () V!46489)

(declare-datatypes ((tuple2!20054 0))(
  ( (tuple2!20055 (_1!10038 (_ BitVec 64)) (_2!10038 V!46489)) )
))
(declare-datatypes ((List!26864 0))(
  ( (Nil!26861) (Cons!26860 (h!28078 tuple2!20054) (t!40153 List!26864)) )
))
(declare-datatypes ((ListLongMap!18031 0))(
  ( (ListLongMap!18032 (toList!9031 List!26864)) )
))
(declare-fun lt!555648 () ListLongMap!18031)

(declare-fun lt!555644 () ListLongMap!18031)

(declare-datatypes ((ValueCell!14801 0))(
  ( (ValueCellFull!14801 (v!18221 V!46489)) (EmptyCell!14801) )
))
(declare-datatypes ((array!78861 0))(
  ( (array!78862 (arr!38054 (Array (_ BitVec 32) ValueCell!14801)) (size!38591 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78861)

(declare-fun +!4137 (ListLongMap!18031 tuple2!20054) ListLongMap!18031)

(declare-fun get!19457 (ValueCell!14801 V!46489) V!46489)

(assert (=> b!1221988 (= res!811401 (= lt!555648 (+!4137 lt!555644 (tuple2!20055 (select (arr!38053 _keys!1208) from!1455) (get!19457 (select (arr!38054 _values!996) from!1455) lt!555649)))))))

(declare-fun b!1221990 () Bool)

(declare-fun e!694004 () Bool)

(declare-fun e!693999 () Bool)

(declare-fun mapRes!48421 () Bool)

(assert (=> b!1221990 (= e!694004 (and e!693999 mapRes!48421))))

(declare-fun condMapEmpty!48421 () Bool)

(declare-fun mapDefault!48421 () ValueCell!14801)

(assert (=> b!1221990 (= condMapEmpty!48421 (= (arr!38054 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14801)) mapDefault!48421)))))

(declare-fun b!1221991 () Bool)

(declare-fun e!694007 () Bool)

(declare-fun tp_is_empty!31021 () Bool)

(assert (=> b!1221991 (= e!694007 tp_is_empty!31021)))

(declare-fun b!1221992 () Bool)

(declare-fun res!811404 () Bool)

(declare-fun e!694008 () Bool)

(assert (=> b!1221992 (=> (not res!811404) (not e!694008))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1221992 (= res!811404 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38590 _keys!1208))))))

(declare-fun b!1221993 () Bool)

(declare-fun res!811412 () Bool)

(assert (=> b!1221993 (=> (not res!811412) (not e!694008))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1221993 (= res!811412 (validMask!0 mask!1564))))

(declare-fun b!1221994 () Bool)

(declare-fun e!694001 () Bool)

(assert (=> b!1221994 (= e!694008 e!694001)))

(declare-fun res!811398 () Bool)

(assert (=> b!1221994 (=> (not res!811398) (not e!694001))))

(declare-fun lt!555651 () array!78859)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78859 (_ BitVec 32)) Bool)

(assert (=> b!1221994 (= res!811398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555651 mask!1564))))

(assert (=> b!1221994 (= lt!555651 (array!78860 (store (arr!38053 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38590 _keys!1208)))))

(declare-fun mapNonEmpty!48421 () Bool)

(declare-fun tp!91988 () Bool)

(assert (=> mapNonEmpty!48421 (= mapRes!48421 (and tp!91988 e!694007))))

(declare-fun mapValue!48421 () ValueCell!14801)

(declare-fun mapKey!48421 () (_ BitVec 32))

(declare-fun mapRest!48421 () (Array (_ BitVec 32) ValueCell!14801))

(assert (=> mapNonEmpty!48421 (= (arr!38054 _values!996) (store mapRest!48421 mapKey!48421 mapValue!48421))))

(declare-fun b!1221995 () Bool)

(declare-fun e!694000 () Bool)

(assert (=> b!1221995 (= e!694005 e!694000)))

(declare-fun res!811399 () Bool)

(assert (=> b!1221995 (=> res!811399 e!694000)))

(assert (=> b!1221995 (= res!811399 (not (= (select (arr!38053 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48421 () Bool)

(assert (=> mapIsEmpty!48421 mapRes!48421))

(declare-fun b!1221996 () Bool)

(declare-fun res!811408 () Bool)

(assert (=> b!1221996 (=> (not res!811408) (not e!694008))))

(assert (=> b!1221996 (= res!811408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1221997 () Bool)

(declare-fun res!811397 () Bool)

(assert (=> b!1221997 (=> (not res!811397) (not e!694001))))

(declare-datatypes ((List!26865 0))(
  ( (Nil!26862) (Cons!26861 (h!28079 (_ BitVec 64)) (t!40154 List!26865)) )
))
(declare-fun arrayNoDuplicates!0 (array!78859 (_ BitVec 32) List!26865) Bool)

(assert (=> b!1221997 (= res!811397 (arrayNoDuplicates!0 lt!555651 #b00000000000000000000000000000000 Nil!26862))))

(declare-fun b!1221998 () Bool)

(declare-fun e!693998 () Bool)

(assert (=> b!1221998 (= e!694001 (not e!693998))))

(declare-fun res!811407 () Bool)

(assert (=> b!1221998 (=> res!811407 e!693998)))

(assert (=> b!1221998 (= res!811407 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221998 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40420 0))(
  ( (Unit!40421) )
))
(declare-fun lt!555646 () Unit!40420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78859 (_ BitVec 64) (_ BitVec 32)) Unit!40420)

(assert (=> b!1221998 (= lt!555646 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1221999 () Bool)

(assert (=> b!1221999 (= e!693999 tp_is_empty!31021)))

(declare-fun b!1222000 () Bool)

(declare-fun res!811403 () Bool)

(assert (=> b!1222000 (=> (not res!811403) (not e!694008))))

(assert (=> b!1222000 (= res!811403 (= (select (arr!38053 _keys!1208) i!673) k0!934))))

(declare-fun b!1221989 () Bool)

(declare-fun res!811406 () Bool)

(assert (=> b!1221989 (=> (not res!811406) (not e!694008))))

(assert (=> b!1221989 (= res!811406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26862))))

(declare-fun res!811409 () Bool)

(assert (=> start!101766 (=> (not res!811409) (not e!694008))))

(assert (=> start!101766 (= res!811409 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38590 _keys!1208))))))

(assert (=> start!101766 e!694008))

(assert (=> start!101766 tp_is_empty!31021))

(declare-fun array_inv!29034 (array!78859) Bool)

(assert (=> start!101766 (array_inv!29034 _keys!1208)))

(assert (=> start!101766 true))

(assert (=> start!101766 tp!91987))

(declare-fun array_inv!29035 (array!78861) Bool)

(assert (=> start!101766 (and (array_inv!29035 _values!996) e!694004)))

(declare-fun b!1222001 () Bool)

(assert (=> b!1222001 (= e!694000 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222002 () Bool)

(declare-fun e!694002 () Bool)

(assert (=> b!1222002 (= e!694002 e!694009)))

(declare-fun res!811400 () Bool)

(assert (=> b!1222002 (=> res!811400 e!694009)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222002 (= res!811400 (not (validKeyInArray!0 (select (arr!38053 _keys!1208) from!1455))))))

(declare-fun lt!555642 () ListLongMap!18031)

(assert (=> b!1222002 (= lt!555642 lt!555644)))

(declare-fun lt!555641 () ListLongMap!18031)

(declare-fun -!1916 (ListLongMap!18031 (_ BitVec 64)) ListLongMap!18031)

(assert (=> b!1222002 (= lt!555644 (-!1916 lt!555641 k0!934))))

(declare-fun zeroValue!944 () V!46489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!555647 () array!78861)

(declare-fun minValue!944 () V!46489)

(declare-fun getCurrentListMapNoExtraKeys!5486 (array!78859 array!78861 (_ BitVec 32) (_ BitVec 32) V!46489 V!46489 (_ BitVec 32) Int) ListLongMap!18031)

(assert (=> b!1222002 (= lt!555642 (getCurrentListMapNoExtraKeys!5486 lt!555651 lt!555647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222002 (= lt!555641 (getCurrentListMapNoExtraKeys!5486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555643 () Unit!40420)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 (array!78859 array!78861 (_ BitVec 32) (_ BitVec 32) V!46489 V!46489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40420)

(assert (=> b!1222002 (= lt!555643 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1131 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222003 () Bool)

(declare-fun res!811405 () Bool)

(assert (=> b!1222003 (=> (not res!811405) (not e!694008))))

(assert (=> b!1222003 (= res!811405 (validKeyInArray!0 k0!934))))

(declare-fun b!1222004 () Bool)

(assert (=> b!1222004 (= e!694006 (or (bvsge (size!38590 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38590 _keys!1208))))))

(assert (=> b!1222004 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26862)))

(declare-fun lt!555640 () Unit!40420)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78859 (_ BitVec 32) (_ BitVec 32)) Unit!40420)

(assert (=> b!1222004 (= lt!555640 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222004 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555645 () Unit!40420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78859 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40420)

(assert (=> b!1222004 (= lt!555645 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1222005 () Bool)

(assert (=> b!1222005 (= e!693998 e!694002)))

(declare-fun res!811402 () Bool)

(assert (=> b!1222005 (=> res!811402 e!694002)))

(assert (=> b!1222005 (= res!811402 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1222005 (= lt!555648 (getCurrentListMapNoExtraKeys!5486 lt!555651 lt!555647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222005 (= lt!555647 (array!78862 (store (arr!38054 _values!996) i!673 (ValueCellFull!14801 lt!555649)) (size!38591 _values!996)))))

(declare-fun dynLambda!3387 (Int (_ BitVec 64)) V!46489)

(assert (=> b!1222005 (= lt!555649 (dynLambda!3387 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555650 () ListLongMap!18031)

(assert (=> b!1222005 (= lt!555650 (getCurrentListMapNoExtraKeys!5486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222006 () Bool)

(declare-fun res!811411 () Bool)

(assert (=> b!1222006 (=> (not res!811411) (not e!694008))))

(assert (=> b!1222006 (= res!811411 (and (= (size!38591 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38590 _keys!1208) (size!38591 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101766 res!811409) b!1221993))

(assert (= (and b!1221993 res!811412) b!1222006))

(assert (= (and b!1222006 res!811411) b!1221996))

(assert (= (and b!1221996 res!811408) b!1221989))

(assert (= (and b!1221989 res!811406) b!1221992))

(assert (= (and b!1221992 res!811404) b!1222003))

(assert (= (and b!1222003 res!811405) b!1222000))

(assert (= (and b!1222000 res!811403) b!1221994))

(assert (= (and b!1221994 res!811398) b!1221997))

(assert (= (and b!1221997 res!811397) b!1221998))

(assert (= (and b!1221998 (not res!811407)) b!1222005))

(assert (= (and b!1222005 (not res!811402)) b!1222002))

(assert (= (and b!1222002 (not res!811400)) b!1221988))

(assert (= (and b!1221988 res!811401) b!1221995))

(assert (= (and b!1221995 (not res!811399)) b!1222001))

(assert (= (and b!1221988 (not res!811410)) b!1222004))

(assert (= (and b!1221990 condMapEmpty!48421) mapIsEmpty!48421))

(assert (= (and b!1221990 (not condMapEmpty!48421)) mapNonEmpty!48421))

(get-info :version)

(assert (= (and mapNonEmpty!48421 ((_ is ValueCellFull!14801) mapValue!48421)) b!1221991))

(assert (= (and b!1221990 ((_ is ValueCellFull!14801) mapDefault!48421)) b!1221999))

(assert (= start!101766 b!1221990))

(declare-fun b_lambda!22177 () Bool)

(assert (=> (not b_lambda!22177) (not b!1222005)))

(declare-fun t!40152 () Bool)

(declare-fun tb!11109 () Bool)

(assert (=> (and start!101766 (= defaultEntry!1004 defaultEntry!1004) t!40152) tb!11109))

(declare-fun result!22833 () Bool)

(assert (=> tb!11109 (= result!22833 tp_is_empty!31021)))

(assert (=> b!1222005 t!40152))

(declare-fun b_and!43845 () Bool)

(assert (= b_and!43843 (and (=> t!40152 result!22833) b_and!43845)))

(declare-fun m!1127121 () Bool)

(assert (=> b!1222004 m!1127121))

(declare-fun m!1127123 () Bool)

(assert (=> b!1222004 m!1127123))

(declare-fun m!1127125 () Bool)

(assert (=> b!1222004 m!1127125))

(declare-fun m!1127127 () Bool)

(assert (=> b!1222004 m!1127127))

(declare-fun m!1127129 () Bool)

(assert (=> b!1221996 m!1127129))

(declare-fun m!1127131 () Bool)

(assert (=> b!1221998 m!1127131))

(declare-fun m!1127133 () Bool)

(assert (=> b!1221998 m!1127133))

(declare-fun m!1127135 () Bool)

(assert (=> b!1221989 m!1127135))

(declare-fun m!1127137 () Bool)

(assert (=> b!1222003 m!1127137))

(declare-fun m!1127139 () Bool)

(assert (=> start!101766 m!1127139))

(declare-fun m!1127141 () Bool)

(assert (=> start!101766 m!1127141))

(declare-fun m!1127143 () Bool)

(assert (=> b!1222000 m!1127143))

(declare-fun m!1127145 () Bool)

(assert (=> b!1222002 m!1127145))

(declare-fun m!1127147 () Bool)

(assert (=> b!1222002 m!1127147))

(declare-fun m!1127149 () Bool)

(assert (=> b!1222002 m!1127149))

(declare-fun m!1127151 () Bool)

(assert (=> b!1222002 m!1127151))

(declare-fun m!1127153 () Bool)

(assert (=> b!1222002 m!1127153))

(declare-fun m!1127155 () Bool)

(assert (=> b!1222002 m!1127155))

(assert (=> b!1222002 m!1127153))

(declare-fun m!1127157 () Bool)

(assert (=> b!1221994 m!1127157))

(declare-fun m!1127159 () Bool)

(assert (=> b!1221994 m!1127159))

(declare-fun m!1127161 () Bool)

(assert (=> b!1222001 m!1127161))

(assert (=> b!1221988 m!1127153))

(declare-fun m!1127163 () Bool)

(assert (=> b!1221988 m!1127163))

(assert (=> b!1221988 m!1127163))

(declare-fun m!1127165 () Bool)

(assert (=> b!1221988 m!1127165))

(declare-fun m!1127167 () Bool)

(assert (=> b!1221988 m!1127167))

(declare-fun m!1127169 () Bool)

(assert (=> b!1221997 m!1127169))

(assert (=> b!1221995 m!1127153))

(declare-fun m!1127171 () Bool)

(assert (=> b!1221993 m!1127171))

(declare-fun m!1127173 () Bool)

(assert (=> mapNonEmpty!48421 m!1127173))

(declare-fun m!1127175 () Bool)

(assert (=> b!1222005 m!1127175))

(declare-fun m!1127177 () Bool)

(assert (=> b!1222005 m!1127177))

(declare-fun m!1127179 () Bool)

(assert (=> b!1222005 m!1127179))

(declare-fun m!1127181 () Bool)

(assert (=> b!1222005 m!1127181))

(check-sat (not b!1221993) (not b!1221994) (not b!1221996) (not b_lambda!22177) (not b_next!26317) (not b!1221988) (not b!1222001) (not start!101766) (not mapNonEmpty!48421) (not b!1221998) (not b!1222004) tp_is_empty!31021 (not b!1222005) (not b!1222003) (not b!1221989) b_and!43845 (not b!1222002) (not b!1221997))
(check-sat b_and!43845 (not b_next!26317))
