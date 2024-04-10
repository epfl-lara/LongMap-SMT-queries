; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100812 () Bool)

(assert start!100812)

(declare-fun b_free!25951 () Bool)

(declare-fun b_next!25951 () Bool)

(assert (=> start!100812 (= b_free!25951 (not b_next!25951))))

(declare-fun tp!90858 () Bool)

(declare-fun b_and!42903 () Bool)

(assert (=> start!100812 (= tp!90858 b_and!42903)))

(declare-datatypes ((V!46001 0))(
  ( (V!46002 (val!15384 Int)) )
))
(declare-fun zeroValue!944 () V!46001)

(declare-datatypes ((array!78093 0))(
  ( (array!78094 (arr!37686 (Array (_ BitVec 32) (_ BitVec 64))) (size!38222 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78093)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19740 0))(
  ( (tuple2!19741 (_1!9881 (_ BitVec 64)) (_2!9881 V!46001)) )
))
(declare-datatypes ((List!26542 0))(
  ( (Nil!26539) (Cons!26538 (h!27747 tuple2!19740) (t!39473 List!26542)) )
))
(declare-datatypes ((ListLongMap!17709 0))(
  ( (ListLongMap!17710 (toList!8870 List!26542)) )
))
(declare-fun call!58765 () ListLongMap!17709)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!58758 () Bool)

(declare-datatypes ((ValueCell!14618 0))(
  ( (ValueCellFull!14618 (v!18029 V!46001)) (EmptyCell!14618) )
))
(declare-datatypes ((array!78095 0))(
  ( (array!78096 (arr!37687 (Array (_ BitVec 32) ValueCell!14618)) (size!38223 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78095)

(declare-fun minValue!944 () V!46001)

(declare-fun getCurrentListMapNoExtraKeys!5304 (array!78093 array!78095 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 32) Int) ListLongMap!17709)

(assert (=> bm!58758 (= call!58765 (getCurrentListMapNoExtraKeys!5304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547404 () array!78095)

(declare-fun lt!547411 () array!78093)

(declare-fun call!58761 () ListLongMap!17709)

(declare-fun bm!58759 () Bool)

(assert (=> bm!58759 (= call!58761 (getCurrentListMapNoExtraKeys!5304 lt!547411 lt!547404 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206635 () Bool)

(declare-datatypes ((Unit!39999 0))(
  ( (Unit!40000) )
))
(declare-fun e!685250 () Unit!39999)

(declare-fun e!685238 () Unit!39999)

(assert (=> b!1206635 (= e!685250 e!685238)))

(declare-fun c!118506 () Bool)

(declare-fun lt!547410 () Bool)

(assert (=> b!1206635 (= c!118506 (and (not lt!547410) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206636 () Bool)

(declare-fun res!802402 () Bool)

(declare-fun e!685249 () Bool)

(assert (=> b!1206636 (=> (not res!802402) (not e!685249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78093 (_ BitVec 32)) Bool)

(assert (=> b!1206636 (= res!802402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206637 () Bool)

(declare-fun e!685252 () Unit!39999)

(declare-fun Unit!40001 () Unit!39999)

(assert (=> b!1206637 (= e!685252 Unit!40001)))

(declare-fun e!685242 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1206638 () Bool)

(declare-fun -!1827 (ListLongMap!17709 (_ BitVec 64)) ListLongMap!17709)

(assert (=> b!1206638 (= e!685242 (= call!58761 (-!1827 call!58765 k!934)))))

(declare-fun bm!58760 () Bool)

(declare-fun call!58763 () Bool)

(declare-fun call!58766 () Bool)

(assert (=> bm!58760 (= call!58763 call!58766)))

(declare-fun b!1206639 () Bool)

(declare-fun e!685246 () Bool)

(assert (=> b!1206639 (= e!685246 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547410) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206640 () Bool)

(declare-fun e!685247 () Bool)

(declare-fun tp_is_empty!30655 () Bool)

(assert (=> b!1206640 (= e!685247 tp_is_empty!30655)))

(declare-fun e!685248 () Bool)

(declare-fun b!1206641 () Bool)

(declare-fun arrayContainsKey!0 (array!78093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206641 (= e!685248 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206642 () Bool)

(assert (=> b!1206642 (= e!685242 (= call!58761 call!58765))))

(declare-fun bm!58761 () Bool)

(declare-fun call!58764 () Unit!39999)

(declare-fun lt!547412 () ListLongMap!17709)

(declare-fun c!118508 () Bool)

(declare-fun addStillContains!1020 (ListLongMap!17709 (_ BitVec 64) V!46001 (_ BitVec 64)) Unit!39999)

(assert (=> bm!58761 (= call!58764 (addStillContains!1020 lt!547412 (ite (or c!118508 c!118506) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118508 c!118506) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1206643 () Bool)

(declare-fun res!802412 () Bool)

(assert (=> b!1206643 (=> (not res!802412) (not e!685249))))

(assert (=> b!1206643 (= res!802412 (and (= (size!38223 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38222 _keys!1208) (size!38223 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206644 () Bool)

(declare-fun res!802405 () Bool)

(assert (=> b!1206644 (=> (not res!802405) (not e!685249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206644 (= res!802405 (validKeyInArray!0 k!934))))

(declare-fun b!1206645 () Bool)

(assert (=> b!1206645 call!58763))

(declare-fun lt!547415 () Unit!39999)

(declare-fun call!58767 () Unit!39999)

(assert (=> b!1206645 (= lt!547415 call!58767)))

(assert (=> b!1206645 (= e!685238 lt!547415)))

(declare-fun b!1206646 () Bool)

(declare-fun res!802407 () Bool)

(assert (=> b!1206646 (=> (not res!802407) (not e!685249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206646 (= res!802407 (validMask!0 mask!1564))))

(declare-fun call!58768 () ListLongMap!17709)

(declare-fun bm!58762 () Bool)

(declare-fun lt!547409 () ListLongMap!17709)

(declare-fun +!3991 (ListLongMap!17709 tuple2!19740) ListLongMap!17709)

(assert (=> bm!58762 (= call!58768 (+!3991 (ite c!118508 lt!547409 lt!547412) (ite c!118508 (tuple2!19741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118506 (tuple2!19741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1206647 () Bool)

(declare-fun c!118507 () Bool)

(assert (=> b!1206647 (= c!118507 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547410))))

(assert (=> b!1206647 (= e!685238 e!685252)))

(declare-fun b!1206648 () Bool)

(declare-fun e!685245 () Bool)

(assert (=> b!1206648 (= e!685245 true)))

(declare-datatypes ((List!26543 0))(
  ( (Nil!26540) (Cons!26539 (h!27748 (_ BitVec 64)) (t!39474 List!26543)) )
))
(declare-fun arrayNoDuplicates!0 (array!78093 (_ BitVec 32) List!26543) Bool)

(assert (=> b!1206648 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26540)))

(declare-fun lt!547407 () Unit!39999)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78093 (_ BitVec 32) (_ BitVec 32)) Unit!39999)

(assert (=> b!1206648 (= lt!547407 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1206648 e!685248))

(declare-fun res!802413 () Bool)

(assert (=> b!1206648 (=> (not res!802413) (not e!685248))))

(assert (=> b!1206648 (= res!802413 e!685246)))

(declare-fun c!118505 () Bool)

(assert (=> b!1206648 (= c!118505 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547414 () Unit!39999)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!574 (array!78093 array!78095 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 64) (_ BitVec 32) Int) Unit!39999)

(assert (=> b!1206648 (= lt!547414 (lemmaListMapContainsThenArrayContainsFrom!574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547402 () Unit!39999)

(assert (=> b!1206648 (= lt!547402 e!685250)))

(assert (=> b!1206648 (= c!118508 (and (not lt!547410) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206648 (= lt!547410 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1206649 () Bool)

(declare-fun res!802399 () Bool)

(assert (=> b!1206649 (=> (not res!802399) (not e!685249))))

(assert (=> b!1206649 (= res!802399 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26540))))

(declare-fun b!1206650 () Bool)

(declare-fun e!685243 () Bool)

(declare-fun e!685253 () Bool)

(declare-fun mapRes!47841 () Bool)

(assert (=> b!1206650 (= e!685243 (and e!685253 mapRes!47841))))

(declare-fun condMapEmpty!47841 () Bool)

(declare-fun mapDefault!47841 () ValueCell!14618)

