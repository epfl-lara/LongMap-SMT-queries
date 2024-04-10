; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97236 () Bool)

(assert start!97236)

(declare-fun b!1106616 () Bool)

(declare-fun e!631460 () Bool)

(declare-fun e!631457 () Bool)

(assert (=> b!1106616 (= e!631460 e!631457)))

(declare-fun res!738508 () Bool)

(assert (=> b!1106616 (=> (not res!738508) (not e!631457))))

(declare-datatypes ((array!71851 0))(
  ( (array!71852 (arr!34578 (Array (_ BitVec 32) (_ BitVec 64))) (size!35114 (_ BitVec 32))) )
))
(declare-fun lt!495488 () array!71851)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71851 (_ BitVec 32)) Bool)

(assert (=> b!1106616 (= res!738508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495488 mask!1564))))

(declare-fun _keys!1208 () array!71851)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106616 (= lt!495488 (array!71852 (store (arr!34578 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35114 _keys!1208)))))

(declare-fun b!1106617 () Bool)

(declare-fun e!631461 () Bool)

(declare-fun tp_is_empty!27467 () Bool)

(assert (=> b!1106617 (= e!631461 tp_is_empty!27467)))

(declare-fun b!1106618 () Bool)

(declare-fun res!738500 () Bool)

(assert (=> b!1106618 (=> (not res!738500) (not e!631460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106618 (= res!738500 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43018 () Bool)

(declare-fun mapRes!43018 () Bool)

(declare-fun tp!81938 () Bool)

(assert (=> mapNonEmpty!43018 (= mapRes!43018 (and tp!81938 e!631461))))

(declare-datatypes ((V!41749 0))(
  ( (V!41750 (val!13790 Int)) )
))
(declare-datatypes ((ValueCell!13024 0))(
  ( (ValueCellFull!13024 (v!16423 V!41749)) (EmptyCell!13024) )
))
(declare-fun mapRest!43018 () (Array (_ BitVec 32) ValueCell!13024))

(declare-fun mapValue!43018 () ValueCell!13024)

(declare-fun mapKey!43018 () (_ BitVec 32))

(declare-datatypes ((array!71853 0))(
  ( (array!71854 (arr!34579 (Array (_ BitVec 32) ValueCell!13024)) (size!35115 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71853)

(assert (=> mapNonEmpty!43018 (= (arr!34579 _values!996) (store mapRest!43018 mapKey!43018 mapValue!43018))))

(declare-fun res!738499 () Bool)

(assert (=> start!97236 (=> (not res!738499) (not e!631460))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97236 (= res!738499 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35114 _keys!1208))))))

(assert (=> start!97236 e!631460))

(declare-fun array_inv!26612 (array!71851) Bool)

(assert (=> start!97236 (array_inv!26612 _keys!1208)))

(assert (=> start!97236 true))

(declare-fun e!631459 () Bool)

(declare-fun array_inv!26613 (array!71853) Bool)

(assert (=> start!97236 (and (array_inv!26613 _values!996) e!631459)))

(declare-fun b!1106619 () Bool)

(assert (=> b!1106619 (= e!631457 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106619 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36316 0))(
  ( (Unit!36317) )
))
(declare-fun lt!495487 () Unit!36316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71851 (_ BitVec 64) (_ BitVec 32)) Unit!36316)

(assert (=> b!1106619 (= lt!495487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106620 () Bool)

(declare-fun res!738502 () Bool)

(assert (=> b!1106620 (=> (not res!738502) (not e!631460))))

(assert (=> b!1106620 (= res!738502 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35114 _keys!1208))))))

(declare-fun b!1106621 () Bool)

(declare-fun res!738505 () Bool)

(assert (=> b!1106621 (=> (not res!738505) (not e!631460))))

(assert (=> b!1106621 (= res!738505 (= (select (arr!34578 _keys!1208) i!673) k!934))))

(declare-fun b!1106622 () Bool)

(declare-fun res!738507 () Bool)

(assert (=> b!1106622 (=> (not res!738507) (not e!631460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106622 (= res!738507 (validKeyInArray!0 k!934))))

(declare-fun b!1106623 () Bool)

(declare-fun res!738503 () Bool)

(assert (=> b!1106623 (=> (not res!738503) (not e!631460))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106623 (= res!738503 (and (= (size!35115 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35114 _keys!1208) (size!35115 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106624 () Bool)

(declare-fun res!738504 () Bool)

(assert (=> b!1106624 (=> (not res!738504) (not e!631460))))

(declare-datatypes ((List!24100 0))(
  ( (Nil!24097) (Cons!24096 (h!25305 (_ BitVec 64)) (t!34365 List!24100)) )
))
(declare-fun arrayNoDuplicates!0 (array!71851 (_ BitVec 32) List!24100) Bool)

(assert (=> b!1106624 (= res!738504 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24097))))

(declare-fun b!1106625 () Bool)

(declare-fun res!738506 () Bool)

(assert (=> b!1106625 (=> (not res!738506) (not e!631457))))

(assert (=> b!1106625 (= res!738506 (arrayNoDuplicates!0 lt!495488 #b00000000000000000000000000000000 Nil!24097))))

(declare-fun mapIsEmpty!43018 () Bool)

(assert (=> mapIsEmpty!43018 mapRes!43018))

(declare-fun b!1106626 () Bool)

(declare-fun e!631458 () Bool)

(assert (=> b!1106626 (= e!631458 tp_is_empty!27467)))

(declare-fun b!1106627 () Bool)

(declare-fun res!738501 () Bool)

(assert (=> b!1106627 (=> (not res!738501) (not e!631460))))

(assert (=> b!1106627 (= res!738501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106628 () Bool)

(assert (=> b!1106628 (= e!631459 (and e!631458 mapRes!43018))))

(declare-fun condMapEmpty!43018 () Bool)

(declare-fun mapDefault!43018 () ValueCell!13024)

