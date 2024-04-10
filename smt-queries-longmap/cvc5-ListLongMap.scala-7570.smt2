; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95740 () Bool)

(assert start!95740)

(declare-fun b_free!22393 () Bool)

(declare-fun b_next!22393 () Bool)

(assert (=> start!95740 (= b_free!22393 (not b_next!22393))))

(declare-fun tp!79028 () Bool)

(declare-fun b_and!35461 () Bool)

(assert (=> start!95740 (= tp!79028 b_and!35461)))

(declare-fun res!721705 () Bool)

(declare-fun e!618718 () Bool)

(assert (=> start!95740 (=> (not res!721705) (not e!618718))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95740 (= res!721705 (validMask!0 mask!1414))))

(assert (=> start!95740 e!618718))

(assert (=> start!95740 tp!79028))

(assert (=> start!95740 true))

(declare-fun tp_is_empty!26395 () Bool)

(assert (=> start!95740 tp_is_empty!26395))

(declare-datatypes ((array!69735 0))(
  ( (array!69736 (arr!33541 (Array (_ BitVec 32) (_ BitVec 64))) (size!34077 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69735)

(declare-fun array_inv!25888 (array!69735) Bool)

(assert (=> start!95740 (array_inv!25888 _keys!1070)))

(declare-datatypes ((V!40321 0))(
  ( (V!40322 (val!13254 Int)) )
))
(declare-datatypes ((ValueCell!12488 0))(
  ( (ValueCellFull!12488 (v!15875 V!40321)) (EmptyCell!12488) )
))
(declare-datatypes ((array!69737 0))(
  ( (array!69738 (arr!33542 (Array (_ BitVec 32) ValueCell!12488)) (size!34078 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69737)

(declare-fun e!618714 () Bool)

(declare-fun array_inv!25889 (array!69737) Bool)

(assert (=> start!95740 (and (array_inv!25889 _values!874) e!618714)))

(declare-fun mapIsEmpty!41347 () Bool)

(declare-fun mapRes!41347 () Bool)

(assert (=> mapIsEmpty!41347 mapRes!41347))

(declare-fun b!1082679 () Bool)

(declare-fun res!721707 () Bool)

(assert (=> b!1082679 (=> (not res!721707) (not e!618718))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082679 (= res!721707 (= (select (arr!33541 _keys!1070) i!650) k!904))))

(declare-fun b!1082680 () Bool)

(declare-fun e!618719 () Bool)

(assert (=> b!1082680 (= e!618719 (not true))))

(declare-datatypes ((tuple2!16792 0))(
  ( (tuple2!16793 (_1!8407 (_ BitVec 64)) (_2!8407 V!40321)) )
))
(declare-datatypes ((List!23378 0))(
  ( (Nil!23375) (Cons!23374 (h!24583 tuple2!16792) (t!32829 List!23378)) )
))
(declare-datatypes ((ListLongMap!14761 0))(
  ( (ListLongMap!14762 (toList!7396 List!23378)) )
))
(declare-fun lt!479717 () ListLongMap!14761)

(declare-fun lt!479716 () ListLongMap!14761)

(assert (=> b!1082680 (and (= lt!479717 lt!479716) (= lt!479716 lt!479717))))

(declare-fun lt!479718 () ListLongMap!14761)

(declare-fun -!723 (ListLongMap!14761 (_ BitVec 64)) ListLongMap!14761)

(assert (=> b!1082680 (= lt!479716 (-!723 lt!479718 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40321)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35612 0))(
  ( (Unit!35613) )
))
(declare-fun lt!479714 () Unit!35612)

(declare-fun zeroValue!831 () V!40321)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!3 (array!69735 array!69737 (_ BitVec 32) (_ BitVec 32) V!40321 V!40321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35612)

(assert (=> b!1082680 (= lt!479714 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!3 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479719 () array!69735)

(declare-fun getCurrentListMapNoExtraKeys!3944 (array!69735 array!69737 (_ BitVec 32) (_ BitVec 32) V!40321 V!40321 (_ BitVec 32) Int) ListLongMap!14761)

(declare-fun dynLambda!2081 (Int (_ BitVec 64)) V!40321)

(assert (=> b!1082680 (= lt!479717 (getCurrentListMapNoExtraKeys!3944 lt!479719 (array!69738 (store (arr!33542 _values!874) i!650 (ValueCellFull!12488 (dynLambda!2081 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34078 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082680 (= lt!479718 (getCurrentListMapNoExtraKeys!3944 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082680 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479715 () Unit!35612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69735 (_ BitVec 64) (_ BitVec 32)) Unit!35612)

(assert (=> b!1082680 (= lt!479715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1082681 () Bool)

(declare-fun res!721708 () Bool)

(assert (=> b!1082681 (=> (not res!721708) (not e!618718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69735 (_ BitVec 32)) Bool)

(assert (=> b!1082681 (= res!721708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082682 () Bool)

(declare-fun res!721706 () Bool)

(assert (=> b!1082682 (=> (not res!721706) (not e!618719))))

(declare-datatypes ((List!23379 0))(
  ( (Nil!23376) (Cons!23375 (h!24584 (_ BitVec 64)) (t!32830 List!23379)) )
))
(declare-fun arrayNoDuplicates!0 (array!69735 (_ BitVec 32) List!23379) Bool)

(assert (=> b!1082682 (= res!721706 (arrayNoDuplicates!0 lt!479719 #b00000000000000000000000000000000 Nil!23376))))

(declare-fun b!1082683 () Bool)

(declare-fun res!721704 () Bool)

(assert (=> b!1082683 (=> (not res!721704) (not e!618718))))

(assert (=> b!1082683 (= res!721704 (and (= (size!34078 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34077 _keys!1070) (size!34078 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082684 () Bool)

(declare-fun res!721702 () Bool)

(assert (=> b!1082684 (=> (not res!721702) (not e!618718))))

(assert (=> b!1082684 (= res!721702 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34077 _keys!1070))))))

(declare-fun b!1082685 () Bool)

(declare-fun e!618715 () Bool)

(assert (=> b!1082685 (= e!618714 (and e!618715 mapRes!41347))))

(declare-fun condMapEmpty!41347 () Bool)

(declare-fun mapDefault!41347 () ValueCell!12488)

