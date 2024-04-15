; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96396 () Bool)

(assert start!96396)

(declare-fun b_free!22981 () Bool)

(declare-fun b_next!22981 () Bool)

(assert (=> start!96396 (= b_free!22981 (not b_next!22981))))

(declare-fun tp!80869 () Bool)

(declare-fun b_and!36599 () Bool)

(assert (=> start!96396 (= tp!80869 b_and!36599)))

(declare-fun b!1095571 () Bool)

(declare-fun e!625429 () Bool)

(assert (=> b!1095571 (= e!625429 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41169 0))(
  ( (V!41170 (val!13572 Int)) )
))
(declare-datatypes ((ValueCell!12806 0))(
  ( (ValueCellFull!12806 (v!16192 V!41169)) (EmptyCell!12806) )
))
(declare-datatypes ((array!70888 0))(
  ( (array!70889 (arr!34116 (Array (_ BitVec 32) ValueCell!12806)) (size!34654 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70888)

(declare-fun minValue!831 () V!41169)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70890 0))(
  ( (array!70891 (arr!34117 (Array (_ BitVec 32) (_ BitVec 64))) (size!34655 (_ BitVec 32))) )
))
(declare-fun lt!489724 () array!70890)

(declare-fun zeroValue!831 () V!41169)

(declare-datatypes ((tuple2!17292 0))(
  ( (tuple2!17293 (_1!8657 (_ BitVec 64)) (_2!8657 V!41169)) )
))
(declare-datatypes ((List!23886 0))(
  ( (Nil!23883) (Cons!23882 (h!25091 tuple2!17292) (t!33904 List!23886)) )
))
(declare-datatypes ((ListLongMap!15261 0))(
  ( (ListLongMap!15262 (toList!7646 List!23886)) )
))
(declare-fun lt!489723 () ListLongMap!15261)

(declare-fun getCurrentListMapNoExtraKeys!4179 (array!70890 array!70888 (_ BitVec 32) (_ BitVec 32) V!41169 V!41169 (_ BitVec 32) Int) ListLongMap!15261)

(declare-fun dynLambda!2248 (Int (_ BitVec 64)) V!41169)

(assert (=> b!1095571 (= lt!489723 (getCurrentListMapNoExtraKeys!4179 lt!489724 (array!70889 (store (arr!34116 _values!874) i!650 (ValueCellFull!12806 (dynLambda!2248 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34654 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489722 () ListLongMap!15261)

(declare-fun _keys!1070 () array!70890)

(assert (=> b!1095571 (= lt!489722 (getCurrentListMapNoExtraKeys!4179 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095571 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35879 0))(
  ( (Unit!35880) )
))
(declare-fun lt!489725 () Unit!35879)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70890 (_ BitVec 64) (_ BitVec 32)) Unit!35879)

(assert (=> b!1095571 (= lt!489725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095572 () Bool)

(declare-fun e!625431 () Bool)

(declare-fun tp_is_empty!27031 () Bool)

(assert (=> b!1095572 (= e!625431 tp_is_empty!27031)))

(declare-fun b!1095573 () Bool)

(declare-fun res!731200 () Bool)

(assert (=> b!1095573 (=> (not res!731200) (not e!625429))))

(declare-datatypes ((List!23887 0))(
  ( (Nil!23884) (Cons!23883 (h!25092 (_ BitVec 64)) (t!33905 List!23887)) )
))
(declare-fun arrayNoDuplicates!0 (array!70890 (_ BitVec 32) List!23887) Bool)

(assert (=> b!1095573 (= res!731200 (arrayNoDuplicates!0 lt!489724 #b00000000000000000000000000000000 Nil!23884))))

(declare-fun b!1095574 () Bool)

(declare-fun res!731197 () Bool)

(declare-fun e!625432 () Bool)

(assert (=> b!1095574 (=> (not res!731197) (not e!625432))))

(assert (=> b!1095574 (= res!731197 (and (= (size!34654 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34655 _keys!1070) (size!34654 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095575 () Bool)

(declare-fun res!731199 () Bool)

(assert (=> b!1095575 (=> (not res!731199) (not e!625432))))

(assert (=> b!1095575 (= res!731199 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23884))))

(declare-fun mapIsEmpty!42307 () Bool)

(declare-fun mapRes!42307 () Bool)

(assert (=> mapIsEmpty!42307 mapRes!42307))

(declare-fun b!1095577 () Bool)

(declare-fun res!731195 () Bool)

(assert (=> b!1095577 (=> (not res!731195) (not e!625432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095577 (= res!731195 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42307 () Bool)

(declare-fun tp!80870 () Bool)

(assert (=> mapNonEmpty!42307 (= mapRes!42307 (and tp!80870 e!625431))))

(declare-fun mapKey!42307 () (_ BitVec 32))

(declare-fun mapRest!42307 () (Array (_ BitVec 32) ValueCell!12806))

(declare-fun mapValue!42307 () ValueCell!12806)

(assert (=> mapNonEmpty!42307 (= (arr!34116 _values!874) (store mapRest!42307 mapKey!42307 mapValue!42307))))

(declare-fun b!1095578 () Bool)

(declare-fun e!625430 () Bool)

(assert (=> b!1095578 (= e!625430 tp_is_empty!27031)))

(declare-fun b!1095579 () Bool)

(declare-fun e!625428 () Bool)

(assert (=> b!1095579 (= e!625428 (and e!625430 mapRes!42307))))

(declare-fun condMapEmpty!42307 () Bool)

(declare-fun mapDefault!42307 () ValueCell!12806)

(assert (=> b!1095579 (= condMapEmpty!42307 (= (arr!34116 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12806)) mapDefault!42307)))))

(declare-fun b!1095580 () Bool)

(declare-fun res!731196 () Bool)

(assert (=> b!1095580 (=> (not res!731196) (not e!625432))))

(assert (=> b!1095580 (= res!731196 (= (select (arr!34117 _keys!1070) i!650) k0!904))))

(declare-fun b!1095581 () Bool)

(assert (=> b!1095581 (= e!625432 e!625429)))

(declare-fun res!731193 () Bool)

(assert (=> b!1095581 (=> (not res!731193) (not e!625429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70890 (_ BitVec 32)) Bool)

(assert (=> b!1095581 (= res!731193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489724 mask!1414))))

(assert (=> b!1095581 (= lt!489724 (array!70891 (store (arr!34117 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34655 _keys!1070)))))

(declare-fun b!1095582 () Bool)

(declare-fun res!731198 () Bool)

(assert (=> b!1095582 (=> (not res!731198) (not e!625432))))

(assert (=> b!1095582 (= res!731198 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34655 _keys!1070))))))

(declare-fun res!731194 () Bool)

(assert (=> start!96396 (=> (not res!731194) (not e!625432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96396 (= res!731194 (validMask!0 mask!1414))))

(assert (=> start!96396 e!625432))

(assert (=> start!96396 tp!80869))

(assert (=> start!96396 true))

(assert (=> start!96396 tp_is_empty!27031))

(declare-fun array_inv!26326 (array!70890) Bool)

(assert (=> start!96396 (array_inv!26326 _keys!1070)))

(declare-fun array_inv!26327 (array!70888) Bool)

(assert (=> start!96396 (and (array_inv!26327 _values!874) e!625428)))

(declare-fun b!1095576 () Bool)

(declare-fun res!731192 () Bool)

(assert (=> b!1095576 (=> (not res!731192) (not e!625432))))

(assert (=> b!1095576 (= res!731192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96396 res!731194) b!1095574))

(assert (= (and b!1095574 res!731197) b!1095576))

(assert (= (and b!1095576 res!731192) b!1095575))

(assert (= (and b!1095575 res!731199) b!1095582))

(assert (= (and b!1095582 res!731198) b!1095577))

(assert (= (and b!1095577 res!731195) b!1095580))

(assert (= (and b!1095580 res!731196) b!1095581))

(assert (= (and b!1095581 res!731193) b!1095573))

(assert (= (and b!1095573 res!731200) b!1095571))

(assert (= (and b!1095579 condMapEmpty!42307) mapIsEmpty!42307))

(assert (= (and b!1095579 (not condMapEmpty!42307)) mapNonEmpty!42307))

(get-info :version)

(assert (= (and mapNonEmpty!42307 ((_ is ValueCellFull!12806) mapValue!42307)) b!1095572))

(assert (= (and b!1095579 ((_ is ValueCellFull!12806) mapDefault!42307)) b!1095578))

(assert (= start!96396 b!1095579))

(declare-fun b_lambda!17617 () Bool)

(assert (=> (not b_lambda!17617) (not b!1095571)))

(declare-fun t!33903 () Bool)

(declare-fun tb!7839 () Bool)

(assert (=> (and start!96396 (= defaultEntry!882 defaultEntry!882) t!33903) tb!7839))

(declare-fun result!16209 () Bool)

(assert (=> tb!7839 (= result!16209 tp_is_empty!27031)))

(assert (=> b!1095571 t!33903))

(declare-fun b_and!36601 () Bool)

(assert (= b_and!36599 (and (=> t!33903 result!16209) b_and!36601)))

(declare-fun m!1014705 () Bool)

(assert (=> start!96396 m!1014705))

(declare-fun m!1014707 () Bool)

(assert (=> start!96396 m!1014707))

(declare-fun m!1014709 () Bool)

(assert (=> start!96396 m!1014709))

(declare-fun m!1014711 () Bool)

(assert (=> b!1095573 m!1014711))

(declare-fun m!1014713 () Bool)

(assert (=> b!1095577 m!1014713))

(declare-fun m!1014715 () Bool)

(assert (=> mapNonEmpty!42307 m!1014715))

(declare-fun m!1014717 () Bool)

(assert (=> b!1095576 m!1014717))

(declare-fun m!1014719 () Bool)

(assert (=> b!1095575 m!1014719))

(declare-fun m!1014721 () Bool)

(assert (=> b!1095580 m!1014721))

(declare-fun m!1014723 () Bool)

(assert (=> b!1095571 m!1014723))

(declare-fun m!1014725 () Bool)

(assert (=> b!1095571 m!1014725))

(declare-fun m!1014727 () Bool)

(assert (=> b!1095571 m!1014727))

(declare-fun m!1014729 () Bool)

(assert (=> b!1095571 m!1014729))

(declare-fun m!1014731 () Bool)

(assert (=> b!1095571 m!1014731))

(declare-fun m!1014733 () Bool)

(assert (=> b!1095571 m!1014733))

(declare-fun m!1014735 () Bool)

(assert (=> b!1095581 m!1014735))

(declare-fun m!1014737 () Bool)

(assert (=> b!1095581 m!1014737))

(check-sat b_and!36601 (not b!1095573) (not mapNonEmpty!42307) (not b!1095575) (not b!1095581) (not b!1095571) (not b!1095576) (not start!96396) tp_is_empty!27031 (not b!1095577) (not b_next!22981) (not b_lambda!17617))
(check-sat b_and!36601 (not b_next!22981))
