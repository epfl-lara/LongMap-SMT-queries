; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42186 () Bool)

(assert start!42186)

(declare-fun b_free!11719 () Bool)

(declare-fun b_next!11719 () Bool)

(assert (=> start!42186 (= b_free!11719 (not b_next!11719))))

(declare-fun tp!41182 () Bool)

(declare-fun b_and!20123 () Bool)

(assert (=> start!42186 (= tp!41182 b_and!20123)))

(declare-fun res!281284 () Bool)

(declare-fun e!275830 () Bool)

(assert (=> start!42186 (=> (not res!281284) (not e!275830))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42186 (= res!281284 (validMask!0 mask!1365))))

(assert (=> start!42186 e!275830))

(declare-fun tp_is_empty!13147 () Bool)

(assert (=> start!42186 tp_is_empty!13147))

(assert (=> start!42186 tp!41182))

(assert (=> start!42186 true))

(declare-datatypes ((array!30043 0))(
  ( (array!30044 (arr!14444 (Array (_ BitVec 32) (_ BitVec 64))) (size!14797 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30043)

(declare-fun array_inv!10504 (array!30043) Bool)

(assert (=> start!42186 (array_inv!10504 _keys!1025)))

(declare-datatypes ((V!18635 0))(
  ( (V!18636 (val!6618 Int)) )
))
(declare-datatypes ((ValueCell!6230 0))(
  ( (ValueCellFull!6230 (v!8903 V!18635)) (EmptyCell!6230) )
))
(declare-datatypes ((array!30045 0))(
  ( (array!30046 (arr!14445 (Array (_ BitVec 32) ValueCell!6230)) (size!14798 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30045)

(declare-fun e!275831 () Bool)

(declare-fun array_inv!10505 (array!30045) Bool)

(assert (=> start!42186 (and (array_inv!10505 _values!833) e!275831)))

(declare-fun b!470744 () Bool)

(declare-fun res!281281 () Bool)

(assert (=> b!470744 (=> (not res!281281) (not e!275830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30043 (_ BitVec 32)) Bool)

(assert (=> b!470744 (= res!281281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470745 () Bool)

(declare-fun e!275829 () Bool)

(assert (=> b!470745 (= e!275829 tp_is_empty!13147)))

(declare-fun b!470746 () Bool)

(assert (=> b!470746 (= e!275830 (not true))))

(declare-datatypes ((tuple2!8748 0))(
  ( (tuple2!8749 (_1!4385 (_ BitVec 64)) (_2!4385 V!18635)) )
))
(declare-datatypes ((List!8819 0))(
  ( (Nil!8816) (Cons!8815 (h!9671 tuple2!8748) (t!14774 List!8819)) )
))
(declare-datatypes ((ListLongMap!7651 0))(
  ( (ListLongMap!7652 (toList!3841 List!8819)) )
))
(declare-fun lt!213470 () ListLongMap!7651)

(declare-fun lt!213472 () ListLongMap!7651)

(assert (=> b!470746 (= lt!213470 lt!213472)))

(declare-fun minValueBefore!38 () V!18635)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13783 0))(
  ( (Unit!13784) )
))
(declare-fun lt!213471 () Unit!13783)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18635)

(declare-fun minValueAfter!38 () V!18635)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!173 (array!30043 array!30045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18635 V!18635 V!18635 V!18635 (_ BitVec 32) Int) Unit!13783)

(assert (=> b!470746 (= lt!213471 (lemmaNoChangeToArrayThenSameMapNoExtras!173 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2016 (array!30043 array!30045 (_ BitVec 32) (_ BitVec 32) V!18635 V!18635 (_ BitVec 32) Int) ListLongMap!7651)

(assert (=> b!470746 (= lt!213472 (getCurrentListMapNoExtraKeys!2016 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470746 (= lt!213470 (getCurrentListMapNoExtraKeys!2016 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470747 () Bool)

(declare-fun e!275827 () Bool)

(assert (=> b!470747 (= e!275827 tp_is_empty!13147)))

(declare-fun mapIsEmpty!21424 () Bool)

(declare-fun mapRes!21424 () Bool)

(assert (=> mapIsEmpty!21424 mapRes!21424))

(declare-fun b!470748 () Bool)

(assert (=> b!470748 (= e!275831 (and e!275829 mapRes!21424))))

(declare-fun condMapEmpty!21424 () Bool)

(declare-fun mapDefault!21424 () ValueCell!6230)

(assert (=> b!470748 (= condMapEmpty!21424 (= (arr!14445 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6230)) mapDefault!21424)))))

(declare-fun mapNonEmpty!21424 () Bool)

(declare-fun tp!41181 () Bool)

(assert (=> mapNonEmpty!21424 (= mapRes!21424 (and tp!41181 e!275827))))

(declare-fun mapKey!21424 () (_ BitVec 32))

(declare-fun mapValue!21424 () ValueCell!6230)

(declare-fun mapRest!21424 () (Array (_ BitVec 32) ValueCell!6230))

(assert (=> mapNonEmpty!21424 (= (arr!14445 _values!833) (store mapRest!21424 mapKey!21424 mapValue!21424))))

(declare-fun b!470749 () Bool)

(declare-fun res!281283 () Bool)

(assert (=> b!470749 (=> (not res!281283) (not e!275830))))

(declare-datatypes ((List!8820 0))(
  ( (Nil!8817) (Cons!8816 (h!9672 (_ BitVec 64)) (t!14775 List!8820)) )
))
(declare-fun arrayNoDuplicates!0 (array!30043 (_ BitVec 32) List!8820) Bool)

(assert (=> b!470749 (= res!281283 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8817))))

(declare-fun b!470750 () Bool)

(declare-fun res!281282 () Bool)

(assert (=> b!470750 (=> (not res!281282) (not e!275830))))

(assert (=> b!470750 (= res!281282 (and (= (size!14798 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14797 _keys!1025) (size!14798 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42186 res!281284) b!470750))

(assert (= (and b!470750 res!281282) b!470744))

(assert (= (and b!470744 res!281281) b!470749))

(assert (= (and b!470749 res!281283) b!470746))

(assert (= (and b!470748 condMapEmpty!21424) mapIsEmpty!21424))

(assert (= (and b!470748 (not condMapEmpty!21424)) mapNonEmpty!21424))

(get-info :version)

(assert (= (and mapNonEmpty!21424 ((_ is ValueCellFull!6230) mapValue!21424)) b!470747))

(assert (= (and b!470748 ((_ is ValueCellFull!6230) mapDefault!21424)) b!470745))

(assert (= start!42186 b!470748))

(declare-fun m!452481 () Bool)

(assert (=> mapNonEmpty!21424 m!452481))

(declare-fun m!452483 () Bool)

(assert (=> b!470746 m!452483))

(declare-fun m!452485 () Bool)

(assert (=> b!470746 m!452485))

(declare-fun m!452487 () Bool)

(assert (=> b!470746 m!452487))

(declare-fun m!452489 () Bool)

(assert (=> b!470749 m!452489))

(declare-fun m!452491 () Bool)

(assert (=> start!42186 m!452491))

(declare-fun m!452493 () Bool)

(assert (=> start!42186 m!452493))

(declare-fun m!452495 () Bool)

(assert (=> start!42186 m!452495))

(declare-fun m!452497 () Bool)

(assert (=> b!470744 m!452497))

(check-sat (not b!470749) (not start!42186) (not b!470746) (not b!470744) tp_is_empty!13147 (not b_next!11719) (not mapNonEmpty!21424) b_and!20123)
(check-sat b_and!20123 (not b_next!11719))
