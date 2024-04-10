; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96128 () Bool)

(assert start!96128)

(declare-fun b_free!22781 () Bool)

(declare-fun b_next!22781 () Bool)

(assert (=> start!96128 (= b_free!22781 (not b_next!22781))))

(declare-fun tp!80192 () Bool)

(declare-fun b_and!36237 () Bool)

(assert (=> start!96128 (= tp!80192 b_and!36237)))

(declare-fun b!1090932 () Bool)

(declare-fun e!623063 () Bool)

(declare-fun e!623064 () Bool)

(assert (=> b!1090932 (= e!623063 e!623064)))

(declare-fun res!727829 () Bool)

(assert (=> b!1090932 (=> (not res!727829) (not e!623064))))

(declare-datatypes ((array!70487 0))(
  ( (array!70488 (arr!33917 (Array (_ BitVec 32) (_ BitVec 64))) (size!34453 (_ BitVec 32))) )
))
(declare-fun lt!486975 () array!70487)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70487 (_ BitVec 32)) Bool)

(assert (=> b!1090932 (= res!727829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486975 mask!1414))))

(declare-fun _keys!1070 () array!70487)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090932 (= lt!486975 (array!70488 (store (arr!33917 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34453 _keys!1070)))))

(declare-fun mapNonEmpty!41929 () Bool)

(declare-fun mapRes!41929 () Bool)

(declare-fun tp!80191 () Bool)

(declare-fun e!623062 () Bool)

(assert (=> mapNonEmpty!41929 (= mapRes!41929 (and tp!80191 e!623062))))

(declare-datatypes ((V!40837 0))(
  ( (V!40838 (val!13448 Int)) )
))
(declare-datatypes ((ValueCell!12682 0))(
  ( (ValueCellFull!12682 (v!16069 V!40837)) (EmptyCell!12682) )
))
(declare-datatypes ((array!70489 0))(
  ( (array!70490 (arr!33918 (Array (_ BitVec 32) ValueCell!12682)) (size!34454 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70489)

(declare-fun mapValue!41929 () ValueCell!12682)

(declare-fun mapKey!41929 () (_ BitVec 32))

(declare-fun mapRest!41929 () (Array (_ BitVec 32) ValueCell!12682))

(assert (=> mapNonEmpty!41929 (= (arr!33918 _values!874) (store mapRest!41929 mapKey!41929 mapValue!41929))))

(declare-fun b!1090933 () Bool)

(declare-fun res!727826 () Bool)

(assert (=> b!1090933 (=> (not res!727826) (not e!623063))))

(assert (=> b!1090933 (= res!727826 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34453 _keys!1070))))))

(declare-fun b!1090934 () Bool)

(declare-fun res!727823 () Bool)

(assert (=> b!1090934 (=> (not res!727823) (not e!623063))))

(assert (=> b!1090934 (= res!727823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090935 () Bool)

(declare-fun e!623059 () Bool)

(declare-fun e!623066 () Bool)

(assert (=> b!1090935 (= e!623059 e!623066)))

(declare-fun res!727820 () Bool)

(assert (=> b!1090935 (=> res!727820 e!623066)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1090935 (= res!727820 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17100 0))(
  ( (tuple2!17101 (_1!8561 (_ BitVec 64)) (_2!8561 V!40837)) )
))
(declare-datatypes ((List!23687 0))(
  ( (Nil!23684) (Cons!23683 (h!24892 tuple2!17100) (t!33526 List!23687)) )
))
(declare-datatypes ((ListLongMap!15069 0))(
  ( (ListLongMap!15070 (toList!7550 List!23687)) )
))
(declare-fun lt!486982 () ListLongMap!15069)

(declare-fun lt!486974 () ListLongMap!15069)

(assert (=> b!1090935 (= lt!486982 lt!486974)))

(declare-fun lt!486980 () ListLongMap!15069)

(declare-fun lt!486972 () tuple2!17100)

(declare-fun +!3337 (ListLongMap!15069 tuple2!17100) ListLongMap!15069)

(assert (=> b!1090935 (= lt!486974 (+!3337 lt!486980 lt!486972))))

(declare-fun lt!486981 () ListLongMap!15069)

(declare-fun lt!486971 () ListLongMap!15069)

(assert (=> b!1090935 (= lt!486981 lt!486971)))

(declare-fun lt!486977 () ListLongMap!15069)

(assert (=> b!1090935 (= lt!486971 (+!3337 lt!486977 lt!486972))))

(declare-fun lt!486970 () ListLongMap!15069)

(assert (=> b!1090935 (= lt!486981 (+!3337 lt!486970 lt!486972))))

(declare-fun minValue!831 () V!40837)

(assert (=> b!1090935 (= lt!486972 (tuple2!17101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090936 () Bool)

(declare-fun res!727825 () Bool)

(assert (=> b!1090936 (=> (not res!727825) (not e!623063))))

(assert (=> b!1090936 (= res!727825 (= (select (arr!33917 _keys!1070) i!650) k!904))))

(declare-fun b!1090937 () Bool)

(declare-fun tp_is_empty!26783 () Bool)

(assert (=> b!1090937 (= e!623062 tp_is_empty!26783)))

(declare-fun b!1090938 () Bool)

(declare-fun res!727830 () Bool)

(assert (=> b!1090938 (=> (not res!727830) (not e!623063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090938 (= res!727830 (validKeyInArray!0 k!904))))

(declare-fun b!1090939 () Bool)

(declare-fun e!623060 () Bool)

(assert (=> b!1090939 (= e!623060 tp_is_empty!26783)))

(declare-fun b!1090931 () Bool)

(assert (=> b!1090931 (= e!623066 true)))

(declare-fun -!872 (ListLongMap!15069 (_ BitVec 64)) ListLongMap!15069)

(assert (=> b!1090931 (= (-!872 lt!486974 k!904) lt!486971)))

(declare-datatypes ((Unit!35910 0))(
  ( (Unit!35911) )
))
(declare-fun lt!486978 () Unit!35910)

(declare-fun addRemoveCommutativeForDiffKeys!96 (ListLongMap!15069 (_ BitVec 64) V!40837 (_ BitVec 64)) Unit!35910)

(assert (=> b!1090931 (= lt!486978 (addRemoveCommutativeForDiffKeys!96 lt!486980 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun res!727821 () Bool)

(assert (=> start!96128 (=> (not res!727821) (not e!623063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96128 (= res!727821 (validMask!0 mask!1414))))

(assert (=> start!96128 e!623063))

(assert (=> start!96128 tp!80192))

(assert (=> start!96128 true))

(assert (=> start!96128 tp_is_empty!26783))

(declare-fun array_inv!26154 (array!70487) Bool)

(assert (=> start!96128 (array_inv!26154 _keys!1070)))

(declare-fun e!623061 () Bool)

(declare-fun array_inv!26155 (array!70489) Bool)

(assert (=> start!96128 (and (array_inv!26155 _values!874) e!623061)))

(declare-fun b!1090940 () Bool)

(assert (=> b!1090940 (= e!623061 (and e!623060 mapRes!41929))))

(declare-fun condMapEmpty!41929 () Bool)

(declare-fun mapDefault!41929 () ValueCell!12682)

