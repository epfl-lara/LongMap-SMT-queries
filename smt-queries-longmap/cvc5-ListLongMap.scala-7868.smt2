; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97952 () Bool)

(assert start!97952)

(declare-fun b_free!23653 () Bool)

(declare-fun b_next!23653 () Bool)

(assert (=> start!97952 (= b_free!23653 (not b_next!23653))))

(declare-fun tp!83663 () Bool)

(declare-fun b_and!38089 () Bool)

(assert (=> start!97952 (= tp!83663 b_and!38089)))

(declare-fun b!1122685 () Bool)

(declare-fun e!639177 () Bool)

(declare-fun e!639171 () Bool)

(assert (=> b!1122685 (= e!639177 e!639171)))

(declare-fun res!750052 () Bool)

(assert (=> b!1122685 (=> (not res!750052) (not e!639171))))

(declare-datatypes ((array!73241 0))(
  ( (array!73242 (arr!35273 (Array (_ BitVec 32) (_ BitVec 64))) (size!35809 (_ BitVec 32))) )
))
(declare-fun lt!498809 () array!73241)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73241 (_ BitVec 32)) Bool)

(assert (=> b!1122685 (= res!750052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498809 mask!1564))))

(declare-fun _keys!1208 () array!73241)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122685 (= lt!498809 (array!73242 (store (arr!35273 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35809 _keys!1208)))))

(declare-fun b!1122686 () Bool)

(declare-fun e!639173 () Bool)

(assert (=> b!1122686 (= e!639171 (not e!639173))))

(declare-fun res!750051 () Bool)

(assert (=> b!1122686 (=> res!750051 e!639173)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1122686 (= res!750051 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122686 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36822 0))(
  ( (Unit!36823) )
))
(declare-fun lt!498808 () Unit!36822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73241 (_ BitVec 64) (_ BitVec 32)) Unit!36822)

(assert (=> b!1122686 (= lt!498808 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((V!42705 0))(
  ( (V!42706 (val!14148 Int)) )
))
(declare-fun zeroValue!944 () V!42705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17766 0))(
  ( (tuple2!17767 (_1!8894 (_ BitVec 64)) (_2!8894 V!42705)) )
))
(declare-datatypes ((List!24546 0))(
  ( (Nil!24543) (Cons!24542 (h!25751 tuple2!17766) (t!35191 List!24546)) )
))
(declare-datatypes ((ListLongMap!15735 0))(
  ( (ListLongMap!15736 (toList!7883 List!24546)) )
))
(declare-fun call!47241 () ListLongMap!15735)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47238 () Bool)

(declare-datatypes ((ValueCell!13382 0))(
  ( (ValueCellFull!13382 (v!16781 V!42705)) (EmptyCell!13382) )
))
(declare-datatypes ((array!73243 0))(
  ( (array!73244 (arr!35274 (Array (_ BitVec 32) ValueCell!13382)) (size!35810 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73243)

(declare-fun minValue!944 () V!42705)

(declare-fun getCurrentListMapNoExtraKeys!4372 (array!73241 array!73243 (_ BitVec 32) (_ BitVec 32) V!42705 V!42705 (_ BitVec 32) Int) ListLongMap!15735)

(assert (=> bm!47238 (= call!47241 (getCurrentListMapNoExtraKeys!4372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122687 () Bool)

(declare-fun e!639175 () Bool)

(assert (=> b!1122687 (= e!639173 e!639175)))

(declare-fun res!750056 () Bool)

(assert (=> b!1122687 (=> res!750056 e!639175)))

(assert (=> b!1122687 (= res!750056 (not (= from!1455 i!673)))))

(declare-fun lt!498811 () array!73243)

(declare-fun lt!498806 () ListLongMap!15735)

(assert (=> b!1122687 (= lt!498806 (getCurrentListMapNoExtraKeys!4372 lt!498809 lt!498811 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2468 (Int (_ BitVec 64)) V!42705)

(assert (=> b!1122687 (= lt!498811 (array!73244 (store (arr!35274 _values!996) i!673 (ValueCellFull!13382 (dynLambda!2468 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35810 _values!996)))))

(declare-fun lt!498812 () ListLongMap!15735)

(assert (=> b!1122687 (= lt!498812 (getCurrentListMapNoExtraKeys!4372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!750054 () Bool)

(assert (=> start!97952 (=> (not res!750054) (not e!639177))))

(assert (=> start!97952 (= res!750054 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35809 _keys!1208))))))

(assert (=> start!97952 e!639177))

(declare-fun tp_is_empty!28183 () Bool)

(assert (=> start!97952 tp_is_empty!28183))

(declare-fun array_inv!27082 (array!73241) Bool)

(assert (=> start!97952 (array_inv!27082 _keys!1208)))

(assert (=> start!97952 true))

(assert (=> start!97952 tp!83663))

(declare-fun e!639169 () Bool)

(declare-fun array_inv!27083 (array!73243) Bool)

(assert (=> start!97952 (and (array_inv!27083 _values!996) e!639169)))

(declare-fun bm!47239 () Bool)

(declare-fun call!47242 () ListLongMap!15735)

(assert (=> bm!47239 (= call!47242 (getCurrentListMapNoExtraKeys!4372 lt!498809 lt!498811 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122688 () Bool)

(declare-fun res!750055 () Bool)

(assert (=> b!1122688 (=> (not res!750055) (not e!639177))))

(assert (=> b!1122688 (= res!750055 (and (= (size!35810 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35809 _keys!1208) (size!35810 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122689 () Bool)

(declare-fun e!639170 () Bool)

(assert (=> b!1122689 (= e!639170 tp_is_empty!28183)))

(declare-fun b!1122690 () Bool)

(declare-fun res!750046 () Bool)

(assert (=> b!1122690 (=> (not res!750046) (not e!639177))))

(declare-datatypes ((List!24547 0))(
  ( (Nil!24544) (Cons!24543 (h!25752 (_ BitVec 64)) (t!35192 List!24547)) )
))
(declare-fun arrayNoDuplicates!0 (array!73241 (_ BitVec 32) List!24547) Bool)

(assert (=> b!1122690 (= res!750046 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24544))))

(declare-fun b!1122691 () Bool)

(declare-fun e!639174 () Bool)

(assert (=> b!1122691 (= e!639175 e!639174)))

(declare-fun res!750047 () Bool)

(assert (=> b!1122691 (=> res!750047 e!639174)))

(assert (=> b!1122691 (= res!750047 (not (= (select (arr!35273 _keys!1208) from!1455) k!934)))))

(declare-fun e!639176 () Bool)

(assert (=> b!1122691 e!639176))

(declare-fun c!109470 () Bool)

(assert (=> b!1122691 (= c!109470 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498807 () Unit!36822)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!338 (array!73241 array!73243 (_ BitVec 32) (_ BitVec 32) V!42705 V!42705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36822)

(assert (=> b!1122691 (= lt!498807 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44092 () Bool)

(declare-fun mapRes!44092 () Bool)

(assert (=> mapIsEmpty!44092 mapRes!44092))

(declare-fun b!1122692 () Bool)

(declare-fun res!750053 () Bool)

(assert (=> b!1122692 (=> (not res!750053) (not e!639177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122692 (= res!750053 (validMask!0 mask!1564))))

(declare-fun b!1122693 () Bool)

(declare-fun -!1089 (ListLongMap!15735 (_ BitVec 64)) ListLongMap!15735)

(assert (=> b!1122693 (= e!639176 (= call!47242 (-!1089 call!47241 k!934)))))

(declare-fun b!1122694 () Bool)

(assert (=> b!1122694 (= e!639169 (and e!639170 mapRes!44092))))

(declare-fun condMapEmpty!44092 () Bool)

(declare-fun mapDefault!44092 () ValueCell!13382)

