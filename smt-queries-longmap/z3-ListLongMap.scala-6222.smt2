; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79480 () Bool)

(assert start!79480)

(declare-fun b_free!17653 () Bool)

(declare-fun b_next!17653 () Bool)

(assert (=> start!79480 (= b_free!17653 (not b_next!17653))))

(declare-fun tp!61406 () Bool)

(declare-fun b_and!28847 () Bool)

(assert (=> start!79480 (= tp!61406 b_and!28847)))

(declare-fun b!934416 () Bool)

(declare-fun e!524650 () Bool)

(declare-fun tp_is_empty!20161 () Bool)

(assert (=> b!934416 (= e!524650 tp_is_empty!20161)))

(declare-fun b!934417 () Bool)

(declare-fun e!524644 () Bool)

(declare-fun e!524646 () Bool)

(assert (=> b!934417 (= e!524644 e!524646)))

(declare-fun res!629375 () Bool)

(assert (=> b!934417 (=> (not res!629375) (not e!524646))))

(declare-datatypes ((V!31847 0))(
  ( (V!31848 (val!10131 Int)) )
))
(declare-datatypes ((tuple2!13350 0))(
  ( (tuple2!13351 (_1!6686 (_ BitVec 64)) (_2!6686 V!31847)) )
))
(declare-datatypes ((List!19097 0))(
  ( (Nil!19094) (Cons!19093 (h!20239 tuple2!13350) (t!27285 List!19097)) )
))
(declare-datatypes ((ListLongMap!12037 0))(
  ( (ListLongMap!12038 (toList!6034 List!19097)) )
))
(declare-fun lt!420859 () ListLongMap!12037)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5031 (ListLongMap!12037 (_ BitVec 64)) Bool)

(assert (=> b!934417 (= res!629375 (contains!5031 lt!420859 k0!1099))))

(declare-datatypes ((array!56225 0))(
  ( (array!56226 (arr!27056 (Array (_ BitVec 32) (_ BitVec 64))) (size!27517 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56225)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9599 0))(
  ( (ValueCellFull!9599 (v!12650 V!31847)) (EmptyCell!9599) )
))
(declare-datatypes ((array!56227 0))(
  ( (array!56228 (arr!27057 (Array (_ BitVec 32) ValueCell!9599)) (size!27518 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56227)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31847)

(declare-fun minValue!1173 () V!31847)

(declare-fun getCurrentListMap!3204 (array!56225 array!56227 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) ListLongMap!12037)

(assert (=> b!934417 (= lt!420859 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934418 () Bool)

(declare-fun res!629377 () Bool)

(assert (=> b!934418 (=> (not res!629377) (not e!524644))))

(assert (=> b!934418 (= res!629377 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27517 _keys!1487))))))

(declare-fun b!934419 () Bool)

(declare-fun res!629372 () Bool)

(assert (=> b!934419 (=> (not res!629372) (not e!524644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56225 (_ BitVec 32)) Bool)

(assert (=> b!934419 (= res!629372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32004 () Bool)

(declare-fun mapRes!32004 () Bool)

(declare-fun tp!61407 () Bool)

(assert (=> mapNonEmpty!32004 (= mapRes!32004 (and tp!61407 e!524650))))

(declare-fun mapKey!32004 () (_ BitVec 32))

(declare-fun mapValue!32004 () ValueCell!9599)

(declare-fun mapRest!32004 () (Array (_ BitVec 32) ValueCell!9599))

(assert (=> mapNonEmpty!32004 (= (arr!27057 _values!1231) (store mapRest!32004 mapKey!32004 mapValue!32004))))

(declare-fun b!934420 () Bool)

(declare-fun res!629376 () Bool)

(assert (=> b!934420 (=> (not res!629376) (not e!524644))))

(declare-datatypes ((List!19098 0))(
  ( (Nil!19095) (Cons!19094 (h!20240 (_ BitVec 64)) (t!27286 List!19098)) )
))
(declare-fun arrayNoDuplicates!0 (array!56225 (_ BitVec 32) List!19098) Bool)

(assert (=> b!934420 (= res!629376 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19095))))

(declare-fun b!934421 () Bool)

(declare-fun res!629380 () Bool)

(assert (=> b!934421 (=> (not res!629380) (not e!524646))))

(declare-fun v!791 () V!31847)

(declare-fun apply!814 (ListLongMap!12037 (_ BitVec 64)) V!31847)

(assert (=> b!934421 (= res!629380 (= (apply!814 lt!420859 k0!1099) v!791))))

(declare-fun b!934422 () Bool)

(declare-fun res!629379 () Bool)

(assert (=> b!934422 (=> (not res!629379) (not e!524646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934422 (= res!629379 (validKeyInArray!0 k0!1099))))

(declare-fun b!934423 () Bool)

(declare-fun e!524645 () Bool)

(assert (=> b!934423 (= e!524645 tp_is_empty!20161)))

(declare-fun b!934425 () Bool)

(declare-fun e!524647 () Bool)

(assert (=> b!934425 (= e!524647 (and e!524645 mapRes!32004))))

(declare-fun condMapEmpty!32004 () Bool)

(declare-fun mapDefault!32004 () ValueCell!9599)

(assert (=> b!934425 (= condMapEmpty!32004 (= (arr!27057 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9599)) mapDefault!32004)))))

(declare-fun e!524651 () Bool)

(declare-fun b!934426 () Bool)

(declare-fun arrayContainsKey!0 (array!56225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934426 (= e!524651 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934427 () Bool)

(declare-fun res!629371 () Bool)

(assert (=> b!934427 (=> (not res!629371) (not e!524644))))

(assert (=> b!934427 (= res!629371 (and (= (size!27518 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27517 _keys!1487) (size!27518 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934428 () Bool)

(declare-fun res!629373 () Bool)

(assert (=> b!934428 (=> (not res!629373) (not e!524646))))

(assert (=> b!934428 (= res!629373 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934429 () Bool)

(declare-fun e!524643 () Bool)

(declare-fun noDuplicate!1357 (List!19098) Bool)

(assert (=> b!934429 (= e!524643 (noDuplicate!1357 Nil!19095))))

(declare-fun b!934430 () Bool)

(declare-fun e!524649 () Bool)

(assert (=> b!934430 (= e!524649 (not e!524643))))

(declare-fun res!629378 () Bool)

(assert (=> b!934430 (=> res!629378 e!524643)))

(assert (=> b!934430 (= res!629378 (or (bvsge (size!27517 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487))))))

(assert (=> b!934430 e!524651))

(declare-fun c!97105 () Bool)

(assert (=> b!934430 (= c!97105 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31443 0))(
  ( (Unit!31444) )
))
(declare-fun lt!420852 () Unit!31443)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!281 (array!56225 array!56227 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 64) (_ BitVec 32) Int) Unit!31443)

(assert (=> b!934430 (= lt!420852 (lemmaListMapContainsThenArrayContainsFrom!281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934430 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19095)))

(declare-fun lt!420854 () Unit!31443)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56225 (_ BitVec 32) (_ BitVec 32)) Unit!31443)

(assert (=> b!934430 (= lt!420854 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420857 () tuple2!13350)

(declare-fun +!2834 (ListLongMap!12037 tuple2!13350) ListLongMap!12037)

(assert (=> b!934430 (contains!5031 (+!2834 lt!420859 lt!420857) k0!1099)))

(declare-fun lt!420855 () V!31847)

(declare-fun lt!420858 () (_ BitVec 64))

(declare-fun lt!420856 () Unit!31443)

(declare-fun addStillContains!523 (ListLongMap!12037 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31443)

(assert (=> b!934430 (= lt!420856 (addStillContains!523 lt!420859 lt!420858 lt!420855 k0!1099))))

(assert (=> b!934430 (= (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2834 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420857))))

(assert (=> b!934430 (= lt!420857 (tuple2!13351 lt!420858 lt!420855))))

(declare-fun get!14253 (ValueCell!9599 V!31847) V!31847)

(declare-fun dynLambda!1590 (Int (_ BitVec 64)) V!31847)

(assert (=> b!934430 (= lt!420855 (get!14253 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420853 () Unit!31443)

(declare-fun lemmaListMapRecursiveValidKeyArray!198 (array!56225 array!56227 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) Unit!31443)

(assert (=> b!934430 (= lt!420853 (lemmaListMapRecursiveValidKeyArray!198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!32004 () Bool)

(assert (=> mapIsEmpty!32004 mapRes!32004))

(declare-fun b!934431 () Bool)

(assert (=> b!934431 (= e!524646 e!524649)))

(declare-fun res!629374 () Bool)

(assert (=> b!934431 (=> (not res!629374) (not e!524649))))

(assert (=> b!934431 (= res!629374 (validKeyInArray!0 lt!420858))))

(assert (=> b!934431 (= lt!420858 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934424 () Bool)

(assert (=> b!934424 (= e!524651 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!629381 () Bool)

(assert (=> start!79480 (=> (not res!629381) (not e!524644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79480 (= res!629381 (validMask!0 mask!1881))))

(assert (=> start!79480 e!524644))

(assert (=> start!79480 true))

(assert (=> start!79480 tp_is_empty!20161))

(declare-fun array_inv!21120 (array!56227) Bool)

(assert (=> start!79480 (and (array_inv!21120 _values!1231) e!524647)))

(assert (=> start!79480 tp!61406))

(declare-fun array_inv!21121 (array!56225) Bool)

(assert (=> start!79480 (array_inv!21121 _keys!1487)))

(assert (= (and start!79480 res!629381) b!934427))

(assert (= (and b!934427 res!629371) b!934419))

(assert (= (and b!934419 res!629372) b!934420))

(assert (= (and b!934420 res!629376) b!934418))

(assert (= (and b!934418 res!629377) b!934417))

(assert (= (and b!934417 res!629375) b!934421))

(assert (= (and b!934421 res!629380) b!934428))

(assert (= (and b!934428 res!629373) b!934422))

(assert (= (and b!934422 res!629379) b!934431))

(assert (= (and b!934431 res!629374) b!934430))

(assert (= (and b!934430 c!97105) b!934426))

(assert (= (and b!934430 (not c!97105)) b!934424))

(assert (= (and b!934430 (not res!629378)) b!934429))

(assert (= (and b!934425 condMapEmpty!32004) mapIsEmpty!32004))

(assert (= (and b!934425 (not condMapEmpty!32004)) mapNonEmpty!32004))

(get-info :version)

(assert (= (and mapNonEmpty!32004 ((_ is ValueCellFull!9599) mapValue!32004)) b!934416))

(assert (= (and b!934425 ((_ is ValueCellFull!9599) mapDefault!32004)) b!934423))

(assert (= start!79480 b!934425))

(declare-fun b_lambda!13987 () Bool)

(assert (=> (not b_lambda!13987) (not b!934430)))

(declare-fun t!27284 () Bool)

(declare-fun tb!6039 () Bool)

(assert (=> (and start!79480 (= defaultEntry!1235 defaultEntry!1235) t!27284) tb!6039))

(declare-fun result!11913 () Bool)

(assert (=> tb!6039 (= result!11913 tp_is_empty!20161)))

(assert (=> b!934430 t!27284))

(declare-fun b_and!28849 () Bool)

(assert (= b_and!28847 (and (=> t!27284 result!11913) b_and!28849)))

(declare-fun m!868213 () Bool)

(assert (=> b!934419 m!868213))

(declare-fun m!868215 () Bool)

(assert (=> b!934430 m!868215))

(declare-fun m!868217 () Bool)

(assert (=> b!934430 m!868217))

(declare-fun m!868219 () Bool)

(assert (=> b!934430 m!868219))

(declare-fun m!868221 () Bool)

(assert (=> b!934430 m!868221))

(declare-fun m!868223 () Bool)

(assert (=> b!934430 m!868223))

(assert (=> b!934430 m!868215))

(assert (=> b!934430 m!868221))

(assert (=> b!934430 m!868223))

(declare-fun m!868225 () Bool)

(assert (=> b!934430 m!868225))

(declare-fun m!868227 () Bool)

(assert (=> b!934430 m!868227))

(declare-fun m!868229 () Bool)

(assert (=> b!934430 m!868229))

(declare-fun m!868231 () Bool)

(assert (=> b!934430 m!868231))

(declare-fun m!868233 () Bool)

(assert (=> b!934430 m!868233))

(declare-fun m!868235 () Bool)

(assert (=> b!934430 m!868235))

(declare-fun m!868237 () Bool)

(assert (=> b!934430 m!868237))

(assert (=> b!934430 m!868233))

(declare-fun m!868239 () Bool)

(assert (=> b!934430 m!868239))

(declare-fun m!868241 () Bool)

(assert (=> b!934420 m!868241))

(declare-fun m!868243 () Bool)

(assert (=> b!934429 m!868243))

(declare-fun m!868245 () Bool)

(assert (=> start!79480 m!868245))

(declare-fun m!868247 () Bool)

(assert (=> start!79480 m!868247))

(declare-fun m!868249 () Bool)

(assert (=> start!79480 m!868249))

(declare-fun m!868251 () Bool)

(assert (=> b!934417 m!868251))

(declare-fun m!868253 () Bool)

(assert (=> b!934417 m!868253))

(declare-fun m!868255 () Bool)

(assert (=> b!934431 m!868255))

(declare-fun m!868257 () Bool)

(assert (=> b!934431 m!868257))

(declare-fun m!868259 () Bool)

(assert (=> mapNonEmpty!32004 m!868259))

(declare-fun m!868261 () Bool)

(assert (=> b!934422 m!868261))

(declare-fun m!868263 () Bool)

(assert (=> b!934426 m!868263))

(declare-fun m!868265 () Bool)

(assert (=> b!934421 m!868265))

(check-sat (not b!934419) tp_is_empty!20161 (not b!934422) (not b_next!17653) (not mapNonEmpty!32004) (not b!934431) (not b!934421) (not b!934426) (not b!934417) (not start!79480) (not b!934420) b_and!28849 (not b_lambda!13987) (not b!934430) (not b!934429))
(check-sat b_and!28849 (not b_next!17653))
(get-model)

(declare-fun b_lambda!13993 () Bool)

(assert (= b_lambda!13987 (or (and start!79480 b_free!17653) b_lambda!13993)))

(check-sat (not b!934419) b_and!28849 tp_is_empty!20161 (not b!934422) (not b_lambda!13993) (not b_next!17653) (not mapNonEmpty!32004) (not b!934431) (not b!934421) (not b!934426) (not b!934417) (not start!79480) (not b!934420) (not b!934430) (not b!934429))
(check-sat b_and!28849 (not b_next!17653))
(get-model)

(declare-fun d!112949 () Bool)

(declare-fun res!629452 () Bool)

(declare-fun e!524710 () Bool)

(assert (=> d!112949 (=> res!629452 e!524710)))

(assert (=> d!112949 (= res!629452 (= (select (arr!27056 _keys!1487) from!1844) k0!1099))))

(assert (=> d!112949 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!524710)))

(declare-fun b!934538 () Bool)

(declare-fun e!524711 () Bool)

(assert (=> b!934538 (= e!524710 e!524711)))

(declare-fun res!629453 () Bool)

(assert (=> b!934538 (=> (not res!629453) (not e!524711))))

(assert (=> b!934538 (= res!629453 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))

(declare-fun b!934539 () Bool)

(assert (=> b!934539 (= e!524711 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!112949 (not res!629452)) b!934538))

(assert (= (and b!934538 res!629453) b!934539))

(declare-fun m!868375 () Bool)

(assert (=> d!112949 m!868375))

(declare-fun m!868377 () Bool)

(assert (=> b!934539 m!868377))

(assert (=> b!934426 d!112949))

(declare-fun d!112951 () Bool)

(assert (=> d!112951 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79480 d!112951))

(declare-fun d!112953 () Bool)

(assert (=> d!112953 (= (array_inv!21120 _values!1231) (bvsge (size!27518 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79480 d!112953))

(declare-fun d!112955 () Bool)

(assert (=> d!112955 (= (array_inv!21121 _keys!1487) (bvsge (size!27517 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79480 d!112955))

(declare-fun b!934550 () Bool)

(declare-fun e!524722 () Bool)

(declare-fun call!40609 () Bool)

(assert (=> b!934550 (= e!524722 call!40609)))

(declare-fun b!934551 () Bool)

(declare-fun e!524721 () Bool)

(declare-fun contains!5033 (List!19098 (_ BitVec 64)) Bool)

(assert (=> b!934551 (= e!524721 (contains!5033 Nil!19095 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934552 () Bool)

(declare-fun e!524723 () Bool)

(assert (=> b!934552 (= e!524723 e!524722)))

(declare-fun c!97114 () Bool)

(assert (=> b!934552 (= c!97114 (validKeyInArray!0 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40606 () Bool)

(assert (=> bm!40606 (= call!40609 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97114 (Cons!19094 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000) Nil!19095) Nil!19095)))))

(declare-fun b!934554 () Bool)

(assert (=> b!934554 (= e!524722 call!40609)))

(declare-fun d!112957 () Bool)

(declare-fun res!629461 () Bool)

(declare-fun e!524720 () Bool)

(assert (=> d!112957 (=> res!629461 e!524720)))

(assert (=> d!112957 (= res!629461 (bvsge #b00000000000000000000000000000000 (size!27517 _keys!1487)))))

(assert (=> d!112957 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19095) e!524720)))

(declare-fun b!934553 () Bool)

(assert (=> b!934553 (= e!524720 e!524723)))

(declare-fun res!629462 () Bool)

(assert (=> b!934553 (=> (not res!629462) (not e!524723))))

(assert (=> b!934553 (= res!629462 (not e!524721))))

(declare-fun res!629460 () Bool)

(assert (=> b!934553 (=> (not res!629460) (not e!524721))))

(assert (=> b!934553 (= res!629460 (validKeyInArray!0 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!112957 (not res!629461)) b!934553))

(assert (= (and b!934553 res!629460) b!934551))

(assert (= (and b!934553 res!629462) b!934552))

(assert (= (and b!934552 c!97114) b!934550))

(assert (= (and b!934552 (not c!97114)) b!934554))

(assert (= (or b!934550 b!934554) bm!40606))

(declare-fun m!868379 () Bool)

(assert (=> b!934551 m!868379))

(assert (=> b!934551 m!868379))

(declare-fun m!868381 () Bool)

(assert (=> b!934551 m!868381))

(assert (=> b!934552 m!868379))

(assert (=> b!934552 m!868379))

(declare-fun m!868383 () Bool)

(assert (=> b!934552 m!868383))

(assert (=> bm!40606 m!868379))

(declare-fun m!868385 () Bool)

(assert (=> bm!40606 m!868385))

(assert (=> b!934553 m!868379))

(assert (=> b!934553 m!868379))

(assert (=> b!934553 m!868383))

(assert (=> b!934420 d!112957))

(declare-fun d!112959 () Bool)

(declare-fun e!524729 () Bool)

(assert (=> d!112959 e!524729))

(declare-fun res!629465 () Bool)

(assert (=> d!112959 (=> res!629465 e!524729)))

(declare-fun lt!420916 () Bool)

(assert (=> d!112959 (= res!629465 (not lt!420916))))

(declare-fun lt!420918 () Bool)

(assert (=> d!112959 (= lt!420916 lt!420918)))

(declare-fun lt!420919 () Unit!31443)

(declare-fun e!524728 () Unit!31443)

(assert (=> d!112959 (= lt!420919 e!524728)))

(declare-fun c!97117 () Bool)

(assert (=> d!112959 (= c!97117 lt!420918)))

(declare-fun containsKey!447 (List!19097 (_ BitVec 64)) Bool)

(assert (=> d!112959 (= lt!420918 (containsKey!447 (toList!6034 (+!2834 lt!420859 lt!420857)) k0!1099))))

(assert (=> d!112959 (= (contains!5031 (+!2834 lt!420859 lt!420857) k0!1099) lt!420916)))

(declare-fun b!934561 () Bool)

(declare-fun lt!420917 () Unit!31443)

(assert (=> b!934561 (= e!524728 lt!420917)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!342 (List!19097 (_ BitVec 64)) Unit!31443)

(assert (=> b!934561 (= lt!420917 (lemmaContainsKeyImpliesGetValueByKeyDefined!342 (toList!6034 (+!2834 lt!420859 lt!420857)) k0!1099))))

(declare-datatypes ((Option!489 0))(
  ( (Some!488 (v!12653 V!31847)) (None!487) )
))
(declare-fun isDefined!355 (Option!489) Bool)

(declare-fun getValueByKey!483 (List!19097 (_ BitVec 64)) Option!489)

(assert (=> b!934561 (isDefined!355 (getValueByKey!483 (toList!6034 (+!2834 lt!420859 lt!420857)) k0!1099))))

(declare-fun b!934562 () Bool)

(declare-fun Unit!31447 () Unit!31443)

(assert (=> b!934562 (= e!524728 Unit!31447)))

(declare-fun b!934563 () Bool)

(assert (=> b!934563 (= e!524729 (isDefined!355 (getValueByKey!483 (toList!6034 (+!2834 lt!420859 lt!420857)) k0!1099)))))

(assert (= (and d!112959 c!97117) b!934561))

(assert (= (and d!112959 (not c!97117)) b!934562))

(assert (= (and d!112959 (not res!629465)) b!934563))

(declare-fun m!868387 () Bool)

(assert (=> d!112959 m!868387))

(declare-fun m!868389 () Bool)

(assert (=> b!934561 m!868389))

(declare-fun m!868391 () Bool)

(assert (=> b!934561 m!868391))

(assert (=> b!934561 m!868391))

(declare-fun m!868393 () Bool)

(assert (=> b!934561 m!868393))

(assert (=> b!934563 m!868391))

(assert (=> b!934563 m!868391))

(assert (=> b!934563 m!868393))

(assert (=> b!934430 d!112959))

(declare-fun b!934606 () Bool)

(declare-fun res!629485 () Bool)

(declare-fun e!524759 () Bool)

(assert (=> b!934606 (=> (not res!629485) (not e!524759))))

(declare-fun e!524762 () Bool)

(assert (=> b!934606 (= res!629485 e!524762)))

(declare-fun res!629491 () Bool)

(assert (=> b!934606 (=> res!629491 e!524762)))

(declare-fun e!524756 () Bool)

(assert (=> b!934606 (= res!629491 (not e!524756))))

(declare-fun res!629489 () Bool)

(assert (=> b!934606 (=> (not res!629489) (not e!524756))))

(assert (=> b!934606 (= res!629489 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))

(declare-fun b!934607 () Bool)

(declare-fun e!524766 () ListLongMap!12037)

(declare-fun call!40626 () ListLongMap!12037)

(assert (=> b!934607 (= e!524766 (+!2834 call!40626 (tuple2!13351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934608 () Bool)

(declare-fun e!524761 () ListLongMap!12037)

(declare-fun call!40629 () ListLongMap!12037)

(assert (=> b!934608 (= e!524761 call!40629)))

(declare-fun b!934609 () Bool)

(declare-fun e!524764 () Unit!31443)

(declare-fun lt!420978 () Unit!31443)

(assert (=> b!934609 (= e!524764 lt!420978)))

(declare-fun lt!420968 () ListLongMap!12037)

(declare-fun getCurrentListMapNoExtraKeys!3336 (array!56225 array!56227 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) ListLongMap!12037)

(assert (=> b!934609 (= lt!420968 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420974 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420983 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420983 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420975 () Unit!31443)

(assert (=> b!934609 (= lt!420975 (addStillContains!523 lt!420968 lt!420974 zeroValue!1173 lt!420983))))

(assert (=> b!934609 (contains!5031 (+!2834 lt!420968 (tuple2!13351 lt!420974 zeroValue!1173)) lt!420983)))

(declare-fun lt!420981 () Unit!31443)

(assert (=> b!934609 (= lt!420981 lt!420975)))

(declare-fun lt!420966 () ListLongMap!12037)

(assert (=> b!934609 (= lt!420966 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420967 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420967 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420976 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420976 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420977 () Unit!31443)

(declare-fun addApplyDifferent!414 (ListLongMap!12037 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31443)

(assert (=> b!934609 (= lt!420977 (addApplyDifferent!414 lt!420966 lt!420967 minValue!1173 lt!420976))))

(assert (=> b!934609 (= (apply!814 (+!2834 lt!420966 (tuple2!13351 lt!420967 minValue!1173)) lt!420976) (apply!814 lt!420966 lt!420976))))

(declare-fun lt!420980 () Unit!31443)

(assert (=> b!934609 (= lt!420980 lt!420977)))

(declare-fun lt!420971 () ListLongMap!12037)

(assert (=> b!934609 (= lt!420971 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420984 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420973 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420973 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420970 () Unit!31443)

(assert (=> b!934609 (= lt!420970 (addApplyDifferent!414 lt!420971 lt!420984 zeroValue!1173 lt!420973))))

(assert (=> b!934609 (= (apply!814 (+!2834 lt!420971 (tuple2!13351 lt!420984 zeroValue!1173)) lt!420973) (apply!814 lt!420971 lt!420973))))

(declare-fun lt!420979 () Unit!31443)

(assert (=> b!934609 (= lt!420979 lt!420970)))

(declare-fun lt!420965 () ListLongMap!12037)

(assert (=> b!934609 (= lt!420965 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!420982 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420982 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420969 () (_ BitVec 64))

(assert (=> b!934609 (= lt!420969 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!934609 (= lt!420978 (addApplyDifferent!414 lt!420965 lt!420982 minValue!1173 lt!420969))))

(assert (=> b!934609 (= (apply!814 (+!2834 lt!420965 (tuple2!13351 lt!420982 minValue!1173)) lt!420969) (apply!814 lt!420965 lt!420969))))

(declare-fun b!934610 () Bool)

(declare-fun e!524763 () Bool)

(declare-fun e!524757 () Bool)

(assert (=> b!934610 (= e!524763 e!524757)))

(declare-fun res!629490 () Bool)

(declare-fun call!40624 () Bool)

(assert (=> b!934610 (= res!629490 call!40624)))

(assert (=> b!934610 (=> (not res!629490) (not e!524757))))

(declare-fun b!934611 () Bool)

(declare-fun e!524768 () ListLongMap!12037)

(assert (=> b!934611 (= e!524768 call!40629)))

(declare-fun d!112961 () Bool)

(assert (=> d!112961 e!524759))

(declare-fun res!629487 () Bool)

(assert (=> d!112961 (=> (not res!629487) (not e!524759))))

(assert (=> d!112961 (= res!629487 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))))

(declare-fun lt!420964 () ListLongMap!12037)

(declare-fun lt!420985 () ListLongMap!12037)

(assert (=> d!112961 (= lt!420964 lt!420985)))

(declare-fun lt!420972 () Unit!31443)

(assert (=> d!112961 (= lt!420972 e!524764)))

(declare-fun c!97130 () Bool)

(declare-fun e!524758 () Bool)

(assert (=> d!112961 (= c!97130 e!524758)))

(declare-fun res!629484 () Bool)

(assert (=> d!112961 (=> (not res!629484) (not e!524758))))

(assert (=> d!112961 (= res!629484 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))

(assert (=> d!112961 (= lt!420985 e!524766)))

(declare-fun c!97133 () Bool)

(assert (=> d!112961 (= c!97133 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112961 (validMask!0 mask!1881)))

(assert (=> d!112961 (= (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!420964)))

(declare-fun b!934612 () Bool)

(declare-fun call!40627 () ListLongMap!12037)

(assert (=> b!934612 (= e!524761 call!40627)))

(declare-fun call!40630 () ListLongMap!12037)

(declare-fun c!97132 () Bool)

(declare-fun call!40625 () ListLongMap!12037)

(declare-fun bm!40621 () Bool)

(assert (=> bm!40621 (= call!40626 (+!2834 (ite c!97133 call!40630 (ite c!97132 call!40625 call!40627)) (ite (or c!97133 c!97132) (tuple2!13351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934613 () Bool)

(declare-fun Unit!31448 () Unit!31443)

(assert (=> b!934613 (= e!524764 Unit!31448)))

(declare-fun b!934614 () Bool)

(assert (=> b!934614 (= e!524756 (validKeyInArray!0 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934615 () Bool)

(assert (=> b!934615 (= e!524757 (= (apply!814 lt!420964 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934616 () Bool)

(declare-fun e!524767 () Bool)

(declare-fun call!40628 () Bool)

(assert (=> b!934616 (= e!524767 (not call!40628))))

(declare-fun bm!40622 () Bool)

(assert (=> bm!40622 (= call!40624 (contains!5031 lt!420964 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934617 () Bool)

(declare-fun c!97134 () Bool)

(assert (=> b!934617 (= c!97134 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934617 (= e!524768 e!524761)))

(declare-fun bm!40623 () Bool)

(assert (=> bm!40623 (= call!40625 call!40630)))

(declare-fun b!934618 () Bool)

(declare-fun e!524765 () Bool)

(assert (=> b!934618 (= e!524762 e!524765)))

(declare-fun res!629492 () Bool)

(assert (=> b!934618 (=> (not res!629492) (not e!524765))))

(assert (=> b!934618 (= res!629492 (contains!5031 lt!420964 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934618 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))

(declare-fun bm!40624 () Bool)

(assert (=> bm!40624 (= call!40628 (contains!5031 lt!420964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40625 () Bool)

(assert (=> bm!40625 (= call!40629 call!40626)))

(declare-fun b!934619 () Bool)

(assert (=> b!934619 (= e!524765 (= (apply!814 lt!420964 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14253 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934619 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27518 _values!1231)))))

(assert (=> b!934619 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))

(declare-fun bm!40626 () Bool)

(assert (=> bm!40626 (= call!40627 call!40625)))

(declare-fun b!934620 () Bool)

(assert (=> b!934620 (= e!524758 (validKeyInArray!0 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934621 () Bool)

(assert (=> b!934621 (= e!524763 (not call!40624))))

(declare-fun b!934622 () Bool)

(declare-fun e!524760 () Bool)

(assert (=> b!934622 (= e!524767 e!524760)))

(declare-fun res!629486 () Bool)

(assert (=> b!934622 (= res!629486 call!40628)))

(assert (=> b!934622 (=> (not res!629486) (not e!524760))))

(declare-fun b!934623 () Bool)

(assert (=> b!934623 (= e!524760 (= (apply!814 lt!420964 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934624 () Bool)

(assert (=> b!934624 (= e!524766 e!524768)))

(assert (=> b!934624 (= c!97132 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934625 () Bool)

(declare-fun res!629488 () Bool)

(assert (=> b!934625 (=> (not res!629488) (not e!524759))))

(assert (=> b!934625 (= res!629488 e!524767)))

(declare-fun c!97131 () Bool)

(assert (=> b!934625 (= c!97131 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934626 () Bool)

(assert (=> b!934626 (= e!524759 e!524763)))

(declare-fun c!97135 () Bool)

(assert (=> b!934626 (= c!97135 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40627 () Bool)

(assert (=> bm!40627 (= call!40630 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and d!112961 c!97133) b!934607))

(assert (= (and d!112961 (not c!97133)) b!934624))

(assert (= (and b!934624 c!97132) b!934611))

(assert (= (and b!934624 (not c!97132)) b!934617))

(assert (= (and b!934617 c!97134) b!934608))

(assert (= (and b!934617 (not c!97134)) b!934612))

(assert (= (or b!934608 b!934612) bm!40626))

(assert (= (or b!934611 bm!40626) bm!40623))

(assert (= (or b!934611 b!934608) bm!40625))

(assert (= (or b!934607 bm!40623) bm!40627))

(assert (= (or b!934607 bm!40625) bm!40621))

(assert (= (and d!112961 res!629484) b!934620))

(assert (= (and d!112961 c!97130) b!934609))

(assert (= (and d!112961 (not c!97130)) b!934613))

(assert (= (and d!112961 res!629487) b!934606))

(assert (= (and b!934606 res!629489) b!934614))

(assert (= (and b!934606 (not res!629491)) b!934618))

(assert (= (and b!934618 res!629492) b!934619))

(assert (= (and b!934606 res!629485) b!934625))

(assert (= (and b!934625 c!97131) b!934622))

(assert (= (and b!934625 (not c!97131)) b!934616))

(assert (= (and b!934622 res!629486) b!934623))

(assert (= (or b!934622 b!934616) bm!40624))

(assert (= (and b!934625 res!629488) b!934626))

(assert (= (and b!934626 c!97135) b!934610))

(assert (= (and b!934626 (not c!97135)) b!934621))

(assert (= (and b!934610 res!629490) b!934615))

(assert (= (or b!934610 b!934621) bm!40622))

(declare-fun b_lambda!13995 () Bool)

(assert (=> (not b_lambda!13995) (not b!934619)))

(assert (=> b!934619 t!27284))

(declare-fun b_and!28859 () Bool)

(assert (= b_and!28849 (and (=> t!27284 result!11913) b_and!28859)))

(declare-fun m!868395 () Bool)

(assert (=> bm!40621 m!868395))

(assert (=> b!934619 m!868221))

(assert (=> b!934619 m!868223))

(assert (=> b!934619 m!868257))

(assert (=> b!934619 m!868221))

(assert (=> b!934619 m!868223))

(assert (=> b!934619 m!868225))

(assert (=> b!934619 m!868257))

(declare-fun m!868397 () Bool)

(assert (=> b!934619 m!868397))

(assert (=> d!112961 m!868245))

(declare-fun m!868399 () Bool)

(assert (=> bm!40622 m!868399))

(declare-fun m!868401 () Bool)

(assert (=> bm!40627 m!868401))

(declare-fun m!868403 () Bool)

(assert (=> b!934615 m!868403))

(assert (=> b!934614 m!868257))

(assert (=> b!934614 m!868257))

(declare-fun m!868405 () Bool)

(assert (=> b!934614 m!868405))

(declare-fun m!868407 () Bool)

(assert (=> b!934607 m!868407))

(assert (=> b!934620 m!868257))

(assert (=> b!934620 m!868257))

(assert (=> b!934620 m!868405))

(declare-fun m!868409 () Bool)

(assert (=> b!934609 m!868409))

(declare-fun m!868411 () Bool)

(assert (=> b!934609 m!868411))

(declare-fun m!868413 () Bool)

(assert (=> b!934609 m!868413))

(declare-fun m!868415 () Bool)

(assert (=> b!934609 m!868415))

(declare-fun m!868417 () Bool)

(assert (=> b!934609 m!868417))

(declare-fun m!868419 () Bool)

(assert (=> b!934609 m!868419))

(assert (=> b!934609 m!868401))

(declare-fun m!868421 () Bool)

(assert (=> b!934609 m!868421))

(declare-fun m!868423 () Bool)

(assert (=> b!934609 m!868423))

(assert (=> b!934609 m!868421))

(declare-fun m!868425 () Bool)

(assert (=> b!934609 m!868425))

(declare-fun m!868427 () Bool)

(assert (=> b!934609 m!868427))

(assert (=> b!934609 m!868419))

(declare-fun m!868429 () Bool)

(assert (=> b!934609 m!868429))

(assert (=> b!934609 m!868427))

(declare-fun m!868431 () Bool)

(assert (=> b!934609 m!868431))

(assert (=> b!934609 m!868257))

(declare-fun m!868433 () Bool)

(assert (=> b!934609 m!868433))

(declare-fun m!868435 () Bool)

(assert (=> b!934609 m!868435))

(assert (=> b!934609 m!868411))

(declare-fun m!868437 () Bool)

(assert (=> b!934609 m!868437))

(assert (=> b!934618 m!868257))

(assert (=> b!934618 m!868257))

(declare-fun m!868439 () Bool)

(assert (=> b!934618 m!868439))

(declare-fun m!868441 () Bool)

(assert (=> bm!40624 m!868441))

(declare-fun m!868443 () Bool)

(assert (=> b!934623 m!868443))

(assert (=> b!934430 d!112961))

(declare-fun b!934627 () Bool)

(declare-fun res!629494 () Bool)

(declare-fun e!524772 () Bool)

(assert (=> b!934627 (=> (not res!629494) (not e!524772))))

(declare-fun e!524775 () Bool)

(assert (=> b!934627 (= res!629494 e!524775)))

(declare-fun res!629500 () Bool)

(assert (=> b!934627 (=> res!629500 e!524775)))

(declare-fun e!524769 () Bool)

(assert (=> b!934627 (= res!629500 (not e!524769))))

(declare-fun res!629498 () Bool)

(assert (=> b!934627 (=> (not res!629498) (not e!524769))))

(assert (=> b!934627 (= res!629498 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27517 _keys!1487)))))

(declare-fun b!934628 () Bool)

(declare-fun e!524779 () ListLongMap!12037)

(declare-fun call!40633 () ListLongMap!12037)

(assert (=> b!934628 (= e!524779 (+!2834 call!40633 (tuple2!13351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934629 () Bool)

(declare-fun e!524774 () ListLongMap!12037)

(declare-fun call!40636 () ListLongMap!12037)

(assert (=> b!934629 (= e!524774 call!40636)))

(declare-fun b!934630 () Bool)

(declare-fun e!524777 () Unit!31443)

(declare-fun lt!421000 () Unit!31443)

(assert (=> b!934630 (= e!524777 lt!421000)))

(declare-fun lt!420990 () ListLongMap!12037)

(assert (=> b!934630 (= lt!420990 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420996 () (_ BitVec 64))

(assert (=> b!934630 (= lt!420996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421005 () (_ BitVec 64))

(assert (=> b!934630 (= lt!421005 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420997 () Unit!31443)

(assert (=> b!934630 (= lt!420997 (addStillContains!523 lt!420990 lt!420996 zeroValue!1173 lt!421005))))

(assert (=> b!934630 (contains!5031 (+!2834 lt!420990 (tuple2!13351 lt!420996 zeroValue!1173)) lt!421005)))

(declare-fun lt!421003 () Unit!31443)

(assert (=> b!934630 (= lt!421003 lt!420997)))

(declare-fun lt!420988 () ListLongMap!12037)

(assert (=> b!934630 (= lt!420988 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!420989 () (_ BitVec 64))

(assert (=> b!934630 (= lt!420989 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420998 () (_ BitVec 64))

(assert (=> b!934630 (= lt!420998 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420999 () Unit!31443)

(assert (=> b!934630 (= lt!420999 (addApplyDifferent!414 lt!420988 lt!420989 minValue!1173 lt!420998))))

(assert (=> b!934630 (= (apply!814 (+!2834 lt!420988 (tuple2!13351 lt!420989 minValue!1173)) lt!420998) (apply!814 lt!420988 lt!420998))))

(declare-fun lt!421002 () Unit!31443)

(assert (=> b!934630 (= lt!421002 lt!420999)))

(declare-fun lt!420993 () ListLongMap!12037)

(assert (=> b!934630 (= lt!420993 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421006 () (_ BitVec 64))

(assert (=> b!934630 (= lt!421006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420995 () (_ BitVec 64))

(assert (=> b!934630 (= lt!420995 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!420992 () Unit!31443)

(assert (=> b!934630 (= lt!420992 (addApplyDifferent!414 lt!420993 lt!421006 zeroValue!1173 lt!420995))))

(assert (=> b!934630 (= (apply!814 (+!2834 lt!420993 (tuple2!13351 lt!421006 zeroValue!1173)) lt!420995) (apply!814 lt!420993 lt!420995))))

(declare-fun lt!421001 () Unit!31443)

(assert (=> b!934630 (= lt!421001 lt!420992)))

(declare-fun lt!420987 () ListLongMap!12037)

(assert (=> b!934630 (= lt!420987 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421004 () (_ BitVec 64))

(assert (=> b!934630 (= lt!421004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!420991 () (_ BitVec 64))

(assert (=> b!934630 (= lt!420991 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934630 (= lt!421000 (addApplyDifferent!414 lt!420987 lt!421004 minValue!1173 lt!420991))))

(assert (=> b!934630 (= (apply!814 (+!2834 lt!420987 (tuple2!13351 lt!421004 minValue!1173)) lt!420991) (apply!814 lt!420987 lt!420991))))

(declare-fun b!934631 () Bool)

(declare-fun e!524776 () Bool)

(declare-fun e!524770 () Bool)

(assert (=> b!934631 (= e!524776 e!524770)))

(declare-fun res!629499 () Bool)

(declare-fun call!40631 () Bool)

(assert (=> b!934631 (= res!629499 call!40631)))

(assert (=> b!934631 (=> (not res!629499) (not e!524770))))

(declare-fun b!934632 () Bool)

(declare-fun e!524781 () ListLongMap!12037)

(assert (=> b!934632 (= e!524781 call!40636)))

(declare-fun d!112963 () Bool)

(assert (=> d!112963 e!524772))

(declare-fun res!629496 () Bool)

(assert (=> d!112963 (=> (not res!629496) (not e!524772))))

(assert (=> d!112963 (= res!629496 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27517 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27517 _keys!1487)))))))

(declare-fun lt!420986 () ListLongMap!12037)

(declare-fun lt!421007 () ListLongMap!12037)

(assert (=> d!112963 (= lt!420986 lt!421007)))

(declare-fun lt!420994 () Unit!31443)

(assert (=> d!112963 (= lt!420994 e!524777)))

(declare-fun c!97136 () Bool)

(declare-fun e!524771 () Bool)

(assert (=> d!112963 (= c!97136 e!524771)))

(declare-fun res!629493 () Bool)

(assert (=> d!112963 (=> (not res!629493) (not e!524771))))

(assert (=> d!112963 (= res!629493 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27517 _keys!1487)))))

(assert (=> d!112963 (= lt!421007 e!524779)))

(declare-fun c!97139 () Bool)

(assert (=> d!112963 (= c!97139 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112963 (validMask!0 mask!1881)))

(assert (=> d!112963 (= (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420986)))

(declare-fun b!934633 () Bool)

(declare-fun call!40634 () ListLongMap!12037)

(assert (=> b!934633 (= e!524774 call!40634)))

(declare-fun call!40632 () ListLongMap!12037)

(declare-fun bm!40628 () Bool)

(declare-fun c!97138 () Bool)

(declare-fun call!40637 () ListLongMap!12037)

(assert (=> bm!40628 (= call!40633 (+!2834 (ite c!97139 call!40637 (ite c!97138 call!40632 call!40634)) (ite (or c!97139 c!97138) (tuple2!13351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934634 () Bool)

(declare-fun Unit!31449 () Unit!31443)

(assert (=> b!934634 (= e!524777 Unit!31449)))

(declare-fun b!934635 () Bool)

(assert (=> b!934635 (= e!524769 (validKeyInArray!0 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!934636 () Bool)

(assert (=> b!934636 (= e!524770 (= (apply!814 lt!420986 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934637 () Bool)

(declare-fun e!524780 () Bool)

(declare-fun call!40635 () Bool)

(assert (=> b!934637 (= e!524780 (not call!40635))))

(declare-fun bm!40629 () Bool)

(assert (=> bm!40629 (= call!40631 (contains!5031 lt!420986 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934638 () Bool)

(declare-fun c!97140 () Bool)

(assert (=> b!934638 (= c!97140 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934638 (= e!524781 e!524774)))

(declare-fun bm!40630 () Bool)

(assert (=> bm!40630 (= call!40632 call!40637)))

(declare-fun b!934639 () Bool)

(declare-fun e!524778 () Bool)

(assert (=> b!934639 (= e!524775 e!524778)))

(declare-fun res!629501 () Bool)

(assert (=> b!934639 (=> (not res!629501) (not e!524778))))

(assert (=> b!934639 (= res!629501 (contains!5031 lt!420986 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!934639 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27517 _keys!1487)))))

(declare-fun bm!40631 () Bool)

(assert (=> bm!40631 (= call!40635 (contains!5031 lt!420986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40632 () Bool)

(assert (=> bm!40632 (= call!40636 call!40633)))

(declare-fun b!934640 () Bool)

(assert (=> b!934640 (= e!524778 (= (apply!814 lt!420986 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14253 (select (arr!27057 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934640 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27518 _values!1231)))))

(assert (=> b!934640 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27517 _keys!1487)))))

(declare-fun bm!40633 () Bool)

(assert (=> bm!40633 (= call!40634 call!40632)))

(declare-fun b!934641 () Bool)

(assert (=> b!934641 (= e!524771 (validKeyInArray!0 (select (arr!27056 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!934642 () Bool)

(assert (=> b!934642 (= e!524776 (not call!40631))))

(declare-fun b!934643 () Bool)

(declare-fun e!524773 () Bool)

(assert (=> b!934643 (= e!524780 e!524773)))

(declare-fun res!629495 () Bool)

(assert (=> b!934643 (= res!629495 call!40635)))

(assert (=> b!934643 (=> (not res!629495) (not e!524773))))

(declare-fun b!934644 () Bool)

(assert (=> b!934644 (= e!524773 (= (apply!814 lt!420986 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934645 () Bool)

(assert (=> b!934645 (= e!524779 e!524781)))

(assert (=> b!934645 (= c!97138 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934646 () Bool)

(declare-fun res!629497 () Bool)

(assert (=> b!934646 (=> (not res!629497) (not e!524772))))

(assert (=> b!934646 (= res!629497 e!524780)))

(declare-fun c!97137 () Bool)

(assert (=> b!934646 (= c!97137 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934647 () Bool)

(assert (=> b!934647 (= e!524772 e!524776)))

(declare-fun c!97141 () Bool)

(assert (=> b!934647 (= c!97141 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40634 () Bool)

(assert (=> bm!40634 (= call!40637 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(assert (= (and d!112963 c!97139) b!934628))

(assert (= (and d!112963 (not c!97139)) b!934645))

(assert (= (and b!934645 c!97138) b!934632))

(assert (= (and b!934645 (not c!97138)) b!934638))

(assert (= (and b!934638 c!97140) b!934629))

(assert (= (and b!934638 (not c!97140)) b!934633))

(assert (= (or b!934629 b!934633) bm!40633))

(assert (= (or b!934632 bm!40633) bm!40630))

(assert (= (or b!934632 b!934629) bm!40632))

(assert (= (or b!934628 bm!40630) bm!40634))

(assert (= (or b!934628 bm!40632) bm!40628))

(assert (= (and d!112963 res!629493) b!934641))

(assert (= (and d!112963 c!97136) b!934630))

(assert (= (and d!112963 (not c!97136)) b!934634))

(assert (= (and d!112963 res!629496) b!934627))

(assert (= (and b!934627 res!629498) b!934635))

(assert (= (and b!934627 (not res!629500)) b!934639))

(assert (= (and b!934639 res!629501) b!934640))

(assert (= (and b!934627 res!629494) b!934646))

(assert (= (and b!934646 c!97137) b!934643))

(assert (= (and b!934646 (not c!97137)) b!934637))

(assert (= (and b!934643 res!629495) b!934644))

(assert (= (or b!934643 b!934637) bm!40631))

(assert (= (and b!934646 res!629497) b!934647))

(assert (= (and b!934647 c!97141) b!934631))

(assert (= (and b!934647 (not c!97141)) b!934642))

(assert (= (and b!934631 res!629499) b!934636))

(assert (= (or b!934631 b!934642) bm!40629))

(declare-fun b_lambda!13997 () Bool)

(assert (=> (not b_lambda!13997) (not b!934640)))

(assert (=> b!934640 t!27284))

(declare-fun b_and!28861 () Bool)

(assert (= b_and!28859 (and (=> t!27284 result!11913) b_and!28861)))

(declare-fun m!868445 () Bool)

(assert (=> bm!40628 m!868445))

(declare-fun m!868447 () Bool)

(assert (=> b!934640 m!868447))

(assert (=> b!934640 m!868223))

(declare-fun m!868449 () Bool)

(assert (=> b!934640 m!868449))

(assert (=> b!934640 m!868447))

(assert (=> b!934640 m!868223))

(declare-fun m!868451 () Bool)

(assert (=> b!934640 m!868451))

(assert (=> b!934640 m!868449))

(declare-fun m!868453 () Bool)

(assert (=> b!934640 m!868453))

(assert (=> d!112963 m!868245))

(declare-fun m!868455 () Bool)

(assert (=> bm!40629 m!868455))

(declare-fun m!868457 () Bool)

(assert (=> bm!40634 m!868457))

(declare-fun m!868459 () Bool)

(assert (=> b!934636 m!868459))

(assert (=> b!934635 m!868449))

(assert (=> b!934635 m!868449))

(declare-fun m!868461 () Bool)

(assert (=> b!934635 m!868461))

(declare-fun m!868463 () Bool)

(assert (=> b!934628 m!868463))

(assert (=> b!934641 m!868449))

(assert (=> b!934641 m!868449))

(assert (=> b!934641 m!868461))

(declare-fun m!868465 () Bool)

(assert (=> b!934630 m!868465))

(declare-fun m!868467 () Bool)

(assert (=> b!934630 m!868467))

(declare-fun m!868469 () Bool)

(assert (=> b!934630 m!868469))

(declare-fun m!868471 () Bool)

(assert (=> b!934630 m!868471))

(declare-fun m!868473 () Bool)

(assert (=> b!934630 m!868473))

(declare-fun m!868475 () Bool)

(assert (=> b!934630 m!868475))

(assert (=> b!934630 m!868457))

(declare-fun m!868477 () Bool)

(assert (=> b!934630 m!868477))

(declare-fun m!868479 () Bool)

(assert (=> b!934630 m!868479))

(assert (=> b!934630 m!868477))

(declare-fun m!868481 () Bool)

(assert (=> b!934630 m!868481))

(declare-fun m!868483 () Bool)

(assert (=> b!934630 m!868483))

(assert (=> b!934630 m!868475))

(declare-fun m!868485 () Bool)

(assert (=> b!934630 m!868485))

(assert (=> b!934630 m!868483))

(declare-fun m!868487 () Bool)

(assert (=> b!934630 m!868487))

(assert (=> b!934630 m!868449))

(declare-fun m!868489 () Bool)

(assert (=> b!934630 m!868489))

(declare-fun m!868491 () Bool)

(assert (=> b!934630 m!868491))

(assert (=> b!934630 m!868467))

(declare-fun m!868493 () Bool)

(assert (=> b!934630 m!868493))

(assert (=> b!934639 m!868449))

(assert (=> b!934639 m!868449))

(declare-fun m!868495 () Bool)

(assert (=> b!934639 m!868495))

(declare-fun m!868497 () Bool)

(assert (=> bm!40631 m!868497))

(declare-fun m!868499 () Bool)

(assert (=> b!934644 m!868499))

(assert (=> b!934430 d!112963))

(declare-fun d!112965 () Bool)

(declare-fun e!524784 () Bool)

(assert (=> d!112965 e!524784))

(declare-fun res!629506 () Bool)

(assert (=> d!112965 (=> (not res!629506) (not e!524784))))

(declare-fun lt!421018 () ListLongMap!12037)

(assert (=> d!112965 (= res!629506 (contains!5031 lt!421018 (_1!6686 lt!420857)))))

(declare-fun lt!421016 () List!19097)

(assert (=> d!112965 (= lt!421018 (ListLongMap!12038 lt!421016))))

(declare-fun lt!421017 () Unit!31443)

(declare-fun lt!421019 () Unit!31443)

(assert (=> d!112965 (= lt!421017 lt!421019)))

(assert (=> d!112965 (= (getValueByKey!483 lt!421016 (_1!6686 lt!420857)) (Some!488 (_2!6686 lt!420857)))))

(declare-fun lemmaContainsTupThenGetReturnValue!257 (List!19097 (_ BitVec 64) V!31847) Unit!31443)

(assert (=> d!112965 (= lt!421019 (lemmaContainsTupThenGetReturnValue!257 lt!421016 (_1!6686 lt!420857) (_2!6686 lt!420857)))))

(declare-fun insertStrictlySorted!314 (List!19097 (_ BitVec 64) V!31847) List!19097)

(assert (=> d!112965 (= lt!421016 (insertStrictlySorted!314 (toList!6034 lt!420859) (_1!6686 lt!420857) (_2!6686 lt!420857)))))

(assert (=> d!112965 (= (+!2834 lt!420859 lt!420857) lt!421018)))

(declare-fun b!934652 () Bool)

(declare-fun res!629507 () Bool)

(assert (=> b!934652 (=> (not res!629507) (not e!524784))))

(assert (=> b!934652 (= res!629507 (= (getValueByKey!483 (toList!6034 lt!421018) (_1!6686 lt!420857)) (Some!488 (_2!6686 lt!420857))))))

(declare-fun b!934653 () Bool)

(declare-fun contains!5034 (List!19097 tuple2!13350) Bool)

(assert (=> b!934653 (= e!524784 (contains!5034 (toList!6034 lt!421018) lt!420857))))

(assert (= (and d!112965 res!629506) b!934652))

(assert (= (and b!934652 res!629507) b!934653))

(declare-fun m!868501 () Bool)

(assert (=> d!112965 m!868501))

(declare-fun m!868503 () Bool)

(assert (=> d!112965 m!868503))

(declare-fun m!868505 () Bool)

(assert (=> d!112965 m!868505))

(declare-fun m!868507 () Bool)

(assert (=> d!112965 m!868507))

(declare-fun m!868509 () Bool)

(assert (=> b!934652 m!868509))

(declare-fun m!868511 () Bool)

(assert (=> b!934653 m!868511))

(assert (=> b!934430 d!112965))

(declare-fun d!112967 () Bool)

(assert (=> d!112967 (contains!5031 (+!2834 lt!420859 (tuple2!13351 lt!420858 lt!420855)) k0!1099)))

(declare-fun lt!421022 () Unit!31443)

(declare-fun choose!1553 (ListLongMap!12037 (_ BitVec 64) V!31847 (_ BitVec 64)) Unit!31443)

(assert (=> d!112967 (= lt!421022 (choose!1553 lt!420859 lt!420858 lt!420855 k0!1099))))

(assert (=> d!112967 (contains!5031 lt!420859 k0!1099)))

(assert (=> d!112967 (= (addStillContains!523 lt!420859 lt!420858 lt!420855 k0!1099) lt!421022)))

(declare-fun bs!26212 () Bool)

(assert (= bs!26212 d!112967))

(declare-fun m!868513 () Bool)

(assert (=> bs!26212 m!868513))

(assert (=> bs!26212 m!868513))

(declare-fun m!868515 () Bool)

(assert (=> bs!26212 m!868515))

(declare-fun m!868517 () Bool)

(assert (=> bs!26212 m!868517))

(assert (=> bs!26212 m!868251))

(assert (=> b!934430 d!112967))

(declare-fun d!112969 () Bool)

(declare-fun e!524787 () Bool)

(assert (=> d!112969 e!524787))

(declare-fun res!629510 () Bool)

(assert (=> d!112969 (=> (not res!629510) (not e!524787))))

(assert (=> d!112969 (= res!629510 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27518 _values!1231))))))

(declare-fun lt!421025 () Unit!31443)

(declare-fun choose!1554 (array!56225 array!56227 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 32) Int) Unit!31443)

(assert (=> d!112969 (= lt!421025 (choose!1554 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!112969 (validMask!0 mask!1881)))

(assert (=> d!112969 (= (lemmaListMapRecursiveValidKeyArray!198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421025)))

(declare-fun b!934657 () Bool)

(assert (=> b!934657 (= e!524787 (= (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2834 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13351 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14253 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!112969 res!629510) b!934657))

(declare-fun b_lambda!13999 () Bool)

(assert (=> (not b_lambda!13999) (not b!934657)))

(assert (=> b!934657 t!27284))

(declare-fun b_and!28863 () Bool)

(assert (= b_and!28861 (and (=> t!27284 result!11913) b_and!28863)))

(declare-fun m!868519 () Bool)

(assert (=> d!112969 m!868519))

(assert (=> d!112969 m!868245))

(assert (=> b!934657 m!868223))

(declare-fun m!868521 () Bool)

(assert (=> b!934657 m!868521))

(declare-fun m!868523 () Bool)

(assert (=> b!934657 m!868523))

(assert (=> b!934657 m!868221))

(assert (=> b!934657 m!868227))

(assert (=> b!934657 m!868521))

(assert (=> b!934657 m!868221))

(assert (=> b!934657 m!868223))

(assert (=> b!934657 m!868225))

(assert (=> b!934657 m!868257))

(assert (=> b!934430 d!112969))

(declare-fun b!934658 () Bool)

(declare-fun e!524790 () Bool)

(declare-fun call!40638 () Bool)

(assert (=> b!934658 (= e!524790 call!40638)))

(declare-fun b!934659 () Bool)

(declare-fun e!524789 () Bool)

(assert (=> b!934659 (= e!524789 (contains!5033 Nil!19095 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934660 () Bool)

(declare-fun e!524791 () Bool)

(assert (=> b!934660 (= e!524791 e!524790)))

(declare-fun c!97142 () Bool)

(assert (=> b!934660 (= c!97142 (validKeyInArray!0 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40635 () Bool)

(assert (=> bm!40635 (= call!40638 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97142 (Cons!19094 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19095) Nil!19095)))))

(declare-fun b!934662 () Bool)

(assert (=> b!934662 (= e!524790 call!40638)))

(declare-fun d!112971 () Bool)

(declare-fun res!629512 () Bool)

(declare-fun e!524788 () Bool)

(assert (=> d!112971 (=> res!629512 e!524788)))

(assert (=> d!112971 (= res!629512 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27517 _keys!1487)))))

(assert (=> d!112971 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19095) e!524788)))

(declare-fun b!934661 () Bool)

(assert (=> b!934661 (= e!524788 e!524791)))

(declare-fun res!629513 () Bool)

(assert (=> b!934661 (=> (not res!629513) (not e!524791))))

(assert (=> b!934661 (= res!629513 (not e!524789))))

(declare-fun res!629511 () Bool)

(assert (=> b!934661 (=> (not res!629511) (not e!524789))))

(assert (=> b!934661 (= res!629511 (validKeyInArray!0 (select (arr!27056 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (= (and d!112971 (not res!629512)) b!934661))

(assert (= (and b!934661 res!629511) b!934659))

(assert (= (and b!934661 res!629513) b!934660))

(assert (= (and b!934660 c!97142) b!934658))

(assert (= (and b!934660 (not c!97142)) b!934662))

(assert (= (or b!934658 b!934662) bm!40635))

(assert (=> b!934659 m!868257))

(assert (=> b!934659 m!868257))

(declare-fun m!868525 () Bool)

(assert (=> b!934659 m!868525))

(assert (=> b!934660 m!868257))

(assert (=> b!934660 m!868257))

(assert (=> b!934660 m!868405))

(assert (=> bm!40635 m!868257))

(declare-fun m!868527 () Bool)

(assert (=> bm!40635 m!868527))

(assert (=> b!934661 m!868257))

(assert (=> b!934661 m!868257))

(assert (=> b!934661 m!868405))

(assert (=> b!934430 d!112971))

(declare-fun d!112973 () Bool)

(declare-fun e!524792 () Bool)

(assert (=> d!112973 e!524792))

(declare-fun res!629514 () Bool)

(assert (=> d!112973 (=> (not res!629514) (not e!524792))))

(declare-fun lt!421028 () ListLongMap!12037)

(assert (=> d!112973 (= res!629514 (contains!5031 lt!421028 (_1!6686 lt!420857)))))

(declare-fun lt!421026 () List!19097)

(assert (=> d!112973 (= lt!421028 (ListLongMap!12038 lt!421026))))

(declare-fun lt!421027 () Unit!31443)

(declare-fun lt!421029 () Unit!31443)

(assert (=> d!112973 (= lt!421027 lt!421029)))

(assert (=> d!112973 (= (getValueByKey!483 lt!421026 (_1!6686 lt!420857)) (Some!488 (_2!6686 lt!420857)))))

(assert (=> d!112973 (= lt!421029 (lemmaContainsTupThenGetReturnValue!257 lt!421026 (_1!6686 lt!420857) (_2!6686 lt!420857)))))

(assert (=> d!112973 (= lt!421026 (insertStrictlySorted!314 (toList!6034 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6686 lt!420857) (_2!6686 lt!420857)))))

(assert (=> d!112973 (= (+!2834 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420857) lt!421028)))

(declare-fun b!934663 () Bool)

(declare-fun res!629515 () Bool)

(assert (=> b!934663 (=> (not res!629515) (not e!524792))))

(assert (=> b!934663 (= res!629515 (= (getValueByKey!483 (toList!6034 lt!421028) (_1!6686 lt!420857)) (Some!488 (_2!6686 lt!420857))))))

(declare-fun b!934664 () Bool)

(assert (=> b!934664 (= e!524792 (contains!5034 (toList!6034 lt!421028) lt!420857))))

(assert (= (and d!112973 res!629514) b!934663))

(assert (= (and b!934663 res!629515) b!934664))

(declare-fun m!868529 () Bool)

(assert (=> d!112973 m!868529))

(declare-fun m!868531 () Bool)

(assert (=> d!112973 m!868531))

(declare-fun m!868533 () Bool)

(assert (=> d!112973 m!868533))

(declare-fun m!868535 () Bool)

(assert (=> d!112973 m!868535))

(declare-fun m!868537 () Bool)

(assert (=> b!934663 m!868537))

(declare-fun m!868539 () Bool)

(assert (=> b!934664 m!868539))

(assert (=> b!934430 d!112973))

(declare-fun d!112975 () Bool)

(declare-fun e!524795 () Bool)

(assert (=> d!112975 e!524795))

(declare-fun c!97145 () Bool)

(assert (=> d!112975 (= c!97145 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421032 () Unit!31443)

(declare-fun choose!1555 (array!56225 array!56227 (_ BitVec 32) (_ BitVec 32) V!31847 V!31847 (_ BitVec 64) (_ BitVec 32) Int) Unit!31443)

(assert (=> d!112975 (= lt!421032 (choose!1555 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!112975 (validMask!0 mask!1881)))

(assert (=> d!112975 (= (lemmaListMapContainsThenArrayContainsFrom!281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421032)))

(declare-fun b!934669 () Bool)

(assert (=> b!934669 (= e!524795 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934670 () Bool)

(assert (=> b!934670 (= e!524795 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112975 c!97145) b!934669))

(assert (= (and d!112975 (not c!97145)) b!934670))

(declare-fun m!868541 () Bool)

(assert (=> d!112975 m!868541))

(assert (=> d!112975 m!868245))

(assert (=> b!934669 m!868263))

(assert (=> b!934430 d!112975))

(declare-fun d!112977 () Bool)

(declare-fun c!97148 () Bool)

(assert (=> d!112977 (= c!97148 ((_ is ValueCellFull!9599) (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!524798 () V!31847)

(assert (=> d!112977 (= (get!14253 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!524798)))

(declare-fun b!934675 () Bool)

(declare-fun get!14255 (ValueCell!9599 V!31847) V!31847)

(assert (=> b!934675 (= e!524798 (get!14255 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!934676 () Bool)

(declare-fun get!14256 (ValueCell!9599 V!31847) V!31847)

(assert (=> b!934676 (= e!524798 (get!14256 (select (arr!27057 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112977 c!97148) b!934675))

(assert (= (and d!112977 (not c!97148)) b!934676))

(assert (=> b!934675 m!868221))

(assert (=> b!934675 m!868223))

(declare-fun m!868543 () Bool)

(assert (=> b!934675 m!868543))

(assert (=> b!934676 m!868221))

(assert (=> b!934676 m!868223))

(declare-fun m!868545 () Bool)

(assert (=> b!934676 m!868545))

(assert (=> b!934430 d!112977))

(declare-fun d!112979 () Bool)

(assert (=> d!112979 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19095)))

(declare-fun lt!421035 () Unit!31443)

(declare-fun choose!39 (array!56225 (_ BitVec 32) (_ BitVec 32)) Unit!31443)

(assert (=> d!112979 (= lt!421035 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!112979 (bvslt (size!27517 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!112979 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421035)))

(declare-fun bs!26213 () Bool)

(assert (= bs!26213 d!112979))

(assert (=> bs!26213 m!868229))

(declare-fun m!868547 () Bool)

(assert (=> bs!26213 m!868547))

(assert (=> b!934430 d!112979))

(declare-fun d!112981 () Bool)

(declare-fun res!629520 () Bool)

(declare-fun e!524803 () Bool)

(assert (=> d!112981 (=> res!629520 e!524803)))

(assert (=> d!112981 (= res!629520 ((_ is Nil!19095) Nil!19095))))

(assert (=> d!112981 (= (noDuplicate!1357 Nil!19095) e!524803)))

(declare-fun b!934681 () Bool)

(declare-fun e!524804 () Bool)

(assert (=> b!934681 (= e!524803 e!524804)))

(declare-fun res!629521 () Bool)

(assert (=> b!934681 (=> (not res!629521) (not e!524804))))

(assert (=> b!934681 (= res!629521 (not (contains!5033 (t!27286 Nil!19095) (h!20240 Nil!19095))))))

(declare-fun b!934682 () Bool)

(assert (=> b!934682 (= e!524804 (noDuplicate!1357 (t!27286 Nil!19095)))))

(assert (= (and d!112981 (not res!629520)) b!934681))

(assert (= (and b!934681 res!629521) b!934682))

(declare-fun m!868549 () Bool)

(assert (=> b!934681 m!868549))

(declare-fun m!868551 () Bool)

(assert (=> b!934682 m!868551))

(assert (=> b!934429 d!112981))

(declare-fun bm!40638 () Bool)

(declare-fun call!40641 () Bool)

(assert (=> bm!40638 (= call!40641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!934691 () Bool)

(declare-fun e!524812 () Bool)

(declare-fun e!524813 () Bool)

(assert (=> b!934691 (= e!524812 e!524813)))

(declare-fun lt!421043 () (_ BitVec 64))

(assert (=> b!934691 (= lt!421043 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421042 () Unit!31443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56225 (_ BitVec 64) (_ BitVec 32)) Unit!31443)

(assert (=> b!934691 (= lt!421042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421043 #b00000000000000000000000000000000))))

(assert (=> b!934691 (arrayContainsKey!0 _keys!1487 lt!421043 #b00000000000000000000000000000000)))

(declare-fun lt!421044 () Unit!31443)

(assert (=> b!934691 (= lt!421044 lt!421042)))

(declare-fun res!629527 () Bool)

(declare-datatypes ((SeekEntryResult!8978 0))(
  ( (MissingZero!8978 (index!38283 (_ BitVec 32))) (Found!8978 (index!38284 (_ BitVec 32))) (Intermediate!8978 (undefined!9790 Bool) (index!38285 (_ BitVec 32)) (x!80170 (_ BitVec 32))) (Undefined!8978) (MissingVacant!8978 (index!38286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56225 (_ BitVec 32)) SeekEntryResult!8978)

(assert (=> b!934691 (= res!629527 (= (seekEntryOrOpen!0 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8978 #b00000000000000000000000000000000)))))

(assert (=> b!934691 (=> (not res!629527) (not e!524813))))

(declare-fun b!934692 () Bool)

(assert (=> b!934692 (= e!524813 call!40641)))

(declare-fun b!934693 () Bool)

(declare-fun e!524811 () Bool)

(assert (=> b!934693 (= e!524811 e!524812)))

(declare-fun c!97151 () Bool)

(assert (=> b!934693 (= c!97151 (validKeyInArray!0 (select (arr!27056 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934694 () Bool)

(assert (=> b!934694 (= e!524812 call!40641)))

(declare-fun d!112983 () Bool)

(declare-fun res!629526 () Bool)

(assert (=> d!112983 (=> res!629526 e!524811)))

(assert (=> d!112983 (= res!629526 (bvsge #b00000000000000000000000000000000 (size!27517 _keys!1487)))))

(assert (=> d!112983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!524811)))

(assert (= (and d!112983 (not res!629526)) b!934693))

(assert (= (and b!934693 c!97151) b!934691))

(assert (= (and b!934693 (not c!97151)) b!934694))

(assert (= (and b!934691 res!629527) b!934692))

(assert (= (or b!934692 b!934694) bm!40638))

(declare-fun m!868553 () Bool)

(assert (=> bm!40638 m!868553))

(assert (=> b!934691 m!868379))

(declare-fun m!868555 () Bool)

(assert (=> b!934691 m!868555))

(declare-fun m!868557 () Bool)

(assert (=> b!934691 m!868557))

(assert (=> b!934691 m!868379))

(declare-fun m!868559 () Bool)

(assert (=> b!934691 m!868559))

(assert (=> b!934693 m!868379))

(assert (=> b!934693 m!868379))

(assert (=> b!934693 m!868383))

(assert (=> b!934419 d!112983))

(declare-fun d!112985 () Bool)

(assert (=> d!112985 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934422 d!112985))

(declare-fun d!112987 () Bool)

(declare-fun get!14257 (Option!489) V!31847)

(assert (=> d!112987 (= (apply!814 lt!420859 k0!1099) (get!14257 (getValueByKey!483 (toList!6034 lt!420859) k0!1099)))))

(declare-fun bs!26214 () Bool)

(assert (= bs!26214 d!112987))

(declare-fun m!868561 () Bool)

(assert (=> bs!26214 m!868561))

(assert (=> bs!26214 m!868561))

(declare-fun m!868563 () Bool)

(assert (=> bs!26214 m!868563))

(assert (=> b!934421 d!112987))

(declare-fun d!112989 () Bool)

(assert (=> d!112989 (= (validKeyInArray!0 lt!420858) (and (not (= lt!420858 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!420858 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934431 d!112989))

(declare-fun d!112991 () Bool)

(declare-fun e!524815 () Bool)

(assert (=> d!112991 e!524815))

(declare-fun res!629528 () Bool)

(assert (=> d!112991 (=> res!629528 e!524815)))

(declare-fun lt!421045 () Bool)

(assert (=> d!112991 (= res!629528 (not lt!421045))))

(declare-fun lt!421047 () Bool)

(assert (=> d!112991 (= lt!421045 lt!421047)))

(declare-fun lt!421048 () Unit!31443)

(declare-fun e!524814 () Unit!31443)

(assert (=> d!112991 (= lt!421048 e!524814)))

(declare-fun c!97152 () Bool)

(assert (=> d!112991 (= c!97152 lt!421047)))

(assert (=> d!112991 (= lt!421047 (containsKey!447 (toList!6034 lt!420859) k0!1099))))

(assert (=> d!112991 (= (contains!5031 lt!420859 k0!1099) lt!421045)))

(declare-fun b!934695 () Bool)

(declare-fun lt!421046 () Unit!31443)

(assert (=> b!934695 (= e!524814 lt!421046)))

(assert (=> b!934695 (= lt!421046 (lemmaContainsKeyImpliesGetValueByKeyDefined!342 (toList!6034 lt!420859) k0!1099))))

(assert (=> b!934695 (isDefined!355 (getValueByKey!483 (toList!6034 lt!420859) k0!1099))))

(declare-fun b!934696 () Bool)

(declare-fun Unit!31450 () Unit!31443)

(assert (=> b!934696 (= e!524814 Unit!31450)))

(declare-fun b!934697 () Bool)

(assert (=> b!934697 (= e!524815 (isDefined!355 (getValueByKey!483 (toList!6034 lt!420859) k0!1099)))))

(assert (= (and d!112991 c!97152) b!934695))

(assert (= (and d!112991 (not c!97152)) b!934696))

(assert (= (and d!112991 (not res!629528)) b!934697))

(declare-fun m!868565 () Bool)

(assert (=> d!112991 m!868565))

(declare-fun m!868567 () Bool)

(assert (=> b!934695 m!868567))

(assert (=> b!934695 m!868561))

(assert (=> b!934695 m!868561))

(declare-fun m!868569 () Bool)

(assert (=> b!934695 m!868569))

(assert (=> b!934697 m!868561))

(assert (=> b!934697 m!868561))

(assert (=> b!934697 m!868569))

(assert (=> b!934417 d!112991))

(declare-fun b!934698 () Bool)

(declare-fun res!629530 () Bool)

(declare-fun e!524819 () Bool)

(assert (=> b!934698 (=> (not res!629530) (not e!524819))))

(declare-fun e!524822 () Bool)

(assert (=> b!934698 (= res!629530 e!524822)))

(declare-fun res!629536 () Bool)

(assert (=> b!934698 (=> res!629536 e!524822)))

(declare-fun e!524816 () Bool)

(assert (=> b!934698 (= res!629536 (not e!524816))))

(declare-fun res!629534 () Bool)

(assert (=> b!934698 (=> (not res!629534) (not e!524816))))

(assert (=> b!934698 (= res!629534 (bvslt from!1844 (size!27517 _keys!1487)))))

(declare-fun b!934699 () Bool)

(declare-fun e!524826 () ListLongMap!12037)

(declare-fun call!40644 () ListLongMap!12037)

(assert (=> b!934699 (= e!524826 (+!2834 call!40644 (tuple2!13351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!934700 () Bool)

(declare-fun e!524821 () ListLongMap!12037)

(declare-fun call!40647 () ListLongMap!12037)

(assert (=> b!934700 (= e!524821 call!40647)))

(declare-fun b!934701 () Bool)

(declare-fun e!524824 () Unit!31443)

(declare-fun lt!421063 () Unit!31443)

(assert (=> b!934701 (= e!524824 lt!421063)))

(declare-fun lt!421053 () ListLongMap!12037)

(assert (=> b!934701 (= lt!421053 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421059 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421068 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421068 (select (arr!27056 _keys!1487) from!1844))))

(declare-fun lt!421060 () Unit!31443)

(assert (=> b!934701 (= lt!421060 (addStillContains!523 lt!421053 lt!421059 zeroValue!1173 lt!421068))))

(assert (=> b!934701 (contains!5031 (+!2834 lt!421053 (tuple2!13351 lt!421059 zeroValue!1173)) lt!421068)))

(declare-fun lt!421066 () Unit!31443)

(assert (=> b!934701 (= lt!421066 lt!421060)))

(declare-fun lt!421051 () ListLongMap!12037)

(assert (=> b!934701 (= lt!421051 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421052 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421061 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421061 (select (arr!27056 _keys!1487) from!1844))))

(declare-fun lt!421062 () Unit!31443)

(assert (=> b!934701 (= lt!421062 (addApplyDifferent!414 lt!421051 lt!421052 minValue!1173 lt!421061))))

(assert (=> b!934701 (= (apply!814 (+!2834 lt!421051 (tuple2!13351 lt!421052 minValue!1173)) lt!421061) (apply!814 lt!421051 lt!421061))))

(declare-fun lt!421065 () Unit!31443)

(assert (=> b!934701 (= lt!421065 lt!421062)))

(declare-fun lt!421056 () ListLongMap!12037)

(assert (=> b!934701 (= lt!421056 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421069 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421058 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421058 (select (arr!27056 _keys!1487) from!1844))))

(declare-fun lt!421055 () Unit!31443)

(assert (=> b!934701 (= lt!421055 (addApplyDifferent!414 lt!421056 lt!421069 zeroValue!1173 lt!421058))))

(assert (=> b!934701 (= (apply!814 (+!2834 lt!421056 (tuple2!13351 lt!421069 zeroValue!1173)) lt!421058) (apply!814 lt!421056 lt!421058))))

(declare-fun lt!421064 () Unit!31443)

(assert (=> b!934701 (= lt!421064 lt!421055)))

(declare-fun lt!421050 () ListLongMap!12037)

(assert (=> b!934701 (= lt!421050 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421067 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421067 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421054 () (_ BitVec 64))

(assert (=> b!934701 (= lt!421054 (select (arr!27056 _keys!1487) from!1844))))

(assert (=> b!934701 (= lt!421063 (addApplyDifferent!414 lt!421050 lt!421067 minValue!1173 lt!421054))))

(assert (=> b!934701 (= (apply!814 (+!2834 lt!421050 (tuple2!13351 lt!421067 minValue!1173)) lt!421054) (apply!814 lt!421050 lt!421054))))

(declare-fun b!934702 () Bool)

(declare-fun e!524823 () Bool)

(declare-fun e!524817 () Bool)

(assert (=> b!934702 (= e!524823 e!524817)))

(declare-fun res!629535 () Bool)

(declare-fun call!40642 () Bool)

(assert (=> b!934702 (= res!629535 call!40642)))

(assert (=> b!934702 (=> (not res!629535) (not e!524817))))

(declare-fun b!934703 () Bool)

(declare-fun e!524828 () ListLongMap!12037)

(assert (=> b!934703 (= e!524828 call!40647)))

(declare-fun d!112993 () Bool)

(assert (=> d!112993 e!524819))

(declare-fun res!629532 () Bool)

(assert (=> d!112993 (=> (not res!629532) (not e!524819))))

(assert (=> d!112993 (= res!629532 (or (bvsge from!1844 (size!27517 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27517 _keys!1487)))))))

(declare-fun lt!421049 () ListLongMap!12037)

(declare-fun lt!421070 () ListLongMap!12037)

(assert (=> d!112993 (= lt!421049 lt!421070)))

(declare-fun lt!421057 () Unit!31443)

(assert (=> d!112993 (= lt!421057 e!524824)))

(declare-fun c!97153 () Bool)

(declare-fun e!524818 () Bool)

(assert (=> d!112993 (= c!97153 e!524818)))

(declare-fun res!629529 () Bool)

(assert (=> d!112993 (=> (not res!629529) (not e!524818))))

(assert (=> d!112993 (= res!629529 (bvslt from!1844 (size!27517 _keys!1487)))))

(assert (=> d!112993 (= lt!421070 e!524826)))

(declare-fun c!97156 () Bool)

(assert (=> d!112993 (= c!97156 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112993 (validMask!0 mask!1881)))

(assert (=> d!112993 (= (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421049)))

(declare-fun b!934704 () Bool)

(declare-fun call!40645 () ListLongMap!12037)

(assert (=> b!934704 (= e!524821 call!40645)))

(declare-fun call!40648 () ListLongMap!12037)

(declare-fun c!97155 () Bool)

(declare-fun bm!40639 () Bool)

(declare-fun call!40643 () ListLongMap!12037)

(assert (=> bm!40639 (= call!40644 (+!2834 (ite c!97156 call!40648 (ite c!97155 call!40643 call!40645)) (ite (or c!97156 c!97155) (tuple2!13351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!934705 () Bool)

(declare-fun Unit!31451 () Unit!31443)

(assert (=> b!934705 (= e!524824 Unit!31451)))

(declare-fun b!934706 () Bool)

(assert (=> b!934706 (= e!524816 (validKeyInArray!0 (select (arr!27056 _keys!1487) from!1844)))))

(declare-fun b!934707 () Bool)

(assert (=> b!934707 (= e!524817 (= (apply!814 lt!421049 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun b!934708 () Bool)

(declare-fun e!524827 () Bool)

(declare-fun call!40646 () Bool)

(assert (=> b!934708 (= e!524827 (not call!40646))))

(declare-fun bm!40640 () Bool)

(assert (=> bm!40640 (= call!40642 (contains!5031 lt!421049 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934709 () Bool)

(declare-fun c!97157 () Bool)

(assert (=> b!934709 (= c!97157 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!934709 (= e!524828 e!524821)))

(declare-fun bm!40641 () Bool)

(assert (=> bm!40641 (= call!40643 call!40648)))

(declare-fun b!934710 () Bool)

(declare-fun e!524825 () Bool)

(assert (=> b!934710 (= e!524822 e!524825)))

(declare-fun res!629537 () Bool)

(assert (=> b!934710 (=> (not res!629537) (not e!524825))))

(assert (=> b!934710 (= res!629537 (contains!5031 lt!421049 (select (arr!27056 _keys!1487) from!1844)))))

(assert (=> b!934710 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27517 _keys!1487)))))

(declare-fun bm!40642 () Bool)

(assert (=> bm!40642 (= call!40646 (contains!5031 lt!421049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40643 () Bool)

(assert (=> bm!40643 (= call!40647 call!40644)))

(declare-fun b!934711 () Bool)

(assert (=> b!934711 (= e!524825 (= (apply!814 lt!421049 (select (arr!27056 _keys!1487) from!1844)) (get!14253 (select (arr!27057 _values!1231) from!1844) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934711 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27518 _values!1231)))))

(assert (=> b!934711 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27517 _keys!1487)))))

(declare-fun bm!40644 () Bool)

(assert (=> bm!40644 (= call!40645 call!40643)))

(declare-fun b!934712 () Bool)

(assert (=> b!934712 (= e!524818 (validKeyInArray!0 (select (arr!27056 _keys!1487) from!1844)))))

(declare-fun b!934713 () Bool)

(assert (=> b!934713 (= e!524823 (not call!40642))))

(declare-fun b!934714 () Bool)

(declare-fun e!524820 () Bool)

(assert (=> b!934714 (= e!524827 e!524820)))

(declare-fun res!629531 () Bool)

(assert (=> b!934714 (= res!629531 call!40646)))

(assert (=> b!934714 (=> (not res!629531) (not e!524820))))

(declare-fun b!934715 () Bool)

(assert (=> b!934715 (= e!524820 (= (apply!814 lt!421049 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun b!934716 () Bool)

(assert (=> b!934716 (= e!524826 e!524828)))

(assert (=> b!934716 (= c!97155 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934717 () Bool)

(declare-fun res!629533 () Bool)

(assert (=> b!934717 (=> (not res!629533) (not e!524819))))

(assert (=> b!934717 (= res!629533 e!524827)))

(declare-fun c!97154 () Bool)

(assert (=> b!934717 (= c!97154 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934718 () Bool)

(assert (=> b!934718 (= e!524819 e!524823)))

(declare-fun c!97158 () Bool)

(assert (=> b!934718 (= c!97158 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40645 () Bool)

(assert (=> bm!40645 (= call!40648 (getCurrentListMapNoExtraKeys!3336 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and d!112993 c!97156) b!934699))

(assert (= (and d!112993 (not c!97156)) b!934716))

(assert (= (and b!934716 c!97155) b!934703))

(assert (= (and b!934716 (not c!97155)) b!934709))

(assert (= (and b!934709 c!97157) b!934700))

(assert (= (and b!934709 (not c!97157)) b!934704))

(assert (= (or b!934700 b!934704) bm!40644))

(assert (= (or b!934703 bm!40644) bm!40641))

(assert (= (or b!934703 b!934700) bm!40643))

(assert (= (or b!934699 bm!40641) bm!40645))

(assert (= (or b!934699 bm!40643) bm!40639))

(assert (= (and d!112993 res!629529) b!934712))

(assert (= (and d!112993 c!97153) b!934701))

(assert (= (and d!112993 (not c!97153)) b!934705))

(assert (= (and d!112993 res!629532) b!934698))

(assert (= (and b!934698 res!629534) b!934706))

(assert (= (and b!934698 (not res!629536)) b!934710))

(assert (= (and b!934710 res!629537) b!934711))

(assert (= (and b!934698 res!629530) b!934717))

(assert (= (and b!934717 c!97154) b!934714))

(assert (= (and b!934717 (not c!97154)) b!934708))

(assert (= (and b!934714 res!629531) b!934715))

(assert (= (or b!934714 b!934708) bm!40642))

(assert (= (and b!934717 res!629533) b!934718))

(assert (= (and b!934718 c!97158) b!934702))

(assert (= (and b!934718 (not c!97158)) b!934713))

(assert (= (and b!934702 res!629535) b!934707))

(assert (= (or b!934702 b!934713) bm!40640))

(declare-fun b_lambda!14001 () Bool)

(assert (=> (not b_lambda!14001) (not b!934711)))

(assert (=> b!934711 t!27284))

(declare-fun b_and!28865 () Bool)

(assert (= b_and!28863 (and (=> t!27284 result!11913) b_and!28865)))

(declare-fun m!868571 () Bool)

(assert (=> bm!40639 m!868571))

(declare-fun m!868573 () Bool)

(assert (=> b!934711 m!868573))

(assert (=> b!934711 m!868223))

(assert (=> b!934711 m!868375))

(assert (=> b!934711 m!868573))

(assert (=> b!934711 m!868223))

(declare-fun m!868575 () Bool)

(assert (=> b!934711 m!868575))

(assert (=> b!934711 m!868375))

(declare-fun m!868577 () Bool)

(assert (=> b!934711 m!868577))

(assert (=> d!112993 m!868245))

(declare-fun m!868579 () Bool)

(assert (=> bm!40640 m!868579))

(declare-fun m!868581 () Bool)

(assert (=> bm!40645 m!868581))

(declare-fun m!868583 () Bool)

(assert (=> b!934707 m!868583))

(assert (=> b!934706 m!868375))

(assert (=> b!934706 m!868375))

(declare-fun m!868585 () Bool)

(assert (=> b!934706 m!868585))

(declare-fun m!868587 () Bool)

(assert (=> b!934699 m!868587))

(assert (=> b!934712 m!868375))

(assert (=> b!934712 m!868375))

(assert (=> b!934712 m!868585))

(declare-fun m!868589 () Bool)

(assert (=> b!934701 m!868589))

(declare-fun m!868591 () Bool)

(assert (=> b!934701 m!868591))

(declare-fun m!868593 () Bool)

(assert (=> b!934701 m!868593))

(declare-fun m!868595 () Bool)

(assert (=> b!934701 m!868595))

(declare-fun m!868597 () Bool)

(assert (=> b!934701 m!868597))

(declare-fun m!868599 () Bool)

(assert (=> b!934701 m!868599))

(assert (=> b!934701 m!868581))

(declare-fun m!868601 () Bool)

(assert (=> b!934701 m!868601))

(declare-fun m!868603 () Bool)

(assert (=> b!934701 m!868603))

(assert (=> b!934701 m!868601))

(declare-fun m!868605 () Bool)

(assert (=> b!934701 m!868605))

(declare-fun m!868607 () Bool)

(assert (=> b!934701 m!868607))

(assert (=> b!934701 m!868599))

(declare-fun m!868609 () Bool)

(assert (=> b!934701 m!868609))

(assert (=> b!934701 m!868607))

(declare-fun m!868611 () Bool)

(assert (=> b!934701 m!868611))

(assert (=> b!934701 m!868375))

(declare-fun m!868613 () Bool)

(assert (=> b!934701 m!868613))

(declare-fun m!868615 () Bool)

(assert (=> b!934701 m!868615))

(assert (=> b!934701 m!868591))

(declare-fun m!868617 () Bool)

(assert (=> b!934701 m!868617))

(assert (=> b!934710 m!868375))

(assert (=> b!934710 m!868375))

(declare-fun m!868619 () Bool)

(assert (=> b!934710 m!868619))

(declare-fun m!868621 () Bool)

(assert (=> bm!40642 m!868621))

(declare-fun m!868623 () Bool)

(assert (=> b!934715 m!868623))

(assert (=> b!934417 d!112993))

(declare-fun condMapEmpty!32013 () Bool)

(declare-fun mapDefault!32013 () ValueCell!9599)

(assert (=> mapNonEmpty!32004 (= condMapEmpty!32013 (= mapRest!32004 ((as const (Array (_ BitVec 32) ValueCell!9599)) mapDefault!32013)))))

(declare-fun e!524834 () Bool)

(declare-fun mapRes!32013 () Bool)

(assert (=> mapNonEmpty!32004 (= tp!61407 (and e!524834 mapRes!32013))))

(declare-fun mapIsEmpty!32013 () Bool)

(assert (=> mapIsEmpty!32013 mapRes!32013))

(declare-fun b!934726 () Bool)

(assert (=> b!934726 (= e!524834 tp_is_empty!20161)))

(declare-fun mapNonEmpty!32013 () Bool)

(declare-fun tp!61422 () Bool)

(declare-fun e!524833 () Bool)

(assert (=> mapNonEmpty!32013 (= mapRes!32013 (and tp!61422 e!524833))))

(declare-fun mapValue!32013 () ValueCell!9599)

(declare-fun mapRest!32013 () (Array (_ BitVec 32) ValueCell!9599))

(declare-fun mapKey!32013 () (_ BitVec 32))

(assert (=> mapNonEmpty!32013 (= mapRest!32004 (store mapRest!32013 mapKey!32013 mapValue!32013))))

(declare-fun b!934725 () Bool)

(assert (=> b!934725 (= e!524833 tp_is_empty!20161)))

(assert (= (and mapNonEmpty!32004 condMapEmpty!32013) mapIsEmpty!32013))

(assert (= (and mapNonEmpty!32004 (not condMapEmpty!32013)) mapNonEmpty!32013))

(assert (= (and mapNonEmpty!32013 ((_ is ValueCellFull!9599) mapValue!32013)) b!934725))

(assert (= (and mapNonEmpty!32004 ((_ is ValueCellFull!9599) mapDefault!32013)) b!934726))

(declare-fun m!868625 () Bool)

(assert (=> mapNonEmpty!32013 m!868625))

(declare-fun b_lambda!14003 () Bool)

(assert (= b_lambda!13995 (or (and start!79480 b_free!17653) b_lambda!14003)))

(declare-fun b_lambda!14005 () Bool)

(assert (= b_lambda!13997 (or (and start!79480 b_free!17653) b_lambda!14005)))

(declare-fun b_lambda!14007 () Bool)

(assert (= b_lambda!14001 (or (and start!79480 b_free!17653) b_lambda!14007)))

(declare-fun b_lambda!14009 () Bool)

(assert (= b_lambda!13999 (or (and start!79480 b_free!17653) b_lambda!14009)))

(check-sat (not bm!40622) (not b!934682) tp_is_empty!20161 (not bm!40624) (not d!112987) (not b!934561) (not d!112959) (not d!112961) (not b!934630) (not b!934635) (not d!112973) (not bm!40631) (not b!934663) (not b!934620) (not bm!40629) (not b!934699) (not d!112993) (not b!934675) (not bm!40606) (not b!934539) (not bm!40639) (not d!112967) (not b!934609) b_and!28865 (not b!934553) (not b!934701) (not b!934644) (not b!934619) (not b!934697) (not bm!40634) (not bm!40640) (not b!934657) (not b!934715) (not b!934659) (not b!934695) (not b!934652) (not b!934706) (not b_lambda!14003) (not bm!40635) (not d!112965) (not bm!40638) (not b!934615) (not b!934707) (not b_lambda!13993) (not b_next!17653) (not b!934623) (not bm!40627) (not b!934607) (not b_lambda!14009) (not d!112975) (not bm!40642) (not b!934639) (not d!112991) (not b!934711) (not b!934712) (not d!112979) (not b!934669) (not b!934681) (not b!934636) (not b!934661) (not b!934618) (not bm!40628) (not b!934676) (not b!934640) (not b!934552) (not b!934710) (not b!934693) (not b!934653) (not b!934551) (not b!934641) (not b!934563) (not d!112969) (not b!934691) (not b!934660) (not bm!40645) (not mapNonEmpty!32013) (not b_lambda!14007) (not b!934664) (not b!934614) (not b_lambda!14005) (not bm!40621) (not d!112963) (not b!934628))
(check-sat b_and!28865 (not b_next!17653))
