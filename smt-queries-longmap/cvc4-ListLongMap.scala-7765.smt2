; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97338 () Bool)

(assert start!97338)

(declare-fun b_free!23309 () Bool)

(declare-fun b_next!23309 () Bool)

(assert (=> start!97338 (= b_free!23309 (not b_next!23309))))

(declare-fun tp!82225 () Bool)

(declare-fun b_and!37453 () Bool)

(assert (=> start!97338 (= tp!82225 b_and!37453)))

(declare-fun b!1109119 () Bool)

(declare-fun res!740170 () Bool)

(declare-fun e!632654 () Bool)

(assert (=> b!1109119 (=> (not res!740170) (not e!632654))))

(declare-datatypes ((array!72055 0))(
  ( (array!72056 (arr!34680 (Array (_ BitVec 32) (_ BitVec 64))) (size!35216 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72055)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1109119 (= res!740170 (= (select (arr!34680 _keys!1208) i!673) k!934))))

(declare-fun b!1109120 () Bool)

(declare-fun res!740168 () Bool)

(assert (=> b!1109120 (=> (not res!740168) (not e!632654))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41885 0))(
  ( (V!41886 (val!13841 Int)) )
))
(declare-datatypes ((ValueCell!13075 0))(
  ( (ValueCellFull!13075 (v!16474 V!41885)) (EmptyCell!13075) )
))
(declare-datatypes ((array!72057 0))(
  ( (array!72058 (arr!34681 (Array (_ BitVec 32) ValueCell!13075)) (size!35217 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72057)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1109120 (= res!740168 (and (= (size!35217 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35216 _keys!1208) (size!35217 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41885)

(declare-fun lt!495929 () array!72055)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46620 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17496 0))(
  ( (tuple2!17497 (_1!8759 (_ BitVec 64)) (_2!8759 V!41885)) )
))
(declare-datatypes ((List!24179 0))(
  ( (Nil!24176) (Cons!24175 (h!25384 tuple2!17496) (t!34534 List!24179)) )
))
(declare-datatypes ((ListLongMap!15465 0))(
  ( (ListLongMap!15466 (toList!7748 List!24179)) )
))
(declare-fun call!46624 () ListLongMap!15465)

(declare-fun minValue!944 () V!41885)

(declare-fun getCurrentListMapNoExtraKeys!4242 (array!72055 array!72057 (_ BitVec 32) (_ BitVec 32) V!41885 V!41885 (_ BitVec 32) Int) ListLongMap!15465)

(declare-fun dynLambda!2372 (Int (_ BitVec 64)) V!41885)

(assert (=> bm!46620 (= call!46624 (getCurrentListMapNoExtraKeys!4242 lt!495929 (array!72058 (store (arr!34681 _values!996) i!673 (ValueCellFull!13075 (dynLambda!2372 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35217 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43171 () Bool)

(declare-fun mapRes!43171 () Bool)

(assert (=> mapIsEmpty!43171 mapRes!43171))

(declare-fun b!1109121 () Bool)

(declare-fun e!632656 () Bool)

(declare-fun tp_is_empty!27569 () Bool)

(assert (=> b!1109121 (= e!632656 tp_is_empty!27569)))

(declare-fun b!1109122 () Bool)

(declare-fun res!740166 () Bool)

(declare-fun e!632657 () Bool)

(assert (=> b!1109122 (=> (not res!740166) (not e!632657))))

(declare-datatypes ((List!24180 0))(
  ( (Nil!24177) (Cons!24176 (h!25385 (_ BitVec 64)) (t!34535 List!24180)) )
))
(declare-fun arrayNoDuplicates!0 (array!72055 (_ BitVec 32) List!24180) Bool)

(assert (=> b!1109122 (= res!740166 (arrayNoDuplicates!0 lt!495929 #b00000000000000000000000000000000 Nil!24177))))

(declare-fun b!1109123 () Bool)

(declare-fun res!740169 () Bool)

(assert (=> b!1109123 (=> (not res!740169) (not e!632654))))

(assert (=> b!1109123 (= res!740169 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35216 _keys!1208))))))

(declare-fun mapNonEmpty!43171 () Bool)

(declare-fun tp!82226 () Bool)

(declare-fun e!632659 () Bool)

(assert (=> mapNonEmpty!43171 (= mapRes!43171 (and tp!82226 e!632659))))

(declare-fun mapRest!43171 () (Array (_ BitVec 32) ValueCell!13075))

(declare-fun mapValue!43171 () ValueCell!13075)

(declare-fun mapKey!43171 () (_ BitVec 32))

(assert (=> mapNonEmpty!43171 (= (arr!34681 _values!996) (store mapRest!43171 mapKey!43171 mapValue!43171))))

(declare-fun b!1109125 () Bool)

(declare-fun res!740165 () Bool)

(assert (=> b!1109125 (=> (not res!740165) (not e!632654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109125 (= res!740165 (validMask!0 mask!1564))))

(declare-fun b!1109126 () Bool)

(assert (=> b!1109126 (= e!632654 e!632657)))

(declare-fun res!740173 () Bool)

(assert (=> b!1109126 (=> (not res!740173) (not e!632657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72055 (_ BitVec 32)) Bool)

(assert (=> b!1109126 (= res!740173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495929 mask!1564))))

(assert (=> b!1109126 (= lt!495929 (array!72056 (store (arr!34680 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35216 _keys!1208)))))

(declare-fun b!1109127 () Bool)

(declare-fun e!632655 () Bool)

(assert (=> b!1109127 (= e!632657 (not e!632655))))

(declare-fun res!740164 () Bool)

(assert (=> b!1109127 (=> res!740164 e!632655)))

(assert (=> b!1109127 (= res!740164 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35216 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109127 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36400 0))(
  ( (Unit!36401) )
))
(declare-fun lt!495927 () Unit!36400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72055 (_ BitVec 64) (_ BitVec 32)) Unit!36400)

(assert (=> b!1109127 (= lt!495927 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1109128 () Bool)

(declare-fun res!740167 () Bool)

(assert (=> b!1109128 (=> (not res!740167) (not e!632654))))

(assert (=> b!1109128 (= res!740167 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24177))))

(declare-fun b!1109129 () Bool)

(declare-fun res!740171 () Bool)

(assert (=> b!1109129 (=> (not res!740171) (not e!632654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109129 (= res!740171 (validKeyInArray!0 k!934))))

(declare-fun b!1109130 () Bool)

(assert (=> b!1109130 (= e!632659 tp_is_empty!27569)))

(declare-fun b!1109124 () Bool)

(declare-fun e!632661 () Bool)

(assert (=> b!1109124 (= e!632661 (and e!632656 mapRes!43171))))

(declare-fun condMapEmpty!43171 () Bool)

(declare-fun mapDefault!43171 () ValueCell!13075)

