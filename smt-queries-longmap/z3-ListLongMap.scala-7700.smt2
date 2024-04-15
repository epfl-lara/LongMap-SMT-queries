; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96698 () Bool)

(assert start!96698)

(declare-fun b_free!23125 () Bool)

(declare-fun b_next!23125 () Bool)

(assert (=> start!96698 (= b_free!23125 (not b_next!23125))))

(declare-fun tp!81319 () Bool)

(declare-fun b_and!36971 () Bool)

(assert (=> start!96698 (= tp!81319 b_and!36971)))

(declare-fun b!1099667 () Bool)

(declare-fun e!627653 () Bool)

(declare-fun e!627655 () Bool)

(assert (=> b!1099667 (= e!627653 (not e!627655))))

(declare-fun res!733843 () Bool)

(assert (=> b!1099667 (=> res!733843 e!627655)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099667 (= res!733843 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41361 0))(
  ( (V!41362 (val!13644 Int)) )
))
(declare-fun minValue!831 () V!41361)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17402 0))(
  ( (tuple2!17403 (_1!8712 (_ BitVec 64)) (_2!8712 V!41361)) )
))
(declare-datatypes ((List!23995 0))(
  ( (Nil!23992) (Cons!23991 (h!25200 tuple2!17402) (t!34157 List!23995)) )
))
(declare-datatypes ((ListLongMap!15371 0))(
  ( (ListLongMap!15372 (toList!7701 List!23995)) )
))
(declare-fun lt!492384 () ListLongMap!15371)

(declare-fun zeroValue!831 () V!41361)

(declare-datatypes ((array!71174 0))(
  ( (array!71175 (arr!34253 (Array (_ BitVec 32) (_ BitVec 64))) (size!34791 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71174)

(declare-datatypes ((ValueCell!12878 0))(
  ( (ValueCellFull!12878 (v!16270 V!41361)) (EmptyCell!12878) )
))
(declare-datatypes ((array!71176 0))(
  ( (array!71177 (arr!34254 (Array (_ BitVec 32) ValueCell!12878)) (size!34792 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71176)

(declare-fun getCurrentListMap!4320 (array!71174 array!71176 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) Int) ListLongMap!15371)

(assert (=> b!1099667 (= lt!492384 (getCurrentListMap!4320 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492389 () array!71174)

(declare-fun lt!492388 () array!71176)

(declare-fun lt!492393 () ListLongMap!15371)

(assert (=> b!1099667 (= lt!492393 (getCurrentListMap!4320 lt!492389 lt!492388 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492385 () ListLongMap!15371)

(declare-fun lt!492390 () ListLongMap!15371)

(assert (=> b!1099667 (and (= lt!492385 lt!492390) (= lt!492390 lt!492385))))

(declare-fun lt!492387 () ListLongMap!15371)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!935 (ListLongMap!15371 (_ BitVec 64)) ListLongMap!15371)

(assert (=> b!1099667 (= lt!492390 (-!935 lt!492387 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35989 0))(
  ( (Unit!35990) )
))
(declare-fun lt!492391 () Unit!35989)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 (array!71174 array!71176 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35989)

(assert (=> b!1099667 (= lt!492391 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4227 (array!71174 array!71176 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) Int) ListLongMap!15371)

(assert (=> b!1099667 (= lt!492385 (getCurrentListMapNoExtraKeys!4227 lt!492389 lt!492388 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2296 (Int (_ BitVec 64)) V!41361)

(assert (=> b!1099667 (= lt!492388 (array!71177 (store (arr!34254 _values!874) i!650 (ValueCellFull!12878 (dynLambda!2296 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34792 _values!874)))))

(assert (=> b!1099667 (= lt!492387 (getCurrentListMapNoExtraKeys!4227 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099667 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492386 () Unit!35989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71174 (_ BitVec 64) (_ BitVec 32)) Unit!35989)

(assert (=> b!1099667 (= lt!492386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42541 () Bool)

(declare-fun mapRes!42541 () Bool)

(assert (=> mapIsEmpty!42541 mapRes!42541))

(declare-fun b!1099668 () Bool)

(declare-fun res!733837 () Bool)

(declare-fun e!627651 () Bool)

(assert (=> b!1099668 (=> (not res!733837) (not e!627651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71174 (_ BitVec 32)) Bool)

(assert (=> b!1099668 (= res!733837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099669 () Bool)

(declare-fun e!627658 () Bool)

(declare-fun tp_is_empty!27175 () Bool)

(assert (=> b!1099669 (= e!627658 tp_is_empty!27175)))

(declare-fun e!627654 () Bool)

(declare-fun b!1099670 () Bool)

(declare-fun lt!492392 () tuple2!17402)

(declare-fun +!3412 (ListLongMap!15371 tuple2!17402) ListLongMap!15371)

(assert (=> b!1099670 (= e!627654 (= lt!492384 (+!3412 lt!492387 lt!492392)))))

(declare-fun b!1099671 () Bool)

(declare-fun e!627656 () Bool)

(assert (=> b!1099671 (= e!627656 tp_is_empty!27175)))

(declare-fun b!1099672 () Bool)

(assert (=> b!1099672 (= e!627655 (= lt!492393 (+!3412 lt!492390 lt!492392)))))

(assert (=> b!1099672 e!627654))

(declare-fun res!733840 () Bool)

(assert (=> b!1099672 (=> (not res!733840) (not e!627654))))

(assert (=> b!1099672 (= res!733840 (= lt!492393 (+!3412 lt!492385 lt!492392)))))

(assert (=> b!1099672 (= lt!492392 (tuple2!17403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099674 () Bool)

(declare-fun res!733846 () Bool)

(assert (=> b!1099674 (=> (not res!733846) (not e!627653))))

(declare-datatypes ((List!23996 0))(
  ( (Nil!23993) (Cons!23992 (h!25201 (_ BitVec 64)) (t!34158 List!23996)) )
))
(declare-fun arrayNoDuplicates!0 (array!71174 (_ BitVec 32) List!23996) Bool)

(assert (=> b!1099674 (= res!733846 (arrayNoDuplicates!0 lt!492389 #b00000000000000000000000000000000 Nil!23993))))

(declare-fun b!1099675 () Bool)

(declare-fun res!733839 () Bool)

(assert (=> b!1099675 (=> (not res!733839) (not e!627651))))

(assert (=> b!1099675 (= res!733839 (and (= (size!34792 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34791 _keys!1070) (size!34792 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42541 () Bool)

(declare-fun tp!81320 () Bool)

(assert (=> mapNonEmpty!42541 (= mapRes!42541 (and tp!81320 e!627656))))

(declare-fun mapRest!42541 () (Array (_ BitVec 32) ValueCell!12878))

(declare-fun mapKey!42541 () (_ BitVec 32))

(declare-fun mapValue!42541 () ValueCell!12878)

(assert (=> mapNonEmpty!42541 (= (arr!34254 _values!874) (store mapRest!42541 mapKey!42541 mapValue!42541))))

(declare-fun b!1099676 () Bool)

(declare-fun res!733844 () Bool)

(assert (=> b!1099676 (=> (not res!733844) (not e!627651))))

(assert (=> b!1099676 (= res!733844 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23993))))

(declare-fun b!1099677 () Bool)

(declare-fun res!733838 () Bool)

(assert (=> b!1099677 (=> (not res!733838) (not e!627651))))

(assert (=> b!1099677 (= res!733838 (= (select (arr!34253 _keys!1070) i!650) k0!904))))

(declare-fun b!1099678 () Bool)

(declare-fun res!733841 () Bool)

(assert (=> b!1099678 (=> (not res!733841) (not e!627651))))

(assert (=> b!1099678 (= res!733841 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34791 _keys!1070))))))

(declare-fun b!1099679 () Bool)

(declare-fun res!733845 () Bool)

(assert (=> b!1099679 (=> (not res!733845) (not e!627651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099679 (= res!733845 (validKeyInArray!0 k0!904))))

(declare-fun b!1099680 () Bool)

(assert (=> b!1099680 (= e!627651 e!627653)))

(declare-fun res!733842 () Bool)

(assert (=> b!1099680 (=> (not res!733842) (not e!627653))))

(assert (=> b!1099680 (= res!733842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492389 mask!1414))))

(assert (=> b!1099680 (= lt!492389 (array!71175 (store (arr!34253 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34791 _keys!1070)))))

(declare-fun res!733836 () Bool)

(assert (=> start!96698 (=> (not res!733836) (not e!627651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96698 (= res!733836 (validMask!0 mask!1414))))

(assert (=> start!96698 e!627651))

(assert (=> start!96698 tp!81319))

(assert (=> start!96698 true))

(assert (=> start!96698 tp_is_empty!27175))

(declare-fun array_inv!26416 (array!71174) Bool)

(assert (=> start!96698 (array_inv!26416 _keys!1070)))

(declare-fun e!627652 () Bool)

(declare-fun array_inv!26417 (array!71176) Bool)

(assert (=> start!96698 (and (array_inv!26417 _values!874) e!627652)))

(declare-fun b!1099673 () Bool)

(assert (=> b!1099673 (= e!627652 (and e!627658 mapRes!42541))))

(declare-fun condMapEmpty!42541 () Bool)

(declare-fun mapDefault!42541 () ValueCell!12878)

(assert (=> b!1099673 (= condMapEmpty!42541 (= (arr!34254 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12878)) mapDefault!42541)))))

(assert (= (and start!96698 res!733836) b!1099675))

(assert (= (and b!1099675 res!733839) b!1099668))

(assert (= (and b!1099668 res!733837) b!1099676))

(assert (= (and b!1099676 res!733844) b!1099678))

(assert (= (and b!1099678 res!733841) b!1099679))

(assert (= (and b!1099679 res!733845) b!1099677))

(assert (= (and b!1099677 res!733838) b!1099680))

(assert (= (and b!1099680 res!733842) b!1099674))

(assert (= (and b!1099674 res!733846) b!1099667))

(assert (= (and b!1099667 (not res!733843)) b!1099672))

(assert (= (and b!1099672 res!733840) b!1099670))

(assert (= (and b!1099673 condMapEmpty!42541) mapIsEmpty!42541))

(assert (= (and b!1099673 (not condMapEmpty!42541)) mapNonEmpty!42541))

(get-info :version)

(assert (= (and mapNonEmpty!42541 ((_ is ValueCellFull!12878) mapValue!42541)) b!1099671))

(assert (= (and b!1099673 ((_ is ValueCellFull!12878) mapDefault!42541)) b!1099669))

(assert (= start!96698 b!1099673))

(declare-fun b_lambda!17941 () Bool)

(assert (=> (not b_lambda!17941) (not b!1099667)))

(declare-fun t!34156 () Bool)

(declare-fun tb!7983 () Bool)

(assert (=> (and start!96698 (= defaultEntry!882 defaultEntry!882) t!34156) tb!7983))

(declare-fun result!16509 () Bool)

(assert (=> tb!7983 (= result!16509 tp_is_empty!27175)))

(assert (=> b!1099667 t!34156))

(declare-fun b_and!36973 () Bool)

(assert (= b_and!36971 (and (=> t!34156 result!16509) b_and!36973)))

(declare-fun m!1019199 () Bool)

(assert (=> b!1099668 m!1019199))

(declare-fun m!1019201 () Bool)

(assert (=> b!1099672 m!1019201))

(declare-fun m!1019203 () Bool)

(assert (=> b!1099672 m!1019203))

(declare-fun m!1019205 () Bool)

(assert (=> start!96698 m!1019205))

(declare-fun m!1019207 () Bool)

(assert (=> start!96698 m!1019207))

(declare-fun m!1019209 () Bool)

(assert (=> start!96698 m!1019209))

(declare-fun m!1019211 () Bool)

(assert (=> b!1099680 m!1019211))

(declare-fun m!1019213 () Bool)

(assert (=> b!1099680 m!1019213))

(declare-fun m!1019215 () Bool)

(assert (=> b!1099676 m!1019215))

(declare-fun m!1019217 () Bool)

(assert (=> b!1099677 m!1019217))

(declare-fun m!1019219 () Bool)

(assert (=> b!1099674 m!1019219))

(declare-fun m!1019221 () Bool)

(assert (=> b!1099679 m!1019221))

(declare-fun m!1019223 () Bool)

(assert (=> b!1099670 m!1019223))

(declare-fun m!1019225 () Bool)

(assert (=> mapNonEmpty!42541 m!1019225))

(declare-fun m!1019227 () Bool)

(assert (=> b!1099667 m!1019227))

(declare-fun m!1019229 () Bool)

(assert (=> b!1099667 m!1019229))

(declare-fun m!1019231 () Bool)

(assert (=> b!1099667 m!1019231))

(declare-fun m!1019233 () Bool)

(assert (=> b!1099667 m!1019233))

(declare-fun m!1019235 () Bool)

(assert (=> b!1099667 m!1019235))

(declare-fun m!1019237 () Bool)

(assert (=> b!1099667 m!1019237))

(declare-fun m!1019239 () Bool)

(assert (=> b!1099667 m!1019239))

(declare-fun m!1019241 () Bool)

(assert (=> b!1099667 m!1019241))

(declare-fun m!1019243 () Bool)

(assert (=> b!1099667 m!1019243))

(declare-fun m!1019245 () Bool)

(assert (=> b!1099667 m!1019245))

(check-sat (not b!1099674) (not b_next!23125) (not b!1099676) (not b!1099668) b_and!36973 (not b_lambda!17941) (not mapNonEmpty!42541) (not start!96698) (not b!1099670) (not b!1099680) (not b!1099667) (not b!1099672) tp_is_empty!27175 (not b!1099679))
(check-sat b_and!36973 (not b_next!23125))
