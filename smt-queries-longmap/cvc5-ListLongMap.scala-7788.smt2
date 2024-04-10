; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97472 () Bool)

(assert start!97472)

(declare-fun b!1112442 () Bool)

(declare-fun e!634251 () Bool)

(declare-fun tp_is_empty!27703 () Bool)

(assert (=> b!1112442 (= e!634251 tp_is_empty!27703)))

(declare-fun b!1112443 () Bool)

(declare-fun res!742367 () Bool)

(declare-fun e!634246 () Bool)

(assert (=> b!1112443 (=> (not res!742367) (not e!634246))))

(declare-datatypes ((array!72319 0))(
  ( (array!72320 (arr!34812 (Array (_ BitVec 32) (_ BitVec 64))) (size!35348 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72319)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72319 (_ BitVec 32)) Bool)

(assert (=> b!1112443 (= res!742367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112444 () Bool)

(declare-fun e!634250 () Bool)

(assert (=> b!1112444 (= e!634246 e!634250)))

(declare-fun res!742364 () Bool)

(assert (=> b!1112444 (=> (not res!742364) (not e!634250))))

(declare-fun lt!496520 () array!72319)

(assert (=> b!1112444 (= res!742364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496520 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112444 (= lt!496520 (array!72320 (store (arr!34812 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35348 _keys!1208)))))

(declare-fun b!1112445 () Bool)

(declare-fun res!742368 () Bool)

(assert (=> b!1112445 (=> (not res!742368) (not e!634246))))

(assert (=> b!1112445 (= res!742368 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35348 _keys!1208))))))

(declare-fun b!1112446 () Bool)

(declare-fun res!742372 () Bool)

(assert (=> b!1112446 (=> (not res!742372) (not e!634246))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112446 (= res!742372 (validKeyInArray!0 k!934))))

(declare-fun b!1112447 () Bool)

(declare-fun res!742370 () Bool)

(assert (=> b!1112447 (=> (not res!742370) (not e!634246))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42065 0))(
  ( (V!42066 (val!13908 Int)) )
))
(declare-datatypes ((ValueCell!13142 0))(
  ( (ValueCellFull!13142 (v!16541 V!42065)) (EmptyCell!13142) )
))
(declare-datatypes ((array!72321 0))(
  ( (array!72322 (arr!34813 (Array (_ BitVec 32) ValueCell!13142)) (size!35349 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72321)

(assert (=> b!1112447 (= res!742370 (and (= (size!35349 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35348 _keys!1208) (size!35349 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112448 () Bool)

(declare-fun res!742365 () Bool)

(assert (=> b!1112448 (=> (not res!742365) (not e!634250))))

(declare-datatypes ((List!24290 0))(
  ( (Nil!24287) (Cons!24286 (h!25495 (_ BitVec 64)) (t!34771 List!24290)) )
))
(declare-fun arrayNoDuplicates!0 (array!72319 (_ BitVec 32) List!24290) Bool)

(assert (=> b!1112448 (= res!742365 (arrayNoDuplicates!0 lt!496520 #b00000000000000000000000000000000 Nil!24287))))

(declare-fun b!1112449 () Bool)

(declare-fun e!634249 () Bool)

(declare-fun mapRes!43372 () Bool)

(assert (=> b!1112449 (= e!634249 (and e!634251 mapRes!43372))))

(declare-fun condMapEmpty!43372 () Bool)

(declare-fun mapDefault!43372 () ValueCell!13142)

