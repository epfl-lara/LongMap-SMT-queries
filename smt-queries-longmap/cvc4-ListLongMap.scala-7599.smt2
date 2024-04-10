; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95918 () Bool)

(assert start!95918)

(declare-fun b_free!22571 () Bool)

(declare-fun b_next!22571 () Bool)

(assert (=> start!95918 (= b_free!22571 (not b_next!22571))))

(declare-fun tp!79562 () Bool)

(declare-fun b_and!35817 () Bool)

(assert (=> start!95918 (= tp!79562 b_and!35817)))

(declare-fun res!724341 () Bool)

(declare-fun e!620541 () Bool)

(assert (=> start!95918 (=> (not res!724341) (not e!620541))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95918 (= res!724341 (validMask!0 mask!1414))))

(assert (=> start!95918 e!620541))

(assert (=> start!95918 tp!79562))

(assert (=> start!95918 true))

(declare-fun tp_is_empty!26573 () Bool)

(assert (=> start!95918 tp_is_empty!26573))

(declare-datatypes ((array!70081 0))(
  ( (array!70082 (arr!33714 (Array (_ BitVec 32) (_ BitVec 64))) (size!34250 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70081)

(declare-fun array_inv!26014 (array!70081) Bool)

(assert (=> start!95918 (array_inv!26014 _keys!1070)))

(declare-datatypes ((V!40557 0))(
  ( (V!40558 (val!13343 Int)) )
))
(declare-datatypes ((ValueCell!12577 0))(
  ( (ValueCellFull!12577 (v!15964 V!40557)) (EmptyCell!12577) )
))
(declare-datatypes ((array!70083 0))(
  ( (array!70084 (arr!33715 (Array (_ BitVec 32) ValueCell!12577)) (size!34251 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70083)

(declare-fun e!620540 () Bool)

(declare-fun array_inv!26015 (array!70083) Bool)

(assert (=> start!95918 (and (array_inv!26015 _values!874) e!620540)))

(declare-fun b!1086293 () Bool)

(declare-fun e!620545 () Bool)

(assert (=> b!1086293 (= e!620545 tp_is_empty!26573)))

(declare-fun b!1086294 () Bool)

(declare-fun e!620543 () Bool)

(declare-fun e!620539 () Bool)

(assert (=> b!1086294 (= e!620543 e!620539)))

(declare-fun res!724344 () Bool)

(assert (=> b!1086294 (=> res!724344 e!620539)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1086294 (= res!724344 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16924 0))(
  ( (tuple2!16925 (_1!8473 (_ BitVec 64)) (_2!8473 V!40557)) )
))
(declare-datatypes ((List!23514 0))(
  ( (Nil!23511) (Cons!23510 (h!24719 tuple2!16924) (t!33143 List!23514)) )
))
(declare-datatypes ((ListLongMap!14893 0))(
  ( (ListLongMap!14894 (toList!7462 List!23514)) )
))
(declare-fun lt!482687 () ListLongMap!14893)

(declare-fun lt!482685 () ListLongMap!14893)

(assert (=> b!1086294 (= lt!482687 lt!482685)))

(declare-fun lt!482689 () ListLongMap!14893)

(declare-fun -!788 (ListLongMap!14893 (_ BitVec 64)) ListLongMap!14893)

(assert (=> b!1086294 (= lt!482687 (-!788 lt!482689 k!904))))

(declare-datatypes ((Unit!35742 0))(
  ( (Unit!35743) )
))
(declare-fun lt!482678 () Unit!35742)

(declare-fun lt!482688 () ListLongMap!14893)

(declare-fun zeroValue!831 () V!40557)

(declare-fun addRemoveCommutativeForDiffKeys!25 (ListLongMap!14893 (_ BitVec 64) V!40557 (_ BitVec 64)) Unit!35742)

(assert (=> b!1086294 (= lt!482678 (addRemoveCommutativeForDiffKeys!25 lt!482688 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!482681 () ListLongMap!14893)

(declare-fun lt!482677 () tuple2!16924)

(declare-fun +!3269 (ListLongMap!14893 tuple2!16924) ListLongMap!14893)

(assert (=> b!1086294 (= lt!482681 (+!3269 lt!482685 lt!482677))))

(declare-fun lt!482684 () ListLongMap!14893)

(declare-fun lt!482673 () tuple2!16924)

(assert (=> b!1086294 (= lt!482685 (+!3269 lt!482684 lt!482673))))

(declare-fun lt!482676 () ListLongMap!14893)

(declare-fun lt!482683 () ListLongMap!14893)

(assert (=> b!1086294 (= lt!482676 lt!482683)))

(assert (=> b!1086294 (= lt!482683 (+!3269 lt!482689 lt!482677))))

(assert (=> b!1086294 (= lt!482689 (+!3269 lt!482688 lt!482673))))

(declare-fun lt!482686 () ListLongMap!14893)

(assert (=> b!1086294 (= lt!482681 (+!3269 (+!3269 lt!482686 lt!482673) lt!482677))))

(declare-fun minValue!831 () V!40557)

(assert (=> b!1086294 (= lt!482677 (tuple2!16925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086294 (= lt!482673 (tuple2!16925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086295 () Bool)

(declare-fun res!724346 () Bool)

(declare-fun e!620544 () Bool)

(assert (=> b!1086295 (=> (not res!724346) (not e!620544))))

(declare-fun lt!482674 () array!70081)

(declare-datatypes ((List!23515 0))(
  ( (Nil!23512) (Cons!23511 (h!24720 (_ BitVec 64)) (t!33144 List!23515)) )
))
(declare-fun arrayNoDuplicates!0 (array!70081 (_ BitVec 32) List!23515) Bool)

(assert (=> b!1086295 (= res!724346 (arrayNoDuplicates!0 lt!482674 #b00000000000000000000000000000000 Nil!23512))))

(declare-fun b!1086296 () Bool)

(assert (=> b!1086296 (= e!620541 e!620544)))

(declare-fun res!724343 () Bool)

(assert (=> b!1086296 (=> (not res!724343) (not e!620544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70081 (_ BitVec 32)) Bool)

(assert (=> b!1086296 (= res!724343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482674 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086296 (= lt!482674 (array!70082 (store (arr!33714 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34250 _keys!1070)))))

(declare-fun b!1086297 () Bool)

(assert (=> b!1086297 (= e!620539 true)))

(assert (=> b!1086297 (= (-!788 lt!482683 k!904) (+!3269 lt!482687 lt!482677))))

(declare-fun lt!482682 () Unit!35742)

(assert (=> b!1086297 (= lt!482682 (addRemoveCommutativeForDiffKeys!25 lt!482689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun mapIsEmpty!41614 () Bool)

(declare-fun mapRes!41614 () Bool)

(assert (=> mapIsEmpty!41614 mapRes!41614))

(declare-fun b!1086298 () Bool)

(declare-fun res!724340 () Bool)

(assert (=> b!1086298 (=> (not res!724340) (not e!620541))))

(assert (=> b!1086298 (= res!724340 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34250 _keys!1070))))))

(declare-fun b!1086299 () Bool)

(declare-fun res!724337 () Bool)

(assert (=> b!1086299 (=> (not res!724337) (not e!620541))))

(assert (=> b!1086299 (= res!724337 (= (select (arr!33714 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!41614 () Bool)

(declare-fun tp!79561 () Bool)

(declare-fun e!620546 () Bool)

(assert (=> mapNonEmpty!41614 (= mapRes!41614 (and tp!79561 e!620546))))

(declare-fun mapKey!41614 () (_ BitVec 32))

(declare-fun mapRest!41614 () (Array (_ BitVec 32) ValueCell!12577))

(declare-fun mapValue!41614 () ValueCell!12577)

(assert (=> mapNonEmpty!41614 (= (arr!33715 _values!874) (store mapRest!41614 mapKey!41614 mapValue!41614))))

(declare-fun b!1086300 () Bool)

(declare-fun res!724342 () Bool)

(assert (=> b!1086300 (=> (not res!724342) (not e!620541))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086300 (= res!724342 (and (= (size!34251 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34250 _keys!1070) (size!34251 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086301 () Bool)

(declare-fun res!724339 () Bool)

(assert (=> b!1086301 (=> (not res!724339) (not e!620541))))

(assert (=> b!1086301 (= res!724339 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23512))))

(declare-fun b!1086302 () Bool)

(assert (=> b!1086302 (= e!620546 tp_is_empty!26573)))

(declare-fun b!1086303 () Bool)

(assert (=> b!1086303 (= e!620540 (and e!620545 mapRes!41614))))

(declare-fun condMapEmpty!41614 () Bool)

(declare-fun mapDefault!41614 () ValueCell!12577)

