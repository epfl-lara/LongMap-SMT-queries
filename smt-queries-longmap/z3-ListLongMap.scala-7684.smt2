; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96686 () Bool)

(assert start!96686)

(declare-fun b_free!23029 () Bool)

(declare-fun b_next!23029 () Bool)

(assert (=> start!96686 (= b_free!23029 (not b_next!23029))))

(declare-fun tp!81013 () Bool)

(declare-fun b_and!36731 () Bool)

(assert (=> start!96686 (= tp!81013 b_and!36731)))

(declare-fun b!1097963 () Bool)

(declare-fun e!626808 () Bool)

(declare-fun tp_is_empty!27079 () Bool)

(assert (=> b!1097963 (= e!626808 tp_is_empty!27079)))

(declare-fun res!732432 () Bool)

(declare-fun e!626807 () Bool)

(assert (=> start!96686 (=> (not res!732432) (not e!626807))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96686 (= res!732432 (validMask!0 mask!1414))))

(assert (=> start!96686 e!626807))

(assert (=> start!96686 tp!81013))

(assert (=> start!96686 true))

(assert (=> start!96686 tp_is_empty!27079))

(declare-datatypes ((array!71099 0))(
  ( (array!71100 (arr!34215 (Array (_ BitVec 32) (_ BitVec 64))) (size!34752 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71099)

(declare-fun array_inv!26392 (array!71099) Bool)

(assert (=> start!96686 (array_inv!26392 _keys!1070)))

(declare-datatypes ((V!41233 0))(
  ( (V!41234 (val!13596 Int)) )
))
(declare-datatypes ((ValueCell!12830 0))(
  ( (ValueCellFull!12830 (v!16213 V!41233)) (EmptyCell!12830) )
))
(declare-datatypes ((array!71101 0))(
  ( (array!71102 (arr!34216 (Array (_ BitVec 32) ValueCell!12830)) (size!34753 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71101)

(declare-fun e!626811 () Bool)

(declare-fun array_inv!26393 (array!71101) Bool)

(assert (=> start!96686 (and (array_inv!26393 _values!874) e!626811)))

(declare-fun mapNonEmpty!42379 () Bool)

(declare-fun mapRes!42379 () Bool)

(declare-fun tp!81014 () Bool)

(declare-fun e!626810 () Bool)

(assert (=> mapNonEmpty!42379 (= mapRes!42379 (and tp!81014 e!626810))))

(declare-fun mapRest!42379 () (Array (_ BitVec 32) ValueCell!12830))

(declare-fun mapKey!42379 () (_ BitVec 32))

(declare-fun mapValue!42379 () ValueCell!12830)

(assert (=> mapNonEmpty!42379 (= (arr!34216 _values!874) (store mapRest!42379 mapKey!42379 mapValue!42379))))

(declare-fun b!1097964 () Bool)

(declare-fun res!732436 () Bool)

(assert (=> b!1097964 (=> (not res!732436) (not e!626807))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097964 (= res!732436 (= (select (arr!34215 _keys!1070) i!650) k0!904))))

(declare-fun b!1097965 () Bool)

(declare-fun res!732437 () Bool)

(assert (=> b!1097965 (=> (not res!732437) (not e!626807))))

(declare-datatypes ((List!23898 0))(
  ( (Nil!23895) (Cons!23894 (h!25112 (_ BitVec 64)) (t!33965 List!23898)) )
))
(declare-fun arrayNoDuplicates!0 (array!71099 (_ BitVec 32) List!23898) Bool)

(assert (=> b!1097965 (= res!732437 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23895))))

(declare-fun b!1097966 () Bool)

(declare-fun e!626809 () Bool)

(assert (=> b!1097966 (= e!626809 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41233)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17276 0))(
  ( (tuple2!17277 (_1!8649 (_ BitVec 64)) (_2!8649 V!41233)) )
))
(declare-datatypes ((List!23899 0))(
  ( (Nil!23896) (Cons!23895 (h!25113 tuple2!17276) (t!33966 List!23899)) )
))
(declare-datatypes ((ListLongMap!15253 0))(
  ( (ListLongMap!15254 (toList!7642 List!23899)) )
))
(declare-fun lt!490727 () ListLongMap!15253)

(declare-fun lt!490726 () array!71099)

(declare-fun zeroValue!831 () V!41233)

(declare-fun getCurrentListMapNoExtraKeys!4195 (array!71099 array!71101 (_ BitVec 32) (_ BitVec 32) V!41233 V!41233 (_ BitVec 32) Int) ListLongMap!15253)

(declare-fun dynLambda!2313 (Int (_ BitVec 64)) V!41233)

(assert (=> b!1097966 (= lt!490727 (getCurrentListMapNoExtraKeys!4195 lt!490726 (array!71102 (store (arr!34216 _values!874) i!650 (ValueCellFull!12830 (dynLambda!2313 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34753 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490725 () ListLongMap!15253)

(assert (=> b!1097966 (= lt!490725 (getCurrentListMapNoExtraKeys!4195 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097966 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36071 0))(
  ( (Unit!36072) )
))
(declare-fun lt!490728 () Unit!36071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71099 (_ BitVec 64) (_ BitVec 32)) Unit!36071)

(assert (=> b!1097966 (= lt!490728 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097967 () Bool)

(declare-fun res!732433 () Bool)

(assert (=> b!1097967 (=> (not res!732433) (not e!626807))))

(assert (=> b!1097967 (= res!732433 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34752 _keys!1070))))))

(declare-fun mapIsEmpty!42379 () Bool)

(assert (=> mapIsEmpty!42379 mapRes!42379))

(declare-fun b!1097968 () Bool)

(declare-fun res!732434 () Bool)

(assert (=> b!1097968 (=> (not res!732434) (not e!626807))))

(assert (=> b!1097968 (= res!732434 (and (= (size!34753 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34752 _keys!1070) (size!34753 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097969 () Bool)

(assert (=> b!1097969 (= e!626810 tp_is_empty!27079)))

(declare-fun b!1097970 () Bool)

(assert (=> b!1097970 (= e!626807 e!626809)))

(declare-fun res!732439 () Bool)

(assert (=> b!1097970 (=> (not res!732439) (not e!626809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71099 (_ BitVec 32)) Bool)

(assert (=> b!1097970 (= res!732439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490726 mask!1414))))

(assert (=> b!1097970 (= lt!490726 (array!71100 (store (arr!34215 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34752 _keys!1070)))))

(declare-fun b!1097971 () Bool)

(assert (=> b!1097971 (= e!626811 (and e!626808 mapRes!42379))))

(declare-fun condMapEmpty!42379 () Bool)

(declare-fun mapDefault!42379 () ValueCell!12830)

(assert (=> b!1097971 (= condMapEmpty!42379 (= (arr!34216 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12830)) mapDefault!42379)))))

(declare-fun b!1097972 () Bool)

(declare-fun res!732431 () Bool)

(assert (=> b!1097972 (=> (not res!732431) (not e!626807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097972 (= res!732431 (validKeyInArray!0 k0!904))))

(declare-fun b!1097973 () Bool)

(declare-fun res!732438 () Bool)

(assert (=> b!1097973 (=> (not res!732438) (not e!626809))))

(assert (=> b!1097973 (= res!732438 (arrayNoDuplicates!0 lt!490726 #b00000000000000000000000000000000 Nil!23895))))

(declare-fun b!1097974 () Bool)

(declare-fun res!732435 () Bool)

(assert (=> b!1097974 (=> (not res!732435) (not e!626807))))

(assert (=> b!1097974 (= res!732435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96686 res!732432) b!1097968))

(assert (= (and b!1097968 res!732434) b!1097974))

(assert (= (and b!1097974 res!732435) b!1097965))

(assert (= (and b!1097965 res!732437) b!1097967))

(assert (= (and b!1097967 res!732433) b!1097972))

(assert (= (and b!1097972 res!732431) b!1097964))

(assert (= (and b!1097964 res!732436) b!1097970))

(assert (= (and b!1097970 res!732439) b!1097973))

(assert (= (and b!1097973 res!732438) b!1097966))

(assert (= (and b!1097971 condMapEmpty!42379) mapIsEmpty!42379))

(assert (= (and b!1097971 (not condMapEmpty!42379)) mapNonEmpty!42379))

(get-info :version)

(assert (= (and mapNonEmpty!42379 ((_ is ValueCellFull!12830) mapValue!42379)) b!1097969))

(assert (= (and b!1097971 ((_ is ValueCellFull!12830) mapDefault!42379)) b!1097963))

(assert (= start!96686 b!1097971))

(declare-fun b_lambda!17697 () Bool)

(assert (=> (not b_lambda!17697) (not b!1097966)))

(declare-fun t!33964 () Bool)

(declare-fun tb!7887 () Bool)

(assert (=> (and start!96686 (= defaultEntry!882 defaultEntry!882) t!33964) tb!7887))

(declare-fun result!16305 () Bool)

(assert (=> tb!7887 (= result!16305 tp_is_empty!27079)))

(assert (=> b!1097966 t!33964))

(declare-fun b_and!36733 () Bool)

(assert (= b_and!36731 (and (=> t!33964 result!16305) b_and!36733)))

(declare-fun m!1017819 () Bool)

(assert (=> b!1097964 m!1017819))

(declare-fun m!1017821 () Bool)

(assert (=> b!1097965 m!1017821))

(declare-fun m!1017823 () Bool)

(assert (=> b!1097974 m!1017823))

(declare-fun m!1017825 () Bool)

(assert (=> b!1097972 m!1017825))

(declare-fun m!1017827 () Bool)

(assert (=> start!96686 m!1017827))

(declare-fun m!1017829 () Bool)

(assert (=> start!96686 m!1017829))

(declare-fun m!1017831 () Bool)

(assert (=> start!96686 m!1017831))

(declare-fun m!1017833 () Bool)

(assert (=> b!1097970 m!1017833))

(declare-fun m!1017835 () Bool)

(assert (=> b!1097970 m!1017835))

(declare-fun m!1017837 () Bool)

(assert (=> b!1097966 m!1017837))

(declare-fun m!1017839 () Bool)

(assert (=> b!1097966 m!1017839))

(declare-fun m!1017841 () Bool)

(assert (=> b!1097966 m!1017841))

(declare-fun m!1017843 () Bool)

(assert (=> b!1097966 m!1017843))

(declare-fun m!1017845 () Bool)

(assert (=> b!1097966 m!1017845))

(declare-fun m!1017847 () Bool)

(assert (=> b!1097966 m!1017847))

(declare-fun m!1017849 () Bool)

(assert (=> mapNonEmpty!42379 m!1017849))

(declare-fun m!1017851 () Bool)

(assert (=> b!1097973 m!1017851))

(check-sat (not b!1097965) (not b!1097966) b_and!36733 tp_is_empty!27079 (not b_lambda!17697) (not b!1097972) (not mapNonEmpty!42379) (not b_next!23029) (not b!1097973) (not b!1097974) (not start!96686) (not b!1097970))
(check-sat b_and!36733 (not b_next!23029))
