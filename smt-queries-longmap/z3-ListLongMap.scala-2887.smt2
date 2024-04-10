; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41454 () Bool)

(assert start!41454)

(declare-fun b_free!11133 () Bool)

(declare-fun b_next!11133 () Bool)

(assert (=> start!41454 (= b_free!11133 (not b_next!11133))))

(declare-fun tp!39394 () Bool)

(declare-fun b_and!19469 () Bool)

(assert (=> start!41454 (= tp!39394 b_and!19469)))

(declare-fun b!463170 () Bool)

(declare-fun e!270396 () Bool)

(assert (=> b!463170 (= e!270396 false)))

(declare-datatypes ((V!17853 0))(
  ( (V!17854 (val!6325 Int)) )
))
(declare-fun minValueBefore!38 () V!17853)

(declare-fun zeroValue!794 () V!17853)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8284 0))(
  ( (tuple2!8285 (_1!4153 (_ BitVec 64)) (_2!4153 V!17853)) )
))
(declare-datatypes ((List!8376 0))(
  ( (Nil!8373) (Cons!8372 (h!9228 tuple2!8284) (t!14320 List!8376)) )
))
(declare-datatypes ((ListLongMap!7197 0))(
  ( (ListLongMap!7198 (toList!3614 List!8376)) )
))
(declare-fun lt!209315 () ListLongMap!7197)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!28917 0))(
  ( (array!28918 (arr!13891 (Array (_ BitVec 32) (_ BitVec 64))) (size!14243 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28917)

(declare-datatypes ((ValueCell!5937 0))(
  ( (ValueCellFull!5937 (v!8612 V!17853)) (EmptyCell!5937) )
))
(declare-datatypes ((array!28919 0))(
  ( (array!28920 (arr!13892 (Array (_ BitVec 32) ValueCell!5937)) (size!14244 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28919)

(declare-fun getCurrentListMapNoExtraKeys!1794 (array!28917 array!28919 (_ BitVec 32) (_ BitVec 32) V!17853 V!17853 (_ BitVec 32) Int) ListLongMap!7197)

(assert (=> b!463170 (= lt!209315 (getCurrentListMapNoExtraKeys!1794 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463171 () Bool)

(declare-fun e!270395 () Bool)

(declare-fun tp_is_empty!12561 () Bool)

(assert (=> b!463171 (= e!270395 tp_is_empty!12561)))

(declare-fun mapNonEmpty!20515 () Bool)

(declare-fun mapRes!20515 () Bool)

(declare-fun tp!39393 () Bool)

(assert (=> mapNonEmpty!20515 (= mapRes!20515 (and tp!39393 e!270395))))

(declare-fun mapKey!20515 () (_ BitVec 32))

(declare-fun mapRest!20515 () (Array (_ BitVec 32) ValueCell!5937))

(declare-fun mapValue!20515 () ValueCell!5937)

(assert (=> mapNonEmpty!20515 (= (arr!13892 _values!833) (store mapRest!20515 mapKey!20515 mapValue!20515))))

(declare-fun b!463172 () Bool)

(declare-fun res!276962 () Bool)

(assert (=> b!463172 (=> (not res!276962) (not e!270396))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463172 (= res!276962 (and (= (size!14244 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14243 _keys!1025) (size!14244 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463173 () Bool)

(declare-fun e!270397 () Bool)

(declare-fun e!270399 () Bool)

(assert (=> b!463173 (= e!270397 (and e!270399 mapRes!20515))))

(declare-fun condMapEmpty!20515 () Bool)

(declare-fun mapDefault!20515 () ValueCell!5937)

(assert (=> b!463173 (= condMapEmpty!20515 (= (arr!13892 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5937)) mapDefault!20515)))))

(declare-fun b!463174 () Bool)

(declare-fun res!276965 () Bool)

(assert (=> b!463174 (=> (not res!276965) (not e!270396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28917 (_ BitVec 32)) Bool)

(assert (=> b!463174 (= res!276965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463175 () Bool)

(assert (=> b!463175 (= e!270399 tp_is_empty!12561)))

(declare-fun res!276964 () Bool)

(assert (=> start!41454 (=> (not res!276964) (not e!270396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41454 (= res!276964 (validMask!0 mask!1365))))

(assert (=> start!41454 e!270396))

(assert (=> start!41454 tp_is_empty!12561))

(assert (=> start!41454 tp!39394))

(assert (=> start!41454 true))

(declare-fun array_inv!10042 (array!28917) Bool)

(assert (=> start!41454 (array_inv!10042 _keys!1025)))

(declare-fun array_inv!10043 (array!28919) Bool)

(assert (=> start!41454 (and (array_inv!10043 _values!833) e!270397)))

(declare-fun b!463176 () Bool)

(declare-fun res!276963 () Bool)

(assert (=> b!463176 (=> (not res!276963) (not e!270396))))

(declare-datatypes ((List!8377 0))(
  ( (Nil!8374) (Cons!8373 (h!9229 (_ BitVec 64)) (t!14321 List!8377)) )
))
(declare-fun arrayNoDuplicates!0 (array!28917 (_ BitVec 32) List!8377) Bool)

(assert (=> b!463176 (= res!276963 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8374))))

(declare-fun mapIsEmpty!20515 () Bool)

(assert (=> mapIsEmpty!20515 mapRes!20515))

(assert (= (and start!41454 res!276964) b!463172))

(assert (= (and b!463172 res!276962) b!463174))

(assert (= (and b!463174 res!276965) b!463176))

(assert (= (and b!463176 res!276963) b!463170))

(assert (= (and b!463173 condMapEmpty!20515) mapIsEmpty!20515))

(assert (= (and b!463173 (not condMapEmpty!20515)) mapNonEmpty!20515))

(get-info :version)

(assert (= (and mapNonEmpty!20515 ((_ is ValueCellFull!5937) mapValue!20515)) b!463171))

(assert (= (and b!463173 ((_ is ValueCellFull!5937) mapDefault!20515)) b!463175))

(assert (= start!41454 b!463173))

(declare-fun m!445853 () Bool)

(assert (=> b!463176 m!445853))

(declare-fun m!445855 () Bool)

(assert (=> b!463174 m!445855))

(declare-fun m!445857 () Bool)

(assert (=> mapNonEmpty!20515 m!445857))

(declare-fun m!445859 () Bool)

(assert (=> b!463170 m!445859))

(declare-fun m!445861 () Bool)

(assert (=> start!41454 m!445861))

(declare-fun m!445863 () Bool)

(assert (=> start!41454 m!445863))

(declare-fun m!445865 () Bool)

(assert (=> start!41454 m!445865))

(check-sat (not mapNonEmpty!20515) b_and!19469 tp_is_empty!12561 (not b!463176) (not start!41454) (not b_next!11133) (not b!463174) (not b!463170))
(check-sat b_and!19469 (not b_next!11133))
