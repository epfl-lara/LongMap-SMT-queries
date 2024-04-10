; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95608 () Bool)

(assert start!95608)

(declare-fun b_free!22261 () Bool)

(declare-fun b_next!22261 () Bool)

(assert (=> start!95608 (= b_free!22261 (not b_next!22261))))

(declare-fun tp!78631 () Bool)

(declare-fun b_and!35239 () Bool)

(assert (=> start!95608 (= tp!78631 b_and!35239)))

(declare-fun b!1080213 () Bool)

(declare-fun res!719927 () Bool)

(declare-fun e!617530 () Bool)

(assert (=> b!1080213 (=> (not res!719927) (not e!617530))))

(declare-datatypes ((array!69479 0))(
  ( (array!69480 (arr!33413 (Array (_ BitVec 32) (_ BitVec 64))) (size!33949 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69479)

(declare-datatypes ((List!23283 0))(
  ( (Nil!23280) (Cons!23279 (h!24488 (_ BitVec 64)) (t!32642 List!23283)) )
))
(declare-fun arrayNoDuplicates!0 (array!69479 (_ BitVec 32) List!23283) Bool)

(assert (=> b!1080213 (= res!719927 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23280))))

(declare-fun b!1080214 () Bool)

(declare-fun e!617527 () Bool)

(declare-fun tp_is_empty!26263 () Bool)

(assert (=> b!1080214 (= e!617527 tp_is_empty!26263)))

(declare-fun b!1080215 () Bool)

(declare-fun e!617526 () Bool)

(assert (=> b!1080215 (= e!617530 e!617526)))

(declare-fun res!719923 () Bool)

(assert (=> b!1080215 (=> (not res!719923) (not e!617526))))

(declare-fun lt!478963 () array!69479)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69479 (_ BitVec 32)) Bool)

(assert (=> b!1080215 (= res!719923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478963 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080215 (= lt!478963 (array!69480 (store (arr!33413 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33949 _keys!1070)))))

(declare-fun mapIsEmpty!41149 () Bool)

(declare-fun mapRes!41149 () Bool)

(assert (=> mapIsEmpty!41149 mapRes!41149))

(declare-fun mapNonEmpty!41149 () Bool)

(declare-fun tp!78632 () Bool)

(assert (=> mapNonEmpty!41149 (= mapRes!41149 (and tp!78632 e!617527))))

(declare-datatypes ((V!40145 0))(
  ( (V!40146 (val!13188 Int)) )
))
(declare-datatypes ((ValueCell!12422 0))(
  ( (ValueCellFull!12422 (v!15809 V!40145)) (EmptyCell!12422) )
))
(declare-datatypes ((array!69481 0))(
  ( (array!69482 (arr!33414 (Array (_ BitVec 32) ValueCell!12422)) (size!33950 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69481)

(declare-fun mapKey!41149 () (_ BitVec 32))

(declare-fun mapRest!41149 () (Array (_ BitVec 32) ValueCell!12422))

(declare-fun mapValue!41149 () ValueCell!12422)

(assert (=> mapNonEmpty!41149 (= (arr!33414 _values!874) (store mapRest!41149 mapKey!41149 mapValue!41149))))

(declare-fun b!1080216 () Bool)

(declare-fun res!719920 () Bool)

(assert (=> b!1080216 (=> (not res!719920) (not e!617530))))

(assert (=> b!1080216 (= res!719920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080217 () Bool)

(declare-fun res!719924 () Bool)

(assert (=> b!1080217 (=> (not res!719924) (not e!617530))))

(assert (=> b!1080217 (= res!719924 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33949 _keys!1070))))))

(declare-fun b!1080219 () Bool)

(declare-fun res!719926 () Bool)

(assert (=> b!1080219 (=> (not res!719926) (not e!617526))))

(assert (=> b!1080219 (= res!719926 (arrayNoDuplicates!0 lt!478963 #b00000000000000000000000000000000 Nil!23280))))

(declare-fun b!1080220 () Bool)

(declare-fun res!719925 () Bool)

(assert (=> b!1080220 (=> (not res!719925) (not e!617530))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1080220 (= res!719925 (= (select (arr!33413 _keys!1070) i!650) k!904))))

(declare-fun b!1080221 () Bool)

(declare-fun e!617528 () Bool)

(declare-fun e!617529 () Bool)

(assert (=> b!1080221 (= e!617528 (and e!617529 mapRes!41149))))

(declare-fun condMapEmpty!41149 () Bool)

(declare-fun mapDefault!41149 () ValueCell!12422)

