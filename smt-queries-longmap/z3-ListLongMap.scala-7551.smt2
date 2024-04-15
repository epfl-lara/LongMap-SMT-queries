; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95620 () Bool)

(assert start!95620)

(declare-fun b_free!22279 () Bool)

(declare-fun b_next!22279 () Bool)

(assert (=> start!95620 (= b_free!22279 (not b_next!22279))))

(declare-fun tp!78686 () Bool)

(declare-fun b_and!35231 () Bool)

(assert (=> start!95620 (= tp!78686 b_and!35231)))

(declare-fun res!720096 () Bool)

(declare-fun e!617596 () Bool)

(assert (=> start!95620 (=> (not res!720096) (not e!617596))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95620 (= res!720096 (validMask!0 mask!1414))))

(assert (=> start!95620 e!617596))

(assert (=> start!95620 tp!78686))

(assert (=> start!95620 true))

(declare-fun tp_is_empty!26281 () Bool)

(assert (=> start!95620 tp_is_empty!26281))

(declare-datatypes ((array!69444 0))(
  ( (array!69445 (arr!33396 (Array (_ BitVec 32) (_ BitVec 64))) (size!33934 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69444)

(declare-fun array_inv!25820 (array!69444) Bool)

(assert (=> start!95620 (array_inv!25820 _keys!1070)))

(declare-datatypes ((V!40169 0))(
  ( (V!40170 (val!13197 Int)) )
))
(declare-datatypes ((ValueCell!12431 0))(
  ( (ValueCellFull!12431 (v!15817 V!40169)) (EmptyCell!12431) )
))
(declare-datatypes ((array!69446 0))(
  ( (array!69447 (arr!33397 (Array (_ BitVec 32) ValueCell!12431)) (size!33935 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69446)

(declare-fun e!617595 () Bool)

(declare-fun array_inv!25821 (array!69446) Bool)

(assert (=> start!95620 (and (array_inv!25821 _values!874) e!617595)))

(declare-fun b!1080384 () Bool)

(declare-fun e!617597 () Bool)

(assert (=> b!1080384 (= e!617597 tp_is_empty!26281)))

(declare-fun b!1080385 () Bool)

(declare-fun e!617600 () Bool)

(assert (=> b!1080385 (= e!617600 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40169)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40169)

(declare-datatypes ((tuple2!16784 0))(
  ( (tuple2!16785 (_1!8403 (_ BitVec 64)) (_2!8403 V!40169)) )
))
(declare-datatypes ((List!23345 0))(
  ( (Nil!23342) (Cons!23341 (h!24550 tuple2!16784) (t!32695 List!23345)) )
))
(declare-datatypes ((ListLongMap!14753 0))(
  ( (ListLongMap!14754 (toList!7392 List!23345)) )
))
(declare-fun lt!478842 () ListLongMap!14753)

(declare-fun getCurrentListMapNoExtraKeys!3955 (array!69444 array!69446 (_ BitVec 32) (_ BitVec 32) V!40169 V!40169 (_ BitVec 32) Int) ListLongMap!14753)

(assert (=> b!1080385 (= lt!478842 (getCurrentListMapNoExtraKeys!3955 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080385 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35377 0))(
  ( (Unit!35378) )
))
(declare-fun lt!478843 () Unit!35377)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69444 (_ BitVec 64) (_ BitVec 32)) Unit!35377)

(assert (=> b!1080385 (= lt!478843 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1080386 () Bool)

(declare-fun res!720099 () Bool)

(assert (=> b!1080386 (=> (not res!720099) (not e!617596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080386 (= res!720099 (validKeyInArray!0 k0!904))))

(declare-fun b!1080387 () Bool)

(declare-fun res!720098 () Bool)

(assert (=> b!1080387 (=> (not res!720098) (not e!617596))))

(assert (=> b!1080387 (= res!720098 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33934 _keys!1070))))))

(declare-fun b!1080388 () Bool)

(declare-fun res!720094 () Bool)

(assert (=> b!1080388 (=> (not res!720094) (not e!617600))))

(declare-fun lt!478844 () array!69444)

(declare-datatypes ((List!23346 0))(
  ( (Nil!23343) (Cons!23342 (h!24551 (_ BitVec 64)) (t!32696 List!23346)) )
))
(declare-fun arrayNoDuplicates!0 (array!69444 (_ BitVec 32) List!23346) Bool)

(assert (=> b!1080388 (= res!720094 (arrayNoDuplicates!0 lt!478844 #b00000000000000000000000000000000 Nil!23343))))

(declare-fun b!1080389 () Bool)

(declare-fun res!720095 () Bool)

(assert (=> b!1080389 (=> (not res!720095) (not e!617596))))

(assert (=> b!1080389 (= res!720095 (= (select (arr!33396 _keys!1070) i!650) k0!904))))

(declare-fun b!1080390 () Bool)

(declare-fun res!720100 () Bool)

(assert (=> b!1080390 (=> (not res!720100) (not e!617596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69444 (_ BitVec 32)) Bool)

(assert (=> b!1080390 (= res!720100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080391 () Bool)

(declare-fun res!720097 () Bool)

(assert (=> b!1080391 (=> (not res!720097) (not e!617596))))

(assert (=> b!1080391 (= res!720097 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23343))))

(declare-fun b!1080392 () Bool)

(declare-fun res!720102 () Bool)

(assert (=> b!1080392 (=> (not res!720102) (not e!617596))))

(assert (=> b!1080392 (= res!720102 (and (= (size!33935 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33934 _keys!1070) (size!33935 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41176 () Bool)

(declare-fun mapRes!41176 () Bool)

(declare-fun tp!78685 () Bool)

(declare-fun e!617598 () Bool)

(assert (=> mapNonEmpty!41176 (= mapRes!41176 (and tp!78685 e!617598))))

(declare-fun mapKey!41176 () (_ BitVec 32))

(declare-fun mapValue!41176 () ValueCell!12431)

(declare-fun mapRest!41176 () (Array (_ BitVec 32) ValueCell!12431))

(assert (=> mapNonEmpty!41176 (= (arr!33397 _values!874) (store mapRest!41176 mapKey!41176 mapValue!41176))))

(declare-fun mapIsEmpty!41176 () Bool)

(assert (=> mapIsEmpty!41176 mapRes!41176))

(declare-fun b!1080393 () Bool)

(assert (=> b!1080393 (= e!617596 e!617600)))

(declare-fun res!720101 () Bool)

(assert (=> b!1080393 (=> (not res!720101) (not e!617600))))

(assert (=> b!1080393 (= res!720101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478844 mask!1414))))

(assert (=> b!1080393 (= lt!478844 (array!69445 (store (arr!33396 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33934 _keys!1070)))))

(declare-fun b!1080394 () Bool)

(assert (=> b!1080394 (= e!617595 (and e!617597 mapRes!41176))))

(declare-fun condMapEmpty!41176 () Bool)

(declare-fun mapDefault!41176 () ValueCell!12431)

(assert (=> b!1080394 (= condMapEmpty!41176 (= (arr!33397 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12431)) mapDefault!41176)))))

(declare-fun b!1080395 () Bool)

(assert (=> b!1080395 (= e!617598 tp_is_empty!26281)))

(assert (= (and start!95620 res!720096) b!1080392))

(assert (= (and b!1080392 res!720102) b!1080390))

(assert (= (and b!1080390 res!720100) b!1080391))

(assert (= (and b!1080391 res!720097) b!1080387))

(assert (= (and b!1080387 res!720098) b!1080386))

(assert (= (and b!1080386 res!720099) b!1080389))

(assert (= (and b!1080389 res!720095) b!1080393))

(assert (= (and b!1080393 res!720101) b!1080388))

(assert (= (and b!1080388 res!720094) b!1080385))

(assert (= (and b!1080394 condMapEmpty!41176) mapIsEmpty!41176))

(assert (= (and b!1080394 (not condMapEmpty!41176)) mapNonEmpty!41176))

(get-info :version)

(assert (= (and mapNonEmpty!41176 ((_ is ValueCellFull!12431) mapValue!41176)) b!1080395))

(assert (= (and b!1080394 ((_ is ValueCellFull!12431) mapDefault!41176)) b!1080384))

(assert (= start!95620 b!1080394))

(declare-fun m!997847 () Bool)

(assert (=> mapNonEmpty!41176 m!997847))

(declare-fun m!997849 () Bool)

(assert (=> b!1080385 m!997849))

(declare-fun m!997851 () Bool)

(assert (=> b!1080385 m!997851))

(declare-fun m!997853 () Bool)

(assert (=> b!1080385 m!997853))

(declare-fun m!997855 () Bool)

(assert (=> b!1080388 m!997855))

(declare-fun m!997857 () Bool)

(assert (=> b!1080390 m!997857))

(declare-fun m!997859 () Bool)

(assert (=> b!1080389 m!997859))

(declare-fun m!997861 () Bool)

(assert (=> b!1080391 m!997861))

(declare-fun m!997863 () Bool)

(assert (=> b!1080393 m!997863))

(declare-fun m!997865 () Bool)

(assert (=> b!1080393 m!997865))

(declare-fun m!997867 () Bool)

(assert (=> b!1080386 m!997867))

(declare-fun m!997869 () Bool)

(assert (=> start!95620 m!997869))

(declare-fun m!997871 () Bool)

(assert (=> start!95620 m!997871))

(declare-fun m!997873 () Bool)

(assert (=> start!95620 m!997873))

(check-sat (not b!1080388) (not b!1080390) (not b!1080386) (not b!1080385) (not b_next!22279) (not b!1080391) (not b!1080393) (not mapNonEmpty!41176) b_and!35231 (not start!95620) tp_is_empty!26281)
(check-sat b_and!35231 (not b_next!22279))
