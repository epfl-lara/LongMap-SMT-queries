; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100138 () Bool)

(assert start!100138)

(declare-fun b!1194238 () Bool)

(declare-fun res!794581 () Bool)

(declare-fun e!678709 () Bool)

(assert (=> b!1194238 (=> (not res!794581) (not e!678709))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194238 (= res!794581 (validMask!0 mask!1564))))

(declare-fun b!1194239 () Bool)

(declare-fun e!678704 () Bool)

(assert (=> b!1194239 (= e!678704 false)))

(declare-fun lt!542744 () Bool)

(declare-datatypes ((array!77273 0))(
  ( (array!77274 (arr!37286 (Array (_ BitVec 32) (_ BitVec 64))) (size!37822 (_ BitVec 32))) )
))
(declare-fun lt!542745 () array!77273)

(declare-datatypes ((List!26257 0))(
  ( (Nil!26254) (Cons!26253 (h!27462 (_ BitVec 64)) (t!38928 List!26257)) )
))
(declare-fun arrayNoDuplicates!0 (array!77273 (_ BitVec 32) List!26257) Bool)

(assert (=> b!1194239 (= lt!542744 (arrayNoDuplicates!0 lt!542745 #b00000000000000000000000000000000 Nil!26254))))

(declare-fun b!1194240 () Bool)

(declare-fun res!794578 () Bool)

(assert (=> b!1194240 (=> (not res!794578) (not e!678709))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77273)

(assert (=> b!1194240 (= res!794578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37822 _keys!1208))))))

(declare-fun b!1194241 () Bool)

(assert (=> b!1194241 (= e!678709 e!678704)))

(declare-fun res!794579 () Bool)

(assert (=> b!1194241 (=> (not res!794579) (not e!678704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77273 (_ BitVec 32)) Bool)

(assert (=> b!1194241 (= res!794579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542745 mask!1564))))

(assert (=> b!1194241 (= lt!542745 (array!77274 (store (arr!37286 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37822 _keys!1208)))))

(declare-fun mapNonEmpty!47198 () Bool)

(declare-fun mapRes!47198 () Bool)

(declare-fun tp!89808 () Bool)

(declare-fun e!678705 () Bool)

(assert (=> mapNonEmpty!47198 (= mapRes!47198 (and tp!89808 e!678705))))

(declare-datatypes ((V!45457 0))(
  ( (V!45458 (val!15180 Int)) )
))
(declare-datatypes ((ValueCell!14414 0))(
  ( (ValueCellFull!14414 (v!17818 V!45457)) (EmptyCell!14414) )
))
(declare-fun mapRest!47198 () (Array (_ BitVec 32) ValueCell!14414))

(declare-fun mapKey!47198 () (_ BitVec 32))

(declare-datatypes ((array!77275 0))(
  ( (array!77276 (arr!37287 (Array (_ BitVec 32) ValueCell!14414)) (size!37823 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77275)

(declare-fun mapValue!47198 () ValueCell!14414)

(assert (=> mapNonEmpty!47198 (= (arr!37287 _values!996) (store mapRest!47198 mapKey!47198 mapValue!47198))))

(declare-fun b!1194242 () Bool)

(declare-fun e!678707 () Bool)

(declare-fun e!678706 () Bool)

(assert (=> b!1194242 (= e!678707 (and e!678706 mapRes!47198))))

(declare-fun condMapEmpty!47198 () Bool)

(declare-fun mapDefault!47198 () ValueCell!14414)

