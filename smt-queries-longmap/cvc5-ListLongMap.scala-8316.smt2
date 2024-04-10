; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101244 () Bool)

(assert start!101244)

(declare-fun b_free!26167 () Bool)

(declare-fun b_next!26167 () Bool)

(assert (=> start!101244 (= b_free!26167 (not b_next!26167))))

(declare-fun tp!91522 () Bool)

(declare-fun b_and!43451 () Bool)

(assert (=> start!101244 (= tp!91522 b_and!43451)))

(declare-fun b!1215948 () Bool)

(declare-fun res!807392 () Bool)

(declare-fun e!690389 () Bool)

(assert (=> b!1215948 (=> (not res!807392) (not e!690389))))

(declare-datatypes ((array!78515 0))(
  ( (array!78516 (arr!37892 (Array (_ BitVec 32) (_ BitVec 64))) (size!38428 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78515)

(declare-datatypes ((List!26712 0))(
  ( (Nil!26709) (Cons!26708 (h!27917 (_ BitVec 64)) (t!39859 List!26712)) )
))
(declare-fun arrayNoDuplicates!0 (array!78515 (_ BitVec 32) List!26712) Bool)

(assert (=> b!1215948 (= res!807392 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26709))))

(declare-fun b!1215949 () Bool)

(declare-fun res!807393 () Bool)

(assert (=> b!1215949 (=> (not res!807393) (not e!690389))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46289 0))(
  ( (V!46290 (val!15492 Int)) )
))
(declare-datatypes ((ValueCell!14726 0))(
  ( (ValueCellFull!14726 (v!18145 V!46289)) (EmptyCell!14726) )
))
(declare-datatypes ((array!78517 0))(
  ( (array!78518 (arr!37893 (Array (_ BitVec 32) ValueCell!14726)) (size!38429 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78517)

(assert (=> b!1215949 (= res!807393 (and (= (size!38429 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38428 _keys!1208) (size!38429 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215950 () Bool)

(declare-fun e!690386 () Bool)

(declare-fun e!690391 () Bool)

(declare-fun mapRes!48181 () Bool)

(assert (=> b!1215950 (= e!690386 (and e!690391 mapRes!48181))))

(declare-fun condMapEmpty!48181 () Bool)

(declare-fun mapDefault!48181 () ValueCell!14726)

