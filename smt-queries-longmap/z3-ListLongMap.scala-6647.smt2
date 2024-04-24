; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84022 () Bool)

(assert start!84022)

(declare-fun b_free!19663 () Bool)

(declare-fun b_next!19663 () Bool)

(assert (=> start!84022 (= b_free!19663 (not b_next!19663))))

(declare-fun tp!68431 () Bool)

(declare-fun b_and!31425 () Bool)

(assert (=> start!84022 (= tp!68431 b_and!31425)))

(declare-fun b!980549 () Bool)

(declare-fun e!552800 () Bool)

(declare-fun tp_is_empty!22657 () Bool)

(assert (=> b!980549 (= e!552800 tp_is_empty!22657)))

(declare-fun b!980550 () Bool)

(declare-fun res!655957 () Bool)

(declare-fun e!552803 () Bool)

(assert (=> b!980550 (=> (not res!655957) (not e!552803))))

(declare-datatypes ((array!61358 0))(
  ( (array!61359 (arr!29532 (Array (_ BitVec 32) (_ BitVec 64))) (size!30012 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61358)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61358 (_ BitVec 32)) Bool)

(assert (=> b!980550 (= res!655957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980551 () Bool)

(declare-fun res!655955 () Bool)

(assert (=> b!980551 (=> (not res!655955) (not e!552803))))

(declare-datatypes ((List!20465 0))(
  ( (Nil!20462) (Cons!20461 (h!21629 (_ BitVec 64)) (t!29076 List!20465)) )
))
(declare-fun arrayNoDuplicates!0 (array!61358 (_ BitVec 32) List!20465) Bool)

(assert (=> b!980551 (= res!655955 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20462))))

(declare-fun b!980552 () Bool)

(declare-fun res!655952 () Bool)

(assert (=> b!980552 (=> (not res!655952) (not e!552803))))

(declare-datatypes ((V!35193 0))(
  ( (V!35194 (val!11379 Int)) )
))
(declare-datatypes ((ValueCell!10847 0))(
  ( (ValueCellFull!10847 (v!13938 V!35193)) (EmptyCell!10847) )
))
(declare-datatypes ((array!61360 0))(
  ( (array!61361 (arr!29533 (Array (_ BitVec 32) ValueCell!10847)) (size!30013 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61360)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980552 (= res!655952 (and (= (size!30013 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30012 _keys!1544) (size!30013 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36014 () Bool)

(declare-fun mapRes!36014 () Bool)

(assert (=> mapIsEmpty!36014 mapRes!36014))

(declare-fun b!980554 () Bool)

(declare-fun e!552801 () Bool)

(assert (=> b!980554 (= e!552801 true)))

(declare-datatypes ((tuple2!14606 0))(
  ( (tuple2!14607 (_1!7314 (_ BitVec 64)) (_2!7314 V!35193)) )
))
(declare-fun lt!434997 () tuple2!14606)

(declare-datatypes ((List!20466 0))(
  ( (Nil!20463) (Cons!20462 (h!21630 tuple2!14606) (t!29077 List!20466)) )
))
(declare-datatypes ((ListLongMap!13305 0))(
  ( (ListLongMap!13306 (toList!6668 List!20466)) )
))
(declare-fun lt!434994 () ListLongMap!13305)

(declare-fun lt!435000 () ListLongMap!13305)

(declare-fun lt!434991 () tuple2!14606)

(declare-fun +!2983 (ListLongMap!13305 tuple2!14606) ListLongMap!13305)

(assert (=> b!980554 (= lt!435000 (+!2983 (+!2983 lt!434994 lt!434997) lt!434991))))

(declare-datatypes ((Unit!32546 0))(
  ( (Unit!32547) )
))
(declare-fun lt!434993 () Unit!32546)

(declare-fun zeroValue!1220 () V!35193)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!434996 () V!35193)

(declare-fun addCommutativeForDiffKeys!590 (ListLongMap!13305 (_ BitVec 64) V!35193 (_ BitVec 64) V!35193) Unit!32546)

(assert (=> b!980554 (= lt!434993 (addCommutativeForDiffKeys!590 lt!434994 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29532 _keys!1544) from!1932) lt!434996))))

(declare-fun b!980555 () Bool)

(declare-fun res!655951 () Bool)

(assert (=> b!980555 (=> (not res!655951) (not e!552803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980555 (= res!655951 (validKeyInArray!0 (select (arr!29532 _keys!1544) from!1932)))))

(declare-fun b!980556 () Bool)

(declare-fun res!655950 () Bool)

(assert (=> b!980556 (=> (not res!655950) (not e!552803))))

(assert (=> b!980556 (= res!655950 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980557 () Bool)

(declare-fun res!655956 () Bool)

(assert (=> b!980557 (=> (not res!655956) (not e!552803))))

(assert (=> b!980557 (= res!655956 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30012 _keys!1544))))))

(declare-fun b!980558 () Bool)

(assert (=> b!980558 (= e!552803 (not e!552801))))

(declare-fun res!655953 () Bool)

(assert (=> b!980558 (=> res!655953 e!552801)))

(assert (=> b!980558 (= res!655953 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29532 _keys!1544) from!1932)))))

(declare-fun lt!434992 () tuple2!14606)

(declare-fun lt!434998 () ListLongMap!13305)

(assert (=> b!980558 (= (+!2983 lt!434998 lt!434997) (+!2983 lt!435000 lt!434992))))

(declare-fun lt!434995 () ListLongMap!13305)

(assert (=> b!980558 (= lt!435000 (+!2983 lt!434995 lt!434997))))

(assert (=> b!980558 (= lt!434997 (tuple2!14607 (select (arr!29532 _keys!1544) from!1932) lt!434996))))

(assert (=> b!980558 (= lt!434998 (+!2983 lt!434995 lt!434992))))

(declare-fun minValue!1220 () V!35193)

(assert (=> b!980558 (= lt!434992 (tuple2!14607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434999 () Unit!32546)

(assert (=> b!980558 (= lt!434999 (addCommutativeForDiffKeys!590 lt!434995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29532 _keys!1544) from!1932) lt!434996))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15329 (ValueCell!10847 V!35193) V!35193)

(declare-fun dynLambda!1778 (Int (_ BitVec 64)) V!35193)

(assert (=> b!980558 (= lt!434996 (get!15329 (select (arr!29533 _values!1278) from!1932) (dynLambda!1778 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!980558 (= lt!434995 (+!2983 lt!434994 lt!434991))))

(assert (=> b!980558 (= lt!434991 (tuple2!14607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3416 (array!61358 array!61360 (_ BitVec 32) (_ BitVec 32) V!35193 V!35193 (_ BitVec 32) Int) ListLongMap!13305)

(assert (=> b!980558 (= lt!434994 (getCurrentListMapNoExtraKeys!3416 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655954 () Bool)

(assert (=> start!84022 (=> (not res!655954) (not e!552803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84022 (= res!655954 (validMask!0 mask!1948))))

(assert (=> start!84022 e!552803))

(assert (=> start!84022 true))

(assert (=> start!84022 tp_is_empty!22657))

(declare-fun e!552804 () Bool)

(declare-fun array_inv!22867 (array!61360) Bool)

(assert (=> start!84022 (and (array_inv!22867 _values!1278) e!552804)))

(assert (=> start!84022 tp!68431))

(declare-fun array_inv!22868 (array!61358) Bool)

(assert (=> start!84022 (array_inv!22868 _keys!1544)))

(declare-fun b!980553 () Bool)

(declare-fun e!552802 () Bool)

(assert (=> b!980553 (= e!552802 tp_is_empty!22657)))

(declare-fun b!980559 () Bool)

(assert (=> b!980559 (= e!552804 (and e!552802 mapRes!36014))))

(declare-fun condMapEmpty!36014 () Bool)

(declare-fun mapDefault!36014 () ValueCell!10847)

(assert (=> b!980559 (= condMapEmpty!36014 (= (arr!29533 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10847)) mapDefault!36014)))))

(declare-fun mapNonEmpty!36014 () Bool)

(declare-fun tp!68432 () Bool)

(assert (=> mapNonEmpty!36014 (= mapRes!36014 (and tp!68432 e!552800))))

(declare-fun mapRest!36014 () (Array (_ BitVec 32) ValueCell!10847))

(declare-fun mapValue!36014 () ValueCell!10847)

(declare-fun mapKey!36014 () (_ BitVec 32))

(assert (=> mapNonEmpty!36014 (= (arr!29533 _values!1278) (store mapRest!36014 mapKey!36014 mapValue!36014))))

(assert (= (and start!84022 res!655954) b!980552))

(assert (= (and b!980552 res!655952) b!980550))

(assert (= (and b!980550 res!655957) b!980551))

(assert (= (and b!980551 res!655955) b!980557))

(assert (= (and b!980557 res!655956) b!980555))

(assert (= (and b!980555 res!655951) b!980556))

(assert (= (and b!980556 res!655950) b!980558))

(assert (= (and b!980558 (not res!655953)) b!980554))

(assert (= (and b!980559 condMapEmpty!36014) mapIsEmpty!36014))

(assert (= (and b!980559 (not condMapEmpty!36014)) mapNonEmpty!36014))

(get-info :version)

(assert (= (and mapNonEmpty!36014 ((_ is ValueCellFull!10847) mapValue!36014)) b!980549))

(assert (= (and b!980559 ((_ is ValueCellFull!10847) mapDefault!36014)) b!980553))

(assert (= start!84022 b!980559))

(declare-fun b_lambda!14721 () Bool)

(assert (=> (not b_lambda!14721) (not b!980558)))

(declare-fun t!29075 () Bool)

(declare-fun tb!6461 () Bool)

(assert (=> (and start!84022 (= defaultEntry!1281 defaultEntry!1281) t!29075) tb!6461))

(declare-fun result!12919 () Bool)

(assert (=> tb!6461 (= result!12919 tp_is_empty!22657)))

(assert (=> b!980558 t!29075))

(declare-fun b_and!31427 () Bool)

(assert (= b_and!31425 (and (=> t!29075 result!12919) b_and!31427)))

(declare-fun m!908291 () Bool)

(assert (=> start!84022 m!908291))

(declare-fun m!908293 () Bool)

(assert (=> start!84022 m!908293))

(declare-fun m!908295 () Bool)

(assert (=> start!84022 m!908295))

(declare-fun m!908297 () Bool)

(assert (=> b!980550 m!908297))

(declare-fun m!908299 () Bool)

(assert (=> b!980551 m!908299))

(declare-fun m!908301 () Bool)

(assert (=> b!980558 m!908301))

(declare-fun m!908303 () Bool)

(assert (=> b!980558 m!908303))

(assert (=> b!980558 m!908301))

(declare-fun m!908305 () Bool)

(assert (=> b!980558 m!908305))

(declare-fun m!908307 () Bool)

(assert (=> b!980558 m!908307))

(declare-fun m!908309 () Bool)

(assert (=> b!980558 m!908309))

(declare-fun m!908311 () Bool)

(assert (=> b!980558 m!908311))

(declare-fun m!908313 () Bool)

(assert (=> b!980558 m!908313))

(declare-fun m!908315 () Bool)

(assert (=> b!980558 m!908315))

(declare-fun m!908317 () Bool)

(assert (=> b!980558 m!908317))

(declare-fun m!908319 () Bool)

(assert (=> b!980558 m!908319))

(assert (=> b!980558 m!908315))

(assert (=> b!980558 m!908319))

(declare-fun m!908321 () Bool)

(assert (=> b!980558 m!908321))

(declare-fun m!908323 () Bool)

(assert (=> b!980554 m!908323))

(assert (=> b!980554 m!908323))

(declare-fun m!908325 () Bool)

(assert (=> b!980554 m!908325))

(assert (=> b!980554 m!908301))

(assert (=> b!980554 m!908301))

(declare-fun m!908327 () Bool)

(assert (=> b!980554 m!908327))

(assert (=> b!980555 m!908301))

(assert (=> b!980555 m!908301))

(declare-fun m!908329 () Bool)

(assert (=> b!980555 m!908329))

(declare-fun m!908331 () Bool)

(assert (=> mapNonEmpty!36014 m!908331))

(check-sat tp_is_empty!22657 (not start!84022) (not b!980558) (not mapNonEmpty!36014) (not b!980551) (not b_lambda!14721) (not b!980550) (not b_next!19663) b_and!31427 (not b!980555) (not b!980554))
(check-sat b_and!31427 (not b_next!19663))
