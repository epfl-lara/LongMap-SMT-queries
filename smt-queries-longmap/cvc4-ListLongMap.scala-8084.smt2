; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99374 () Bool)

(assert start!99374)

(declare-fun b_free!24953 () Bool)

(declare-fun b_next!24953 () Bool)

(assert (=> start!99374 (= b_free!24953 (not b_next!24953))))

(declare-fun tp!87572 () Bool)

(declare-fun b_and!40773 () Bool)

(assert (=> start!99374 (= tp!87572 b_and!40773)))

(declare-fun b!1172467 () Bool)

(declare-fun e!666433 () Bool)

(assert (=> b!1172467 (= e!666433 true)))

(declare-fun lt!528296 () Bool)

(declare-datatypes ((List!25644 0))(
  ( (Nil!25641) (Cons!25640 (h!26849 (_ BitVec 64)) (t!37589 List!25644)) )
))
(declare-fun contains!6857 (List!25644 (_ BitVec 64)) Bool)

(assert (=> b!1172467 (= lt!528296 (contains!6857 Nil!25641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172468 () Bool)

(declare-fun e!666428 () Bool)

(declare-fun tp_is_empty!29483 () Bool)

(assert (=> b!1172468 (= e!666428 tp_is_empty!29483)))

(declare-fun b!1172469 () Bool)

(declare-fun res!778475 () Bool)

(assert (=> b!1172469 (=> res!778475 e!666433)))

(declare-fun noDuplicate!1619 (List!25644) Bool)

(assert (=> b!1172469 (= res!778475 (not (noDuplicate!1619 Nil!25641)))))

(declare-fun b!1172470 () Bool)

(declare-fun e!666431 () Bool)

(assert (=> b!1172470 (= e!666431 e!666433)))

(declare-fun res!778476 () Bool)

(assert (=> b!1172470 (=> res!778476 e!666433)))

(declare-datatypes ((array!75779 0))(
  ( (array!75780 (arr!36539 (Array (_ BitVec 32) (_ BitVec 64))) (size!37075 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75779)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172470 (= res!778476 (or (bvsge (size!37075 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37075 _keys!1208)) (bvsge from!1455 (size!37075 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!75779 (_ BitVec 32) List!25644) Bool)

(assert (=> b!1172470 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25641)))

(declare-datatypes ((Unit!38660 0))(
  ( (Unit!38661) )
))
(declare-fun lt!528300 () Unit!38660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75779 (_ BitVec 32) (_ BitVec 32)) Unit!38660)

(assert (=> b!1172470 (= lt!528300 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172470 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528293 () Unit!38660)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75779 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38660)

(assert (=> b!1172470 (= lt!528293 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172472 () Bool)

(declare-fun e!666423 () Bool)

(assert (=> b!1172472 (= e!666423 tp_is_empty!29483)))

(declare-fun b!1172473 () Bool)

(declare-fun res!778470 () Bool)

(declare-fun e!666427 () Bool)

(assert (=> b!1172473 (=> (not res!778470) (not e!666427))))

(assert (=> b!1172473 (= res!778470 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37075 _keys!1208))))))

(declare-fun b!1172474 () Bool)

(declare-fun e!666424 () Bool)

(declare-fun mapRes!46052 () Bool)

(assert (=> b!1172474 (= e!666424 (and e!666423 mapRes!46052))))

(declare-fun condMapEmpty!46052 () Bool)

(declare-datatypes ((V!44437 0))(
  ( (V!44438 (val!14798 Int)) )
))
(declare-datatypes ((ValueCell!14032 0))(
  ( (ValueCellFull!14032 (v!17436 V!44437)) (EmptyCell!14032) )
))
(declare-datatypes ((array!75781 0))(
  ( (array!75782 (arr!36540 (Array (_ BitVec 32) ValueCell!14032)) (size!37076 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75781)

(declare-fun mapDefault!46052 () ValueCell!14032)

