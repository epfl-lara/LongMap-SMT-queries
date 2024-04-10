; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97482 () Bool)

(assert start!97482)

(declare-fun b!1112637 () Bool)

(declare-fun e!634338 () Bool)

(declare-fun tp_is_empty!27713 () Bool)

(assert (=> b!1112637 (= e!634338 tp_is_empty!27713)))

(declare-fun b!1112638 () Bool)

(declare-fun res!742513 () Bool)

(declare-fun e!634341 () Bool)

(assert (=> b!1112638 (=> (not res!742513) (not e!634341))))

(declare-datatypes ((array!72339 0))(
  ( (array!72340 (arr!34822 (Array (_ BitVec 32) (_ BitVec 64))) (size!35358 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72339)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72339 (_ BitVec 32)) Bool)

(assert (=> b!1112638 (= res!742513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112639 () Bool)

(declare-fun res!742514 () Bool)

(assert (=> b!1112639 (=> (not res!742514) (not e!634341))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42077 0))(
  ( (V!42078 (val!13913 Int)) )
))
(declare-datatypes ((ValueCell!13147 0))(
  ( (ValueCellFull!13147 (v!16546 V!42077)) (EmptyCell!13147) )
))
(declare-datatypes ((array!72341 0))(
  ( (array!72342 (arr!34823 (Array (_ BitVec 32) ValueCell!13147)) (size!35359 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72341)

(assert (=> b!1112639 (= res!742514 (and (= (size!35359 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35358 _keys!1208) (size!35359 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43387 () Bool)

(declare-fun mapRes!43387 () Bool)

(declare-fun tp!82631 () Bool)

(declare-fun e!634336 () Bool)

(assert (=> mapNonEmpty!43387 (= mapRes!43387 (and tp!82631 e!634336))))

(declare-fun mapKey!43387 () (_ BitVec 32))

(declare-fun mapValue!43387 () ValueCell!13147)

(declare-fun mapRest!43387 () (Array (_ BitVec 32) ValueCell!13147))

(assert (=> mapNonEmpty!43387 (= (arr!34823 _values!996) (store mapRest!43387 mapKey!43387 mapValue!43387))))

(declare-fun res!742518 () Bool)

(assert (=> start!97482 (=> (not res!742518) (not e!634341))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97482 (= res!742518 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35358 _keys!1208))))))

(assert (=> start!97482 e!634341))

(declare-fun array_inv!26780 (array!72339) Bool)

(assert (=> start!97482 (array_inv!26780 _keys!1208)))

(assert (=> start!97482 true))

(declare-fun e!634339 () Bool)

(declare-fun array_inv!26781 (array!72341) Bool)

(assert (=> start!97482 (and (array_inv!26781 _values!996) e!634339)))

(declare-fun b!1112640 () Bool)

(declare-fun e!634340 () Bool)

(assert (=> b!1112640 (= e!634340 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112640 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36512 0))(
  ( (Unit!36513) )
))
(declare-fun lt!496549 () Unit!36512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72339 (_ BitVec 64) (_ BitVec 32)) Unit!36512)

(assert (=> b!1112640 (= lt!496549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1112641 () Bool)

(declare-fun res!742521 () Bool)

(assert (=> b!1112641 (=> (not res!742521) (not e!634340))))

(declare-fun lt!496550 () array!72339)

(declare-datatypes ((List!24295 0))(
  ( (Nil!24292) (Cons!24291 (h!25500 (_ BitVec 64)) (t!34776 List!24295)) )
))
(declare-fun arrayNoDuplicates!0 (array!72339 (_ BitVec 32) List!24295) Bool)

(assert (=> b!1112641 (= res!742521 (arrayNoDuplicates!0 lt!496550 #b00000000000000000000000000000000 Nil!24292))))

(declare-fun b!1112642 () Bool)

(declare-fun res!742520 () Bool)

(assert (=> b!1112642 (=> (not res!742520) (not e!634341))))

(assert (=> b!1112642 (= res!742520 (= (select (arr!34822 _keys!1208) i!673) k!934))))

(declare-fun b!1112643 () Bool)

(declare-fun res!742522 () Bool)

(assert (=> b!1112643 (=> (not res!742522) (not e!634341))))

(assert (=> b!1112643 (= res!742522 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24292))))

(declare-fun mapIsEmpty!43387 () Bool)

(assert (=> mapIsEmpty!43387 mapRes!43387))

(declare-fun b!1112644 () Bool)

(assert (=> b!1112644 (= e!634339 (and e!634338 mapRes!43387))))

(declare-fun condMapEmpty!43387 () Bool)

(declare-fun mapDefault!43387 () ValueCell!13147)

