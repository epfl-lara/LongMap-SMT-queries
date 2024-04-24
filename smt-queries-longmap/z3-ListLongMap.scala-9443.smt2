; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112490 () Bool)

(assert start!112490)

(declare-fun b_free!30661 () Bool)

(declare-fun b_next!30661 () Bool)

(assert (=> start!112490 (= b_free!30661 (not b_next!30661))))

(declare-fun tp!107620 () Bool)

(declare-fun b_and!49379 () Bool)

(assert (=> start!112490 (= tp!107620 b_and!49379)))

(declare-fun b!1331420 () Bool)

(declare-fun res!883104 () Bool)

(declare-fun e!759000 () Bool)

(assert (=> b!1331420 (=> (not res!883104) (not e!759000))))

(declare-datatypes ((V!53865 0))(
  ( (V!53866 (val!18360 Int)) )
))
(declare-datatypes ((ValueCell!17387 0))(
  ( (ValueCellFull!17387 (v!20992 V!53865)) (EmptyCell!17387) )
))
(declare-datatypes ((array!90139 0))(
  ( (array!90140 (arr!43531 (Array (_ BitVec 32) ValueCell!17387)) (size!44082 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90139)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90141 0))(
  ( (array!90142 (arr!43532 (Array (_ BitVec 32) (_ BitVec 64))) (size!44083 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90141)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53865)

(declare-fun zeroValue!1262 () V!53865)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23678 0))(
  ( (tuple2!23679 (_1!11850 (_ BitVec 64)) (_2!11850 V!53865)) )
))
(declare-datatypes ((List!30847 0))(
  ( (Nil!30844) (Cons!30843 (h!32061 tuple2!23678) (t!44913 List!30847)) )
))
(declare-datatypes ((ListLongMap!21343 0))(
  ( (ListLongMap!21344 (toList!10687 List!30847)) )
))
(declare-fun contains!8863 (ListLongMap!21343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5658 (array!90141 array!90139 (_ BitVec 32) (_ BitVec 32) V!53865 V!53865 (_ BitVec 32) Int) ListLongMap!21343)

(assert (=> b!1331420 (= res!883104 (contains!8863 (getCurrentListMap!5658 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331421 () Bool)

(declare-fun e!759001 () Bool)

(declare-fun tp_is_empty!36571 () Bool)

(assert (=> b!1331421 (= e!759001 tp_is_empty!36571)))

(declare-fun b!1331422 () Bool)

(assert (=> b!1331422 (= e!759000 (not true))))

(declare-fun lt!591540 () ListLongMap!21343)

(assert (=> b!1331422 (contains!8863 lt!591540 k0!1153)))

(declare-datatypes ((Unit!43722 0))(
  ( (Unit!43723) )
))
(declare-fun lt!591539 () Unit!43722)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!249 ((_ BitVec 64) (_ BitVec 64) V!53865 ListLongMap!21343) Unit!43722)

(assert (=> b!1331422 (= lt!591539 (lemmaInListMapAfterAddingDiffThenInBefore!249 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591540))))

(declare-fun +!4706 (ListLongMap!21343 tuple2!23678) ListLongMap!21343)

(declare-fun getCurrentListMapNoExtraKeys!6350 (array!90141 array!90139 (_ BitVec 32) (_ BitVec 32) V!53865 V!53865 (_ BitVec 32) Int) ListLongMap!21343)

(declare-fun get!21959 (ValueCell!17387 V!53865) V!53865)

(declare-fun dynLambda!3660 (Int (_ BitVec 64)) V!53865)

(assert (=> b!1331422 (= lt!591540 (+!4706 (getCurrentListMapNoExtraKeys!6350 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23679 (select (arr!43532 _keys!1590) from!1980) (get!21959 (select (arr!43531 _values!1320) from!1980) (dynLambda!3660 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1331423 () Bool)

(declare-fun res!883103 () Bool)

(assert (=> b!1331423 (=> (not res!883103) (not e!759000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331423 (= res!883103 (validKeyInArray!0 (select (arr!43532 _keys!1590) from!1980)))))

(declare-fun b!1331424 () Bool)

(declare-fun res!883105 () Bool)

(assert (=> b!1331424 (=> (not res!883105) (not e!759000))))

(assert (=> b!1331424 (= res!883105 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331425 () Bool)

(declare-fun e!759003 () Bool)

(assert (=> b!1331425 (= e!759003 tp_is_empty!36571)))

(declare-fun b!1331426 () Bool)

(declare-fun e!759004 () Bool)

(declare-fun mapRes!56530 () Bool)

(assert (=> b!1331426 (= e!759004 (and e!759003 mapRes!56530))))

(declare-fun condMapEmpty!56530 () Bool)

(declare-fun mapDefault!56530 () ValueCell!17387)

(assert (=> b!1331426 (= condMapEmpty!56530 (= (arr!43531 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17387)) mapDefault!56530)))))

(declare-fun mapNonEmpty!56530 () Bool)

(declare-fun tp!107619 () Bool)

(assert (=> mapNonEmpty!56530 (= mapRes!56530 (and tp!107619 e!759001))))

(declare-fun mapValue!56530 () ValueCell!17387)

(declare-fun mapRest!56530 () (Array (_ BitVec 32) ValueCell!17387))

(declare-fun mapKey!56530 () (_ BitVec 32))

(assert (=> mapNonEmpty!56530 (= (arr!43531 _values!1320) (store mapRest!56530 mapKey!56530 mapValue!56530))))

(declare-fun res!883100 () Bool)

(assert (=> start!112490 (=> (not res!883100) (not e!759000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112490 (= res!883100 (validMask!0 mask!1998))))

(assert (=> start!112490 e!759000))

(declare-fun array_inv!33125 (array!90139) Bool)

(assert (=> start!112490 (and (array_inv!33125 _values!1320) e!759004)))

(assert (=> start!112490 true))

(declare-fun array_inv!33126 (array!90141) Bool)

(assert (=> start!112490 (array_inv!33126 _keys!1590)))

(assert (=> start!112490 tp!107620))

(assert (=> start!112490 tp_is_empty!36571))

(declare-fun b!1331427 () Bool)

(declare-fun res!883099 () Bool)

(assert (=> b!1331427 (=> (not res!883099) (not e!759000))))

(assert (=> b!1331427 (= res!883099 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44083 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331428 () Bool)

(declare-fun res!883098 () Bool)

(assert (=> b!1331428 (=> (not res!883098) (not e!759000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90141 (_ BitVec 32)) Bool)

(assert (=> b!1331428 (= res!883098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331429 () Bool)

(declare-fun res!883101 () Bool)

(assert (=> b!1331429 (=> (not res!883101) (not e!759000))))

(assert (=> b!1331429 (= res!883101 (not (= (select (arr!43532 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331430 () Bool)

(declare-fun res!883106 () Bool)

(assert (=> b!1331430 (=> (not res!883106) (not e!759000))))

(declare-datatypes ((List!30848 0))(
  ( (Nil!30845) (Cons!30844 (h!32062 (_ BitVec 64)) (t!44914 List!30848)) )
))
(declare-fun arrayNoDuplicates!0 (array!90141 (_ BitVec 32) List!30848) Bool)

(assert (=> b!1331430 (= res!883106 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30845))))

(declare-fun mapIsEmpty!56530 () Bool)

(assert (=> mapIsEmpty!56530 mapRes!56530))

(declare-fun b!1331431 () Bool)

(declare-fun res!883102 () Bool)

(assert (=> b!1331431 (=> (not res!883102) (not e!759000))))

(assert (=> b!1331431 (= res!883102 (and (= (size!44082 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44083 _keys!1590) (size!44082 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112490 res!883100) b!1331431))

(assert (= (and b!1331431 res!883102) b!1331428))

(assert (= (and b!1331428 res!883098) b!1331430))

(assert (= (and b!1331430 res!883106) b!1331427))

(assert (= (and b!1331427 res!883099) b!1331420))

(assert (= (and b!1331420 res!883104) b!1331429))

(assert (= (and b!1331429 res!883101) b!1331423))

(assert (= (and b!1331423 res!883103) b!1331424))

(assert (= (and b!1331424 res!883105) b!1331422))

(assert (= (and b!1331426 condMapEmpty!56530) mapIsEmpty!56530))

(assert (= (and b!1331426 (not condMapEmpty!56530)) mapNonEmpty!56530))

(get-info :version)

(assert (= (and mapNonEmpty!56530 ((_ is ValueCellFull!17387) mapValue!56530)) b!1331421))

(assert (= (and b!1331426 ((_ is ValueCellFull!17387) mapDefault!56530)) b!1331425))

(assert (= start!112490 b!1331426))

(declare-fun b_lambda!23915 () Bool)

(assert (=> (not b_lambda!23915) (not b!1331422)))

(declare-fun t!44912 () Bool)

(declare-fun tb!11869 () Bool)

(assert (=> (and start!112490 (= defaultEntry!1323 defaultEntry!1323) t!44912) tb!11869))

(declare-fun result!24817 () Bool)

(assert (=> tb!11869 (= result!24817 tp_is_empty!36571)))

(assert (=> b!1331422 t!44912))

(declare-fun b_and!49381 () Bool)

(assert (= b_and!49379 (and (=> t!44912 result!24817) b_and!49381)))

(declare-fun m!1220405 () Bool)

(assert (=> start!112490 m!1220405))

(declare-fun m!1220407 () Bool)

(assert (=> start!112490 m!1220407))

(declare-fun m!1220409 () Bool)

(assert (=> start!112490 m!1220409))

(declare-fun m!1220411 () Bool)

(assert (=> b!1331420 m!1220411))

(assert (=> b!1331420 m!1220411))

(declare-fun m!1220413 () Bool)

(assert (=> b!1331420 m!1220413))

(declare-fun m!1220415 () Bool)

(assert (=> b!1331422 m!1220415))

(declare-fun m!1220417 () Bool)

(assert (=> b!1331422 m!1220417))

(declare-fun m!1220419 () Bool)

(assert (=> b!1331422 m!1220419))

(declare-fun m!1220421 () Bool)

(assert (=> b!1331422 m!1220421))

(assert (=> b!1331422 m!1220415))

(declare-fun m!1220423 () Bool)

(assert (=> b!1331422 m!1220423))

(declare-fun m!1220425 () Bool)

(assert (=> b!1331422 m!1220425))

(assert (=> b!1331422 m!1220417))

(assert (=> b!1331422 m!1220421))

(declare-fun m!1220427 () Bool)

(assert (=> b!1331422 m!1220427))

(declare-fun m!1220429 () Bool)

(assert (=> b!1331422 m!1220429))

(declare-fun m!1220431 () Bool)

(assert (=> b!1331430 m!1220431))

(declare-fun m!1220433 () Bool)

(assert (=> mapNonEmpty!56530 m!1220433))

(assert (=> b!1331429 m!1220429))

(assert (=> b!1331423 m!1220429))

(assert (=> b!1331423 m!1220429))

(declare-fun m!1220435 () Bool)

(assert (=> b!1331423 m!1220435))

(declare-fun m!1220437 () Bool)

(assert (=> b!1331428 m!1220437))

(check-sat (not b_next!30661) (not b!1331423) (not b!1331430) tp_is_empty!36571 b_and!49381 (not b_lambda!23915) (not mapNonEmpty!56530) (not b!1331428) (not b!1331422) (not b!1331420) (not start!112490))
(check-sat b_and!49381 (not b_next!30661))
