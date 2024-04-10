; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97532 () Bool)

(assert start!97532)

(declare-fun b!1113612 () Bool)

(declare-fun res!743270 () Bool)

(declare-fun e!634789 () Bool)

(assert (=> b!1113612 (=> (not res!743270) (not e!634789))))

(declare-datatypes ((array!72433 0))(
  ( (array!72434 (arr!34869 (Array (_ BitVec 32) (_ BitVec 64))) (size!35405 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72433)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72433 (_ BitVec 32)) Bool)

(assert (=> b!1113612 (= res!743270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113613 () Bool)

(declare-fun res!743268 () Bool)

(declare-fun e!634787 () Bool)

(assert (=> b!1113613 (=> (not res!743268) (not e!634787))))

(declare-fun lt!496700 () array!72433)

(declare-datatypes ((List!24312 0))(
  ( (Nil!24309) (Cons!24308 (h!25517 (_ BitVec 64)) (t!34793 List!24312)) )
))
(declare-fun arrayNoDuplicates!0 (array!72433 (_ BitVec 32) List!24312) Bool)

(assert (=> b!1113613 (= res!743268 (arrayNoDuplicates!0 lt!496700 #b00000000000000000000000000000000 Nil!24309))))

(declare-fun b!1113614 () Bool)

(assert (=> b!1113614 (= e!634787 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113614 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36544 0))(
  ( (Unit!36545) )
))
(declare-fun lt!496699 () Unit!36544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72433 (_ BitVec 64) (_ BitVec 32)) Unit!36544)

(assert (=> b!1113614 (= lt!496699 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1113615 () Bool)

(declare-fun res!743272 () Bool)

(assert (=> b!1113615 (=> (not res!743272) (not e!634789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113615 (= res!743272 (validKeyInArray!0 k!934))))

(declare-fun b!1113616 () Bool)

(declare-fun e!634786 () Bool)

(declare-fun e!634791 () Bool)

(declare-fun mapRes!43462 () Bool)

(assert (=> b!1113616 (= e!634786 (and e!634791 mapRes!43462))))

(declare-fun condMapEmpty!43462 () Bool)

(declare-datatypes ((V!42145 0))(
  ( (V!42146 (val!13938 Int)) )
))
(declare-datatypes ((ValueCell!13172 0))(
  ( (ValueCellFull!13172 (v!16571 V!42145)) (EmptyCell!13172) )
))
(declare-datatypes ((array!72435 0))(
  ( (array!72436 (arr!34870 (Array (_ BitVec 32) ValueCell!13172)) (size!35406 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72435)

(declare-fun mapDefault!43462 () ValueCell!13172)

