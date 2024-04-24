; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84148 () Bool)

(assert start!84148)

(declare-fun b_free!19735 () Bool)

(declare-fun b_next!19735 () Bool)

(assert (=> start!84148 (= b_free!19735 (not b_next!19735))))

(declare-fun tp!68728 () Bool)

(declare-fun b_and!31563 () Bool)

(assert (=> start!84148 (= tp!68728 b_and!31563)))

(declare-fun b!982307 () Bool)

(declare-fun res!657076 () Bool)

(declare-fun e!553845 () Bool)

(assert (=> b!982307 (=> (not res!657076) (not e!553845))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982307 (= res!657076 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36203 () Bool)

(declare-fun mapRes!36203 () Bool)

(declare-fun tp!68729 () Bool)

(declare-fun e!553848 () Bool)

(assert (=> mapNonEmpty!36203 (= mapRes!36203 (and tp!68729 e!553848))))

(declare-datatypes ((V!35361 0))(
  ( (V!35362 (val!11442 Int)) )
))
(declare-datatypes ((ValueCell!10910 0))(
  ( (ValueCellFull!10910 (v!14001 V!35361)) (EmptyCell!10910) )
))
(declare-datatypes ((array!61598 0))(
  ( (array!61599 (arr!29652 (Array (_ BitVec 32) ValueCell!10910)) (size!30132 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61598)

(declare-fun mapKey!36203 () (_ BitVec 32))

(declare-fun mapRest!36203 () (Array (_ BitVec 32) ValueCell!10910))

(declare-fun mapValue!36203 () ValueCell!10910)

(assert (=> mapNonEmpty!36203 (= (arr!29652 _values!1278) (store mapRest!36203 mapKey!36203 mapValue!36203))))

(declare-fun b!982308 () Bool)

(declare-fun e!553844 () Bool)

(assert (=> b!982308 (= e!553844 (not true))))

(declare-datatypes ((tuple2!14658 0))(
  ( (tuple2!14659 (_1!7340 (_ BitVec 64)) (_2!7340 V!35361)) )
))
(declare-datatypes ((List!20536 0))(
  ( (Nil!20533) (Cons!20532 (h!21700 tuple2!14658) (t!29213 List!20536)) )
))
(declare-datatypes ((ListLongMap!13357 0))(
  ( (ListLongMap!13358 (toList!6694 List!20536)) )
))
(declare-fun lt!436056 () ListLongMap!13357)

(declare-fun lt!436055 () tuple2!14658)

(declare-fun lt!436054 () tuple2!14658)

(declare-fun +!3006 (ListLongMap!13357 tuple2!14658) ListLongMap!13357)

(assert (=> b!982308 (= (+!3006 (+!3006 lt!436056 lt!436055) lt!436054) (+!3006 (+!3006 lt!436056 lt!436054) lt!436055))))

(declare-fun lt!436052 () V!35361)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61600 0))(
  ( (array!61601 (arr!29653 (Array (_ BitVec 32) (_ BitVec 64))) (size!30133 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61600)

(assert (=> b!982308 (= lt!436054 (tuple2!14659 (select (arr!29653 _keys!1544) from!1932) lt!436052))))

(declare-fun zeroValue!1220 () V!35361)

(assert (=> b!982308 (= lt!436055 (tuple2!14659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32592 0))(
  ( (Unit!32593) )
))
(declare-fun lt!436053 () Unit!32592)

(declare-fun addCommutativeForDiffKeys!613 (ListLongMap!13357 (_ BitVec 64) V!35361 (_ BitVec 64) V!35361) Unit!32592)

(assert (=> b!982308 (= lt!436053 (addCommutativeForDiffKeys!613 lt!436056 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29653 _keys!1544) from!1932) lt!436052))))

(declare-fun b!982309 () Bool)

(declare-fun res!657077 () Bool)

(assert (=> b!982309 (=> (not res!657077) (not e!553845))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61600 (_ BitVec 32)) Bool)

(assert (=> b!982309 (= res!657077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982310 () Bool)

(declare-fun tp_is_empty!22783 () Bool)

(assert (=> b!982310 (= e!553848 tp_is_empty!22783)))

(declare-fun b!982311 () Bool)

(declare-fun e!553843 () Bool)

(declare-fun e!553846 () Bool)

(assert (=> b!982311 (= e!553843 (and e!553846 mapRes!36203))))

(declare-fun condMapEmpty!36203 () Bool)

(declare-fun mapDefault!36203 () ValueCell!10910)

(assert (=> b!982311 (= condMapEmpty!36203 (= (arr!29652 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10910)) mapDefault!36203)))))

(declare-fun b!982312 () Bool)

(assert (=> b!982312 (= e!553845 e!553844)))

(declare-fun res!657075 () Bool)

(assert (=> b!982312 (=> (not res!657075) (not e!553844))))

(assert (=> b!982312 (= res!657075 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29653 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15392 (ValueCell!10910 V!35361) V!35361)

(declare-fun dynLambda!1799 (Int (_ BitVec 64)) V!35361)

(assert (=> b!982312 (= lt!436052 (get!15392 (select (arr!29652 _values!1278) from!1932) (dynLambda!1799 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35361)

(declare-fun getCurrentListMapNoExtraKeys!3440 (array!61600 array!61598 (_ BitVec 32) (_ BitVec 32) V!35361 V!35361 (_ BitVec 32) Int) ListLongMap!13357)

(assert (=> b!982312 (= lt!436056 (getCurrentListMapNoExtraKeys!3440 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982313 () Bool)

(declare-fun res!657078 () Bool)

(assert (=> b!982313 (=> (not res!657078) (not e!553845))))

(declare-datatypes ((List!20537 0))(
  ( (Nil!20534) (Cons!20533 (h!21701 (_ BitVec 64)) (t!29214 List!20537)) )
))
(declare-fun arrayNoDuplicates!0 (array!61600 (_ BitVec 32) List!20537) Bool)

(assert (=> b!982313 (= res!657078 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20534))))

(declare-fun mapIsEmpty!36203 () Bool)

(assert (=> mapIsEmpty!36203 mapRes!36203))

(declare-fun res!657079 () Bool)

(assert (=> start!84148 (=> (not res!657079) (not e!553845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84148 (= res!657079 (validMask!0 mask!1948))))

(assert (=> start!84148 e!553845))

(assert (=> start!84148 true))

(assert (=> start!84148 tp_is_empty!22783))

(declare-fun array_inv!22947 (array!61598) Bool)

(assert (=> start!84148 (and (array_inv!22947 _values!1278) e!553843)))

(assert (=> start!84148 tp!68728))

(declare-fun array_inv!22948 (array!61600) Bool)

(assert (=> start!84148 (array_inv!22948 _keys!1544)))

(declare-fun b!982314 () Bool)

(declare-fun res!657080 () Bool)

(assert (=> b!982314 (=> (not res!657080) (not e!553845))))

(assert (=> b!982314 (= res!657080 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30133 _keys!1544))))))

(declare-fun b!982315 () Bool)

(declare-fun res!657081 () Bool)

(assert (=> b!982315 (=> (not res!657081) (not e!553845))))

(assert (=> b!982315 (= res!657081 (and (= (size!30132 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30133 _keys!1544) (size!30132 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982316 () Bool)

(declare-fun res!657082 () Bool)

(assert (=> b!982316 (=> (not res!657082) (not e!553845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982316 (= res!657082 (validKeyInArray!0 (select (arr!29653 _keys!1544) from!1932)))))

(declare-fun b!982317 () Bool)

(assert (=> b!982317 (= e!553846 tp_is_empty!22783)))

(assert (= (and start!84148 res!657079) b!982315))

(assert (= (and b!982315 res!657081) b!982309))

(assert (= (and b!982309 res!657077) b!982313))

(assert (= (and b!982313 res!657078) b!982314))

(assert (= (and b!982314 res!657080) b!982316))

(assert (= (and b!982316 res!657082) b!982307))

(assert (= (and b!982307 res!657076) b!982312))

(assert (= (and b!982312 res!657075) b!982308))

(assert (= (and b!982311 condMapEmpty!36203) mapIsEmpty!36203))

(assert (= (and b!982311 (not condMapEmpty!36203)) mapNonEmpty!36203))

(get-info :version)

(assert (= (and mapNonEmpty!36203 ((_ is ValueCellFull!10910) mapValue!36203)) b!982310))

(assert (= (and b!982311 ((_ is ValueCellFull!10910) mapDefault!36203)) b!982317))

(assert (= start!84148 b!982311))

(declare-fun b_lambda!14787 () Bool)

(assert (=> (not b_lambda!14787) (not b!982312)))

(declare-fun t!29212 () Bool)

(declare-fun tb!6527 () Bool)

(assert (=> (and start!84148 (= defaultEntry!1281 defaultEntry!1281) t!29212) tb!6527))

(declare-fun result!13051 () Bool)

(assert (=> tb!6527 (= result!13051 tp_is_empty!22783)))

(assert (=> b!982312 t!29212))

(declare-fun b_and!31565 () Bool)

(assert (= b_and!31563 (and (=> t!29212 result!13051) b_and!31565)))

(declare-fun m!910067 () Bool)

(assert (=> b!982308 m!910067))

(declare-fun m!910069 () Bool)

(assert (=> b!982308 m!910069))

(declare-fun m!910071 () Bool)

(assert (=> b!982308 m!910071))

(assert (=> b!982308 m!910069))

(declare-fun m!910073 () Bool)

(assert (=> b!982308 m!910073))

(assert (=> b!982308 m!910073))

(declare-fun m!910075 () Bool)

(assert (=> b!982308 m!910075))

(assert (=> b!982308 m!910067))

(declare-fun m!910077 () Bool)

(assert (=> b!982308 m!910077))

(declare-fun m!910079 () Bool)

(assert (=> mapNonEmpty!36203 m!910079))

(declare-fun m!910081 () Bool)

(assert (=> b!982309 m!910081))

(declare-fun m!910083 () Bool)

(assert (=> start!84148 m!910083))

(declare-fun m!910085 () Bool)

(assert (=> start!84148 m!910085))

(declare-fun m!910087 () Bool)

(assert (=> start!84148 m!910087))

(assert (=> b!982316 m!910067))

(assert (=> b!982316 m!910067))

(declare-fun m!910089 () Bool)

(assert (=> b!982316 m!910089))

(declare-fun m!910091 () Bool)

(assert (=> b!982313 m!910091))

(assert (=> b!982312 m!910067))

(declare-fun m!910093 () Bool)

(assert (=> b!982312 m!910093))

(declare-fun m!910095 () Bool)

(assert (=> b!982312 m!910095))

(declare-fun m!910097 () Bool)

(assert (=> b!982312 m!910097))

(assert (=> b!982312 m!910093))

(assert (=> b!982312 m!910097))

(declare-fun m!910099 () Bool)

(assert (=> b!982312 m!910099))

(check-sat (not b!982313) tp_is_empty!22783 (not mapNonEmpty!36203) (not b!982316) (not b_next!19735) (not b_lambda!14787) (not b!982308) b_and!31565 (not start!84148) (not b!982309) (not b!982312))
(check-sat b_and!31565 (not b_next!19735))
