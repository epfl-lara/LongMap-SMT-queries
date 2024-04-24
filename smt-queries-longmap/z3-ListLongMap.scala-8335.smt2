; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101700 () Bool)

(assert start!101700)

(declare-fun b_free!26281 () Bool)

(declare-fun b_next!26281 () Bool)

(assert (=> start!101700 (= b_free!26281 (not b_next!26281))))

(declare-fun tp!91877 () Bool)

(declare-fun b_and!43753 () Bool)

(assert (=> start!101700 (= tp!91877 b_and!43753)))

(declare-fun b!1220774 () Bool)

(declare-fun e!693259 () Bool)

(declare-datatypes ((array!78787 0))(
  ( (array!78788 (arr!38018 (Array (_ BitVec 32) (_ BitVec 64))) (size!38555 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78787)

(assert (=> b!1220774 (= e!693259 (or (bvsge (size!38555 _keys!1208) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!38555 _keys!1208))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220774 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!40386 0))(
  ( (Unit!40387) )
))
(declare-fun lt!554941 () Unit!40386)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78787 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40386)

(assert (=> b!1220774 (= lt!554941 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!48364 () Bool)

(declare-fun mapRes!48364 () Bool)

(declare-fun tp!91876 () Bool)

(declare-fun e!693249 () Bool)

(assert (=> mapNonEmpty!48364 (= mapRes!48364 (and tp!91876 e!693249))))

(declare-datatypes ((V!46441 0))(
  ( (V!46442 (val!15549 Int)) )
))
(declare-datatypes ((ValueCell!14783 0))(
  ( (ValueCellFull!14783 (v!18202 V!46441)) (EmptyCell!14783) )
))
(declare-fun mapValue!48364 () ValueCell!14783)

(declare-fun mapRest!48364 () (Array (_ BitVec 32) ValueCell!14783))

(declare-fun mapKey!48364 () (_ BitVec 32))

(declare-datatypes ((array!78789 0))(
  ( (array!78790 (arr!38019 (Array (_ BitVec 32) ValueCell!14783)) (size!38556 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78789)

(assert (=> mapNonEmpty!48364 (= (arr!38019 _values!996) (store mapRest!48364 mapKey!48364 mapValue!48364))))

(declare-fun b!1220775 () Bool)

(declare-fun e!693252 () Bool)

(declare-fun tp_is_empty!30985 () Bool)

(assert (=> b!1220775 (= e!693252 tp_is_empty!30985)))

(declare-fun e!693258 () Bool)

(declare-fun b!1220776 () Bool)

(assert (=> b!1220776 (= e!693258 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!810480 () Bool)

(declare-fun e!693254 () Bool)

(assert (=> start!101700 (=> (not res!810480) (not e!693254))))

(assert (=> start!101700 (= res!810480 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38555 _keys!1208))))))

(assert (=> start!101700 e!693254))

(assert (=> start!101700 tp_is_empty!30985))

(declare-fun array_inv!29006 (array!78787) Bool)

(assert (=> start!101700 (array_inv!29006 _keys!1208)))

(assert (=> start!101700 true))

(assert (=> start!101700 tp!91877))

(declare-fun e!693248 () Bool)

(declare-fun array_inv!29007 (array!78789) Bool)

(assert (=> start!101700 (and (array_inv!29007 _values!996) e!693248)))

(declare-fun b!1220777 () Bool)

(declare-fun res!810478 () Bool)

(assert (=> b!1220777 (=> (not res!810478) (not e!693254))))

(declare-datatypes ((List!26830 0))(
  ( (Nil!26827) (Cons!26826 (h!28044 (_ BitVec 64)) (t!40083 List!26830)) )
))
(declare-fun arrayNoDuplicates!0 (array!78787 (_ BitVec 32) List!26830) Bool)

(assert (=> b!1220777 (= res!810478 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26827))))

(declare-fun b!1220778 () Bool)

(declare-fun res!810471 () Bool)

(assert (=> b!1220778 (=> (not res!810471) (not e!693254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220778 (= res!810471 (validKeyInArray!0 k0!934))))

(declare-fun b!1220779 () Bool)

(declare-fun res!810474 () Bool)

(declare-fun e!693251 () Bool)

(assert (=> b!1220779 (=> (not res!810474) (not e!693251))))

(declare-fun lt!554945 () array!78787)

(assert (=> b!1220779 (= res!810474 (arrayNoDuplicates!0 lt!554945 #b00000000000000000000000000000000 Nil!26827))))

(declare-fun b!1220780 () Bool)

(declare-fun e!693257 () Bool)

(assert (=> b!1220780 (= e!693251 (not e!693257))))

(declare-fun res!810472 () Bool)

(assert (=> b!1220780 (=> res!810472 e!693257)))

(assert (=> b!1220780 (= res!810472 (bvsgt from!1455 i!673))))

(assert (=> b!1220780 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554939 () Unit!40386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78787 (_ BitVec 64) (_ BitVec 32)) Unit!40386)

(assert (=> b!1220780 (= lt!554939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220781 () Bool)

(assert (=> b!1220781 (= e!693249 tp_is_empty!30985)))

(declare-fun mapIsEmpty!48364 () Bool)

(assert (=> mapIsEmpty!48364 mapRes!48364))

(declare-fun b!1220782 () Bool)

(assert (=> b!1220782 (= e!693254 e!693251)))

(declare-fun res!810469 () Bool)

(assert (=> b!1220782 (=> (not res!810469) (not e!693251))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78787 (_ BitVec 32)) Bool)

(assert (=> b!1220782 (= res!810469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554945 mask!1564))))

(assert (=> b!1220782 (= lt!554945 (array!78788 (store (arr!38018 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38555 _keys!1208)))))

(declare-fun b!1220783 () Bool)

(declare-fun res!810477 () Bool)

(assert (=> b!1220783 (=> (not res!810477) (not e!693254))))

(assert (=> b!1220783 (= res!810477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220784 () Bool)

(declare-fun e!693255 () Bool)

(assert (=> b!1220784 (= e!693257 e!693255)))

(declare-fun res!810470 () Bool)

(assert (=> b!1220784 (=> res!810470 e!693255)))

(assert (=> b!1220784 (= res!810470 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46441)

(declare-fun lt!554942 () array!78789)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46441)

(declare-datatypes ((tuple2!20020 0))(
  ( (tuple2!20021 (_1!10021 (_ BitVec 64)) (_2!10021 V!46441)) )
))
(declare-datatypes ((List!26831 0))(
  ( (Nil!26828) (Cons!26827 (h!28045 tuple2!20020) (t!40084 List!26831)) )
))
(declare-datatypes ((ListLongMap!17997 0))(
  ( (ListLongMap!17998 (toList!9014 List!26831)) )
))
(declare-fun lt!554936 () ListLongMap!17997)

(declare-fun getCurrentListMapNoExtraKeys!5469 (array!78787 array!78789 (_ BitVec 32) (_ BitVec 32) V!46441 V!46441 (_ BitVec 32) Int) ListLongMap!17997)

(assert (=> b!1220784 (= lt!554936 (getCurrentListMapNoExtraKeys!5469 lt!554945 lt!554942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554940 () V!46441)

(assert (=> b!1220784 (= lt!554942 (array!78790 (store (arr!38019 _values!996) i!673 (ValueCellFull!14783 lt!554940)) (size!38556 _values!996)))))

(declare-fun dynLambda!3371 (Int (_ BitVec 64)) V!46441)

(assert (=> b!1220784 (= lt!554940 (dynLambda!3371 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554938 () ListLongMap!17997)

(assert (=> b!1220784 (= lt!554938 (getCurrentListMapNoExtraKeys!5469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220785 () Bool)

(declare-fun e!693253 () Bool)

(assert (=> b!1220785 (= e!693253 e!693259)))

(declare-fun res!810473 () Bool)

(assert (=> b!1220785 (=> res!810473 e!693259)))

(assert (=> b!1220785 (= res!810473 (not (= (select (arr!38018 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693250 () Bool)

(assert (=> b!1220785 e!693250))

(declare-fun res!810468 () Bool)

(assert (=> b!1220785 (=> (not res!810468) (not e!693250))))

(declare-fun lt!554946 () ListLongMap!17997)

(declare-fun +!4124 (ListLongMap!17997 tuple2!20020) ListLongMap!17997)

(declare-fun get!19430 (ValueCell!14783 V!46441) V!46441)

(assert (=> b!1220785 (= res!810468 (= lt!554936 (+!4124 lt!554946 (tuple2!20021 (select (arr!38018 _keys!1208) from!1455) (get!19430 (select (arr!38019 _values!996) from!1455) lt!554940)))))))

(declare-fun b!1220786 () Bool)

(assert (=> b!1220786 (= e!693255 e!693253)))

(declare-fun res!810479 () Bool)

(assert (=> b!1220786 (=> res!810479 e!693253)))

(assert (=> b!1220786 (= res!810479 (not (validKeyInArray!0 (select (arr!38018 _keys!1208) from!1455))))))

(declare-fun lt!554944 () ListLongMap!17997)

(assert (=> b!1220786 (= lt!554944 lt!554946)))

(declare-fun lt!554937 () ListLongMap!17997)

(declare-fun -!1900 (ListLongMap!17997 (_ BitVec 64)) ListLongMap!17997)

(assert (=> b!1220786 (= lt!554946 (-!1900 lt!554937 k0!934))))

(assert (=> b!1220786 (= lt!554944 (getCurrentListMapNoExtraKeys!5469 lt!554945 lt!554942 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220786 (= lt!554937 (getCurrentListMapNoExtraKeys!5469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554943 () Unit!40386)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1115 (array!78787 array!78789 (_ BitVec 32) (_ BitVec 32) V!46441 V!46441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40386)

(assert (=> b!1220786 (= lt!554943 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1115 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220787 () Bool)

(declare-fun res!810476 () Bool)

(assert (=> b!1220787 (=> (not res!810476) (not e!693254))))

(assert (=> b!1220787 (= res!810476 (= (select (arr!38018 _keys!1208) i!673) k0!934))))

(declare-fun b!1220788 () Bool)

(declare-fun res!810467 () Bool)

(assert (=> b!1220788 (=> (not res!810467) (not e!693254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220788 (= res!810467 (validMask!0 mask!1564))))

(declare-fun b!1220789 () Bool)

(declare-fun res!810482 () Bool)

(assert (=> b!1220789 (=> (not res!810482) (not e!693254))))

(assert (=> b!1220789 (= res!810482 (and (= (size!38556 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38555 _keys!1208) (size!38556 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220790 () Bool)

(assert (=> b!1220790 (= e!693248 (and e!693252 mapRes!48364))))

(declare-fun condMapEmpty!48364 () Bool)

(declare-fun mapDefault!48364 () ValueCell!14783)

(assert (=> b!1220790 (= condMapEmpty!48364 (= (arr!38019 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14783)) mapDefault!48364)))))

(declare-fun b!1220791 () Bool)

(declare-fun res!810481 () Bool)

(assert (=> b!1220791 (=> (not res!810481) (not e!693254))))

(assert (=> b!1220791 (= res!810481 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38555 _keys!1208))))))

(declare-fun b!1220792 () Bool)

(assert (=> b!1220792 (= e!693250 e!693258)))

(declare-fun res!810475 () Bool)

(assert (=> b!1220792 (=> res!810475 e!693258)))

(assert (=> b!1220792 (= res!810475 (not (= (select (arr!38018 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!101700 res!810480) b!1220788))

(assert (= (and b!1220788 res!810467) b!1220789))

(assert (= (and b!1220789 res!810482) b!1220783))

(assert (= (and b!1220783 res!810477) b!1220777))

(assert (= (and b!1220777 res!810478) b!1220791))

(assert (= (and b!1220791 res!810481) b!1220778))

(assert (= (and b!1220778 res!810471) b!1220787))

(assert (= (and b!1220787 res!810476) b!1220782))

(assert (= (and b!1220782 res!810469) b!1220779))

(assert (= (and b!1220779 res!810474) b!1220780))

(assert (= (and b!1220780 (not res!810472)) b!1220784))

(assert (= (and b!1220784 (not res!810470)) b!1220786))

(assert (= (and b!1220786 (not res!810479)) b!1220785))

(assert (= (and b!1220785 res!810468) b!1220792))

(assert (= (and b!1220792 (not res!810475)) b!1220776))

(assert (= (and b!1220785 (not res!810473)) b!1220774))

(assert (= (and b!1220790 condMapEmpty!48364) mapIsEmpty!48364))

(assert (= (and b!1220790 (not condMapEmpty!48364)) mapNonEmpty!48364))

(get-info :version)

(assert (= (and mapNonEmpty!48364 ((_ is ValueCellFull!14783) mapValue!48364)) b!1220781))

(assert (= (and b!1220790 ((_ is ValueCellFull!14783) mapDefault!48364)) b!1220775))

(assert (= start!101700 b!1220790))

(declare-fun b_lambda!22103 () Bool)

(assert (=> (not b_lambda!22103) (not b!1220784)))

(declare-fun t!40082 () Bool)

(declare-fun tb!11073 () Bool)

(assert (=> (and start!101700 (= defaultEntry!1004 defaultEntry!1004) t!40082) tb!11073))

(declare-fun result!22759 () Bool)

(assert (=> tb!11073 (= result!22759 tp_is_empty!30985)))

(assert (=> b!1220784 t!40082))

(declare-fun b_and!43755 () Bool)

(assert (= b_and!43753 (and (=> t!40082 result!22759) b_and!43755)))

(declare-fun m!1125857 () Bool)

(assert (=> b!1220774 m!1125857))

(declare-fun m!1125859 () Bool)

(assert (=> b!1220774 m!1125859))

(declare-fun m!1125861 () Bool)

(assert (=> b!1220780 m!1125861))

(declare-fun m!1125863 () Bool)

(assert (=> b!1220780 m!1125863))

(declare-fun m!1125865 () Bool)

(assert (=> b!1220785 m!1125865))

(declare-fun m!1125867 () Bool)

(assert (=> b!1220785 m!1125867))

(assert (=> b!1220785 m!1125867))

(declare-fun m!1125869 () Bool)

(assert (=> b!1220785 m!1125869))

(declare-fun m!1125871 () Bool)

(assert (=> b!1220785 m!1125871))

(assert (=> b!1220792 m!1125865))

(declare-fun m!1125873 () Bool)

(assert (=> b!1220787 m!1125873))

(declare-fun m!1125875 () Bool)

(assert (=> b!1220776 m!1125875))

(declare-fun m!1125877 () Bool)

(assert (=> b!1220782 m!1125877))

(declare-fun m!1125879 () Bool)

(assert (=> b!1220782 m!1125879))

(declare-fun m!1125881 () Bool)

(assert (=> mapNonEmpty!48364 m!1125881))

(declare-fun m!1125883 () Bool)

(assert (=> b!1220788 m!1125883))

(declare-fun m!1125885 () Bool)

(assert (=> b!1220786 m!1125885))

(declare-fun m!1125887 () Bool)

(assert (=> b!1220786 m!1125887))

(assert (=> b!1220786 m!1125865))

(declare-fun m!1125889 () Bool)

(assert (=> b!1220786 m!1125889))

(declare-fun m!1125891 () Bool)

(assert (=> b!1220786 m!1125891))

(assert (=> b!1220786 m!1125865))

(declare-fun m!1125893 () Bool)

(assert (=> b!1220786 m!1125893))

(declare-fun m!1125895 () Bool)

(assert (=> b!1220778 m!1125895))

(declare-fun m!1125897 () Bool)

(assert (=> b!1220784 m!1125897))

(declare-fun m!1125899 () Bool)

(assert (=> b!1220784 m!1125899))

(declare-fun m!1125901 () Bool)

(assert (=> b!1220784 m!1125901))

(declare-fun m!1125903 () Bool)

(assert (=> b!1220784 m!1125903))

(declare-fun m!1125905 () Bool)

(assert (=> b!1220777 m!1125905))

(declare-fun m!1125907 () Bool)

(assert (=> b!1220779 m!1125907))

(declare-fun m!1125909 () Bool)

(assert (=> b!1220783 m!1125909))

(declare-fun m!1125911 () Bool)

(assert (=> start!101700 m!1125911))

(declare-fun m!1125913 () Bool)

(assert (=> start!101700 m!1125913))

(check-sat (not b!1220780) (not b_lambda!22103) (not b!1220788) (not b!1220783) (not b!1220785) (not b!1220776) b_and!43755 (not b!1220779) (not b!1220777) (not mapNonEmpty!48364) (not b!1220786) (not b!1220774) tp_is_empty!30985 (not b!1220782) (not b!1220784) (not b_next!26281) (not b!1220778) (not start!101700))
(check-sat b_and!43755 (not b_next!26281))
