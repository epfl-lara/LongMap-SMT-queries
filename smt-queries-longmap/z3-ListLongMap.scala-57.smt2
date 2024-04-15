; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!854 () Bool)

(assert start!854)

(declare-fun b_free!247 () Bool)

(declare-fun b_next!247 () Bool)

(assert (=> start!854 (= b_free!247 (not b_next!247))))

(declare-fun tp!970 () Bool)

(declare-fun b_and!393 () Bool)

(assert (=> start!854 (= tp!970 b_and!393)))

(declare-fun b!6997 () Bool)

(declare-fun e!3870 () Bool)

(declare-fun e!3873 () Bool)

(assert (=> b!6997 (= e!3870 (not e!3873))))

(declare-fun res!7174 () Bool)

(assert (=> b!6997 (=> res!7174 e!3873)))

(declare-datatypes ((array!573 0))(
  ( (array!574 (arr!275 (Array (_ BitVec 32) (_ BitVec 64))) (size!337 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!573)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6997 (= res!7174 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3874 () Bool)

(assert (=> b!6997 e!3874))

(declare-fun c!503 () Bool)

(assert (=> b!6997 (= c!503 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!611 0))(
  ( (V!612 (val!168 Int)) )
))
(declare-datatypes ((ValueCell!146 0))(
  ( (ValueCellFull!146 (v!1259 V!611)) (EmptyCell!146) )
))
(declare-datatypes ((array!575 0))(
  ( (array!576 (arr!276 (Array (_ BitVec 32) ValueCell!146)) (size!338 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!575)

(declare-fun minValue!1434 () V!611)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!611)

(declare-datatypes ((Unit!129 0))(
  ( (Unit!130) )
))
(declare-fun lt!1391 () Unit!129)

(declare-fun lemmaKeyInListMapIsInArray!47 (array!573 array!575 (_ BitVec 32) (_ BitVec 32) V!611 V!611 (_ BitVec 64) Int) Unit!129)

(assert (=> b!6997 (= lt!1391 (lemmaKeyInListMapIsInArray!47 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6998 () Bool)

(assert (=> b!6998 (= e!3874 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6999 () Bool)

(declare-fun res!7170 () Bool)

(assert (=> b!6999 (=> (not res!7170) (not e!3870))))

(declare-datatypes ((List!184 0))(
  ( (Nil!181) (Cons!180 (h!746 (_ BitVec 64)) (t!2319 List!184)) )
))
(declare-fun arrayNoDuplicates!0 (array!573 (_ BitVec 32) List!184) Bool)

(assert (=> b!6999 (= res!7170 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!181))))

(declare-fun b!7000 () Bool)

(assert (=> b!7000 (= e!3874 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!7001 () Bool)

(declare-fun e!3869 () Bool)

(assert (=> b!7001 (= e!3869 true)))

(declare-datatypes ((SeekEntryResult!29 0))(
  ( (MissingZero!29 (index!2235 (_ BitVec 32))) (Found!29 (index!2236 (_ BitVec 32))) (Intermediate!29 (undefined!841 Bool) (index!2237 (_ BitVec 32)) (x!2575 (_ BitVec 32))) (Undefined!29) (MissingVacant!29 (index!2238 (_ BitVec 32))) )
))
(declare-fun lt!1393 () SeekEntryResult!29)

(declare-fun lt!1394 () (_ BitVec 32))

(get-info :version)

(assert (=> b!7001 (and ((_ is Found!29) lt!1393) (= (index!2236 lt!1393) lt!1394))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!573 (_ BitVec 32)) SeekEntryResult!29)

(assert (=> b!7001 (= lt!1393 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!1395 () Unit!129)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!573 (_ BitVec 32)) Unit!129)

(assert (=> b!7001 (= lt!1395 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!1394 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!458 () Bool)

(declare-fun mapRes!458 () Bool)

(declare-fun tp!971 () Bool)

(declare-fun e!3871 () Bool)

(assert (=> mapNonEmpty!458 (= mapRes!458 (and tp!971 e!3871))))

(declare-fun mapRest!458 () (Array (_ BitVec 32) ValueCell!146))

(declare-fun mapValue!458 () ValueCell!146)

(declare-fun mapKey!458 () (_ BitVec 32))

(assert (=> mapNonEmpty!458 (= (arr!276 _values!1492) (store mapRest!458 mapKey!458 mapValue!458))))

(declare-fun b!7002 () Bool)

(declare-fun res!7172 () Bool)

(assert (=> b!7002 (=> (not res!7172) (not e!3870))))

(assert (=> b!7002 (= res!7172 (and (= (size!338 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!337 _keys!1806) (size!338 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7003 () Bool)

(declare-fun res!7175 () Bool)

(assert (=> b!7003 (=> (not res!7175) (not e!3870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!7003 (= res!7175 (validKeyInArray!0 k0!1278))))

(declare-fun res!7173 () Bool)

(assert (=> start!854 (=> (not res!7173) (not e!3870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!854 (= res!7173 (validMask!0 mask!2250))))

(assert (=> start!854 e!3870))

(assert (=> start!854 tp!970))

(assert (=> start!854 true))

(declare-fun e!3868 () Bool)

(declare-fun array_inv!197 (array!575) Bool)

(assert (=> start!854 (and (array_inv!197 _values!1492) e!3868)))

(declare-fun tp_is_empty!325 () Bool)

(assert (=> start!854 tp_is_empty!325))

(declare-fun array_inv!198 (array!573) Bool)

(assert (=> start!854 (array_inv!198 _keys!1806)))

(declare-fun b!7004 () Bool)

(assert (=> b!7004 (= e!3871 tp_is_empty!325)))

(declare-fun b!7005 () Bool)

(declare-fun res!7171 () Bool)

(assert (=> b!7005 (=> res!7171 e!3869)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!573 (_ BitVec 32)) SeekEntryResult!29)

(assert (=> b!7005 (= res!7171 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!29 lt!1394))))))

(declare-fun b!7006 () Bool)

(declare-fun res!7169 () Bool)

(assert (=> b!7006 (=> (not res!7169) (not e!3870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!573 (_ BitVec 32)) Bool)

(assert (=> b!7006 (= res!7169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7007 () Bool)

(declare-fun e!3872 () Bool)

(assert (=> b!7007 (= e!3868 (and e!3872 mapRes!458))))

(declare-fun condMapEmpty!458 () Bool)

(declare-fun mapDefault!458 () ValueCell!146)

(assert (=> b!7007 (= condMapEmpty!458 (= (arr!276 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!146)) mapDefault!458)))))

(declare-fun b!7008 () Bool)

(declare-fun res!7176 () Bool)

(assert (=> b!7008 (=> (not res!7176) (not e!3870))))

(declare-datatypes ((tuple2!174 0))(
  ( (tuple2!175 (_1!87 (_ BitVec 64)) (_2!87 V!611)) )
))
(declare-datatypes ((List!185 0))(
  ( (Nil!182) (Cons!181 (h!747 tuple2!174) (t!2320 List!185)) )
))
(declare-datatypes ((ListLongMap!179 0))(
  ( (ListLongMap!180 (toList!105 List!185)) )
))
(declare-fun contains!79 (ListLongMap!179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!64 (array!573 array!575 (_ BitVec 32) (_ BitVec 32) V!611 V!611 (_ BitVec 32) Int) ListLongMap!179)

(assert (=> b!7008 (= res!7176 (contains!79 (getCurrentListMap!64 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!458 () Bool)

(assert (=> mapIsEmpty!458 mapRes!458))

(declare-fun b!7009 () Bool)

(assert (=> b!7009 (= e!3873 e!3869)))

(declare-fun res!7177 () Bool)

(assert (=> b!7009 (=> res!7177 e!3869)))

(assert (=> b!7009 (= res!7177 (not (= (size!337 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!7009 (arrayForallSeekEntryOrOpenFound!0 lt!1394 _keys!1806 mask!2250)))

(declare-fun lt!1392 () Unit!129)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!129)

(assert (=> b!7009 (= lt!1392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1394))))

(declare-fun arrayScanForKey!0 (array!573 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!7009 (= lt!1394 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!7010 () Bool)

(assert (=> b!7010 (= e!3872 tp_is_empty!325)))

(assert (= (and start!854 res!7173) b!7002))

(assert (= (and b!7002 res!7172) b!7006))

(assert (= (and b!7006 res!7169) b!6999))

(assert (= (and b!6999 res!7170) b!7008))

(assert (= (and b!7008 res!7176) b!7003))

(assert (= (and b!7003 res!7175) b!6997))

(assert (= (and b!6997 c!503) b!7000))

(assert (= (and b!6997 (not c!503)) b!6998))

(assert (= (and b!6997 (not res!7174)) b!7009))

(assert (= (and b!7009 (not res!7177)) b!7005))

(assert (= (and b!7005 (not res!7171)) b!7001))

(assert (= (and b!7007 condMapEmpty!458) mapIsEmpty!458))

(assert (= (and b!7007 (not condMapEmpty!458)) mapNonEmpty!458))

(assert (= (and mapNonEmpty!458 ((_ is ValueCellFull!146) mapValue!458)) b!7004))

(assert (= (and b!7007 ((_ is ValueCellFull!146) mapDefault!458)) b!7010))

(assert (= start!854 b!7007))

(declare-fun m!4151 () Bool)

(assert (=> b!7006 m!4151))

(declare-fun m!4153 () Bool)

(assert (=> b!7003 m!4153))

(declare-fun m!4155 () Bool)

(assert (=> b!7008 m!4155))

(assert (=> b!7008 m!4155))

(declare-fun m!4157 () Bool)

(assert (=> b!7008 m!4157))

(declare-fun m!4159 () Bool)

(assert (=> start!854 m!4159))

(declare-fun m!4161 () Bool)

(assert (=> start!854 m!4161))

(declare-fun m!4163 () Bool)

(assert (=> start!854 m!4163))

(declare-fun m!4165 () Bool)

(assert (=> mapNonEmpty!458 m!4165))

(declare-fun m!4167 () Bool)

(assert (=> b!6999 m!4167))

(declare-fun m!4169 () Bool)

(assert (=> b!7000 m!4169))

(declare-fun m!4171 () Bool)

(assert (=> b!7009 m!4171))

(declare-fun m!4173 () Bool)

(assert (=> b!7009 m!4173))

(declare-fun m!4175 () Bool)

(assert (=> b!7009 m!4175))

(assert (=> b!6997 m!4169))

(declare-fun m!4177 () Bool)

(assert (=> b!6997 m!4177))

(declare-fun m!4179 () Bool)

(assert (=> b!7001 m!4179))

(declare-fun m!4181 () Bool)

(assert (=> b!7001 m!4181))

(declare-fun m!4183 () Bool)

(assert (=> b!7005 m!4183))

(check-sat (not b!7001) b_and!393 (not b!7008) (not mapNonEmpty!458) (not b!7003) (not b!6999) (not start!854) (not b!6997) tp_is_empty!325 (not b!7000) (not b!7005) (not b!7009) (not b_next!247) (not b!7006))
(check-sat b_and!393 (not b_next!247))
