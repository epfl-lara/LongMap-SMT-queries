; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98118 () Bool)

(assert start!98118)

(declare-fun b_free!23819 () Bool)

(declare-fun b_next!23819 () Bool)

(assert (=> start!98118 (= b_free!23819 (not b_next!23819))))

(declare-fun tp!84161 () Bool)

(declare-fun b_and!38421 () Bool)

(assert (=> start!98118 (= tp!84161 b_and!38421)))

(declare-fun mapIsEmpty!44341 () Bool)

(declare-fun mapRes!44341 () Bool)

(assert (=> mapIsEmpty!44341 mapRes!44341))

(declare-fun b!1127531 () Bool)

(declare-fun e!641754 () Bool)

(declare-fun e!641748 () Bool)

(assert (=> b!1127531 (= e!641754 e!641748)))

(declare-fun res!753492 () Bool)

(assert (=> b!1127531 (=> res!753492 e!641748)))

(declare-datatypes ((array!73559 0))(
  ( (array!73560 (arr!35432 (Array (_ BitVec 32) (_ BitVec 64))) (size!35968 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73559)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127531 (= res!753492 (not (= (select (arr!35432 _keys!1208) from!1455) k!934)))))

(declare-fun e!641751 () Bool)

(assert (=> b!1127531 e!641751))

(declare-fun c!109719 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127531 (= c!109719 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42925 0))(
  ( (V!42926 (val!14231 Int)) )
))
(declare-fun zeroValue!944 () V!42925)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36946 0))(
  ( (Unit!36947) )
))
(declare-fun lt!500622 () Unit!36946)

(declare-datatypes ((ValueCell!13465 0))(
  ( (ValueCellFull!13465 (v!16864 V!42925)) (EmptyCell!13465) )
))
(declare-datatypes ((array!73561 0))(
  ( (array!73562 (arr!35433 (Array (_ BitVec 32) ValueCell!13465)) (size!35969 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73561)

(declare-fun minValue!944 () V!42925)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!393 (array!73559 array!73561 (_ BitVec 32) (_ BitVec 32) V!42925 V!42925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36946)

(assert (=> b!1127531 (= lt!500622 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127532 () Bool)

(declare-fun res!753490 () Bool)

(declare-fun e!641750 () Bool)

(assert (=> b!1127532 (=> (not res!753490) (not e!641750))))

(declare-datatypes ((List!24673 0))(
  ( (Nil!24670) (Cons!24669 (h!25878 (_ BitVec 64)) (t!35484 List!24673)) )
))
(declare-fun arrayNoDuplicates!0 (array!73559 (_ BitVec 32) List!24673) Bool)

(assert (=> b!1127532 (= res!753490 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24670))))

(declare-fun b!1127533 () Bool)

(declare-fun res!753486 () Bool)

(assert (=> b!1127533 (=> (not res!753486) (not e!641750))))

(assert (=> b!1127533 (= res!753486 (= (select (arr!35432 _keys!1208) i!673) k!934))))

(declare-fun b!1127534 () Bool)

(declare-fun e!641749 () Bool)

(declare-fun e!641753 () Bool)

(assert (=> b!1127534 (= e!641749 (and e!641753 mapRes!44341))))

(declare-fun condMapEmpty!44341 () Bool)

(declare-fun mapDefault!44341 () ValueCell!13465)

