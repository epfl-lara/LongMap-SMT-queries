; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41484 () Bool)

(assert start!41484)

(declare-fun b_free!11151 () Bool)

(declare-fun b_next!11151 () Bool)

(assert (=> start!41484 (= b_free!11151 (not b_next!11151))))

(declare-fun tp!39450 () Bool)

(declare-fun b_and!19491 () Bool)

(assert (=> start!41484 (= tp!39450 b_and!19491)))

(declare-fun mapNonEmpty!20545 () Bool)

(declare-fun mapRes!20545 () Bool)

(declare-fun tp!39451 () Bool)

(declare-fun e!270581 () Bool)

(assert (=> mapNonEmpty!20545 (= mapRes!20545 (and tp!39451 e!270581))))

(declare-datatypes ((V!17877 0))(
  ( (V!17878 (val!6334 Int)) )
))
(declare-datatypes ((ValueCell!5946 0))(
  ( (ValueCellFull!5946 (v!8621 V!17877)) (EmptyCell!5946) )
))
(declare-datatypes ((array!28953 0))(
  ( (array!28954 (arr!13908 (Array (_ BitVec 32) ValueCell!5946)) (size!14260 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28953)

(declare-fun mapValue!20545 () ValueCell!5946)

(declare-fun mapRest!20545 () (Array (_ BitVec 32) ValueCell!5946))

(declare-fun mapKey!20545 () (_ BitVec 32))

(assert (=> mapNonEmpty!20545 (= (arr!13908 _values!833) (store mapRest!20545 mapKey!20545 mapValue!20545))))

(declare-fun mapIsEmpty!20545 () Bool)

(assert (=> mapIsEmpty!20545 mapRes!20545))

(declare-fun b!463432 () Bool)

(declare-fun e!270578 () Bool)

(assert (=> b!463432 (= e!270578 false)))

(declare-datatypes ((tuple2!8296 0))(
  ( (tuple2!8297 (_1!4159 (_ BitVec 64)) (_2!4159 V!17877)) )
))
(declare-datatypes ((List!8389 0))(
  ( (Nil!8386) (Cons!8385 (h!9241 tuple2!8296) (t!14335 List!8389)) )
))
(declare-datatypes ((ListLongMap!7209 0))(
  ( (ListLongMap!7210 (toList!3620 List!8389)) )
))
(declare-fun lt!209377 () ListLongMap!7209)

(declare-fun zeroValue!794 () V!17877)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28955 0))(
  ( (array!28956 (arr!13909 (Array (_ BitVec 32) (_ BitVec 64))) (size!14261 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28955)

(declare-fun minValueAfter!38 () V!17877)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1800 (array!28955 array!28953 (_ BitVec 32) (_ BitVec 32) V!17877 V!17877 (_ BitVec 32) Int) ListLongMap!7209)

(assert (=> b!463432 (= lt!209377 (getCurrentListMapNoExtraKeys!1800 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17877)

(declare-fun lt!209378 () ListLongMap!7209)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463432 (= lt!209378 (getCurrentListMapNoExtraKeys!1800 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463433 () Bool)

(declare-fun res!277097 () Bool)

(assert (=> b!463433 (=> (not res!277097) (not e!270578))))

(assert (=> b!463433 (= res!277097 (and (= (size!14260 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14261 _keys!1025) (size!14260 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463434 () Bool)

(declare-fun e!270580 () Bool)

(declare-fun tp_is_empty!12579 () Bool)

(assert (=> b!463434 (= e!270580 tp_is_empty!12579)))

(declare-fun b!463435 () Bool)

(declare-fun res!277099 () Bool)

(assert (=> b!463435 (=> (not res!277099) (not e!270578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28955 (_ BitVec 32)) Bool)

(assert (=> b!463435 (= res!277099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277098 () Bool)

(assert (=> start!41484 (=> (not res!277098) (not e!270578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41484 (= res!277098 (validMask!0 mask!1365))))

(assert (=> start!41484 e!270578))

(assert (=> start!41484 tp_is_empty!12579))

(assert (=> start!41484 tp!39450))

(assert (=> start!41484 true))

(declare-fun array_inv!10054 (array!28955) Bool)

(assert (=> start!41484 (array_inv!10054 _keys!1025)))

(declare-fun e!270579 () Bool)

(declare-fun array_inv!10055 (array!28953) Bool)

(assert (=> start!41484 (and (array_inv!10055 _values!833) e!270579)))

(declare-fun b!463436 () Bool)

(assert (=> b!463436 (= e!270579 (and e!270580 mapRes!20545))))

(declare-fun condMapEmpty!20545 () Bool)

(declare-fun mapDefault!20545 () ValueCell!5946)

(assert (=> b!463436 (= condMapEmpty!20545 (= (arr!13908 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5946)) mapDefault!20545)))))

(declare-fun b!463437 () Bool)

(declare-fun res!277100 () Bool)

(assert (=> b!463437 (=> (not res!277100) (not e!270578))))

(declare-datatypes ((List!8390 0))(
  ( (Nil!8387) (Cons!8386 (h!9242 (_ BitVec 64)) (t!14336 List!8390)) )
))
(declare-fun arrayNoDuplicates!0 (array!28955 (_ BitVec 32) List!8390) Bool)

(assert (=> b!463437 (= res!277100 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8387))))

(declare-fun b!463438 () Bool)

(assert (=> b!463438 (= e!270581 tp_is_empty!12579)))

(assert (= (and start!41484 res!277098) b!463433))

(assert (= (and b!463433 res!277097) b!463435))

(assert (= (and b!463435 res!277099) b!463437))

(assert (= (and b!463437 res!277100) b!463432))

(assert (= (and b!463436 condMapEmpty!20545) mapIsEmpty!20545))

(assert (= (and b!463436 (not condMapEmpty!20545)) mapNonEmpty!20545))

(get-info :version)

(assert (= (and mapNonEmpty!20545 ((_ is ValueCellFull!5946) mapValue!20545)) b!463438))

(assert (= (and b!463436 ((_ is ValueCellFull!5946) mapDefault!20545)) b!463434))

(assert (= start!41484 b!463436))

(declare-fun m!446025 () Bool)

(assert (=> b!463437 m!446025))

(declare-fun m!446027 () Bool)

(assert (=> mapNonEmpty!20545 m!446027))

(declare-fun m!446029 () Bool)

(assert (=> b!463432 m!446029))

(declare-fun m!446031 () Bool)

(assert (=> b!463432 m!446031))

(declare-fun m!446033 () Bool)

(assert (=> start!41484 m!446033))

(declare-fun m!446035 () Bool)

(assert (=> start!41484 m!446035))

(declare-fun m!446037 () Bool)

(assert (=> start!41484 m!446037))

(declare-fun m!446039 () Bool)

(assert (=> b!463435 m!446039))

(check-sat (not start!41484) tp_is_empty!12579 (not b!463437) (not b!463435) (not mapNonEmpty!20545) b_and!19491 (not b_next!11151) (not b!463432))
(check-sat b_and!19491 (not b_next!11151))
