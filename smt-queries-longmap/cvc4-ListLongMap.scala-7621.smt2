; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96050 () Bool)

(assert start!96050)

(declare-fun b_free!22703 () Bool)

(declare-fun b_next!22703 () Bool)

(assert (=> start!96050 (= b_free!22703 (not b_next!22703))))

(declare-fun tp!79958 () Bool)

(declare-fun b_and!36081 () Bool)

(assert (=> start!96050 (= tp!79958 b_and!36081)))

(declare-fun b!1089206 () Bool)

(declare-fun e!622125 () Bool)

(declare-fun tp_is_empty!26705 () Bool)

(assert (=> b!1089206 (= e!622125 tp_is_empty!26705)))

(declare-fun res!726528 () Bool)

(declare-fun e!622123 () Bool)

(assert (=> start!96050 (=> (not res!726528) (not e!622123))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96050 (= res!726528 (validMask!0 mask!1414))))

(assert (=> start!96050 e!622123))

(assert (=> start!96050 tp!79958))

(assert (=> start!96050 true))

(assert (=> start!96050 tp_is_empty!26705))

(declare-datatypes ((array!70333 0))(
  ( (array!70334 (arr!33840 (Array (_ BitVec 32) (_ BitVec 64))) (size!34376 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70333)

(declare-fun array_inv!26100 (array!70333) Bool)

(assert (=> start!96050 (array_inv!26100 _keys!1070)))

(declare-datatypes ((V!40733 0))(
  ( (V!40734 (val!13409 Int)) )
))
(declare-datatypes ((ValueCell!12643 0))(
  ( (ValueCellFull!12643 (v!16030 V!40733)) (EmptyCell!12643) )
))
(declare-datatypes ((array!70335 0))(
  ( (array!70336 (arr!33841 (Array (_ BitVec 32) ValueCell!12643)) (size!34377 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70335)

(declare-fun e!622127 () Bool)

(declare-fun array_inv!26101 (array!70335) Bool)

(assert (=> start!96050 (and (array_inv!26101 _values!874) e!622127)))

(declare-fun b!1089207 () Bool)

(declare-fun res!726530 () Bool)

(assert (=> b!1089207 (=> (not res!726530) (not e!622123))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089207 (= res!726530 (validKeyInArray!0 k!904))))

(declare-fun b!1089208 () Bool)

(declare-fun res!726527 () Bool)

(assert (=> b!1089208 (=> (not res!726527) (not e!622123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70333 (_ BitVec 32)) Bool)

(assert (=> b!1089208 (= res!726527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089209 () Bool)

(declare-fun res!726533 () Bool)

(assert (=> b!1089209 (=> (not res!726533) (not e!622123))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089209 (= res!726533 (and (= (size!34377 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34376 _keys!1070) (size!34377 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089210 () Bool)

(declare-fun e!622126 () Bool)

(declare-fun e!622129 () Bool)

(assert (=> b!1089210 (= e!622126 e!622129)))

(declare-fun res!726526 () Bool)

(assert (=> b!1089210 (=> res!726526 e!622129)))

(assert (=> b!1089210 (= res!726526 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17032 0))(
  ( (tuple2!17033 (_1!8527 (_ BitVec 64)) (_2!8527 V!40733)) )
))
(declare-datatypes ((List!23620 0))(
  ( (Nil!23617) (Cons!23616 (h!24825 tuple2!17032) (t!33381 List!23620)) )
))
(declare-datatypes ((ListLongMap!15001 0))(
  ( (ListLongMap!15002 (toList!7516 List!23620)) )
))
(declare-fun lt!485487 () ListLongMap!15001)

(declare-fun lt!485481 () ListLongMap!15001)

(assert (=> b!1089210 (= lt!485487 lt!485481)))

(declare-fun lt!485484 () ListLongMap!15001)

(declare-fun lt!485482 () tuple2!17032)

(declare-fun +!3313 (ListLongMap!15001 tuple2!17032) ListLongMap!15001)

(assert (=> b!1089210 (= lt!485481 (+!3313 lt!485484 lt!485482))))

(declare-fun lt!485488 () ListLongMap!15001)

(declare-fun lt!485483 () ListLongMap!15001)

(assert (=> b!1089210 (= lt!485488 lt!485483)))

(declare-fun lt!485477 () ListLongMap!15001)

(assert (=> b!1089210 (= lt!485483 (+!3313 lt!485477 lt!485482))))

(declare-fun lt!485486 () ListLongMap!15001)

(assert (=> b!1089210 (= lt!485487 (+!3313 lt!485486 lt!485482))))

(declare-fun zeroValue!831 () V!40733)

(assert (=> b!1089210 (= lt!485482 (tuple2!17033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089211 () Bool)

(declare-fun res!726524 () Bool)

(assert (=> b!1089211 (=> (not res!726524) (not e!622123))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089211 (= res!726524 (= (select (arr!33840 _keys!1070) i!650) k!904))))

(declare-fun b!1089212 () Bool)

(declare-fun res!726532 () Bool)

(assert (=> b!1089212 (=> (not res!726532) (not e!622123))))

(declare-datatypes ((List!23621 0))(
  ( (Nil!23618) (Cons!23617 (h!24826 (_ BitVec 64)) (t!33382 List!23621)) )
))
(declare-fun arrayNoDuplicates!0 (array!70333 (_ BitVec 32) List!23621) Bool)

(assert (=> b!1089212 (= res!726532 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23618))))

(declare-fun mapNonEmpty!41812 () Bool)

(declare-fun mapRes!41812 () Bool)

(declare-fun tp!79957 () Bool)

(declare-fun e!622124 () Bool)

(assert (=> mapNonEmpty!41812 (= mapRes!41812 (and tp!79957 e!622124))))

(declare-fun mapKey!41812 () (_ BitVec 32))

(declare-fun mapValue!41812 () ValueCell!12643)

(declare-fun mapRest!41812 () (Array (_ BitVec 32) ValueCell!12643))

(assert (=> mapNonEmpty!41812 (= (arr!33841 _values!874) (store mapRest!41812 mapKey!41812 mapValue!41812))))

(declare-fun b!1089213 () Bool)

(assert (=> b!1089213 (= e!622124 tp_is_empty!26705)))

(declare-fun b!1089214 () Bool)

(assert (=> b!1089214 (= e!622129 true)))

(declare-fun -!841 (ListLongMap!15001 (_ BitVec 64)) ListLongMap!15001)

(assert (=> b!1089214 (= (-!841 lt!485483 k!904) lt!485481)))

(declare-datatypes ((Unit!35848 0))(
  ( (Unit!35849) )
))
(declare-fun lt!485485 () Unit!35848)

(declare-fun addRemoveCommutativeForDiffKeys!69 (ListLongMap!15001 (_ BitVec 64) V!40733 (_ BitVec 64)) Unit!35848)

(assert (=> b!1089214 (= lt!485485 (addRemoveCommutativeForDiffKeys!69 lt!485477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1089215 () Bool)

(assert (=> b!1089215 (= e!622127 (and e!622125 mapRes!41812))))

(declare-fun condMapEmpty!41812 () Bool)

(declare-fun mapDefault!41812 () ValueCell!12643)

