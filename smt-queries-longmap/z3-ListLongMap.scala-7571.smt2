; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95740 () Bool)

(assert start!95740)

(declare-fun b_free!22399 () Bool)

(declare-fun b_next!22399 () Bool)

(assert (=> start!95740 (= b_free!22399 (not b_next!22399))))

(declare-fun tp!79045 () Bool)

(declare-fun b_and!35447 () Bool)

(assert (=> start!95740 (= tp!79045 b_and!35447)))

(declare-fun b!1082640 () Bool)

(declare-fun e!618680 () Bool)

(declare-fun e!618677 () Bool)

(declare-fun mapRes!41356 () Bool)

(assert (=> b!1082640 (= e!618680 (and e!618677 mapRes!41356))))

(declare-fun condMapEmpty!41356 () Bool)

(declare-datatypes ((V!40329 0))(
  ( (V!40330 (val!13257 Int)) )
))
(declare-datatypes ((ValueCell!12491 0))(
  ( (ValueCellFull!12491 (v!15877 V!40329)) (EmptyCell!12491) )
))
(declare-datatypes ((array!69672 0))(
  ( (array!69673 (arr!33510 (Array (_ BitVec 32) ValueCell!12491)) (size!34048 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69672)

(declare-fun mapDefault!41356 () ValueCell!12491)

(assert (=> b!1082640 (= condMapEmpty!41356 (= (arr!33510 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12491)) mapDefault!41356)))))

(declare-fun b!1082641 () Bool)

(declare-fun res!721722 () Bool)

(declare-fun e!618676 () Bool)

(assert (=> b!1082641 (=> (not res!721722) (not e!618676))))

(declare-datatypes ((array!69674 0))(
  ( (array!69675 (arr!33511 (Array (_ BitVec 32) (_ BitVec 64))) (size!34049 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69674)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69674 (_ BitVec 32)) Bool)

(assert (=> b!1082641 (= res!721722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!721716 () Bool)

(assert (=> start!95740 (=> (not res!721716) (not e!618676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95740 (= res!721716 (validMask!0 mask!1414))))

(assert (=> start!95740 e!618676))

(assert (=> start!95740 tp!79045))

(assert (=> start!95740 true))

(declare-fun tp_is_empty!26401 () Bool)

(assert (=> start!95740 tp_is_empty!26401))

(declare-fun array_inv!25906 (array!69674) Bool)

(assert (=> start!95740 (array_inv!25906 _keys!1070)))

(declare-fun array_inv!25907 (array!69672) Bool)

(assert (=> start!95740 (and (array_inv!25907 _values!874) e!618680)))

(declare-fun b!1082642 () Bool)

(declare-fun res!721720 () Bool)

(assert (=> b!1082642 (=> (not res!721720) (not e!618676))))

(declare-datatypes ((List!23425 0))(
  ( (Nil!23422) (Cons!23421 (h!24630 (_ BitVec 64)) (t!32873 List!23425)) )
))
(declare-fun arrayNoDuplicates!0 (array!69674 (_ BitVec 32) List!23425) Bool)

(assert (=> b!1082642 (= res!721720 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23422))))

(declare-fun b!1082643 () Bool)

(declare-fun e!618679 () Bool)

(assert (=> b!1082643 (= e!618679 (not true))))

(declare-datatypes ((tuple2!16858 0))(
  ( (tuple2!16859 (_1!8440 (_ BitVec 64)) (_2!8440 V!40329)) )
))
(declare-datatypes ((List!23426 0))(
  ( (Nil!23423) (Cons!23422 (h!24631 tuple2!16858) (t!32874 List!23426)) )
))
(declare-datatypes ((ListLongMap!14827 0))(
  ( (ListLongMap!14828 (toList!7429 List!23426)) )
))
(declare-fun lt!479573 () ListLongMap!14827)

(declare-fun lt!479568 () ListLongMap!14827)

(assert (=> b!1082643 (and (= lt!479573 lt!479568) (= lt!479568 lt!479573))))

(declare-fun lt!479569 () ListLongMap!14827)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!708 (ListLongMap!14827 (_ BitVec 64)) ListLongMap!14827)

(assert (=> b!1082643 (= lt!479568 (-!708 lt!479569 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40329)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40329)

(declare-datatypes ((Unit!35451 0))(
  ( (Unit!35452) )
))
(declare-fun lt!479571 () Unit!35451)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!6 (array!69674 array!69672 (_ BitVec 32) (_ BitVec 32) V!40329 V!40329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35451)

(assert (=> b!1082643 (= lt!479571 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!6 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479570 () array!69674)

(declare-fun getCurrentListMapNoExtraKeys!3992 (array!69674 array!69672 (_ BitVec 32) (_ BitVec 32) V!40329 V!40329 (_ BitVec 32) Int) ListLongMap!14827)

(declare-fun dynLambda!2063 (Int (_ BitVec 64)) V!40329)

(assert (=> b!1082643 (= lt!479573 (getCurrentListMapNoExtraKeys!3992 lt!479570 (array!69673 (store (arr!33510 _values!874) i!650 (ValueCellFull!12491 (dynLambda!2063 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34048 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082643 (= lt!479569 (getCurrentListMapNoExtraKeys!3992 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082643 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479572 () Unit!35451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69674 (_ BitVec 64) (_ BitVec 32)) Unit!35451)

(assert (=> b!1082643 (= lt!479572 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082644 () Bool)

(declare-fun res!721715 () Bool)

(assert (=> b!1082644 (=> (not res!721715) (not e!618676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082644 (= res!721715 (validKeyInArray!0 k0!904))))

(declare-fun b!1082645 () Bool)

(declare-fun res!721718 () Bool)

(assert (=> b!1082645 (=> (not res!721718) (not e!618676))))

(assert (=> b!1082645 (= res!721718 (= (select (arr!33511 _keys!1070) i!650) k0!904))))

(declare-fun b!1082646 () Bool)

(assert (=> b!1082646 (= e!618677 tp_is_empty!26401)))

(declare-fun mapNonEmpty!41356 () Bool)

(declare-fun tp!79046 () Bool)

(declare-fun e!618675 () Bool)

(assert (=> mapNonEmpty!41356 (= mapRes!41356 (and tp!79046 e!618675))))

(declare-fun mapRest!41356 () (Array (_ BitVec 32) ValueCell!12491))

(declare-fun mapValue!41356 () ValueCell!12491)

(declare-fun mapKey!41356 () (_ BitVec 32))

(assert (=> mapNonEmpty!41356 (= (arr!33510 _values!874) (store mapRest!41356 mapKey!41356 mapValue!41356))))

(declare-fun mapIsEmpty!41356 () Bool)

(assert (=> mapIsEmpty!41356 mapRes!41356))

(declare-fun b!1082647 () Bool)

(assert (=> b!1082647 (= e!618675 tp_is_empty!26401)))

(declare-fun b!1082648 () Bool)

(declare-fun res!721714 () Bool)

(assert (=> b!1082648 (=> (not res!721714) (not e!618676))))

(assert (=> b!1082648 (= res!721714 (and (= (size!34048 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34049 _keys!1070) (size!34048 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082649 () Bool)

(declare-fun res!721721 () Bool)

(assert (=> b!1082649 (=> (not res!721721) (not e!618679))))

(assert (=> b!1082649 (= res!721721 (arrayNoDuplicates!0 lt!479570 #b00000000000000000000000000000000 Nil!23422))))

(declare-fun b!1082650 () Bool)

(declare-fun res!721717 () Bool)

(assert (=> b!1082650 (=> (not res!721717) (not e!618676))))

(assert (=> b!1082650 (= res!721717 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34049 _keys!1070))))))

(declare-fun b!1082651 () Bool)

(assert (=> b!1082651 (= e!618676 e!618679)))

(declare-fun res!721719 () Bool)

(assert (=> b!1082651 (=> (not res!721719) (not e!618679))))

(assert (=> b!1082651 (= res!721719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479570 mask!1414))))

(assert (=> b!1082651 (= lt!479570 (array!69675 (store (arr!33511 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34049 _keys!1070)))))

(assert (= (and start!95740 res!721716) b!1082648))

(assert (= (and b!1082648 res!721714) b!1082641))

(assert (= (and b!1082641 res!721722) b!1082642))

(assert (= (and b!1082642 res!721720) b!1082650))

(assert (= (and b!1082650 res!721717) b!1082644))

(assert (= (and b!1082644 res!721715) b!1082645))

(assert (= (and b!1082645 res!721718) b!1082651))

(assert (= (and b!1082651 res!721719) b!1082649))

(assert (= (and b!1082649 res!721721) b!1082643))

(assert (= (and b!1082640 condMapEmpty!41356) mapIsEmpty!41356))

(assert (= (and b!1082640 (not condMapEmpty!41356)) mapNonEmpty!41356))

(get-info :version)

(assert (= (and mapNonEmpty!41356 ((_ is ValueCellFull!12491) mapValue!41356)) b!1082647))

(assert (= (and b!1082640 ((_ is ValueCellFull!12491) mapDefault!41356)) b!1082646))

(assert (= start!95740 b!1082640))

(declare-fun b_lambda!17047 () Bool)

(assert (=> (not b_lambda!17047) (not b!1082643)))

(declare-fun t!32872 () Bool)

(declare-fun tb!7269 () Bool)

(assert (=> (and start!95740 (= defaultEntry!882 defaultEntry!882) t!32872) tb!7269))

(declare-fun result!15065 () Bool)

(assert (=> tb!7269 (= result!15065 tp_is_empty!26401)))

(assert (=> b!1082643 t!32872))

(declare-fun b_and!35449 () Bool)

(assert (= b_and!35447 (and (=> t!32872 result!15065) b_and!35449)))

(declare-fun m!999839 () Bool)

(assert (=> b!1082644 m!999839))

(declare-fun m!999841 () Bool)

(assert (=> b!1082643 m!999841))

(declare-fun m!999843 () Bool)

(assert (=> b!1082643 m!999843))

(declare-fun m!999845 () Bool)

(assert (=> b!1082643 m!999845))

(declare-fun m!999847 () Bool)

(assert (=> b!1082643 m!999847))

(declare-fun m!999849 () Bool)

(assert (=> b!1082643 m!999849))

(declare-fun m!999851 () Bool)

(assert (=> b!1082643 m!999851))

(declare-fun m!999853 () Bool)

(assert (=> b!1082643 m!999853))

(declare-fun m!999855 () Bool)

(assert (=> b!1082643 m!999855))

(declare-fun m!999857 () Bool)

(assert (=> b!1082642 m!999857))

(declare-fun m!999859 () Bool)

(assert (=> b!1082641 m!999859))

(declare-fun m!999861 () Bool)

(assert (=> mapNonEmpty!41356 m!999861))

(declare-fun m!999863 () Bool)

(assert (=> b!1082651 m!999863))

(declare-fun m!999865 () Bool)

(assert (=> b!1082651 m!999865))

(declare-fun m!999867 () Bool)

(assert (=> start!95740 m!999867))

(declare-fun m!999869 () Bool)

(assert (=> start!95740 m!999869))

(declare-fun m!999871 () Bool)

(assert (=> start!95740 m!999871))

(declare-fun m!999873 () Bool)

(assert (=> b!1082649 m!999873))

(declare-fun m!999875 () Bool)

(assert (=> b!1082645 m!999875))

(check-sat (not mapNonEmpty!41356) (not b_next!22399) (not b!1082651) (not b!1082649) b_and!35449 (not b_lambda!17047) tp_is_empty!26401 (not b!1082641) (not b!1082642) (not b!1082643) (not b!1082644) (not start!95740))
(check-sat b_and!35449 (not b_next!22399))
