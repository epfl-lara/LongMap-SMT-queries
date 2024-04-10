; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95936 () Bool)

(assert start!95936)

(declare-fun b_free!22589 () Bool)

(declare-fun b_next!22589 () Bool)

(assert (=> start!95936 (= b_free!22589 (not b_next!22589))))

(declare-fun tp!79615 () Bool)

(declare-fun b_and!35853 () Bool)

(assert (=> start!95936 (= tp!79615 b_and!35853)))

(declare-fun b!1086689 () Bool)

(declare-fun res!724637 () Bool)

(declare-fun e!620760 () Bool)

(assert (=> b!1086689 (=> (not res!724637) (not e!620760))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086689 (= res!724637 (validKeyInArray!0 k!904))))

(declare-fun b!1086690 () Bool)

(declare-fun e!620757 () Bool)

(declare-fun e!620761 () Bool)

(assert (=> b!1086690 (= e!620757 (not e!620761))))

(declare-fun res!724641 () Bool)

(assert (=> b!1086690 (=> res!724641 e!620761)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086690 (= res!724641 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((V!40581 0))(
  ( (V!40582 (val!13352 Int)) )
))
(declare-fun zeroValue!831 () V!40581)

(declare-datatypes ((array!70115 0))(
  ( (array!70116 (arr!33731 (Array (_ BitVec 32) (_ BitVec 64))) (size!34267 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70115)

(declare-datatypes ((ValueCell!12586 0))(
  ( (ValueCellFull!12586 (v!15973 V!40581)) (EmptyCell!12586) )
))
(declare-datatypes ((array!70117 0))(
  ( (array!70118 (arr!33732 (Array (_ BitVec 32) ValueCell!12586)) (size!34268 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70117)

(declare-fun minValue!831 () V!40581)

(declare-datatypes ((tuple2!16940 0))(
  ( (tuple2!16941 (_1!8481 (_ BitVec 64)) (_2!8481 V!40581)) )
))
(declare-datatypes ((List!23529 0))(
  ( (Nil!23526) (Cons!23525 (h!24734 tuple2!16940) (t!33176 List!23529)) )
))
(declare-datatypes ((ListLongMap!14909 0))(
  ( (ListLongMap!14910 (toList!7470 List!23529)) )
))
(declare-fun lt!483133 () ListLongMap!14909)

(declare-fun getCurrentListMap!4248 (array!70115 array!70117 (_ BitVec 32) (_ BitVec 32) V!40581 V!40581 (_ BitVec 32) Int) ListLongMap!14909)

(assert (=> b!1086690 (= lt!483133 (getCurrentListMap!4248 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483135 () array!70117)

(declare-fun lt!483146 () ListLongMap!14909)

(declare-fun lt!483147 () array!70115)

(assert (=> b!1086690 (= lt!483146 (getCurrentListMap!4248 lt!483147 lt!483135 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483139 () ListLongMap!14909)

(declare-fun lt!483143 () ListLongMap!14909)

(assert (=> b!1086690 (and (= lt!483139 lt!483143) (= lt!483143 lt!483139))))

(declare-fun lt!483142 () ListLongMap!14909)

(declare-fun -!796 (ListLongMap!14909 (_ BitVec 64)) ListLongMap!14909)

(assert (=> b!1086690 (= lt!483143 (-!796 lt!483142 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35758 0))(
  ( (Unit!35759) )
))
(declare-fun lt!483137 () Unit!35758)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!67 (array!70115 array!70117 (_ BitVec 32) (_ BitVec 32) V!40581 V!40581 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35758)

(assert (=> b!1086690 (= lt!483137 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!67 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4008 (array!70115 array!70117 (_ BitVec 32) (_ BitVec 32) V!40581 V!40581 (_ BitVec 32) Int) ListLongMap!14909)

(assert (=> b!1086690 (= lt!483139 (getCurrentListMapNoExtraKeys!4008 lt!483147 lt!483135 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2145 (Int (_ BitVec 64)) V!40581)

(assert (=> b!1086690 (= lt!483135 (array!70118 (store (arr!33732 _values!874) i!650 (ValueCellFull!12586 (dynLambda!2145 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34268 _values!874)))))

(assert (=> b!1086690 (= lt!483142 (getCurrentListMapNoExtraKeys!4008 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086690 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!483145 () Unit!35758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70115 (_ BitVec 64) (_ BitVec 32)) Unit!35758)

(assert (=> b!1086690 (= lt!483145 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1086691 () Bool)

(declare-fun res!724642 () Bool)

(assert (=> b!1086691 (=> (not res!724642) (not e!620760))))

(assert (=> b!1086691 (= res!724642 (= (select (arr!33731 _keys!1070) i!650) k!904))))

(declare-fun b!1086692 () Bool)

(declare-fun res!724638 () Bool)

(assert (=> b!1086692 (=> (not res!724638) (not e!620757))))

(declare-datatypes ((List!23530 0))(
  ( (Nil!23527) (Cons!23526 (h!24735 (_ BitVec 64)) (t!33177 List!23530)) )
))
(declare-fun arrayNoDuplicates!0 (array!70115 (_ BitVec 32) List!23530) Bool)

(assert (=> b!1086692 (= res!724638 (arrayNoDuplicates!0 lt!483147 #b00000000000000000000000000000000 Nil!23527))))

(declare-fun b!1086693 () Bool)

(declare-fun res!724639 () Bool)

(assert (=> b!1086693 (=> (not res!724639) (not e!620760))))

(assert (=> b!1086693 (= res!724639 (and (= (size!34268 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34267 _keys!1070) (size!34268 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086694 () Bool)

(declare-fun res!724635 () Bool)

(assert (=> b!1086694 (=> (not res!724635) (not e!620760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70115 (_ BitVec 32)) Bool)

(assert (=> b!1086694 (= res!724635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086695 () Bool)

(declare-fun res!724634 () Bool)

(assert (=> b!1086695 (=> (not res!724634) (not e!620760))))

(assert (=> b!1086695 (= res!724634 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23527))))

(declare-fun mapNonEmpty!41641 () Bool)

(declare-fun mapRes!41641 () Bool)

(declare-fun tp!79616 () Bool)

(declare-fun e!620758 () Bool)

(assert (=> mapNonEmpty!41641 (= mapRes!41641 (and tp!79616 e!620758))))

(declare-fun mapValue!41641 () ValueCell!12586)

(declare-fun mapRest!41641 () (Array (_ BitVec 32) ValueCell!12586))

(declare-fun mapKey!41641 () (_ BitVec 32))

(assert (=> mapNonEmpty!41641 (= (arr!33732 _values!874) (store mapRest!41641 mapKey!41641 mapValue!41641))))

(declare-fun mapIsEmpty!41641 () Bool)

(assert (=> mapIsEmpty!41641 mapRes!41641))

(declare-fun b!1086696 () Bool)

(declare-fun e!620755 () Bool)

(assert (=> b!1086696 (= e!620755 true)))

(declare-fun lt!483141 () ListLongMap!14909)

(declare-fun lt!483144 () tuple2!16940)

(declare-fun lt!483148 () ListLongMap!14909)

(declare-fun +!3277 (ListLongMap!14909 tuple2!16940) ListLongMap!14909)

(assert (=> b!1086696 (= (-!796 lt!483148 k!904) (+!3277 lt!483141 lt!483144))))

(declare-fun lt!483140 () Unit!35758)

(declare-fun lt!483134 () ListLongMap!14909)

(declare-fun addRemoveCommutativeForDiffKeys!33 (ListLongMap!14909 (_ BitVec 64) V!40581 (_ BitVec 64)) Unit!35758)

(assert (=> b!1086696 (= lt!483140 (addRemoveCommutativeForDiffKeys!33 lt!483134 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun res!724644 () Bool)

(assert (=> start!95936 (=> (not res!724644) (not e!620760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95936 (= res!724644 (validMask!0 mask!1414))))

(assert (=> start!95936 e!620760))

(assert (=> start!95936 tp!79615))

(assert (=> start!95936 true))

(declare-fun tp_is_empty!26591 () Bool)

(assert (=> start!95936 tp_is_empty!26591))

(declare-fun array_inv!26026 (array!70115) Bool)

(assert (=> start!95936 (array_inv!26026 _keys!1070)))

(declare-fun e!620762 () Bool)

(declare-fun array_inv!26027 (array!70117) Bool)

(assert (=> start!95936 (and (array_inv!26027 _values!874) e!620762)))

(declare-fun b!1086697 () Bool)

(assert (=> b!1086697 (= e!620758 tp_is_empty!26591)))

(declare-fun b!1086698 () Bool)

(assert (=> b!1086698 (= e!620760 e!620757)))

(declare-fun res!724643 () Bool)

(assert (=> b!1086698 (=> (not res!724643) (not e!620757))))

(assert (=> b!1086698 (= res!724643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483147 mask!1414))))

(assert (=> b!1086698 (= lt!483147 (array!70116 (store (arr!33731 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34267 _keys!1070)))))

(declare-fun b!1086699 () Bool)

(declare-fun e!620756 () Bool)

(assert (=> b!1086699 (= e!620756 tp_is_empty!26591)))

(declare-fun b!1086700 () Bool)

(declare-fun res!724636 () Bool)

(assert (=> b!1086700 (=> (not res!724636) (not e!620760))))

(assert (=> b!1086700 (= res!724636 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34267 _keys!1070))))))

(declare-fun b!1086701 () Bool)

(assert (=> b!1086701 (= e!620761 e!620755)))

(declare-fun res!724640 () Bool)

(assert (=> b!1086701 (=> res!724640 e!620755)))

(assert (=> b!1086701 (= res!724640 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!483132 () ListLongMap!14909)

(assert (=> b!1086701 (= lt!483141 lt!483132)))

(assert (=> b!1086701 (= lt!483141 (-!796 lt!483134 k!904))))

(declare-fun lt!483136 () Unit!35758)

(assert (=> b!1086701 (= lt!483136 (addRemoveCommutativeForDiffKeys!33 lt!483142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(assert (=> b!1086701 (= lt!483146 (+!3277 lt!483132 lt!483144))))

(declare-fun lt!483138 () tuple2!16940)

(assert (=> b!1086701 (= lt!483132 (+!3277 lt!483143 lt!483138))))

(assert (=> b!1086701 (= lt!483133 lt!483148)))

(assert (=> b!1086701 (= lt!483148 (+!3277 lt!483134 lt!483144))))

(assert (=> b!1086701 (= lt!483134 (+!3277 lt!483142 lt!483138))))

(assert (=> b!1086701 (= lt!483146 (+!3277 (+!3277 lt!483139 lt!483138) lt!483144))))

(assert (=> b!1086701 (= lt!483144 (tuple2!16941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086701 (= lt!483138 (tuple2!16941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086702 () Bool)

(assert (=> b!1086702 (= e!620762 (and e!620756 mapRes!41641))))

(declare-fun condMapEmpty!41641 () Bool)

(declare-fun mapDefault!41641 () ValueCell!12586)

