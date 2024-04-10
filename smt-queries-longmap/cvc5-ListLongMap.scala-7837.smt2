; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97766 () Bool)

(assert start!97766)

(declare-fun b_free!23467 () Bool)

(declare-fun b_next!23467 () Bool)

(assert (=> start!97766 (= b_free!23467 (not b_next!23467))))

(declare-fun tp!83104 () Bool)

(declare-fun b_and!37741 () Bool)

(assert (=> start!97766 (= tp!83104 b_and!37741)))

(declare-fun res!746821 () Bool)

(declare-fun e!636945 () Bool)

(assert (=> start!97766 (=> (not res!746821) (not e!636945))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72885 0))(
  ( (array!72886 (arr!35095 (Array (_ BitVec 32) (_ BitVec 64))) (size!35631 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72885)

(assert (=> start!97766 (= res!746821 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35631 _keys!1208))))))

(assert (=> start!97766 e!636945))

(declare-fun tp_is_empty!27997 () Bool)

(assert (=> start!97766 tp_is_empty!27997))

(declare-fun array_inv!26964 (array!72885) Bool)

(assert (=> start!97766 (array_inv!26964 _keys!1208)))

(assert (=> start!97766 true))

(assert (=> start!97766 tp!83104))

(declare-datatypes ((V!42457 0))(
  ( (V!42458 (val!14055 Int)) )
))
(declare-datatypes ((ValueCell!13289 0))(
  ( (ValueCellFull!13289 (v!16688 V!42457)) (EmptyCell!13289) )
))
(declare-datatypes ((array!72887 0))(
  ( (array!72888 (arr!35096 (Array (_ BitVec 32) ValueCell!13289)) (size!35632 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72887)

(declare-fun e!636940 () Bool)

(declare-fun array_inv!26965 (array!72887) Bool)

(assert (=> start!97766 (and (array_inv!26965 _values!996) e!636940)))

(declare-fun b!1118222 () Bool)

(declare-fun res!746823 () Bool)

(assert (=> b!1118222 (=> (not res!746823) (not e!636945))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118222 (= res!746823 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35631 _keys!1208))))))

(declare-fun mapNonEmpty!43813 () Bool)

(declare-fun mapRes!43813 () Bool)

(declare-fun tp!83105 () Bool)

(declare-fun e!636943 () Bool)

(assert (=> mapNonEmpty!43813 (= mapRes!43813 (and tp!83105 e!636943))))

(declare-fun mapRest!43813 () (Array (_ BitVec 32) ValueCell!13289))

(declare-fun mapKey!43813 () (_ BitVec 32))

(declare-fun mapValue!43813 () ValueCell!13289)

(assert (=> mapNonEmpty!43813 (= (arr!35096 _values!996) (store mapRest!43813 mapKey!43813 mapValue!43813))))

(declare-fun b!1118223 () Bool)

(declare-fun res!746828 () Bool)

(assert (=> b!1118223 (=> (not res!746828) (not e!636945))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72885 (_ BitVec 32)) Bool)

(assert (=> b!1118223 (= res!746828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118224 () Bool)

(declare-fun res!746825 () Bool)

(assert (=> b!1118224 (=> (not res!746825) (not e!636945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118224 (= res!746825 (validMask!0 mask!1564))))

(declare-fun b!1118225 () Bool)

(declare-fun res!746830 () Bool)

(assert (=> b!1118225 (=> (not res!746830) (not e!636945))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118225 (= res!746830 (validKeyInArray!0 k!934))))

(declare-fun b!1118226 () Bool)

(assert (=> b!1118226 (= e!636943 tp_is_empty!27997)))

(declare-fun mapIsEmpty!43813 () Bool)

(assert (=> mapIsEmpty!43813 mapRes!43813))

(declare-fun b!1118227 () Bool)

(declare-fun e!636944 () Bool)

(assert (=> b!1118227 (= e!636944 tp_is_empty!27997)))

(declare-fun b!1118228 () Bool)

(declare-fun res!746827 () Bool)

(declare-fun e!636941 () Bool)

(assert (=> b!1118228 (=> (not res!746827) (not e!636941))))

(declare-fun lt!497449 () array!72885)

(declare-datatypes ((List!24412 0))(
  ( (Nil!24409) (Cons!24408 (h!25617 (_ BitVec 64)) (t!34893 List!24412)) )
))
(declare-fun arrayNoDuplicates!0 (array!72885 (_ BitVec 32) List!24412) Bool)

(assert (=> b!1118228 (= res!746827 (arrayNoDuplicates!0 lt!497449 #b00000000000000000000000000000000 Nil!24409))))

(declare-fun b!1118229 () Bool)

(declare-fun res!746829 () Bool)

(assert (=> b!1118229 (=> (not res!746829) (not e!636945))))

(assert (=> b!1118229 (= res!746829 (= (select (arr!35095 _keys!1208) i!673) k!934))))

(declare-fun b!1118230 () Bool)

(declare-fun e!636942 () Bool)

(assert (=> b!1118230 (= e!636942 true)))

(declare-fun zeroValue!944 () V!42457)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17626 0))(
  ( (tuple2!17627 (_1!8824 (_ BitVec 64)) (_2!8824 V!42457)) )
))
(declare-datatypes ((List!24413 0))(
  ( (Nil!24410) (Cons!24409 (h!25618 tuple2!17626) (t!34894 List!24413)) )
))
(declare-datatypes ((ListLongMap!15595 0))(
  ( (ListLongMap!15596 (toList!7813 List!24413)) )
))
(declare-fun lt!497448 () ListLongMap!15595)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42457)

(declare-fun getCurrentListMapNoExtraKeys!4303 (array!72885 array!72887 (_ BitVec 32) (_ BitVec 32) V!42457 V!42457 (_ BitVec 32) Int) ListLongMap!15595)

(assert (=> b!1118230 (= lt!497448 (getCurrentListMapNoExtraKeys!4303 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118231 () Bool)

(declare-fun res!746822 () Bool)

(assert (=> b!1118231 (=> (not res!746822) (not e!636945))))

(assert (=> b!1118231 (= res!746822 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24409))))

(declare-fun b!1118232 () Bool)

(assert (=> b!1118232 (= e!636941 (not e!636942))))

(declare-fun res!746820 () Bool)

(assert (=> b!1118232 (=> res!746820 e!636942)))

(assert (=> b!1118232 (= res!746820 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118232 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36700 0))(
  ( (Unit!36701) )
))
(declare-fun lt!497450 () Unit!36700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72885 (_ BitVec 64) (_ BitVec 32)) Unit!36700)

(assert (=> b!1118232 (= lt!497450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118233 () Bool)

(assert (=> b!1118233 (= e!636945 e!636941)))

(declare-fun res!746824 () Bool)

(assert (=> b!1118233 (=> (not res!746824) (not e!636941))))

(assert (=> b!1118233 (= res!746824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497449 mask!1564))))

(assert (=> b!1118233 (= lt!497449 (array!72886 (store (arr!35095 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35631 _keys!1208)))))

(declare-fun b!1118234 () Bool)

(assert (=> b!1118234 (= e!636940 (and e!636944 mapRes!43813))))

(declare-fun condMapEmpty!43813 () Bool)

(declare-fun mapDefault!43813 () ValueCell!13289)

