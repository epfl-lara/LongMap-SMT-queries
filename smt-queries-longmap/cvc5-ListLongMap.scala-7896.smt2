; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98120 () Bool)

(assert start!98120)

(declare-fun b_free!23821 () Bool)

(declare-fun b_next!23821 () Bool)

(assert (=> start!98120 (= b_free!23821 (not b_next!23821))))

(declare-fun tp!84166 () Bool)

(declare-fun b_and!38425 () Bool)

(assert (=> start!98120 (= tp!84166 b_and!38425)))

(declare-fun b!1127587 () Bool)

(declare-fun e!641780 () Bool)

(declare-fun tp_is_empty!28351 () Bool)

(assert (=> b!1127587 (= e!641780 tp_is_empty!28351)))

(declare-fun b!1127588 () Bool)

(declare-fun res!753523 () Bool)

(declare-fun e!641778 () Bool)

(assert (=> b!1127588 (=> (not res!753523) (not e!641778))))

(declare-datatypes ((array!73563 0))(
  ( (array!73564 (arr!35434 (Array (_ BitVec 32) (_ BitVec 64))) (size!35970 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73563)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73563 (_ BitVec 32)) Bool)

(assert (=> b!1127588 (= res!753523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127589 () Bool)

(declare-fun e!641784 () Bool)

(assert (=> b!1127589 (= e!641778 e!641784)))

(declare-fun res!753524 () Bool)

(assert (=> b!1127589 (=> (not res!753524) (not e!641784))))

(declare-fun lt!500648 () array!73563)

(assert (=> b!1127589 (= res!753524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500648 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127589 (= lt!500648 (array!73564 (store (arr!35434 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35970 _keys!1208)))))

(declare-fun b!1127590 () Bool)

(declare-fun e!641783 () Bool)

(declare-fun e!641786 () Bool)

(assert (=> b!1127590 (= e!641783 e!641786)))

(declare-fun res!753531 () Bool)

(assert (=> b!1127590 (=> res!753531 e!641786)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1127590 (= res!753531 (not (= (select (arr!35434 _keys!1208) from!1455) k!934)))))

(declare-fun e!641779 () Bool)

(assert (=> b!1127590 e!641779))

(declare-fun c!109722 () Bool)

(assert (=> b!1127590 (= c!109722 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42929 0))(
  ( (V!42930 (val!14232 Int)) )
))
(declare-fun zeroValue!944 () V!42929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13466 0))(
  ( (ValueCellFull!13466 (v!16865 V!42929)) (EmptyCell!13466) )
))
(declare-datatypes ((array!73565 0))(
  ( (array!73566 (arr!35435 (Array (_ BitVec 32) ValueCell!13466)) (size!35971 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73565)

(declare-fun minValue!944 () V!42929)

(declare-datatypes ((Unit!36948 0))(
  ( (Unit!36949) )
))
(declare-fun lt!500642 () Unit!36948)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!394 (array!73563 array!73565 (_ BitVec 32) (_ BitVec 32) V!42929 V!42929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36948)

(assert (=> b!1127590 (= lt!500642 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127591 () Bool)

(assert (=> b!1127591 (= e!641786 true)))

(declare-fun lt!500643 () Bool)

(declare-datatypes ((tuple2!17902 0))(
  ( (tuple2!17903 (_1!8962 (_ BitVec 64)) (_2!8962 V!42929)) )
))
(declare-datatypes ((List!24674 0))(
  ( (Nil!24671) (Cons!24670 (h!25879 tuple2!17902) (t!35487 List!24674)) )
))
(declare-datatypes ((ListLongMap!15871 0))(
  ( (ListLongMap!15872 (toList!7951 List!24674)) )
))
(declare-fun contains!6481 (ListLongMap!15871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4439 (array!73563 array!73565 (_ BitVec 32) (_ BitVec 32) V!42929 V!42929 (_ BitVec 32) Int) ListLongMap!15871)

(assert (=> b!1127591 (= lt!500643 (contains!6481 (getCurrentListMapNoExtraKeys!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1127592 () Bool)

(declare-fun e!641787 () Bool)

(assert (=> b!1127592 (= e!641787 e!641783)))

(declare-fun res!753529 () Bool)

(assert (=> b!1127592 (=> res!753529 e!641783)))

(assert (=> b!1127592 (= res!753529 (not (= from!1455 i!673)))))

(declare-fun lt!500646 () ListLongMap!15871)

(declare-fun lt!500647 () array!73565)

(assert (=> b!1127592 (= lt!500646 (getCurrentListMapNoExtraKeys!4439 lt!500648 lt!500647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2525 (Int (_ BitVec 64)) V!42929)

(assert (=> b!1127592 (= lt!500647 (array!73566 (store (arr!35435 _values!996) i!673 (ValueCellFull!13466 (dynLambda!2525 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35971 _values!996)))))

(declare-fun lt!500644 () ListLongMap!15871)

(assert (=> b!1127592 (= lt!500644 (getCurrentListMapNoExtraKeys!4439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127593 () Bool)

(declare-fun res!753532 () Bool)

(assert (=> b!1127593 (=> (not res!753532) (not e!641784))))

(declare-datatypes ((List!24675 0))(
  ( (Nil!24672) (Cons!24671 (h!25880 (_ BitVec 64)) (t!35488 List!24675)) )
))
(declare-fun arrayNoDuplicates!0 (array!73563 (_ BitVec 32) List!24675) Bool)

(assert (=> b!1127593 (= res!753532 (arrayNoDuplicates!0 lt!500648 #b00000000000000000000000000000000 Nil!24672))))

(declare-fun b!1127594 () Bool)

(declare-fun res!753526 () Bool)

(assert (=> b!1127594 (=> (not res!753526) (not e!641778))))

(assert (=> b!1127594 (= res!753526 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24672))))

(declare-fun b!1127595 () Bool)

(declare-fun res!753521 () Bool)

(assert (=> b!1127595 (=> (not res!753521) (not e!641778))))

(assert (=> b!1127595 (= res!753521 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35970 _keys!1208))))))

(declare-fun mapNonEmpty!44344 () Bool)

(declare-fun mapRes!44344 () Bool)

(declare-fun tp!84167 () Bool)

(assert (=> mapNonEmpty!44344 (= mapRes!44344 (and tp!84167 e!641780))))

(declare-fun mapKey!44344 () (_ BitVec 32))

(declare-fun mapRest!44344 () (Array (_ BitVec 32) ValueCell!13466))

(declare-fun mapValue!44344 () ValueCell!13466)

(assert (=> mapNonEmpty!44344 (= (arr!35435 _values!996) (store mapRest!44344 mapKey!44344 mapValue!44344))))

(declare-fun b!1127596 () Bool)

(declare-fun res!753530 () Bool)

(assert (=> b!1127596 (=> (not res!753530) (not e!641778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127596 (= res!753530 (validKeyInArray!0 k!934))))

(declare-fun bm!47742 () Bool)

(declare-fun call!47746 () ListLongMap!15871)

(assert (=> bm!47742 (= call!47746 (getCurrentListMapNoExtraKeys!4439 lt!500648 lt!500647 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127597 () Bool)

(declare-fun res!753522 () Bool)

(assert (=> b!1127597 (=> (not res!753522) (not e!641778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127597 (= res!753522 (validMask!0 mask!1564))))

(declare-fun b!1127598 () Bool)

(assert (=> b!1127598 (= e!641784 (not e!641787))))

(declare-fun res!753525 () Bool)

(assert (=> b!1127598 (=> res!753525 e!641787)))

(assert (=> b!1127598 (= res!753525 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127598 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500645 () Unit!36948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73563 (_ BitVec 64) (_ BitVec 32)) Unit!36948)

(assert (=> b!1127598 (= lt!500645 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1127599 () Bool)

(declare-fun call!47745 () ListLongMap!15871)

(assert (=> b!1127599 (= e!641779 (= call!47746 call!47745))))

(declare-fun b!1127600 () Bool)

(declare-fun e!641782 () Bool)

(declare-fun e!641781 () Bool)

(assert (=> b!1127600 (= e!641782 (and e!641781 mapRes!44344))))

(declare-fun condMapEmpty!44344 () Bool)

(declare-fun mapDefault!44344 () ValueCell!13466)

