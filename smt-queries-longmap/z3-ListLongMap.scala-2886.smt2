; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41432 () Bool)

(assert start!41432)

(declare-fun b_free!11125 () Bool)

(declare-fun b_next!11125 () Bool)

(assert (=> start!41432 (= b_free!11125 (not b_next!11125))))

(declare-fun tp!39369 () Bool)

(declare-fun b_and!19435 () Bool)

(assert (=> start!41432 (= tp!39369 b_and!19435)))

(declare-fun b!462815 () Bool)

(declare-fun res!276787 () Bool)

(declare-fun e!270164 () Bool)

(assert (=> b!462815 (=> (not res!276787) (not e!270164))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28901 0))(
  ( (array!28902 (arr!13883 (Array (_ BitVec 32) (_ BitVec 64))) (size!14236 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28901)

(declare-datatypes ((V!17843 0))(
  ( (V!17844 (val!6321 Int)) )
))
(declare-datatypes ((ValueCell!5933 0))(
  ( (ValueCellFull!5933 (v!8602 V!17843)) (EmptyCell!5933) )
))
(declare-datatypes ((array!28903 0))(
  ( (array!28904 (arr!13884 (Array (_ BitVec 32) ValueCell!5933)) (size!14237 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28903)

(assert (=> b!462815 (= res!276787 (and (= (size!14237 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14236 _keys!1025) (size!14237 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!276788 () Bool)

(assert (=> start!41432 (=> (not res!276788) (not e!270164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41432 (= res!276788 (validMask!0 mask!1365))))

(assert (=> start!41432 e!270164))

(declare-fun tp_is_empty!12553 () Bool)

(assert (=> start!41432 tp_is_empty!12553))

(assert (=> start!41432 tp!39369))

(assert (=> start!41432 true))

(declare-fun array_inv!10106 (array!28901) Bool)

(assert (=> start!41432 (array_inv!10106 _keys!1025)))

(declare-fun e!270163 () Bool)

(declare-fun array_inv!10107 (array!28903) Bool)

(assert (=> start!41432 (and (array_inv!10107 _values!833) e!270163)))

(declare-fun mapIsEmpty!20503 () Bool)

(declare-fun mapRes!20503 () Bool)

(assert (=> mapIsEmpty!20503 mapRes!20503))

(declare-fun b!462816 () Bool)

(declare-fun res!276786 () Bool)

(assert (=> b!462816 (=> (not res!276786) (not e!270164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28901 (_ BitVec 32)) Bool)

(assert (=> b!462816 (= res!276786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462817 () Bool)

(assert (=> b!462817 (= e!270164 false)))

(declare-fun minValueBefore!38 () V!17843)

(declare-fun zeroValue!794 () V!17843)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8312 0))(
  ( (tuple2!8313 (_1!4167 (_ BitVec 64)) (_2!4167 V!17843)) )
))
(declare-datatypes ((List!8398 0))(
  ( (Nil!8395) (Cons!8394 (h!9250 tuple2!8312) (t!14333 List!8398)) )
))
(declare-datatypes ((ListLongMap!7215 0))(
  ( (ListLongMap!7216 (toList!3623 List!8398)) )
))
(declare-fun lt!209069 () ListLongMap!7215)

(declare-fun getCurrentListMapNoExtraKeys!1815 (array!28901 array!28903 (_ BitVec 32) (_ BitVec 32) V!17843 V!17843 (_ BitVec 32) Int) ListLongMap!7215)

(assert (=> b!462817 (= lt!209069 (getCurrentListMapNoExtraKeys!1815 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20503 () Bool)

(declare-fun tp!39370 () Bool)

(declare-fun e!270161 () Bool)

(assert (=> mapNonEmpty!20503 (= mapRes!20503 (and tp!39370 e!270161))))

(declare-fun mapKey!20503 () (_ BitVec 32))

(declare-fun mapValue!20503 () ValueCell!5933)

(declare-fun mapRest!20503 () (Array (_ BitVec 32) ValueCell!5933))

(assert (=> mapNonEmpty!20503 (= (arr!13884 _values!833) (store mapRest!20503 mapKey!20503 mapValue!20503))))

(declare-fun b!462818 () Bool)

(declare-fun e!270162 () Bool)

(assert (=> b!462818 (= e!270162 tp_is_empty!12553)))

(declare-fun b!462819 () Bool)

(assert (=> b!462819 (= e!270163 (and e!270162 mapRes!20503))))

(declare-fun condMapEmpty!20503 () Bool)

(declare-fun mapDefault!20503 () ValueCell!5933)

(assert (=> b!462819 (= condMapEmpty!20503 (= (arr!13884 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5933)) mapDefault!20503)))))

(declare-fun b!462820 () Bool)

(assert (=> b!462820 (= e!270161 tp_is_empty!12553)))

(declare-fun b!462821 () Bool)

(declare-fun res!276785 () Bool)

(assert (=> b!462821 (=> (not res!276785) (not e!270164))))

(declare-datatypes ((List!8399 0))(
  ( (Nil!8396) (Cons!8395 (h!9251 (_ BitVec 64)) (t!14334 List!8399)) )
))
(declare-fun arrayNoDuplicates!0 (array!28901 (_ BitVec 32) List!8399) Bool)

(assert (=> b!462821 (= res!276785 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8396))))

(assert (= (and start!41432 res!276788) b!462815))

(assert (= (and b!462815 res!276787) b!462816))

(assert (= (and b!462816 res!276786) b!462821))

(assert (= (and b!462821 res!276785) b!462817))

(assert (= (and b!462819 condMapEmpty!20503) mapIsEmpty!20503))

(assert (= (and b!462819 (not condMapEmpty!20503)) mapNonEmpty!20503))

(get-info :version)

(assert (= (and mapNonEmpty!20503 ((_ is ValueCellFull!5933) mapValue!20503)) b!462820))

(assert (= (and b!462819 ((_ is ValueCellFull!5933) mapDefault!20503)) b!462818))

(assert (= start!41432 b!462819))

(declare-fun m!445063 () Bool)

(assert (=> start!41432 m!445063))

(declare-fun m!445065 () Bool)

(assert (=> start!41432 m!445065))

(declare-fun m!445067 () Bool)

(assert (=> start!41432 m!445067))

(declare-fun m!445069 () Bool)

(assert (=> b!462817 m!445069))

(declare-fun m!445071 () Bool)

(assert (=> mapNonEmpty!20503 m!445071))

(declare-fun m!445073 () Bool)

(assert (=> b!462816 m!445073))

(declare-fun m!445075 () Bool)

(assert (=> b!462821 m!445075))

(check-sat (not mapNonEmpty!20503) b_and!19435 (not b!462816) (not start!41432) (not b!462821) (not b!462817) (not b_next!11125) tp_is_empty!12553)
(check-sat b_and!19435 (not b_next!11125))
