; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131894 () Bool)

(assert start!131894)

(declare-fun b_free!31607 () Bool)

(declare-fun b_next!31607 () Bool)

(assert (=> start!131894 (= b_free!31607 (not b_next!31607))))

(declare-fun tp!111072 () Bool)

(declare-fun b_and!51017 () Bool)

(assert (=> start!131894 (= tp!111072 b_and!51017)))

(declare-fun bm!68777 () Bool)

(declare-datatypes ((V!58953 0))(
  ( (V!58954 (val!19019 Int)) )
))
(declare-datatypes ((tuple2!24428 0))(
  ( (tuple2!24429 (_1!12225 (_ BitVec 64)) (_2!12225 V!58953)) )
))
(declare-datatypes ((List!35945 0))(
  ( (Nil!35942) (Cons!35941 (h!37386 tuple2!24428) (t!50639 List!35945)) )
))
(declare-datatypes ((ListLongMap!22037 0))(
  ( (ListLongMap!22038 (toList!11034 List!35945)) )
))
(declare-fun call!68781 () ListLongMap!22037)

(declare-fun call!68782 () ListLongMap!22037)

(assert (=> bm!68777 (= call!68781 call!68782)))

(declare-fun b!1544137 () Bool)

(declare-fun e!859488 () ListLongMap!22037)

(assert (=> b!1544137 (= e!859488 call!68781)))

(declare-fun b!1544138 () Bool)

(declare-fun e!859482 () ListLongMap!22037)

(declare-fun e!859483 () ListLongMap!22037)

(assert (=> b!1544138 (= e!859482 e!859483)))

(declare-fun c!141361 () Bool)

(declare-fun lt!666095 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544138 (= c!141361 (and (not lt!666095) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((array!102980 0))(
  ( (array!102981 (arr!49692 (Array (_ BitVec 32) (_ BitVec 64))) (size!50242 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102980)

(declare-fun zeroValue!436 () V!58953)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!68778 () Bool)

(declare-fun call!68784 () ListLongMap!22037)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18031 0))(
  ( (ValueCellFull!18031 (v!21820 V!58953)) (EmptyCell!18031) )
))
(declare-datatypes ((array!102982 0))(
  ( (array!102983 (arr!49693 (Array (_ BitVec 32) ValueCell!18031)) (size!50243 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102982)

(declare-fun minValue!436 () V!58953)

(declare-fun getCurrentListMapNoExtraKeys!6506 (array!102980 array!102982 (_ BitVec 32) (_ BitVec 32) V!58953 V!58953 (_ BitVec 32) Int) ListLongMap!22037)

(assert (=> bm!68778 (= call!68784 (getCurrentListMapNoExtraKeys!6506 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544139 () Bool)

(declare-fun e!859481 () Bool)

(declare-fun tp_is_empty!37883 () Bool)

(assert (=> b!1544139 (= e!859481 tp_is_empty!37883)))

(declare-fun b!1544140 () Bool)

(declare-fun res!1059309 () Bool)

(declare-fun e!859486 () Bool)

(assert (=> b!1544140 (=> (not res!1059309) (not e!859486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102980 (_ BitVec 32)) Bool)

(assert (=> b!1544140 (= res!1059309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544141 () Bool)

(declare-fun c!141360 () Bool)

(assert (=> b!1544141 (= c!141360 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666095))))

(assert (=> b!1544141 (= e!859483 e!859488)))

(declare-fun b!1544142 () Bool)

(declare-fun e!859484 () Bool)

(assert (=> b!1544142 (= e!859484 tp_is_empty!37883)))

(declare-fun bm!68779 () Bool)

(declare-fun call!68783 () ListLongMap!22037)

(declare-fun call!68780 () ListLongMap!22037)

(assert (=> bm!68779 (= call!68783 call!68780)))

(declare-fun b!1544143 () Bool)

(assert (=> b!1544143 (= e!859486 false)))

(declare-fun lt!666094 () ListLongMap!22037)

(assert (=> b!1544143 (= lt!666094 e!859482)))

(declare-fun c!141362 () Bool)

(assert (=> b!1544143 (= c!141362 (and (not lt!666095) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544143 (= lt!666095 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544144 () Bool)

(declare-fun res!1059310 () Bool)

(assert (=> b!1544144 (=> (not res!1059310) (not e!859486))))

(assert (=> b!1544144 (= res!1059310 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50242 _keys!618))))))

(declare-fun b!1544145 () Bool)

(assert (=> b!1544145 (= e!859488 call!68783)))

(declare-fun b!1544146 () Bool)

(declare-fun res!1059311 () Bool)

(assert (=> b!1544146 (=> (not res!1059311) (not e!859486))))

(declare-datatypes ((List!35946 0))(
  ( (Nil!35943) (Cons!35942 (h!37387 (_ BitVec 64)) (t!50640 List!35946)) )
))
(declare-fun arrayNoDuplicates!0 (array!102980 (_ BitVec 32) List!35946) Bool)

(assert (=> b!1544146 (= res!1059311 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35943))))

(declare-fun bm!68780 () Bool)

(declare-fun +!4873 (ListLongMap!22037 tuple2!24428) ListLongMap!22037)

(assert (=> bm!68780 (= call!68782 (+!4873 (ite c!141362 call!68784 (ite c!141361 call!68780 call!68783)) (ite (or c!141362 c!141361) (tuple2!24429 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24429 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544147 () Bool)

(assert (=> b!1544147 (= e!859483 call!68781)))

(declare-fun mapIsEmpty!58528 () Bool)

(declare-fun mapRes!58528 () Bool)

(assert (=> mapIsEmpty!58528 mapRes!58528))

(declare-fun b!1544148 () Bool)

(assert (=> b!1544148 (= e!859482 (+!4873 call!68782 (tuple2!24429 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun res!1059308 () Bool)

(assert (=> start!131894 (=> (not res!1059308) (not e!859486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131894 (= res!1059308 (validMask!0 mask!926))))

(assert (=> start!131894 e!859486))

(declare-fun array_inv!38657 (array!102980) Bool)

(assert (=> start!131894 (array_inv!38657 _keys!618)))

(assert (=> start!131894 tp_is_empty!37883))

(assert (=> start!131894 true))

(assert (=> start!131894 tp!111072))

(declare-fun e!859487 () Bool)

(declare-fun array_inv!38658 (array!102982) Bool)

(assert (=> start!131894 (and (array_inv!38658 _values!470) e!859487)))

(declare-fun b!1544149 () Bool)

(assert (=> b!1544149 (= e!859487 (and e!859481 mapRes!58528))))

(declare-fun condMapEmpty!58528 () Bool)

(declare-fun mapDefault!58528 () ValueCell!18031)

