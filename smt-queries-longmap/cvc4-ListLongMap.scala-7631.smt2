; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96110 () Bool)

(assert start!96110)

(declare-fun b_free!22763 () Bool)

(declare-fun b_next!22763 () Bool)

(assert (=> start!96110 (= b_free!22763 (not b_next!22763))))

(declare-fun tp!80137 () Bool)

(declare-fun b_and!36201 () Bool)

(assert (=> start!96110 (= tp!80137 b_and!36201)))

(declare-fun b!1090535 () Bool)

(declare-fun e!622849 () Bool)

(declare-fun tp_is_empty!26765 () Bool)

(assert (=> b!1090535 (= e!622849 tp_is_empty!26765)))

(declare-fun b!1090536 () Bool)

(declare-fun e!622845 () Bool)

(declare-fun e!622843 () Bool)

(assert (=> b!1090536 (= e!622845 e!622843)))

(declare-fun res!727532 () Bool)

(assert (=> b!1090536 (=> (not res!727532) (not e!622843))))

(declare-datatypes ((array!70453 0))(
  ( (array!70454 (arr!33900 (Array (_ BitVec 32) (_ BitVec 64))) (size!34436 (_ BitVec 32))) )
))
(declare-fun lt!486620 () array!70453)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70453 (_ BitVec 32)) Bool)

(assert (=> b!1090536 (= res!727532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486620 mask!1414))))

(declare-fun _keys!1070 () array!70453)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090536 (= lt!486620 (array!70454 (store (arr!33900 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34436 _keys!1070)))))

(declare-fun b!1090537 () Bool)

(declare-fun res!727529 () Bool)

(assert (=> b!1090537 (=> (not res!727529) (not e!622845))))

(assert (=> b!1090537 (= res!727529 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34436 _keys!1070))))))

(declare-fun b!1090538 () Bool)

(declare-fun e!622850 () Bool)

(declare-fun mapRes!41902 () Bool)

(assert (=> b!1090538 (= e!622850 (and e!622849 mapRes!41902))))

(declare-fun condMapEmpty!41902 () Bool)

(declare-datatypes ((V!40813 0))(
  ( (V!40814 (val!13439 Int)) )
))
(declare-datatypes ((ValueCell!12673 0))(
  ( (ValueCellFull!12673 (v!16060 V!40813)) (EmptyCell!12673) )
))
(declare-datatypes ((array!70455 0))(
  ( (array!70456 (arr!33901 (Array (_ BitVec 32) ValueCell!12673)) (size!34437 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70455)

(declare-fun mapDefault!41902 () ValueCell!12673)

