; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95626 () Bool)

(assert start!95626)

(declare-fun b_free!22285 () Bool)

(declare-fun b_next!22285 () Bool)

(assert (=> start!95626 (= b_free!22285 (not b_next!22285))))

(declare-fun tp!78704 () Bool)

(declare-fun b_and!35237 () Bool)

(assert (=> start!95626 (= tp!78704 b_and!35237)))

(declare-fun b!1080492 () Bool)

(declare-fun res!720176 () Bool)

(declare-fun e!617651 () Bool)

(assert (=> b!1080492 (=> (not res!720176) (not e!617651))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69456 0))(
  ( (array!69457 (arr!33402 (Array (_ BitVec 32) (_ BitVec 64))) (size!33940 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69456)

(assert (=> b!1080492 (= res!720176 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33940 _keys!1070))))))

(declare-fun b!1080493 () Bool)

(declare-fun e!617653 () Bool)

(declare-fun tp_is_empty!26287 () Bool)

(assert (=> b!1080493 (= e!617653 tp_is_empty!26287)))

(declare-fun b!1080494 () Bool)

(declare-fun res!720178 () Bool)

(assert (=> b!1080494 (=> (not res!720178) (not e!617651))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69456 (_ BitVec 32)) Bool)

(assert (=> b!1080494 (= res!720178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080495 () Bool)

(declare-fun res!720181 () Bool)

(assert (=> b!1080495 (=> (not res!720181) (not e!617651))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40177 0))(
  ( (V!40178 (val!13200 Int)) )
))
(declare-datatypes ((ValueCell!12434 0))(
  ( (ValueCellFull!12434 (v!15820 V!40177)) (EmptyCell!12434) )
))
(declare-datatypes ((array!69458 0))(
  ( (array!69459 (arr!33403 (Array (_ BitVec 32) ValueCell!12434)) (size!33941 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69458)

(assert (=> b!1080495 (= res!720181 (and (= (size!33941 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33940 _keys!1070) (size!33941 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080496 () Bool)

(declare-fun res!720183 () Bool)

(assert (=> b!1080496 (=> (not res!720183) (not e!617651))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080496 (= res!720183 (validKeyInArray!0 k0!904))))

(declare-fun b!1080497 () Bool)

(declare-fun e!617652 () Bool)

(assert (=> b!1080497 (= e!617652 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40177)

(declare-datatypes ((tuple2!16788 0))(
  ( (tuple2!16789 (_1!8405 (_ BitVec 64)) (_2!8405 V!40177)) )
))
(declare-datatypes ((List!23350 0))(
  ( (Nil!23347) (Cons!23346 (h!24555 tuple2!16788) (t!32700 List!23350)) )
))
(declare-datatypes ((ListLongMap!14757 0))(
  ( (ListLongMap!14758 (toList!7394 List!23350)) )
))
(declare-fun lt!478870 () ListLongMap!14757)

(declare-fun zeroValue!831 () V!40177)

(declare-fun getCurrentListMapNoExtraKeys!3957 (array!69456 array!69458 (_ BitVec 32) (_ BitVec 32) V!40177 V!40177 (_ BitVec 32) Int) ListLongMap!14757)

(assert (=> b!1080497 (= lt!478870 (getCurrentListMapNoExtraKeys!3957 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080497 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35381 0))(
  ( (Unit!35382) )
))
(declare-fun lt!478871 () Unit!35381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69456 (_ BitVec 64) (_ BitVec 32)) Unit!35381)

(assert (=> b!1080497 (= lt!478871 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080498 () Bool)

(declare-fun e!617649 () Bool)

(assert (=> b!1080498 (= e!617649 tp_is_empty!26287)))

(declare-fun b!1080499 () Bool)

(assert (=> b!1080499 (= e!617651 e!617652)))

(declare-fun res!720177 () Bool)

(assert (=> b!1080499 (=> (not res!720177) (not e!617652))))

(declare-fun lt!478869 () array!69456)

(assert (=> b!1080499 (= res!720177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478869 mask!1414))))

(assert (=> b!1080499 (= lt!478869 (array!69457 (store (arr!33402 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33940 _keys!1070)))))

(declare-fun mapNonEmpty!41185 () Bool)

(declare-fun mapRes!41185 () Bool)

(declare-fun tp!78703 () Bool)

(assert (=> mapNonEmpty!41185 (= mapRes!41185 (and tp!78703 e!617649))))

(declare-fun mapRest!41185 () (Array (_ BitVec 32) ValueCell!12434))

(declare-fun mapKey!41185 () (_ BitVec 32))

(declare-fun mapValue!41185 () ValueCell!12434)

(assert (=> mapNonEmpty!41185 (= (arr!33403 _values!874) (store mapRest!41185 mapKey!41185 mapValue!41185))))

(declare-fun b!1080500 () Bool)

(declare-fun res!720179 () Bool)

(assert (=> b!1080500 (=> (not res!720179) (not e!617651))))

(declare-datatypes ((List!23351 0))(
  ( (Nil!23348) (Cons!23347 (h!24556 (_ BitVec 64)) (t!32701 List!23351)) )
))
(declare-fun arrayNoDuplicates!0 (array!69456 (_ BitVec 32) List!23351) Bool)

(assert (=> b!1080500 (= res!720179 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23348))))

(declare-fun mapIsEmpty!41185 () Bool)

(assert (=> mapIsEmpty!41185 mapRes!41185))

(declare-fun b!1080501 () Bool)

(declare-fun res!720180 () Bool)

(assert (=> b!1080501 (=> (not res!720180) (not e!617652))))

(assert (=> b!1080501 (= res!720180 (arrayNoDuplicates!0 lt!478869 #b00000000000000000000000000000000 Nil!23348))))

(declare-fun b!1080503 () Bool)

(declare-fun res!720175 () Bool)

(assert (=> b!1080503 (=> (not res!720175) (not e!617651))))

(assert (=> b!1080503 (= res!720175 (= (select (arr!33402 _keys!1070) i!650) k0!904))))

(declare-fun b!1080502 () Bool)

(declare-fun e!617654 () Bool)

(assert (=> b!1080502 (= e!617654 (and e!617653 mapRes!41185))))

(declare-fun condMapEmpty!41185 () Bool)

(declare-fun mapDefault!41185 () ValueCell!12434)

(assert (=> b!1080502 (= condMapEmpty!41185 (= (arr!33403 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12434)) mapDefault!41185)))))

(declare-fun res!720182 () Bool)

(assert (=> start!95626 (=> (not res!720182) (not e!617651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95626 (= res!720182 (validMask!0 mask!1414))))

(assert (=> start!95626 e!617651))

(assert (=> start!95626 tp!78704))

(assert (=> start!95626 true))

(assert (=> start!95626 tp_is_empty!26287))

(declare-fun array_inv!25824 (array!69456) Bool)

(assert (=> start!95626 (array_inv!25824 _keys!1070)))

(declare-fun array_inv!25825 (array!69458) Bool)

(assert (=> start!95626 (and (array_inv!25825 _values!874) e!617654)))

(assert (= (and start!95626 res!720182) b!1080495))

(assert (= (and b!1080495 res!720181) b!1080494))

(assert (= (and b!1080494 res!720178) b!1080500))

(assert (= (and b!1080500 res!720179) b!1080492))

(assert (= (and b!1080492 res!720176) b!1080496))

(assert (= (and b!1080496 res!720183) b!1080503))

(assert (= (and b!1080503 res!720175) b!1080499))

(assert (= (and b!1080499 res!720177) b!1080501))

(assert (= (and b!1080501 res!720180) b!1080497))

(assert (= (and b!1080502 condMapEmpty!41185) mapIsEmpty!41185))

(assert (= (and b!1080502 (not condMapEmpty!41185)) mapNonEmpty!41185))

(get-info :version)

(assert (= (and mapNonEmpty!41185 ((_ is ValueCellFull!12434) mapValue!41185)) b!1080498))

(assert (= (and b!1080502 ((_ is ValueCellFull!12434) mapDefault!41185)) b!1080493))

(assert (= start!95626 b!1080502))

(declare-fun m!997931 () Bool)

(assert (=> b!1080494 m!997931))

(declare-fun m!997933 () Bool)

(assert (=> b!1080499 m!997933))

(declare-fun m!997935 () Bool)

(assert (=> b!1080499 m!997935))

(declare-fun m!997937 () Bool)

(assert (=> b!1080496 m!997937))

(declare-fun m!997939 () Bool)

(assert (=> b!1080501 m!997939))

(declare-fun m!997941 () Bool)

(assert (=> b!1080503 m!997941))

(declare-fun m!997943 () Bool)

(assert (=> mapNonEmpty!41185 m!997943))

(declare-fun m!997945 () Bool)

(assert (=> b!1080497 m!997945))

(declare-fun m!997947 () Bool)

(assert (=> b!1080497 m!997947))

(declare-fun m!997949 () Bool)

(assert (=> b!1080497 m!997949))

(declare-fun m!997951 () Bool)

(assert (=> b!1080500 m!997951))

(declare-fun m!997953 () Bool)

(assert (=> start!95626 m!997953))

(declare-fun m!997955 () Bool)

(assert (=> start!95626 m!997955))

(declare-fun m!997957 () Bool)

(assert (=> start!95626 m!997957))

(check-sat (not start!95626) (not b_next!22285) tp_is_empty!26287 (not b!1080496) (not b!1080499) (not b!1080494) (not b!1080497) (not b!1080500) (not b!1080501) b_and!35237 (not mapNonEmpty!41185))
(check-sat b_and!35237 (not b_next!22285))
