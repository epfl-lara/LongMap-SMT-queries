; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98586 () Bool)

(assert start!98586)

(declare-fun b_free!24191 () Bool)

(declare-fun b_next!24191 () Bool)

(assert (=> start!98586 (= b_free!24191 (not b_next!24191))))

(declare-fun tp!85284 () Bool)

(declare-fun b_and!39231 () Bool)

(assert (=> start!98586 (= tp!85284 b_and!39231)))

(declare-fun b!1143808 () Bool)

(declare-fun e!650671 () Bool)

(declare-fun e!650679 () Bool)

(assert (=> b!1143808 (= e!650671 e!650679)))

(declare-fun res!761982 () Bool)

(assert (=> b!1143808 (=> res!761982 e!650679)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143808 (= res!761982 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43421 0))(
  ( (V!43422 (val!14417 Int)) )
))
(declare-fun zeroValue!944 () V!43421)

(declare-datatypes ((ValueCell!13651 0))(
  ( (ValueCellFull!13651 (v!17054 V!43421)) (EmptyCell!13651) )
))
(declare-datatypes ((array!74295 0))(
  ( (array!74296 (arr!35798 (Array (_ BitVec 32) ValueCell!13651)) (size!36334 (_ BitVec 32))) )
))
(declare-fun lt!510214 () array!74295)

(declare-datatypes ((tuple2!18254 0))(
  ( (tuple2!18255 (_1!9138 (_ BitVec 64)) (_2!9138 V!43421)) )
))
(declare-datatypes ((List!25007 0))(
  ( (Nil!25004) (Cons!25003 (h!26212 tuple2!18254) (t!36190 List!25007)) )
))
(declare-datatypes ((ListLongMap!16223 0))(
  ( (ListLongMap!16224 (toList!8127 List!25007)) )
))
(declare-fun lt!510223 () ListLongMap!16223)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!74297 0))(
  ( (array!74298 (arr!35799 (Array (_ BitVec 32) (_ BitVec 64))) (size!36335 (_ BitVec 32))) )
))
(declare-fun lt!510219 () array!74297)

(declare-fun minValue!944 () V!43421)

(declare-fun getCurrentListMapNoExtraKeys!4606 (array!74297 array!74295 (_ BitVec 32) (_ BitVec 32) V!43421 V!43421 (_ BitVec 32) Int) ListLongMap!16223)

(assert (=> b!1143808 (= lt!510223 (getCurrentListMapNoExtraKeys!4606 lt!510219 lt!510214 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74295)

(declare-fun lt!510217 () V!43421)

(assert (=> b!1143808 (= lt!510214 (array!74296 (store (arr!35798 _values!996) i!673 (ValueCellFull!13651 lt!510217)) (size!36334 _values!996)))))

(declare-fun dynLambda!2644 (Int (_ BitVec 64)) V!43421)

(assert (=> b!1143808 (= lt!510217 (dynLambda!2644 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74297)

(declare-fun lt!510220 () ListLongMap!16223)

(assert (=> b!1143808 (= lt!510220 (getCurrentListMapNoExtraKeys!4606 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!51831 () Bool)

(declare-fun c!112580 () Bool)

(declare-fun call!51834 () ListLongMap!16223)

(assert (=> bm!51831 (= call!51834 (getCurrentListMapNoExtraKeys!4606 (ite c!112580 lt!510219 _keys!1208) (ite c!112580 lt!510214 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143809 () Bool)

(declare-fun e!650669 () Bool)

(declare-fun e!650674 () Bool)

(declare-fun mapRes!44906 () Bool)

(assert (=> b!1143809 (= e!650669 (and e!650674 mapRes!44906))))

(declare-fun condMapEmpty!44906 () Bool)

(declare-fun mapDefault!44906 () ValueCell!13651)

