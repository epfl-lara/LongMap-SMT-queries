; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100274 () Bool)

(assert start!100274)

(declare-fun b!1196217 () Bool)

(declare-fun res!796063 () Bool)

(declare-fun e!679667 () Bool)

(assert (=> b!1196217 (=> (not res!796063) (not e!679667))))

(declare-datatypes ((array!77463 0))(
  ( (array!77464 (arr!37378 (Array (_ BitVec 32) (_ BitVec 64))) (size!37914 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77463)

(declare-datatypes ((List!26298 0))(
  ( (Nil!26295) (Cons!26294 (h!27503 (_ BitVec 64)) (t!38969 List!26298)) )
))
(declare-fun arrayNoDuplicates!0 (array!77463 (_ BitVec 32) List!26298) Bool)

(assert (=> b!1196217 (= res!796063 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26295))))

(declare-fun b!1196218 () Bool)

(declare-fun res!796064 () Bool)

(assert (=> b!1196218 (=> (not res!796064) (not e!679667))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45581 0))(
  ( (V!45582 (val!15227 Int)) )
))
(declare-datatypes ((ValueCell!14461 0))(
  ( (ValueCellFull!14461 (v!17865 V!45581)) (EmptyCell!14461) )
))
(declare-datatypes ((array!77465 0))(
  ( (array!77466 (arr!37379 (Array (_ BitVec 32) ValueCell!14461)) (size!37915 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77465)

(assert (=> b!1196218 (= res!796064 (and (= (size!37915 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37914 _keys!1208) (size!37915 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47348 () Bool)

(declare-fun mapRes!47348 () Bool)

(assert (=> mapIsEmpty!47348 mapRes!47348))

(declare-fun b!1196219 () Bool)

(declare-fun res!796058 () Bool)

(declare-fun e!679668 () Bool)

(assert (=> b!1196219 (=> (not res!796058) (not e!679668))))

(declare-fun lt!543047 () array!77463)

(assert (=> b!1196219 (= res!796058 (arrayNoDuplicates!0 lt!543047 #b00000000000000000000000000000000 Nil!26295))))

(declare-fun b!1196220 () Bool)

(declare-fun e!679669 () Bool)

(declare-fun tp_is_empty!30341 () Bool)

(assert (=> b!1196220 (= e!679669 tp_is_empty!30341)))

(declare-fun b!1196221 () Bool)

(declare-fun e!679666 () Bool)

(assert (=> b!1196221 (= e!679666 (and e!679669 mapRes!47348))))

(declare-fun condMapEmpty!47348 () Bool)

(declare-fun mapDefault!47348 () ValueCell!14461)

