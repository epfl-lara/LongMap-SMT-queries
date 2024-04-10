; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84234 () Bool)

(assert start!84234)

(declare-fun b_free!19935 () Bool)

(declare-fun b_next!19935 () Bool)

(assert (=> start!84234 (= b_free!19935 (not b_next!19935))))

(declare-fun tp!69408 () Bool)

(declare-fun b_and!31947 () Bool)

(assert (=> start!84234 (= tp!69408 b_and!31947)))

(declare-fun b!985402 () Bool)

(declare-fun res!659393 () Bool)

(declare-fun e!555460 () Bool)

(assert (=> b!985402 (=> (not res!659393) (not e!555460))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62049 0))(
  ( (array!62050 (arr!29882 (Array (_ BitVec 32) (_ BitVec 64))) (size!30361 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62049)

(assert (=> b!985402 (= res!659393 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30361 _keys!1544))))))

(declare-fun mapIsEmpty!36584 () Bool)

(declare-fun mapRes!36584 () Bool)

(assert (=> mapIsEmpty!36584 mapRes!36584))

(declare-fun res!659392 () Bool)

(assert (=> start!84234 (=> (not res!659392) (not e!555460))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84234 (= res!659392 (validMask!0 mask!1948))))

(assert (=> start!84234 e!555460))

(assert (=> start!84234 true))

(declare-fun tp_is_empty!23037 () Bool)

(assert (=> start!84234 tp_is_empty!23037))

(declare-datatypes ((V!35699 0))(
  ( (V!35700 (val!11569 Int)) )
))
(declare-datatypes ((ValueCell!11037 0))(
  ( (ValueCellFull!11037 (v!14131 V!35699)) (EmptyCell!11037) )
))
(declare-datatypes ((array!62051 0))(
  ( (array!62052 (arr!29883 (Array (_ BitVec 32) ValueCell!11037)) (size!30362 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62051)

(declare-fun e!555459 () Bool)

(declare-fun array_inv!23099 (array!62051) Bool)

(assert (=> start!84234 (and (array_inv!23099 _values!1278) e!555459)))

(assert (=> start!84234 tp!69408))

(declare-fun array_inv!23100 (array!62049) Bool)

(assert (=> start!84234 (array_inv!23100 _keys!1544)))

(declare-fun b!985403 () Bool)

(declare-fun res!659397 () Bool)

(assert (=> b!985403 (=> (not res!659397) (not e!555460))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985403 (= res!659397 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985404 () Bool)

(declare-fun res!659394 () Bool)

(assert (=> b!985404 (=> (not res!659394) (not e!555460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62049 (_ BitVec 32)) Bool)

(assert (=> b!985404 (= res!659394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985405 () Bool)

(declare-fun e!555462 () Bool)

(assert (=> b!985405 (= e!555462 tp_is_empty!23037)))

(declare-fun b!985406 () Bool)

(declare-fun res!659396 () Bool)

(assert (=> b!985406 (=> (not res!659396) (not e!555460))))

(declare-datatypes ((List!20695 0))(
  ( (Nil!20692) (Cons!20691 (h!21853 (_ BitVec 64)) (t!29574 List!20695)) )
))
(declare-fun arrayNoDuplicates!0 (array!62049 (_ BitVec 32) List!20695) Bool)

(assert (=> b!985406 (= res!659396 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20692))))

(declare-fun b!985407 () Bool)

(declare-fun e!555457 () Bool)

(assert (=> b!985407 (= e!555457 (not true))))

(declare-datatypes ((tuple2!14804 0))(
  ( (tuple2!14805 (_1!7413 (_ BitVec 64)) (_2!7413 V!35699)) )
))
(declare-datatypes ((List!20696 0))(
  ( (Nil!20693) (Cons!20692 (h!21854 tuple2!14804) (t!29575 List!20696)) )
))
(declare-datatypes ((ListLongMap!13501 0))(
  ( (ListLongMap!13502 (toList!6766 List!20696)) )
))
(declare-fun lt!437227 () ListLongMap!13501)

(declare-fun lt!437228 () tuple2!14804)

(declare-fun lt!437230 () tuple2!14804)

(declare-fun +!3055 (ListLongMap!13501 tuple2!14804) ListLongMap!13501)

(assert (=> b!985407 (= (+!3055 (+!3055 lt!437227 lt!437228) lt!437230) (+!3055 (+!3055 lt!437227 lt!437230) lt!437228))))

(declare-fun lt!437229 () V!35699)

(assert (=> b!985407 (= lt!437230 (tuple2!14805 (select (arr!29882 _keys!1544) from!1932) lt!437229))))

(declare-fun minValue!1220 () V!35699)

(assert (=> b!985407 (= lt!437228 (tuple2!14805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32749 0))(
  ( (Unit!32750) )
))
(declare-fun lt!437231 () Unit!32749)

(declare-fun addCommutativeForDiffKeys!683 (ListLongMap!13501 (_ BitVec 64) V!35699 (_ BitVec 64) V!35699) Unit!32749)

(assert (=> b!985407 (= lt!437231 (addCommutativeForDiffKeys!683 lt!437227 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29882 _keys!1544) from!1932) lt!437229))))

(declare-fun b!985408 () Bool)

(assert (=> b!985408 (= e!555459 (and e!555462 mapRes!36584))))

(declare-fun condMapEmpty!36584 () Bool)

(declare-fun mapDefault!36584 () ValueCell!11037)

(assert (=> b!985408 (= condMapEmpty!36584 (= (arr!29883 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11037)) mapDefault!36584)))))

(declare-fun mapNonEmpty!36584 () Bool)

(declare-fun tp!69409 () Bool)

(declare-fun e!555458 () Bool)

(assert (=> mapNonEmpty!36584 (= mapRes!36584 (and tp!69409 e!555458))))

(declare-fun mapRest!36584 () (Array (_ BitVec 32) ValueCell!11037))

(declare-fun mapValue!36584 () ValueCell!11037)

(declare-fun mapKey!36584 () (_ BitVec 32))

(assert (=> mapNonEmpty!36584 (= (arr!29883 _values!1278) (store mapRest!36584 mapKey!36584 mapValue!36584))))

(declare-fun b!985409 () Bool)

(declare-fun res!659395 () Bool)

(assert (=> b!985409 (=> (not res!659395) (not e!555460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985409 (= res!659395 (validKeyInArray!0 (select (arr!29882 _keys!1544) from!1932)))))

(declare-fun b!985410 () Bool)

(declare-fun res!659398 () Bool)

(assert (=> b!985410 (=> (not res!659398) (not e!555460))))

(assert (=> b!985410 (= res!659398 (and (= (size!30362 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30361 _keys!1544) (size!30362 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985411 () Bool)

(assert (=> b!985411 (= e!555458 tp_is_empty!23037)))

(declare-fun b!985412 () Bool)

(assert (=> b!985412 (= e!555460 e!555457)))

(declare-fun res!659399 () Bool)

(assert (=> b!985412 (=> (not res!659399) (not e!555457))))

(assert (=> b!985412 (= res!659399 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29882 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15510 (ValueCell!11037 V!35699) V!35699)

(declare-fun dynLambda!1837 (Int (_ BitVec 64)) V!35699)

(assert (=> b!985412 (= lt!437229 (get!15510 (select (arr!29883 _values!1278) from!1932) (dynLambda!1837 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35699)

(declare-fun getCurrentListMapNoExtraKeys!3457 (array!62049 array!62051 (_ BitVec 32) (_ BitVec 32) V!35699 V!35699 (_ BitVec 32) Int) ListLongMap!13501)

(assert (=> b!985412 (= lt!437227 (getCurrentListMapNoExtraKeys!3457 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84234 res!659392) b!985410))

(assert (= (and b!985410 res!659398) b!985404))

(assert (= (and b!985404 res!659394) b!985406))

(assert (= (and b!985406 res!659396) b!985402))

(assert (= (and b!985402 res!659393) b!985409))

(assert (= (and b!985409 res!659395) b!985403))

(assert (= (and b!985403 res!659397) b!985412))

(assert (= (and b!985412 res!659399) b!985407))

(assert (= (and b!985408 condMapEmpty!36584) mapIsEmpty!36584))

(assert (= (and b!985408 (not condMapEmpty!36584)) mapNonEmpty!36584))

(get-info :version)

(assert (= (and mapNonEmpty!36584 ((_ is ValueCellFull!11037) mapValue!36584)) b!985411))

(assert (= (and b!985408 ((_ is ValueCellFull!11037) mapDefault!36584)) b!985405))

(assert (= start!84234 b!985408))

(declare-fun b_lambda!14967 () Bool)

(assert (=> (not b_lambda!14967) (not b!985412)))

(declare-fun t!29573 () Bool)

(declare-fun tb!6729 () Bool)

(assert (=> (and start!84234 (= defaultEntry!1281 defaultEntry!1281) t!29573) tb!6729))

(declare-fun result!13447 () Bool)

(assert (=> tb!6729 (= result!13447 tp_is_empty!23037)))

(assert (=> b!985412 t!29573))

(declare-fun b_and!31949 () Bool)

(assert (= b_and!31947 (and (=> t!29573 result!13447) b_and!31949)))

(declare-fun m!912461 () Bool)

(assert (=> b!985407 m!912461))

(declare-fun m!912463 () Bool)

(assert (=> b!985407 m!912463))

(assert (=> b!985407 m!912461))

(declare-fun m!912465 () Bool)

(assert (=> b!985407 m!912465))

(declare-fun m!912467 () Bool)

(assert (=> b!985407 m!912467))

(declare-fun m!912469 () Bool)

(assert (=> b!985407 m!912469))

(assert (=> b!985407 m!912467))

(assert (=> b!985407 m!912463))

(declare-fun m!912471 () Bool)

(assert (=> b!985407 m!912471))

(declare-fun m!912473 () Bool)

(assert (=> mapNonEmpty!36584 m!912473))

(declare-fun m!912475 () Bool)

(assert (=> b!985404 m!912475))

(assert (=> b!985409 m!912463))

(assert (=> b!985409 m!912463))

(declare-fun m!912477 () Bool)

(assert (=> b!985409 m!912477))

(assert (=> b!985412 m!912463))

(declare-fun m!912479 () Bool)

(assert (=> b!985412 m!912479))

(declare-fun m!912481 () Bool)

(assert (=> b!985412 m!912481))

(declare-fun m!912483 () Bool)

(assert (=> b!985412 m!912483))

(assert (=> b!985412 m!912479))

(assert (=> b!985412 m!912483))

(declare-fun m!912485 () Bool)

(assert (=> b!985412 m!912485))

(declare-fun m!912487 () Bool)

(assert (=> start!84234 m!912487))

(declare-fun m!912489 () Bool)

(assert (=> start!84234 m!912489))

(declare-fun m!912491 () Bool)

(assert (=> start!84234 m!912491))

(declare-fun m!912493 () Bool)

(assert (=> b!985406 m!912493))

(check-sat (not b!985407) (not b!985406) (not b!985409) (not start!84234) (not b_next!19935) tp_is_empty!23037 (not b!985404) b_and!31949 (not b!985412) (not b_lambda!14967) (not mapNonEmpty!36584))
(check-sat b_and!31949 (not b_next!19935))
