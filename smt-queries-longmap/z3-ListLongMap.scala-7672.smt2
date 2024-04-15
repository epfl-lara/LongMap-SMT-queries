; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96372 () Bool)

(assert start!96372)

(declare-fun b_free!22957 () Bool)

(declare-fun b_next!22957 () Bool)

(assert (=> start!96372 (= b_free!22957 (not b_next!22957))))

(declare-fun tp!80798 () Bool)

(declare-fun b_and!36557 () Bool)

(assert (=> start!96372 (= tp!80798 b_and!36557)))

(declare-fun b!1095121 () Bool)

(declare-fun res!730873 () Bool)

(declare-fun e!625216 () Bool)

(assert (=> b!1095121 (=> (not res!730873) (not e!625216))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70842 0))(
  ( (array!70843 (arr!34093 (Array (_ BitVec 32) (_ BitVec 64))) (size!34631 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70842)

(declare-datatypes ((V!41137 0))(
  ( (V!41138 (val!13560 Int)) )
))
(declare-datatypes ((ValueCell!12794 0))(
  ( (ValueCellFull!12794 (v!16180 V!41137)) (EmptyCell!12794) )
))
(declare-datatypes ((array!70844 0))(
  ( (array!70845 (arr!34094 (Array (_ BitVec 32) ValueCell!12794)) (size!34632 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70844)

(assert (=> b!1095121 (= res!730873 (and (= (size!34632 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34631 _keys!1070) (size!34632 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095122 () Bool)

(declare-fun e!625212 () Bool)

(declare-fun tp_is_empty!27007 () Bool)

(assert (=> b!1095122 (= e!625212 tp_is_empty!27007)))

(declare-fun res!730874 () Bool)

(assert (=> start!96372 (=> (not res!730874) (not e!625216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96372 (= res!730874 (validMask!0 mask!1414))))

(assert (=> start!96372 e!625216))

(assert (=> start!96372 tp!80798))

(assert (=> start!96372 true))

(assert (=> start!96372 tp_is_empty!27007))

(declare-fun array_inv!26308 (array!70842) Bool)

(assert (=> start!96372 (array_inv!26308 _keys!1070)))

(declare-fun e!625211 () Bool)

(declare-fun array_inv!26309 (array!70844) Bool)

(assert (=> start!96372 (and (array_inv!26309 _values!874) e!625211)))

(declare-fun b!1095123 () Bool)

(declare-fun res!730876 () Bool)

(assert (=> b!1095123 (=> (not res!730876) (not e!625216))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095123 (= res!730876 (= (select (arr!34093 _keys!1070) i!650) k0!904))))

(declare-fun b!1095124 () Bool)

(declare-fun mapRes!42271 () Bool)

(assert (=> b!1095124 (= e!625211 (and e!625212 mapRes!42271))))

(declare-fun condMapEmpty!42271 () Bool)

(declare-fun mapDefault!42271 () ValueCell!12794)

(assert (=> b!1095124 (= condMapEmpty!42271 (= (arr!34094 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12794)) mapDefault!42271)))))

(declare-fun b!1095125 () Bool)

(declare-fun res!730870 () Bool)

(assert (=> b!1095125 (=> (not res!730870) (not e!625216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095125 (= res!730870 (validKeyInArray!0 k0!904))))

(declare-fun b!1095126 () Bool)

(declare-fun e!625214 () Bool)

(assert (=> b!1095126 (= e!625214 tp_is_empty!27007)))

(declare-fun mapIsEmpty!42271 () Bool)

(assert (=> mapIsEmpty!42271 mapRes!42271))

(declare-fun b!1095127 () Bool)

(declare-fun res!730869 () Bool)

(declare-fun e!625213 () Bool)

(assert (=> b!1095127 (=> (not res!730869) (not e!625213))))

(declare-fun lt!489585 () array!70842)

(declare-datatypes ((List!23871 0))(
  ( (Nil!23868) (Cons!23867 (h!25076 (_ BitVec 64)) (t!33869 List!23871)) )
))
(declare-fun arrayNoDuplicates!0 (array!70842 (_ BitVec 32) List!23871) Bool)

(assert (=> b!1095127 (= res!730869 (arrayNoDuplicates!0 lt!489585 #b00000000000000000000000000000000 Nil!23868))))

(declare-fun b!1095128 () Bool)

(assert (=> b!1095128 (= e!625213 (not (bvslt i!650 (size!34632 _values!874))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41137)

(declare-datatypes ((tuple2!17280 0))(
  ( (tuple2!17281 (_1!8651 (_ BitVec 64)) (_2!8651 V!41137)) )
))
(declare-datatypes ((List!23872 0))(
  ( (Nil!23869) (Cons!23868 (h!25077 tuple2!17280) (t!33870 List!23872)) )
))
(declare-datatypes ((ListLongMap!15249 0))(
  ( (ListLongMap!15250 (toList!7640 List!23872)) )
))
(declare-fun lt!489587 () ListLongMap!15249)

(declare-fun zeroValue!831 () V!41137)

(declare-fun getCurrentListMapNoExtraKeys!4173 (array!70842 array!70844 (_ BitVec 32) (_ BitVec 32) V!41137 V!41137 (_ BitVec 32) Int) ListLongMap!15249)

(assert (=> b!1095128 (= lt!489587 (getCurrentListMapNoExtraKeys!4173 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095128 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35867 0))(
  ( (Unit!35868) )
))
(declare-fun lt!489586 () Unit!35867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70842 (_ BitVec 64) (_ BitVec 32)) Unit!35867)

(assert (=> b!1095128 (= lt!489586 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095129 () Bool)

(assert (=> b!1095129 (= e!625216 e!625213)))

(declare-fun res!730872 () Bool)

(assert (=> b!1095129 (=> (not res!730872) (not e!625213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70842 (_ BitVec 32)) Bool)

(assert (=> b!1095129 (= res!730872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489585 mask!1414))))

(assert (=> b!1095129 (= lt!489585 (array!70843 (store (arr!34093 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34631 _keys!1070)))))

(declare-fun b!1095130 () Bool)

(declare-fun res!730875 () Bool)

(assert (=> b!1095130 (=> (not res!730875) (not e!625216))))

(assert (=> b!1095130 (= res!730875 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34631 _keys!1070))))))

(declare-fun b!1095131 () Bool)

(declare-fun res!730871 () Bool)

(assert (=> b!1095131 (=> (not res!730871) (not e!625216))))

(assert (=> b!1095131 (= res!730871 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23868))))

(declare-fun b!1095132 () Bool)

(declare-fun res!730868 () Bool)

(assert (=> b!1095132 (=> (not res!730868) (not e!625216))))

(assert (=> b!1095132 (= res!730868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42271 () Bool)

(declare-fun tp!80797 () Bool)

(assert (=> mapNonEmpty!42271 (= mapRes!42271 (and tp!80797 e!625214))))

(declare-fun mapValue!42271 () ValueCell!12794)

(declare-fun mapKey!42271 () (_ BitVec 32))

(declare-fun mapRest!42271 () (Array (_ BitVec 32) ValueCell!12794))

(assert (=> mapNonEmpty!42271 (= (arr!34094 _values!874) (store mapRest!42271 mapKey!42271 mapValue!42271))))

(assert (= (and start!96372 res!730874) b!1095121))

(assert (= (and b!1095121 res!730873) b!1095132))

(assert (= (and b!1095132 res!730868) b!1095131))

(assert (= (and b!1095131 res!730871) b!1095130))

(assert (= (and b!1095130 res!730875) b!1095125))

(assert (= (and b!1095125 res!730870) b!1095123))

(assert (= (and b!1095123 res!730876) b!1095129))

(assert (= (and b!1095129 res!730872) b!1095127))

(assert (= (and b!1095127 res!730869) b!1095128))

(assert (= (and b!1095124 condMapEmpty!42271) mapIsEmpty!42271))

(assert (= (and b!1095124 (not condMapEmpty!42271)) mapNonEmpty!42271))

(get-info :version)

(assert (= (and mapNonEmpty!42271 ((_ is ValueCellFull!12794) mapValue!42271)) b!1095126))

(assert (= (and b!1095124 ((_ is ValueCellFull!12794) mapDefault!42271)) b!1095122))

(assert (= start!96372 b!1095124))

(declare-fun m!1014315 () Bool)

(assert (=> b!1095131 m!1014315))

(declare-fun m!1014317 () Bool)

(assert (=> mapNonEmpty!42271 m!1014317))

(declare-fun m!1014319 () Bool)

(assert (=> b!1095129 m!1014319))

(declare-fun m!1014321 () Bool)

(assert (=> b!1095129 m!1014321))

(declare-fun m!1014323 () Bool)

(assert (=> b!1095127 m!1014323))

(declare-fun m!1014325 () Bool)

(assert (=> start!96372 m!1014325))

(declare-fun m!1014327 () Bool)

(assert (=> start!96372 m!1014327))

(declare-fun m!1014329 () Bool)

(assert (=> start!96372 m!1014329))

(declare-fun m!1014331 () Bool)

(assert (=> b!1095132 m!1014331))

(declare-fun m!1014333 () Bool)

(assert (=> b!1095123 m!1014333))

(declare-fun m!1014335 () Bool)

(assert (=> b!1095128 m!1014335))

(declare-fun m!1014337 () Bool)

(assert (=> b!1095128 m!1014337))

(declare-fun m!1014339 () Bool)

(assert (=> b!1095128 m!1014339))

(declare-fun m!1014341 () Bool)

(assert (=> b!1095125 m!1014341))

(check-sat (not b!1095127) (not start!96372) (not b!1095129) (not b!1095131) b_and!36557 (not mapNonEmpty!42271) (not b!1095125) (not b_next!22957) (not b!1095128) tp_is_empty!27007 (not b!1095132))
(check-sat b_and!36557 (not b_next!22957))
