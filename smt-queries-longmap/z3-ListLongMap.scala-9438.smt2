; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112238 () Bool)

(assert start!112238)

(declare-fun b_free!30633 () Bool)

(declare-fun b_next!30633 () Bool)

(assert (=> start!112238 (= b_free!30633 (not b_next!30633))))

(declare-fun tp!107536 () Bool)

(declare-fun b_and!49321 () Bool)

(assert (=> start!112238 (= tp!107536 b_and!49321)))

(declare-fun b!1329589 () Bool)

(declare-fun res!882206 () Bool)

(declare-fun e!757948 () Bool)

(assert (=> b!1329589 (=> (not res!882206) (not e!757948))))

(declare-datatypes ((array!89978 0))(
  ( (array!89979 (arr!43455 (Array (_ BitVec 32) (_ BitVec 64))) (size!44005 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89978)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329589 (= res!882206 (validKeyInArray!0 (select (arr!43455 _keys!1590) from!1980)))))

(declare-fun b!1329590 () Bool)

(declare-fun res!882203 () Bool)

(assert (=> b!1329590 (=> (not res!882203) (not e!757948))))

(declare-datatypes ((V!53827 0))(
  ( (V!53828 (val!18346 Int)) )
))
(declare-datatypes ((ValueCell!17373 0))(
  ( (ValueCellFull!17373 (v!20983 V!53827)) (EmptyCell!17373) )
))
(declare-datatypes ((array!89980 0))(
  ( (array!89981 (arr!43456 (Array (_ BitVec 32) ValueCell!17373)) (size!44006 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89980)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53827)

(declare-fun zeroValue!1262 () V!53827)

(declare-datatypes ((tuple2!23620 0))(
  ( (tuple2!23621 (_1!11821 (_ BitVec 64)) (_2!11821 V!53827)) )
))
(declare-datatypes ((List!30772 0))(
  ( (Nil!30769) (Cons!30768 (h!31977 tuple2!23620) (t!44818 List!30772)) )
))
(declare-datatypes ((ListLongMap!21277 0))(
  ( (ListLongMap!21278 (toList!10654 List!30772)) )
))
(declare-fun contains!8818 (ListLongMap!21277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5644 (array!89978 array!89980 (_ BitVec 32) (_ BitVec 32) V!53827 V!53827 (_ BitVec 32) Int) ListLongMap!21277)

(assert (=> b!1329590 (= res!882203 (contains!8818 (getCurrentListMap!5644 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329591 () Bool)

(declare-fun e!757947 () Bool)

(declare-fun tp_is_empty!36543 () Bool)

(assert (=> b!1329591 (= e!757947 tp_is_empty!36543)))

(declare-fun mapIsEmpty!56488 () Bool)

(declare-fun mapRes!56488 () Bool)

(assert (=> mapIsEmpty!56488 mapRes!56488))

(declare-fun mapNonEmpty!56488 () Bool)

(declare-fun tp!107535 () Bool)

(assert (=> mapNonEmpty!56488 (= mapRes!56488 (and tp!107535 e!757947))))

(declare-fun mapRest!56488 () (Array (_ BitVec 32) ValueCell!17373))

(declare-fun mapKey!56488 () (_ BitVec 32))

(declare-fun mapValue!56488 () ValueCell!17373)

(assert (=> mapNonEmpty!56488 (= (arr!43456 _values!1320) (store mapRest!56488 mapKey!56488 mapValue!56488))))

(declare-fun b!1329592 () Bool)

(declare-fun res!882207 () Bool)

(assert (=> b!1329592 (=> (not res!882207) (not e!757948))))

(declare-datatypes ((List!30773 0))(
  ( (Nil!30770) (Cons!30769 (h!31978 (_ BitVec 64)) (t!44819 List!30773)) )
))
(declare-fun arrayNoDuplicates!0 (array!89978 (_ BitVec 32) List!30773) Bool)

(assert (=> b!1329592 (= res!882207 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30770))))

(declare-fun b!1329593 () Bool)

(declare-fun res!882208 () Bool)

(assert (=> b!1329593 (=> (not res!882208) (not e!757948))))

(assert (=> b!1329593 (= res!882208 (and (= (size!44006 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44005 _keys!1590) (size!44006 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329594 () Bool)

(declare-fun res!882209 () Bool)

(assert (=> b!1329594 (=> (not res!882209) (not e!757948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89978 (_ BitVec 32)) Bool)

(assert (=> b!1329594 (= res!882209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329595 () Bool)

(declare-fun res!882210 () Bool)

(assert (=> b!1329595 (=> (not res!882210) (not e!757948))))

(assert (=> b!1329595 (= res!882210 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44005 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!882204 () Bool)

(assert (=> start!112238 (=> (not res!882204) (not e!757948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112238 (= res!882204 (validMask!0 mask!1998))))

(assert (=> start!112238 e!757948))

(declare-fun e!757949 () Bool)

(declare-fun array_inv!32789 (array!89980) Bool)

(assert (=> start!112238 (and (array_inv!32789 _values!1320) e!757949)))

(assert (=> start!112238 true))

(declare-fun array_inv!32790 (array!89978) Bool)

(assert (=> start!112238 (array_inv!32790 _keys!1590)))

(assert (=> start!112238 tp!107536))

(assert (=> start!112238 tp_is_empty!36543))

(declare-fun b!1329596 () Bool)

(declare-fun res!882205 () Bool)

(assert (=> b!1329596 (=> (not res!882205) (not e!757948))))

(assert (=> b!1329596 (= res!882205 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329597 () Bool)

(declare-fun e!757951 () Bool)

(assert (=> b!1329597 (= e!757949 (and e!757951 mapRes!56488))))

(declare-fun condMapEmpty!56488 () Bool)

(declare-fun mapDefault!56488 () ValueCell!17373)

(assert (=> b!1329597 (= condMapEmpty!56488 (= (arr!43456 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17373)) mapDefault!56488)))))

(declare-fun b!1329598 () Bool)

(assert (=> b!1329598 (= e!757951 tp_is_empty!36543)))

(declare-fun b!1329599 () Bool)

(assert (=> b!1329599 (= e!757948 (not true))))

(declare-fun lt!590980 () ListLongMap!21277)

(assert (=> b!1329599 (contains!8818 lt!590980 k0!1153)))

(declare-datatypes ((Unit!43755 0))(
  ( (Unit!43756) )
))
(declare-fun lt!590979 () Unit!43755)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!240 ((_ BitVec 64) (_ BitVec 64) V!53827 ListLongMap!21277) Unit!43755)

(assert (=> b!1329599 (= lt!590979 (lemmaInListMapAfterAddingDiffThenInBefore!240 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590980))))

(declare-fun +!4653 (ListLongMap!21277 tuple2!23620) ListLongMap!21277)

(declare-fun getCurrentListMapNoExtraKeys!6291 (array!89978 array!89980 (_ BitVec 32) (_ BitVec 32) V!53827 V!53827 (_ BitVec 32) Int) ListLongMap!21277)

(declare-fun get!21893 (ValueCell!17373 V!53827) V!53827)

(declare-fun dynLambda!3592 (Int (_ BitVec 64)) V!53827)

(assert (=> b!1329599 (= lt!590980 (+!4653 (getCurrentListMapNoExtraKeys!6291 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23621 (select (arr!43455 _keys!1590) from!1980) (get!21893 (select (arr!43456 _values!1320) from!1980) (dynLambda!3592 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329600 () Bool)

(declare-fun res!882202 () Bool)

(assert (=> b!1329600 (=> (not res!882202) (not e!757948))))

(assert (=> b!1329600 (= res!882202 (not (= (select (arr!43455 _keys!1590) from!1980) k0!1153)))))

(assert (= (and start!112238 res!882204) b!1329593))

(assert (= (and b!1329593 res!882208) b!1329594))

(assert (= (and b!1329594 res!882209) b!1329592))

(assert (= (and b!1329592 res!882207) b!1329595))

(assert (= (and b!1329595 res!882210) b!1329590))

(assert (= (and b!1329590 res!882203) b!1329600))

(assert (= (and b!1329600 res!882202) b!1329589))

(assert (= (and b!1329589 res!882206) b!1329596))

(assert (= (and b!1329596 res!882205) b!1329599))

(assert (= (and b!1329597 condMapEmpty!56488) mapIsEmpty!56488))

(assert (= (and b!1329597 (not condMapEmpty!56488)) mapNonEmpty!56488))

(get-info :version)

(assert (= (and mapNonEmpty!56488 ((_ is ValueCellFull!17373) mapValue!56488)) b!1329591))

(assert (= (and b!1329597 ((_ is ValueCellFull!17373) mapDefault!56488)) b!1329598))

(assert (= start!112238 b!1329597))

(declare-fun b_lambda!23893 () Bool)

(assert (=> (not b_lambda!23893) (not b!1329599)))

(declare-fun t!44817 () Bool)

(declare-fun tb!11849 () Bool)

(assert (=> (and start!112238 (= defaultEntry!1323 defaultEntry!1323) t!44817) tb!11849))

(declare-fun result!24769 () Bool)

(assert (=> tb!11849 (= result!24769 tp_is_empty!36543)))

(assert (=> b!1329599 t!44817))

(declare-fun b_and!49323 () Bool)

(assert (= b_and!49321 (and (=> t!44817 result!24769) b_and!49323)))

(declare-fun m!1218331 () Bool)

(assert (=> start!112238 m!1218331))

(declare-fun m!1218333 () Bool)

(assert (=> start!112238 m!1218333))

(declare-fun m!1218335 () Bool)

(assert (=> start!112238 m!1218335))

(declare-fun m!1218337 () Bool)

(assert (=> b!1329594 m!1218337))

(declare-fun m!1218339 () Bool)

(assert (=> b!1329600 m!1218339))

(declare-fun m!1218341 () Bool)

(assert (=> b!1329592 m!1218341))

(declare-fun m!1218343 () Bool)

(assert (=> b!1329599 m!1218343))

(declare-fun m!1218345 () Bool)

(assert (=> b!1329599 m!1218345))

(declare-fun m!1218347 () Bool)

(assert (=> b!1329599 m!1218347))

(declare-fun m!1218349 () Bool)

(assert (=> b!1329599 m!1218349))

(assert (=> b!1329599 m!1218343))

(declare-fun m!1218351 () Bool)

(assert (=> b!1329599 m!1218351))

(declare-fun m!1218353 () Bool)

(assert (=> b!1329599 m!1218353))

(assert (=> b!1329599 m!1218345))

(assert (=> b!1329599 m!1218349))

(declare-fun m!1218355 () Bool)

(assert (=> b!1329599 m!1218355))

(assert (=> b!1329599 m!1218339))

(declare-fun m!1218357 () Bool)

(assert (=> b!1329590 m!1218357))

(assert (=> b!1329590 m!1218357))

(declare-fun m!1218359 () Bool)

(assert (=> b!1329590 m!1218359))

(assert (=> b!1329589 m!1218339))

(assert (=> b!1329589 m!1218339))

(declare-fun m!1218361 () Bool)

(assert (=> b!1329589 m!1218361))

(declare-fun m!1218363 () Bool)

(assert (=> mapNonEmpty!56488 m!1218363))

(check-sat (not b_lambda!23893) (not b!1329599) (not b!1329589) b_and!49323 (not b!1329592) (not mapNonEmpty!56488) (not b!1329594) tp_is_empty!36543 (not b_next!30633) (not start!112238) (not b!1329590))
(check-sat b_and!49323 (not b_next!30633))
