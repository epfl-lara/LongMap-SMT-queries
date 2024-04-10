; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97272 () Bool)

(assert start!97272)

(declare-fun b_free!23243 () Bool)

(declare-fun b_next!23243 () Bool)

(assert (=> start!97272 (= b_free!23243 (not b_next!23243))))

(declare-fun tp!82028 () Bool)

(declare-fun b_and!37317 () Bool)

(assert (=> start!97272 (= tp!82028 b_and!37317)))

(declare-fun b!1107445 () Bool)

(declare-fun res!739078 () Bool)

(declare-fun e!631855 () Bool)

(assert (=> b!1107445 (=> (not res!739078) (not e!631855))))

(declare-datatypes ((array!71923 0))(
  ( (array!71924 (arr!34614 (Array (_ BitVec 32) (_ BitVec 64))) (size!35150 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71923)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71923 (_ BitVec 32)) Bool)

(assert (=> b!1107445 (= res!739078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107446 () Bool)

(declare-fun e!631857 () Bool)

(assert (=> b!1107446 (= e!631857 true)))

(declare-fun e!631854 () Bool)

(assert (=> b!1107446 e!631854))

(declare-fun c!109044 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107446 (= c!109044 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41797 0))(
  ( (V!41798 (val!13808 Int)) )
))
(declare-fun zeroValue!944 () V!41797)

(declare-datatypes ((Unit!36346 0))(
  ( (Unit!36347) )
))
(declare-fun lt!495631 () Unit!36346)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13042 0))(
  ( (ValueCellFull!13042 (v!16441 V!41797)) (EmptyCell!13042) )
))
(declare-datatypes ((array!71925 0))(
  ( (array!71926 (arr!34615 (Array (_ BitVec 32) ValueCell!13042)) (size!35151 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71925)

(declare-fun minValue!944 () V!41797)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!247 (array!71923 array!71925 (_ BitVec 32) (_ BitVec 32) V!41797 V!41797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36346)

(assert (=> b!1107446 (= lt!495631 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!247 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107447 () Bool)

(declare-fun e!631852 () Bool)

(assert (=> b!1107447 (= e!631855 e!631852)))

(declare-fun res!739082 () Bool)

(assert (=> b!1107447 (=> (not res!739082) (not e!631852))))

(declare-fun lt!495630 () array!71923)

(assert (=> b!1107447 (= res!739082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495630 mask!1564))))

(assert (=> b!1107447 (= lt!495630 (array!71924 (store (arr!34614 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35150 _keys!1208)))))

(declare-fun bm!46422 () Bool)

(declare-datatypes ((tuple2!17440 0))(
  ( (tuple2!17441 (_1!8731 (_ BitVec 64)) (_2!8731 V!41797)) )
))
(declare-datatypes ((List!24125 0))(
  ( (Nil!24122) (Cons!24121 (h!25330 tuple2!17440) (t!34414 List!24125)) )
))
(declare-datatypes ((ListLongMap!15409 0))(
  ( (ListLongMap!15410 (toList!7720 List!24125)) )
))
(declare-fun call!46425 () ListLongMap!15409)

(declare-fun getCurrentListMapNoExtraKeys!4218 (array!71923 array!71925 (_ BitVec 32) (_ BitVec 32) V!41797 V!41797 (_ BitVec 32) Int) ListLongMap!15409)

(declare-fun dynLambda!2351 (Int (_ BitVec 64)) V!41797)

(assert (=> bm!46422 (= call!46425 (getCurrentListMapNoExtraKeys!4218 lt!495630 (array!71926 (store (arr!34615 _values!996) i!673 (ValueCellFull!13042 (dynLambda!2351 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35151 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!46426 () ListLongMap!15409)

(declare-fun b!1107449 () Bool)

(declare-fun -!1001 (ListLongMap!15409 (_ BitVec 64)) ListLongMap!15409)

(assert (=> b!1107449 (= e!631854 (= call!46425 (-!1001 call!46426 k!934)))))

(declare-fun b!1107450 () Bool)

(declare-fun res!739080 () Bool)

(assert (=> b!1107450 (=> (not res!739080) (not e!631855))))

(assert (=> b!1107450 (= res!739080 (= (select (arr!34614 _keys!1208) i!673) k!934))))

(declare-fun b!1107451 () Bool)

(declare-fun res!739079 () Bool)

(assert (=> b!1107451 (=> (not res!739079) (not e!631855))))

(assert (=> b!1107451 (= res!739079 (and (= (size!35151 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35150 _keys!1208) (size!35151 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107452 () Bool)

(declare-fun e!631850 () Bool)

(declare-fun tp_is_empty!27503 () Bool)

(assert (=> b!1107452 (= e!631850 tp_is_empty!27503)))

(declare-fun b!1107453 () Bool)

(declare-fun res!739076 () Bool)

(assert (=> b!1107453 (=> (not res!739076) (not e!631855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107453 (= res!739076 (validMask!0 mask!1564))))

(declare-fun res!739075 () Bool)

(assert (=> start!97272 (=> (not res!739075) (not e!631855))))

(assert (=> start!97272 (= res!739075 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35150 _keys!1208))))))

(assert (=> start!97272 e!631855))

(assert (=> start!97272 tp_is_empty!27503))

(declare-fun array_inv!26640 (array!71923) Bool)

(assert (=> start!97272 (array_inv!26640 _keys!1208)))

(assert (=> start!97272 true))

(assert (=> start!97272 tp!82028))

(declare-fun e!631853 () Bool)

(declare-fun array_inv!26641 (array!71925) Bool)

(assert (=> start!97272 (and (array_inv!26641 _values!996) e!631853)))

(declare-fun b!1107448 () Bool)

(declare-fun res!739083 () Bool)

(assert (=> b!1107448 (=> (not res!739083) (not e!631855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107448 (= res!739083 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43072 () Bool)

(declare-fun mapRes!43072 () Bool)

(declare-fun tp!82027 () Bool)

(assert (=> mapNonEmpty!43072 (= mapRes!43072 (and tp!82027 e!631850))))

(declare-fun mapValue!43072 () ValueCell!13042)

(declare-fun mapKey!43072 () (_ BitVec 32))

(declare-fun mapRest!43072 () (Array (_ BitVec 32) ValueCell!13042))

(assert (=> mapNonEmpty!43072 (= (arr!34615 _values!996) (store mapRest!43072 mapKey!43072 mapValue!43072))))

(declare-fun mapIsEmpty!43072 () Bool)

(assert (=> mapIsEmpty!43072 mapRes!43072))

(declare-fun b!1107454 () Bool)

(declare-fun res!739074 () Bool)

(assert (=> b!1107454 (=> (not res!739074) (not e!631852))))

(declare-datatypes ((List!24126 0))(
  ( (Nil!24123) (Cons!24122 (h!25331 (_ BitVec 64)) (t!34415 List!24126)) )
))
(declare-fun arrayNoDuplicates!0 (array!71923 (_ BitVec 32) List!24126) Bool)

(assert (=> b!1107454 (= res!739074 (arrayNoDuplicates!0 lt!495630 #b00000000000000000000000000000000 Nil!24123))))

(declare-fun b!1107455 () Bool)

(declare-fun e!631851 () Bool)

(assert (=> b!1107455 (= e!631853 (and e!631851 mapRes!43072))))

(declare-fun condMapEmpty!43072 () Bool)

(declare-fun mapDefault!43072 () ValueCell!13042)

