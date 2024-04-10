; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96258 () Bool)

(assert start!96258)

(declare-fun b_free!22911 () Bool)

(declare-fun b_next!22911 () Bool)

(assert (=> start!96258 (= b_free!22911 (not b_next!22911))))

(declare-fun tp!80582 () Bool)

(declare-fun b_and!36497 () Bool)

(assert (=> start!96258 (= tp!80582 b_and!36497)))

(declare-fun b!1093583 () Bool)

(declare-fun e!624416 () Bool)

(declare-fun e!624414 () Bool)

(assert (=> b!1093583 (= e!624416 e!624414)))

(declare-fun res!729764 () Bool)

(assert (=> b!1093583 (=> (not res!729764) (not e!624414))))

(declare-datatypes ((array!70743 0))(
  ( (array!70744 (arr!34045 (Array (_ BitVec 32) (_ BitVec 64))) (size!34581 (_ BitVec 32))) )
))
(declare-fun lt!489102 () array!70743)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70743 (_ BitVec 32)) Bool)

(assert (=> b!1093583 (= res!729764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489102 mask!1414))))

(declare-fun _keys!1070 () array!70743)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093583 (= lt!489102 (array!70744 (store (arr!34045 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34581 _keys!1070)))))

(declare-fun mapIsEmpty!42124 () Bool)

(declare-fun mapRes!42124 () Bool)

(assert (=> mapIsEmpty!42124 mapRes!42124))

(declare-fun b!1093584 () Bool)

(declare-fun res!729761 () Bool)

(assert (=> b!1093584 (=> (not res!729761) (not e!624414))))

(declare-datatypes ((List!23786 0))(
  ( (Nil!23783) (Cons!23782 (h!24991 (_ BitVec 64)) (t!33755 List!23786)) )
))
(declare-fun arrayNoDuplicates!0 (array!70743 (_ BitVec 32) List!23786) Bool)

(assert (=> b!1093584 (= res!729761 (arrayNoDuplicates!0 lt!489102 #b00000000000000000000000000000000 Nil!23783))))

(declare-fun res!729760 () Bool)

(assert (=> start!96258 (=> (not res!729760) (not e!624416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96258 (= res!729760 (validMask!0 mask!1414))))

(assert (=> start!96258 e!624416))

(assert (=> start!96258 tp!80582))

(assert (=> start!96258 true))

(declare-fun tp_is_empty!26913 () Bool)

(assert (=> start!96258 tp_is_empty!26913))

(declare-fun array_inv!26236 (array!70743) Bool)

(assert (=> start!96258 (array_inv!26236 _keys!1070)))

(declare-datatypes ((V!41011 0))(
  ( (V!41012 (val!13513 Int)) )
))
(declare-datatypes ((ValueCell!12747 0))(
  ( (ValueCellFull!12747 (v!16134 V!41011)) (EmptyCell!12747) )
))
(declare-datatypes ((array!70745 0))(
  ( (array!70746 (arr!34046 (Array (_ BitVec 32) ValueCell!12747)) (size!34582 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70745)

(declare-fun e!624412 () Bool)

(declare-fun array_inv!26237 (array!70745) Bool)

(assert (=> start!96258 (and (array_inv!26237 _values!874) e!624412)))

(declare-fun b!1093585 () Bool)

(declare-fun e!624411 () Bool)

(assert (=> b!1093585 (= e!624412 (and e!624411 mapRes!42124))))

(declare-fun condMapEmpty!42124 () Bool)

(declare-fun mapDefault!42124 () ValueCell!12747)

(assert (=> b!1093585 (= condMapEmpty!42124 (= (arr!34046 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12747)) mapDefault!42124)))))

(declare-fun b!1093586 () Bool)

(declare-fun res!729759 () Bool)

(assert (=> b!1093586 (=> (not res!729759) (not e!624416))))

(assert (=> b!1093586 (= res!729759 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34581 _keys!1070))))))

(declare-fun b!1093587 () Bool)

(declare-fun res!729763 () Bool)

(assert (=> b!1093587 (=> (not res!729763) (not e!624416))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093587 (= res!729763 (and (= (size!34582 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34581 _keys!1070) (size!34582 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093588 () Bool)

(declare-fun res!729757 () Bool)

(assert (=> b!1093588 (=> (not res!729757) (not e!624416))))

(assert (=> b!1093588 (= res!729757 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23783))))

(declare-fun b!1093589 () Bool)

(declare-fun res!729765 () Bool)

(assert (=> b!1093589 (=> (not res!729765) (not e!624416))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093589 (= res!729765 (= (select (arr!34045 _keys!1070) i!650) k0!904))))

(declare-fun b!1093590 () Bool)

(assert (=> b!1093590 (= e!624414 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41011)

(declare-datatypes ((tuple2!17192 0))(
  ( (tuple2!17193 (_1!8607 (_ BitVec 64)) (_2!8607 V!41011)) )
))
(declare-datatypes ((List!23787 0))(
  ( (Nil!23784) (Cons!23783 (h!24992 tuple2!17192) (t!33756 List!23787)) )
))
(declare-datatypes ((ListLongMap!15161 0))(
  ( (ListLongMap!15162 (toList!7596 List!23787)) )
))
(declare-fun lt!489101 () ListLongMap!15161)

(declare-fun zeroValue!831 () V!41011)

(declare-fun getCurrentListMap!4352 (array!70743 array!70745 (_ BitVec 32) (_ BitVec 32) V!41011 V!41011 (_ BitVec 32) Int) ListLongMap!15161)

(assert (=> b!1093590 (= lt!489101 (getCurrentListMap!4352 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489098 () ListLongMap!15161)

(declare-fun lt!489103 () array!70745)

(assert (=> b!1093590 (= lt!489098 (getCurrentListMap!4352 lt!489102 lt!489103 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489104 () ListLongMap!15161)

(declare-fun lt!489105 () ListLongMap!15161)

(assert (=> b!1093590 (and (= lt!489104 lt!489105) (= lt!489105 lt!489104))))

(declare-fun lt!489099 () ListLongMap!15161)

(declare-fun -!915 (ListLongMap!15161 (_ BitVec 64)) ListLongMap!15161)

(assert (=> b!1093590 (= lt!489105 (-!915 lt!489099 k0!904))))

(declare-datatypes ((Unit!35996 0))(
  ( (Unit!35997) )
))
(declare-fun lt!489106 () Unit!35996)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!171 (array!70743 array!70745 (_ BitVec 32) (_ BitVec 32) V!41011 V!41011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35996)

(assert (=> b!1093590 (= lt!489106 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!171 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4112 (array!70743 array!70745 (_ BitVec 32) (_ BitVec 32) V!41011 V!41011 (_ BitVec 32) Int) ListLongMap!15161)

(assert (=> b!1093590 (= lt!489104 (getCurrentListMapNoExtraKeys!4112 lt!489102 lt!489103 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2249 (Int (_ BitVec 64)) V!41011)

(assert (=> b!1093590 (= lt!489103 (array!70746 (store (arr!34046 _values!874) i!650 (ValueCellFull!12747 (dynLambda!2249 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34582 _values!874)))))

(assert (=> b!1093590 (= lt!489099 (getCurrentListMapNoExtraKeys!4112 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093590 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489100 () Unit!35996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70743 (_ BitVec 64) (_ BitVec 32)) Unit!35996)

(assert (=> b!1093590 (= lt!489100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093591 () Bool)

(assert (=> b!1093591 (= e!624411 tp_is_empty!26913)))

(declare-fun mapNonEmpty!42124 () Bool)

(declare-fun tp!80581 () Bool)

(declare-fun e!624413 () Bool)

(assert (=> mapNonEmpty!42124 (= mapRes!42124 (and tp!80581 e!624413))))

(declare-fun mapValue!42124 () ValueCell!12747)

(declare-fun mapRest!42124 () (Array (_ BitVec 32) ValueCell!12747))

(declare-fun mapKey!42124 () (_ BitVec 32))

(assert (=> mapNonEmpty!42124 (= (arr!34046 _values!874) (store mapRest!42124 mapKey!42124 mapValue!42124))))

(declare-fun b!1093592 () Bool)

(declare-fun res!729758 () Bool)

(assert (=> b!1093592 (=> (not res!729758) (not e!624416))))

(assert (=> b!1093592 (= res!729758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093593 () Bool)

(declare-fun res!729762 () Bool)

(assert (=> b!1093593 (=> (not res!729762) (not e!624416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093593 (= res!729762 (validKeyInArray!0 k0!904))))

(declare-fun b!1093594 () Bool)

(assert (=> b!1093594 (= e!624413 tp_is_empty!26913)))

(assert (= (and start!96258 res!729760) b!1093587))

(assert (= (and b!1093587 res!729763) b!1093592))

(assert (= (and b!1093592 res!729758) b!1093588))

(assert (= (and b!1093588 res!729757) b!1093586))

(assert (= (and b!1093586 res!729759) b!1093593))

(assert (= (and b!1093593 res!729762) b!1093589))

(assert (= (and b!1093589 res!729765) b!1093583))

(assert (= (and b!1093583 res!729764) b!1093584))

(assert (= (and b!1093584 res!729761) b!1093590))

(assert (= (and b!1093585 condMapEmpty!42124) mapIsEmpty!42124))

(assert (= (and b!1093585 (not condMapEmpty!42124)) mapNonEmpty!42124))

(get-info :version)

(assert (= (and mapNonEmpty!42124 ((_ is ValueCellFull!12747) mapValue!42124)) b!1093594))

(assert (= (and b!1093585 ((_ is ValueCellFull!12747) mapDefault!42124)) b!1093591))

(assert (= start!96258 b!1093585))

(declare-fun b_lambda!17581 () Bool)

(assert (=> (not b_lambda!17581) (not b!1093590)))

(declare-fun t!33754 () Bool)

(declare-fun tb!7789 () Bool)

(assert (=> (and start!96258 (= defaultEntry!882 defaultEntry!882) t!33754) tb!7789))

(declare-fun result!16097 () Bool)

(assert (=> tb!7789 (= result!16097 tp_is_empty!26913)))

(assert (=> b!1093590 t!33754))

(declare-fun b_and!36499 () Bool)

(assert (= b_and!36497 (and (=> t!33754 result!16097) b_and!36499)))

(declare-fun m!1013467 () Bool)

(assert (=> b!1093589 m!1013467))

(declare-fun m!1013469 () Bool)

(assert (=> mapNonEmpty!42124 m!1013469))

(declare-fun m!1013471 () Bool)

(assert (=> b!1093590 m!1013471))

(declare-fun m!1013473 () Bool)

(assert (=> b!1093590 m!1013473))

(declare-fun m!1013475 () Bool)

(assert (=> b!1093590 m!1013475))

(declare-fun m!1013477 () Bool)

(assert (=> b!1093590 m!1013477))

(declare-fun m!1013479 () Bool)

(assert (=> b!1093590 m!1013479))

(declare-fun m!1013481 () Bool)

(assert (=> b!1093590 m!1013481))

(declare-fun m!1013483 () Bool)

(assert (=> b!1093590 m!1013483))

(declare-fun m!1013485 () Bool)

(assert (=> b!1093590 m!1013485))

(declare-fun m!1013487 () Bool)

(assert (=> b!1093590 m!1013487))

(declare-fun m!1013489 () Bool)

(assert (=> b!1093590 m!1013489))

(declare-fun m!1013491 () Bool)

(assert (=> b!1093583 m!1013491))

(declare-fun m!1013493 () Bool)

(assert (=> b!1093583 m!1013493))

(declare-fun m!1013495 () Bool)

(assert (=> b!1093588 m!1013495))

(declare-fun m!1013497 () Bool)

(assert (=> b!1093584 m!1013497))

(declare-fun m!1013499 () Bool)

(assert (=> b!1093592 m!1013499))

(declare-fun m!1013501 () Bool)

(assert (=> start!96258 m!1013501))

(declare-fun m!1013503 () Bool)

(assert (=> start!96258 m!1013503))

(declare-fun m!1013505 () Bool)

(assert (=> start!96258 m!1013505))

(declare-fun m!1013507 () Bool)

(assert (=> b!1093593 m!1013507))

(check-sat (not b!1093593) (not b!1093592) (not b!1093590) b_and!36499 (not b!1093584) (not b_next!22911) tp_is_empty!26913 (not b!1093588) (not start!96258) (not b_lambda!17581) (not mapNonEmpty!42124) (not b!1093583))
(check-sat b_and!36499 (not b_next!22911))
