; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97226 () Bool)

(assert start!97226)

(declare-fun b!1106421 () Bool)

(declare-fun res!738356 () Bool)

(declare-fun e!631367 () Bool)

(assert (=> b!1106421 (=> (not res!738356) (not e!631367))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71831 0))(
  ( (array!71832 (arr!34568 (Array (_ BitVec 32) (_ BitVec 64))) (size!35104 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71831)

(assert (=> b!1106421 (= res!738356 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35104 _keys!1208))))))

(declare-fun b!1106422 () Bool)

(declare-fun res!738352 () Bool)

(assert (=> b!1106422 (=> (not res!738352) (not e!631367))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106422 (= res!738352 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!43003 () Bool)

(declare-fun mapRes!43003 () Bool)

(assert (=> mapIsEmpty!43003 mapRes!43003))

(declare-fun b!1106423 () Bool)

(declare-fun e!631366 () Bool)

(declare-fun tp_is_empty!27457 () Bool)

(assert (=> b!1106423 (= e!631366 tp_is_empty!27457)))

(declare-fun b!1106424 () Bool)

(declare-fun e!631369 () Bool)

(assert (=> b!1106424 (= e!631367 e!631369)))

(declare-fun res!738354 () Bool)

(assert (=> b!1106424 (=> (not res!738354) (not e!631369))))

(declare-fun lt!495457 () array!71831)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71831 (_ BitVec 32)) Bool)

(assert (=> b!1106424 (= res!738354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495457 mask!1564))))

(assert (=> b!1106424 (= lt!495457 (array!71832 (store (arr!34568 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35104 _keys!1208)))))

(declare-fun mapNonEmpty!43003 () Bool)

(declare-fun tp!81923 () Bool)

(assert (=> mapNonEmpty!43003 (= mapRes!43003 (and tp!81923 e!631366))))

(declare-datatypes ((V!41737 0))(
  ( (V!41738 (val!13785 Int)) )
))
(declare-datatypes ((ValueCell!13019 0))(
  ( (ValueCellFull!13019 (v!16418 V!41737)) (EmptyCell!13019) )
))
(declare-fun mapValue!43003 () ValueCell!13019)

(declare-fun mapKey!43003 () (_ BitVec 32))

(declare-fun mapRest!43003 () (Array (_ BitVec 32) ValueCell!13019))

(declare-datatypes ((array!71833 0))(
  ( (array!71834 (arr!34569 (Array (_ BitVec 32) ValueCell!13019)) (size!35105 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71833)

(assert (=> mapNonEmpty!43003 (= (arr!34569 _values!996) (store mapRest!43003 mapKey!43003 mapValue!43003))))

(declare-fun res!738350 () Bool)

(assert (=> start!97226 (=> (not res!738350) (not e!631367))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97226 (= res!738350 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35104 _keys!1208))))))

(assert (=> start!97226 e!631367))

(declare-fun array_inv!26604 (array!71831) Bool)

(assert (=> start!97226 (array_inv!26604 _keys!1208)))

(assert (=> start!97226 true))

(declare-fun e!631370 () Bool)

(declare-fun array_inv!26605 (array!71833) Bool)

(assert (=> start!97226 (and (array_inv!26605 _values!996) e!631370)))

(declare-fun b!1106425 () Bool)

(declare-fun res!738355 () Bool)

(assert (=> b!1106425 (=> (not res!738355) (not e!631367))))

(assert (=> b!1106425 (= res!738355 (= (select (arr!34568 _keys!1208) i!673) k!934))))

(declare-fun b!1106426 () Bool)

(declare-fun res!738358 () Bool)

(assert (=> b!1106426 (=> (not res!738358) (not e!631369))))

(declare-datatypes ((List!24096 0))(
  ( (Nil!24093) (Cons!24092 (h!25301 (_ BitVec 64)) (t!34361 List!24096)) )
))
(declare-fun arrayNoDuplicates!0 (array!71831 (_ BitVec 32) List!24096) Bool)

(assert (=> b!1106426 (= res!738358 (arrayNoDuplicates!0 lt!495457 #b00000000000000000000000000000000 Nil!24093))))

(declare-fun b!1106427 () Bool)

(declare-fun res!738349 () Bool)

(assert (=> b!1106427 (=> (not res!738349) (not e!631367))))

(assert (=> b!1106427 (= res!738349 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24093))))

(declare-fun b!1106428 () Bool)

(declare-fun res!738357 () Bool)

(assert (=> b!1106428 (=> (not res!738357) (not e!631367))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106428 (= res!738357 (and (= (size!35105 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35104 _keys!1208) (size!35105 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106429 () Bool)

(declare-fun e!631371 () Bool)

(assert (=> b!1106429 (= e!631370 (and e!631371 mapRes!43003))))

(declare-fun condMapEmpty!43003 () Bool)

(declare-fun mapDefault!43003 () ValueCell!13019)

