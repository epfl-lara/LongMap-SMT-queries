; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84070 () Bool)

(assert start!84070)

(declare-fun b_free!19711 () Bool)

(declare-fun b_next!19711 () Bool)

(assert (=> start!84070 (= b_free!19711 (not b_next!19711))))

(declare-fun tp!68576 () Bool)

(declare-fun b_and!31521 () Bool)

(assert (=> start!84070 (= tp!68576 b_and!31521)))

(declare-fun b!981389 () Bool)

(declare-fun res!656532 () Bool)

(declare-fun e!553232 () Bool)

(assert (=> b!981389 (=> (not res!656532) (not e!553232))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981389 (= res!656532 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!981390 () Bool)

(declare-fun e!553234 () Bool)

(assert (=> b!981390 (= e!553232 (not e!553234))))

(declare-fun res!656528 () Bool)

(assert (=> b!981390 (=> res!656528 e!553234)))

(declare-datatypes ((array!61452 0))(
  ( (array!61453 (arr!29579 (Array (_ BitVec 32) (_ BitVec 64))) (size!30059 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61452)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981390 (= res!656528 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29579 _keys!1544) from!1932)))))

(declare-datatypes ((V!35257 0))(
  ( (V!35258 (val!11403 Int)) )
))
(declare-datatypes ((tuple2!14642 0))(
  ( (tuple2!14643 (_1!7332 (_ BitVec 64)) (_2!7332 V!35257)) )
))
(declare-fun lt!435711 () tuple2!14642)

(declare-datatypes ((List!20502 0))(
  ( (Nil!20499) (Cons!20498 (h!21666 tuple2!14642) (t!29161 List!20502)) )
))
(declare-datatypes ((ListLongMap!13341 0))(
  ( (ListLongMap!13342 (toList!6686 List!20502)) )
))
(declare-fun lt!435717 () ListLongMap!13341)

(declare-fun lt!435714 () ListLongMap!13341)

(declare-fun lt!435715 () tuple2!14642)

(declare-fun +!3001 (ListLongMap!13341 tuple2!14642) ListLongMap!13341)

(assert (=> b!981390 (= (+!3001 lt!435717 lt!435711) (+!3001 lt!435714 lt!435715))))

(declare-fun lt!435720 () ListLongMap!13341)

(assert (=> b!981390 (= lt!435714 (+!3001 lt!435720 lt!435711))))

(declare-fun lt!435718 () V!35257)

(assert (=> b!981390 (= lt!435711 (tuple2!14643 (select (arr!29579 _keys!1544) from!1932) lt!435718))))

(assert (=> b!981390 (= lt!435717 (+!3001 lt!435720 lt!435715))))

(declare-fun minValue!1220 () V!35257)

(assert (=> b!981390 (= lt!435715 (tuple2!14643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32582 0))(
  ( (Unit!32583) )
))
(declare-fun lt!435712 () Unit!32582)

(declare-fun addCommutativeForDiffKeys!608 (ListLongMap!13341 (_ BitVec 64) V!35257 (_ BitVec 64) V!35257) Unit!32582)

(assert (=> b!981390 (= lt!435712 (addCommutativeForDiffKeys!608 lt!435720 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29579 _keys!1544) from!1932) lt!435718))))

(declare-datatypes ((ValueCell!10871 0))(
  ( (ValueCellFull!10871 (v!13962 V!35257)) (EmptyCell!10871) )
))
(declare-datatypes ((array!61454 0))(
  ( (array!61455 (arr!29580 (Array (_ BitVec 32) ValueCell!10871)) (size!30060 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61454)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15361 (ValueCell!10871 V!35257) V!35257)

(declare-fun dynLambda!1794 (Int (_ BitVec 64)) V!35257)

(assert (=> b!981390 (= lt!435718 (get!15361 (select (arr!29580 _values!1278) from!1932) (dynLambda!1794 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435716 () ListLongMap!13341)

(declare-fun lt!435713 () tuple2!14642)

(assert (=> b!981390 (= lt!435720 (+!3001 lt!435716 lt!435713))))

(declare-fun zeroValue!1220 () V!35257)

(assert (=> b!981390 (= lt!435713 (tuple2!14643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3432 (array!61452 array!61454 (_ BitVec 32) (_ BitVec 32) V!35257 V!35257 (_ BitVec 32) Int) ListLongMap!13341)

(assert (=> b!981390 (= lt!435716 (getCurrentListMapNoExtraKeys!3432 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981391 () Bool)

(assert (=> b!981391 (= e!553234 true)))

(assert (=> b!981391 (= lt!435714 (+!3001 (+!3001 lt!435716 lt!435711) lt!435713))))

(declare-fun lt!435719 () Unit!32582)

(assert (=> b!981391 (= lt!435719 (addCommutativeForDiffKeys!608 lt!435716 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29579 _keys!1544) from!1932) lt!435718))))

(declare-fun b!981392 () Bool)

(declare-fun e!553233 () Bool)

(declare-fun tp_is_empty!22705 () Bool)

(assert (=> b!981392 (= e!553233 tp_is_empty!22705)))

(declare-fun b!981393 () Bool)

(declare-fun e!553231 () Bool)

(assert (=> b!981393 (= e!553231 tp_is_empty!22705)))

(declare-fun b!981394 () Bool)

(declare-fun res!656531 () Bool)

(assert (=> b!981394 (=> (not res!656531) (not e!553232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981394 (= res!656531 (validKeyInArray!0 (select (arr!29579 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36086 () Bool)

(declare-fun mapRes!36086 () Bool)

(assert (=> mapIsEmpty!36086 mapRes!36086))

(declare-fun b!981395 () Bool)

(declare-fun res!656530 () Bool)

(assert (=> b!981395 (=> (not res!656530) (not e!553232))))

(assert (=> b!981395 (= res!656530 (and (= (size!30060 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30059 _keys!1544) (size!30060 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981396 () Bool)

(declare-fun e!553236 () Bool)

(assert (=> b!981396 (= e!553236 (and e!553233 mapRes!36086))))

(declare-fun condMapEmpty!36086 () Bool)

(declare-fun mapDefault!36086 () ValueCell!10871)

(assert (=> b!981396 (= condMapEmpty!36086 (= (arr!29580 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10871)) mapDefault!36086)))))

(declare-fun res!656526 () Bool)

(assert (=> start!84070 (=> (not res!656526) (not e!553232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84070 (= res!656526 (validMask!0 mask!1948))))

(assert (=> start!84070 e!553232))

(assert (=> start!84070 true))

(assert (=> start!84070 tp_is_empty!22705))

(declare-fun array_inv!22897 (array!61454) Bool)

(assert (=> start!84070 (and (array_inv!22897 _values!1278) e!553236)))

(assert (=> start!84070 tp!68576))

(declare-fun array_inv!22898 (array!61452) Bool)

(assert (=> start!84070 (array_inv!22898 _keys!1544)))

(declare-fun mapNonEmpty!36086 () Bool)

(declare-fun tp!68575 () Bool)

(assert (=> mapNonEmpty!36086 (= mapRes!36086 (and tp!68575 e!553231))))

(declare-fun mapRest!36086 () (Array (_ BitVec 32) ValueCell!10871))

(declare-fun mapKey!36086 () (_ BitVec 32))

(declare-fun mapValue!36086 () ValueCell!10871)

(assert (=> mapNonEmpty!36086 (= (arr!29580 _values!1278) (store mapRest!36086 mapKey!36086 mapValue!36086))))

(declare-fun b!981397 () Bool)

(declare-fun res!656529 () Bool)

(assert (=> b!981397 (=> (not res!656529) (not e!553232))))

(declare-datatypes ((List!20503 0))(
  ( (Nil!20500) (Cons!20499 (h!21667 (_ BitVec 64)) (t!29162 List!20503)) )
))
(declare-fun arrayNoDuplicates!0 (array!61452 (_ BitVec 32) List!20503) Bool)

(assert (=> b!981397 (= res!656529 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20500))))

(declare-fun b!981398 () Bool)

(declare-fun res!656533 () Bool)

(assert (=> b!981398 (=> (not res!656533) (not e!553232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61452 (_ BitVec 32)) Bool)

(assert (=> b!981398 (= res!656533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981399 () Bool)

(declare-fun res!656527 () Bool)

(assert (=> b!981399 (=> (not res!656527) (not e!553232))))

(assert (=> b!981399 (= res!656527 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30059 _keys!1544))))))

(assert (= (and start!84070 res!656526) b!981395))

(assert (= (and b!981395 res!656530) b!981398))

(assert (= (and b!981398 res!656533) b!981397))

(assert (= (and b!981397 res!656529) b!981399))

(assert (= (and b!981399 res!656527) b!981394))

(assert (= (and b!981394 res!656531) b!981389))

(assert (= (and b!981389 res!656532) b!981390))

(assert (= (and b!981390 (not res!656528)) b!981391))

(assert (= (and b!981396 condMapEmpty!36086) mapIsEmpty!36086))

(assert (= (and b!981396 (not condMapEmpty!36086)) mapNonEmpty!36086))

(get-info :version)

(assert (= (and mapNonEmpty!36086 ((_ is ValueCellFull!10871) mapValue!36086)) b!981393))

(assert (= (and b!981396 ((_ is ValueCellFull!10871) mapDefault!36086)) b!981392))

(assert (= start!84070 b!981396))

(declare-fun b_lambda!14769 () Bool)

(assert (=> (not b_lambda!14769) (not b!981390)))

(declare-fun t!29160 () Bool)

(declare-fun tb!6509 () Bool)

(assert (=> (and start!84070 (= defaultEntry!1281 defaultEntry!1281) t!29160) tb!6509))

(declare-fun result!13015 () Bool)

(assert (=> tb!6509 (= result!13015 tp_is_empty!22705)))

(assert (=> b!981390 t!29160))

(declare-fun b_and!31523 () Bool)

(assert (= b_and!31521 (and (=> t!29160 result!13015) b_and!31523)))

(declare-fun m!909299 () Bool)

(assert (=> b!981394 m!909299))

(assert (=> b!981394 m!909299))

(declare-fun m!909301 () Bool)

(assert (=> b!981394 m!909301))

(assert (=> b!981390 m!909299))

(declare-fun m!909303 () Bool)

(assert (=> b!981390 m!909303))

(assert (=> b!981390 m!909299))

(declare-fun m!909305 () Bool)

(assert (=> b!981390 m!909305))

(declare-fun m!909307 () Bool)

(assert (=> b!981390 m!909307))

(declare-fun m!909309 () Bool)

(assert (=> b!981390 m!909309))

(declare-fun m!909311 () Bool)

(assert (=> b!981390 m!909311))

(declare-fun m!909313 () Bool)

(assert (=> b!981390 m!909313))

(declare-fun m!909315 () Bool)

(assert (=> b!981390 m!909315))

(declare-fun m!909317 () Bool)

(assert (=> b!981390 m!909317))

(declare-fun m!909319 () Bool)

(assert (=> b!981390 m!909319))

(assert (=> b!981390 m!909315))

(assert (=> b!981390 m!909319))

(declare-fun m!909321 () Bool)

(assert (=> b!981390 m!909321))

(declare-fun m!909323 () Bool)

(assert (=> b!981391 m!909323))

(assert (=> b!981391 m!909323))

(declare-fun m!909325 () Bool)

(assert (=> b!981391 m!909325))

(assert (=> b!981391 m!909299))

(assert (=> b!981391 m!909299))

(declare-fun m!909327 () Bool)

(assert (=> b!981391 m!909327))

(declare-fun m!909329 () Bool)

(assert (=> b!981398 m!909329))

(declare-fun m!909331 () Bool)

(assert (=> mapNonEmpty!36086 m!909331))

(declare-fun m!909333 () Bool)

(assert (=> start!84070 m!909333))

(declare-fun m!909335 () Bool)

(assert (=> start!84070 m!909335))

(declare-fun m!909337 () Bool)

(assert (=> start!84070 m!909337))

(declare-fun m!909339 () Bool)

(assert (=> b!981397 m!909339))

(check-sat (not b!981397) tp_is_empty!22705 (not b!981391) (not b!981394) (not mapNonEmpty!36086) (not b!981398) b_and!31523 (not b_lambda!14769) (not start!84070) (not b_next!19711) (not b!981390))
(check-sat b_and!31523 (not b_next!19711))
