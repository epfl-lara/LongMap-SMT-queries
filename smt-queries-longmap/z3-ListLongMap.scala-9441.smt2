; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112254 () Bool)

(assert start!112254)

(declare-fun b_free!30649 () Bool)

(declare-fun b_next!30649 () Bool)

(assert (=> start!112254 (= b_free!30649 (not b_next!30649))))

(declare-fun tp!107584 () Bool)

(declare-fun b_and!49335 () Bool)

(assert (=> start!112254 (= tp!107584 b_and!49335)))

(declare-fun b!1329823 () Bool)

(declare-fun e!758037 () Bool)

(assert (=> b!1329823 (= e!758037 (not true))))

(declare-datatypes ((V!53849 0))(
  ( (V!53850 (val!18354 Int)) )
))
(declare-datatypes ((tuple2!23696 0))(
  ( (tuple2!23697 (_1!11859 (_ BitVec 64)) (_2!11859 V!53849)) )
))
(declare-datatypes ((List!30842 0))(
  ( (Nil!30839) (Cons!30838 (h!32047 tuple2!23696) (t!44896 List!30842)) )
))
(declare-datatypes ((ListLongMap!21353 0))(
  ( (ListLongMap!21354 (toList!10692 List!30842)) )
))
(declare-fun lt!590842 () ListLongMap!21353)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8784 (ListLongMap!21353 (_ BitVec 64)) Bool)

(assert (=> b!1329823 (contains!8784 lt!590842 k0!1153)))

(declare-datatypes ((Unit!43566 0))(
  ( (Unit!43567) )
))
(declare-fun lt!590841 () Unit!43566)

(declare-fun minValue!1262 () V!53849)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!233 ((_ BitVec 64) (_ BitVec 64) V!53849 ListLongMap!21353) Unit!43566)

(assert (=> b!1329823 (= lt!590841 (lemmaInListMapAfterAddingDiffThenInBefore!233 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590842))))

(declare-datatypes ((ValueCell!17381 0))(
  ( (ValueCellFull!17381 (v!20990 V!53849)) (EmptyCell!17381) )
))
(declare-datatypes ((array!89941 0))(
  ( (array!89942 (arr!43437 (Array (_ BitVec 32) ValueCell!17381)) (size!43989 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89941)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89943 0))(
  ( (array!89944 (arr!43438 (Array (_ BitVec 32) (_ BitVec 64))) (size!43990 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89943)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53849)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4677 (ListLongMap!21353 tuple2!23696) ListLongMap!21353)

(declare-fun getCurrentListMapNoExtraKeys!6315 (array!89943 array!89941 (_ BitVec 32) (_ BitVec 32) V!53849 V!53849 (_ BitVec 32) Int) ListLongMap!21353)

(declare-fun get!21890 (ValueCell!17381 V!53849) V!53849)

(declare-fun dynLambda!3607 (Int (_ BitVec 64)) V!53849)

(assert (=> b!1329823 (= lt!590842 (+!4677 (getCurrentListMapNoExtraKeys!6315 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23697 (select (arr!43438 _keys!1590) from!1980) (get!21890 (select (arr!43437 _values!1320) from!1980) (dynLambda!3607 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329824 () Bool)

(declare-fun res!882389 () Bool)

(assert (=> b!1329824 (=> (not res!882389) (not e!758037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329824 (= res!882389 (validKeyInArray!0 (select (arr!43438 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56512 () Bool)

(declare-fun mapRes!56512 () Bool)

(declare-fun tp!107585 () Bool)

(declare-fun e!758038 () Bool)

(assert (=> mapNonEmpty!56512 (= mapRes!56512 (and tp!107585 e!758038))))

(declare-fun mapRest!56512 () (Array (_ BitVec 32) ValueCell!17381))

(declare-fun mapValue!56512 () ValueCell!17381)

(declare-fun mapKey!56512 () (_ BitVec 32))

(assert (=> mapNonEmpty!56512 (= (arr!43437 _values!1320) (store mapRest!56512 mapKey!56512 mapValue!56512))))

(declare-fun b!1329825 () Bool)

(declare-fun e!758036 () Bool)

(declare-fun tp_is_empty!36559 () Bool)

(assert (=> b!1329825 (= e!758036 tp_is_empty!36559)))

(declare-fun b!1329826 () Bool)

(declare-fun e!758034 () Bool)

(assert (=> b!1329826 (= e!758034 (and e!758036 mapRes!56512))))

(declare-fun condMapEmpty!56512 () Bool)

(declare-fun mapDefault!56512 () ValueCell!17381)

(assert (=> b!1329826 (= condMapEmpty!56512 (= (arr!43437 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17381)) mapDefault!56512)))))

(declare-fun mapIsEmpty!56512 () Bool)

(assert (=> mapIsEmpty!56512 mapRes!56512))

(declare-fun res!882397 () Bool)

(assert (=> start!112254 (=> (not res!882397) (not e!758037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112254 (= res!882397 (validMask!0 mask!1998))))

(assert (=> start!112254 e!758037))

(declare-fun array_inv!32943 (array!89941) Bool)

(assert (=> start!112254 (and (array_inv!32943 _values!1320) e!758034)))

(assert (=> start!112254 true))

(declare-fun array_inv!32944 (array!89943) Bool)

(assert (=> start!112254 (array_inv!32944 _keys!1590)))

(assert (=> start!112254 tp!107584))

(assert (=> start!112254 tp_is_empty!36559))

(declare-fun b!1329827 () Bool)

(declare-fun res!882394 () Bool)

(assert (=> b!1329827 (=> (not res!882394) (not e!758037))))

(declare-datatypes ((List!30843 0))(
  ( (Nil!30840) (Cons!30839 (h!32048 (_ BitVec 64)) (t!44897 List!30843)) )
))
(declare-fun arrayNoDuplicates!0 (array!89943 (_ BitVec 32) List!30843) Bool)

(assert (=> b!1329827 (= res!882394 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30840))))

(declare-fun b!1329828 () Bool)

(assert (=> b!1329828 (= e!758038 tp_is_empty!36559)))

(declare-fun b!1329829 () Bool)

(declare-fun res!882390 () Bool)

(assert (=> b!1329829 (=> (not res!882390) (not e!758037))))

(assert (=> b!1329829 (= res!882390 (not (= (select (arr!43438 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329830 () Bool)

(declare-fun res!882391 () Bool)

(assert (=> b!1329830 (=> (not res!882391) (not e!758037))))

(assert (=> b!1329830 (= res!882391 (and (= (size!43989 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43990 _keys!1590) (size!43989 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329831 () Bool)

(declare-fun res!882396 () Bool)

(assert (=> b!1329831 (=> (not res!882396) (not e!758037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89943 (_ BitVec 32)) Bool)

(assert (=> b!1329831 (= res!882396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329832 () Bool)

(declare-fun res!882393 () Bool)

(assert (=> b!1329832 (=> (not res!882393) (not e!758037))))

(declare-fun getCurrentListMap!5558 (array!89943 array!89941 (_ BitVec 32) (_ BitVec 32) V!53849 V!53849 (_ BitVec 32) Int) ListLongMap!21353)

(assert (=> b!1329832 (= res!882393 (contains!8784 (getCurrentListMap!5558 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329833 () Bool)

(declare-fun res!882392 () Bool)

(assert (=> b!1329833 (=> (not res!882392) (not e!758037))))

(assert (=> b!1329833 (= res!882392 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329834 () Bool)

(declare-fun res!882395 () Bool)

(assert (=> b!1329834 (=> (not res!882395) (not e!758037))))

(assert (=> b!1329834 (= res!882395 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43990 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112254 res!882397) b!1329830))

(assert (= (and b!1329830 res!882391) b!1329831))

(assert (= (and b!1329831 res!882396) b!1329827))

(assert (= (and b!1329827 res!882394) b!1329834))

(assert (= (and b!1329834 res!882395) b!1329832))

(assert (= (and b!1329832 res!882393) b!1329829))

(assert (= (and b!1329829 res!882390) b!1329824))

(assert (= (and b!1329824 res!882389) b!1329833))

(assert (= (and b!1329833 res!882392) b!1329823))

(assert (= (and b!1329826 condMapEmpty!56512) mapIsEmpty!56512))

(assert (= (and b!1329826 (not condMapEmpty!56512)) mapNonEmpty!56512))

(get-info :version)

(assert (= (and mapNonEmpty!56512 ((_ is ValueCellFull!17381) mapValue!56512)) b!1329828))

(assert (= (and b!1329826 ((_ is ValueCellFull!17381) mapDefault!56512)) b!1329825))

(assert (= start!112254 b!1329826))

(declare-fun b_lambda!23899 () Bool)

(assert (=> (not b_lambda!23899) (not b!1329823)))

(declare-fun t!44895 () Bool)

(declare-fun tb!11857 () Bool)

(assert (=> (and start!112254 (= defaultEntry!1323 defaultEntry!1323) t!44895) tb!11857))

(declare-fun result!24793 () Bool)

(assert (=> tb!11857 (= result!24793 tp_is_empty!36559)))

(assert (=> b!1329823 t!44895))

(declare-fun b_and!49337 () Bool)

(assert (= b_and!49335 (and (=> t!44895 result!24793) b_and!49337)))

(declare-fun m!1218087 () Bool)

(assert (=> start!112254 m!1218087))

(declare-fun m!1218089 () Bool)

(assert (=> start!112254 m!1218089))

(declare-fun m!1218091 () Bool)

(assert (=> start!112254 m!1218091))

(declare-fun m!1218093 () Bool)

(assert (=> b!1329824 m!1218093))

(assert (=> b!1329824 m!1218093))

(declare-fun m!1218095 () Bool)

(assert (=> b!1329824 m!1218095))

(declare-fun m!1218097 () Bool)

(assert (=> b!1329831 m!1218097))

(declare-fun m!1218099 () Bool)

(assert (=> mapNonEmpty!56512 m!1218099))

(assert (=> b!1329829 m!1218093))

(declare-fun m!1218101 () Bool)

(assert (=> b!1329832 m!1218101))

(assert (=> b!1329832 m!1218101))

(declare-fun m!1218103 () Bool)

(assert (=> b!1329832 m!1218103))

(declare-fun m!1218105 () Bool)

(assert (=> b!1329823 m!1218105))

(declare-fun m!1218107 () Bool)

(assert (=> b!1329823 m!1218107))

(declare-fun m!1218109 () Bool)

(assert (=> b!1329823 m!1218109))

(declare-fun m!1218111 () Bool)

(assert (=> b!1329823 m!1218111))

(assert (=> b!1329823 m!1218105))

(declare-fun m!1218113 () Bool)

(assert (=> b!1329823 m!1218113))

(declare-fun m!1218115 () Bool)

(assert (=> b!1329823 m!1218115))

(assert (=> b!1329823 m!1218111))

(assert (=> b!1329823 m!1218093))

(assert (=> b!1329823 m!1218107))

(declare-fun m!1218117 () Bool)

(assert (=> b!1329823 m!1218117))

(declare-fun m!1218119 () Bool)

(assert (=> b!1329827 m!1218119))

(check-sat (not b_lambda!23899) (not b!1329823) (not mapNonEmpty!56512) (not b!1329827) (not b!1329824) b_and!49337 (not b!1329832) (not start!112254) tp_is_empty!36559 (not b!1329831) (not b_next!30649))
(check-sat b_and!49337 (not b_next!30649))
