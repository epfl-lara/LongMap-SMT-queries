; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96164 () Bool)

(assert start!96164)

(declare-fun b_free!22817 () Bool)

(declare-fun b_next!22817 () Bool)

(assert (=> start!96164 (= b_free!22817 (not b_next!22817))))

(declare-fun tp!80300 () Bool)

(declare-fun b_and!36309 () Bool)

(assert (=> start!96164 (= tp!80300 b_and!36309)))

(declare-fun b!1091723 () Bool)

(declare-fun res!728423 () Bool)

(declare-fun e!623496 () Bool)

(assert (=> b!1091723 (=> (not res!728423) (not e!623496))))

(declare-datatypes ((array!70557 0))(
  ( (array!70558 (arr!33952 (Array (_ BitVec 32) (_ BitVec 64))) (size!34488 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70557)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091723 (= res!728423 (= (select (arr!33952 _keys!1070) i!650) k!904))))

(declare-fun b!1091724 () Bool)

(declare-fun e!623492 () Bool)

(declare-fun e!623495 () Bool)

(assert (=> b!1091724 (= e!623492 (not e!623495))))

(declare-fun res!728419 () Bool)

(assert (=> b!1091724 (=> res!728419 e!623495)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091724 (= res!728419 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40885 0))(
  ( (V!40886 (val!13466 Int)) )
))
(declare-fun minValue!831 () V!40885)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17132 0))(
  ( (tuple2!17133 (_1!8577 (_ BitVec 64)) (_2!8577 V!40885)) )
))
(declare-datatypes ((List!23716 0))(
  ( (Nil!23713) (Cons!23712 (h!24921 tuple2!17132) (t!33591 List!23716)) )
))
(declare-datatypes ((ListLongMap!15101 0))(
  ( (ListLongMap!15102 (toList!7566 List!23716)) )
))
(declare-fun lt!487678 () ListLongMap!15101)

(declare-fun zeroValue!831 () V!40885)

(declare-datatypes ((ValueCell!12700 0))(
  ( (ValueCellFull!12700 (v!16087 V!40885)) (EmptyCell!12700) )
))
(declare-datatypes ((array!70559 0))(
  ( (array!70560 (arr!33953 (Array (_ BitVec 32) ValueCell!12700)) (size!34489 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70559)

(declare-fun getCurrentListMap!4324 (array!70557 array!70559 (_ BitVec 32) (_ BitVec 32) V!40885 V!40885 (_ BitVec 32) Int) ListLongMap!15101)

(assert (=> b!1091724 (= lt!487678 (getCurrentListMap!4324 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487684 () ListLongMap!15101)

(declare-fun lt!487681 () array!70557)

(declare-fun lt!487682 () array!70559)

(assert (=> b!1091724 (= lt!487684 (getCurrentListMap!4324 lt!487681 lt!487682 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487674 () ListLongMap!15101)

(declare-fun lt!487679 () ListLongMap!15101)

(assert (=> b!1091724 (and (= lt!487674 lt!487679) (= lt!487679 lt!487674))))

(declare-fun lt!487672 () ListLongMap!15101)

(declare-fun -!886 (ListLongMap!15101 (_ BitVec 64)) ListLongMap!15101)

(assert (=> b!1091724 (= lt!487679 (-!886 lt!487672 k!904))))

(declare-datatypes ((Unit!35938 0))(
  ( (Unit!35939) )
))
(declare-fun lt!487675 () Unit!35938)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!143 (array!70557 array!70559 (_ BitVec 32) (_ BitVec 32) V!40885 V!40885 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35938)

(assert (=> b!1091724 (= lt!487675 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!143 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4084 (array!70557 array!70559 (_ BitVec 32) (_ BitVec 32) V!40885 V!40885 (_ BitVec 32) Int) ListLongMap!15101)

(assert (=> b!1091724 (= lt!487674 (getCurrentListMapNoExtraKeys!4084 lt!487681 lt!487682 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2221 (Int (_ BitVec 64)) V!40885)

(assert (=> b!1091724 (= lt!487682 (array!70560 (store (arr!33953 _values!874) i!650 (ValueCellFull!12700 (dynLambda!2221 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34489 _values!874)))))

(assert (=> b!1091724 (= lt!487672 (getCurrentListMapNoExtraKeys!4084 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091724 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!487683 () Unit!35938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70557 (_ BitVec 64) (_ BitVec 32)) Unit!35938)

(assert (=> b!1091724 (= lt!487683 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1091725 () Bool)

(declare-fun e!623494 () Bool)

(assert (=> b!1091725 (= e!623495 e!623494)))

(declare-fun res!728414 () Bool)

(assert (=> b!1091725 (=> res!728414 e!623494)))

(assert (=> b!1091725 (= res!728414 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!487673 () ListLongMap!15101)

(assert (=> b!1091725 (= lt!487678 lt!487673)))

(declare-fun lt!487677 () tuple2!17132)

(declare-fun +!3348 (ListLongMap!15101 tuple2!17132) ListLongMap!15101)

(assert (=> b!1091725 (= lt!487673 (+!3348 lt!487672 lt!487677))))

(declare-fun lt!487680 () ListLongMap!15101)

(assert (=> b!1091725 (= lt!487684 lt!487680)))

(assert (=> b!1091725 (= lt!487680 (+!3348 lt!487679 lt!487677))))

(assert (=> b!1091725 (= lt!487684 (+!3348 lt!487674 lt!487677))))

(assert (=> b!1091725 (= lt!487677 (tuple2!17133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091726 () Bool)

(declare-fun res!728424 () Bool)

(assert (=> b!1091726 (=> (not res!728424) (not e!623496))))

(assert (=> b!1091726 (= res!728424 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34488 _keys!1070))))))

(declare-fun b!1091727 () Bool)

(declare-fun res!728415 () Bool)

(assert (=> b!1091727 (=> (not res!728415) (not e!623496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091727 (= res!728415 (validKeyInArray!0 k!904))))

(declare-fun b!1091728 () Bool)

(declare-fun e!623498 () Bool)

(declare-fun e!623491 () Bool)

(declare-fun mapRes!41983 () Bool)

(assert (=> b!1091728 (= e!623498 (and e!623491 mapRes!41983))))

(declare-fun condMapEmpty!41983 () Bool)

(declare-fun mapDefault!41983 () ValueCell!12700)

