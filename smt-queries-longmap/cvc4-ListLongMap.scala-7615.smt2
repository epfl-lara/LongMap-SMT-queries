; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96014 () Bool)

(assert start!96014)

(declare-fun b_free!22667 () Bool)

(declare-fun b_next!22667 () Bool)

(assert (=> start!96014 (= b_free!22667 (not b_next!22667))))

(declare-fun tp!79849 () Bool)

(declare-fun b_and!36009 () Bool)

(assert (=> start!96014 (= tp!79849 b_and!36009)))

(declare-fun b!1088414 () Bool)

(declare-fun e!621694 () Bool)

(assert (=> b!1088414 (= e!621694 true)))

(declare-datatypes ((V!40685 0))(
  ( (V!40686 (val!13391 Int)) )
))
(declare-datatypes ((tuple2!17000 0))(
  ( (tuple2!17001 (_1!8511 (_ BitVec 64)) (_2!8511 V!40685)) )
))
(declare-datatypes ((List!23587 0))(
  ( (Nil!23584) (Cons!23583 (h!24792 tuple2!17000) (t!33312 List!23587)) )
))
(declare-datatypes ((ListLongMap!14969 0))(
  ( (ListLongMap!14970 (toList!7500 List!23587)) )
))
(declare-fun lt!484786 () ListLongMap!14969)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!484782 () ListLongMap!14969)

(declare-fun -!825 (ListLongMap!14969 (_ BitVec 64)) ListLongMap!14969)

(assert (=> b!1088414 (= (-!825 lt!484786 k!904) lt!484782)))

(declare-fun lt!484780 () ListLongMap!14969)

(declare-fun zeroValue!831 () V!40685)

(declare-datatypes ((Unit!35816 0))(
  ( (Unit!35817) )
))
(declare-fun lt!484775 () Unit!35816)

(declare-fun addRemoveCommutativeForDiffKeys!54 (ListLongMap!14969 (_ BitVec 64) V!40685 (_ BitVec 64)) Unit!35816)

(assert (=> b!1088414 (= lt!484775 (addRemoveCommutativeForDiffKeys!54 lt!484780 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun mapIsEmpty!41758 () Bool)

(declare-fun mapRes!41758 () Bool)

(assert (=> mapIsEmpty!41758 mapRes!41758))

(declare-fun b!1088415 () Bool)

(declare-fun res!725930 () Bool)

(declare-fun e!621697 () Bool)

(assert (=> b!1088415 (=> (not res!725930) (not e!621697))))

(declare-datatypes ((array!70263 0))(
  ( (array!70264 (arr!33805 (Array (_ BitVec 32) (_ BitVec 64))) (size!34341 (_ BitVec 32))) )
))
(declare-fun lt!484784 () array!70263)

(declare-datatypes ((List!23588 0))(
  ( (Nil!23585) (Cons!23584 (h!24793 (_ BitVec 64)) (t!33313 List!23588)) )
))
(declare-fun arrayNoDuplicates!0 (array!70263 (_ BitVec 32) List!23588) Bool)

(assert (=> b!1088415 (= res!725930 (arrayNoDuplicates!0 lt!484784 #b00000000000000000000000000000000 Nil!23585))))

(declare-fun b!1088416 () Bool)

(declare-fun e!621691 () Bool)

(assert (=> b!1088416 (= e!621691 e!621697)))

(declare-fun res!725933 () Bool)

(assert (=> b!1088416 (=> (not res!725933) (not e!621697))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70263 (_ BitVec 32)) Bool)

(assert (=> b!1088416 (= res!725933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484784 mask!1414))))

(declare-fun _keys!1070 () array!70263)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088416 (= lt!484784 (array!70264 (store (arr!33805 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34341 _keys!1070)))))

(declare-fun b!1088417 () Bool)

(declare-fun e!621696 () Bool)

(assert (=> b!1088417 (= e!621697 (not e!621696))))

(declare-fun res!725940 () Bool)

(assert (=> b!1088417 (=> res!725940 e!621696)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088417 (= res!725940 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40685)

(declare-fun lt!484779 () ListLongMap!14969)

(declare-datatypes ((ValueCell!12625 0))(
  ( (ValueCellFull!12625 (v!16012 V!40685)) (EmptyCell!12625) )
))
(declare-datatypes ((array!70265 0))(
  ( (array!70266 (arr!33806 (Array (_ BitVec 32) ValueCell!12625)) (size!34342 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70265)

(declare-fun getCurrentListMap!4274 (array!70263 array!70265 (_ BitVec 32) (_ BitVec 32) V!40685 V!40685 (_ BitVec 32) Int) ListLongMap!14969)

(assert (=> b!1088417 (= lt!484779 (getCurrentListMap!4274 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484776 () ListLongMap!14969)

(declare-fun lt!484781 () array!70265)

(assert (=> b!1088417 (= lt!484776 (getCurrentListMap!4274 lt!484784 lt!484781 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484783 () ListLongMap!14969)

(declare-fun lt!484785 () ListLongMap!14969)

(assert (=> b!1088417 (and (= lt!484783 lt!484785) (= lt!484785 lt!484783))))

(assert (=> b!1088417 (= lt!484785 (-!825 lt!484780 k!904))))

(declare-fun lt!484778 () Unit!35816)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!93 (array!70263 array!70265 (_ BitVec 32) (_ BitVec 32) V!40685 V!40685 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35816)

(assert (=> b!1088417 (= lt!484778 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!93 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4034 (array!70263 array!70265 (_ BitVec 32) (_ BitVec 32) V!40685 V!40685 (_ BitVec 32) Int) ListLongMap!14969)

(assert (=> b!1088417 (= lt!484783 (getCurrentListMapNoExtraKeys!4034 lt!484784 lt!484781 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2171 (Int (_ BitVec 64)) V!40685)

(assert (=> b!1088417 (= lt!484781 (array!70266 (store (arr!33806 _values!874) i!650 (ValueCellFull!12625 (dynLambda!2171 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34342 _values!874)))))

(assert (=> b!1088417 (= lt!484780 (getCurrentListMapNoExtraKeys!4034 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088417 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484777 () Unit!35816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70263 (_ BitVec 64) (_ BitVec 32)) Unit!35816)

(assert (=> b!1088417 (= lt!484777 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088418 () Bool)

(declare-fun res!725935 () Bool)

(assert (=> b!1088418 (=> (not res!725935) (not e!621691))))

(assert (=> b!1088418 (= res!725935 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23585))))

(declare-fun b!1088419 () Bool)

(declare-fun res!725931 () Bool)

(assert (=> b!1088419 (=> (not res!725931) (not e!621691))))

(assert (=> b!1088419 (= res!725931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088420 () Bool)

(declare-fun res!725938 () Bool)

(assert (=> b!1088420 (=> (not res!725938) (not e!621691))))

(assert (=> b!1088420 (= res!725938 (= (select (arr!33805 _keys!1070) i!650) k!904))))

(declare-fun b!1088421 () Bool)

(declare-fun res!725939 () Bool)

(assert (=> b!1088421 (=> (not res!725939) (not e!621691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088421 (= res!725939 (validKeyInArray!0 k!904))))

(declare-fun b!1088422 () Bool)

(declare-fun e!621698 () Bool)

(declare-fun tp_is_empty!26669 () Bool)

(assert (=> b!1088422 (= e!621698 tp_is_empty!26669)))

(declare-fun res!725936 () Bool)

(assert (=> start!96014 (=> (not res!725936) (not e!621691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96014 (= res!725936 (validMask!0 mask!1414))))

(assert (=> start!96014 e!621691))

(assert (=> start!96014 tp!79849))

(assert (=> start!96014 true))

(assert (=> start!96014 tp_is_empty!26669))

(declare-fun array_inv!26070 (array!70263) Bool)

(assert (=> start!96014 (array_inv!26070 _keys!1070)))

(declare-fun e!621693 () Bool)

(declare-fun array_inv!26071 (array!70265) Bool)

(assert (=> start!96014 (and (array_inv!26071 _values!874) e!621693)))

(declare-fun b!1088423 () Bool)

(declare-fun e!621692 () Bool)

(assert (=> b!1088423 (= e!621692 tp_is_empty!26669)))

(declare-fun mapNonEmpty!41758 () Bool)

(declare-fun tp!79850 () Bool)

(assert (=> mapNonEmpty!41758 (= mapRes!41758 (and tp!79850 e!621698))))

(declare-fun mapRest!41758 () (Array (_ BitVec 32) ValueCell!12625))

(declare-fun mapValue!41758 () ValueCell!12625)

(declare-fun mapKey!41758 () (_ BitVec 32))

(assert (=> mapNonEmpty!41758 (= (arr!33806 _values!874) (store mapRest!41758 mapKey!41758 mapValue!41758))))

(declare-fun b!1088424 () Bool)

(assert (=> b!1088424 (= e!621693 (and e!621692 mapRes!41758))))

(declare-fun condMapEmpty!41758 () Bool)

(declare-fun mapDefault!41758 () ValueCell!12625)

