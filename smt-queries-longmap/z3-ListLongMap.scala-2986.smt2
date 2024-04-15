; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42192 () Bool)

(assert start!42192)

(declare-fun b_free!11725 () Bool)

(declare-fun b_next!11725 () Bool)

(assert (=> start!42192 (= b_free!11725 (not b_next!11725))))

(declare-fun tp!41199 () Bool)

(declare-fun b_and!20129 () Bool)

(assert (=> start!42192 (= tp!41199 b_and!20129)))

(declare-fun b!470807 () Bool)

(declare-fun res!281318 () Bool)

(declare-fun e!275872 () Bool)

(assert (=> b!470807 (=> (not res!281318) (not e!275872))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30053 0))(
  ( (array!30054 (arr!14449 (Array (_ BitVec 32) (_ BitVec 64))) (size!14802 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30053)

(declare-datatypes ((V!18643 0))(
  ( (V!18644 (val!6621 Int)) )
))
(declare-datatypes ((ValueCell!6233 0))(
  ( (ValueCellFull!6233 (v!8906 V!18643)) (EmptyCell!6233) )
))
(declare-datatypes ((array!30055 0))(
  ( (array!30056 (arr!14450 (Array (_ BitVec 32) ValueCell!6233)) (size!14803 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30055)

(assert (=> b!470807 (= res!281318 (and (= (size!14803 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14802 _keys!1025) (size!14803 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470808 () Bool)

(declare-fun res!281319 () Bool)

(assert (=> b!470808 (=> (not res!281319) (not e!275872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30053 (_ BitVec 32)) Bool)

(assert (=> b!470808 (= res!281319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470809 () Bool)

(declare-fun e!275875 () Bool)

(declare-fun e!275873 () Bool)

(declare-fun mapRes!21433 () Bool)

(assert (=> b!470809 (= e!275875 (and e!275873 mapRes!21433))))

(declare-fun condMapEmpty!21433 () Bool)

(declare-fun mapDefault!21433 () ValueCell!6233)

(assert (=> b!470809 (= condMapEmpty!21433 (= (arr!14450 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6233)) mapDefault!21433)))))

(declare-fun b!470810 () Bool)

(assert (=> b!470810 (= e!275872 (not true))))

(declare-datatypes ((tuple2!8752 0))(
  ( (tuple2!8753 (_1!4387 (_ BitVec 64)) (_2!4387 V!18643)) )
))
(declare-datatypes ((List!8823 0))(
  ( (Nil!8820) (Cons!8819 (h!9675 tuple2!8752) (t!14778 List!8823)) )
))
(declare-datatypes ((ListLongMap!7655 0))(
  ( (ListLongMap!7656 (toList!3843 List!8823)) )
))
(declare-fun lt!213499 () ListLongMap!7655)

(declare-fun lt!213498 () ListLongMap!7655)

(assert (=> b!470810 (= lt!213499 lt!213498)))

(declare-fun minValueBefore!38 () V!18643)

(declare-datatypes ((Unit!13787 0))(
  ( (Unit!13788) )
))
(declare-fun lt!213497 () Unit!13787)

(declare-fun zeroValue!794 () V!18643)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18643)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!175 (array!30053 array!30055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18643 V!18643 V!18643 V!18643 (_ BitVec 32) Int) Unit!13787)

(assert (=> b!470810 (= lt!213497 (lemmaNoChangeToArrayThenSameMapNoExtras!175 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2018 (array!30053 array!30055 (_ BitVec 32) (_ BitVec 32) V!18643 V!18643 (_ BitVec 32) Int) ListLongMap!7655)

(assert (=> b!470810 (= lt!213498 (getCurrentListMapNoExtraKeys!2018 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470810 (= lt!213499 (getCurrentListMapNoExtraKeys!2018 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21433 () Bool)

(assert (=> mapIsEmpty!21433 mapRes!21433))

(declare-fun b!470811 () Bool)

(declare-fun e!275874 () Bool)

(declare-fun tp_is_empty!13153 () Bool)

(assert (=> b!470811 (= e!275874 tp_is_empty!13153)))

(declare-fun b!470812 () Bool)

(declare-fun res!281320 () Bool)

(assert (=> b!470812 (=> (not res!281320) (not e!275872))))

(declare-datatypes ((List!8824 0))(
  ( (Nil!8821) (Cons!8820 (h!9676 (_ BitVec 64)) (t!14779 List!8824)) )
))
(declare-fun arrayNoDuplicates!0 (array!30053 (_ BitVec 32) List!8824) Bool)

(assert (=> b!470812 (= res!281320 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8821))))

(declare-fun b!470813 () Bool)

(assert (=> b!470813 (= e!275873 tp_is_empty!13153)))

(declare-fun res!281317 () Bool)

(assert (=> start!42192 (=> (not res!281317) (not e!275872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42192 (= res!281317 (validMask!0 mask!1365))))

(assert (=> start!42192 e!275872))

(assert (=> start!42192 tp_is_empty!13153))

(assert (=> start!42192 tp!41199))

(assert (=> start!42192 true))

(declare-fun array_inv!10506 (array!30053) Bool)

(assert (=> start!42192 (array_inv!10506 _keys!1025)))

(declare-fun array_inv!10507 (array!30055) Bool)

(assert (=> start!42192 (and (array_inv!10507 _values!833) e!275875)))

(declare-fun mapNonEmpty!21433 () Bool)

(declare-fun tp!41200 () Bool)

(assert (=> mapNonEmpty!21433 (= mapRes!21433 (and tp!41200 e!275874))))

(declare-fun mapValue!21433 () ValueCell!6233)

(declare-fun mapRest!21433 () (Array (_ BitVec 32) ValueCell!6233))

(declare-fun mapKey!21433 () (_ BitVec 32))

(assert (=> mapNonEmpty!21433 (= (arr!14450 _values!833) (store mapRest!21433 mapKey!21433 mapValue!21433))))

(assert (= (and start!42192 res!281317) b!470807))

(assert (= (and b!470807 res!281318) b!470808))

(assert (= (and b!470808 res!281319) b!470812))

(assert (= (and b!470812 res!281320) b!470810))

(assert (= (and b!470809 condMapEmpty!21433) mapIsEmpty!21433))

(assert (= (and b!470809 (not condMapEmpty!21433)) mapNonEmpty!21433))

(get-info :version)

(assert (= (and mapNonEmpty!21433 ((_ is ValueCellFull!6233) mapValue!21433)) b!470811))

(assert (= (and b!470809 ((_ is ValueCellFull!6233) mapDefault!21433)) b!470813))

(assert (= start!42192 b!470809))

(declare-fun m!452535 () Bool)

(assert (=> b!470810 m!452535))

(declare-fun m!452537 () Bool)

(assert (=> b!470810 m!452537))

(declare-fun m!452539 () Bool)

(assert (=> b!470810 m!452539))

(declare-fun m!452541 () Bool)

(assert (=> b!470812 m!452541))

(declare-fun m!452543 () Bool)

(assert (=> b!470808 m!452543))

(declare-fun m!452545 () Bool)

(assert (=> start!42192 m!452545))

(declare-fun m!452547 () Bool)

(assert (=> start!42192 m!452547))

(declare-fun m!452549 () Bool)

(assert (=> start!42192 m!452549))

(declare-fun m!452551 () Bool)

(assert (=> mapNonEmpty!21433 m!452551))

(check-sat b_and!20129 (not b!470808) (not b!470812) (not mapNonEmpty!21433) (not start!42192) tp_is_empty!13153 (not b!470810) (not b_next!11725))
(check-sat b_and!20129 (not b_next!11725))
