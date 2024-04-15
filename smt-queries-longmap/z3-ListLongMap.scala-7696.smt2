; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96622 () Bool)

(assert start!96622)

(declare-fun b_free!23101 () Bool)

(declare-fun b_next!23101 () Bool)

(assert (=> start!96622 (= b_free!23101 (not b_next!23101))))

(declare-fun tp!81241 () Bool)

(declare-fun b_and!36895 () Bool)

(assert (=> start!96622 (= tp!81241 b_and!36895)))

(declare-fun b!1098761 () Bool)

(declare-fun res!733283 () Bool)

(declare-fun e!627126 () Bool)

(assert (=> b!1098761 (=> (not res!733283) (not e!627126))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71122 0))(
  ( (array!71123 (arr!34229 (Array (_ BitVec 32) (_ BitVec 64))) (size!34767 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71122)

(declare-datatypes ((V!41329 0))(
  ( (V!41330 (val!13632 Int)) )
))
(declare-datatypes ((ValueCell!12866 0))(
  ( (ValueCellFull!12866 (v!16256 V!41329)) (EmptyCell!12866) )
))
(declare-datatypes ((array!71124 0))(
  ( (array!71125 (arr!34230 (Array (_ BitVec 32) ValueCell!12866)) (size!34768 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71124)

(assert (=> b!1098761 (= res!733283 (and (= (size!34768 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34767 _keys!1070) (size!34768 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098762 () Bool)

(declare-fun e!627122 () Bool)

(declare-fun e!627128 () Bool)

(assert (=> b!1098762 (= e!627122 e!627128)))

(declare-fun res!733285 () Bool)

(assert (=> b!1098762 (=> res!733285 e!627128)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1098762 (= res!733285 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17384 0))(
  ( (tuple2!17385 (_1!8703 (_ BitVec 64)) (_2!8703 V!41329)) )
))
(declare-datatypes ((List!23975 0))(
  ( (Nil!23972) (Cons!23971 (h!25180 tuple2!17384) (t!34113 List!23975)) )
))
(declare-datatypes ((ListLongMap!15353 0))(
  ( (ListLongMap!15354 (toList!7692 List!23975)) )
))
(declare-fun lt!491634 () ListLongMap!15353)

(declare-fun lt!491624 () ListLongMap!15353)

(assert (=> b!1098762 (= lt!491634 lt!491624)))

(declare-fun lt!491622 () ListLongMap!15353)

(declare-fun -!927 (ListLongMap!15353 (_ BitVec 64)) ListLongMap!15353)

(assert (=> b!1098762 (= lt!491634 (-!927 lt!491622 k0!904))))

(declare-fun lt!491630 () ListLongMap!15353)

(declare-fun zeroValue!831 () V!41329)

(declare-datatypes ((Unit!35969 0))(
  ( (Unit!35970) )
))
(declare-fun lt!491632 () Unit!35969)

(declare-fun addRemoveCommutativeForDiffKeys!122 (ListLongMap!15353 (_ BitVec 64) V!41329 (_ BitVec 64)) Unit!35969)

(assert (=> b!1098762 (= lt!491632 (addRemoveCommutativeForDiffKeys!122 lt!491630 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!491628 () ListLongMap!15353)

(declare-fun lt!491619 () tuple2!17384)

(declare-fun +!3404 (ListLongMap!15353 tuple2!17384) ListLongMap!15353)

(assert (=> b!1098762 (= lt!491628 (+!3404 lt!491624 lt!491619))))

(declare-fun lt!491623 () ListLongMap!15353)

(declare-fun lt!491631 () tuple2!17384)

(assert (=> b!1098762 (= lt!491624 (+!3404 lt!491623 lt!491631))))

(declare-fun lt!491620 () ListLongMap!15353)

(declare-fun lt!491635 () ListLongMap!15353)

(assert (=> b!1098762 (= lt!491620 lt!491635)))

(assert (=> b!1098762 (= lt!491635 (+!3404 lt!491622 lt!491619))))

(assert (=> b!1098762 (= lt!491622 (+!3404 lt!491630 lt!491631))))

(declare-fun lt!491633 () ListLongMap!15353)

(assert (=> b!1098762 (= lt!491628 (+!3404 (+!3404 lt!491633 lt!491631) lt!491619))))

(declare-fun minValue!831 () V!41329)

(assert (=> b!1098762 (= lt!491619 (tuple2!17385 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098762 (= lt!491631 (tuple2!17385 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098763 () Bool)

(declare-fun res!733292 () Bool)

(declare-fun e!627125 () Bool)

(assert (=> b!1098763 (=> (not res!733292) (not e!627125))))

(declare-fun lt!491621 () array!71122)

(declare-datatypes ((List!23976 0))(
  ( (Nil!23973) (Cons!23972 (h!25181 (_ BitVec 64)) (t!34114 List!23976)) )
))
(declare-fun arrayNoDuplicates!0 (array!71122 (_ BitVec 32) List!23976) Bool)

(assert (=> b!1098763 (= res!733292 (arrayNoDuplicates!0 lt!491621 #b00000000000000000000000000000000 Nil!23973))))

(declare-fun b!1098764 () Bool)

(declare-fun e!627124 () Bool)

(declare-fun tp_is_empty!27151 () Bool)

(assert (=> b!1098764 (= e!627124 tp_is_empty!27151)))

(declare-fun b!1098765 () Bool)

(declare-fun res!733288 () Bool)

(assert (=> b!1098765 (=> (not res!733288) (not e!627126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098765 (= res!733288 (validKeyInArray!0 k0!904))))

(declare-fun b!1098766 () Bool)

(assert (=> b!1098766 (= e!627126 e!627125)))

(declare-fun res!733286 () Bool)

(assert (=> b!1098766 (=> (not res!733286) (not e!627125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71122 (_ BitVec 32)) Bool)

(assert (=> b!1098766 (= res!733286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491621 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098766 (= lt!491621 (array!71123 (store (arr!34229 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34767 _keys!1070)))))

(declare-fun b!1098767 () Bool)

(declare-fun e!627127 () Bool)

(declare-fun mapRes!42499 () Bool)

(assert (=> b!1098767 (= e!627127 (and e!627124 mapRes!42499))))

(declare-fun condMapEmpty!42499 () Bool)

(declare-fun mapDefault!42499 () ValueCell!12866)

(assert (=> b!1098767 (= condMapEmpty!42499 (= (arr!34230 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12866)) mapDefault!42499)))))

(declare-fun b!1098768 () Bool)

(declare-fun res!733290 () Bool)

(assert (=> b!1098768 (=> (not res!733290) (not e!627126))))

(assert (=> b!1098768 (= res!733290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098769 () Bool)

(declare-fun res!733287 () Bool)

(assert (=> b!1098769 (=> (not res!733287) (not e!627126))))

(assert (=> b!1098769 (= res!733287 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34767 _keys!1070))))))

(declare-fun mapIsEmpty!42499 () Bool)

(assert (=> mapIsEmpty!42499 mapRes!42499))

(declare-fun b!1098771 () Bool)

(declare-fun res!733291 () Bool)

(assert (=> b!1098771 (=> (not res!733291) (not e!627126))))

(assert (=> b!1098771 (= res!733291 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23973))))

(declare-fun b!1098772 () Bool)

(declare-fun e!627129 () Bool)

(assert (=> b!1098772 (= e!627129 tp_is_empty!27151)))

(declare-fun b!1098773 () Bool)

(declare-fun res!733282 () Bool)

(assert (=> b!1098773 (=> (not res!733282) (not e!627126))))

(assert (=> b!1098773 (= res!733282 (= (select (arr!34229 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42499 () Bool)

(declare-fun tp!81242 () Bool)

(assert (=> mapNonEmpty!42499 (= mapRes!42499 (and tp!81242 e!627129))))

(declare-fun mapRest!42499 () (Array (_ BitVec 32) ValueCell!12866))

(declare-fun mapKey!42499 () (_ BitVec 32))

(declare-fun mapValue!42499 () ValueCell!12866)

(assert (=> mapNonEmpty!42499 (= (arr!34230 _values!874) (store mapRest!42499 mapKey!42499 mapValue!42499))))

(declare-fun b!1098774 () Bool)

(assert (=> b!1098774 (= e!627128 (bvslt i!650 (size!34768 _values!874)))))

(assert (=> b!1098774 (= (-!927 lt!491635 k0!904) (+!3404 lt!491634 lt!491619))))

(declare-fun lt!491625 () Unit!35969)

(assert (=> b!1098774 (= lt!491625 (addRemoveCommutativeForDiffKeys!122 lt!491622 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1098770 () Bool)

(assert (=> b!1098770 (= e!627125 (not e!627122))))

(declare-fun res!733284 () Bool)

(assert (=> b!1098770 (=> res!733284 e!627122)))

(assert (=> b!1098770 (= res!733284 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4312 (array!71122 array!71124 (_ BitVec 32) (_ BitVec 32) V!41329 V!41329 (_ BitVec 32) Int) ListLongMap!15353)

(assert (=> b!1098770 (= lt!491620 (getCurrentListMap!4312 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491629 () array!71124)

(assert (=> b!1098770 (= lt!491628 (getCurrentListMap!4312 lt!491621 lt!491629 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098770 (and (= lt!491633 lt!491623) (= lt!491623 lt!491633))))

(assert (=> b!1098770 (= lt!491623 (-!927 lt!491630 k0!904))))

(declare-fun lt!491626 () Unit!35969)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!201 (array!71122 array!71124 (_ BitVec 32) (_ BitVec 32) V!41329 V!41329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35969)

(assert (=> b!1098770 (= lt!491626 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4219 (array!71122 array!71124 (_ BitVec 32) (_ BitVec 32) V!41329 V!41329 (_ BitVec 32) Int) ListLongMap!15353)

(assert (=> b!1098770 (= lt!491633 (getCurrentListMapNoExtraKeys!4219 lt!491621 lt!491629 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2288 (Int (_ BitVec 64)) V!41329)

(assert (=> b!1098770 (= lt!491629 (array!71125 (store (arr!34230 _values!874) i!650 (ValueCellFull!12866 (dynLambda!2288 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34768 _values!874)))))

(assert (=> b!1098770 (= lt!491630 (getCurrentListMapNoExtraKeys!4219 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098770 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491627 () Unit!35969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71122 (_ BitVec 64) (_ BitVec 32)) Unit!35969)

(assert (=> b!1098770 (= lt!491627 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!733289 () Bool)

(assert (=> start!96622 (=> (not res!733289) (not e!627126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96622 (= res!733289 (validMask!0 mask!1414))))

(assert (=> start!96622 e!627126))

(assert (=> start!96622 tp!81241))

(assert (=> start!96622 true))

(assert (=> start!96622 tp_is_empty!27151))

(declare-fun array_inv!26404 (array!71122) Bool)

(assert (=> start!96622 (array_inv!26404 _keys!1070)))

(declare-fun array_inv!26405 (array!71124) Bool)

(assert (=> start!96622 (and (array_inv!26405 _values!874) e!627127)))

(assert (= (and start!96622 res!733289) b!1098761))

(assert (= (and b!1098761 res!733283) b!1098768))

(assert (= (and b!1098768 res!733290) b!1098771))

(assert (= (and b!1098771 res!733291) b!1098769))

(assert (= (and b!1098769 res!733287) b!1098765))

(assert (= (and b!1098765 res!733288) b!1098773))

(assert (= (and b!1098773 res!733282) b!1098766))

(assert (= (and b!1098766 res!733286) b!1098763))

(assert (= (and b!1098763 res!733292) b!1098770))

(assert (= (and b!1098770 (not res!733284)) b!1098762))

(assert (= (and b!1098762 (not res!733285)) b!1098774))

(assert (= (and b!1098767 condMapEmpty!42499) mapIsEmpty!42499))

(assert (= (and b!1098767 (not condMapEmpty!42499)) mapNonEmpty!42499))

(get-info :version)

(assert (= (and mapNonEmpty!42499 ((_ is ValueCellFull!12866) mapValue!42499)) b!1098772))

(assert (= (and b!1098767 ((_ is ValueCellFull!12866) mapDefault!42499)) b!1098764))

(assert (= start!96622 b!1098767))

(declare-fun b_lambda!17857 () Bool)

(assert (=> (not b_lambda!17857) (not b!1098770)))

(declare-fun t!34112 () Bool)

(declare-fun tb!7959 () Bool)

(assert (=> (and start!96622 (= defaultEntry!882 defaultEntry!882) t!34112) tb!7959))

(declare-fun result!16457 () Bool)

(assert (=> tb!7959 (= result!16457 tp_is_empty!27151)))

(assert (=> b!1098770 t!34112))

(declare-fun b_and!36897 () Bool)

(assert (= b_and!36895 (and (=> t!34112 result!16457) b_and!36897)))

(declare-fun m!1018127 () Bool)

(assert (=> b!1098765 m!1018127))

(declare-fun m!1018129 () Bool)

(assert (=> mapNonEmpty!42499 m!1018129))

(declare-fun m!1018131 () Bool)

(assert (=> b!1098770 m!1018131))

(declare-fun m!1018133 () Bool)

(assert (=> b!1098770 m!1018133))

(declare-fun m!1018135 () Bool)

(assert (=> b!1098770 m!1018135))

(declare-fun m!1018137 () Bool)

(assert (=> b!1098770 m!1018137))

(declare-fun m!1018139 () Bool)

(assert (=> b!1098770 m!1018139))

(declare-fun m!1018141 () Bool)

(assert (=> b!1098770 m!1018141))

(declare-fun m!1018143 () Bool)

(assert (=> b!1098770 m!1018143))

(declare-fun m!1018145 () Bool)

(assert (=> b!1098770 m!1018145))

(declare-fun m!1018147 () Bool)

(assert (=> b!1098770 m!1018147))

(declare-fun m!1018149 () Bool)

(assert (=> b!1098770 m!1018149))

(declare-fun m!1018151 () Bool)

(assert (=> b!1098768 m!1018151))

(declare-fun m!1018153 () Bool)

(assert (=> b!1098773 m!1018153))

(declare-fun m!1018155 () Bool)

(assert (=> b!1098762 m!1018155))

(declare-fun m!1018157 () Bool)

(assert (=> b!1098762 m!1018157))

(assert (=> b!1098762 m!1018157))

(declare-fun m!1018159 () Bool)

(assert (=> b!1098762 m!1018159))

(declare-fun m!1018161 () Bool)

(assert (=> b!1098762 m!1018161))

(declare-fun m!1018163 () Bool)

(assert (=> b!1098762 m!1018163))

(declare-fun m!1018165 () Bool)

(assert (=> b!1098762 m!1018165))

(declare-fun m!1018167 () Bool)

(assert (=> b!1098762 m!1018167))

(declare-fun m!1018169 () Bool)

(assert (=> b!1098762 m!1018169))

(declare-fun m!1018171 () Bool)

(assert (=> b!1098774 m!1018171))

(declare-fun m!1018173 () Bool)

(assert (=> b!1098774 m!1018173))

(declare-fun m!1018175 () Bool)

(assert (=> b!1098774 m!1018175))

(declare-fun m!1018177 () Bool)

(assert (=> b!1098763 m!1018177))

(declare-fun m!1018179 () Bool)

(assert (=> b!1098771 m!1018179))

(declare-fun m!1018181 () Bool)

(assert (=> b!1098766 m!1018181))

(declare-fun m!1018183 () Bool)

(assert (=> b!1098766 m!1018183))

(declare-fun m!1018185 () Bool)

(assert (=> start!96622 m!1018185))

(declare-fun m!1018187 () Bool)

(assert (=> start!96622 m!1018187))

(declare-fun m!1018189 () Bool)

(assert (=> start!96622 m!1018189))

(check-sat (not b!1098762) (not b!1098768) (not b!1098766) (not b!1098770) (not b!1098763) (not b!1098765) (not b!1098771) (not b_lambda!17857) b_and!36897 (not mapNonEmpty!42499) (not b_next!23101) (not start!96622) tp_is_empty!27151 (not b!1098774))
(check-sat b_and!36897 (not b_next!23101))
