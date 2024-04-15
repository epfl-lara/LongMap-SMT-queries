; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41402 () Bool)

(assert start!41402)

(declare-fun b_free!11095 () Bool)

(declare-fun b_next!11095 () Bool)

(assert (=> start!41402 (= b_free!11095 (not b_next!11095))))

(declare-fun tp!39279 () Bool)

(declare-fun b_and!19405 () Bool)

(assert (=> start!41402 (= tp!39279 b_and!19405)))

(declare-fun res!276605 () Bool)

(declare-fun e!269937 () Bool)

(assert (=> start!41402 (=> (not res!276605) (not e!269937))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41402 (= res!276605 (validMask!0 mask!1365))))

(assert (=> start!41402 e!269937))

(declare-fun tp_is_empty!12523 () Bool)

(assert (=> start!41402 tp_is_empty!12523))

(assert (=> start!41402 tp!39279))

(assert (=> start!41402 true))

(declare-datatypes ((array!28841 0))(
  ( (array!28842 (arr!13853 (Array (_ BitVec 32) (_ BitVec 64))) (size!14206 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28841)

(declare-fun array_inv!10086 (array!28841) Bool)

(assert (=> start!41402 (array_inv!10086 _keys!1025)))

(declare-datatypes ((V!17803 0))(
  ( (V!17804 (val!6306 Int)) )
))
(declare-datatypes ((ValueCell!5918 0))(
  ( (ValueCellFull!5918 (v!8587 V!17803)) (EmptyCell!5918) )
))
(declare-datatypes ((array!28843 0))(
  ( (array!28844 (arr!13854 (Array (_ BitVec 32) ValueCell!5918)) (size!14207 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28843)

(declare-fun e!269936 () Bool)

(declare-fun array_inv!10087 (array!28843) Bool)

(assert (=> start!41402 (and (array_inv!10087 _values!833) e!269936)))

(declare-fun mapIsEmpty!20458 () Bool)

(declare-fun mapRes!20458 () Bool)

(assert (=> mapIsEmpty!20458 mapRes!20458))

(declare-fun b!462500 () Bool)

(declare-fun e!269938 () Bool)

(assert (=> b!462500 (= e!269936 (and e!269938 mapRes!20458))))

(declare-fun condMapEmpty!20458 () Bool)

(declare-fun mapDefault!20458 () ValueCell!5918)

(assert (=> b!462500 (= condMapEmpty!20458 (= (arr!13854 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5918)) mapDefault!20458)))))

(declare-fun mapNonEmpty!20458 () Bool)

(declare-fun tp!39280 () Bool)

(declare-fun e!269940 () Bool)

(assert (=> mapNonEmpty!20458 (= mapRes!20458 (and tp!39280 e!269940))))

(declare-fun mapKey!20458 () (_ BitVec 32))

(declare-fun mapValue!20458 () ValueCell!5918)

(declare-fun mapRest!20458 () (Array (_ BitVec 32) ValueCell!5918))

(assert (=> mapNonEmpty!20458 (= (arr!13854 _values!833) (store mapRest!20458 mapKey!20458 mapValue!20458))))

(declare-fun b!462501 () Bool)

(declare-fun res!276608 () Bool)

(assert (=> b!462501 (=> (not res!276608) (not e!269937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28841 (_ BitVec 32)) Bool)

(assert (=> b!462501 (= res!276608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462502 () Bool)

(assert (=> b!462502 (= e!269938 tp_is_empty!12523)))

(declare-fun b!462503 () Bool)

(assert (=> b!462503 (= e!269940 tp_is_empty!12523)))

(declare-fun b!462504 () Bool)

(declare-fun res!276607 () Bool)

(assert (=> b!462504 (=> (not res!276607) (not e!269937))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462504 (= res!276607 (and (= (size!14207 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14206 _keys!1025) (size!14207 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462505 () Bool)

(declare-fun res!276606 () Bool)

(assert (=> b!462505 (=> (not res!276606) (not e!269937))))

(declare-datatypes ((List!8377 0))(
  ( (Nil!8374) (Cons!8373 (h!9229 (_ BitVec 64)) (t!14312 List!8377)) )
))
(declare-fun arrayNoDuplicates!0 (array!28841 (_ BitVec 32) List!8377) Bool)

(assert (=> b!462505 (= res!276606 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8374))))

(declare-fun b!462506 () Bool)

(assert (=> b!462506 (= e!269937 false)))

(declare-fun zeroValue!794 () V!17803)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!17803)

(declare-datatypes ((tuple2!8290 0))(
  ( (tuple2!8291 (_1!4156 (_ BitVec 64)) (_2!4156 V!17803)) )
))
(declare-datatypes ((List!8378 0))(
  ( (Nil!8375) (Cons!8374 (h!9230 tuple2!8290) (t!14313 List!8378)) )
))
(declare-datatypes ((ListLongMap!7193 0))(
  ( (ListLongMap!7194 (toList!3612 List!8378)) )
))
(declare-fun lt!209024 () ListLongMap!7193)

(declare-fun getCurrentListMapNoExtraKeys!1804 (array!28841 array!28843 (_ BitVec 32) (_ BitVec 32) V!17803 V!17803 (_ BitVec 32) Int) ListLongMap!7193)

(assert (=> b!462506 (= lt!209024 (getCurrentListMapNoExtraKeys!1804 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41402 res!276605) b!462504))

(assert (= (and b!462504 res!276607) b!462501))

(assert (= (and b!462501 res!276608) b!462505))

(assert (= (and b!462505 res!276606) b!462506))

(assert (= (and b!462500 condMapEmpty!20458) mapIsEmpty!20458))

(assert (= (and b!462500 (not condMapEmpty!20458)) mapNonEmpty!20458))

(get-info :version)

(assert (= (and mapNonEmpty!20458 ((_ is ValueCellFull!5918) mapValue!20458)) b!462503))

(assert (= (and b!462500 ((_ is ValueCellFull!5918) mapDefault!20458)) b!462502))

(assert (= start!41402 b!462500))

(declare-fun m!444853 () Bool)

(assert (=> mapNonEmpty!20458 m!444853))

(declare-fun m!444855 () Bool)

(assert (=> b!462506 m!444855))

(declare-fun m!444857 () Bool)

(assert (=> b!462501 m!444857))

(declare-fun m!444859 () Bool)

(assert (=> start!41402 m!444859))

(declare-fun m!444861 () Bool)

(assert (=> start!41402 m!444861))

(declare-fun m!444863 () Bool)

(assert (=> start!41402 m!444863))

(declare-fun m!444865 () Bool)

(assert (=> b!462505 m!444865))

(check-sat (not b!462506) (not b!462505) (not start!41402) b_and!19405 (not b!462501) tp_is_empty!12523 (not mapNonEmpty!20458) (not b_next!11095))
(check-sat b_and!19405 (not b_next!11095))
