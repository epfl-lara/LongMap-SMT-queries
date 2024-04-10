; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97632 () Bool)

(assert start!97632)

(declare-fun b!1115562 () Bool)

(declare-fun res!744769 () Bool)

(declare-fun e!635691 () Bool)

(assert (=> b!1115562 (=> (not res!744769) (not e!635691))))

(declare-datatypes ((array!72627 0))(
  ( (array!72628 (arr!34966 (Array (_ BitVec 32) (_ BitVec 64))) (size!35502 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72627)

(declare-datatypes ((List!24350 0))(
  ( (Nil!24347) (Cons!24346 (h!25555 (_ BitVec 64)) (t!34831 List!24350)) )
))
(declare-fun arrayNoDuplicates!0 (array!72627 (_ BitVec 32) List!24350) Bool)

(assert (=> b!1115562 (= res!744769 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24347))))

(declare-fun b!1115563 () Bool)

(declare-fun e!635687 () Bool)

(assert (=> b!1115563 (= e!635687 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115563 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36614 0))(
  ( (Unit!36615) )
))
(declare-fun lt!497000 () Unit!36614)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72627 (_ BitVec 64) (_ BitVec 32)) Unit!36614)

(assert (=> b!1115563 (= lt!497000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1115564 () Bool)

(declare-fun res!744764 () Bool)

(assert (=> b!1115564 (=> (not res!744764) (not e!635691))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72627 (_ BitVec 32)) Bool)

(assert (=> b!1115564 (= res!744764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43612 () Bool)

(declare-fun mapRes!43612 () Bool)

(declare-fun tp!82856 () Bool)

(declare-fun e!635690 () Bool)

(assert (=> mapNonEmpty!43612 (= mapRes!43612 (and tp!82856 e!635690))))

(declare-datatypes ((V!42277 0))(
  ( (V!42278 (val!13988 Int)) )
))
(declare-datatypes ((ValueCell!13222 0))(
  ( (ValueCellFull!13222 (v!16621 V!42277)) (EmptyCell!13222) )
))
(declare-fun mapValue!43612 () ValueCell!13222)

(declare-fun mapRest!43612 () (Array (_ BitVec 32) ValueCell!13222))

(declare-fun mapKey!43612 () (_ BitVec 32))

(declare-datatypes ((array!72629 0))(
  ( (array!72630 (arr!34967 (Array (_ BitVec 32) ValueCell!13222)) (size!35503 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72629)

(assert (=> mapNonEmpty!43612 (= (arr!34967 _values!996) (store mapRest!43612 mapKey!43612 mapValue!43612))))

(declare-fun res!744770 () Bool)

(assert (=> start!97632 (=> (not res!744770) (not e!635691))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97632 (= res!744770 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35502 _keys!1208))))))

(assert (=> start!97632 e!635691))

(declare-fun array_inv!26878 (array!72627) Bool)

(assert (=> start!97632 (array_inv!26878 _keys!1208)))

(assert (=> start!97632 true))

(declare-fun e!635688 () Bool)

(declare-fun array_inv!26879 (array!72629) Bool)

(assert (=> start!97632 (and (array_inv!26879 _values!996) e!635688)))

(declare-fun b!1115565 () Bool)

(declare-fun res!744763 () Bool)

(assert (=> b!1115565 (=> (not res!744763) (not e!635691))))

(assert (=> b!1115565 (= res!744763 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35502 _keys!1208))))))

(declare-fun b!1115566 () Bool)

(declare-fun res!744765 () Bool)

(assert (=> b!1115566 (=> (not res!744765) (not e!635691))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115566 (= res!744765 (and (= (size!35503 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35502 _keys!1208) (size!35503 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115567 () Bool)

(declare-fun e!635689 () Bool)

(assert (=> b!1115567 (= e!635688 (and e!635689 mapRes!43612))))

(declare-fun condMapEmpty!43612 () Bool)

(declare-fun mapDefault!43612 () ValueCell!13222)

