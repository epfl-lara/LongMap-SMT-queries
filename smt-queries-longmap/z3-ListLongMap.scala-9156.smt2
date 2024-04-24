; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110040 () Bool)

(assert start!110040)

(declare-fun b_free!29209 () Bool)

(declare-fun b_next!29209 () Bool)

(assert (=> start!110040 (= b_free!29209 (not b_next!29209))))

(declare-fun tp!102760 () Bool)

(declare-fun b_and!47325 () Bool)

(assert (=> start!110040 (= tp!102760 b_and!47325)))

(declare-fun b!1302366 () Bool)

(declare-fun e!742954 () Bool)

(declare-fun e!742953 () Bool)

(declare-fun mapRes!53849 () Bool)

(assert (=> b!1302366 (= e!742954 (and e!742953 mapRes!53849))))

(declare-fun condMapEmpty!53849 () Bool)

(declare-datatypes ((V!51569 0))(
  ( (V!51570 (val!17499 Int)) )
))
(declare-datatypes ((ValueCell!16526 0))(
  ( (ValueCellFull!16526 (v!20102 V!51569)) (EmptyCell!16526) )
))
(declare-datatypes ((array!86745 0))(
  ( (array!86746 (arr!41864 (Array (_ BitVec 32) ValueCell!16526)) (size!42415 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86745)

(declare-fun mapDefault!53849 () ValueCell!16526)

(assert (=> b!1302366 (= condMapEmpty!53849 (= (arr!41864 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16526)) mapDefault!53849)))))

(declare-fun minValue!1387 () V!51569)

(declare-fun zeroValue!1387 () V!51569)

(declare-fun c!125086 () Bool)

(declare-fun bm!63897 () Bool)

(declare-datatypes ((tuple2!22590 0))(
  ( (tuple2!22591 (_1!11306 (_ BitVec 64)) (_2!11306 V!51569)) )
))
(declare-datatypes ((List!29743 0))(
  ( (Nil!29740) (Cons!29739 (h!30957 tuple2!22590) (t!43309 List!29743)) )
))
(declare-datatypes ((ListLongMap!20255 0))(
  ( (ListLongMap!20256 (toList!10143 List!29743)) )
))
(declare-fun lt!582210 () ListLongMap!20255)

(declare-fun lt!582214 () ListLongMap!20255)

(declare-fun c!125087 () Bool)

(declare-datatypes ((Unit!43028 0))(
  ( (Unit!43029) )
))
(declare-fun call!63903 () Unit!43028)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!582206 () ListLongMap!20255)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!85 ((_ BitVec 64) (_ BitVec 64) V!51569 ListLongMap!20255) Unit!43028)

(assert (=> bm!63897 (= call!63903 (lemmaInListMapAfterAddingDiffThenInBefore!85 k0!1205 (ite c!125087 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125086 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125087 minValue!1387 (ite c!125086 zeroValue!1387 minValue!1387)) (ite c!125087 lt!582214 (ite c!125086 lt!582206 lt!582210))))))

(declare-fun b!1302367 () Bool)

(declare-fun c!125088 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!582207 () Bool)

(assert (=> b!1302367 (= c!125088 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582207))))

(declare-fun e!742958 () Unit!43028)

(declare-fun e!742955 () Unit!43028)

(assert (=> b!1302367 (= e!742958 e!742955)))

(declare-fun b!1302368 () Bool)

(declare-fun res!865007 () Bool)

(declare-fun e!742952 () Bool)

(assert (=> b!1302368 (=> (not res!865007) (not e!742952))))

(declare-datatypes ((array!86747 0))(
  ( (array!86748 (arr!41865 (Array (_ BitVec 32) (_ BitVec 64))) (size!42416 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86747)

(declare-datatypes ((List!29744 0))(
  ( (Nil!29741) (Cons!29740 (h!30958 (_ BitVec 64)) (t!43310 List!29744)) )
))
(declare-fun arrayNoDuplicates!0 (array!86747 (_ BitVec 32) List!29744) Bool)

(assert (=> b!1302368 (= res!865007 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29741))))

(declare-fun b!1302369 () Bool)

(declare-fun e!742956 () Bool)

(declare-fun tp_is_empty!34849 () Bool)

(assert (=> b!1302369 (= e!742956 tp_is_empty!34849)))

(declare-fun res!865010 () Bool)

(assert (=> start!110040 (=> (not res!865010) (not e!742952))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110040 (= res!865010 (validMask!0 mask!2175))))

(assert (=> start!110040 e!742952))

(assert (=> start!110040 tp_is_empty!34849))

(assert (=> start!110040 true))

(declare-fun array_inv!31913 (array!86745) Bool)

(assert (=> start!110040 (and (array_inv!31913 _values!1445) e!742954)))

(declare-fun array_inv!31914 (array!86747) Bool)

(assert (=> start!110040 (array_inv!31914 _keys!1741)))

(assert (=> start!110040 tp!102760))

(declare-fun b!1302370 () Bool)

(declare-fun call!63900 () Bool)

(assert (=> b!1302370 call!63900))

(declare-fun lt!582212 () Unit!43028)

(declare-fun call!63905 () Unit!43028)

(assert (=> b!1302370 (= lt!582212 call!63905)))

(declare-fun call!63901 () ListLongMap!20255)

(assert (=> b!1302370 (= lt!582206 call!63901)))

(assert (=> b!1302370 (= e!742958 lt!582212)))

(declare-fun b!1302371 () Bool)

(declare-fun res!865009 () Bool)

(assert (=> b!1302371 (=> (not res!865009) (not e!742952))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302371 (= res!865009 (validKeyInArray!0 (select (arr!41865 _keys!1741) from!2144)))))

(declare-fun b!1302372 () Bool)

(declare-fun Unit!43030 () Unit!43028)

(assert (=> b!1302372 (= e!742955 Unit!43030)))

(declare-fun mapIsEmpty!53849 () Bool)

(assert (=> mapIsEmpty!53849 mapRes!53849))

(declare-fun b!1302373 () Bool)

(declare-fun res!865011 () Bool)

(assert (=> b!1302373 (=> (not res!865011) (not e!742952))))

(assert (=> b!1302373 (= res!865011 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42416 _keys!1741))))))

(declare-fun b!1302374 () Bool)

(declare-fun res!865005 () Bool)

(assert (=> b!1302374 (=> (not res!865005) (not e!742952))))

(assert (=> b!1302374 (= res!865005 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42416 _keys!1741))))))

(declare-fun b!1302375 () Bool)

(declare-fun res!865006 () Bool)

(assert (=> b!1302375 (=> (not res!865006) (not e!742952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86747 (_ BitVec 32)) Bool)

(assert (=> b!1302375 (= res!865006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302376 () Bool)

(assert (=> b!1302376 (= e!742953 tp_is_empty!34849)))

(declare-fun bm!63898 () Bool)

(declare-fun call!63902 () Bool)

(assert (=> bm!63898 (= call!63900 call!63902)))

(declare-fun bm!63899 () Bool)

(assert (=> bm!63899 (= call!63905 call!63903)))

(declare-fun bm!63900 () Bool)

(declare-fun call!63904 () ListLongMap!20255)

(assert (=> bm!63900 (= call!63901 call!63904)))

(declare-fun b!1302377 () Bool)

(declare-fun res!865004 () Bool)

(assert (=> b!1302377 (=> (not res!865004) (not e!742952))))

(assert (=> b!1302377 (= res!865004 (and (= (size!42415 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42416 _keys!1741) (size!42415 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302378 () Bool)

(declare-fun e!742957 () Unit!43028)

(declare-fun lt!582216 () Unit!43028)

(assert (=> b!1302378 (= e!742957 lt!582216)))

(declare-fun lt!582208 () ListLongMap!20255)

(assert (=> b!1302378 (= lt!582208 call!63904)))

(declare-fun +!4510 (ListLongMap!20255 tuple2!22590) ListLongMap!20255)

(assert (=> b!1302378 (= lt!582214 (+!4510 lt!582208 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582209 () Unit!43028)

(assert (=> b!1302378 (= lt!582209 call!63903)))

(assert (=> b!1302378 call!63902))

(assert (=> b!1302378 (= lt!582216 (lemmaInListMapAfterAddingDiffThenInBefore!85 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582208))))

(declare-fun contains!8281 (ListLongMap!20255 (_ BitVec 64)) Bool)

(assert (=> b!1302378 (contains!8281 lt!582208 k0!1205)))

(declare-fun b!1302379 () Bool)

(declare-fun res!865008 () Bool)

(assert (=> b!1302379 (=> (not res!865008) (not e!742952))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5157 (array!86747 array!86745 (_ BitVec 32) (_ BitVec 32) V!51569 V!51569 (_ BitVec 32) Int) ListLongMap!20255)

(assert (=> b!1302379 (= res!865008 (contains!8281 (getCurrentListMap!5157 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63901 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6148 (array!86747 array!86745 (_ BitVec 32) (_ BitVec 32) V!51569 V!51569 (_ BitVec 32) Int) ListLongMap!20255)

(assert (=> bm!63901 (= call!63904 (getCurrentListMapNoExtraKeys!6148 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302380 () Bool)

(assert (=> b!1302380 (= e!742952 (not (or (= k0!1205 (select (arr!41865 _keys!1741) from!2144)) (not (= (select (arr!41865 _keys!1741) from!2144) k0!1205)))))))

(assert (=> b!1302380 (not (contains!8281 (ListLongMap!20256 Nil!29740) k0!1205))))

(declare-fun lt!582211 () Unit!43028)

(declare-fun emptyContainsNothing!202 ((_ BitVec 64)) Unit!43028)

(assert (=> b!1302380 (= lt!582211 (emptyContainsNothing!202 k0!1205))))

(declare-fun lt!582215 () Unit!43028)

(assert (=> b!1302380 (= lt!582215 e!742957)))

(assert (=> b!1302380 (= c!125087 (and (not lt!582207) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1302380 (= lt!582207 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1302381 () Bool)

(assert (=> b!1302381 (= e!742957 e!742958)))

(assert (=> b!1302381 (= c!125086 (and (not lt!582207) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!53849 () Bool)

(declare-fun tp!102761 () Bool)

(assert (=> mapNonEmpty!53849 (= mapRes!53849 (and tp!102761 e!742956))))

(declare-fun mapValue!53849 () ValueCell!16526)

(declare-fun mapRest!53849 () (Array (_ BitVec 32) ValueCell!16526))

(declare-fun mapKey!53849 () (_ BitVec 32))

(assert (=> mapNonEmpty!53849 (= (arr!41864 _values!1445) (store mapRest!53849 mapKey!53849 mapValue!53849))))

(declare-fun b!1302382 () Bool)

(declare-fun lt!582213 () Unit!43028)

(assert (=> b!1302382 (= e!742955 lt!582213)))

(assert (=> b!1302382 (= lt!582210 call!63901)))

(assert (=> b!1302382 (= lt!582213 call!63905)))

(assert (=> b!1302382 call!63900))

(declare-fun bm!63902 () Bool)

(assert (=> bm!63902 (= call!63902 (contains!8281 (ite c!125087 lt!582214 (ite c!125086 lt!582206 lt!582210)) k0!1205))))

(assert (= (and start!110040 res!865010) b!1302377))

(assert (= (and b!1302377 res!865004) b!1302375))

(assert (= (and b!1302375 res!865006) b!1302368))

(assert (= (and b!1302368 res!865007) b!1302373))

(assert (= (and b!1302373 res!865011) b!1302379))

(assert (= (and b!1302379 res!865008) b!1302374))

(assert (= (and b!1302374 res!865005) b!1302371))

(assert (= (and b!1302371 res!865009) b!1302380))

(assert (= (and b!1302380 c!125087) b!1302378))

(assert (= (and b!1302380 (not c!125087)) b!1302381))

(assert (= (and b!1302381 c!125086) b!1302370))

(assert (= (and b!1302381 (not c!125086)) b!1302367))

(assert (= (and b!1302367 c!125088) b!1302382))

(assert (= (and b!1302367 (not c!125088)) b!1302372))

(assert (= (or b!1302370 b!1302382) bm!63900))

(assert (= (or b!1302370 b!1302382) bm!63899))

(assert (= (or b!1302370 b!1302382) bm!63898))

(assert (= (or b!1302378 bm!63900) bm!63901))

(assert (= (or b!1302378 bm!63899) bm!63897))

(assert (= (or b!1302378 bm!63898) bm!63902))

(assert (= (and b!1302366 condMapEmpty!53849) mapIsEmpty!53849))

(assert (= (and b!1302366 (not condMapEmpty!53849)) mapNonEmpty!53849))

(get-info :version)

(assert (= (and mapNonEmpty!53849 ((_ is ValueCellFull!16526) mapValue!53849)) b!1302369))

(assert (= (and b!1302366 ((_ is ValueCellFull!16526) mapDefault!53849)) b!1302376))

(assert (= start!110040 b!1302366))

(declare-fun m!1193423 () Bool)

(assert (=> b!1302378 m!1193423))

(declare-fun m!1193425 () Bool)

(assert (=> b!1302378 m!1193425))

(declare-fun m!1193427 () Bool)

(assert (=> b!1302378 m!1193427))

(declare-fun m!1193429 () Bool)

(assert (=> b!1302380 m!1193429))

(declare-fun m!1193431 () Bool)

(assert (=> b!1302380 m!1193431))

(declare-fun m!1193433 () Bool)

(assert (=> b!1302380 m!1193433))

(declare-fun m!1193435 () Bool)

(assert (=> b!1302368 m!1193435))

(declare-fun m!1193437 () Bool)

(assert (=> start!110040 m!1193437))

(declare-fun m!1193439 () Bool)

(assert (=> start!110040 m!1193439))

(declare-fun m!1193441 () Bool)

(assert (=> start!110040 m!1193441))

(declare-fun m!1193443 () Bool)

(assert (=> b!1302375 m!1193443))

(declare-fun m!1193445 () Bool)

(assert (=> b!1302379 m!1193445))

(assert (=> b!1302379 m!1193445))

(declare-fun m!1193447 () Bool)

(assert (=> b!1302379 m!1193447))

(declare-fun m!1193449 () Bool)

(assert (=> bm!63897 m!1193449))

(declare-fun m!1193451 () Bool)

(assert (=> bm!63902 m!1193451))

(declare-fun m!1193453 () Bool)

(assert (=> bm!63901 m!1193453))

(declare-fun m!1193455 () Bool)

(assert (=> mapNonEmpty!53849 m!1193455))

(assert (=> b!1302371 m!1193429))

(assert (=> b!1302371 m!1193429))

(declare-fun m!1193457 () Bool)

(assert (=> b!1302371 m!1193457))

(check-sat b_and!47325 (not bm!63901) (not b!1302379) tp_is_empty!34849 (not b_next!29209) (not bm!63897) (not b!1302378) (not b!1302380) (not b!1302371) (not start!110040) (not b!1302375) (not bm!63902) (not mapNonEmpty!53849) (not b!1302368))
(check-sat b_and!47325 (not b_next!29209))
