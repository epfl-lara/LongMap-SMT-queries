; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97400 () Bool)

(assert start!97400)

(declare-fun b_free!23371 () Bool)

(declare-fun b_next!23371 () Bool)

(assert (=> start!97400 (= b_free!23371 (not b_next!23371))))

(declare-fun tp!82411 () Bool)

(declare-fun b_and!37577 () Bool)

(assert (=> start!97400 (= tp!82411 b_and!37577)))

(declare-fun b!1110669 () Bool)

(declare-fun e!633399 () Bool)

(declare-fun e!633401 () Bool)

(assert (=> b!1110669 (= e!633399 e!633401)))

(declare-fun res!741188 () Bool)

(assert (=> b!1110669 (=> (not res!741188) (not e!633401))))

(declare-datatypes ((array!72179 0))(
  ( (array!72180 (arr!34742 (Array (_ BitVec 32) (_ BitVec 64))) (size!35278 (_ BitVec 32))) )
))
(declare-fun lt!496208 () array!72179)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72179 (_ BitVec 32)) Bool)

(assert (=> b!1110669 (= res!741188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496208 mask!1564))))

(declare-fun _keys!1208 () array!72179)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110669 (= lt!496208 (array!72180 (store (arr!34742 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35278 _keys!1208)))))

(declare-fun b!1110670 () Bool)

(declare-fun res!741190 () Bool)

(assert (=> b!1110670 (=> (not res!741190) (not e!633399))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1110670 (= res!741190 (= (select (arr!34742 _keys!1208) i!673) k!934))))

(declare-datatypes ((V!41969 0))(
  ( (V!41970 (val!13872 Int)) )
))
(declare-fun zeroValue!944 () V!41969)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46806 () Bool)

(declare-datatypes ((ValueCell!13106 0))(
  ( (ValueCellFull!13106 (v!16505 V!41969)) (EmptyCell!13106) )
))
(declare-datatypes ((array!72181 0))(
  ( (array!72182 (arr!34743 (Array (_ BitVec 32) ValueCell!13106)) (size!35279 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72181)

(declare-datatypes ((tuple2!17546 0))(
  ( (tuple2!17547 (_1!8784 (_ BitVec 64)) (_2!8784 V!41969)) )
))
(declare-datatypes ((List!24230 0))(
  ( (Nil!24227) (Cons!24226 (h!25435 tuple2!17546) (t!34647 List!24230)) )
))
(declare-datatypes ((ListLongMap!15515 0))(
  ( (ListLongMap!15516 (toList!7773 List!24230)) )
))
(declare-fun call!46809 () ListLongMap!15515)

(declare-fun getCurrentListMapNoExtraKeys!4266 (array!72179 array!72181 (_ BitVec 32) (_ BitVec 32) V!41969 V!41969 (_ BitVec 32) Int) ListLongMap!15515)

(declare-fun dynLambda!2394 (Int (_ BitVec 64)) V!41969)

(assert (=> bm!46806 (= call!46809 (getCurrentListMapNoExtraKeys!4266 lt!496208 (array!72182 (store (arr!34743 _values!996) i!673 (ValueCellFull!13106 (dynLambda!2394 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35279 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110671 () Bool)

(declare-fun e!633404 () Bool)

(declare-fun tp_is_empty!27631 () Bool)

(assert (=> b!1110671 (= e!633404 tp_is_empty!27631)))

(declare-fun b!1110672 () Bool)

(declare-fun res!741196 () Bool)

(assert (=> b!1110672 (=> (not res!741196) (not e!633399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110672 (= res!741196 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43264 () Bool)

(declare-fun mapRes!43264 () Bool)

(declare-fun tp!82412 () Bool)

(declare-fun e!633402 () Bool)

(assert (=> mapNonEmpty!43264 (= mapRes!43264 (and tp!82412 e!633402))))

(declare-fun mapValue!43264 () ValueCell!13106)

(declare-fun mapRest!43264 () (Array (_ BitVec 32) ValueCell!13106))

(declare-fun mapKey!43264 () (_ BitVec 32))

(assert (=> mapNonEmpty!43264 (= (arr!34743 _values!996) (store mapRest!43264 mapKey!43264 mapValue!43264))))

(declare-fun b!1110673 () Bool)

(declare-fun e!633398 () Bool)

(assert (=> b!1110673 (= e!633398 true)))

(declare-fun e!633400 () Bool)

(assert (=> b!1110673 e!633400))

(declare-fun c!109248 () Bool)

(assert (=> b!1110673 (= c!109248 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36448 0))(
  ( (Unit!36449) )
))
(declare-fun lt!496207 () Unit!36448)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!293 (array!72179 array!72181 (_ BitVec 32) (_ BitVec 32) V!41969 V!41969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36448)

(assert (=> b!1110673 (= lt!496207 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110674 () Bool)

(declare-fun res!741187 () Bool)

(assert (=> b!1110674 (=> (not res!741187) (not e!633401))))

(declare-datatypes ((List!24231 0))(
  ( (Nil!24228) (Cons!24227 (h!25436 (_ BitVec 64)) (t!34648 List!24231)) )
))
(declare-fun arrayNoDuplicates!0 (array!72179 (_ BitVec 32) List!24231) Bool)

(assert (=> b!1110674 (= res!741187 (arrayNoDuplicates!0 lt!496208 #b00000000000000000000000000000000 Nil!24228))))

(declare-fun call!46810 () ListLongMap!15515)

(declare-fun b!1110675 () Bool)

(declare-fun -!1044 (ListLongMap!15515 (_ BitVec 64)) ListLongMap!15515)

(assert (=> b!1110675 (= e!633400 (= call!46809 (-!1044 call!46810 k!934)))))

(declare-fun b!1110676 () Bool)

(declare-fun e!633405 () Bool)

(assert (=> b!1110676 (= e!633405 (and e!633404 mapRes!43264))))

(declare-fun condMapEmpty!43264 () Bool)

(declare-fun mapDefault!43264 () ValueCell!13106)

