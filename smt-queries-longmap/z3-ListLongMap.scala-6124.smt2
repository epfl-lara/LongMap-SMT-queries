; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78854 () Bool)

(assert start!78854)

(declare-fun b_free!17067 () Bool)

(declare-fun b_next!17067 () Bool)

(assert (=> start!78854 (= b_free!17067 (not b_next!17067))))

(declare-fun tp!59642 () Bool)

(declare-fun b_and!27871 () Bool)

(assert (=> start!78854 (= tp!59642 b_and!27871)))

(declare-fun res!621221 () Bool)

(declare-fun e!516962 () Bool)

(assert (=> start!78854 (=> (not res!621221) (not e!516962))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78854 (= res!621221 (validMask!0 mask!1881))))

(assert (=> start!78854 e!516962))

(assert (=> start!78854 true))

(declare-fun tp_is_empty!19575 () Bool)

(assert (=> start!78854 tp_is_empty!19575))

(declare-datatypes ((V!31065 0))(
  ( (V!31066 (val!9838 Int)) )
))
(declare-datatypes ((ValueCell!9306 0))(
  ( (ValueCellFull!9306 (v!12356 V!31065)) (EmptyCell!9306) )
))
(declare-datatypes ((array!55130 0))(
  ( (array!55131 (arr!26510 (Array (_ BitVec 32) ValueCell!9306)) (size!26969 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55130)

(declare-fun e!516964 () Bool)

(declare-fun array_inv!20658 (array!55130) Bool)

(assert (=> start!78854 (and (array_inv!20658 _values!1231) e!516964)))

(assert (=> start!78854 tp!59642))

(declare-datatypes ((array!55132 0))(
  ( (array!55133 (arr!26511 (Array (_ BitVec 32) (_ BitVec 64))) (size!26970 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55132)

(declare-fun array_inv!20659 (array!55132) Bool)

(assert (=> start!78854 (array_inv!20659 _keys!1487)))

(declare-fun mapIsEmpty!31119 () Bool)

(declare-fun mapRes!31119 () Bool)

(assert (=> mapIsEmpty!31119 mapRes!31119))

(declare-fun b!921203 () Bool)

(declare-fun e!516970 () Bool)

(assert (=> b!921203 (= e!516970 true)))

(declare-fun lt!413585 () Bool)

(declare-datatypes ((List!18597 0))(
  ( (Nil!18594) (Cons!18593 (h!19739 (_ BitVec 64)) (t!26394 List!18597)) )
))
(declare-fun contains!4817 (List!18597 (_ BitVec 64)) Bool)

(assert (=> b!921203 (= lt!413585 (contains!4817 Nil!18594 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921204 () Bool)

(declare-fun res!621231 () Bool)

(assert (=> b!921204 (=> (not res!621231) (not e!516962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55132 (_ BitVec 32)) Bool)

(assert (=> b!921204 (= res!621231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921205 () Bool)

(declare-fun e!516969 () Bool)

(assert (=> b!921205 (= e!516962 e!516969)))

(declare-fun res!621230 () Bool)

(assert (=> b!921205 (=> (not res!621230) (not e!516969))))

(declare-datatypes ((tuple2!12794 0))(
  ( (tuple2!12795 (_1!6408 (_ BitVec 64)) (_2!6408 V!31065)) )
))
(declare-datatypes ((List!18598 0))(
  ( (Nil!18595) (Cons!18594 (h!19740 tuple2!12794) (t!26395 List!18598)) )
))
(declare-datatypes ((ListLongMap!11491 0))(
  ( (ListLongMap!11492 (toList!5761 List!18598)) )
))
(declare-fun lt!413579 () ListLongMap!11491)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4818 (ListLongMap!11491 (_ BitVec 64)) Bool)

(assert (=> b!921205 (= res!621230 (contains!4818 lt!413579 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31065)

(declare-fun minValue!1173 () V!31065)

(declare-fun getCurrentListMap!3015 (array!55132 array!55130 (_ BitVec 32) (_ BitVec 32) V!31065 V!31065 (_ BitVec 32) Int) ListLongMap!11491)

(assert (=> b!921205 (= lt!413579 (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921206 () Bool)

(declare-fun e!516968 () Bool)

(assert (=> b!921206 (= e!516968 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921207 () Bool)

(declare-fun e!516966 () Bool)

(assert (=> b!921207 (= e!516969 e!516966)))

(declare-fun res!621224 () Bool)

(assert (=> b!921207 (=> (not res!621224) (not e!516966))))

(declare-fun lt!413584 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921207 (= res!621224 (validKeyInArray!0 lt!413584))))

(assert (=> b!921207 (= lt!413584 (select (arr!26511 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921208 () Bool)

(declare-fun res!621225 () Bool)

(assert (=> b!921208 (=> (not res!621225) (not e!516962))))

(declare-fun arrayNoDuplicates!0 (array!55132 (_ BitVec 32) List!18597) Bool)

(assert (=> b!921208 (= res!621225 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18594))))

(declare-fun b!921209 () Bool)

(declare-fun e!516967 () Bool)

(assert (=> b!921209 (= e!516967 tp_is_empty!19575)))

(declare-fun b!921210 () Bool)

(declare-fun res!621229 () Bool)

(assert (=> b!921210 (=> (not res!621229) (not e!516969))))

(assert (=> b!921210 (= res!621229 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921211 () Bool)

(declare-fun arrayContainsKey!0 (array!55132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921211 (= e!516968 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921212 () Bool)

(declare-fun res!621226 () Bool)

(assert (=> b!921212 (=> res!621226 e!516970)))

(declare-fun noDuplicate!1342 (List!18597) Bool)

(assert (=> b!921212 (= res!621226 (not (noDuplicate!1342 Nil!18594)))))

(declare-fun b!921213 () Bool)

(declare-fun res!621227 () Bool)

(assert (=> b!921213 (=> res!621227 e!516970)))

(assert (=> b!921213 (= res!621227 (contains!4817 Nil!18594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921214 () Bool)

(declare-fun e!516965 () Bool)

(assert (=> b!921214 (= e!516965 tp_is_empty!19575)))

(declare-fun b!921215 () Bool)

(assert (=> b!921215 (= e!516964 (and e!516965 mapRes!31119))))

(declare-fun condMapEmpty!31119 () Bool)

(declare-fun mapDefault!31119 () ValueCell!9306)

(assert (=> b!921215 (= condMapEmpty!31119 (= (arr!26510 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9306)) mapDefault!31119)))))

(declare-fun b!921216 () Bool)

(assert (=> b!921216 (= e!516966 (not e!516970))))

(declare-fun res!621220 () Bool)

(assert (=> b!921216 (=> res!621220 e!516970)))

(assert (=> b!921216 (= res!621220 (or (bvsge (size!26970 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26970 _keys!1487))))))

(assert (=> b!921216 e!516968))

(declare-fun c!96102 () Bool)

(assert (=> b!921216 (= c!96102 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31084 0))(
  ( (Unit!31085) )
))
(declare-fun lt!413581 () Unit!31084)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!175 (array!55132 array!55130 (_ BitVec 32) (_ BitVec 32) V!31065 V!31065 (_ BitVec 64) (_ BitVec 32) Int) Unit!31084)

(assert (=> b!921216 (= lt!413581 (lemmaListMapContainsThenArrayContainsFrom!175 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921216 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18594)))

(declare-fun lt!413580 () Unit!31084)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55132 (_ BitVec 32) (_ BitVec 32)) Unit!31084)

(assert (=> b!921216 (= lt!413580 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413586 () tuple2!12794)

(declare-fun +!2668 (ListLongMap!11491 tuple2!12794) ListLongMap!11491)

(assert (=> b!921216 (contains!4818 (+!2668 lt!413579 lt!413586) k0!1099)))

(declare-fun lt!413587 () Unit!31084)

(declare-fun lt!413583 () V!31065)

(declare-fun addStillContains!392 (ListLongMap!11491 (_ BitVec 64) V!31065 (_ BitVec 64)) Unit!31084)

(assert (=> b!921216 (= lt!413587 (addStillContains!392 lt!413579 lt!413584 lt!413583 k0!1099))))

(assert (=> b!921216 (= (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2668 (getCurrentListMap!3015 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413586))))

(assert (=> b!921216 (= lt!413586 (tuple2!12795 lt!413584 lt!413583))))

(declare-fun get!13913 (ValueCell!9306 V!31065) V!31065)

(declare-fun dynLambda!1457 (Int (_ BitVec 64)) V!31065)

(assert (=> b!921216 (= lt!413583 (get!13913 (select (arr!26510 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1457 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413582 () Unit!31084)

(declare-fun lemmaListMapRecursiveValidKeyArray!58 (array!55132 array!55130 (_ BitVec 32) (_ BitVec 32) V!31065 V!31065 (_ BitVec 32) Int) Unit!31084)

(assert (=> b!921216 (= lt!413582 (lemmaListMapRecursiveValidKeyArray!58 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921217 () Bool)

(declare-fun res!621232 () Bool)

(assert (=> b!921217 (=> (not res!621232) (not e!516969))))

(declare-fun v!791 () V!31065)

(declare-fun apply!601 (ListLongMap!11491 (_ BitVec 64)) V!31065)

(assert (=> b!921217 (= res!621232 (= (apply!601 lt!413579 k0!1099) v!791))))

(declare-fun b!921218 () Bool)

(declare-fun res!621223 () Bool)

(assert (=> b!921218 (=> (not res!621223) (not e!516969))))

(assert (=> b!921218 (= res!621223 (validKeyInArray!0 k0!1099))))

(declare-fun b!921219 () Bool)

(declare-fun res!621222 () Bool)

(assert (=> b!921219 (=> (not res!621222) (not e!516962))))

(assert (=> b!921219 (= res!621222 (and (= (size!26969 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26970 _keys!1487) (size!26969 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31119 () Bool)

(declare-fun tp!59641 () Bool)

(assert (=> mapNonEmpty!31119 (= mapRes!31119 (and tp!59641 e!516967))))

(declare-fun mapKey!31119 () (_ BitVec 32))

(declare-fun mapValue!31119 () ValueCell!9306)

(declare-fun mapRest!31119 () (Array (_ BitVec 32) ValueCell!9306))

(assert (=> mapNonEmpty!31119 (= (arr!26510 _values!1231) (store mapRest!31119 mapKey!31119 mapValue!31119))))

(declare-fun b!921220 () Bool)

(declare-fun res!621228 () Bool)

(assert (=> b!921220 (=> (not res!621228) (not e!516962))))

(assert (=> b!921220 (= res!621228 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26970 _keys!1487))))))

(assert (= (and start!78854 res!621221) b!921219))

(assert (= (and b!921219 res!621222) b!921204))

(assert (= (and b!921204 res!621231) b!921208))

(assert (= (and b!921208 res!621225) b!921220))

(assert (= (and b!921220 res!621228) b!921205))

(assert (= (and b!921205 res!621230) b!921217))

(assert (= (and b!921217 res!621232) b!921210))

(assert (= (and b!921210 res!621229) b!921218))

(assert (= (and b!921218 res!621223) b!921207))

(assert (= (and b!921207 res!621224) b!921216))

(assert (= (and b!921216 c!96102) b!921211))

(assert (= (and b!921216 (not c!96102)) b!921206))

(assert (= (and b!921216 (not res!621220)) b!921212))

(assert (= (and b!921212 (not res!621226)) b!921213))

(assert (= (and b!921213 (not res!621227)) b!921203))

(assert (= (and b!921215 condMapEmpty!31119) mapIsEmpty!31119))

(assert (= (and b!921215 (not condMapEmpty!31119)) mapNonEmpty!31119))

(get-info :version)

(assert (= (and mapNonEmpty!31119 ((_ is ValueCellFull!9306) mapValue!31119)) b!921209))

(assert (= (and b!921215 ((_ is ValueCellFull!9306) mapDefault!31119)) b!921214))

(assert (= start!78854 b!921215))

(declare-fun b_lambda!13569 () Bool)

(assert (=> (not b_lambda!13569) (not b!921216)))

(declare-fun t!26393 () Bool)

(declare-fun tb!5647 () Bool)

(assert (=> (and start!78854 (= defaultEntry!1235 defaultEntry!1235) t!26393) tb!5647))

(declare-fun result!11117 () Bool)

(assert (=> tb!5647 (= result!11117 tp_is_empty!19575)))

(assert (=> b!921216 t!26393))

(declare-fun b_and!27873 () Bool)

(assert (= b_and!27871 (and (=> t!26393 result!11117) b_and!27873)))

(declare-fun m!855151 () Bool)

(assert (=> b!921203 m!855151))

(declare-fun m!855153 () Bool)

(assert (=> b!921218 m!855153))

(declare-fun m!855155 () Bool)

(assert (=> b!921211 m!855155))

(declare-fun m!855157 () Bool)

(assert (=> b!921216 m!855157))

(declare-fun m!855159 () Bool)

(assert (=> b!921216 m!855159))

(declare-fun m!855161 () Bool)

(assert (=> b!921216 m!855161))

(declare-fun m!855163 () Bool)

(assert (=> b!921216 m!855163))

(declare-fun m!855165 () Bool)

(assert (=> b!921216 m!855165))

(assert (=> b!921216 m!855157))

(declare-fun m!855167 () Bool)

(assert (=> b!921216 m!855167))

(declare-fun m!855169 () Bool)

(assert (=> b!921216 m!855169))

(assert (=> b!921216 m!855165))

(declare-fun m!855171 () Bool)

(assert (=> b!921216 m!855171))

(declare-fun m!855173 () Bool)

(assert (=> b!921216 m!855173))

(declare-fun m!855175 () Bool)

(assert (=> b!921216 m!855175))

(declare-fun m!855177 () Bool)

(assert (=> b!921216 m!855177))

(declare-fun m!855179 () Bool)

(assert (=> b!921216 m!855179))

(assert (=> b!921216 m!855169))

(assert (=> b!921216 m!855159))

(declare-fun m!855181 () Bool)

(assert (=> b!921216 m!855181))

(declare-fun m!855183 () Bool)

(assert (=> b!921204 m!855183))

(declare-fun m!855185 () Bool)

(assert (=> b!921207 m!855185))

(declare-fun m!855187 () Bool)

(assert (=> b!921207 m!855187))

(declare-fun m!855189 () Bool)

(assert (=> mapNonEmpty!31119 m!855189))

(declare-fun m!855191 () Bool)

(assert (=> b!921217 m!855191))

(declare-fun m!855193 () Bool)

(assert (=> b!921213 m!855193))

(declare-fun m!855195 () Bool)

(assert (=> b!921208 m!855195))

(declare-fun m!855197 () Bool)

(assert (=> b!921212 m!855197))

(declare-fun m!855199 () Bool)

(assert (=> start!78854 m!855199))

(declare-fun m!855201 () Bool)

(assert (=> start!78854 m!855201))

(declare-fun m!855203 () Bool)

(assert (=> start!78854 m!855203))

(declare-fun m!855205 () Bool)

(assert (=> b!921205 m!855205))

(declare-fun m!855207 () Bool)

(assert (=> b!921205 m!855207))

(check-sat (not b!921213) b_and!27873 (not b!921212) (not b!921216) (not b!921211) (not mapNonEmpty!31119) (not start!78854) (not b!921217) (not b_lambda!13569) (not b!921218) tp_is_empty!19575 (not b_next!17067) (not b!921205) (not b!921203) (not b!921208) (not b!921204) (not b!921207))
(check-sat b_and!27873 (not b_next!17067))
