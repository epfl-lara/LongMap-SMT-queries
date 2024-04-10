; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97332 () Bool)

(assert start!97332)

(declare-fun b_free!23303 () Bool)

(declare-fun b_next!23303 () Bool)

(assert (=> start!97332 (= b_free!23303 (not b_next!23303))))

(declare-fun tp!82207 () Bool)

(declare-fun b_and!37441 () Bool)

(assert (=> start!97332 (= tp!82207 b_and!37441)))

(declare-datatypes ((V!41877 0))(
  ( (V!41878 (val!13838 Int)) )
))
(declare-fun zeroValue!944 () V!41877)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46602 () Bool)

(declare-datatypes ((ValueCell!13072 0))(
  ( (ValueCellFull!13072 (v!16471 V!41877)) (EmptyCell!13072) )
))
(declare-datatypes ((array!72043 0))(
  ( (array!72044 (arr!34674 (Array (_ BitVec 32) ValueCell!13072)) (size!35210 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72043)

(declare-fun minValue!944 () V!41877)

(declare-datatypes ((array!72045 0))(
  ( (array!72046 (arr!34675 (Array (_ BitVec 32) (_ BitVec 64))) (size!35211 (_ BitVec 32))) )
))
(declare-fun lt!495900 () array!72045)

(declare-datatypes ((tuple2!17490 0))(
  ( (tuple2!17491 (_1!8756 (_ BitVec 64)) (_2!8756 V!41877)) )
))
(declare-datatypes ((List!24173 0))(
  ( (Nil!24170) (Cons!24169 (h!25378 tuple2!17490) (t!34522 List!24173)) )
))
(declare-datatypes ((ListLongMap!15459 0))(
  ( (ListLongMap!15460 (toList!7745 List!24173)) )
))
(declare-fun call!46605 () ListLongMap!15459)

(declare-fun getCurrentListMapNoExtraKeys!4239 (array!72045 array!72043 (_ BitVec 32) (_ BitVec 32) V!41877 V!41877 (_ BitVec 32) Int) ListLongMap!15459)

(declare-fun dynLambda!2370 (Int (_ BitVec 64)) V!41877)

(assert (=> bm!46602 (= call!46605 (getCurrentListMapNoExtraKeys!4239 lt!495900 (array!72044 (store (arr!34674 _values!996) i!673 (ValueCellFull!13072 (dynLambda!2370 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35210 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108969 () Bool)

(declare-fun res!740069 () Bool)

(declare-fun e!632584 () Bool)

(assert (=> b!1108969 (=> (not res!740069) (not e!632584))))

(declare-datatypes ((List!24174 0))(
  ( (Nil!24171) (Cons!24170 (h!25379 (_ BitVec 64)) (t!34523 List!24174)) )
))
(declare-fun arrayNoDuplicates!0 (array!72045 (_ BitVec 32) List!24174) Bool)

(assert (=> b!1108969 (= res!740069 (arrayNoDuplicates!0 lt!495900 #b00000000000000000000000000000000 Nil!24171))))

(declare-fun res!740072 () Bool)

(declare-fun e!632582 () Bool)

(assert (=> start!97332 (=> (not res!740072) (not e!632582))))

(declare-fun _keys!1208 () array!72045)

(assert (=> start!97332 (= res!740072 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35211 _keys!1208))))))

(assert (=> start!97332 e!632582))

(declare-fun tp_is_empty!27563 () Bool)

(assert (=> start!97332 tp_is_empty!27563))

(declare-fun array_inv!26684 (array!72045) Bool)

(assert (=> start!97332 (array_inv!26684 _keys!1208)))

(assert (=> start!97332 true))

(assert (=> start!97332 tp!82207))

(declare-fun e!632587 () Bool)

(declare-fun array_inv!26685 (array!72043) Bool)

(assert (=> start!97332 (and (array_inv!26685 _values!996) e!632587)))

(declare-fun b!1108970 () Bool)

(declare-fun e!632586 () Bool)

(assert (=> b!1108970 (= e!632586 true)))

(declare-fun e!632588 () Bool)

(assert (=> b!1108970 e!632588))

(declare-fun c!109146 () Bool)

(assert (=> b!1108970 (= c!109146 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36394 0))(
  ( (Unit!36395) )
))
(declare-fun lt!495902 () Unit!36394)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!269 (array!72045 array!72043 (_ BitVec 32) (_ BitVec 32) V!41877 V!41877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36394)

(assert (=> b!1108970 (= lt!495902 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!269 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46603 () Bool)

(declare-fun call!46606 () ListLongMap!15459)

(assert (=> bm!46603 (= call!46606 (getCurrentListMapNoExtraKeys!4239 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108971 () Bool)

(declare-fun res!740066 () Bool)

(assert (=> b!1108971 (=> (not res!740066) (not e!632582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108971 (= res!740066 (validMask!0 mask!1564))))

(declare-fun b!1108972 () Bool)

(assert (=> b!1108972 (= e!632584 (not e!632586))))

(declare-fun res!740074 () Bool)

(assert (=> b!1108972 (=> res!740074 e!632586)))

(assert (=> b!1108972 (= res!740074 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35211 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108972 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!495901 () Unit!36394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72045 (_ BitVec 64) (_ BitVec 32)) Unit!36394)

(assert (=> b!1108972 (= lt!495901 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1108973 () Bool)

(declare-fun res!740070 () Bool)

(assert (=> b!1108973 (=> (not res!740070) (not e!632582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108973 (= res!740070 (validKeyInArray!0 k!934))))

(declare-fun b!1108974 () Bool)

(assert (=> b!1108974 (= e!632588 (= call!46605 call!46606))))

(declare-fun b!1108975 () Bool)

(declare-fun e!632583 () Bool)

(assert (=> b!1108975 (= e!632583 tp_is_empty!27563)))

(declare-fun b!1108976 () Bool)

(declare-fun res!740065 () Bool)

(assert (=> b!1108976 (=> (not res!740065) (not e!632582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72045 (_ BitVec 32)) Bool)

(assert (=> b!1108976 (= res!740065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43162 () Bool)

(declare-fun mapRes!43162 () Bool)

(declare-fun tp!82208 () Bool)

(declare-fun e!632589 () Bool)

(assert (=> mapNonEmpty!43162 (= mapRes!43162 (and tp!82208 e!632589))))

(declare-fun mapRest!43162 () (Array (_ BitVec 32) ValueCell!13072))

(declare-fun mapValue!43162 () ValueCell!13072)

(declare-fun mapKey!43162 () (_ BitVec 32))

(assert (=> mapNonEmpty!43162 (= (arr!34674 _values!996) (store mapRest!43162 mapKey!43162 mapValue!43162))))

(declare-fun mapIsEmpty!43162 () Bool)

(assert (=> mapIsEmpty!43162 mapRes!43162))

(declare-fun b!1108977 () Bool)

(declare-fun res!740071 () Bool)

(assert (=> b!1108977 (=> (not res!740071) (not e!632582))))

(assert (=> b!1108977 (= res!740071 (= (select (arr!34675 _keys!1208) i!673) k!934))))

(declare-fun b!1108978 () Bool)

(declare-fun -!1023 (ListLongMap!15459 (_ BitVec 64)) ListLongMap!15459)

(assert (=> b!1108978 (= e!632588 (= call!46605 (-!1023 call!46606 k!934)))))

(declare-fun b!1108979 () Bool)

(declare-fun res!740073 () Bool)

(assert (=> b!1108979 (=> (not res!740073) (not e!632582))))

(assert (=> b!1108979 (= res!740073 (and (= (size!35210 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35211 _keys!1208) (size!35210 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108980 () Bool)

(assert (=> b!1108980 (= e!632582 e!632584)))

(declare-fun res!740068 () Bool)

(assert (=> b!1108980 (=> (not res!740068) (not e!632584))))

(assert (=> b!1108980 (= res!740068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495900 mask!1564))))

(assert (=> b!1108980 (= lt!495900 (array!72046 (store (arr!34675 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35211 _keys!1208)))))

(declare-fun b!1108981 () Bool)

(declare-fun res!740067 () Bool)

(assert (=> b!1108981 (=> (not res!740067) (not e!632582))))

(assert (=> b!1108981 (= res!740067 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24171))))

(declare-fun b!1108982 () Bool)

(assert (=> b!1108982 (= e!632589 tp_is_empty!27563)))

(declare-fun b!1108983 () Bool)

(declare-fun res!740064 () Bool)

(assert (=> b!1108983 (=> (not res!740064) (not e!632582))))

(assert (=> b!1108983 (= res!740064 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35211 _keys!1208))))))

(declare-fun b!1108984 () Bool)

(assert (=> b!1108984 (= e!632587 (and e!632583 mapRes!43162))))

(declare-fun condMapEmpty!43162 () Bool)

(declare-fun mapDefault!43162 () ValueCell!13072)

