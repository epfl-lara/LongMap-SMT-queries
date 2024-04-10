; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132146 () Bool)

(assert start!132146)

(declare-fun b_free!31859 () Bool)

(declare-fun b_next!31859 () Bool)

(assert (=> start!132146 (= b_free!31859 (not b_next!31859))))

(declare-fun tp!111828 () Bool)

(declare-fun b_and!51281 () Bool)

(assert (=> start!132146 (= tp!111828 b_and!51281)))

(declare-fun b!1550197 () Bool)

(declare-datatypes ((V!59289 0))(
  ( (V!59290 (val!19145 Int)) )
))
(declare-datatypes ((tuple2!24668 0))(
  ( (tuple2!24669 (_1!12345 (_ BitVec 64)) (_2!12345 V!59289)) )
))
(declare-datatypes ((List!36151 0))(
  ( (Nil!36148) (Cons!36147 (h!37592 tuple2!24668) (t!50857 List!36151)) )
))
(declare-datatypes ((ListLongMap!22277 0))(
  ( (ListLongMap!22278 (toList!11154 List!36151)) )
))
(declare-fun e!862924 () ListLongMap!22277)

(declare-fun e!862922 () ListLongMap!22277)

(assert (=> b!1550197 (= e!862924 e!862922)))

(declare-fun c!142531 () Bool)

(declare-fun lt!668237 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1550197 (= c!142531 (and (not lt!668237) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550198 () Bool)

(declare-fun res!1061884 () Bool)

(declare-fun e!862925 () Bool)

(assert (=> b!1550198 (=> (not res!1061884) (not e!862925))))

(declare-datatypes ((array!103466 0))(
  ( (array!103467 (arr!49935 (Array (_ BitVec 32) (_ BitVec 64))) (size!50485 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103466)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18157 0))(
  ( (ValueCellFull!18157 (v!21946 V!59289)) (EmptyCell!18157) )
))
(declare-datatypes ((array!103468 0))(
  ( (array!103469 (arr!49936 (Array (_ BitVec 32) ValueCell!18157)) (size!50486 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103468)

(assert (=> b!1550198 (= res!1061884 (and (= (size!50486 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50485 _keys!618) (size!50486 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550199 () Bool)

(declare-fun res!1061883 () Bool)

(assert (=> b!1550199 (=> (not res!1061883) (not e!862925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103466 (_ BitVec 32)) Bool)

(assert (=> b!1550199 (= res!1061883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550200 () Bool)

(declare-fun call!70680 () ListLongMap!22277)

(assert (=> b!1550200 (= e!862922 call!70680)))

(declare-fun b!1550201 () Bool)

(declare-fun e!862923 () ListLongMap!22277)

(assert (=> b!1550201 (= e!862923 call!70680)))

(declare-fun b!1550202 () Bool)

(declare-fun c!142530 () Bool)

(assert (=> b!1550202 (= c!142530 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668237))))

(assert (=> b!1550202 (= e!862922 e!862923)))

(declare-fun res!1061882 () Bool)

(assert (=> start!132146 (=> (not res!1061882) (not e!862925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132146 (= res!1061882 (validMask!0 mask!926))))

(assert (=> start!132146 e!862925))

(declare-fun array_inv!38823 (array!103466) Bool)

(assert (=> start!132146 (array_inv!38823 _keys!618)))

(declare-fun tp_is_empty!38135 () Bool)

(assert (=> start!132146 tp_is_empty!38135))

(assert (=> start!132146 true))

(assert (=> start!132146 tp!111828))

(declare-fun e!862920 () Bool)

(declare-fun array_inv!38824 (array!103468) Bool)

(assert (=> start!132146 (and (array_inv!38824 _values!470) e!862920)))

(declare-fun mapNonEmpty!58906 () Bool)

(declare-fun mapRes!58906 () Bool)

(declare-fun tp!111829 () Bool)

(declare-fun e!862926 () Bool)

(assert (=> mapNonEmpty!58906 (= mapRes!58906 (and tp!111829 e!862926))))

(declare-fun mapKey!58906 () (_ BitVec 32))

(declare-fun mapRest!58906 () (Array (_ BitVec 32) ValueCell!18157))

(declare-fun mapValue!58906 () ValueCell!18157)

(assert (=> mapNonEmpty!58906 (= (arr!49936 _values!470) (store mapRest!58906 mapKey!58906 mapValue!58906))))

(declare-fun zeroValue!436 () V!59289)

(declare-fun call!70682 () ListLongMap!22277)

(declare-fun call!70681 () ListLongMap!22277)

(declare-fun minValue!436 () V!59289)

(declare-fun bm!70676 () Bool)

(declare-fun c!142532 () Bool)

(declare-fun call!70683 () ListLongMap!22277)

(declare-fun call!70679 () ListLongMap!22277)

(declare-fun +!4979 (ListLongMap!22277 tuple2!24668) ListLongMap!22277)

(assert (=> bm!70676 (= call!70681 (+!4979 (ite c!142532 call!70682 (ite c!142531 call!70683 call!70679)) (ite (or c!142532 c!142531) (tuple2!24669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70677 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6604 (array!103466 array!103468 (_ BitVec 32) (_ BitVec 32) V!59289 V!59289 (_ BitVec 32) Int) ListLongMap!22277)

(assert (=> bm!70677 (= call!70682 (getCurrentListMapNoExtraKeys!6604 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70678 () Bool)

(assert (=> bm!70678 (= call!70679 call!70683)))

(declare-fun b!1550203 () Bool)

(declare-fun e!862919 () Bool)

(assert (=> b!1550203 (= e!862919 tp_is_empty!38135)))

(declare-fun mapIsEmpty!58906 () Bool)

(assert (=> mapIsEmpty!58906 mapRes!58906))

(declare-fun b!1550204 () Bool)

(assert (=> b!1550204 (= e!862926 tp_is_empty!38135)))

(declare-fun b!1550205 () Bool)

(assert (=> b!1550205 (= e!862920 (and e!862919 mapRes!58906))))

(declare-fun condMapEmpty!58906 () Bool)

(declare-fun mapDefault!58906 () ValueCell!18157)

