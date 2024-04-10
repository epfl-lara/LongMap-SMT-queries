; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96300 () Bool)

(assert start!96300)

(declare-fun b!1094379 () Bool)

(declare-fun res!730325 () Bool)

(declare-fun e!624793 () Bool)

(assert (=> b!1094379 (=> (not res!730325) (not e!624793))))

(declare-datatypes ((array!70825 0))(
  ( (array!70826 (arr!34086 (Array (_ BitVec 32) (_ BitVec 64))) (size!34622 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70825)

(declare-datatypes ((List!23816 0))(
  ( (Nil!23813) (Cons!23812 (h!25021 (_ BitVec 64)) (t!33823 List!23816)) )
))
(declare-fun arrayNoDuplicates!0 (array!70825 (_ BitVec 32) List!23816) Bool)

(assert (=> b!1094379 (= res!730325 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23813))))

(declare-fun res!730326 () Bool)

(assert (=> start!96300 (=> (not res!730326) (not e!624793))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96300 (= res!730326 (validMask!0 mask!1414))))

(assert (=> start!96300 e!624793))

(assert (=> start!96300 true))

(declare-fun array_inv!26268 (array!70825) Bool)

(assert (=> start!96300 (array_inv!26268 _keys!1070)))

(declare-datatypes ((V!41067 0))(
  ( (V!41068 (val!13534 Int)) )
))
(declare-datatypes ((ValueCell!12768 0))(
  ( (ValueCellFull!12768 (v!16155 V!41067)) (EmptyCell!12768) )
))
(declare-datatypes ((array!70827 0))(
  ( (array!70828 (arr!34087 (Array (_ BitVec 32) ValueCell!12768)) (size!34623 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70827)

(declare-fun e!624794 () Bool)

(declare-fun array_inv!26269 (array!70827) Bool)

(assert (=> start!96300 (and (array_inv!26269 _values!874) e!624794)))

(declare-fun mapNonEmpty!42187 () Bool)

(declare-fun mapRes!42187 () Bool)

(declare-fun tp!80702 () Bool)

(declare-fun e!624792 () Bool)

(assert (=> mapNonEmpty!42187 (= mapRes!42187 (and tp!80702 e!624792))))

(declare-fun mapKey!42187 () (_ BitVec 32))

(declare-fun mapValue!42187 () ValueCell!12768)

(declare-fun mapRest!42187 () (Array (_ BitVec 32) ValueCell!12768))

(assert (=> mapNonEmpty!42187 (= (arr!34087 _values!874) (store mapRest!42187 mapKey!42187 mapValue!42187))))

(declare-fun b!1094380 () Bool)

(declare-fun res!730329 () Bool)

(declare-fun e!624790 () Bool)

(assert (=> b!1094380 (=> (not res!730329) (not e!624790))))

(declare-fun lt!489639 () array!70825)

(assert (=> b!1094380 (= res!730329 (arrayNoDuplicates!0 lt!489639 #b00000000000000000000000000000000 Nil!23813))))

(declare-fun b!1094381 () Bool)

(declare-fun res!730327 () Bool)

(assert (=> b!1094381 (=> (not res!730327) (not e!624793))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094381 (= res!730327 (= (select (arr!34086 _keys!1070) i!650) k0!904))))

(declare-fun b!1094382 () Bool)

(declare-fun tp_is_empty!26955 () Bool)

(assert (=> b!1094382 (= e!624792 tp_is_empty!26955)))

(declare-fun b!1094383 () Bool)

(declare-fun res!730328 () Bool)

(assert (=> b!1094383 (=> (not res!730328) (not e!624793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094383 (= res!730328 (validKeyInArray!0 k0!904))))

(declare-fun b!1094384 () Bool)

(assert (=> b!1094384 (= e!624790 (not true))))

(declare-fun arrayContainsKey!0 (array!70825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094384 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36024 0))(
  ( (Unit!36025) )
))
(declare-fun lt!489640 () Unit!36024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70825 (_ BitVec 64) (_ BitVec 32)) Unit!36024)

(assert (=> b!1094384 (= lt!489640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094385 () Bool)

(declare-fun res!730330 () Bool)

(assert (=> b!1094385 (=> (not res!730330) (not e!624793))))

(assert (=> b!1094385 (= res!730330 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34622 _keys!1070))))))

(declare-fun mapIsEmpty!42187 () Bool)

(assert (=> mapIsEmpty!42187 mapRes!42187))

(declare-fun b!1094386 () Bool)

(declare-fun res!730324 () Bool)

(assert (=> b!1094386 (=> (not res!730324) (not e!624793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70825 (_ BitVec 32)) Bool)

(assert (=> b!1094386 (= res!730324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094387 () Bool)

(declare-fun res!730332 () Bool)

(assert (=> b!1094387 (=> (not res!730332) (not e!624793))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094387 (= res!730332 (and (= (size!34623 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34622 _keys!1070) (size!34623 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094388 () Bool)

(assert (=> b!1094388 (= e!624793 e!624790)))

(declare-fun res!730331 () Bool)

(assert (=> b!1094388 (=> (not res!730331) (not e!624790))))

(assert (=> b!1094388 (= res!730331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489639 mask!1414))))

(assert (=> b!1094388 (= lt!489639 (array!70826 (store (arr!34086 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34622 _keys!1070)))))

(declare-fun b!1094389 () Bool)

(declare-fun e!624789 () Bool)

(assert (=> b!1094389 (= e!624789 tp_is_empty!26955)))

(declare-fun b!1094390 () Bool)

(assert (=> b!1094390 (= e!624794 (and e!624789 mapRes!42187))))

(declare-fun condMapEmpty!42187 () Bool)

(declare-fun mapDefault!42187 () ValueCell!12768)

(assert (=> b!1094390 (= condMapEmpty!42187 (= (arr!34087 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12768)) mapDefault!42187)))))

(assert (= (and start!96300 res!730326) b!1094387))

(assert (= (and b!1094387 res!730332) b!1094386))

(assert (= (and b!1094386 res!730324) b!1094379))

(assert (= (and b!1094379 res!730325) b!1094385))

(assert (= (and b!1094385 res!730330) b!1094383))

(assert (= (and b!1094383 res!730328) b!1094381))

(assert (= (and b!1094381 res!730327) b!1094388))

(assert (= (and b!1094388 res!730331) b!1094380))

(assert (= (and b!1094380 res!730329) b!1094384))

(assert (= (and b!1094390 condMapEmpty!42187) mapIsEmpty!42187))

(assert (= (and b!1094390 (not condMapEmpty!42187)) mapNonEmpty!42187))

(get-info :version)

(assert (= (and mapNonEmpty!42187 ((_ is ValueCellFull!12768) mapValue!42187)) b!1094382))

(assert (= (and b!1094390 ((_ is ValueCellFull!12768) mapDefault!42187)) b!1094389))

(assert (= start!96300 b!1094390))

(declare-fun m!1014333 () Bool)

(assert (=> start!96300 m!1014333))

(declare-fun m!1014335 () Bool)

(assert (=> start!96300 m!1014335))

(declare-fun m!1014337 () Bool)

(assert (=> start!96300 m!1014337))

(declare-fun m!1014339 () Bool)

(assert (=> b!1094380 m!1014339))

(declare-fun m!1014341 () Bool)

(assert (=> b!1094383 m!1014341))

(declare-fun m!1014343 () Bool)

(assert (=> b!1094386 m!1014343))

(declare-fun m!1014345 () Bool)

(assert (=> b!1094381 m!1014345))

(declare-fun m!1014347 () Bool)

(assert (=> b!1094384 m!1014347))

(declare-fun m!1014349 () Bool)

(assert (=> b!1094384 m!1014349))

(declare-fun m!1014351 () Bool)

(assert (=> mapNonEmpty!42187 m!1014351))

(declare-fun m!1014353 () Bool)

(assert (=> b!1094379 m!1014353))

(declare-fun m!1014355 () Bool)

(assert (=> b!1094388 m!1014355))

(declare-fun m!1014357 () Bool)

(assert (=> b!1094388 m!1014357))

(check-sat (not b!1094388) (not b!1094384) (not start!96300) (not b!1094383) (not b!1094380) (not mapNonEmpty!42187) (not b!1094379) (not b!1094386) tp_is_empty!26955)
(check-sat)
