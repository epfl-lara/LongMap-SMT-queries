; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97326 () Bool)

(assert start!97326)

(declare-fun b_free!23297 () Bool)

(declare-fun b_next!23297 () Bool)

(assert (=> start!97326 (= b_free!23297 (not b_next!23297))))

(declare-fun tp!82190 () Bool)

(declare-fun b_and!37427 () Bool)

(assert (=> start!97326 (= tp!82190 b_and!37427)))

(declare-fun b!1108807 () Bool)

(declare-fun res!739967 () Bool)

(declare-fun e!632508 () Bool)

(assert (=> b!1108807 (=> (not res!739967) (not e!632508))))

(declare-datatypes ((array!72031 0))(
  ( (array!72032 (arr!34668 (Array (_ BitVec 32) (_ BitVec 64))) (size!35204 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72031)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41869 0))(
  ( (V!41870 (val!13835 Int)) )
))
(declare-datatypes ((ValueCell!13069 0))(
  ( (ValueCellFull!13069 (v!16468 V!41869)) (EmptyCell!13069) )
))
(declare-datatypes ((array!72033 0))(
  ( (array!72034 (arr!34669 (Array (_ BitVec 32) ValueCell!13069)) (size!35205 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72033)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1108807 (= res!739967 (and (= (size!35205 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35204 _keys!1208) (size!35205 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108808 () Bool)

(declare-fun res!739974 () Bool)

(assert (=> b!1108808 (=> (not res!739974) (not e!632508))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108808 (= res!739974 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35204 _keys!1208))))))

(declare-fun mapNonEmpty!43153 () Bool)

(declare-fun mapRes!43153 () Bool)

(declare-fun tp!82189 () Bool)

(declare-fun e!632507 () Bool)

(assert (=> mapNonEmpty!43153 (= mapRes!43153 (and tp!82189 e!632507))))

(declare-fun mapKey!43153 () (_ BitVec 32))

(declare-fun mapValue!43153 () ValueCell!13069)

(declare-fun mapRest!43153 () (Array (_ BitVec 32) ValueCell!13069))

(assert (=> mapNonEmpty!43153 (= (arr!34669 _values!996) (store mapRest!43153 mapKey!43153 mapValue!43153))))

(declare-datatypes ((tuple2!17484 0))(
  ( (tuple2!17485 (_1!8753 (_ BitVec 64)) (_2!8753 V!41869)) )
))
(declare-datatypes ((List!24168 0))(
  ( (Nil!24165) (Cons!24164 (h!25373 tuple2!17484) (t!34511 List!24168)) )
))
(declare-datatypes ((ListLongMap!15453 0))(
  ( (ListLongMap!15454 (toList!7742 List!24168)) )
))
(declare-fun call!46588 () ListLongMap!15453)

(declare-fun call!46587 () ListLongMap!15453)

(declare-fun b!1108809 () Bool)

(declare-fun e!632510 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1021 (ListLongMap!15453 (_ BitVec 64)) ListLongMap!15453)

(assert (=> b!1108809 (= e!632510 (= call!46588 (-!1021 call!46587 k!934)))))

(declare-fun b!1108810 () Bool)

(declare-fun e!632504 () Bool)

(assert (=> b!1108810 (= e!632504 true)))

(assert (=> b!1108810 e!632510))

(declare-fun c!109131 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108810 (= c!109131 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41869)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36390 0))(
  ( (Unit!36391) )
))
(declare-fun lt!495874 () Unit!36390)

(declare-fun minValue!944 () V!41869)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!267 (array!72031 array!72033 (_ BitVec 32) (_ BitVec 32) V!41869 V!41869 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36390)

(assert (=> b!1108810 (= lt!495874 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108811 () Bool)

(declare-fun e!632511 () Bool)

(assert (=> b!1108811 (= e!632511 (not e!632504))))

(declare-fun res!739966 () Bool)

(assert (=> b!1108811 (=> res!739966 e!632504)))

(assert (=> b!1108811 (= res!739966 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35204 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108811 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!495873 () Unit!36390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72031 (_ BitVec 64) (_ BitVec 32)) Unit!36390)

(assert (=> b!1108811 (= lt!495873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!739968 () Bool)

(assert (=> start!97326 (=> (not res!739968) (not e!632508))))

(assert (=> start!97326 (= res!739968 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35204 _keys!1208))))))

(assert (=> start!97326 e!632508))

(declare-fun tp_is_empty!27557 () Bool)

(assert (=> start!97326 tp_is_empty!27557))

(declare-fun array_inv!26680 (array!72031) Bool)

(assert (=> start!97326 (array_inv!26680 _keys!1208)))

(assert (=> start!97326 true))

(assert (=> start!97326 tp!82190))

(declare-fun e!632509 () Bool)

(declare-fun array_inv!26681 (array!72033) Bool)

(assert (=> start!97326 (and (array_inv!26681 _values!996) e!632509)))

(declare-fun b!1108812 () Bool)

(declare-fun res!739971 () Bool)

(assert (=> b!1108812 (=> (not res!739971) (not e!632508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108812 (= res!739971 (validMask!0 mask!1564))))

(declare-fun b!1108813 () Bool)

(declare-fun res!739965 () Bool)

(assert (=> b!1108813 (=> (not res!739965) (not e!632508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72031 (_ BitVec 32)) Bool)

(assert (=> b!1108813 (= res!739965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108814 () Bool)

(declare-fun res!739975 () Bool)

(assert (=> b!1108814 (=> (not res!739975) (not e!632508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108814 (= res!739975 (validKeyInArray!0 k!934))))

(declare-fun b!1108815 () Bool)

(assert (=> b!1108815 (= e!632510 (= call!46588 call!46587))))

(declare-fun mapIsEmpty!43153 () Bool)

(assert (=> mapIsEmpty!43153 mapRes!43153))

(declare-fun b!1108816 () Bool)

(declare-fun res!739969 () Bool)

(assert (=> b!1108816 (=> (not res!739969) (not e!632508))))

(declare-datatypes ((List!24169 0))(
  ( (Nil!24166) (Cons!24165 (h!25374 (_ BitVec 64)) (t!34512 List!24169)) )
))
(declare-fun arrayNoDuplicates!0 (array!72031 (_ BitVec 32) List!24169) Bool)

(assert (=> b!1108816 (= res!739969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24166))))

(declare-fun b!1108817 () Bool)

(declare-fun e!632505 () Bool)

(assert (=> b!1108817 (= e!632505 tp_is_empty!27557)))

(declare-fun b!1108818 () Bool)

(declare-fun res!739973 () Bool)

(assert (=> b!1108818 (=> (not res!739973) (not e!632508))))

(assert (=> b!1108818 (= res!739973 (= (select (arr!34668 _keys!1208) i!673) k!934))))

(declare-fun b!1108819 () Bool)

(assert (=> b!1108819 (= e!632509 (and e!632505 mapRes!43153))))

(declare-fun condMapEmpty!43153 () Bool)

(declare-fun mapDefault!43153 () ValueCell!13069)

