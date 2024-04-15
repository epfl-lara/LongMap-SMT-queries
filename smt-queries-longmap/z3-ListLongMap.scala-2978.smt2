; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42130 () Bool)

(assert start!42130)

(declare-fun b_free!11677 () Bool)

(declare-fun b_next!11677 () Bool)

(assert (=> start!42130 (= b_free!11677 (not b_next!11677))))

(declare-fun tp!41052 () Bool)

(declare-fun b_and!20073 () Bool)

(assert (=> start!42130 (= tp!41052 b_and!20073)))

(declare-fun b!470218 () Bool)

(declare-fun e!275458 () Bool)

(declare-fun e!275461 () Bool)

(declare-fun mapRes!21358 () Bool)

(assert (=> b!470218 (= e!275458 (and e!275461 mapRes!21358))))

(declare-fun condMapEmpty!21358 () Bool)

(declare-datatypes ((V!18579 0))(
  ( (V!18580 (val!6597 Int)) )
))
(declare-datatypes ((ValueCell!6209 0))(
  ( (ValueCellFull!6209 (v!8882 V!18579)) (EmptyCell!6209) )
))
(declare-datatypes ((array!29961 0))(
  ( (array!29962 (arr!14404 (Array (_ BitVec 32) ValueCell!6209)) (size!14757 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29961)

(declare-fun mapDefault!21358 () ValueCell!6209)

(assert (=> b!470218 (= condMapEmpty!21358 (= (arr!14404 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6209)) mapDefault!21358)))))

(declare-fun b!470219 () Bool)

(declare-fun res!281000 () Bool)

(declare-fun e!275457 () Bool)

(assert (=> b!470219 (=> (not res!281000) (not e!275457))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29963 0))(
  ( (array!29964 (arr!14405 (Array (_ BitVec 32) (_ BitVec 64))) (size!14758 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29963)

(assert (=> b!470219 (= res!281000 (and (= (size!14757 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14758 _keys!1025) (size!14757 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470220 () Bool)

(declare-fun tp_is_empty!13105 () Bool)

(assert (=> b!470220 (= e!275461 tp_is_empty!13105)))

(declare-fun b!470221 () Bool)

(declare-fun e!275459 () Bool)

(assert (=> b!470221 (= e!275459 tp_is_empty!13105)))

(declare-fun res!280998 () Bool)

(assert (=> start!42130 (=> (not res!280998) (not e!275457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42130 (= res!280998 (validMask!0 mask!1365))))

(assert (=> start!42130 e!275457))

(assert (=> start!42130 tp_is_empty!13105))

(assert (=> start!42130 tp!41052))

(assert (=> start!42130 true))

(declare-fun array_inv!10476 (array!29963) Bool)

(assert (=> start!42130 (array_inv!10476 _keys!1025)))

(declare-fun array_inv!10477 (array!29961) Bool)

(assert (=> start!42130 (and (array_inv!10477 _values!833) e!275458)))

(declare-fun mapNonEmpty!21358 () Bool)

(declare-fun tp!41053 () Bool)

(assert (=> mapNonEmpty!21358 (= mapRes!21358 (and tp!41053 e!275459))))

(declare-fun mapValue!21358 () ValueCell!6209)

(declare-fun mapKey!21358 () (_ BitVec 32))

(declare-fun mapRest!21358 () (Array (_ BitVec 32) ValueCell!6209))

(assert (=> mapNonEmpty!21358 (= (arr!14404 _values!833) (store mapRest!21358 mapKey!21358 mapValue!21358))))

(declare-fun mapIsEmpty!21358 () Bool)

(assert (=> mapIsEmpty!21358 mapRes!21358))

(declare-fun b!470222 () Bool)

(declare-fun res!280999 () Bool)

(assert (=> b!470222 (=> (not res!280999) (not e!275457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29963 (_ BitVec 32)) Bool)

(assert (=> b!470222 (= res!280999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470223 () Bool)

(declare-fun res!281001 () Bool)

(assert (=> b!470223 (=> (not res!281001) (not e!275457))))

(declare-datatypes ((List!8793 0))(
  ( (Nil!8790) (Cons!8789 (h!9645 (_ BitVec 64)) (t!14746 List!8793)) )
))
(declare-fun arrayNoDuplicates!0 (array!29963 (_ BitVec 32) List!8793) Bool)

(assert (=> b!470223 (= res!281001 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8790))))

(declare-fun b!470224 () Bool)

(assert (=> b!470224 (= e!275457 (not true))))

(declare-datatypes ((tuple2!8724 0))(
  ( (tuple2!8725 (_1!4373 (_ BitVec 64)) (_2!4373 V!18579)) )
))
(declare-datatypes ((List!8794 0))(
  ( (Nil!8791) (Cons!8790 (h!9646 tuple2!8724) (t!14747 List!8794)) )
))
(declare-datatypes ((ListLongMap!7627 0))(
  ( (ListLongMap!7628 (toList!3829 List!8794)) )
))
(declare-fun lt!213242 () ListLongMap!7627)

(declare-fun lt!213243 () ListLongMap!7627)

(assert (=> b!470224 (= lt!213242 lt!213243)))

(declare-fun minValueBefore!38 () V!18579)

(declare-fun zeroValue!794 () V!18579)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13759 0))(
  ( (Unit!13760) )
))
(declare-fun lt!213241 () Unit!13759)

(declare-fun minValueAfter!38 () V!18579)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!161 (array!29963 array!29961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18579 V!18579 V!18579 V!18579 (_ BitVec 32) Int) Unit!13759)

(assert (=> b!470224 (= lt!213241 (lemmaNoChangeToArrayThenSameMapNoExtras!161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2004 (array!29963 array!29961 (_ BitVec 32) (_ BitVec 32) V!18579 V!18579 (_ BitVec 32) Int) ListLongMap!7627)

(assert (=> b!470224 (= lt!213243 (getCurrentListMapNoExtraKeys!2004 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470224 (= lt!213242 (getCurrentListMapNoExtraKeys!2004 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42130 res!280998) b!470219))

(assert (= (and b!470219 res!281000) b!470222))

(assert (= (and b!470222 res!280999) b!470223))

(assert (= (and b!470223 res!281001) b!470224))

(assert (= (and b!470218 condMapEmpty!21358) mapIsEmpty!21358))

(assert (= (and b!470218 (not condMapEmpty!21358)) mapNonEmpty!21358))

(get-info :version)

(assert (= (and mapNonEmpty!21358 ((_ is ValueCellFull!6209) mapValue!21358)) b!470221))

(assert (= (and b!470218 ((_ is ValueCellFull!6209) mapDefault!21358)) b!470220))

(assert (= start!42130 b!470218))

(declare-fun m!452037 () Bool)

(assert (=> b!470223 m!452037))

(declare-fun m!452039 () Bool)

(assert (=> b!470224 m!452039))

(declare-fun m!452041 () Bool)

(assert (=> b!470224 m!452041))

(declare-fun m!452043 () Bool)

(assert (=> b!470224 m!452043))

(declare-fun m!452045 () Bool)

(assert (=> mapNonEmpty!21358 m!452045))

(declare-fun m!452047 () Bool)

(assert (=> start!42130 m!452047))

(declare-fun m!452049 () Bool)

(assert (=> start!42130 m!452049))

(declare-fun m!452051 () Bool)

(assert (=> start!42130 m!452051))

(declare-fun m!452053 () Bool)

(assert (=> b!470222 m!452053))

(check-sat (not start!42130) tp_is_empty!13105 (not b!470222) (not b!470223) b_and!20073 (not b_next!11677) (not b!470224) (not mapNonEmpty!21358))
(check-sat b_and!20073 (not b_next!11677))
