; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109326 () Bool)

(assert start!109326)

(declare-fun b_free!28591 () Bool)

(declare-fun b_next!28591 () Bool)

(assert (=> start!109326 (= b_free!28591 (not b_next!28591))))

(declare-fun tp!100891 () Bool)

(declare-fun b_and!46683 () Bool)

(assert (=> start!109326 (= tp!100891 b_and!46683)))

(declare-fun b!1291226 () Bool)

(declare-fun res!857402 () Bool)

(declare-fun e!737302 () Bool)

(assert (=> b!1291226 (=> (not res!857402) (not e!737302))))

(declare-datatypes ((array!85541 0))(
  ( (array!85542 (arr!41267 (Array (_ BitVec 32) (_ BitVec 64))) (size!41818 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85541)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291226 (= res!857402 (not (validKeyInArray!0 (select (arr!41267 _keys!1741) from!2144))))))

(declare-fun b!1291227 () Bool)

(declare-fun res!857401 () Bool)

(assert (=> b!1291227 (=> (not res!857401) (not e!737302))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85541 (_ BitVec 32)) Bool)

(assert (=> b!1291227 (= res!857401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291228 () Bool)

(declare-fun res!857399 () Bool)

(assert (=> b!1291228 (=> (not res!857399) (not e!737302))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1291228 (= res!857399 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41818 _keys!1741))))))

(declare-fun mapIsEmpty!52907 () Bool)

(declare-fun mapRes!52907 () Bool)

(assert (=> mapIsEmpty!52907 mapRes!52907))

(declare-fun b!1291229 () Bool)

(declare-fun e!737306 () Bool)

(declare-fun tp_is_empty!34231 () Bool)

(assert (=> b!1291229 (= e!737306 tp_is_empty!34231)))

(declare-fun b!1291231 () Bool)

(declare-fun e!737304 () Bool)

(assert (=> b!1291231 (= e!737302 (not e!737304))))

(declare-fun res!857407 () Bool)

(assert (=> b!1291231 (=> res!857407 e!737304)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291231 (= res!857407 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!50745 0))(
  ( (V!50746 (val!17190 Int)) )
))
(declare-datatypes ((tuple2!22098 0))(
  ( (tuple2!22099 (_1!11060 (_ BitVec 64)) (_2!11060 V!50745)) )
))
(declare-datatypes ((List!29278 0))(
  ( (Nil!29275) (Cons!29274 (h!30492 tuple2!22098) (t!42834 List!29278)) )
))
(declare-datatypes ((ListLongMap!19763 0))(
  ( (ListLongMap!19764 (toList!9897 List!29278)) )
))
(declare-fun contains!8028 (ListLongMap!19763 (_ BitVec 64)) Bool)

(assert (=> b!1291231 (not (contains!8028 (ListLongMap!19764 Nil!29275) k0!1205))))

(declare-datatypes ((Unit!42643 0))(
  ( (Unit!42644) )
))
(declare-fun lt!578902 () Unit!42643)

(declare-fun emptyContainsNothing!73 ((_ BitVec 64)) Unit!42643)

(assert (=> b!1291231 (= lt!578902 (emptyContainsNothing!73 k0!1205))))

(declare-fun b!1291232 () Bool)

(declare-fun res!857404 () Bool)

(assert (=> b!1291232 (=> (not res!857404) (not e!737302))))

(declare-fun minValue!1387 () V!50745)

(declare-fun zeroValue!1387 () V!50745)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((ValueCell!16217 0))(
  ( (ValueCellFull!16217 (v!19788 V!50745)) (EmptyCell!16217) )
))
(declare-datatypes ((array!85543 0))(
  ( (array!85544 (arr!41268 (Array (_ BitVec 32) ValueCell!16217)) (size!41819 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85543)

(declare-fun getCurrentListMap!4940 (array!85541 array!85543 (_ BitVec 32) (_ BitVec 32) V!50745 V!50745 (_ BitVec 32) Int) ListLongMap!19763)

(assert (=> b!1291232 (= res!857404 (contains!8028 (getCurrentListMap!4940 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52907 () Bool)

(declare-fun tp!100892 () Bool)

(assert (=> mapNonEmpty!52907 (= mapRes!52907 (and tp!100892 e!737306))))

(declare-fun mapKey!52907 () (_ BitVec 32))

(declare-fun mapRest!52907 () (Array (_ BitVec 32) ValueCell!16217))

(declare-fun mapValue!52907 () ValueCell!16217)

(assert (=> mapNonEmpty!52907 (= (arr!41268 _values!1445) (store mapRest!52907 mapKey!52907 mapValue!52907))))

(declare-fun b!1291233 () Bool)

(declare-fun res!857400 () Bool)

(assert (=> b!1291233 (=> (not res!857400) (not e!737302))))

(assert (=> b!1291233 (= res!857400 (and (= (size!41819 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41818 _keys!1741) (size!41819 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291230 () Bool)

(declare-fun e!737303 () Bool)

(assert (=> b!1291230 (= e!737303 tp_is_empty!34231)))

(declare-fun res!857406 () Bool)

(assert (=> start!109326 (=> (not res!857406) (not e!737302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109326 (= res!857406 (validMask!0 mask!2175))))

(assert (=> start!109326 e!737302))

(assert (=> start!109326 tp_is_empty!34231))

(assert (=> start!109326 true))

(declare-fun e!737307 () Bool)

(declare-fun array_inv!31497 (array!85543) Bool)

(assert (=> start!109326 (and (array_inv!31497 _values!1445) e!737307)))

(declare-fun array_inv!31498 (array!85541) Bool)

(assert (=> start!109326 (array_inv!31498 _keys!1741)))

(assert (=> start!109326 tp!100891))

(declare-fun b!1291234 () Bool)

(assert (=> b!1291234 (= e!737304 true)))

(declare-fun lt!578904 () ListLongMap!19763)

(declare-fun +!4399 (ListLongMap!19763 tuple2!22098) ListLongMap!19763)

(assert (=> b!1291234 (not (contains!8028 (+!4399 lt!578904 (tuple2!22099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578903 () Unit!42643)

(declare-fun addStillNotContains!375 (ListLongMap!19763 (_ BitVec 64) V!50745 (_ BitVec 64)) Unit!42643)

(assert (=> b!1291234 (= lt!578903 (addStillNotContains!375 lt!578904 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291234 (not (contains!8028 (+!4399 lt!578904 (tuple2!22099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578901 () Unit!42643)

(assert (=> b!1291234 (= lt!578901 (addStillNotContains!375 lt!578904 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6037 (array!85541 array!85543 (_ BitVec 32) (_ BitVec 32) V!50745 V!50745 (_ BitVec 32) Int) ListLongMap!19763)

(assert (=> b!1291234 (= lt!578904 (getCurrentListMapNoExtraKeys!6037 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291235 () Bool)

(assert (=> b!1291235 (= e!737307 (and e!737303 mapRes!52907))))

(declare-fun condMapEmpty!52907 () Bool)

(declare-fun mapDefault!52907 () ValueCell!16217)

(assert (=> b!1291235 (= condMapEmpty!52907 (= (arr!41268 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16217)) mapDefault!52907)))))

(declare-fun b!1291236 () Bool)

(declare-fun res!857403 () Bool)

(assert (=> b!1291236 (=> (not res!857403) (not e!737302))))

(assert (=> b!1291236 (= res!857403 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41818 _keys!1741))))))

(declare-fun b!1291237 () Bool)

(declare-fun res!857405 () Bool)

(assert (=> b!1291237 (=> (not res!857405) (not e!737302))))

(declare-datatypes ((List!29279 0))(
  ( (Nil!29276) (Cons!29275 (h!30493 (_ BitVec 64)) (t!42835 List!29279)) )
))
(declare-fun arrayNoDuplicates!0 (array!85541 (_ BitVec 32) List!29279) Bool)

(assert (=> b!1291237 (= res!857405 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29276))))

(assert (= (and start!109326 res!857406) b!1291233))

(assert (= (and b!1291233 res!857400) b!1291227))

(assert (= (and b!1291227 res!857401) b!1291237))

(assert (= (and b!1291237 res!857405) b!1291236))

(assert (= (and b!1291236 res!857403) b!1291232))

(assert (= (and b!1291232 res!857404) b!1291228))

(assert (= (and b!1291228 res!857399) b!1291226))

(assert (= (and b!1291226 res!857402) b!1291231))

(assert (= (and b!1291231 (not res!857407)) b!1291234))

(assert (= (and b!1291235 condMapEmpty!52907) mapIsEmpty!52907))

(assert (= (and b!1291235 (not condMapEmpty!52907)) mapNonEmpty!52907))

(get-info :version)

(assert (= (and mapNonEmpty!52907 ((_ is ValueCellFull!16217) mapValue!52907)) b!1291229))

(assert (= (and b!1291235 ((_ is ValueCellFull!16217) mapDefault!52907)) b!1291230))

(assert (= start!109326 b!1291235))

(declare-fun m!1184085 () Bool)

(assert (=> start!109326 m!1184085))

(declare-fun m!1184087 () Bool)

(assert (=> start!109326 m!1184087))

(declare-fun m!1184089 () Bool)

(assert (=> start!109326 m!1184089))

(declare-fun m!1184091 () Bool)

(assert (=> b!1291231 m!1184091))

(declare-fun m!1184093 () Bool)

(assert (=> b!1291231 m!1184093))

(declare-fun m!1184095 () Bool)

(assert (=> b!1291237 m!1184095))

(declare-fun m!1184097 () Bool)

(assert (=> b!1291227 m!1184097))

(declare-fun m!1184099 () Bool)

(assert (=> b!1291226 m!1184099))

(assert (=> b!1291226 m!1184099))

(declare-fun m!1184101 () Bool)

(assert (=> b!1291226 m!1184101))

(declare-fun m!1184103 () Bool)

(assert (=> b!1291234 m!1184103))

(declare-fun m!1184105 () Bool)

(assert (=> b!1291234 m!1184105))

(declare-fun m!1184107 () Bool)

(assert (=> b!1291234 m!1184107))

(declare-fun m!1184109 () Bool)

(assert (=> b!1291234 m!1184109))

(declare-fun m!1184111 () Bool)

(assert (=> b!1291234 m!1184111))

(assert (=> b!1291234 m!1184105))

(declare-fun m!1184113 () Bool)

(assert (=> b!1291234 m!1184113))

(assert (=> b!1291234 m!1184107))

(declare-fun m!1184115 () Bool)

(assert (=> b!1291234 m!1184115))

(declare-fun m!1184117 () Bool)

(assert (=> b!1291232 m!1184117))

(assert (=> b!1291232 m!1184117))

(declare-fun m!1184119 () Bool)

(assert (=> b!1291232 m!1184119))

(declare-fun m!1184121 () Bool)

(assert (=> mapNonEmpty!52907 m!1184121))

(check-sat b_and!46683 tp_is_empty!34231 (not b!1291237) (not start!109326) (not b!1291234) (not b!1291227) (not b!1291232) (not b_next!28591) (not b!1291231) (not b!1291226) (not mapNonEmpty!52907))
(check-sat b_and!46683 (not b_next!28591))
