; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42276 () Bool)

(assert start!42276)

(declare-fun b_free!11781 () Bool)

(declare-fun b_next!11781 () Bool)

(assert (=> start!42276 (= b_free!11781 (not b_next!11781))))

(declare-fun tp!41371 () Bool)

(declare-fun b_and!20219 () Bool)

(assert (=> start!42276 (= tp!41371 b_and!20219)))

(declare-fun b!471751 () Bool)

(declare-fun e!276524 () Bool)

(declare-fun tp_is_empty!13209 () Bool)

(assert (=> b!471751 (= e!276524 tp_is_empty!13209)))

(declare-fun mapIsEmpty!21520 () Bool)

(declare-fun mapRes!21520 () Bool)

(assert (=> mapIsEmpty!21520 mapRes!21520))

(declare-fun b!471752 () Bool)

(declare-fun res!281813 () Bool)

(declare-fun e!276522 () Bool)

(assert (=> b!471752 (=> (not res!281813) (not e!276522))))

(declare-datatypes ((array!30179 0))(
  ( (array!30180 (arr!14511 (Array (_ BitVec 32) (_ BitVec 64))) (size!14863 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30179)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30179 (_ BitVec 32)) Bool)

(assert (=> b!471752 (= res!281813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471753 () Bool)

(declare-fun e!276525 () Bool)

(assert (=> b!471753 (= e!276525 tp_is_empty!13209)))

(declare-fun res!281816 () Bool)

(assert (=> start!42276 (=> (not res!281816) (not e!276522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42276 (= res!281816 (validMask!0 mask!1365))))

(assert (=> start!42276 e!276522))

(assert (=> start!42276 tp_is_empty!13209))

(assert (=> start!42276 tp!41371))

(assert (=> start!42276 true))

(declare-fun array_inv!10460 (array!30179) Bool)

(assert (=> start!42276 (array_inv!10460 _keys!1025)))

(declare-datatypes ((V!18717 0))(
  ( (V!18718 (val!6649 Int)) )
))
(declare-datatypes ((ValueCell!6261 0))(
  ( (ValueCellFull!6261 (v!8940 V!18717)) (EmptyCell!6261) )
))
(declare-datatypes ((array!30181 0))(
  ( (array!30182 (arr!14512 (Array (_ BitVec 32) ValueCell!6261)) (size!14864 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30181)

(declare-fun e!276523 () Bool)

(declare-fun array_inv!10461 (array!30181) Bool)

(assert (=> start!42276 (and (array_inv!10461 _values!833) e!276523)))

(declare-fun mapNonEmpty!21520 () Bool)

(declare-fun tp!41370 () Bool)

(assert (=> mapNonEmpty!21520 (= mapRes!21520 (and tp!41370 e!276524))))

(declare-fun mapRest!21520 () (Array (_ BitVec 32) ValueCell!6261))

(declare-fun mapValue!21520 () ValueCell!6261)

(declare-fun mapKey!21520 () (_ BitVec 32))

(assert (=> mapNonEmpty!21520 (= (arr!14512 _values!833) (store mapRest!21520 mapKey!21520 mapValue!21520))))

(declare-fun b!471754 () Bool)

(assert (=> b!471754 (= e!276523 (and e!276525 mapRes!21520))))

(declare-fun condMapEmpty!21520 () Bool)

(declare-fun mapDefault!21520 () ValueCell!6261)

(assert (=> b!471754 (= condMapEmpty!21520 (= (arr!14512 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6261)) mapDefault!21520)))))

(declare-fun b!471755 () Bool)

(declare-fun res!281815 () Bool)

(assert (=> b!471755 (=> (not res!281815) (not e!276522))))

(declare-datatypes ((List!8835 0))(
  ( (Nil!8832) (Cons!8831 (h!9687 (_ BitVec 64)) (t!14801 List!8835)) )
))
(declare-fun arrayNoDuplicates!0 (array!30179 (_ BitVec 32) List!8835) Bool)

(assert (=> b!471755 (= res!281815 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8832))))

(declare-fun b!471756 () Bool)

(declare-fun res!281814 () Bool)

(assert (=> b!471756 (=> (not res!281814) (not e!276522))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471756 (= res!281814 (and (= (size!14864 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14863 _keys!1025) (size!14864 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471757 () Bool)

(assert (=> b!471757 (= e!276522 (not true))))

(declare-datatypes ((tuple2!8752 0))(
  ( (tuple2!8753 (_1!4387 (_ BitVec 64)) (_2!4387 V!18717)) )
))
(declare-datatypes ((List!8836 0))(
  ( (Nil!8833) (Cons!8832 (h!9688 tuple2!8752) (t!14802 List!8836)) )
))
(declare-datatypes ((ListLongMap!7665 0))(
  ( (ListLongMap!7666 (toList!3848 List!8836)) )
))
(declare-fun lt!214023 () ListLongMap!7665)

(declare-fun lt!214025 () ListLongMap!7665)

(assert (=> b!471757 (= lt!214023 lt!214025)))

(declare-fun minValueBefore!38 () V!18717)

(declare-fun zeroValue!794 () V!18717)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18717)

(declare-datatypes ((Unit!13855 0))(
  ( (Unit!13856) )
))
(declare-fun lt!214024 () Unit!13855)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!191 (array!30179 array!30181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18717 V!18717 V!18717 V!18717 (_ BitVec 32) Int) Unit!13855)

(assert (=> b!471757 (= lt!214024 (lemmaNoChangeToArrayThenSameMapNoExtras!191 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2011 (array!30179 array!30181 (_ BitVec 32) (_ BitVec 32) V!18717 V!18717 (_ BitVec 32) Int) ListLongMap!7665)

(assert (=> b!471757 (= lt!214025 (getCurrentListMapNoExtraKeys!2011 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471757 (= lt!214023 (getCurrentListMapNoExtraKeys!2011 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42276 res!281816) b!471756))

(assert (= (and b!471756 res!281814) b!471752))

(assert (= (and b!471752 res!281813) b!471755))

(assert (= (and b!471755 res!281815) b!471757))

(assert (= (and b!471754 condMapEmpty!21520) mapIsEmpty!21520))

(assert (= (and b!471754 (not condMapEmpty!21520)) mapNonEmpty!21520))

(get-info :version)

(assert (= (and mapNonEmpty!21520 ((_ is ValueCellFull!6261) mapValue!21520)) b!471751))

(assert (= (and b!471754 ((_ is ValueCellFull!6261) mapDefault!21520)) b!471753))

(assert (= start!42276 b!471754))

(declare-fun m!453839 () Bool)

(assert (=> b!471755 m!453839))

(declare-fun m!453841 () Bool)

(assert (=> start!42276 m!453841))

(declare-fun m!453843 () Bool)

(assert (=> start!42276 m!453843))

(declare-fun m!453845 () Bool)

(assert (=> start!42276 m!453845))

(declare-fun m!453847 () Bool)

(assert (=> b!471757 m!453847))

(declare-fun m!453849 () Bool)

(assert (=> b!471757 m!453849))

(declare-fun m!453851 () Bool)

(assert (=> b!471757 m!453851))

(declare-fun m!453853 () Bool)

(assert (=> mapNonEmpty!21520 m!453853))

(declare-fun m!453855 () Bool)

(assert (=> b!471752 m!453855))

(check-sat (not start!42276) b_and!20219 (not b!471757) (not mapNonEmpty!21520) tp_is_empty!13209 (not b_next!11781) (not b!471755) (not b!471752))
(check-sat b_and!20219 (not b_next!11781))
