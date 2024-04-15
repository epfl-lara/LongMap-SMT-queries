; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42278 () Bool)

(assert start!42278)

(declare-fun b_free!11797 () Bool)

(declare-fun b_next!11797 () Bool)

(assert (=> start!42278 (= b_free!11797 (not b_next!11797))))

(declare-fun tp!41419 () Bool)

(declare-fun b_and!20209 () Bool)

(assert (=> start!42278 (= tp!41419 b_and!20209)))

(declare-fun mapNonEmpty!21544 () Bool)

(declare-fun mapRes!21544 () Bool)

(declare-fun tp!41418 () Bool)

(declare-fun e!276468 () Bool)

(assert (=> mapNonEmpty!21544 (= mapRes!21544 (and tp!41418 e!276468))))

(declare-datatypes ((V!18739 0))(
  ( (V!18740 (val!6657 Int)) )
))
(declare-datatypes ((ValueCell!6269 0))(
  ( (ValueCellFull!6269 (v!8942 V!18739)) (EmptyCell!6269) )
))
(declare-datatypes ((array!30195 0))(
  ( (array!30196 (arr!14519 (Array (_ BitVec 32) ValueCell!6269)) (size!14872 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30195)

(declare-fun mapValue!21544 () ValueCell!6269)

(declare-fun mapRest!21544 () (Array (_ BitVec 32) ValueCell!6269))

(declare-fun mapKey!21544 () (_ BitVec 32))

(assert (=> mapNonEmpty!21544 (= (arr!14519 _values!833) (store mapRest!21544 mapKey!21544 mapValue!21544))))

(declare-fun b!471648 () Bool)

(declare-fun res!281783 () Bool)

(declare-fun e!276471 () Bool)

(assert (=> b!471648 (=> (not res!281783) (not e!276471))))

(declare-datatypes ((array!30197 0))(
  ( (array!30198 (arr!14520 (Array (_ BitVec 32) (_ BitVec 64))) (size!14873 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30197)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30197 (_ BitVec 32)) Bool)

(assert (=> b!471648 (= res!281783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471650 () Bool)

(assert (=> b!471650 (= e!276471 (not true))))

(declare-datatypes ((tuple2!8802 0))(
  ( (tuple2!8803 (_1!4412 (_ BitVec 64)) (_2!4412 V!18739)) )
))
(declare-datatypes ((List!8875 0))(
  ( (Nil!8872) (Cons!8871 (h!9727 tuple2!8802) (t!14832 List!8875)) )
))
(declare-datatypes ((ListLongMap!7705 0))(
  ( (ListLongMap!7706 (toList!3868 List!8875)) )
))
(declare-fun lt!213862 () ListLongMap!7705)

(declare-fun lt!213863 () ListLongMap!7705)

(assert (=> b!471650 (= lt!213862 lt!213863)))

(declare-fun minValueBefore!38 () V!18739)

(declare-fun zeroValue!794 () V!18739)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13837 0))(
  ( (Unit!13838) )
))
(declare-fun lt!213861 () Unit!13837)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18739)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!200 (array!30197 array!30195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18739 V!18739 V!18739 V!18739 (_ BitVec 32) Int) Unit!13837)

(assert (=> b!471650 (= lt!213861 (lemmaNoChangeToArrayThenSameMapNoExtras!200 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2043 (array!30197 array!30195 (_ BitVec 32) (_ BitVec 32) V!18739 V!18739 (_ BitVec 32) Int) ListLongMap!7705)

(assert (=> b!471650 (= lt!213863 (getCurrentListMapNoExtraKeys!2043 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471650 (= lt!213862 (getCurrentListMapNoExtraKeys!2043 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21544 () Bool)

(assert (=> mapIsEmpty!21544 mapRes!21544))

(declare-fun b!471651 () Bool)

(declare-fun e!276470 () Bool)

(declare-fun e!276469 () Bool)

(assert (=> b!471651 (= e!276470 (and e!276469 mapRes!21544))))

(declare-fun condMapEmpty!21544 () Bool)

(declare-fun mapDefault!21544 () ValueCell!6269)

(assert (=> b!471651 (= condMapEmpty!21544 (= (arr!14519 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6269)) mapDefault!21544)))))

(declare-fun b!471652 () Bool)

(declare-fun tp_is_empty!13225 () Bool)

(assert (=> b!471652 (= e!276468 tp_is_empty!13225)))

(declare-fun b!471653 () Bool)

(declare-fun res!281781 () Bool)

(assert (=> b!471653 (=> (not res!281781) (not e!276471))))

(assert (=> b!471653 (= res!281781 (and (= (size!14872 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14873 _keys!1025) (size!14872 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471654 () Bool)

(declare-fun res!281782 () Bool)

(assert (=> b!471654 (=> (not res!281782) (not e!276471))))

(declare-datatypes ((List!8876 0))(
  ( (Nil!8873) (Cons!8872 (h!9728 (_ BitVec 64)) (t!14833 List!8876)) )
))
(declare-fun arrayNoDuplicates!0 (array!30197 (_ BitVec 32) List!8876) Bool)

(assert (=> b!471654 (= res!281782 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8873))))

(declare-fun b!471649 () Bool)

(assert (=> b!471649 (= e!276469 tp_is_empty!13225)))

(declare-fun res!281780 () Bool)

(assert (=> start!42278 (=> (not res!281780) (not e!276471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42278 (= res!281780 (validMask!0 mask!1365))))

(assert (=> start!42278 e!276471))

(assert (=> start!42278 tp_is_empty!13225))

(assert (=> start!42278 tp!41419))

(assert (=> start!42278 true))

(declare-fun array_inv!10560 (array!30197) Bool)

(assert (=> start!42278 (array_inv!10560 _keys!1025)))

(declare-fun array_inv!10561 (array!30195) Bool)

(assert (=> start!42278 (and (array_inv!10561 _values!833) e!276470)))

(assert (= (and start!42278 res!281780) b!471653))

(assert (= (and b!471653 res!281781) b!471648))

(assert (= (and b!471648 res!281783) b!471654))

(assert (= (and b!471654 res!281782) b!471650))

(assert (= (and b!471651 condMapEmpty!21544) mapIsEmpty!21544))

(assert (= (and b!471651 (not condMapEmpty!21544)) mapNonEmpty!21544))

(get-info :version)

(assert (= (and mapNonEmpty!21544 ((_ is ValueCellFull!6269) mapValue!21544)) b!471652))

(assert (= (and b!471651 ((_ is ValueCellFull!6269) mapDefault!21544)) b!471649))

(assert (= start!42278 b!471651))

(declare-fun m!453249 () Bool)

(assert (=> mapNonEmpty!21544 m!453249))

(declare-fun m!453251 () Bool)

(assert (=> b!471650 m!453251))

(declare-fun m!453253 () Bool)

(assert (=> b!471650 m!453253))

(declare-fun m!453255 () Bool)

(assert (=> b!471650 m!453255))

(declare-fun m!453257 () Bool)

(assert (=> b!471654 m!453257))

(declare-fun m!453259 () Bool)

(assert (=> b!471648 m!453259))

(declare-fun m!453261 () Bool)

(assert (=> start!42278 m!453261))

(declare-fun m!453263 () Bool)

(assert (=> start!42278 m!453263))

(declare-fun m!453265 () Bool)

(assert (=> start!42278 m!453265))

(check-sat (not b!471648) tp_is_empty!13225 b_and!20209 (not start!42278) (not b_next!11797) (not b!471654) (not mapNonEmpty!21544) (not b!471650))
(check-sat b_and!20209 (not b_next!11797))
