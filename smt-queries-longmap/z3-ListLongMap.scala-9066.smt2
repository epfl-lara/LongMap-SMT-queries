; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109182 () Bool)

(assert start!109182)

(declare-fun b_free!28671 () Bool)

(declare-fun b_next!28671 () Bool)

(assert (=> start!109182 (= b_free!28671 (not b_next!28671))))

(declare-fun tp!101132 () Bool)

(declare-fun b_and!46761 () Bool)

(assert (=> start!109182 (= tp!101132 b_and!46761)))

(declare-fun b!1291361 () Bool)

(declare-fun e!737177 () Bool)

(declare-fun e!737178 () Bool)

(assert (=> b!1291361 (= e!737177 (not e!737178))))

(declare-fun res!857961 () Bool)

(assert (=> b!1291361 (=> res!857961 e!737178)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291361 (= res!857961 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50851 0))(
  ( (V!50852 (val!17230 Int)) )
))
(declare-datatypes ((tuple2!22152 0))(
  ( (tuple2!22153 (_1!11087 (_ BitVec 64)) (_2!11087 V!50851)) )
))
(declare-datatypes ((List!29309 0))(
  ( (Nil!29306) (Cons!29305 (h!30514 tuple2!22152) (t!42873 List!29309)) )
))
(declare-datatypes ((ListLongMap!19809 0))(
  ( (ListLongMap!19810 (toList!9920 List!29309)) )
))
(declare-fun contains!8038 (ListLongMap!19809 (_ BitVec 64)) Bool)

(assert (=> b!1291361 (not (contains!8038 (ListLongMap!19810 Nil!29306) k0!1205))))

(declare-datatypes ((Unit!42752 0))(
  ( (Unit!42753) )
))
(declare-fun lt!579092 () Unit!42752)

(declare-fun emptyContainsNothing!98 ((_ BitVec 64)) Unit!42752)

(assert (=> b!1291361 (= lt!579092 (emptyContainsNothing!98 k0!1205))))

(declare-fun b!1291362 () Bool)

(declare-fun res!857959 () Bool)

(assert (=> b!1291362 (=> (not res!857959) (not e!737177))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16257 0))(
  ( (ValueCellFull!16257 (v!19833 V!50851)) (EmptyCell!16257) )
))
(declare-datatypes ((array!85658 0))(
  ( (array!85659 (arr!41330 (Array (_ BitVec 32) ValueCell!16257)) (size!41880 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85658)

(declare-datatypes ((array!85660 0))(
  ( (array!85661 (arr!41331 (Array (_ BitVec 32) (_ BitVec 64))) (size!41881 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85660)

(assert (=> b!1291362 (= res!857959 (and (= (size!41880 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41881 _keys!1741) (size!41880 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!857965 () Bool)

(assert (=> start!109182 (=> (not res!857965) (not e!737177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109182 (= res!857965 (validMask!0 mask!2175))))

(assert (=> start!109182 e!737177))

(declare-fun tp_is_empty!34311 () Bool)

(assert (=> start!109182 tp_is_empty!34311))

(assert (=> start!109182 true))

(declare-fun e!737175 () Bool)

(declare-fun array_inv!31317 (array!85658) Bool)

(assert (=> start!109182 (and (array_inv!31317 _values!1445) e!737175)))

(declare-fun array_inv!31318 (array!85660) Bool)

(assert (=> start!109182 (array_inv!31318 _keys!1741)))

(assert (=> start!109182 tp!101132))

(declare-fun b!1291363 () Bool)

(declare-fun res!857964 () Bool)

(assert (=> b!1291363 (=> (not res!857964) (not e!737177))))

(declare-datatypes ((List!29310 0))(
  ( (Nil!29307) (Cons!29306 (h!30515 (_ BitVec 64)) (t!42874 List!29310)) )
))
(declare-fun arrayNoDuplicates!0 (array!85660 (_ BitVec 32) List!29310) Bool)

(assert (=> b!1291363 (= res!857964 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29307))))

(declare-fun b!1291364 () Bool)

(assert (=> b!1291364 (= e!737178 true)))

(assert (=> b!1291364 false))

(declare-fun minValue!1387 () V!50851)

(declare-fun lt!579088 () Unit!42752)

(declare-fun lt!579091 () ListLongMap!19809)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!58 ((_ BitVec 64) (_ BitVec 64) V!50851 ListLongMap!19809) Unit!42752)

(assert (=> b!1291364 (= lt!579088 (lemmaInListMapAfterAddingDiffThenInBefore!58 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579091))))

(declare-fun lt!579089 () ListLongMap!19809)

(declare-fun +!4384 (ListLongMap!19809 tuple2!22152) ListLongMap!19809)

(assert (=> b!1291364 (not (contains!8038 (+!4384 lt!579089 (tuple2!22153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579087 () Unit!42752)

(declare-fun addStillNotContains!402 (ListLongMap!19809 (_ BitVec 64) V!50851 (_ BitVec 64)) Unit!42752)

(assert (=> b!1291364 (= lt!579087 (addStillNotContains!402 lt!579089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291364 (not (contains!8038 lt!579091 k0!1205))))

(declare-fun zeroValue!1387 () V!50851)

(assert (=> b!1291364 (= lt!579091 (+!4384 lt!579089 (tuple2!22153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579090 () Unit!42752)

(assert (=> b!1291364 (= lt!579090 (addStillNotContains!402 lt!579089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6015 (array!85660 array!85658 (_ BitVec 32) (_ BitVec 32) V!50851 V!50851 (_ BitVec 32) Int) ListLongMap!19809)

(assert (=> b!1291364 (= lt!579089 (getCurrentListMapNoExtraKeys!6015 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291365 () Bool)

(declare-fun e!737179 () Bool)

(declare-fun mapRes!53027 () Bool)

(assert (=> b!1291365 (= e!737175 (and e!737179 mapRes!53027))))

(declare-fun condMapEmpty!53027 () Bool)

(declare-fun mapDefault!53027 () ValueCell!16257)

(assert (=> b!1291365 (= condMapEmpty!53027 (= (arr!41330 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16257)) mapDefault!53027)))))

(declare-fun mapNonEmpty!53027 () Bool)

(declare-fun tp!101131 () Bool)

(declare-fun e!737176 () Bool)

(assert (=> mapNonEmpty!53027 (= mapRes!53027 (and tp!101131 e!737176))))

(declare-fun mapKey!53027 () (_ BitVec 32))

(declare-fun mapRest!53027 () (Array (_ BitVec 32) ValueCell!16257))

(declare-fun mapValue!53027 () ValueCell!16257)

(assert (=> mapNonEmpty!53027 (= (arr!41330 _values!1445) (store mapRest!53027 mapKey!53027 mapValue!53027))))

(declare-fun b!1291366 () Bool)

(declare-fun res!857962 () Bool)

(assert (=> b!1291366 (=> (not res!857962) (not e!737177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291366 (= res!857962 (not (validKeyInArray!0 (select (arr!41331 _keys!1741) from!2144))))))

(declare-fun b!1291367 () Bool)

(assert (=> b!1291367 (= e!737179 tp_is_empty!34311)))

(declare-fun b!1291368 () Bool)

(declare-fun res!857966 () Bool)

(assert (=> b!1291368 (=> (not res!857966) (not e!737177))))

(assert (=> b!1291368 (= res!857966 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41881 _keys!1741))))))

(declare-fun b!1291369 () Bool)

(assert (=> b!1291369 (= e!737176 tp_is_empty!34311)))

(declare-fun b!1291370 () Bool)

(declare-fun res!857960 () Bool)

(assert (=> b!1291370 (=> (not res!857960) (not e!737177))))

(assert (=> b!1291370 (= res!857960 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41881 _keys!1741))))))

(declare-fun mapIsEmpty!53027 () Bool)

(assert (=> mapIsEmpty!53027 mapRes!53027))

(declare-fun b!1291371 () Bool)

(declare-fun res!857967 () Bool)

(assert (=> b!1291371 (=> (not res!857967) (not e!737177))))

(declare-fun getCurrentListMap!4971 (array!85660 array!85658 (_ BitVec 32) (_ BitVec 32) V!50851 V!50851 (_ BitVec 32) Int) ListLongMap!19809)

(assert (=> b!1291371 (= res!857967 (contains!8038 (getCurrentListMap!4971 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291372 () Bool)

(declare-fun res!857963 () Bool)

(assert (=> b!1291372 (=> (not res!857963) (not e!737177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85660 (_ BitVec 32)) Bool)

(assert (=> b!1291372 (= res!857963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109182 res!857965) b!1291362))

(assert (= (and b!1291362 res!857959) b!1291372))

(assert (= (and b!1291372 res!857963) b!1291363))

(assert (= (and b!1291363 res!857964) b!1291370))

(assert (= (and b!1291370 res!857960) b!1291371))

(assert (= (and b!1291371 res!857967) b!1291368))

(assert (= (and b!1291368 res!857966) b!1291366))

(assert (= (and b!1291366 res!857962) b!1291361))

(assert (= (and b!1291361 (not res!857961)) b!1291364))

(assert (= (and b!1291365 condMapEmpty!53027) mapIsEmpty!53027))

(assert (= (and b!1291365 (not condMapEmpty!53027)) mapNonEmpty!53027))

(get-info :version)

(assert (= (and mapNonEmpty!53027 ((_ is ValueCellFull!16257) mapValue!53027)) b!1291369))

(assert (= (and b!1291365 ((_ is ValueCellFull!16257) mapDefault!53027)) b!1291367))

(assert (= start!109182 b!1291365))

(declare-fun m!1184055 () Bool)

(assert (=> b!1291366 m!1184055))

(assert (=> b!1291366 m!1184055))

(declare-fun m!1184057 () Bool)

(assert (=> b!1291366 m!1184057))

(declare-fun m!1184059 () Bool)

(assert (=> b!1291361 m!1184059))

(declare-fun m!1184061 () Bool)

(assert (=> b!1291361 m!1184061))

(declare-fun m!1184063 () Bool)

(assert (=> b!1291363 m!1184063))

(declare-fun m!1184065 () Bool)

(assert (=> b!1291364 m!1184065))

(declare-fun m!1184067 () Bool)

(assert (=> b!1291364 m!1184067))

(declare-fun m!1184069 () Bool)

(assert (=> b!1291364 m!1184069))

(declare-fun m!1184071 () Bool)

(assert (=> b!1291364 m!1184071))

(assert (=> b!1291364 m!1184067))

(declare-fun m!1184073 () Bool)

(assert (=> b!1291364 m!1184073))

(declare-fun m!1184075 () Bool)

(assert (=> b!1291364 m!1184075))

(declare-fun m!1184077 () Bool)

(assert (=> b!1291364 m!1184077))

(declare-fun m!1184079 () Bool)

(assert (=> b!1291364 m!1184079))

(declare-fun m!1184081 () Bool)

(assert (=> b!1291371 m!1184081))

(assert (=> b!1291371 m!1184081))

(declare-fun m!1184083 () Bool)

(assert (=> b!1291371 m!1184083))

(declare-fun m!1184085 () Bool)

(assert (=> start!109182 m!1184085))

(declare-fun m!1184087 () Bool)

(assert (=> start!109182 m!1184087))

(declare-fun m!1184089 () Bool)

(assert (=> start!109182 m!1184089))

(declare-fun m!1184091 () Bool)

(assert (=> mapNonEmpty!53027 m!1184091))

(declare-fun m!1184093 () Bool)

(assert (=> b!1291372 m!1184093))

(check-sat tp_is_empty!34311 (not mapNonEmpty!53027) (not b!1291371) (not b!1291372) (not b_next!28671) (not b!1291361) (not b!1291364) b_and!46761 (not start!109182) (not b!1291366) (not b!1291363))
(check-sat b_and!46761 (not b_next!28671))
