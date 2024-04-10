; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97512 () Bool)

(assert start!97512)

(declare-fun mapNonEmpty!43432 () Bool)

(declare-fun mapRes!43432 () Bool)

(declare-fun tp!82676 () Bool)

(declare-fun e!634610 () Bool)

(assert (=> mapNonEmpty!43432 (= mapRes!43432 (and tp!82676 e!634610))))

(declare-datatypes ((V!42117 0))(
  ( (V!42118 (val!13928 Int)) )
))
(declare-datatypes ((ValueCell!13162 0))(
  ( (ValueCellFull!13162 (v!16561 V!42117)) (EmptyCell!13162) )
))
(declare-fun mapRest!43432 () (Array (_ BitVec 32) ValueCell!13162))

(declare-fun mapValue!43432 () ValueCell!13162)

(declare-fun mapKey!43432 () (_ BitVec 32))

(declare-datatypes ((array!72395 0))(
  ( (array!72396 (arr!34850 (Array (_ BitVec 32) ValueCell!13162)) (size!35386 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72395)

(assert (=> mapNonEmpty!43432 (= (arr!34850 _values!996) (store mapRest!43432 mapKey!43432 mapValue!43432))))

(declare-fun b!1113222 () Bool)

(declare-fun res!742965 () Bool)

(declare-fun e!634608 () Bool)

(assert (=> b!1113222 (=> (not res!742965) (not e!634608))))

(declare-datatypes ((array!72397 0))(
  ( (array!72398 (arr!34851 (Array (_ BitVec 32) (_ BitVec 64))) (size!35387 (_ BitVec 32))) )
))
(declare-fun lt!496639 () array!72397)

(declare-datatypes ((List!24307 0))(
  ( (Nil!24304) (Cons!24303 (h!25512 (_ BitVec 64)) (t!34788 List!24307)) )
))
(declare-fun arrayNoDuplicates!0 (array!72397 (_ BitVec 32) List!24307) Bool)

(assert (=> b!1113222 (= res!742965 (arrayNoDuplicates!0 lt!496639 #b00000000000000000000000000000000 Nil!24304))))

(declare-fun b!1113223 () Bool)

(declare-fun res!742968 () Bool)

(declare-fun e!634611 () Bool)

(assert (=> b!1113223 (=> (not res!742968) (not e!634611))))

(declare-fun _keys!1208 () array!72397)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113223 (= res!742968 (and (= (size!35386 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35387 _keys!1208) (size!35386 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113225 () Bool)

(declare-fun res!742971 () Bool)

(assert (=> b!1113225 (=> (not res!742971) (not e!634611))))

(assert (=> b!1113225 (= res!742971 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24304))))

(declare-fun b!1113226 () Bool)

(assert (=> b!1113226 (= e!634611 e!634608)))

(declare-fun res!742970 () Bool)

(assert (=> b!1113226 (=> (not res!742970) (not e!634608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72397 (_ BitVec 32)) Bool)

(assert (=> b!1113226 (= res!742970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496639 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113226 (= lt!496639 (array!72398 (store (arr!34851 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35387 _keys!1208)))))

(declare-fun b!1113227 () Bool)

(declare-fun res!742966 () Bool)

(assert (=> b!1113227 (=> (not res!742966) (not e!634611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113227 (= res!742966 (validMask!0 mask!1564))))

(declare-fun b!1113228 () Bool)

(assert (=> b!1113228 (= e!634608 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113228 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36528 0))(
  ( (Unit!36529) )
))
(declare-fun lt!496640 () Unit!36528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72397 (_ BitVec 64) (_ BitVec 32)) Unit!36528)

(assert (=> b!1113228 (= lt!496640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113229 () Bool)

(declare-fun e!634606 () Bool)

(declare-fun e!634609 () Bool)

(assert (=> b!1113229 (= e!634606 (and e!634609 mapRes!43432))))

(declare-fun condMapEmpty!43432 () Bool)

(declare-fun mapDefault!43432 () ValueCell!13162)

