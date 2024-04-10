; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42220 () Bool)

(assert start!42220)

(declare-fun b_free!11739 () Bool)

(declare-fun b_next!11739 () Bool)

(assert (=> start!42220 (= b_free!11739 (not b_next!11739))))

(declare-fun tp!41241 () Bool)

(declare-fun b_and!20169 () Bool)

(assert (=> start!42220 (= tp!41241 b_and!20169)))

(declare-fun b!471225 () Bool)

(declare-fun e!276151 () Bool)

(declare-fun tp_is_empty!13167 () Bool)

(assert (=> b!471225 (= e!276151 tp_is_empty!13167)))

(declare-fun mapNonEmpty!21454 () Bool)

(declare-fun mapRes!21454 () Bool)

(declare-fun tp!41242 () Bool)

(assert (=> mapNonEmpty!21454 (= mapRes!21454 (and tp!41242 e!276151))))

(declare-datatypes ((V!18661 0))(
  ( (V!18662 (val!6628 Int)) )
))
(declare-datatypes ((ValueCell!6240 0))(
  ( (ValueCellFull!6240 (v!8919 V!18661)) (EmptyCell!6240) )
))
(declare-datatypes ((array!30099 0))(
  ( (array!30100 (arr!14472 (Array (_ BitVec 32) ValueCell!6240)) (size!14824 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30099)

(declare-fun mapKey!21454 () (_ BitVec 32))

(declare-fun mapRest!21454 () (Array (_ BitVec 32) ValueCell!6240))

(declare-fun mapValue!21454 () ValueCell!6240)

(assert (=> mapNonEmpty!21454 (= (arr!14472 _values!833) (store mapRest!21454 mapKey!21454 mapValue!21454))))

(declare-fun b!471226 () Bool)

(declare-fun res!281533 () Bool)

(declare-fun e!276153 () Bool)

(assert (=> b!471226 (=> (not res!281533) (not e!276153))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30101 0))(
  ( (array!30102 (arr!14473 (Array (_ BitVec 32) (_ BitVec 64))) (size!14825 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30101)

(assert (=> b!471226 (= res!281533 (and (= (size!14824 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14825 _keys!1025) (size!14824 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471227 () Bool)

(declare-fun res!281530 () Bool)

(assert (=> b!471227 (=> (not res!281530) (not e!276153))))

(declare-datatypes ((List!8809 0))(
  ( (Nil!8806) (Cons!8805 (h!9661 (_ BitVec 64)) (t!14773 List!8809)) )
))
(declare-fun arrayNoDuplicates!0 (array!30101 (_ BitVec 32) List!8809) Bool)

(assert (=> b!471227 (= res!281530 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8806))))

(declare-fun b!471228 () Bool)

(declare-fun res!281531 () Bool)

(assert (=> b!471228 (=> (not res!281531) (not e!276153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30101 (_ BitVec 32)) Bool)

(assert (=> b!471228 (= res!281531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281532 () Bool)

(assert (=> start!42220 (=> (not res!281532) (not e!276153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42220 (= res!281532 (validMask!0 mask!1365))))

(assert (=> start!42220 e!276153))

(assert (=> start!42220 tp_is_empty!13167))

(assert (=> start!42220 tp!41241))

(assert (=> start!42220 true))

(declare-fun array_inv!10438 (array!30101) Bool)

(assert (=> start!42220 (array_inv!10438 _keys!1025)))

(declare-fun e!276155 () Bool)

(declare-fun array_inv!10439 (array!30099) Bool)

(assert (=> start!42220 (and (array_inv!10439 _values!833) e!276155)))

(declare-fun b!471229 () Bool)

(declare-fun e!276152 () Bool)

(assert (=> b!471229 (= e!276155 (and e!276152 mapRes!21454))))

(declare-fun condMapEmpty!21454 () Bool)

(declare-fun mapDefault!21454 () ValueCell!6240)

(assert (=> b!471229 (= condMapEmpty!21454 (= (arr!14472 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6240)) mapDefault!21454)))))

(declare-fun mapIsEmpty!21454 () Bool)

(assert (=> mapIsEmpty!21454 mapRes!21454))

(declare-fun b!471230 () Bool)

(assert (=> b!471230 (= e!276153 (not true))))

(declare-datatypes ((tuple2!8728 0))(
  ( (tuple2!8729 (_1!4375 (_ BitVec 64)) (_2!4375 V!18661)) )
))
(declare-datatypes ((List!8810 0))(
  ( (Nil!8807) (Cons!8806 (h!9662 tuple2!8728) (t!14774 List!8810)) )
))
(declare-datatypes ((ListLongMap!7641 0))(
  ( (ListLongMap!7642 (toList!3836 List!8810)) )
))
(declare-fun lt!213795 () ListLongMap!7641)

(declare-fun lt!213794 () ListLongMap!7641)

(assert (=> b!471230 (= lt!213795 lt!213794)))

(declare-fun minValueBefore!38 () V!18661)

(declare-datatypes ((Unit!13831 0))(
  ( (Unit!13832) )
))
(declare-fun lt!213796 () Unit!13831)

(declare-fun zeroValue!794 () V!18661)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18661)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!179 (array!30101 array!30099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18661 V!18661 V!18661 V!18661 (_ BitVec 32) Int) Unit!13831)

(assert (=> b!471230 (= lt!213796 (lemmaNoChangeToArrayThenSameMapNoExtras!179 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1999 (array!30101 array!30099 (_ BitVec 32) (_ BitVec 32) V!18661 V!18661 (_ BitVec 32) Int) ListLongMap!7641)

(assert (=> b!471230 (= lt!213794 (getCurrentListMapNoExtraKeys!1999 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471230 (= lt!213795 (getCurrentListMapNoExtraKeys!1999 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471231 () Bool)

(assert (=> b!471231 (= e!276152 tp_is_empty!13167)))

(assert (= (and start!42220 res!281532) b!471226))

(assert (= (and b!471226 res!281533) b!471228))

(assert (= (and b!471228 res!281531) b!471227))

(assert (= (and b!471227 res!281530) b!471230))

(assert (= (and b!471229 condMapEmpty!21454) mapIsEmpty!21454))

(assert (= (and b!471229 (not condMapEmpty!21454)) mapNonEmpty!21454))

(get-info :version)

(assert (= (and mapNonEmpty!21454 ((_ is ValueCellFull!6240) mapValue!21454)) b!471225))

(assert (= (and b!471229 ((_ is ValueCellFull!6240) mapDefault!21454)) b!471231))

(assert (= start!42220 b!471229))

(declare-fun m!453395 () Bool)

(assert (=> mapNonEmpty!21454 m!453395))

(declare-fun m!453397 () Bool)

(assert (=> start!42220 m!453397))

(declare-fun m!453399 () Bool)

(assert (=> start!42220 m!453399))

(declare-fun m!453401 () Bool)

(assert (=> start!42220 m!453401))

(declare-fun m!453403 () Bool)

(assert (=> b!471228 m!453403))

(declare-fun m!453405 () Bool)

(assert (=> b!471227 m!453405))

(declare-fun m!453407 () Bool)

(assert (=> b!471230 m!453407))

(declare-fun m!453409 () Bool)

(assert (=> b!471230 m!453409))

(declare-fun m!453411 () Bool)

(assert (=> b!471230 m!453411))

(check-sat (not b!471230) (not b_next!11739) (not start!42220) b_and!20169 tp_is_empty!13167 (not b!471228) (not mapNonEmpty!21454) (not b!471227))
(check-sat b_and!20169 (not b_next!11739))
