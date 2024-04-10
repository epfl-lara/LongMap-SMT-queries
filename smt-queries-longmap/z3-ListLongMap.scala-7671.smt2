; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96374 () Bool)

(assert start!96374)

(declare-fun b_free!22953 () Bool)

(declare-fun b_next!22953 () Bool)

(assert (=> start!96374 (= b_free!22953 (not b_next!22953))))

(declare-fun tp!80785 () Bool)

(declare-fun b_and!36579 () Bool)

(assert (=> start!96374 (= tp!80785 b_and!36579)))

(declare-fun b!1095202 () Bool)

(declare-fun e!625273 () Bool)

(assert (=> b!1095202 (= e!625273 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41131 0))(
  ( (V!41132 (val!13558 Int)) )
))
(declare-fun zeroValue!831 () V!41131)

(declare-datatypes ((array!70921 0))(
  ( (array!70922 (arr!34132 (Array (_ BitVec 32) (_ BitVec 64))) (size!34668 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70921)

(declare-datatypes ((ValueCell!12792 0))(
  ( (ValueCellFull!12792 (v!16179 V!41131)) (EmptyCell!12792) )
))
(declare-datatypes ((array!70923 0))(
  ( (array!70924 (arr!34133 (Array (_ BitVec 32) ValueCell!12792)) (size!34669 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70923)

(declare-fun minValue!831 () V!41131)

(declare-datatypes ((tuple2!17218 0))(
  ( (tuple2!17219 (_1!8620 (_ BitVec 64)) (_2!8620 V!41131)) )
))
(declare-datatypes ((List!23835 0))(
  ( (Nil!23832) (Cons!23831 (h!25040 tuple2!17218) (t!33842 List!23835)) )
))
(declare-datatypes ((ListLongMap!15187 0))(
  ( (ListLongMap!15188 (toList!7609 List!23835)) )
))
(declare-fun lt!489768 () ListLongMap!15187)

(declare-fun getCurrentListMapNoExtraKeys!4125 (array!70921 array!70923 (_ BitVec 32) (_ BitVec 32) V!41131 V!41131 (_ BitVec 32) Int) ListLongMap!15187)

(assert (=> b!1095202 (= lt!489768 (getCurrentListMapNoExtraKeys!4125 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095202 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36030 0))(
  ( (Unit!36031) )
))
(declare-fun lt!489767 () Unit!36030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70921 (_ BitVec 64) (_ BitVec 32)) Unit!36030)

(assert (=> b!1095202 (= lt!489767 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095203 () Bool)

(declare-fun e!625269 () Bool)

(declare-fun e!625271 () Bool)

(declare-fun mapRes!42265 () Bool)

(assert (=> b!1095203 (= e!625269 (and e!625271 mapRes!42265))))

(declare-fun condMapEmpty!42265 () Bool)

(declare-fun mapDefault!42265 () ValueCell!12792)

(assert (=> b!1095203 (= condMapEmpty!42265 (= (arr!34133 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12792)) mapDefault!42265)))))

(declare-fun b!1095204 () Bool)

(declare-fun res!730890 () Bool)

(declare-fun e!625272 () Bool)

(assert (=> b!1095204 (=> (not res!730890) (not e!625272))))

(assert (=> b!1095204 (= res!730890 (= (select (arr!34132 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42265 () Bool)

(assert (=> mapIsEmpty!42265 mapRes!42265))

(declare-fun b!1095205 () Bool)

(declare-fun res!730888 () Bool)

(assert (=> b!1095205 (=> (not res!730888) (not e!625272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70921 (_ BitVec 32)) Bool)

(assert (=> b!1095205 (= res!730888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095206 () Bool)

(declare-fun res!730885 () Bool)

(assert (=> b!1095206 (=> (not res!730885) (not e!625272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095206 (= res!730885 (validKeyInArray!0 k0!904))))

(declare-fun res!730883 () Bool)

(assert (=> start!96374 (=> (not res!730883) (not e!625272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96374 (= res!730883 (validMask!0 mask!1414))))

(assert (=> start!96374 e!625272))

(assert (=> start!96374 tp!80785))

(assert (=> start!96374 true))

(declare-fun tp_is_empty!27003 () Bool)

(assert (=> start!96374 tp_is_empty!27003))

(declare-fun array_inv!26304 (array!70921) Bool)

(assert (=> start!96374 (array_inv!26304 _keys!1070)))

(declare-fun array_inv!26305 (array!70923) Bool)

(assert (=> start!96374 (and (array_inv!26305 _values!874) e!625269)))

(declare-fun b!1095207 () Bool)

(declare-fun e!625268 () Bool)

(assert (=> b!1095207 (= e!625268 tp_is_empty!27003)))

(declare-fun b!1095208 () Bool)

(declare-fun res!730886 () Bool)

(assert (=> b!1095208 (=> (not res!730886) (not e!625272))))

(assert (=> b!1095208 (= res!730886 (and (= (size!34669 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34668 _keys!1070) (size!34669 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42265 () Bool)

(declare-fun tp!80786 () Bool)

(assert (=> mapNonEmpty!42265 (= mapRes!42265 (and tp!80786 e!625268))))

(declare-fun mapKey!42265 () (_ BitVec 32))

(declare-fun mapRest!42265 () (Array (_ BitVec 32) ValueCell!12792))

(declare-fun mapValue!42265 () ValueCell!12792)

(assert (=> mapNonEmpty!42265 (= (arr!34133 _values!874) (store mapRest!42265 mapKey!42265 mapValue!42265))))

(declare-fun b!1095209 () Bool)

(assert (=> b!1095209 (= e!625271 tp_is_empty!27003)))

(declare-fun b!1095210 () Bool)

(declare-fun res!730891 () Bool)

(assert (=> b!1095210 (=> (not res!730891) (not e!625272))))

(declare-datatypes ((List!23836 0))(
  ( (Nil!23833) (Cons!23832 (h!25041 (_ BitVec 64)) (t!33843 List!23836)) )
))
(declare-fun arrayNoDuplicates!0 (array!70921 (_ BitVec 32) List!23836) Bool)

(assert (=> b!1095210 (= res!730891 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23833))))

(declare-fun b!1095211 () Bool)

(declare-fun res!730887 () Bool)

(assert (=> b!1095211 (=> (not res!730887) (not e!625273))))

(declare-fun lt!489769 () array!70921)

(assert (=> b!1095211 (= res!730887 (arrayNoDuplicates!0 lt!489769 #b00000000000000000000000000000000 Nil!23833))))

(declare-fun b!1095212 () Bool)

(declare-fun res!730889 () Bool)

(assert (=> b!1095212 (=> (not res!730889) (not e!625272))))

(assert (=> b!1095212 (= res!730889 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34668 _keys!1070))))))

(declare-fun b!1095213 () Bool)

(assert (=> b!1095213 (= e!625272 e!625273)))

(declare-fun res!730884 () Bool)

(assert (=> b!1095213 (=> (not res!730884) (not e!625273))))

(assert (=> b!1095213 (= res!730884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489769 mask!1414))))

(assert (=> b!1095213 (= lt!489769 (array!70922 (store (arr!34132 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34668 _keys!1070)))))

(assert (= (and start!96374 res!730883) b!1095208))

(assert (= (and b!1095208 res!730886) b!1095205))

(assert (= (and b!1095205 res!730888) b!1095210))

(assert (= (and b!1095210 res!730891) b!1095212))

(assert (= (and b!1095212 res!730889) b!1095206))

(assert (= (and b!1095206 res!730885) b!1095204))

(assert (= (and b!1095204 res!730890) b!1095213))

(assert (= (and b!1095213 res!730884) b!1095211))

(assert (= (and b!1095211 res!730887) b!1095202))

(assert (= (and b!1095203 condMapEmpty!42265) mapIsEmpty!42265))

(assert (= (and b!1095203 (not condMapEmpty!42265)) mapNonEmpty!42265))

(get-info :version)

(assert (= (and mapNonEmpty!42265 ((_ is ValueCellFull!12792) mapValue!42265)) b!1095207))

(assert (= (and b!1095203 ((_ is ValueCellFull!12792) mapDefault!42265)) b!1095209))

(assert (= start!96374 b!1095203))

(declare-fun m!1014885 () Bool)

(assert (=> b!1095206 m!1014885))

(declare-fun m!1014887 () Bool)

(assert (=> b!1095213 m!1014887))

(declare-fun m!1014889 () Bool)

(assert (=> b!1095213 m!1014889))

(declare-fun m!1014891 () Bool)

(assert (=> b!1095202 m!1014891))

(declare-fun m!1014893 () Bool)

(assert (=> b!1095202 m!1014893))

(declare-fun m!1014895 () Bool)

(assert (=> b!1095202 m!1014895))

(declare-fun m!1014897 () Bool)

(assert (=> b!1095211 m!1014897))

(declare-fun m!1014899 () Bool)

(assert (=> b!1095205 m!1014899))

(declare-fun m!1014901 () Bool)

(assert (=> b!1095204 m!1014901))

(declare-fun m!1014903 () Bool)

(assert (=> mapNonEmpty!42265 m!1014903))

(declare-fun m!1014905 () Bool)

(assert (=> b!1095210 m!1014905))

(declare-fun m!1014907 () Bool)

(assert (=> start!96374 m!1014907))

(declare-fun m!1014909 () Bool)

(assert (=> start!96374 m!1014909))

(declare-fun m!1014911 () Bool)

(assert (=> start!96374 m!1014911))

(check-sat (not b!1095211) (not b!1095210) (not b!1095206) (not b!1095202) b_and!36579 (not start!96374) (not b!1095205) (not b_next!22953) (not mapNonEmpty!42265) (not b!1095213) tp_is_empty!27003)
(check-sat b_and!36579 (not b_next!22953))
