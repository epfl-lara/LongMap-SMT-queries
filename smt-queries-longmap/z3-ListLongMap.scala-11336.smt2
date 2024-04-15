; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131870 () Bool)

(assert start!131870)

(declare-fun b_free!31633 () Bool)

(declare-fun b_next!31633 () Bool)

(assert (=> start!131870 (= b_free!31633 (not b_next!31633))))

(declare-fun tp!111152 () Bool)

(declare-fun b_and!51025 () Bool)

(assert (=> start!131870 (= tp!111152 b_and!51025)))

(declare-fun b!1544370 () Bool)

(declare-datatypes ((V!58989 0))(
  ( (V!58990 (val!19032 Int)) )
))
(declare-datatypes ((tuple2!24524 0))(
  ( (tuple2!24525 (_1!12273 (_ BitVec 64)) (_2!12273 V!58989)) )
))
(declare-datatypes ((List!36009 0))(
  ( (Nil!36006) (Cons!36005 (h!37451 tuple2!24524) (t!50695 List!36009)) )
))
(declare-datatypes ((ListLongMap!22133 0))(
  ( (ListLongMap!22134 (toList!11082 List!36009)) )
))
(declare-fun e!859602 () ListLongMap!22133)

(declare-fun call!68943 () ListLongMap!22133)

(assert (=> b!1544370 (= e!859602 call!68943)))

(declare-fun b!1544371 () Bool)

(declare-fun c!141390 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!665887 () Bool)

(assert (=> b!1544371 (= c!141390 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665887))))

(declare-fun e!859595 () ListLongMap!22133)

(assert (=> b!1544371 (= e!859602 e!859595)))

(declare-fun bm!68937 () Bool)

(declare-fun call!68944 () ListLongMap!22133)

(assert (=> bm!68937 (= call!68943 call!68944)))

(declare-fun bm!68938 () Bool)

(declare-fun call!68941 () ListLongMap!22133)

(declare-fun call!68942 () ListLongMap!22133)

(assert (=> bm!68938 (= call!68941 call!68942)))

(declare-fun mapNonEmpty!58567 () Bool)

(declare-fun mapRes!58567 () Bool)

(declare-fun tp!111151 () Bool)

(declare-fun e!859598 () Bool)

(assert (=> mapNonEmpty!58567 (= mapRes!58567 (and tp!111151 e!859598))))

(declare-fun mapKey!58567 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18044 0))(
  ( (ValueCellFull!18044 (v!21829 V!58989)) (EmptyCell!18044) )
))
(declare-fun mapValue!58567 () ValueCell!18044)

(declare-datatypes ((array!102958 0))(
  ( (array!102959 (arr!49682 (Array (_ BitVec 32) ValueCell!18044)) (size!50234 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102958)

(declare-fun mapRest!58567 () (Array (_ BitVec 32) ValueCell!18044))

(assert (=> mapNonEmpty!58567 (= (arr!49682 _values!470) (store mapRest!58567 mapKey!58567 mapValue!58567))))

(declare-fun b!1544372 () Bool)

(declare-fun e!859601 () ListLongMap!22133)

(declare-fun minValue!436 () V!58989)

(declare-fun +!4915 (ListLongMap!22133 tuple2!24524) ListLongMap!22133)

(assert (=> b!1544372 (= e!859601 (+!4915 call!68944 (tuple2!24525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544373 () Bool)

(declare-fun res!1059378 () Bool)

(declare-fun e!859597 () Bool)

(assert (=> b!1544373 (=> (not res!1059378) (not e!859597))))

(declare-datatypes ((array!102960 0))(
  ( (array!102961 (arr!49683 (Array (_ BitVec 32) (_ BitVec 64))) (size!50235 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102960)

(declare-datatypes ((List!36010 0))(
  ( (Nil!36007) (Cons!36006 (h!37452 (_ BitVec 64)) (t!50696 List!36010)) )
))
(declare-fun arrayNoDuplicates!0 (array!102960 (_ BitVec 32) List!36010) Bool)

(assert (=> b!1544373 (= res!1059378 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36007))))

(declare-fun b!1544374 () Bool)

(declare-fun res!1059374 () Bool)

(assert (=> b!1544374 (=> (not res!1059374) (not e!859597))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544374 (= res!1059374 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50235 _keys!618))))))

(declare-fun b!1544375 () Bool)

(declare-fun tp_is_empty!37909 () Bool)

(assert (=> b!1544375 (= e!859598 tp_is_empty!37909)))

(declare-fun b!1544376 () Bool)

(assert (=> b!1544376 (= e!859601 e!859602)))

(declare-fun c!141389 () Bool)

(assert (=> b!1544376 (= c!141389 (and (not lt!665887) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!68939 () Bool)

(declare-fun c!141388 () Bool)

(declare-fun zeroValue!436 () V!58989)

(declare-fun call!68940 () ListLongMap!22133)

(assert (=> bm!68939 (= call!68944 (+!4915 (ite c!141388 call!68942 (ite c!141389 call!68941 call!68940)) (ite (or c!141388 c!141389) (tuple2!24525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1059376 () Bool)

(assert (=> start!131870 (=> (not res!1059376) (not e!859597))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131870 (= res!1059376 (validMask!0 mask!926))))

(assert (=> start!131870 e!859597))

(declare-fun array_inv!38841 (array!102960) Bool)

(assert (=> start!131870 (array_inv!38841 _keys!618)))

(assert (=> start!131870 tp_is_empty!37909))

(assert (=> start!131870 true))

(assert (=> start!131870 tp!111152))

(declare-fun e!859599 () Bool)

(declare-fun array_inv!38842 (array!102958) Bool)

(assert (=> start!131870 (and (array_inv!38842 _values!470) e!859599)))

(declare-fun b!1544377 () Bool)

(assert (=> b!1544377 (= e!859595 call!68943)))

(declare-fun b!1544378 () Bool)

(assert (=> b!1544378 (= e!859597 false)))

(declare-fun lt!665886 () ListLongMap!22133)

(assert (=> b!1544378 (= lt!665886 e!859601)))

(assert (=> b!1544378 (= c!141388 (and (not lt!665887) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544378 (= lt!665887 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!68940 () Bool)

(assert (=> bm!68940 (= call!68940 call!68941)))

(declare-fun b!1544379 () Bool)

(declare-fun res!1059375 () Bool)

(assert (=> b!1544379 (=> (not res!1059375) (not e!859597))))

(assert (=> b!1544379 (= res!1059375 (and (= (size!50234 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50235 _keys!618) (size!50234 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58567 () Bool)

(assert (=> mapIsEmpty!58567 mapRes!58567))

(declare-fun b!1544380 () Bool)

(declare-fun e!859600 () Bool)

(assert (=> b!1544380 (= e!859600 tp_is_empty!37909)))

(declare-fun b!1544381 () Bool)

(assert (=> b!1544381 (= e!859595 call!68940)))

(declare-fun b!1544382 () Bool)

(assert (=> b!1544382 (= e!859599 (and e!859600 mapRes!58567))))

(declare-fun condMapEmpty!58567 () Bool)

(declare-fun mapDefault!58567 () ValueCell!18044)

(assert (=> b!1544382 (= condMapEmpty!58567 (= (arr!49682 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18044)) mapDefault!58567)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68941 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6546 (array!102960 array!102958 (_ BitVec 32) (_ BitVec 32) V!58989 V!58989 (_ BitVec 32) Int) ListLongMap!22133)

(assert (=> bm!68941 (= call!68942 (getCurrentListMapNoExtraKeys!6546 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544383 () Bool)

(declare-fun res!1059377 () Bool)

(assert (=> b!1544383 (=> (not res!1059377) (not e!859597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102960 (_ BitVec 32)) Bool)

(assert (=> b!1544383 (= res!1059377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131870 res!1059376) b!1544379))

(assert (= (and b!1544379 res!1059375) b!1544383))

(assert (= (and b!1544383 res!1059377) b!1544373))

(assert (= (and b!1544373 res!1059378) b!1544374))

(assert (= (and b!1544374 res!1059374) b!1544378))

(assert (= (and b!1544378 c!141388) b!1544372))

(assert (= (and b!1544378 (not c!141388)) b!1544376))

(assert (= (and b!1544376 c!141389) b!1544370))

(assert (= (and b!1544376 (not c!141389)) b!1544371))

(assert (= (and b!1544371 c!141390) b!1544377))

(assert (= (and b!1544371 (not c!141390)) b!1544381))

(assert (= (or b!1544377 b!1544381) bm!68940))

(assert (= (or b!1544370 bm!68940) bm!68938))

(assert (= (or b!1544370 b!1544377) bm!68937))

(assert (= (or b!1544372 bm!68938) bm!68941))

(assert (= (or b!1544372 bm!68937) bm!68939))

(assert (= (and b!1544382 condMapEmpty!58567) mapIsEmpty!58567))

(assert (= (and b!1544382 (not condMapEmpty!58567)) mapNonEmpty!58567))

(get-info :version)

(assert (= (and mapNonEmpty!58567 ((_ is ValueCellFull!18044) mapValue!58567)) b!1544375))

(assert (= (and b!1544382 ((_ is ValueCellFull!18044) mapDefault!58567)) b!1544380))

(assert (= start!131870 b!1544382))

(declare-fun m!1424493 () Bool)

(assert (=> b!1544373 m!1424493))

(declare-fun m!1424495 () Bool)

(assert (=> mapNonEmpty!58567 m!1424495))

(declare-fun m!1424497 () Bool)

(assert (=> b!1544383 m!1424497))

(declare-fun m!1424499 () Bool)

(assert (=> bm!68939 m!1424499))

(declare-fun m!1424501 () Bool)

(assert (=> start!131870 m!1424501))

(declare-fun m!1424503 () Bool)

(assert (=> start!131870 m!1424503))

(declare-fun m!1424505 () Bool)

(assert (=> start!131870 m!1424505))

(declare-fun m!1424507 () Bool)

(assert (=> bm!68941 m!1424507))

(declare-fun m!1424509 () Bool)

(assert (=> b!1544372 m!1424509))

(check-sat (not b!1544373) (not mapNonEmpty!58567) (not b!1544383) (not bm!68941) b_and!51025 (not start!131870) tp_is_empty!37909 (not bm!68939) (not b!1544372) (not b_next!31633))
(check-sat b_and!51025 (not b_next!31633))
