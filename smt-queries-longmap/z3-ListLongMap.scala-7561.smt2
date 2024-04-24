; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95922 () Bool)

(assert start!95922)

(declare-fun b_free!22339 () Bool)

(declare-fun b_next!22339 () Bool)

(assert (=> start!95922 (= b_free!22339 (not b_next!22339))))

(declare-fun tp!78865 () Bool)

(declare-fun b_and!35363 () Bool)

(assert (=> start!95922 (= tp!78865 b_and!35363)))

(declare-fun b!1082980 () Bool)

(declare-fun res!721500 () Bool)

(declare-fun e!619086 () Bool)

(assert (=> b!1082980 (=> (not res!721500) (not e!619086))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082980 (= res!721500 (validKeyInArray!0 k0!904))))

(declare-fun b!1082981 () Bool)

(declare-fun res!721497 () Bool)

(assert (=> b!1082981 (=> (not res!721497) (not e!619086))))

(declare-datatypes ((array!69667 0))(
  ( (array!69668 (arr!33501 (Array (_ BitVec 32) (_ BitVec 64))) (size!34038 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69667)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082981 (= res!721497 (= (select (arr!33501 _keys!1070) i!650) k0!904))))

(declare-fun b!1082982 () Bool)

(declare-fun res!721498 () Bool)

(assert (=> b!1082982 (=> (not res!721498) (not e!619086))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40249 0))(
  ( (V!40250 (val!13227 Int)) )
))
(declare-datatypes ((ValueCell!12461 0))(
  ( (ValueCellFull!12461 (v!15844 V!40249)) (EmptyCell!12461) )
))
(declare-datatypes ((array!69669 0))(
  ( (array!69670 (arr!33502 (Array (_ BitVec 32) ValueCell!12461)) (size!34039 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69669)

(assert (=> b!1082982 (= res!721498 (and (= (size!34039 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34038 _keys!1070) (size!34039 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082983 () Bool)

(declare-fun e!619084 () Bool)

(declare-fun tp_is_empty!26341 () Bool)

(assert (=> b!1082983 (= e!619084 tp_is_empty!26341)))

(declare-fun res!721503 () Bool)

(assert (=> start!95922 (=> (not res!721503) (not e!619086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95922 (= res!721503 (validMask!0 mask!1414))))

(assert (=> start!95922 e!619086))

(assert (=> start!95922 tp!78865))

(assert (=> start!95922 true))

(assert (=> start!95922 tp_is_empty!26341))

(declare-fun array_inv!25902 (array!69667) Bool)

(assert (=> start!95922 (array_inv!25902 _keys!1070)))

(declare-fun e!619087 () Bool)

(declare-fun array_inv!25903 (array!69669) Bool)

(assert (=> start!95922 (and (array_inv!25903 _values!874) e!619087)))

(declare-fun b!1082984 () Bool)

(declare-fun res!721496 () Bool)

(assert (=> b!1082984 (=> (not res!721496) (not e!619086))))

(assert (=> b!1082984 (= res!721496 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34038 _keys!1070))))))

(declare-fun b!1082985 () Bool)

(declare-fun res!721502 () Bool)

(assert (=> b!1082985 (=> (not res!721502) (not e!619086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69667 (_ BitVec 32)) Bool)

(assert (=> b!1082985 (= res!721502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082986 () Bool)

(declare-fun res!721501 () Bool)

(assert (=> b!1082986 (=> (not res!721501) (not e!619086))))

(declare-datatypes ((List!23349 0))(
  ( (Nil!23346) (Cons!23345 (h!24563 (_ BitVec 64)) (t!32738 List!23349)) )
))
(declare-fun arrayNoDuplicates!0 (array!69667 (_ BitVec 32) List!23349) Bool)

(assert (=> b!1082986 (= res!721501 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23346))))

(declare-fun b!1082987 () Bool)

(declare-fun e!619083 () Bool)

(assert (=> b!1082987 (= e!619083 tp_is_empty!26341)))

(declare-fun b!1082988 () Bool)

(declare-fun e!619085 () Bool)

(assert (=> b!1082988 (= e!619085 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40249)

(declare-fun lt!479883 () array!69667)

(declare-fun zeroValue!831 () V!40249)

(declare-datatypes ((tuple2!16760 0))(
  ( (tuple2!16761 (_1!8391 (_ BitVec 64)) (_2!8391 V!40249)) )
))
(declare-datatypes ((List!23350 0))(
  ( (Nil!23347) (Cons!23346 (h!24564 tuple2!16760) (t!32739 List!23350)) )
))
(declare-datatypes ((ListLongMap!14737 0))(
  ( (ListLongMap!14738 (toList!7384 List!23350)) )
))
(declare-fun lt!479886 () ListLongMap!14737)

(declare-fun getCurrentListMapNoExtraKeys!3961 (array!69667 array!69669 (_ BitVec 32) (_ BitVec 32) V!40249 V!40249 (_ BitVec 32) Int) ListLongMap!14737)

(declare-fun dynLambda!2082 (Int (_ BitVec 64)) V!40249)

(assert (=> b!1082988 (= lt!479886 (getCurrentListMapNoExtraKeys!3961 lt!479883 (array!69670 (store (arr!33502 _values!874) i!650 (ValueCellFull!12461 (dynLambda!2082 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34039 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479884 () ListLongMap!14737)

(assert (=> b!1082988 (= lt!479884 (getCurrentListMapNoExtraKeys!3961 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082988 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35559 0))(
  ( (Unit!35560) )
))
(declare-fun lt!479885 () Unit!35559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69667 (_ BitVec 64) (_ BitVec 32)) Unit!35559)

(assert (=> b!1082988 (= lt!479885 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41266 () Bool)

(declare-fun mapRes!41266 () Bool)

(declare-fun tp!78866 () Bool)

(assert (=> mapNonEmpty!41266 (= mapRes!41266 (and tp!78866 e!619084))))

(declare-fun mapRest!41266 () (Array (_ BitVec 32) ValueCell!12461))

(declare-fun mapValue!41266 () ValueCell!12461)

(declare-fun mapKey!41266 () (_ BitVec 32))

(assert (=> mapNonEmpty!41266 (= (arr!33502 _values!874) (store mapRest!41266 mapKey!41266 mapValue!41266))))

(declare-fun b!1082989 () Bool)

(declare-fun res!721495 () Bool)

(assert (=> b!1082989 (=> (not res!721495) (not e!619085))))

(assert (=> b!1082989 (= res!721495 (arrayNoDuplicates!0 lt!479883 #b00000000000000000000000000000000 Nil!23346))))

(declare-fun b!1082990 () Bool)

(assert (=> b!1082990 (= e!619086 e!619085)))

(declare-fun res!721499 () Bool)

(assert (=> b!1082990 (=> (not res!721499) (not e!619085))))

(assert (=> b!1082990 (= res!721499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479883 mask!1414))))

(assert (=> b!1082990 (= lt!479883 (array!69668 (store (arr!33501 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34038 _keys!1070)))))

(declare-fun b!1082991 () Bool)

(assert (=> b!1082991 (= e!619087 (and e!619083 mapRes!41266))))

(declare-fun condMapEmpty!41266 () Bool)

(declare-fun mapDefault!41266 () ValueCell!12461)

(assert (=> b!1082991 (= condMapEmpty!41266 (= (arr!33502 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12461)) mapDefault!41266)))))

(declare-fun mapIsEmpty!41266 () Bool)

(assert (=> mapIsEmpty!41266 mapRes!41266))

(assert (= (and start!95922 res!721503) b!1082982))

(assert (= (and b!1082982 res!721498) b!1082985))

(assert (= (and b!1082985 res!721502) b!1082986))

(assert (= (and b!1082986 res!721501) b!1082984))

(assert (= (and b!1082984 res!721496) b!1082980))

(assert (= (and b!1082980 res!721500) b!1082981))

(assert (= (and b!1082981 res!721497) b!1082990))

(assert (= (and b!1082990 res!721499) b!1082989))

(assert (= (and b!1082989 res!721495) b!1082988))

(assert (= (and b!1082991 condMapEmpty!41266) mapIsEmpty!41266))

(assert (= (and b!1082991 (not condMapEmpty!41266)) mapNonEmpty!41266))

(get-info :version)

(assert (= (and mapNonEmpty!41266 ((_ is ValueCellFull!12461) mapValue!41266)) b!1082983))

(assert (= (and b!1082991 ((_ is ValueCellFull!12461) mapDefault!41266)) b!1082987))

(assert (= start!95922 b!1082991))

(declare-fun b_lambda!17019 () Bool)

(assert (=> (not b_lambda!17019) (not b!1082988)))

(declare-fun t!32737 () Bool)

(declare-fun tb!7209 () Bool)

(assert (=> (and start!95922 (= defaultEntry!882 defaultEntry!882) t!32737) tb!7209))

(declare-fun result!14945 () Bool)

(assert (=> tb!7209 (= result!14945 tp_is_empty!26341)))

(assert (=> b!1082988 t!32737))

(declare-fun b_and!35365 () Bool)

(assert (= b_and!35363 (and (=> t!32737 result!14945) b_and!35365)))

(declare-fun m!1001093 () Bool)

(assert (=> b!1082988 m!1001093))

(declare-fun m!1001095 () Bool)

(assert (=> b!1082988 m!1001095))

(declare-fun m!1001097 () Bool)

(assert (=> b!1082988 m!1001097))

(declare-fun m!1001099 () Bool)

(assert (=> b!1082988 m!1001099))

(declare-fun m!1001101 () Bool)

(assert (=> b!1082988 m!1001101))

(declare-fun m!1001103 () Bool)

(assert (=> b!1082988 m!1001103))

(declare-fun m!1001105 () Bool)

(assert (=> b!1082981 m!1001105))

(declare-fun m!1001107 () Bool)

(assert (=> b!1082980 m!1001107))

(declare-fun m!1001109 () Bool)

(assert (=> b!1082985 m!1001109))

(declare-fun m!1001111 () Bool)

(assert (=> b!1082986 m!1001111))

(declare-fun m!1001113 () Bool)

(assert (=> b!1082989 m!1001113))

(declare-fun m!1001115 () Bool)

(assert (=> b!1082990 m!1001115))

(declare-fun m!1001117 () Bool)

(assert (=> b!1082990 m!1001117))

(declare-fun m!1001119 () Bool)

(assert (=> start!95922 m!1001119))

(declare-fun m!1001121 () Bool)

(assert (=> start!95922 m!1001121))

(declare-fun m!1001123 () Bool)

(assert (=> start!95922 m!1001123))

(declare-fun m!1001125 () Bool)

(assert (=> mapNonEmpty!41266 m!1001125))

(check-sat (not b!1082988) (not b_next!22339) (not b!1082980) tp_is_empty!26341 (not b!1082986) (not b!1082985) (not mapNonEmpty!41266) (not b_lambda!17019) (not b!1082990) (not b!1082989) b_and!35365 (not start!95922))
(check-sat b_and!35365 (not b_next!22339))
