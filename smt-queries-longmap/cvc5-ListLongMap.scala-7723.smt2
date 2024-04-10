; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97024 () Bool)

(assert start!97024)

(declare-fun b!1103564 () Bool)

(declare-fun res!736233 () Bool)

(declare-fun e!629972 () Bool)

(assert (=> b!1103564 (=> (not res!736233) (not e!629972))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103564 (= res!736233 (validMask!0 mask!1564))))

(declare-fun b!1103565 () Bool)

(declare-fun e!629973 () Bool)

(declare-fun tp_is_empty!27313 () Bool)

(assert (=> b!1103565 (= e!629973 tp_is_empty!27313)))

(declare-fun b!1103566 () Bool)

(declare-fun res!736230 () Bool)

(assert (=> b!1103566 (=> (not res!736230) (not e!629972))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71549 0))(
  ( (array!71550 (arr!34431 (Array (_ BitVec 32) (_ BitVec 64))) (size!34967 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71549)

(assert (=> b!1103566 (= res!736230 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34967 _keys!1208))))))

(declare-fun b!1103567 () Bool)

(declare-fun res!736231 () Bool)

(assert (=> b!1103567 (=> (not res!736231) (not e!629972))))

(declare-datatypes ((List!24042 0))(
  ( (Nil!24039) (Cons!24038 (h!25247 (_ BitVec 64)) (t!34307 List!24042)) )
))
(declare-fun arrayNoDuplicates!0 (array!71549 (_ BitVec 32) List!24042) Bool)

(assert (=> b!1103567 (= res!736231 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24039))))

(declare-fun res!736236 () Bool)

(assert (=> start!97024 (=> (not res!736236) (not e!629972))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97024 (= res!736236 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34967 _keys!1208))))))

(assert (=> start!97024 e!629972))

(declare-fun array_inv!26514 (array!71549) Bool)

(assert (=> start!97024 (array_inv!26514 _keys!1208)))

(assert (=> start!97024 true))

(declare-datatypes ((V!41545 0))(
  ( (V!41546 (val!13713 Int)) )
))
(declare-datatypes ((ValueCell!12947 0))(
  ( (ValueCellFull!12947 (v!16345 V!41545)) (EmptyCell!12947) )
))
(declare-datatypes ((array!71551 0))(
  ( (array!71552 (arr!34432 (Array (_ BitVec 32) ValueCell!12947)) (size!34968 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71551)

(declare-fun e!629975 () Bool)

(declare-fun array_inv!26515 (array!71551) Bool)

(assert (=> start!97024 (and (array_inv!26515 _values!996) e!629975)))

(declare-fun mapIsEmpty!42775 () Bool)

(declare-fun mapRes!42775 () Bool)

(assert (=> mapIsEmpty!42775 mapRes!42775))

(declare-fun b!1103568 () Bool)

(declare-fun e!629974 () Bool)

(assert (=> b!1103568 (= e!629975 (and e!629974 mapRes!42775))))

(declare-fun condMapEmpty!42775 () Bool)

(declare-fun mapDefault!42775 () ValueCell!12947)

