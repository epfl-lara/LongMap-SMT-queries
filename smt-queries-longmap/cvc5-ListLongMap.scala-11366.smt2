; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132100 () Bool)

(assert start!132100)

(declare-fun b_free!31813 () Bool)

(declare-fun b_next!31813 () Bool)

(assert (=> start!132100 (= b_free!31813 (not b_next!31813))))

(declare-fun tp!111691 () Bool)

(declare-fun b_and!51223 () Bool)

(assert (=> start!132100 (= tp!111691 b_and!51223)))

(declare-fun mapIsEmpty!58837 () Bool)

(declare-fun mapRes!58837 () Bool)

(assert (=> mapIsEmpty!58837 mapRes!58837))

(declare-datatypes ((V!59229 0))(
  ( (V!59230 (val!19122 Int)) )
))
(declare-fun zeroValue!436 () V!59229)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18134 0))(
  ( (ValueCellFull!18134 (v!21923 V!59229)) (EmptyCell!18134) )
))
(declare-datatypes ((array!103376 0))(
  ( (array!103377 (arr!49890 (Array (_ BitVec 32) ValueCell!18134)) (size!50440 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103376)

(declare-fun minValue!436 () V!59229)

(declare-datatypes ((array!103378 0))(
  ( (array!103379 (arr!49891 (Array (_ BitVec 32) (_ BitVec 64))) (size!50441 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103378)

(declare-fun bm!70322 () Bool)

(declare-datatypes ((tuple2!24622 0))(
  ( (tuple2!24623 (_1!12322 (_ BitVec 64)) (_2!12322 V!59229)) )
))
(declare-datatypes ((List!36112 0))(
  ( (Nil!36109) (Cons!36108 (h!37553 tuple2!24622) (t!50806 List!36112)) )
))
(declare-datatypes ((ListLongMap!22231 0))(
  ( (ListLongMap!22232 (toList!11131 List!36112)) )
))
(declare-fun call!70326 () ListLongMap!22231)

(declare-fun getCurrentListMapNoExtraKeys!6585 (array!103378 array!103376 (_ BitVec 32) (_ BitVec 32) V!59229 V!59229 (_ BitVec 32) Int) ListLongMap!22231)

(assert (=> bm!70322 (= call!70326 (getCurrentListMapNoExtraKeys!6585 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548953 () Bool)

(declare-fun e!862204 () ListLongMap!22231)

(declare-fun call!70328 () ListLongMap!22231)

(assert (=> b!1548953 (= e!862204 call!70328)))

(declare-fun b!1548955 () Bool)

(declare-fun e!862201 () Bool)

(assert (=> b!1548955 (= e!862201 (not true))))

(declare-fun lt!667588 () ListLongMap!22231)

(declare-fun lt!667582 () V!59229)

(declare-fun apply!1076 (ListLongMap!22231 (_ BitVec 64)) V!59229)

(assert (=> b!1548955 (= (apply!1076 lt!667588 (select (arr!49891 _keys!618) from!762)) lt!667582)))

(declare-datatypes ((Unit!51602 0))(
  ( (Unit!51603) )
))
(declare-fun lt!667586 () Unit!51602)

(declare-fun lt!667587 () ListLongMap!22231)

(declare-fun addApplyDifferent!618 (ListLongMap!22231 (_ BitVec 64) V!59229 (_ BitVec 64)) Unit!51602)

(assert (=> b!1548955 (= lt!667586 (addApplyDifferent!618 lt!667587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49891 _keys!618) from!762)))))

(declare-fun lt!667584 () V!59229)

(assert (=> b!1548955 (= lt!667584 lt!667582)))

(assert (=> b!1548955 (= lt!667582 (apply!1076 lt!667587 (select (arr!49891 _keys!618) from!762)))))

(declare-fun +!4960 (ListLongMap!22231 tuple2!24622) ListLongMap!22231)

(assert (=> b!1548955 (= lt!667584 (apply!1076 (+!4960 lt!667587 (tuple2!24623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49891 _keys!618) from!762)))))

(declare-fun lt!667589 () Unit!51602)

(assert (=> b!1548955 (= lt!667589 (addApplyDifferent!618 lt!667587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49891 _keys!618) from!762)))))

(declare-fun contains!10083 (ListLongMap!22231 (_ BitVec 64)) Bool)

(assert (=> b!1548955 (contains!10083 lt!667588 (select (arr!49891 _keys!618) from!762))))

(assert (=> b!1548955 (= lt!667588 (+!4960 lt!667587 (tuple2!24623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667583 () Unit!51602)

(declare-fun addStillContains!1271 (ListLongMap!22231 (_ BitVec 64) V!59229 (_ BitVec 64)) Unit!51602)

(assert (=> b!1548955 (= lt!667583 (addStillContains!1271 lt!667587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49891 _keys!618) from!762)))))

(assert (=> b!1548955 (= lt!667587 (getCurrentListMapNoExtraKeys!6585 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548956 () Bool)

(declare-fun e!862205 () Bool)

(declare-fun tp_is_empty!38089 () Bool)

(assert (=> b!1548956 (= e!862205 tp_is_empty!38089)))

(declare-fun c!142288 () Bool)

(declare-fun bm!70323 () Bool)

(declare-fun call!70325 () ListLongMap!22231)

(declare-fun call!70329 () ListLongMap!22231)

(declare-fun c!142289 () Bool)

(assert (=> bm!70323 (= call!70325 (+!4960 (ite c!142289 call!70326 (ite c!142288 call!70329 call!70328)) (ite (or c!142289 c!142288) (tuple2!24623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548957 () Bool)

(declare-fun e!862198 () ListLongMap!22231)

(assert (=> b!1548957 (= e!862198 (+!4960 call!70325 (tuple2!24623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548958 () Bool)

(declare-fun e!862202 () Bool)

(assert (=> b!1548958 (= e!862202 tp_is_empty!38089)))

(declare-fun b!1548959 () Bool)

(declare-fun e!862200 () ListLongMap!22231)

(declare-fun call!70327 () ListLongMap!22231)

(assert (=> b!1548959 (= e!862200 call!70327)))

(declare-fun b!1548960 () Bool)

(declare-fun e!862206 () Bool)

(assert (=> b!1548960 (= e!862206 e!862201)))

(declare-fun res!1061343 () Bool)

(assert (=> b!1548960 (=> (not res!1061343) (not e!862201))))

(assert (=> b!1548960 (= res!1061343 (bvslt from!762 (size!50441 _keys!618)))))

(declare-fun lt!667581 () ListLongMap!22231)

(assert (=> b!1548960 (= lt!667581 e!862198)))

(declare-fun lt!667585 () Bool)

(assert (=> b!1548960 (= c!142289 (and (not lt!667585) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548960 (= lt!667585 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58837 () Bool)

(declare-fun tp!111690 () Bool)

(assert (=> mapNonEmpty!58837 (= mapRes!58837 (and tp!111690 e!862202))))

(declare-fun mapRest!58837 () (Array (_ BitVec 32) ValueCell!18134))

(declare-fun mapKey!58837 () (_ BitVec 32))

(declare-fun mapValue!58837 () ValueCell!18134)

(assert (=> mapNonEmpty!58837 (= (arr!49890 _values!470) (store mapRest!58837 mapKey!58837 mapValue!58837))))

(declare-fun b!1548961 () Bool)

(assert (=> b!1548961 (= e!862204 call!70327)))

(declare-fun b!1548962 () Bool)

(declare-fun res!1061349 () Bool)

(assert (=> b!1548962 (=> (not res!1061349) (not e!862206))))

(assert (=> b!1548962 (= res!1061349 (and (= (size!50440 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50441 _keys!618) (size!50440 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548963 () Bool)

(declare-fun res!1061348 () Bool)

(assert (=> b!1548963 (=> (not res!1061348) (not e!862201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548963 (= res!1061348 (validKeyInArray!0 (select (arr!49891 _keys!618) from!762)))))

(declare-fun b!1548964 () Bool)

(assert (=> b!1548964 (= e!862198 e!862200)))

(assert (=> b!1548964 (= c!142288 (and (not lt!667585) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1061346 () Bool)

(assert (=> start!132100 (=> (not res!1061346) (not e!862206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132100 (= res!1061346 (validMask!0 mask!926))))

(assert (=> start!132100 e!862206))

(declare-fun array_inv!38789 (array!103378) Bool)

(assert (=> start!132100 (array_inv!38789 _keys!618)))

(assert (=> start!132100 tp_is_empty!38089))

(assert (=> start!132100 true))

(assert (=> start!132100 tp!111691))

(declare-fun e!862203 () Bool)

(declare-fun array_inv!38790 (array!103376) Bool)

(assert (=> start!132100 (and (array_inv!38790 _values!470) e!862203)))

(declare-fun b!1548954 () Bool)

(declare-fun res!1061344 () Bool)

(assert (=> b!1548954 (=> (not res!1061344) (not e!862206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103378 (_ BitVec 32)) Bool)

(assert (=> b!1548954 (= res!1061344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1548965 () Bool)

(assert (=> b!1548965 (= e!862203 (and e!862205 mapRes!58837))))

(declare-fun condMapEmpty!58837 () Bool)

(declare-fun mapDefault!58837 () ValueCell!18134)

