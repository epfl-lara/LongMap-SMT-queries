; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84208 () Bool)

(assert start!84208)

(declare-fun b_free!19795 () Bool)

(declare-fun b_next!19795 () Bool)

(assert (=> start!84208 (= b_free!19795 (not b_next!19795))))

(declare-fun tp!68909 () Bool)

(declare-fun b_and!31683 () Bool)

(assert (=> start!84208 (= tp!68909 b_and!31683)))

(declare-fun b!983357 () Bool)

(declare-fun e!554386 () Bool)

(declare-fun e!554388 () Bool)

(assert (=> b!983357 (= e!554386 e!554388)))

(declare-fun res!657795 () Bool)

(assert (=> b!983357 (=> (not res!657795) (not e!554388))))

(declare-datatypes ((array!61714 0))(
  ( (array!61715 (arr!29710 (Array (_ BitVec 32) (_ BitVec 64))) (size!30190 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61714)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983357 (= res!657795 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29710 _keys!1544) from!1932))))))

(declare-datatypes ((V!35441 0))(
  ( (V!35442 (val!11472 Int)) )
))
(declare-fun lt!436506 () V!35441)

(declare-datatypes ((ValueCell!10940 0))(
  ( (ValueCellFull!10940 (v!14031 V!35441)) (EmptyCell!10940) )
))
(declare-datatypes ((array!61716 0))(
  ( (array!61717 (arr!29711 (Array (_ BitVec 32) ValueCell!10940)) (size!30191 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61716)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15434 (ValueCell!10940 V!35441) V!35441)

(declare-fun dynLambda!1821 (Int (_ BitVec 64)) V!35441)

(assert (=> b!983357 (= lt!436506 (get!15434 (select (arr!29711 _values!1278) from!1932) (dynLambda!1821 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35441)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35441)

(declare-datatypes ((tuple2!14708 0))(
  ( (tuple2!14709 (_1!7365 (_ BitVec 64)) (_2!7365 V!35441)) )
))
(declare-datatypes ((List!20584 0))(
  ( (Nil!20581) (Cons!20580 (h!21748 tuple2!14708) (t!29321 List!20584)) )
))
(declare-datatypes ((ListLongMap!13407 0))(
  ( (ListLongMap!13408 (toList!6719 List!20584)) )
))
(declare-fun lt!436504 () ListLongMap!13407)

(declare-fun getCurrentListMapNoExtraKeys!3462 (array!61714 array!61716 (_ BitVec 32) (_ BitVec 32) V!35441 V!35441 (_ BitVec 32) Int) ListLongMap!13407)

(assert (=> b!983357 (= lt!436504 (getCurrentListMapNoExtraKeys!3462 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983358 () Bool)

(declare-fun e!554385 () Bool)

(declare-fun e!554383 () Bool)

(declare-fun mapRes!36293 () Bool)

(assert (=> b!983358 (= e!554385 (and e!554383 mapRes!36293))))

(declare-fun condMapEmpty!36293 () Bool)

(declare-fun mapDefault!36293 () ValueCell!10940)

(assert (=> b!983358 (= condMapEmpty!36293 (= (arr!29711 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10940)) mapDefault!36293)))))

(declare-fun b!983360 () Bool)

(declare-fun res!657798 () Bool)

(assert (=> b!983360 (=> (not res!657798) (not e!554386))))

(assert (=> b!983360 (= res!657798 (and (= (size!30191 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30190 _keys!1544) (size!30191 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983361 () Bool)

(declare-fun res!657796 () Bool)

(assert (=> b!983361 (=> (not res!657796) (not e!554386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983361 (= res!657796 (validKeyInArray!0 (select (arr!29710 _keys!1544) from!1932)))))

(declare-fun b!983362 () Bool)

(assert (=> b!983362 (= e!554388 (not true))))

(declare-fun lt!436502 () tuple2!14708)

(declare-fun lt!436505 () tuple2!14708)

(declare-fun +!3028 (ListLongMap!13407 tuple2!14708) ListLongMap!13407)

(assert (=> b!983362 (= (+!3028 (+!3028 lt!436504 lt!436502) lt!436505) (+!3028 (+!3028 lt!436504 lt!436505) lt!436502))))

(assert (=> b!983362 (= lt!436505 (tuple2!14709 (select (arr!29710 _keys!1544) from!1932) lt!436506))))

(assert (=> b!983362 (= lt!436502 (tuple2!14709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32636 0))(
  ( (Unit!32637) )
))
(declare-fun lt!436503 () Unit!32636)

(declare-fun addCommutativeForDiffKeys!635 (ListLongMap!13407 (_ BitVec 64) V!35441 (_ BitVec 64) V!35441) Unit!32636)

(assert (=> b!983362 (= lt!436503 (addCommutativeForDiffKeys!635 lt!436504 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29710 _keys!1544) from!1932) lt!436506))))

(declare-fun b!983363 () Bool)

(declare-fun res!657801 () Bool)

(assert (=> b!983363 (=> (not res!657801) (not e!554386))))

(assert (=> b!983363 (= res!657801 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30190 _keys!1544))))))

(declare-fun b!983364 () Bool)

(declare-fun tp_is_empty!22843 () Bool)

(assert (=> b!983364 (= e!554383 tp_is_empty!22843)))

(declare-fun mapNonEmpty!36293 () Bool)

(declare-fun tp!68908 () Bool)

(declare-fun e!554384 () Bool)

(assert (=> mapNonEmpty!36293 (= mapRes!36293 (and tp!68908 e!554384))))

(declare-fun mapKey!36293 () (_ BitVec 32))

(declare-fun mapRest!36293 () (Array (_ BitVec 32) ValueCell!10940))

(declare-fun mapValue!36293 () ValueCell!10940)

(assert (=> mapNonEmpty!36293 (= (arr!29711 _values!1278) (store mapRest!36293 mapKey!36293 mapValue!36293))))

(declare-fun res!657802 () Bool)

(assert (=> start!84208 (=> (not res!657802) (not e!554386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84208 (= res!657802 (validMask!0 mask!1948))))

(assert (=> start!84208 e!554386))

(assert (=> start!84208 true))

(assert (=> start!84208 tp_is_empty!22843))

(declare-fun array_inv!22993 (array!61716) Bool)

(assert (=> start!84208 (and (array_inv!22993 _values!1278) e!554385)))

(assert (=> start!84208 tp!68909))

(declare-fun array_inv!22994 (array!61714) Bool)

(assert (=> start!84208 (array_inv!22994 _keys!1544)))

(declare-fun b!983359 () Bool)

(declare-fun res!657799 () Bool)

(assert (=> b!983359 (=> (not res!657799) (not e!554386))))

(declare-datatypes ((List!20585 0))(
  ( (Nil!20582) (Cons!20581 (h!21749 (_ BitVec 64)) (t!29322 List!20585)) )
))
(declare-fun arrayNoDuplicates!0 (array!61714 (_ BitVec 32) List!20585) Bool)

(assert (=> b!983359 (= res!657799 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20582))))

(declare-fun b!983365 () Bool)

(assert (=> b!983365 (= e!554384 tp_is_empty!22843)))

(declare-fun b!983366 () Bool)

(declare-fun res!657797 () Bool)

(assert (=> b!983366 (=> (not res!657797) (not e!554386))))

(assert (=> b!983366 (= res!657797 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36293 () Bool)

(assert (=> mapIsEmpty!36293 mapRes!36293))

(declare-fun b!983367 () Bool)

(declare-fun res!657800 () Bool)

(assert (=> b!983367 (=> (not res!657800) (not e!554386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61714 (_ BitVec 32)) Bool)

(assert (=> b!983367 (= res!657800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84208 res!657802) b!983360))

(assert (= (and b!983360 res!657798) b!983367))

(assert (= (and b!983367 res!657800) b!983359))

(assert (= (and b!983359 res!657799) b!983363))

(assert (= (and b!983363 res!657801) b!983361))

(assert (= (and b!983361 res!657796) b!983366))

(assert (= (and b!983366 res!657797) b!983357))

(assert (= (and b!983357 res!657795) b!983362))

(assert (= (and b!983358 condMapEmpty!36293) mapIsEmpty!36293))

(assert (= (and b!983358 (not condMapEmpty!36293)) mapNonEmpty!36293))

(get-info :version)

(assert (= (and mapNonEmpty!36293 ((_ is ValueCellFull!10940) mapValue!36293)) b!983365))

(assert (= (and b!983358 ((_ is ValueCellFull!10940) mapDefault!36293)) b!983364))

(assert (= start!84208 b!983358))

(declare-fun b_lambda!14847 () Bool)

(assert (=> (not b_lambda!14847) (not b!983357)))

(declare-fun t!29320 () Bool)

(declare-fun tb!6587 () Bool)

(assert (=> (and start!84208 (= defaultEntry!1281 defaultEntry!1281) t!29320) tb!6587))

(declare-fun result!13171 () Bool)

(assert (=> tb!6587 (= result!13171 tp_is_empty!22843)))

(assert (=> b!983357 t!29320))

(declare-fun b_and!31685 () Bool)

(assert (= b_and!31683 (and (=> t!29320 result!13171) b_and!31685)))

(declare-fun m!911087 () Bool)

(assert (=> b!983367 m!911087))

(declare-fun m!911089 () Bool)

(assert (=> b!983362 m!911089))

(declare-fun m!911091 () Bool)

(assert (=> b!983362 m!911091))

(declare-fun m!911093 () Bool)

(assert (=> b!983362 m!911093))

(declare-fun m!911095 () Bool)

(assert (=> b!983362 m!911095))

(assert (=> b!983362 m!911089))

(declare-fun m!911097 () Bool)

(assert (=> b!983362 m!911097))

(assert (=> b!983362 m!911091))

(assert (=> b!983362 m!911095))

(declare-fun m!911099 () Bool)

(assert (=> b!983362 m!911099))

(assert (=> b!983357 m!911089))

(declare-fun m!911101 () Bool)

(assert (=> b!983357 m!911101))

(declare-fun m!911103 () Bool)

(assert (=> b!983357 m!911103))

(declare-fun m!911105 () Bool)

(assert (=> b!983357 m!911105))

(assert (=> b!983357 m!911101))

(assert (=> b!983357 m!911105))

(declare-fun m!911107 () Bool)

(assert (=> b!983357 m!911107))

(declare-fun m!911109 () Bool)

(assert (=> mapNonEmpty!36293 m!911109))

(assert (=> b!983361 m!911089))

(assert (=> b!983361 m!911089))

(declare-fun m!911111 () Bool)

(assert (=> b!983361 m!911111))

(declare-fun m!911113 () Bool)

(assert (=> start!84208 m!911113))

(declare-fun m!911115 () Bool)

(assert (=> start!84208 m!911115))

(declare-fun m!911117 () Bool)

(assert (=> start!84208 m!911117))

(declare-fun m!911119 () Bool)

(assert (=> b!983359 m!911119))

(check-sat (not b!983359) (not mapNonEmpty!36293) (not b_lambda!14847) (not b_next!19795) (not b!983362) (not start!84208) tp_is_empty!22843 b_and!31685 (not b!983357) (not b!983361) (not b!983367))
(check-sat b_and!31685 (not b_next!19795))
