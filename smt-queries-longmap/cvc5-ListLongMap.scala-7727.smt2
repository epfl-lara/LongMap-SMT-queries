; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97048 () Bool)

(assert start!97048)

(declare-fun b!1103919 () Bool)

(declare-fun e!630152 () Bool)

(declare-fun tp_is_empty!27337 () Bool)

(assert (=> b!1103919 (= e!630152 tp_is_empty!27337)))

(declare-fun b!1103920 () Bool)

(declare-fun e!630154 () Bool)

(assert (=> b!1103920 (= e!630154 tp_is_empty!27337)))

(declare-fun b!1103921 () Bool)

(declare-fun res!736480 () Bool)

(declare-fun e!630155 () Bool)

(assert (=> b!1103921 (=> (not res!736480) (not e!630155))))

(declare-datatypes ((array!71595 0))(
  ( (array!71596 (arr!34454 (Array (_ BitVec 32) (_ BitVec 64))) (size!34990 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71595)

(declare-datatypes ((List!24050 0))(
  ( (Nil!24047) (Cons!24046 (h!25255 (_ BitVec 64)) (t!34315 List!24050)) )
))
(declare-fun arrayNoDuplicates!0 (array!71595 (_ BitVec 32) List!24050) Bool)

(assert (=> b!1103921 (= res!736480 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24047))))

(declare-fun b!1103922 () Bool)

(declare-fun res!736483 () Bool)

(assert (=> b!1103922 (=> (not res!736483) (not e!630155))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1103922 (= res!736483 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34990 _keys!1208))))))

(declare-fun mapIsEmpty!42811 () Bool)

(declare-fun mapRes!42811 () Bool)

(assert (=> mapIsEmpty!42811 mapRes!42811))

(declare-fun mapNonEmpty!42811 () Bool)

(declare-fun tp!81731 () Bool)

(assert (=> mapNonEmpty!42811 (= mapRes!42811 (and tp!81731 e!630154))))

(declare-datatypes ((V!41577 0))(
  ( (V!41578 (val!13725 Int)) )
))
(declare-datatypes ((ValueCell!12959 0))(
  ( (ValueCellFull!12959 (v!16357 V!41577)) (EmptyCell!12959) )
))
(declare-fun mapRest!42811 () (Array (_ BitVec 32) ValueCell!12959))

(declare-fun mapKey!42811 () (_ BitVec 32))

(declare-fun mapValue!42811 () ValueCell!12959)

(declare-datatypes ((array!71597 0))(
  ( (array!71598 (arr!34455 (Array (_ BitVec 32) ValueCell!12959)) (size!34991 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71597)

(assert (=> mapNonEmpty!42811 (= (arr!34455 _values!996) (store mapRest!42811 mapKey!42811 mapValue!42811))))

(declare-fun b!1103923 () Bool)

(declare-fun res!736482 () Bool)

(assert (=> b!1103923 (=> (not res!736482) (not e!630155))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1103923 (= res!736482 (= (select (arr!34454 _keys!1208) i!673) k!934))))

(declare-fun b!1103924 () Bool)

(declare-fun res!736485 () Bool)

(assert (=> b!1103924 (=> (not res!736485) (not e!630155))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71595 (_ BitVec 32)) Bool)

(assert (=> b!1103924 (= res!736485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71596 (store (arr!34454 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34990 _keys!1208)) mask!1564))))

(declare-fun b!1103925 () Bool)

(declare-fun res!736477 () Bool)

(assert (=> b!1103925 (=> (not res!736477) (not e!630155))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103925 (= res!736477 (and (= (size!34991 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34990 _keys!1208) (size!34991 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103926 () Bool)

(declare-fun res!736478 () Bool)

(assert (=> b!1103926 (=> (not res!736478) (not e!630155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103926 (= res!736478 (validKeyInArray!0 k!934))))

(declare-fun res!736479 () Bool)

(assert (=> start!97048 (=> (not res!736479) (not e!630155))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97048 (= res!736479 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34990 _keys!1208))))))

(assert (=> start!97048 e!630155))

(declare-fun array_inv!26528 (array!71595) Bool)

(assert (=> start!97048 (array_inv!26528 _keys!1208)))

(assert (=> start!97048 true))

(declare-fun e!630156 () Bool)

(declare-fun array_inv!26529 (array!71597) Bool)

(assert (=> start!97048 (and (array_inv!26529 _values!996) e!630156)))

(declare-fun b!1103927 () Bool)

(assert (=> b!1103927 (= e!630156 (and e!630152 mapRes!42811))))

(declare-fun condMapEmpty!42811 () Bool)

(declare-fun mapDefault!42811 () ValueCell!12959)

