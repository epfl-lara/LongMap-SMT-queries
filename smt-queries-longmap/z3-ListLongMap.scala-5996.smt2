; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77810 () Bool)

(assert start!77810)

(declare-fun b_free!16387 () Bool)

(declare-fun b_next!16387 () Bool)

(assert (=> start!77810 (= b_free!16387 (not b_next!16387))))

(declare-fun tp!57427 () Bool)

(declare-fun b_and!26905 () Bool)

(assert (=> start!77810 (= tp!57427 b_and!26905)))

(declare-fun b!908357 () Bool)

(declare-fun res!613153 () Bool)

(declare-fun e!509095 () Bool)

(assert (=> b!908357 (=> (not res!613153) (not e!509095))))

(declare-datatypes ((array!53623 0))(
  ( (array!53624 (arr!25770 (Array (_ BitVec 32) (_ BitVec 64))) (size!26231 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53623)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53623 (_ BitVec 32)) Bool)

(assert (=> b!908357 (= res!613153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29923 () Bool)

(declare-fun mapRes!29923 () Bool)

(assert (=> mapIsEmpty!29923 mapRes!29923))

(declare-fun b!908358 () Bool)

(declare-fun res!613151 () Bool)

(declare-fun e!509097 () Bool)

(assert (=> b!908358 (=> (not res!613151) (not e!509097))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908358 (= res!613151 (inRange!0 i!717 mask!1756))))

(declare-fun b!908359 () Bool)

(declare-fun e!509092 () Bool)

(assert (=> b!908359 (= e!509097 (not e!509092))))

(declare-fun res!613145 () Bool)

(assert (=> b!908359 (=> res!613145 e!509092)))

(assert (=> b!908359 (= res!613145 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26231 _keys!1386))))))

(declare-datatypes ((V!30039 0))(
  ( (V!30040 (val!9453 Int)) )
))
(declare-datatypes ((ValueCell!8921 0))(
  ( (ValueCellFull!8921 (v!11959 V!30039)) (EmptyCell!8921) )
))
(declare-datatypes ((array!53625 0))(
  ( (array!53626 (arr!25771 (Array (_ BitVec 32) ValueCell!8921)) (size!26232 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53625)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409539 () V!30039)

(declare-fun get!13568 (ValueCell!8921 V!30039) V!30039)

(declare-fun dynLambda!1370 (Int (_ BitVec 64)) V!30039)

(assert (=> b!908359 (= lt!409539 (get!13568 (select (arr!25771 _values!1152) i!717) (dynLambda!1370 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908359 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30039)

(declare-datatypes ((Unit!30764 0))(
  ( (Unit!30765) )
))
(declare-fun lt!409536 () Unit!30764)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30039)

(declare-fun lemmaKeyInListMapIsInArray!246 (array!53623 array!53625 (_ BitVec 32) (_ BitVec 32) V!30039 V!30039 (_ BitVec 64) Int) Unit!30764)

(assert (=> b!908359 (= lt!409536 (lemmaKeyInListMapIsInArray!246 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908360 () Bool)

(assert (=> b!908360 (= e!509095 e!509097)))

(declare-fun res!613150 () Bool)

(assert (=> b!908360 (=> (not res!613150) (not e!509097))))

(declare-datatypes ((tuple2!12350 0))(
  ( (tuple2!12351 (_1!6186 (_ BitVec 64)) (_2!6186 V!30039)) )
))
(declare-datatypes ((List!18130 0))(
  ( (Nil!18127) (Cons!18126 (h!19272 tuple2!12350) (t!25680 List!18130)) )
))
(declare-datatypes ((ListLongMap!11037 0))(
  ( (ListLongMap!11038 (toList!5534 List!18130)) )
))
(declare-fun lt!409538 () ListLongMap!11037)

(declare-fun contains!4533 (ListLongMap!11037 (_ BitVec 64)) Bool)

(assert (=> b!908360 (= res!613150 (contains!4533 lt!409538 k0!1033))))

(declare-fun getCurrentListMap!2736 (array!53623 array!53625 (_ BitVec 32) (_ BitVec 32) V!30039 V!30039 (_ BitVec 32) Int) ListLongMap!11037)

(assert (=> b!908360 (= lt!409538 (getCurrentListMap!2736 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908361 () Bool)

(declare-fun res!613147 () Bool)

(assert (=> b!908361 (=> (not res!613147) (not e!509095))))

(assert (=> b!908361 (= res!613147 (and (= (size!26232 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26231 _keys!1386) (size!26232 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908362 () Bool)

(declare-fun e!509093 () Bool)

(declare-fun tp_is_empty!18805 () Bool)

(assert (=> b!908362 (= e!509093 tp_is_empty!18805)))

(declare-fun res!613144 () Bool)

(assert (=> start!77810 (=> (not res!613144) (not e!509095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77810 (= res!613144 (validMask!0 mask!1756))))

(assert (=> start!77810 e!509095))

(declare-fun e!509096 () Bool)

(declare-fun array_inv!20216 (array!53625) Bool)

(assert (=> start!77810 (and (array_inv!20216 _values!1152) e!509096)))

(assert (=> start!77810 tp!57427))

(assert (=> start!77810 true))

(assert (=> start!77810 tp_is_empty!18805))

(declare-fun array_inv!20217 (array!53623) Bool)

(assert (=> start!77810 (array_inv!20217 _keys!1386)))

(declare-fun b!908363 () Bool)

(declare-fun e!509098 () Bool)

(assert (=> b!908363 (= e!509092 e!509098)))

(declare-fun res!613152 () Bool)

(assert (=> b!908363 (=> res!613152 e!509098)))

(declare-fun lt!409535 () ListLongMap!11037)

(assert (=> b!908363 (= res!613152 (not (contains!4533 lt!409535 k0!1033)))))

(assert (=> b!908363 (= lt!409535 (getCurrentListMap!2736 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908364 () Bool)

(assert (=> b!908364 (= e!509096 (and e!509093 mapRes!29923))))

(declare-fun condMapEmpty!29923 () Bool)

(declare-fun mapDefault!29923 () ValueCell!8921)

(assert (=> b!908364 (= condMapEmpty!29923 (= (arr!25771 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8921)) mapDefault!29923)))))

(declare-fun b!908365 () Bool)

(declare-fun res!613146 () Bool)

(assert (=> b!908365 (=> (not res!613146) (not e!509097))))

(assert (=> b!908365 (= res!613146 (and (= (select (arr!25770 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908366 () Bool)

(declare-fun e!509094 () Bool)

(assert (=> b!908366 (= e!509094 tp_is_empty!18805)))

(declare-fun mapNonEmpty!29923 () Bool)

(declare-fun tp!57426 () Bool)

(assert (=> mapNonEmpty!29923 (= mapRes!29923 (and tp!57426 e!509094))))

(declare-fun mapValue!29923 () ValueCell!8921)

(declare-fun mapKey!29923 () (_ BitVec 32))

(declare-fun mapRest!29923 () (Array (_ BitVec 32) ValueCell!8921))

(assert (=> mapNonEmpty!29923 (= (arr!25771 _values!1152) (store mapRest!29923 mapKey!29923 mapValue!29923))))

(declare-fun b!908367 () Bool)

(declare-fun res!613148 () Bool)

(assert (=> b!908367 (=> (not res!613148) (not e!509095))))

(declare-datatypes ((List!18131 0))(
  ( (Nil!18128) (Cons!18127 (h!19273 (_ BitVec 64)) (t!25681 List!18131)) )
))
(declare-fun arrayNoDuplicates!0 (array!53623 (_ BitVec 32) List!18131) Bool)

(assert (=> b!908367 (= res!613148 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18128))))

(declare-fun b!908368 () Bool)

(assert (=> b!908368 (= e!509098 true)))

(declare-fun apply!506 (ListLongMap!11037 (_ BitVec 64)) V!30039)

(assert (=> b!908368 (= (apply!506 lt!409538 k0!1033) lt!409539)))

(declare-fun lt!409537 () Unit!30764)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!62 (array!53623 array!53625 (_ BitVec 32) (_ BitVec 32) V!30039 V!30039 (_ BitVec 64) V!30039 (_ BitVec 32) Int) Unit!30764)

(assert (=> b!908368 (= lt!409537 (lemmaListMapApplyFromThenApplyFromZero!62 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409539 i!717 defaultEntry!1160))))

(declare-fun b!908369 () Bool)

(declare-fun res!613149 () Bool)

(assert (=> b!908369 (=> res!613149 e!509098)))

(assert (=> b!908369 (= res!613149 (not (= (apply!506 lt!409535 k0!1033) lt!409539)))))

(assert (= (and start!77810 res!613144) b!908361))

(assert (= (and b!908361 res!613147) b!908357))

(assert (= (and b!908357 res!613153) b!908367))

(assert (= (and b!908367 res!613148) b!908360))

(assert (= (and b!908360 res!613150) b!908358))

(assert (= (and b!908358 res!613151) b!908365))

(assert (= (and b!908365 res!613146) b!908359))

(assert (= (and b!908359 (not res!613145)) b!908363))

(assert (= (and b!908363 (not res!613152)) b!908369))

(assert (= (and b!908369 (not res!613149)) b!908368))

(assert (= (and b!908364 condMapEmpty!29923) mapIsEmpty!29923))

(assert (= (and b!908364 (not condMapEmpty!29923)) mapNonEmpty!29923))

(get-info :version)

(assert (= (and mapNonEmpty!29923 ((_ is ValueCellFull!8921) mapValue!29923)) b!908366))

(assert (= (and b!908364 ((_ is ValueCellFull!8921) mapDefault!29923)) b!908362))

(assert (= start!77810 b!908364))

(declare-fun b_lambda!13253 () Bool)

(assert (=> (not b_lambda!13253) (not b!908359)))

(declare-fun t!25679 () Bool)

(declare-fun tb!5401 () Bool)

(assert (=> (and start!77810 (= defaultEntry!1160 defaultEntry!1160) t!25679) tb!5401))

(declare-fun result!10607 () Bool)

(assert (=> tb!5401 (= result!10607 tp_is_empty!18805)))

(assert (=> b!908359 t!25679))

(declare-fun b_and!26907 () Bool)

(assert (= b_and!26905 (and (=> t!25679 result!10607) b_and!26907)))

(declare-fun m!843171 () Bool)

(assert (=> start!77810 m!843171))

(declare-fun m!843173 () Bool)

(assert (=> start!77810 m!843173))

(declare-fun m!843175 () Bool)

(assert (=> start!77810 m!843175))

(declare-fun m!843177 () Bool)

(assert (=> b!908368 m!843177))

(declare-fun m!843179 () Bool)

(assert (=> b!908368 m!843179))

(declare-fun m!843181 () Bool)

(assert (=> b!908369 m!843181))

(declare-fun m!843183 () Bool)

(assert (=> b!908359 m!843183))

(declare-fun m!843185 () Bool)

(assert (=> b!908359 m!843185))

(declare-fun m!843187 () Bool)

(assert (=> b!908359 m!843187))

(declare-fun m!843189 () Bool)

(assert (=> b!908359 m!843189))

(assert (=> b!908359 m!843183))

(assert (=> b!908359 m!843187))

(declare-fun m!843191 () Bool)

(assert (=> b!908359 m!843191))

(declare-fun m!843193 () Bool)

(assert (=> b!908365 m!843193))

(declare-fun m!843195 () Bool)

(assert (=> b!908363 m!843195))

(declare-fun m!843197 () Bool)

(assert (=> b!908363 m!843197))

(declare-fun m!843199 () Bool)

(assert (=> mapNonEmpty!29923 m!843199))

(declare-fun m!843201 () Bool)

(assert (=> b!908357 m!843201))

(declare-fun m!843203 () Bool)

(assert (=> b!908360 m!843203))

(declare-fun m!843205 () Bool)

(assert (=> b!908360 m!843205))

(declare-fun m!843207 () Bool)

(assert (=> b!908367 m!843207))

(declare-fun m!843209 () Bool)

(assert (=> b!908358 m!843209))

(check-sat (not b!908357) (not b_next!16387) b_and!26907 (not start!77810) tp_is_empty!18805 (not b!908363) (not b!908367) (not mapNonEmpty!29923) (not b!908360) (not b_lambda!13253) (not b!908358) (not b!908369) (not b!908359) (not b!908368))
(check-sat b_and!26907 (not b_next!16387))
