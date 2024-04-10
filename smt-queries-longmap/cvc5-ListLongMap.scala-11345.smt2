; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131974 () Bool)

(assert start!131974)

(declare-fun b_free!31687 () Bool)

(declare-fun b_next!31687 () Bool)

(assert (=> start!131974 (= b_free!31687 (not b_next!31687))))

(declare-fun tp!111313 () Bool)

(declare-fun b_and!51097 () Bool)

(assert (=> start!131974 (= tp!111313 b_and!51097)))

(declare-fun b!1545929 () Bool)

(declare-fun c!141722 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666439 () Bool)

(assert (=> b!1545929 (= c!141722 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666439))))

(declare-datatypes ((V!59061 0))(
  ( (V!59062 (val!19059 Int)) )
))
(declare-datatypes ((tuple2!24500 0))(
  ( (tuple2!24501 (_1!12261 (_ BitVec 64)) (_2!12261 V!59061)) )
))
(declare-datatypes ((List!36009 0))(
  ( (Nil!36006) (Cons!36005 (h!37450 tuple2!24500) (t!50703 List!36009)) )
))
(declare-datatypes ((ListLongMap!22109 0))(
  ( (ListLongMap!22110 (toList!11070 List!36009)) )
))
(declare-fun e!860498 () ListLongMap!22109)

(declare-fun e!860499 () ListLongMap!22109)

(assert (=> b!1545929 (= e!860498 e!860499)))

(declare-fun b!1545930 () Bool)

(declare-fun call!69383 () ListLongMap!22109)

(assert (=> b!1545930 (= e!860498 call!69383)))

(declare-fun b!1545931 () Bool)

(declare-fun res!1060022 () Bool)

(declare-fun e!860502 () Bool)

(assert (=> b!1545931 (=> (not res!1060022) (not e!860502))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103132 0))(
  ( (array!103133 (arr!49768 (Array (_ BitVec 32) (_ BitVec 64))) (size!50318 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103132)

(assert (=> b!1545931 (= res!1060022 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50318 _keys!618))))))

(declare-fun b!1545932 () Bool)

(declare-fun call!69381 () ListLongMap!22109)

(assert (=> b!1545932 (= e!860499 call!69381)))

(declare-fun b!1545933 () Bool)

(assert (=> b!1545933 (= e!860499 call!69383)))

(declare-fun bm!69378 () Bool)

(declare-fun call!69382 () ListLongMap!22109)

(assert (=> bm!69378 (= call!69383 call!69382)))

(declare-fun b!1545934 () Bool)

(declare-fun res!1060021 () Bool)

(assert (=> b!1545934 (=> (not res!1060021) (not e!860502))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103132 (_ BitVec 32)) Bool)

(assert (=> b!1545934 (= res!1060021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545935 () Bool)

(declare-fun e!860504 () Bool)

(assert (=> b!1545935 (= e!860502 e!860504)))

(declare-fun res!1060025 () Bool)

(assert (=> b!1545935 (=> (not res!1060025) (not e!860504))))

(assert (=> b!1545935 (= res!1060025 (bvslt from!762 (size!50318 _keys!618)))))

(declare-fun lt!666440 () ListLongMap!22109)

(declare-fun e!860500 () ListLongMap!22109)

(assert (=> b!1545935 (= lt!666440 e!860500)))

(declare-fun c!141720 () Bool)

(assert (=> b!1545935 (= c!141720 (and (not lt!666439) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545935 (= lt!666439 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545936 () Bool)

(declare-fun e!860497 () Bool)

(declare-fun tp_is_empty!37963 () Bool)

(assert (=> b!1545936 (= e!860497 tp_is_empty!37963)))

(declare-fun mapIsEmpty!58648 () Bool)

(declare-fun mapRes!58648 () Bool)

(assert (=> mapIsEmpty!58648 mapRes!58648))

(declare-fun b!1545937 () Bool)

(declare-fun minValue!436 () V!59061)

(declare-fun +!4905 (ListLongMap!22109 tuple2!24500) ListLongMap!22109)

(assert (=> b!1545937 (= e!860500 (+!4905 call!69382 (tuple2!24501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69379 () Bool)

(declare-fun call!69380 () ListLongMap!22109)

(assert (=> bm!69379 (= call!69381 call!69380)))

(declare-fun b!1545938 () Bool)

(assert (=> b!1545938 (= e!860500 e!860498)))

(declare-fun c!141721 () Bool)

(assert (=> b!1545938 (= c!141721 (and (not lt!666439) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545939 () Bool)

(declare-fun res!1060020 () Bool)

(assert (=> b!1545939 (=> (not res!1060020) (not e!860502))))

(declare-datatypes ((ValueCell!18071 0))(
  ( (ValueCellFull!18071 (v!21860 V!59061)) (EmptyCell!18071) )
))
(declare-datatypes ((array!103134 0))(
  ( (array!103135 (arr!49769 (Array (_ BitVec 32) ValueCell!18071)) (size!50319 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103134)

(assert (=> b!1545939 (= res!1060020 (and (= (size!50319 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50318 _keys!618) (size!50319 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!59061)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!69380 () Bool)

(declare-fun call!69384 () ListLongMap!22109)

(declare-fun getCurrentListMapNoExtraKeys!6537 (array!103132 array!103134 (_ BitVec 32) (_ BitVec 32) V!59061 V!59061 (_ BitVec 32) Int) ListLongMap!22109)

(assert (=> bm!69380 (= call!69384 (getCurrentListMapNoExtraKeys!6537 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545940 () Bool)

(assert (=> b!1545940 (= e!860504 (not true))))

(declare-fun lt!666437 () ListLongMap!22109)

(declare-fun contains!10039 (ListLongMap!22109 (_ BitVec 64)) Bool)

(assert (=> b!1545940 (contains!10039 (+!4905 lt!666437 (tuple2!24501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49768 _keys!618) from!762))))

(declare-datatypes ((Unit!51514 0))(
  ( (Unit!51515) )
))
(declare-fun lt!666438 () Unit!51514)

(declare-fun addStillContains!1227 (ListLongMap!22109 (_ BitVec 64) V!59061 (_ BitVec 64)) Unit!51514)

(assert (=> b!1545940 (= lt!666438 (addStillContains!1227 lt!666437 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49768 _keys!618) from!762)))))

(assert (=> b!1545940 (= lt!666437 (getCurrentListMapNoExtraKeys!6537 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545941 () Bool)

(declare-fun e!860503 () Bool)

(declare-fun e!860501 () Bool)

(assert (=> b!1545941 (= e!860503 (and e!860501 mapRes!58648))))

(declare-fun condMapEmpty!58648 () Bool)

(declare-fun mapDefault!58648 () ValueCell!18071)

