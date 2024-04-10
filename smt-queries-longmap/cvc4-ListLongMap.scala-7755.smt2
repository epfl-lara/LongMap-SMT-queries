; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97278 () Bool)

(assert start!97278)

(declare-fun b_free!23249 () Bool)

(declare-fun b_next!23249 () Bool)

(assert (=> start!97278 (= b_free!23249 (not b_next!23249))))

(declare-fun tp!82045 () Bool)

(declare-fun b_and!37329 () Bool)

(assert (=> start!97278 (= tp!82045 b_and!37329)))

(declare-fun b!1107595 () Bool)

(declare-fun res!739177 () Bool)

(declare-fun e!631927 () Bool)

(assert (=> b!1107595 (=> (not res!739177) (not e!631927))))

(declare-datatypes ((array!71935 0))(
  ( (array!71936 (arr!34620 (Array (_ BitVec 32) (_ BitVec 64))) (size!35156 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71935)

(declare-datatypes ((List!24130 0))(
  ( (Nil!24127) (Cons!24126 (h!25335 (_ BitVec 64)) (t!34425 List!24130)) )
))
(declare-fun arrayNoDuplicates!0 (array!71935 (_ BitVec 32) List!24130) Bool)

(assert (=> b!1107595 (= res!739177 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24127))))

(declare-fun b!1107596 () Bool)

(declare-fun res!739182 () Bool)

(assert (=> b!1107596 (=> (not res!739182) (not e!631927))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1107596 (= res!739182 (= (select (arr!34620 _keys!1208) i!673) k!934))))

(declare-fun b!1107597 () Bool)

(declare-fun res!739176 () Bool)

(assert (=> b!1107597 (=> (not res!739176) (not e!631927))))

(assert (=> b!1107597 (= res!739176 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35156 _keys!1208))))))

(declare-fun b!1107598 () Bool)

(declare-fun e!631923 () Bool)

(assert (=> b!1107598 (= e!631927 e!631923)))

(declare-fun res!739175 () Bool)

(assert (=> b!1107598 (=> (not res!739175) (not e!631923))))

(declare-fun lt!495657 () array!71935)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71935 (_ BitVec 32)) Bool)

(assert (=> b!1107598 (= res!739175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495657 mask!1564))))

(assert (=> b!1107598 (= lt!495657 (array!71936 (store (arr!34620 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35156 _keys!1208)))))

(declare-fun res!739180 () Bool)

(assert (=> start!97278 (=> (not res!739180) (not e!631927))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97278 (= res!739180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35156 _keys!1208))))))

(assert (=> start!97278 e!631927))

(declare-fun tp_is_empty!27509 () Bool)

(assert (=> start!97278 tp_is_empty!27509))

(declare-fun array_inv!26644 (array!71935) Bool)

(assert (=> start!97278 (array_inv!26644 _keys!1208)))

(assert (=> start!97278 true))

(assert (=> start!97278 tp!82045))

(declare-datatypes ((V!41805 0))(
  ( (V!41806 (val!13811 Int)) )
))
(declare-datatypes ((ValueCell!13045 0))(
  ( (ValueCellFull!13045 (v!16444 V!41805)) (EmptyCell!13045) )
))
(declare-datatypes ((array!71937 0))(
  ( (array!71938 (arr!34621 (Array (_ BitVec 32) ValueCell!13045)) (size!35157 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71937)

(declare-fun e!631924 () Bool)

(declare-fun array_inv!26645 (array!71937) Bool)

(assert (=> start!97278 (and (array_inv!26645 _values!996) e!631924)))

(declare-fun b!1107599 () Bool)

(declare-fun res!739173 () Bool)

(assert (=> b!1107599 (=> (not res!739173) (not e!631927))))

(assert (=> b!1107599 (= res!739173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107600 () Bool)

(declare-fun e!631929 () Bool)

(assert (=> b!1107600 (= e!631929 tp_is_empty!27509)))

(declare-fun b!1107601 () Bool)

(declare-fun res!739181 () Bool)

(assert (=> b!1107601 (=> (not res!739181) (not e!631927))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107601 (= res!739181 (and (= (size!35157 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35156 _keys!1208) (size!35157 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107602 () Bool)

(declare-fun e!631922 () Bool)

(assert (=> b!1107602 (= e!631923 (not e!631922))))

(declare-fun res!739179 () Bool)

(assert (=> b!1107602 (=> res!739179 e!631922)))

(assert (=> b!1107602 (= res!739179 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35156 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107602 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36352 0))(
  ( (Unit!36353) )
))
(declare-fun lt!495658 () Unit!36352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71935 (_ BitVec 64) (_ BitVec 32)) Unit!36352)

(assert (=> b!1107602 (= lt!495658 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun zeroValue!944 () V!41805)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46440 () Bool)

(declare-datatypes ((tuple2!17446 0))(
  ( (tuple2!17447 (_1!8734 (_ BitVec 64)) (_2!8734 V!41805)) )
))
(declare-datatypes ((List!24131 0))(
  ( (Nil!24128) (Cons!24127 (h!25336 tuple2!17446) (t!34426 List!24131)) )
))
(declare-datatypes ((ListLongMap!15415 0))(
  ( (ListLongMap!15416 (toList!7723 List!24131)) )
))
(declare-fun call!46443 () ListLongMap!15415)

(declare-fun minValue!944 () V!41805)

(declare-fun getCurrentListMapNoExtraKeys!4221 (array!71935 array!71937 (_ BitVec 32) (_ BitVec 32) V!41805 V!41805 (_ BitVec 32) Int) ListLongMap!15415)

(declare-fun dynLambda!2354 (Int (_ BitVec 64)) V!41805)

(assert (=> bm!46440 (= call!46443 (getCurrentListMapNoExtraKeys!4221 lt!495657 (array!71938 (store (arr!34621 _values!996) i!673 (ValueCellFull!13045 (dynLambda!2354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35157 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43081 () Bool)

(declare-fun mapRes!43081 () Bool)

(declare-fun tp!82046 () Bool)

(assert (=> mapNonEmpty!43081 (= mapRes!43081 (and tp!82046 e!631929))))

(declare-fun mapKey!43081 () (_ BitVec 32))

(declare-fun mapValue!43081 () ValueCell!13045)

(declare-fun mapRest!43081 () (Array (_ BitVec 32) ValueCell!13045))

(assert (=> mapNonEmpty!43081 (= (arr!34621 _values!996) (store mapRest!43081 mapKey!43081 mapValue!43081))))

(declare-fun call!46444 () ListLongMap!15415)

(declare-fun e!631925 () Bool)

(declare-fun b!1107603 () Bool)

(declare-fun -!1003 (ListLongMap!15415 (_ BitVec 64)) ListLongMap!15415)

(assert (=> b!1107603 (= e!631925 (= call!46443 (-!1003 call!46444 k!934)))))

(declare-fun b!1107604 () Bool)

(declare-fun e!631926 () Bool)

(assert (=> b!1107604 (= e!631926 tp_is_empty!27509)))

(declare-fun mapIsEmpty!43081 () Bool)

(assert (=> mapIsEmpty!43081 mapRes!43081))

(declare-fun b!1107605 () Bool)

(declare-fun res!739183 () Bool)

(assert (=> b!1107605 (=> (not res!739183) (not e!631927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107605 (= res!739183 (validKeyInArray!0 k!934))))

(declare-fun b!1107606 () Bool)

(assert (=> b!1107606 (= e!631924 (and e!631926 mapRes!43081))))

(declare-fun condMapEmpty!43081 () Bool)

(declare-fun mapDefault!43081 () ValueCell!13045)

