; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42264 () Bool)

(assert start!42264)

(declare-fun b_free!11769 () Bool)

(declare-fun b_next!11769 () Bool)

(assert (=> start!42264 (= b_free!11769 (not b_next!11769))))

(declare-fun tp!41335 () Bool)

(declare-fun b_and!20207 () Bool)

(assert (=> start!42264 (= tp!41335 b_and!20207)))

(declare-fun mapNonEmpty!21502 () Bool)

(declare-fun mapRes!21502 () Bool)

(declare-fun tp!41334 () Bool)

(declare-fun e!276434 () Bool)

(assert (=> mapNonEmpty!21502 (= mapRes!21502 (and tp!41334 e!276434))))

(declare-datatypes ((V!18701 0))(
  ( (V!18702 (val!6643 Int)) )
))
(declare-datatypes ((ValueCell!6255 0))(
  ( (ValueCellFull!6255 (v!8934 V!18701)) (EmptyCell!6255) )
))
(declare-datatypes ((array!30155 0))(
  ( (array!30156 (arr!14499 (Array (_ BitVec 32) ValueCell!6255)) (size!14851 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30155)

(declare-fun mapKey!21502 () (_ BitVec 32))

(declare-fun mapRest!21502 () (Array (_ BitVec 32) ValueCell!6255))

(declare-fun mapValue!21502 () ValueCell!6255)

(assert (=> mapNonEmpty!21502 (= (arr!14499 _values!833) (store mapRest!21502 mapKey!21502 mapValue!21502))))

(declare-fun b!471625 () Bool)

(declare-fun e!276433 () Bool)

(declare-fun e!276432 () Bool)

(assert (=> b!471625 (= e!276433 (and e!276432 mapRes!21502))))

(declare-fun condMapEmpty!21502 () Bool)

(declare-fun mapDefault!21502 () ValueCell!6255)

(assert (=> b!471625 (= condMapEmpty!21502 (= (arr!14499 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6255)) mapDefault!21502)))))

(declare-fun mapIsEmpty!21502 () Bool)

(assert (=> mapIsEmpty!21502 mapRes!21502))

(declare-fun b!471626 () Bool)

(declare-fun res!281741 () Bool)

(declare-fun e!276431 () Bool)

(assert (=> b!471626 (=> (not res!281741) (not e!276431))))

(declare-datatypes ((array!30157 0))(
  ( (array!30158 (arr!14500 (Array (_ BitVec 32) (_ BitVec 64))) (size!14852 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30157)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30157 (_ BitVec 32)) Bool)

(assert (=> b!471626 (= res!281741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281743 () Bool)

(assert (=> start!42264 (=> (not res!281743) (not e!276431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42264 (= res!281743 (validMask!0 mask!1365))))

(assert (=> start!42264 e!276431))

(declare-fun tp_is_empty!13197 () Bool)

(assert (=> start!42264 tp_is_empty!13197))

(assert (=> start!42264 tp!41335))

(assert (=> start!42264 true))

(declare-fun array_inv!10450 (array!30157) Bool)

(assert (=> start!42264 (array_inv!10450 _keys!1025)))

(declare-fun array_inv!10451 (array!30155) Bool)

(assert (=> start!42264 (and (array_inv!10451 _values!833) e!276433)))

(declare-fun b!471627 () Bool)

(assert (=> b!471627 (= e!276432 tp_is_empty!13197)))

(declare-fun b!471628 () Bool)

(assert (=> b!471628 (= e!276431 (not true))))

(declare-datatypes ((tuple2!8742 0))(
  ( (tuple2!8743 (_1!4382 (_ BitVec 64)) (_2!4382 V!18701)) )
))
(declare-datatypes ((List!8825 0))(
  ( (Nil!8822) (Cons!8821 (h!9677 tuple2!8742) (t!14791 List!8825)) )
))
(declare-datatypes ((ListLongMap!7655 0))(
  ( (ListLongMap!7656 (toList!3843 List!8825)) )
))
(declare-fun lt!213971 () ListLongMap!7655)

(declare-fun lt!213970 () ListLongMap!7655)

(assert (=> b!471628 (= lt!213971 lt!213970)))

(declare-datatypes ((Unit!13845 0))(
  ( (Unit!13846) )
))
(declare-fun lt!213969 () Unit!13845)

(declare-fun minValueBefore!38 () V!18701)

(declare-fun zeroValue!794 () V!18701)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18701)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!186 (array!30157 array!30155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18701 V!18701 V!18701 V!18701 (_ BitVec 32) Int) Unit!13845)

(assert (=> b!471628 (= lt!213969 (lemmaNoChangeToArrayThenSameMapNoExtras!186 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2006 (array!30157 array!30155 (_ BitVec 32) (_ BitVec 32) V!18701 V!18701 (_ BitVec 32) Int) ListLongMap!7655)

(assert (=> b!471628 (= lt!213970 (getCurrentListMapNoExtraKeys!2006 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471628 (= lt!213971 (getCurrentListMapNoExtraKeys!2006 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471629 () Bool)

(declare-fun res!281744 () Bool)

(assert (=> b!471629 (=> (not res!281744) (not e!276431))))

(declare-datatypes ((List!8826 0))(
  ( (Nil!8823) (Cons!8822 (h!9678 (_ BitVec 64)) (t!14792 List!8826)) )
))
(declare-fun arrayNoDuplicates!0 (array!30157 (_ BitVec 32) List!8826) Bool)

(assert (=> b!471629 (= res!281744 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8823))))

(declare-fun b!471630 () Bool)

(assert (=> b!471630 (= e!276434 tp_is_empty!13197)))

(declare-fun b!471631 () Bool)

(declare-fun res!281742 () Bool)

(assert (=> b!471631 (=> (not res!281742) (not e!276431))))

(assert (=> b!471631 (= res!281742 (and (= (size!14851 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14852 _keys!1025) (size!14851 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42264 res!281743) b!471631))

(assert (= (and b!471631 res!281742) b!471626))

(assert (= (and b!471626 res!281741) b!471629))

(assert (= (and b!471629 res!281744) b!471628))

(assert (= (and b!471625 condMapEmpty!21502) mapIsEmpty!21502))

(assert (= (and b!471625 (not condMapEmpty!21502)) mapNonEmpty!21502))

(get-info :version)

(assert (= (and mapNonEmpty!21502 ((_ is ValueCellFull!6255) mapValue!21502)) b!471630))

(assert (= (and b!471625 ((_ is ValueCellFull!6255) mapDefault!21502)) b!471627))

(assert (= start!42264 b!471625))

(declare-fun m!453731 () Bool)

(assert (=> b!471628 m!453731))

(declare-fun m!453733 () Bool)

(assert (=> b!471628 m!453733))

(declare-fun m!453735 () Bool)

(assert (=> b!471628 m!453735))

(declare-fun m!453737 () Bool)

(assert (=> b!471626 m!453737))

(declare-fun m!453739 () Bool)

(assert (=> b!471629 m!453739))

(declare-fun m!453741 () Bool)

(assert (=> mapNonEmpty!21502 m!453741))

(declare-fun m!453743 () Bool)

(assert (=> start!42264 m!453743))

(declare-fun m!453745 () Bool)

(assert (=> start!42264 m!453745))

(declare-fun m!453747 () Bool)

(assert (=> start!42264 m!453747))

(check-sat (not b_next!11769) (not mapNonEmpty!21502) (not start!42264) (not b!471629) (not b!471628) (not b!471626) b_and!20207 tp_is_empty!13197)
(check-sat b_and!20207 (not b_next!11769))
