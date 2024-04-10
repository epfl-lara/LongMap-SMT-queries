; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131896 () Bool)

(assert start!131896)

(declare-fun b_free!31609 () Bool)

(declare-fun b_next!31609 () Bool)

(assert (=> start!131896 (= b_free!31609 (not b_next!31609))))

(declare-fun tp!111079 () Bool)

(declare-fun b_and!51019 () Bool)

(assert (=> start!131896 (= tp!111079 b_and!51019)))

(declare-fun res!1059327 () Bool)

(declare-fun e!859507 () Bool)

(assert (=> start!131896 (=> (not res!1059327) (not e!859507))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131896 (= res!1059327 (validMask!0 mask!926))))

(assert (=> start!131896 e!859507))

(declare-datatypes ((array!102984 0))(
  ( (array!102985 (arr!49694 (Array (_ BitVec 32) (_ BitVec 64))) (size!50244 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102984)

(declare-fun array_inv!38659 (array!102984) Bool)

(assert (=> start!131896 (array_inv!38659 _keys!618)))

(declare-fun tp_is_empty!37885 () Bool)

(assert (=> start!131896 tp_is_empty!37885))

(assert (=> start!131896 true))

(assert (=> start!131896 tp!111079))

(declare-datatypes ((V!58957 0))(
  ( (V!58958 (val!19020 Int)) )
))
(declare-datatypes ((ValueCell!18032 0))(
  ( (ValueCellFull!18032 (v!21821 V!58957)) (EmptyCell!18032) )
))
(declare-datatypes ((array!102986 0))(
  ( (array!102987 (arr!49695 (Array (_ BitVec 32) ValueCell!18032)) (size!50245 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102986)

(declare-fun e!859506 () Bool)

(declare-fun array_inv!38660 (array!102986) Bool)

(assert (=> start!131896 (and (array_inv!38660 _values!470) e!859506)))

(declare-fun b!1544179 () Bool)

(declare-fun res!1059326 () Bool)

(assert (=> b!1544179 (=> (not res!1059326) (not e!859507))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544179 (= res!1059326 (and (= (size!50245 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50244 _keys!618) (size!50245 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58531 () Bool)

(declare-fun mapRes!58531 () Bool)

(declare-fun tp!111078 () Bool)

(declare-fun e!859510 () Bool)

(assert (=> mapNonEmpty!58531 (= mapRes!58531 (and tp!111078 e!859510))))

(declare-fun mapRest!58531 () (Array (_ BitVec 32) ValueCell!18032))

(declare-fun mapKey!58531 () (_ BitVec 32))

(declare-fun mapValue!58531 () ValueCell!18032)

(assert (=> mapNonEmpty!58531 (= (arr!49695 _values!470) (store mapRest!58531 mapKey!58531 mapValue!58531))))

(declare-fun b!1544180 () Bool)

(declare-fun res!1059324 () Bool)

(assert (=> b!1544180 (=> (not res!1059324) (not e!859507))))

(declare-datatypes ((List!35947 0))(
  ( (Nil!35944) (Cons!35943 (h!37388 (_ BitVec 64)) (t!50641 List!35947)) )
))
(declare-fun arrayNoDuplicates!0 (array!102984 (_ BitVec 32) List!35947) Bool)

(assert (=> b!1544180 (= res!1059324 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35944))))

(declare-fun b!1544181 () Bool)

(declare-datatypes ((tuple2!24430 0))(
  ( (tuple2!24431 (_1!12226 (_ BitVec 64)) (_2!12226 V!58957)) )
))
(declare-datatypes ((List!35948 0))(
  ( (Nil!35945) (Cons!35944 (h!37389 tuple2!24430) (t!50642 List!35948)) )
))
(declare-datatypes ((ListLongMap!22039 0))(
  ( (ListLongMap!22040 (toList!11035 List!35948)) )
))
(declare-fun e!859508 () ListLongMap!22039)

(declare-fun call!68796 () ListLongMap!22039)

(assert (=> b!1544181 (= e!859508 call!68796)))

(declare-fun zeroValue!436 () V!58957)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun minValue!436 () V!58957)

(declare-fun call!68797 () ListLongMap!22039)

(declare-fun bm!68792 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6507 (array!102984 array!102986 (_ BitVec 32) (_ BitVec 32) V!58957 V!58957 (_ BitVec 32) Int) ListLongMap!22039)

(assert (=> bm!68792 (= call!68797 (getCurrentListMapNoExtraKeys!6507 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!68793 () Bool)

(declare-fun call!68798 () ListLongMap!22039)

(assert (=> bm!68793 (= call!68798 call!68797)))

(declare-fun b!1544182 () Bool)

(declare-fun c!141371 () Bool)

(declare-fun lt!666101 () Bool)

(assert (=> b!1544182 (= c!141371 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666101))))

(declare-fun e!859505 () ListLongMap!22039)

(assert (=> b!1544182 (= e!859505 e!859508)))

(declare-fun b!1544183 () Bool)

(assert (=> b!1544183 (= e!859510 tp_is_empty!37885)))

(declare-fun b!1544184 () Bool)

(declare-fun e!859509 () ListLongMap!22039)

(assert (=> b!1544184 (= e!859509 e!859505)))

(declare-fun c!141370 () Bool)

(assert (=> b!1544184 (= c!141370 (and (not lt!666101) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!68794 () Bool)

(declare-fun call!68795 () ListLongMap!22039)

(assert (=> bm!68794 (= call!68795 call!68798)))

(declare-fun b!1544185 () Bool)

(assert (=> b!1544185 (= e!859505 call!68796)))

(declare-fun b!1544186 () Bool)

(declare-fun call!68799 () ListLongMap!22039)

(declare-fun +!4874 (ListLongMap!22039 tuple2!24430) ListLongMap!22039)

(assert (=> b!1544186 (= e!859509 (+!4874 call!68799 (tuple2!24431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544187 () Bool)

(declare-fun e!859511 () Bool)

(assert (=> b!1544187 (= e!859511 tp_is_empty!37885)))

(declare-fun b!1544188 () Bool)

(assert (=> b!1544188 (= e!859508 call!68795)))

(declare-fun mapIsEmpty!58531 () Bool)

(assert (=> mapIsEmpty!58531 mapRes!58531))

(declare-fun c!141369 () Bool)

(declare-fun bm!68795 () Bool)

(assert (=> bm!68795 (= call!68799 (+!4874 (ite c!141369 call!68797 (ite c!141370 call!68798 call!68795)) (ite (or c!141369 c!141370) (tuple2!24431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1544189 () Bool)

(assert (=> b!1544189 (= e!859507 false)))

(declare-fun lt!666100 () ListLongMap!22039)

(assert (=> b!1544189 (= lt!666100 e!859509)))

(assert (=> b!1544189 (= c!141369 (and (not lt!666101) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544189 (= lt!666101 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544190 () Bool)

(assert (=> b!1544190 (= e!859506 (and e!859511 mapRes!58531))))

(declare-fun condMapEmpty!58531 () Bool)

(declare-fun mapDefault!58531 () ValueCell!18032)

