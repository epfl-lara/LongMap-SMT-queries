; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105188 () Bool)

(assert start!105188)

(declare-fun b_free!26905 () Bool)

(declare-fun b_next!26905 () Bool)

(assert (=> start!105188 (= b_free!26905 (not b_next!26905))))

(declare-fun tp!94220 () Bool)

(declare-fun b_and!44719 () Bool)

(assert (=> start!105188 (= tp!94220 b_and!44719)))

(declare-fun b!1253485 () Bool)

(declare-fun e!712112 () Bool)

(declare-fun tp_is_empty!31807 () Bool)

(assert (=> b!1253485 (= e!712112 tp_is_empty!31807)))

(declare-fun mapIsEmpty!49486 () Bool)

(declare-fun mapRes!49486 () Bool)

(assert (=> mapIsEmpty!49486 mapRes!49486))

(declare-fun b!1253486 () Bool)

(declare-fun e!712110 () Bool)

(assert (=> b!1253486 (= e!712110 tp_is_empty!31807)))

(declare-fun b!1253487 () Bool)

(declare-fun res!835857 () Bool)

(declare-fun e!712108 () Bool)

(assert (=> b!1253487 (=> (not res!835857) (not e!712108))))

(declare-datatypes ((array!81272 0))(
  ( (array!81273 (arr!39198 (Array (_ BitVec 32) (_ BitVec 64))) (size!39734 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81272)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81272 (_ BitVec 32)) Bool)

(assert (=> b!1253487 (= res!835857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253488 () Bool)

(declare-fun res!835859 () Bool)

(assert (=> b!1253488 (=> (not res!835859) (not e!712108))))

(declare-datatypes ((List!27835 0))(
  ( (Nil!27832) (Cons!27831 (h!29040 (_ BitVec 64)) (t!41316 List!27835)) )
))
(declare-fun arrayNoDuplicates!0 (array!81272 (_ BitVec 32) List!27835) Bool)

(assert (=> b!1253488 (= res!835859 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27832))))

(declare-fun mapNonEmpty!49486 () Bool)

(declare-fun tp!94219 () Bool)

(assert (=> mapNonEmpty!49486 (= mapRes!49486 (and tp!94219 e!712112))))

(declare-fun mapKey!49486 () (_ BitVec 32))

(declare-datatypes ((V!47775 0))(
  ( (V!47776 (val!15966 Int)) )
))
(declare-datatypes ((ValueCell!15140 0))(
  ( (ValueCellFull!15140 (v!18664 V!47775)) (EmptyCell!15140) )
))
(declare-fun mapRest!49486 () (Array (_ BitVec 32) ValueCell!15140))

(declare-datatypes ((array!81274 0))(
  ( (array!81275 (arr!39199 (Array (_ BitVec 32) ValueCell!15140)) (size!39735 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81274)

(declare-fun mapValue!49486 () ValueCell!15140)

(assert (=> mapNonEmpty!49486 (= (arr!39199 _values!914) (store mapRest!49486 mapKey!49486 mapValue!49486))))

(declare-fun b!1253490 () Bool)

(declare-fun e!712113 () Bool)

(assert (=> b!1253490 (= e!712113 (and e!712110 mapRes!49486))))

(declare-fun condMapEmpty!49486 () Bool)

(declare-fun mapDefault!49486 () ValueCell!15140)

