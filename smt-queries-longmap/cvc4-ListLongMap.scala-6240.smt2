; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79868 () Bool)

(assert start!79868)

(declare-fun b_free!17765 () Bool)

(declare-fun b_next!17765 () Bool)

(assert (=> start!79868 (= b_free!17765 (not b_next!17765))))

(declare-fun tp!61759 () Bool)

(declare-fun b_and!29169 () Bool)

(assert (=> start!79868 (= tp!61759 b_and!29169)))

(declare-fun b!939207 () Bool)

(declare-fun res!631763 () Bool)

(declare-fun e!527518 () Bool)

(assert (=> b!939207 (=> (not res!631763) (not e!527518))))

(declare-datatypes ((array!56490 0))(
  ( (array!56491 (arr!27183 (Array (_ BitVec 32) (_ BitVec 64))) (size!27642 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56490)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56490 (_ BitVec 32)) Bool)

(assert (=> b!939207 (= res!631763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939208 () Bool)

(declare-fun e!527523 () Bool)

(declare-fun tp_is_empty!20273 () Bool)

(assert (=> b!939208 (= e!527523 tp_is_empty!20273)))

(declare-fun b!939209 () Bool)

(declare-fun res!631758 () Bool)

(assert (=> b!939209 (=> (not res!631758) (not e!527518))))

(declare-datatypes ((List!19167 0))(
  ( (Nil!19164) (Cons!19163 (h!20309 (_ BitVec 64)) (t!27476 List!19167)) )
))
(declare-fun arrayNoDuplicates!0 (array!56490 (_ BitVec 32) List!19167) Bool)

(assert (=> b!939209 (= res!631758 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19164))))

(declare-fun b!939210 () Bool)

(declare-fun e!527524 () Bool)

(declare-fun e!527529 () Bool)

(assert (=> b!939210 (= e!527524 e!527529)))

(declare-fun res!631760 () Bool)

(assert (=> b!939210 (=> (not res!631760) (not e!527529))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!939210 (= res!631760 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27642 _keys!1487)))))

(declare-datatypes ((Unit!31738 0))(
  ( (Unit!31739) )
))
(declare-fun lt!424374 () Unit!31738)

(declare-fun e!527528 () Unit!31738)

(assert (=> b!939210 (= lt!424374 e!527528)))

(declare-fun c!97973 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939210 (= c!97973 (validKeyInArray!0 k!1099))))

(declare-fun b!939212 () Bool)

(declare-fun e!527525 () Bool)

(assert (=> b!939212 (= e!527525 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) from!1844))))

(declare-fun b!939213 () Bool)

(declare-fun res!631759 () Bool)

(assert (=> b!939213 (=> (not res!631759) (not e!527518))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31995 0))(
  ( (V!31996 (val!10187 Int)) )
))
(declare-datatypes ((ValueCell!9655 0))(
  ( (ValueCellFull!9655 (v!12718 V!31995)) (EmptyCell!9655) )
))
(declare-datatypes ((array!56492 0))(
  ( (array!56493 (arr!27184 (Array (_ BitVec 32) ValueCell!9655)) (size!27643 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56492)

(assert (=> b!939213 (= res!631759 (and (= (size!27643 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27642 _keys!1487) (size!27643 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32189 () Bool)

(declare-fun mapRes!32189 () Bool)

(assert (=> mapIsEmpty!32189 mapRes!32189))

(declare-fun b!939214 () Bool)

(declare-fun e!527522 () Bool)

(assert (=> b!939214 (= e!527522 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!939215 () Bool)

(declare-datatypes ((tuple2!13390 0))(
  ( (tuple2!13391 (_1!6706 (_ BitVec 64)) (_2!6706 V!31995)) )
))
(declare-datatypes ((List!19168 0))(
  ( (Nil!19165) (Cons!19164 (h!20310 tuple2!13390) (t!27477 List!19168)) )
))
(declare-datatypes ((ListLongMap!12087 0))(
  ( (ListLongMap!12088 (toList!6059 List!19168)) )
))
(declare-fun lt!424371 () ListLongMap!12087)

(declare-fun lt!424368 () V!31995)

(declare-fun apply!860 (ListLongMap!12087 (_ BitVec 64)) V!31995)

(assert (=> b!939215 (= (apply!860 lt!424371 k!1099) lt!424368)))

(declare-fun lt!424367 () ListLongMap!12087)

(declare-fun lt!424373 () Unit!31738)

(declare-fun lt!424366 () V!31995)

(declare-fun lt!424370 () (_ BitVec 64))

(declare-fun addApplyDifferent!445 (ListLongMap!12087 (_ BitVec 64) V!31995 (_ BitVec 64)) Unit!31738)

(assert (=> b!939215 (= lt!424373 (addApplyDifferent!445 lt!424367 lt!424370 lt!424366 k!1099))))

(assert (=> b!939215 (not (= lt!424370 k!1099))))

(declare-fun lt!424372 () Unit!31738)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56490 (_ BitVec 64) (_ BitVec 32) List!19167) Unit!31738)

(assert (=> b!939215 (= lt!424372 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19164))))

(assert (=> b!939215 e!527522))

(declare-fun c!97974 () Bool)

(assert (=> b!939215 (= c!97974 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!424365 () Unit!31738)

(declare-fun zeroValue!1173 () V!31995)

(declare-fun minValue!1173 () V!31995)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!318 (array!56490 array!56492 (_ BitVec 32) (_ BitVec 32) V!31995 V!31995 (_ BitVec 64) (_ BitVec 32) Int) Unit!31738)

(assert (=> b!939215 (= lt!424365 (lemmaListMapContainsThenArrayContainsFrom!318 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!939215 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19164)))

(declare-fun lt!424364 () Unit!31738)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56490 (_ BitVec 32) (_ BitVec 32)) Unit!31738)

(assert (=> b!939215 (= lt!424364 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5121 (ListLongMap!12087 (_ BitVec 64)) Bool)

(assert (=> b!939215 (contains!5121 lt!424371 k!1099)))

(declare-fun lt!424369 () tuple2!13390)

(declare-fun +!2846 (ListLongMap!12087 tuple2!13390) ListLongMap!12087)

(assert (=> b!939215 (= lt!424371 (+!2846 lt!424367 lt!424369))))

(declare-fun lt!424363 () Unit!31738)

(declare-fun addStillContains!565 (ListLongMap!12087 (_ BitVec 64) V!31995 (_ BitVec 64)) Unit!31738)

(assert (=> b!939215 (= lt!424363 (addStillContains!565 lt!424367 lt!424370 lt!424366 k!1099))))

(declare-fun getCurrentListMap!3293 (array!56490 array!56492 (_ BitVec 32) (_ BitVec 32) V!31995 V!31995 (_ BitVec 32) Int) ListLongMap!12087)

(assert (=> b!939215 (= (getCurrentListMap!3293 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2846 (getCurrentListMap!3293 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424369))))

(assert (=> b!939215 (= lt!424369 (tuple2!13391 lt!424370 lt!424366))))

(declare-fun get!14344 (ValueCell!9655 V!31995) V!31995)

(declare-fun dynLambda!1635 (Int (_ BitVec 64)) V!31995)

(assert (=> b!939215 (= lt!424366 (get!14344 (select (arr!27184 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1635 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424362 () Unit!31738)

(declare-fun lemmaListMapRecursiveValidKeyArray!236 (array!56490 array!56492 (_ BitVec 32) (_ BitVec 32) V!31995 V!31995 (_ BitVec 32) Int) Unit!31738)

(assert (=> b!939215 (= lt!424362 (lemmaListMapRecursiveValidKeyArray!236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527519 () Unit!31738)

(assert (=> b!939215 (= e!527519 lt!424373)))

(declare-fun b!939216 () Bool)

(declare-fun e!527521 () Bool)

(assert (=> b!939216 (= e!527521 e!527524)))

(declare-fun res!631764 () Bool)

(assert (=> b!939216 (=> (not res!631764) (not e!527524))))

(declare-fun v!791 () V!31995)

(assert (=> b!939216 (= res!631764 (and (= lt!424368 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!939216 (= lt!424368 (apply!860 lt!424367 k!1099))))

(declare-fun b!939217 () Bool)

(declare-fun Unit!31740 () Unit!31738)

(assert (=> b!939217 (= e!527528 Unit!31740)))

(declare-fun mapNonEmpty!32189 () Bool)

(declare-fun tp!61758 () Bool)

(declare-fun e!527527 () Bool)

(assert (=> mapNonEmpty!32189 (= mapRes!32189 (and tp!61758 e!527527))))

(declare-fun mapValue!32189 () ValueCell!9655)

(declare-fun mapRest!32189 () (Array (_ BitVec 32) ValueCell!9655))

(declare-fun mapKey!32189 () (_ BitVec 32))

(assert (=> mapNonEmpty!32189 (= (arr!27184 _values!1231) (store mapRest!32189 mapKey!32189 mapValue!32189))))

(declare-fun b!939218 () Bool)

(declare-fun res!631762 () Bool)

(assert (=> b!939218 (=> (not res!631762) (not e!527525))))

(declare-fun lt!424375 () ListLongMap!12087)

(assert (=> b!939218 (= res!631762 (= (apply!860 lt!424375 k!1099) v!791))))

(declare-fun b!939219 () Bool)

(declare-fun res!631765 () Bool)

(assert (=> b!939219 (=> (not res!631765) (not e!527518))))

(assert (=> b!939219 (= res!631765 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27642 _keys!1487))))))

(declare-fun b!939220 () Bool)

(declare-fun arrayContainsKey!0 (array!56490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939220 (= e!527522 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!939221 () Bool)

(declare-fun Unit!31741 () Unit!31738)

(assert (=> b!939221 (= e!527519 Unit!31741)))

(declare-fun b!939222 () Bool)

(assert (=> b!939222 (= e!527529 e!527525)))

(declare-fun res!631757 () Bool)

(assert (=> b!939222 (=> (not res!631757) (not e!527525))))

(assert (=> b!939222 (= res!631757 (contains!5121 lt!424375 k!1099))))

(assert (=> b!939222 (= lt!424375 (getCurrentListMap!3293 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939223 () Bool)

(declare-fun e!527526 () Bool)

(assert (=> b!939223 (= e!527526 (and e!527523 mapRes!32189))))

(declare-fun condMapEmpty!32189 () Bool)

(declare-fun mapDefault!32189 () ValueCell!9655)

