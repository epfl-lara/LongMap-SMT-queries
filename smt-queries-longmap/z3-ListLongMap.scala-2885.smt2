; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41426 () Bool)

(assert start!41426)

(declare-fun b_free!11119 () Bool)

(declare-fun b_next!11119 () Bool)

(assert (=> start!41426 (= b_free!11119 (not b_next!11119))))

(declare-fun tp!39351 () Bool)

(declare-fun b_and!19465 () Bool)

(assert (=> start!41426 (= tp!39351 b_and!19465)))

(declare-fun b!462962 () Bool)

(declare-fun e!270254 () Bool)

(assert (=> b!462962 (= e!270254 false)))

(declare-datatypes ((V!17835 0))(
  ( (V!17836 (val!6318 Int)) )
))
(declare-fun minValueBefore!38 () V!17835)

(declare-fun zeroValue!794 () V!17835)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8214 0))(
  ( (tuple2!8215 (_1!4118 (_ BitVec 64)) (_2!4118 V!17835)) )
))
(declare-datatypes ((List!8295 0))(
  ( (Nil!8292) (Cons!8291 (h!9147 tuple2!8214) (t!14231 List!8295)) )
))
(declare-datatypes ((ListLongMap!7129 0))(
  ( (ListLongMap!7130 (toList!3580 List!8295)) )
))
(declare-fun lt!209306 () ListLongMap!7129)

(declare-datatypes ((array!28890 0))(
  ( (array!28891 (arr!13877 (Array (_ BitVec 32) (_ BitVec 64))) (size!14229 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28890)

(declare-datatypes ((ValueCell!5930 0))(
  ( (ValueCellFull!5930 (v!8606 V!17835)) (EmptyCell!5930) )
))
(declare-datatypes ((array!28892 0))(
  ( (array!28893 (arr!13878 (Array (_ BitVec 32) ValueCell!5930)) (size!14230 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28892)

(declare-fun getCurrentListMapNoExtraKeys!1807 (array!28890 array!28892 (_ BitVec 32) (_ BitVec 32) V!17835 V!17835 (_ BitVec 32) Int) ListLongMap!7129)

(assert (=> b!462962 (= lt!209306 (getCurrentListMapNoExtraKeys!1807 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462964 () Bool)

(declare-fun res!276872 () Bool)

(assert (=> b!462964 (=> (not res!276872) (not e!270254))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462964 (= res!276872 (and (= (size!14230 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14229 _keys!1025) (size!14230 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20494 () Bool)

(declare-fun mapRes!20494 () Bool)

(assert (=> mapIsEmpty!20494 mapRes!20494))

(declare-fun mapNonEmpty!20494 () Bool)

(declare-fun tp!39352 () Bool)

(declare-fun e!270253 () Bool)

(assert (=> mapNonEmpty!20494 (= mapRes!20494 (and tp!39352 e!270253))))

(declare-fun mapKey!20494 () (_ BitVec 32))

(declare-fun mapRest!20494 () (Array (_ BitVec 32) ValueCell!5930))

(declare-fun mapValue!20494 () ValueCell!5930)

(assert (=> mapNonEmpty!20494 (= (arr!13878 _values!833) (store mapRest!20494 mapKey!20494 mapValue!20494))))

(declare-fun b!462965 () Bool)

(declare-fun tp_is_empty!12547 () Bool)

(assert (=> b!462965 (= e!270253 tp_is_empty!12547)))

(declare-fun b!462966 () Bool)

(declare-fun res!276873 () Bool)

(assert (=> b!462966 (=> (not res!276873) (not e!270254))))

(declare-datatypes ((List!8296 0))(
  ( (Nil!8293) (Cons!8292 (h!9148 (_ BitVec 64)) (t!14232 List!8296)) )
))
(declare-fun arrayNoDuplicates!0 (array!28890 (_ BitVec 32) List!8296) Bool)

(assert (=> b!462966 (= res!276873 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8293))))

(declare-fun res!276874 () Bool)

(assert (=> start!41426 (=> (not res!276874) (not e!270254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41426 (= res!276874 (validMask!0 mask!1365))))

(assert (=> start!41426 e!270254))

(assert (=> start!41426 tp_is_empty!12547))

(assert (=> start!41426 tp!39351))

(assert (=> start!41426 true))

(declare-fun array_inv!10114 (array!28890) Bool)

(assert (=> start!41426 (array_inv!10114 _keys!1025)))

(declare-fun e!270252 () Bool)

(declare-fun array_inv!10115 (array!28892) Bool)

(assert (=> start!41426 (and (array_inv!10115 _values!833) e!270252)))

(declare-fun b!462963 () Bool)

(declare-fun e!270251 () Bool)

(assert (=> b!462963 (= e!270251 tp_is_empty!12547)))

(declare-fun b!462967 () Bool)

(assert (=> b!462967 (= e!270252 (and e!270251 mapRes!20494))))

(declare-fun condMapEmpty!20494 () Bool)

(declare-fun mapDefault!20494 () ValueCell!5930)

(assert (=> b!462967 (= condMapEmpty!20494 (= (arr!13878 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5930)) mapDefault!20494)))))

(declare-fun b!462968 () Bool)

(declare-fun res!276871 () Bool)

(assert (=> b!462968 (=> (not res!276871) (not e!270254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28890 (_ BitVec 32)) Bool)

(assert (=> b!462968 (= res!276871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41426 res!276874) b!462964))

(assert (= (and b!462964 res!276872) b!462968))

(assert (= (and b!462968 res!276871) b!462966))

(assert (= (and b!462966 res!276873) b!462962))

(assert (= (and b!462967 condMapEmpty!20494) mapIsEmpty!20494))

(assert (= (and b!462967 (not condMapEmpty!20494)) mapNonEmpty!20494))

(get-info :version)

(assert (= (and mapNonEmpty!20494 ((_ is ValueCellFull!5930) mapValue!20494)) b!462965))

(assert (= (and b!462967 ((_ is ValueCellFull!5930) mapDefault!20494)) b!462963))

(assert (= start!41426 b!462967))

(declare-fun m!445937 () Bool)

(assert (=> b!462966 m!445937))

(declare-fun m!445939 () Bool)

(assert (=> b!462962 m!445939))

(declare-fun m!445941 () Bool)

(assert (=> b!462968 m!445941))

(declare-fun m!445943 () Bool)

(assert (=> mapNonEmpty!20494 m!445943))

(declare-fun m!445945 () Bool)

(assert (=> start!41426 m!445945))

(declare-fun m!445947 () Bool)

(assert (=> start!41426 m!445947))

(declare-fun m!445949 () Bool)

(assert (=> start!41426 m!445949))

(check-sat b_and!19465 (not b!462966) (not start!41426) tp_is_empty!12547 (not mapNonEmpty!20494) (not b_next!11119) (not b!462968) (not b!462962))
(check-sat b_and!19465 (not b_next!11119))
