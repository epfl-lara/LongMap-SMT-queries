; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100556 () Bool)

(assert start!100556)

(declare-fun b_free!25879 () Bool)

(declare-fun b_next!25879 () Bool)

(assert (=> start!100556 (= b_free!25879 (not b_next!25879))))

(declare-fun tp!90627 () Bool)

(declare-fun b_and!42645 () Bool)

(assert (=> start!100556 (= tp!90627 b_and!42645)))

(declare-fun bm!57745 () Bool)

(declare-fun call!57750 () Bool)

(declare-fun call!57749 () Bool)

(assert (=> bm!57745 (= call!57750 call!57749)))

(declare-fun b!1202446 () Bool)

(declare-datatypes ((V!45905 0))(
  ( (V!45906 (val!15348 Int)) )
))
(declare-datatypes ((tuple2!19668 0))(
  ( (tuple2!19669 (_1!9845 (_ BitVec 64)) (_2!9845 V!45905)) )
))
(declare-datatypes ((List!26480 0))(
  ( (Nil!26477) (Cons!26476 (h!27685 tuple2!19668) (t!39339 List!26480)) )
))
(declare-datatypes ((ListLongMap!17637 0))(
  ( (ListLongMap!17638 (toList!8834 List!26480)) )
))
(declare-fun call!57753 () ListLongMap!17637)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!57754 () ListLongMap!17637)

(declare-fun e!682817 () Bool)

(declare-fun -!1802 (ListLongMap!17637 (_ BitVec 64)) ListLongMap!17637)

(assert (=> b!1202446 (= e!682817 (= call!57753 (-!1802 call!57754 k!934)))))

(declare-fun b!1202447 () Bool)

(declare-datatypes ((Unit!39863 0))(
  ( (Unit!39864) )
))
(declare-fun e!682811 () Unit!39863)

(declare-fun lt!545007 () Unit!39863)

(assert (=> b!1202447 (= e!682811 lt!545007)))

(declare-fun zeroValue!944 () V!45905)

(declare-fun lt!545006 () ListLongMap!17637)

(declare-fun lt!545010 () Unit!39863)

(declare-fun addStillContains!990 (ListLongMap!17637 (_ BitVec 64) V!45905 (_ BitVec 64)) Unit!39863)

(assert (=> b!1202447 (= lt!545010 (addStillContains!990 lt!545006 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!545003 () ListLongMap!17637)

(declare-fun call!57752 () ListLongMap!17637)

(assert (=> b!1202447 (= lt!545003 call!57752)))

(assert (=> b!1202447 call!57749))

(declare-fun call!57755 () Unit!39863)

(assert (=> b!1202447 (= lt!545007 call!57755)))

(declare-fun minValue!944 () V!45905)

(declare-fun contains!6889 (ListLongMap!17637 (_ BitVec 64)) Bool)

(declare-fun +!3962 (ListLongMap!17637 tuple2!19668) ListLongMap!17637)

(assert (=> b!1202447 (contains!6889 (+!3962 lt!545003 (tuple2!19669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun res!800322 () Bool)

(declare-fun e!682818 () Bool)

(assert (=> start!100556 (=> (not res!800322) (not e!682818))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77939 0))(
  ( (array!77940 (arr!37614 (Array (_ BitVec 32) (_ BitVec 64))) (size!38150 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77939)

(assert (=> start!100556 (= res!800322 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38150 _keys!1208))))))

(assert (=> start!100556 e!682818))

(declare-fun tp_is_empty!30583 () Bool)

(assert (=> start!100556 tp_is_empty!30583))

(declare-fun array_inv!28660 (array!77939) Bool)

(assert (=> start!100556 (array_inv!28660 _keys!1208)))

(assert (=> start!100556 true))

(assert (=> start!100556 tp!90627))

(declare-datatypes ((ValueCell!14582 0))(
  ( (ValueCellFull!14582 (v!17986 V!45905)) (EmptyCell!14582) )
))
(declare-datatypes ((array!77941 0))(
  ( (array!77942 (arr!37615 (Array (_ BitVec 32) ValueCell!14582)) (size!38151 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77941)

(declare-fun e!682810 () Bool)

(declare-fun array_inv!28661 (array!77941) Bool)

(assert (=> start!100556 (and (array_inv!28661 _values!996) e!682810)))

(declare-fun b!1202448 () Bool)

(declare-fun e!682813 () Bool)

(assert (=> b!1202448 (= e!682813 tp_is_empty!30583)))

(declare-fun b!1202449 () Bool)

(declare-fun e!682812 () Bool)

(assert (=> b!1202449 (= e!682812 tp_is_empty!30583)))

(declare-fun b!1202450 () Bool)

(declare-fun e!682814 () Bool)

(declare-fun e!682806 () Bool)

(assert (=> b!1202450 (= e!682814 e!682806)))

(declare-fun res!800331 () Bool)

(assert (=> b!1202450 (=> res!800331 e!682806)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202450 (= res!800331 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545002 () ListLongMap!17637)

(declare-fun lt!545004 () array!77939)

(declare-fun lt!545005 () array!77941)

(declare-fun getCurrentListMapNoExtraKeys!5270 (array!77939 array!77941 (_ BitVec 32) (_ BitVec 32) V!45905 V!45905 (_ BitVec 32) Int) ListLongMap!17637)

(assert (=> b!1202450 (= lt!545002 (getCurrentListMapNoExtraKeys!5270 lt!545004 lt!545005 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3185 (Int (_ BitVec 64)) V!45905)

(assert (=> b!1202450 (= lt!545005 (array!77942 (store (arr!37615 _values!996) i!673 (ValueCellFull!14582 (dynLambda!3185 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38151 _values!996)))))

(declare-fun lt!545009 () ListLongMap!17637)

(assert (=> b!1202450 (= lt!545009 (getCurrentListMapNoExtraKeys!5270 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47717 () Bool)

(declare-fun mapRes!47717 () Bool)

(assert (=> mapIsEmpty!47717 mapRes!47717))

(declare-fun mapNonEmpty!47717 () Bool)

(declare-fun tp!90626 () Bool)

(assert (=> mapNonEmpty!47717 (= mapRes!47717 (and tp!90626 e!682812))))

(declare-fun mapRest!47717 () (Array (_ BitVec 32) ValueCell!14582))

(declare-fun mapValue!47717 () ValueCell!14582)

(declare-fun mapKey!47717 () (_ BitVec 32))

(assert (=> mapNonEmpty!47717 (= (arr!37615 _values!996) (store mapRest!47717 mapKey!47717 mapValue!47717))))

(declare-fun bm!57746 () Bool)

(assert (=> bm!57746 (= call!57753 (getCurrentListMapNoExtraKeys!5270 lt!545004 lt!545005 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202451 () Bool)

(assert (=> b!1202451 (= e!682810 (and e!682813 mapRes!47717))))

(declare-fun condMapEmpty!47717 () Bool)

(declare-fun mapDefault!47717 () ValueCell!14582)

