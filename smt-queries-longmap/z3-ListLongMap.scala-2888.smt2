; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41444 () Bool)

(assert start!41444)

(declare-fun b_free!11137 () Bool)

(declare-fun b_next!11137 () Bool)

(assert (=> start!41444 (= b_free!11137 (not b_next!11137))))

(declare-fun tp!39406 () Bool)

(declare-fun b_and!19447 () Bool)

(assert (=> start!41444 (= tp!39406 b_and!19447)))

(declare-fun mapNonEmpty!20521 () Bool)

(declare-fun mapRes!20521 () Bool)

(declare-fun tp!39405 () Bool)

(declare-fun e!270255 () Bool)

(assert (=> mapNonEmpty!20521 (= mapRes!20521 (and tp!39405 e!270255))))

(declare-datatypes ((V!17859 0))(
  ( (V!17860 (val!6327 Int)) )
))
(declare-datatypes ((ValueCell!5939 0))(
  ( (ValueCellFull!5939 (v!8608 V!17859)) (EmptyCell!5939) )
))
(declare-datatypes ((array!28925 0))(
  ( (array!28926 (arr!13895 (Array (_ BitVec 32) ValueCell!5939)) (size!14248 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28925)

(declare-fun mapValue!20521 () ValueCell!5939)

(declare-fun mapRest!20521 () (Array (_ BitVec 32) ValueCell!5939))

(declare-fun mapKey!20521 () (_ BitVec 32))

(assert (=> mapNonEmpty!20521 (= (arr!13895 _values!833) (store mapRest!20521 mapKey!20521 mapValue!20521))))

(declare-fun b!462941 () Bool)

(declare-fun res!276857 () Bool)

(declare-fun e!270251 () Bool)

(assert (=> b!462941 (=> (not res!276857) (not e!270251))))

(declare-datatypes ((array!28927 0))(
  ( (array!28928 (arr!13896 (Array (_ BitVec 32) (_ BitVec 64))) (size!14249 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28927)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28927 (_ BitVec 32)) Bool)

(assert (=> b!462941 (= res!276857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462942 () Bool)

(declare-fun e!270252 () Bool)

(declare-fun tp_is_empty!12565 () Bool)

(assert (=> b!462942 (= e!270252 tp_is_empty!12565)))

(declare-fun b!462943 () Bool)

(declare-fun e!270253 () Bool)

(assert (=> b!462943 (= e!270253 (and e!270252 mapRes!20521))))

(declare-fun condMapEmpty!20521 () Bool)

(declare-fun mapDefault!20521 () ValueCell!5939)

(assert (=> b!462943 (= condMapEmpty!20521 (= (arr!13895 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5939)) mapDefault!20521)))))

(declare-fun b!462944 () Bool)

(declare-fun res!276859 () Bool)

(assert (=> b!462944 (=> (not res!276859) (not e!270251))))

(declare-datatypes ((List!8408 0))(
  ( (Nil!8405) (Cons!8404 (h!9260 (_ BitVec 64)) (t!14343 List!8408)) )
))
(declare-fun arrayNoDuplicates!0 (array!28927 (_ BitVec 32) List!8408) Bool)

(assert (=> b!462944 (= res!276859 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8405))))

(declare-fun res!276860 () Bool)

(assert (=> start!41444 (=> (not res!276860) (not e!270251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41444 (= res!276860 (validMask!0 mask!1365))))

(assert (=> start!41444 e!270251))

(assert (=> start!41444 tp_is_empty!12565))

(assert (=> start!41444 tp!39406))

(assert (=> start!41444 true))

(declare-fun array_inv!10112 (array!28927) Bool)

(assert (=> start!41444 (array_inv!10112 _keys!1025)))

(declare-fun array_inv!10113 (array!28925) Bool)

(assert (=> start!41444 (and (array_inv!10113 _values!833) e!270253)))

(declare-fun mapIsEmpty!20521 () Bool)

(assert (=> mapIsEmpty!20521 mapRes!20521))

(declare-fun b!462945 () Bool)

(assert (=> b!462945 (= e!270255 tp_is_empty!12565)))

(declare-fun b!462946 () Bool)

(declare-fun res!276858 () Bool)

(assert (=> b!462946 (=> (not res!276858) (not e!270251))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462946 (= res!276858 (and (= (size!14248 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14249 _keys!1025) (size!14248 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462947 () Bool)

(assert (=> b!462947 (= e!270251 false)))

(declare-fun minValueBefore!38 () V!17859)

(declare-fun zeroValue!794 () V!17859)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8322 0))(
  ( (tuple2!8323 (_1!4172 (_ BitVec 64)) (_2!4172 V!17859)) )
))
(declare-datatypes ((List!8409 0))(
  ( (Nil!8406) (Cons!8405 (h!9261 tuple2!8322) (t!14344 List!8409)) )
))
(declare-datatypes ((ListLongMap!7225 0))(
  ( (ListLongMap!7226 (toList!3628 List!8409)) )
))
(declare-fun lt!209087 () ListLongMap!7225)

(declare-fun getCurrentListMapNoExtraKeys!1820 (array!28927 array!28925 (_ BitVec 32) (_ BitVec 32) V!17859 V!17859 (_ BitVec 32) Int) ListLongMap!7225)

(assert (=> b!462947 (= lt!209087 (getCurrentListMapNoExtraKeys!1820 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41444 res!276860) b!462946))

(assert (= (and b!462946 res!276858) b!462941))

(assert (= (and b!462941 res!276857) b!462944))

(assert (= (and b!462944 res!276859) b!462947))

(assert (= (and b!462943 condMapEmpty!20521) mapIsEmpty!20521))

(assert (= (and b!462943 (not condMapEmpty!20521)) mapNonEmpty!20521))

(get-info :version)

(assert (= (and mapNonEmpty!20521 ((_ is ValueCellFull!5939) mapValue!20521)) b!462945))

(assert (= (and b!462943 ((_ is ValueCellFull!5939) mapDefault!20521)) b!462942))

(assert (= start!41444 b!462943))

(declare-fun m!445147 () Bool)

(assert (=> b!462941 m!445147))

(declare-fun m!445149 () Bool)

(assert (=> start!41444 m!445149))

(declare-fun m!445151 () Bool)

(assert (=> start!41444 m!445151))

(declare-fun m!445153 () Bool)

(assert (=> start!41444 m!445153))

(declare-fun m!445155 () Bool)

(assert (=> b!462944 m!445155))

(declare-fun m!445157 () Bool)

(assert (=> b!462947 m!445157))

(declare-fun m!445159 () Bool)

(assert (=> mapNonEmpty!20521 m!445159))

(check-sat (not b!462944) (not b!462941) (not b_next!11137) b_and!19447 (not start!41444) tp_is_empty!12565 (not b!462947) (not mapNonEmpty!20521))
(check-sat b_and!19447 (not b_next!11137))
