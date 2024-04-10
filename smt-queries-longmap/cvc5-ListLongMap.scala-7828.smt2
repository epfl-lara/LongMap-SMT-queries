; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97712 () Bool)

(assert start!97712)

(declare-fun b!1117122 () Bool)

(declare-fun res!745964 () Bool)

(declare-fun e!636408 () Bool)

(assert (=> b!1117122 (=> (not res!745964) (not e!636408))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117122 (= res!745964 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!43732 () Bool)

(declare-fun mapRes!43732 () Bool)

(assert (=> mapIsEmpty!43732 mapRes!43732))

(declare-fun b!1117123 () Bool)

(declare-fun res!745965 () Bool)

(assert (=> b!1117123 (=> (not res!745965) (not e!636408))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72783 0))(
  ( (array!72784 (arr!35044 (Array (_ BitVec 32) (_ BitVec 64))) (size!35580 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72783)

(assert (=> b!1117123 (= res!745965 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35580 _keys!1208))))))

(declare-fun b!1117124 () Bool)

(declare-fun e!636410 () Bool)

(declare-fun tp_is_empty!27943 () Bool)

(assert (=> b!1117124 (= e!636410 tp_is_empty!27943)))

(declare-fun b!1117125 () Bool)

(declare-fun res!745970 () Bool)

(assert (=> b!1117125 (=> (not res!745970) (not e!636408))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42385 0))(
  ( (V!42386 (val!14028 Int)) )
))
(declare-datatypes ((ValueCell!13262 0))(
  ( (ValueCellFull!13262 (v!16661 V!42385)) (EmptyCell!13262) )
))
(declare-datatypes ((array!72785 0))(
  ( (array!72786 (arr!35045 (Array (_ BitVec 32) ValueCell!13262)) (size!35581 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72785)

(assert (=> b!1117125 (= res!745970 (and (= (size!35581 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35580 _keys!1208) (size!35581 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!745971 () Bool)

(assert (=> start!97712 (=> (not res!745971) (not e!636408))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97712 (= res!745971 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35580 _keys!1208))))))

(assert (=> start!97712 e!636408))

(declare-fun array_inv!26930 (array!72783) Bool)

(assert (=> start!97712 (array_inv!26930 _keys!1208)))

(assert (=> start!97712 true))

(declare-fun e!636409 () Bool)

(declare-fun array_inv!26931 (array!72785) Bool)

(assert (=> start!97712 (and (array_inv!26931 _values!996) e!636409)))

(declare-fun b!1117126 () Bool)

(declare-fun e!636406 () Bool)

(assert (=> b!1117126 (= e!636409 (and e!636406 mapRes!43732))))

(declare-fun condMapEmpty!43732 () Bool)

(declare-fun mapDefault!43732 () ValueCell!13262)

