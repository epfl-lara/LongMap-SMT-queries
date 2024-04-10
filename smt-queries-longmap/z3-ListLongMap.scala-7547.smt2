; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95604 () Bool)

(assert start!95604)

(declare-fun b_free!22257 () Bool)

(declare-fun b_next!22257 () Bool)

(assert (=> start!95604 (= b_free!22257 (not b_next!22257))))

(declare-fun tp!78620 () Bool)

(declare-fun b_and!35235 () Bool)

(assert (=> start!95604 (= tp!78620 b_and!35235)))

(declare-fun b!1080141 () Bool)

(declare-fun e!617493 () Bool)

(assert (=> b!1080141 (= e!617493 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40139 0))(
  ( (V!40140 (val!13186 Int)) )
))
(declare-fun minValue!831 () V!40139)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16700 0))(
  ( (tuple2!16701 (_1!8361 (_ BitVec 64)) (_2!8361 V!40139)) )
))
(declare-datatypes ((List!23279 0))(
  ( (Nil!23276) (Cons!23275 (h!24484 tuple2!16700) (t!32638 List!23279)) )
))
(declare-datatypes ((ListLongMap!14669 0))(
  ( (ListLongMap!14670 (toList!7350 List!23279)) )
))
(declare-fun lt!478945 () ListLongMap!14669)

(declare-fun zeroValue!831 () V!40139)

(declare-datatypes ((array!69471 0))(
  ( (array!69472 (arr!33409 (Array (_ BitVec 32) (_ BitVec 64))) (size!33945 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69471)

(declare-datatypes ((ValueCell!12420 0))(
  ( (ValueCellFull!12420 (v!15807 V!40139)) (EmptyCell!12420) )
))
(declare-datatypes ((array!69473 0))(
  ( (array!69474 (arr!33410 (Array (_ BitVec 32) ValueCell!12420)) (size!33946 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69473)

(declare-fun getCurrentListMapNoExtraKeys!3898 (array!69471 array!69473 (_ BitVec 32) (_ BitVec 32) V!40139 V!40139 (_ BitVec 32) Int) ListLongMap!14669)

(assert (=> b!1080141 (= lt!478945 (getCurrentListMapNoExtraKeys!3898 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080141 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35520 0))(
  ( (Unit!35521) )
))
(declare-fun lt!478944 () Unit!35520)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69471 (_ BitVec 64) (_ BitVec 32)) Unit!35520)

(assert (=> b!1080141 (= lt!478944 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080142 () Bool)

(declare-fun e!617494 () Bool)

(declare-fun tp_is_empty!26259 () Bool)

(assert (=> b!1080142 (= e!617494 tp_is_empty!26259)))

(declare-fun mapIsEmpty!41143 () Bool)

(declare-fun mapRes!41143 () Bool)

(assert (=> mapIsEmpty!41143 mapRes!41143))

(declare-fun b!1080143 () Bool)

(declare-fun res!719868 () Bool)

(declare-fun e!617495 () Bool)

(assert (=> b!1080143 (=> (not res!719868) (not e!617495))))

(assert (=> b!1080143 (= res!719868 (and (= (size!33946 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33945 _keys!1070) (size!33946 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080144 () Bool)

(declare-fun e!617490 () Bool)

(assert (=> b!1080144 (= e!617490 tp_is_empty!26259)))

(declare-fun res!719870 () Bool)

(assert (=> start!95604 (=> (not res!719870) (not e!617495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95604 (= res!719870 (validMask!0 mask!1414))))

(assert (=> start!95604 e!617495))

(assert (=> start!95604 tp!78620))

(assert (=> start!95604 true))

(assert (=> start!95604 tp_is_empty!26259))

(declare-fun array_inv!25796 (array!69471) Bool)

(assert (=> start!95604 (array_inv!25796 _keys!1070)))

(declare-fun e!617491 () Bool)

(declare-fun array_inv!25797 (array!69473) Bool)

(assert (=> start!95604 (and (array_inv!25797 _values!874) e!617491)))

(declare-fun b!1080145 () Bool)

(assert (=> b!1080145 (= e!617495 e!617493)))

(declare-fun res!719866 () Bool)

(assert (=> b!1080145 (=> (not res!719866) (not e!617493))))

(declare-fun lt!478943 () array!69471)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69471 (_ BitVec 32)) Bool)

(assert (=> b!1080145 (= res!719866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478943 mask!1414))))

(assert (=> b!1080145 (= lt!478943 (array!69472 (store (arr!33409 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33945 _keys!1070)))))

(declare-fun b!1080146 () Bool)

(declare-fun res!719869 () Bool)

(assert (=> b!1080146 (=> (not res!719869) (not e!617495))))

(assert (=> b!1080146 (= res!719869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080147 () Bool)

(declare-fun res!719874 () Bool)

(assert (=> b!1080147 (=> (not res!719874) (not e!617495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080147 (= res!719874 (validKeyInArray!0 k0!904))))

(declare-fun b!1080148 () Bool)

(declare-fun res!719873 () Bool)

(assert (=> b!1080148 (=> (not res!719873) (not e!617493))))

(declare-datatypes ((List!23280 0))(
  ( (Nil!23277) (Cons!23276 (h!24485 (_ BitVec 64)) (t!32639 List!23280)) )
))
(declare-fun arrayNoDuplicates!0 (array!69471 (_ BitVec 32) List!23280) Bool)

(assert (=> b!1080148 (= res!719873 (arrayNoDuplicates!0 lt!478943 #b00000000000000000000000000000000 Nil!23277))))

(declare-fun b!1080149 () Bool)

(declare-fun res!719871 () Bool)

(assert (=> b!1080149 (=> (not res!719871) (not e!617495))))

(assert (=> b!1080149 (= res!719871 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33945 _keys!1070))))))

(declare-fun b!1080150 () Bool)

(assert (=> b!1080150 (= e!617491 (and e!617490 mapRes!41143))))

(declare-fun condMapEmpty!41143 () Bool)

(declare-fun mapDefault!41143 () ValueCell!12420)

(assert (=> b!1080150 (= condMapEmpty!41143 (= (arr!33410 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12420)) mapDefault!41143)))))

(declare-fun b!1080151 () Bool)

(declare-fun res!719867 () Bool)

(assert (=> b!1080151 (=> (not res!719867) (not e!617495))))

(assert (=> b!1080151 (= res!719867 (= (select (arr!33409 _keys!1070) i!650) k0!904))))

(declare-fun b!1080152 () Bool)

(declare-fun res!719872 () Bool)

(assert (=> b!1080152 (=> (not res!719872) (not e!617495))))

(assert (=> b!1080152 (= res!719872 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23277))))

(declare-fun mapNonEmpty!41143 () Bool)

(declare-fun tp!78619 () Bool)

(assert (=> mapNonEmpty!41143 (= mapRes!41143 (and tp!78619 e!617494))))

(declare-fun mapRest!41143 () (Array (_ BitVec 32) ValueCell!12420))

(declare-fun mapKey!41143 () (_ BitVec 32))

(declare-fun mapValue!41143 () ValueCell!12420)

(assert (=> mapNonEmpty!41143 (= (arr!33410 _values!874) (store mapRest!41143 mapKey!41143 mapValue!41143))))

(assert (= (and start!95604 res!719870) b!1080143))

(assert (= (and b!1080143 res!719868) b!1080146))

(assert (= (and b!1080146 res!719869) b!1080152))

(assert (= (and b!1080152 res!719872) b!1080149))

(assert (= (and b!1080149 res!719871) b!1080147))

(assert (= (and b!1080147 res!719874) b!1080151))

(assert (= (and b!1080151 res!719867) b!1080145))

(assert (= (and b!1080145 res!719866) b!1080148))

(assert (= (and b!1080148 res!719873) b!1080141))

(assert (= (and b!1080150 condMapEmpty!41143) mapIsEmpty!41143))

(assert (= (and b!1080150 (not condMapEmpty!41143)) mapNonEmpty!41143))

(get-info :version)

(assert (= (and mapNonEmpty!41143 ((_ is ValueCellFull!12420) mapValue!41143)) b!1080142))

(assert (= (and b!1080150 ((_ is ValueCellFull!12420) mapDefault!41143)) b!1080144))

(assert (= start!95604 b!1080150))

(declare-fun m!998165 () Bool)

(assert (=> b!1080151 m!998165))

(declare-fun m!998167 () Bool)

(assert (=> b!1080147 m!998167))

(declare-fun m!998169 () Bool)

(assert (=> b!1080141 m!998169))

(declare-fun m!998171 () Bool)

(assert (=> b!1080141 m!998171))

(declare-fun m!998173 () Bool)

(assert (=> b!1080141 m!998173))

(declare-fun m!998175 () Bool)

(assert (=> b!1080152 m!998175))

(declare-fun m!998177 () Bool)

(assert (=> b!1080148 m!998177))

(declare-fun m!998179 () Bool)

(assert (=> mapNonEmpty!41143 m!998179))

(declare-fun m!998181 () Bool)

(assert (=> start!95604 m!998181))

(declare-fun m!998183 () Bool)

(assert (=> start!95604 m!998183))

(declare-fun m!998185 () Bool)

(assert (=> start!95604 m!998185))

(declare-fun m!998187 () Bool)

(assert (=> b!1080146 m!998187))

(declare-fun m!998189 () Bool)

(assert (=> b!1080145 m!998189))

(declare-fun m!998191 () Bool)

(assert (=> b!1080145 m!998191))

(check-sat tp_is_empty!26259 (not b!1080146) (not b_next!22257) (not b!1080148) (not b!1080152) (not b!1080141) (not b!1080147) (not b!1080145) (not mapNonEmpty!41143) (not start!95604) b_and!35235)
(check-sat b_and!35235 (not b_next!22257))
