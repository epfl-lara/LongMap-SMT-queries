; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42214 () Bool)

(assert start!42214)

(declare-fun b_free!11733 () Bool)

(declare-fun b_next!11733 () Bool)

(assert (=> start!42214 (= b_free!11733 (not b_next!11733))))

(declare-fun tp!41223 () Bool)

(declare-fun b_and!20163 () Bool)

(assert (=> start!42214 (= tp!41223 b_and!20163)))

(declare-fun mapNonEmpty!21445 () Bool)

(declare-fun mapRes!21445 () Bool)

(declare-fun tp!41224 () Bool)

(declare-fun e!276106 () Bool)

(assert (=> mapNonEmpty!21445 (= mapRes!21445 (and tp!41224 e!276106))))

(declare-datatypes ((V!18653 0))(
  ( (V!18654 (val!6625 Int)) )
))
(declare-datatypes ((ValueCell!6237 0))(
  ( (ValueCellFull!6237 (v!8916 V!18653)) (EmptyCell!6237) )
))
(declare-datatypes ((array!30087 0))(
  ( (array!30088 (arr!14466 (Array (_ BitVec 32) ValueCell!6237)) (size!14818 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30087)

(declare-fun mapKey!21445 () (_ BitVec 32))

(declare-fun mapRest!21445 () (Array (_ BitVec 32) ValueCell!6237))

(declare-fun mapValue!21445 () ValueCell!6237)

(assert (=> mapNonEmpty!21445 (= (arr!14466 _values!833) (store mapRest!21445 mapKey!21445 mapValue!21445))))

(declare-fun b!471163 () Bool)

(declare-fun e!276108 () Bool)

(assert (=> b!471163 (= e!276108 (not true))))

(declare-datatypes ((tuple2!8724 0))(
  ( (tuple2!8725 (_1!4373 (_ BitVec 64)) (_2!4373 V!18653)) )
))
(declare-datatypes ((List!8804 0))(
  ( (Nil!8801) (Cons!8800 (h!9656 tuple2!8724) (t!14768 List!8804)) )
))
(declare-datatypes ((ListLongMap!7637 0))(
  ( (ListLongMap!7638 (toList!3834 List!8804)) )
))
(declare-fun lt!213767 () ListLongMap!7637)

(declare-fun lt!213769 () ListLongMap!7637)

(assert (=> b!471163 (= lt!213767 lt!213769)))

(declare-datatypes ((Unit!13827 0))(
  ( (Unit!13828) )
))
(declare-fun lt!213768 () Unit!13827)

(declare-fun minValueBefore!38 () V!18653)

(declare-fun zeroValue!794 () V!18653)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30089 0))(
  ( (array!30090 (arr!14467 (Array (_ BitVec 32) (_ BitVec 64))) (size!14819 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30089)

(declare-fun minValueAfter!38 () V!18653)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!177 (array!30089 array!30087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18653 V!18653 V!18653 V!18653 (_ BitVec 32) Int) Unit!13827)

(assert (=> b!471163 (= lt!213768 (lemmaNoChangeToArrayThenSameMapNoExtras!177 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1997 (array!30089 array!30087 (_ BitVec 32) (_ BitVec 32) V!18653 V!18653 (_ BitVec 32) Int) ListLongMap!7637)

(assert (=> b!471163 (= lt!213769 (getCurrentListMapNoExtraKeys!1997 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471163 (= lt!213767 (getCurrentListMapNoExtraKeys!1997 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471164 () Bool)

(declare-fun tp_is_empty!13161 () Bool)

(assert (=> b!471164 (= e!276106 tp_is_empty!13161)))

(declare-fun mapIsEmpty!21445 () Bool)

(assert (=> mapIsEmpty!21445 mapRes!21445))

(declare-fun b!471165 () Bool)

(declare-fun e!276107 () Bool)

(assert (=> b!471165 (= e!276107 tp_is_empty!13161)))

(declare-fun b!471166 () Bool)

(declare-fun e!276110 () Bool)

(assert (=> b!471166 (= e!276110 (and e!276107 mapRes!21445))))

(declare-fun condMapEmpty!21445 () Bool)

(declare-fun mapDefault!21445 () ValueCell!6237)

(assert (=> b!471166 (= condMapEmpty!21445 (= (arr!14466 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6237)) mapDefault!21445)))))

(declare-fun b!471167 () Bool)

(declare-fun res!281495 () Bool)

(assert (=> b!471167 (=> (not res!281495) (not e!276108))))

(declare-datatypes ((List!8805 0))(
  ( (Nil!8802) (Cons!8801 (h!9657 (_ BitVec 64)) (t!14769 List!8805)) )
))
(declare-fun arrayNoDuplicates!0 (array!30089 (_ BitVec 32) List!8805) Bool)

(assert (=> b!471167 (= res!281495 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8802))))

(declare-fun b!471168 () Bool)

(declare-fun res!281497 () Bool)

(assert (=> b!471168 (=> (not res!281497) (not e!276108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30089 (_ BitVec 32)) Bool)

(assert (=> b!471168 (= res!281497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471162 () Bool)

(declare-fun res!281496 () Bool)

(assert (=> b!471162 (=> (not res!281496) (not e!276108))))

(assert (=> b!471162 (= res!281496 (and (= (size!14818 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14819 _keys!1025) (size!14818 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281494 () Bool)

(assert (=> start!42214 (=> (not res!281494) (not e!276108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42214 (= res!281494 (validMask!0 mask!1365))))

(assert (=> start!42214 e!276108))

(assert (=> start!42214 tp_is_empty!13161))

(assert (=> start!42214 tp!41223))

(assert (=> start!42214 true))

(declare-fun array_inv!10434 (array!30089) Bool)

(assert (=> start!42214 (array_inv!10434 _keys!1025)))

(declare-fun array_inv!10435 (array!30087) Bool)

(assert (=> start!42214 (and (array_inv!10435 _values!833) e!276110)))

(assert (= (and start!42214 res!281494) b!471162))

(assert (= (and b!471162 res!281496) b!471168))

(assert (= (and b!471168 res!281497) b!471167))

(assert (= (and b!471167 res!281495) b!471163))

(assert (= (and b!471166 condMapEmpty!21445) mapIsEmpty!21445))

(assert (= (and b!471166 (not condMapEmpty!21445)) mapNonEmpty!21445))

(get-info :version)

(assert (= (and mapNonEmpty!21445 ((_ is ValueCellFull!6237) mapValue!21445)) b!471164))

(assert (= (and b!471166 ((_ is ValueCellFull!6237) mapDefault!21445)) b!471165))

(assert (= start!42214 b!471166))

(declare-fun m!453341 () Bool)

(assert (=> b!471167 m!453341))

(declare-fun m!453343 () Bool)

(assert (=> b!471168 m!453343))

(declare-fun m!453345 () Bool)

(assert (=> b!471163 m!453345))

(declare-fun m!453347 () Bool)

(assert (=> b!471163 m!453347))

(declare-fun m!453349 () Bool)

(assert (=> b!471163 m!453349))

(declare-fun m!453351 () Bool)

(assert (=> mapNonEmpty!21445 m!453351))

(declare-fun m!453353 () Bool)

(assert (=> start!42214 m!453353))

(declare-fun m!453355 () Bool)

(assert (=> start!42214 m!453355))

(declare-fun m!453357 () Bool)

(assert (=> start!42214 m!453357))

(check-sat (not b!471168) (not b!471167) tp_is_empty!13161 (not b!471163) (not start!42214) (not mapNonEmpty!21445) (not b_next!11733) b_and!20163)
(check-sat b_and!20163 (not b_next!11733))
