; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97364 () Bool)

(assert start!97364)

(declare-fun b_free!23335 () Bool)

(declare-fun b_next!23335 () Bool)

(assert (=> start!97364 (= b_free!23335 (not b_next!23335))))

(declare-fun tp!82304 () Bool)

(declare-fun b_and!37505 () Bool)

(assert (=> start!97364 (= tp!82304 b_and!37505)))

(declare-fun b!1109769 () Bool)

(declare-fun e!632966 () Bool)

(declare-fun e!632970 () Bool)

(assert (=> b!1109769 (= e!632966 (not e!632970))))

(declare-fun res!740601 () Bool)

(assert (=> b!1109769 (=> res!740601 e!632970)))

(declare-datatypes ((array!72107 0))(
  ( (array!72108 (arr!34706 (Array (_ BitVec 32) (_ BitVec 64))) (size!35242 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72107)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109769 (= res!740601 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35242 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109769 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36422 0))(
  ( (Unit!36423) )
))
(declare-fun lt!496046 () Unit!36422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72107 (_ BitVec 64) (_ BitVec 32)) Unit!36422)

(assert (=> b!1109769 (= lt!496046 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!43210 () Bool)

(declare-fun mapRes!43210 () Bool)

(assert (=> mapIsEmpty!43210 mapRes!43210))

(declare-fun b!1109770 () Bool)

(declare-fun res!740599 () Bool)

(declare-fun e!632973 () Bool)

(assert (=> b!1109770 (=> (not res!740599) (not e!632973))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72107 (_ BitVec 32)) Bool)

(assert (=> b!1109770 (= res!740599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109772 () Bool)

(declare-fun res!740597 () Bool)

(assert (=> b!1109772 (=> (not res!740597) (not e!632973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109772 (= res!740597 (validKeyInArray!0 k!934))))

(declare-fun b!1109773 () Bool)

(declare-fun res!740592 () Bool)

(assert (=> b!1109773 (=> (not res!740592) (not e!632973))))

(declare-datatypes ((List!24199 0))(
  ( (Nil!24196) (Cons!24195 (h!25404 (_ BitVec 64)) (t!34580 List!24199)) )
))
(declare-fun arrayNoDuplicates!0 (array!72107 (_ BitVec 32) List!24199) Bool)

(assert (=> b!1109773 (= res!740592 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24196))))

(declare-fun b!1109774 () Bool)

(declare-fun e!632969 () Bool)

(declare-fun tp_is_empty!27595 () Bool)

(assert (=> b!1109774 (= e!632969 tp_is_empty!27595)))

(declare-fun b!1109775 () Bool)

(declare-fun res!740595 () Bool)

(assert (=> b!1109775 (=> (not res!740595) (not e!632973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109775 (= res!740595 (validMask!0 mask!1564))))

(declare-fun b!1109776 () Bool)

(assert (=> b!1109776 (= e!632973 e!632966)))

(declare-fun res!740600 () Bool)

(assert (=> b!1109776 (=> (not res!740600) (not e!632966))))

(declare-fun lt!496044 () array!72107)

(assert (=> b!1109776 (= res!740600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496044 mask!1564))))

(assert (=> b!1109776 (= lt!496044 (array!72108 (store (arr!34706 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35242 _keys!1208)))))

(declare-fun b!1109777 () Bool)

(declare-fun e!632971 () Bool)

(declare-datatypes ((V!41921 0))(
  ( (V!41922 (val!13854 Int)) )
))
(declare-datatypes ((tuple2!17516 0))(
  ( (tuple2!17517 (_1!8769 (_ BitVec 64)) (_2!8769 V!41921)) )
))
(declare-datatypes ((List!24200 0))(
  ( (Nil!24197) (Cons!24196 (h!25405 tuple2!17516) (t!34581 List!24200)) )
))
(declare-datatypes ((ListLongMap!15485 0))(
  ( (ListLongMap!15486 (toList!7758 List!24200)) )
))
(declare-fun call!46702 () ListLongMap!15485)

(declare-fun call!46701 () ListLongMap!15485)

(assert (=> b!1109777 (= e!632971 (= call!46702 call!46701))))

(declare-fun b!1109778 () Bool)

(declare-fun res!740593 () Bool)

(assert (=> b!1109778 (=> (not res!740593) (not e!632973))))

(assert (=> b!1109778 (= res!740593 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35242 _keys!1208))))))

(declare-fun zeroValue!944 () V!41921)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46698 () Bool)

(declare-datatypes ((ValueCell!13088 0))(
  ( (ValueCellFull!13088 (v!16487 V!41921)) (EmptyCell!13088) )
))
(declare-datatypes ((array!72109 0))(
  ( (array!72110 (arr!34707 (Array (_ BitVec 32) ValueCell!13088)) (size!35243 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72109)

(declare-fun minValue!944 () V!41921)

(declare-fun getCurrentListMapNoExtraKeys!4252 (array!72107 array!72109 (_ BitVec 32) (_ BitVec 32) V!41921 V!41921 (_ BitVec 32) Int) ListLongMap!15485)

(assert (=> bm!46698 (= call!46701 (getCurrentListMapNoExtraKeys!4252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46699 () Bool)

(declare-fun dynLambda!2381 (Int (_ BitVec 64)) V!41921)

(assert (=> bm!46699 (= call!46702 (getCurrentListMapNoExtraKeys!4252 lt!496044 (array!72110 (store (arr!34707 _values!996) i!673 (ValueCellFull!13088 (dynLambda!2381 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35243 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109779 () Bool)

(declare-fun e!632968 () Bool)

(assert (=> b!1109779 (= e!632968 tp_is_empty!27595)))

(declare-fun mapNonEmpty!43210 () Bool)

(declare-fun tp!82303 () Bool)

(assert (=> mapNonEmpty!43210 (= mapRes!43210 (and tp!82303 e!632968))))

(declare-fun mapRest!43210 () (Array (_ BitVec 32) ValueCell!13088))

(declare-fun mapValue!43210 () ValueCell!13088)

(declare-fun mapKey!43210 () (_ BitVec 32))

(assert (=> mapNonEmpty!43210 (= (arr!34707 _values!996) (store mapRest!43210 mapKey!43210 mapValue!43210))))

(declare-fun b!1109780 () Bool)

(declare-fun -!1033 (ListLongMap!15485 (_ BitVec 64)) ListLongMap!15485)

(assert (=> b!1109780 (= e!632971 (= call!46702 (-!1033 call!46701 k!934)))))

(declare-fun res!740596 () Bool)

(assert (=> start!97364 (=> (not res!740596) (not e!632973))))

(assert (=> start!97364 (= res!740596 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35242 _keys!1208))))))

(assert (=> start!97364 e!632973))

(assert (=> start!97364 tp_is_empty!27595))

(declare-fun array_inv!26708 (array!72107) Bool)

(assert (=> start!97364 (array_inv!26708 _keys!1208)))

(assert (=> start!97364 true))

(assert (=> start!97364 tp!82304))

(declare-fun e!632967 () Bool)

(declare-fun array_inv!26709 (array!72109) Bool)

(assert (=> start!97364 (and (array_inv!26709 _values!996) e!632967)))

(declare-fun b!1109771 () Bool)

(declare-fun res!740594 () Bool)

(assert (=> b!1109771 (=> (not res!740594) (not e!632973))))

(assert (=> b!1109771 (= res!740594 (= (select (arr!34706 _keys!1208) i!673) k!934))))

(declare-fun b!1109781 () Bool)

(assert (=> b!1109781 (= e!632970 true)))

(assert (=> b!1109781 e!632971))

(declare-fun c!109194 () Bool)

(assert (=> b!1109781 (= c!109194 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496045 () Unit!36422)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!280 (array!72107 array!72109 (_ BitVec 32) (_ BitVec 32) V!41921 V!41921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36422)

(assert (=> b!1109781 (= lt!496045 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109782 () Bool)

(assert (=> b!1109782 (= e!632967 (and e!632969 mapRes!43210))))

(declare-fun condMapEmpty!43210 () Bool)

(declare-fun mapDefault!43210 () ValueCell!13088)

