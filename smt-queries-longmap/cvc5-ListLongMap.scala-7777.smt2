; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97406 () Bool)

(assert start!97406)

(declare-fun b_free!23377 () Bool)

(declare-fun b_next!23377 () Bool)

(assert (=> start!97406 (= b_free!23377 (not b_next!23377))))

(declare-fun tp!82429 () Bool)

(declare-fun b_and!37589 () Bool)

(assert (=> start!97406 (= tp!82429 b_and!37589)))

(declare-fun b!1110827 () Bool)

(declare-fun e!633479 () Bool)

(declare-fun tp_is_empty!27637 () Bool)

(assert (=> b!1110827 (= e!633479 tp_is_empty!27637)))

(declare-fun b!1110828 () Bool)

(declare-datatypes ((V!41977 0))(
  ( (V!41978 (val!13875 Int)) )
))
(declare-datatypes ((ValueCell!13109 0))(
  ( (ValueCellFull!13109 (v!16508 V!41977)) (EmptyCell!13109) )
))
(declare-datatypes ((array!72191 0))(
  ( (array!72192 (arr!34748 (Array (_ BitVec 32) ValueCell!13109)) (size!35284 (_ BitVec 32))) )
))
(declare-fun e!633482 () array!72191)

(declare-fun _values!996 () array!72191)

(assert (=> b!1110828 (= e!633482 _values!996)))

(declare-fun b!1110829 () Bool)

(declare-fun res!741295 () Bool)

(declare-fun e!633474 () Bool)

(assert (=> b!1110829 (=> (not res!741295) (not e!633474))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110829 (= res!741295 (validMask!0 mask!1564))))

(declare-fun b!1110831 () Bool)

(declare-fun res!741288 () Bool)

(assert (=> b!1110831 (=> (not res!741288) (not e!633474))))

(declare-datatypes ((array!72193 0))(
  ( (array!72194 (arr!34749 (Array (_ BitVec 32) (_ BitVec 64))) (size!35285 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72193)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72193 (_ BitVec 32)) Bool)

(assert (=> b!1110831 (= res!741288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110832 () Bool)

(declare-fun e!633481 () Bool)

(declare-fun e!633483 () Bool)

(assert (=> b!1110832 (= e!633481 (not e!633483))))

(declare-fun res!741286 () Bool)

(assert (=> b!1110832 (=> res!741286 e!633483)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1110832 (= res!741286 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35285 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110832 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36454 0))(
  ( (Unit!36455) )
))
(declare-fun lt!496233 () Unit!36454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72193 (_ BitVec 64) (_ BitVec 32)) Unit!36454)

(assert (=> b!1110832 (= lt!496233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1110833 () Bool)

(declare-fun e!633475 () array!72191)

(assert (=> b!1110833 (= e!633475 _values!996)))

(declare-fun mapIsEmpty!43273 () Bool)

(declare-fun mapRes!43273 () Bool)

(assert (=> mapIsEmpty!43273 mapRes!43273))

(declare-fun defaultEntry!1004 () Int)

(declare-fun b!1110834 () Bool)

(declare-fun dynLambda!2397 (Int (_ BitVec 64)) V!41977)

(assert (=> b!1110834 (= e!633482 (array!72192 (store (arr!34748 _values!996) i!673 (ValueCellFull!13109 (dynLambda!2397 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35284 _values!996)))))

(declare-fun b!1110835 () Bool)

(declare-fun res!741291 () Bool)

(assert (=> b!1110835 (=> (not res!741291) (not e!633474))))

(assert (=> b!1110835 (= res!741291 (= (select (arr!34749 _keys!1208) i!673) k!934))))

(declare-fun b!1110836 () Bool)

(assert (=> b!1110836 (= e!633474 e!633481)))

(declare-fun res!741290 () Bool)

(assert (=> b!1110836 (=> (not res!741290) (not e!633481))))

(declare-fun lt!496234 () array!72193)

(assert (=> b!1110836 (= res!741290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496234 mask!1564))))

(assert (=> b!1110836 (= lt!496234 (array!72194 (store (arr!34749 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35285 _keys!1208)))))

(declare-fun b!1110837 () Bool)

(declare-fun res!741293 () Bool)

(assert (=> b!1110837 (=> (not res!741293) (not e!633481))))

(declare-datatypes ((List!24236 0))(
  ( (Nil!24233) (Cons!24232 (h!25441 (_ BitVec 64)) (t!34659 List!24236)) )
))
(declare-fun arrayNoDuplicates!0 (array!72193 (_ BitVec 32) List!24236) Bool)

(assert (=> b!1110837 (= res!741293 (arrayNoDuplicates!0 lt!496234 #b00000000000000000000000000000000 Nil!24233))))

(declare-fun b!1110838 () Bool)

(assert (=> b!1110838 (= e!633483 true)))

(declare-fun e!633476 () Bool)

(assert (=> b!1110838 e!633476))

(declare-fun c!109262 () Bool)

(assert (=> b!1110838 (= c!109262 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41977)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!496235 () Unit!36454)

(declare-fun minValue!944 () V!41977)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!296 (array!72193 array!72191 (_ BitVec 32) (_ BitVec 32) V!41977 V!41977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36454)

(assert (=> b!1110838 (= lt!496235 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110839 () Bool)

(declare-datatypes ((tuple2!17552 0))(
  ( (tuple2!17553 (_1!8787 (_ BitVec 64)) (_2!8787 V!41977)) )
))
(declare-datatypes ((List!24237 0))(
  ( (Nil!24234) (Cons!24233 (h!25442 tuple2!17552) (t!34660 List!24237)) )
))
(declare-datatypes ((ListLongMap!15521 0))(
  ( (ListLongMap!15522 (toList!7776 List!24237)) )
))
(declare-fun call!46828 () ListLongMap!15521)

(declare-fun call!46827 () ListLongMap!15521)

(declare-fun -!1047 (ListLongMap!15521 (_ BitVec 64)) ListLongMap!15521)

(assert (=> b!1110839 (= e!633476 (= call!46827 (-!1047 call!46828 k!934)))))

(declare-fun b!1110840 () Bool)

(declare-fun res!741292 () Bool)

(assert (=> b!1110840 (=> (not res!741292) (not e!633474))))

(assert (=> b!1110840 (= res!741292 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24233))))

(declare-fun b!1110841 () Bool)

(assert (=> b!1110841 (= e!633475 (array!72192 (store (arr!34748 _values!996) i!673 (ValueCellFull!13109 (dynLambda!2397 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35284 _values!996)))))

(declare-fun b!1110830 () Bool)

(assert (=> b!1110830 (= e!633476 (= call!46828 call!46827))))

(declare-fun res!741285 () Bool)

(assert (=> start!97406 (=> (not res!741285) (not e!633474))))

(assert (=> start!97406 (= res!741285 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35285 _keys!1208))))))

(assert (=> start!97406 e!633474))

(assert (=> start!97406 tp_is_empty!27637))

(declare-fun array_inv!26732 (array!72193) Bool)

(assert (=> start!97406 (array_inv!26732 _keys!1208)))

(assert (=> start!97406 true))

(assert (=> start!97406 tp!82429))

(declare-fun e!633478 () Bool)

(declare-fun array_inv!26733 (array!72191) Bool)

(assert (=> start!97406 (and (array_inv!26733 _values!996) e!633478)))

(declare-fun b!1110842 () Bool)

(declare-fun res!741287 () Bool)

(assert (=> b!1110842 (=> (not res!741287) (not e!633474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110842 (= res!741287 (validKeyInArray!0 k!934))))

(declare-fun b!1110843 () Bool)

(declare-fun e!633480 () Bool)

(assert (=> b!1110843 (= e!633478 (and e!633480 mapRes!43273))))

(declare-fun condMapEmpty!43273 () Bool)

(declare-fun mapDefault!43273 () ValueCell!13109)

