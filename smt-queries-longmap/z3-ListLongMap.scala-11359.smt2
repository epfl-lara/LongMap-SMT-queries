; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132470 () Bool)

(assert start!132470)

(declare-fun b_free!31771 () Bool)

(declare-fun b_next!31771 () Bool)

(assert (=> start!132470 (= b_free!31771 (not b_next!31771))))

(declare-fun tp!111565 () Bool)

(declare-fun b_and!51183 () Bool)

(assert (=> start!132470 (= tp!111565 b_and!51183)))

(declare-fun b!1550381 () Bool)

(declare-fun res!1061762 () Bool)

(declare-fun e!863141 () Bool)

(assert (=> b!1550381 (=> (not res!1061762) (not e!863141))))

(declare-datatypes ((array!103420 0))(
  ( (array!103421 (arr!49905 (Array (_ BitVec 32) (_ BitVec 64))) (size!50456 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103420)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103420 (_ BitVec 32)) Bool)

(assert (=> b!1550381 (= res!1061762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70157 () Bool)

(declare-datatypes ((V!59173 0))(
  ( (V!59174 (val!19101 Int)) )
))
(declare-datatypes ((tuple2!24642 0))(
  ( (tuple2!24643 (_1!12332 (_ BitVec 64)) (_2!12332 V!59173)) )
))
(declare-datatypes ((List!36118 0))(
  ( (Nil!36115) (Cons!36114 (h!37577 tuple2!24642) (t!50804 List!36118)) )
))
(declare-datatypes ((ListLongMap!22259 0))(
  ( (ListLongMap!22260 (toList!11145 List!36118)) )
))
(declare-fun call!70160 () ListLongMap!22259)

(declare-fun call!70161 () ListLongMap!22259)

(assert (=> bm!70157 (= call!70160 call!70161)))

(declare-fun b!1550382 () Bool)

(declare-fun e!863147 () Bool)

(declare-fun e!863142 () Bool)

(declare-fun mapRes!58774 () Bool)

(assert (=> b!1550382 (= e!863147 (and e!863142 mapRes!58774))))

(declare-fun condMapEmpty!58774 () Bool)

(declare-datatypes ((ValueCell!18113 0))(
  ( (ValueCellFull!18113 (v!21894 V!59173)) (EmptyCell!18113) )
))
(declare-datatypes ((array!103422 0))(
  ( (array!103423 (arr!49906 (Array (_ BitVec 32) ValueCell!18113)) (size!50457 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103422)

(declare-fun mapDefault!58774 () ValueCell!18113)

(assert (=> b!1550382 (= condMapEmpty!58774 (= (arr!49906 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18113)) mapDefault!58774)))))

(declare-fun mapNonEmpty!58774 () Bool)

(declare-fun tp!111564 () Bool)

(declare-fun e!863146 () Bool)

(assert (=> mapNonEmpty!58774 (= mapRes!58774 (and tp!111564 e!863146))))

(declare-fun mapRest!58774 () (Array (_ BitVec 32) ValueCell!18113))

(declare-fun mapKey!58774 () (_ BitVec 32))

(declare-fun mapValue!58774 () ValueCell!18113)

(assert (=> mapNonEmpty!58774 (= (arr!49906 _values!470) (store mapRest!58774 mapKey!58774 mapValue!58774))))

(declare-fun b!1550383 () Bool)

(declare-fun e!863148 () Bool)

(assert (=> b!1550383 (= e!863148 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667945 () ListLongMap!22259)

(declare-fun lt!667943 () Bool)

(declare-fun contains!10117 (ListLongMap!22259 (_ BitVec 64)) Bool)

(assert (=> b!1550383 (= lt!667943 (contains!10117 lt!667945 (select (arr!49905 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59173)

(declare-fun apply!1069 (ListLongMap!22259 (_ BitVec 64)) V!59173)

(declare-fun +!4988 (ListLongMap!22259 tuple2!24642) ListLongMap!22259)

(assert (=> b!1550383 (= (apply!1069 (+!4988 lt!667945 (tuple2!24643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49905 _keys!618) from!762)) (apply!1069 lt!667945 (select (arr!49905 _keys!618) from!762)))))

(declare-datatypes ((Unit!51503 0))(
  ( (Unit!51504) )
))
(declare-fun lt!667944 () Unit!51503)

(declare-fun addApplyDifferent!598 (ListLongMap!22259 (_ BitVec 64) V!59173 (_ BitVec 64)) Unit!51503)

(assert (=> b!1550383 (= lt!667944 (addApplyDifferent!598 lt!667945 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49905 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59173)

(assert (=> b!1550383 (contains!10117 (+!4988 lt!667945 (tuple2!24643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49905 _keys!618) from!762))))

(declare-fun lt!667948 () Unit!51503)

(declare-fun addStillContains!1259 (ListLongMap!22259 (_ BitVec 64) V!59173 (_ BitVec 64)) Unit!51503)

(assert (=> b!1550383 (= lt!667948 (addStillContains!1259 lt!667945 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49905 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6618 (array!103420 array!103422 (_ BitVec 32) (_ BitVec 32) V!59173 V!59173 (_ BitVec 32) Int) ListLongMap!22259)

(assert (=> b!1550383 (= lt!667945 (getCurrentListMapNoExtraKeys!6618 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58774 () Bool)

(assert (=> mapIsEmpty!58774 mapRes!58774))

(declare-fun res!1061765 () Bool)

(assert (=> start!132470 (=> (not res!1061765) (not e!863141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132470 (= res!1061765 (validMask!0 mask!926))))

(assert (=> start!132470 e!863141))

(declare-fun array_inv!39073 (array!103420) Bool)

(assert (=> start!132470 (array_inv!39073 _keys!618)))

(declare-fun tp_is_empty!38047 () Bool)

(assert (=> start!132470 tp_is_empty!38047))

(assert (=> start!132470 true))

(assert (=> start!132470 tp!111565))

(declare-fun array_inv!39074 (array!103422) Bool)

(assert (=> start!132470 (and (array_inv!39074 _values!470) e!863147)))

(declare-fun b!1550384 () Bool)

(declare-fun e!863140 () ListLongMap!22259)

(assert (=> b!1550384 (= e!863140 call!70160)))

(declare-fun b!1550385 () Bool)

(declare-fun c!142900 () Bool)

(declare-fun lt!667947 () Bool)

(assert (=> b!1550385 (= c!142900 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667947))))

(declare-fun e!863143 () ListLongMap!22259)

(assert (=> b!1550385 (= e!863143 e!863140)))

(declare-fun b!1550386 () Bool)

(declare-fun res!1061763 () Bool)

(assert (=> b!1550386 (=> (not res!1061763) (not e!863148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550386 (= res!1061763 (validKeyInArray!0 (select (arr!49905 _keys!618) from!762)))))

(declare-fun b!1550387 () Bool)

(assert (=> b!1550387 (= e!863146 tp_is_empty!38047)))

(declare-fun bm!70158 () Bool)

(declare-fun call!70164 () ListLongMap!22259)

(declare-fun call!70162 () ListLongMap!22259)

(assert (=> bm!70158 (= call!70164 call!70162)))

(declare-fun c!142899 () Bool)

(declare-fun call!70163 () ListLongMap!22259)

(declare-fun c!142898 () Bool)

(declare-fun bm!70159 () Bool)

(assert (=> bm!70159 (= call!70161 (+!4988 (ite c!142898 call!70163 (ite c!142899 call!70162 call!70164)) (ite (or c!142898 c!142899) (tuple2!24643 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70160 () Bool)

(assert (=> bm!70160 (= call!70163 (getCurrentListMapNoExtraKeys!6618 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70161 () Bool)

(assert (=> bm!70161 (= call!70162 call!70163)))

(declare-fun b!1550388 () Bool)

(assert (=> b!1550388 (= e!863143 call!70160)))

(declare-fun b!1550389 () Bool)

(declare-fun e!863145 () ListLongMap!22259)

(assert (=> b!1550389 (= e!863145 (+!4988 call!70161 (tuple2!24643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550390 () Bool)

(declare-fun res!1061766 () Bool)

(assert (=> b!1550390 (=> (not res!1061766) (not e!863141))))

(declare-datatypes ((List!36119 0))(
  ( (Nil!36116) (Cons!36115 (h!37578 (_ BitVec 64)) (t!50805 List!36119)) )
))
(declare-fun arrayNoDuplicates!0 (array!103420 (_ BitVec 32) List!36119) Bool)

(assert (=> b!1550390 (= res!1061766 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36116))))

(declare-fun b!1550391 () Bool)

(assert (=> b!1550391 (= e!863145 e!863143)))

(assert (=> b!1550391 (= c!142899 (and (not lt!667947) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550392 () Bool)

(declare-fun res!1061767 () Bool)

(assert (=> b!1550392 (=> (not res!1061767) (not e!863141))))

(assert (=> b!1550392 (= res!1061767 (and (= (size!50457 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50456 _keys!618) (size!50457 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550393 () Bool)

(assert (=> b!1550393 (= e!863142 tp_is_empty!38047)))

(declare-fun b!1550394 () Bool)

(assert (=> b!1550394 (= e!863140 call!70164)))

(declare-fun b!1550395 () Bool)

(declare-fun res!1061764 () Bool)

(assert (=> b!1550395 (=> (not res!1061764) (not e!863141))))

(assert (=> b!1550395 (= res!1061764 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50456 _keys!618))))))

(declare-fun b!1550396 () Bool)

(assert (=> b!1550396 (= e!863141 e!863148)))

(declare-fun res!1061768 () Bool)

(assert (=> b!1550396 (=> (not res!1061768) (not e!863148))))

(assert (=> b!1550396 (= res!1061768 (bvslt from!762 (size!50456 _keys!618)))))

(declare-fun lt!667946 () ListLongMap!22259)

(assert (=> b!1550396 (= lt!667946 e!863145)))

(assert (=> b!1550396 (= c!142898 (and (not lt!667947) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550396 (= lt!667947 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!132470 res!1061765) b!1550392))

(assert (= (and b!1550392 res!1061767) b!1550381))

(assert (= (and b!1550381 res!1061762) b!1550390))

(assert (= (and b!1550390 res!1061766) b!1550395))

(assert (= (and b!1550395 res!1061764) b!1550396))

(assert (= (and b!1550396 c!142898) b!1550389))

(assert (= (and b!1550396 (not c!142898)) b!1550391))

(assert (= (and b!1550391 c!142899) b!1550388))

(assert (= (and b!1550391 (not c!142899)) b!1550385))

(assert (= (and b!1550385 c!142900) b!1550384))

(assert (= (and b!1550385 (not c!142900)) b!1550394))

(assert (= (or b!1550384 b!1550394) bm!70158))

(assert (= (or b!1550388 bm!70158) bm!70161))

(assert (= (or b!1550388 b!1550384) bm!70157))

(assert (= (or b!1550389 bm!70161) bm!70160))

(assert (= (or b!1550389 bm!70157) bm!70159))

(assert (= (and b!1550396 res!1061768) b!1550386))

(assert (= (and b!1550386 res!1061763) b!1550383))

(assert (= (and b!1550382 condMapEmpty!58774) mapIsEmpty!58774))

(assert (= (and b!1550382 (not condMapEmpty!58774)) mapNonEmpty!58774))

(get-info :version)

(assert (= (and mapNonEmpty!58774 ((_ is ValueCellFull!18113) mapValue!58774)) b!1550387))

(assert (= (and b!1550382 ((_ is ValueCellFull!18113) mapDefault!58774)) b!1550393))

(assert (= start!132470 b!1550382))

(declare-fun m!1429695 () Bool)

(assert (=> start!132470 m!1429695))

(declare-fun m!1429697 () Bool)

(assert (=> start!132470 m!1429697))

(declare-fun m!1429699 () Bool)

(assert (=> start!132470 m!1429699))

(declare-fun m!1429701 () Bool)

(assert (=> b!1550381 m!1429701))

(declare-fun m!1429703 () Bool)

(assert (=> mapNonEmpty!58774 m!1429703))

(declare-fun m!1429705 () Bool)

(assert (=> bm!70159 m!1429705))

(declare-fun m!1429707 () Bool)

(assert (=> b!1550386 m!1429707))

(assert (=> b!1550386 m!1429707))

(declare-fun m!1429709 () Bool)

(assert (=> b!1550386 m!1429709))

(assert (=> b!1550383 m!1429707))

(declare-fun m!1429711 () Bool)

(assert (=> b!1550383 m!1429711))

(declare-fun m!1429713 () Bool)

(assert (=> b!1550383 m!1429713))

(assert (=> b!1550383 m!1429707))

(assert (=> b!1550383 m!1429707))

(declare-fun m!1429715 () Bool)

(assert (=> b!1550383 m!1429715))

(declare-fun m!1429717 () Bool)

(assert (=> b!1550383 m!1429717))

(declare-fun m!1429719 () Bool)

(assert (=> b!1550383 m!1429719))

(assert (=> b!1550383 m!1429707))

(declare-fun m!1429721 () Bool)

(assert (=> b!1550383 m!1429721))

(assert (=> b!1550383 m!1429707))

(declare-fun m!1429723 () Bool)

(assert (=> b!1550383 m!1429723))

(assert (=> b!1550383 m!1429707))

(declare-fun m!1429725 () Bool)

(assert (=> b!1550383 m!1429725))

(assert (=> b!1550383 m!1429717))

(assert (=> b!1550383 m!1429707))

(declare-fun m!1429727 () Bool)

(assert (=> b!1550383 m!1429727))

(assert (=> b!1550383 m!1429719))

(declare-fun m!1429729 () Bool)

(assert (=> b!1550390 m!1429729))

(assert (=> bm!70160 m!1429713))

(declare-fun m!1429731 () Bool)

(assert (=> b!1550389 m!1429731))

(check-sat (not b!1550390) (not b_next!31771) b_and!51183 (not mapNonEmpty!58774) (not b!1550386) (not bm!70160) tp_is_empty!38047 (not b!1550381) (not b!1550389) (not start!132470) (not bm!70159) (not b!1550383))
(check-sat b_and!51183 (not b_next!31771))
