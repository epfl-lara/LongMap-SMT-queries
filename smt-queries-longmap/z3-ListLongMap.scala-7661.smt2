; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96522 () Bool)

(assert start!96522)

(declare-fun b_free!22939 () Bool)

(declare-fun b_next!22939 () Bool)

(assert (=> start!96522 (= b_free!22939 (not b_next!22939))))

(declare-fun tp!80665 () Bool)

(declare-fun b_and!36563 () Bool)

(assert (=> start!96522 (= tp!80665 b_and!36563)))

(declare-fun b!1095442 () Bool)

(declare-fun e!625521 () Bool)

(declare-fun e!625519 () Bool)

(assert (=> b!1095442 (= e!625521 e!625519)))

(declare-fun res!730658 () Bool)

(assert (=> b!1095442 (=> (not res!730658) (not e!625519))))

(declare-datatypes ((array!70827 0))(
  ( (array!70828 (arr!34081 (Array (_ BitVec 32) (_ BitVec 64))) (size!34618 (_ BitVec 32))) )
))
(declare-fun lt!489997 () array!70827)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70827 (_ BitVec 32)) Bool)

(assert (=> b!1095442 (= res!730658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489997 mask!1414))))

(declare-fun _keys!1070 () array!70827)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095442 (= lt!489997 (array!70828 (store (arr!34081 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34618 _keys!1070)))))

(declare-fun res!730659 () Bool)

(assert (=> start!96522 (=> (not res!730659) (not e!625521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96522 (= res!730659 (validMask!0 mask!1414))))

(assert (=> start!96522 e!625521))

(assert (=> start!96522 tp!80665))

(assert (=> start!96522 true))

(declare-fun tp_is_empty!26941 () Bool)

(assert (=> start!96522 tp_is_empty!26941))

(declare-fun array_inv!26304 (array!70827) Bool)

(assert (=> start!96522 (array_inv!26304 _keys!1070)))

(declare-datatypes ((V!41049 0))(
  ( (V!41050 (val!13527 Int)) )
))
(declare-datatypes ((ValueCell!12761 0))(
  ( (ValueCellFull!12761 (v!16144 V!41049)) (EmptyCell!12761) )
))
(declare-datatypes ((array!70829 0))(
  ( (array!70830 (arr!34082 (Array (_ BitVec 32) ValueCell!12761)) (size!34619 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70829)

(declare-fun e!625523 () Bool)

(declare-fun array_inv!26305 (array!70829) Bool)

(assert (=> start!96522 (and (array_inv!26305 _values!874) e!625523)))

(declare-fun b!1095443 () Bool)

(declare-fun res!730661 () Bool)

(assert (=> b!1095443 (=> (not res!730661) (not e!625521))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095443 (= res!730661 (validKeyInArray!0 k0!904))))

(declare-fun b!1095444 () Bool)

(declare-fun e!625518 () Bool)

(assert (=> b!1095444 (= e!625518 tp_is_empty!26941)))

(declare-fun mapIsEmpty!42166 () Bool)

(declare-fun mapRes!42166 () Bool)

(assert (=> mapIsEmpty!42166 mapRes!42166))

(declare-fun b!1095445 () Bool)

(declare-fun res!730662 () Bool)

(assert (=> b!1095445 (=> (not res!730662) (not e!625521))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095445 (= res!730662 (and (= (size!34619 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34618 _keys!1070) (size!34619 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095446 () Bool)

(declare-fun res!730664 () Bool)

(assert (=> b!1095446 (=> (not res!730664) (not e!625521))))

(assert (=> b!1095446 (= res!730664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095447 () Bool)

(declare-fun res!730663 () Bool)

(assert (=> b!1095447 (=> (not res!730663) (not e!625521))))

(assert (=> b!1095447 (= res!730663 (= (select (arr!34081 _keys!1070) i!650) k0!904))))

(declare-fun b!1095448 () Bool)

(assert (=> b!1095448 (= e!625519 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41049)

(declare-datatypes ((tuple2!17218 0))(
  ( (tuple2!17219 (_1!8620 (_ BitVec 64)) (_2!8620 V!41049)) )
))
(declare-datatypes ((List!23816 0))(
  ( (Nil!23813) (Cons!23812 (h!25030 tuple2!17218) (t!33805 List!23816)) )
))
(declare-datatypes ((ListLongMap!15195 0))(
  ( (ListLongMap!15196 (toList!7613 List!23816)) )
))
(declare-fun lt!489996 () ListLongMap!15195)

(declare-fun zeroValue!831 () V!41049)

(declare-fun getCurrentListMap!4361 (array!70827 array!70829 (_ BitVec 32) (_ BitVec 32) V!41049 V!41049 (_ BitVec 32) Int) ListLongMap!15195)

(assert (=> b!1095448 (= lt!489996 (getCurrentListMap!4361 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489999 () ListLongMap!15195)

(declare-fun lt!489993 () array!70829)

(assert (=> b!1095448 (= lt!489999 (getCurrentListMap!4361 lt!489997 lt!489993 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489991 () ListLongMap!15195)

(declare-fun lt!489998 () ListLongMap!15195)

(assert (=> b!1095448 (and (= lt!489991 lt!489998) (= lt!489998 lt!489991))))

(declare-fun lt!489995 () ListLongMap!15195)

(declare-fun -!918 (ListLongMap!15195 (_ BitVec 64)) ListLongMap!15195)

(assert (=> b!1095448 (= lt!489998 (-!918 lt!489995 k0!904))))

(declare-datatypes ((Unit!36003 0))(
  ( (Unit!36004) )
))
(declare-fun lt!489992 () Unit!36003)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!190 (array!70827 array!70829 (_ BitVec 32) (_ BitVec 32) V!41049 V!41049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36003)

(assert (=> b!1095448 (= lt!489992 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!190 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4166 (array!70827 array!70829 (_ BitVec 32) (_ BitVec 32) V!41049 V!41049 (_ BitVec 32) Int) ListLongMap!15195)

(assert (=> b!1095448 (= lt!489991 (getCurrentListMapNoExtraKeys!4166 lt!489997 lt!489993 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2287 (Int (_ BitVec 64)) V!41049)

(assert (=> b!1095448 (= lt!489993 (array!70830 (store (arr!34082 _values!874) i!650 (ValueCellFull!12761 (dynLambda!2287 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34619 _values!874)))))

(assert (=> b!1095448 (= lt!489995 (getCurrentListMapNoExtraKeys!4166 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095448 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489994 () Unit!36003)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70827 (_ BitVec 64) (_ BitVec 32)) Unit!36003)

(assert (=> b!1095448 (= lt!489994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095449 () Bool)

(declare-fun e!625520 () Bool)

(assert (=> b!1095449 (= e!625523 (and e!625520 mapRes!42166))))

(declare-fun condMapEmpty!42166 () Bool)

(declare-fun mapDefault!42166 () ValueCell!12761)

(assert (=> b!1095449 (= condMapEmpty!42166 (= (arr!34082 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12761)) mapDefault!42166)))))

(declare-fun b!1095450 () Bool)

(assert (=> b!1095450 (= e!625520 tp_is_empty!26941)))

(declare-fun b!1095451 () Bool)

(declare-fun res!730660 () Bool)

(assert (=> b!1095451 (=> (not res!730660) (not e!625521))))

(declare-datatypes ((List!23817 0))(
  ( (Nil!23814) (Cons!23813 (h!25031 (_ BitVec 64)) (t!33806 List!23817)) )
))
(declare-fun arrayNoDuplicates!0 (array!70827 (_ BitVec 32) List!23817) Bool)

(assert (=> b!1095451 (= res!730660 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23814))))

(declare-fun b!1095452 () Bool)

(declare-fun res!730665 () Bool)

(assert (=> b!1095452 (=> (not res!730665) (not e!625519))))

(assert (=> b!1095452 (= res!730665 (arrayNoDuplicates!0 lt!489997 #b00000000000000000000000000000000 Nil!23814))))

(declare-fun b!1095453 () Bool)

(declare-fun res!730657 () Bool)

(assert (=> b!1095453 (=> (not res!730657) (not e!625521))))

(assert (=> b!1095453 (= res!730657 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34618 _keys!1070))))))

(declare-fun mapNonEmpty!42166 () Bool)

(declare-fun tp!80666 () Bool)

(assert (=> mapNonEmpty!42166 (= mapRes!42166 (and tp!80666 e!625518))))

(declare-fun mapRest!42166 () (Array (_ BitVec 32) ValueCell!12761))

(declare-fun mapKey!42166 () (_ BitVec 32))

(declare-fun mapValue!42166 () ValueCell!12761)

(assert (=> mapNonEmpty!42166 (= (arr!34082 _values!874) (store mapRest!42166 mapKey!42166 mapValue!42166))))

(assert (= (and start!96522 res!730659) b!1095445))

(assert (= (and b!1095445 res!730662) b!1095446))

(assert (= (and b!1095446 res!730664) b!1095451))

(assert (= (and b!1095451 res!730660) b!1095453))

(assert (= (and b!1095453 res!730657) b!1095443))

(assert (= (and b!1095443 res!730661) b!1095447))

(assert (= (and b!1095447 res!730663) b!1095442))

(assert (= (and b!1095442 res!730658) b!1095452))

(assert (= (and b!1095452 res!730665) b!1095448))

(assert (= (and b!1095449 condMapEmpty!42166) mapIsEmpty!42166))

(assert (= (and b!1095449 (not condMapEmpty!42166)) mapNonEmpty!42166))

(get-info :version)

(assert (= (and mapNonEmpty!42166 ((_ is ValueCellFull!12761) mapValue!42166)) b!1095444))

(assert (= (and b!1095449 ((_ is ValueCellFull!12761) mapDefault!42166)) b!1095450))

(assert (= start!96522 b!1095449))

(declare-fun b_lambda!17619 () Bool)

(assert (=> (not b_lambda!17619) (not b!1095448)))

(declare-fun t!33804 () Bool)

(declare-fun tb!7809 () Bool)

(assert (=> (and start!96522 (= defaultEntry!882 defaultEntry!882) t!33804) tb!7809))

(declare-fun result!16145 () Bool)

(assert (=> tb!7809 (= result!16145 tp_is_empty!26941)))

(assert (=> b!1095448 t!33804))

(declare-fun b_and!36565 () Bool)

(assert (= b_and!36563 (and (=> t!33804 result!16145) b_and!36565)))

(declare-fun m!1015727 () Bool)

(assert (=> b!1095451 m!1015727))

(declare-fun m!1015729 () Bool)

(assert (=> b!1095442 m!1015729))

(declare-fun m!1015731 () Bool)

(assert (=> b!1095442 m!1015731))

(declare-fun m!1015733 () Bool)

(assert (=> b!1095452 m!1015733))

(declare-fun m!1015735 () Bool)

(assert (=> mapNonEmpty!42166 m!1015735))

(declare-fun m!1015737 () Bool)

(assert (=> start!96522 m!1015737))

(declare-fun m!1015739 () Bool)

(assert (=> start!96522 m!1015739))

(declare-fun m!1015741 () Bool)

(assert (=> start!96522 m!1015741))

(declare-fun m!1015743 () Bool)

(assert (=> b!1095443 m!1015743))

(declare-fun m!1015745 () Bool)

(assert (=> b!1095446 m!1015745))

(declare-fun m!1015747 () Bool)

(assert (=> b!1095448 m!1015747))

(declare-fun m!1015749 () Bool)

(assert (=> b!1095448 m!1015749))

(declare-fun m!1015751 () Bool)

(assert (=> b!1095448 m!1015751))

(declare-fun m!1015753 () Bool)

(assert (=> b!1095448 m!1015753))

(declare-fun m!1015755 () Bool)

(assert (=> b!1095448 m!1015755))

(declare-fun m!1015757 () Bool)

(assert (=> b!1095448 m!1015757))

(declare-fun m!1015759 () Bool)

(assert (=> b!1095448 m!1015759))

(declare-fun m!1015761 () Bool)

(assert (=> b!1095448 m!1015761))

(declare-fun m!1015763 () Bool)

(assert (=> b!1095448 m!1015763))

(declare-fun m!1015765 () Bool)

(assert (=> b!1095448 m!1015765))

(declare-fun m!1015767 () Bool)

(assert (=> b!1095447 m!1015767))

(check-sat (not b!1095451) (not b!1095448) (not b!1095442) (not b!1095452) tp_is_empty!26941 (not b!1095443) (not mapNonEmpty!42166) (not b_next!22939) (not b_lambda!17619) (not b!1095446) (not start!96522) b_and!36565)
(check-sat b_and!36565 (not b_next!22939))
