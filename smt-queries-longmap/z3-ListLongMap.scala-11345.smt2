; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132386 () Bool)

(assert start!132386)

(declare-fun b_free!31687 () Bool)

(declare-fun b_next!31687 () Bool)

(assert (=> start!132386 (= b_free!31687 (not b_next!31687))))

(declare-fun tp!111312 () Bool)

(declare-fun b_and!51099 () Bool)

(assert (=> start!132386 (= tp!111312 b_and!51099)))

(declare-fun bm!69527 () Bool)

(declare-datatypes ((V!59061 0))(
  ( (V!59062 (val!19059 Int)) )
))
(declare-datatypes ((tuple2!24560 0))(
  ( (tuple2!24561 (_1!12291 (_ BitVec 64)) (_2!12291 V!59061)) )
))
(declare-datatypes ((List!36048 0))(
  ( (Nil!36045) (Cons!36044 (h!37507 tuple2!24560) (t!50734 List!36048)) )
))
(declare-datatypes ((ListLongMap!22177 0))(
  ( (ListLongMap!22178 (toList!11104 List!36048)) )
))
(declare-fun call!69531 () ListLongMap!22177)

(declare-fun call!69532 () ListLongMap!22177)

(assert (=> bm!69527 (= call!69531 call!69532)))

(declare-fun b!1548365 () Bool)

(declare-fun res!1060885 () Bool)

(declare-fun e!862011 () Bool)

(assert (=> b!1548365 (=> (not res!1060885) (not e!862011))))

(declare-datatypes ((array!103254 0))(
  ( (array!103255 (arr!49822 (Array (_ BitVec 32) (_ BitVec 64))) (size!50373 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103254)

(declare-datatypes ((List!36049 0))(
  ( (Nil!36046) (Cons!36045 (h!37508 (_ BitVec 64)) (t!50735 List!36049)) )
))
(declare-fun arrayNoDuplicates!0 (array!103254 (_ BitVec 32) List!36049) Bool)

(assert (=> b!1548365 (= res!1060885 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36046))))

(declare-fun bm!69528 () Bool)

(declare-fun call!69534 () ListLongMap!22177)

(declare-fun call!69530 () ListLongMap!22177)

(assert (=> bm!69528 (= call!69534 call!69530)))

(declare-fun bm!69529 () Bool)

(declare-fun zeroValue!436 () V!59061)

(declare-fun c!142522 () Bool)

(declare-fun call!69533 () ListLongMap!22177)

(declare-fun c!142520 () Bool)

(declare-fun minValue!436 () V!59061)

(declare-fun +!4949 (ListLongMap!22177 tuple2!24560) ListLongMap!22177)

(assert (=> bm!69529 (= call!69532 (+!4949 (ite c!142522 call!69530 (ite c!142520 call!69534 call!69533)) (ite (or c!142522 c!142520) (tuple2!24561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69530 () Bool)

(assert (=> bm!69530 (= call!69533 call!69534)))

(declare-fun b!1548366 () Bool)

(declare-fun e!862008 () Bool)

(assert (=> b!1548366 (= e!862011 e!862008)))

(declare-fun res!1060883 () Bool)

(assert (=> b!1548366 (=> (not res!1060883) (not e!862008))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1548366 (= res!1060883 (bvslt from!762 (size!50373 _keys!618)))))

(declare-fun lt!667345 () ListLongMap!22177)

(declare-fun e!862012 () ListLongMap!22177)

(assert (=> b!1548366 (= lt!667345 e!862012)))

(declare-fun lt!667346 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548366 (= c!142522 (and (not lt!667346) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548366 (= lt!667346 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548367 () Bool)

(declare-fun res!1060881 () Bool)

(assert (=> b!1548367 (=> (not res!1060881) (not e!862008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548367 (= res!1060881 (validKeyInArray!0 (select (arr!49822 _keys!618) from!762)))))

(declare-fun b!1548368 () Bool)

(assert (=> b!1548368 (= e!862012 (+!4949 call!69532 (tuple2!24561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548369 () Bool)

(declare-fun e!862014 () Bool)

(declare-fun tp_is_empty!37963 () Bool)

(assert (=> b!1548369 (= e!862014 tp_is_empty!37963)))

(declare-fun b!1548370 () Bool)

(declare-fun c!142521 () Bool)

(assert (=> b!1548370 (= c!142521 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667346))))

(declare-fun e!862010 () ListLongMap!22177)

(declare-fun e!862009 () ListLongMap!22177)

(assert (=> b!1548370 (= e!862010 e!862009)))

(declare-fun b!1548371 () Bool)

(assert (=> b!1548371 (= e!862009 call!69531)))

(declare-fun b!1548372 () Bool)

(declare-fun res!1060886 () Bool)

(assert (=> b!1548372 (=> (not res!1060886) (not e!862011))))

(assert (=> b!1548372 (= res!1060886 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50373 _keys!618))))))

(declare-fun b!1548373 () Bool)

(declare-fun e!862007 () Bool)

(declare-fun mapRes!58648 () Bool)

(assert (=> b!1548373 (= e!862007 (and e!862014 mapRes!58648))))

(declare-fun condMapEmpty!58648 () Bool)

(declare-datatypes ((ValueCell!18071 0))(
  ( (ValueCellFull!18071 (v!21852 V!59061)) (EmptyCell!18071) )
))
(declare-datatypes ((array!103256 0))(
  ( (array!103257 (arr!49823 (Array (_ BitVec 32) ValueCell!18071)) (size!50374 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103256)

(declare-fun mapDefault!58648 () ValueCell!18071)

(assert (=> b!1548373 (= condMapEmpty!58648 (= (arr!49823 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18071)) mapDefault!58648)))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun bm!69531 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6586 (array!103254 array!103256 (_ BitVec 32) (_ BitVec 32) V!59061 V!59061 (_ BitVec 32) Int) ListLongMap!22177)

(assert (=> bm!69531 (= call!69530 (getCurrentListMapNoExtraKeys!6586 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548374 () Bool)

(declare-fun e!862013 () Bool)

(assert (=> b!1548374 (= e!862013 tp_is_empty!37963)))

(declare-fun mapNonEmpty!58648 () Bool)

(declare-fun tp!111313 () Bool)

(assert (=> mapNonEmpty!58648 (= mapRes!58648 (and tp!111313 e!862013))))

(declare-fun mapRest!58648 () (Array (_ BitVec 32) ValueCell!18071))

(declare-fun mapKey!58648 () (_ BitVec 32))

(declare-fun mapValue!58648 () ValueCell!18071)

(assert (=> mapNonEmpty!58648 (= (arr!49823 _values!470) (store mapRest!58648 mapKey!58648 mapValue!58648))))

(declare-fun b!1548375 () Bool)

(declare-fun res!1060880 () Bool)

(assert (=> b!1548375 (=> (not res!1060880) (not e!862011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103254 (_ BitVec 32)) Bool)

(assert (=> b!1548375 (= res!1060880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548376 () Bool)

(assert (=> b!1548376 (= e!862012 e!862010)))

(assert (=> b!1548376 (= c!142520 (and (not lt!667346) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!58648 () Bool)

(assert (=> mapIsEmpty!58648 mapRes!58648))

(declare-fun b!1548377 () Bool)

(assert (=> b!1548377 (= e!862010 call!69531)))

(declare-fun b!1548378 () Bool)

(declare-fun res!1060884 () Bool)

(assert (=> b!1548378 (=> (not res!1060884) (not e!862011))))

(assert (=> b!1548378 (= res!1060884 (and (= (size!50374 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50373 _keys!618) (size!50374 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1060882 () Bool)

(assert (=> start!132386 (=> (not res!1060882) (not e!862011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132386 (= res!1060882 (validMask!0 mask!926))))

(assert (=> start!132386 e!862011))

(declare-fun array_inv!39019 (array!103254) Bool)

(assert (=> start!132386 (array_inv!39019 _keys!618)))

(assert (=> start!132386 tp_is_empty!37963))

(assert (=> start!132386 true))

(assert (=> start!132386 tp!111312))

(declare-fun array_inv!39020 (array!103256) Bool)

(assert (=> start!132386 (and (array_inv!39020 _values!470) e!862007)))

(declare-fun b!1548379 () Bool)

(assert (=> b!1548379 (= e!862009 call!69533)))

(declare-fun b!1548380 () Bool)

(assert (=> b!1548380 (= e!862008 (not true))))

(declare-fun lt!667348 () ListLongMap!22177)

(declare-fun contains!10088 (ListLongMap!22177 (_ BitVec 64)) Bool)

(assert (=> b!1548380 (contains!10088 (+!4949 lt!667348 (tuple2!24561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49822 _keys!618) from!762))))

(declare-datatypes ((Unit!51445 0))(
  ( (Unit!51446) )
))
(declare-fun lt!667347 () Unit!51445)

(declare-fun addStillContains!1230 (ListLongMap!22177 (_ BitVec 64) V!59061 (_ BitVec 64)) Unit!51445)

(assert (=> b!1548380 (= lt!667347 (addStillContains!1230 lt!667348 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49822 _keys!618) from!762)))))

(assert (=> b!1548380 (= lt!667348 (getCurrentListMapNoExtraKeys!6586 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!132386 res!1060882) b!1548378))

(assert (= (and b!1548378 res!1060884) b!1548375))

(assert (= (and b!1548375 res!1060880) b!1548365))

(assert (= (and b!1548365 res!1060885) b!1548372))

(assert (= (and b!1548372 res!1060886) b!1548366))

(assert (= (and b!1548366 c!142522) b!1548368))

(assert (= (and b!1548366 (not c!142522)) b!1548376))

(assert (= (and b!1548376 c!142520) b!1548377))

(assert (= (and b!1548376 (not c!142520)) b!1548370))

(assert (= (and b!1548370 c!142521) b!1548371))

(assert (= (and b!1548370 (not c!142521)) b!1548379))

(assert (= (or b!1548371 b!1548379) bm!69530))

(assert (= (or b!1548377 bm!69530) bm!69528))

(assert (= (or b!1548377 b!1548371) bm!69527))

(assert (= (or b!1548368 bm!69528) bm!69531))

(assert (= (or b!1548368 bm!69527) bm!69529))

(assert (= (and b!1548366 res!1060883) b!1548367))

(assert (= (and b!1548367 res!1060881) b!1548380))

(assert (= (and b!1548373 condMapEmpty!58648) mapIsEmpty!58648))

(assert (= (and b!1548373 (not condMapEmpty!58648)) mapNonEmpty!58648))

(get-info :version)

(assert (= (and mapNonEmpty!58648 ((_ is ValueCellFull!18071) mapValue!58648)) b!1548374))

(assert (= (and b!1548373 ((_ is ValueCellFull!18071) mapDefault!58648)) b!1548369))

(assert (= start!132386 b!1548373))

(declare-fun m!1428297 () Bool)

(assert (=> mapNonEmpty!58648 m!1428297))

(declare-fun m!1428299 () Bool)

(assert (=> start!132386 m!1428299))

(declare-fun m!1428301 () Bool)

(assert (=> start!132386 m!1428301))

(declare-fun m!1428303 () Bool)

(assert (=> start!132386 m!1428303))

(declare-fun m!1428305 () Bool)

(assert (=> b!1548368 m!1428305))

(declare-fun m!1428307 () Bool)

(assert (=> b!1548380 m!1428307))

(declare-fun m!1428309 () Bool)

(assert (=> b!1548380 m!1428309))

(declare-fun m!1428311 () Bool)

(assert (=> b!1548380 m!1428311))

(assert (=> b!1548380 m!1428311))

(assert (=> b!1548380 m!1428309))

(declare-fun m!1428313 () Bool)

(assert (=> b!1548380 m!1428313))

(assert (=> b!1548380 m!1428309))

(declare-fun m!1428315 () Bool)

(assert (=> b!1548380 m!1428315))

(assert (=> bm!69531 m!1428307))

(declare-fun m!1428317 () Bool)

(assert (=> b!1548365 m!1428317))

(declare-fun m!1428319 () Bool)

(assert (=> b!1548375 m!1428319))

(assert (=> b!1548367 m!1428309))

(assert (=> b!1548367 m!1428309))

(declare-fun m!1428321 () Bool)

(assert (=> b!1548367 m!1428321))

(declare-fun m!1428323 () Bool)

(assert (=> bm!69529 m!1428323))

(check-sat (not b!1548375) (not mapNonEmpty!58648) (not b!1548380) (not start!132386) (not b!1548367) (not b_next!31687) tp_is_empty!37963 (not b!1548365) b_and!51099 (not bm!69529) (not b!1548368) (not bm!69531))
(check-sat b_and!51099 (not b_next!31687))
