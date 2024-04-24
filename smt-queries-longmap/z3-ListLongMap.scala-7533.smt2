; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95738 () Bool)

(assert start!95738)

(declare-fun b!1079877 () Bool)

(declare-fun e!617536 () Bool)

(assert (=> b!1079877 (= e!617536 false)))

(declare-fun lt!479172 () Bool)

(declare-datatypes ((array!69337 0))(
  ( (array!69338 (arr!33337 (Array (_ BitVec 32) (_ BitVec 64))) (size!33874 (_ BitVec 32))) )
))
(declare-fun lt!479171 () array!69337)

(declare-datatypes ((List!23250 0))(
  ( (Nil!23247) (Cons!23246 (h!24464 (_ BitVec 64)) (t!32601 List!23250)) )
))
(declare-fun arrayNoDuplicates!0 (array!69337 (_ BitVec 32) List!23250) Bool)

(assert (=> b!1079877 (= lt!479172 (arrayNoDuplicates!0 lt!479171 #b00000000000000000000000000000000 Nil!23247))))

(declare-fun b!1079878 () Bool)

(declare-fun e!617532 () Bool)

(declare-fun e!617535 () Bool)

(declare-fun mapRes!41011 () Bool)

(assert (=> b!1079878 (= e!617532 (and e!617535 mapRes!41011))))

(declare-fun condMapEmpty!41011 () Bool)

(declare-datatypes ((V!40025 0))(
  ( (V!40026 (val!13143 Int)) )
))
(declare-datatypes ((ValueCell!12377 0))(
  ( (ValueCellFull!12377 (v!15760 V!40025)) (EmptyCell!12377) )
))
(declare-datatypes ((array!69339 0))(
  ( (array!69340 (arr!33338 (Array (_ BitVec 32) ValueCell!12377)) (size!33875 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69339)

(declare-fun mapDefault!41011 () ValueCell!12377)

(assert (=> b!1079878 (= condMapEmpty!41011 (= (arr!33338 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12377)) mapDefault!41011)))))

(declare-fun b!1079879 () Bool)

(declare-fun e!617533 () Bool)

(declare-fun tp_is_empty!26173 () Bool)

(assert (=> b!1079879 (= e!617533 tp_is_empty!26173)))

(declare-fun b!1079880 () Bool)

(declare-fun res!719212 () Bool)

(declare-fun e!617534 () Bool)

(assert (=> b!1079880 (=> (not res!719212) (not e!617534))))

(declare-fun _keys!1070 () array!69337)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69337 (_ BitVec 32)) Bool)

(assert (=> b!1079880 (= res!719212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079881 () Bool)

(declare-fun res!719215 () Bool)

(assert (=> b!1079881 (=> (not res!719215) (not e!617534))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079881 (= res!719215 (and (= (size!33875 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33874 _keys!1070) (size!33875 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079882 () Bool)

(assert (=> b!1079882 (= e!617535 tp_is_empty!26173)))

(declare-fun mapNonEmpty!41011 () Bool)

(declare-fun tp!78473 () Bool)

(assert (=> mapNonEmpty!41011 (= mapRes!41011 (and tp!78473 e!617533))))

(declare-fun mapValue!41011 () ValueCell!12377)

(declare-fun mapKey!41011 () (_ BitVec 32))

(declare-fun mapRest!41011 () (Array (_ BitVec 32) ValueCell!12377))

(assert (=> mapNonEmpty!41011 (= (arr!33338 _values!874) (store mapRest!41011 mapKey!41011 mapValue!41011))))

(declare-fun b!1079883 () Bool)

(declare-fun res!719214 () Bool)

(assert (=> b!1079883 (=> (not res!719214) (not e!617534))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079883 (= res!719214 (validKeyInArray!0 k0!904))))

(declare-fun b!1079884 () Bool)

(assert (=> b!1079884 (= e!617534 e!617536)))

(declare-fun res!719208 () Bool)

(assert (=> b!1079884 (=> (not res!719208) (not e!617536))))

(assert (=> b!1079884 (= res!719208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479171 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079884 (= lt!479171 (array!69338 (store (arr!33337 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33874 _keys!1070)))))

(declare-fun b!1079885 () Bool)

(declare-fun res!719210 () Bool)

(assert (=> b!1079885 (=> (not res!719210) (not e!617534))))

(assert (=> b!1079885 (= res!719210 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23247))))

(declare-fun b!1079886 () Bool)

(declare-fun res!719209 () Bool)

(assert (=> b!1079886 (=> (not res!719209) (not e!617534))))

(assert (=> b!1079886 (= res!719209 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33874 _keys!1070))))))

(declare-fun res!719211 () Bool)

(assert (=> start!95738 (=> (not res!719211) (not e!617534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95738 (= res!719211 (validMask!0 mask!1414))))

(assert (=> start!95738 e!617534))

(assert (=> start!95738 true))

(declare-fun array_inv!25790 (array!69337) Bool)

(assert (=> start!95738 (array_inv!25790 _keys!1070)))

(declare-fun array_inv!25791 (array!69339) Bool)

(assert (=> start!95738 (and (array_inv!25791 _values!874) e!617532)))

(declare-fun b!1079887 () Bool)

(declare-fun res!719213 () Bool)

(assert (=> b!1079887 (=> (not res!719213) (not e!617534))))

(assert (=> b!1079887 (= res!719213 (= (select (arr!33337 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41011 () Bool)

(assert (=> mapIsEmpty!41011 mapRes!41011))

(assert (= (and start!95738 res!719211) b!1079881))

(assert (= (and b!1079881 res!719215) b!1079880))

(assert (= (and b!1079880 res!719212) b!1079885))

(assert (= (and b!1079885 res!719210) b!1079886))

(assert (= (and b!1079886 res!719209) b!1079883))

(assert (= (and b!1079883 res!719214) b!1079887))

(assert (= (and b!1079887 res!719213) b!1079884))

(assert (= (and b!1079884 res!719208) b!1079877))

(assert (= (and b!1079878 condMapEmpty!41011) mapIsEmpty!41011))

(assert (= (and b!1079878 (not condMapEmpty!41011)) mapNonEmpty!41011))

(get-info :version)

(assert (= (and mapNonEmpty!41011 ((_ is ValueCellFull!12377) mapValue!41011)) b!1079879))

(assert (= (and b!1079878 ((_ is ValueCellFull!12377) mapDefault!41011)) b!1079882))

(assert (= start!95738 b!1079878))

(declare-fun m!998685 () Bool)

(assert (=> start!95738 m!998685))

(declare-fun m!998687 () Bool)

(assert (=> start!95738 m!998687))

(declare-fun m!998689 () Bool)

(assert (=> start!95738 m!998689))

(declare-fun m!998691 () Bool)

(assert (=> b!1079887 m!998691))

(declare-fun m!998693 () Bool)

(assert (=> b!1079883 m!998693))

(declare-fun m!998695 () Bool)

(assert (=> b!1079884 m!998695))

(declare-fun m!998697 () Bool)

(assert (=> b!1079884 m!998697))

(declare-fun m!998699 () Bool)

(assert (=> b!1079880 m!998699))

(declare-fun m!998701 () Bool)

(assert (=> mapNonEmpty!41011 m!998701))

(declare-fun m!998703 () Bool)

(assert (=> b!1079877 m!998703))

(declare-fun m!998705 () Bool)

(assert (=> b!1079885 m!998705))

(check-sat tp_is_empty!26173 (not b!1079877) (not start!95738) (not mapNonEmpty!41011) (not b!1079885) (not b!1079883) (not b!1079884) (not b!1079880))
(check-sat)
