; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131864 () Bool)

(assert start!131864)

(declare-fun b_free!31627 () Bool)

(declare-fun b_next!31627 () Bool)

(assert (=> start!131864 (= b_free!31627 (not b_next!31627))))

(declare-fun tp!111133 () Bool)

(declare-fun b_and!51019 () Bool)

(assert (=> start!131864 (= tp!111133 b_and!51019)))

(declare-fun res!1059329 () Bool)

(declare-fun e!859529 () Bool)

(assert (=> start!131864 (=> (not res!1059329) (not e!859529))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131864 (= res!1059329 (validMask!0 mask!926))))

(assert (=> start!131864 e!859529))

(declare-datatypes ((array!102946 0))(
  ( (array!102947 (arr!49676 (Array (_ BitVec 32) (_ BitVec 64))) (size!50228 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102946)

(declare-fun array_inv!38837 (array!102946) Bool)

(assert (=> start!131864 (array_inv!38837 _keys!618)))

(declare-fun tp_is_empty!37903 () Bool)

(assert (=> start!131864 tp_is_empty!37903))

(assert (=> start!131864 true))

(assert (=> start!131864 tp!111133))

(declare-datatypes ((V!58981 0))(
  ( (V!58982 (val!19029 Int)) )
))
(declare-datatypes ((ValueCell!18041 0))(
  ( (ValueCellFull!18041 (v!21826 V!58981)) (EmptyCell!18041) )
))
(declare-datatypes ((array!102948 0))(
  ( (array!102949 (arr!49677 (Array (_ BitVec 32) ValueCell!18041)) (size!50229 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102948)

(declare-fun e!859526 () Bool)

(declare-fun array_inv!38838 (array!102948) Bool)

(assert (=> start!131864 (and (array_inv!38838 _values!470) e!859526)))

(declare-fun b!1544244 () Bool)

(declare-fun res!1059330 () Bool)

(assert (=> b!1544244 (=> (not res!1059330) (not e!859529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102946 (_ BitVec 32)) Bool)

(assert (=> b!1544244 (= res!1059330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!68892 () Bool)

(declare-fun zeroValue!436 () V!58981)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((tuple2!24518 0))(
  ( (tuple2!24519 (_1!12270 (_ BitVec 64)) (_2!12270 V!58981)) )
))
(declare-datatypes ((List!36004 0))(
  ( (Nil!36001) (Cons!36000 (h!37446 tuple2!24518) (t!50690 List!36004)) )
))
(declare-datatypes ((ListLongMap!22127 0))(
  ( (ListLongMap!22128 (toList!11079 List!36004)) )
))
(declare-fun call!68898 () ListLongMap!22127)

(declare-fun minValue!436 () V!58981)

(declare-fun getCurrentListMapNoExtraKeys!6544 (array!102946 array!102948 (_ BitVec 32) (_ BitVec 32) V!58981 V!58981 (_ BitVec 32) Int) ListLongMap!22127)

(assert (=> bm!68892 (= call!68898 (getCurrentListMapNoExtraKeys!6544 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544245 () Bool)

(declare-fun res!1059333 () Bool)

(assert (=> b!1544245 (=> (not res!1059333) (not e!859529))))

(assert (=> b!1544245 (= res!1059333 (and (= (size!50229 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50228 _keys!618) (size!50229 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun c!141361 () Bool)

(declare-fun bm!68893 () Bool)

(declare-fun call!68895 () ListLongMap!22127)

(declare-fun call!68897 () ListLongMap!22127)

(declare-fun c!141362 () Bool)

(declare-fun call!68899 () ListLongMap!22127)

(declare-fun +!4912 (ListLongMap!22127 tuple2!24518) ListLongMap!22127)

(assert (=> bm!68893 (= call!68897 (+!4912 (ite c!141361 call!68898 (ite c!141362 call!68899 call!68895)) (ite (or c!141361 c!141362) (tuple2!24519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544246 () Bool)

(declare-fun e!859525 () ListLongMap!22127)

(declare-fun call!68896 () ListLongMap!22127)

(assert (=> b!1544246 (= e!859525 call!68896)))

(declare-fun mapNonEmpty!58558 () Bool)

(declare-fun mapRes!58558 () Bool)

(declare-fun tp!111134 () Bool)

(declare-fun e!859524 () Bool)

(assert (=> mapNonEmpty!58558 (= mapRes!58558 (and tp!111134 e!859524))))

(declare-fun mapRest!58558 () (Array (_ BitVec 32) ValueCell!18041))

(declare-fun mapKey!58558 () (_ BitVec 32))

(declare-fun mapValue!58558 () ValueCell!18041)

(assert (=> mapNonEmpty!58558 (= (arr!49677 _values!470) (store mapRest!58558 mapKey!58558 mapValue!58558))))

(declare-fun mapIsEmpty!58558 () Bool)

(assert (=> mapIsEmpty!58558 mapRes!58558))

(declare-fun b!1544247 () Bool)

(declare-fun c!141363 () Bool)

(declare-fun lt!665868 () Bool)

(assert (=> b!1544247 (= c!141363 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!665868))))

(declare-fun e!859527 () ListLongMap!22127)

(assert (=> b!1544247 (= e!859525 e!859527)))

(declare-fun b!1544248 () Bool)

(declare-fun e!859523 () Bool)

(assert (=> b!1544248 (= e!859523 tp_is_empty!37903)))

(declare-fun b!1544249 () Bool)

(assert (=> b!1544249 (= e!859527 call!68896)))

(declare-fun b!1544250 () Bool)

(declare-fun e!859530 () ListLongMap!22127)

(assert (=> b!1544250 (= e!859530 (+!4912 call!68897 (tuple2!24519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!68894 () Bool)

(assert (=> bm!68894 (= call!68896 call!68897)))

(declare-fun b!1544251 () Bool)

(declare-fun res!1059332 () Bool)

(assert (=> b!1544251 (=> (not res!1059332) (not e!859529))))

(assert (=> b!1544251 (= res!1059332 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50228 _keys!618))))))

(declare-fun b!1544252 () Bool)

(assert (=> b!1544252 (= e!859529 false)))

(declare-fun lt!665869 () ListLongMap!22127)

(assert (=> b!1544252 (= lt!665869 e!859530)))

(assert (=> b!1544252 (= c!141361 (and (not lt!665868) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544252 (= lt!665868 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544253 () Bool)

(assert (=> b!1544253 (= e!859526 (and e!859523 mapRes!58558))))

(declare-fun condMapEmpty!58558 () Bool)

(declare-fun mapDefault!58558 () ValueCell!18041)

(assert (=> b!1544253 (= condMapEmpty!58558 (= (arr!49677 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18041)) mapDefault!58558)))))

(declare-fun b!1544254 () Bool)

(assert (=> b!1544254 (= e!859524 tp_is_empty!37903)))

(declare-fun b!1544255 () Bool)

(declare-fun res!1059331 () Bool)

(assert (=> b!1544255 (=> (not res!1059331) (not e!859529))))

(declare-datatypes ((List!36005 0))(
  ( (Nil!36002) (Cons!36001 (h!37447 (_ BitVec 64)) (t!50691 List!36005)) )
))
(declare-fun arrayNoDuplicates!0 (array!102946 (_ BitVec 32) List!36005) Bool)

(assert (=> b!1544255 (= res!1059331 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36002))))

(declare-fun b!1544256 () Bool)

(assert (=> b!1544256 (= e!859527 call!68895)))

(declare-fun bm!68895 () Bool)

(assert (=> bm!68895 (= call!68899 call!68898)))

(declare-fun bm!68896 () Bool)

(assert (=> bm!68896 (= call!68895 call!68899)))

(declare-fun b!1544257 () Bool)

(assert (=> b!1544257 (= e!859530 e!859525)))

(assert (=> b!1544257 (= c!141362 (and (not lt!665868) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!131864 res!1059329) b!1544245))

(assert (= (and b!1544245 res!1059333) b!1544244))

(assert (= (and b!1544244 res!1059330) b!1544255))

(assert (= (and b!1544255 res!1059331) b!1544251))

(assert (= (and b!1544251 res!1059332) b!1544252))

(assert (= (and b!1544252 c!141361) b!1544250))

(assert (= (and b!1544252 (not c!141361)) b!1544257))

(assert (= (and b!1544257 c!141362) b!1544246))

(assert (= (and b!1544257 (not c!141362)) b!1544247))

(assert (= (and b!1544247 c!141363) b!1544249))

(assert (= (and b!1544247 (not c!141363)) b!1544256))

(assert (= (or b!1544249 b!1544256) bm!68896))

(assert (= (or b!1544246 bm!68896) bm!68895))

(assert (= (or b!1544246 b!1544249) bm!68894))

(assert (= (or b!1544250 bm!68895) bm!68892))

(assert (= (or b!1544250 bm!68894) bm!68893))

(assert (= (and b!1544253 condMapEmpty!58558) mapIsEmpty!58558))

(assert (= (and b!1544253 (not condMapEmpty!58558)) mapNonEmpty!58558))

(get-info :version)

(assert (= (and mapNonEmpty!58558 ((_ is ValueCellFull!18041) mapValue!58558)) b!1544254))

(assert (= (and b!1544253 ((_ is ValueCellFull!18041) mapDefault!58558)) b!1544248))

(assert (= start!131864 b!1544253))

(declare-fun m!1424439 () Bool)

(assert (=> bm!68892 m!1424439))

(declare-fun m!1424441 () Bool)

(assert (=> mapNonEmpty!58558 m!1424441))

(declare-fun m!1424443 () Bool)

(assert (=> b!1544250 m!1424443))

(declare-fun m!1424445 () Bool)

(assert (=> b!1544255 m!1424445))

(declare-fun m!1424447 () Bool)

(assert (=> start!131864 m!1424447))

(declare-fun m!1424449 () Bool)

(assert (=> start!131864 m!1424449))

(declare-fun m!1424451 () Bool)

(assert (=> start!131864 m!1424451))

(declare-fun m!1424453 () Bool)

(assert (=> bm!68893 m!1424453))

(declare-fun m!1424455 () Bool)

(assert (=> b!1544244 m!1424455))

(check-sat tp_is_empty!37903 (not start!131864) (not mapNonEmpty!58558) (not bm!68893) (not b!1544255) (not b_next!31627) (not b!1544250) (not b!1544244) b_and!51019 (not bm!68892))
(check-sat b_and!51019 (not b_next!31627))
