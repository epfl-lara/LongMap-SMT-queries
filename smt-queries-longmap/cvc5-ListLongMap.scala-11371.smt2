; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132130 () Bool)

(assert start!132130)

(declare-fun b_free!31843 () Bool)

(declare-fun b_next!31843 () Bool)

(assert (=> start!132130 (= b_free!31843 (not b_next!31843))))

(declare-fun tp!111780 () Bool)

(declare-fun b_and!51253 () Bool)

(assert (=> start!132130 (= tp!111780 b_and!51253)))

(declare-fun b!1549701 () Bool)

(declare-fun res!1061672 () Bool)

(declare-fun e!862639 () Bool)

(assert (=> b!1549701 (=> (not res!1061672) (not e!862639))))

(declare-datatypes ((array!103434 0))(
  ( (array!103435 (arr!49919 (Array (_ BitVec 32) (_ BitVec 64))) (size!50469 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103434)

(declare-datatypes ((List!36136 0))(
  ( (Nil!36133) (Cons!36132 (h!37577 (_ BitVec 64)) (t!50832 List!36136)) )
))
(declare-fun arrayNoDuplicates!0 (array!103434 (_ BitVec 32) List!36136) Bool)

(assert (=> b!1549701 (= res!1061672 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36133))))

(declare-fun mapNonEmpty!58882 () Bool)

(declare-fun mapRes!58882 () Bool)

(declare-fun tp!111781 () Bool)

(declare-fun e!862641 () Bool)

(assert (=> mapNonEmpty!58882 (= mapRes!58882 (and tp!111781 e!862641))))

(declare-fun mapKey!58882 () (_ BitVec 32))

(declare-datatypes ((V!59269 0))(
  ( (V!59270 (val!19137 Int)) )
))
(declare-datatypes ((ValueCell!18149 0))(
  ( (ValueCellFull!18149 (v!21938 V!59269)) (EmptyCell!18149) )
))
(declare-datatypes ((array!103436 0))(
  ( (array!103437 (arr!49920 (Array (_ BitVec 32) ValueCell!18149)) (size!50470 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103436)

(declare-fun mapRest!58882 () (Array (_ BitVec 32) ValueCell!18149))

(declare-fun mapValue!58882 () ValueCell!18149)

(assert (=> mapNonEmpty!58882 (= (arr!49920 _values!470) (store mapRest!58882 mapKey!58882 mapValue!58882))))

(declare-fun bm!70547 () Bool)

(declare-datatypes ((tuple2!24652 0))(
  ( (tuple2!24653 (_1!12337 (_ BitVec 64)) (_2!12337 V!59269)) )
))
(declare-datatypes ((List!36137 0))(
  ( (Nil!36134) (Cons!36133 (h!37578 tuple2!24652) (t!50833 List!36137)) )
))
(declare-datatypes ((ListLongMap!22261 0))(
  ( (ListLongMap!22262 (toList!11146 List!36137)) )
))
(declare-fun call!70552 () ListLongMap!22261)

(declare-fun call!70551 () ListLongMap!22261)

(assert (=> bm!70547 (= call!70552 call!70551)))

(declare-fun b!1549702 () Bool)

(declare-fun e!862635 () Bool)

(assert (=> b!1549702 (= e!862635 false)))

(declare-fun lt!668034 () Bool)

(declare-fun lt!668036 () ListLongMap!22261)

(declare-fun contains!10092 (ListLongMap!22261 (_ BitVec 64)) Bool)

(assert (=> b!1549702 (= lt!668034 (contains!10092 lt!668036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1549703 () Bool)

(declare-fun e!862632 () ListLongMap!22261)

(declare-fun e!862637 () ListLongMap!22261)

(assert (=> b!1549703 (= e!862632 e!862637)))

(declare-fun c!142433 () Bool)

(declare-fun lt!668032 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549703 (= c!142433 (and (not lt!668032) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549704 () Bool)

(declare-fun e!862633 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549704 (= e!862633 (not (validKeyInArray!0 (select (arr!49919 _keys!618) from!762))))))

(declare-fun res!1061670 () Bool)

(assert (=> start!132130 (=> (not res!1061670) (not e!862639))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132130 (= res!1061670 (validMask!0 mask!926))))

(assert (=> start!132130 e!862639))

(declare-fun array_inv!38809 (array!103434) Bool)

(assert (=> start!132130 (array_inv!38809 _keys!618)))

(declare-fun tp_is_empty!38119 () Bool)

(assert (=> start!132130 tp_is_empty!38119))

(assert (=> start!132130 true))

(assert (=> start!132130 tp!111780))

(declare-fun e!862634 () Bool)

(declare-fun array_inv!38810 (array!103436) Bool)

(assert (=> start!132130 (and (array_inv!38810 _values!470) e!862634)))

(declare-fun b!1549705 () Bool)

(declare-fun e!862629 () Bool)

(assert (=> b!1549705 (= e!862629 tp_is_empty!38119)))

(declare-fun b!1549706 () Bool)

(declare-fun res!1061668 () Bool)

(assert (=> b!1549706 (=> (not res!1061668) (not e!862639))))

(assert (=> b!1549706 (= res!1061668 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50469 _keys!618))))))

(declare-fun b!1549707 () Bool)

(declare-fun res!1061666 () Bool)

(assert (=> b!1549707 (=> (not res!1061666) (not e!862639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103434 (_ BitVec 32)) Bool)

(assert (=> b!1549707 (= res!1061666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549708 () Bool)

(declare-datatypes ((Unit!51625 0))(
  ( (Unit!51626) )
))
(declare-fun e!862631 () Unit!51625)

(declare-fun Unit!51627 () Unit!51625)

(assert (=> b!1549708 (= e!862631 Unit!51627)))

(declare-fun bm!70548 () Bool)

(declare-fun call!70553 () ListLongMap!22261)

(assert (=> bm!70548 (= call!70551 call!70553)))

(declare-fun b!1549709 () Bool)

(declare-fun e!862630 () ListLongMap!22261)

(assert (=> b!1549709 (= e!862630 call!70552)))

(declare-fun defaultEntry!478 () Int)

(declare-fun b!1549710 () Bool)

(declare-fun e!862638 () Bool)

(declare-fun apply!1085 (ListLongMap!22261 (_ BitVec 64)) V!59269)

(declare-fun get!25994 (ValueCell!18149 V!59269) V!59269)

(declare-fun dynLambda!3795 (Int (_ BitVec 64)) V!59269)

(assert (=> b!1549710 (= e!862638 (= (apply!1085 lt!668036 (select (arr!49919 _keys!618) from!762)) (get!25994 (select (arr!49920 _values!470) from!762) (dynLambda!3795 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1549711 () Bool)

(assert (=> b!1549711 (= e!862639 e!862635)))

(declare-fun res!1061667 () Bool)

(assert (=> b!1549711 (=> (not res!1061667) (not e!862635))))

(declare-fun e!862636 () Bool)

(assert (=> b!1549711 (= res!1061667 e!862636)))

(declare-fun res!1061669 () Bool)

(assert (=> b!1549711 (=> res!1061669 e!862636)))

(declare-fun lt!668035 () Bool)

(assert (=> b!1549711 (= res!1061669 lt!668035)))

(declare-fun lt!668029 () Unit!51625)

(assert (=> b!1549711 (= lt!668029 e!862631)))

(declare-fun c!142434 () Bool)

(assert (=> b!1549711 (= c!142434 (not lt!668035))))

(assert (=> b!1549711 (= lt!668035 e!862633)))

(declare-fun res!1061671 () Bool)

(assert (=> b!1549711 (=> res!1061671 e!862633)))

(assert (=> b!1549711 (= res!1061671 (bvsge from!762 (size!50469 _keys!618)))))

(assert (=> b!1549711 (= lt!668036 e!862632)))

(declare-fun c!142436 () Bool)

(assert (=> b!1549711 (= c!142436 (and (not lt!668032) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549711 (= lt!668032 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549712 () Bool)

(assert (=> b!1549712 (= e!862634 (and e!862629 mapRes!58882))))

(declare-fun condMapEmpty!58882 () Bool)

(declare-fun mapDefault!58882 () ValueCell!18149)

