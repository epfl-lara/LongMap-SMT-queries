; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42130 () Bool)

(assert start!42130)

(declare-fun b_free!11677 () Bool)

(declare-fun b_next!11677 () Bool)

(assert (=> start!42130 (= b_free!11677 (not b_next!11677))))

(declare-fun tp!41053 () Bool)

(declare-fun b_and!20109 () Bool)

(assert (=> start!42130 (= tp!41053 b_and!20109)))

(declare-fun mapNonEmpty!21358 () Bool)

(declare-fun mapRes!21358 () Bool)

(declare-fun tp!41052 () Bool)

(declare-fun e!275594 () Bool)

(assert (=> mapNonEmpty!21358 (= mapRes!21358 (and tp!41052 e!275594))))

(declare-datatypes ((V!18579 0))(
  ( (V!18580 (val!6597 Int)) )
))
(declare-datatypes ((ValueCell!6209 0))(
  ( (ValueCellFull!6209 (v!8889 V!18579)) (EmptyCell!6209) )
))
(declare-fun mapValue!21358 () ValueCell!6209)

(declare-fun mapKey!21358 () (_ BitVec 32))

(declare-fun mapRest!21358 () (Array (_ BitVec 32) ValueCell!6209))

(declare-datatypes ((array!29964 0))(
  ( (array!29965 (arr!14405 (Array (_ BitVec 32) ValueCell!6209)) (size!14757 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29964)

(assert (=> mapNonEmpty!21358 (= (arr!14405 _values!833) (store mapRest!21358 mapKey!21358 mapValue!21358))))

(declare-fun res!281120 () Bool)

(declare-fun e!275592 () Bool)

(assert (=> start!42130 (=> (not res!281120) (not e!275592))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42130 (= res!281120 (validMask!0 mask!1365))))

(assert (=> start!42130 e!275592))

(declare-fun tp_is_empty!13105 () Bool)

(assert (=> start!42130 tp_is_empty!13105))

(assert (=> start!42130 tp!41053))

(assert (=> start!42130 true))

(declare-datatypes ((array!29966 0))(
  ( (array!29967 (arr!14406 (Array (_ BitVec 32) (_ BitVec 64))) (size!14758 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29966)

(declare-fun array_inv!10486 (array!29966) Bool)

(assert (=> start!42130 (array_inv!10486 _keys!1025)))

(declare-fun e!275595 () Bool)

(declare-fun array_inv!10487 (array!29964) Bool)

(assert (=> start!42130 (and (array_inv!10487 _values!833) e!275595)))

(declare-fun b!470428 () Bool)

(declare-fun res!281121 () Bool)

(assert (=> b!470428 (=> (not res!281121) (not e!275592))))

(declare-datatypes ((List!8681 0))(
  ( (Nil!8678) (Cons!8677 (h!9533 (_ BitVec 64)) (t!14635 List!8681)) )
))
(declare-fun arrayNoDuplicates!0 (array!29966 (_ BitVec 32) List!8681) Bool)

(assert (=> b!470428 (= res!281121 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8678))))

(declare-fun b!470429 () Bool)

(declare-fun e!275596 () Bool)

(assert (=> b!470429 (= e!275596 tp_is_empty!13105)))

(declare-fun b!470430 () Bool)

(assert (=> b!470430 (= e!275594 tp_is_empty!13105)))

(declare-fun mapIsEmpty!21358 () Bool)

(assert (=> mapIsEmpty!21358 mapRes!21358))

(declare-fun b!470431 () Bool)

(declare-fun res!281123 () Bool)

(assert (=> b!470431 (=> (not res!281123) (not e!275592))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470431 (= res!281123 (and (= (size!14757 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14758 _keys!1025) (size!14757 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470432 () Bool)

(assert (=> b!470432 (= e!275595 (and e!275596 mapRes!21358))))

(declare-fun condMapEmpty!21358 () Bool)

(declare-fun mapDefault!21358 () ValueCell!6209)

(assert (=> b!470432 (= condMapEmpty!21358 (= (arr!14405 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6209)) mapDefault!21358)))))

(declare-fun b!470433 () Bool)

(assert (=> b!470433 (= e!275592 (not true))))

(declare-datatypes ((tuple2!8608 0))(
  ( (tuple2!8609 (_1!4315 (_ BitVec 64)) (_2!4315 V!18579)) )
))
(declare-datatypes ((List!8682 0))(
  ( (Nil!8679) (Cons!8678 (h!9534 tuple2!8608) (t!14636 List!8682)) )
))
(declare-datatypes ((ListLongMap!7523 0))(
  ( (ListLongMap!7524 (toList!3777 List!8682)) )
))
(declare-fun lt!213489 () ListLongMap!7523)

(declare-fun lt!213488 () ListLongMap!7523)

(assert (=> b!470433 (= lt!213489 lt!213488)))

(declare-fun minValueBefore!38 () V!18579)

(declare-datatypes ((Unit!13767 0))(
  ( (Unit!13768) )
))
(declare-fun lt!213487 () Unit!13767)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18579)

(declare-fun minValueAfter!38 () V!18579)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!152 (array!29966 array!29964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18579 V!18579 V!18579 V!18579 (_ BitVec 32) Int) Unit!13767)

(assert (=> b!470433 (= lt!213487 (lemmaNoChangeToArrayThenSameMapNoExtras!152 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1992 (array!29966 array!29964 (_ BitVec 32) (_ BitVec 32) V!18579 V!18579 (_ BitVec 32) Int) ListLongMap!7523)

(assert (=> b!470433 (= lt!213488 (getCurrentListMapNoExtraKeys!1992 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470433 (= lt!213489 (getCurrentListMapNoExtraKeys!1992 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470434 () Bool)

(declare-fun res!281122 () Bool)

(assert (=> b!470434 (=> (not res!281122) (not e!275592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29966 (_ BitVec 32)) Bool)

(assert (=> b!470434 (= res!281122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42130 res!281120) b!470431))

(assert (= (and b!470431 res!281123) b!470434))

(assert (= (and b!470434 res!281122) b!470428))

(assert (= (and b!470428 res!281121) b!470433))

(assert (= (and b!470432 condMapEmpty!21358) mapIsEmpty!21358))

(assert (= (and b!470432 (not condMapEmpty!21358)) mapNonEmpty!21358))

(get-info :version)

(assert (= (and mapNonEmpty!21358 ((_ is ValueCellFull!6209) mapValue!21358)) b!470430))

(assert (= (and b!470432 ((_ is ValueCellFull!6209) mapDefault!21358)) b!470429))

(assert (= start!42130 b!470432))

(declare-fun m!452953 () Bool)

(assert (=> start!42130 m!452953))

(declare-fun m!452955 () Bool)

(assert (=> start!42130 m!452955))

(declare-fun m!452957 () Bool)

(assert (=> start!42130 m!452957))

(declare-fun m!452959 () Bool)

(assert (=> b!470428 m!452959))

(declare-fun m!452961 () Bool)

(assert (=> b!470434 m!452961))

(declare-fun m!452963 () Bool)

(assert (=> mapNonEmpty!21358 m!452963))

(declare-fun m!452965 () Bool)

(assert (=> b!470433 m!452965))

(declare-fun m!452967 () Bool)

(assert (=> b!470433 m!452967))

(declare-fun m!452969 () Bool)

(assert (=> b!470433 m!452969))

(check-sat (not b!470433) (not mapNonEmpty!21358) (not b!470434) (not start!42130) (not b!470428) b_and!20109 tp_is_empty!13105 (not b_next!11677))
(check-sat b_and!20109 (not b_next!11677))
