; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42198 () Bool)

(assert start!42198)

(declare-fun b_free!11731 () Bool)

(declare-fun b_next!11731 () Bool)

(assert (=> start!42198 (= b_free!11731 (not b_next!11731))))

(declare-fun tp!41218 () Bool)

(declare-fun b_and!20135 () Bool)

(assert (=> start!42198 (= tp!41218 b_and!20135)))

(declare-fun res!281356 () Bool)

(declare-fun e!275917 () Bool)

(assert (=> start!42198 (=> (not res!281356) (not e!275917))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42198 (= res!281356 (validMask!0 mask!1365))))

(assert (=> start!42198 e!275917))

(declare-fun tp_is_empty!13159 () Bool)

(assert (=> start!42198 tp_is_empty!13159))

(assert (=> start!42198 tp!41218))

(assert (=> start!42198 true))

(declare-datatypes ((array!30065 0))(
  ( (array!30066 (arr!14455 (Array (_ BitVec 32) (_ BitVec 64))) (size!14808 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30065)

(declare-fun array_inv!10512 (array!30065) Bool)

(assert (=> start!42198 (array_inv!10512 _keys!1025)))

(declare-datatypes ((V!18651 0))(
  ( (V!18652 (val!6624 Int)) )
))
(declare-datatypes ((ValueCell!6236 0))(
  ( (ValueCellFull!6236 (v!8909 V!18651)) (EmptyCell!6236) )
))
(declare-datatypes ((array!30067 0))(
  ( (array!30068 (arr!14456 (Array (_ BitVec 32) ValueCell!6236)) (size!14809 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30067)

(declare-fun e!275920 () Bool)

(declare-fun array_inv!10513 (array!30067) Bool)

(assert (=> start!42198 (and (array_inv!10513 _values!833) e!275920)))

(declare-fun b!470870 () Bool)

(declare-fun res!281353 () Bool)

(assert (=> b!470870 (=> (not res!281353) (not e!275917))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470870 (= res!281353 (and (= (size!14809 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14808 _keys!1025) (size!14809 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21442 () Bool)

(declare-fun mapRes!21442 () Bool)

(assert (=> mapIsEmpty!21442 mapRes!21442))

(declare-fun b!470871 () Bool)

(declare-fun e!275918 () Bool)

(assert (=> b!470871 (= e!275918 tp_is_empty!13159)))

(declare-fun b!470872 () Bool)

(declare-fun res!281355 () Bool)

(assert (=> b!470872 (=> (not res!281355) (not e!275917))))

(declare-datatypes ((List!8828 0))(
  ( (Nil!8825) (Cons!8824 (h!9680 (_ BitVec 64)) (t!14783 List!8828)) )
))
(declare-fun arrayNoDuplicates!0 (array!30065 (_ BitVec 32) List!8828) Bool)

(assert (=> b!470872 (= res!281355 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8825))))

(declare-fun b!470873 () Bool)

(assert (=> b!470873 (= e!275920 (and e!275918 mapRes!21442))))

(declare-fun condMapEmpty!21442 () Bool)

(declare-fun mapDefault!21442 () ValueCell!6236)

(assert (=> b!470873 (= condMapEmpty!21442 (= (arr!14456 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6236)) mapDefault!21442)))))

(declare-fun b!470874 () Bool)

(assert (=> b!470874 (= e!275917 (not true))))

(declare-datatypes ((tuple2!8756 0))(
  ( (tuple2!8757 (_1!4389 (_ BitVec 64)) (_2!4389 V!18651)) )
))
(declare-datatypes ((List!8829 0))(
  ( (Nil!8826) (Cons!8825 (h!9681 tuple2!8756) (t!14784 List!8829)) )
))
(declare-datatypes ((ListLongMap!7659 0))(
  ( (ListLongMap!7660 (toList!3845 List!8829)) )
))
(declare-fun lt!213525 () ListLongMap!7659)

(declare-fun lt!213526 () ListLongMap!7659)

(assert (=> b!470874 (= lt!213525 lt!213526)))

(declare-datatypes ((Unit!13791 0))(
  ( (Unit!13792) )
))
(declare-fun lt!213524 () Unit!13791)

(declare-fun minValueBefore!38 () V!18651)

(declare-fun zeroValue!794 () V!18651)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18651)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!177 (array!30065 array!30067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18651 V!18651 V!18651 V!18651 (_ BitVec 32) Int) Unit!13791)

(assert (=> b!470874 (= lt!213524 (lemmaNoChangeToArrayThenSameMapNoExtras!177 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2020 (array!30065 array!30067 (_ BitVec 32) (_ BitVec 32) V!18651 V!18651 (_ BitVec 32) Int) ListLongMap!7659)

(assert (=> b!470874 (= lt!213526 (getCurrentListMapNoExtraKeys!2020 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470874 (= lt!213525 (getCurrentListMapNoExtraKeys!2020 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470875 () Bool)

(declare-fun res!281354 () Bool)

(assert (=> b!470875 (=> (not res!281354) (not e!275917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30065 (_ BitVec 32)) Bool)

(assert (=> b!470875 (= res!281354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21442 () Bool)

(declare-fun tp!41217 () Bool)

(declare-fun e!275919 () Bool)

(assert (=> mapNonEmpty!21442 (= mapRes!21442 (and tp!41217 e!275919))))

(declare-fun mapValue!21442 () ValueCell!6236)

(declare-fun mapRest!21442 () (Array (_ BitVec 32) ValueCell!6236))

(declare-fun mapKey!21442 () (_ BitVec 32))

(assert (=> mapNonEmpty!21442 (= (arr!14456 _values!833) (store mapRest!21442 mapKey!21442 mapValue!21442))))

(declare-fun b!470876 () Bool)

(assert (=> b!470876 (= e!275919 tp_is_empty!13159)))

(assert (= (and start!42198 res!281356) b!470870))

(assert (= (and b!470870 res!281353) b!470875))

(assert (= (and b!470875 res!281354) b!470872))

(assert (= (and b!470872 res!281355) b!470874))

(assert (= (and b!470873 condMapEmpty!21442) mapIsEmpty!21442))

(assert (= (and b!470873 (not condMapEmpty!21442)) mapNonEmpty!21442))

(get-info :version)

(assert (= (and mapNonEmpty!21442 ((_ is ValueCellFull!6236) mapValue!21442)) b!470876))

(assert (= (and b!470873 ((_ is ValueCellFull!6236) mapDefault!21442)) b!470871))

(assert (= start!42198 b!470873))

(declare-fun m!452589 () Bool)

(assert (=> start!42198 m!452589))

(declare-fun m!452591 () Bool)

(assert (=> start!42198 m!452591))

(declare-fun m!452593 () Bool)

(assert (=> start!42198 m!452593))

(declare-fun m!452595 () Bool)

(assert (=> b!470875 m!452595))

(declare-fun m!452597 () Bool)

(assert (=> b!470872 m!452597))

(declare-fun m!452599 () Bool)

(assert (=> b!470874 m!452599))

(declare-fun m!452601 () Bool)

(assert (=> b!470874 m!452601))

(declare-fun m!452603 () Bool)

(assert (=> b!470874 m!452603))

(declare-fun m!452605 () Bool)

(assert (=> mapNonEmpty!21442 m!452605))

(check-sat tp_is_empty!13159 (not b!470875) (not b_next!11731) (not b!470874) (not mapNonEmpty!21442) (not start!42198) (not b!470872) b_and!20135)
(check-sat b_and!20135 (not b_next!11731))
