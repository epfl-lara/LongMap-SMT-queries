; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134368 () Bool)

(assert start!134368)

(declare-fun b_free!32179 () Bool)

(declare-fun b_next!32179 () Bool)

(assert (=> start!134368 (= b_free!32179 (not b_next!32179))))

(declare-fun tp!113838 () Bool)

(declare-fun b_and!51801 () Bool)

(assert (=> start!134368 (= tp!113838 b_and!51801)))

(declare-fun b!1568419 () Bool)

(declare-fun e!874362 () Bool)

(declare-fun e!874359 () Bool)

(declare-fun mapRes!59821 () Bool)

(assert (=> b!1568419 (= e!874362 (and e!874359 mapRes!59821))))

(declare-fun condMapEmpty!59821 () Bool)

(declare-datatypes ((V!60145 0))(
  ( (V!60146 (val!19560 Int)) )
))
(declare-datatypes ((ValueCell!18446 0))(
  ( (ValueCellFull!18446 (v!22308 V!60145)) (EmptyCell!18446) )
))
(declare-datatypes ((array!104714 0))(
  ( (array!104715 (arr!50537 (Array (_ BitVec 32) ValueCell!18446)) (size!51088 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104714)

(declare-fun mapDefault!59821 () ValueCell!18446)

(assert (=> b!1568419 (= condMapEmpty!59821 (= (arr!50537 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18446)) mapDefault!59821)))))

(declare-fun b!1568420 () Bool)

(declare-fun e!874360 () Bool)

(declare-fun tp_is_empty!38953 () Bool)

(assert (=> b!1568420 (= e!874360 tp_is_empty!38953)))

(declare-fun b!1568421 () Bool)

(declare-fun res!1071312 () Bool)

(declare-fun e!874363 () Bool)

(assert (=> b!1568421 (=> (not res!1071312) (not e!874363))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104716 0))(
  ( (array!104717 (arr!50538 (Array (_ BitVec 32) (_ BitVec 64))) (size!51089 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104716)

(assert (=> b!1568421 (= res!1071312 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51089 _keys!637)) (bvslt from!782 (size!51089 _keys!637))))))

(declare-fun b!1568422 () Bool)

(declare-fun res!1071310 () Bool)

(assert (=> b!1568422 (=> (not res!1071310) (not e!874363))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1568422 (= res!1071310 (and (= (size!51088 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51089 _keys!637) (size!51088 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59821 () Bool)

(assert (=> mapIsEmpty!59821 mapRes!59821))

(declare-fun b!1568423 () Bool)

(declare-fun res!1071311 () Bool)

(assert (=> b!1568423 (=> (not res!1071311) (not e!874363))))

(declare-datatypes ((List!36657 0))(
  ( (Nil!36654) (Cons!36653 (h!38117 (_ BitVec 64)) (t!51542 List!36657)) )
))
(declare-fun arrayNoDuplicates!0 (array!104716 (_ BitVec 32) List!36657) Bool)

(assert (=> b!1568423 (= res!1071311 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36654))))

(declare-fun b!1568424 () Bool)

(declare-fun res!1071308 () Bool)

(assert (=> b!1568424 (=> (not res!1071308) (not e!874363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568424 (= res!1071308 (validKeyInArray!0 (select (arr!50538 _keys!637) from!782)))))

(declare-fun res!1071309 () Bool)

(assert (=> start!134368 (=> (not res!1071309) (not e!874363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134368 (= res!1071309 (validMask!0 mask!947))))

(assert (=> start!134368 e!874363))

(assert (=> start!134368 tp!113838))

(assert (=> start!134368 tp_is_empty!38953))

(assert (=> start!134368 true))

(declare-fun array_inv!39507 (array!104716) Bool)

(assert (=> start!134368 (array_inv!39507 _keys!637)))

(declare-fun array_inv!39508 (array!104714) Bool)

(assert (=> start!134368 (and (array_inv!39508 _values!487) e!874362)))

(declare-fun b!1568425 () Bool)

(declare-fun res!1071307 () Bool)

(assert (=> b!1568425 (=> (not res!1071307) (not e!874363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104716 (_ BitVec 32)) Bool)

(assert (=> b!1568425 (= res!1071307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59821 () Bool)

(declare-fun tp!113839 () Bool)

(assert (=> mapNonEmpty!59821 (= mapRes!59821 (and tp!113839 e!874360))))

(declare-fun mapKey!59821 () (_ BitVec 32))

(declare-fun mapValue!59821 () ValueCell!18446)

(declare-fun mapRest!59821 () (Array (_ BitVec 32) ValueCell!18446))

(assert (=> mapNonEmpty!59821 (= (arr!50537 _values!487) (store mapRest!59821 mapKey!59821 mapValue!59821))))

(declare-fun b!1568426 () Bool)

(assert (=> b!1568426 (= e!874363 (not true))))

(declare-fun lt!673406 () Bool)

(declare-datatypes ((tuple2!25294 0))(
  ( (tuple2!25295 (_1!12658 (_ BitVec 64)) (_2!12658 V!60145)) )
))
(declare-datatypes ((List!36658 0))(
  ( (Nil!36655) (Cons!36654 (h!38118 tuple2!25294) (t!51543 List!36658)) )
))
(declare-datatypes ((ListLongMap!22737 0))(
  ( (ListLongMap!22738 (toList!11384 List!36658)) )
))
(declare-fun lt!673404 () ListLongMap!22737)

(declare-fun contains!10387 (ListLongMap!22737 (_ BitVec 64)) Bool)

(assert (=> b!1568426 (= lt!673406 (contains!10387 lt!673404 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568426 (not (contains!10387 lt!673404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673405 () ListLongMap!22737)

(declare-fun lt!673408 () V!60145)

(declare-fun +!5120 (ListLongMap!22737 tuple2!25294) ListLongMap!22737)

(assert (=> b!1568426 (= lt!673404 (+!5120 lt!673405 (tuple2!25295 (select (arr!50538 _keys!637) from!782) lt!673408)))))

(declare-datatypes ((Unit!51935 0))(
  ( (Unit!51936) )
))
(declare-fun lt!673407 () Unit!51935)

(declare-fun addStillNotContains!571 (ListLongMap!22737 (_ BitVec 64) V!60145 (_ BitVec 64)) Unit!51935)

(assert (=> b!1568426 (= lt!673407 (addStillNotContains!571 lt!673405 (select (arr!50538 _keys!637) from!782) lt!673408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26396 (ValueCell!18446 V!60145) V!60145)

(declare-fun dynLambda!3918 (Int (_ BitVec 64)) V!60145)

(assert (=> b!1568426 (= lt!673408 (get!26396 (select (arr!50537 _values!487) from!782) (dynLambda!3918 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60145)

(declare-fun minValue!453 () V!60145)

(declare-fun getCurrentListMapNoExtraKeys!6765 (array!104716 array!104714 (_ BitVec 32) (_ BitVec 32) V!60145 V!60145 (_ BitVec 32) Int) ListLongMap!22737)

(assert (=> b!1568426 (= lt!673405 (getCurrentListMapNoExtraKeys!6765 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1568427 () Bool)

(assert (=> b!1568427 (= e!874359 tp_is_empty!38953)))

(assert (= (and start!134368 res!1071309) b!1568422))

(assert (= (and b!1568422 res!1071310) b!1568425))

(assert (= (and b!1568425 res!1071307) b!1568423))

(assert (= (and b!1568423 res!1071311) b!1568421))

(assert (= (and b!1568421 res!1071312) b!1568424))

(assert (= (and b!1568424 res!1071308) b!1568426))

(assert (= (and b!1568419 condMapEmpty!59821) mapIsEmpty!59821))

(assert (= (and b!1568419 (not condMapEmpty!59821)) mapNonEmpty!59821))

(get-info :version)

(assert (= (and mapNonEmpty!59821 ((_ is ValueCellFull!18446) mapValue!59821)) b!1568420))

(assert (= (and b!1568419 ((_ is ValueCellFull!18446) mapDefault!59821)) b!1568427))

(assert (= start!134368 b!1568419))

(declare-fun b_lambda!24987 () Bool)

(assert (=> (not b_lambda!24987) (not b!1568426)))

(declare-fun t!51541 () Bool)

(declare-fun tb!12639 () Bool)

(assert (=> (and start!134368 (= defaultEntry!495 defaultEntry!495) t!51541) tb!12639))

(declare-fun result!26577 () Bool)

(assert (=> tb!12639 (= result!26577 tp_is_empty!38953)))

(assert (=> b!1568426 t!51541))

(declare-fun b_and!51803 () Bool)

(assert (= b_and!51801 (and (=> t!51541 result!26577) b_and!51803)))

(declare-fun m!1443169 () Bool)

(assert (=> b!1568424 m!1443169))

(assert (=> b!1568424 m!1443169))

(declare-fun m!1443171 () Bool)

(assert (=> b!1568424 m!1443171))

(declare-fun m!1443173 () Bool)

(assert (=> mapNonEmpty!59821 m!1443173))

(declare-fun m!1443175 () Bool)

(assert (=> start!134368 m!1443175))

(declare-fun m!1443177 () Bool)

(assert (=> start!134368 m!1443177))

(declare-fun m!1443179 () Bool)

(assert (=> start!134368 m!1443179))

(declare-fun m!1443181 () Bool)

(assert (=> b!1568425 m!1443181))

(declare-fun m!1443183 () Bool)

(assert (=> b!1568423 m!1443183))

(declare-fun m!1443185 () Bool)

(assert (=> b!1568426 m!1443185))

(declare-fun m!1443187 () Bool)

(assert (=> b!1568426 m!1443187))

(declare-fun m!1443189 () Bool)

(assert (=> b!1568426 m!1443189))

(declare-fun m!1443191 () Bool)

(assert (=> b!1568426 m!1443191))

(assert (=> b!1568426 m!1443185))

(declare-fun m!1443193 () Bool)

(assert (=> b!1568426 m!1443193))

(assert (=> b!1568426 m!1443169))

(declare-fun m!1443195 () Bool)

(assert (=> b!1568426 m!1443195))

(assert (=> b!1568426 m!1443187))

(declare-fun m!1443197 () Bool)

(assert (=> b!1568426 m!1443197))

(declare-fun m!1443199 () Bool)

(assert (=> b!1568426 m!1443199))

(assert (=> b!1568426 m!1443169))

(check-sat (not mapNonEmpty!59821) (not b!1568426) (not b_next!32179) tp_is_empty!38953 (not b_lambda!24987) (not start!134368) (not b!1568425) b_and!51803 (not b!1568423) (not b!1568424))
(check-sat b_and!51803 (not b_next!32179))
