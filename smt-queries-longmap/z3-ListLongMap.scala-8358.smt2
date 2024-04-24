; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101966 () Bool)

(assert start!101966)

(declare-fun b_free!26419 () Bool)

(declare-fun b_next!26419 () Bool)

(assert (=> start!101966 (= b_free!26419 (not b_next!26419))))

(declare-fun tp!92302 () Bool)

(declare-fun b_and!44101 () Bool)

(assert (=> start!101966 (= tp!92302 b_and!44101)))

(declare-fun b!1225724 () Bool)

(declare-fun e!696262 () Bool)

(declare-fun e!696265 () Bool)

(assert (=> b!1225724 (= e!696262 e!696265)))

(declare-fun res!814145 () Bool)

(assert (=> b!1225724 (=> res!814145 e!696265)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225724 (= res!814145 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46625 0))(
  ( (V!46626 (val!15618 Int)) )
))
(declare-fun zeroValue!944 () V!46625)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14852 0))(
  ( (ValueCellFull!14852 (v!18276 V!46625)) (EmptyCell!14852) )
))
(declare-datatypes ((array!79067 0))(
  ( (array!79068 (arr!38154 (Array (_ BitVec 32) ValueCell!14852)) (size!38691 (_ BitVec 32))) )
))
(declare-fun lt!557997 () array!79067)

(declare-fun minValue!944 () V!46625)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!20138 0))(
  ( (tuple2!20139 (_1!10080 (_ BitVec 64)) (_2!10080 V!46625)) )
))
(declare-datatypes ((List!26952 0))(
  ( (Nil!26949) (Cons!26948 (h!28166 tuple2!20138) (t!40343 List!26952)) )
))
(declare-datatypes ((ListLongMap!18115 0))(
  ( (ListLongMap!18116 (toList!9073 List!26952)) )
))
(declare-fun lt!557999 () ListLongMap!18115)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!79069 0))(
  ( (array!79070 (arr!38155 (Array (_ BitVec 32) (_ BitVec 64))) (size!38692 (_ BitVec 32))) )
))
(declare-fun lt!558008 () array!79069)

(declare-fun getCurrentListMapNoExtraKeys!5521 (array!79069 array!79067 (_ BitVec 32) (_ BitVec 32) V!46625 V!46625 (_ BitVec 32) Int) ListLongMap!18115)

(assert (=> b!1225724 (= lt!557999 (getCurrentListMapNoExtraKeys!5521 lt!558008 lt!557997 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558001 () V!46625)

(declare-fun _values!996 () array!79067)

(assert (=> b!1225724 (= lt!557997 (array!79068 (store (arr!38154 _values!996) i!673 (ValueCellFull!14852 lt!558001)) (size!38691 _values!996)))))

(declare-fun dynLambda!3420 (Int (_ BitVec 64)) V!46625)

(assert (=> b!1225724 (= lt!558001 (dynLambda!3420 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!79069)

(declare-fun lt!558006 () ListLongMap!18115)

(assert (=> b!1225724 (= lt!558006 (getCurrentListMapNoExtraKeys!5521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225725 () Bool)

(declare-fun res!814143 () Bool)

(declare-fun e!696256 () Bool)

(assert (=> b!1225725 (=> (not res!814143) (not e!696256))))

(assert (=> b!1225725 (= res!814143 (and (= (size!38691 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38692 _keys!1208) (size!38691 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225726 () Bool)

(declare-fun res!814144 () Bool)

(declare-fun e!696261 () Bool)

(assert (=> b!1225726 (=> (not res!814144) (not e!696261))))

(declare-fun lt!558011 () tuple2!20138)

(declare-fun lt!558003 () ListLongMap!18115)

(declare-fun +!4174 (ListLongMap!18115 tuple2!20138) ListLongMap!18115)

(assert (=> b!1225726 (= res!814144 (= lt!558006 (+!4174 lt!558003 lt!558011)))))

(declare-fun mapNonEmpty!48583 () Bool)

(declare-fun mapRes!48583 () Bool)

(declare-fun tp!92303 () Bool)

(declare-fun e!696259 () Bool)

(assert (=> mapNonEmpty!48583 (= mapRes!48583 (and tp!92303 e!696259))))

(declare-fun mapRest!48583 () (Array (_ BitVec 32) ValueCell!14852))

(declare-fun mapValue!48583 () ValueCell!14852)

(declare-fun mapKey!48583 () (_ BitVec 32))

(assert (=> mapNonEmpty!48583 (= (arr!38154 _values!996) (store mapRest!48583 mapKey!48583 mapValue!48583))))

(declare-fun res!814141 () Bool)

(assert (=> start!101966 (=> (not res!814141) (not e!696256))))

(assert (=> start!101966 (= res!814141 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38692 _keys!1208))))))

(assert (=> start!101966 e!696256))

(declare-fun tp_is_empty!31123 () Bool)

(assert (=> start!101966 tp_is_empty!31123))

(declare-fun array_inv!29106 (array!79069) Bool)

(assert (=> start!101966 (array_inv!29106 _keys!1208)))

(assert (=> start!101966 true))

(assert (=> start!101966 tp!92302))

(declare-fun e!696263 () Bool)

(declare-fun array_inv!29107 (array!79067) Bool)

(assert (=> start!101966 (and (array_inv!29107 _values!996) e!696263)))

(declare-fun b!1225727 () Bool)

(declare-fun e!696254 () Bool)

(assert (=> b!1225727 (= e!696254 true)))

(assert (=> b!1225727 e!696261))

(declare-fun res!814138 () Bool)

(assert (=> b!1225727 (=> (not res!814138) (not e!696261))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1225727 (= res!814138 (not (= (select (arr!38155 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!40536 0))(
  ( (Unit!40537) )
))
(declare-fun lt!558004 () Unit!40536)

(declare-fun e!696253 () Unit!40536)

(assert (=> b!1225727 (= lt!558004 e!696253)))

(declare-fun c!120847 () Bool)

(assert (=> b!1225727 (= c!120847 (= (select (arr!38155 _keys!1208) from!1455) k0!934))))

(declare-fun e!696257 () Bool)

(assert (=> b!1225727 e!696257))

(declare-fun res!814146 () Bool)

(assert (=> b!1225727 (=> (not res!814146) (not e!696257))))

(declare-fun lt!558000 () ListLongMap!18115)

(assert (=> b!1225727 (= res!814146 (= lt!557999 (+!4174 lt!558000 lt!558011)))))

(declare-fun get!19528 (ValueCell!14852 V!46625) V!46625)

(assert (=> b!1225727 (= lt!558011 (tuple2!20139 (select (arr!38155 _keys!1208) from!1455) (get!19528 (select (arr!38154 _values!996) from!1455) lt!558001)))))

(declare-fun b!1225728 () Bool)

(declare-fun res!814140 () Bool)

(assert (=> b!1225728 (=> (not res!814140) (not e!696256))))

(assert (=> b!1225728 (= res!814140 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38692 _keys!1208))))))

(declare-fun mapIsEmpty!48583 () Bool)

(assert (=> mapIsEmpty!48583 mapRes!48583))

(declare-fun b!1225729 () Bool)

(declare-fun e!696260 () Bool)

(assert (=> b!1225729 (= e!696260 (not e!696262))))

(declare-fun res!814134 () Bool)

(assert (=> b!1225729 (=> res!814134 e!696262)))

(assert (=> b!1225729 (= res!814134 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225729 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558002 () Unit!40536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79069 (_ BitVec 64) (_ BitVec 32)) Unit!40536)

(assert (=> b!1225729 (= lt!558002 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225730 () Bool)

(declare-fun Unit!40538 () Unit!40536)

(assert (=> b!1225730 (= e!696253 Unit!40538)))

(declare-fun lt!558009 () Unit!40536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79069 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40536)

(assert (=> b!1225730 (= lt!558009 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225730 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558007 () Unit!40536)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79069 (_ BitVec 32) (_ BitVec 32)) Unit!40536)

(assert (=> b!1225730 (= lt!558007 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26953 0))(
  ( (Nil!26950) (Cons!26949 (h!28167 (_ BitVec 64)) (t!40344 List!26953)) )
))
(declare-fun arrayNoDuplicates!0 (array!79069 (_ BitVec 32) List!26953) Bool)

(assert (=> b!1225730 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26950)))

(declare-fun lt!557998 () Unit!40536)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79069 (_ BitVec 64) (_ BitVec 32) List!26953) Unit!40536)

(assert (=> b!1225730 (= lt!557998 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26950))))

(assert (=> b!1225730 false))

(declare-fun b!1225731 () Bool)

(declare-fun res!814139 () Bool)

(assert (=> b!1225731 (=> (not res!814139) (not e!696256))))

(assert (=> b!1225731 (= res!814139 (= (select (arr!38155 _keys!1208) i!673) k0!934))))

(declare-fun b!1225732 () Bool)

(assert (=> b!1225732 (= e!696265 e!696254)))

(declare-fun res!814130 () Bool)

(assert (=> b!1225732 (=> res!814130 e!696254)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225732 (= res!814130 (not (validKeyInArray!0 (select (arr!38155 _keys!1208) from!1455))))))

(declare-fun lt!558010 () ListLongMap!18115)

(assert (=> b!1225732 (= lt!558010 lt!558000)))

(declare-fun -!1945 (ListLongMap!18115 (_ BitVec 64)) ListLongMap!18115)

(assert (=> b!1225732 (= lt!558000 (-!1945 lt!558003 k0!934))))

(assert (=> b!1225732 (= lt!558010 (getCurrentListMapNoExtraKeys!5521 lt!558008 lt!557997 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225732 (= lt!558003 (getCurrentListMapNoExtraKeys!5521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558005 () Unit!40536)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1160 (array!79069 array!79067 (_ BitVec 32) (_ BitVec 32) V!46625 V!46625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40536)

(assert (=> b!1225732 (= lt!558005 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225733 () Bool)

(declare-fun res!814135 () Bool)

(assert (=> b!1225733 (=> (not res!814135) (not e!696260))))

(assert (=> b!1225733 (= res!814135 (arrayNoDuplicates!0 lt!558008 #b00000000000000000000000000000000 Nil!26950))))

(declare-fun b!1225734 () Bool)

(declare-fun e!696255 () Bool)

(assert (=> b!1225734 (= e!696255 tp_is_empty!31123)))

(declare-fun b!1225735 () Bool)

(declare-fun res!814136 () Bool)

(assert (=> b!1225735 (=> (not res!814136) (not e!696256))))

(assert (=> b!1225735 (= res!814136 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26950))))

(declare-fun b!1225736 () Bool)

(declare-fun e!696264 () Bool)

(assert (=> b!1225736 (= e!696257 e!696264)))

(declare-fun res!814137 () Bool)

(assert (=> b!1225736 (=> res!814137 e!696264)))

(assert (=> b!1225736 (= res!814137 (not (= (select (arr!38155 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1225737 () Bool)

(declare-fun res!814142 () Bool)

(assert (=> b!1225737 (=> (not res!814142) (not e!696256))))

(assert (=> b!1225737 (= res!814142 (validKeyInArray!0 k0!934))))

(declare-fun b!1225738 () Bool)

(assert (=> b!1225738 (= e!696259 tp_is_empty!31123)))

(declare-fun b!1225739 () Bool)

(assert (=> b!1225739 (= e!696261 (= lt!558000 lt!558010))))

(declare-fun b!1225740 () Bool)

(assert (=> b!1225740 (= e!696263 (and e!696255 mapRes!48583))))

(declare-fun condMapEmpty!48583 () Bool)

(declare-fun mapDefault!48583 () ValueCell!14852)

(assert (=> b!1225740 (= condMapEmpty!48583 (= (arr!38154 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14852)) mapDefault!48583)))))

(declare-fun b!1225741 () Bool)

(assert (=> b!1225741 (= e!696264 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225742 () Bool)

(declare-fun res!814131 () Bool)

(assert (=> b!1225742 (=> (not res!814131) (not e!696256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79069 (_ BitVec 32)) Bool)

(assert (=> b!1225742 (= res!814131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225743 () Bool)

(declare-fun Unit!40539 () Unit!40536)

(assert (=> b!1225743 (= e!696253 Unit!40539)))

(declare-fun b!1225744 () Bool)

(assert (=> b!1225744 (= e!696256 e!696260)))

(declare-fun res!814133 () Bool)

(assert (=> b!1225744 (=> (not res!814133) (not e!696260))))

(assert (=> b!1225744 (= res!814133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558008 mask!1564))))

(assert (=> b!1225744 (= lt!558008 (array!79070 (store (arr!38155 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38692 _keys!1208)))))

(declare-fun b!1225745 () Bool)

(declare-fun res!814132 () Bool)

(assert (=> b!1225745 (=> (not res!814132) (not e!696256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225745 (= res!814132 (validMask!0 mask!1564))))

(assert (= (and start!101966 res!814141) b!1225745))

(assert (= (and b!1225745 res!814132) b!1225725))

(assert (= (and b!1225725 res!814143) b!1225742))

(assert (= (and b!1225742 res!814131) b!1225735))

(assert (= (and b!1225735 res!814136) b!1225728))

(assert (= (and b!1225728 res!814140) b!1225737))

(assert (= (and b!1225737 res!814142) b!1225731))

(assert (= (and b!1225731 res!814139) b!1225744))

(assert (= (and b!1225744 res!814133) b!1225733))

(assert (= (and b!1225733 res!814135) b!1225729))

(assert (= (and b!1225729 (not res!814134)) b!1225724))

(assert (= (and b!1225724 (not res!814145)) b!1225732))

(assert (= (and b!1225732 (not res!814130)) b!1225727))

(assert (= (and b!1225727 res!814146) b!1225736))

(assert (= (and b!1225736 (not res!814137)) b!1225741))

(assert (= (and b!1225727 c!120847) b!1225730))

(assert (= (and b!1225727 (not c!120847)) b!1225743))

(assert (= (and b!1225727 res!814138) b!1225726))

(assert (= (and b!1225726 res!814144) b!1225739))

(assert (= (and b!1225740 condMapEmpty!48583) mapIsEmpty!48583))

(assert (= (and b!1225740 (not condMapEmpty!48583)) mapNonEmpty!48583))

(get-info :version)

(assert (= (and mapNonEmpty!48583 ((_ is ValueCellFull!14852) mapValue!48583)) b!1225738))

(assert (= (and b!1225740 ((_ is ValueCellFull!14852) mapDefault!48583)) b!1225734))

(assert (= start!101966 b!1225740))

(declare-fun b_lambda!22393 () Bool)

(assert (=> (not b_lambda!22393) (not b!1225724)))

(declare-fun t!40342 () Bool)

(declare-fun tb!11211 () Bool)

(assert (=> (and start!101966 (= defaultEntry!1004 defaultEntry!1004) t!40342) tb!11211))

(declare-fun result!23043 () Bool)

(assert (=> tb!11211 (= result!23043 tp_is_empty!31123)))

(assert (=> b!1225724 t!40342))

(declare-fun b_and!44103 () Bool)

(assert (= b_and!44101 (and (=> t!40342 result!23043) b_and!44103)))

(declare-fun m!1131029 () Bool)

(assert (=> b!1225730 m!1131029))

(declare-fun m!1131031 () Bool)

(assert (=> b!1225730 m!1131031))

(declare-fun m!1131033 () Bool)

(assert (=> b!1225730 m!1131033))

(declare-fun m!1131035 () Bool)

(assert (=> b!1225730 m!1131035))

(declare-fun m!1131037 () Bool)

(assert (=> b!1225730 m!1131037))

(declare-fun m!1131039 () Bool)

(assert (=> mapNonEmpty!48583 m!1131039))

(declare-fun m!1131041 () Bool)

(assert (=> b!1225736 m!1131041))

(declare-fun m!1131043 () Bool)

(assert (=> b!1225733 m!1131043))

(declare-fun m!1131045 () Bool)

(assert (=> b!1225729 m!1131045))

(declare-fun m!1131047 () Bool)

(assert (=> b!1225729 m!1131047))

(declare-fun m!1131049 () Bool)

(assert (=> b!1225742 m!1131049))

(declare-fun m!1131051 () Bool)

(assert (=> start!101966 m!1131051))

(declare-fun m!1131053 () Bool)

(assert (=> start!101966 m!1131053))

(declare-fun m!1131055 () Bool)

(assert (=> b!1225726 m!1131055))

(declare-fun m!1131057 () Bool)

(assert (=> b!1225741 m!1131057))

(declare-fun m!1131059 () Bool)

(assert (=> b!1225737 m!1131059))

(assert (=> b!1225727 m!1131041))

(declare-fun m!1131061 () Bool)

(assert (=> b!1225727 m!1131061))

(declare-fun m!1131063 () Bool)

(assert (=> b!1225727 m!1131063))

(assert (=> b!1225727 m!1131063))

(declare-fun m!1131065 () Bool)

(assert (=> b!1225727 m!1131065))

(declare-fun m!1131067 () Bool)

(assert (=> b!1225732 m!1131067))

(declare-fun m!1131069 () Bool)

(assert (=> b!1225732 m!1131069))

(assert (=> b!1225732 m!1131041))

(declare-fun m!1131071 () Bool)

(assert (=> b!1225732 m!1131071))

(declare-fun m!1131073 () Bool)

(assert (=> b!1225732 m!1131073))

(assert (=> b!1225732 m!1131041))

(declare-fun m!1131075 () Bool)

(assert (=> b!1225732 m!1131075))

(declare-fun m!1131077 () Bool)

(assert (=> b!1225731 m!1131077))

(declare-fun m!1131079 () Bool)

(assert (=> b!1225745 m!1131079))

(declare-fun m!1131081 () Bool)

(assert (=> b!1225735 m!1131081))

(declare-fun m!1131083 () Bool)

(assert (=> b!1225724 m!1131083))

(declare-fun m!1131085 () Bool)

(assert (=> b!1225724 m!1131085))

(declare-fun m!1131087 () Bool)

(assert (=> b!1225724 m!1131087))

(declare-fun m!1131089 () Bool)

(assert (=> b!1225724 m!1131089))

(declare-fun m!1131091 () Bool)

(assert (=> b!1225744 m!1131091))

(declare-fun m!1131093 () Bool)

(assert (=> b!1225744 m!1131093))

(check-sat (not b_lambda!22393) b_and!44103 tp_is_empty!31123 (not b!1225741) (not b!1225727) (not b!1225730) (not b!1225744) (not b_next!26419) (not b!1225745) (not b!1225733) (not b!1225724) (not b!1225735) (not mapNonEmpty!48583) (not b!1225732) (not b!1225726) (not b!1225729) (not start!101966) (not b!1225737) (not b!1225742))
(check-sat b_and!44103 (not b_next!26419))
