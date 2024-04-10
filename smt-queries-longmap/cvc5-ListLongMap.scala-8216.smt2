; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100188 () Bool)

(assert start!100188)

(declare-fun b!1194802 () Bool)

(declare-fun res!794988 () Bool)

(declare-fun e!678999 () Bool)

(assert (=> b!1194802 (=> (not res!794988) (not e!678999))))

(declare-datatypes ((array!77323 0))(
  ( (array!77324 (arr!37309 (Array (_ BitVec 32) (_ BitVec 64))) (size!37845 (_ BitVec 32))) )
))
(declare-fun lt!542823 () array!77323)

(declare-datatypes ((List!26267 0))(
  ( (Nil!26264) (Cons!26263 (h!27472 (_ BitVec 64)) (t!38938 List!26267)) )
))
(declare-fun arrayNoDuplicates!0 (array!77323 (_ BitVec 32) List!26267) Bool)

(assert (=> b!1194802 (= res!794988 (arrayNoDuplicates!0 lt!542823 #b00000000000000000000000000000000 Nil!26264))))

(declare-fun b!1194803 () Bool)

(declare-fun e!678994 () Bool)

(declare-fun e!678996 () Bool)

(declare-fun mapRes!47240 () Bool)

(assert (=> b!1194803 (= e!678994 (and e!678996 mapRes!47240))))

(declare-fun condMapEmpty!47240 () Bool)

(declare-datatypes ((V!45489 0))(
  ( (V!45490 (val!15192 Int)) )
))
(declare-datatypes ((ValueCell!14426 0))(
  ( (ValueCellFull!14426 (v!17830 V!45489)) (EmptyCell!14426) )
))
(declare-datatypes ((array!77325 0))(
  ( (array!77326 (arr!37310 (Array (_ BitVec 32) ValueCell!14426)) (size!37846 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77325)

(declare-fun mapDefault!47240 () ValueCell!14426)

