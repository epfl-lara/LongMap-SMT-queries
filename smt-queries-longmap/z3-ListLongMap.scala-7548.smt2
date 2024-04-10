; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95610 () Bool)

(assert start!95610)

(declare-fun b_free!22263 () Bool)

(declare-fun b_next!22263 () Bool)

(assert (=> start!95610 (= b_free!22263 (not b_next!22263))))

(declare-fun tp!78638 () Bool)

(declare-fun b_and!35241 () Bool)

(assert (=> start!95610 (= tp!78638 b_and!35241)))

(declare-fun b!1080249 () Bool)

(declare-fun e!617547 () Bool)

(declare-fun e!617544 () Bool)

(assert (=> b!1080249 (= e!617547 e!617544)))

(declare-fun res!719949 () Bool)

(assert (=> b!1080249 (=> (not res!719949) (not e!617544))))

(declare-datatypes ((array!69483 0))(
  ( (array!69484 (arr!33415 (Array (_ BitVec 32) (_ BitVec 64))) (size!33951 (_ BitVec 32))) )
))
(declare-fun lt!478970 () array!69483)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69483 (_ BitVec 32)) Bool)

(assert (=> b!1080249 (= res!719949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478970 mask!1414))))

(declare-fun _keys!1070 () array!69483)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080249 (= lt!478970 (array!69484 (store (arr!33415 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33951 _keys!1070)))))

(declare-fun mapIsEmpty!41152 () Bool)

(declare-fun mapRes!41152 () Bool)

(assert (=> mapIsEmpty!41152 mapRes!41152))

(declare-fun mapNonEmpty!41152 () Bool)

(declare-fun tp!78637 () Bool)

(declare-fun e!617546 () Bool)

(assert (=> mapNonEmpty!41152 (= mapRes!41152 (and tp!78637 e!617546))))

(declare-datatypes ((V!40147 0))(
  ( (V!40148 (val!13189 Int)) )
))
(declare-datatypes ((ValueCell!12423 0))(
  ( (ValueCellFull!12423 (v!15810 V!40147)) (EmptyCell!12423) )
))
(declare-datatypes ((array!69485 0))(
  ( (array!69486 (arr!33416 (Array (_ BitVec 32) ValueCell!12423)) (size!33952 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69485)

(declare-fun mapRest!41152 () (Array (_ BitVec 32) ValueCell!12423))

(declare-fun mapKey!41152 () (_ BitVec 32))

(declare-fun mapValue!41152 () ValueCell!12423)

(assert (=> mapNonEmpty!41152 (= (arr!33416 _values!874) (store mapRest!41152 mapKey!41152 mapValue!41152))))

(declare-fun b!1080250 () Bool)

(declare-fun res!719947 () Bool)

(assert (=> b!1080250 (=> (not res!719947) (not e!617547))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080250 (= res!719947 (validKeyInArray!0 k0!904))))

(declare-fun b!1080251 () Bool)

(declare-fun res!719951 () Bool)

(assert (=> b!1080251 (=> (not res!719951) (not e!617547))))

(assert (=> b!1080251 (= res!719951 (= (select (arr!33415 _keys!1070) i!650) k0!904))))

(declare-fun b!1080252 () Bool)

(declare-fun e!617548 () Bool)

(declare-fun tp_is_empty!26265 () Bool)

(assert (=> b!1080252 (= e!617548 tp_is_empty!26265)))

(declare-fun b!1080253 () Bool)

(declare-fun res!719950 () Bool)

(assert (=> b!1080253 (=> (not res!719950) (not e!617544))))

(declare-datatypes ((List!23284 0))(
  ( (Nil!23281) (Cons!23280 (h!24489 (_ BitVec 64)) (t!32643 List!23284)) )
))
(declare-fun arrayNoDuplicates!0 (array!69483 (_ BitVec 32) List!23284) Bool)

(assert (=> b!1080253 (= res!719950 (arrayNoDuplicates!0 lt!478970 #b00000000000000000000000000000000 Nil!23281))))

(declare-fun res!719948 () Bool)

(assert (=> start!95610 (=> (not res!719948) (not e!617547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95610 (= res!719948 (validMask!0 mask!1414))))

(assert (=> start!95610 e!617547))

(assert (=> start!95610 tp!78638))

(assert (=> start!95610 true))

(assert (=> start!95610 tp_is_empty!26265))

(declare-fun array_inv!25800 (array!69483) Bool)

(assert (=> start!95610 (array_inv!25800 _keys!1070)))

(declare-fun e!617545 () Bool)

(declare-fun array_inv!25801 (array!69485) Bool)

(assert (=> start!95610 (and (array_inv!25801 _values!874) e!617545)))

(declare-fun b!1080254 () Bool)

(declare-fun res!719952 () Bool)

(assert (=> b!1080254 (=> (not res!719952) (not e!617547))))

(assert (=> b!1080254 (= res!719952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080255 () Bool)

(declare-fun res!719953 () Bool)

(assert (=> b!1080255 (=> (not res!719953) (not e!617547))))

(assert (=> b!1080255 (= res!719953 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33951 _keys!1070))))))

(declare-fun b!1080256 () Bool)

(declare-fun res!719954 () Bool)

(assert (=> b!1080256 (=> (not res!719954) (not e!617547))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080256 (= res!719954 (and (= (size!33952 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33951 _keys!1070) (size!33952 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080257 () Bool)

(assert (=> b!1080257 (= e!617545 (and e!617548 mapRes!41152))))

(declare-fun condMapEmpty!41152 () Bool)

(declare-fun mapDefault!41152 () ValueCell!12423)

(assert (=> b!1080257 (= condMapEmpty!41152 (= (arr!33416 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12423)) mapDefault!41152)))))

(declare-fun b!1080258 () Bool)

(assert (=> b!1080258 (= e!617546 tp_is_empty!26265)))

(declare-fun b!1080259 () Bool)

(declare-fun res!719955 () Bool)

(assert (=> b!1080259 (=> (not res!719955) (not e!617547))))

(assert (=> b!1080259 (= res!719955 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23281))))

(declare-fun b!1080260 () Bool)

(assert (=> b!1080260 (= e!617544 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16704 0))(
  ( (tuple2!16705 (_1!8363 (_ BitVec 64)) (_2!8363 V!40147)) )
))
(declare-datatypes ((List!23285 0))(
  ( (Nil!23282) (Cons!23281 (h!24490 tuple2!16704) (t!32644 List!23285)) )
))
(declare-datatypes ((ListLongMap!14673 0))(
  ( (ListLongMap!14674 (toList!7352 List!23285)) )
))
(declare-fun lt!478972 () ListLongMap!14673)

(declare-fun minValue!831 () V!40147)

(declare-fun zeroValue!831 () V!40147)

(declare-fun getCurrentListMapNoExtraKeys!3900 (array!69483 array!69485 (_ BitVec 32) (_ BitVec 32) V!40147 V!40147 (_ BitVec 32) Int) ListLongMap!14673)

(assert (=> b!1080260 (= lt!478972 (getCurrentListMapNoExtraKeys!3900 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080260 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35524 0))(
  ( (Unit!35525) )
))
(declare-fun lt!478971 () Unit!35524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69483 (_ BitVec 64) (_ BitVec 32)) Unit!35524)

(assert (=> b!1080260 (= lt!478971 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95610 res!719948) b!1080256))

(assert (= (and b!1080256 res!719954) b!1080254))

(assert (= (and b!1080254 res!719952) b!1080259))

(assert (= (and b!1080259 res!719955) b!1080255))

(assert (= (and b!1080255 res!719953) b!1080250))

(assert (= (and b!1080250 res!719947) b!1080251))

(assert (= (and b!1080251 res!719951) b!1080249))

(assert (= (and b!1080249 res!719949) b!1080253))

(assert (= (and b!1080253 res!719950) b!1080260))

(assert (= (and b!1080257 condMapEmpty!41152) mapIsEmpty!41152))

(assert (= (and b!1080257 (not condMapEmpty!41152)) mapNonEmpty!41152))

(get-info :version)

(assert (= (and mapNonEmpty!41152 ((_ is ValueCellFull!12423) mapValue!41152)) b!1080258))

(assert (= (and b!1080257 ((_ is ValueCellFull!12423) mapDefault!41152)) b!1080252))

(assert (= start!95610 b!1080257))

(declare-fun m!998249 () Bool)

(assert (=> b!1080249 m!998249))

(declare-fun m!998251 () Bool)

(assert (=> b!1080249 m!998251))

(declare-fun m!998253 () Bool)

(assert (=> mapNonEmpty!41152 m!998253))

(declare-fun m!998255 () Bool)

(assert (=> b!1080259 m!998255))

(declare-fun m!998257 () Bool)

(assert (=> b!1080251 m!998257))

(declare-fun m!998259 () Bool)

(assert (=> b!1080250 m!998259))

(declare-fun m!998261 () Bool)

(assert (=> b!1080260 m!998261))

(declare-fun m!998263 () Bool)

(assert (=> b!1080260 m!998263))

(declare-fun m!998265 () Bool)

(assert (=> b!1080260 m!998265))

(declare-fun m!998267 () Bool)

(assert (=> b!1080254 m!998267))

(declare-fun m!998269 () Bool)

(assert (=> b!1080253 m!998269))

(declare-fun m!998271 () Bool)

(assert (=> start!95610 m!998271))

(declare-fun m!998273 () Bool)

(assert (=> start!95610 m!998273))

(declare-fun m!998275 () Bool)

(assert (=> start!95610 m!998275))

(check-sat b_and!35241 (not b!1080250) (not b!1080259) (not mapNonEmpty!41152) (not b!1080254) (not start!95610) (not b!1080249) (not b!1080260) tp_is_empty!26265 (not b_next!22263) (not b!1080253))
(check-sat b_and!35241 (not b_next!22263))
