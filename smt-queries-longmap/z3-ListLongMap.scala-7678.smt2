; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96416 () Bool)

(assert start!96416)

(declare-fun b_free!22995 () Bool)

(declare-fun b_next!22995 () Bool)

(assert (=> start!96416 (= b_free!22995 (not b_next!22995))))

(declare-fun tp!80912 () Bool)

(declare-fun b_and!36653 () Bool)

(assert (=> start!96416 (= tp!80912 b_and!36653)))

(declare-fun b!1095990 () Bool)

(declare-fun e!625648 () Bool)

(assert (=> b!1095990 (= e!625648 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41187 0))(
  ( (V!41188 (val!13579 Int)) )
))
(declare-datatypes ((ValueCell!12813 0))(
  ( (ValueCellFull!12813 (v!16200 V!41187)) (EmptyCell!12813) )
))
(declare-datatypes ((array!71003 0))(
  ( (array!71004 (arr!34173 (Array (_ BitVec 32) ValueCell!12813)) (size!34709 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71003)

(declare-fun minValue!831 () V!41187)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!17242 0))(
  ( (tuple2!17243 (_1!8632 (_ BitVec 64)) (_2!8632 V!41187)) )
))
(declare-datatypes ((List!23862 0))(
  ( (Nil!23859) (Cons!23858 (h!25067 tuple2!17242) (t!33903 List!23862)) )
))
(declare-datatypes ((ListLongMap!15211 0))(
  ( (ListLongMap!15212 (toList!7621 List!23862)) )
))
(declare-fun lt!490009 () ListLongMap!15211)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71005 0))(
  ( (array!71006 (arr!34174 (Array (_ BitVec 32) (_ BitVec 64))) (size!34710 (_ BitVec 32))) )
))
(declare-fun lt!490007 () array!71005)

(declare-fun zeroValue!831 () V!41187)

(declare-fun getCurrentListMapNoExtraKeys!4137 (array!71005 array!71003 (_ BitVec 32) (_ BitVec 32) V!41187 V!41187 (_ BitVec 32) Int) ListLongMap!15211)

(declare-fun dynLambda!2272 (Int (_ BitVec 64)) V!41187)

(assert (=> b!1095990 (= lt!490009 (getCurrentListMapNoExtraKeys!4137 lt!490007 (array!71004 (store (arr!34173 _values!874) i!650 (ValueCellFull!12813 (dynLambda!2272 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34709 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490008 () ListLongMap!15211)

(declare-fun _keys!1070 () array!71005)

(assert (=> b!1095990 (= lt!490008 (getCurrentListMapNoExtraKeys!4137 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095990 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36054 0))(
  ( (Unit!36055) )
))
(declare-fun lt!490006 () Unit!36054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71005 (_ BitVec 64) (_ BitVec 32)) Unit!36054)

(assert (=> b!1095990 (= lt!490006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095992 () Bool)

(declare-fun res!731455 () Bool)

(assert (=> b!1095992 (=> (not res!731455) (not e!625648))))

(declare-datatypes ((List!23863 0))(
  ( (Nil!23860) (Cons!23859 (h!25068 (_ BitVec 64)) (t!33904 List!23863)) )
))
(declare-fun arrayNoDuplicates!0 (array!71005 (_ BitVec 32) List!23863) Bool)

(assert (=> b!1095992 (= res!731455 (arrayNoDuplicates!0 lt!490007 #b00000000000000000000000000000000 Nil!23860))))

(declare-fun b!1095993 () Bool)

(declare-fun res!731458 () Bool)

(declare-fun e!625646 () Bool)

(assert (=> b!1095993 (=> (not res!731458) (not e!625646))))

(assert (=> b!1095993 (= res!731458 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23860))))

(declare-fun b!1095994 () Bool)

(declare-fun res!731454 () Bool)

(assert (=> b!1095994 (=> (not res!731454) (not e!625646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71005 (_ BitVec 32)) Bool)

(assert (=> b!1095994 (= res!731454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095995 () Bool)

(declare-fun e!625651 () Bool)

(declare-fun tp_is_empty!27045 () Bool)

(assert (=> b!1095995 (= e!625651 tp_is_empty!27045)))

(declare-fun b!1095996 () Bool)

(declare-fun res!731452 () Bool)

(assert (=> b!1095996 (=> (not res!731452) (not e!625646))))

(assert (=> b!1095996 (= res!731452 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34710 _keys!1070))))))

(declare-fun mapIsEmpty!42328 () Bool)

(declare-fun mapRes!42328 () Bool)

(assert (=> mapIsEmpty!42328 mapRes!42328))

(declare-fun res!731451 () Bool)

(assert (=> start!96416 (=> (not res!731451) (not e!625646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96416 (= res!731451 (validMask!0 mask!1414))))

(assert (=> start!96416 e!625646))

(assert (=> start!96416 tp!80912))

(assert (=> start!96416 true))

(assert (=> start!96416 tp_is_empty!27045))

(declare-fun array_inv!26330 (array!71005) Bool)

(assert (=> start!96416 (array_inv!26330 _keys!1070)))

(declare-fun e!625650 () Bool)

(declare-fun array_inv!26331 (array!71003) Bool)

(assert (=> start!96416 (and (array_inv!26331 _values!874) e!625650)))

(declare-fun b!1095991 () Bool)

(assert (=> b!1095991 (= e!625650 (and e!625651 mapRes!42328))))

(declare-fun condMapEmpty!42328 () Bool)

(declare-fun mapDefault!42328 () ValueCell!12813)

(assert (=> b!1095991 (= condMapEmpty!42328 (= (arr!34173 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12813)) mapDefault!42328)))))

(declare-fun b!1095997 () Bool)

(declare-fun e!625647 () Bool)

(assert (=> b!1095997 (= e!625647 tp_is_empty!27045)))

(declare-fun b!1095998 () Bool)

(declare-fun res!731450 () Bool)

(assert (=> b!1095998 (=> (not res!731450) (not e!625646))))

(assert (=> b!1095998 (= res!731450 (= (select (arr!34174 _keys!1070) i!650) k0!904))))

(declare-fun b!1095999 () Bool)

(declare-fun res!731453 () Bool)

(assert (=> b!1095999 (=> (not res!731453) (not e!625646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095999 (= res!731453 (validKeyInArray!0 k0!904))))

(declare-fun b!1096000 () Bool)

(assert (=> b!1096000 (= e!625646 e!625648)))

(declare-fun res!731456 () Bool)

(assert (=> b!1096000 (=> (not res!731456) (not e!625648))))

(assert (=> b!1096000 (= res!731456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490007 mask!1414))))

(assert (=> b!1096000 (= lt!490007 (array!71006 (store (arr!34174 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34710 _keys!1070)))))

(declare-fun mapNonEmpty!42328 () Bool)

(declare-fun tp!80911 () Bool)

(assert (=> mapNonEmpty!42328 (= mapRes!42328 (and tp!80911 e!625647))))

(declare-fun mapRest!42328 () (Array (_ BitVec 32) ValueCell!12813))

(declare-fun mapKey!42328 () (_ BitVec 32))

(declare-fun mapValue!42328 () ValueCell!12813)

(assert (=> mapNonEmpty!42328 (= (arr!34173 _values!874) (store mapRest!42328 mapKey!42328 mapValue!42328))))

(declare-fun b!1096001 () Bool)

(declare-fun res!731457 () Bool)

(assert (=> b!1096001 (=> (not res!731457) (not e!625646))))

(assert (=> b!1096001 (= res!731457 (and (= (size!34709 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34710 _keys!1070) (size!34709 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96416 res!731451) b!1096001))

(assert (= (and b!1096001 res!731457) b!1095994))

(assert (= (and b!1095994 res!731454) b!1095993))

(assert (= (and b!1095993 res!731458) b!1095996))

(assert (= (and b!1095996 res!731452) b!1095999))

(assert (= (and b!1095999 res!731453) b!1095998))

(assert (= (and b!1095998 res!731450) b!1096000))

(assert (= (and b!1096000 res!731456) b!1095992))

(assert (= (and b!1095992 res!731455) b!1095990))

(assert (= (and b!1095991 condMapEmpty!42328) mapIsEmpty!42328))

(assert (= (and b!1095991 (not condMapEmpty!42328)) mapNonEmpty!42328))

(get-info :version)

(assert (= (and mapNonEmpty!42328 ((_ is ValueCellFull!12813) mapValue!42328)) b!1095997))

(assert (= (and b!1095991 ((_ is ValueCellFull!12813) mapDefault!42328)) b!1095995))

(assert (= start!96416 b!1095991))

(declare-fun b_lambda!17653 () Bool)

(assert (=> (not b_lambda!17653) (not b!1095990)))

(declare-fun t!33902 () Bool)

(declare-fun tb!7861 () Bool)

(assert (=> (and start!96416 (= defaultEntry!882 defaultEntry!882) t!33902) tb!7861))

(declare-fun result!16245 () Bool)

(assert (=> tb!7861 (= result!16245 tp_is_empty!27045)))

(assert (=> b!1095990 t!33902))

(declare-fun b_and!36655 () Bool)

(assert (= b_and!36653 (and (=> t!33902 result!16245) b_and!36655)))

(declare-fun m!1015569 () Bool)

(assert (=> start!96416 m!1015569))

(declare-fun m!1015571 () Bool)

(assert (=> start!96416 m!1015571))

(declare-fun m!1015573 () Bool)

(assert (=> start!96416 m!1015573))

(declare-fun m!1015575 () Bool)

(assert (=> b!1095990 m!1015575))

(declare-fun m!1015577 () Bool)

(assert (=> b!1095990 m!1015577))

(declare-fun m!1015579 () Bool)

(assert (=> b!1095990 m!1015579))

(declare-fun m!1015581 () Bool)

(assert (=> b!1095990 m!1015581))

(declare-fun m!1015583 () Bool)

(assert (=> b!1095990 m!1015583))

(declare-fun m!1015585 () Bool)

(assert (=> b!1095990 m!1015585))

(declare-fun m!1015587 () Bool)

(assert (=> b!1095992 m!1015587))

(declare-fun m!1015589 () Bool)

(assert (=> b!1096000 m!1015589))

(declare-fun m!1015591 () Bool)

(assert (=> b!1096000 m!1015591))

(declare-fun m!1015593 () Bool)

(assert (=> b!1095993 m!1015593))

(declare-fun m!1015595 () Bool)

(assert (=> b!1095998 m!1015595))

(declare-fun m!1015597 () Bool)

(assert (=> b!1095999 m!1015597))

(declare-fun m!1015599 () Bool)

(assert (=> b!1095994 m!1015599))

(declare-fun m!1015601 () Bool)

(assert (=> mapNonEmpty!42328 m!1015601))

(check-sat (not b!1095990) (not b_next!22995) (not b!1095994) b_and!36655 (not b!1095993) (not b!1096000) (not b!1095999) (not b!1095992) tp_is_empty!27045 (not mapNonEmpty!42328) (not start!96416) (not b_lambda!17653))
(check-sat b_and!36655 (not b_next!22995))
