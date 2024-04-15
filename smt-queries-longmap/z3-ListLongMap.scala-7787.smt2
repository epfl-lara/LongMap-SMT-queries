; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97460 () Bool)

(assert start!97460)

(declare-fun b!1112196 () Bool)

(declare-fun res!742213 () Bool)

(declare-fun e!634111 () Bool)

(assert (=> b!1112196 (=> (not res!742213) (not e!634111))))

(declare-datatypes ((array!72204 0))(
  ( (array!72205 (arr!34755 (Array (_ BitVec 32) (_ BitVec 64))) (size!35293 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72204)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42057 0))(
  ( (V!42058 (val!13905 Int)) )
))
(declare-datatypes ((ValueCell!13139 0))(
  ( (ValueCellFull!13139 (v!16537 V!42057)) (EmptyCell!13139) )
))
(declare-datatypes ((array!72206 0))(
  ( (array!72207 (arr!34756 (Array (_ BitVec 32) ValueCell!13139)) (size!35294 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72206)

(assert (=> b!1112196 (= res!742213 (and (= (size!35294 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35293 _keys!1208) (size!35294 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112197 () Bool)

(declare-fun res!742211 () Bool)

(assert (=> b!1112197 (=> (not res!742211) (not e!634111))))

(declare-datatypes ((List!24320 0))(
  ( (Nil!24317) (Cons!24316 (h!25525 (_ BitVec 64)) (t!34792 List!24320)) )
))
(declare-fun arrayNoDuplicates!0 (array!72204 (_ BitVec 32) List!24320) Bool)

(assert (=> b!1112197 (= res!742211 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24317))))

(declare-fun mapIsEmpty!43363 () Bool)

(declare-fun mapRes!43363 () Bool)

(assert (=> mapIsEmpty!43363 mapRes!43363))

(declare-fun b!1112199 () Bool)

(declare-fun res!742209 () Bool)

(assert (=> b!1112199 (=> (not res!742209) (not e!634111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72204 (_ BitVec 32)) Bool)

(assert (=> b!1112199 (= res!742209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112200 () Bool)

(declare-fun res!742204 () Bool)

(assert (=> b!1112200 (=> (not res!742204) (not e!634111))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1112200 (= res!742204 (= (select (arr!34755 _keys!1208) i!673) k0!934))))

(declare-fun b!1112201 () Bool)

(declare-fun e!634113 () Bool)

(declare-fun tp_is_empty!27697 () Bool)

(assert (=> b!1112201 (= e!634113 tp_is_empty!27697)))

(declare-fun b!1112202 () Bool)

(declare-fun res!742212 () Bool)

(assert (=> b!1112202 (=> (not res!742212) (not e!634111))))

(assert (=> b!1112202 (= res!742212 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35293 _keys!1208))))))

(declare-fun mapNonEmpty!43363 () Bool)

(declare-fun tp!82607 () Bool)

(assert (=> mapNonEmpty!43363 (= mapRes!43363 (and tp!82607 e!634113))))

(declare-fun mapValue!43363 () ValueCell!13139)

(declare-fun mapRest!43363 () (Array (_ BitVec 32) ValueCell!13139))

(declare-fun mapKey!43363 () (_ BitVec 32))

(assert (=> mapNonEmpty!43363 (= (arr!34756 _values!996) (store mapRest!43363 mapKey!43363 mapValue!43363))))

(declare-fun b!1112203 () Bool)

(declare-fun e!634116 () Bool)

(assert (=> b!1112203 (= e!634116 (not true))))

(declare-fun arrayContainsKey!0 (array!72204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112203 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36315 0))(
  ( (Unit!36316) )
))
(declare-fun lt!496302 () Unit!36315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72204 (_ BitVec 64) (_ BitVec 32)) Unit!36315)

(assert (=> b!1112203 (= lt!496302 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112204 () Bool)

(declare-fun res!742206 () Bool)

(assert (=> b!1112204 (=> (not res!742206) (not e!634111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112204 (= res!742206 (validMask!0 mask!1564))))

(declare-fun b!1112205 () Bool)

(assert (=> b!1112205 (= e!634111 e!634116)))

(declare-fun res!742208 () Bool)

(assert (=> b!1112205 (=> (not res!742208) (not e!634116))))

(declare-fun lt!496301 () array!72204)

(assert (=> b!1112205 (= res!742208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496301 mask!1564))))

(assert (=> b!1112205 (= lt!496301 (array!72205 (store (arr!34755 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35293 _keys!1208)))))

(declare-fun b!1112206 () Bool)

(declare-fun e!634114 () Bool)

(assert (=> b!1112206 (= e!634114 tp_is_empty!27697)))

(declare-fun b!1112207 () Bool)

(declare-fun res!742207 () Bool)

(assert (=> b!1112207 (=> (not res!742207) (not e!634116))))

(assert (=> b!1112207 (= res!742207 (arrayNoDuplicates!0 lt!496301 #b00000000000000000000000000000000 Nil!24317))))

(declare-fun b!1112208 () Bool)

(declare-fun res!742205 () Bool)

(assert (=> b!1112208 (=> (not res!742205) (not e!634111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112208 (= res!742205 (validKeyInArray!0 k0!934))))

(declare-fun res!742210 () Bool)

(assert (=> start!97460 (=> (not res!742210) (not e!634111))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97460 (= res!742210 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35293 _keys!1208))))))

(assert (=> start!97460 e!634111))

(declare-fun array_inv!26794 (array!72204) Bool)

(assert (=> start!97460 (array_inv!26794 _keys!1208)))

(assert (=> start!97460 true))

(declare-fun e!634112 () Bool)

(declare-fun array_inv!26795 (array!72206) Bool)

(assert (=> start!97460 (and (array_inv!26795 _values!996) e!634112)))

(declare-fun b!1112198 () Bool)

(assert (=> b!1112198 (= e!634112 (and e!634114 mapRes!43363))))

(declare-fun condMapEmpty!43363 () Bool)

(declare-fun mapDefault!43363 () ValueCell!13139)

(assert (=> b!1112198 (= condMapEmpty!43363 (= (arr!34756 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13139)) mapDefault!43363)))))

(assert (= (and start!97460 res!742210) b!1112204))

(assert (= (and b!1112204 res!742206) b!1112196))

(assert (= (and b!1112196 res!742213) b!1112199))

(assert (= (and b!1112199 res!742209) b!1112197))

(assert (= (and b!1112197 res!742211) b!1112202))

(assert (= (and b!1112202 res!742212) b!1112208))

(assert (= (and b!1112208 res!742205) b!1112200))

(assert (= (and b!1112200 res!742204) b!1112205))

(assert (= (and b!1112205 res!742208) b!1112207))

(assert (= (and b!1112207 res!742207) b!1112203))

(assert (= (and b!1112198 condMapEmpty!43363) mapIsEmpty!43363))

(assert (= (and b!1112198 (not condMapEmpty!43363)) mapNonEmpty!43363))

(get-info :version)

(assert (= (and mapNonEmpty!43363 ((_ is ValueCellFull!13139) mapValue!43363)) b!1112201))

(assert (= (and b!1112198 ((_ is ValueCellFull!13139) mapDefault!43363)) b!1112206))

(assert (= start!97460 b!1112198))

(declare-fun m!1029279 () Bool)

(assert (=> b!1112208 m!1029279))

(declare-fun m!1029281 () Bool)

(assert (=> b!1112207 m!1029281))

(declare-fun m!1029283 () Bool)

(assert (=> b!1112197 m!1029283))

(declare-fun m!1029285 () Bool)

(assert (=> b!1112204 m!1029285))

(declare-fun m!1029287 () Bool)

(assert (=> mapNonEmpty!43363 m!1029287))

(declare-fun m!1029289 () Bool)

(assert (=> b!1112199 m!1029289))

(declare-fun m!1029291 () Bool)

(assert (=> start!97460 m!1029291))

(declare-fun m!1029293 () Bool)

(assert (=> start!97460 m!1029293))

(declare-fun m!1029295 () Bool)

(assert (=> b!1112203 m!1029295))

(declare-fun m!1029297 () Bool)

(assert (=> b!1112203 m!1029297))

(declare-fun m!1029299 () Bool)

(assert (=> b!1112200 m!1029299))

(declare-fun m!1029301 () Bool)

(assert (=> b!1112205 m!1029301))

(declare-fun m!1029303 () Bool)

(assert (=> b!1112205 m!1029303))

(check-sat (not b!1112205) (not b!1112208) (not b!1112207) (not b!1112204) tp_is_empty!27697 (not start!97460) (not mapNonEmpty!43363) (not b!1112197) (not b!1112199) (not b!1112203))
(check-sat)
