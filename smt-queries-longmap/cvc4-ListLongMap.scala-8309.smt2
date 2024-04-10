; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101206 () Bool)

(assert start!101206)

(declare-fun b_free!26129 () Bool)

(declare-fun b_next!26129 () Bool)

(assert (=> start!101206 (= b_free!26129 (not b_next!26129))))

(declare-fun tp!91409 () Bool)

(declare-fun b_and!43375 () Bool)

(assert (=> start!101206 (= tp!91409 b_and!43375)))

(declare-fun b!1215112 () Bool)

(declare-fun res!806766 () Bool)

(declare-fun e!689991 () Bool)

(assert (=> b!1215112 (=> (not res!806766) (not e!689991))))

(declare-datatypes ((array!78445 0))(
  ( (array!78446 (arr!37857 (Array (_ BitVec 32) (_ BitVec 64))) (size!38393 (_ BitVec 32))) )
))
(declare-fun lt!552526 () array!78445)

(declare-datatypes ((List!26689 0))(
  ( (Nil!26686) (Cons!26685 (h!27894 (_ BitVec 64)) (t!39798 List!26689)) )
))
(declare-fun arrayNoDuplicates!0 (array!78445 (_ BitVec 32) List!26689) Bool)

(assert (=> b!1215112 (= res!806766 (arrayNoDuplicates!0 lt!552526 #b00000000000000000000000000000000 Nil!26686))))

(declare-fun mapNonEmpty!48124 () Bool)

(declare-fun mapRes!48124 () Bool)

(declare-fun tp!91408 () Bool)

(declare-fun e!689986 () Bool)

(assert (=> mapNonEmpty!48124 (= mapRes!48124 (and tp!91408 e!689986))))

(declare-datatypes ((V!46237 0))(
  ( (V!46238 (val!15473 Int)) )
))
(declare-datatypes ((ValueCell!14707 0))(
  ( (ValueCellFull!14707 (v!18126 V!46237)) (EmptyCell!14707) )
))
(declare-fun mapValue!48124 () ValueCell!14707)

(declare-fun mapRest!48124 () (Array (_ BitVec 32) ValueCell!14707))

(declare-fun mapKey!48124 () (_ BitVec 32))

(declare-datatypes ((array!78447 0))(
  ( (array!78448 (arr!37858 (Array (_ BitVec 32) ValueCell!14707)) (size!38394 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78447)

(assert (=> mapNonEmpty!48124 (= (arr!37858 _values!996) (store mapRest!48124 mapKey!48124 mapValue!48124))))

(declare-fun b!1215113 () Bool)

(declare-fun res!806767 () Bool)

(declare-fun e!689987 () Bool)

(assert (=> b!1215113 (=> (not res!806767) (not e!689987))))

(declare-fun _keys!1208 () array!78445)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78445 (_ BitVec 32)) Bool)

(assert (=> b!1215113 (= res!806767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215114 () Bool)

(declare-fun res!806763 () Bool)

(assert (=> b!1215114 (=> (not res!806763) (not e!689987))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1215114 (= res!806763 (= (select (arr!37857 _keys!1208) i!673) k!934))))

(declare-fun b!1215115 () Bool)

(declare-fun e!689992 () Bool)

(declare-fun e!689989 () Bool)

(assert (=> b!1215115 (= e!689992 (and e!689989 mapRes!48124))))

(declare-fun condMapEmpty!48124 () Bool)

(declare-fun mapDefault!48124 () ValueCell!14707)

