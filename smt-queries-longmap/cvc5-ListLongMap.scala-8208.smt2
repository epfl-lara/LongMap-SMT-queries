; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100114 () Bool)

(assert start!100114)

(declare-fun b!1193850 () Bool)

(declare-fun res!794293 () Bool)

(declare-fun e!678508 () Bool)

(assert (=> b!1193850 (=> (not res!794293) (not e!678508))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193850 (= res!794293 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47162 () Bool)

(declare-fun mapRes!47162 () Bool)

(declare-fun tp!89772 () Bool)

(declare-fun e!678505 () Bool)

(assert (=> mapNonEmpty!47162 (= mapRes!47162 (and tp!89772 e!678505))))

(declare-fun mapKey!47162 () (_ BitVec 32))

(declare-datatypes ((V!45425 0))(
  ( (V!45426 (val!15168 Int)) )
))
(declare-datatypes ((ValueCell!14402 0))(
  ( (ValueCellFull!14402 (v!17806 V!45425)) (EmptyCell!14402) )
))
(declare-fun mapValue!47162 () ValueCell!14402)

(declare-fun mapRest!47162 () (Array (_ BitVec 32) ValueCell!14402))

(declare-datatypes ((array!77225 0))(
  ( (array!77226 (arr!37262 (Array (_ BitVec 32) ValueCell!14402)) (size!37798 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77225)

(assert (=> mapNonEmpty!47162 (= (arr!37262 _values!996) (store mapRest!47162 mapKey!47162 mapValue!47162))))

(declare-fun b!1193851 () Bool)

(declare-fun res!794294 () Bool)

(assert (=> b!1193851 (=> (not res!794294) (not e!678508))))

(declare-datatypes ((array!77227 0))(
  ( (array!77228 (arr!37263 (Array (_ BitVec 32) (_ BitVec 64))) (size!37799 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77227)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77227 (_ BitVec 32)) Bool)

(assert (=> b!1193851 (= res!794294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193852 () Bool)

(assert (=> b!1193852 (= e!678508 false)))

(declare-fun lt!542688 () Bool)

(declare-datatypes ((List!26246 0))(
  ( (Nil!26243) (Cons!26242 (h!27451 (_ BitVec 64)) (t!38917 List!26246)) )
))
(declare-fun arrayNoDuplicates!0 (array!77227 (_ BitVec 32) List!26246) Bool)

(assert (=> b!1193852 (= lt!542688 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26243))))

(declare-fun b!1193853 () Bool)

(declare-fun res!794295 () Bool)

(assert (=> b!1193853 (=> (not res!794295) (not e!678508))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193853 (= res!794295 (and (= (size!37798 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37799 _keys!1208) (size!37798 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193854 () Bool)

(declare-fun e!678507 () Bool)

(declare-fun tp_is_empty!30223 () Bool)

(assert (=> b!1193854 (= e!678507 tp_is_empty!30223)))

(declare-fun b!1193855 () Bool)

(declare-fun e!678504 () Bool)

(assert (=> b!1193855 (= e!678504 (and e!678507 mapRes!47162))))

(declare-fun condMapEmpty!47162 () Bool)

(declare-fun mapDefault!47162 () ValueCell!14402)

