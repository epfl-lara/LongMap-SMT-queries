; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97358 () Bool)

(assert start!97358)

(declare-fun b_free!23329 () Bool)

(declare-fun b_next!23329 () Bool)

(assert (=> start!97358 (= b_free!23329 (not b_next!23329))))

(declare-fun tp!82285 () Bool)

(declare-fun b_and!37493 () Bool)

(assert (=> start!97358 (= tp!82285 b_and!37493)))

(declare-fun b!1109619 () Bool)

(declare-fun e!632898 () Bool)

(assert (=> b!1109619 (= e!632898 true)))

(declare-fun e!632900 () Bool)

(assert (=> b!1109619 e!632900))

(declare-fun c!109185 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109619 (= c!109185 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41913 0))(
  ( (V!41914 (val!13851 Int)) )
))
(declare-fun zeroValue!944 () V!41913)

(declare-datatypes ((array!72095 0))(
  ( (array!72096 (arr!34700 (Array (_ BitVec 32) (_ BitVec 64))) (size!35236 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72095)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13085 0))(
  ( (ValueCellFull!13085 (v!16484 V!41913)) (EmptyCell!13085) )
))
(declare-datatypes ((array!72097 0))(
  ( (array!72098 (arr!34701 (Array (_ BitVec 32) ValueCell!13085)) (size!35237 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72097)

(declare-fun minValue!944 () V!41913)

(declare-datatypes ((Unit!36416 0))(
  ( (Unit!36417) )
))
(declare-fun lt!496017 () Unit!36416)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!277 (array!72095 array!72097 (_ BitVec 32) (_ BitVec 32) V!41913 V!41913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36416)

(assert (=> b!1109619 (= lt!496017 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!17510 0))(
  ( (tuple2!17511 (_1!8766 (_ BitVec 64)) (_2!8766 V!41913)) )
))
(declare-datatypes ((List!24193 0))(
  ( (Nil!24190) (Cons!24189 (h!25398 tuple2!17510) (t!34568 List!24193)) )
))
(declare-datatypes ((ListLongMap!15479 0))(
  ( (ListLongMap!15480 (toList!7755 List!24193)) )
))
(declare-fun call!46684 () ListLongMap!15479)

(declare-fun bm!46680 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4249 (array!72095 array!72097 (_ BitVec 32) (_ BitVec 32) V!41913 V!41913 (_ BitVec 32) Int) ListLongMap!15479)

(assert (=> bm!46680 (= call!46684 (getCurrentListMapNoExtraKeys!4249 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109620 () Bool)

(declare-fun e!632899 () Bool)

(declare-fun tp_is_empty!27589 () Bool)

(assert (=> b!1109620 (= e!632899 tp_is_empty!27589)))

(declare-fun mapNonEmpty!43201 () Bool)

(declare-fun mapRes!43201 () Bool)

(declare-fun tp!82286 () Bool)

(assert (=> mapNonEmpty!43201 (= mapRes!43201 (and tp!82286 e!632899))))

(declare-fun mapRest!43201 () (Array (_ BitVec 32) ValueCell!13085))

(declare-fun mapKey!43201 () (_ BitVec 32))

(declare-fun mapValue!43201 () ValueCell!13085)

(assert (=> mapNonEmpty!43201 (= (arr!34701 _values!996) (store mapRest!43201 mapKey!43201 mapValue!43201))))

(declare-fun b!1109621 () Bool)

(declare-fun res!740499 () Bool)

(declare-fun e!632901 () Bool)

(assert (=> b!1109621 (=> (not res!740499) (not e!632901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109621 (= res!740499 (validMask!0 mask!1564))))

(declare-fun b!1109623 () Bool)

(declare-fun res!740503 () Bool)

(assert (=> b!1109623 (=> (not res!740503) (not e!632901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109623 (= res!740503 (validKeyInArray!0 k!934))))

(declare-fun b!1109624 () Bool)

(declare-fun res!740498 () Bool)

(assert (=> b!1109624 (=> (not res!740498) (not e!632901))))

(assert (=> b!1109624 (= res!740498 (and (= (size!35237 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35236 _keys!1208) (size!35237 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109625 () Bool)

(declare-fun e!632894 () Bool)

(assert (=> b!1109625 (= e!632894 (not e!632898))))

(declare-fun res!740494 () Bool)

(assert (=> b!1109625 (=> res!740494 e!632898)))

(assert (=> b!1109625 (= res!740494 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35236 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109625 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!496018 () Unit!36416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72095 (_ BitVec 64) (_ BitVec 32)) Unit!36416)

(assert (=> b!1109625 (= lt!496018 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1109626 () Bool)

(declare-fun res!740500 () Bool)

(assert (=> b!1109626 (=> (not res!740500) (not e!632901))))

(declare-datatypes ((List!24194 0))(
  ( (Nil!24191) (Cons!24190 (h!25399 (_ BitVec 64)) (t!34569 List!24194)) )
))
(declare-fun arrayNoDuplicates!0 (array!72095 (_ BitVec 32) List!24194) Bool)

(assert (=> b!1109626 (= res!740500 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24191))))

(declare-fun b!1109627 () Bool)

(declare-fun res!740501 () Bool)

(assert (=> b!1109627 (=> (not res!740501) (not e!632901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72095 (_ BitVec 32)) Bool)

(assert (=> b!1109627 (= res!740501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!46683 () ListLongMap!15479)

(declare-fun b!1109628 () Bool)

(declare-fun -!1030 (ListLongMap!15479 (_ BitVec 64)) ListLongMap!15479)

(assert (=> b!1109628 (= e!632900 (= call!46683 (-!1030 call!46684 k!934)))))

(declare-fun b!1109629 () Bool)

(declare-fun e!632896 () Bool)

(assert (=> b!1109629 (= e!632896 tp_is_empty!27589)))

(declare-fun b!1109630 () Bool)

(declare-fun e!632895 () Bool)

(assert (=> b!1109630 (= e!632895 (and e!632896 mapRes!43201))))

(declare-fun condMapEmpty!43201 () Bool)

(declare-fun mapDefault!43201 () ValueCell!13085)

