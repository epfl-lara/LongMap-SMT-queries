; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96118 () Bool)

(assert start!96118)

(declare-fun b_free!22771 () Bool)

(declare-fun b_next!22771 () Bool)

(assert (=> start!96118 (= b_free!22771 (not b_next!22771))))

(declare-fun tp!80161 () Bool)

(declare-fun b_and!36217 () Bool)

(assert (=> start!96118 (= tp!80161 b_and!36217)))

(declare-fun b!1090711 () Bool)

(declare-fun res!727656 () Bool)

(declare-fun e!622942 () Bool)

(assert (=> b!1090711 (=> (not res!727656) (not e!622942))))

(declare-datatypes ((array!70467 0))(
  ( (array!70468 (arr!33907 (Array (_ BitVec 32) (_ BitVec 64))) (size!34443 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70467)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70467 (_ BitVec 32)) Bool)

(assert (=> b!1090711 (= res!727656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090712 () Bool)

(declare-fun e!622943 () Bool)

(declare-fun tp_is_empty!26773 () Bool)

(assert (=> b!1090712 (= e!622943 tp_is_empty!26773)))

(declare-fun b!1090713 () Bool)

(declare-fun e!622945 () Bool)

(assert (=> b!1090713 (= e!622945 true)))

(declare-datatypes ((V!40825 0))(
  ( (V!40826 (val!13443 Int)) )
))
(declare-datatypes ((tuple2!17090 0))(
  ( (tuple2!17091 (_1!8556 (_ BitVec 64)) (_2!8556 V!40825)) )
))
(declare-datatypes ((List!23677 0))(
  ( (Nil!23674) (Cons!23673 (h!24882 tuple2!17090) (t!33506 List!23677)) )
))
(declare-datatypes ((ListLongMap!15059 0))(
  ( (ListLongMap!15060 (toList!7545 List!23677)) )
))
(declare-fun lt!486781 () ListLongMap!15059)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!486785 () ListLongMap!15059)

(declare-fun -!868 (ListLongMap!15059 (_ BitVec 64)) ListLongMap!15059)

(assert (=> b!1090713 (= (-!868 lt!486781 k!904) lt!486785)))

(declare-datatypes ((Unit!35902 0))(
  ( (Unit!35903) )
))
(declare-fun lt!486784 () Unit!35902)

(declare-fun minValue!831 () V!40825)

(declare-fun lt!486779 () ListLongMap!15059)

(declare-fun addRemoveCommutativeForDiffKeys!92 (ListLongMap!15059 (_ BitVec 64) V!40825 (_ BitVec 64)) Unit!35902)

(assert (=> b!1090713 (= lt!486784 (addRemoveCommutativeForDiffKeys!92 lt!486779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090714 () Bool)

(declare-fun res!727660 () Bool)

(declare-fun e!622944 () Bool)

(assert (=> b!1090714 (=> (not res!727660) (not e!622944))))

(declare-fun lt!486786 () array!70467)

(declare-datatypes ((List!23678 0))(
  ( (Nil!23675) (Cons!23674 (h!24883 (_ BitVec 64)) (t!33507 List!23678)) )
))
(declare-fun arrayNoDuplicates!0 (array!70467 (_ BitVec 32) List!23678) Bool)

(assert (=> b!1090714 (= res!727660 (arrayNoDuplicates!0 lt!486786 #b00000000000000000000000000000000 Nil!23675))))

(declare-fun mapNonEmpty!41914 () Bool)

(declare-fun mapRes!41914 () Bool)

(declare-fun tp!80162 () Bool)

(declare-fun e!622940 () Bool)

(assert (=> mapNonEmpty!41914 (= mapRes!41914 (and tp!80162 e!622940))))

(declare-datatypes ((ValueCell!12677 0))(
  ( (ValueCellFull!12677 (v!16064 V!40825)) (EmptyCell!12677) )
))
(declare-datatypes ((array!70469 0))(
  ( (array!70470 (arr!33908 (Array (_ BitVec 32) ValueCell!12677)) (size!34444 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70469)

(declare-fun mapKey!41914 () (_ BitVec 32))

(declare-fun mapValue!41914 () ValueCell!12677)

(declare-fun mapRest!41914 () (Array (_ BitVec 32) ValueCell!12677))

(assert (=> mapNonEmpty!41914 (= (arr!33908 _values!874) (store mapRest!41914 mapKey!41914 mapValue!41914))))

(declare-fun b!1090715 () Bool)

(assert (=> b!1090715 (= e!622940 tp_is_empty!26773)))

(declare-fun b!1090716 () Bool)

(declare-fun res!727662 () Bool)

(assert (=> b!1090716 (=> (not res!727662) (not e!622942))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090716 (= res!727662 (and (= (size!34444 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34443 _keys!1070) (size!34444 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090717 () Bool)

(declare-fun res!727665 () Bool)

(assert (=> b!1090717 (=> (not res!727665) (not e!622942))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090717 (= res!727665 (= (select (arr!33907 _keys!1070) i!650) k!904))))

(declare-fun b!1090718 () Bool)

(declare-fun res!727664 () Bool)

(assert (=> b!1090718 (=> (not res!727664) (not e!622942))))

(assert (=> b!1090718 (= res!727664 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23675))))

(declare-fun b!1090720 () Bool)

(assert (=> b!1090720 (= e!622942 e!622944)))

(declare-fun res!727655 () Bool)

(assert (=> b!1090720 (=> (not res!727655) (not e!622944))))

(assert (=> b!1090720 (= res!727655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486786 mask!1414))))

(assert (=> b!1090720 (= lt!486786 (array!70468 (store (arr!33907 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34443 _keys!1070)))))

(declare-fun mapIsEmpty!41914 () Bool)

(assert (=> mapIsEmpty!41914 mapRes!41914))

(declare-fun b!1090721 () Bool)

(declare-fun res!727658 () Bool)

(assert (=> b!1090721 (=> (not res!727658) (not e!622942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090721 (= res!727658 (validKeyInArray!0 k!904))))

(declare-fun b!1090722 () Bool)

(declare-fun e!622946 () Bool)

(assert (=> b!1090722 (= e!622944 (not e!622946))))

(declare-fun res!727657 () Bool)

(assert (=> b!1090722 (=> res!727657 e!622946)))

(assert (=> b!1090722 (= res!727657 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!486787 () ListLongMap!15059)

(declare-fun zeroValue!831 () V!40825)

(declare-fun getCurrentListMap!4310 (array!70467 array!70469 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) Int) ListLongMap!15059)

(assert (=> b!1090722 (= lt!486787 (getCurrentListMap!4310 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486777 () ListLongMap!15059)

(declare-fun lt!486782 () array!70469)

(assert (=> b!1090722 (= lt!486777 (getCurrentListMap!4310 lt!486786 lt!486782 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486783 () ListLongMap!15059)

(declare-fun lt!486780 () ListLongMap!15059)

(assert (=> b!1090722 (and (= lt!486783 lt!486780) (= lt!486780 lt!486783))))

(assert (=> b!1090722 (= lt!486780 (-!868 lt!486779 k!904))))

(declare-fun lt!486775 () Unit!35902)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!129 (array!70467 array!70469 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35902)

(assert (=> b!1090722 (= lt!486775 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!129 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4070 (array!70467 array!70469 (_ BitVec 32) (_ BitVec 32) V!40825 V!40825 (_ BitVec 32) Int) ListLongMap!15059)

(assert (=> b!1090722 (= lt!486783 (getCurrentListMapNoExtraKeys!4070 lt!486786 lt!486782 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2207 (Int (_ BitVec 64)) V!40825)

(assert (=> b!1090722 (= lt!486782 (array!70470 (store (arr!33908 _values!874) i!650 (ValueCellFull!12677 (dynLambda!2207 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34444 _values!874)))))

(assert (=> b!1090722 (= lt!486779 (getCurrentListMapNoExtraKeys!4070 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090722 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486776 () Unit!35902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70467 (_ BitVec 64) (_ BitVec 32)) Unit!35902)

(assert (=> b!1090722 (= lt!486776 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090723 () Bool)

(declare-fun res!727659 () Bool)

(assert (=> b!1090723 (=> (not res!727659) (not e!622942))))

(assert (=> b!1090723 (= res!727659 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34443 _keys!1070))))))

(declare-fun b!1090724 () Bool)

(assert (=> b!1090724 (= e!622946 e!622945)))

(declare-fun res!727661 () Bool)

(assert (=> b!1090724 (=> res!727661 e!622945)))

(assert (=> b!1090724 (= res!727661 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1090724 (= lt!486787 lt!486781)))

(declare-fun lt!486778 () tuple2!17090)

(declare-fun +!3333 (ListLongMap!15059 tuple2!17090) ListLongMap!15059)

(assert (=> b!1090724 (= lt!486781 (+!3333 lt!486779 lt!486778))))

(assert (=> b!1090724 (= lt!486777 lt!486785)))

(assert (=> b!1090724 (= lt!486785 (+!3333 lt!486780 lt!486778))))

(assert (=> b!1090724 (= lt!486777 (+!3333 lt!486783 lt!486778))))

(assert (=> b!1090724 (= lt!486778 (tuple2!17091 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun res!727663 () Bool)

(assert (=> start!96118 (=> (not res!727663) (not e!622942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96118 (= res!727663 (validMask!0 mask!1414))))

(assert (=> start!96118 e!622942))

(assert (=> start!96118 tp!80161))

(assert (=> start!96118 true))

(assert (=> start!96118 tp_is_empty!26773))

(declare-fun array_inv!26146 (array!70467) Bool)

(assert (=> start!96118 (array_inv!26146 _keys!1070)))

(declare-fun e!622941 () Bool)

(declare-fun array_inv!26147 (array!70469) Bool)

(assert (=> start!96118 (and (array_inv!26147 _values!874) e!622941)))

(declare-fun b!1090719 () Bool)

(assert (=> b!1090719 (= e!622941 (and e!622943 mapRes!41914))))

(declare-fun condMapEmpty!41914 () Bool)

(declare-fun mapDefault!41914 () ValueCell!12677)

