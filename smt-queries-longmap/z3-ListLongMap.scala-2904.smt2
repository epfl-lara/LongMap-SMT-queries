; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41552 () Bool)

(assert start!41552)

(declare-fun b_free!11233 () Bool)

(declare-fun b_next!11233 () Bool)

(assert (=> start!41552 (= b_free!11233 (not b_next!11233))))

(declare-fun tp!39697 () Bool)

(declare-fun b_and!19547 () Bool)

(assert (=> start!41552 (= tp!39697 b_and!19547)))

(declare-fun b!464022 () Bool)

(declare-fun e!271019 () Bool)

(declare-fun tp_is_empty!12661 () Bool)

(assert (=> b!464022 (= e!271019 tp_is_empty!12661)))

(declare-fun b!464023 () Bool)

(declare-fun res!277461 () Bool)

(declare-fun e!271022 () Bool)

(assert (=> b!464023 (=> (not res!277461) (not e!271022))))

(declare-datatypes ((array!29109 0))(
  ( (array!29110 (arr!13986 (Array (_ BitVec 32) (_ BitVec 64))) (size!14339 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29109)

(declare-datatypes ((List!8470 0))(
  ( (Nil!8467) (Cons!8466 (h!9322 (_ BitVec 64)) (t!14407 List!8470)) )
))
(declare-fun arrayNoDuplicates!0 (array!29109 (_ BitVec 32) List!8470) Bool)

(assert (=> b!464023 (= res!277461 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8467))))

(declare-fun b!464024 () Bool)

(declare-fun res!277460 () Bool)

(assert (=> b!464024 (=> (not res!277460) (not e!271022))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29109 (_ BitVec 32)) Bool)

(assert (=> b!464024 (= res!277460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464025 () Bool)

(declare-fun e!271021 () Bool)

(declare-fun mapRes!20668 () Bool)

(assert (=> b!464025 (= e!271021 (and e!271019 mapRes!20668))))

(declare-fun condMapEmpty!20668 () Bool)

(declare-datatypes ((V!17987 0))(
  ( (V!17988 (val!6375 Int)) )
))
(declare-datatypes ((ValueCell!5987 0))(
  ( (ValueCellFull!5987 (v!8656 V!17987)) (EmptyCell!5987) )
))
(declare-datatypes ((array!29111 0))(
  ( (array!29112 (arr!13987 (Array (_ BitVec 32) ValueCell!5987)) (size!14340 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29111)

(declare-fun mapDefault!20668 () ValueCell!5987)

(assert (=> b!464025 (= condMapEmpty!20668 (= (arr!13987 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5987)) mapDefault!20668)))))

(declare-fun mapIsEmpty!20668 () Bool)

(assert (=> mapIsEmpty!20668 mapRes!20668))

(declare-fun b!464026 () Bool)

(assert (=> b!464026 (= e!271022 (not true))))

(declare-datatypes ((tuple2!8382 0))(
  ( (tuple2!8383 (_1!4202 (_ BitVec 64)) (_2!4202 V!17987)) )
))
(declare-datatypes ((List!8471 0))(
  ( (Nil!8468) (Cons!8467 (h!9323 tuple2!8382) (t!14408 List!8471)) )
))
(declare-datatypes ((ListLongMap!7285 0))(
  ( (ListLongMap!7286 (toList!3658 List!8471)) )
))
(declare-fun lt!209420 () ListLongMap!7285)

(declare-fun lt!209418 () ListLongMap!7285)

(assert (=> b!464026 (= lt!209420 lt!209418)))

(declare-fun minValueBefore!38 () V!17987)

(declare-fun zeroValue!794 () V!17987)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13432 0))(
  ( (Unit!13433) )
))
(declare-fun lt!209419 () Unit!13432)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17987)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!7 (array!29109 array!29111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17987 V!17987 V!17987 V!17987 (_ BitVec 32) Int) Unit!13432)

(assert (=> b!464026 (= lt!209419 (lemmaNoChangeToArrayThenSameMapNoExtras!7 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1850 (array!29109 array!29111 (_ BitVec 32) (_ BitVec 32) V!17987 V!17987 (_ BitVec 32) Int) ListLongMap!7285)

(assert (=> b!464026 (= lt!209418 (getCurrentListMapNoExtraKeys!1850 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464026 (= lt!209420 (getCurrentListMapNoExtraKeys!1850 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20668 () Bool)

(declare-fun tp!39696 () Bool)

(declare-fun e!271020 () Bool)

(assert (=> mapNonEmpty!20668 (= mapRes!20668 (and tp!39696 e!271020))))

(declare-fun mapValue!20668 () ValueCell!5987)

(declare-fun mapRest!20668 () (Array (_ BitVec 32) ValueCell!5987))

(declare-fun mapKey!20668 () (_ BitVec 32))

(assert (=> mapNonEmpty!20668 (= (arr!13987 _values!833) (store mapRest!20668 mapKey!20668 mapValue!20668))))

(declare-fun b!464027 () Bool)

(declare-fun res!277462 () Bool)

(assert (=> b!464027 (=> (not res!277462) (not e!271022))))

(assert (=> b!464027 (= res!277462 (and (= (size!14340 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14339 _keys!1025) (size!14340 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277463 () Bool)

(assert (=> start!41552 (=> (not res!277463) (not e!271022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41552 (= res!277463 (validMask!0 mask!1365))))

(assert (=> start!41552 e!271022))

(assert (=> start!41552 tp_is_empty!12661))

(assert (=> start!41552 tp!39697))

(assert (=> start!41552 true))

(declare-fun array_inv!10180 (array!29109) Bool)

(assert (=> start!41552 (array_inv!10180 _keys!1025)))

(declare-fun array_inv!10181 (array!29111) Bool)

(assert (=> start!41552 (and (array_inv!10181 _values!833) e!271021)))

(declare-fun b!464028 () Bool)

(assert (=> b!464028 (= e!271020 tp_is_empty!12661)))

(assert (= (and start!41552 res!277463) b!464027))

(assert (= (and b!464027 res!277462) b!464024))

(assert (= (and b!464024 res!277460) b!464023))

(assert (= (and b!464023 res!277461) b!464026))

(assert (= (and b!464025 condMapEmpty!20668) mapIsEmpty!20668))

(assert (= (and b!464025 (not condMapEmpty!20668)) mapNonEmpty!20668))

(get-info :version)

(assert (= (and mapNonEmpty!20668 ((_ is ValueCellFull!5987) mapValue!20668)) b!464028))

(assert (= (and b!464025 ((_ is ValueCellFull!5987) mapDefault!20668)) b!464022))

(assert (= start!41552 b!464025))

(declare-fun m!445965 () Bool)

(assert (=> b!464023 m!445965))

(declare-fun m!445967 () Bool)

(assert (=> mapNonEmpty!20668 m!445967))

(declare-fun m!445969 () Bool)

(assert (=> b!464024 m!445969))

(declare-fun m!445971 () Bool)

(assert (=> b!464026 m!445971))

(declare-fun m!445973 () Bool)

(assert (=> b!464026 m!445973))

(declare-fun m!445975 () Bool)

(assert (=> b!464026 m!445975))

(declare-fun m!445977 () Bool)

(assert (=> start!41552 m!445977))

(declare-fun m!445979 () Bool)

(assert (=> start!41552 m!445979))

(declare-fun m!445981 () Bool)

(assert (=> start!41552 m!445981))

(check-sat (not b!464024) (not b_next!11233) b_and!19547 (not start!41552) (not b!464023) (not mapNonEmpty!20668) tp_is_empty!12661 (not b!464026))
(check-sat b_and!19547 (not b_next!11233))
