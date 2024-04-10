; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96068 () Bool)

(assert start!96068)

(declare-fun b_free!22721 () Bool)

(declare-fun b_next!22721 () Bool)

(assert (=> start!96068 (= b_free!22721 (not b_next!22721))))

(declare-fun tp!80011 () Bool)

(declare-fun b_and!36117 () Bool)

(assert (=> start!96068 (= tp!80011 b_and!36117)))

(declare-fun b!1089602 () Bool)

(declare-fun res!726823 () Bool)

(declare-fun e!622340 () Bool)

(assert (=> b!1089602 (=> (not res!726823) (not e!622340))))

(declare-datatypes ((array!70369 0))(
  ( (array!70370 (arr!33858 (Array (_ BitVec 32) (_ BitVec 64))) (size!34394 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70369)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70369 (_ BitVec 32)) Bool)

(assert (=> b!1089602 (= res!726823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089603 () Bool)

(declare-fun e!622346 () Bool)

(assert (=> b!1089603 (= e!622346 true)))

(declare-datatypes ((V!40757 0))(
  ( (V!40758 (val!13418 Int)) )
))
(declare-datatypes ((tuple2!17048 0))(
  ( (tuple2!17049 (_1!8535 (_ BitVec 64)) (_2!8535 V!40757)) )
))
(declare-datatypes ((List!23636 0))(
  ( (Nil!23633) (Cons!23632 (h!24841 tuple2!17048) (t!33415 List!23636)) )
))
(declare-datatypes ((ListLongMap!15017 0))(
  ( (ListLongMap!15018 (toList!7524 List!23636)) )
))
(declare-fun lt!485837 () ListLongMap!15017)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!485829 () ListLongMap!15017)

(declare-fun -!849 (ListLongMap!15017 (_ BitVec 64)) ListLongMap!15017)

(assert (=> b!1089603 (= (-!849 lt!485837 k!904) lt!485829)))

(declare-datatypes ((Unit!35864 0))(
  ( (Unit!35865) )
))
(declare-fun lt!485838 () Unit!35864)

(declare-fun lt!485836 () ListLongMap!15017)

(declare-fun zeroValue!831 () V!40757)

(declare-fun addRemoveCommutativeForDiffKeys!76 (ListLongMap!15017 (_ BitVec 64) V!40757 (_ BitVec 64)) Unit!35864)

(assert (=> b!1089603 (= lt!485838 (addRemoveCommutativeForDiffKeys!76 lt!485836 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1089604 () Bool)

(declare-fun res!726821 () Bool)

(assert (=> b!1089604 (=> (not res!726821) (not e!622340))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089604 (= res!726821 (= (select (arr!33858 _keys!1070) i!650) k!904))))

(declare-fun b!1089605 () Bool)

(declare-fun res!726822 () Bool)

(assert (=> b!1089605 (=> (not res!726822) (not e!622340))))

(assert (=> b!1089605 (= res!726822 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34394 _keys!1070))))))

(declare-fun b!1089606 () Bool)

(declare-fun e!622341 () Bool)

(declare-fun tp_is_empty!26723 () Bool)

(assert (=> b!1089606 (= e!622341 tp_is_empty!26723)))

(declare-fun b!1089607 () Bool)

(declare-fun res!726826 () Bool)

(assert (=> b!1089607 (=> (not res!726826) (not e!622340))))

(declare-datatypes ((List!23637 0))(
  ( (Nil!23634) (Cons!23633 (h!24842 (_ BitVec 64)) (t!33416 List!23637)) )
))
(declare-fun arrayNoDuplicates!0 (array!70369 (_ BitVec 32) List!23637) Bool)

(assert (=> b!1089607 (= res!726826 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23634))))

(declare-fun mapIsEmpty!41839 () Bool)

(declare-fun mapRes!41839 () Bool)

(assert (=> mapIsEmpty!41839 mapRes!41839))

(declare-fun mapNonEmpty!41839 () Bool)

(declare-fun tp!80012 () Bool)

(declare-fun e!622345 () Bool)

(assert (=> mapNonEmpty!41839 (= mapRes!41839 (and tp!80012 e!622345))))

(declare-fun mapKey!41839 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12652 0))(
  ( (ValueCellFull!12652 (v!16039 V!40757)) (EmptyCell!12652) )
))
(declare-fun mapRest!41839 () (Array (_ BitVec 32) ValueCell!12652))

(declare-datatypes ((array!70371 0))(
  ( (array!70372 (arr!33859 (Array (_ BitVec 32) ValueCell!12652)) (size!34395 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70371)

(declare-fun mapValue!41839 () ValueCell!12652)

(assert (=> mapNonEmpty!41839 (= (arr!33859 _values!874) (store mapRest!41839 mapKey!41839 mapValue!41839))))

(declare-fun b!1089609 () Bool)

(declare-fun res!726831 () Bool)

(assert (=> b!1089609 (=> (not res!726831) (not e!622340))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089609 (= res!726831 (and (= (size!34395 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34394 _keys!1070) (size!34395 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089610 () Bool)

(declare-fun e!622342 () Bool)

(assert (=> b!1089610 (= e!622342 (and e!622341 mapRes!41839))))

(declare-fun condMapEmpty!41839 () Bool)

(declare-fun mapDefault!41839 () ValueCell!12652)

