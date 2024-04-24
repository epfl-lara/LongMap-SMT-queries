; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41540 () Bool)

(assert start!41540)

(declare-fun b_free!11221 () Bool)

(declare-fun b_next!11221 () Bool)

(assert (=> start!41540 (= b_free!11221 (not b_next!11221))))

(declare-fun tp!39661 () Bool)

(declare-fun b_and!19571 () Bool)

(assert (=> start!41540 (= tp!39661 b_and!19571)))

(declare-fun b!464106 () Bool)

(declare-fun res!277510 () Bool)

(declare-fun e!271064 () Bool)

(assert (=> b!464106 (=> (not res!277510) (not e!271064))))

(declare-datatypes ((array!29086 0))(
  ( (array!29087 (arr!13974 (Array (_ BitVec 32) (_ BitVec 64))) (size!14326 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29086)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29086 (_ BitVec 32)) Bool)

(assert (=> b!464106 (= res!277510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464107 () Bool)

(declare-fun e!271067 () Bool)

(declare-fun tp_is_empty!12649 () Bool)

(assert (=> b!464107 (= e!271067 tp_is_empty!12649)))

(declare-fun b!464108 () Bool)

(declare-fun e!271065 () Bool)

(assert (=> b!464108 (= e!271065 tp_is_empty!12649)))

(declare-fun b!464109 () Bool)

(declare-fun e!271066 () Bool)

(declare-fun mapRes!20650 () Bool)

(assert (=> b!464109 (= e!271066 (and e!271065 mapRes!20650))))

(declare-fun condMapEmpty!20650 () Bool)

(declare-datatypes ((V!17971 0))(
  ( (V!17972 (val!6369 Int)) )
))
(declare-datatypes ((ValueCell!5981 0))(
  ( (ValueCellFull!5981 (v!8657 V!17971)) (EmptyCell!5981) )
))
(declare-datatypes ((array!29088 0))(
  ( (array!29089 (arr!13975 (Array (_ BitVec 32) ValueCell!5981)) (size!14327 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29088)

(declare-fun mapDefault!20650 () ValueCell!5981)

(assert (=> b!464109 (= condMapEmpty!20650 (= (arr!13975 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5981)) mapDefault!20650)))))

(declare-fun b!464110 () Bool)

(declare-fun res!277513 () Bool)

(assert (=> b!464110 (=> (not res!277513) (not e!271064))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464110 (= res!277513 (and (= (size!14327 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14326 _keys!1025) (size!14327 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20650 () Bool)

(declare-fun tp!39660 () Bool)

(assert (=> mapNonEmpty!20650 (= mapRes!20650 (and tp!39660 e!271067))))

(declare-fun mapRest!20650 () (Array (_ BitVec 32) ValueCell!5981))

(declare-fun mapKey!20650 () (_ BitVec 32))

(declare-fun mapValue!20650 () ValueCell!5981)

(assert (=> mapNonEmpty!20650 (= (arr!13975 _values!833) (store mapRest!20650 mapKey!20650 mapValue!20650))))

(declare-fun b!464112 () Bool)

(assert (=> b!464112 (= e!271064 (not true))))

(declare-datatypes ((tuple2!8286 0))(
  ( (tuple2!8287 (_1!4154 (_ BitVec 64)) (_2!4154 V!17971)) )
))
(declare-datatypes ((List!8367 0))(
  ( (Nil!8364) (Cons!8363 (h!9219 tuple2!8286) (t!14305 List!8367)) )
))
(declare-datatypes ((ListLongMap!7201 0))(
  ( (ListLongMap!7202 (toList!3616 List!8367)) )
))
(declare-fun lt!209612 () ListLongMap!7201)

(declare-fun lt!209610 () ListLongMap!7201)

(assert (=> b!464112 (= lt!209612 lt!209610)))

(declare-fun minValueBefore!38 () V!17971)

(declare-fun zeroValue!794 () V!17971)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13450 0))(
  ( (Unit!13451) )
))
(declare-fun lt!209611 () Unit!13450)

(declare-fun minValueAfter!38 () V!17971)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!3 (array!29086 array!29088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17971 V!17971 V!17971 V!17971 (_ BitVec 32) Int) Unit!13450)

(assert (=> b!464112 (= lt!209611 (lemmaNoChangeToArrayThenSameMapNoExtras!3 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1843 (array!29086 array!29088 (_ BitVec 32) (_ BitVec 32) V!17971 V!17971 (_ BitVec 32) Int) ListLongMap!7201)

(assert (=> b!464112 (= lt!209610 (getCurrentListMapNoExtraKeys!1843 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464112 (= lt!209612 (getCurrentListMapNoExtraKeys!1843 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20650 () Bool)

(assert (=> mapIsEmpty!20650 mapRes!20650))

(declare-fun b!464111 () Bool)

(declare-fun res!277512 () Bool)

(assert (=> b!464111 (=> (not res!277512) (not e!271064))))

(declare-datatypes ((List!8368 0))(
  ( (Nil!8365) (Cons!8364 (h!9220 (_ BitVec 64)) (t!14306 List!8368)) )
))
(declare-fun arrayNoDuplicates!0 (array!29086 (_ BitVec 32) List!8368) Bool)

(assert (=> b!464111 (= res!277512 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8365))))

(declare-fun res!277511 () Bool)

(assert (=> start!41540 (=> (not res!277511) (not e!271064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41540 (= res!277511 (validMask!0 mask!1365))))

(assert (=> start!41540 e!271064))

(assert (=> start!41540 tp_is_empty!12649))

(assert (=> start!41540 tp!39661))

(assert (=> start!41540 true))

(declare-fun array_inv!10176 (array!29086) Bool)

(assert (=> start!41540 (array_inv!10176 _keys!1025)))

(declare-fun array_inv!10177 (array!29088) Bool)

(assert (=> start!41540 (and (array_inv!10177 _values!833) e!271066)))

(assert (= (and start!41540 res!277511) b!464110))

(assert (= (and b!464110 res!277513) b!464106))

(assert (= (and b!464106 res!277510) b!464111))

(assert (= (and b!464111 res!277512) b!464112))

(assert (= (and b!464109 condMapEmpty!20650) mapIsEmpty!20650))

(assert (= (and b!464109 (not condMapEmpty!20650)) mapNonEmpty!20650))

(get-info :version)

(assert (= (and mapNonEmpty!20650 ((_ is ValueCellFull!5981) mapValue!20650)) b!464107))

(assert (= (and b!464109 ((_ is ValueCellFull!5981) mapDefault!20650)) b!464108))

(assert (= start!41540 b!464109))

(declare-fun m!446773 () Bool)

(assert (=> start!41540 m!446773))

(declare-fun m!446775 () Bool)

(assert (=> start!41540 m!446775))

(declare-fun m!446777 () Bool)

(assert (=> start!41540 m!446777))

(declare-fun m!446779 () Bool)

(assert (=> b!464112 m!446779))

(declare-fun m!446781 () Bool)

(assert (=> b!464112 m!446781))

(declare-fun m!446783 () Bool)

(assert (=> b!464112 m!446783))

(declare-fun m!446785 () Bool)

(assert (=> b!464111 m!446785))

(declare-fun m!446787 () Bool)

(assert (=> mapNonEmpty!20650 m!446787))

(declare-fun m!446789 () Bool)

(assert (=> b!464106 m!446789))

(check-sat tp_is_empty!12649 (not start!41540) (not b_next!11221) b_and!19571 (not b!464106) (not b!464112) (not mapNonEmpty!20650) (not b!464111))
(check-sat b_and!19571 (not b_next!11221))
