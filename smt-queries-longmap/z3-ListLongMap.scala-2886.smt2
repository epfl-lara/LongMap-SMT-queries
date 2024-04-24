; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41432 () Bool)

(assert start!41432)

(declare-fun b_free!11125 () Bool)

(declare-fun b_next!11125 () Bool)

(assert (=> start!41432 (= b_free!11125 (not b_next!11125))))

(declare-fun tp!39369 () Bool)

(declare-fun b_and!19471 () Bool)

(assert (=> start!41432 (= tp!39369 b_and!19471)))

(declare-fun b!463025 () Bool)

(declare-fun res!276907 () Bool)

(declare-fun e!270300 () Bool)

(assert (=> b!463025 (=> (not res!276907) (not e!270300))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28902 0))(
  ( (array!28903 (arr!13883 (Array (_ BitVec 32) (_ BitVec 64))) (size!14235 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28902)

(declare-datatypes ((V!17843 0))(
  ( (V!17844 (val!6321 Int)) )
))
(declare-datatypes ((ValueCell!5933 0))(
  ( (ValueCellFull!5933 (v!8609 V!17843)) (EmptyCell!5933) )
))
(declare-datatypes ((array!28904 0))(
  ( (array!28905 (arr!13884 (Array (_ BitVec 32) ValueCell!5933)) (size!14236 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28904)

(assert (=> b!463025 (= res!276907 (and (= (size!14236 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14235 _keys!1025) (size!14236 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463026 () Bool)

(declare-fun e!270297 () Bool)

(declare-fun e!270299 () Bool)

(declare-fun mapRes!20503 () Bool)

(assert (=> b!463026 (= e!270297 (and e!270299 mapRes!20503))))

(declare-fun condMapEmpty!20503 () Bool)

(declare-fun mapDefault!20503 () ValueCell!5933)

(assert (=> b!463026 (= condMapEmpty!20503 (= (arr!13884 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5933)) mapDefault!20503)))))

(declare-fun res!276909 () Bool)

(assert (=> start!41432 (=> (not res!276909) (not e!270300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41432 (= res!276909 (validMask!0 mask!1365))))

(assert (=> start!41432 e!270300))

(declare-fun tp_is_empty!12553 () Bool)

(assert (=> start!41432 tp_is_empty!12553))

(assert (=> start!41432 tp!39369))

(assert (=> start!41432 true))

(declare-fun array_inv!10118 (array!28902) Bool)

(assert (=> start!41432 (array_inv!10118 _keys!1025)))

(declare-fun array_inv!10119 (array!28904) Bool)

(assert (=> start!41432 (and (array_inv!10119 _values!833) e!270297)))

(declare-fun mapIsEmpty!20503 () Bool)

(assert (=> mapIsEmpty!20503 mapRes!20503))

(declare-fun b!463027 () Bool)

(declare-fun e!270296 () Bool)

(assert (=> b!463027 (= e!270296 tp_is_empty!12553)))

(declare-fun b!463028 () Bool)

(assert (=> b!463028 (= e!270300 false)))

(declare-fun minValueBefore!38 () V!17843)

(declare-datatypes ((tuple2!8218 0))(
  ( (tuple2!8219 (_1!4120 (_ BitVec 64)) (_2!4120 V!17843)) )
))
(declare-datatypes ((List!8299 0))(
  ( (Nil!8296) (Cons!8295 (h!9151 tuple2!8218) (t!14235 List!8299)) )
))
(declare-datatypes ((ListLongMap!7133 0))(
  ( (ListLongMap!7134 (toList!3582 List!8299)) )
))
(declare-fun lt!209315 () ListLongMap!7133)

(declare-fun zeroValue!794 () V!17843)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1809 (array!28902 array!28904 (_ BitVec 32) (_ BitVec 32) V!17843 V!17843 (_ BitVec 32) Int) ListLongMap!7133)

(assert (=> b!463028 (= lt!209315 (getCurrentListMapNoExtraKeys!1809 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20503 () Bool)

(declare-fun tp!39370 () Bool)

(assert (=> mapNonEmpty!20503 (= mapRes!20503 (and tp!39370 e!270296))))

(declare-fun mapRest!20503 () (Array (_ BitVec 32) ValueCell!5933))

(declare-fun mapKey!20503 () (_ BitVec 32))

(declare-fun mapValue!20503 () ValueCell!5933)

(assert (=> mapNonEmpty!20503 (= (arr!13884 _values!833) (store mapRest!20503 mapKey!20503 mapValue!20503))))

(declare-fun b!463029 () Bool)

(declare-fun res!276908 () Bool)

(assert (=> b!463029 (=> (not res!276908) (not e!270300))))

(declare-datatypes ((List!8300 0))(
  ( (Nil!8297) (Cons!8296 (h!9152 (_ BitVec 64)) (t!14236 List!8300)) )
))
(declare-fun arrayNoDuplicates!0 (array!28902 (_ BitVec 32) List!8300) Bool)

(assert (=> b!463029 (= res!276908 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8297))))

(declare-fun b!463030 () Bool)

(declare-fun res!276910 () Bool)

(assert (=> b!463030 (=> (not res!276910) (not e!270300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28902 (_ BitVec 32)) Bool)

(assert (=> b!463030 (= res!276910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463031 () Bool)

(assert (=> b!463031 (= e!270299 tp_is_empty!12553)))

(assert (= (and start!41432 res!276909) b!463025))

(assert (= (and b!463025 res!276907) b!463030))

(assert (= (and b!463030 res!276910) b!463029))

(assert (= (and b!463029 res!276908) b!463028))

(assert (= (and b!463026 condMapEmpty!20503) mapIsEmpty!20503))

(assert (= (and b!463026 (not condMapEmpty!20503)) mapNonEmpty!20503))

(get-info :version)

(assert (= (and mapNonEmpty!20503 ((_ is ValueCellFull!5933) mapValue!20503)) b!463027))

(assert (= (and b!463026 ((_ is ValueCellFull!5933) mapDefault!20503)) b!463031))

(assert (= start!41432 b!463026))

(declare-fun m!445979 () Bool)

(assert (=> b!463029 m!445979))

(declare-fun m!445981 () Bool)

(assert (=> b!463030 m!445981))

(declare-fun m!445983 () Bool)

(assert (=> start!41432 m!445983))

(declare-fun m!445985 () Bool)

(assert (=> start!41432 m!445985))

(declare-fun m!445987 () Bool)

(assert (=> start!41432 m!445987))

(declare-fun m!445989 () Bool)

(assert (=> b!463028 m!445989))

(declare-fun m!445991 () Bool)

(assert (=> mapNonEmpty!20503 m!445991))

(check-sat (not start!41432) (not b_next!11125) b_and!19471 (not b!463029) (not b!463030) tp_is_empty!12553 (not b!463028) (not mapNonEmpty!20503))
(check-sat b_and!19471 (not b_next!11125))
