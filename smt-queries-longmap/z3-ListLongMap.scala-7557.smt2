; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95898 () Bool)

(assert start!95898)

(declare-fun b_free!22315 () Bool)

(declare-fun b_next!22315 () Bool)

(assert (=> start!95898 (= b_free!22315 (not b_next!22315))))

(declare-fun tp!78793 () Bool)

(declare-fun b_and!35315 () Bool)

(assert (=> start!95898 (= tp!78793 b_and!35315)))

(declare-fun b!1082524 () Bool)

(declare-fun res!721178 () Bool)

(declare-fun e!618867 () Bool)

(assert (=> b!1082524 (=> (not res!721178) (not e!618867))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69619 0))(
  ( (array!69620 (arr!33477 (Array (_ BitVec 32) (_ BitVec 64))) (size!34014 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69619)

(assert (=> b!1082524 (= res!721178 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34014 _keys!1070))))))

(declare-fun b!1082525 () Bool)

(declare-fun res!721171 () Bool)

(declare-fun e!618870 () Bool)

(assert (=> b!1082525 (=> (not res!721171) (not e!618870))))

(declare-fun lt!479740 () array!69619)

(declare-datatypes ((List!23329 0))(
  ( (Nil!23326) (Cons!23325 (h!24543 (_ BitVec 64)) (t!32694 List!23329)) )
))
(declare-fun arrayNoDuplicates!0 (array!69619 (_ BitVec 32) List!23329) Bool)

(assert (=> b!1082525 (= res!721171 (arrayNoDuplicates!0 lt!479740 #b00000000000000000000000000000000 Nil!23326))))

(declare-fun b!1082526 () Bool)

(declare-fun res!721176 () Bool)

(assert (=> b!1082526 (=> (not res!721176) (not e!618867))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40217 0))(
  ( (V!40218 (val!13215 Int)) )
))
(declare-datatypes ((ValueCell!12449 0))(
  ( (ValueCellFull!12449 (v!15832 V!40217)) (EmptyCell!12449) )
))
(declare-datatypes ((array!69621 0))(
  ( (array!69622 (arr!33478 (Array (_ BitVec 32) ValueCell!12449)) (size!34015 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69621)

(assert (=> b!1082526 (= res!721176 (and (= (size!34015 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34014 _keys!1070) (size!34015 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082527 () Bool)

(assert (=> b!1082527 (= e!618867 e!618870)))

(declare-fun res!721173 () Bool)

(assert (=> b!1082527 (=> (not res!721173) (not e!618870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69619 (_ BitVec 32)) Bool)

(assert (=> b!1082527 (= res!721173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479740 mask!1414))))

(assert (=> b!1082527 (= lt!479740 (array!69620 (store (arr!33477 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34014 _keys!1070)))))

(declare-fun res!721175 () Bool)

(assert (=> start!95898 (=> (not res!721175) (not e!618867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95898 (= res!721175 (validMask!0 mask!1414))))

(assert (=> start!95898 e!618867))

(assert (=> start!95898 tp!78793))

(assert (=> start!95898 true))

(declare-fun tp_is_empty!26317 () Bool)

(assert (=> start!95898 tp_is_empty!26317))

(declare-fun array_inv!25882 (array!69619) Bool)

(assert (=> start!95898 (array_inv!25882 _keys!1070)))

(declare-fun e!618871 () Bool)

(declare-fun array_inv!25883 (array!69621) Bool)

(assert (=> start!95898 (and (array_inv!25883 _values!874) e!618871)))

(declare-fun b!1082528 () Bool)

(declare-fun res!721177 () Bool)

(assert (=> b!1082528 (=> (not res!721177) (not e!618867))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1082528 (= res!721177 (= (select (arr!33477 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41230 () Bool)

(declare-fun mapRes!41230 () Bool)

(declare-fun tp!78794 () Bool)

(declare-fun e!618868 () Bool)

(assert (=> mapNonEmpty!41230 (= mapRes!41230 (and tp!78794 e!618868))))

(declare-fun mapValue!41230 () ValueCell!12449)

(declare-fun mapKey!41230 () (_ BitVec 32))

(declare-fun mapRest!41230 () (Array (_ BitVec 32) ValueCell!12449))

(assert (=> mapNonEmpty!41230 (= (arr!33478 _values!874) (store mapRest!41230 mapKey!41230 mapValue!41230))))

(declare-fun b!1082529 () Bool)

(assert (=> b!1082529 (= e!618868 tp_is_empty!26317)))

(declare-fun mapIsEmpty!41230 () Bool)

(assert (=> mapIsEmpty!41230 mapRes!41230))

(declare-fun b!1082530 () Bool)

(declare-fun res!721174 () Bool)

(assert (=> b!1082530 (=> (not res!721174) (not e!618867))))

(assert (=> b!1082530 (= res!721174 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23326))))

(declare-fun b!1082531 () Bool)

(declare-fun e!618869 () Bool)

(assert (=> b!1082531 (= e!618871 (and e!618869 mapRes!41230))))

(declare-fun condMapEmpty!41230 () Bool)

(declare-fun mapDefault!41230 () ValueCell!12449)

(assert (=> b!1082531 (= condMapEmpty!41230 (= (arr!33478 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12449)) mapDefault!41230)))))

(declare-fun b!1082532 () Bool)

(declare-fun res!721179 () Bool)

(assert (=> b!1082532 (=> (not res!721179) (not e!618867))))

(assert (=> b!1082532 (= res!721179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082533 () Bool)

(assert (=> b!1082533 (= e!618870 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40217)

(declare-datatypes ((tuple2!16740 0))(
  ( (tuple2!16741 (_1!8381 (_ BitVec 64)) (_2!8381 V!40217)) )
))
(declare-datatypes ((List!23330 0))(
  ( (Nil!23327) (Cons!23326 (h!24544 tuple2!16740) (t!32695 List!23330)) )
))
(declare-datatypes ((ListLongMap!14717 0))(
  ( (ListLongMap!14718 (toList!7374 List!23330)) )
))
(declare-fun lt!479739 () ListLongMap!14717)

(declare-fun zeroValue!831 () V!40217)

(declare-fun getCurrentListMapNoExtraKeys!3951 (array!69619 array!69621 (_ BitVec 32) (_ BitVec 32) V!40217 V!40217 (_ BitVec 32) Int) ListLongMap!14717)

(declare-fun dynLambda!2072 (Int (_ BitVec 64)) V!40217)

(assert (=> b!1082533 (= lt!479739 (getCurrentListMapNoExtraKeys!3951 lt!479740 (array!69622 (store (arr!33478 _values!874) i!650 (ValueCellFull!12449 (dynLambda!2072 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34015 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479741 () ListLongMap!14717)

(assert (=> b!1082533 (= lt!479741 (getCurrentListMapNoExtraKeys!3951 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082533 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35539 0))(
  ( (Unit!35540) )
))
(declare-fun lt!479742 () Unit!35539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69619 (_ BitVec 64) (_ BitVec 32)) Unit!35539)

(assert (=> b!1082533 (= lt!479742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082534 () Bool)

(assert (=> b!1082534 (= e!618869 tp_is_empty!26317)))

(declare-fun b!1082535 () Bool)

(declare-fun res!721172 () Bool)

(assert (=> b!1082535 (=> (not res!721172) (not e!618867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082535 (= res!721172 (validKeyInArray!0 k0!904))))

(assert (= (and start!95898 res!721175) b!1082526))

(assert (= (and b!1082526 res!721176) b!1082532))

(assert (= (and b!1082532 res!721179) b!1082530))

(assert (= (and b!1082530 res!721174) b!1082524))

(assert (= (and b!1082524 res!721178) b!1082535))

(assert (= (and b!1082535 res!721172) b!1082528))

(assert (= (and b!1082528 res!721177) b!1082527))

(assert (= (and b!1082527 res!721173) b!1082525))

(assert (= (and b!1082525 res!721171) b!1082533))

(assert (= (and b!1082531 condMapEmpty!41230) mapIsEmpty!41230))

(assert (= (and b!1082531 (not condMapEmpty!41230)) mapNonEmpty!41230))

(get-info :version)

(assert (= (and mapNonEmpty!41230 ((_ is ValueCellFull!12449) mapValue!41230)) b!1082529))

(assert (= (and b!1082531 ((_ is ValueCellFull!12449) mapDefault!41230)) b!1082534))

(assert (= start!95898 b!1082531))

(declare-fun b_lambda!16995 () Bool)

(assert (=> (not b_lambda!16995) (not b!1082533)))

(declare-fun t!32693 () Bool)

(declare-fun tb!7185 () Bool)

(assert (=> (and start!95898 (= defaultEntry!882 defaultEntry!882) t!32693) tb!7185))

(declare-fun result!14897 () Bool)

(assert (=> tb!7185 (= result!14897 tp_is_empty!26317)))

(assert (=> b!1082533 t!32693))

(declare-fun b_and!35317 () Bool)

(assert (= b_and!35315 (and (=> t!32693 result!14897) b_and!35317)))

(declare-fun m!1000685 () Bool)

(assert (=> b!1082533 m!1000685))

(declare-fun m!1000687 () Bool)

(assert (=> b!1082533 m!1000687))

(declare-fun m!1000689 () Bool)

(assert (=> b!1082533 m!1000689))

(declare-fun m!1000691 () Bool)

(assert (=> b!1082533 m!1000691))

(declare-fun m!1000693 () Bool)

(assert (=> b!1082533 m!1000693))

(declare-fun m!1000695 () Bool)

(assert (=> b!1082533 m!1000695))

(declare-fun m!1000697 () Bool)

(assert (=> b!1082530 m!1000697))

(declare-fun m!1000699 () Bool)

(assert (=> mapNonEmpty!41230 m!1000699))

(declare-fun m!1000701 () Bool)

(assert (=> start!95898 m!1000701))

(declare-fun m!1000703 () Bool)

(assert (=> start!95898 m!1000703))

(declare-fun m!1000705 () Bool)

(assert (=> start!95898 m!1000705))

(declare-fun m!1000707 () Bool)

(assert (=> b!1082527 m!1000707))

(declare-fun m!1000709 () Bool)

(assert (=> b!1082527 m!1000709))

(declare-fun m!1000711 () Bool)

(assert (=> b!1082532 m!1000711))

(declare-fun m!1000713 () Bool)

(assert (=> b!1082528 m!1000713))

(declare-fun m!1000715 () Bool)

(assert (=> b!1082525 m!1000715))

(declare-fun m!1000717 () Bool)

(assert (=> b!1082535 m!1000717))

(check-sat (not b!1082533) b_and!35317 (not start!95898) (not b!1082530) (not mapNonEmpty!41230) (not b!1082527) (not b!1082535) (not b!1082525) tp_is_empty!26317 (not b!1082532) (not b_next!22315) (not b_lambda!16995))
(check-sat b_and!35317 (not b_next!22315))
