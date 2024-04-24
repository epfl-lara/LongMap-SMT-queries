; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41552 () Bool)

(assert start!41552)

(declare-fun b_free!11233 () Bool)

(declare-fun b_next!11233 () Bool)

(assert (=> start!41552 (= b_free!11233 (not b_next!11233))))

(declare-fun tp!39696 () Bool)

(declare-fun b_and!19583 () Bool)

(assert (=> start!41552 (= tp!39696 b_and!19583)))

(declare-fun b!464232 () Bool)

(declare-fun e!271158 () Bool)

(declare-fun tp_is_empty!12661 () Bool)

(assert (=> b!464232 (= e!271158 tp_is_empty!12661)))

(declare-fun b!464233 () Bool)

(declare-fun res!277585 () Bool)

(declare-fun e!271154 () Bool)

(assert (=> b!464233 (=> (not res!277585) (not e!271154))))

(declare-datatypes ((array!29110 0))(
  ( (array!29111 (arr!13986 (Array (_ BitVec 32) (_ BitVec 64))) (size!14338 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29110)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29110 (_ BitVec 32)) Bool)

(assert (=> b!464233 (= res!277585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20668 () Bool)

(declare-fun mapRes!20668 () Bool)

(declare-fun tp!39697 () Bool)

(assert (=> mapNonEmpty!20668 (= mapRes!20668 (and tp!39697 e!271158))))

(declare-datatypes ((V!17987 0))(
  ( (V!17988 (val!6375 Int)) )
))
(declare-datatypes ((ValueCell!5987 0))(
  ( (ValueCellFull!5987 (v!8663 V!17987)) (EmptyCell!5987) )
))
(declare-fun mapValue!20668 () ValueCell!5987)

(declare-datatypes ((array!29112 0))(
  ( (array!29113 (arr!13987 (Array (_ BitVec 32) ValueCell!5987)) (size!14339 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29112)

(declare-fun mapKey!20668 () (_ BitVec 32))

(declare-fun mapRest!20668 () (Array (_ BitVec 32) ValueCell!5987))

(assert (=> mapNonEmpty!20668 (= (arr!13987 _values!833) (store mapRest!20668 mapKey!20668 mapValue!20668))))

(declare-fun b!464234 () Bool)

(declare-fun res!277584 () Bool)

(assert (=> b!464234 (=> (not res!277584) (not e!271154))))

(declare-datatypes ((List!8376 0))(
  ( (Nil!8373) (Cons!8372 (h!9228 (_ BitVec 64)) (t!14314 List!8376)) )
))
(declare-fun arrayNoDuplicates!0 (array!29110 (_ BitVec 32) List!8376) Bool)

(assert (=> b!464234 (= res!277584 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8373))))

(declare-fun res!277583 () Bool)

(assert (=> start!41552 (=> (not res!277583) (not e!271154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41552 (= res!277583 (validMask!0 mask!1365))))

(assert (=> start!41552 e!271154))

(assert (=> start!41552 tp_is_empty!12661))

(assert (=> start!41552 tp!39696))

(assert (=> start!41552 true))

(declare-fun array_inv!10186 (array!29110) Bool)

(assert (=> start!41552 (array_inv!10186 _keys!1025)))

(declare-fun e!271156 () Bool)

(declare-fun array_inv!10187 (array!29112) Bool)

(assert (=> start!41552 (and (array_inv!10187 _values!833) e!271156)))

(declare-fun mapIsEmpty!20668 () Bool)

(assert (=> mapIsEmpty!20668 mapRes!20668))

(declare-fun b!464235 () Bool)

(declare-fun e!271155 () Bool)

(assert (=> b!464235 (= e!271156 (and e!271155 mapRes!20668))))

(declare-fun condMapEmpty!20668 () Bool)

(declare-fun mapDefault!20668 () ValueCell!5987)

(assert (=> b!464235 (= condMapEmpty!20668 (= (arr!13987 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5987)) mapDefault!20668)))))

(declare-fun b!464236 () Bool)

(assert (=> b!464236 (= e!271154 (not true))))

(declare-datatypes ((tuple2!8294 0))(
  ( (tuple2!8295 (_1!4158 (_ BitVec 64)) (_2!4158 V!17987)) )
))
(declare-datatypes ((List!8377 0))(
  ( (Nil!8374) (Cons!8373 (h!9229 tuple2!8294) (t!14315 List!8377)) )
))
(declare-datatypes ((ListLongMap!7209 0))(
  ( (ListLongMap!7210 (toList!3620 List!8377)) )
))
(declare-fun lt!209664 () ListLongMap!7209)

(declare-fun lt!209665 () ListLongMap!7209)

(assert (=> b!464236 (= lt!209664 lt!209665)))

(declare-datatypes ((Unit!13458 0))(
  ( (Unit!13459) )
))
(declare-fun lt!209666 () Unit!13458)

(declare-fun minValueBefore!38 () V!17987)

(declare-fun zeroValue!794 () V!17987)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17987)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!7 (array!29110 array!29112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17987 V!17987 V!17987 V!17987 (_ BitVec 32) Int) Unit!13458)

(assert (=> b!464236 (= lt!209666 (lemmaNoChangeToArrayThenSameMapNoExtras!7 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1847 (array!29110 array!29112 (_ BitVec 32) (_ BitVec 32) V!17987 V!17987 (_ BitVec 32) Int) ListLongMap!7209)

(assert (=> b!464236 (= lt!209665 (getCurrentListMapNoExtraKeys!1847 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464236 (= lt!209664 (getCurrentListMapNoExtraKeys!1847 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464237 () Bool)

(assert (=> b!464237 (= e!271155 tp_is_empty!12661)))

(declare-fun b!464238 () Bool)

(declare-fun res!277582 () Bool)

(assert (=> b!464238 (=> (not res!277582) (not e!271154))))

(assert (=> b!464238 (= res!277582 (and (= (size!14339 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14338 _keys!1025) (size!14339 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41552 res!277583) b!464238))

(assert (= (and b!464238 res!277582) b!464233))

(assert (= (and b!464233 res!277585) b!464234))

(assert (= (and b!464234 res!277584) b!464236))

(assert (= (and b!464235 condMapEmpty!20668) mapIsEmpty!20668))

(assert (= (and b!464235 (not condMapEmpty!20668)) mapNonEmpty!20668))

(get-info :version)

(assert (= (and mapNonEmpty!20668 ((_ is ValueCellFull!5987) mapValue!20668)) b!464232))

(assert (= (and b!464235 ((_ is ValueCellFull!5987) mapDefault!20668)) b!464237))

(assert (= start!41552 b!464235))

(declare-fun m!446881 () Bool)

(assert (=> b!464233 m!446881))

(declare-fun m!446883 () Bool)

(assert (=> start!41552 m!446883))

(declare-fun m!446885 () Bool)

(assert (=> start!41552 m!446885))

(declare-fun m!446887 () Bool)

(assert (=> start!41552 m!446887))

(declare-fun m!446889 () Bool)

(assert (=> b!464236 m!446889))

(declare-fun m!446891 () Bool)

(assert (=> b!464236 m!446891))

(declare-fun m!446893 () Bool)

(assert (=> b!464236 m!446893))

(declare-fun m!446895 () Bool)

(assert (=> mapNonEmpty!20668 m!446895))

(declare-fun m!446897 () Bool)

(assert (=> b!464234 m!446897))

(check-sat (not b!464236) (not mapNonEmpty!20668) (not b_next!11233) b_and!19583 tp_is_empty!12661 (not b!464234) (not start!41552) (not b!464233))
(check-sat b_and!19583 (not b_next!11233))
