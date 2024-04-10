; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97120 () Bool)

(assert start!97120)

(declare-fun mapIsEmpty!42865 () Bool)

(declare-fun mapRes!42865 () Bool)

(assert (=> mapIsEmpty!42865 mapRes!42865))

(declare-fun b!1104632 () Bool)

(declare-fun res!736992 () Bool)

(declare-fun e!630516 () Bool)

(assert (=> b!1104632 (=> (not res!736992) (not e!630516))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104632 (= res!736992 (validKeyInArray!0 k!934))))

(declare-fun b!1104633 () Bool)

(declare-fun res!736994 () Bool)

(assert (=> b!1104633 (=> (not res!736994) (not e!630516))))

(declare-datatypes ((array!71657 0))(
  ( (array!71658 (arr!34482 (Array (_ BitVec 32) (_ BitVec 64))) (size!35018 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71657)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104633 (= res!736994 (= (select (arr!34482 _keys!1208) i!673) k!934))))

(declare-fun b!1104634 () Bool)

(declare-fun e!630520 () Bool)

(declare-fun tp_is_empty!27367 () Bool)

(assert (=> b!1104634 (= e!630520 tp_is_empty!27367)))

(declare-fun res!736990 () Bool)

(assert (=> start!97120 (=> (not res!736990) (not e!630516))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97120 (= res!736990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35018 _keys!1208))))))

(assert (=> start!97120 e!630516))

(declare-fun array_inv!26546 (array!71657) Bool)

(assert (=> start!97120 (array_inv!26546 _keys!1208)))

(assert (=> start!97120 true))

(declare-datatypes ((V!41617 0))(
  ( (V!41618 (val!13740 Int)) )
))
(declare-datatypes ((ValueCell!12974 0))(
  ( (ValueCellFull!12974 (v!16373 V!41617)) (EmptyCell!12974) )
))
(declare-datatypes ((array!71659 0))(
  ( (array!71660 (arr!34483 (Array (_ BitVec 32) ValueCell!12974)) (size!35019 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71659)

(declare-fun e!630517 () Bool)

(declare-fun array_inv!26547 (array!71659) Bool)

(assert (=> start!97120 (and (array_inv!26547 _values!996) e!630517)))

(declare-fun b!1104635 () Bool)

(declare-fun e!630521 () Bool)

(assert (=> b!1104635 (= e!630521 tp_is_empty!27367)))

(declare-fun b!1104636 () Bool)

(declare-fun res!736995 () Bool)

(assert (=> b!1104636 (=> (not res!736995) (not e!630516))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71657 (_ BitVec 32)) Bool)

(assert (=> b!1104636 (= res!736995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104637 () Bool)

(declare-fun res!736996 () Bool)

(assert (=> b!1104637 (=> (not res!736996) (not e!630516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104637 (= res!736996 (validMask!0 mask!1564))))

(declare-fun b!1104638 () Bool)

(assert (=> b!1104638 (= e!630517 (and e!630520 mapRes!42865))))

(declare-fun condMapEmpty!42865 () Bool)

(declare-fun mapDefault!42865 () ValueCell!12974)

