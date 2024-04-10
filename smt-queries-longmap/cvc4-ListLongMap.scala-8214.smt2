; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100166 () Bool)

(assert start!100166)

(declare-datatypes ((array!77305 0))(
  ( (array!77306 (arr!37301 (Array (_ BitVec 32) (_ BitVec 64))) (size!37837 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77305)

(declare-fun e!678886 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1194595 () Bool)

(declare-fun arrayContainsKey!0 (array!77305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194595 (= e!678886 (not (arrayContainsKey!0 _keys!1208 k!934 i!673)))))

(declare-fun b!1194596 () Bool)

(declare-fun res!794843 () Bool)

(declare-fun e!678885 () Bool)

(assert (=> b!1194596 (=> (not res!794843) (not e!678885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194596 (= res!794843 (validKeyInArray!0 k!934))))

(declare-fun b!1194597 () Bool)

(declare-fun res!794840 () Bool)

(assert (=> b!1194597 (=> (not res!794840) (not e!678886))))

(declare-fun lt!542787 () array!77305)

(declare-datatypes ((List!26264 0))(
  ( (Nil!26261) (Cons!26260 (h!27469 (_ BitVec 64)) (t!38935 List!26264)) )
))
(declare-fun arrayNoDuplicates!0 (array!77305 (_ BitVec 32) List!26264) Bool)

(assert (=> b!1194597 (= res!794840 (arrayNoDuplicates!0 lt!542787 #b00000000000000000000000000000000 Nil!26261))))

(declare-fun b!1194598 () Bool)

(declare-fun e!678882 () Bool)

(declare-fun e!678883 () Bool)

(declare-fun mapRes!47225 () Bool)

(assert (=> b!1194598 (= e!678882 (and e!678883 mapRes!47225))))

(declare-fun condMapEmpty!47225 () Bool)

(declare-datatypes ((V!45477 0))(
  ( (V!45478 (val!15188 Int)) )
))
(declare-datatypes ((ValueCell!14422 0))(
  ( (ValueCellFull!14422 (v!17826 V!45477)) (EmptyCell!14422) )
))
(declare-datatypes ((array!77307 0))(
  ( (array!77308 (arr!37302 (Array (_ BitVec 32) ValueCell!14422)) (size!37838 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77307)

(declare-fun mapDefault!47225 () ValueCell!14422)

