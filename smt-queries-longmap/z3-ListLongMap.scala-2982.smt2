; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42184 () Bool)

(assert start!42184)

(declare-fun b_free!11703 () Bool)

(declare-fun b_next!11703 () Bool)

(assert (=> start!42184 (= b_free!11703 (not b_next!11703))))

(declare-fun tp!41133 () Bool)

(declare-fun b_and!20133 () Bool)

(assert (=> start!42184 (= tp!41133 b_and!20133)))

(declare-fun b!470847 () Bool)

(declare-fun res!281317 () Bool)

(declare-fun e!275885 () Bool)

(assert (=> b!470847 (=> (not res!281317) (not e!275885))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30031 0))(
  ( (array!30032 (arr!14438 (Array (_ BitVec 32) (_ BitVec 64))) (size!14790 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30031)

(declare-datatypes ((V!18613 0))(
  ( (V!18614 (val!6610 Int)) )
))
(declare-datatypes ((ValueCell!6222 0))(
  ( (ValueCellFull!6222 (v!8901 V!18613)) (EmptyCell!6222) )
))
(declare-datatypes ((array!30033 0))(
  ( (array!30034 (arr!14439 (Array (_ BitVec 32) ValueCell!6222)) (size!14791 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30033)

(assert (=> b!470847 (= res!281317 (and (= (size!14791 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14790 _keys!1025) (size!14791 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470848 () Bool)

(declare-fun res!281314 () Bool)

(assert (=> b!470848 (=> (not res!281314) (not e!275885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30031 (_ BitVec 32)) Bool)

(assert (=> b!470848 (= res!281314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470850 () Bool)

(declare-fun e!275881 () Bool)

(declare-fun tp_is_empty!13131 () Bool)

(assert (=> b!470850 (= e!275881 tp_is_empty!13131)))

(declare-fun mapNonEmpty!21400 () Bool)

(declare-fun mapRes!21400 () Bool)

(declare-fun tp!41134 () Bool)

(declare-fun e!275883 () Bool)

(assert (=> mapNonEmpty!21400 (= mapRes!21400 (and tp!41134 e!275883))))

(declare-fun mapRest!21400 () (Array (_ BitVec 32) ValueCell!6222))

(declare-fun mapValue!21400 () ValueCell!6222)

(declare-fun mapKey!21400 () (_ BitVec 32))

(assert (=> mapNonEmpty!21400 (= (arr!14439 _values!833) (store mapRest!21400 mapKey!21400 mapValue!21400))))

(declare-fun mapIsEmpty!21400 () Bool)

(assert (=> mapIsEmpty!21400 mapRes!21400))

(declare-fun b!470851 () Bool)

(declare-fun e!275882 () Bool)

(assert (=> b!470851 (= e!275882 (and e!275881 mapRes!21400))))

(declare-fun condMapEmpty!21400 () Bool)

(declare-fun mapDefault!21400 () ValueCell!6222)

(assert (=> b!470851 (= condMapEmpty!21400 (= (arr!14439 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6222)) mapDefault!21400)))))

(declare-fun b!470852 () Bool)

(declare-fun res!281316 () Bool)

(assert (=> b!470852 (=> (not res!281316) (not e!275885))))

(declare-datatypes ((List!8784 0))(
  ( (Nil!8781) (Cons!8780 (h!9636 (_ BitVec 64)) (t!14748 List!8784)) )
))
(declare-fun arrayNoDuplicates!0 (array!30031 (_ BitVec 32) List!8784) Bool)

(assert (=> b!470852 (= res!281316 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8781))))

(declare-fun b!470853 () Bool)

(assert (=> b!470853 (= e!275885 (not true))))

(declare-datatypes ((tuple2!8704 0))(
  ( (tuple2!8705 (_1!4363 (_ BitVec 64)) (_2!4363 V!18613)) )
))
(declare-datatypes ((List!8785 0))(
  ( (Nil!8782) (Cons!8781 (h!9637 tuple2!8704) (t!14749 List!8785)) )
))
(declare-datatypes ((ListLongMap!7617 0))(
  ( (ListLongMap!7618 (toList!3824 List!8785)) )
))
(declare-fun lt!213633 () ListLongMap!7617)

(declare-fun lt!213634 () ListLongMap!7617)

(assert (=> b!470853 (= lt!213633 lt!213634)))

(declare-datatypes ((Unit!13807 0))(
  ( (Unit!13808) )
))
(declare-fun lt!213632 () Unit!13807)

(declare-fun minValueBefore!38 () V!18613)

(declare-fun zeroValue!794 () V!18613)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18613)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!167 (array!30031 array!30033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18613 V!18613 V!18613 V!18613 (_ BitVec 32) Int) Unit!13807)

(assert (=> b!470853 (= lt!213632 (lemmaNoChangeToArrayThenSameMapNoExtras!167 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1987 (array!30031 array!30033 (_ BitVec 32) (_ BitVec 32) V!18613 V!18613 (_ BitVec 32) Int) ListLongMap!7617)

(assert (=> b!470853 (= lt!213634 (getCurrentListMapNoExtraKeys!1987 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470853 (= lt!213633 (getCurrentListMapNoExtraKeys!1987 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470849 () Bool)

(assert (=> b!470849 (= e!275883 tp_is_empty!13131)))

(declare-fun res!281315 () Bool)

(assert (=> start!42184 (=> (not res!281315) (not e!275885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42184 (= res!281315 (validMask!0 mask!1365))))

(assert (=> start!42184 e!275885))

(assert (=> start!42184 tp_is_empty!13131))

(assert (=> start!42184 tp!41133))

(assert (=> start!42184 true))

(declare-fun array_inv!10414 (array!30031) Bool)

(assert (=> start!42184 (array_inv!10414 _keys!1025)))

(declare-fun array_inv!10415 (array!30033) Bool)

(assert (=> start!42184 (and (array_inv!10415 _values!833) e!275882)))

(assert (= (and start!42184 res!281315) b!470847))

(assert (= (and b!470847 res!281317) b!470848))

(assert (= (and b!470848 res!281314) b!470852))

(assert (= (and b!470852 res!281316) b!470853))

(assert (= (and b!470851 condMapEmpty!21400) mapIsEmpty!21400))

(assert (= (and b!470851 (not condMapEmpty!21400)) mapNonEmpty!21400))

(get-info :version)

(assert (= (and mapNonEmpty!21400 ((_ is ValueCellFull!6222) mapValue!21400)) b!470849))

(assert (= (and b!470851 ((_ is ValueCellFull!6222) mapDefault!21400)) b!470850))

(assert (= start!42184 b!470851))

(declare-fun m!453071 () Bool)

(assert (=> b!470852 m!453071))

(declare-fun m!453073 () Bool)

(assert (=> b!470848 m!453073))

(declare-fun m!453075 () Bool)

(assert (=> b!470853 m!453075))

(declare-fun m!453077 () Bool)

(assert (=> b!470853 m!453077))

(declare-fun m!453079 () Bool)

(assert (=> b!470853 m!453079))

(declare-fun m!453081 () Bool)

(assert (=> mapNonEmpty!21400 m!453081))

(declare-fun m!453083 () Bool)

(assert (=> start!42184 m!453083))

(declare-fun m!453085 () Bool)

(assert (=> start!42184 m!453085))

(declare-fun m!453087 () Bool)

(assert (=> start!42184 m!453087))

(check-sat (not b_next!11703) (not mapNonEmpty!21400) (not b!470848) (not b!470853) (not b!470852) tp_is_empty!13131 b_and!20133 (not start!42184))
(check-sat b_and!20133 (not b_next!11703))
