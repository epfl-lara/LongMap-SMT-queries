; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42210 () Bool)

(assert start!42210)

(declare-fun b_free!11743 () Bool)

(declare-fun b_next!11743 () Bool)

(assert (=> start!42210 (= b_free!11743 (not b_next!11743))))

(declare-fun tp!41253 () Bool)

(declare-fun b_and!20183 () Bool)

(assert (=> start!42210 (= tp!41253 b_and!20183)))

(declare-fun mapIsEmpty!21460 () Bool)

(declare-fun mapRes!21460 () Bool)

(assert (=> mapIsEmpty!21460 mapRes!21460))

(declare-fun b!471206 () Bool)

(declare-fun e!276144 () Bool)

(assert (=> b!471206 (= e!276144 (not true))))

(declare-datatypes ((V!18667 0))(
  ( (V!18668 (val!6630 Int)) )
))
(declare-datatypes ((tuple2!8654 0))(
  ( (tuple2!8655 (_1!4338 (_ BitVec 64)) (_2!4338 V!18667)) )
))
(declare-datatypes ((List!8723 0))(
  ( (Nil!8720) (Cons!8719 (h!9575 tuple2!8654) (t!14679 List!8723)) )
))
(declare-datatypes ((ListLongMap!7569 0))(
  ( (ListLongMap!7570 (toList!3800 List!8723)) )
))
(declare-fun lt!213825 () ListLongMap!7569)

(declare-fun lt!213824 () ListLongMap!7569)

(assert (=> b!471206 (= lt!213825 lt!213824)))

(declare-fun minValueBefore!38 () V!18667)

(declare-fun zeroValue!794 () V!18667)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13813 0))(
  ( (Unit!13814) )
))
(declare-fun lt!213826 () Unit!13813)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30092 0))(
  ( (array!30093 (arr!14468 (Array (_ BitVec 32) (_ BitVec 64))) (size!14820 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30092)

(declare-datatypes ((ValueCell!6242 0))(
  ( (ValueCellFull!6242 (v!8922 V!18667)) (EmptyCell!6242) )
))
(declare-datatypes ((array!30094 0))(
  ( (array!30095 (arr!14469 (Array (_ BitVec 32) ValueCell!6242)) (size!14821 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30094)

(declare-fun minValueAfter!38 () V!18667)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!175 (array!30092 array!30094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18667 V!18667 V!18667 V!18667 (_ BitVec 32) Int) Unit!13813)

(assert (=> b!471206 (= lt!213826 (lemmaNoChangeToArrayThenSameMapNoExtras!175 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2015 (array!30092 array!30094 (_ BitVec 32) (_ BitVec 32) V!18667 V!18667 (_ BitVec 32) Int) ListLongMap!7569)

(assert (=> b!471206 (= lt!213824 (getCurrentListMapNoExtraKeys!2015 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471206 (= lt!213825 (getCurrentListMapNoExtraKeys!2015 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471207 () Bool)

(declare-fun e!276145 () Bool)

(declare-fun tp_is_empty!13171 () Bool)

(assert (=> b!471207 (= e!276145 tp_is_empty!13171)))

(declare-fun b!471208 () Bool)

(declare-fun res!281549 () Bool)

(assert (=> b!471208 (=> (not res!281549) (not e!276144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30092 (_ BitVec 32)) Bool)

(assert (=> b!471208 (= res!281549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471209 () Bool)

(declare-fun res!281548 () Bool)

(assert (=> b!471209 (=> (not res!281548) (not e!276144))))

(declare-datatypes ((List!8724 0))(
  ( (Nil!8721) (Cons!8720 (h!9576 (_ BitVec 64)) (t!14680 List!8724)) )
))
(declare-fun arrayNoDuplicates!0 (array!30092 (_ BitVec 32) List!8724) Bool)

(assert (=> b!471209 (= res!281548 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8721))))

(declare-fun res!281547 () Bool)

(assert (=> start!42210 (=> (not res!281547) (not e!276144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42210 (= res!281547 (validMask!0 mask!1365))))

(assert (=> start!42210 e!276144))

(assert (=> start!42210 tp_is_empty!13171))

(assert (=> start!42210 tp!41253))

(assert (=> start!42210 true))

(declare-fun array_inv!10530 (array!30092) Bool)

(assert (=> start!42210 (array_inv!10530 _keys!1025)))

(declare-fun e!276142 () Bool)

(declare-fun array_inv!10531 (array!30094) Bool)

(assert (=> start!42210 (and (array_inv!10531 _values!833) e!276142)))

(declare-fun b!471210 () Bool)

(declare-fun e!276146 () Bool)

(assert (=> b!471210 (= e!276146 tp_is_empty!13171)))

(declare-fun mapNonEmpty!21460 () Bool)

(declare-fun tp!41254 () Bool)

(assert (=> mapNonEmpty!21460 (= mapRes!21460 (and tp!41254 e!276146))))

(declare-fun mapKey!21460 () (_ BitVec 32))

(declare-fun mapRest!21460 () (Array (_ BitVec 32) ValueCell!6242))

(declare-fun mapValue!21460 () ValueCell!6242)

(assert (=> mapNonEmpty!21460 (= (arr!14469 _values!833) (store mapRest!21460 mapKey!21460 mapValue!21460))))

(declare-fun b!471211 () Bool)

(assert (=> b!471211 (= e!276142 (and e!276145 mapRes!21460))))

(declare-fun condMapEmpty!21460 () Bool)

(declare-fun mapDefault!21460 () ValueCell!6242)

(assert (=> b!471211 (= condMapEmpty!21460 (= (arr!14469 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6242)) mapDefault!21460)))))

(declare-fun b!471212 () Bool)

(declare-fun res!281550 () Bool)

(assert (=> b!471212 (=> (not res!281550) (not e!276144))))

(assert (=> b!471212 (= res!281550 (and (= (size!14821 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14820 _keys!1025) (size!14821 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42210 res!281547) b!471212))

(assert (= (and b!471212 res!281550) b!471208))

(assert (= (and b!471208 res!281549) b!471209))

(assert (= (and b!471209 res!281548) b!471206))

(assert (= (and b!471211 condMapEmpty!21460) mapIsEmpty!21460))

(assert (= (and b!471211 (not condMapEmpty!21460)) mapNonEmpty!21460))

(get-info :version)

(assert (= (and mapNonEmpty!21460 ((_ is ValueCellFull!6242) mapValue!21460)) b!471210))

(assert (= (and b!471211 ((_ is ValueCellFull!6242) mapDefault!21460)) b!471207))

(assert (= start!42210 b!471211))

(declare-fun m!453613 () Bool)

(assert (=> mapNonEmpty!21460 m!453613))

(declare-fun m!453615 () Bool)

(assert (=> start!42210 m!453615))

(declare-fun m!453617 () Bool)

(assert (=> start!42210 m!453617))

(declare-fun m!453619 () Bool)

(assert (=> start!42210 m!453619))

(declare-fun m!453621 () Bool)

(assert (=> b!471209 m!453621))

(declare-fun m!453623 () Bool)

(assert (=> b!471206 m!453623))

(declare-fun m!453625 () Bool)

(assert (=> b!471206 m!453625))

(declare-fun m!453627 () Bool)

(assert (=> b!471206 m!453627))

(declare-fun m!453629 () Bool)

(assert (=> b!471208 m!453629))

(check-sat (not start!42210) (not b_next!11743) tp_is_empty!13171 (not b!471209) (not b!471206) (not b!471208) (not mapNonEmpty!21460) b_and!20183)
(check-sat b_and!20183 (not b_next!11743))
