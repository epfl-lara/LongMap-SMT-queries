; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101538 () Bool)

(assert start!101538)

(declare-fun b_free!26325 () Bool)

(declare-fun b_next!26325 () Bool)

(assert (=> start!101538 (= b_free!26325 (not b_next!26325))))

(declare-fun tp!92011 () Bool)

(declare-fun b_and!43857 () Bool)

(assert (=> start!101538 (= tp!92011 b_and!43857)))

(declare-fun b!1220937 () Bool)

(declare-fun res!811085 () Bool)

(declare-fun e!693314 () Bool)

(assert (=> b!1220937 (=> (not res!811085) (not e!693314))))

(declare-datatypes ((array!78837 0))(
  ( (array!78838 (arr!38048 (Array (_ BitVec 32) (_ BitVec 64))) (size!38584 (_ BitVec 32))) )
))
(declare-fun lt!555313 () array!78837)

(declare-datatypes ((List!26848 0))(
  ( (Nil!26845) (Cons!26844 (h!28053 (_ BitVec 64)) (t!40153 List!26848)) )
))
(declare-fun arrayNoDuplicates!0 (array!78837 (_ BitVec 32) List!26848) Bool)

(assert (=> b!1220937 (= res!811085 (arrayNoDuplicates!0 lt!555313 #b00000000000000000000000000000000 Nil!26845))))

(declare-fun b!1220938 () Bool)

(declare-fun e!693311 () Bool)

(declare-fun e!693316 () Bool)

(declare-fun mapRes!48433 () Bool)

(assert (=> b!1220938 (= e!693311 (and e!693316 mapRes!48433))))

(declare-fun condMapEmpty!48433 () Bool)

(declare-datatypes ((V!46499 0))(
  ( (V!46500 (val!15571 Int)) )
))
(declare-datatypes ((ValueCell!14805 0))(
  ( (ValueCellFull!14805 (v!18229 V!46499)) (EmptyCell!14805) )
))
(declare-datatypes ((array!78839 0))(
  ( (array!78840 (arr!38049 (Array (_ BitVec 32) ValueCell!14805)) (size!38585 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78839)

(declare-fun mapDefault!48433 () ValueCell!14805)

(assert (=> b!1220938 (= condMapEmpty!48433 (= (arr!38049 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14805)) mapDefault!48433)))))

(declare-fun b!1220939 () Bool)

(declare-fun res!811096 () Bool)

(declare-fun e!693322 () Bool)

(assert (=> b!1220939 (=> (not res!811096) (not e!693322))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220939 (= res!811096 (validKeyInArray!0 k0!934))))

(declare-fun b!1220940 () Bool)

(declare-fun res!811089 () Bool)

(assert (=> b!1220940 (=> (not res!811089) (not e!693322))))

(declare-fun _keys!1208 () array!78837)

(assert (=> b!1220940 (= res!811089 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26845))))

(declare-fun b!1220941 () Bool)

(declare-fun tp_is_empty!31029 () Bool)

(assert (=> b!1220941 (= e!693316 tp_is_empty!31029)))

(declare-fun res!811090 () Bool)

(assert (=> start!101538 (=> (not res!811090) (not e!693322))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101538 (= res!811090 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38584 _keys!1208))))))

(assert (=> start!101538 e!693322))

(assert (=> start!101538 tp_is_empty!31029))

(declare-fun array_inv!28950 (array!78837) Bool)

(assert (=> start!101538 (array_inv!28950 _keys!1208)))

(assert (=> start!101538 true))

(assert (=> start!101538 tp!92011))

(declare-fun array_inv!28951 (array!78839) Bool)

(assert (=> start!101538 (and (array_inv!28951 _values!996) e!693311)))

(declare-fun b!1220942 () Bool)

(declare-fun res!811093 () Bool)

(assert (=> b!1220942 (=> (not res!811093) (not e!693322))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220942 (= res!811093 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38584 _keys!1208))))))

(declare-fun b!1220943 () Bool)

(assert (=> b!1220943 (= e!693322 e!693314)))

(declare-fun res!811095 () Bool)

(assert (=> b!1220943 (=> (not res!811095) (not e!693314))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78837 (_ BitVec 32)) Bool)

(assert (=> b!1220943 (= res!811095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555313 mask!1564))))

(assert (=> b!1220943 (= lt!555313 (array!78838 (store (arr!38048 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38584 _keys!1208)))))

(declare-fun mapNonEmpty!48433 () Bool)

(declare-fun tp!92012 () Bool)

(declare-fun e!693312 () Bool)

(assert (=> mapNonEmpty!48433 (= mapRes!48433 (and tp!92012 e!693312))))

(declare-fun mapKey!48433 () (_ BitVec 32))

(declare-fun mapValue!48433 () ValueCell!14805)

(declare-fun mapRest!48433 () (Array (_ BitVec 32) ValueCell!14805))

(assert (=> mapNonEmpty!48433 (= (arr!38049 _values!996) (store mapRest!48433 mapKey!48433 mapValue!48433))))

(declare-fun e!693315 () Bool)

(declare-fun b!1220944 () Bool)

(declare-fun arrayContainsKey!0 (array!78837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220944 (= e!693315 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220945 () Bool)

(declare-fun e!693318 () Bool)

(assert (=> b!1220945 (= e!693318 e!693315)))

(declare-fun res!811086 () Bool)

(assert (=> b!1220945 (=> res!811086 e!693315)))

(assert (=> b!1220945 (= res!811086 (not (= (select (arr!38048 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220946 () Bool)

(declare-fun e!693317 () Bool)

(declare-fun e!693313 () Bool)

(assert (=> b!1220946 (= e!693317 e!693313)))

(declare-fun res!811091 () Bool)

(assert (=> b!1220946 (=> res!811091 e!693313)))

(assert (=> b!1220946 (= res!811091 (not (validKeyInArray!0 (select (arr!38048 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20048 0))(
  ( (tuple2!20049 (_1!10035 (_ BitVec 64)) (_2!10035 V!46499)) )
))
(declare-datatypes ((List!26849 0))(
  ( (Nil!26846) (Cons!26845 (h!28054 tuple2!20048) (t!40154 List!26849)) )
))
(declare-datatypes ((ListLongMap!18017 0))(
  ( (ListLongMap!18018 (toList!9024 List!26849)) )
))
(declare-fun lt!555315 () ListLongMap!18017)

(declare-fun lt!555311 () ListLongMap!18017)

(assert (=> b!1220946 (= lt!555315 lt!555311)))

(declare-fun lt!555309 () ListLongMap!18017)

(declare-fun -!1932 (ListLongMap!18017 (_ BitVec 64)) ListLongMap!18017)

(assert (=> b!1220946 (= lt!555311 (-!1932 lt!555309 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!555307 () array!78839)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46499)

(declare-fun zeroValue!944 () V!46499)

(declare-fun getCurrentListMapNoExtraKeys!5447 (array!78837 array!78839 (_ BitVec 32) (_ BitVec 32) V!46499 V!46499 (_ BitVec 32) Int) ListLongMap!18017)

(assert (=> b!1220946 (= lt!555315 (getCurrentListMapNoExtraKeys!5447 lt!555313 lt!555307 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220946 (= lt!555309 (getCurrentListMapNoExtraKeys!5447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40450 0))(
  ( (Unit!40451) )
))
(declare-fun lt!555306 () Unit!40450)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1139 (array!78837 array!78839 (_ BitVec 32) (_ BitVec 32) V!46499 V!46499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40450)

(assert (=> b!1220946 (= lt!555306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220947 () Bool)

(declare-fun e!693320 () Bool)

(assert (=> b!1220947 (= e!693320 e!693317)))

(declare-fun res!811087 () Bool)

(assert (=> b!1220947 (=> res!811087 e!693317)))

(assert (=> b!1220947 (= res!811087 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!555310 () ListLongMap!18017)

(assert (=> b!1220947 (= lt!555310 (getCurrentListMapNoExtraKeys!5447 lt!555313 lt!555307 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555308 () V!46499)

(assert (=> b!1220947 (= lt!555307 (array!78840 (store (arr!38049 _values!996) i!673 (ValueCellFull!14805 lt!555308)) (size!38585 _values!996)))))

(declare-fun dynLambda!3327 (Int (_ BitVec 64)) V!46499)

(assert (=> b!1220947 (= lt!555308 (dynLambda!3327 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555304 () ListLongMap!18017)

(assert (=> b!1220947 (= lt!555304 (getCurrentListMapNoExtraKeys!5447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220948 () Bool)

(declare-fun res!811084 () Bool)

(assert (=> b!1220948 (=> (not res!811084) (not e!693322))))

(assert (=> b!1220948 (= res!811084 (= (select (arr!38048 _keys!1208) i!673) k0!934))))

(declare-fun b!1220949 () Bool)

(declare-fun e!693321 () Bool)

(assert (=> b!1220949 (= e!693321 (or (bvsge (size!38584 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38584 _keys!1208)) (bvslt from!1455 (size!38584 _keys!1208))))))

(assert (=> b!1220949 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26845)))

(declare-fun lt!555312 () Unit!40450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78837 (_ BitVec 32) (_ BitVec 32)) Unit!40450)

(assert (=> b!1220949 (= lt!555312 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220949 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555314 () Unit!40450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78837 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40450)

(assert (=> b!1220949 (= lt!555314 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220950 () Bool)

(declare-fun res!811098 () Bool)

(assert (=> b!1220950 (=> (not res!811098) (not e!693322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220950 (= res!811098 (validMask!0 mask!1564))))

(declare-fun b!1220951 () Bool)

(assert (=> b!1220951 (= e!693312 tp_is_empty!31029)))

(declare-fun b!1220952 () Bool)

(assert (=> b!1220952 (= e!693314 (not e!693320))))

(declare-fun res!811083 () Bool)

(assert (=> b!1220952 (=> res!811083 e!693320)))

(assert (=> b!1220952 (= res!811083 (bvsgt from!1455 i!673))))

(assert (=> b!1220952 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!555305 () Unit!40450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78837 (_ BitVec 64) (_ BitVec 32)) Unit!40450)

(assert (=> b!1220952 (= lt!555305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220953 () Bool)

(declare-fun res!811097 () Bool)

(assert (=> b!1220953 (=> (not res!811097) (not e!693322))))

(assert (=> b!1220953 (= res!811097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220954 () Bool)

(declare-fun res!811094 () Bool)

(assert (=> b!1220954 (=> (not res!811094) (not e!693322))))

(assert (=> b!1220954 (= res!811094 (and (= (size!38585 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38584 _keys!1208) (size!38585 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48433 () Bool)

(assert (=> mapIsEmpty!48433 mapRes!48433))

(declare-fun b!1220955 () Bool)

(assert (=> b!1220955 (= e!693313 e!693321)))

(declare-fun res!811092 () Bool)

(assert (=> b!1220955 (=> res!811092 e!693321)))

(assert (=> b!1220955 (= res!811092 (not (= (select (arr!38048 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220955 e!693318))

(declare-fun res!811088 () Bool)

(assert (=> b!1220955 (=> (not res!811088) (not e!693318))))

(declare-fun +!4089 (ListLongMap!18017 tuple2!20048) ListLongMap!18017)

(declare-fun get!19414 (ValueCell!14805 V!46499) V!46499)

(assert (=> b!1220955 (= res!811088 (= lt!555310 (+!4089 lt!555311 (tuple2!20049 (select (arr!38048 _keys!1208) from!1455) (get!19414 (select (arr!38049 _values!996) from!1455) lt!555308)))))))

(assert (= (and start!101538 res!811090) b!1220950))

(assert (= (and b!1220950 res!811098) b!1220954))

(assert (= (and b!1220954 res!811094) b!1220953))

(assert (= (and b!1220953 res!811097) b!1220940))

(assert (= (and b!1220940 res!811089) b!1220942))

(assert (= (and b!1220942 res!811093) b!1220939))

(assert (= (and b!1220939 res!811096) b!1220948))

(assert (= (and b!1220948 res!811084) b!1220943))

(assert (= (and b!1220943 res!811095) b!1220937))

(assert (= (and b!1220937 res!811085) b!1220952))

(assert (= (and b!1220952 (not res!811083)) b!1220947))

(assert (= (and b!1220947 (not res!811087)) b!1220946))

(assert (= (and b!1220946 (not res!811091)) b!1220955))

(assert (= (and b!1220955 res!811088) b!1220945))

(assert (= (and b!1220945 (not res!811086)) b!1220944))

(assert (= (and b!1220955 (not res!811092)) b!1220949))

(assert (= (and b!1220938 condMapEmpty!48433) mapIsEmpty!48433))

(assert (= (and b!1220938 (not condMapEmpty!48433)) mapNonEmpty!48433))

(get-info :version)

(assert (= (and mapNonEmpty!48433 ((_ is ValueCellFull!14805) mapValue!48433)) b!1220951))

(assert (= (and b!1220938 ((_ is ValueCellFull!14805) mapDefault!48433)) b!1220941))

(assert (= start!101538 b!1220938))

(declare-fun b_lambda!22191 () Bool)

(assert (=> (not b_lambda!22191) (not b!1220947)))

(declare-fun t!40152 () Bool)

(declare-fun tb!11125 () Bool)

(assert (=> (and start!101538 (= defaultEntry!1004 defaultEntry!1004) t!40152) tb!11125))

(declare-fun result!22857 () Bool)

(assert (=> tb!11125 (= result!22857 tp_is_empty!31029)))

(assert (=> b!1220947 t!40152))

(declare-fun b_and!43859 () Bool)

(assert (= b_and!43857 (and (=> t!40152 result!22857) b_and!43859)))

(declare-fun m!1125779 () Bool)

(assert (=> b!1220950 m!1125779))

(declare-fun m!1125781 () Bool)

(assert (=> b!1220939 m!1125781))

(declare-fun m!1125783 () Bool)

(assert (=> b!1220945 m!1125783))

(declare-fun m!1125785 () Bool)

(assert (=> b!1220944 m!1125785))

(declare-fun m!1125787 () Bool)

(assert (=> mapNonEmpty!48433 m!1125787))

(declare-fun m!1125789 () Bool)

(assert (=> b!1220953 m!1125789))

(declare-fun m!1125791 () Bool)

(assert (=> b!1220943 m!1125791))

(declare-fun m!1125793 () Bool)

(assert (=> b!1220943 m!1125793))

(declare-fun m!1125795 () Bool)

(assert (=> start!101538 m!1125795))

(declare-fun m!1125797 () Bool)

(assert (=> start!101538 m!1125797))

(declare-fun m!1125799 () Bool)

(assert (=> b!1220948 m!1125799))

(declare-fun m!1125801 () Bool)

(assert (=> b!1220937 m!1125801))

(declare-fun m!1125803 () Bool)

(assert (=> b!1220946 m!1125803))

(declare-fun m!1125805 () Bool)

(assert (=> b!1220946 m!1125805))

(declare-fun m!1125807 () Bool)

(assert (=> b!1220946 m!1125807))

(assert (=> b!1220946 m!1125783))

(declare-fun m!1125809 () Bool)

(assert (=> b!1220946 m!1125809))

(declare-fun m!1125811 () Bool)

(assert (=> b!1220946 m!1125811))

(assert (=> b!1220946 m!1125783))

(declare-fun m!1125813 () Bool)

(assert (=> b!1220949 m!1125813))

(declare-fun m!1125815 () Bool)

(assert (=> b!1220949 m!1125815))

(declare-fun m!1125817 () Bool)

(assert (=> b!1220949 m!1125817))

(declare-fun m!1125819 () Bool)

(assert (=> b!1220949 m!1125819))

(declare-fun m!1125821 () Bool)

(assert (=> b!1220947 m!1125821))

(declare-fun m!1125823 () Bool)

(assert (=> b!1220947 m!1125823))

(declare-fun m!1125825 () Bool)

(assert (=> b!1220947 m!1125825))

(declare-fun m!1125827 () Bool)

(assert (=> b!1220947 m!1125827))

(declare-fun m!1125829 () Bool)

(assert (=> b!1220952 m!1125829))

(declare-fun m!1125831 () Bool)

(assert (=> b!1220952 m!1125831))

(assert (=> b!1220955 m!1125783))

(declare-fun m!1125833 () Bool)

(assert (=> b!1220955 m!1125833))

(assert (=> b!1220955 m!1125833))

(declare-fun m!1125835 () Bool)

(assert (=> b!1220955 m!1125835))

(declare-fun m!1125837 () Bool)

(assert (=> b!1220955 m!1125837))

(declare-fun m!1125839 () Bool)

(assert (=> b!1220940 m!1125839))

(check-sat (not b!1220944) (not b!1220939) (not b!1220955) (not b!1220946) b_and!43859 (not b_next!26325) (not b!1220950) (not b!1220947) (not b!1220943) (not b!1220949) tp_is_empty!31029 (not b!1220937) (not b!1220953) (not mapNonEmpty!48433) (not b!1220952) (not b_lambda!22191) (not start!101538) (not b!1220940))
(check-sat b_and!43859 (not b_next!26325))
